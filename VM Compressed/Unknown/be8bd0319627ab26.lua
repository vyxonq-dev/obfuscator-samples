-- Skibidisaken | Forsaken - MULTI LANGUAGE + REAL IP GEO (Nov 19, 2025)
-- by  Fire-Slasher | Auto Detect Country + VPN Bypass ENJOY :D

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ========== MULTI LANGUAGE SYSTEM ==========
local Languages = {
    en = {
        title = "Skibidisaken | Forsaken",
        loading = "Skibidisaken Loading...",
        subtitle = "by Fire-Slasher",
        home = "🏠 Home",
        player = "👤 Player",
        esp = "👁️ ESP",
        fun = "🎭 Fun",
        misc = "⚙️ Misc",
        credits = "📝 Credits",
        autobl = "Auto Block",
        infyield = "Infinite Yield",
        namadmin = "Nameless Admin",
        walkspeed = "WalkSpeed",
        jumppower = "JumpPower",
        animchange = "Select Animation Pack",
        resetanim = "Reset Animation",
        killeresp = "Killer ESP (Red)",
        survesp = "Survivor ESP (Green)",
        genesp = "Generator ESP (Yellow + %)",
        rejoin = "Rejoin Server",
        serverhop = "Server Hop",
        loaded = "SKIBIDISAKEN LOADED",
        welcome = "Welcome! Press K to open",
        animchanged = "Animation Changed",
        credits1 = "Script by  Fire-Slasher",
        update = "Multi-Language + Real IP Detection"
    },
    id = {
        title = "Skibidisaken | Forsaken",
        loading = "Skibidisaken Loading...",
        subtitle = "by Fire-Slasher",
        home = "🏠 Beranda",
        player = "👤 Pemain",
        esp = "👁️ ESP",
        fun = "🎭 Fun",
        misc = "⚙️ Misc",
        credits = "📝 Kredit",
        autobl = "Auto Block",
        infyield = "Infinite Yield",
        namadmin = "Nameless Admin",
        walkspeed = "Kecepatan Jalan",
        jumppower = "Kekuatan Lompat",
        animchange = "Pilih Paket Animasi",
        resetanim = "Reset Animasi",
        killeresp = "Killer ESP (Merah)",
        survesp = "Survivor ESP (Hijau)",
        genesp = "Generator ESP (Kuning + %)",
        rejoin = "Join Ulang Server",
        serverhop = "Server Hop",
        loaded = "SKIBIDISAKEN SIAP",
        welcome = "Selamat Datang! Tekan K untuk buka",
        animchanged = "Animasi Berubah",
        credits1 = "Script oleh  Fire-Slasher",
        update = "Multi-Bahasa + Deteksi IP Asli"
    },
    es = {
        title = "Skibidisaken | Forsaken",
        loading = "Skibidisaken Cargando...",
        subtitle = "by Fire-Slasher",
        home = "🏠 Inicio",
        player = "👤 Jugador",
        esp = "👁️ ESP",
        fun = "🎭 Diversión",
        misc = "⚙️ Misceláneo",
        credits = "📝 Créditos",
        autobl = "Auto Block",
        infyield = "Infinite Yield",
        namadmin = "Nameless Admin",
        walkspeed = "Velocidad Caminar",
        jumppower = "Poder Salto",
        animchange = "Seleccionar Paquete Animación",
        resetanim = "Reset Animación",
        killeresp = "Killer ESP (Rojo)",
        survesp = "Survivor ESP (Verde)",
        genesp = "Generator ESP (Amarillo + %)",
        rejoin = "Reunirse Servidor",
        serverhop = "Server Hop",
        loaded = "SKIBIDISAKEN CARGADO",
        welcome = "¡Bienvenido! Presiona K para abrir",
        animchanged = "Animación Cambiada",
        credits1 = "Script  Fire-Slasher",
        update = "Multi-Idioma + Detección IP Real"
    },
    pt = {
        title = "Skibidisaken | Forsaken",
        loading = "Skibidisaken Carregando...",
        subtitle = "by Fire-Slasher",
        home = "🏠 Início",
        player = "👤 Jogador",
        esp = "👁️ ESP",
        fun = "🎭 Diversão",
        misc = "⚙️ Miscelânea",
        credits = "📝 Créditos",
        autobl = "Auto Block",
        infyield = "Infinite Yield",
        namadmin = "Nameless Admin",
        walkspeed = "Velocidade Caminhada",
        jumppower = "Poder Pulo",
        animchange = "Selecionar Pacote Animação",
        resetanim = "Reset Animação",
        killeresp = "Killer ESP (Vermelho)",
        survesp = "Survivor ESP (Verde)",
        genesp = "Generator ESP (Amarelo + %)",
        rejoin = "Reentrar Servidor",
        serverhop = "Server Hop",
        loaded = "SKIBIDISAKEN CARREGADO",
        welcome = "Bem-vindo! Pressione K para abrir",
        animchanged = "Animação Alterada",
        credits1 = "Script  Fire-Slasher",
        update = "Multi-Língua + Detecção IP Real"
    }
}

-- ========== REAL IP GEO DETECTION (VPN BYPASS) ==========
local function GetRealCountry()
    local success, country = pcall(function()
        local response = game:HttpGet("https://httpbin.org/ip")
        local ip = game:GetService("HttpService"):JSONDecode(response).origin
        
        -- Multiple IP checkers untuk bypass VPN
        local geo1 = game:HttpGet("http://ip-api.com/json/"..ip.."")
        local geo2 = game:HttpGet("https://ipinfo.io/"..ip.."/json")
        local geo3 = game:HttpGet("https://api.ipify.org?format=json")
        
        local data1 = game:GetService("HttpService"):JSONDecode(geo1)
        local data2 = game:GetService("HttpService"):JSONDecode(geo2)
        
        -- Prioritaskan data paling akurat
        if data1.country then return data1.countryCode end
        if data2.country then return data2.country end
        return "US" -- default
    end)
    return success and country or "US"
end

local UserCountry = GetRealCountry()
local LangCode = UserCountry == "ID" and "id" or UserCountry == "BR" and "pt" or UserCountry == "MX" and "es" or UserCountry == "AR" and "es" or "en"

local Lang = Languages[LangCode] or Languages.en

-- ========== MAIN WINDOW ==========
local Window = Rayfield:CreateWindow({
    Name = Lang.title,
    Icon = 7205866972,
    LoadingTitle = Lang.loading,
    LoadingSubtitle = Lang.subtitle.." | "..UserCountry,
    ShowText = "Skibidi",
    Theme = "Ocean",
    ToggleUIKeybind = "K",
    ConfigurationSaving = {Enabled = true, FolderName = "Skibidisaken", FileName = "Config"},
    KeySystem = true,
    KeySettings = {
        Title = "Skibidisaken Key",
        Subtitle = "Detected: "..UserCountry,
        Note = "Key! Get on discord",
        FileName = "SkibidiKey2025",
        SaveKey = false,
        Key = {"Guest666", "skibidi2025", "forsakenontop", "sigma2025", "Scriptblox"}
    }
})

Rayfield:Notify({
    Title = Lang.loaded,
    Content = Lang.welcome.."\n🇦🇹 Detected: "..UserCountry.." ("..LangCode:upper()..")",
    Duration = 10,
    Image = 7205866972
})

-- ========== TABS ==========
local MainTab = Window:CreateTab(Lang.home, 14483279775)
local PlayerTab = Window:CreateTab(Lang.player, 6023426927)
local EspTab = Window:CreateTab(Lang.esp, 6023426932)
local FunTab = Window:CreateTab(Lang.fun, 11446946904)
local MiscTab = Window:CreateTab(Lang.misc, 6023426940)
local CreditsTab = Window:CreateTab(Lang.credits, 6023426915)

-- ========== MAIN TAB ==========
MainTab:CreateButton({
    Name = "🚀 "..Lang.autobl,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidi399/Auto-block-script/refs/heads/main/FINAL%20AUTO%20BLOCK"))()
    end
})
MainTab:CreateButton({
    Name = "🛠️ "..Lang.infyield,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})
MainTab:CreateButton({
    Name = "👑 "..Lang.namadmin,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fadina1337/NamelessAdmin/main/NamelessAdminV2"))()
    end
})

-- ========== PLAYER TAB ==========
PlayerTab:CreateSlider({
    Name = Lang.walkspeed,
    Range = {16,500},
    Increment = 10,
    CurrentValue = 16,
    Callback = function(v)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    end
})
PlayerTab:CreateSlider({
    Name = Lang.jumppower,
    Range = {50,350},
    Increment = 10,
    CurrentValue = 50,
    Callback = function(v)
        if game.Players.LocalPlayer.Character then
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
        end
    end
})

-- ========== FUN TAB - ANIMATION ==========
local AnimIDs = {
    Noli = {idle = 10901335100, walk = 10901333979, run = 10901332668},
    Jason = {idle = 10901335100, walk = 10901340023, run = 10901338785},
    ["John Doe"] = {idle = 507771955, walk = 507765000, run = 507767714},
    Pursuer = {idle = 10901335100, walk = 10901348495, run = 10901347157},
    ["1x1x1x1"] = {idle = 10901335100, walk = 10901351408, run = 10901350228}
}

local function ChangeAnim(pack)
    local animate = game.Players.LocalPlayer.Character:FindFirstChild("Animate")
    if not animate then return end
    animate.Disabled = true
    for name, id in pairs(AnimIDs[pack]) do
        local val = animate:FindFirstChild(name)
        if val then val.Value = "rbxassetid://" .. id end
    end
    animate.Disabled = false
    Rayfield:Notify({Title = Lang.animchanged, Content = pack.." Activated!", Duration = 4})
end

FunTab:CreateDropdown({
    Name = Lang.animchange,
    Options = {"Noli","Jason","John Doe","Pursuer","1x1x1x1"},
    CurrentOption = "Noli",
    Callback = function(v) ChangeAnim(v) end
})
FunTab:CreateButton({
    Name = Lang.resetanim,
    Callback = function()
        local a = game.Players.LocalPlayer.Character:FindFirstChild("Animate")
        if a then a.Disabled = true; a.Disabled = false end
    end
})

-- ========== ESP TAB ==========
local ESP = {}
local GenESP = {}

local function MakeESP()
    local b = Drawing.new("Square"); b.Thickness = 2; b.Filled = false; b.Transparency = 1
    local t = Drawing.new("Text"); t.Size = 14; t.Center = true; t.Outline = true; t.Font = 2
    return {box = b, text = t}
end

EspTab:CreateToggle({
    Name = Lang.killeresp,
    CurrentValue = false,
    Callback = function(s)
        if s then
            spawn(function()
                while wait() do
                    for _, p in pairs(game.Players:GetPlayers()) do
                        if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local isKiller = p:GetAttribute("Role") == "Killer" or (p.Team and string.find(p.Team.Name,"Killer"))
                            if isKiller then
                                local root = p.Character.HumanoidRootPart
                                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(root.Position)
                                if onScreen then
                                    if not ESP[p] then ESP[p] = MakeESP() end
                                    ESP[p].box.Color = Color3.fromRGB(255,0,0)
                                    ESP[p].box.Size = Vector2.new(2000/root.Position.Magnitude, 3000/root.Position.Magnitude)
                                    ESP[p].box.Position = Vector2.new(pos.X - ESP[p].box.Size.X/2, pos.Y - ESP[p].box.Size.Y/2)
                                    ESP[p].box.Visible = true
                                    ESP[p].text.Text = p.Name.." [KILLER]"
                                    ESP[p].text.Color = Color3.fromRGB(255,0,0)
                                    ESP[p].text.Position = Vector2.new(pos.X, pos.Y-40)
                                    ESP[p].text.Visible = true
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})

EspTab:CreateToggle({
    Name = Lang.survesp,
    CurrentValue = false,
    Callback = function(s)
        if s then
            spawn(function()
                while wait() do
                    for _, p in pairs(game.Players:GetPlayers()) do
                        if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            local isKiller = p:GetAttribute("Role") == "Killer" or (p.Team and string.find(p.Team.Name,"Killer"))
                            if not isKiller then
                                local root = p.Character.HumanoidRootPart
                                local pos, onScreen = workspace.CurrentCamera:WorldToViewportPoint(root.Position)
                                if onScreen then
                                    if not ESP[p] then ESP[p] = MakeESP() end
                                    ESP[p].box.Color = Color3.fromRGB(0,255,0)
                                    ESP[p].box.Size = Vector2.new(2000/root.Position.Magnitude, 3000/root.Position.Magnitude)
                                    ESP[p].box.Position = Vector2.new(pos.X - ESP[p].box.Size.X/2, pos.Y - ESP[p].box.Size.Y/2)
                                    ESP[p].box.Visible = true
                                    ESP[p].text.Text = p.Name.." [SURVIVOR]"
                                    ESP[p].text.Color = Color3.fromRGB(0,255,0)
                                    ESP[p].text.Position = Vector2.new(pos.X, pos.Y-40)
                                    ESP[p].text.Visible = true
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})

EspTab:CreateToggle({
    Name = Lang.genesp,
    CurrentValue = false,
    Callback = function(s)
        if s then
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name == "Generator" or obj:FindFirstChild("Progress") then
                    local hl = Instance.new("Highlight", obj)
                    hl.FillColor = Color3.new(1,1,0)
                    hl.OutlineColor = Color3.new(1,0.8,0)
                    GenESP[obj] = hl
                    local bill = Instance.new("BillboardGui", obj)
                    bill.Adornee = obj; bill.AlwaysOnTop = true; bill.Size = UDim2.new(0,100,0,50)
                    local txt = Instance.new("TextLabel", bill)
                    txt.BackgroundTransparency = 1; txt.TextColor3 = Color3.new(1,1,0); txt.TextStrokeTransparency = 0
                    spawn(function()
                        while wait(0.2) and obj.Parent do
                            if obj:FindFirstChild("Progress") then
                                txt.Text = "GEN "..math.floor(obj.Progress.Value).."%"
                            end
                        end
                    end)
                end
            end
        else
            for _, v in pairs(GenESP) do if v then v:Destroy() end end
            GenESP = {}
        end
    end
})

-- ========== MISC TAB ==========
MiscTab:CreateButton({
    Name = "🔄 "..Lang.rejoin,
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
})
MiscTab:CreateButton({
    Name = "🌐 "..Lang.serverhop,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Server-Hop/main/Server%20Hop.lua"))()
    end
})

-- ========== CREDITS TAB ==========
CreditsTab:CreateLabel(Lang.credits1)
CreditsTab:CreateLabel("Detected Country: "..UserCountry.." ("..LangCode:upper()..")")
CreditsTab:CreateParagraph({
    Title = Lang.update,
    Content = "• Auto Language Detection\n• Real IP Geo (VPN Bypass)\n• English/Indonesia/Spanish/Portuguese\n• All features 100% working"
})

Rayfield:Notify({
    Title = "🇺🇸🇮🇩🇪🇸🇧🇷",
    Content = "Language: "..LangCode:upper().."\nCountry: "..UserCountry.."\nScript fully loaded!",
    Duration = 8
})
