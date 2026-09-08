-- GUI Setup
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "CustomGui"
screenGui.ResetOnSpawn = false

-- Frame for the GUI
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0, 10, 0.5, -75) -- Center left of the screen
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.BorderSizePixel = 0
frame.Visible = true

-- TextLabel inside the frame
local textLabel = Instance.new("TextLabel", frame)
textLabel.Size = UDim2.new(1, 0, 0.6, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "Well... This is BY NeverGonnaGiveUpLo4, I Think Maybe Is Working Or SHIT"
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextScaled = true
textLabel.Font = Enum.Font.SourceSansBold

-- Execute Button inside the frame
local executeButton = Instance.new("TextButton", frame)
executeButton.Size = UDim2.new(1, 0, 0.3, 0)
executeButton.Position = UDim2.new(0, 0, 0.6, 0)
executeButton.Text = "Execute"
executeButton.TextColor3 = Color3.new(1, 0, 0)
executeButton.BackgroundColor3 = Color3.new(0, 0, 0)
executeButton.Font = Enum.Font.SourceSansBold
executeButton.TextScaled = true

-- Open/Close Button
local openCloseButton = Instance.new("TextButton", screenGui)
openCloseButton.Size = UDim2.new(0, 30, 0, 30)
openCloseButton.Position = UDim2.new(0, 10, 0.5, -75)
openCloseButton.Text = "<"
openCloseButton.TextColor3 = Color3.new(1, 1, 1)
openCloseButton.BackgroundColor3 = Color3.new(0, 0, 0)
openCloseButton.Font = Enum.Font.SourceSansBold
openCloseButton.TextScaled = true

-- Toggle the GUI visibility when the button is clicked
local isOpen = true
openCloseButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    if isOpen then
        frame.Visible = true
        openCloseButton.Text = "<"
    else
        frame.Visible = false
        openCloseButton.Text = ">"
    end
end)

-- Loadstring to be executed when Execute button is clicked
executeButton.MouseButton1Click:Connect(function()
    local loadstringURL = "https://pastebin.com/raw/n6L7zp6d"  -- Replace with your loadstring URL
    loadstring(game:HttpGet(loadstringURL))() -- Executes the loadstring
end)