ui = loadstring(game:HttpGet("https://api.getpolsec.com/api/v1/ui.lua"))()
script_key = ui("613a0e0a9d918cfa2742ce4aeb5a1ac2d46e81cf5c0d2f2a3ca419151ab2dcbd")
local autoreload=true
local RunService=game:GetService("RunService")
local VirtualInputManager=game:GetService("VirtualInputManager")
local Players=game:GetService("Players")
local UserInputService=game:GetService("UserInputService")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local Workspace=game:GetService("Workspace")
local player=Players.LocalPlayer
local Camera=Workspace.CurrentCamera
local MainEvent=ReplicatedStorage:WaitForChild("MainEvent")

local TOOLS={"[Revolver]","[DoubleBarrel]","[TacticalShotgun]","[SMG]","[Shotgun]","[Silencer]"}
local lastReload={}
local reloadCd=0.4

if _G._AutoReloadConnection then
    _G._AutoReloadConnection:Disconnect()
    _G._AutoReloadConnection=nil
end

if autoreload then
    _G._AutoReloadConnection=RunService.RenderStepped:Connect(function()
        local c=player.Character
        if not c then return end
        for _,n in ipairs(TOOLS) do
            local t=c:FindFirstChild(n)
            if t and (not lastReload[n] or tick()-lastReload[n]>=reloadCd) then
                local s=t:FindFirstChild("Script")
                local a=s and s:FindFirstChild("Ammo")
                if a and a:IsA("IntValue") and a.Value==0 then
                    lastReload[n]=tick()
                    VirtualInputManager:SendKeyEvent(true,Enum.KeyCode.R,false,nil)
                    VirtualInputManager:SendKeyEvent(false,Enum.KeyCode.R,false,nil)
                end
            end
        end
    end)
end

local TracerColor=Color3.fromRGB(255,0,255)
local MaxAutoShootDistance=200
local AutoShoot=true
local Target=nil
local Targeting=false

local TracerFrom=Drawing.new("Circle")
TracerFrom.Visible=false
TracerFrom.Color=TracerColor
TracerFrom.Thickness=2
TracerFrom.Filled=false
TracerFrom.NumSides=30
TracerFrom.Radius=7

local TracerTo=Drawing.new("Circle")
TracerTo.Visible=false
TracerTo.Color=TracerColor
TracerTo.Thickness=2
TracerTo.Filled=false
TracerTo.NumSides=30
TracerTo.Radius=7

local TracerLine=Drawing.new("Line")
TracerLine.Visible=false
TracerLine.Color=TracerColor
TracerLine.Thickness=2

local effectCooldown=0
local effectGui=Instance.new("BillboardGui")
effectGui.Size=UDim2.fromScale(3,3)
effectGui.LightInfluence=0
effectGui.AlwaysOnTop=true
effectGui.Enabled=false

local img=Instance.new("ImageLabel",effectGui)
img.BackgroundTransparency=1
img.Image="rbxassetid://1095708"
img.ImageColor3=Color3.fromRGB(255,0,255)
img.ImageTransparency=0.35
img.Size=UDim2.fromScale(1,1)

effectGui.Parent=Workspace

local function PlayEffectAt(pos)
    if tick()-effectCooldown<0.15 then return end
    effectCooldown=tick()
    effectGui.Enabled=true
    effectGui:SetAttribute("worldpos",pos)
    task.spawn(function()
        local st=tick()
        while tick()-st<0.15 do
            local p=effectGui:GetAttribute("worldpos")
            if p then effectGui.StudsOffsetWorldSpace=p end
            task.wait()
        end
        effectGui.Enabled=false
    end)
end

local function ResolveTarget(hrp)
    return hrp.Position+hrp.Velocity*0.065
end

local function LockTarget()
    local closest=nil
    local best=math.huge
    local m=UserInputService:GetMouseLocation()
    for _,plr in ipairs(Players:GetPlayers()) do
        if plr~=player and plr.Character then
            local hrp=plr.Character:FindFirstChild("HumanoidRootPart")
            local hum=plr.Character:FindFirstChild("Humanoid")
            local ff=plr.Character:FindFirstChildOfClass("ForceField")
            if hrp and hum and hum.Health>0 and not ff then
                local scr=Camera:WorldToViewportPoint(hrp.Position)
                local dist=(Vector2.new(scr.X,scr.Y)-m).Magnitude
                if dist<best then
                    best=dist
                    closest=plr
                end
            end
        end
    end
    Target=closest
end

local function ShootAt(t)
    if not Targeting then return end
    if not t or not t.Character then return end
    local hrp=t.Character:FindFirstChild("HumanoidRootPart")
    local ff=t.Character:FindFirstChildOfClass("ForceField")
    if ff then return end
    local myHRP=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hrp or not myHRP then return end
    local dist=(myHRP.Position-hrp.Position).Magnitude
    if dist>MaxAutoShootDistance then return end
    local pos=ResolveTarget(hrp)
    PlayEffectAt(pos)
    local args={
        "Shoot",
        {
            {
                {Normal=pos,Instance=hrp,Position=pos},
                {Normal=pos,Instance=hrp,Position=pos},
                {Normal=pos,Instance=hrp,Position=pos},
                {Normal=pos,Instance=hrp,Position=pos},
                {Normal=pos,Instance=hrp,Position=pos}
            },
            {
                {thePart=hrp,theOffset=Vector3.new()},
                {thePart=hrp,theOffset=Vector3.new()},
                {thePart=hrp,theOffset=Vector3.new()},
                {thePart=hrp,theOffset=Vector3.new()},
                {thePart=hrp,theOffset=Vector3.new()}
            },
            myHRP.Position,
            myHRP.Position,
            Workspace:GetServerTimeNow()
        }
    }
    pcall(function()
        MainEvent:FireServer(unpack(args))
    end)
end

UserInputService.InputBegan:Connect(function(i,g)
    if g then return end
    if i.KeyCode==Enum.KeyCode.C then
        Targeting=not Targeting
        if Targeting then
            LockTarget()
        else
            Target=nil
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if Targeting and Target and Target.Character and Target.Character:FindFirstChild("HumanoidRootPart") then
        local myHRP=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not myHRP then
            TracerLine.Visible=false
            TracerFrom.Visible=false
            TracerTo.Visible=false
            return
        end
        local hrp=Target.Character.HumanoidRootPart
        local ff=Target.Character:FindFirstChildOfClass("ForceField")
        if ff then
            TracerLine.Visible=false
            TracerFrom.Visible=false
            TracerTo.Visible=false
            return
        end

        local p1=Camera:WorldToViewportPoint(myHRP.Position)
        local p2=Camera:WorldToViewportPoint(hrp.Position)

        TracerFrom.Position=Vector2.new(p1.X,p1.Y)
        TracerTo.Position=Vector2.new(p2.X,p2.Y)
        TracerLine.From=Vector2.new(p1.X,p1.Y)
        TracerLine.To=Vector2.new(p2.X,p2.Y)

        TracerLine.Visible=true
        TracerFrom.Visible=true
        TracerTo.Visible=true

        if AutoShoot then
            ShootAt(Target)
        end
    else
        TracerLine.Visible=false
        TracerFrom.Visible=false
        TracerTo.Visible=false
    end
end)
