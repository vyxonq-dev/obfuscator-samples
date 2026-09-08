loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/other.lua"))()
local z3USLoader = Instance.new("ScreenGui")
z3USLoader.Name = "Z3US Loader"
z3USLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
z3USLoader.Parent = game:GetService("CoreGui")
z3USLoader.ResetOnSpawn = false
z3USLoader.DisplayOrder = 999999
z3USLoader.IgnoreGuiInset = true

local frame = Instance.new("Frame")
frame.Name = "Frame"
frame.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0
frame.Position = UDim2.fromScale(0.0883, 0.11)
frame.Size = UDim2.fromOffset(878, 550)

frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		local dragStart = input.Position
		local frameStart = frame.Position

		local connection
		connection = game:GetService("UserInputService").InputChanged:Connect(function(inputChanged)
			if inputChanged.UserInputType == Enum.UserInputType.MouseMovement then
				local delta = inputChanged.Position - dragStart
				frame.Position = UDim2.new(
					frameStart.X.Scale,
					frameStart.X.Offset + delta.X,
					frameStart.Y.Scale,
					frameStart.Y.Offset + delta.Y
				)
			end
		end)

		local endConnection
		endConnection = game:GetService("UserInputService").InputEnded:Connect(function(inputEnded)
			if inputEnded.UserInputType == Enum.UserInputType.MouseButton1 then
				connection:Disconnect()
				endConnection:Disconnect()
			end
		end)
	end
end)

local uICorner = Instance.new("UICorner")
uICorner.Name = "UICorner"
uICorner.CornerRadius = UDim.new(0, 25)
uICorner.Parent = frame

local logo = Instance.new("ImageLabel")
logo.Name = "Logo"
logo.BackgroundTransparency = 1
logo.BorderSizePixel = 0
logo.Image = "rbxassetid://92661965333918"
logo.Position = UDim2.fromScale(0.755, 0.2)
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.Size = UDim2.fromOffset(175, 175)
logo.Parent = frame

local arsenal = Instance.new("Frame")
arsenal.Name = "Arsenal"
arsenal.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
arsenal.BackgroundTransparency = 0.9
arsenal.BorderColor3 = Color3.fromRGB(0, 0, 0)
arsenal.BorderSizePixel = 0
arsenal.Position = UDim2.fromScale(0.03, 0.0415)
arsenal.Size = UDim2.fromOffset(330, 65)

local arsenalStroke = Instance.new("UIStroke")
arsenalStroke.Name = "UIStroke"
arsenalStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
arsenalStroke.Color = Color3.fromRGB(26, 29, 37)
arsenalStroke.Thickness = 1.9
arsenalStroke.Parent = arsenal

local uICorner1 = Instance.new("UICorner")
uICorner1.Name = "UICorner"
uICorner1.CornerRadius = UDim.new(0, 25)
uICorner1.Parent = arsenal

local textLabel2 = Instance.new("TextLabel")
textLabel2.Name = "TextLabel"
textLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel2.BackgroundTransparency = 1
textLabel2.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel2.BorderSizePixel = 0
textLabel2.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel2.Position = UDim2.fromScale(0.2, 0.0462)
textLabel2.Size = UDim2.fromOffset(197, 58)
textLabel2.Text = "Arsenal"
textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel2.TextSize = 62
textLabel2.TextWrapped = true
textLabel2.Parent = arsenal

arsenal.Parent = frame

local loadbtn = Instance.new("TextButton")
loadbtn.Name = "Loadbtn"
loadbtn.BackgroundColor3 = Color3.fromRGB(27, 29, 37)
loadbtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
loadbtn.BorderSizePixel = 0
loadbtn.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
loadbtn.Position = UDim2.fromScale(0.527, 0.656)
loadbtn.Size = UDim2.fromOffset(405, 62)
loadbtn.Text = "Load"
loadbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
loadbtn.TextScaled = true
loadbtn.TextSize = 14
loadbtn.TextWrapped = true

local uICorner2 = Instance.new("UICorner")
uICorner2.Name = "UICorner"
uICorner2.CornerRadius = UDim.new(0, 25)
uICorner2.Parent = loadbtn

loadbtn.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
closeButton.BackgroundTransparency = 1
closeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json")
closeButton.Position = UDim2.fromScale(0.949, 0.0172)
closeButton.Size = UDim2.fromOffset(44, 41)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(58, 67, 98)
closeButton.TextScaled = true
closeButton.TextSize = 14
closeButton.TextWrapped = true

local uIStroke1 = Instance.new("UIStroke")
uIStroke1.Name = "UIStroke"
uIStroke1.Color = Color3.fromRGB(255, 255, 255)
uIStroke1.Enabled = false
uIStroke1.Thickness = 1.2
uIStroke1.Parent = closeButton

closeButton.Parent = frame

local textLabel5 = Instance.new("TextLabel")
textLabel5.Name = "TextLabel"
textLabel5.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
textLabel5.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel5.BorderSizePixel = 0
textLabel5.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel5.Position = UDim2.fromScale(0.628, 0.821)
textLabel5.Size = UDim2.fromOffset(200, 50)
textLabel5.Text = "Thank you for using Z3US <3"
textLabel5.TextColor3 = Color3.fromRGB(40, 58, 85)
textLabel5.TextSize = 34
textLabel5.Parent = frame

local textLabel6 = Instance.new("TextLabel")
textLabel6.Name = "TextLabel"
textLabel6.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
textLabel6.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel6.BorderSizePixel = 0
textLabel6.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel6.Position = UDim2.fromScale(0.645, 0.447)
textLabel6.Size = UDim2.fromOffset(200, 50)
textLabel6.Text = "No Script Selected"
textLabel6.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel6.TextSize = 34
textLabel6.Parent = frame

local planks = Instance.new("Frame")
planks.Name = "Planks"
planks.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
planks.BackgroundTransparency = 0.9
planks.BorderColor3 = Color3.fromRGB(0, 0, 0)
planks.BorderSizePixel = 0
planks.Position = UDim2.fromScale(0.03, 0.17786)
planks.Size = UDim2.fromOffset(330, 65)

local planksStroke = Instance.new("UIStroke")
planksStroke.Name = "UIStroke"
planksStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
planksStroke.Color = Color3.fromRGB(26, 29, 37)
planksStroke.Thickness = 1.9
planksStroke.Parent = planks

local uICorner3 = Instance.new("UICorner")
uICorner3.Name = "UICorner"
uICorner3.CornerRadius = UDim.new(0, 25)
uICorner3.Parent = planks

local textLabel7 = Instance.new("TextLabel")
textLabel7.Name = "TextLabel"
textLabel7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel7.BackgroundTransparency = 1
textLabel7.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel7.BorderSizePixel = 0
textLabel7.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel7.Position = UDim2.fromScale(0.2, 0.0462)
textLabel7.Size = UDim2.fromOffset(197, 58)
textLabel7.Text = "Planks"
textLabel7.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel7.TextSize = 62
textLabel7.TextWrapped = true
textLabel7.Parent = planks

planks.Parent = frame

local hypershot = Instance.new("Frame")
hypershot.Name = "Hypershot"
hypershot.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
hypershot.BackgroundTransparency = 0.9
hypershot.BorderColor3 = Color3.fromRGB(0, 0, 0)
hypershot.BorderSizePixel = 0
hypershot.Position = UDim2.fromScale(0.03, 0.58694)
hypershot.Size = UDim2.fromOffset(330, 65)

local hypershotStroke = Instance.new("UIStroke")
hypershotStroke.Name = "UIStroke"
hypershotStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
hypershotStroke.Color = Color3.fromRGB(26, 29, 37)
hypershotStroke.Thickness = 1.9
hypershotStroke.Parent = hypershot

local uICornerHypershot = Instance.new("UICorner")
uICornerHypershot.Name = "UICorner"
uICornerHypershot.CornerRadius = UDim.new(0, 25)
uICornerHypershot.Parent = hypershot

local textLabelHypershot = Instance.new("TextLabel")
textLabelHypershot.Name = "TextLabel"
textLabelHypershot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabelHypershot.BackgroundTransparency = 1
textLabelHypershot.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabelHypershot.BorderSizePixel = 0
textLabelHypershot.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabelHypershot.Position = UDim2.fromScale(0.15, 0.0462)
textLabelHypershot.Size = UDim2.fromOffset(250, 58)
textLabelHypershot.Text = "Hypershot"
textLabelHypershot.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabelHypershot.TextSize = 62
textLabelHypershot.TextWrapped = true
textLabelHypershot.Parent = hypershot

hypershot.Parent = frame

local universal = Instance.new("Frame")
universal.Name = "Universal"
universal.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
universal.BackgroundTransparency = 0.9
universal.BorderColor3 = Color3.fromRGB(0, 0, 0)
universal.BorderSizePixel = 0
universal.Position = UDim2.fromScale(0.03, 0.7233)
universal.Size = UDim2.fromOffset(330, 65)

local universalStroke = Instance.new("UIStroke")
universalStroke.Name = "UIStroke"
universalStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
universalStroke.Color = Color3.fromRGB(26, 29, 37)
universalStroke.Thickness = 1.9
universalStroke.Parent = universal

local uICorner4 = Instance.new("UICorner")
uICorner4.Name = "UICorner"
uICorner4.CornerRadius = UDim.new(0, 25)
uICorner4.Parent = universal

local textLabel8 = Instance.new("TextLabel")
textLabel8.Name = "TextLabel"
textLabel8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel8.BackgroundTransparency = 1
textLabel8.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel8.BorderSizePixel = 0
textLabel8.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel8.Position = UDim2.fromScale(0.2, 0.0462)
textLabel8.Size = UDim2.fromOffset(197, 58)
textLabel8.Text = "Universal"
textLabel8.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel8.TextSize = 62
textLabel8.TextWrapped = true
textLabel8.Parent = universal

universal.Parent = frame

local gunfightArena = Instance.new("Frame")
gunfightArena.Name = "GunfightArena"
gunfightArena.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
gunfightArena.BackgroundTransparency = 0.9
gunfightArena.BorderColor3 = Color3.fromRGB(0, 0, 0)
gunfightArena.BorderSizePixel = 0
gunfightArena.Position = UDim2.fromScale(0.03, 0.45058)
gunfightArena.Size = UDim2.fromOffset(330, 65)

local gunfightArenaStroke = Instance.new("UIStroke")
gunfightArenaStroke.Name = "UIStroke"
gunfightArenaStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
gunfightArenaStroke.Color = Color3.fromRGB(26, 29, 37)
gunfightArenaStroke.Thickness = 1.9
gunfightArenaStroke.Parent = gunfightArena

local uICorner5 = Instance.new("UICorner")
uICorner5.Name = "UICorner"
uICorner5.CornerRadius = UDim.new(0, 25)
uICorner5.Parent = gunfightArena

local textLabel9 = Instance.new("TextLabel")
textLabel9.Name = "TextLabel"
textLabel9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel9.BackgroundTransparency = 1
textLabel9.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel9.BorderSizePixel = 0
textLabel9.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel9.Position = UDim2.fromScale(0.00639, 0.0462)
textLabel9.Size = UDim2.fromOffset(322, 58)
textLabel9.Text = "Gunfight Arena"
textLabel9.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel9.TextSize = 62
textLabel9.TextWrapped = true
textLabel9.Parent = gunfightArena

gunfightArena.Parent = frame

local counterblox = Instance.new("Frame")
counterblox.Name = "Counterblox"
counterblox.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
counterblox.BackgroundTransparency = 0.9
counterblox.BorderColor3 = Color3.fromRGB(0, 0, 0)
counterblox.BorderSizePixel = 0
counterblox.Position = UDim2.fromScale(0.03, 0.31422)
counterblox.Size = UDim2.fromOffset(330, 65)

local counterbloxStroke = Instance.new("UIStroke")
counterbloxStroke.Name = "UIStroke"
counterbloxStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
counterbloxStroke.Color = Color3.fromRGB(26, 29, 37)
counterbloxStroke.Thickness = 1.9
counterbloxStroke.Parent = counterblox

local uICorner6 = Instance.new("UICorner")
uICorner6.Name = "UICorner"
uICorner6.CornerRadius = UDim.new(0, 25)
uICorner6.Parent = counterblox

local textLabel10 = Instance.new("TextLabel")
textLabel10.Name = "TextLabel"
textLabel10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel10.BackgroundTransparency = 1
textLabel10.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel10.BorderSizePixel = 0
textLabel10.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel10.Position = UDim2.fromScale(0.0276, 0.0462)
textLabel10.Size = UDim2.fromOffset(311, 58)
textLabel10.Text = "Counterblox"
textLabel10.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel10.TextSize = 62
textLabel10.TextWrapped = true
textLabel10.Parent = counterblox

counterblox.Parent = frame

local rivals = Instance.new("Frame")
rivals.Name = "Rivals"
rivals.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
rivals.BackgroundTransparency = 0.9
rivals.BorderColor3 = Color3.fromRGB(0, 0, 0)
rivals.BorderSizePixel = 0
rivals.Position = UDim2.fromScale(0.03, 0.85966)
rivals.Size = UDim2.fromOffset(330, 65)

local rivalsStroke = Instance.new("UIStroke")
rivalsStroke.Name = "UIStroke"
rivalsStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
rivalsStroke.Color = Color3.fromRGB(26, 29, 37)
rivalsStroke.Thickness = 1.9
rivalsStroke.Parent = rivals

local uICorner7 = Instance.new("UICorner")
uICorner7.Name = "UICorner"
uICorner7.CornerRadius = UDim.new(0, 25)
uICorner7.Parent = rivals

local textLabel11 = Instance.new("TextLabel")
textLabel11.Name = "TextLabel"
textLabel11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textLabel11.BackgroundTransparency = 1
textLabel11.BorderColor3 = Color3.fromRGB(0, 0, 0)
textLabel11.BorderSizePixel = 0
textLabel11.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
textLabel11.Position = UDim2.fromScale(0.2, 0.0462)
textLabel11.Size = UDim2.fromOffset(197, 58)
textLabel11.Text = "Rivals"
textLabel11.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel11.TextSize = 62
textLabel11.TextWrapped = true
textLabel11.Parent = rivals

rivals.Parent = frame

local rivalsToggleContainer = Instance.new("Frame")
rivalsToggleContainer.Name = "RivalsToggleContainer"
rivalsToggleContainer.Parent = frame
rivalsToggleContainer.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
rivalsToggleContainer.BackgroundTransparency = 0.9
rivalsToggleContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
rivalsToggleContainer.BorderSizePixel = 0
rivalsToggleContainer.Position = UDim2.new(0.60, 0, 0.53, 0)
rivalsToggleContainer.Size = UDim2.new(0, 280, 0, 65)
rivalsToggleContainer.Visible = false

local containerStroke = Instance.new("UIStroke")
containerStroke.Parent = rivalsToggleContainer
containerStroke.Color = Color3.fromRGB(26, 29, 37)
containerStroke.Thickness = 2
containerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local uICornerContainer = Instance.new("UICorner")
uICornerContainer.CornerRadius = UDim.new(0, 25)
uICornerContainer.Parent = rivalsToggleContainer

local autoloadToggle = Instance.new("Frame")
autoloadToggle.Name = "AutoloadToggle"
autoloadToggle.Parent = rivalsToggleContainer
autoloadToggle.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
autoloadToggle.BackgroundTransparency = 0.9
autoloadToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
autoloadToggle.BorderSizePixel = 0
autoloadToggle.Position = UDim2.new(0.05, 0, 0.15, 0)
autoloadToggle.Size = UDim2.new(0, 120, 0, 45)

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Parent = autoloadToggle
toggleStroke.Color = Color3.fromRGB(26, 29, 37)
toggleStroke.Thickness = 2
toggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local uICornerToggle = Instance.new("UICorner")
uICornerToggle.CornerRadius = UDim.new(0, 15)
uICornerToggle.Parent = autoloadToggle

local toggleLabel = Instance.new("TextLabel")
toggleLabel.Name = "ToggleLabel"
toggleLabel.Parent = autoloadToggle
toggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleLabel.BackgroundTransparency = 1
toggleLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
toggleLabel.BorderSizePixel = 0
toggleLabel.Position = UDim2.new(0.05, 0, 0, 0)
toggleLabel.Size = UDim2.new(0, 70, 0, 45)
toggleLabel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
toggleLabel.Text = "Autoload:"
toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleLabel.TextSize = 16
toggleLabel.TextXAlignment = Enum.TextXAlignment.Left

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Parent = autoloadToggle
toggleButton.BackgroundColor3 = Color3.fromRGB(140, 155, 208)
toggleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
toggleButton.BorderSizePixel = 0
toggleButton.Position = UDim2.new(0.60, 0, 0.15, 0)
toggleButton.Size = UDim2.new(0, 40, 0, 30)
toggleButton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
toggleButton.Text = "ON"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextSize = 14
toggleButton.TextWrapped = true

local uICornerToggleBtn = Instance.new("UICorner")
uICornerToggleBtn.CornerRadius = UDim.new(0, 10)
uICornerToggleBtn.Parent = toggleButton

-- Silentload Toggle for Rivals (right side)
local silentloadToggle = Instance.new("Frame")
silentloadToggle.Name = "SilentloadToggle"
silentloadToggle.Parent = rivalsToggleContainer
silentloadToggle.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
silentloadToggle.BackgroundTransparency = 0.9
silentloadToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
silentloadToggle.BorderSizePixel = 0
silentloadToggle.Position = UDim2.new(0.55, 0, 0.15, 0)
silentloadToggle.Size = UDim2.new(0, 120, 0, 45)

local silentloadStroke = Instance.new("UIStroke")
silentloadStroke.Parent = silentloadToggle
silentloadStroke.Color = Color3.fromRGB(26, 29, 37)
silentloadStroke.Thickness = 2
silentloadStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local uICornerSilentload = Instance.new("UICorner")
uICornerSilentload.CornerRadius = UDim.new(0, 15)
uICornerSilentload.Parent = silentloadToggle

local silentloadLabel = Instance.new("TextLabel")
silentloadLabel.Name = "SilentloadLabel"
silentloadLabel.Parent = silentloadToggle
silentloadLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
silentloadLabel.BackgroundTransparency = 1
silentloadLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
silentloadLabel.BorderSizePixel = 0
silentloadLabel.Position = UDim2.new(0.05, 0, 0, 0)
silentloadLabel.Size = UDim2.new(0, 70, 0, 45)
silentloadLabel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
silentloadLabel.Text = "Silentload :"
silentloadLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
silentloadLabel.TextSize = 16
silentloadLabel.TextXAlignment = Enum.TextXAlignment.Left

local silentloadButton = Instance.new("TextButton")
silentloadButton.Name = "SilentloadButton"
silentloadButton.Parent = silentloadToggle
silentloadButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
silentloadButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
silentloadButton.BorderSizePixel = 0
silentloadButton.Position = UDim2.new(0.60, 0, 0.15, 0)
silentloadButton.Size = UDim2.new(0, 40, 0, 30)
silentloadButton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
silentloadButton.Text = "OFF"
silentloadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
silentloadButton.TextSize = 14
silentloadButton.TextWrapped = true

local uICornerSilentloadBtn = Instance.new("UICorner")
uICornerSilentloadBtn.CornerRadius = UDim.new(0, 10)
uICornerSilentloadBtn.Parent = silentloadButton

frame.Parent = z3USLoader

local selectedOption = nil
local selectedColor = Color3.fromRGB(140, 155, 208)
local defaultColor = Color3.fromRGB(26, 29, 37)
local autoloadEnabled = true
local silentloadEnabled = false
local version = "New"

local VersionToggle = Instance.new("Frame")
VersionToggle.Name = "VersionToggle"
VersionToggle.Parent = frame
VersionToggle.BackgroundColor3 = Color3.fromRGB(17, 18, 20)
VersionToggle.BackgroundTransparency = 0.9
VersionToggle.BorderColor3 = Color3.fromRGB(0, 0, 0)
VersionToggle.BorderSizePixel = 0
VersionToggle.Position = UDim2.new(0.60, 0, 0.53, 0)
VersionToggle.Size = UDim2.new(0, 280, 0, 50)
VersionToggle.Visible = false

local versiontoggleStroke = Instance.new("UIStroke")
versiontoggleStroke.Parent = VersionToggle
versiontoggleStroke.Color = Color3.fromRGB(26, 29, 37)
versiontoggleStroke.Thickness = 2
versiontoggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local uICornerversionToggle = Instance.new("UICorner")
uICornerversionToggle.CornerRadius = UDim.new(0, 25)
uICornerversionToggle.Parent = VersionToggle

local versionLabel = Instance.new("TextLabel")
versionLabel.Name = "versionLabel"
versionLabel.Parent = VersionToggle
versionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
versionLabel.BackgroundTransparency = 1
versionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
versionLabel.BorderSizePixel = 0
versionLabel.Position = UDim2.new(0.05, 0, 0, 0)
versionLabel.Size = UDim2.new(0, 160, 0, 50)
versionLabel.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
versionLabel.Text = "Version:"
versionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
versionLabel.TextSize = 20
versionLabel.TextXAlignment = Enum.TextXAlignment.Left

local versionButton = Instance.new("TextButton")
versionButton.Name = "versionButton"
versionButton.Parent = VersionToggle
versionButton.BackgroundColor3 = Color3.fromRGB(140, 155, 208)
versionButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
versionButton.BorderSizePixel = 0
versionButton.Position = UDim2.new(0.65, 0, 0.15, 0)
versionButton.Size = UDim2.new(0, 80, 0, 35)
versionButton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json")
versionButton.Text = "New"
versionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
versionButton.TextSize = 18
versionButton.TextWrapped = true

local uICornerversionButton = Instance.new("UICorner")
uICornerversionButton.CornerRadius = UDim.new(0, 15)
uICornerversionButton.Parent = versionButton


local function updateToggleAppearance()
	if autoloadEnabled then
		toggleButton.BackgroundColor3 = Color3.fromRGB(140, 155, 208)
		toggleButton.Text = "ON"
	else
		toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		toggleButton.Text = "OFF"
	end
	
	if silentloadEnabled then
		silentloadButton.BackgroundColor3 = Color3.fromRGB(140, 155, 208)
		silentloadButton.Text = "ON"
	else
		silentloadButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		silentloadButton.Text = "OFF"
	end

	if version == "New" then
		versionButton.BackgroundColor3 = Color3.fromRGB(140, 155, 208)
		versionButton.Text = "New"
	else
		versionButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		versionButton.Text = "Old"
	end
end


local function selectScript(scriptFrame, scriptName)
	arsenalStroke.Color = defaultColor
	planksStroke.Color = defaultColor
	rivalsStroke.Color = defaultColor
	counterbloxStroke.Color = defaultColor
	universalStroke.Color = defaultColor
	gunfightArenaStroke.Color = defaultColor
	hypershotStroke.Color = defaultColor

	rivalsToggleContainer.Visible = false
	VersionToggle.Visible = false

	if scriptFrame then
		scriptFrame:FindFirstChildOfClass("UIStroke").Color = selectedColor
		selectedOption = scriptName
		textLabel6.Text = scriptName

		if scriptName == "Rivals" then
			rivalsToggleContainer.Visible = true
			updateToggleAppearance()
		end

		if scriptName == "Counterblox" then
			VersionToggle.Visible = true
			updateToggleAppearance()
		end
	else 
		selectedOption = nil
		textLabel6.Text = "No Script Selected"
	end
end

arsenal.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(arsenal, "Arsenal")
	end
end)

planks.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(planks, "Planks")
	end
end)

hypershot.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(hypershot, "Hypershot")
	end
end)

rivals.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(rivals, "Rivals")
	end
end)

counterblox.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(counterblox, "Counterblox")
	end
end)

gunfightArena.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(gunfightArena, "Gunfight Arena")
	end
end)

universal.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		selectScript(universal, "Universal")
	end
end)

toggleButton.MouseButton1Click:Connect(function()
	autoloadEnabled = not autoloadEnabled
	updateToggleAppearance()
end)

silentloadButton.MouseButton1Click:Connect(function()
	silentloadEnabled = not silentloadEnabled
	updateToggleAppearance()
end)

versionButton.MouseButton1Click:Connect(function()
	version = if version == "Old" then "New" else "Old"
	updateToggleAppearance()
end)

loadbtn.MouseButton1Click:Connect(function()
	if selectedOption then
		if selectedOption == "Arsenal" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Arsenal%20Beta.lua"))()
		elseif selectedOption == "Planks" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Planks.lua"))()
		elseif selectedOption == "Hypershot" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Hypershot.lua"))()
		elseif selectedOption == "Rivals" then
			repeat task.wait() until game:IsLoaded()
			repeat task.wait() until game:GetService("Players").LocalPlayer and game:GetService("Players").LocalPlayer.Character
			repeat task.wait() until not game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("LoadingScreen")
			getgenv().autoload = autoloadEnabled
			getgenv().silentload = silentloadEnabled
			getgenv().SCRIPT_KEY = ""
			loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/8be52e21a0145a401c446ca7ab2b5df9bd327ea80b0cf1d2fe99e442edd0f9c9/download"))()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Test.lua"))()
		elseif selectedOption == "Counterblox" then
			if version == "New" then
				getgenv().SCRIPT_KEY = ""
				loadstring(game:HttpGet("https://api.junkie-development.de/api/v1/luascripts/public/2438cfd42af811d55492e854318eeda24a73aa5d0b11a403ec1f7542abd8f2f0/download"))()
			else
				loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Counterblox.lua"))()
			end
		elseif selectedOption == "Gunfight Arena" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Gunfight%20Arena.lua"))()
		elseif selectedOption == "Universal" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/blackowl1231/Z3US/refs/heads/main/Games/Z3US%20Universal.lua"))()
		end
	else
		textLabel6.Text = "Please select a script!"
		wait(2)
		textLabel6.Text = "{Selected Script}"
	end
end)

closeButton.MouseButton1Click:Connect(function()
	z3USLoader:Destroy()
end)

updateToggleAppearance()
