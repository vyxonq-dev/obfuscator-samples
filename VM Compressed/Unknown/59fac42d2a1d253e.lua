-- Carrega WindUI (versão main, sempre atualizada)
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- Cria a janela principal (ajuste Title, etc conforme quiser)
local Window = WindUI:CreateWindow({
    Title = "Ender Mine|Servidores Privados",
    Icon = "sparkles",              -- ícone da lib (sparkles, server, link, etc)
    Author = "By: Akira_yr",
    Folder = "ServidoresPrivados",  -- pra salvar configs se tiver
    Size = UDim2.fromOffset(580, 480),
    Theme = "Dark",
    Acrylic = false,                -- se quiser efeito glass ou não
    HidePanelBackground = false
})

-- Cria a aba específica
local Tab = Window:Tab({
    Title = "Servidores Privados",
    Icon = "server"  -- ou "link", "globe", "arrow-right"
})

-- Seção explicativa
local Section = Tab:Section({
    Title = "Servidores via Link Oficial",
    Opened = true
})

-- Adiciona uma descrição ou texto fixo (se Section suportar Text/Label, senão use Notify inicial)
Section:Section({  -- ou :Label se tiver, mas use Section pra texto
    Title = "Como usar:",
    TextSize = 14,
    TextTransparency = 0.4
})  -- se não tiver :Section aninhado, comente isso

-- Lista de servidores (adicione os seus links aqui!)
local servidores = {
    {
        nome = "Build a Boat For Treasure",
        link = "https://www.roblox.com/share?code=7d6aac7da57feb47bd0b30e3b85bcb2b&type=Server"
    },
    {
        nome = "Não Foi Definido",
        link = "https://www.roblox.com/share?code=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&type=Server"  -- troque
    },
    {
        nome = "Não Foi Definido",
        link = "https://www.roblox.com/share?code=abcdef1234567890abcdef1234567890&type=Server"
    }
    -- Adicione mais: {nome = "Nome", link = "https://..."}
}

-- Cria botão pra cada servidor
for _, srv in ipairs(servidores) do
    Section:Button({
        Title = srv.nome,
        Desc = "Clica pra copiar o link e abrir no navegador",
        Variant = "Primary",  -- Primary = azul principal, ou "Success" verde
        
        Callback = function()
            -- Copia o link (funciona na maioria: Synapse, Fluxus, Krnl, Delta, etc)
            local success_clip = pcall(function()
                if setclipboard then
                    setclipboard(srv.link)
                elseif toclipboard then
                    toclipboard(srv.link)
                elseif Clipboard and Clipboard.set then
                    Clipboard.set(srv.link)
                end
            end)
            
            -- Notificação principal
            WindUI:Notify({
                Title = success_clip and "Link Copiado!" or "Aviso",
                Content = success_clip 
                    and ("Link copiado! Cole (Ctrl + V) no Chrome/Edge ou qualquer navegador.\n\nO Roblox abre sozinho e te coloca no server privado.\n\nLink: " .. srv.link)
                    or "Não conseguiu copiar (executor antigo?). Copie manual: " .. srv.link,
                Duration = 12
            })
            
            -- Tenta request GET no link (em alguns exploits como Synapse/Fluxus isso aciona o handler do Roblox e abre direto!)
            pcall(function()
                local req = (syn and syn.request) or request or http_request or (fluxus and fluxus.request) or http
                if req then
                    req({
                        Url = srv.link,
                        Method = "GET"
                    })
                end
            end)
        end
    })
end

-- Botão extra de ajuda (opcional)
Section:Button({
    Title = "Dúvidas?",
    Desc = "Como abrir o link",
    Variant = "Outline",
    
    Callback = function()
        WindUI:Notify({
            Title = "Instruções Rápidas",
            Content = "1. Clica no servidor desejado\n2. O link é copiado automaticamente\n3. Abre o Chrome/Edge (ou qualquer browser)\n4. Cola (Ctrl + V) e dá Enter\n5. Roblox abre e entra no server privado!\n\nSe o request funcionar, pode abrir direto sem colar.",
            Duration = 10
        })
    end
})

print("[WindUI] Aba de Servidores Privados carregada com sucesso!")

Window:Tag({
    Title = "v2.5",
    Icon = "github",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 0, -- from 0 to 13
})