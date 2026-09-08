-- OceanHub v2.0.0
-- Internal Build V4

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

repeat task.wait() until player.Character
repeat task.wait() until player.Character:FindFirstChild("HumanoidRootPart")

--------------------------------------------------
-- WINDOW
--------------------------------------------------

local Window = WindUI:CreateWindow({
Title="OceanHub v2.0.0",
Icon="droplet",
Author="by Diederikjande2e",
Size=UDim2.fromOffset(620,480),
Theme="Dark"
})

--------------------------------------------------
-- TOGGLE UI
--------------------------------------------------

UIS.InputBegan:Connect(function(key)

if key.KeyCode==Enum.KeyCode.RightShift then
Window:Toggle()
end

end)

--------------------------------------------------
-- TABS
--------------------------------------------------

local PlayerTab = Window:Tab({Title="Player",Icon="user"})
local CombatTab = Window:Tab({Title="Combat",Icon="crosshair"})
local VisualTab = Window:Tab({Title="Visuals",Icon="eye"})
local MovementTab = Window:Tab({Title="Movement",Icon="zap"})
local PlayersTab = Window:Tab({Title="Players",Icon="users"})
local WorldTab = Window:Tab({Title="World",Icon="globe"})
local ToolsTab = Window:Tab({Title="Tools",Icon="tool"})
local ServerTab = Window:Tab({Title="Server",Icon="server"})
local SettingsTab = Window:Tab({Title="Settings",Icon="settings"})

--------------------------------------------------
-- PLAYER TAB
--------------------------------------------------

PlayerTab:Slider({
Title="WalkSpeed",
Value={Min=16,Max=200,Default=16},
Callback=function(v)
player.Character.Humanoid.WalkSpeed=v
end
})

PlayerTab:Slider({
Title="JumpPower",
Value={Min=50,Max=200,Default=50},
Callback=function(v)
player.Character.Humanoid.JumpPower=v
end
})

PlayerTab:Button({
Title="Reset Character",
Callback=function()
player.Character:BreakJoints()
end
})

--------------------------------------------------
-- AIMBOT
--------------------------------------------------

local aimbot=false
local magnet=false

CombatTab:Toggle({
Title="Aimbot",
Callback=function(v)
aimbot=v
end
})

CombatTab:Toggle({
Title="Magnet Aim",
Callback=function(v)
magnet=v
end
})

RunService.RenderStepped:Connect(function()

if not aimbot then return end

local closest=nil
local dist=math.huge

for _,plr in pairs(Players:GetPlayers()) do

if plr~=player and plr.Character and plr.Character:FindFirstChild("Head") then

local mag=(player.Character.HumanoidRootPart.Position-plr.Character.Head.Position).Magnitude

if mag<dist then
dist=mag
closest=plr.Character.Head
end

end
end

if closest then
camera.CFrame=CFrame.new(camera.CFrame.Position,closest.Position)
end

end)

--------------------------------------------------
-- FOV
--------------------------------------------------

local FOV=Drawing.new("Circle")
FOV.Visible=false
FOV.Radius=150
FOV.Thickness=2
FOV.Color=Color3.fromRGB(0,170,255)

CombatTab:Toggle({
Title="FOV Circle",
Callback=function(v)
FOV.Visible=v
end
})

RunService.RenderStepped:Connect(function()
FOV.Position=Vector2.new(camera.ViewportSize.X/2,camera.ViewportSize.Y/2)
end)

--------------------------------------------------
-- ESP
--------------------------------------------------

local esp=false

VisualTab:Toggle({
Title="Player ESP",
Callback=function(v)

esp=v

if not v then
for _,plr in pairs(Players:GetPlayers()) do
if plr.Character and plr.Character:FindFirstChild("OceanESP") then
plr.Character.OceanESP:Destroy()
end
end
end

end
})

RunService.RenderStepped:Connect(function()

if not esp then return end

for _,plr in pairs(Players:GetPlayers()) do

if plr~=player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then

local hrp=plr.Character.HumanoidRootPart
local hum=plr.Character:FindFirstChild("Humanoid")

if not hrp:FindFirstChild("OceanESP") then

local gui=Instance.new("BillboardGui")
gui.Name="OceanESP"
gui.Size=UDim2.new(0,200,0,50)
gui.AlwaysOnTop=true
gui.Parent=hrp

local txt=Instance.new("TextLabel")
txt.Size=UDim2.new(1,0,1,0)
txt.BackgroundTransparency=1
txt.TextColor3=Color3.fromRGB(0,170,255)
txt.TextScaled=true
txt.Font=Enum.Font.SourceSansBold
txt.Parent=gui

end

local dist=(player.Character.HumanoidRootPart.Position-hrp.Position).Magnitude
local hp=hum and math.floor(hum.Health) or 0

hrp.OceanESP.TextLabel.Text=
plr.Name..
"\nHP: "..hp..
"\nDist: "..math.floor(dist)

end
end
end)

--------------------------------------------------
-- MOVEMENT
--------------------------------------------------

local infjump=false
local noclip=false

MovementTab:Toggle({
Title="Infinite Jump",
Callback=function(v)
infjump=v
end
})

UIS.JumpRequest:Connect(function()
if infjump then
player.Character.Humanoid:ChangeState("Jumping")
end
end)

MovementTab:Toggle({
Title="Noclip",
Callback=function(v)
noclip=v
end
})

RunService.Stepped:Connect(function()

if noclip then

for _,v in pairs(player.Character:GetDescendants()) do
if v:IsA("BasePart") then
v.CanCollide=false
end
end

end

end)

--------------------------------------------------
-- BETTER FLY
--------------------------------------------------

local flying=false
local speed=60
local bv,bg

MovementTab:Slider({
Title="Fly Speed",
Value={Min=10,Max=200,Default=60},
Callback=function(v)
speed=v
end
})

MovementTab:Toggle({
Title="Fly",
Callback=function(v)

flying=v

if v then

local hrp=player.Character.HumanoidRootPart

bv=Instance.new("BodyVelocity")
bg=Instance.new("BodyGyro")

bv.MaxForce=Vector3.new(1e5,1e5,1e5)
bg.MaxTorque=Vector3.new(1e5,1e5,1e5)

bv.Parent=hrp
bg.Parent=hrp

else

bv:Destroy()
bg:Destroy()

end

end
})

RunService.RenderStepped:Connect(function()

if not flying then return end

local cam=workspace.CurrentCamera
local move=Vector3.zero

if UIS:IsKeyDown(Enum.KeyCode.W) then move+=cam.CFrame.LookVector end
if UIS:IsKeyDown(Enum.KeyCode.S) then move-=cam.CFrame.LookVector end
if UIS:IsKeyDown(Enum.KeyCode.A) then move-=cam.CFrame.RightVector end
if UIS:IsKeyDown(Enum.KeyCode.D) then move+=cam.CFrame.RightVector end

bv.Velocity=move*speed
bg.CFrame=cam.CFrame

end)

--------------------------------------------------
-- PLAYERS TAB
--------------------------------------------------

local names={}
for _,p in pairs(Players:GetPlayers()) do
table.insert(names,p.Name)
end

local selected=nil

PlayersTab:Dropdown({
Title="Select Player",
Values=names,
Callback=function(v)
selected=v
end
})

PlayersTab:Button({
Title="Teleport To Player",
Callback=function()

local target=Players:FindFirstChild(selected)

if target and target.Character then
player.Character:MoveTo(target.Character.HumanoidRootPart.Position)
end

end
})

PlayersTab:Button({
Title="View Player",
Callback=function()

local target=Players:FindFirstChild(selected)

if target and target.Character then
camera.CameraSubject=target.Character.Humanoid
end

end
})

PlayersTab:Button({
Title="Unview Player",
Callback=function()
camera.CameraSubject=player.Character.Humanoid
end
})

--------------------------------------------------
-- TOOLS
--------------------------------------------------

ToolsTab:Button({
Title="Give Click Teleport Tool",
Callback=function()

local tool=Instance.new("Tool")
tool.RequiresHandle=false
tool.Name="Click TP"
tool.Parent=player.Backpack

tool.Activated:Connect(function()

local mouse=player:GetMouse()
player.Character:MoveTo(mouse.Hit.Position+Vector3.new(0,5,0))

end)

end
})

--------------------------------------------------
-- WORLD
--------------------------------------------------

WorldTab:Button({
Title="FPS Boost",
Callback=function()

for _,v in pairs(workspace:GetDescendants()) do

if v:IsA("BasePart") then
v.Material=Enum.Material.Plastic
end

if v:IsA("Decal") then
v.Transparency=1
end

end

Lighting.GlobalShadows=false

end
})

--------------------------------------------------
-- SERVER
--------------------------------------------------

ServerTab:Button({
Title="Rejoin",
Callback=function()
TeleportService:Teleport(game.PlaceId,player)
end
})

--------------------------------------------------
-- SETTINGS
--------------------------------------------------

SettingsTab:Toggle({
Title="Light Mode",
Callback=function(v)

if v then
Window:SetTheme("Light")
else
Window:SetTheme("Dark")
end

end
})

SettingsTab:Button({
Title="Save Config",
Callback=function()

if writefile then
writefile("OceanHubConfig.txt","Saved")
end

end
})

SettingsTab:Button({
Title="Destroy GUI",
Callback=function()
WindUI:Destroy()
end
})