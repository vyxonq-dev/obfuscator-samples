local HttpService = game:GetService("HttpService")

local CONFIG = {
    ROOT = "Haze",
    REPO_URL = "https://raw.githubusercontent.com/7Smoker/Haze/main/",
    FILES = "https://raw.githubusercontent.com/7Smoker/Haze/main/assets/Default.json"
}

local function httpGet(url)
    local ok, res = pcall(game.HttpGet, game, url)
    return ok and res or nil
end

local function ensureFolder(path)
    if not isfolder(path) then
        makefolder(path)
    end
end

local function read(path)
    return isfile(path) and readfile(path) or nil
end

local function write(path, content)
    writefile(path, content)
end

local Notifications = loadstring(
    game:HttpGet("https://raw.githubusercontent.com/7Smoker/Haze/main/libraries/Notifications.lua")
)()

local function flattenFiles(tbl, prefix)
    local files = {}
    prefix = prefix or ""

    for k, v in pairs(tbl) do
        if type(v) == "table" then
            if k == "root" then
                local subFiles = flattenFiles(v, "")
                for _, f in ipairs(subFiles) do
                    table.insert(files, f)
                end
            else
                local subPrefix = (prefix ~= "" and prefix .. "/" or "") .. k
                local subFiles = flattenFiles(v, subPrefix)
                for _, f in ipairs(subFiles) do
                    table.insert(files, f)
                end
            end
        elseif type(v) == "string" then
            local fullPath = (prefix ~= "" and prefix .. "/" or "") .. v
            table.insert(files, fullPath)
        end
    end

    return files
end

local function InstallFiles()
    local url = CONFIG.FILES
    if not url:match("^https?://") then
        url = CONFIG.REPO_URL .. url
    end

    local json = httpGet(url)
    if not json then
            Notifications:Notify("Warning", "Failed to download files list. Report this to the devs", 4)
        return {}
    end

    local success, data = pcall(function()
        return HttpService:JSONDecode(json)
    end)

    if not success or type(data) ~= "table" then
            Notifications:Notify("Warning", "Invalid files in the JSON. Report this to the devs", 4)
        return {}
    end

    return flattenFiles(data)
end

local function syncFile(FilePath)
    local url = CONFIG.REPO_URL .. FilePath
    local content = httpGet(url)

    if not content then
            Notifications:Notify("Warning", "Failed to download: " .. FilePath, 4)
        return
    end

    local LocalPath = CONFIG.ROOT .. "/" .. FilePath
    local folder = LocalPath:match("(.+)/[^/]+$")

    if folder then
        ensureFolder(folder)
    end

    local existing = read(LocalPath)
    if not existing then
        write(LocalPath, content)
        if Notifications then
            Notifications:Notify("Success", "Installed: " .. FilePath, 4)
        else
            print("[Haze] Installed:", FilePath)
        end
    elseif existing ~= content then
        write(LocalPath, content)
        if Notifications then
            Notifications:Notify("Success", "Updated: " .. FilePath, 4)
        else
            print("[Haze] Updated:", FilePath)
        end
    end
end

ensureFolder(CONFIG.ROOT)

local installFiles = InstallFiles()

for _, file in ipairs(installFiles) do
    syncFile(file)
end

local LoaderPath = CONFIG.ROOT .. "/loader.lua"
if isfile(LoaderPath) then
    local fn = loadfile(LoaderPath)
    if fn then
        pcall(fn)
    else
        if Notifications then
            Notifications:Notify("Warning", "Failed to run loader.lua", 5)
        else
            warn("[Haze] Failed to run loader.lua")
        end
    end
else
    if Notifications then
        Notifications:Notify("Warning", "loader.lua missing", 5)
    else
        warn("[Haze] loader.lua missing")
    end
end