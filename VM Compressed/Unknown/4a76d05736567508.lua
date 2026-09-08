-- I KNOW YOU GONNA STEAL THIS YOU NIGGER GET A JOB SYBAU
local StarterGui = game:GetService("StarterGui")
local function sendNotification(title, text)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 10,
    })
end

-- NIGGER
loadstring(game:HttpGet("https://raw.githubusercontent.com/banishercool/banishercool/refs/heads/main/Green%20Baseplate%20Reanimate.lua.txt"))()

-- NIGGER
sendNotification("Logs", "Made by Scripterblabla (NEVER UPDATE LOL)")
task.wait(1.5)
sendNotification("Status", "Wait for A seconds for the Reanimate Script to finish")

-- NIGGER
task.wait(5) 

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()


for _, part in pairs(Character:GetChildren()) do
    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
        part.CanCollide = false 
        part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
    end
end

local Torso = Character:FindFirstChild("Torso")
if Torso then
    local LeftHip = Torso:FindFirstChild("Left Hip")
    if LeftHip and LeftHip:IsA("Motor6D") then
        LeftHip.CurrentAngle = 0
    end
end

local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Backpack = Player:WaitForChild("Backpack")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local defaultAnimate = Character:FindFirstChild("Animate")
if defaultAnimate then
    defaultAnimate.Disabled = true
end
for _, track in pairs(Humanoid:GetPlayingAnimationTracks()) do
    track:Stop()
end

local IT = Instance.new
local V3 = Vector3.new
local CF = CFrame.new

local IsDancing = false
local currentAnim = nil

if not getgenv().Animator6D or not getgenv().Animator6DStop then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Stuff/refs/heads/main/Animator6D.lua"))()
end

local Head = Character:WaitForChild("Head", 5) 
if Head then
    RunService.RenderStepped:Connect(function(dt)
        local alpha = function(n) return math.clamp(n * dt * 60, 0, 1) end
        Humanoid.CameraOffset = Humanoid.CameraOffset:Lerp(
            (RootPart.CFrame * CF(0, 1.5, 0)):PointToObjectSpace(Head.Position),
            alpha(0.15)
        )
    end)
end

local EffectFolder = Character:FindFirstChild("EffectFolder") or IT("Folder")
EffectFolder.Name = "EffectFolder"
EffectFolder.Parent = Character

local mesh = IT("SpecialMesh", EffectFolder)
mesh.MeshId = "rbxassetid://1439035575"
mesh.TextureId = "rbxassetid://1439035619"
mesh.Scale = V3(1, 1, 1.5)
mesh.Offset = V3(0, -0.4, 0)

local Music19 = IT("Sound", EffectFolder)
Music19.Name = "Fright Funk"
Music19.Volume = 0.7
Music19.Looped = true

local theme = IT("Sound", SoundService)
theme.Name = "THEME"
theme.SoundId = getcustomasset("Epik Musics/Friday Theme.mp3") 
theme.Volume = 0.75
theme.Looped = true
theme:Play()

local AnimPaths = {}
pcall(function()
    local pack = game:GetObjects("rbxassetid://11405076389")[1].R6["Run + Walk + Jump + Fall R6"]
    local folder = pack:FindFirstChild("AnimSaves")
    AnimPaths.Walk = folder:FindFirstChild("Walk V4")
    AnimPaths.Jump = folder:FindFirstChild("Jump V2")
end)
pcall(function() AnimPaths.Idle = game:GetObjects("rbxassetid://16600175853")[1].AnimSaves:FindFirstChild("Idle 7") end)
pcall(function() AnimPaths.Sit = game:GetObjects("rbxassetid://12452064144")[1]["R6 Animation Rig"].AnimSaves:FindFirstChild("SITTING") end)

local PlayerAnims = {
    Idle = {KFS = AnimPaths.Idle, IsPlaying = false},
    Walk = {KFS = AnimPaths.Walk, IsPlaying = false},
    Jump = {KFS = AnimPaths.Jump, IsPlaying = false},
    Sit  = {KFS = AnimPaths.Sit,  IsPlaying = false},
}

local function playAnim(animName, looped)
    if currentAnim == animName then return end
    if getgenv().Animator6DStop then getgenv().Animator6DStop() end
    local anim = PlayerAnims[animName]
    if anim and anim.KFS then
        for _, v in pairs(PlayerAnims) do v.IsPlaying = false end
        anim.IsPlaying = true
        currentAnim = animName
        getgenv().Animator6D(anim.KFS, 1, looped or false)
    end
end

playAnim("Idle", true)

local tool19 = IT("Tool")
tool19.Name = "FE Jun Fight"
tool19.RequiresHandle = false
tool19.Parent = Backpack

if not isfile("Shinji's and juns Final battle Song.mp3") then
    pcall(function()
        writefile("Shinji's and juns Final battle Song.mp3", game:HttpGet("https://github.com/EpicFire8/Music/raw/refs/heads/main/Shinji's%20and%20juns%20Final%20battle%20Song.mp3"))
    end)
end

local animthingy26
pcall(function()
    local model = game:GetObjects("rbxassetid://75515993534839")[1]
    if model then animthingy26 = model.AnimSaves:WaitForChild("iDK anymore", 5) end
end)

tool19.Equipped:Connect(function()
    if Character then
        IsDancing = true
        theme:Stop()
        Humanoid.WalkSpeed = 0
        if animthingy26 then getgenv().Animator6D(animthingy26, 1, true)
        else playAnim("Idle", true) end
        Music19.Parent = Character
        Music19.SoundId = getcustomasset("Shinji's and juns Final battle Song.mp3")
        Music19:Play()
    end
end)

tool19.Unequipped:Connect(function()
    if Music19.Parent == Character and Music19.Playing then
        Humanoid.WalkSpeed = 16
        IsDancing = false
        if getgenv().Animator6DStop then getgenv().Animator6DStop() end
        theme:Play()
        Music19:Stop()
        Music19.Parent = EffectFolder
        playAnim("Idle", true)
    end
end)

Humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
    if IsDancing then return end
    if Humanoid.MoveDirection.Magnitude > 0 then playAnim("Walk", true) else playAnim("Idle", true) end
end)

