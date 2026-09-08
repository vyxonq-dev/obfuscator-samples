-- ULTRA SUPER INTRO SCRIPT WITH LOADING TEXT AND SCRIPT EXECUTION
-- Make sure you execute this in a safe and supported environment!

-- Clear previous GUI elements to avoid clutter
for _, v in pairs(game.CoreGui:GetChildren()) do
    if v.Name == "UltraIntro" then
        v:Destroy()
    end
end

-- Create Screen GUI
local introGui = Instance.new("ScreenGui")
introGui.Name = "UltraIntro"
introGui.Parent = game.CoreGui

-- Create Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(1, 0, 1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = introGui

-- Create Intro Text
local introText = Instance.new("TextLabel")
introText.Size = UDim2.new(0.8, 0, 0.2, 0)
introText.Position = UDim2.new(0.1, 0, 0.4, 0)
introText.Text = "Fe Hub"
introText.TextScaled = true
introText.Font = Enum.Font.Arcade
introText.TextColor3 = Color3.fromRGB(255, 0, 0)
introText.BackgroundTransparency = 1
introText.Parent = mainFrame

-- Add Glow Effect
local glowEffect = Instance.new("UIStroke")
glowEffect.Thickness = 5
glowEffect.Color = Color3.fromRGB(255, 255, 0)
glowEffect.Parent = introText

-- Particle Emitter Effect
local particleEmitter = Instance.new("ParticleEmitter")
particleEmitter.Texture = "rbxassetid://1234567" -- Replace with a spark texture asset ID
particleEmitter.Rate = 50
particleEmitter.Lifetime = NumberRange.new(2, 5)
particleEmitter.Speed = NumberRange.new(10, 20)
particleEmitter.Rotation = NumberRange.new(0, 360)
particleEmitter.Parent = mainFrame

-- Flashy Color Animation
spawn(function()
    while true do
        introText.TextColor3 = Color3.new(math.random(), math.random(), math.random())
        wait(0.1)
    end
end)

-- Size Animation with Loading Sequence
spawn(function()
    for i = 1, 50 do
        introText.Size = introText.Size + UDim2.new(0.01, 0, 0.01, 0)
        wait(0.05)
    end

    -- Loading Text Setup
    introText.Text = "1%"
    introText.TextColor3 = Color3.fromRGB(255, 255, 255)
    wait(1)

    introText.Text = "40%"
    wait(1)

  introText.Text = "60%"
    wait(1)

  introText.Text = "80%"
    wait(1)

    introText.Text = "100%"
    wait(2)

    -- Cleanup Intro Elements
    introText:Destroy()
    mainFrame:Destroy()
    introGui:Destroy()

    -- Execute your desired script
    local scriptToExecute = [[
        -- Replace this with the actual script you want to run
        print("Executing your script!")
        -- Example: Load a hub
        loadstring(game:HttpGet("https://pastebin.com/raw/CNPqNQug"))()
    ]]
    loadstring(scriptToExecute)()
end)
