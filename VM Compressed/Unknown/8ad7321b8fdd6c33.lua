local screenGui = Instance.new("ScreenGui")
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MathAPI = loadstring(game:HttpGet("https://gist.githubusercontent.com/TreeByte403/fc492e987e1078282ca8a1a6407e7929/raw/c86d1de8044e59f927ee7c3f1ced53ca7a252c6a/MathAPI.lua"))()

screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromScale(0.17, 0.50)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(24, 26, 31)
frame.BackgroundTransparency = 0.08
frame.Active = true
frame.Selectable = true
frame.Draggable = true
frame.Parent = screenGui

local frame_corner = Instance.new("UICorner")
frame_corner.CornerRadius = UDim.new(0, 16)
frame_corner.Parent = frame

local equation_label = Instance.new("TextLabel")
equation_label.Size = UDim2.fromScale(1, 0.17)
equation_label.Position = UDim2.fromScale(0, 0)
equation_label.BackgroundTransparency = 0.05
equation_label.BackgroundColor3 = Color3.fromRGB(24, 26, 31)
equation_label.Font = Enum.Font.GothamBold
equation_label.Text = ""
equation_label.TextColor3 = Color3.fromRGB(237, 237, 237)
equation_label.TextSize = 30
equation_label.TextXAlignment = Enum.TextXAlignment.Left
equation_label.Parent = frame

local equation_label_corner = Instance.new("UICorner")
equation_label_corner.CornerRadius = UDim.new(0, 16)
equation_label_corner.Parent = equation_label

local row_1 = {"1", "2", "3", "+"}
local row_2 = {"4", "5", "6", "-"}
local row_3 = {"7", "8", "9", "*"}
local row_4 = {"0", ".", "=", "/"}
local element_count = 0
local element_pos_x_1 = 0
local element_pos_x_2 = 0
local element_pos_x_3 = 0
local element_pos_x_4 = 0
local element_pos_y = 0.25

for _, element in row_1 do	
	local button = Instance.new("TextButton")
	button.Size = UDim2.fromScale(0.25, 0.17)
	button.Position = UDim2.fromScale(element_pos_x_1, element_pos_y)
	button.BackgroundTransparency = 0.05
	button.BackgroundColor3 = Color3.fromRGB(24, 26, 31)
	button.Font = Enum.Font.GothamBold
	button.Text = element
	button.TextColor3 = Color3.fromRGB(237, 237, 237)
	button.TextSize = 24
	button.Parent = frame

	button.MouseButton1Click:Connect(function()
		equation_label.Text = equation_label.Text .. button.Text
	end)

	element_pos_x_1 += 0.25
	element_count += 1

	if element_count == 4 then
		element_pos_y += 0.17
	end
end

for _, element in row_2 do	
	local button = Instance.new("TextButton")
	button.Size = UDim2.fromScale(0.25, 0.17)
	button.Position = UDim2.fromScale(element_pos_x_2, element_pos_y)
	button.BackgroundTransparency = 0.05
	button.BackgroundColor3 = Color3.fromRGB(24, 26, 31)
	button.Font = Enum.Font.GothamBold
	button.Text = element
	button.TextColor3 = Color3.fromRGB(237, 237, 237)
	button.TextSize = 24
	button.Parent = frame

	button.MouseButton1Click:Connect(function()
		equation_label.Text = equation_label.Text .. button.Text
	end)

	element_pos_x_2 += 0.25
	element_count += 1

	if element_count == 8 then
		element_pos_y += 0.17
	end
end

for _, element in row_3 do	
	local button = Instance.new("TextButton")
	button.Size = UDim2.fromScale(0.25, 0.17)
	button.Position = UDim2.fromScale(element_pos_x_3, element_pos_y)
	button.BackgroundTransparency = 0.05
	button.BackgroundColor3 = Color3.fromRGB(24, 26, 31)
	button.Font = Enum.Font.GothamBold
	button.Text = element
	button.TextColor3 = Color3.fromRGB(237, 237, 237)
	button.TextSize = 24
	button.Parent = frame

	button.MouseButton1Click:Connect(function()
		equation_label.Text = equation_label.Text .. button.Text
	end)

	element_pos_x_3 += 0.25
	element_count += 1

	if element_count == 12 then
		element_pos_y += 0.17
	end
end

for _, element in row_4 do	
	local button = Instance.new("TextButton")
	button.Size = UDim2.fromScale(0.25, 0.17)
	button.Position = UDim2.fromScale(element_pos_x_4, element_pos_y)
	button.BackgroundTransparency = 0.05
	button.BackgroundColor3 = Color3.fromRGB(24, 26, 31)
	button.Font = Enum.Font.GothamBold
	button.Text = element
	button.TextColor3 = Color3.fromRGB(237, 237, 237)
	button.TextSize = 24
	button.Parent = frame

	if button.Text ~= "=" then
		button.MouseButton1Click:Connect(function()
			equation_label.Text = equation_label.Text .. button.Text
		end)
	else
		button.MouseButton1Click:Connect(function()
			local result = MathAPI:Calculate(equation_label.Text)

			equation_label.Text = result
		end)
	end

	element_pos_x_4 += 0.25
	element_count += 1
end

element_pos_y += 0.17

local clear_button = Instance.new("TextButton")
clear_button.Size = UDim2.fromScale(0.038, 0.075)
clear_button.Position = UDim2.fromScale(0.020, 0.020)
clear_button.BackgroundTransparency = 0.05
clear_button.BackgroundColor3 = Color3.fromRGB(24, 26, 31)
clear_button.Font = Enum.Font.GothamBold
clear_button.Text = "Clear"
clear_button.TextColor3 = Color3.fromRGB(237, 237, 237)
clear_button.TextSize = 24
clear_button.Parent = screenGui

clear_button.MouseButton1Click:Connect(function()
	equation_label.Text = ""
end)
