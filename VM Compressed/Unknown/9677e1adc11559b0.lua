local key = "Thomask Musk"

local gui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 350, 0, 220)
frame.Position = UDim2.new(0.5, -175, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Name = "AjdarKeySystem"

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "AJDAR Key System"
title.TextColor3 = Color3.fromRGB(255, 200, 0)
title.Font = Enum.Font.SourceSansBold
title.TextScaled = true

local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(0.8, 0, 0, 35)
textbox.Position = UDim2.new(0.1, 0, 0.3, 0)
textbox.PlaceholderText = "Enter Key"
textbox.Text = ""
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.Font = Enum.Font.SourceSans
textbox.TextScaled = true

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.5, 0, 0, 35)
button.Position = UDim2.new(0.25, 0, 0.55, 0)
button.Text = "Submit"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
button.Font = Enum.Font.SourceSansBold
button.TextScaled = true

local discordBox = Instance.new("TextBox", frame)
discordBox.Size = UDim2.new(0.8, 0, 0, 25)
discordBox.Position = UDim2.new(0.1, 0, 0.75, 0)
discordBox.Text = "discord.gg/4wxuCKrqRQ"
discordBox.TextEditable = false
discordBox.TextColor3 = Color3.fromRGB(255, 255, 255)
discordBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
discordBox.Font = Enum.Font.SourceSans
discordBox.TextScaled = true

local copyButton = Instance.new("TextButton", frame)
copyButton.Size = UDim2.new(0.5, 0, 0, 25)
copyButton.Position = UDim2.new(0.25, 0, 0.85, 0)
copyButton.Text = "Copy Discord Link"
copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
copyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
copyButton.Font = Enum.Font.SourceSansBold
copyButton.TextScaled = true

local notification = Instance.new("TextLabel", gui)
notification.Size = UDim2.new(0, 220, 0, 40)
notification.Position = UDim2.new(0.5, -110, 0.1, 0)
notification.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
notification.Text = "Discord link copied!"
notification.TextColor3 = Color3.fromRGB(255, 255, 255)
notification.Font = Enum.Font.SourceSansBold
notification.TextScaled = true
notification.Visible = false
notification.BackgroundTransparency = 0.2
notification.BorderSizePixel = 0

copyButton.MouseButton1Click:Connect(function()
    setclipboard("discord.gg/4wxuCKrqRQ")
    notification.Visible = true
    wait(2)
    notification.Visible = false
end)

button.MouseButton1Click:Connect(function()
    if textbox.Text == key then
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
        button.Text = "Correct Key!"
        wait(1)
        gui:Destroy()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/berat9792/7b2520dfd5cd5018144598064c59bfc9/raw/ea43dd7007f169a7b2b017241eb8979fc7f6161f/gistfile1.txt"))()
    else
        button.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
        button.Text = "Wrong Key!"
    end
end)