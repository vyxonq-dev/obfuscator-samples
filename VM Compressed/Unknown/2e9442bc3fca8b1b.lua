-- Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JOKHubGui"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Main Frame (Tab)
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainTab"
mainFrame.Size = UDim2.new(0, 320, 0, 160)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -80)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui
mainFrame.ClipsDescendants = true

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 14)
uiCorner.Parent = mainFrame

local shadow = Instance.new("ImageLabel")
shadow.Size = UDim2.new(1, 20, 1, 20)
shadow.Position = UDim2.new(0, -10, 0, -10)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://3524244309"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.7
shadow.Parent = mainFrame
shadow.ZIndex = 0
local shadowUICorner = Instance.new("UICorner")
shadowUICorner.CornerRadius = UDim.new(0, 14)
shadowUICorner.Parent = shadow

-- Top Title Label "JOK|HUB V0.1"
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "JOK|HUB V0.1"
titleLabel.TextColor3 = Color3.fromRGB(220, 220, 255)
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextSize = 28
titleLabel.TextStrokeTransparency = 0.6
titleLabel.Parent = mainFrame

-- Button click animation function
local function buttonClickAnim(button)
    local originalColor = button.BackgroundColor3
    local animColor = Color3.fromRGB(90, 150, 220)

    local tweenIn = TweenService:Create(button, TweenInfo.new(0.1), {BackgroundColor3 = animColor})
    local tweenOut = TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3 = originalColor})

    tweenIn:Play()
    tweenIn.Completed:Wait()
    tweenOut:Play()
end

-- Run Script Button
local runButton = Instance.new("TextButton")
runButton.Size = UDim2.new(1, -40, 0, 50)
runButton.Position = UDim2.new(0, 20, 0, 50)
runButton.BackgroundColor3 = Color3.fromRGB(70, 110, 170)
runButton.Text = "Arbix|Steal"
runButton.TextColor3 = Color3.fromRGB(255, 255, 255)
runButton.Font = Enum.Font.GothamSemibold
runButton.TextSize = 22
runButton.AutoButtonColor = false
runButton.Parent = mainFrame
runButton.ClipsDescendants = true

local runBtnCorner = Instance.new("UICorner")
runBtnCorner.CornerRadius = UDim.new(0, 8)
runBtnCorner.Parent = runButton

runButton.MouseButton1Click:Connect(function()
    buttonClickAnim(runButton)
    wait(0.25)
    loadstring(game:HttpGet("https://rawscripts.net/raw/Steal-a-Brainrot-Steal-a-brainrot-STEAL-SCRIPT-patched-44661"))()
end)

-- ESP Toggle Button (inside mainFrame)
local espToggle = Instance.new("TextButton")
espToggle.Name = "ESPToggleButton"
espToggle.Size = UDim2.new(1, -40, 0, 40)
espToggle.Position = UDim2.new(0, 20, 0, 110)  -- below the runButton
espToggle.BackgroundColor3 = Color3.fromRGB(70, 130, 90)
espToggle.Text = "ESP: OFF"
espToggle.TextColor3 = Color3.fromRGB(240, 240, 240)
espToggle.Font = Enum.Font.GothamSemibold
espToggle.TextSize = 20
espToggle.AutoButtonColor = false
espToggle.Parent = mainFrame
espToggle.ClipsDescendants = true

local espBtnCorner = Instance.new("UICorner")
espBtnCorner.CornerRadius = UDim.new(0, 8)
espBtnCorner.Parent = espToggle

-- Hover effect on ESP toggle button
espToggle.MouseEnter:Connect(function()
    espToggle.BackgroundColor3 = Color3.fromRGB(90, 160, 110)
end)
espToggle.MouseLeave:Connect(function()
    espToggle.BackgroundColor3 = Color3.fromRGB(70, 130, 90)
end)

-- ESP toggle logic with Highlight + BillboardGui username (no background)
local espEnabled = false
local highlights = {}
local billboards = {}

local function createESP(player)
    if not player.Character then return end
    local char = player.Character
    local head = char:FindFirstChild("Head")
    if not head then return end

    -- Avoid creating multiple times
    if highlights[player] or billboards[player] then return end

    -- Create Highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = "JOKHubHighlight"
    highlight.Adornee = char
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = Color3.fromRGB(0, 255, 255) -- cyan glow
    highlight.FillTransparency = 0.4
    highlight.OutlineColor = Color3.fromRGB(0, 150, 150)
    highlight.OutlineTransparency = 0
    highlight.Parent = char

    -- Create BillboardGui with username label (no background)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "JOKHubBillboard"
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 150, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = char

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1 -- no background
    textLabel.Text = player.Name
    textLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 18
    textLabel.Parent = billboard

    highlights[player] = highlight
    billboards[player] = billboard
end

local function removeESP(player)
    if highlights[player] then
        highlights[player]:Destroy()
        highlights[player] = nil
    end
    if billboards[player] then
        billboards[player]:Destroy()
        billboards[player] = nil
    end
end

-- Clean up ESP on player leaving
Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

espToggle.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    espToggle.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    buttonClickAnim(espToggle)

    if espEnabled then
        -- Add ESP to all players except local
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player then
                createESP(plr)
            end
        end
        -- Connect to new players joining
        Players.PlayerAdded:Connect(function(plr)
            if espEnabled and plr ~= player then
                plr.CharacterAdded:Wait()
                createESP(plr)
            end
        end)
        -- Also add ESP when a character respawns
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player then
                plr.CharacterAdded:Connect(function()
                    if espEnabled then
                        createESP(plr)
                    end
                end)
            end
        end
    else
        -- Remove all ESP
        for _, plr in pairs(Players:GetPlayers()) do
            removeESP(plr)
        end
    end
end)

-- Toggle GUI Button (draggable)
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleGuiButton"
toggleButton.Size = UDim2.new(0, 140, 0, 45)
toggleButton.Position = UDim2.new(0, 15, 0, 15)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
toggleButton.Text = "Toggle GUI"
toggleButton.TextColor3 = Color3.fromRGB(220, 220, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 18
toggleButton.AutoButtonColor = false
toggleButton.Parent = screenGui

local toggleBtnCorner = Instance.new("UICorner")
toggleBtnCorner.CornerRadius = UDim.new(0, 10)
toggleBtnCorner.Parent = toggleButton

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    buttonClickAnim(toggleButton)
end)

-- Smooth Draggable Function for frames and buttons
local function makeDraggable(frame)
    local dragging
    local dragInput
    local dragStart
    local startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            local newX = startPos.X.Offset + delta.X
            local newY = startPos.Y.Offset + delta.Y

            -- Clamp to screen bounds
            local screenSize = workspace.CurrentCamera.ViewportSize
            newX = math.clamp(newX, 0, screenSize.X - frame.AbsoluteSize.X)
            newY = math.clamp(newY, 0, screenSize.Y - frame.AbsoluteSize.Y)

            frame.Position = UDim2.new(0, newX, 0, newY)
        end
    end)
end

-- Make draggable both the toggle button and main frame
makeDraggable(mainFrame)
makeDraggable(toggleButton)
