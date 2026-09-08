-- Studio Script Dark Hub (com bolinha ao minimizar)
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

-- Splash Screen
local SplashScreen = Instance.new("ScreenGui", CoreGui)
SplashScreen.Name = "SplashScreen"
SplashScreen.ResetOnSpawn = false

local SplashFrame = Instance.new("Frame", SplashScreen)
SplashFrame.Size = UDim2.new(1, 0, 1, 0)
SplashFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

local SplashText = Instance.new("TextLabel", SplashFrame)
SplashText.Size = UDim2.new(0, 400, 0, 100)
SplashText.Position = UDim2.new(0.5, -200, 0.5, -50)
SplashText.BackgroundTransparency = 1
SplashText.Text = "Studio Script Dark"
SplashText.TextColor3 = Color3.fromRGB(255, 255, 255)
SplashText.TextSize = 48
SplashText.Font = Enum.Font.GothamBold

wait(3)
TweenService:Create(SplashFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
TweenService:Create(SplashText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
wait(0.5)
SplashScreen:Destroy()

-- GUI Principal
local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "StudioScriptDarkHub"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
MainFrame.BorderSizePixel = 3
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Barra de título
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local TitleLabel = Instance.new("TextLabel", TitleBar)
TitleLabel.Size = UDim2.new(0.7, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Studio Script Dark"
TitleLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
TitleLabel.TextSize = 20
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Botões da barra
local MinimizeBtn = Instance.new("TextButton", TitleBar)
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -70, 0, 5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 24
MinimizeBtn.Font = Enum.Font.GothamBold

local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold

-- Container de Abas
local TabContainer = Instance.new("Frame", MainFrame)
TabContainer.Size = UDim2.new(1, -20, 0, 40)
TabContainer.Position = UDim2.new(0, 10, 0, 50)
TabContainer.BackgroundTransparency = 1

local Tab1Btn = Instance.new("TextButton", TabContainer)
Tab1Btn.Size = UDim2.new(0.5, -5, 1, 0)
Tab1Btn.Text = "Informações"
Tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Tab1Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab1Btn.TextSize = 16
Tab1Btn.Font = Enum.Font.GothamBold

local Tab2Btn = Instance.new("TextButton", TabContainer)
Tab2Btn.Size = UDim2.new(0.5, -5, 1, 0)
Tab2Btn.Position = UDim2.new(0.5, 5, 0, 0)
Tab2Btn.Text = "Scripts"
Tab2Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
Tab2Btn.TextSize = 16
Tab2Btn.Font = Enum.Font.GothamBold

-- Conteúdo Aba 1
local Tab1Content = Instance.new("ScrollingFrame", MainFrame)
Tab1Content.Size = UDim2.new(1, -20, 1, -110)
Tab1Content.Position = UDim2.new(0, 10, 0, 100)
Tab1Content.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Tab1Content.ScrollBarThickness = 6

local InfoText = Instance.new("TextLabel", Tab1Content)
InfoText.Size = UDim2.new(1, -20, 0, 200)
InfoText.Position = UDim2.new(0, 10, 0, 10)
InfoText.BackgroundTransparency = 1
InfoText.Text = [[Desenvolvedor: dark_ofc46

Colaboradores: /

Créditos: /

TikTok: @dark_ofc46]]
InfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoText.TextSize = 18
InfoText.Font = Enum.Font.Gotham
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.TextYAlignment = Enum.TextYAlignment.Top

-- Botão copiar TikTok
local CopyTikTokBtn = Instance.new("TextButton", Tab1Content)
CopyTikTokBtn.Size = UDim2.new(0, 200, 0, 40)
CopyTikTokBtn.Position = UDim2.new(0.5, -100, 0, 230)
CopyTikTokBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CopyTikTokBtn.Text = "📋 Copiar TikTok"
CopyTikTokBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyTikTokBtn.TextSize = 18
CopyTikTokBtn.Font = Enum.Font.GothamBold

CopyTikTokBtn.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://www.tiktok.com/@dark_ofc46?_t=ZM-90gf23jIJrA&_r=1")
		CopyTikTokBtn.Text = "✅ Copiado!"
		TweenService:Create(CopyTikTokBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 200, 0)}):Play()
		task.wait(2)
		CopyTikTokBtn.Text = "📋 Copiar TikTok"
		TweenService:Create(CopyTikTokBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}):Play()
	end
end)

-- Aba 2
local Tab2Content = Instance.new("ScrollingFrame", MainFrame)
Tab2Content.Size = UDim2.new(1, -20, 1, -110)
Tab2Content.Position = UDim2.new(0, 10, 0, 100)
Tab2Content.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Tab2Content.ScrollBarThickness = 6
Tab2Content.Visible = false

local scripts = {
	{name = "Speed", url = "https://pastebin.com/raw/tr1YWdCA"},
	{name = "Sit", url = "https://pastebin.com/raw/ccS9GwBQ"},
	{name = "Anti AFK", url = "https://pastebin.com/raw/wqUX2fs9"},
	{name = "Esticar Tela", url = "https://pastebin.com/raw/DgCU2TFf"},
	{name = "Troll", url = "https://pastebin.com/raw/X0rJEdYE"},
	{name = "ESP", url = "https://pastebin.com/raw/KeeTcR6z"}
}

for i, script in ipairs(scripts) do
	local ScriptBtn = Instance.new("TextButton", Tab2Content)
	ScriptBtn.Size = UDim2.new(1, -20, 0, 45)
	ScriptBtn.Position = UDim2.new(0, 10, 0, (i-1)*55 + 10)
	ScriptBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	ScriptBtn.Text = i .. ". " .. script.name
	ScriptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	ScriptBtn.TextSize = 16
	ScriptBtn.Font = Enum.Font.Gotham
	ScriptBtn.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(script.url))()
	end)
end

-- Alternar abas
Tab1Btn.MouseButton1Click:Connect(function()
	Tab1Content.Visible = true
	Tab2Content.Visible = false
	Tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Tab2Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

Tab2Btn.MouseButton1Click:Connect(function()
	Tab1Content.Visible = false
	Tab2Content.Visible = true
	Tab1Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Tab2Btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

-- Função Fechar
CloseBtn.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Minimizar vira bolinha
local minimized = false
local CircleBtn = Instance.new("TextButton")
CircleBtn.Size = UDim2.new(0, 60, 0, 60)
CircleBtn.Position = UDim2.new(1, -80, 1, -80)
CircleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CircleBtn.Text = "☰"
CircleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CircleBtn.TextSize = 28
CircleBtn.Font = Enum.Font.GothamBold
CircleBtn.Visible = false
CircleBtn.Active = true
CircleBtn.Draggable = true
local circleCorner = Instance.new("UICorner", CircleBtn)
circleCorner.CornerRadius = UDim.new(1, 0)
CircleBtn.Parent = ScreenGui

MinimizeBtn.MouseButton1Click:Connect(function()
	if not minimized then
		MainFrame.Visible = false
		CircleBtn.Visible = true
		minimized = true
	else
		MainFrame.Visible = true
		CircleBtn.Visible = false
		minimized = false
	end
end)

CircleBtn.MouseButton1Click:Connect(function()
	MainFrame.Visible = true
	CircleBtn.Visible = false
	minimized = false
end)