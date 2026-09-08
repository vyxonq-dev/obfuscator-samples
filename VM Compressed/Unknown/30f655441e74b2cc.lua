-- ================================================
--   Moon Update - Sailor Piece Auto Farm
--   Key System Added
-- ================================================

local correctKey = "PoqiskamqlloaKa"
local keyLink    = "https://link-hub.net/4473711/ltVBP0lCELwD"

local function notify(title, text)
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 5
        })
    end)
end

-- ================== KEY SYSTEM ==================
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeySystem"
keyGui.ResetOnSpawn = false
keyGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 40)
frame.BorderSizePixel = 0
frame.Parent = keyGui

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "MOON UPDATE - SAILOR PIECE"
title.TextColor3 = Color3.fromRGB(255, 200, 200)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, -20, 0, 30)
keyLabel.Position = UDim2.new(0, 10, 0, 60)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "Enter Lifetime Key"
keyLabel.TextColor3 = Color3.fromRGB(180, 180, 255)
keyLabel.Font = Enum.Font.Gotham
keyLabel.TextSize = 16
keyLabel.Parent = frame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -20, 0, 45)
keyBox.Position = UDim2.new(0, 10, 0, 95)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
keyBox.PlaceholderText = "Paste key here..."
keyBox.Text = ""
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 16
keyBox.Parent = frame
Instance.new("UICorner", keyBox).CornerRadius = UDim.new(0, 8)

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.48, 0, 0, 45)
submitBtn.Position = UDim2.new(0.02, 0, 0, 150)
submitBtn.BackgroundColor3 = Color3.fromRGB(40, 160, 40)
submitBtn.Text = "SUBMIT KEY"
submitBtn.TextColor3 = Color3.new(1,1,1)
submitBtn.Font = Enum.Font.GothamBold
submitBtn.TextSize = 16
submitBtn.Parent = frame
Instance.new("UICorner", submitBtn).CornerRadius = UDim.new(0, 8)

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0.48, 0, 0, 45)
getKeyBtn.Position = UDim2.new(0.5, 0, 0, 150)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(60, 100, 200)
getKeyBtn.Text = "GET KEY"
getKeyBtn.TextColor3 = Color3.new(1,1,1)
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 16
getKeyBtn.Parent = frame
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

-- Submit Key
submitBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        notify("✅ Key Correct!", "Loading Moon Update Sailor Piece...")
        keyGui:Destroy()
        task.wait(1)
        -- Execute the original script
        loadstring(game:HttpGet("https://rawscripts.net/raw/Moon-Update-Sailor-Piece-best-Auto-Farm-LVL-RN-NGL-Keyless-184368"))()
    else
        notify("❌ Wrong Key!", "Please get the correct key")
    end
end)

-- Get Key Button
getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(keyLink)
    notify("🔗 Link Copied!", "Open your browser and paste the link.\nThis is a lifetime key (may take 5-10 seconds)")
end)

print("Key System Loaded - Enter the key to continue")
