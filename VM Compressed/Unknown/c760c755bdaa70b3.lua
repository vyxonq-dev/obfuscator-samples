local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "8c3b16e9f7affeff0f831c9322f0fbf3"

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "LuarmorUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 360, 0, 260)
frame.Position = UDim2.new(0.5, -180, 0.5, -130)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
frame.BorderSizePixel = 0

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "🔐 Luarmor Key System"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(200, 200, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold

local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(1, -20, 0, 40)
textbox.Position = UDim2.new(0, 10, 0, 40)
textbox.PlaceholderText = "Paste your Luarmor key here"
textbox.Text = ""
textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.TextSize = 16
textbox.Font = Enum.Font.Gotham

local submit = Instance.new("TextButton", frame)
submit.Size = UDim2.new(1, -20, 0, 35)
submit.Position = UDim2.new(0, 10, 0, 90)
submit.Text = "✅ Submit Key"
submit.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
submit.TextColor3 = Color3.fromRGB(255, 255, 255)
submit.Font = Enum.Font.GothamSemibold
submit.TextSize = 16

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, -20, 0, 25)
status.Position = UDim2.new(0, 10, 0, 135)
status.Text = "Awaiting input..."
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(255, 255, 255)
status.TextSize = 14
status.Font = Enum.Font.Gotham

local getkey = Instance.new("TextButton", frame)
getkey.Size = UDim2.new(0.31, -10, 0, 30)
getkey.Position = UDim2.new(0, 10, 0, 170)
getkey.Text = "🌐 Get Key"
getkey.BackgroundColor3 = Color3.fromRGB(70, 70, 100)
getkey.TextColor3 = Color3.fromRGB(255, 255, 255)
getkey.Font = Enum.Font.GothamSemibold
getkey.TextSize = 14
getkey.MouseButton1Click:Connect(function()
    setclipboard("https://ads.luarmor.net/get_key?for=8h_pilgrammed-pRJSzvwDShHm")
end)

local discord = Instance.new("TextButton", frame)
discord.Size = UDim2.new(0.31, -10, 0, 30)
discord.Position = UDim2.new(0.345, 5, 0, 170)
discord.Text = "💬 Discord"
discord.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discord.TextColor3 = Color3.fromRGB(255, 255, 255)
discord.Font = Enum.Font.GothamSemibold
discord.TextSize = 14
discord.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/TmaW27B3Mf")
end)

-- 🔴 Kill GUI button
local kill = Instance.new("TextButton", frame)
kill.Size = UDim2.new(0.31, -10, 0, 30)
kill.Position = UDim2.new(0.69, 5, 0, 170)
kill.Text = "❌ Close UI"
kill.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
kill.TextColor3 = Color3.fromRGB(255, 255, 255)
kill.Font = Enum.Font.GothamSemibold
kill.TextSize = 14
kill.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

submit.MouseButton1Click:Connect(function()
    local key = textbox.Text
    if key == "" then
        status.Text = "❌ No key entered."
        return
    end

    status.Text = "🔎 Verifying..."
    local success, result = pcall(api.check_key, key)
    if not success or not result then
        status.Text = "⚠️ Request failed."
        return
    end

    if result.code == "KEY_VALID" then
        status.Text = "✅ Key valid! Loading script..."
        script_key = key
        task.wait(1)
        api.load_script()
    elseif result.code == "KEY_HWID_LOCKED" then
        status.Text = "🔒 HWID-locked key."
        game.Players.LocalPlayer:Kick("Key is linked to another device.")
    elseif result.code == "KEY_EXPIRED" then
        status.Text = "⌛ Key expired."
        game.Players.LocalPlayer:Kick("Key expired.")
    elseif result.code == "KEY_INCORRECT" then
        status.Text = "❌ Invalid or deleted key."
        game.Players.LocalPlayer:Kick("Invalid key.")
    else
        status.Text = "💥 " .. (result.message or "Unknown error")
        game.Players.LocalPlayer:Kick("Key check failed: " .. (result.message or "???"))
    end
end)
