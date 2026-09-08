-- SniperX Hub - v1.2
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

Fluent:Notify({
    Title = "ATUALIZAÇÃO!",
    Content = "SnîpęrX HūB Plus já em produção!"
})

local HttpService = game:GetService("HttpService")
local FavoritesFile = "SniperX_Favorites.json"

local function SaveFavorites(favorites)
    writefile(FavoritesFile, HttpService:JSONEncode(favorites))
end

local function LoadFavorites()
    if isfile(FavoritesFile) then
        return HttpService:JSONDecode(readfile(FavoritesFile))
    else
        return {}
    end
end

local Favorites = LoadFavorites()

local Window = Fluent:CreateWindow({
    Title = "SnîpęrX HūB Central v1.2",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "aqua",
    ToggleKey = Enum.KeyCode.RightShift
})

local Tabs = {
    Main = Window:AddTab({ Title = "Scripts", Icon = "code" }),
    Extras = Window:AddTab({ Title = "Outros", Icon = "⚡" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
    DeadRails = Window:AddTab({ Title = "Dead Rails", Icon = "train" }),
    QuebraGame = Window:AddTab({ Title = "Quebra Game", Icon = "alert-triangle" }),
    Favorites = Window:AddTab({ Title = "Favoritos", Icon = "star" }),
    Links = Window:AddTab({ Title = "Links", Icon = "plus" })
}

local function NotifyWithSound(title, content, duration, color)
    local Sound = Instance.new("Sound", game:GetService("SoundService"))
    Sound.SoundId = "rbxassetid://6026984224"
    Sound.Volume = 1
    Sound:Play()
    game.Debris:AddItem(Sound, 5)

    Fluent:Notify({
        Title = title,
        Content = content,
        Duration = duration or 3,
        Image = "rbxassetid://7733658504",
        Color = color or Color3.fromRGB(0, 170, 255),
        Close = true
    })
end

local function AddScriptButton(tab, scriptTitle, url, color)
    local function ExecuteScript()
        NotifyWithSound("Carregando...", "Executando: " .. scriptTitle, 3, color)
        local success, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if not success then
            NotifyWithSound("Erro", "Falha ao executar: " .. scriptTitle, 4, Color3.fromRGB(255, 0, 0))
            warn("[SniperX Hub] Erro ao executar script:", err)
        end
    end

    tab:AddButton({
        Title = scriptTitle,
        Callback = ExecuteScript
    })

    Tabs.Favorites:AddButton({
        Title = "[Favoritar] " .. scriptTitle,
        Callback = function()
            table.insert(Favorites, {title = scriptTitle, url = url, color = color})
            SaveFavorites(Favorites)
            NotifyWithSound("Favorito adicionado", scriptTitle .. " foi salvo nos favoritos.")
        end
    })
end

-- Favoritos
for _, fav in ipairs(Favorites) do
    Tabs.Favorites:AddButton({
        Title = fav.title,
        Callback = function()
            NotifyWithSound("Executando favorito", fav.title, 3, Color3.fromRGB(255, 255, 0))
            local success, err = pcall(function()
                loadstring(game:HttpGet(fav.url))()
            end)
            if not success then
                NotifyWithSound("Erro", "Falha ao executar favorito: " .. fav.title, 4, Color3.fromRGB(255, 0, 0))
                warn("[SniperX Hub] Erro ao executar favorito:", err)
            end
        end
    })
end

-- Scripts principais
Tabs.Main:AddParagraph({ Title = "Sniper hub", Content = "ABA SCRIPTS! Se os scripts não funcionarem é porque estão fora do ar!" })

AddScriptButton(Tabs.Main, "Pulo Infinito", "https://raw.githubusercontent.com/djmscript/infinite-jump/master/main.lua", Color3.fromRGB(255, 170, 0))
AddScriptButton(Tabs.Main, "Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", Color3.fromRGB(0, 200, 255))
AddScriptButton(Tabs.Main, "Rael Hub", "https://pastebin.com/raw/hxdAY9qY", Color3.fromRGB(100, 255, 100))

-- Extras
Tabs.Extras:AddParagraph({ Title = "Outros scripts", Content = "Scripts feitos por PHGS compativel com acentral" })

AddScriptButton(Tabs.Extras, "SnîpęrX HūB Plus!", "https://raw.githubusercontent.com/PHGS971/SniperX-Hub-Plus-/main/Script.lua", Color3.fromRGB(170, 170, 255))
AddScriptButton(Tabs.Extras, "voar do hub", "https://raw.githubusercontent.com/PHGS971/chata/main/script.lua", Color3.fromRGB(100, 255, 100))
AddScriptButton(Tabs.Extras, "PHGS SECRET HUB", "https://raw.githubusercontent.com/PHGS971/E-a-uni-o-flasco/main/phgssecrethub.lua", Color3.fromRGB(100, 255, 100))

AddScriptButton(Tabs.Extras, "MM2 Script", "https://raw.githubusercontent.com/PHGS971/E-a-uni-o-flasco/main/mm2script.lua", Color3.fromRGB(255, 255, 100))


-- Dead Rails
AddScriptButton(Tabs.DeadRails, "Auto Farm Bonds v3", "https://rawscripts.net/raw/Dead-Rails-Alpha-auto-farm-bond-33133", Color3.fromRGB(0, 255, 127))

-- Quebra Game
AddScriptButton(Tabs.QuebraGame, "Ragdoll Engine Bugado", "https://rawscripts.net/raw/Ragdoll-Engine-BEST-SCRIPT-WORKING-SystemBroken-7544", Color3.fromRGB(255, 85, 127))
AddScriptButton(Tabs.QuebraGame, "Ghosthub", "https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub", Color3.fromRGB(255, 100, 100))
AddScriptButton(Tabs.QuebraGame, "Shadow hub", "https://raw.githubusercontent.com/realgengar/scripts/refs/heads/main/Gui%20Version.lua", Color3.fromRGB(255, 0, 0))

-- Settings
Tabs.Settings:AddParagraph({ Title = "Créditos", Content = "Feito por phgs2456 e ChatGPT" })

Tabs.Settings:AddButton({
    Title = "Copiar Canal do PHGS (YouTube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@PHGS_ofcx")
        NotifyWithSound("Copiado!", "Link do canal PHGS foi copiado.", 3, Color3.fromRGB(85, 255, 255))
    end
})

-- Links
Tabs.Links:AddParagraph({
    Title = "LINKS",
    Content = "Aqui estão os links que o criador colocou e suas redes sociais. Será copiada para sua área de transferência."
})

Tabs.Links:AddButton({
    Title = "Canal do PHGS (YouTube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@PHGS_ofcx")
        NotifyWithSound("Copiado!", "Link do canal foi copiado!", 3)
    end
})

Tabs.Links:AddButton({
    Title = "TikTok do PHGS",
    Callback = function()
        setclipboard("https://tiktok.com/@phgs_ofcx")
        NotifyWithSound("Copiado!", "Link do TikTok foi copiado!", 3)
    end
})

Tabs.Links:AddButton({
    Title = "SnîpęrX HūB youtube",
    Callback = function()
        setclipboard("https://www.youtube.com/@SnîpęrXHūB-Official-channel")
        NotifyWithSound("Copiado!", "Link do SniperX hub channel foi copiado!", 3)
    end
})

Tabs.Links:AddButton({
    Title = "SnîpęrX HūB 🇧🇷 Discord",
    Callback = function()
        setclipboard("https://discord.gg/8KyfehGUnT")
        NotifyWithSound("Copiado!", "Link do SniperX hub server foi copiado!", 3)
    end
})
