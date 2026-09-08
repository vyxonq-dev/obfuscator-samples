local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 🔊 Function to play a sound
local function playSound(id)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. id
    sound.Volume = 3
    sound.Parent = game:GetService("SoundService")
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- 🔊 Play sound when script executes
playSound(9085027122) -- Sound 3

local Window = Rayfield:CreateWindow({
    Name = "ZINGERBOX GOON SCRIPT",
    Icon = 0,
    LoadingTitle = "get a zingerbox now",
    LoadingSubtitle = "feining for a zinger",
    ShowText = "zinger bo- 😋🤤😪",
    Theme = "DarkBlue",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "zingergoon is my king"
    },
    Discord = {
        Enabled = true,
        Invite = "https://discord.gg/fk5NZStTgz",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {}
})

local Tab = Window:CreateTab("Home", nil)
local Tab = Window:CreateTab("Main Poop Stuff")

-- Separate global flags for each toggle
getgenv().FastPooRunning = false
getgenv().RapidPooRunning = false

-- Fast Poo Toggle
local FastPooToggle = Tab:CreateToggle({
    Name = "Fast Poo",
    CurrentValue = false,
    Flag = "FastPooToggle",
    Callback = function(Value)
        getgenv().FastPooRunning = Value
        if Value then
            playSound(428495297) -- Sound 1
            spawn(function()
                while getgenv().FastPooRunning do
                    game:GetService("ReplicatedStorage"):WaitForChild("StartPoopMinigameServer"):FireServer()
                    game:GetService("ReplicatedStorage"):WaitForChild("PoopSuccessEvent"):FireServer()
                    task.wait(0.3)
                end
                print("Fast Poo stopped")
            end)
        else
            playSound(7229097896) -- Sound 2
        end
    end,
})

-- Rapid Poo Toggle
local RapidPooToggle = Tab:CreateToggle({
    Name = "Rapid Poo [🚨POTENTIAL LAG🚨]",
    CurrentValue = false,
    Flag = "RapidPooToggle",
    Callback = function(Value)
        getgenv().RapidPooRunning = Value
        if Value then
            playSound(428495297) -- Sound 1
            spawn(function()
                while getgenv().RapidPooRunning do
                    game:GetService("ReplicatedStorage"):WaitForChild("StartPoopMinigameServer"):FireServer()
                    game:GetService("ReplicatedStorage"):WaitForChild("PoopSuccessEvent"):FireServer()
                    task.wait(0.3)
                end
                print("Rapid Poo stopped")
            end)
        else
            playSound(7229097896) -- Sound 2
        end
    end,
})

-- Fly GUI Button
local FlyButton = Tab:CreateButton({
    Name = "Fly Gui [not mine]",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/FlyGuiV8.lua", true))()
    end,
})

-- Hidden Area Teleport Button
local HiddenButton = Tab:CreateButton({
    Name = "Hidden Area (hidden from ppl)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(15.9, -21.4, 49.3)
    end,
})