-- FIXZ HUB. | FIND THE HACKER 🧑‍💻
-- [161] - Everything is FREE!
-- Using Fluent UI Library

print("🧑‍💻 Loading Fixz Hub for Find The Hacker...")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")

local plr = Players.LocalPlayer

-- Anti-AFK
plr.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- Load Fluent UI
print("Loading Fluent UI...")
local success, Fluent = pcall(function()
    return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

if not success then
    warn("Failed to load Fluent UI, trying alternate link...")
    Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Fluent.lua"))()
end

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

print("Creating window...")

-- Variables
getgenv().autoFindHackers = false
getgenv().hackersFound = 0

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "🧑‍💻 Fixz Hub. | Find The Hacker [161]",
    SubTitle = "Everything is FREE! No Premium Required",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Create Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "🏠 Main", Icon = "home" }),
    AutoFind = Window:AddTab({ Title = "🔥 Find Hackers", Icon = "search" }),
    Gamepasses = Window:AddTab({ Title = "💲 Free Gamepasses", Icon = "gift" }),
    Delete = Window:AddTab({ Title = "⚠️ Delete", Icon = "trash-2" }),
    Settings = Window:AddTab({ Title = "🔧 Settings", Icon = "settings" })
}

-- MAIN TAB
Tabs.Main:AddParagraph({
    Title = "🧑‍💻 Welcome to Fixz Hub!",
    Content = "Find The Hacker [161] - Everything is FREE! Auto find hackers, free gamepasses, and more!"
})

local StatsLabel = Tabs.Main:AddParagraph({
    Title = "📊 Statistics",
    Content = "Hackers Found: 0"
})

task.spawn(function()
    while task.wait(1) do
        StatsLabel:SetDesc(string.format("Hackers Found: %d", getgenv().hackersFound))
    end
end)

Tabs.Main:AddButton({
    Title = "🎮 Join Discord",
    Description = "Get support and updates",
    Callback = function()
        setclipboard("https://discord.gg/w7mpnRStv3")
        Fluent:Notify({
            Title = "Discord Copied!",
            Content = "Discord invite copied to clipboard!",
            Duration = 3
        })
    end
})

Tabs.Main:AddParagraph({
    Title = "✨ No Premium Required!",
    Content = "All features are completely FREE! Enjoy unlimited access to everything."
})

-- AUTO FIND HACKERS TAB
Tabs.AutoFind:AddParagraph({
    Title = "🔥 Find Hackers (OP)",
    Content = "Automatically teleport to all hackers in the game!"
})

local AutoFindToggle = Tabs.AutoFind:AddToggle("AutoFind", {
    Title = "⭐ Auto Find All Hackers",
    Description = "Automatically teleport to every hacker",
    Default = false
})

AutoFindToggle:OnChanged(function(state)
    getgenv().autoFindHackers = state
    
    if state then
        Fluent:Notify({
            Title = "Auto Find Started!",
            Content = "Teleporting to all hackers automatically",
            Duration = 3
        })
        
        task.spawn(function()
            while getgenv().autoFindHackers do
                local character = plr.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        local hackersFolder = Workspace:FindFirstChild("Hackers")
                        if hackersFolder then
                            for _, model in pairs(hackersFolder:GetChildren()) do
                                if model:IsA("Model") and getgenv().autoFindHackers then
                                    local modelRoot = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Head")
                                    if modelRoot then
                                        humanoidRootPart.CFrame = modelRoot.CFrame + Vector3.new(0, 3, 0)
                                        getgenv().hackersFound = getgenv().hackersFound + 1
                                        task.wait(0.5)
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    else
        Fluent:Notify({
            Title = "Auto Find Stopped",
            Content = "Stopped auto finding hackers",
            Duration = 3
        })
    end
end)

Tabs.AutoFind:AddButton({
    Title = "😎 Find monochromaticMan (Hardest)",
    Description = "Teleport to the hardest hacker",
    Callback = function()
        local character = plr.Character or plr.CharacterAdded:Wait()
        local root = character:WaitForChild("HumanoidRootPart")
        
        local hackersFolder = Workspace:FindFirstChild("Hackers")
        if hackersFolder then
            local monochromaticMan = hackersFolder:FindFirstChild("monochromatic Man")
            if monochromaticMan then
                local hackerPart = monochromaticMan:FindFirstChild("HumanoidRootPart") or monochromaticMan:FindFirstChildWhichIsA("BasePart")
                if hackerPart then
                    root.CFrame = hackerPart.CFrame + Vector3.new(0, 3, 0)
                    getgenv().hackersFound = getgenv().hackersFound + 1
                    Fluent:Notify({
                        Title = "Found!",
                        Content = "Teleported to monochromaticMan",
                        Duration = 3
                    })
                else
                    Fluent:Notify({
                        Title = "Not Found",
                        Content = "monochromaticMan not found in game",
                        Duration = 3
                    })
                end
            else
                Fluent:Notify({
                    Title = "Not Found",
                    Content = "monochromaticMan not spawned yet",
                    Duration = 3
                })
            end
        end
    end
})

Tabs.AutoFind:AddButton({
    Title = "📋 List All Hackers",
    Description = "Show all hackers currently in the game",
    Callback = function()
        local hackersFolder = Workspace:FindFirstChild("Hackers")
        if hackersFolder then
            local hackerList = {}
            for _, model in pairs(hackersFolder:GetChildren()) do
                if model:IsA("Model") then
                    table.insert(hackerList, model.Name)
                end
            end
            
            if #hackerList > 0 then
                local listText = "Hackers in game:\n" .. table.concat(hackerList, ", ")
                Fluent:Notify({
                    Title = "Hackers Found!",
                    Content = #hackerList .. " hackers detected",
                    Duration = 5
                })
                print(listText)
            else
                Fluent:Notify({
                    Title = "No Hackers",
                    Content = "No hackers found in the game",
                    Duration = 3
                })
            end
        end
    end
})

Tabs.AutoFind:AddButton({
    Title = "🔄 Reset Hacker Counter",
    Description = "Reset the hackers found counter",
    Callback = function()
        getgenv().hackersFound = 0
        Fluent:Notify({
            Title = "Reset!",
            Content = "Hacker counter has been reset",
            Duration = 2
        })
    end
})

-- FREE GAMEPASSES TAB
Tabs.Gamepasses:AddParagraph({
    Title = "💲 Free Gamepasses",
    Content = "Get all gamepasses for FREE! No Robux required!"
})

Tabs.Gamepasses:AddButton({
    Title = "🏃 Speed Coil (FREE)",
    Description = "Get super speed for free",
    Callback = function()
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 32
            Fluent:Notify({
                Title = "Speed Coil Activated!",
                Content = "Walk speed set to 32",
                Duration = 3
            })
        end
    end
})

Tabs.Gamepasses:AddButton({
    Title = "🌙 Gravity Coil (FREE)",
    Description = "Get low gravity and high jump",
    Callback = function()
        Workspace.Gravity = 10
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = 350
        end
        Fluent:Notify({
            Title = "Gravity Coil Activated!",
            Content = "Low gravity + high jump enabled",
            Duration = 3
        })
    end
})

Tabs.Gamepasses:AddButton({
    Title = "🔥 Activate All Gamepasses",
    Description = "Enable speed + gravity coil together",
    Callback = function()
        Workspace.Gravity = 10
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = 32
            plr.Character.Humanoid.JumpPower = 350
        end
        Fluent:Notify({
            Title = "All Gamepasses Active!",
            Content = "Speed + Gravity coil enabled",
            Duration = 3
        })
    end
})

Tabs.Gamepasses:AddSection("Custom Values")

local WalkSpeedSlider = Tabs.Gamepasses:AddSlider("WalkSpeed", {
    Title = "🏃 Walk Speed",
    Description = "Customize your walk speed",
    Default = 32,
    Min = 16,
    Max = 100,
    Rounding = 1,
    Callback = function(value)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = value
        end
    end
})

local JumpPowerSlider = Tabs.Gamepasses:AddSlider("JumpPower", {
    Title = "🦘 Jump Power",
    Description = "Customize your jump power",
    Default = 350,
    Min = 50,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.JumpPower = value
        end
    end
})

local GravitySlider = Tabs.Gamepasses:AddSlider("Gravity", {
    Title = "🌙 Gravity",
    Description = "Customize world gravity",
    Default = 10,
    Min = 1,
    Max = 196.2,
    Rounding = 0.1,
    Callback = function(value)
        Workspace.Gravity = value
    end
})

-- Update on respawn
plr.CharacterAdded:Connect(function(char)
    task.wait(1)
    local hum = char:WaitForChild("Humanoid")
    if WalkSpeedSlider then
        hum.WalkSpeed = WalkSpeedSlider.Value or 32
    end
    if JumpPowerSlider then
        hum.JumpPower = JumpPowerSlider.Value or 350
    end
end)

-- DELETE TAB
Tabs.Delete:AddParagraph({
    Title = "⚠️ Map Deletion",
    Content = "Delete doors, puzzles, and maps to make finding hackers easier!"
})

Tabs.Delete:AddButton({
    Title = "🚪 Delete All Doors",
    Description = "Remove all puzzle doors",
    Callback = function()
        local deletedCount = 0
        
        local aloneFolder = Workspace:FindFirstChild("AlonePuzzle")
        if aloneFolder then
            aloneFolder:Destroy()
            deletedCount = deletedCount + 1
        end
        
        local doorFolder = Workspace:FindFirstChild("DoorPuzzle")
        if doorFolder then
            doorFolder:Destroy()
            deletedCount = deletedCount + 1
        end
        
        local hammerFolder = Workspace:FindFirstChild("HammerPuzzle")
        if hammerFolder then
            hammerFolder:Destroy()
            deletedCount = deletedCount + 1
        end
        
        Fluent:Notify({
            Title = "Doors Deleted!",
            Content = string.format("Deleted %d puzzle folders", deletedCount),
            Duration = 3
        })
    end
})

Tabs.Delete:AddButton({
    Title = "🌍 Delete Map",
    Description = "Remove the entire map",
    Callback = function()
        local deletedCount = 0
        
        local mapFolder = Workspace:FindFirstChild("Map")
        if mapFolder then
            mapFolder:Destroy()
            deletedCount = deletedCount + 1
        end
        
        local mapCloneFolder = Workspace:FindFirstChild("MapClone")
        if mapCloneFolder then
            mapCloneFolder:Destroy()
            deletedCount = deletedCount + 1
        end
        
        Fluent:Notify({
            Title = "Map Deleted!",
            Content = string.format("Deleted %d map folders", deletedCount),
            Duration = 3
        })
    end
})

Tabs.Delete:AddButton({
    Title = "💥 Delete Everything (Doors + Map)",
    Description = "Remove all obstacles at once",
    Callback = function()
        local folders = {
            "AlonePuzzle", "DoorPuzzle", "HammerPuzzle", 
            "Map", "MapClone"
        }
        
        local deletedCount = 0
        for _, folderName in ipairs(folders) do
            local folder = Workspace:FindFirstChild(folderName)
            if folder then
                folder:Destroy()
                deletedCount = deletedCount + 1
            end
        end
        
        Fluent:Notify({
            Title = "Everything Deleted!",
            Content = string.format("Deleted %d folders", deletedCount),
            Duration = 3
        })
    end
})

Tabs.Delete:AddButton({
    Title = "🔄 Respawn Character",
    Description = "Respawn your character",
    Callback = function()
        if plr.Character then
            plr.Character:BreakJoints()
            Fluent:Notify({
                Title = "Respawning...",
                Content = "Your character will respawn shortly",
                Duration = 3
            })
        end
    end
})

-- SETTINGS TAB
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FixzHub")
SaveManager:SetFolder("FixzHub/FindTheHacker")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "🧑‍💻 Fixz Hub Loaded!",
    Content = "Find The Hacker [161] - Everything is FREE!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()

print("✅ Fixz Hub fully loaded!")
print("🧑‍💻 All features are FREE - No premium required!")
print("🔥 Use Auto Find to collect all hackers automatically!")