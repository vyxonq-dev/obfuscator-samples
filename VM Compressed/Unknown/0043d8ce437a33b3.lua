--========================--
--   ENES BATUR AI SYSTEM
--   Stable Rayfield Version
--   By _alxdy
--========================--

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

Rayfield:LoadConfiguration({
    SafeMode = true,       -- Çökmeyi engeller
    Parent = game:GetService("CoreGui")
})

local CorrectKey = "EpesPatos"
local KeyVerified = false

--========================--
--        KEY WINDOW
--========================--

local KeyWindow = Rayfield:CreateWindow({
    Name = "🔑 Enes Batur Key System",
    LoadingTitle = "Giriş Yapılıyor...",
    LoadingSubtitle = "Key doğrulanıyor...",
    Theme = "Default",
    DisableRayfieldAutoDestroy = true  -- ÇÖKME SORUNUNU TAMAMEN ÇÖZÜYOR
})

local KeyTab = KeyWindow:CreateTab("🔑 Key")

KeyTab:CreateParagraph({
    Title = "Discord Sunucusu (Key burada)",
    Content = "https://discord.gg/WECXZmhUz"
})

KeyTab:CreateButton({
    Name = "🔗 Linki Kopyala",
    Callback = function()
        setclipboard("https://discord.gg/WECXZmhUz")
        Rayfield:Notify({
            Title = "Kopyalandı!",
            Content = "Discord linki panoya kopyalandı.",
            Duration = 5
        })
    end
})

KeyTab:CreateInput({
    Name = "Key Gir",
    PlaceholderText = "Key yaz...",
    Callback = function(key)
        if key == CorrectKey then
            KeyVerified = true
            Rayfield:Notify({
                Title = "✔ Doğru Key",
                Content  = "Panel açılıyor...",
                Duration = 4
            })
        else
            Rayfield:Notify({
                Title = "❌ Yanlış Key",
                Content = "Doğru key Discord’da.",
                Duration = 4
            })
        end
    end
})

-- KEY BEKLEME
repeat task.wait() until KeyVerified

-- Destroy AFTER a frame (Rayfield bug fix)
task.defer(function()
    pcall(function()
        KeyWindow:Destroy()
    end)
end)

task.wait(0.25)

--========================--
--       MAIN WINDOW
--========================--

local Window = Rayfield:CreateWindow({
    Name = "🎥 Enes Batur Ultra AI Assistant",
    LoadingTitle = "Asistan Açılıyor...",
    LoadingSubtitle = "Hoş geldin kral 😎",
    Theme = "Default"
})

local ChatTab = Window:CreateTab("💬 Sohbet")
local InfoTab = Window:CreateTab("ℹ️ Info")
local CommandsTab = Window:CreateTab("📘 Komutlar")

--========================--
--    Gelişmiş AI Cevap
--========================--

local function SmartReply(msg)
    msg = string.lower(msg)

    local function Has(words)
        for _, w in ipairs(words) do
            if msg:find(w) then return true end
        end
        return false
    end

    if Has({"para","dolar","tl","zengin"}) then
        return "💸 Ekonomi çökmüş olabilir ama sen yine KRALSIN!"
    elseif Has({"selam","sa","merhaba","hey"}) then
        return "👋 Selam kral! Işıl ışıl geldin yine."
    elseif Has({"amk","siktir","yarrak","orospu"}) then
        return "😡 Bana mı dedin LAN?! Şaka şaka sakin ol 😂"
    elseif Has({"roblox","oyun"}) then
        return "🎮 Roblox'un efendisiyim kardeşim, ne oynamak istiyon?"
    elseif Has({"script","hile","executor"}) then
        return "⚙️ Script işi bende! Ne çalıştırıyoruz?"
    elseif Has({"youtube","video","enes"}) then
        return "📹 Kamera açık! 10 dakika içerik hazır 😂"
    elseif Has({"kız","aşk","sevgili"}) then
        return "❤️ Aşk konularında koçum ben, anlat gelsin!"
    elseif Has({"nasılsın"}) then
        return "🔥 Ben bomba gibiyim! Senin gelişinle ortam şenlendi."
    elseif msg:find("?") then
        return "🧠 Mantıklı soru. Bence şöyle yap: Kendine güven!"
    elseif #msg > 50 then
        return "📘 Uzun roman yazmışsın ama okudum, mantıklı konuşmuşsun."
    else
        return "😎 Mesajını aldım! Devam et kral."
    end
end

--========================--
--     CHAT INPUT
--========================--

ChatTab:CreateInput({
    Name = "AI Chat",
    PlaceholderText = "Bana yaz, otomatik cevap vereyim...",
    RemoveTextAfterFocusLost = false,
    Callback = function(msg)
        Rayfield:Notify({
            Title = "🤖 Enes AI",
            Content = SmartReply(msg),
            Duration = 5
        })
    end
})

--========================--
--        INFO
--========================--

InfoTab:CreateParagraph({
    Title = "Script Developer",
    Content = "_alxdy"
})

InfoTab:CreateParagraph({
    Title = "Discord Sunucusu",
    Content = "https://discord.gg/WECXZmhUz"
})

InfoTab:CreateButton({
    Name = "🔗 Linki Kopyala",
    Callback = function()
        setclipboard("https://discord.gg/WECXZmhUz")
        Rayfield:Notify({
            Title = "Kopyalandı!",
            Content = "Link panoya kopyalandı.",
            Duration = 4
        })
    end
})

--========================--
--     KOMUT KANALI
--========================--

CommandsTab:CreateParagraph({
    Title = "Anahtar Kelimeler",
    Content = [[
💸 para, dolar, tl, zengin  
😡 küfür, sinir  
🎮 roblox, oyun  
⚙️ script, exploit  
📹 youtube, video  
❤️ aşk, sevgili  
🔥 nasılsın  
]]
})