-- Script Hub do RayField - "Rooms Hub OP 🇧🇷"
-- Sistema de Key adicionado por TaylorChosis

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local keyCorreta = "2025ROOMS"
local keyInserida = ""

local function copiarParaAreaDeTransferencia(texto)
    setclipboard(texto)
end

local janelaKey = Rayfield:CreateWindow({
    Name = "Rooms Hub OP - Key System",
    LoadingTitle = "Rooms Hub OP",
    LoadingSubtitle = "by TaylorChosis",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local keyPage = janelaKey:CreateTab("🔑 Key", 4483362458)

local keyInput = keyPage:CreateInput({
    Name = "Insira sua Key",
    PlaceholderText = "Digite a Key aqui...",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        keyInserida = text
    end
})

keyPage:CreateButton({
    Name = "Get Key",
    Callback = function()
        copiarParaAreaDeTransferencia("https://discord.gg/wKTTCUJnwr")
        Rayfield:Notify({
            Title = "Link copiado!",
            Content = "O link do Discord foi copiado para sua área de transferência.",
            Duration = 4
        })
    end
})

keyPage:CreateButton({
    Name = "Verificar Key",
    Callback = function()
        if keyInserida == keyCorreta then
            Rayfield:Notify({
                Title = "Key Correta!",
                Content = "Bem-vindo ao Script Hub!",
                Duration = 3
            })
            wait(1)
            janelaKey:Destroy()
            -- Aqui você pode colocar o código para abrir o Script Hub principal
        else
            Rayfield:Notify({
                Title = "Key Incorreta!",
                Content = "A Key inserida está errada. Clique em 'Get Key' para obter a correta.",
                Duration = 4
            })
        end
    end
})
-- By TaylorChosis

-- Carregar Rayfield UI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Variáveis do ESP
local ESP_1_Enabled = false
local ESP_2_Enabled = false
local ESP1_Billboard, ESP2_Billboard = nil, nil
local monster = workspace:FindFirstChild("monster")
local monster2 = workspace:FindFirstChild("monster2")

local function createESP(part, text)
    if not part then return nil end
    local bb = Instance.new("BillboardGui")
    bb.Name = "ESP_BB"
    bb.Adornee = part
    bb.Size = UDim2.new(0, 100, 0, 40)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true

    local label = Instance.new("TextLabel", bb)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 0, 0)
    label.TextStrokeTransparency = 0.5
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = text

    bb.Parent = part
    return bb, label
end

local function updateDistance(label, part, prefix)
    if not label or not part then return end
    local plr = game.Players.LocalPlayer
    local char = plr.Character or plr.CharacterAdded:Wait()
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        local dist = (hrp.Position - part.Position).Magnitude
        label.Text = prefix .. " | " .. math.floor(dist) .. "m"
    end
end

-- Atualização de distância
game:GetService("RunService").RenderStepped:Connect(function()
    if ESP_1_Enabled and ESP1_Billboard and monster then
        updateDistance(ESP1_Billboard.TextLabel, monster, "A-60")
    end
    if ESP_2_Enabled and ESP2_Billboard and monster2 then
        updateDistance(ESP2_Billboard.TextLabel, monster2, "A-120")
    end
end)

-- Função para remover ESP
local function removeESP(bb)
    if bb and bb.Parent then
        bb:Destroy()
    end
end

-- Luz dos Olhos de SEROPHONE + Brilho vermelho no personagem + Visão vermelha no escuro
local luzAtiva = false
local luzObj = nil
local highlightObj = nil
local efeitoVisao = nil
local visaoAtivada = false

local function ativarVisaoVermelha()
    -- Adiciona efeito de visão vermelha e remove a escuridão
    if not efeitoVisao then
        efeitoVisao = Instance.new("ColorCorrectionEffect")
        efeitoVisao.Name = "SerophoneVision"
        efeitoVisao.TintColor = Color3.new(1, 0, 0)
        efeitoVisao.Brightness = 0.2
        efeitoVisao.Contrast = 0.2
        efeitoVisao.Saturation = 0.2
        efeitoVisao.Parent = game.Lighting
    end
    -- Remove a escuridão
    game.Lighting.Brightness = 3
    game.Lighting.Ambient = Color3.new(1, 0, 0)
    game.Lighting.OutdoorAmbient = Color3.new(1, 0, 0)
end

local function desativarVisaoVermelha()
    if efeitoVisao then
        efeitoVisao:Destroy()
        efeitoVisao = nil
    end
    -- Restaura valores padrões (ajuste conforme necessário)
    game.Lighting.Brightness = 1
    game.Lighting.Ambient = Color3.new(0, 0, 0)
    game.Lighting.OutdoorAmbient = Color3.new(0, 0, 0)
end

local function alternarLuz()
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if not luzAtiva then
        -- Luz vermelha
        luzObj = Instance.new("PointLight", hrp)
        luzObj.Color = Color3.new(1, 0, 0)
        luzObj.Brightness = 5
        luzObj.Range = 20

        -- Brilho vermelho no personagem
        highlightObj = Instance.new("Highlight")
        highlightObj.Name = "SerophoneRedGlow"
        highlightObj.FillColor = Color3.new(1, 0, 0)
        highlightObj.OutlineColor = Color3.new(1, 0, 0)
        highlightObj.FillTransparency = 0.3
        highlightObj.OutlineTransparency = 0.1
        highlightObj.Parent = char
        highlightObj.Adornee = char

        -- Visão vermelha no escuro
        ativarVisaoVermelha()
        visaoAtivada = true

        luzAtiva = true
    else
        if luzObj then luzObj:Destroy() luzObj = nil end
        if highlightObj then highlightObj:Destroy() highlightObj = nil end
        if visaoAtivada then
            desativarVisaoVermelha()
            visaoAtivada = false
        end
        luzAtiva = false
    end
end

-- UI Principal
local Window = Rayfield:CreateWindow({
    Name = "Rooms Hub OP 🇧🇷",
    LoadingTitle = "Rooms Hub OP 🇧🇷",
    LoadingSubtitle = "By TaylorChosis",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

-- Criação das abas ESP e Player
local ESPTab = Window:CreateTab("ESP", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)

-- Opções do ESP na aba ESP
ESPTab:CreateToggle({
    Name = "ESP monster",
    CurrentValue = false,
    Callback = function(Value)
        ESP_1_Enabled = Value
        if Value then
            ESP1_Billboard, _ = createESP(monster, "A-60")
        else
            removeESP(ESP1_Billboard)
            ESP1_Billboard = nil
        end
    end
})

ESPTab:CreateToggle({
    Name = "ESP monster2",
    CurrentValue = false,
    Callback = function(Value)
        ESP_2_Enabled = Value
        if Value then
            ESP2_Billboard, _ = createESP(monster2, "A-120")
        else
            removeESP(ESP2_Billboard)
            ESP2_Billboard = nil
        end
    end
})

-- Opção de Speed na aba Player
local speedValue = 16
PlayerTab:CreateSlider({
    Name = "Speed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Velocidade",
    CurrentValue = 16,
    Callback = function(Value)
        speedValue = Value
        local plr = game.Players.LocalPlayer
        local char = plr.Character or plr.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = speedValue
        end
    end
})

-- Garante que ao spawnar o personagem, a velocidade seja mantida
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
    local humanoid = char:WaitForChild("Humanoid")
    humanoid.WalkSpeed = speedValue
end)

-- Opção 3: Olhos de SEROPHONE (agora ativa visão vermelha e remove escuridão)
local olhosSection = PlayerTab:CreateSection("Olhos de SEROPHONE")
local infoLabel = nil
local olhosBtn = nil
local olhosAtivado = false

-- Cria apenas uma vez a interface de instrução
local function mostrarInstrucoesOlhos()
    if infoLabel then return end
    infoLabel = PlayerTab:CreateParagraph({
        Title = "Olhos de SEROPHONE",
        Content = "Você tem poder de ligar luz pelos olhos\nAperte 'F' pra ligar ou desligar\nOu se estiver no celular clique direto no botão de 'F'\nSua visão ficará vermelha e você verá tudo no escuro!"
    })

    -- Botão para mobile
    local UserInputService = game:GetService("UserInputService")
    if UserInputService.TouchEnabled then
        PlayerTab:CreateButton({
            Name = "F",
            Callback = function()
                alternarLuz()
            end
        })
    end

    -- Tecla F para PC (apenas conecta uma vez)
    if not _G.OlhosSerophoneFKeyConnected then
        _G.OlhosSerophoneFKeyConnected = true
        game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
            if processed then return end
            if input.KeyCode == Enum.KeyCode.F then
                alternarLuz()
            end
        end)
    end
end

olhosBtn = PlayerTab:CreateButton({
    Name = "Olhos de SEROPHONE",
    Callback = function()
        olhosBtn:SetVisible(false)
        mostrarInstrucoesOlhos()
    end
})
