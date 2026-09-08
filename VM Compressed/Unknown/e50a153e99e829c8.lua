-- ============================================
-- SCRIPT: ODP_CADEIRA V1.2
-- JOGO: DUELOS! PASSE A BOMBA
-- AUTOR: ODPCADEIRA
-- INTERFACE: RAYFIELD
-- ============================================

-- ========== CARREGAR RAYFIELD ==========
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ========== MENSAGEM INICIAL ==========
local function MostrarMensagem()
    local gui = Instance.new("ScreenGui")
    gui.Name = "FeitoPor"
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    gui.ResetOnSpawn = false
    
    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Size = UDim2.new(0, 400, 0, 100)
    frame.Position = UDim2.new(0.5, -200, 0.5, -50)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = 0.6
    frame.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = "â¨ ODP_CADEIRA V1.2 â¨\nFEITO POR ODPCADEIRA"
    label.TextColor3 = Color3.fromRGB(255, 215, 0)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.TextStrokeColor3 = Color3.fromRGB(180, 150, 0)
    label.TextStrokeTransparency = 0.3
    
    wait(3)
    gui:Destroy()
end

MostrarMensagem()
wait(0.5)

-- ========== VARIÃVEIS GLOBAIS ==========
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local lp = Players.LocalPlayer

print("=== ODP_CADEIRA V1.2 CARREGADO ===")
print("â HITBOX SEM COLISÃO")

-- ========== TRADUÃÃES ==========
local traducoes = {
    Portugues = {
        Nome = "PortuguÃªs",
        ComBomba = "ð£ BOMBA!",
        SemBomba = "SEM BOMBA",
        Notificacao = "â ï¸ VOCÃ ESTÃ EM PERIGO!",
        Status = "STATUS",
        Ativo = "ATIVO",
        Inativo = "INATIVO",
        Jogador = "JOGADOR",
        Timer = "TIMER",
        NaoDetectado = "NÃO DETECTADO",
        ComBombaStatus = "COM BOMBA",
        SemBombaStatus = "SEM BOMBA",
    },
    Espanhol = {
        Nome = "EspaÃ±ol",
        ComBomba = "ð£ Â¡BOMBA!",
        SemBomba = "SIN BOMBA",
        Notificacao = "â ï¸ Â¡ESTÃS EN PELIGRO!",
        Status = "ESTADO",
        Ativo = "ACTIVO",
        Inativo = "INACTIVO",
        Jogador = "JUGADOR",
        Timer = "TEMPORIZADOR",
        NaoDetectado = "NO DETECTADO",
        ComBombaStatus = "CON BOMBA",
        SemBombaStatus = "SIN BOMBA",
    },
    Ingles = {
        Nome = "English",
        ComBomba = "ð£ BOMB!",
        SemBomba = "NO BOMB",
        Notificacao = "â ï¸ YOU ARE IN DANGER!",
        Status = "STATUS",
        Ativo = "ACTIVE",
        Inativo = "INACTIVE",
        Jogador = "PLAYER",
        Timer = "TIMER",
        NaoDetectado = "NOT DETECTED",
        ComBombaStatus = "WITH BOMB",
        SemBombaStatus = "WITHOUT BOMB",
    }
}

-- ========== CONFIG ==========
local config = {
    Hitbox = false,
    Mensagens = false,
    Teleporte = false,
    HitboxSize = 5,
    Linguagem = "PortuguÃªs",
    TextoComBomba = "ð£ BOMBA!",
    TextoSemBomba = "SEM BOMBA",
}

-- ========== VARIÃVEIS ==========
local mensagens = {}
local ultEstado = {}
local posOriginal = nil
local teleportando = false
local tamanhosOrig = {}
local notifGui = nil
local notifLabel = nil
local bombaAtiva = false
local textosAtualizados = false

-- ========== FUNÃÃO: TRADUZIR ==========
function Traduzir(chave)
    local lang = traducoes[config.Linguagem] or traducoes.Portugues
    return lang[chave] or chave
end

-- ========== FUNÃÃO: REMOVER TODAS AS MENSAGENS ==========
function RemoverTodasMensagens()
    for plr, obj in pairs(mensagens) do
        pcall(function() obj:Destroy() end)
    end
    mensagens = {}
    ultEstado = {}
end

-- ========== FUNÃÃO: REMOVER HITBOX ==========
function RemoverHitbox()
    for plr, dados in pairs(tamanhosOrig) do
        local c = plr.Character
        if c then
            for nome, tam in pairs(dados) do
                local parte = c:FindFirstChild(nome)
                if parte then
                    pcall(function()
                        parte.Size = tam
                        parte.CanCollide = true
                        parte.Transparency = 0
                        parte.Color = Color3.new(1, 1, 1)
                    end)
                end
            end
        end
    end
    tamanhosOrig = {}
end

-- ========== FUNÃÃO: BOMBA ==========
function TemBomba(jogador)
    local c = jogador.Character
    if not c then return false end
    
    for _, child in ipairs(c:GetChildren()) do
        if child.Name == "Bomber" or child.Name == "Bomb Box" then
            return true
        end
        local nome = string.lower(child.Name or "")
        if string.find(nome, "bomb") or string.find(nome, "explos") then
            return true
        end
    end
    
    for _, desc in ipairs(c:GetDescendants()) do
        if desc.Name == "Bomber" or desc.Name == "Bomb Box" then
            return true
        end
        local nome = string.lower(desc.Name or "")
        if string.find(nome, "bomb") or string.find(nome, "explos") then
            return true
        end
    end
    
    for _, item in ipairs(c:GetChildren()) do
        if item:IsA("Tool") then
            local nome = string.lower(item.Name)
            if string.find(nome, "bomb") or string.find(nome, "explos") then
                return true
            end
        end
    end
    
    return false
end

-- ========== FUNÃÃO: TIMER ==========
function PegarTimer()
    local gui = lp:FindFirstChild("PlayerGui")
    if not gui then return nil end
    for _, obj in ipairs(gui:GetDescendants()) do
        if obj:IsA("TextLabel") then
            local num = tonumber(string.match(obj.Text or "", "([%d.]+)"))
            if num and num > 0 and num <= 15 then
                return num
            end
        end
    end
    return nil
end

-- ========== NOTIFICAÃÃO ==========
function MostrarNotificacao()
    if notifGui then
        pcall(function() notifGui:Destroy() end)
        notifGui = nil
        notifLabel = nil
    end
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "NotifBomba"
    gui.Parent = lp.PlayerGui
    gui.ResetOnSpawn = false
    
    local frame = Instance.new("Frame")
    frame.Parent = gui
    frame.Size = UDim2.new(0, 200, 0, 34)
    frame.Position = UDim2.new(0.02, 0, 0.05, 0)
    frame.BackgroundColor3 = Color3.new(1, 0, 0)
    frame.BackgroundTransparency = 0.05
    frame.BorderSizePixel = 0
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = Traduzir("Notificacao")
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    
    notifGui = gui
    notifLabel = label
end

function RemoverNotificacao()
    bombaAtiva = false
    if notifGui then
        pcall(function() notifGui:Destroy() end)
        notifGui = nil
        notifLabel = nil
    end
end

-- ========== FUNÃÃO: VIVO ==========
function Vivo(jogador)
    local c = jogador.Character
    if not c then return false end
    local hum = c:FindFirstChild("Humanoid")
    if not hum then return false end
    return hum.Health > 0
end

function NaPartida()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp then
            local c = plr.Character
            if c and c:FindFirstChild("HumanoidRootPart") and Vivo(plr) then
                return true
            end
        end
    end
    return false
end

-- ========== INIMIGO MAIS PRÃXIMO ==========
function InimigoProximo()
    local char = lp.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    
    local pos = char.HumanoidRootPart.Position
    local alvo = nil
    local distMin = 9999
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and Vivo(plr) and NaPartida(plr) then
            local c = plr.Character
            if c and c:FindFirstChild("HumanoidRootPart") then
                local dist = (pos - c.HumanoidRootPart.Position).Magnitude
                if dist < distMin then
                    distMin = dist
                    alvo = c
                end
            end
        end
    end
    return alvo
end

-- ========== TELEPORTE ==========
function Teleportar()
    if teleportando or not config.Teleporte then return end
    
    local char = lp.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    if not TemBomba(lp) then return end
    
    local timer = PegarTimer()
    if not timer or timer >= 3 then return end
    
    local inimigo = InimigoProximo()
    if not inimigo then return end
    
    teleportando = true
    posOriginal = char.HumanoidRootPart.Position
    char.HumanoidRootPart.CFrame = CFrame.new(inimigo.HumanoidRootPart.Position + Vector3.new(0, 0, 2))
    
    wait(0.1)
    
    local toque = Instance.new("Part")
    toque.Size = Vector3.new(5, 5, 5)
    toque.CFrame = inimigo.HumanoidRootPart.CFrame
    toque.Anchored = true
    toque.CanCollide = true
    toque.Transparency = 1
    toque.Parent = Workspace
    
    for _, parte in ipairs({inimigo:FindFirstChild("HumanoidRootPart"), inimigo:FindFirstChild("Torso"), inimigo:FindFirstChild("UpperTorso")}) do
        if parte then pcall(function() parte.Touched:Fire(toque) end) end
    end
    
    wait(0.05)
    toque:Destroy()
    
    if posOriginal then
        wait(0.1)
        char.HumanoidRootPart.CFrame = CFrame.new(posOriginal)
        posOriginal = nil
    end
    
    teleportando = false
end

-- ========== HITBOX (SEM COLISÃO) ==========
function AtivarHitbox()
    if not config.Hitbox then
        RemoverHitbox()
        return
    end
    
    if not NaPartida() then return end
    local size = config.HitboxSize or 5
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp then
            local c = plr.Character
            if c and Vivo(plr) then
                if not tamanhosOrig[plr] then tamanhosOrig[plr] = {} end
                
                for _, nome in ipairs({"HumanoidRootPart","Torso","UpperTorso","LowerTorso","LeftArm","RightArm","LeftLeg","RightLeg"}) do
                    local parte = c:FindFirstChild(nome)
                    if parte and (parte:IsA("Part") or parte:IsA("MeshPart")) then
                        if not tamanhosOrig[plr][nome] then
                            tamanhosOrig[plr][nome] = parte.Size
                        end
                        pcall(function()
                            parte.Size = Vector3.new(size, size, size)
                            parte.CanCollide = false  -- SEM COLISÃO
                            parte.Transparency = 0.7
                            parte.Color = Color3.new(0.3, 0.3, 0.3)
                        end)
                    end
                end
            end
        end
    end
end

-- ========== MENSAGENS ==========
function AtivarMensagens()
    if not config.Mensagens then
        RemoverTodasMensagens()
        return
    end
    
    if not NaPartida() then return end
    local char = lp.Character
    if not char then return end
    
    local w, h = 45, 16
    
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("BillboardGui") and child.Name == "SelfMsg" then
            child:Destroy()
        end
    end
    
    if TemBomba(lp) then
        local cabeca = char:FindFirstChild("Head")
        if cabeca then
            local bg = Instance.new("BillboardGui")
            bg.Name = "SelfMsg"
            bg.Parent = char
            bg.Size = UDim2.new(0, w, 0, h)
            bg.StudsOffset = Vector3.new(0, 4.5, 0)
            bg.AlwaysOnTop = true
            bg.Adornee = cabeca
            
            local label = Instance.new("TextLabel")
            label.Parent = bg
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundColor3 = Color3.new(1, 0, 0)
            label.BackgroundTransparency = 0.15
            label.Text = config.TextoComBomba
            label.TextColor3 = Color3.new(1, 1, 0)
            label.TextScaled = true
            label.Font = Enum.Font.GothamBold
            label.BorderSizePixel = 0
        end
    end
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp then
            local c = plr.Character
            if not c or not Vivo(plr) then
                if mensagens[plr] then
                    pcall(function() mensagens[plr]:Destroy() end)
                    mensagens[plr] = nil
                    ultEstado[plr] = nil
                end
            else
                local temBomba = TemBomba(plr)
                local cabeca = c:FindFirstChild("Head")
                
                if ultEstado[plr] ~= temBomba then
                    ultEstado[plr] = temBomba
                    if mensagens[plr] then
                        pcall(function() mensagens[plr]:Destroy() end)
                        mensagens[plr] = nil
                    end
                end
                
                if cabeca then
                    if mensagens[plr] then
                        local label = mensagens[plr]:FindFirstChild("TextLabel")
                        if label then
                            if temBomba then
                                label.Text = config.TextoComBomba
                                label.BackgroundColor3 = Color3.new(1, 0, 0)
                                label.TextColor3 = Color3.new(1, 1, 0)
                            else
                                label.Text = config.TextoSemBomba
                                label.BackgroundColor3 = Color3.new(0, 0.3, 0.8)
                                label.TextColor3 = Color3.new(1, 1, 1)
                            end
                        end
                    else
                        local bg = Instance.new("BillboardGui")
                        bg.Parent = c
                        bg.Size = UDim2.new(0, w, 0, h)
                        bg.StudsOffset = Vector3.new(0, 3.5, 0)
                        bg.AlwaysOnTop = true
                        bg.Adornee = cabeca
                        
                        local label = Instance.new("TextLabel")
                        label.Parent = bg
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 0.15
                        label.TextScaled = true
                        label.Font = Enum.Font.GothamBold
                        label.BorderSizePixel = 0
                        
                        if temBomba then
                            label.Text = config.TextoComBomba
                            label.BackgroundColor3 = Color3.new(1, 0, 0)
                            label.TextColor3 = Color3.new(1, 1, 0)
                        else
                            label.Text = config.TextoSemBomba
                            label.BackgroundColor3 = Color3.new(0, 0.3, 0.8)
                            label.TextColor3 = Color3.new(1, 1, 1)
                        end
                        
                        mensagens[plr] = bg
                    end
                end
            end
        end
    end
end

-- ========== LOOP ==========
spawn(function()
    while wait(0.15) do
        pcall(function()
            if not lp.Character then return end
            
            local temBomba = TemBomba(lp)
            if temBomba and not bombaAtiva then
                bombaAtiva = true
                MostrarNotificacao()
                print("ð£ " .. Traduzir("Notificacao"))
            elseif not temBomba and bombaAtiva then
                bombaAtiva = false
                RemoverNotificacao()
                print("ð¢ BOMBA REMOVIDA!")
            end
            
            if config.Hitbox then AtivarHitbox() end
            if config.Mensagens then AtivarMensagens() end
            if config.Teleporte then Teleportar() end
        end)
    end
end)

lp.CharacterAdded:Connect(function()
    wait(0.5)
    RemoverTodasMensagens()
    posOriginal = nil
    teleportando = false
    RemoverNotificacao()
    RemoverHitbox()
end)

-- ============================================
-- ========== INTERFACE RAYFIELD ==========
-- ============================================

local Window = Rayfield:CreateWindow({
    Name = "ðª ODP_CADEIRA V1.2",
    LoadingTitle = "Carregando ODP_CADEIRA...",
    LoadingSubtitle = "by ODPCADEIRA",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "ODPCADEIRA", 
       FileName = "Settings"
    },
    Discord = {
       Enabled = false
    },
    KeySystem = false,
    RayfieldVersion = "1.0"
})

-- ========== ABA: PRINCIPAL ==========
local MainTab = Window:CreateTab("âï¸ Principal", 4483362458)

-- ========== SEÃÃO: HITBOX ==========
MainTab:CreateSection("ð HITBOX")

MainTab:CreateToggle({
    Name = "Ativar Hitbox",
    CurrentValue = false,
    Flag = "HitboxToggle",
    Callback = function(Value)
        config.Hitbox = Value
        print("â Hitbox: " .. (Value and "ON" or "OFF"))
        if not Value then
            RemoverHitbox()
        end
    end,
})

MainTab:CreateSlider({
    Name = "Tamanho da Hitbox",
    Range = {3, 25},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 5,
    Flag = "HitboxSize",
    Callback = function(Value)
        config.HitboxSize = Value
        print("ð Hitbox Size: " .. Value)
    end,
})

MainTab:CreateParagraph({
    Title = "â¹ï¸ InformaÃ§Ãµes",
    Content = "â¢ Expande o corpo dos inimigos\nâ¢ SEM COLISÃO\nâ¢ Tamanho ajustÃ¡vel de 3 a 25"
})

-- ========== SEÃÃO: MENSAGENS ==========
MainTab:CreateSection("ð¬ MENSAGENS")

MainTab:CreateToggle({
    Name = "Ativar Mensagens",
    CurrentValue = false,
    Flag = "MsgToggle",
    Callback = function(Value)
        config.Mensagens = Value
        print("â Mensagens: " .. (Value and "ON" or "OFF"))
        if not Value then
            RemoverTodasMensagens()
        end
    end,
})

-- ========== SEÃÃO: PERSONALIZAR TEXTOS ==========
MainTab:CreateSection("âï¸ PERSONALIZAR TEXTOS")

MainTab:CreateInput({
    Name = "Texto 'COM BOMBA'",
    PlaceholderText = "Digite o texto...",
    RemoveTextAfterFocusLost = false,
    Flag = "TextoComBomba",
    Callback = function(Value)
        if Value ~= "" then
            config.TextoComBomba = Value
            textosAtualizados = true
            print("â Texto COM BOMBA alterado para: " .. Value)
            if config.Mensagens then
                RemoverTodasMensagens()
            end
        end
    end,
})

MainTab:CreateInput({
    Name = "Texto 'SEM BOMBA'",
    PlaceholderText = "Digite o texto...",
    RemoveTextAfterFocusLost = false,
    Flag = "TextoSemBomba",
    Callback = function(Value)
        if Value ~= "" then
            config.TextoSemBomba = Value
            textosAtualizados = true
            print("â Texto SEM BOMBA alterado para: " .. Value)
            if config.Mensagens then
                RemoverTodasMensagens()
            end
        end
    end,
})

-- ========== SEÃÃO: TELEPORTE ==========
MainTab:CreateSection("ð TELEPORTE [BETA]")

MainTab:CreateToggle({
    Name = "Ativar Teleporte (BETA)",
    CurrentValue = false,
    Flag = "TeleporteToggle",
    Callback = function(Value)
        config.Teleporte = Value
        print("â Teleporte: " .. (Value and "ON" or "OFF"))
        if Value then
            print("â ï¸ TELEPORTE EM FASE BETA - Use com cautela!")
        end
    end,
})

MainTab:CreateParagraph({
    Title = "â ï¸ AVISO",
    Content = "TELEPORTE ESTÃ EM FASE BETA\nPode apresentar instabilidades\nUse por sua conta e risco"
})

-- ========== ABA: IDIOMA ==========
local LangTab = Window:CreateTab("ð Idioma", 4483362458)

LangTab:CreateSection("ð SELECIONE O IDIOMA")

LangTab:CreateDropdown({
    Name = "Idioma",
    Options = {"PortuguÃªs", "EspaÃ±ol", "English"},
    CurrentOption = "PortuguÃªs",
    Flag = "LanguageDropdown",
    Callback = function(Value)
        config.Linguagem = Value
        print("â Idioma alterado para: " .. Value)
        if not textosAtualizados then
            config.TextoComBomba = Traduzir("ComBomba")
            config.TextoSemBomba = Traduzir("SemBomba")
            print("ð Textos atualizados")
            if config.Mensagens then
                RemoverTodasMensagens()
            end
        else
            print("ð Textos personalizados mantidos")
        end
    end,
})

-- ========== ABA: STATUS ==========
local StatusTab = Window:CreateTab("ð Status", 4483362458)

StatusTab:CreateParagraph({
    Title = "ð STATUS ATUAL",
    Content = "Aguardando atualizaÃ§Ã£o..."
})

-- ========== ATUALIZAR STATUS ==========
spawn(function()
    while wait(1) do
        pcall(function()
            local timer = PegarTimer()
            local temBomba = TemBomba(lp)
            
            local statusText = "ð " .. Traduzir("Jogador") .. ": " .. lp.Name .. "\n"
            statusText = statusText .. "ð£ " .. Traduzir("ComBombaStatus") .. ": " .. (temBomba and "â " .. Traduzir("Ativo") or "â " .. Traduzir("Inativo")) .. "\n"
            statusText = statusText .. "â±ï¸ " .. Traduzir("Timer") .. ": " .. (timer and timer .. "s" or Traduzir("NaoDetectado")) .. "\n"
            statusText = statusText .. "ð Hitbox: " .. (config.Hitbox and "â " .. Traduzir("Ativo") or "â " .. Traduzir("Inativo")) .. "\n"
            statusText = statusText .. "ð¬ Mensagens: " .. (config.Mensagens and "â " .. Traduzir("Ativo") or "â " .. Traduzir("Inativo")) .. "\n"
            statusText = statusText .. "ð Teleporte (BETA): " .. (config.Teleporte and "â " .. Traduzir("Ativo") or "â " .. Traduzir("Inativo"))
            
            StatusTab:Clear()
            StatusTab:CreateParagraph({
                Title = "ð STATUS ATUAL",
                Content = statusText
            })
        end)
    end
end)

-- ========== ABA: CRÃDITOS ==========
local CreditTab = Window:CreateTab("ð CrÃ©ditos", 4483362458)

CreditTab:CreateParagraph({
    Title = "â¨ ODP_CADEIRA V1.2 â¨",
    Content = "Script para DUELOS! PASSE A BOMBA\n\nð Funcionalidades:\nâ¢ Hitbox Expandida (Tamanho 3 a 25)\nâ¢ Mensagens em cima dos jogadores\nâ¢ Teleporte Inteligente (timer < 3s)\nâ¢ NotificaÃ§Ã£o de Bomba\n\nð± REDES SOCIAIS:\nâ¢ YouTube: NÃO ESTÃ NO AR\nâ¢ Discord: NÃO ESTÃ NO AR\nâ¢ Roblox: ODPCADEIRA\n\nð§ VersÃ£o: 1.2\nð Atualizado: 2024"
})

print("========================================")
print("â ODP_CADEIRA V1.2 PRONTO!")
print("ð FunÃ§Ãµes: Hitbox (sem colisÃ£o) | Mensagens | Teleporte")
print("========================================")