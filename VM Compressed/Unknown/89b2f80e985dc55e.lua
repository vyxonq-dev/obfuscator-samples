- This file was protected with DeltaTeam
local L=loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua",true))()
local P=game:GetService("Players")
local T=game:GetService("TeleportService")
local R=game:GetService("RunService")
local U=game:GetService("UserInputService")
local S=game:GetService("TweenService")
local lp=P.LocalPlayer
local w=L:CreateWindow({Name="XG.Hub - Manual Kill",Subtitle="by Lxnny",LogoID="82795327169782",LoadingEnabled=true,LoadingTitle="XG.Hub Loading",LoadingSubtitle="Carregando funções...",ConfigSettings={RootFolder=nil,ConfigFolder="XGHubManualKill"},KeySystem=false})
local mT=w:CreateTab({Name="Functions",Icon="build",ImageSource="Material",ShowTitle=true})
local uT=w:CreateTab({Name="Universal Scripts",Icon="extension",ImageSource="Material",ShowTitle=true})
local oT=w:CreateTab({Name="More (in development)",Icon="build_circle",ImageSource="Material",ShowTitle=true})
local a=false
local b=false
local c=false
local conn
local function d(cC)local h=cC:FindFirstChildOfClass("Humanoid")if not h then return end if conn then conn:Disconnect()conn=nil end local lH=h.Health conn=h.HealthChanged:Connect(function(nH)if not a then return end if nH<lH and nH>0 then task.spawn(function()task.wait(0.1)if lp.Character then lp:LoadCharacter()end end)end lH=nH end)end
lp.CharacterAdded:Connect(d)
if lp.Character then d(lp.Character)end
local function e()while b do local s,e=pcall(function()U.MouseButton2Down:Fire()task.wait(0.1)U.MouseButton2Up:Fire()end)task.wait(0.3)end end
local function f()while c do for i=1,4 do local k=tostring(i)U:SetKeyDown(Enum.KeyCode[k])task.wait(0.1)U:SetKeyUp(Enum.KeyCode[k])task.wait(0.1)end end end
mT:CreateToggle({Name="Auto Reset",Description="Automatically resets when taking damage",StartingState=false,Callback=function(s)a=s if s then if lp.Character then d(lp.Character)end else if conn then conn:Disconnect()conn=nil end end end})
mT:CreateToggle({Name="Auto Punch",Description="Automatically punches (right mouse button)",StartingState=false,Callback=function(s)b=s if s then task.spawn(e)end end})
mT:CreateToggle({Name="Spam Skills (1,2,3,4)",Description="Spams keys 1 to 4 repeatedly",StartingState=false,Callback=function(s)c=s if s then task.spawn(f)end end})
mT:CreateButton({Name="Rejoin Game",Description="Rejoins the current game server",Callback=function()T:TeleportToPlaceInstance(game.PlaceId,game.JobId,lp)end})
mT:CreateButton({Name="Set Respawn Point",Description="Sets your spawn point at current position",Callback=function()local ch=lp.Character if ch and ch:FindFirstChild("HumanoidRootPart")then local hrp=ch.HumanoidRootPart lp:SetAttribute("SpawnPoint",hrp.Position)w:Notify({Title="Respawn Point Set",Text="Your spawn point was saved at your current position.",Duration=3})else w:Notify({Title="Error",Text="Character or HumanoidRootPart not found.",Duration=3})end end})
mT:CreateButton({Name="Teleport to Mountain",Description="Teleports you to the mountain (371, 440, 443)",Callback=function()local ch=lp.Character if ch and ch:FindFirstChild("HumanoidRootPart")then ch.HumanoidRootPart.CFrame=CFrame.new(371,440,443)else w:Notify({Title="Error",Text="Character or HumanoidRootPart not found.",Duration=3})end end})
uT:CreateSection("Popular Scripts")
uT:CreateButton({Name="Infinite Yield",Description="Executes Infinite Yield",Callback=function()loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-43437"))()end})
uT:CreateButton({Name="CMD-X",Description="Executes CMD-X",Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()end})
oT:CreateSection("More features coming soon!")
oT:CreateButton({Name="See Ya On My Next UPD!",Description="This script is under development",Callback=function()w:Notify({Title="Coming Soon!",Text="This Script is under development",Duration=3})end})
return w