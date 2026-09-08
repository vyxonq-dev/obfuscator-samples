local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Watermark
Library:SetWatermark("Tix Hub (HVH) | By: TIMOHA9399")
Library:Notify("Loading Tix Hub (HVH)", 3)

-- Window
local Window = Library:CreateWindow({
    Title = "Tix Hub | By: TIMOHA9399 | Version: HVH",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

-- Tabs
local Tabs = {
    Main = Window:AddTab("Main"),
    Visual = Window:AddTab("Visual"),
    VisualSpeed = Window:AddTab("Speed"),
    AntiAim = Window:AddTab("Anti-Aim"),
    BunnyHop = Window:AddTab("BunnyHop"),
    Hitbox = Window:AddTab("Hitbox"),
    Exit = Window:AddTab("Exit")
}

-- Anti-Aim
local AntiAimEnabled = false
local BodyYaw = "None"
local OriginalNeckC0 = nil

local function ApplyAntiAim()
    if not AntiAimEnabled or not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or not LocalPlayer.Character:FindFirstChild("Humanoid") then
        return
    end
    local humanoid = LocalPlayer.Character.Humanoid
    local head = LocalPlayer.Character:FindFirstChild("Head")
    local isR6 = humanoid.RigType == Enum.HumanoidRigType.R6

    humanoid.AutoRotate = false
    local neck = LocalPlayer.Character:FindFirstChild("Neck", true)
    if neck and neck:IsA("Motor6D") then
        if not OriginalNeckC0 then OriginalNeckC0 = neck.C0 end
        local upAngle = isR6 and math.rad(-60) or math.rad(-90)
        local downAngle = isR6 and math.rad(60) or math.rad(90)
        if BodyYaw == "Up" then neck.C0 = OriginalNeckC0 * CFrame.Angles(upAngle, 0, 0)
        elseif BodyYaw == "Down" then neck.C0 = OriginalNeckC0 * CFrame.Angles(downAngle, 0, 0)
        else neck.C0 = OriginalNeckC0 end
    end
end

RunService.Heartbeat:Connect(function()
    if AntiAimEnabled then ApplyAntiAim() end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    if not AntiAimEnabled then
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.AutoRotate = true
        local neck = character:FindFirstChild("Neck", true)
        if neck and neck:IsA("Motor6D") and OriginalNeckC0 then
            neck.C0 = OriginalNeckC0
        end
    end
end)

-- BunnyHop
local BunnyHopEnabled = false
local BunnyHopSpeed = 50

RunService.Stepped:Connect(function()
    if BunnyHopEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = LocalPlayer.Character.Humanoid
        if humanoid.MoveDirection.Magnitude > 0 then
            local velocity = humanoid.MoveDirection * BunnyHopSpeed
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(velocity.X, LocalPlayer.Character.HumanoidRootPart.Velocity.Y, velocity.Z)
        end
    end
end)

-- Visual Speed
local VisualSpeedEnabled = false
local VisualSpeedValue = 50

RunService.Stepped:Connect(function()
    if VisualSpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local humanoid = LocalPlayer.Character.Humanoid
        if humanoid.MoveDirection.Magnitude > 0 then
            local velocity = humanoid.MoveDirection * VisualSpeedValue
            LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(velocity.X, LocalPlayer.Character.HumanoidRootPart.Velocity.Y, velocity.Z)
        end
    end
end)

-- Hitbox
local HitboxEnabled = false
local HitboxSize = 1
local OriginalHeadSize = nil
local OriginalHeadTransparency = nil

local function ApplyHitbox()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
        local head = LocalPlayer.Character.Head
        if not OriginalHeadSize then
            OriginalHeadSize = head.Size
            OriginalHeadTransparency = head.Transparency
        end
        if HitboxEnabled then
            head.Size = OriginalHeadSize * math.min(HitboxSize, 5)
            head.Transparency = 1
            head.CanCollide = false
        else
            head.Size = OriginalHeadSize
            head.Transparency = OriginalHeadTransparency
            head.CanCollide = true
        end
    end
end

RunService.Heartbeat:Connect(function()
    if HitboxEnabled then ApplyHitbox() end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    OriginalHeadSize = nil
    OriginalHeadTransparency = nil
    if HitboxEnabled then ApplyHitbox() end
end)

-- SpinBot
local SpinBotEnabled = false
local SpinSpeed = 50
local spinAngle = 0

RunService.Heartbeat:Connect(function(deltaTime)
    if SpinBotEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local root = LocalPlayer.Character.HumanoidRootPart
        spinAngle = spinAngle + (SpinSpeed * deltaTime * math.pi / 180)
        root.CFrame = root.CFrame * CFrame.Angles(0, spinAngle, 0)
    end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    spinAngle = 0
end)

-- Inf Jump
local InfJumpEnabled = false
UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Auto Fire
local AutoFireEnabled = false
RunService.Heartbeat:Connect(function()
    if AutoFireEnabled and LocalPlayer.Character then
        local mouse = LocalPlayer:GetMouse()
        if mouse.Target and mouse.Target.Parent then
            local targetPlayer = Players:GetPlayerFromCharacter(mouse.Target.Parent)
            if targetPlayer and targetPlayer ~= LocalPlayer then
                -- Имитация ЛКМ (стрельба)
                local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then
                    if tool:FindFirstChild("RemoteEvent") then
                        tool.RemoteEvent:FireServer(mouse.Hit.Position)
                    elseif tool:FindFirstChild("Fire") and tool.Fire:IsA("BindableEvent") then
                        tool.Fire:Fire()
                    end
                end
            end
        end
    end
end)

-- Main Tab
local MainTabBox = Tabs.Main:AddLeftGroupbox("Information")
MainTabBox:AddLabel("By: TIMOHA9399\nTix HVH", true)

-- Visual Tab
local VisualTabBox = Tabs.Visual:AddLeftGroupbox("SpinBot Settings")
VisualTabBox:AddToggle("SpinBotToggle", {
    Text = "SpinBot",
    Default = false,
    Callback = function(Value)
        SpinBotEnabled = Value
        SaveManager:Save("SpinBotToggle", Value)
        if not Value then spinAngle = 0 end
    end
})
VisualTabBox:AddSlider("SpinSpeed", {
    Text = "Spin Speed",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        SpinSpeed = Value
        SaveManager:Save("SpinSpeed", Value)
    end
})

-- Inf Jump groupbox
local VisualInfJumpBox = Tabs.Visual:AddRightGroupbox("Inf Jump")
VisualInfJumpBox:AddToggle("InfJumpToggle", {
    Text = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        InfJumpEnabled = Value
        SaveManager:Save("InfJumpToggle", Value)
    end
})

-- Auto Fire groupbox
local VisualAutoFireBox = Tabs.Visual:AddRightGroupbox("Auto Fire")
VisualAutoFireBox:AddToggle("AutoFireToggle", {
    Text = "Auto Fire",
    Default = false,
    Callback = function(Value)
        AutoFireEnabled = Value
        SaveManager:Save("AutoFireToggle", Value)
    end
})

-- Speed Tab
local VisualSpeedTabBox = Tabs.VisualSpeed:AddLeftGroupbox("Speed Settings")
VisualSpeedTabBox:AddSlider("VisualSpeedValue", {
    Text = "Speed",
    Default = 50,
    Min = 10,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        VisualSpeedValue = Value
        SaveManager:Save("VisualSpeedValue", Value)
    end
})
VisualSpeedTabBox:AddToggle("VisualSpeedToggle", {
    Text = "Set",
    Default = false,
    Callback = function(Value)
        VisualSpeedEnabled = Value
        SaveManager:Save("VisualSpeedToggle", Value)
    end
})

-- Anti-Aim Tab
local AntiAimTabBox = Tabs.AntiAim:AddLeftGroupbox("Anti-Aim Settings")
AntiAimTabBox:AddLabel("Yaw")
AntiAimTabBox:AddDropdown("BodyYaw", {
    Values = {"Up", "Down", "None"},
    Default = 3,
    Multi = false,
    Text = "Body Yaw",
    Callback = function(Value)
        BodyYaw = Value
        SaveManager:Save("BodyYaw", Value)
    end
})
AntiAimTabBox:AddToggle("AntiAimToggle", {
    Text = "Enable Anti-Aim",
    Default = false,
    Callback = function(Value)
        AntiAimEnabled = Value
        SaveManager:Save("AntiAimToggle", Value)
    end
})

-- BunnyHop Tab
local BunnyHopTabBox = Tabs.BunnyHop:AddLeftGroupbox("BunnyHop Settings")
BunnyHopTabBox:AddSlider("BunnyHopSpeed", {
    Text = "Speed",
    Default = 50,
    Min = 10,
    Max = 100,
    Rounding = 0,
    Callback = function(Value)
        BunnyHopSpeed = Value
        SaveManager:Save("BunnyHopSpeed", Value)
    end
})
BunnyHopTabBox:AddToggle("BunnyHopToggle", {
    Text = "BunnyHop",
    Default = false,
    Callback = function(Value)
        BunnyHopEnabled = Value
        SaveManager:Save("BunnyHopToggle", Value)
    end
})

-- Hitbox Tab
local HitboxTabBox = Tabs.Hitbox:AddLeftGroupbox("Hitbox Settings")
HitboxTabBox:AddSlider("HitboxSize", {
    Text = "Hitbox Size",
    Default = 1,
    Min = 1,
    Max = 5,
    Rounding = 1,
    Callback = function(Value)
        HitboxSize = Value
        SaveManager:Save("HitboxSize", Value)
        ApplyHitbox()
    end
})
HitboxTabBox:AddToggle("HitboxToggle", {
    Text = "Set Hitbox",
    Default = false,
    Callback = function(Value)
        HitboxEnabled = Value
        SaveManager:Save("HitboxToggle", Value)
        ApplyHitbox()
    end
})

-- Exit Tab
local ExitTabBox = Tabs.Exit:AddLeftGroupbox("Exit")
ExitTabBox:AddButton({
    Text = "Exit",
    Func = function()
        Library:Unload()
    end
})
ExitTabBox:AddLabel("By: TIMOHA9399")

-- Save & Theme
SaveManager:SetLibrary(Library)
ThemeManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs.Main)
ThemeManager:ApplyToTab(Tabs.Main)
SaveManager:LoadAutoloadConfig()
