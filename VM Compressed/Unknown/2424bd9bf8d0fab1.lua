local StarterGui = game:GetService("StarterGui")
local workspace = game:GetService("Workspace")

local function sendNotificationWithSound(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration
    })
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://17582299860"
    sound.Volume = 1
    sound.PlayOnRemove = true
    sound.Parent = workspace
    sound:Destroy()
end

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://133868932267574"
sound.Looped = true
sound.Volume = 1
sound.Parent = root
sound:Play()

sendNotificationWithSound(" Oldhacfards's Reanimation", "loading", 4)
wait(1)
sendNotificationWithSound("Have Fun ", "LOOK", 4)
task.wait(1)

local duration = 2
sendNotificationWithSound("Reanimating by Oldhacfard", "Duration: "..duration.."s", duration)
wait(duration)

loadstring(game:HttpGet("https://raw.githubusercontent.com/oldhacfard/The-script/refs/heads/main/Reanimate.luau"))()

task.wait(1)
local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local char = lp.Character

local hum = char:WaitForChild("Humanoid")
local animate = char:FindFirstChild("Animate")
if animate then animate.Disabled = true end
for _, v in pairs(hum:GetPlayingAnimationTracks()) do v:Stop() end

local tor = char:WaitForChild("Torso")
local root = char:WaitForChild("HumanoidRootPart")

local joints = {
    root = root:WaitForChild("RootJoint"),
    neck = tor:WaitForChild("Neck"),
    rs = tor:WaitForChild("Right Shoulder"),
    ls = tor:WaitForChild("Left Shoulder"),
    rh = tor:WaitForChild("Right Hip"),
    lh = tor:WaitForChild("Left Hip")
}

local function cf(p, r) 
    return CFrame.new(p) * CFrame.fromEulerAnglesXYZ(math.rad(r.X), math.rad(r.Y), math.rad(r.Z)) 
end

local currentCFs = {}
for name, joint in pairs(joints) do currentCFs[name] = joint.Transform end
local lerpSpeed = 0.2

rs.Stepped:Connect(function()
    local vel = tor.Velocity.Magnitude
    local state = (vel > 0.1) and "walkW" or "idle"
    local targets = {}

    if state == "walkW" then
        targets.lh = cf(Vector3.new(0,0,0), Vector3.new(0,0,20))
        targets.ls = cf(Vector3.new(0,0,0), Vector3.new(0,0,-20))
        targets.BrownCharmerHair = cf(Vector3.new(0,0,0), Vector3.new(0,0,0))
        targets.neck = cf(Vector3.new(0.1,0,0), Vector3.new(99,99,0))
        targets.root = cf(Vector3.new(0,0,0), Vector3.new(20,0,0))
        targets.VarietyShades02 = cf(Vector3.new(0,0,0), Vector3.new(0,0,0))
        targets.rh = cf(Vector3.new(0,0,0), Vector3.new(0,0,20))
        targets.rs = cf(Vector3.new(0,0,0), Vector3.new(0,0,20))
    elseif state == "idle" then
        targets.lh = cf(Vector3.new(0,0,0), Vector3.new(0,0,-20))
        targets.ls = cf(Vector3.new(0,0,0), Vector3.new(0,0,-20))
        targets.BrownCharmerHair = cf(Vector3.new(0,0,0), Vector3.new(0,0,0))
        targets.neck = cf(Vector3.new(0,0,0), Vector3.new(10, 10 ,10))
        targets.root = cf(Vector3.new(0,0,0), Vector3.new(20,0,0))
        targets.VarietyShades02 = cf(Vector3.new(0,0,0), Vector3.new(0,0,0))
        targets.rh = cf(Vector3.new(0,0,0), Vector3.new(0,0,20))
        targets.rs = cf(Vector3.new(0,0,0), Vector3.new(-20,20,190))
    end

    for name, joint in pairs(joints) do
        if targets[name] then
            currentCFs[name] = currentCFs[name]:Lerp(targets[name], lerpSpeed)
            joint.Transform = currentCFs[name]
        end
    end
end)
local lp = game:GetService("Players").LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://133868932267574"
sound.Looped = true
sound.Volume = 1
sound.Parent = root
sound:Play()
