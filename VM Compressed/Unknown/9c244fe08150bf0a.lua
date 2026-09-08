--// Anomiss Anomic Loader - H4#0321   

local AnomissPopup = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local TextButton_2 = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")

--Properties:

AnomissPopup.Name = "AnomissPopup"
AnomissPopup.Parent = game:GetService("CoreGui")
AnomissPopup.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = AnomissPopup
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.500
MainFrame.BorderColor3 = Color3.fromRGB(255, 255, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Size = UDim2.new(0, 677, 0, 278)

UICorner.Parent = MainFrame

TextButton.Parent = MainFrame
TextButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton.BackgroundTransparency = 0.300
TextButton.BorderColor3 = Color3.fromRGB(50, 50, 50)
TextButton.Position = UDim2.new(0.0960118175, 0, 0.272108763, 0)
TextButton.Size = UDim2.new(0, 229, 0, 180)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = ""
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

UICorner_2.Parent = TextButton

TextLabel.Parent = TextButton
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0611353703, 0, 0.361111134, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Anomiss Main"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
TextLabel.TextSize = 40.000

TextLabel_2.Parent = MainFrame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.107828654, 0, 0.0390544757, 0)
TextLabel_2.Size = UDim2.new(0, 532, 0, 50)
TextLabel_2.Font = Enum.Font.Ubuntu
TextLabel_2.Text = "Which script would you like to load?"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 40.000
TextLabel_2.TextStrokeTransparency = 0.800
TextLabel_2.TextWrapped = true

TextButton_2.Parent = MainFrame
TextButton_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextButton_2.BackgroundTransparency = 0.300
TextButton_2.BorderColor3 = Color3.fromRGB(50, 50, 50)
TextButton_2.Position = UDim2.new(0.555391431, 0, 0.272108763, 0)
TextButton_2.Size = UDim2.new(0, 229, 0, 180)
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = ""
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 14.000

UICorner_3.Parent = TextButton_2

TextLabel_3.Parent = TextButton_2
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0.0611353703, 0, 0.161111116, 0)
TextLabel_3.Size = UDim2.new(0, 200, 0, 122)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Anomiss Lite (Anomic V)"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 0)
TextLabel_3.TextSize = 40.000
TextLabel_3.TextWrapped = true

local function Close()
    AnomissPopup:Destroy()
end

TextButton.MouseButton1Click:Connect(function()
    Close()
    loadstring(game:HttpGet("https://anomiss.in/Scripts/Anomic.lua"))()    
end)

TextButton_2.MouseButton1Click:Connect(function()
    Close()
    loadstring(game:HttpGet("https://anomiss.in/Scripts/AnomicA2.lua"))()
end)

