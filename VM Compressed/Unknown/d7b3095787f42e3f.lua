local UserInputService = game:GetService("UserInputService")
local Clipboard = setclipboard or toclipboard or function() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GodHubKeyAccess"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "God Hub-Key Access"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 24
Title.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 0, 0, 30)
TextBox.Position = UDim2.new(0.1, 0, 0, 40)
TextBox.PlaceholderText = "Enter Key Here"
TextBox.ClearTextOnFocus = false
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.Font = Enum.Font.SourceSans
TextBox.TextSize = 20
TextBox.Parent = Frame

local VerifyButton = Instance.new("TextButton")
VerifyButton.Size = UDim2.new(0.35, 0, 0, 30)
VerifyButton.Position = UDim2.new(0.1, 0, 0, 80)
VerifyButton.Text = "Verify"
VerifyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
VerifyButton.TextColor3 = Color3.new(1, 1, 1)
VerifyButton.Font = Enum.Font.SourceSansBold
VerifyButton.TextSize = 20
VerifyButton.Parent = Frame

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Size = UDim2.new(0.45, 0, 0, 30)
GetKeyButton.Position = UDim2.new(0.5, 0, 0, 80)
GetKeyButton.Text = "Get Key (Linkverter)"
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
GetKeyButton.TextColor3 = Color3.new(1, 1, 1)
GetKeyButton.Font = Enum.Font.SourceSansBold
GetKeyButton.TextSize = 20
GetKeyButton.Parent = Frame

VerifyButton.MouseButton1Click:Connect(function()
	if TextBox.Text == "GodHub123" then
		ScreenGui:Destroy()
		loadstring(game:HttpGet("https://pastebin.com/raw/1ftEe80M"))()
	end
end)

GetKeyButton.MouseButton1Click:Connect(function()
	Clipboard("https://link-target.net/4014949/U7mGWqzQOcHP")
end)
