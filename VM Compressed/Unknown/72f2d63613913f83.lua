-- by oldhacfard
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("oldhacfards reanimate script / coolkid forsaken")

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Myworld-reanimate-oldhacfards-reanimation-script-V2-92186"))()
task.wait("5")

local PRIVATE_MODEL_ID = 136355899792063 -- DEĞİŞTİR MODEL ID

-- Notification
game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Anim System",
    Text = "Loading animations...",
    Duration = 5
})

-- Load Animator6D
if not getgenv().Animator6DLoadedPro then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Stuff/refs/heads/main/Animator6D.lua"))()
    repeat task.wait() until getgenv().Animator6DLoadedPro
end

-- Services
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Load model
local success, model = pcall(function()
    return game:GetObjects("rbxassetid://"..PRIVATE_MODEL_ID)[1]
end)
if not success or not model then
    error("Model load failed")
end

-- Tarama (KeyframeSequence ve Animation)
local AllKFSeq = {}

local function scan(obj)
    if obj:IsA("KeyframeSequence") or obj:IsA("Animation") then
        table.insert(AllKFSeq,obj)
    end
    for _,v in pairs(obj:GetChildren()) do
        scan(v)
    end
end
scan(model)

if #AllKFSeq == 0 then 
    warn("No animations found! Make sure the model contains KeyframeSequence or Animation objects.")
end

-- Animasyonları otomatik ayarla
local IdleKF, WalkKF, RunKF, JumpKF, SitKF, CrouchKF, PunchKF
IdleKF = AllKFSeq[1]
WalkKF = AllKFSeq[1]
JumpKF = AllKFSeq[1]
SitKF  = AllKFSeq[1]

for _,anim in ipairs(AllKFSeq) do
    local n = anim.Name:lower()
    if n:find("run") then RunKF = anim
    elseif n:find("walk") then WalkKF = anim
    elseif n:find("jump") then JumpKF = anim
    elseif n:find("idle") then IdleKF = anim
    elseif n:find("sit") then SitKF = anim
    elseif n:find("crouch") or n:find("slide") then CrouchKF = anim
    elseif n:find("punch") then PunchKF = anim
    end
end

-- Durum değişkenleri
local RunMode = false
local CrouchMode = false
local Punching = false
local currentAnim

-- Anim oynatma fonksiyonu
local function Play(kf, looped)
    if currentAnim == kf or Punching then return end
    getgenv().Animator6DStop()
    task.wait(0.03)
    getgenv().Animator6D(kf,1,looped ~= false)
    currentAnim = kf
end

-- Punch oynatma
local function PlayPunch()
    if not PunchKF or Punching then return end
    Punching = true
    getgenv().Animator6DStop()
    task.wait(0.02)
    getgenv().Animator6D(PunchKF,1,false)
    task.delay(0.7,function()
        Punching = false
    end)
end

---------------------------
-- ScreenGui ve Frame
---------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0,240,0,150)
Frame.Position = UDim2.new(0,20,0.5,-75)
Frame.BackgroundTransparency = 0.2
Frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
Frame.Parent = ScreenGui

-- RUN Button
local RunButton = Instance.new("TextButton")
RunButton.Size = UDim2.new(1,0,0,50)
RunButton.Position = UDim2.new(0,0,0,0)
RunButton.BackgroundColor3 = Color3.fromRGB(0,150,255)
RunButton.Text = "RUN: OFF"
RunButton.Font = Enum.Font.GothamBold
RunButton.TextSize = 20
RunButton.TextColor3 = Color3.new(1,1,1)
RunButton.Parent = Frame

RunButton.MouseButton1Click:Connect(function()
    RunMode = not RunMode
    RunButton.Text = "RUN: "..(RunMode and "ON" or "OFF")
    RunButton.BackgroundColor3 = RunMode and Color3.fromRGB(0,200,0) or Color3.fromRGB(0,150,255)
end)

-- CROUCH Button
if CrouchKF then
    local CrouchButton = Instance.new("TextButton")
    CrouchButton.Size = UDim2.new(1,0,0,50)
    CrouchButton.Position = UDim2.new(0,0,0,55)
    CrouchButton.BackgroundColor3 = Color3.fromRGB(200,80,80)
    CrouchButton.Text = "CROUCH: OFF"
    CrouchButton.Font = Enum.Font.GothamBold
    CrouchButton.TextSize = 18
    CrouchButton.TextColor3 = Color3.new(1,1,1)
    CrouchButton.Parent = Frame

    CrouchButton.MouseButton1Click:Connect(function()
        CrouchMode = not CrouchMode
        CrouchButton.Text = "CROUCH: "..(CrouchMode and "ON" or "OFF")
        CrouchButton.BackgroundColor3 = CrouchMode and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,80,80)
    end)
end

---------------------------
-- PUNCH Button (Frame içinde, modern)
---------------------------
if PunchKF then
    local PunchButton = Instance.new("ImageButton")
    PunchButton.Name = "PunchButton"
    PunchButton.Size = UDim2.new(0,60,0,60)
    PunchButton.Position = UDim2.new(1,-10,1,-10) -- Frame içinde sağ alt
    PunchButton.AnchorPoint = Vector2.new(1,1)
    PunchButton.BackgroundColor3 = Color3.fromRGB(255,50,50)
    PunchButton.BorderSizePixel = 0
    PunchButton.AutoButtonColor = true
    PunchButton.Image = "rbxassetid://86762085459173"
    PunchButton.ScaleType = Enum.ScaleType.Fit
    PunchButton.Parent = Frame

    -- Hover efekti
    PunchButton.MouseEnter:Connect(function()
        PunchButton.BackgroundColor3 = Color3.fromRGB(255,80,80)
    end)
    PunchButton.MouseLeave:Connect(function()
        PunchButton.BackgroundColor3 = Color3.fromRGB(255,50,50)
    end)

    PunchButton.MouseButton1Click:Connect(function()
        PlayPunch()
    end)
end

---------------------------
-- Main Loop
---------------------------
RunService.RenderStepped:Connect(function()
    if not Humanoid then return end
    if Punching then return end

    local moving = Humanoid.MoveDirection.Magnitude > 0
    local inAir = Humanoid.FloorMaterial == Enum.Material.Air
    local sitting = Humanoid.Sit

    if sitting then
        Play(SitKF,true)
    elseif inAir then
        Play(JumpKF,false)
    elseif CrouchMode and CrouchKF then
        Play(CrouchKF,true)
    elseif RunMode and RunKF then
        Play(RunKF,true)
    elseif moving then
        Play(WalkKF,true)
    else
        Play(IdleKF,true)
    end
end)

-- Respawn fix
Player.CharacterAdded:Connect(function(char)
    Character = char
    Humanoid = char:WaitForChild("Humanoid")
end)


loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB",true))()
