
local Players = game:GetService("Players")
local UserInput = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

--// Tải UI Library
local success, UI = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/daucobonhi/UiRedzV5/refs/heads/main/DemoUi.lua"))()
end)
if not success then
    warn("⚠️ Không thể tải UI Library!")
    return
end

local Window = UI:MakeWindow({
    Title = "ThanhLok",
    SubTitle = "By @hnc_hub🚀LongDayNeTroi",
    SaveFolder = "LongHiHi👋"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://345664323455", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(1, 0) }
})

local MainTab = Window:MakeTab({ "Main" })
MainTab:AddSection("Lover")

local isPunching = false
local PunchAnim
local TargetPlayer = nil
local PlayerList = {}

local function RefreshPlayerList()
    PlayerList = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(PlayerList, p.Name)
        end
    end
end
RefreshPlayerList()

local PunchToggle
MainTab:AddDropdown({
    Name = "Chọn Player",
    Options = PlayerList,
    Callback = function(selected)
        TargetPlayer = Players:FindFirstChild(selected)
    end
})

MainTab:AddButton({
    Name = "Làm mới danh sách",
    Callback = function()
        RefreshPlayerList()
        UI:Notification("✅ Đã làm mới danh sách!", 2)
    end
})

local function LoadPunchAnimation()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://148840371"
    PunchAnim = Humanoid:LoadAnimation(anim)
    PunchAnim.Looped = true
end

PunchToggle = MainTab:AddToggle({
    Name = "Dikk",
    Default = false,
    Callback = function(state)
        isPunching = state

        if not TargetPlayer then
            UI:Notification("⚠️ Hãy chọn người chơi trước!", 3)
            PunchToggle:Set(false)
            return
        end

        if isPunching then
            if not PunchAnim then LoadPunchAnimation() end
            PunchAnim:Play()

            task.spawn(function()
                while isPunching and Humanoid and Humanoid.Parent do
                    local char = LocalPlayer.Character
                    if not char then break end

                    local LeftLeg = char:FindFirstChild("Left Leg") or char:FindFirstChild("LeftLowerLeg")
                    local RightLeg = char:FindFirstChild("Right Leg") or char:FindFirstChild("RightLowerLeg")
                    pcall(function()
                        if LeftLeg then LeftLeg.CFrame *= CFrame.Angles(math.rad(-45), 0, 0) end
                        if RightLeg then RightLeg.CFrame *= CFrame.Angles(math.rad(-45), 0, 0) end
                    end)
                    task.wait(0.1)
                end
            end)

            task.spawn(function()
                while isPunching and TargetPlayer and TargetPlayer.Character and LocalPlayer.Character do
                    local targetHRP = TargetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    local myHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

                    if targetHRP and myHRP then
                        myHRP.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 0.8)
                    else
                        break
                    end
                    task.wait(0.03)
                end
            end)

            UI:Notification("✅ Đang đấm đối thủ!", 3)
        else
            if PunchAnim then PunchAnim:Stop() end
            UI:Notification("🛑 Dừng đấm!", 3)
        end
    end
})

MainTab:AddSection("Lonely")

local isDancing = false
local DanceAnim

local function GetRigType()
    return Humanoid.RigType == Enum.HumanoidRigType.R15 and "R15" or "R6"
end

local DanceAnimation = Instance.new("Animation")
DanceAnimation.AnimationId = (GetRigType() == "R15") and "rbxassetid://698251653" or "rbxassetid://72042024"

local function DanceLoop()
    while isDancing do
        if not DanceAnim then
            DanceAnim = Humanoid:LoadAnimation(DanceAnimation)
        end
        DanceAnim:Play()
        DanceAnim:AdjustSpeed(0.7)
        DanceAnim.TimePosition = 0.6
        task.wait(0.3)
        if DanceAnim then
            DanceAnim:Stop()
            DanceAnim:Destroy()
            DanceAnim = nil
        end
    end
end

local DanceToggle = MainTab:AddToggle({
    Name = "SocLok",
    Default = false,
    Callback = function(state)
        isDancing = state
        if isDancing then
            task.spawn(DanceLoop)
            UI:Notification("🎵 Đang nhảy!", 3)
        else
            if DanceAnim then
                DanceAnim:Stop()
                DanceAnim:Destroy()
                DanceAnim = nil
            end
            UI:Notification("🛑 Dừng nhảy!", 3)
        end
    end
})

local ChillObjects = {}
local ChillActive = false

local function EnableChill()
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    Humanoid.PlatformStand = true
    Humanoid.AutoRotate = false

    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(4000, 4000, 4000)
    bv.Velocity = Vector3.zero
    bv.P = 1000
    bv.Parent = hrp
    ChillObjects.BodyVelocity = bv

    local bav = Instance.new("BodyAngularVelocity")
    bav.MaxTorque = Vector3.new(2000, 2000, 2000)
    bav.AngularVelocity = Vector3.new(.5, .2, .5)
    bav.P = 1500
    bav.Parent = hrp
    ChillObjects.BodyAngularVelocity = bav

    ChillActive = true
    UI:Notification("😎 Chill Guy mode bật!", 3)
end

local function DisableChill()
    Humanoid.PlatformStand = false
    Humanoid.AutoRotate = true
    for _, obj in pairs(ChillObjects) do
        if obj then obj:Destroy() end
    end
    ChillObjects = {}
    ChillActive = false
    UI:Notification("🛑 Chill Guy mode tắt!", 3)
end

local ChillToggle = MainTab:AddToggle({
    Name = "chill guy",
    Default = false,
    Callback = function(state)
        if state then EnableChill() else DisableChill() end
    end
})

RunService.Heartbeat:Connect(function()
    if not ChillActive or not ChillObjects.BodyVelocity then return end
    local moveVec = Vector3.new(
        UserInput:IsKeyDown(Enum.KeyCode.D) and 1 or UserInput:IsKeyDown(Enum.KeyCode.A) and -1 or 0,
        UserInput:IsKeyDown(Enum.KeyCode.Space) and 1 or UserInput:IsKeyDown(Enum.KeyCode.LeftControl) and -1 or 0,
        UserInput:IsKeyDown(Enum.KeyCode.W) and -1 or UserInput:IsKeyDown(Enum.KeyCode.S) and 1 or 0
    )

    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local cam = workspace.CurrentCamera
        local moveDir = (cam.CFrame.RightVector * moveVec.X + cam.CFrame.UpVector * moveVec.Y) + cam.CFrame.LookVector * moveVec.Z
        ChillObjects.BodyVelocity.Velocity = (moveVec.Magnitude > 0) and moveDir * 5 or ChillObjects.BodyVelocity.Velocity * 0.85
    end
end)

-- Reset khi chết
LocalPlayer.CharacterAdded:Connect(function(newChar)
    Character = newChar
    Humanoid = newChar:WaitForChild("Humanoid")
end)

Humanoid.Died:Connect(function()
    isPunching = false
    isDancing = false
    DisableChill()

    if PunchAnim then PunchAnim:Stop() end
    if DanceAnim then DanceAnim:Stop() end

    PunchToggle:Set(false)
    DanceToggle:Set(false)
    ChillToggle:Set(false)
end)

