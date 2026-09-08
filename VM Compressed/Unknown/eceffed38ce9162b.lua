local player = game:GetService("Players").LocalPlayer
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke") -- Borda Roxa
local WelcomeText = Instance.new("TextLabel")
local VersionText = Instance.new("TextLabel")
local PortugueseButton = Instance.new("TextButton")
local EnglishButton = Instance.new("TextButton")
local SelectionText = Instance.new("TextLabel") -- Mensagem de seleÃ§Ã£o

-- ConfiguraÃ§Ã£o da ScreenGui
ScreenGui.Parent = player:WaitForChild("PlayerGui")

-- ConfiguraÃ§Ã£o do Frame (Interface mais larga e menor na altura)
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fundo Preto
Frame.Size = UDim2.new(0, 500, 0, 180) -- Largura maior e altura menor
Frame.Position = UDim2.new(0.5, -250, 0.5, -90)

-- borda roxa Ai papai
UIStroke.Parent = Frame
UIStroke.Thickness = 4
UIStroke.Color = Color3.fromRGB(128, 0, 128) -- Roxo

-- ConfiguraÃ§Ã£o do Texto de Boas-Vindas
WelcomeText.Parent = Frame
WelcomeText.Text = "Welcome The Archon Hub!"
WelcomeText.Size = UDim2.new(1, 0, 1, 0)
WelcomeText.TextColor3 = Color3.fromRGB(255, 255, 255) -- Letras Brancas
WelcomeText.BackgroundTransparency = 1
WelcomeText.Font = Enum.Font.GothamBlack
WelcomeText.TextScaled = true

-- Aguarda 2 segundos e some com a mensagem
task.wait(2)
WelcomeText:Destroy()

-- ConfiguraÃ§Ã£o do Texto de Escolha de VersÃ£o
VersionText.Parent = Frame
VersionText.Text = "Ø§Ø®ØªØ± Ø§ÙÙØºØ© | Select language"
VersionText.Size = UDim2.new(1, 0, 0.3, 0)
VersionText.Position = UDim2.new(0, 0, 0.1, 0)
VersionText.TextColor3 = Color3.fromRGB(255, 255, 255) -- Letras Brancas
VersionText.BackgroundTransparency = 1
VersionText.Font = Enum.Font.GothamBlack
VersionText.TextScaled = true


PortugueseButton.Parent = Frame
PortugueseButton.Text = "English"
PortugueseButton.Size = UDim2.new(0.45, 0, 0.3, 0)
PortugueseButton.Position = UDim2.new(0.05, 0, 0.6, 0)
PortugueseButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
PortugueseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PortugueseButton.Font = Enum.Font.GothamBold
PortugueseButton.TextScaled = true
PortugueseButton.BorderSizePixel = 2

-- ConfiguraÃ§Ã£o do BotÃ£o English ðºð¸
EnglishButton.Parent = Frame
EnglishButton.Text = "Ø§ÙØ¹Ø±Ø¨Ù"
EnglishButton.Size = UDim2.new(0.45, 0, 0.3, 0)
EnglishButton.Position = UDim2.new(0.5, 0, 0.6, 0)
EnglishButton.BackgroundColor3 = Color3.fromRGB(0, 0, 200)
EnglishButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnglishButton.Font = Enum.Font.GothamBold
EnglishButton.TextScaled = true
EnglishButton.BorderSizePixel = 2

-- ConfiguraÃ§Ã£o do Texto de SeleÃ§Ã£o
SelectionText.Parent = Frame
SelectionText.Size = UDim2.new(1, 0, 1, 0)
SelectionText.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectionText.BackgroundTransparency = 1
SelectionText.Font = Enum.Font.GothamBlack
SelectionText.TextScaled = true
SelectionText.Visible = false -- Inicialmente escondido

-- remover a interface e carregar o script em PortuguÃªs XD
PortugueseButton.MouseButton1Click:Connect(function()
VersionText.Visible = false
PortugueseButton.Visible = false
EnglishButton.Visible = false

-- Exibe a mensagem de seleÃ§Ã£o por 1,5 segundos
SelectionText.Text = "â¦ââ _â ââ© English â¦ââ _â ââ©"
SelectionText.Visible = true
task.wait(1.5)

ScreenGui:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ashleyQwma/New/refs/heads/main/Protected_4394808817355641%20(1).txt"))()

end)

-- remover a interface e carregar o script em InglÃªs XD
EnglishButton.MouseButton1Click:Connect(function()
VersionText.Visible = false
PortugueseButton.Visible = false
EnglishButton.Visible = false

SelectionText.Text = "ââ _â âØ§ÙØ¹Ø±Ø¨Ùââ _â â"
SelectionText.Visible = true
task.wait(1.5)

ScreenGui:Destroy()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ashleyQwma/New/refs/heads/main/Protected_3970650427049154.txt"))()
end)
