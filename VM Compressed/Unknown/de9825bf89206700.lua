-- Prison Life Gui Made by TubersXXX (TubersXXXalt)
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PrisonLifeGui"
gui.ResetOnSpawn = false


local openButton = Instance.new("TextButton", gui)
openButton.Size = UDim2.new(0, 150, 0, 40)
openButton.Position = UDim2.new(0, 10, 0, 10)
openButton.Text = "Open GUI"
openButton.Visible = false
openButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextSize = 18


local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 400, 0, 370)
frame.Position = UDim2.new(0.5, -200, 0.5, -185)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true


local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Text = "Prison Life OP GUI - Made by TubersXXX"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.BorderSizePixel = 0


local closeButton = Instance.new("TextButton", frame)
closeButton.Size = UDim2.new(0, 80, 0, 30)
closeButton.Position = UDim2.new(1, -90, 0, 35)
closeButton.Text = "Close"
closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

closeButton.MouseButton1Click:Connect(function()
    frame.Visible = false
    openButton.Visible = true
end)

openButton.MouseButton1Click:Connect(function()
    frame.Visible = true
    openButton.Visible = false
end)

-- Function to create buttons
local function createButton(text, position, callback)
	local button = Instance.new("TextButton", frame)
	button.Size = UDim2.new(0, 150, 0, 30)
	button.Position = position
	button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.TextSize = 14
	button.Text = text
	button.BorderSizePixel = 0
	button.MouseButton1Click:Connect(callback)
	return button
end


createButton("Prison Life Admin", UDim2.new(0, 20, 0, 80), function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua"))()
end)

createButton("ESP On", UDim2.new(0, 20, 0, 120), function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))()
end)

createButton("ESP Off", UDim2.new(0, 200, 0, 120), function()
	if _G.UnnamedESP then
		_G.UnnamedESP:Toggle(false)
	end
end)

createButton("Fly", UDim2.new(0, 20, 0, 160), function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)


local tpBox = Instance.new("TextBox", frame)
tpBox.Size = UDim2.new(0, 250, 0, 30)
tpBox.Position = UDim2.new(0, 20, 0, 200)
tpBox.PlaceholderText = "Gib Koordinaten ein: x,y,z"
tpBox.Text = ""
tpBox.TextSize = 14
tpBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
tpBox.TextColor3 = Color3.fromRGB(255, 255, 255)

createButton("Teleport", UDim2.new(0, 280, 0, 200), function()
	local coords = {}
	for v in string.gmatch(tpBox.Text, "[^,]+") do
		table.insert(coords, tonumber(v))
	end
	if #coords == 3 then
		local char = player.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame = CFrame.new(coords[1], coords[2], coords[3])
		end
	end
end)


local speedBox = Instance.new("TextBox", frame)
speedBox.Size = UDim2.new(0, 250, 0, 30)
speedBox.Position = UDim2.new(0, 20, 0, 240)
speedBox.PlaceholderText = "Gib gewünschte Geschwindigkeit ein"
speedBox.Text = ""
speedBox.TextSize = 14
speedBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)

createButton("Set Speed", UDim2.new(0, 280, 0, 240), function()
	local speed = tonumber(speedBox.Text)
	if speed and player.Character and player.Character:FindFirstChild("Humanoid") then
		player.Character.Humanoid.WalkSpeed = speed
	end
end)