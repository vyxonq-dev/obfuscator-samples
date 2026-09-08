-- got lazy and ended up using ai for this loader..... (pls no hate huhu)

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Configuration
local IMAGE_ASSET_ID = "rbxassetid://138936252633438" -- Replace with your image asset ID
local LOAD_DURATION = 3 -- Duration in seconds for the loading animation

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ExternalityLoader"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999
screenGui.Parent = playerGui

-- Create Background Frame with gradient
local background = Instance.new("Frame")
background.Name = "Background"
background.Size = UDim2.new(1, 0, 1, 0)
background.Position = UDim2.new(0, 0, 0, 0)
background.BackgroundColor3 = Color3.fromRGB(10, 15, 25)
background.BorderSizePixel = 0
background.Parent = screenGui

-- Add gradient to background
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 10, 30)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 25, 45)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 10, 30))
}
gradient.Rotation = 45
gradient.Parent = background

-- Create Card Container
local card = Instance.new("Frame")
card.Name = "Card"
card.Size = UDim2.new(0, 400, 0, 500)
card.Position = UDim2.new(0.5, 0, 0.5, 0)
card.AnchorPoint = Vector2.new(0.5, 0.5)
card.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
card.BorderSizePixel = 0
card.Parent = background

-- Add corner radius to card
local cardCorner = Instance.new("UICorner")
cardCorner.CornerRadius = UDim.new(0, 20)
cardCorner.Parent = card

-- Add card gradient
local cardGradient = Instance.new("UIGradient")
cardGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 35, 60)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 25, 45))
}
cardGradient.Rotation = 90
cardGradient.Parent = card

-- Add card shadow/glow
local cardStroke = Instance.new("UIStroke")
cardStroke.Color = Color3.fromRGB(50, 120, 255)
cardStroke.Thickness = 2
cardStroke.Transparency = 0.5
cardStroke.Parent = card

-- Create Image Container (for spinning effect)
local imageContainer = Instance.new("Frame")
imageContainer.Name = "ImageContainer"
imageContainer.Size = UDim2.new(0, 200, 0, 200)
imageContainer.Position = UDim2.new(0.5, 0, 1.2, 0) -- Start below screen
imageContainer.AnchorPoint = Vector2.new(0.5, 0.5)
imageContainer.BackgroundTransparency = 1
imageContainer.Parent = card

-- Create the Image
local image = Instance.new("ImageLabel")
image.Name = "LoaderImage"
image.Size = UDim2.new(1, 0, 1, 0)
image.Position = UDim2.new(0.5, 0, 0.5, 0)
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.BackgroundTransparency = 1
image.Image = IMAGE_ASSET_ID
image.ScaleType = Enum.ScaleType.Fit
image.ImageTransparency = 1
image.Parent = imageContainer

-- Add glow effect to image
local imageGlow = Instance.new("ImageLabel")
imageGlow.Name = "Glow"
imageGlow.Size = UDim2.new(1.2, 0, 1.2, 0)
imageGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
imageGlow.AnchorPoint = Vector2.new(0.5, 0.5)
imageGlow.BackgroundTransparency = 1
imageGlow.Image = IMAGE_ASSET_ID
imageGlow.ScaleType = Enum.ScaleType.Fit
imageGlow.ImageTransparency = 0.7
imageGlow.ImageColor3 = Color3.fromRGB(100, 150, 255)
imageGlow.ZIndex = 0
imageGlow.Parent = imageContainer

-- Create Loading Text
local loadingText = Instance.new("TextLabel")
loadingText.Name = "LoadingText"
loadingText.Size = UDim2.new(1, -40, 0, 50)
loadingText.Position = UDim2.new(0.5, 0, 0.85, 0)
loadingText.AnchorPoint = Vector2.new(0.5, 0.5)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.GothamBold
loadingText.Text = "Externality Loader"
loadingText.TextColor3 = Color3.fromRGB(150, 200, 255)
loadingText.TextSize = 28
loadingText.TextTransparency = 1
loadingText.Parent = card

-- Add text stroke
local textStroke = Instance.new("UIStroke")
textStroke.Color = Color3.fromRGB(50, 100, 200)
textStroke.Thickness = 1
textStroke.Transparency = 0.3
textStroke.Parent = loadingText

-- Create animated dots
local dots = Instance.new("TextLabel")
dots.Name = "Dots"
dots.Size = UDim2.new(0, 60, 0, 50)
dots.Position = UDim2.new(1, -10, 0, 0)
dots.AnchorPoint = Vector2.new(0, 0)
dots.BackgroundTransparency = 1
dots.Font = Enum.Font.GothamBold
dots.Text = ""
dots.TextColor3 = Color3.fromRGB(150, 200, 255)
dots.TextSize = 28
dots.TextXAlignment = Enum.TextXAlignment.Left
dots.TextTransparency = 1
dots.Parent = loadingText

-- Tween Info
local tweenInfo = TweenInfo.new(
    1,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

local spinTweenInfo = TweenInfo.new(
    2,
    Enum.EasingStyle.Linear,
    Enum.EasingDirection.InOut,
    -1 -- Infinite loop
)

-- Animation: Card appears
local cardAppear = TweenService:Create(card, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0
})

-- Animation: Image rises to center and fades in
local imageRise = TweenService:Create(imageContainer, tweenInfo, {
    Position = UDim2.new(0.5, 0, 0.4, 0)
})

local imageFadeIn = TweenService:Create(image, tweenInfo, {
    ImageTransparency = 0
})

local glowFadeIn = TweenService:Create(imageGlow, tweenInfo, {
    ImageTransparency = 0.5
})

-- Animation: Image spinning
local spinTween = TweenService:Create(imageContainer, spinTweenInfo, {
    Rotation = 360
})

-- Animation: Text fades in
local textFadeIn = TweenService:Create(loadingText, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
    TextTransparency = 0
})

local dotsFadeIn = TweenService:Create(dots, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
    TextTransparency = 0
})

-- Animated dots function
local function animateDots()
    local dotCount = 0
    while screenGui.Parent do
        dotCount = (dotCount % 3) + 1
        dots.Text = string.rep(".", dotCount)
        wait(0.5)
    end
end

-- Play animations sequence
wait(0.1)
cardAppear:Play()

wait(0.3)
imageRise:Play()
imageFadeIn:Play()
glowFadeIn:Play()

wait(0.5)
spinTween:Play()

wait(0.3)
textFadeIn:Play()
dotsFadeIn:Play()

-- Start dot animation
spawn(animateDots)

-- Function to remove the loader
local function removeLoader()
    -- Fade out animation
    local fadeOutInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
    
    local cardFadeOut = TweenService:Create(card, fadeOutInfo, {
        BackgroundTransparency = 1
    })
    
    local imageFadeOut = TweenService:Create(image, fadeOutInfo, {
        ImageTransparency = 1
    })
    
    local glowFadeOut = TweenService:Create(imageGlow, fadeOutInfo, {
        ImageTransparency = 1
    })
    
    local textFadeOut = TweenService:Create(loadingText, fadeOutInfo, {
        TextTransparency = 1
    })
    
    local dotsFadeOut = TweenService:Create(dots, fadeOutInfo, {
        TextTransparency = 1
    })
    
    local bgFadeOut = TweenService:Create(background, fadeOutInfo, {
        BackgroundTransparency = 1
    })
    
    -- Play all fade out animations
    cardFadeOut:Play()
    imageFadeOut:Play()
    glowFadeOut:Play()
    textFadeOut:Play()
    dotsFadeOut:Play()
    bgFadeOut:Play()
    
    -- Wait for animations to complete then destroy
    wait(0.8)
    screenGui:Destroy()
end

-- Auto-remove after load duration
wait(LOAD_DURATION)
removeLoader()

print("Externality Loader - Loading complete!")

local placeId = game.PlaceId

-- Use a table to map Place IDs to their respective scripts
local Games = {
    [118403629519701] = function() -- Example: Blox Fruits
        print("1st script: Climb The Space :D")
        loadstring(game:HttpGet("https://protected-roblox-scripts.onrender.com/430f2aebb66fd95f5279d01c80e5a223"))()
    end,
  
     [90568084448279] = function() -- Example: Blox Fruits
        print("2st script: One Tap :D")
        loadstring(game:HttpGet("https://protected-roblox-scripts.onrender.com/16d8aafc4cdb25f50215559b3de6c286"))()
    end,
}

-- Check if current game is in our list
if Games[placeId] then
    Games[placeId]()
else
    warn("No specific script i made found for Place ID: " .. placeId)
end
