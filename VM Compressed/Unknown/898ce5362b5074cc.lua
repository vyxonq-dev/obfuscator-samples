loadstring(game:HttpGet("https://raw.githubusercontent.com/StrokeThePea/GelatekReanimate/refs/heads/main/Main.lua"))()
task.wait(7)
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("animation by ggsoda and say -net i aint saying it :]")
task.wait(1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Fe%20Better%3F%20Movement"))()

local PRIVATE_MODEL_ID = 132141340408976  -- CHANGE THIS TO YOUR PRIVATE/Public MODEL ID

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Eunoia is here to help ur day",
    Text = "It detects if the model has a run/walk/idle/jump/crouch/slide anim and silly animation remake :]",
    Duration = 10
})

-- Load Animator6D Pro
if not getgenv().Animator6DLoadedPro then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Stuff/refs/heads/main/Animator6D.lua"))()
    repeat task.wait() until getgenv().Animator6DLoadedPro
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RunService = game:GetService("RunService")

-- Load private model
local success, model = pcall(function()
    return game:GetObjects("rbxassetid://" .. PRIVATE_MODEL_ID)[1]
end)
if not success or not model then error("Failed to load private model: "..PRIVATE_MODEL_ID) end

-- Scan all KeyframeSequences
local AllKFSeq = {}
local function scan(obj, path)
    if obj:IsA("KeyframeSequence") then
        table.insert(AllKFSeq, {Name = obj.Name, KFSeq = obj})
        print("Found:", obj.Name)
    end
    for _, child in pairs(obj:GetChildren()) do
        scan(child, path .. child.Name .. ".")
    end
end
scan(model, "")

if #AllKFSeq == 0 then error("No animations!") end

-- Auto assign
local IdleKF = AllKFSeq[1].KFSeq
local WalkKF = AllKFSeq[1].KFSeq
local JumpKF = AllKFSeq[1].KFSeq
local SitKF  = AllKFSeq[1].KFSeq
local RunKF  = nil
local CrouchKF = nil

for _, anim in ipairs(AllKFSeq) do
    local n = anim.Name:lower()
    if n:find("run") or n:find("sprint") then RunKF = anim.KFSeq
    elseif n:find("crouch") or n:find("slide") then CrouchKF = anim.KFSeq
    elseif n:find("walk") and WalkKF == AllKFSeq[1].KFSeq then WalkKF = anim.KFSeq
    elseif n:find("jump") then JumpKF = anim.KFSeq
    elseif n:find("idle") then IdleKF = anim.KFSeq
    elseif n:find("sit") then SitKF = anim.KFSeq
    end
end

-- States
local RunMode = false
local CrouchMode = false
local currentAnim = nil

-- Play function (with forced stop + instant switch)
local function Play(kfseq, looped)
    if currentAnim == kfseq then return end
    getgenv().Animator6DStop()
    task.wait(0.03) -- tiny delay to prevent overlap
    getgenv().Animator6D(kfseq, 1, looped ~= false)
    currentAnim = kfseq
end

-- GUI Frame (draggable)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 180, 0, 190)
Frame.Position = UDim2.new(0, 20, 0.5, -95)
Frame.BackgroundTransparency = 0.3
Frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
Frame.Parent = ScreenGui

-- Draggable
local dragging
Frame.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dragging = false end end) end end)
RunService.RenderStepped:Connect(function()
    if dragging and UserInputService:GetMouseLocation() then
        local delta = UserInputService:GetMouseLocation() - Frame.AbsolutePosition
        Frame.Position = UDim2.new(0, Frame.Position.X.Offset + delta.X, 0, Frame.Position.Y.Offset + delta.Y)
    end
end)

-- Crouch/Slide Button (Top)
local CrouchButton = nil
if CrouchKF then
    CrouchButton = Instance.new("TextButton")
    CrouchButton.Size = UDim2.new(1,0,0,50)
    CrouchButton.Position = UDim2.new(0,0,0,0)
    CrouchButton.BackgroundColor3 = Color3.fromRGB(255,100,100)
    CrouchButton.TextColor3 = Color3.new(1,1,1)
    CrouchButton.Font = Enum.Font.GothamBold
    CrouchButton.TextSize = 18
    CrouchButton.Text = "SLIDE/CROUCH: OFF"
    CrouchButton.Parent = Frame

    CrouchButton.MouseButton1Click:Connect(function()
        CrouchMode = not CrouchMode
        CrouchButton.Text = "SLIDE/CROUCH: " .. (CrouchMode and "ON" or "OFF")
        CrouchButton.BackgroundColor3 = CrouchMode and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,100,100)
    end)
end

-- Run Button (Middle)
local RunButton = Instance.new("TextButton")
RunButton.Size = UDim2.new(1,0,0,60)
RunButton.Position = CrouchKF and UDim2.new(0,0,0,60) or UDim2.new(0,0,0,0)
RunButton.BackgroundColor3 = Color3.fromRGB(0,170,255)
RunButton.TextColor3 = Color3.new(1,1,1)
RunButton.Font = Enum.Font.GothamBold
RunButton.TextSize = 22
RunButton.Text = "RUN MODE: OFF"
RunButton.Parent = Frame

RunButton.MouseButton1Click:Connect(function()
    RunMode = not RunMode
    RunButton.Text = "RUN MODE: " .. (RunMode and "ON" or "OFF")
    RunButton.BackgroundColor3 = RunMode and Color3.fromRGB(0,255,0) or Color3.fromRGB(0,170,255)
end)

-- PERFECT IDLE FIX: Animation logic
RunService.RenderStepped:Connect(function()
    if not Character or not Character:FindFirstChild("Humanoid") then return end
    local hum = Humanoid
    local moving = hum.MoveDirection.Magnitude > 0
    local inAir = hum.FloorMaterial == Enum.Material.Air
    local sitting = hum.Sit

    -- Priority order (highest first)
    if sitting then
        Play(SitKF, true)

    elseif inAir then
        Play(JumpKF, false)

    elseif CrouchMode and CrouchKF then
        Play(CrouchKF, true)

    elseif RunMode and RunKF then
        Play(RunKF, true)

    elseif moving then
        Play(WalkKF, true)

    else
        -- YOU ARE STANDING STILL â†’ FORCE IDLE (FIXED!)
        Play(IdleKF, true)
    end
end)

-- Respawn
Player.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
end)

game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Anim Player by CrypticCoderX",
    Text = "This script detects If the model has a run or crouch or slide/walk/idle/jump anim",
    Duration = 12
})

print("IMAO")
