local AREA_THICKNESS = 0.5
local OUTER_TRANSPARENCY = 0.18
local INNER_TRANSPARENCY = 0.9
local AREA_COLOR = Color3.fromRGB(255, 255, 255)

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Stats = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local lastTarget = nil
local ballProcessed = false
local lastProcessReset = 0 
local smoothedPing = 0.05
local lastVisualUpdate = 0
local ManualSpamActive = false 

local ClashState = {
    Active = false,
    LastActivationTime = 0,
    DecayTime = 0.5,
    MinDistance = 40,
    CriticalDistance = 20,
    IsBursting = false,
    CurrentOpponent = nil
}

local Cache = {
    Character = nil,
    RootPart = nil,
    Ball = nil
}

local function setupCharacter(character)
    if not character then return end
    Cache.Character = character
    Cache.RootPart = character:WaitForChild("HumanoidRootPart", 10)
    ballProcessed = false
end

LocalPlayer.CharacterAdded:Connect(setupCharacter)
setupCharacter(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())

local BallSync = { RealPosition = Vector3.new(0,0,0), Speed = 0, TargetID = -999, PreviousTargetID = -999 }
local Config = {
    activationDistanceOffset = 7,
    enableAuraLogic = true,
    enableAuraVisual = true,
    manualPingOffset = 0.045,
    clashSpamThreshold = 0.95, 
    clashBurstRate = 15,
    processResetInterval = 0.4
}

local TS_Folder = ReplicatedStorage:WaitForChild("TS", 10)
local NetRemotes = TS_Folder and TS_Folder:WaitForChild("GeneratedNetworkRemotes", 10)
local parryRemote = NetRemotes and NetRemotes:FindFirstChild("RE_4.6848415795802784e+76")
local touchTapEvent = ReplicatedStorage:FindFirstChild("TouchTap")
local ballSyncRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("BallSyncData")

local function performClashSpam()
    if ClashState.IsBursting or not Cache.RootPart then return end

    ClashState.IsBursting = true
    task.spawn(function()
        for i = 1, Config.clashBurstRate do
            if not ClashState.Active and not ManualSpamActive then break end
            
            if parryRemote then
                parryRemote:FireServer(2.933813859058389e+76, Cache.RootPart.CFrame, (Cache.Ball and Cache.Ball.CFrame or Cache.RootPart.CFrame))
            end
            
            if touchTapEvent then
                touchTapEvent:Fire()
            end
            task.wait()
        end
        ClashState.IsBursting = false
    end)
end

local FloatingGui = Instance.new("ScreenGui", CoreGui)
FloatingGui.Name = "ManualSpamGui"
FloatingGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", FloatingGui)
MainFrame.Size = UDim2.new(0, 140, 0, 90)
MainFrame.Position = UDim2.new(0.5, -70, 0.4, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false 

local Header = Instance.new("TextLabel", MainFrame)
Header.Size = UDim2.new(1, 0, 0, 25)
Header.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Header.Text = "CLASH SPAM"
Header.TextColor3 = Color3.new(1,1,1)
Header.Font = Enum.Font.GothamBold
Header.TextSize = 12

local ToggleBtn = Instance.new("TextButton", MainFrame)
ToggleBtn.Size = UDim2.new(0.8, 0, 0, 35)
ToggleBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ToggleBtn.Text = "OFF"
ToggleBtn.TextColor3 = Color3.new(1,1,1)
ToggleBtn.Font = Enum.Font.GothamBold

local dragging, dragStart, startPos
Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dragStart = input.Position; startPos = MainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)

ToggleBtn.MouseButton1Click:Connect(function()
    ManualSpamActive = not ManualSpamActive
    ToggleBtn.Text = ManualSpamActive and "ON" or "OFF"
    ToggleBtn.BackgroundColor3 = ManualSpamActive and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
end)

local TargetHistory = {}
local function updateClashDetection(newTargetID, currentBallPos)
    local now = tick()
    if newTargetID == lastTarget then return end
    
    BallSync.PreviousTargetID = lastTarget
    lastTarget = newTargetID
    ballProcessed = false 

    if not Cache.RootPart then return end
    local dist = (Cache.RootPart.Position - currentBallPos).Magnitude

    table.insert(TargetHistory, 1, {id = newTargetID, t = now})
    if #TargetHistory > 6 then table.remove(TargetHistory) end

    if #TargetHistory >= 3 then
        local timeGap = TargetHistory[1].t - TargetHistory[3].t
        local isAlternating = (TargetHistory[1].id == LocalPlayer.UserId and TargetHistory[3].id == LocalPlayer.UserId)
        
        if isAlternating and timeGap < 0.6 and dist < ClashState.MinDistance then
            ClashState.Active = true
            ClashState.LastActivationTime = now
            ClashState.CurrentOpponent = TargetHistory[2].id
        end
    end

    if newTargetID == LocalPlayer.UserId and dist < ClashState.CriticalDistance then
        ClashState.Active = true
        ClashState.LastActivationTime = now
    end
end

local function createAura(name)
    local p = Instance.new("Part", Workspace)
    p.Name = name; p.Shape = Enum.PartType.Ball; p.Material = Enum.Material.ForceField
    p.Anchored = true; p.CanCollide = false; p.Transparency = 1; p.Color = AREA_COLOR
    return p
end
local outer = createAura("AuraOuter"); local inner = createAura("AuraInner")

ballSyncRemote.OnClientEvent:Connect(function(data)
    if typeof(data) == "table" then
        BallSync.RealPosition = data.RealPosition or BallSync.RealPosition
        BallSync.Speed = typeof(data.Speed) == "number" and data.Speed or (data.Speed and data.Speed.Magnitude or 0)
        if data.TargetPlayerID then
            updateClashDetection(data.TargetPlayerID, BallSync.RealPosition)
            BallSync.TargetID = data.TargetPlayerID
        end
    end
end)

RunService.RenderStepped:Connect(function()
    local now = tick()
    
    if not Cache.RootPart or not Cache.Ball then 
        Cache.Ball = Workspace:FindFirstChild("GameBall")
        return 
    end
    
    local distance = (Cache.RootPart.Position - (BallSync.RealPosition ~= Vector3.zero and BallSync.RealPosition or Cache.Ball.Position)).Magnitude
    
    if ClashState.Active then
        if BallSync.TargetID ~= LocalPlayer.UserId and BallSync.TargetID ~= ClashState.CurrentOpponent then
             ClashState.Active = false
        end
        if distance > ClashState.MinDistance + 10 then
            ClashState.Active = false
        end
    end

    if ManualSpamActive or (ClashState.Active and BallSync.TargetID == LocalPlayer.UserId) then
        performClashSpam()
    elseif Config.enableAuraLogic and BallSync.TargetID == LocalPlayer.UserId then
        local rawPing = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
        smoothedPing = (smoothedPing * 0.8) + (rawPing * 0.2)
        
        local timeToReach = distance / math.max(BallSync.Speed, 1)
        local normalThreshold = math.clamp(0.12 + (smoothedPing * 1.05) + Config.manualPingOffset, 0.05, 0.55)

        if timeToReach <= normalThreshold and not ballProcessed then
            if parryRemote then parryRemote:FireServer(2.933813859058389e+76, Cache.RootPart.CFrame, Cache.Ball.CFrame) end
            if touchTapEvent then touchTapEvent:Fire() end
            ballProcessed = true
            lastProcessReset = now
        end
    end

    if ballProcessed and (now - lastProcessReset) >= Config.processResetInterval then ballProcessed = false end
    if ClashState.Active and (now - ClashState.LastActivationTime) > ClashState.DecayTime then ClashState.Active = false end

    if Config.enableAuraVisual and (now - lastVisualUpdate) > 0.015 then
        lastVisualUpdate = now
        local isAnySpam = (ClashState.Active or ManualSpamActive)
        local vSize = (math.max(BallSync.Speed, 45) * 0.22) + Config.activationDistanceOffset
        outer.CFrame = Cache.RootPart.CFrame; inner.CFrame = Cache.RootPart.CFrame
        outer.Size = Vector3.new(vSize*2, vSize*2, vSize*2); inner.Size = Vector3.new((vSize-0.4)*2, (vSize-0.4)*2, (vSize-0.4)*2)
        outer.Color = outer.Color:Lerp(isAnySpam and Color3.new(1,0.2,0.2) or AREA_COLOR, 0.3)
        outer.Transparency = OUTER_TRANSPARENCY; inner.Transparency = INNER_TRANSPARENCY
    else
        outer.Transparency = 1; inner.Transparency = 1
    end
end)

local Tekscripts = loadstring(game:HttpGet("https://raw.githubusercontent.com/TekScripts/TekUix/refs/heads/main/src/main.lua"))()
local gui = Tekscripts.new({ Name = "Tkst | Phantom V2.3", FloatText = "abrir", startTab = "mainTab", Transparent = true })
local mainTab = gui:CreateTab({ Title = "Combat", Icon = "shield" })

gui:CreateToggle(mainTab, { Text = "Show Manual Spam", InitialValue = false, Callback = function(v) MainFrame.Visible = v end })
gui:CreateToggle(mainTab, { Text = "Auto Parry", InitialValue = true, Callback = function(v) Config.enableAuraLogic = v end })
gui:CreateToggle(mainTab, { Text = "Aura Visual", InitialValue = true, Callback = function(v) Config.enableAuraVisual = v end })
