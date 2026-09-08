-- Modern Key System GUI with One-Time Unlock

local sg = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local s = game:GetService("StarterGui")

local saveFile = "KS_Unlock.txt" -- file to save unlock status

-- Notification helper

local function n(t, x, d)

    pcall(function()

        s:SetCore("SendNotification", {Title = t, Text = x, Duration = d or 3})

    end)

end

-- Settings

local keyRequired = "1122" -- change this to your desired key

local getKeyLink = "https://loot-link.com/s?7Eme0aDd" -- link for get key

local scriptURL = "https://pastefy.app/MJw2J4T6/raw" -- script to execute

-- If already unlocked, auto-execute

if isfile and isfile(saveFile) then

    if readfile(saveFile) == tostring(game.Players.LocalPlayer.UserId) then

        loadstring(game:HttpGet(scriptURL))()

        return

    end

end

-- GUI Setup

local g = Instance.new("ScreenGui")

g.Name = "KS_GUI"

g.ResetOnSpawn = false

g.Parent = sg

local f = Instance.new("Frame")

f.Size = UDim2.new(0, 300, 0, 150)

f.Position = UDim2.new(0.5, -150, 0.5, -75)

f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

f.BorderSizePixel = 0

f.Parent = g

local tb = Instance.new("TextBox")

tb.Size = UDim2.new(0.8, 0, 0, 35)

tb.Position = UDim2.new(0.1, 0, 0.15, 0)

tb.PlaceholderText = "🔑 Enter Key..."

tb.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

tb.TextColor3 = Color3.fromRGB(255, 255, 255)

tb.TextScaled = true

tb.Parent = f

local sb = Instance.new("TextButton")

sb.Size = UDim2.new(0.35, 0, 0, 35)

sb.Position = UDim2.new(0.1, 0, 0.55, 0)

sb.Text = "✅ Submit"

sb.BackgroundColor3 = Color3.fromRGB(0, 200, 0)

sb.TextColor3 = Color3.fromRGB(255, 255, 255)

sb.TextScaled = true

sb.Parent = f

local gb = Instance.new("TextButton")

gb.Size = UDim2.new(0.35, 0, 0, 35)

gb.Position = UDim2.new(0.55, 0, 0.55, 0)

gb.Text = "🔗 Get Key"

gb.BackgroundColor3 = Color3.fromRGB(0, 120, 255)

gb.TextColor3 = Color3.fromRGB(255, 255, 255)

gb.TextScaled = true

gb.Parent = f

-- Submit button logic

sb.MouseButton1Click:Connect(function()

    if tb.Text == keyRequired then

        n("Success", "Correct key! Access granted ✅", 4)

        task.wait(0.5)

        g:Destroy()

        if writefile then

            writefile(saveFile, tostring(game.Players.LocalPlayer.UserId))

        end

        loadstring(game:HttpGet(scriptURL))()

    else

        n("Error", "❌ Wrong key!", 4)

    end

end)

-- Get Key button logic

gb.MouseButton1Click:Connect(function()

    if setclipboard then

        setclipboard(getKeyLink)

        n("Copied", "🔗 Key link copied!", 4)

    else

        n("Manual Copy", "Open: " .. getKeyLink, 5)

    end

end)

