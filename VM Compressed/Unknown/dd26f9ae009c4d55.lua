if not game:IsLoaded() then 
    game.Loaded:Wait()
end

local key = "Dek2025" -- Definição da key
local userInput = ""

-- Criando UI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local VerifyButton = Instance.new("TextButton")
local GetKeyButton = Instance.new("TextButton")
local Notification = Instance.new("TextLabel")

-- Prevenção de múltiplas instâncias
ScreenGui.Name = "KeySystem"
if game.CoreGui:FindFirstChild("KeySystem") then
    game.CoreGui.KeySystem:Destroy()
end

ScreenGui.Parent = game.CoreGui

-- Configuração da UI
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.35, 0, 0.3, 0)
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Active = true
Frame.Draggable = true -- Permite mover a UI

Title.Parent = Frame
Title.Text = "Script Hub"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

KeyBox.Parent = Frame
KeyBox.PlaceholderText = "Digite sua Key..."
KeyBox.Text = ""
KeyBox.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 30)
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)

VerifyButton.Parent = Frame
VerifyButton.Text = "Verificar Key"
VerifyButton.Font = Enum.Font.SourceSansBold
VerifyButton.TextSize = 16
VerifyButton.Position = UDim2.new(0.1, 0, 0.5, 0)
VerifyButton.Size = UDim2.new(0.8, 0, 0, 30)
VerifyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
VerifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

GetKeyButton.Parent = Frame
GetKeyButton.Text = "Adquirir Key"
GetKeyButton.Font = Enum.Font.SourceSansBold
GetKeyButton.TextSize = 16
GetKeyButton.Position = UDim2.new(0.1, 0, 0.7, 0)
GetKeyButton.Size = UDim2.new(0.8, 0, 0, 30)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

Notification.Parent = Frame
Notification.Text = ""
Notification.Font = Enum.Font.SourceSansBold
Notification.TextSize = 14
Notification.Position = UDim2.new(0.1, 0, 0.85, 0)
Notification.Size = UDim2.new(0.8, 0, 0, 30)
Notification.TextColor3 = Color3.fromRGB(255, 255, 255)
Notification.BackgroundTransparency = 1

-- Função para verificar key
VerifyButton.MouseButton1Click:Connect(function()
    userInput = KeyBox.Text
    if userInput == key then
        Notification.Text = "Key correta! Executando..."
        wait(1)
        ScreenGui:Destroy()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/e1cfd93b113a79773d93251b61af1e2f.lua"))()
    else
        Notification.Text = "Key incorreta!"
        wait(1)
        Notification.Text = ""
    end
end)

-- Função para adquirir a key
GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://fir3.net/pass2")
    Notification.Text = "Link copiado!"
    wait(1.5)
    Notification.Text = ""
end)
