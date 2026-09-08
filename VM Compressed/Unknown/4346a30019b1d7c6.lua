-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local CopyButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 357, 0, 194)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 357, 0, 46)
TextLabel.Font = Enum.Font.Nunito
TextLabel.Text = "LOADER"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeTransparency = 0.000
TextLabel.TextWrapped = true

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.202109233, 0)
TextLabel_2.Size = UDim2.new(0, 357, 0, 53)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Copy the loadstring & paste it in your executor."
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0, 0, 0.493182659, 0)
TextBox.Size = UDim2.new(0, 357, 0, 50)
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = [[loadstring(game:HttpGet("https://pastebin.com/raw/BBmCUwQg"))()]]
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.TextScaled = true
TextBox.TextSize = 14.000
TextBox.TextWrapped = true
TextBox.ClearTextOnFocus = false

CopyButton.Name = "CopyButton"
CopyButton.Parent = Frame
CopyButton.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
CopyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CopyButton.BorderSizePixel = 0
CopyButton.Position = UDim2.new(0.218487397, 0, 0.786981285, 0)
CopyButton.Size = UDim2.new(0, 200, 0, 34)
CopyButton.Font = Enum.Font.SourceSans
CopyButton.Text = "COPY & EXECUTE"
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.TextScaled = true
CopyButton.TextSize = 14.000
CopyButton.TextWrapped = true

CopyButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	local Clip = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set) or toClipboard
	if Clip then
		Clip([[loadstring(game:HttpGet("https://pastebin.com/raw/BBmCUwQg"))()]])
	end
	loadstring(game:HttpGet("https://pastebin.com/raw/BBmCUwQg"))()
end)