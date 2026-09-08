if _G.F then return end
script_key="WQPjuFOoddqrMIplKsGYvmOeXeQbkVOf";
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
print("new")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local scaleFactor = isMobile and 0.5 or 1

-- Game database with all scripts
local gamesList = {
      {
        id = 1,
        name = "Universal+Info",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/rvzdxkngjz-png/BoronZ/refs/heads/main/universal.lua"))()',
        features = {"Made By jam.s1", "Join the Discord", "https://discord.gg/SSEGfYDEe", "Universal|Silentaim"},
    },
    {
        id = 2,
        name = "Sailor Piece",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/977ef1f3722a5f1329a983b96c769c7d6c7a076a5ec54b95af08a8f2460cbd44/download"))()',
        features = {"Key System","Auto Farm", "Devil Fruits", "Fighting Styles", "ESP & More"},
    },
    {
        id = 3,
        name = "Ultimate Mining Tycoon",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/71ccc7e266bcca24318ef0a4959bbb90aa301470f39b00de85cb80fed006d875/download"))()',
        features = {"Key System","OreEsp", "Drill Mods", "Vehicle Mods", "Teleports"},
    },
    {
        id = 4,
        name = "Bite By Night",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/ed5e8b498577b7960e9cce23809c1ffb99796113a6bbf90f469ce035c45b9ad6/download"))()',
        features = {"Key System","Auto Gen", "SpeedHacks", "ESP", "More"},
    },
    {
        id = 5,
        name = "Tha Bronx 3",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6eef67b8a00bf6a619eafe171c8ab69653bb80d436a94cf79516daf7e3dfc24b/download"))()',
        features = {"Key System","Auto Farm", "SilentAim/Aimbot", "Infinite Money", "ESP&More"},
    },
    {
        id = 6,
        name = "Town",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6eef67b8a00bf6a619eafe171c8ab69653bb80d436a94cf79516daf7e3dfc24b/download"))()',
        features = {"Key System","Aimbot", "Silentsim", "WallBang", "ESP"},
    },
    {
        id = 7,
        name = "BlockSpin",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6eef67b8a00bf6a619eafe171c8ab69653bb80d436a94cf79516daf7e3dfc24b/download"))()',
        features = {"Key System","Silentaim", "Esp", "Auto Mop", "Aimbot"},
    },
    {
        id = 8,
        name = "Criminality",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6eef67b8a00bf6a619eafe171c8ab69653bb80d436a94cf79516daf7e3dfc24b/download"))()',
        features = {"Key System","Aimbot", "ESP", "Silent Aim", "Anticheat Bypass", "More"},
    },
    {
        id = 9,
        name = "South Bronx",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6eef67b8a00bf6a619eafe171c8ab69653bb80d436a94cf79516daf7e3dfc24b/download"))()',
        features = {"Key System","SilentAim", "Aimbot", "Esp", "More In Script"},
    },
    {
        id = 10,
        name = "Street Life",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/6eef67b8a00bf6a619eafe171c8ab69653bb80d436a94cf79516daf7e3dfc24b/download"))()',
        features = {"Key System","SilentAim", "Aimbot", "Esp", "More"},
    },
    {
        id = 11,
        name = "Rivals",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/rvzdxkngjz-png/BoronZ/refs/heads/main/Rivals"))()',
        features = {"KeyLess","SilentAim", "Aimbot", "Esp", "More"},
    },
    {
        id = 12,
        name = "BloxFruit",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/rvzdxkngjz-png/BoronZ/refs/heads/main/BloxFruit.luau"))()',
        features = {"KeyLess","Autofarm", "FruitEsp", "All seas etc", "More Etc.."},
    },
    {
        id = 13,
        name = "BeALuckyBlock",
        bannerID = "121044225858097",
        script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/rvzdxkngjz-png/BoronZ/refs/heads/main/bealuckyblock"))()',
        features = {"KeyLess","Autofarm", "Speed Multi", ".", "More Etc.."},
    },
    {
        id = 14,
        name = "MTC",
        bannerID = "95721658376580",
        script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/rvzdxkngjz-png/BoronZ/refs/heads/main/mtc"))()',
        features = {"KeyLess","GunMods", "Silentaim", "InfTankammo", "More Etc.."},
    },
}

local selectedGame = gamesList[1] -- Default to first game

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameLoaderGui"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local mainFrameWidth = 950 * scaleFactor
local mainFrameHeight = 550 * scaleFactor
local mainFrameStartWidth = 0
local mainFrameStartHeight = 550 * scaleFactor

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, mainFrameStartWidth, 0, mainFrameStartHeight)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, -mainFrameStartHeight/2)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 25, 45)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screenGui

-- Purple gradient
local mainGradient = Instance.new("UIGradient")
mainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 35, 70)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(90, 50, 120)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(128, 0, 128))
})
mainGradient.Rotation = 180
mainGradient.Parent = mainFrame

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainFrame

-- Left Panel - Game List
local leftPanelWidth = 260 * scaleFactor
local leftPanel = Instance.new("Frame")
leftPanel.Name = "LeftPanel"
leftPanel.Size = UDim2.new(0, leftPanelWidth, 1, -20 * scaleFactor)
leftPanel.Position = UDim2.new(0, 10 * scaleFactor, 0, 10 * scaleFactor)
leftPanel.BackgroundColor3 = Color3.fromRGB(25, 20, 40)
leftPanel.BackgroundTransparency = 1
leftPanel.BorderSizePixel = 0
leftPanel.Parent = mainFrame

local leftPanelCorner = Instance.new("UICorner")
leftPanelCorner.CornerRadius = UDim.new(0, 10)
leftPanelCorner.Parent = leftPanel

local leftPanelStroke = Instance.new("UIStroke")
leftPanelStroke.Thickness = 1
leftPanelStroke.Color = Color3.fromRGB(128, 0, 128)
leftPanelStroke.Transparency = 1
leftPanelStroke.Parent = leftPanel

-- Title
local listTitle = Instance.new("TextLabel")
listTitle.Size = UDim2.new(1, -20 * scaleFactor, 0, 40 * scaleFactor)
listTitle.Position = UDim2.new(0, 10 * scaleFactor, 0, 10 * scaleFactor)
listTitle.BackgroundTransparency = 1
listTitle.Text = "SELECT GAME"
listTitle.TextColor3 = Color3.fromRGB(200, 150, 255)
listTitle.TextSize = 18 * scaleFactor
listTitle.Font = Enum.Font.GothamBold
listTitle.TextXAlignment = Enum.TextXAlignment.Center
listTitle.Parent = leftPanel

-- Scrollable game list
local gameListContainer = Instance.new("ScrollingFrame")
gameListContainer.Name = "GameList"
gameListContainer.Size = UDim2.new(1, -10 * scaleFactor, 1, -60 * scaleFactor)
gameListContainer.Position = UDim2.new(0, 5 * scaleFactor, 0, 55 * scaleFactor)
gameListContainer.BackgroundTransparency = 1
gameListContainer.BorderSizePixel = 0
gameListContainer.ScrollBarThickness = 4
gameListContainer.CanvasSize = UDim2.new(0, 0, 0, (#gamesList * 55) * scaleFactor)
gameListContainer.Parent = leftPanel

local gameButtons = {}
local gameListLayout = Instance.new("UIListLayout")
gameListLayout.Padding = UDim.new(0, 5 * scaleFactor)
gameListLayout.SortOrder = Enum.SortOrder.LayoutOrder
gameListLayout.Parent = gameListContainer

-- Right Panel - Game Info
local rightPanelWidth = 630 * scaleFactor
local rightPanel = Instance.new("Frame")
rightPanel.Name = "RightPanel"
rightPanel.Size = UDim2.new(0, rightPanelWidth, 1, -20 * scaleFactor)
rightPanel.Position = UDim2.new(0, leftPanelWidth + 15 * scaleFactor, 0, 10 * scaleFactor)
rightPanel.BackgroundColor3 = Color3.fromRGB(25, 20, 40)
rightPanel.BackgroundTransparency = 1
rightPanel.BorderSizePixel = 0
rightPanel.Parent = mainFrame

local rightPanelCorner = Instance.new("UICorner")
rightPanelCorner.CornerRadius = UDim.new(0, 10)
rightPanelCorner.Parent = rightPanel

local rightPanelStroke = Instance.new("UIStroke")
rightPanelStroke.Thickness = 1
rightPanelStroke.Color = Color3.fromRGB(128, 0, 128)
rightPanelStroke.Transparency = 1
rightPanelStroke.Parent = rightPanel

-- Banner image
local bannerImage = Instance.new("ImageLabel")
bannerImage.Name = "BannerImage"
bannerImage.Size = UDim2.new(1, -20 * scaleFactor, 0, 120 * scaleFactor)
bannerImage.Position = UDim2.new(0, 10 * scaleFactor, 0, 10 * scaleFactor)
bannerImage.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
bannerImage.BackgroundTransparency = 1
bannerImage.ScaleType = Enum.ScaleType.Crop
bannerImage.Parent = rightPanel

local bannerCorner = Instance.new("UICorner")
bannerCorner.CornerRadius = UDim.new(0, 8)
bannerCorner.Parent = bannerImage

-- Game title
local gameTitle = Instance.new("TextLabel")
gameTitle.Name = "GameTitle"
gameTitle.Size = UDim2.new(1, -20 * scaleFactor, 0, 45 * scaleFactor)
gameTitle.Position = UDim2.new(0, 10 * scaleFactor, 0, 145 * scaleFactor)
gameTitle.BackgroundTransparency = 1
gameTitle.Text = ""
gameTitle.TextColor3 = Color3.fromRGB(200, 150, 255)
gameTitle.TextSize = 26 * scaleFactor
gameTitle.Font = Enum.Font.GothamBold
gameTitle.TextXAlignment = Enum.TextXAlignment.Center
gameTitle.Parent = rightPanel

-- Features frame
local featuresFrame = Instance.new("Frame")
featuresFrame.Name = "FeaturesFrame"
featuresFrame.Size = UDim2.new(1, -20 * scaleFactor, 0, 200 * scaleFactor)
featuresFrame.Position = UDim2.new(0, 10 * scaleFactor, 0, 200 * scaleFactor)
featuresFrame.BackgroundColor3 = Color3.fromRGB(20, 15, 35)
featuresFrame.BackgroundTransparency = 1
featuresFrame.BorderSizePixel = 0
featuresFrame.Parent = rightPanel

local featuresCorner = Instance.new("UICorner")
featuresCorner.CornerRadius = UDim.new(0, 8)
featuresCorner.Parent = featuresFrame

local featuresTitle = Instance.new("TextLabel")
featuresTitle.Size = UDim2.new(1, -20 * scaleFactor, 0, 35 * scaleFactor)
featuresTitle.Position = UDim2.new(0, 10 * scaleFactor, 0, 5 * scaleFactor)
featuresTitle.BackgroundTransparency = 1
featuresTitle.Text = "FEATURES"
featuresTitle.TextColor3 = Color3.fromRGB(156, 39, 176)
featuresTitle.TextSize = 15 * scaleFactor
featuresTitle.Font = Enum.Font.GothamBold
featuresTitle.TextXAlignment = Enum.TextXAlignment.Left
featuresTitle.Parent = featuresFrame

local featuresList = Instance.new("ScrollingFrame")
featuresList.Size = UDim2.new(1, -15 * scaleFactor, 1, -45 * scaleFactor)
featuresList.Position = UDim2.new(0, 10 * scaleFactor, 0, 45 * scaleFactor)
featuresList.BackgroundTransparency = 1
featuresList.BorderSizePixel = 0
featuresList.ScrollBarThickness = 3
featuresList.Parent = featuresFrame

local featuresLayout = Instance.new("UIListLayout")
featuresLayout.Padding = UDim.new(0, 8 * scaleFactor)
featuresLayout.SortOrder = Enum.SortOrder.LayoutOrder
featuresLayout.Parent = featuresList

local featureLabels = {}

-- Launch button
local launchButton = Instance.new("TextButton")
launchButton.Name = "LaunchButton"
launchButton.Size = UDim2.new(1, -20 * scaleFactor, 0, 55 * scaleFactor)
launchButton.Position = UDim2.new(0, 10 * scaleFactor, 1, -75 * scaleFactor)
launchButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
launchButton.BackgroundTransparency = 1
launchButton.BorderSizePixel = 0
launchButton.Text = ""
launchButton.Active = true
launchButton.Parent = rightPanel

local launchCorner = Instance.new("UICorner")
launchCorner.CornerRadius = UDim.new(0, 8)
launchCorner.Parent = launchButton

local launchText = Instance.new("TextLabel")
launchText.Size = UDim2.new(1, 0, 1, 0)
launchText.BackgroundTransparency = 1
launchText.Text = "LAUNCH SCRIPT"
launchText.TextColor3 = Color3.fromRGB(255, 255, 255)
launchText.TextSize = 20 * scaleFactor
launchText.Font = Enum.Font.GothamBold
launchText.TextXAlignment = Enum.TextXAlignment.Center
launchText.TextYAlignment = Enum.TextYAlignment.Center
launchText.Parent = launchButton

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 35 * scaleFactor, 0, 35 * scaleFactor)
closeButton.Position = UDim2.new(1, -45 * scaleFactor, 0, 10 * scaleFactor)
closeButton.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
closeButton.BackgroundTransparency = 1
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 20 * scaleFactor
closeButton.Font = Enum.Font.GothamBold
closeButton.Active = true
closeButton.Parent = mainFrame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeButton

-- Function to update right panel with selected game
local function updateRightPanel(game)
    gameTitle.Text = game.name
    bannerImage.Image = "rbxassetid://" .. game.bannerID
    bannerImage.BackgroundTransparency = 1
    
    -- Clear old features
    for _, label in pairs(featureLabels) do
        label:Destroy()
    end
    featureLabels = {}
    
    -- Add new features
    for i, feature in ipairs(game.features) do
        local featureLabel = Instance.new("TextLabel")
        featureLabel.Size = UDim2.new(1, 0, 0, 22 * scaleFactor)
        featureLabel.BackgroundTransparency = 1
        featureLabel.Text = "• " .. feature
        featureLabel.TextColor3 = Color3.fromRGB(200, 180, 220)
        featureLabel.TextSize = 13 * scaleFactor
        featureLabel.Font = Enum.Font.Gotham
        featureLabel.TextXAlignment = Enum.TextXAlignment.Left
        featureLabel.Parent = featuresList
        table.insert(featureLabels, featureLabel)
    end
    
    featuresList.CanvasSize = UDim2.new(0, 0, 0, math.max(100, #game.features * 30 * scaleFactor))
end

-- Create game selection buttons
for i, game in ipairs(gamesList) do
    local button = Instance.new("TextButton")
    button.Name = "GameButton_" .. game.id
    button.Size = UDim2.new(1, 0, 0, 45 * scaleFactor)
    button.BackgroundColor3 = Color3.fromRGB(45, 35, 60)
    button.BackgroundTransparency = 1
    button.BorderSizePixel = 0
    button.Text = game.name
    button.TextColor3 = Color3.fromRGB(180, 160, 210)
    button.TextSize = 14 * scaleFactor
    button.Font = Enum.Font.GothamSemibold
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.TextTruncate = Enum.TextTruncate.AtEnd
    button.Parent = gameListContainer
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    local buttonPadding = Instance.new("UIPadding")
    buttonPadding.PaddingLeft = UDim.new(0, 15 * scaleFactor)
    buttonPadding.Parent = button
    
    gameButtons[game.id] = button
    
    -- Button click handler
    button.MouseButton1Click:Connect(function()
        selectedGame = game
        
        -- Update all buttons appearance
        for id, btn in pairs(gameButtons) do
            btn.BackgroundColor3 = Color3.fromRGB(45, 35, 60)
            btn.TextColor3 = Color3.fromRGB(180, 160, 210)
        end
        
        -- Highlight selected button
        button.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        -- Update the right panel
        updateRightPanel(game)
    end)
end

-- Function to fade out and close
local function fadeOutAndClose()
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad)
    
    local fadeOuts = {
        TweenService:Create(leftPanel, tweenInfo, {BackgroundTransparency = 1}),
        TweenService:Create(rightPanel, tweenInfo, {BackgroundTransparency = 1}),
        TweenService:Create(launchButton, tweenInfo, {BackgroundTransparency = 1}),
        TweenService:Create(closeButton, tweenInfo, {BackgroundTransparency = 1, TextTransparency = 1}),
        TweenService:Create(gameTitle, tweenInfo, {TextTransparency = 1}),
        TweenService:Create(featuresFrame, tweenInfo, {BackgroundTransparency = 1}),
        TweenService:Create(bannerImage, tweenInfo, {ImageTransparency = 1}),
    }
    
    for _, fadeOut in pairs(fadeOuts) do
        fadeOut:Play()
    end
    
    for _, label in pairs(featureLabels) do
        TweenService:Create(label, tweenInfo, {TextTransparency = 1}):Play()
    end
    
    for _, btn in pairs(gameButtons) do
        TweenService:Create(btn, tweenInfo, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    end
    
    task.wait(0.4)
    
    local shrinkTween = TweenService:Create(
        mainFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
        {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }
    )
    shrinkTween:Play()
    shrinkTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end

-- Launch handler
local function handleLaunch()
    if _G.F then return end
    launchButton.Active = false
    loadstring(selectedGame.script)()
    _G.F = true
    task.wait(0.3)
    fadeOutAndClose()
end

launchButton.MouseButton1Click:Connect(handleLaunch)
if isMobile then
    launchButton.TouchTap:Connect(handleLaunch)
end

-- Close handler
local function handleClose()
    screenGui:Destroy()
end

closeButton.MouseButton1Click:Connect(handleClose)
if isMobile then
    closeButton.TouchTap:Connect(handleClose)
end

-- Hover effects (non-mobile)
if not isMobile then
    launchButton.MouseEnter:Connect(function()
        TweenService:Create(launchButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(156, 39, 176)}):Play()
    end)
    launchButton.MouseLeave:Connect(function()
        TweenService:Create(launchButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(128, 0, 128)}):Play()
    end)
    closeButton.MouseEnter:Connect(function()
        TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(156, 39, 176)}):Play()
    end)
    closeButton.MouseLeave:Connect(function()
        TweenService:Create(closeButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(128, 0, 128)}):Play()
    end)
    
    -- Button hover effects for game list
    for _, btn in pairs(gameButtons) do
        btn.MouseEnter:Connect(function()
            if btn.BackgroundColor3 ~= Color3.fromRGB(128, 0, 128) then
                TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(75, 55, 95)}):Play()
            end
        end)
        btn.MouseLeave:Connect(function()
            if btn.BackgroundColor3 ~= Color3.fromRGB(128, 0, 128) then
                TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 35, 60)}):Play()
            end
        end)
    end
end

-- Dragging functionality
local dragging = false
local dragStart = nil
local startPos = nil

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Animation and initial selection
local expandTween = TweenService:Create(
    mainFrame,
    TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    {
        Size = UDim2.new(0, mainFrameWidth, 0, mainFrameHeight),
        Position = UDim2.new(0.5, -mainFrameWidth/2, 0.5, -mainFrameHeight/2)
    }
)

expandTween:Play()
expandTween.Completed:Connect(function()
    -- Fade in all elements
    local tweenInfo = TweenInfo.new(0.4, Enum.EasingStyle.Quad)
    
    TweenService:Create(leftPanel, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(rightPanel, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(leftPanelStroke, tweenInfo, {Transparency = 0}):Play()
    TweenService:Create(rightPanelStroke, tweenInfo, {Transparency = 0}):Play()
    TweenService:Create(launchButton, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(closeButton, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    TweenService:Create(gameTitle, tweenInfo, {TextTransparency = 0}):Play()
    TweenService:Create(featuresFrame, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(bannerImage, tweenInfo, {ImageTransparency = 0, BackgroundTransparency = 0}):Play()
    
    for _, btn in pairs(gameButtons) do
        TweenService:Create(btn, tweenInfo, {BackgroundTransparency = 0}):Play()
    end
    
    -- Select first game by default
    if gameButtons[1] then
        gameButtons[1].BackgroundColor3 = Color3.fromRGB(128, 0, 128)
        gameButtons[1].TextColor3 = Color3.fromRGB(255, 255, 255)
    end
    
    -- Initialize right panel with first game
    updateRightPanel(gamesList[1])
end)
