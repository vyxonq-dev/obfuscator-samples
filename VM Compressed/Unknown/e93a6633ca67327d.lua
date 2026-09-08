-- Fixz Hub | Roblox Go-Kart Racing 🏎️
-- Made By Fixz 64

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Remotes
local Remotes = {
    -- Racing
    ClientRace = ReplicatedStorage.Remotes.ClientRace,
    SendRaceResults = ReplicatedStorage.Remotes.SendRaceResults,
    UpdatePos = ReplicatedStorage.Remotes.UpdatePos,
    
    -- Kart
    GiveKart = ReplicatedStorage.Remotes.GiveKart,
    Kart = ReplicatedStorage.Remotes.Kart,
    RandomizeKart = ReplicatedStorage.RandomizerStuff.RandomizeKart,
    
    -- Boost
    BoostInputEvent = ReplicatedStorage.BoostInputEvent,
    
    -- Voting
    RemoteVotingStart = ReplicatedStorage.Remotes.Voting.RemoteVotingStart,
    RemoteVotingEnd = ReplicatedStorage.Remotes.Voting.RemoteVotingEnd,
    
    -- Effects
    Explosion = ReplicatedStorage.Remotes.Explosion,
}

-- State
local State = {
    AutoWin = false,
    InfiniteBoost = false,
    AutoRandomKart = false,
    SpeedBoost = false
}

local Settings = {
    WalkSpeed = 16,
    Position = 1
}

-- ===== Rayfield UI with Key System =====
local Window = Rayfield:CreateWindow({
    Name = "Fixz Hub | Go-Kart Racing 🏎️",
    LoadingTitle = "Fixz Hub",
    LoadingSubtitle = "Made By Fixz 64",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = true,
        Invite = "CDyrbSY8Gx",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Fixz Hub Key System",
        Subtitle = "Enter Key",
        Note = "Join Discord to get key: https://discord.gg/CDyrbSY8Gx",
        FileName = "FixzHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Fixz2025"}
    }
})

-- Tabs
local TabMain = Window:CreateTab("Main", 4483362458)
local TabKart = Window:CreateTab("Kart", 4483362458)
local TabPlayer = Window:CreateTab("Player", 4483362458)

-- ===== MAIN TAB =====
TabMain:CreateSection("Race Features")

TabMain:CreateToggle({
    Name = "Auto Win Race",
    CurrentValue = false,
    Flag = "AutoWin",
    Callback = function(Value)
        State.AutoWin = Value
    end,
})

task.spawn(function()
    while task.wait(0.1) do
        if State.AutoWin then
            pcall(function()
                -- Try to update position to 1st place
                Remotes.UpdatePos:FireServer(1)
            end)
        end
    end
end)

TabMain:CreateSlider({
    Name = "Set Race Position",
    Range = {1, 12},
    Increment = 1,
    CurrentValue = 1,
    Flag = "Position",
    Callback = function(Value)
        Settings.Position = Value
    end,
})

TabMain:CreateButton({
    Name = "Force Position Update",
    Callback = function()
        pcall(function()
            Remotes.UpdatePos:FireServer(Settings.Position)
            Rayfield:Notify({
                Title = "Position Updated",
                Content = "Set position to: " .. Settings.Position,
                Duration = 2,
                Image = 4483362458
            })
        end)
    end,
})

TabMain:CreateSection("Boost")

TabMain:CreateToggle({
    Name = "Infinite Boost",
    CurrentValue = false,
    Flag = "InfiniteBoost",
    Callback = function(Value)
        State.InfiniteBoost = Value
    end,
})

task.spawn(function()
    while task.wait(0.05) do
        if State.InfiniteBoost then
            pcall(function()
                Remotes.BoostInputEvent:FireServer()
            end)
        end
    end
end)

TabMain:CreateButton({
    Name = "Trigger Boost",
    Callback = function()
        pcall(function()
            Remotes.BoostInputEvent:FireServer()
            Rayfield:Notify({
                Title = "Boost",
                Content = "Boost activated!",
                Duration = 2,
                Image = 4483362458
            })
        end)
    end,
})

-- ===== KART TAB =====
TabKart:CreateSection("Kart Options")

TabKart:CreateButton({
    Name = "Get All Karts",
    Callback = function()
        pcall(function()
            local karts = {}
            local kartFolder = ReplicatedStorage:FindFirstChild("Karts") or 
                               ReplicatedStorage:FindFirstChild("KartModels") or
                               Workspace:FindFirstChild("Karts")
            
            if kartFolder then
                for _, kart in ipairs(kartFolder:GetChildren()) do
                    table.insert(karts, kart.Name)
                end
                
                if #karts > 0 then
                    Rayfield:Notify({
                        Title = "Karts Found",
                        Content = string.format("Found %d karts! Check console (F9)", #karts),
                        Duration = 3,
                        Image = 4483362458
                    })
                    
                    print("===== Available Karts =====")
                    for i, kartName in ipairs(karts) do
                        print(string.format("[%d] %s", i, kartName))
                    end
                    print("===========================")
                else
                    Rayfield:Notify({
                        Title = "No Karts",
                        Content = "Couldn't find karts folder",
                        Duration = 3,
                        Image = 4483362458
                    })
                end
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Karts folder not found",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        end)
    end,
})

TabKart:CreateInput({
    Name = "Give Specific Kart",
    PlaceholderText = "Kart Name",
    RemoveTextAfterFocusLost = false,
    Flag = "KartName",
    Callback = function(Text)
        if Text ~= "" then
            pcall(function()
                Remotes.GiveKart:FireServer(Text)
                Rayfield:Notify({
                    Title = "Kart Given",
                    Content = "Tried to give: " .. Text,
                    Duration = 2,
                    Image = 4483362458
                })
            end)
        end
    end,
})

TabKart:CreateParagraph({
    Title = "How to Get Karts",
    Content = "1. Click 'Get All Karts' to see available karts\n2. Check console (F9) for kart names\n3. Type the exact kart name above\n4. Press Enter to get that kart"
})

TabKart:CreateToggle({
    Name = "Auto Random Kart",
    CurrentValue = false,
    Flag = "AutoRandomKart",
    Callback = function(Value)
        State.AutoRandomKart = Value
    end,
})

task.spawn(function()
    while task.wait(5) do
        if State.AutoRandomKart then
            pcall(function()
                Remotes.RandomizeKart:FireServer()
            end)
        end
    end
end)

TabKart:CreateButton({
    Name = "Randomize Kart",
    Callback = function()
        pcall(function()
            Remotes.RandomizeKart:FireServer()
            Rayfield:Notify({
                Title = "Kart Randomized",
                Content = "Your kart has been randomized!",
                Duration = 2,
                Image = 4483362458
            })
        end)
    end,
})

TabKart:CreateButton({
    Name = "Refresh Kart",
    Callback = function()
        pcall(function()
            Remotes.GiveKart:FireServer()
            Rayfield:Notify({
                Title = "Kart Refreshed",
                Content = "Kart has been refreshed!",
                Duration = 2,
                Image = 4483362458
            })
        end)
    end,
})

-- ===== PLAYER TAB =====
TabPlayer:CreateSection("Player Movement")

TabPlayer:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        Settings.WalkSpeed = Value
    end,
})

TabPlayer:CreateToggle({
    Name = "Speed Boost",
    CurrentValue = false,
    Flag = "SpeedBoost",
    Callback = function(Value)
        State.SpeedBoost = Value
    end,
})

RunService.RenderStepped:Connect(function()
    if State.SpeedBoost then
        pcall(function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid.WalkSpeed = Settings.WalkSpeed
            end
        end)
    end
end)

TabPlayer:CreateSlider({
    Name = "Jump Power",
    Range = {50, 300},
    Increment = 5,
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(Value)
        pcall(function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid.JumpPower = Value
            end
        end)
    end,
})

TabPlayer:CreateSection("Fun")

TabPlayer:CreateButton({
    Name = "Spawn Explosion (Visual)",
    Callback = function()
        pcall(function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local pos = character.HumanoidRootPart.Position
                Remotes.Explosion:FireServer(pos)
                Rayfield:Notify({
                    Title = "Explosion!",
                    Content = "Spawned explosion at your position",
                    Duration = 2,
                    Image = 4483362458
                })
            end
        end)
    end,
})

TabPlayer:CreateSection("Information")

TabPlayer:CreateParagraph({
    Title = "How to Use",
    Content = "1. Enable Auto Win Race before race starts\n2. Use Infinite Boost during race\n3. Randomize kart for fun cosmetics\n4. Adjust speed as needed"
})

Rayfield:LoadConfiguration()

print("Fixz Hub | Go-Kart Racing loaded successfully!")