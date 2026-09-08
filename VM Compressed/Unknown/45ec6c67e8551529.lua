---------------------------
--  GLOBAL BLOCKER
---------------------------
_G.StartMainMenu = false

---------------------------
--  MAIN MENU WRAPPER
---------------------------
local function loadMainMenu()
    loadstring(game:HttpGet("https://pastebin.com/raw/Nvf1USqV"))() 
end

---------------------------
--  KEY SYSTEM
---------------------------
local KEY_REQUIRED = "IDKKeyHubH2p25"
local KEY_LINK = "https://discord.gg/MFwf9JFmb"

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Enter Key"
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)

local keyBox = Instance.new("TextBox", frame)
keyBox.Size = UDim2.new(1, -20, 0, 40)
keyBox.Position = UDim2.new(0, 10, 0, 50)
keyBox.PlaceholderText = "Enter key..."
keyBox.Text = ""
keyBox.TextScaled = true
keyBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
keyBox.TextColor3 = Color3.new(1,1,1)

local checkBtn = Instance.new("TextButton", frame)
checkBtn.Size = UDim2.new(0, 130, 0, 40)
checkBtn.Position = UDim2.new(0, 10, 0, 110)
checkBtn.Text = "Check Key"
checkBtn.TextScaled = true
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)

local getBtn = Instance.new("TextButton", frame)
getBtn.Size = UDim2.new(0, 130, 0, 40)
getBtn.Position = UDim2.new(0, 160, 0, 110)
getBtn.Text = "Get Key"
getBtn.TextScaled = true
getBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 1, -30)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.new(1, 0, 0)
status.TextScaled = true
status.Text = ""

-- Copy link
getBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_LINK)
        status.Text = "Copied!"
        status.TextColor3 = Color3.new(0, 1, 0)
    else
        status.Text = "Clipboard unsupported"
        status.TextColor3 = Color3.new(1, 0, 0)
    end
end)

-- Key check
checkBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == KEY_REQUIRED then
        status.Text = "Correct key!"
        status.TextColor3 = Color3.new(0,1,0)
        task.wait(0.3)

        frame:Destroy()             -- удаляем окно с ключом
        _G.StartMainMenu = true     -- разрешаем запуск
        loadMainMenu()              -- запускаем основной код
    else
        status.Text = "Wrong key!"
        status.TextColor3 = Color3.new(1,0,0)
    end
end)