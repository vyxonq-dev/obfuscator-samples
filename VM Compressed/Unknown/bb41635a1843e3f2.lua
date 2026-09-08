--skid if u want idc just dont forget about credits or smt
--Webhook
local WebhookScripterHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Universal/Webhook"))()

--Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Universal/Orion%20Hub%20Library"))()

--Startup Script Notification
OrionLib:MakeNotification({Name = "From Scripter",Content = "Script Is Loading (Can Take 1-5 Seconds)",Image = "rbxassetid://7734059095",Time = 1})

--If Slap Battles Then
if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 11520107397 or game.PlaceId == 124596094333302 or game.PlaceId == 7234087065 or game.PlaceId == 9020359053 or game.PlaceId == 9068206286 or game.PlaceId == 9426795465 or game.PlaceId == 9431156611 or game.PlaceId == 11359765900 or game.PlaceId == 11367956190 or game.PlaceId == 11828384869 or game.PlaceId == 12432152490 or game.PlaceId == 12712288037 or game.PlaceId == 12845859004 or game.PlaceId == 13833961666 or game.PlaceId == 15228348051 or game.PlaceId == 15507333474 or game.PlaceId == 16034567693 or game.PlaceId == 17290438723 or game.PlaceId == 18550498098 or game.PlaceId == 18698003301 or game.PlaceId == 74169485398268 or game.PlaceId == 89837553336708 or game.PlaceId == 102908326578005 or game.PlaceId == 103505724406848 or game.PlaceId == 14422118326 or game.PlaceId == 92516899071319 or game.PlaceId == 115782629143468 or game.PlaceId == 95706409702231 or game.PlaceId == 118650724506449 or game.PlaceId == 97220865182663 or game.PlaceId == 98726100529621 or game.PlaceId == 136005148166028 or game.PlaceId == 117232463555132 or game.PlaceId == 129665246576996 or game.PlaceId == 132277598079047 or game.PlaceId == 136690395520488 or game.PlaceId == 86045914443715 or game.PlaceId == 75803343514634 or game.PlaceId == 80420091630966 or game.PlaceId == 98871361390239 or game.PlaceId == 90553746175288 or game.PlaceId == 106620300132058 or game.PlaceId == 94481828238038 or game.PlaceId == 122901288403496 then

local Window = OrionLib:MakeWindow({Name = "Launcher Hub (Scripter Hub)",HidePremium = true,IntroEnabled = true,IntroText = "Slap Battles - Launcher Hub",IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

OrionLib:MakeNotification({Name = "From Scripter",Content = "GoodLuck!",Image = "rbxassetid://7734059095",Time = 3})

Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7734059095",
    PremiumOnly = false
})

-- Dropdown Menu
local VersionChoosed = "10.0.0" -- Default fallback
Tab:AddDropdown({
    Name = "Choose Version",
    Default = "10.0.0",
    Options = {
        "1.0.0 (Oldest)", "1.5.4 (Soon)", "1.8.6 (Soon)", "1.9.5 (Soon)", "2.6.5 (Soon)", "3.0.0 (Soon)", "3.0.4 (Soon)",
        "3.6.5 (Soon)", "3.6.9 (Soon)", "3.9.1 (Soon)", "3.9.5 (Soon)", "5.1.7 (Soon)", "8.5.0 (Soon)",
        "8.5.7 (Soon)", "8.8.8 (Soon)", "9.0.5 (Soon)", "9.6.5 (Soon)", "10.0.0 (Latest)"
    },
    Callback = function(Value)
        -- Extract just the version number from the dropdown text
        VersionChoosed = string.match(Value, "^(%d+%.%d+%.%d+)") or Value
    end
})

local LanguageChoosed = "SOON" -- Default fallback
Tab:AddDropdown({
    Name = "Choose Language",
    Default = "SOON",
    Options = {
        "SOON"
    },
    Callback = function(Value)
        LanguageChoosed = Value
    end
})

Tab:AddButton({
    Name = "Run Script",
    Callback = function()
        -- Create a table of version URLs
        local versionScripts = {
            ["1.0.0"] = "https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/SB%20Hub%20OP%20Versions/V.%201.0.0%20(Oldest)",
            ["1.5.4"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version1.5.4.lua",
            ["1.8.6"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version1.8.6.lua",
            ["1.9.5"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version1.9.5.lua",
            ["2.6.5"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version2.6.5.lua",
            ["3.0.0"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version3.0.0.lua",
            ["3.0.4"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version3.0.4.lua",
            ["3.6.5"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version3.6.5.lua",
            ["3.6.9"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version3.6.9.lua",
            ["3.9.1"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version3.9.1.lua",
            ["3.9.5"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version3.9.5.lua",
            ["5.1.7"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version5.1.7.lua",
            ["8.5.0"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version8.5.0.lua",
            ["8.5.7"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version8.5.7.lua",
            ["8.8.8"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version8.8.8.lua",
            ["9.0.5"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version9.0.5.lua",
            ["9.6.5"] = "https://raw.githubusercontent.com/yourusername/yourrepo/main/version9.6.5.lua",
            ["10.0.0"] = "https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/SB%20Hub%20OP%20Versions/V.%2010.0.0%20(Latest)"
        }
        
        -- Check if the selected version exists in the table
        if versionScripts[VersionChoosed] then
            -- Execute the script for the selected version
            local success, errorMessage = pcall(function()
                local scriptContent = game:HttpGet(versionScripts[VersionChoosed], true)
                loadstring(scriptContent)()
            end)
            
            if success then
                OrionLib:MakeNotification({
                    Name = "Success",
                    Content = "Executing script for version: " .. VersionChoosed,
                    Image = "rbxassetid://4483345998",
                    Time = 3
                })
            else
                OrionLib:MakeNotification({
                    Name = "Execution Error",
                    Content = "Failed to execute script: " .. tostring(errorMessage),
                    Image = "rbxassetid://7743878857",
                    Time = 5
                })
            end
        else
            OrionLib:MakeNotification({
                Name = "Error", 
                Content = "Script URL not found for version: " .. VersionChoosed,
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- SETTINGS
Tab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Destroy Script"
})

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end
OrionLib:Init()
