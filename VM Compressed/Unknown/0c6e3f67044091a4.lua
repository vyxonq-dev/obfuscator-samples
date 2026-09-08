-- ==============================================================================
-- PJR HUB: KEY SYSTEM & DYNAMIC LOADER (WITH CLOSE BUTTON & GET KEY LINK)
-- Cycle: "PJR" -> "KING PJR" (Changes Daily)
-- ==============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Calculate current key based on the day (alternates daily)
local function getDailyKey()
	local daysSinceEpoch = math.floor(os.time() / 86400)
	if daysSinceEpoch % 2 == 0 then
		return "PJR"
	else
		return "KING PJR"
	end
end

local correctKey = getDailyKey()

-- Clean up any existing GUI
if CoreGui:FindFirstChild("PJR_KeySystemGui") then
	CoreGui.PJR_KeySystemGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PJR_KeySystemGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "KeyMainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 245)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -122)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextSize = 14
TitleBar.Font = Enum.Font.GothamBold
TitleBar.Text = "  PJR Hub - Key System Required"
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

-- Close Button (X) at the corner of the title bar
local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.TextColor3 = Color3.fromRGB(220, 50, 50)
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local DescLabel = Instance.new("TextLabel")
DescLabel.Size = UDim2.new(1, -30, 0, 30)
DescLabel.Position = UDim2.new(0, 15, 0, 48)
DescLabel.BackgroundTransparency = 1
DescLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
DescLabel.TextSize = 12
DescLabel.Font = Enum.Font.Gotham
DescLabel.Text = "Please enter today's key to access the hub."
DescLabel.TextXAlignment = Enum.TextXAlignment.Left
DescLabel.TextWrapped = true
DescLabel.Parent = MainFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, -30, 0, 36)
TextBox.Position = UDim2.new(0, 15, 0, 84)
TextBox.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderText = "Enter key here..."
TextBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 110)
TextBox.TextSize = 13
TextBox.Font = Enum.Font.GothamBold
TextBox.ClearTextOnFocus = false
TextBox.Parent = MainFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = TextBox

-- "I don't have the key" clickable text button right under the text box
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(1, -30, 0, 22)
GetKeyBtn.Position = UDim2.new(0, 15, 0, 124)
GetKeyBtn.BackgroundTransparency = 1
GetKeyBtn.TextColor3 = Color3.fromRGB(80, 150, 255)
GetKeyBtn.TextSize = 12
GetKeyBtn.Font = Enum.Font.Gotham
GetKeyBtn.Text = "I don't have the key (Click to copy link)"
GetKeyBtn.TextXAlignment = Enum.TextXAlignment.Left
GetKeyBtn.Parent = MainFrame

GetKeyBtn.MouseButton1Click:Connect(function()
	local link = "https://www.youtube.com/@PJR-AFGHANISAT"
	pcall(function()
		setclipboard(link)
	end)
	GetKeyBtn.Text = "✅ Link copied to clipboard!"
	task.delay(2, function()
		GetKeyBtn.Text = "I don't have the key (Click to copy link)"
	end)
end)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(1, -30, 0, 38)
SubmitBtn.Position = UDim2.new(0, 15, 1, -48)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 220)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 13
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Text = "Verify Key"
SubmitBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = SubmitBtn

SubmitBtn.MouseButton1Click:Connect(function()
	if TextBox.Text == correctKey then
		SubmitBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 90)
		SubmitBtn.Text = "✅ Correct Key! Loading..."
		task.delay(0.6, function()
			ScreenGui:Destroy()
			pcall(function()
				loadstring(game:HttpGet("https://gist.githubusercontent.com/ozabihullah95-bot/358d41dec5383f692b9ccea9c0d43c40/raw/568787251da1666175cf8bfcb4e50422c6684160/hihhh"))()
			end)
		end)
	else
		SubmitBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
		SubmitBtn.Text = "❌ Incorrect Key! Try Again"
		task.delay(1.2, function()
			SubmitBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 220)
			SubmitBtn.Text = "Verify Key"
		end)
	end
end)

print("PJR Key System Initialized.")
