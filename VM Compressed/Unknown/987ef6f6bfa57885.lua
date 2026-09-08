local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }

    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(100000, 100000, 100000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = 9999999999999999
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 200
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end



local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- Sound Effects
local function playSound(soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- Play initial sound
playSound("2865227271")

-- GUI Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SuperRingPartsGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 205)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -102)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(55, 55, 55)
MainStroke.Thickness = 1
MainStroke.Transparency = 0.15
MainStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -20, 0, 42)
Title.Position = UDim2.new(0, 10, 0, 6)
Title.Text = "SUPER RING V5"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Title.BorderSizePixel = 0
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0.8, 0, 0, 38)
ToggleButton.Position = UDim2.new(0.1, 0, 0.30, 0)
ToggleButton.Text = "Ring Parts Off"
ToggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.Font = Enum.Font.GothamSemibold
ToggleButton.TextSize = 16
ToggleButton.AutoButtonColor = true
ToggleButton.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 9)
ToggleCorner.Parent = ToggleButton

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(70, 70, 70)
ToggleStroke.Thickness = 1
ToggleStroke.Parent = ToggleButton

local DecreaseRadius = Instance.new("TextButton")
DecreaseRadius.Size = UDim2.new(0.2, 0, 0, 38)
DecreaseRadius.Position = UDim2.new(0.1, 0, 0.60, 0)
DecreaseRadius.Text = "<"
DecreaseRadius.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DecreaseRadius.TextColor3 = Color3.fromRGB(255, 255, 255)
DecreaseRadius.BorderSizePixel = 0
DecreaseRadius.Font = Enum.Font.GothamBold
DecreaseRadius.TextSize = 18
DecreaseRadius.Parent = MainFrame

local DecreaseCorner = Instance.new("UICorner")
DecreaseCorner.CornerRadius = UDim.new(0, 9)
DecreaseCorner.Parent = DecreaseRadius

local DecreaseStroke = Instance.new("UIStroke")
DecreaseStroke.Color = Color3.fromRGB(60, 60, 60)
DecreaseStroke.Thickness = 1
DecreaseStroke.Parent = DecreaseRadius

local IncreaseRadius = Instance.new("TextButton")
IncreaseRadius.Size = UDim2.new(0.2, 0, 0, 38)
IncreaseRadius.Position = UDim2.new(0.7, 0, 0.60, 0)
IncreaseRadius.Text = ">"
IncreaseRadius.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
IncreaseRadius.TextColor3 = Color3.fromRGB(255, 255, 255)
IncreaseRadius.BorderSizePixel = 0
IncreaseRadius.Font = Enum.Font.GothamBold
IncreaseRadius.TextSize = 18
IncreaseRadius.Parent = MainFrame

local IncreaseCorner = Instance.new("UICorner")
IncreaseCorner.CornerRadius = UDim.new(0, 9)
IncreaseCorner.Parent = IncreaseRadius

local IncreaseStroke = Instance.new("UIStroke")
IncreaseStroke.Color = Color3.fromRGB(60, 60, 60)
IncreaseStroke.Thickness = 1
IncreaseStroke.Parent = IncreaseRadius

local RadiusDisplay = Instance.new("TextLabel")
RadiusDisplay.Size = UDim2.new(0.4, 0, 0, 38)
RadiusDisplay.Position = UDim2.new(0.3, 0, 0.60, 0)
RadiusDisplay.Text = "Radius: 50"
RadiusDisplay.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
RadiusDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
RadiusDisplay.BorderSizePixel = 0
RadiusDisplay.Font = Enum.Font.GothamSemibold
RadiusDisplay.TextSize = 15
RadiusDisplay.Parent = MainFrame

local RadiusCorner = Instance.new("UICorner")
RadiusCorner.CornerRadius = UDim.new(0, 9)
RadiusCorner.Parent = RadiusDisplay

local RadiusStroke = Instance.new("UIStroke")
RadiusStroke.Color = Color3.fromRGB(55, 55, 55)
RadiusStroke.Thickness = 1
RadiusStroke.Parent = RadiusDisplay

local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Position = UDim2.new(0, 0, 1, -22)
Watermark.Text = "Super Ring V5  •  yes.dev"
Watermark.TextColor3 = Color3.fromRGB(145, 145, 145)
Watermark.BackgroundTransparency = 1
Watermark.Font = Enum.Font.GothamMedium
Watermark.TextSize = 12
Watermark.Parent = MainFrame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
-- CHANGED: moved left by 6 pixels (from -38 to -44)
MinimizeButton.Position = UDim2.new(1, -44, 0, 12)
MinimizeButton.Text = "−"
MinimizeButton.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18
MinimizeButton.Parent = MainFrame

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 8)
MinimizeCorner.Parent = MinimizeButton

local MinimizeStroke = Instance.new("UIStroke")
MinimizeStroke.Color = Color3.fromRGB(65, 65, 65)
MinimizeStroke.Thickness = 1
MinimizeStroke.Parent = MinimizeButton

-- Minimize functionality
local minimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        MainFrame:TweenSize(UDim2.new(0, 250, 0, 52), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "+"
        ToggleButton.Visible = false
        DecreaseRadius.Visible = false
        IncreaseRadius.Visible = false
        RadiusDisplay.Visible = false
        Watermark.Visible = false
    else
        MainFrame:TweenSize(UDim2.new(0, 250, 0, 205), "Out", "Quad", 0.3, true)
        MinimizeButton.Text = "-"
        ToggleButton.Visible = true
        DecreaseRadius.Visible = true
        IncreaseRadius.Visible = true
        RadiusDisplay.Visible = true
        Watermark.Visible = true
    end
    playSound("12221967")
end)

-- Make GUI draggable
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Ring Parts Logic
if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }
    Network.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(workspace) then
            table.insert(Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end
    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, Part in pairs(Network.BaseParts) do
                if Part:IsDescendantOf(workspace) then
                    Part.Velocity = Network.Velocity
                end
            end
        end)
    end
    EnablePartControl()
end

local radius = 50
local height = 100
local rotationSpeed = 1
local attractionStrength = 1000
local ringPartsEnabled = false

local function RetainPart(Part)
    if Part:IsA("BasePart") and not Part.Anchored and Part:IsDescendantOf(workspace) then
        if Part.Parent == LocalPlayer.Character or Part:IsDescendantOf(LocalPlayer.Character) then
            return false
        end

        Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
        Part.CanCollide = false
        return true
    end
    return false
end

local parts = {}
local function addPart(part)
    if RetainPart(part) then
        if not table.find(parts, part) then
            table.insert(parts, part)
        end
    end
end

local function removePart(part)
    local index = table.find(parts, part)
    if index then
        table.remove(parts, index)
    end
end

for _, part in pairs(workspace:GetDescendants()) do
    addPart(part)
end

workspace.DescendantAdded:Connect(addPart)
workspace.DescendantRemoving:Connect(removePart)

RunService.Heartbeat:Connect(function()
    if not ringPartsEnabled then return end
    
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local tornadoCenter = humanoidRootPart.Position
        for _, part in pairs(parts) do
            if part.Parent and not part.Anchored then
                local pos = part.Position
                local distance = (Vector3.new(pos.X, tornadoCenter.Y, pos.Z) - tornadoCenter).Magnitude
                local angle = math.atan2(pos.Z - tornadoCenter.Z, pos.X - tornadoCenter.X)
                local newAngle = angle + math.rad(rotationSpeed)
                local targetPos = Vector3.new(
                    tornadoCenter.X + math.cos(newAngle) * math.min(radius, distance),
                    tornadoCenter.Y + (height * (math.abs(math.sin((pos.Y - tornadoCenter.Y) / height)))),
                    tornadoCenter.Z + math.sin(newAngle) * math.min(radius, distance)
                )
                local directionToTarget = (targetPos - part.Position).unit
                part.Velocity = directionToTarget * attractionStrength
            end
        end
    end
end)

-- Button functionality
ToggleButton.MouseButton1Click:Connect(function()
    ringPartsEnabled = not ringPartsEnabled
    ToggleButton.Text = ringPartsEnabled and "Ring Parts On" or "Ring Parts Off"
    ToggleButton.BackgroundColor3 = ringPartsEnabled and Color3.fromRGB(48, 48, 48) or Color3.fromRGB(35, 35, 35)
    playSound("12221967")
end)

DecreaseRadius.MouseButton1Click:Connect(function()
    radius = math.max(1, radius - 2)
    RadiusDisplay.Text = "Radius: " .. radius
    playSound("12221967")
end)

IncreaseRadius.MouseButton1Click:Connect(function()
    radius = math.min(1000, radius + 2)
    RadiusDisplay.Text = "Radius: " .. radius
    playSound("12221967")
end)

-- ============================================
-- BOTTOM-RIGHT NOTIFICATION WITH SLIDE + BUTTON CLICK ANIMATION
-- ============================================
local NotificationGui = Instance.new("ScreenGui")
NotificationGui.Name = "NotificationGUI"
NotificationGui.ResetOnSpawn = false
NotificationGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local NotificationFrame = Instance.new("Frame")
NotificationFrame.Size = UDim2.new(0, 280, 0, 140)
NotificationFrame.Position = UDim2.new(1, 20, 1, -160) -- start off-screen (right)
NotificationFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Parent = NotificationGui

local NotificationCorner = Instance.new("UICorner")
NotificationCorner.CornerRadius = UDim.new(0, 10)
NotificationCorner.Parent = NotificationFrame

local NotificationStroke = Instance.new("UIStroke")
NotificationStroke.Color = Color3.fromRGB(50, 50, 50)
NotificationStroke.Thickness = 1
NotificationStroke.Transparency = 0.2
NotificationStroke.Parent = NotificationFrame

local NotificationTitle = Instance.new("TextLabel")
NotificationTitle.Size = UDim2.new(1, -20, 0, 30)
NotificationTitle.Position = UDim2.new(0, 10, 0, 12)
NotificationTitle.Text = "Super Ring V5"
NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationTitle.BackgroundTransparency = 1
NotificationTitle.Font = Enum.Font.GothamBold
NotificationTitle.TextSize = 18
NotificationTitle.Parent = NotificationFrame

local NotificationSubtitle = Instance.new("TextLabel")
NotificationSubtitle.Size = UDim2.new(1, -20, 0, 20)
NotificationSubtitle.Position = UDim2.new(0, 10, 0, 42)
NotificationSubtitle.Text = "by yes.dev"
NotificationSubtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
NotificationSubtitle.BackgroundTransparency = 1
NotificationSubtitle.Font = Enum.Font.GothamMedium
NotificationSubtitle.TextSize = 13
NotificationSubtitle.Parent = NotificationFrame

-- Horizontal separator
local Separator = Instance.new("Frame")
Separator.Size = UDim2.new(1, -40, 0, 1)
Separator.Position = UDim2.new(0, 20, 0, 68)
Separator.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Separator.BorderSizePixel = 0
Separator.Parent = NotificationFrame

local RunIYButton = Instance.new("TextButton")
RunIYButton.Size = UDim2.new(0, 180, 0, 38)
RunIYButton.Position = UDim2.new(0.5, -90, 0, 85)
RunIYButton.Text = "Run Infinite Yield"
RunIYButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
RunIYButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RunIYButton.BorderSizePixel = 0
RunIYButton.Font = Enum.Font.GothamBold
RunIYButton.TextSize = 16
RunIYButton.Parent = NotificationFrame

local RunIYCorner = Instance.new("UICorner")
RunIYCorner.CornerRadius = UDim.new(0, 8)
RunIYCorner.Parent = RunIYButton

local RunIYStroke = Instance.new("UIStroke")
RunIYStroke.Color = Color3.fromRGB(70, 70, 70)
RunIYStroke.Thickness = 1
RunIYStroke.Parent = RunIYButton

-- Slide in animation (slower: 0.6s)
local slideIn = TweenService:Create(
    NotificationFrame,
    TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {Position = UDim2.new(1, -300, 1, -160)} -- final bottom-right with 20px margin
)
slideIn:Play()

-- Dismiss function (slide out, slower: 0.6s) with optional callback
local function dismissNotification(callback)
    local slideOut = TweenService:Create(
        NotificationFrame,
        TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {Position = UDim2.new(1, 20, 1, -160)} -- slide back off-screen
    )
    slideOut:Play()
    slideOut.Completed:Connect(function()
        NotificationGui:Destroy()
        if callback then callback() end
    end)
end

-- Button click with green animation, then slide out, then execute script
local buttonClicked = false
RunIYButton.MouseButton1Click:Connect(function()
    if buttonClicked then return end
    buttonClicked = true

    -- Play sound immediately on click
    playSound("12221967")

    -- Change text to "Executing"
    RunIYButton.Text = "Executing"

    -- Turn green (faster: 0.1s)
    local greenTween = TweenService:Create(
        RunIYButton,
        TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {BackgroundColor3 = Color3.fromRGB(0, 170, 0)}
    )
    greenTween:Play()
    
    greenTween.Completed:Connect(function()
        -- Slide out notification first
        dismissNotification(function()
            -- Execute Infinite Yield script after slide out is complete
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            end)
        end)
    end)
end)

-- Auto-dismiss after 5 seconds (no callback)
spawn(function()
    wait(5)
    if NotificationGui then
        dismissNotification()
    end
end)
