-- ============================================================
-- 🚀 LOADER DE IDIOMAS — better search +
-- Escolha o idioma desejado e carregue automaticamente
-- ============================================================

-- 🔗 LINKS POR IDIOMA
local IDIOMAS = {
    ["🇧🇷 Português Brasil"] = "https://pastebin.com/raw/94TnBHDK",
    ["🇺🇸 English"] = "https://pastebin.com/raw/WEiY0EEA",
    ["🇪🇸 Español"] = "https://pastebin.com/raw/BY4Wpikq"
}

-- ============================================================
-- CARREGAR INTERFACE
-- ============================================================

local RayfieldSuccess, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if not RayfieldSuccess then
    local fallback = pcall(function()
        return loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source"))()
    end)
    if fallback then Rayfield = fallback end
end
if not Rayfield then
    warn("Falha ao carregar interface.")
    return
end

local Window = Rayfield:CreateWindow({
    Name = "better search + — Idioma",
    LoadingTitle = "Escolha o Idioma",
    LoadingSubtitle = "Select your language • Selecciona tu idioma",
    ConfigurationSaving = {Enabled = false},
    Discord = {Enabled = false},
    KeySystem = false
})

local Tab = Window:CreateTab("Idioma", 4483362458)

Tab:CreateSection("🌐 Selecione seu Idioma")

Tab:CreateLabel("═══════════════════════════════")
Tab:CreateLabel("🇧🇷 Português Brasil")
Tab:CreateLabel("🇺🇸 English")
Tab:CreateLabel("🇪🇸 Español")
Tab:CreateLabel("═══════════════════════════════")

-- 🔘 BOTÃO PORTUGUÊS
Tab:CreateButton({
    Name = "🇧🇷 Português Brasil",
    Callback = function()
        Rayfield:Notify({
            Title = "🔄 Carregando...",
            Content = "Idioma: Português Brasil 🇧🇷",
            Duration = 2.5
        })
        task.wait(1.5)
        pcall(function() Rayfield:Destroy() end)
        loadstring(game:HttpGet(IDIOMAS["🇧🇷 Português Brasil"]))()
    end
})

-- 🔘 BOTÃO ENGLISH
Tab:CreateButton({
    Name = "🇺🇸 English",
    Callback = function()
        Rayfield:Notify({
            Title = "🔄 Loading...",
            Content = "Language: English 🇺🇸",
            Duration = 2.5
        })
        task.wait(1.5)
        pcall(function() Rayfield:Destroy() end)
        loadstring(game:HttpGet(IDIOMAS["🇺🇸 English"]))()
    end
})

-- 🔘 BOTÃO ESPAÑOL
Tab:CreateButton({
    Name = "🇪🇸 Español",
    Callback = function()
        Rayfield:Notify({
            Title = "🔄 Cargando...",
            Content = "Idioma: Español 🇪🇸",
            Duration = 2.5
        })
        task.wait(1.5)
        pcall(function() Rayfield:Destroy() end)
        loadstring(game:HttpGet(IDIOMAS["🇪🇸 Español"]))()
    end
})

Tab:CreateSection("ℹ️ Informações")
Tab:CreateLabel("✅ Todos os idiomas:")
Tab:CreateLabel("   • Pesquisa de Jogos e Universais")
Tab:CreateLabel("   • Sistema de Bypass Integrado")
Tab:CreateLabel("   • Aba For You + Filtros")
Tab:CreateLabel("   • Tema Escuro/Claro")
