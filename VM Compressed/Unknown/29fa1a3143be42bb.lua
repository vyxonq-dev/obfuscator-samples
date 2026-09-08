--[[
      This File has been automatically renamed by @vyxonq for better readability.
      (Always verify before using)
]]

local discordLink = "https://discord.gg/yeSdcttDF8"
local accessKey = "skylimit365"
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local blurEffect = Instance.new("BlurEffect")
blurEffect.Size = 0
blurEffect.Name = "SkyScriptsBlur"
blurEffect.Parent = Lighting
TweenService:Create(
    blurEffect,
    TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
        Size = 20
    }
):Play()
local keySystemGui = Instance.new("ScreenGui")
keySystemGui.Name = "SkyScriptsKeySystem"
keySystemGui.IgnoreGuiInset = true
keySystemGui.ResetOnSpawn = false
keySystemGui.Parent = PlayerGui
local backgroundFrame = Instance.new("Frame")
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(10, 0, 15)
backgroundFrame.BackgroundTransparency = 1
backgroundFrame.Parent = keySystemGui
local backgroundGradient = Instance.new("UIGradient")
backgroundGradient.Color =
    ColorSequence.new(
    {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 0, 50)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 0, 20))
    }
)
backgroundGradient.Rotation = 45
backgroundGradient.Parent = backgroundFrame
local keyEntryFrame = Instance.new("Frame")
keyEntryFrame.Size = UDim2.new(0, 420, 0, 280)
keyEntryFrame.Position = UDim2.new(0.5, -210, 0.5, -140)
keyEntryFrame.BackgroundColor3 = Color3.fromRGB(25, 0, 45)
keyEntryFrame.BackgroundTransparency = 0.6
keyEntryFrame.BorderSizePixel = 0
keyEntryFrame.ClipsDescendants = true
keyEntryFrame.Visible = false
keyEntryFrame.Parent = backgroundFrame
local cornerRadius = Instance.new("UICorner")
local uiStroke = Instance.new("UIStroke")
local frameGradient = Instance.new("UIGradient")
cornerRadius.CornerRadius = UDim.new(0, 20)
cornerRadius.Parent = keyEntryFrame
uiStroke.Thickness = 2
uiStroke.Color = Color3.fromRGB(120, 80, 200)
uiStroke.Transparency = 0.3
uiStroke.Parent = keyEntryFrame
frameGradient.Color =
    ColorSequence.new(
    {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(90, 50, 160)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 80, 210))
    }
)
frameGradient.Rotation = 45
frameGradient.Parent = keyEntryFrame
local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "SkyScripts ������"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 32
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Position = UDim2.new(0, 0, 0, 25)
titleLabel.Size = UDim2.new(1, 0, 0, 35)
titleLabel.BackgroundTransparency = 1
titleLabel.Parent = keyEntryFrame
local instructionLabel = Instance.new("TextLabel")
instructionLabel.Text = "Enter your access key to continue"
instructionLabel.Font = Enum.Font.Gotham
instructionLabel.TextSize = 15
instructionLabel.TextColor3 = Color3.fromRGB(180, 180, 220)
instructionLabel.Position = UDim2.new(0, 0, 0, 60)
instructionLabel.Size = UDim2.new(1, 0, 0, 20)
instructionLabel.BackgroundTransparency = 1
instructionLabel.Parent = keyEntryFrame
local keyTextBox = Instance.new("TextBox")
keyTextBox.PlaceholderText = "Enter Key Here"
keyTextBox.Text = ""
keyTextBox.Size = UDim2.new(0, 300, 0, 40)
keyTextBox.Position = UDim2.new(0.5, -150, 0, 100)
keyTextBox.BackgroundColor3 = Color3.fromRGB(45, 0, 70)
keyTextBox.BackgroundTransparency = 0.25
keyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyTextBox.Font = Enum.Font.Gotham
keyTextBox.TextSize = 17
keyTextBox.ClearTextOnFocus = false
keyTextBox.PlaceholderColor3 = Color3.fromRGB(180, 150, 220)
keyTextBox.Parent = keyEntryFrame
local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0, 10)
textBoxCorner.Parent = keyTextBox
local textBoxStroke = Instance.new("UIStroke")
textBoxStroke.Thickness = 1.5
textBoxStroke.Color = Color3.fromRGB(130, 90, 210)
textBoxStroke.Transparency = 0.4
textBoxStroke.Parent = keyTextBox
local function createButton(buttonText, positionOffset, backgroundColor)
    local button = Instance.new("TextButton")
    button.Text = buttonText
    button.Size = UDim2.new(0, 135, 0, 40)
    button.Position = UDim2.new(0.5, positionOffset, 0, 165)
    button.BackgroundColor3 = backgroundColor
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 17
    button.AutoButtonColor = false
    button.Parent = keyEntryFrame
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 10)
    buttonCorner.Parent = button
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Thickness = 1.3
    buttonStroke.Color = Color3.fromRGB(255, 255, 255)
    buttonStroke.Transparency = 0.9
    buttonStroke.Parent = button
    return button
end
local unlockButton = createButton("Unlock", -155, Color3.fromRGB(80, 40, 150))
local joinDiscordButton = createButton("Join Discord", 20, Color3.fromRGB(60, 20, 120))
local discordPromptLabel = Instance.new("TextLabel")
discordPromptLabel.Text = "������️ JOIN DISCORD TO GET KEY"
discordPromptLabel.Font = Enum.Font.GothamMedium
discordPromptLabel.TextSize = 14
discordPromptLabel.TextColor3 = Color3.fromRGB(180, 160, 220)
discordPromptLabel.Position = UDim2.new(0.5, -100, 0, 215)
discordPromptLabel.Size = UDim2.new(0, 200, 0, 25)
discordPromptLabel.BackgroundTransparency = 1
discordPromptLabel.TextTransparency = 0.05
discordPromptLabel.Parent = keyEntryFrame
local function addButtonHoverEffect(button, hoverColor)
    button.MouseEnter:Connect(
        function()
            TweenService:Create(
                button,
                TweenInfo.new(0.25),
                {
                    BackgroundColor3 = hoverColor:Lerp(Color3.fromRGB(130, 80, 210), 0.3)
                }
            ):Play()
        end
    )
    button.MouseLeave:Connect(
        function()
            TweenService:Create(
                button,
                TweenInfo.new(0.25),
                {
                    BackgroundColor3 = hoverColor
                }
            ):Play()
        end
    )
end
addButtonHoverEffect(unlockButton, Color3.fromRGB(80, 40, 150))
addButtonHoverEffect(joinDiscordButton, Color3.fromRGB(60, 20, 120))
local function showNotification(message)
    local notificationLabel = Instance.new("TextLabel")
    notificationLabel.Text = message
    notificationLabel.Font = Enum.Font.GothamBold
    notificationLabel.TextSize = 16
    notificationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    notificationLabel.BackgroundColor3 = Color3.fromRGB(45, 0, 75)
    notificationLabel.BackgroundTransparency = 0.15
    notificationLabel.Size = UDim2.new(0, 260, 0, 35)
    notificationLabel.Position = UDim2.new(0.5, -130, 0.3, 0)
    notificationLabel.Parent = keySystemGui
    notificationLabel.TextTransparency = 1
    notificationLabel.BackgroundTransparency = 1
    local notificationCorner = Instance.new("UICorner")
    notificationCorner.CornerRadius = UDim.new(0, 10)
    notificationCorner.Parent = notificationLabel
    TweenService:Create(
        notificationLabel,
        TweenInfo.new(0.3),
        {
            TextTransparency = 0,
            BackgroundTransparency = 0.15
        }
    ):Play()
    task.wait(1.8)
    TweenService:Create(
        notificationLabel,
        TweenInfo.new(0.5),
        {
            TextTransparency = 1,
            BackgroundTransparency = 1
        }
    ):Play()
    task.wait(0.6)
    notificationLabel:Destroy()
end
keyEntryFrame.Visible = true
keyEntryFrame.BackgroundTransparency = 1
titleLabel.TextTransparency = 1
instructionLabel.TextTransparency = 1
keyTextBox.TextTransparency = 1
unlockButton.TextTransparency = 1
joinDiscordButton.TextTransparency = 1
discordPromptLabel.TextTransparency = 1
local fadeDuration = 0.8
TweenService:Create(
    keyEntryFrame,
    TweenInfo.new(fadeDuration),
    {
        BackgroundTransparency = 0.6
    }
):Play()
TweenService:Create(
    titleLabel,
    TweenInfo.new(fadeDuration),
    {
        TextTransparency = 0
    }
):Play()
TweenService:Create(
    instructionLabel,
    TweenInfo.new(fadeDuration + 0.2),
    {
        TextTransparency = 0
    }
):Play()
TweenService:Create(
    keyTextBox,
    TweenInfo.new(fadeDuration + 0.2),
    {
        TextTransparency = 0
    }
):Play()
TweenService:Create(
    unlockButton,
    TweenInfo.new(fadeDuration + 0.3),
    {
        TextTransparency = 0
    }
):Play()
TweenService:Create(
    joinDiscordButton,
    TweenInfo.new(fadeDuration + 0.3),
    {
        TextTransparency = 0
    }
):Play()
TweenService:Create(
    discordPromptLabel,
    TweenInfo.new(fadeDuration + 0.4),
    {
        TextTransparency = 0.05
    }
):Play()
local function grantAccess()
    showNotification("✅ Key accepted!")
    TweenService:Create(
        blurEffect,
        TweenInfo.new(0.5),
        {
            Size = 0
        }
    ):Play()
    task.wait(0.5)
    blurEffect:Destroy()
    keySystemGui:Destroy()
    loadstring(game:HttpGet("https://pastefy.app/JJVhs3rK/raw"))()
end
unlockButton.MouseButton1Click:Connect(
    function()
        if ((keyTextBox.Text or ""):match("^%s*(.-)%s*$") or ""):lower() == accessKey:lower() then
            grantAccess()
        else
            keyTextBox.Text = ""
            keyTextBox.PlaceholderText = "❌ Invalid Key!"
            keyTextBox.PlaceholderColor3 = Color3.fromRGB(255, 100, 100)
            showNotification("❌ Invalid Key! Try again.")
        end
    end
)
joinDiscordButton.MouseButton1Click:Connect(
    function()
        if setclipboard then
            setclipboard(discordLink)
        elseif toclipboard then
            toclipboard(discordLink)
        else
            warn("Clipboard not supported")
        end
        showNotification("������ Discord link copied to clipboard!")
    end
)