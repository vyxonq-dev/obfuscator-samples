-- Create the GUI components
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ToggleButton = Instance.new("TextButton") -- Toggle button to open/close the main GUI
local ToggleFrame = Instance.new("Frame") -- Container for the toggle button

-- Parent the ScreenGui to CoreGui to persist on respawn
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame properties
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0, 0, 0)  -- Black background
Frame.Size = UDim2.new(0.3, 0, 0.6, 0)  -- Height to allow more space for buttons
Frame.Position = UDim2.new(0.35, 0, 0.2, 0)  -- Adjusted position
Frame.Visible = false -- Start as hidden

-- Title Label
TitleLabel.Parent = Frame
TitleLabel.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background for the title
TitleLabel.Size = UDim2.new(1, 0, 0, 40)  -- Adjusted height
TitleLabel.Text = "AMIGOS•HUB GUI"  -- Updated title text
TitleLabel.TextColor3 = Color3.new(0, 1, 0) -- Green text
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 20  -- Smaller text size
TitleLabel.TextScaled = true
TitleLabel.BorderSizePixel = 0

-- Scrolling Frame
ScrollingFrame.Parent = Frame
ScrollingFrame.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background for scrolling area
ScrollingFrame.Size = UDim2.new(1, 0, 1, -50)  -- Adjust height to accommodate title
ScrollingFrame.Position = UDim2.new(0, 0, 0, 50)  -- Position below the title
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 600) -- Adjust this to fit all buttons inside

UIListLayout.Parent = ScrollingFrame
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Function to create buttons
local function createButton(parent, text, scriptURL)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background for buttons
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Text = text
    button.TextColor3 = Color3.new(0, 1, 0) -- Green text
    button.Font = Enum.Font.SourceSans
    button.TextSize = 24

    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptURL))()
    end)
end

-- Creating buttons for scripts
createButton(ScrollingFrame, "AMIGOS GUI V2", "https://pastefy.app/DEAhrazg/raw") -- Updated button name

-- Adding the new "CHAT SYSTEM" button and linking it to the script
createButton(ScrollingFrame, "CHAT SYSTEM", "https://pastefy.app/1brzM4Cg/raw") -- New chat system button

-- Toggle Frame for open/close button (on left side)
ToggleFrame.Parent = ScreenGui
ToggleFrame.BackgroundColor3 = Color3.new(0, 0, 0)
ToggleFrame.Position = UDim2.new(0, 0, 0.1, 0)  -- Positioned higher on the left side
ToggleFrame.Size = UDim2.new(0, 120, 0, 40)  -- Size based on the name "TOGGLE GUI V3"

-- Make the Toggle Frame draggable
local UserInputService = game:GetService("UserInputService")
local dragging = false
local dragStart = Vector2.new()
local startPos = UDim2.new()

local function updateInput(input)
    if dragging then
        local delta = input.Position - dragStart
        ToggleFrame.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
    end
end

ToggleFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = ToggleFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(updateInput)

-- Toggle Button (text changed to "TOGGLE GUI V3")
ToggleButton.Parent = ToggleFrame
ToggleButton.Size = UDim2.new(1, 0, 1, 0)
ToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
ToggleButton.TextColor3 = Color3.new(0, 1, 0)
ToggleButton.Font = Enum.Font.SourceSans
ToggleButton.TextSize = 14  -- Reduced text size to fit the smaller button
ToggleButton.Text = "TOGGLE GUI V3"  -- Updated text

ToggleButton.MouseButton1Click:Connect(function()
    Frame.Visible = not Frame.Visible  -- Toggle GUI visibility
end)

-- Ensure the GUI starts closed
Frame.Visible = false