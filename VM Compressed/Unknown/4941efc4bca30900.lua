--gigachad hub
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Gigachad Hub(Revamp)",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "loaded",
   LoadingSubtitle = "by Wesd",
   ShowText = "Chad", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "P", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
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

local Tab = Window:CreateTab("Animations(FE)", 4483362458) -- Title, Image
local Section = Tab:CreateSection("FE Animations")

local Button = Tab:CreateButton({
   Name = "Animation hub(Has reanimations) ocfi",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/aqua-hub-is-a-skid-lol/refs/heads/main/animatrix"))()


   end,
})


local Button = Tab:CreateButton({
   Name = "Tall Guy(Wesd)",
   Callback = function()
   -- tall guy screptttt
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local animator = humanoid:WaitForChild("Animator")

local function toggleDefaultAnimate(enabled)
    local animate = character:FindFirstChild("Animate")
    if animate then
        animate.Disabled = not enabled
    end
    if not enabled then
        for _, track in pairs(animator:GetPlayingAnimationTracks()) do
            track:Stop(0.2)
        end
    end
end

local function ensureAnimationId(id)
    local strId = tostring(id)
    if #strId >= 15 then return "rbxassetid://" .. strId end
    local success, assets = pcall(game.GetObjects, game, "rbxassetid://" .. strId)
    if success then
        for _, a in ipairs(assets) do
            if a:IsA("Animation") then return a.AnimationId
            elseif a:FindFirstChildWhichIsA("Animation", true) then
                return a:FindFirstChildWhichIsA("Animation", true).AnimationId
            end
        end
    end
    return "rbxassetid://" .. strId
end

local animations = {
    idle = 76622684003043,         
    walk = 71303649590318,         
    headless = 76746775961797,     
    lookAround = 79216795769647,
    chilling = 98248319097752,
    transform = 93875137466223
}

local keybinds = { 
    Headless = "q", 
    LookAround = "e",
    ReEnableDefault = "r", 
    MonsterMode = "f" 
}

local tracks = {}
for name, id in pairs(animations) do
    local animId = ensureAnimationId(id)
    if animId then
        local a = Instance.new("Animation")
        a.AnimationId = animId
        tracks[name] = animator:LoadAnimation(a)
        
        if name == "idle" or name == "walk" then
            tracks[name].Priority = Enum.AnimationPriority.Movement
        elseif name == "transform" then
            tracks[name].Priority = Enum.AnimationPriority.Action
        else
            tracks[name].Priority = Enum.AnimationPriority.Action
        end
    end
end

local isMonster = false          
local isEmoting = false
local currentActive = nil
local idleTime = 0
local defaultWalkSpeed = 16

RunService.RenderStepped:Connect(function(dt)
    if not isMonster or isEmoting then 
        idleTime = 0
        humanoid.WalkSpeed = defaultWalkSpeed
        return 
    end
    
    local speed = humanoid.MoveDirection.Magnitude
    local target = "idle"
    local isRunning = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)

    if speed > 0.1 then
        target = "walk"
        idleTime = 0 
    else
        idleTime = idleTime + dt
        if idleTime >= 5 then
            target = "chilling"
        else
            target = "idle"
        end
    end

    if currentActive ~= target then
        if currentActive and tracks[currentActive] then tracks[currentActive]:Stop(0.5) end
        if tracks[target] then
            tracks[target].Looped = true
            tracks[target]:Play(0.5)
            currentActive = target
        end
    end

    if currentActive == "walk" then
        if isRunning then
            tracks["walk"]:AdjustSpeed(1.5)
            humanoid.WalkSpeed = defaultWalkSpeed * 1.5
        else
            tracks["walk"]:AdjustSpeed(1)
            humanoid.WalkSpeed = defaultWalkSpeed
        end
    else
        humanoid.WalkSpeed = defaultWalkSpeed
    end
end)

local function playOneShot(name)
    if not tracks[name] or isEmoting or not isMonster then return end
    isEmoting = true
    idleTime = 0
    
    if currentActive and tracks[currentActive] then tracks[currentActive]:Stop(0.2) end
    
    local t = tracks[name]
    t.Looped = false 
    t:Play(0.2)
    t.Stopped:Wait()
    
    isEmoting = false
    currentActive = nil 
end

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    local k = input.KeyCode.Name:lower()

    if k == keybinds.MonsterMode then
        if not isMonster then
            isEmoting = true
            toggleDefaultAnimate(false)
            
            local t = tracks["transform"]
            if t then
                t.Looped = false
                t:Play(0.2)
                
                local length = t.Length
                if length == 0 then task.wait() length = t.Length end
                
                task.wait(length / 2)
                
                isMonster = true
                isEmoting = false
                
                t:Stop(0.5)
            else
                isMonster = true
                isEmoting = false
            end
            currentActive = nil
        else
            isEmoting = true
            if currentActive and tracks[currentActive] then tracks[currentActive]:Stop(0.3) end
            
            local t = tracks["transform"]
            if t then
                t.Looped = false
                t:Play(0.1)
                
                local length = t.Length
                if length == 0 then task.wait() length = t.Length end
                
                t.TimePosition = length / 2
                task.wait(length / 2)
                
                t:Stop(0.5)
            end
            
            isMonster = false
            isEmoting = false
            currentActive = nil
            toggleDefaultAnimate(true)
        end
        
    elseif k == keybinds.ReEnableDefault then
        isMonster = false
        idleTime = 0
        if currentActive and tracks[currentActive] then tracks[currentActive]:Stop(0.3) end
        currentActive = nil
        toggleDefaultAnimate(true)

    elseif k == keybinds.Headless and isMonster then
        playOneShot("headless")
        
    elseif k == keybinds.LookAround and isMonster then
        playOneShot("lookAround")
    end
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Better Movement(Gazer-Ha)",
   Callback = function()
   --fe better movement finales cucked by gaze
--credir too (d.c.h.a.g.t.p) or (died.choked.and.glaze.the.pornstar)
--if you stole it akundisco will lick ur feet and sucks ur toes (i lied, he's not licking ur feet and sucks ur toes.)

--if you stole it i will bang you with big banhammer >;D

RunService = game:GetService("RunService")
UserInputService = game:GetService("UserInputService")
Workspace = game:GetService("Workspace")
Coregui = game:GetService("CoreGui")
Players = game:GetService("Players")
Player = Players.LocalPlayer

M = math --if youre_geeked then meth = true end --// (we need to cook)
CF = CFrame
V3 = Vector3
V2 = Vector2
U2 = UDim2
C3 = Color3
ANG = CF.Angles
RAD = M.rad
if M == meth then return end

function load(id)
anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://" .. id
hum = Player.Character:FindFirstChild("Humanoid")
track = hum:LoadAnimation(anim)
track.Priority = Enum.AnimationPriority.Movement
return track end

lastPos, tiltX, tiltY, tiltZ, slopeTilt= V3.zero, 0, 0, 0, 0
currentYaw = 0
isShiftlock = false

char = nil
hum = nil
hrp = nil
tiltAttachment = nil
alignOrientation = nil
animLoop = nil 

screenGui = Instance.new("ScreenGui")
screenGui.Name = "RobloxGui" -- i saw someone did it dont blame me
screenGui.ResetOnSpawn = false
screenGui.Parent = Coregui
shiftLockButton = Instance.new("ImageButton")
shiftLockButton.Name = "buttin"
shiftLockButton.Size = U2.new(0, 60, 0, 60)
shiftLockButton.Position = U2.new(1, -70, 1, -70)
shiftLockButton.BackgroundTransparency = 1
shiftLockButton.Image = "rbxassetid://105987953182009"
shiftLockButton.Active = true
shiftLockButton.Parent = screenGui

function toggleShiftLock()
isShiftlock = not isShiftlock
shiftLockButton.ImageColor3 = isShiftlock and C3.fromRGB(0, 170, 255) or C3.fromRGB(255, 255, 255) 
end

shiftLockButton.MouseButton1Click:Connect(toggleShiftLock)
UserInputService.InputBegan:Connect(function(input, gp)
if gp then return end
if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
toggleShiftLock()
end end)

function lerpAngle(a, b, t)
return a + M.atan2(M.sin(b - a), M.cos(b - a)) * t 
end

function setup(character) 
char = character
hum = char:WaitForChild("Humanoid")
hum.WalkSpeed = 50
hrp = char:WaitForChild("HumanoidRootPart")
lastPos = hrp.Position
currentYaw = RAD(hrp.Orientation.Y)
tiltX, tiltY, tiltZ, slopeTilt = 0, 0, 0, 0
hum.PlatformStand = false
hum.AutoRotate = false

if tiltAttachment then tiltAttachment:Destroy() end
if alignOrientation then alignOrientation:Destroy() end

tiltAttachment = Instance.new("Attachment") --fe Bipassis new method 2016 no virus
tiltAttachment.Name = "TiltAttachment"
tiltAttachment.Parent = hrp

alignOrientation = Instance.new("AlignOrientation")
alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
alignOrientation.Attachment0 = tiltAttachment
alignOrientation.MaxTorque = M.huge
alignOrientation.Responsiveness = 50
alignOrientation.Parent = hrp

task.defer(function()
task.wait(0.05)
for _, part in ipairs(char:GetDescendants()) do
if part:IsA("BasePart") then
if part == hrp then
part.Massless = false
else
if not part.Anchored then part.Massless = true end end end end end)
--wake up its the first of the month
hum:ChangeState(Enum.HumanoidStateType.GettingUp)
end

function init(character)
if animLoop then animLoop:Disconnect() end
humLocal = character:WaitForChild("Humanoid")
if humLocal.RigType == Enum.HumanoidRigType.R6 then
task.spawn(function() 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/NOT-MINE/refs/heads/main/R6%20animation%20custe"))() 
    --credir to someone who made idk lol lemme see..
    --oh, credit to a.i for script and roblox for making the animmim
end) 
return end

--whole anim here
walkTrack= load("83842218823011")
runTrack = load("118320322718866")
sideTrack = load("132218385473651")
backTrack = load("16738337225")
jumpTrack = load("127915306032185")
--ts idle
t1 = load("138665010911335")
t2 = load("140131631438778")
t3 = load("82261197744576")
canJump = true -- false if you fat a lot

animLoop = RunService.Heartbeat:Connect(function()
humNow = character:FindFirstChild("Humanoid")
hrpNow = character:FindFirstChild("HumanoidRootPart")
if not humNow or not hrpNow then return end
moveDir = humNow.MoveDirection
speed = V3.new(hrpNow.AssemblyLinearVelocity.X, 0, hrpNow.AssemblyLinearVelocity.Z).Magnitude
state = humNow:GetState()
--ye
if moveDir.Magnitude == 0 then
    if runTrack then runTrack:Stop(0.2) end
    if walkTrack then walkTrack:Stop(0.2) end
    if sideTrack then sideTrack:Stop(0.2) end
    if backTrack then backTrack:Stop(0.2) end
end

for _, tr in pairs(humNow:GetPlayingAnimationTracks()) do
    if tr.Name == "WalkAnim" or tr.Name == "RunAnim" or tr.Name == "IdleAnim" then tr:Stop(0.1) end
end

if state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall then
    if canJump then if jumpTrack then jumpTrack:Play(0.15) end canJump = false end
    if t1 then t1:Stop(0.1) end if t2 then t2:Stop(0.1) end if t3 then t3:AdjustWeight(0.03) end
    if walkTrack then walkTrack:Stop(0.1) end if runTrack then runTrack:Stop(0.1) end
    if sideTrack then sideTrack:Stop(0.1) end if backTrack then backTrack:Stop(0.1) end
    return
end

if state == Enum.HumanoidStateType.Landed then if jumpTrack then jumpTrack:Stop(0.1) end canJump = true end

if speed > 0.5 then
if t1 then t1:Stop(0.1) end if t2 then t2:Stop(0.1) end if t3 then t3:AdjustWeight(0.05) end
forwardDot = moveDir:Dot(hrpNow.CFrame.LookVector)
rightDot = moveDir:Dot(hrpNow.CFrame.RightVector)        
if M.abs(rightDot) > 0.6 then
if sideTrack and not sideTrack.IsPlaying then sideTrack:Play(0.1) end
if sideTrack then sideTrack:AdjustSpeed(1.5 * (speed/16) * (rightDot >= 0 and -1 or 1)) end
if walkTrack then walkTrack:Stop(0.1) end if runTrack then runTrack:Stop(0.1) end if backTrack then backTrack:Stop(0.1) end
elseif forwardDot <= -0.5 then
if backTrack and not backTrack.IsPlaying then backTrack:Play(0.1) end
if backTrack then backTrack:AdjustSpeed(-1.5 * (speed/16)) end
if walkTrack then walkTrack:Stop(0.1) end if runTrack then runTrack:Stop(0.1) end if sideTrack then sideTrack:Stop(0.1) end
elseif forwardDot >= 0.4 then
if sideTrack then sideTrack:Stop(0.1) end if backTrack then backTrack:Stop(0.1) end
if speed >= 15 then
if walkTrack then walkTrack:Stop(0.1) end
if runTrack and not runTrack.IsPlaying then runTrack:Play(0.1) end
if runTrack then runTrack:AdjustSpeed(0.3 * (speed/15)) end
elseif speed >= 1 then
if runTrack then runTrack:Stop(0.1) end
if walkTrack and not walkTrack.IsPlaying then walkTrack:Play(0.1) end
if walkTrack then walkTrack:AdjustSpeed(1.8 * speed/15) end
end end
            
           else
           
if walkTrack then walkTrack:Stop(0.1) end if runTrack then runTrack:Stop(0.1) end
if sideTrack then sideTrack:Stop(0.1) end if backTrack then backTrack:Stop(0.1) end
if t1 and not t1.IsPlaying then t1:Play(0.1, 0.9, 1) end
if t2 and not t2.IsPlaying then t2:Play(0.1, 0.5, 1) end
if t3 and not t3.IsPlaying then t3:Play(0.08) t3:AdjustWeight(0.06) t3:AdjustSpeed(0) t3.TimePosition = t3.Length * 0.98 end
end end) end

rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
--idiot was hir

 function onHeartbeat(dt)
if not hrp or not hum or not alignOrientation or hum.Health <= 0 then return end
rayParams.FilterDescendantsInstances = {char}
velocity = (hrp.Position - lastPos) / M.max(dt, 1/60)
lastPos = hrp.Position
isSitting = hum.Sit
targetSlope = 0
ray = Workspace:Raycast(hrp.Position, V3.new(0, -10, 0), rayParams)

if ray and ray.Instance and ray.Instance.CanCollide then
    targetSlope = -hrp.CFrame.LookVector:Dot(ray.Normal) * RAD(45) * 1.5
    if isSitting then targetSlope = targetSlope * 2.0 end
end

slopeTilt = slopeTilt + (targetSlope - slopeTilt) * dt * 10
targetX, targetZ = 0, 0
currentMaxTilt = isSitting and RAD(5) or RAD(55)

if V2.new(velocity.X, velocity.Z).Magnitude > 0.1 then
    targetX = -hum.MoveDirection:Dot(hrp.CFrame.LookVector) * currentMaxTilt
    targetZ = -hum.MoveDirection:Dot(hrp.CFrame.RightVector) * currentMaxTilt
end

intensity = M.clamp(velocity.Y / 50, -1, 1)
targetY_Goal = (velocity.Y > 0 and intensity * RAD(35)) or (intensity * RAD(10))
if isSitting then targetY_Goal = targetY_Goal * 2.0 end

tiltX = tiltX + (targetX - tiltX) * dt * 10
tiltY = tiltY + (targetY_Goal - tiltY) * dt * 10
tiltZ = tiltZ + (targetZ - tiltZ) * dt * 10

targetYaw = currentYaw
if isShiftlock then
cam = Workspace.CurrentCamera
if cam then targetYaw = M.atan2(-cam.CFrame.LookVector.X, -cam.CFrame.LookVector.Z) end
elseif hum.MoveDirection.Magnitude > 0.1 then
targetYaw = M.atan2(-hum.MoveDirection.X, -hum.MoveDirection.Z) end
currentYaw = lerpAngle(currentYaw, targetYaw, dt * (isShiftlock and 40 or 10))
alignOrientation.CFrame = ANG(0, currentYaw, 0) * ANG(tiltY + slopeTilt, 0, 0) * ANG(tiltX, 0, tiltZ)
end

Player.CharacterAdded:Connect(function(newChar) setup(newChar) init(newChar) end)
if Player.Character then setup(Player.Character) init(Player.Character) end
RunService.Heartbeat:Connect(onHeartbeat)
   end,
})

local Paragraph = Tab:CreateParagraph({Title = "Changelogs", Content = "Tall Guy, Better Movement, More soon"})

local Tab = Window:CreateTab("Models", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Models to Load in your game")

local Button = Tab:CreateButton({
   Name = "Penis(Requires you to download files in the discord)",
   Callback = function()
   -- penis

























local folderName = "meshes"
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local function getAsset(id)
    if id:find("rbxassetid://") or id:find("http") then return id end
    local cleanId = id:match("([^/]+)$") or id
    local path = folderName .. "/" .. cleanId
    if isfile and isfile(path) then
        return getcustomasset(path)
    end
    return id:find("rbxasset://") and id or "rbxassetid://" .. cleanId
end

local Cock = Instance.new("Model")
Cock.Name = "Cock"
Cock.Parent = char

-- Base bone (anchored to body)
local BaseBone = Instance.new("Bone")
BaseBone.Name = "BaseBone"

-- Middle bone for physics
local MidBone = Instance.new("Bone")
MidBone.Name = "MidBone"
MidBone.Position = Vector3.new(0, -0.4, 0)

-- Tip bone
local TipBone = Instance.new("Bone")
TipBone.Name = "TipBone"
TipBone.Position = Vector3.new(0, -0.4, 0)

local P_C = Instance.new("Part")
P_C.Name = "P_C"
P_C.Size = Vector3.new(1.484, 0.526, 0.539)
P_C.Color = Color3.fromRGB(163, 162, 165)
P_C.Material = Enum.Material.SmoothPlastic
P_C.CanCollide = false
P_C.Massless = false
P_C.CustomPhysicalProperties = PhysicalProperties.new(0.5, 0.3, 0.5, 1, 1)
P_C.Parent = Cock

-- Setup bone hierarchy
BaseBone.Parent = P_C
MidBone.Parent = BaseBone
TipBone.Parent = MidBone

-- Attachments for constraints
local baseAttachment = Instance.new("Attachment")
baseAttachment.Name = "BaseAttachment"
baseAttachment.Position = Vector3.new(0, 0.26, 0)
baseAttachment.Parent = P_C

local midAttachment = Instance.new("Attachment")
midAttachment.Name = "MidAttachment"
midAttachment.Position = Vector3.new(0, -0.14, 0)
midAttachment.Parent = P_C

local tipAttachment = Instance.new("Attachment")
tipAttachment.Name = "TipAttachment"
tipAttachment.Position = Vector3.new(0, -0.54, 0)
tipAttachment.Parent = P_C

local P_C_Mesh = Instance.new("SpecialMesh")
P_C_Mesh.MeshId = getAsset("7093427066")
P_C_Mesh.MeshType = Enum.MeshType.FileMesh
P_C_Mesh.Parent = P_C

-- Bones will control the mesh deformation through constraints

local X_B = Instance.new("Part")
X_B.Name = "X_B"
X_B.Size = Vector3.new(0.447, 0.852, 0.723)
X_B.Color = Color3.fromRGB(234, 184, 146)
X_B.CanCollide = false
X_B.Massless = true
X_B.Parent = P_C

local X_B_Mesh = Instance.new("SpecialMesh")
X_B_Mesh.MeshId = getAsset("afdbbb7cf29f0798d6fa6ff07e08553e")
X_B_Mesh.MeshType = Enum.MeshType.FileMesh
X_B_Mesh.Parent = X_B

local XB_Weld = Instance.new("Weld")
XB_Weld.Part0 = P_C
XB_Weld.Part1 = X_B
XB_Weld.C0 = CFrame.new(0.27, -0.31, 0.12) * CFrame.Angles(math.rad(-20.7), math.rad(-180), math.rad(8.76))
XB_Weld.Parent = X_B

local NewPC = Instance.new("Part")
NewPC.Name = "NewPC"
NewPC.Size = Vector3.new(1.484, 0.526, 0.539)
NewPC.Color = Color3.fromRGB(234, 184, 146)
NewPC.CanCollide = false
NewPC.Massless = true
NewPC.Parent = P_C

local NewPC_Mesh = Instance.new("SpecialMesh")
NewPC_Mesh.MeshId = getAsset("767088ba9f373e77b2f56a757248670f")
NewPC_Mesh.MeshType = Enum.MeshType.FileMesh
NewPC_Mesh.Parent = NewPC

local NewPC_Weld = Instance.new("Weld")
NewPC_Weld.Part0 = P_C
NewPC_Weld.Part1 = NewPC
NewPC_Weld.C0 = CFrame.new(-0.0023, 0, -0.004)
NewPC_Weld.Parent = NewPC

local T = Instance.new("Part")
T.Name = "T"
T.Size = Vector3.new(0.431, 0.383, 0.428)
T.Color = Color3.fromRGB(218, 134, 122)
T.Material = Enum.Material.Glass
T.CanCollide = false
T.Massless = true
T.Parent = P_C

local T_Mesh = Instance.new("SpecialMesh")
T_Mesh.MeshId = getAsset("564d1bf18317a0a46b5a2b0077733b4f")
T_Mesh.MeshType = Enum.MeshType.FileMesh
T_Mesh.Parent = T

local T_Joint = Instance.new("Motor6D")
T_Joint.Name = "NewPC"
T_Joint.Part0 = P_C
T_Joint.Part1 = T
T_Joint.C0 = CFrame.new(-0.711918, 0.040504, 0.005760, -0.994518, 0, -0.104565, 0, 1, 0, 0.104565, 0, -0.994518)
T_Joint.Parent = P_C

local Cum = Instance.new("ParticleEmitter")
Cum.Name = "Cum"
Cum.Texture = "http://www.roblox.com/asset/?id=141285996"
Cum.Rate = 0
Cum.Lifetime = NumberRange.new(3.25)
Cum.Speed = NumberRange.new(1)
Cum.Acceleration = Vector3.new(0, -1, 0)
Cum.Size = NumberSequence.new(0.3)
Cum.EmissionDirection = Enum.NormalId.Bottom
Cum.Parent = T

local root = char:FindFirstChild("LowerTorso") or char:FindFirstChild("Torso") or char.HumanoidRootPart
local isR15 = char:FindFirstChild("LowerTorso") ~= nil

-- Different positioning for R6 vs R15
local weldOffset, weldRotation
if isR15 then
    -- R15 positioning (adjust as needed)
    weldOffset = CFrame.new(0, -0.1, -0.8)
    weldRotation = CFrame.Angles(math.rad(20), math.rad(-90), math.rad(0))
else
    -- R6 positioning
    weldOffset = CFrame.new(0.02, -0.97, -0.91)
    weldRotation = CFrame.Angles(math.rad(3.43), math.rad(-90.86), math.rad(10.29))
end

-- Weld base to body
local BodyWeld = Instance.new("Weld")
BodyWeld.Name = "BodyWeld"
BodyWeld.Part0 = root
BodyWeld.Part1 = P_C
BodyWeld.C0 = weldOffset * weldRotation
BodyWeld.Parent = P_C

-- Physics constraints for wobble (more intense)
local ballSocket = Instance.new("BallSocketConstraint")
ballSocket.Name = "MidSocket"
ballSocket.Attachment0 = baseAttachment
ballSocket.Attachment1 = midAttachment
ballSocket.LimitsEnabled = true
ballSocket.UpperAngle = 45  -- Increased from 25
ballSocket.TwistLimitsEnabled = true
ballSocket.TwistUpperAngle = 30  -- Increased from 15
ballSocket.TwistLowerAngle = -30
ballSocket.Parent = P_C

local spring = Instance.new("SpringConstraint")
spring.Name = "MidSpring"
spring.Attachment0 = baseAttachment
spring.Attachment1 = midAttachment
spring.FreeLength = 0.4
spring.Stiffness = 150  -- Reduced from 300 for more wobble
spring.Damping = 15  -- Reduced from 30 for longer wobble
spring.Parent = P_C

local tipSocket = Instance.new("BallSocketConstraint")
tipSocket.Name = "TipSocket"
tipSocket.Attachment0 = midAttachment
tipSocket.Attachment1 = tipAttachment
tipSocket.LimitsEnabled = true
tipSocket.UpperAngle = 35  -- Increased from 20
tipSocket.TwistLimitsEnabled = true
tipSocket.TwistUpperAngle = 25  -- Increased from 10
tipSocket.TwistLowerAngle = -25
tipSocket.Parent = P_C

local tipSpring = Instance.new("SpringConstraint")
tipSpring.Name = "TipSpring"
tipSpring.Attachment0 = midAttachment
tipSpring.Attachment1 = tipAttachment
tipSpring.FreeLength = 0.4
tipSpring.Stiffness = 100  -- Reduced from 200 for more wobble
tipSpring.Damping = 12  -- Reduced from 25 for longer wobble
tipSpring.Parent = P_C

-- Simulate bone influence on mesh deformation
local RunService = game:GetService("RunService")
local originalCFrame = P_C.CFrame

RunService.Heartbeat:Connect(function()
    local velocity = P_C.AssemblyLinearVelocity
    local speed = velocity.Magnitude
    
    -- Apply wobble based on movement
    if speed > 2 then
        local wobbleForce = speed * 0.5
        midAttachment.WorldPosition = midAttachment.WorldPosition + Vector3.new(
            math.sin(tick() * 8) * wobbleForce * 0.01,
            0,
            math.cos(tick() * 8) * wobbleForce * 0.01
        )
    end
end)

local toggle = false
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.F then
        toggle = not toggle
        Cum.Rate = toggle and 58 or 0
    end
end)
   end,
})

local Tab = Window:CreateTab("Scripts", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Scripts")

local Button = Tab:CreateButton({
   Name = "F3X",
   Callback = function()

loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()

   end,
})


local Button = Tab:CreateButton({
   Name = "Basic Adonis Bypass",
   Callback = function()

local getinfo = getinfo or debug.getinfo
local DEBUG = false
local Hooked = {}

local Detected, Kill

setthreadidentity(2)

for i, v in getgc(true) do
    if typeof(v) == "table" then
        local DetectFunc = rawget(v, "Detected")
        local KillFunc = rawget(v, "Kill")
    
        if typeof(DetectFunc) == "function" and not Detected then
            Detected = DetectFunc
            
            local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
                if Action ~= "_" then
                    if DEBUG then
                        warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
                    end
                end
                
                return true
            end)

            table.insert(Hooked, Detected)
        end

        if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
            Kill = KillFunc
            local Old; Old = hookfunction(Kill, function(Info)
                if DEBUG then
                    warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
                end
            end)

            table.insert(Hooked, Kill)
        end
    end
end

local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local LevelOrFunc, Info = ...

    if Detected and LevelOrFunc == Detected then
        if DEBUG then
            warn(`Adonis AntiCheat sanity check detected and broken`)
        end

        return coroutine.yield(coroutine.running())
    end
    
    return Old(...)
end))
-- setthreadidentity(9)
setthreadidentity(7)

   end,
})


local Button = Tab:CreateButton({
   Name = "Dex++",
   Callback = function()

--[[
	Dex++
	Version 2.2
	
	Developed by Chillz
	
	Dex++ is a revival of Moon's Dex, made to fulfill Moon's Dex prophecy.
]]

local selection
local nodes = {}

local oldgame = game
local game = workspace.Parent

cloneref = cloneref or function(ref)
	if not getreg then return ref end
	
	local InstanceList
	
	local a = Instance.new("Part")
	for _, c in pairs(getreg()) do
		if type(c) == "table" and #c then
			if rawget(c, "__mode") == "kvs" then
				for d, e in pairs(c) do
					if e == a then
						InstanceList = c
						break
					end
				end
			end
		end
	end
	local f = {}
	function f.invalidate(g)
		if not InstanceList then
			return
		end
		for b, c in pairs(InstanceList) do
			if c == g then
				InstanceList[b] = nil
				return g
			end
		end
	end
	return f.invalidate
end

local EmbeddedModules = {
["Console"] = function()
--[[
	Console Module
]]
-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local function main()
	local Console = {}

	local window,ConsoleFrame

	local OutputLimit = 500 -- Same as Roblox Console.


	-- Instances: 29 | Scripts: 1 | Modules: 1 | Tags: 0
	local G2L = {};

	-- StarterGui.ScreenGui
	window = Lib.Window.new()
	window:SetTitle("Console")
	window:Resize(500,400)
	Console.Window = window

	-- StarterGui.ScreenGui.Console
	ConsoleFrame = Instance.new("ImageButton", window.GuiElems.Content);
	ConsoleFrame["BorderSizePixel"] = 0;
	ConsoleFrame["AutoButtonColor"] = false;
	ConsoleFrame["BackgroundTransparency"] = 1;
	ConsoleFrame["BackgroundColor3"] = Color3.fromRGB(47, 47, 47);
	ConsoleFrame["Selectable"] = false;
	ConsoleFrame["Size"] = UDim2.new(1,0,1,0);
	ConsoleFrame["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	ConsoleFrame["Name"] = [[Console]];
	ConsoleFrame["Position"] = UDim2.new(0,0,0,0);


	-- StarterGui.ScreenGui.Console.CommandLine
	G2L["3"] = Lib.Frame.new().Gui--Instance.new("Frame", ConsoleFrame);
	G2L["3"].Parent = ConsoleFrame
	G2L["3"]["BorderSizePixel"] = 0;
	G2L["3"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37);
	G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 1);
	G2L["3"]["ClipsDescendants"] = true;
	G2L["3"]["Size"] = UDim2.new(1, -8, 0, 22);
	G2L["3"]["Position"] = UDim2.new(0.5, 0, 1, -5);
	G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["3"]["Name"] = [[CommandLine]];


	-- StarterGui.ScreenGui.Console.CommandLine.UIStroke
	G2L["4"] = Instance.new("UIStroke", G2L["3"]);
	G2L["4"]["Transparency"] = 0.65;
	G2L["4"]["Thickness"] = 1.25;


	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame
	G2L["5"] = Instance.new("ScrollingFrame", G2L["3"]);
	G2L["5"]["Active"] = true;
	G2L["5"]["ScrollingDirection"] = Enum.ScrollingDirection.X;
	G2L["5"]["BorderSizePixel"] = 0;
	G2L["5"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["5"]["ElasticBehavior"] = Enum.ElasticBehavior.Never;
	G2L["5"]["TopImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
	G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["5"]["HorizontalScrollBarInset"] = Enum.ScrollBarInset.Always;
	G2L["5"]["BottomImage"] = [[rbxasset://textures/ui/Scroll/scroll-middle.png]];
	G2L["5"]["AutomaticCanvasSize"] = Enum.AutomaticSize.X;
	G2L["5"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["5"]["ScrollBarImageColor3"] = Color3.fromRGB(57, 57, 57);
	G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["5"]["ScrollBarThickness"] = 2;
	G2L["5"]["BackgroundTransparency"] = 1;

	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame.TextBox
	G2L["6"] = Instance.new("TextBox", G2L["5"]);
	G2L["6"]["CursorPosition"] = -1;
	G2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["6"]["PlaceholderColor3"] = Color3.fromRGB(211, 211, 211);
	G2L["6"]["BorderSizePixel"] = 0;
	G2L["6"]["TextSize"] = 13;
	G2L["6"]["TextColor3"] = Color3.fromRGB(211, 211, 211);
	G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["6"]["AutomaticSize"] = Enum.AutomaticSize.X;
	G2L["6"]["ClearTextOnFocus"] = false;
	G2L["6"]["PlaceholderText"] = [[Run a command]];
	G2L["6"]["Size"] = UDim2.new(0, 246, 0, 22);
	G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["6"]["Text"] = [[]];
	G2L["6"]["BackgroundTransparency"] = 1;


	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame.TextBox.UIPadding
	G2L["7"] = Instance.new("UIPadding", G2L["6"]);
	G2L["7"]["PaddingLeft"] = UDim.new(0, 7);


	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame.Highlight
	G2L["8"] = Instance.new("TextLabel", G2L["5"]);
	G2L["8"]["Interactable"] = false;
	G2L["8"]["ZIndex"] = 2;
	G2L["8"]["BorderSizePixel"] = 0;
	G2L["8"]["TextSize"] = 13;
	G2L["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["8"]["BackgroundTransparency"] = 1;
	G2L["8"]["RichText"] = true;
	G2L["8"]["Size"] = UDim2.new(0, 246, 0, 22);
	G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["8"]["Text"] = [[]];
	G2L["8"]["Selectable"] = true;
	G2L["8"]["AutomaticSize"] = Enum.AutomaticSize.X;
	G2L["8"]["Name"] = [[Highlight]];


	-- StarterGui.ScreenGui.Console.CommandLine.ScrollingFrame.Highlight.UIPadding
	G2L["9"] = Instance.new("UIPadding", G2L["8"]);
	G2L["9"]["PaddingLeft"] = UDim.new(0, 7);

	G2L["backgroundOutput"] = Instance.new("Frame", ConsoleFrame);
	G2L["backgroundOutput"]["BorderSizePixel"] = 0;
	G2L["backgroundOutput"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
	G2L["backgroundOutput"]["Name"] = [[BackgroundOutput]];
	G2L["backgroundOutput"]["AnchorPoint"] = Vector2.new(0, 0);
	G2L["backgroundOutput"]["Size"] = UDim2.new(1, -8, 1, -55);
	G2L["backgroundOutput"]["Position"] = UDim2.new(0, 4, 0, 23);
	G2L["backgroundOutput"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["backgroundOutput"]["ZIndex"] = 1;

	local scrollbar = Lib.ScrollBar.new()
	scrollbar.Gui.Parent = ConsoleFrame
	scrollbar.Gui.Size = UDim2.new(0, 16, 1, -55);
	scrollbar.Gui.Position = UDim2.new(1, -20,0, 23);
	scrollbar.Gui.Up.ZIndex = 3
	scrollbar.Gui.Down.ZIndex = 3

	-- StarterGui.ScreenGui.Console.Output
	G2L["a"] = Instance.new("ScrollingFrame", ConsoleFrame);
	G2L["a"]["Active"] = true;
	G2L["a"]["BorderSizePixel"] = 0;
	G2L["a"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	G2L["a"]["TopImage"] = '';
	G2L["a"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
	G2L["a"].BackgroundTransparency = 1
	G2L["a"]["Name"] = [[Output]];
	G2L["a"]["ScrollBarImageTransparency"] = 0;
	G2L["a"]["BottomImage"] = '';
	G2L["a"]["AnchorPoint"] = Vector2.new(0, 0);
	G2L["a"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	G2L["a"]["Size"] = UDim2.new(1, -8, 1, -55);
	G2L["a"]["Position"] = UDim2.new(0, 4, 0, 23);
	G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["a"].ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70)
	G2L["a"]["ScrollBarThickness"] = 16;
	G2L["a"]["ZIndex"] = 1;

	G2L["a"]:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
		if G2L["a"].AbsoluteCanvasSize ~= G2L["a"].AbsoluteWindowSize then
			scrollbar.Gui.Visible = true
		else
			scrollbar.Gui.Visible = false
		end
	end)

	-- StarterGui.ScreenGui.Console.Output.UIListLayout
	G2L["b"] = Instance.new("UIListLayout", G2L["a"]);
	G2L["b"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


	-- StarterGui.ScreenGui.Console.Output.UIStroke
	G2L["c"] = Instance.new("UIStroke", G2L["a"]);
	G2L["c"]["Transparency"] = 0.7;
	G2L["c"]["Thickness"] = 1.25;
	G2L["c"]["Color"] = Color3.fromRGB(12, 12, 12);


	-- StarterGui.ScreenGui.Console.Output.OutputTextSize
	G2L["d"] = Instance.new("NumberValue", G2L["a"]);
	G2L["d"]["Name"] = [[OutputTextSize]];
	G2L["d"]["Value"] = 15;


	-- StarterGui.ScreenGui.Console.Output.OutputLimit
	G2L["e"] = Instance.new("NumberValue", G2L["a"]);
	G2L["e"]["Name"] = [[OutputLimit]];
	G2L["e"]["Value"] = OutputLimit;


	-- StarterGui.ScreenGui.Console.Output.UIPadding
	G2L["f"] = Instance.new("UIPadding", G2L["a"]);
	G2L["f"]["PaddingTop"] = UDim.new(0, 2);


	-- StarterGui.ScreenGui.Console.TextSizeBox
	G2L["10"] = Instance.new("Frame", ConsoleFrame);
	G2L["10"]["BorderSizePixel"] = 0;
	G2L["10"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 37);
	G2L["10"]["ClipsDescendants"] = true;
	G2L["10"]["Size"] = UDim2.new(0, 37, 0, 15);
	G2L["10"]["Position"] = UDim2.new(0, 4, 0, 4);
	G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["10"]["Name"] = [[TextSizeBox]];


	-- StarterGui.ScreenGui.Console.TextSizeBox.TextBox
	G2L["11"] = Instance.new("TextBox", G2L["10"]);
	G2L["11"]["PlaceholderColor3"] = Color3.fromRGB(108, 108, 108);
	G2L["11"]["BorderSizePixel"] = 0;
	G2L["11"]["TextWrapped"] = true;
	G2L["11"]["TextSize"] = 15;
	G2L["11"]["TextColor3"] = Color3.fromRGB(211, 211, 211);
	G2L["11"]["TextScaled"] = true;
	G2L["11"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/Inconsolata.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["11"]["PlaceholderText"] = [[Size]];
	G2L["11"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["11"]["Text"] = [[]];
	G2L["11"]["BackgroundTransparency"] = 1;


	-- StarterGui.ScreenGui.Console.TextSizeBox.TextBox.UIPadding
	G2L["12"] = Instance.new("UIPadding", G2L["11"]);
	G2L["12"]["PaddingTop"] = UDim.new(0, 2);
	G2L["12"]["PaddingRight"] = UDim.new(0, 5);
	G2L["12"]["PaddingLeft"] = UDim.new(0, 5);
	G2L["12"]["PaddingBottom"] = UDim.new(0, 2);


	-- StarterGui.ScreenGui.Console.TextSizeBox.UIStroke
	G2L["13"] = Instance.new("UIStroke", G2L["10"]);
	G2L["13"]["Transparency"] = 0.65;
	G2L["13"]["Thickness"] = 1.25;


	-- StarterGui.ScreenGui.Console.Clear
	G2L["14"] = Instance.new("ImageButton", ConsoleFrame);
	G2L["14"]["BorderSizePixel"] = 0;
	G2L["14"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
	G2L["14"]["Size"] = UDim2.new(0, 37, 0, 15);
	G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["14"]["Name"] = [[Clear]];
	G2L["14"]["Position"] = UDim2.new(1, -42, 0, 4);


	-- StarterGui.ScreenGui.Console.Clear.TextLabel
	G2L["15"] = Instance.new("TextLabel", G2L["14"]);
	G2L["15"]["TextWrapped"] = true;
	G2L["15"]["Interactable"] = false;
	G2L["15"]["BorderSizePixel"] = 0;
	G2L["15"]["TextSize"] = 20;
	G2L["15"]["TextScaled"] = true;
	G2L["15"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["15"]["BackgroundTransparency"] = 1;
	G2L["15"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["15"]["Text"] = [[Clear]];


	-- StarterGui.ScreenGui.Console.Clear.UIPadding
	G2L["16"] = Instance.new("UIPadding", G2L["14"]);
	G2L["16"]["PaddingTop"] = UDim.new(0, 1);
	G2L["16"]["PaddingBottom"] = UDim.new(0, 1);


	-- StarterGui.ScreenGui.Console.OutputTemplate
	G2L["17"] = Instance.new("TextBox", ConsoleFrame);
	G2L["17"]["Visible"] = false;
	G2L["17"]["Active"] = false;
	G2L["17"]["Name"] = [[OutputTemplate]];
	G2L["17"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	G2L["17"]["BorderSizePixel"] = 0;
	G2L["17"]["TextEditable"] = false;
	G2L["17"]["TextWrapped"] = true;
	G2L["17"]["TextSize"] = 15;
	G2L["17"]["TextColor3"] = Color3.fromRGB(171, 171, 171);
	G2L["17"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["17"]["RichText"] = true;
	G2L["17"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["17"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	G2L["17"]["Selectable"] = false;
	G2L["17"]["ClearTextOnFocus"] = false;
	G2L["17"]["Size"] = UDim2.new(1, 0, 0, 1);
	G2L["17"]["Position"] = UDim2.new(0, 20, 0, 0);
	G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["17"]["Text"] = [[(timestamp) <font color="rgb(255, 255, 255)">Output</font>]];
	G2L["17"]["BackgroundTransparency"] = 1;


	-- StarterGui.ScreenGui.Console.OutputTemplate.UIPadding
	G2L["18"] = Instance.new("UIPadding", G2L["17"]);
	G2L["18"]["PaddingRight"] = UDim.new(0, 6);
	G2L["18"]["PaddingLeft"] = UDim.new(0, 6);


	-- StarterGui.ScreenGui.Console.CtrlScroll
	G2L["19"] = Instance.new("ImageButton", ConsoleFrame);
	G2L["19"]["BorderSizePixel"] = 0;
	G2L["19"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
	G2L["19"]["Size"] = UDim2.new(0, 60, 0, 15);
	G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["19"]["Name"] = [[CtrlScroll]];
	G2L["19"]["Position"] = UDim2.new(0, 46, 0, 4);


	-- StarterGui.ScreenGui.Console.CtrlScroll.TextLabel
	G2L["1a"] = Instance.new("TextLabel", G2L["19"]);
	G2L["1a"]["TextWrapped"] = true;
	G2L["1a"]["Interactable"] = false;
	G2L["1a"]["BorderSizePixel"] = 0;
	G2L["1a"]["TextSize"] = 20;
	G2L["1a"]["TextScaled"] = true;
	G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1a"]["BackgroundTransparency"] = 1;
	G2L["1a"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["1a"]["Text"] = [[Ctrl Scroll]];


	-- StarterGui.ScreenGui.Console.CtrlScroll.UIPadding
	G2L["1b"] = Instance.new("UIPadding", G2L["19"]);
	G2L["1b"]["PaddingTop"] = UDim.new(0, 1);
	G2L["1b"]["PaddingBottom"] = UDim.new(0, 1);

	-- StarterGui.ScreenGui.Console.AutoScroll
	G2L["20"] = Instance.new("ImageButton", ConsoleFrame);
	G2L["20"]["BorderSizePixel"] = 0;
	G2L["20"]["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
	G2L["20"]["Size"] = UDim2.new(0, 60, 0, 15);
	G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["20"]["Name"] = [[AutoScroll]];
	G2L["20"]["Position"] = UDim2.new(0, 110, 0, 4);


	-- StarterGui.ScreenGui.Console.AutoScroll.TextLabel
	G2L["1e"] = Instance.new("TextLabel", G2L["20"]);
	G2L["1e"]["TextWrapped"] = true;
	G2L["1e"]["Interactable"] = false;
	G2L["1e"]["BorderSizePixel"] = 0;
	G2L["1e"]["TextSize"] = 20;
	G2L["1e"]["TextScaled"] = true;
	G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	G2L["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	G2L["1e"]["BackgroundTransparency"] = 1;
	G2L["1e"]["Size"] = UDim2.new(1, 0, 1, 0);
	G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	G2L["1e"]["Text"] = [[Auto Scroll]];


	-- StarterGui.ScreenGui.Console.AutoScroll.UIPadding
	G2L["1f"] = Instance.new("UIPadding", G2L["20"]);
	G2L["1f"]["PaddingTop"] = UDim.new(0, 1);
	G2L["1f"]["PaddingBottom"] = UDim.new(0, 1);


	-- StarterGui.ScreenGui.ConsoleHandler
	G2L["1c"] = Instance.new("LocalScript", G2L["1"]);
	G2L["1c"]["Name"] = [[ConsoleHandler]];


	-- StarterGui.ScreenGui.ConsoleHandler.SyntaxHighlighter
	G2L["1d"] = Instance.new("ModuleScript", G2L["1c"]);
	G2L["1d"]["Name"] = [[SyntaxHighlighter]];


	-- Require G2L wrapper
	local G2L_REQUIRE = require;
	local G2L_MODULES = {};
	local function require(Module)
		local ModuleState = G2L_MODULES[Module];
		if ModuleState then
			if not ModuleState.Required then
				ModuleState.Required = true;
				ModuleState.Value = ModuleState.Closure();
			end
			return ModuleState.Value;
		end;
		return G2L_REQUIRE(Module);
	end

	G2L_MODULES[G2L["1d"]] = {
		Closure = function()
			local script = G2L["1d"];local highlighter = {}
			local keywords = {
				lua = {
					"and", "break", "or", "else", "elseif", "if", "then", "until", "repeat", "while", "do", "for", "in", "end",
					"local", "return", "function", "export"
				},
				rbx = {
					"game", "workspace", "script", "math", "string", "table", "task", "wait", "select", "next", "Enum",
					"error", "warn", "tick", "assert", "shared", "loadstring", "tonumber", "tostring", "type",
					"typeof", "unpack", "print", "Instance", "CFrame", "Vector3", "Vector2", "Color3", "UDim", "UDim2", "Ray", "BrickColor",
					"OverlapParams", "RaycastParams", "Axes", "Random", "Region3", "Rect", "TweenInfo",
					"collectgarbage", "not", "utf8", "pcall", "xpcall", "_G", "setmetatable", "getmetatable", "os", "pairs", "ipairs"
				},
				exploit = {
					"hookmetamethod", "hookfunction", "getgc", "filtergc", "Drawing", "getgenv", "getsenv", "getrenv", "getfenv", "setfenv",
					"decompile", "saveinstance", "getrawmetatable", "setrawmetatable", "checkcaller", "cloneref", "clonefunction",
					"iscclosure", "islclosure", "isexecutorclosure", "newcclosure", "getfunctionhash", "crypt", "writefile", "appendfile", "loadfile", "readfile", "listfiles",
					"makefolder", "isfolder", "isfile", "delfile", "delfolder", "getcustomasset", "fireclickdetector", "firetouchinterest", "fireproximityprompt"
				},
				operators = {
					"#", "+", "-", "*", "%", "/", "^", "=", "~", "=", "<", ">", ",", ".", "(", ")", "{", "}", "[", "]", ";", ":"
				}
			}

			local colors = {
				numbers = Color3.fromRGB(255, 198, 0),
				boolean = Color3.fromRGB(255, 198, 0),
				operator = Color3.fromRGB(204, 204, 204),
				lua = Color3.fromRGB(132, 214, 247),
				exploit = Color3.fromRGB(171, 84, 247),
				rbx = Color3.fromRGB(248, 109, 124),
				str = Color3.fromRGB(173, 241, 132),
				comment = Color3.fromRGB(102, 102, 102),
				null = Color3.fromRGB(255, 198, 0),
				call = Color3.fromRGB(253, 251, 172),
				self_call = Color3.fromRGB(253, 251, 172),
				local_color = Color3.fromRGB(248, 109, 115),
				function_color = Color3.fromRGB(248, 109, 115),
				self_color = Color3.fromRGB(248, 109, 115),
				local_property = Color3.fromRGB(97, 161, 241),
			}

			local function createKeywordSet(keywords)
				local keywordSet = {}
				for _, keyword in ipairs(keywords) do
					keywordSet[keyword] = true
				end
				return keywordSet
			end

			local luaSet = createKeywordSet(keywords.lua)
			local exploitSet = createKeywordSet(keywords.exploit)
			local rbxSet = createKeywordSet(keywords.rbx)
			local operatorsSet = createKeywordSet(keywords.operators)

			local function getHighlight(tokens, index)
				local token = tokens[index]

				if colors[token .. "_color"] then
					return colors[token .. "_color"]
				end

				if tonumber(token) then
					return colors.numbers
				elseif token == "nil" then
					return colors.null
				elseif token:sub(1, 2) == "--" then
					return colors.comment
				elseif operatorsSet[token] then
					return colors.operator
				elseif luaSet[token] then
					return colors.rbx
				elseif rbxSet[token] then
					return colors.lua
				elseif exploitSet[token] then
					return colors.exploit
				elseif token:sub(1, 1) == "\"" or token:sub(1, 1) == "\'" then
					return colors.str
				elseif token == "true" or token == "false" then
					return colors.boolean
				end

				if tokens[index + 1] == "(" then
					if tokens[index - 1] == ":" then
						return colors.self_call
					end

					return colors.call
				end

				if tokens[index - 1] == "." then
					if tokens[index - 2] == "Enum" then
						return colors.rbx
					end

					return colors.local_property
				end
			end

			function highlighter.run(source)
				local tokens = {}
				local currentToken = ""

				local inString = false
				local inComment = false
				local commentPersist = false

				for i = 1, #source do
					local character = source:sub(i, i)

					if inComment then
						if character == "\n" and not commentPersist then
							table.insert(tokens, currentToken)
							table.insert(tokens, character)
							currentToken = ""

							inComment = false
						elseif source:sub(i - 1, i) == "]]" and commentPersist then
							currentToken ..= "]"

							table.insert(tokens, currentToken)
							currentToken = ""

							inComment = false
							commentPersist = false
						else
							currentToken = currentToken .. character
						end
					elseif inString then
						if character == inString and source:sub(i-1, i-1) ~= "\\" or character == "\n" then
							currentToken = currentToken .. character
							inString = false
						else
							currentToken = currentToken .. character
						end
					else
						if source:sub(i, i + 1) == "--" then
							table.insert(tokens, currentToken)
							currentToken = "-"
							inComment = true
							commentPersist = source:sub(i + 2, i + 3) == "[["
						elseif character == "\"" or character == "\'" then
							table.insert(tokens, currentToken)
							currentToken = character
							inString = character
						elseif operatorsSet[character] then
							table.insert(tokens, currentToken)
							table.insert(tokens, character)
							currentToken = ""
						elseif character:match("[%w_]") then
							currentToken = currentToken .. character
						else
							table.insert(tokens, currentToken)
							table.insert(tokens, character)
							currentToken = ""
						end
					end
				end

				table.insert(tokens, currentToken)

				local highlighted = {}

				for i, token in ipairs(tokens) do
					local highlight = getHighlight(tokens, i)

					if highlight then
						local syntax = string.format("<font color = \"#%s\">%s</font>", highlight:ToHex(), token:gsub("<", "&lt;"):gsub(">", "&gt;"))

						table.insert(highlighted, syntax)
					else
						table.insert(highlighted, token)
					end
				end

				return table.concat(highlighted)
			end

			return highlighter
		end;
	};

	Console.Init = function()
		-- StarterGui.ScreenGui.ConsoleHandler

		local CtrlScroll = false
		local AutoScroll = false

		local LogService = game:GetService("LogService")
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer
		local Mouse = LocalPlayer:GetMouse()
		local UserInputService = game:GetService("UserInputService")
		local RunService = game:GetService("RunService")

		local Console = ConsoleFrame
		local SyntaxHighlightingModule = require(G2L["1c"].SyntaxHighlighter)
		local OutputTextSize = Console.Output.OutputTextSize

		local function Tween(obj, info, prop)
			local tween = game:GetService("TweenService"):Create(obj, info, prop)
			tween:Play()
			return tween
		end



		-- MOUSE STUFFS

		if CtrlScroll == true then
			Console.CtrlScroll.BackgroundColor3 = Color3.fromRGB(11, 90, 175)
		elseif CtrlScroll == false then
			Console.CtrlScroll.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
		end
		Console.CtrlScroll.MouseButton1Click:Connect(function()
			CtrlScroll = not CtrlScroll
			if CtrlScroll == true then
				Console.CtrlScroll.BackgroundColor3 = Color3.fromRGB(11, 90, 175)
			elseif CtrlScroll == false then
				Console.CtrlScroll.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			end
		end)

		local IsHoldingCTRL = false
		UserInputService.InputBegan:Connect(function(input, gameproc)
			if not gameproc then
				if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
					IsHoldingCTRL = true
				end
			end
		end)
		UserInputService.InputEnded:Connect(function(input, gameproc)
			if not gameproc then
				if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then
					IsHoldingCTRL = false
				end
			end
		end)

		if AutoScroll == true then
			Console.AutoScroll.BackgroundColor3 = Color3.fromRGB(11, 90, 175)
		elseif AutoScroll == false then
			Console.AutoScroll.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
		end
		Console.AutoScroll.MouseButton1Click:Connect(function()
			AutoScroll = not AutoScroll
			if AutoScroll == true then
				Console.AutoScroll.BackgroundColor3 = Color3.fromRGB(11, 90, 175)
				Console.Output.CanvasPosition = Vector2.new(0, 9e9)
			elseif AutoScroll == false then
				Console.AutoScroll.BackgroundColor3 = Color3.fromRGB(56, 56, 56)
			end
		end)

		-- Console part
		local displayedOutput = {}
		local OutputLimit = Console.Output.OutputLimit

		Console.TextSizeBox.TextBox.Text = tostring(OutputTextSize.Value)

		Console.TextSizeBox.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
			local tonum = tonumber(Console.TextSizeBox.TextBox.Text)
			if tonum then
				OutputTextSize.Value = tonum
			end
		end)
		OutputTextSize:GetPropertyChangedSignal("Value"):Connect(function()
			Console.TextSizeBox.TextBox.Text = tostring(OutputTextSize.Value)
		end)

		local scrollConsoleInput
		Console.Output.MouseEnter:Connect(function()
			scrollConsoleInput = UserInputService.InputChanged:Connect(function(input)
				if CtrlScroll and input.UserInputType == Enum.UserInputType.MouseWheel and IsHoldingCTRL == true then
					Console.Output.ScrollingEnabled = false
					local newTextSize = OutputTextSize.Value + input.Position.Z
					if newTextSize >= 1 then
						OutputTextSize.Value = newTextSize
					end
				else
					Console.Output.ScrollingEnabled = true
				end
			end)
		end)
		Console.Output.MouseLeave:Connect(function()
			if scrollConsoleInput then
				scrollConsoleInput:Disconnect()
				scrollConsoleInput = nil
			end
		end)


		Console.Clear.MouseButton1Click:Connect(function()
			for _, log in pairs(Console.Output:GetChildren()) do
				if log:IsA("TextBox") then
					log:Destroy()
				end
			end
		end)

		local focussedOutput

		LogService.MessageOut:Connect(function(msg, msgtype)
			local formattedText = ""
			local unformattedText = ""
			local newOutputText = Console.OutputTemplate:Clone()
			table.insert(displayedOutput, newOutputText)

			if #displayedOutput > OutputLimit.Value then
				local oldest = table.remove(displayedOutput, 1)
				if oldest and typeof(oldest) == "Instance" then
					oldest:Destroy()
				end
			end

			unformattedText = os.date("%H:%M:%S")..'   '..msg
			if msgtype == Enum.MessageType.MessageOutput then
				formattedText = os.date("%H:%M:%S")..'   <font color="rgb(204, 204, 204)">'..msg..'</font>'
				newOutputText.Text = formattedText
			elseif msgtype == Enum.MessageType.MessageWarning then
				formattedText = os.date("%H:%M:%S")..'   <b><font color="rgb(255, 142, 60)">'..msg..'</font></b>'
				newOutputText.Text = formattedText
			elseif msgtype == Enum.MessageType.MessageError then
				formattedText = os.date("%H:%M:%S")..'   <b><font color="rgb(255, 68, 68)">'..msg..'</font></b>'
				newOutputText.Text = formattedText
			elseif msgtype == Enum.MessageType.MessageInfo then
				formattedText = os.date("%H:%M:%S")..'   <font color="rgb(128, 215, 255)">'..msg..'</font>'
				newOutputText.Text = formattedText
			end

			newOutputText.TextSize = OutputTextSize.Value
			OutputTextSize:GetPropertyChangedSignal("Value"):Connect(function()
				newOutputText.TextSize = OutputTextSize.Value
			end)

			newOutputText.Focused:Connect(function()
				focussedOutput = newOutputText
				newOutputText.Text = unformattedText
			end)
			newOutputText.FocusLost:Connect(function()
				focussedOutput = nil
				newOutputText.Text = formattedText
			end)

			newOutputText.Parent = Console.Output
			newOutputText.Visible = true

			if AutoScroll then
				Console.Output.CanvasPosition = Vector2.new(0, 9e9)
			end
		end)

		Console.Output.MouseLeave:Connect(function()
			if focussedOutput then
				focussedOutput:ReleaseFocus()
			end
		end)

		Console.CommandLine.ScrollingFrame.TextBox:GetPropertyChangedSignal("Text"):Connect(function()

			local oneliner = string.gsub(Console.CommandLine.ScrollingFrame.TextBox.Text, "\n", "    ")
			Console.CommandLine.ScrollingFrame.TextBox.Text = oneliner

			Console.CommandLine.ScrollingFrame.Highlight.Text = SyntaxHighlightingModule.run(Console.CommandLine.ScrollingFrame.TextBox.Text)
		end)



		Console.CommandLine.ScrollingFrame.TextBox.FocusLost:Connect(function(enterPressed)
			if enterPressed and Console.CommandLine.ScrollingFrame.TextBox.Text ~= "" then
				print("> "..Console.CommandLine.ScrollingFrame.TextBox.Text)
				loadstring(Console.CommandLine.ScrollingFrame.TextBox.Text)()
			end
		end)
	end

	return Console
end

return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end,
["Explorer"] = function()
--[[
	Explorer App Module
	
	The main explorer interface
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, ModelViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	ModelViewer = Apps.ModelViewer
	Notebook = Apps.Notebook
end

local function main()
	local Explorer = {}
	local tree,listEntries,explorerOrders,searchResults,specResults = {},{},{},{},{}
	local expanded
	local entryTemplate,treeFrame,toolBar,descendantAddedCon,descendantRemovingCon,itemChangedCon
	local ffa = game.FindFirstAncestorWhichIsA
	local getDescendants = game.GetDescendants
	local getTextSize = service.TextService.GetTextSize
	local updateDebounce,refreshDebounce = false,false
	local nilNode = {Obj = Instance.new("Folder")}
	local idCounter = 0
	local scrollV,scrollH,clipboard
	local renameBox,renamingNode,searchFunc
	local sortingEnabled,autoUpdateSearch
	local table,math = table,math
	local nilMap,nilCons = {},{}
	local connectSignal = game.DescendantAdded.Connect
	local addObject,removeObject,moveObject = nil,nil,nil

	local iconData
	local remote_blocklist = {} -- list of remotes beng blocked, k = the remote instance, v = their old function :3
	nodes = nodes or {}

	addObject = function(root)
		if nodes[root] then return end

		local isNil = false
		local rootParObj = ffa(root,"Instance")
		local par = nodes[rootParObj]

		-- Nil Handling
		if not par then
			if nilMap[root] then
				nilCons[root] = nilCons[root] or {
					connectSignal(root.ChildAdded,addObject),
					connectSignal(root.AncestryChanged,moveObject),
				}
				par = nilNode
				isNil = true
			else
				return
			end
		elseif nilMap[rootParObj] or par == nilNode then
			nilMap[root] = true
			nilCons[root] = nilCons[root] or {
				connectSignal(root.ChildAdded,addObject),
				connectSignal(root.AncestryChanged,moveObject),
			}
			isNil = true
		end

		local newNode = {Obj = root, Parent = par}
		nodes[root] = newNode

		-- Automatic sorting if expanded
		if sortingEnabled and expanded[par] and par.Sorted then
			local left,right = 1,#par
			local floor = math.floor
			local sorter = Explorer.NodeSorter
			local pos = (right == 0 and 1)

			if not pos then
				while true do
					if left >= right then
						if sorter(newNode,par[left]) then
							pos = left
						else
							pos = left+1
						end
						break
					end

					local mid = floor((left+right)/2)
					if sorter(newNode,par[mid]) then
						right = mid-1
					else
						left = mid+1
					end
				end
			end

			table.insert(par,pos,newNode)
		else
			par[#par+1] = newNode
			par.Sorted = nil
		end

		local insts = getDescendants(root)
		for i = 1,#insts do
			local obj = insts[i]
			if nodes[obj] then continue end -- Deferred

			local par = nodes[ffa(obj,"Instance")]
			if not par then continue end
			local newNode = {Obj = obj, Parent = par}
			nodes[obj] = newNode
			par[#par+1] = newNode

			-- Nil Handling
			if isNil then
				nilMap[obj] = true
				nilCons[obj] = nilCons[obj] or {
					connectSignal(obj.ChildAdded,addObject),
					connectSignal(obj.AncestryChanged,moveObject),
				}
			end
		end

		if searchFunc and autoUpdateSearch then
			searchFunc({newNode})
		end

		if not updateDebounce and Explorer.IsNodeVisible(par) then
			if expanded[par] then
				Explorer.PerformUpdate()
			elseif not refreshDebounce then
				Explorer.PerformRefresh()
			end
		end
	end

	removeObject = function(root)
		local node = nodes[root]
		if not node then return end

		-- Nil Handling
		if nilMap[node.Obj] then
			moveObject(node.Obj)
			return
		end

		local par = node.Parent
		if par then
			par.HasDel = true
		end

		local function recur(root)
			for i = 1,#root do
				local node = root[i]
				if not node.Del then
					nodes[node.Obj] = nil
					if #node > 0 then recur(node) end
				end
			end
		end
		recur(node)
		node.Del = true
		nodes[root] = nil

		if par and not updateDebounce and Explorer.IsNodeVisible(par) then
			if expanded[par] then
				Explorer.PerformUpdate()
			elseif not refreshDebounce then
				Explorer.PerformRefresh()
			end
		end
	end

	moveObject = function(obj)
		local node = nodes[obj]
		if not node then return end

		local oldPar = node.Parent
		local newPar = nodes[ffa(obj,"Instance")]
		if oldPar == newPar then return end

		-- Nil Handling
		if not newPar then
			if nilMap[obj] then
				newPar = nilNode
			else
				return
			end
		elseif nilMap[newPar.Obj] or newPar == nilNode then
			nilMap[obj] = true
			nilCons[obj] = nilCons[obj] or {
				connectSignal(obj.ChildAdded,addObject),
				connectSignal(obj.AncestryChanged,moveObject),
			}
		end

		if oldPar then
			local parPos = table.find(oldPar,node)
			if parPos then table.remove(oldPar,parPos) end
		end

		node.Id = nil
		node.Parent = newPar

		if sortingEnabled and expanded[newPar] and newPar.Sorted then
			local left,right = 1,#newPar
			local floor = math.floor
			local sorter = Explorer.NodeSorter
			local pos = (right == 0 and 1)

			if not pos then
				while true do
					if left >= right then
						if sorter(node,newPar[left]) then
							pos = left
						else
							pos = left+1
						end
						break
					end

					local mid = floor((left+right)/2)
					if sorter(node,newPar[mid]) then
						right = mid-1
					else
						left = mid+1
					end
				end
			end

			table.insert(newPar,pos,node)
		else
			newPar[#newPar+1] = node
			newPar.Sorted = nil
		end

		if searchFunc and searchResults[node] then
			local currentNode = node.Parent
			while currentNode and (not searchResults[currentNode] or expanded[currentNode] == 0) do
				expanded[currentNode] = true
				searchResults[currentNode] = true
				currentNode = currentNode.Parent
			end
		end

		if not updateDebounce and (Explorer.IsNodeVisible(newPar) or Explorer.IsNodeVisible(oldPar)) then
			if expanded[newPar] or expanded[oldPar] then
				Explorer.PerformUpdate()
			elseif not refreshDebounce then
				Explorer.PerformRefresh()
			end
		end
	end

	Explorer.ViewWidth = 0
	Explorer.Index = 0
	Explorer.EntryIndent = 20
	Explorer.FreeWidth = 32
	Explorer.GuiElems = {}

	Explorer.InitRenameBox = function()
		renameBox = create({{1,"TextBox",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.062745101749897,0.51764708757401,1),BorderMode=2,ClearTextOnFocus=false,Font=3,Name="RenameBox",PlaceholderColor3=Color3.new(0.69803923368454,0.69803923368454,0.69803923368454),Position=UDim2.new(0,26,0,2),Size=UDim2.new(0,200,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,Visible=false,ZIndex=2}}})

		renameBox.Parent = Explorer.Window.GuiElems.Content.List

		renameBox.FocusLost:Connect(function()
			if not renamingNode then return end

			pcall(function() renamingNode.Obj.Name = renameBox.Text end)
			renamingNode = nil
			Explorer.Refresh()
		end)

		renameBox.Focused:Connect(function()
			renameBox.SelectionStart = 1
			renameBox.CursorPosition = #renameBox.Text + 1
		end)
	end

	Explorer.SetRenamingNode = function(node)
		renamingNode = node
		renameBox.Text = tostring(node.Obj)
		renameBox:CaptureFocus()
		Explorer.Refresh()
	end

	Explorer.SetSortingEnabled = function(val)
		sortingEnabled = val
		Settings.Explorer.Sorting = val
	end

	Explorer.UpdateView = function()
		local maxNodes = math.ceil(treeFrame.AbsoluteSize.Y / 20)
		local maxX = treeFrame.AbsoluteSize.X
		local totalWidth = Explorer.ViewWidth + Explorer.FreeWidth

		scrollV.VisibleSpace = maxNodes
		scrollV.TotalSpace = #tree + 1
		scrollH.VisibleSpace = maxX
		scrollH.TotalSpace = totalWidth

		scrollV.Gui.Visible = #tree + 1 > maxNodes
		scrollH.Gui.Visible = totalWidth > maxX

		local oldSize = treeFrame.Size
		treeFrame.Size = UDim2.new(1,(scrollV.Gui.Visible and -16 or 0),1,(scrollH.Gui.Visible and -39 or -23))
		if oldSize ~= treeFrame.Size then
			Explorer.UpdateView()
		else
			scrollV:Update()
			scrollH:Update()

			renameBox.Size = UDim2.new(0,maxX-100,0,16)

			if scrollV.Gui.Visible and scrollH.Gui.Visible then
				scrollV.Gui.Size = UDim2.new(0,16,1,-39)
				scrollH.Gui.Size = UDim2.new(1,-16,0,16)
				Explorer.Window.GuiElems.Content.ScrollCorner.Visible = true
			else
				scrollV.Gui.Size = UDim2.new(0,16,1,-23)
				scrollH.Gui.Size = UDim2.new(1,0,0,16)
				Explorer.Window.GuiElems.Content.ScrollCorner.Visible = false
			end

			Explorer.Index = scrollV.Index
		end
	end

	Explorer.NodeSorter = function(a,b)
		if a.Del or b.Del then return false end -- Ghost node

		local aClass = a.Class
		local bClass = b.Class
		if not aClass then aClass = a.Obj.ClassName a.Class = aClass end
		if not bClass then bClass = b.Obj.ClassName b.Class = bClass end

		local aOrder = explorerOrders[aClass]
		local bOrder = explorerOrders[bClass]
		if not aOrder then aOrder = RMD.Classes[aClass] and tonumber(RMD.Classes[aClass].ExplorerOrder) or 9999 explorerOrders[aClass] = aOrder end
		if not bOrder then bOrder = RMD.Classes[bClass] and tonumber(RMD.Classes[bClass].ExplorerOrder) or 9999 explorerOrders[bClass] = bOrder end

		if aOrder ~= bOrder then
			return aOrder < bOrder
		else
			local aName,bName = tostring(a.Obj),tostring(b.Obj)
			if aName ~= bName then
				return aName < bName
			elseif aClass ~= bClass then
				return aClass < bClass
			else
				local aId = a.Id if not aId then aId = idCounter idCounter = (idCounter+0.001)%999999999 a.Id = aId end
				local bId = b.Id if not bId then bId = idCounter idCounter = (idCounter+0.001)%999999999 b.Id = bId end
				return aId < bId
			end
		end
	end

	Explorer.Update = function()
		table.clear(tree)
		local maxNameWidth,maxDepth,count = 0,1,1
		local nameCache = {}
		local font = Enum.Font.SourceSans
		local size = Vector2.new(math.huge,20)
		local useNameWidth = Settings.Explorer.UseNameWidth
		local tSort = table.sort
		local sortFunc = Explorer.NodeSorter
		local isSearching = (expanded == Explorer.SearchExpanded)
		local textServ = service.TextService

		local function recur(root,depth)
			if depth > maxDepth then maxDepth = depth end
			depth = depth + 1
			if sortingEnabled and not root.Sorted then
				tSort(root,sortFunc)
				root.Sorted = true
			end
			for i = 1,#root do
				local n = root[i]

				if (isSearching and not searchResults[n]) or n.Del then continue end

				if useNameWidth then
					local nameWidth = n.NameWidth
					if not nameWidth then
						local objName = tostring(n.Obj)
						nameWidth = nameCache[objName]
						if not nameWidth then
							nameWidth = getTextSize(textServ,objName,14,font,size).X
							nameCache[objName] = nameWidth
						end
						n.NameWidth = nameWidth
					end
					if nameWidth > maxNameWidth then
						maxNameWidth = nameWidth
					end
				end

				tree[count] = n
				count = count + 1
				if expanded[n] and #n > 0 then
					recur(n,depth)
				end
			end
		end

		recur(nodes[game],1)

		-- Nil Instances
		if env.getnilinstances then
			if not (isSearching and not searchResults[nilNode]) then
				tree[count] = nilNode
				count = count + 1
				if expanded[nilNode] then
					recur(nilNode,2)
				end
			end
		end

		Explorer.MaxNameWidth = maxNameWidth
		Explorer.MaxDepth = maxDepth
		Explorer.ViewWidth = useNameWidth and Explorer.EntryIndent*maxDepth + maxNameWidth + 26 or Explorer.EntryIndent*maxDepth + 226
		Explorer.UpdateView()
	end

	Explorer.StartDrag = function(offX,offY)
		if Explorer.Dragging then return end
		for i,v in next, selection.List do
			local Obj = v.Obj
			if Obj.Parent == game or Obj:IsA("Player") then
				return
			end
		end
		Explorer.Dragging = true

		local dragTree = treeFrame:Clone()
		dragTree:ClearAllChildren()

		for i,v in pairs(listEntries) do
			local node = tree[i + Explorer.Index]
			if node and selection.Map[node] then
				local clone = v:Clone()
				clone.Active = false
				clone.Indent.Expand.Visible = false
				clone.Parent = dragTree
			end
		end

		local newGui = Instance.new("ScreenGui")
		newGui.DisplayOrder = Main.DisplayOrders.Menu
		dragTree.Parent = newGui
		Lib.ShowGui(newGui)

		local dragOutline = create({
			{1,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="DragSelect",Size=UDim2.new(1,0,1,0),}},
			{2,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Line",Parent={1},Size=UDim2.new(1,0,0,1),ZIndex=2,}},
			{3,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Line",Parent={1},Position=UDim2.new(0,0,1,-1),Size=UDim2.new(1,0,0,1),ZIndex=2,}},
			{4,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Line",Parent={1},Size=UDim2.new(0,1,1,0),ZIndex=2,}},
			{5,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Line",Parent={1},Position=UDim2.new(1,-1,0,0),Size=UDim2.new(0,1,1,0),ZIndex=2,}},
		})
		dragOutline.Parent = treeFrame

		local mouse = Main.Mouse or service.Players.LocalPlayer:GetMouse()
		local function move()
			local posX = mouse.X - offX
			local posY = mouse.Y - offY
			dragTree.Position = UDim2.new(0,posX,0,posY)

			for i = 1,#listEntries do
				local entry = listEntries[i]
				if Lib.CheckMouseInGui(entry) then
					dragOutline.Position = UDim2.new(0,entry.Indent.Position.X.Offset-scrollH.Index,0,entry.Position.Y.Offset)
					dragOutline.Size = UDim2.new(0,entry.Size.X.Offset-entry.Indent.Position.X.Offset,0,20)
					dragOutline.Visible = true
					return
				end
			end
			dragOutline.Visible = false
		end
		move()

		local input = service.UserInputService
		local mouseEvent,releaseEvent

		mouseEvent = input.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				move()
			end
		end)

		releaseEvent = input.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				releaseEvent:Disconnect()
				mouseEvent:Disconnect()
				newGui:Destroy()
				dragOutline:Destroy()
				Explorer.Dragging = false

				for i = 1,#listEntries do
					if Lib.CheckMouseInGui(listEntries[i]) then
						local node = tree[i + Explorer.Index]
						if node then
							if selection.Map[node] then return end
							local newPar = node.Obj
							local sList = selection.List
							for i = 1,#sList do
								local n = sList[i]
								pcall(function() n.Obj.Parent = newPar end)
							end
							Explorer.ViewNode(sList[1])
						end
						break
					end
				end
			end
		end)
	end

	Explorer.NewListEntry = function(index)
		local newEntry = entryTemplate:Clone()
		newEntry.Position = UDim2.new(0,0,0,20*(index-1))

		local isRenaming = false

		newEntry.InputBegan:Connect(function(input)
			local node = tree[index + Explorer.Index]
			if not node or selection.Map[node] or (input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch) then return end

			newEntry.Indent.BackgroundColor3 = Settings.Theme.Button
			newEntry.Indent.BorderSizePixel = 0
			newEntry.Indent.BackgroundTransparency = 0
		end)

		newEntry.InputEnded:Connect(function(input)
			local node = tree[index + Explorer.Index]
			if not node or selection.Map[node] or (input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch) then return end

			newEntry.Indent.BackgroundTransparency = 1
		end)

		newEntry.MouseButton1Down:Connect(function()

		end)

		newEntry.MouseButton1Up:Connect(function()

		end)

		newEntry.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				local releaseEvent, mouseEvent

				local mouse = Main.Mouse or plr:GetMouse()
				local startX, startY

				if input.UserInputType == Enum.UserInputType.Touch then
					startX = input.Position.X
					startY = input.Position.Y
				else
					startX = mouse.X
					startY = mouse.Y
				end

				local listOffsetX = startX - treeFrame.AbsolutePosition.X
				local listOffsetY = startY - treeFrame.AbsolutePosition.Y

				releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						releaseEvent:Disconnect()
						mouseEvent:Disconnect()
					end
				end)

				mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						local currentX, currentY

						if input.UserInputType == Enum.UserInputType.Touch then
							currentX = input.Position.X
							currentY = input.Position.Y
						else
							currentX = mouse.X
							currentY = mouse.Y
						end

						local deltaX = currentX - startX
						local deltaY = currentY - startY
						local dist = math.sqrt(deltaX^2 + deltaY^2)

						if dist > 5 then
							releaseEvent:Disconnect()
							mouseEvent:Disconnect()
							isRenaming = false
							Explorer.StartDrag(listOffsetX, listOffsetY)
						end
					end
				end)
			end
		end)

		newEntry.MouseButton2Down:Connect(function()

		end)

		newEntry.Indent.Expand.InputBegan:Connect(function(input)
			local node = tree[index + Explorer.Index]
			if not node or (input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch) then return end

			if input.UserInputType == Enum.UserInputType.Touch then
				Explorer.MiscIcons:DisplayByKey(newEntry.Indent.Expand.Icon, expanded[node] and "Collapse_Over" or "Expand_Over")
			elseif input.UserInputType == Enum.UserInputType.MouseMovement then
				Explorer.MiscIcons:DisplayByKey(newEntry.Indent.Expand.Icon, expanded[node] and "Collapse_Over" or "Expand_Over")
			end
		end)

		newEntry.Indent.Expand.InputEnded:Connect(function(input)
			local node = tree[index + Explorer.Index]
			if not node or (input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch) then return end

			if input.UserInputType == Enum.UserInputType.Touch then
				Explorer.MiscIcons:DisplayByKey(newEntry.Indent.Expand.Icon, expanded[node] and "Collapse" or "Expand")
			elseif input.UserInputType == Enum.UserInputType.MouseMovement then
				Explorer.MiscIcons:DisplayByKey(newEntry.Indent.Expand.Icon, expanded[node] and "Collapse" or "Expand")
			end
		end)

		newEntry.Indent.Expand.MouseButton1Down:Connect(function()
			local node = tree[index + Explorer.Index]
			if not node or #node == 0 then return end

			expanded[node] = not expanded[node]
			Explorer.Update()
			Explorer.Refresh()
		end)

		newEntry.Parent = treeFrame
		return newEntry
	end

	Explorer.Refresh = function()
		local maxNodes = math.max(math.ceil((treeFrame.AbsoluteSize.Y) / 20), 0)	
		local renameNodeVisible = false
		local isa = game.IsA

		for i = 1,maxNodes do
			local entry = listEntries[i]
			if not listEntries[i] then entry = Explorer.NewListEntry(i) listEntries[i] = entry Explorer.ClickSystem:Add(entry) end

			local node = tree[i + Explorer.Index]
			if node then
				local obj = node.Obj
				local depth = Explorer.EntryIndent*Explorer.NodeDepth(node)

				entry.Visible = true
				entry.Position = UDim2.new(0,-scrollH.Index,0,entry.Position.Y.Offset)
				entry.Size = UDim2.new(0,Explorer.ViewWidth,0,20)
				entry.Indent.EntryName.Text = tostring(node.Obj)
				entry.Indent.Position = UDim2.new(0,depth,0,0)
				entry.Indent.Size = UDim2.new(1,-depth,1,0)

				entry.Indent.EntryName.TextTruncate = (Settings.Explorer.UseNameWidth and Enum.TextTruncate.None or Enum.TextTruncate.AtEnd)

				Explorer.MiscIcons:DisplayExplorerIcons(entry.Indent.Icon, obj.ClassName)

				if selection.Map[node] then
					entry.Indent.BackgroundColor3 = Settings.Theme.ListSelection
					entry.Indent.BorderSizePixel = 0
					entry.Indent.BackgroundTransparency = 0
				else
					if Lib.CheckMouseInGui(entry) then
						entry.Indent.BackgroundColor3 = Settings.Theme.Button
					else
						entry.Indent.BackgroundTransparency = 1
					end
				end

				if node == renamingNode then
					renameNodeVisible = true
					renameBox.Position = UDim2.new(0,depth+25-scrollH.Index,0,entry.Position.Y.Offset+2)
					renameBox.Visible = true
				end

				if #node > 0 and expanded[node] ~= 0 then
					if Lib.CheckMouseInGui(entry.Indent.Expand) then
						Explorer.MiscIcons:DisplayByKey(entry.Indent.Expand.Icon, expanded[node] and "Collapse_Over" or "Expand_Over")
					else
						Explorer.MiscIcons:DisplayByKey(entry.Indent.Expand.Icon, expanded[node] and "Collapse" or "Expand")
					end
					entry.Indent.Expand.Visible = true
				else
					entry.Indent.Expand.Visible = false
				end
			else
				entry.Visible = false
			end
		end

		if not renameNodeVisible then
			renameBox.Visible = false
		end

		for i = maxNodes+1, #listEntries do
			Explorer.ClickSystem:Remove(listEntries[i])
			listEntries[i]:Destroy()
			listEntries[i] = nil
		end
	end

	Explorer.PerformUpdate = function(instant)
		updateDebounce = true
		Lib.FastWait(not instant and 0.1)
		if not updateDebounce then return end
		updateDebounce = false
		if not Explorer.Window:IsVisible() then return end
		Explorer.Update()
		Explorer.Refresh()
	end

	Explorer.ForceUpdate = function(norefresh)
		updateDebounce = false
		Explorer.Update()
		if not norefresh then Explorer.Refresh() end
	end

	Explorer.PerformRefresh = function()
		refreshDebounce = true
		Lib.FastWait(0.1)
		refreshDebounce = false
		if updateDebounce or not Explorer.Window:IsVisible() then return end
		Explorer.Refresh()
	end

	Explorer.IsNodeVisible = function(node)
		if not node then return end

		local curNode = node.Parent
		while curNode do
			if not expanded[curNode] then return false end
			curNode = curNode.Parent
		end
		return true
	end

	Explorer.NodeDepth = function(node)
		local depth = 0

		if node == nilNode then
			return 1
		end

		local curNode = node.Parent
		while curNode do
			if curNode == nilNode then depth = depth + 1 end
			curNode = curNode.Parent
			depth = depth + 1
		end
		return depth
	end

	Explorer.SetupConnections = function()
		if descendantAddedCon then descendantAddedCon:Disconnect() end
		if descendantRemovingCon then descendantRemovingCon:Disconnect() end
		if itemChangedCon then itemChangedCon:Disconnect() end

		if Main.Elevated then
			descendantAddedCon = game.DescendantAdded:Connect(addObject)
			descendantRemovingCon = game.DescendantRemoving:Connect(removeObject)
		else
			descendantAddedCon = game.DescendantAdded:Connect(function(obj) pcall(addObject,obj) end)
			descendantRemovingCon = game.DescendantRemoving:Connect(function(obj) pcall(removeObject,obj) end)
		end

		if Settings.Explorer.UseNameWidth then
			itemChangedCon = game.ItemChanged:Connect(function(obj,prop)
				if prop == "Parent" and nodes[obj] then
					moveObject(obj)
				elseif prop == "Name" and nodes[obj] then
					nodes[obj].NameWidth = nil
				end
			end)
		else
			itemChangedCon = game.ItemChanged:Connect(function(obj,prop)
				if prop == "Parent" and nodes[obj] then
					moveObject(obj)
				end
			end)
		end
	end

	Explorer.ViewNode = function(node)
		if not node then return end

		Explorer.MakeNodeVisible(node)
		Explorer.ForceUpdate(true)
		local visibleSpace = scrollV.VisibleSpace

		for i,v in next,tree do
			if v == node then
				local relative = i - 1
				if Explorer.Index > relative then
					scrollV.Index = relative
				elseif Explorer.Index + visibleSpace - 1 <= relative then
					scrollV.Index = relative - visibleSpace + 2
				end
			end
		end

		scrollV:Update() Explorer.Index = scrollV.Index
		Explorer.Refresh()
	end

	Explorer.ViewObj = function(obj)
		Explorer.ViewNode(nodes[obj])
	end

	Explorer.MakeNodeVisible = function(node,expandRoot)
		if not node then return end

		local hasExpanded = false

		if expandRoot and not expanded[node] then
			expanded[node] = true
			hasExpanded = true
		end

		local currentNode = node.Parent
		while currentNode do
			hasExpanded = true
			expanded[currentNode] = true
			currentNode = currentNode.Parent
		end

		if hasExpanded and not updateDebounce then
			coroutine.wrap(Explorer.PerformUpdate)(true)
		end
	end

	Explorer.ShowRightClick = function(MousePos)
		local Mouse = MousePos or Main.Mouse
		local context = Explorer.RightClickContext
		local absoluteSize = context.Gui.AbsoluteSize
		context.MaxHeight = (absoluteSize.Y <= 600 and (absoluteSize.Y - 40)) or nil
		context:Clear()

		local sList = selection.List
		local sMap = selection.Map
		local emptyClipboard = #clipboard == 0
		local presentClasses = {}
		local apiClasses = API.Classes

		for i = 1, #sList do
			local node = sList[i]
			local class = node.Class
			local obj = node.Obj

			if not presentClasses.isViableDecompileScript then
				presentClasses.isViableDecompileScript = env.isViableDecompileScript(obj)
			end
			if not class then
				class = obj.ClassName
				node.Class = class
			end

			local curClass = apiClasses[class]
			while curClass and not presentClasses[curClass.Name] do
				presentClasses[curClass.Name] = true
				curClass = curClass.Superclass
			end
		end

		context:AddRegistered("CUT")
		context:AddRegistered("COPY")
		context:AddRegistered("PASTE", emptyClipboard)
		context:AddRegistered("DUPLICATE")
		context:AddRegistered("DELETE")
		context:AddRegistered("DELETE_CHILDREN", #sList ~= 1)
		context:AddRegistered("RENAME", #sList ~= 1)

		context:AddDivider()
		context:AddRegistered("GROUP")
		context:AddRegistered("UNGROUP")
		context:AddRegistered("SELECT_CHILDREN")
		context:AddRegistered("JUMP_TO_PARENT")
		context:AddRegistered("EXPAND_ALL")
		context:AddRegistered("COLLAPSE_ALL")

		context:AddDivider()

		if expanded == Explorer.SearchExpanded then context:AddRegistered("CLEAR_SEARCH_AND_JUMP_TO") end
		if env.setclipboard then context:AddRegistered("COPY_PATH") end
		context:AddRegistered("INSERT_OBJECT")
		context:AddRegistered("SAVE_INST")
		-- context:AddRegistered("CALL_FUNCTION")
		-- context:AddRegistered("VIEW_CONNECTIONS")
		-- context:AddRegistered("GET_REFERENCES")
		context:AddRegistered("COPY_API_PAGE")

		context:QueueDivider()

		if presentClasses["BasePart"] or presentClasses["Model"] then
			context:AddRegistered("TELEPORT_TO")
			context:AddRegistered("VIEW_OBJECT")
			context:AddRegistered("3DVIEW_MODEL")
		end
		if presentClasses["Tween"] then context:AddRegistered("PLAY_TWEEN") end
		if presentClasses["Animation"] then
			context:AddRegistered("LOAD_ANIMATION")
			context:AddRegistered("STOP_ANIMATION")
		end

		if presentClasses["TouchTransmitter"] then context:AddRegistered("FIRE_TOUCHTRANSMITTER", firetouchinterest == nil) end
		if presentClasses["ClickDetector"] then context:AddRegistered("FIRE_CLICKDETECTOR", fireclickdetector == nil) end
		if presentClasses["ProximityPrompt"] then context:AddRegistered("FIRE_PROXIMITYPROMPT", fireproximityprompt == nil) end
		
		
		if presentClasses["RemoteEvent"] then context:AddRegistered("BLOCK_REMOTE", env.hookfunction == nil) end
		if presentClasses["RemoteEvent"] then context:AddRegistered("UNBLOCK_REMOTE", env.hookfunction == nil) end
		
		if presentClasses["RemoteFunction"] then context:AddRegistered("BLOCK_REMOTE", env.hookfunction == nil) end
		if presentClasses["RemoteFunction"] then context:AddRegistered("UNBLOCK_REMOTE", env.hookfunction == nil) end

		if presentClasses["UnreliableRemoteEvent"] then context:AddRegistered("BLOCK_REMOTE", env.hookfunction == nil) end
		if presentClasses["UnreliableRemoteEvent"] then context:AddRegistered("UNBLOCK_REMOTE", env.hookfunction == nil) end
		
		
		if presentClasses["BindableEvent"] then context:AddRegistered("BLOCK_REMOTE", env.hookfunction == nil) end
		if presentClasses["BindableEvent"] then context:AddRegistered("UNBLOCK_REMOTE", env.hookfunction == nil) end
		
		if presentClasses["BindableFunction"] then context:AddRegistered("BLOCK_REMOTE", env.hookfunction == nil) end
		if presentClasses["BindableFunction"] then context:AddRegistered("UNBLOCK_REMOTE", env.hookfunction == nil) end
		
		
		
		if presentClasses["Player"] then context:AddRegistered("SELECT_CHARACTER")context:AddRegistered("VIEW_PLAYER") end
		if presentClasses["Players"] then
			context:AddRegistered("SELECT_LOCAL_PLAYER")
			context:AddRegistered("SELECT_ALL_CHARACTERS")
		end

		if presentClasses["LuaSourceContainer"] then
			context:AddRegistered("VIEW_SCRIPT", not presentClasses.isViableDecompileScript or env.decompile == nil)
			context:AddRegistered("DUMP_FUNCTIONS", not presentClasses.isViableDecompileScript or env.getupvalues == nil or env.getconstants == nil)
			context:AddRegistered("SAVE_SCRIPT", not presentClasses.isViableDecompileScript or env.decompile == nil or env.writefile == nil)
			context:AddRegistered("SAVE_BYTECODE", not presentClasses.isViableDecompileScript or env.getscriptbytecode == nil or env.writefile == nil)

		end

		if sMap[nilNode] then
			context:AddRegistered("REFRESH_NIL")
			context:AddRegistered("HIDE_NIL")
		end

		Explorer.LastRightClickX, Explorer.LastRightClickY = Mouse.X, Mouse.Y
		context:Show(Mouse.X, Mouse.Y)
	end

	Explorer.InitRightClick = function()
		local context = Lib.ContextMenu.new()

		context:Register("CUT",{Name = "Cut", IconMap = Explorer.MiscIcons, Icon = "Cut", DisabledIcon = "Cut_Disabled", Shortcut = "Ctrl+Z", OnClick = function()
			local destroy,clone = game.Destroy,game.Clone
			local sList,newClipboard = selection.List,{}
			local count = 1
			for i = 1,#sList do
				local inst = sList[i].Obj
				local s,cloned = pcall(clone,inst)
				if s and cloned then
					newClipboard[count] = cloned
					count = count + 1
				end
				pcall(destroy,inst)
			end
			clipboard = newClipboard
			selection:Clear()
		end})

		context:Register("COPY",{Name = "Copy", IconMap = Explorer.MiscIcons, Icon = "Copy", DisabledIcon = "Copy_Disabled", Shortcut = "Ctrl+C", OnClick = function()
			local clone = game.Clone
			local sList,newClipboard = selection.List,{}
			local count = 1
			for i = 1,#sList do
				local inst = sList[i].Obj
				local s,cloned = pcall(clone,inst)
				if s and cloned then
					newClipboard[count] = cloned
					count = count + 1
				end
			end
			clipboard = newClipboard
		end})

		context:Register("PASTE",{Name = "Paste Into", IconMap = Explorer.MiscIcons, Icon = "Paste", DisabledIcon = "Paste_Disabled", Shortcut = "Ctrl+Shift+V", OnClick = function()
			local sList = selection.List
			local newSelection = {}
			local count = 1
			for i = 1,#sList do
				local node = sList[i]
				local inst = node.Obj
				Explorer.MakeNodeVisible(node,true)
				for c = 1,#clipboard do
					local cloned = clipboard[c]:Clone()
					if cloned then
						cloned.Parent = inst
						local clonedNode = nodes[cloned]
						if clonedNode then newSelection[count] = clonedNode count = count + 1 end
					end
				end
			end
			selection:SetTable(newSelection)

			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			end
		end})

		context:Register("DUPLICATE",{Name = "Duplicate", IconMap = Explorer.MiscIcons, Icon = "Copy", DisabledIcon = "Copy_Disabled", Shortcut = "Ctrl+D", OnClick = function()
			local clone = game.Clone
			local sList = selection.List
			local newSelection = {}
			local count = 1
			for i = 1,#sList do
				local node = sList[i]
				local inst = node.Obj
				local instPar = node.Parent and node.Parent.Obj
				Explorer.MakeNodeVisible(node)
				local s,cloned = pcall(clone,inst)
				if s and cloned then
					cloned.Parent = instPar
					local clonedNode = nodes[cloned]
					if clonedNode then newSelection[count] = clonedNode count = count + 1 end
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			end
		end})

		context:Register("DELETE",{Name = "Delete", IconMap = Explorer.MiscIcons, Icon = "Delete", DisabledIcon = "Delete_Disabled", Shortcut = "Del", OnClick = function()
			local destroy = game.Destroy
			local sList = selection.List
			for i = 1,#sList do
				pcall(destroy,sList[i].Obj)
			end
			selection:Clear()
		end})
		
		context:Register("DELETE_CHILDREN",{Name = "Delete Children", IconMap = Explorer.MiscIcons, Icon = "Delete", DisabledIcon = "Delete_Disabled", Shortcut = "Shift+Del", OnClick = function()
			local sList = selection.List
			for i = 1,#sList do
				pcall(sList[i].Obj.ClearAllChildren,sList[i].Obj)
			end
			selection:Clear()
		end})
		context:Register("RENAME",{Name = "Rename", IconMap = Explorer.MiscIcons, Icon = "Rename", DisabledIcon = "Rename_Disabled", Shortcut = "F2", OnClick = function()
			local sList = selection.List
			if sList[1] then
				Explorer.SetRenamingNode(sList[1])
			end
		end})

		context:Register("GROUP",{Name = "Group", IconMap = Explorer.MiscIcons, Icon = "Group", DisabledIcon = "Group_Disabled", Shortcut = "Ctrl+G", OnClick = function()
			local sList = selection.List
			if #sList == 0 then return end

			local model = Instance.new("Model",sList[#sList].Obj.Parent)
			for i = 1,#sList do
				pcall(function() sList[i].Obj.Parent = model end)
			end

			if nodes[model] then
				selection:Set(nodes[model])
				Explorer.ViewNode(nodes[model])
			end
		end})

		context:Register("UNGROUP",{Name = "Ungroup", IconMap = Explorer.MiscIcons, Icon = "Ungroup", DisabledIcon = "Ungroup_Disabled", Shortcut = "Ctrl+U", OnClick = function()
			local newSelection = {}
			local count = 1
			local isa = game.IsA

			local function ungroup(node)
				local par = node.Parent.Obj
				local ch = {}
				local chCount = 1

				for i = 1,#node do
					local n = node[i]
					newSelection[count] = n
					ch[chCount] = n
					count = count + 1
					chCount = chCount + 1
				end

				for i = 1,#ch do
					pcall(function() ch[i].Obj.Parent = par end)
				end

				node.Obj:Destroy()
			end

			for i,v in next,selection.List do
				if isa(v.Obj,"Model") then
					ungroup(v)
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			end
		end})

		context:Register("SELECT_CHILDREN",{Name = "Select Children", IconMap = Explorer.MiscIcons, Icon = "SelectChildren", DisabledIcon = "SelectChildren_Disabled", OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List

			for i = 1,#sList do
				local node = sList[i]
				for ind = 1,#node do
					local cNode = node[ind]
					if ind == 1 then Explorer.MakeNodeVisible(cNode) end

					newSelection[count] = cNode
					count = count + 1
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			else
				Explorer.Refresh()
			end
		end})

		context:Register("JUMP_TO_PARENT",{Name = "Jump to Parent", IconMap = Explorer.MiscIcons, Icon = "JumpToParent", OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List

			for i = 1,#sList do
				local node = sList[i]
				if node.Parent then
					newSelection[count] = node.Parent
					count = count + 1
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			else
				Explorer.Refresh()
			end
		end})

		context:Register("TELEPORT_TO",{Name = "Teleport To", IconMap = Explorer.MiscIcons, Icon = "TeleportTo", OnClick = function()
			local sList = selection.List
			local plrRP = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")

			if not plrRP then return end

			for _,node in next, sList do
				local Obj = node.Obj

				if Obj:IsA("BasePart") then
					if Obj.CanCollide then
						plr.Character:MoveTo(Obj.Position)
					else
						plrRP.CFrame = CFrame.new(Obj.Position + Settings.Explorer.TeleportToOffset)
					end
					break
				elseif Obj:IsA("Model") then
					if Obj.PrimaryPart then
						if Obj.PrimaryPart.CanCollide then
							plr.Character:MoveTo(Obj.PrimaryPart.Position)
						else
							plrRP.CFrame = CFrame.new(Obj.PrimaryPart.Position + Settings.Explorer.TeleportToOffset)
						end
						break
					else
						local part = Obj:FindFirstChildWhichIsA("BasePart", true)
						if part and nodes[part] then
							if part.CanCollide then
								plr.Character:MoveTo(part.Position)
							else
								plrRP.CFrame = CFrame.new(part.Position + Settings.Explorer.TeleportToOffset)
							end
							break
						elseif Obj.WorldPivot then
							plrRP.CFrame = Obj.WorldPivot
						end
					end
				end
			end
		end})

		local OldAnimation
		context:Register("PLAY_TWEEN",{Name = "Play Tween", IconMap = Explorer.MiscIcons, Icon = "Play", OnClick = function()
			local sList = selection.List

			for i = 1, #sList do
				local node = sList[i]
				local Obj = node.Obj

				if Obj:IsA("Tween") then Obj:Play() end
			end
		end})

		local OldAnimation
		context:Register("LOAD_ANIMATION",{Name = "Load Animation", IconMap = Explorer.MiscIcons, Icon = "Play", OnClick = function()
			local sList = selection.List

			local Humanoid = plr.Character and plr.Character:FindFirstChild("Humanoid")
			if not Humanoid then return end

			for i = 1, #sList do
				local node = sList[i]
				local Obj = node.Obj

				if Obj:IsA("Animation") then
					if OldAnimation then OldAnimation:Stop() end
					OldAnimation = Humanoid:LoadAnimation(Obj)
					OldAnimation:Play()
					break
				end
			end
		end})

		context:Register("STOP_ANIMATION",{Name = "Stop Animation", IconMap = Explorer.MiscIcons, Icon = "Pause", OnClick = function()
			local sList = selection.List

			local Humanoid = plr.Character and plr.Character:FindFirstChild("Humanoid")
			if not Humanoid then return end

			for i = 1, #sList do
				local node = sList[i]
				local Obj = node.Obj

				if Obj:IsA("Animation") then
					if OldAnimation then OldAnimation:Stop() end
					Humanoid:LoadAnimation(Obj):Stop()
					break
				end
			end
		end})

		context:Register("EXPAND_ALL",{Name = "Expand All", OnClick = function()
			local sList = selection.List

			local function expand(node)
				expanded[node] = true
				for i = 1,#node do
					if #node[i] > 0 then
						expand(node[i])
					end
				end
			end

			for i = 1,#sList do
				expand(sList[i])
			end

			Explorer.ForceUpdate()
		end})

		context:Register("COLLAPSE_ALL",{Name = "Collapse All", OnClick = function()
			local sList = selection.List

			local function expand(node)
				expanded[node] = nil
				for i = 1,#node do
					if #node[i] > 0 then
						expand(node[i])
					end
				end
			end

			for i = 1,#sList do
				expand(sList[i])
			end

			Explorer.ForceUpdate()
		end})

		context:Register("CLEAR_SEARCH_AND_JUMP_TO",{Name = "Clear Search and Jump to", OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List

			for i = 1,#sList do
				newSelection[count] = sList[i]
				count = count + 1
			end

			selection:SetTable(newSelection)
			Explorer.ClearSearch()
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			end
		end})

		-- this code is very bad but im lazy and it works so cope
		local clth = function(str)
			if str:sub(1, 28) == "game:GetService(\"Workspace\")" then str = str:gsub("game:GetService%(\"Workspace\"%)", "workspace", 1) end
			if str:sub(1, 27 + #plr.Name) == "game:GetService(\"Players\")." .. plr.Name then str = str:gsub("game:GetService%(\"Players\"%)." .. plr.Name, "game:GetService(\"Players\").LocalPlayer", 1) end
			return str
		end

		context:Register("COPY_PATH",{Name = "Copy Path", IconMap = Explorer.LegacyClassIcons, Icon = 50, OnClick = function()
			local sList = selection.List
			if #sList == 1 then
				env.setclipboard(clth(Explorer.GetInstancePath(sList[1].Obj)))
			elseif #sList > 1 then
				local resList = {"{"}
				local count = 2
				for i = 1,#sList do
					local path = "\t"..clth(Explorer.GetInstancePath(sList[i].Obj))..","
					if #path > 0 then
						resList[count] = path
						count = count+1
					end
				end
				resList[count] = "}"
				env.setclipboard(table.concat(resList,"\n"))
			end
		end})

		context:Register("INSERT_OBJECT",{Name = "Insert Object", IconMap = Explorer.MiscIcons, Icon = "InsertObject", OnClick = function()
			local mouse = Main.Mouse
			local x,y = Explorer.LastRightClickX or mouse.X, Explorer.LastRightClickY or mouse.Y
			Explorer.InsertObjectContext:Show(x,y)
		end})

		--[[context:Register("CALL_FUNCTION",{Name = "Call Function", IconMap = Explorer.ClassIcons, Icon = 66, OnClick = function()

		end})

		context:Register("GET_REFERENCES",{Name = "Get Lua References", IconMap = Explorer.ClassIcons, Icon = 34, OnClick = function()

		end})]]

		context:Register("SAVE_INST",{Name = "Save to File", IconMap = Explorer.MiscIcons, Icon = "Save", OnClick = function()
			local sList = selection.List
			if #sList == 1 then
				Lib.SaveAsPrompt("Place_"..game.PlaceId.."_"..sList[1].Obj.ClassName.."_"..sList[1].Obj.Name.."_"..os.time(), function(filename)
					env.saveinstance(sList[1].Obj, filename, {
						Decompile = true,
						RemovePlayerCharacters = false
					})
				end)
			elseif #sList > 1 then
				for i = 1,#sList do
					-- sList[i].Obj.Name.." ("..sList[1].Obj.ClassName..")"
					-- "Place_"..game.PlaceId.."_"..sList[1].Obj.ClassName.."_"..sList[i].Obj.Name.."_"..os.time()
					Lib.SaveAsPrompt("Place_"..game.PlaceId.."_"..sList[i].Obj.ClassName.."_"..sList[i].Obj.Name.."_"..os.time(), function(filename)
						env.saveinstance(sList[i].Obj, filename, {
							Decompile = true,
							RemovePlayerCharacters = false
						})
					end)
					
					task.wait(0.1)
				end
			end
		end})

        --[[context:Register("VIEW_CONNECTIONS",{Name = "View Connections", OnClick = function()
            
        end})]]
		local ClassFire = {
			RemoteEvent = "FireServer",
			RemoteFunction = "InvokeServer",
			UnreliableRemoteEvent = "FireServer",

			BindableRemote = "Fire",
			BindableFunction = "Invoke",
		}
		context:Register("BLOCK_REMOTE",{Name = "Block From Firing", IconMap = Explorer.MiscIcons, Icon = "Delete", DisabledIcon = "Empty", OnClick = function()
			local sList = selection.List
			for i, list in sList do
				local obj = list.Obj
				if not remote_blocklist[obj] then
					local functionToHook = ClassFire[obj.ClassName]
					remote_blocklist[obj] = true
					local old; old = env.hookmetamethod((oldgame or game), "__namecall", function(self, ...)
						if remote_blocklist[obj] and self == obj and getnamecallmethod() == functionToHook then
							return nil
						end
						return old(self,...)
					end)
					if Settings.RemoteBlockWriteAttribute then
						obj:SetAttribute("IsBlocked", true)
					end
					--print("blocking ",functionToHook)
				end
			end
		end})
		
		context:Register("UNBLOCK_REMOTE",{Name = "Unblock", IconMap = Explorer.MiscIcons, Icon = "Play", DisabledIcon = "Empty", OnClick = function()
			local sList = selection.List
			for i, list in sList do
				local obj = list.Obj
				if remote_blocklist[obj] then
					remote_blocklist[obj] = nil
					if Settings.RemoteBlockWriteAttribute then
						list.Obj:SetAttribute("IsBlocked", false)
					end
					--print("unblocking ",functionToHook)
				end
			end
		end})

		context:Register("COPY_API_PAGE",{Name = "Copy Roblox API Page URL", IconMap = Explorer.MiscIcons, Icon = "Reference", OnClick = function()
			local sList = selection.List
			if #sList == 1 then
				env.setclipboard(
					"https://create.roblox.com/docs/reference/engine/classes/"..sList[1].Obj.ClassName
				)
			end
		end})

		context:Register("3DVIEW_MODEL",{Name = "3D Preview Object", IconMap = Explorer.LegacyClassIcons, Icon = 54, OnClick = function()
			local sList = selection.List
			local isa = game.IsA
			
			if #sList == 1 then
				if isa(sList[1].Obj,"BasePart") or isa(sList[1].Obj,"Model") then
					ModelViewer.ViewModel(sList[1].Obj)
					return
				end
			end
		end})
		
		context:Register("VIEW_OBJECT",{Name = "View Object (Right click to reset)", IconMap = Explorer.LegacyClassIcons, Icon = 5, OnClick = function()
			local sList = selection.List
			local isa = game.IsA

			for i = 1,#sList do
				local node = sList[i]

				if isa(node.Obj,"BasePart") or isa(node.Obj,"Model") then
					workspace.CurrentCamera.CameraSubject = node.Obj
					break
				end
			end
		end, OnRightClick = function()
			workspace.CurrentCamera.CameraSubject = plr.Character
		end})

		context:Register("VIEW_SCRIPT",{Name = "View Script", IconMap = Explorer.MiscIcons, Icon = "ViewScript", DisabledIcon = "Empty", OnClick = function()
			local scr = selection.List[1] and selection.List[1].Obj
			if scr then ScriptViewer.ViewScript(scr) end
		end})
		context:Register("DUMP_FUNCTIONS",{Name = "Dump Functions", IconMap = Explorer.MiscIcons, Icon = "SelectChildren", DisabledIcon = "Empty", OnClick = function()
			local scr = selection.List[1] and selection.List[1].Obj
			if scr then ScriptViewer.DumpFunctions(scr) end
		end})

		context:Register("FIRE_TOUCHTRANSMITTER",{Name = "Fire TouchTransmitter", OnClick = function()
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			for _, v in ipairs(selection.List) do if v.Obj and v.Obj:IsA("TouchTransmitter") then firetouchinterest(hrp, v.Obj.Parent, 0) end end
		end})

		context:Register("FIRE_CLICKDETECTOR",{Name = "Fire ClickDetector", OnClick = function()
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			for _, v in ipairs(selection.List) do if v.Obj and v.Obj:IsA("ClickDetector") then fireclickdetector(v.Obj) end end
		end})

		context:Register("FIRE_PROXIMITYPROMPT",{Name = "Fire ProximityPrompt", OnClick = function()
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			for _, v in ipairs(selection.List) do if v.Obj and v.Obj:IsA("ProximityPrompt") then fireproximityprompt(v.Obj) end end
		end})

		context:Register("VIEW_SCRIPT",{Name = "View Script", IconMap = Explorer.MiscIcons, Icon = "ViewScript", DisabledIcon = "Empty", OnClick = function()
			local scr = selection.List[1] and selection.List[1].Obj
			if scr then ScriptViewer.ViewScript(scr) end
		end})

		context:Register("SAVE_SCRIPT",{Name = "Save Script", IconMap = Explorer.MiscIcons, Icon = "Save", DisabledIcon = "Empty", OnClick = function()
			for _, v in next, selection.List do
				if v.Obj:IsA("LuaSourceContainer") and env.isViableDecompileScript(v.Obj) then
					local success, source = pcall(env.decompile, v.Obj)
					if not success or not source then source = ("-- DEX - %s failed to decompile %s"):format(env.executor, v.Obj.ClassName) end
					local fileName = ("%s_%s_%i_Source.txt"):format(env.parsefile(v.Obj.Name), v.Obj.ClassName, game.PlaceId)
					--env.writefile(fileName, source)
					Lib.SaveAsPrompt(fileName, source)
					
					task.wait(0.2)
				end
			end
		end})

		context:Register("SAVE_BYTECODE",{Name = "Save Script Bytecode", IconMap = Explorer.MiscIcons, Icon = "Save", DisabledIcon = "Empty", OnClick = function()
			for _, v in next, selection.List do
				if v.Obj:IsA("LuaSourceContainer") and env.isViableDecompileScript(v.Obj) then
					local success, bytecode = pcall(env.getscriptbytecode, v.Obj)
					if success and type(bytecode) == "string" then
						local fileName = ("%s_%s_%i_Bytecode.txt"):format(env.parsefile(v.Obj.Name), v.Obj.ClassName, game.PlaceId)
						--env.writefile(fileName, bytecode)
						Lib.SaveAsPrompt(fileName, bytecode)
						task.wait(0.2)
					end
				end
			end
		end})

		context:Register("SELECT_CHARACTER",{Name = "Select Character", IconMap = Explorer.LegacyClassIcons, Icon = 9, OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List
			local isa = game.IsA

			for i = 1,#sList do
				local node = sList[i]
				if isa(node.Obj,"Player") and nodes[node.Obj.Character] then
					newSelection[count] = nodes[node.Obj.Character]
					count = count + 1
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			else
				Explorer.Refresh()
			end
		end})

		context:Register("VIEW_PLAYER",{Name = "View Player", IconMap = Explorer.LegacyClassIcons, Icon = 5, OnClick = function()
			local newSelection = {}
			local count = 1
			local sList = selection.List
			local isa = game.IsA

			for i = 1,#sList do
				local node = sList[i]
				local Obj = node.Obj
				if Obj:IsA("Player") and Obj.Character then
					workspace.CurrentCamera.CameraSubject = Obj.Character
					break
				end
			end
		end})

		context:Register("SELECT_LOCAL_PLAYER",{Name = "Select Local Player", IconMap = Explorer.LegacyClassIcons, Icon = 9, OnClick = function()
			pcall(function() if nodes[plr] then selection:Set(nodes[plr]) Explorer.ViewNode(nodes[plr]) end end)
		end})

		context:Register("SELECT_ALL_CHARACTERS",{Name = "Select All Characters", IconMap = Explorer.LegacyClassIcons, Icon = 2, OnClick = function()
			local newSelection = {}
			local sList = selection.List

			for i,v in next, service.Players:GetPlayers() do
				if v.Character and nodes[v.Character] then
					if i == 1 then Explorer.MakeNodeVisible(v.Character) end
					table.insert(newSelection, nodes[v.Character])
				end
			end

			selection:SetTable(newSelection)
			if #newSelection > 0 then
				Explorer.ViewNode(newSelection[1])
			else
				Explorer.Refresh()
			end
		end})

		context:Register("REFRESH_NIL",{Name = "Refresh Nil Instances", OnClick = function()
			Explorer.RefreshNilInstances()
		end})

		context:Register("HIDE_NIL",{Name = "Hide Nil Instances", OnClick = function()
			Explorer.HideNilInstances()
		end})

		Explorer.RightClickContext = context
	end

	Explorer.HideNilInstances = function()
		table.clear(nilMap)

		local disconnectCon = Instance.new("Folder").ChildAdded:Connect(function() end).Disconnect
		for i,v in next,nilCons do
			disconnectCon(v[1])
			disconnectCon(v[2])
		end
		table.clear(nilCons)

		for i = 1,#nilNode do
			coroutine.wrap(removeObject)(nilNode[i].Obj)
		end

		Explorer.Update()
		Explorer.Refresh()
	end

	Explorer.RefreshNilInstances = function()
		if not env.getnilinstances then return end

		local nilInsts = env.getnilinstances()
		local game = game
		local getDescs = game.GetDescendants
		--local newNilMap = {}
		--local newNilRoots = {}
		--local nilRoots = Explorer.NilRoots
		--local connect = game.DescendantAdded.Connect
		--local disconnect
		--if not nilRoots then nilRoots = {} Explorer.NilRoots = nilRoots end

		for i = 1,#nilInsts do
			local obj = nilInsts[i]
			if obj ~= game then
				nilMap[obj] = true
				--newNilRoots[obj] = true

				local descs = getDescs(obj)
				for j = 1,#descs do
					nilMap[descs[j]] = true
				end
			end
		end

		-- Remove unmapped nil nodes
		--[[for i = 1,#nilNode do
			local node = nilNode[i]
			if not newNilMap[node.Obj] then
				nilMap[node.Obj] = nil
				coroutine.wrap(removeObject)(node)
			end
		end]]

		--nilMap = newNilMap

		for i = 1,#nilInsts do
			local obj = nilInsts[i]
			local node = nodes[obj]
			if not node then coroutine.wrap(addObject)(obj) end
		end

		--[[
		-- Remove old root connections
		for obj in next,nilRoots do
			if not newNilRoots[obj] then
				if not disconnect then disconnect = obj[1].Disconnect end
				disconnect(obj[1])
				disconnect(obj[2])
			end
		end
		
		for obj in next,newNilRoots do
			if not nilRoots[obj] then
				nilRoots[obj] = {
					connect(obj.DescendantAdded,addObject),
					connect(obj.DescendantRemoving,removeObject)
				}
			end
		end]]

		--nilMap = newNilMap
		--Explorer.NilRoots = newNilRoots

		Explorer.Update()
		Explorer.Refresh()
	end

	Explorer.GetInstancePath = function(obj)
		local ffc = game.FindFirstChild
		local getCh = game.GetChildren
		local path = ""
		local curObj = obj
		local ts = tostring
		local match = string.match
		local gsub = string.gsub
		local tableFind = table.find
		local useGetCh = Settings.Explorer.CopyPathUseGetChildren
		local formatLuaString = Lib.FormatLuaString

		while curObj do
			if curObj == game then
				path = "game"..path
				break
			end

			local className = curObj.ClassName
			local curName = ts(curObj)
			local indexName
			if match(curName,"^[%a_][%w_]*$") then
				indexName = "."..curName
			else
				local cleanName = formatLuaString(curName)
				indexName = '["'..cleanName..'"]'
			end

			local parObj = curObj.Parent
			if parObj then
				local fc = ffc(parObj,curName)
				if useGetCh and fc and fc ~= curObj then
					local parCh = getCh(parObj)
					local fcInd = tableFind(parCh,curObj)
					indexName = ":GetChildren()["..fcInd.."]"
				elseif parObj == game and API.Classes[className] and API.Classes[className].Tags.Service then
					indexName = ':GetService("'..className..'")'
				end
			elseif parObj == nil then
				local getnil = "local getNil = function(name, class) for _, v in next, getnilinstances() do if v.ClassName == class and v.Name == name then return v end end end"
				local gotnil = "\n\ngetNil(\"%s\", \"%s\")"
				indexName = getnil .. gotnil:format(curObj.Name, className)
			end

			path = indexName..path
			curObj = parObj
		end

		return path
	end

	Explorer.DefaultProps = {
		["BasePart"] = {
			Position = function(Obj)
				local Player = service.Players.LocalPlayer
				if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
					Obj.Position = (Player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -10)).p
				end
				return Obj.Position
			end,
			Anchored = true
		},
		["GuiObject"] = {
			Position = function(Obj) return (Obj.Parent:IsA("ScreenGui") and UDim2.new(0.5, 0, 0.5, 0)) or Obj.Position end,
			Active = true
		}
	}

	Explorer.InitInsertObject = function()
		local context = Lib.ContextMenu.new()
		context.SearchEnabled = true
		context.MaxHeight = 400
		context:ApplyTheme({
			ContentColor = Settings.Theme.Main2,
			OutlineColor = Settings.Theme.Outline1,
			DividerColor = Settings.Theme.Outline1,
			TextColor = Settings.Theme.Text,
			HighlightColor = Settings.Theme.ButtonHover
		})

		local classes = {}
		for i,class in next,API.Classes do
			local tags = class.Tags
			if not tags.NotCreatable and not tags.Service then
				local rmdEntry = RMD.Classes[class.Name]
				classes[#classes+1] = {class,rmdEntry and rmdEntry.ClassCategory or "Uncategorized"}
			end
		end
		table.sort(classes,function(a,b)
			if a[2] ~= b[2] then
				return a[2] < b[2]
			else
				return a[1].Name < b[1].Name
			end
		end)

		local function defaultProps(obj)
			for class, props in pairs(Explorer.DefaultProps) do
				if obj:IsA(class) then
					for prop, value in pairs(props) do
						obj[prop] = (type(value) == "function" and value(obj)) or value
					end
				end
			end
		end

		local function onClick(className)
			local sList = selection.List
			local instNew = Instance.new
			for i = 1,#sList do
				local node = sList[i]
				local obj = node.Obj
				Explorer.MakeNodeVisible(node, true)
				local success, obj = pcall(instNew, className, obj)
				if success and obj then defaultProps(obj) end
			end
		end

		local lastCategory = ""
		for i = 1,#classes do
			local class = classes[i][1]
			local rmdEntry = RMD.Classes[class.Name]
			local iconInd = rmdEntry and tonumber(rmdEntry.ExplorerImageIndex) or 0
			local category = classes[i][2]

			if lastCategory ~= category then
				context:AddDivider(category)
				lastCategory = category
			end
			
			local icon
			if iconData then
				icon = iconData.Icons[class.Name] or iconData.Icons.Placeholder
			else
				icon = iconInd
			end
			context:Add({Name = class.Name, IconMap = Explorer.ClassIcons, Icon = icon, OnClick = onClick})
		end

		Explorer.InsertObjectContext = context
	end
	
	--[[
		Headers, Setups, Predicate, ObjectDefs
	]]
	Explorer.SearchFilters = { -- TODO: Use data table (so we can disable some if funcs don't exist)
		Comparison = {
			["isa"] = function(argString)
				local lower = string.lower
				local find = string.find
				local classQuery = string.split(argString)[1]
				if not classQuery then return end
				classQuery = lower(classQuery)

				local className
				for class,_ in pairs(API.Classes) do
					local cName = lower(class)
					if cName == classQuery then
						className = class
						break
					elseif find(cName,classQuery,1,true) then
						className = class
					end
				end
				if not className then return end

				return {
					Headers = {"local isa = game.IsA"},
					Predicate = "isa(obj,'"..className.."')"
				}
			end,
			["remotes"] = function(argString)
				return {
					Headers = {"local isa = game.IsA"},
					Predicate = "isa(obj,'RemoteEvent') or isa(obj,'RemoteFunction') or isa(obj,'UnreliableRemoteFunction')"
				}
			end,
			["bindables"] = function(argString)
				return {
					Headers = {"local isa = game.IsA"},
					Predicate = "isa(obj,'BindableEvent') or isa(obj,'BindableFunction')"
				}
			end,
			["rad"] = function(argString)
				local num = tonumber(argString)
				if not num then return end

				if not service.Players.LocalPlayer.Character or not service.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not service.Players.LocalPlayer.Character.HumanoidRootPart:IsA("BasePart") then return end

				return {
					Headers = {"local isa = game.IsA", "local hrp = service.Players.LocalPlayer.Character.HumanoidRootPart"},
					Setups = {"local hrpPos = hrp.Position"},
					ObjectDefs = {"local isBasePart = isa(obj,'BasePart')"},
					Predicate = "(isBasePart and (obj.Position-hrpPos).Magnitude <= "..num..")"
				}
			end,
		},
		Specific = {
			["players"] = function()
				return function() return service.Players:GetPlayers() end
			end,
			["loadedmodules"] = function()
				return env.getloadedmodules
			end,
		},
		Default = function(argString,caseSensitive)
			local cleanString = argString:gsub("\"","\\\""):gsub("\n","\\n")
			if caseSensitive then
				return {
					Headers = {"local find = string.find"},
					ObjectDefs = {"local objName = tostring(obj)"},
					Predicate = "find(objName,\"" .. cleanString .. "\",1,true)"
				}
			else
				return {
					Headers = {"local lower = string.lower","local find = string.find","local tostring = tostring"},
					ObjectDefs = {"local lowerName = lower(tostring(obj))"},
					Predicate = "find(lowerName,\"" .. cleanString:lower() .. "\",1,true)"
				}
			end
		end,
		SpecificDefault = function(n)
			return {
				Headers = {},
				ObjectDefs = {"local isSpec"..n.." = specResults["..n.."][node]"},
				Predicate = "isSpec"..n
			}
		end,
	}

	Explorer.BuildSearchFunc = function(query)
		local specFilterList,specMap = {},{}
		local finalPredicate = ""
		local rep = string.rep
		local formatQuery = query:gsub("\\.","  "):gsub('".-"',function(str) return rep(" ",#str) end)
		local headers = {}
		local objectDefs = {}
		local setups = {}
		local find = string.find
		local sub = string.sub
		local lower = string.lower
		local match = string.match
		local ops = {
			["("] = "(",
			[")"] = ")",
			["||"] = " or ",
			["&&"] = " and "
		}
		local filterCount = 0
		local compFilters = Explorer.SearchFilters.Comparison
		local specFilters = Explorer.SearchFilters.Specific
		local init = 1
		local lastOp = nil

		local function processFilter(dat)
			if dat.Headers then
				local t = dat.Headers
				for i = 1,#t do
					headers[t[i]] = true
				end
			end

			if dat.ObjectDefs then
				local t = dat.ObjectDefs
				for i = 1,#t do
					objectDefs[t[i]] = true
				end
			end

			if dat.Setups then
				local t = dat.Setups
				for i = 1,#t do
					setups[t[i]] = true
				end
			end

			finalPredicate = finalPredicate..dat.Predicate
		end

		local found = {}
		local foundData = {}
		local find = string.find
		local sub = string.sub

		local function findAll(str,pattern)
			local count = #found+1
			local init = 1
			local sz = #pattern
			local x,y,extra = find(str,pattern,init,true)
			while x do
				found[count] = x
				foundData[x] = {sz,pattern}

				count = count+1
				init = y+1
				x,y,extra = find(str,pattern,init,true)
			end
		end
		local start = tick()
		findAll(formatQuery,'&&')
		findAll(formatQuery,"||")
		findAll(formatQuery,"(")
		findAll(formatQuery,")")
		table.sort(found)
		table.insert(found,#formatQuery+1)

		local function inQuotes(str)
			local len = #str
			if sub(str,1,1) == '"' and sub(str,len,len) == '"' then
				return sub(str,2,len-1)
			end
		end

		for i = 1,#found do
			local nextInd = found[i]
			local nextData = foundData[nextInd] or {1}
			local op = ops[nextData[2]]
			local term = sub(query,init,nextInd-1)
			term = match(term,"^%s*(.-)%s*$") or "" -- Trim

			if #term > 0 then
				if sub(term,1,1) == "!" then
					term = sub(term,2)
					finalPredicate = finalPredicate.."not "
				end

				local qTerm = inQuotes(term)
				if qTerm then
					processFilter(Explorer.SearchFilters.Default(qTerm,true))
				else
					local x,y = find(term,"%S+")
					if x then
						local first = sub(term,x,y)
						local specifier = sub(first,1,1) == "/" and lower(sub(first,2))
						local compFunc = specifier and compFilters[specifier]
						local specFunc = specifier and specFilters[specifier]

						if compFunc then
							local argStr = sub(term,y+2)
							local ret = compFunc(inQuotes(argStr) or argStr)
							if ret then
								processFilter(ret)
							else
								finalPredicate = finalPredicate.."false"
							end
						elseif specFunc then
							local argStr = sub(term,y+2)
							local ret = specFunc(inQuotes(argStr) or argStr)
							if ret then
								if not specMap[term] then
									specFilterList[#specFilterList + 1] = ret
									specMap[term] = #specFilterList
								end
								processFilter(Explorer.SearchFilters.SpecificDefault(specMap[term]))
							else
								finalPredicate = finalPredicate.."false"
							end
						else
							processFilter(Explorer.SearchFilters.Default(term))
						end
					end
				end				
			end

			if op then
				finalPredicate = finalPredicate..op
				if op == "(" and (#term > 0 or lastOp == ")") then -- Handle bracket glitch
					return
				else
					lastOp = op
				end
			end
			init = nextInd+nextData[1]
		end

		local finalSetups = ""
		local finalHeaders = ""
		local finalObjectDefs = ""

		for setup,_ in next,setups do finalSetups = finalSetups..setup.."\n" end
		for header,_ in next,headers do finalHeaders = finalHeaders..header.."\n" end
		for oDef,_ in next,objectDefs do finalObjectDefs = finalObjectDefs..oDef.."\n" end

		local template = [==[
local searchResults = searchResults
local nodes = nodes
local expandTable = Explorer.SearchExpanded
local specResults = specResults
local service = service

%s
local function search(root)	
%s
	
	local expandedpar = false
	for i = 1,#root do
		local node = root[i]
		local obj = node.Obj
		
%s
		
		if %s then
			expandTable[node] = 0
			searchResults[node] = true
			if not expandedpar then
				local parnode = node.Parent
				while parnode and (not searchResults[parnode] or expandTable[parnode] == 0) do
					expandTable[parnode] = true
					searchResults[parnode] = true
					parnode = parnode.Parent
				end
				expandedpar = true
			end
		end
		
		if #node > 0 then search(node) end
	end
end
return search]==]

		local funcStr = template:format(finalHeaders,finalSetups,finalObjectDefs,finalPredicate)
		local s,func = pcall(loadstring,funcStr)
		if not s or not func then return nil,specFilterList end

		local env = setmetatable({["searchResults"] = searchResults, ["nodes"] = nodes, ["Explorer"] = Explorer, ["specResults"] = specResults,
			["service"] = service},{__index = getfenv()})
		setfenv(func,env)

		return func(),specFilterList
	end

	Explorer.DoSearch = function(query)
		table.clear(Explorer.SearchExpanded)
		table.clear(searchResults)
		expanded = (#query == 0 and Explorer.Expanded or Explorer.SearchExpanded)
		searchFunc = nil

		if #query > 0 then	
			local expandTable = Explorer.SearchExpanded
			local specFilters

			local lower = string.lower
			local find = string.find
			local tostring = tostring

			local lowerQuery = lower(query)

			local function defaultSearch(root)
				local expandedpar = false
				for i = 1,#root do
					local node = root[i]
					local obj = node.Obj

					if find(lower(tostring(obj)),lowerQuery,1,true) then
						expandTable[node] = 0
						searchResults[node] = true
						if not expandedpar then
							local parnode = node.Parent
							while parnode and (not searchResults[parnode] or expandTable[parnode] == 0) do
								expanded[parnode] = true
								searchResults[parnode] = true
								parnode = parnode.Parent
							end
							expandedpar = true
						end
					end

					if #node > 0 then defaultSearch(node) end
				end
			end

			if Main.Elevated then
				local start = tick()
				searchFunc,specFilters = Explorer.BuildSearchFunc(query)
				--print("BUILD SEARCH",tick()-start)
			else
				searchFunc = defaultSearch
			end

			if specFilters then
				table.clear(specResults)
				for i = 1,#specFilters do -- Specific search filers that returns list of matches
					local resMap = {}
					specResults[i] = resMap
					local objs = specFilters[i]()
					for c = 1,#objs do
						local node = nodes[objs[c]]
						if node then
							resMap[node] = true
						end
					end
				end
			end

			if searchFunc then
				local start = tick()
				searchFunc(nodes[game])
				searchFunc(nilNode)
				--warn(tick()-start)
			end
		end

		Explorer.ForceUpdate()
	end

	Explorer.ClearSearch = function()
		Explorer.GuiElems.SearchBar.Text = ""
		expanded = Explorer.Expanded
		searchFunc = nil
	end

	Explorer.InitSearch = function()
		local searchBox = Explorer.GuiElems.ToolBar.SearchFrame.SearchBox
		Explorer.GuiElems.SearchBar = searchBox

		Lib.ViewportTextBox.convert(searchBox)

		searchBox.FocusLost:Connect(function()
			Explorer.DoSearch(searchBox.Text)
		end)
	end

	Explorer.InitEntryTemplate = function()
		entryTemplate = create({
			{1,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=1,BorderColor3=Color3.new(0,0,0),Font=3,Name="Entry",Position=UDim2.new(0,1,0,1),Size=UDim2.new(0,250,0,20),Text="",TextSize=14,}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BackgroundTransparency=1,BorderColor3=Color3.new(0.33725491166115,0.49019610881805,0.73725491762161),BorderSizePixel=0,Name="Indent",Parent={1},Position=UDim2.new(0,20,0,0),Size=UDim2.new(1,-20,1,0),}},
			{3,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="EntryName",Parent={2},Position=UDim2.new(0,26,0,0),Size=UDim2.new(1,-26,1,0),Text="Workspace",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
			{4,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClipsDescendants=true,Font=3,Name="Expand",Parent={2},Position=UDim2.new(0,-20,0,0),Size=UDim2.new(0,20,0,20),Text="",TextSize=14,}},
			{5,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642383285",ImageRectOffset=Vector2.new(144,16),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={4},Position=UDim2.new(0,2,0,2),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
			{6,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ImageRectOffset=Vector2.new(304,0),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={2},Position=UDim2.new(0,4,0,2),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
		})

		local sys = Lib.ClickSystem.new()
		sys.AllowedButtons = {1,2}
		sys.OnDown:Connect(function(item,combo,button)
			local ind = table.find(listEntries,item)
			if not ind then return end
			local node = tree[ind + Explorer.Index]
			if not node then return end

			local entry = listEntries[ind]

			if button == 1 then
				if combo == 2 then
					if node.Obj:IsA("LuaSourceContainer") then
						ScriptViewer.ViewScript(node.Obj)
					elseif #node > 0 and expanded[node] ~= 0 then
						expanded[node] = not expanded[node]
						Explorer.Update()
					end
				end

				if Properties.SelectObject(node.Obj) then
					sys.IsRenaming = false
					return
				end

				sys.IsRenaming = selection.Map[node]

				if Lib.IsShiftDown() then
					if not selection.Piviot then return end

					local fromIndex = table.find(tree,selection.Piviot)
					local toIndex = table.find(tree,node)
					if not fromIndex or not toIndex then return end
					fromIndex,toIndex = math.min(fromIndex,toIndex),math.max(fromIndex,toIndex)

					local sList = selection.List
					for i = #sList,1,-1 do
						local elem = sList[i]
						if selection.ShiftSet[elem] then
							selection.Map[elem] = nil
							table.remove(sList,i)
						end
					end
					selection.ShiftSet = {}
					for i = fromIndex,toIndex do
						local elem = tree[i]
						if not selection.Map[elem] then
							selection.ShiftSet[elem] = true
							selection.Map[elem] = true
							sList[#sList+1] = elem
						end
					end
					selection.Changed:Fire()
				elseif Lib.IsCtrlDown() then
					selection.ShiftSet = {}
					if selection.Map[node] then selection:Remove(node) else selection:Add(node) end
					selection.Piviot = node
					sys.IsRenaming = false
				elseif not selection.Map[node] then
					selection.ShiftSet = {}
					selection:Set(node)
					selection.Piviot = node
				end
			elseif button == 2 then
				if Properties.SelectObject(node.Obj) then
					return
				end

				if not Lib.IsCtrlDown() and not selection.Map[node] then
					selection.ShiftSet = {}
					selection:Set(node)
					selection.Piviot = node
					Explorer.Refresh()
				end
			end

			Explorer.Refresh()
		end)

		sys.OnRelease:Connect(function(item,combo,button,position)
			local ind = table.find(listEntries,item)
			if not ind then return end
			local node = tree[ind + Explorer.Index]
			if not node then return end

			if button == 1 then
				if selection.Map[node] and not Lib.IsShiftDown() and not Lib.IsCtrlDown() then
					selection.ShiftSet = {}
					selection:Set(node)
					selection.Piviot = node
					Explorer.Refresh()
				end

				local id = sys.ClickId
				Lib.FastWait(sys.ComboTime)
				if combo == 1 and id == sys.ClickId and sys.IsRenaming and selection.Map[node] then
					Explorer.SetRenamingNode(node)
				end
			elseif button == 2 then
				Explorer.ShowRightClick(position)
			end
		end)
		Explorer.ClickSystem = sys
	end

	Explorer.InitDelCleaner = function()
		coroutine.wrap(function()
			local fw = Lib.FastWait
			while true do
				local processed = false
				local c = 0
				for _,node in next,nodes do
					if node.HasDel then
						local delInd
						for i = 1,#node do
							if node[i].Del then
								delInd = i
								break
							end
						end
						if delInd then
							for i = delInd+1,#node do
								local cn = node[i]
								if not cn.Del then
									node[delInd] = cn
									delInd = delInd+1
								end
							end
							for i = delInd,#node do
								node[i] = nil
							end
						end
						node.HasDel = false
						processed = true
						fw()
					end
					c = c + 1
					if c > 10000 then
						c = 0
						fw()
					end
				end
				if processed and not refreshDebounce then Explorer.PerformRefresh() end
				fw(0.5)
			end
		end)()
	end

	Explorer.UpdateSelectionVisuals = function()
		local holder = Explorer.SelectionVisualsHolder
		local isa = game.IsA
		local clone = game.Clone
		if not holder then
			holder = Instance.new("ScreenGui")
			holder.Name = "ExplorerSelections"
			holder.DisplayOrder = Main.DisplayOrders.Core
			Lib.ShowGui(holder)
			Explorer.SelectionVisualsHolder = holder
			Explorer.SelectionVisualCons = {}

			local guiTemplate = create({
				{1,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Size=UDim2.new(0,100,0,100),}},
				{2,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,-1,0,-1),Size=UDim2.new(1,2,0,1),}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,-1,1,0),Size=UDim2.new(1,2,0,1),}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,-1,0,0),Size=UDim2.new(0,1,1,0),}},
				{5,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BorderSizePixel=0,Parent={1},Position=UDim2.new(1,0,0,0),Size=UDim2.new(0,1,1,0),}},
			})
			Explorer.SelectionVisualGui = guiTemplate

			local boxTemplate = Instance.new("SelectionBox")
			boxTemplate.LineThickness = 0.03
			boxTemplate.Color3 = Color3.fromRGB(0, 170, 255)
			Explorer.SelectionVisualBox = boxTemplate
		end
		holder:ClearAllChildren()

		-- Updates theme
		for i,v in pairs(Explorer.SelectionVisualGui:GetChildren()) do
			v.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
		end

		local attachCons = Explorer.SelectionVisualCons
		for i = 1,#attachCons do
			attachCons[i].Destroy()
		end
		table.clear(attachCons)

		local partEnabled = Settings.Explorer.PartSelectionBox
		local guiEnabled = Settings.Explorer.GuiSelectionBox
		if not partEnabled and not guiEnabled then return end

		local svg = Explorer.SelectionVisualGui
		local svb = Explorer.SelectionVisualBox
		local attachTo = Lib.AttachTo
		local sList = selection.List
		local count = 1
		local boxCount = 0
		local workspaceNode = nodes[workspace]
		for i = 1,#sList do
			if boxCount > 1000 then break end
			local node = sList[i]
			local obj = node.Obj

			if node ~= workspaceNode then
				if isa(obj,"GuiObject") and guiEnabled then
					local newVisual = clone(svg)
					attachCons[count] = attachTo(newVisual,{Target = obj, Resize = true})
					count = count + 1
					newVisual.Parent = holder
					boxCount = boxCount + 1
				elseif isa(obj,"PVInstance") and partEnabled then
					local newBox = clone(svb)
					newBox.Adornee = obj
					newBox.Parent = holder
					boxCount = boxCount + 1
				end
			end
		end
	end

	Explorer.Init = function()
		Explorer.LegacyClassIcons = Lib.IconMap.newLinear("rbxasset://textures/ClassImages.PNG", 16,16)
		
		if Settings.ClassIcon ~= nil and Settings.ClassIcon ~= "Old" then
			iconData = Lib.IconMap.getIconDataFromName(Settings.ClassIcon)
			
			Explorer.ClassIcons = Lib.IconMap.new("rbxassetid://"..tostring(iconData.MapId), iconData.IconSize * iconData.Witdh, iconData.IconSize * iconData.Height,iconData.IconSize,iconData.IconSize)
			-- move every value dict 1 behind because SetDict starts at 0 not 1 lol
			local fixed = {}
			for i,v in pairs(iconData.Icons) do
				fixed[i] = v - 1
			end
			
			iconData.Icons = fixed
			Explorer.ClassIcons:SetDict(fixed)
		else
			Explorer.ClassIcons = Lib.IconMap.newLinear("rbxasset://textures/ClassImages.PNG", 16,16)
		end
		
		Explorer.MiscIcons = Main.MiscIcons

		clipboard = {}

		selection = Lib.Set.new()
		selection.ShiftSet = {}
		selection.Changed:Connect(Properties.ShowExplorerProps)
		Explorer.Selection = selection

		Explorer.InitRightClick()
		Explorer.InitInsertObject()
		Explorer.SetSortingEnabled(Settings.Explorer.Sorting)
		Explorer.Expanded = setmetatable({},{__mode = "k"})
		Explorer.SearchExpanded = setmetatable({},{__mode = "k"})
		expanded = Explorer.Expanded

		nilNode.Obj.Name = "Nil Instances"
		nilNode.Locked = true

		local explorerItems = create({
			{1,"Folder",{Name="ExplorerItems",}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="ToolBar",Parent={1},Size=UDim2.new(1,0,0,22),}},
			{3,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.1176470592618,0.1176470592618,0.1176470592618),BorderSizePixel=0,Name="SearchFrame",Parent={2},Position=UDim2.new(0,3,0,1),Size=UDim2.new(1,-6,0,18),}},
			{4,"TextBox",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClearTextOnFocus=false,Font=3,Name="SearchBox",Parent={3},PlaceholderColor3=Color3.new(0.39215689897537,0.39215689897537,0.39215689897537),PlaceholderText="Search workspace",Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-24,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,}},
			{5,"UICorner",{CornerRadius=UDim.new(0,2),Parent={3},}},
			{6,"UIStroke",{Thickness=1.4,Parent={3},Color=Color3.fromRGB(42,42,42)}},
			{7,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Reset",Parent={3},Position=UDim2.new(1,-17,0,1),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{8,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5034718129",ImageColor3=Color3.new(0.39215686917305,0.39215686917305,0.39215686917305),Parent={7},Size=UDim2.new(0,16,0,16),}},
			{9,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Refresh",Parent={2},Position=UDim2.new(1,-20,0,1),Size=UDim2.new(0,18,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{10,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642310344",Parent={9},Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,12,0,12),}},
			{11,"Frame",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Name="ScrollCorner",Parent={1},Position=UDim2.new(1,-16,1,-16),Size=UDim2.new(0,16,0,16),Visible=false,}},
			{12,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClipsDescendants=true,Name="List",Parent={1},Position=UDim2.new(0,0,0,23),Size=UDim2.new(1,0,1,-23),}}
		})

		toolBar = explorerItems.ToolBar
		treeFrame = explorerItems.List

		Explorer.GuiElems.ToolBar = toolBar
		Explorer.GuiElems.TreeFrame = treeFrame

		scrollV = Lib.ScrollBar.new()		
		scrollV.WheelIncrement = 3
		scrollV.Gui.Position = UDim2.new(1,-16,0,23)
		scrollV:SetScrollFrame(treeFrame)
		scrollV.Scrolled:Connect(function()
			Explorer.Index = scrollV.Index
			Explorer.Refresh()
		end)

		scrollH = Lib.ScrollBar.new(true)
		scrollH.Increment = 5
		scrollH.WheelIncrement = Explorer.EntryIndent
		scrollH.Gui.Position = UDim2.new(0,0,1,-16)
		scrollH.Scrolled:Connect(function()
			Explorer.Refresh()
		end)

		local window = Lib.Window.new()
		Explorer.Window = window
		window:SetTitle("Explorer")
		window.GuiElems.Line.Position = UDim2.new(0,0,0,22)

		Explorer.InitEntryTemplate()
		toolBar.Parent = window.GuiElems.Content
		treeFrame.Parent = window.GuiElems.Content
		explorerItems.ScrollCorner.Parent = window.GuiElems.Content
		scrollV.Gui.Parent = window.GuiElems.Content
		scrollH.Gui.Parent = window.GuiElems.Content

		-- Init stuff that requires the window
		Explorer.InitRenameBox()
		Explorer.InitSearch()
		Explorer.InitDelCleaner()
		selection.Changed:Connect(Explorer.UpdateSelectionVisuals)

		-- Window events
		window.GuiElems.Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if Explorer.Active then
				Explorer.UpdateView()
				Explorer.Refresh()
			end
		end)
		window.OnActivate:Connect(function()
			Explorer.Active = true
			Explorer.UpdateView()
			Explorer.Update()
			Explorer.Refresh()
		end)
		window.OnRestore:Connect(function()
			Explorer.Active = true
			Explorer.UpdateView()
			Explorer.Update()
			Explorer.Refresh()
		end)
		window.OnDeactivate:Connect(function() Explorer.Active = false end)
		window.OnMinimize:Connect(function() Explorer.Active = false end)

		-- Settings
		autoUpdateSearch = Settings.Explorer.AutoUpdateSearch

		-- Fill in nodes
		nodes[game] = {Obj = game}
		expanded[nodes[game]] = true

		-- Nil Instances
		if env.getnilinstances then
			nodes[nilNode.Obj] = nilNode
		end

		Explorer.SetupConnections()

		local insts = getDescendants(game)
		if Main.Elevated then
			for i = 1,#insts do
				local obj = insts[i]
				local par = nodes[ffa(obj,"Instance")]
				if not par then continue end
				local newNode = {
					Obj = obj,
					Parent = par,
				}
				nodes[obj] = newNode
				par[#par+1] = newNode
			end
		else
			for i = 1,#insts do
				local obj = insts[i]
				local s,parObj = pcall(ffa,obj,"Instance")
				local par = nodes[parObj]
				if not par then continue end
				local newNode = {
					Obj = obj,
					Parent = par,
				}
				nodes[obj] = newNode
				par[#par+1] = newNode
			end
		end
	end

	return Explorer
end

return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end,
["Lib"] = function()
--[[
	Lib Module
	
	Container for functions and classes
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local function main()
	local Lib = {}

	local renderStepped = service.RunService.RenderStepped
	local signalWait = renderStepped.wait
	local PH = newproxy() -- Placeholder, must be replaced in constructor
	local SIGNAL = newproxy()

	-- Usually for classes that work with a Roblox Object
	local function initObj(props,mt)
		local type = type
		local function copy(t)
			local res = {}
			for i,v in pairs(t) do
				if v == SIGNAL then
					res[i] = Lib.Signal.new()
				elseif type(v) == "table" then
					res[i] = copy(v)
				else
					res[i] = v
				end
			end		
			return res
		end

		local newObj = copy(props)
		return setmetatable(newObj,mt)
	end

	local function getGuiMT(props,funcs)
		return {__index = function(self,ind) if not props[ind] then return funcs[ind] or self.Gui[ind] end end,
		__newindex = function(self,ind,val) if not props[ind] then self.Gui[ind] = val else rawset(self,ind,val) end end}
	end

	-- Functions

	Lib.FormatLuaString = (function()
		local string = string
		local gsub = string.gsub
		local format = string.format
		local char = string.char
		local cleanTable = {['"'] = '\\"', ['\\'] = '\\\\'}
		for i = 0,31 do
			cleanTable[char(i)] = "\\"..format("%03d",i)
		end
		for i = 127,255 do
			cleanTable[char(i)] = "\\"..format("%03d",i)
		end

		return function(str)
			return gsub(str,"[\"\\\0-\31\127-\255]",cleanTable)
		end
	end)()

	Lib.CheckMouseInGui = function(gui)
		if gui == nil then return false end
		local mouse = Main.Mouse
		local guiPosition = gui.AbsolutePosition
		local guiSize = gui.AbsoluteSize	

		return mouse.X >= guiPosition.X and mouse.X < guiPosition.X + guiSize.X and mouse.Y >= guiPosition.Y and mouse.Y < guiPosition.Y + guiSize.Y
	end

	Lib.IsShiftDown = function()
		return service.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or service.UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
	end

	Lib.IsCtrlDown = function()
		return service.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or service.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
	end

	Lib.CreateArrow = function(size,num,dir)
		local max = num
		local arrowFrame = createSimple("Frame",{
			BackgroundTransparency = 1,
			Name = "Arrow",
			Size = UDim2.new(0,size,0,size)
		})
		if dir == "up" then
			for i = 1,num do
				local newLine = createSimple("Frame",{
					BackgroundColor3 = Color3.new(220/255,220/255,220/255),
					BorderSizePixel = 0,
					Position = UDim2.new(0,math.floor(size/2)-(i-1),0,math.floor(size/2)+i-math.floor(max/2)-1),
					Size = UDim2.new(0,i+(i-1),0,1),
					Parent = arrowFrame
				})
			end
			return arrowFrame
		elseif dir == "down" then
			for i = 1,num do
				local newLine = createSimple("Frame",{
					BackgroundColor3 = Color3.new(220/255,220/255,220/255),
					BorderSizePixel = 0,
					Position = UDim2.new(0,math.floor(size/2)-(i-1),0,math.floor(size/2)-i+math.floor(max/2)+1),
					Size = UDim2.new(0,i+(i-1),0,1),
					Parent = arrowFrame
				})
			end
			return arrowFrame
		elseif dir == "left" then
			for i = 1,num do
				local newLine = createSimple("Frame",{
					BackgroundColor3 = Color3.new(220/255,220/255,220/255),
					BorderSizePixel = 0,
					Position = UDim2.new(0,math.floor(size/2)+i-math.floor(max/2)-1,0,math.floor(size/2)-(i-1)),
					Size = UDim2.new(0,1,0,i+(i-1)),
					Parent = arrowFrame
				})
			end
			return arrowFrame
		elseif dir == "right" then
			for i = 1,num do
				local newLine = createSimple("Frame",{
					BackgroundColor3 = Color3.new(220/255,220/255,220/255),
					BorderSizePixel = 0,
					Position = UDim2.new(0,math.floor(size/2)-i+math.floor(max/2)+1,0,math.floor(size/2)-(i-1)),
					Size = UDim2.new(0,1,0,i+(i-1)),
					Parent = arrowFrame
				})
			end
			return arrowFrame
		end
		error("r u ok")
	end

	Lib.ParseXML = (function()
		local func = function()
			-- Only exists to parse RMD
			-- from https://github.com/jonathanpoelen/xmlparser

			local string, print, pairs = string, print, pairs

			-- http://lua-users.org/wiki/StringTrim
			local trim = function(s)
				local from = s:match"^%s*()"
				return from > #s and "" or s:match(".*%S", from)
			end

			local gtchar = string.byte('>', 1)
			local slashchar = string.byte('/', 1)
			local D = string.byte('D', 1)
			local E = string.byte('E', 1)

			function parse(s, evalEntities)
				-- remove comments
				s = s:gsub('<!%-%-(.-)%-%->', '')

				local entities, tentities = {}

				if evalEntities then
					local pos = s:find('<[_%w]')
					if pos then
						s:sub(1, pos):gsub('<!ENTITY%s+([_%w]+)%s+(.)(.-)%2', function(name, q, entity)
							entities[#entities+1] = {name=name, value=entity}
						end)
						tentities = createEntityTable(entities)
						s = replaceEntities(s:sub(pos), tentities)
					end
				end

				local t, l = {}, {}

				local addtext = function(txt)
					txt = txt:match'^%s*(.*%S)' or ''
					if #txt ~= 0 then
						t[#t+1] = {text=txt}
					end		
				end

				s:gsub('<([?!/]?)([-:_%w]+)%s*(/?>?)([^<]*)', function(type, name, closed, txt)
					-- open
					if #type == 0 then
						local a = {}
						if #closed == 0 then
							local len = 0
							for all,aname,_,value,starttxt in string.gmatch(txt, "(.-([-_%w]+)%s*=%s*(.)(.-)%3%s*(/?>?))") do
								len = len + #all
								a[aname] = value
								if #starttxt ~= 0 then
									txt = txt:sub(len+1)
									closed = starttxt
									break
								end
							end
						end
						t[#t+1] = {tag=name, attrs=a, children={}}

						if closed:byte(1) ~= slashchar then
							l[#l+1] = t
							t = t[#t].children
						end

						addtext(txt)
						-- close
					elseif '/' == type then
						t = l[#l]
						l[#l] = nil

						addtext(txt)
						-- ENTITY
					elseif '!' == type then
						if E == name:byte(1) then
							txt:gsub('([_%w]+)%s+(.)(.-)%2', function(name, q, entity)
								entities[#entities+1] = {name=name, value=entity}
							end, 1)
						end
						-- elseif '?' == type then
						--	 print('?	' .. name .. ' // ' .. attrs .. '$$')
						-- elseif '-' == type then
						--	 print('comment	' .. name .. ' // ' .. attrs .. '$$')
						-- else
						--	 print('o	' .. #p .. ' // ' .. name .. ' // ' .. attrs .. '$$')
					end
				end)

				return {children=t, entities=entities, tentities=tentities}
			end

			function parseText(txt)
				return parse(txt)
			end

			function defaultEntityTable()
				return { quot='"', apos='\'', lt='<', gt='>', amp='&', tab='\t', nbsp=' ', }
			end

			function replaceEntities(s, entities)
				return s:gsub('&([^;]+);', entities)
			end

			function createEntityTable(docEntities, resultEntities)
				entities = resultEntities or defaultEntityTable()
				for _,e in pairs(docEntities) do
					e.value = replaceEntities(e.value, entities)
					entities[e.name] = e.value
				end
				return entities
			end

			return parseText
		end
		local newEnv = setmetatable({},{__index = getfenv()})
		setfenv(func,newEnv)
		return func()
	end)()

	Lib.FastWait = function(s)
		if not s then return signalWait(renderStepped) end
		local start = tick()
		while tick() - start < s do signalWait(renderStepped) end
	end

	Lib.ButtonAnim = function(button,data)
		local holding = false
		local disabled = false
		local mode = data and data.Mode or 1
		local control = {}

		if mode == 2 then
			local lerpTo = data.LerpTo or Color3.new(0,0,0)
			local delta = data.LerpDelta or 0.2
			control.StartColor = data.StartColor or button.BackgroundColor3
			control.PressColor = data.PressColor or control.StartColor:lerp(lerpTo,delta)
			control.HoverColor = data.HoverColor or control.StartColor:lerp(control.PressColor,0.6)
			control.OutlineColor = data.OutlineColor
		end

		button.InputBegan:Connect(function(input)
			if disabled then return end

			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if not holding then
					if mode == 1 then
						button.BackgroundTransparency = 0.4
					elseif mode == 2 then
						button.BackgroundColor3 = control.HoverColor
					end
				end
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				holding = true
				if mode == 1 then
					button.BackgroundTransparency = 0
				elseif mode == 2 then
					button.BackgroundColor3 = control.PressColor
					if control.OutlineColor then button.BorderColor3 = control.PressColor end
				end
			end
		end)

		button.InputEnded:Connect(function(input)
			if disabled then return end

			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if not holding then
					if mode == 1 then
						button.BackgroundTransparency = 1
					elseif mode == 2 then
						button.BackgroundColor3 = control.StartColor
					end
				end
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				holding = false
				if mode == 1 then
					button.BackgroundTransparency = Lib.CheckMouseInGui(button) and 0.4 or 1
				elseif mode == 2 then
					button.BackgroundColor3 = Lib.CheckMouseInGui(button) and control.HoverColor or control.StartColor
					if control.OutlineColor then button.BorderColor3 = control.OutlineColor end
				end
			end
		end)

		control.Disable = function()
			disabled = true
			holding = false

			if mode == 1 then
				button.BackgroundTransparency = 1
			elseif mode == 2 then
				button.BackgroundColor3 = control.StartColor
			end
		end

		control.Enable = function()
			disabled = false
		end

		return control
	end

	Lib.FindAndRemove = function(t,item)
		local pos = table.find(t,item)
		if pos then table.remove(t,pos) end
	end

	Lib.AttachTo = function(obj,data)
		local target,posOffX,posOffY,sizeOffX,sizeOffY,resize,con
		local disabled = false

		local function update()
			if not obj or not target then return end

			local targetPos = target.AbsolutePosition
			local targetSize = target.AbsoluteSize
			obj.Position = UDim2.new(0,targetPos.X + posOffX,0,targetPos.Y + posOffY)
			if resize then obj.Size = UDim2.new(0,targetSize.X + sizeOffX,0,targetSize.Y + sizeOffY) end
		end

		local function setup(o,data)
			obj = o
			data = data or {}
			target = data.Target
			posOffX = data.PosOffX or 0
			posOffY = data.PosOffY or 0
			sizeOffX = data.SizeOffX or 0
			sizeOffY = data.SizeOffY or 0
			resize = data.Resize or false

			if con then con:Disconnect() con = nil end
			if target then
				con = target.Changed:Connect(function(prop)
					if not disabled and prop == "AbsolutePosition" or prop == "AbsoluteSize" then
						update()
					end
				end)
			end

			update()
		end
		setup(obj,data)

		return {
			SetData = function(obj,data)
				setup(obj,data)
			end,
			Enable = function()
				disabled = false
				update()
			end,
			Disable = function()
				disabled = true
			end,
			Destroy = function()
				con:Disconnect()
				con = nil
			end,
		}
	end

	Lib.ProtectedGuis = {}

	Lib.ShowGui = Main.SecureGui

	Lib.ColorToBytes = function(col)
		local round = math.round
		return string.format("%d, %d, %d",round(col.r*255),round(col.g*255),round(col.b*255))
	end

	Lib.ReadFile = function(filename)
		if not env.readfile then return end

		local s,contents = pcall(env.readfile,filename)
		if s and contents then return contents end
	end

	Lib.DeferFunc = function(f,...)
		signalWait(renderStepped)
		return f(...)
	end

	Lib.LoadCustomAsset = function(filepath)
		if not env.getcustomasset or not env.isfile or not env.isfile(filepath) then return end

		return env.getcustomasset(filepath)
	end

	Lib.FetchCustomAsset = function(url,filepath)
		if not env.writefile then return end

		local s,data = pcall(oldgame.HttpGet,game,url)
		if not s then return end

		env.writefile(filepath,data)
		return Lib.LoadCustomAsset(filepath)
	end
	
	local currentfilename, currentextension, currentclickhandler
	currentclickhandler = function() end
	Lib.SaveAsPrompt = function(filename, codeToSave, ext)		
		local win = ScriptViewer.SaveAsWindow
		if not win then
			win = Lib.Window.new()
			win.Alignable = false
			win.Resizable = false
			win:SetTitle("Save As")
			win:SetSize(300,95)

			local saveButton = Lib.Button.new()
			local nameLabel = Lib.Label.new()
			nameLabel.Text = "Name"
			nameLabel.Position = UDim2.new(0,30,0,10)
			nameLabel.Size = UDim2.new(0,40,0,20)
			win:Add(nameLabel)

			local nameBox = Lib.ViewportTextBox.new()
			nameBox.Position = UDim2.new(0,75,0,10)
			nameBox.Size = UDim2.new(0,220,0,20)
			win:Add(nameBox,"NameBox")

			--nameBox.TextBox.Text = filename or ""

			nameBox.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
				saveButton:SetDisabled(#nameBox:GetText() == 0)
			end)

			local errorLabel = Lib.Label.new()
			errorLabel.Text = ""
			errorLabel.Position = UDim2.new(0,5,1,-45)
			errorLabel.Size = UDim2.new(1,-10,0,20)
			errorLabel.TextColor3 = Settings.Theme.Important
			win.ErrorLabel = errorLabel
			win:Add(errorLabel,"Error")

			local cancelButton = Lib.Button.new()
			cancelButton.AnchorPoint = Vector2.new(1,1)
			cancelButton.Text = "Cancel"
			cancelButton.Position = UDim2.new(1,-5,1,-5)
			cancelButton.Size = UDim2.new(0.5,-10,0,20)
			cancelButton.OnClick:Connect(function()
				win:Close()
			end)
			win:Add(cancelButton)

			saveButton.Text = "Save"
			saveButton.AnchorPoint = Vector2.new(0,1)
			saveButton.Position = UDim2.new(0,5,1,-5)
			saveButton.Size = UDim2.new(0.5,-5,0,20)
			saveButton.OnClick:Connect(function()
				currentclickhandler()
			end)

			win:Add(saveButton,"SaveButton")

			ScriptViewer.SaveAsWindow = win
		end

		currentclickhandler = function()
			if type(codeToSave) == "string" then
				filename = (win.Elements.NameBox.TextBox.Text ~= "" and win.Elements.NameBox.TextBox.Text) or filename
				currentextension = ext or filename:match("%.([^%.]+)$") or "txt"
				filename = filename:gsub("%.[^.]+$", "") .. "." .. currentextension

				local codeText = codeToSave or ""
				if env.writefile then
					local s, msg = pcall(env.writefile, filename, codeText)
					if not s then
						win.Elements.Error.Text = "Error: " .. msg
						task.spawn(error, msg)
						task.wait(1)
					end
				else
					win.Elements.Error.Text = "Your executor does not support 'writefile'"
					task.wait(1)
				end
			elseif type(codeToSave) == "function" then
				filename = (win.Elements.NameBox.TextBox.Text ~= "" and win.Elements.NameBox.TextBox.Text) or filename
				currentextension = ext or filename:match("%.([^%.]+)$") or "txt"
				filename = filename:gsub("%.[^.]+$", "") .. "." .. currentextension

				local s, msg = pcall(codeToSave,filename) -- callback
				if not s then
					win.Elements.Error.Text = "Error: " .. msg
					task.spawn(error, msg)
					Lib.FastWait(1)
				end
			end
			win:Close()
		end

		win:SetTitle("Save As")
		win.Elements.Error.Text = ""
		win.Elements.NameBox:SetText(filename or "")
		
		win.Elements.SaveButton:SetDisabled(win.Elements.NameBox:GetText() == 0)
		
		win:Show()
	end

	-- Classes

	Lib.Signal = (function()
		local funcs = {}

		local disconnect = function(con)
			local pos = table.find(con.Signal.Connections,con)
			if pos then table.remove(con.Signal.Connections,pos) end
		end

		funcs.Connect = function(self,func)
			if type(func) ~= "function" then error("Attempt to connect a non-function") end		
			local con = {
				Signal = self,
				Func = func,
				Disconnect = disconnect
			}
			self.Connections[#self.Connections+1] = con
			return con
		end

		funcs.Fire = function(self,...)
			for i,v in next,self.Connections do
				xpcall(coroutine.wrap(v.Func),function(e) warn(e.."\n"..debug.traceback()) end,...)
			end
		end

		local mt = {
			__index = funcs,
			__tostring = function(self)
				return "Signal: " .. tostring(#self.Connections) .. " Connections"
			end
		}

		local function new()
			local obj = {}
			obj.Connections = {}

			return setmetatable(obj,mt)
		end

		return {new = new}
	end)()

	Lib.Set = (function()
		local funcs = {}

		funcs.Add = function(self,obj)
			if self.Map[obj] then return end

			local list = self.List
			list[#list+1] = obj
			self.Map[obj] = true
			self.Changed:Fire()
		end

		funcs.AddTable = function(self,t)
			local changed
			local list,map = self.List,self.Map
			for i = 1,#t do
				local elem = t[i]
				if not map[elem] then
					list[#list+1] = elem
					map[elem] = true
					changed = true
				end
			end
			if changed then self.Changed:Fire() end
		end

		funcs.Remove = function(self,obj)
			if not self.Map[obj] then return end

			local list = self.List
			local pos = table.find(list,obj)
			if pos then table.remove(list,pos) end
			self.Map[obj] = nil
			self.Changed:Fire()
		end

		funcs.RemoveTable = function(self,t)
			local changed
			local list,map = self.List,self.Map
			local removeSet = {}
			for i = 1,#t do
				local elem = t[i]
				map[elem] = nil
				removeSet[elem] = true
			end

			for i = #list,1,-1 do
				local elem = list[i]
				if removeSet[elem] then
					table.remove(list,i)
					changed = true
				end
			end
			if changed then self.Changed:Fire() end
		end

		funcs.Set = function(self,obj)
			if #self.List == 1 and self.List[1] == obj then return end

			self.List = {obj}
			self.Map = {[obj] = true}
			self.Changed:Fire()
		end

		funcs.SetTable = function(self,t)
			local newList,newMap = {},{}
			self.List,self.Map = newList,newMap
			table.move(t,1,#t,1,newList)
			for i = 1,#t do
				newMap[t[i]] = true
			end
			self.Changed:Fire()
		end

		funcs.Clear = function(self)
			if #self.List == 0 then return end
			self.List = {}
			self.Map = {}
			self.Changed:Fire()
		end

		local mt = {__index = funcs}

		local function new()
			local obj = setmetatable({
				List = {},
				Map = {},
				Changed = Lib.Signal.new()
			},mt)

			return obj
		end

		return {new = new}
	end)()
	
	Lib.IconMap = (function()
		local funcs = {}
		local IconList = {
			Old = {
				MapId = 483448923,
				IconSize = 16,
				Witdh = 16,
				Height = 16,
				Icons = {
					["Accessory"] = 32;
					["Accoutrement"] = 32;
					["AdService"] = 73;
					["Animation"] = 60;
					["AnimationController"] = 60;
					["AnimationTrack"] = 60;
					["Animator"] = 60;
					["ArcHandles"] = 56;
					["AssetService"] = 72;
					["Attachment"] = 34;
					["Backpack"] = 20;
					["BadgeService"] = 75;
					["BallSocketConstraint"] = 89;
					["BillboardGui"] = 64;
					["BinaryStringValue"] = 4;
					["BindableEvent"] = 67;
					["BindableFunction"] = 66;
					["BlockMesh"] = 8;
					["BloomEffect"] = 90;
					["BlurEffect"] = 90;
					["BodyAngularVelocity"] = 14;
					["BodyForce"] = 14;
					["BodyGyro"] = 14;
					["BodyPosition"] = 14;
					["BodyThrust"] = 14;
					["BodyVelocity"] = 14;
					["BoolValue"] = 4;
					["BoxHandleAdornment"] = 54;
					["BrickColorValue"] = 4;
					["Camera"] = 5;
					["CFrameValue"] = 4;
					["CharacterMesh"] = 60;
					["Chat"] = 33;
					["ClickDetector"] = 41;
					["CollectionService"] = 30;
					["Color3Value"] = 4;
					["ColorCorrectionEffect"] = 90;
					["ConeHandleAdornment"] = 54;
					["Configuration"] = 58;
					["ContentProvider"] = 72;
					["ContextActionService"] = 41;
					["CoreGui"] = 46;
					["CoreScript"] = 18;
					["CornerWedgePart"] = 1;
					["CustomEvent"] = 4;
					["CustomEventReceiver"] = 4;
					["CylinderHandleAdornment"] = 54;
					["CylinderMesh"] = 8;
					["CylindricalConstraint"] = 89;
					["Debris"] = 30;
					["Decal"] = 7;
					["Dialog"] = 62;
					["DialogChoice"] = 63;
					["DoubleConstrainedValue"] = 4;
					["Explosion"] = 36;
					["FileMesh"] = 8;
					["Fire"] = 61;
					["Flag"] = 38;
					["FlagStand"] = 39;
					["FloorWire"] = 4;
					["Folder"] = 70;
					["ForceField"] = 37;
					["Frame"] = 48;
					["GamePassService"] = 19;
					["Glue"] = 34;
					["GuiButton"] = 52;
					["GuiMain"] = 47;
					["GuiService"] = 47;
					["Handles"] = 53;
					["HapticService"] = 84;
					["Hat"] = 45;
					["HingeConstraint"] = 89;
					["Hint"] = 33;
					["HopperBin"] = 22;
					["HttpService"] = 76;
					["Humanoid"] = 9;
					["ImageButton"] = 52;
					["ImageLabel"] = 49;
					["InsertService"] = 72;
					["IntConstrainedValue"] = 4;
					["IntValue"] = 4;
					["JointInstance"] = 34;
					["JointsService"] = 34;
					["Keyframe"] = 60;
					["KeyframeSequence"] = 60;
					["KeyframeSequenceProvider"] = 60;
					["Lighting"] = 13;
					["LineHandleAdornment"] = 54;
					["LocalScript"] = 18;
					["LogService"] = 87;
					["MarketplaceService"] = 46;
					["Message"] = 33;
					["Model"] = 2;
					["ModuleScript"] = 71;
					["Motor"] = 34;
					["Motor6D"] = 34;
					["MoveToConstraint"] = 89;
					["NegateOperation"] = 78;
					["NetworkClient"] = 16;
					["NetworkReplicator"] = 29;
					["NetworkServer"] = 15;
					["NumberValue"] = 4;
					["ObjectValue"] = 4;
					["Pants"] = 44;
					["ParallelRampPart"] = 1;
					["Part"] = 1;
					["ParticleEmitter"] = 69;
					["PartPairLasso"] = 57;
					["PathfindingService"] = 37;
					["Platform"] = 35;
					["Player"] = 12;
					["PlayerGui"] = 46;
					["Players"] = 21;
					["PlayerScripts"] = 82;
					["PointLight"] = 13;
					["PointsService"] = 83;
					["Pose"] = 60;
					["PrismaticConstraint"] = 89;
					["PrismPart"] = 1;
					["PyramidPart"] = 1;
					["RayValue"] = 4;
					["ReflectionMetadata"] = 86;
					["ReflectionMetadataCallbacks"] = 86;
					["ReflectionMetadataClass"] = 86;
					["ReflectionMetadataClasses"] = 86;
					["ReflectionMetadataEnum"] = 86;
					["ReflectionMetadataEnumItem"] = 86;
					["ReflectionMetadataEnums"] = 86;
					["ReflectionMetadataEvents"] = 86;
					["ReflectionMetadataFunctions"] = 86;
					["ReflectionMetadataMember"] = 86;
					["ReflectionMetadataProperties"] = 86;
					["ReflectionMetadataYieldFunctions"] = 86;
					["RemoteEvent"] = 80;
					["RemoteFunction"] = 79;
					["ReplicatedFirst"] = 72;
					["ReplicatedStorage"] = 72;
					["RightAngleRampPart"] = 1;
					["RocketPropulsion"] = 14;
					["RodConstraint"] = 89;
					["RopeConstraint"] = 89;
					["Rotate"] = 34;
					["RotateP"] = 34;
					["RotateV"] = 34;
					["RunService"] = 66;
					["ScreenGui"] = 47;
					["Script"] = 6;
					["ScrollingFrame"] = 48;
					["Seat"] = 35;
					["Selection"] = 55;
					["SelectionBox"] = 54;
					["SelectionPartLasso"] = 57;
					["SelectionPointLasso"] = 57;
					["SelectionSphere"] = 54;
					["ServerScriptService"] = 0;
					["ServerStorage"] = 74;
					["Shirt"] = 43;
					["ShirtGraphic"] = 40;
					["SkateboardPlatform"] = 35;
					["Sky"] = 28;
					["SlidingBallConstraint"] = 89;
					["Smoke"] = 59;
					["Snap"] = 34;
					["Sound"] = 11;
					["SoundService"] = 31;
					["Sparkles"] = 42;
					["SpawnLocation"] = 25;
					["SpecialMesh"] = 8;
					["SphereHandleAdornment"] = 54;
					["SpotLight"] = 13;
					["SpringConstraint"] = 89;
					["StarterCharacterScripts"] = 82;
					["StarterGear"] = 20;
					["StarterGui"] = 46;
					["StarterPack"] = 20;
					["StarterPlayer"] = 88;
					["StarterPlayerScripts"] = 82;
					["Status"] = 2;
					["StringValue"] = 4;
					["SunRaysEffect"] = 90;
					["SurfaceGui"] = 64;
					["SurfaceLight"] = 13;
					["SurfaceSelection"] = 55;
					["Team"] = 24;
					["Teams"] = 23;
					["TeleportService"] = 81;
					["Terrain"] = 65;
					["TerrainRegion"] = 65;
					["TestService"] = 68;
					["TextBox"] = 51;
					["TextButton"] = 51;
					["TextLabel"] = 50;
					["Texture"] = 10;
					["TextureTrail"] = 4;
					["Tool"] = 17;
					["TouchTransmitter"] = 37;
					["TrussPart"] = 1;
					["UnionOperation"] = 77;
					["UserInputService"] = 84;
					["Vector3Value"] = 4;
					["VehicleSeat"] = 35;
					["VelocityMotor"] = 34;
					["WedgePart"] = 1;
					["Weld"] = 34;
					["Workspace"] = 19;

				}
			},
			Vanilla3 = {
				MapId = (114851699900089),
				IconSize = 32,
				Witdh = 25,
				Height = 25,
				Icons = {
					Accessory = 1,
					Accoutrement = 2,
					Actor = 3,
					AdGui = 4,
					AdPortal = 5,
					AdService = 6,
					AdvancedDragger = 7,
					AirController = 8,
					AlignOrientation = 9,
					AlignPosition = 10,
					AnalysticsService = 11,
					AnalysticsSettings = 12,
					AnalyticsService = 13,
					AngularVelocity = 14,
					Animation = 15,
					AnimationClip = 16,
					AnimationClipProvider = 17,
					AnimationController = 18,
					AnimationFromVideoCreatorService = 19,
					AnimationFromVideoCreatorStudioService = 20,
					AnimationRigData = 21,
					AnimationStreamTrack = 22,
					AnimationTrack = 23,
					Animator = 24,
					AppStorageService = 25,
					AppUpdateService = 26,
					ArcHandles = 27,
					AssetCounterService = 28,
					AssetDeliveryProxy = 29,
					AssetImportService = 30,
					AssetImportSession = 31,
					AssetManagerService = 32,
					AssetService = 33,
					AssetSoundEffect = 34,
					Atmosphere = 35,
					Attachment = 36,
					AvatarEditorService = 37,
					AvatarImportService = 38,
					Backpack = 39,
					BackpackItem = 40,
					BadgeService = 41,
					BallSocketConstraint = 42,
					BasePart = 43,
					BasePlayerGui = 44,
					BaseScript = 45,
					BaseWrap = 46,
					Beam = 47,
					BevelMesh = 48,
					BillboardGui = 49,
					BinaryStringValue = 50,
					BindableEvent = 51,
					BindableFunction = 52,
					BlockMesh = 53,
					BloomEffect = 54,
					BlurEffect = 55,
					BodyAngularVelocity = 56,
					BodyColors = 57,
					BodyForce = 58,
					BodyGyro = 59,
					BodyMover = 60,
					BodyPosition = 61,
					BodyThrust = 62,
					BodyVelocity = 63,
					Bone = 64,
					BoolValue = 65,
					BoxHandleAdornment = 66,
					Breakpoint = 67,
					BreakpointManager = 68,
					BrickColorValue = 69,
					BrowserService = 70,
					BubbleChatConfiguration = 71,
					BulkImportService = 72,
					CacheableContentProvider = 73,
					CalloutService = 74,
					Camera = 75,
					CanvasGroup = 76,
					CatalogPages = 77,
					CFrameValue = 78,
					ChangeHistoryService = 79,
					ChannelSelectorSoundEffect = 80,
					CharacterAppearance = 81,
					CharacterMesh = 82,
					Chat = 83,
					ChatInputBarConfiguration = 84,
					ChatWindowConfiguration = 85,
					ChorusSoundEffect = 86,
					ClickDetector = 87,
					ClientReplicator = 88,
					ClimbController = 89,
					Clothing = 90,
					Clouds = 91,
					ClusterPacketCache = 92,
					CollectionService = 93,
					Color3Value = 94,
					ColorCorrectionEffect = 95,
					CommandInstance = 96,
					CommandService = 97,
					CompressorSoundEffect = 98,
					ConeHandleAdornment = 99,
					Configuration = 100,
					ConfigureServerService = 101,
					Constraint = 102,
					ContentProvider = 103,
					ContextActionService = 104,
					Controller = 105,
					ControllerBase = 106,
					ControllerManager = 107,
					ControllerService = 108,
					CookiesService = 109,
					CoreGui = 110,
					CorePackages = 111,
					CoreScript = 112,
					CoreScriptSyncService = 113,
					CornerWedgePart = 114,
					CrossDMScriptChangeListener = 115,
					CSGDictionaryService = 116,
					CurveAnimation = 117,
					CustomEvent = 118,
					CustomEventReceiver = 119,
					CustomSoundEffect = 120,
					CylinderHandleAdornment = 121,
					CylinderMesh = 122,
					CylindricalConstraint = 123,
					DataModel = 124,
					DataModelMesh = 125,
					DataModelPatchService = 126,
					DataModelSession = 127,
					DataStore = 128,
					DataStoreIncrementOptions = 129,
					DataStoreInfo = 130,
					DataStoreKey = 131,
					DataStoreKeyInfo = 132,
					DataStoreKeyPages = 133,
					DataStoreListingPages = 134,
					DataStoreObjectVersionInfo = 135,
					DataStoreOptions = 136,
					DataStorePages = 137,
					DataStoreService = 138,
					DataStoreSetOptions = 139,
					DataStoreVersionPages = 140,
					Debris = 141,
					DebuggablePluginWatcher = 142,
					DebuggerBreakpoint = 143,
					DebuggerConnection = 144,
					DebuggerConnectionManager = 145,
					DebuggerLuaResponse = 146,
					DebuggerManager = 147,
					DebuggerUIService = 148,
					DebuggerVariable = 149,
					DebuggerWatch = 150,
					DebugSettings = 151,
					Decal = 152,
					DepthOfFieldEffect = 153,
					DeviceIdService = 154,
					Dialog = 155,
					DialogChoice = 156,
					DistortionSoundEffect = 157,
					DockWidgetPluginGui = 158,
					DoubleConstrainedValue = 159,
					DraftsService = 160,
					Dragger = 161,
					DraggerService = 162,
					DynamicRotate = 163,
					EchoSoundEffect = 164,
					EmotesPages = 165,
					EqualizerSoundEffect = 166,
					EulerRotationCurve = 167,
					EventIngestService = 168,
					Explosion = 169,
					FaceAnimatorService = 170,
					FaceControls = 171,
					FaceInstance = 172,
					FacialAnimationRecordingService = 173,
					FacialAnimationStreamingService = 174,
					Feature = 175,
					File = 176,
					FileMesh = 177,
					Fire = 178,
					Flag = 179,
					FlagStand = 180,
					FlagStandService = 181,
					FlangeSoundEffect = 182,
					FloatCurve = 183,
					FloorWire = 184,
					FlyweightService = 185,
					Folder = 186,
					ForceField = 187,
					FormFactorPart = 188,
					Frame = 189,
					FriendPages = 190,
					FriendService = 191,
					FunctionalTest = 192,
					GamepadService = 193,
					GamePassService = 194,
					GameSettings = 195,
					GenericSettings = 196,
					Geometry = 197,
					GetTextBoundsParams = 198,
					GlobalDataStore = 199,
					GlobalSettings = 200,
					Glue = 201,
					GoogleAnalyticsConfiguration = 202,
					GroundController = 203,
					GroupService = 204,
					GuiBase = 205,
					GuiBase2d = 206,
					GuiBase3d = 207,
					GuiButton = 208,
					GuidRegistryService = 209,
					GuiLabel = 210,
					GuiMain = 211,
					GuiObject = 212,
					GuiService = 213,
					HandleAdornment = 214,
					Handles = 215,
					HandlesBase = 216,
					HapticService = 217,
					Hat = 218,
					HeightmapImporterService = 219,
					HiddenSurfaceRemovalAsset = 220,
					Highlight = 221,
					HingeConstraint = 222,
					Hint = 223,
					Hole = 224,
					Hopper = 225,
					HopperBin = 226,
					HSRDataContentProvider = 227,
					HttpRbxApiService = 228,
					HttpRequest = 229,
					HttpService = 230,
					Humanoid = 231,
					HumanoidController = 232,
					HumanoidDescription = 233,
					IKControl = 234,
					ILegacyStudioBridge = 235,
					ImageButton = 236,
					ImageHandleAdornment = 237,
					ImageLabel = 238,
					ImporterAnimationSettings = 239,
					ImporterBaseSettings = 240,
					ImporterFacsSettings = 241,
					ImporterGroupSettings = 242,
					ImporterJointSettings = 243,
					ImporterMaterialSettings = 244,
					ImporterMeshSettings = 245,
					ImporterRootSettings = 246,
					IncrementalPatchBuilder = 247,
					InputObject = 248,
					InsertService = 249,
					Instance = 250,
					InstanceAdornment = 251,
					IntConstrainedValue = 252,
					IntValue = 253,
					InventoryPages = 254,
					IXPService = 255,
					JointInstance = 256,
					JointsService = 257,
					KeyboardService = 258,
					Keyframe = 259,
					KeyframeMarker = 260,
					KeyframeSequence = 261,
					KeyframeSequenceProvider = 262,
					LanguageService = 263,
					LayerCollector = 264,
					LegacyStudioBridge = 265,
					Light = 266,
					Lighting = 267,
					LinearVelocity = 268,
					LineForce = 269,
					LineHandleAdornment = 270,
					LocalDebuggerConnection = 271,
					LocalizationService = 272,
					LocalizationTable = 273,
					LocalScript = 274,
					LocalStorageService = 275,
					LodDataEntity = 276,
					LodDataService = 277,
					LoginService = 278,
					LogService = 279,
					LSPFileSyncService = 280,
					LuaSettings = 281,
					LuaSourceContainer = 282,
					LuauScriptAnalyzerService = 283,
					LuaWebService = 284,
					ManualGlue = 285,
					ManualSurfaceJointInstance = 286,
					ManualWeld = 287,
					MarkerCurve = 288,
					MarketplaceService = 289,
					MaterialService = 290,
					MaterialVariant = 291,
					MemoryStoreQueue = 292,
					MemoryStoreService = 293,
					MemoryStoreSortedMap = 294,
					MemStorageConnection = 295,
					MemStorageService = 296,
					MeshContentProvider = 297,
					MeshPart = 298,
					Message = 299,
					MessageBusConnection = 300,
					MessageBusService = 301,
					MessagingService = 302,
					MetaBreakpoint = 303,
					MetaBreakpointContext = 304,
					MetaBreakpointManager = 305,
					Model = 306,
					ModuleScript = 307,
					Motor = 308,
					Motor6D = 309,
					MotorFeature = 310,
					Mouse = 311,
					MouseService = 312,
					MultipleDocumentInterfaceInstance = 313,
					NegateOperation = 314,
					NetworkClient = 315,
					NetworkMarker = 316,
					NetworkPeer = 317,
					NetworkReplicator = 318,
					NetworkServer = 319,
					NetworkSettings = 320,
					NoCollisionConstraint = 321,
					NonReplicatedCSGDictionaryService = 322,
					NotificationService = 323,
					NumberPose = 324,
					NumberValue = 325,
					ObjectValue = 326,
					OrderedDataStore = 327,
					OutfitPages = 328,
					PackageLink = 329,
					PackageService = 330,
					PackageUIService = 331,
					Pages = 332,
					Pants = 333,
					ParabolaAdornment = 334,
					Part = 335,
					PartAdornment = 336,
					ParticleEmitter = 337,
					PartOperation = 338,
					PartOperationAsset = 339,
					PatchMapping = 340,
					Path = 341,
					PathfindingLink = 342,
					PathfindingModifier = 343,
					PathfindingService = 344,
					PausedState = 345,
					PausedStateBreakpoint = 346,
					PausedStateException = 347,
					PermissionsService = 348,
					PhysicsService = 349,
					PhysicsSettings = 350,
					PitchShiftSoundEffect = 351,
					Plane = 352,
					PlaneConstraint = 353,
					Platform = 354,
					Player = 355,
					PlayerEmulatorService = 356,
					PlayerGui = 357,
					PlayerMouse = 358,
					Players = 359,
					PlayerScripts = 360,
					Plugin = 361,
					PluginAction = 362,
					PluginDebugService = 363,
					PluginDragEvent = 364,
					PluginGui = 365,
					PluginGuiService = 366,
					PluginManagementService = 367,
					PluginManager = 368,
					PluginManagerInterface = 369,
					PluginMenu = 370,
					PluginMouse = 371,
					PluginPolicyService = 372,
					PluginToolbar = 373,
					PluginToolbarButton = 374,
					PointLight = 375,
					PointsService = 376,
					PolicyService = 377,
					Pose = 378,
					PoseBase = 379,
					PostEffect = 380,
					PrismaticConstraint = 381,
					ProcessInstancePhysicsService = 382,
					ProximityPrompt = 383,
					ProximityPromptService = 384,
					PublishService = 385,
					PVAdornment = 386,
					PVInstance = 387,
					QWidgetPluginGui = 388,
					RayValue = 389,
					RbxAnalyticsService = 390,
					ReflectionMetadata = 391,
					ReflectionMetadataCallbacks = 392,
					ReflectionMetadataClass = 393,
					ReflectionMetadataClasses = 394,
					ReflectionMetadataEnum = 395,
					ReflectionMetadataEnumItem = 396,
					ReflectionMetadataEnums = 397,
					ReflectionMetadataEvents = 398,
					ReflectionMetadataFunctions = 399,
					ReflectionMetadataItem = 400,
					ReflectionMetadataMember = 401,
					ReflectionMetadataProperties = 402,
					ReflectionMetadataYieldFunctions = 403,
					RemoteDebuggerServer = 404,
					RemoteEvent = 405,
					RemoteFunction = 406,
					RenderingTest = 407,
					RenderSettings = 408,
					ReplicatedFirst = 409,
					ReplicatedStorage = 410,
					ReverbSoundEffect = 411,
					RigidConstraint = 412,
					RobloxPluginGuiService = 413,
					RobloxReplicatedStorage = 414,
					RocketPropulsion = 415,
					RodConstraint = 416,
					RopeConstraint = 417,
					Rotate = 418,
					RotateP = 419,
					RotateV = 420,
					RotationCurve = 421,
					RtMessagingService = 422,
					RunningAverageItemDouble = 423,
					RunningAverageItemInt = 424,
					RunningAverageTimeIntervalItem = 425,
					RunService = 426,
					RuntimeScriptService = 427,
					ScreenGui = 428,
					ScreenshotHud = 429,
					Script = 430,
					ScriptChangeService = 431,
					ScriptCloneWatcher = 432,
					ScriptCloneWatcherHelper = 433,
					ScriptContext = 434,
					ScriptDebugger = 435,
					ScriptDocument = 436,
					ScriptEditorService = 437,
					ScriptRegistrationService = 438,
					ScriptService = 439,
					ScrollingFrame = 440,
					Seat = 441,
					Selection = 442,
					SelectionBox = 443,
					SelectionLasso = 444,
					SelectionPartLasso = 445,
					SelectionPointLasso = 446,
					SelectionSphere = 447,
					ServerReplicator = 448,
					ServerScriptService = 449,
					ServerStorage = 450,
					ServiceProvider = 451,
					SessionService = 452,
					Shirt = 453,
					ShirtGraphic = 454,
					SkateboardController = 455,
					SkateboardPlatform = 456,
					Skin = 457,
					Sky = 458,
					SlidingBallConstraint = 459,
					Smoke = 460,
					Snap = 461,
					SnippetService = 462,
					SocialService = 463,
					SolidModelContentProvider = 464,
					Sound = 465,
					SoundEffect = 466,
					SoundGroup = 467,
					SoundService = 468,
					Sparkles = 469,
					SpawnerService = 470,
					SpawnLocation = 471,
					Speaker = 472,
					SpecialMesh = 473,
					SphereHandleAdornment = 474,
					SpotLight = 475,
					SpringConstraint = 476,
					StackFrame = 477,
					StandalonePluginScripts = 478,
					StandardPages = 479,
					StarterCharacterScripts = 480,
					StarterGear = 481,
					StarterGui = 482,
					StarterPack = 483,
					StarterPlayer = 484,
					StarterPlayerScripts = 485,
					Stats = 486,
					StatsItem = 487,
					Status = 488,
					StopWatchReporter = 489,
					StringValue = 490,
					Studio = 491,
					StudioAssetService = 492,
					StudioData = 493,
					StudioDeviceEmulatorService = 494,
					StudioHighDpiService = 495,
					StudioPublishService = 496,
					StudioScriptDebugEventListener = 497,
					StudioService = 498,
					StudioTheme = 499,
					SunRaysEffect = 500,
					SurfaceAppearance = 501,
					SurfaceGui = 502,
					SurfaceGuiBase = 503,
					SurfaceLight = 504,
					SurfaceSelection = 505,
					SwimController = 506,
					TaskScheduler = 507,
					Team = 508,
					TeamCreateService = 509,
					Teams = 510,
					TeleportAsyncResult = 511,
					TeleportOptions = 512,
					TeleportService = 513,
					TemporaryCageMeshProvider = 514,
					TemporaryScriptService = 515,
					Terrain = 516,
					TerrainDetail = 517,
					TerrainRegion = 518,
					TestService = 519,
					TextBox = 520,
					TextBoxService = 521,
					TextButton = 522,
					TextChannel = 523,
					TextChatCommand = 524,
					TextChatConfigurations = 525,
					TextChatMessage = 526,
					TextChatMessageProperties = 527,
					TextChatService = 528,
					TextFilterResult = 529,
					TextLabel = 530,
					TextService = 531,
					TextSource = 532,
					Texture = 533,
					ThirdPartyUserService = 534,
					ThreadState = 535,
					TimerService = 536,
					ToastNotificationService = 537,
					Tool = 538,
					ToolboxService = 539,
					Torque = 540,
					TorsionSpringConstraint = 541,
					TotalCountTimeIntervalItem = 542,
					TouchInputService = 543,
					TouchTransmitter = 544,
					TracerService = 545,
					TrackerStreamAnimation = 546,
					Trail = 547,
					Translator = 548,
					TremoloSoundEffect = 549,
					TriangleMeshPart = 550,
					TrussPart = 551,
					Tween = 552,
					TweenBase = 553,
					TweenService = 554,
					UGCValidationService = 555,
					UIAspectRatioConstraint = 556,
					UIBase = 557,
					UIComponent = 558,
					UIConstraint = 559,
					UICorner = 560,
					UIGradient = 561,
					UIGridLayout = 562,
					UIGridStyleLayout = 563,
					UILayout = 564,
					UIListLayout = 565,
					UIPadding = 566,
					UIPageLayout = 567,
					UIScale = 568,
					UISizeConstraint = 569,
					UIStroke = 570,
					UITableLayout = 571,
					UITextSizeConstraint = 572,
					UnionOperation = 573,
					UniversalConstraint = 574,
					UnvalidatedAssetService = 575,
					UserGameSettings = 576,
					UserInputService = 577,
					UserService = 578,
					UserSettings = 579,
					UserStorageService = 580,
					ValueBase = 581,
					Vector3Curve = 582,
					Vector3Value = 583,
					VectorForce = 584,
					VehicleController = 585,
					VehicleSeat = 586,
					VelocityMotor = 587,
					VersionControlService = 588,
					VideoCaptureService = 589,
					VideoFrame = 590,
					ViewportFrame = 591,
					VirtualInputManager = 592,
					VirtualUser = 593,
					VisibilityService = 594,
					Visit = 595,
					VoiceChannel = 596,
					VoiceChatInternal = 597,
					VoiceChatService = 598,
					VoiceSource = 599,
					VRService = 600,
					WedgePart = 601,
					Weld = 602,
					WeldConstraint = 603,
					WireframeHandleAdornment = 604,
					Workspace = 605,
					WorldModel = 606,
					WorldRoot = 607,
					WrapLayer = 608,
					WrapTarget = 609,

				}
			},
			NewDark = {
				MapId = 135148380892747,
				Icons = {
					Accessory = 1,
					Actor = 2,
					AdGui = 3,
					AdPortal = 4,
					AirController = 5,
					AlignOrientation = 6,
					AlignPosition = 7,
					AngularVelocity = 8,
					Animation = 9,
					AnimationConstraint = 10,
					AnimationController = 11,
					AnimationFromVideoCreatorService = 12,
					Animator = 13,
					ArcHandles = 14,
					Atmosphere = 15,
					Attachment = 16,
					AudioAnalyzer = 17,
					AudioChannelMixer = 18,
					AudioChannelSplitter = 19,
					AudioChorus = 20,
					AudioCompressor = 21,
					AudioDeviceInput = 22,
					AudioDeviceOutput = 23,
					AudioDistortion = 24,
					AudioEcho = 25,
					AudioEmitter = 26,
					AudioEqualizer = 27,
					AudioFader = 28,
					AudioFilter = 29,
					AudioFlanger = 30,
					AudioGate = 31,
					AudioLimiter = 32,
					AudioListener = 33,
					AudioPitchShifter = 34,
					AudioPlayer = 35,
					AudioRecorder = 36,
					AudioReverb = 37,
					AudioTextToSpeech = 38,
					AuroraScript = 39,
					AvatarEditorService = 40,
					AvatarSettings = 41,
					Backpack = 42,
					BallSocketConstraint = 43,
					BasePlate = 44,
					Beam = 45,
					BillboardGui = 46,
					BindableEvent = 47,
					BindableFunction = 48,
					BlockMesh = 49,
					BloomEffect = 50,
					BlurEffect = 51,
					BodyAngularVelocity = 52,
					BodyColors = 53,
					BodyForce = 54,
					BodyGyro = 55,
					BodyPosition = 56,
					BodyThrust = 57,
					BodyVelocity = 58,
					Bone = 59,
					BoolValue = 60,
					BoxHandleAdornment = 61,
					Breakpoint = 62,
					BrickColorValue = 63,
					BubbleChatConfiguration = 64,
					Buggaroo = 65,
					Camera = 66,
					CanvasGroup = 67,
					CFrameValue = 68,
					ChannelTabsConfiguration = 69,
					CharacterControllerManager = 70,
					CharacterMesh = 71,
					Chat = 72,
					ChatInputBarConfiguration = 73,
					ChatWindowConfiguration = 74,
					ChorusSoundEffect = 75,
					Class = 76,
					Cleanup = 77,
					ClickDetector = 78,
					ClientReplicator = 79,
					ClimbController = 80,
					Clouds = 81,
					Color = 82,
					ColorCorrectionEffect = 83,
					CompressorSoundEffect = 84,
					ConeHandleAdornment = 85,
					Configuration = 86,
					Constant = 87,
					Constructor = 88,
					Controller = 89,
					CoreGui = 90,
					CornerWedgePart = 91,
					CylinderHandleAdornment = 92,
					CylindricalConstraint = 93,
					Decal = 94,
					DepthOfFieldEffect = 95,
					Dialog = 96,
					DialogChoice = 97,
					DistortionSoundEffect = 98,
					DragDetector = 99,
					EchoSoundEffect = 100,
					EditableImage = 101,
					EditableMesh = 102,
					Enum = 103,
					EnumMember = 104,
					EqualizerSoundEffect = 105,
					Event = 106,
					Explosion = 107,
					FaceControls = 108,
					Field = 109,
					File = 110,
					Fire = 111,
					FlangeSoundEffect = 112,
					Folder = 113,
					ForceField = 114,
					Frame = 115,
					Function = 116,
					GameSettings = 117,
					GroundController = 118,
					Handles = 119,
					HapticEffect = 120,
					HapticService = 121,
					HeightmapImporterService = 122,
					Highlight = 123,
					HingeConstraint = 124,
					Humanoid = 125,
					HumanoidDescription = 126,
					IKControl = 127,
					ImageButton = 128,
					ImageHandleAdornment = 129,
					ImageLabel = 130,
					InputAction = 131,
					InputBinding = 132,
					InputContext = 133,
					Interface = 134,
					IntersectOperation = 135,
					Keyword = 136,
					Lighting = 137,
					LinearVelocity = 138,
					LineForce = 139,
					LineHandleAdornment = 140,
					LocalFile = 141,
					LocalizationService = 142,
					LocalizationTable = 143,
					LocalScript = 144,
					MaterialService = 145,
					MaterialVariant = 146,
					MemoryStoreService = 147,
					MeshPart = 148,
					Meshparts = 149,
					MessagingService = 150,
					Method = 151,
					Model = 152,
					Modelgroups = 153,
					Module = 154,
					ModuleScript = 155,
					Motor6D = 156,
					NegateOperation = 157,
					NetworkClient = 158,
					NoCollisionConstraint = 159,
					Operator = 160,
					PackageLink = 161,
					Pants = 162,
					Part = 163,
					ParticleEmitter = 164,
					Path2D = 165,
					PathfindingLink = 166,
					PathfindingModifier = 167,
					PathfindingService = 168,
					PitchShiftSoundEffect = 169,
					Place = 170,
					Placeholder = 171,
					Plane = 172,
					PlaneConstraint = 173,
					Player = 174,
					Players = 175,
					PluginGuiService = 176,
					PointLight = 177,
					PrismaticConstraint = 178,
					Property = 179,
					ProximityPrompt = 180,
					PublishService = 181,
					Reference = 182,
					RemoteEvent = 183,
					RemoteFunction = 184,
					RenderingTest = 185,
					ReplicatedFirst = 186,
					ReplicatedScriptService = 187,
					ReplicatedStorage = 188,
					ReverbSoundEffect = 189,
					RigidConstraint = 190,
					RobloxPluginGuiService = 191,
					RocketPropulsion = 192,
					RodConstraint = 193,
					RopeConstraint = 194,
					Rotate = 195,
					ScreenGui = 196,
					Script = 197,
					ScrollingFrame = 198,
					Seat = 199,
					Selected_Workspace = 200,
					SelectionBox = 201,
					SelectionSphere = 202,
					ServerScriptService = 203,
					ServerStorage = 204,
					Service = 205,
					Shirt = 206,
					ShirtGraphic = 207,
					SkinnedMeshPart = 208,
					Sky = 209,
					Smoke = 210,
					Snap = 211,
					Snippet = 212,
					SocialService = 213,
					Sound = 214,
					SoundEffect = 215,
					SoundGroup = 216,
					SoundService = 217,
					Sparkles = 218,
					SpawnLocation = 219,
					SpecialMesh = 220,
					SphereHandleAdornment = 221,
					SpotLight = 222,
					SpringConstraint = 223,
					StandalonePluginScripts = 224,
					StarterCharacterScripts = 225,
					StarterGui = 226,
					StarterPack = 227,
					StarterPlayer = 228,
					StarterPlayerScripts = 229,
					Struct = 230,
					StyleDerive = 231,
					StyleLink = 232,
					StyleRule = 233,
					StyleSheet = 234,
					SunRaysEffect = 235,
					SurfaceAppearance = 236,
					SurfaceGui = 237,
					SurfaceLight = 238,
					SurfaceSelection = 239,
					SwimController = 240,
					TaskScheduler = 241,
					Team = 242,
					Teams = 243,
					Terrain = 244,
					TerrainDetail = 245,
					TestService = 246,
					TextBox = 247,
					TextBoxService = 248,
					TextButton = 249,
					TextChannel = 250,
					TextChatCommand = 251,
					TextChatService = 252,
					TextLabel = 253,
					TextString = 254,
					Texture = 255,
					Tool = 256,
					Torque = 257,
					TorsionSpringConstraint = 258,
					Trail = 259,
					TremoloSoundEffect = 260,
					TrussPart = 261,
					TypeParameter = 262,
					UGCValidationService = 263,
					UIAspectRatioConstraint = 264,
					UICorner = 265,
					UIDragDetector = 266,
					UIFlexItem = 267,
					UIGradient = 268,
					UIGridLayout = 269,
					UIListLayout = 270,
					UIPadding = 271,
					UIPageLayout = 272,
					UIScale = 273,
					UISizeConstraint = 274,
					UIStroke = 275,
					UITableLayout = 276,
					UITextSizeConstraint = 277,
					UnionOperation = 278,
					Unit = 279,
					UniversalConstraint = 280,
					UnreliableRemoteEvent = 281,
					UpdateAvailable = 282,
					UserService = 283,
					Value = 284,
					Variable = 285,
					VectorForce = 286,
					VehicleSeat = 287,
					VideoDisplay = 288,
					VideoFrame = 289,
					VideoPlayer = 290,
					ViewportFrame = 291,
					VirtualUser = 292,
					VoiceChannel = 293,
					Voicechat = 294,
					VoiceChatService = 295,
					VRService = 296,
					WedgePart = 297,
					Weld = 298,
					WeldConstraint = 299,
					Wire = 300,
					WireframeHandleAdornment = 301,
					Workspace = 302,
					WorldModel = 303,
					WrapDeformer = 304,
					WrapLayer = 305,
					WrapTarget = 306,
					
					Color3Value = 284,
					IntValue = 284,
					NumberValue = 284,
					ObjectValue = 284,
					RayValue = 284,
					StringValue = 284,
					Vector3Value = 284,
				},
				IconSize = 32,
				Witdh = 18,
				Height = 18,
			},
			NewLight = {
				MapId = "",
				Icons = {
					Class = "rbxasset://studio_svg_textures/Shared/InsertableObjects/Light/Standard/",
				},
				IconSize = 16,
				Witdh = 18,
				Height = 18,
			}
		}
		if Settings.ClassIcon and IconList[Settings.ClassIcon] then
			funcs.ExplorerIcons = {
				["MapId"] = IconList[Settings.ClassIcon].MapId,
				["Icons"] = IconList[Settings.ClassIcon].Icons,
				["IconSize"] = IconList[Settings.ClassIcon].IconSize,
				["Witdh"] = IconList[Settings.ClassIcon].Witdh,
				["Height"] = IconList[Settings.ClassIcon].Height}
		else
			funcs.ExplorerIcons = { ["MapId"] = IconList.Old.MapId, ["Icons"] = IconList.Old.Icons, ["IconSize"] = IconList.Old.IconSize }
		end
		
		

		funcs.GetLabel = function(self)
			local label = Instance.new("ImageLabel")
			self:SetupLabel(label)
			return label
		end

		funcs.SetupLabel = function(self,obj)
			obj.BackgroundTransparency = 1
			obj.ImageRectOffset = Vector2.new(0, 0)
			obj.ImageRectSize = Vector2.new(self.IconSizeX, self.IconSizeY)
			obj.ScaleType = Enum.ScaleType.Crop
			obj.Size = UDim2.new(0, self.IconSizeX, 0, self.IconSizeY)
		end

		funcs.Display = function(self,obj,index)
			obj.Image = self.MapId
			obj.ImageRectSize = Vector2.new(self.IconSizeX, self.IconSizeY)
			if not self.NumX then
				obj.ImageRectOffset = Vector2.new(self.IconSizeX*index, 0)
			else
				obj.ImageRectOffset = Vector2.new(self.IconSizeX*(index % self.NumX), self.IconSizeY*math.floor(index / self.NumX))
			end
		end

		funcs.DisplayByKey = function(self, obj, key)
			if self.IndexDict[key] then
				self:Display(obj, self.IndexDict[key])
			else
				local rmdEntry = RMD.Classes[obj.ClassName]
				Explorer.ClassIcons:Display(obj, rmdEntry and rmdEntry.ExplorerImageIndex or 0)
			end
		end

		funcs.IconDehash = function(self, _id)
			return math.floor(_id / 14 % 14), math.floor(_id % 14)
		end
		
		local ClassNameNoImage = {}
		funcs.GetExplorerIcon = function(self, obj, index)
			if Settings.ClassIcon == "Vanilla3" then
				obj.Size = UDim2.fromOffset(16, 16)

				index = (self.ExplorerIcons.Icons[index] or 250) - 1
				obj.ImageRectOffset = Vector2.new(funcs.ExplorerIcons.IconSize * (index % funcs.ExplorerIcons.Height), funcs.ExplorerIcons.IconSize * math.floor(index / funcs.ExplorerIcons.Height))
				obj.ImageRectSize = Vector2.new(funcs.ExplorerIcons.IconSize, funcs.ExplorerIcons.IconSize)
			elseif Settings.ClassIcon == "Old" then
				index = (self.ExplorerIcons.Icons[index] or 0)
				local row, col = self:IconDehash(index)
				local MapSize = Vector2.new(256, 256)
				local pad, border = 2, 1

				obj.Position = UDim2.new(-col - (pad * (col + 1) + border) / funcs.ExplorerIcons.IconSize, 0, -row - (pad * (row + 1) + border) / funcs.ExplorerIcons.IconSize, 0)
				obj.Size = UDim2.new(MapSize.X / funcs.ExplorerIcons.IconSize, 0, MapSize.Y / funcs.ExplorerIcons.IconSize, 0)
			elseif Settings.ClassIcon == "NewLight" or Settings.ClassIcon == "NewDark" then
				local isService = string.find(index, "Service") and game:GetService(index)
				
				obj.Size = UDim2.fromOffset(16, 16)
				index = (self.ExplorerIcons.Icons[index] or (isService and self.ExplorerIcons.Icons.Service) or self.ExplorerIcons.Icons.Placeholder) - 1
				obj.ImageRectOffset = Vector2.new(funcs.ExplorerIcons.IconSize * (index % funcs.ExplorerIcons.Height), funcs.ExplorerIcons.IconSize * math.floor(index / funcs.ExplorerIcons.Height))
				obj.ImageRectSize = Vector2.new(funcs.ExplorerIcons.IconSize, funcs.ExplorerIcons.IconSize)
			else
				index = (self.ExplorerIcons.Icons[index] or 0)
				local row, col = self:IconDehash(index)
				local MapSize = Vector2.new(256, 256)
				local pad, border = 2, 1

				obj.Position = UDim2.new(-col - (pad * (col + 1) + border) / funcs.ExplorerIcons.IconSize, 0, -row - (pad * (row + 1) + border) / funcs.ExplorerIcons.IconSize, 0)
				obj.Size = UDim2.new(MapSize.X / funcs.ExplorerIcons.IconSize, 0, MapSize.Y / funcs.ExplorerIcons.IconSize, 0)
			end
			
		end

		funcs.DisplayExplorerIcons = function(self, Frame, index)
			if Frame:FindFirstChild("IconMap") then
				self:GetExplorerIcon(Frame.IconMap, index)
			else
				Frame.ClipsDescendants = true

				local obj = Instance.new("ImageLabel", Frame)
				obj.BackgroundTransparency = 1
				obj.Image = ("http://www.roblox.com/asset/?id=" .. (self.ExplorerIcons.MapId))
				obj.Name = "IconMap"
				self:GetExplorerIcon(obj, index)
			end
		end

		funcs.SetDict = function(self,dict)
			self.IndexDict = dict
		end

		local mt = {}
		mt.__index = funcs

		local function new(mapId,mapSizeX,mapSizeY,iconSizeX,iconSizeY)
			local obj = setmetatable({
				MapId = mapId,
				MapSizeX = mapSizeX,
				MapSizeY = mapSizeY,
				IconSizeX = iconSizeX,
				IconSizeY = iconSizeY,
				NumX = mapSizeX/iconSizeX,
				IndexDict = {}
			}, mt)
			return obj
		end

		local function newLinear(mapId,iconSizeX,iconSizeY)
			local obj = setmetatable({
				MapId = mapId,
				IconSizeX = iconSizeX,
				IconSizeY = iconSizeY,
				IndexDict = {}
			},mt)
			return obj
		end
		
		local function getIconDataFromName(name)
			return IconList[name] or error("Name not found")
		end

		return {new = new, newLinear = newLinear, getIconDataFromName = getIconDataFromName}
	end)()

	Lib.ScrollBar = (function()
		local funcs = {}
		local user = service.UserInputService
		local mouse = plr:GetMouse()
		local checkMouseInGui = Lib.CheckMouseInGui
		local createArrow = Lib.CreateArrow

		local function drawThumb(self)
			local total = self.TotalSpace
			local visible = self.VisibleSpace
			local index = self.Index
			local scrollThumb = self.GuiElems.ScrollThumb
			local scrollThumbFrame = self.GuiElems.ScrollThumbFrame

			if not (self:CanScrollUp()	or self:CanScrollDown()) then
				scrollThumb.Visible = false
			else
				scrollThumb.Visible = true
			end

			if self.Horizontal then
				scrollThumb.Size = UDim2.new(visible/total,0,1,0)
				if scrollThumb.AbsoluteSize.X < 16 then
					scrollThumb.Size = UDim2.new(0,16,1,0)
				end
				local fs = scrollThumbFrame.AbsoluteSize.X
				local bs = scrollThumb.AbsoluteSize.X
				scrollThumb.Position = UDim2.new(self:GetScrollPercent()*(fs-bs)/fs,0,0,0)
			else
				scrollThumb.Size = UDim2.new(1,0,visible/total,0)
				if scrollThumb.AbsoluteSize.Y < 16 then
					scrollThumb.Size = UDim2.new(1,0,0,16)
				end
				local fs = scrollThumbFrame.AbsoluteSize.Y
				local bs = scrollThumb.AbsoluteSize.Y
				scrollThumb.Position = UDim2.new(0,0,self:GetScrollPercent()*(fs-bs)/fs,0)
			end
		end

		local function createFrame(self)
			local newFrame = createSimple("Frame",{Style=0,Active=true,AnchorPoint=Vector2.new(0,0),BackgroundColor3=Color3.new(0.35294118523598,0.35294118523598,0.35294118523598),BackgroundTransparency=0,BorderColor3=Color3.new(0.10588236153126,0.16470588743687,0.20784315466881),BorderSizePixel=0,ClipsDescendants=false,Draggable=false,Position=UDim2.new(1,-16,0,0),Rotation=0,Selectable=false,Size=UDim2.new(0,16,1,0),SizeConstraint=0,Visible=true,ZIndex=1,Name="ScrollBar",})
			local button1, button2

			if self.Horizontal then
				newFrame.Size = UDim2.new(1,0,0,16)
				button1 = createSimple("ImageButton",{
					Parent = newFrame,
					Name = "Left",
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false
				})
				createArrow(16,4,"left").Parent = button1
				button2 = createSimple("ImageButton",{
					Parent = newFrame,
					Name = "Right",
					Position = UDim2.new(1,-16,0,0),
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false
				})
				createArrow(16,4,"right").Parent = button2
			else
				newFrame.Size = UDim2.new(0,16,1,0)
				button1 = createSimple("ImageButton",{
					Parent = newFrame,
					Name = "Up",
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false
				})
				createArrow(16,4,"up").Parent = button1
				button2 = createSimple("ImageButton",{
					Parent = newFrame,
					Name = "Down",
					Position = UDim2.new(0,0,1,-16),
					Size = UDim2.new(0,16,0,16),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AutoButtonColor = false
				})
				createArrow(16,4,"down").Parent = button2
			end

			local scrollThumbFrame = createSimple("ImageButton", {
				BackgroundTransparency = 1,
				Parent = newFrame
			})
			if self.Horizontal then
				scrollThumbFrame.Position = UDim2.new(0,16,0,0)
				scrollThumbFrame.Size = UDim2.new(1,-32,1,0)
			else
				scrollThumbFrame.Position = UDim2.new(0,0,0,16)
				scrollThumbFrame.Size = UDim2.new(1,0,1,-32)
			end

			local scrollThumb = createSimple("Frame", {
				BackgroundColor3 = Color3.new(120/255, 120/255, 120/255),
				BorderSizePixel = 0,
				Parent = scrollThumbFrame
			})

			local markerFrame = createSimple("Frame", {
				BackgroundTransparency = 1,
				Name = "Markers",
				Size = UDim2.new(1, 0, 1, 0),
				Parent = scrollThumbFrame
			})

			local buttonPress = false
			local thumbPress = false
			local thumbFramePress = false

			local function handleButtonPress(button, scrollDirection)
				if self:CanScroll(scrollDirection) then
					button.BackgroundTransparency = 0.5
					self:ScrollToDirection(scrollDirection)
					self.Scrolled:Fire()
					local buttonTick = tick()
					local releaseEvent
					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							releaseEvent:Disconnect()
							button.BackgroundTransparency = checkMouseInGui(button) and 0.8 or 1
							buttonPress = false
						end
					end)
					while buttonPress do
						if tick() - buttonTick >= 0.25 and self:CanScroll(scrollDirection) then
							self:ScrollToDirection(scrollDirection)
							self.Scrolled:Fire()
						end
						task.wait()
					end
				end
			end

			button1.MouseButton1Down:Connect(function(input)
				buttonPress = true
				handleButtonPress(button1, "Up")
			end)

			button1.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					button1.BackgroundTransparency = 1
				end
			end)

			button2.MouseButton1Down:Connect(function(input)
				buttonPress = true
				handleButtonPress(button2, "Down")
			end)

			button2.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					button2.BackgroundTransparency = 1
				end
			end)

			scrollThumb.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
					local dir = self.Horizontal and "X" or "Y"
					local lastThumbPos = nil
					thumbPress = true
					scrollThumb.BackgroundTransparency = 0
					local mouseOffset = mouse[dir] - scrollThumb.AbsolutePosition[dir]
					local releaseEvent
					local mouseEvent

					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							releaseEvent:Disconnect()
							if mouseEvent then mouseEvent:Disconnect() end
							scrollThumb.BackgroundTransparency = 0.2
							thumbPress = false
						end
					end)

					mouseEvent = user.InputChanged:Connect(function(input)
						if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and thumbPress then
							local thumbFrameSize = scrollThumbFrame.AbsoluteSize[dir] - scrollThumb.AbsoluteSize[dir]
							local pos = mouse[dir] - scrollThumbFrame.AbsolutePosition[dir] - mouseOffset
							if pos > thumbFrameSize then pos = thumbFrameSize
							elseif pos < 0 then pos = 0 end
							if lastThumbPos ~= pos then
								lastThumbPos = pos
								self:ScrollTo(math.floor(0.5 + pos / thumbFrameSize * (self.TotalSpace - self.VisibleSpace)))
							end
						end
					end)
				end
			end)

			scrollThumb.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					scrollThumb.BackgroundTransparency = 0
				end
			end)

			scrollThumbFrame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not checkMouseInGui(scrollThumb) then
					local dir = self.Horizontal and "X" or "Y"
					local scrollDir = (mouse[dir] >= scrollThumb.AbsolutePosition[dir] + scrollThumb.AbsoluteSize[dir]) and 1 or 0
					local function doTick()
						local scrollSize = self.VisibleSpace - 1
						if scrollDir == 0 and mouse[dir] < scrollThumb.AbsolutePosition[dir] then
							self:ScrollTo(self.Index - scrollSize)
						elseif scrollDir == 1 and mouse[dir] >= scrollThumb.AbsolutePosition[dir] + scrollThumb.AbsoluteSize[dir] then
							self:ScrollTo(self.Index + scrollSize)
						end
					end

					thumbPress = false
					thumbFramePress = true
					doTick()
					local thumbFrameTick = tick()
					local releaseEvent
					releaseEvent = user.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							releaseEvent:Disconnect()
							thumbFramePress = false
						end
					end)

					while thumbFramePress do
						if tick() - thumbFrameTick >= 0.3 and checkMouseInGui(scrollThumbFrame) then
							doTick()
						end
						task.wait()
					end
				end
			end)

			newFrame.MouseWheelForward:Connect(function()
				self:ScrollTo(self.Index - self.WheelIncrement)
			end)

			newFrame.MouseWheelBackward:Connect(function()
				self:ScrollTo(self.Index + self.WheelIncrement)
			end)

			self.GuiElems.ScrollThumb = scrollThumb
			self.GuiElems.ScrollThumbFrame = scrollThumbFrame
			self.GuiElems.Button1 = button1
			self.GuiElems.Button2 = button2
			self.GuiElems.MarkerFrame = markerFrame

			return newFrame
		end

		funcs.Update = function(self,nocallback)
			local total = self.TotalSpace
			local visible = self.VisibleSpace
			local index = self.Index
			local button1 = self.GuiElems.Button1
			local button2 = self.GuiElems.Button2

			self.Index = math.clamp(self.Index, 0, math.max(0, total - visible))

			if self.LastTotalSpace ~= self.TotalSpace then
				self.LastTotalSpace = self.TotalSpace
				self:UpdateMarkers()
			end

			if self:CanScrollUp() then
				for i,v in pairs(button1.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0
				end
			else
				button1.BackgroundTransparency = 1
				for i,v in pairs(button1.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0.5
				end
			end
			if self:CanScrollDown() then
				for i,v in pairs(button2.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0
				end
			else
				button2.BackgroundTransparency = 1
				for i,v in pairs(button2.Arrow:GetChildren()) do
					v.BackgroundTransparency = 0.5
				end
			end

			drawThumb(self)
		end

		funcs.UpdateMarkers = function(self)
			local markerFrame = self.GuiElems.MarkerFrame
			markerFrame:ClearAllChildren()

			for i,v in pairs(self.Markers) do
				if i < self.TotalSpace then
					createSimple("Frame", {
						BackgroundTransparency = 0,
						BackgroundColor3 = v,
						BorderSizePixel = 0,
						Position = self.Horizontal and UDim2.new(i/self.TotalSpace,0,1,-6) or UDim2.new(1,-6,i/self.TotalSpace,0),
						Size = self.Horizontal and UDim2.new(0,1,0,6) or UDim2.new(0,6,0,1),
						Name = "Marker"..tostring(i),
						Parent = markerFrame
					})
				end
			end
		end

		funcs.AddMarker = function(self,ind,color)
			self.Markers[ind] = color or Color3.new(0,0,0)
		end
		funcs.ScrollTo = function(self, ind, nocallback)
			self.Index = ind
			self:Update()
			if not nocallback then
				self.Scrolled:Fire()
			end
		end
		funcs.ScrollUp = function(self)
			self.Index = self.Index - self.Increment
			self:Update()
		end
		funcs.CanScroll = function(self, direction)
			if direction == "Up" then
				return self:CanScrollUp()
			elseif direction == "Down" then
				return self:CanScrollDown()
			end
			return false
		end
		funcs.ScrollDown = function(self)
			self.Index = self.Index + self.Increment
			self:Update()
		end
		funcs.CanScrollUp = function(self)
			return self.Index > 0
		end
		funcs.CanScrollDown = function(self)
			return self.Index + self.VisibleSpace < self.TotalSpace
		end
		funcs.GetScrollPercent = function(self)
			return self.Index/(self.TotalSpace-self.VisibleSpace)
		end
		funcs.SetScrollPercent = function(self,perc)
			self.Index = math.floor(perc*(self.TotalSpace-self.VisibleSpace))
			self:Update()
		end
		funcs.ScrollToDirection = function(self, Direaction)
			if Direaction == "Up" then
				self:ScrollUp()
			elseif Direaction == "Down" then
				self:ScrollDown()
			end
		end

		funcs.Texture = function(self,data)
			self.ThumbColor = data.ThumbColor or Color3.new(0,0,0)
			self.ThumbSelectColor = data.ThumbSelectColor or Color3.new(0,0,0)
			self.GuiElems.ScrollThumb.BackgroundColor3 = data.ThumbColor or Color3.new(0,0,0)
			self.Gui.BackgroundColor3 = data.FrameColor or Color3.new(0,0,0)
			self.GuiElems.Button1.BackgroundColor3 = data.ButtonColor or Color3.new(0,0,0)
			self.GuiElems.Button2.BackgroundColor3 = data.ButtonColor or Color3.new(0,0,0)
			for i,v in pairs(self.GuiElems.Button1.Arrow:GetChildren()) do
				v.BackgroundColor3 = data.ArrowColor or Color3.new(0,0,0)
			end
			for i,v in pairs(self.GuiElems.Button2.Arrow:GetChildren()) do
				v.BackgroundColor3 = data.ArrowColor or Color3.new(0,0,0)
			end
		end

		funcs.SetScrollFrame = function(self,frame)
			if self.ScrollUpEvent then self.ScrollUpEvent:Disconnect() self.ScrollUpEvent = nil end
			if self.ScrollDownEvent then self.ScrollDownEvent:Disconnect() self.ScrollDownEvent = nil end
			self.ScrollUpEvent = frame.MouseWheelForward:Connect(function() self:ScrollTo(self.Index - self.WheelIncrement) end)
			self.ScrollDownEvent = frame.MouseWheelBackward:Connect(function() self:ScrollTo(self.Index + self.WheelIncrement) end)
		end

		local mt = {}
		mt.__index = funcs

		local function new(hor)
			local obj = setmetatable({
				Index = 0,
				VisibleSpace = 0,
				TotalSpace = 0,
				Increment = 1,
				WheelIncrement = 1,
				Markers = {},
				GuiElems = {},
				Horizontal = hor,
				LastTotalSpace = 0,
				Scrolled = Lib.Signal.new()
			},mt)
			obj.Gui = createFrame(obj)
			obj:Texture({
				ThumbColor = Color3.fromRGB(60,60,60),
				ThumbSelectColor = Color3.fromRGB(75,75,75),
				ArrowColor = Color3.new(1,1,1),
				FrameColor = Color3.fromRGB(40,40,40),
				ButtonColor = Color3.fromRGB(75,75,75)
			})
			return obj
		end

		return {new = new}
	end)()

	Lib.Window = (function()
		local funcs = {}
		local static = {MinWidth = 200, FreeWidth = 200}
		local mouse = plr:GetMouse()
		local sidesGui,alignIndicator
		local visibleWindows = {}
		local leftSide = {Width = 300, Windows = {}, ResizeCons = {}, Hidden = true}
		local rightSide = {Width = 300, Windows = {}, ResizeCons = {}, Hidden = true}

		local displayOrderStart
		local sideDisplayOrder
		local sideTweenInfo = TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		local tweens = {}
		local isA = game.IsA

		local theme = {
			MainColor1 = Color3.fromRGB(52,52,52),
			MainColor2 = Color3.fromRGB(45,45,45),
			Button = Color3.fromRGB(60,60,60)
		}

		local function stopTweens()
			for i = 1,#tweens do
				tweens[i]:Cancel()
			end
			tweens = {}
		end

		local function resizeHook(self,resizer,dir)
			local pressing = false
			
			local guiMain = self.GuiElems.Main
			
			resizer.MouseEnter:Connect(function() resizer.BackgroundTransparency = 0.5 end)
			resizer.MouseButton1Down:Connect(function() pressing = true resizer.BackgroundTransparency = 0.5 end)
			resizer.MouseButton1Up:Connect(function() pressing = false resizer.BackgroundTransparency = 1 end)
			
			
			
			resizer.InputBegan:Connect(function(input)
				if not self.Dragging and not self.Resizing and self.Resizable and self.ResizableInternal and pressing then
					local isH = dir:find("[WE]") and true
					local isV = dir:find("[NS]") and true
					local signX = dir:find("W",1,true) and -1 or 1
					local signY = dir:find("N",1,true) and -1 or 1

					if self.Minimized and isV then return end
					
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						
						local releaseEvent, mouseEvent

						local offX = input.Position.X - resizer.AbsolutePosition.X
						local offY = input.Position.Y - resizer.AbsolutePosition.Y

						self.Resizing = resizer
						
						releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								if mouseEvent then mouseEvent:Disconnect() end
								self.Resizing = false
								resizer.BackgroundTransparency = 1
							end
						end)

						mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
							if self.Resizable and self.ResizableInternal and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
								self:StopTweens()
								local deltaX = input.Position.X - resizer.AbsolutePosition.X - offX
								local deltaY = input.Position.Y - resizer.AbsolutePosition.Y - offY

								if guiMain.AbsoluteSize.X + deltaX * signX < self.MinX then deltaX = signX * (self.MinX - guiMain.AbsoluteSize.X) end
								if guiMain.AbsoluteSize.Y + deltaY * signY < self.MinY then deltaY = signY * (self.MinY - guiMain.AbsoluteSize.Y) end
								if signY < 0 and guiMain.AbsolutePosition.Y + deltaY < 0 then deltaY = -guiMain.AbsolutePosition.Y end

								guiMain.Position = guiMain.Position + UDim2.new(0, (signX < 0 and deltaX or 0), 0, (signY < 0 and deltaY or 0))
								self.SizeX = self.SizeX + (isH and deltaX * signX or 0)
								self.SizeY = self.SizeY + (isV and deltaY * signY or 0)
								guiMain.Size = UDim2.new(0, self.SizeX, 0, self.Minimized and 20 or self.SizeY)
							end
						end)
					end
				end
			end)

			resizer.InputEnded:Connect(function(input)
				--if input.UserInputType == Enum.UserInputType.Touch and Main.AllowDraggableOnMobile == false then return end
				if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and self.Resizing ~= resizer then
					resizer.BackgroundTransparency = 1
				end
			end)
		end

		local updateWindows

		local function moveToTop(window)
			local found = table.find(visibleWindows,window)
			if found then
				table.remove(visibleWindows,found)
				table.insert(visibleWindows,1,window)
				updateWindows()
			end
		end

		local function sideHasRoom(side,neededSize)
			local maxY = sidesGui.AbsoluteSize.Y - (math.max(0,#side.Windows - 1) * 4)
			local inc = 0
			for i,v in pairs(side.Windows) do
				inc = inc + (v.MinY or 100)
				if inc > maxY - neededSize then return false end
			end

			return true
		end

		local function getSideInsertPos(side,curY)
			local pos = #side.Windows + 1
			local range = {0,sidesGui.AbsoluteSize.Y}

			for i,v in pairs(side.Windows) do
				local midPos = v.PosY + v.SizeY/2
				if curY <= midPos then
					pos = i
					range[2] = midPos
					break
				else
					range[1] = midPos
				end
			end

			return pos,range
		end

		local function focusInput(self,obj)
			if isA(obj,"GuiButton") then
				obj.MouseButton1Down:Connect(function()
					moveToTop(self)
				end)
			elseif isA(obj,"TextBox") then
				obj.Focused:Connect(function()
					moveToTop(self)
				end)
			end
		end

		local createGui = function(self)
			local gui = create({
				{1,"ScreenGui",{Name="Window",}},
				{2,"Frame",{Active=true,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="Main",Parent={1},Position=UDim2.new(0.40000000596046,0,0.40000000596046,0),Size=UDim2.new(0,300,0,300),}},
				--[[background mod set to 0.05]]	{3,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,Name="Content",Parent={2},Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),ClipsDescendants=true}},
				{4,"Frame",{BackgroundColor3=Color3.fromRGB(33,33,33),BorderSizePixel=0,Name="Line",Parent={3},Size=UDim2.new(1,0,0,1),}},
				{5,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="TopBar",Parent={2},Size=UDim2.new(1,0,0,20),Text = ""}},
				{6,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={5},Position=UDim2.new(0,5,0,0),Size=UDim2.new(1,-10,0,20),Text="Window",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0}},
				{7,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Close",Parent={5},Position=UDim2.new(1,-18,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
				{8,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5054663650",Parent={7},Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,10,0,10),}},
				{9,"UICorner",{CornerRadius=UDim.new(0,4),Parent={7},}},
				--[[lol mod]]	{9,"UICorner",{CornerRadius=UDim.new(0,4),Parent={2},}},
				{10,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Minimize",Parent={5},Position=UDim2.new(1,-36,0,2),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
				{11,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5034768003",Parent={10},Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,10,0,10),}},
				{12,"UICorner",{CornerRadius=UDim.new(0,4),Parent={10},}},
				{13,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Image="rbxassetid://1427967925",Name="Outlines",Parent={2},Position=UDim2.new(0,-5,0,-5),ScaleType=1,Size=UDim2.new(1,10,1,10),SliceCenter=Rect.new(6,6,25,25),TileSize=UDim2.new(0,20,0,20),}},
				{14,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="ResizeControls",Parent={2},Position=UDim2.new(0,-5,0,-5),Size=UDim2.new(1,10,1,10),}},
				{15,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="North",Parent={14},Position=UDim2.new(0,5,0,0),Size=UDim2.new(1,-10,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{16,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="South",Parent={14},Position=UDim2.new(0,5,1,-5),Size=UDim2.new(1,-10,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{17,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="NorthEast",Parent={14},Position=UDim2.new(1,-5,0,0),Size=UDim2.new(0,5,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{18,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="East",Parent={14},Position=UDim2.new(1,-5,0,5),Size=UDim2.new(0,5,1,-10),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{19,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="West",Parent={14},Position=UDim2.new(0,0,0,5),Size=UDim2.new(0,5,1,-10),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{20,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="SouthEast",Parent={14},Position=UDim2.new(1,-5,1,-5),Size=UDim2.new(0,5,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{21,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="NorthWest",Parent={14},Size=UDim2.new(0,5,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{22,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.27450981736183,0.27450981736183,0.27450981736183),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="SouthWest",Parent={14},Position=UDim2.new(0,0,1,-5),Size=UDim2.new(0,5,0,5),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
			})

			local guiMain = gui.Main
			local guiTopBar = guiMain.TopBar
			local guiResizeControls = guiMain.ResizeControls

			self.GuiElems.Main = guiMain
			self.GuiElems.TopBar = guiMain.TopBar
			self.GuiElems.Content = guiMain.Content
			self.GuiElems.Line = guiMain.Content.Line
			self.GuiElems.Outlines = guiMain.Outlines
			self.GuiElems.Title = guiTopBar.Title
			self.GuiElems.Close = guiTopBar.Close
			self.GuiElems.Minimize = guiTopBar.Minimize
			self.GuiElems.ResizeControls = guiResizeControls
			self.ContentPane = guiMain.Content
			
			-- dont mind this, im testing what if the frame background is blurry 
			--blur.new(guiMain.Content, "Rectangle")

			--blur.updateAll()
			
			local ButtonDown = false
			guiTopBar.MouseButton1Down:Connect(function() ButtonDown = true end)
			guiTopBar.MouseButton1Up:Connect(function() ButtonDown = false end)

			if Settings.Window.TitleOnMiddle then
				self.GuiElems.Title.TextXAlignment = 2
				self.GuiElems.Title.Size = UDim2.new(1,-20,0,20)
			end

			if Settings.Window.Transparency then
				self.GuiElems.Content.BackgroundTransparency = Settings.Window.Transparency
				--self.GuiElems
			end


			guiTopBar.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if self.Draggable then
						local releaseEvent, mouseEvent

						local maxX = sidesGui.AbsoluteSize.X
						local initX = guiMain.AbsolutePosition.X
						local initY = guiMain.AbsolutePosition.Y
						local offX = input.Position.X - initX
						local offY = input.Position.Y - initY

						local alignInsertPos, alignInsertSide

						guiDragging = true

						releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								if mouseEvent then mouseEvent:Disconnect() end
								guiDragging = false
								alignIndicator.Parent = nil
								if alignInsertSide then
									local targetSide = (alignInsertSide == "left" and leftSide) or (alignInsertSide == "right" and rightSide)
									self:AlignTo(targetSide, alignInsertPos)
								end
							end
						end)

						mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
							if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) and self.Draggable and not self.Closed and ButtonDown then
								if self.Aligned then
									if leftSide.Resizing or rightSide.Resizing then return end
									local posX, posY = input.Position.X - offX, input.Position.Y - offY
									local delta = math.sqrt((posX - initX)^2 + (posY - initY)^2)
									if delta >= 5 then
										self:SetAligned(false)
									end
								else
									local inputX, inputY = input.Position.X, input.Position.Y
									local posX, posY = inputX - offX, inputY - offY
									if posY < 0 then posY = 0 end
									guiMain.Position = UDim2.new(0, posX, 0, posY)

									if self.Resizable and self.Alignable then
										if inputX < 25 then
											if sideHasRoom(leftSide, self.MinY or 100) then
												local insertPos, range = getSideInsertPos(leftSide, inputY)
												alignIndicator.Indicator.Position = UDim2.new(0, -15, 0, range[1])
												alignIndicator.Indicator.Size = UDim2.new(0, 40, 0, range[2] - range[1])
												Lib.ShowGui(alignIndicator)
												alignInsertPos = insertPos
												alignInsertSide = "left"
												return
											end
										elseif inputX >= maxX - 25 then
											if sideHasRoom(rightSide, self.MinY or 100) then
												local insertPos, range = getSideInsertPos(rightSide, inputY)
												alignIndicator.Indicator.Position = UDim2.new(0, maxX - 25, 0, range[1])
												alignIndicator.Indicator.Size = UDim2.new(0, 40, 0, range[2] - range[1])
												Lib.ShowGui(alignIndicator)
												alignInsertPos = insertPos
												alignInsertSide = "right"
												return
											end
										end
									end
									alignIndicator.Parent = nil
									alignInsertPos = nil
									alignInsertSide = nil
								end
							end
						end)
					end
				end
			end)

			guiTopBar.Close.MouseButton1Click:Connect(function()
				if self.Closed then return end
				self:Close()
			end)

			guiTopBar.Minimize.MouseButton1Click:Connect(function()
				if self.Closed then return end
				if self.Aligned then
					self:SetAligned(false)
				else
					self:SetMinimized()
				end
			end)

			guiTopBar.Minimize.MouseButton2Click:Connect(function()
				if self.Closed then return end
				if not self.Aligned then
					self:SetMinimized(nil,2)
					guiTopBar.Minimize.BackgroundTransparency = 1
				end
			end)

			guiMain.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and not self.Aligned and not self.Closed then
					moveToTop(self)
				end
			end)

			guiMain:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
				local absPos = guiMain.AbsolutePosition
				self.PosX = absPos.X
				self.PosY = absPos.Y
			end)

			resizeHook(self,guiResizeControls.North,"N")
			resizeHook(self,guiResizeControls.NorthEast,"NE")
			resizeHook(self,guiResizeControls.East,"E")
			resizeHook(self,guiResizeControls.SouthEast,"SE")
			resizeHook(self,guiResizeControls.South,"S")
			resizeHook(self,guiResizeControls.SouthWest,"SW")
			resizeHook(self,guiResizeControls.West,"W")
			resizeHook(self,guiResizeControls.NorthWest,"NW")

			guiMain.Size = UDim2.new(0,self.SizeX,0,self.SizeY)

			gui.DescendantAdded:Connect(function(obj) focusInput(self,obj) end)
			local descs = gui:GetDescendants()
			for i = 1,#descs do
				focusInput(self,descs[i])
			end

			self.MinimizeAnim = Lib.ButtonAnim(guiTopBar.Minimize)
			self.CloseAnim = Lib.ButtonAnim(guiTopBar.Close)

			return gui
		end

		local function updateSideFrames(noTween)
			stopTweens()
			leftSide.Frame.Size = UDim2.new(0,leftSide.Width,1,0)
			rightSide.Frame.Size = UDim2.new(0,rightSide.Width,1,0)
			leftSide.Frame.Resizer.Position = UDim2.new(0,leftSide.Width,0,0)
			rightSide.Frame.Resizer.Position = UDim2.new(0,-5,0,0)

			--leftSide.Frame.Visible = (#leftSide.Windows > 0)
			--rightSide.Frame.Visible = (#rightSide.Windows > 0)

			--[[if #leftSide.Windows > 0 and leftSide.Frame.Position == UDim2.new(0,-leftSide.Width-5,0,0) then
				leftSide.Frame:TweenPosition(UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)
			elseif #leftSide.Windows == 0 and leftSide.Frame.Position == UDim2.new(0,0,0,0) then
				leftSide.Frame:TweenPosition(UDim2.new(0,-leftSide.Width-5,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)
			end
			local rightTweenPos = (#rightSide.Windows == 0 and UDim2.new(1,5,0,0) or UDim2.new(1,-rightSide.Width,0,0))
			rightSide.Frame:TweenPosition(rightTweenPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)]]
			local leftHidden = #leftSide.Windows == 0 or leftSide.Hidden
			local rightHidden = #rightSide.Windows == 0 or rightSide.Hidden
			local leftPos = (leftHidden and UDim2.new(0,-leftSide.Width-10,0,0) or UDim2.new(0,0,0,0))
			local rightPos = (rightHidden and UDim2.new(1,10,0,0) or UDim2.new(1,-rightSide.Width,0,0))

			sidesGui.LeftToggle.Text = leftHidden and ">" or "<"
			sidesGui.RightToggle.Text = rightHidden and "<" or ">"

			if not noTween then
				local function insertTween(...)
					local tween = service.TweenService:Create(...)
					tweens[#tweens+1] = tween
					tween:Play()
				end
				insertTween(leftSide.Frame,sideTweenInfo,{Position = leftPos})
				insertTween(rightSide.Frame,sideTweenInfo,{Position = rightPos})
				insertTween(sidesGui.LeftToggle,sideTweenInfo,{Position = UDim2.new(0,#leftSide.Windows == 0 and -16 or 0,0,-36)})
				insertTween(sidesGui.RightToggle,sideTweenInfo,{Position = UDim2.new(1,#rightSide.Windows == 0 and 0 or -16,0,-36)})
			else
				leftSide.Frame.Position = leftPos
				rightSide.Frame.Position = rightPos
				sidesGui.LeftToggle.Position = UDim2.new(0,#leftSide.Windows == 0 and -16 or 0,0,-36)
				sidesGui.RightToggle.Position = UDim2.new(1,#rightSide.Windows == 0 and 0 or -16,0,-36)
			end
		end

		local function getSideFramePos(side)
			local leftHidden = #leftSide.Windows == 0 or leftSide.Hidden
			local rightHidden = #rightSide.Windows == 0 or rightSide.Hidden
			if side == leftSide then
				return (leftHidden and UDim2.new(0,-leftSide.Width-10,0,0) or UDim2.new(0,0,0,0))
			else
				return (rightHidden and UDim2.new(1,10,0,0) or UDim2.new(1,-rightSide.Width,0,0))
			end
		end

		local function sideResized(side)
			local currentPos = 0
			local sideFramePos = getSideFramePos(side)
			for i,v in pairs(side.Windows) do
				v.SizeX = side.Width
				v.GuiElems.Main.Size = UDim2.new(0,side.Width,0,v.SizeY)
				v.GuiElems.Main.Position = UDim2.new(sideFramePos.X.Scale,sideFramePos.X.Offset,0,currentPos)
				currentPos = currentPos + v.SizeY+4
			end
		end

		local function sideResizerHook(resizer,dir,side,pos)
			local pressing = false
			
			local mouse = Main.Mouse
			local windows = side.Windows

			resizer.MouseEnter:Connect(function() resizer.BackgroundColor3 = theme.MainColor2 end)
			resizer.MouseButton1Down:Connect(function() pressing = true resizer.BackgroundColor3 = theme.MainColor2 end)
			resizer.MouseButton1Up:Connect(function() pressing = false resizer.BackgroundColor3 = theme.Button end)


			resizer.InputBegan:Connect(function(input)
				if not side.Resizing and pressing then
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						resizer.BackgroundColor3 = theme.MainColor2
					end 
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						local releaseEvent,mouseEvent

						local offX = mouse.X - resizer.AbsolutePosition.X
						local offY = mouse.Y - resizer.AbsolutePosition.Y

						side.Resizing = resizer
						resizer.BackgroundColor3 = theme.MainColor2

						releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								mouseEvent:Disconnect()
								side.Resizing = false
								resizer.BackgroundColor3 = theme.Button
							end
						end)

						mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
							if not resizer.Parent then
								releaseEvent:Disconnect()
								mouseEvent:Disconnect()
								side.Resizing = false
								return
							end
							if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
								if dir == "V" then
									local delta = input.Position.Y - resizer.AbsolutePosition.Y - offY

									if delta > 0 then
										local neededSize = delta
										for i = pos+1,#windows do
											local window = windows[i]
											local newSize = math.max(window.SizeY-neededSize,(window.MinY or 100))
											neededSize = neededSize - (window.SizeY - newSize)
											window.SizeY = newSize
										end
										windows[pos].SizeY = windows[pos].SizeY + math.max(0,delta-neededSize)
									else
										local neededSize = -delta
										for i = pos,1,-1 do
											local window = windows[i]
											local newSize = math.max(window.SizeY-neededSize,(window.MinY or 100))
											neededSize = neededSize - (window.SizeY - newSize)
											window.SizeY = newSize
										end
										windows[pos+1].SizeY = windows[pos+1].SizeY + math.max(0,-delta-neededSize)
									end

									updateSideFrames()
									sideResized(side)
								elseif dir == "H" then
									local maxWidth = math.max(300,sidesGui.AbsoluteSize.X-static.FreeWidth)
									local otherSide = (side == leftSide and rightSide or leftSide)
									local delta = input.Position.X - resizer.AbsolutePosition.X - offX
									delta = (side == leftSide and delta or -delta)

									local proposedSize = math.max(static.MinWidth,side.Width + delta)
									if proposedSize + otherSide.Width <= maxWidth then
										side.Width = proposedSize
									else
										local newOtherSize = maxWidth - proposedSize
										if newOtherSize >= static.MinWidth then
											side.Width = proposedSize
											otherSide.Width = newOtherSize
										else
											side.Width = maxWidth - static.MinWidth
											otherSide.Width = static.MinWidth
										end
									end

									updateSideFrames(true)
									sideResized(side)
									sideResized(otherSide)
								end
							end
						end)
					end
				end
			end)

			resizer.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch and side.Resizing ~= resizer then
					resizer.BackgroundColor3 = theme.Button
				end
			end)
		end

		local function renderSide(side,noTween) -- TODO: Use existing resizers
			local currentPos = 0
			local sideFramePos = getSideFramePos(side)
			local template = side.WindowResizer:Clone()
			for i,v in pairs(side.ResizeCons) do v:Disconnect() end
			for i,v in pairs(side.Frame:GetChildren()) do if v.Name == "WindowResizer" then v:Destroy() end end
			side.ResizeCons = {}
			side.Resizing = nil

			for i,v in pairs(side.Windows) do
				v.SidePos = i
				local isEnd = i == #side.Windows
				local size = UDim2.new(0,side.Width,0,v.SizeY)
				local pos = UDim2.new(sideFramePos.X.Scale,sideFramePos.X.Offset,0,currentPos)
				Lib.ShowGui(v.Gui)
				--v.GuiElems.Main:TweenSizeAndPosition(size,pos,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)
				if noTween then
					v.GuiElems.Main.Size = size
					v.GuiElems.Main.Position = pos
				else
					local tween = service.TweenService:Create(v.GuiElems.Main,sideTweenInfo,{Size = size, Position = pos})
					tweens[#tweens+1] = tween
					tween:Play()
				end
				currentPos = currentPos + v.SizeY+4

				if not isEnd then
					local newTemplate = template:Clone()
					newTemplate.Position = UDim2.new(1,-side.Width,0,currentPos-4)
					side.ResizeCons[#side.ResizeCons+1] = v.Gui.Main:GetPropertyChangedSignal("Size"):Connect(function()
						newTemplate.Position = UDim2.new(1,-side.Width,0, v.GuiElems.Main.Position.Y.Offset + v.GuiElems.Main.Size.Y.Offset)
					end)
					side.ResizeCons[#side.ResizeCons+1] = v.Gui.Main:GetPropertyChangedSignal("Position"):Connect(function()
						newTemplate.Position = UDim2.new(1,-side.Width,0, v.GuiElems.Main.Position.Y.Offset + v.GuiElems.Main.Size.Y.Offset)
					end)
					sideResizerHook(newTemplate,"V",side,i)
					newTemplate.Parent = side.Frame
				end
			end

			--side.Frame.Back.Position = UDim2.new(0,0,0,0)
			--side.Frame.Back.Size = UDim2.new(0,side.Width,1,0)
		end

		local function updateSide(side,noTween)
			local oldHeight = 0
			local currentPos = 0
			local neededSize = 0
			local windows = side.Windows
			local height = sidesGui.AbsoluteSize.Y - (math.max(0,#windows - 1) * 4)

			for i,v in pairs(windows) do oldHeight = oldHeight + v.SizeY end
			for i,v in pairs(windows) do
				if i == #windows then
					v.SizeY = height-currentPos
					neededSize = math.max(0,(v.MinY or 100)-v.SizeY)
				else
					v.SizeY = math.max(math.floor(v.SizeY/oldHeight*height),v.MinY or 100)
				end
				currentPos = currentPos + v.SizeY
			end

			if neededSize > 0 then
				for i = #windows-1,1,-1 do
					local window = windows[i]
					local newSize = math.max(window.SizeY-neededSize,(window.MinY or 100))
					neededSize = neededSize - (window.SizeY - newSize)
					window.SizeY = newSize
				end
				local lastWindow = windows[#windows]
				lastWindow.SizeY = (lastWindow.MinY or 100)-neededSize
			end
			renderSide(side,noTween)
		end

		updateWindows = function(noTween)
			updateSideFrames(noTween)
			updateSide(leftSide,noTween)
			updateSide(rightSide,noTween)
			local count = 0
			for i = #visibleWindows,1,-1 do
				visibleWindows[i].Gui.DisplayOrder = displayOrderStart + count
				Lib.ShowGui(visibleWindows[i].Gui)
				count = count + 1
			end

			--[[local leftTweenPos = (#leftSide.Windows == 0 and UDim2.new(0,-leftSide.Width-5,0,0) or UDim2.new(0,0,0,0))
			leftSide.Frame:TweenPosition(leftTweenPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)
			local rightTweenPos = (#rightSide.Windows == 0 and UDim2.new(1,5,0,0) or UDim2.new(1,-rightSide.Width,0,0))
			rightSide.Frame:TweenPosition(rightTweenPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.3,true)]]
		end

		funcs.SetMinimized = function(self,set,mode)
			local oldVal = self.Minimized
			local newVal
			if set == nil then newVal = not self.Minimized else newVal = set end
			self.Minimized = newVal
			if not mode then mode = 1 end

			local resizeControls = self.GuiElems.ResizeControls
			local minimizeControls = {"North","NorthEast","NorthWest","South","SouthEast","SouthWest"}
			for i = 1,#minimizeControls do
				local control = resizeControls:FindFirstChild(minimizeControls[i])
				if control then control.Visible = not newVal end
			end

			if mode == 1 or mode == 2 then
				self:StopTweens()
				if mode == 1 then
					self.GuiElems.Main:TweenSize(UDim2.new(0,self.SizeX,0,newVal and 20 or self.SizeY),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
				else
					local maxY = sidesGui.AbsoluteSize.Y
					local newPos = UDim2.new(0,self.PosX,0,newVal and math.min(maxY-20,self.PosY + self.SizeY - 20) or math.max(0,self.PosY - self.SizeY + 20))

					self.GuiElems.Main:TweenPosition(newPos,Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
					self.GuiElems.Main:TweenSize(UDim2.new(0,self.SizeX,0,newVal and 20 or self.SizeY),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.25,true)
				end
				self.GuiElems.Minimize.ImageLabel.Image = newVal and "rbxassetid://5060023708" or "rbxassetid://5034768003"
			end

			if oldVal ~= newVal then
				if newVal then
					self.OnMinimize:Fire()
				else
					self.OnRestore:Fire()
				end
			end
		end

		funcs.Resize = function(self,sizeX,sizeY)
			self.SizeX = sizeX or self.SizeX
			self.SizeY = sizeY or self.SizeY
			self.GuiElems.Main.Size = UDim2.new(0,self.SizeX,0,self.SizeY)
		end

		funcs.SetSize = funcs.Resize

		funcs.SetTitle = function(self,title)
			self.GuiElems.Title.Text = title
		end

		funcs.SetResizable = function(self,val)
			self.Resizable = val
			self.GuiElems.ResizeControls.Visible = self.Resizable and self.ResizableInternal
		end

		funcs.SetResizableInternal = function(self,val)
			self.ResizableInternal = val
			self.GuiElems.ResizeControls.Visible = self.Resizable and self.ResizableInternal
		end

		funcs.SetAligned = function(self,val)
			self.Aligned = val
			self:SetResizableInternal(not val)
			self.GuiElems.Main.Active = not val
			self.GuiElems.Main.Outlines.Visible = not val
			if not val then
				for i,v in pairs(leftSide.Windows) do if v == self then table.remove(leftSide.Windows,i) break end end
				for i,v in pairs(rightSide.Windows) do if v == self then table.remove(rightSide.Windows,i) break end end
				if not table.find(visibleWindows,self) then table.insert(visibleWindows,1,self) end
				self.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5034768003"
				self.Side = nil
				updateWindows()
			else
				self:SetMinimized(false,3)
				for i,v in pairs(visibleWindows) do if v == self then table.remove(visibleWindows,i) break end end
				self.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5448127505"
			end
		end

		funcs.Add = function(self,obj,name)
			if type(obj) == "table" and obj.Gui and obj.Gui:IsA("GuiObject") then
				obj.Gui.Parent = self.ContentPane
			else
				obj.Parent = self.ContentPane
			end
			if name then self.Elements[name] = obj end
		end

		funcs.GetElement = function(self,obj,name)
			return self.Elements[name]
		end

		funcs.AlignTo = function(self,side,pos,size,silent)
			if table.find(side.Windows,self) or self.Closed then return end

			size = size or self.SizeY
			if size > 0 and size <= 1 then
				local totalSideHeight = 0
				for i,v in pairs(side.Windows) do totalSideHeight = totalSideHeight + v.SizeY end
				self.SizeY = (totalSideHeight > 0 and totalSideHeight * size * 2) or size
			else
				self.SizeY = (size > 0 and size or 100)
			end

			self:SetAligned(true)
			self.Side = side
			self.SizeX = side.Width
			self.Gui.DisplayOrder = sideDisplayOrder + 1
			for i,v in pairs(side.Windows) do v.Gui.DisplayOrder = sideDisplayOrder end
			pos = math.min(#side.Windows+1, pos or 1)
			self.SidePos = pos
			table.insert(side.Windows, pos, self)

			if not silent then
				side.Hidden = false
			end
			updateWindows(silent)
		end

		funcs.Close = function(self)
			self.Closed = true
			self:SetResizableInternal(false)

			Lib.FindAndRemove(leftSide.Windows,self)
			Lib.FindAndRemove(rightSide.Windows,self)
			Lib.FindAndRemove(visibleWindows,self)

			self.MinimizeAnim.Disable()
			self.CloseAnim.Disable()
			self.ClosedSide = self.Side
			self.Side = nil
			self.OnDeactivate:Fire()

			if not self.Aligned then
				self:StopTweens()
				local ti = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

				local closeTime = tick()
				self.LastClose = closeTime

				self:DoTween(self.GuiElems.Main,ti,{Size = UDim2.new(0,self.SizeX,0,20)})
				self:DoTween(self.GuiElems.Title,ti,{TextTransparency = 1})
				self:DoTween(self.GuiElems.Minimize.ImageLabel,ti,{ImageTransparency = 1})
				self:DoTween(self.GuiElems.Close.ImageLabel,ti,{ImageTransparency = 1})
				Lib.FastWait(0.2)
				if closeTime ~= self.LastClose then return end

				self:DoTween(self.GuiElems.TopBar,ti,{BackgroundTransparency = 1})
				self:DoTween(self.GuiElems.Outlines,ti,{ImageTransparency = 1})
				Lib.FastWait(0.2)
				if closeTime ~= self.LastClose then return end
			end

			self.Aligned = false
			self.Gui.Parent = nil
			updateWindows(true)
		end
		
		funcs.Destroy = function(self)
			self.Closed = true
			self:SetResizableInternal(false)

			Lib.FindAndRemove(leftSide.Windows,self)
			Lib.FindAndRemove(rightSide.Windows,self)
			Lib.FindAndRemove(visibleWindows,self)

			self.MinimizeAnim.Disable()
			self.CloseAnim.Disable()
			self.ClosedSide = self.Side
			self.Side = nil
			self.OnDeactivate:Fire()

			if not self.Aligned then
				self:StopTweens()
				local ti = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

				local closeTime = tick()
				self.LastClose = closeTime

				self:DoTween(self.GuiElems.Main,ti,{Size = UDim2.new(0,self.SizeX,0,20)})
				self:DoTween(self.GuiElems.Title,ti,{TextTransparency = 1})
				self:DoTween(self.GuiElems.Minimize.ImageLabel,ti,{ImageTransparency = 1})
				self:DoTween(self.GuiElems.Close.ImageLabel,ti,{ImageTransparency = 1})
				Lib.FastWait(0.2)
				if closeTime ~= self.LastClose then return end

				self:DoTween(self.GuiElems.TopBar,ti,{BackgroundTransparency = 1})
				self:DoTween(self.GuiElems.Outlines,ti,{ImageTransparency = 1})
				Lib.FastWait(0.2)
				if closeTime ~= self.LastClose then return end
			end

			self.Aligned = false
			--self.Gui.Parent = nil
			updateWindows(true)
			self.Gui:Destroy()
		end

		funcs.Hide = funcs.Close

		funcs.IsVisible = function(self)
			return not self.Closed and ((self.Side and not self.Side.Hidden) or not self.Side)
		end

		funcs.IsContentVisible = function(self)
			return self:IsVisible() and not self.Minimized
		end

		funcs.Focus = function(self)
			moveToTop(self)
		end

		funcs.MoveInBoundary = function(self)
			local posX,posY = self.PosX,self.PosY
			local maxX,maxY = sidesGui.AbsoluteSize.X,sidesGui.AbsoluteSize.Y
			posX = math.min(posX,maxX-self.SizeX)
			posY = math.min(posY,maxY-20)
			self.GuiElems.Main.Position = UDim2.new(0,posX,0,posY)
		end

		funcs.DoTween = function(self,...)
			local tween = service.TweenService:Create(...)
			self.Tweens[#self.Tweens+1] = tween
			tween:Play()
		end

		funcs.StopTweens = function(self)
			for i,v in pairs(self.Tweens) do
				v:Cancel()
			end
			self.Tweens = {}
		end

		funcs.Show = function(self,data)
			return static.ShowWindow(self,data)
		end

		funcs.ShowAndFocus = function(self,data)
			static.ShowWindow(self,data)
			service.RunService.RenderStepped:wait()
			self:Focus()
		end

		static.ShowWindow = function(window,data)
			data = data or {}
			local align = data.Align
			local pos = data.Pos
			local size = data.Size
			local targetSide = (align == "left" and leftSide) or (align == "right" and rightSide)

			if not window.Closed then
				if not window.Aligned then
					window:SetMinimized(false)
				elseif window.Side and not data.Silent then
					static.SetSideVisible(window.Side,true)
				end
				return
			end

			window.Closed = false
			window.LastClose = tick()
			window.GuiElems.Title.TextTransparency = 0
			window.GuiElems.Minimize.ImageLabel.ImageTransparency = 0
			window.GuiElems.Close.ImageLabel.ImageTransparency = 0
			window.GuiElems.TopBar.BackgroundTransparency = 0
			window.GuiElems.Outlines.ImageTransparency = 0
			window.GuiElems.Minimize.ImageLabel.Image = "rbxassetid://5034768003"
			window.GuiElems.Main.Active = true
			window.GuiElems.Main.Outlines.Visible = true
			window:SetMinimized(false,3)
			window:SetResizableInternal(true)
			window.MinimizeAnim.Enable()
			window.CloseAnim.Enable()

			if align then
				window:AlignTo(targetSide,pos,size,data.Silent)
			else
				if align == nil and window.ClosedSide then -- Regular open
					window:AlignTo(window.ClosedSide,window.SidePos,size,true)
					static.SetSideVisible(window.ClosedSide,true)
				else
					if table.find(visibleWindows,window) then return end

					-- TODO: make better
					window.GuiElems.Main.Size = UDim2.new(0,window.SizeX,0,20)
					local ti = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
					window:StopTweens()
					window:DoTween(window.GuiElems.Main,ti,{Size = UDim2.new(0,window.SizeX,0,window.SizeY)})

					window.SizeY = size or window.SizeY
					table.insert(visibleWindows,1,window)
					updateWindows()
				end
			end

			window.ClosedSide = nil
			window.OnActivate:Fire()
		end

		static.ToggleSide = function(name)
			local side = (name == "left" and leftSide or rightSide)
			side.Hidden = not side.Hidden
			for i,v in pairs(side.Windows) do
				if side.Hidden then
					v.OnDeactivate:Fire()
				else
					v.OnActivate:Fire()
				end
			end
			updateWindows()
		end

		static.SetSideVisible = function(s,vis)
			local side = (type(s) == "table" and s) or (s == "left" and leftSide or rightSide)
			side.Hidden = not vis
			for i,v in pairs(side.Windows) do
				if side.Hidden then
					v.OnDeactivate:Fire()
				else
					v.OnActivate:Fire()
				end
			end
			updateWindows()
		end

		static.Init = function()
			displayOrderStart = Main.DisplayOrders.Window
			sideDisplayOrder = Main.DisplayOrders.SideWindow

			sidesGui = Instance.new("ScreenGui")
			local leftFrame = create({
				{1,"Frame",{Active=true,Name="LeftSide",BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,}},
				{2,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2549019753933,0.2549019753933,0.2549019753933),BorderSizePixel=0,Font=3,Name="Resizer",Parent={1},Size=UDim2.new(0,5,1,0),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={2},Position=UDim2.new(0,0,0,0),Size=UDim2.new(0,1,1,0),}},
				{4,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2549019753933,0.2549019753933,0.2549019753933),BorderSizePixel=0,Font=3,Name="WindowResizer",Parent={1},Position=UDim2.new(1,-300,0,0),Size=UDim2.new(1,0,0,4),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{5,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={4},Size=UDim2.new(1,0,0,1),}},
			})
			leftSide.Frame = leftFrame
			leftFrame.Position = UDim2.new(0,-leftSide.Width-10,0,0)
			leftSide.WindowResizer = leftFrame.WindowResizer
			leftFrame.WindowResizer.Parent = nil
			leftFrame.Parent = sidesGui

			local rightFrame = create({
				{1,"Frame",{Active=true,Name="RightSide",BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,}},
				{2,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2549019753933,0.2549019753933,0.2549019753933),BorderSizePixel=0,Font=3,Name="Resizer",Parent={1},Size=UDim2.new(0,5,1,0),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={2},Position=UDim2.new(0,4,0,0),Size=UDim2.new(0,1,1,0),}},
				{4,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2549019753933,0.2549019753933,0.2549019753933),BorderSizePixel=0,Font=3,Name="WindowResizer",Parent={1},Position=UDim2.new(1,-300,0,0),Size=UDim2.new(1,0,0,4),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
				{5,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={4},Size=UDim2.new(1,0,0,1),}},
			})
			rightSide.Frame = rightFrame
			rightFrame.Position = UDim2.new(1,10,0,0)
			rightSide.WindowResizer = rightFrame.WindowResizer
			rightFrame.WindowResizer.Parent = nil
			rightFrame.Parent = sidesGui

			if Settings.Window.Transparency and Settings.Window.Transparency > 0 then
				leftSide.BackgroundTransparency = 1
				rightSide.BackgroundTransparency = 1

				leftFrame.BackgroundTransparency = 1
				rightFrame.BackgroundTransparency = 1
			end

			sideResizerHook(leftFrame.Resizer,"H",leftSide)
			sideResizerHook(rightFrame.Resizer,"H",rightSide)

			alignIndicator = Instance.new("ScreenGui")
			alignIndicator.DisplayOrder = Main.DisplayOrders.Core
			local indicator = Instance.new("Frame",alignIndicator)
			indicator.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
			indicator.BorderSizePixel = 0
			indicator.BackgroundTransparency = 0.8
			indicator.Name = "Indicator"
			local corner = Instance.new("UICorner",indicator)
			corner.CornerRadius = UDim.new(0,10)

			local leftToggle = create({{1,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderMode=2,Font=10,Name="LeftToggle",Position=UDim2.new(0,0,0,-36),Size=UDim2.new(0,16,0,36),Text="<",TextColor3=Color3.new(1,1,1),TextSize=14,}}})
			local rightToggle = leftToggle:Clone()
			rightToggle.Name = "RightToggle"
			rightToggle.Position = UDim2.new(1,-16,0,-36)
			Lib.ButtonAnim(leftToggle,{Mode = 2,PressColor = Color3.fromRGB(32,32,32)})
			Lib.ButtonAnim(rightToggle,{Mode = 2,PressColor = Color3.fromRGB(32,32,32)})

			leftToggle.MouseButton1Click:Connect(function()
				static.ToggleSide("left")
			end)

			rightToggle.MouseButton1Click:Connect(function()
				static.ToggleSide("right")
			end)

			leftToggle.Parent = sidesGui
			rightToggle.Parent = sidesGui

			sidesGui:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				local maxWidth = math.max(300,sidesGui.AbsoluteSize.X-static.FreeWidth)
				leftSide.Width = math.max(static.MinWidth,math.min(leftSide.Width,maxWidth-rightSide.Width))
				rightSide.Width = math.max(static.MinWidth,math.min(rightSide.Width,maxWidth-leftSide.Width))
				for i = 1,#visibleWindows do
					visibleWindows[i]:MoveInBoundary()
				end
				updateWindows(true)
			end)

			sidesGui.DisplayOrder = sideDisplayOrder - 1
			Lib.ShowGui(sidesGui)
			updateSideFrames()
		end

		local mt = {__index = funcs}
		static.new = function()
			local obj = setmetatable({
				Minimized = false,
				Dragging = false,
				Resizing = false,
				Aligned = false,
				Draggable = true,
				Resizable = true,
				ResizableInternal = true,
				Alignable = true,
				Closed = true,
				SizeX = 300,
				SizeY = 300,
				MinX = 200,
				MinY = 200,
				PosX = 0,
				PosY = 0,
				GuiElems = {},
				Tweens = {},
				Elements = {},
				OnActivate = Lib.Signal.new(),
				OnDeactivate = Lib.Signal.new(),
				OnMinimize = Lib.Signal.new(),
				OnRestore = Lib.Signal.new()
			},mt)
			obj.Gui = createGui(obj)
			return obj
		end

		return static
	end)()

	Lib.ContextMenu = (function()
		local funcs = {}
		local mouse

		local function createGui(self)
			local contextGui = create({
				{1,"ScreenGui",{DisplayOrder=1000000,Name="Context",ZIndexBehavior=1,}},
				{2,"Frame",{Active=true,BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),Name="Main",Parent={1},Position=UDim2.new(0.5,-100,0.5,-150),Size=UDim2.new(0,200,0,100),}},
				{3,"UICorner",{CornerRadius=UDim.new(0,4),Parent={2},}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),Name="Container",Parent={2},Position=UDim2.new(0,1,0,1),Size=UDim2.new(1,-2,1,-2),}},
				{5,"UICorner",{CornerRadius=UDim.new(0,4),Parent={4},}},
				{6,"ScrollingFrame",{Active=true,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BackgroundTransparency=1,BorderSizePixel=0,CanvasSize=UDim2.new(0,0,0,0),Name="List",Parent={4},Position=UDim2.new(0,2,0,2),ScrollBarImageColor3=Color3.new(0,0,0),ScrollBarThickness=4,Size=UDim2.new(1,-4,1,-4),VerticalScrollBarInset=1,}},
				{7,"UIListLayout",{Parent={6},SortOrder=2,}},
				{8,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="SearchFrame",Parent={4},Size=UDim2.new(1,0,0,24),Visible=false,}},
				{9,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.1176470592618,0.1176470592618,0.1176470592618),BorderSizePixel=0,Name="SearchContainer",Parent={8},Position=UDim2.new(0,3,0,3),Size=UDim2.new(1,-6,0,18),}},
				{10,"TextBox",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="SearchBox",Parent={9},PlaceholderColor3=Color3.new(0.39215689897537,0.39215689897537,0.39215689897537),PlaceholderText="Search",Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-8,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,}},
				{11,"UICorner",{CornerRadius=UDim.new(0,2),Parent={9},}},
				{12,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="Line",Parent={8},Position=UDim2.new(0,0,1,0),Size=UDim2.new(1,0,0,1),}},
				{13,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BackgroundTransparency=1,BorderColor3=Color3.new(0.33725491166115,0.49019610881805,0.73725491762161),BorderSizePixel=0,Font=3,Name="Entry",Parent={1},Size=UDim2.new(1,0,0,22),Text="",TextSize=14,Visible=false,}},
				{14,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="EntryName",Parent={13},Position=UDim2.new(0,24,0,0),Size=UDim2.new(1,-24,1,0),Text="Duplicate",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{15,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Shortcut",Parent={13},Position=UDim2.new(0,24,0,0),Size=UDim2.new(1,-30,1,0),Text="Ctrl+D",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{16,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ImageRectOffset=Vector2.new(304,0),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={13},Position=UDim2.new(0,2,0,3),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
				{17,"UICorner",{CornerRadius=UDim.new(0,4),Parent={13},}},
				{18,"Frame",{BackgroundColor3=Color3.new(0.21568629145622,0.21568629145622,0.21568629145622),BackgroundTransparency=1,BorderSizePixel=0,Name="Divider",Parent={1},Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,0,7),Visible=false,}},
				{19,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="Line",Parent={18},Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(1,0,0,1),}},
				{20,"TextLabel",{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="DividerName",Parent={18},Position=UDim2.new(0,2,0.5,0),Size=UDim2.new(1,-4,1,0),Text="Objects",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.60000002384186,TextXAlignment=0,Visible=false,}}
			})

			self.GuiElems.Main = contextGui.Main
			self.GuiElems.List = contextGui.Main.Container.List
			self.GuiElems.Entry = contextGui.Entry
			self.GuiElems.Divider = contextGui.Divider
			self.GuiElems.SearchFrame = contextGui.Main.Container.SearchFrame
			self.GuiElems.SearchBar = self.GuiElems.SearchFrame.SearchContainer.SearchBox
			Lib.ViewportTextBox.convert(self.GuiElems.SearchBar)

			self.GuiElems.SearchBar:GetPropertyChangedSignal("Text"):Connect(function()
				local lower,find = string.lower,string.find
				local searchText = lower(self.GuiElems.SearchBar.Text)
				local items = self.Items
				local map = self.ItemToEntryMap

				if searchText ~= "" then
					local results = {}
					local count = 1
					for i = 1,#items do
						local item = items[i]
						local entry = map[item]
						if entry then
							if not item.Divider and find(lower(item.Name),searchText,1,true) then
								results[count] = item
								count = count + 1
							else
								entry.Visible = false
							end
						end
					end
					table.sort(results,function(a,b) return a.Name < b.Name end)
					for i = 1,#results do
						local entry = map[results[i]]
						entry.LayoutOrder = i
						entry.Visible = true
					end
				else
					for i = 1,#items do
						local entry = map[items[i]]
						if entry then entry.LayoutOrder = i entry.Visible = true end
					end
				end

				local toSize = self.GuiElems.List.UIListLayout.AbsoluteContentSize.Y + 6
				self.GuiElems.List.CanvasSize = UDim2.new(0,0,0,toSize-6)
			end)

			return contextGui
		end

		funcs.Add = function(self,item)
			local newItem = {
				Name = item.Name or "Item",
				Icon = item.Icon or "",
				Shortcut = item.Shortcut or "",
				OnClick = item.OnClick,
				OnHover = item.OnHover,
				Disabled = item.Disabled or false,
				DisabledIcon = item.DisabledIcon or "",
				IconMap = item.IconMap,
				OnRightClick = item.OnRightClick
			}
			
			newItem.DisabledIcon = newItem.Icon

			if self.QueuedDivider then
				local text = self.QueuedDividerText and #self.QueuedDividerText > 0 and self.QueuedDividerText
				self:AddDivider(text)
			end
			self.Items[#self.Items+1] = newItem
			self.Updated = nil
		end

		funcs.AddRegistered = function(self,name,disabled)
			if not self.Registered[name] then error(name.." is not registered") end

			if self.QueuedDivider then
				local text = self.QueuedDividerText and #self.QueuedDividerText > 0 and self.QueuedDividerText
				self:AddDivider(text)
			end
			self.Registered[name].Disabled = disabled
			self.Items[#self.Items+1] = self.Registered[name]
			self.Updated = nil
		end

		funcs.Register = function(self,name,item)
			self.Registered[name] = {
				Name = item.Name or "Item",
				Icon = item.Icon or "",
				Shortcut = item.Shortcut or "",
				OnClick = item.OnClick,
				OnHover = item.OnHover,
				DisabledIcon = item.DisabledIcon or "",
				IconMap = item.IconMap,
				OnRightClick = item.OnRightClick
			}
		end

		funcs.UnRegister = function(self,name)
			self.Registered[name] = nil
		end

		funcs.AddDivider = function(self,text)
			self.QueuedDivider = false
			local textWidth = text and service.TextService:GetTextSize(text,14,Enum.Font.SourceSans,Vector2.new(999999999,20)).X or nil
			table.insert(self.Items,{Divider = true, Text = text, TextSize = textWidth and textWidth+4})
			self.Updated = nil
		end

		funcs.QueueDivider = function(self,text)
			self.QueuedDivider = true
			self.QueuedDividerText = text or ""
		end

		funcs.Clear = function(self)
			self.Items = {}
			self.Updated = nil
		end

		funcs.Refresh = function(self)
			for i,v in pairs(self.GuiElems.List:GetChildren()) do
				if not v:IsA("UIListLayout") then
					v:Destroy()
				end
			end
			local map = {}
			self.ItemToEntryMap = map

			local dividerFrame = self.GuiElems.Divider
			local contextList = self.GuiElems.List
			local entryFrame = self.GuiElems.Entry
			local items = self.Items

			for i = 1,#items do
				local item = items[i]
				if item.Divider then
					local newDivider = dividerFrame:Clone()
					newDivider.Line.BackgroundColor3 = self.Theme.DividerColor
					if item.Text then
						newDivider.Size = UDim2.new(1,0,0,20)
						newDivider.Line.Position = UDim2.new(0,item.TextSize,0.5,0)
						newDivider.Line.Size = UDim2.new(1,-item.TextSize,0,1)
						newDivider.DividerName.TextColor3 = self.Theme.TextColor
						newDivider.DividerName.Text = item.Text
						newDivider.DividerName.Visible = true
					end
					newDivider.Visible = true
					map[item] = newDivider
					newDivider.Parent = contextList
				else
					local newEntry = entryFrame:Clone()
					newEntry.BackgroundColor3 = self.Theme.HighlightColor
					newEntry.EntryName.TextColor3 = self.Theme.TextColor
					newEntry.EntryName.Text = item.Name
					newEntry.Shortcut.Text = item.Shortcut
					if item.Disabled then
						newEntry.EntryName.TextColor3 = Color3.new(150/255,150/255,150/255)
						newEntry.Shortcut.TextColor3 = Color3.new(150/255,150/255,150/255)
					end

					if self.Iconless then
						newEntry.EntryName.Position = UDim2.new(0,2,0,0)
						newEntry.EntryName.Size = UDim2.new(1,-4,0,20)
						newEntry.Icon.Visible = false
					else			
						local iconIndex
						if item.Disabled and item.DisabledIcon then
							iconIndex = item.DisabledIcon
						elseif item.Icon then
							iconIndex =  item.Icon
						end
						
						-- Explorer.MiscIcons:DisplayExplorerIcons(newEntry.Icon, iconIndex)
						if item.IconMap then
							if type(iconIndex) == "number" then
								item.IconMap:Display(newEntry.Icon, iconIndex)
							elseif type(iconIndex) == "string" then
								item.IconMap:DisplayByKey(newEntry.Icon, iconIndex)
							end
						elseif type(iconIndex) == "string" then
							newEntry.Icon.Image = iconIndex
						end
					end

					if not item.Disabled then
						if item.OnClick then
							newEntry.MouseButton1Click:Connect(function()
								item.OnClick(item.Name)
								if not item.NoHide then
									self:Hide()
								end
							end)
						end

						if item.OnRightClick then
							newEntry.MouseButton2Click:Connect(function()
								item.OnRightClick(item.Name)
								if not item.NoHide then
									self:Hide()
								end
							end)
						end
					end

					newEntry.InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							newEntry.BackgroundTransparency = 0
						end
					end)

					newEntry.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							newEntry.BackgroundTransparency = 1
						end
					end)

					newEntry.Visible = true
					map[item] = newEntry
					newEntry.Parent = contextList
				end
			end
			self.Updated = true
		end

		funcs.Show = function(self,x,y)
			local elems = self.GuiElems
			elems.SearchFrame.Visible = self.SearchEnabled
			elems.List.Position = UDim2.new(0,2,0,2 + (self.SearchEnabled and 24 or 0))
			elems.List.Size = UDim2.new(1,-4,1,-4 - (self.SearchEnabled and 24 or 0))
			if self.SearchEnabled and self.ClearSearchOnShow then elems.SearchBar.Text = "" end
			self.GuiElems.List.CanvasPosition = Vector2.new(0,0)

			if not self.Updated then
				self:Refresh()
			end

			-- Vars
			local reverseY = false
			local x,y = x or mouse.X, y or mouse.Y
			local maxX,maxY = mouse.ViewSizeX,mouse.ViewSizeY

			-- Position and show
			if x + self.Width > maxX then
				x = self.ReverseX and x - self.Width or maxX - self.Width
			end
			elems.Main.Position = UDim2.new(0,x,0,y)
			elems.Main.Size = UDim2.new(0,self.Width,0,0)
			self.Gui.DisplayOrder = Main.DisplayOrders.Menu
			Lib.ShowGui(self.Gui)

			-- Size adjustment
			local toSize = elems.List.UIListLayout.AbsoluteContentSize.Y + 6 -- Padding
			if self.MaxHeight and toSize > self.MaxHeight then
				elems.List.CanvasSize = UDim2.new(0,0,0,toSize-6)
				toSize = self.MaxHeight
			else
				elems.List.CanvasSize = UDim2.new(0,0,0,0)
			end
			if y + toSize > maxY then reverseY = true end

			-- Close event
			local closable
			if self.CloseEvent then self.CloseEvent:Disconnect() end
			self.CloseEvent = service.UserInputService.InputBegan:Connect(function(input)
				if not closable then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if not Lib.CheckMouseInGui(elems.Main) then
						self.CloseEvent:Disconnect()
						self:Hide()
					end
				end
			end)

			-- Resize
			if reverseY then
				elems.Main.Position = UDim2.new(0,x,0,y-(self.ReverseYOffset or 0))
				local newY = y - toSize - (self.ReverseYOffset or 0)
				y = newY >= 0 and newY or 0
				elems.Main:TweenSizeAndPosition(UDim2.new(0,self.Width,0,toSize),UDim2.new(0,x,0,y),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.2,true)
			else
				elems.Main:TweenSize(UDim2.new(0,self.Width,0,toSize),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,0.2,true)
			end

			-- Close debounce
			Lib.FastWait()
			if self.SearchEnabled and self.FocusSearchOnShow then elems.SearchBar:CaptureFocus() end
			closable = true
		end

		funcs.Hide = function(self)
			self.Gui.Parent = nil
		end

		funcs.ApplyTheme = function(self,data)
			local theme = self.Theme
			theme.ContentColor = data.ContentColor or Settings.Theme.Menu
			theme.OutlineColor = data.OutlineColor or Settings.Theme.Menu
			theme.DividerColor = data.DividerColor or Settings.Theme.Outline2
			theme.TextColor = data.TextColor or Settings.Theme.Text
			theme.HighlightColor = data.HighlightColor or Settings.Theme.Main1

			self.GuiElems.Main.BackgroundColor3 = theme.OutlineColor
			self.GuiElems.Main.Container.BackgroundColor3 = theme.ContentColor
		end

		local mt = {__index = funcs}
		local function new()
			if not mouse then mouse = Main.Mouse or service.Players.LocalPlayer:GetMouse() end

			local obj = setmetatable({
				Width = 200,
				MaxHeight = nil,
				Iconless = false,
				SearchEnabled = false,
				ClearSearchOnShow = true,
				FocusSearchOnShow = true,
				Updated = false,
				QueuedDivider = false,
				QueuedDividerText = "",
				Items = {},
				Registered = {},
				GuiElems = {},
				Theme = {}
			},mt)
			obj.Gui = createGui(obj)
			obj:ApplyTheme({})
			return obj
		end

		return {new = new}
	end)()

	Lib.CodeFrame = (function()
		local funcs = {}

		local typeMap = {
			[1] = "String",
			[2] = "String",
			[3] = "String",
			[4] = "Comment",
			[5] = "Operator",
			[6] = "Number",
			[7] = "Keyword",
			[8] = "BuiltIn",
			[9] = "LocalMethod",
			[10] = "LocalProperty",
			[11] = "Nil",
			[12] = "Bool",
			[13] = "Function",
			[14] = "Local",
			[15] = "Self",
			[16] = "FunctionName",
			[17] = "Bracket"
		}

		local specialKeywordsTypes = {
			["nil"] = 11,
			["true"] = 12,
			["false"] = 12,
			["function"] = 13,
			["local"] = 14,
			["self"] = 15
		}

		local keywords = {
			["and"] = true,
			["break"] = true, 
			["do"] = true,
			["else"] = true,
			["elseif"] = true,
			["end"] = true,
			["false"] = true,
			["for"] = true,
			["function"] = true,
			["if"] = true,
			["in"] = true,
			["local"] = true,
			["nil"] = true,
			["not"] = true,
			["or"] = true,
			["repeat"] = true,
			["return"] = true,
			["then"] = true,
			["true"] = true,
			["until"] = true,
			["while"] = true,
			["plugin"] = true
		}

		local builtIns = {
			["delay"] = true,
			["elapsedTime"] = true,
			["require"] = true,
			["spawn"] = true,
			["tick"] = true,
			["time"] = true,
			["typeof"] = true,
			["UserSettings"] = true,
			["wait"] = true,
			["warn"] = true,
			["game"] = true,
			["shared"] = true,
			["script"] = true,
			["workspace"] = true,
			["assert"] = true,
			["collectgarbage"] = true,
			["error"] = true,
			["getfenv"] = true,
			["getmetatable"] = true,
			["ipairs"] = true,
			["loadstring"] = true,
			["newproxy"] = true,
			["next"] = true,
			["pairs"] = true,
			["pcall"] = true,
			["print"] = true,
			["rawequal"] = true,
			["rawget"] = true,
			["rawset"] = true,
			["select"] = true,
			["setfenv"] = true,
			["setmetatable"] = true,
			["tonumber"] = true,
			["tostring"] = true,
			["type"] = true,
			["unpack"] = true,
			["xpcall"] = true,
			["_G"] = true,
			["_VERSION"] = true,
			["coroutine"] = true,
			["debug"] = true,
			["math"] = true,
			["os"] = true,
			["string"] = true,
			["table"] = true,
			["bit32"] = true,
			["utf8"] = true,
			["Axes"] = true,
			["BrickColor"] = true,
			["CFrame"] = true,
			["Color3"] = true,
			["ColorSequence"] = true,
			["ColorSequenceKeypoint"] = true,
			["DockWidgetPluginGuiInfo"] = true,
			["Enum"] = true,
			["Faces"] = true,
			["Instance"] = true,
			["NumberRange"] = true,
			["NumberSequence"] = true,
			["NumberSequenceKeypoint"] = true,
			["PathWaypoint"] = true,
			["PhysicalProperties"] = true,
			["Random"] = true,
			["Ray"] = true,
			["Rect"] = true,
			["Region3"] = true,
			["Region3int16"] = true,
			["TweenInfo"] = true,
			["UDim"] = true,
			["UDim2"] = true,
			["Vector2"] = true,
			["Vector2int16"] = true,
			["Vector3"] = true,
			["Vector3int16"] = true,

			["getgenv"] = true,
			["getrenv"] = true,
			["getsenv"] = true,
			["getgc"] = true,
			["getreg"] = true,
			["filtergc"] = true,
			["saveinstave"] = true,
			["decompile"] = true,
			["syn"] = true,
			["getupvalue"] = true,
			["getupvalues"] = true,
			["setupvalue"] = true,
			["getstack"] = true,
			["setstack"] = true,
			["getconstants"] = true,
			["getconstant"] = true,
			["setconstant"] = true,
			["getproto"] = true,
			["getprotos"] = true,
			["checkcaller"] = true,
			["clonefunction"] = true,
			["cloneref"] = true,
			["getfunctionhash"] = true,
			["gethwid"] = true,
			["hookfunction"] = true,
			["hookmetamethod"] = true,
			["iscclosure"] = true,
			["islclosure"] = true,
			["newcclosure"] = true,
			["isexecutorclosure"] = true,
			["restorefunction"] = true,
			["crypt"] = true,
			["Drawing"] = true,

		}

		local builtInInited = false

		local richReplace = {
			["'"] = "&apos;",
			["\""] = "&quot;",
			["<"] = "&lt;",
			[">"] = "&gt;",
			["&"] = "&amp;"
		}

		local tabSub = "\205"
		local tabReplacement = (" %s%s "):format(tabSub,tabSub)

		local tabJumps = {
			[("[^%s] %s"):format(tabSub,tabSub)] = 0,
			[(" %s%s"):format(tabSub,tabSub)] = -1,
			[("%s%s "):format(tabSub,tabSub)] = 2,
			[("%s [^%s]"):format(tabSub,tabSub)] = 1,
		}

		local tweenService = service.TweenService
		local lineTweens = {}

		local function initBuiltIn()
			local env = getfenv()
			local type = type
			local tostring = tostring
			for name,_ in next,builtIns do
				local envVal = env[name]
				if type(envVal) == "table" then
					local items = {}
					for i,v in next,envVal do
						items[i] = true
					end
					builtIns[name] = items
				end
			end

			local enumEntries = {}
			local enums = Enum:GetEnums()
			for i = 1,#enums do
				enumEntries[tostring(enums[i])] = true
			end
			builtIns["Enum"] = enumEntries

			builtInInited = true
		end

		local function setupEditBox(obj)
			local editBox = obj.GuiElems.EditBox

			editBox.Focused:Connect(function()
				obj:ConnectEditBoxEvent()
				obj.Editing = true
			end)

			editBox.FocusLost:Connect(function()
				obj:DisconnectEditBoxEvent()
				obj.Editing = false
			end)

			editBox:GetPropertyChangedSignal("Text"):Connect(function()
				local text = editBox.Text
				if #text == 0 or obj.EditBoxCopying then return end
				editBox.Text = ""
				obj:AppendText(text)
			end)
		end

		local function setupMouseSelection(obj)
			local mouse = plr:GetMouse()
			local codeFrame = obj.GuiElems.LinesFrame
			local lines = obj.Lines

			codeFrame.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					local fontSizeX,fontSizeY = math.ceil(obj.FontSize/2),obj.FontSize

					local relX = mouse.X - codeFrame.AbsolutePosition.X
					local relY = mouse.Y - codeFrame.AbsolutePosition.Y
					local selX = math.round(relX / fontSizeX) + obj.ViewX
					local selY = math.floor(relY / fontSizeY) + obj.ViewY
					local releaseEvent,mouseEvent,scrollEvent
					local scrollPowerV,scrollPowerH = 0,0
					selY = math.min(#lines-1,selY)
					local relativeLine = lines[selY+1] or ""
					selX = math.min(#relativeLine, selX + obj:TabAdjust(selX,selY))

					obj.SelectionRange = {{-1,-1},{-1,-1}}
					obj:MoveCursor(selX,selY)
					obj.FloatCursorX = selX

					local function updateSelection()
						local relX = mouse.X - codeFrame.AbsolutePosition.X
						local relY = mouse.Y - codeFrame.AbsolutePosition.Y
						local sel2X = math.max(0,math.round(relX / fontSizeX) + obj.ViewX)
						local sel2Y = math.max(0,math.floor(relY / fontSizeY) + obj.ViewY)

						sel2Y = math.min(#lines-1,sel2Y)
						local relativeLine = lines[sel2Y+1] or ""
						sel2X = math.min(#relativeLine, sel2X + obj:TabAdjust(sel2X,sel2Y))

						if sel2Y < selY or (sel2Y == selY and sel2X < selX) then
							obj.SelectionRange = {{sel2X,sel2Y},{selX,selY}}
						else						
							obj.SelectionRange = {{selX,selY},{sel2X,sel2Y}}
						end

						obj:MoveCursor(sel2X,sel2Y)
						obj.FloatCursorX = sel2X
						obj:Refresh()
					end

					releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
							releaseEvent:Disconnect()
							mouseEvent:Disconnect()
							scrollEvent:Disconnect()
							obj:SetCopyableSelection()
							--updateSelection()
						end
					end)

					mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
							local upDelta = mouse.Y - codeFrame.AbsolutePosition.Y
							local downDelta = mouse.Y - codeFrame.AbsolutePosition.Y - codeFrame.AbsoluteSize.Y
							local leftDelta = mouse.X - codeFrame.AbsolutePosition.X
							local rightDelta = mouse.X - codeFrame.AbsolutePosition.X - codeFrame.AbsoluteSize.X
							scrollPowerV = 0
							scrollPowerH = 0
							if downDelta > 0 then
								scrollPowerV = math.floor(downDelta*0.05) + 1
							elseif upDelta < 0 then
								scrollPowerV = math.ceil(upDelta*0.05) - 1
							end
							if rightDelta > 0 then
								scrollPowerH = math.floor(rightDelta*0.05) + 1
							elseif leftDelta < 0 then
								scrollPowerH = math.ceil(leftDelta*0.05) - 1
							end
							updateSelection()
						end
					end)

					scrollEvent = game:GetService("RunService").RenderStepped:Connect(function()
						if scrollPowerV ~= 0 or scrollPowerH ~= 0 then
							obj:ScrollDelta(scrollPowerH,scrollPowerV)
							updateSelection()
						end
					end)

					obj:Refresh()
				end
			end)
		end

		local function makeFrame(obj)
			local frame = create({
				{1,"Frame",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel = 0,Position=UDim2.new(0.5,-300,0.5,-200),Size=UDim2.new(0,600,0,400),}},
			})

			if Settings.Window.Transparency and Settings.Window.Transparency > 0 then
				frame.BackgroundTransparency = 0.5
			end

			local elems = {}

			local linesFrame = Instance.new("Frame")
			linesFrame.Name = "Lines"
			linesFrame.BackgroundTransparency = 1
			linesFrame.Size = UDim2.new(1,0,1,0)
			linesFrame.ClipsDescendants = true
			linesFrame.Parent = frame

			local lineNumbersLabel = Instance.new("TextLabel")
			lineNumbersLabel.Name = "LineNumbers"
			lineNumbersLabel.BackgroundTransparency = 1
			lineNumbersLabel.Font = Enum.Font.Code
			lineNumbersLabel.TextXAlignment = Enum.TextXAlignment.Right
			lineNumbersLabel.TextYAlignment = Enum.TextYAlignment.Top
			lineNumbersLabel.ClipsDescendants = true
			lineNumbersLabel.RichText = true
			lineNumbersLabel.Parent = frame

			local cursor = Instance.new("Frame")
			cursor.Name = "Cursor"
			cursor.BackgroundColor3 = Color3.fromRGB(220,220,220)
			cursor.BorderSizePixel = 0
			cursor.Parent = frame

			local editBox = Instance.new("TextBox")
			editBox.Name = "EditBox"
			editBox.MultiLine = true
			editBox.Visible = false
			editBox.Parent = frame

			lineTweens.Invis = tweenService:Create(cursor,TweenInfo.new(0.4,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency = 1})
			lineTweens.Vis = tweenService:Create(cursor,TweenInfo.new(0.2,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),{BackgroundTransparency = 0})

			elems.LinesFrame = linesFrame
			elems.LineNumbersLabel = lineNumbersLabel
			elems.Cursor = cursor
			elems.EditBox = editBox
			elems.ScrollCorner = create({{1,"Frame",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Name="ScrollCorner",Position=UDim2.new(1,-16,1,-16),Size=UDim2.new(0,16,0,16),Visible=false,}}})

			elems.ScrollCorner.Parent = frame
			linesFrame.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					obj:SetEditing(true,input)
				end
			end)

			obj.Frame = frame
			obj.Gui = frame
			obj.GuiElems = elems
			setupEditBox(obj)
			setupMouseSelection(obj)

			return frame
		end

		funcs.GetSelectionText = function(self)
			if not self:IsValidRange() then return "" end

			local selectionRange = self.SelectionRange
			local selX,selY = selectionRange[1][1], selectionRange[1][2]
			local sel2X,sel2Y = selectionRange[2][1], selectionRange[2][2]
			local deltaLines = sel2Y-selY
			local lines = self.Lines

			if not lines[selY+1] or not lines[sel2Y+1] then return "" end

			if deltaLines == 0 then
				return self:ConvertText(lines[selY+1]:sub(selX+1,sel2X), false)
			end

			local leftSub = lines[selY+1]:sub(selX+1)
			local rightSub = lines[sel2Y+1]:sub(1,sel2X)

			local result = leftSub.."\n" 
			for i = selY+1,sel2Y-1 do
				result = result..lines[i+1].."\n"
			end
			result = result..rightSub

			return self:ConvertText(result,false)
		end

		funcs.SetCopyableSelection = function(self)
			local text = self:GetSelectionText()
			local editBox = self.GuiElems.EditBox

			self.EditBoxCopying = true
			editBox.Text = text
			editBox.SelectionStart = 1
			editBox.CursorPosition = #editBox.Text + 1
			self.EditBoxCopying = false
		end

		funcs.ConnectEditBoxEvent = function(self)
			if self.EditBoxEvent then
				self.EditBoxEvent:Disconnect()
			end

			self.EditBoxEvent = service.UserInputService.InputBegan:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.Keyboard then return end

				local keycodes = Enum.KeyCode
				local keycode = input.KeyCode

				local function setupMove(key,func)
					local endCon,finished
					endCon = service.UserInputService.InputEnded:Connect(function(input)
						if input.KeyCode ~= key then return end
						endCon:Disconnect()
						finished = true
					end)
					func()
					Lib.FastWait(0.5)
					while not finished do func() Lib.FastWait(0.03) end
				end

				if keycode == keycodes.Down then
					setupMove(keycodes.Down,function()
						self.CursorX = self.FloatCursorX
						self.CursorY = self.CursorY + 1
						self:UpdateCursor()
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Up then
					setupMove(keycodes.Up,function()
						self.CursorX = self.FloatCursorX
						self.CursorY = self.CursorY - 1
						self:UpdateCursor()
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Left then
					setupMove(keycodes.Left,function()
						local line = self.Lines[self.CursorY+1] or ""
						self.CursorX = self.CursorX - 1 - (line:sub(self.CursorX-3,self.CursorX) == tabReplacement and 3 or 0)
						if self.CursorX < 0 then
							self.CursorY = self.CursorY - 1
							local line2 = self.Lines[self.CursorY+1] or ""
							self.CursorX = #line2
						end
						self.FloatCursorX = self.CursorX
						self:UpdateCursor()
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Right then
					setupMove(keycodes.Right,function()
						local line = self.Lines[self.CursorY+1] or ""
						self.CursorX = self.CursorX + 1 + (line:sub(self.CursorX+1,self.CursorX+4) == tabReplacement and 3 or 0)
						if self.CursorX > #line then
							self.CursorY = self.CursorY + 1
							self.CursorX = 0
						end
						self.FloatCursorX = self.CursorX
						self:UpdateCursor()
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Backspace then
					setupMove(keycodes.Backspace,function()
						local startRange,endRange
						if self:IsValidRange() then
							startRange = self.SelectionRange[1]
							endRange = self.SelectionRange[2]
						else
							endRange = {self.CursorX,self.CursorY}
						end

						if not startRange then
							local line = self.Lines[self.CursorY+1] or ""
							self.CursorX = self.CursorX - 1 - (line:sub(self.CursorX-3,self.CursorX) == tabReplacement and 3 or 0)
							if self.CursorX < 0 then
								self.CursorY = self.CursorY - 1
								local line2 = self.Lines[self.CursorY+1] or ""
								self.CursorX = #line2
							end
							self.FloatCursorX = self.CursorX
							self:UpdateCursor()

							startRange = startRange or {self.CursorX,self.CursorY}
						end

						self:DeleteRange({startRange,endRange},false,true)
						self:ResetSelection(true)
						self:JumpToCursor()
					end)
				elseif keycode == keycodes.Delete then
					setupMove(keycodes.Delete,function()
						local startRange,endRange
						if self:IsValidRange() then
							startRange = self.SelectionRange[1]
							endRange = self.SelectionRange[2]
						else
							startRange = {self.CursorX,self.CursorY}
						end

						if not endRange then
							local line = self.Lines[self.CursorY+1] or ""
							local endCursorX = self.CursorX + 1 + (line:sub(self.CursorX+1,self.CursorX+4) == tabReplacement and 3 or 0)
							local endCursorY = self.CursorY
							if endCursorX > #line then
								endCursorY = endCursorY + 1
								endCursorX = 0
							end
							self:UpdateCursor()

							endRange = endRange or {endCursorX,endCursorY}
						end

						self:DeleteRange({startRange,endRange},false,true)
						self:ResetSelection(true)
						self:JumpToCursor()
					end)
				elseif service.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
					if keycode == keycodes.A then
						self.SelectionRange = {{0,0},{#self.Lines[#self.Lines],#self.Lines-1}}
						self:SetCopyableSelection()
						self:Refresh()
					end
				end
			end)
		end

		funcs.DisconnectEditBoxEvent = function(self)
			if self.EditBoxEvent then
				self.EditBoxEvent:Disconnect()
			end
		end

		funcs.ResetSelection = function(self,norefresh)
			self.SelectionRange = {{-1,-1},{-1,-1}}
			if not norefresh then self:Refresh() end
		end

		funcs.IsValidRange = function(self,range)
			local selectionRange = range or self.SelectionRange
			local selX,selY = selectionRange[1][1], selectionRange[1][2]
			local sel2X,sel2Y = selectionRange[2][1], selectionRange[2][2]

			if selX == -1 or (selX == sel2X and selY == sel2Y) then return false end

			return true
		end

		funcs.DeleteRange = function(self,range,noprocess,updatemouse)
			range = range or self.SelectionRange
			if not self:IsValidRange(range) then return end

			local lines = self.Lines
			local selX,selY = range[1][1], range[1][2]
			local sel2X,sel2Y = range[2][1], range[2][2]
			local deltaLines = sel2Y-selY

			if not lines[selY+1] or not lines[sel2Y+1] then return end

			local leftSub = lines[selY+1]:sub(1,selX)
			local rightSub = lines[sel2Y+1]:sub(sel2X+1)
			lines[selY+1] = leftSub..rightSub

			local remove = table.remove
			for i = 1,deltaLines do
				remove(lines,selY+2)
			end

			if range == self.SelectionRange then self.SelectionRange = {{-1,-1},{-1,-1}} end
			if updatemouse then
				self.CursorX = selX
				self.CursorY = selY
				self:UpdateCursor()
			end

			if not noprocess then
				self:ProcessTextChange()
			end
		end

		funcs.AppendText = function(self,text)
			self:DeleteRange(nil,true,true)
			local lines,cursorX,cursorY = self.Lines,self.CursorX,self.CursorY
			local line = lines[cursorY+1]
			local before = line:sub(1,cursorX)
			local after = line:sub(cursorX+1)

			text = text:gsub("\r\n","\n")
			text = self:ConvertText(text,true) -- Tab Convert

			local textLines = text:split("\n")
			local insert = table.insert

			for i = 1,#textLines do
				local linePos = cursorY+i
				if i > 1 then insert(lines,linePos,"") end

				local textLine = textLines[i]
				local newBefore = (i == 1 and before or "")
				local newAfter = (i == #textLines and after or "")

				lines[linePos] = newBefore..textLine..newAfter
			end

			if #textLines > 1 then cursorX = 0 end

			self:ProcessTextChange()
			self.CursorX = cursorX + #textLines[#textLines]
			self.CursorY = cursorY + #textLines-1
			self:UpdateCursor()
		end

		funcs.ScrollDelta = function(self,x,y)
			self.ScrollV:ScrollTo(self.ScrollV.Index + y)
			self.ScrollH:ScrollTo(self.ScrollH.Index + x)
		end

		-- x and y starts at 0
		funcs.TabAdjust = function(self,x,y)
			local lines = self.Lines
			local line = lines[y+1]
			x=x+1

			if line then
				local left = line:sub(x-1,x-1)
				local middle = line:sub(x,x)
				local right = line:sub(x+1,x+1)
				local selRange = (#left > 0 and left or " ") .. (#middle > 0 and middle or " ") .. (#right > 0 and right or " ")

				for i,v in pairs(tabJumps) do
					if selRange:find(i) then
						return v
					end
				end
			end
			return 0
		end

		funcs.SetEditing = function(self,on,input)			
			self:UpdateCursor(input)

			if on then
				if self.Editable then
					self.GuiElems.EditBox.Text = ""
					self.GuiElems.EditBox:CaptureFocus()
				end
			else
				self.GuiElems.EditBox:ReleaseFocus()
			end
		end

		funcs.CursorAnim = function(self,on)
			local cursor = self.GuiElems.Cursor
			local animTime = tick()
			self.LastAnimTime = animTime

			if not on then return end

			lineTweens.Invis:Cancel()
			lineTweens.Vis:Cancel()
			cursor.BackgroundTransparency = 0

			coroutine.wrap(function()
				while self.Editable do
					Lib.FastWait(0.5)
					if self.LastAnimTime ~= animTime then return end
					lineTweens.Invis:Play()
					Lib.FastWait(0.4)
					if self.LastAnimTime ~= animTime then return end
					lineTweens.Vis:Play()
					Lib.FastWait(0.2)
				end
			end)()
		end

		funcs.MoveCursor = function(self,x,y)
			self.CursorX = x
			self.CursorY = y
			self:UpdateCursor()
			self:JumpToCursor()
		end

		funcs.JumpToCursor = function(self)
			self:Refresh()
		end

		funcs.UpdateCursor = function(self,input)
			local linesFrame = self.GuiElems.LinesFrame
			local cursor = self.GuiElems.Cursor			
			local hSize = math.max(0,linesFrame.AbsoluteSize.X)
			local vSize = math.max(0,linesFrame.AbsoluteSize.Y)
			local maxLines = math.ceil(vSize / self.FontSize)
			local maxCols = math.ceil(hSize / math.ceil(self.FontSize/2))
			local viewX,viewY = self.ViewX,self.ViewY
			local totalLinesStr = tostring(#self.Lines)
			local fontWidth = math.ceil(self.FontSize / 2)
			local linesOffset = #totalLinesStr*fontWidth + 4*fontWidth

			if input then
				local linesFrame = self.GuiElems.LinesFrame
				local frameX,frameY = linesFrame.AbsolutePosition.X,linesFrame.AbsolutePosition.Y
				local mouseX,mouseY = input.Position.X,input.Position.Y
				local fontSizeX,fontSizeY = math.ceil(self.FontSize/2),self.FontSize

				self.CursorX = self.ViewX + math.round((mouseX - frameX) / fontSizeX)
				self.CursorY = self.ViewY + math.floor((mouseY - frameY) / fontSizeY)
			end

			local cursorX,cursorY = self.CursorX,self.CursorY

			local line = self.Lines[cursorY+1] or ""
			if cursorX > #line then cursorX = #line
			elseif cursorX < 0 then cursorX = 0 end

			if cursorY >= #self.Lines then
				cursorY = math.max(0,#self.Lines-1)
			elseif cursorY < 0 then
				cursorY = 0
			end

			cursorX = cursorX + self:TabAdjust(cursorX,cursorY)

			-- Update modified
			self.CursorX = cursorX
			self.CursorY = cursorY

			local cursorVisible = (cursorX >= viewX) and (cursorY >= viewY) and (cursorX <= viewX + maxCols) and (cursorY <= viewY + maxLines)
			if cursorVisible then
				local offX = (cursorX - viewX)
				local offY = (cursorY - viewY)
				cursor.Position = UDim2.new(0,linesOffset + offX*math.ceil(self.FontSize/2) - 1,0,offY*self.FontSize)
				cursor.Size = UDim2.new(0,1,0,self.FontSize+2)
				cursor.Visible = true
				self:CursorAnim(true)
			else
				cursor.Visible = false
			end
		end

		funcs.MapNewLines = function(self)
			local newLines = {}
			local count = 1
			local text = self.Text
			local find = string.find
			local init = 1

			local pos = find(text,"\n",init,true)
			while pos do
				newLines[count] = pos
				count = count + 1
				init = pos + 1
				pos = find(text,"\n",init,true)
			end

			self.NewLines = newLines
		end

		funcs.PreHighlight = function(self)
			local start = tick()
			local text = self.Text:gsub("\\\\","  ")
			--print("BACKSLASH SUB",tick()-start)
			local textLen = #text
			local found = {}
			local foundMap = {}
			local extras = {}
			local find = string.find
			local sub = string.sub
			self.ColoredLines = {}

			local function findAll(str,pattern,typ,raw)
				local count = #found+1
				local init = 1
				local x,y,extra = find(str,pattern,init,raw)
				while x do
					found[count] = x
					foundMap[x] = typ
					if extra then
						extras[x] = extra
					end

					count = count+1
					init = y+1
					x,y,extra = find(str,pattern,init,raw)
				end
			end
			local start = tick()
			findAll(text,'"',1,true)
			findAll(text,"'",2,true)
			findAll(text,"%[(=*)%[",3)
			findAll(text,"--",4,true)
			table.sort(found)

			local newLines = self.NewLines
			local curLine = 0
			local lineTableCount = 1
			local lineStart = 0
			local lineEnd = 0
			local lastEnding = 0
			local foundHighlights = {}

			for i = 1,#found do
				local pos = found[i]
				if pos <= lastEnding then continue end

				local ending = pos
				local typ = foundMap[pos]
				if typ == 1 then
					ending = find(text,'"',pos+1,true)
					while ending and sub(text,ending-1,ending-1) == "\\" do
						ending = find(text,'"',ending+1,true)
					end
					if not ending then ending = textLen end
				elseif typ == 2 then
					ending = find(text,"'",pos+1,true)
					while ending and sub(text,ending-1,ending-1) == "\\" do
						ending = find(text,"'",ending+1,true)
					end
					if not ending then ending = textLen end
				elseif typ == 3 then
					_,ending = find(text,"]"..extras[pos].."]",pos+1,true)
					if not ending then ending = textLen end
				elseif typ == 4 then
					local ahead = foundMap[pos+2]

					if ahead == 3 then
						_,ending = find(text,"]"..extras[pos+2].."]",pos+1,true)
						if not ending then ending = textLen end
					else
						ending = find(text,"\n",pos+1,true) or textLen
					end
				end

				while pos > lineEnd do
					curLine = curLine + 1
					--lineTableCount = 1
					lineEnd = newLines[curLine] or textLen+1
				end
				while true do
					local lineTable = foundHighlights[curLine]
					if not lineTable then lineTable = {} foundHighlights[curLine] = lineTable end
					lineTable[pos] = {typ,ending}
					--lineTableCount = lineTableCount + 1

					if ending > lineEnd then
						curLine = curLine + 1
						lineEnd = newLines[curLine] or textLen+1
					else
						break
					end
				end

				lastEnding = ending
				--if i < 200 then print(curLine) end
			end
			self.PreHighlights = foundHighlights
			--print(tick()-start)
			--print(#found,curLine)
		end

		funcs.HighlightLine = function(self,line)
			local cached = self.ColoredLines[line]
			if cached then return cached end

			local sub = string.sub
			local find = string.find
			local match = string.match
			local highlights = {}
			local preHighlights = self.PreHighlights[line] or {}
			local lineText = self.Lines[line] or ""
			local lineLen = #lineText
			local lastEnding = 0
			local currentType = 0
			local lastWord = nil
			local wordBeginsDotted = false
			local funcStatus = 0
			local lineStart = self.NewLines[line-1] or 0

			local preHighlightMap = {}
			for pos,data in next,preHighlights do
				local relativePos = pos-lineStart
				if relativePos < 1 then
					currentType = data[1]
					lastEnding = data[2] - lineStart
					--warn(pos,data[2])
				else
					preHighlightMap[relativePos] = {data[1],data[2]-lineStart}
				end
			end

			for col = 1,#lineText do
				if col <= lastEnding then highlights[col] = currentType continue end

				local pre = preHighlightMap[col]
				if pre then
					currentType = pre[1]
					lastEnding = pre[2]
					highlights[col] = currentType
					wordBeginsDotted = false
					lastWord = nil
					funcStatus = 0
				else
					local char = sub(lineText,col,col)
					if find(char,"[%a_]") then
						local word = match(lineText,"[%a%d_]+",col)
						local wordType = (keywords[word] and 7) or (builtIns[word] and 8)

						lastEnding = col+#word-1

						if wordType ~= 7 then
							if wordBeginsDotted then
								local prevBuiltIn = lastWord and builtIns[lastWord]
								wordType = (prevBuiltIn and type(prevBuiltIn) == "table" and prevBuiltIn[word] and 8) or 10
							end

							if wordType ~= 8 then
								local x,y,br = find(lineText,"^%s*([%({\"'])",lastEnding+1)
								if x then
									wordType = (funcStatus > 0 and br == "(" and 16) or 9
									funcStatus = 0
								end
							end
						else
							wordType = specialKeywordsTypes[word] or wordType
							funcStatus = (word == "function" and 1 or 0)
						end

						lastWord = word
						wordBeginsDotted = false
						if funcStatus > 0 then funcStatus = 1 end

						if wordType then
							currentType = wordType
							highlights[col] = currentType
						else
							currentType = nil
						end
					elseif find(char,"%p") then
						local isDot = (char == ".")
						local isNum = isDot and find(sub(lineText,col+1,col+1),"%d")
						highlights[col] = (isNum and 6 or 5)

						if not isNum then
							local dotStr = isDot and match(lineText,"%.%.?%.?",col)
							if dotStr and #dotStr > 1 then
								currentType = 5
								lastEnding = col+#dotStr-1
								wordBeginsDotted = false
								lastWord = nil
								funcStatus = 0
							else
								if isDot then
									if wordBeginsDotted then
										lastWord = nil
									else
										wordBeginsDotted = true
									end
								else
									wordBeginsDotted = false
									lastWord = nil
								end

								funcStatus = ((isDot or char == ":") and funcStatus == 1 and 2) or 0
							end
						end
					elseif find(char,"%d") then
						local _,endPos = find(lineText,"%x+",col)
						local endPart = sub(lineText,endPos,endPos+1)
						if (endPart == "e+" or endPart == "e-") and find(sub(lineText,endPos+2,endPos+2),"%d") then
							endPos = endPos + 1
						end
						currentType = 6
						lastEnding = endPos
						highlights[col] = 6
						wordBeginsDotted = false
						lastWord = nil
						funcStatus = 0
					else
						highlights[col] = currentType
						local _,endPos = find(lineText,"%s+",col)
						if endPos then
							lastEnding = endPos
						end
					end
				end
			end

			self.ColoredLines[line] = highlights
			return highlights
		end

		funcs.Refresh = function(self)
			local start = tick()

			local linesFrame = self.Frame.Lines
			local hSize = math.max(0,linesFrame.AbsoluteSize.X)
			local vSize = math.max(0,linesFrame.AbsoluteSize.Y)
			local maxLines = math.ceil(vSize / self.FontSize)
			local maxCols = math.ceil(hSize / math.ceil(self.FontSize/2))
			local gsub = string.gsub
			local sub = string.sub

			local viewX,viewY = self.ViewX,self.ViewY

			local lineNumberStr = ""

			for row = 1,maxLines do
				local lineFrame = self.LineFrames[row]
				if not lineFrame then
					lineFrame = Instance.new("Frame")
					lineFrame.Name = "Line"
					lineFrame.Position = UDim2.new(0,0,0,(row-1)*self.FontSize)
					lineFrame.Size = UDim2.new(1,0,0,self.FontSize)
					lineFrame.BorderSizePixel = 0
					lineFrame.BackgroundTransparency = 1

					local selectionHighlight = Instance.new("Frame")
					selectionHighlight.Name = "SelectionHighlight"
					selectionHighlight.BorderSizePixel = 0
					selectionHighlight.BackgroundColor3 = Settings.Theme.Syntax.SelectionBack
					selectionHighlight.Parent = lineFrame

					local label = Instance.new("TextLabel")
					label.Name = "Label"
					label.BackgroundTransparency = 1
					label.Font = Enum.Font.Code
					label.TextSize = self.FontSize
					label.Size = UDim2.new(1,0,0,self.FontSize)
					label.RichText = true
					label.TextXAlignment = Enum.TextXAlignment.Left
					label.TextColor3 = self.Colors.Text
					label.ZIndex = 2
					label.Parent = lineFrame

					lineFrame.Parent = linesFrame
					self.LineFrames[row] = lineFrame
				end

				local relaY = viewY + row
				local lineText = self.Lines[relaY] or ""
				local resText = ""
				local highlights = self:HighlightLine(relaY)
				local colStart = viewX + 1

				local richTemplates = self.RichTemplates
				local textTemplate = richTemplates.Text
				local selectionTemplate = richTemplates.Selection
				local curType = highlights[colStart]
				local curTemplate = richTemplates[typeMap[curType]] or textTemplate

				-- Selection Highlight
				local selectionRange = self.SelectionRange
				local selPos1 = selectionRange[1]
				local selPos2 = selectionRange[2]
				local selRow,selColumn = selPos1[2],selPos1[1]
				local sel2Row,sel2Column = selPos2[2],selPos2[1]
				local selRelaX,selRelaY = viewX,relaY-1

				if selRelaY >= selPos1[2] and selRelaY <= selPos2[2] then
					local fontSizeX = math.ceil(self.FontSize/2)
					local posX = (selRelaY == selPos1[2] and selPos1[1] or 0) - viewX
					local sizeX = (selRelaY == selPos2[2] and selPos2[1]-posX-viewX or maxCols+viewX)

					lineFrame.SelectionHighlight.Position = UDim2.new(0,posX*fontSizeX,0,0)
					lineFrame.SelectionHighlight.Size = UDim2.new(0,sizeX*fontSizeX,1,0)
					lineFrame.SelectionHighlight.Visible = true
				else
					lineFrame.SelectionHighlight.Visible = false
				end

				-- Selection Text Color for first char
				local inSelection = selRelaY >= selRow and selRelaY <= sel2Row and (selRelaY == selRow and viewX >= selColumn or selRelaY ~= selRow) and (selRelaY == sel2Row and viewX < sel2Column or selRelaY ~= sel2Row)
				if inSelection then
					curType = -999
					curTemplate = selectionTemplate
				end

				for col = 2,maxCols do
					local relaX = viewX + col
					local selRelaX = relaX-1
					local posType = highlights[relaX]

					-- Selection Text Color
					local inSelection = selRelaY >= selRow and selRelaY <= sel2Row and (selRelaY == selRow and selRelaX >= selColumn or selRelaY ~= selRow) and (selRelaY == sel2Row and selRelaX < sel2Column or selRelaY ~= sel2Row)
					if inSelection then
						posType = -999
					end

					if posType ~= curType then
						local template = (inSelection and selectionTemplate) or richTemplates[typeMap[posType]] or textTemplate

						if template ~= curTemplate then
							local nextText = gsub(sub(lineText,colStart,relaX-1),"['\"<>&]",richReplace)
							resText = resText .. (curTemplate ~= textTemplate and (curTemplate .. nextText .. "</font>") or nextText)
							colStart = relaX
							curTemplate = template
						end
						curType = posType
					end
				end

				local lastText = gsub(sub(lineText,colStart,viewX+maxCols),"['\"<>&]",richReplace)
				--warn("SUB",colStart,viewX+maxCols-1)
				if #lastText > 0 then
					resText = resText .. (curTemplate ~= textTemplate and (curTemplate .. lastText .. "</font>") or lastText)
				end

				if self.Lines[relaY] then

					-- REMOVED LINE HIGHLIGHT DUE TO BUG OFFSET
					lineNumberStr = lineNumberStr .. (relaY == self.CursorY and ("<b>"..relaY.."</b>\n") or relaY .. "\n")
					--lineNumberStr = lineNumberStr .. (relaY == self.CursorY and (relaY.."\n") or relaY .. "\n")
				end

				lineFrame.Label.Text = resText
			end

			for i = maxLines+1,#self.LineFrames do
				self.LineFrames[i]:Destroy()
				self.LineFrames[i] = nil
			end

			self.Frame.LineNumbers.Text = lineNumberStr
			self:UpdateCursor()

			--print("REFRESH TIME",tick()-start)
		end

		funcs.UpdateView = function(self)
			local totalLinesStr = tostring(#self.Lines)
			local fontWidth = math.ceil(self.FontSize / 2)
			local linesOffset = #totalLinesStr*fontWidth + 4*fontWidth

			local linesFrame = self.Frame.Lines
			local hSize = linesFrame.AbsoluteSize.X
			local vSize = linesFrame.AbsoluteSize.Y
			local maxLines = math.ceil(vSize / self.FontSize)
			local totalWidth = self.MaxTextCols*fontWidth
			local scrollV = self.ScrollV
			local scrollH = self.ScrollH

			scrollV.VisibleSpace = maxLines
			scrollV.TotalSpace = #self.Lines + 1
			scrollH.VisibleSpace = math.ceil(hSize/fontWidth)
			scrollH.TotalSpace = self.MaxTextCols + 1

			scrollV.Gui.Visible = #self.Lines + 1 > maxLines
			scrollH.Gui.Visible = totalWidth > hSize

			local oldOffsets = self.FrameOffsets
			self.FrameOffsets = Vector2.new(scrollV.Gui.Visible and -16 or 0, scrollH.Gui.Visible and -16 or 0)
			if oldOffsets ~= self.FrameOffsets then
				self:UpdateView()
			else
				scrollV:ScrollTo(self.ViewY,true)
				scrollH:ScrollTo(self.ViewX,true)

				if scrollV.Gui.Visible and scrollH.Gui.Visible then
					scrollV.Gui.Size = UDim2.new(0,16,1,-16)
					scrollH.Gui.Size = UDim2.new(1,-16,0,16)
					self.GuiElems.ScrollCorner.Visible = true
				else
					scrollV.Gui.Size = UDim2.new(0,16,1,0)
					scrollH.Gui.Size = UDim2.new(1,0,0,16)
					self.GuiElems.ScrollCorner.Visible = false
				end

				self.ViewY = scrollV.Index
				self.ViewX = scrollH.Index
				self.Frame.Lines.Position = UDim2.new(0,linesOffset,0,0)
				self.Frame.Lines.Size = UDim2.new(1,-linesOffset+oldOffsets.X,1,oldOffsets.Y)
				self.Frame.LineNumbers.Position = UDim2.new(0,fontWidth,0,0)
				self.Frame.LineNumbers.Size = UDim2.new(0,#totalLinesStr*fontWidth,1,oldOffsets.Y)
				self.Frame.LineNumbers.TextSize = self.FontSize
			end
		end

		funcs.ProcessTextChange = function(self)
			local maxCols = 0
			local lines = self.Lines

			for i = 1,#lines do
				local lineLen = #lines[i]
				if lineLen > maxCols then
					maxCols = lineLen
				end
			end

			self.MaxTextCols = maxCols
			self:UpdateView()	
			self.Text = table.concat(self.Lines,"\n")
			self:MapNewLines()
			self:PreHighlight()
			self:Refresh()
			--self.TextChanged:Fire()
		end

		funcs.ConvertText = function(self,text,toEditor)
			if toEditor then
				--return text:gsub("\t",(" %s%s "):format(tabSub,tabSub))
				return text:gsub("\t","    ") -- Fixed unknown unicode showing when pressing TAB
			else
				return text:gsub((" %s%s "):format(tabSub,tabSub),"\t")
			end
		end

		funcs.GetText = function(self) -- TODO: better (use new tab format)
			local source = table.concat(self.Lines,"\n")
			return self:ConvertText(source,false) -- Tab Convert
		end

		funcs.SetText = function(self,txt)
			txt = self:ConvertText(txt,true) -- Tab Convert
			local lines = self.Lines
			table.clear(lines)
			local count = 1

			for line in txt:gmatch("([^\n\r]*)[\n\r]?") do
				local len = #line
				lines[count] = line
				count = count + 1
			end

			self:ProcessTextChange()
		end

		funcs.MakeRichTemplates = function(self)
			local floor = math.floor
			local templates = {}

			for name,color in pairs(self.Colors) do
				templates[name] = ('<font color="rgb(%s,%s,%s)">'):format(floor(color.r*255),floor(color.g*255),floor(color.b*255))
			end

			self.RichTemplates = templates
		end

		funcs.ApplyTheme = function(self)
			local colors = Settings.Theme.Syntax
			self.Colors = colors
			self.Frame.LineNumbers.TextColor3 = colors.Text
			self.Frame.BackgroundColor3 = colors.Background
		end

		local mt = {__index = funcs}

		local function new()
			if not builtInInited then initBuiltIn() end

			local scrollV = Lib.ScrollBar.new()
			local scrollH = Lib.ScrollBar.new(true)
			scrollH.Gui.Position = UDim2.new(0,0,1,-16)
			local obj = setmetatable({
				FontSize = 16,
				ViewX = 0,
				ViewY = 0,
				Colors = Settings.Theme.Syntax,
				ColoredLines = {},
				Lines = {""},
				LineFrames = {},
				Editable = true,
				Editing = false,
				CursorX = 0,
				CursorY = 0,
				FloatCursorX = 0,
				Text = "",
				PreHighlights = {},
				SelectionRange = {{-1,-1},{-1,-1}},
				NewLines = {},
				FrameOffsets = Vector2.new(0,0),
				MaxTextCols = 0,
				ScrollV = scrollV,
				ScrollH = scrollH
			},mt)

			scrollV.WheelIncrement = 3
			scrollH.Increment = 2
			scrollH.WheelIncrement = 7

			scrollV.Scrolled:Connect(function()
				obj.ViewY = scrollV.Index
				obj:Refresh()
			end)

			scrollH.Scrolled:Connect(function()
				obj.ViewX = scrollH.Index
				obj:Refresh()
			end)

			makeFrame(obj)
			obj:MakeRichTemplates()
			obj:ApplyTheme()
			scrollV:SetScrollFrame(obj.Frame.Lines)
			scrollV.Gui.Parent = obj.Frame
			scrollH.Gui.Parent = obj.Frame

			obj:UpdateView()
			obj.Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				obj:UpdateView()
				obj:Refresh()
			end)

			return obj
		end

		return {new = new}
	end)()

	Lib.Checkbox = (function()
		local funcs = {}
		local c3 = Color3.fromRGB
		local v2 = Vector2.new
		local ud2s = UDim2.fromScale
		local ud2o = UDim2.fromOffset
		local ud = UDim.new
		local max = math.max
		local new = Instance.new
		local TweenSize = new("Frame").TweenSize
		local ti = TweenInfo.new
		local delay = delay

		local function ripple(object, color)
			local circle = new('Frame')
			circle.BackgroundColor3 = color
			circle.BackgroundTransparency = 0.75
			circle.BorderSizePixel = 0
			circle.AnchorPoint = v2(0.5, 0.5)
			circle.Size = ud2o()
			circle.Position = ud2s(0.5, 0.5)
			circle.Parent = object
			local rounding = new('UICorner')
			rounding.CornerRadius = ud(1)
			rounding.Parent = circle

			local abssz = object.AbsoluteSize
			local size = max(abssz.X, abssz.Y) * 5/3

			TweenSize(circle, ud2o(size, size), "Out", "Quart", 0.4)
			service.TweenService:Create(circle, ti(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {BackgroundTransparency = 1}):Play()

			service.Debris:AddItem(circle, 0.4)
		end

		local function initGui(self,frame)
			local checkbox = frame or create({
				{1,"ImageButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="Checkbox",Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,16,0,16),}},
				{2,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ripples",Parent={1},Size=UDim2.new(1,0,1,0),}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.10196078568697,0.10196078568697,0.10196078568697),BorderSizePixel=0,Name="outline",Parent={1},Size=UDim2.new(0,16,0,16),}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderSizePixel=0,Name="filler",Parent={3},Position=UDim2.new(0,1,0,1),Size=UDim2.new(0,14,0,14),}},
				{5,"Frame",{BackgroundColor3=Color3.new(0.90196084976196,0.90196084976196,0.90196084976196),BorderSizePixel=0,Name="top",Parent={4},Size=UDim2.new(0,16,0,0),}},
				{6,"Frame",{AnchorPoint=Vector2.new(0,1),BackgroundColor3=Color3.new(0.90196084976196,0.90196084976196,0.90196084976196),BorderSizePixel=0,Name="bottom",Parent={4},Position=UDim2.new(0,0,0,14),Size=UDim2.new(0,16,0,0),}},
				{7,"Frame",{BackgroundColor3=Color3.new(0.90196084976196,0.90196084976196,0.90196084976196),BorderSizePixel=0,Name="left",Parent={4},Size=UDim2.new(0,0,0,16),}},
				{8,"Frame",{AnchorPoint=Vector2.new(1,0),BackgroundColor3=Color3.new(0.90196084976196,0.90196084976196,0.90196084976196),BorderSizePixel=0,Name="right",Parent={4},Position=UDim2.new(0,14,0,0),Size=UDim2.new(0,0,0,16),}},
				{9,"Frame",{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,ClipsDescendants=true,Name="checkmark",Parent={4},Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0,0,0,20),}},
				{10,"ImageLabel",{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Image="rbxassetid://6234266378",Parent={9},Position=UDim2.new(0.5,0,0.5,0),ScaleType=3,Size=UDim2.new(0,15,0,11),}},
				{11,"ImageLabel",{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6401617475",ImageColor3=Color3.new(0.20784313976765,0.69803923368454,0.98431372642517),Name="checkmark2",Parent={4},Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0,12,0,12),Visible=false,}},
				{12,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6425281788",ImageTransparency=0.20000000298023,Name="middle",Parent={4},ScaleType=2,Size=UDim2.new(1,0,1,0),TileSize=UDim2.new(0,2,0,2),Visible=false,}},
				{13,"UICorner",{CornerRadius=UDim.new(0,2),Parent={3},}},
			})
			local outline = checkbox.outline
			local filler = outline.filler
			local checkmark = filler.checkmark
			local ripples_container = checkbox.ripples

			-- walls
			local top, bottom, left, right = filler.top, filler.bottom, filler.left, filler.right

			self.Gui = checkbox
			self.GuiElems = {
				Top = top,
				Bottom = bottom,
				Left = left,
				Right = right,
				Outline = outline,
				Filler = filler,
				Checkmark = checkmark,
				Checkmark2 = filler.checkmark2,
				Middle = filler.middle
			}
	
			-- New:
			--[[checkbox.Activated:Connect(function()
				if Lib.CheckMouseInGui(checkbox) then
					if self.Style == 0 then
						ripple(ripples_container, self.Disabled and self.Colors.Disabled or self.Colors.Primary)
					end

					if not self.Disabled then
						self:SetState(not self.Toggled,true)
					else
						self:Paint()
					end

					self.OnInput:Fire()
				end
			end)]]
			
			-- Best input compatibility:
			checkbox.MouseButton1Up:Connect(function()
				if Lib.CheckMouseInGui(checkbox) then
					if self.Style == 0 then
						ripple(ripples_container, self.Disabled and self.Colors.Disabled or self.Colors.Primary)
					end

					if not self.Disabled then
						self:SetState(not self.Toggled,true)
					else
						self:Paint()
					end

					self.OnInput:Fire()
				end
			end)

			-- Old:
			--[[checkbox.InputBegan:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 then
					local release
					release = service.UserInputService.InputEnded:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							release:Disconnect()

							if Lib.CheckMouseInGui(checkbox) then
								if self.Style == 0 then
									ripple(ripples_container, self.Disabled and self.Colors.Disabled or self.Colors.Primary)
								end

								if not self.Disabled then
									self:SetState(not self.Toggled,true)
								else
									self:Paint()
								end
								
								self.OnInput:Fire()
							end
						end
					end)
				end
			end)]]

			self:Paint()
		end

		funcs.Collapse = function(self,anim)
			local guiElems = self.GuiElems
			if anim then
				TweenSize(guiElems.Top, ud2o(14, 14), "In", "Quart", 4/15, true)
				TweenSize(guiElems.Bottom, ud2o(14, 14), "In", "Quart", 4/15, true)
				TweenSize(guiElems.Left, ud2o(14, 14), "In", "Quart", 4/15, true)
				TweenSize(guiElems.Right, ud2o(14, 14), "In", "Quart", 4/15, true)
			else
				guiElems.Top.Size = ud2o(14, 14)
				guiElems.Bottom.Size = ud2o(14, 14)
				guiElems.Left.Size = ud2o(14, 14)
				guiElems.Right.Size = ud2o(14, 14)
			end
		end

		funcs.Expand = function(self,anim)
			local guiElems = self.GuiElems
			if anim then
				TweenSize(guiElems.Top, ud2o(14, 0), "InOut", "Quart", 4/15, true)
				TweenSize(guiElems.Bottom, ud2o(14, 0), "InOut", "Quart", 4/15, true)
				TweenSize(guiElems.Left, ud2o(0, 14), "InOut", "Quart", 4/15, true)
				TweenSize(guiElems.Right, ud2o(0, 14), "InOut", "Quart", 4/15, true)
			else
				guiElems.Top.Size = ud2o(14, 0)
				guiElems.Bottom.Size = ud2o(14, 0)
				guiElems.Left.Size = ud2o(0, 14)
				guiElems.Right.Size = ud2o(0, 14)
			end
		end

		funcs.Paint = function(self)
			local guiElems = self.GuiElems

			if self.Style == 0 then
				local color_base = self.Disabled and self.Colors.Disabled
				guiElems.Outline.BackgroundColor3 = color_base or (self.Toggled and self.Colors.Primary) or self.Colors.Secondary
				local walls_color = color_base or self.Colors.Primary
				guiElems.Top.BackgroundColor3 = walls_color
				guiElems.Bottom.BackgroundColor3 = walls_color
				guiElems.Left.BackgroundColor3 = walls_color
				guiElems.Right.BackgroundColor3 = walls_color
			else
				guiElems.Outline.BackgroundColor3 = self.Disabled and self.Colors.Disabled or self.Colors.Secondary
				guiElems.Filler.BackgroundColor3 = self.Disabled and self.Colors.DisabledBackground or self.Colors.Background
				guiElems.Checkmark2.ImageColor3 = self.Disabled and self.Colors.DisabledCheck or self.Colors.Primary
			end
		end

		funcs.SetState = function(self,val,anim)
			self.Toggled = val

			if self.OutlineColorTween then self.OutlineColorTween:Cancel() end
			local setStateTime = tick()
			self.LastSetStateTime = setStateTime

			if self.Toggled then
				if self.Style == 0 then
					if anim then
						self.OutlineColorTween = service.TweenService:Create(self.GuiElems.Outline, ti(4/15, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {BackgroundColor3 = self.Colors.Primary})
						self.OutlineColorTween:Play()
						delay(0.15, function()
							if setStateTime ~= self.LastSetStateTime then return end
							self:Paint()
							TweenSize(self.GuiElems.Checkmark, ud2o(14, 20), "Out", "Bounce", 2/15, true)
						end)
					else
						self.GuiElems.Outline.BackgroundColor3 = self.Colors.Primary
						self:Paint()
						self.GuiElems.Checkmark.Size = ud2o(14, 20)
					end
					self:Collapse(anim)
				else
					self:Paint()
					self.GuiElems.Checkmark2.Visible = true
					self.GuiElems.Middle.Visible = false
				end
			else
				if self.Style == 0 then
					if anim then
						self.OutlineColorTween = service.TweenService:Create(self.GuiElems.Outline, ti(4/15, Enum.EasingStyle.Circular, Enum.EasingDirection.In), {BackgroundColor3 = self.Colors.Secondary})
						self.OutlineColorTween:Play()
						delay(0.15, function()
							if setStateTime ~= self.LastSetStateTime then return end
							self:Paint()
							TweenSize(self.GuiElems.Checkmark, ud2o(0, 20), "Out", "Quad", 1/15, true)
						end)
					else
						self.GuiElems.Outline.BackgroundColor3 = self.Colors.Secondary
						self:Paint()
						self.GuiElems.Checkmark.Size = ud2o(0, 20)
					end
					self:Expand(anim)
				else
					self:Paint()
					self.GuiElems.Checkmark2.Visible = false
					self.GuiElems.Middle.Visible = self.Toggled == nil
				end
			end
		end

		local mt = {__index = funcs}

		local function new(style)
			local obj = setmetatable({
				Toggled = false,
				Disabled = false,
				OnInput = Lib.Signal.new(),
				Style = style or 0,
				Colors = {
					Background = c3(36,36,36),
					Primary = c3(49,176,230),
					Secondary = c3(25,25,25),
					Disabled = c3(64,64,64),
					DisabledBackground = c3(52,52,52),
					DisabledCheck = c3(80,80,80)
				}
			},mt)
			initGui(obj)
			return obj
		end

		local function fromFrame(frame)
			local obj = setmetatable({
				Toggled = false,
				Disabled = false,
				Colors = {
					Background = c3(36,36,36),
					Primary = c3(49,176,230),
					Secondary = c3(25,25,25),
					Disabled = c3(64,64,64),
					DisabledBackground = c3(52,52,52)
				}
			},mt)
			initGui(obj,frame)
			return obj
		end

		return {new = new, fromFrame}
	end)()

	Lib.BrickColorPicker = (function()
		local funcs = {}
		local paletteCount = 0
		local mouse = service.Players.LocalPlayer:GetMouse()
		local hexStartX = 4
		local hexSizeX = 27
		local hexTriangleStart = 1
		local hexTriangleSize = 8

		local bottomColors = {
			Color3.fromRGB(17,17,17),
			Color3.fromRGB(99,95,98),
			Color3.fromRGB(163,162,165),
			Color3.fromRGB(205,205,205),
			Color3.fromRGB(223,223,222),
			Color3.fromRGB(237,234,234),
			Color3.fromRGB(27,42,53),
			Color3.fromRGB(91,93,105),
			Color3.fromRGB(159,161,172),
			Color3.fromRGB(202,203,209),
			Color3.fromRGB(231,231,236),
			Color3.fromRGB(248,248,248)
		}

		local function isMouseInHexagon(hex, touchPos)
			local relativeX = touchPos.X - hex.AbsolutePosition.X
			local relativeY = touchPos.Y - hex.AbsolutePosition.Y
			if relativeX >= hexStartX and relativeX < hexStartX + hexSizeX then
				relativeX = relativeX - 4
				local relativeWidth = (13 - math.min(relativeX, 26 - relativeX)) / 13
				if relativeY >= hexTriangleStart + hexTriangleSize * relativeWidth and relativeY < hex.AbsoluteSize.Y - hexTriangleStart - hexTriangleSize * relativeWidth then
					return true
				end
			end
			return false
		end

		local function hexInput(self, hex, color)
			hex.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					if isMouseInHexagon(hex, input.Position) then
						self.OnSelect:Fire(color)
						self:Close()
					end
				end
			end)

			hex.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if isMouseInHexagon(hex, input.Position) then
						self.OnPreview:Fire(color)
					end
				end
			end)
		end

		local function createGui(self)
			local gui = create({
				{1,"ScreenGui",{Name="BrickColor",}},
				{2,"Frame",{Active=true,BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),Parent={1},Position=UDim2.new(0.40000000596046,0,0.40000000596046,0),Size=UDim2.new(0,337,0,380),}},
				{3,"TextButton",{BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,Font=3,Name="MoreColors",Parent={2},Position=UDim2.new(0,5,1,-30),Size=UDim2.new(1,-10,0,25),Text="More Colors",TextColor3=Color3.new(1,1,1),TextSize=14,}},
				{4,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Image="rbxassetid://1281023007",ImageColor3=Color3.new(0.33333334326744,0.33333334326744,0.49803924560547),Name="Hex",Parent={2},Size=UDim2.new(0,35,0,35),Visible=false,}},
			})
			local colorFrame = gui.Frame
			local hex = colorFrame.Hex

			for row = 1,13 do
				local columns = math.min(row,14-row)+6
				for column = 1,columns do
					local nextColor = BrickColor.palette(paletteCount).Color
					local newHex = hex:Clone()
					newHex.Position = UDim2.new(0, (column-1)*25-(columns-7)*13+3*26 + 1, 0, (row-1)*23 + 4)
					newHex.ImageColor3 = nextColor
					newHex.Visible = true
					hexInput(self,newHex,nextColor)
					newHex.Parent = colorFrame
					paletteCount = paletteCount + 1
				end
			end

			for column = 1,12 do
				local nextColor = bottomColors[column]
				local newHex = hex:Clone()
				newHex.Position = UDim2.new(0, (column-1)*25-(12-7)*13+3*26 + 3, 0, 308)
				newHex.ImageColor3 = nextColor
				newHex.Visible = true
				hexInput(self,newHex,nextColor)
				newHex.Parent = colorFrame
				paletteCount = paletteCount + 1
			end

			colorFrame.MoreColors.MouseButton1Click:Connect(function()
				self.OnMoreColors:Fire()
				self:Close()
			end)

			self.Gui = gui
		end

		funcs.SetMoreColorsVisible = function(self,vis)
			local colorFrame = self.Gui.Frame
			colorFrame.Size = UDim2.new(0,337,0,380 - (not vis and 33 or 0))
			colorFrame.MoreColors.Visible = vis
		end

		funcs.Show = function(self,x,y,prevColor)
			self.PrevColor = prevColor or self.PrevColor

			local reverseY = false

			local x,y = x or mouse.X, y or mouse.Y
			local maxX,maxY = mouse.ViewSizeX,mouse.ViewSizeY
			Lib.ShowGui(self.Gui)
			local sizeX,sizeY = self.Gui.Frame.AbsoluteSize.X,self.Gui.Frame.AbsoluteSize.Y

			if x + sizeX > maxX then x = self.ReverseX and x - sizeX or maxX - sizeX end
			if y + sizeY > maxY then reverseY = true end

			local closable = false
			if self.CloseEvent then self.CloseEvent:Disconnect() end

			self.CloseEvent = service.UserInputService.InputBegan:Connect(function(input)
				if not closable or (input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch) then
					return
				end

				if not Lib.CheckMouseInGui(self.Gui.Frame) then
					self.CloseEvent:Disconnect()
					self:Close()
				end
			end)


			if reverseY then
				local newY = y - sizeY - (self.ReverseYOffset or 0)
				y = newY >= 0 and newY or 0
			end

			self.Gui.Frame.Position = UDim2.new(0,x,0,y)

			Lib.FastWait()
			closable = true
		end

		funcs.Close = function(self)
			self.Gui.Parent = nil
			self.OnCancel:Fire()
		end

		local mt = {__index = funcs}

		local function new()
			local obj = setmetatable({
				OnPreview = Lib.Signal.new(),
				OnSelect = Lib.Signal.new(),
				OnCancel = Lib.Signal.new(),
				OnMoreColors = Lib.Signal.new(),
				PrevColor = Color3.new(0,0,0)
			}, mt)
			createGui(obj)
			return obj
		end

		return {new = new}
	end)()

	Lib.ColorPicker = (function() -- TODO: Convert to newer class model
		local funcs = {}

		local function new()
			local newMt = setmetatable({},{})

			newMt.OnSelect = Lib.Signal.new()
			newMt.OnCancel = Lib.Signal.new()
			newMt.OnPreview = Lib.Signal.new()

			local guiContents = create({
				{1,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,ClipsDescendants=true,Name="Content",Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),}},
				{2,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="BasicColors",Parent={1},Position=UDim2.new(0,5,0,5),Size=UDim2.new(0,180,0,200),}},
				{3,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={2},Position=UDim2.new(0,0,0,-5),Size=UDim2.new(1,0,0,26),Text="Basic Colors",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Blue",Parent={1},Position=UDim2.new(1,-63,0,255),Size=UDim2.new(0,52,0,16),}},
				{5,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={4},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{6,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={5},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{7,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={6},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{8,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={7},Size=UDim2.new(0,16,0,8),}},
				{9,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={8},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{10,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={8},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{11,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={8},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{12,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={6},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{13,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={12},Size=UDim2.new(0,16,0,8),}},
				{14,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={13},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{15,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={13},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{16,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={13},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{17,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={4},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Blue:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{18,"Frame",{BackgroundColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,ClipsDescendants=true,Name="ColorSpaceFrame",Parent={1},Position=UDim2.new(1,-261,0,4),Size=UDim2.new(0,222,0,202),}},
				{19,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),BorderSizePixel=0,Image="rbxassetid://1072518406",Name="ColorSpace",Parent={18},Position=UDim2.new(0,1,0,1),Size=UDim2.new(0,220,0,200),}},
				{20,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="Scope",Parent={19},Position=UDim2.new(0,210,0,190),Size=UDim2.new(0,20,0,20),}},
				{21,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Name="Line",Parent={20},Position=UDim2.new(0,9,0,0),Size=UDim2.new(0,2,0,20),}},
				{22,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Name="Line",Parent={20},Position=UDim2.new(0,0,0,9),Size=UDim2.new(0,20,0,2),}},
				{23,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="CustomColors",Parent={1},Position=UDim2.new(0,5,0,210),Size=UDim2.new(0,180,0,90),}},
				{24,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={23},Size=UDim2.new(1,0,0,20),Text="Custom Colors (RC = Set)",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{25,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Green",Parent={1},Position=UDim2.new(1,-63,0,233),Size=UDim2.new(0,52,0,16),}},
				{26,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={25},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{27,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={26},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{28,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={27},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{29,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={28},Size=UDim2.new(0,16,0,8),}},
				{30,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={29},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{31,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={29},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{32,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={29},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{33,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={27},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{34,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={33},Size=UDim2.new(0,16,0,8),}},
				{35,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={34},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{36,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={34},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{37,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={34},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{38,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={25},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Green:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{39,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Hue",Parent={1},Position=UDim2.new(1,-180,0,211),Size=UDim2.new(0,52,0,16),}},
				{40,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={39},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{41,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={40},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{42,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={41},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{43,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={42},Size=UDim2.new(0,16,0,8),}},
				{44,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={43},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{45,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={43},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{46,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={43},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{47,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={41},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{48,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={47},Size=UDim2.new(0,16,0,8),}},
				{49,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={48},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{50,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={48},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{51,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={48},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{52,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={39},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Hue:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{53,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Name="Preview",Parent={1},Position=UDim2.new(1,-260,0,211),Size=UDim2.new(0,35,1,-245),}},
				{54,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Red",Parent={1},Position=UDim2.new(1,-63,0,211),Size=UDim2.new(0,52,0,16),}},
				{55,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={54},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{56,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={55},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{57,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={56},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{58,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={57},Size=UDim2.new(0,16,0,8),}},
				{59,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={58},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{60,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={58},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{61,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={58},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{62,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={56},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{63,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={62},Size=UDim2.new(0,16,0,8),}},
				{64,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={63},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{65,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={63},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{66,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={63},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{67,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={54},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Red:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{68,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Sat",Parent={1},Position=UDim2.new(1,-180,0,233),Size=UDim2.new(0,52,0,16),}},
				{69,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={68},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{70,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={69},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{71,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={70},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{72,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={71},Size=UDim2.new(0,16,0,8),}},
				{73,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={72},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{74,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={72},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{75,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={72},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{76,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={70},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{77,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={76},Size=UDim2.new(0,16,0,8),}},
				{78,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={77},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{79,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={77},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{80,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={77},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{81,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={68},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Sat:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{82,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Val",Parent={1},Position=UDim2.new(1,-180,0,255),Size=UDim2.new(0,52,0,16),}},
				{83,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Font=3,Name="Input",Parent={82},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,50,0,16),Text="255",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{84,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={83},Position=UDim2.new(1,-16,0,0),Size=UDim2.new(0,16,1,0),}},
				{85,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Up",Parent={84},Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{86,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={85},Size=UDim2.new(0,16,0,8),}},
				{87,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={86},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,1),}},
				{88,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={86},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{89,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={86},Position=UDim2.new(0,6,0,5),Size=UDim2.new(0,5,0,1),}},
				{90,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Down",Parent={84},Position=UDim2.new(0,0,0,8),Size=UDim2.new(1,0,0,8),Text="",TextSize=14,}},
				{91,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={90},Size=UDim2.new(0,16,0,8),}},
				{92,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={91},Position=UDim2.new(0,8,0,5),Size=UDim2.new(0,1,0,1),}},
				{93,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={91},Position=UDim2.new(0,7,0,4),Size=UDim2.new(0,3,0,1),}},
				{94,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={91},Position=UDim2.new(0,6,0,3),Size=UDim2.new(0,5,0,1),}},
				{95,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={82},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Val:",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{96,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Cancel",Parent={1},Position=UDim2.new(1,-105,1,-28),Size=UDim2.new(0,100,0,25),Text="Cancel",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{97,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Ok",Parent={1},Position=UDim2.new(1,-210,1,-28),Size=UDim2.new(0,100,0,25),Text="OK",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{98,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Image="rbxassetid://1072518502",Name="ColorStrip",Parent={1},Position=UDim2.new(1,-30,0,5),Size=UDim2.new(0,13,0,200),}},
				{99,"Frame",{BackgroundColor3=Color3.new(0.3137255012989,0.3137255012989,0.3137255012989),BackgroundTransparency=1,BorderSizePixel=0,Name="ArrowFrame",Parent={1},Position=UDim2.new(1,-16,0,1),Size=UDim2.new(0,5,0,208),}},
				{100,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={99},Position=UDim2.new(0,-2,0,-4),Size=UDim2.new(0,8,0,16),}},
				{101,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,2,0,8),Size=UDim2.new(0,1,0,1),}},
				{102,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,3,0,7),Size=UDim2.new(0,1,0,3),}},
				{103,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,4,0,6),Size=UDim2.new(0,1,0,5),}},
				{104,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,5,0,5),Size=UDim2.new(0,1,0,7),}},
				{105,"Frame",{BackgroundColor3=Color3.new(0,0,0),BorderSizePixel=0,Parent={100},Position=UDim2.new(0,6,0,4),Size=UDim2.new(0,1,0,9),}},
			})
			local window = Lib.Window.new()
			window.Resizable = false
			window.Alignable = false
			window:SetTitle("Color Picker")
			window:Resize(450,330)
			for i,v in pairs(guiContents:GetChildren()) do
				v.Parent = window.GuiElems.Content
			end
			newMt.Window = window
			newMt.Gui = window.Gui
			local pickerGui = window.Gui.Main
			local pickerTopBar = pickerGui.TopBar
			local pickerFrame = pickerGui.Content
			local colorSpace = pickerFrame.ColorSpaceFrame.ColorSpace
			local colorStrip = pickerFrame.ColorStrip
			local previewFrame = pickerFrame.Preview
			local basicColorsFrame = pickerFrame.BasicColors
			local customColorsFrame = pickerFrame.CustomColors
			local okButton = pickerFrame.Ok
			local cancelButton = pickerFrame.Cancel
			local closeButton = pickerTopBar.Close

			local colorScope = colorSpace.Scope
			local colorArrow = pickerFrame.ArrowFrame.Arrow

			local hueInput = pickerFrame.Hue.Input
			local satInput = pickerFrame.Sat.Input
			local valInput = pickerFrame.Val.Input

			local redInput = pickerFrame.Red.Input
			local greenInput = pickerFrame.Green.Input
			local blueInput = pickerFrame.Blue.Input

			local user = service.UserInputService
			local mouse = service.Players.LocalPlayer:GetMouse()

			local hue,sat,val = 0,0,1
			local red,green,blue = 1,1,1
			local chosenColor = Color3.new(0,0,0)

			local basicColors = {Color3.new(0,0,0),Color3.new(0.66666668653488,0,0),Color3.new(0,0.33333334326744,0),Color3.new(0.66666668653488,0.33333334326744,0),Color3.new(0,0.66666668653488,0),Color3.new(0.66666668653488,0.66666668653488,0),Color3.new(0,1,0),Color3.new(0.66666668653488,1,0),Color3.new(0,0,0.49803924560547),Color3.new(0.66666668653488,0,0.49803924560547),Color3.new(0,0.33333334326744,0.49803924560547),Color3.new(0.66666668653488,0.33333334326744,0.49803924560547),Color3.new(0,0.66666668653488,0.49803924560547),Color3.new(0.66666668653488,0.66666668653488,0.49803924560547),Color3.new(0,1,0.49803924560547),Color3.new(0.66666668653488,1,0.49803924560547),Color3.new(0,0,1),Color3.new(0.66666668653488,0,1),Color3.new(0,0.33333334326744,1),Color3.new(0.66666668653488,0.33333334326744,1),Color3.new(0,0.66666668653488,1),Color3.new(0.66666668653488,0.66666668653488,1),Color3.new(0,1,1),Color3.new(0.66666668653488,1,1),Color3.new(0.33333334326744,0,0),Color3.new(1,0,0),Color3.new(0.33333334326744,0.33333334326744,0),Color3.new(1,0.33333334326744,0),Color3.new(0.33333334326744,0.66666668653488,0),Color3.new(1,0.66666668653488,0),Color3.new(0.33333334326744,1,0),Color3.new(1,1,0),Color3.new(0.33333334326744,0,0.49803924560547),Color3.new(1,0,0.49803924560547),Color3.new(0.33333334326744,0.33333334326744,0.49803924560547),Color3.new(1,0.33333334326744,0.49803924560547),Color3.new(0.33333334326744,0.66666668653488,0.49803924560547),Color3.new(1,0.66666668653488,0.49803924560547),Color3.new(0.33333334326744,1,0.49803924560547),Color3.new(1,1,0.49803924560547),Color3.new(0.33333334326744,0,1),Color3.new(1,0,1),Color3.new(0.33333334326744,0.33333334326744,1),Color3.new(1,0.33333334326744,1),Color3.new(0.33333334326744,0.66666668653488,1),Color3.new(1,0.66666668653488,1),Color3.new(0.33333334326744,1,1),Color3.new(1,1,1)}
			local customColors = {}

			local function updateColor(noupdate)
				local relativeX, relativeY, relativeStripY = 219 - hue * 219, 199 - sat * 199, 199 - val * 199
				local hsvColor = Color3.fromHSV(hue, sat, val)

				if noupdate == 2 or not noupdate then
					hueInput.Text = tostring(math.ceil(359 * hue))
					satInput.Text = tostring(math.ceil(255 * sat))
					valInput.Text = tostring(math.floor(255 * val))
				end
				if noupdate == 1 or not noupdate then
					redInput.Text = tostring(math.floor(255 * red))
					greenInput.Text = tostring(math.floor(255 * green))
					blueInput.Text = tostring(math.floor(255 * blue))
				end

				chosenColor = Color3.new(red, green, blue)
				colorScope.Position = UDim2.new(0, (relativeX - 9), 0, (relativeY - 9))
				colorStrip.ImageColor3 = Color3.fromHSV(hue, sat, 1)
				colorArrow.Position = UDim2.new(0, -2, 0, (relativeStripY - 4))
				previewFrame.BackgroundColor3 = chosenColor

				newMt.Color = chosenColor
				newMt.OnPreview:Fire(chosenColor)
			end

			local function handleInputBegan(input, updateFunc)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					while user:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						updateFunc()task.wait()
					end
				end
			end

			local function colorSpaceInput()
				local relativeX = mouse.X - colorSpace.AbsolutePosition.X
				local relativeY = mouse.Y - colorSpace.AbsolutePosition.Y

				if relativeX < 0 then relativeX = 0 elseif relativeX > 219 then relativeX = 219 end
				if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end

				hue = (219 - relativeX) / 219
				sat = (199 - relativeY) / 199

				local hsvColor = Color3.fromHSV(hue, sat, val)
				red, green, blue = hsvColor.R, hsvColor.G, hsvColor.B
				updateColor()
			end

			local function colorStripInput()
				local relativeY = mouse.Y - colorStrip.AbsolutePosition.Y

				if relativeY < 0 then relativeY = 0 elseif relativeY > 199 then relativeY = 199 end	

				val = (199 - relativeY) / 199

				local hsvColor = Color3.fromHSV(hue, sat, val)
				red, green, blue = hsvColor.R, hsvColor.G, hsvColor.B
				updateColor()
			end

			colorSpace.InputBegan:Connect(function(input) handleInputBegan(input, colorSpaceInput) end)
			colorStrip.InputBegan:Connect(function(input) handleInputBegan(input, colorStripInput) end)

			local function hookButtons(frame, func)
				frame.ArrowFrame.Up.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						local releaseEvent, runEvent
						local startTime = tick()
						local pressing = true
						local startNum = tonumber(frame.Text)

						if not startNum then return end

						releaseEvent = user.InputEnded:Connect(function(endInput)
							if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								pressing = false
							end
						end)

						startNum = startNum + 1
						func(startNum)
						while pressing do
							if tick() - startTime > 0.3 then
								startNum = startNum + 1
								func(startNum)
								startTime = tick()
							end
							task.wait(0.1)
						end
					end
				end)

				frame.ArrowFrame.Down.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						local releaseEvent, runEvent
						local startTime = tick()
						local pressing = true
						local startNum = tonumber(frame.Text)

						if not startNum then return end

						releaseEvent = user.InputEnded:Connect(function(endInput)
							if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
								releaseEvent:Disconnect()
								pressing = false
							end
						end)

						startNum = startNum - 1
						func(startNum)
						while pressing do
							if tick() - startTime > 0.3 then
								startNum = startNum - 1
								func(startNum)
								startTime = tick()
							end
							task.wait(0.1)
						end
					end
				end)
			end

			--[[local function UpdateBox(TextBox, Value, IsHSV, ...)
				local number = tonumber(TextBox.Text)
				if number then
					number = math.clamp(math.floor(number), 0, Value) / Value
					local HSV = Color3.fromHSV(func(number))
					red, green, blue = HSV.R, HSV.G, HSV.B
					
					TextBox.Text = tostring(number):sub(4)
					updateColor(IsHSV)
				end
			end]]

			local function updateHue(str)
				local num = tonumber(str)
				if num then
					hue = math.clamp(math.floor(num),0,359)/359
					local hsvColor = Color3.fromHSV(hue,sat,val)
					red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b

					hueInput.Text = tostring(hue*359)
					updateColor(1)
				end
			end
			hueInput.FocusLost:Connect(function() updateHue(hueInput.Text) end) hookButtons(hueInput, hueInput)

			local function updateSat(str)
				local num = tonumber(str)
				if num then
					sat = math.clamp(math.floor(num),0,255)/255
					local hsvColor = Color3.fromHSV(hue,sat,val)
					red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
					satInput.Text = tostring(sat*255)
					updateColor(1)
				end
			end
			satInput.FocusLost:Connect(function() updateSat(satInput.Text) end) hookButtons(satInput,updateSat)

			local function updateVal(str)
				local num = tonumber(str)
				if num then
					val = math.clamp(math.floor(num),0,255)/255
					local hsvColor = Color3.fromHSV(hue,sat,val)
					red,green,blue = hsvColor.r,hsvColor.g,hsvColor.b
					valInput.Text = tostring(val*255)
					updateColor(1)
				end
			end
			valInput.FocusLost:Connect(function() updateVal(valInput.Text) end) hookButtons(valInput,updateVal)

			local function updateRed(str)
				local num = tonumber(str)
				if num then
					red = math.clamp(math.floor(num),0,255)/255
					local newColor = Color3.new(red,green,blue)
					hue,sat,val = Color3.toHSV(newColor)
					redInput.Text = tostring(red*255)
					updateColor(2)
				end
			end
			redInput.FocusLost:Connect(function() updateRed(redInput.Text) end) hookButtons(redInput,updateRed)

			local function updateGreen(str)
				local num = tonumber(str)
				if num then
					green = math.clamp(math.floor(num),0,255)/255
					local newColor = Color3.new(red,green,blue)
					hue,sat,val = Color3.toHSV(newColor)
					greenInput.Text = tostring(green*255)
					updateColor(2)
				end
			end
			greenInput.FocusLost:Connect(function() updateGreen(greenInput.Text) end) hookButtons(greenInput,updateGreen)

			local function updateBlue(str)
				local num = tonumber(str)
				if num then
					blue = math.clamp(math.floor(num),0,255)/255
					local newColor = Color3.new(red,green,blue)
					hue,sat,val = Color3.toHSV(newColor)
					blueInput.Text = tostring(blue*255)
					updateColor(2)
				end
			end
			blueInput.FocusLost:Connect(function() updateBlue(blueInput.Text) end) hookButtons(blueInput,updateBlue)

			local colorChoice = Instance.new("TextButton")
			colorChoice.Name = "Choice"
			colorChoice.Size = UDim2.new(0,25,0,18)
			colorChoice.BorderColor3 = Color3.fromRGB(55,55,55)
			colorChoice.Text = ""
			colorChoice.AutoButtonColor = false

			local row = 0
			local column = 0
			for i,v in pairs(basicColors) do
				local newColor = colorChoice:Clone()
				newColor.BackgroundColor3 = v
				newColor.Position = UDim2.new(0,1 + 30*column,0,21 + 23*row)

				newColor.MouseButton1Click:Connect(function()
					red,green,blue = v.r,v.g,v.b
					local newColor = Color3.new(red,green,blue)
					hue,sat,val = Color3.toHSV(newColor)
					updateColor()
				end)

				newColor.Parent = basicColorsFrame
				column = column + 1
				if column == 6 then row = row + 1 column = 0 end
			end

			row = 0
			column = 0
			for i = 1,12 do
				local color = customColors[i] or Color3.new(0,0,0)
				local newColor = colorChoice:Clone()
				newColor.BackgroundColor3 = color
				newColor.Position = UDim2.new(0,1 + 30*column,0,20 + 23*row)

				newColor.MouseButton1Click:Connect(function()
					local curColor = customColors[i] or Color3.new(0,0,0)
					red,green,blue = curColor.r,curColor.g,curColor.b
					hue,sat,val = Color3.toHSV(curColor)
					updateColor()
				end)

				newColor.MouseButton2Click:Connect(function()
					customColors[i] = chosenColor
					newColor.BackgroundColor3 = chosenColor
				end)

				newColor.Parent = customColorsFrame
				column = column + 1
				if column == 6 then row = row + 1 column = 0 end
			end

			okButton.MouseButton1Click:Connect(function() newMt.OnSelect:Fire(chosenColor) window:Close() end)
			okButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then okButton.BackgroundTransparency = 0.4 end end)
			okButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then okButton.BackgroundTransparency = 0 end end)


			cancelButton.MouseButton1Click:Connect(function() newMt.OnCancel:Fire() window:Close() end)
			cancelButton.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then cancelButton.BackgroundTransparency = 0.4 end end)
			cancelButton.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then cancelButton.BackgroundTransparency = 0 end end)

			updateColor()

			newMt.SetColor = function(self,color)
				red,green,blue = color.r,color.g,color.b
				hue,sat,val = Color3.toHSV(color)
				updateColor()
			end

			newMt.Show = function(self)
				self.Window:Show()
			end

			return newMt
		end

		return {new = new}
	end)()

	Lib.NumberSequenceEditor = (function()
		local function new() -- TODO: Convert to newer class model
			local newMt = setmetatable({},{})
			newMt.OnSelect = Lib.Signal.new()
			newMt.OnCancel = Lib.Signal.new()
			newMt.OnPreview = Lib.Signal.new()

			local guiContents = create({
				{1,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,ClipsDescendants=true,Name="Content",Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),}},
				{2,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Time",Parent={1},Position=UDim2.new(0,40,0,210),Size=UDim2.new(0,60,0,20),}},
				{3,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),ClipsDescendants=true,Font=3,Name="Input",Parent={2},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,58,0,20),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{4,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={2},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Time",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{5,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Close",Parent={1},Position=UDim2.new(1,-90,0,210),Size=UDim2.new(0,80,0,20),Text="Close",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{6,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Reset",Parent={1},Position=UDim2.new(1,-180,0,210),Size=UDim2.new(0,80,0,20),Text="Reset",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{7,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Font=3,Name="Delete",Parent={1},Position=UDim2.new(0,380,0,210),Size=UDim2.new(0,80,0,20),Text="Delete",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{8,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Name="NumberLineOutlines",Parent={1},Position=UDim2.new(0,10,0,20),Size=UDim2.new(1,-20,0,170),}},
				{9,"Frame",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),Name="NumberLine",Parent={1},Position=UDim2.new(0,10,0,20),Size=UDim2.new(1,-20,0,170),}},
				{10,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Value",Parent={1},Position=UDim2.new(0,170,0,210),Size=UDim2.new(0,60,0,20),}},
				{11,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={10},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Value",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{12,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),ClipsDescendants=true,Font=3,Name="Input",Parent={10},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,58,0,20),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{13,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Envelope",Parent={1},Position=UDim2.new(0,300,0,210),Size=UDim2.new(0,60,0,20),}},
				{14,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),ClipsDescendants=true,Font=3,Name="Input",Parent={13},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,58,0,20),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{15,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={13},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Envelope",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
			})
			local window = Lib.Window.new()
			window.Resizable = false
			window:Resize(680,265)
			window:SetTitle("NumberSequence Editor")
			newMt.Window = window
			newMt.Gui = window.Gui
			for i,v in pairs(guiContents:GetChildren()) do
				v.Parent = window.GuiElems.Content
			end
			local gui = window.Gui
			local pickerGui = gui.Main
			local pickerTopBar = pickerGui.TopBar
			local pickerFrame = pickerGui.Content
			local numberLine = pickerFrame.NumberLine
			local numberLineOutlines = pickerFrame.NumberLineOutlines
			local timeBox = pickerFrame.Time.Input
			local valueBox = pickerFrame.Value.Input
			local envelopeBox = pickerFrame.Envelope.Input
			local deleteButton = pickerFrame.Delete
			local resetButton = pickerFrame.Reset
			local closeButton = pickerFrame.Close
			local topClose = pickerTopBar.Close

			local points = {{1,0,3},{8,0.05,1},{5,0.6,2},{4,0.7,4},{6,1,4}}
			local lines = {}
			local eLines = {}
			local beginPoint = points[1]
			local endPoint = points[#points]
			local currentlySelected = nil
			local currentPoint = nil
			local resetSequence = nil

			local user = service.UserInputService
			local mouse = service.Players.LocalPlayer:GetMouse()

			for i = 2,10 do
				local newLine = Instance.new("Frame")
				newLine.BackgroundTransparency = 0.5
				newLine.BackgroundColor3 = Color3.new(96/255,96/255,96/255)
				newLine.BorderSizePixel = 0
				newLine.Size = UDim2.new(0,1,1,0)
				newLine.Position = UDim2.new((i-1)/(11-1),0,0,0)
				newLine.Parent = numberLineOutlines
			end

			for i = 2,4 do
				local newLine = Instance.new("Frame")
				newLine.BackgroundTransparency = 0.5
				newLine.BackgroundColor3 = Color3.new(96/255,96/255,96/255)
				newLine.BorderSizePixel = 0
				newLine.Size = UDim2.new(1,0,0,1)
				newLine.Position = UDim2.new(0,0,(i-1)/(5-1),0)
				newLine.Parent = numberLineOutlines
			end

			local lineTemp = Instance.new("Frame")
			lineTemp.BackgroundColor3 = Color3.new(0,0,0)
			lineTemp.BorderSizePixel = 0
			lineTemp.Size = UDim2.new(0,1,0,1)

			local sequenceLine = Instance.new("Frame")
			sequenceLine.BackgroundColor3 = Color3.new(0,0,0)
			sequenceLine.BorderSizePixel = 0
			sequenceLine.Size = UDim2.new(0,1,0,0)

			for i = 1,numberLine.AbsoluteSize.X do
				local line = sequenceLine:Clone()
				eLines[i] = line
				line.Name = "E"..tostring(i)
				line.BackgroundTransparency = 0.5
				line.BackgroundColor3 = Color3.new(199/255,44/255,28/255)
				line.Position = UDim2.new(0,i-1,0,0)
				line.Parent = numberLine
			end

			for i = 1,numberLine.AbsoluteSize.X do
				local line = sequenceLine:Clone()
				lines[i] = line
				line.Name = tostring(i)
				line.Position = UDim2.new(0,i-1,0,0)
				line.Parent = numberLine
			end

			local envelopeDrag = Instance.new("Frame")
			envelopeDrag.BackgroundTransparency = 1
			envelopeDrag.BackgroundColor3 = Color3.new(0,0,0)
			envelopeDrag.BorderSizePixel = 0
			envelopeDrag.Size = UDim2.new(0,7,0,20)
			envelopeDrag.Visible = false
			envelopeDrag.ZIndex = 2
			local envelopeDragLine = Instance.new("Frame",envelopeDrag)
			envelopeDragLine.Name = "Line"
			envelopeDragLine.BackgroundColor3 = Color3.new(0,0,0)
			envelopeDragLine.BorderSizePixel = 0
			envelopeDragLine.Position = UDim2.new(0,3,0,0)
			envelopeDragLine.Size = UDim2.new(0,1,0,20)
			envelopeDragLine.ZIndex = 2

			local envelopeDragTop,envelopeDragBottom = envelopeDrag:Clone(),envelopeDrag:Clone()
			envelopeDragTop.Parent = numberLine
			envelopeDragBottom.Parent = numberLine

			local function buildSequence()
				local newPoints = {}
				for i,v in pairs(points) do
					table.insert(newPoints,NumberSequenceKeypoint.new(v[2],v[1],v[3]))
				end
				newMt.Sequence = NumberSequence.new(newPoints)
				newMt.OnSelect:Fire(newMt.Sequence)
			end

			local function round(num,places)
				local multi = 10^places
				return math.floor(num*multi + 0.5)/multi
			end

			local function updateInputs(point)
				if point then
					currentPoint = point
					local rawT,rawV,rawE = point[2],point[1],point[3]
					timeBox.Text = round(rawT,(rawT < 0.01 and 5) or (rawT < 0.1 and 4) or 3)
					valueBox.Text = round(rawV,(rawV < 0.01 and 5) or (rawV < 0.1 and 4) or (rawV < 1 and 3) or 2)
					envelopeBox.Text = round(rawE,(rawE < 0.01 and 5) or (rawE < 0.1 and 4) or (rawV < 1 and 3) or 2)

					local envelopeDistance = numberLine.AbsoluteSize.Y*(point[3]/10)
					envelopeDragTop.Position = UDim2.new(0,point[4].Position.X.Offset-1,0,point[4].Position.Y.Offset-envelopeDistance-17)
					envelopeDragTop.Visible = true
					envelopeDragBottom.Position = UDim2.new(0,point[4].Position.X.Offset-1,0,point[4].Position.Y.Offset+envelopeDistance+2)
					envelopeDragBottom.Visible = true
				end
			end

			envelopeDragTop.InputBegan:Connect(function(input)
				if (input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch) or not currentPoint or Lib.CheckMouseInGui(currentPoint[4].Select) then return end

				local mouseEvent, releaseEvent
				local maxSize = numberLine.AbsoluteSize.Y
				local mouseDelta = math.abs(envelopeDragTop.AbsolutePosition.Y - mouse.Y)

				envelopeDragTop.Line.Position = UDim2.new(0, 2, 0, 0)
				envelopeDragTop.Line.Size = UDim2.new(0, 3, 0, 20)

				releaseEvent = user.InputEnded:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
					mouseEvent:Disconnect()
					releaseEvent:Disconnect()
					envelopeDragTop.Line.Position = UDim2.new(0, 3, 0, 0)
					envelopeDragTop.Line.Size = UDim2.new(0, 1, 0, 20)
				end)

				mouseEvent = user.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						local topDiff = (currentPoint[4].AbsolutePosition.Y + 2) - (mouse.Y - mouseDelta) - 19
						local newEnvelope = 10 * (math.max(topDiff, 0) / maxSize)
						local maxEnvelope = math.min(currentPoint[1], 10 - currentPoint[1])
						currentPoint[3] = math.min(newEnvelope, maxEnvelope)
						newMt:Redraw()
						buildSequence()
						updateInputs(currentPoint)
					end
				end)
			end)

			envelopeDragBottom.InputBegan:Connect(function(input)
				if (input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch) or not currentPoint or Lib.CheckMouseInGui(currentPoint[4].Select) then return end

				local mouseEvent, releaseEvent
				local maxSize = numberLine.AbsoluteSize.Y
				local mouseDelta = math.abs(envelopeDragBottom.AbsolutePosition.Y - mouse.Y)

				envelopeDragBottom.Line.Position = UDim2.new(0, 2, 0, 0)
				envelopeDragBottom.Line.Size = UDim2.new(0, 3, 0, 20)

				releaseEvent = user.InputEnded:Connect(function(input)
					if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
					mouseEvent:Disconnect()
					releaseEvent:Disconnect()
					envelopeDragBottom.Line.Position = UDim2.new(0, 3, 0, 0)
					envelopeDragBottom.Line.Size = UDim2.new(0, 1, 0, 20)
				end)

				mouseEvent = user.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						local bottomDiff = (mouse.Y + (20 - mouseDelta)) - (currentPoint[4].AbsolutePosition.Y + 2) - 19
						local newEnvelope = 10 * (math.max(bottomDiff, 0) / maxSize)
						local maxEnvelope = math.min(currentPoint[1], 10 - currentPoint[1])
						currentPoint[3] = math.min(newEnvelope, maxEnvelope)
						newMt:Redraw()
						buildSequence()
						updateInputs(currentPoint)
					end
				end)
			end)

			local function placePoint(point)
				local newPoint = Instance.new("Frame")
				newPoint.Name = "Point"
				newPoint.BorderSizePixel = 0
				newPoint.Size = UDim2.new(0,5,0,5)
				newPoint.Position = UDim2.new(0,math.floor((numberLine.AbsoluteSize.X-1) * point[2])-2,0,numberLine.AbsoluteSize.Y*(10-point[1])/10-2)
				newPoint.BackgroundColor3 = Color3.new(0,0,0)

				local newSelect = Instance.new("Frame")
				newSelect.Name = "Select"
				newSelect.BackgroundTransparency = 1
				newSelect.BackgroundColor3 = Color3.new(199/255,44/255,28/255)
				newSelect.Position = UDim2.new(0,-2,0,-2)
				newSelect.Size = UDim2.new(0,9,0,9)
				newSelect.Parent = newPoint

				newPoint.Parent = numberLine


				newSelect.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						for i, v in pairs(points) do 
							v[4].Select.BackgroundTransparency = 1 
						end

						newSelect.BackgroundTransparency = 0
						updateInputs(point)
					end

					if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not currentlySelected then
						currentPoint = point
						local mouseEvent, releaseEvent
						currentlySelected = true
						newSelect.BackgroundColor3 = Color3.new(249/255, 191/255, 59/255)

						local oldEnvelope = point[3]

						releaseEvent = user.InputEnded:Connect(function(input)
							if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then	return end

							mouseEvent:Disconnect()
							releaseEvent:Disconnect()
							currentlySelected = nil
							newSelect.BackgroundColor3 = Color3.new(199/255, 44/255, 28/255)
						end)

						mouseEvent = user.InputChanged:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
								local maxX = numberLine.AbsoluteSize.X - 1
								local relativeX = (input.Position.X - numberLine.AbsolutePosition.X)
								if relativeX < 0 then relativeX = 0 end
								if relativeX > maxX then relativeX = maxX end

								local maxY = numberLine.AbsoluteSize.Y - 1
								local relativeY = (input.Position.Y - numberLine.AbsolutePosition.Y)
								if relativeY < 0 then relativeY = 0 end
								if relativeY > maxY then relativeY = maxY end

								if point ~= beginPoint and point ~= endPoint then
									point[2] = relativeX / maxX
								end

								point[1] = 10 - (relativeY / maxY) * 10
								local maxEnvelope = math.min(point[1], 10 - point[1])
								point[3] = math.min(oldEnvelope, maxEnvelope)
								newMt:Redraw()
								updateInputs(point)

								for i, v in pairs(points) do 
									v[4].Select.BackgroundTransparency = 1 
								end

								newSelect.BackgroundTransparency = 0
								buildSequence()
							end
						end)
					end
				end)

				return newPoint
			end

			local function placePoints()
				for i,v in pairs(points) do
					v[4] = placePoint(v)
				end
			end

			local function redraw(self)
				local numberLineSize = numberLine.AbsoluteSize
				table.sort(points,function(a,b) return a[2] < b[2] end)
				for i,v in pairs(points) do
					v[4].Position = UDim2.new(0,math.floor((numberLineSize.X-1) * v[2])-2,0,(numberLineSize.Y-1)*(10-v[1])/10-2)
				end
				lines[1].Size = UDim2.new(0,1,0,0)
				for i = 1,#points-1 do
					local fromPoint = points[i]
					local toPoint = points[i+1]
					local deltaY = toPoint[4].Position.Y.Offset-fromPoint[4].Position.Y.Offset
					local deltaX = toPoint[4].Position.X.Offset-fromPoint[4].Position.X.Offset
					local slope = deltaY/deltaX

					local fromEnvelope = fromPoint[3]
					local nextEnvelope = toPoint[3]

					local currentRise = math.abs(slope)
					local totalRise = 0
					local maxRise = math.abs(toPoint[4].Position.Y.Offset-fromPoint[4].Position.Y.Offset)

					for lineCount = math.min(fromPoint[4].Position.X.Offset+1,toPoint[4].Position.X.Offset),toPoint[4].Position.X.Offset do
						if deltaX == 0 and deltaY == 0 then return end
						local riseNow = math.floor(currentRise)
						local line = lines[lineCount+3]
						if line then
							if totalRise+riseNow > maxRise then riseNow = maxRise-totalRise end
							if math.sign(slope) == -1 then
								line.Position = UDim2.new(0,lineCount+2,0,fromPoint[4].Position.Y.Offset + -(totalRise+riseNow)+2)
							else
								line.Position = UDim2.new(0,lineCount+2,0,fromPoint[4].Position.Y.Offset + totalRise+2)
							end
							line.Size = UDim2.new(0,1,0,math.max(riseNow,1))
						end
						totalRise = totalRise + riseNow
						currentRise = currentRise - riseNow + math.abs(slope)

						local envPercent = (lineCount-fromPoint[4].Position.X.Offset)/(toPoint[4].Position.X.Offset-fromPoint[4].Position.X.Offset)
						local envLerp = fromEnvelope+(nextEnvelope-fromEnvelope)*envPercent
						local relativeSize = (envLerp/10)*numberLineSize.Y						

						local line = eLines[lineCount + 3]
						if line then
							line.Position = UDim2.new(0,lineCount+2,0,lines[lineCount+3].Position.Y.Offset-math.floor(relativeSize))
							line.Size = UDim2.new(0,1,0,math.floor(relativeSize*2))
						end
					end
				end
			end
			newMt.Redraw = redraw



			local function loadSequence(self,seq)
				resetSequence = seq
				for i,v in pairs(points) do if v[4] then v[4]:Destroy() end end
				points = {}
				for i,v in pairs(seq.Keypoints) do
					local maxEnvelope = math.min(v.Value,10-v.Value)
					local newPoint = {v.Value,v.Time,math.min(v.Envelope,maxEnvelope)}
					newPoint[4] = placePoint(newPoint)
					table.insert(points,newPoint)
				end
				beginPoint = points[1]
				endPoint = points[#points]
				currentlySelected = nil
				redraw()
				envelopeDragTop.Visible = false
				envelopeDragBottom.Visible = false
			end
			newMt.SetSequence = loadSequence

			timeBox.FocusLost:Connect(function()
				local point = currentPoint
				local num = tonumber(timeBox.Text)
				if point and num and point ~= beginPoint and point ~= endPoint then
					num = math.clamp(num,0,1)
					point[2] = num
					redraw()
					buildSequence()
					updateInputs(point)
				end
			end)

			valueBox.FocusLost:Connect(function()
				local point = currentPoint
				local num = tonumber(valueBox.Text)
				if point and num then
					local oldEnvelope = point[3]
					num = math.clamp(num,0,10)
					point[1] = num
					local maxEnvelope = math.min(point[1],10-point[1])
					point[3] = math.min(oldEnvelope,maxEnvelope)
					redraw()
					buildSequence()
					updateInputs(point)
				end
			end)

			envelopeBox.FocusLost:Connect(function()
				local point = currentPoint
				local num = tonumber(envelopeBox.Text)
				if point and num then
					num = math.clamp(num,0,5)
					local maxEnvelope = math.min(point[1],10-point[1])
					point[3] = math.min(num,maxEnvelope)
					redraw()
					buildSequence()
					updateInputs(point)
				end
			end)

			local function buttonAnimations(button,inverse)
				button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then button.BackgroundTransparency = (inverse and 0.5 or 0.4) end end)
				button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then button.BackgroundTransparency = (inverse and 1 or 0) end end)
			end

			numberLine.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and #points < 20 then

					if Lib.CheckMouseInGui(envelopeDragTop) or Lib.CheckMouseInGui(envelopeDragBottom) then return end

					for i, v in pairs(points) do
						if Lib.CheckMouseInGui(v[4].Select) then
							return
						end
					end

					local maxX = numberLine.AbsoluteSize.X - 1
					local relativeX = (input.Position.X - numberLine.AbsolutePosition.X)
					if relativeX < 0 then relativeX = 0 end
					if relativeX > maxX then relativeX = maxX end

					local maxY = numberLine.AbsoluteSize.Y - 1
					local relativeY = (input.Position.Y - numberLine.AbsolutePosition.Y)
					if relativeY < 0 then relativeY = 0 end
					if relativeY > maxY then relativeY = maxY end

					local raw = relativeX / maxX
					local newPoint = {10 - (relativeY / maxY) * 10, raw, 0}
					newPoint[4] = placePoint(newPoint)
					table.insert(points, newPoint)
					redraw()
					buildSequence()
				end
			end)

			deleteButton.MouseButton1Click:Connect(function()
				if currentPoint and currentPoint ~= beginPoint and currentPoint ~= endPoint then
					for i,v in pairs(points) do
						if v == currentPoint then
							v[4]:Destroy()
							table.remove(points,i)
							break
						end
					end
					currentlySelected = nil
					redraw()
					buildSequence()
					updateInputs(points[1])
				end
			end)

			resetButton.MouseButton1Click:Connect(function()
				if resetSequence then
					newMt:SetSequence(resetSequence)
					buildSequence()
				end
			end)

			closeButton.MouseButton1Click:Connect(function()
				window:Close()
			end)

			buttonAnimations(deleteButton)
			buttonAnimations(resetButton)
			buttonAnimations(closeButton)

			placePoints()
			redraw()

			newMt.Show = function(self)
				window:Show()
			end

			return newMt
		end

		return {new = new}
	end)()

	Lib.ColorSequenceEditor = (function() -- TODO: Convert to newer class model
		local function new()
			local newMt = setmetatable({},{})
			newMt.OnSelect = Lib.Signal.new()
			newMt.OnCancel = Lib.Signal.new()
			newMt.OnPreview = Lib.Signal.new()
			newMt.OnPickColor = Lib.Signal.new()

			local guiContents = create({
				{1,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,ClipsDescendants=true,Name="Content",Position=UDim2.new(0,0,0,20),Size=UDim2.new(1,0,1,-20),}},
				{2,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Name="ColorLine",Parent={1},Position=UDim2.new(0,10,0,5),Size=UDim2.new(1,-20,0,70),}},
				{3,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderSizePixel=0,Name="Gradient",Parent={2},Size=UDim2.new(1,0,1,0),}},
				{4,"UIGradient",{Parent={3},}},
				{5,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Name="Arrows",Parent={1},Position=UDim2.new(0,1,0,73),Size=UDim2.new(1,-2,0,16),}},
				{6,"Frame",{BackgroundColor3=Color3.new(0,0,0),BackgroundTransparency=0.5,BorderSizePixel=0,Name="Cursor",Parent={1},Position=UDim2.new(0,10,0,0),Size=UDim2.new(0,1,0,80),}},
				{7,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),Name="Time",Parent={1},Position=UDim2.new(0,40,0,95),Size=UDim2.new(0,100,0,20),}},
				{8,"TextBox",{BackgroundColor3=Color3.new(0.25098040699959,0.25098040699959,0.25098040699959),BackgroundTransparency=1,BorderColor3=Color3.new(0.37647062540054,0.37647062540054,0.37647062540054),ClipsDescendants=true,Font=3,Name="Input",Parent={7},Position=UDim2.new(0,2,0,0),Size=UDim2.new(0,98,0,20),Text="0",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=0,}},
				{9,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={7},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Time",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{10,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),Name="ColorBox",Parent={1},Position=UDim2.new(0,220,0,95),Size=UDim2.new(0,20,0,20),}},
				{11,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Title",Parent={10},Position=UDim2.new(0,-40,0,0),Size=UDim2.new(0,34,1,0),Text="Color",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,TextXAlignment=1,}},
				{12,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,Font=3,Name="Close",Parent={1},Position=UDim2.new(1,-90,0,95),Size=UDim2.new(0,80,0,20),Text="Close",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{13,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,Font=3,Name="Reset",Parent={1},Position=UDim2.new(1,-180,0,95),Size=UDim2.new(0,80,0,20),Text="Reset",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{14,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.21568627655506,0.21568627655506,0.21568627655506),BorderSizePixel=0,Font=3,Name="Delete",Parent={1},Position=UDim2.new(0,280,0,95),Size=UDim2.new(0,80,0,20),Text="Delete",TextColor3=Color3.new(0.86274516582489,0.86274516582489,0.86274516582489),TextSize=14,}},
				{15,"Frame",{BackgroundTransparency=1,Name="Arrow",Parent={1},Size=UDim2.new(0,16,0,16),Visible=false,}},
				{16,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,8,0,3),Size=UDim2.new(0,1,0,2),}},
				{17,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,7,0,5),Size=UDim2.new(0,3,0,2),}},
				{18,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,6,0,7),Size=UDim2.new(0,5,0,2),}},
				{19,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,5,0,9),Size=UDim2.new(0,7,0,2),}},
				{20,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={15},Position=UDim2.new(0,4,0,11),Size=UDim2.new(0,9,0,2),}},
			})
			local window = Lib.Window.new()
			window.Resizable = false
			window:Resize(650,150)
			window:SetTitle("ColorSequence Editor")
			newMt.Window = window
			newMt.Gui = window.Gui
			for i,v in pairs(guiContents:GetChildren()) do
				v.Parent = window.GuiElems.Content
			end
			local gui = window.Gui
			local pickerGui = gui.Main
			local pickerTopBar = pickerGui.TopBar
			local pickerFrame = pickerGui.Content
			local colorLine = pickerFrame.ColorLine
			local gradient = colorLine.Gradient.UIGradient
			local arrowFrame = pickerFrame.Arrows
			local arrow = pickerFrame.Arrow
			local cursor = pickerFrame.Cursor
			local timeBox = pickerFrame.Time.Input
			local colorBox = pickerFrame.ColorBox
			local deleteButton = pickerFrame.Delete
			local resetButton = pickerFrame.Reset
			local closeButton = pickerFrame.Close
			local topClose = pickerTopBar.Close

			local user = service.UserInputService
			local mouse = service.Players.LocalPlayer:GetMouse()

			local colors = {{Color3.new(1,0,1),0},{Color3.new(0.2,0.9,0.2),0.2},{Color3.new(0.4,0.5,0.9),0.7},{Color3.new(0.6,1,1),1}}
			local resetSequence = nil

			local beginPoint = colors[1]
			local endPoint = colors[#colors]

			local currentlySelected = nil
			local currentPoint = nil

			local sequenceLine = Instance.new("Frame")
			sequenceLine.BorderSizePixel = 0
			sequenceLine.Size = UDim2.new(0,1,1,0)

			newMt.Sequence = ColorSequence.new(Color3.new(1,1,1))
			local function buildSequence(noupdate)
				local newPoints = {}
				table.sort(colors,function(a,b) return a[2] < b[2] end)
				for i,v in pairs(colors) do
					table.insert(newPoints,ColorSequenceKeypoint.new(v[2],v[1]))
				end
				newMt.Sequence = ColorSequence.new(newPoints)
				if not noupdate then newMt.OnSelect:Fire(newMt.Sequence) end
			end

			local function round(num,places)
				local multi = 10^places
				return math.floor(num*multi + 0.5)/multi
			end

			local function updateInputs(point)
				if point then
					currentPoint = point
					local raw = point[2]
					timeBox.Text = round(raw,(raw < 0.01 and 5) or (raw < 0.1 and 4) or 3)
					colorBox.BackgroundColor3 = point[1]
				end
			end

			local function placeArrow(ind,point)
				local newArrow = arrow:Clone()
				newArrow.Position = UDim2.new(0,ind-1,0,0)
				newArrow.Visible = true
				newArrow.Parent = arrowFrame

				newArrow.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						cursor.Visible = true
						cursor.Position = UDim2.new(0, 9 + newArrow.Position.X.Offset, 0, 0)
					end

					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						updateInputs(point)
						if point == beginPoint or point == endPoint or currentlySelected then return end

						local mouseEvent, releaseEvent
						currentlySelected = true

						releaseEvent = user.InputEnded:Connect(function(input)
							if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
							mouseEvent:Disconnect()
							releaseEvent:Disconnect()
							currentlySelected = nil
							cursor.Visible = false
						end)

						mouseEvent = user.InputChanged:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
								local maxSize = colorLine.AbsoluteSize.X - 1
								local relativeX = (input.Position.X - colorLine.AbsolutePosition.X)
								if relativeX < 0 then relativeX = 0 end
								if relativeX > maxSize then relativeX = maxSize end
								local raw = relativeX / maxSize
								point[2] = relativeX / maxSize
								updateInputs(point)
								cursor.Visible = true
								cursor.Position = UDim2.new(0, 9 + newArrow.Position.X.Offset, 0, 0)
								buildSequence()
								newMt:Redraw()
							end
						end)
					end
				end)

				newArrow.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						cursor.Visible = false
					end
				end)



				return newArrow
			end

			local function placeArrows()
				for i,v in pairs(colors) do
					v[3] = placeArrow(math.floor((colorLine.AbsoluteSize.X-1) * v[2]) + 1,v)
				end
			end

			local function redraw(self)
				gradient.Color = newMt.Sequence or ColorSequence.new(Color3.new(1,1,1))

				for i = 2,#colors do
					local nextColor = colors[i]
					local endPos = math.floor((colorLine.AbsoluteSize.X-1) * nextColor[2]) + 1
					nextColor[3].Position = UDim2.new(0,endPos,0,0)
				end		
			end
			newMt.Redraw = redraw

			local function loadSequence(self,seq)
				resetSequence = seq
				for i,v in pairs(colors) do if v[3] then v[3]:Destroy() end end
				colors = {}
				currentlySelected = nil
				for i,v in pairs(seq.Keypoints) do
					local newPoint = {v.Value,v.Time}
					newPoint[3] = placeArrow(v.Time,newPoint)
					table.insert(colors,newPoint)
				end
				beginPoint = colors[1]
				endPoint = colors[#colors]
				currentlySelected = nil
				updateInputs(colors[1])
				buildSequence(true)
				redraw()
			end
			newMt.SetSequence = loadSequence

			local function buttonAnimations(button,inverse)
				button.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then button.BackgroundTransparency = (inverse and 0.5 or 0.4) end end)
				button.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then button.BackgroundTransparency = (inverse and 1 or 0) end end)
			end

			colorLine.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and #colors < 20 then
					local maxSize = colorLine.AbsoluteSize.X - 1
					local relativeX = (input.Position.X - colorLine.AbsolutePosition.X)
					if relativeX < 0 then relativeX = 0 end
					if relativeX > maxSize then relativeX = maxSize end

					local raw = relativeX / maxSize
					local fromColor = nil
					local toColor = nil
					for i, col in pairs(colors) do
						if col[2] >= raw then
							fromColor = colors[math.max(i - 1, 1)]
							toColor = colors[i]
							break
						end
					end
					local lerpColor = fromColor[1]:lerp(toColor[1], (raw - fromColor[2]) / (toColor[2] - fromColor[2]))
					local newPoint = {lerpColor, raw}
					newPoint[3] = placeArrow(newPoint[2], newPoint)
					table.insert(colors, newPoint)
					updateInputs(newPoint)
					buildSequence()
					redraw()
				end
			end)

			colorLine.InputChanged:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					local maxSize = colorLine.AbsoluteSize.X - 1
					local relativeX = (input.Position.X - colorLine.AbsolutePosition.X)
					if relativeX < 0 then relativeX = 0 end
					if relativeX > maxSize then relativeX = maxSize end
					cursor.Visible = true
					cursor.Position = UDim2.new(0, 10 + relativeX, 0, 0)
				end
			end)

			colorLine.InputEnded:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					local inArrow = false
					for i, v in pairs(colors) do
						if Lib.CheckMouseInGui(v[3]) then
							inArrow = v[3]
						end
					end
					cursor.Visible = inArrow and true or false
					if inArrow then cursor.Position = UDim2.new(0, 9 + inArrow.Position.X.Offset, 0, 0) end
				end
			end)

			timeBox:GetPropertyChangedSignal("Text"):Connect(function()
				local point = currentPoint
				local num = tonumber(timeBox.Text)
				if point and num and point ~= beginPoint and point ~= endPoint then
					num = math.clamp(num,0,1)
					point[2] = num
					buildSequence()
					redraw()
				end
			end)

			colorBox.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
					local editor = newMt.ColorPicker
					if not editor then
						editor = Lib.ColorPicker.new()
						editor.Window:SetTitle("ColorSequence Color Picker")

						editor.OnSelect:Connect(function(col)
							if currentPoint then
								currentPoint[1] = col
							end
							buildSequence()
							redraw()
						end)

						newMt.ColorPicker = editor
					end

					editor.Window:ShowAndFocus()
				end
			end)

			deleteButton.MouseButton1Click:Connect(function()
				if currentPoint and currentPoint ~= beginPoint and currentPoint ~= endPoint then
					for i,v in pairs(colors) do
						if v == currentPoint then
							v[3]:Destroy()
							table.remove(colors,i)
							break
						end
					end
					currentlySelected = nil
					updateInputs(colors[1])
					buildSequence()
					redraw()
				end
			end)

			resetButton.MouseButton1Click:Connect(function()
				if resetSequence then
					newMt:SetSequence(resetSequence)
				end
			end)

			closeButton.MouseButton1Click:Connect(function()
				window:Close()
			end)

			topClose.MouseButton1Click:Connect(function()
				window:Close()
			end)

			buttonAnimations(deleteButton)
			buttonAnimations(resetButton)
			buttonAnimations(closeButton)

			placeArrows()
			redraw()

			newMt.Show = function(self)
				window:Show()
			end

			return newMt
		end

		return {new = new}
	end)()

	Lib.ViewportTextBox = (function()
		local textService = service.TextService

		local props = {
			OffsetX = 0,
			TextBox = PH,
			CursorPos = -1,
			Gui = PH,
			View = PH
		}
		local funcs = {}
		funcs.Update = function(self)
			local cursorPos = self.CursorPos or -1
			local text = self.TextBox.Text
			if text == "" then self.TextBox.Position = UDim2.new(0,0,0,0) return end
			if cursorPos == -1 then return end

			local cursorText = text:sub(1,cursorPos-1)
			local pos = nil
			local leftEnd = -self.TextBox.Position.X.Offset
			local rightEnd = leftEnd + self.View.AbsoluteSize.X

			local totalTextSize = textService:GetTextSize(text,self.TextBox.TextSize,self.TextBox.Font,Vector2.new(999999999,100)).X
			local cursorTextSize = textService:GetTextSize(cursorText,self.TextBox.TextSize,self.TextBox.Font,Vector2.new(999999999,100)).X

			if cursorTextSize > rightEnd then
				pos = math.max(-1,cursorTextSize - self.View.AbsoluteSize.X + 2)
			elseif cursorTextSize < leftEnd then
				pos = math.max(-1,cursorTextSize-2)
			elseif totalTextSize < rightEnd then
				pos = math.max(-1,totalTextSize - self.View.AbsoluteSize.X + 2)
			end

			if pos then
				self.TextBox.Position = UDim2.new(0,-pos,0,0)
				self.TextBox.Size = UDim2.new(1,pos,1,0)
			end
		end

		funcs.GetText = function(self)
			return self.TextBox.Text
		end

		funcs.SetText = function(self,text)
			self.TextBox.Text = text
		end

		local mt = getGuiMT(props,funcs)

		local function convert(textbox)
			local obj = initObj(props,mt)

			local view = Instance.new("Frame")
			view.BackgroundTransparency = textbox.BackgroundTransparency
			view.BackgroundColor3 = textbox.BackgroundColor3
			view.BorderSizePixel = textbox.BorderSizePixel
			view.BorderColor3 = textbox.BorderColor3
			view.Position = textbox.Position
			view.Size = textbox.Size
			view.ClipsDescendants = true
			view.Name = textbox.Name
			textbox.BackgroundTransparency = 1
			textbox.Position = UDim2.new(0,0,0,0)
			textbox.Size = UDim2.new(1,0,1,0)
			textbox.TextXAlignment = Enum.TextXAlignment.Left
			textbox.Name = "Input"

			obj.TextBox = textbox
			obj.View = view
			obj.Gui = view

			textbox.Changed:Connect(function(prop)
				if prop == "Text" or prop == "CursorPosition" or prop == "AbsoluteSize" then
					local cursorPos = obj.TextBox.CursorPosition
					if cursorPos ~= -1 then obj.CursorPos = cursorPos end
					obj:Update()
				end
			end)

			obj:Update()

			view.Parent = textbox.Parent
			textbox.Parent = view

			return obj
		end

		local function new()
			local textBox = Instance.new("TextBox")
			textBox.Active = true
			textBox.Size = UDim2.new(0,100,0,20)
			textBox.BackgroundColor3 = Settings.Theme.TextBox
			textBox.BorderColor3 = Settings.Theme.Outline3
			textBox.ClearTextOnFocus = false
			textBox.TextColor3 = Settings.Theme.Text
			textBox.Font = Enum.Font.SourceSans
			textBox.TextSize = 14
			textBox.Text = ""
			return convert(textBox)
		end

		return {new = new, convert = convert}
	end)()

	Lib.Label = (function()
		local props,funcs = {},{}

		local mt = getGuiMT(props,funcs)

		local function new()
			local label = Instance.new("TextLabel")
			label.BackgroundTransparency = 1
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.TextColor3 = Settings.Theme.Text
			label.TextTransparency = 0.1
			label.Size = UDim2.new(0,100,0,20)
			label.Font = Enum.Font.SourceSans
			label.TextSize = 14

			local obj = setmetatable({
				Gui = label
			},mt)
			return obj
		end

		return {new = new}
	end)()

	Lib.Frame = (function()
		local props,funcs = {},{}

		local mt = getGuiMT(props,funcs)

		local function new()
			local fr = Instance.new("Frame")
			fr.BackgroundColor3 = Settings.Theme.Main1
			fr.BorderColor3 = Settings.Theme.Outline1
			fr.Size = UDim2.new(0,50,0,50)

			local obj = setmetatable({
				Gui = fr
			},mt)
			return obj
		end

		return {new = new}
	end)()

	Lib.Button = (function()
		local props = {
			Gui = PH,
			Anim = PH,
			Disabled = false,
			OnClick = SIGNAL,
			OnDown = SIGNAL,
			OnUp = SIGNAL,
			AllowedButtons = {1}
		}
		local funcs = {}
		local tableFind = table.find

		funcs.Trigger = function(self,event,button)
			if not self.Disabled and tableFind(self.AllowedButtons,button) then
				self["On"..event]:Fire(button)
			end
		end

		funcs.SetDisabled = function(self,dis)
			self.Disabled = dis

			if dis then
				self.Anim:Disable()
				self.Gui.TextTransparency = 0.5
			else
				self.Anim.Enable()
				self.Gui.TextTransparency = 0
			end
		end

		local mt = getGuiMT(props,funcs)

		local function new()
			local b = Instance.new("TextButton")
			b.AutoButtonColor = false
			b.TextColor3 = Settings.Theme.Text
			b.TextTransparency = 0.1
			b.Size = UDim2.new(0,100,0,20)
			b.Font = Enum.Font.SourceSans
			b.TextSize = 14
			b.BackgroundColor3 = Settings.Theme.Button
			b.BorderColor3 = Settings.Theme.Outline2

			local obj = initObj(props,mt)
			obj.Gui = b
			obj.Anim = Lib.ButtonAnim(b,{Mode = 2, StartColor = Settings.Theme.Button, HoverColor = Settings.Theme.ButtonHover, PressColor = Settings.Theme.ButtonPress, OutlineColor = Settings.Theme.Outline2})

			b.MouseButton1Click:Connect(function() obj:Trigger("Click",1) end)
			b.MouseButton1Down:Connect(function() obj:Trigger("Down",1) end)
			b.MouseButton1Up:Connect(function() obj:Trigger("Up",1) end)

			b.MouseButton2Click:Connect(function() obj:Trigger("Click",2) end)
			b.MouseButton2Down:Connect(function() obj:Trigger("Down",2) end)
			b.MouseButton2Up:Connect(function() obj:Trigger("Up",2) end)

			return obj
		end

		return {new = new}
	end)()

	Lib.DropDown = (function()
		local props = {
			Gui = PH,
			Anim = PH,
			Context = PH,
			Selected = PH,
			Disabled = false,
			CanBeEmpty = true,
			Options = {},
			GuiElems = {},
			OnSelect = SIGNAL
		}
		local funcs = {}

		funcs.Update = function(self)
			local options = self.Options

			if #options > 0 then
				if not self.Selected then
					if not self.CanBeEmpty then
						self.Selected = options[1]
						self.GuiElems.Label.Text = options[1]
					else
						self.GuiElems.Label.Text = "- Select -"
					end
				else
					self.GuiElems.Label.Text = self.Selected
				end
			else
				self.GuiElems.Label.Text = "- Select -"
			end
		end

		funcs.ShowOptions = function(self)
			local context = self.Context

			context.Width = self.Gui.AbsoluteSize.X
			context.ReverseYOffset = self.Gui.AbsoluteSize.Y
			context:Show(self.Gui.AbsolutePosition.X, self.Gui.AbsolutePosition.Y + context.ReverseYOffset)
		end

		funcs.SetOptions = function(self,opts)
			self.Options = opts

			local context = self.Context
			local options = self.Options
			context:Clear()

			local onClick = function(option) self.Selected = option self.OnSelect:Fire(option) self:Update() end

			if self.CanBeEmpty then
				context:Add({Name = "- Select -", function() self.Selected = nil self.OnSelect:Fire(nil) self:Update() end})
			end

			for i = 1,#options do
				context:Add({Name = options[i], OnClick = onClick})
			end

			self:Update()
		end

		funcs.SetSelected = function(self,opt)
			self.Selected = type(opt) == "number" and self.Options[opt] or opt
			self:Update()
		end

		local mt = getGuiMT(props,funcs)

		local function new()
			local f = Instance.new("TextButton")
			f.AutoButtonColor = false
			f.Text = ""
			f.Size = UDim2.new(0,100,0,20)
			f.BackgroundColor3 = Settings.Theme.TextBox
			f.BorderColor3 = Settings.Theme.Outline3

			local label = Lib.Label.new()
			label.Position = UDim2.new(0,2,0,0)
			label.Size = UDim2.new(1,-22,1,0)
			label.TextTruncate = Enum.TextTruncate.AtEnd
			label.Parent = f
			local arrow = create({
				{1,"Frame",{BackgroundTransparency=1,Name="EnumArrow",Position=UDim2.new(1,-16,0,2),Size=UDim2.new(0,16,0,16),}},
				{2,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,8,0,9),Size=UDim2.new(0,1,0,1),}},
				{3,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,7,0,8),Size=UDim2.new(0,3,0,1),}},
				{4,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={1},Position=UDim2.new(0,6,0,7),Size=UDim2.new(0,5,0,1),}},
			})
			arrow.Parent = f

			local obj = initObj(props,mt)
			obj.Gui = f
			obj.Anim = Lib.ButtonAnim(f,{Mode = 2, StartColor = Settings.Theme.TextBox, LerpTo = Settings.Theme.Button, LerpDelta = 0.15})
			obj.Context = Lib.ContextMenu.new()
			obj.Context.Iconless = true
			obj.Context.MaxHeight = 200
			obj.Selected = nil
			obj.GuiElems = {Label = label}
			f.MouseButton1Down:Connect(function() obj:ShowOptions() end)
			obj:Update()
			return obj
		end

		return {new = new}
	end)()

	Lib.ClickSystem = (function()
		local props = {
			LastItem = PH,
			OnDown = SIGNAL,
			OnRelease = SIGNAL,
			AllowedButtons = {1},
			Combo = 0,
			MaxCombo = 2,
			ComboTime = 0.5,
			Items = {},
			ItemCons = {},
			ClickId = -1,
			LastButton = ""
		}
		local funcs = {}
		local tostring = tostring

		local disconnect = function(con)
			local pos = table.find(con.Signal.Connections,con)
			if pos then table.remove(con.Signal.Connections,pos) end
		end

		funcs.Trigger = function(self, item, button, X, Y)
			if table.find(self.AllowedButtons, button) then
				if self.LastButton ~= button or self.LastItem ~= item or self.Combo == self.MaxCombo or tick() - self.ClickId > self.ComboTime then
					self.Combo = 0
					self.LastButton = button
					self.LastItem = item
				end

				self.Combo = self.Combo + 1
				self.ClickId = tick()

				task.spawn(function()
					if self.InputDown then
						self.InputDown = false
					else
						self.InputDown = tick()

						local Connection = item.MouseButton1Up:Once(function()
							self.InputDown = false
						end)

						while self.InputDown and not Explorer.Dragging do
							if (tick() - self.InputDown) >= 0.4 then
								self.InputDown = false
								self["OnRelease"]:Fire(item, self.Combo, 2, Vector2.new(X, Y))
								break
							end;task.wait()
						end
					end
				end)

				local release
				release = service.UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType["MouseButton" .. button] then
						release:Disconnect()
						if Lib.CheckMouseInGui(item) and self.LastButton == button and self.LastItem == item then
							self.InputDown = false -- infinite yield dev forgot to do this, and ended up OnRelease fired twice ??
							self["OnRelease"]:Fire(item,self.Combo,button)
						end
					end
				end)

				self["OnDown"]:Fire(item,self.Combo,button)
			end
		end

		funcs.Add = function(self,item)
			if table.find(self.Items,item) then return end

			local cons = {}
			cons[1] = item.MouseButton1Down:Connect(function(X, Y) self:Trigger(item, 1, X, Y) end)
			cons[2] = item.MouseButton2Down:Connect(function(X, Y) self:Trigger(item, 2, X, Y) end)

			self.ItemCons[item] = cons
			self.Items[#self.Items+1] = item
		end

		funcs.Remove = function(self,item)
			local ind = table.find(self.Items,item)
			if not ind then return end

			for i,v in pairs(self.ItemCons[item]) do
				v:Disconnect()
			end
			self.ItemCons[item] = nil
			table.remove(self.Items,ind)
		end

		local mt = {__index = funcs}

		local function new()
			local obj = initObj(props,mt)

			return obj
		end

		return {new = new}
	end)()

	return Lib
end

return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end,
["ModelViewer"] = function()
--[[
	Model Viewer App Module
	
	A model viewer :3
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, ModelViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local function getPath(obj)
	if obj.Parent == nil then
		return "Nil parented"
	else
		return Explorer.GetInstancePath(obj)
	end
end

local function main()
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	
	local ModelViewer = {
		EnableInputCamera = true,
		IsViewing = false,
		AutoRefresh = false,
		ZoomMultiplier = 2,
		AutoRotate = true,
		RotationSpeed = 0.01,
		RefreshRate = 30 -- hertz
	}
	
	local window, viewportFrame, pathLabel, settingsButton
	local model, camera, originalModel
	
	
	ModelViewer.StopViewModel = function(updating)
		if updating then
			viewportFrame:FindFirstChildOfClass("Model"):Destroy()
		else
			if camera then camera = nil end
			if model then model = nil end
			viewportFrame:ClearAllChildren()
			
			ModelViewer.IsViewing = false
			window:SetTitle("3D Preview")
			pathLabel.Gui.Text = ""
		end
	end

	ModelViewer.ViewModel = function(item, updating)
		if not item then return end
		ModelViewer.StopViewModel(updating)
		
		if item ~= workspace and not item:IsA("Terrain") then
			-- why Model == workspace
			-- wtf?
			
			if item:IsA("BasePart") and not item:IsA("Model") then			
				model = Instance.new("Model")
				model.Parent = viewportFrame

				local clone = item:Clone()
				clone.Parent = model
				model.PrimaryPart = clone
				model:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
			elseif item:IsA("Model") then
				item.Archivable = true

			--[[if not item.PrimaryPart then
				pathLabel.Gui.Text = "Failed to view model: No PrimaryPart is found."
				return
			end]]
				if #item:GetChildren() == 0 then return end
				
				model = item:Clone()
				model.Parent = viewportFrame

				-- fallback
				if not model.PrimaryPart then
					local found = false
					for _, child in model:GetDescendants() do
						if child:IsA("BasePart") then
							model.PrimaryPart = child
							model:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))
							found = true
							break
						end
					end
					if not found then
						model:Destroy()
						model = nil
						return
					end
				end
			else
				return
			end
		end
		
		originalModel = item
		
		if ModelViewer.AutoRefresh and not updating then
			task.spawn(function()
				while model and ModelViewer.AutoRefresh do
					
					ModelViewer.ViewModel(originalModel, true)
					task.wait(1 / ModelViewer.RefreshRate)
				end
			end)
		end
		
		if not updating then
			camera = Instance.new("Camera")
			viewportFrame.CurrentCamera = camera

			camera.Parent = viewportFrame
			camera.FieldOfView = 60
			
			window:SetTitle(item.Name.." - 3D Preview")
			pathLabel.Gui.Text = "path: " .. getPath(originalModel)
			window:Show()
			ModelViewer.IsViewing = true
		end
	end

	ModelViewer.Init = function()
		window = Lib.Window.new()
		window:SetTitle("3D Preview")
		window:Resize(350,200)
		ModelViewer.Window =  window
		
		viewportFrame = Instance.new("ViewportFrame")
		viewportFrame.Parent = window.GuiElems.Content
		viewportFrame.BackgroundTransparency = 1
		viewportFrame.Size = UDim2.new(1,0,1,0)
		
		pathLabel = Lib.Label.new()
		pathLabel.Gui.Parent = window.GuiElems.Content
		pathLabel.Gui.AnchorPoint = Vector2.new(0,1)
		pathLabel.Gui.Text = ""
		pathLabel.Gui.TextSize = 12
		pathLabel.Gui.TextTransparency = 0.8
		pathLabel.Gui.Position = UDim2.new(0,1,1,0)
		pathLabel.Gui.Size = UDim2.new(1,-1,0,15)
		pathLabel.Gui.BackgroundTransparency = 1
		
		settingsButton = Instance.new("ImageButton",window.GuiElems.Content)
		settingsButton.AnchorPoint = Vector2.new(1,0)
		settingsButton.BackgroundTransparency = 1
		settingsButton.Size = UDim2.new(0,15,0,15)
		settingsButton.Position = UDim2.new(1,-3,0,3)
		settingsButton.Image = "rbxassetid://6578871732"
		settingsButton.ImageTransparency = 0.5
		-- mobile input check
		if UserInputService:GetLastInputType() == Enum.UserInputType.Touch then
			settingsButton.Visible = true
		else
			settingsButton.Visible = false
		end

		local rotationX, rotationY = -15, 0
		local distance = 10
		local dragging = false
		local hovering = false
		local lastpos = Vector2.zero

		viewportFrame.InputBegan:Connect(function(input)
			if not ModelViewer.EnableInputCamera then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				lastpos = input.Position
			elseif input.KeyCode == Enum.KeyCode.LeftShift then
				ModelViewer.ZoomMultiplier = 10
			end
		end)
		

		viewportFrame.MouseEnter:Connect(function()
			hovering = true
		end)
		viewportFrame.MouseLeave:Connect(function()
			hovering = false
		end)

		viewportFrame.InputEnded:Connect(function(input)
			if not ModelViewer.EnableInputCamera then return end
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			elseif input.KeyCode == Enum.KeyCode.LeftShift then
				ModelViewer.ZoomMultiplier = 2
			end
		end)

		viewportFrame.InputChanged:Connect(function(input)
			if not ModelViewer.EnableInputCamera then return end
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				local delta = input.Position - lastpos
				lastpos = input.Position

				rotationY -= delta.X * 0.01
				rotationX -= delta.Y * 0.01
				rotationX = math.clamp(rotationX, -math.pi/2 + 0.1, math.pi/2 - 0.1)
			end

			if input.UserInputType == Enum.UserInputType.MouseWheel and hovering then
				distance = math.clamp(distance - (input.Position.Z * ModelViewer.ZoomMultiplier), 0.1, math.huge)
			end
		end)

		RunService.RenderStepped:Connect(function()
			if camera and model then
				if not dragging and ModelViewer.AutoRotate then
					rotationY += ModelViewer.RotationSpeed
				end
				
				local center = model.PrimaryPart.Position
				local offset = CFrame.new(0, 0, distance)
				local rotation = CFrame.Angles(0, rotationY, 0) * CFrame.Angles(rotationX, 0, 0)

				local camCF = CFrame.new(center) * rotation * offset

				camera.CFrame = CFrame.lookAt(camCF.Position, center)
				
			end
		end)
		
		-- context stuffs
		local context = Lib.ContextMenu.new()
		
		local absoluteSize = context.Gui.AbsoluteSize
		context.MaxHeight = (absoluteSize.Y <= 600 and (absoluteSize.Y - 40)) or nil

		-- Registers
		context:Register("STOP",{Name = "Stop Viewing", OnClick = function()
			ModelViewer.StopViewModel()
		end})
		context:Register("EXIT",{Name = "Exit", OnClick = function()
			ModelViewer.StopViewModel()
			context:Hide()
			window:Hide()
		end})
		context:Register("COPY_PATH",{Name = "Copy Path", OnClick = function()
			if model then
				env.setclipboard(getPath(originalModel))
			end
		end})
		context:Register("REFRESH",{Name = "Refresh", OnClick = function()
			if originalModel then
				ModelViewer.ViewModel(originalModel)
			end
		end})
		context:Register("ENABLE_AUTO_REFRESH",{Name = "Enable Auto Refresh", OnClick = function()
			if originalModel then
				ModelViewer.AutoRefresh = true
				ModelViewer.ViewModel(originalModel)
			end
		end})
		context:Register("DISABLE_AUTO_REFRESH",{Name = "Disable Auto Refresh", OnClick = function()
			if originalModel then
				ModelViewer.AutoRefresh = false
				ModelViewer.ViewModel(originalModel)
			end
		end})
		context:Register("SAVE_INST",{Name = "Save to File", OnClick = function()
			if model then
				Lib.SaveAsPrompt("Place_"..game.PlaceId.."_"..originalModel.Name.."_"..os.time(), function(filename)
					window:SetTitle(originalModel.Name.." - Model Viewer - Saving")	
					
					local success, result = pcall(env.saveinstance,
					originalModel, filename,
						{
							Decompile = true,
							RemovePlayerCharacters = false
						}
					)
					
					if success then
						window:SetTitle(originalModel.Name.." - Model Viewer - Saved")
						context:Hide()
						task.wait(5)
						if model then
							window:SetTitle(originalModel.Name.." - Model Viewer")
						end
					else
						window:SetTitle(originalModel.Name.." - Model Viewer - Error")
						warn("Error while saving model: "..result)
						context:Hide()
						task.wait(5)
						if model then
							window:SetTitle(originalModel.Name.." - Model Viewer")
						end
					end
				end)
			end
		end})
		
		context:Register("ENABLE_AUTO_ROTATE",{Name = "Enable Auto Rotate", OnClick = function()
			ModelViewer.AutoRotate = true
			
		end})
		context:Register("DISABLE_AUTO_ROTATE",{Name = "Disable Auto Rotate", OnClick = function()
			ModelViewer.AutoRotate = false
		end})
		context:Register("LOCK_CAM",{Name = "Lock Camera", OnClick = function()
			ModelViewer.EnableInputCamera = false
		end})
		context:Register("UNLOCK_CAM",{Name = "Unlock Camera", OnClick = function()
			ModelViewer.EnableInputCamera = true
		end})
		
		context:Register("ZOOM_IN",{Name = "Zoom In", OnClick = function()
			distance = math.clamp(distance - (ModelViewer.ZoomMultiplier * 2), 2, math.huge)
		end})
		
		context:Register("ZOOM_OUT",{Name = "Zoom Out", OnClick = function()
			distance = math.clamp(distance + (ModelViewer.ZoomMultiplier * 2), 2, math.huge)
		end})
		
		local function ShowContext()
			context:Clear()

			context:AddRegistered("STOP", not ModelViewer.IsViewing)	
			context:AddRegistered("REFRESH", not ModelViewer.IsViewing)
			context:AddRegistered("COPY_PATH", not ModelViewer.IsViewing)
			context:AddRegistered("SAVE_INST", not ModelViewer.IsViewing)
			context:AddDivider()
			
			if env.isonmobile then
				context:AddRegistered("ZOOM_IN")
				context:AddRegistered("ZOOM_OUT")
				context:AddDivider()
			end

			if ModelViewer.AutoRotate then
				context:AddRegistered("DISABLE_AUTO_ROTATE")
			else
				context:AddRegistered("ENABLE_AUTO_ROTATE")
			end
			if ModelViewer.AutoRefresh then
				context:AddRegistered("DISABLE_AUTO_REFRESH")
			else
				context:AddRegistered("ENABLE_AUTO_REFRESH")
			end
			if ModelViewer.EnableInputCamera then
				context:AddRegistered("LOCK_CAM")
			else
				context:AddRegistered("UNLOCK_CAM")
			end

			context:AddDivider()

			context:AddRegistered("EXIT")

			context:Show()
		end
		
		local function HideContext()
			context:Hide()
		end
		
		viewportFrame.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton2 then
				ShowContext()
			elseif input.UserInputType == Enum.UserInputType.MouseButton1 and Lib.CheckMouseInGui(context.Gui) then
				HideContext()
			end
		end)
		settingsButton.MouseButton1Click:Connect(function()
			ShowContext()
		end)
	end

	return ModelViewer
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
["Properties"] = function()
--[[
	Properties App Module
	
	The main properties interface
]]

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local function main()
	local Properties = {}

	local window, toolBar, propsFrame
	local scrollV, scrollH
	local categoryOrder
	local props,viewList,expanded,indexableProps,propEntries,autoUpdateObjs = {},{},{},{},{},{}
	local inputBox,inputTextBox,inputProp
	local checkboxes,propCons = {},{}
	local table,string = table,string
	local getPropChangedSignal = game.GetPropertyChangedSignal
	local getAttributeChangedSignal = game.GetAttributeChangedSignal
	local isa = game.IsA
	local getAttribute = game.GetAttribute
	local setAttribute = game.SetAttribute

	Properties.GuiElems = {}
	Properties.Index = 0
	Properties.ViewWidth = 0
	Properties.MinInputWidth = 100
	Properties.EntryIndent = 16
	Properties.EntryOffset = 4
	Properties.NameWidthCache = {}
	Properties.SubPropCache = {}
	Properties.ClassLists = {}
	Properties.SearchText = ""

	Properties.AddAttributeProp = {Category = "Attributes", Class = "", Name = "", SpecialRow = "AddAttribute", Tags = {}}
	Properties.SoundPreviewProp = {Category = "Data", ValueType = {Name = "SoundPlayer"}, Class = "Sound", Name = "Preview", Tags = {}}

	Properties.IgnoreProps = {
		["DataModel"] = {
			["PrivateServerId"] = true,
			["PrivateServerOwnerId"] = true,
			["VIPServerId"] = true,
			["VIPServerOwnerId"] = true
		}
	}

	Properties.ExpandableTypes = {
		["Vector2"] = true,
		["Vector3"] = true,
		["UDim"] = true,
		["UDim2"] = true,
		["CFrame"] = true,
		["Rect"] = true,
		["PhysicalProperties"] = true,
		["Ray"] = true,
		["NumberRange"] = true,
		["Faces"] = true,
		["Axes"] = true,
	}

	Properties.ExpandableProps = {
		["Sound.SoundId"] = true
	}

	Properties.CollapsedCategories = {
		["Surface Inputs"] = true,
		["Surface"] = true
	}

	Properties.ConflictSubProps = {
		["Vector2"] = {"X","Y"},
		["Vector3"] = {"X","Y","Z"},
		["UDim"] = {"Scale","Offset"},
		["UDim2"] = {"X","X.Scale","X.Offset","Y","Y.Scale","Y.Offset"},
		["CFrame"] = {"Position","Position.X","Position.Y","Position.Z",
			"RightVector","RightVector.X","RightVector.Y","RightVector.Z",
			"UpVector","UpVector.X","UpVector.Y","UpVector.Z",
			"LookVector","LookVector.X","LookVector.Y","LookVector.Z"},
		["Rect"] = {"Min.X","Min.Y","Max.X","Max.Y"},
		["PhysicalProperties"] = {"Density","Elasticity","ElasticityWeight","Friction","FrictionWeight"},
		["Ray"] = {"Origin","Origin.X","Origin.Y","Origin.Z","Direction","Direction.X","Direction.Y","Direction.Z"},
		["NumberRange"] = {"Min","Max"},
		["Faces"] = {"Back","Bottom","Front","Left","Right","Top"},
		["Axes"] = {"X","Y","Z"}
	}

	Properties.ConflictIgnore = {
		["BasePart"] = {
			["ResizableFaces"] = true
		}
	}

	Properties.RoundableTypes = {
		["float"] = true,
		["double"] = true,
		["Color3"] = true,
		["UDim"] = true,
		["UDim2"] = true,
		["Vector2"] = true,
		["Vector3"] = true,
		["NumberRange"] = true,
		["Rect"] = true,
		["NumberSequence"] = true,
		["ColorSequence"] = true,
		["Ray"] = true,
		["CFrame"] = true
	}

	Properties.TypeNameConvert = {
		["number"] = "double",
		["boolean"] = "bool"
	}

	Properties.ToNumberTypes = {
		["int"] = true,
		["int64"] = true,
		["float"] = true,
		["double"] = true
	}

	Properties.DefaultPropValue = {
		string = "",
		bool = false,
		double = 0,
		UDim = UDim.new(0,0),
		UDim2 = UDim2.new(0,0,0,0),
		BrickColor = BrickColor.new("Medium stone grey"),
		Color3 = Color3.new(1,1,1),
		Vector2 = Vector2.new(0,0),
		Vector3 = Vector3.new(0,0,0),
		NumberSequence = NumberSequence.new(1),
		ColorSequence = ColorSequence.new(Color3.new(1,1,1)),
		NumberRange = NumberRange.new(0),
		Rect = Rect.new(0,0,0,0)
	}

	Properties.AllowedAttributeTypes = {"string","boolean","number","UDim","UDim2","BrickColor","Color3","Vector2","Vector3","NumberSequence","ColorSequence","NumberRange","Rect"}

	Properties.StringToValue = function(prop,str)
		local typeData = prop.ValueType
		local typeName = typeData.Name

		if typeName == "string" or typeName == "Content" then
			return str
		elseif Properties.ToNumberTypes[typeName] then
			return tonumber(str)
		elseif typeName == "Vector2" then
			local vals = str:split(",")
			local x,y = tonumber(vals[1]),tonumber(vals[2])
			if x and y and #vals >= 2 then return Vector2.new(x,y) end
		elseif typeName == "Vector3" then
			local vals = str:split(",")
			local x,y,z = tonumber(vals[1]),tonumber(vals[2]),tonumber(vals[3])
			if x and y and z and #vals >= 3 then return Vector3.new(x,y,z) end
		elseif typeName == "UDim" then
			local vals = str:split(",")
			local scale,offset = tonumber(vals[1]),tonumber(vals[2])
			if scale and offset and #vals >= 2 then return UDim.new(scale,offset) end
		elseif typeName == "UDim2" then
			local vals = str:gsub("[{}]",""):split(",")
			local xScale,xOffset,yScale,yOffset = tonumber(vals[1]),tonumber(vals[2]),tonumber(vals[3]),tonumber(vals[4])
			if xScale and xOffset and yScale and yOffset and #vals >= 4 then return UDim2.new(xScale,xOffset,yScale,yOffset) end
		elseif typeName == "CFrame" then
			local vals = str:split(",")
			local s,result = pcall(CFrame.new,unpack(vals))
			if s and #vals >= 12 then return result end
		elseif typeName == "Rect" then
			local vals = str:split(",")
			local s,result = pcall(Rect.new,unpack(vals))
			if s and #vals >= 4 then return result end
		elseif typeName == "Ray" then
			local vals = str:gsub("[{}]",""):split(",")
			local s,origin = pcall(Vector3.new,unpack(vals,1,3))
			local s2,direction = pcall(Vector3.new,unpack(vals,4,6))
			if s and s2 and #vals >= 6 then return Ray.new(origin,direction) end
		elseif typeName == "NumberRange" then
			local vals = str:split(",")
			local s,result = pcall(NumberRange.new,unpack(vals))
			if s and #vals >= 1 then return result end
		elseif typeName == "Color3" then
			local vals = str:gsub("[{}]",""):split(",")
			local s,result = pcall(Color3.fromRGB,unpack(vals))
			if s and #vals >= 3 then return result end
		end

		return nil
	end

	Properties.ValueToString = function(prop,val)
		local typeData = prop.ValueType
		local typeName = typeData.Name

		if typeName == "Color3" then
			return Lib.ColorToBytes(val)
		elseif typeName == "NumberRange" then
			return val.Min..", "..val.Max
		end

		return tostring(val)
	end

	Properties.GetIndexableProps = function(obj,classData)
		if not Main.Elevated then
			if not pcall(function() return obj.ClassName end) then return nil end
		end

		local ignoreProps = Properties.IgnoreProps[classData.Name] or {}

		local result = {}
		local count = 1
		local props = classData.Properties
		for i = 1,#props do
			local prop = props[i]
			if not ignoreProps[prop.Name] then
				local s = pcall(function() return obj[prop.Name] end)
				if s then
					result[count] = prop
					count = count + 1
				end
			end
		end

		return result
	end

	Properties.FindFirstObjWhichIsA = function(class)
		local classList = Properties.ClassLists[class] or {}
		if classList and #classList > 0 then
			return classList[1]
		end

		return nil
	end

	Properties.ComputeConflicts = function(p)
		local maxConflictCheck = Settings.Properties.MaxConflictCheck
		local sList = Explorer.Selection.List
		local classLists = Properties.ClassLists
		local stringSplit = string.split
		local t_clear = table.clear
		local conflictIgnore = Properties.ConflictIgnore
		local conflictMap = {}
		local propList = p and {p} or props

		if p then
			local gName = p.Class.."."..p.Name
			autoUpdateObjs[gName] = nil
			local subProps = Properties.ConflictSubProps[p.ValueType.Name] or {}
			for i = 1,#subProps do
				autoUpdateObjs[gName.."."..subProps[i]] = nil
			end
		else
			table.clear(autoUpdateObjs)
		end

		if #sList > 0 then
			for i = 1,#propList do
				local prop = propList[i]
				local propName,propClass = prop.Name,prop.Class
				local typeData = prop.RootType or prop.ValueType
				local typeName = typeData.Name
				local attributeName = prop.AttributeName
				local gName = propClass.."."..propName

				local checked = 0
				local subProps = Properties.ConflictSubProps[typeName] or {}
				local subPropCount = #subProps
				local toCheck = subPropCount + 1
				local conflictsFound = 0
				local indexNames = {}
				local ignored = conflictIgnore[propClass] and conflictIgnore[propClass][propName]
				local truthyCheck = (typeName == "PhysicalProperties")
				local isAttribute = prop.IsAttribute
				local isMultiType = prop.MultiType

				t_clear(conflictMap)

				if not isMultiType then
					local firstVal,firstObj,firstSet
					local classList = classLists[prop.Class] or {}
					for c = 1,#classList do
						local obj = classList[c]
						if not firstSet then
							if isAttribute then
								firstVal = getAttribute(obj,attributeName)
								if firstVal ~= nil then
									firstObj = obj
									firstSet = true
								end
							else
								firstVal = obj[propName]
								firstObj = obj
								firstSet = true
							end
							if ignored then break end
						else
							local propVal,skip
							if isAttribute then
								propVal = getAttribute(obj,attributeName)
								if propVal == nil then skip = true end
							else
								propVal = obj[propName]
							end

							if not skip then
								if not conflictMap[1] then
									if truthyCheck then
										if (firstVal and true or false) ~= (propVal and true or false) then
											conflictMap[1] = true
											conflictsFound = conflictsFound + 1
										end
									elseif firstVal ~= propVal then
										conflictMap[1] = true
										conflictsFound = conflictsFound + 1
									end
								end

								if subPropCount > 0 then
									for sPropInd = 1,subPropCount do
										local indexes = indexNames[sPropInd]
										if not indexes then indexes = stringSplit(subProps[sPropInd],".") indexNames[sPropInd] = indexes end

										local firstValSub = firstVal
										local propValSub = propVal

										for j = 1,#indexes do
											if not firstValSub or not propValSub then break end -- PhysicalProperties
											local indexName = indexes[j]
											firstValSub = firstValSub[indexName]
											propValSub = propValSub[indexName]
										end

										local mapInd = sPropInd + 1
										if not conflictMap[mapInd] and firstValSub ~= propValSub then
											conflictMap[mapInd] = true
											conflictsFound = conflictsFound + 1
										end
									end
								end

								if conflictsFound == toCheck then break end
							end
						end

						checked = checked + 1
						if checked == maxConflictCheck then break end
					end

					if not conflictMap[1] then autoUpdateObjs[gName] = firstObj end
					for sPropInd = 1,subPropCount do
						if not conflictMap[sPropInd+1] then
							autoUpdateObjs[gName.."."..subProps[sPropInd]] = firstObj
						end
					end
				end
			end
		end

		if p then
			Properties.Refresh()
		end
	end

	-- Fetches the properties to be displayed based on the explorer selection
	Properties.ShowExplorerProps = function()
		local maxConflictCheck = Settings.Properties.MaxConflictCheck
		local sList = Explorer.Selection.List
		local foundClasses = {}
		local propCount = 1
		local elevated = Main.Elevated
		local showDeprecated,showHidden = Settings.Properties.ShowDeprecated,Settings.Properties.ShowHidden
		local Classes = API.Classes
		local classLists = {}
		local lower = string.lower
		local RMDCustomOrders = RMD.PropertyOrders
		local getAttributes = game.GetAttributes
		local maxAttrs = Settings.Properties.MaxAttributes
		local showingAttrs = Settings.Properties.ShowAttributes
		local foundAttrs = {}
		local attrCount = 0
		local typeof = typeof
		local typeNameConvert = Properties.TypeNameConvert

		table.clear(props)

		for i = 1,#sList do
			local node = sList[i]
			local obj = node.Obj
			local class = node.Class
			if not class then class = obj.ClassName node.Class = class end

			local apiClass = Classes[class]
			while apiClass do
				local APIClassName = apiClass.Name
				if not foundClasses[APIClassName] then
					local apiProps = indexableProps[APIClassName]
					if not apiProps then apiProps = Properties.GetIndexableProps(obj,apiClass) indexableProps[APIClassName] = apiProps end

					for i = 1,#apiProps do
						local prop = apiProps[i]
						local tags = prop.Tags
						if (not tags.Deprecated or showDeprecated) and (not tags.Hidden or showHidden) then
							props[propCount] = prop
							propCount = propCount + 1
						end
					end
					foundClasses[APIClassName] = true
				end

				local classList = classLists[APIClassName]
				if not classList then classList = {} classLists[APIClassName] = classList end
				classList[#classList+1] = obj

				apiClass = apiClass.Superclass
			end

			if showingAttrs and attrCount < maxAttrs then
				local attrs = getAttributes(obj)
				for name,val in pairs(attrs) do
					local typ = typeof(val)
					if not foundAttrs[name] then
						local category = (typ == "Instance" and "Class") or (typ == "EnumItem" and "Enum") or "Other"
						local valType = {Name = typeNameConvert[typ] or typ, Category = category}
						local attrProp = {IsAttribute = true, Name = "ATTR_"..name, AttributeName = name, DisplayName = name, Class = "Instance", ValueType = valType, Category = "Attributes", Tags = {}}
						props[propCount] = attrProp
						propCount = propCount + 1
						attrCount = attrCount + 1
						foundAttrs[name] = {typ,attrProp}
						if attrCount == maxAttrs then break end
					elseif foundAttrs[name][1] ~= typ then
						foundAttrs[name][2].MultiType = true
						foundAttrs[name][2].Tags.ReadOnly = true
						foundAttrs[name][2].ValueType = {Name = "string"}
					end
				end
			end
		end

		table.sort(props,function(a,b)
			if a.Category ~= b.Category then
				return (categoryOrder[a.Category] or 9999) < (categoryOrder[b.Category] or 9999)
			else
				local aOrder = (RMDCustomOrders[a.Class] and RMDCustomOrders[a.Class][a.Name]) or 9999999
				local bOrder = (RMDCustomOrders[b.Class] and RMDCustomOrders[b.Class][b.Name]) or 9999999
				if aOrder ~= bOrder then
					return aOrder < bOrder
				else
					return lower(a.Name) < lower(b.Name)
				end
			end
		end)

		-- Find conflicts and get auto-update instances
		Properties.ClassLists = classLists
		Properties.ComputeConflicts()
		--warn("CONFLICT",tick()-start)
		if #props > 0 then
			props[#props+1] = Properties.AddAttributeProp
		end

		Properties.Update()
		Properties.Refresh()
	end

	Properties.UpdateView = function()
		local maxEntries = math.ceil(propsFrame.AbsoluteSize.Y / 23)
		local maxX = propsFrame.AbsoluteSize.X
		local totalWidth = Properties.ViewWidth + Properties.MinInputWidth

		scrollV.VisibleSpace = maxEntries
		scrollV.TotalSpace = #viewList + 1
		scrollH.VisibleSpace = maxX
		scrollH.TotalSpace = totalWidth

		scrollV.Gui.Visible = #viewList + 1 > maxEntries
		scrollH.Gui.Visible = Settings.Properties.ScaleType == 0 and totalWidth > maxX

		local oldSize = propsFrame.Size
		propsFrame.Size = UDim2.new(1,(scrollV.Gui.Visible and -16 or 0),1,(scrollH.Gui.Visible and -39 or -23))
		if oldSize ~= propsFrame.Size then
			Properties.UpdateView()
		else
			scrollV:Update()
			scrollH:Update()

			if scrollV.Gui.Visible and scrollH.Gui.Visible then
				scrollV.Gui.Size = UDim2.new(0,16,1,-39)
				scrollH.Gui.Size = UDim2.new(1,-16,0,16)
				Properties.Window.GuiElems.Content.ScrollCorner.Visible = true
			else
				scrollV.Gui.Size = UDim2.new(0,16,1,-23)
				scrollH.Gui.Size = UDim2.new(1,0,0,16)
				Properties.Window.GuiElems.Content.ScrollCorner.Visible = false
			end

			Properties.Index = scrollV.Index
		end
	end

	Properties.MakeSubProp = function(prop,subName,valueType,displayName)
		local subProp = {}
		for i,v in pairs(prop) do
			subProp[i] = v
		end
		subProp.RootType = subProp.RootType or subProp.ValueType
		subProp.ValueType = valueType
		subProp.SubName = subProp.SubName and (subProp.SubName..subName) or subName
		subProp.DisplayName = displayName

		return subProp
	end

	Properties.GetExpandedProps = function(prop) -- TODO: Optimize using table
		local result = {}
		local typeData = prop.ValueType
		local typeName = typeData.Name
		local makeSubProp = Properties.MakeSubProp

		if typeName == "Vector2" then
			result[1] = makeSubProp(prop,".X",{Name = "float"})
			result[2] = makeSubProp(prop,".Y",{Name = "float"})
		elseif typeName == "Vector3" then
			result[1] = makeSubProp(prop,".X",{Name = "float"})
			result[2] = makeSubProp(prop,".Y",{Name = "float"})
			result[3] = makeSubProp(prop,".Z",{Name = "float"})
		elseif typeName == "CFrame" then
			result[1] = makeSubProp(prop,".Position",{Name = "Vector3"})
			result[2] = makeSubProp(prop,".RightVector",{Name = "Vector3"})
			result[3] = makeSubProp(prop,".UpVector",{Name = "Vector3"})
			result[4] = makeSubProp(prop,".LookVector",{Name = "Vector3"})
		elseif typeName == "UDim" then
			result[1] = makeSubProp(prop,".Scale",{Name = "float"})
			result[2] = makeSubProp(prop,".Offset",{Name = "int"})
		elseif typeName == "UDim2" then
			result[1] = makeSubProp(prop,".X",{Name = "UDim"})
			result[2] = makeSubProp(prop,".Y",{Name = "UDim"})
		elseif typeName == "Rect" then
			result[1] = makeSubProp(prop,".Min.X",{Name = "float"},"X0")
			result[2] = makeSubProp(prop,".Min.Y",{Name = "float"},"Y0")
			result[3] = makeSubProp(prop,".Max.X",{Name = "float"},"X1")
			result[4] = makeSubProp(prop,".Max.Y",{Name = "float"},"Y1")
		elseif typeName == "PhysicalProperties" then
			result[1] = makeSubProp(prop,".Density",{Name = "float"})
			result[2] = makeSubProp(prop,".Elasticity",{Name = "float"})
			result[3] = makeSubProp(prop,".ElasticityWeight",{Name = "float"})
			result[4] = makeSubProp(prop,".Friction",{Name = "float"})
			result[5] = makeSubProp(prop,".FrictionWeight",{Name = "float"})
		elseif typeName == "Ray" then
			result[1] = makeSubProp(prop,".Origin",{Name = "Vector3"})
			result[2] = makeSubProp(prop,".Direction",{Name = "Vector3"})
		elseif typeName == "NumberRange" then
			result[1] = makeSubProp(prop,".Min",{Name = "float"})
			result[2] = makeSubProp(prop,".Max",{Name = "float"})
		elseif typeName == "Faces" then
			result[1] = makeSubProp(prop,".Back",{Name = "bool"})
			result[2] = makeSubProp(prop,".Bottom",{Name = "bool"})
			result[3] = makeSubProp(prop,".Front",{Name = "bool"})
			result[4] = makeSubProp(prop,".Left",{Name = "bool"})
			result[5] = makeSubProp(prop,".Right",{Name = "bool"})
			result[6] = makeSubProp(prop,".Top",{Name = "bool"})
		elseif typeName == "Axes" then
			result[1] = makeSubProp(prop,".X",{Name = "bool"})
			result[2] = makeSubProp(prop,".Y",{Name = "bool"})
			result[3] = makeSubProp(prop,".Z",{Name = "bool"})
		end

		if prop.Name == "SoundId" and prop.Class == "Sound" then
			result[1] = Properties.SoundPreviewProp
		end

		return result
	end

	Properties.Update = function()
		table.clear(viewList)

		local nameWidthCache = Properties.NameWidthCache
		local lastCategory
		local count = 1
		local maxWidth,maxDepth = 0,1

		local textServ = service.TextService
		local getTextSize = textServ.GetTextSize
		local font = Enum.Font.SourceSans
		local size = Vector2.new(math.huge,20)
		local stringSplit = string.split
		local entryIndent = Properties.EntryIndent
		local isFirstScaleType = Settings.Properties.ScaleType == 0
		local find,lower = string.find,string.lower
		local searchText = (#Properties.SearchText > 0 and lower(Properties.SearchText))

		local function recur(props,depth)
			for i = 1,#props do
				local prop = props[i]
				local propName = prop.Name
				local subName = prop.SubName
				local category = prop.Category

				local visible
				if searchText and depth == 1 then
					if find(lower(propName),searchText,1,true) then
						visible = true
					end
				else
					visible = true
				end

				if visible and lastCategory ~= category then
					viewList[count] = {CategoryName = category}
					count = count + 1
					lastCategory = category
				end

				if (expanded["CAT_"..category] and visible) or prop.SpecialRow then
					if depth > 1 then prop.Depth = depth if depth > maxDepth then maxDepth = depth end end

					if isFirstScaleType then
						local nameArr = subName and stringSplit(subName,".")
						local displayName = prop.DisplayName or (nameArr and nameArr[#nameArr]) or propName

						local nameWidth = nameWidthCache[displayName]
						if not nameWidth then nameWidth = getTextSize(textServ,displayName,14,font,size).X nameWidthCache[displayName] = nameWidth end

						local totalWidth = nameWidth + entryIndent*depth
						if totalWidth > maxWidth then
							maxWidth = totalWidth
						end
					end

					viewList[count] = prop
					count = count + 1

					local fullName = prop.Class.."."..prop.Name..(prop.SubName or "")
					if expanded[fullName] then
						local nextDepth = depth+1
						local expandedProps = Properties.GetExpandedProps(prop)
						if #expandedProps > 0 then
							recur(expandedProps,nextDepth)
						end
					end
				end
			end
		end
		recur(props,1)

		inputProp = nil
		Properties.ViewWidth = maxWidth + 9 + Properties.EntryOffset
		Properties.UpdateView()
	end

	Properties.NewPropEntry = function(index)
		local newEntry = Properties.EntryTemplate:Clone()
		local nameFrame = newEntry.NameFrame
		local valueFrame = newEntry.ValueFrame
		local newCheckbox = Lib.Checkbox.new(1)
		newCheckbox.Gui.Position = UDim2.new(0,3,0,3)
		newCheckbox.Gui.Parent = valueFrame
		newCheckbox.OnInput:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			if prop.ValueType.Name == "PhysicalProperties" then
				Properties.SetProp(prop,newCheckbox.Toggled and true or nil)
			else
				Properties.SetProp(prop,newCheckbox.Toggled)
			end
		end)
		checkboxes[index] = newCheckbox

		local iconFrame = Main.MiscIcons:GetLabel()
		iconFrame.Position = UDim2.new(0,2,0,3)
		iconFrame.Parent = newEntry.ValueFrame.RightButton

		newEntry.Position = UDim2.new(0,0,0,23*(index-1))

		nameFrame.Expand.InputBegan:Connect(function(input)
			local prop = viewList[index + Properties.Index]
			if not prop or input.UserInputType ~= Enum.UserInputType.MouseMovement then return end

			local fullName = (prop.CategoryName and "CAT_"..prop.CategoryName) or prop.Class.."."..prop.Name..(prop.SubName or "")

			Main.MiscIcons:DisplayByKey(newEntry.NameFrame.Expand.Icon, expanded[fullName] and "Collapse_Over" or "Expand_Over")
		end)

		nameFrame.Expand.InputEnded:Connect(function(input)
			local prop = viewList[index + Properties.Index]
			if not prop or input.UserInputType ~= Enum.UserInputType.MouseMovement then return end

			local fullName = (prop.CategoryName and "CAT_"..prop.CategoryName) or prop.Class.."."..prop.Name..(prop.SubName or "")

			Main.MiscIcons:DisplayByKey(newEntry.NameFrame.Expand.Icon, expanded[fullName] and "Collapse" or "Expand")
		end)

		nameFrame.Expand.MouseButton1Down:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			local fullName = (prop.CategoryName and "CAT_"..prop.CategoryName) or prop.Class.."."..prop.Name..(prop.SubName or "")
			if not prop.CategoryName and not Properties.ExpandableTypes[prop.ValueType and prop.ValueType.Name] and not Properties.ExpandableProps[fullName] then return end

			expanded[fullName] = not expanded[fullName]
			Properties.Update()
			Properties.Refresh()
		end)

		nameFrame.PropName.InputBegan:Connect(function(input)
			local prop = viewList[index + Properties.Index]
			if not prop then return end
			if input.UserInputType == Enum.UserInputType.MouseMovement and not nameFrame.PropName.TextFits then
				local fullNameFrame = Properties.FullNameFrame	
				local nameArr = string.split(prop.Class.."."..prop.Name..(prop.SubName or ""),".")
				local dispName = prop.DisplayName or nameArr[#nameArr]
				local sizeX = service.TextService:GetTextSize(dispName,14,Enum.Font.SourceSans,Vector2.new(math.huge,20)).X

				fullNameFrame.TextLabel.Text = dispName
				--fullNameFrame.Position = UDim2.new(0,Properties.EntryIndent*(prop.Depth or 1) + Properties.EntryOffset,0,23*(index-1))
				fullNameFrame.Size = UDim2.new(0,sizeX + 4,0,22)
				fullNameFrame.Visible = true
				Properties.FullNameFrameIndex = index
				Properties.FullNameFrameAttach.SetData(fullNameFrame, {Target = nameFrame})
				Properties.FullNameFrameAttach.Enable()
			end
		end)

		nameFrame.PropName.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement and Properties.FullNameFrameIndex == index then
				Properties.FullNameFrame.Visible = false
				Properties.FullNameFrameAttach.Disable()
			end
		end)

		valueFrame.ValueBox.MouseButton1Down:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			Properties.SetInputProp(prop,index)
		end)

		valueFrame.ColorButton.MouseButton1Down:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			Properties.SetInputProp(prop,index,"color")
		end)

		valueFrame.RightButton.MouseButton1Click:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			local fullName = prop.Class.."."..prop.Name..(prop.SubName or "")
			local inputFullName = inputProp and (inputProp.Class.."."..inputProp.Name..(inputProp.SubName or ""))

			if fullName == inputFullName and inputProp.ValueType.Category == "Class" then
				inputProp = nil
				Properties.SetProp(prop,nil)
			else
				Properties.SetInputProp(prop,index,"right")
			end
		end)

		nameFrame.ToggleAttributes.MouseButton1Click:Connect(function()
			Settings.Properties.ShowAttributes = not Settings.Properties.ShowAttributes
			Properties.ShowExplorerProps()
		end)

		newEntry.RowButton.MouseButton1Click:Connect(function()
			Properties.DisplayAddAttributeWindow()
		end)

		newEntry.EditAttributeButton.MouseButton1Down:Connect(function()
			local prop = viewList[index + Properties.Index]
			if not prop then return end

			Properties.DisplayAttributeContext(prop)
		end)

		valueFrame.SoundPreview.ControlButton.MouseButton1Click:Connect(function()
			if Properties.PreviewSound and Properties.PreviewSound.Playing then
				Properties.SetSoundPreview(false)
			else
				local soundObj = Properties.FindFirstObjWhichIsA("Sound")
				if soundObj then Properties.SetSoundPreview(soundObj) end
			end
		end)

		valueFrame.SoundPreview.InputBegan:Connect(function(input)
			if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

			local releaseEvent,mouseEvent
			releaseEvent = service.UserInputService.InputEnded:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
				releaseEvent:Disconnect()
				mouseEvent:Disconnect()
			end)

			local timeLine = newEntry.ValueFrame.SoundPreview.TimeLine
			local soundObj = Properties.FindFirstObjWhichIsA("Sound")
			if soundObj then Properties.SetSoundPreview(soundObj,true) end

			local function update(input)
				local sound = Properties.PreviewSound
				if not sound or sound.TimeLength == 0 then return end

				local mouseX = input.Position.X
				local timeLineSize = timeLine.AbsoluteSize
				local relaX = mouseX - timeLine.AbsolutePosition.X

				if timeLineSize.X <= 1 then return end
				if relaX < 0 then relaX = 0 elseif relaX >= timeLineSize.X then relaX = timeLineSize.X-1 end

				local perc = (relaX/(timeLineSize.X-1))
				sound.TimePosition = perc*sound.TimeLength
				timeLine.Slider.Position = UDim2.new(perc,-4,0,-8)
			end
			update(input)

			mouseEvent = service.UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					update(input)
				end
			end)
		end)

		newEntry.Parent = propsFrame

		return {
			Gui = newEntry,
			GuiElems = {
				NameFrame = nameFrame,
				ValueFrame = valueFrame,
				PropName = nameFrame.PropName,
				ValueBox = valueFrame.ValueBox,
				Expand = nameFrame.Expand,
				ColorButton = valueFrame.ColorButton,
				ColorPreview = valueFrame.ColorButton.ColorPreview,
				Gradient = valueFrame.ColorButton.ColorPreview.UIGradient,
				EnumArrow = valueFrame.EnumArrow,
				Checkbox = valueFrame.Checkbox,
				RightButton = valueFrame.RightButton,
				RightButtonIcon = iconFrame,
				RowButton = newEntry.RowButton,
				EditAttributeButton = newEntry.EditAttributeButton,
				ToggleAttributes = nameFrame.ToggleAttributes,
				SoundPreview = valueFrame.SoundPreview,
				SoundPreviewSlider = valueFrame.SoundPreview.TimeLine.Slider
			}
		}
	end

	Properties.GetSoundPreviewEntry = function()
		for i = 1,#viewList do
			if viewList[i] == Properties.SoundPreviewProp then
				return propEntries[i - Properties.Index]
			end
		end
	end

	Properties.SetSoundPreview = function(soundObj,noplay)
		local sound = Properties.PreviewSound
		if not sound then
			sound = Instance.new("Sound")
			sound.Name = "Preview"
			sound.Paused:Connect(function()
				local entry = Properties.GetSoundPreviewEntry()
				if entry then Main.MiscIcons:DisplayByKey(entry.GuiElems.SoundPreview.ControlButton.Icon, "Play") end
			end)
			sound.Resumed:Connect(function() Properties.Refresh() end)
			sound.Ended:Connect(function()
				local entry = Properties.GetSoundPreviewEntry()
				if entry then entry.GuiElems.SoundPreviewSlider.Position = UDim2.new(0,-4,0,-8) end
				Properties.Refresh()
			end)
			sound.Parent = window.Gui
			Properties.PreviewSound = sound
		end

		if not soundObj then
			sound:Pause()
		else
			local newId = sound.SoundId ~= soundObj.SoundId
			sound.SoundId = soundObj.SoundId
			sound.PlaybackSpeed = soundObj.PlaybackSpeed
			sound.Volume = soundObj.Volume
			if newId then sound.TimePosition = 0 end
			if not noplay then sound:Resume() end

			coroutine.wrap(function()
				local previewTime = tick()
				Properties.SoundPreviewTime = previewTime
				while previewTime == Properties.SoundPreviewTime and sound.Playing do
					local entry = Properties.GetSoundPreviewEntry()
					if entry then
						local tl = sound.TimeLength
						local perc = sound.TimePosition/(tl == 0 and 1 or tl)
						entry.GuiElems.SoundPreviewSlider.Position = UDim2.new(perc,-4,0,-8)
					end
					Lib.FastWait()
				end
			end)()
			Properties.Refresh()
		end
	end

	Properties.DisplayAttributeContext = function(prop)
		local context = Properties.AttributeContext
		if not context then
			context = Lib.ContextMenu.new()
			context.Iconless = true
			context.Width = 80
		end
		context:Clear()

		context:Add({Name = "Edit", OnClick = function()
			Properties.DisplayAddAttributeWindow(prop)
		end})
		context:Add({Name = "Delete", OnClick = function()
			Properties.SetProp(prop,nil,true)
			Properties.ShowExplorerProps()
		end})

		context:Show()
	end

	Properties.DisplayAddAttributeWindow = function(editAttr)
		local win = Properties.AddAttributeWindow
		if not win then
			win = Lib.Window.new()
			win.Alignable = false
			win.Resizable = false
			win:SetTitle("Add Attribute")
			win:SetSize(200,130)

			local saveButton = Lib.Button.new()
			local nameLabel = Lib.Label.new()
			nameLabel.Text = "Name"
			nameLabel.Position = UDim2.new(0,30,0,10)
			nameLabel.Size = UDim2.new(0,40,0,20)
			win:Add(nameLabel)

			local nameBox = Lib.ViewportTextBox.new()
			nameBox.Position = UDim2.new(0,75,0,10)
			nameBox.Size = UDim2.new(0,120,0,20)
			win:Add(nameBox,"NameBox")
			nameBox.TextBox:GetPropertyChangedSignal("Text"):Connect(function()
				saveButton:SetDisabled(#nameBox:GetText() == 0)
			end)

			local typeLabel = Lib.Label.new()
			typeLabel.Text = "Type"
			typeLabel.Position = UDim2.new(0,30,0,40)
			typeLabel.Size = UDim2.new(0,40,0,20)
			win:Add(typeLabel)

			local typeChooser = Lib.DropDown.new()
			typeChooser.CanBeEmpty = false
			typeChooser.Position = UDim2.new(0,75,0,40)
			typeChooser.Size = UDim2.new(0,120,0,20)
			typeChooser:SetOptions(Properties.AllowedAttributeTypes)
			win:Add(typeChooser,"TypeChooser")

			local errorLabel = Lib.Label.new()
			errorLabel.Text = ""
			errorLabel.Position = UDim2.new(0,5,1,-45)
			errorLabel.Size = UDim2.new(1,-10,0,20)
			errorLabel.TextColor3 = Settings.Theme.Important
			win.ErrorLabel = errorLabel
			win:Add(errorLabel,"Error")

			local cancelButton = Lib.Button.new()
			cancelButton.Text = "Cancel"
			cancelButton.Position = UDim2.new(1,-97,1,-25)
			cancelButton.Size = UDim2.new(0,92,0,20)
			cancelButton.OnClick:Connect(function()
				win:Close()
			end)
			win:Add(cancelButton)

			saveButton.Text = "Save"
			saveButton.Position = UDim2.new(0,5,1,-25)
			saveButton.Size = UDim2.new(0,92,0,20)
			saveButton.OnClick:Connect(function()
				local name = nameBox:GetText()
				if #name > 100 then
					errorLabel.Text = "Error: Name over 100 chars"
					return
				elseif name:sub(1,3) == "RBX" then
					errorLabel.Text = "Error: Name begins with 'RBX'"
					return
				end

				local typ = typeChooser.Selected
				local valType = {Name = Properties.TypeNameConvert[typ] or typ, Category = "DataType"}
				local attrProp = {IsAttribute = true, Name = "ATTR_"..name, AttributeName = name, DisplayName = name, Class = "Instance", ValueType = valType, Category = "Attributes", Tags = {}}

				Settings.Properties.ShowAttributes = true
				Properties.SetProp(attrProp,Properties.DefaultPropValue[valType.Name],true,Properties.EditingAttribute)
				Properties.ShowExplorerProps()
				win:Close()
			end)
			win:Add(saveButton,"SaveButton")

			Properties.AddAttributeWindow = win
		end

		Properties.EditingAttribute = editAttr
		win:SetTitle(editAttr and "Edit Attribute "..editAttr.AttributeName or "Add Attribute")
		win.Elements.Error.Text = ""
		win.Elements.NameBox:SetText("")
		win.Elements.SaveButton:SetDisabled(true)
		win.Elements.TypeChooser:SetSelected(1)
		win:Show()
	end

	Properties.IsTextEditable = function(prop)
		local typeData = prop.ValueType
		local typeName = typeData.Name

		return typeName ~= "bool" and typeData.Category ~= "Enum" and typeData.Category ~= "Class" and typeName ~= "BrickColor"
	end

	Properties.DisplayEnumDropdown = function(entryIndex)
		local context = Properties.EnumContext
		if not context then
			context = Lib.ContextMenu.new()
			context.Iconless = true
			context.MaxHeight = 200
			context.ReverseYOffset = 22
			Properties.EnumDropdown = context
		end

		if not inputProp or inputProp.ValueType.Category ~= "Enum" then return end
		local prop = inputProp

		local entry = propEntries[entryIndex]
		local valueFrame = entry.GuiElems.ValueFrame

		local enum = Enum[prop.ValueType.Name]
		if not enum then return end

		local sorted = {}
		for name,enum in next,enum:GetEnumItems() do
			sorted[#sorted+1] = enum
		end
		table.sort(sorted,function(a,b) return a.Name < b.Name end)

		context:Clear()

		local function onClick(name)
			if prop ~= inputProp then return end

			local enumItem = enum[name]
			inputProp = nil
			Properties.SetProp(prop,enumItem)
		end

		for i = 1,#sorted do
			local enumItem = sorted[i]
			context:Add({Name = enumItem.Name, OnClick = onClick})
		end

		context.Width = valueFrame.AbsoluteSize.X
		context:Show(valueFrame.AbsolutePosition.X, valueFrame.AbsolutePosition.Y + 22)
	end

	Properties.DisplayBrickColorEditor = function(prop,entryIndex,col)
		local editor = Properties.BrickColorEditor
		if not editor then
			editor = Lib.BrickColorPicker.new()
			editor.Gui.DisplayOrder = Main.DisplayOrders.Menu
			editor.ReverseYOffset = 22

			editor.OnSelect:Connect(function(col)
				if not editor.CurrentProp or editor.CurrentProp.ValueType.Name ~= "BrickColor" then return end

				if editor.CurrentProp == inputProp then inputProp = nil end
				Properties.SetProp(editor.CurrentProp,BrickColor.new(col))
			end)

			editor.OnMoreColors:Connect(function() -- TODO: Special Case BasePart.BrickColor to BasePart.Color
				editor:Close()
				local colProp
				for i,v in pairs(API.Classes.BasePart.Properties) do
					if v.Name == "Color" then
						colProp = v
						break
					end
				end
				Properties.DisplayColorEditor(colProp,editor.SavedColor.Color)
			end)

			Properties.BrickColorEditor = editor
		end

		local entry = propEntries[entryIndex]
		local valueFrame = entry.GuiElems.ValueFrame

		editor.CurrentProp = prop
		editor.SavedColor = col
		if prop and prop.Class == "BasePart" and prop.Name == "BrickColor" then
			editor:SetMoreColorsVisible(true)
		else
			editor:SetMoreColorsVisible(false)
		end
		editor:Show(valueFrame.AbsolutePosition.X, valueFrame.AbsolutePosition.Y + 22)
	end

	Properties.DisplayColorEditor = function(prop,col)
		local editor = Properties.ColorEditor
		if not editor then
			editor = Lib.ColorPicker.new()

			editor.OnSelect:Connect(function(col)
				if not editor.CurrentProp then return end
				local typeName = editor.CurrentProp.ValueType.Name
				if typeName ~= "Color3" and typeName ~= "BrickColor" then return end

				local colVal = (typeName == "Color3" and col or BrickColor.new(col))

				if editor.CurrentProp == inputProp then inputProp = nil end
				Properties.SetProp(editor.CurrentProp,colVal)
			end)

			Properties.ColorEditor = editor
		end

		editor.CurrentProp = prop
		if col then
			editor:SetColor(col)
		else
			local firstVal = Properties.GetFirstPropVal(prop)
			if firstVal then editor:SetColor(firstVal) end
		end
		editor:Show()
	end

	Properties.DisplayNumberSequenceEditor = function(prop,seq)
		local editor = Properties.NumberSequenceEditor
		if not editor then
			editor = Lib.NumberSequenceEditor.new()

			editor.OnSelect:Connect(function(val)
				if not editor.CurrentProp or editor.CurrentProp.ValueType.Name ~= "NumberSequence" then return end

				if editor.CurrentProp == inputProp then inputProp = nil end
				Properties.SetProp(editor.CurrentProp,val)
			end)

			Properties.NumberSequenceEditor = editor
		end

		editor.CurrentProp = prop
		if seq then
			editor:SetSequence(seq)
		else
			local firstVal = Properties.GetFirstPropVal(prop)
			if firstVal then editor:SetSequence(firstVal) end
		end
		editor:Show()
	end

	Properties.DisplayColorSequenceEditor = function(prop,seq)
		local editor = Properties.ColorSequenceEditor
		if not editor then
			editor = Lib.ColorSequenceEditor.new()

			editor.OnSelect:Connect(function(val)
				if not editor.CurrentProp or editor.CurrentProp.ValueType.Name ~= "ColorSequence" then return end

				if editor.CurrentProp == inputProp then inputProp = nil end
				Properties.SetProp(editor.CurrentProp,val)
			end)

			Properties.ColorSequenceEditor = editor
		end

		editor.CurrentProp = prop
		if seq then
			editor:SetSequence(seq)
		else
			local firstVal = Properties.GetFirstPropVal(prop)
			if firstVal then editor:SetSequence(firstVal) end
		end
		editor:Show()
	end

	Properties.GetFirstPropVal = function(prop)
		local first = Properties.FindFirstObjWhichIsA(prop.Class)
		if first then
			return Properties.GetPropVal(prop,first)
		end
	end

	Properties.GetPropVal = function(prop,obj)
		if prop.MultiType then return "<Multiple Types>" end
		if not obj then return end

		local propVal
		if prop.IsAttribute then
			propVal = getAttribute(obj,prop.AttributeName)
			if propVal == nil then return nil end

			local typ = typeof(propVal)
			local currentType = Properties.TypeNameConvert[typ] or typ
			if prop.RootType then
				if prop.RootType.Name ~= currentType then
					return nil
				end
			elseif prop.ValueType.Name ~= currentType then
				return nil
			end
		else
			propVal = obj[prop.Name]
		end
		if prop.SubName then
			local indexes = string.split(prop.SubName,".")
			for i = 1,#indexes do
				local indexName = indexes[i]
				if #indexName > 0 and propVal then
					propVal = propVal[indexName]
				end
			end
		end

		return propVal
	end

	Properties.SelectObject = function(obj)
		if inputProp and inputProp.ValueType.Category == "Class" then
			local prop = inputProp
			inputProp = nil

			if isa(obj,prop.ValueType.Name) then
				Properties.SetProp(prop,obj)
			else
				Properties.Refresh()
			end

			return true
		end

		return false
	end

	Properties.DisplayProp = function(prop,entryIndex)
		local propName = prop.Name
		local typeData = prop.ValueType
		local typeName = typeData.Name
		local tags = prop.Tags
		local gName = prop.Class.."."..prop.Name..(prop.SubName or "")
		local propObj = autoUpdateObjs[gName]
		local entryData = propEntries[entryIndex]
		local UDim2 = UDim2

		local guiElems = entryData.GuiElems
		local valueFrame = guiElems.ValueFrame
		local valueBox = guiElems.ValueBox
		local colorButton = guiElems.ColorButton
		local colorPreview = guiElems.ColorPreview
		local gradient = guiElems.Gradient
		local enumArrow = guiElems.EnumArrow
		local checkbox = guiElems.Checkbox
		local rightButton = guiElems.RightButton
		local soundPreview = guiElems.SoundPreview

		local propVal = Properties.GetPropVal(prop,propObj)
		local inputFullName = inputProp and (inputProp.Class.."."..inputProp.Name..(inputProp.SubName or ""))

		local offset = 4
		local endOffset = 6

		-- Offsetting the ValueBox for ValueType specific buttons
		if (typeName == "Color3" or typeName == "BrickColor" or typeName == "ColorSequence") then
			colorButton.Visible = true
			enumArrow.Visible = false
			if propVal then
				gradient.Color = (typeName == "Color3" and ColorSequence.new(propVal)) or (typeName == "BrickColor" and ColorSequence.new(propVal.Color)) or propVal
			else
				gradient.Color = ColorSequence.new(Color3.new(1,1,1))
			end
			colorPreview.BorderColor3 = (typeName == "ColorSequence" and Color3.new(1,1,1) or Color3.new(0,0,0))
			offset = 22
			endOffset = 24 + (typeName == "ColorSequence" and 20 or 0)
		elseif typeData.Category == "Enum" then
			colorButton.Visible = false
			enumArrow.Visible = not prop.Tags.ReadOnly
			endOffset = 22
		elseif (gName == inputFullName and typeData.Category == "Class") or typeName == "NumberSequence" then
			colorButton.Visible = false
			enumArrow.Visible = false
			endOffset = 26
		else
			colorButton.Visible = false
			enumArrow.Visible = false
		end

		valueBox.Position = UDim2.new(0,offset,0,0)
		valueBox.Size = UDim2.new(1,-endOffset,1,0)

		-- Right button
		if inputFullName == gName and typeData.Category == "Class" then
			Main.MiscIcons:DisplayByKey(guiElems.RightButtonIcon, "Delete")
			guiElems.RightButtonIcon.Visible = true
			rightButton.Text = ""
			rightButton.Visible = true
		elseif typeName == "NumberSequence" or typeName == "ColorSequence" then
			guiElems.RightButtonIcon.Visible = false
			rightButton.Text = "..."
			rightButton.Visible = true
		else
			rightButton.Visible = false
		end

		-- Displays the correct ValueBox for the ValueType, and sets it to the prop value
		if typeName == "bool" or typeName == "PhysicalProperties" then
			valueBox.Visible = false
			checkbox.Visible = true
			soundPreview.Visible = false
			checkboxes[entryIndex].Disabled = tags.ReadOnly
			if typeName == "PhysicalProperties" and autoUpdateObjs[gName] then
				checkboxes[entryIndex]:SetState(propVal and true or false)
			else
				checkboxes[entryIndex]:SetState(propVal)
			end
		elseif typeName == "SoundPlayer" then
			valueBox.Visible = false
			checkbox.Visible = false
			soundPreview.Visible = true
			local playing = Properties.PreviewSound and Properties.PreviewSound.Playing
			Main.MiscIcons:DisplayByKey(soundPreview.ControlButton.Icon, playing and "Pause" or "Play")
		else
			valueBox.Visible = true
			checkbox.Visible = false
			soundPreview.Visible = false

			if propVal ~= nil then
				if typeName == "Color3" then
					valueBox.Text = "["..Lib.ColorToBytes(propVal).."]"
				elseif typeData.Category == "Enum" then
					valueBox.Text = propVal.Name
				elseif Properties.RoundableTypes[typeName] and Settings.Properties.NumberRounding then
					local rawStr = Properties.ValueToString(prop,propVal)
					valueBox.Text = rawStr:gsub("-?%d+%.%d+",function(num)
						return tostring(tonumber(("%."..Settings.Properties.NumberRounding.."f"):format(num)))
					end)
				else
					valueBox.Text = Properties.ValueToString(prop,propVal)
				end
			else
				valueBox.Text = ""
			end

			valueBox.TextColor3 = tags.ReadOnly and Settings.Theme.PlaceholderText or Settings.Theme.Text
		end
	end

	Properties.Refresh = function()
		local maxEntries = math.max(math.ceil((propsFrame.AbsoluteSize.Y) / 23),0)	
		local maxX = propsFrame.AbsoluteSize.X
		local valueWidth = math.max(Properties.MinInputWidth,maxX-Properties.ViewWidth)
		local inputPropVisible = false
		local isa = game.IsA
		local UDim2 = UDim2
		local stringSplit = string.split
		local scaleType = Settings.Properties.ScaleType

		-- Clear connections
		for i = 1,#propCons do
			propCons[i]:Disconnect()
		end
		table.clear(propCons)

		-- Hide full name viewer
		Properties.FullNameFrame.Visible = false
		Properties.FullNameFrameAttach.Disable()

		for i = 1,maxEntries do
			local entryData = propEntries[i]
			if not propEntries[i] then entryData = Properties.NewPropEntry(i) propEntries[i] = entryData end

			local entry = entryData.Gui
			local guiElems = entryData.GuiElems
			local nameFrame = guiElems.NameFrame
			local propNameLabel = guiElems.PropName
			local valueFrame = guiElems.ValueFrame
			local expand = guiElems.Expand
			local valueBox = guiElems.ValueBox
			local propNameBox = guiElems.PropName
			local rightButton = guiElems.RightButton
			local editAttributeButton = guiElems.EditAttributeButton
			local toggleAttributes = guiElems.ToggleAttributes

			local prop = viewList[i + Properties.Index]
			if prop then
				local entryXOffset = (scaleType == 0 and scrollH.Index or 0)
				entry.Visible = true
				entry.Position = UDim2.new(0,-entryXOffset,0,entry.Position.Y.Offset)
				entry.Size = UDim2.new(scaleType == 0 and 0 or 1, scaleType == 0 and Properties.ViewWidth + valueWidth or 0,0,22)

				if prop.SpecialRow then
					if prop.SpecialRow == "AddAttribute" then
						nameFrame.Visible = false
						valueFrame.Visible = false
						guiElems.RowButton.Visible = true
					end
				else
					-- Revert special row stuff
					nameFrame.Visible = true
					guiElems.RowButton.Visible = false

					local depth = Properties.EntryIndent*(prop.Depth or 1)
					local leftOffset = depth + Properties.EntryOffset
					nameFrame.Position = UDim2.new(0,leftOffset,0,0)
					propNameLabel.Size = UDim2.new(1,-2 - (scaleType == 0 and 0 or 6),1,0)

					local gName = (prop.CategoryName and "CAT_"..prop.CategoryName) or prop.Class.."."..prop.Name..(prop.SubName or "")

					if prop.CategoryName then
						entry.BackgroundColor3 = Settings.Theme.Main1
						valueFrame.Visible = false

						propNameBox.Text = prop.CategoryName
						propNameBox.Font = Enum.Font.SourceSansBold
						expand.Visible = true
						propNameBox.TextColor3 = Settings.Theme.Text
						nameFrame.BackgroundTransparency = 1
						nameFrame.Size = UDim2.new(1,0,1,0)
						editAttributeButton.Visible = false

						local showingAttrs = Settings.Properties.ShowAttributes
						toggleAttributes.Position = UDim2.new(1,-85-leftOffset,0,0)
						toggleAttributes.Text = (showingAttrs and "[Setting: ON]" or "[Setting: OFF]")
						toggleAttributes.TextColor3 = Settings.Theme.Text
						toggleAttributes.Visible = (prop.CategoryName == "Attributes")
					else
						local propName = prop.Name
						local typeData = prop.ValueType
						local typeName = typeData.Name
						local tags = prop.Tags
						local propObj = autoUpdateObjs[gName]

						local attributeOffset = (prop.IsAttribute and 20 or 0)
						editAttributeButton.Visible = (prop.IsAttribute and not prop.RootType)
						toggleAttributes.Visible = false

						-- Moving around the frames
						if scaleType == 0 then
							nameFrame.Size = UDim2.new(0,Properties.ViewWidth - leftOffset - 1,1,0)
							valueFrame.Position = UDim2.new(0,Properties.ViewWidth,0,0)
							valueFrame.Size = UDim2.new(0,valueWidth - attributeOffset,1,0)
						else
							nameFrame.Size = UDim2.new(0.5,-leftOffset - 1,1,0)
							valueFrame.Position = UDim2.new(0.5,0,0,0)
							valueFrame.Size = UDim2.new(0.5,-attributeOffset,1,0)
						end

						local nameArr = stringSplit(gName,".")
						propNameBox.Text = prop.DisplayName or nameArr[#nameArr]
						propNameBox.Font = Enum.Font.SourceSans
						entry.BackgroundColor3 = Settings.Theme.Main2
						valueFrame.Visible = true

						expand.Visible = typeData.Category == "DataType" and Properties.ExpandableTypes[typeName] or Properties.ExpandableProps[gName]
						propNameBox.TextColor3 = tags.ReadOnly and Settings.Theme.PlaceholderText or Settings.Theme.Text

						-- Display property value
						Properties.DisplayProp(prop,i)
						if propObj then
							if prop.IsAttribute then
								propCons[#propCons+1] = getAttributeChangedSignal(propObj,prop.AttributeName):Connect(function()
									Properties.DisplayProp(prop,i)
								end)
							else
								propCons[#propCons+1] = getPropChangedSignal(propObj,propName):Connect(function()
									Properties.DisplayProp(prop,i)
								end)
							end
						end

						-- Position and resize Input Box
						local beforeVisible = valueBox.Visible
						local inputFullName = inputProp and (inputProp.Class.."."..inputProp.Name..(inputProp.SubName or ""))
						if gName == inputFullName then
							nameFrame.BackgroundColor3 = Settings.Theme.ListSelection
							nameFrame.BackgroundTransparency = 0
							if typeData.Category == "Class" or typeData.Category == "Enum" or typeName == "BrickColor" then
								valueFrame.BackgroundColor3 = Settings.Theme.TextBox
								valueFrame.BackgroundTransparency = 0
								valueBox.Visible = true
							else
								inputPropVisible = true
								local scale = (scaleType == 0 and 0 or 0.5)
								local offset = (scaleType == 0 and Properties.ViewWidth-scrollH.Index or 0)
								local endOffset = 0

								if typeName == "Color3" or typeName == "ColorSequence" then
									offset = offset + 22
								end

								if typeName == "NumberSequence" or typeName == "ColorSequence" then
									endOffset = 20
								end

								inputBox.Position = UDim2.new(scale,offset,0,entry.Position.Y.Offset)
								inputBox.Size = UDim2.new(1-scale,-offset-endOffset-attributeOffset,0,22)
								inputBox.Visible = true
								valueBox.Visible = false
							end
						else
							nameFrame.BackgroundColor3 = Settings.Theme.Main1
							nameFrame.BackgroundTransparency = 1
							valueFrame.BackgroundColor3 = Settings.Theme.Main1
							valueFrame.BackgroundTransparency = 1
							valueBox.Visible = beforeVisible
						end
					end

					-- Expand
					if prop.CategoryName or Properties.ExpandableTypes[prop.ValueType and prop.ValueType.Name] or Properties.ExpandableProps[gName] then
						if Lib.CheckMouseInGui(expand) then
							Main.MiscIcons:DisplayByKey(expand.Icon, expanded[gName] and "Collapse_Over" or "Expand_Over")
						else
							Main.MiscIcons:DisplayByKey(expand.Icon, expanded[gName] and "Collapse" or "Expand")
						end
						expand.Visible = true
					else
						expand.Visible = false
					end
				end
				entry.Visible = true
			else
				entry.Visible = false
			end
		end

		if not inputPropVisible then
			inputBox.Visible = false
		end

		for i = maxEntries+1,#propEntries do
			propEntries[i].Gui:Destroy()
			propEntries[i] = nil
			checkboxes[i] = nil
		end
	end

	Properties.SetProp = function(prop,val,noupdate,prevAttribute)
		local sList = Explorer.Selection.List
		local propName = prop.Name
		local subName = prop.SubName
		local propClass = prop.Class
		local typeData = prop.ValueType
		local typeName = typeData.Name
		local attributeName = prop.AttributeName
		local rootTypeData = prop.RootType
		local rootTypeName = rootTypeData and rootTypeData.Name
		local fullName = prop.Class.."."..prop.Name..(prop.SubName or "")
		local Vector3 = Vector3

		for i = 1,#sList do
			local node = sList[i]
			local obj = node.Obj

			if isa(obj,propClass) then
				pcall(function()
					local setVal = val
					local root
					if prop.IsAttribute then
						root = getAttribute(obj,attributeName)
					else
						root = obj[propName]
					end

					if prevAttribute then
						if prevAttribute.ValueType.Name == typeName then
							setVal = getAttribute(obj,prevAttribute.AttributeName) or setVal
						end
						setAttribute(obj,prevAttribute.AttributeName,nil)
					end

					if rootTypeName then
						if rootTypeName == "Vector2" then
							setVal = Vector2.new((subName == ".X" and setVal) or root.X, (subName == ".Y" and setVal) or root.Y)
						elseif rootTypeName == "Vector3" then
							setVal = Vector3.new((subName == ".X" and setVal) or root.X, (subName == ".Y" and setVal) or root.Y, (subName == ".Z" and setVal) or root.Z)
						elseif rootTypeName == "UDim" then
							setVal = UDim.new((subName == ".Scale" and setVal) or root.Scale, (subName == ".Offset" and setVal) or root.Offset)
						elseif rootTypeName == "UDim2" then
							local rootX,rootY = root.X,root.Y
							local X_UDim = (subName == ".X" and setVal) or UDim.new((subName == ".X.Scale" and setVal) or rootX.Scale, (subName == ".X.Offset" and setVal) or rootX.Offset)
							local Y_UDim = (subName == ".Y" and setVal) or UDim.new((subName == ".Y.Scale" and setVal) or rootY.Scale, (subName == ".Y.Offset" and setVal) or rootY.Offset)
							setVal = UDim2.new(X_UDim,Y_UDim)
						elseif rootTypeName == "CFrame" then
							local rootPos,rootRight,rootUp,rootLook = root.Position,root.RightVector,root.UpVector,root.LookVector
							local pos = (subName == ".Position" and setVal) or Vector3.new((subName == ".Position.X" and setVal) or rootPos.X, (subName == ".Position.Y" and setVal) or rootPos.Y, (subName == ".Position.Z" and setVal) or rootPos.Z)
							local rightV = (subName == ".RightVector" and setVal) or Vector3.new((subName == ".RightVector.X" and setVal) or rootRight.X, (subName == ".RightVector.Y" and setVal) or rootRight.Y, (subName == ".RightVector.Z" and setVal) or rootRight.Z)
							local upV = (subName == ".UpVector" and setVal) or Vector3.new((subName == ".UpVector.X" and setVal) or rootUp.X, (subName == ".UpVector.Y" and setVal) or rootUp.Y, (subName == ".UpVector.Z" and setVal) or rootUp.Z)
							local lookV = (subName == ".LookVector" and setVal) or Vector3.new((subName == ".LookVector.X" and setVal) or rootLook.X, (subName == ".RightVector.Y" and setVal) or rootLook.Y, (subName == ".RightVector.Z" and setVal) or rootLook.Z)
							setVal = CFrame.fromMatrix(pos,rightV,upV,-lookV)
						elseif rootTypeName == "Rect" then
							local rootMin,rootMax = root.Min,root.Max
							local min = Vector2.new((subName == ".Min.X" and setVal) or rootMin.X, (subName == ".Min.Y" and setVal) or rootMin.Y)
							local max = Vector2.new((subName == ".Max.X" and setVal) or rootMax.X, (subName == ".Max.Y" and setVal) or rootMax.Y)
							setVal = Rect.new(min,max)
						elseif rootTypeName == "PhysicalProperties" then
							local rootProps = PhysicalProperties.new(obj.Material)
							local density = (subName == ".Density" and setVal) or (root and root.Density) or rootProps.Density
							local friction = (subName == ".Friction" and setVal) or (root and root.Friction) or rootProps.Friction
							local elasticity = (subName == ".Elasticity" and setVal) or (root and root.Elasticity) or rootProps.Elasticity
							local frictionWeight = (subName == ".FrictionWeight" and setVal) or (root and root.FrictionWeight) or rootProps.FrictionWeight
							local elasticityWeight = (subName == ".ElasticityWeight" and setVal) or (root and root.ElasticityWeight) or rootProps.ElasticityWeight
							setVal = PhysicalProperties.new(density,friction,elasticity,frictionWeight,elasticityWeight)
						elseif rootTypeName == "Ray" then
							local rootOrigin,rootDirection = root.Origin,root.Direction
							local origin = (subName == ".Origin" and setVal) or Vector3.new((subName == ".Origin.X" and setVal) or rootOrigin.X, (subName == ".Origin.Y" and setVal) or rootOrigin.Y, (subName == ".Origin.Z" and setVal) or rootOrigin.Z)
							local direction = (subName == ".Direction" and setVal) or Vector3.new((subName == ".Direction.X" and setVal) or rootDirection.X, (subName == ".Direction.Y" and setVal) or rootDirection.Y, (subName == ".Direction.Z" and setVal) or rootDirection.Z)
							setVal = Ray.new(origin,direction)
						elseif rootTypeName == "Faces" then
							local faces = {}
							local faceList = {"Back","Bottom","Front","Left","Right","Top"}
							for _,face in pairs(faceList) do
								local val
								if subName == "."..face then
									val = setVal
								else
									val = root[face]
								end
								if val then faces[#faces+1] = Enum.NormalId[face] end
							end
							setVal = Faces.new(unpack(faces))
						elseif rootTypeName == "Axes" then
							local axes = {}
							local axesList = {"X","Y","Z"}
							for _,axe in pairs(axesList) do
								local val
								if subName == "."..axe then
									val = setVal
								else
									val = root[axe]
								end
								if val then axes[#axes+1] = Enum.Axis[axe] end
							end
							setVal = Axes.new(unpack(axes))
						elseif rootTypeName == "NumberRange" then
							setVal = NumberRange.new(subName == ".Min" and setVal or root.Min, subName == ".Max" and setVal or root.Max)
						end
					end

					if typeName == "PhysicalProperties" and setVal then
						setVal = root or PhysicalProperties.new(obj.Material)
					end

					if prop.IsAttribute then
						setAttribute(obj,attributeName,setVal)
					else
						obj[propName] = setVal
					end
				end)
			end
		end

		if not noupdate then
			Properties.ComputeConflicts(prop)
		end
	end

	Properties.InitInputBox = function()
		inputBox = create({
			{1,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderSizePixel=0,Name="InputBox",Size=UDim2.new(0,200,0,22),Visible=false,ZIndex=2,}},
			{2,"TextBox",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BackgroundTransparency=1,BorderColor3=Color3.new(0.062745101749897,0.51764708757401,1),BorderSizePixel=0,ClearTextOnFocus=false,Font=3,Parent={1},PlaceholderColor3=Color3.new(0.69803923368454,0.69803923368454,0.69803923368454),Position=UDim2.new(0,3,0,0),Size=UDim2.new(1,-6,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,ZIndex=2,}},
		})
		inputTextBox = inputBox.TextBox
		inputBox.BackgroundColor3 = Settings.Theme.TextBox
		inputBox.Parent = Properties.Window.GuiElems.Content.List

		inputTextBox.FocusLost:Connect(function()
			if not inputProp then return end

			local prop = inputProp
			inputProp = nil
			local val = Properties.StringToValue(prop,inputTextBox.Text)
			if val then Properties.SetProp(prop,val) else Properties.Refresh() end
		end)

		inputTextBox.Focused:Connect(function()
			inputTextBox.SelectionStart = 1
			inputTextBox.CursorPosition = #inputTextBox.Text + 1
		end)

		Lib.ViewportTextBox.convert(inputTextBox)
	end

	Properties.SetInputProp = function(prop,entryIndex,special)
		local typeData = prop.ValueType
		local typeName = typeData.Name
		local fullName = prop.Class.."."..prop.Name..(prop.SubName or "")
		local propObj = autoUpdateObjs[fullName]
		local propVal = Properties.GetPropVal(prop,propObj)

		if prop.Tags.ReadOnly then return end

		inputProp = prop
		if special then
			if special == "color" then
				if typeName == "Color3" then
					inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
					Properties.DisplayColorEditor(prop,propVal)
				elseif typeName == "BrickColor" then
					Properties.DisplayBrickColorEditor(prop,entryIndex,propVal)
				elseif typeName == "ColorSequence" then
					inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
					Properties.DisplayColorSequenceEditor(prop,propVal)
				end
			elseif special == "right" then
				if typeName == "NumberSequence" then
					inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
					Properties.DisplayNumberSequenceEditor(prop,propVal)
				elseif typeName == "ColorSequence" then
					inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
					Properties.DisplayColorSequenceEditor(prop,propVal)
				end
			end
		else
			if Properties.IsTextEditable(prop) then
				inputTextBox.Text = propVal and Properties.ValueToString(prop,propVal) or ""
				inputTextBox:CaptureFocus()
			elseif typeData.Category == "Enum" then
				Properties.DisplayEnumDropdown(entryIndex)
			elseif typeName == "BrickColor" then
				Properties.DisplayBrickColorEditor(prop,entryIndex,propVal)
			end
		end
		Properties.Refresh()
	end

	Properties.InitSearch = function()
		local searchBox = Properties.GuiElems.ToolBar.SearchFrame.SearchBox

		Lib.ViewportTextBox.convert(searchBox)

		searchBox:GetPropertyChangedSignal("Text"):Connect(function()
			Properties.SearchText = searchBox.Text
			Properties.Update()
			Properties.Refresh()
		end)
	end

	Properties.InitEntryStuff = function()
		Properties.EntryTemplate = create({
			{1,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),Font=3,Name="Entry",Position=UDim2.new(0,1,0,1),Size=UDim2.new(0,250,0,22),Text="",TextSize=14,}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BackgroundTransparency=1,BorderColor3=Color3.new(0.33725491166115,0.49019610881805,0.73725491762161),BorderSizePixel=0,Name="NameFrame",Parent={1},Position=UDim2.new(0,20,0,0),Size=UDim2.new(1,-40,1,0),}},
			{3,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="PropName",Parent={2},Position=UDim2.new(0,2,0,0),Size=UDim2.new(1,-2,1,0),Text="Anchored",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,TextTruncate=1,TextXAlignment=0,}},
			{4,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClipsDescendants=true,Font=3,Name="Expand",Parent={2},Position=UDim2.new(0,-20,0,1),Size=UDim2.new(0,20,0,20),Text="",TextSize=14,Visible=false,}},
			{5,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642383285",ImageRectOffset=Vector2.new(144,16),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={4},Position=UDim2.new(0,2,0,2),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
			{6,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=4,Name="ToggleAttributes",Parent={2},Position=UDim2.new(1,-85,0,0),Size=UDim2.new(0,85,0,22),Text="[SETTING: OFF]",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,Visible=false,}},
			{7,"Frame",{BackgroundColor3=Color3.new(0.04313725605607,0.35294118523598,0.68627452850342),BackgroundTransparency=1,BorderColor3=Color3.new(0.33725491166115,0.49019607901573,0.73725491762161),BorderSizePixel=0,Name="ValueFrame",Parent={1},Position=UDim2.new(1,-100,0,0),Size=UDim2.new(0,80,1,0),}},
			{8,"Frame",{BackgroundColor3=Color3.new(0.14117647707462,0.14117647707462,0.14117647707462),BorderColor3=Color3.new(0.33725491166115,0.49019610881805,0.73725491762161),BorderSizePixel=0,Name="Line",Parent={7},Position=UDim2.new(0,-1,0,0),Size=UDim2.new(0,1,1,0),}},
			{9,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="ColorButton",Parent={7},Size=UDim2.new(0,20,0,22),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{10,"Frame",{BackgroundColor3=Color3.new(1,1,1),BorderColor3=Color3.new(0,0,0),Name="ColorPreview",Parent={9},Position=UDim2.new(0,5,0,6),Size=UDim2.new(0,10,0,10),}},
			{11,"UIGradient",{Parent={10},}},
			{12,"Frame",{BackgroundTransparency=1,Name="EnumArrow",Parent={7},Position=UDim2.new(1,-16,0,3),Size=UDim2.new(0,16,0,16),Visible=false,}},
			{13,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={12},Position=UDim2.new(0,8,0,9),Size=UDim2.new(0,1,0,1),}},
			{14,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={12},Position=UDim2.new(0,7,0,8),Size=UDim2.new(0,3,0,1),}},
			{15,"Frame",{BackgroundColor3=Color3.new(0.86274510622025,0.86274510622025,0.86274510622025),BorderSizePixel=0,Parent={12},Position=UDim2.new(0,6,0,7),Size=UDim2.new(0,5,0,1),}},
			{16,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="ValueBox",Parent={7},Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-8,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,TextTruncate=1,TextXAlignment=0,}},
			{17,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="RightButton",Parent={7},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,22),Text="...",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{18,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="SettingsButton",Parent={7},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,22),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{19,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="SoundPreview",Parent={7},Size=UDim2.new(1,0,1,0),Visible=false,}},
			{20,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="ControlButton",Parent={19},Size=UDim2.new(0,20,0,22),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{21,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642383285",ImageRectOffset=Vector2.new(144,16),ImageRectSize=Vector2.new(16,16),Name="Icon",Parent={20},Position=UDim2.new(0,2,0,3),ScaleType=4,Size=UDim2.new(0,16,0,16),}},
			{22,"Frame",{BackgroundColor3=Color3.new(0.3137255012989,0.3137255012989,0.3137255012989),BorderSizePixel=0,Name="TimeLine",Parent={19},Position=UDim2.new(0,26,0.5,-1),Size=UDim2.new(1,-34,0,2),}},
			{23,"Frame",{BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),Name="Slider",Parent={22},Position=UDim2.new(0,-4,0,-8),Size=UDim2.new(0,8,0,18),}},
			{24,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="EditAttributeButton",Parent={1},Position=UDim2.new(1,-20,0,0),Size=UDim2.new(0,20,0,22),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{25,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5034718180",ImageTransparency=0.20000000298023,Name="Icon",Parent={24},Position=UDim2.new(0,2,0,3),Size=UDim2.new(0,16,0,16),}},
			{26,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderSizePixel=0,Font=3,Name="RowButton",Parent={1},Size=UDim2.new(1,0,1,0),Text="Add Attribute",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,Visible=false,}},
			--{27,"UIStroke",{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(33,33,33),Thickness=1,Parent={1}}}
		})

		local fullNameFrame = Lib.Frame.new()
		local label = Lib.Label.new()
		label.Parent = fullNameFrame.Gui
		label.Position = UDim2.new(0,2,0,0)
		label.Size = UDim2.new(1,-4,1,0)
		fullNameFrame.Visible = false
		fullNameFrame.Parent = window.Gui
		
		if Settings.Window.Transparency and Settings.Window.Transparency > 0 then
			Properties.EntryTemplate.BackgroundTransparency = 0.75
		end


		Properties.FullNameFrame = fullNameFrame
		Properties.FullNameFrameAttach = Lib.AttachTo(fullNameFrame)
	end

	Properties.Init = function() -- TODO: MAKE BETTER
		local guiItems = create({
			{1,"Folder",{Name="Items",}},
			{2,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="ToolBar",Parent={1},Size=UDim2.new(1,0,0,22),}},
			{3,"Frame",{BackgroundColor3=Color3.new(0.14901961386204,0.14901961386204,0.14901961386204),BorderColor3=Color3.new(0.1176470592618,0.1176470592618,0.1176470592618),BorderSizePixel=0,Name="SearchFrame",Parent={2},Position=UDim2.new(0,3,0,1),Size=UDim2.new(1,-6,0,18),}},
			{4,"TextBox",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClearTextOnFocus=false,Font=3,Name="SearchBox",Parent={3},PlaceholderColor3=Color3.new(0.39215689897537,0.39215689897537,0.39215689897537),PlaceholderText="Search properties",Position=UDim2.new(0,4,0,0),Size=UDim2.new(1,-24,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=0,}},
			{5,"UICorner",{CornerRadius=UDim.new(0,2),Parent={3},}},
			{6,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Reset",Parent={3},Position=UDim2.new(1,-17,0,1),Size=UDim2.new(0,16,0,16),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{7,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5034718129",ImageColor3=Color3.new(0.39215686917305,0.39215686917305,0.39215686917305),Parent={6},Size=UDim2.new(0,16,0,16),}},
			{8,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.12549020349979,0.12549020349979,0.12549020349979),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="Refresh",Parent={2},Position=UDim2.new(1,-20,0,1),Size=UDim2.new(0,18,0,18),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,Visible=false,}},
			{9,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://5642310344",Parent={8},Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,12,0,12),}},
			{10,"Frame",{BackgroundColor3=Color3.new(0.15686275064945,0.15686275064945,0.15686275064945),BorderSizePixel=0,Name="ScrollCorner",Parent={1},Position=UDim2.new(1,-16,1,-16),Size=UDim2.new(0,16,0,16),Visible=false,}},
			{11,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,ClipsDescendants=true,Name="List",Parent={1},Position=UDim2.new(0,0,0,23),Size=UDim2.new(1,0,1,-23),}},
		})

		-- Vars
		categoryOrder =  API.CategoryOrder
		for category,_ in next,categoryOrder do
			if not Properties.CollapsedCategories[category] then
				expanded["CAT_"..category] = true
			end
		end
		expanded["Sound.SoundId"] = true

		-- Init window
		window = Lib.Window.new()
		Properties.Window = window
		window:SetTitle("Properties")

		toolBar = guiItems.ToolBar
		propsFrame = guiItems.List

		Properties.GuiElems.ToolBar = toolBar
		Properties.GuiElems.PropsFrame = propsFrame

		Properties.InitEntryStuff()

		-- Window events
		window.GuiElems.Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			if Properties.Window:IsContentVisible() then
				Properties.UpdateView()
				Properties.Refresh()
			end
		end)
		window.OnActivate:Connect(function()
			Properties.UpdateView()
			Properties.Update()
			Properties.Refresh()
		end)
		window.OnRestore:Connect(function()
			Properties.UpdateView()
			Properties.Update()
			Properties.Refresh()
		end)

		-- Init scrollbars
		scrollV = Lib.ScrollBar.new()		
		scrollV.WheelIncrement = 3
		scrollV.Gui.Position = UDim2.new(1,-16,0,23)
		scrollV:SetScrollFrame(propsFrame)
		scrollV.Scrolled:Connect(function()
			Properties.Index = scrollV.Index
			Properties.Refresh()
		end)

		scrollH = Lib.ScrollBar.new(true)
		scrollH.Increment = 5
		scrollH.WheelIncrement = 20
		scrollH.Gui.Position = UDim2.new(0,0,1,-16)
		scrollH.Scrolled:Connect(function()
			Properties.Refresh()
		end)

		-- Setup Gui
		window.GuiElems.Line.Position = UDim2.new(0,0,0,22)
		toolBar.Parent = window.GuiElems.Content
		propsFrame.Parent = window.GuiElems.Content
		guiItems.ScrollCorner.Parent = window.GuiElems.Content
		scrollV.Gui.Parent = window.GuiElems.Content
		scrollH.Gui.Parent = window.GuiElems.Content
		Properties.InitInputBox()
		Properties.InitSearch()
	end

	return Properties
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
["SaveInstance"] = function()
--[[
	Save Instance App Module
	
	Revival of the old dex's Save Instance
]] 

-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, SaveInstance, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	SaveInstance = Apps.SaveInstance
	Notebook = Apps.Notebook
end

local function main()
	local SaveInstance = {}
	local window, ListFrame
	local fileName = "Place_"..game.PlaceId.."_"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."_{TIMESTAMP}"
	local Saving = false
	
	local SaveInstanceArgs = {
		Decompile = true,
		DecompileTimeout = 10,
		DecompileIgnore = {"Chat", "CoreGui", "CorePackages"},
		NilInstances = false,
		RemovePlayerCharacters = true,
		SavePlayers = false,
		MaxThreads = 3,
		ShowStatus = true,
		IgnoreDefaultProps = true,
		IsolateStarterPlayer = true
	}
	
	local function AddCheckbox(title, default)
		local frame = Lib.Frame.new()
		frame.Gui.Parent = ListFrame
		frame.Gui.Transparency = 1
		frame.Gui.Size = UDim2.new(1,0,0,20)
		
		local listlayout = Instance.new("UIListLayout")
		listlayout.Parent = frame.Gui
		listlayout.FillDirection = Enum.FillDirection.Horizontal
		listlayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		listlayout.VerticalAlignment = Enum.VerticalAlignment.Center
		listlayout.Padding = UDim.new(0, 10)
		
		-- Checkbox
		local checkbox = Lib.Checkbox.new()
		
		checkbox.Gui.Parent = frame.Gui
		checkbox.Gui.Size = UDim2.new(0,15,0,15)
		
		-- Label
		local label = Lib.Label.new()
		
		label.Gui.Parent = frame.Gui
		label.Gui.Size = UDim2.new(1, 0,1, -15)
		label.Gui.Text = title
		label.TextTruncate = Enum.TextTruncate.AtEnd
		
		checkbox:SetState(default)
		
		return checkbox
	end
	
	local function AddTextbox(title, default, sizeX)
		default = tostring(default)
		local frame = Lib.Frame.new()
		frame.Gui.Parent = ListFrame
		frame.Gui.Transparency = 1
		frame.Gui.Size = UDim2.new(1,0,0,20)

		local listlayout = Instance.new("UIListLayout")
		listlayout.Parent = frame.Gui
		listlayout.FillDirection = Enum.FillDirection.Horizontal
		listlayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
		listlayout.VerticalAlignment = Enum.VerticalAlignment.Center
		listlayout.Padding = UDim.new(0, 10)

		-- Textbox
		local textbox = Instance.new("TextBox") -- replaced cuz why Moon make every inputs only work on mouse/pc users >:( 
		textbox.BackgroundColor3 = Settings.Theme.TextBox
		textbox.BorderColor3 = Settings.Theme.Outline3
		textbox.ClearTextOnFocus = false
		textbox.TextColor3 = Settings.Theme.Text
		textbox.Font = Enum.Font.SourceSans
		textbox.TextSize = 14
		textbox.ZIndex = 2

		textbox.Parent = frame.Gui
		if sizeX and type(sizeX) == "number" then
			textbox.Size = UDim2.new(0,sizeX,0,15)
		else
			textbox.Size = UDim2.new(0,45,0,15)
		end
		
		frame.Gui.AutomaticSize = Enum.AutomaticSize.X
		textbox.AutomaticSize = Enum.AutomaticSize.X

		-- Label
		local label = Lib.Label.new()

		label.Parent = frame.Gui
		label.Size = UDim2.new(1, 0,1, -15)
		label.Text = title
		label.TextTruncate = Enum.TextTruncate.AtEnd

		textbox.Text = default

		return {TextBox = textbox}
	end
	
	SaveInstance.Init = function()
		window = Lib.Window.new()
		window:SetTitle("Save Instance")
		window:Resize(350,350)
		SaveInstance.Window = window
		
		-- ListFrame
		
		-- Fake ScrollBar dex, because its too advanced
		ListFrame = Instance.new("ScrollingFrame")
		ListFrame.Parent = window.GuiElems.Content
		ListFrame.Size = UDim2.new(1, 0,1, -40)
		ListFrame.Position = UDim2.new(0, 0, 0, 0)
		ListFrame.Transparency = 1
		ListFrame.CanvasSize = UDim2.new(0,0,0,0)
		ListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
		ListFrame.ScrollBarThickness = 16
		ListFrame.BottomImage = ""
		ListFrame.TopImage = ""
		ListFrame.ScrollBarImageColor3 = Color3.fromRGB(70, 70, 70)
		ListFrame.ScrollBarImageTransparency = 0
		ListFrame.ZIndex = 2
		ListFrame.BorderSizePixel = 0
		
		local scrollbar = Lib.ScrollBar.new()
		scrollbar.Gui.Parent = window.GuiElems.Content
		scrollbar.Gui.Size = UDim2.new(1, 0,1, -40)
		scrollbar.Gui.Up.ZIndex = 3
		scrollbar.Gui.Down.ZIndex = 3
		
		ListFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
			if ListFrame.AbsoluteCanvasSize ~= ListFrame.AbsoluteWindowSize then
				scrollbar.Gui.Visible = true
			else
				scrollbar.Gui.Visible = false
			end
		end)
		
		local ListLayout = Instance.new("UIListLayout")
		ListLayout.Parent = ListFrame
		ListLayout.Padding = UDim.new(0, 5)
		
		local Padding = Instance.new("UIPadding")
		Padding.Parent = ListFrame
		Padding.PaddingBottom = UDim.new(0, 5)
		Padding.PaddingLeft = UDim.new(0, 10)
		Padding.PaddingRight = UDim.new(0, 10)
		Padding.PaddingTop = UDim.new(0, 5)
		
		-- Options
		
		local Decompile = AddCheckbox("Decompile Scripts (LocalScript and ModuleScript)", SaveInstanceArgs.Decompile)
		Decompile.OnInput:Connect(function()
			SaveInstanceArgs.Decompile = Decompile.Toggled
		end)
		
		local decompileTimeout = AddTextbox("Decompile Timeout (s)", SaveInstanceArgs.DecompileTimeout, 15)
		decompileTimeout.TextBox.FocusLost:Connect(function()
			SaveInstanceArgs.DecompileTimeout = tonumber(decompileTimeout.TextBox.Text)
		end)
		
		local decompileThread = AddTextbox("Decompiler Max Threads", "3", 15)
		decompileThread.TextBox.FocusLost:Connect(function()
			SaveInstanceArgs.MaxThreads = tonumber(decompileThread.TextBox.Text)
		end)
		
		local decompileIgnore = AddTextbox("Decompile Ignore", table.concat(SaveInstanceArgs.DecompileIgnore, ","), 50)
		decompileIgnore.TextBox.FocusLost:Connect(function()
			local inputText = decompileIgnore.TextBox.Text
			local rawList = string.split(inputText, ", ") or string.split(inputText, ",")
			local finalList = {}

			for _, text in ipairs(rawList) do
				local split = string.split(text, ",") or string.split(text, ", ")
				for _, textFound in ipairs(split) do
					table.insert(finalList, textFound)
				end
			end
			SaveInstanceArgs.DecompileIgnore = finalList
		end)

		
		local NilObj = AddCheckbox("Save Nil Instances", SaveInstanceArgs.NilInstances)
		NilObj.OnInput:Connect(function()
			SaveInstanceArgs.NilInstances = NilObj.Toggled
		end)

		local RemovePlayerChar = AddCheckbox("Remove Player Characters", SaveInstanceArgs.RemovePlayerCharacters)
		RemovePlayerChar.OnInput:Connect(function()
			SaveInstanceArgs.RemovePlayerCharacters = RemovePlayerChar.Toggled
		end)
		
		local SavePlayerObj = AddCheckbox("Save Player Instance", SaveInstanceArgs.SavePlayers)
		SavePlayerObj.OnInput:Connect(function()
			SaveInstanceArgs.SavePlayers = SavePlayerObj.Toggled
		end)
		
		local IsolateStarterPlr = AddCheckbox("Isolate StarterPlayer", SaveInstanceArgs.IsolateStarterPlayer)
		IsolateStarterPlr.OnInput:Connect(function()
			SaveInstanceArgs.IsolateStarterPlayer = IsolateStarterPlr.Toggled
		end)
		
		local IgnoreDefaultProps = AddCheckbox("Ignore Default Properties", SaveInstanceArgs.IgnoreDefaultProps)
		IgnoreDefaultProps.OnInput:Connect(function()
			SaveInstanceArgs.IgnoreDefaultProps = IgnoreDefaultProps.Toggled
		end)
		
		local ShowStat = AddCheckbox("Show Status", SaveInstanceArgs.ShowStatus)
		ShowStat.OnInput:Connect(function()
			SaveInstanceArgs.ShowStatus = ShowStat.Toggled
		end)
		
		
		-- Decompile buttons below
		local FilenameTextBox = Lib.ViewportTextBox.new()
		FilenameTextBox.Gui.Parent = window.GuiElems.Content
		FilenameTextBox.Size = UDim2.new(1,0, 0,20)
		FilenameTextBox.Position = UDim2.new(0,0, 1,-40)
		
		local textpadding = Instance.new("UIPadding")
		textpadding.Parent = FilenameTextBox.Gui
		textpadding.PaddingLeft = UDim.new(0, 5)
		textpadding.PaddingRight = UDim.new(0, 5)
		
		local BackgroundButton = Lib.Frame.new()
		BackgroundButton.Gui.Parent = window.GuiElems.Content
		BackgroundButton.Size = UDim2.new(1,0, 0,20)
		BackgroundButton.Position = UDim2.new(0,0, 1,-20)
		
		local LabelButton = Lib.Label.new()
		LabelButton.Gui.Parent = window.GuiElems.Content
		LabelButton.Size = UDim2.new(1,0, 0,20)
		LabelButton.Position = UDim2.new(0,0, 1,-20)
		LabelButton.Gui.Text = "Save"
		LabelButton.Gui.TextXAlignment = Enum.TextXAlignment.Center
		
		local Button = Instance.new("TextButton")
		Button.Parent = BackgroundButton.Gui
		Button.Size = UDim2.new(1,0, 1,0)
		Button.Position = UDim2.new(0,0, 0,0)
		Button.Transparency = 1
		
		FilenameTextBox.TextBox.Text = fileName
		Button.MouseButton1Click:Connect(function()
			local fileName = FilenameTextBox.TextBox.Text:gsub("{TIMESTAMP}", os.date("%d-%m-%Y_%H-%M-%S"))
			window:SetTitle("Save Instance - Saving")
			local s, result = pcall(env.saveinstance, game, fileName, SaveInstanceArgs)
			if s then
				window:SetTitle("Save Instance - Saved")
			else
				window:SetTitle("Save Instance - Error")
				task.spawn(error("Failed to save the game: "..result))
			end
			task.wait(5)
			window:SetTitle("Save Instance")
			---env.saveinstance(game, fileName, SaveInstanceArgs)
		end)
	end

	return SaveInstance
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
["ScriptViewer"] = function()
--[[
	Script Viewer App Module
	
	A script viewer that is basically a notepad
]]
-- Common Locals
local Main,Lib,Apps,Settings -- Main Containers
local Explorer, Properties, ScriptViewer, Notebook -- Major Apps
local API,RMD,env,service,plr,create,createSimple -- Main Locals

local function initDeps(data)
	Main = data.Main
	Lib = data.Lib
	Apps = data.Apps
	Settings = data.Settings

	API = data.API
	RMD = data.RMD
	env = data.env
	service = data.service
	plr = data.plr
	create = data.create
	createSimple = data.createSimple
end

local function initAfterMain()
	Explorer = Apps.Explorer
	Properties = Apps.Properties
	ScriptViewer = Apps.ScriptViewer
	Notebook = Apps.Notebook
end

local executorName = "Unknown"
local executorVersion = "???"
if identifyexecutor then
	local name,ver = identifyexecutor()
	executorName = name
	executorVersion = ver
elseif game:GetService("RunService"):IsStudio() then
	executorName = "Studio"
	executorVersion = version()
end

local function getPath(obj)
	if obj.Parent == nil then
		return "Nil parented"
	else
		return Explorer.GetInstancePath(obj)
	end
end

local function main()
	local ScriptViewer = {}
	local window, codeFrame
	
	local execute, clear, dumpbtn
	
	local PreviousScr = nil
	
	ScriptViewer.DumpFunctions = function(scr)
		-- thanks King.Kevin#6025 you'll obviously be credited (no discord tag since that can easily be impersonated)
		local getgc = getgc or get_gc_objects
		local getupvalues = (debug and debug.getupvalues) or getupvalues or getupvals
		local getconstants = (debug and debug.getconstants) or getconstants or getconsts
		local getinfo = (debug and (debug.getinfo or debug.info)) or getinfo
		local original = ("\n-- // Function Dumper made by King.Kevin\n-- // Script Path: %s\n\n--[["):format(getPath(scr))
		local dump = original
		local functions, function_count, data_base = {}, 0, {}
		function functions:add_to_dump(str, indentation, new_line)
			local new_line = new_line or true
			dump = dump .. ("%s%s%s"):format(string.rep("		", indentation), tostring(str), new_line and "\n" or "")
		end
		function functions:get_function_name(func)
			local n = getinfo(func).name
			return n ~= "" and n or "Unknown Name"
		end
		function functions:dump_table(input, indent, index)
			local indent = indent < 0 and 0 or indent
			functions:add_to_dump(("%s [%s] %s"):format(tostring(index), tostring(typeof(input)), tostring(input)), indent - 1)
			local count = 0
			for index, value in pairs(input) do
				count = count + 1
				if type(value) == "function" then
					functions:add_to_dump(("%d [function] = %s"):format(count, functions:get_function_name(value)), indent)
				elseif type(value) == "table" then
					if not data_base[value] then
						data_base[value] = true
						functions:add_to_dump(("%d [table]:"):format(count), indent)
						functions:dump_table(value, indent + 1, index)
					else
						functions:add_to_dump(("%d [table] (Recursive table detected)"):format(count), indent)
					end
				else
					functions:add_to_dump(("%d [%s] = %s"):format(count, tostring(typeof(value)), tostring(value)), indent)
				end
			end
		end
		function functions:dump_function(input, indent)
			functions:add_to_dump(("\nFunction Dump: %s"):format(functions:get_function_name(input)), indent)
			functions:add_to_dump(("\nFunction Upvalues: %s"):format(functions:get_function_name(input)), indent)
			for index, upvalue in pairs(getupvalues(input)) do
				if type(upvalue) == "function" then
					functions:add_to_dump(("%d [function] = %s"):format(index, functions:get_function_name(upvalue)), indent + 1)
				elseif type(upvalue) == "table" then
					if not data_base[upvalue] then
						data_base[upvalue] = true
						functions:add_to_dump(("%d [table]:"):format(index), indent + 1)
						functions:dump_table(upvalue, indent + 2, index)
					else
						functions:add_to_dump(("%d [table] (Recursive table detected)"):format(index), indent + 1)
					end
				else
					functions:add_to_dump(("%d [%s] = %s"):format(index, tostring(typeof(upvalue)), tostring(upvalue)), indent + 1)
				end
			end
			functions:add_to_dump(("\nFunction Constants: %s"):format(functions:get_function_name(input)), indent)
			for index, constant in pairs(getconstants(input)) do
				if type(constant) == "function" then
					functions:add_to_dump(("%d [function] = %s"):format(index, functions:get_function_name(constant)), indent + 1)
				elseif type(constant) == "table" then
					if not data_base[constant] then
						data_base[constant] = true
						functions:add_to_dump(("%d [table]:"):format(index), indent + 1)
						functions:dump_table(constant, indent + 2, index)
					else
						functions:add_to_dump(("%d [table] (Recursive table detected)"):format(index), indent + 1)
					end
				else
					functions:add_to_dump(("%d [%s] = %s"):format(index, tostring(typeof(constant)), tostring(constant)), indent + 1)
				end
			end
		end
		for _, _function in pairs(env.getgc()) do
			if typeof(_function) == "function" and getfenv(_function).script and getfenv(_function).script == scr then
				functions:dump_function(_function, 0)
				functions:add_to_dump("\n" .. ("="):rep(100), 0, false)
			end
		end
		local source = codeFrame:GetText()

		if dump ~= original then source = source .. dump .. "]]" end
		codeFrame:SetText(source)
		
		window:Show()
	end

	ScriptViewer.Init = function()
		window = Lib.Window.new()
		window:SetTitle("Notepad")
		window:Resize(500,400)
		ScriptViewer.Window = window

		codeFrame = Lib.CodeFrame.new()
		codeFrame.Frame.Position = UDim2.new(0,0,0,20)
		codeFrame.Frame.Size = UDim2.new(1,0,1,-40)
		codeFrame.Frame.Parent = window.GuiElems.Content
		
		local copy = Instance.new("TextButton",window.GuiElems.Content)
		copy.BackgroundTransparency = 1
		copy.Size = UDim2.new(0.33,0,0,20)
		copy.Position = UDim2.new(0,0,0,0)
		copy.Text = "Copy to Clipboard"
		
		if env.setclipboard then
			copy.TextColor3 = Color3.new(1,1,1)
			copy.Interactable = true
		else
			copy.TextColor3 = Color3.new(0.5,0.5,0.5)
			copy.Interactable = false
		end

		copy.MouseButton1Click:Connect(function()
			local source = codeFrame:GetText()
			env.setclipboard(source)
		end)

		local save = Instance.new("TextButton",window.GuiElems.Content)
		save.BackgroundTransparency = 1
		save.Size = UDim2.new(0.33,0,0,20)
		save.Position = UDim2.new(0.33,0,0,0)
		save.Text = "Save to File"
		save.TextColor3 = Color3.new(1,1,1)
		
		if env.writefile then
			save.TextColor3 = Color3.new(1,1,1)
			save.Interactable = true
		else
			save.TextColor3 = Color3.new(0.5,0.5,0.5)
			--save.Interactable = false
		end

		save.MouseButton1Click:Connect(function()
			local source = codeFrame:GetText()
			local filename = "Place_"..game.PlaceId.."_Script_"..os.time()..".txt"

			Lib.SaveAsPrompt(filename,source)
			--env.writefile(filename,source)
		end)
		
		dumpbtn = Instance.new("TextButton",window.GuiElems.Content)
		dumpbtn.BackgroundTransparency = 1
		dumpbtn.Position = UDim2.new(0.7,0,0,0)
		dumpbtn.Size = UDim2.new(0.3,0,0,20)
		dumpbtn.Text = "Dump Functions"
		dumpbtn.TextColor3 = Color3.new(0.5,0.5,0.5)
		
		if env.getgc then
			dumpbtn.TextColor3 = Color3.new(1,1,1)
			dumpbtn.Interactable = true
		else
			dumpbtn.TextColor3 = Color3.new(0.5,0.5,0.5)
			dumpbtn.Interactable = false
		end

		dumpbtn.MouseButton1Click:Connect(function()
			if PreviousScr ~= nil then
				pcall(ScriptViewer.DumpFunctions, PreviousScr)
			end
		end)
		
		-- Buttons below the editor
		
		
		execute = Instance.new("TextButton",window.GuiElems.Content)
		execute.BackgroundTransparency = 1
		execute.Size = UDim2.new(0.5,0,0,20)
		execute.Position = UDim2.new(0,0,1,-20)
		execute.Text = "Execute"
		execute.TextColor3 = Color3.new(1,1,1)
		
		if env.loadstring then
			execute.TextColor3 = Color3.new(1,1,1)
			execute.Interactable = true
		else
			execute.TextColor3 = Color3.new(0.5,0.5,0.5)
			execute.Interactable = false
		end

		execute.MouseButton1Click:Connect(function()
			local source = codeFrame:GetText()
			env.loadstring(source)()
		end)

		clear = Instance.new("TextButton",window.GuiElems.Content)
		clear.BackgroundTransparency = 1
		clear.Size = UDim2.new(0.5,0,0,20)
		clear.Position = UDim2.new(0.5,0,1,-20)
		clear.Text = "Clear"
		clear.TextColor3 = Color3.new(1,1,1)

		clear.MouseButton1Click:Connect(function()
			codeFrame:SetText("")
		end)
	end
	
	ScriptViewer.ViewScript = function(scr)
		local oldtick = tick()
		local s,source = pcall(env.decompile or function() end,scr)

		if not s or not source then
			PreviousScr = nil
			dumpbtn.TextColor3 = Color3.new(0.5,0.5,0.5)
			source = "-- Unable to view source.\n"
			source = source .. "-- Script Path: "..getPath(scr).."\n"
			if (scr.ClassName == "Script" and (scr.RunContext == Enum.RunContext.Legacy or scr.RunContext == Enum.RunContext.Server)) or not scr:IsA("LocalScript") then
				source = source .. "-- Reason: The script is not running on client. (attempt to decompile ServerScript or 'Script' with RunContext Server)\n"
			elseif not env.decompile then
				source = source .. "-- Reason: Your executor does not support decompiler. (missing 'decompile' function)\n"
			else
				source = source .. "-- Reason: Unknown\n"
			end
			source = source .. "-- Executor: "..executorName.." ("..executorVersion..")"
		else
			PreviousScr = scr
			dumpbtn.TextColor3 = Color3.new(1,1,1)

			local decompiled = source

			source = "-- Script Path: "..getPath(scr).."\n"
			source = source .. "-- Took "..tostring(math.floor( (tick() - oldtick) * 100) / 100).."s to decompile.\n"
			source = source .. "-- Executor: "..executorName.." ("..executorVersion..")\n\n"

			source = source .. decompiled

			oldtick = nil
			decompiled = nil
		end

		codeFrame:SetText(source)
		window:Show()
	end

	return ScriptViewer
end

-- TODO: Remove when open source
if gethsfuncs then
	_G.moduleData = {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
else
	return {InitDeps = initDeps, InitAfterMain = initAfterMain, Main = main}
end
end,
}
-- inject virutal env cuz why not
if game:GetService("RunService"):IsStudio() then
	if script:FindFirstChild("Modules"):FindFirstChild("VirtualFS") then
		for namefunc, func in require(script.Modules.VirtualFS) do
			getfenv()[namefunc] = func
			--print("Inserting "..namefunc)
		end
	end
end

local oldgame = oldgame or game

cloneref = cloneref or function(ref)
	if not getreg then return ref end
	
	local InstanceList
	
	local a = Instance.new("Part")
	for _, c in pairs(getreg()) do
		if type(c) == "table" and #c then
			if rawget(c, "__mode") == "kvs" then
				for d, e in pairs(c) do
					if e == a then
						InstanceList = c
						break
					end
				end
			end
		end
	end
	local f = {}
	function f.invalidate(g)
		if not InstanceList then
			return
		end
		for b, c in pairs(InstanceList) do
			if c == g then
				InstanceList[b] = nil
				return g
			end
		end
	end
	return f.invalidate
end

local isFsSupported = readfile and writefile and isfile and isfolder and listfiles and delfile and delfolder

-- Main vars
local Main, Explorer, Properties, ScriptViewer, Console, SaveInstance, ModelViewer--[[, SecretServicePanel]], DefaultSettings, Notebook, Serializer, Lib local ggv = getgenv or nil
local API, RMD

-- Default Settings
DefaultSettings = (function()
	local rgb = Color3.fromRGB	
	
	return {
		Explorer = {
			_Recurse = true,
			Sorting = true,
			TeleportToOffset = Vector3.new(0,0,0),
			ClickToRename = true,
			AutoUpdateSearch = true,
			AutoUpdateMode = 0, -- 0 Default, 1 no tree update, 2 no descendant events, 3 frozen
			PartSelectionBox = true,
			GuiSelectionBox = true,
			CopyPathUseGetChildren = true
		},
		Properties = {
			_Recurse = true,
			MaxConflictCheck = 50,
			ShowDeprecated = true,
			ShowHidden = false,
			ClearOnFocus = false,
			LoadstringInput = true,
			NumberRounding = 3,
			ShowAttributes = true,
			MaxAttributes = 50,
			ScaleType = 0 -- 0 Full Name Shown, 1 Equal Halves
		},
		Theme = {
			_Recurse = true,
			Main1 = rgb(52,52,52),
			Main2 = rgb(45,45,45),
			Outline1 = rgb(33,33,33), -- Mainly frames
			Outline2 = rgb(55,55,55), -- Mainly button
			Outline3 = rgb(30,30,30), -- Mainly textbox
			TextBox = rgb(38,38,38),
			Menu = rgb(32,32,32),
			ListSelection = rgb(11,90,175),
			Button = rgb(60,60,60),
			ButtonHover = rgb(68,68,68),
			ButtonPress = rgb(40,40,40),
			Highlight = rgb(75,75,75),
			Text = rgb(255,255,255),
			PlaceholderText = rgb(100,100,100),
			Important = rgb(255,0,0),
			ExplorerIconMap = "",
			MiscIconMap = "",
			Syntax = {
				Text = rgb(204,204,204),
				Background = rgb(36,36,36),
				Selection = rgb(255,255,255),
				SelectionBack = rgb(11,90,175),
				Operator = rgb(204,204,204),
				Number = rgb(255,198,0),
				String = rgb(173,241,149),
				Comment = rgb(102,102,102),
				Keyword = rgb(248,109,124),
				Error = rgb(255,0,0),
				FindBackground = rgb(141,118,0),
				MatchingWord = rgb(85,85,85),
				BuiltIn = rgb(132,214,247),
				CurrentLine = rgb(45,50,65),
				LocalMethod = rgb(253,251,172),
				LocalProperty = rgb(97,161,241),
				Nil = rgb(255,198,0),
				Bool = rgb(255,198,0),
				Function = rgb(248,109,124),
				Local = rgb(248,109,124),
				Self = rgb(248,109,124),
				FunctionName = rgb(253,251,172),
				Bracket = rgb(204,204,204)
			},
		},
		Window = {
			TitleOnMiddle = false,
			Transparency = .2
		},
		RemoteBlockWriteAttribute = false, -- writes attribute to remote instance if remote is blocked/unblocked
		ClassIcon = "NewDark",
		-- What available icons:
		-- > Vanilla3
		-- > Old
		-- > NewDark
	}
end)()

-- Vars
local Settings = DefaultSettings or {}
local Apps = {}
local env = {}

local service = setmetatable({},{__index = function(self,name)
	local serv = cloneref(game:GetService(name))
	self[name] = serv
	return serv
end})
local plr = service.Players.LocalPlayer or service.Players.PlayerAdded:wait()

local create = function(data)
	local insts = {}
	for i,v in pairs(data) do insts[v[1]] = Instance.new(v[2]) end

	for _,v in pairs(data) do
		for prop,val in pairs(v[3]) do
			if type(val) == "table" then
				insts[v[1]][prop] = insts[val[1]]
			else
				insts[v[1]][prop] = val
			end
		end
	end

	return insts[1]
end

local createSimple = function(class,props)
	local inst = Instance.new(class)
	for i,v in next,props do
		inst[i] = v
	end
	return inst
end

Main = (function()
	local Main = {}

	Main.ModuleList = {"Explorer","Properties","ScriptViewer","Console","SaveInstance","ModelViewer"}
	Main.Elevated = false
	Main.AllowDraggableOnMobile = true
	Main.MissingEnv = {}
	Main.Version = "2.2"
	Main.Mouse = plr:GetMouse()
	Main.AppControls = {}
	Main.Apps = Apps
	Main.MenuApps = {}
	Main.GitRepoName = "AZYsGithub/DexPlusPlus"

	Main.DisplayOrders = {
		SideWindow = 8,
		Window = 10,
		Menu = 100000,
		Core = 101000
	}
	
	--[[Main.LoadAdonisBypass = function()
		-- skidded off reddit :pensive:
		local getinfo = getinfo or debug.getinfo
		local DEBUG = false
		local Hooked = {}

		local Detected, Kill

		setthreadidentity(2)

		for i, v in getgc(true) do
			if typeof(v) == "table" then
				local DetectFunc = rawget(v, "Detected")
				local KillFunc = rawget(v, "Kill")

				if typeof(DetectFunc) == "function" and not Detected then
					Detected = DetectFunc

					local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
						if Action ~= "_" then
							if DEBUG then
								warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
							end
						end

						return true
					end)

					table.insert(Hooked, Detected)
				end

				if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
					Kill = KillFunc
					local Old; Old = hookfunction(Kill, function(Info)
						if DEBUG then
							warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
						end
					end)

					table.insert(Hooked, Kill)
				end
			end
		end

		local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
			local LevelOrFunc, Info = ...

			if Detected and LevelOrFunc == Detected then
				if DEBUG then
					warn(`Adonis AntiCheat sanity check detected and broken`)
				end

				return coroutine.yield(coroutine.running())
			end

			return Old(...)
		end))
		-- setthreadidentity(9)
		setthreadidentity(7)
	end
	
	Main.LoadGCBypass = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/secretisadev/Babyhamsta_Backup/refs/heads/main/Universal/Bypasses.lua", true))()
	end]]
	
	Main.GetRandomString = function()
		local output = ""
		for i = 2, 25 do
			output = output .. string.char(math.random(1,250))
		end
		
		return output
	end
	
	Main.SecureGui = function(gui)
		--warn("Secured: "..gui.Name)
		gui.Name = Main.GetRandomString()
		-- service already using cloneref
		if gethui then
			gui.Parent = gethui()
		elseif syn and syn.protect_gui then
			syn.protect_gui(gui)
			gui.Parent = service.CoreGui
		elseif protect_gui then
			protect_gui(gui)
			gui.Parent = service.CoreGui
		elseif protectgui then
			protectgui(gui)
			gui.Parent = service.CoreGui
		else
			if Main.Elevated then
				gui.Parent = service.CoreGui
			else
				gui.Parent = service.Players.LocalPlayer:WaitForChild("PlayerGui")
			end
		end
	end

	Main.GetInitDeps = function()
		return {
			Main = Main,
			Lib = Lib,
			Apps = Apps,
			Settings = Settings,

			API = API,
			RMD = RMD,
			env = env,
			service = service,
			plr = plr,
			create = create,
			createSimple = createSimple
		}
	end

	Main.Error = function(str)
		if rconsoleprint then
			rconsoleprint("DEX ERROR: "..tostring(str).."\n")
			wait(9e9)
		else
			error(str)
		end
	end

	Main.LoadModule = function(name)
		if Main.Elevated then -- If you don't have filesystem api then ur outta luck tbh
			local control

			if EmbeddedModules then -- Offline Modules
				control = EmbeddedModules[name]()

				-- TODO: Remove when open source
				if gethsfuncs then
					control = _G.moduleData
				end

				if not control then Main.Error("Missing Embedded Module: "..name) end
			elseif _G.DebugLoadModel then -- Load Debug Model File
				local model = Main.DebugModel
				if not model then model = oldgame:GetObjects(getsynasset("AfterModules.rbxm"))[1] end

				control = loadstring(model.Modules[name].Source)()
				print("Locally Loaded Module",name,control)
			else
				-- Get hash data
				local hashs = Main.ModuleHashData
				if not hashs then
					local s,hashDataStr = pcall(oldgame.HttpGet, game, "https://api.github.com/repos/"..Main.GitRepoName.."/ModuleHashs.dat")
					if not s then Main.Error("Failed to get module hashs") end

					local s,hashData = pcall(service.HttpService.JSONDecode,service.HttpService,hashDataStr)
					if not s then Main.Error("Failed to decode module hash JSON") end

					hashs = hashData
					Main.ModuleHashData = hashs
				end

				-- Check if local copy exists with matching hashs
				local hashfunc = (syn and syn.crypt.hash) or function() return "" end
				local filePath = "dex/ModuleCache/"..name..".lua"
				local s,moduleStr = pcall(env.readfile,filePath)

				if s and hashfunc(moduleStr) == hashs[name] then
					control = loadstring(moduleStr)()
				else
					-- Download and cache
					local s,moduleStr = pcall(oldgame.HttpGet, game, "https://api.github.com/repos/"..Main.GitRepoName.."/Modules/"..name..".lua")
					if not s then Main.Error("Failed to get external module data of "..name) end

					env.writefile(filePath,moduleStr)
					control = loadstring(moduleStr)()
				end
			end

			Main.AppControls[name] = control
			control.InitDeps(Main.GetInitDeps())

			local moduleData = control.Main()
			Apps[name] = moduleData
			return moduleData
		else
			local module = script:WaitForChild("Modules"):WaitForChild(name,2)
			if not module then Main.Error("CANNOT FIND MODULE "..name) end

			local control = require(module)
			Main.AppControls[name] = control
			control.InitDeps(Main.GetInitDeps())

			local moduleData = control.Main()
			Apps[name] = moduleData
			return moduleData
		end
	end

	Main.LoadModules = function()
		for i,v in pairs(Main.ModuleList) do
			local s,e = pcall(Main.LoadModule,v)
			if not s then
				Main.Error("FAILED LOADING " .. v .. " CAUSE " .. e)
			end
		end

		-- Init Major Apps and define them in modules
		Explorer = Apps.Explorer
		Properties = Apps.Properties
		ScriptViewer = Apps.ScriptViewer
		Console = Apps.Console
		SaveInstance = Apps.SaveInstance
		ModelViewer = Apps.ModelViewer
		Notebook = Apps.Notebook
		
		--SecretServicePanel = Apps.SecretServicePanel
		local appTable = {
			Explorer = Explorer,
			Properties = Properties,
			ScriptViewer = ScriptViewer,
			Console = Console,
			SaveInstance = SaveInstance,
			ModelViewer = ModelViewer,
			Notebook = Notebook,
			
			--SecretServicePanel = SecretServicePanel,
		}

		Main.AppControls.Lib.InitAfterMain(appTable)
		for i,v in pairs(Main.ModuleList) do
			local control = Main.AppControls[v]
			if control then
				control.InitAfterMain(appTable)
			end
		end
	end

	Main.InitEnv = function()
		setmetatable(env,{__newindex = function(self,name,func)
			if not func then Main.MissingEnv[#Main.MissingEnv+1] = name return end
			rawset(self,name,func)
		end})

		env.isonmobile = game:GetService("UserInputService").TouchEnabled
		
		env.loadstring = (pcall(loadstring,"local a = 1") and loadstring) or (game:GetService("RunService"):IsStudio() and script.Modules:FindFirstChild("Loadstring") and require(script.Modules:FindFirstChild("Loadstring")))

		-- file
		env.isfile = isfile
		env.isfolder = isfolder
		env.readfile = readfile
		env.writefile = writefile
		env.appendfile = appendfile
		env.makefolder = makefolder
		env.listfiles = listfiles
		env.loadfile = loadfile
		env.saveinstance = saveinstance or (function()
			--warn("No built-in saveinstance exists, using SynSaveInstance and wrapper...")
			if game:GetService("RunService"):IsStudio() then return function() error("Cannot run in Roblox Studio!") end end
			local Params = {
				RepoURL = "https://raw.githubusercontent.com/luau/SynSaveInstance/main/",
				SSI = "saveinstance",
			}
			local synsaveinstance = loadstring(oldgame:HttpGet(Params.RepoURL .. Params.SSI .. ".luau", true), Params.SSI)()
		
			local function wrappedsaveinstance(obj, filepath, options)
				options["FilePath"] = filepath
				--options["ReadMe"] = false
				options["Object"] = obj
				return synsaveinstance(options)
			end
			
			getgenv().saveinstance = wrappedsaveinstance
			return wrappedsaveinstance
		end)()
		
		env.parsefile = function(name)
			return tostring(name):gsub("[*\\?:<>|]+", ""):sub(1, 175)
		end

		-- debug
		env.getupvalues = debug.getupvalues or getupvalues or getupvals
		env.getconstants = debug.getconstants or getconstants or getconsts
		env.islclosure = islclosure or is_l_closure
		env.checkcaller = checkcaller
		env.getreg = getreg
		env.getgc = getgc
		
		-- hooks
		env.hookfunction = hookfunction
		env.hookmetamethod = hookmetamethod

		-- other
		env.getscriptbytecode = getscriptbytecode
		env.setfflag = setfflag
		env.protectgui = protect_gui or (syn and syn.protect_gui)
		env.gethui = gethui
		env.setclipboard = setclipboard
		env.getnilinstances = getnilinstances or get_nil_instances
		env.getloadedmodules = getloadedmodules
		
		env.isViableDecompileScript = function(obj)
			if obj:IsA("ModuleScript") then
				return true
			elseif obj:IsA("LocalScript") and (obj.RunContext == Enum.RunContext.Client or obj.RunContext == Enum.RunContext.Legacy) then
				return true
			elseif obj:IsA("Script") and obj.RunContext == Enum.RunContext.Client then
				return true
			end
			return false
		end
		env.request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
		
		env.decompile = decompile or (function()
			-- by lovrewe
			--warn("No built-in decompiler exists, using Konstant decompiler...")
			--assert(getscriptbytecode, "Exploit not supported.")
			
			if not env.getscriptbytecode then --[[warn('Konstant decompiler is not supported. "getscriptbytecode" is missing.')]] return end

			local API = "http://api.plusgiant5.com"

			local last_call = 0

			local request = env.request

			local function call(konstantType, scriptPath)
				local success, bytecode = pcall(env.getscriptbytecode, scriptPath)

				if (not success) then
					return `-- Failed to get script bytecode, error:\n\n--[[\n{bytecode}\n--]]`
				end

				local time_elapsed = os.clock() - last_call
				if time_elapsed <= .5 then
					task.wait(.5 - time_elapsed)
				end

				local httpResult = request({
					Url = API .. konstantType,
					Body = bytecode,
					Method = "POST",
					Headers = {
						["Content-Type"] = "text/plain"
					}
				})

				last_call = os.clock()

				if (httpResult.StatusCode ~= 200) then
					return `-- Error occurred while requesting Konstant API, error:\n\n--[[\n{httpResult.Body}\n--]]`
				else
					return httpResult.Body
				end
			end

			local function decompile(scriptPath)
				return call("/konstant/decompile", scriptPath)
			end

			getgenv().decompile = decompile
			
			env.decompile = decompile
			return decompile
		end)()

		if identifyexecutor then
			Main.Executor = identifyexecutor()
		end

		Main.GuiHolder = Main.Elevated and service.CoreGui or plr:FindFirstChildOfClass("PlayerGui")

		setmetatable(env,nil)
	end

	Main.IncompatibleTest = function()
		--[[local function incompatibleMessage(reason, tolerated)
			local msg = Instance.new("ScreenGui")
			msg.IgnoreGuiInset = true
			local t = Instance.new("TextLabel",msg)
			t.BackgroundColor3 = Color3.fromRGB(50,50,50)
			t.Position = UDim2.new(0,0,0,0)
			t.Size = UDim2.new(1,0,1,0)
			t.TextColor3 = Color3.new(1,1,1)
			t.TextWrapped = true
			t.TextScaled = true
			t.Text = "\n\n\n\n\n\n\n\nHello Skidsploit user,\nZinnia, Chillz and the Secret Service does not approve of Dex being used on your skidsploit.\nPlease consider getting something better.\n\nIncompatible Reason: "..reason.."\n\n\n\n\n\n\n\n"
			
			-- This sound wont work!!!
			local sound = Instance.new("Sound",msg)
			sound.SoundId = "rbxassetid://175964948"
			sound.Volume = 1
			sound.Looped = true
			sound.Playing = true
			
			if not tolerated then
				Lib.ShowGui(msg)
				
				if os and os.execute then pcall(os.execute,'explorer "https://weao.xyz"') end
				if pcall(game.GetService, game,"MessageBusService") and game:GetService("MessageBusService").Publish then pcall(game:GetService("MessageBusService").Publish, game:GetService("MessageBusService"), game:GetService("MessageBusService"):GetMessageId("Linking", "openURLRequest"), {url = 'explorer "https://weao.xyz"'}) end
			else
				warn(msg)
			end			
		end
		
																																													local yummy, evilList = "\105\100\101\110\116\105\102\121\101\120\101\99\117\116\111\114", { "\120\101\110\111", "\115\111\108\97\114\97", "\119\97\118\101" }
																																													if ggv and ggv()[yummy] then local wow = ggv()[yummy] if table.find(evilList, string.lower(wow)) then incompatibleMessage("\83\72\73\84\84\89\32\69\88\69\67\85\84\79\82") end end
																																													
		local t = {}
		t[1] = t
		local x = unpack(t) or incompatibleMessage("WRAPPER FAILED TO CYCLIC #1")
		if x[1] ~= t then incompatibleMessage("WRAPPER FAILED TO CYCLIC #2") end
		
		if game ~= workspace.Parent then
			incompatibleMessage("WRAPPER NO CACHE (game ≠ workspace.Parent)", true)
			game = workspace.Parent
		end
		
		if Main.Elevated and not loadstring("for i = 1,1 do continue end") then incompatibleMessage("CAN'T CONTINUE OR NO LOADSTRING")end
		
		local obj = newproxy(true)
		local mt = getmetatable(obj)
		mt.__index = function() incompatibleMessage("CAN'T NAMECALL (__index triggered instead of __namecall)") end
		mt.__namecall = function() end
		obj:No()
		
		local fEnv = setmetatable({zin = 5},{__index = getfenv()})
		local caller = function(f) f() end
		setfenv(caller,fEnv)
		caller(function() if not getfenv(2).zin then incompatibleMessage("RERU WILL BE FILING A LAWSUIT AGAINST YOU SOON") end end)
		
		local second = false
		coroutine.wrap(function() local start = tick() wait(5) if tick() - start < 0.1 or not second then incompatibleMessage("SKIDDED YIELDING") end end)()
		second = true]]
	end
	
	local function serialize(val)
		if typeof(val) == "Color3" then
			local serializedColor = {}
			serializedColor.R = val.R
			serializedColor.G = val.G
			serializedColor.B = val.B
			return serializedColor
		else
			return val
		end
	end
	
	local function deserialize(val)
		if typeof(val) == "table" then
			if val.R and val.G and val.B then
				return Color3.new(val.R, val.G, val.B)
			else
				return val
			end
		else
			return val
		end
	end
	
	Main.ExportSettings = function()
		local rawData = Settings or DefaultSettings

		local function recur(tbl)
			local newTbl = {}
			for i, v in pairs(tbl) do
				if typeof(v) == "table" then
					newTbl[i] = recur(v)
				else
					newTbl[i] = serialize(v)
				end
			end
			return newTbl
		end

		-- serialize color3 sebelum encode
		local serializedData = recur(rawData)

		local s, json = pcall(service.HttpService.JSONEncode, service.HttpService, serializedData)
		if s and json then
			return json
		end
	end


	--warn(Main.ExportSettings())

	Main.LoadSettings = function()
		local s, data = pcall(env.readfile or error, "DexPlusPlusSettings.json")
		if s and data and data ~= "" then
			local s, decoded = pcall(service.HttpService.JSONDecode, service.HttpService, data)
			if s and decoded then

				local function recur(tbl)
					local newTbl = {}
					for i, v in pairs(tbl) do
						if typeof(v) == "table" then
							newTbl[i] = deserialize(recur(v))
						else
							newTbl[i] = deserialize(v)
						end
					end
					return newTbl
				end

				local deserializedData = recur(decoded)
				for k, v in pairs(deserializedData) do
					Settings[k] = v
				end

			else
				warn("failed to decode settings json")
			end
		else
			Main.ResetSettings()
		end
	end

	
	

	Main.ResetSettings = function()
		local function recur(t,res)
			for set,val in pairs(t) do
				if type(val) == "table" and val._Recurse then
					if type(res[set]) ~= "table" then
						res[set] = {}
					end
					recur(val,res[set])
				else
					res[set] = val
				end
			end
			return res
		end
		recur(DefaultSettings,Settings)
	end

	Main.FetchAPI = function(callbackiflong, callbackiftoolong, XD)
		local downloaded = false
		local api,rawAPI
		if Main.Elevated then
			if Main.LocalDepsUpToDate() then
				local localAPI = Lib.ReadFile("dex/rbx_api.dat")
				if localAPI then 
					rawAPI = localAPI
				else
					Main.DepsVersionData[1] = ""
				end
			end
			task.spawn(function()
				task.wait(10)
				if not downloaded and callbackiflong then callbackiflong() end

				task.wait(20) -- 30
				if not downloaded and callbackiftoolong then callbackiftoolong() end

				task.wait(30) -- 60
				if not downloaded and XD then XD() end
			end)
			-- lmfao async makes it work to load big file
			rawAPI = rawAPI or game:HttpGet("http://setup.roblox.com/"..Main.RobloxVersion.."-API-Dump.json")
		else
			if script:FindFirstChild("API") then
				rawAPI = require(script.API)
			else
				error("NO API EXISTS")
			end
		end
		downloaded = true
		
		Main.RawAPI = rawAPI
		api = service.HttpService:JSONDecode(rawAPI)

		local classes,enums = {},{}
		local categoryOrder,seenCategories = {},{}

		local function insertAbove(t,item,aboveItem)
			local findPos = table.find(t,item)
			if not findPos then return end
			table.remove(t,findPos)

			local pos = table.find(t,aboveItem)
			if not pos then return end
			table.insert(t,pos,item)
		end

		for _,class in pairs(api.Classes) do
			local newClass = {}
			newClass.Name = class.Name
			newClass.Superclass = class.Superclass
			newClass.Properties = {}
			newClass.Functions = {}
			newClass.Events = {}
			newClass.Callbacks = {}
			newClass.Tags = {}

			if class.Tags then for c,tag in pairs(class.Tags) do newClass.Tags[tag] = true end end
			for __,member in pairs(class.Members) do
				local newMember = {}
				newMember.Name = member.Name
				newMember.Class = class.Name
				newMember.Security = member.Security
				newMember.Tags ={}
				if member.Tags then for c,tag in pairs(member.Tags) do newMember.Tags[tag] = true end end

				local mType = member.MemberType
				if mType == "Property" then
					local propCategory = member.Category or "Other"
					propCategory = propCategory:match("^%s*(.-)%s*$")
					if not seenCategories[propCategory] then
						categoryOrder[#categoryOrder+1] = propCategory
						seenCategories[propCategory] = true
					end
					newMember.ValueType = member.ValueType
					newMember.Category = propCategory
					newMember.Serialization = member.Serialization
					table.insert(newClass.Properties,newMember)
				elseif mType == "Function" then
					newMember.Parameters = {}
					newMember.ReturnType = member.ReturnType.Name
					for c,param in pairs(member.Parameters) do
						table.insert(newMember.Parameters,{Name = param.Name, Type = param.Type.Name})
					end
					table.insert(newClass.Functions,newMember)
				elseif mType == "Event" then
					newMember.Parameters = {}
					for c,param in pairs(member.Parameters) do
						table.insert(newMember.Parameters,{Name = param.Name, Type = param.Type.Name})
					end
					table.insert(newClass.Events,newMember)
				end
			end

			classes[class.Name] = newClass
		end

		for _,class in pairs(classes) do
			class.Superclass = classes[class.Superclass]
		end

		for _,enum in pairs(api.Enums) do
			local newEnum = {}
			newEnum.Name = enum.Name
			newEnum.Items = {}
			newEnum.Tags = {}

			if enum.Tags then for c,tag in pairs(enum.Tags) do newEnum.Tags[tag] = true end end
			for __,item in pairs(enum.Items) do
				local newItem = {}
				newItem.Name = item.Name
				newItem.Value = item.Value
				table.insert(newEnum.Items,newItem)
			end

			enums[enum.Name] = newEnum
		end

		local function getMember(class,member)
			if not classes[class] or not classes[class][member] then return end
			local result = {}

			local currentClass = classes[class]
			while currentClass do
				for _,entry in pairs(currentClass[member]) do
					result[#result+1] = entry
				end
				currentClass = currentClass.Superclass
			end

			table.sort(result,function(a,b) return a.Name < b.Name end)
			return result
		end

		insertAbove(categoryOrder,"Behavior","Tuning")
		insertAbove(categoryOrder,"Appearance","Data")
		insertAbove(categoryOrder,"Attachments","Axes")
		insertAbove(categoryOrder,"Cylinder","Slider")
		insertAbove(categoryOrder,"Localization","Jump Settings")
		insertAbove(categoryOrder,"Surface","Motion")
		insertAbove(categoryOrder,"Surface Inputs","Surface")
		insertAbove(categoryOrder,"Part","Surface Inputs")
		insertAbove(categoryOrder,"Assembly","Surface Inputs")
		insertAbove(categoryOrder,"Character","Controls")
		categoryOrder[#categoryOrder+1] = "Unscriptable"
		categoryOrder[#categoryOrder+1] = "Attributes"

		local categoryOrderMap = {}
		for i = 1,#categoryOrder do
			categoryOrderMap[categoryOrder[i]] = i
		end

		return {
			Classes = classes,
			Enums = enums,
			CategoryOrder = categoryOrderMap,
			GetMember = getMember
		}
	end

	Main.FetchRMD = function()
		local rawXML
		if Main.Elevated then
			if Main.LocalDepsUpToDate() then
				local localRMD = Lib.ReadFile("dex/rbx_rmd.dat")
				if localRMD then 
					rawXML = localRMD
				else
					Main.DepsVersionData[1] = ""
				end
			end
			rawXML = rawXML or game:HttpGet("https://raw.githubusercontent.com/CloneTrooper1019/Roblox-Client-Tracker/roblox/ReflectionMetadata.xml")
		else
			if script:FindFirstChild("RMD") then
				rawXML = require(script.RMD)
			else
				error("NO RMD EXISTS")
			end
		end
		Main.RawRMD = rawXML
		local parsed = Lib.ParseXML(rawXML)
		local classList = parsed.children[1].children[1].children
		local enumList = parsed.children[1].children[2].children
		local propertyOrders = {}

		local classes,enums = {},{}
		for _,class in pairs(classList) do
			local className = ""
			for _,child in pairs(class.children) do
				if child.tag == "Properties" then
					local data = {Properties = {}, Functions = {}}
					local props = child.children
					for _,prop in pairs(props) do
						local name = prop.attrs.name
						name = name:sub(1,1):upper()..name:sub(2)
						data[name] = prop.children[1].text
					end
					className = data.Name
					classes[className] = data
				elseif child.attrs.class == "ReflectionMetadataProperties" then
					local members = child.children
					for _,member in pairs(members) do
						if member.attrs.class == "ReflectionMetadataMember" then
							local data = {}
							if member.children[1].tag == "Properties" then
								local props = member.children[1].children
								for _,prop in pairs(props) do
									if prop.attrs then
										local name = prop.attrs.name
										name = name:sub(1,1):upper()..name:sub(2)
										data[name] = prop.children[1].text
									end
								end
								if data.PropertyOrder then
									local orders = propertyOrders[className]
									if not orders then orders = {} propertyOrders[className] = orders end
									orders[data.Name] = tonumber(data.PropertyOrder)
								end
								classes[className].Properties[data.Name] = data
							end
						end
					end
				elseif child.attrs.class == "ReflectionMetadataFunctions" then
					local members = child.children
					for _,member in pairs(members) do
						if member.attrs.class == "ReflectionMetadataMember" then
							local data = {}
							if member.children[1].tag == "Properties" then
								local props = member.children[1].children
								for _,prop in pairs(props) do
									if prop.attrs then
										local name = prop.attrs.name
										name = name:sub(1,1):upper()..name:sub(2)
										data[name] = prop.children[1].text
									end
								end
								classes[className].Functions[data.Name] = data
							end
						end
					end
				end
			end
		end

		for _,enum in pairs(enumList) do
			local enumName = ""
			for _,child in pairs(enum.children) do
				if child.tag == "Properties" then
					local data = {Items = {}}
					local props = child.children
					for _,prop in pairs(props) do
						local name = prop.attrs.name
						name = name:sub(1,1):upper()..name:sub(2)
						data[name] = prop.children[1].text
					end
					enumName = data.Name
					enums[enumName] = data
				elseif child.attrs.class == "ReflectionMetadataEnumItem" then
					local data = {}
					if child.children[1].tag == "Properties" then
						local props = child.children[1].children
						for _,prop in pairs(props) do
							local name = prop.attrs.name
							name = name:sub(1,1):upper()..name:sub(2)
							data[name] = prop.children[1].text
						end
						enums[enumName].Items[data.Name] = data
					end
				end
			end
		end

		return {Classes = classes, Enums = enums, PropertyOrders = propertyOrders}
	end

	Main.ShowGui = Main.SecureGui

	Main.CreateIntro = function(initStatus) -- TODO: Must theme and show errors
		local gui = create({
			{1,"ScreenGui",{Name="Intro",}},
			{2,"Frame",{Active=true,BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="Main",Parent={1},Position=UDim2.new(0.5,-175,0.5,-100),Size=UDim2.new(0,350,0,200),}},
			{3,"Frame",{BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,ClipsDescendants=true,Name="Holder",Parent={2},Size=UDim2.new(1,0,1,0),}},
			{4,"UIGradient",{Parent={3},Rotation=30,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{5,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=4,Name="Title",Parent={3},Position=UDim2.new(0,-190,0,15),Size=UDim2.new(0,100,0,50),Text="Dex++",TextColor3=Color3.new(1,1,1),TextSize=50,TextTransparency=1,}},
			{6,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Desc",Parent={3},Position=UDim2.new(0,-230,0,60),Size=UDim2.new(0,180,0,25),Text="Ultimate Debugging Suite",TextColor3=Color3.new(1,1,1),TextSize=18,TextTransparency=1,}},
			{7,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="StatusText",Parent={3},Position=UDim2.new(0,20,0,110),Size=UDim2.new(0,180,0,25),Text="Fetching API",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=1,}},
			{8,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="ProgressBar",Parent={3},Position=UDim2.new(0,110,0,145),Size=UDim2.new(0,0,0,4),}},
			{9,"Frame",{BackgroundColor3=Color3.new(0.2392156869173,0.56078433990479,0.86274510622025),BorderSizePixel=0,Name="Bar",Parent={8},Size=UDim2.new(0,0,1,0),}},
			{10,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://2764171053",ImageColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),Parent={8},ScaleType=1,Size=UDim2.new(1,0,1,0),SliceCenter=Rect.new(2,2,254,254),}},
			{11,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Creator",Parent={2},Position=UDim2.new(1,-110,1,-20),Size=UDim2.new(0,105,0,20),Text="Developed by Chillz.",TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=1,}},
			{12,"UIGradient",{Parent={11},Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{13,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Version",Parent={2},Position=UDim2.new(1,-110,1,-35),Size=UDim2.new(0,105,0,20),Text=Main.Version,TextColor3=Color3.new(1,1,1),TextSize=14,TextXAlignment=1,}},
			{14,"UIGradient",{Parent={13},Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{15,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Image="rbxassetid://1427967925",Name="Outlines",Parent={2},Position=UDim2.new(0,-5,0,-5),ScaleType=1,Size=UDim2.new(1,10,1,10),SliceCenter=Rect.new(6,6,25,25),TileSize=UDim2.new(0,20,0,20),}},
			{16,"UIGradient",{Parent={15},Rotation=-30,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{17,"UIGradient",{Parent={2},Rotation=-30,Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,1,0),}),}},
			{18,"UIDragDetector", {Parent={2}}}
		})
		Main.ShowGui(gui)
		local backGradient = gui.Main.UIGradient
		local outlinesGradient = gui.Main.Outlines.UIGradient
		local holderGradient = gui.Main.Holder.UIGradient
		local titleText = gui.Main.Holder.Title
		local descText = gui.Main.Holder.Desc
		local versionText = gui.Main.Version
		local versionGradient = versionText.UIGradient
		local creatorText = gui.Main.Creator
		local creatorGradient = creatorText.UIGradient
		local statusText = gui.Main.Holder.StatusText
		local progressBar = gui.Main.Holder.ProgressBar
		local tweenS = service.TweenService

		local renderStepped = service.RunService.RenderStepped
		local signalWait = renderStepped.wait
		local fastwait = function(s)
			if not s then return signalWait(renderStepped) end
			local start = tick()
			while tick() - start < s do signalWait(renderStepped) end
		end

		statusText.Text = initStatus

		local function tweenNumber(n,ti,func)
			local tweenVal = Instance.new("IntValue")
			tweenVal.Value = 0
			tweenVal.Changed:Connect(func)
			local tween = tweenS:Create(tweenVal,ti,{Value = n})
			tween:Play()
			tween.Completed:Connect(function()
				tweenVal:Destroy()
			end)
		end

		local ti = TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
		tweenNumber(100,ti,function(val)
			val = val/200
			local start = NumberSequenceKeypoint.new(0,0)
			local a1 = NumberSequenceKeypoint.new(val,0)
			local a2 = NumberSequenceKeypoint.new(math.min(0.5,val+math.min(0.05,val)),1)
			if a1.Time == a2.Time then a2 = a1 end
			local b1 = NumberSequenceKeypoint.new(1-val,0)
			local b2 = NumberSequenceKeypoint.new(math.max(0.5,1-val-math.min(0.05,val)),1)
			if b1.Time == b2.Time then b2 = b1 end
			local goal = NumberSequenceKeypoint.new(1,0)
			backGradient.Transparency = NumberSequence.new({start,a1,a2,b2,b1,goal})
			outlinesGradient.Transparency = NumberSequence.new({start,a1,a2,b2,b1,goal})
		end)

		fastwait(0.4)

		tweenNumber(100,ti,function(val)
			val = val/166.66
			local start = NumberSequenceKeypoint.new(0,0)
			local a1 = NumberSequenceKeypoint.new(val,0)
			local a2 = NumberSequenceKeypoint.new(val+0.01,1)
			local goal = NumberSequenceKeypoint.new(1,1)
			holderGradient.Transparency = NumberSequence.new({start,a1,a2,goal})
		end)

		tweenS:Create(titleText,ti,{Position = UDim2.new(0,60,0,15), TextTransparency = 0}):Play()
		tweenS:Create(descText,ti,{Position = UDim2.new(0,20,0,60), TextTransparency = 0}):Play()

		local function rightTextTransparency(obj)
			tweenNumber(100,ti,function(val)
				val = val/100
				local a1 = NumberSequenceKeypoint.new(1-val,0)
				local a2 = NumberSequenceKeypoint.new(math.max(0,1-val-0.01),1)
				if a1.Time == a2.Time then a2 = a1 end
				local start = NumberSequenceKeypoint.new(0,a1 == a2 and 0 or 1)
				local goal = NumberSequenceKeypoint.new(1,0)
				obj.Transparency = NumberSequence.new({start,a2,a1,goal})
			end)
		end
		rightTextTransparency(versionGradient)
		rightTextTransparency(creatorGradient)

		fastwait(0.9)

		local progressTI = TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

		tweenS:Create(statusText,progressTI,{Position = UDim2.new(0,20,0,120), TextTransparency = 0}):Play()
		tweenS:Create(progressBar,progressTI,{Position = UDim2.new(0,60,0,145), Size = UDim2.new(0,100,0,4)}):Play()

		fastwait(0.25)

		local function setProgress(text,n)
			statusText.Text = text
			tweenS:Create(progressBar.Bar,progressTI,{Size = UDim2.new(n,0,1,0)}):Play()
		end

		local function close()
			tweenS:Create(titleText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(descText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(versionText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(creatorText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(statusText,progressTI,{TextTransparency = 1}):Play()
			tweenS:Create(progressBar,progressTI,{BackgroundTransparency = 1}):Play()
			tweenS:Create(progressBar.Bar,progressTI,{BackgroundTransparency = 1}):Play()
			tweenS:Create(progressBar.ImageLabel,progressTI,{ImageTransparency = 1}):Play()

			tweenNumber(100,TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.In),function(val)
				val = val/250
				local start = NumberSequenceKeypoint.new(0,0)
				local a1 = NumberSequenceKeypoint.new(0.6+val,0)
				local a2 = NumberSequenceKeypoint.new(math.min(1,0.601+val),1)
				if a1.Time == a2.Time then a2 = a1 end
				local goal = NumberSequenceKeypoint.new(1,a1 == a2 and 0 or 1)
				holderGradient.Transparency = NumberSequence.new({start,a1,a2,goal})
			end)

			fastwait(0.5)
			gui.Main.BackgroundTransparency = 1
			outlinesGradient.Rotation = 30

			tweenNumber(100,ti,function(val)
				val = val/100
				local start = NumberSequenceKeypoint.new(0,1)
				local a1 = NumberSequenceKeypoint.new(val,1)
				local a2 = NumberSequenceKeypoint.new(math.min(1,val+math.min(0.05,val)),0)
				if a1.Time == a2.Time then a2 = a1 end
				local goal = NumberSequenceKeypoint.new(1,a1 == a2 and 1 or 0)
				outlinesGradient.Transparency = NumberSequence.new({start,a1,a2,goal})
				holderGradient.Transparency = NumberSequence.new({start,a1,a2,goal})
			end)

			fastwait(0.45)
			gui:Destroy()
		end

		return {SetProgress = setProgress, Close = close, Object = gui}
	end

	Main.CreateApp = function(data)
		if Main.MenuApps[data.Name] then return end -- TODO: Handle conflict
		local control = {}

		local app = Main.AppTemplate:Clone()

		local iconIndex = data.Icon
		if data.IconMap and iconIndex then
			if type(iconIndex) == "number" then
				data.IconMap:Display(app.Main.Icon,iconIndex)
			elseif type(iconIndex) == "string" then
				data.IconMap:DisplayByKey(app.Main.Icon,iconIndex)
			end
		elseif type(iconIndex) == "string" then
			app.Main.Icon.Image = iconIndex
		else
			app.Main.Icon.Image = ""
		end

		local function updateState()
			app.Main.BackgroundTransparency = data.Open and 0 or (Lib.CheckMouseInGui(app.Main) and 0 or 1)
			app.Main.Highlight.Visible = data.Open
		end

		local function enable(silent)
			if data.Open then return end
			data.Open = true
			updateState()
			if not silent then
				if data.Window then data.Window:Show() end
				if data.OnClick then data.OnClick(data.Open) end
			end
		end

		local function disable(silent)
			if not data.Open then return end
			data.Open = false
			updateState()
			if not silent then
				if data.Window then data.Window:Hide() end
				if data.OnClick then data.OnClick(data.Open) end
			end
		end

		updateState()

		local ySize = service.TextService:GetTextSize(data.Name,14,Enum.Font.SourceSans,Vector2.new(62,999999)).Y
		app.Main.Size = UDim2.new(1,0,0,math.clamp(46+ySize,60,74))
		app.Main.AppName.Text = data.Name

		app.Main.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				app.Main.BackgroundTransparency = 0
				app.Main.BackgroundColor3 = Settings.Theme.ButtonHover
			end
		end)
		

		app.Main.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				app.Main.BackgroundTransparency = data.Open and 0 or 1
				app.Main.BackgroundColor3 = Settings.Theme.Button
			end
		end)

		app.Main.MouseButton1Click:Connect(function()
			if data.Open then disable() else enable() end
		end)

		local window = data.Window
		if window then
			window.OnActivate:Connect(function() enable(true) end)
			window.OnDeactivate:Connect(function() disable(true) end)
		end

		app.Visible = true
		app.Parent = Main.AppsContainer
		Main.AppsFrame.CanvasSize = UDim2.new(0,0,0,Main.AppsContainerGrid.AbsoluteCellCount.Y*82 + 8)

		control.Enable = enable
		control.Disable = disable
		Main.MenuApps[data.Name] = control
		return control
	end

	Main.SetMainGuiOpen = function(val)
		Main.MainGuiOpen = val

		Main.MainGui.OpenButton.Text = val and "Close" or "Dex++"
		if val then Main.MainGui.OpenButton.MainFrame.Visible = true end
		Main.MainGui.OpenButton.MainFrame:TweenSize(val and UDim2.new(0,224,0,200) or UDim2.new(0,0,0,0),Enum.EasingDirection.Out,Enum.EasingStyle.Quad,0.2,true)
		--Main.MainGui.OpenButton.BackgroundTransparency = val and 0 or (Lib.CheckMouseInGui(Main.MainGui.OpenButton) and 0 or 0.2)
		service.TweenService:Create(Main.MainGui.OpenButton,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = val and 0 or (Lib.CheckMouseInGui(Main.MainGui.OpenButton) and 0 or 0.2)}):Play()

		if Main.MainGuiMouseEvent then Main.MainGuiMouseEvent:Disconnect() end

		if not val then
			local startTime = tick()
			Main.MainGuiCloseTime = startTime
			coroutine.wrap(function()
				Lib.FastWait(0.2)
				if not Main.MainGuiOpen and startTime == Main.MainGuiCloseTime then Main.MainGui.OpenButton.MainFrame.Visible = false end
			end)()
		else
			Main.MainGuiMouseEvent = service.UserInputService.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not Lib.CheckMouseInGui(Main.MainGui.OpenButton) and not Lib.CheckMouseInGui(Main.MainGui.OpenButton.MainFrame) then

					Main.SetMainGuiOpen(false)
				end
			end)
		end
	end

	Main.CreateMainGui = function()
		local gui = create({
			{1,"ScreenGui",{IgnoreGuiInset=true,Name="MainMenu",}},
			{2,"TextButton",{AnchorPoint=Vector2.new(0.5,0),AutoButtonColor=false,BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),BorderSizePixel=0,Font=4,Name="OpenButton",Parent={1},Position=UDim2.new(0.5,0,0,2),Size=UDim2.new(0,55,0,32),Text="Dex++",TextColor3=Color3.new(1,1,1),TextSize=16,TextTransparency=0.20000000298023,}},
			{3,"UICorner",{CornerRadius=UDim.new(0,4),Parent={2},}},
			{4,"Frame",{AnchorPoint=Vector2.new(0.5,0),BackgroundColor3=Color3.new(0.17647059261799,0.17647059261799,0.17647059261799),ClipsDescendants=true,Name="MainFrame",Parent={2},Position=UDim2.new(0.5,0,1,-4),Size=UDim2.new(0,224,0,200),}},
			{5,"UICorner",{CornerRadius=UDim.new(0,4),Parent={4},}},
			{6,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),Name="BottomFrame",Parent={4},Position=UDim2.new(0,0,1,-24),Size=UDim2.new(1,0,0,24),}},
			{7,"UICorner",{CornerRadius=UDim.new(0,4),Parent={6},}},
			{8,"Frame",{BackgroundColor3=Color3.new(0.20392157137394,0.20392157137394,0.20392157137394),BorderSizePixel=0,Name="CoverFrame",Parent={6},Size=UDim2.new(1,0,0,4),}},
			{9,"Frame",{BackgroundColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),BorderSizePixel=0,Name="Line",Parent={8},Position=UDim2.new(0,0,0,-1),Size=UDim2.new(1,0,0,1),}},
			{10,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Settings",Parent={6},Position=UDim2.new(1,-48,0,0),Size=UDim2.new(0,24,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{11,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6578871732",ImageTransparency=0.20000000298023,Name="Icon",Parent={10},Position=UDim2.new(0,4,0,4),Size=UDim2.new(0,16,0,16),}},
			{12,"TextButton",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Font=3,Name="Information",Parent={6},Position=UDim2.new(1,-24,0,0),Size=UDim2.new(0,24,1,0),Text="",TextColor3=Color3.new(1,1,1),TextSize=14,}},
			{13,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6578933307",ImageTransparency=0.20000000298023,Name="Icon",Parent={12},Position=UDim2.new(0,4,0,4),Size=UDim2.new(0,16,0,16),}},
			{14,"ScrollingFrame",{Active=true,AnchorPoint=Vector2.new(0.5,0),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderColor3=Color3.new(0.1294117718935,0.1294117718935,0.1294117718935),BorderSizePixel=0,Name="AppsFrame",Parent={4},Position=UDim2.new(0.5,0,0,0),ScrollBarImageColor3=Color3.new(0,0,0),ScrollBarThickness=4,Size=UDim2.new(0,222,1,-25),}},
			{15,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="Container",Parent={14},Position=UDim2.new(0,7,0,8),Size=UDim2.new(1,-14,0,2),}},
			{16,"UIGridLayout",{CellSize=UDim2.new(0,66,0,74),Parent={15},SortOrder=2,}},
			{17,"Frame",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Name="App",Parent={1},Size=UDim2.new(0,100,0,100),Visible=false,}},
			{18,"TextButton",{AutoButtonColor=false,BackgroundColor3=Color3.new(0.2352941185236,0.2352941185236,0.2352941185236),BorderSizePixel=0,Font=3,Name="Main",Parent={17},Size=UDim2.new(1,0,0,60),Text="",TextColor3=Color3.new(0,0,0),TextSize=14,}},
			{19,"ImageLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,Image="rbxassetid://6579106223",ImageRectSize=Vector2.new(32,32),Name="Icon",Parent={18},Position=UDim2.new(0.5,-16,0,4),ScaleType=4,Size=UDim2.new(0,32,0,32),}},
			{20,"TextLabel",{BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=1,BorderSizePixel=0,Font=3,Name="AppName",Parent={18},Position=UDim2.new(0,2,0,38),Size=UDim2.new(1,-4,1,-40),Text="Explorer",TextColor3=Color3.new(1,1,1),TextSize=14,TextTransparency=0.10000000149012,TextTruncate=1,TextWrapped=true,TextYAlignment=0,}},
			{21,"Frame",{BackgroundColor3=Color3.new(0,0.66666668653488,1),BorderSizePixel=0,Name="Highlight",Parent={18},Position=UDim2.new(0,0,1,-2),Size=UDim2.new(1,0,0,2),}},
		})
		Main.MainGui = gui
		Main.AppsFrame = gui.OpenButton.MainFrame.AppsFrame
		Main.AppsContainer = Main.AppsFrame.Container
		Main.AppsContainerGrid = Main.AppsContainer.UIGridLayout
		Main.AppTemplate = gui.App
		Main.MainGuiOpen = false

		local openButton = gui.OpenButton
		openButton.BackgroundTransparency = 0.2
		openButton.MainFrame.Size = UDim2.new(0,0,0,0)
		openButton.MainFrame.Visible = false
		openButton.MouseButton1Click:Connect(function()
			Main.SetMainGuiOpen(not Main.MainGuiOpen)
		end)

		openButton.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				service.TweenService:Create(Main.MainGui.OpenButton,TweenInfo.new(0,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
			end
		end)

		openButton.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				service.TweenService:Create(Main.MainGui.OpenButton,TweenInfo.new(0,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{BackgroundTransparency = Main.MainGuiOpen and 0 or 0.2}):Play()
			end
		end)
		
		local infoDexIntro, isInfoCD
		
		openButton.MainFrame.BottomFrame.Settings.Visible = false -- hide it for now
		
		openButton.MainFrame.BottomFrame.Information.MouseButton1Click:Connect(function()
			local duration = 1
			local Infos = {
				"Contributors >>",
				"Toon (IY Dex and PRs)",
				"Moon (Dex)",
				"Cazan (3D Preview)",
			}
			
			if isInfoCD then return end
			isInfoCD = true
			if not infoDexIntro then
				infoDexIntro = Main.CreateIntro("Running")
				
				coroutine.wrap(function()
					while infoDexIntro do
						for i,text in Infos do
							if not infoDexIntro then break end
							infoDexIntro.SetProgress(text,(1 / #Infos) * i)
							task.wait(duration)
						end
					end
				end)()
				
				Lib.FastWait(1.5)
				isInfoCD = false
			else
				coroutine.wrap(function()
					infoDexIntro.Close()
					infoDexIntro = nil
					
					Lib.FastWait(1.5)
					isInfoCD = false
				end)()
			end
		end)

		-- Create Main Apps
		Main.CreateApp({Name = "Explorer", IconMap = Main.LargeIcons, Icon = "Explorer", Open = true, Window = Explorer.Window})

		Main.CreateApp({Name = "Properties", IconMap = Main.LargeIcons, Icon = "Properties", Open = true, Window = Properties.Window})

		local cptsOnMouseClick = nil
		Main.CreateApp({Name = "Click part to select", IconMap = Main.LargeIcons, Icon = 6, OnClick = function(callback)
			if callback then
				local mouse = Main.Mouse
				cptsOnMouseClick = mouse.Button1Down:Connect(function()
					pcall(function()
						local object = mouse.Target
						if nodes[object] then
							selection:Set(nodes[object])
							Explorer.ViewNode(nodes[object])
						end
					end)
				end)
			else if cptsOnMouseClick ~= nil then cptsOnMouseClick:Disconnect() cptsOnMouseClick = nil end end
		end})

		Main.CreateApp({Name = "Notepad", IconMap = Main.LargeIcons, Icon = "Script_Viewer", Window = ScriptViewer.Window})
		
		Main.CreateApp({Name = "Console", IconMap = Main.LargeIcons, Icon = "Output", Window = Console.Window})
		
		Main.CreateApp({Name = "Save Instance", IconMap = Main.LargeIcons, Icon = "Watcher", Window = SaveInstance.Window})
		
		Main.CreateApp({Name = "3D Viewer", IconMap = Explorer.LegacyClassIcons, Icon = 54, Window = ModelViewer.Window})

		--Main.CreateApp({Name = "Secret Service Panel", IconMap = Main.LargeIcons, Icon = "Output", Window = SecretServicePanel.Window})


		Lib.ShowGui(gui)
	end

	Main.SetupFilesystem = function()
		if not env.writefile or not env.makefolder then return end

		local writefile,makefolder = env.writefile,env.makefolder

		makefolder("dex")
		makefolder("dex/assets")
		makefolder("dex/saved")
		makefolder("dex/plugins")
		makefolder("dex/ModuleCache")
	end

	Main.LocalDepsUpToDate = function()
		return Main.DepsVersionData and Main.ClientVersion == Main.DepsVersionData[1]
	end

	Main.Init = function()
		Main.Elevated = pcall(function() local a = game:GetService("CoreGui"):GetFullName() end)
		
		if writefile and isfile and not isfile("DexPlusPlusSettings.json") then
			writefile("DexPlusPlusSettings.json", Main.ExportSettings())
		end
		
		Main.InitEnv()
		Main.LoadSettings()
		
		Main.SetupFilesystem()

		-- Load Lib
		local intro = Main.CreateIntro("Initializing Library")
		Lib = Main.LoadModule("Lib")
		Lib.FastWait()

		-- Init other stuff
		Main.IncompatibleTest()

		-- Init icons
		Main.MiscIcons = Lib.IconMap.new("rbxassetid://6511490623",256,256,16,16)
		Main.MiscIcons:SetDict({
			Reference = 0,             Cut = 1,                         Cut_Disabled = 2,      Copy = 3,               Copy_Disabled = 4,    Paste = 5,                Paste_Disabled = 6,
			Delete = 7,                Delete_Disabled = 8,             Group = 9,             Group_Disabled = 10,    Ungroup = 11,         Ungroup_Disabled = 12,    TeleportTo = 13,
			Rename = 14,               JumpToParent = 15,               ExploreData = 16,      Save = 17,              CallFunction = 18,    CallRemote = 19,          Undo = 20,
			Undo_Disabled = 21,        Redo = 22,                       Redo_Disabled = 23,    Expand_Over = 24,       Expand = 25,          Collapse_Over = 26,       Collapse = 27,
			SelectChildren = 28,       SelectChildren_Disabled = 29,    InsertObject = 30,     ViewScript = 31,        AddStar = 32,         RemoveStar = 33,          Script_Disabled = 34,
			LocalScript_Disabled = 35, Play = 36,                       Pause = 37,            Rename_Disabled = 38,   Empty = 1000
		})
		Main.LargeIcons = Lib.IconMap.new("rbxassetid://6579106223",256,256,32,32)
		Main.LargeIcons:SetDict({
			Explorer = 0, Properties = 1, Script_Viewer = 2, Watcher = 3, Output = 4
		})
		
		--[[ Loading bypasses
		intro.SetProgress("Loading Adonis Bypass",0.1)
		pcall(Main.LoadAdonisBypass)
		
		intro.SetProgress("Loading GC Bypass",0.2)
		pcall(Main.LoadGCBypass)]]

		-- Fetch version if needed
		intro.SetProgress("Fetching Roblox Version",0.3)
		if Main.Elevated then
			local fileVer = Lib.ReadFile("dex/deps_version.dat")
			Main.ClientVersion = Version()
			if fileVer then
				Main.DepsVersionData = string.split(fileVer,"\n")
				if Main.LocalDepsUpToDate() then
					Main.RobloxVersion = Main.DepsVersionData[2]
				end
			end
			
			Main.RobloxVersion = Main.RobloxVersion or oldgame:HttpGet("https://clientsettings.roblox.com/v2/client-version/WindowsStudio64/channel/LIVE"):match("(version%-[%w]+)")
		end

		-- Fetch external deps
		intro.SetProgress("Fetching API",0.35)
		API = Main.FetchAPI(
			function()
				intro.SetProgress("Fetching API, Please Wait.",0.4)
			end,
			function()
				intro.SetProgress("Fetching API, Please Wait Due To Huge API File To Download.",0.45)
			end,
			function()
				intro.SetProgress("Fetching API, LOL STILL DOWNlOADING? bad wifi xD",0.475)
			end
		)
		Lib.FastWait()
		intro.SetProgress("Fetching RMD",0.5)
		RMD = Main.FetchRMD()
		Lib.FastWait()

		-- Save external deps locally if needed
		if Main.Elevated and env.writefile and not Main.LocalDepsUpToDate() then
			env.writefile("dex/deps_version.dat",Main.ClientVersion.."\n"..Main.RobloxVersion)
			env.writefile("dex/rbx_api.dat",Main.RawAPI)
			env.writefile("dex/rbx_rmd.dat",Main.RawRMD)
		end

		-- Load other modules
		intro.SetProgress("Loading Modules",0.75)
		Main.AppControls.Lib.InitDeps(Main.GetInitDeps()) -- Missing deps now available
		Main.LoadModules()
		Lib.FastWait()

		-- Init other modules
		intro.SetProgress("Initializing Modules",0.9)
		Explorer.Init()
		Properties.Init()
		ScriptViewer.Init()
		Console.Init()
		SaveInstance.Init()
		ModelViewer.Init()
		
		--SecretServicePanel.Init()
		
		Lib.FastWait()

		-- Done
		intro.SetProgress("Complete",1)
		coroutine.wrap(function()
			Lib.FastWait(1.25)
			intro.Close()
		end)()

		-- Init window system, create main menu, show explorer and properties
		Lib.Window.Init()
		Main.CreateMainGui()
		Explorer.Window:Show({Align = "right", Pos = 1, Size = 0.5, Silent = true})
		Properties.Window:Show({Align = "right", Pos = 2, Size = 0.5, Silent = true})
		
		Lib.DeferFunc(function() Lib.Window.ToggleSide("right") end)
	end

	return Main
end)()

-- Start
Main.Init()

--for i,v in pairs(Main.MissingEnv) do print(i,v) end

   end,
})



local Button = Tab:CreateButton({
   Name = "Game Dumper",
   Callback = function()

-- ============================================
-- COMPREHENSIVE ROBLOX GAME DUMPER + EXECUTOR ANALYZER
-- WITH GUI CONFIGURATION + CRASH-RESISTANT PROGRESSIVE DUMPING
-- ============================================

-- CONFIG
local file_name = "GameDump_FULL_Decompiled.txt"
local player_name = "USER"
local MAX_DEPTH = 50
local DUMP_PROTECTED = true

-- ============================================
-- GUI CONFIGURATION
-- ============================================

local config = {
    use_detailed_properties = false,
    dump_scripts = true,
    dump_hierarchy = true,
    analyze_executor = true,
    dump_nil_instances = true,
    decompile_scripts = true,
    performance_mode = "normal",
    fps_threshold = 30,  -- Wait for FPS to recover above this
}

-- Performance mode presets
local performance_presets = {
    fast = {
        delay_per_object = 0,
        delay_per_script = 0.01,
        update_interval = 100,
        delay_per_service = 0.02,
        fps_check = false
    },
    normal = {
        delay_per_object = 0.001,
        delay_per_script = 0.05,
        update_interval = 50,
        delay_per_service = 0.1,
        fps_check = true
    },
    safe = {
        delay_per_object = 0.005,
        delay_per_script = 0.1,
        update_interval = 25,
        delay_per_service = 0.2,
        fps_check = true
    },
    ultra_safe = {
        delay_per_object = 0.01,
        delay_per_script = 0.2,
        update_interval = 10,
        delay_per_service = 0.3,
        fps_check = true
    }
}

local function create_config_gui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "GameDumperConfig"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    if gethui then
        ScreenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = game:GetService("CoreGui")
    else
        ScreenGui.Parent = game:GetService("CoreGui")
    end
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
    MainFrame.BorderSizePixel = 2
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    MainFrame.Size = UDim2.new(0, 400, 0, 500)
    MainFrame.Active = true
    MainFrame.Draggable = true
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0, 40)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Game Dumper Configuration"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    
    -- Scroll Frame for options
    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Name = "ScrollFrame"
    ScrollFrame.Parent = MainFrame
    ScrollFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    ScrollFrame.BorderSizePixel = 0
    ScrollFrame.Position = UDim2.new(0, 10, 0, 50)
    ScrollFrame.Size = UDim2.new(1, -20, 1, -110)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollFrame.ScrollBarThickness = 6
    ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = ScrollFrame
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 8)
    
    local function create_option(name, description, config_key, warning)
        local OptionFrame = Instance.new("Frame")
        OptionFrame.Name = name
        OptionFrame.Parent = ScrollFrame
        OptionFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        OptionFrame.BorderSizePixel = 0
        OptionFrame.Size = UDim2.new(1, -10, 0, warning and 80 or 60)
        
        local Checkbox = Instance.new("TextButton")
        Checkbox.Name = "Checkbox"
        Checkbox.Parent = OptionFrame
        Checkbox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        Checkbox.BorderColor3 = Color3.fromRGB(70, 70, 70)
        Checkbox.BorderSizePixel = 2
        Checkbox.Position = UDim2.new(0, 10, 0, 10)
        Checkbox.Size = UDim2.new(0, 20, 0, 20)
        Checkbox.Font = Enum.Font.GothamBold
        Checkbox.Text = config[config_key] and "✓" or ""
        Checkbox.TextColor3 = Color3.fromRGB(0, 255, 0)
        Checkbox.TextSize = 16
        
        local OptionLabel = Instance.new("TextLabel")
        OptionLabel.Name = "OptionLabel"
        OptionLabel.Parent = OptionFrame
        OptionLabel.BackgroundTransparency = 1
        OptionLabel.Position = UDim2.new(0, 40, 0, 8)
        OptionLabel.Size = UDim2.new(1, -50, 0, 20)
        OptionLabel.Font = Enum.Font.GothamBold
        OptionLabel.Text = name
        OptionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptionLabel.TextSize = 14
        OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local DescLabel = Instance.new("TextLabel")
        DescLabel.Name = "DescLabel"
        DescLabel.Parent = OptionFrame
        DescLabel.BackgroundTransparency = 1
        DescLabel.Position = UDim2.new(0, 40, 0, 28)
        DescLabel.Size = UDim2.new(1, -50, 0, warning and 50 or 30)
        DescLabel.Font = Enum.Font.Gotham
        DescLabel.Text = description
        DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        DescLabel.TextSize = 11
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.TextYAlignment = Enum.TextYAlignment.Top
        DescLabel.TextWrapped = true
        
        if warning then
            local WarningLabel = Instance.new("TextLabel")
            WarningLabel.Name = "WarningLabel"
            WarningLabel.Parent = OptionFrame
            WarningLabel.BackgroundTransparency = 1
            WarningLabel.Position = UDim2.new(0, 40, 0, 55)
            WarningLabel.Size = UDim2.new(1, -50, 0, 20)
            WarningLabel.Font = Enum.Font.GothamBold
            WarningLabel.Text = "⚠️ " .. warning
            WarningLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
            WarningLabel.TextSize = 10
            WarningLabel.TextXAlignment = Enum.TextXAlignment.Left
        end
        
        Checkbox.MouseButton1Click:Connect(function()
            config[config_key] = not config[config_key]
            Checkbox.Text = config[config_key] and "✓" or ""
        end)
        
        return OptionFrame
    end
    
    local function create_performance_selector()
        local OptionFrame = Instance.new("Frame")
        OptionFrame.Name = "PerformanceMode"
        OptionFrame.Parent = ScrollFrame
        OptionFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        OptionFrame.BorderSizePixel = 0
        OptionFrame.Size = UDim2.new(1, -10, 0, 100)
        
        local OptionLabel = Instance.new("TextLabel")
        OptionLabel.Name = "OptionLabel"
        OptionLabel.Parent = OptionFrame
        OptionLabel.BackgroundTransparency = 1
        OptionLabel.Position = UDim2.new(0, 10, 0, 8)
        OptionLabel.Size = UDim2.new(1, -20, 0, 20)
        OptionLabel.Font = Enum.Font.GothamBold
        OptionLabel.Text = "Performance Mode (Anti-Crash)"
        OptionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptionLabel.TextSize = 14
        OptionLabel.TextXAlignment = Enum.TextXAlignment.Left
        
        local DescLabel = Instance.new("TextLabel")
        DescLabel.Name = "DescLabel"
        DescLabel.Parent = OptionFrame
        DescLabel.BackgroundTransparency = 1
        DescLabel.Position = UDim2.new(0, 10, 0, 28)
        DescLabel.Size = UDim2.new(1, -20, 0, 25)
        DescLabel.Font = Enum.Font.Gotham
        DescLabel.Text = "Waits for FPS recovery between scripts. Safe/Ultra Safe highly recommended!"
        DescLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
        DescLabel.TextSize = 11
        DescLabel.TextXAlignment = Enum.TextXAlignment.Left
        DescLabel.TextYAlignment = Enum.TextYAlignment.Top
        DescLabel.TextWrapped = true
        
        local modes = {"fast", "normal", "safe", "ultra_safe"}
        local mode_labels = {
            fast = "⚡ Fast",
            normal = "✓ Normal",
            safe = "🛡️ Safe",
            ultra_safe = "🐌 Ultra Safe"
        }
        
        local button_colors = {
            fast = Color3.fromRGB(255, 100, 100),
            normal = Color3.fromRGB(100, 170, 255),
            safe = Color3.fromRGB(100, 200, 100),
            ultra_safe = Color3.fromRGB(150, 100, 200)
        }
        
        for i, mode in ipairs(modes) do
            local ModeButton = Instance.new("TextButton")
            ModeButton.Name = mode
            ModeButton.Parent = OptionFrame
            ModeButton.BackgroundColor3 = config.performance_mode == mode and button_colors[mode] or Color3.fromRGB(45, 45, 45)
            ModeButton.BorderColor3 = Color3.fromRGB(70, 70, 70)
            ModeButton.BorderSizePixel = 2
            ModeButton.Position = UDim2.new((i-1) * 0.25, 5, 0, 55)
            ModeButton.Size = UDim2.new(0.25, -10, 0, 35)
            ModeButton.Font = Enum.Font.Gotham
            ModeButton.Text = mode_labels[mode]
            ModeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            ModeButton.TextSize = 10
            ModeButton.TextWrapped = true
            
            ModeButton.MouseButton1Click:Connect(function()
                config.performance_mode = mode
                
                for _, btn in ipairs(OptionFrame:GetChildren()) do
                    if btn:IsA("TextButton") and btn.Name ~= "Checkbox" then
                        local btn_mode = btn.Name
                        if btn_mode == mode then
                            btn.BackgroundColor3 = button_colors[btn_mode]
                        else
                            btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                        end
                    end
                end
            end)
        end
        
        return OptionFrame
    end
    
    create_performance_selector()
    
    create_option(
        "Detailed Properties (BGetPT)",
        "Use BGetPT to extract ALL properties (1000+ per object). May result in massive file sizes.",
        "use_detailed_properties",
        "WARNING: Can create 100MB+ files and may crash AI token limits!"
    )
    
    create_option(
        "Dump Scripts",
        "Extract and decompile all LocalScripts, ModuleScripts, and Scripts.",
        "dump_scripts"
    )
    
    create_option(
        "Dump Hierarchy",
        "Dump the complete game hierarchy with all objects.",
        "dump_hierarchy"
    )
    
    create_option(
        "Analyze Executor",
        "Test and report UNC function compatibility.",
        "analyze_executor"
    )
    
    create_option(
        "Dump Nil Instances",
        "Include nil instances in the dump.",
        "dump_nil_instances"
    )
    
    create_option(
        "Decompile Scripts",
        "Attempt to decompile protected scripts (requires decompile function).",
        "decompile_scripts"
    )
    
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    end)
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
    
    local StartButton = Instance.new("TextButton")
    StartButton.Name = "StartButton"
    StartButton.Parent = MainFrame
    StartButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    StartButton.BorderSizePixel = 0
    StartButton.Position = UDim2.new(0, 10, 1, -50)
    StartButton.Size = UDim2.new(0.5, -15, 0, 40)
    StartButton.Font = Enum.Font.GothamBold
    StartButton.Text = "START DUMP"
    StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    StartButton.TextSize = 16
    
    local CancelButton = Instance.new("TextButton")
    CancelButton.Name = "CancelButton"
    CancelButton.Parent = MainFrame
    CancelButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
    CancelButton.BorderSizePixel = 0
    CancelButton.Position = UDim2.new(0.5, 5, 1, -50)
    CancelButton.Size = UDim2.new(0.5, -15, 0, 40)
    CancelButton.Font = Enum.Font.GothamBold
    CancelButton.Text = "CANCEL"
    CancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CancelButton.TextSize = 16
    
    local waiting = true
    local start_dump = false
    
    StartButton.MouseButton1Click:Connect(function()
        start_dump = true
        waiting = false
    end)
    
    CancelButton.MouseButton1Click:Connect(function()
        start_dump = false
        waiting = false
    end)
    
    while waiting do
        task.wait()
    end
    
    ScreenGui:Destroy()
    
    return start_dump
end

-- ============================================
-- PROGRESS GUI WITH FPS MONITOR
-- ============================================

local ProgressGui = nil
local ProgressLabel = nil
local ProgressBar = nil
local StatusLabel = nil
local TimeLabel = nil
local FPSLabel = nil
local start_time = 0
local total_objects_estimate = 0

local function get_fps()
    local RunService = game:GetService("RunService")
    local fps = 0
    
    if RunService:IsRunning() then
        fps = math.floor(1 / RunService.RenderStepped:Wait())
    end
    
    return fps
end

local function wait_for_fps_recovery(threshold, perf_settings)
    if not perf_settings.fps_check then return end
    
    local current_fps = get_fps()
    local wait_count = 0
    local max_wait = 100  -- Maximum 10 seconds wait
    
    while current_fps < threshold and wait_count < max_wait do
        task.wait(0.1)
        current_fps = get_fps()
        wait_count = wait_count + 1
        
        if FPSLabel then
            FPSLabel.Text = string.format("FPS: %d (Waiting for %d+)", current_fps, threshold)
            FPSLabel.TextColor3 = current_fps < threshold and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(100, 255, 100)
        end
    end
end

local function create_progress_gui()
    ProgressGui = Instance.new("ScreenGui")
    ProgressGui.Name = "DumperProgress"
    ProgressGui.ResetOnSpawn = false
    ProgressGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    if gethui then
        ProgressGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ProgressGui)
        ProgressGui.Parent = game:GetService("CoreGui")
    else
        ProgressGui.Parent = game:GetService("CoreGui")
    end
    
    local Frame = Instance.new("Frame")
    Frame.Parent = ProgressGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.BorderColor3 = Color3.fromRGB(60, 60, 60)
    Frame.BorderSizePixel = 2
    Frame.Position = UDim2.new(0.5, -200, 0.5, -80)
    Frame.Size = UDim2.new(0, 400, 0, 160)
    
    local Title = Instance.new("TextLabel")
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Dumping Game..."
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14
    
    ProgressLabel = Instance.new("TextLabel")
    ProgressLabel.Parent = Frame
    ProgressLabel.BackgroundTransparency = 1
    ProgressLabel.Position = UDim2.new(0, 10, 0, 35)
    ProgressLabel.Size = UDim2.new(1, -20, 0, 20)
    ProgressLabel.Font = Enum.Font.Gotham
    ProgressLabel.Text = "Initializing..."
    ProgressLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    ProgressLabel.TextSize = 12
    ProgressLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local BarBackground = Instance.new("Frame")
    BarBackground.Parent = Frame
    BarBackground.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    BarBackground.BorderColor3 = Color3.fromRGB(60, 60, 60)
    BarBackground.BorderSizePixel = 1
    BarBackground.Position = UDim2.new(0, 10, 0, 60)
    BarBackground.Size = UDim2.new(1, -20, 0, 20)
    BarBackground.ClipsDescendants = true
    
    ProgressBar = Instance.new("Frame")
    ProgressBar.Parent = BarBackground
    ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    ProgressBar.BorderSizePixel = 0
    ProgressBar.Size = UDim2.new(0, 0, 1, 0)
    
    StatusLabel = Instance.new("TextLabel")
    StatusLabel.Parent = Frame
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 10, 0, 85)
    StatusLabel.Size = UDim2.new(1, -20, 0, 20)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Text = "Objects: 0 | Scripts: 0"
    StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    StatusLabel.TextSize = 11
    StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    FPSLabel = Instance.new("TextLabel")
    FPSLabel.Parent = Frame
    FPSLabel.BackgroundTransparency = 1
    FPSLabel.Position = UDim2.new(0, 10, 0, 105)
    FPSLabel.Size = UDim2.new(1, -20, 0, 20)
    FPSLabel.Font = Enum.Font.GothamBold
    FPSLabel.Text = "FPS: -- "
    FPSLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    FPSLabel.TextSize = 11
    FPSLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    TimeLabel = Instance.new("TextLabel")
    TimeLabel.Parent = Frame
    TimeLabel.BackgroundTransparency = 1
    TimeLabel.Position = UDim2.new(0, 10, 0, 130)
    TimeLabel.Size = UDim2.new(1, -20, 0, 20)
    TimeLabel.Font = Enum.Font.Gotham
    TimeLabel.Text = "Elapsed: 0s | ETA: Calculating..."
    TimeLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    TimeLabel.TextSize = 10
    TimeLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    start_time = tick()
    
    -- FPS updater
    task.spawn(function()
        while ProgressGui do
            if FPSLabel then
                local fps = get_fps()
                FPSLabel.Text = string.format("FPS: %d", fps)
                FPSLabel.TextColor3 = fps < 30 and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(100, 255, 100)
            end
            task.wait(0.5)
        end
    end)
end

local function update_progress(status, objects_done, scripts_done, service_current, service_total)
    if not ProgressGui then return end
    
    if objects_done > total_objects_estimate then
        total_objects_estimate = objects_done + 1000
    end
    
    local service_progress = 0
    if service_total > 0 then
        service_progress = (service_current / service_total) * 70
    end
    
    local base_progress = 20 + service_progress
    local display_progress = math.min(base_progress, 95)
    
    ProgressLabel.Text = string.format("%s", status)
    ProgressBar.Size = UDim2.new(display_progress / 100, 0, 1, 0)
    StatusLabel.Text = string.format("Objects: %d | Scripts: %d", objects_done or 0, scripts_done or 0)
    
    local elapsed = tick() - start_time
    local eta = "Calculating..."
    
    if service_current > 0 and service_current < service_total then
        local time_per_service = elapsed / service_current
        local remaining = service_total - service_current
        local eta_seconds = math.floor(time_per_service * remaining)
        
        if eta_seconds < 60 then
            eta = string.format("%ds", eta_seconds)
        elseif eta_seconds < 3600 then
            eta = string.format("%dm %ds", math.floor(eta_seconds / 60), eta_seconds % 60)
        else
            eta = string.format("%dh %dm", math.floor(eta_seconds / 3600), math.floor((eta_seconds % 3600) / 60))
        end
    end
    
    TimeLabel.Text = string.format("Elapsed: %ds | ETA: %s", math.floor(elapsed), eta)
end

local function set_progress_complete()
    if not ProgressGui then return end
    
    ProgressLabel.Text = "Complete!"
    ProgressBar.Size = UDim2.new(1, 0, 1, 0)
    ProgressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    
    local elapsed = tick() - start_time
    TimeLabel.Text = string.format("Completed in: %ds", math.floor(elapsed))
end

local function destroy_progress_gui()
    if ProgressGui then
        ProgressGui:Destroy()
        ProgressGui = nil
    end
end

-- ============================================
-- IMPROVED EXECUTOR ANALYSIS
-- ============================================

local function analyze_executor()
    print("\n" .. string.rep("=", 50))
    print("EXECUTOR ANALYSIS")
    print(string.rep("=", 50))
    
    local executor_info = {
        Name = "Unknown",
        Version = "Unknown",
        UNCScore = 0,
        UNCTotal = 0,
        UNCPercentage = 0,
        Functions = {},
        Categories = {}
    }
    
    -- Enhanced executor identification
    if identifyexecutor then
        local success, name, version = pcall(identifyexecutor)
        if success then
            executor_info.Name = tostring(name or "Unknown")
            executor_info.Version = tostring(version or "N/A")
        end
    end
    
    -- Fallback detection with more executors
    if executor_info.Name == "Unknown" then
        if KRNL_LOADED then
            executor_info.Name = "KRNL"
        elseif syn then
            executor_info.Name = "Synapse X"
        elseif SENTINEL_V2 then
            executor_info.Name = "Sentinel"
        elseif PROTOSMASHER_LOADED then
            executor_info.Name = "ProtoSmasher"
        elseif ELYSIAN_LOADED then
            executor_info.Name = "Elysian"
        elseif is_sirhurt_closure then
            executor_info.Name = "SirHurt"
        elseif Fluxus then
            executor_info.Name = "Fluxus"
        elseif getexecutorname then
            local s, n = pcall(getexecutorname)
            if s and n then executor_info.Name = n end
        end
    end
    
    print(string.format("\n[*] Executor: %s", executor_info.Name))
    print(string.format("[*] Version: %s", executor_info.Version))
    
    local unc_functions = {
        {category = "Cache", functions = {"cloneref", "compareinstances", "invalidate_cache", "cache.invalidate", "cache.iscached", "cache.replace"}},
        {category = "Closures", functions = {"checkcaller", "clonefunction", "getcallingscript", "getscriptclosure", "hookfunction", "iscclosure", "islclosure", "isexecutorclosure", "loadstring", "newcclosure", "replaceclosure"}},
        {category = "Console", functions = {"rconsoleclear", "rconsolecreate", "rconsoledestroy", "rconsoleinput", "rconsoleprint", "rconsolesettitle", "rconsolename", "printconsole"}},
        {category = "Crypt", functions = {"crypt.base64encode", "crypt.base64decode", "crypt.base64.encode", "crypt.base64.decode", "crypt.encrypt", "crypt.decrypt", "crypt.generatebytes", "crypt.generatekey", "crypt.hash", "base64_encode", "base64_decode"}},
        {category = "Debug", functions = {"debug.getconstant", "debug.getconstants", "debug.getinfo", "debug.getproto", "debug.getprotos", "debug.getstack", "debug.getupvalue", "debug.getupvalues", "debug.setconstant", "debug.setstack", "debug.setupvalue"}},
        {category = "Filesystem", functions = {"readfile", "listfiles", "writefile", "makefolder", "appendfile", "isfile", "isfolder", "delfile", "delfolder", "loadfile", "dofile"}},
        {category = "Input", functions = {"isrbxactive", "mouse1click", "mouse1press", "mouse1release", "mouse2click", "mouse2press", "mouse2release", "mousemoveabs", "mousemoverel", "mousescroll"}},
        {category = "Instances", functions = {"fireclickdetector", "getcallbackvalue", "getconnections", "gethiddenproperty", "gethui", "getinstances", "getnilinstances", "isscriptable", "setscriptable", "sethiddenproperty", "setsimulationradius", "firetouchinterest", "fireproximityprompt"}},
        {category = "Metatable", functions = {"getrawmetatable", "hookmetamethod", "getnamecallmethod", "isreadonly", "setrawmetatable", "setreadonly"}},
        {category = "Miscellaneous", functions = {"identifyexecutor", "getexecutorname", "lz4compress", "lz4decompress", "messagebox", "queue_on_teleport", "queueonteleport", "request", "setclipboard", "setfpscap", "getfpscap"}},
        {category = "Scripts", functions = {"getgc", "getgenv", "getloadedmodules", "getrenv", "getrunningscripts", "getscriptbytecode", "getscripthash", "getscripts", "getsenv"}},
        {category = "Drawing", functions = {"Drawing.new", "Drawing.Fonts", "isrenderobj", "getrenderproperty", "setrenderproperty", "cleardrawcache"}},
        {category = "WebSocket", functions = {"WebSocket.connect", "websocket.connect"}},
        {category = "Decompiler", functions = {"decompile", "disassemble"}},
        {category = "Hooking", functions = {"hookfunction", "hookmetamethod", "replaceclosure"}}
    }
    
    print("\n[*] Testing UNC functions...\n")
    
    local total_functions = 0
    local supported_functions = 0
    
    for _, category_data in ipairs(unc_functions) do
        local category_name = category_data.category
        local category_supported = 0
        local category_total = 0
        local category_functions = {}
        
        print(string.format("--- %s ---", category_name))
        
        for _, func_name in ipairs(category_data.functions) do
            category_total = category_total + 1
            total_functions = total_functions + 1
            
            -- Try multiple ways to check function existence
            local func = _G
            local found = false
            
            -- Method 1: Navigate nested tables
            local parts = {}
            for part in func_name:gmatch("[^.]+") do
                table.insert(parts, part)
            end
            
            for _, part in ipairs(parts) do
                if type(func) == "table" and func[part] then
                    func = func[part]
                else
                    func = nil
                    break
                end
            end
            
            if func and (type(func) == "function" or type(func) == "table") then
                found = true
            end
            
            -- Method 2: Direct global check
            if not found and _G[func_name] then
                found = true
            end
            
            -- Method 3: Try calling it in pcall
            if not found then
                local success = pcall(function()
                    local test = loadstring("return " .. func_name)
                    if test then
                        local result = test()
                        if result then
                            found = true
                        end
                    end
                end)
            end
            
            if found then
                category_supported = category_supported + 1
                supported_functions = supported_functions + 1
                print(string.format("  [✓] %s", func_name))
                table.insert(category_functions, {name = func_name, supported = true})
            else
                print(string.format("  [✗] %s", func_name))
                table.insert(category_functions, {name = func_name, supported = false})
            end
        end
        
        local category_percent = math.floor((category_supported / category_total) * 100)
        print(string.format("  Category Score: %d/%d (%.1f%%)\n", 
            category_supported, category_total, category_percent))
        
        table.insert(executor_info.Categories, {
            name = category_name,
            supported = category_supported,
            total = category_total,
            percentage = category_percent,
            functions = category_functions
        })
    end
    
    executor_info.UNCScore = supported_functions
    executor_info.UNCTotal = total_functions
    executor_info.UNCPercentage = math.floor((supported_functions / total_functions) * 100)
    
    print(string.rep("=", 50))
    print(string.format("FINAL UNC SCORE: %d/%d (%.1f%%)", 
        supported_functions, total_functions, executor_info.UNCPercentage))
    print("[!] NOTE: Score may show 0%% if executor uses non-standard function naming")
    print(string.rep("=", 50))
    
    return executor_info
end

-- ============================================
-- HELPER FUNCTIONS
-- ============================================

local function safe_get_service(service_name)
    local success, result = pcall(function()
        return game:GetService(service_name)
    end)
    return success and result or nil
end

local function safe_get_property(obj, prop)
    local success, result = pcall(function()
        return obj[prop]
    end)
    return success and result or nil
end

local function get_path(obj)
    if not obj then return "nil" end
    
    local path = {}
    local current = obj
    local depth = 0
    
    while current and current ~= game and depth < MAX_DEPTH do
        local name = safe_get_property(current, "Name") or "Unknown"
        table.insert(path, 1, name)
        current = safe_get_property(current, "Parent")
        depth = depth + 1
    end
    
    if #path > 0 then
        return "game." .. table.concat(path, ".")
    else
        return tostring(obj)
    end
end

local function get_source(script, perf_settings)
    if not config.decompile_scripts then
        return "--[[ Script decompilation disabled in config ]]--"
    end
    
    -- Wait for FPS recovery before heavy decompilation
    wait_for_fps_recovery(config.fps_threshold, perf_settings)
    
    local source = safe_get_property(script, "Source")
    if source and #source > 0 then
        return source
    end
    
    if decompile then
        local success, result = pcall(function()
            return decompile(script)
        end)
        
        if success and result then
            return result
        end
    end
    
    return "--[[ PROTECTED/EMPTY SCRIPT ]]--"
end

local function get_nil_instances()
    if not config.dump_nil_instances then
        return {}
    end
    
    if getnilinstances then
        local success, result = pcall(getnilinstances)
        if success then return result end
    end
    return {}
end

local function dump_properties(obj)
    if config.use_detailed_properties and BGetPT then
        local props = BGetPT(obj)
        local prop_strings = {}
        
        local count = 0
        for _ in pairs(props) do count = count + 1 end
        
        table.insert(prop_strings, string.format("  [BGetPT: %d properties]", count))
        
        for prop_name, value in pairs(props) do
            local val_str = tostring(value)
            if #val_str > 100 then
                val_str = val_str:sub(1, 100) .. "..."
            end
            table.insert(prop_strings, string.format("  %s = %s", prop_name, val_str))
        end
        
        return table.concat(prop_strings, "\n")
    else
        local props = {}
        local common_props = {
            "ClassName", "Name", "Parent", "Archivable", 
            "Value", "Text", "Enabled", "Visible"
        }
        
        for _, prop_name in ipairs(common_props) do
            local val = safe_get_property(obj, prop_name)
            if val ~= nil then
                local val_str = tostring(val)
                if #val_str > 100 then
                    val_str = val_str:sub(1, 100) .. "..."
                end
                table.insert(props, string.format("  %s = %s", prop_name, val_str))
            end
        end
        
        return table.concat(props, "\n")
    end
end

-- ============================================
-- SERVICE COLLECTION
-- ============================================

local function collect_all_services()
    local services = {}
    
    local service_list = {
        "Workspace", "Players", "Lighting", "ReplicatedStorage", "ReplicatedFirst",
        "StarterGui", "StarterPack", "StarterPlayer", "Teams", "SoundService",
        "Chat", "TextChatService", "LocalizationService", "VoiceChatService", "TestService",
        "CoreGui", "CorePackages", "MaterialService", "NetworkClient", "VRService",
        "RunService", "UserInputService", "ContextActionService", "TweenService",
        "CollectionService", "HttpService", "MarketplaceService", "TeleportService",
        "BadgeService", "GamePassService", "GroupService", "PhysicsService"
    }
    
    print("\n[*] Collecting services...")
    
    for _, service_name in ipairs(service_list) do
        local service = safe_get_service(service_name)
        if service then
            services[service_name] = service
            print(string.format("[+] Found: %s", service_name))
        end
    end
    
    print("[*] Searching nil instances...")
    for _, obj in ipairs(get_nil_instances()) do
        local name = safe_get_property(obj, "Name") or "UnknownNil"
        local class = safe_get_property(obj, "ClassName") or "Unknown"
        local key = string.format("NilInstance_%s_%s", class, name)
        services[key] = obj
        print(string.format("[+] Found nil instance: %s (%s)", name, class))
    end
    
    return services
end

-- ============================================
-- CRASH-RESISTANT DUMPING LOGIC
-- ============================================

local object_counter = 0
local script_counter = 0

local function dump_descendants(obj, prefix, hierarchy_dump, scripts_dump, visited, depth, perf_settings, service_current, service_total)
    if depth > MAX_DEPTH then return end
    if not obj then return end
    if visited[obj] then return end
    
    visited[obj] = true
    
    local success, descendants = pcall(function()
        return obj:GetDescendants()
    end)
    
    if not success then
        if config.dump_hierarchy then
            table.insert(hierarchy_dump, string.format("%s[PROTECTED - Cannot access descendants]", prefix))
        end
        return
    end
    
    for i, descendant in ipairs(descendants) do
        if visited[descendant] then continue end
        visited[descendant] = true
        
        object_counter = object_counter + 1
        
        if object_counter % perf_settings.update_interval == 0 then
            task.wait(perf_settings.delay_per_object)
            update_progress("Processing objects...", object_counter, script_counter, service_current, service_total)
        end
        
        local path = get_path(descendant)
        local class = safe_get_property(descendant, "ClassName") or "Unknown"
        
        if config.dump_hierarchy then
            table.insert(hierarchy_dump, string.format("%s | %s", path, class))
        end
        
        if config.dump_scripts and (descendant:IsA("LocalScript") or descendant:IsA("ModuleScript") or descendant:IsA("Script")) then
            script_counter = script_counter + 1
            
            update_progress(string.format("Decompiling script %d...", script_counter), object_counter, script_counter, service_current, service_total)
            
            -- Individual script delay with FPS check
            task.wait(perf_settings.delay_per_script)
            
            local source = get_source(descendant, perf_settings)
            
            table.insert(scripts_dump, {
                Path = path,
                Class = class,
                Source = source,
                Properties = dump_properties(descendant)
            })
            
            -- Extra wait after decompilation
            wait_for_fps_recovery(config.fps_threshold, perf_settings)
        end
    end
end

-- ============================================
-- FORMAT EXECUTOR REPORT
-- ============================================

local function format_executor_report(executor_info)
    local report = {
        "\n-- ============================================",
        "-- EXECUTOR ANALYSIS REPORT",
        "-- ============================================\n",
        string.format("Executor Name: %s", executor_info.Name),
        string.format("Executor Version: %s", executor_info.Version),
        string.format("\nUNC COMPATIBILITY SCORE: %d/%d (%.1f%%)", 
            executor_info.UNCScore, executor_info.UNCTotal, executor_info.UNCPercentage),
        "NOTE: Score may show 0% if executor uses non-standard function naming",
        "\n-- Function Categories --\n"
    }
    
    for _, category in ipairs(executor_info.Categories) do
        table.insert(report, string.format("\n%s: %d/%d (%.1f%%)", 
            category.name, category.supported, category.total, category.percentage))
        
        for _, func in ipairs(category.functions) do
            local status = func.supported and "[✓]" or "[✗]"
            table.insert(report, string.format("  %s %s", status, func.name))
        end
    end
    
    table.insert(report, "\n-- ============================================\n")
    
    return table.concat(report, "\n")
end

-- ============================================
-- MAIN EXECUTION
-- ============================================

print(string.rep("=", 50))
print("COMPREHENSIVE ROBLOX GAME DUMPER")
print("CRASH-RESISTANT EDITION")
print(string.rep("=", 50))

if not BGetPT then
    warn("\n[!] BGetPT not found!")
    warn("[!] For detailed property dumps, please execute the BGetPT script first.")
    warn("[!] Continuing with basic property dump...\n")
    config.use_detailed_properties = false
end

local should_start = create_config_gui()

if not should_start then
    print("\n[!] Dump cancelled by user.")
    return
end

local perf_settings = performance_presets[config.performance_mode]

print("\n[*] Starting dump with CRASH-RESISTANT configuration:")
print(string.format("  - Performance Mode: %s", config.performance_mode:upper()))
print(string.format("    • FPS Monitoring: %s", perf_settings.fps_check and "ENABLED" or "DISABLED"))
print(string.format("    • Delay per script: %.3fs", perf_settings.delay_per_script))
print(string.format("  - Detailed Properties (BGetPT): %s", config.use_detailed_properties and "YES" or "NO"))
print(string.format("  - Dump Scripts: %s", config.dump_scripts and "YES" or "NO"))

create_progress_gui()

local executor_info
if config.analyze_executor then
    update_progress("Analyzing executor...", 0, 0, 0, 1)
    executor_info = analyze_executor()
else
    executor_info = {
        Name = "Analysis Skipped",
        Version = "N/A",
        UNCScore = 0,
        UNCTotal = 0,
        UNCPercentage = 0,
        Categories = {}
    }
end

local lp = game:GetService("Players").LocalPlayer
local old_name = lp.Name
lp.Name = player_name

local hierarchy_dump = {}
local scripts_dump = {}
local visited = {}

update_progress("Collecting services...", 0, 0, 0, 1)

local all_services = collect_all_services()

local service_count = 0
for _ in pairs(all_services) do
    service_count = service_count + 1
end

print(string.format("\n[*] Total services/objects found: %d", service_count))
print("[*] Beginning CRASH-RESISTANT deep scan...\n")

total_objects_estimate = 10000

local service_index = 0
for service_name, service in pairs(all_services) do
    service_index = service_index + 1
    
    update_progress(string.format("Dumping: %s", service_name), object_counter, script_counter, service_index, service_count)
    
    print(string.format("[*] Dumping: %s (%d/%d)", service_name, service_index, service_count))
    
    local path = get_path(service)
    local class = safe_get_property(service, "ClassName") or "Unknown"
    
    if config.dump_hierarchy then
        table.insert(hierarchy_dump, string.format("\n--- %s ---", service_name))
        table.insert(hierarchy_dump, string.format("%s | %s", path, class))
        table.insert(hierarchy_dump, dump_properties(service))
    end
    
    dump_descendants(service, path, hierarchy_dump, scripts_dump, visited, 0, perf_settings, service_index, service_count)
    
    task.wait(perf_settings.delay_per_service)
    wait_for_fps_recovery(config.fps_threshold, perf_settings)
end

update_progress("Building output file...", object_counter, script_counter, service_count, service_count)

print("\n[*] Scan complete. Building output file...")

-- ============================================
-- BUILD OUTPUT
-- ============================================

local final_dump = {
    "-- ============================================",
    "-- COMPREHENSIVE ROBLOX GAME DUMP + EXECUTOR ANALYSIS",
    "-- CRASH-RESISTANT EDITION",
    "-- ============================================",
    string.format("-- User: %s (Original: %s)", player_name, old_name),
    string.format("-- Timestamp: %s UTC", os.date("!%Y-%m-%d %H:%M:%S")),
    string.format("-- Executor: %s v%s", executor_info.Name, executor_info.Version),
    string.format("-- UNC Score: %d/%d (%.1f%%) - NOTE: May show 0%% if non-standard naming", 
        executor_info.UNCScore, executor_info.UNCTotal, executor_info.UNCPercentage),
    string.format("-- Services Dumped: %d", service_count),
    string.format("-- Total Objects: %d", object_counter),
    string.format("-- Scripts Found: %d", script_counter),
    string.format("-- Property Mode: %s", config.use_detailed_properties and "BGetPT (Detailed)" or "Basic"),
    string.format("-- Performance Mode: %s (FPS Monitoring: %s)", config.performance_mode:upper(), perf_settings.fps_check and "ON" or "OFF"),
}

if config.analyze_executor then
    table.insert(final_dump, format_executor_report(executor_info))
end

if config.dump_hierarchy then
    table.insert(final_dump, "\n-- ============================================")
    table.insert(final_dump, "-- HIERARCHY & PROPERTIES")
    table.insert(final_dump, "-- ============================================\n")
    table.insert(final_dump, table.concat(hierarchy_dump, "\n"))
end

if config.dump_scripts then
    table.insert(final_dump, "\n\n-- ============================================")
    table.insert(final_dump, "-- SCRIPTS (All Types)")
    table.insert(final_dump, "-- ============================================\n")
    
    for _, data in ipairs(scripts_dump) do
        table.insert(final_dump, string.format(
            "-- ============================================\n" ..
            "-- Path: %s\n" ..
            "-- Class: %s\n" ..
            "-- Properties:\n%s\n" ..
            "-- ============================================\n" ..
            "--[[ SOURCE ]]\n\n%s\n\n--[[ END SOURCE ]]\n\n",
            data.Path,
            data.Class,
            data.Properties,
            data.Source
        ))
    end
end

local full_output = table.concat(final_dump, "\n")

update_progress("Saving file...", object_counter, script_counter, service_count, service_count)

-- ============================================
-- SAVE OUTPUT
-- ============================================

local success = false

if writefile then
    local write_success, err = pcall(function()
        writefile(file_name, full_output)
    end)
    
    if write_success then
        print(string.format("\n[✓] SUCCESS! Saved to '%s'", file_name))
        print(string.format("[✓] File size: ~%d KB", #full_output / 1024))
        success = true
    else
        warn(string.format("[!] Write failed: %s", tostring(err)))
    end
end

if not success and setclipboard then
    if #full_output > 5000000 then
        warn("\n[!] Output too large for clipboard!")
    else
        pcall(function()
            setclipboard(full_output)
            print("\n[✓] Copied to clipboard!")
            success = true
        end)
    end
end

set_progress_complete()
task.wait(3)
destroy_progress_gui()

print("\n" .. string.rep("=", 50))
print("DUMP COMPLETE - NO CRASHES!")
print(string.rep("=", 50))
print(string.format("\nFINAL STATS:"))
print(string.format("  Executor: %s (UNC: %.1f%%)", executor_info.Name, executor_info.UNCPercentage))
print(string.format("  Objects: %d | Scripts: %d", object_counter, script_counter))
print(string.format("  Mode: %s", config.performance_mode:upper()))
print(string.rep("=", 50))

   end,
})

local Button = Tab:CreateButton({
   Name = "BGetPT(Better getproperties) (wesd)",
   Callback = function()

-- better getproperties
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local success, rawList = pcall(function()
    return game:HttpGet("https://pastebin.com/raw/nAYM5VwM")
end)

if not success then
    return
end

local PropertyDatabase = {}

for line in rawList:gmatch("[^\r\n]+") do
    local className, propName = line:match("^([^%.]+)%.(.+)$")
    
    if className and propName then
        if not PropertyDatabase[className] then
            PropertyDatabase[className] = {}
        end
        table.insert(PropertyDatabase[className], propName)
    end
end

getgenv().BGetPT = function(instance)
    if typeof(instance) ~= "Instance" then
        return {}
    end

    local results = {}
    local seenProperties = {}

    for className, properties in pairs(PropertyDatabase) do
        if instance:IsA(className) then
            for _, propName in ipairs(properties) do
                if not seenProperties[propName] then
                    seenProperties[propName] = true
                    
                    local isSuccess, value = pcall(function()
                        return instance[propName]
                    end)
                    
                    if isSuccess then
                        results[propName] = value
                    end
                end
            end
        end
    end

    return results
end

   end,
})

local Button = Tab:CreateButton({
   Name = "FE goon(Gazer)",
   Callback = function()

local Players, CoreGui, RunService = game:GetService("Players"), game:GetService("CoreGui"), game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://81521372155417"
local track = humanoid:LoadAnimation(animation)

local screenGui = Instance.new("ScreenGui", CoreGui)
screenGui.Name = "Fe Goner R15 (Very Evil)"

local toggleButton = Instance.new("TextButton", screenGui)
toggleButton.Size, toggleButton.Position = UDim2.new(0,150,0,50), UDim2.new(0.5,-75,0.5,-25)
toggleButton.BackgroundColor3, toggleButton.TextColor3 = Color3.fromRGB(50,50,50), Color3.new(1,1,1)
toggleButton.Text, toggleButton.Draggable, toggleButton.Active = "GOON", true, true

local toggled, loopConnection = false

toggleButton.MouseButton1Click:Connect(function()
    toggled = not toggled
    
    if toggled then
        track:Play()
        track.TimePosition = track.Length * 0.40
        task.wait((track.Length * 0.50 - track.Length * 0.40) / track.Speed)
        
        track.TimePosition = track.Length * 0.50
        local forward = true
        
        loopConnection = RunService.RenderStepped:Connect(function(dt)
            if not toggled then return end
            if forward then
                track.TimePosition = track.TimePosition + dt
                if track.TimePosition >= track.Length * 0.53 then
                    forward = false
                    track.TimePosition = track.Length * 0.53
                    track:AdjustSpeed(-1)
                end
            else
                track.TimePosition = track.TimePosition - dt
                if track.TimePosition <= track.Length * 0.50 then
                    forward = true
                    track.TimePosition = track.Length * 0.50
                    track:AdjustSpeed(1)
                end
            end
        end)
    else
        if loopConnection then loopConnection:Disconnect() loopConnection = nil end
        track.TimePosition = track.Length * 0.50
        track:AdjustSpeed(-1)
        task.wait((track.Length * 0.50 - track.Length * 0.40) / math.abs(track.Speed))
        track:Stop()
    end
end)

   end,
})

local Button = Tab:CreateButton({
   Name = "FE Fly others",
   Callback = function()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local Fly = {}
Fly.__index = Fly

function Fly.new()
    local self = setmetatable({}, Fly)
    
    self.Speed = 50
    self.Smoothness = 0.1
    self.Offset = -3.5
    
    self.Active = false
    self.NoclipEnabled = false  
    self.Target = nil
    self.Inputs = {Fwd=false, Bwd=false, Left=false, Right=false, Up=false, Down=false}
    self.Velocity = Vector3.new(0,0,0)
    
    self.BodyVel = nil
    self.BodyGyro = nil
    self.NoclipConnection = nil
    self.VisualField = nil
    
    self.Gui = self:CreateUI()
    self:SetupKeyboardControls()
    self:Events()
    
    return self
end

-- VISUALS: Glowing force field
function Fly:ToggleVisuals(enabled)
    if self.VisualField then 
        self.VisualField:Destroy() 
        self.VisualField = nil
    end

    if enabled then
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            local ff = Instance.new("Part")
            ff.Name = "GhostField"
            ff.Shape = Enum.PartType.Ball
            ff.Size = Vector3.new(9, 9, 9) 
            ff.Material = Enum.Material.ForceField
            ff.Color = Color3.fromRGB(0, 255, 255) 
            ff.Transparency = 0
            ff.CanCollide = false
            ff.Massless = true
            ff.CastShadow = false
            ff.Parent = char

            local weld = Instance.new("WeldConstraint")
            weld.Part0 = root
            weld.Part1 = ff
            weld.Parent = ff
            
            self.VisualField = ff
        end
    end
end

function Fly:HandleNoclip()
    if self.NoclipConnection then self.NoclipConnection:Disconnect() end

    self.NoclipConnection = RunService.Stepped:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local shouldNoclip = self.NoclipEnabled and self.Active

        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") and p.Name ~= "GhostField" then 
                p.CanCollide = not shouldNoclip
            end
        end

        local parts = Workspace:GetPartBoundsInRadius(root.Position, 50)
        for _, part in pairs(parts) do
            if part:IsA("BasePart") and not part:IsDescendantOf(char) then
                local isPlayer = false
                for _, pl in pairs(Players:GetPlayers()) do
                    if pl.Character and part:IsDescendantOf(pl.Character) then
                        isPlayer = true
                        break
                    end
                end
                part.CanCollide = not (shouldNoclip and not isPlayer)
            end
        end
    end)
end

function Fly:Start(target)
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local hum = char:FindFirstChild("Humanoid")
    
    if root and hum and target.Character then
        self.Active = true
        self.Target = target
        
        hum.PlatformStand = true
        
        self.BodyGyro = Instance.new("BodyGyro")
        self.BodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        self.BodyGyro.P = 20000
        self.BodyGyro.Parent = root
        
        self.BodyVel = Instance.new("BodyVelocity")
        self.BodyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        self.BodyVel.Velocity = Vector3.new(0,0,0)
        self.BodyVel.Parent = root
        
        self:ToggleVisuals(true)
        self:HandleNoclip() 
        
        task.spawn(function()
            if target.Character:FindFirstChild("HumanoidRootPart") then
                root.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, self.Offset, 0)
            end
        end)
    end
end

function Fly:Fix()
    if not self.Active or not self.Target then return end
    local char = LocalPlayer.Character
    local tChar = self.Target.Character
    
    if char and tChar and tChar:FindFirstChild("HumanoidRootPart") then
        local root = char:FindFirstChild("HumanoidRootPart")
        root.CFrame = tChar.HumanoidRootPart.CFrame * CFrame.new(0, self.Offset, 0)
        
        task.spawn(function()
            self.FixBtn.Text = "DONE!"
            task.wait(0.8)
            self.FixBtn.Text = "RECENTER"
        end)
    end
end

function Fly:Stop()
    self.Active = false
    self.Target = nil
    
    if self.NoclipConnection then 
        self.NoclipConnection:Disconnect() 
        self.NoclipConnection = nil
    end
    
    if self.BodyVel then self.BodyVel:Destroy() end
    if self.BodyGyro then self.BodyGyro:Destroy() end
    
    self:ToggleVisuals(false)
    
    local char = LocalPlayer.Character
    if char then
        local root = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChild("Humanoid")
        
        if hum then 
            hum.PlatformStand = false 
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        
        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then p.CanCollide = true end
        end
    end
end

function Fly:Update()
    if not self.Active or not self.BodyVel or not self.BodyGyro then return end
    
    local cf = Camera.CFrame
    local dir = Vector3.new(0,0,0)
    
    local flatLook = (cf.LookVector * Vector3.new(1,0,1)).Unit
    local flatRight = (cf.RightVector * Vector3.new(1,0,1)).Unit
    
    if self.Inputs.Fwd then dir = dir + flatLook end
    if self.Inputs.Bwd then dir = dir - flatLook end
    if self.Inputs.Left then dir = dir - flatRight end
    if self.Inputs.Right then dir = dir + flatRight end
    if self.Inputs.Up then dir = dir + Vector3.new(0,1,0) end
    if self.Inputs.Down then dir = dir - Vector3.new(0,1,0) end
    
    if dir.Magnitude > 0 then
        dir = dir.Unit * self.Speed
    end
    
    self.Velocity = self.Velocity:Lerp(dir, self.Smoothness)
    self.BodyVel.Velocity = self.Velocity
    
    local _, y, _ = cf:ToEulerAnglesYXZ()
    self.BodyGyro.CFrame = CFrame.Angles(0, y, 0) * CFrame.Angles(math.rad(-90), 0, 0)
end

function Fly:SetupKeyboardControls()
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if not self.Active then return end
        
        if input.KeyCode == Enum.KeyCode.W then self.Inputs.Fwd = true
        elseif input.KeyCode == Enum.KeyCode.S then self.Inputs.Bwd = true
        elseif input.KeyCode == Enum.KeyCode.A then self.Inputs.Left = true
        elseif input.KeyCode == Enum.KeyCode.D then self.Inputs.Right = true
        elseif input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.E then self.Inputs.Up = true
        elseif input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.Q then self.Inputs.Down = true
        end
    end)
    
    UserInputService.InputEnded:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if not self.Active then return end
        
        if input.KeyCode == Enum.KeyCode.W then self.Inputs.Fwd = false
        elseif input.KeyCode == Enum.KeyCode.S then self.Inputs.Bwd = false
        elseif input.KeyCode == Enum.KeyCode.A then self.Inputs.Left = false
        elseif input.KeyCode == Enum.KeyCode.D then self.Inputs.Right = false
        elseif input.KeyCode == Enum.KeyCode.Space or input.KeyCode == Enum.KeyCode.E then self.Inputs.Up = false
        elseif input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.Q then self.Inputs.Down = false
        end
    end)
end

function Fly:Events()
    RunService.RenderStepped:Connect(function() self:Update() end)
    
    local function Find(txt)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and (string.sub(string.lower(p.Name), 1, #txt) == string.lower(txt) or string.sub(string.lower(p.DisplayName), 1, #txt) == string.lower(txt)) then
                return p
            end
        end
    end
    
    self.MainBtn.MouseButton1Click:Connect(function()
        if self.Active then
            self:Stop()
            self.MainBtn.Text = "START"
            self.MainBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        else
            local t = Find(self.Box.Text)
            if t then
                self:Start(t)
                self.MainBtn.Text = "STOP"
                self.MainBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            else
                self.MainBtn.Text = "INVALID"
                task.wait(0.5)
                self.MainBtn.Text = "START"
            end
        end
    end)
    
    self.FixBtn.MouseButton1Click:Connect(function() self:Fix() end)

    -- SPEED TEXTBOX LOGIC
    self.SpeedBtn.FocusLost:Connect(function(enterPressed)
        local val = tonumber(self.SpeedBtn.Text)
        if val then
            self.Speed = val
            self.SpeedBtn.Text = tostring(val)
        else
            self.SpeedBtn.Text = tostring(self.Speed) -- Revert if not a number
        end
    end)
    
    self.NoclipBtn.MouseButton1Click:Connect(function()
        self.NoclipEnabled = not self.NoclipEnabled
        if self.NoclipEnabled then
            self.NoclipBtn.Text = "NOCLIP: ON"
            self.NoclipBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
        else
            self.NoclipBtn.Text = "NOCLIP: OFF"
            self.NoclipBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        end
        self:HandleNoclip()
    end)
    
    LocalPlayer.CharacterAdded:Connect(function() self:Stop() end)
end

function Fly:CreateUI()
    if LocalPlayer.PlayerGui:FindFirstChild("FlyInterface") then LocalPlayer.PlayerGui.FlyInterface:Destroy() end
    
    local Gui = Instance.new("ScreenGui")
    Gui.Name = "FlyInterface"
    Gui.ResetOnSpawn = false
    Gui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    local Main = Instance.new("Frame")
    Main.Size = UDim2.new(0, 200, 0, 280)
    Main.Position = UDim2.new(0.05, 0, 0.3, 0)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.BorderSizePixel = 2
    Main.BorderColor3 = Color3.fromRGB(60, 60, 60)
    Main.Active = true
    Main.Draggable = true
    Main.Parent = Gui
    
    local Title = Instance.new("TextLabel")
    Title.Text = "PC FLY"
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title.TextColor3 = Color3.fromRGB(200, 200, 200)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 14
    Title.Parent = Main
    
    self.Box = Instance.new("TextBox")
    self.Box.Size = UDim2.new(0.9, 0, 0, 30)
    self.Box.Position = UDim2.new(0.05, 0, 0.12, 0)
    self.Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    self.Box.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.Box.PlaceholderText = "Target Name"
    self.Box.Parent = Main
    
    self.MainBtn = Instance.new("TextButton")
    self.MainBtn.Text = "START"
    self.MainBtn.Size = UDim2.new(0.9, 0, 0, 35)
    self.MainBtn.Position = UDim2.new(0.05, 0, 0.24, 0)
    self.MainBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    self.MainBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.MainBtn.Font = Enum.Font.SourceSansBold
    self.MainBtn.TextSize = 18
    self.MainBtn.Parent = Main
    
    self.FixBtn = Instance.new("TextButton")
    self.FixBtn.Text = "RECENTER"
    self.FixBtn.Size = UDim2.new(0.9, 0, 0, 30)
    self.FixBtn.Position = UDim2.new(0.05, 0, 0.38, 0)
    self.FixBtn.BackgroundColor3 = Color3.fromRGB(180, 100, 0)
    self.FixBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.FixBtn.Font = Enum.Font.SourceSansBold
    self.FixBtn.Parent = Main
    
    self.NoclipBtn = Instance.new("TextButton")
    self.NoclipBtn.Text = "NOCLIP: OFF"
    self.NoclipBtn.Size = UDim2.new(0.9, 0, 0, 30)
    self.NoclipBtn.Position = UDim2.new(0.05, 0, 0.50, 0)
    self.NoclipBtn.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    self.NoclipBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    self.NoclipBtn.Font = Enum.Font.SourceSansBold
    self.NoclipBtn.Parent = Main
    
    -- SPEED TEXTBOX (Updated from TextButton)
    self.SpeedBtn = Instance.new("TextBox")
    self.SpeedBtn.Text = "50"
    self.SpeedBtn.PlaceholderText = "Speed"
    self.SpeedBtn.Size = UDim2.new(0.9, 0, 0, 25)
    self.SpeedBtn.Position = UDim2.new(0.05, 0, 0.62, 0)
    self.SpeedBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    self.SpeedBtn.TextColor3 = Color3.fromRGB(0, 255, 255)
    self.SpeedBtn.Font = Enum.Font.SourceSansBold
    self.SpeedBtn.BorderSizePixel = 1
    self.SpeedBtn.BorderColor3 = Color3.fromRGB(80, 80, 80)
    self.SpeedBtn.Parent = Main

    local SpeedLabel = Instance.new("TextLabel")
    SpeedLabel.Text = "SPEED:"
    SpeedLabel.Size = UDim2.new(0, 40, 0, 25)
    SpeedLabel.Position = UDim2.new(-0.25, 0, 0, 0)
    SpeedLabel.BackgroundTransparency = 1
    SpeedLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    SpeedLabel.Font = Enum.Font.SourceSans
    SpeedLabel.TextSize = 10
    SpeedLabel.Parent = self.SpeedBtn

    local ControlsLabel = Instance.new("TextLabel")
    ControlsLabel.Text = "WASD + Space/Ctrl\nor E/Q to move"
    ControlsLabel.Size = UDim2.new(0.9, 0, 0, 50)
    ControlsLabel.Position = UDim2.new(0.05, 0, 0.75, 0)
    ControlsLabel.BackgroundTransparency = 1
    ControlsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    ControlsLabel.Font = Enum.Font.SourceSans
    ControlsLabel.TextSize = 12
    ControlsLabel.Parent = Main

    return Gui
end

local Controller = Fly.new()

   end,
})


local Button = Tab:CreateButton({
   Name = "Telekenisis",
   Callback = function()

local re=game:GetService("Workspace")
local _Name="Telekinesis V6"
local uis=game:GetService("UserInputService")
local _Ins, _CF_new, _VTR_new=Instance.new, CFrame.new, Vector3.new
local con=getfenv().sethiddenproperty
local w=wait
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

Tool0=_Ins("Tool")
Part1=_Ins("Part")
local selectionbox=Instance.new("SelectionBox", LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
selectionbox.LineThickness=0.03
selectionbox.Color3=Color3.fromRGB(255, 255, 255)	

re=game:GetService("RunService")
Tool0.Name=_Name
Tool0.Parent=LocalPlayer.Backpack
Tool0.Grip=_CF_new(0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Tool0.GripPos=_VTR_new(0, 0, 1)
Tool0.RequiresHandle = true
Tool0.CanBeDropped = false

Part1.Name="Handle"
Part1.Parent=Tool0
local changed="Changed"
Part1.CFrame=_CF_new(-3.5, 5.30000019, -3.5, 1, 0, 0, 0, -1, 0, 0, 0, -1)
Part1.Orientation=_VTR_new(0, 180, 180)
Part1.Position=_VTR_new(-3.5, 5.300000190734863, -3.5)
Part1.Rotation=_VTR_new(-180, 0, 0)
Part1.Color=Color3.new(0.972549, 0.972549, 0.972549)
Part1.Transparency=1
local cam=re.RenderStepped
Part1.Size=_VTR_new(1, 1, 1)
Part1.BottomSurface=Enum.SurfaceType.Smooth
Part1.BrickColor=BrickColor.new("Institutional white")
Part1.Locked=true
local speed=31
local mb=uis.TouchEnabled
Part1.TopSurface=Enum.SurfaceType.Smooth
Part1.brickColor=BrickColor.new("Institutional white")

local Sound=_Ins("Sound", game.Workspace)
Sound.SoundId="rbxassetid://1092093337"
Sound.Volume = 0.3
Sound:Play()

pcall(function()
    cam:Connect(function() 
        if con then 
            pcall(function() 
                con(LocalPlayer, changed, speed) 
            end) 
        end 
    end)
end)

changed="SimulationRadius"

local ScreenGui = _Ins("ScreenGui")
ScreenGui.Name = "TelekinesisGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = _Ins("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(1, -210, 0.5, -180)
MainFrame.Size = UDim2.new(0, 200, 0, 360)

local Title = _Ins("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.Code
Title.Text = "TELEKINESIS V6"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

local ScrollFrame = _Ins("ScrollingFrame")
ScrollFrame.Name = "ControlsList"
ScrollFrame.Parent = MainFrame
ScrollFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScrollFrame.BorderSizePixel = 0
ScrollFrame.Position = UDim2.new(0, 0, 0, 30)
ScrollFrame.Size = UDim2.new(1, 0, 1, -30)
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

local UIListLayout = _Ins("UIListLayout")
UIListLayout.Parent = ScrollFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 2)
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 5)
end)

local UIPadding = _Ins("UIPadding")
UIPadding.Parent = ScrollFrame
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 8)
UIPadding.PaddingRight = UDim.new(0, 8)

local function createControlLabel(keyText, actionText, descText, layoutOrder)
    local ControlFrame = _Ins("Frame")
    ControlFrame.Name = "Control"
    ControlFrame.Parent = ScrollFrame
    ControlFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ControlFrame.BorderColor3 = Color3.fromRGB(40, 40, 40)
    ControlFrame.BorderSizePixel = 1
    ControlFrame.Size = UDim2.new(1, -10, 0, 40)
    ControlFrame.LayoutOrder = layoutOrder
    
    local KeyLabel = _Ins("TextLabel")
    KeyLabel.Name = "Key"
    KeyLabel.Parent = ControlFrame
    KeyLabel.BackgroundTransparency = 1
    KeyLabel.Position = UDim2.new(0, 5, 0, 3)
    KeyLabel.Size = UDim2.new(0, 20, 0, 15)
    KeyLabel.Font = Enum.Font.Code
    KeyLabel.Text = keyText
    KeyLabel.TextColor3 = Color3.fromRGB(120, 180, 255)
    KeyLabel.TextSize = 13
    KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local ActionLabel = _Ins("TextLabel")
    ActionLabel.Name = "Action"
    ActionLabel.Parent = ControlFrame
    ActionLabel.BackgroundTransparency = 1
    ActionLabel.Position = UDim2.new(0, 28, 0, 3)
    ActionLabel.Size = UDim2.new(1, -33, 0, 15)
    ActionLabel.Font = Enum.Font.Code
    ActionLabel.Text = actionText
    ActionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    ActionLabel.TextSize = 12
    ActionLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    local DescLabel = _Ins("TextLabel")
    DescLabel.Name = "Description"
    DescLabel.Parent = ControlFrame
    DescLabel.BackgroundTransparency = 1
    DescLabel.Position = UDim2.new(0, 5, 0, 20)
    DescLabel.Size = UDim2.new(1, -10, 0, 15)
    DescLabel.Font = Enum.Font.Code
    DescLabel.Text = descText
    DescLabel.TextColor3 = Color3.fromRGB(140, 140, 140)
    DescLabel.TextSize = 10
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    return ControlFrame
end

createControlLabel("LMB", "Grab", "Click to grab objects", 1)
createControlLabel("F", "Freeze", "Lock object in place", 2)
createControlLabel("E", "Pull In", "Decrease distance by 5", 3)
createControlLabel("Q", "Push Out", "Increase distance by 5", 4)
createControlLabel("X", "Close", "Set distance to 15", 5)
createControlLabel("Y", "Throw", "Set distance to 100", 6)
createControlLabel("J", "Launch", "Set distance to 5000", 7)
createControlLabel("L", "Lock Spin", "Stop object rotation", 8)
createControlLabel("U", "Spin", "Apply rotation force", 9)
createControlLabel("P", "Lift", "Apply upward force", 10)

ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frozenObjects = {}
local heldObjects = {}
local activeLines = {}

local LineConnect=function(part1,part2,parent)
    local line=_Ins("Part")
    line.TopSurface=0
    line.BottomSurface=0
    line.Reflectance=.5
    line.Name="Laser"
    line.Locked=true
    line.CanCollide=false
    line.Anchored=true
    line.formFactor=0
    line.Size=_VTR_new(1,1,1)
    local mesh=_Ins("BlockMesh")
    mesh.Parent=line
    
    local connection
    connection = game:GetService("RunService").RenderStepped:Connect(function()
        if not part1 or not part2 or not part1.Parent or not part2.Parent then
            pcall(function() line:Destroy() end)
            if connection then connection:Disconnect() end
            return
        end
        
        local lv=_CF_new(part1.Position,part2.Position)
        local dist=(part1.Position-part2.Position).magnitude
        line.Parent=parent
        line.BrickColor=Part1.BrickColor
        line.Reflectance=Part1.Reflectance
        line.Transparency=Part1.Transparency
        line.CFrame=_CF_new(part1.Position+lv.lookVector*dist/2)
        line.CFrame=_CF_new(line.Position,part2.Position)
        mesh.Scale=_VTR_new(.25,.25,dist)
    end)
    
    table.insert(activeLines, {line=line, connection=connection})
    return line, connection
end

local tool=Tool0
local object=nil
local mousedown=false
local found=false
local dist=nil
local point=_Ins("Part")
point.Locked=true
point.Anchored=true
point.formFactor=0
point.Shape=0
point.BrickColor=BrickColor.Blue() 
point.Size=_VTR_new(1,1,1)
point.CanCollide=false
local mesh=_Ins("SpecialMesh")
mesh.MeshType="Sphere"
mesh.Scale=_VTR_new(.7,.7,.7)
mesh.Parent=point
local handle=tool.Handle
local front=tool.Handle
local color=tool.Handle

local onButton1Down=function(mouse)
    if (mousedown==true) then return end
    mousedown=true
    
    coroutine.resume(coroutine.create(function()
        local p=point:clone()
        p.Parent=tool
        local lineObj, lineConn = LineConnect(front,p,workspace)
        
        while (mousedown==true) do
            p.Parent=tool
            if (object==nil) then
                if (mouse.Target==nil) then
                    local lv=_CF_new(front.Position,mouse.Hit.p)
                    p.CFrame=_CF_new(front.Position+(lv.lookVector*1000))
                else
                    p.CFrame=_CF_new(mouse.Hit.p)
                end
            else
                LineConnect(front,object,workspace)
                break
            end
            w()
        end
        
        if lineConn then lineConn:Disconnect() end
        pcall(function() p:Destroy() end)
    end))
    
    while (mousedown==true) do
        if (mouse.Target~=nil) then
            local t=mouse.Target
            if (t.Anchored==false) then
                object=t
                selectionbox.Adornee=object
                dist=(object.Position-front.Position).magnitude
                break
            end
        end
        w()
    end
    
    local currentBP = _Ins("BodyPosition")
    currentBP.maxForce=_VTR_new(math.huge*math.huge,math.huge*math.huge,math.huge*math.huge)
    currentBP.P=currentBP.P*3
    
    if object then
        heldObjects[object] = {BP = currentBP, dist = dist}
    end
    
    while (mousedown==true) do
        if (object==nil or object.Parent==nil) then break end
        local lv=_CF_new(front.Position,mouse.Hit.p)
        currentBP.Parent=object
        currentBP.position=front.Position+lv.lookVector*dist
        w()
    end
    
    if object and not frozenObjects[object] then
        pcall(function() currentBP:Destroy() end)
        heldObjects[object] = nil
        object=nil
        selectionbox.Adornee=nil
    end
end

local onKeyDown=function(key,mouse) 
    local key=key:lower() 
    
    if (key=="q") then 
        if (dist and dist>=5) then 
            dist=dist-5
            if heldObjects[object] then
                heldObjects[object].dist = dist
            end
        end 
    end
    
    if (key=="u") then 
        if (object and dist ~=1) then 
            local BX=_Ins("BodyGyro")
            BX.MaxTorque=_VTR_new(math.huge,0,math.huge)
            BX.CFrame=BX.CFrame * CFrame.Angles(0, math.rad(45), 0)
            BX.D=0
            BX.Parent=object
        end 
    end 
    
    if (key=="p") then 
        if (object and dist ~=1) then
            local BX=_Ins("BodyVelocity")
            BX.maxForce=_VTR_new(0,math.huge,0)
            BX.velocity=_VTR_new(0,1,0)
            BX.Parent=object
        end 
    end 
    
    if key == "l" then 
        if (object==nil) then return end 
        
        for _,v in pairs(object:GetChildren()) do 
            if v.ClassName == "BodyGyro" then 
                return nil 
            end 
        end 
        
        local BG=_Ins("BodyGyro") 
        BG.maxTorque=_VTR_new(math.huge,math.huge,math.huge) 
        BG.cframe=_CF_new(object.CFrame.p) 
        BG.Parent=object 
        
        repeat w() until(object.CFrame == _CF_new(object.CFrame.p))
        
        BG.Parent=nil 
        
        if (object==nil) then return end 
        
        for _,v in pairs(object:GetChildren()) do 
            if v.ClassName == "BodyGyro" then 
                v.Parent=nil 
            end 
        end 
        
        object.Velocity=_VTR_new(0,0,0) 
        object.RotVelocity=_VTR_new(0,0,0) 
    end 
    
    if (key=="y") then 
        if (dist ~=100) then 
            dist=100
            if heldObjects[object] then
                heldObjects[object].dist = dist
            end
        end 
    end 
    
    if (key=="j") then 
        if (dist~=5000) then 
            dist=5000
            if heldObjects[object] then
                heldObjects[object].dist = dist
            end
        end 
    end
    
    if (key=="e") then
        if dist then
            dist=dist+5
            if heldObjects[object] then
                heldObjects[object].dist = dist
            end
        end
    end
    
    if (key=="x") then 
        if dist ~= 15 then 
            dist=15
            if heldObjects[object] then
                heldObjects[object].dist = dist
            end
        end 
    end 
    
    if (key=="f") then 
        if (object==nil) then return end 
        
        if frozenObjects[object] then
            local frozenData = frozenObjects[object]
            if frozenData.BP then
                pcall(function() frozenData.BP:Destroy() end)
            end
            if frozenData.selectionBox then
                pcall(function() frozenData.selectionBox:Destroy() end)
            end
            frozenObjects[object] = nil
        else
            local holdData = heldObjects[object]
            if not holdData then return end
            
            local freezeBP = holdData.BP
            
            local freezeBox = _Ins("SelectionBox")
            freezeBox.LineThickness = 0.03
            freezeBox.Color3 = Color3.fromRGB(0, 255, 0)
            freezeBox.Adornee = object
            freezeBox.Parent = object
            
            frozenObjects[object] = {
                BP = freezeBP,
                selectionBox = freezeBox,
                object = object
            }
            
            heldObjects[object] = nil
            
            object = nil
            selectionbox.Adornee = nil
        end
    end
end

local onEquipped=function(mouse)
    local char=tool.Parent
    local human=char:FindFirstChildOfClass("Humanoid")
    
    if human then
        human.Changed:connect(function() 
            if (human.Health==0) then 
                mousedown=false 
                point:Remove() 
                tool:Remove() 
            end 
        end)
    end
    
    mouse.Button1Down:connect(function() onButton1Down(mouse) end)
    mouse.KeyDown:connect(function(key) onKeyDown(key,mouse) end)
    mouse.Icon="rbxasset://textures\\GunCursor.png"
    
    if mb then
        uis.TouchLongPress:Connect(function() onKeyDown("y",mouse) end)
        uis.TouchEnded:Connect(function() mousedown=false end)
    else
        mouse.Button1Up:connect(function() mousedown=false end)
    end
end

local function cleanup()
    mousedown=false 
    
    for _, lineData in pairs(activeLines) do
        if lineData.connection then lineData.connection:Disconnect() end
        if lineData.line then pcall(function() lineData.line:Destroy() end) end
    end
    activeLines = {}
    
    for obj, data in pairs(heldObjects) do
        if data.BP then pcall(function() data.BP:Destroy() end) end
    end
    heldObjects = {}
    
    if object then
        object = nil
        selectionbox.Adornee = nil
    end
end

Tool0.Equipped:connect(onEquipped)
Tool0.Unequipped:connect(cleanup)

LocalPlayer.CharacterAdded:Connect(function()
    cleanup()
    
    for obj, data in pairs(frozenObjects) do
        if data.BP then pcall(function() data.BP:Destroy() end) end
        if data.selectionBox then pcall(function() data.selectionBox:Destroy() end) end
    end
    frozenObjects = {}
    
    w(0.1)
    selectionbox = Instance.new("SelectionBox", LocalPlayer.Character)
    selectionbox.LineThickness=0.03
    selectionbox.Color3=Color3.fromRGB(255, 255, 255)
end)

   end,
})


local Button = Tab:CreateButton({
   Name = "Invisibility Script",
   Callback = function()
   loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Jenny Mod",
   Callback = function()
   
-- JENNNYYY MODDDDD
-- this file was generated using ironbrew1
return(function(a,a,b,b,b,b,c,d,e,f,g,h,i,j,k,l,m,m,m,n,n,n,n,n,n,o,o,o,o,o,o,o,o)local p,q,r,s,t,u,v,w,x,y,z,ba,bb,bc,bd,be,bf,bg,bh,bi,bj,bk,bl,bm,bn,bo,bp,bq,br,bs,bt,bu,bv,bw,bx,by,bz,ca local cb={}local cc={}cc[1]=3 cc[2]=3 cc[3]=0 local cd=0 local ce=0 local cf=-48575 repeat if cf>=-16235 then if cf<=43562 then if cf<=-10494 then if cf<=-12871 then if cf<=-16235 then p=table and table.move or function(cg,ch,ci,cj,ck)local cl={}local cm={}local function cn(co,cp)cm[cp]=co;return cm[cp]end local co={}co[1]=3 co[2]=0 co[3]=3 local co=0 local co=0 local co=78823 repeat if co>=64540 then if co<78823 then break else ck=ck or cg cj=cj+ci cl[4]=cm[78823+350759]or cn(-11151,78823+350759)co=-34802 end else if co==-34802 then co=cl[4]else for cl=ci,ch,-1 do local ch={}local ci={}local function cm(cn,cp)ci[cp]=cn;return ci[cp]end local cn={}cn[1]=3 cn[2]=1 cn[3]=2 local cp=0 local cp=0 local cq=-26642 repeat if cq<=-26642 then if cq==-44461 then ck[cj]=ch[1]cn[2]=(cn[2]+1)%5 ch[3]=ci[-44461+306832]or cm(55022,-44461+306832)cp,cq=80526,80526 else cj=cj-1 ch[1]=cg[cl]ch[2]=ci[-26642+306832]or cm(-44461,-26642+306832)cq=53669 end else if cq<=53669 then cq=ch[2]else if cq~=80526 then break else cp,cq=ch[3],ch[3]end end end until cq==55022 end;return ck;end end until co==64540 end q=bit32 or bit r=2^32 cd,cf=-26091,-26091 else by=function(cg,ch,ci,...)local cj=(cg[1774])local ck=cg[3455]local cl=cg[7789]local cl=cg[5697]local cm=cg[4733]local cn=cg[3540]return function(...)local cg=ba(cg[84])local co={}local cp={}local cq={}local cr=0 local cs=0 local ct={}local cu=0 local cv=k('#',...)-1 local cw=ck+1 local cw,cx=bv(...);local cx={...};local cx=1 local cy=-1 for cz=0,cv do if cz<=ck then cg[cz]=cw[cz+1];end;end;local ck,cv while true do ck=cj[cx];cv=ck[1642];if(((6)-0))>=(cv)then if cv<=2 then if cv<=1 then if(1)>(cv)then cg[ck[4671]]=cm[ck[2663]];else local cw=ck[4671]local cw=cg[cw]cr=cr+1 cq[cr]=cw end else cg[ck[4671]]=cg[ck[2663]];end else if cv>=((5)*1)then if cv<=5 then cg[ck[4671]]=ch[ck[2663]]else cg[ck[4671]]=ci[cm[ck[2663]]];end else if(3)>=(cv)then cg[ck[4671]]=cg[ck[2663]][cg[ck[6766]]];else cx=ck[2663];end end end else if cv>=16 then if cv>=26 then if cv>=35 then if not((cv)<(43))then if(((50)+0))>=(cv)then if cv<=46 then if cv>=45 then if cv<=((45)+0)then cg[ck[4671]]=#cg[ck[2663]];else ci[cm[ck[2663]]]=cg[ck[4671]];end else if cv~=44 then cg[ck[4671]]=cg[ck[2663]]-cg[ck[6766]];else local cw=ck[4671]local cz=ck[2663]local cz=(cz==0)and cy or(cw+cz-1)for da=cw,cz do cr=cr+((1)+0)cq[cr]=cg[da]end end end else if cv>=(0+(49))then if cv<=49 then local cw=ck[4671]local cz=bw(cp,cg[cw](t(cg,cw+1,ck[2663])))cy=cw+cz-1;for da=1,cz do cg[(da)+(cw)-1]=cp[da];end;else cg[ck[4671]]=cg[ck[2663]]+cg[ck[6766]];end else if cv==47 then cu=cu+1 ct[cu]=cs cs=cr else local cw,cz=ck[4671],ck[2663]local cz=cn[cz]local da={}for db=1,#cz,2 do da[cm[cz[db]]]=cm[cz[db+((1)+0)]]end cg[cw]=da end end end else if cv<=56 then if not((cv)<(54))then if cv<=55 then if cv~=55 then cg[ck[4671]]=cm else local cw=ck[4671]local cz=cr local da=cs local db=da+1 local dc=cq[db]do local dc,dd,de=dc(t(cq,db+1,cz))cg[cw]=dc cg[cw+1]=dd cg[cw+2]=de end do local cw=(cz)local cz=(-1)local db=(db)if cz>=0 then while cw<=db do cq[cw]=nil cw=cw+cz end else while cw>=db do cq[cw]=nil cw=cw+cz end end end cr=da local cw=ct[cu]ct[cu]=nil cu=cu-1 cs=cw or 0 end else cg[ck[4671]]=(cg[ck[6766]])*(cg[ck[2663]]);end else if(53)<=(cv)then cg[ck[4671]]=cj else if not((cv)~=(51))then cg[ck[4671]]=cg[ck[2663]]<cg[ck[6766]];else cg[ck[4671]]=cg end end end else if cv<=60 then if cv<=58 then if cv==57 then cg[ck[4671]]=-cg[ck[2663]];else local cj=#ck[4671]for cw=1,cj do cg[ck[4671][cw]]=cg[ck[2663][cw]];end;end else if cv==((59)*1)then local cj,cw=ck[4671],(ck[6766]*100)local cz=cg[cj]for da=(ck[2663]),(1),-1 do cz[cw+da]=cg[cj+da]end else local cj=ck[4671]local cj=cr local cw=cs local cz=cw+((1)+0)local da=cq[cz]da(t(cq,cz+1,cj))for da=cj,cz,-1 do cq[da]=nil end cr=cw local cj=ct[cu]ct[cu]=nil cu=cu-1 cs=cj or 0 end end else if cv>=63 then if cv~=64 then local cj=ck[4671]local cs=ck[2663]local cs=cs local ct=cr local cs=ct-cs+1 local cu=cq[cs]local cu=bw(cp,cu(t(cq,cs+1,ct)))cy=cj+cu-1 for cw=(cu),(1),-1 do cg[cj+cw-1]=cp[cw]end for cj=ct,cs,-1 do cq[cj]=nil end cr=cs-1 else cg[ck[4671]]=cg[ck[2663]]<=cg[ck[6766]];end else if cv~=62 then cg[ck[4671]]=cg[ck[2663]]..cg[ck[6766]];else local cj=ck[4671]local cp=cq[cr]cq[cr]=nil cr=cr-((1)+0)cg[cj]=cp()end end end end end else if cv<=((38)*1)then if(37)<=(cv)then if not((cv)>=(38))then cg[ck[4671]]=cg[ck[2663]]==cg[ck[6766]];else local cj=ck[4671]local cp=cq[cr]cq[cr]=nil cr=cr-1 local cs=cq[cr]cq[cr]=nil cr=cr-((1)-0)local cp,cs=cs(cp)do local cp,cs=cp,cs cg[cj]=cp cg[cj+1]=cs end end else if not((cv)>=(36))then local cj=ck[4671]local cj=cq[cr]cq[cr]=nil cr=cr-1 cj()else local cj,cp,cs=ck[4671],ck[2663],ck[6766]local cp=cn[cp]local cj=cg[cj]for ct=1,#cp do if not((cj)~=(nil))then break end cj=cj[cm[cp[ct]]]end cg[cs]=cj end end else if(40)>=(cv)then if cv~=40 then local cj=ck[4671]local cp=cq[cr]cq[cr]=nil cr=cr-1 local cs=cq[cr]cq[cr]=nil cr=cr-1 do local cp,cs,ct=cs(cp)cg[cj]=cp cg[cj+1]=cs cg[(2)+(cj)]=ct end else cg[ck[4671]]=cg[ck[2663]]>cg[ck[6766]];end else if cv<=41 then local cj=ck[4671]local cp=ck[2663]local cp=cp local cs=cr local cp=cs-cp+1 local ct=cq[cp]cg[cj]=ct(t(cq,cp+((1)*1),cs))do local cj=(cs)local cs=(-1)local ct=(cp)if cs>=0 then while cj<=ct do cq[cj]=nil cj=cj+cs end else while cj>=ct do cq[cj]=nil cj=cj+cs end end end cr=cp-1 else local cj=ck[2663]do local cp=(1)local cs=(1)local ct=(#cj)if cs>=0 then while cp<=ct do local cu=cj[cp]local cu=cm[cu]cr=cr+1 cq[cr]=cu cp=cp+cs end else while cp>=ct do local cj=cj[cp]local cj=cm[cj]cr=cr+1 cq[cr]=cj cp=cp+cs end end end end end end end else if cv>=30 then if cv<=32 then if cv>=32 then local cj=#ck[4671]for cp=1,cj do cg[ck[4671][cp]]=cm[ck[2663][cp]];end;else if cv~=31 then local cj=ck[4671]cg[cj]=cg[cj](cg[cj+1],cg[cj+2]);else local cj=ck[4671]local cj=cq[cr]cq[cr]=nil cr=cr-1 local cp=cq[cr]cq[cr]=nil cr=cr-1 cp(cj)end end else if cv~=34 then local cj,cp=ck[4671],ck[2663]local cs=cj+2 local cj,ct=cg[cj](cg[cj+1],cg[cs])if cj~=nil then do local cj,cp,ct,cu=cj,cj,ct,cp cg[cs]=cj cg[cs+1]=cp cg[cs+2]=ct cx=cu end end else local cj,cp=ck[4671],ck[2663]local cs,ct,cu=cg[cj],cg[cj+1],cg[cj+2]cg[cj]=g(function()for g,cw,cz,da,db,dc,dd,de,df,dg in cs,ct,cu do f(g,cw,cz,da,db,dc,dd,de,df,dg);end;end);cg[cj+1]=nil;cg[cj+2]=nil;cy=(2)+(cj);cx=cp;end end else if not((cv)>(27))then if cv<=26 then local f=ck[4671]local g=cq[cr]cq[cr]=nil cr=cr-((1)*1)local cj=cq[cr]cq[cr]=nil cr=cr-1 cg[f]=cj(g)else local f,g=ck[4671],ck[2663]local g=cg[g]cg[f]=g[1]end else if cv<=((28)-0)then cg[ck[4671]]=not cg[ck[2663]];else cg[ck[4671]]=cg[ck[2663]]~=cg[ck[6766]];end end end end else if cv<=20 then if not((cv)>(18))then if(18)<=(cv)then do for f,g in a,co do if g[1]==cg and f>=0 then g[1]={cg[f]}g[2]=1 co[f]=nil end end end local a=cq[cr]cq[cr]=nil cr=cr-1 do return a end else if(17)>(cv)then cg[ck[4671]]=by(cl[ck[2663]],nil,ci)else cg[ck[4671]]={};end end else if(20)>(cv)then local a=cl[ck[2663]]local f=a[7742]local g=#f local cj=ba(g)for cl=1,g do local f=f[cl]local g=f[2]local cp=f[3]if f[1]==((1)*1)then if cp==((0)+0)then local f=cg[g]co[g]=f cj[cl-1]=f else cj[cl-1]=cg[g]end else local f=ch[g]if cp==0 and f[((0)*1)]then f=f[0][f[1]]end cj[cl-(0+(1))]=f end end cg[ck[4671]]=by(a,cj,ci)else local a,f=ck[4671],ck[2663]local f=cn[f]local g={}for ci=1,#f do g[ci]=cm[f[ci]]end cg[a]=g end end else if cv>=24 then if cv<25 then if cg[ck[4671]]then cx=ck[2663];end;else ch[ck[2663]][1]=cg[ck[4671]]end else if cv<=22 then if cv<=((21)-0)then local a=ck[2663]local a=ch[a]cg[ck[4671]]=a[1]else local a=ck[4671]local f=cq[cr]cq[cr]=nil cr=cr-1 local g=cq[cr]cq[cr]=nil cr=cr-((1)*1)local ch=cq[cr]cq[cr]=nil cr=cr-1 cg[a]=ch(g,f)end else cg[ck[4671]]=nil;end end end end else if cv<=10 then if cv>=9 then if cv==9 then cg[ck[4671]][cg[ck[2663]]]=cg[ck[6766]];else local a=ck[4671]for f=1,#a do local a=cg[a[f]]cr=cr+1 cq[cr]=a end end else if cv==(0+(7))then local a=ck[4671]local f=ck[2663]local a=cg[a]cx=((not a)and(f)or cx)else local a,f=cg[ck[2663]],ck[4671]cg[f]=a[cg[ck[6766]]];cg[f+1]=a;end end else if cv<=13 then if cv>=((13)-0)then local a=ck[4671]local a=ck[2663]local a=a local f=cr local a=f-a+1 local g=cq[a]g(t(cq,a+1,f))do local f=(f)local g=(-1)local ch=(a)if g>=0 then while f<=ch do cq[f]=nil f=f+g end else while f>=ch do cq[f]=nil f=f+g end end end cr=a-1 else if cv~=((12)*1)then local a=ck[2663]local a=cm[a]cr=(1)+(cr)cq[cr]=a else do return end end end else if not((cv)~=(14))then local a=ck[4671]cg[a]={cg[a]}else cg[ck[4671]][1]=cg[ck[2663]]end end end end end cx=cx+1;end;end;end ce,cf=-10494,-10494 end else if cf<=-11758 then bn=nil cf=-36662 else if cf<=-10769 then bp=nil cf=-40276 else bz=bu(bg)ca=by(bz,{},l())return ca();end end end else if cf<=22741 then if cf>=21299 then if cf~=22741 then bu=nil ce,cf=45839,45839 else bt=function(a)local f,g local l={}local by={}local function bz(ca,cg)by[cg]=ca;return by[cg]end local ca={}ca[1]=2 ca[2]=4 ca[3]=3 local ca=0 local ca=-10828 local cg=0 repeat if ca>=45186 then if ca~=70933 then if g==0 then return f;elseif(g>=2147483648)then g=g-4294967296;end;return g*4294967296+f;else ca=l[43]end else if ca==-23046 then break else f=br(a)g=br(a)l[43]=by[-10828+163366]or bz(45186,-10828+163366)ca=70933 end end until ca==-23046 end cc[2]=(cc[2]+1)%5 ce,cf=21299,21299 end else t=function(a,f,g)local l=g-f+1 if l>7997 then return s(a,f,g)else return m(a,f,g)end end ce,cf=-41521,-41521 end else if cf<=25314 then br=function(a)local f,g,l,m local by={}local bz={}local function ca(cg,ch)local ci=u(ch,ch)local cg=cg+ci bz[ch]=cg;return cg end local cg={}cg[1]=3 cg[2]=0 cg[3]=0 local cg=-33152 local ch=0 local ch=0 repeat if cg<=-33152 then if cg<=-46683 then ch,cg=by[41],by[41]else f,g,l,m=e(a,bh,bh+3)bh=bh+4 by[41]=bz[u(-33152,26464)]or ca(-24923,u(-33152,26464))ch,cg=-46683,-46683 end else if cg~=23822 then return((m*16777216)+(l*65536)+(g*256)+f);else break end end until cg==23822 end ce,cf=-35892,-35892 else if cf==35433 then bk=function(a)local f local g={}local l={}local function m(by,bz)l[bz]=by;return l[bz]end local by={}by[1]=3 by[2]=3 by[3]=0 local bz=0 local bz=0 local ca=-24133 repeat if ca>=24990 then if ca~=69909 then break else return f;end else if ca<-21369 then f=0 for cg=0,2 do f=v(f,w(e(a,bh,bh),8*cg));bh=bh+1;end;by[1]=(by[1]+1)%5 g[33]=l[-24133+281654]or m(69909,-24133+281654)bz,ca=-21369,-21369 else bz,ca=g[33],g[33]end end until ca==24990 end ce,cf=-46150,-46150 else bt=nil cd=cc[3]~=1 and 45839 or 22741 ce,cf=22741,22741 end end end end else if cf<=56237 then if cf>=47208 then if cf<=47208 then br=nil ce,cf=25314,25314 else if cf==53172 then bj=nil cd=cc[2]~=1 and 35433 or-44314 cc[3]=(cc[3]+1)%5 ce,cf=-44314,-44314 else bl=function(a)local f=0 for g=0,1 do f=v(f,w(e(a,bh,bh),8*g));bh=bh+1;end;return f;end cd,cf=86152,86152 end end else if cf<45839 then bm=function(a)local f local g={}local l={}local function m(br,by)l[by]=br;return l[by]end local br={}br[1]=4 br[2]=1 br[3]=2 local br=0 local br=0 local by=-21980 repeat if by<=-21980 then if by==-36157 then break else f=0 f=v(f,w(e(a,bh,bh),8))bh=bh+1 g[34]=l[-21980+305486]or m(71326,-21980+305486)br,by=49511,49511 end else if by~=71326 then br,by=g[34],g[34]else return f;end end until by==-36157 end ce,cf=-11758,-11758 else bu=function(a)local f f={[1774]={},[4733]={},[3455]={},[5697]={},[7789]={},[7742]={},[6444]={},}bc(f,3455,bn(a))local g g=bp(a)local l={}local m=0 for br=1,g do local g,br,by,bz,ca local cg={}local ch={}local function ci(cj,ck)ch[ck]=cj;return ch[ck]end local cj={}cj[1]=4 cj[2]=0 cj[3]=3 local ck=0 local ck=-20647 local cl=0 repeat if ck<=-20647 then if ck==-44516 then cl,ck=cg[44],cg[44]else g=bn(a)~=0 br=g and 1 or 0 by=bq(a)cj[1]=(cj[1]+1)%5 cg[44]=ch[-20647+187135]or ci(64710,-20647+187135)cl,ck=-44516,-44516 end else if ck>=33558 then if ck~=64710 then cl,ck=cg[45],cg[45]else bz=m+by m=bz ca=bn(a)c(l,{br,bz,ca})cg[45]=ch[64710+318206]or ci(-10174,64710+318206)cl,ck=33558,33558 end else break end end until ck==-10174 end f[7742]=l bc(f,84,bp(a))local g=bp(a)local l={}local m,br,by,bz=0,0,0,0 do do local ca=(1)local cg=(1)local g=(g)if cg>=0 then while ca<=g do local ch ch={}ch[1642]=bp(a);local ci=bn(a)==1 local cj=(1)==(bn(a))local ck=bn(a)==1 local cl cl=bn(a)if cl==1 then local cm=bs(a)local cn cn={}local co={}local cp={}local cq,cr,cs=0,0,0 do local ct=(0)local cu=(1)local cm=(cm-1)if cu>=0 then if ct<=cm then repeat local cv={}local cw={}local function cx(cy,cz)cw[cz]=cy;return cw[cz]end local cy={}cy[1]=4 cy[2]=3 cy[3]=2 local cy=0 local cy=0 local cy=81098 repeat if cy<=-46869 then if cy~=-46869 then cp[ct]=cs ct=ct+cu cv[47]=cw[-48902+344639]or cx(60105,-48902+344639)cy=-26636 else cy=cv[46]end else if cy>=60105 then if cy<=60105 then break else do cq=cq+bq(a);cr=cr+bq(a);end cs=cs+bq(a)bc(cn,ct,cq)co[ct]=cr cv[46]=cw[81098+344639]or cx(-48902,81098+344639)cy=-46869 end else cy=cv[47]end end until cy==60105 until not(ct<=cm)end else if ct>=cm then repeat local cv={}local cw={}local function cx(cy,cz)cw[cz]=cy;return cw[cz]end local cy={}cy[1]=3 cy[2]=2 cy[3]=1 local cz=54753 local da=0 local db=0 repeat if cz<=26601 then if cz==-10983 then da,cz=cv[49],cv[49]else break end else if cz<=42074 then db,cz=cv[48],cv[48]else if cz<=54753 then do cq=cq+bq(a);cr=cr+bq(a);end cs=cs+bq(a)bc(cn,ct,cq)cv[48]=cw[54753+69228]or cx(76879,54753+69228)db,cz=42074,42074 else co[ct]=cr cp[ct]=cs ct=ct+cu cy[3]=(cy[3]+1)%5 cv[49]=cw[76879+331370]or cx(26601,76879+331370)da,cz=-10983,-10983 end end end until cz==26601 until not(ct>=cm)end end end do bc(ch,4671,cn)ch[2663]=co;end ch[6766]=cp;elseif cl==2 then local cm=bs(a)local cn cn={}local co={}local cp,cq=0,0 do local cr=(1)local cs=(1)local cm=(cm)if cs>=0 then while cr<=cm do local ct={}local cu={}local function cv(cw,cx)cu[cx]=cw;return cu[cx]end local cw={}cw[1]=1 cw[2]=2 cw[3]=3 local cw=-41647 local cx=0 local cy=0 repeat if cw<=-31101 then if cw<=-41647 then cp=cp+bq(a)cq=cq+bq(a)cn[cr]=cp ct[50]=cu[-41647+90507]or cv(-31101,-41647+90507)cy,cw=40183,40183 else bc(co,cr,cq)cr=cr+cs ct[51]=cu[-31101+352649]or cv(30774,-31101+352649)cx,cw=56004,56004 end else if cw<=30774 then break else if cw<56004 then cy,cw=ct[50],ct[50]else cx,cw=ct[51],ct[51]end end end until cw==30774 end else while cr>=cm do local cm={}local ct={}local function cu(cv,cw)ct[cw]=cv;return ct[cw]end local cv={}cv[1]=3 cv[2]=2 cv[3]=1 local cw=0 local cw=-30564 local cx=0 repeat if cw<=-27415 then if cw<=-30564 then cp=cp+bq(a)cq=cq+bq(a)cn[cr]=cp cv[2]=(cv[2]+1)%5 cm[52]=ct[-30564+204903]or cu(-27415,-30564+204903)cx,cw=40396,40396 else bc(co,cr,cq)cr=cr+cs cv[2]=(cv[2]+1)%5 cm[53]=ct[-27415+335974]or cu(-16997,-27415+335974)cw=47865 end else if cw>=40396 then if cw~=47865 then cx,cw=cm[52],cm[52]else cw=cm[53]end else break end end until cw==-16997 end end end do bc(ch,4671,cn)bc(ch,2663,co)end elseif(3)==(cl)then local cm,cn,co local cp={}local cq={}local function cr(cs,ct)cq[ct]=cs;return cq[ct]end local cs={}cs[1]=4 cs[2]=3 cs[3]=2 local cs=0 local ct=-11086 local cu=0 repeat if ct>=-29444 then if ct>=-12578 then if ct==-12578 then co=0 for cu=1,cm do do co=co+bq(a);bc(cn,cu,co)end end;do ch[4671]=cn;end cp[57]=cq[-12578+60468]or cr(-49606,-12578+60468)ct=-29444 else cp[54]={}cp[55]=cq[-11086+191539]or cr(-34272,-11086+191539)cs,ct=-29074,-29074 end else if ct<=-29444 then ct=cp[57]else cs,ct=cp[55],cp[55]end end else if ct<=-49606 then break else if ct~=-34272 then cs,ct=cp[56],cp[56]else cm=bs(a)cn=cp[54]cp[56]=cq[-34272+60468]or cr(-12578,-34272+60468)cs,ct=-46004,-46004 end end end until ct==-49606 elseif cl==4 then local cl,cm,cn,co,cp,cq,cr,cs,ct local cu={}local cv={}local function cw(cx,cy)cv[cy]=cx;return cv[cy]end local cx={}cx[1]=4 cx[2]=1 cx[3]=4 local cy=0 local cz=0 local da=31422 repeat if da>=31422 then if da<=42638 then if da>=42597 then if da==42597 then cy,da=cu[68],cu[68]else ch[4671]=cm ch[2663]=cn ch[6766]=co cu[71]=cv[42638+316528]or cw(81729,42638+316528)cy,da=-27180,-27180 end else if da==31422 then cu[61]={}cu[65]=cv[31422+316528]or cw(53469,31422+316528)cz,da=81396,81396 else da=cu[67]end end else if da<=53469 then if da<53469 then cy,da=cu[69],cu[69]else cu[62]={}cu[66]=cv[53469+185457]or cw(58112,53469+185457)cy,da=-44331,-44331 end else if da>=81396 then if da<=81396 then cz,da=cu[65],cu[65]else ch[3880]=cp cu[72]=cv[81729+54386]or cw(27831,81729+54386)cy,da=-17262,-17262 end else cu[63]={}cy=cx[3]==0 and-24231 or-12948 cu[67]=cv[58112+54386]or cw(-12948,58112+54386)da=37351 end end end else if da>=-17262 then if da>=20875 then if da<27831 then da=cu[70]else break end else if da~=-12948 then cy,da=cu[72],cu[72]else cu[64]={}cy=cx[3]~=0 and-24231 or-38587 cu[68]=cv[-12948+316528]or cw(-38587,-12948+316528)cy,da=42597,42597 end end else if da<=-38587 then if da<-38587 then cy,da=cu[66],cu[66]else cl=bs(a)cm=cu[61]cn=cu[62]co=cu[63]cu[69]=cv[-38587+54386]or cw(-24231,-38587+54386)cy,da=44025,44025 end else if da==-27180 then cy,da=cu[71],cu[71]else cp=cu[64]cq,cr,cs,ct=0,0,0,0 for cx=1,cl do local cl={}local cy={}local function cz(db,dc)cy[dc]=db;return cy[dc]end local db={}db[1]=3 db[2]=0 db[3]=2 local dc=-41857 local dd=0 local de=0 repeat if dc<=-41857 then if dc>=-44107 then if dc==-44107 then dc=cl[58]else do cq=cq+bq(a);cr=cr+bq(a);end cs=cs+bq(a)dd=db[1]~=1 and-12300 or-20549 cl[58]=cy[-41857+68486]or cz(-20549,-41857+68486)dc=-44107 end else dc=cl[60]end else if dc>=45836 then if dc~=50513 then dd,dc=cl[59],cl[59]else break end else if dc<-12300 then ct=ct+bq(a)cm[cx]=cq db[3]=(db[3]+1)%5 cl[59]=cy[-20549+68486]or cz(-12300,-20549+68486)dd,dc=45836,45836 else bc(cn,cx,cr)bc(co,cx,cs)cp[cx]=ct cl[60]=cy[-12300+199557]or cz(50513,-12300+199557)dc=-47157 end end end until dc==50513 end;cu[70]=cv[-24231+54386]or cw(42638,-24231+54386)da=20875 end end end end until da==27831 else local cl={}local cm={}local function cn(co,cp)cm[cp]=co;return cm[cp]end local co={}co[1]=3 co[2]=2 co[3]=4 local co=0 local cp=50508 local cq=0 repeat if cp<=-29413 then if cp==-47276 then co,cp=cl[73],cl[73]else co,cp=cl[74],cl[74]end else if cp<=-26485 then break else if cp<50508 then do ch[6766]=by;end bc(ch,3880,bz)cl[74]=cm[-15355+72392]or cn(-26485,-15355+72392)co,cp=-29413,-29413 else m=m+bq(a)do br=br+bq(a);by=by+bq(a);end bz=bz+bq(a)do bc(ch,4671,m)ch[2663]=br;end cl[73]=cm[50508+203463]or cn(-15355,50508+203463)co,cp=-47276,-47276 end end end until cp==-26485 end ch[6378]=ci;do ch[5221]=cj;ch[2604]=ck;end do local ci={}local cj={}local function ck(cl,cm)cj[cm]=cl;return cj[cm]end local cl={}cl[1]=1 cl[2]=3 cl[3]=4 local cm=0 local cn=57667 local co=0 repeat if cn>=42490 then if cn>=44187 then if cn<57667 then ch[4502]=ci[75]l[ca]=ch ci[77]=cj[44187+80343]or ck(-42704,44187+80343)cm,cn=-32580,-32580 else ci[75]=l[ca-1]cl[3]=(cl[3]+1)%5 ci[76]=cj[57667+211414]or ck(44187,57667+211414)cm,cn=42490,42490 end else cm,cn=ci[76],ci[76]end else if cn<=-42704 then break else cm,cn=ci[77],ci[77]end end until cn==-42704 end ca=ca+cg end else while ca>=g do local g g={}g[1642]=bp(a);local ch=bn(a)==1 local ci=(1)==(bn(a))local cj=bn(a)==1 local ck ck=bn(a)if ck==1 then local cl=bs(a)local cm cm={}local cn={}local co={}local cp,cq,cr=0,0,0 do local cs=(0)local ct=(1)local cl=(cl-1)if ct>=0 then if cs<=cl then repeat local cu={}local cv={}local function cw(cx,cy)cv[cy]=cx;return cv[cy]end local cx={}cx[1]=0 cx[2]=0 cx[3]=4 local cy=0 local cz=-29154 local da=0 repeat if cz>=-29154 then if cz>=-15900 then if cz==-15900 then break else cz=cu[78]end else do cp=cp+bq(a);cq=cq+bq(a);end cr=cr+bq(a)bc(cm,cs,cp)cx[3]=(cx[3]+1)%5 cu[78]=cv[-29154+170375]or cw(-35170,-29154+170375)cz=-11369 end else if cz~=-31362 then cn[cs]=cq co[cs]=cr cs=cs+ct cu[79]=cv[-35170+170375]or cw(-15900,-35170+170375)cy,cz=-31362,-31362 else cy,cz=cu[79],cu[79]end end until cz==-15900 until not(cs<=cl)end else if cs>=cl then repeat local cu={}local cv={}local function cw(cx,cy)cv[cy]=cx;return cv[cy]end local cx={}cx[1]=2 cx[2]=0 cx[3]=1 local cy=0 local cy=0 local cz=61782 repeat if cz>=-24373 then if cz>=61782 then if cz<=61782 then do cp=cp+bq(a);cq=cq+bq(a);end cr=cr+bq(a)bc(cm,cs,cp)cn[cs]=cq cx[1]=(cx[1]+1)%5 cu[80]=cv[61782+282237]or cw(-24373,61782+282237)cz=-26984 else cy,cz=cu[81],cu[81]end else co[cs]=cr cs=cs+ct cu[81]=cv[-24373+282237]or cw(-32770,-24373+282237)cy,cz=79553,79553 end else if cz<=-32770 then break else cz=cu[80]end end until cz==-32770 until not(cs>=cl)end end end do bc(g,4671,cm)g[2663]=cn;end g[6766]=co;elseif ck==2 then local cl=bs(a)local cm cm={}local cn={}local co,cp=0,0 do local cq=(1)local cr=(1)local cl=(cl)if cr>=0 then while cq<=cl do local cs={}local ct={}local function cu(cv,cw)ct[cw]=cv;return ct[cw]end local cv={}cv[1]=1 cv[2]=2 cv[3]=0 local cw=21827 local cx=0 local cx=0 repeat if cw<=-30627 then if cw<=-38058 then break else cw=cs[82]end else if cw<=-29046 then bc(cn,cq,cp)cq=cq+cr cv[3]=(cv[3]+1)%5 cs[83]=ct[-29046+81968]or cu(-38058,-29046+81968)cw=-20819 else if cw~=21827 then cw=cs[83]else co=co+bq(a)cp=cp+bq(a)cm[cq]=co cs[82]=ct[21827+81968]or cu(-29046,21827+81968)cw=-30627 end end end until cw==-38058 end else while cq>=cl do local cl={}local cs={}local function ct(cu,cv)cs[cv]=cu;return cs[cv]end local cu={}cu[1]=1 cu[2]=1 cu[3]=2 local cu=0 local cv=0 local cw=-16376 repeat if cw>=44555 then if cw<=50238 then if cw<=44555 then cq=cq+cr cl[86]=cs[44555+317928]or ct(86053,44555+317928)cv,cw=78848,78848 else cm[cq]=co bc(cn,cq,cp)cl[85]=cs[50238+55786]or ct(44555,50238+55786)cw=-23666 end else if cw==78848 then cv,cw=cl[86],cl[86]else break end end else if cw<=-45065 then cu,cw=cl[84],cl[84]else if cw<-16376 then cw=cl[85]else co=co+bq(a)cp=cp+bq(a)cl[84]=cs[-16376+317928]or ct(50238,-16376+317928)cu,cw=-45065,-45065 end end end until cw==86053 end end end do bc(g,4671,cm)bc(g,2663,cn)end elseif(3)==(ck)then local cl,cm,cn local co={}local cp={}local function cq(cr,cs)cp[cs]=cr;return cp[cs]end local cr={}cr[1]=2 cr[2]=1 cr[3]=0 local cs=0 local ct=-19991 local cu=0 repeat if ct<=-12219 then if ct>=-19991 then if ct<-12219 then co[87]={}cr[1]=(cr[1]+1)%5 co[88]=cp[-19991+181593]or cq(89778,-19991+181593)cs,ct=66437,66437 else cs,ct=co[90],co[90]end else cs,ct=co[89],co[89]end else if ct>=69447 then if ct<89778 then break else cl=bs(a)cm=co[87]cn=0 for cr=1,cl do do cn=cn+bq(a);bc(cm,cr,cn)end end;co[89]=cp[89778+50522]or cq(39979,89778+50522)cs,ct=-23182,-23182 end else if ct<66437 then do g[4671]=cm;end co[90]=cp[39979+50522]or cq(69447,39979+50522)cs,ct=-12219,-12219 else cs,ct=co[88],co[88]end end end until ct==69447 elseif ck==4 then local ck,cl,cm,cn,co,cp,cq,cr,cs local ct={}local cu={}local function cv(cw,cx)cu[cx]=cw;return cu[cx]end local cw={}cw[1]=2 cw[2]=1 cw[3]=3 local cx=0 local cy=-28320 local cz=0 repeat if cy>=-14535 then if cy>=38233 then if cy<=47928 then if cy~=47928 then g[2663]=cm g[6766]=cn g[3880]=co ct[105]=cu[38233+145065]or cv(82027,38233+145065)cx,cy=63957,63957 else ct[96]={}ct[100]=cu[47928+145065]or cv(-17399,47928+145065)cy=-17631 end else if cy<=62600 then cy=ct[98]else if cy==63957 then cx,cy=ct[105],ct[105]else break end end end else if cy>=23127 then if cy<=23127 then cn=ct[96]co=ct[97]ct[103]=cu[23127+145065]or cv(21794,23127+145065)cz,cy=-22467,-22467 else cy=ct[102]end else if cy<=-14535 then cx,cy=ct[101],ct[101]else cp,cq,cr,cs=0,0,0,0 for da=1,ck do local db={}local dc={}local function dd(de,df)dc[df]=de;return dc[df]end local de={}de[1]=3 de[2]=2 de[3]=0 local de=-39355 local df=0 local dg=0 repeat if de>=-13918 then if de>=43288 then if de==43288 then de=db[93]else break end else if de==-13918 then bc(cn,da,cr)co[da]=cs db[93]=dc[-13918+10822]or dd(66316,-13918+10822)de=43288 else df,de=db[91],db[91]end end else if de<=-39355 then do cp=cp+bq(a);cq=cq+bq(a);end cr=cr+bq(a)cs=cs+bq(a)db[91]=dc[-39355+10822]or dd(-14429,-39355+10822)df,de=30113,30113 else if de<-14429 then de=db[92]else cl[da]=cp bc(cm,da,cq)db[92]=dc[-14429+141893]or dd(-13918,-14429+141893)de=-35820 end end end until de==66316 end;g[4671]=cl ct[104]=cu[21794+276136]or cv(38233,21794+276136)cy=-32669 end end end else if cy>=-28320 then if cy<=-22467 then if cy==-28320 then ct[94]={}ct[98]=cu[-28320+145065]or cv(-47800,-28320+145065)cy=62600 else cz,cy=ct[103],ct[103]end else if cy==-17631 then cy=ct[100]else ct[97]={}cw[2]=(cw[2]+1)%5 ct[101]=cu[-17399+145065]or cv(-28879,-17399+145065)cx,cy=-14535,-14535 end end else if cy<=-38377 then if cy~=-38377 then ct[95]={}cw[2]=(cw[2]+1)%5 ct[99]=cu[-47800+145065]or cv(47928,-47800+145065)cy=-38377 else cy=ct[99]end else if cy<=-32669 then cy=ct[104]else ck=bs(a)cl=ct[94]cm=ct[95]cz=cw[3]~=1 and 38233 or 23127 ct[102]=cu[-28879+13994]or cv(23127,-28879+13994)cy=25610 end end end end until cy==82027 else local ck={}local cl={}local function cm(cn,co)cl[co]=cn;return cl[co]end local cn={}cn[1]=2 cn[2]=0 cn[3]=4 local co=0 local cp=0 local cp=-36342 repeat if cp<=-36342 then if cp<=-49678 then co,cp=ck[106],ck[106]else m=m+bq(a)do br=br+bq(a);by=by+bq(a);end bz=bz+bq(a)ck[106]=cl[-36342+348530]or cm(72262,-36342+348530)co,cp=-49678,-49678 end else if cp>=73577 then if cp<74034 then co,cp=ck[107],ck[107]else break end else do bc(g,4671,m)g[2663]=br;end do g[6766]=by;end bc(g,3880,bz)cn[3]=(cn[3]+1)%5 ck[107]=cl[72262+86388]or cm(74034,72262+86388)co,cp=73577,73577 end end until cp==74034 end g[6378]=ch;do g[5221]=ci;g[2604]=cj;end do local m={}local br={}local function by(bz,ch)br[ch]=bz;return br[ch]end local bz={}bz[1]=2 bz[2]=4 bz[3]=3 local ch=0 local ci=0 local ci=81457 repeat if ci<=-15615 then if ci~=-15615 then ch,ci=m[109],m[109]else g[4502]=m[108]l[ca]=g bz[1]=(bz[1]+1)%5 m[110]=br[-15615+15609]or by(57336,-15615+15609)ch,ci=74992,74992 end else if ci<=57336 then break else if ci==74992 then ch,ci=m[110],m[110]else m[108]=l[ca-1]bz[2]=(bz[2]+1)%5 m[109]=br[81457+277751]or by(-15615,81457+277751)ch,ci=-17327,-17327 end end end until ci==57336 end ca=ca+cg end end end end f[1774]=l;bc(f,7789,bn(a)==1)local g g=bp(a)local l={}do for m=0,g-1 do local g,br local by={}local bz={}local function ca(cg,ch)bz[ch]=cg;return bz[ch]end local cg={}cg[1]=3 cg[2]=2 cg[3]=4 local ch=0 local ci=-24845 local cj=0 repeat if ci>=-24845 then if ci<=-14637 then if ci<=-24845 then by[111]={}by[112]=bz[-24845+186492]or ca(22433,-24845+186492)ch,ci=53827,53827 else cj,ci=by[113],by[113]end else if ci==22433 then g=by[111]br=bp(a)for ck=1,br do bc(g,ck,bp(a))end;cg[1]=(cg[1]+1)%5 by[113]=bz[22433+55421]or ca(-45951,22433+55421)cj,ci=-14637,-14637 else ch,ci=by[112],by[112]end end else if ci<=-45951 then l[m]=g by[114]=bz[-45951+317563]or ca(-44300,-45951+317563)ch,ci=-35321,-35321 else if ci==-44300 then break else ch,ci=by[114],by[114]end end end until ci==-44300 end;f[3540]=l;end local g=bp(a)local l l={}do local m=(0)local br=(1)local g=(g-1)if br>=0 then while m<=g do local by by=bn(a)if by==0 then local bz local ca={}local cg={}local function ch(ci,cj)cg[cj]=ci;return cg[cj]end local ci={}ci[1]=0 ci[2]=2 ci[3]=0 local cj=0 local cj=0 local ck=-25378 repeat if ck>=-24008 then if ck<=-24008 then ck=ca[117]else if ck<78963 then break else if bz==0 then local cl=bp(a)local cm=b(a,bh,bh+cl-1)bh=bh+cl;l[m]=cm;end;ca[118]=cg[78963+286509]or ch(-15474,78963+286509)cj,ck=-38115,-38115 end end else if ck<-25378 then cj,ck=ca[118],ca[118]else bz=nil bz=bn(a)ci[3]=(ci[3]+1)%5 ca[117]=cg[-25378+286509]or ch(78963,-25378+286509)ck=-24008 end end until ck==-15474 elseif(1)==(by)then local bz bz=bn(a)if not((bz)~=(1))then l[m]=bq(a);else bc(l,m,bt(a))end;elseif by==2 then local bz local ca={}local cg={}local function ch(ci,cj)cg[cj]=ci;return cg[cj]end local ci={}ci[1]=3 ci[2]=2 ci[3]=3 local ci=0 local cj=50084 local ck=0 repeat if cj>=29587 then if cj<=29587 then break else if cj==50084 then bz=nil bz=bn(a)ca[115]=cg[50084+203556]or ch(-14327,50084+203556)ck,cj=50199,50199 else ck,cj=ca[115],ca[115]end end else if cj~=-14327 then ci,cj=ca[116],ca[116]else if(1)==(bz)then do bc(l,m,bp(a))end else l[m]=bi(a);end;ca[116]=cg[-14327+334627]or ch(29587,-14327+334627)ci,cj=-49496,-49496 end end until cj==29587 elseif not((by)~=(3))then bc(l,m,bo(a))elseif by==4 then local bz=bn(a)if bz==1 then bc(l,m,bq(a))else l[m]=bo(a);end;elseif by==5 then l[m]=not((bn(a))~=(1));else bc(l,m,nil)end;m=m+br end else while m>=g do local g g=bn(a)if g==0 then local by local bz={}local ca={}local function cg(ch,ci)ca[ci]=ch;return ca[ci]end local ch={}ch[1]=1 ch[2]=4 ch[3]=2 local ch=0 local ch=-27466 local ci=0 repeat if ch>=-17246 then if ch>=84702 then if ch~=85982 then break else ci,ch=bz[122],bz[122]end else ch=bz[121]end else if ch~=-27466 then if by==0 then local cj,ck local cl={}local cm={}local function cn(co,cp)cm[cp]=co;return cm[cp]end local co={}co[1]=0 co[2]=4 co[3]=2 local co=0 local co=-41808 local cp=0 repeat if co<=-35387 then if co<-35387 then cj=bp(a)ck=b(a,bh,bh+cj-1)bh=bh+cj cl[119]=cm[-41808+211489]or cn(-35387,-41808+211489)cp,co=-12973,-12973 else l[m]=ck cl[120]=cm[-35387+342560]or cn(-24673,-35387+342560)cp,co=47879,47879 end else if co>=-12973 then if co<=-12973 then cp,co=cl[119],cl[119]else cp,co=cl[120],cl[120]end else break end end until co==-24673 end;bz[122]=ca[-33681+221805]or cg(84702,-33681+221805)ci,ch=85982,85982 else by=nil by=bn(a)bz[121]=ca[-27466+221805]or cg(-33681,-27466+221805)ch=-17246 end end until ch==84702 elseif(1)==(g)then local by by=bn(a)if not((by)~=(1))then l[m]=bq(a);else bc(l,m,bt(a))end;elseif g==2 then local bt bt=bn(a)if(1)==(bt)then do bc(l,m,bp(a))end else l[m]=bi(a);end;elseif not((g)~=(3))then bc(l,m,bo(a))elseif g==4 then local bt=bn(a)if bt==1 then bc(l,m,bq(a))else l[m]=bo(a);end;elseif g==5 then l[m]=not((bn(a))~=(1));else bc(l,m,nil)end;m=m+br end end end f[4733]=l;for g=1,bp(a)do bc(f[5697],g-1,bu(a))end;local g g=bn(a)~=0 do if g then local g,l,m local br={}local bt={}local function bu(by,bz)bt[bz]=by;return bt[bz]end local by={}by[1]=3 by[2]=0 by[3]=2 local by=0 local bz=0 local bz=-38089 repeat if bz<=-16785 then if bz<=-44590 then g=bp(a)l=br[125]br[127]=bt[-44590+54153]or bu(-16785,-44590+54153)by,bz=68299,68299 else if bz<-16785 then br[125]={}br[126]=bt[-38089+316295]or bu(-44590,-38089+316295)by,bz=28185,28185 else m=0 for ca=1,g do local g,ca,cg,ch local ci={}local cj={}local function ck(cl,cm)cj[cm]=cl;return cj[cm]end local cl={}cl[1]=0 cl[2]=3 cl[3]=3 local cm=0 local cm=0 local cn=-11395 repeat if cn<=-18527 then if cn==-24684 then m=ch c(l,{ca,ch})ci[124]=cj[-24684+175302]or ck(-13757,-24684+175302)cm,cn=-18527,-18527 else cm,cn=ci[124],ci[124]end else if cn>=-11395 then if cn==-11395 then g=bn(a)~=0 ca=g and 1 or 0 cg=bq(a)ch=m+cg cl[3]=(cl[3]+1)%5 ci[123]=cj[-11395+306373]or ck(-24684,-11395+306373)cm,cn=55286,55286 else cm,cn=ci[123],ci[123]end else break end end until cn==-13757 end bc(f,6444,l)br[128]=bt[-16785+54153]or bu(60710,-16785+54153)by,bz=62060,62060 end end else if bz<=60710 then if bz<=28185 then by,bz=br[126],br[126]else break end else if bz~=68299 then by,bz=br[128],br[128]else by,bz=br[127],br[127]end end end until bz==60710 end;return f;end end cf=-41850 end end else if cf>=82069 then if cf>=85110 then if cf==85110 then bg=bf([==[\-i9:W?;0@JF,O@oT/qms8PI)6i?uaLC=dc&0_)Rs8W*1+ohR=+[^ql'f&b0rsoi"7*%Sla:EF76\GkfaSuhOruX!aa?tXi(&C/E+#6gZ:koMq3`O2IU&P'ZLAF7ZlHl47*U;#OTgEOnd%N:<Qr'JDKaAd^:kB2C$[TVqQ8ab1aY8=CrGY;0g'&?<-<NOa3>2;C`t&amEQA^k+V,=Y6\Pp`10!I6+V/_:_h8@7.V.a>)CC]'#p&;mTu%d1<63F[_?fEo+!u(H6\btr(_%K4Pb>pI%OGct)=#+m$550ga?tXk)(O^@6N/&VFI:E.R!f$aQpZQ;`F3jUDl>?S.;/dhTEIVs-jC[r:>!o!80F&V,=`t5NQ7&pLmT<<`rmR`(r\k\%<:/7_W$.YY/fN?69*'o_RM*7JrL.rX&=cKW[\:+ZhPau#`-kfOGI*aUM"6GPg7-WO<W?`N%A?@1>rIDlQFj:=sF=t#XLt2(_eDeU_ur@ZY?q,8&^T-;MRRr;]=sM9"&hO==?O,K$Z?_5iG9;/SS>#WfbSJ7<`g)-A85Keql*e&^3umTJ0QRM+!#-1YMpY"i(qNg<Fq0K-MEh,b.CDChSYu,`J6n+A7Ck[K9nL>;QI4B+Sl&OcU]eH4l.eY\E`98;m_kH;[,r?(S/L;du%38usNI^;-TkmLG0jkNb4qktEV)>,W3J&n+k_6:FV$o77aQ23b@u1l6s#3)hb)\hG)B+u#EM25rQl-qYmX'VYj7RN\5)@'#.nYZK;p_5N,hPr5Y.C.6Yj(l8hj"TjA]&O6WJ$_A"U[dAXNUNTDO,"1_=?!X+Alr0mlZs)IW(6nq^nUf=Qg;'J/ha/="Q_eMS/8coZg(m/fSCVQ,V@F"_,SKb+*<HCK`'m>7,4,ZA^_.@o>6N:a+DQ]Ze9](FE($PAifk([B;.Fo1Qbk?C.k6kU(kYJ,oj*h&.rVo16ukfG$L;aEl<o6$VXc#ToL>(`hPsS75`#)6E*qgD_#Q*;d$.r:dc&KZW>.I8l]`.e$>r3/6'QrTNf_hLP7`SX-<r;CRQb>abWKA+rsm?f(rQSTe/i'-J1fWGXKo08@pb]CEKfe/3:&nSBh;1:aj`(=V@^M7bUBV"<fab_'E'J84f;-V8HCYJ0=p$BFV5"<1t.PW.gP65d4AE]Qe;@3eO,7@q8u#BHi.&N]*VI6u1!Y5R:PU==\AVCTs#o7!,8k'nnDB_@o'q=Ap[NF:rO,JI7nIm,;?G$7l2Z#dnM\Y6a'bWgE)eX:_+Y>ELJU+Tq?t1gn/d-ib\8@_osh8#N$,RS]g)WsSpK6:!1k@8odlPnBrW!h'Z0!J20mF:r7(L_lc;Kc'0lfRSn"(gII\Mt<L,0k62SP>Q-"2FZsF<EDpLKbW[/TSk,-mkfoC?4?sL;MRi&TX;GK:lGu$!Y*DKTrEj0JgMs><?uZc1e/mc)MO'IMKCfrARe+C.^[]/%&0M\'^!A3"]8)K7mrV=,W^emJH?js#T=#"SeD59KgA!2)A2=?"!*)M5p:ad'd]^`#5rDLbIb_5k-7R[qYS2hSQY_emNOZtU-j5gMO!aIXX*5d?,tV+98pD8;@8F;DN*7,,FZr\/"UKm.P9DRWB"_9;L/-.:$-e_/_nsdIF62iX52?2`C[54mG)b45+ap@BDoEMGkmIlH^@M%$SEN:hqP.#9%,/g0k%mCO$:3rhn\/Nm0s6VP/`9b'AoZI`pIP1<c6>c',M`O(Z$$rjop)!a]54AD7c1o*D66#7L"J1phceZD``!2\fiF?qtdk@0sad=4JJ,Qi6+ZgZd%m'li9/S(rc<eC<-ecak0fQc_CUcaSbtW'"l[HS4=2933(2uJRmM2AQBKSfF(R#C/H4^<#-AT5Y'bED)h[K8cSsGPW]:KQr!cE;b5Ib5S+R4$0\iJZ\AH";eA_heruaa+BbFZIQ,AoIN\555j$aMb]<b-U+JoW6b:LQ`;,9511-n&o41c&^qh!Ghn^33kQl-`"GQo35#=Xf7aM_iMNEopj[0^o;M^DGOA(7Z-]1:p70Fb>n5/h3#RLP8":0j7&4+nZKn<h@"G?nEKI!7)KFjh"&>C9Y&qV5O63IS##6Y;6#_Wa5KE*/:arUfi_,!T7!C8,a+<UpqOssd.c-m/bq9Q+`#K)**kZ=Z7Y?,=.FbqDp+qZ4)+Tr>Z#Qd<u&JBa&#_G;QKEql-&0_YsP!B:<#XXPX2EEd9)>]`ASu\3%%hB+DNEj3'JZ<m6EoD<fDXb6X]p4561Y5V,=Hi?8e]Zo=;nH,c&Rh#da>=s*Q3$nP1aooX2B9R:NaUUE+TXnr&;8!9P/YgK,9f)[+]sI-G0&kShUA`1']tA\i;VYo.1E^rq_(`PhI&sc:Bf#q7K>@!(5LcdOD*d^:>t@!k`/N[WW9/p7KU(adQW2U0lnQae%7r:eL$>7@Z8uL=J=P"Anq8+"E'7VGgLP22`3=Bj%cneF1H81neAoV-Z,*h/_0d9ODr>H`$S@d%r"ji/Y8?#lpZIcQl*Rh`/,r-[>63T_U0M0=P4[oMP(LhF;.t4ZJk&kAlJnmACeOm$Re+K<J;P5!i"9L!PgrUQm+fS72,`U&:p/U'GLO51=S]I9*@MACqh4dKL@R&A0)nUH*TV?fl.0;?ao.\j'tmN!a1*/g9C#=^;Hje4H62e[qbP9T.SocVfZ\R\31j<];Z.hcVKoKdFR*]0R+kqM::VZ^7kDYolVX/f^IE&4,:;RDgV9S;W[o?1KRb3ad09%P[(>L-dGI&SMNR>KRWH;ObIrjfH:_.@%662*!.OM/-:AF6m)a@![&Wmrg6*9"@*M`OEh0UJ:JaFKEqV^KLCWX":t\Y#RJPr4co_5KHS?)&JEd\$'Z^[643FS?#YW3p@CaAZ;e"MR3#?:ZRf4R17/HtMSL;?J`?d;jqaVbZ:QgpBY#FoQg<>/s$kP!l.'>m2Q_@9:V5)t[\iK0;"]0Qcp)P=r/t<rFuR+_4RT^q3:;_,>gc0>BsR]_c2;k#kTs:R[MhcsKseMQ"=%(#a/:tND(@Yleb61OZEEl[,)hIPJ6h.9R5I<]cs+eZp`pG"6t1i@N<5LqUT;/Bqi%^a^E'Mhe1lcs>Z`RIj"@JUjl7_k?s0#bb$7_87p@e:Wj=(]hqY_dfqP6#lXX#OqNVH_PW.u:4Ep,hT`ML%Cc[JMMO4-*ZN73n:tJ\UY2Bi]bM3DIVJTMGIS6fGCTdZAaf.YdOB?L5)Dpieat'p6YD:N$Drn-LE9QMQa84r+"np5O[@lBeZflpn>`c:ZR4Ukk&S>0'i]I\po=Vm5%5AOAoI4YG^lWL'`[N.dd"%rJ]A]tCQT+cfm<A922I9Nb5@es7hIt0XmM;ig=3`$`4f8C#i9Q6Aa(e+G887\7^'iDNoHbGq1-IDZ>jcR(+`>9*@BfUe1UTKa@UKaTnq$ppb]D"kXNV_B`-tolC#nmi0,ol$n(orFf@AeAEg"Aoih!8=Gk%J"+ZsYQ!/DN&/b#HI@[,B$mrQ)N?<T5A<h3I/`SjNsK'aqP[S#AE!s*VJ4mBm2Cl1012_RCOpIYhY2stUSlRs,=ZU5"V</'$(Oj7Jb0'TWL3G5P*g4ep1:\PZ$*IliW9>Yr]`;'>aVA3ufaYd$tqY-dGU@>Z5(HuikXkp:[)tfFHH$i>D'qlL%!/)U/AsOf+MRRDDD,=EUU;kauNLAhO@VKJKWLC<k.^fk^n74nl,n::XQJAVAet&6HFE&Q05Sa5Em4&p+M;Aa&[?Hun>B2?Z7uB,qUB(/Ih<o*)D5FdYUjr:FcC`fIKI%<<OUQYV3IKo'M#lHO3QXXo%22D<5[1\c8rmXQ4JN+pd$9hg&OB/E3_&j74;UipGW!%,46\BY(17r^m[lSOU8<<mUdd$]3/j_eRBluOLZ/d+,BX'8K=8l[CXXo"Vc0XjO05c)mBp5cU/>0!l3K@2itS\aY+@dhCpfe])HD=^Ro^js3kA*^9^Opi\'GVhn(tDIqU"6iMl!>HVR5[5=?sk!nF>mlWS-X%Asn%RrL-ifn%+%UZaS6mPRro[h)i2`fLe-i$)I7Pb5+i?SLXq@4<7oCdu@1>rIVNQDjQ;./[="e993jm#@7/6B82)*?sp[cV""K:*/VASc4DY9i:d\jW/?=N'B`-Y\&?gfB@#s`I*CW5B]KMk^nj,Q(g'TW\?a1,-u9`I_Q+k'*>M^+9XZe_<E\Q<:0_R/#u;@u"iNu<?<D4UKs.(f6N_mU]P\?]T#aff,]tB*ifLs`dj3jql4CbCMSOl_;i6;?49Fsg!rI`)p)"L2!YT)J3)r;NAdEnhK)c_oTNc#c#f)+(bKs'R11ge'1nm6*bR$W_!>O4g`'t"hKF"4o:^FiJ#W#us!1G)S,QNE]&53@+LdaQr!!LF'nNI0V&M91VaV8b<S7`"g+[bBPcL8i0mlndq^:X+GhtlQ=J!)HLqu2X_qsaDo?Mrsb2toOarEm;<i58q%pkQV4o9HeW\bjLL%nI91]91Ep]nue$AA/X_37%%aKZp)?6F(am5QC@mpWBshJ+;m'cb8rIqfcCn+C;hYjU4;;(/1XGcrBH5rhD],o)ZW)e"?I$B4!jsb3sfO\t[f39qh$;=+5/hX7oru.fT(pG@147kKePF@/9Q;>CkRVn+D%25PM:\]dBA#ro)&(^%f3P?462YqodmrjgAG[q_Ri!(Ol+uO.Z=?LHkUXB>=K:a'T\^+4%Xtg989(qtmSSqWS67Id^&C7!8(:ZQHjSl<@UYpZk%kqX!eqfM>iLPC*9fci3:u+92&2pYtp3IJ)80?N/XVhu<%l\'4b=Ief/;qr/uAfp@3^X1Rj"q1im<rK4g>pTK)4IHq-LiZ!1Cld((-oCXnXIe]E)g[C<?Idu+IYM@HRp>X[W^\IUT?bGmEQ_gQ4m47lHn)W#kEJ4?9_:k#2634MPYp<YBEa1t_[PW@glq-r<#P4,_ZWPQ"BqL@i7ggoNHG?.jiFQ&YjrukA%IpnUYUD1=64d``63%]k.K])]#QWTbq>pd"TA+k801>hm&H=+G;\FTuBiIPgK`'AUpE[nTTn2.:N<%K*0hM^I.Ko\7)=/uiqo0$CCIJ2n6L#LbhSNg[H:(^3&+Z:e\(=/mPs;2I'E[?4&s-Htrlr+MKaN8\s"Nm[oBJQ!n<:Tls6JF#Ie(OoJ+hGd_5m"[pO2Q1bN<)%h!<gb^YtV-p7A`br8fU2Y$M'Rmksj#J!/.%kO0-Ld\$Qa=T=rjf2$kngc,9+NTYq,ol%&4`htJqoT^c"([c_@5I(+Vlfh\fQ@'H]iMF;<ou2FD47D4bs1Ra1i\/'Ort3$FqOQfW+ae5cFTiHMgTN>C1^TQ&*6IWP+d`]s#W(;cV\ftAmtLs$_6-<KZUPQhph!$Ab:nWl*JA;HkCFjh+r#Wb:s]^fV+)#og^)"5"[%\Y<th#4*QSh.WY!&t;8-765S/J$70!aM+qa;Z:FIJ]T-_H$#Z(eY!'uEK(]s8!oCca"FsC-n)T"bFR8g7TZK.t$N5[6:5m[CdF\p<=MoF-hTF69>"OB/,!??*:#S!8E!.J]LO"aLpA`a?7lQ`d/#:d6J7o^G#J_F#+bS1Yn777_!6qD];M2#@t9/Q349@P%<n<m;/L!MjgB#H`J7tgtd7o"RLrqF-*WZi&pDH5]?l`nFDqCde:a-2hgbs5r/OmeP*XU*=n+Z+%&7,l3+6D>%pAPLYN&LIkT5Bt^NN'hM[INBR>i]o29[mtY]%UNq\;BKV_Df\5X"mCQ^e,C:uObU%B'I8T+B$"1U_Abo9;Lg]8K%eq=!;o!/L'%94LZ"AH!-Wa?3%^e"836n7nGiO-]o!F8.?Heb^dc[9,Xitkn?^NIh4^JspI3A+4!Mn1co?DM]+T$Q0mG:UC@G.#a\Z[XpF!t!3@+YM'EOCOZaO7;kcf`3B[#&.>1^:=&t7k5m_6qM6:*-C'EN-\)JN1Y/4+t/,,*5a&^V)>VgeFo6V>A0,jKj.et*^O+sI0bg`s%_JC!*\0i?:spq!@j^`p_'L)G"W1aKYD<Oa4r($3dR6dj&rM[K_V3)<!ON>Xd2/`g\,*"[Te6F.F9Gg2UEWeM>nI,$W#_\+Imi"ud',?Y^R0V]Dod/GF:k'/JlkH**6U8&:`UnFIc+d+]BMV5*uBjF]>TV:kmSIKd2ns"F*6R]aB>1nTdG,HM&+K7L@&UQ,U_S?Jr&HMEsZA9Z9"jIF?'TZ()crKa1.R6?$'N%ho5nO/@_?^mRa?7-uN#5E7^:V3$O+,Gu_ljAqRO@B,[<rNa_:[er?j*Mu"%N@j]"lB#^\!12<?!CpMrd':`R@,"kV0`b(rN=R'6K"fM22277Hm3F'*V2%AWn?BE3d-2Jk]X?0ok!7%Y:>H#;*LlBW4OW+1dnb,mJs5p-o4WoY_GQM])m/b,L7("U..I"=ODU(mQc]0?eal4HUcU+t%uT51+c$-O(TA/&DPuaFGN[#Uk?s9P+V]L5(SO/K!tthCrGLUehHb=BJC6>uQ\];%\Ni[-<)D7R[TH0iV,\JO%O!k8\%u#`DS4.@/tL/jpfSQ7j1RbkBI?%,>)kT0bn!.ga+g6:)>bp)lGF0X]MP8&QSY1r?C]?l/t'PnHM;,2!@nM0,,pFotfGj:\_Q=9LZsUF.9S1']gqT*P"E75G;N'L&t8A%Nu$hF$g28*?M=ZnL&^a1Ihk#ptU",+o=MM::&7Zq;f)f'S;GRXbH)&Rd:6>Rl_OMR5gj=?;/YOC,lDbDeZ,fKKti4\MMcTU%,i$9g<X;#hMdJ$(@f)ss&.Y1n+Of0QIrdQe,^K!rCT\3X`LU(q6'O04=EZAp#:M@o?L@h-UWc/;%.VnEa^OK<;o*sq?&k,8b3$[l@/U[NIBZXtHZJu"JD"MJO%KHZ(\kqOq3q"CC\71@9s\cSZAOfAQ"5>9"$oc5KiMIi']Td-NM"B_@bV<:<XY%T$9dch.5-'W"WVIQne9!-HDPT'=<0,]XoRTZ[UMGs<NY=D6[WhHgDomC/]O+NIuO['5gc\'^uiPQg6<Z7@#ZNs?PhclcXYemt]jj"Y7=@,MRe!XSTG=P/nO)ZQ*f];8gprl\m3A\#<i8nMCb!_JS#'b#rRZC4F2HM`uM610+HA(BlgmoAR)`Tch7)T(11\1/`dDMKf>E35><VXq\"O+E$_aZFr(t&+DJ.WQV3LE@U(rN!P!_hpl<`6Foe=qNN?XLf+]`=;OC2c=\oP,%g&T1?De]*N@"J!YRB4K4.03X;mqtrai3t8Z>d64B/c9ElD5NlGA&oCp2G10=-5UY[rCU"1#R2bZ&'3KCcf4hI!H!YHWKG$'Tr1p[*n_am!p4rL3ou4V,^([2JHAUe^'C"5.=K\'e#\K%[3WUYgEckpO#ph-[>b#q&li3QiShi?`,V0N,me^uAZSEY\`(tT#?7;-5_<qd5^9h;P<tPuIk(3fZ/i?pGDbBH)KI^*,gU_89Ib.e;Hi#9uMum.kWIE+gNHf_!nWN9d!.Jb'NO"\Z4M:JhS#KcF0$eFg\2dee$4\CE:T]S@H=>:B%I:L)HN9@F_`LC^B/@r31YK?Vo-V:HS(?of5#LYbF1s(YG@K1/&$&#qTA^PO[p+eq(s'TYc#&8rPrp[%I*"ug%#rpU@tILeG%E7d)U.kl?cVgY^"mAOCZ:UUDf#sP(c`NPJPW56[lapKKLsM@>YSN\dY2:6M)S2==>[umm5jj&HDsZJjW?>e=7Q?e'MBnaEg9/G"e-Kmmm*uf)C1-_Am'lBOn-%'@?Uslm+>DKfS0aVl-9RN;OfZ43/`"0&B@3W?Da;Ii&CTFT!tEno\Z)e\"]J`"B,/Aar<EP23,6rhh5]I.g?;\Tf)6%/!IT&[_5m/(53k!3gk*8'lMN&Ri</MXLAF0g%C;@pGAJBSn`%D4^D0TX9lcgI-752dV:J![M]/@6K0M\40kMU_AkrR0tB.#S!/)]E37jEdiJt0ReO67lGHN/YS+1P*1r?q;sgRc6ilT8iP`bi[>*4`<m0?c.NPOIVG?=K*qDIM_JX"7-!\N_8du"5'-(kM%5rGX?&/qbqKl*''tRN19/\E):'Ai#&T;[%ZoX^L\sqK_ji_[eG19/eD"72d+VOut;A2o!YO1MqQAWLjTN]jl?:f.YS.;KUnhYI\Jk1j%0cS>kP6(-r(hf<+_b.t.1_?0!Dg\RY]pKW+42S4GCCh8`i)B%a'W_G89Km)UO/MU4\*b_>cK)1LU$O@Je2T07D;osRcPLJ/cA;jH^:m%C@@*_cY0htnD<C^e'4*lORp5(bp=3V"V9,cXJ\5F1&lYi04Gt!gQC$2tk:*n`T;Bi&O#qt)K-tIYfSP_TM2o:ulG4F(8lMR/<>*L6WNM$!eb%Re\3!)YS)*!+J67$$BJ<F](6rmdO1+9+PQ@;1VaG8+[N6M.I?<5Di$3;\AE_P-rj0(0%1WB@/t.$$8>]okG\#b%<(QppF;4Z7MQ81DSN]&En6No]@dhN?h&HF4kKH:l$Jr<[!Ue0l&FWE,MpZKqRh>(Q#jUPK'&:?JJhu1[=RU8.f[0pm&"F__pT)ae!,T?CqLX?3/l[F[GHXfbi#(G<keu#6(u1Tt*7(aJ]K&2ii'Tej%/0.d/DQl$jaqWMKK2)9FjL[Y#WFF.`pfFJ`Zt<<oU97DZ=%ko!(nRH^j;6$kSf*Njltd+NYJ&t!H%![$Ps92Gb]+*=&rVdYT'%8pi(7G7'XsTG]Lrc)oDY7B.&I'bdcY.E3_c2#K(;`?;EP=Po>KmOmslcdDF!"aCNs2VlJd`1\fOMGdm_$Uj%^.P8CD5[AS.G1V)2Z-Rt!l$3pe0>eP.DPY7m7:V+RSk@S!&+-#.r%_rMq(7LlZT/\QEi*j-tk7>?=*4S!H!DpMI_R(UK%,pU&n?AG@_d!#5S4e5-S(7uH%C[ODiOW7BQL0>5XgP0.il/;,!N1jl>_<n9;[5Lt.U4jIn=IF@I3L[n=:9+d?u5C\A,]S,f`OW?/q")]MoFNq!:R0fDN3J`Ia^AtgJ#qQ,fT(i^/BpLJt&27A[5iY$,AI(7Y9k+-<O%M!+SX;l'nI"NZA,0,.N+Ii;'pFP0@&F@+@+!RB;Q`Jn*82#^h7)=7tc"h:9\I(3Bc)gLU0Id*69[;q68oc#j2Rs5$bhIR97`,`Qe[=^!hK5%_:[\3O<j(ADR=MVW10<<&Zu#H:#Jf(eGX"aFASCasm9nH"3$$eGm^Uk5'_;n[G&csW>T.B_:WEFRB[0GHH7$p.+2cd;?a)>Q9%mK[,+/c:lcK*;A&.L9+#gdW6TVDg;$HSh,OCmrYJWb!1W.QB:OgmhdJ;FC2G7C,+%_[1;6.KIr*X+VZ\)J'Jq%WNg+%n?]Z_;(deY0&W*kQLu3GD^t!Yo.aL#YS)Upm>a'=Kl]%NJg0Oabe.=_3:W[^DssG>n.%n1M;Ia)7h#:F##tT!;O!B#je\:$bh@14*1&d$/?i6#t'c_Y0pVeB#gMh\>t2dJMFsPF-&0kEbiOY+1KUR]juj_HH,!@l@#Y^Vc-JB-&&;Eg,r[cm["3\F`M0lk1"30AWk/q)=5SLm&EjgA2_"s3*jg(-O"!XaMO2m,l-;6r^7aF.lN9;!nQa)g(r^b)6SqRg.44l.e\X-X9t,/P-l*Q/S9WTR5(s@HuEbcNCp]^n%AnT70%=\L(>bKWi!\W:Z?'lHI05HB;/WcYnQmgOW"U.>/kD&.24?6B1(G^,"WOAko4cs*<;9/^fjBCIGCtgdoO<:'Pm!IR9QG-2m+%%aAf_6`d0Sne`uGW/O)!N'5Y8@[Ka0T_O9.7!\hPS.ju'ij,':Yg`jIO>JX1^+[rSW<BKW<6Ga<96S`2lg40YV-4LYd5>F0p[99Aa3to,I26d4!9cLu@kd<miDiB$lUaIMk^oB$CaX7SApft-e++W*lL2chNfX\?;;/W0hY"m=1*Jk,G]e_Gb\L1#:YmE!GShBhj!h5^B7\,K$28@k)ZPUI'kBP/EgJ`\/4mLMh1\kTJj:2\-Nn2bt06Q`AT+q2r#f&U#*@`b:j/E`R[H,U:6/Na=YXj04MMkJE8UX$`@?``V<G)?rW=,TeF`+Y4)qj&(1E*nhg<e3P,[?S//FqTVg[dG3m9k6j\MLQ:o`_f1/+9W"*)+V6&2*+n]7'Ki>A6f;XW=>"A!'QRFlq:N08JAh>IpN2)/YEjSNGE#)Yi(7h-<M4Z=<$:M-JBS)Y(h$V+-&)%Y[U\<)?\VQF[?mN``DSEMd,-]<G40YW#^n\&J*]MAaHXQ4(Y`l`nCX1g\m8M2;O7LCK"WE*'Xa]h=&h\u9r>XSOp0/Dm(%,%90Ggq3(F]JE]o$ZD+,Ii((4#91>-1`*V=rA<2(C+G]Fj[]QV%O=1iM@2/Dd>BU;'c[.%-="E6MS^\MLrXnEO^),&gloa2*e.7aaR`-YK^O(Pqkbj&l-SFo'3Z]PaDK*t,!=#^VXOh('eSfISrdh;nr_Z=*tX=fZ#5C6mUGQsYH5jNjk?I(87?1'kOQ\tCXA,a/dY?.ptXV0"\h[JTq8-K&pq0369Zi?7-FniVCFD.IO&T^jC;8us$%3>JD^9;Ht)1:!<]==])bh=1 bi=nil cf=-37544 else bm=nil cf=43890 end else bk=nil cf=35433 end else if cf<=61792 then bf=function(a)local c,f,g,l=nil,nil,nil,nil local m={}for bg=0,255 do m[bg]=d(bg);end;local function bg(bk)local bm=-1 local br=256 local bt=257 local bu=258 local by=259 local bz=260 local ca=#bk local cg=1 local ch=0 local ci=0 local function cj(ck)while ci<ck and cg<=ca do local bk=e(bk,cg)cg=cg+1;ch=ch+w(bk,ci);ci=ci+8;end;end;local function bk()if ci==0 then cj(1);end;local ca=y(ch,1)ch=x(ch,1);ci=ci-1;return ca;end;local function ca(cg)if cg<=0 then return 0;end;cj(cg);local cj=w(1,cg)-1 local cj=y(ch,cj)ch=x(ch,cg);ci=ci-cg;return cj;end;local function cg()local ch=0 while bk()==0 do ch=ch+1;if ch>31 then break;end;end;if ch==0 then return 1;end;local ci=1 for cj=1,ch do ci=ci*2+bk();end;return ci;end;local function ch(ci)local cj=0 while bk()==0 do cj=cj+1;end;if ci==0 then return cj;end;local ck=ca(ci)return cj*(2^ci)+ck;end;local function ci(cj)local ck={}local function cl(cm,cn,co)local cp=ck for cq=cn-1,0,-1 do local cm=y(x(cm,cq),1)if not cp[cm]then cp[cm]={};end;cp=cp[cm];end;cp[bm]=co;end;local cm=cg()-1 if cm<=0 then return ck;end;local cn=0 local co={}local cp=-1 local cq=0 for cr=1,cm do local cm if cj then if cr==1 then cm=ca(8);else local cj=cg()cm=cp+cj;end;else local cj=cg()if cr==1 then cm=cj-1;else cm=cp+cj;end;end;local cj if cr==1 then cj=cg();else local cr=bk()if cr==1 then cj=cq;else cj=cg();end;end;if cj>cn then cn=cj;end;local cg=co[cj]if cg==nil then cg={};co[cj]=cg;end;cg[#cg+1]=cm;cp=cm;cq=cj;end;local cg=0 local cj=0 for cm=1,cn do local cn=co[cm]if cn~=nil then n(cn);if cm>cj then cg=w(cg,cm-cj);cj=cm;end;for n=1,#cn do cl(cg,cm,cn[n]);cg=cg+1;end;end;end;return ck;end;local function n(cg)local cg=cg while true do local cj=bk()cg=cg[cj];if not cg then return;end;local bm=cg[bm]if bm~=nil then return bm;end;end;end;local bm=ci(false)local cg=ci(false)local cj=ci(false)local ck=ci(true)local ci=ci(true)local cl=ca(2)local cm,cn,co,cp if cl==0 then cm=c or 0;cn=f or 0;co=g or 0;cp=l or 0;elseif cl==1 then local cl={[-1]=0,[0]=1,[1]=2,[2]=3}local cl={[0]=-1,[1]=0,[2]=1,[3]=2}local cq=cl[ca(2)]local cr=cl[ca(2)]local cs=cl[ca(2)]local cl=cl[ca(2)]cm=(c or 0)+cq;cn=(f or 0)+cr;co=(g or 0)+cs;cp=(l or 0)+cl;c,f,g,l=cm,cn,co,cp;else cm=ca(4);cn=ca(4);co=ca(4);cp=ca(4);c,f,g,l=cm,cn,co,cp;end;local c={}local f=0 local g=false local l=false while true do local bm=l and cj or(g and cg or bm)local bm=n(bm)if bm==nil then break;end;if bm==bz then break;end;if bm==br then local br=g and ci or ck local br=n(br)if br==nil then break;end;local bz=bk()local bz=ch(bz==0 and co or cp)+1 local cg=m[br]f=f+1;c[f]=h(cg,bz);g=(br==0);l=true;elseif bm==bt then local bk=bk()local bk=ch(bk==0 and cm or cn)+1 local br=m[0]f=f+1;c[f]=h(br,bk);g=true;l=true;elseif bm==bu then local bk=2+ca(5)local br=m[0]f=f+1;c[f]=h(br,bk);g=true;l=true;elseif bm==by then local bk=g and ci or ck local n=n(bk)if n==nil then break;end;local bk=2+ca(3)local br=m[n]f=f+1;c[f]=h(br,bk);g=(n==0);l=true;else f=f+1;c[f]=m[bm];g=(bm==0);l=false;end;end;return i(c);end;local function c(f)local g={}local h=256 local l={}for n=1,h do l[n]={};for h=0,255 do l[n][h+1]=h;end;end;local h=0 local n=#f for bk=1,n do local n=h+1 local l=l[n]local f=e(f,bk)+1 local n=l[f]g[bk]=m[n];if f>1 then p(l,1,f-1,2);l[1]=n;end;h=n;end;return i(g);end;local function f(g,h)local l=#g if l==0 then return"";end;h=h+1;local n=ba(l)local p={}local bk=ba(256)for bm=1,l do local bm=e(g,bm)p[bm]=(p[bm]or 0)+1;end;local bm=1 for br=0,255 do local p=p[br]or 0 bk[br]=bm;bm=bm+p;end;for p=1,l do local bm=e(g,p)local br=bk[bm]n[br]=p;bk[bm]=br+1;end;local p=ba(l)local h=h for bk=1,l do h=n[h];p[bk]=m[e(g,h)];end;return i(p);end;local a=be(a)local g={}local h=0 local l=1 local m=#a while l+7<=m do local n,p,bk,bm=e(a,l,l+3)local n=n+p*256+bk*65536+bm*16777216 l=l+4;local p,bk,bm,br=e(a,l,l+3)local p=p+bk*256+bm*65536+br*16777216 l=l+4;if l+p-1>m then break;end;local a=b(a,l,l+p-1)l=l+p;local a=bg(a)local a=c(a)local a=f(a,n)h=h+1;g[h]=a;end;return i(g);end cf=85110 else if cf<=69648 then be=function(a)local c=33 local f=85 local g={}local h=#a local l=1 local m=1 while l<=h do local n=l+4 local h=(n<=h)and 5 or(h-l+1)if h==0 then break;end;local a,n,p,bf,bg=e(a,l,n)if h<5 then n=n or 117;p=p or 117;bf=bf or 117;bg=bg or 117;end;if(a<c or a>=c+f)then return"";end;if h>=2 and(n<c or n>=c+f)then return"";end;if h>=3 and(p<c or p>=c+f)then return"";end;if h>=4 and(bf<c or bf>=c+f)then return"";end;if h>=5 and(bg<c or bg>=c+f)then return"";end;local a=((((a-c)*f+(n-c))*f+(p-c))*f+(bf-c))*f+(bg-c)local c=y(x(a,24),255)local f=y(x(a,16),255)local n=y(x(a,8),255)local a=y(a,255)local a=d(c,f,n,a)if h<5 then a=b(a,1,h-1);end;g[m]=a;m=m+1;l=l+5;end;return i(g);end cf=61792 else bb=cb[133]bc=rawset bd=setfenv cf=69648 end end end end end else if cf<=-41521 then if cf>=-44233 then if cf>=-41922 then if cf>=-41850 then if cf<-41521 then bv=function(...)return{...},k('#',...)end cd=cc[1]==0 and-12871 or-39736 cd,cf=-39736,-39736 else u=q and q[(function(a,b)local c local f={}local g={}g[1]=3 g[2]=4 g[3]=4 local h=-48878 local l=0 local l=0 repeat if h<=-48878 then f[11]={}g[2]=(g[2]+1)%5 h=48439 else if h~=48439 then break else c=f[11]for f=1,#a do local a=e(a,f)c[f]=o(d(37,99),(a-(b+f))%256)end return i(c)end end until h==47687 end)("\175\198\190\194",76)]or function(a,b)local c local f={}local f={}f[1]=0 f[2]=1 f[3]=0 local f=0 local f=87124 local g=0 repeat if f<=-32641 then break else if f==31224 then return c;else c=0 for h=0,31 do local l local m={}local m={}m[1]=0 m[2]=3 m[3]=3 local m=-46620 local n=0 local p=0 repeat if m<=-46620 then l=a/2+b/2 if l~=j(l)then c=c+2^h;end;a=j(a/2)m=69219 else if m<69219 then break else b=j(b/2)n,m=56337,56337 end end until m==56337 end;g,f=31224,31224 end end until f==-32641 end v=q and q[(function(a,b)local c local f={}local g={}local function h(l,m)g[m]=l;return g[m]end local l={}l[1]=2 l[2]=4 l[3]=1 local l=0 local l=87864 local m=0 repeat if l<=-28723 then if l==-48804 then c=f[12]for n=1,#a do local a=e(a,n)c[n]=o(d(37,99),(a-(b+n))%256)end return i(c)else break end else if l<=28895 then m,l=f[13],f[13]else f[12]={}f[13]=g[87864+173589]or h(-48804,87864+173589)m,l=28895,28895 end end until l==-28723 end)("\115\129\133",16)]or function(a,b)local c,f local g={}local h={}local function l(m,n)h[n]=m;return h[n]end local m={}m[1]=2 m[2]=0 m[3]=3 local m=0 local m=0 local n=-36143 repeat if n<=-32968 then if n==-36143 then c=0 f=1 g[17]=h[-36143+276703]or l(-16389,-36143+276703)m,n=-32968,-32968 else m,n=g[17],g[17]end else if n<=-28248 then break else while a>0 or b>0 do local g,h local l={}local m={}local function p(bb,bc)m[bc]=bb;return m[bc]end local bb={}bb[1]=2 bb[2]=3 bb[3]=4 local bb=0 local bc=0 local bd=-43071 repeat if bd<=-30629 then if bd<=-48138 then bb,bd=l[16],l[16]else if bd==-43071 then g=a%2 h=b%2 l[14]=m[-43071+316830]or p(-30629,-43071+316830)bc,bd=43398,43398 else if g==1 or h==1 then c=c+f;end;a=j(a/2)b=j(b/2)l[15]=m[-30629+185759]or p(-27857,-30629+185759)bc,bd=81086,81086 end end else if bd<=30098 then if bd<=-27857 then f=f*2 l[16]=m[-27857+185759]or p(30098,-27857+185759)bb,bd=-48138,-48138 else break end else if bd==43398 then bc,bd=l[14],l[14]else bc,bd=l[15],l[15]end end end until bd==30098 end;return c;end end until n==-28248 end w=nil x=nil cd=cc[1]~=0 and 69648 or-45710 cc[3]=(cc[3]+1)%5 cf=-45710 end else cb[134]={}cf=-16235 end else if cf<-43074 then bo=nil cd,cf=-49761,-49761 else bs=function(a)local b,c local f={}local g={}local function h(l,m)g[m]=l;return g[m]end local l={}l[1]=0 l[2]=2 l[3]=3 local l=27360 local m=0 local m=0 repeat if l<=-12132 then if l~=-12132 then break else l=f[42]end else if l<38298 then b,c=e(a,bh,bh+1)bh=bh+2 f[42]=g[27360+83780]or h(38298,27360+83780)l=-12132 else return((c*256)+b);end end until l==-32891 end cd,cf=43562,43562 end end else if cf<=-48575 then if cf<-48575 then bo=function(a)local b,c,f,g,h,l,m,n,p,bb,bc local bd={}local be={}local function bf(bg,bk)be[bk]=bg;return be[bk]end local bg={}bg[1]=1 bg[2]=2 bg[3]=3 local bk=0 local bm=-24929 local br=0 repeat if bm<=-28044 then if bm>=-37863 then if bm<=-37863 then bm=bd[37]else bk,bm=bd[38],bd[38]end else break end else if bm>=23237 then if bm<=23237 then p=bd[36]bb=(n%128)*16+j(m/16)bc=((m%16)*2^48+l*2^40+h*2^32+g*2^24+f*2^16+c*2^8+b)if bb==0 then if bc==0 then return p*0;else return p*bc*2^(-1022-52);end;elseif bb==2047 then if bc==0 then return p*(1/0);else return 0/0;end;end;bg[3]=(bg[3]+1)%5 bd[38]=be[23237+223927]or bf(37481,23237+223927)bk,bm=-28044,-28044 else bc=bc+2^52 return p*bc*2^(bb-1023-52);end else b,c,f,g,h,l,m,n=e(a,bh,bh+7)bh=bh+8 bd[36]=n>127 and-1 or 1 br=bg[3]==0 and 37481 or 23237 bd[37]=be[-24929+223927]or bf(23237,-24929+223927)bm=-37863 end end until bm==-48729 end ce,cf=-10769,-10769 else cb[133]={}cd=cc[1]~=1 and 20324 or-41922 cc[3]=(cc[3]+1)%5 cf=-41922 end else if cf<=-46150 then bl=nil ce,cf=56237,56237 else if cf<-44314 then w=q and q[(function(a,b)local c local f={}local g={}local function h(l,m)g[m]=l;return g[m]end local l={}l[1]=2 l[2]=2 l[3]=2 local l=0 local l=0 local l=25852 repeat if l>=53116 then if l==53116 then l=f[19]else break end else if l<47395 then f[18]={}f[19]=g[25852+334698]or h(47395,25852+334698)l=53116 else c=f[18]for f=1,#a do local a=e(a,f)c[f]=o(d(37,99),(a-(b+f))%256)end return i(c)end end until l==59266 end)("\142\150\140\142\140\155",33)]or function(a,b)if b<0 then return x(a,-b)end return(a*2^b)%r;end x=q and q[(function(a,b)local c local f={}local g={}local function h(l,m)g[m]=l;return g[m]end local l={}l[1]=2 l[2]=2 l[3]=3 local l=0 local l=0 local l=45228 repeat if l>=38755 then if l<45228 then c=f[20]for m=1,#a do local a=e(a,m)c[m]=o(d(37,99),(a-(b+m))%256)end return i(c)else f[20]={}f[21]=g[45228+303118]or h(38755,45228+303118)l=-33471 end else if l~=34860 then l=f[21]else break end end until l==34860 end)("\165\167\157\159\157\172",50)]or function(a,b)if b<0 then return w(a,-b)end return j(a%r/2^b)end ce,cf=-33053,-33053 else bj=function(a)local b=0 for c=0,3 do b=v(b,w(e(a,bh,bh),8*c));bh=bh+1;end;return b;end cd=cc[3]==0 and 35433 or 82069 ce,cf=82069,82069 end end end end else if cf<=-35892 then if cf>=-37544 then if cf<=-37544 then bi=function(a)local b=0 local c=0 for f=0,3 do local g=e(a,bh)b=v(b,w(g,8*f));bh=bh+1;end;for f=0,3 do local g local h={}local l={}local function m(n,p)l[p]=n;return l[p]end local n={}n[1]=4 n[2]=0 n[3]=0 local n=0 local n=-32172 local p=0 repeat if n<=-19288 then if n<=-32172 then g=e(a,bh)c=v(c,w(g,8*f))h[31]=l[-32172+184479]or m(52882,-32172+184479)p,n=-19288,-19288 else p,n=h[31],h[31]end else if n<=34548 then break else if n<=52882 then bh=bh+1 h[32]=l[52882+315550]or m(34548,52882+315550)n=84341 else n=h[32]end end end until n==34548 end;return c*4294967296+b;end ce,cf=53172,53172 else if cf==-36662 then bn=function(a)local b local c={}local f={}local function g(h,l)local m=u(l,l)local h=h+m f[l]=h;return h end local h={}h[1]=0 h[2]=3 h[3]=1 local h=-48792 local l=0 local m=0 repeat if h<=-17676 then if h~=-17676 then b=0 b=e(a,bh)bh=bh+1 c[35]=f[u(-48792,73837)]or g(68219,u(-48792,73837))l,h=-17676,-17676 else l,h=c[35],c[35]end else if h<=24206 then break else return b;end end until h==24206 end cd=cc[3]==0 and-10769 or-44233 cd,cf=-44233,-44233 else bs=nil cd,cf=-43074,-43074 end end else if cf<-39736 then bp=function(a)local b,c local f={}local g={}local function h(l,m)g[m]=l;return g[m]end local l={}l[1]=2 l[2]=0 l[3]=4 local l=0 local l=-17526 local m=0 repeat if l>=27721 then if l<82711 then repeat local a=e(a,bh,bh)b=b+(a>127 and a-128 or a)*c c=c*128 bh=bh+1 until(a<128)return b else break end else if l<=-17526 then b=0 c=1 f[39]=g[-17526+183507]or h(27721,-17526+183507)l=-10845 else l=f[39]end end until l==82711 end ce,cf=-34269,-34269 else bw=function(a,...)local b,c local f={}local g={}local function h(l,m)g[m]=l;return g[m]end local l={}l[1]=1 l[2]=0 l[3]=4 local l=-24622 local m=0 local n=0 repeat if l>=57423 then if l>=63135 then if l~=78603 then m,l=f[131],f[131]else break end else if l==57423 then f[129]=a[0]or 0 f[131]=g[57423+50178]or h(40465,57423+50178)m,l=63135,63135 else a[0]=b return b;end end else if l<=-25020 then if l==-38593 then m,l=f[132],f[132]else l=f[130]end else if l~=40465 then b=k('#',...)for n=1,b do a[n]=k(n,...);end;f[130]=g[-24622+50178]or h(57423,-24622+50178)l=-25020 else c=f[129]if c>b then for k=b+1,c do a[k]=nil;end;end;f[132]=g[40465+181249]or h(61765,40465+181249)m,l=-38593,-38593 end end end until l==78603 end cf=-35603 end end else if cf<=-34269 then if cf>=-35603 then if cf<=-35603 then bx=cb[134]cf=-12871 else bq=nil cf=-35720 end else bq=function(a)local b,c local f={}local g={}local function h(k,l)g[l]=k;return g[l]end local k={}k[1]=2 k[2]=1 k[3]=1 local k=0 local l=0 local l=-43863 repeat if l<=-43863 then if l==-45934 then if(b%2)==0 then return c;end;return-c-1;else b=bp(a)c=j(b/2)f[40]=g[-43863+305142]or h(-45934,-43863+305142)k,l=83880,83880 end else if l==48467 then break else k,l=f[40],f[40]end end until l==48467 end cc[3]=(cc[3]+1)%5 cf=47208 end else if cf<=-33053 then y=q and q[(function(a,b)local c local f={}local g={}local function h(k,l)g[l]=k;return g[l]end local k={}k[1]=4 k[2]=1 k[3]=1 local l=0 local l=0 local m=87895 repeat if m>=63488 then if m>=84357 then if m~=87895 then return i(c)else f[22]={}k[2]=(k[2]+1)%5 f[23]=g[87895+343172]or h(23647,87895+343172)l,m=-25751,-25751 end else l,m=f[24],f[24]end else if m>=-20957 then if m<=-20957 then break else c=f[22]for k=1,#a do local a=e(a,k)c[k]=o(d(37,99),(a-(b+k))%256)end f[24]=g[23647+212101]or h(84357,23647+212101)l,m=63488,63488 end else l,m=f[23],f[23]end end until m==-20957 end)("\205\205\219\210",106)]or function(a,b)local c,f local g={}local h={}local function k(l,m)h[m]=l;return h[m]end local l={}l[1]=1 l[2]=1 l[3]=1 local m=0 local m=-45268 local n=0 repeat if m>=-30069 then if m~=66078 then return c;else break end else if m<=-46498 then m=g[27]else c=0 f=1 while a>0 and b>0 do local n,p local u={}local v={}local function w(x,bb)v[bb]=x;return v[bb]end local x={}x[1]=1 x[2]=1 x[3]=2 local bb=0 local bb=71825 local bc=0 repeat if bb<=-17278 then if bb==-44539 then break else bc,bb=u[26],u[26]end else if bb<=-13603 then b=j(b/2)f=f*2 x[1]=(x[1]+1)%5 u[26]=v[-13603+145950]or w(-44539,-13603+145950)bc,bb=-17278,-17278 else if bb~=71825 then bb=u[25]else n=a%2 p=b%2 if n==1 and p==1 then c=c+f;end;a=j(a/2)u[25]=v[71825+145950]or w(-13603,71825+145950)bb=58548 end end end until bb==-44539 end;l[3]=(l[3]+1)%5 g[27]=h[-45268+172294]or k(-30069,-45268+172294)m=-46498 end end until m==66078 end z=q and q[(function(a,b)local c local f={}local g={}local function h(j,k)g[k]=j;return g[k]end local j={}j[1]=3 j[2]=3 j[3]=1 local j=0 local j=-10740 local k=0 repeat if j<=-18248 then if j<=-29467 then return i(c)else if j==-20778 then k,j=f[30],f[30]else c=f[28]for i=1,#a do local a=e(a,i)c[i]=o(d(37,99),(a-(b+i))%256)end f[30]=g[-18248+288983]or h(-29467,-18248+288983)k,j=-20778,-20778 end end else if j<=-12449 then k,j=f[29],f[29]else if j<=-10740 then f[28]={}f[29]=g[-10740+157912]or h(-18248,-10740+157912)k,j=-12449,-12449 else break end end end until j==27906 end)("\110\123\125\131",11)]or function(a)a=a%r return(r-1)-a end ba=(table.create or function(a)return{t({},1,a)};end)cc[2]=(cc[2]+1)%5 cf=72369 else if cf<=-26091 then s=function(a,b,c)if(b>c)then return end local d=c-b+1 do local e,f local g={}local h={}local function i(j,k)h[k]=j;return h[k]end local j={}j[1]=2 j[2]=2 j[3]=2 local k=0 local l=0 local m=-24473 repeat if m>=-24473 then if m>=51995 then if m<=55109 then if m<55109 then if f==0 and d>=6 then e=85198 f=1 end if f==0 and d>=5 then e=59253 f=1 end if f==0 and d>=4 then e=26445 f=1 end if f==0 and d>=3 then e=19530 f=1 end k=j[2]~=1 and 55109 or-47188 g[6]=h[51995+40566]or i(-47188,51995+40566)k,m=-45866,-45866 else if e==52004 then return a[b],a[b+1],a[b+2],a[b+3],a[b+4],a[b+5],a[b+6],s(a,b+7,c)end if e==85198 then return a[b],a[b+1],a[b+2],a[b+3],a[b+4],a[b+5],s(a,b+6,c)end g[8]=h[55109+171637]or i(-43731,55109+171637)k,m=61176,61176 end else if m<78524 then k,m=g[8],g[8]else if e==40930 then return a[b],s(a,b+1,c)end j[3]=(j[3]+1)%5 g[10]=h[78524+40566]or i(-13372,78524+40566)m=-24476 end end else if m<=-24473 then e=0 f=0 if f==0 and d>=8 then e=62698 f=1 end if f==0 and d>=7 then e=52004 f=1 end k=j[2]==0 and-47188 or 51995 g[5]=h[-24473+302708]or i(51995,-24473+302708)k,m=-41267,-41267 else if m<=-15081 then k,m=g[9],g[9]else break end end end else if m<=-43731 then if m<=-47188 then if f==0 and d>=2 then e=79148 f=1 end if f==0 then e=40930 f=1 end if e==62698 then return a[b],a[b+1],a[b+2],a[b+3],a[b+4],a[b+5],a[b+6],a[b+7],s(a,b+8,c)end g[7]=h[-47188+40566]or i(55109,-47188+40566)l,m=-39402,-39402 else if m~=-43731 then k,m=g[6],g[6]else if e==59253 then return a[b],a[b+1],a[b+2],a[b+3],a[b+4],s(a,b+5,c)end if e==26445 then return a[b],a[b+1],a[b+2],a[b+3],s(a,b+4,c)end if e==19530 then return a[b],a[b+1],a[b+2],s(a,b+3,c)end if e==79148 then return a[b],a[b+1],s(a,b+2,c)end g[9]=h[-43731+40566]or i(78524,-43731+40566)k,m=-15081,-15081 end end else if m>=-39402 then if m==-39402 then l,m=g[7],g[7]else m=g[10]end else k,m=g[5],g[5]end end end until m==-13372 end end cd=cc[1]~=1 and-41521 or 20324 ce,cf=20324,20324 else break end end end end end end until cf==-22699 end)(error,next,string.match,tonumber,string.gsub,string.sub,table.insert,string.char,string.byte,coroutine.yield,coroutine.wrap,string.rep,table.concat,math.floor,select,(getfenv or function()return _ENV;end),setmetatable,next,(table.unpack or unpack),(table.pack or function(...)return{...};end),math.min,(function(b)if b<=1 then return false end;if b<=3 then return true end;if b%2==0 or b%3==0 then return false end;local c=5;while c*c<=b do if b%c==0 or b%(c+2)==0 then return false end;c=c+6 end;return true end),string.len,table.remove,table.sort,(string.unpack),string.gmatch,string.find,string.reverse,tostring,math.abs,rawget,string.format);

---JENNY MODDDDDD

   end,
})


local Button = Tab:CreateButton({
   Name = "Network Ownership Abuser(@im_partrick)",
   Callback = function()
   --1. rules: it is forbidden to change the credit name, this script was created by @im_patrick you will be charged dcma for changing the credit
--2. rules: changing the code using AI and claiming it as your own is not allowed

if patricknpcpanel then return end; patricknpcpanel = true

local github = "https://raw.githubusercontent.com/randomstring0/fe-source/refs/heads/main/NPC"
local load = loadstring(game:HttpGet(github .. "/module.Luau"))()

saved = loadstring(game:HttpGet(github .. "/table.luau"))()



local save = saved or {}

local g2l = load.G2L
local new = load.create()

local lighting = game:GetService("Lighting")
local tweenservice = game:GetService("TweenService")
local rs = game:GetService("RunService")
local ws = game:GetService("Workspace")
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local mouse = lp:GetMouse()

local fast = TweenInfo.new(.5, Enum.EasingStyle.Exponential)
local medium = TweenInfo.new(.67)
local slow = TweenInfo.new(.8)

local rad = 150
local currentnpc

local highlight = Instance.new("Highlight")
highlight.Parent = lp
highlight.FillTransparency = 1
highlight.OutlineTransparency = 1

local light = function(adornee, color)
	task.spawn(function()
		highlight.Adornee = adornee
		highlight.OutlineColor = color
		tweenservice:Create(highlight, medium, {OutlineTransparency  = 0}):Play()
		task.wait(.5)
		tweenservice:Create(highlight, medium, {OutlineTransparency  = 1}):Play()
	end)	
end

local isnpc = function(ins)
	local humanoid = ins:FindFirstChildOfClass("Humanoid")
	local player = plrs:GetPlayerFromCharacter(ins)

	if humanoid and not player then
		return ins 
	end

	return nil
end


new:mainbutton(save["1"].title, save["1"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			local hum = currentnpc:FindFirstChildOfClass("Humanoid")
			if hum then
				hum:ChangeState(save["1"].val)
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

new:mainbutton(save["2"].title, save["2"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			if lp and lp.Character then
				local char = lp.Character
				currentnpc:PivotTo(char:GetPivot())
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

new:mainbutton(save["3"].title, save["3"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part then
			if lp and lp.Character then
				local char = lp.Character
				char:PivotTo(currentnpc:GetPivot())
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)


local chr, cons
new:maintoggle(save["4"].title, save["4"].des, function(a)
	if a then
		if currentnpc then
			local part = currentnpc:FindFirstChild("HumanoidRootPart")
			if part and partowner(part) then
				if lp and lp.Character then
					chr = lp.Character
					lp.Character = currentnpc
					ws.CurrentCamera.CameraSubject = currentnpc:FindFirstChild("HumanoidRootPart")
					-- idea from sonle
					local move = 0.01
					cons = rs.PreSimulation:Connect(function()
						local hum = lp.Character:FindFirstChildOfClass("Humanoid")
						if lp.Character and hum then
							hum.RootPart.CFrame += vector.create(0,move,0)
							move = -move
						else
							if cons then
								cons:Disconnect()
								cons = nil
							end
						end
					end)
				end
			else
				light(currentnpc, Color3.fromRGB(255, 0, 0))
			end
		end
	else
		if chr then
			lp.Character = chr
			ws.CurrentCamera.CameraSubject = chr.Humanoid
			chr = nil
			if cons then
				cons:Disconnect()
				cons = nil
			end
		end
	end
end)

new:mainbutton(save["5"].title, save["5"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			if lp and lp.Character then
				local char = lp.Character
				currentnpc:PivotTo(CFrame.new(0, 1000, 0))
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

new:mainbutton(save["6"].title, save["6"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			local hum = currentnpc:FindFirstChildOfClass("Humanoid")
			if hum then
				hum.Sit = not hum.Sit
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

new:mainbutton(save["7"].title, save["7"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			local hum = currentnpc:FindFirstChildOfClass("Humanoid")
			if hum then
				hum:ChangeState(save["7"].val)
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

local con, follownpc
follownpc = new:maintoggle(save["8"].title, save["8"].des, function(a)
	if a then
		con = rs.RenderStepped:Connect(function()
			if currentnpc then
				local part = currentnpc:FindFirstChild("HumanoidRootPart")
				if part and partowner(part) then
					local hum = currentnpc:FindFirstChildOfClass("Humanoid")
					if hum then
						local hrp=lp.Character:FindFirstChild("HumanoidRootPart")
						if hrp then
							hum:MoveTo(hrp.Position + Vector3.new(-4,0,0))
						end
					end
				else
					light(currentnpc, Color3.fromRGB(255, 0, 0))
					if con then
						follownpc:swich(false)
						con:Disconnect()
						con = nil
					end
				end
			else
				if con then
					follownpc:swich(false)
					con:Disconnect()
					con = nil
				end
			end
		end)
	else
		if con then
			con:Disconnect()
			con = nil
		end
	end
end)


local con1
new:extratoggle(save["9"].title, function(a)
	if a then
		con1 = rs.Stepped:Connect(function()
			local hrp1 = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
			if not hrp1 then return end

			local nbp = ws:GetPartBoundsInRadius(hrp1.Position, 13)
			for _, part in pairs(nbp) do
				local model = part:FindFirstAncestorOfClass("Model")
				if model and isnpc(model) then
					local npc = model
					local hrp = npc:FindFirstChild("HumanoidRootPart")
					if hrp and partowner(hrp) and not hrp.Anchored and npc ~= lp.Character then
						local hum = npc:FindFirstChildOfClass("Humanoid")
						if hum then
							hum:ChangeState(save["9"].val)
						end
					end
				end
			end
		end)
	else
		if con1 then
			con1:Disconnect()
			con1 = nil
		end
	end
end)


local con2
new:extratoggle(save["10"].title, function(a)
	if a then
		con2 = rs.Stepped:Connect(function()
			local hrp1 = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
			if not hrp1 then return end

			local nbp = ws:GetPartBoundsInRadius(hrp1.Position, 13)
			for _, part in pairs(nbp) do
				local model = part:FindFirstAncestorOfClass("Model")
				if model and isnpc(model) then
					local npc = model
					local hrp = npc:FindFirstChild("HumanoidRootPart")
					if hrp and partowner(hrp) and not hrp.Anchored and npc ~= lp.Character then
						local hum = npc:FindFirstChildOfClass("Humanoid")
						if hum then
							hum:ChangeState(save["10"].val)
						end
					end
				end
			end
		end)
	else
		if con2 then
			con2:Disconnect()
			con2 = nil
		end
	end
end)




mouse.Button1Down:Connect(function()
	if clicknpc and mouse.Target and mouse.Target.Parent:FindFirstChild("HumanoidRootPart") then
		if mouse.Target.Parent:FindFirstChild("HumanoidRootPart").Anchored == false then
			if not plrs:GetPlayerFromCharacter(mouse.Target.Parent) then
				if partowner(mouse.Target.Parent:FindFirstChild("HumanoidRootPart")) then
					currentnpc = mouse.Target.Parent
					light(currentnpc, Color3.fromRGB(0, 255, 0))
				else
					light(mouse.Target.Parent, Color3.fromRGB(255, 0, 0))
				end
			end
		else
			light(mouse.Target.Parent, Color3.fromRGB(255, 0, 0))
		end
	end
end)

rs.RenderStepped:Connect(function()
	if sethiddenproperty then
		sethiddenproperty(lp,"SimulationRadius",rad)
	else
		lp.SimulationRadius=rad
	end
end)


return g2l, require;
   end,
})

local Button = Tab:CreateButton({
   Name = "Morph Gui(Client Sided)",
   Callback = function()
   -- Theme Colors
local BLACK = Color3.fromRGB(15, 15, 15)
local DARK_GRAY = Color3.fromRGB(35, 35, 35)
local LIST_BG = Color3.fromRGB(25, 25, 25)
local WHITE = Color3.fromRGB(255, 255, 255)
local RED = Color3.fromRGB(200, 50, 50)
local LIGHT_GREEN = Color3.fromRGB(50, 180, 50)
local BLUE = Color3.fromRGB(50, 100, 200)
local MENU_ALPHA = 0.95

-- Services
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService") -- Required for saving
local player = Players.LocalPlayer

-- Variables
local creatorUserId = nil
local creatorThumbnail = ""
local minimized = false
local draggingTitleBar = false
local dragStart, startPos = nil, nil
local savedAvatars = {} -- Storage for saved avatars
local FILE_NAME = "KuramaMorph_Saved.json" -- File name in your Workspace folder

-- Creator Info
local success, result = pcall(function()
    return Players:GetUserIdFromNameAsync("akuramaa_xd")
end)
if success then
    creatorUserId = result
    success, result = pcall(function()
        return Players:GetUserThumbnailAsync(creatorUserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    end)
    if success then
        creatorThumbnail = result
    end
end

-- Cleanup Existing GUI
if CoreGui:FindFirstChild("MorphAvatarByKuramaMod") then 
    CoreGui["MorphAvatarByKuramaMod"]:Destroy() 
end

-- Main GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MorphAvatarByKuramaMod"
screenGui.ResetOnSpawn = false
screenGui.DisplayOrder = 999999
screenGui.Parent = CoreGui
screenGui.Enabled = true

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 130)
frame.Position = UDim2.new(0.5, -100, 0.5, -65)
frame.BackgroundColor3 = BLACK
frame.BackgroundTransparency = 1 - MENU_ALPHA
frame.BorderSizePixel = 0
frame.Active = false
frame.Parent = screenGui
frame.Visible = true
frame.ClipsDescendants = false 

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 8)
frameCorner.Parent = frame

-- Title Bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundTransparency = 1
titleBar.Parent = frame
titleBar.Active = true

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 0, 30)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "Morph Avatar"
title.TextColor3 = WHITE
title.BackgroundTransparency = 1
title.BorderSizePixel = 0
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleBar

-- Username Input
local usernameInput = Instance.new("TextBox")
usernameInput.Size = UDim2.new(1, -20, 0, 30)
usernameInput.Position = UDim2.new(0, 10, 0, 40)
usernameInput.PlaceholderText = "Enter Username"
usernameInput.Font = Enum.Font.Gotham
usernameInput.TextSize = 14
usernameInput.Text = ""
usernameInput.TextColor3 = WHITE
usernameInput.BackgroundColor3 = DARK_GRAY
usernameInput.ClearTextOnFocus = false
usernameInput.TextWrapped = true
usernameInput.Parent = frame
usernameInput.Visible = true

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 4)
inputCorner.Parent = usernameInput

-- Buttons Container
local btnContainer = Instance.new("Frame")
btnContainer.Size = UDim2.new(1, -20, 0, 35)
btnContainer.Position = UDim2.new(0, 10, 0, 80)
btnContainer.BackgroundTransparency = 1
btnContainer.Parent = frame

-- Save Button
local saveBtn = Instance.new("TextButton")
saveBtn.Name = "SaveBtn"
saveBtn.Size = UDim2.new(0.48, 0, 1, 0)
saveBtn.Position = UDim2.new(0, 0, 0, 0)
saveBtn.BackgroundColor3 = BLUE
saveBtn.Text = "Save"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 14
saveBtn.TextColor3 = WHITE
saveBtn.Parent = btnContainer

local saveCorner = Instance.new("UICorner")
saveCorner.CornerRadius = UDim.new(0, 4)
saveCorner.Parent = saveBtn

-- Saved List Toggle Button
local savedListBtn = Instance.new("TextButton")
savedListBtn.Name = "SavedListBtn"
savedListBtn.Size = UDim2.new(0.48, 0, 1, 0)
savedListBtn.Position = UDim2.new(0.52, 0, 0, 0)
savedListBtn.BackgroundColor3 = DARK_GRAY
savedListBtn.Text = "Saved"
savedListBtn.Font = Enum.Font.GothamBold
savedListBtn.TextSize = 14
savedListBtn.TextColor3 = WHITE
savedListBtn.Parent = btnContainer

local savedListCorner = Instance.new("UICorner")
savedListCorner.CornerRadius = UDim.new(0, 4)
savedListCorner.Parent = savedListBtn

-- Saved List Dropdown
local savedFrame = Instance.new("ScrollingFrame")
savedFrame.Name = "SavedAvatarsFrame"
savedFrame.Size = UDim2.new(1, 0, 0, 150)
savedFrame.Position = UDim2.new(0, 0, 1, 5) 
savedFrame.BackgroundColor3 = BLACK
savedFrame.BackgroundTransparency = 0.1
savedFrame.BorderSizePixel = 0
savedFrame.ScrollBarThickness = 4
savedFrame.Visible = false 
savedFrame.Parent = frame
savedFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
savedFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local savedFrameCorner = Instance.new("UICorner")
savedFrameCorner.CornerRadius = UDim.new(0, 8)
savedFrameCorner.Parent = savedFrame

local savedListLayout = Instance.new("UIListLayout")
savedListLayout.Parent = savedFrame
savedListLayout.SortOrder = Enum.SortOrder.LayoutOrder
savedListLayout.Padding = UDim.new(0, 5)
savedListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local savedPadding = Instance.new("UIPadding")
savedPadding.PaddingTop = UDim.new(0, 10)
savedPadding.PaddingBottom = UDim.new(0, 10)
savedPadding.Parent = savedFrame

-- Window Controls
local miniBtn = Instance.new("TextButton")
miniBtn.Name = "MinimizeButton"
miniBtn.Size = UDim2.new(0, 30, 0, 30)
miniBtn.Position = UDim2.new(1, -60, 0, 0)
miniBtn.Text = "-"
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextSize = 16
miniBtn.TextColor3 = WHITE
miniBtn.BackgroundTransparency = 1
miniBtn.Parent = titleBar

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "Close"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.TextColor3 = RED
closeBtn.BackgroundTransparency = 1
closeBtn.Parent = titleBar
closeBtn.ZIndex = 2

-- === FUNCTIONS ===

local function sendNotif(titleT, textT, image)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = titleT,
            Text = textT,
            Duration = 3,
            Icon = image or ""
        })
    end)
end

-- FILE SAVING SYSTEM
local function saveToFile()
    if not writefile then return end -- Check for executor support
    local success, encoded = pcall(function()
        return HttpService:JSONEncode(savedAvatars)
    end)
    if success then
        writefile(FILE_NAME, encoded)
        print("Saved avatars to file.")
    end
end

local function loadFromFile()
    if not isfile or not readfile then return end -- Check for executor support
    if isfile(FILE_NAME) then
        local success, decoded = pcall(function()
            return HttpService:JSONDecode(readfile(FILE_NAME))
        end)
        if success and type(decoded) == "table" then
            savedAvatars = decoded
            print("Loaded avatars from file.")
        end
    end
end

local function applyMorphEffect(character)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end

    local particleEmitter = Instance.new("ParticleEmitter")
    particleEmitter.Texture = "rbxassetid://243098098"
    particleEmitter.Rate = 50
    particleEmitter.Speed = NumberRange.new(5, 10)
    particleEmitter.Lifetime = NumberRange.new(0.5, 1)
    particleEmitter.SpreadAngle = Vector2.new(360, 360)
    particleEmitter.Color = ColorSequence.new(RED)
    particleEmitter.Parent = rootPart

    local explosion = Instance.new("Explosion")
    explosion.BlastRadius = 5
    explosion.BlastPressure = 0
    explosion.Position = rootPart.Position
    explosion.Visible = true
    explosion.Parent = workspace
    explosion.ExplosionType = Enum.ExplosionType.NoCraters

    task.spawn(function()
        task.wait(2)
        particleEmitter.Enabled = false
        task.wait(1)
        particleEmitter:Destroy()
        explosion:Destroy()
    end)
end

local function findPlayerByName(partialName)
    if not partialName or partialName == "" then return nil end
    local searchName = partialName:lower()
    
    local localPlayer = nil
    for _, v in ipairs(Players:GetPlayers()) do
        local nameLower = v.Name:lower()
        local dNameLower = v.DisplayName:lower()
        
        if nameLower == searchName or dNameLower == searchName then
            return v
        end
        
        if nameLower:sub(1, #searchName) == searchName or dNameLower:sub(1, #searchName) == searchName then
            localPlayer = v
        end
    end
    
    if not localPlayer then
        local success, userId = pcall(function()
            return Players:GetUserIdFromNameAsync(searchName)
        end)
        if success and userId then
            return {UserId = userId, Name = searchName}
        end
    end
    
    return localPlayer
end

local function morphToPlayer(target)
    if not target then 
        sendNotif("Morph Avatar", "No target found!", "")
        return 
    end
    
    local userId = target.UserId or (type(target) == "number" and target or target.UserId)
    local targetName = target.Name or "Unknown"
    
    if userId == player.UserId then
        sendNotif("Morph Avatar", "Cannot morph to yourself!", "")
        return
    end
    
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid", 10)
    if not humanoid then return end

    local success, desc = pcall(function()
        return Players:GetHumanoidDescriptionFromUserId(userId)
    end)
    
    if success and desc then
        local targetThumbnail = ""
        pcall(function()
            targetThumbnail = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        end)

        for _, obj in ipairs(character:GetChildren()) do
            if obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("ShirtGraphic") or
               obj:IsA("Accessory") or obj:IsA("BodyColors") then
                obj:Destroy()
            end
        end
        local head = character:FindFirstChild("Head")
        if head then
            for _, decal in ipairs(head:GetChildren()) do
                if decal:IsA("Decal") then decal:Destroy() end
            end
        end

        pcall(function()
            humanoid:ApplyDescriptionClientServer(desc)
        end)

        applyMorphEffect(character)
        sendNotif("Morph Avatar", "Morphed to " .. targetName, targetThumbnail)
    else
        sendNotif("Morph Avatar", "Failed to load data.", "")
    end
end

local function refreshSavedList()
    for _, child in ipairs(savedFrame:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end

    for i, data in ipairs(savedAvatars) do
        local itemFrame = Instance.new("Frame")
        itemFrame.Size = UDim2.new(1, -10, 0, 40)
        itemFrame.BackgroundColor3 = LIST_BG
        itemFrame.Parent = savedFrame

        local itemCorner = Instance.new("UICorner")
        itemCorner.CornerRadius = UDim.new(0, 6)
        itemCorner.Parent = itemFrame

        local icon = Instance.new("ImageLabel")
        icon.Size = UDim2.new(0, 30, 0, 30)
        icon.Position = UDim2.new(0, 5, 0, 5)
        icon.BackgroundTransparency = 1
        icon.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        icon.Parent = itemFrame
        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(1, 0)
        iconCorner.Parent = icon

        task.spawn(function()
            local t = Players:GetUserThumbnailAsync(data.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
            icon.Image = t
        end)

        local nameLbl = Instance.new("TextLabel")
        nameLbl.Size = UDim2.new(1, -100, 1, 0)
        nameLbl.Position = UDim2.new(0, 40, 0, 0)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = data.Name
        nameLbl.TextColor3 = WHITE
        nameLbl.Font = Enum.Font.GothamSemibold
        nameLbl.TextSize = 12
        nameLbl.TextXAlignment = Enum.TextXAlignment.Left
        nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        nameLbl.Parent = itemFrame

        -- Equip Button
        local equipBtn = Instance.new("TextButton")
        equipBtn.Size = UDim2.new(0, 25, 0, 25)
        equipBtn.Position = UDim2.new(1, -60, 0.5, -12.5)
        equipBtn.BackgroundColor3 = LIGHT_GREEN
        equipBtn.Text = "✔"
        equipBtn.TextColor3 = WHITE
        equipBtn.Font = Enum.Font.GothamBold
        equipBtn.Parent = itemFrame
        
        local equipCorner = Instance.new("UICorner")
        equipCorner.CornerRadius = UDim.new(0, 4)
        equipCorner.Parent = equipBtn

        equipBtn.MouseButton1Click:Connect(function()
            morphToPlayer({UserId = data.UserId, Name = data.Name})
        end)

        -- Delete Button
        local delBtn = Instance.new("TextButton")
        delBtn.Size = UDim2.new(0, 25, 0, 25)
        delBtn.Position = UDim2.new(1, -30, 0.5, -12.5)
        delBtn.BackgroundColor3 = RED
        delBtn.Text = "🗑"
        delBtn.TextColor3 = WHITE
        delBtn.Font = Enum.Font.GothamBold
        delBtn.Parent = itemFrame

        local delCorner = Instance.new("UICorner")
        delCorner.CornerRadius = UDim.new(0, 4)
        delCorner.Parent = delBtn

        delBtn.MouseButton1Click:Connect(function()
            table.remove(savedAvatars, i)
            saveToFile() -- Update file on delete
            refreshSavedList()
        end)
    end
end

local function saveCurrentInput()
    local text = usernameInput.Text
    if text == "" then 
        sendNotif("Save", "Enter a username first!", "")
        return 
    end

    local target = findPlayerByName(text)
    if target then
        for _, v in ipairs(savedAvatars) do
            if v.UserId == target.UserId then
                sendNotif("Save", "User already saved!", "")
                return
            end
        end

        table.insert(savedAvatars, {Name = target.Name, UserId = target.UserId})
        saveToFile() -- Update file on save
        sendNotif("Save", "Saved " .. target.Name, "")
        if savedFrame.Visible then
            refreshSavedList()
        end
    else
        sendNotif("Save", "Player not found!", "")
    end
end

-- === EVENTS ===

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingTitleBar = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        draggingTitleBar = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if draggingTitleBar and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

miniBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        frame.Size = UDim2.new(0, 200, 0, 30)
        miniBtn.Text = "+"
        usernameInput.Visible = false
        btnContainer.Visible = false
        savedFrame.Visible = false 
    else
        frame.Size = UDim2.new(0, 200, 0, 130)
        miniBtn.Text = "-"
        usernameInput.Visible = true
        btnContainer.Visible = true
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

usernameInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local inputText = usernameInput.Text
        if inputText == "" then return end
        local target = findPlayerByName(inputText)
        if target then
            usernameInput.Text = target.Name or inputText
            morphToPlayer(target)
        else
            sendNotif("Morph Avatar", "Player not found!", "")
        end
    end
end)

saveBtn.MouseButton1Click:Connect(saveCurrentInput)

savedListBtn.MouseButton1Click:Connect(function()
    savedFrame.Visible = not savedFrame.Visible
    if savedFrame.Visible then
        refreshSavedList()
        savedListBtn.BackgroundColor3 = LIGHT_GREEN
    else
        savedListBtn.BackgroundColor3 = DARK_GRAY
    end
end)

-- Initialize
loadFromFile() -- Load Saved Avatars on Startup
sendNotif("Morph Avatar", "Permanent Save Enabled", creatorThumbnail)
   end,
})

local Button = Tab:CreateButton({
   Name = "FE Sound Spammer(Scripty)",
   Callback = function()
   --sound thingy

--[[
Made By Scripty#2063
If You Gonna showcase this , make sure to Credit me , do not take that you are owner of the script
This Gui is Undetectable
RespectFilteringEnabled must be false to use it
--]]

local ScreenGui = Instance.new("ScreenGui")
local Draggable = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Time = Instance.new("TextLabel")
local _1E = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local _3E = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local SE = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Path = Instance.new("TextLabel")
local Top = Instance.new("Frame")
local Top_2 = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Exit = Instance.new("TextButton")
local Minizum = Instance.new("TextButton")
local Stop = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local IY = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local Wait = Instance.new("TextBox")

--Properties:

ScreenGui.Name = ". Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Draggable.Name = "Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ."
Draggable.Parent = ScreenGui
Draggable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Draggable.BackgroundTransparency = 1.000
Draggable.BorderSizePixel = 0
Draggable.Position = UDim2.new(0.35026139, 0, 0.296158612, 0)
Draggable.Size = UDim2.new(0, 438, 0, 277)

Frame.Name = ". . Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ. "
Frame.Parent = Draggable
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(-0.00133678317, 0, -0.00348037481, 0)
Frame.Size = UDim2.new(0, 438, 0, 277)

Frame_2.Name = " . Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ. "
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(-0.00133678142, 0, -0.0179207586, 0)
Frame_2.Size = UDim2.new(0, 438, 0, 238)
Frame_2.Active = true
Frame_2.Draggable = true

Time.Name = "Time"
Time.Parent = Frame_2
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.Position = UDim2.new(0, 0, 0.0126050422, 0)
Time.Size = UDim2.new(0, 437, 0, 31)
Time.Font = Enum.Font.GothamSemibold
Time.Text = "RespectFilteringEnabled(RFE) : nil"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextScaled = true
Time.TextSize = 14.000
Time.TextWrapped = true

_1E.Name = "1E"
_1E.Parent = Frame_2
_1E.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_1E.BorderSizePixel = 0
_1E.Position = UDim2.new(0.0182648394, 0, 0.676470578, 0)
_1E.Size = UDim2.new(0, 208, 0, 33)
_1E.Font = Enum.Font.SourceSans
_1E.Text = "Mute Game"
_1E.TextColor3 = Color3.fromRGB(255, 255, 255)
_1E.TextScaled = true
_1E.TextSize = 30.000
_1E.TextWrapped = true

UICorner.Parent = _1E

_3E.Name = "3E"
_3E.Parent = Frame_2
_3E.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_3E.BorderSizePixel = 0
_3E.Position = UDim2.new(0.0159817357, 0, 0.142857149, 0)
_3E.Size = UDim2.new(0, 209, 0, 33)
_3E.Font = Enum.Font.SourceSans
_3E.Text = "Annoying  Sound"
_3E.TextColor3 = Color3.fromRGB(255, 255, 255)
_3E.TextSize = 30.000
_3E.TextWrapped = true

UICorner_2.Parent = _3E

SE.Name = "SE"
SE.Parent = Frame_2
SE.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SE.BorderSizePixel = 0
SE.Position = UDim2.new(0.509132445, 0, 0.142857149, 0)
SE.Size = UDim2.new(0, 209, 0, 33)
SE.Font = Enum.Font.SourceSans
SE.Text = "Kill Sound Service"
SE.TextColor3 = Color3.fromRGB(255, 255, 255)
SE.TextSize = 30.000
SE.TextWrapped = true

UICorner_3.Parent = SE

Path.Name = "Path"
Path.Parent = Frame_2
Path.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Path.BackgroundTransparency = 1.000
Path.Position = UDim2.new(0.00684931502, 0, 0.815126061, 0)
Path.Size = UDim2.new(0, 435, 0, 44)
Path.Font = Enum.Font.GothamSemibold
Path.Text = "Dev Note : This Script is FE and it only FE when RespectFilteringEnabled(RFE) is disabled , elseif RespectFilteringEnabled(RFE) is true then it only be client , mostly RespectFilteringEnabled(RFE) disabled game are classic game"
Path.TextColor3 = Color3.fromRGB(255, 0, 0)
Path.TextScaled = true
Path.TextSize = 14.000
Path.TextWrapped = true

Top.Name = "Top"
Top.Parent = Frame_2
Top.BackgroundColor3 = Color3.fromRGB(41, 60, 157)
Top.BorderColor3 = Color3.fromRGB(27, 42, 53)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(-0.00133678142, 0, -0.128059402, 0)
Top.Size = UDim2.new(0, 438, 0, 30)
Top_2.Name = "Top"
Top_2.Parent = Top
Top_2.BackgroundColor3 = Color3.fromRGB(30, 45, 118)
Top_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Top_2.BorderSizePixel = 0
Top_2.Position = UDim2.new(0, 0, 0.967638671, 0)
Top_2.Size = UDim2.new(0, 438, 0, 5)

ImageLabel.Parent = Top
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0, 0, 0.0666666701, 0)
ImageLabel.Size = UDim2.new(0, 29, 0, 27)
ImageLabel.Image = "http://www.roblox.com/asset/?id=8798286232"

TextLabel.Parent = ImageLabel
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.997245014, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 397, 0, 30)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "FEAG"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextWrapped = true

Exit.Name = "Exit"
Exit.Parent = Top
Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Exit.BackgroundTransparency = 1.000
Exit.Position = UDim2.new(0.924657524, 0, 0, 0)
Exit.Size = UDim2.new(0, 32, 0, 25)
Exit.Font = Enum.Font.GothamSemibold
Exit.Text = "x"
Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
Exit.TextScaled = true
Exit.TextSize = 14.000
Exit.TextWrapped = true

Minizum.Name = "Minizum"
Minizum.Parent = Top
Minizum.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minizum.BackgroundTransparency = 1.000
Minizum.Position = UDim2.new(0.851598203, 0, 0, 0)
Minizum.Size = UDim2.new(0, 32, 0, 23)
Minizum.Font = Enum.Font.GothamSemibold
Minizum.Text = "_"
Minizum.TextColor3 = Color3.fromRGB(255, 255, 255)
Minizum.TextScaled = true
Minizum.TextSize = 14.000
Minizum.TextWrapped = true

Stop.Name = "Stop"
Stop.Parent = Frame_2
Stop.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Stop.BorderSizePixel = 0
Stop.Position = UDim2.new(0.0182648394, 0, 0.310924381, 0)
Stop.Size = UDim2.new(0, 424, 0, 33)
Stop.Font = Enum.Font.SourceSans
Stop.Text = "Stop"
Stop.TextColor3 = Color3.fromRGB(255, 255, 255)
Stop.TextSize = 30.000
Stop.TextWrapped = true

UICorner_4.Parent = Stop

IY.Name = "IY"
IY.Parent = Frame_2
IY.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
IY.BorderSizePixel = 0
IY.Position = UDim2.new(0.509132445, 0, 0.676470578, 0)
IY.Size = UDim2.new(0, 209, 0, 33)
IY.Font = Enum.Font.SourceSans
IY.Text = "Unmute Game"
IY.TextColor3 = Color3.fromRGB(255, 255, 255)
IY.TextScaled = true
IY.TextSize = 30.000
IY.TextWrapped = true

UICorner_5.Parent = IY

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.0182648394, 0, 0.466386557, 0)
TextLabel_2.Size = UDim2.new(0, 426, 0, 50)
TextLabel_2.Font = Enum.Font.GothamSemibold
TextLabel_2.Text = "Wait Speed       :"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 30.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

Wait.Name = "Wait()"
Wait.Parent = Frame_2
Wait.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Wait.BackgroundTransparency = 1.000
Wait.Position = UDim2.new(0.531963468, 0, 0.466386557, 0)
Wait.Size = UDim2.new(0, 199, 0, 50)
Wait.ZIndex = 99999
Wait.ClearTextOnFocus = false
Wait.Font = Enum.Font.GothamSemibold
Wait.Text = "0.5"
Wait.TextColor3 = Color3.fromRGB(255, 255, 255)
Wait.TextSize = 30.000
Wait.TextWrapped = true

--Sound Service:
local notification = Instance.new("Sound")
notification.Parent = game:GetService("SoundService")
notification.SoundId = "rbxassetid://9086208751"
notification.Volume = 5
notification.Name = ". Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ"

--funuction:
Exit.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
local Mute = false
IY.MouseButton1Click:Connect(function()
	Mute = false
end)

_1E.MouseButton1Click:Connect(function()
	Mute = true
	while Mute == true do 
		wait()
		for _, sound in next, workspace:GetDescendants() do
			if sound:IsA("Sound") then
				sound:Stop()
			end
		end
	end
end)

_3E.MouseButton1Click:Connect(function()
	for _, sound in next, workspace:GetDescendants() do
		if sound:IsA("Sound") then
			sound:Play()
		end
	end
end)

local Active = true
SE.MouseButton1Click:Connect(function()
	Active = true
	while Active == true do
		local StringValue = Wait.Text
		wait(StringValue)
		for _, sound in next, workspace:GetDescendants() do
			if sound:IsA("Sound") then
				sound:Play()
			end
		end
	end
end)

Stop.MouseButton1Click:Connect(function()
	Active = false
end)
--Credit:
notification:Play()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "FEAG";
	Text = "FEAG Has Been Loaded , Made By Scripty#2063 (gamer14_123)";
	Icon = "";
	Duration = 10; 
	Button1 = "Yes Sir";
})
--Check:
while true do
	wait(0.5)
	local setting = game:GetService("SoundService").RespectFilteringEnabled
	if setting == true then
		Time.TextColor = BrickColor.new(255,0,0)
		Time.Text ="RespectFilteringEnabled(RFE) : true"
	elseif setting == false then
		Time.Text ="RespectFilteringEnabled(RFE) : false"
		Time.TextColor = BrickColor.new(0,255,0)
	end
end
   end,
})


local Button = Tab:CreateButton({
   Name = "Purgatory(Wesd)",
   Callback = function()
   -- // Purgatory Script | Velocity v5 // --
-- // Library: Kavo UI // --
-- // Open Source Version // --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Purgatory | Velocity v5", "Midnight")

-- // Services // --
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- // Variables // --
local LocalPlayer = Players.LocalPlayer
local Remotes = ReplicatedStorage:WaitForChild("OnServerEvents")

local CombatRemote = Remotes:WaitForChild("CombatServer", 5)
local DodgeRemote = Remotes:WaitForChild("DodgeServer", 5)
local VisualRemote = Remotes:WaitForChild("PlrFxRelay", 5) 
local UpgradeRemote = Remotes:WaitForChild("UpgradeSelected", 5)

-- // Settings // --
local Settings = {
    AutoAttack = false,
    AttackDist = 15,
    
    AutoDodge = false,
    DodgeSpeed = 0.1, 
    DodgeID = 5,
    RandomizeDodge = false,
    
    SpeedEnabled = false, 
    WalkSpeed = 50,       
    
    SelectedUpgrade = "Power" -- Default
}

-- // Upgrade List // --
-- Sourced from Game Wiki & Data
local UpgradeList = {
    -- Basic / Common
    "Power",
    "Agility",
    "Vitality",
    "Force",
    "Regeneration",
    
    -- Advanced / Rare
    "Fleetfoot",
    "Perfect Dodge",
    "Shatter",
    "Brute Force",
    "Maestro",
    "Health Pack",
    "Survivor",
    
    -- Legendary
    "Giantslayer",
    "Blackhole",
    "Cataclysm",
    "Reaper",
    "Juggernaut",
    "Second Wind",
    "Assassin",
    
    -- Divine / Special
    "Cleave",
    "Glass Cannon",
    "Turtle",
    "The Force in Reverse"
}

-- // Tabs // --
local CombatTab = Window:NewTab("Combat")
local CombatSection = CombatTab:NewSection("Offense")
local DodgeSection = CombatTab:NewSection("Auto Dodge")

local MoveTab = Window:NewTab("Movement")
local MoveSection = MoveTab:NewSection("Speed Logic")

local MiscTab = Window:NewTab("Misc")
local MiscSection = MiscTab:NewSection("Bypass Upgrades")

-- // Functions // --

local function GetClosestEnemy()
    local Character = LocalPlayer.Character
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")
    if not Root then return nil end

    local ClosestDist = Settings.AttackDist
    local ClosestEnemy = nil
    
    local EnemiesFolder = Workspace:FindFirstChild("Enemies")
    if EnemiesFolder then
        for _, Enemy in pairs(EnemiesFolder:GetChildren()) do
            if Enemy:FindFirstChild("HumanoidRootPart") and Enemy:FindFirstChild("Humanoid") then
                if Enemy.Humanoid.Health > 0 then
                    local Dist = (Root.Position - Enemy.HumanoidRootPart.Position).Magnitude
                    if Dist < ClosestDist then
                        ClosestDist = Dist
                        ClosestEnemy = Enemy
                    end
                end
            end
        end
    end
    return ClosestEnemy
end

local function Attack(Target)
    if not CombatRemote then return end
    
    local args = {
        Target.HumanoidRootPart,
        "Melee",
        {
            ["dismantle"] = true, 
            ["riposte"] = false,
            ["backstab"] = true 
        }
    }
    
    pcall(function()
        CombatRemote:FireServer(unpack(args))
    end)
end

-- // Combat UI // --

CombatSection:NewToggle("Kill Aura (OP)", "Instantly kills enemies in range.", function(state)
    Settings.AutoAttack = state
end)

CombatSection:NewSlider("Attack Range", "Range to start killing.", 50, 5, function(value)
    Settings.AttackDist = value
end)

-- // Dodge UI // --

DodgeSection:NewToggle("Auto Dodge", "Enable the dodge loop.", function(state)
    Settings.AutoDodge = state
end)

DodgeSection:NewToggle("Randomize ID", "Cycles random IDs (1-6) automatically.", function(state)
    Settings.RandomizeDodge = state
end)

DodgeSection:NewSlider("Dodge Speed", "How fast to spam (Lower = Faster)", 20, 1, function(value)
    Settings.DodgeSpeed = value / 20 
end)

DodgeSection:NewSlider("Manual ID", "Only used if Randomize is OFF.", 10, 1, function(value)
    Settings.DodgeID = value
end)

-- // Movement UI // --

MoveSection:NewToggle("Enable Speed Loop", "Forces your WalkSpeed constantly.", function(state)
    Settings.SpeedEnabled = state
end)

MoveSection:NewSlider("WalkSpeed Amount", "Set your speed.", 100, 16, function(value)
    Settings.WalkSpeed = value
end)

-- // Misc UI // --

MiscSection:NewDropdown("Select Upgrade", "Choose from the Full Wiki List", UpgradeList, function(currentOption)
    Settings.SelectedUpgrade = currentOption
end)

MiscSection:NewTextBox("Custom Name", "Type a name here to override (e.g. Vampirism)", function(txt)
    if txt and txt ~= "" then
        Settings.SelectedUpgrade = txt
    end
end)

MiscSection:NewButton("Apply Upgrade", "Spam this to force the upgrade.", function()
    if UpgradeRemote then
        -- This fires whatever is currently set in Settings.SelectedUpgrade
        local args = {
            Settings.SelectedUpgrade,
            {},
            1
        }
        UpgradeRemote:FireServer(unpack(args))
    end
end)

MiscSection:NewLabel("Current Selection: Check Console (F9) if unsure")

-- // Loops // --

-- Attack Loop
task.spawn(function()
    while true do
        task.wait() 
        if Settings.AutoAttack then
            local Target = GetClosestEnemy()
            if Target then
                Attack(Target)
            end
        end
    end
end)

-- Dodge Loop
task.spawn(function()
    while true do
        if Settings.AutoDodge then
            pcall(function()
                local currentID = Settings.DodgeID
                if Settings.RandomizeDodge then
                    currentID = math.random(1, 6)
                end

                DodgeRemote:FireServer(currentID)
                
                if VisualRemote then
                    VisualRemote:FireServer("Dash")
                end
            end)
        end
        task.wait(Settings.DodgeSpeed)
    end
end)

-- Speed Loop
RunService.RenderStepped:Connect(function()
    if Settings.SpeedEnabled then
        pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = Settings.WalkSpeed
            end
        end)
    end
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Da Strike",
   Callback = function()
   --// Dahood games
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Dahood Games",
    Icon = 0,
    LoadingTitle = "Open source, Safe, Free, Undetected",
    LoadingSubtitle = "by Wesd",
    ShowText = "Capybara hub",
    Theme = "Default",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "CapybaraHub_DahoodGames"
    }
})

local Tab = Window:CreateTab("Main", 4483362458)
local PriorityTab = Window:CreateTab("Target Priority", 4483362458)

-- Silent Aim Settings
local SilentAimEnabled = false
local PredictionEnabled = false
local PredictionAmount = 0.15
local FOVRadius = 100
local FOVCircleVisible = true
local FOVCircleColor = Color3.fromRGB(255, 255, 255)
local FOVCircleThickness = 1.5

-- Priority Settings
local IgnoreDead = true
local DeadHPThreshold = 0
local IgnoreTeam = false
local WallPriority = false
local PriorityMode = "Closest to Crosshair"

-- Target Bind
local TargetBindKey = Enum.KeyCode.T
local LockedTarget = nil
local TargetBindActive = false

-- Mouse, Camera
local mouse = game.Players.LocalPlayer:GetMouse()
local camera = workspace.CurrentCamera

-- Create FOV Circle
local fovCircle = Drawing.new("Circle")
fovCircle.Radius = FOVRadius
fovCircle.Color = FOVCircleColor
fovCircle.Thickness = FOVCircleThickness
fovCircle.Transparency = 1
fovCircle.Filled = false

-- Highlight Instance
local currentHighlight = nil

-- Update FOV Circle
task.spawn(function()
    while task.wait() do
        fovCircle.Visible = FOVCircleVisible
        fovCircle.Position = Vector2.new(mouse.X, mouse.Y + game:GetService("GuiService"):GetGuiInset().Y)
        fovCircle.Radius = FOVRadius
        fovCircle.Color = FOVCircleColor
        fovCircle.Thickness = FOVCircleThickness
    end
end)

-- Check if Player is Behind Wall
local function IsBehindWall(char)
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return true end
    local ray = Ray.new(camera.CFrame.Position, (hrp.Position - camera.CFrame.Position).Unit * (hrp.Position - camera.CFrame.Position).Magnitude)
    local hitPart = workspace:FindPartOnRayWithIgnoreList(ray, {game.Players.LocalPlayer.Character})
    return hitPart and hitPart:IsDescendantOf(char) == false
end

-- Apply Highlight
local function HighlightTarget(player)
    if currentHighlight then
        currentHighlight:Destroy()
        currentHighlight = nil
    end
    if player and player.Character then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = player.Character
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlight.Parent = player.Character
        currentHighlight = highlight
    end
end

-- Get Target
local function GetTarget()
    if TargetBindActive and LockedTarget and LockedTarget.Character then
        return LockedTarget
    end

    local candidates = {}
    local visibleCandidates = {}

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                if IgnoreDead and humanoid.Health <= DeadHPThreshold then
                    continue
                end
                if IgnoreTeam and player.Team == game.Players.LocalPlayer.Team then
                    continue
                end
                local pos, onScreen = camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                if onScreen then
                    local mag = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(pos.X, pos.Y)).Magnitude
                    if mag <= FOVRadius then
                        local behindWall = IsBehindWall(player.Character)
                        table.insert(candidates, {Player = player, Mag = mag, HP = humanoid.Health, Wall = behindWall})
                        if not behindWall then
                            table.insert(visibleCandidates, {Player = player, Mag = mag, HP = humanoid.Health, Wall = behindWall})
                        end
                    end
                end
            end
        end
    end

    local listToUse = (WallPriority and #visibleCandidates > 0) and visibleCandidates or candidates
    if #listToUse == 0 then return nil end

    if PriorityMode == "Closest to Crosshair" then
        table.sort(listToUse, function(a, b) return a.Mag < b.Mag end)
    elseif PriorityMode == "Lowest HP" then
        table.sort(listToUse, function(a, b) return a.HP < b.HP end)
    elseif PriorityMode == "Highest HP" then
        table.sort(listToUse, function(a, b) return a.HP > b.HP end)
    end

    return listToUse[1].Player
end

-- Keybind Handling
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == TargetBindKey then
        if not TargetBindActive then
            local potentialTarget = GetTarget()
            if potentialTarget then
                LockedTarget = potentialTarget
                TargetBindActive = true
            end
        else
            LockedTarget = nil
            TargetBindActive = false
        end
    end
end)

-- Silent Aim Loop
task.spawn(function()
    while task.wait() do
        if SilentAimEnabled then
            local target = GetTarget()
            HighlightTarget(target)
            if target then
                local hrp = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local coords = hrp.Position
                    if PredictionEnabled then
                        coords = coords + (hrp.Velocity * PredictionAmount)
                    end
                    game:GetService("ReplicatedStorage"):WaitForChild("MAINEVENT"):FireServer("MOUSE", coords)
                end
            end
        else
            HighlightTarget(nil)
        end
    end
end)

-- UI Controls
Tab:CreateToggle({
    Name = "Enable Silent Aim",
    CurrentValue = false,
    Callback = function(val) SilentAimEnabled = val end
})

Tab:CreateToggle({
    Name = "Enable Prediction",
    CurrentValue = false,
    Callback = function(val) PredictionEnabled = val end
})

Tab:CreateSlider({
    Name = "Prediction Amount",
    Range = {0, 1},
    Increment = 0.01,
    Suffix = "s",
    CurrentValue = PredictionAmount,
    Callback = function(val) PredictionAmount = val end
})

Tab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = true,
    Callback = function(val) FOVCircleVisible = val end
})

Tab:CreateSlider({
    Name = "FOV Radius",
    Range = {50, 500},
    Increment = 1,
    Suffix = "px",
    CurrentValue = FOVRadius,
    Callback = function(val) FOVRadius = val end
})

PriorityTab:CreateToggle({
    Name = "Ignore Dead Players",
    CurrentValue = true,
    Callback = function(val) IgnoreDead = val end
})

PriorityTab:CreateSlider({
    Name = "Dead HP Threshold",
    Range = {0, 100},
    Increment = 1,
    Suffix = "hp",
    CurrentValue = DeadHPThreshold,
    Callback = function(val) DeadHPThreshold = val end
})

PriorityTab:CreateToggle({
    Name = "Ignore Teammates",
    CurrentValue = false,
    Callback = function(val) IgnoreTeam = val end
})

PriorityTab:CreateToggle({
    Name = "Wall Priority",
    CurrentValue = false,
    Callback = function(val) WallPriority = val end
})

PriorityTab:CreateDropdown({
    Name = "Priority Mode",
    Options = {"Closest to Crosshair", "Lowest HP", "Highest HP"},
    CurrentOption = {PriorityMode},
    Callback = function(opt) PriorityMode = opt[1] end
})

PriorityTab:CreateLabel("Target Bind Key: T (toggle lock on current target)")

Tab:CreateButton({
    Name = "Unload Script",
    Callback = function()
        if currentHighlight then currentHighlight:Destroy() end
        fovCircle:Remove()
        Rayfield:Destroy()
        script:Destroy()
    end
})

   end,
})

local Button = Tab:CreateButton({
   Name = "Inventory Viewer",
   Callback = function()
   
--// services
local ts = game:GetService("TweenService")
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local players = game:GetService("Players")

--// config
local lp = players.LocalPlayer
if not lp then return end

local CONFIG = {
	distance = 16,
	scrollSpeed = 20,
	animTime = 0.3,
	platforms = {
		PC = {"rbxassetid://10688463768", Color3.fromRGB(80, 140, 220)},
		Mobile = {"rbxassetid://10688464303", Color3.fromRGB(80, 220, 120)},
		Console = {"rbxassetid://10688463319", Color3.fromRGB(220, 80, 80)},
		Unknown = {"", Color3.fromRGB(150, 150, 150)}
	}
}

--// 'secret' state management
_G.BillboardState = {
	enabled = true,
	uis = {}, -- { [Player]: { gui, root, main, currentState, tweens } }
	activeScroller = nil
}

--// functions
local function getPlayerPlatform(player)
	local platform = "Unknown"
	if player.GameplayPaused then platform = "Mobile" end
	if uis:GetPlatform() == Enum.Platform.Windows and player == lp then platform = "PC" end
	return platform
end

local function animate(state, direction)
	if state.tweens then
		for _, t in ipairs(state.tweens) do t:Cancel() end
	end
	state.tweens = {}

	local transparencyGoal, sizeGoal
	if direction == "in" then
		transparencyGoal, sizeGoal = 0.2, UDim2.fromScale(1, 1)
	else
		transparencyGoal, sizeGoal = 1, UDim2.fromScale(0.8, 0.8)
	end
	
	local transparencyTween = ts:Create(state.main, TweenInfo.new(CONFIG.animTime, Enum.EasingStyle.Quint), {BackgroundTransparency = transparencyGoal})
	local sizeTween = ts:Create(state.root, TweenInfo.new(CONFIG.animTime, Enum.EasingStyle.Quint), {Size = sizeGoal})

	table.insert(state.tweens, transparencyTween)
	table.insert(state.tweens, sizeTween)
	
	transparencyTween:Play()
	sizeTween:Play()
	
	return sizeTween
end

local function createElements(player)
	local state = { currentState = "hidden", tweens = {} }
	
	state.gui = Instance.new("BillboardGui")
	state.gui.Name, state.gui.AlwaysOnTop = "PlayerInfo", true
	state.gui.Size, state.gui.StudsOffset = UDim2.fromOffset(200, 80), Vector3.new(0, 2.2, 0)

	state.root = Instance.new("Frame", state.gui)
	state.root.Name, state.root.BackgroundTransparency = "Root", 1
	state.root.ClipsDescendants, state.root.AnchorPoint = true, Vector2.new(0.5, 0.5)
	state.root.Position, state.root.Size = UDim2.fromScale(0.5, 0.5), UDim2.fromScale(0.8, 0.8)

	state.main = Instance.new("Frame", state.root)
	state.main.Name, state.main.Size = "Main", UDim2.fromScale(1, 1)
	state.main.BackgroundColor3 = Color3.fromRGB(30, 32, 38)
	state.main.Active, state.main.BackgroundTransparency = true, 1
	Instance.new("UICorner", state.main).CornerRadius = UDim.new(0, 6)
	Instance.new("UIStroke", state.main).Color = Color3.fromRGB(10, 11, 13)

	local platformIcon = Instance.new("ImageLabel", state.main)
	platformIcon.Name, platformIcon.Size = "PlatformIcon", UDim2.fromOffset(14, 14)
	platformIcon.Position, platformIcon.BackgroundTransparency = UDim2.new(0, 4, 0, 4), 1

	local healthBar = Instance.new("Frame", state.main)
	healthBar.Name = "HealthBar"
	-- FIX: Positioned at the top center
	healthBar.Size = UDim2.new(0.8, 0, 0, 8)
	healthBar.Position = UDim2.new(0.5, 0, 0, 4)
	healthBar.AnchorPoint = Vector2.new(0.5, 0)
	healthBar.BackgroundColor3 = Color3.fromRGB(10, 11, 13)
	Instance.new("UICorner", healthBar).CornerRadius = UDim.new(1, 0)
	
	local healthFill = Instance.new("Frame", healthBar)
	healthFill.Name, healthFill.Size = "Fill", UDim2.fromScale(1, 1)
	healthFill.BackgroundColor3 = Color3.fromRGB(80, 220, 120)
	Instance.new("UICorner", healthFill).CornerRadius = UDim.new(1, 0)
	
	local scroller = Instance.new("ScrollingFrame", state.main)
	scroller.Name = "Backpack"
	-- FIX: Adjusted to fit below the new healthbar position
	scroller.Size = UDim2.new(1, -10, 1, -18)
	scroller.Position = UDim2.new(0.5, 0, 1, -4)
	scroller.AnchorPoint = Vector2.new(0.5, 1)
	scroller.BackgroundTransparency, scroller.BorderSizePixel = 1, 0
	scroller.ScrollBarThickness, scroller.AutomaticCanvasSize = 4, Enum.AutomaticSize.Y
	scroller.MouseEnter:Connect(function() _G.BillboardState.activeScroller = scroller end)
	scroller.MouseLeave:Connect(function() _G.BillboardState.activeScroller = nil end)

	local grid = Instance.new("UIGridLayout", scroller)
	grid.CellSize, grid.CellPadding = UDim2.fromOffset(28, 28), UDim2.fromOffset(4, 4)
	grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
	
	local tooltip = Instance.new("TextLabel", scroller)
	tooltip.Name, tooltip.Size = "Tooltip", UDim2.new(1, 0, 0, 20)
	tooltip.Position, tooltip.BackgroundColor3 = UDim2.new(0, 0, 1, 22), Color3.fromRGB(10, 11, 13)
	tooltip.Font, tooltip.TextColor3, tooltip.TextSize = Enum.Font.SourceSans, Color3.new(1, 1, 1), 14
	tooltip.Visible = false
	Instance.new("UICorner", tooltip).CornerRadius = UDim.new(0, 4)
	
	_G.BillboardState.uis[player] = state
	return state
end

local function updateUI(player, char)
	if not _G.BillboardState.enabled then return end
	local state = _G.BillboardState.uis[player]
	if not (state and state.gui) then return end
	
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		local health = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
		local fill = state.main.HealthBar.Fill
		fill.Size = UDim2.fromScale(health, 1)
		fill.BackgroundColor3 = Color3.fromHSV(0.33 * health, 0.7, 0.8)
	end
	
	local pData = CONFIG.platforms[getPlayerPlatform(player)]
	local pIcon = state.main.PlatformIcon
	pIcon.Image, pIcon.ImageColor3 = pData[1], pData[2]

	local scroller = state.main.Backpack
	local tooltip = scroller.Tooltip
	for _, child in scroller:GetChildren() do
		if child:IsA("ImageButton") then child:Destroy() end
	end
	
	for _, tool in player.Backpack:GetChildren() do
		if tool:IsA("Tool") then
			local icon = Instance.new("ImageButton", scroller)
			icon.Size, icon.BackgroundTransparency, icon.Image = UDim2.fromScale(1, 1), 1, tool.TextureId
			icon.MouseEnter:Connect(function() tooltip.Text, tooltip.Visible, tooltip.Parent = tool.Name, true, icon end)
			icon.MouseLeave:Connect(function() tooltip.Visible, tooltip.Parent = false, scroller end)
			icon.MouseButton1Click:Connect(function() tool:Clone().Parent = lp.Backpack end)
		end
	end
end

--// main loop
rs.Heartbeat:Connect(function()
	if not _G.BillboardState.enabled then return end
	local localChar = lp.Character
	if not (localChar and localChar.PrimaryPart) then return end
	local localPos = localChar.PrimaryPart.Position
	
	for _, player in players:GetPlayers() do
		if player == lp then continue end
		
		local state = _G.BillboardState.uis[player] or createElements(player)
		local char = player.Character

		if char and char.PrimaryPart and char:FindFirstChild("Head") then
			local dist = (localPos - char.PrimaryPart.Position).Magnitude
			
			if dist <= CONFIG.distance and state.currentState == "hidden" then
				state.currentState = "visible"
				state.gui.Adornee = char.Head
				state.gui.Parent = char.Head
				animate(state, "in")
			elseif dist > CONFIG.distance and state.currentState == "visible" then
				state.currentState = "hidden"
				local tween = animate(state, "out")
				tween.Completed:Wait()
				if state.currentState == "hidden" then state.gui.Parent = nil end
			end

			if state.currentState == "visible" then updateUI(player, char) end
		elseif state.currentState == "visible" then
			state.currentState = "hidden"
			state.gui.Parent = nil
		end
	end
end)

--// controller & cleanup
uis.InputChanged:Connect(function(input)
	if not _G.BillboardState.enabled or not _G.BillboardState.activeScroller then return end
	if input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.Gamepad1_Thumbstick2 then
		local scroller = _G.BillboardState.activeScroller
		scroller.CanvasPosition -= Vector2.new(0, input.Position.Y * CONFIG.scrollSpeed)
	end
end)

players.PlayerRemoving:Connect(function(player)
	if _G.BillboardState.uis[player] then
		_G.BillboardState.uis[player].gui:Destroy()
		_G.BillboardState.uis[player] = nil
	end
end)

lp.Chatted:Connect(function(msg)
	if msg == "#FreeSchlep" and _G.BillboardState.enabled then
		_G.BillboardState.enabled = false
		for _, state in pairs(_G.BillboardState.uis) do state.gui:Destroy() end
		_G.BillboardState.uis = {}
	end
end)

   end,
})

local Tab = Window:CreateTab("Hubs", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Script Hubs")

local Button = Tab:CreateButton({
   Name = "Orca Hub",
   Callback = function()
   
loadstring(
  game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua")
)()

   end,
})

local Button = Tab:CreateButton({
   Name = "IY",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Placeholder Game Script",
   Callback = function()

-- Roblox placeholder game script
-- Optimized for Velocity / UNC 94%

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- // UI Library Configuration
local Theme = {
    Main = Color3.fromRGB(15, 15, 15),
    Secondary = Color3.fromRGB(20, 20, 20),
    Accent = Color3.fromRGB(124, 92, 252), -- Purple/Blue hybrid (DomainX style)
    Text = Color3.fromRGB(255, 255, 255),
    DarkText = Color3.fromRGB(160, 160, 160)
}

-- // Clean up existing
if CoreGui:FindFirstChild("PlaceholderHub") then
    CoreGui.PlaceholderHub:Destroy()
end

-- // Main UI Construction
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PlaceholderHub"
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 350)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)
MainFrame.BackgroundColor3 = Theme.Main
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 6)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Theme.Accent
MainStroke.Thickness = 1.2

-- // Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 140, 1, 0)
Sidebar.BackgroundColor3 = Theme.Secondary
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 6)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "PLACEHOLDER"
Title.TextColor3 = Theme.Accent
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = Sidebar

-- // Content Area
local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -150, 1, -20)
Content.Position = UDim2.new(0, 150, 0, 10)
Content.BackgroundTransparency = 1
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 0
Content.CanvasSize = UDim2.new(0, 0, 0, 0)
Content.Parent = MainFrame

local Layout = Instance.new("UIListLayout", Content)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 6)

-- // Dragging Logic (Human-style implementation)
local function makeDraggable(frame, handle)
    local dragging, dragInput, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end
makeDraggable(MainFrame, Sidebar)

-- // UI Components
local function AddToggle(name, desc, callback)
    local ToggleBase = Instance.new("Frame")
    ToggleBase.Size = UDim2.new(1, -10, 0, 45)
    ToggleBase.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    ToggleBase.BorderSizePixel = 0
    ToggleBase.Parent = Content
    Instance.new("UICorner", ToggleBase).CornerRadius = UDim.new(0, 4)

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -50, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 4)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Theme.Text
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = ToggleBase

    local Description = Instance.new("TextLabel")
    Description.Size = UDim2.new(1, -50, 0, 15)
    Description.Position = UDim2.new(0, 10, 0, 22)
    Description.BackgroundTransparency = 1
    Description.Text = desc
    Description.TextColor3 = Theme.DarkText
    Description.Font = Enum.Font.Gotham
    Description.TextSize = 10
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.Parent = ToggleBase

    local Clicker = Instance.new("TextButton")
    Clicker.Size = UDim2.new(1, 0, 1, 0)
    Clicker.BackgroundTransparency = 1
    Clicker.Text = ""
    Clicker.Parent = ToggleBase

    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 30, 0, 16)
    Indicator.Position = UDim2.new(1, -40, 0.5, -8)
    Indicator.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Indicator.Parent = ToggleBase
    Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 12, 0, 12)
    Dot.Position = UDim2.new(0, 2, 0.5, -6)
    Dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Dot.Parent = Indicator
    Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)

    local enabled = false
    Clicker.MouseButton1Click:Connect(function()
        enabled = not enabled
        local targetPos = enabled and UDim2.new(0, 16, 0.5, -6) or UDim2.new(0, 2, 0.5, -6)
        local targetCol = enabled and Theme.Accent or Color3.fromRGB(40, 40, 40)
        
        TweenService:Create(Dot, TweenInfo.new(0.2), {Position = targetPos}):Play()
        TweenService:Create(Indicator, TweenInfo.new(0.2), {BackgroundColor3 = targetCol}):Play()
        
        callback(enabled)
    end)
    
    Content.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 20)
end

-- // Game Logic Implementation

-- 1. Coin Magnet
local magnetLoop
AddToggle("Coin Magnet", "Instantly collects all coins on the map.", function(state)
    if state then
        magnetLoop = RunService.Heartbeat:Connect(function()
            local coins = workspace:FindFirstChild("Gameplay") and workspace.Gameplay:FindFirstChild("CoinPickups")
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if coins and hrp then
                for _, coin in pairs(coins:GetChildren()) do
                    if coin:IsA("BasePart") then
                        firetouchinterest(hrp, coin, 0)
                        firetouchinterest(hrp, coin, 1)
                    end
                end
            end
        end)
    else
        if magnetLoop then magnetLoop:Disconnect() end
    end
end)

-- 2. Super Roll
AddToggle("Super Roll", "Gives a massive velocity boost when rolling.", function(state)
    _G.SuperRoll = state
    local remote = ReplicatedStorage:FindFirstChild("Platformer") and ReplicatedStorage.Platformer.Remotes:FindFirstChild("SetAction")
    
    if state then
        task.spawn(function()
            while _G.SuperRoll do
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp and UserInputService:IsKeyDown(Enum.KeyCode.Q) then -- Q is usually roll
                    remote:FireServer("Roll")
                    hrp.AssemblyLinearVelocity = hrp.CFrame.LookVector * 180
                    task.wait(0.5)
                end
                task.wait()
            end
        end)
    end
end)

-- 3. LongJump Flight
local flightLoop
AddToggle("LongJump Flight", "Spams LongJump remotes to glide infinitely.", function(state)
    if state then
        flightLoop = RunService.Heartbeat:Connect(function()
            local remote = ReplicatedStorage:FindFirstChild("Platformer") and ReplicatedStorage.Platformer.Remotes:FindFirstChild("SetAction")
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if remote and hrp and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                remote:FireServer("LongJump")
                hrp.AssemblyLinearVelocity = hrp.AssemblyLinearVelocity + Vector3.new(0, 5, 0)
            end
        end)
    else
        if flightLoop then flightLoop:Disconnect() end
    end
end)

-- 4. Stun Immunity
local stunConnection
AddToggle("Stun Immunity", "Prevents the landing stun animation.", function(state)
    if state then
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        stunConnection = char.Humanoid.AnimationPlayed:Connect(function(track)
            if track.Name == "Stun" or track.Name == "Recover" then
                track:Stop()
            end
        end)
    else
        if stunConnection then stunConnection:Disconnect() end
    end
end)

-- 5. Visual ESP
local highlights = {}
AddToggle("Platform Visuals", "Highlights moving platforms and the goal.", function(state)
    if state then
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "EndWaypoint" or (v.Name == "BASE" and v.Parent.Name == "Platformer_Moving_a") then
                local h = Instance.new("Highlight", v)
                h.FillColor = (v.Name == "EndWaypoint") and Color3.new(0, 1, 0) or Color3.new(1, 0.5, 0)
                h.FillTransparency = 0.5
                table.insert(highlights, h)
            end
        end
    else
        for _, h in pairs(highlights) do h:Destroy() end
        highlights = {}
    end
end)

-- // Final UI Polish
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 20, 0, 20)
CloseBtn.Position = UDim2.new(1, -25, 0, 10)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextSize = 20
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = MainFrame
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

print("Placeholder Hub Loaded.")

   end,
})


local Button = Tab:CreateButton({
   Name = "Owl Hub",
   Callback = function()

--[[
Created by Google Chrome and CriShoux
Redistributed by WeAreDevs: https://wearedevs.net/scripts

Description: One of the most popular script hubs. 30+ games.

Instruction: Execute this script and wait for an interface to appear on your game screen.

]]

return(function(B,e,o,n,a,C,l)local d=select;local o=table.insert;local S=unpack or table.unpack;local f=string.char;local c=string.sub;local Q=setmetatable;local D=table.concat;local F=string.byte;local E=getfenv or function()return _ENV end;local Y=l;local t={}for e=a,255 do t[e]=f(e)end;local function i(A)local l,o,X=e,e,{}local I=C;local e=n;local function S()local l=Y(c(A,e,e),36)e=e+n;local n=Y(c(A,e,e+l-n),36)e=e+l;return n end;l=f(S())X[n]=l;while e<#A do local e=S()if t[e]then o=t[e]else o=l..c(l,n,1)end;t[I]=l..c(o,n,1)X[#X+n],l,I=o,o,I+n end;return D(X)end;local Y=i('24124L24124124527624126U26O27026S24124B27925Y26S26D25E26S26B26F26W26Q27E24A27926126D26D26927L27N27P27E24927926027326A26D26O27327Q24124227927326S26E24124627925J26S26Q26D27226B24J24124727925U27227128O24I27727925F28L26D24124827925E26Q26B26S26S27325Y26C26W27F28327026O26U26S26526O26R26S27124124427925Z26B27C27R29H29J26S25V26C27V27227329427925H26S26H26D29M29O29Q27827626729W24124D27H29B27M26O26D26S25Y25G26025X28R27925D26O29927329328I27628U29929D29F27S27625S28926X28O25D27226W2B024027927923524U24123L27925V26O26Q26Y26U26B27226C27326T28U28W26B24I2BI2BJ24122P2BM23R2BP2BR2BT2BV2BX26T25H29V2852692AY29B26Q26G24124E2BP28O26T27M25E26W26J26S25D26W26H29P2C42C52762BO2B327126W26926A25X26S26A27Q2BY28826D26A2432BI2822762BE26A26W26D26W2A429R27925G25X26W27028Q29S27626029I29K24125727926X27V26924R25A25A26E2EE25B2BV26R28W26H25B26Q27227025A26O26A26A27J25A24U26W26T24S24L24K24I24H24I24G24P24M24P24G2412B82412E229Z2C028X24021Z25R22Z26423Q23T2152BM29527629726O27126S25H26G26927E2AF24125W27326C2702DT2FQ2D728A2FA25E2G726S25U29B2AP26B2D227924L25T2GH27626N25T2E52E72E92EB2ED2EF2EH2EJ2EL2EN2EP2ER2ET2EV2EX24L24I2F524H24M24L2H72752AK27625V2CR27M2FE2C224021R25824T25A23O23U21624U24021I24T21723K23R23O22C2HR26923H22026A181B22J2HR2C51H25S2GO2FZ2CU2CW2GL24126D2GK2D325K2GO2B224125J26W2DO2EI26S24324124025W23I25425T23426J2BL24021S23C26G24M23R23P21X2BM23K29Y29K2CG28826A2CJ2AZ2CM28Z27625Z2A42932CP2FQ2BW26B27Q25E2JH26526W26U2E82JM2412A82AA2412C927625G27326W26F27M26A2FS24X25S2DX26R27226D24X25324X25W25E25D29G2762K426D2HH28Y2DL2K32A927K2CV26S2GL1H25V2IJ2BJ23526C2L72BJ24O2GO2E62762E827W2GS2EE26E2EG2722EI2722EK2EM2EO2EQ2ES26D2EU2EW2EY2F02F224G24O2M124J2401T22V26H24W23W23Z21B2I82C523P2LB2761X2LA2GP2LG2GR2EC2LK2LM2LO2LQ2GY2LT2H12LX24L24N24P2F724K2MW24O28Y28C2JN2DP2AJ27T2E927I26D25S26A26G28924125Z2GQ27W26A2GS29V2LL26U2DP26X26C26R26C2ES2JU2JP2GE2GX2EO25U26B26W25E2BC26C26H25A26626E2712612NR25A29I28627M25A27B27D2JY28625B26Z26A2DS27G27626325E2662672DB2EM2CS2G52412CJ26W26B26A2412KY28N2862O127326U28H2AW2712BR26S26026T24125S2NI2D92NL26O2NN2NP2NR2NT27M2EM2B02NX2LR25A2O02O22O42O62O82OA2OC2OE2GF25A2DD2O12692DH25A2AV2FQ2982D82932E02412JI2PO2A52672PL2NK2EC2NM25B2NO26D2NQ2NS2NU2PU2AP2B02NY2PY2O12O32BW2Q22O92OB26R2OD2EQ2Q72Q92QH26A25A2K92KB2KD2FS25B27126C26O2A62KT26E29A2732IE2L32D325R2GO2JR2G02EQ2BG26U2DW29928M2DR2A52N42412662A22F927925W2S22PA25E26D26G2FT2K225C2RO26T24023Y1K23E25C21523Z21W2MD2BJ25H2IC27926E26O2DP2GL22926R2GO2HC2K32RS29B27Y27O28A2D524125G2NU2842692A22TF2802KS2FB2732TN26D25V26S27B2A52IN28U27328E28M2N72E12TT2A225U26X28829K2PI28S2B32992AO27E2FP2TC2RT28426V27224026824S24B21Y21E26922K2BM2IN26V2BV27025F25Y25V2GL24X26Q2MG24122925I2V81H25U2V82352722GO2OQ2TS2TU2G12CS2PI2JD2762642BW2ES2A12A327324G25U2G726Y24025425P1U22B22S2552392HR22K22L2WB2WB23H24U2UJ28B2762UE2412KW2PC2762UZ2EN26125E25J2IG2C72GL25T2VH2TR2KU2WL2FZ2T42N62BJ23N27923N25N2411R2AU2IV2792KM2X92XB2762IU2X52XF2BI2SA2XJ2XA2IU2FZ2XN25X28C2SA24526R2XK2BN2XC24127E2XA2QJ27925B2XF2WJ27624X2762XA28I2782782XR2822XM2YA25X2952SA2792XA28S2952IU2D52Y22DT28S2XR29S2Y72YI29S2BI2BI24523V2XX28S2Z12NH2XA2XH2XZ23X2XF2762D22402IN24124C2DU2TL2U726D2FV2FX2K22G12G32U52412VR2PS2VU28N2VW2P52AW2722DO2DQ2DS2KY2862AY26D2DN2WM2WK2UA2PA26S2PI2U02A42U326D2ZE2YL24F2ZJ27M2TM2TO2872AP2ZP2G22G42SA2VM2C52VJ24125I2ZC2C52Y931122ZD2412XR2BI2IU2Y82YI2Z02XC31142XA311D28C2UE2Z82A6311D2452Z72XB2952C425L31152BJ2C9311K2GH2ZB311W27924023P2XD2GO311G312031172YI2IU311A241311F25X3129311E31282412IU311I311C24123M2XC2XP311O276312M311R2XX2GH2E631252BJ312C2D22FZ312T2D33125312A312Y2XC2YE312K2QJ31352WI312B312K2BI28I24725K2XF2SA311927625C311T27925P313N27628I312528C2C4311Y2XB2GH311A2ZI2K82ZK2TU2ZN2FY2SF310U2ZH2792ZU2ES2VR2KC27D2B02OZ25H2BW26Q26X2BJ240310M2Y824T2XX31162XR312E311B2XF312E2BI312C312E312J2XX2AK313K311N31123152312B253314Q2XC2X7314V312H2XD31582XO315D314X315F312D315D27824728Q31252ZI3153312P31482C4311V2XG2BJ313W31162792AF2KY2DN2DP2S82OZ2DV2DX28Q2SA28E28G310528726B310831012XZ241311S2QJ2FR2SM2WJ26626V26V2LU316I313H31202512BJ2Y125X2GL2472633112278311M315S3174277315S24Y2XZ316Y311D2WI28C312528231753112317H31783112317A2C4317C315D27623N25R315C3134312G312I3127313I2K2312C2XT2DT31812WH2YU2YI2YD2XD318728Z29S312C318828I312C2QJ2GH2YN2WH2C52YS2YW313C2XF29S318Q2BJ2XA318829S2YV31802YY2DT282318G2YT317Y318J2FZ312C28S28S31902YI31972PC312C2IN318I25X2YG313225X28I28I31992XF319K2ZZ2YM25X319B2ZG315G28S2YQ313D317Q315Y316I317Q31402TJ31422A23144310T2ZR31A2314A26S314C26S314E2932FZ25D2PE2CN31202FA24X314P312W315A317W3189317U312F31AS3150312528I315R311231AX317L311K27G317O31592Y825Q31312AF24H2XX2IU313V3112313Y27631A22TK310O2ZL31A62FZ2ZQ2G431A92VS31AB272314D2GE2K231AH26O31AJ2ZD2VJ24X3124316Z3126314S317Q318O315G31BC31C7315K317X311J31C3311Q315L315S31CF2Y031B5312B31B731252Z127631BA31332ZA31BE3120312M2792IN2IP2IR2FT31292BI2WJ2AX2AZ2932UJ25H2TD2RU2L231662DW2DY318K241316B2IG315Z2BJ2RY31A72G42S02SG2DO2PA2S529231652SA2SC2932FA31DP2S32SJ2SL3145313L2SP2SR2ST2SV2SX2SZ2A72T22762X2310J2D32BL310A2DB2P827231BY27625J2BJ23Q313Q31BA31CT312A31CT31CP2YI311631EU311K312A31ES311Z2YL311K2SA312C2BJ27831F7279318V312G2WJ314Y315D28I2XR28C2KY2XR2782UJ318W31FK319A2RQ318S315K319V31932XS2TR318428C27S31FY2N731FL31FX318A2782ZI318D28Z310M318W2S0319Q2762YZ31FS2Z9314U311K31GE31FV2IU31FE31AQ31FH2YI31FJ2X6318A2TI31FO31GS2Y62XY318L31FT315D31FI31G4317Z31FZ31CA31822AK31G331C031G5314831G827831GA318Y31GC31EX2DT2BI2XR2762VP31FV31HK319I2Z9319F27631F631HI27631F931HV2DT31C531GN31AS31GP317Z31FP2XF27831I52YS31I8319R319P31FS31GM31H131GQ31H32XA318231G031IG28C31H8318A31HA31I628Z31G731HB31HF318P2CO31HQ31HJ31GG31C631FA31GK31I031AR31C82PC31H231IA31I731GW31I931JA31IB2KY319Q31IE2XI31IG31IP31II2WH31IK31H431G231IO31J425X318831IS31IQ31HE31FV29S31HH311231GF31HL24131HN311831IW3160311231C931GD318X311T31CV31HI31K831HI310K31F82PD31BX2K231EE2W12W32W52W72BM2BJ314N276316Y2D324X28231GJ31A031F031AP31K731JC2XL31IX31KE31EV31CA314L31IZ31C931K1312A31K42YL31KD313631HY31BD311Z2792B831CX2IQ26W2IS31D12QE24131D431BU31D731D92RV31DC316831DF31DH2D331DJ27931DL31BM314731DO2SH2S42P231DT2DS31DV2SD31DY31MA31E12SM2FZ2SO26O2SQ2SS2SU2SW2SY2IG2T131KK2T531EF2C531EH2VJ28W31MN2P82S32K22OI27E2IN27U27W2NA31EI2DC26D2BV31EM24125O31EP31ER31KF31C631L731F2313X31NM31L031EW31CT31F42XB31HU311T31HX311T31FC315C31I131J531I331JK31J831FR31GV317R31FQ2WG31FD31IF317Z31JJ31FW31H531G131IN31IQ31OF31JS31CA318831IU2YS31JY311K31GF31K9317V31NZ31GL31LS31FF2IU31O431FW31O631GU318Y31IA28S2TI31JF2AV31JH31OE31JQ31IJ31H62WH31OJ318T31IH31JR31IR31ON31G931JW31K531IZ31K031HI31K3312K2XJ31LA31KZ31NV31JQ31KH31J131HZ31OC31GI31CB31J631IG31O631IA29S31P631IC31P931FU31H231OF31PE31OI31FV27831OL31PL31HD24131OP25X31JX31IX31OT31LG31Q42BJ31O0319U31JQ312E31P131GR31O931IQ31Q931IC2XR3198319I31JG31FV28C31QG31JL31PF31IM31QJ31PJ31OM31QN31QP31QR31GZ31GK31HP311231PT2XX31GC2KR31L031RP311K31KC31K4312231Q4311D23O31FS28C3130312K31LF311T31EZ31NP31HS2OZ31Q12K731LG31SC2GH26V311A23N2BO31LK31L827931PB315G31S831L031SQ31C33195319X31QX31H031Q4312E31SY28C2IN31G131SY31J931Q4318U31FS31QT31R731FR319Q29S314T31FQ2D22XR28I310Z31FQ31TG319N316I2YF2TR319Q28I31TN2XA317K31R32XA2952FA319Q28231TU2YJ31TP2YI27G2TB319Q2YP31NQ25X31B331JC27S31A2319Q27G31U327S31TI2YI2AK31TL2XF27S31U3315631TX25X2ZI31UO2XA2AK31U3315Q31JC310M31U82YI2ZI312E312C31KS31GC2XA31P831FS310M2BO319W31IV310M31QP310M2D231V731QO31OD31VA31K2319I31VD315D2YR31QQ2XY310M31VL27631V925X31VB319Q31VR31VF318J31VH31GY318J2BO2Y32XA310M31LD2YI2CP31RY2YI2BO31KC31W22XY31W431IB2X531KS2XF310M2YH2XF2CP31S331UT2BO31WV31FV2JD31WY31WK2JD31WM28S3122310M31NO28S2C931S331X824131EQ23T24131XC23S2412Z32XR310M2ZB31Q431W631SY31WF31JC2BO31XF31UT2JD31WG2XF2X531XU31VC312731X424123U31VM31XC23W24123Z31Y131WS2XA2CP311431FV2BO31YF2XR2JD31YF31VP31WB31VP2YQ2BI318J23Y31VM31XL24124Z31JQ31W624W31CA31W6317A31VT28S31YZ31WP31YN2XQ31WE24125031XS31ZA31JC2JD315831UT2X531ZG31Y12X531Y3316W31VW2YI31V831FS31W131ZP31WL31W7319J31VM31VR31TO2BO2Y731YN31WD31WT312L31ZC31WJ31ZT31VE31ZV31GP31Z625X31WR31JC31WU31ZC31WY31YJ24131X131ZT31X3320A24131X631XG2YI28I31XA320R31TO31XE31FV31XM31YX31VM31XQ320531WW24131Y0320J31XX2XA31XZ31VQ31Y2320O31Y531X7320S24131Y825231Z027931VZ31ZS31WQ31ZU31VT28231W6321Q2XY3201320D31C62XR31XR321431Y031WK3209321T31WO31YB320F320K320H31ZE322831GZ310M320N321T320Q31NO282320U31WK31YC25X2CP25431ZC2LF31WZ241256321B322E2YI28225531Y6322W31XD3215320Y24131XN321K310M3212321831W0323231XV323B31FV2X5259321B31ZL31ZV282321E3233323531VL323731FV2CP321631WH2412Y5323C323S31XY2412QD322C321C321T258322Z2XF28231BA2F824X31CM321W31VY2B92XF321N31YN32232YI295321S324J2XY31JE32023227323931WI321B324I2XF2953225322K3227320I323T32502XF31X0322U31VS324M322G324M320U31NO295320X31YU323N31ZT323P321Y321331YG323D320J28Q31ZH323D31WK323I31VT295323L325E3210325H31Z9323X31VO323V322R325Z25X2X5324031ZK3256324V2413244321F326931Y831YA324Y31UT2CP28Y3214326J322R326L31X2326831TY24131YS326C326Q275312M31YU31YW31XO31VM31YZ323O24131Z2324M31Z531Y131Z8320431ZB3214327A322R31ZJ2XR31ZI323H326P31U431ZN321K324D319Q324G321W324U2XA27G324L2XF27G2BO2WG31YN322L320G321432522XA32543241322V327U320P3245327R2K6322831NO27G325D31ZT325F321O325X32043282323A32633284323E325P31ZT325R31U6326A31YT31ZT326Y323624124K328Y24N31ZV27G3290326T31UC24124M24124P3226326H322B325K320I322O3283329E326O31WM27G24O3289329724R24124Q327L31PP324F31M3321O327Q25X27S327T2XA27S3200329C323Q329E2XR31WX322A320L321O328632A23288329627S325A2YI27S328F321O328H31YN328J31YD325L323T314P323W31JC2X524S327H31WM27S326B320V32AE324832B2329Z321H24124V32A5325I31KQ325K32BC320J32BC329K31ZV27S326S3233328X32723271325G327332BI241327631WK327832AQ327C32A831ZD323C327E2YI327G3241328S31UP241327K31VX329U31VO31M3324H327I2AK32A125X2AK2BO31U0324P329D3263324S3241329Y31IN320C320E329D328L32A9323C32AB31YN32AD32CH32AF32B52AK32AI2XF2AK32AL31YN32AN321W32AP322M32AR329V2GO323C3239321A32C432CE31Y4328V32AM325W31Q2320432CN32BZ326232AV32DT325Q32DL32B131NO2AK321I329T2JR2BM32CB324T327I2ZI32CG2ZI32CJ31Y1320332AQ32CV325J322232E8312732CS31DF325I320I31YA31VO328L328O32BH31VT2ZI32582XF2ZI32D52XA2ZI32D8321W32DA31XP32A632DS2PK32DH2X625V323Y3221328R32EJ325U328G32DP321232DS32BX2YI2JD32632X5327C32DX2YQ329S32F0328U31X731Y832FU31Y832FB326X32DP32BO328I2WK31ZV2ZI32BT31ZT2ZG31Z92S032BY31VK323T2BO2AU327F2G02BJ2JD31VO323I24X27S329I2JN31FS312M31W1329I312M31SU2X525Y319I312M31HN319Q323I31222AF311K1P24031HK2X82XA31EQ2612BJ31NI2XA31XF32CY25X31EQ312E2XR31XF32HE31UT31XI32GE2XF31XI31XI26031FS31XF312E31CD31EQ32H82BI31XF315432H732H931FV31EQ31722Y8315J31XF2C926227631YZ32AQ325D32HB32HK241265279313G2XF31Y0317D313M31B22BJ31CQ32IL31C92XE32HC328B31VD32FT3297329931EQ24727G321924126F32I7312O311232JB31D2317F32DD1S32I72Z6311232JJ31RW32DD264315E323Y31VR24X31EO32J92X52QO2XR312232DA3122312231SY31S332632C926631JC320X31UT31XF32K831GZ312232HY31FV31S332BM2YI31S331S32KR312C32KL241313M2XR2C932KJ2XF2C92C925F31CA32KW24125E32I82K3319I2X531EQ314X32C22PC32JY2YI32K031JQ32K232DQ2XA32K531JC2C925G32K932DE32HH2TJ319I32KF31VN25X32KI31JQ32KP32KN32KK322832KR2YI32KT31JQ32L032KY312C32L032L22XR31EQ25H32L5323132JO2X531EO31UT312M3207323Y32IY32L932JT32L932JX31FV32LD31Q432LF32K432LN25X2C932AT32L3326331XF311132KE323231SU32LU31Q432LW31CA32KP32M032KV31YV32M3328B32M532M1328B32M82YI32MA32MC32L731CA2X528I32LB2XF32MR31CA32MT32KH32MV2C9326332KA31FV31XF32FD32NS32N432NW32KU32LH322832LX2XF32NA31FV32M231Q432M432KZ32NI32L332MB31GZ32L631L132J932MG31FV312M32OK31FS323I2BI31NO28I32B431NO27S31BA2Z3322H320R31XK32L932HS32JW32LS3122311S32OL328831SU312R31JQ32MI31H12RP32O8316U32GS322831SU32NT312C32NV319Q31S331EQ31Q431XF27S2X8312C32O224125M28R313H2XA2Z3311H313L311231X132IT2XB32PU32Q8311K2Y7313S25X31XF32Q6315732IQ2SE313P324A32QM31XF32Q232IP32Q5315H2XZ32QB27631SF2PC32LO32QK32IZ32QI320532QO324B32Q032QS32Q425X2Z3313U2JM32QX328B27932RF32QA31122Y732RF32QD31ZD32R131PX31S032LE312731NI319Q2C931A232M9241317T31Q431EQ31EQ31SY31XF31B732HQ32ND31Q432HU24132NG32HT24131XI32M832IK2Z332BM2IU32QU2Z332OA32SL32KQ31FS31EQ2Z331SA32IR31FV31XI31T42YI32SA26P31FV2Z32RP31UT31Y52XW31UT2ZB26Q319I31XI2ZB32FS32QM31YS31XI2DT2XA32LR2IU32KO32RT32SQ314832KB32RZ31JQ32Q031SY31XI32S632T132S831CA2Z32Z332SC32SO32NJ2XF31Y532SJ32U432DM32SN25X31Y531Y5313M319Q31XF31Y531SA32TG32ON32RB310A312C32TZ24132T02XR31Y52PI32T724132US31FV31Y832UV319Q2Z331Y832TD2XA31XI31YS2Z331YM32LT32SE315D32R332RW24132PY324B32L032R932QM31772C432RF32RR32R032MW3232315I32NC2ZI27E32QP2XA32VG32Q332QM31GF32VK32Q92BJ32QH32NY311E315J32VC26V31CL32NC2C932VH32LO2Z52G532RF31U032RF31JE32RF2ZG32RF31WP32RF2Y331ZB32VV32VP31FS32VM32NU32TM32RV31O732NK32TQ32S1323132S427A31JC31XI32O725X32SA32U132X832V932SG2XF32SI2XD32JQ32SO32U932UN32UD32WZ32SS32HX312631NO31XF275314K319Q32TJ32N932WW32WZ31FN2YI31XF32S031CA32TS32SV32X4317R329932QU32X732UN32XA32UN32U32XA32U531JQ32UB31LT31CA32YI32XL32QM32UG31FS32UI32OV32SY27432EH32O831XI2XI32IK2C932IN2WI32RA31EQ31B0311A32VL2BJ32RI32IV32NC32IY32W62A632W832VU32VO32WB32VX32LO317K2UE32WG32Z7317J32ZN311K32WL311232WN311231GC32WO32W232NC31XF2C4323G32TI2D33301324C315X31L7');local I=(bit or bit32)and(bit or bit32).bxor or function(e,o)local l,n=n,a while e>a and o>a do local X,I=e%2,o%2 if X~=I then n=n+l end e,o,l=(e-X)/2,(o-I)/2,l*2 end if e<o then e=o end while e>a do local o=e%2 if o>a then n=n+l end e,l=(e-o)/2,l*2 end return n end local function o(o,e,l)if l then local e=(o/2^(e-n))%2^((l-n)-(e-n)+n);return e-e%n;else local e=2^(e-n);return(o%(e+e)>=e)and n or a;end;end;local e=n;local function X()local X,n,l,o=F(Y,e,e+3);X=I(X,145)n=I(n,145)l=I(l,145)o=I(o,145)e=e+4;return(o*16777216)+(l*B)+(n*C)+X;end;local function A()local l,n=F(Y,e,e+2);l=I(l,145)n=I(n,145)e=e+2;return(n*C)+l;end;local function C()local l=I(F(Y,e,e),145);e=e+n;return l;end;local function K(...)return{...},d('#',...)end local function D()local l={};local f={};local i={};local d={[4]=nil,[n]=i,[3]=l,[8]=f,[7]=nil,};local l={}local S={}for B=n,C()==a and A()*2 or X()do local l=C();while true do if(l==a)then local o,A,X='',X();if(A==a)then l=o;break;end;X=c(Y,e,e+A-n);e=e+A;for e=n,#X do o=o..t[I(F(c(X,e,e)),145)]end l=o break;end if(l==2)then l=(C()~=a);break;end if(l==n)then local X,e=X(),X();local I,X,e,o=n,(o(e,n,20)*(2^32))+X,o(e,21,31),((-n)^o(e,32));if e==a then if X==a then l=o*a break;else e=n;I=a;end;elseif(e==2047)then l=(o*((X==a and n or a)/a))break;end;l=(o*(2^(e-1023)))*(I+(X/(2^52)));break;end l=nil break;end S[B]=l;end;for e=n,X()do i[e-n]=D();end;d[7]=C();for t=n,X()do local e=C();if(o(e,n,n)==a)then local l=o(e,2,3);local Y,c,C=A(),A(),A();local I=o(e,4,6);local e={[4]=c,[n]=C,[6]=Y,[2]=nil,};if(l==a)then e[4],e[2]=A(),A()end if(l==3)then e[4],e[2]=X()-B,A()end if(l==2)then e[4]=X()-B end if(l==n)then e[4]=X()end if(o(I,n,n)==n)then e[n]=S[e[n]]end if(o(I,3,3)==n)then e[2]=S[e[2]]end if(o(I,2,2)==n)then e[4]=S[e[4]]end f[t]=e;end end;return d;end;local function i(e,c,I)local l=e[7];local X=e[8];local B=a;local o=e[4];local e=e[n];return function(...)local F=d('#',...)-n;local C={};local d=K local o={};local A={...};local Y=l;local X=X;local D=e;local l=n;local f={};local t=-n;for e=a,F do if(e>=Y)then f[e-Y]=A[e+n];else o[e]=A[e+n];end;end;local e;local A;local Y=F-Y+n while true do e=X[l];A=e[6];if B>a then o[e[n]]=e[4];end if A<=50 then if A<=24 then if A<=11 then if A<=5 then if A<=2 then if A<=a then o[e[n]]=e[4];elseif A==n then local c;local A;o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=(e[4]~=a);l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=(e[4]~=a);l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];else local A;o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]={};l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))end;elseif A<=3 then if not o[e[n]]then l=l+n;else l=e[4];end;elseif A>4 then local a;local A;A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];else local A;local I;I=e[n]o[I](o[I+n])l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];I=e[n];A=o[e[4]];o[I+n]=A;o[I]=A[e[2]];l=l+n;e=X[l];I=e[n]o[I](o[I+n])l=l+n;e=X[l];do return end;end;elseif A<=8 then if A<=6 then local A;o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]={};l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];elseif A==7 then local l=e[n]o[l](S(o,l+n,e[4]))else local S;local A;A=e[n];S=o[e[4]];o[A+n]=S;o[A]=S[e[2]];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];A=e[n];S=o[e[4]];o[A+n]=S;o[A]=S[e[2]];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];l=e[4];end;elseif A<=9 then o[e[n]]={};elseif A==10 then local I=e[n];local A=e[2];local X=I+2 local I={o[I](o[I+n],o[X])};for e=n,A do o[X+e]=I[e];end;local I=I[n]if I then o[X]=I l=e[4];else l=l+n;end;else local c;local t;local C;local A;A=e[n];C=o[e[4]];o[A+n]=C;o[A]=C[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];A=e[n]t={o[A](o[A+n])};c=a;for e=A,e[2]do c=c+n;o[e]=t[c];end l=l+n;e=X[l];l=e[4];end;elseif A<=17 then if A<=14 then if A<=12 then I[e[4]]=o[e[n]];elseif A>13 then o[e[n]][e[4]]=o[e[2]];else local X=e[n];local I=o[X]local A=o[X+2];if(A>a)then if(I>o[X+n])then l=e[4];else o[X+3]=I;end elseif(I<o[X+n])then l=e[4];else o[X+3]=I;end end;elseif A<=15 then o[e[n]]=o[e[4]]-o[e[2]];elseif A>16 then local l=e[n]o[l]=o[l](S(o,l+n,e[4]))else local c;local A;o[e[n]]=I[e[4]];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=(e[4]~=a);l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=(e[4]~=a);l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];end;elseif A<=20 then if A<=18 then o[e[n]]=o[e[4]]/e[2];elseif A==19 then o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];if(o[e[n]]==o[e[2]])then l=l+n;else l=e[4];end;else l=e[4];end;elseif A<=22 then if A==21 then if(o[e[n]]==o[e[2]])then l=l+n;else l=e[4];end;else c[e[4]]=o[e[n]];end;elseif A==23 then local a;local A;o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];else o[e[n]]=o[e[4]];end;elseif A<=37 then if A<=30 then if A<=27 then if A<=25 then local F;local c;local Y;local t;local B;local f;local A;A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];A=e[n];f={};for e=n,#C do B=C[e];for e=a,#B do t=B[e];Y=t[n];c=t[2];if Y==o and c>=A then f[c]=Y[c];t[n]=f;end;end;end;l=l+n;e=X[l];A=e[n];F=o[e[4]];o[A+n]=F;o[A]=F[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];elseif A==26 then local X=e[n];local A=o[X+2];local I=o[X]+A;o[X]=I;if(A>a)then if(I<=o[X+n])then l=e[4];o[X+3]=I;end elseif(I>=o[X+n])then l=e[4];o[X+3]=I;end else for e=e[n],e[4]do o[e]=nil;end;end;elseif A<=28 then do return end;elseif A>29 then local A;o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];else local S;local A;o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];for e=e[n],e[4]do o[e]=nil;end;l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];A=e[n];S=o[e[4]];o[A+n]=S;o[A]=S[e[2]];l=l+n;e=X[l];o[e[n]]=e[4];end;elseif A<=33 then if A<=31 then local l=e[n]local X,e=d(o[l](S(o,l+n,e[4])))t=e+l-n local e=a;for l=l,t do e=e+n;o[l]=X[e];end;elseif A==32 then if not o[e[n]]then l=l+n;else l=e[4];end;else local X=e[4];local l=o[X]for e=X+n,e[2]do l=l..o[e];end;o[e[n]]=l;end;elseif A<=35 then if A>34 then o[e[n]][e[4]]=e[2];else o[e[n]]();end;elseif A>36 then local F;local c;local Y;local t;local f;local B;local A;A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];A=e[n];B={};for e=n,#C do f=C[e];for e=a,#f do t=f[e];Y=t[n];c=t[2];if Y==o and c>=A then B[c]=Y[c];t[n]=B;end;end;end;l=l+n;e=X[l];A=e[n];F=o[e[4]];o[A+n]=F;o[A]=F[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];else local l=e[n]local I={o[l](o[l+n])};local X=a;for e=l,e[2]do X=X+n;o[e]=I[X];end end;elseif A<=43 then if A<=40 then if A<=38 then o[e[n]]=o[e[4]][e[2]];elseif A==39 then o[e[n]]=o[e[4]][e[2]];else local l=e[n]local X,e=d(o[l](S(o,l+n,e[4])))t=e+l-n local e=a;for l=l,t do e=e+n;o[l]=X[e];end;end;elseif A<=41 then local c;local A;o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=(e[4]~=a);l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=(e[4]~=a);l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];elseif A>42 then o[e[n]][e[4]]=e[2];else local A;local S;c[e[4]]=o[e[n]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];c[e[4]]=o[e[n]];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];I[e[4]]=o[e[n]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];S=e[n];A=o[e[4]];o[S+n]=A;o[S]=A[e[2]];end;elseif A<=46 then if A<=44 then local A=e[n];local X={};for e=n,#C do local e=C[e];for l=a,#e do local l=e[l];local I=l[n];local e=l[2];if I==o and e>=A then X[e]=I[e];l[n]=X;end;end;end;elseif A==45 then local e=e[n]o[e]=o[e](o[e+n])else local A;o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]]/e[2];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]();end;elseif A<=48 then if A>47 then local e=e[n]o[e](o[e+n])else local e=e[n]o[e]=o[e](o[e+n])end;elseif A>49 then if(o[e[n]]==o[e[2]])then l=l+n;else l=e[4];end;else local a=D[e[4]];local S;local A={};S=Q({},{__index=function(l,e)local e=A[e];return e[n][e[2]];end,__newindex=function(o,e,l)local e=A[e]e[n][e[2]]=l;end;});for I=n,e[2]do l=l+n;local e=X[l];if e[6]==81 then A[I-n]={o,e[4]};else A[I-n]={c,e[4]};end;C[#C+n]=A;end;o[e[n]]=i(a,S,I);end;elseif A<=75 then if A<=62 then if A<=56 then if A<=53 then if A<=51 then local l=e[n];local X=o[e[4]];o[l+n]=X;o[l]=X[e[2]];elseif A>52 then local A=e[n];local I={};for e=n,#C do local e=C[e];for l=a,#e do local l=e[l];local X=l[n];local e=l[2];if X==o and e>=A then I[e]=X[e];l[n]=I;end;end;end;else c[e[4]]=o[e[n]];end;elseif A<=54 then o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];if(o[e[n]]~=o[e[2]])then l=l+n;else l=e[4];end;elseif A==55 then local A;o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]={};l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))else if(o[e[n]]~=o[e[2]])then l=l+n;else l=e[4];end;end;elseif A<=59 then if A<=57 then for e=e[n],e[4]do o[e]=nil;end;elseif A==58 then o[e[n]]=o[e[4]]/e[2];else o[e[n]][e[4]]=o[e[2]];end;elseif A<=60 then o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];if(o[e[n]]~=o[e[2]])then l=l+n;else l=e[4];end;elseif A==61 then local X=e[n]local I={o[X](o[X+n])};local l=a;for e=X,e[2]do l=l+n;o[e]=I[l];end else o[e[n]]=e[4];end;elseif A<=68 then if A<=65 then if A<=63 then local I;o[e[n]]=(e[4]~=a);l=l+n;e=X[l];I=e[n]o[I]=o[I](S(o,I+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];I=e[n]o[I]=o[I](S(o,I+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];elseif A>64 then local c;local A;o[e[n]]=(e[4]~=a);l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];A=e[n];c=o[e[4]];o[A+n]=c;o[A]=c[e[2]];l=l+n;e=X[l];o[e[n]]=(e[4]~=a);l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];else o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];if(o[e[n]]==o[e[2]])then l=l+n;else l=e[4];end;end;elseif A<=66 then local A;o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))elseif A>67 then local e=e[n]o[e]=o[e](S(o,e+n,t))else local X=e[n];local A=e[2];local I=X+2 local X={o[X](o[X+n],o[I])};for e=n,A do o[I+e]=X[e];end;local X=X[n]if X then o[I]=X l=e[4];else l=l+n;end;end;elseif A<=71 then if A<=69 then o[e[n]]=I[e[4]];elseif A>70 then local l=e[n]o[l]=o[l](S(o,l+n,e[4]))else l=e[4];end;elseif A<=73 then if A>72 then o[e[n]]=(e[4]~=a);else local a;local A;o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];end;elseif A>74 then local e=e[n]o[e](o[e+n])else if(o[e[n]]~=o[e[2]])then l=l+n;else l=e[4];end;end;elseif A<=88 then if A<=81 then if A<=78 then if A<=76 then o[e[n]]=o[e[4]]+o[e[2]];elseif A>77 then o[e[n]]=o[e[4]]+o[e[2]];else local a;local A;o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]={};l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];end;elseif A<=79 then do return end;elseif A==80 then local Y;local B,F;local C;local A;A=e[n]o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];A=e[n];C=o[e[4]];o[A+n]=C;o[A]=C[e[2]];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];A=e[n]B,F=d(o[A](S(o,A+n,e[4])))t=F+A-n Y=a;for e=A,t do Y=Y+n;o[e]=B[Y];end;l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,t))l=l+n;e=X[l];o[e[n]]();l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];A=e[n];C=o[e[4]];o[A+n]=C;o[A]=C[e[2]];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];do return end;else o[e[n]]=o[e[4]];end;elseif A<=84 then if A<=82 then local X=e[4];local l=o[X]for e=X+n,e[2]do l=l..o[e];end;o[e[n]]=l;elseif A==83 then o[e[n]]();else local X=e[n];local A=o[X+2];local I=o[X]+A;o[X]=I;if(A>a)then if(I<=o[X+n])then l=e[4];o[X+3]=I;end elseif(I>=o[X+n])then l=e[4];o[X+3]=I;end end;elseif A<=86 then if A>85 then local a;local A;A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A](o[A+n])l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]][e[4]]=e[2];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];l=l+n;e=X[l];o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];else o[e[n]]=o[e[4]]-o[e[2]];end;elseif A==87 then o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];if(o[e[n]]==o[e[2]])then l=l+n;else l=e[4];end;else o[e[n]]=(e[4]~=a);end;elseif A<=94 then if A<=91 then if A<=89 then local a=D[e[4]];local S;local A={};S=Q({},{__index=function(l,e)local e=A[e];return e[n][e[2]];end,__newindex=function(o,e,l)local e=A[e]e[n][e[2]]=l;end;});for I=n,e[2]do l=l+n;local e=X[l];if e[6]==81 then A[I-n]={o,e[4]};else A[I-n]={c,e[4]};end;C[#C+n]=A;end;o[e[n]]=i(a,S,I);elseif A>90 then local l=e[n]o[l](S(o,l+n,e[4]))else o[e[n]]=I[e[4]];end;elseif A<=92 then o[e[n]]=c[e[4]];elseif A==93 then local A;o[e[n]]=o[e[4]];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n]o[A]=o[A](o[A+n])l=l+n;e=X[l];if(o[e[n]]==o[e[2]])then l=l+n;else l=e[4];end;else local A;o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]]-o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]]+o[e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=c[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]]-o[e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];o[e[n]]=o[e[4]]+o[e[2]];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]][e[4]]=o[e[2]];end;elseif A<=97 then if A<=95 then local X=e[n];local l=o[e[4]];o[X+n]=l;o[X]=l[e[2]];elseif A==96 then o[e[n]]={};else local a;local A;o[e[n]]=e[4];l=l+n;e=X[l];A=e[n]o[A]=o[A](S(o,A+n,e[4]))l=l+n;e=X[l];o[e[n]]=I[e[4]];l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];for e=e[n],e[4]do o[e]=nil;end;l=l+n;e=X[l];o[e[n]]=o[e[4]][e[2]];l=l+n;e=X[l];A=e[n];a=o[e[4]];o[A+n]=a;o[A]=a[e[2]];end;elseif A<=99 then if A==98 then local X=e[n];local I=o[X]local A=o[X+2];if(A>a)then if(I>o[X+n])then l=e[4];else o[X+3]=I;end elseif(I<o[X+n])then l=e[4];else o[X+3]=I;end else local e=e[n]o[e]=o[e](S(o,e+n,t))end;elseif A>100 then o[e[n]]=c[e[4]];else I[e[4]]=o[e[n]];end;l=l+n;end;end;end;return S({i(D(),{},E())()})or nil;end)(65536,"",{},1,0,256,tonumber)

   end,
})


