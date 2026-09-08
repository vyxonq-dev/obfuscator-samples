-- Mozil Hub GUI with Move + Close/Open
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "MozilHubGUI"
gui.ResetOnSpawn = false

-- Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 280)
frame.Position = UDim2.new(0.5, -150, 0.5, -140)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true -- Enable dragging

-- Rounded corners
local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

-- Title bar
local title = Instance.new("TextLabel", frame)
title.Text = "Mozil Hub"
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Close/Open Button
local toggleButton = Instance.new("TextButton", gui)
toggleButton.Size = UDim2.new(0, 120, 0, 40)
toggleButton.Position = UDim2.new(0, 20, 0, 20)
toggleButton.Text = "Close Mozil Hub"
toggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.Gotham
toggleButton.TextScaled = true
local toggleCorner = Instance.new("UICorner", toggleButton)
toggleCorner.CornerRadius = UDim.new(0, 8)

-- Show/Hide Logic
local isVisible = true
toggleButton.MouseButton1Click:Connect(function()
	isVisible = not isVisible
	frame.Visible = isVisible
	if isVisible then
		toggleButton.Text = "Close Mozil Hub"
	else
		toggleButton.Text = "Open Mozil Hub"
	end
end)

-- Function to create a button
local function createButton(text, positionY, scriptURL)
	local button = Instance.new("TextButton", frame)
	button.Size = UDim2.new(0.8, 0, 0, 40)
	button.Position = UDim2.new(0.1, 0, 0, positionY)
	button.Text = text
	button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.Gotham
	button.TextScaled = true

	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(0, 8)

	button.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(game:HttpGet(scriptURL))()
		end)
		if not success then
			warn("ناتوانرا باربکرێت: " .. tostring(err))
		end
	end)
end

-- Create script buttons
createButton("BrookhavenRP", 50, "https://rawscripts.net/raw/Brookhaven-RP-op-40196")
createButton("Kurd Hub", 100, "https://rawscripts.net/raw/Universal-Script-Kurd-Hub-29484")
createButton("Englishop", 150, "https://rawscripts.net/raw/Universal-Script-Englishop-39257")