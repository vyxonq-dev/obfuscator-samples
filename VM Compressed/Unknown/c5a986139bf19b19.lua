local PRIVATE_MODEL_ID = 125165599816440

------------------------------------------------

-- SERVICES

------------------------------------------------

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Debris = game:GetService("Debris")

local Workspace = game:GetService("Workspace")

------------------------------------------------

-- PLAYER

------------------------------------------------

local Player = Players.LocalPlayer

local Character = Player.Character or Player.CharacterAdded:Wait()

local Humanoid = Character:WaitForChild("Humanoid")

local RootPart = Character:WaitForChild("HumanoidRootPart")

if Humanoid:FindFirstChild("Animator") then

    Humanoid.Animator:Destroy()

end

------------------------------------------------

-- SPEED SETTINGS

------------------------------------------------

local WALK_SPEED = 8.75

local RUN_SPEED = 30

local RunMode = false

local UsingSkill = false

local TModeActive = false

local TTransforming = false

local function Block() Humanoid.WalkSpeed = 0 end

local function Unblock() Humanoid.WalkSpeed = RunMode and RUN_SPEED or WALK_SPEED end

------------------------------------------------

-- BGM

------------------------------------------------

local bgm = Instance.new("Sound")

bgm.SoundId = "rbxassetid://135206998594710"

bgm.Looped = true

bgm.PlaybackSpeed = 1

bgm.Volume = 0.5

bgm.Parent = workspace

bgm:Play()

------------------------------------------------

-- ANIMATOR LOAD

------------------------------------------------

if not getgenv().Animator6DLoadedPro then

    loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/Stuff/refs/heads/main/Animator6D.lua"))()

    repeat task.wait() until getgenv().Animator6DLoadedPro

end

local currentAnim

local function Play(kf, loop)

    getgenv().Animator6DStop()

    task.wait(0.03)

    getgenv().Animator6D(kf,1,loop~=false)

    currentAnim=kf

end

local function AnimLength(kf)

    local d=0

    for _,k in ipairs(kf:GetKeyframes()) do

        if k.Time>d then d=k.Time end

    end

    return d

end

------------------------------------------------

-- LOAD MODEL & ANIMATIONS

------------------------------------------------

local model = game:GetObjects("rbxassetid://"..PRIVATE_MODEL_ID)[1]

local Animations={}

local function scan(o)

    if o:IsA("KeyframeSequence") then

        table.insert(Animations,o)

    end

    for _,c in ipairs(o:GetChildren()) do

        scan(c)

    end

end

scan(model)

------------------------------------------------

-- BASE ANIMS

------------------------------------------------

local IdleKF, WalkKF, RunKF

IdleKF=Animations[1]

WalkKF=Animations[1]

for _,a in ipairs(Animations) do

    local n=a.Name:lower()

    if n:find("jason idle") then IdleKF=a

    elseif n:find("jason walk") then WalkKF=a

    elseif n:find("run") then RunKF=a

    end

end

local OriginalIdle=IdleKF

local OriginalWalk=WalkKF

------------------------------------------------

-- TRANSFORM & INTRO

------------------------------------------------

local TransformAnim=Animations[9]

local TIdleAnim=Animations[10]

local TWalkAnim=Animations[8]

local IntroAnim=Animations[15]

------------------------------------------------

-- SOUNDS

------------------------------------------------

local Sounds={

    G="rbxassetid://122639500353871",

    GMiss="rbxassetid://99532296171766",

    F="rbxassetid://122288454454450",

    Q="rbxassetid://128410342527818",

    E="rbxassetid://5985793946",

    R="rbxassetid://118519652417961",

    H="rbxassetid://127982143175423",

    M1="rbxassetid://73370974608154",

    X="rbxassetid://121417544685647",

    Hit="rbxassetid://131313131313131"

}

local function PlaySound(id,volume)

    local s=Instance.new("Sound",workspace)

    s.SoundId=id

    s.Volume=volume or 6

    s:Play()

    Debris:AddItem(s,5)

end

------------------------------------------------

-- COOLDOWN SYSTEM

------------------------------------------------

local SkillCooldowns={}

local MobileButtons={}

local function CanUseSkill(name)

    local cd=SkillCooldowns[name]

    if cd and tick()<cd then return false end

    return true

end

local function SetCooldown(name,seconds)

    SkillCooldowns[name]=tick()+seconds

    local btn=MobileButtons[name]

    if btn then

        btn.BackgroundTransparency=0.7

        local countdown = Instance.new("TextLabel")

        countdown.Size=UDim2.new(1,0,1,0)

        countdown.Position=UDim2.new(0,0,0,0)

        countdown.BackgroundTransparency=1

        countdown.TextColor3=Color3.new(1,0,0)

        countdown.TextScaled=true

        countdown.Parent=btn

        spawn(function()

            while tick()<SkillCooldowns[name] do

                countdown.Text=tostring(math.ceil(SkillCooldowns[name]-tick()))

                task.wait(0.1)

            end

            countdown:Destroy()

            btn.BackgroundTransparency=0.3

        end)

    end

end

------------------------------------------------

-- HITBOX TARGET

------------------------------------------------

local function GetTarget()

    local size=Vector3.new(4,5,4)

    local p=Instance.new("Part")

    p.Size=size

    p.Transparency=1

    p.Anchored=true

    p.CanCollide=false

    p.Parent=workspace

    local target=nil

    local t=0

    while t<0.25 do

        p.CFrame=RootPart.CFrame*CFrame.new(0,0,-3)

        for _,v in ipairs(workspace:GetPartsInPart(p)) do

            local h=v.Parent:FindFirstChild("Humanoid")

            if h and v.Parent~=Character then

                target=v.Parent

                break

            end

        end

        if target then break end

        t+=RunService.Heartbeat:Wait()

    end

    p:Destroy()

    return target

end

local function StickToTarget(target,duration)

    local hrp=target:FindFirstChild("HumanoidRootPart")

    if not hrp then return end

    local t=0

    local lastCFrame=RootPart.CFrame

    while t<duration and target.Parent do

        local targetPos=hrp.Position + hrp.CFrame.LookVector*-2

        local cf=CFrame.new(lastCFrame.Position:Lerp(targetPos,0.2),hrp.Position)

        RootPart.CFrame=cf

        lastCFrame=cf

        t+=RunService.RenderStepped:Wait()

    end

end

------------------------------------------------

-- TRANSFORM FUNCTIONS

------------------------------------------------

local function Transform()

    if TModeActive or TTransforming then return end

    UsingSkill=true

    TTransforming=true

    Block()

    Play(TransformAnim,false)

    task.wait(AnimLength(TransformAnim))

    TModeActive=true

    TTransforming=false

    IdleKF=TIdleAnim

    WalkKF=TWalkAnim

    Unblock()

    UsingSkill=false

end

local function CancelTransform()

    if not TModeActive and not TTransforming then return end

    TModeActive=false

    TTransforming=false

    IdleKF=OriginalIdle

    WalkKF=OriginalWalk

    Play(IdleKF,true)

    UsingSkill=false

    Unblock()

end

local function TryCancelTMode()

    if TModeActive then CancelTransform() end

end

------------------------------------------------

-- MOVEMENT HELP FUNCTION (NEW)

------------------------------------------------

local function PlayMovementState()

    local moving = Humanoid.MoveDirection.Magnitude > 0

    if moving then

        if RunMode and RunKF then

            Play(RunKF,true)

        else

            Play(WalkKF,true)

        end

    else

        Play(IdleKF,true)

    end

end

------------------------------------------------

-- SKILLS

------------------------------------------------

local function SkillAction(name, anim, sound, targetFunc, duration, cd, allowMove, hitbox)

    if not CanUseSkill(name) then return end

    UsingSkill = true

    if not allowMove then Block() end

    Play(anim,false)

    PlaySound(sound,6)

    -- Hitbox + hit sound

    if hitbox then

        local hb = Instance.new("Part")

        hb.Size = Vector3.new(4,5,4)

        hb.Transparency = 1

        hb.Anchored = true

        hb.CanCollide = false

        hb.Parent = workspace

        local hitDetected = {}

        local t = 0

        while t < duration do

            hb.CFrame = RootPart.CFrame*CFrame.new(0,0,-3)

            for _,v in ipairs(workspace:GetPartsInPart(hb)) do

                local h = v.Parent:FindFirstChild("Humanoid")

                if h and v.Parent ~= Character and not hitDetected[v.Parent] then

                    hitDetected[v.Parent] = true

                    PlaySound(Sounds.Hit,5)

                end

            end

            t += RunService.RenderStepped:Wait()

        end

        hb:Destroy()

    else

        task.wait(duration or AnimLength(anim))

    end

    -- Dash M1 saat Raging Pace (T Mode)

    if name=="M1" and TModeActive then

        local dir = Humanoid.MoveDirection

        if dir.Magnitude>0 then

            local dashDistance = 15

            local dashTime = 0.15

            local startPos = RootPart.Position

            local targetPos = startPos + dir.Unit*dashDistance

            local t = 0

            while t<dashTime do

                RootPart.CFrame = CFrame.new(startPos:Lerp(targetPos,t/dashTime))

                t += RunService.RenderStepped:Wait()

            end

        end

    end

    -- Cancel TMode untuk E/M1 setelah anim selesai

    if name=="E" or name=="M1" then

        TryCancelTMode()

    end

    if not allowMove then Unblock() end

    UsingSkill = false

    SetCooldown(name, cd)

end

------------------------------------------------

-- MODIFIED GASHING WOUND (INSTANT ANIM 2)

------------------------------------------------

local function GAttack()

    if not CanUseSkill("Gashing Wound") then return end

    UsingSkill = true

    Block()

    -- Animasi pertama

    Play(Animations[6], false)

    PlaySound(Sounds.GMiss,9)

    -- Langsung cek target tanpa menunggu anim pertama selesai

    local target = GetTarget()

    if target then

        StickToTarget(target,0.3)

        Play(Animations[7], false) -- Animasi kedua langsung

        PlaySound(Sounds.G,10)

        task.wait(AnimLength(Animations[7]))

    else

        PlaySound(Sounds.GMiss,9)

    end

    Unblock()

    UsingSkill = false

    SetCooldown("Gashing Wound",3)

end

------------------------------------------------

-- MODIFIED EBEHEAD (upgrade)

------------------------------------------------

local function EBehead()

    if not CanUseSkill("Behead") then return end

    UsingSkill = true

    local anim = Animations[17]

    Play(anim,false)

    PlaySound(Sounds.E,6)

    task.wait(AnimLength(anim)) -- pakai durasi animasi asli

    UsingSkill = false

    SetCooldown("Behead",5)

    PlayMovementState()

end

------------------------------------------------

-- OTHER SKILLS

------------------------------------------------

local function Stun()

    UsingSkill=true

    Block()

    Play(Animations[14],false)

    PlaySound(Sounds.F,6)

    task.wait(AnimLength(Animations[14]))

    Play(Animations[13],true)

    task.wait(3)

    Play(Animations[12],false)

    task.wait(AnimLength(Animations[12]))

    Play(IdleKF,true)

    Unblock()

    UsingSkill=false

    SetCooldown("Stun",5)

end

local function QKill() SkillAction("Kill",Animations[1],Sounds.Q,nil,AnimLength(Animations[1]),3,false) Play(IdleKF,true) end

local function ROutro() SkillAction("Outro",Animations[11],Sounds.R,nil,AnimLength(Animations[11]),5,false) Play(IdleKF,true) end

local function TRagingPace() Transform() end

local function HKillGuest() SkillAction("Kill Guest",Animations[16],Sounds.H,nil,AnimLength(Animations[16]),3,false) Play(IdleKF,true) end

local function M1Skill() SkillAction("M1",Animations[4],Sounds.M1,nil,0.4,1,true,true) PlayMovementState() end

local function Intro() SkillAction("Intro",IntroAnim,Sounds.X,nil,AnimLength(IntroAnim),5,false) Play(IdleKF,true) end

------------------------------------------------

-- MOVEMENT LOOP

------------------------------------------------

local lastMoveAnim=nil

RunService.RenderStepped:Connect(function()

    local moving=Humanoid.MoveDirection.Magnitude>0

    local nextAnim

    if moving then

        if RunMode and RunKF then nextAnim=RunKF else nextAnim=WalkKF end

    else

        nextAnim=IdleKF

    end

    if UsingSkill then

        if currentAnim==IdleKF and nextAnim and nextAnim~=lastMoveAnim then

            lastMoveAnim=nextAnim

            Play(nextAnim,true)

        end

    else

        if nextAnim and nextAnim~=lastMoveAnim then

            lastMoveAnim=nextAnim

            Play(nextAnim,true)

        end

    end

end)

------------------------------------------------

-- INPUT

------------------------------------------------

UserInputService.InputBegan:Connect(function(input,gp)

    if gp then return end

    if input.KeyCode==Enum.KeyCode.LeftShift then

        RunMode=not RunMode

        Unblock()

    end

    if input.KeyCode==Enum.KeyCode.T then TRagingPace() end

    if input.KeyCode==Enum.KeyCode.G then GAttack() end

    if input.KeyCode==Enum.KeyCode.F then Stun() end

    if input.KeyCode==Enum.KeyCode.Q then QKill() end

    if input.KeyCode==Enum.KeyCode.E then EBehead() end

    if input.KeyCode==Enum.KeyCode.R then ROutro() end

    if input.KeyCode==Enum.KeyCode.H then HKillGuest() end

    if input.KeyCode==Enum.KeyCode.X then Intro() end

    if input.UserInputType==Enum.UserInputType.MouseButton1 then M1Skill() end

end)

------------------------------------------------

-- MOBILE UI

------------------------------------------------

if UserInputService.TouchEnabled then

    if Player.PlayerGui:FindFirstChild("MobileSkillUI") then

        Player.PlayerGui.MobileSkillUI:Destroy()

    end

    local gui=Instance.new("ScreenGui")

    gui.Name="MobileSkillUI"

    gui.ResetOnSpawn=false

    gui.Parent=Player.PlayerGui

    local function MakeButton(text,xOffset,yOffset,callback,skillName)

        local btn=Instance.new("TextButton")

        btn.Size=UDim2.new(0,60,0,60)

        btn.Position=UDim2.new(1,xOffset,1,yOffset)

        btn.AnchorPoint=Vector2.new(1,1)

        btn.BackgroundTransparency=0.3

        btn.BackgroundColor3=Color3.fromRGB(30,30,30)

        btn.TextColor3=Color3.new(1,1,1)

        btn.TextScaled=true

        btn.Text=text

        btn.Parent=gui

        local corner=Instance.new("UICorner",btn)

        corner.CornerRadius=UDim.new(1,0)

        btn.Activated:Connect(callback)

        if skillName then MobileButtons[skillName]=btn end

    end

    local x=-10

    MakeButton("RUN",x,-10,function() RunMode=not RunMode Unblock() end)

    MakeButton("G\nGashing Wound",x-70,-10,GAttack,"Gashing Wound")

    MakeButton("T\nRaging Pace",x-140,-10,TRagingPace)

    MakeButton("F\nStun",x-210,-10,Stun,"Stun")

    MakeButton("Q\nKill",x,-80,QKill,"Kill")

    MakeButton("E\nBehead",x-70,-80,EBehead,"Behead")

    MakeButton("R\nOutro",x-140,-80,ROutro,"Outro")

    MakeButton("H\nKill Guest",x-210,-80,HKillGuest,"Kill Guest")

    MakeButton("X\nIntro",x-280,-10,Intro,"Intro")

    MakeButton("M1",x-280,-80,M1Skill,"M1")

end
local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {

    Title = "MADE BY FANCY",

    Text = "kiki mama",

    Duration = 5,

    Icon = "rbxassetid://101297422645108"

})