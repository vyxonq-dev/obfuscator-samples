local gui = Instance.new("ScreenGui")
gui.Name = "VersionSelectorGui"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 140)
frame.Position = UDim2.new(0.5, -150, 0.5, -70)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- Title Label
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Choose Version"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

-- New Version Button
local newBtn = Instance.new("TextButton")
newBtn.Parent = frame
newBtn.Size = UDim2.new(0.8, 0, 0, 40)
newBtn.Position = UDim2.new(0.1, 0, 0, 40)
newBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
newBtn.Text = "New Version"
newBtn.TextColor3 = Color3.new(1, 1, 1)
newBtn.Font = Enum.Font.GothamBold
newBtn.TextScaled = true
Instance.new("UICorner", newBtn).CornerRadius = UDim.new(0, 8)

-- Old Version Button
local oldBtn = Instance.new("TextButton")
oldBtn.Parent = frame
oldBtn.Size = UDim2.new(0.8, 0, 0, 40)
oldBtn.Position = UDim2.new(0.1, 0, 0, 90)
oldBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 50)
oldBtn.Text = "Old Version"
oldBtn.TextColor3 = Color3.new(1, 1, 1)
oldBtn.Font = Enum.Font.GothamBold
oldBtn.TextScaled = true
Instance.new("UICorner", oldBtn).CornerRadius = UDim.new(0, 8)

-- Destroy GUI after selection
local function destroyGUI()
	gui:Destroy()
end

-- Play sound function
local function playSound()
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://15675059323"
	sound.Volume = 5
	sound.Parent = workspace
	sound:Play()
	game:GetService("Debris"):AddItem(sound, 5) -- auto cleanup
end

-- Load script functions
newBtn.MouseButton1Click:Connect(function()
	playSound()
	print("Choosed New Version...")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Thyyyynn/Script-test/refs/heads/main/Trowertz%20Hub%20NewTest.lua"))()
	destroyGUI()
end)

oldBtn.MouseButton1Click:Connect(function()
	playSound()
	print("Choosed Old Version...")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Thyyyynn/Thurr-s-Scripts/refs/heads/main/TIAPT%20Troller.lua"))()
	destroyGUI()
end)
