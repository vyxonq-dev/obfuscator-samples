--[[
4458601937 4506945409 4794315940 4820152700 4315489767 4524991457 4623728953 5030789687 4932541287 4773883146
--Mode--
1 = Sadness
2 = =-Humane-=
2+T = =-MADNESS-=
3 = CALAMITANIA
3+T = INFINITE VOID
3+R = PARADOX
3+R+F = Galactic
3+F = (Triggers CrueltiesSmash() action, no mode change)
4 = GALACTIA
4+T = PURIFIED
4+T+T = ZORNO
4+F = SPACETIME
4+F+T = TIMELESS
4+F+T+T = LIGHTSPEED
4+F+F = FORCE
5 = INFINITY
5+T = br0k3n
6 = UNBROKEN
6+T = lost
6+F = NEPTUNIAN V (UNEQUIPPED)
6+F+F = NEPTUNIAN V
6+F+F+F = NEPTUNIAN V (UNEQUIPPED) (cycles back)
7 = TRIX-LUA
7+T = OVERKILL
8 = Careless
8+T = DARKENED
9 = AURORA
9+T = The Doctor
9+T+T = ILLUMINATION
Q = Dark Energy
Q+Q = Broken PR0GRam
Q+Q+R = SPINNER
Q+E = Calamified
Q+E+E = PESTILENCE
Q+E+Q = (Triggers EndofworldsSMASHDOWN() action, no mode change)
Q+C = Mayhem
Q+V = N U C L E A R
Q+R = SYNCHRO
Q+R+R = LOSS
Q+R+R+T = Universal
Q+R+R+T+T = Defected
Q+F = ULTRAVIOLET
Q+F+T = BIT32
Y = Pheonix
Y+T = Time
Y+T+T = The Big Black
Y+T+T+T = REVENGE
U = Bruh
P = Interstellar
G = gh0st3d
G+T = FREEZING
G+T+T = Inferno
J = HEROIC
K = ZEN-X
L = HyPnOtIC
Z = PRISM
Z+T = Omniversal
X = (Switches to the mode specified in e2.Text)
B = no is some what you think...
B+T = pls dont say this
N = SANS
N+R = LOVE
N+T = The Sword Runner
N+F = ULTRA SANS
]]--

--Zeon Glitcher V2--
--made by TrixLua#8210 and edited the reanim maxilito 
--this is a Public Glitcher--
--THE MOON FAILED. NOW U MEET THE SUCCESSOR. ZEON...--
-- subcrine to him too: https://www.youtube.com/@gokusuper9127
setfpscap(90) --put this more if you have a pc slow, but if is it fast put in 60 
--reanimate by MyWorld#4430 discord.gg/pYVHtSJmEY
--"oMg tHIs cODe iS uNReaDabLe sO iT SUckS" -its not a script for u to understand and edit but to use with your other scripts
local v3_net, v3_808 = Vector3.new(8000, 25.1, 0.1), Vector3.new(8, 0, 8)
local function getNetlessVelocity(realPartVelocity)
    if realPartVelocity.Magnitude > 1 then
        local unit = realPartVelocity.Unit
        if (unit.Y > 0.25) or (unit.Y < -0.75) then
            return unit * (25.1 / unit.Y)
        end
    end
    return v3_net + realPartVelocity * v3_808
end
local simradius = "shp" --simulation radius (net bypass) method
--"shp" - sethiddenproperty
--"ssr" - setsimulationradius
--false - disable
local simrad = 1000 --simulation radius value
local healthHide = true --moves your head away every 3 seconds so players dont see your health bar (alignmode 4 only)
local reclaim = true --if you lost control over a part this will move your primary part to the part so you get it back (alignmode 4)
local novoid = true --prevents parts from going under workspace.FallenPartsDestroyHeight if you control them (alignmode 4 only)
local physp = nil --PhysicalProperties.new(0.01, 0, 1, 0, 0) --sets .CustomPhysicalProperties to this for each part
local noclipAllParts = false --set it to true if you want noclip
local antiragdoll = true --removes hingeConstraints and ballSocketConstraints from your character
local newanimate = false --disables the animate script and enables after reanimation
local discharscripts = true --disables all localScripts parented to your character before reanimation
local R15toR6 = true --tries to convert your character to r6 if its r15
local hatcollide = true --makes hats cancollide (credit to ShownApe) (works only with reanimate method 0)
local humState16 = true --enables collisions for limbs before the humanoid dies (using hum:ChangeState)
local addtools = false --puts all tools from backpack to character and lets you hold them after reanimation
local hedafterneck = true --disable aligns for head and enable after neck or torso is removed
local loadtime = game:GetService("Players").RespawnTime + 0.5 --anti respawn delay
local method = 3 --reanimation method
--methods:
--0 - breakJoints (takes [loadtime] seconds to load)
--1 - limbs
--2 - limbs + anti respawn
--3 - limbs + breakJoints after [loadtime] seconds
--4 - remove humanoid + breakJoints
--5 - remove humanoid + limbs
local alignmode = 4 --AlignPosition mode
--modes:
--1 - AlignPosition rigidity enabled true
--2 - 2 AlignPositions rigidity enabled both true and false
--3 - AlignPosition rigidity enabled false
--4 - no AlignPosition, CFrame only
local flingpart = "HumanoidRootPart" --name of the part or the hat used for flinging
--the fling function
--usage: fling(target, duration, velocity)
--target can be set to: basePart, CFrame, Vector3, character model or humanoid (flings at mouse.Hit if argument not provided)
--duration (fling time in seconds) can be set to a number or a string convertable to a number (0.5s if not provided)
--velocity (fling part rotation velocity) can be set to a vector3 value (Vector3.new(20000, 20000, 20000) if not provided)

local lp = game:GetService("Players").LocalPlayer
local rs, ws, sg = game:GetService("RunService"), game:GetService("Workspace"), game:GetService("StarterGui")
local stepped, heartbeat, renderstepped = rs.Stepped, rs.Heartbeat, rs.RenderStepped
local twait, tdelay, rad, inf, abs, clamp = task.wait, task.delay, math.rad, math.huge, math.abs, math.clamp
local cf, v3, angles = CFrame.new, Vector3.new, CFrame.Angles
local v3_0, cf_0 = v3(0, 0, 0), cf(0, 0, 0)

local c = lp.Character
if not (c and c.Parent) then
    return
end

c:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (c and c.Parent) then
        c = nil
    end
end)

local clone, destroy, getchildren, getdescendants, isa = c.Clone, c.Destroy, c.GetChildren, c.GetDescendants, c.IsA

local function gp(parent, name, className)
    if typeof(parent) == "Instance" then
        for i, v in pairs(getchildren(parent)) do
            if (v.Name == name) and isa(v, className) then
                return v
            end
        end
    end
    return nil
end

local fenv = getfenv()

local shp = fenv.sethiddenproperty or fenv.set_hidden_property or fenv.set_hidden_prop or fenv.sethiddenprop
local ssr = fenv.setsimulationradius or fenv.set_simulation_radius or fenv.set_sim_radius or fenv.setsimradius or fenv.setsimrad or fenv.set_sim_rad

healthHide = healthHide and ((method == 0) or (method == 2) or (method == 3)) and gp(c, "Head", "BasePart")

local reclaim, lostpart = reclaim and c.PrimaryPart, nil

local function align(Part0, Part1)
    
    local att0 = Instance.new("Attachment")
    att0.Position, att0.Orientation, att0.Name = v3_0, v3_0, "att0_" .. Part0.Name
    local att1 = Instance.new("Attachment")
    att1.Position, att1.Orientation, att1.Name = v3_0, v3_0, "att1_" .. Part1.Name

    if alignmode == 4 then
    
        local hide = false
        if Part0 == healthHide then
            healthHide = false
            tdelay(0, function()
                while twait(2.9) and Part0 and c do
                    hide = #Part0:GetConnectedParts() == 1
                    twait(0.1)
                    hide = false
                end
            end)
        end
        
        local rot = rad(0.05)
        local con0, con1 = nil, nil
        con0 = stepped:Connect(function()
            if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
            Part0.RotVelocity = Part1.RotVelocity
        end)
        local lastpos = Part0.Position
        con1 = heartbeat:Connect(function(delta)
            if not (Part0 and Part1 and att1) then return con0:Disconnect() and con1:Disconnect() end
            if (not Part0.Anchored) and (Part0.ReceiveAge == 0) then
                if lostpart == Part0 then
                    lostpart = nil
                end
                local newcf = Part1.CFrame * att1.CFrame
                if Part1.Velocity.Magnitude > 0.1 then
                    Part0.Velocity = getNetlessVelocity(Part1.Velocity)
                else
                    local vel = (newcf.Position - lastpos) / delta
                    Part0.Velocity = getNetlessVelocity(vel)
                    if vel.Magnitude < 1 then
                        rot = -rot
                        newcf *= angles(0, 0, rot)
                    end
                end
                lastpos = newcf.Position
                if lostpart and (Part0 == reclaim) then
                    newcf = lostpart.CFrame
                elseif hide then
                    newcf += v3(0, 3000, 0)
                end
                if novoid and (newcf.Y < ws.FallenPartsDestroyHeight + 0.1) then
                    newcf += v3(0, ws.FallenPartsDestroyHeight + 0.1 - newcf.Y, 0)
                end
                Part0.CFrame = newcf
            elseif (not Part0.Anchored) and (abs(Part0.Velocity.X) < 45) and (abs(Part0.Velocity.Y) < 25) and (abs(Part0.Velocity.Z) < 45) then
                lostpart = Part0
            end
        end)
    
    else
        
        Part0.CustomPhysicalProperties = physp
        if (alignmode == 1) or (alignmode == 2) then
            local ape = Instance.new("AlignPosition")
            ape.MaxForce, ape.MaxVelocity, ape.Responsiveness = inf, inf, inf
            ape.ReactionForceEnabled, ape.RigidityEnabled, ape.ApplyAtCenterOfMass = false, true, false
            ape.Attachment0, ape.Attachment1, ape.Name = att0, att1, "AlignPositionRtrue"
            ape.Parent = att0
        end
        
        if (alignmode == 2) or (alignmode == 3) then
            local apd = Instance.new("AlignPosition")
            apd.MaxForce, apd.MaxVelocity, apd.Responsiveness = inf, inf, inf
            apd.ReactionForceEnabled, apd.RigidityEnabled, apd.ApplyAtCenterOfMass = false, false, false
            apd.Attachment0, apd.Attachment1, apd.Name = att0, att1, "AlignPositionRfalse"
            apd.Parent = att0
        end
        
        local ao = Instance.new("AlignOrientation")
        ao.MaxAngularVelocity, ao.MaxTorque, ao.Responsiveness = inf, inf, inf
        ao.PrimaryAxisOnly, ao.ReactionTorqueEnabled, ao.RigidityEnabled = false, false, false
        ao.Attachment0, ao.Attachment1 = att0, att1
        ao.Parent = att0
        
        local con0, con1 = nil, nil
        local vel = Part0.Velocity
        con0 = renderstepped:Connect(function()
            if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
            Part0.Velocity = vel
        end)
        local lastpos = Part0.Position
        con1 = heartbeat:Connect(function(delta)
            if not (Part0 and Part1) then return con0:Disconnect() and con1:Disconnect() end
            vel = Part0.Velocity
            if Part1.Velocity.Magnitude > 0.01 then
                Part0.Velocity = getNetlessVelocity(Part1.Velocity)
            else
                Part0.Velocity = getNetlessVelocity((Part0.Position - lastpos) / delta)
            end
            lastpos = Part0.Position
        end)
    
    end

    att0:GetPropertyChangedSignal("Parent"):Connect(function()
        Part0 = att0.Parent
        if not isa(Part0, "BasePart") then
            att0 = nil
            if lostpart == Part0 then
                lostpart = nil
            end
            Part0 = nil
        end
    end)
    att0.Parent = Part0
    
    att1:GetPropertyChangedSignal("Parent"):Connect(function()
        Part1 = att1.Parent
        if not isa(Part1, "BasePart") then
            att1 = nil
            Part1 = nil
        end
    end)
    att1.Parent = Part1
end

local function respawnrequest()
    local ccfr, c = ws.CurrentCamera.CFrame, lp.Character
    lp.Character = nil
    lp.Character = c
    local con = nil
    con = ws.CurrentCamera.Changed:Connect(function(prop)
        if (prop ~= "Parent") and (prop ~= "CFrame") then
            return
        end
        ws.CurrentCamera.CFrame = ccfr
        con:Disconnect()
    end)
end

local destroyhum = (method == 4) or (method == 5)
local breakjoints = (method == 0) or (method == 4)
local antirespawn = (method == 0) or (method == 2) or (method == 3)

hatcollide = hatcollide and (method == 0)

addtools = addtools and lp:FindFirstChildOfClass("Backpack")

if type(simrad) ~= "number" then simrad = 1000 end
if shp and (simradius == "shp") then
    tdelay(0, function()
        while c do
            shp(lp, "SimulationRadius", simrad)
            heartbeat:Wait()
        end
    end)
elseif ssr and (simradius == "ssr") then
    tdelay(0, function()
        while c do
            ssr(simrad)
            heartbeat:Wait()
        end
    end)
end

if antiragdoll then
    antiragdoll = function(v)
        if isa(v, "HingeConstraint") or isa(v, "BallSocketConstraint") then
            v.Parent = nil
        end
    end
    for i, v in pairs(getdescendants(c)) do
        antiragdoll(v)
    end
    c.DescendantAdded:Connect(antiragdoll)
end

if antirespawn then
    respawnrequest()
end

if method == 0 then
    twait(loadtime)
    if not c then
        return
    end
end

if discharscripts then
    for i, v in pairs(getdescendants(c)) do
        if isa(v, "LocalScript") then
            v.Disabled = true
        end
    end
elseif newanimate then
    local animate = gp(c, "Animate", "LocalScript")
    if animate and (not animate.Disabled) then
        animate.Disabled = true
    else
        newanimate = false
    end
end

if addtools then
    for i, v in pairs(getchildren(addtools)) do
        if isa(v, "Tool") then
            v.Parent = c
        end
    end
end

pcall(function()
    settings().Physics.AllowSleep = false
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
end)

local OLDscripts = {}

for i, v in pairs(getdescendants(c)) do
    if v.ClassName == "Script" then
        OLDscripts[v.Name] = true
    end
end

local scriptNames = {}

for i, v in pairs(getdescendants(c)) do
    if isa(v, "BasePart") then
        local newName, exists = tostring(i), true
        while exists do
            exists = OLDscripts[newName]
            if exists then
                newName = newName .. "_"    
            end
        end
        table.insert(scriptNames, newName)
        Instance.new("Script", v).Name = newName
    end
end

local hum = c:FindFirstChildOfClass("Humanoid")
if hum then
    for i, v in pairs(hum:GetPlayingAnimationTracks()) do
        v:Stop()
    end
end
c.Archivable = true
local cl = clone(c)
if hum and humState16 then
    hum:ChangeState(Enum.HumanoidStateType.Physics)
    if destroyhum then
        twait(1.6)
    end
end
if destroyhum then
    pcall(destroy, hum)
end

if not c then
    return
end

local head, torso, root = gp(c, "Head", "BasePart"), gp(c, "Torso", "BasePart") or gp(c, "UpperTorso", "BasePart"), gp(c, "HumanoidRootPart", "BasePart")
if hatcollide then
    pcall(destroy, torso)
    pcall(destroy, root)
    pcall(destroy, c:FindFirstChildOfClass("BodyColors") or gp(c, "Health", "Script"))
end

local model = Instance.new("Model", c)
model:GetPropertyChangedSignal("Parent"):Connect(function()
    if not (model and model.Parent) then
        model = nil
    end
end)

for i, v in pairs(getchildren(c)) do
    if v ~= model then
        if addtools and isa(v, "Tool") then
            for i1, v1 in pairs(getdescendants(v)) do
                if v1 and v1.Parent and isa(v1, "BasePart") then
                    local bv = Instance.new("BodyVelocity")
                    bv.Velocity, bv.MaxForce, bv.P, bv.Name = v3_0, v3(1000, 1000, 1000), 1250, "bv_" .. v.Name
                    bv.Parent = v1
                end
            end
        end
        v.Parent = model
    end
end

if breakjoints then
    model:BreakJoints()
else
    if head and torso then
        for i, v in pairs(getdescendants(model)) do
            if isa(v, "JointInstance") then
                local save = false
                if (v.Part0 == torso) and (v.Part1 == head) then
                    save = true
                end
                if (v.Part0 == head) and (v.Part1 == torso) then
                    save = true
                end
                if save then
                    if hedafterneck then
                        hedafterneck = v
                    end
                else
                    pcall(destroy, v)
                end
            end
        end
    end
    if method == 3 then
        task.delay(loadtime, pcall, model.BreakJoints, model)
    end
end

cl.Parent = ws
for i, v in pairs(getchildren(cl)) do
    v.Parent = c
end
pcall(destroy, cl)

local uncollide, noclipcon = nil, nil
if noclipAllParts then
    uncollide = function()
        if c then
            for i, v in pairs(getdescendants(c)) do
                if isa(v, "BasePart") then
                    v.CanCollide = false
                end
            end
        else
            noclipcon:Disconnect()
        end
    end
else
    uncollide = function()
        if model then
            for i, v in pairs(getdescendants(model)) do
                if isa(v, "BasePart") then
                    v.CanCollide = false
                end
            end
        else
            noclipcon:Disconnect()
        end
    end
end
noclipcon = stepped:Connect(uncollide)
uncollide()

for i, scr in pairs(getdescendants(model)) do
    if (scr.ClassName == "Script") and table.find(scriptNames, scr.Name) then
        local Part0 = scr.Parent
        if isa(Part0, "BasePart") then
            for i1, scr1 in pairs(getdescendants(c)) do
                if (scr1.ClassName == "Script") and (scr1.Name == scr.Name) and (not scr1:IsDescendantOf(model)) then
                    local Part1 = scr1.Parent
                    if (Part1.ClassName == Part0.ClassName) and (Part1.Name == Part0.Name) then
                        align(Part0, Part1)
                        pcall(destroy, scr)
                        pcall(destroy, scr1)
                        break
                    end
                end
            end
        end
    end
end

for i, v in pairs(getdescendants(c)) do
    if v and v.Parent and (not v:IsDescendantOf(model)) then
        if isa(v, "Decal") then
            v.Transparency = 1
        elseif isa(v, "BasePart") then
            v.Transparency = 1
            v.Anchored = false
        elseif isa(v, "ForceField") then
            v.Visible = false
        elseif isa(v, "Sound") then
            v.Playing = false
        elseif isa(v, "BillboardGui") or isa(v, "SurfaceGui") or isa(v, "ParticleEmitter") or isa(v, "Fire") or isa(v, "Smoke") or isa(v, "Sparkles") then
            v.Enabled = false
        end
    end
end

if newanimate then
    local animate = gp(c, "Animate", "LocalScript")
    if animate then
        animate.Disabled = false
    end
end

if addtools then
    for i, v in pairs(getchildren(c)) do
        if isa(v, "Tool") then
            v.Parent = addtools
        end
    end
end

local hum0, hum1 = model:FindFirstChildOfClass("Humanoid"), c:FindFirstChildOfClass("Humanoid")
if hum0 then
    hum0:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (hum0 and hum0.Parent) then
            hum0 = nil
        end
    end)
end
if hum1 then
    hum1:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (hum1 and hum1.Parent) then
            hum1 = nil
        end
    end)

    ws.CurrentCamera.CameraSubject = hum1
    local camSubCon = nil
    local function camSubFunc()
        camSubCon:Disconnect()
        if c and hum1 then
            ws.CurrentCamera.CameraSubject = hum1
        end
    end
    camSubCon = renderstepped:Connect(camSubFunc)
    if hum0 then
        hum0:GetPropertyChangedSignal("Jump"):Connect(function()
            if hum1 then
                hum1.Jump = hum0.Jump
            end
        end)
    else
        respawnrequest()
    end
end

local rb = Instance.new("BindableEvent", c)
rb.Event:Connect(function()
    pcall(destroy, rb)
    sg:SetCore("ResetButtonCallback", true)
    if destroyhum then
        if c then c:BreakJoints() end
        return
    end
    if model and hum0 and (hum0.Health > 0) then
        model:BreakJoints()
        hum0.Health = 0
    end
    if antirespawn then
        respawnrequest()
    end
end)
sg:SetCore("ResetButtonCallback", rb)

tdelay(0, function()
    while c do
        if hum0 and hum1 then
            hum1.Jump = hum0.Jump
        end
        wait()
    end
    sg:SetCore("ResetButtonCallback", true)
end)

R15toR6 = R15toR6 and hum1 and (hum1.RigType == Enum.HumanoidRigType.R15)
if R15toR6 then
    local part = gp(c, "HumanoidRootPart", "BasePart") or gp(c, "UpperTorso", "BasePart") or gp(c, "LowerTorso", "BasePart") or gp(c, "Head", "BasePart") or c:FindFirstChildWhichIsA("BasePart")
    if part then
        local cfr = part.CFrame
        local R6parts = { 
            head = {
                Name = "Head",
                Size = v3(2, 1, 1),
                R15 = {
                    Head = 0
                }
            },
            torso = {
                Name = "Torso",
                Size = v3(2, 2, 1),
                R15 = {
                    UpperTorso = 0.2,
                    LowerTorso = -0.8
                }
            },
            root = {
                Name = "HumanoidRootPart",
                Size = v3(2, 2, 1),
                R15 = {
                    HumanoidRootPart = 0
                }
            },
            leftArm = {
                Name = "Left Arm",
                Size = v3(1, 2, 1),
                R15 = {
                    LeftHand = -0.849,
                    LeftLowerArm = -0.174,
                    LeftUpperArm = 0.415
                }
            },
            rightArm = {
                Name = "Right Arm",
                Size = v3(1, 2, 1),
                R15 = {
                    RightHand = -0.849,
                    RightLowerArm = -0.174,
                    RightUpperArm = 0.415
                }
            },
            leftLeg = {
                Name = "Left Leg",
                Size = v3(1, 2, 1),
                R15 = {
                    LeftFoot = -0.85,
                    LeftLowerLeg = -0.29,
                    LeftUpperLeg = 0.49
                }
            },
            rightLeg = {
                Name = "Right Leg",
                Size = v3(1, 2, 1),
                R15 = {
                    RightFoot = -0.85,
                    RightLowerLeg = -0.29,
                    RightUpperLeg = 0.49
                }
            }
        }
        for i, v in pairs(getchildren(c)) do
            if isa(v, "BasePart") then
                for i1, v1 in pairs(getchildren(v)) do
                    if isa(v1, "Motor6D") then
                        v1.Part0 = nil
                    end
                end
            end
        end
        part.Archivable = true
        for i, v in pairs(R6parts) do
            local part = clone(part)
            part:ClearAllChildren()
            part.Name, part.Size, part.CFrame, part.Anchored, part.Transparency, part.CanCollide = v.Name, v.Size, cfr, false, 1, false
            for i1, v1 in pairs(v.R15) do
                local R15part = gp(c, i1, "BasePart")
                local att = gp(R15part, "att1_" .. i1, "Attachment")
                if R15part then
                    local weld = Instance.new("Weld")
                    weld.Part0, weld.Part1, weld.C0, weld.C1, weld.Name = part, R15part, cf(0, v1, 0), cf_0, "Weld_" .. i1
                    weld.Parent = R15part
                    R15part.Massless, R15part.Name = true, "R15_" .. i1
                    R15part.Parent = part
                    if att then
                        att.Position = v3(0, v1, 0)
                        att.Parent = part
                    end
                end
            end
            part.Parent = c
            R6parts[i] = part
        end
        local R6joints = {
            neck = {
                Parent = R6parts.torso,
                Name = "Neck",
                Part0 = R6parts.torso,
                Part1 = R6parts.head,
                C0 = cf(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
                C1 = cf(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
            },
            rootJoint = {
                Parent = R6parts.root,
                Name = "RootJoint" ,
                Part0 = R6parts.root,
                Part1 = R6parts.torso,
                C0 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),
                C1 = cf(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0)
            },
            rightShoulder = {
                Parent = R6parts.torso,
                Name = "Right Shoulder",
                Part0 = R6parts.torso,
                Part1 = R6parts.rightArm,
                C0 = cf(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                C1 = cf(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            },
            leftShoulder = {
                Parent = R6parts.torso,
                Name = "Left Shoulder",
                Part0 = R6parts.torso,
                Part1 = R6parts.leftArm,
                C0 = cf(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                C1 = cf(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            },
            rightHip = {
                Parent = R6parts.torso,
                Name = "Right Hip",
                Part0 = R6parts.torso,
                Part1 = R6parts.rightLeg,
                C0 = cf(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),
                C1 = cf(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0)
            },
            leftHip = {
                Parent = R6parts.torso,
                Name = "Left Hip" ,
                Part0 = R6parts.torso,
                Part1 = R6parts.leftLeg,
                C0 = cf(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),
                C1 = cf(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
            }
        }
        for i, v in pairs(R6joints) do
            local joint = Instance.new("Motor6D")
            for prop, val in pairs(v) do
                joint[prop] = val
            end
            R6joints[i] = joint
        end
        if hum1 then
            hum1.RigType, hum1.HipHeight = Enum.HumanoidRigType.R6, 0
        end
    end
    --the default roblox animate script edited and put in one line
    local script = gp(c, "Animate", "LocalScript") if not script.Disabled then script:ClearAllChildren() local Torso = gp(c, "Torso", "BasePart") local RightShoulder = gp(Torso, "Right Shoulder", "Motor6D") local LeftShoulder = gp(Torso, "Left Shoulder", "Motor6D") local RightHip = gp(Torso, "Right Hip", "Motor6D") local LeftHip = gp(Torso, "Left Hip", "Motor6D") local Neck = gp(Torso, "Neck", "Motor6D") local Humanoid = c:FindFirstChildOfClass("Humanoid") local pose = "Standing" local currentAnim = "" local currentAnimInstance = nil local currentAnimTrack = nil local currentAnimKeyframeHandler = nil local currentAnimSpeed = 1.0 local animTable = {} local animNames = { idle = { { id = "http://www.roblox.com/asset/?id=180435571", weight = 9 }, { id = "http://www.roblox.com/asset/?id=180435792", weight = 1 } }, walk = { { id = "http://www.roblox.com/asset/?id=180426354", weight = 10 } }, run = { { id = "run.xml", weight = 10 } }, jump = { { id = "http://www.roblox.com/asset/?id=125750702", weight = 10 } }, fall = { { id = "http://www.roblox.com/asset/?id=180436148", weight = 10 } }, climb = { { id = "http://www.roblox.com/asset/?id=180436334", weight = 10 } }, sit = { { id = "http://www.roblox.com/asset/?id=178130996", weight = 10 } }, toolnone = { { id = "http://www.roblox.com/asset/?id=182393478", weight = 10 } }, toolslash = { { id = "http://www.roblox.com/asset/?id=129967390", weight = 10 } }, toollunge = { { id = "http://www.roblox.com/asset/?id=129967478", weight = 10 } }, wave = { { id = "http://www.roblox.com/asset/?id=128777973", weight = 10 } }, point = { { id = "http://www.roblox.com/asset/?id=128853357", weight = 10 } }, dance1 = { { id = "http://www.roblox.com/asset/?id=182435998", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491037", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491065", weight = 10 } }, dance2 = { { id = "http://www.roblox.com/asset/?id=182436842", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491248", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491277", weight = 10 } }, dance3 = { { id = "http://www.roblox.com/asset/?id=182436935", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491368", weight = 10 }, { id = "http://www.roblox.com/asset/?id=182491423", weight = 10 } }, laugh = { { id = "http://www.roblox.com/asset/?id=129423131", weight = 10 } }, cheer = { { id = "http://www.roblox.com/asset/?id=129423030", weight = 10 } }, } local dances = {"dance1", "dance2", "dance3"} local emoteNames = { wave = false, point = false, dance1 = true, dance2 = true, dance3 = true, laugh = false, cheer = false} local function configureAnimationSet(name, fileList) if (animTable[name] ~= nil) then for _, connection in pairs(animTable[name].connections) do connection:disconnect() end end animTable[name] = {} animTable[name].count = 0 animTable[name].totalWeight = 0 animTable[name].connections = {} local config = script:FindFirstChild(name) if (config ~= nil) then table.insert(animTable[name].connections, config.ChildAdded:connect(function(child) configureAnimationSet(name, fileList) end)) table.insert(animTable[name].connections, config.ChildRemoved:connect(function(child) configureAnimationSet(name, fileList) end)) local idx = 1 for _, childPart in pairs(config:GetChildren()) do if (childPart:IsA("Animation")) then table.insert(animTable[name].connections, childPart.Changed:connect(function(property) configureAnimationSet(name, fileList) end)) animTable[name][idx] = {} animTable[name][idx].anim = childPart local weightObject = childPart:FindFirstChild("Weight") if (weightObject == nil) then animTable[name][idx].weight = 1 else animTable[name][idx].weight = weightObject.Value end animTable[name].count = animTable[name].count + 1 animTable[name].totalWeight = animTable[name].totalWeight + animTable[name][idx].weight idx = idx + 1 end end end if (animTable[name].count <= 0) then for idx, anim in pairs(fileList) do animTable[name][idx] = {} animTable[name][idx].anim = Instance.new("Animation") animTable[name][idx].anim.Name = name animTable[name][idx].anim.AnimationId = anim.id animTable[name][idx].weight = anim.weight animTable[name].count = animTable[name].count + 1 animTable[name].totalWeight = animTable[name].totalWeight + anim.weight end end end local function scriptChildModified(child) local fileList = animNames[child.Name] if (fileList ~= nil) then configureAnimationSet(child.Name, fileList) end end script.ChildAdded:connect(scriptChildModified) script.ChildRemoved:connect(scriptChildModified) local animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator") or nil if animator then local animTracks = animator:GetPlayingAnimationTracks() for i, track in ipairs(animTracks) do track:Stop(0) track:Destroy() end end for name, fileList in pairs(animNames) do configureAnimationSet(name, fileList) end local toolAnim = "None" local toolAnimTime = 0 local jumpAnimTime = 0 local jumpAnimDuration = 0.3 local toolTransitionTime = 0.1 local fallTransitionTime = 0.3 local jumpMaxLimbVelocity = 0.75 local function stopAllAnimations() local oldAnim = currentAnim if (emoteNames[oldAnim] ~= nil and emoteNames[oldAnim] == false) then oldAnim = "idle" end currentAnim = "" currentAnimInstance = nil if (currentAnimKeyframeHandler ~= nil) then currentAnimKeyframeHandler:disconnect() end if (currentAnimTrack ~= nil) then currentAnimTrack:Stop() currentAnimTrack:Destroy() currentAnimTrack = nil end return oldAnim end local function playAnimation(animName, transitionTime, humanoid) local roll = math.random(1, animTable[animName].totalWeight) local origRoll = roll local idx = 1 while (roll > animTable[animName][idx].weight) do roll = roll - animTable[animName][idx].weight idx = idx + 1 end local anim = animTable[animName][idx].anim if (anim ~= currentAnimInstance) then if (currentAnimTrack ~= nil) then currentAnimTrack:Stop(transitionTime) currentAnimTrack:Destroy() end currentAnimSpeed = 1.0 currentAnimTrack = humanoid:LoadAnimation(anim) currentAnimTrack.Priority = Enum.AnimationPriority.Core currentAnimTrack:Play(transitionTime) currentAnim = animName currentAnimInstance = anim if (currentAnimKeyframeHandler ~= nil) then currentAnimKeyframeHandler:disconnect() end currentAnimKeyframeHandler = currentAnimTrack.KeyframeReached:connect(keyFrameReachedFunc) end end local function setAnimationSpeed(speed) if speed ~= currentAnimSpeed then currentAnimSpeed = speed currentAnimTrack:AdjustSpeed(currentAnimSpeed) end end local function keyFrameReachedFunc(frameName) if (frameName == "End") then local repeatAnim = currentAnim if (emoteNames[repeatAnim] ~= nil and emoteNames[repeatAnim] == false) then repeatAnim = "idle" end local animSpeed = currentAnimSpeed playAnimation(repeatAnim, 0.0, Humanoid) setAnimationSpeed(animSpeed) end end local toolAnimName = "" local toolAnimTrack = nil local toolAnimInstance = nil local currentToolAnimKeyframeHandler = nil local function toolKeyFrameReachedFunc(frameName) if (frameName == "End") then playToolAnimation(toolAnimName, 0.0, Humanoid) end end local function playToolAnimation(animName, transitionTime, humanoid, priority) local roll = math.random(1, animTable[animName].totalWeight) local origRoll = roll local idx = 1 while (roll > animTable[animName][idx].weight) do roll = roll - animTable[animName][idx].weight idx = idx + 1 end local anim = animTable[animName][idx].anim if (toolAnimInstance ~= anim) then if (toolAnimTrack ~= nil) then toolAnimTrack:Stop() toolAnimTrack:Destroy() transitionTime = 0 end toolAnimTrack = humanoid:LoadAnimation(anim) if priority then toolAnimTrack.Priority = priority end toolAnimTrack:Play(transitionTime) toolAnimName = animName toolAnimInstance = anim currentToolAnimKeyframeHandler = toolAnimTrack.KeyframeReached:connect(toolKeyFrameReachedFunc) end end local function stopToolAnimations() local oldAnim = toolAnimName if (currentToolAnimKeyframeHandler ~= nil) then currentToolAnimKeyframeHandler:disconnect() end toolAnimName = "" toolAnimInstance = nil if (toolAnimTrack ~= nil) then toolAnimTrack:Stop() toolAnimTrack:Destroy() toolAnimTrack = nil end return oldAnim end local function onRunning(speed) if speed > 0.01 then playAnimation("walk", 0.1, Humanoid) if currentAnimInstance and currentAnimInstance.AnimationId == "http://www.roblox.com/asset/?id=180426354" then setAnimationSpeed(speed / 14.5) end pose = "Running" else if emoteNames[currentAnim] == nil then playAnimation("idle", 0.1, Humanoid) pose = "Standing" end end end local function onDied() pose = "Dead" end local function onJumping() playAnimation("jump", 0.1, Humanoid) jumpAnimTime = jumpAnimDuration pose = "Jumping" end local function onClimbing(speed) playAnimation("climb", 0.1, Humanoid) setAnimationSpeed(speed / 12.0) pose = "Climbing" end local function onGettingUp() pose = "GettingUp" end local function onFreeFall() if (jumpAnimTime <= 0) then playAnimation("fall", fallTransitionTime, Humanoid) end pose = "FreeFall" end local function onFallingDown() pose = "FallingDown" end local function onSeated() pose = "Seated" end local function onPlatformStanding() pose = "PlatformStanding" end local function onSwimming(speed) if speed > 0 then pose = "Running" else pose = "Standing" end end local function getTool() return c and c:FindFirstChildOfClass("Tool") end local function getToolAnim(tool) for _, c in ipairs(tool:GetChildren()) do if c.Name == "toolanim" and c.className == "StringValue" then return c end end return nil end local function animateTool() if (toolAnim == "None") then playToolAnimation("toolnone", toolTransitionTime, Humanoid, Enum.AnimationPriority.Idle) return end if (toolAnim == "Slash") then playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action) return end if (toolAnim == "Lunge") then playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action) return end end local function moveSit() RightShoulder.MaxVelocity = 0.15 LeftShoulder.MaxVelocity = 0.15 RightShoulder:SetDesiredAngle(3.14 /2) LeftShoulder:SetDesiredAngle(-3.14 /2) RightHip:SetDesiredAngle(3.14 /2) LeftHip:SetDesiredAngle(-3.14 /2) end local lastTick = 0 local function move(time) local amplitude = 1 local frequency = 1 local deltaTime = time - lastTick lastTick = time local climbFudge = 0 local setAngles = false if (jumpAnimTime > 0) then jumpAnimTime = jumpAnimTime - deltaTime end if (pose == "FreeFall" and jumpAnimTime <= 0) then playAnimation("fall", fallTransitionTime, Humanoid) elseif (pose == "Seated") then playAnimation("sit", 0.5, Humanoid) return elseif (pose == "Running") then playAnimation("walk", 0.1, Humanoid) elseif (pose == "Dead" or pose == "GettingUp" or pose == "FallingDown" or pose == "Seated" or pose == "PlatformStanding") then stopAllAnimations() amplitude = 0.1 frequency = 1 setAngles = true end if (setAngles) then local desiredAngle = amplitude * math.sin(time * frequency) RightShoulder:SetDesiredAngle(desiredAngle + climbFudge) LeftShoulder:SetDesiredAngle(desiredAngle - climbFudge) RightHip:SetDesiredAngle(-desiredAngle) LeftHip:SetDesiredAngle(-desiredAngle) end local tool = getTool() if tool and tool:FindFirstChild("Handle") then local animStringValueObject = getToolAnim(tool) if animStringValueObject then toolAnim = animStringValueObject.Value animStringValueObject.Parent = nil toolAnimTime = time + .3 end if time > toolAnimTime then toolAnimTime = 0 toolAnim = "None" end animateTool() else stopToolAnimations() toolAnim = "None" toolAnimInstance = nil toolAnimTime = 0 end end Humanoid.Died:connect(onDied) Humanoid.Running:connect(onRunning) Humanoid.Jumping:connect(onJumping) Humanoid.Climbing:connect(onClimbing) Humanoid.GettingUp:connect(onGettingUp) Humanoid.FreeFalling:connect(onFreeFall) Humanoid.FallingDown:connect(onFallingDown) Humanoid.Seated:connect(onSeated) Humanoid.PlatformStanding:connect(onPlatformStanding) Humanoid.Swimming:connect(onSwimming) game:GetService("Players").LocalPlayer.Chatted:connect(function(msg) local emote = "" if msg == "/e dance" then emote = dances[math.random(1, #dances)] elseif (string.sub(msg, 1, 3) == "/e ") then emote = string.sub(msg, 4) elseif (string.sub(msg, 1, 7) == "/emote ") then emote = string.sub(msg, 8) end if (pose == "Standing" and emoteNames[emote] ~= nil) then playAnimation(emote, 0.1, Humanoid) end end) playAnimation("idle", 0.1, Humanoid) pose = "Standing" tdelay(0, function() while c do local _, time = wait(0.1) if (script.Parent == c) and (not script.Disabled) then move(time) end end end) end 
end

local torso1 = torso
torso = gp(c, "Torso", "BasePart") or ((not R15toR6) and gp(c, torso.Name, "BasePart"))
if (typeof(hedafterneck) == "Instance") and head and torso and torso1 then
    local conNeck, conTorso, conTorso1 = nil, nil, nil
    local aligns = {}
    local function enableAligns()
        conNeck:Disconnect()
        conTorso:Disconnect()
        conTorso1:Disconnect()
        for i, v in pairs(aligns) do
            v.Enabled = true
        end
    end
    conNeck = hedafterneck.Changed:Connect(function(prop)
        if table.find({"Part0", "Part1", "Parent"}, prop) then
            enableAligns()
        end
    end)
    conTorso = torso:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
    conTorso1 = torso1:GetPropertyChangedSignal("Parent"):Connect(enableAligns)
    for i, v in pairs(getdescendants(head)) do
        if isa(v, "AlignPosition") or isa(v, "AlignOrientation") then
            i = tostring(i)
            aligns[i] = v
            v:GetPropertyChangedSignal("Parent"):Connect(function()
                aligns[i] = nil
            end)
            v.Enabled = false
        end
    end
end

local flingpart0 = gp(model, flingpart, "BasePart") or gp(gp(model, flingpart, "Accessory"), "Handle", "BasePart")
local flingpart1 = gp(c, flingpart, "BasePart") or gp(gp(c, flingpart, "Accessory"), "Handle", "BasePart")

local fling = function() end
if flingpart0 and flingpart1 then
    flingpart0:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (flingpart0 and flingpart0.Parent) then
            flingpart0 = nil
            fling = function() end
        end
    end)
    flingpart0.Archivable = true
    flingpart1:GetPropertyChangedSignal("Parent"):Connect(function()
        if not (flingpart1 and flingpart1.Parent) then
            flingpart1 = nil
            fling = function() end
        end
    end)
    local att0 = gp(flingpart0, "att0_" .. flingpart0.Name, "Attachment")
    local att1 = gp(flingpart1, "att1_" .. flingpart1.Name, "Attachment")
    if att0 and att1 then
        att0:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (att0 and att0.Parent) then
                att0 = nil
                fling = function() end
            end
        end)
        att1:GetPropertyChangedSignal("Parent"):Connect(function()
            if not (att1 and att1.Parent) then
                att1 = nil
                fling = function() end
            end
        end)
        local lastfling = nil
        local mouse = lp:GetMouse()
        fling = function(target, duration, rotVelocity)
            if typeof(target) == "Instance" then
                if isa(target, "BasePart") then
                    target = target.Position
                elseif isa(target, "Model") then
                    target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                    if target then
                        target = target.Position
                    else
                        return
                    end
                elseif isa(target, "Humanoid") then
                    target = target.Parent
                    if not (target and isa(target, "Model")) then
                        return
                    end
                    target = gp(target, "HumanoidRootPart", "BasePart") or gp(target, "Torso", "BasePart") or gp(target, "UpperTorso", "BasePart") or target:FindFirstChildWhichIsA("BasePart")
                    if target then
                        target = target.Position
                    else
                        return
                    end
                else
                    return
                end
            elseif typeof(target) == "CFrame" then
                target = target.Position
            elseif typeof(target) ~= "Vector3" then
                target = mouse.Hit
                if target then
                    target = target.Position
                else
                    return
                end
            end
            if target.Y < ws.FallenPartsDestroyHeight + 5 then
                target = v3(target.X, ws.FallenPartsDestroyHeight + 5, target.Z)
            end
            lastfling = target
            if type(duration) ~= "number" then
                duration = tonumber(duration) or 0.5
            end
            if typeof(rotVelocity) ~= "Vector3" then
                rotVelocity = v3(20000, 20000, 20000)
            end
            if not (target and flingpart0 and flingpart1 and att0 and att1) then
                return
            end
            flingpart0.Archivable = true
            local flingpart = clone(flingpart0)
            flingpart.Transparency = 1
            flingpart.CanCollide = false
            flingpart.Name = "flingpart_" .. flingpart0.Name
            flingpart.Anchored = true
            flingpart.Velocity = v3_0
            flingpart.RotVelocity = v3_0
            flingpart.Position = target
            flingpart:GetPropertyChangedSignal("Parent"):Connect(function()
                if not (flingpart and flingpart.Parent) then
                    flingpart = nil
                end
            end)
            flingpart.Parent = flingpart1
            if flingpart0.Transparency > 0.5 then
                flingpart0.Transparency = 0.5
            end
            att1.Parent = flingpart
            local con = nil
            local rotchg = v3(0, rotVelocity.Unit.Y * -1000, 0)
            con = heartbeat:Connect(function(delta)
                if target and (lastfling == target) and flingpart and flingpart0 and flingpart1 and att0 and att1 then
                    flingpart.Orientation += rotchg * delta
                    flingpart0.RotVelocity = rotVelocity
                else
                    con:Disconnect()
                end
            end)
            if alignmode ~= 4 then
                local con = nil
                con = renderstepped:Connect(function()
                    if flingpart0 and target then
                        flingpart0.RotVelocity = v3_0
                    else
                        con:Disconnect()
                    end
                end)
            end
            twait(duration)
            if lastfling ~= target then
                if flingpart then
                    if att1 and (att1.Parent == flingpart) then
                        att1.Parent = flingpart1
                    end
                    pcall(destroy, flingpart)
                end
                return
            end
            target = nil
            if not (flingpart and flingpart0 and flingpart1 and att0 and att1) then
                return
            end
            flingpart0.RotVelocity = v3_0
            att1.Parent = flingpart1
            pcall(destroy, flingpart)
        end
    end
end

lp:GetMouse().Button1Down:Connect(fling) --click fling
















local ZEONUI = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local TagsAndShit = Instance.new("ImageLabel")
local zeontag = Instance.new("TextLabel")
local exit = Instance.new("ImageLabel")
local exitbutton = Instance.new("TextButton")
local creditmelolol = Instance.new("TextLabel")
local custommodelolol = Instance.new("TextLabel")
local SideBarOptions = Instance.new("ImageLabel")
local fedorabutton = Instance.new("ImageLabel")
local THEBUTTON = Instance.new("TextButton")
local SideBarOptions_2 = Instance.new("ImageLabel")
local bar = Instance.new("ImageLabel")
local e1 = Instance.new("TextBox")
local bar2 = Instance.new("ImageLabel")
local TextButton = Instance.new("TextButton")
local bar3 = Instance.new("ImageLabel")
local e2 = Instance.new("TextBox")
local bar4 = Instance.new("ImageLabel")
local e3 = Instance.new("TextBox")

--Properties:

ZEONUI.Name = "ZEONUI"
ZEONUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Main.Name = "Main"
Main.Parent = ZEONUI
Main.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main.BackgroundTransparency = 1.000
Main.Position = UDim2.new(-0.892896712, 0, -0.392789423, 0)
Main.Size = UDim2.new(0, 482, 0, 232)
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Color3.fromRGB(45, 45, 45)
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(100, 100, 100, 100)
Main.SliceScale = 0.060

TagsAndShit.Name = "TagsAndShit"
TagsAndShit.Parent = Main
TagsAndShit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TagsAndShit.BackgroundTransparency = 1.000
TagsAndShit.Position = UDim2.new(0.160182595, 0, 0.0344827585, 0)
TagsAndShit.Size = UDim2.new(0, 395, 0, 26)
TagsAndShit.Image = "rbxassetid://3570695787"
TagsAndShit.ImageColor3 = Color3.fromRGB(30, 30, 30)
TagsAndShit.ScaleType = Enum.ScaleType.Slice
TagsAndShit.SliceCenter = Rect.new(100, 100, 100, 100)
TagsAndShit.SliceScale = 0.060

zeontag.Name = "zeontag"
zeontag.Parent = TagsAndShit
zeontag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
zeontag.BackgroundTransparency = 1.000
zeontag.Size = UDim2.new(0, 120, 0, 26)
zeontag.Font = Enum.Font.Fondamento
zeontag.Text = "Zeon Glitcher V2"
zeontag.TextColor3 = Color3.fromRGB(255, 255, 255)
zeontag.TextSize = 18.000

exit.Name = "exit"
exit.Parent = TagsAndShit
exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exit.BackgroundTransparency = 1.000
exit.Position = UDim2.new(0.946236551, 0, 0.15384616, 0)
exit.Size = UDim2.new(0, 18, 0, 18)
exit.Image = "rbxassetid://3570695787"
exit.ImageColor3 = Color3.fromRGB(255, 0, 0)
exit.ScaleType = Enum.ScaleType.Slice
exit.SliceCenter = Rect.new(100, 100, 100, 100)
exit.SliceScale = 0.040

exitbutton.Name = "exitbutton"
exitbutton.Parent = exit
exitbutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exitbutton.BackgroundTransparency = 0.999
exitbutton.Size = UDim2.new(0, 18, 0, 18)
exitbutton.Font = Enum.Font.SourceSans
exitbutton.Text = ""
exitbutton.TextColor3 = Color3.fromRGB(0, 0, 0)
exitbutton.TextSize = 14.000

creditmelolol.Name = "creditmelolol"
creditmelolol.Parent = TagsAndShit
creditmelolol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
creditmelolol.BackgroundTransparency = 1.000
creditmelolol.Position = UDim2.new(0, 0, 1, 0)
creditmelolol.Size = UDim2.new(0, 181, 0, 26)
creditmelolol.Font = Enum.Font.Fondamento
creditmelolol.Text = "By TrixLua/Golden exploits"
creditmelolol.TextColor3 = Color3.fromRGB(255, 255, 255)
creditmelolol.TextSize = 18.000

custommodelolol.Name = "custommodelolol"
custommodelolol.Parent = TagsAndShit
custommodelolol.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
custommodelolol.BackgroundTransparency = 1.000
custommodelolol.Position = UDim2.new(0.662093341, 0, 0, 0)
custommodelolol.Size = UDim2.new(0, 112, 0, 26)
custommodelolol.Font = Enum.Font.Fondamento
custommodelolol.Text = "Custom Mode"
custommodelolol.TextColor3 = Color3.fromRGB(255, 255, 255)
custommodelolol.TextSize = 18.000

SideBarOptions.Name = "SideBarOptions"
SideBarOptions.Parent = Main
SideBarOptions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SideBarOptions.BackgroundTransparency = 1.000
SideBarOptions.Position = UDim2.new(0.0253278166, 0, 0.0344827585, 0)
SideBarOptions.Size = UDim2.new(0, 57, 0, 210)
SideBarOptions.Image = "rbxassetid://3570695787"
SideBarOptions.ImageColor3 = Color3.fromRGB(30, 30, 30)
SideBarOptions.ScaleType = Enum.ScaleType.Slice
SideBarOptions.SliceCenter = Rect.new(100, 100, 100, 100)
SideBarOptions.SliceScale = 0.060




SideBarOptions_2.Name = "SideBarOptions"
SideBarOptions_2.Parent = Main
SideBarOptions_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SideBarOptions_2.BackgroundTransparency = 1.000
SideBarOptions_2.Position = UDim2.new(0.160182595, 0, 0.271551728, 0)
SideBarOptions_2.Size = UDim2.new(0, 391, 0, 155)
SideBarOptions_2.Image = "rbxassetid://3570695787"
SideBarOptions_2.ImageColor3 = Color3.fromRGB(30, 30, 30)
SideBarOptions_2.ScaleType = Enum.ScaleType.Slice
SideBarOptions_2.SliceCenter = Rect.new(100, 100, 100, 100)
SideBarOptions_2.SliceScale = 0.060

fedorabutton.Name = "fedorabutton"
fedorabutton.Parent = SideBarOptions
fedorabutton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fedorabutton.BackgroundTransparency = 1.000
fedorabutton.Position = UDim2.new(0.105263159, 0, 0.0476190522, 0)
fedorabutton.Size = UDim2.new(0, 45, 0, 36)
fedorabutton.Image = "rbxassetid://3570695787"
fedorabutton.ImageColor3 = Color3.fromRGB(65, 65, 65)
fedorabutton.ScaleType = Enum.ScaleType.Slice
fedorabutton.SliceCenter = Rect.new(100, 100, 100, 100)
fedorabutton.SliceScale = 0.060

THEBUTTON.Name = "THEBUTTON"
THEBUTTON.Parent = fedorabutton
THEBUTTON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
THEBUTTON.BackgroundTransparency = 0.999
THEBUTTON.Size = UDim2.new(0, 45, 0, 36)
THEBUTTON.Font = Enum.Font.Fondamento
THEBUTTON.Text = "FEDORA MODE"
THEBUTTON.TextColor3 = Color3.fromRGB(255, 255, 255)
THEBUTTON.TextSize = 13.000
THEBUTTON.TextWrapped = true


bar.Name = "bar"
bar.Parent = SideBarOptions_2
bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar.BackgroundTransparency = 1.000
bar.Position = UDim2.new(0.0208641887, 0, 0.0476190709, 0)
bar.Size = UDim2.new(0, 265, 0, 20)
bar.Image = "rbxassetid://3570695787"
bar.ImageColor3 = Color3.fromRGB(65, 65, 65)
bar.ScaleType = Enum.ScaleType.Slice
bar.SliceCenter = Rect.new(100, 100, 100, 100)
bar.SliceScale = 0.060

e1.Name = "e1"
e1.Parent = bar
e1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
e1.BackgroundTransparency = 0.999
e1.Position = UDim2.new(0.0315326042, 0, 0, 0)
e1.Size = UDim2.new(0, 257, 0, 19)
e1.Font = Enum.Font.SourceSans
e1.PlaceholderColor3 = Color3.fromRGB(161, 161, 161)
e1.PlaceholderText = "Wing anim"
e1.Text = ""
e1.TextColor3 = Color3.fromRGB(255, 255, 255)
e1.TextSize = 14.000
e1.TextXAlignment = Enum.TextXAlignment.Left

bar2.Name = "bar2"
bar2.Parent = SideBarOptions_2
bar2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar2.BackgroundTransparency = 1.000
bar2.Position = UDim2.new(0.729304075, 0, 0.0476191379, 0)
bar2.Size = UDim2.new(0, 88, 0, 20)
bar2.Image = "rbxassetid://3570695787"
bar2.ImageColor3 = Color3.fromRGB(65, 65, 65)
bar2.ScaleType = Enum.ScaleType.Slice
bar2.SliceCenter = Rect.new(100, 100, 100, 100)
bar2.SliceScale = 0.060

TextButton.Parent = bar2
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 0.999
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.102272727, 0, -0.0500000007, 0)
TextButton.Size = UDim2.new(0, 75, 0, 19)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "LIST (CHECK F9)"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000
TextButton.MouseButton1Down:Connect(function()

 print ("StarG")
 
 
 print ("StarNET")
 
 print ("NEBGNEPTUNAINV")


 print ("StarLO")


 print ("StarLF")
 
 
 
  print ("StarLFY")
 
 
 
  print ("StarLFR")


 print ("StarL")


 print ("StarLTR")


 print ("StarLTRPLUS")


 print ("StarLEX")


 print ("StarGLITCH")


 print ("StarLK")
 
 
 print ("StarEmpty")


 print ("StarLE")
 
 
  print ("StarLTE")


 print ("StarLED")
 
 
 print ("StarLEP")


 print ("StarA")


 print ("StarEL")


 print ("StarB")


 print ("StarEF")


 print ("StarEFE")


 print ("StarT")


 print ("StarLTT")



 print ("StarTE")


 print ("Aprins")


 print ("NebG1")


 print ("INSANEGREG")


 print ("MANGY")
 
 
  print ("Sonar1")


 print ("Sonar2")


 print ("MANGYT")


 print ("TSI")


 print ("NebG2")


 print ("NebG3")


 print ("NebG4")


 print ("NebG5")

 print ("NebG6")


 print ("NebG6INSANE")

 print ("NebG7")



 print ("extraFrench")
end)

bar3.Name = "bar3"
bar3.Parent = SideBarOptions_2
bar3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar3.BackgroundTransparency = 1.000
bar3.Position = UDim2.new(0.0208641887, 0, 0.284105659, 0)
bar3.Size = UDim2.new(0, 365, 0, 20)
bar3.Image = "rbxassetid://3570695787"
bar3.ImageColor3 = Color3.fromRGB(65, 65, 65)
bar3.ScaleType = Enum.ScaleType.Slice
bar3.SliceCenter = Rect.new(100, 100, 100, 100)
bar3.SliceScale = 0.060

e2.Name = "e2"
e2.Parent = bar3
e2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
e2.BackgroundTransparency = 0.999
e2.Position = UDim2.new(0.0315326005, 0, 0, 0)
e2.Size = UDim2.new(0, 353, 0, 19)
e2.Font = Enum.Font.SourceSans
e2.PlaceholderColor3 = Color3.fromRGB(161, 161, 161)
e2.PlaceholderText = "Mode name"
e2.Text = ""
e2.TextColor3 = Color3.fromRGB(255, 255, 255)
e2.TextSize = 14.000
e2.TextXAlignment = Enum.TextXAlignment.Left

bar4.Name = "bar4"
bar4.Parent = SideBarOptions_2
bar4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
bar4.BackgroundTransparency = 1.000
bar4.Position = UDim2.new(0.0208641887, 0, 0.540862441, 0)
bar4.Size = UDim2.new(0, 365, 0, 20)
bar4.Image = "rbxassetid://3570695787"
bar4.ImageColor3 = Color3.fromRGB(65, 65, 65)
bar4.ScaleType = Enum.ScaleType.Slice
bar4.SliceCenter = Rect.new(100, 100, 100, 100)
bar4.SliceScale = 0.060

e3.Name = "e3"
e3.Parent = bar4
e3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
e3.BackgroundTransparency = 0.999
e3.Position = UDim2.new(0.0315326005, 0, 0, 0)
e3.Size = UDim2.new(0, 353, 0, 19)
e3.Font = Enum.Font.SourceSans
e3.PlaceholderColor3 = Color3.fromRGB(161, 161, 161)
e3.PlaceholderText = "Music id"
e3.Text = ""
e3.TextColor3 = Color3.fromRGB(255, 255, 255)
e3.TextSize = 14.000
e3.TextXAlignment = Enum.TextXAlignment.Left

-- Scripts:

local function SNAXIQ_fake_script() -- exitbutton.LocalScript 
	local script = Instance.new('LocalScript', exitbutton)

	script.Parent.MouseButton1Down:Connect(function()
		script.Parent.Parent.Parent.Parent.Visible = false
	end)
	
end
coroutine.wrap(SNAXIQ_fake_script)()
local function ODKOFU_fake_script() -- Main.LocalScript 
	local script = Instance.new('LocalScript', Main)

	
	
	local buttonorSmthn = script.Parent
	
	
	wait(0.1)
	buttonorSmthn:TweenPosition(
		--YOUR CORODINATES HERE LIKE THIS REMOVER THESE {}
		UDim2.new(0.278, 0,0.279, 0),
		--dont forget the commas
		"Out",
		"Sine",
		1.25, -- time
		false -- optional but this says if you want to cancel any other tweens when doing this
	)
end
coroutine.wrap(ODKOFU_fake_script)()
local function UIHXZXT_fake_script() -- Main.LocalScript 
	local script = Instance.new('LocalScript', Main)

	local Frame = script.Parent
	
	Frame.Draggable = true
	
	local UIS = game:GetService("UserInputService")
	local function dragify(Frame)
		dragToggle = nil
		local dragSpeed = 0.50
		dragInput = nil
		dragStart = nil
		local dragPos = nil
		function updateInput(input)
			local Delta = input.Position - dragStart
			local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(0.30), {Position = Position}):Play()
		end
		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and UIS:GetFocusedTextBox() == nil then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)
		Frame.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input == dragInput and dragToggle then
				updateInput(input)
			end
		end)
	end
	
	dragify(script.Parent)
end
coroutine.wrap(UIHXZXT_fake_script)()

THEBUTTON.MouseButton1Down:Connect(function()

game.Players.LocalPlayer.Character["8BitController"].Name = "swordhalo"
game.Players.LocalPlayer.Character["swordhalo"].Handle.SpecialMesh:Remove()
wait (.1)
game.Players.LocalPlayer.Character["MeshPartAccessory"].Name = "BladeMasterAccessory"
game.Players.LocalPlayer.Character["BladeMasterAccessory"].Handle.SpecialMesh:Remove()
wait (.1)
game.Players.LocalPlayer.Character["MeshPartAccessory"].Name = "ShadowBladeMasterAccessory"
game.Players.LocalPlayer.Character["ShadowBladeMasterAccessory"].Handle.SpecialMesh:Remove()
wait (.1)
game.Players.LocalPlayer.Character["International Fedora"].Name = "Black Demon Trident"
game.Players.LocalPlayer.Character["Black Demon Trident"].Handle.SpecialMesh:Remove()
wait (.1)
game.Players.LocalPlayer.Character["International Fedora"].Name = "White Demon Trident"
game.Players.LocalPlayer.Character["White Demon Trident"].Handle.SpecialMesh:Remove()
wait (.1)
game.Players.LocalPlayer.Character["InternationalFedora"].Name = "Divine Aura"
game.Players.LocalPlayer.Character["Divine Aura"].Handle.SpecialMesh:Remove()
wait (.1)
game.Players.LocalPlayer.Character["Back_AccAccessory"].Name = "MeshPartAccessory"
wait (.1)
game.Players.LocalPlayer.Character["InternationalFedora"].Name = "MeshPartAccessory"

wait (.1)
game.Players.LocalPlayer.Character["InternationalFedora"].Name = "MeshPartAccessory"

wait (.1)
	game.Players.LocalPlayer.Character["InternationalFedora"].Name = "MeshPartAccessory"
end)

exitbutton.MouseButton1Down:Connect(function()

wait (.1)


game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")






   
HumanDied = false
local CountSCIFIMOVIELOL = 1
function SCIFIMOVIELOL(Part0,Part1,Position,Angle)
	local AlignPos = Instance.new('AlignPosition', Part1); AlignPos.Name = "AliP_"..CountSCIFIMOVIELOL
	AlignPos.ApplyAtCenterOfMass = true;
	AlignPos.MaxForce = 5772000-67752;
	AlignPos.MaxVelocity = math.huge/9e110;
	AlignPos.ReactionForceEnabled = false;
	AlignPos.Responsiveness = 200;
	AlignPos.RigidityEnabled = false;
	local AlignOri = Instance.new('AlignOrientation', Part1); AlignOri.Name = "AliO_"..CountSCIFIMOVIELOL
	AlignOri.MaxAngularVelocity = math.huge/9e110;
	AlignOri.MaxTorque = 5772000
	AlignOri.PrimaryAxisOnly = false;
	AlignOri.ReactionTorqueEnabled = false;
	AlignOri.Responsiveness = 200;
	AlignOri.RigidityEnabled = false;
	local AttachmentA=Instance.new('Attachment',Part1); AttachmentA.Name = "Ath_"..CountSCIFIMOVIELOL
	local AttachmentB=Instance.new('Attachment',Part0); AttachmentB.Name = "Ath_"..CountSCIFIMOVIELOL
	AttachmentA.Orientation = Angle or Vector3.new(0,0,0)
	AttachmentA.Position = Position or Vector3.new(0,0,0)
	AlignPos.Attachment1 = AttachmentA;
	AlignPos.Attachment0 = AttachmentB;
	AlignOri.Attachment1 = AttachmentA;
	AlignOri.Attachment0 = AttachmentB;
	CountSCIFIMOVIELOL = CountSCIFIMOVIELOL + 1
	return {AlignPos,AlignOri,AttachmentA,AttachmentB}
end




game:FindFirstChildOfClass("Players").LocalPlayer["Character"].Archivable = true
local hatnameclone = {}
for _,v in next, game:FindFirstChildOfClass("Players").LocalPlayer["Character"]:GetChildren() do
	if v:IsA("Accessory") then
		if hatnameclone[v.Name] then
			if hatnameclone[v.Name] == "s" then
				hatnameclone[v.Name] = {}
			end
			table.insert(hatnameclone[v.Name],v)
		else
			hatnameclone[v.Name] = "s"
		end
	end
end
for _,v in pairs(hatnameclone) do
	if type(v) == "table" then
		local num = 1
		for _,w in pairs(v) do
			w.Name = w.Name..num
			num = num + 1
		end
	end
end
hatnameclone = nil

local DeadChar = game:FindFirstChildOfClass("Players").LocalPlayer.Character

local CloneChar = DeadChar


for _,v in next, DeadChar:GetChildren() do
	if v:IsA("Accessory") then
		local topacc = false
		if v.Handle:FindFirstChildOfClass("Weld") then v.Handle:FindFirstChildOfClass("Weld"):Destroy() end
		v.Handle.Massless = true
		v.Handle.CanCollide = false
		if v.Handle:FindFirstChildOfClass("Attachment") then
			local ath__ = v.Handle:FindFirstChildOfClass("Attachment")
			if ath__.Name == "HatAttachment" or ath__.Name == "HairAttachment" or ath__.Name == "FaceFrontAttachment" or ath__.Name == "FaceCenterAttachment" then
				topacc = ath__.Name
			end
		end
        local bv = Instance.new("BodyVelocity",v.Handle)
		bv.Velocity = Vector3.new(0,0,0)
		coroutine.wrap(function()
			if topacc then
				local allthings = SCIFIMOVIELOL(v.Handle,DeadChar.Torso,Vector3.new(0,1.5,0)+ (DeadChar.Head[topacc].Position + (v.Handle[topacc].Position*-1)),Vector3.new(0,0,0))
				local normaltop = allthings[1].Attachment1
				local alipos = allthings[1]
				local alirot = allthings[2]
				local p0 = v.Handle
				local p1 = DeadChar.Head
				alipos.Parent = CloneChar:FindFirstChild(v.Name).Handle
				alirot.Parent = CloneChar:FindFirstChild(v.Name).Handle
				while true do
					game:GetService("RunService").Stepped:wait()
					if HumanDied then break end
					coroutine.wrap(function()
						if alipos.Attachment1 == normaltop then
							p0.CFrame = p0.CFrame:lerp((((DeadChar.Torso.CFrame * CFrame.new(0,1.5,0)) * p1[topacc].CFrame) * p0[topacc].CFrame:inverse()),1)
						else
							v.Handle.CFrame = v.Handle.CFrame:lerp(alipos.Attachment1.Parent.CFrame * CFrame.new(alipos.Attachment1.Position) * CFrame.Angles(math.rad(alipos.Attachment1.Rotation.X),math.rad(alipos.Attachment1.Rotation.Y),math.rad(alipos.Attachment1.Rotation.Z)),1)
						end
					end)()
				end
			else
				SCIFIMOVIELOL(v.Handle,CloneChar[v.Name].Handle,Vector3.new(0,0,0),Vector3.new(0,0,0))
			end
		end)()
    end
end


if CloneChar.Head:FindFirstChildOfClass("Decal") then CloneChar.Head:FindFirstChildOfClass("Decal").Transparency = 1 end









--if ANIMATIONHERE then ANIMATIONHERE.Parent = CloneChar end
wait()

local data = {}

 Player = game:GetService("Players").LocalPlayer
        Cam = workspace.CurrentCamera
        Character = game.Players.LocalPlayer.Character
        Head = Character.Head
        Cam.CameraSubject = Head

local script = game:GetObjects("rbxassetid://5446036971")[1]

script.WingPiece.qPerfectionWeld:Destroy()

do
local NEVER_BREAK_JOINTS = false

local function CallOnChildren(Instance, FunctionToCall)
	FunctionToCall(Instance)

	for _, Child in next, Instance:GetChildren() do
		CallOnChildren(Child, FunctionToCall)
	end
end

local function GetBricks(StartInstance)
	local List = {}
	CallOnChildren(StartInstance, function(Item)
		if Item:IsA("BasePart") then
			List[#List+1] = Item;
		end
	end)

	return List
end

local function Modify(Instance, Values)
	assert(type(Values) == "table", "Values is not a table");

	for Index, Value in next, Values do
		if type(Index) == "number" then
			Value.Parent = Instance
		else
			Instance[Index] = Value
		end
	end
	return Instance
end

local function Make(ClassType, Properties)
	return Modify(Instance.new(ClassType), Properties)
end

local Surfaces = {"TopSurface", "BottomSurface", "LeftSurface", "RightSurface", "FrontSurface", "BackSurface"}
local HingSurfaces = {"Hinge", "Motor", "SteppingMotor"}

local function HasWheelJoint(Part)
	for _, SurfaceName in pairs(Surfaces) do
		for _, HingSurfaceName in pairs(HingSurfaces) do
			if Part[SurfaceName].Name == HingSurfaceName then
				return true
			end
		end
	end
	
	return false
end

local function ShouldBreakJoints(Part)
	if NEVER_BREAK_JOINTS then
		return false
	end
	
	if HasWheelJoint(Part) then
		return false
	end
	
	local Connected = Part:GetConnectedParts()
	
	if #Connected == 1 then
		return false
	end
	
	for _, Item in pairs(Connected) do
		if HasWheelJoint(Item) then
			return false
		elseif not Item:IsDescendantOf(script.Parent) then
			return false
		end
	end
	
	return true
end

local function WeldTogether(Part0, Part1, JointType, WeldParent)

	JointType = JointType or "Weld"
	local RelativeValue = Part1:FindFirstChild("qRelativeCFrameWeldValue")
	
	local NewWeld = Part1:FindFirstChild("qCFrameWeldThingy") or Instance.new(JointType)
	Modify(NewWeld, {
		Name = "qCFrameWeldThingy";
		Part0  = Part0;
		Part1  = Part1;
		C0     = CFrame.new();--Part0.CFrame:inverse();
		C1     = RelativeValue and RelativeValue.Value or Part1.CFrame:toObjectSpace(Part0.CFrame); --Part1.CFrame:inverse() * Part0.CFrame;-- Part1.CFrame:inverse();
		Parent = Part1;
	})

	if not RelativeValue then
		RelativeValue = Make("CFrameValue", {
			Parent     = Part1;
			Name       = "qRelativeCFrameWeldValue";
			Archivable = true;
			Value      = NewWeld.C1;
		})
	end

	return NewWeld
end

local function WeldParts(Parts, MainPart, JointType, DoNotUnanchor)

	for _, Part in pairs(Parts) do
		if ShouldBreakJoints(Part) then
			Part:BreakJoints()
		end
	end
	
	for _, Part in pairs(Parts) do
		if Part ~= MainPart then
			WeldTogether(MainPart, Part, JointType, MainPart)
		end
	end

	if not DoNotUnanchor then
		for _, Part in pairs(Parts) do
			Part.Anchored = false
		end
		MainPart.Anchored = false
	end
end

local function PerfectionWeld()	
	local Parts = GetBricks(script.WingPiece)
	WeldParts(Parts, script.WingPiece.Main, "Weld", false)
end
PerfectionWeld()
end

--// Shortcut Variables \\--
local S = setmetatable({},{__index = function(s,i) return game:service(i) end})
local CF = {N=CFrame.new,A=CFrame.Angles,fEA=CFrame.fromEulerAnglesXYZ}
local C3 = {tRGB= function(c3) return c3.r*255,c3.g*255,c3.b*255 end,N=Color3.new,RGB=Color3.fromRGB,HSV=Color3.fromHSV,tHSV=Color3.toHSV}
local V3 = {N=Vector3.new,FNI=Vector3.FromNormalId,A=Vector3.FromAxis}
local M = {C=math.cos,R=math.rad,S=math.sin,P=math.pi,RNG=math.random,MRS=math.randomseed,H=math.huge,RRNG = function(min,max,div) return math.rad(math.random(min,max)/(div or 1)) end}
local R3 = {N=Region3.new}
local De = S.Debris
local WS = workspace
local Lght = S.Lighting
local RepS = S.ReplicatedStorage
local IN = Instance.new
local Plrs = S.Players
local UIS = S.UserInputService


local Player = game.Players.LocalPlayer
local Char = Player.Character
local Mouse = Player:GetMouse()
local Hum = Char:FindFirstChildOfClass'Humanoid'
local Torso = Char.Torso
local RArm = Char["Right Arm"]
local LArm = Char["Left Arm"]
local RLeg = Char["Right Leg"]
local LLeg = Char["Left Leg"]	
local Root = Char:FindFirstChild'HumanoidRootPart'
local Head = Char.Head
local Sine = 0;
local Change = 1
local Attack=false
local NeutralAnims=true
local timePos=30;
local walking=true;
local legAnims=true;
local movement = 8
local footsound=0;
local WalkSpeed=16;
local Combo=0;
local Mode='Sadness'
local vaporwaveMode=false;
local WingAnim='NebG1'
local music;
local hue = 0;
local WingSine=0;
local MusicMode=1;
local visSong = 319138964;
local EffectFolder = script:WaitForChild'FXFolder'
local PrimaryColor = Color3.new(1,1,1)
local ClickTimer = 0;
local ClickAttack = 1;
local camera = workspace.CurrentCamera
local LastSphere = time();
local Frame_Speed = 60
local VaporwaveSongs={
	2231500330;
	654094806;
	743334292;
	334283059;
	2082142910;
}


local WingPiece = script:WaitForChild'WingPiece'
WingPiece.Parent=nil
local WingAnims={}
local Playlist={
	Default=1702473314;
	ScrapBoy=1215691669;
	Defeated=860594509;
	Annihilate=2116461106;
	DashAndDodge=2699922745;
	ZenWavy=2231500330;
	Beachwalk=334283059;
	Pyrowalk=2082142910;
	Vapor90s=654094806;
}

--[[
Sadness - PURIFIED - Lost Soul
=_-Humane-_=
CALAMITANIA - INFINITE VOID
GALACTIA - Th1rt3en
INFINITY - Vanta Black
UNBROKEN - Frostbite
TRIX-LUA
Careless - Radioactive
AURORA - The Doctor
]]

--2699922745
local modeInfo={
    {Name="no is some what you think...",Walkspeed=50,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=1839755231,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='StarEFE'};
    {Name="pls dont say this",Walkspeed=50,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=9113084761,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='StarEmpty'};
	{Name="SANS",Walkspeed=50,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=1839444520,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='StarL'};
	{Name="ULTRA SANS",Walkspeed=50,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=1842652230,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};WingAnim='StarGLITCHV2'};
	{Name=(e2.Text),Walkspeed=50,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=(e3.Text),LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim=(e1.Text)};
	{Name="FREEZING",Walkspeed=50,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,255,255);Music=9047050075,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};WingAnim='CERTUS1'};
	{Name="The Sword Runner",Walkspeed=45,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=4558398377,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarLP'};
	{Name="DARKENED",Walkspeed=67,moveVal=15,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.5,.5,.5);Music=0,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarNET'};
	{Name="NEPTUNIAN V",Walkspeed=67,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=5409360995,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='NEBGNEPTUNAINV'};
	{Name="NEPTUNIAN V (UNEQUIPPED)",Walkspeed=67,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=1845391099,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='NEBGNEPTUNAINVU'};
	{Name="LOVE",Walkspeed=45,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=601817049,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='StarLEX'};
	{Name="gh0st3d",Walkspeed=50,moveVal=15,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.5,.5,.5);Music=1747451164,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='StarGLITCH'};
	{Name="Time",Walkspeed=78,moveVal=13,Font=Enum.Font.Fantasy,StrokeColor=C3.N(255,255,255);Music=9048378170,LeftWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'lime green'.Color,Enum.Material.Neon};WingAnim='StarEL'};
	{Name="REVENGE",Walkspeed=46,moveVal=13,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0,0,0);Music=1837727559,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarLTE'};
	{Name="The Big Black",Walkspeed=73,moveVal=13,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0,0,0);Music=1845818501,LeftWing={0,BrickColor.new'Neon white'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Neon white'.Color,Enum.Material.Neon};WingAnim='StarLTI'};
	{Name="Universal",Walkspeed=46,moveVal=13,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0,0,0);Music=561661266,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarLTR'};
	{Name="Defected",Walkspeed=46,moveVal=13,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0,0,0);Music=253456836,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarGRE'};
	{Name="Pheonix",Walkspeed=69,moveVal=13,Font=Enum.Font.Fantasy,StrokeColor=C3.N(255,255,255);Music=9046863579,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};WingAnim='StarB'};
	{Name="BIT32",Walkspeed=46,moveVal=13,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.5,.5,.500);Music=366948782,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='StarT'};
	{Name="HyPnOtIC",Walkspeed=35,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.500);Music=1845092181,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarEF'};
	{Name="Sadness",Walkspeed=16,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=9046435309,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='NebG1'};
	{Name="PRISM",Walkspeed=71,moveVal=9,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.5);Music=1839857296,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='MANGYR'};
	{Name="ULTRAVIOLET",Walkspeed=22,moveVal=9,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,255,255);Music=391592859,LeftWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};WingAnim='CERTUS3'};
	{Name="=_-Humane-_=",Walkspeed=16,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(255,152,220);Music=7024233823,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Pink'.Color,Enum.Material.Neon};WingAnim='NebG6'};
	{Name="Interstellar",Walkspeed=120,moveVal=15,Font=Enum.Font.Fantasy,StrokeColor=C3.N(255, 255, 255);Music=7023635858,LeftWing={0,BrickColor.new'Really Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='Sonar2',0.1};
	{Name="CALAMITANIA",Walkspeed=120,moveVal=13,Font=Enum.Font.Fantasy,StrokeColor=C3.N(255,255,255);Music=9048378262,LeftWing={0,BrickColor.new'Pink'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};WingAnim='StarLCR'};
	{Name="Galactic",Walkspeed=69,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.6,.0,.9);Music=0,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};WingAnim='SONUS5'};
	{Name="SPACETIME",Walkspeed=24,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.255,.255,.255);Music=9046476113,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};WingAnim='SONUS5Timed'};
	{Name="PARADOX",Walkspeed=68,moveVal=15,Font=Enum.Font.Fantasy,StrokeColor=C3.N(.6,.0,.9);Music=395351949,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};WingAnim='SONUS1'};
	{Name="GALACTIA",Walkspeed=48,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.N(0,0,0);Music=1845341094,LeftWing={0,BrickColor.new'Magenta'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Magenta'.Color,Enum.Material.Glass};WingAnim='SONUS3'};
	{Name="br0k3n",Walkspeed=67,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(.1,.1,.1);Music=1837560230,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Glass};WingAnim={'INSANEGREG2',2}};
	{Name="INFINITY",Walkspeed=79,moveVal=8,Font=Enum.Font.Garamond,StrokeColor=C3.N(.1,.1,.1);Music=7028970358,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Glass};WingAnim={'INSANEGREG',2}};
	{Name="UNBROKEN",Walkspeed=64,moveVal=14,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(0,190,190);Music=9044565954,LeftWing={0,BrickColor.new'Pastel light blue'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'Pastel light blue'.Color,Enum.Material.Glass};WingAnim='Sonar1'};	
	{Name="TRIX-LUA",Walkspeed=26,moveVal=10,Font=Enum.Font.Arcade,StrokeColor=C3.N(.50,.50,.50);Music=visSong,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='StarT'};
	{Name="Bruh",Walkspeed=35,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(.5,.5,.500);Music=1836362602,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarEFTR'};
	{Name="Careless",Walkspeed=39,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.RGB(98,37,209);Music=1845736826,LeftWing={0,BrickColor.new'Dark indigo'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Dark indigo'.Color,Enum.Material.DiamondPlate};WingAnim='MANGYRT'};
	{Name="AURORA",Walkspeed=56,moveVal=8,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(255,152,220);Music=7024340270,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarLTTE'};
	{Name="Dark Energy",Walkspeed=29,moveVal=13,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(255,152,220);Music=7029031068,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='StarLTE'};
	{Name="lost",Walkspeed=21,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,152,220);Music=1840271919,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='StarLTR'};
	{Name="ZEN-X",Walkspeed=200,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(255,0,0);Music=1843517532,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarABC'};
	{Name="FORCE",Walkspeed=20,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(0,0,0);Music=1842960025,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='INSANEGREG2F'};
	{Name="HEROIC",Walkspeed=37,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.RGB(255,0,220);Music=1839703786,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};WingAnim='StarL'};
	--MAJORS--
	{Name="LOSS",Walkspeed=48,moveVal=12,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(.6,.0,.9);Music=268698165,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='StarLOS'};
	{Name="PESTILENCE",Walkspeed=89,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(.6,.0,.9);Music=4177790309,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='SONUS1P'};
	{Name="SYNCHRO",Walkspeed=26,moveVal=12,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,0);Music=745599876,LeftWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Gold'.Color,Enum.Material.Neon};WingAnim='StarLF'};
	{Name="SPINNER",Walkspeed=26,moveVal=12,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,0);Music=6535256612,LeftWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};WingAnim='StarLFY'};
	{Name="OVERKILL",Walkspeed=88,moveVal=14,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,0);Music=4027028379,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarLFR'};
	{Name="Mayhem",Walkspeed=15,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,0,0);Music=1838645741,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='StarG'};
	{Name="Inferno",Walkspeed=50,moveVal=15,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(0,0,0);Music=1837278308,LeftWing={0,BrickColor.new'Flame reddish orange'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Flame reddish orange'.Color,Enum.Material.Neon};WingAnim='StarLEP'};
	{Name="N U C L E A R",Walkspeed=76,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(0,255,0);Music=1838645741,LeftWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Lime green'.Color,Enum.Material.Neon};WingAnim='StarLE'};
	{Name="Calamified",Walkspeed=18,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(0,0,0);Music=1861780345,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};WingAnim='StarLED'};
	{Name="Broken PR0GRam",Walkspeed=19,moveVal=9,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(255,255,255);Music=1497785701,LeftWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Cyan'.Color,Enum.Material.Neon};WingAnim='StarLEG'};
	{Name="PURIFIED",Walkspeed=64,moveVal=20,Font=Enum.Font.Arcade,StrokeColor=C3.N(.2,.2,.2);Music=1842559618,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Dark stone grey'.Color,Enum.Material.Glass};WingAnim={'StarABS'}};
	{Name="ZORNO",Walkspeed=64,moveVal=15,Font=Enum.Font.Arcade,StrokeColor=C3.N(255,.9,0);Music=1846612949,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Glass};WingAnim={'StarBS'}};
	{Name="INFINITE VOID",Walkspeed=64,moveVal=20,Font=Enum.Font.Gotham,StrokeColor=C3.N(0,0,0);Music=7029031068,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Glass};WingAnim={'StarA',10}};
	{Name="The Doctor",Walkspeed=16,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(0,0,0);Music=1845756489,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'White'.Color,Enum.Material.Neon};WingAnim='CERTUS2'};
	{Name="ILLUMINATION",Walkspeed=35,moveVal=8,Font=Enum.Font.Fantasy,StrokeColor=C3.N(255,255,255);Music=1837805876,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.Neon};WingAnim='StarTE', 20};
   	{Name="TIMELESS",Walkspeed=92,moveVal=15,Font=Enum.Font.Gotham,StrokeColor=C3.RGB(98,37,209);Music=4666871453,LeftWing={0,BrickColor.new'Black'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'Black'.Color,Enum.Material.DiamondPlate};WingAnim='MANGYT'};
   	{Name="LIGHTSPEED",Walkspeed=200,moveVal=15,Font=Enum.Font.Gotham,StrokddeColor=C3.RGB(98,37,209);Music=3202474093,LeftWing={0,BrickColor.new'White'.Color,Enum.Material.DiamondPlate};RightWing={0,BrickColor.new'White'.Color,Enum.Material.DiamondPlate};WingAnim='SONUS2'};
   	{Name="=_-MADNESS-_=",Walkspeed=94,moveVal=12,Font=Enum.Font.Garamond,StrokeColor=C3.N(255,0,0);Music=833779944,LeftWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Crimson'.Color,Enum.Material.Neon};WingAnim='NebG6INSANE'};
    {Name="Omniversal",Walkspeed=79,moveVal=15,Font=Enum.Font.Garamond,StrokeColor=C3.N(255,255,255);Music=9042632936,LeftWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};RightWing={0,BrickColor.new'Really black'.Color,Enum.Material.Neon};WingAnim='NebG5'};
}

--future mode names --   Broken, Alone, Deathly, UNSEEN, Time, Lost Traveller, (more will be added future.)

NewInstance = function(instance,parent,properties)
	local inst = Instance.new(instance)
	inst.Parent = parent
	if(properties)then
		for i,v in next, properties do
			pcall(function() inst[i] = v end)
		end
	end
	return inst;
end

function newMotor(P0,P1,C0,C1)
	return NewInstance('Motor',P0,{Part0=P0,Part1=P1,C0=C0,C1=C1})
end

local welds = {}
local WeldDefaults = {}

table.insert(welds,newMotor(Torso,Head,CF.N(0,1.5,0),CF.N()))
table.insert(welds,newMotor(Root,Torso,CF.N(),CF.N()))
table.insert(welds,newMotor(Torso,RLeg,CF.N(.5,-1,0),CF.N(0,1,0)))
table.insert(welds,newMotor(Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0)))
table.insert(welds,newMotor(Torso,LLeg,CF.N(-.5,-1,0),CF.N(0,1,0)))
table.insert(welds,newMotor(Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0)))

WeldDefaults={}
for i = 1,#welds do
	local v=welds[i]
	WeldDefaults[i]=v.C0
end

local NK,RJ,RH,RS,LH,LS=unpack(welds)

local NKC0,RJC0,RHC0,RSC0,LHC0,LSC0=unpack(WeldDefaults)

function makeMusic(id,pit,timePos)
	local sound = Torso:FindFirstChild(Player.Name.."song") or Char:FindFirstChild(Player.Name.."song")
	local parent = (MusicMode==2 and Char or Torso)
	if(not sound)then 
		sound = NewInstance("Sound",parent,{Name=Player.Name.."song",Volume=(MusicMode==3 and 0 or 5),Pitch=(pit or 1),Looped=true})
		NewInstance("EqualizerSoundEffect",sound,{HighGain=0,MidGain=2,LowGain=10})
	end
	if(id=='stop')then
		if(sound)then
			sound:Stop()
		end
	else
		local timePos = typeof(timePos)=='number' and timePos or sound.TimePosition
		sound.Volume = (MusicMode==3 and 0 or 5)
		sound.Name = Player.Name.."song"
		sound.Looped=true
		sound.SoundId = "rbxassetid://"..id
		sound.Pitch=(pit or 1)
		sound:Play()
		sound.TimePosition = timePos
	end
	return sound;
end

function playMusic(id,pitch,timePos)
	return makeMusic(id,pitch,timePos)
end

for _,v in next, Hum:GetPlayingAnimationTracks() do
	v:Stop(0);
end

-- SCRIPT STUFF --

function swait(num)
	if num == 0 or num == nil then
		game:GetService("RunService").Stepped:wait()
	else
		for i = 0, num do
			game:GetService("RunService").Stepped:wait()
		end
	end
end

--// Effects \\--

function Tween(obj,props,time,easing,direction,repeats,backwards)
	local info = TweenInfo.new(time or .5, easing or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out, repeats or 0, backwards or false)
	local tween = S.TweenService:Create(obj, info, props)
	
	tween:Play()
end

function StartShake(Settings)
	return true
end

function Camshake(shakedata)
	StartShake(shakedata)
end

local Effects=NewInstance("Folder",Char)
Effects.Name=Player.Name..'Effects'


function ShowDamage(Pos, Text, Time, Color)
	local Pos = Pos or V3.N(0, 0, 0)
	local Text = tostring(Text or "")
	local Time = Time or 2
	local Color = Color or C3.N(1, 0, 1)
	local EffectPart = Part(Effects,Color,Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),CFrame.new(Pos),true,false)
	EffectPart.Transparency=1
	local BillboardGui = NewInstance("BillboardGui",EffectPart,{
		Size = UDim2.new(3,0,3,0),
		Adornee = EffectPart,
	})
	
	local TextLabel = NewInstance("TextLabel",BillboardGui,{
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		TextColor3 = Color,
		TextScaled = true,
		Font = Enum.Font.ArialBold, 
	})
	S.Debris:AddItem(EffectPart, Time+.5)
	delay(0, function()
		local rot=math.random(-10,10)/15
		local raise=.2
		local Frames = Time/Frame_Speed
		for i=0,1.1,.02 do
			swait()
			TextLabel.Rotation=TextLabel.Rotation+rot
			raise=raise-.008
			EffectPart.Position = EffectPart.Position + Vector3.new(0, raise, 0)
			TextLabel.TextTransparency=i
			TextLabel.TextStrokeTransparency=i
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end


local baseSound = IN("Sound")

function Soond(parent,id,pitch,volume,looped,effect,autoPlay)
	local Sound = baseSound:Clone()
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			Sound:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent =parent or Torso
	return Sound
end
	
function SoondPart(id,pitch,volume,looped,effect,autoPlay,cf)
	local soundPart = NewInstance("Part",Effects,{Transparency=1,CFrame=cf or Torso.CFrame,Anchored=true,CanCollide=false,Size=V3.N()})
	local Sound = IN("Sound")
	Sound.SoundId = "rbxassetid://".. tostring(id or 0)
	Sound.Pitch = pitch or 1
	Sound.Volume = volume or 1
	Sound.Looped = looped or false
	if(autoPlay)then
		coroutine.wrap(function()
			repeat wait() until Sound.IsLoaded
			Sound.Playing = autoPlay or false
		end)()
	end
	if(not looped and effect)then
		Sound.Stopped:connect(function()
			Sound.Volume = 0
			soundPart:destroy()
		end)
	elseif(effect)then
		warn("Sound can't be looped and a sound effect!")
	end
	Sound.Parent = soundPart
	return Sound,soundPart
end

function SoundPart(...)
	return SoondPart(...)
end

function Sound(...)
	return Soond(...)
end
	
function Part(parent,color,material,size,cframe,anchored,cancollide)
	local part = IN("Part")
	part.Parent = parent or Char
	part[typeof(color) == 'BrickColor' and 'BrickColor' or 'Color'] = color or C3.N(0,0,0)
	part.Material = material or Enum.Material.SmoothPlastic
	part.TopSurface,part.BottomSurface=10,10
	part.Size = size or V3.N(1,1,1)
	part.CFrame = cframe or CF.N(0,0,0)
	part.CanCollide = cancollide or false
	part.Anchored = anchored or false
	return part
end

function Weld(part0,part1,c0,c1)
	local weld = IN("Weld")
	weld.Parent = part0
	weld.Part0 = part0
	weld.Part1 = part1
	weld.C0 = c0 or CF.N()
	weld.C1 = c1 or CF.N()
	return weld
end

function Mesh(parent,meshtype,meshid,textid,scale,offset)
	local part = IN("SpecialMesh")
	part.MeshId = meshid or ""
	part.TextureId = textid or ""
	part.Scale = scale or V3.N(1,1,1)
	part.Offset = offset or V3.N(0,0,0)
	part.MeshType = meshtype or Enum.MeshType.Sphere
	part.Parent = parent
	return part
end

function GotEffect(data)
	-- just for easy reference
	local color = data.Color or Color3.new(.7,.7,.7);
	local endcolor = data.EndColor or nil;
	local mat = data.Material or Enum.Material.SmoothPlastic;
	local cframe = data.CFrame or CFrame.new();
	local endpos = data.EndPos or nil;
	local meshdata = data.Mesh or {}
	local sounddata = data.Sound or {}
	local size = data.Size or Vector3.new(1,1,1)
	local endsize = data.EndSize or Vector3.new(6,6,6)
	local rotinc = data.RotInc or {0,0,0} -- ONLY FOR LEGACY SYSTEM
	local transparency = data.Transparency or NumberRange.new(0,1)
	local acceleration = data.Acceleration or nil; -- ONLY FOR LEGACY SYSTEM
	local endrot = data.EndRotation or {0,0,0} -- ONLY FOR EXPERIMENTAL SYSTEM
	local style = data.Style or false; -- ONLY FOR EXPERIMENTAL SYSTEM
	local lifetime = data.Lifetime or 1;
	local system = data.FXSystem;
	local setpart = typeof(data.Part)=='string' and EffectFolder:FindFirstChild(tostring(data.Part)):Clone() or typeof(data.Part)=='Instance' and data.Part or nil
	
	local S,PM;
	
	local P = setpart or Part(Effects,color,mat,Vector3.new(1,1,1),cframe,true,false)
	
	if(not P:IsA'MeshPart' and not P:IsA'UnionOperation')then
		if(meshdata == "Blast")then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://20329976','',size,Vector3.new(0,0,-size.X/8))
		elseif(meshdata == 'Ring')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://559831844','',size,Vector3.new(0,0,0))
		elseif(meshdata == 'Slash1')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://662586858','',Vector3.new(size.X/10,.001,size.Z/10),Vector3.new(0,0,0))
		elseif(meshdata == 'Slash2')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://448386996','',Vector3.new(size.X/1000,size.Y/100,size.Z/100),Vector3.new(0,0,0))
		elseif(meshdata == 'Tornado1')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://443529437','',size/10,Vector3.new(0,0,0))
		elseif(meshdata == 'Tornado2')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://168892432','',size/4,Vector3.new(0,0,0))
		elseif(meshdata == 'Skull')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://4770583','',size*2,Vector3.new(0,0,0))
		elseif(meshdata == 'Crystal')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://9756362','',size,Vector3.new(0,0,0))
		elseif(meshdata == 'Cloud')then
			PM = Mesh(P,Enum.MeshType.FileMesh,'rbxassetid://1095708','',size,Vector3.new(0,0,0))
		elseif(typeof(meshdata) == 'table')then
			local Type = meshdata.Type or Enum.MeshType.Brick
			local ID = meshdata.ID or '';
			local Tex = meshdata.Texture or '';
			local Offset = meshdata.Offset or Vector3.new(0,0,0)
			PM = Mesh(P,Type,ID,Tex,size,Offset)
		else
			PM = Mesh(P,Enum.MeshType.Brick,'','',size)
		end
	end
	local startTrans = typeof(transparency) == 'number' and transparency or typeof(transparency) == 'NumberRange' and transparency.Min or typeof(transparency) == 'table' and transparency[1] or 0
	local endTrans = typeof(transparency) == 'NumberRange' and transparency.Max or typeof(transparency) == 'table' and transparency[2] or 1
	
	P.Material = mat
	P.CFrame = cframe
	P.Color = (typeof(color)=='BrickColor' and color.Color or color)
	P.Anchored = true
	P.CanCollide = false
	P.Transparency = startTrans
	P.Parent = Effects
	local random = Random.new();
	game:service'Debris':AddItem(P,lifetime+3)
	
	
	-- actual effect stuff
	local mult = 1;
	if(PM)then
		if(PM.MeshId == 'rbxassetid://20329976')then
			PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
		elseif(PM.MeshId == 'rbxassetid://4770583')then
			mult = 2
		elseif(PM.MeshId == 'rbxassetid://168892432')then
			mult = .25
		elseif(PM.MeshId == 'rbxassetid://443529437')then
			mult = .1
		elseif(PM.MeshId == 'rbxassetid://443529437')then
			mult = .1
		end
	end	
	coroutine.wrap(function()
		if(system == 'Legacy' or system == 1 or system == nil)then
			local frames = (typeof(lifetime) == 'NumberRange' and random:NextNumber(lifetime.Min,lifetime.Max) or typeof(lifetime) == 'number' and lifetime or 1)*Frame_Speed
			for i = 0, frames do
				local div = (i/frames)
				P.Transparency=(startTrans+(endTrans-startTrans)*div)
				
				if(PM)then PM.Scale = size:lerp(endsize*mult,div) else P.Size = size:lerp(endsize*mult,div) end
				
				local RotCF=CFrame.Angles(0,0,0)
				
				if(rotinc == 'random')then
					RotCF=CFrame.Angles(math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)),math.rad(random:NextNumber(-180,180)))
				elseif(typeof(rotinc) == 'table')then
					RotCF=CFrame.Angles(unpack(rotinc))
				end
				
				if(PM and PM.MeshId == 'rbxassetid://20329976')then
					PM.Offset = Vector3.new(0,0,-PM.Scale.Z/8)
				end
				
				if(endpos and typeof(endpos) == 'CFrame')then
					P.CFrame=cframe:lerp(endpos,div)*RotCF
				elseif(acceleration and typeof(acceleration) == 'table' and acceleration.Force)then
					local force = acceleration.Force;
					if(typeof(force)=='CFrame')then
						force=force.p;
					end
					if(typeof(force)=='Vector3')then
						if(acceleration.LookAt)then
							P.CFrame=(CFrame.new(P.Position,force)+force)*RotCF
						else
							P.CFrame=(P.CFrame+force)*RotCF
						end
					end
				else
					P.CFrame=P.CFrame*RotCF
				end
				
				if(endcolor and typeof(endcolor) == 'Color3')then
					P.Color = color:lerp(endcolor,div)
				end
				swait()
			end
			P:destroy()
		elseif(system == 'Experimental' or system == 2)then
			local info = TweenInfo.new(lifetime,style,Enum.EasingDirection.InOut,0,false,0)
			local info2 = TweenInfo.new(lifetime,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut,0,false,0)
			if(style == Enum.EasingStyle.Elastic)then
				info = TweenInfo.new(lifetime*2,style,Enum.EasingDirection.Out,0,false,0)
			elseif(style == Enum.EasingStyle.Bounce)then
				info = TweenInfo.new(lifetime,style,Enum.EasingDirection.Out,0,false,0)
			end
			local tweenPart = game:service'TweenService':Create(P,info2,{
				CFrame=(typeof(endpos) == 'CFrame' and endpos or P.CFrame)*CFrame.Angles(unpack(endrot)),
				Color=typeof(endcolor) == 'Color3' and endcolor or color,
				Transparency=endTrans,
			})
			local off = Vector3.new(0,0,0)
			if(PM.MeshId == 'rbxassetid://20329976')then off=Vector3.new(0,0,(endsize*mult).Z/8) end
			
			local tweenMesh = game:service'TweenService':Create(PM,info,{
				Scale=endsize*mult,
				Offset=off,
			})
			tweenPart:Play()
			tweenMesh:Play()
		end
	end)()
end

function Effect(edata)
	GotEffect(edata)
end

function Trail(data)
	coroutine.wrap(function()
		data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
		data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
		local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
		data.EndPos=nil
		local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
		trailPart.Transparency=1
		local start = data.CFrame
		for i = 1, data.Frames do
			trailPart.CFrame = start:lerp(ep,i/data.Frames)
			data.CFrame = trailPart.CFrame
			Effect(data)
			swait()
		end	
	end)()
end

function ClientTrail(data)
	coroutine.wrap(function()
		data.Frames = typeof(data.Frames)=='number' and data.Frames or 60
		data.CFrame = typeof(data.CFrame)=='CFrame' and data.CFrame or Root.CFrame
		local ep = typeof(data.EndPos)=='CFrame' and data.EndPos or data.CFrame*CFrame.new(0,5,0);
		data.EndPos=nil
		local trailPart = Part(Effects,BrickColor.new'White',Enum.Material.SmoothPlastic,V3.N(.05,.05,.05),data.CFrame,true,false)
		trailPart.Transparency=1
		local start = data.CFrame
		for i = 1, data.Frames do
			trailPart.CFrame = start:lerp(ep,i/data.Frames)
			data.CFrame = trailPart.CFrame
			GotEffect(data)
			swait()
		end	
	end)()
end


if(Char:FindFirstChild('NGRWings'..Player.Name))then
	Char['NGRWings'..Player.Name]:destroy()
end

for _,v in next, Char:children() do
	if(v.Name:lower():find'wings')then 
		v:destroy()
	end
end

local wingModel = Instance.new("Model",Char)
wingModel.Name="NGRWings"..Player.Name
local rightWing = NewInstance("Model",wingModel,{Name='Right'})
local leftWing = NewInstance("Model",wingModel,{Name='Left'})

local MPASword = {}
for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
	if v:IsA("Accessory") and v.Name:find("MeshPartAccessory") then
		table.insert(MPASword,v)
	end
end



local LWP1 = WingPiece:Clone();
if MPASword[1] then
	for _,v in pairs(LWP1:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",LWP1.PrimaryPart)
	local atho = Instance.new("Attachment",LWP1.PrimaryPart)

	local HatChoice = MPASword[1]
	print(MPASword[1].Handle.Name)
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-2,0)
	atho.Rotation = Vector3.new(0,0,45)
	table.remove(MPASword,1)
end
LWP1.Parent = leftWing
local LWP2 = WingPiece:Clone();
if MPASword[1] then
	for _,v in pairs(LWP2:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",LWP2.PrimaryPart)
	local atho = Instance.new("Attachment",LWP2.PrimaryPart)

	local HatChoice = MPASword[1]
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-2,0)
	atho.Rotation = Vector3.new(0,0,45)
	table.remove(MPASword,1)
end
LWP2.Parent = leftWing
local LWP3 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("White Demon Trident") then --White Demon Trident
	for _,v in pairs(LWP3:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",LWP3.PrimaryPart)
	local atho = Instance.new("Attachment",LWP3.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("White Demon Trident") --White Demon Trident
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,-26)
end
LWP3.Parent = leftWing
local RWP1 = WingPiece:Clone();
if MPASword[1] then
	for _,v in pairs(RWP1:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP1.PrimaryPart)
	local atho = Instance.new("Attachment",RWP1.PrimaryPart)

	local HatChoice = MPASword[1]
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-2,0)
	atho.Rotation = Vector3.new(0,0,45)
	table.remove(MPASword,1)
end
RWP1.Parent = rightWing
local RWP2 = WingPiece:Clone();
if MPASword[1] then
	for _,v in pairs(RWP2:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP2.PrimaryPart)
	local atho = Instance.new("Attachment",RWP2.PrimaryPart)

	local HatChoice = MPASword[1]
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-2,0)
	atho.Rotation = Vector3.new(0,0,45)
	table.remove(MPASword,1)
end

RWP2.Parent = rightWing
local RWP3 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("Black Demon Trident") then --Black Demon Trident
	for _,v in pairs(RWP3:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP3.PrimaryPart)
	local atho = Instance.new("Attachment",RWP3.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("Black Demon Trident") --Black Demon Trident
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,-26) -- 48
end

RWP3.Parent = rightWing
local RWP4 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("swordhalo") then --swordhalo 
	for _,v in pairs(RWP4:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP4.PrimaryPart)
	local atho = Instance.new("Attachment",RWP4.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("swordhalo") --swordhalo 
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,0)
end


RWP4.Parent = rightWing

local RWP5 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("ShadowBladeMasterAccessory") then --Evil Aura
	for _,v in pairs(RWP5:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP5.PrimaryPart)
	local atho = Instance.new("Attachment",RWP5.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("ShadowBladeMasterAccessory") --Evil Aura
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,48)
end

RWP5.Parent = rightWing

local RWP6 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("BladeMasterAccessory") then --Northern Star
	for _,v in pairs(RWP6:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP6.PrimaryPart)
	local atho = Instance.new("Attachment",RWP6.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("BladeMasterAccessory") --Northern Star
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,48)
end

RWP6.Parent = rightWing

local RWP7 = WingPiece:Clone();
if game.Players.LocalPlayer.Character:FindFirstChild("Divine Aura") then -- Divine Aura
	for _,v in pairs(RWP7:GetChildren()) do
		if v:IsA("BasePart") then
			v.Transparency = 1
		end
	end
	local athp = Instance.new("Attachment",RWP7.PrimaryPart)
	local atho = Instance.new("Attachment",RWP7.PrimaryPart)

	local HatChoice = game.Players.LocalPlayer.Character:FindFirstChild("Divine Aura") --divine Aura
	HatChoice.Handle:FindFirstChildOfClass("AlignPosition").Attachment1 = athp
	HatChoice.Handle:FindFirstChildOfClass("AlignOrientation").Attachment1 = atho

	athp.Position = Vector3.new(0,-1.75,0)
	atho.Rotation = Vector3.new(0,0,48)
end
RWP7.Parent = rightWing
local LWP1W=Weld(LWP1.PrimaryPart,Torso,CF.N(2,-2,-1)*CF.A(0,0,0))
local LWP2W=Weld(LWP2.PrimaryPart,Torso,CF.N(4.25,-1,-1)*CF.A(0,0,M.R(15)))
local LWP3W=Weld(LWP3.PrimaryPart,Torso,CF.N(6.5,.5,-1)*CF.A(0,0,M.R(30)))
local RWP1W=Weld(RWP1.PrimaryPart,Torso,CF.N(-2,-2,-1)*CF.A(0,0,0))
local RWP2W=Weld(RWP2.PrimaryPart,Torso,CF.N(-4.25,-1,-1)*CF.A(0,0,M.R(-15)))
local RWP3W=Weld(RWP3.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
local RWP4W=Weld(RWP4.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
local RWP5W=Weld(RWP5.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
local RWP6W=Weld(RWP6.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))
local RWP7W=Weld(RWP7.PrimaryPart,Torso,CF.N(-6.5,.5,-1)*CF.A(0,0,M.R(-30)))

local bbg=Head:FindFirstChild'Nametag' or NewInstance("BillboardGui",Head,{
	Adornee=Head;
	Name='Nametag';
	Size=UDim2.new(4,0,1.2,0);
	StudsOffset=V3.N(-8,5.3,0);
})
local text=bbg:FindFirstChild'TextLabel' or NewInstance("TextLabel",bbg,{
	Size=UDim2.new(5,0,3.5,0);
	TextScaled=true;
	BackgroundTransparency=1;
	TextStrokeTransparency=0;
	Font=Enum.Font.Arcade;
	TextColor3=C3.N(1,1,1);
	Text='Sadness'
})

function getMode(modeName)
	for i,v in next, modeInfo do
		if(v.Name==modeName)then
			return v
		end
	end
	return modeInfo[1]
end

function IsVaporwave(song)
	for i = 1,#VaporwaveSongs do
		if(VaporwaveSongs[i]==song)then
			return true
		end
	end
	return false
end

local blush = NewInstance('Decal',Head,{Transparency=1,Texture='rbxassetid://0',Color3=(Player.UserId==5719877 and C3.N(.45,0,1) or C3.N(1,0,0))})

function changeMudo(modeName)
	local info = getMode(modeName)
	Mode=info.Name
	WalkSpeed=info.Walkspeed
	movement=info.moveVal
	music=makeMusic(info.Music or 0,info.Pitch or 1,info.TimePos or music and music.TimePosition or 0)
	WingAnim=info.WingAnim or 'NebG1'
	text.Text = info.Name
	text.TextColor3 = info.LeftWing[2]
	text.TextStrokeColor3 = info.StrokeColor
	text.Font=info.Font;
	if(Mode=='AURORA' or Mode=='The Doctor')then
		blush.Transparency=0
		blush.Texture='rbxassetid://0'
	else
		blush.Transparency=1
		blush.Texture='rbxassetid://0'
	end
	for _,v in next,leftWing:GetDescendants() do
		if(v:IsA'BasePart' and v.Name~='Main')then
			--v.Transparency=info.LeftWing[1]
			v.Color=info.LeftWing[2]
			v.Material=info.LeftWing[3]
		elseif(v:IsA'Trail')then
			--v.Transparency=NumberSequence.new(info.LeftWing[1],1)
			v.Color=ColorSequence.new(info.LeftWing[2])	
		end
	end
	
	for _,v in next,rightWing:GetDescendants() do
		if(v:IsA'BasePart' and v.Name~='Main')then
			--v.Transparency=info.RightWing[1]
			v.Color=info.RightWing[2]
			v.Material=info.RightWing[3]
		elseif(v:IsA'Trail')then
			--v.Transparency=NumberSequence.new(info.RightWing[1],1)
			v.Color=ColorSequence.new(info.RightWing[2])	
		end
	end
	
	PrimaryColor = info.PrimaryColor or info.LeftWing[2]
end

function changeMode(modeName)
	changeMudo(modeName)
end	

function syncStuff(data)
	local neut,legwelds,c0s,c1s,sine,mov,walk,inc,musicmode,tpos,pit,wingsin,visSett,mode,newhue=unpack(data)
	local head0,torso0,rleg0,rarm0,lleg0,larm0=unpack(c0s)
	local head1,torso1,rleg1,rarm1,lleg1,larm1=unpack(c1s)
	legAnims=legwelds
	NeutralAnims=neut
	if(not neut)then
		NK.C0=head0
		RJ.C0=torso0
		RH.C0=rleg0
		RS.C0=rarm0
		LH.C0=lleg0
		LS.C0=larm0
		
		NK.C1=head1
		RJ.C1=torso1
		RH.C1=rleg1
		RS.C1=rarm1
		LH.C1=lleg1
		LS.C1=larm1
	end
	if(Mode~=mode)then
		changeMudo(mode)
	end
	movement=mov
	walking=walk
	Change=inc
	print(MusicMode,musicmode)
	if(musicmode~=MusicMode and music)then
		MusicMode=musicmode
		if(MusicMode==1)then
			music:Pause()
			music.Volume=5
			music.Parent=Torso
			music:Resume()
		elseif(MusicMode==2)then
			music:Pause()
			music.Volume=5
			music.Parent=Char
			music:Resume()
		elseif(MusicMode==3)then
			music.Volume = 0
		end
	end
	if(Sine-sine>.8 or Sine-sine<-.8)then
		Sine=sine
	end
	if(hue-newhue>.8 or hue-newhue<-.8)then
		hue=newhue
	end
	if(WingSine-wingsin>.8 or WingSine-wingsin<-.8)then
		WingSine=wingsin
	end
	if(music and (music.TimePosition-tpos>.8 or music.TimePosition-tpos<-.8))then
		music.TimePosition=tpos
	end
	if(music and pit)then
		music.Pitch = pit
	end
	if(Mode=='TRIX-LUA' and music.SoundId~='rbxassetid://'..visSett.Music)then
		music.SoundId='rbxassetid://'..visSett.Music
	end
	getMode('TRIX-LUA').Music = visSett.Music
	getMode('TRIX-LUA').Pitch = visSett.Pitch
end


local footstepSounds = {
	[Enum.Material.Grass]=510933218;
	[Enum.Material.Metal]=1263161138;
	[Enum.Material.CorrodedMetal]=1263161138;
	[Enum.Material.DiamondPlate]=1263161138;
	[Enum.Material.Wood]=2452053757;
	[Enum.Material.WoodPlanks]=2452053757;
	[Enum.Material.Sand]=134456884;
	[Enum.Material.Snow]=2452051182;
}


function Vaporwaveify(s)
	local function wide(a)
		if a<'!' or a>'~' then return a end
		if a==' ' then return '  ' end 
		a = a:byte()+160
		if a<256 then return string.char(239,188,a-64) end
		return string.char(239,189,a-128)
	end
	return(s:gsub(".",wide))
end



function Choot(text)
	--if(game.PlaceId ~= 843468296)then
		coroutine.wrap(function()
			if(Char:FindFirstChild'ChatGUI')then Char.ChatGUI:destroy() end
			local BBG = NewInstance("BillboardGui",Char,{Name='ChatGUI',Size=UDim2.new(0,100,0,40),StudsOffset=V3.N(0,7,0),Adornee=Head})
			local Txt = NewInstance("TextLabel",BBG,{Text = "",BackgroundTransparency=1,TextColor3=PrimaryColor,BorderSizePixel=0,Font=Enum.Font.Antique,TextSize=50,TextStrokeTransparency=1,Size=UDim2.new(1,0,.5,0)})
			for i = 1, #text do
				--Txt.Text = Vaporwaveify(text:sub(1,i))
				Txt.TextColor3=(Mode=='TRIX-LUA' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				if(vaporwaveMode and Mode=='TRIX-LUA')then
					Txt.Text = Vaporwaveify(text:sub(1,i))
				else
					Txt.Text = text:sub(1,i)
				end
			end
			for i = 0, 60 do
				Txt.TextColor3=(Mode=='TRIX-LUA' and Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor)
				swait()
			end
			wait (1)
			for i = 0, 1, .025 do
				Txt.TextTransparency=i
				swait()
			end
			BBG:destroy()
		end)()
	--else
	--	Chat2(text)
	--end
end




function Chat(text)
	Choot(text)
end

function DealDamage(...)
	return true
end

function getRegion(point,range,ignore)
    return workspace:FindPartsInRegion3WithIgnoreList(R3.N(point-V3.N(1,1,1)*range/2,point+V3.N(1,1,1)*range/2),ignore,100)
end
function AOEDamage(where,range,options)
	local hit = {}
	for _,v in next, getRegion(where,range,{Char}) do
		if(v.Parent and v.Parent:FindFirstChildOfClass'Humanoid' and not hit[v.Parent:FindFirstChildOfClass'Humanoid'])then
			local callTable = {Who=v.Parent}
			hit[v.Parent:FindFirstChildOfClass'Humanoid'] = true
			for _,v in next, options do callTable[_] = v end
			DealDamage(callTable)
		end
	end
	return hit
end


function Click1()
	Attack=true
	NeutralAnims=false
	legAnims=false
	local orig = WalkSpeed
	WalkSpeed=4
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(-44.6),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.8,-1,-0.3)*CF.A(M.R(-17.4),M.R(44.4),M.R(7.1)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.4,-1,0)*CF.A(M.R(1.6),M.R(-13.1),M.R(7)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,-0.3)*CF.A(M.R(90),M.R(0),M.R(-44.6)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,-0.1)*CF.A(M.R(90),M.R(0),M.R(-44.6)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(44.6),M.R(0)),Alpha)
	end
	for i = 0, 1, 0.1 do
		swait()
		AOEDamage(RArm.CFrame.p,2,{
			DamageColor=(Mode=='TRIX-LUA' and C3.HSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1)) or PrimaryColor);
			MinimumDamage=5;
			MaximumDamage=15;
		})
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,-0.7)*CF.A(M.R(0),M.R(50.5),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.7,-0.6)*CF.A(M.R(-26),M.R(0),M.R(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.6,-1.1,-0.1)*CF.A(M.R(20.2),M.R(-47.6),M.R(15.2)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,0)*CF.A(M.R(0),M.R(0),M.R(-20.4)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(50.5)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(-50.5),M.R(0)),Alpha)
	end
	WalkSpeed=orig
	legAnims=true
	Attack=false
	NeutralAnims=true
end



function SwordSummon()
	Attack = true
	NeutralAnims = false
	local orig=WalkSpeed
	WalkSpeed=4
	legAnims=false
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3

		RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2,-0.1)*CF.A(M.R(-12.4),M.R(-15.7),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-0.7,-0.5)*CF.A(M.R(16.2),M.R(15.2),M.R(-0.8)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(M.R(-28.5),M.R(0),M.R(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.4,0.5,0)*CF.A(M.R(27.2),M.R(-3.8),M.R(-5)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.3,0.6,0)*CF.A(M.R(-33.8),M.R(-18.1),M.R(24.8)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(13.4),M.R(15.3),M.R(-3.6)),Alpha)
	end

	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(70.7),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(-14.4)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.6,-1,0)*CF.A(M.R(15.1),M.R(-63.2),M.R(13.5)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.6,-0.1)*CF.A(M.R(0),M.R(15.9),M.R(-25.4)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.3,-0.2)*CF.A(M.R(0),M.R(19.3),M.R(157.1)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(-70.7),M.R(0)),Alpha)
	end
	legAnims=true
	WalkSpeed=orig
	Attack = false
	NeutralAnims = true
end



function CrueltiesSmash()
	Attack=true
	NeutralAnims=false
	legAnims=true
	local orig = WalkSpeed
	WalkSpeed=16
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(19.1)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.3,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(-21.3)),Alpha)
        RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,-0,8)*CF.A(M.R(-90),M.R(0),M.R(0)),Alpha)
        RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,-0,8)*CF.A(M.R(-90),M.R(0),M.R(0)),Alpha)
        RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,-0,8)*CF.A(M.R(-90),M.R(0),M.R(0)),Alpha)
        RWP5W.C0 = RWP5W.C0:lerp(CF.N(-0,-0,8)*CF.A(M.R(-90),M.R(0),M.R(0)),Alpha)
        RWP6W.C0 = RWP6W.C0:lerp(CF.N(-0,-0,8)*CF.A(M.R(-90),M.R(0),M.R(0)),Alpha)
        LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,-0,8)*CF.A(M.R(-90),M.R(0),M.R(0)),Alpha)
        LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,-0,8)*CF.A(M.R(-90),M.R(0),M.R(0)),Alpha)
        LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,-0,8)*CF.A(M.R(-90),M.R(0),M.R(0)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
	end
	coroutine.wrap(function()
		for i = 0, 2 do
			swait(4)
		end
	end)()
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2,0.7)*CF.A(M.R(18.2),M.R(0),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.4)*CF.A(M.R(-33.4),M.R(0),M.R(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-0.9,-0.2)*CF.A(M.R(-6.7),M.R(0),M.R(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.4,0.4,0.1)*CF.A(M.R(90.7),M.R(-2.5),M.R(-50)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,0.2)*CF.A(M.R(89.5),M.R(2.6),M.R(50)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
	end
	WalkSpeed=orig
	legAnims=true
	Attack=false
	NeutralAnims=true
end



function EndofworldsSMASHDOWN()
	Attack=true
	NeutralAnims=false
	legAnims=true
	local orig = WalkSpeed
	WalkSpeed=16
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,0,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.3,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(19.1)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.3,0.5,-0.5)*CF.A(M.R(90),M.R(0),M.R(-21.3)),Alpha)
        RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        RWP5W.C0 = RWP5W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        RWP6W.C0 = RWP6W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
	end
	coroutine.wrap(function()
		for i = 0, 2 do
			swait(4)
		end
	end)()
	for i = 0, 1, 0.1 do
		swait()
		local Alpha = .3
		RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2,0.7)*CF.A(M.R(18.2),M.R(0),M.R(0)),Alpha)
		LH.C0 = LH.C0:lerp(CF.N(-0.5,-1.1,-0.4)*CF.A(M.R(-33.4),M.R(0),M.R(0)),Alpha)
		RH.C0 = RH.C0:lerp(CF.N(0.5,-0.9,-0.2)*CF.A(M.R(-6.7),M.R(0),M.R(0)),Alpha)
		LS.C0 = LS.C0:lerp(CF.N(-1.4,0.4,0.1)*CF.A(M.R(90.7),M.R(-2.5),M.R(-50)),Alpha)
		RS.C0 = RS.C0:lerp(CF.N(1.4,0.5,0.2)*CF.A(M.R(89.5),M.R(2.6),M.R(50)),Alpha)
		NK.C0 = NK.C0:lerp(CF.N(0,1.5,0)*CF.A(M.R(0),M.R(0),M.R(0)),Alpha)
        RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        RWP1W.C0 = RWP1W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        RWP5W.C0 = RWP5W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        RWP6W.C0 = RWP6W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
        LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0,-0,-8)*CF.A(M.R(120),M.R(0),M.R(0)),Alpha)
		
	end
	WalkSpeed=orig
	legAnims=true
	Attack=false
	NeutralAnims=true
end




function ClickCombo()
	ClickTimer=180
	if(Combo==1)then
		Click1()
		Combo=2
	elseif(Combo==2)then
		SwordSummon()
		Combo=1
	elseif(Combo==3)then
		Bombs()
		Combo=1
	end
end
	
function VaporTaunt()
local search = "just look up the word search to find the voicelines"
	if Mode == "TRIX-LUA" then Chat"Feel the music.."
	elseif Mode == "LOSS" then Chat"No..."
	elseif Mode == "Bruh" then Chat"LOL IM BETTER THAN THE OLD ME. IVE GROWN 2 SWORDS SINCE THEN!"
	elseif Mode == "CALAMITANIA" then Chat"Its Over for you..."
	elseif Mode == "ZEN-X" then Chat"You can run. but you cant hide..."
	elseif Mode == "ZORNO" then Chat"You cant hide CRANKTON. i will find u"
	elseif Mode == "FORCE" then Chat"I Am The Lightning..."
	elseif Mode == "HyPnOtIC" then Chat"HYPNOTISE!"
	elseif Mode == "AURORA" then Chat"You will be lucky if you survive..."
	elseif Mode == "The Doctor" then Chat"Well Well Well. Look what we have here..."
	elseif Mode == "ILLUMINATION" then Chat"Prepare for your demise."
	elseif Mode == "ULTRAVIOLET" then Chat"You will die. No need to run..."
	elseif Mode == "SYNCHRO" then Chat "FEEL MY WRATH..."
	elseif Mode == "br0k3n" then Chat "DYYEEE..."
	elseif Mode == "Galactic" then Chat "TO INFINITY!"
	elseif Mode == "INFINITE VOID" then Chat "you hear that. thats CRANKTON. hes hiding in the void"
	elseif Mode == "SPACETIME" then Chat "I control all of time and space"
	elseif Mode == "PARADOX" then Chat "You see. sometimes time itself can break..."
	elseif Mode == "lost" then Chat "help me..."
	elseif Mode == "GALACTIA" then Chat "You think your alone..."
	elseif Mode == "gh0st3d" then Chat "its not over yet"
	elseif Mode == "FREEZING" then Chat "S-SO COLD"
	elseif Mode == "PESTILENCE" then Chat "if u wont let me cure you... i will need to force it.."
	elseif Mode == "pls don't say it" then Chat "When the imposter is su- su.:"	    
	elseif Mode == "Omniversal" then Chat "To The Stars!"
	    
	    
	    
	    
	    
	    
	    
	    
end
end



UIS.InputBegan:connect(function(io,gpe)
	if(gpe or Attack or data.User~=data.Local)then return end
	--MODES
	if(io.KeyCode == Enum.KeyCode.One and Mode~='Sadness')then 
		changeMode'Sadness'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Two and Mode~='=_-Humane-_=')then 
		changeMode'=_-Humane-_='  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Three and Mode~='CALAMITANIA')then
		changeMode'CALAMITANIA' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.N and Mode~='SANS')then 
		changeMode'SANS'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.X and Mode~=(e2.Text))then 
		changeMode(e2.Text)  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.B and Mode~='no is some what you think...')then
		changeMode'no is some what you think...'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.P and Mode~='Interstellar')then 
		changeMode'Interstellar'  game.lighting.ClockTime = 0 game.Lighting.FogEnd = 9999
	elseif(io.KeyCode == Enum.KeyCode.G and Mode~='gh0st3d')then
		changeMode'gh0st3d' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Four and Mode~='GALACTIA')then
		changeMode'GALACTIA' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Five and Mode~='INFINITY')then
		changeMode'INFINITY'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Six and Mode~='UNBROKEN')then
		changeMode'UNBROKEN'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Seven and Mode~='TRIX-LUA')then
		changeMode'TRIX-LUA' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
elseif(io.KeyCode == Enum.KeyCode.F and Mode=='CALAMITANIA')then 
        CrueltiesSmash()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Eight and Mode~='Careless')then 
		changeMode'Careless'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Q and Mode~='Dark Energy')then
		changeMode'Dark Energy'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.K and Mode~='ZEN-X')then
		changeMode'ZEN-X' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
		elseif(io.KeyCode == Enum.KeyCode.J and Mode~='HEROIC')then 
		changeMode'HEROIC'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Y and Mode~='Pheonix')then 
		changeMode'Pheonix'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Z and Mode~='PRISM')then 
		changeMode'PRISM'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.L and Mode~='HyPnOtIC')then
		changeMode'HyPnOtIC' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Nine and Mode~='AURORA')then
		changeMode'AURORA' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='GALACTIA')then 
		changeMode'PURIFIED'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='PURIFIED')then 
		changeMode'ZORNO' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='CALAMITANIA')then 
		changeMode'INFINITE VOID' VaporTaunt()  game.lighting.ClockTime = 0 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.U and Mode~='Bruh')then
		changeMode'Bruh' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='gh0st3d')then 
		changeMode'FREEZING' VaporTaunt() game.lighting.ClockTime = 0 game.Lighting.FogEnd = 150
	elseif(io.KeyCode == Enum.KeyCode.Q and Mode=='Dark Energy')then 
		changeMode'Broken PR0GRam'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='PRISM')then
		changeMode'Omniversal' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='=_-Humane-_=')then 
		changeMode'=_-MADNESS-_='  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Pheonix')then 
		changeMode'Time'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='The Big Black')then 
		changeMode'REVENGE'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='LOSS')then 
		changeMode'Universal'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Universal')then 
		changeMode'Defected'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Time')then 
		changeMode'The Big Black'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='no is some what you think...')then 
		changeMode'pls dont say this' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='SPACETIME')then
		changeMode'TIMELESS'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='TIMELESS')then
		changeMode'LIGHTSPEED'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.C and Mode=='Dark Energy')then
		changeMode'Mayhem'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.V and Mode=='Dark Energy')then
		changeMode'N U C L E A R'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.R and Mode=='SYNCHRO')then
		changeMode'LOSS' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.E and Mode=='Dark Energy')then 
		changeMode'Calamified'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.E and Mode=='Calamified')then 
		changeMode'PESTILENCE' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.Q and Mode=='Calamified')then 
	EndofworldsSMASHDOWN()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.R and Mode=='Dark Energy')then 
		changeMode'SYNCHRO' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.R and Mode=='Broken PR0GRam')then 
		changeMode'SPINNER'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.R and Mode=='SANS')then 
		changeMode'LOVE'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='SANS')then 
		changeMode'The Sword Runner'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='UNBROKEN')then 
		changeMode'lost' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='ULTRAVIOLET')then 
		changeMode'BIT32' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.F and Mode=='SPACETIME')then 
		changeMode'FORCE' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='Careless')then 
		changeMode'DARKENED'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='INFINITY')then 
		changeMode'br0k3n' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.F and Mode=='UNBROKEN')then 
		changeMode'NEPTUNIAN V (UNEQUIPPED)'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.F and Mode=='NEPTUNIAN V')then 
		changeMode'NEPTUNIAN V (UNEQUIPPED)'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.F and Mode=='PARADOX')then 
		changeMode'Galactic' VaporTaunt()  game.lighting.ClockTime = 0 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.F and Mode=='GALACTIA')then 
		changeMode'SPACETIME' VaporTaunt()   game.lighting.ClockTime = 0 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.F and Mode=='NEPTUNIAN V (UNEQUIPPED)')then 
		changeMode'NEPTUNIAN V'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='TRIX-LUA')then 
		changeMode'OVERKILL'  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='FREEZING')then 
		changeMode'Inferno'  game.lighting.ClockTime = 0 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.F and Mode=='Dark Energy')then
		changeMode'ULTRAVIOLET' VaporTaunt()  game.lighting.ClockTime = 14 game.Lighting.FogEnd = 999999999999
	elseif(io.KeyCode == Enum.KeyCode.R and Mode=='CALAMITANIA')then
		changeMode'PARADOX' VaporTaunt()   game.lighting.ClockTime = 0 game.Lighting.FogEnd = 999999999999
		
			elseif(io.KeyCode == Enum.KeyCode.F and Mode=='SANS')then 
		changeMode'ULTRA SANS'

	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='AURORA')then
		changeMode'The Doctor' VaporTaunt()
	elseif(io.KeyCode == Enum.KeyCode.T and Mode=='The Doctor')then
		changeMode'ILLUMINATION' VaporTaunt()
	--TOGGLE MUSIC
	elseif(io.KeyCode == Enum.KeyCode.M and getMode(Mode))then 
		MusicMode=MusicMode+1
		if(MusicMode>3)then MusicMode=1 end
		if(MusicMode==1)then
			music:Pause()
			music.Volume=5
			music.Parent=Torso
			music:Resume()
		elseif(MusicMode==2)then
			music:Pause()
			music.Volume=5
			music.Parent=Char
			music:Resume()
		elseif(MusicMode==3)then
			music.Volume = 0
		end
	elseif(io.KeyCode==Enum.KeyCode.R)then
		--TAUNTS
		if(vaporwaveMode and Mode=='TRIX-LUA')then
			VaporTaunt()
		end
	end
	if(vaporwaveMode)then return end
	--ATTACKS
	if(io.UserInputType==Enum.UserInputType.MouseButton1)then
		ClickCombo()
	end
end)

WingAnims.StarG=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-8,2,-1)*CF.A(M.R(5+20*M.C(WingSine/32)),0,M.R(-35-9*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-10.60,1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+25*M.C(WingSine/32)),0,M.R(-40-9*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-12.20,.10,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-45-9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/232))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarGRE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(7,2.5,-3)*CF.A(M.R(10+3000*M.C(WingSine/92)),0,M.R(90)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(12.20,5,1)*CF.A(M.R(15-2000*M.C(WingSine/92)),0,M.R(45+9*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-12.20,5,-1)*CF.A(M.R(15+2000*M.C(WingSine/92)),0,M.R(-45-9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/232))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLO=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/179))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLF=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(10,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+25*M.C(WingSine/11))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(15.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+35*M.C(WingSine/11))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(20.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+50*M.C(WingSine/11))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-10,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/11))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-15.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-35*M.C(WingSine/11))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-20.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-50*M.C(WingSine/11))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),7,M.R(-30-800*M.C(WingSine/50))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarLFY=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-7)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+25*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-2)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+35*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(11.5,.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+500*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-7)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-2+.0*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-35*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-11.5,.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-500*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),7,M.R(-30-800*M.C(WingSine/50))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLFR=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-5,-1+1)*CF.A(M.R(5+100*M.C(WingSine/55)),0,M.R(0+50*M.C(WingSine/1))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-9,-1-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+5*M.C(WingSine/2))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(11.5,5,-1+1)*CF.A(M.R(15+200*M.C(WingSine/11)),0,M.R(30+50*M.C(WingSine/1))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-5,-1+1)*CF.A(M.R(5+100*M.C(WingSine/55)),0,M.R(0-50*M.C(WingSine/1))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-9,-1-1*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-5*M.C(WingSine/2))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-11.5,5,-1+1)*CF.A(M.R(15+200*M.C(WingSine/11)),0,M.R(-30-50*M.C(WingSine/1))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),7,M.R(-30-800*M.C(WingSine/50))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarL=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(20+30*M.C(WingSine/32)),0,M.R(-40-45*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(12,.5,-1)*CF.A(M.R(20+30*M.C(WingSine/32)),0,M.R(40+45*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLTI=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+30*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+60*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+90*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-30*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-60*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-90*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(20+300*M.C(WingSine/11)),0,M.R(-40-45*M.C(WingSine/11))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(12,.5,-1)*CF.A(M.R(20+300*M.C(WingSine/11)),0,M.R(40+45*M.C(WingSine/11))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end
WingAnims.StarLCR=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/22))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(3.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/22))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/22))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/22))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/22))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/22))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-5.5,.5,-1)*CF.A(M.R(20+30*M.C(WingSine/32)),0,M.R(-40-45*M.C(WingSine/22))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(5,.5,-1)*CF.A(M.R(20+30*M.C(WingSine/32)),0,M.R(40+45*M.C(WingSine/22))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLOS=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(7,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(13.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(19.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-7,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-13.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-19.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-25.5,.5,-1)*CF.A(M.R(20+30*M.C(WingSine/32)),0,M.R(-40-45*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(25,.5,-1)*CF.A(M.R(20+30*M.C(WingSine/32)),0,M.R(40+45*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end



WingAnims.StarLTE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(10*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-8*M.C(WingSine/34))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(15*M.C(WingSine/32),1.5-3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(120-2000*M.C(WingSine/322))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-10*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-60-2000*M.C(WingSine/322))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(8*M.C(WingSine/34))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-15*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-120+2000*M.C(WingSine/322))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLTTE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1*M.C(WingSine/32),3+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1*M.C(WingSine/32),-3+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1*M.C(WingSine/32),6+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(1*M.C(WingSine/32),9+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(1*M.C(WingSine/32),-6+0*M.C(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(1*M.C(WingSine/32),11+0*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarNET=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-5,-3)*CF.A(M.R(5+100*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-5)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+25*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,2,-5)*CF.A(M.R(15+200*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-5,-3)*CF.A(M.R(5+100*M.C(WingSine/32)),0,M.R(0-15*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-5+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-25*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-2)*CF.A(M.R(15+200*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,2,-5)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-0-200*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.Sonar1=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4*M.C(WingSine/52),3+3.25*M.S(WingSine/32),-5)*CF.A(0,2,M.R(260+425*M.C(WingSine/62))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(7*M.C(WingSine/52),3+2.28*M.C(WingSine/32),-5)*CF.A(0,2,M.R(390+465.5*M.C(WingSine/62))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9*M.C(WingSine/52),1+5*M.S(WingSine/32),-5)*CF.A(0,2,M.R(120+315*M.C(WingSine/62))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4*M.C(WingSine/52),4+2.15*M.C(WingSine/32),-1)*CF.A(0,2,M.R(-260+545*M.C(WingSine/62))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-7*M.C(WingSine/52),4+2.3*M.S(WingSine/32),-1)*CF.A(0,2,M.R(-390+434.5*M.C(WingSine/62))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9*M.C(WingSine/52),2+5*M.S(WingSine/32),-1)*CF.A(0,2,M.R(-120+475*M.C(WingSine/62))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/432))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLTR=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-5*M.C(WingSine/34))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-8*M.C(WingSine/34))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(6,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-11*M.C(WingSine/34))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(5*M.C(WingSine/34))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-2,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(8*M.C(WingSine/34))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6,-2,-1)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(11*M.C(WingSine/34))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0.5,600,-0)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLTRPLUS=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(7,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-0*M.C(WingSine/6400000))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-7,-2-2,-2-1*M.S(WingSine/35))*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(0*M.C(WingSine/6400000))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0.5,600,-0)*CF.A(M.R(0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.CERTUS3=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(6.2*M.C(WingSine/42),1.5+5*M.S(WingSine/42),-1)*CF.A(0.1,0,M.R(100+10*M.C(WingSine/22))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.2*M.C(WingSine/42),1.5+5*M.C(WingSine/42),-1)*CF.A(0.1,0,M.R(90+10*M.C(WingSine/22))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(8.2*M.C(WingSine/32),1.5-5*M.S(WingSine/42),2)*CF.A(0.1,0,M.R(190+200*M.C(WingSine/78))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6.2*M.C(WingSine/42),1.5-5*M.C(WingSine/42),-1)*CF.A(0.1,0,M.R(-100-10*M.C(WingSine/22))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.2*M.C(WingSine/42),1.5+5*M.S(WingSine/42),-1)*CF.A(0.1,0,M.R(-90-10*M.C(WingSine/22))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-8.2*M.C(WingSine/32),1.5+5*M.S(WingSine/42),2)*CF.A(0.1,0,M.R(-190-200*M.C(WingSine/78))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarLEX=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,2)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,0)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+0*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-2)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0+360*M.C(WingSine/130))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-2)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(0-0*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,2)*CF.A(M.R(0+5*M.C(WingSine/32)),0,M.R(-0-360*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/323))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarGLITCH=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(6,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/.7)),0,M.R(0+15*M.C(WingSine/1))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(13,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/.5)),0,M.R(10+25*M.C(WingSine/2))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(19,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/.7)),0,M.R(30+30*M.C(WingSine/1))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/.7)),0,M.R(0-15*M.C(WingSine/1))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-13,-1,-1+.05*M.S(WingSine/.5))*CF.A(M.R(10+15*M.C(WingSine/2)),0,M.R(-10-25*M.C(WingSine/5))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-19,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/.7)),0,M.R(-30-30*M.C(WingSine/1))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/120))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarGLITCHV2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+15*M.C(WingSine/4))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-2,-2)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+23*M.C(WingSine/5))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-4)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+54*M.C(WingSine/4))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-25*M.C(WingSine/4))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-2,-2+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-34*M.C(WingSine/5))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-4)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-70*M.C(WingSine/4))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/120))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarLK=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+500*M.C(WingSine/15))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6.50,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(10+500*M.C(WingSine/15))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+500*M.C(WingSine/15))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-3,-2,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-500*M.C(WingSine/15))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-10-500*M.C(WingSine/15))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-500*M.C(WingSine/15))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLE=function()

	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-5,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+70.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.5,2,-1)*CF.A(M.R(15+400*M.C(WingSine/6)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-5,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-70.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.5,2,-1)*CF.A(M.R(15+400*M.C(WingSine/6)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLEG=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-10)*CF.A(M.R(5+203*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-10)*CF.A(M.R(10+15*M.C(WingSine/32)),-0,M.R(15+1505*M.C(WingSine/36))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.5,.5,-1)*CF.A(M.R(15+4000*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-10)*CF.A(M.R(5+203*M.C(WingSine/32)),-0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-10+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),-0,M.R(-15-1505*M.C(WingSine/36))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(15+4000*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLEP=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-5,-1)*CF.A(M.R(5+550*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-9,-1)*CF.A(M.R(10+350*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.5,2,-1)*CF.A(M.R(15+4000*M.C(WingSine/44)),0,M.R(30+9*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-5,-1)*CF.A(M.R(5+550*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-9,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+350*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.5,2,-1)*CF.A(M.R(15+4000*M.C(WingSine/44)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLED=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-10,-0)*CF.A(M.R(300+10*M.C(WingSine/32)),0,M.R(0+50*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-9,-0)*CF.A(M.R(290+15*M.C(WingSine/32)),0,M.R(15+70.5*M.C(WingSine/11))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.5,.5,-1)*CF.A(M.R(280+0*M.C(WingSine/32)),0,M.R(30+90*M.C(WingSine/32))),.2)

	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-10,-0)*CF.A(M.R(300+10*M.C(WingSine/32)),0,M.R(0-50*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-9,-0+.05*M.S(WingSine/35))*CF.A(M.R(290+15*M.C(WingSine/32)),0,M.R(-15-70.5*M.C(WingSine/11))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.5,.5,-1)*CF.A(M.R(280+0*M.C(WingSine/32)),0,M.R(-30-90*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarA=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-4,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5.50,-6,-1)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-4,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5.50,-6,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarABS=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(2,-4,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0+50*M.C(WingSine/22))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5.50,-6,-1)*CF.A(M.R(10+360*M.C(WingSine/42)),0,M.R(15+15*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-2,-4,-1)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(0-50*M.C(WingSine/22))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5.50,-6,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+360*M.C(WingSine/42)),0,M.R(-15-15*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarEmpty=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-60.5,-500,-100*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(0,0,M.R(0+0*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(0,0,M.R(0+0*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(0,0,M.R(0+0*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(0,0,M.R(0+0*M.C(WingSine/402))),.2)	
end

WingAnims.StarEL=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-1*M.C(WingSine/32),1.5-8*M.C(WingSine/21),-5)*CF.A(0,8,M.R(-150-0*M.C(WingSine/250))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-2*M.C(WingSine/32),1.5-8*M.C(WingSine/21),-4)*CF.A(0,-8,M.R(-180-0*M.C(WingSine/250))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-3*M.C(WingSine/32),1.5-8*M.C(WingSine/21),-7)*CF.A(0,8,M.R(-210-0*M.C(WingSine/250))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(1*M.C(WingSine/32),-1.5+8*M.C(WingSine/21),-5)*CF.A(-0,-8,M.R(150-0*M.C(WingSine/250))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(2*M.C(WingSine/32),-1.5+8*M.C(WingSine/21),-4)*CF.A(-0,8,M.R(180-0*M.C(WingSine/250))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(3*M.C(WingSine/32),-1.5+8*M.C(WingSine/21),-7)*CF.A(-0,-8,M.R(210-0*M.C(WingSine/250))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/21)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/21),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/21),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/21),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

 --special wing anim --	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0.5,-1)*CF.A(0,M.R(90+0*M.C(WingSine/39)),M.R(-0-2000*M.R(WingSine/99999))),.2)
 --     RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,0,-3)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2) INSANE WING ANIM
  --  RWP4W.C0 = RWP4W.C0:lerp(CF.N(-5,0,-0)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2) another special

WingAnims.StarB=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/12)),0,M.R(15+3.5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.50,-4,-2)*CF.A(M.R(10+15*M.C(WingSine/12)),0,M.R(15+3.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/12)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-6,-3)*CF.A(M.R(10+15*M.C(WingSine/12)),0,M.R(0-3.5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.50,-4,-2)*CF.A(M.R(10+15*M.C(WingSine/12)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/12)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarBS=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(15+3.5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.50,-4,-2)*CF.A(M.R(10+15*M.C(WingSine/1)),0,M.R(15+3.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(30+9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-6,-3)*CF.A(M.R(10+15*M.C(WingSine/1)),0,M.R(0-3.5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.50,-4,-2)*CF.A(M.R(10+15*M.C(WingSine/1)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarEF=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0.0,5,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0+200*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0.40,0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-30+1000*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0.0,15,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0+100*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0.40,-0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(30-1000*M.C(WingSine/320))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0.0,-0,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-200*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0.0,10,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-100*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end
WingAnims.StarEFTR=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0.0,10,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0,15,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0.0,20,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,-0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(0-0*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0.0,5,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0.0,10,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0.40,0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(30-10*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(-0.40,0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-30+10*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarABC=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6.0,5,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0+2000*M.C(WingSine/100))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-3.40,0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-30+1000*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6.0,15,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0+1000*M.C(WingSine/100))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(6.40,-0,-0)*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(30-1000*M.C(WingSine/320))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(3.0,-0,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-2000*M.C(WingSine/100))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(6.0,10,-0+.0*M.S(WingSine/35))*CF.A(M.R(0+0*M.C(WingSine/32)),0,M.R(-0-1000*M.C(WingSine/100))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarEFE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-0.0,5,-1+.0*M.S(WingSine/35))*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-500,0.20,-100)*CF.A(M.R(90+0*M.C(WingSine/32)),0,M.R(-30+10*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-0.0,15,-1+.0*M.S(WingSine/35))*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-500.40,-0,-100)*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(30-10*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0.0,-0.20,-1+.0*M.S(WingSine/35))*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-0.0,10,-1+.0*M.S(WingSine/35))*CF.A(M.R(-90+0*M.C(WingSine/32)),0,M.R(-0-0*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end



WingAnims.StarT=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,-2,-1)*CF.A(M.R(5+2*M.C(WingSine/32)),0,M.R(0+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.50,-1,-1)*CF.A(M.R(10+2*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(12.10,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(30+800*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4,-2,-1)*CF.A(M.R(5+2*M.C(WingSine/32)),0,M.R(0-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.50,-1,-1+.05*M.S(WingSine/35))*CF.A(M.R(10+2*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-12.10,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-800*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLTT=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-150-2000*M.C(WingSine/322))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-180-2000*M.C(WingSine/322))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-210-2000*M.C(WingSine/322))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-60-2000*M.C(WingSine/322))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-90-2000*M.C(WingSine/322))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(100,0,M.R(-120-2000*M.C(WingSine/322))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,.5,-2)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-30-900*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.CERTUS1=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(7.15*M.C(WingSine/32),1.5+3*M.S(WingSine/11),-1)*CF.A(0.1,0,M.R(160+500*M.C(WingSine/22))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5.1*M.C(WingSine/32),1.5+2*M.C(WingSine/11),-1)*CF.A(0.2,0,M.R(290+20*M.C(WingSine/22))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(3.25*M.C(WingSine/32),1.5+1*M.S(WingSine/11),-1)*CF.A(0.1,0,M.R(120+500*M.C(WingSine/22))),.2)

	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6.15*M.C(WingSine/32),1.5+3*M.C(WingSine/11),-1)*CF.A(0.1,0,M.R(-160-500*M.C(WingSine/22))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-4.1*M.C(WingSine/32),1.5+2*M.S(WingSine/11),-1)*CF.A(0.2,0,M.R(-290-20*M.C(WingSine/22))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1.25*M.C(WingSine/32),1.5+1*M.S(WingSine/11),-1)*CF.A(0.1,0,M.R(-120-500*M.C(WingSine/22))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.CERTUS2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1.15*M.C(WingSine/32),0+2.2*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-120+500*M.C(WingSine/52))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1.1*M.C(WingSine/32),0+1.2*M.C(WingSine/32),-0)*CF.A(0,0,M.R(-150+200.5*M.C(WingSine/22))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1.25*M.C(WingSine/32),0+2.2*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-180-500*M.C(WingSine/52))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1.15*M.C(WingSine/32),0-2.2*M.C(WingSine/32),-1)*CF.A(0,0,M.R(120-500*M.C(WingSine/52))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1.1*M.C(WingSine/32),-0+1.2*M.S(WingSine/32),-0)*CF.A(0,0,M.R(150-200.5*M.C(WingSine/22))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1.25*M.C(WingSine/32),0+2.2*M.S(WingSine/32),-1)*CF.A(0,0,M.R(180+500*M.C(WingSine/52))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.SONUS1=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-150-3200*M.C(WingSine/320))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-12*M.C(WingSine/32),2.5-3*M.C(WingSine/32),-2)*CF.A(0,1,M.R(-180-3200*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-210-3200*M.C(WingSine/320))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-60-3200*M.C(WingSine/320))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-12*M.C(WingSine/32),2.5-3*M.C(WingSine/32),-2)*CF.A(0,1,M.R(-90-3200*M.C(WingSine/320))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,-5,M.R(-120-3200*M.C(WingSine/320))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS1P=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-150-3200*M.C(WingSine/320))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-7*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-2)*CF.A(0,2,M.R(-180-3200*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-9*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-3)*CF.A(0,3,M.R(-210-3200*M.C(WingSine/320))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-60-3200*M.C(WingSine/320))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-7*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-2)*CF.A(0,2,M.R(-90-3200*M.C(WingSine/320))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-3)*CF.A(0,-3,M.R(-120-3200*M.C(WingSine/320))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS5=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-4*M.C(WingSine/25),-3)*CF.A(-1,3,M.R(-150-3200*M.C(WingSine/243))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0*M.C(WingSine/32),1.5-5*M.C(WingSine/25),-3)*CF.A(-1,3,M.R(-180-3200*M.C(WingSine/266))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-4*M.C(WingSine/25),-3)*CF.A(-1,3,M.R(-210-3200*M.C(WingSine/243))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-4*M.C(WingSine/25),-3)*CF.A(-1,3,M.R(-60-3200*M.C(WingSine/243))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0*M.C(WingSine/32),1.5-5*M.C(WingSine/25),-3)*CF.A(-1,3,M.R(-90-3200*M.C(WingSine/266))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-4*M.C(WingSine/25),-3)*CF.A(-1,-15,M.R(-120-3200*M.C(WingSine/243))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end
WingAnims.SONUS5Timed=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-4*M.C(WingSine/59),-3)*CF.A(-1,3,M.R(-150-3200*M.C(WingSine/5000))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-0*M.C(WingSine/32),1.5-5*M.C(WingSine/48),-3)*CF.A(-1,3,M.R(-180-3200*M.C(WingSine/1000))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-4*M.C(WingSine/25),-3)*CF.A(-1,3,M.R(-210-3200*M.C(WingSine/4000))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-4*M.C(WingSine/100),-3)*CF.A(-1,3,M.R(-60-3200*M.C(WingSine/1000))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0*M.C(WingSine/32),1.5-5*M.C(WingSine/56),-3)*CF.A(-1,3,M.R(-90-3200*M.C(WingSine/5000))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-4*M.C(WingSine/23),-3)*CF.A(-1,-15,M.R(-120-3200*M.C(WingSine/4000))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/54)),0,M.R(-100-2*M.C(WingSine/400))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/73),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/23),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/500))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/92),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,1,M.R(-150-3200*M.C(WingSine/320))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,2,M.R(-180-3200*M.C(WingSine/320))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,3,M.R(-210-3200*M.C(WingSine/320))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,4,M.R(-60-3200*M.C(WingSine/320))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,5,M.R(-90-3200*M.C(WingSine/320))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,-6,M.R(-120-3200*M.C(WingSine/320))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS3=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-150-3200*M.C(WingSine/290))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-3*M.C(WingSine/32),1.5-3*M.C(WingSine/32),0)*CF.A(0,1,M.R(-180-1200*M.C(WingSine/290))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-7)*CF.A(0,1,M.R(-210-3200*M.C(WingSine/290))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-60-3200*M.C(WingSine/290))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-3*M.C(WingSine/32),1.5-3*M.C(WingSine/32),0)*CF.A(0,1,M.R(-90-1200*M.C(WingSine/290))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-6*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-7)*CF.A(0,1,M.R(-120-3200*M.C(WingSine/290))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.SONUS4=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-9*M.C(WingSine/32),1.5-9*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-150-32000*M.C(WingSine/2990))),.1)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-8*M.C(WingSine/32),1.5-6*M.C(WingSine/32),-15)*CF.A(0,1,M.R(-180-32000*M.C(WingSine/2990))),1)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-9*M.C(WingSine/32),1.5-9*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-210-32000*M.C(WingSine/2990))),.1)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-9*M.C(WingSine/32),1.5-9*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-60-32000*M.C(WingSine/2990))),.1)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-9*M.C(WingSine/32),1.5-6*M.C(WingSine/32),-15)*CF.A(0,1,M.R(-90-32000*M.C(WingSine/2990))),1)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9*M.C(WingSine/32),1.5-9*M.C(WingSine/32),-10)*CF.A(0,1,M.R(-120-32000*M.C(WingSine/2990))),.1)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-3)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.StarTE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(1*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+2000*M.C(WingSine/322))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(5*M.C(WingSine/32),1.5+3*M.C(WingSine/32),-1)*CF.A(0,0,M.R(90+2000*M.C(WingSine/322))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(1*M.C(WingSine/32),1.5-3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(120-2000*M.C(WingSine/322))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-1*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-60-2000*M.C(WingSine/322))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-5*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-90-2000*M.C(WingSine/322))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-1*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-120+2000*M.C(WingSine/322))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.StarLP=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/32)),0,M.R(-30-9*M.C(WingSine/32))),.2)
    RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,.50,-0)*CF.A(M.R(-0+0*M.C(WingSine/200000000000000000000000000999999999999999999000000999900000099999999)),0,M.R(0)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.Aprins=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(60+5000*M.C(WingSine/400))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(90+5000*M.C(WingSine/400))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(120+5000*M.C(WingSine/400))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(-60+5000*M.C(WingSine/400))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(-90+5000*M.C(WingSine/400))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+5000*M.C(WingSine/400))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG1=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.20,1.25,-1)*CF.A(M.R(5+15*M.C(WingSine/32)),0,M.R(60)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(2,1.5,-1.5)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,1.25,-1)*CF.A(M.R(15+30*M.C(WingSine/32)),0,M.R(120)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.20,1.25,-1)*CF.A(M.R(5+15*M.C(WingSine/32)),0,M.R(-60)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-2,1.5,-1.5)*CF.A(M.R(10+15*M.C(WingSine/32)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,1.25,-1)*CF.A(M.R(15+30*M.C(WingSine/32)),0,M.R(-120)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.INSANEGREG=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(7.15,1.5,-8)*CF.A(M.R(5+500*M.C(WingSine/42)),0,M.R(67)),.7)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(1.1,2.5,-3)*CF.A(M.R(10+500*M.C(WingSine/42)),0,M.R(46)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(7.25,1.5,-8)*CF.A(M.R(15+200*M.C(WingSine/22)),0,M.R(135)),.7)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-7.15,1.5,-8)*CF.A(M.R(5+500*M.C(WingSine/42)),0,M.R(-67)),.7)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-1.1,2.5,-3)*CF.A(M.R(10+500*M.C(WingSine/42)),0,M.R(-46)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-7.25,1.5,-8)*CF.A(M.R(15+200*M.C(WingSine/22)),0,M.R(-135)),.7)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.INSANEGREG2=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.67,10.15,-1)*CF.A(M.R(5+1000*M.C(WingSine/38)),10,M.R(676)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,10.5,-1)*CF.A(M.R(10+1555*M.C(WingSine/38)),10,M.R(107)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,10.45,-1)*CF.A(M.R(15+2000*M.C(WingSine/38)),10,M.R(307)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,10.15,-1)*CF.A(M.R(5-1000*M.C(WingSine/38)),10,M.R(-647)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,10.75,-1)*CF.A(M.R(10-1555*M.C(WingSine/38)),10,M.R(-917)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,10.55,-1)*CF.A(M.R(15-2000*M.C(WingSine/38)),10,M.R(-177)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.INSANEGREG2F=function()

	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.67,10.15,-1)*CF.A(M.R(5+1000*M.C(WingSine/38)),10,M.R(676)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,10.5,-1)*CF.A(M.R(10+1555*M.C(WingSine/38)),10,M.R(107)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,10.45,-1)*CF.A(M.R(15+2000*M.C(WingSine/38)),10,M.R(307)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,10.15,-1)*CF.A(M.R(5-1000*M.C(WingSine/38)),10,M.R(-647)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,10.75,-1)*CF.A(M.R(10-1555*M.C(WingSine/38)),10,M.R(-917)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,10.55,-1)*CF.A(M.R(15-2000*M.C(WingSine/38)),10,M.R(-177)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.MANGY=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4.15,1.5,-5)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(60)),.7)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.25,1.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(120)),.7)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4.15,1.5,-5)*CF.A(M.R(5+10*M.C(WingSine/32)),0,M.R(-60)),.7)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.25,1.5,-5)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-120)),.7)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.MANGYRT=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4.15,1.5,-5)*CF.A(M.R(5+50*M.C(WingSine/32)),0,M.R(60)),.7)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(7,2.5,-3)*CF.A(M.R(10+300*M.C(WingSine/32)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.25,1.5,-5)*CF.A(M.R(15+50*M.C(WingSine/32)),0,M.R(120)),.7)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4.15,1.5,-5)*CF.A(M.R(5+50*M.C(WingSine/32)),0,M.R(-60)),.7)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-7,2.5,-3)*CF.A(M.R(10+300*M.C(WingSine/32)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.25,1.5,-5)*CF.A(M.R(15+50*M.C(WingSine/32)),0,M.R(-120)),.7)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.MANGYR=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,2.5,-3)*CF.A(M.R(10+30*M.C(WingSine/32)),0,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP5W.C0 = RWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP6W.C0 = RWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
	RWP7W.C0 = RWP1W.C0:lerp(CF.N(-60.5,-500,-100)*CF.A(M.R(15+0*M.C(WingSine/1)),0,M.R(-30-9*M.C(WingSine/32))),.2)
end

WingAnims.MANGYT=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4.15,1.5,-5)*CF.A(M.R(50+15555*M.C(WingSine/1400)),0,M.R(10)),.7)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,2.5,-3)*CF.A(M.R(10+300*M.C(WingSine/23)),0,M.R(60)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4.25,1.5,-5)*CF.A(M.R(50+15*M.C(WingSine/23)),0,M.R(0)),.7)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-4.15,1.5,-5)*CF.A(M.R(50+15555*M.C(WingSine/1400)),0,M.R(-10)),.7)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,2.5,-3)*CF.A(M.R(10+300*M.C(WingSine/23)),0,M.R(-60)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-4.25,1.5,-5)*CF.A(M.R(50+15*M.C(WingSine/23)),0,M.R(-0)),.7)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.TSI=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15*M.C(WingSine/32),1.5+3*M.S(WingSine/32),-1)*CF.A(0,0,M.R(60+5*M.C(WingSine/32))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(8.25,-1,-0)*CF.A(M.R(290+15*M.C(WingSine/32)),0,M.R(15+7.5*M.C(WingSine/32))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(30+30*M.C(WingSine/32))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15*M.C(WingSine/32),1.5-3*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-60-5*M.C(WingSine/32))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-8.25,-1,-0+.05*M.S(WingSine/35))*CF.A(M.R(290+15*M.C(WingSine/32)),0,M.R(-15-7.5*M.C(WingSine/32))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-9.5,.5,-1)*CF.A(M.R(15+20*M.C(WingSine/32)),0,M.R(-30-30*M.C(WingSine/32))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(-6.5,.5,-1)*CF.A(M.R(15+2*M.C(WingSine/32)),0,M.R(-100-2*M.C(WingSine/192))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.Sonar2=function()
    LWP1W.C0 = LWP1W.C0:lerp(CF.N(4,5,-0)*CF.A(M.R(10+80000*M.C(WingSine/2000)),0,M.R(-0)),.2)
    LWP2W.C0 = LWP2W.C0:lerp(CF.N(5,5,-0)*CF.A(M.R(10+70000*M.C(WingSine/2000)),0,M.R(-0)),.2)
    LWP3W.C0 = LWP3W.C0:lerp(CF.N(6,5,-0)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2)
	
    RWP1W.C0 = RWP1W.C0:lerp(CF.N(-5,5,-0)*CF.A(M.R(20+80000*M.C(WingSine/2000)),0,M.R(-0)),.2)
    RWP2W.C0 = RWP2W.C0:lerp(CF.N(-6,5,-0)*CF.A(M.R(20+70000*M.C(WingSine/2000)),0,M.R(-0)),.2)
    RWP3W.C0 = RWP3W.C0:lerp(CF.N(-7,5,-0)*CF.A(M.R(20+90000*M.C(WingSine/2000)),0,M.R(-0)),.2)
    RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,0,-3)*CF.A(M.R(-0+90000*M.C(WingSine/200000000000000000000000000999999999999999999000000999900000099999999)),0,M.R(-0)),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

 --special wing anim --	RWP4W.C0 = RWP4W.C0:lerp(CF.N(0,0.5,-1)*CF.A(0,M.R(90+0*M.C(WingSine/39)),M.R(-0-2000*M.R(WingSine/99999))),.2)
 --     RWP4W.C0 = RWP4W.C0:lerp(CF.N(-0,0,-3)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2) INSANE WING ANIM
  --  RWP4W.C0 = RWP4W.C0:lerp(CF.N(-5,0,-0)*CF.A(M.R(10+90000*M.C(WingSine/2000)),0,M.R(-0)),.2) another special
WingAnims.NebG2=function(div)
	div=div or 25
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+2000*M.R(WingSine/div))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-2000*M.R(WingSine/div))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG3=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NEBGNEPTUNAINV=function(mult)
	mult=mult or 150
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-210-950*M.C(WingSine/mult))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-240-650*M.C(WingSine/mult))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-300-950*M.C(WingSine/mult))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-160-950*M.C(WingSine/mult))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-0.70,2.50,-1.20+0*M.S(WingSine/35))*CF.A(M.R(-60-0*M.C(WingSine/32)),0,M.R(-70-0*M.C(WingSine/6400000))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-270-950*M.C(WingSine/mult))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+1*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NEBGNEPTUNAINVU=function(mult)
	mult=mult or 150
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-210-950*M.C(WingSine/mult))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-240-650*M.C(WingSine/mult))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-300-950*M.C(WingSine/mult))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-160-950*M.C(WingSine/mult))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-290-640*M.C(WingSine/mult))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(4*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-270-950*M.C(WingSine/mult))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+1*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.Neb=function(mult)
	mult=mult or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/360)),M.R(0+WingSine*mult)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/320)),M.R(135+WingSine*mult)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/390)),M.R(225+WingSine*mult)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+2.5*M.C(WingSine/500)),M.R(0-WingSine*mult)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+7.5*M.C(WingSine/500)),M.R(135-WingSine*mult)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,-1.5)*CF.A(0,M.R(0+5*M.C(WingSine/500)),M.R(225-WingSine*mult)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG4=function(div)
	div=div or 1
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+2000*M.R(WingSine/div))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120+2000*M.R(WingSine/div))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120+2000*M.R(WingSine/div))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-2000*M.R(WingSine/div))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(120-2000*M.R(WingSine/div))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,4.5,-1)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(-120-2000*M.R(WingSine/div))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG5=function(mult)
	mult=mult or 300
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(3*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-210-700*M.C(WingSine/mult))),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(6*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-2)*CF.A(0,0,M.R(-240-700*M.C(WingSine/mult))),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(9*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-300-700*M.C(WingSine/mult))),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(3*M.C(WingSine/32),-2.5+6*M.C(WingSine/32),-1)*CF.A(0,0,M.R(-160-700*M.C(WingSine/mult))),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(6*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-2)*CF.A(0,0,M.R(-190-700*M.C(WingSine/mult))),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(9*M.C(WingSine/32),-2.5+6*M.S(WingSine/32),-1)*CF.A(0,0,M.R(-270-700*M.C(WingSine/mult))),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG6=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,12,-1)*CF.A(M.R(122+100*M.C(WingSine/322)),-180,M.R(60)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,10,-1)*CF.A(M.R(122+100*M.C(WingSine/342)),-180,M.R(90)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,8,-1)*CF.A(M.R(122+100*M.C(WingSine/320)),-180,M.R(120)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,12,-1)*CF.A(M.R(122+100*M.C(WingSine/322)),180,M.R(-60)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,10,-1)*CF.A(M.R(122+100*M.C(WingSine/342)),180,M.R(-90)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,8,-1)*CF.A(M.R(122+100*M.C(WingSine/320)),180,M.R(-120)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG6INSANE=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(.15,12,-1)*CF.A(M.R(122+500*M.C(WingSine/200)),-180,M.R(61)),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(.1,14,-1)*CF.A(M.R(122+500*M.C(WingSine/200)),-180,M.R(91)),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(.25,8,-1)*CF.A(M.R(122+500*M.C(WingSine/200)),-180,M.R(121)),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.15,12,-1)*CF.A(M.R(122+500*M.C(WingSine/200)),180,M.R(-61)),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.1,14,-1)*CF.A(M.R(122+500*M.C(WingSine/200)),180,M.R(-91)),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.25,8,-1)*CF.A(M.R(122+500*M.C(WingSine/200)),180,M.R(-121)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

WingAnims.NebG7=function()
        mult=mult or 28
        LWP1W.C0 = LWP1W.C0:lerp(CF.N(.12,1,-4)*CF.A(M.R(9+254*M.C(WingSine/19)),155,M.R(36)),.2)
    LWP2W.C0 = LWP2W.C0:lerp(CF.N(.4,-5,-2)*CF.A(M.R(10+274*M.C(WingSine/19)),155,M.R(91)),.2)
    LWP3W.C0 = LWP3W.C0:lerp(CF.N(.29,3,-3)*CF.A(M.R(45+254*M.C(WingSine/19)),155,M.R(120)),.2)
    
    RWP1W.C0 = RWP1W.C0:lerp(CF.N(-.12,1,-4)*CF.A(M.R(8+254*M.C(WingSine/19)),44,M.R(-36)),.2)
    RWP2W.C0 = RWP2W.C0:lerp(CF.N(-.4,5,-2)*CF.A(M.R(10+274*M.C(WingSine/19)),44,M.R(-91)),.2)
    RWP3W.C0 = RWP3W.C0:lerp(CF.N(-.29,3,-3)*CF.A(M.R(25+254*M.C(WingSine/19)),44,M.R(-120)),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end


WingAnims.extraFrench=function()
	LWP1W.C0 = LWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	LWP2W.C0 = LWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	LWP3W.C0 = LWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225+WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	
	RWP1W.C0 = RWP1W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+2.5*M.C(WingSine/36)),M.R(0-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	RWP2W.C0 = RWP2W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+7.5*M.C(WingSine/32)),M.R(135-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	RWP3W.C0 = RWP3W.C0:lerp(CF.N(0,1.5,0)*CF.A(0,M.R(0+5*M.C(WingSine/39)),M.R(225-WingSine))*CF.A(0,M.R(90),0)*CF.N(-2,0,0),.2)
	RWP4W.C0 = RWP4W.C0:lerp(CF.N(6*M.C(WingSine/62),-3+3*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-30-950*M.C(WingSine/202))),.2)
	RWP5W.C0 = RWP5W.C0:lerp(CF.N(0*M.C(WingSine/62),-1.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0-950*M.C(WingSine/402))),.2)
	RWP6W.C0 = RWP6W.C0:lerp(CF.N(0*M.C(WingSine/32),-5.64+0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+1950*M.C(WingSine/822))),.2)
	RWP7W.C0 = RWP7W.C0:lerp(CF.N(0*M.C(WingSine/62),-3.64-0*M.S(WingSine/42),-2)*CF.A(0,0,M.R(-0+950*M.C(WingSine/402))),.2)	
end

if(data.User==data.Local)then
	Player.Chatted:connect(function(m)
		if(m:sub(1,3) == "/e")then m=m:sub(4) end
		if(m:sub(1,5) == "play/")then
			getMode('TRIX-LUA').Music=Playlist[m:sub(6)] or tonumber(m:sub(6)) or 0
			music.SoundId="rbxassetid://"..getMode('TRIX-LUA').Music;
		elseif(m:sub(1,5) == "tpos/")then
			music.TimePosition = tonumber(m:sub(6)) or 0
		elseif(m:sub(1,6) == "pitch/")then
			music.Pitch = tonumber(m:sub(7)) or 0
			getMode('TRIX-LUA').Pitch=music.Pitch
		end
	end)
end

	
while true do
	swait()
	ClickTimer=math.max(ClickTimer-1,0)
	if(ClickTimer<=0 and Combo~=1)then
		print('reset')
		Combo=1
	end
	Sine=Sine+Change
	hue=hue+1
	if(hue>360)then hue=1 end
	local hitfloor,posfloor = workspace:FindPartOnRayWithIgnoreList(Ray.new(Root.CFrame.p,((CFrame.new(Root.Position,Root.Position - Vector3.new(0,1,0))).lookVector).unit * (4)), {Effects,Char,Player.Character})
	local Walking = (math.abs(Root.Velocity.x) > 1 or math.abs(Root.Velocity.z) > 1)
	local State = (Hum.PlatformStand and 'Paralyzed' or Hum.Sit and 'Sit' or (not hitfloor or hitfloor.CanCollide==false) and Root.Velocity.y < -1 and "Fall" or (not hitfloor or hitfloor.CanCollide==false) and Root.Velocity.y > 1 and "Jump" or hitfloor and Walking and "Walk" or hitfloor and "Idle")
	Hum.WalkSpeed = WalkSpeed
	local sidevec = math.clamp((Torso.Velocity*Torso.CFrame.rightVector).X+(Torso.Velocity*Torso.CFrame.rightVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
	local forwardvec =  math.clamp((Torso.Velocity*Torso.CFrame.lookVector).X+(Torso.Velocity*Torso.CFrame.lookVector).Z,-Hum.WalkSpeed,Hum.WalkSpeed)
	local sidevelocity = sidevec/Hum.WalkSpeed
	local forwardvelocity = forwardvec/Hum.WalkSpeed
	
	local lhit,lpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(LLeg.CFrame.p,((CFrame.new(LLeg.Position,LLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char,Player.Character})
	local rhit,rpos = workspace:FindPartOnRayWithIgnoreList(Ray.new(RLeg.CFrame.p,((CFrame.new(RLeg.Position,RLeg.Position - Vector3.new(0,1,0))).lookVector).unit * (2)), {Effects,Char,Player.Character})
	if(Mode=='TRIX-LUA' and IsVaporwave(getMode'TRIX-LUA'.Music))then
		vaporwaveMode=true
		text.Text='Ｖａｐｏｒｗａｖｅ'
		WingAnim='NebG3'
	else
		if(Mode=='TRIX-LUA')then
			text.Text='TRIX-LUA'
			WingAnim=getMode'TRIX-LUA'.WingAnim
		end
		vaporwaveMode=false
	end
	
	
		if(Mode~='HEROIC' and WingAnim and WingAnims[WingAnim])then
		WingAnims[WingAnim]()
	elseif(Mode=='HEROIC')then
		if(State=='Idle')then
			WingAnims.NebG5()
		else
			WingAnims.StarL(1)	
		end
	elseif(WingAnim and typeof(WingAnim)=='table' and WingAnims[WingAnim[1]])then
		local RETARDEDLOL={unpack(WingAnim)};
		table.remove(RETARDEDLOL,1)
		WingAnims[WingAnim[1]](unpack(RETARDEDLOL))
	else
		WingAnims.NebG5()
	end
	
	if(Mode=='TRIX-LUA' and NeutralAnims)then
		WingSine=WingSine+(0.1+music.PlaybackLoudness/300)
	else
		WingSine=WingSine+1
	end
	
	if(music)then
		if(Mode=='TRIX-LUA')then
			local clr = Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/475,0,1))
			local clr2 = Color3.fromHSV(hue/360,1,math.clamp(music.PlaybackLoudness/950,0,1))
			text.TextColor3 = clr
			PrimaryColor = clr2
			for _,v in next, wingModel:GetDescendants() do
				if(v:IsA'BasePart')then
					v.Color = clr2
				elseif(v:IsA'Trail')then
					v.Color = ColorSequence.new(clr2)
				end
			end
		end
	end
	
	if(Mode=='PURIFIED')then
		local pos = Head.Position
		local dist = (camera.CFrame.p-pos).magnitude
		local DropDist = 1
		local IneffectiveDist = 15
		local modifier = dist < DropDist and 1 or dist < IneffectiveDist and (0 - 1) / (IneffectiveDist - DropDist) * (dist - DropDist) + 1 or 0
	end
	
	if(Mode=='TRIX-LUA' and data.User==data.Local)then
		Tween(camera,{FieldOfView=70-(music.PlaybackLoudness/20)},.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
	else
		Tween(camera,{FieldOfView=70},.2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out)
	end
	
	if(State == 'Idle')then
		if(Mode=='TRIX-LUA' and NeutralAnims and not vaporwaveMode)then Change = 0.1+music.PlaybackLoudness/200 else Change = 1 end
		if(Mode=='Sadness')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end

		elseif(Mode=='=_-Humane-_=')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
					elseif(Mode=='SANS')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
								elseif(Mode=='DARKENED')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
		elseif(Mode=='PESTILENCE')then
			local Alpha = .1
			if(NeutralAnims)then	

				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-3+3*M.C(Sine/19),3+1*M.C(Sine/19),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
			
				elseif(Mode=='NEPTUNIAN V')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5+2.5*M.C(Sine/32)),M.R(-15-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(28),M.R(5-2.5*M.C(Sine/32)),M.R(30+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
elseif(Mode=='NEPTUNIAN V (UNEQUIPPED)')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5+2.5*M.C(Sine/32)),M.R(-15-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5-2.5*M.C(Sine/32)),M.R(15+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
		elseif(Mode=='ULTRA SANS')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+1*M.C(Sine/32),0)*CF.A(M.R(4+1*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
				elseif(Mode==(e2.Text))then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			

			
								elseif(Mode=='no is some what you think...')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
								elseif(Mode=='pls dont say this')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(1,0+.05*M.S(Sine/32),.5)*CF.A(M.R(-0),M.R(0+1*M.C(Sine/32)),M.R(0-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-1,0+.05*M.S(Sine/32),.5)*CF.A(M.R(-0),M.R(0-1*M.C(Sine/32)),M.R(-0+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
								elseif(Mode=='LOVE')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(-.0,0+.05*M.S(Sine/32),.1)*CF.A(M.R(35),M.R(5-2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(.0,0+.05*M.S(Sine/32),.1)*CF.A(M.R(25),M.R(5+2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end

					elseif(Mode=='=_-MADNESS-_=')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+5*M.C(Sine/32),0)*CF.A(M.R(-2+7*M.S(Sine/58)),M.R(-15+3*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,16),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0-.05*M.S(Sine/2),.1)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/5)),M.R(-8+3.5*M.C(Sine/2))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(.0,0+.05*M.S(Sine/2),.1)*CF.A(M.R(-0),M.R(5+2.5*M.C(Sine/5)),M.R(8+3.5*M.C(Sine/2))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/2),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/2),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
		elseif(Mode=='PRISM')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.5*M.C(Sine/17),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
							elseif(Mode=='Bruh')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,23+.05*M.C(Sine/32),0)*CF.A(M.R(0+0*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
			LS.C0 = LH.C0:lerp(LHC0*CF.N(0,33-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
			RS.C0 = RH.C0:lerp(RHC0*CF.N(0,33-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,-23-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(-0)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,-23-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(0)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,-0,M.R(-0)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,-0,M.R(0)),Alpha)
				end
			end
			
					elseif(Mode=='ULTRAVIOLET')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+0.20*M.C(Sine/17),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.20*M.S(Sine/17),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.20*M.S(Sine/17),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-0.20*M.C(Sine/17),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-0.20*M.C(Sine/17),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
					elseif(Mode=='lost')then
local HCF = Torso.CFrame * CF.N(math.random(-2,2),-4,(math.random(-2,2))) * CF.A(M.R(math.random(-2,2)),M.R(math.random(-2,2)),M.R(math.random(-2,2)))
Effect({
Color = BrickColor.new'White'.Color;
Material = Enum.Material.Glass,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,-10,0),
Size = Vector3.new(.1,.1,0.1),
EndSize = Vector3.new(.3,.3,.3),
Transparency = NumberRange.new(0,0),
Lifetime = 0.25,
})
			local Alpha = .1
						    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Torso.CFrame*CF.N(0,-2.5,0)*CF.A(M.RRNG(0,0),M.RRNG(0,0),M.RRNG(0,0));
					Color=BrickColor.new'Black'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(10,2,5);
					EndSize=Vector3.new(10,2,5);
				}
			if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),6+5*M.C(Sine/32),0)*CF.A(M.R(-2+7*M.S(Sine/58)),M.R(-4+3*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-5,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-5,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
				end
				elseif(Mode=='HyPnOtIC')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+5*M.C(Sine/32),0)*CF.A(M.R(-2+7*M.S(Sine/58)),M.R(-15+3*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
					elseif(Mode=='Omniversal')then
			local Alpha = .1
			if(NeutralAnims)then

				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,35+5*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(2),M.R(-40-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(40+2*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
		elseif(Mode=='CALAMITANIA')then
			local Alpha = .1
			if(NeutralAnims)then	

				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-3+3*M.C(Sine/19),3+1*M.C(Sine/19),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
					elseif(Mode=='Galactic')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,55+5*M.C(Sine/32),0)*CF.A(M.R(-0+0*M.S(Sine/58)),M.R(-15+0*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
					elseif(Mode=='SPACETIME')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),5+4*M.C(Sine/32),0)*CF.A(M.R(-2+7*M.S(Sine/58)),M.R(-15+3*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5+2.5*M.C(Sine/32)),M.R(-20-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
					elseif(Mode=='PARADOX')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+5*M.C(Sine/32),0)*CF.A(M.R(-2+7*M.S(Sine/58)),M.R(-15+3*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
					elseif(Mode=='LOSS')then
			local Alpha = .1
			if(NeutralAnims)then	
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-0+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
					elseif(Mode=='Interstellar')then
			local Alpha = .1
			if(NeutralAnims)then	
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-0+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
					elseif(Mode=='gh0st3d')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,5+2*M.C(Sine/.1),0)*CF.A(M.R(-25+1*M.S(Sine/6)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/7)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+2*M.S(Sine/.2),0)*CF.A(M.R(27),M.R(5+62022*M.C(Sine/2)),M.R(-10-5*M.C(Sine/2))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+2*M.S(Sine/.1),0)*CF.A(M.R(35),M.R(5-62222*M.C(Sine/2)),M.R(10+5*M.C(Sine/2))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-2*M.C(Sine/.2),0)*CF.A(M.R(25),20220,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-3*M.C(Sine/.2),0)*CF.A(M.R(25),20220,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='GALACTIA')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-0+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(10-5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-10),M.R(25),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
					elseif(Mode=='Mayhem')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(-5+1*M.S(Sine/64)),M.R(-25),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.05*M.S(Sine/32),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(-10),M.R(25),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		--[[elseif(Mode=='INFINITY')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.2+.4*M.C(Sine/39),.5+.2*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-7-2.5*M.S(Sine/32)),M.R(15),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,0,M.R(-15+5*M.S(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),0)*CF.A(0,0,M.R(15-5*M.S(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,.5,-.2)*CF.A(0,0,M.R(-5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end]]
		elseif(Mode=='INFINITY')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+2.20*M.C(Sine/17),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.20*M.S(Sine/17),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.1,0+.20*M.S(Sine/17),0)*CF.A(M.R(175),M.R(5-2.5*M.C(Sine/32)),M.R(-25-1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-0.20*M.C(Sine/17),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-0.20*M.C(Sine/17),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
					elseif(Mode=='br0k3n')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),5+1*M.C(Sine/32),0)*CF.A(M.R(-25+1*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/7)),M.R(-5),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/7),0)*CF.A(M.R(25),M.R(5+5*M.C(Sine/32)),M.R(-10-5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/7),0)*CF.A(M.R(25),M.R(5-5*M.C(Sine/32)),M.R(10+5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/7),0)*CF.A(M.R(25),0,M.R(-3)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/7),0)*CF.A(M.R(25),0,M.R(3)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
								elseif(Mode=='UNBROKEN')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0+3*M.C(Sine/19),4+2*M.C(Sine/19),0)*CF.A(M.R(50+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-100),M.R(0+2.5*M.C(Sine/32)),M.R(0-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-100),M.R(0-2.5*M.C(Sine/32)),M.R(-0+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.53,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(-0.53,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end
			
					elseif(Mode=='The Sword Runner')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(CF.N(0,4.8+.2*M.C(Sine/24),0)*CF.A(M.R(0+1*M.S(Sine/24)),M.R(.7),M.R(.4)),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(2),M.R(-20-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(20+2*M.S(Sine/36))),Alpha)
				NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.5)*CF.A(M.R(-40-5*M.S(Sine/24)),M.R(-18.7),M.R(-3.7)),Alpha)
				if(legAnims)then
					LH.C0 = LH.C0:lerp(CF.N(-0.5,-1,0)*CF.A(M.R(1.9+0.5*M.S(Sine/24)),M.R(19.2),M.R(-5.7)),Alpha)
					RH.C0 = RH.C0:lerp(CF.N(0.5,-1,0)*CF.A(M.R(1.9+0.5*M.S(Sine/24)),M.R(-19.2),M.R(5.7)),Alpha)
				end
			elseif(legAnims)then
				LH.C0 = LH.C0:lerp(LHC0,Alpha)
				RH.C0 = RH.C0:lerp(RHC0,Alpha)
			end
		elseif(Mode=='TRIX-LUA')then
			if(vaporwaveMode)then
			  	local Alpha = .1
				if(NeutralAnims)then
					RJ.C0 = RJ.C0:lerp(CF.N(0,-0.2-.1*M.S(Sine/36),0.6)*CF.A(M.R(74.3+2.5*M.C(Sine/36)),M.R(0),M.R(0)),Alpha)
					LS.C0 = LS.C0:lerp(CF.N(-1,0.8,0)*CF.A(M.R(11.4-5*M.C(Sine/42)),M.R(-3.3),M.R(137.5)),Alpha)
					RS.C0 = RS.C0:lerp(CF.N(1,0.9,-0.1)*CF.A(M.R(13.7-5*M.C(Sine/42)),M.R(7.7),M.R(-136.2)),Alpha)
					NK.C0 = NK.C0:lerp(CF.N(0,1.4,-0.3)*CF.A(M.R(-16.6-5*M.C(Sine/42)),M.R(0),M.R(0)),Alpha)
					if(legAnims)then
						LH.C0 = LH.C0:lerp(CF.N(-0.7,-1,0)*CF.A(M.R(37.2+10*M.C(Sine/36)),M.R(0),M.R(24)),Alpha)
						RH.C0 = RH.C0:lerp(CF.N(0.8,-1.1,-0.1)*CF.A(M.R(5.9+5*M.C(Sine/36)),M.R(3.5),M.R(-43.9)),Alpha)
					end
				elseif(legAnims)then
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			else
				local Alpha = .3
				if(NeutralAnims)then	
					RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/20)+(music.PlaybackLoudness/5000),0)*CF.A(M.R(0+1*M.S(Sine/64)),M.R(35),0),Alpha)
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(0+1*M.S(Sine/24)),M.R(-35),0),Alpha)
					LS.C0 = LS.C0:lerp(LSC0*CF.A(0,0,M.R(-15+10*M.C(Sine/20))),Alpha)
					RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(75-(music.PlaybackLoudness/7.5)),M.R(5),M.R(35)),Alpha)
				end
				if(legAnims)then 
					if(NeutralAnims)then
						LH.C0 = LH.C0:lerp(LHC0*CF.N(0,-.05*M.C(Sine/20)-(music.PlaybackLoudness/5000),0)*CF.A(0,M.R(25),0),Alpha)
						RH.C0 = RH.C0:lerp(RHC0*CF.N(0,-.05*M.C(Sine/20)-(music.PlaybackLoudness/5000),0),Alpha)
					else
						LH.C0 = LH.C0:lerp(LHC0,Alpha)
						RH.C0 = RH.C0:lerp(RHC0,Alpha)
					end
				end
			end
		elseif(Mode=='Careless')then
	local Alpha = .1
			if(NeutralAnims)then	
           RJ.C0 = RJ.C0:lerp(LSC0*CF.N(.3,5+.05*M.S(Sine/32),.1)*CF.A(M.R(-0),M.R(0+200*M.C(Sine/322)),M.R(0-200*M.C(Sine/322))),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-0.5,0.2+.03*M.S(Sine/32),0)*CF.A(M.R(165),M.R(20-12.6*M.C(Sine/32)),M.R(-35-1.5*M.C(Sine/32))),Alpha)
			end

if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
					elseif(Mode=='TIMELESS')then
			local Alpha = .1
			if(NeutralAnims)then	
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Dark indigo'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(2),M.R(-30-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(-2),M.R(30+2*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
			
								elseif(Mode=='LIGHTSPEED')then
			local Alpha = .1
			if(NeutralAnims)then	
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				GotEffect{
					Lifetime=.2;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(-2),M.R(30+2*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
					elseif(Mode=='AURORA')then
	    GotEffect{
					Lifetime=0.3;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Head.CFrame*CF.N(.22,0.2,-0.56)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0.9,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,0.1,1);
				}		

			local Alpha = .1
			if(NeutralAnims)then	
						RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+3*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(-.0,0-.1*M.S(Sine/32),.0)*CF.A(M.R(180),M.R(-5+2.5*M.C(Sine/32)),M.R(-20-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-180),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
			end
if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='PURIFIED')then
			local Alpha = .1
			if(NeutralAnims)then
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Black'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(-15-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(15+2*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0.4-.05*M.C(Sine/32),-0.3)*CF.A(M.R(-5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
					elseif(Mode=='ZORNO')then
			local Alpha = .1
			if(NeutralAnims)then
				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+0.05*M.C(Sine/32),0)*CF.A(M.R(-2+5*M.S(Sine/58)),M.R(-15+5*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,25)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),M.R(35),M.R(-10))*CF.A(M.RRNG(-5,5),M.RRNG(-5,5),M.RRNG(-5,5)),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(-15-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(15+2*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),-0)*CF.A(M.R(5),M.R(0),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(5),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(RHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
			end
		elseif(Mode=='INFINITE VOID')then
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,75+5*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.1*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.1*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

		elseif(Mode=='Broken PR0GRam')then
			local Alpha = .1
			if(NeutralAnims)then

				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0+.2*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,1+2*M.S(Sine/1),.0)*CF.A(M.R(700),M.R(5+2.5*M.C(Sine/32)),M.R(-366-2*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,7+7*M.S(Sine/1),.0)*CF.A(M.R(90),M.R(5-7.5*M.C(Sine/32)),M.R(366+7*M.C(Sine/32))),Alpha)
			end
if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(135),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end
				elseif(Mode=='Dark Energy')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0.0+.0*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end
				elseif(Mode=='ZEN-X')then
			local Alpha = .1
			if(NeutralAnims)then


				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+5*M.C(Sine/32),0)*CF.A(M.R(-2+7*M.S(Sine/58)),M.R(-15+3*M.C(Sine/42)),0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end



				elseif(Mode=='FORCE')then
			local Alpha = .1
			if(NeutralAnims)then
			    
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}


				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0.0+.0*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(180),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end


				elseif(Mode=='HEROIC')then
			local Alpha = .1
			if(NeutralAnims)then
			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Head.CFrame*CF.N(0,1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

				elseif(Mode=='FREEZING')then
local HCF = Torso.CFrame * CF.N(math.random(-50,50),-4,(math.random(-50,50))) * CF.A(M.R(math.random(-50,50)),M.R(math.random(-50,50)),M.R(math.random(-50,50)))
Effect({
Color = BrickColor.new'White'.Color;
Material = Enum.Material.Glass,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,20,0),
Size = Vector3.new(.1,.1,0.1),
EndSize = Vector3.new(2,2,2),
Transparency = NumberRange.new(0,0),
Lifetime = 0.25,
})
						    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Root.CFrame*CF.N(0,120,0)*CF.A(M.RRNG(0,0),M.RRNG(0,0),M.RRNG(0,0));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Glass;
					Size=Vector3.new(1000,1,1000);
					EndSize=Vector3.new(10000,1,10000);
				}
			local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.05*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.5,0+.05*M.S(Sine/32),-.6)*CF.A(M.R(-17),M.R(-20),M.R(-79+1*M.S(Sine/36))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-2.5)),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.A(0,0,M.R(2.5)),Alpha)
				end
			end

				elseif(Mode=='SYNCHRO')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+3*M.C(Sine/21),2+1*M.C(Sine/32),0)*CF.A(M.R(-30+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(30),M.R(20+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(30),M.R(20-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(30+3*M.S(Sine/64)),0,0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(M.R(30+3*M.S(Sine/64)),0,0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

				elseif(Mode=='SPINNER')then
			local Alpha = .1
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+0*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(20+10000*M.C(Sine/220)),M.R(-1-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(20-10000*M.C(Sine/220)),M.R(1+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(20+10000*M.C(Sine/220)),M.R(-1+1.5*M.C(Sine/32))),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(-.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(20-10000*M.C(Sine/220)),M.R(1+1.5*M.C(Sine/32))),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

				elseif(Mode=='OVERKILL')then
local HCF = Torso.CFrame * CF.N(math.random(-50,50),-4,(math.random(-50,50))) * CF.A(M.R(math.random(-50,50)),M.R(math.random(-50,50)),M.R(math.random(-50,50)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.1,.1,0.1),
EndSize = Vector3.new(4,4,4),
Transparency = NumberRange.new(0,0),
Lifetime = 0.25,
})
			local Alpha = .1
			if(NeutralAnims)then
			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,2,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,2+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(20+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.2*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(20-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

				elseif(Mode=='Pheonix')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Gold'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})

			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

				elseif(Mode=='BIT32')then


			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				

			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
							    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Brick};
					CFrame=Torso.CFrame*CF.N(0,1.5,-5)*CF.A(M.RRNG(0,0),M.RRNG(0,0),M.RRNG(0,0));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(10,10,0.5);
				}

				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end


				elseif(Mode=='The Big Black')then

			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

				elseif(Mode=='Universal')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(2,7,2),
EndSize = Vector3.new(2,12,2),
Transparency = NumberRange.new(0,1),
Lifetime = .02,
})
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				
							    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Torso.CFrame*CF.N(0,1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(3,3,3);
				}
				

			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

				elseif(Mode=='Defected')then
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,1,1);
				}
				
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,1,1);
				}
							    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,1,1);
				}
				
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,1,1);
				}
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end
				elseif(Mode=='Time')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Lime green'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = .02,
})
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}

				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(0),M.R(5+2.5*M.C(Sine/32)),M.R(-10-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

				elseif(Mode=='REVENGE')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(1,12,1),
Transparency = NumberRange.new(0,0),
Lifetime = .01,
})
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}

				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,3+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(10+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end
			
	elseif(Mode=='N U C L E A R')then
			local Alpha = .1
			if(NeutralAnims)then
			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				
				}
				

			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+1*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5+2.5*M.C(Sine/32)),M.R(-20-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
			end
if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

	elseif(Mode=='Inferno')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Flame reddish orange'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(2,2,2),
EndSize = Vector3.new(2,12,2),
Transparency = NumberRange.new(0,1),
Lifetime = .1,
})
			local Alpha = .1
			if(NeutralAnims)then
			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Flame reddish orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				
				}
				

			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Flame reddish orange'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,0+.1*M.C(Sine/1),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5+2.5*M.C(Sine/32)),M.R(-20-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-0),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
			end
if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end

	elseif(Mode=='Calamified')then
			local Alpha = .1
			if(NeutralAnims)then
			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0.0+.0*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(-180),M.R(5-2.5*M.C(Sine/32)),M.R(20+1.5*M.C(Sine/32))),Alpha)
			end
if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
				end
				
			elseif(Mode=='The Doctor')then
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,-0.1+.2*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.1*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.1*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
end
			
			elseif(Mode=='ILLUMINATION')then
				local Alpha = .1
			if(NeutralAnims)then	
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,4+3*M.C(Sine/32),0)*CF.A(M.R(0+3*M.S(Sine/64)),0,0),Alpha)
				if(M.RNG(1,45)==1)then
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.RRNG(-25,25),M.RRNG(-25,25),M.RRNG(-25,25)),.8)
				else
					NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(-10-2.5*M.S(Sine/32)),0,0),Alpha)
				end
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.1*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.1*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
			end
if(legAnims)then 
				if(NeutralAnims)then
					LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-.05*M.C(Sine/32),0)*CF.A(0,M.R(15),0),Alpha)
					RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0-.05*M.C(Sine/32),0),Alpha)
				else
					LH.C0 = LH.C0:lerp(LHC0,Alpha)
					RH.C0 = RH.C0:lerp(RHC0,Alpha)
				end
            end
			end
	
	--custom walks--
	
	    elseif(State == 'Walk')then
		if(Mode=='The Sword Runner')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-15+5*M.S(Sine/58)),M.R(90+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.0,-.0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(2),M.R(-20-2*M.S(Sine/36))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.0*M.S(Sine/32),-.0)*CF.A(M.R(0),M.R(0),M.R(20+2*M.S(Sine/36))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
			end
			
				    elseif(State == 'Walk')then
		if(Mode=='LIGHTSPEED')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'White'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,.1,0.1),
EndSize = Vector3.new(1,.5,.5),
Transparency = NumberRange.new(0,0),
Lifetime = 2,
})
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-57+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.5,-.1+.05*M.S(Sine/32),-.8)*CF.A(M.R(13),M.R(-12),M.R(104-2*M.S(Sine/36))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
				  elseif(State == 'Walk')then
		if(Mode=='Interstellar')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			 elseif(State == 'Walk')then
		if(Mode=='gh0st3d')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+1*M.C(Sine/.2),4+.2*M.C(Sine/.1),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48322732e-06, 1)*CF.A(-2,4,M.R(-7+14*M.S(Sine/.2))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.53871994e-07, 1)*CF.A(-2,-4,M.R(7-14*M.S(Sine/.1))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.8845396508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
    elseif(State == 'Walk')then
		if(Mode=='Omniversal')then
			local Alpha = .1
  			if(NeutralAnims)then

  			    
  			    
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),35+5*M.C(Sine/32),0)*CF.A(M.R(-15+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-35),M.R(5+2.5*M.C(Sine/32)),M.R(35-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.3,0+.05*M.S(Sine/32),.1)*CF.A(M.R(-25),M.R(5-2.5*M.C(Sine/32)),M.R(-35+1.5*M.C(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			    elseif(State == 'Walk')then
		if(Mode=='TIMELESS')then



			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end

		    

			
				    elseif(State == 'Walk')then
		if(Mode=='HEROIC')then
			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Head.CFrame*CF.N(0,1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),2+.2*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
  elseif(State == 'Walk')then
		if(Mode=='Pheonix')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Gold'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = 0.2,
})
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				
				    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Gold'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			  elseif(State == 'Walk')then
		if(Mode=='INFINITY')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(3+2.20*M.C(Sine/17),3+2.20*M.C(Sine/17),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			 elseif(State == 'Walk')then
		if(Mode=='BIT32')then

			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				
				    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			
			 elseif(State == 'Walk')then
		if(Mode=='Time')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Lime green'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(0.2,12,0.2),
Transparency = NumberRange.new(0,1),
Lifetime = .02,
})

				    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
						 elseif(State == 'Walk')then
		if(Mode=='REVENGE')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(.1,7,0.1),
EndSize = Vector3.new(1,12,1),
Transparency = NumberRange.new(0,0),
Lifetime = .01,
})

				    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.7,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
						 elseif(State == 'Walk')then
		if(Mode=='The Big Black')then



				    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				
								    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
									 elseif(State == 'Walk')then
		if(Mode=='CALAMITANIA')then



			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
												 elseif(State == 'Walk')then
		if(Mode=='Galactic')then



			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),55+5*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
												 elseif(State == 'Walk')then
		if(Mode=='INFINITE VOID')then



			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),75+5*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
												 elseif(State == 'Walk')then
		if(Mode=='AURORA')then



			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),4+3*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
												 elseif(State == 'Walk')then
		if(Mode=='UNBROKEN')then



			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
									 elseif(State == 'Walk')then
		if(Mode=='Universal')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(2,7,2),
EndSize = Vector3.new(2,12,2),
Transparency = NumberRange.new(0,1),
Lifetime = .01,
})
			    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Torso.CFrame*CF.N(0,1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(3,3,3);
				}
				    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
				
								    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(1,1,1);
					EndSize=Vector3.new(1,1,1);
				}
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
												 elseif(State == 'Walk')then
		if(Mode=='Defected')then

				    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,1,1);
				}
				
								    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,1,1);
				}
				
								    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LLeg.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,1,1);
				}
				
								    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RLeg.CFrame*CF.N(0,-1.5,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Crimson'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(0.1,0.1,0.1);
					EndSize=Vector3.new(1,1,1);
				}

			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			  elseif(State == 'Walk')then
		if(Mode=='FREEZING')then
local HCF = Torso.CFrame * CF.N(math.random(-50,50),-4,(math.random(-50,50))) * CF.A(M.R(math.random(-50,50)),M.R(math.random(-50,50)),M.R(math.random(-50,50)))
Effect({
Color = BrickColor.new'White'.Color;
Material = Enum.Material.Glass,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,20,0),
Size = Vector3.new(.1,.1,0.1),
EndSize = Vector3.new(2,2,2),
Transparency = NumberRange.new(0,0),
Lifetime = 0.25,
})
						    			    				GotEffect{
					Lifetime=.1;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=Root.CFrame*CF.N(0,120,0)*CF.A(M.RRNG(0,0),M.RRNG(0,0),M.RRNG(0,0));
					Color=BrickColor.new'White'.Color;
					Transparency={0,1};
					Material=Enum.Material.Glass;
					Size=Vector3.new(1000,1,1000);
					EndSize=Vector3.new(10000,1,10000);
				}
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end

			  elseif(State == 'Walk')then
		if(Mode=='Inferno')then
local HCF = Root.CFrame * CF.N(math.random(-20,20),-4,(math.random(-20,20))) * CF.A(M.R(math.random(-20,20)),M.R(math.random(-20,20)),M.R(math.random(-20,20)))
Effect({
Color = BrickColor.new'Flame reddish orange'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,10,0),
Size = Vector3.new(2,2,2),
EndSize = Vector3.new(2,12,2),
Transparency = NumberRange.new(0,1),
Lifetime = .1,
})

			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end
			
			  elseif(State == 'Walk')then
		if(Mode=='ILLUMINATION')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),4+3*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
	  elseif(State == 'Walk')then
		if(Mode=='SYNCHRO')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+3*M.C(Sine/21),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			
			
				  elseif(State == 'Walk')then
		if(Mode=='N U C L E A R')then
			local Alpha = .1
  			if(NeutralAnims)then
  			    			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				
				}
				

			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Lime green'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
							  elseif(State == 'Walk')then
		if(Mode=='ULTRA SANS')then
			local Alpha = .1
  			if(NeutralAnims)then
  			    			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=RArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				
				}
				

			    				GotEffect{
					Lifetime=.5;
					Mesh={Type=Enum.MeshType.Sphere};
					CFrame=LArm.CFrame*CF.N(0,-1,0)*CF.A(M.RRNG(0,360),M.RRNG(0,360),M.RRNG(0,360));
					Color=BrickColor.new'Cyan'.Color;
					Transparency={0,1};
					Material=Enum.Material.Neon;
					Size=Vector3.new(.5,1,.5);
					EndSize=Vector3.new(.1,3,.1);
				}
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
			
	  elseif(State == 'Walk')then
		if(Mode=='PRISM')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),3+1.5*M.C(Sine/17),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end

	  elseif(State == 'Walk')then
		if(Mode=='PARADOX')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
				  elseif(State == 'Walk')then
		if(Mode=='=_-MADNESS-_=')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
	  elseif(State == 'Walk')then
		if(Mode=='SPACETIME')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),5+4*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
				  elseif(State == 'Walk')then
		if(Mode=='lost')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),6+5*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
				  elseif(State == 'Walk')then
		if(Mode=='GALACTIA')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
				  elseif(State == 'Walk')then
		if(Mode=='br0k3n')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),5+1*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
				  elseif(State == 'Walk')then
		if(Mode=='LOSS')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			

			
			
							  elseif(State == 'Walk')then
		if(Mode=='PESTILENCE')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-0+3*M.C(Sine/19),3+2*M.C(Sine/19),0)*CF.A(M.R(-56+4*M.S(Sine/19)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
										  elseif(State == 'Walk')then
		if(Mode=='PURIFIED')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-0+3*M.C(Sine/19),3+2*M.C(Sine/19),0)*CF.A(M.R(-56+4*M.S(Sine/19)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			



	  elseif(State == 'Walk')then
		if(Mode=='NEPTUNIAN V')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0,0)*CF.A(M.R(0+55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,0),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-.0,0+.1*M.S(Sine/32),.0)*CF.A(M.R(28),M.R(5-2.5*M.C(Sine/32)),M.R(30+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end
       
	  elseif(State == 'Walk')then
		if(Mode=='Careless')then



			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end
			
				  elseif(State == 'Walk')then
		if(Mode=='Bruh')then

			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
            	RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,23+.05*M.C(Sine/32),0)*CF.A(M.R(0+0*M.S(Sine/64)),0,0),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
			LS.C0 = LH.C0:lerp(LHC0*CF.N(0,28-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(-2.5)),Alpha)
			RS.C0 = RH.C0:lerp(RHC0*CF.N(0,28-.0*M.C(Sine/32),0)*CF.A(0,0,M.R(2.5)),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,-36-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,-36+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end
	  elseif(State == 'Walk')then
		if(Mode=='HyPnOtIC')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end

	  elseif(State == 'Walk')then
		if(Mode=='DARKENED')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end
	  elseif(State == 'Walk')then
		if(Mode=='ZEN-X')then
			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+4*M.C(Sine/39),13+4*M.C(Sine/32),0)*CF.A(M.R(-56+4*M.S(Sine/58)),M.R(0+4*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end



	  elseif(State == 'Walk')then
		if(Mode=='pls dont say this')then
			local wsVal = 4
			local Alpha = .2
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
 				LS.C0 = LS.C0:lerp(LSC0*CF.N(1,0+.05*M.S(Sine/32),.5)*CF.A(M.R(-0),M.R(0+1*M.C(Sine/32)),M.R(0-1.5*M.C(Sine/32))),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(-1,0+.05*M.S(Sine/32),.5)*CF.A(M.R(-0),M.R(0-1*M.C(Sine/32)),M.R(-0+1.5*M.C(Sine/32))),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
end


	  elseif(State == 'Walk')then
		if(Mode=='OVERKILL')then
local HCF = Torso.CFrame * CF.N(math.random(-50,50),-4,(math.random(-50,50))) * CF.A(M.R(math.random(-50,50)),M.R(math.random(-50,50)),M.R(math.random(-50,50)))
Effect({
Color = BrickColor.new'Crimson'.Color;
Material = Enum.Material.Neon,
Mesh = {Type = Enum.MeshType.Sphere},
CFrame = HCF,
EndPos = HCF* CF.N(0,30,0),
Size = Vector3.new(.1,.1,0.1),
EndSize = Vector3.new(4,4,4),
Transparency = NumberRange.new(0,0),
Lifetime = 0.25,
})



			local Alpha = .1
  			if(NeutralAnims)then
 				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(-.3+.4*M.C(Sine/39),3+1*M.C(Sine/32),0)*CF.A(M.R(-56+5*M.S(Sine/58)),M.R(0+5*M.C(Sine/42)),0),Alpha)
 				LS.C0 = LS.C0:lerp(CFrame.new(-1.50198829, 0.580981374, 0.000380858371, 0.963434994, 0.267942399, 1.75953949e-06, -0.267942399, 0.963434994, 5.1856041e-06, -3.05473804e-07, -5.48362732e-06, 1)*CF.A(-1,0,M.R(-7+5*M.S(Sine/32))),Alpha)
  				RS.C0 = RS.C0:lerp(CFrame.new(1.54895508, 0.519735038, 0.000380946265, 0.98034811, -0.197275475, -1.24170782e-07, 0.19727549, 0.980348051, 9.53674316e-07, -5.96046448e-08, -9.23871994e-07, 1)*CF.A(-1,0,M.R(7-5*M.S(Sine/32))),Alpha)
  				NK.C0 = NK.C0:lerp(NKC0*CF.A(M.R(65-5*M.S(Sine/58)),0,0),Alpha)
			end
			if(legAnims)then
				LH.C0 = LH.C0:lerp(CFrame.new(-0.49666214, -0.990924835, 0.00763010979, 1, 0, 0, 0, 1, 0, 0, 0, 1),Alpha)
				RH.C0 = RH.C0:lerp(CFrame.new(0.498336792, -0.303280592, -0.883536756, 1, 0, 0, 0, 0.886996508, 0.461776346, 0, -0.461776316, 0.886996448),Alpha)
			end


		else
		
			local wsVal = 4
			local Alpha = .2
			if(Mode=='UNBROKEN')then Change=.3 elseif(Mode=='PURIFIED' or Mode=='INFINITE VOID' or Mode=='Omniversal')then Change=1 else Change=.5 end
			if(NeutralAnims)then
				RJ.C0 = RJ.C0:lerp(RJC0*CF.N(0,.05+Change/4*M.C(Sine/(wsVal/2)),0)*CF.A(M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*forwardvelocity,M.R(0+5*M.C(Sine/wsVal)),M.R(-(Change*20)-movement/20*M.C(Sine/(wsVal/2)))*sidevelocity+M.R(0-1*M.C(Sine/wsVal))),Alpha)
				NK.C0 = NK.C0:lerp(NKC0,Alpha)
				LS.C0 = LS.C0:lerp(LSC0*CF.N(0,0,0)*CF.A(M.R(0+55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,0),Alpha)
				RS.C0 = RS.C0:lerp(RSC0*CF.N(0,0,0)*CF.A(M.R(0-55*(movement/8)*M.S(Sine/wsVal))*forwardvelocity,0,0),Alpha)
			end
			if(legAnims)then 
				LH.C0 = LH.C0:lerp(LHC0*CF.N(0,0-movement/15*M.C(Sine/wsVal)/2,(-.1+movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5-movement*M.C(Sine/wsVal))+-(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				RH.C0 = RH.C0:lerp(RHC0*CF.N(0,0+movement/15*M.C(Sine/wsVal)/2,(-.1-movement/15*M.C(Sine/wsVal))*(.5+.5*forwardvelocity))*CF.A((M.R(-10*forwardvelocity+Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*forwardvelocity,0,(M.R(Change*5+movement*M.C(Sine/wsVal))+(movement/10)*M.S(Sine/wsVal))*(sidevec/(Hum.WalkSpeed*2))),Alpha)
				local footstepIds = {141491460,141491460}
				if(lhit and lhit.CanCollide and footstepSounds[lhit.Material])then
					if(lhit.Material==Enum.Material.Sand and lhit.Color.r*255>=160 and lhit.Color.g*255>=160 and lhit.Color.b*255>=160)then
						footstepIds[1] = footstepSounds[Enum.Material.Snow]
					else
						footstepIds[1] = footstepSounds[lhit.Material]
					end

				
				if(rhit and rhit.CanCollide and footstepSounds[rhit.Material])then
					if(rhit.Material==Enum.Material.Sand and rhit.Color.r*255>=160 and rhit.Color.g*255>=160 and rhit.Color.b*255>=160)then
						footstepIds[2] = footstepSounds[Enum.Material.Snow]
					else
						footstepIds[2] = footstepSounds[rhit.Material]
					end
				end
		

--end
	elseif(State == 'Jump')then
		local Alpha = .1
		local idk = math.min(math.max(Root.Velocity.Y/50,-M.R(90)),M.R(90))
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0*CF.A(M.R(-5),0,M.R(-90)),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(-5),0,M.R(90)),Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
			NK.C0 = NK.C0:lerp(NKC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-5)),Alpha)
			RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),Alpha)
		end
	elseif(State == 'Fall')then
		local Alpha = .1
		local idk = math.min(math.max(Root.Velocity.Y/50,-M.R(90)),M.R(90))
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0*CF.A(M.R(-5),0,M.R(-90)+idk),Alpha)
			RS.C0 = RS.C0:lerp(RSC0*CF.A(M.R(-5),0,M.R(90)-idk),Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
			NK.C0 = NK.C0:lerp(NKC0*CF.A(math.min(math.max(Root.Velocity.Y/100,-M.R(45)),M.R(45)),0,0),Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0*CF.A(0,0,M.R(-5)),Alpha)
			RH.C0 = RH.C0:lerp(RHC0*CF.N(0,1,-1)*CF.A(M.R(-5),0,M.R(5)),Alpha)
		end
	elseif(State == 'Paralyzed')then
		local Alpha = .1
		if(NeutralAnims)then
			LS.C0 = LS.C0:lerp(LSC0,Alpha)
			RS.C0 = RS.C0:lerp(RSC0,Alpha)
			RJ.C0 = RJ.C0:lerp(RJC0,Alpha)
			NK.C0 = NK.C0:lerp(NKC0,Alpha)
		end
		if(legAnims)then 
			LH.C0 = LH.C0:lerp(LHC0,Alpha)
			RH.C0 = RH.C0:lerp(RHC0,Alpha)
		end
	elseif(State == 'Sit')then
		

	if(data.User==data.Local)then
		local syncStuff={
			NeutralAnims;
			legAnims;
			{NK.C0,RJ.C0,RH.C0,RS.C0,LH.C0,LS.C0};
			{NK.C1,RJ.C1,RH.C1,RS.C1,LH.C1,LS.C1};
			Sine;
			movement;
			walking;	
			Change;
			--// OPTIONAL SYNC \\--
			MusicMode;
			(music and music.TimePosition or 0);
			(music and music.Pitch or 1);
			WingSine;
			getMode('TRIX-LUA');
			Mode;
			hue;
		}
	end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end
end









end)
