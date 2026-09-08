--// Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

--// Config
local CORRECT_KEY = "SENTRY"
local KEY_LINK = "https://rekonise.com/sentryhub-get-key-fjjka"
local REAL_SCRIPT = 'loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/99cb0ed8a306c003"))()'

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemGUI"
gui.ResetOnSpawn = false
gui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.fromScale(0.35, 0.35)
frame.Position = UDim2.fromScale(0.5, 0.5)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

--// Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.2, 0)
title.BackgroundTransparency = 1
title.Text = "Sentry Hub Key System"
title.TextScaled = true
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.Parent = frame

--// Key Box
local box = Instance.new("TextBox")
box.PlaceholderText = "Enter Key Here"
box.Size = UDim2.new(0.8, 0, 0.18, 0)
box.Position = UDim2.new(0.1, 0, 0.28, 0)
box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
box.TextColor3 = Color3.new(1,1,1)
box.TextScaled = true
box.Font = Enum.Font.Gotham
box.ClearTextOnFocus = false
box.Parent = frame
Instance.new("UICorner", box)

--// Get Key Button
local getKey = Instance.new("TextButton")
getKey.Text = "Get Key"
getKey.Size = UDim2.new(0.8, 0, 0.18, 0)
getKey.Position = UDim2.new(0.1, 0, 0.5, 0)
getKey.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
getKey.TextColor3 = Color3.new(1,1,1)
getKey.TextScaled = true
getKey.Font = Enum.Font.GothamBold
getKey.Parent = frame
Instance.new("UICorner", getKey)

--// Verify Button
local verify = Instance.new("TextButton")
verify.Text = "Verify Key"
verify.Size = UDim2.new(0.8, 0, 0.18, 0)
verify.Position = UDim2.new(0.1, 0, 0.72, 0)
verify.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
verify.TextColor3 = Color3.new(1,1,1)
verify.TextScaled = true
verify.Font = Enum.Font.GothamBold
verify.Parent = frame
Instance.new("UICorner", verify)

--// Get Key Function
getKey.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_LINK)
        getKey.Text = "Copied to clipboard"
    else
        getKey.Text = "Clipboard not supported"
    end
end)

--// Verify Function
verify.MouseButton1Click:Connect(function()
    if box.Text == CORRECT_KEY then
        gui:Destroy()
        loadstring(REAL_SCRIPT)()
    else
        verify.Text = "Invalid Key"
        task.wait(1.2)
        verify.Text = "Verify Key"
    end
end)