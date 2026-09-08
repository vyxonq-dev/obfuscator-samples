local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "Vogue Hub"
Junkie.identifier = "1023123"
Junkie.provider = "Vogue Hub"

local function hasFileSystemSupport()
	local hasWritefile = pcall(function() return type(writefile) == "function" end)
	local hasReadfile = pcall(function() return type(readfile) == "function" end)
	local hasIsfile = pcall(function() return type(isfile) == "function" end)
	return hasWritefile and hasReadfile and hasIsfile
end

local fileSystemSupported = hasFileSystemSupport()

local function saveVerifiedKey(key)
	if not fileSystemSupported then return false end
	local ok = pcall(function()
		writefile("vogue_verified_key.txt", key)
	end)
	return ok
end

local function loadVerifiedKey()
	if not fileSystemSupported then 
		return nil 
	end
	
	local ok, content = pcall(function()
		return readfile("vogue_verified_key.txt")
	end)
	
	if not ok or not content then 
		return nil 
	end
	return content
end

local function clearSavedKey()
	if not fileSystemSupported then return false end
	local ok = pcall(function() delfile("vogue_verified_key.txt") end)
	return ok
end

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local nameofthescript = "Vogue Hub"
local whoisitmadeby = "https://discord.gg/BcUNEvaJ"
local thenoteofthekey = ""

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TopBar = Instance.new("Frame")
local TopBarCorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local CloseCorner = Instance.new("UICorner")

local ContentFrame = Instance.new("Frame")
local NameLabel = Instance.new("TextLabel")
local KeyTextbox = Instance.new("TextBox")
local KeyBoxCorner = Instance.new("UICorner")
local GetKeyButton = Instance.new("TextButton")
local GetKeyButtonCorner = Instance.new("UICorner")
local CheckButton = Instance.new("TextButton")
local CheckButtonCorner = Instance.new("UICorner")
local MadeByLabel = Instance.new("TextLabel")
local NoteLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")

ScreenGui.Name = "ModernKeySystem"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(42, 42, 45)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -165)
MainFrame.Size = UDim2.new(0, 400, 0, 360)
MainFrame.BackgroundTransparency = 0.1
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 1

UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 38)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.ZIndex = 2

TopBarCorner.CornerRadius = UDim.new(0, 14)
TopBarCorner.Parent = TopBar

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 20, 0, 0)
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = nameofthescript
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 3

CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -40, 0.5, -12)
CloseButton.Size = UDim2.new(0, 24, 0, 24)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 20
CloseButton.ZIndex = 3

CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundTransparency = 1
ContentFrame.Position = UDim2.new(0, 0, 0, 50)
ContentFrame.Size = UDim2.new(1, 0, 1, -50)
ContentFrame.ZIndex = 2

NameLabel.Name = "NameLabel"
NameLabel.Parent = ContentFrame
NameLabel.BackgroundTransparency = 1
NameLabel.Position = UDim2.new(0, 30, 0, 30)
NameLabel.Size = UDim2.new(1, -60, 0, 20)
NameLabel.Font = Enum.Font.Gotham
NameLabel.Text = "Key System"
NameLabel.TextColor3 = Color3.fromRGB(180, 180, 185)
NameLabel.TextSize = 14
NameLabel.TextXAlignment = Enum.TextXAlignment.Left
NameLabel.ZIndex = 3

StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = ContentFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 30, 0, 55)
StatusLabel.Size = UDim2.new(1, -60, 0, 16)
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Text = "No key detected"
StatusLabel.TextColor3 = Color3.fromRGB(249, 115, 22)
StatusLabel.TextSize = 13
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.ZIndex = 3

KeyTextbox.Name = "KeyTextbox"
KeyTextbox.Parent = ContentFrame
KeyTextbox.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
KeyTextbox.BorderSizePixel = 0
KeyTextbox.Position = UDim2.new(0, 30, 0, 85)
KeyTextbox.Size = UDim2.new(1, -60, 0, 45)
KeyTextbox.Font = Enum.Font.Gotham
KeyTextbox.PlaceholderText = "Enter Key"
KeyTextbox.PlaceholderColor3 = Color3.fromRGB(120, 120, 125)
KeyTextbox.Text = ""
KeyTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextbox.TextSize = 15
KeyTextbox.ZIndex = 3
KeyTextbox.ClearTextOnFocus = false

KeyBoxCorner.CornerRadius = UDim.new(0, 10)
KeyBoxCorner.Parent = KeyTextbox

GetKeyButton.Name = "GetKeyButton"
GetKeyButton.Parent = ContentFrame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 75)
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Position = UDim2.new(0, 30, 0, 145)
GetKeyButton.Size = UDim2.new(1, -60, 0, 45)
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.Text = "Get Key"
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextSize = 15
GetKeyButton.ZIndex = 3
GetKeyButton.AutoButtonColor = false

GetKeyButtonCorner.CornerRadius = UDim.new(0, 10)
GetKeyButtonCorner.Parent = GetKeyButton

CheckButton.Name = "CheckButton"
CheckButton.Parent = ContentFrame
CheckButton.BackgroundColor3 = Color3.fromRGB(70, 70, 75)
CheckButton.BorderSizePixel = 0
CheckButton.Position = UDim2.new(0, 30, 0, 205)
CheckButton.Size = UDim2.new(1, -60, 0, 45)
CheckButton.Font = Enum.Font.GothamBold
CheckButton.Text = "Check Key"
CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckButton.TextSize = 15
CheckButton.ZIndex = 3
CheckButton.AutoButtonColor = false

CheckButtonCorner.CornerRadius = UDim.new(0, 10)
CheckButtonCorner.Parent = CheckButton

MadeByLabel.Name = "MadeByLabel"
MadeByLabel.Parent = ContentFrame
MadeByLabel.BackgroundTransparency = 1
MadeByLabel.Position = UDim2.new(0, 30, 0, 265)
MadeByLabel.Size = UDim2.new(1, -60, 0, 15)
MadeByLabel.Font = Enum.Font.Gotham
MadeByLabel.Text = "free key " .. whoisitmadeby
MadeByLabel.TextColor3 = Color3.fromRGB(140, 140, 145)
MadeByLabel.TextSize = 12
MadeByLabel.TextXAlignment = Enum.TextXAlignment.Left
MadeByLabel.ZIndex = 3

NoteLabel.Name = "NoteLabel"
NoteLabel.Parent = ContentFrame
NoteLabel.BackgroundTransparency = 1
NoteLabel.Position = UDim2.new(0, 30, 1, -35)
NoteLabel.Size = UDim2.new(1, -60, 0, 15)
NoteLabel.Font = Enum.Font.Gotham
NoteLabel.Text = thenoteofthekey
NoteLabel.TextColor3 = Color3.fromRGB(140, 140, 145)
NoteLabel.TextSize = 11
NoteLabel.TextXAlignment = Enum.TextXAlignment.Center
NoteLabel.ZIndex = 3

local function createTween(object, properties, duration)
	local tweenInfo = TweenInfo.new(
		duration or 0.3,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.Out
	)
	return TweenService:Create(object, tweenInfo, properties)
end

GetKeyButton.MouseEnter:Connect(function()
	createTween(GetKeyButton, {BackgroundColor3 = Color3.fromRGB(85, 85, 90)}):Play()
end)

GetKeyButton.MouseLeave:Connect(function()
	createTween(GetKeyButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 75)}):Play()
end)

CheckButton.MouseEnter:Connect(function()
	createTween(CheckButton, {BackgroundColor3 = Color3.fromRGB(85, 85, 90)}):Play()
end)

CheckButton.MouseLeave:Connect(function()
	createTween(CheckButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 75)}):Play()
end)

CloseButton.MouseEnter:Connect(function()
	createTween(CloseButton, {BackgroundColor3 = Color3.fromRGB(200, 50, 50)}):Play()
end)

CloseButton.MouseLeave:Connect(function()
	createTween(CloseButton, {BackgroundColor3 = Color3.fromRGB(60, 60, 65)}):Play()
end)

KeyTextbox.Focused:Connect(function()
	createTween(KeyTextbox, {BackgroundColor3 = Color3.fromRGB(65, 65, 70)}):Play()
end)

KeyTextbox.FocusLost:Connect(function()
	createTween(KeyTextbox, {BackgroundColor3 = Color3.fromRGB(55, 55, 60)}):Play()
end)

local spinConnection
local dotsThread

local function SetStatus(state)
	if spinConnection then
		spinConnection:Disconnect()
		spinConnection = nil
	end
	if dotsThread then
		task.cancel(dotsThread)
		dotsThread = nil
	end

	local color = Color3.fromRGB(249, 115, 22)
	local text = "No key detected"

	if state == "verifying" then
		color = Color3.fromRGB(59, 130, 246)
		text = "Verifying access"
		local dots = {".", "..", "...", ""}
		local i = 1
		dotsThread = task.spawn(function()
			while StatusLabel and StatusLabel.Parent do
				if not StatusLabel.Text:find("Verifying access", 1, true) then
					break
				end
				StatusLabel.Text = text .. dots[i]
				i = (i % #dots) + 1
				task.wait(0.45)
			end
		end)
	elseif state == "success" then
		color = Color3.fromRGB(16, 185, 129)
		text = "Access Granted"
	elseif state == "error" then
		color = Color3.fromRGB(239, 68, 68)
		text = "Invalid Key"
	end

	createTween(StatusLabel, {TextColor3 = color}, 0.35):Play()
	StatusLabel.Text = text
end

GetKeyButton.MouseButton1Click:Connect(function()
	local originalText = GetKeyButton.Text
	
	setclipboard(Junkie.get_key_link())
	
	GetKeyButton.Text = "Key Link Copied!"
	createTween(GetKeyButton, {BackgroundColor3 = Color3.fromRGB(50, 120, 200)}):Play()
	
	task.wait(2)
	
	GetKeyButton.Text = originalText
	createTween(GetKeyButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 75)}):Play()
end)

CheckButton.MouseButton1Click:Connect(function()
	local key = KeyTextbox.Text:upper()
	SetStatus("verifying")
	CheckButton.Text = "..."
	CheckButton.Active = false
	
	local result = Junkie.check_key(key)
	
	CheckButton.Active = true
	CheckButton.Text = "Check Key"
	
	if not result then
		SetStatus("error")
		local originalText = CheckButton.Text
		CheckButton.Text = "✗ API Error"
		createTween(CheckButton, {BackgroundColor3 = Color3.fromRGB(180, 50, 50)}):Play()
		
		local originalPosition = CheckButton.Position
		for i = 1, 3 do
			createTween(CheckButton, {Position = originalPosition + UDim2.new(0, 10, 0, 0)}, 0.05):Play()
			task.wait(0.05)
			createTween(CheckButton, {Position = originalPosition - UDim2.new(0, 10, 0, 0)}, 0.05):Play()
			task.wait(0.05)
		end
		createTween(CheckButton, {Position = originalPosition}, 0.05):Play()
		
		task.wait(1.5)
		CheckButton.Text = originalText
		createTween(CheckButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 75)}):Play()
		return
	end
	
	if result.valid then
		saveVerifiedKey(key)
		getgenv().SCRIPT_KEY = key
		SetStatus("success")
		
		CheckButton.Text = "Correct Key!"
		createTween(CheckButton, {BackgroundColor3 = Color3.fromRGB(50, 150, 80)}):Play()
		
		task.wait(1.5)
		
		createTween(MainFrame, {BackgroundTransparency = 1}):Play()
		
		for _, element in pairs(MainFrame:GetDescendants()) do
			if element:IsA("TextLabel") or element:IsA("TextBox") or element:IsA("TextButton") then
				createTween(element, {TextTransparency = 1}):Play()
			end
			if element:IsA("GuiObject") and element.BackgroundTransparency < 1 then
				createTween(element, {BackgroundTransparency = 1}):Play()
			end
		end
		
		task.wait(0.5)
		
		ScreenGui:Destroy()
	else
		SetStatus("error")
		
		local originalText = CheckButton.Text
		CheckButton.Text = "Wrong Key!"
		createTween(CheckButton, {BackgroundColor3 = Color3.fromRGB(180, 50, 50)}):Play()
		
		local originalPosition = CheckButton.Position
		for i = 1, 3 do
			createTween(CheckButton, {Position = originalPosition + UDim2.new(0, 10, 0, 0)}, 0.05):Play()
			task.wait(0.05)
			createTween(CheckButton, {Position = originalPosition - UDim2.new(0, 10, 0, 0)}, 0.05):Play()
			task.wait(0.05)
		end
		createTween(CheckButton, {Position = originalPosition}, 0.05):Play()
		
		task.wait(1.5)
		CheckButton.Text = originalText
		createTween(CheckButton, {BackgroundColor3 = Color3.fromRGB(70, 70, 75)}):Play()
	end
end)

CloseButton.MouseButton1Click:Connect(function()
	createTween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}):Play()
	task.wait(0.3)
	ScreenGui:Destroy()
end)

MainFrame.Size = UDim2.new(0, 0, 0, 0)

task.wait(0.1)

createTween(MainFrame, {Size = UDim2.new(0, 400, 0, 360)}):Play()

local savedKey = loadVerifiedKey()
local keyToCheck = savedKey
if not keyToCheck then
	keyToCheck = getgenv().SCRIPT_KEY
end

if keyToCheck then
	local result = Junkie.check_key(keyToCheck)
	if result and result.valid then
		if result.message == "KEYLESS" then
			getgenv().SCRIPT_KEY = "KEYLESS"
			ScreenGui:Destroy()
		elseif result.message == "KEY_VALID" then
			if not savedKey and keyToCheck then
				saveVerifiedKey(keyToCheck)
			end
			getgenv().SCRIPT_KEY = keyToCheck
			ScreenGui:Destroy()
		end
	end
end

while not getgenv().SCRIPT_KEY do
	task.wait(0.1)
end