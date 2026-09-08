local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "Yellow7ButtonGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")


local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,300,0,350)
frame.Position = UDim2.new(0.5,-150,0.5,-175)
frame.BackgroundColor3 = Color3.fromRGB(255,220,0)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui


local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundColor3 = Color3.fromRGB(200,170,0)
title.Text = "prop megapack v2"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 20
title.Parent = frame


-- CLOSE BUTTON

local close = Instance.new("TextButton")
close.Size = UDim2.new(0,35,0,35)
close.Position = UDim2.new(1,-40,0,3)
close.BackgroundColor3 = Color3.fromRGB(255,80,80)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.TextSize = 20
close.Parent = frame


local buttons = {}


for i = 1,7 do
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0,250,0,35)
	button.Position = UDim2.new(0,25,0,45 + ((i-1)*42))
	button.BackgroundColor3 = Color3.fromRGB(255,255,255)
	button.TextColor3 = Color3.fromRGB(0,0,0)
	button.TextSize = 16
	button.Parent = frame
	
	buttons[i] = button
end


-- BUTTON NAME FUNCTION

local function SetButtonName(number, name)
	buttons[number].Text = name
end


-- CHANGE BUTTON NAMES HERE

SetButtonName(1,"b2 spirit bad shape")
SetButtonName(2,"wither (lagger)")
SetButtonName(3,"wither storm")
SetButtonName(4,"wither")
SetButtonName(5,"gojo control")
SetButtonName(6,"avarice scythe")
SetButtonName(7,"b2 spirit")



-- BUTTON FUNCTIONS (EDIT HERE)

buttons[1].MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/we9aonad/raw"))()
end)

buttons[2].MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/6jvLhYaS/raw"))()
end)

buttons[3].MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/5NOFcoUP/raw"))()
end)

buttons[4].MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/q4Js0TjY/raw"))()
end)

buttons[5].MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/3MShESQ2/raw"))()
end)

buttons[6].MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/oneTZn9W/raw"))()
end)

buttons[7].MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://pastefy.app/b0JRIsKj/raw"))()
end)



-- CLOSE FUNCTION

close.MouseButton1Click:Connect(function()
	frame.Visible = false
end)