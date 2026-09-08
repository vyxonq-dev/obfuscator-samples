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
