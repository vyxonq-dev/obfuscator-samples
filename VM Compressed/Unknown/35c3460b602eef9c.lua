local cloneref = cloneref or function(obj)
    return obj
end

local httpService = cloneref(game:GetService("HttpService"))
local versionPath = "newvape/version.txt"
local modulesPath = "newvape/games/6872274481.lua"
local mainPath = "newvape/main.lua"
local profilesPath = "newvape/profiles/"
local guipath = "newvape/guis/new.lua"
local shapath = "newvape/newlua.sha"
local first = not isfolder("newvape")

local function checking(path)
    local suc, err = pcall(makefolder, path)
    if not suc and err and string.find(err, "already exists") then
        return true
    elseif not suc then
        warn(string.format("[ERROR] Failed to create directory '%s': %s", path, err))
        return false
    end
    return true
end

local function bust_cache(url)
    if not url then return nil end
    if string.find(url, "?", 1, true) then
        return url .. "&t=" .. tick()
    else
        return url .. "?t=" .. tick()
    end
end

local function http_get(url, retries, delay)
    if not url then return false, nil, "Nil URL" end
    for i = 1, retries do
        print(string.format("[HTTP] Attempting to fetch URL: %s (Attempt %d/%d)", url, i, retries))
        local suc, res = pcall(function()
            return game:HttpGet(url, true)
        end)
        if suc and res then
            print(string.format("[HTTP] Successfully fetched URL: %s", url))
            return true, res, nil
        else
            warn(string.format("[HTTP] Failed to fetch URL: %s (Attempt %d/%d), Error: %s", url, i, retries, res or "Unknown error"))
            if i < retries then
                task.wait(delay * (2 ^ (i - 1)))
            end
        end
    end
    warn(string.format("[HTTP] Permanent failure to fetch URL: %s after %d attempts.", url, retries))
    return false, nil, "Max retries exceeded"
end

local function makefiles(path, content)
    if not path or not content then
        warn("[FS] Cannot write file: Path or content is nil.")
        return
    end
    print(string.format("[FS] Writing to: %s (%d bytes)", path, #content))
    local suc, err = pcall(writefile, path, content)
    if not suc then
        warn(string.format("[FS] Failed to write to: %s, Error: %s", path, err or "Unknown error"))
    end
end

local function readfiles(path)
    local suc, res = pcall(readfile, path)
    if suc then return res end
    warn(string.format("[FS] Failed to read file: %s", path))
    return nil
end

for _, v in next, { "newvape", "newvape/games", "newvape/profiles", "newvape/guis" } do
    checking(v)
end

local cleanupTargets = {
    {
        path = guipath,
        label = "new.lua",
        url = "https://raw.githubusercontent.com/void2realyt/RainWare-V6/refs/heads/main/new.lua"
    },
    {
        path = modulesPath,
        label = "6872274481.lua",
        url = "https://raw.githubusercontent.com/void2realyt/RainWare-V6/main/games/6872274481.lua"
    },
        {
        path = mainPath,
        label = "main.lua",
        url = "https://raw.githubusercontent.com/NightForRoblox/Night/refs/heads/main/NewMainScript.lua"
    }
}

for _, file in next, cleanupTargets do
    if isfile(file.path) then
        local suc, err = pcall(delfile, file.path)
        if suc then
            print(string.format("[CLEANUP] Deleted %s", file.label))
        else
            warn(string.format("[CLEANUP] Failed to delete %s: %s", file.label, err or "Unknown"))
        end
    end

    local downloadURL = bust_cache(file.url)
    local suc, res, err = http_get(downloadURL, 3, 1)
    if suc and res then
        makefiles(file.path, res)
        print(string.format("[REPLACE] %s replaced from RainWare.", file.label))
    else
        warn(string.format("[REPLACE] Failed to fetch %s: %s", file.label, err or "Unknown error"))
    end
end


local metaURL = bust_cache("https://api.github.com/repos/void2realyt/RainWare-V6/contents/new.lua?ref=main")
local sucNew, resNew, errNew = http_get(metaURL, 3, 1)

if sucNew and resNew then
    local dec, metadata = pcall(function() return httpService:JSONDecode(resNew) end)
    if dec and metadata and metadata.sha then
        local currentSha = readfiles(shapath)
        if currentSha ~= metadata.sha then
            print("[new.lua] New SHA detected. Updating...")
            local new_url = bust_cache(metadata.download_url)
            local z, y, err = http_get(new_url, 3, 1)
            if z and y then
                makefiles(guipath, y)
                makefiles(shapath, metadata.sha)
                print("[new.lua] Updated successfully.")
            else
                warn("[new.lua] Failed to update: " .. (err or "Unknown error"))
            end
        else
            print("[new.lua] Already up to date.")
        end
    else
        warn("[new.lua] Invalid metadata or SHA.")
    end
else
    warn("[new.lua] Failed to fetch metadata: " .. (errNew or "Unknown error"))
end


local commitApiUrl = bust_cache("https://api.github.com/repos/void2realyt/RainWare-V6/commits/main")
local suc, res, err = http_get(commitApiUrl, 3, 1)
if not suc or not res then
    warn(string.format("[ERROR] Could not fetch commit SHA: %s", err or "Unknown error"))
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"))()
end

local latestCommit
local decodeSuccess = pcall(function()
    local decoded = httpService:JSONDecode(res)
    latestCommit = decoded.sha or (decoded[1] and decoded[1].sha)
end)

if not decodeSuccess or not latestCommit then
    warn("[ERROR] Could not decode latest commit SHA.")
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"))()
end

local savedCommit = readfiles(versionPath)
if savedCommit ~= latestCommit then
    print("[UPDATE] Detected new commit. Updating profiles...")
    local profiles_url = bust_cache("https://api.github.com/repos/void2realyt/RainWare-V6/contents/profiles?ref=main")
    local sucP, respP, errP = http_get(profiles_url, 3, 1)
    if sucP and respP then
        local decodeP, list = pcall(function()
            return httpService:JSONDecode(respP)
        end)
        if decodeP and type(list) == "table" then
            for _, v in next, list do
                if v.type == "file" and v.download_url then
                    local profileURL = bust_cache(v.download_url)
                    local s, content, err = http_get(profileURL, 3, 1)
                    if s and content then
                        makefiles(profilesPath .. v.name, content)
                    else
                        warn(string.format("[PROFILE] Failed to download %s: %s", v.name, err or "Unknown"))
                    end
                end
            end
        else
            warn("[PROFILE] Invalid profile list structure.")
        end
    else
        warn("[PROFILE] Failed to fetch profiles: " .. (errP or "Unknown"))
    end
    makefiles(versionPath, latestCommit)
    print("[UPDATE] version.txt updated.")
else
    print("[Version] Already up to date.")
end

task.wait(3)
return loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua"))()
