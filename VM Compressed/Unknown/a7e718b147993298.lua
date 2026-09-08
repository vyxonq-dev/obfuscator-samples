local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local GameName = ""

local GameIds = {
    [6137321701] = "Blair (Lobby)",
    [6348640020] = "Blair",
    [18199615050] = "Demonology [Lobby]",
    [18794863104] = "Demonology [Game]",
    [8260276694] = "Ability Wars",
    [126884695634066] = "Grow A Garden [BETA]",
    [14518422161] = "Gunfight Arena [BETA]",
    [8267733039] = "Specter [Lobby]",
    [8417221956] = "Specter [GAME]",
    [79546208627805] = "99 Night in the forest [LOBBY]",
    [126509999114328] = "99 Night in the forest [GAME]",
    [111989938562194] = "Brainrot Evolution",
    [137925884276740] = "Build A Plane",
    [121864768012064] = "Fish It",
    [75366259315586] = "Build A Base",
    [127742093697776] = "Plants VS Brainrot",
    [9285238704] = "Race Clicker",
    [118915549367482] = "Don't Wake Up The Brainrot",
    [71360925634781] = "My Brainrot Egg Farm",
    [90462358603255] = "Anime Enternal",
    [122826953758426] = "Raise A Animals",
    [121864768012064] = "Fish It",
    [123557829667240] = "Chop your tree",
}

GameName = GameIds[game.PlaceId] or "Universal"

local KeyModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/Chavels123/Newloader/refs/heads/main/KeymodulesBeta.lua"))()

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

print("Key system initialized!")

local function checkSavedKey()
    local success, keyData = pcall(function()
        if isfile("KeyText.txt") then
            return readfile("KeyText.txt")
        end
        return nil
    end)
    
    if success and keyData then
        return keyData
    else
        return nil
    end
end

local function saveKeyToFile(key)
    local success, err = pcall(function()
        writefile("KeyText.txt", key)
    end)
    
    if not success then
        warn("Failed to save key: " .. tostring(err))
    end
end

local function delkey()
    if isfile("KeyText.txt") then
        pcall(function()
            delfile("KeyText.txt")
        end)
    end
end

local Window = Rayfield:CreateWindow({
    Name = "PulseHub - " .. GameName,
    Icon = 0,
    LoadingTitle = "PulseHub Keysystem",
    LoadingSubtitle = "by PulseHub Team",
    Theme = "Default",
    
    ToggleUIKeybind = "K",
    
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "PulseHub",
        FileName = "PulseHub_Config"
    },
    
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    
    KeySystem = false,
    KeySettings = {
        Title = "PulseHub Key System",
        Subtitle = "Enter your key to continue",
        Note = "Get your key from the link provided",
        FileName = "PulseHub_Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {""}
    }
})

local KeySystemTab = Window:CreateTab("Key System", "key")
local InfoTab = Window:CreateTab("Info", "info")

local keyInputValue = ""
local isKeyValid = false

local isManualLoadGame = (game.PlaceId == 6137321701) or (game.PlaceId == 6348640020) or (game.PlaceId == 111989938562194) or (game.PlaceId == 126509999114328) or (game.PlaceId == 79546208627805)
if isManualLoadGame then
    local VersionSection = KeySystemTab:CreateSection("Version")
    local VersionIdsByPlaceId = {
        [6137321701] = { Stable = "fa4e49b11535d5a034b51e9bfd716abf", Beta = "b79c79c96e9c304d48008efe659813bd" },
        [6348640020] = { Stable = "fa4e49b11535d5a034b51e9bfd716abf", Beta = "b79c79c96e9c304d48008efe659813bd" },
        [111989938562194] = { Stable = "2653400a353d057c2bb96eb410da97a9", Beta = "7718627eedfb9ceab9f44e63401010e4" },
        [126509999114328] = { Stable = "0bc73c28f738300dbd3d4b99e5daf4f3", Beta = "e3e0c2382cb62a436040f422e0d7d428" },
        [79546208627805] = { Stable = "0bc73c28f738300dbd3d4b99e5daf4f3", Beta = "e3e0c2382cb62a436040f422e0d7d428" },
    }
    local VersionDropdown = KeySystemTab:CreateDropdown({
        Name = "Select Version",
        Options = {"Stable Version","BETA Version"},
        CurrentOption = {"Stable Version"},
        MultipleOptions = false,
        Flag = "PulseHub_Version",
        Callback = function(Options)
            local selection = Options and Options[1]
            local versions = VersionIdsByPlaceId[game.PlaceId]
            if selection == "Stable Version" then
                if versions and versions.Stable then
                    KeyModule.ScriptID = versions.Stable
                    pcall(function() KeyModule._api = nil end)
                end
                Rayfield:Notify({
                    Title = "Version",
                    Content = "Stable version selected",
                    Duration = 3,
                    Image = "check-circle",
                })
            elseif selection == "BETA Version" then
                if versions and versions.Beta then
                    KeyModule.ScriptID = versions.Beta
                    pcall(function() KeyModule._api = nil end)
                end
                Rayfield:Notify({
                    Title = "Version",
                    Content = "BETA version selected",
                    Duration = 3,
                    Image = "check-circle",
                })
            end
        end,
    })

    local LoadButton = KeySystemTab:CreateButton({
        Name = "Load Selected Version",
        Callback = function()
            if not isKeyValid then
                Rayfield:Notify({
                    Title = "Action Required",
                    Content = "Validate your key first",
                    Duration = 3,
                    Image = "alert-circle",
                })
                return
            end
            local ok = pcall(function()
                getgenv().script_key = keyInputValue
                local scriptId = KeyModule.ScriptID
                local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
                api.script_id = scriptId
                api.load_script()
            end)
            if ok then
                Rayfield:Destroy()
            else
                Rayfield:Notify({
                    Title = "Load Failed",
                    Content = "Unable to load the selected version",
                    Duration = 4,
                    Image = "x-circle",
                })
            end
        end,
    })
end

local KeySection = KeySystemTab:CreateSection("Key Validation")

local KeyInput = KeySystemTab:CreateInput({
    Name = "Enter Key",
    CurrentValue = "",
    PlaceholderText = "Enter your key here...",
    RemoveTextAfterFocusLost = false,
    Flag = "KeyInput",
    Callback = function(Text)
        keyInputValue = Text
    end,
})

local ValidateButton = KeySystemTab:CreateButton({
    Name = "Validate Key",
    Callback = function()
        if not keyInputValue or keyInputValue == "" then
            Rayfield:Notify({
                Title = "Error",
                Content = "Please enter a key first!",
                Duration = 3,
                Image = "alert-circle",
            })
            return
        end
        
        Rayfield:Notify({
            Title = "Validating",
            Content = "Checking your key...",
            Duration = 2,
            Image = "clock",
        })
        
        KeyModule.MainWindow = Window
        KeyModule.Notify = function(notifyData)
            if notifyData.Title == "Success" then
                isKeyValid = true
                Rayfield:Notify({
                    Title = "Success",
                    Content = notifyData.Content,
                    Duration = 5,
                    Image = "check-circle",
                })
                
                saveKeyToFile(keyInputValue)
                
                if not isManualLoadGame then
                    task.wait(2)
                    print("Loading script directly...")
                    getgenv().script_key = keyInputValue
                    local scriptId = KeyModule.ScriptID
                    pcall(function()
                        local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
                        api.script_id = scriptId
                        print("Using script ID:", scriptId)
                        print("Using key:", string.sub(keyInputValue, 1, 5) .. "...")
                        api.load_script()
                        print("Script loaded successfully!")
                    end)
                    task.wait(2)
                    Rayfield:Destroy()
                else
                    Rayfield:Notify({
                        Title = "Ready",
                        Content = "Key validated. Choose a version and press Load",
                        Duration = 5,
                        Image = "info",
                    })
                end
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = notifyData.Content,
                    Duration = 5,
                    Image = "x-circle",
                })
            end
        end
        
        KeyModule.CheckKey(keyInputValue)
    end,
})

KeySystemTab:CreateDivider()

local GetKeySection = KeySystemTab:CreateSection("Get Key Options")

local GetKeyLinkvertiseButton = KeySystemTab:CreateButton({
    Name = "Get Key (Linkvertise)",
    Callback = function()
        Rayfield:Notify({
            Title = "Generating Link",
            Content = "Creating key link via Linkvertise...",
            Duration = 2,
            Image = "link",
        })
        
        task.wait(0.5)
        
        local keyLink = "https://ads.luarmor.net/get_key?for=Pulse_Hub_Checkpoint-TxLYDUUMfNao"
        setclipboard(keyLink)
        
        Rayfield:Notify({
            Title = "Linkvertise Link Copied",
            Content = "Linkvertise key link has been copied to your clipboard!",
            Duration = 5,
            Image = "clipboard",
        })
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "PulseHub - Linkvertise",
            Text = "Linkvertise key link has been copied to your clipboard!",
            Duration = 5
        })
    end,
})

local GetKeyLootlabsButton = KeySystemTab:CreateButton({
    Name = "Get Key (Wat)",
    Callback = function()
        local playerName = Players.LocalPlayer.DisplayName or Players.LocalPlayer.Name
        
        Rayfield:Notify({
            Title = "Lootlabs Unavailable",
            Content = "Hello " .. playerName .. "! Thanks for selecting Wat, but it's currently unavailable. We'll be implementing Wat support soon! Thanks for your patience.",
            Duration = 8,
            Image = "construction",
        })
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "PulseHub - Wat",
            Text = "Hello " .. playerName .. "! Wat is coming soon. Please use Linkvertise for now.",
            Duration = 6
        })
    end,
})

local StatusSection = KeySystemTab:CreateSection("Status")

local StatusLabel = KeySystemTab:CreateLabel("Status: Ready", "activity")

local GameInfoSection = KeySystemTab:CreateSection("Game Information")

local GameLabel = KeySystemTab:CreateLabel("Detected Game: " .. GameName, "gamepad-2")

local InfoSection = InfoTab:CreateSection("Information")

local MaintenanceLabel = InfoTab:CreateLabel("Under Maintenance", "wrench")

local MaintenanceParagraph = InfoTab:CreateParagraph({
    Title = "Maintenance Notice",
    Content = "This section is currently under maintenance. Please check back later for updates and information about PulseHub."
})

local savedKey = checkSavedKey()
if savedKey then
    KeyInput:Set(savedKey)
    keyInputValue = savedKey
    StatusLabel:Set("Status: Validating saved key...", "clock")
    
    Rayfield:Notify({
        Title = "Saved Key Found",
        Content = "Validating saved key automatically...",
        Duration = 3,
        Image = "key",
    })
    
    KeyModule.MainWindow = Window
    KeyModule.Notify = function(notifyData)
        if notifyData.Title == "Success" then
            StatusLabel:Set("Status: Saved key validated successfully!", "check-circle")
            Rayfield:Notify({
                Title = "Success",
                Content = "Saved key is valid! " .. notifyData.Content,
                Duration = 5,
                Image = "check-circle",
            })
            if not isManualLoadGame then
                task.wait(2.5)
                Rayfield:Destroy()
                task.wait(2)
                print("Loading script directly...")
                getgenv().script_key = savedKey
                local scriptId = KeyModule.ScriptID
                pcall(function()
                    local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
                    api.script_id = scriptId
                    print("Using script ID:", scriptId)
                    print("Using key:", string.sub(savedKey, 1, 5) .. "...")
                    api.load_script()
                    print("Script loaded successfully!")
                end)
            else
                isKeyValid = true
                StatusLabel:Set("Status: Key validated. Choose version and press Load.", "info")
                Rayfield:Notify({
                    Title = "Ready",
                    Content = "Key validated. Choose a version and press Load",
                    Duration = 5,
                    Image = "info",
                })
            end
        else
            delkey()
            KeyInput:Set("")
            keyInputValue = ""
            StatusLabel:Set("Status: Saved key invalid - deleted. Please enter a new key.", "x-circle")
            Rayfield:Notify({
                Title = "Invalid Key",
                Content = "Saved key was invalid and has been deleted. Please enter a new key.",
                Duration = 5,
                Image = "x-circle",
            })
        end
    end
    
    KeyModule.CheckKey(savedKey)
end

local KeySystem = {
    ValidateKey = function(key)
        keyInputValue = key
        if KeyModule.CheckKey then
            return KeyModule.CheckKey(key)
        end
        return false
    end,
    Close = function()
        Rayfield:Destroy()
    end,
    Window = Window,
    KeyModule = KeyModule
}

return KeySystem
