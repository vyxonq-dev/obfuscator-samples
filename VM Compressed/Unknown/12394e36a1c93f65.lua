-- Rode primeiro o script do seu amigo
loadstring(game:HttpGet("https://gist.githubusercontent.com/brunoaraujo989/100a9b8cf0369b8ee5c37d5cdda5c369/raw"))()

-- Aguarda alguns segundos para garantir que o hub carregou
wait(3)

-- Configurações
local DONO_USERID = 2026582080
local SUBDONO_USERID = 8721873818

local CONFIGS = {
    DONO = {
        texto = "👑 DONO",
        cor = Color3.new(1, 1, 0), -- Amarelo
        emotes = {3333499508, 3333387824, 3333331310}
    },
    SUBDONO = {
        texto = "👾 SUB DONO",
        cor = Color3.new(0, 0.5, 1), -- Azul
        emotes = {3333499508, 3333387824}
    }
}

-- Função para adicionar emotes
local function adicionarEmotes(humanoid, emotes)
    for _, emoteId in pairs(emotes) do
        pcall(function()
            humanoid:SetEmote("Emote"..emoteId, emoteId)
        end)
    end
end

-- Função para criar a tag
local function adicionarTag(personagem, tipo)
    local head = personagem:WaitForChild("Head", 5)
    if not head then return end
    
    if head:FindFirstChild(tipo.."Tag") then return end
    
    local config = CONFIGS[tipo]
    if not config then return end
    
    local tag = Instance.new("BillboardGui")
    tag.Name = tipo.."Tag"
    tag.Adornee = head
    tag.Size = UDim2.new(0, 100, 0, 25) -- Aumentei um pouco pro emoji
    tag.StudsOffset = Vector3.new(0, 2.5, 0)
    tag.AlwaysOnTop = true

    local texto = Instance.new("TextLabel", tag)
    texto.Size = UDim2.new(1, 0, 1, 0)
    texto.BackgroundTransparency = 1
    texto.Font = Enum.Font.GothamBold
    texto.TextScaled = true
    texto.TextStrokeTransparency = 0.5
    texto.Text = config.texto
    texto.TextColor3 = config.cor

    tag.Parent = head
    
    -- Adicionar emotes
    local humanoid = personagem:FindFirstChildOfClass("Humanoid")
    if humanoid and config.emotes then
        adicionarEmotes(humanoid, config.emotes)
    end
end

-- Função para determinar o tipo do player
local function obterTipoPlayer(userId)
    if userId == DONO_USERID then
        return "DONO"
    elseif userId == SUBDONO_USERID then
        return "SUBDONO"
    end
    return nil
end

-- Função para configurar um player
local function configurarPlayer(plr)
    local tipo = obterTipoPlayer(plr.UserId)
    if not tipo then return end
    
    if plr.Character then
        adicionarTag(plr.Character, tipo)
    end
    
    plr.CharacterAdded:Connect(function(char)
        adicionarTag(char, tipo)
    end)
end

-- Aplicar para players existentes
for _, plr in pairs(game.Players:GetPlayers()) do
    configurarPlayer(plr)
end

-- Aplicar para novos players
game.Players.PlayerAdded:Connect(configurarPlayer)