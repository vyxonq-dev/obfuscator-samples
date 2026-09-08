-- by 31k_MertYT
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "LoadingScreenGui"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local success = pcall(function()
	screenGui.Parent = CoreGui
end)

if not success then
	screenGui.Parent = player:WaitForChild("PlayerGui")
end

local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
background.BorderSizePixel = 0
background.Parent = screenGui

local centerContainer = Instance.new("Frame")
centerContainer.Name = "CenterContainer"
centerContainer.Size = UDim2.new(0, 260, 0, 220)
centerContainer.AnchorPoint = Vector2.new(0.5, 0.5)
centerContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
centerContainer.BackgroundTransparency = 1
centerContainer.Parent = background

local uiList = Instance.new("UIListLayout")
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Center
uiList.SortOrder = Enum.SortOrder.LayoutOrder
uiList.Padding = UDim.new(0, 8)
uiList.Parent = centerContainer

local pfp = Instance.new("ImageLabel")
pfp.Name = "ProfilePicture"
pfp.Size = UDim2.new(0, 64, 0, 64)
pfp.LayoutOrder = 1
pfp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
pfp.BorderSizePixel = 0
pfp.Image = ""
pfp.Parent = centerContainer

local pfpCorner = Instance.new("UICorner")
pfpCorner.CornerRadius = UDim.new(1, 0)
pfpCorner.Parent = pfp

local pfpStroke = Instance.new("UIStroke")
pfpStroke.Color = Color3.fromRGB(255, 255, 255)
pfpStroke.Transparency = 0.7
pfpStroke.Thickness = 1.5
pfpStroke.Parent = pfp

local targetName = "31k_MertYT"

task.spawn(function()
	local successId, result = pcall(function()
		return Players:GetUserIdFromNameAsync(targetName)
	end)
	
	local userId = successId and result or 1
	
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
	if isReady then
		pfp.Image = content
	end
end)

local displayNameLabel = Instance.new("TextLabel")
displayNameLabel.Name = "DisplayName"
displayNameLabel.Size = UDim2.new(1, 0, 0, 20)
displayNameLabel.LayoutOrder = 2
displayNameLabel.BackgroundTransparency = 1
displayNameLabel.Font = Enum.Font.GothamBold
displayNameLabel.TextSize = 15
displayNameLabel.TextColor3 = Color3.fromRGB(245, 245, 245)
displayNameLabel.Text = "mertbey"
displayNameLabel.Parent = centerContainer

local usernameLabel = Instance.new("TextLabel")
usernameLabel.Name = "Username"
usernameLabel.Size = UDim2.new(1, 0, 0, 16)
usernameLabel.LayoutOrder = 3
usernameLabel.BackgroundTransparency = 1
usernameLabel.Font = Enum.Font.Gotham
usernameLabel.TextSize = 12
usernameLabel.TextColor3 = Color3.fromRGB(160, 160, 160)
usernameLabel.Text = "@" .. targetName
usernameLabel.Parent = centerContainer

local spacer = Instance.new("Frame")
spacer.Size = UDim2.new(1, 0, 0, 6)
spacer.BackgroundTransparency = 1
spacer.LayoutOrder = 4
spacer.Parent = centerContainer

local statusText = Instance.new("TextLabel")
statusText.Name = "StatusText"
statusText.Size = UDim2.new(1, 0, 0, 18)
statusText.LayoutOrder = 5
statusText.BackgroundTransparency = 1
statusText.Font = Enum.Font.GothamMedium
statusText.TextSize = 18
statusText.TextColor3 = Color3.fromRGB(200, 200, 200)
statusText.Text = "Starting..."
statusText.Parent = centerContainer

local barBackground = Instance.new("Frame")
barBackground.Name = "BarBackground"
barBackground.Size = UDim2.new(1, -30, 0, 5)
barBackground.LayoutOrder = 6
barBackground.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
barBackground.BorderSizePixel = 0
barBackground.Parent = centerContainer

local barBgCorner = Instance.new("UICorner")
barBgCorner.CornerRadius = UDim.new(1, 0)
barBgCorner.Parent = barBackground

local barFill = Instance.new("Frame")
barFill.Name = "BarFill"
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
barFill.BorderSizePixel = 0
barFill.Parent = barBackground

local barFillCorner = Instance.new("UICorner")
barFillCorner.CornerRadius = UDim.new(1, 0)
barFillCorner.Parent = barFill

task.spawn(function()
	local tweenInfo = TweenInfo.new(2.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local tween = TweenService:Create(barFill, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
	tween:Play()
	
	tween.Completed:Wait()
	
	print("Starting...")
	print("Starting Coordinate")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mct70/anti-chief_coordinate/refs/heads/main/scripts/srxyz.lua"))()
	print("Starting Anti Chief")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/mct70/anti-chief_coordinate/refs/heads/main/scripts/antichief.lua"))()
	
	local fadeInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local fadeBg = TweenService:Create(background, fadeInfo, {BackgroundTransparency = 1})
	local fadePfp = TweenService:Create(pfp, fadeInfo, {ImageTransparency = 1, BackgroundTransparency = 1})
	local fadeStroke = TweenService:Create(pfpStroke, fadeInfo, {Transparency = 1})
	local fadeName = TweenService:Create(displayNameLabel, fadeInfo, {TextTransparency = 1})
	local fadeUser = TweenService:Create(usernameLabel, fadeInfo, {TextTransparency = 1})
	local fadeStatus = TweenService:Create(statusText, fadeInfo, {TextTransparency = 1})
	local fadeBarBg = TweenService:Create(barBackground, fadeInfo, {BackgroundTransparency = 1})
	local fadeBarFill = TweenService:Create(barFill, fadeInfo, {BackgroundTransparency = 1})
	
	fadeBg:Play()
	fadePfp:Play()
	fadeStroke:Play()
	fadeName:Play()
	fadeUser:Play()
	fadeStatus:Play()
	fadeBarBg:Play()
	fadeBarFill:Play()
	
	fadeBg.Completed:Wait()
	screenGui:Destroy()
end)
