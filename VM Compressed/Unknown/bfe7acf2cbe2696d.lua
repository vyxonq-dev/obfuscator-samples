-- Fixz Hub | Legends Of Speed 🏃
-- Made By Fixz 64

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- State
local State = {
    AutoRebirth = false,
    AutoFarm = false,
    AutoHoops = false,
    NoClip = false
}

local Settings = {
    FarmLocation = "City",
    FarmOrb = "Red Orb",
    FarmSpeed = 30
}

-- ===== Rayfield UI with Key System =====
local Window = Rayfield:CreateWindow({
    Name = "Fixz Hub | Legends Of Speed 🏃",
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

-- Main Tab
local TabMain = Window:CreateTab("Main", 4483362458)
local TabFarm = Window:CreateTab("Auto Farm", 4483362458)

-- ===== Main Features =====
TabMain:CreateSection("Main Features")

TabMain:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Flag = "AutoRebirth",
    Callback = function(Value)
        State.AutoRebirth = Value
    end,
})

task.spawn(function()
    while task.wait(0.5) do
        if State.AutoRebirth then
            pcall(function()
                ReplicatedStorage.rEvents.rebirthEvent:FireServer("rebirthRequest")
            end)
        end
    end
end)

TabMain:CreateToggle({
    Name = "No Clip",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        State.NoClip = Value
    end,
})

RunService.Stepped:Connect(function()
    if State.NoClip then
        pcall(function()
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end)
    end
end)

TabMain:CreateButton({
    Name = "Claim All Chests",
    Callback = function()
        pcall(function()
            local hrp = LocalPlayer.Character.HumanoidRootPart
            Workspace.goldenChest.circleInner.CFrame = hrp.CFrame
            Workspace.enchantedChest.circleInner.CFrame = hrp.CFrame
            Workspace.magmaChest.circleInner.CFrame = hrp.CFrame
            Workspace.groupRewardsCircle.circleInner.CFrame = hrp.CFrame
            task.wait(0.5)
        end)
        Rayfield:Notify({
            Title = "Success",
            Content = "All chests claimed!",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

TabMain:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 500},
    Increment = 10,
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        pcall(function()
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end)
    end,
})

TabMain:CreateSlider({
    Name = "Jump Power",
    Range = {0, 300},
    Increment = 10,
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(Value)
        pcall(function()
            LocalPlayer.Character.Humanoid.JumpPower = Value
        end)
    end,
})

-- ===== Auto Farm Tab =====
TabFarm:CreateSection("Farm Settings")

TabFarm:CreateDropdown({
    Name = "Select Location",
    Options = {"City", "Snow City", "Magma City", "Legends Highway", "Space", "Desert"},
    CurrentOption = "City",
    Flag = "FarmLocation",
    Callback = function(Value)
        Settings.FarmLocation = Value
    end,
})

TabFarm:CreateDropdown({
    Name = "Select Orbs",
    Options = {"Red Orb", "Yellow Orb", "Blue Orb", "Orange Orb", "Gem", "Purple Orb", "Green Orb", "Pink Orb", "White Orb", "Black Orb", "Rainbow Orb"},
    CurrentOption = "Red Orb",
    Flag = "FarmOrb",
    Callback = function(Value)
        Settings.FarmOrb = Value
    end,
})

TabFarm:CreateDropdown({
    Name = "Farm Speed",
    Options = {"Super Fast", "Fast", "Medium", "Slow"},
    CurrentOption = "Fast",
    Flag = "FarmSpeed",
    Callback = function(Value)
        if Value == "Super Fast" then
            Settings.FarmSpeed = 40
        elseif Value == "Fast" then
            Settings.FarmSpeed = 30
        elseif Value == "Medium" then
            Settings.FarmSpeed = 20
        elseif Value == "Slow" then
            Settings.FarmSpeed = 10
        end
    end,
})

TabFarm:CreateToggle({
    Name = "Start Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        State.AutoFarm = Value
    end,
})

task.spawn(function()
    while task.wait() do
        if State.AutoFarm then
            pcall(function()
                for i = 1, Settings.FarmSpeed do
                    local args = {
                        [1] = "collectOrb",
                        [2] = Settings.FarmOrb,
                        [3] = Settings.FarmLocation
                    }
                    ReplicatedStorage.rEvents.orbEvent:FireServer(unpack(args))
                end
            end)
        end
    end
end)

TabFarm:CreateToggle({
    Name = "Auto Hoops",
    CurrentValue = false,
    Flag = "AutoHoops",
    Callback = function(Value)
        State.AutoHoops = Value
    end,
})

task.spawn(function()
    while task.wait() do
        if State.AutoHoops then
            pcall(function()
                local children = Workspace.Hoops:GetChildren()
                for i, child in ipairs(children) do
                    if child.Name == 'Hoop' then
                        child.Transparency = 1
                        child.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end)
        end
    end
end)

TabFarm:CreateSection("Info")
TabFarm:CreateParagraph({
    Title = "Farm Speeds",
    Content = "• Super Fast = 40 (May cause lag)\n• Fast = 30 (Recommended)\n• Medium = 20\n• Slow = 10"
})

-- Anti-AFK
task.spawn(function()
    LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
        task.wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    end)
end)

Rayfield:LoadConfiguration()

print("Fixz Hub | Legends Of Speed loaded successfully!")