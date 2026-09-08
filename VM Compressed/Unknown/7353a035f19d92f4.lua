loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukashub-coder/Universal-Part-Claim/refs/heads/main/By%20lukas!!"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local StarterGui = game:GetService("StarterGui")
local TextChatService = game:GetService("TextChatService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local RING_COUNT = 2
local BASE_RADIUS = 15
local RADIUS_INCREMENT = 15
local BASE_SPEED = 5
local HEIGHT_VARIATION = 5

local function playSound(soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. soundId
    sound.Parent = SoundService
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

playSound("2865227271")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DualRingGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 250, 0, 320)
MainFrame.Position = UDim2.new(1, -270, 1, -340)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "DUAL RING CONTROL"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 80)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 15)
TitleCorner.Parent = Title

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0.8, 0, 0, 35)
ToggleButton.Position = UDim2.new(0.1, 0, 0.15, 0)
ToggleButton.Text = "OFF"
ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 14
ToggleButton.Parent = MainFrame

local SpeedDown = Instance.new("TextButton")
SpeedDown.Size = UDim2.new(0.2, 0, 0, 30)
SpeedDown.Position = UDim2.new(0.1, 0, 0.3, 0)
SpeedDown.Text = "-"
SpeedDown.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
SpeedDown.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedDown.Font = Enum.Font.GothamBold
SpeedDown.TextSize = 18
SpeedDown.Parent = MainFrame

local SpeedDisplay = Instance.new("TextLabel")
SpeedDisplay.Size = UDim2.new(0.4, 0, 0, 30)
SpeedDisplay.Position = UDim2.new(0.3, 0, 0.3, 0)
SpeedDisplay.Text = "SPEED: "..BASE_SPEED
SpeedDisplay.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
SpeedDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedDisplay.Font = Enum.Font.Gotham
SpeedDisplay.TextSize = 14
SpeedDisplay.Parent = MainFrame

local SpeedUp = Instance.new("TextButton")
SpeedUp.Size = UDim2.new(0.2, 0, 0, 30)
SpeedUp.Position = UDim2.new(0.7, 0, 0.3, 0)
SpeedUp.Text = "+"
SpeedUp.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
SpeedUp.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedUp.Font = Enum.Font.GothamBold
SpeedUp.TextSize = 18
SpeedUp.Parent = MainFrame

local RadiusDown = Instance.new("TextButton")
RadiusDown.Size = UDim2.new(0.2, 0, 0, 30)
RadiusDown.Position = UDim2.new(0.1, 0, 0.45, 0)
RadiusDown.Text = "-"
RadiusDown.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
RadiusDown.TextColor3 = Color3.fromRGB(255, 255, 255)
RadiusDown.Font = Enum.Font.GothamBold
RadiusDown.TextSize = 18
RadiusDown.Parent = MainFrame

local RadiusDisplay = Instance.new("TextLabel")
RadiusDisplay.Size = UDim2.new(0.4, 0, 0, 30)
RadiusDisplay.Position = UDim2.new(0.3, 0, 0.45, 0)
RadiusDisplay.Text = "RADIUS: "..BASE_RADIUS
RadiusDisplay.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
RadiusDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
RadiusDisplay.Font = Enum.Font.Gotham
RadiusDisplay.TextSize = 14
RadiusDisplay.Parent = MainFrame

local RadiusUp = Instance.new("TextButton")
RadiusUp.Size = UDim2.new(0.2, 0, 0, 30)
RadiusUp.Position = UDim2.new(0.7, 0, 0.45, 0)
RadiusUp.Text = "+"
RadiusUp.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
RadiusUp.TextColor3 = Color3.fromRGB(255, 255, 255)
RadiusUp.Font = Enum.Font.GothamBold
RadiusUp.TextSize = 18
RadiusUp.Parent = MainFrame

local Ring1AngleDown = Instance.new("TextButton")
Ring1AngleDown.Size = UDim2.new(0.2, 0, 0, 30)
Ring1AngleDown.Position = UDim2.new(0.1, 0, 0.6, 0)
Ring1AngleDown.Text = "-"
Ring1AngleDown.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
Ring1AngleDown.TextColor3 = Color3.fromRGB(255, 255, 255)
Ring1AngleDown.Font = Enum.Font.GothamBold
Ring1AngleDown.TextSize = 18
Ring1AngleDown.Parent = MainFrame

local Ring1AngleDisplay = Instance.new("TextLabel")
Ring1AngleDisplay.Size = UDim2.new(0.4, 0, 0, 30)
Ring1AngleDisplay.Position = UDim2.new(0.3, 0, 0.6, 0)
Ring1AngleDisplay.Text = "RING1 ANGLE: 0°"
Ring1AngleDisplay.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Ring1AngleDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
Ring1AngleDisplay.Font = Enum.Font.Gotham
Ring1AngleDisplay.TextSize = 12
Ring1AngleDisplay.Parent = MainFrame

local Ring1AngleUp = Instance.new("TextButton")
Ring1AngleUp.Size = UDim2.new(0.2, 0, 0, 30)
Ring1AngleUp.Position = UDim2.new(0.7, 0, 0.6, 0)
Ring1AngleUp.Text = "+"
Ring1AngleUp.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
Ring1AngleUp.TextColor3 = Color3.fromRGB(255, 255, 255)
Ring1AngleUp.Font = Enum.Font.GothamBold
Ring1AngleUp.TextSize = 18
Ring1AngleUp.Parent = MainFrame

local Ring2AngleDown = Instance.new("TextButton")
Ring2AngleDown.Size = UDim2.new(0.2, 0, 0, 30)
Ring2AngleDown.Position = UDim2.new(0.1, 0, 0.75, 0)
Ring2AngleDown.Text = "-"
Ring2AngleDown.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
Ring2AngleDown.TextColor3 = Color3.fromRGB(255, 255, 255)
Ring2AngleDown.Font = Enum.Font.GothamBold
Ring2AngleDown.TextSize = 18
Ring2AngleDown.Parent = MainFrame

local Ring2AngleDisplay = Instance.new("TextLabel")
Ring2AngleDisplay.Size = UDim2.new(0.4, 0, 0, 30)
Ring2AngleDisplay.Position = UDim2.new(0.3, 0, 0.75, 0)
Ring2AngleDisplay.Text = "RING2 ANGLE: 0°"
Ring2AngleDisplay.BackgroundColor3 = Color3.fromRGB(60, 60, 90)
Ring2AngleDisplay.TextColor3 = Color3.fromRGB(255, 255, 255)
Ring2AngleDisplay.Font = Enum.Font.Gotham
Ring2AngleDisplay.TextSize = 12
Ring2AngleDisplay.Parent = MainFrame

local Ring2AngleUp = Instance.new("TextButton")
Ring2AngleUp.Size = UDim2.new(0.2, 0, 0, 30)
Ring2AngleUp.Position = UDim2.new(0.7, 0, 0.75, 0)
Ring2AngleUp.Text = "+"
Ring2AngleUp.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
Ring2AngleUp.TextColor3 = Color3.fromRGB(255, 255, 255)
Ring2AngleUp.Font = Enum.Font.GothamBold
Ring2AngleUp.TextSize = 18
Ring2AngleUp.Parent = MainFrame

local Watermark = Instance.new("TextLabel")
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Position = UDim2.new(0, 0, 1, -20)
Watermark.Text = "MADE BY VANTAGESCRIPTS"
Watermark.TextColor3 = Color3.fromRGB(150, 150, 200)
Watermark.BackgroundTransparency = 1
Watermark.Font = Enum.Font.Gotham
Watermark.TextSize = 12
Watermark.Parent = MainFrame

local function roundButtons()
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    
    for _,v in pairs(MainFrame:GetChildren()) do
        if v:IsA("TextButton") or (v:IsA("TextLabel") and v ~= Title and v ~= Watermark) then
            corner:Clone().Parent = v
        end
    end
end
roundButtons()

local dragging = false
local dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(
        startPos.X.Scale, 
        startPos.X.Offset + delta.X,
        startPos.Y.Scale, 
        startPos.Y.Offset + delta.Y
    )
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
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

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

if not getgenv().RingNetwork then
    getgenv().RingNetwork = {
        BaseParts = {},
        Rings = {
            {Radius = BASE_RADIUS, Speed = BASE_SPEED, Height = 0, Angle = 0},
            {Radius = BASE_RADIUS + RADIUS_INCREMENT, Speed = BASE_SPEED * 0.8, Height = HEIGHT_VARIATION, Angle = 0}
        },
        Active = false
    }
    
    RingNetwork.RetainPart = function(Part)
        if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(workspace) then
            table.insert(RingNetwork.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end
    
    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = workspace
        
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            
            if RingNetwork.Active then
                for _, Part in pairs(RingNetwork.BaseParts) do
                    if Part:IsDescendantOf(workspace) then
                        local closestRing = 1
                        local closestDist = math.huge
                        local partPos = Part.Position
                        local charPos = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position or Vector3.new(0,0,0)
                        
                        for i, ring in ipairs(RingNetwork.Rings) do
                            local dist = (Vector3.new(partPos.X, charPos.Y, partPos.Z) - charPos).Magnitude
                            if math.abs(dist - ring.Radius) < closestDist then
                                closestDist = math.abs(dist - ring.Radius)
                                closestRing = i
                            end
                        end
                        
                        local ring = RingNetwork.Rings[closestRing]
                        local angle = math.atan2(partPos.Z - charPos.Z, partPos.X - charPos.X)
                        local newAngle = angle + math.rad(ring.Speed)
                        
                        local targetPos = Vector3.new(
                            charPos.X + math.cos(newAngle) * ring.Radius * math.cos(math.rad(ring.Angle)),
                            charPos.Y + ring.Height + (math.sin(newAngle) * ring.Radius * math.sin(math.rad(ring.Angle))),
                            charPos.Z + math.sin(newAngle) * ring.Radius
                        )
                        
                        Part.Velocity = (targetPos - partPos).Unit * ring.Speed * 10
                    end
                end
            end
        end)
    end
    
    EnablePartControl()
end

local parts = {}
local function addPart(part)
    if part:IsA("BasePart") and not part.Anchored and part:IsDescendantOf(workspace) then
        if part.Parent == LocalPlayer.Character or part:IsDescendantOf(LocalPlayer.Character) then
            return
        end
        RingNetwork.RetainPart(part)
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

ToggleButton.MouseButton1Click:Connect(function()
    RingNetwork.Active = not RingNetwork.Active
    ToggleButton.Text = RingNetwork.Active and "ON" or "OFF"
    ToggleButton.BackgroundColor3 = RingNetwork.Active and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(200, 50, 50)
    playSound("177266782")
end)

local function updateSpeed(change)
    BASE_SPEED = math.clamp(BASE_SPEED + change, 1, 20)
    RingNetwork.Rings[1].Speed = BASE_SPEED
    RingNetwork.Rings[2].Speed = BASE_SPEED * 0.8
    SpeedDisplay.Text = "SPEED: "..BASE_SPEED
    playSound("177266782")
end

SpeedDown.MouseButton1Click:Connect(function() updateSpeed(-1) end)
SpeedUp.MouseButton1Click:Connect(function() updateSpeed(1) end)

local function updateRadius(change)
    BASE_RADIUS = math.clamp(BASE_RADIUS + change, 5, 100)
    RingNetwork.Rings[1].Radius = BASE_RADIUS
    RingNetwork.Rings[2].Radius = BASE_RADIUS + RADIUS_INCREMENT
    RadiusDisplay.Text = "RADIUS: "..BASE_RADIUS
    playSound("177266782")
end

RadiusDown.MouseButton1Click:Connect(function() updateRadius(-5) end)
RadiusUp.MouseButton1Click:Connect(function() updateRadius(5) end)

local function updateRingAngle(ringIndex, change)
    RingNetwork.Rings[ringIndex].Angle = (RingNetwork.Rings[ringIndex].Angle + change) % 360
    if ringIndex == 1 then
        Ring1AngleDisplay.Text = "RING1 ANGLE: "..math.floor(RingNetwork.Rings[1].Angle).."°"
    else
        Ring2AngleDisplay.Text = "RING2 ANGLE: "..math.floor(RingNetwork.Rings[2].Angle).."°"
    end
    playSound("177266782")
end

Ring1AngleDown.MouseButton1Click:Connect(function() updateRingAngle(1, -15) end)
Ring1AngleUp.MouseButton1Click:Connect(function() updateRingAngle(1, 15) end)
Ring2AngleDown.MouseButton1Click:Connect(function() updateRingAngle(2, -15) end)
Ring2AngleUp.MouseButton1Click:Connect(function() updateRingAngle(2, 15) end)

StarterGui:SetCore("SendNotification", {
    Title = "DUAL RING SYSTEM",
    Text = "Gui is not moveable yet.",
    Duration = 5
})

local function SendChatMessage(message)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannel = TextChatService.TextChannels.RBXGeneral
        textChannel:SendAsync(message)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
    end
end

SendChatMessage("THX LUKAS.")