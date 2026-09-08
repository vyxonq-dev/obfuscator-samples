--[[
	Prison Life Hub - WindUI Integrated Script
]]
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ==============================================================
-- 🛡️ [ نظام تزوير الـ Metatable لحماية السيرفر ]
-- ==============================================================
pcall(function()
    if getrawmetatable and setreadonly then
        local rawMeta = getrawmetatable(game)
        local oldIndex = rawMeta.__index

        setreadonly(rawMeta, false)
        rawMeta.__index = newcclosure(function(self, key)
            if not checkcaller() then
                if tostring(key) == "WalkSpeed" then return 16 end
                if tostring(key) == "JumpPower" then return 50 end
            end
            return oldIndex(self, key)
        end)
        setreadonly(rawMeta, true)
    end
end)

-- ==============================================================
-- 🎨 [ إضافة الثيم المخصص الخاص بك ]
-- ==============================================================
WindUI:AddTheme({
    Name = "Dark", -- theme name
    Accent = Color3.fromHex("#18181b"),
    Background = Color3.fromHex("#101010"), -- Accent
    Outline = Color3.fromHex("#FFFFFF"),
    Text = Color3.fromHex("#FFFFFF"),
    Placeholder = Color3.fromHex("#7a7a7a"),
    Button = Color3.fromHex("#52525b"),
    Icon = Color3.fromHex("#a1a1aa"),
})

-- ==============================================================
-- 🪟 [ إنشاء النافذة بإعداداتك الخاصة ]
-- ==============================================================
local Window = WindUI:CreateWindow({
    Title   = "Prison Life Hub",
    Author  = "by you",
    Folder  = "myhub",
    Icon    = "paint-bucket",
    Theme   = "Dark",
    Acrylic = true,
    Transparent = true,
    Background = "rbxassetid://84152360484913",
    Size    = UDim2.fromOffset(680, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    ToggleKey  = Enum.KeyCode.RightShift,
    Resizable  = true,
    AutoScale  = true,
    NewElements = true,
    BackgroundImageTransparency = 0.65,
    HideSearchBar = false,
    ScrollBarEnabled = false,
    SideBarWidth = 200,
    Topbar = {
        Height      = 44,
        ButtonsType = "Default",
    },
    OpenButton = {
        Title = "My Hub",
        Icon = "zap",
        CornerRadius = UDim.new(1, 0),
        StrokeThickness = 3,
        Enabled = true,
        Draggable = true,
        OnlyMobile = false,
        Scale = 1,
        Color = ColorSequence.new(
            Color3.fromHex("#000000"),
            Color3.fromHex("#000000")
        ),
    },
    User = {
        Enabled  = true,
        Anonymous = false,
        Callback = function()
            print("user panel clicked")
        end,
    },
})

-- ==============================================================
-- 📍 [ 1. تبويب التنقلات (Teleports Tab - بـ Tween) ]
-- ==============================================================
local TeleportTab = Window:Tab({
    Title = "التنقلات",
    Icon = "navigation"
})

local TweenSpeed = 100
local points = {
    Entrance   = Vector3.new(465, 98, 2250), -- 1. مدخل السجن (points = 20)
    PoliceRoom = Vector3.new(837, 99, 2270), -- 2. غرفة الشرطة (points = 49)
    Yard       = Vector3.new(779, 98, 2458), -- 3. ساحة السجن (points = 17)
    Cafeteria  = Vector3.new(960, 98, 2280), -- 4. كفتيريا السجن (points = 61)
    GangBase   = Vector3.new(-943, 94, 2063) -- 5. منطقة العصابة (points = 36)
}

local function TweenTo(targetPos)
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    local distance = (hrp.Position - targetPos).Magnitude
    local duration = distance / TweenSpeed

    local tween = TweenService:Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPos)})
    tween:Play()
end

TeleportTab:Section({ Title = "الأماكن المتاحة" })

TeleportTab:Button({ Title = "مدخل السجن (Entrance)", Callback = function() TweenTo(points.Entrance) end })
TeleportTab:Button({ Title = "غرفة الشرطة (Police Room)", Callback = function() TweenTo(points.PoliceRoom) end })
TeleportTab:Button({ Title = "ساحة السجن (Yard)", Callback = function() TweenTo(points.Yard) end })
TeleportTab:Button({ Title = "كفتيريا السجن (Cafeteria)", Callback = function() TweenTo(points.Cafeteria) end })
TeleportTab:Button({ Title = "منطقة العصابة (Gang Base)", Callback = function() TweenTo(points.GangBase) end })

TeleportTab:Section({ Title = "إعدادات السرعة" })
TeleportTab:Slider({
    Title = "سرعة الـ Tween",
    Value = { Min = 30, Max = 300, Default = 100 },
    Callback = function(val) TweenSpeed = val end
})

-- ==============================================================
-- ⚙️ [ 2. تبويب أخرى (Other Tab) ]
-- ==============================================================
local OtherTab = Window:Tab({
    Title = "أخرى",
    Icon = "sliders"
})

-- ⚡ [ الحركة والسرعة والقفز ]
OtherTab:Section({ Title = "الحركة والسرعة" })

local CustomSpeed = 16
local CustomJumpPower = 50
local SpeedEnabled = false

RunService.RenderStepped:Connect(function()
    if SpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
        if hum and hum.MoveDirection.Magnitude > 0 then
            LocalPlayer.Character:TranslateBy(hum.MoveDirection * (CustomSpeed / 50))
        end
    end
end)

OtherTab:Toggle({
    Title = "تفعيل السرعة المخصصة (CFrame Speed)",
    Callback = function(state) SpeedEnabled = state end
})

OtherTab:Slider({
    Title = "مستوى السرعة",
    Value = { Min = 16, Max = 150, Default = 16 },
    Callback = function(val) CustomSpeed = val end
})

OtherTab:Slider({
    Title = "قوة القفز (Jump Power)",
    Value = { Min = 50, Max = 300, Default = 50 },
    Callback = function(val)
        CustomJumpPower = val
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = CustomJumpPower
        end
    end
})

local InfJumpEnabled = false
UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

OtherTab:Toggle({
    Title = "قفز لا نهائي (Infinite Jump)",
    Callback = function(state) InfJumpEnabled = state end
})

-- ✈️ [ الطيران واختراق الجدران ]
OtherTab:Section({ Title = "الطيران واختراق الجدران" })

local Flying = false
local FlySpeed = 50
local BodyVel, BodyGyro

OtherTab:Toggle({
    Title = "تفعيل الطيران (Fly)",
    Callback = function(state)
        Flying = state
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local hrp = char.HumanoidRootPart

        if Flying then
            BodyVel = Instance.new("BodyVelocity", hrp)
            BodyVel.MaxForce = Vector3.new(1e9, 1e9, 1e9)
            BodyGyro = Instance.new("BodyGyro", hrp)
            BodyGyro.MaxTorque = Vector3.new(1e9, 1e9, 1e9)

            task.spawn(function()
                while Flying do
                    local camCF = Camera.CFrame
                    local moveDir = Vector3.zero
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + camCF.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - camCF.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - camCF.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + camCF.RightVector end
                    
                    BodyVel.Velocity = moveDir * FlySpeed
                    BodyGyro.CFrame = camCF
                    RunService.RenderStepped:Wait()
                end
            end)
        else
            if BodyVel then BodyVel:Destroy() end
            if BodyGyro then BodyGyro:Destroy() end
        end
    end
})

OtherTab:Slider({
    Title = "سرعة الطيران (Fly Speed)",
    Value = { Min = 20, Max = 250, Default = 50 },
    Callback = function(val) FlySpeed = val end
})

local NoclipEnabled = false
RunService.Stepped:Connect(function()
    if NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

OtherTab:Toggle({
    Title = "اختراق الجدران (Noclip)",
    Callback = function(state) NoclipEnabled = state end
})

-- 🎯 [ FOV والتصويب وفحص الفريق ]
OtherTab:Section({ Title = "التصويب وفحص الفريق" })

local SilentAimEnabled = false
local FOVRadius = 150
local FOVCircle

pcall(function()
    if Drawing and Drawing.new then
        FOVCircle = Drawing.new("Circle")
        FOVCircle.Color = Color3.fromRGB(255, 0, 0)
        FOVCircle.Thickness = 2
        FOVCircle.NumSides = 60
        FOVCircle.Radius = FOVRadius
        FOVCircle.Filled = false
        FOVCircle.Visible = false

        RunService.RenderStepped:Connect(function()
            if FOVCircle then
                FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            end
        end)
    end
end)

local function IsTeammate(player)
    if player == LocalPlayer then return true end
    if LocalPlayer.Team ~= nil and player.Team == LocalPlayer.Team then
        return true
    end
    return false
end

local function GetClosestTarget()
    local closestPlayer = nil
    local shortestDistance = FOVRadius

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and not IsTeammate(plr) and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if onScreen then
                local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                if dist < shortestDistance then
                    shortestDistance = dist
                    closestPlayer = plr
                end
            end
        end
    end
    return closestPlayer
end

RunService.RenderStepped:Connect(function()
    if SilentAimEnabled then
        local target = GetClosestTarget()
        if target and target.Character and target.Character:FindFirstChild("Head") then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

OtherTab:Toggle({
    Title = "إظهار دائرة FOV الحمراء",
    Callback = function(state)
        if FOVCircle then FOVCircle.Visible = state end
    end
})

OtherTab:Toggle({
    Title = "تفعيل التصويب (يتجاهل فريقك)",
    Callback = function(state) SilentAimEnabled = state end
})

OtherTab:Slider({
    Title = "حجم دائرة FOV",
    Value = { Min = 50, Max = 400, Default = 150 },
    Callback = function(val)
        FOVRadius = val
        if FOVCircle then FOVCircle.Radius = val end
    end
})

-- 👁️ [ كاشف اللاعبين ESP ]
OtherTab:Section({ Title = "كاشف اللاعبين (ESP)" })

local ESPEnabled = false
local Highlights = {}

OtherTab:Toggle({
    Title = "تفعيل كاشف اللاعبين (ESP)",
    Callback = function(state)
        ESPEnabled = state
        if not ESPEnabled then
            for _, hl in pairs(Highlights) do hl:Destroy() end
            Highlights = {}
        end
    end
})

RunService.RenderStepped:Connect(function()
    if ESPEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and not Highlights[plr] then
                pcall(function()
                    local hl = Instance.new("Highlight")
                    hl.FillColor = IsTeammate(plr) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    hl.Parent = plr.Character
                    Highlights[plr] = hl
                end)
            end
        end
    end
end)

-- ==============================================================
-- 🔧 [ 3. تبويب الإعدادات (Settings Tab - من قالبك) ]
-- ==============================================================
local ThemeTab = Window:Tab({ Title = "Settings", Icon = "settings" })

ThemeTab:Dropdown({
    Title  = "Theme",
    Values = (function()
        local names = {}
        for name in pairs(WindUI:GetThemes()) do
            table.insert(names, name)
        end
        table.sort(names)
        return names
    end)(),
    Value    = WindUI:GetCurrentTheme(),
    Callback = function(selected)
        WindUI:SetTheme(selected)
    end,
})

ThemeTab:Toggle({
    Title = "Acrylic",
    Value = WindUI:GetTransparency(),
    Callback = function()
        local isOn = WindUI.Window.Acrylic
        WindUI:ToggleAcrylic(not isOn)
    end,
})

ThemeTab:Toggle({
    Title = "Transparent",
    Value = WindUI:GetTransparency(),
    Callback = function(state)
        Window:ToggleTransparency(state)
    end
})

local currentKey = Enum.KeyCode.RightShift -- Keybind ToggleUi

ThemeTab:Keybind({
    Title = "Toggle UI Key",
    Value = currentKey,
    Callback = function(v)
        currentKey = (typeof(v) == "EnumItem") and v or Enum.KeyCode[v]
        Window:SetToggleKey(currentKey)
    end,
})

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == currentKey then
        Window:Toggle()
    end
end)

-- Notify عند التشغيل
WindUI:Notify({
  Title = "Prison Life Hub",
  Content = "Welcome to Prison Life Hub!",
})

WindUI:SetNotificationLower(true)
