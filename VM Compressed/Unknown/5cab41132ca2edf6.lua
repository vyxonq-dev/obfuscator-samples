
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ZRXLoader"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.fromScale(1,1)
bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
bg.BackgroundTransparency = 1

local txt = Instance.new("TextLabel", bg)
txt.Size = UDim2.fromScale(1,1)
txt.BackgroundTransparency = 1
txt.TextScaled = true
txt.Font = Enum.Font.GothamBlack
txt.TextColor3 = Color3.fromRGB(255,255,255)
txt.TextTransparency = 1
txt.Text = "ZRX HUB V2.7\n\nالمطورين:\nMohammed و Hashem"
local sound = Instance.new("Sound")
sound.Parent = SoundService
sound.SoundId = "rbxassetid://9118823101"
sound.Volume = 10
sound:Play()

TweenService:Create(bg, TweenInfo.new(0.6), {BackgroundTransparency = 0}):Play()
TweenService:Create(txt, TweenInfo.new(0.8), {TextTransparency = 0}):Play()

task.wait(2.5)

TweenService:Create(txt, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
TweenService:Create(bg, TweenInfo.new(0.6), {BackgroundTransparency = 1}):Play()

task.wait(0.7)
gui:Destroy()

game.StarterGui:SetCore("SendNotification", {
Title = "ZRX HUB",
Text = "تم التفعيل بنجاح",
Duration = 5
})

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
Name = "ZRX HUB V2.7",
LoadingTitle = "ZRX HUB",
LoadingSubtitle = "ARAB TEAM",
ConfigurationSaving = { Enabled = false },
KeySystem = false
})
local Tab1 = Window:CreateTab("Scripts", 4483362458)
local Tab2 = Window:CreateTab("Anti Features", 4483362458)
local Tab3 = Window:CreateTab("Game Scripts", 4483362458)
local Tab4 = Window:CreateTab("Fun", 4483362458)
local Tab5 = Window:CreateTab("Control", 4483362458)
local Tab6 = Window:CreateTab("Movements", 4483362458)
-- سكربتات
Tab1:CreateButton({Name="Brookhaven Hub",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-BRUTON-HUB-96126"))()
end})

Tab1:CreateButton({Name="ALFA IRAQ",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ALFA-IRAQ-34036"))()
end})

Tab1:CreateButton({Name="VR7 Script",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-VR7-45290"))()
end})

Tab1:CreateButton({Name="Mickey Chat",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Mickey-Chat-85762"))()
end})

Tab1:CreateButton({Name="Invisible Floating",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Floating-Invisible-OPEN-SOURCE-REMAKE-75225"))()
end})

Tab1:CreateButton({Name="MHDi Iraq",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-MHDi-Iraq-54898"))()
end})

Tab1:CreateButton({Name="Ghost",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ghost-51951"))()
end})

Tab1:CreateButton({Name="Fly v3",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fly-v3-64434"))()
end})

Tab1:CreateButton({Name="Walking on air ",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-No-Obby-103791"))()
end})

Tab1:CreateButton({Name="Yura Hub",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Yura-Hub-53300"))()
end})
Tab1:CreateButton({
    Name = "Copy skins | LA HUB",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-LA-HUB-51930"))()
    end
})
-- مضادات
local antiSit=false
local antiFreeze=false
local antiFling=false

Tab2:CreateToggle({Name="Anti Sit",Callback=function(v) antiSit=v end})
Tab2:CreateToggle({Name="Anti Freeze",Callback=function(v) antiFreeze=v end})
Tab2:CreateToggle({Name="Anti Fling",Callback=function(v) antiFling=v end})

RunService.Stepped:Connect(function()
local c=player.Character
if c and c:FindFirstChild("Humanoid") then
if antiSit then c.Humanoid.Sit=false end
if antiFreeze and c:FindFirstChild("HumanoidRootPart") then
c.HumanoidRootPart.Anchored=false end
end
if antiFling and c and c:FindFirstChild("HumanoidRootPart") then
c.HumanoidRootPart.AssemblyLinearVelocity=Vector3.zero
c.HumanoidRootPart.AssemblyAngularVelocity=Vector3.zero
end
end)

-- سكربتات مابات
Tab3:CreateButton({Name="MM2",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Guerra-de-Torres-XHUB-16217"))()
end})

Tab3:CreateButton({Name="He escaped a disaster ",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zamaflingv1-70322"))()
end})

Tab3:CreateButton({Name="The Strongest Battlegrounds",Callback=function()
loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Trashcanman-31001"))()
end})

Tab3:CreateButton({
    Name = "Blox Fruits - Orange Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/HieuDepTrai-Z/Dev_Orange/refs/heads/main/OrangeHub.lua"))()
    end
})
Tab3:CreateButton({
    Name = "Auto Clicker A12",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/theghost211/Auto-Clicker/refs/heads/main/AutoclikcerA12"))()
    end
})
Tab3:CreateButton({
    Name = "Blue Lock ⚽",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/IGAGURI-Blue-Lock:-Rivals-Ball-Control-35653"))()
    end
})

-- متعة
Tab4:CreateButton({Name="Infinite Jump",Callback=function()
UserInputService.JumpRequest:Connect(function()
player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)
end})

Tab4:CreateButton({Name="Low Gravity",Callback=function()
workspace.Gravity=50
end})

Tab4:CreateButton({Name="High Gravity",Callback=function()
workspace.Gravity=350
end})

-- حركات
local noclip=false
Tab6:CreateToggle({Name="NoClip",Callback=function(v) noclip=v end})

RunService.Stepped:Connect(function()
if noclip and player.Character then
for _,v in pairs(player.Character:GetDescendants()) do
if v:IsA("BasePart") then v.CanCollide=false end
end end end)

local spin=false
Tab6:CreateToggle({Name="Spin",Callback=function(v)
spin=v
while spin do
player.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0,math.rad(10),0)
task.wait()
end end})

Tab6:CreateButton({Name="sit",Callback=function()
player.Character.Humanoid.Sit=true
end})

-- تحكم
Tab5:CreateSlider({
Name="speed",Range={0,500},Increment=1,CurrentValue=16,
Callback=function(v) player.Character.Humanoid.WalkSpeed=v end})

Tab5:CreateSlider({
Name="Jump power",Range={0,500},Increment=1,CurrentValue=50,
Callback=function(v) player.Character.Humanoid.JumpPower=v end})