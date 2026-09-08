--[[
    FNaF HUB - MODERN KEY SYSTEM (Sigmaboy Edition)
    Auto-Execute: https://pastebin.com/raw/7YvcJFcT
    Keys: sigmaboy, miraç, mert
    Discord: https://discord.gg/qvQuaCxAm
--]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- [[ AYARLAR ]]
local ALLOWED_KEYS = {"sigmaboy", "miraç", "mert"}
local DISCORD_LINK = "https://discord.gg/qvQuaCxAm"
local AUTO_EXECUTE_URL = "https://pastebin.com/raw/7YvcJFcT" -- YENİ LİNK AYARLANDI!

-- 1. ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FNaF_KeySystem_Updated"
ScreenGui.Parent = PlayerGui
ScreenGui.ResetOnSpawn = false

-- 2. ANA PANEL
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 240)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -120)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true 
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- BAŞLIK
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "FNaF HUB KEY SYSTEM\n<font color='#FFD700'>(key on discord)</font>"
Title.RichText = true
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.BackgroundTransparency = 1
Title.Parent = MainFrame

-- Key Input
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.8, 0, 0, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
KeyInput.PlaceholderText = "Enter Key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 18
KeyInput.Parent = MainFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

-- Verify Button
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.8, 0, 0, 40)
VerifyBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
VerifyBtn.Text = "VERIFY & LAUNCH"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.SourceSansBold
VerifyBtn.TextSize = 18
VerifyBtn.Parent = MainFrame
Instance.new("UICorner", VerifyBtn).CornerRadius = UDim.new(0, 8)

-- Get Key Button
local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.8, 0, 0, 35)
GetKeyBtn.Position = UDim2.new(0.1, 0, 0.8, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
GetKeyBtn.Text = "Get Key (Discord)"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 162, 200)
GetKeyBtn.Font = Enum.Font.SourceSansBold
GetKeyBtn.TextSize = 16
GetKeyBtn.Parent = MainFrame
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 8)

-- [[ DOĞRULAMA VE ÇALIŞTIRMA ]]
VerifyBtn.MouseButton1Click:Connect(function()
    local enteredKey = string.lower(KeyInput.Text)
    local success = false
    
    for _, key in ipairs(ALLOWED_KEYS) do
        if enteredKey == key then success = true break end
    end
    
    if success then
        VerifyBtn.Text = "ACCESS GRANTED!"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(40, 180, 100)
        task.wait(1)
        ScreenGui:Destroy()
        
        -- YENİ SCRIPT ÇALIŞTIRILIYOR
        loadstring(game:HttpGet(AUTO_EXECUTE_URL))()
    else
        VerifyBtn.Text = "WRONG KEY!"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.5)
        VerifyBtn.Text = "VERIFY & LAUNCH"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
        KeyInput.Text = ""
    end
end)

-- Discord Link
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DISCORD_LINK)
        GetKeyBtn.Text = "COPIED!"
    else
        print(DISCORD_LINK)
    end
    task.wait(2)
    GetKeyBtn.Text = "Get Key (Discord)"
end)

-- Animasyon
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame:TweenSize(UDim2.new(0, 320, 0, 240), "Out", "Back", 0.5, true)
