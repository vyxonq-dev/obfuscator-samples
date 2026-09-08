local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Intro"
screenGui.Parent = game.CoreGui

local introSetFile = "IntroSet.txt"
local jksettingsIntroSetFile = "jksettings/IntroSet.txt"
local iskip = false

if isfile(introSetFile) then
    print(introSetFile .. " found in default location.")
elseif isfile(jksettingsIntroSetFile) then
    introSetFile = jksettingsIntroSetFile
    print(introSetFile .. " found in jksettings folder.")
else
    print(introSetFile .. " not found in either location. Playing intro...")
end

if isfile(introSetFile) then
    local fileContent = readfile(introSetFile)
    if fileContent then
        local iskipValue = fileContent:match("iskip = (%w+)")
        if iskipValue == "true" then
            iskip = true
            print("iskip is true. Skipping intro...")
        else
            print("iskip is false. Playing intro...")
        end
    else
        warn("Could not read " .. introSetFile .. ". Playing intro...")
    end
end


if iskip then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Jkrouz1/Jkrouzt-Hub-BETA-/refs/heads/main/1x98n6ex6%20Was%20Here....luau"))()
    return
end

local mainFrame = Instance.new("Frame")
mainFrame.Parent = screenGui
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 650, 0, 305)
mainFrame.Position = UDim2.new(0.37, 0, 0.305, 0)
mainFrame.AnchorPoint = Vector2.new(0.3, 1)
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BorderColor3 = Color3.new(1, 0, 0)
mainFrame.BorderSizePixel = 2

local profileContainer = Instance.new("Frame")
profileContainer.Name = "ProfileContainer"
profileContainer.Parent = mainFrame
profileContainer.Size = UDim2.new(0, 100, 0, 100)
profileContainer.Position = UDim2.new(0, 270, 0, 10)
profileContainer.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
profileContainer.BorderColor3 = Color3.new(0.3, 0.3, 0.3)
profileContainer.BorderSizePixel = 1

local PlayerProfile = Instance.new("ImageLabel")
PlayerProfile.Name = "PlayerProfile"
PlayerProfile.Parent = profileContainer
PlayerProfile.BackgroundColor3 = Color3.fromRGB(46, 52, 64)
PlayerProfile.BackgroundTransparency = 1
PlayerProfile.Position = UDim2.new(0.05, 0, 0.05, 0)
PlayerProfile.Size = UDim2.new(0.9, 0, 0.9, 0)
PlayerProfile.ScaleType = Enum.ScaleType.Crop
PlayerProfile.BorderSizePixel = 0

local PlayerName = Instance.new("TextLabel")
PlayerName.Name = "PlayerName"
PlayerName.Parent = profileContainer
PlayerName.AnchorPoint = Vector2.new(0.5, 1)
PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerName.BackgroundTransparency = 1.000
PlayerName.Position = UDim2.new(0.5, 0, 1.05, 0)
PlayerName.Size = UDim2.new(0, 90, 0, 16)
PlayerName.Font = Enum.Font.SourceSansBold
PlayerName.Text = "Name"
PlayerName.TextColor3 = Color3.fromRGB(216, 222, 233)
PlayerName.TextScaled = true
PlayerName.TextSize = 16.000
PlayerName.TextWrapped = true
PlayerName.TextXAlignment = Enum.TextXAlignment.Center

local Unwelcome = Instance.new("TextLabel")
Unwelcome.Name = "Unwelcome"
Unwelcome.Parent = mainFrame
Unwelcome.Size = UDim2.new(0, 600, 0, 30)
Unwelcome.Position = UDim2.new(0.5, 0, 0.4, 0)
Unwelcome.AnchorPoint = Vector2.new(0.5, 0)
Unwelcome.BackgroundColor3 = Color3.new(0, 0, 0)
Unwelcome.BackgroundTransparency = 1
Unwelcome.TextColor3 = Color3.new(1, 1, 1)
Unwelcome.TextSize = 25
Unwelcome.Font = Enum.Font.Cartoon
Unwelcome.Text = ""
Unwelcome.TextXAlignment = Enum.TextXAlignment.Center

local Inspired = Instance.new("TextLabel")
Inspired.Name = "Inspired"
Inspired.Parent = mainFrame
Inspired.Size = UDim2.new(0, 300, 0, 60)
Inspired.Position = UDim2.new(0.01, 0, 0.65, 0)
Inspired.AnchorPoint = Vector2.new(0, 0)
Inspired.BackgroundColor3 = Color3.new(0, 0, 0)
Inspired.BackgroundTransparency = 1
Inspired.TextColor3 = Color3.new(0.7, 0.7, 0.7)
Inspired.TextSize = 14
Inspired.Font = Enum.Font.SourceSans
Inspired.Text = "Inspired From:\nPolaria\nc00lgui\nMyself"
Inspired.TextXAlignment = Enum.TextXAlignment.Left
Inspired.TextYAlignment = Enum.TextYAlignment.Top
Inspired.TextWrapped = true

local Important = Instance.new("TextLabel")
Important.Name = "Important"
Important.Parent = mainFrame
Important.Size = UDim2.new(0, 300, 0, 120)
Important.Position = UDim2.new(0.53, 0, 0.60, 0)
Important.AnchorPoint = Vector2.new(0, 0)
Important.BackgroundColor3 = Color3.new(0, 0, 0)
Important.BackgroundTransparency = 1
Important.TextColor3 = Color3.new(0.8, 0.8, 0.8)
Important.TextSize = 12
Important.Font = Enum.Font.FredokaOne
Important.Text = "Jkrouzt Hub is an a Roblox Gui with many scripts inside of it. All the Scripts in Scripts section not made by me but Credits for the owners of every scripts. And some scripts in Other tab. Scripts\n\nThis is Fully Released!. Means no more update until i make v2"
Important.TextXAlignment = Enum.TextXAlignment.Left
Important.TextYAlignment = Enum.TextYAlignment.Top
Important.TextWrapped = true

local Text = Instance.new("TextLabel")
Text.Name = "Badass"
Text.Parent = mainFrame
Text.Size = UDim2.new(0, 300, 0, 60)
Text.Position = UDim2.new(0.1, 0, 0, 0)
Text.AnchorPoint = Vector2.new(0, 0)
Text.BackgroundColor3 = Color3.new(0, 0, 0)
Text.BackgroundTransparency = 1
Text.TextColor3 = Color3.new(0.7, 0.7, 0.7)
Text.TextSize = 14
Text.Font = Enum.Font.Bangers
Text.Text = "Still learning how to coding, lol"
Text.TextXAlignment = Enum.TextXAlignment.Left
Text.TextYAlignment = Enum.TextYAlignment.Top
Text.TextWrapped = true

local loadingBarFrame = Instance.new("Frame")
loadingBarFrame.Name = "LoadingBarFrame"
loadingBarFrame.Parent = mainFrame
loadingBarFrame.Size = UDim2.new(0.992, -2, 0, 20)
loadingBarFrame.Position = UDim2.new(0, 3, 0.95, -22)
loadingBarFrame.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5)
loadingBarFrame.BorderColor3 = Color3.new(0.2, 0.2, 0.2)
loadingBarFrame.BorderSizePixel = 0

local loadingBarInner = Instance.new("Frame")
loadingBarInner.Name = "LoadingBarInner"
loadingBarInner.Parent = loadingBarFrame
loadingBarInner.Size = UDim2.new(0, 0, 1, 0)
loadingBarInner.BackgroundColor3 = Color3.new(0.8, 0, 0)
loadingBarInner.BorderColor3 = Color3.new(0, 0, 0)
loadingBarInner.BorderSizePixel = 0

local Y = -0.900
mainFrame.Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset, Y, 0)

local mY = 0.805

local waitf = 2

local waitbar = 3

local function Frame(targetY, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false)
    local tween = game:GetService("TweenService"):Create(mainFrame, tweenInfo, {Position = UDim2.new(mainFrame.Position.X.Scale, mainFrame.Position.X.Offset, targetY, 0)})
    tween:Play()
    tween.Completed:Wait()
end

local function LoadingBar(duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false)
    local tween = game:GetService("TweenService"):Create(loadingBarInner, tweenInfo, {Size = UDim2.new(1, 0, 1, 0)})
    tween:Play()
    tween.Completed:Wait()
end

local function Text(textObject, targetText, duration)
    textObject.Text = ""
    local letters = string.split(targetText, "")
    for i, letter in ipairs(letters) do
        textObject.Text = textObject.Text .. letter
        wait(duration / #letters)
    end
end

Frame(mY, waitf)

PlayerName.Text = game:GetService("Players").LocalPlayer.DisplayName

local function loadHeadshot()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local userId = player.UserId
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size420x420
    local success, content = pcall(Players.GetUserThumbnailAsync, Players, userId, thumbType, thumbSize)
    if success and content then
        PlayerProfile.Image = content
        print("Headshot loaded successfully: " .. content)
    else
        warn("Failed to load player headshot: " .. tostring(content))
        PlayerProfile.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    end
end

loadHeadshot()

Text(Unwelcome, "Welcome " .. game.Players.LocalPlayer.Name .. ", to Jkrouzt Hub", 2)
LoadingBar(waitbar)

wait(7)

Frame(Y, waitf)
local reverseLoadingTweenInfo = TweenInfo.new(waitbar, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false)
local reverseLoadingTween = game:GetService("TweenService"):Create(loadingBarInner, reverseLoadingTweenInfo, {Size = UDim2.new(0, 0, 1, 0)})
reverseLoadingTween:Play()
reverseLoadingTween.Completed:Wait()

wait(waitf)

screenGui:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jkrouz1/Jkrouzt-Hub-BETA-/refs/heads/main/1x98n6ex6%20Was%20Here....luau"))()
