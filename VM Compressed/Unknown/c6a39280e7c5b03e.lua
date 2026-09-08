local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "monkehub version 3.1",
    LoadingTitle = "monkehub",
    LoadingSubtitle = "by patchu031",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = monke, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "MonkeHub",
       Subtitle = "Key System",
       Note = "https://discord.gg/FBsj6y6U",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"MonkeHub"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

local Tab = Window:CreateTab("Main", 4483362458)

Tab:CreateButton({
    Name = "the storage script 1",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/thestorage.lua"))()
    end,
})
Tab:CreateButton({
    Name = "aimbot from temu",
    Callback = function()
        -- join discord bruh https://discord.gg/TdjXTrZF

--// Cache

local loadstring, game, getgenv, setclipboard = loadstring, game, getgenv, setclipboard

--// Loaded check

if getgenv().Aimbot then return end

--// Load Aimbot V2 (Raw)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Raw%20Main.lua"))()

--// Variables

local Aimbot = getgenv().Aimbot
local Settings, FOVSettings, Functions = Aimbot.Settings, Aimbot.FOVSettings, Aimbot.Functions

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)() -- Pepsi's UI Library

local Parts = {"Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}

--// Frame

Library.UnloadCallback = Functions.Exit

local MainFrame = Library:CreateWindow({
	Name = "Aimbot V2",
	Themeable = {
		Image = "7059346386",
		Info = "Made by Exunys\nPowered by Pepsi's UI Library",
		Credit = false
	},
	Background = "",
	Theme = [[{"__Designer.Colors.section":"ADC7FF","__Designer.Colors.topGradient":"1B242F","__Designer.Settings.ShowHideKey":"Enum.KeyCode.RShift","__Designer.Colors.otherElementText":"54637D","__Designer.Colors.hoveredOptionBottom":"38667D","__Designer.Background.ImageAssetID":"","__Designer.Colors.unhoveredOptionTop":"407495","__Designer.Colors.innerBorder":"2C4168","__Designer.Colors.unselectedOption":"4E6EA0","__Designer.Background.UseBackgroundImage":true,"__Designer.Files.WorkspaceFile":"Aimbot V2","__Designer.Colors.main":"23A0FF","__Designer.Colors.outerBorder":"162943","__Designer.Background.ImageColor":"FFFFFF","__Designer.Colors.tabText":"C9DFF1","__Designer.Colors.elementBorder":"111D26","__Designer.Colors.sectionBackground":"0E141C","__Designer.Colors.selectedOption":"558AC2","__Designer.Colors.background":"11182A","__Designer.Colors.bottomGradient":"202B42","__Designer.Background.ImageTransparency":95,"__Designer.Colors.hoveredOptionTop":"4885A0","__Designer.Colors.elementText":"7692B8","__Designer.Colors.unhoveredOptionBottom":"5471C4"}]]
})

--// Tabs

local SettingsTab = MainFrame:CreateTab({
	Name = "Settings"
})

local FOVSettingsTab = MainFrame:CreateTab({
	Name = "FOV Settings"
})

local FunctionsTab = MainFrame:CreateTab({
	Name = "Functions"
})

--// Settings - Sections

local Values = SettingsTab:CreateSection({
	Name = "Values"
})

local Checks = SettingsTab:CreateSection({
	Name = "Checks"
})

local ThirdPerson = SettingsTab:CreateSection({
	Name = "Third Person Mode?"
})

--// FOV Settings - Sections

local FOV_Values = FOVSettingsTab:CreateSection({
	Name = "Values"
})

local FOV_Appearance = FOVSettingsTab:CreateSection({
	Name = "Appearance"
})

--// Functions - Sections

local FunctionsSection = FunctionsTab:CreateSection({
	Name = "Functions"
})

--// Settings / Values

Values:AddToggle({
	Name = "Enabled",
	Value = Settings.Enabled,
	Callback = function(New, Old)
		Settings.Enabled = New
	end
}).Default = Settings.Enabled

Values:AddToggle({
	Name = "Toggle",
	Value = Settings.Toggle,
	Callback = function(New, Old)
		Settings.Toggle = New
	end
}).Default = Settings.Toggle

Settings.LockPart = Parts[1]; Values:AddDropdown({
	Name = "Lock Part",
	Value = Parts[1],
	Callback = function(New, Old)
		Settings.LockPart = New
	end,
	List = Parts,
	Nothing = "Head"
}).Default = Parts[1]

Values:AddTextbox({ -- Using a Textbox instead of a Keybind because the UI Library doesn't support Mouse inputs like Left Click / Right Click...
	Name = "Hotkey",
	Value = Settings.TriggerKey,
	Callback = function(New, Old)
		Settings.TriggerKey = New
	end
}).Default = Settings.TriggerKey

--[[
Values:AddKeybind({
	Name = "Hotkey",
	Value = Settings.TriggerKey,
	Callback = function(New, Old)
		Settings.TriggerKey = stringmatch(tostring(New), "Enum%.[UserInputType]*[KeyCode]*%.(.+)")
	end,
}).Default = Settings.TriggerKey
]]

Values:AddSlider({
	Name = "Sensitivity",
	Value = Settings.Sensitivity,
	Callback = function(New, Old)
		Settings.Sensitivity = New
	end,
	Min = 0,
	Max = 1,
	Decimals = 2
}).Default = Settings.Sensitivity

--// Settings / Checks

Checks:AddToggle({
	Name = "Team Check",
	Value = Settings.TeamCheck,
	Callback = function(New, Old)
		Settings.TeamCheck = New
	end
}).Default = Settings.TeamCheck

Checks:AddToggle({
	Name = "Wall Check",
	Value = Settings.WallCheck,
	Callback = function(New, Old)
		Settings.WallCheck = New
	end
}).Default = Settings.WallCheck

Checks:AddToggle({
	Name = "Alive Check",
	Value = Settings.AliveCheck,
	Callback = function(New, Old)
		Settings.AliveCheck = New
	end
}).Default = Settings.AliveCheck

--// Settings / ThirdPerson

ThirdPerson:AddToggle({
	Name = "Enable Third Person",
	Value = Settings.ThirdPerson,
	Callback = function(New, Old)
		Settings.ThirdPerson = New
	end
}).Default = Settings.ThirdPerson

ThirdPerson:AddSlider({
	Name = "Sensitivity",
	Value = Settings.ThirdPersonSensitivity,
	Callback = function(New, Old)
		Settings.ThirdPersonSensitivity = New
	end,
	Min = 0.1,
	Max = 5,
	Decimals = 1
}).Default = Settings.ThirdPersonSensitivity

--// FOV Settings / Values

FOV_Values:AddToggle({
	Name = "Enabled",
	Value = FOVSettings.Enabled,
	Callback = function(New, Old)
		FOVSettings.Enabled = New
	end
}).Default = FOVSettings.Enabled

FOV_Values:AddToggle({
	Name = "Visible",
	Value = FOVSettings.Visible,
	Callback = function(New, Old)
		FOVSettings.Visible = New
	end
}).Default = FOVSettings.Visible

FOV_Values:AddSlider({
	Name = "Amount",
	Value = FOVSettings.Amount,
	Callback = function(New, Old)
		FOVSettings.Amount = New
	end,
	Min = 10,
	Max = 300
}).Default = FOVSettings.Amount

--// FOV Settings / Appearance

FOV_Appearance:AddToggle({
	Name = "Filled",
	Value = FOVSettings.Filled,
	Callback = function(New, Old)
		FOVSettings.Filled = New
	end
}).Default = FOVSettings.Filled

FOV_Appearance:AddSlider({
	Name = "Transparency",
	Value = FOVSettings.Transparency,
	Callback = function(New, Old)
		FOVSettings.Transparency = New
	end,
	Min = 0,
	Max = 1,
	Decimal = 1
}).Default = FOVSettings.Transparency

FOV_Appearance:AddSlider({
	Name = "Sides",
	Value = FOVSettings.Sides,
	Callback = function(New, Old)
		FOVSettings.Sides = New
	end,
	Min = 3,
	Max = 60
}).Default = FOVSettings.Sides

FOV_Appearance:AddSlider({
	Name = "Thickness",
	Value = FOVSettings.Thickness,
	Callback = function(New, Old)
		FOVSettings.Thickness = New
	end,
	Min = 1,
	Max = 50
}).Default = FOVSettings.Thickness

FOV_Appearance:AddColorpicker({
	Name = "Color",
	Value = FOVSettings.Color,
	Callback = function(New, Old)
		FOVSettings.Color = New
	end
}).Default = FOVSettings.Color

FOV_Appearance:AddColorpicker({
	Name = "Locked Color",
	Value = FOVSettings.LockedColor,
	Callback = function(New, Old)
		FOVSettings.LockedColor = New
	end
}).Default = FOVSettings.LockedColor

--// Functions / Functions

FunctionsSection:AddButton({
	Name = "Reset Settings",
	Callback = function()
		Functions.ResetSettings()
		Library.ResetAll()
	end
})

FunctionsSection:AddButton({
	Name = "Restart",
	Callback = Functions.Restart
})

FunctionsSection:AddButton({
	Name = "Exit",
	Callback = function()
		Functions:Exit()
		Library.Unload()
	end
})

FunctionsSection:AddButton({
	Name = "Copy Script Page",
	Callback = function()
		setclipboard("https://github.com/Exunys/Aimbot-V2")
	end
})
    end,
})

Tab:CreateButton({
    Name = "the storage script 2",
    Callback = function()
         --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/CoolXplo/DP-HUB-coolxplo/main/The_Storage.lua"))()
    end,
})

Tab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 200}, -- Min and Max speed
    Increment = 1, -- Step size
    Suffix = "Speed", -- What appears after the value
    CurrentValue = 16, -- Starting value
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end,
})
-- Infinite Jump Toggle
local infJumpConn

Tab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false, -- Default value (set to true if you want it enabled by default)
    Callback = function(State)
        local UIS = game:GetService("UserInputService")

        if State then
            -- Enable Infinite Jump
            infJumpConn = UIS.JumpRequest:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            -- Disable Infinite Jump
            if infJumpConn then
                infJumpConn:Disconnect()
                infJumpConn = nil
            end
        end
    end,
})
-- Invisible Toggle
local invisible = false

Tab:CreateToggle({
    Name = "Invisible",
    CurrentValue = false, -- Default value (invisible starts off as false)
    Callback = function(State)
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                if State then
                    -- Make the character invisible
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 1
                        end
                    end
                    humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
                else
                    -- Make the character visible again
                    for _, part in pairs(character:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.Transparency = 0
                        end
                    end
                    humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
                end
            end
        end
    end,
})
-- Godmode Toggle
local godmodeEnabled = false

Tab:CreateToggle({
    Name = "Godmode",
    CurrentValue = false, -- Default value (Godmode starts as disabled)
    Callback = function(State)
        godmodeEnabled = State
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                if godmodeEnabled then
                    -- Enable Godmode (prevents health from decreasing)
                    humanoid.HealthChanged:Connect(function()
                        if humanoid.Health < humanoid.MaxHealth then
                            humanoid.Health = humanoid.MaxHealth  -- Restore health to max
                        end
                    end)
                else
                    -- Disable Godmode (restore normal health behavior)
                    humanoid.HealthChanged:Disconnect()  -- Disable health change prevention
                end
            end
        end
    end,
})
Tab:CreateButton({
    Name = "infinite yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})
-- Create Main Tab
local MainTab = Window:CreateTab("farm(shit)", 4483362458)

-- Toggle state to track if the autofarm is enabled or not
local autofarmEnabled = false

-- Function to simulate autofarming (collecting items and opening storages)
local function autofarm()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Collect item function: Simulate clicking a ClickDetector on the item
    local function collectItem(item)
        if item:FindFirstChild("ClickDetector") then
            fireclickdetector(item.ClickDetector)  -- Simulate clicking the ClickDetector to collect
        end
    end

    -- Open storage function: Simulate clicking a ClickDetector on the storage
    local function openStorage(storage)
        if storage:FindFirstChild("ClickDetector") then
            fireclickdetector(storage.ClickDetector)  -- Simulate clicking the storage to open it
            print("Opened storage:", storage.Name)
        end
    end

    -- Move character to a specific location
    local function moveTo(targetPosition)
        humanoid:MoveTo(targetPosition)  -- Move character to a position
    end

    -- Start autofarm loop
    while autofarmEnabled do
        -- Collect items (example: items with "ClickDetector" and name "Item")
        for _, item in pairs(workspace:GetChildren()) do
            if item:IsA("Model") and item:FindFirstChild("ClickDetector") and item.Name == "Item" then
                collectItem(item)
            end
        end
        
        -- Open storages (example: storages with "ClickDetector" and name "Storage")
        for _, storage in pairs(workspace:GetChildren()) do
            if storage:IsA("Model") and storage:FindFirstChild("ClickDetector") and storage.Name == "Storage" then
                openStorage(storage)
            end
        end
        
        -- Move to a new location (customize this position)
        moveTo(Vector3.new(0, 10, 0))  -- Example coordinates, change as needed
        
        -- Wait before continuing the loop
        wait(2)  -- Adjust speed of the loop, increase or decrease as necessary
    end
end

-- Create the toggle for starting/stopping autofarm
MainTab:CreateToggle({
    Name = "Autofarm Toggle",  -- Name of the toggle
    CurrentValue = false,  -- Default state (off)
    Callback = function(State)
        autofarmEnabled = State  -- Set autofarm state to toggle's state

        if autofarmEnabled then
            print("Autofarm Started!")
            autofarm()  -- Start the autofarm loop when toggled on
        else
            print("Autofarm Stopped!")
        end
    end,
})
Tab:CreateToggle({
    Name = "Ammo Pack Control",
    LoadingTitle = "Ammo System",
    LoadingSubtitle = "by YourName",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "AmmoPackConfig"
    },
    Discord = {
       Enabled = false,
       Invite = "",
       RememberJoins = false
    },
    KeySystem = false,
})

local instantAmmo = false

local MainTab = Window:CreateTab("even more shit", 4483362458)

local Toggle = MainTab:CreateToggle({
 Name = "Ammo Manager",
    LoadingTitle = "Ammo Handler",
    LoadingSubtitle = "by YourName",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "AmmoConfig"
    },
    Discord = {
       Enabled = false,
       Invite = "",
       RememberJoins = false
    },
    KeySystem = false,
})

local StorageTab = Window:CreateTab("extra trash", 4483362458)

local useMediumAmmo = false

-- Toggle to auto-use medium ammo packs
StorageTab:CreateToggle({
    Name = "Instant Use: Medium Ammo Pack",
    CurrentValue = false,
    Flag = "AutoMediumAmmo",
    Callback = function(Value)
        useMediumAmmo = Value
    end,
})

-- Loop to keep checking and using ammo packs if the toggle is on
task.spawn(function()
    while true do
        task.wait(0.5) -- Adjust delay if needed
        if useMediumAmmo then
            local Storage = game:GetService("ReplicatedStorage"):WaitForChild("Storage")
            local UseItemEvent = Storage:FindFirstChild("UseItem") -- adjust this name if needed

            if UseItemEvent then
                UseItemEvent:FireServer("Medium Ammo Pack")
            end
        end
    end
end)
local Toggle = Tab:CreateToggle({
   Name = "Auto Buyer",
    LoadingTitle = "NPC Ammo Buyer",
    LoadingSubtitle = "by YourName",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "AutoBuyConfig"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local StorageTab = Window:CreateTab("AutoBuy(shit)", 4483362458)

-- Item list
local itemList = {
    "Armor Pad",
    "Medium Ammo Pack",
    "Shotgun Ammo",
    "Shotgun Ammo Pack",
    "Smg",
    "AK47",
    "Revolver"
}

local selectedItem = itemList[1]
local autoBuy = false

-- Dropdown to pick item
StorageTab:CreateDropdown({
    Name = "Select Item to Auto-Buy",
    Options = itemList,
    CurrentOption = selectedItem,
    Flag = "SelectedBuyItem",
    Callback = function(Option)
        selectedItem = Option
    end,
})

-- Toggle to start/stop auto-buying
StorageTab:CreateToggle({
    Name = "Auto-Buy Selected Item",
    CurrentValue = false,
    Flag = "ToggleAutoBuy",
    Callback = function(Value)
        autoBuy = Value
    end,
})

-- Auto-buy loop
task.spawn(function()
    while true do
        task.wait(0) -- Delay between buys
        if autoBuy and selectedItem then
            local storage = game:GetService("ReplicatedStorage"):FindFirstChild("Storage")
            local buyEvent = storage and storage:FindFirstChild("BuyItem")

            if buyEvent then
                buyEvent:FireServer(selectedItem)
            end
        end
    end
end)
local Toggle = Tab:CreateToggle({
   Name = "The Storage Exploits",
    LoadingTitle = "Instant Interact",
    LoadingSubtitle = "by YourName",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "StorageInteractConfig"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local ExploitsTab = Window:CreateTab("⚡ Interact", 4483362458)

local instantInteract = false

ExploitsTab:CreateToggle({
    Name = "⚡ Instant Interact (Crates, Doors, etc.)",
    CurrentValue = false,
    Flag = "InstantInteractToggle",
    Callback = function(Value)
        instantInteract = Value
    end,
})

-- Loop to spam interact
task.spawn(function()
    while true do
        task.wait(0.15)
        if instantInteract then
            local rep = game:GetService("ReplicatedStorage")
            local storage = rep:FindFirstChild("Storage")

            -- 👇 Replace "Interact" with actual event if named differently
            local interactRemote = storage and storage:FindFirstChild("Interact")

            if interactRemote then
                -- You can pass a specific target or try looping interactables nearby
                interactRemote:FireServer()
            end
        end
    end
end)

local Tab = Window:CreateTab("dead rails scripts", 4483362458) -- Title, Image

Tab:CreateButton({
    Name = "killaura and more",
    Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()   
    end,
})

Tab:CreateButton({
    Name = "tps",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
    end,
})
local Tab = Window:CreateTab("blox shits", 4483362458) -- Title, Image
Tab:CreateButton({
    Name = "farm1",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end,
})
Tab:CreateToggle({
	 Name = "Blox Fruits Script Toggle",
    LoadingTitle = "Simple Hub Loader",
    LoadingSubtitle = "by simple-hubs",
    ConfigurationSaving = {
        Enabled = false,
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false
})

-- Create a tab
local MainTab = Window:CreateTab("blox fruit trash", 4483362458) -- Icon ID is optional

-- Create a toggle that loads/unloads the script
MainTab:CreateToggle({
    Name = "Enable Blox Fruits Script",
    CurrentValue = false,
    Flag = "ScriptToggle",
    Callback = function(enabled)
        if enabled then
            -- Settings before script loads
            getgenv().simple_settings = {
                ["MASTERY"] = {
                    ["ACTIVE"] = true,
                    ["METHOD"] = "Half",
                },
                ["OBJECTIVE"] = {
                    ["GODHUMAN"] = true,
                    ["RACE-V3"] = true,
                    ["FRAGMENT"] = 100000,
                    ["CANVANDER"] = true,
                    ["BUDDY-SWORD"] = true,
                    ["CURSED-DUAL-KATANA"] = true,
                    ["SHARK-ANCHOR"] = true,
                    ["ACIDUM-RIFLE"] = true,
                    ["VENOM-BOW"] = true,
                    ["SOUL-GUITAR"] = true,
                },
                ["FRUITPURCHASE"] = true,
                ["PRIORITYFRUIT"] = {
                    [1] = "Dragon-Dragon",
                    [2] = "Flame-Flame",
                    [3] = "Rumble-Rumble",
                    [4] = "Human-Human: Buddha",
                    [5] = "Dark-Dark",
                },
                ["FPSCAP"] = 30,
                ["LOWTEXTURE"] = true
            }

            -- Load main script
            loadstring(game:HttpGet("https://raw.githubusercontent.com/simple-hubs/contents/refs/heads/main/bloxfruit-kaitan-main.lua"))()
        else
            Rayfield:Notify({
                Title = "Disabled",
                Content = "The script has been toggled off. To stop it entirely, rejoin or reset the environment.",
                Duration = 6,
                Image = 4483362458,
            })
        end
    end,
})
local Tab = Window:CreateTab("grow a farm shit", 4483362458) -- Title, Image
Tab:CreateButton({
    Name = "farm1",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/GrowaGarden", true))()
    end,
})
Tab:CreateButton({
    Name = "farm2",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hakariqScripts/Roslina/refs/heads/main/Ro"))()
    end,
})