if not game:IsLoaded() then
   game.Loaded:Wait()
end

task.wait(2)

local Hub = "Hina Hub"
local Discord_Invite = "NZHwScVxv3"
local Linkvertise_Link = "https://ads.luarmor.net/get_key?for=Hina_Hub-PQmcKkkVQYbm"

-- Script configurations per game
local Scripts = {
    [76285745979410] = {
        name = "Anime Card Collection",
        script_id = "9efd7aeb253b0c53236b2a1f600e7124",
        description = ""
    },
    [130247632398296] = {
        name = "Anime Fighting Simulator Endless",
        script_id = "a8ab07c9581584c7d03ec6b1f46cc219",
        description = ""
    },
    [136599248168660] = {
        name = "Solo Hunter",
        script_id = "c4f01bee2a28f2293728ededb080705c",
        description = ""
    },
    -- placement thing
    -- [110829983956014] = {
    --     name = "ACC",
    --     script_id = "faec2e5ab410523753d5ba96ef3362ed",
    --     description = "Anime CARD CLASH"
    -- },
}

-- Check if game is supported
local currentGame = Scripts[game.PlaceId]

if not currentGame then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Hina Hub",
        Text = "This game is not supported!",
        Duration = 5
    })
    return
end

makefolder(Hub)
local key_path = Hub .. "/" .. currentGame.name .. "_Key.txt"
local saved_key = isfile(key_path) and readfile(key_path) or ""

local API = loadstring(game:HttpGet(
    "https://sdkAPI-public.luarmor.net/library.lua"
))()
API.script_id = currentGame.script_id

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Request = http_request or request or syn.request or http

local function safeDeleteFile(path)
    local success = pcall(function()
        if delfile then
            delfile(path)
        elseif deletefile then
            deletefile(path)
        elseif writefile then
            writefile(path, "")
        end
    end)
    return success
end

if script_key and script_key ~= "" then
    local premiumStatus = API.check_key(script_key)
    if premiumStatus.code == "KEY_VALID" then
        writefile(key_path, script_key)
        API.load_script()
        return
    end
end

if saved_key ~= "" then
    script_key = saved_key
    local tempStatus = API.check_key(saved_key)
    if tempStatus.code == "KEY_VALID" then
        API.load_script()
        return
    else
        safeDeleteFile(key_path)
        saved_key = ""
        script_key = nil
    end
end

local UI = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

local function notify(title, content, duration)
    UI:Notify({
        Title = title,
        Content = content,
        Duration = duration or 8
    })
end

local function checkKey(input_key)
    local status = API.check_key(input_key)

    if status.code == "KEY_VALID" then
        script_key = input_key
        writefile(key_path, input_key)
        notify("Success", "Key valid! Loading script...", 3)
        task.wait(1)
        UI:Destroy()
        API.load_script()
        return true

    elseif status.code == "KEY_HWID_LOCKED" then
        notify("Error", "Key locked to another device!", 5)
        return false

    elseif status.code == "KEY_INCORRECT" then
        notify("Error", "Incorrect key!", 5)
        return false

    elseif status.code == "KEY_INVALID" then
        notify("Error", "Invalid or expired key!", 5)
        return false

    else
        notify("Error", status.message or "Unknown error", 5)
        return false
    end
end

-- UI Window
local Window = UI:CreateWindow({
    Title = Hub,
    SubTitle = currentGame.name .. " | " .. currentGame.description,
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 350),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

local Tab = Window:AddTab({ Title = "Key", Icon = "" })

local Input = Tab:AddInput("KeyInput", {
    Title = "Enter Key",
    Default = "",
    Placeholder = "Paste your key here",
    Numeric = false,
    Finished = false
})

Tab:AddButton({
    Title = "Check Key",
    Callback = function()
        if Input.Value == "" then
            notify("Error", "Please enter a key!", 3)
            return
        end
        notify("Checking", "Validating key...", 2)
        checkKey(Input.Value)
    end
})

Tab:AddButton({
    Title = "Get Key (Linkvertise)",
    Callback = function()
        setclipboard(Linkvertise_Link)
        notify("Copied", "Key link copied to clipboard!", 5)
    end
})

Tab:AddButton({
    Title = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/" .. Discord_Invite)
        
        pcall(function()
            Request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["origin"] = "https://discord.com"
                },
                Body = HttpService:JSONEncode({
                    cmd = "INVITE_BROWSER",
                    args = { code = Discord_Invite },
                    nonce = "."
                })
            })
        end)
        
        notify("Copied", "Discord link copied!", 5)
    end
})

-- Info Tab
local InfoTab = Window:AddTab({ Title = "Info", Icon = "" })

InfoTab:AddParagraph({
    Title = "Supported Games",
    Content = (function()
        local list = ""
        for placeId, data in pairs(Scripts) do
            list = list .. data.name .. " - " .. data.description .. "\n"
        end
        return list
    end)()
})

InfoTab:AddParagraph({
    Title = "Credits",
    Content = "Hina Hub\nDiscord: discord.gg/" .. Discord_Invite
})

Window:SelectTab(1)
notify(Hub, "Loading " .. currentGame.name, 5)
