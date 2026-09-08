-- credits to luckyware from luarmor for the loader :)
repeat task.wait() until game:IsLoaded()



local Hub = "Strive Hub"
local Hub_Script_ID = "13fbfb8ad5363ed9bfbfdb557177c7f1"
local Discord_Invite = "bgzarKxdEK"
local UI_Theme = "Dark"

local workink_enabled = true
local workink_link = "https://ads.luarmor.net/v/cb/kJejUxnJZoDY/OuPhPjdhiUAweAuw"



makefolder(Hub)
local key_path = Hub .. "/Key.txt"
script_key = script_key or isfile(key_path) and readfile(key_path) or nil

local UI = loadstring(game:HttpGet("http://raw.githubusercontent.com/danishramesh/luna-ui/refs/heads/main/ui.lua"))()
local API = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()

API.script_id = Hub_Script_ID -- always use your main script ID

local Cloneref = cloneref or function(instance) return instance end
local Players = Cloneref(game:GetService("Players"))
local HttpService = Cloneref(game:GetService("HttpService"))
local AssetService = Cloneref(game:GetService("AssetService"))
local Request = http_request or request or syn.request or http

local Window
local KeyInput = ""

local function notify(title, content, duration)
    UI:Notification({ Title = title, Content = content, Duration = duration or 8 })
end

local function checkKey(input_key)
    local status = API.check_key(input_key or script_key)
    if status.code == "KEY_VALID" then
        script_key = input_key or script_key
        writefile(key_path, script_key)
        UI:Destroy()
        API.load_script()
    elseif status.code:find("KEY_") then
        local messages = {
            KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
            KEY_INCORRECT = "Key is incorrect",
            KEY_INVALID = "Key is invalid",
        }
        notify("Key Check Failed", messages[status.code] or "Unknown error")
    else
        Players.LocalPlayer:Kick("Key check failed: " .. status.message .. " Code: " .. status.code)
    end
end

if script_key then
    checkKey()
end

Window = UI:CreateWindow({
    Title = "Strive",
    Subtitle = "License System",
    Theme = UI_Theme,
    LoadingTitle = "Strive",
    LoadingSubtitle = "Fisch",
    Icon = "key",
    Keybind = Enum.KeyCode.End
})

local MainTab = Window:CreateTab({
    Title = "Key",
    Icon = "lock"
})

MainTab:CreateSection("Authentication")

MainTab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Example: agKhRikQP..",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        KeyInput = Text
    end
})

if workink_enabled then
    MainTab:CreateButton({
        Name = "Get Key",
        Callback = function()
            setclipboard(workink_link)
            notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
        end
    })
end

MainTab:CreateButton({
    Name = "Check Key",
    Callback = function()
        checkKey(KeyInput ~= "" and KeyInput or script_key)
    end
})

MainTab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/" .. Discord_Invite)
        notify("Copied To Clipboard", "Discord Server Link has been copied to your clipboard", 16)
        Request({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["origin"] = "https://discord.com"
            },
            Body = HttpService:JSONEncode({
                args = { code = Discord_Invite },
                cmd = "INVITE_BROWSER",
                nonce = "."
            }),
        })
    end
})

UI:Notification({
    Title = "Strive",
    Content = "Successfully loaded!",
    Duration = 3
})
