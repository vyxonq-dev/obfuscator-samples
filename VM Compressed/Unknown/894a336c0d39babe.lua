--==========================================================
--  GLOBAL BLOCKER
--==========================================================
_G.StartMainMenu = false

--==========================================================
--  FUNCTION: LOAD MAIN MENU
--==========================================================
-- этот код загрузится после прохождения Key System
function loadMainMenu()
    -- подгружаем твой pastefy
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://pastefy.app/EbVlz5BM/raw"))()
    end)

    if not success then
        warn("MAIN MENU LOAD ERROR: ", err)
    end
end

--==========================================================
--  KEY SYSTEM SETTINGS
--==========================================================
local KEY_REQUIRED = "IdkOPUHub25"
local KEY_LINK = "https://discord.gg/MFwf9JFmb"

--==========================================================
--  KEY SYSTEM GUI
--==========================================================
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 200)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "Enter Key"
title.TextScaled = true
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Parent = frame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -20, 0, 40)
keyBox.Position = UDim2.new(0, 10, 0, 50)
keyBox.PlaceholderText = "Enter key..."
keyBox.Text = ""
keyBox.TextScaled = true
keyBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.Parent = frame

local checkBtn = Instance.new("TextButton")
checkBtn.Size = UDim2.new(0, 130, 0, 40)
checkBtn.Position = UDim2.new(0, 10, 0, 110)
checkBtn.Text = "Check Key"
checkBtn.TextScaled = true
checkBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
checkBtn.Parent = frame

local getBtn = Instance.new("TextButton")
getBtn.Size = UDim2.new(0, 130, 0, 40)
getBtn.Position = UDim2.new(0, 160, 0, 110)
getBtn.Text = "Get Key"
getBtn.TextScaled = true
getBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
getBtn.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 1, -30)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.new(1, 0, 0)
status.TextScaled = true
status.Text = ""
status.Parent = frame

--==========================================================
--  COPY KEY BUTTON
--==========================================================
getBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KEY_LINK)
        status.Text = "Copied!"
        status.TextColor3 = Color3.new(0,1,0)
    else
        status.Text = "Clipboard unsupported"
        status.TextColor3 = Color3.new(1,0,0)
    end
end)

--==========================================================
--  CHECK KEY BUTTON
--==========================================================
checkBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == KEY_REQUIRED then
        
        status.Text = "Correct key!"
        status.TextColor3 = Color3.new(0,1,0)

        task.wait(0.3)

        gui:Destroy() -- убираем окно
        _G.StartMainMenu = true

        -- запускаем основное меню
        loadMainMenu()

    else
        status.Text = "Wrong key!"
        status.TextColor3 = Color3.new(1,0,0)
    end
end)