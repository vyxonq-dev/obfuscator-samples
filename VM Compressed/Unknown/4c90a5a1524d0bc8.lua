-- Key System with key "Razzyisthebest" and clipboard discord link

local FIXED_KEY = "Razzyisthebest"
local DISCORD_LINK = "https://discord.gg/WYPtQ7h7un"

-- Try to copy Discord link to clipboard (safe)
pcall(function()
    setclipboard(DISCORD_LINK)
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "KeySystemGui"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(75, 0, 130) -- purple theme
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Join the discord server below"
title.TextColor3 = Color3.fromRGB(230, 230, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 24

local discordLabel = Instance.new("TextLabel", frame)
discordLabel.Size = UDim2.new(1, 0, 0, 30)
discordLabel.Position = UDim2.new(0, 0, 0, 55)
discordLabel.BackgroundTransparency = 1
discordLabel.Text = DISCORD_LINK
discordLabel.TextColor3 = Color3.fromRGB(180, 220, 255)
discordLabel.Font = Enum.Font.GothamBold
discordLabel.TextSize = 20

local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(0.8, 0, 0, 35)
textbox.Position = UDim2.new(0.1, 0, 0, 95)
textbox.PlaceholderText = "Type the key here"
textbox.BackgroundColor3 = Color3.fromRGB(100, 65, 170)
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.Font = Enum.Font.Gotham
textbox.TextSize = 20
textbox.ClearTextOnFocus = false
textbox.Text = ""

local infoLabel = Instance.new("TextLabel", frame)
infoLabel.Size = UDim2.new(1, 0, 0, 25)
infoLabel.Position = UDim2.new(0, 0, 0, 135)
infoLabel.BackgroundTransparency = 1
infoLabel.Text = ""
infoLabel.TextColor3 = Color3.fromRGB(255, 120, 120)
infoLabel.Font = Enum.Font.GothamBold
infoLabel.TextSize = 18

textbox.FocusLost:Connect(function(enterPressed)
    if not enterPressed then return end
    if textbox.Text == FIXED_KEY then
        gui:Destroy()
        -- Run the target script after key is verified
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dream77239/les-battleground/refs/heads/main/legends%20battleground"))()
    else
        infoLabel.Text = "Incorrect key, please try again."
        textbox.Text = ""
        wait(2)
        infoLabel.Text = ""
    end
end)
