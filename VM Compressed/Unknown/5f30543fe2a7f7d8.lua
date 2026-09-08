--// CONFIG
local SavedKey = "FEYKX-9LPQZ-A7M4R-XZ19Q-RF8KT"        -- << YOUR KEY
local KeyLink = "https://direct-link.net/1345659/k575K8FaReTO"   -- << GET KEY LINK
local CorrectKeyScriptURL = "https://raw.githubusercontent.com/FeykHere/Test22/refs/heads/main/DupeX.Txt" 
-- << SCRIPT TO EXECUTE WHEN KEY IS CORRECT

--// UI INSTANCE
local ScreenGui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local Submit = Instance.new("TextButton")
local GetKey = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local TweenService = game:GetService("TweenService")

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--// MAIN FRAME
Main.Parent = ScreenGui
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.35, 0, 0.3, 0)
Main.Size = UDim2.new(0, 350, 0, 200)

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Main

--// TITLE BAR
TitleBar.Parent = Main
TitleBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TitleBar.BorderSizePixel = 0
TitleBar.Size = UDim2.new(1, 0, 0, 40)

local TitleBarCorner = Instance.new("UICorner", TitleBar)
TitleBarCorner.CornerRadius = UDim.new(0, 10)

Title.Parent = TitleBar
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Text = "Key System"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

--// TEXTBOX
KeyBox.Parent = Main
KeyBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyBox.BorderSizePixel = 0
KeyBox.PlaceholderText = "Enter your key..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyBox.Size = UDim2.new(0, 280, 0, 35)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextScaled = true

local KeyCorner = Instance.new("UICorner", KeyBox)
KeyCorner.CornerRadius = UDim.new(0, 6)

--// SUBMIT BUTTON
Submit.Parent = Main
Submit.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Submit.BorderSizePixel = 0
Submit.Text = "Submit"
Submit.TextColor3 = Color3.fromRGB(255, 255, 255)
Submit.Font = Enum.Font.GothamBold
Submit.TextScaled = true
Submit.Position = UDim2.new(0.1, 0, 0.62, 0)
Submit.Size = UDim2.new(0, 130, 0, 40)

local SubmitCorner = Instance.new("UICorner", Submit)
SubmitCorner.CornerRadius = UDim.new(0, 6)

--// GET KEY BUTTON
GetKey.Parent = Main
GetKey.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GetKey.BorderSizePixel = 0
GetKey.Text = "Get Key"
GetKey.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKey.Font = Enum.Font.GothamBold
GetKey.TextScaled = true
GetKey.Position = UDim2.new(0.55, 0, 0.62, 0)
GetKey.Size = UDim2.new(0, 130, 0, 40)

local GetKeyCorner = Instance.new("UICorner", GetKey)
GetKeyCorner.CornerRadius = UDim.new(0, 6)

--// DRAGGING
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

TitleBar.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)

UIS.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)

--// NOTIFICATION FUNCTION (Bread-like)
local function Notify(msg)
	local toast = Instance.new("Frame")
	local tcorner = Instance.new("UICorner")
	local tlabel = Instance.new("TextLabel")

	toast.Parent = ScreenGui
	toast.BackgroundColor3 = Color3.fromRGB(15,15,15)
	toast.BorderSizePixel = 0
	toast.Size = UDim2.new(0, 250, 0, 40)
	toast.Position = UDim2.new(1, 260, 1, -60) -- off-screen (slide-in)

	tcorner.Parent = toast
	tcorner.CornerRadius = UDim.new(0,10)

	tlabel.Parent = toast
	tlabel.BackgroundTransparency = 1
	tlabel.Size = UDim2.new(1,0,1,0)
	tlabel.Font = Enum.Font.GothamBold
	tlabel.Text = msg
	tlabel.TextColor3 = Color3.fromRGB(255,255,255)
	tlabel.TextScaled = true

	-- slide in
	TweenService:Create(toast, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
		Position = UDim2.new(1, -260, 1, -60)
	}):Play()

	task.wait(2)

	-- slide out
	local tween = TweenService:Create(toast, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
		Position = UDim2.new(1, 260, 1, -60)
	})
	tween:Play()
	tween.Completed:Wait()
	toast:Destroy()
end

--// SUBMIT LOGIC
Submit.MouseButton1Click:Connect(function()
	if KeyBox.Text == SavedKey then
		Main:Destroy()
		loadstring(game:HttpGet(CorrectKeyScriptURL))()
	else
		Notify("Key is Incorrect or Expired")
	end
end)

--// GET KEY LOGIC
GetKey.MouseButton1Click:Connect(function()
	setclipboard(KeyLink)
	Notify("Key Link Copied")
end)
