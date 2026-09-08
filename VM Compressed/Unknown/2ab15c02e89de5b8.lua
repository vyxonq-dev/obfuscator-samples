-- Purple Key GUI for Infinite Yield Loader
-- Key: Razzyisthebest
-- Auto clipboard: https://discord.gg/WYPtQ7h7un

-- Copy link to clipboard (works in most executors)
pcall(function()
    setclipboard("https://discord.gg/WYPtQ7h7un")
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "KeyGUI"
gui.ResetOnSpawn = false

-- Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 100)
frame.Position = UDim2.new(0.5, -110, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(150, 0, 200) -- Purple
frame.BorderSizePixel = 0

-- Label
local label = Instance.new("TextLabel", frame)
label.Size = UDim2.new(1, 0, 0.4, 0)
label.Position = UDim2.new(0, 0, 0, 0)
label.Text = "Enter Key"
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.Font = Enum.Font.SourceSansBold
label.TextSize = 22

-- TextBox
local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(1, -20, 0.4, 0)
textbox.Position = UDim2.new(0, 10, 0.5, 0)
textbox.PlaceholderText = "Key here..."
textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
textbox.TextColor3 = Color3.new(0, 0, 0)
textbox.Text = ""
textbox.Font = Enum.Font.SourceSans
textbox.TextSize = 18
textbox.ClearTextOnFocus = false

-- Check Key
textbox.FocusLost:Connect(function()
	if textbox.Text == "Razzyisthebest" then
		gui:Destroy()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	else
		textbox.Text = ""
		textbox.PlaceholderText = "Wrong Key"
	end
end)
