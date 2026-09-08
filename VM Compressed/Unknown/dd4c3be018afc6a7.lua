local Player = game.Players.LocalPlayer
local Heavenly = loadstring(game:HttpGet("https://raw.githubusercontent.com/HeavenlyScripts/HeavenlyScripts.github.io/refs/heads/main/Heavenly.lua"))()
function CreateNotification()
    
    KeyWindow = Heavenly:Window({
        Name = "SCRIPT OUTDATED",
        Theme = "Dark",
        SaveConfig = true,
        Startup = false,
        CloseCallback = function() print("Outdated script closed") end,
        ShowDisplayName = false,
        ShowUsername = false
    })

    Heavenly:Notify({
        Name = "Weclome " .. Player.Name,
        Content = "Welcome " .. Player.Name .. "!",
        Image = "rbxassetid://4483345998",
        Time = 5
    })

    local Tab = KeyWindow:Tab({
        Name = "Script Outdated Join Our discord for updates",
        Icon = "rbxassetid://4483345998"
    })

    Tab:Paragraph({
        Name = "Script Outdated",
        Content = "This script is outdated, please join our discord for updates! https://discord.gg/PewxPHP5P3",
        Image = "rbxassetid://4483345998"
    })
    setclipboard("https://discord.gg/PewxPHP5P3")

    Tab:Button({
        Name = "📋 Copy Discord",
        Callback = function()
            setclipboard("https://discord.gg/PewxPHP5P3")
            Heavenly:Notify({
                Name = "Discord Link",
                Content = "Discord link copied!",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        end
    })

    Heavenly:Init()
end
CreateNotification()
