--[[
    TO ANYONE READING THIS!!

    You CANNOT bypass the key loading.
    This just adds a UI for entering keys.
    Nice try though!
--]]

getgenv().WebSocket = nil
getgenv().Websocket = nil

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "d62d61bd8071dbf2130e1f429d9bf8ab"

local function checkKey(inputKey)
    inputKey = inputKey:gsub("%s+", "")
    if #inputKey ~= 32 then return false end
    local status = api.check_key(inputKey)
    if (status.code == "KEY_VALID") then
        if isfolder and not isfolder("FireScripts") then pcall(function() makefolder("FireScripts") end) end
        writefile("FireScripts/Key.txt", inputKey)
        script_key = inputKey
        getgenv().script_key = inputKey
        return true, inputKey
    elseif (status.code == "KEY_HWID_LOCKED") then
        Fluent:Notify({
            Title = "Key locked to other HWID",
            Content = "Get a new key or something",
            Duration = 10
        })
        return false
    elseif (status.code == "KEY_INCORRECT") then
        Fluent:Notify({
            Title = "Key is incorrect or expired",
            Content = "Get a new key or something",
            Duration = 10
        })
        return false
    elseif (status.code == "SCRIPT_ID_INVALID") then
        Fluent:Notify({
            Title = "Script ID is invalid",
            Content = "Please join the Discord server for support.",
            Duration = 10
        })
        return false
    else
        Fluent:Notify({
            Title = "Key check failed: " .. tostring(status.code),
            Content = "Try getting a new key if it isn't about it",
            Duration = 10
        })
        return false
    end
end

local ret, validKey = false, nil
if isfolder and isfolder("FireScripts") and isfile("FireScripts/Key.txt") then
    local key = readfile("FireScripts/Key.txt")
    ret, validKey = #key == 32 and checkKey(key) or false, key
    if not ret then validKey = nil end
end

if not ret and type(script_key) == 'string' and #script_key == 32 then
    ret, validKey = checkKey(script_key)
    if not ret then validKey = nil end
end

if not ret then
    local KeyWindow = Fluent:CreateWindow{
        Title = "Fire Scripts | Grow A Garden - Key System",
        SubTitle = "discord.gg/ry9e3kSb3A",
        TabWidth = 160,
        Size = UDim2.fromOffset(500, 260),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    }
    local TabsKey = {
        Main = KeyWindow:AddTab({ Title = "Key", Icon = "" }),
        Discord = KeyWindow:AddTab({ Title = "Discord", Icon = "" })
    }
    TabsKey.Main:AddParagraph({
        Title = "Key System",
        Content = "Click below to get your key.\nIf you have issues, join our Discord and create a ticket."
    })
    TabsKey.Main:AddButton({
        Title = "Copy Key Link",
        Description = "Copies the get key link to your clipboard",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Fire_Scripts__GAG__Key-pJsWJQnxkCLZ")
            Fluent:Notify({
                Title = "Copied!",
                Content = "Key link copied to clipboard.",
                Duration = 4
            })
        end
    })
    KeyWindow:SelectTab(1)
    TabsKey.Main:AddInput("Input", {
        Title = "Insert Key Here",
        Default = "",
        Placeholder = "Paste your key here",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
            local valid, enteredKey = checkKey(Value)
            if valid == true then
                KeyWindow:Destroy()
                ret = true
                validKey = enteredKey
            end
        end
    })
    TabsKey.Discord:AddParagraph({
        Title = "Discord",
        Content = "Join our Discord server for support and updates."
    })
    TabsKey.Discord:AddButton({
        Title = "Copy Link",
        Description = "Click to join our Discord server",
        Callback = function()
            setclipboard("https://discord.gg/ry9e3kSb3A")
            Fluent:Notify({
                Title = "Discord Link Copied!",
                Content = "Join our Discord server for support and updates.",
                Duration = 4
            })
        end
    })
    repeat task.wait(0.5) until ret == true and validKey ~= nil
end

if validKey and #validKey == 32 then
    script_key = validKey
    Fluent:Notify({
        Title = "Key Validated",
        Content = "Your key has been successfully validated.",
        Duration = 5
    })
    Fluent:Notify({
        Title = "Loading GAG Script",
        Content = "Check console by F9 if script doesn't load. If stuck at 95%, re-execute.",
        Duration = 5
    })
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d62d61bd8071dbf2130e1f429d9bf8ab.lua"))()
end