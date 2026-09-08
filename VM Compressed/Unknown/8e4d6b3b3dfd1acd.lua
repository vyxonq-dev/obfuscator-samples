local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local MinimizeButton = Instance.new("TextButton")

-- Configuração do ScreenGui
ScreenGui.Name = "CustomGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Configuração do Frame
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.1, 0, 0.1, 0)
Frame.Size = UDim2.new(0.85, 0, 0.8, 0)
Frame.BackgroundTransparency = 0.5
Frame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Frame

-- Torna o Frame movível
Frame.Active = true
Frame.Draggable = true

-- Configuração do ScrollingFrame
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Parent = Frame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.ScrollBarThickness = 10

-- Configuração do botão de minimizar
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Parent = ScreenGui
MinimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
MinimizeButton.Size = UDim2.new(0.05, 0, 0.05, 0)
MinimizeButton.Position = UDim2.new(0.1, 0, 0.05, 0)
MinimizeButton.Text = "-"

local UICornerMinimize = Instance.new("UICorner")
UICornerMinimize.CornerRadius = UDim.new(0, 10)
UICornerMinimize.Parent = MinimizeButton

local minimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    if minimized then
        Frame.Size = UDim2.new(0.85, 0, 0.8, 0)
        minimized = false
    else
        Frame.Size = UDim2.new(0.04, 0, 0.04, 0)
        minimized = true
    end
end)

-- Configuração do layout dos botões
UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Função para criar botões
local function createButton(text, code)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.88, 0, 0.07, 0)  -- Diminui mais a altura dos botões
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = text
    button.Parent = ScrollingFrame

    local UICornerButton = Instance.new("UICorner")
    UICornerButton.CornerRadius = UDim.new(0, 10)
    UICornerButton.Parent = button

    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(code))()
    end)
end

-- Lista de botões com os textos e códigos fornecidos
local buttons = {
    {text = "Piggy", code = "https://rawscripts.net/raw/Piggy-Base3-Pig-15570"},
    {text = "Piggy 2", code = "https://rawscripts.net/raw/Piggy-open-source-15390"},
    {text = "Piggy 3", code = "https://rawscripts.net/raw/Piggy-Beta-testerhub-15571"},
    {text = "mvsd", code = "https://pastebin.com/raw/vjTWQ8wW"},
    {text = "Prison life", code = "https://rawscripts.net/raw/Prison-Life-Tiger-Admin-by-Thestrongestman0080-13897"},
    {text = "mm2", code = "https://rawscripts.net/raw/Universal-Script-YARHM-12403"},
    {text = "Survive and kill The killers in area 51", code = "https://rawscripts.net/raw/Survive-and-Kill-the-Killers-in-Area-51-!!!-darkrai-x-11001"},
    {text = "Unnamed Shooter", code = "https://rawscripts.net/raw/Unnamed-Shooter-Only-headshot-15191"},
    {text = "Tower of Hell", code = "https://rawscripts.net/raw/Tower-of-Hell-Anticheat-Disabler-3465"},
    {text = "Tower of Hell 2", code = "https://rawscripts.net/raw/Tower-of-Hell-Hax-5597"},
    {text = "Infinite Yield", code = "https://rawscripts.net/raw/Infinite-Yield_500"},
    {text = "Chat bypass", code = "https://rawscripts.net/raw/Universal-Script-Chat-Bypass-16160"},
    {text = "npc Control", code = "https://rawscripts.net/raw/Universal-Script-npc-control-14129"},
    {text = "Kat", code = "https://raw.githubusercontent.com/JNHHGaming/Kat12/main/Kat"},
    {text = "fnf Basically", code = "https://rawscripts.net/raw/Universal-Script-basically-FNF-Remix-op-autoplayer-Script-8840"}
}

-- Criação dos botões com os códigos fornecidos
for _, button in ipairs(buttons) do
    createButton(button.text, button.code)
end

-- Ajuste do CanvasSize do ScrollingFrame com base na quantidade de botões
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #buttons * 50 + (#buttons - 1) * 5)