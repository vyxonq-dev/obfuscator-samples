local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Editor = Instance.new("ScrollingFrame")
local TextBox = Instance.new("TextBox")
local ScriptList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local ExecuteBtn = Instance.new("TextButton")
local ClearBtn = Instance.new("TextButton")

-- Configurações de Cores
local Cores = {
    Fundo = Color3.fromRGB(20, 20, 25),
    Topo = Color3.fromRGB(30, 30, 40),
    Borda = Color3.fromRGB(0, 170, 255), -- Azul Neon
    Editor = Color3.fromRGB(15, 15, 15),
    Texto = Color3.fromRGB(255, 255, 255),
    BotaoExecutar = Color3.fromRGB(0, 180, 100),
    BotaoLimpar = Color3.fromRGB(180, 50, 50),
    ScriptItem = Color3.fromRGB(35, 35, 45)
}

ScreenGui.Name = "ExecutorPro"
ScreenGui.Parent = game.CoreGui 
ScreenGui.ResetOnSpawn = false

-- Janela Principal
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Cores.Fundo
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Cores.Borda
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.Size = UDim2.new(0, 600, 0, 400) -- Aumentei o tamanho total
MainFrame.Active = true
MainFrame.Draggable = true

-- Título (Texto Maior)
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Cores.Topo
Title.BorderSizePixel = 0
Title.Text = "  PREMIUM EXECUTOR v2"
Title.TextColor3 = Cores.Borda
Title.TextSize = 20 -- Texto maior
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold

-- Editor de Texto (Números e Letras maiores)
Editor.Parent = MainFrame
Editor.Position = UDim2.new(0, 15, 0, 55)
Editor.Size = UDim2.new(0, 380, 0, 270)
Editor.BackgroundColor3 = Cores.Editor
Editor.BorderSizePixel = 1
Editor.BorderColor3 = Color3.fromRGB(50,50,50)
Editor.CanvasSize = UDim2.new(0, 0, 10, 0)

TextBox.Parent = Editor
TextBox.Size = UDim2.new(1, -10, 1, 0)
TextBox.Position = UDim2.new(0, 5, 0, 0)
TextBox.BackgroundColor3 = Cores.Editor
TextBox.MultiLine = true
TextBox.Text = "-- Insira seu script\n-- Selecione na lista lateral"
TextBox.TextColor3 = Color3.fromRGB(0, 255, 150) -- Verde terminal
TextBox.TextSize = 16 -- Letras maiores para leitura
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Code

-- Lista de Scripts Lateral
ScriptList.Parent = MainFrame
ScriptList.Position = UDim2.new(0, 410, 0, 55)
ScriptList.Size = UDim2.new(0, 175, 0, 270)
ScriptList.BackgroundColor3 = Cores.Editor
ScriptList.BorderSizePixel = 1
ScriptList.BorderColor3 = Color3.fromRGB(50,50,50)
ScriptList.CanvasSize = UDim2.new(0, 0, 25, 0) -- Mais espaço para a lista longa

UIListLayout.Parent = ScriptList
UIListLayout.Padding = UDim.new(0, 4)

-- Botões Inferiores (Maiores e Coloridos)
ExecuteBtn.Name = "Execute"
ExecuteBtn.Parent = MainFrame
ExecuteBtn.Position = UDim2.new(0, 15, 0, 340)
ExecuteBtn.Size = UDim2.new(0, 185, 0, 45)
ExecuteBtn.BackgroundColor3 = Cores.BotaoExecutar
ExecuteBtn.Text = "EXECUTE"
ExecuteBtn.TextColor3 = Cores.Texto
ExecuteBtn.TextSize = 18
ExecuteBtn.Font = Enum.Font.GothamBold

ClearBtn.Name = "Clear"
ClearBtn.Parent = MainFrame
ClearBtn.Position = UDim2.new(0, 210, 0, 340)
ClearBtn.Size = UDim2.new(0, 185, 0, 45)
ClearBtn.BackgroundColor3 = Cores.BotaoLimpar
ClearBtn.Text = "CLEAR"
ClearBtn.TextColor3 = Cores.Texto
ClearBtn.TextSize = 18
ClearBtn.Font = Enum.Font.GothamBold

--- TABELA DE SCRIPTS ---
local scripts = {
    {"Guts","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/GUTS"},
    {"Devoyance","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Devoyance"},
    {"All Seeing Hand","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/hand"},
    {"Omni God","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Omni%20God"},
    {"Sutart","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Sutart"},
    {"Star Glitcher","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Spectrum%20Glitcher"},
    {"Majora's Mask","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Mask"},
    {"Rainbow King","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Rainbow%20Banisher"},
    {"Determination","https://pastebin.com/raw/SMrFaqxL"},
    {"God Slayer","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/God%20Eater"},
    {"Grab Gun","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/grab"},
    {"Primadon","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Primadon"},
    {"Poly Goner","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Polygoner"},
    {"Xester V2","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/XESTER%20V2"},
    {"Blind Reaper","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/BLINDREAPER"},
    {"Black Figure","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Figure"},
    {"Goner","https://pastebin.com/raw/i0U0XQqK"},
    {"Mr ByeBye","https://pastefy.app/z0i6VxsQ/raw"},
    {"Soul Reaper","https://pastebin.com/raw/tcL2Ks37"},
    {"Mr Pixels","https://pastefy.app/kXtSd8D7/raw"},
    {"Sin Dragon","https://pastebin.com/raw/2cFsE7Bb"},
    {"Lost Hope Scythe","https://pastebin.com/raw/VH3PgimJ"},
    {"Server Admin","https://pastebin.com/raw/7ussdD59"},
    {"Chara","https://pastefy.app/tM9cF893/raw"},
    {"KillBot","https://pastebin.com/raw/yraarJ7m"},
    {"The Sun Is A Deadly Laser","https://pastebin.com/raw/y073ged5"},
    {"Internal War","https://pastebin.com/raw/u7DbahA4"},
    {"Sledge Hammer","https://pastefy.app/7GOfHGXD/raw"},
    {"R6","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/R6"},
    {"Comedic Chaos","https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Comedy"},
    {"Chrono Sentinel","https://raw.githubusercontent.com/Lock1213/Scripts/refs/heads/main/Chrono%20Sentinel%20(Converted%20With%20Music)"},
    {"Dual Ultima","https://pastebin.com/raw/3QsB07Ba"},
    {"StarLight","https://pastefy.app/WKp58j8l/raw"},
    {"Titan","https://pastebin.com/raw/Tf8zhZ4w"},
    {"Angel Of Darkness","https://pastebin.com/raw/cxskwTEQ"},
    {"Burning Hope","https://pastefy.app/lNQLDw9u/raw"},
    {"Nebula","https://pastebin.com/raw/CZZJqf0s"},
    {"Boss King Neflhelm","https://pastebin.com/raw/T6Z3rNHD"},
    {"Terra God","https://pastebin.com/raw/NQjuyNzc"},
    {"The Last God","https://pastebin.com/raw/TLWkKzPH"},
    {"Pharaoh","https://pastebin.com/raw/2GqVKSMX"},
    {"Shrike","https://pastebin.com/raw/L9s88W5u"},
    {"Demon Banisher","https://pastebin.com/raw/2dHmbWwa"},
    {"Guardian Of Light","https://pastebin.com/raw/EHEPg3nN"},
    {"Headless Banisher","https://pastebin.com/raw/1NV2BCYW"},
    {"Banisher Gun V.0","https://pastebin.com/raw/cp4gAZPq"},
    {"Chaos","https://pastebin.com/raw/wBTtDxQh"},
    {"Corrupted Doctor","https://pastebin.com/raw/ynd8KAaM"},
    {"Calmed Murderer","https://pastebin.com/raw/TTAQHL1T"},
    {"Black Red Neon Nelfhelm","https://pastebin.com/raw/CfsMDVYG"},
    {"Cryo","https://pastebin.com/raw/kq1GbtSK"},
    {"Ultima Red","https://pastebin.com/raw/njqct98T"},
    {"Placeholder","https://pastefy.app/CtVFoMMq/raw"},
    {"Road Rogue","https://pastefy.app/9gxSdisY/raw"},
    {"Shadow Ravanger Claws","https://pastebin.com/raw/ZXWAwmRB"},
    {"Ravanger Claws","https://pastebin.com/raw/2yiAdKL7"},
    {"Zenatic","https://pastebin.com/raw/8WiaahB7"},
    {"Exvator","https://pastefy.app/ug6v3dyk/raw"},
    {"Dead Eye Edit Black","https://pastebin.com/raw/Pu0qVEhM"}
}

-- Criar botões da lista com visual melhorado
for _, data in pairs(scripts) do
    local sBtn = Instance.new("TextButton")
    sBtn.Name = data[1]
    sBtn.Parent = ScriptList
    sBtn.Size = UDim2.new(1, -5, 0, 35) -- Botão um pouco maior
    sBtn.BackgroundColor3 = Cores.ScriptItem
    sBtn.BorderSizePixel = 0
    sBtn.Text = data[1]
    sBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    sBtn.TextSize = 14
    sBtn.Font = Enum.Font.SourceSans
    
    -- Efeito de clique simples
    sBtn.MouseButton1Click:Connect(function()
        TextBox.Text = 'loadstring(game:HttpGet("' .. data[2] .. '"))()'
    end)
end

-- Funcionalidade dos Botões
ExecuteBtn.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    local success, err = pcall(function()
        loadstring(code)()
    end)
    if not success then
        warn("Erro no Script: " .. err)
    end
end)

ClearBtn.MouseButton1Click:Connect(function()
    TextBox.Text = ""
end)
