local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- CONFIG
local VALID_KEY = "ALUKSX"
local LINK = "https://link-center.net/1417470/IPofulCGUdHg"
local SCRIPT_URL = "https://raw.githubusercontent.com/zenss555a/script/refs/heads/main/Prison-Life.lua"

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KeyGui"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 400, 0, 220)
frame.Position = UDim2.new(0.5, -200, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "Key System"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextScaled = true

local textBox = Instance.new("TextBox")
textBox.Parent = frame
textBox.Size = UDim2.new(0, 300, 0, 40)
textBox.Position = UDim2.new(0.5, -150, 0, 60)
textBox.PlaceholderText = "Enter key here"
textBox.Text = ""
textBox.TextScaled = true

local copyButton = Instance.new("TextButton")
copyButton.Parent = frame
copyButton.Size = UDim2.new(0, 160, 0, 40)
copyButton.Position = UDim2.new(0.5, -80, 0, 115)
copyButton.Text = "Copy Key Link"

local submitButton = Instance.new("TextButton")
submitButton.Parent = frame
submitButton.Size = UDim2.new(0, 160, 0, 40)
submitButton.Position = UDim2.new(0.5, -80, 0, 165)
submitButton.Text = "Submit Key"

-- COPY BUTTON
copyButton.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(LINK)
		copyButton.Text = "Copied!"
		task.wait(1.5)
		copyButton.Text = "Copy Key Link"
	else
		copyButton.Text = "Clipboard Unsupported"
	end
end)

-- KEY CHECK
submitButton.MouseButton1Click:Connect(function()
	if textBox.Text == VALID_KEY then
		submitButton.Text = "Loading..."
		gui:Destroy()

		loadstring(game:HttpGet(SCRIPT_URL))()
	else
		submitButton.Text = "Wrong Key"
		task.wait(1.5)
		submitButton.Text = "Submit Key"
	end
end)