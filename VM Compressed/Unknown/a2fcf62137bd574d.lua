
local GatewayChanged : Instance = Instance.new("ScreenGui")
local Frame : Instance = Instance.new("Frame")
local UICorner : Instance = Instance.new("UICorner")
local TextLabel : Instance = Instance.new("TextLabel")
local TextButton : Instance = Instance.new("TextButton")
local UICorner_2 : Instance = Instance.new("UICorner")

GatewayChanged.Name = "GatewayChanged"
GatewayChanged.Parent = (gethui and gethui()) or (cloneref and cloneref(game:GetService("CoreGui"))) or game:GetService("CoreGui") or game:GetService("Players").LocalPlayer.PlayerGui
GatewayChanged.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GatewayChanged.Enabled = false

Frame.Parent = GatewayChanged
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(21, 21, 23)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.49969697, 0, 0.5, 0)
Frame.Size = UDim2.new(0, 410, 0, 156)

UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.498601556, 0, 0.362899572, 0)
TextLabel.Size = UDim2.new(0, 368, 0, 113)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "The gateway you are using may be shut down soon. You can change the gateway to a new one by going to our discord (<font color='rgb(0, 255, 136)'>discord.gg/alchemyhub</font>) or changing the link on your script to '<font color='rgb(125, 127, 255)'>getalchemy.net/n</font>'."
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 16.000
TextLabel.TextWrapped = true
TextLabel.RichText = true

TextButton.Parent = Frame
TextButton.AnchorPoint = Vector2.new(0.5, 0.5)
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.501219511, 0, 0.782051265, 0)
TextButton.Size = UDim2.new(0, 159, 0, 30)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "Understand"
TextButton.TextColor3 = Color3.fromRGB(21, 21, 23)
TextButton.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = TextButton

---------------------------------------------->> Setting for Animation

Frame.Size = UDim2.new(0, 0, 0, 0)
TextLabel.TextTransparency = 1
TextButton.BackgroundTransparency = 1
TextButton.TextTransparency = 1

---------------------------------------------->> Open Animation

GatewayChanged.Enabled = true

game:GetService('TweenService'):Create(Frame, TweenInfo.new(0.5),
{Size = UDim2.new(0, 420, 0, 166)}):Play();task.wait(0.5)
game:GetService('TweenService'):Create(Frame, TweenInfo.new(0.2),
{Size = UDim2.new(0, 410, 0, 156)}):Play();task.wait(0.2)
game:GetService('TweenService'):Create(TextLabel, TweenInfo.new(0.3),
{TextTransparency = 0}):Play();--task.wait(0.3)
game:GetService('TweenService'):Create(TextButton, TweenInfo.new(0.3),
{BackgroundTransparency = 0}):Play();task.wait(0.3)
game:GetService('TweenService'):Create(TextButton, TweenInfo.new(0.2),
{TextTransparency = 0}):Play();task.wait(0.2)


---------------------------------------------->> Close Animation

local Close : () -> nil = function()
    game:GetService('TweenService'):Create(TextButton, TweenInfo.new(0.2),
    {TextTransparency = 1}):Play();task.wait(0.2)
    game:GetService('TweenService'):Create(TextButton, TweenInfo.new(0.3),
    {BackgroundTransparency = 1}):Play();--task.wait(0.3)
    game:GetService('TweenService'):Create(TextLabel, TweenInfo.new(0.3),
    {TextTransparency = 1}):Play();task.wait(0.3)
    game:GetService('TweenService'):Create(Frame, TweenInfo.new(0.2),
    {Size = UDim2.new(0, 0, 0, 0)}):Play();task.wait(0.2)
end

---------------------------------------------->> Button

TextButton.MouseButton1Click:Connect(function()
    Close();GatewayChanged.Enabled = false
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/x2neptunereal/Alchemy/main/gateway.luau"))()
