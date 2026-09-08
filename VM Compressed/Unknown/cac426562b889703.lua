-- Universal Troll | Float + Wall Walk

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer

-- ========== SETTINGS ==========
local flySpeed = 52
local flingPower = 18000

local buttonPositions = {
    CFrame.new(-78.26, 146.50, -81.10),
    CFrame.new(-45.66, 146.11, -80.96),
    CFrame.new(-34.29, 146.64, -82.58),
    CFrame.new(-24.63, 146.64, -82.31),
    CFrame.new(-12.5, 146.5, -81.5),
    CFrame.new(5, 146.5, -80),
}

-- ========== STATES ==========
local states = {
    Fly = false,
    Float = false,
    WallWalk = false,
    Noclip = false,
    Fling = false,
    AutoTP = false,
    AutoPress = false,
}

local connections = {}
local currentButtonIndex = 1
local minimized = false

-- ========== UTILS ==========
local function getRoot()
    local char = lp.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

local function getHum()
    local char = lp.Character
    return char and char:FindFirstChildOfClass("Humanoid")
end

local function getChar()
    return lp.Character
end

-- ========== FLY ==========
local function toggleFly(on)
    states.Fly = on
    local root = getRoot()
    local hum = getHum()
    if not root or not hum then return end

    if on then
        hum.PlatformStand = true
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyBV"
        bv.MaxForce = Vector3.new(50000, 50000, 50000)
        bv.Velocity = Vector3.zero
        bv.Parent = root

        local bg = Instance.new("BodyGyro")
        bg.Name = "FlyBG"
        bg.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
        bg.P = 4000
        bg.Parent = root

        connections.Fly = RunService.RenderStepped:Connect(function()
            if not states.Fly or not root.Parent then return end
            local cam = workspace.CurrentCamera
            local move = hum.MoveDirection
            local velocity = Vector3.zero

            if move.Magnitude > 0.05 then
                local look = Vector3.new(cam.CFrame.LookVector.X, 0, cam.CFrame.LookVector.Z)
                local right = Vector3.new(cam.CFrame.RightVector.X, 0, cam.CFrame.RightVector.Z)
                if look.Magnitude > 0 then look = look.Unit end
                if right.Magnitude > 0 then right = right.Unit end
                velocity = (look * -move.Z + right * move.X) * flySpeed
            end

            if UserInputService:IsKeyDown(Enum.KeyCode.Space) or hum.Jump then
                velocity = velocity + Vector3.new(0, flySpeed, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                velocity = velocity + Vector3.new(0, -flySpeed, 0)
            end

            bv.Velocity = velocity
            bg.CFrame = cam.CFrame
        end)
    else
        if connections.Fly then connections.Fly:Disconnect() connections.Fly = nil end
        if root:FindFirstChild("FlyBV") then root.FlyBV:Destroy() end
        if root:FindFirstChild("FlyBG") then root.FlyBG:Destroy() end
        if hum then hum.PlatformStand = false end
    end
end

-- ========== FLOAT ==========
local function toggleFloat(on)
    states.Float = on
    local root = getRoot()
    if not root then return end

    if on then
        if root:FindFirstChild("FloatBV") then root.FloatBV:Destroy() end
        local bv = Instance.new("BodyVelocity")
        bv.Name = "FloatBV"
        bv.MaxForce = Vector3.new(0, math.huge, 0)
        bv.Velocity = Vector3.zero
        bv.Parent = root
    else
        if root:FindFirstChild("FloatBV") then
            root.FloatBV:Destroy()
        end
    end
end

-- ========== WALL WALK ==========
local function toggleWallWalk(on)
    states.WallWalk = on

    if on then
        pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
        end)
    end
end

-- ========== NOCLIP ==========
local function toggleNoclip(on)
    states.Noclip = on
    local char = getChar()
    if not char then return end

    if on then
        connections.Noclip = RunService.Stepped:Connect(function()
            if not states.Noclip then return end
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end)
    else
        if connections.Noclip then connections.Noclip:Disconnect() connections.Noclip = nil end
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = true
            end
        end
    end
end

-- ========== FLING ==========
local function toggleFling(on)
    states.Fling = on
    local root = getRoot()
    if not root then return end

    if on then
        local bav = Instance.new("BodyAngularVelocity")
        bav.Name = "FlingBAV"
        bav.AngularVelocity = Vector3.new(0, flingPower, 0)
        bav.MaxTorque = Vector3.new(0, math.huge, 0)
        bav.P = 8000
        bav.Parent = root

        connections.Fling = RunService.Heartbeat:Connect(function()
            if not states.Fling or not root.Parent then return end
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local other = plr.Character.HumanoidRootPart
                    if (other.Position - root.Position).Magnitude < 15 then
                        other.AssemblyLinearVelocity = (other.Position - root.Position).Unit * 100 + Vector3.new(0, 50, 0)
                    end
                end
            end
        end)
    else
        if connections.Fling then connections.Fling:Disconnect() connections.Fling = nil end
        if root:FindFirstChild("FlingBAV") then root.FlingBAV:Destroy() end
    end
end

-- ========== AUTO TP + AUTO PRESS ==========
local function toggleAutoTP(on)
    states.AutoTP = on
    if on then
        task.spawn(function()
            while states.AutoTP do
                local root = getRoot()
                if root then
                    root.CFrame = buttonPositions[currentButtonIndex]
                    currentButtonIndex = currentButtonIndex % #buttonPositions + 1
                end
                task.wait(0.32)
            end
        end)
    end
end

local function toggleAutoPress(on)
    states.AutoPress = on
    if on then
        task.spawn(function()
            while states.AutoPress do
                local root = getRoot()
                if root then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and (v:FindFirstChildOfClass("TouchTransmitter") or 
                           string.find(string.lower(v.Name), "button") or 
                           string.find(string.lower(v.Name), "troll") or 
                           string.find(v.Name, "ì¬ë¼ì§ë")) then
                            pcall(function()
                                firetouchinterest(root, v, 0)
                                firetouchinterest(root, v, 1)
                            end)
                        end
                    end
                end
                task.wait(0.18)
            end
        end)
    end
end

-- ========== UI ==========
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UniversalTroll"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() ScreenGui.Parent = game:GetService("CoreGui") end)
if not ScreenGui.Parent then ScreenGui.Parent = lp:WaitForChild("PlayerGui") end

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 260, 0, 420)
Main.Position = UDim2.new(0.04, 0, 0.22, 0)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(60, 60, 80)
Stroke.Thickness = 1
Stroke.Parent = Main

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 32)
TitleBar.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = Main
Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -70, 1, 0)
Title.Position = UDim2.new(0, 12, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Universal Troll"
Title.TextColor3 = Color3.fromRGB(230, 230, 240)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0, 28, 0, 28)
Minimize.Position = UDim2.new(1, -60, 0, 2)
Minimize.BackgroundTransparency = 1
Minimize.Text = "â"
Minimize.TextColor3 = Color3.fromRGB(180, 180, 200)
Minimize.Font = Enum.Font.GothamBold
Minimize.TextSize = 18
Minimize.Parent = TitleBar

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 28, 0, 28)
Close.Position = UDim2.new(1, -30, 0, 2)
Close.BackgroundTransparency = 1
Close.Text = "Ã"
Close.TextColor3 = Color3.fromRGB(255, 90, 90)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Close.Parent = TitleBar

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, 0, 1, -32)
Content.Position = UDim2.new(0, 0, 0, 32)
Content.BackgroundTransparency = 1
Content.Parent = Main

local List = Instance.new("UIListLayout")
List.SortOrder = Enum.SortOrder.LayoutOrder
List.Padding = UDim.new(0, 6)
List.Parent = Content

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.PaddingLeft = UDim.new(0, 10)
Padding.PaddingRight = UDim.new(0, 10)
Padding.Parent = Content

local function createToggle(text, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 36)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    frame.BorderSizePixel = 0
    frame.Parent = Content
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 12, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(210, 210, 220)
    label.Font = Enum.Font.Gotham
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(0, 40, 1, 0)
    status.Position = UDim2.new(1, -48, 0, 0)
    status.BackgroundTransparency = 1
    status.Text = "OFF"
    status.TextColor3 = Color3.fromRGB(140, 140, 150)
    status.Font = Enum.Font.GothamBold
    status.TextSize = 12
    status.Parent = frame

    local enabled = false
    local function update()
        status.Text = enabled and "ON" or "OFF"
        status.TextColor3 = enabled and Color3.fromRGB(80, 220, 120) or Color3.fromRGB(140, 140, 150)
        frame.BackgroundColor3 = enabled and Color3.fromRGB(35, 50, 42) or Color3.fromRGB(30, 30, 38)
        callback(enabled)
    end

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            enabled = not enabled
            update()
        end
    end)
end

createToggle("Fly (Mobile + PC)", toggleFly)
createToggle("Float (Solid)", toggleFloat)
createToggle("Wall Walk", toggleWallWalk)
createToggle("Noclip", toggleNoclip)
createToggle("Fling Nearby", toggleFling)
createToggle("Auto TP Buttons", toggleAutoTP)
createToggle("Auto Press Buttons", toggleAutoPress)

local flingBtn = Instance.new("TextButton")
flingBtn.Size = UDim2.new(1, 0, 0, 34)
flingBtn.BackgroundColor3 = Color3.fromRGB(55, 30, 30)
flingBtn.BorderSizePixel = 0
flingBtn.Text = "Fling All (Once)"
flingBtn.TextColor3 = Color3.fromRGB(255, 180, 180)
flingBtn.Font = Enum.Font.Gotham
flingBtn.TextSize = 13
flingBtn.Parent = Content
Instance.new("UICorner", flingBtn).CornerRadius = UDim.new(0, 6)

flingBtn.MouseButton1Click:Connect(function()
    local root = getRoot()
    if not root then return end
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
            local other = plr.Character.HumanoidRootPart
            other.AssemblyLinearVelocity = Vector3.new(0, 140, 0) + (other.Position - root.Position).Unit * 160
        end
    end
end)

Minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Content.Visible = false
        Main.Size = UDim2.new(0, 260, 0, 32)
        Minimize.Text = "+"
    else
        Content.Visible = true
        Main.Size = UDim2.new(0, 260, 0, 420)
        Minimize.Text = "â"
    end
end)

lp.CharacterAdded:Connect(function()
    task.wait(1.2)
    if states.Fly then toggleFly(true) end
    if states.Float then toggleFloat(true) end
    if states.WallWalk then toggleWallWalk(true) end
    if states.Noclip then toggleNoclip(true) end
    if states.Fling then toggleFling(true) end
end)

print("[Universal Troll] Loaded")