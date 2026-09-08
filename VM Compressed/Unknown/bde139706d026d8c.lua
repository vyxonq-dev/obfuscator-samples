local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Script For alls games | System Hub",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Welcome...",
    LoadingSubtitle = "by Andrey",
    Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
 
    Discord = {
       Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "HtucSVyKFH", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })
 local Tab = Window:CreateTab("Misc", 4483362458) -- Title, Image
 local Tabe = Window:CreateTab("Scripts", 4483362458) -- Title, Image
 local Tabs = Window:CreateTab("For Creators Script", 4483362458) -- Title, Image

 local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local defaultWalkSpeed = Humanoid.WalkSpeed
local defaultJumpPower = Humanoid.JumpPower
local defaultGravity = workspace.Gravity

-- Создание слайдера скорости
local SpeedSlider = Tab:CreateSlider({
    Name = "SpeedPower",
    Range = {0, 100},
    Increment = 5,
    Suffix = " WS",
    CurrentValue = Humanoid.WalkSpeed,
    Flag = "SpeedSlider",
    Callback = function(Value)
        Humanoid.WalkSpeed = Value
    end
})

-- Создание слайдера прыжка
local JumpSlider = Tab:CreateSlider({
    Name = "JumpPower",
    Range = {0, 200},
    Increment = 5,
    Suffix = " JP",
    CurrentValue = Humanoid.JumpPower,
    Flag = "JumpSlider",
    Callback = function(Value)
        Humanoid.JumpPower = Value
    end
})

-- Создание слайдера гравитации
local GravitySlider = Tab:CreateSlider({
    Name = "Gravity",
    Range = {0, 300},
    Increment = 10,
    Suffix = " Grav",
    CurrentValue = workspace.Gravity,
    Flag = "GravitySlider",
    Callback = function(Value)
        workspace.Gravity = Value
    end
})

-- Кнопка сброса
local ResetButton = Tab:CreateButton({
    Name = "Respawn Silders",
    Callback = function()
        Humanoid.WalkSpeed = defaultWalkSpeed
        Humanoid.JumpPower = defaultJumpPower
        workspace.Gravity = defaultGravity

        -- Обновление значений слайдеров
        SpeedSlider:Set(defaultWalkSpeed)
        JumpSlider:Set(defaultJumpPower)
        GravitySlider:Set(defaultGravity)
    end
})

 local Button = Tab:CreateButton({
    Name = "AimBot (Mouse Right)",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/WRD%20Aimbot.txt"))()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Jump Infinite",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Jump.txt"))()
    end,
 })

local Button = Tabe:CreateButton({
    Name = "infinite yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
 })

 local Button = Tabe:CreateButton({
    Name = "Script For Pet Go (All Executors supported)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OhhMyGehlee/rel/refs/heads/main/el"))()
    end,
 })

 local Button = Tabe:CreateButton({
    Name = "Sirius Bar",
    Callback = function()
        loadstring(game:HttpGet('https://sirius.menu/script'))();
    end,
 })

 local Button = Tabe:CreateButton({
    Name = "ZapHub (Xeno not supported) (PS99, PET GO, BLADE BALL)",
    Callback = function()
        loadstring(game:HttpGet('https://zaphub.xyz/Exec'))()
    end,
 })
 
 local Button = Tabs:CreateButton({
    Name = "Dex Explorer v3",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end,
 })

 local Button = Tabs:CreateButton({
    Name = "Remotespy",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SystemHubC/SystemHub/refs/heads/main/Remotespy.lua"))()
    end,
 })

 local Button = Tabs:CreateButton({
    Name = "Dex Explorer v3 (Mobile)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/DEX-Explorer/refs/heads/main/Mobile.lua"))()
    end,
 })

 
 local Button = Tabe:CreateButton({
    Name = "Ez Hub",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Ez%20Hub.txt"))()
    end,
 })

 local Button = Tabe:CreateButton({
    Name = "System Hub (For Game)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SystemHubC/SystemHub/refs/heads/main/Idk.lua"))()
    end,
 })
