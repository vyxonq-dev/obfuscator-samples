local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer
local HRP, Character, Humanoid

local function refreshCharacter()
    Character = LP.Character or LP.CharacterAdded:Wait()
    HRP = Character:WaitForChild("HumanoidRootPart")
    Humanoid = Character:WaitForChild("Humanoid")
end

refreshCharacter()
LP.CharacterAdded:Connect(refreshCharacter)

local AutoKillMobs = false
local DoubleJump = false
local AntiAFK = false
local AutoHatchCrate = false

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()
local UI = ReGui:TabsWindow({Title = "Boss Slayer", Size = UDim2.fromOffset(300, 250)})

local TabMain = UI:CreateTab({Name = "Main"})

local mainHeader = TabMain:CollapsingHeader({Title = "Features"})
mainHeader:Checkbox({Label = "Auto Kill Mobs", Value = false, Callback = function(_, v) AutoKillMobs = v end})
mainHeader:Checkbox({Label = "Double Jump", Value = false, Callback = function(_, v) DoubleJump = v end})
mainHeader:Checkbox({Label = "Anti AFK", Value = false, Callback = function(_, v) AntiAFK = v end})
mainHeader:Checkbox({Label = "Auto Hatch Crate", Value = false, Callback = function(_, v) AutoHatchCrate = v end})

local AttackEvent = ReplicatedStorage:WaitForChild("Attack")

-- Very fast one-hit auto kill
task.spawn(function()
    while true do
        if AutoKillMobs and Character then
            local mobSpawns = Workspace:FindFirstChild("MobSpawns")
            if mobSpawns then
                for _, mob in pairs(mobSpawns:GetDescendants()) do
                    if mob:IsA("Model") and mob:FindFirstChild("Humanoid") then
                        pcall(function()
                            AttackEvent:FireServer(mob)
                        end)
                    end
                end
            end
        end
        task.wait(0.01) -- Very fast loop
    end
end)

-- Fixed infinite jump for Double Jump
RunService.Heartbeat:Connect(function()
    if DoubleJump and Humanoid and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        if Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            task.wait(0.05) -- Smooth jumping delay
        elseif Humanoid:GetState() == Enum.HumanoidStateType.Running or Humanoid:GetState() == Enum.HumanoidStateType.RunningNoPhysics then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if DoubleJump and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Anti AFK
RunService.Heartbeat:Connect(function()
    if AntiAFK and Character then
        HRP.CFrame = HRP.CFrame + Vector3.new(0, 0, 0.1) -- Small movement to simulate activity
        task.wait(10) -- Move every 10 seconds to avoid AFK kick
    end
end)

-- Auto Hatch Crate
task.spawn(function()
    while true do
        if AutoHatchCrate then
            pcall(function()
                ReplicatedStorage.Crate:FireServer("Forest Crate", 1)
            end)
        end
        task.wait(0.5) -- Hatch every 0.5 seconds, adjust if needed
    end
end)

game.StarterGui:SetCore("SendNotification", {
    Title = "Boss Slayer",
    Text = "Loaded!",
    Duration = 5
})