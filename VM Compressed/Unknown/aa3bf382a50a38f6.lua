if _G.alysumloaded then 
	return
else
	_G.alysumloaded = true
end

if not isfolder("alysum") then 
	makefolder("alysum")
end

if not isfile("alysum/key.txt") then
	writefile("alysum/key.txt","")
end

local cam = workspace.CurrentCamera
local x = cam.ViewportSize.X
local y = cam.ViewportSize.Y
local newx = math.floor(x * 0.5)
local newy = math.floor(y * 0.5)

local Selected = "Main"

local AlysumLoader = Instance.new("ScreenGui")
local Alysum = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local VersionSelect = Instance.new("Frame")
local UICorner_2 = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local Main_Script = Instance.new("TextButton")
local Streamable_Script = Instance.new("TextButton")
local KeyInput = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local KeyInputField = Instance.new("TextBox")
local LoadScriptButton = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UIListLayout_2 = Instance.new("UIListLayout")

local bordercolor = Color3.fromRGB(111, 50, 168)

local uistroke1 = Instance.new("UIStroke",Alysum)
uistroke1.Color = bordercolor

local uistroke12 = Instance.new("UIStroke",KeyInput)
uistroke12.Color = bordercolor

local uistroke13 = Instance.new("UIStroke",VersionSelect)
uistroke13.Color = bordercolor

local uistroke132 = Instance.new("UIStroke",LoadScriptButton)
uistroke132.Color = bordercolor
uistroke132.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

AlysumLoader.Name = "AlysumLoader"
AlysumLoader.Parent = game.CoreGui
AlysumLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Alysum.Name = "Alysum"
Alysum.Parent = AlysumLoader
Alysum.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Alysum.BorderColor3 = Color3.fromRGB(0, 0, 0)
Alysum.BorderSizePixel = 0
Alysum.AnchorPoint = Vector2.new(0.5,0.5)
Alysum.Position = UDim2.new(0, newx, 0, newy)
Alysum.Size = UDim2.new(0, 319, 0, 280)


ImageLabel.Parent = Alysum
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Position = UDim2.new(0.341692775, 0, 0, 0)
ImageLabel.Size = UDim2.new(0, 91, 0, 91)
ImageLabel.Image = "rbxassetid://17059497526"

UICorner.Parent = Alysum

VersionSelect.Name = "VersionSelect"
VersionSelect.Parent = Alysum
VersionSelect.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
VersionSelect.BorderColor3 = Color3.fromRGB(0, 0, 0)
VersionSelect.BorderSizePixel = 0
VersionSelect.Position = UDim2.new(0.0940438882, 0, 0.324924469, 0)
VersionSelect.Size = UDim2.new(0, 259, 0, 91)
VersionSelect.ZIndex = 5

UICorner_2.Parent = VersionSelect

UIListLayout.Parent = VersionSelect
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Main_Script.Name = "Main_Script"
Main_Script.Parent = VersionSelect
Main_Script.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Main_Script.BackgroundTransparency = 1.000
Main_Script.BorderColor3 = Color3.fromRGB(0, 0, 0)
Main_Script.BorderSizePixel = 0
Main_Script.Size = UDim2.new(0, 259, 0, 20)
Main_Script.Font = Enum.Font.Code
Main_Script.Text = "Main"
Main_Script.TextColor3 = Color3.fromRGB(255, 255, 255)
Main_Script.TextSize = 14.000

Streamable_Script.Name = "Streamable_Script"
Streamable_Script.Parent = VersionSelect
Streamable_Script.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Streamable_Script.BackgroundTransparency = 1.000
Streamable_Script.BorderColor3 = Color3.fromRGB(0, 0, 0)
Streamable_Script.BorderSizePixel = 0
Streamable_Script.Position = UDim2.new(0, 0, 0.197115391, 0)
Streamable_Script.Size = UDim2.new(0, 259, 0, 20)
Streamable_Script.Font = Enum.Font.Code
Streamable_Script.Text = "Streamable"
Streamable_Script.TextColor3 = Color3.fromRGB(255, 255, 255)
Streamable_Script.TextSize = 14.000
Streamable_Script.TextTransparency = 0.500

local SolaraEdition = Instance.new("TextButton")

SolaraEdition.Name = "SolaraEdition"
SolaraEdition.Parent = VersionSelect
SolaraEdition.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SolaraEdition.BackgroundTransparency = 1.000
SolaraEdition.BorderColor3 = Color3.fromRGB(0, 0, 0)
SolaraEdition.BorderSizePixel = 0
SolaraEdition.Position = UDim2.new(0, 0, 0.197115391, 0)
SolaraEdition.Size = UDim2.new(0, 259, 0, 20)
SolaraEdition.Font = Enum.Font.Code
SolaraEdition.Text = "Solara"
SolaraEdition.TextColor3 = Color3.fromRGB(255, 255, 255)
SolaraEdition.TextSize = 14.000
SolaraEdition.TextTransparency = 0.500

SolaraEdition.MouseButton1Click:Connect(function()
	Selected = "Solara"
	SolaraEdition.TextTransparency = 0
	Main_Script.TextTransparency = 0.5
	Streamable_Script.TextTransparency = 0.5
end)

Main_Script.MouseButton1Click:Connect(function()
	Selected = "Main"
	SolaraEdition.TextTransparency = 0.5
	Main_Script.TextTransparency = 0
	Streamable_Script.TextTransparency = 0.5
end)

Streamable_Script.MouseButton1Click:Connect(function()
	Selected = "Streamable"
	SolaraEdition.TextTransparency = 0.5
	Main_Script.TextTransparency = 0.5
	Streamable_Script.TextTransparency = 0
end)


KeyInput.Name = "KeyInput"
KeyInput.Parent = Alysum
KeyInput.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyInput.BorderSizePixel = 0
KeyInput.Position = UDim2.new(0.0940438882, 0, 0.693763494, 0)
KeyInput.Size = UDim2.new(0, 259, 0, 29)
KeyInput.ZIndex = 3

UICorner_3.Parent = KeyInput

KeyInputField.Name = "KeyInputField"
KeyInputField.Parent = KeyInput
KeyInputField.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
KeyInputField.BackgroundTransparency = 1.000
KeyInputField.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyInputField.BorderSizePixel = 0
KeyInputField.Position = UDim2.new(0.0347490348, 0, 0, 0)
KeyInputField.Size = UDim2.new(0, 250, 0, 29)
KeyInputField.Font = Enum.Font.Code
KeyInputField.PlaceholderText = "Input your key here."
KeyInputField.Text = isfile("alysum/key.txt") and readfile("alysum/key.txt") or ""
KeyInputField.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInputField.TextSize = 14.000
KeyInputField.TextXAlignment = Enum.TextXAlignment.Left

LoadScriptButton.Name = "LoadScriptButton"
LoadScriptButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LoadScriptButton.BackgroundTransparency = 1.000
LoadScriptButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
LoadScriptButton.BorderSizePixel = 0
LoadScriptButton.Position = UDim2.new(0.0940438882, 0, 0.846428573, 0)
LoadScriptButton.Size = UDim2.new(0, 259, 0, 29)
LoadScriptButton.Font = Enum.Font.Code
LoadScriptButton.Text = "Load Alysum"
LoadScriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadScriptButton.TextSize = 14.000
LoadScriptButton.ZIndex = 2

UIListLayout_2.Parent = Alysum
UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.Padding = UDim.new(0, 8)

UICorner_4.Parent = LoadScriptButton

wait()


LoadScriptButton.Parent = Alysum


LoadScriptButton.MouseButton1Click:Connect(function()
	AlysumLoader:Destroy()
	local key = tostring(KeyInputField.Text)
	writefile("alysum/key.txt",key)
	script_key = key;
	if Selected == "Main" then
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2cb68af157ca24ff8de44ddc6c830f93.lua"))()
	elseif Selected == "Streamable" then
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b432b5193c83baf427c3ef25794a7cb.lua"))()
	elseif Selected == "Solara" then
		loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b7b556786ae40eaf682115fc59fecc45.lua"))()
	end
end)
