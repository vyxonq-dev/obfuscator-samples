-- ===============================================================
-- 🛠️ Script By @XkarydsX, @AzizAnzoofficiall and Gemini IA 🛠️
-- 💎 DELTA VERSION: HUB NEON + SELETOR 🌐 + DUAL LOADSTRING
-- ===============================================================

local pgui = game:GetService("CoreGui")
local players = game:GetService("Players")
local lp = players.LocalPlayer

-- Função para garantir que a GUI seja inserida no lugar certo
local function getStorage()
    local success, _ = pcall(function() return game:GetService("CoreGui").Name end)
    if success then return game:GetService("CoreGui") end
    return lp:WaitForChild("PlayerGui")
end

local targetStorage = getStorage()

-- 1. NOTIFICAÇÃO (Executa de forma independente)
local function mostrarAviso()
    local sg = Instance.new("ScreenGui", targetStorage)
    sg.Name = "AvisoDelta"
    
    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0.7, 0, 0.06, 0)
    frame.Position = UDim2.new(0.15, 0, -0.1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

    local txt = Instance.new("TextLabel", frame)
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.Text = "The PC version requires selecting the key to run. by noob_artl2"
    txt.TextColor3 = Color3.new(1, 1, 1)
    txt.TextScaled = true
    txt.Font = Enum.Font.SourceSansBold

    -- Animação
    frame:TweenPosition(UDim2.new(0.15, 0, 0.05, 0), "Out", "Quad", 0.5, true)
    
    task.delay(6, function()
        if frame then
            frame:TweenPosition(UDim2.new(0.15, 0, -0.1, 0), "In", "Quad", 0.5, true)
            task.wait(0.6)
            sg:Destroy()
        end
    end)
end

-- 2. HUB PRINCIPAL
if targetStorage:FindFirstChild("DeltaNeonHub") then targetStorage.DeltaNeonHub:Destroy() end

local screenGui = Instance.new("ScreenGui", targetStorage)
screenGui.Name = "DeltaNeonHub"
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 320, 0, 240)
mainFrame.Position = UDim2.new(0.5, -160, 0.5, -120)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.Active = true
mainFrame.Draggable = true 

-- Bordas Neon Simplificadas para performance
local function border(pos, size)
    local b = Instance.new("Frame", mainFrame)
    b.Position, b.Size, b.BorderSizePixel = pos, size, 0
    b.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
end
border(UDim2.new(0,0,0,0), UDim2.new(1,0,0,2))
border(UDim2.new(0,0,1,-2), UDim2.new(1,0,0,2))

-- BOTÃO MOBILE
local mobileBtn = Instance.new("TextButton", mainFrame)
mobileBtn.Size = UDim2.new(0.8, 0, 0, 40)
mobileBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
mobileBtn.Text = "ATIVAR MOBILE"
mobileBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mobileBtn.TextColor3 = Color3.new(1, 1, 1)
mobileBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", mobileBtn)

-- BOTÃO PC
local pcBtn = Instance.new("TextButton", mainFrame)
pcBtn.Size = UDim2.new(0.8, 0, 0, 40)
pcBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
pcBtn.Text = "ATIVAR PC"
pcBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
pcBtn.TextColor3 = Color3.new(1, 1, 1)
pcBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", pcBtn)

-- GLOBO E LINGUAGEM
local globo = Instance.new("TextButton", mainFrame)
globo.Size = UDim2.new(0, 30, 0, 30)
globo.Position = UDim2.new(0.05, 0, 0.05, 0)
globo.Text = "🌐"
globo.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", globo).CornerRadius = UDim.new(1, 0)

-- Ações dos Botões
mobileBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/josevitor8247-png/a82e1e5fce9c76d744af8ec67b16cf04/raw/ce08b2fb8c369ad7b95de99464e2e713bea1ed28/Vip.lua"))()
end)

pcBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/josevitor8247-png/b8c83b9a129f430c4726267c84c437bc/raw/34f2a807808677bcb256f20d4735c9e4e6949130/VipPc2.lua"))()
end)

-- Iniciar Notificação e Script
spawn(mostrarAviso)
