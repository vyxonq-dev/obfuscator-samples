--// RHON TREASURE HUNTER WITH KEYSYSTEM + DRAGGABLE GUI //--

local pastebin = "https://pastebin.com/raw/gPR5Fdav" -- main script
local correctKey = "RHONPRO" -- your Discord key

--// Key GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local TextBox = Instance.new("TextBox")
local Button = Instance.new("TextButton")
local DiscordBtn = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui

Frame.Size = UDim2.new(0, 350, 0, 200)
Frame.Position = UDim2.new(0.5, -175, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui
UICorner.CornerRadius = UDim.new(0,12)
UICorner.Parent = Frame

Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "🔑 RHON TREASURE KEYSYSTEM 🔑"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.Parent = Frame

TextBox.Size = UDim2.new(0, 280, 0, 40)
TextBox.Position = UDim2.new(0.5, -140, 0.35, -20)
TextBox.PlaceholderText = "Enter Key..."
TextBox.Text = ""
TextBox.TextScaled = true
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.TextColor3 = Color3.fromRGB(255,255,255)
TextBox.Font = Enum.Font.SourceSans
TextBox.Parent = Frame

Button.Size = UDim2.new(0, 280, 0, 35)
Button.Position = UDim2.new(0.5, -140, 0.65, -15)
Button.Text = "Unlock Script"
Button.TextScaled = true
Button.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
Button.TextColor3 = Color3.fromRGB(255,255,255)
Button.Font = Enum.Font.SourceSansBold
Button.Parent = Frame

DiscordBtn.Size = UDim2.new(0, 280, 0, 35)
DiscordBtn.Position = UDim2.new(0.5, -140, 0.85, -15)
DiscordBtn.Text = "📌 Join Discord for Key"
DiscordBtn.TextScaled = true
DiscordBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
DiscordBtn.TextColor3 = Color3.fromRGB(255,255,255)
DiscordBtn.Font = Enum.Font.SourceSansBold
DiscordBtn.Parent = Frame

--// Button Logic
Button.MouseButton1Click:Connect(function()
    if TextBox.Text == correctKey then
        Frame:Destroy()
        loadstring(game:HttpGet(pastebin))()
    else
        Button.Text = "❌ Wrong Key!"
        Button.BackgroundColor3 = Color3.fromRGB(200,0,0)
        task.wait(1.5)
        Button.Text = "Unlock Script"
        Button.BackgroundColor3 = Color3.fromRGB(0,200,0)
    end
end)

DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/PSaUnQ9FTQ")
    DiscordBtn.Text = "✅ Discord Link Copied!"
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(0,200,0)
    task.wait(1.5)
    DiscordBtn.Text = "📌 Join Discord for Key"
    DiscordBtn.BackgroundColor3 = Color3.fromRGB(0,120,255)
end)