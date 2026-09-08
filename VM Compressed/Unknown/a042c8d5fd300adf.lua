--[[

Your Variables and global variables

]]--



--[[ You can change this ]]--
AuthorKey = "Nexer"
GameKey = "Limbus Game"

--[[ Don't change this ]]--
local LocalPlayer, LP = game:GetService("Players").LocalPlayer, game:GetService("Players").LocalPlayer
local Character, Char
local HumanoidRootPart, HRP
local Humanoid, Hum
pcall(function()
Character, Char = LocalPlayer.Character, LocalPlayer.Character
end)
pcall(function()
HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
end)
pcall(function()
Humanoid, Hum = Character.Humanoid, Character.Humanoid
end)
LocalPlayer.CharacterAdded:Connect(function(char)
pcall(function()
Character, Char = nil, nil
HumanoidRootPart, HRP = nil, nil
Humanoid, Hum = nil, nil
task.wait()
Character, Char = char, char
repeat task.wait() until char:FindFirstChild("HumanoidRootPart")
HumanoidRootPart, HRP = char.HumanoidRootPart, char.HumanoidRootPart
repeat task.wait() until Character:FindFirstChild("Humanoid")
Humanoid, Hum = char.Humanoid, char.Humanoid
end)
end)





--[[

Loading Part ( mainmodule and rayfield )

]]--



function CreateMessage(a)
local instancename = (a=="Message" and a) or "Hint"
local msg = Instance.new(instancename,game:GetService("CoreGui"))
msg.Text = ""
return msg
end

--[[ Loading my module ]]--
local msg = CreateMessage()
msg.Text = "Loading API Module... (0/1)"
local loadmoduleattempt = 0
local Module = nil
repeat task.wait()
local lodsuc, loderr = pcall(function()
Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/Global-Module.luau"))()
end)
if not lodsuc then
loadmoduleattempt += 1
msg.Text = "Failed loading API Module, re-trying... ( Attempt "..tostring(loadmoduleattempt).." )"
task.wait(1)
elseif lodsuc and Module.IsWorking ~= nil then
msg.Text = "Loading API Module... (1/1)"
task.wait(1)
else
loadmoduleattempt += 1
msg.Text = "Failed loading API Module, re-trying... ( Attempt "..tostring(loadmoduleattempt).." )"
task.wait(1)
end
until msg.Text == "Loading API Module... (1/1)"
task.wait(1)
msg.Text = "Launching Rayfield..."
--[[ Loading rayfield here ]] --
local Rayfield = Module:GetWorkingRayfield()
task.delay(2,function()
msg:Destroy()
end)

--[[ Re-writing variables ]]--
AuthorKey = ""..((AuthorKey ~= nil and AuthorKey) or "Unknown")..""
GameKey = ""..((GameKey ~= nil and GameKey) or "Unknown")..""


--[[ Creating Window ]]--
local Window = Rayfield:CreateWindow({
   Name = ""..AuthorKey.." Hub : "..GameKey.."",
   Icon = 0,    
   LoadingTitle = ""..string.sub(AuthorKey,1,1).."H:"..GameKey:gsub("(%S)%S+","%1"):gsub("%s+","").."",
   LoadingSubtitle = "By "..AuthorKey.."",
   Theme = "AmberGlow",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "",
      FileName = ""
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Verify yourself firstly!",
      Subtitle = "Key Needed!",
      Note = "The key is ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})


--[[ Additional Connections Handler ]]--
local rs = game:GetService("RunService")
local Heartbeat = {}
local rscon = rs.Heartbeat:Connect(function()
for i,v in next, Heartbeat do
if v~=nil then
task.spawn(v)
end
end
end)
local TaskTick = {}
task.spawn(function()
while task.wait() do
for i,v in next, TaskTick do
if v~=nil then
task.spawn(v)
end
end
end
end)
local PropertyBeat = {}
function PropertyBeatSet(name,method,ins,pa,func)
if (method=="Add" or method=="Set" or method=="SetBeat" or method=="AddBeat") then
PropertyBeat[name] = instance:GetPropertyChangedSignal(pa):Connect(function()
task.spawn(func)
end)
end
if (method=="Remove" or method=="Delete" or method=="DeleteBeat" or method=="RemoveBeat") and PropertyBeat[name]~=nil then
PropertyBeat[name]:Disconnect()
PropertyBeat[name] = nil
end
end
local AttributeBeat = {}
function AttributeBeatSet(name,method,ins,pa,func)
if (method=="Add" or method=="Set" or method=="SetBeat" or method=="AddBeat") then
AttributeBeat[name] = ins:GetAttributeChangedSignal(pa):Connect(function()
task.spawn(func)
end)
end
if (method=="Remove" or method=="Delete" or method=="DeleteBeat" or method=="RemoveBeat") and AttributeBeat[name]~=nil then
AttributeBeat[name]:Disconnect()
AttributeBeat[name] = nil
end
end
--upconnections: heartbeat, propertybeat, attributebeat, tasktick



--[[

Tabs And Main Functions

]]--



local Announcements = Window:CreateTab("Announce",0)
Announcements:CreateParagraph({Title = "Hi there!", Content = "Script Version: 1.0 ( WORK IN PROGRESS, EXCEPT A LOT OF BUGS )\n\Thank you for using my script.\n\nAlso join our discord server for announcements, early updates, and just for funsies..."})
Announcements:CreateButton({Name = "Copy Discord Server Link"; Callback = function()
setclipboard(tostring("https://discord.gg/7u5GRNw3xn"))
Notification("Success!", "Copied Link!", 3, true)
end; })
local ClosestHRP = nil
local AutoTurn = false
local AutoTracer = false
local Range = 140
Heartbeat.AutoTracer = function()
if AutoTracer ~= true then return end
pcall(function()
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
task.wait(.5)
end
local mag = (ClosestHRP.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
local vel = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity
if mag > Range then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
elseif mag < 32 then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = (((ClosestHRP.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Unit) * (mag * 10))
elseif mag < 140 then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = (((ClosestHRP.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Unit) * (mag * 13))
else
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
end
game:GetService("RunService").RenderStepped:Wait()
if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
end
end)
end
function IsNormal(v)
if v and v:FindFirstChild("Head") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChildOfClass("Humanoid") then
return true
end
return false
end
Heartbeat.ClosestPlayer = function()
pcall(function()
local ClosestDistance = math.huge
local NewClosest = nil
if not IsNormal(game:GetService("Players").LocalPlayer.Character) then
ClosestHRP = nil
return
end
for i,v in pairs(workspace.Char:GetChildren()) do
if v.Name ~= game:GetService("Players").LocalPlayer.Name and IsNormal(v) then
local Distance = (HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
if Distance < ClosestDistance then
ClosestDistance = Distance
NewClosest = v.HumanoidRootPart
end
end
end
if AutoTurn == true and ClosestDistance < Range then
HumanoidRootPart.CFrame = CFrame.lookAt(HumanoidRootPart.Position, NewClosest.Position)
end
ClosestHRP = NewClosest
end)
end
local noclip_connection = nil
local camera_connection = nil
function ApplyInvisibility(bool)
if bool == false then
task.spawn(function()
for i,v in next, Humanoid:GetPlayingAnimationTracks() do
if v.Animation.AnimationId=="rbxassetid://71695001979420" then
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(tonumber(0))
v:Stop(tonumber(0))
end
end
end)
if noclip_connection then
noclip_connection:Disconnect()
noclip_connection = nil
end
if camera_connection then
camera_connection:Disconnect()
camera_connection = nil
pcall(function()
workspace.CurrentCamera.CameraSubject = Humanoid
end)
end
elseif bool == true then
local function nocollision()
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
v.CanCollide = false
end
end
if LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
end
end
noclip_connection = game:GetService("RunService").Stepped:Connect(nocollision)
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
camera_connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://71695001979420" -- Hello probably limbus game developers. There are more animations that can make character quite invisible... It's just that I liked this variant more :)
local loadedanim = Humanoid:LoadAnimation(Anim)
loadedanim.Priority = Enum.AnimationPriority.Action4
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
loadedanim:AdjustSpeed(tonumber(0))
loadedanim.TimePosition = .65
end
end
local MainTab = Window:CreateTab("Main",0)
function GetFolderID(char)
return game:GetService("ReplicatedStorage").src.Identities[tostring(char:GetAttribute("Character"))][tostring(char:GetAttribute("Identity"))]
end
MainTab:CreateSection("Invisibility")
MainTab:CreateToggle({Name = "Turn On/Off Invisibility"; CurrentValue = false; Callback = function(Value)
ApplyInvisibility(Value)
Rayfield:Notification("Success!", (Value==true and "Applied invisibility!" or "Disabled invisibility!"), 2, true)
end; })
MainTab:CreateSection("S4 Abuse")
MainTab:CreateParagraph({Title = "S4 Abuse", Content = "Some of the merges: Using shield skill as evade skill will make it unbreakable evade. Using counter skill as coin skill will instantly use counter attack."})
local S4Method = "Shield"
MainTab:CreateDropdown({Name = "S4 Methods"; Options = {"Shield","Evade","Counter","Coin"}; CurrentOption = S4Method; MultiSelection = false; Callback = function(Value)
S4Method = Rayfield:GetDropdownValue(Value)
end; })
MainTab:CreateKeybind({Name = "Use S4 using choosen method"; CurrentKeybind = "C"; HoldToInteract = false; Callback = function(Value)
game:GetService("ReplicatedStorage"):WaitForChild("Net"):WaitForChild("Character"):WaitForChild("Combat"):FireServer(unpack({{Module = GetFolderID(Character).Moves.Base.S4,Char = Character,HRP = HumanoidRootPart,Attempt = ""..S4Method.."Skill"}}))
end; })
MainTab:CreateSection("Counter Skill Abuse")
MainTab:CreateParagraph({Title = "Counter Skill Abuse", Content = "You will be able to use your S1, S2 and S3 as counter skills"})
MainTab:CreateKeybind({Name = "Use S1 as counter skill"; CurrentKeybind = "R"; HoldToInteract = false; Callback = function(Value)
game:GetService("ReplicatedStorage"):WaitForChild("Net"):WaitForChild("Character"):WaitForChild("Combat"):FireServer(unpack({{Module = GetFolderID(Character).Moves.Base.S1,Char = Character,HRP = HumanoidRootPart,Attempt = "CounterSkill"}}))
end; })
MainTab:CreateKeybind({Name = "Use S2 as counter skill"; CurrentKeybind = "T"; HoldToInteract = false; Callback = function(Value)
game:GetService("ReplicatedStorage"):WaitForChild("Net"):WaitForChild("Character"):WaitForChild("Combat"):FireServer(unpack({{Module = GetFolderID(Character).Moves.Base.S2,Char = Character,HRP = HumanoidRootPart,Attempt = "CounterSkill"}}))
end; })
MainTab:CreateKeybind({Name = "Use S3 as counter skill"; CurrentKeybind = "G"; HoldToInteract = false; Callback = function(Value)
game:GetService("ReplicatedStorage"):WaitForChild("Net"):WaitForChild("Character"):WaitForChild("Combat"):FireServer(unpack({{Module = GetFolderID(Character).Moves.Base.S3,Char = Character,HRP = HumanoidRootPart,Attempt = "CounterSkill"}}))
end; })
MainTab:CreateSection("Character Properties")
MainTab:CreateButton({Name = "Infinite Light"; Callback = function(Value)
Character:SetAttribute("Slot",0)
Character:SetAttribute("MaxSlots",1500)
end; })
MainTab:CreateSection("God Mode")
MainTab:CreateToggle({Name = "Turn On/Off God Mode"; CurrentValue = false; Callback = function(Value)
if not Humanoid then Rayfield:Notification("Error!","No humanoid found.",3,false) return end
if Value==true then
Module:LG_GodModeToggle(true)
Humanoid.Health = 0
LocalPlayer.CharacterAdded:Once(function()
task.wait(1)
task.spawn(function()
local Character = game.Players.LocalPlayer.Character
local Humanoid = Character:WaitForChild("Humanoid")
local RootPart = Character:WaitForChild("HumanoidRootPart")
local Animator = Humanoid:WaitForChild("Animator")
local currentAnim = ""
local currentAnimTrack = nil
local animationTable = {}
local legacy_animations = {
	idleAnimation = "http://www.roblox.com/asset/?id=180435571",
	walkAnimation = "http://www.roblox.com/asset/?id=180426354",
	jumpAnimation = "http://www.roblox.com/asset/?id=125750702",
	fallAnimation = "http://www.roblox.com/asset/?id=180436148",
	climbAnimation = "http://www.roblox.com/asset/?id=180436334",
	sitAnimation = "http://www.roblox.com/asset/?id=178130996",
}
local idanims1 = game:GetService("ReplicatedStorage").src.Identities.Sinclair["The Middle Little Brother"].Animations
local idanims2 = game:GetService("ReplicatedStorage").src.Identities.Gregor["Timekilling Time"].Animations
local animations = {
	idleAnimation = idanims2.Base.Normal.Idle.AnimationId,
	walkAnimation = idanims1.Base.Normal.Walk.AnimationId,
	jumpAnimation = "http://www.roblox.com/asset/?id=125750702",
	fallAnimation = "http://www.roblox.com/asset/?id=180436148",
	climbAnimation = "http://www.roblox.com/asset/?id=180436334",
	sitAnimation = "http://www.roblox.com/asset/?id=178130996",
}
for animName, animId in pairs(animations) do
	local anim = Instance.new("Animation")
	anim.AnimationId = animId
	animationTable[animName] = anim
end
local function StopAllAnimations()
	if currentAnimTrack then
		currentAnimTrack:Stop()
		currentAnimTrack:Destroy()
		currentAnimTrack = nil
	end
end
local function PlayAnimation(animName)
	if animName == currentAnim then return end
	StopAllAnimations()
	currentAnim = animName
	currentAnimTrack = Animator:LoadAnimation(animationTable[animName])
	currentAnimTrack:Play()
end
local function onSeated()
	PlayAnimation("sitAnimation")
end
local function onJumping()
	PlayAnimation("jumpAnimation")
end
local function onClimbing(speed)
	if math.abs(speed) > 0.2 then
		if currentAnim ~= "climbAnimation" then
			PlayAnimation("climbAnimation")
		elseif currentAnimTrack then
			currentAnimTrack:AdjustSpeed(1)
		end
	else
		if currentAnimTrack then
			currentAnimTrack:AdjustSpeed(0)
		end
	end
end
local function onFalling()
	PlayAnimation("fallAnimation")
end
local function onRunning(speed)
	if speed > 0.2 then
		PlayAnimation("walkAnimation")
	else
		PlayAnimation("idleAnimation")
	end
end
Humanoid.Seated:Connect(function()
	StopAllAnimations()
	PlayAnimation("sitAnimation")
end)
Humanoid.Swimming:Connect(onRunning)
Humanoid.Running:Connect(onRunning)
Humanoid.FreeFalling:Connect(onFalling)
Humanoid.Climbing:Connect(onClimbing)
Humanoid.Jumping:Connect(onJumping)
Humanoid.Died:Connect(function()
	StopAllAnimations()
	currentAnim = ""
end)
PlayAnimation("idleAnimation")
end)
end)
elseif Value==false then
Module:LG_GodModeToggle(false)
Humanoid.Health = 0
end
end; })
MainTab:CreateSection("Stun Aura")
MainTab:CreateToggle({Name = "Turn On/Off Stun Aura"; CurrentValue = false; Callback = function(Value)
Rayfield:Notification("Success!", (Value==true and "Applied stun aura!" or "Disabled stun aura!"), 2, true)
Module:StunAuraEnabled(Value)
end; })




local Tab1 = Window:CreateTab("Hitbox",0)
Tab1:CreateParagraph({Title = "Hitbox", Content = "Hitbox manipulations and management."})
Tab1:CreateLabel("Hitbox Auto Tracer")
Tab1:CreateLabel("Warning!")
Tab1:CreateLabel("For hitbox to hit, your character must be turned to position where closest player is! (or you can enable auto turn if you don't wanna do it manually)")
Tab1:CreateSlider({Name = "Range"; Range = {1, 140}; Increment = 1; Suffix = " studs"; CurrentValue = 140; Callback = function(Value)
Range = tonumber(Value)
end; })
Tab1:CreateToggle({Name = "Hitbox Auto Tracer"; CurrentValue = false; Callback = function(Value)
AutoTracer = Value
end; })
Tab1:CreateToggle({Name = "Auto Turn"; CurrentValue = false; Callback = function(Value)
AutoTurn = Value
end; })




local IdentitiesTab = Window:CreateTab("Identities Specials",0)
IdentitiesTab:CreateParagraph({Title = "Identities Specials", Content = "Special Features for different identities."})
function CreateHint()
    local hint = Instance.new("Part")
    hint.CanCollide = false
    hint.CanTouch = false
    hint.Size = HumanoidRootPart.Size
    hint.Material = Enum.Material.Neon
    hint.Color = Color3.fromRGB(0, 255, 0)
    hint.Transparency = 0.85
    hint.Parent = workspace.Ignore
    hint.Anchored = true
    return hint
end
function CreateTimekillingTimeDashHints()
local hrp = HumanoidRootPart
local camera = workspace.CurrentCamera
local connections = {}
local parts = {}
local offsets = {
    Vector3.new(0, 0, 27),
    Vector3.new(0, 0, -27),
    Vector3.new(27, 0, 0),
    Vector3.new(-27, 0, 0)
}
for i = 1,4 do
    local hint = CreateHint()
    parts[i] = hint
    connections[i] = game:GetService("RunService").Heartbeat:Connect(function()
        local hrppos = hrp.Position
        local cf
        local shiftlockenabled = game:GetService("UserInputService").MouseBehavior == Enum.MouseBehavior.LockCenter
        if shiftlockenabled then
            local camerapos = camera.CFrame.Position
            local targetpos = Vector3.new(camerapos.X, hrppos.Y, camerapos.Z)
            cf = CFrame.new(hrppos, targetpos)
        else
            cf = hrp.CFrame
        end
        local worldpos = cf:PointToWorldSpace(offsets[i])
        hint.Position = Vector3.new(worldpos.X, hrppos.Y, worldpos.Z)
        hint.CFrame = CFrame.new(hint.Position) * cf.Rotation
    end)
end
return connections,parts
end
IdentitiesTab:CreateSection("Timekilling Time")
local connections,parts
IdentitiesTab:CreateToggle({Name = "Accelerated Dash Hints Enabled"; CurrentValue = false; Callback = function(Value)
DashHints = Value
if DashHints==false then
if connections and parts then
for _,conn in pairs(connections) do conn:Disconnect() end
for _,part in pairs(parts) do part:Destroy() end
connections = nil
parts = nil
end
return
end
connections,parts = CreateTimekillingTimeDashHints()
end; })
IdentitiesTab:CreateSection("Solemn Lament")
IdentitiesTab:CreateToggle({Name = "Always Reloaded"; CurrentValue = false; Callback = function(Value)
if Value==true then
Heartbeat.AutoReloadSL = function() if Character then Character:SetAttribute("Reloaded",true) end end
elseif Value==false then
if Heartbeat.AutoReloadSL then
Heartbeat.AutoReloadSL = nil
end
end
end; })






local Tab2 = Window:CreateTab("Local Player",0)
Tab2:CreateParagraph({Title = "Local Player", Content = "Local Player Management."})
local WalkSpeed = 0
local JumpPower = 0
Tab2:CreateSection("WalkSpeed")
local CurrentWalkSpeedLabel = Tab2:CreateLabel("Your current WalkSpeed is ???")
Heartbeat.CurrentWalkSpeed = function()
pcall(function()
if Humanoid then
CurrentWalkSpeedLabel:Set("Your current WalkSpeed is "..tostring(Humanoid.WalkSpeed).."")
end
end)
end
Tab2:CreateInput({Name = "WalkSpeed"; PlaceholderText = "0"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
WalkSpeed = tonumber(Value)
end; })
Tab2:CreateButton({Name = "Set WalkSpeed"; Callback = function()
Humanoid.WalkSpeed = WalkSpeed
end; })
local LoopWalkSpeedToggle
LoopWalkSpeedToggle = Tab2:CreateToggle({Name = "Loop Set WalkSpeed"; CurrentValue = false; Callback = function(Value)
if Value == true then
local CurrentHumanoid = Humanoid
PropertyBeatSet("LoopWalkSpeed","AddBeat", Humanoid,"WalkSpeed",function() if Humanoid~=CurrentHumanoid then LoopWalkSpeedToggle:Set(false) end Humanoid.WalkSpeed = WalkSpeed end)
elseif Value == false then
PropertyBeatSet("LoopWalkSpeed","RemoveBeat")
end
end; })
Tab2:CreateSection("JumpPower")
local CurrentJumpPowerLabel = Tab2:CreateLabel("Your current JumpPower is ???")
Heartbeat.CurrentJumpPower = function()
pcall(function()
if Humanoid then
CurrentJumpPowerLabel:Set("Your current JumpPower is "..tostring(Humanoid.JumpPower).."")
end
end)
end
Tab2:CreateInput({Name = "JumpPower"; PlaceholderText = "0"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
JumpPower = tonumber(Value)
end; })
Tab2:CreateButton({Name = "Set JumpPower"; Callback = function()
Humanoid.JumpPower = JumpPower
end; })
local LoopJumpPowerToggle
LoopJumpPowerToggle = Tab2:CreateToggle({Name = "Loop Set JumpPower"; CurrentValue = false; Callback = function(Value)
if Value == true then
local CurrentHumanoid = Humanoid
PropertyBeatSet("LoopJumpPower","AddBeat", Humanoid,"WalkSpeed",function() if Humanoid~=CurrentHumanoid then LoopJumpPowerToggle:Set(false) end Humanoid.JumpBoost = JumpBoost end)
elseif Value == false then
PropertyBeatSet("LoopJumpPower","RemoveBeat")
end
end; })
Tab2:CreateSection("Camera")
Tab2:CreateSlider({Name = "FOV"; Range = {0,360}; Increment = 1; Suffix = ""; CurrentValue = workspace.CurrentCamera.FieldOfView; Callback = function(Value)
workspace.CurrentCamera.FieldOfView = Value
end; })






local Tab3 = Window:CreateTab("Other",0)
Tab3:CreateButton({Name = "EXTERMINATE THE CLOSEST PLAYER TO YOU. [ Don't spam ]"; Callback = function()
local spinning = true
local a = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").src.Identities.Meursault["The Thumb East Capo IIII"].Animations.Base.Attack.Combo3)
a:Play()
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(9e9,9e9,9e9)
BodyVelocity.P = 2000
BodyVelocity.Velocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 80) * tonumber(-1)
BodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
game.Debris:AddItem(BodyVelocity, .1)
task.wait(.15)
task.wait(.05)
a:AdjustSpeed(0)
task.wait(.35)
a:AdjustSpeed(1)
local BodyVelocity = Instance.new("BodyVelocity")
BodyVelocity.MaxForce = Vector3.new(9e9,9e9,9e9)
BodyVelocity.P = 5000
BodyVelocity.Velocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 80) * tonumber(1.5)
BodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
game.Debris:AddItem(BodyVelocity, .2)
task.wait(.3)
a:Stop()
task.wait()
local BodyVelocity = Instance.new("BodyPosition")
BodyVelocity.MaxForce = Vector3.new(9e9,9e9,9e9)
BodyVelocity.P = 2000
BodyVelocity.D = 100
BodyVelocity.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
BodyVelocity.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
task.spawn(function()
local a = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game:GetService("ReplicatedStorage").src.Identities.Meursault["The Thumb East Capo IIII"].Animations.Base.Attack.Combo3)
while spinning do
a.Priority = Enum.AnimationPriority.Action4
a:AdjustSpeed(2)
a:Play()
if math.random(1,2) == 1 then
a.TimePosition = .55
task.wait(.4)
else
a.TimePosition = .6
task.wait(.3)
end
if spinning == false then
a:AdjustSpeed(1)
else
a:Stop()
end
end
end)
local TargetHumanoid = ClosestHRP.Parent:FindFirstChildOfClass("Humanoid")
local localPlayer = game.Players.LocalPlayer
repeat task.wait()
for i,v in next,game:GetService("ReplicatedStorage").src:GetDescendants() do
if v and v:IsA("ModuleScript") and tonumber(v.Name)~=nil and (v.Parent.Name == "Coinss" or (v.Parent.Name == "Combos" and tonumber(v.Name)~=3)) then
BodyVelocity.Position = ClosestHRP.Position
local args = {{Module = v,Humanoid = localPlayer.Character:WaitForChild("Humanoid"),Attempt = "M1",HRP = localPlayer.Character:WaitForChild("HumanoidRootPart"),Char = localPlayer.Character}}
game:GetService("ReplicatedStorage"):WaitForChild("Net"):WaitForChild("Character"):WaitForChild("Combat"):FireServer(unpack(args))
task.wait(.135)
if not TargetHumanoid or TargetHumanoid.Health < 1 then
spinning = false
BodyVelocity:Destroy()
return
end
end
end
until not TargetHumanoid or TargetHumanoid.Health < 1
spinning = false
BodyVelocity:Destroy()
end; })


Tab3:CreateButton({Name = "Close Hub"; Callback = function()
for i,v in next, Heartbeat do
if i then
Heartbeat[i] = nil
end
end
rscon:Disconnect()
Rayfield:Destroy()
end; })
