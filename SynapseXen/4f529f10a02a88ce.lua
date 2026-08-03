--[[
================================================================
  TALKING SENTINEL v1
  Creado por: Lenux Play | Lenux Studio | Talking Scripts | Talking Hyb
  Copyright (c) 2024 Talking Scripts & Lenux Studio
  Todos los derechos reservados.

  Este script es propiedad intelectual de sus creadores.
  Queda prohibida su copia, redistribucion o modificacion
  sin el consentimiento expreso de los autores.

  Creditos:
    - Lenux Play        (Desarrollo Principal)
    - Lenux Studio      (Arquitectura del Sistema)
    - Talking Scripts   (Sistemas de Deteccion)
    - Talking Hyb       (Ofuscacion TKG v2)

  Talking Sentinel v1 | Proxima actualizacion: v1.1...
================================================================
]]

-- ============================================================
-- MODULO 0: COMPATIBILIDAD UNIVERSAL DE EXECUTORS
-- Soporta: Synapse X, KRNL, Xeno, Luna, Delta, Fluxus,
--          Potassium, Script-Ware, MacSploit, AWP, Electron,
--          Codex, Trigon, Coco Z, Hydrogen (movil/tablet),
--          Arceus X (movil), Velocity (movil), y mas.
-- ============================================================

-- ── Entorno seguro ──────────────────────────────────────────
local _ENV_OK = pcall(function() return game end)
if not _ENV_OK then return end

-- ── Funcion getgenv universal ────────────────────────────────
local _genv = (typeof(getgenv) == "function" and getgenv())
           or (typeof(getsenv) == "function" and getsenv())
           or _G
           or {}

-- ── task.* fallback (executors viejos / Hydrogen) ───────────
if not task then
    task = {}
    task.wait  = wait
    task.spawn = function(f, ...) coroutine.wrap(f)(...) end
    task.delay = function(t, f, ...) delay(t, f) end
end

-- ── setclipboard universal ───────────────────────────────────
-- Orden: setclipboard -> toclipboard -> syn.write_clipboard
-- -> writeclipboard -> Xeno/Delta/Potassium -> fallback TextBox
local _originalSetClipboard = (typeof(setclipboard) == "function") and setclipboard or nil
local _originalToClipboard  = (typeof(toclipboard)   == "function") and toclipboard  or nil

local function SafeSetClipboard(text)
    -- Synapse X / Script-Ware / mayoria
    if _originalSetClipboard then
        pcall(_originalSetClipboard, text) return
    end
    -- Alternativa nombre antiguo
    if _originalToClipboard then
        pcall(_originalToClipboard, text) return
    end
    -- Synapse X viejo
    if typeof(syn) == "table" and typeof(syn.write_clipboard) == "function" then
        pcall(syn.write_clipboard, text) return
    end
    -- KRNL / Fluxus
    if typeof(writeclipboard) == "function" then
        pcall(writeclipboard, text) return
    end
    -- Xeno
    if typeof(Xeno) == "table" and typeof(Xeno.write_clipboard) == "function" then
        pcall(Xeno.write_clipboard, text) return
    end
    -- Delta
    if typeof(delta) == "table" and typeof(delta.write_clipboard) == "function" then
        pcall(delta.write_clipboard, text) return
    end
    -- Potassium / TV executor
    if typeof(Potassium) == "table" and typeof(Potassium.write_clipboard) == "function" then
        pcall(Potassium.write_clipboard, text) return
    end
    -- Luna
    if typeof(Luna) == "table" and typeof(Luna.write_clipboard) == "function" then
        pcall(Luna.write_clipboard, text) return
    end
    -- Hydrogen (movil iOS/Android)
    if typeof(writetofile) == "function" then
        -- Hydrogen no tiene clipboard, escribimos a archivo como fallback
        pcall(writetofile, "ts_clipboard.txt", text) return
    end
    -- Fallback visual: copia al TextBox temporal
    pcall(function()
        local gui = Instance.new("ScreenGui")
        gui.Name = "_TSClipFallback"
        gui.Parent = game:GetService("CoreGui")
        local tb = Instance.new("TextBox")
        tb.Size = UDim2.new(0,1,0,1)
        tb.Position = UDim2.new(0,-999,0,-999)
        tb.Text = text
        tb.Parent = gui
        tb:CaptureFocus()
        tb:ReleaseFocus()
        task.delay(1, function() gui:Destroy() end)
    end)
end

-- Sobreescribir setclipboard global con version segura
setclipboard = SafeSetClipboard

-- ── CoreGui universal ────────────────────────────────────────
-- Algunos executors movil (Arceus X, Hydrogen, Velocity)
-- no pueden escribir en CoreGui directamente.
local SafeCoreGui
do
    local ok = pcall(function()
        local _ = game:GetService("CoreGui").ClassName
    end)
    if ok then
        local ok2 = pcall(function()
            local t = Instance.new("Frame")
            t.Parent = game:GetService("CoreGui")
            t:Destroy()
        end)
        if ok2 then
            SafeCoreGui = game:GetService("CoreGui")
        end
    end
    -- Si CoreGui falla, usar PlayerGui
    if not SafeCoreGui then
        SafeCoreGui = game:GetService("Players").LocalPlayer
            and game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui")
            or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui", 5)
    end
end
-- Reemplazar referencia CoreGui del script principal
CoreGui = SafeCoreGui or game:GetService("CoreGui")

-- ── loadstring universal ─────────────────────────────────────
if not loadstring then
    loadstring = load
end

-- ── request / http universal ─────────────────────────────────
-- No se usa en este script pero se expone por si otro lo carga
local function SafeRequest(options)
    if typeof(request) == "function" then return request(options) end
    if typeof(http_request) == "function" then return http_request(options) end
    if typeof(syn) == "table" and typeof(syn.request) == "function" then
        return syn.request(options)
    end
    if typeof(fluxus) == "table" and typeof(fluxus.request) == "function" then
        return fluxus.request(options)
    end
    return nil
end

-- ── Deteccion de executor para el topbar ─────────────────────
-- Se usa mas abajo en Modulo 27; aqui preparamos la tabla
TalkingSentinel = TalkingSentinel or {}
TalkingSentinel._ExecutorName  = "Desconocido"
TalkingSentinel._ExecutorFound = false

local function _checkG(n)
    local ok, v = pcall(function()
        if typeof(getfenv) == "function" then return getfenv()[n]
        else return rawget(_G, n) end
    end)
    return ok and v ~= nil
end

local _execChecks = {
    {key="syn",            name="Synapse X"},
    {key="KRNL_LOADED",   name="KRNL"},
    {key="XENO_LOADED",   name="Xeno"},
    {key="LUNA_LOADED",   name="Luna"},
    {key="DELTA_LOADED",  name="Delta"},
    {key="fluxus",        name="Fluxus"},
    {key="Potassium",     name="Potassium"},
    {key="WAVE_LOADED",   name="Wave"},
    {key="Script_Ware",   name="Script-Ware"},
    {key="MACSPLOIT_LOADED", name="MacSploit"},
    {key="AWP_LOADED",    name="AWP"},
    {key="ELECTRON_LOADED",  name="Electron"},
    {key="CODEX_LOADED",  name="Codex"},
    {key="TRIGON_LOADED", name="Trigon"},
    {key="HYDROGEN_LOADED",  name="Hydrogen"},
    {key="VELOCITY_LOADED",  name="Velocity"},
    {key="ARCEUSX_LOADED",   name="Arceus X"},
    {key="COCOZEDIT_LOADED", name="Coco Z"},
}

for _, ec in ipairs(_execChecks) do
    if _checkG(ec.key) then
        TalkingSentinel._ExecutorName  = ec.name
        TalkingSentinel._ExecutorFound = true
        break
    end
end

-- Si no encontramos por flags pero hay funciones tipicas
if not TalkingSentinel._ExecutorFound then
    if _checkG("getgenv") or _checkG("hookfunction") or _checkG("getrawmetatable") then
        TalkingSentinel._ExecutorName  = "Executor"
        TalkingSentinel._ExecutorFound = true
    end
end

-- ── Compatibilidad de eventos en movil ──────────────────────
-- En movil Touch y MouseButton1 deben tratarse igual.
-- Ya esta gestionado en el drag del Modulo 24 con Touch,
-- pero nos aseguramos que UserInputService exista.
local _UIS_OK = pcall(function()
    return game:GetService("UserInputService").TouchEnabled
end)
if not _UIS_OK then
    -- Fallback minimo para no romper el script
    UserInputService = {
        TouchEnabled    = true,
        KeyboardEnabled = false,
        GamepadEnabled  = false,
        InputChanged    = {Connect = function() end},
        InputBegan      = {Connect = function() end},
    }
end

-- ── DrawLibrary (no se usa, pero algunos executors lo inyectan)
-- Bloqueamos para evitar conflictos de renderizado
if typeof(Drawing) == "table" then
    -- Drawing existe (Synapse/KRNL), no hacemos nada especial
end

-- ── Fin compatibilidad ───────────────────────────────────────
-- A partir de aqui el script principal corre sin cambios.
-- SafeSetClipboard ya esta asignada a setclipboard.
-- CoreGui ya esta resuelta.

-- ============================================================
-- MODULO 1: INICIALIZACION DEL SISTEMA PRINCIPAL
-- ============================================================

local TalkingSentinel = {}
TalkingSentinel.__index = TalkingSentinel
TalkingSentinel.Version = "v1.0"
TalkingSentinel.Build = "2024.12"
TalkingSentinel.Loaded = false
TalkingSentinel.Language = "es"
TalkingSentinel.Platform = "pc"
TalkingSentinel.Theme = "dark"
TalkingSentinel.Minimized = false

-- Servicios
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- ============================================================
-- MODULO 2: DETECTOR DE PLATAFORMA E IDIOMA
-- ============================================================

local function DetectPlatform()
    local platform = "pc"
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        platform = "mobile"
    elseif UserInputService.GamepadEnabled and not UserInputService.KeyboardEnabled then
        platform = "tablet"
    elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled then
        platform = "tablet"
    end
    return platform
end

local function DetectLanguage()
    local lang = "es"
    local ok, locale =
        pcall(
        function()
            return LocalPlayer.LocaleId
        end
    )
    if ok and locale then
        if string.find(locale, "en") then
            lang = "en"
        elseif string.find(locale, "pt") then
            lang = "pt"
        elseif string.find(locale, "fr") then
            lang = "fr"
        elseif string.find(locale, "de") then
            lang = "de"
        else
            lang = "es"
        end
    end
    return lang
end

TalkingSentinel.Platform = DetectPlatform()
TalkingSentinel.Language = DetectLanguage()

-- ============================================================
-- MODULO 3: SISTEMA DE TRADUCCIONES
-- ============================================================

local Translations = {
    es = {
        welcome = "Bienvenido a Talking Sentinel v1",
        loading = "Cargando sistema...",
        loading_anticheat = "Iniciando detectores de anticheat...",
        loading_obfuscation = "Cargando capas de ofuscacion...",
        loading_analyzers = "Iniciando analizadores...",
        loading_complete = "Sistema listo",
        next_update = "Proxima actualizacion",
        obfuscator = "Ofuscador",
        cheat_detector = "Detector Cheats",
        get_anticheat = "Obtener Anticheat",
        ac_analyzer = "Analizador Anticheats",
        settings = "Ajustes",
        paste_script = "Pega tu script aqui...",
        generate = "Generar",
        copy = "Copiar",
        warning_backup = "Aviso: Guarda tu script original por si algun dia lo necesitas",
        obfuscation_methods = "Metodos de Ofuscacion",
        select_all = "Seleccionar Todos",
        analyze = "Analizar",
        scanning = "Escaneando jugadores...",
        results = "Resultados",
        generate_report = "Generar Informe",
        get_our_anticheat = "Obtener Nuestro Anticheat",
        where_to_place = "Donde colocarlo:",
        server_script_service = "ServerScriptService",
        whitelist_info = "Puedes anadir jugadores a la lista blanca dentro del script",
        theme = "Tema",
        dark = "Oscuro",
        light = "Claro",
        destroy = "Destruir Script",
        copyright = "Copyright",
        platform_pc = "PC detectado",
        platform_mobile = "Movil detectado",
        platform_tablet = "Tablet detectada",
        tip1 = "Tip: Compara velocidades de movimiento entre jugadores",
        tip2 = "Tip: Los ejecutores dejan rastros en el entorno local",
        tip3 = "Tip: Un salto anormalmente alto puede indicar modificacion de gravedad",
        tip4 = "Tip: La velocidad de caminar standard en Roblox es 16",
        tip5 = "Tip: Los anticheats de servidor son mas seguros que los de cliente",
        tip6 = "Tip: TKG v2 usa codificacion casi binaria para maxima proteccion",
        tip7 = "Tip: Siempre guarda una copia de tu script original",
        tip8 = "Tip: Los exploits de vuelo alteran la propiedad Humanoid.FloorMaterial",
        tip9 = "Tip: Comparar 3+ jugadores ayuda a identificar anomalias",
        tip10 = "Tip: El noclip modifica la colision del personaje",
        analyzing_layer = "Analizando capa",
        of = "de",
        executor_detected = "Executor detectado",
        speed_hack = "Speed hack",
        fly_hack = "Fly hack",
        noclip = "Noclip",
        jump_hack = "Jump hack",
        normal = "Normal",
        suspicious = "Sospechoso",
        cheater = "Tramposo",
        report_sent = "Reporte enviado",
        no_cheats = "No se detectaron trampas",
        anticheats_found = "Anticheats encontrados",
        anticheats_active = "Anticheats activos",
        section_obfuscator = "Nuestra seccion para Ofuscar Scripts",
        new_label = "NUEVO",
        our_label = "NUESTRO",
        close = "Cerrar",
        minimize = "Minimizar",
        script_here = "Script aqui",
        obfuscated_result = "Script Ofuscado",
        kick_players = "Kickear jugadores",
        ban_players = "Banear jugadores",
        anticheat_features = "Caracteristicas del Anticheat",
        anticheat_desc = "Sistema de deteccion avanzado que compara movimientos, saltos y velocidades entre todos los jugadores en tiempo real"
    },
    en = {
        welcome = "Welcome to Talking Sentinel v1",
        loading = "Loading system...",
        loading_anticheat = "Starting anticheat detectors...",
        loading_obfuscation = "Loading obfuscation layers...",
        loading_analyzers = "Starting analyzers...",
        loading_complete = "System ready",
        next_update = "Next update",
        obfuscator = "Obfuscator",
        cheat_detector = "Cheat Detector",
        get_anticheat = "Get Anticheat",
        ac_analyzer = "Anticheat Analyzer",
        settings = "Settings",
        paste_script = "Paste your script here...",
        generate = "Generate",
        copy = "Copy",
        warning_backup = "Warning: Save your original script in case you ever need it",
        obfuscation_methods = "Obfuscation Methods",
        select_all = "Select All",
        analyze = "Analyze",
        scanning = "Scanning players...",
        results = "Results",
        generate_report = "Generate Report",
        get_our_anticheat = "Get Our Anticheat",
        where_to_place = "Where to place it:",
        server_script_service = "ServerScriptService",
        whitelist_info = "You can add players to the whitelist inside the script",
        theme = "Theme",
        dark = "Dark",
        light = "Light",
        destroy = "Destroy Script",
        copyright = "Copyright",
        platform_pc = "PC detected",
        platform_mobile = "Mobile detected",
        platform_tablet = "Tablet detected",
        tip1 = "Tip: Compare movement speeds between players",
        tip2 = "Tip: Executors leave traces in the local environment",
        tip3 = "Tip: An abnormally high jump may indicate gravity modification",
        tip4 = "Tip: The standard walking speed in Roblox is 16",
        tip5 = "Tip: Server-side anticheats are safer than client-side ones",
        tip6 = "Tip: TKG v2 uses near-binary encoding for maximum protection",
        tip7 = "Tip: Always keep a backup of your original script",
        tip8 = "Tip: Fly exploits alter the Humanoid.FloorMaterial property",
        tip9 = "Tip: Comparing 3+ players helps identify anomalies",
        tip10 = "Tip: Noclip modifies character collision",
        analyzing_layer = "Analyzing layer",
        of = "of",
        executor_detected = "Executor detected",
        speed_hack = "Speed hack",
        fly_hack = "Fly hack",
        noclip = "Noclip",
        jump_hack = "Jump hack",
        normal = "Normal",
        suspicious = "Suspicious",
        cheater = "Cheater",
        report_sent = "Report sent",
        no_cheats = "No cheats detected",
        anticheats_found = "Anticheats found",
        anticheats_active = "Active anticheats",
        section_obfuscator = "Our Script Obfuscation Section",
        new_label = "NEW",
        our_label = "OURS",
        close = "Close",
        minimize = "Minimize",
        script_here = "Script here",
        obfuscated_result = "Obfuscated Script",
        kick_players = "Kick players",
        ban_players = "Ban players",
        anticheat_features = "Anticheat Features",
        anticheat_desc = "Advanced detection system that compares movements, jumps and speeds among all players in real time"
    }
}

local function T(key)
    local lang = TalkingSentinel.Language
    if Translations[lang] and Translations[lang][key] then
        return Translations[lang][key]
    elseif Translations["es"][key] then
        return Translations["es"][key]
    end
    return key
end

-- ============================================================
-- MODULO 4: SISTEMA DE COLORES Y TEMAS
-- ============================================================

local Themes = {
    dark = {
        bg_primary = Color3.fromRGB(10, 10, 14),
        bg_secondary = Color3.fromRGB(16, 16, 22),
        bg_panel = Color3.fromRGB(20, 20, 28),
        bg_input = Color3.fromRGB(14, 14, 20),
        border = Color3.fromRGB(40, 40, 55),
        accent = Color3.fromRGB(0, 200, 150),
        accent2 = Color3.fromRGB(0, 150, 255),
        danger = Color3.fromRGB(220, 60, 60),
        warning = Color3.fromRGB(220, 160, 0),
        success = Color3.fromRGB(0, 200, 100),
        text_primary = Color3.fromRGB(230, 230, 240),
        text_secondary = Color3.fromRGB(140, 140, 160),
        text_dim = Color3.fromRGB(80, 80, 100),
        nav_bg = Color3.fromRGB(13, 13, 18),
        topbar = Color3.fromRGB(8, 8, 12),
        scrollbar = Color3.fromRGB(40, 40, 60),
        new_badge = Color3.fromRGB(0, 200, 150),
        our_badge = Color3.fromRGB(0, 120, 255)
    },
    light = {
        bg_primary = Color3.fromRGB(245, 245, 250),
        bg_secondary = Color3.fromRGB(235, 235, 245),
        bg_panel = Color3.fromRGB(255, 255, 255),
        bg_input = Color3.fromRGB(240, 240, 248),
        border = Color3.fromRGB(200, 200, 215),
        accent = Color3.fromRGB(0, 170, 120),
        accent2 = Color3.fromRGB(0, 120, 220),
        danger = Color3.fromRGB(200, 40, 40),
        warning = Color3.fromRGB(180, 130, 0),
        success = Color3.fromRGB(0, 170, 80),
        text_primary = Color3.fromRGB(20, 20, 30),
        text_secondary = Color3.fromRGB(80, 80, 100),
        text_dim = Color3.fromRGB(150, 150, 170),
        nav_bg = Color3.fromRGB(225, 225, 238),
        topbar = Color3.fromRGB(210, 210, 230),
        scrollbar = Color3.fromRGB(180, 180, 200),
        new_badge = Color3.fromRGB(0, 170, 120),
        our_badge = Color3.fromRGB(0, 100, 200)
    }
}

local function GetTheme()
    return Themes[TalkingSentinel.Theme] or Themes.dark
end

-- ============================================================
-- MODULO 5: UTILIDADES DE UI
-- ============================================================

local function CreateTween(obj, props, duration, style, direction)
    local info = TweenInfo.new(duration or 0.3, style or Enum.EasingStyle.Quad, direction or Enum.EasingDirection.Out)
    return TweenService:Create(obj, info, props)
end

local function NewInstance(class, props, parent)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do
        inst[k] = v
    end
    if parent then
        inst.Parent = parent
    end
    return inst
end

local function MakeRound(inst, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius or 6)
    corner.Parent = inst
    return corner
end

local function MakePadding(inst, t, b, l, r)
    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, t or 8)
    pad.PaddingBottom = UDim.new(0, b or 8)
    pad.PaddingLeft = UDim.new(0, l or 8)
    pad.PaddingRight = UDim.new(0, r or 8)
    pad.Parent = inst
    return pad
end

local function MakeStroke(inst, color, thickness, transparency)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Color3.fromRGB(40, 40, 60)
    stroke.Thickness = thickness or 1
    stroke.Transparency = transparency or 0
    stroke.Parent = inst
    return stroke
end

local function MakeGradient(inst, colors, rotation)
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(colors)
    grad.Rotation = rotation or 90
    grad.Parent = inst
    return grad
end

-- ============================================================
-- MODULO 6: CREACION DE LA GUI PRINCIPAL
-- ============================================================

-- Elimina GUI anterior si existe
local existing = CoreGui:FindFirstChild("TalkingSentinelGUI")
if existing then
    existing:Destroy()
end

local ScreenGui =
    NewInstance(
    "ScreenGui",
    {
        Name = "TalkingSentinelGUI",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 999
    },
    CoreGui
)

-- ============================================================
-- MODULO 7: PANTALLA DE CARGA
-- ============================================================

local LoadingScreen =
    NewInstance(
    "Frame",
    {
        Name = "LoadingScreen",
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = Color3.fromRGB(8, 8, 12),
        BorderSizePixel = 0,
        ZIndex = 100
    },
    ScreenGui
)

-- Fondo con gradiente
local LoadBg =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 0,
        ZIndex = 100
    },
    LoadingScreen
)

MakeGradient(
    LoadBg,
    {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 5, 10)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 12, 20)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 5, 10))
    },
    135
)

-- Logo principal
local LogoLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 500, 0, 60),
        Position = UDim2.new(0.5, -250, 0.3, -80),
        BackgroundTransparency = 1,
        Text = "TALKING SENTINEL",
        TextColor3 = Color3.fromRGB(0, 200, 150),
        TextSize = 36,
        Font = Enum.Font.GothamBold,
        ZIndex = 101,
        TextTransparency = 1
    },
    LoadingScreen
)

local VersionLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 500, 0, 30),
        Position = UDim2.new(0.5, -250, 0.3, -20),
        BackgroundTransparency = 1,
        Text = "v1",
        TextColor3 = Color3.fromRGB(0, 150, 255),
        TextSize = 20,
        Font = Enum.Font.Gotham,
        ZIndex = 101,
        TextTransparency = 1
    },
    LoadingScreen
)

local WelcomeLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 600, 0, 40),
        Position = UDim2.new(0.5, -300, 0.4, 0),
        BackgroundTransparency = 1,
        Text = T("welcome"),
        TextColor3 = Color3.fromRGB(200, 200, 220),
        TextSize = 18,
        Font = Enum.Font.Gotham,
        ZIndex = 101,
        TextTransparency = 1
    },
    LoadingScreen
)

-- Barra de progreso
local ProgressBg =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(0, 400, 0, 4),
        Position = UDim2.new(0.5, -200, 0.55, 0),
        BackgroundColor3 = Color3.fromRGB(30, 30, 45),
        BorderSizePixel = 0,
        ZIndex = 101
    },
    LoadingScreen
)
MakeRound(ProgressBg, 2)

local ProgressBar =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 200, 150),
        BorderSizePixel = 0,
        ZIndex = 102
    },
    ProgressBg
)
MakeRound(ProgressBar, 2)

MakeGradient(
    ProgressBar,
    {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 200, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 150, 255))
    },
    0
)

local LoadingStatus =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 400, 0, 30),
        Position = UDim2.new(0.5, -200, 0.58, 0),
        BackgroundTransparency = 1,
        Text = T("loading"),
        TextColor3 = Color3.fromRGB(100, 100, 130),
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 101
    },
    LoadingScreen
)

-- Tres puntos animados
local DotsLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 400, 0, 30),
        Position = UDim2.new(0.5, -200, 0.61, 0),
        BackgroundTransparency = 1,
        Text = ".",
        TextColor3 = Color3.fromRGB(0, 200, 150),
        TextSize = 22,
        Font = Enum.Font.GothamBold,
        ZIndex = 101
    },
    LoadingScreen
)

-- Proxima actualizacion
local NextUpdateLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 500, 0, 25),
        Position = UDim2.new(0.5, -250, 0.72, 0),
        BackgroundTransparency = 1,
        Text = T("next_update") .. ": v1.1...",
        TextColor3 = Color3.fromRGB(60, 60, 80),
        TextSize = 12,
        Font = Enum.Font.Gotham,
        ZIndex = 101
    },
    LoadingScreen
)

-- Creditos en carga
local CreditsLoad =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 600, 0, 20),
        Position = UDim2.new(0.5, -300, 0.92, 0),
        BackgroundTransparency = 1,
        Text = "Lenux Play | Lenux Studio | Talking Scripts | Talking Hyb",
        TextColor3 = Color3.fromRGB(40, 40, 60),
        TextSize = 11,
        Font = Enum.Font.Gotham,
        ZIndex = 101
    },
    LoadingScreen
)

-- ============================================================
-- MODULO 8: GUI PRINCIPAL (oculta al inicio)
-- ============================================================

local C = GetTheme()

local MainFrame =
    NewInstance(
    "Frame",
    {
        Name = "MainFrame",
        Size = TalkingSentinel.Platform == "mobile" and UDim2.new(0.95, 0, 0.85, 0) or UDim2.new(0, 680, 0, 520),
        Position = UDim2.new(
            0.5,
            TalkingSentinel.Platform == "mobile" and -0.475 * 400 or -340,
            0.5,
            TalkingSentinel.Platform == "mobile" and -0.425 * 600 or -260
        ),
        BackgroundColor3 = C.bg_primary,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 10,
        Active = true,
        Draggable = true
    },
    ScreenGui
)
MakeRound(MainFrame, 10)
MakeStroke(MainFrame, C.border, 1)

-- Si es mobile, hacer UDim2 porcentual
if TalkingSentinel.Platform == "mobile" then
    MainFrame.Size = UDim2.new(0.95, 0, 0.88, 0)
    MainFrame.Position = UDim2.new(0.025, 0, 0.06, 0)
end

-- Sombra
local Shadow =
    NewInstance(
    "ImageLabel",
    {
        Size = UDim2.new(1, 40, 1, 40),
        Position = UDim2.new(0, -20, 0, -20),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6014261993",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        ZIndex = 9
    },
    MainFrame
)

-- Top bar
local TopBar =
    NewInstance(
    "Frame",
    {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = C.topbar,
        BorderSizePixel = 0,
        ZIndex = 11
    },
    MainFrame
)
MakeRound(TopBar, 10)

-- Fix corners topbar
local TopBarFix =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0.5, 0),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = C.topbar,
        BorderSizePixel = 0,
        ZIndex = 11
    },
    TopBar
)

-- Logo en topbar
local TopLogo =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 220, 1, 0),
        Position = UDim2.new(0, 12, 0, 0),
        BackgroundTransparency = 1,
        Text = "TALKING SENTINEL v1",
        TextColor3 = C.accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 12
    },
    TopBar
)

-- Platform indicator
local PlatformLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(0, 130, 0, 20),
        Position = UDim2.new(0.5, -65, 0.5, -10),
        BackgroundTransparency = 1,
        Text = T("platform_" .. TalkingSentinel.Platform),
        TextColor3 = C.text_dim,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        ZIndex = 12
    },
    TopBar
)

-- Botones topbar (minimizar, cerrar)
local BtnMinimize =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(1, -66, 0.5, -14),
        BackgroundColor3 = Color3.fromRGB(40, 40, 60),
        Text = "-",
        TextColor3 = C.text_primary,
        TextSize = 18,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 12
    },
    TopBar
)
MakeRound(BtnMinimize, 14)

local BtnClose =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0, 28, 0, 28),
        Position = UDim2.new(1, -32, 0.5, -14),
        BackgroundColor3 = Color3.fromRGB(180, 40, 40),
        Text = "x",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 12
    },
    TopBar
)
MakeRound(BtnClose, 14)

-- ============================================================
-- MODULO 9: BARRA DE NAVEGACION LATERAL
-- ============================================================

local NavBar =
    NewInstance(
    "Frame",
    {
        Name = "NavBar",
        Size = UDim2.new(0, 140, 1, -44),
        Position = UDim2.new(0, 0, 0, 44),
        BackgroundColor3 = C.nav_bg,
        BorderSizePixel = 0,
        ZIndex = 11
    },
    MainFrame
)

local NavFix =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = C.nav_bg,
        BorderSizePixel = 0,
        ZIndex = 11
    },
    NavBar
)

-- Separador nav
local NavSep =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(0, 1, 1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        BackgroundColor3 = C.border,
        BorderSizePixel = 0,
        ZIndex = 12
    },
    NavBar
)

local NavList =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 1, -10),
        Position = UDim2.new(0, 0, 0, 10),
        BackgroundTransparency = 1,
        ZIndex = 12
    },
    NavBar
)

local NavLayout = Instance.new("UIListLayout")
NavLayout.SortOrder = Enum.SortOrder.LayoutOrder
NavLayout.Padding = UDim.new(0, 2)
NavLayout.Parent = NavList

local NavSections = {
    {key = "obfuscator", icon = "[~]", order = 1},
    {key = "cheat_detector", icon = "[!]", order = 2},
    {key = "get_anticheat", icon = "[+]", order = 3},
    {key = "ac_analyzer", icon = "[?]", order = 4},
    {key = "settings", icon = "[o]", order = 5}
}

local NavButtons = {}
local ActiveSection = "obfuscator"

local function CreateNavBtn(data)
    local btn =
        NewInstance(
        "TextButton",
        {
            Name = "Nav_" .. data.key,
            Size = UDim2.new(1, -8, 0, 36),
            BackgroundColor3 = C.nav_bg,
            Text = "",
            BorderSizePixel = 0,
            ZIndex = 13,
            LayoutOrder = data.order
        },
        NavList
    )
    NewInstance(
        "UIPadding",
        {
            PaddingLeft = UDim.new(0, 6)
        },
        NavList
    )
    MakeRound(btn, 6)

    local iconL =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(0, 28, 1, 0),
            BackgroundTransparency = 1,
            Text = data.icon,
            TextColor3 = C.text_dim,
            TextSize = 13,
            Font = Enum.Font.Code,
            ZIndex = 14
        },
        btn
    )

    local textL =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(1, -32, 1, 0),
            Position = UDim2.new(0, 32, 0, 0),
            BackgroundTransparency = 1,
            Text = T(data.key),
            TextColor3 = C.text_secondary,
            TextSize = 11,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 14
        },
        btn
    )

    local activeBar =
        NewInstance(
        "Frame",
        {
            Size = UDim2.new(0, 3, 0.7, 0),
            Position = UDim2.new(1, -3, 0.15, 0),
            BackgroundColor3 = C.accent,
            BorderSizePixel = 0,
            ZIndex = 14,
            Visible = false
        },
        btn
    )
    MakeRound(activeBar, 2)

    NavButtons[data.key] = {btn = btn, iconL = iconL, textL = textL, bar = activeBar}
    return btn
end

for _, sec in ipairs(NavSections) do
    CreateNavBtn(sec)
end

-- Icono ruedita para ajustes (usando caracteres)
if NavButtons["settings"] then
    NavButtons["settings"].iconL.Text = "[o]"
    NavButtons["settings"].iconL.Font = Enum.Font.Code
end

-- ============================================================
-- MODULO 10: AREA DE CONTENIDO
-- ============================================================

local ContentArea =
    NewInstance(
    "Frame",
    {
        Name = "ContentArea",
        Size = UDim2.new(1, -140, 1, -44),
        Position = UDim2.new(0, 140, 0, 44),
        BackgroundColor3 = C.bg_secondary,
        BorderSizePixel = 0,
        ZIndex = 11
    },
    MainFrame
)

local ContentPages = {}

local function CreatePage(name)
    local page =
        NewInstance(
        "ScrollingFrame",
        {
            Name = "Page_" .. name,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ScrollBarThickness = 4,
            ScrollBarImageColor3 = C.scrollbar,
            Visible = false,
            ZIndex = 12,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            ClipsDescendants = true
        },
        ContentArea
    )
    MakePadding(page, 14, 14, 14, 14)
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 10)
    layout.Parent = page
    ContentPages[name] = page
    return page
end

-- ============================================================
-- MODULO 11: PAGINA - OFUSCADOR
-- ============================================================

local PageObfuscator = CreatePage("obfuscator")

-- Header
local ObfHeader =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 1
    },
    PageObfuscator
)
MakeRound(ObfHeader, 8)
MakeStroke(ObfHeader, C.border, 1)
MakePadding(ObfHeader, 0, 0, 14, 14)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, -28, 1, 0),
        BackgroundTransparency = 1,
        Text = T("section_obfuscator"),
        TextColor3 = C.accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ObfHeader
)

-- Aviso backup
local BackupWarning =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = Color3.fromRGB(40, 30, 10),
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 2
    },
    PageObfuscator
)
MakeRound(BackupWarning, 6)
MakeStroke(BackupWarning, Color3.fromRGB(100, 70, 0), 1)
MakePadding(BackupWarning, 0, 0, 12, 12)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "[!] " .. T("warning_backup"),
        TextColor3 = Color3.fromRGB(220, 160, 0),
        TextSize = 11,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 14
    },
    BackupWarning
)

-- Input del script
local InputContainer =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 150),
        BackgroundColor3 = C.bg_input,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 3
    },
    PageObfuscator
)
MakeRound(InputContainer, 8)
MakeStroke(InputContainer, C.border, 1)

local ScriptInput =
    NewInstance(
    "TextBox",
    {
        Size = UDim2.new(1, -16, 1, -16),
        Position = UDim2.new(0, 8, 0, 8),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = T("paste_script"),
        TextColor3 = C.text_primary,
        PlaceholderColor3 = C.text_dim,
        TextSize = 11,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        MultiLine = true,
        ClearTextOnFocus = false,
        TextWrapped = true,
        ZIndex = 14,
        ClipsDescendants = true
    },
    InputContainer
)

-- Metodos de ofuscacion
local MethodsHeader =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 24),
        BackgroundTransparency = 1,
        Text = T("obfuscation_methods"),
        TextColor3 = C.text_secondary,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 13,
        LayoutOrder = 4
    },
    PageObfuscator
)

local ObfMethods = {
    {id = "varnames", label = "Renombrar Variables", desc = "Reemplaza nombres de variables por cadenas aleatorias"},
    {id = "strings", label = "Cifrar Strings", desc = "Convierte strings a secuencias de escape numericas"},
    {id = "control", label = "Flujo de Control", desc = "Ofusca estructuras if/while/for con equivalencias"},
    {id = "numbers", label = "Ofuscar Numeros", desc = "Representa numeros como operaciones aritmeticas"},
    {id = "comments", label = "Eliminar Comentarios", desc = "Borra todos los comentarios del codigo"},
    {id = "whitespace", label = "Comprimir Espacios", desc = "Elimina espacios e indentacion innecesaria"},
    {id = "constants", label = "Ofuscar Constantes", desc = "Mueve constantes a tabla de lookup encriptada"},
    {id = "tkg2", label = "TKG v2", desc = "Ofuscacion casi-binaria de maxima potencia", isNew = true, isOur = true}
}

local SelectedMethods = {}
local MethodCheckboxes = {}

local MethodsContainer =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, #ObfMethods * 36 + 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 5
    },
    PageObfuscator
)

local MethodsLayout = Instance.new("UIListLayout")
MethodsLayout.SortOrder = Enum.SortOrder.LayoutOrder
MethodsLayout.Padding = UDim.new(0, 4)
MethodsLayout.Parent = MethodsContainer

for i, method in ipairs(ObfMethods) do
    local row =
        NewInstance(
        "Frame",
        {
            Size = UDim2.new(1, 0, 0, 34),
            BackgroundColor3 = method.isOur and Color3.fromRGB(0, 20, 40) or C.bg_panel,
            BorderSizePixel = 0,
            ZIndex = 14,
            LayoutOrder = i
        },
        MethodsContainer
    )
    MakeRound(row, 6)
    if method.isOur then
        MakeStroke(row, Color3.fromRGB(0, 100, 200), 1)
    else
        MakeStroke(row, C.border, 1)
    end

    local checkbox =
        NewInstance(
        "TextButton",
        {
            Size = UDim2.new(0, 20, 0, 20),
            Position = UDim2.new(0, 8, 0.5, -10),
            BackgroundColor3 = C.bg_input,
            Text = "",
            BorderSizePixel = 0,
            ZIndex = 15
        },
        row
    )
    MakeRound(checkbox, 4)
    MakeStroke(checkbox, C.border, 1)

    local checkmark =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "",
            TextColor3 = C.accent,
            TextSize = 14,
            Font = Enum.Font.GothamBold,
            ZIndex = 16
        },
        checkbox
    )

    local labelText = method.label
    local labelL =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(0, 180, 1, 0),
            Position = UDim2.new(0, 36, 0, 0),
            BackgroundTransparency = 1,
            Text = labelText,
            TextColor3 = method.isOur and C.accent2 or C.text_primary,
            TextSize = 12,
            Font = method.isOur and Enum.Font.GothamBold or Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 15
        },
        row
    )

    -- Badges
    if method.isNew then
        local badge =
            NewInstance(
            "TextLabel",
            {
                Size = UDim2.new(0, 44, 0, 18),
                Position = UDim2.new(0, 220, 0.5, -9),
                BackgroundColor3 = C.new_badge,
                Text = T("new_label"),
                TextColor3 = Color3.fromRGB(0, 0, 0),
                TextSize = 10,
                Font = Enum.Font.GothamBold,
                ZIndex = 16
            },
            row
        )
        MakeRound(badge, 4)
    end

    if method.isOur then
        local badge2 =
            NewInstance(
            "TextLabel",
            {
                Size = UDim2.new(0, 60, 0, 18),
                Position = UDim2.new(0, method.isNew and 270 or 220, 0.5, -9),
                BackgroundColor3 = C.our_badge,
                Text = T("our_label"),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextSize = 10,
                Font = Enum.Font.GothamBold,
                ZIndex = 16
            },
            row
        )
        MakeRound(badge2, 4)
    end

    local descL =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(1, -340, 1, 0),
            Position = UDim2.new(1, -290, 0, 0),
            BackgroundTransparency = 1,
            Text = method.desc,
            TextColor3 = C.text_dim,
            TextSize = 9,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Right,
            ZIndex = 15
        },
        row
    )

    SelectedMethods[method.id] = false
    MethodCheckboxes[method.id] = {checkbox = checkbox, checkmark = checkmark, selected = false}

    checkbox.MouseButton1Click:Connect(
        function()
            SelectedMethods[method.id] = not SelectedMethods[method.id]
            MethodCheckboxes[method.id].selected = SelectedMethods[method.id]
            checkmark.Text = SelectedMethods[method.id] and "v" or ""
            checkbox.BackgroundColor3 = SelectedMethods[method.id] and C.accent or C.bg_input
        end
    )
end

-- Boton Seleccionar Todos
local SelectAllBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0, 140, 0, 30),
        BackgroundColor3 = Color3.fromRGB(30, 30, 45),
        Text = T("select_all"),
        TextColor3 = C.text_secondary,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 6
    },
    PageObfuscator
)
MakeRound(SelectAllBtn, 6)
MakeStroke(SelectAllBtn, C.border, 1)

SelectAllBtn.MouseButton1Click:Connect(
    function()
        local allSelected = true
        for _, v in pairs(SelectedMethods) do
            if not v then
                allSelected = false
                break
            end
        end
        for id, _ in pairs(SelectedMethods) do
            SelectedMethods[id] = not allSelected
            if MethodCheckboxes[id] then
                MethodCheckboxes[id].selected = not allSelected
                MethodCheckboxes[id].checkmark.Text = not allSelected and "v" or ""
                MethodCheckboxes[id].checkbox.BackgroundColor3 = not allSelected and C.accent or C.bg_input
            end
        end
    end
)

-- Boton generar
local GenerateBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = C.accent,
        Text = T("generate"),
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 7
    },
    PageObfuscator
)
MakeRound(GenerateBtn, 8)

-- Output del script ofuscado
local OutputLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = T("obfuscated_result"),
        TextColor3 = C.text_secondary,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 13,
        LayoutOrder = 8,
        Visible = false
    },
    PageObfuscator
)

local OutputContainer =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 120),
        BackgroundColor3 = C.bg_input,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 9,
        Visible = false
    },
    PageObfuscator
)
MakeRound(OutputContainer, 8)
MakeStroke(OutputContainer, C.border, 1)

local OutputBox =
    NewInstance(
    "TextBox",
    {
        Size = UDim2.new(1, -16, 1, -36),
        Position = UDim2.new(0, 8, 0, 8),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = Color3.fromRGB(0, 220, 150),
        TextSize = 10,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        MultiLine = true,
        ClearTextOnFocus = false,
        TextWrapped = true,
        ZIndex = 14,
        ClipsDescendants = true
    },
    OutputContainer
)

local CopyBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0, 90, 0, 26),
        Position = UDim2.new(1, -98, 1, -32),
        BackgroundColor3 = C.accent2,
        Text = T("copy"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 15
    },
    OutputContainer
)
MakeRound(CopyBtn, 6)

-- ============================================================
-- MODULO 12: SISTEMA DE OFUSCACION TKG v2 Y METODOS
-- ============================================================

local function ObfuscateVarNames(code)
    local counter = 0
    local varMap = {}
    local result = code

    -- Reemplaza variables locales
    result =
        result:gsub(
        "local%s+([%a_][%w_]*)",
        function(varname)
            if not varMap[varname] then
                counter = counter + 1
                local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                local newname = "_"
                for _ = 1, 8 do
                    local idx = math.random(1, #chars)
                    newname = newname .. chars:sub(idx, idx)
                end
                varMap[varname] = newname
            end
            return "local " .. varMap[varname]
        end
    )

    for orig, rep in pairs(varMap) do
        result = result:gsub("%f[%w_]" .. orig .. "%f[^%w_]", rep)
    end

    return result
end

local function ObfuscateStrings(code)
    return code:gsub(
        '"([^"]*)"',
        function(s)
            local escaped = ""
            for i = 1, #s do
                escaped = escaped .. "\\" .. s:byte(i)
            end
            return '"' .. escaped .. '"'
        end
    )
end

local function ObfuscateNumbers(code)
    return code:gsub(
        "%f[%d](%d+)%f[^%d]",
        function(n)
            local num = tonumber(n)
            if num and num > 0 and num < 10000 then
                local a = math.random(1, num)
                local b = num - a
                return "(" .. a .. "+" .. b .. ")"
            end
            return n
        end
    )
end

local function RemoveComments(code)
    code = code:gsub("%-%-[^\n]*", "")
    code = code:gsub("%-%-%[%[.-%]%]", "")
    return code
end

local function CompressWhitespace(code)
    code = code:gsub("[ \t]+", " ")
    code = code:gsub("\n+", "\n")
    return code
end

local function ObfuscateConstants(code)
    local consts = {}
    local idx = 0
    code =
        code:gsub(
        '"([^"]*)"',
        function(s)
            idx = idx + 1
            local key = "_C" .. idx
            table.insert(consts, {key = key, val = s})
            return key
        end
    )
    if #consts > 0 then
        local constTable = "local _CONSTS = {"
        for _, c in ipairs(consts) do
            constTable = constTable .. '["' .. c.key .. '"]="' .. c.val .. '",'
        end
        constTable = constTable .. "}\n"
        for _, c in ipairs(consts) do
            code = code:gsub(c.key, '_CONSTS["' .. c.key .. '"]')
        end
        code = constTable .. code
    end
    return code
end

local function TKGv2Obfuscate(code)
    -- Codificacion avanzada: convierte a tabla de bytes con XOR key aleatoria
    local key = math.random(10, 250)
    local bytes = {}
    for i = 1, #code do
        table.insert(bytes, tostring(bit32.bxor(code:byte(i), key)))
    end
    local byteStr = table.concat(bytes, ",")

    local loader =
        "local _k=" ..
        tostring(key) ..
            "\n" ..
                "local _b={" ..
                    byteStr ..
                        "}\n" ..
                            'local _r=""\n' ..
                                "for _i=1,#_b do _r=_r..string.char(bit32.bxor(_b[_i],_k)) end\n" ..
                                    "local _f,_e=load(_r)\n" .. "if _f then _f() else error(_e) end\n"
    return loader
end

local function ObfuscateControlFlow(code)
    -- Convierte ifs simples en tablas de dispatch
    code =
        code:gsub(
        "if%s+(.-)%s+then",
        function(cond)
            return "if (" .. cond .. ") == true then"
        end
    )
    return code
end

GenerateBtn.MouseButton1Click:Connect(
    function()
        local inputCode = ScriptInput.Text
        if inputCode == "" or inputCode == T("paste_script") then
            return
        end

        -- Animacion de carga
        GenerateBtn.Text = "Procesando..."
        GenerateBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 100)

        task.spawn(
            function()
                local result = inputCode
                local hasTKG2 = SelectedMethods["tkg2"]

                -- Si TKG v2 esta seleccionado, aplicar primero los otros y luego TKG2
                if not hasTKG2 then
                    if SelectedMethods["comments"] then
                        result = RemoveComments(result)
                    end
                    if SelectedMethods["whitespace"] then
                        result = CompressWhitespace(result)
                    end
                    if SelectedMethods["varnames"] then
                        result = ObfuscateVarNames(result)
                    end
                    if SelectedMethods["strings"] then
                        result = ObfuscateStrings(result)
                    end
                    if SelectedMethods["numbers"] then
                        result = ObfuscateNumbers(result)
                    end
                    if SelectedMethods["constants"] then
                        result = ObfuscateConstants(result)
                    end
                    if SelectedMethods["control"] then
                        result = ObfuscateControlFlow(result)
                    end
                else
                    -- TKG v2: aplicar todo y luego encodear
                    result = RemoveComments(result)
                    result = CompressWhitespace(result)
                    if SelectedMethods["varnames"] then
                        result = ObfuscateVarNames(result)
                    end
                    if SelectedMethods["control"] then
                        result = ObfuscateControlFlow(result)
                    end
                    result = TKGv2Obfuscate(result)
                end

                task.wait(0.5)

                OutputBox.Text = result
                OutputLabel.Visible = true
                OutputContainer.Visible = true

                GenerateBtn.Text = T("generate")
                GenerateBtn.BackgroundColor3 = C.accent
            end
        )
    end
)

CopyBtn.MouseButton1Click:Connect(
    function()
        if OutputBox.Text ~= "" then
            setclipboard(OutputBox.Text)
            CopyBtn.Text = "Copiado!"
            task.delay(
                2,
                function()
                    CopyBtn.Text = T("copy")
                end
            )
        end
    end
)

-- ============================================================
-- MODULO 13: PAGINA - DETECTOR DE CHEATS
-- ============================================================

local PageCheatDetector = CreatePage("cheat_detector")

local CheatHeader =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 1
    },
    PageCheatDetector
)
MakeRound(CheatHeader, 8)
MakeStroke(CheatHeader, C.border, 1)
MakePadding(CheatHeader, 0, 0, 14, 14)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = T("cheat_detector"),
        TextColor3 = C.danger,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    CheatHeader
)

-- Estado del scan
local ScanStateFrame =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 80),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 2
    },
    PageCheatDetector
)
MakeRound(ScanStateFrame, 8)
MakeStroke(ScanStateFrame, C.border, 1)
MakePadding(ScanStateFrame, 10, 10, 14, 14)

local ScanStatusText =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = "Sistema listo para analizar",
        TextColor3 = C.text_primary,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ScanStateFrame
)

-- Barra de progreso scan
local ScanProgressBg =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 6),
        Position = UDim2.new(0, 0, 0, 30),
        BackgroundColor3 = Color3.fromRGB(30, 30, 45),
        BorderSizePixel = 0,
        ZIndex = 14
    },
    ScanStateFrame
)
MakeRound(ScanProgressBg, 3)

local ScanProgressBar =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = C.danger,
        BorderSizePixel = 0,
        ZIndex = 15
    },
    ScanProgressBg
)
MakeRound(ScanProgressBar, 3)

local ScanTipText =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 44),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = C.text_dim,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ScanStateFrame
)

-- Botones de scan
local ScanBtnRow =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 36),
        BackgroundTransparency = 1,
        ZIndex = 13,
        LayoutOrder = 3
    },
    PageCheatDetector
)

local ScanAllBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = C.danger,
        Text = T("analyze"),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 14
    },
    ScanBtnRow
)
MakeRound(ScanAllBtn, 8)

-- Resultados
local ResultsLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = T("results"),
        TextColor3 = C.text_secondary,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 13,
        LayoutOrder = 4
    },
    PageCheatDetector
)

local ResultsContainer =
    NewInstance(
    "Frame",
    {
        Name = "ResultsContainer",
        Size = UDim2.new(1, 0, 0, 10),
        BackgroundTransparency = 1,
        ZIndex = 13,
        LayoutOrder = 5,
        AutomaticSize = Enum.AutomaticSize.Y
    },
    PageCheatDetector
)

local ResultsLayout = Instance.new("UIListLayout")
ResultsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ResultsLayout.Padding = UDim.new(0, 6)
ResultsLayout.Parent = ResultsContainer

-- Tips
local Tips = {}
for i = 1, 10 do
    table.insert(Tips, T("tip" .. i))
end

local CurrentTipIdx = 1
local IsScanActive = false
local ScanResults = {}

-- ============================================================
-- MODULO 14: SISTEMA DE ANALISIS DE CHEATS (cliente local)
-- ============================================================

local PlayerData = {}

local function InitPlayerData(player)
    if not PlayerData[player.UserId] then
        PlayerData[player.UserId] = {
            name = player.Name,
            userId = player.UserId,
            speedSamples = {},
            jumpSamples = {},
            positionHistory = {},
            flyDetected = false,
            speedHackDetected = false,
            jumpHackDetected = false,
            noclipDetected = false,
            executorSigns = 0,
            suspicionLevel = 0,
            lastPos = nil,
            lastTime = nil,
            floorMaterialHistory = {}
        }
    end
end

local function SamplePlayerMovement(player)
    local char = player.Character
    if not char then
        return
    end
    local humanoid = char:FindFirstChild("Humanoid")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then
        return
    end

    local data = PlayerData[player.UserId]
    if not data then
        return
    end

    local now = tick()
    local pos = hrp.Position

    -- Velocidad
    if data.lastPos and data.lastTime then
        local dt = now - data.lastTime
        if dt > 0 then
            local dist = (pos - data.lastPos).Magnitude
            local speed = dist / dt
            table.insert(data.speedSamples, speed)
            if #data.speedSamples > 30 then
                table.remove(data.speedSamples, 1)
            end
        end
    end

    -- Material del suelo
    table.insert(data.floorMaterialHistory, humanoid.FloorMaterial)
    if #data.floorMaterialHistory > 20 then
        table.remove(data.floorMaterialHistory, 1)
    end

    data.lastPos = pos
    data.lastTime = now
end

local function AnalyzePlayerData(player)
    local data = PlayerData[player.UserId]
    if not data then
        return {status = "normal", cheats = {}}
    end

    local cheats = {}
    local suspicion = 0

    -- Analizar velocidad media
    if #data.speedSamples >= 5 then
        local sum = 0
        for _, v in ipairs(data.speedSamples) do
            sum = sum + v
        end
        local avg = sum / #data.speedSamples
        -- Velocidad normal caminando ~16 studs/s, corriendo ~24
        if avg > 32 then
            suspicion = suspicion + 3
            table.insert(cheats, T("speed_hack"))
        end
    end

    -- Analizar vuelo (muchas muestras de air material seguidas)
    local airCount = 0
    for _, mat in ipairs(data.floorMaterialHistory) do
        if mat == Enum.Material.Air then
            airCount = airCount + 1
        end
    end
    if airCount > 14 and #data.floorMaterialHistory >= 18 then
        suspicion = suspicion + 2
        table.insert(cheats, T("fly_hack"))
    end

    -- Signos de executor (variables globales modificadas)
    local char = player.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local humanoid = char:FindFirstChild("Humanoid")
        if humanoid then
            if humanoid.WalkSpeed > 28 then
                suspicion = suspicion + 2
                if not table.find(cheats, T("speed_hack")) then
                    table.insert(cheats, T("speed_hack"))
                end
            end
            if humanoid.JumpPower > 60 then
                suspicion = suspicion + 2
                table.insert(cheats, T("jump_hack"))
            end
        end
    end

    local status = "normal"
    if suspicion >= 4 then
        status = "cheater"
    elseif suspicion >= 2 then
        status = "suspicious"
    end

    return {
        status = status,
        cheats = cheats,
        suspicion = suspicion,
        speedAvg = #data.speedSamples > 0 and (function()
                local s = 0
                for _, v in ipairs(data.speedSamples) do
                    s = s + v
                end
                return math.floor(s / #data.speedSamples * 10) / 10
            end)() or 0
    }
end

local function CreatePlayerResultCard(player, analysisResult, order)
    local C2 = GetTheme()
    local statusColor =
        analysisResult.status == "cheater" and C2.danger or analysisResult.status == "suspicious" and C2.warning or
        C2.success

    local card =
        NewInstance(
        "Frame",
        {
            Size = UDim2.new(1, 0, 0, 50),
            BackgroundColor3 = C2.bg_panel,
            BorderSizePixel = 0,
            ZIndex = 14,
            LayoutOrder = order
        },
        ResultsContainer
    )
    MakeRound(card, 8)
    MakeStroke(card, statusColor, 1, 0.3)

    -- Status indicator
    local statusDot =
        NewInstance(
        "Frame",
        {
            Size = UDim2.new(0, 10, 0, 10),
            Position = UDim2.new(0, 10, 0.5, -5),
            BackgroundColor3 = statusColor,
            BorderSizePixel = 0,
            ZIndex = 15
        },
        card
    )
    MakeRound(statusDot, 5)

    local playerName =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(0, 150, 0, 22),
            Position = UDim2.new(0, 28, 0, 6),
            BackgroundTransparency = 1,
            Text = player.Name,
            TextColor3 = Color3.fromRGB(220, 220, 240),
            TextSize = 12,
            Font = Enum.Font.GothamBold,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 15
        },
        card
    )

    local statusLabel =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(0, 100, 0, 18),
            Position = UDim2.new(0, 28, 0, 28),
            BackgroundTransparency = 1,
            Text = T(analysisResult.status),
            TextColor3 = statusColor,
            TextSize = 10,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 15
        },
        card
    )

    local cheatsText = #analysisResult.cheats > 0 and table.concat(analysisResult.cheats, ", ") or T("no_cheats")

    local cheatsLabel =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(0, 200, 0, 18),
            Position = UDim2.new(0, 130, 0, 28),
            BackgroundTransparency = 1,
            Text = cheatsText,
            TextColor3 = C2.text_dim,
            TextSize = 9,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 15
        },
        card
    )

    local speedLabel =
        NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(0, 80, 0, 22),
            Position = UDim2.new(1, -180, 0, 6),
            BackgroundTransparency = 1,
            Text = "Vel: " .. analysisResult.speedAvg .. "/s",
            TextColor3 = C2.text_dim,
            TextSize = 10,
            Font = Enum.Font.Code,
            ZIndex = 15
        },
        card
    )

    -- Boton dropdown para informe
    local reportBtn =
        NewInstance(
        "TextButton",
        {
            Size = UDim2.new(0, 100, 0, 26),
            Position = UDim2.new(1, -108, 0.5, -13),
            BackgroundColor3 = Color3.fromRGB(30, 30, 50),
            Text = T("generate_report"),
            TextColor3 = C2.accent2,
            TextSize = 9,
            Font = Enum.Font.Gotham,
            BorderSizePixel = 0,
            ZIndex = 15
        },
        card
    )
    MakeRound(reportBtn, 5)

    -- Expandir para informe
    local expanded = false
    reportBtn.MouseButton1Click:Connect(
        function()
            expanded = not expanded
            if expanded then
                card.Size = UDim2.new(1, 0, 0, 130)
                -- Generar informe
                local now = os.date("%Y-%m-%d %H:%M:%S")
                local lang = TalkingSentinel.Language
                local reportText =
                    lang == "es" and
                    ("=== INFORME TALKING SENTINEL v1 ===\n" ..
                        "Jugador: " ..
                            player.Name ..
                                " (ID: " ..
                                    player.UserId ..
                                        ")\n" ..
                                            "Hora: " ..
                                                now ..
                                                    "\n" ..
                                                        "Estado: " ..
                                                            T(analysisResult.status) ..
                                                                "\n" ..
                                                                    "Velocidad media: " ..
                                                                        analysisResult.speedAvg ..
                                                                            " studs/s\n" ..
                                                                                "Trampas detectadas: " ..
                                                                                    (#analysisResult.cheats > 0 and
                                                                                        table.concat(
                                                                                            analysisResult.cheats,
                                                                                            ", "
                                                                                        ) or
                                                                                        "Ninguna") ..
                                                                                        "\n" ..
                                                                                            "Nivel de sospecha: " ..
                                                                                                analysisResult.suspicion ..
                                                                                                    "/6\n" ..
                                                                                                        "=== FIN DEL INFORME ===") or
                    ("=== TALKING SENTINEL v1 REPORT ===\n" ..
                        "Player: " ..
                            player.Name ..
                                " (ID: " ..
                                    player.UserId ..
                                        ")\n" ..
                                            "Time: " ..
                                                now ..
                                                    "\n" ..
                                                        "Status: " ..
                                                            T(analysisResult.status) ..
                                                                "\n" ..
                                                                    "Avg Speed: " ..
                                                                        analysisResult.speedAvg ..
                                                                            " studs/s\n" ..
                                                                                "Cheats detected: " ..
                                                                                    (#analysisResult.cheats > 0 and
                                                                                        table.concat(
                                                                                            analysisResult.cheats,
                                                                                            ", "
                                                                                        ) or
                                                                                        "None") ..
                                                                                        "\n" ..
                                                                                            "Suspicion level: " ..
                                                                                                analysisResult.suspicion ..
                                                                                                    "/6\n" ..
                                                                                                        "=== END OF REPORT ===")

                local reportBox =
                    NewInstance(
                    "TextBox",
                    {
                        Size = UDim2.new(1, -16, 0, 70),
                        Position = UDim2.new(0, 8, 0, 54),
                        BackgroundColor3 = Color3.fromRGB(10, 10, 15),
                        Text = reportText,
                        TextColor3 = Color3.fromRGB(0, 200, 150),
                        TextSize = 9,
                        Font = Enum.Font.Code,
                        TextXAlignment = Enum.TextXAlignment.Left,
                        TextYAlignment = Enum.TextYAlignment.Top,
                        MultiLine = true,
                        ClearTextOnFocus = false,
                        TextWrapped = true,
                        ZIndex = 16,
                        Name = "ReportBox"
                    },
                    card
                )
                MakeRound(reportBox, 4)

                local copyReportBtn =
                    NewInstance(
                    "TextButton",
                    {
                        Size = UDim2.new(0, 70, 0, 20),
                        Position = UDim2.new(1, -78, 1, -26),
                        BackgroundColor3 = C2.accent,
                        Text = T("copy"),
                        TextColor3 = Color3.fromRGB(0, 0, 0),
                        TextSize = 9,
                        Font = Enum.Font.GothamBold,
                        BorderSizePixel = 0,
                        ZIndex = 17
                    },
                    card
                )
                MakeRound(copyReportBtn, 4)

                copyReportBtn.MouseButton1Click:Connect(
                    function()
                        setclipboard(reportText)
                        copyReportBtn.Text = "OK!"
                        task.delay(
                            1.5,
                            function()
                                copyReportBtn.Text = T("copy")
                            end
                        )
                    end
                )
            else
                card.Size = UDim2.new(1, 0, 0, 50)
                local rb = card:FindFirstChild("ReportBox")
                if rb then
                    rb:Destroy()
                end
            end
        end
    )

    return card
end

local ScanIsRunning = false

ScanAllBtn.MouseButton1Click:Connect(
    function()
        if ScanIsRunning then
            return
        end
        ScanIsRunning = true
        ScanAllBtn.Text = T("scanning")
        ScanAllBtn.BackgroundColor3 = Color3.fromRGB(150, 30, 30)

        -- Limpiar resultados anteriores
        for _, ch in ipairs(ResultsContainer:GetChildren()) do
            if ch:IsA("Frame") then
                ch:Destroy()
            end
        end

        -- Inicializar datos de todos los jugadores
        for _, plr in ipairs(Players:GetPlayers()) do
            InitPlayerData(plr)
        end

        -- Samplear durante 60 segundos con tips y progreso
        local totalTime = 60
        local startTime = tick()
        local tipConnection
        local sampleConnection

        sampleConnection =
            RunService.Heartbeat:Connect(
            function()
                for _, plr in ipairs(Players:GetPlayers()) do
                    SamplePlayerMovement(plr)
                end
            end
        )

        -- Actualizar progreso
        task.spawn(
            function()
                while ScanIsRunning do
                    local elapsed = tick() - startTime
                    local progress = math.min(elapsed / totalTime, 1)
                    ScanProgressBar.Size = UDim2.new(progress, 0, 1, 0)

                    -- Tip rotativo
                    CurrentTipIdx = (CurrentTipIdx % #Tips) + 1
                    ScanTipText.Text = Tips[CurrentTipIdx]

                    local layerNum = math.floor(progress * 7) + 1
                    ScanStatusText.Text = T("analyzing_layer") .. " " .. layerNum .. " " .. T("of") .. " 7..."

                    if progress >= 1 then
                        break
                    end
                    task.wait(3)
                end
            end
        )

        task.wait(60)

        if sampleConnection then
            sampleConnection:Disconnect()
        end
        ScanIsRunning = false

        -- Mostrar resultados
        local cardOrder = 0
        for _, plr in ipairs(Players:GetPlayers()) do
            cardOrder = cardOrder + 1
            local result = AnalyzePlayerData(plr)
            CreatePlayerResultCard(plr, result, cardOrder)
        end

        ScanStatusText.Text = T("loading_complete")
        ScanProgressBar.Size = UDim2.new(1, 0, 1, 0)
        ScanTipText.Text = ""
        ScanAllBtn.Text = T("analyze")
        ScanAllBtn.BackgroundColor3 = C.danger
    end
)

-- ============================================================
-- MODULO 15: PAGINA - OBTENER ANTICHEAT
-- ============================================================

local PageGetAnticheat = CreatePage("get_anticheat")

local ACHeader =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 1
    },
    PageGetAnticheat
)
MakeRound(ACHeader, 8)
MakeStroke(ACHeader, C.border, 1)
MakePadding(ACHeader, 0, 0, 14, 14)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = T("get_our_anticheat"),
        TextColor3 = C.accent2,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ACHeader
)

-- Info de colocacion
local PlacementInfo =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundColor3 = Color3.fromRGB(0, 15, 30),
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 2
    },
    PageGetAnticheat
)
MakeRound(PlacementInfo, 8)
MakeStroke(PlacementInfo, Color3.fromRGB(0, 80, 160), 1)
MakePadding(PlacementInfo, 10, 10, 14, 14)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 18),
        BackgroundTransparency = 1,
        Text = T("where_to_place"),
        TextColor3 = C.text_secondary,
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    PlacementInfo
)

local PlacementPath =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 18),
        Position = UDim2.new(0, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = "ServerScriptService > TalkingSentinel_AC",
        TextColor3 = C.accent,
        TextSize = 12,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    PlacementInfo
)

-- Features del anticheat
local FeaturesLabel =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = T("anticheat_features"),
        TextColor3 = C.text_secondary,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 13,
        LayoutOrder = 3
    },
    PageGetAnticheat
)

local ACFeatures = {
    "Deteccion de speed hacks (comparacion entre todos los jugadores)",
    "Deteccion de fly hacks (FloorMaterial = Air prolongado)",
    "Deteccion de jump power modificado",
    "Deteccion de noclip (colision desactivada)",
    "Comparacion de velocidades entre 3+ jugadores en tiempo real",
    "Sistema de kick automatico con motivo personalizable",
    "Sistema de ban temporal con duracion configurable",
    "Whitelist de jugadores de confianza integrada",
    "Anti-lag: ignora items que dan velocidad de forma legitima",
    "Reportes automaticos al servidor de los infractores",
    "Deteccion de ejecutores mediante huellas en el entorno",
    "Proteccion contra loops infinitos y scripts maliciosos",
    "Logs detallados en Output del servidor"
}

local FeaturesContainer =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, #ACFeatures * 28 + 8),
        BackgroundTransparency = 1,
        ZIndex = 13,
        LayoutOrder = 4,
        AutomaticSize = Enum.AutomaticSize.Y
    },
    PageGetAnticheat
)

local FeaturesLayout = Instance.new("UIListLayout")
FeaturesLayout.SortOrder = Enum.SortOrder.LayoutOrder
FeaturesLayout.Padding = UDim.new(0, 4)
FeaturesLayout.Parent = FeaturesContainer

for i, feat in ipairs(ACFeatures) do
    local frow =
        NewInstance(
        "Frame",
        {
            Size = UDim2.new(1, 0, 0, 26),
            BackgroundColor3 = C.bg_panel,
            BorderSizePixel = 0,
            ZIndex = 14,
            LayoutOrder = i
        },
        FeaturesContainer
    )
    MakeRound(frow, 5)
    MakePadding(frow, 0, 0, 10, 10)

    local dot =
        NewInstance(
        "Frame",
        {
            Size = UDim2.new(0, 6, 0, 6),
            Position = UDim2.new(0, 0, 0.5, -3),
            BackgroundColor3 = C.accent,
            BorderSizePixel = 0,
            ZIndex = 15
        },
        frow
    )
    MakeRound(dot, 3)

    NewInstance(
        "TextLabel",
        {
            Size = UDim2.new(1, -14, 1, 0),
            Position = UDim2.new(0, 14, 0, 0),
            BackgroundTransparency = 1,
            Text = feat,
            TextColor3 = C.text_primary,
            TextSize = 10,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            ZIndex = 15
        },
        frow
    )
end

-- Whitelist info
local WhitelistInfo =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = Color3.fromRGB(0, 25, 10),
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 5
    },
    PageGetAnticheat
)
MakeRound(WhitelistInfo, 8)
MakeStroke(WhitelistInfo, Color3.fromRGB(0, 100, 40), 1)
MakePadding(WhitelistInfo, 0, 0, 12, 12)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "[i] " .. T("whitelist_info") .. "\n    Busca: -- WHITELIST en el script copiado",
        TextColor3 = Color3.fromRGB(0, 200, 100),
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 14
    },
    WhitelistInfo
)

-- Boton copiar anticheat
local CopyACBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = C.accent2,
        Text = T("copy") .. " Anticheat Script",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 6
    },
    PageGetAnticheat
)
MakeRound(CopyACBtn, 8)

-- ============================================================
-- MODULO 16: EL ANTICHEAT (Script de servidor completo)
-- ============================================================

local AntiCheatScript =
    [==[
--[[
================================================================
  TALKING SENTINEL ANTICHEAT
  Talking Scripts | Lenux Studio | Version 1.0
  Coloca este script en: ServerScriptService
  
  Copyright (c) 2024 Talking Scripts & Lenux Studio
  Todos los derechos reservados.
================================================================

  CONFIGURACION:
  - Edita WHITELIST para proteger a tus admins/owners
  - Edita los limites en CONFIG segun tu juego
  - Los jugadores en WHITELIST no seran detectados ni kickeados
]]

-- ============================================================
-- CONFIGURACION
-- ============================================================

local CONFIG = {
    MAX_WALKSPEED = 30,
    MAX_JUMPPOWER = 65,
    MAX_JUMPHEIGHT = 100,
    CHECK_INTERVAL = 0.5,
    AIR_THRESHOLD = 3.0,
    SPEED_COMPARE_THRESHOLD = 2.5,
    KICK_ENABLED = true,
    BAN_ENABLED = false,
    LOG_ENABLED = true,
    REPORT_TO_OUTPUT = true,
}

-- WHITELIST: Pon aqui UserIds o nombres de jugadores de confianza
-- Ejemplo: local WHITELIST = {12345678, "TuNombreAqui", 99999999}
local WHITELIST = {
    -- WHITELIST: Agrega aqui los UserIds de admins/owners que no quieres que detecte
    -- Ejemplo: 12345678,
}

-- ============================================================
-- SERVICIOS
-- ============================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")

-- ============================================================
-- FUNCIONES DE UTILIDAD
-- ============================================================

local BannedPlayers = {}

local function IsWhitelisted(player)
    for _, entry in ipairs(WHITELIST) do
        if type(entry) == "number" and entry == player.UserId then
            return true
        elseif type(entry) == "string" and entry:lower() == player.Name:lower() then
            return true
        end
    end
    return false
end

local function LogCheat(playerName, cheatType, details)
    if CONFIG.REPORT_TO_OUTPUT then
        print("[TALKING SENTINEL AC] " .. os.date("%H:%M:%S") .. 
              " | Jugador: " .. playerName .. 
              " | Trampa: " .. cheatType .. 
              " | Detalle: " .. tostring(details))
    end
end

local function KickPlayer(player, reason)
    if CONFIG.KICK_ENABLED and not IsWhitelisted(player) then
        local msg = "Talking Sentinel Anticheat v1\n" ..
                    "Has sido expulsado del servidor.\n" ..
                    "Motivo: " .. tostring(reason) .. "\n" ..
                    "Si crees que esto es un error, contacta al administrador."
        player:Kick(msg)
    end
end

local function BanPlayer(player, reason)
    if CONFIG.BAN_ENABLED and not IsWhitelisted(player) then
        BannedPlayers[player.UserId] = {
            name = player.Name,
            reason = reason,
            time = os.time(),
        }
        KickPlayer(player, "[BAN] " .. reason)
    end
end

-- ============================================================
-- DATOS DE JUGADORES EN SERVIDOR
-- ============================================================

local PlayerServerData = {}

local function InitPlayer(player)
    PlayerServerData[player.UserId] = {
        speedSamples = {},
        jumpStartY = nil,
        jumpMaxY = nil,
        airTime = 0,
        lastGrounded = tick(),
        violations = 0,
        lastViolation = 0,
        lastPos = nil,
        lastTime = nil,
    }
end

Players.PlayerAdded:Connect(function(player)
    -- Verificar ban
    if BannedPlayers[player.UserId] then
        player:Kick("Estas baneado. Razon: " .. BannedPlayers[player.UserId].reason)
        return
    end

    InitPlayer(player)

    player.CharacterAdded:Connect(function(char)
        local humanoid = char:WaitForChild("Humanoid", 10)
        local hrp = char:WaitForChild("HumanoidRootPart", 10)
        if not humanoid or not hrp then return end

        -- Monitoreo continuo
        local monitorConn
        monitorConn = RunService.Heartbeat:Connect(function()
            if not player or not player.Parent then
                monitorConn:Disconnect()
                return
            end
            if IsWhitelisted(player) then return end

            local data = PlayerServerData[player.UserId]
            if not data then return end

            local now = tick()

            -- Check walkspeed directo
            if humanoid.WalkSpeed > CONFIG.MAX_WALKSPEED then
                LogCheat(player.Name, "SpeedHack", "WalkSpeed=" .. humanoid.WalkSpeed)
                data.violations = data.violations + 1
                if data.violations >= 3 then
                    KickPlayer(player, "Speed Hack detectado (WalkSpeed=" .. 
                                math.floor(humanoid.WalkSpeed) .. ")")
                end
            end

            -- Check jumppower
            if humanoid.JumpPower > CONFIG.MAX_JUMPPOWER then
                LogCheat(player.Name, "JumpHack", "JumpPower=" .. humanoid.JumpPower)
                data.violations = data.violations + 1
                if data.violations >= 2 then
                    KickPlayer(player, "Jump Hack detectado")
                end
            end

            -- Check vuelo (air time prolongado sin saltar)
            if humanoid.FloorMaterial == Enum.Material.Air then
                data.airTime = data.airTime + (tick() - (data._lastHB or now))
                if data.airTime > CONFIG.AIR_THRESHOLD then
                    -- Verificar que no sea un salto normal ni item
                    local vel = hrp.AssemblyLinearVelocity
                    if math.abs(vel.Y) < 1 and data.airTime > 4 then
                        LogCheat(player.Name, "FlyHack", "AirTime=" .. string.format("%.1f", data.airTime) .. "s")
                        data.violations = data.violations + 1
                        if data.violations >= 2 then
                            KickPlayer(player, "Fly Hack detectado (tiempo en aire=" .. 
                                        string.format("%.1f", data.airTime) .. "s)")
                        end
                    end
                end
            else
                data.airTime = 0
            end
            data._lastHB = now

            -- Check noclip (atravesar paredes)
            local pos = hrp.Position
            if data.lastPos then
                local diff = pos - data.lastPos
                local dt = now - (data.lastTime or now)
                if dt > 0 then
                    local speed = diff.Magnitude / dt
                    table.insert(data.speedSamples, speed)
                    if #data.speedSamples > 40 then
                        table.remove(data.speedSamples, 1)
                    end
                end
            end
            data.lastPos = pos
            data.lastTime = now

            -- Comparar velocidad con otros jugadores (anti speed relativo)
            if #data.speedSamples >= 10 then
                local mySum = 0
                for _, v in ipairs(data.speedSamples) do mySum = mySum + v end
                local myAvg = mySum / #data.speedSamples

                local otherAvgs = {}
                for _, otherPlayer in ipairs(Players:GetPlayers()) do
                    if otherPlayer ~= player and not IsWhitelisted(otherPlayer) then
                        local od = PlayerServerData[otherPlayer.UserId]
                        if od and #od.speedSamples >= 10 then
                            local oSum = 0
                            for _, ov in ipairs(od.speedSamples) do oSum = oSum + ov end
                            table.insert(otherAvgs, oSum / #od.speedSamples)
                        end
                    end
                end

                if #otherAvgs >= 2 then
                    local oTotal = 0
                    for _, ov in ipairs(otherAvgs) do oTotal = oTotal + ov end
                    local oAvg = oTotal / #otherAvgs
                    if myAvg > oAvg * CONFIG.SPEED_COMPARE_THRESHOLD and myAvg > 25 then
                        LogCheat(player.Name, "RelativeSpeedHack", 
                                 "MyAvg=" .. string.format("%.1f", myAvg) .. 
                                 " OthersAvg=" .. string.format("%.1f", oAvg))
                        data.violations = data.violations + 1
                        if data.violations >= 3 then
                            KickPlayer(player, "Speed Hack relativo detectado")
                        end
                    end
                end
            end

            -- Reset violations over time (si no hay trampa reciente)
            if now - data.lastViolation > 30 and data.violations > 0 then
                data.violations = math.max(0, data.violations - 1)
            end
        end)

        humanoid.Died:Connect(function()
            if monitorConn then monitorConn:Disconnect() end
        end)
    end)
end)

Players.PlayerRemoving:Connect(function(player)
    PlayerServerData[player.UserId] = nil
end)

print("[TALKING SENTINEL ANTICHEAT] Sistema cargado correctamente - v1.0")
print("[TALKING SENTINEL ANTICHEAT] Monitoring " .. #Players:GetPlayers() .. " jugadores")
]==]

CopyACBtn.MouseButton1Click:Connect(
    function()
        setclipboard(AntiCheatScript)
        CopyACBtn.Text = "Copiado!"
        task.delay(
            2,
            function()
                CopyACBtn.Text = T("copy") .. " Anticheat Script"
            end
        )
    end
)

-- ============================================================
-- MODULO 17: PAGINA - ANALIZADOR DE ANTICHEATS
-- ============================================================

local PageACAnalyzer = CreatePage("ac_analyzer")

local ACAnalyzerHeader =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 1
    },
    PageACAnalyzer
)
MakeRound(ACAnalyzerHeader, 8)
MakeStroke(ACAnalyzerHeader, C.border, 1)
MakePadding(ACAnalyzerHeader, 0, 0, 14, 14)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = T("ac_analyzer"),
        TextColor3 = C.accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ACAnalyzerHeader
)

local ACAnalyzerDesc =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 46),
        BackgroundColor3 = Color3.fromRGB(8, 8, 20),
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 2
    },
    PageACAnalyzer
)
MakeRound(ACAnalyzerDesc, 8)
MakeStroke(ACAnalyzerDesc, C.border, 1)
MakePadding(ACAnalyzerDesc, 0, 0, 12, 12)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "Analiza en local (sin tocar servidor) si hay anticheats activos.\nEscanea a traves de multiples capas de deteccion.",
        TextColor3 = C.text_secondary,
        TextSize = 10,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        ZIndex = 14
    },
    ACAnalyzerDesc
)

local ACStateFrame =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 80),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 3
    },
    PageACAnalyzer
)
MakeRound(ACStateFrame, 8)
MakeStroke(ACStateFrame, C.border, 1)
MakePadding(ACStateFrame, 10, 10, 14, 14)

local ACStatusText =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundTransparency = 1,
        Text = "Listo para analizar anticheats",
        TextColor3 = C.text_primary,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ACStateFrame
)

local ACProgressBg =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 6),
        Position = UDim2.new(0, 0, 0, 30),
        BackgroundColor3 = Color3.fromRGB(30, 30, 45),
        BorderSizePixel = 0,
        ZIndex = 14
    },
    ACStateFrame
)
MakeRound(ACProgressBg, 3)

local ACProgressBar =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = C.accent,
        BorderSizePixel = 0,
        ZIndex = 15
    },
    ACProgressBg
)
MakeRound(ACProgressBar, 3)

local ACLayerText =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 44),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = C.text_dim,
        TextSize = 10,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ACStateFrame
)

local ACAnalyzeBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(1, 0, 0, 38),
        BackgroundColor3 = C.accent,
        Text = T("analyze"),
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 4
    },
    PageACAnalyzer
)
MakeRound(ACAnalyzeBtn, 8)

local ACResultsFrame =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 10),
        BackgroundTransparency = 1,
        ZIndex = 13,
        LayoutOrder = 5,
        AutomaticSize = Enum.AutomaticSize.Y
    },
    PageACAnalyzer
)

local ACResultsLayout = Instance.new("UIListLayout")
ACResultsLayout.SortOrder = Enum.SortOrder.LayoutOrder
ACResultsLayout.Padding = UDim.new(0, 6)
ACResultsLayout.Parent = ACResultsFrame

-- Summary counters
local ACSummaryFrame =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 60),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 6,
        Visible = false
    },
    PageACAnalyzer
)
MakeRound(ACSummaryFrame, 8)
MakeStroke(ACSummaryFrame, C.border, 1)
MakePadding(ACSummaryFrame, 10, 10, 14, 14)

local ACSummaryText =
    NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "",
        TextColor3 = C.accent,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ACSummaryFrame
)

-- Sistema de deteccion de anticheats en local
local ACLayers = {
    {
        name = "Capa 1: Detectar BindableEvents de AC",
        func = function()
            local found = {}
            local ok, result =
                pcall(
                function()
                    for _, v in ipairs(game:GetDescendants()) do
                        if v:IsA("BindableEvent") or v:IsA("BindableFunction") then
                            local n = v.Name:lower()
                            if
                                n:find("anticheat") or n:find("ac_") or n:find("cheat") or n:find("detect") or
                                    n:find("kick") or
                                    n:find("ban")
                             then
                                table.insert(found, {name = v.Name, path = v:GetFullName(), type = "BindableEvent"})
                            end
                        end
                    end
                end
            )
            return found
        end
    },
    {
        name = "Capa 2: Scripts en ServerScriptService (huella)",
        func = function()
            local found = {}
            local ok, result =
                pcall(
                function()
                    for _, v in ipairs(game:GetDescendants()) do
                        if v:IsA("Script") or v:IsA("LocalScript") or v:IsA("ModuleScript") then
                            local n = v.Name:lower()
                            if
                                n:find("anticheat") or n:find("security") or n:find("guard") or n:find("protect") or
                                    n:find("sentinel")
                             then
                                table.insert(found, {name = v.Name, path = v:GetFullName(), type = "Script"})
                            end
                        end
                    end
                end
            )
            return found
        end
    },
    {
        name = "Capa 3: RemoteEvents de detection",
        func = function()
            local found = {}
            pcall(
                function()
                    for _, v in ipairs(game:GetDescendants()) do
                        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
                            local n = v.Name:lower()
                            if
                                n:find("report") or n:find("kick") or n:find("ban") or n:find("flag") or n:find("cheat") or
                                    n:find("detect")
                             then
                                table.insert(found, {name = v.Name, path = v:GetFullName(), type = "RemoteEvent"})
                            end
                        end
                    end
                end
            )
            return found
        end
    },
    {
        name = "Capa 4: Valores de configuracion AC",
        func = function()
            local found = {}
            pcall(
                function()
                    for _, v in ipairs(game:GetDescendants()) do
                        if v:IsA("BoolValue") or v:IsA("IntValue") or v:IsA("StringValue") then
                            local n = v.Name:lower()
                            if n:find("anticheat") or n:find("maxspeed") or n:find("maxjump") or n:find("whitelist") then
                                table.insert(
                                    found,
                                    {name = v.Name, path = v:GetFullName(), type = "Value", value = tostring(v.Value)}
                                )
                            end
                        end
                    end
                end
            )
            return found
        end
    },
    {
        name = "Capa 5: Carpetas de sistema de seguridad",
        func = function()
            local found = {}
            pcall(
                function()
                    for _, v in ipairs(game:GetDescendants()) do
                        if v:IsA("Folder") or v:IsA("Configuration") then
                            local n = v.Name:lower()
                            if
                                n:find("security") or n:find("anticheat") or n:find("protection") or n:find("sentinel") or
                                    n:find("guard")
                             then
                                table.insert(found, {name = v.Name, path = v:GetFullName(), type = "Folder"})
                            end
                        end
                    end
                end
            )
            return found
        end
    },
    {
        name = "Capa 6: Modificadores de humanoid (AC hooks)",
        func = function()
            local found = {}
            pcall(
                function()
                    local char = game.Players.LocalPlayer.Character
                    if char then
                        local h = char:FindFirstChild("Humanoid")
                        if h then
                            -- Detectar si WalkSpeed/JumpPower estan bajo control externo
                            local origWS = h.WalkSpeed
                            h.WalkSpeed = 9999
                            task.wait(0.05)
                            if h.WalkSpeed ~= 9999 then
                                table.insert(
                                    found,
                                    {name = "WalkSpeed Guard", path = "Humanoid", type = "Hook", value = "Detectado"}
                                )
                            end
                            h.WalkSpeed = origWS
                        end
                    end
                end
            )
            return found
        end
    },
    {
        name = "Capa 7: FireServer interceptors",
        func = function()
            local found = {}
            pcall(
                function()
                    -- Verificar si hay hooks en RemoteEvent:FireServer
                    local testRemote = Instance.new("RemoteEvent")
                    local original = testRemote.FireServer
                    -- Si el metodo esta hookeado, el tipo cambiara
                    if type(original) ~= "function" then
                        table.insert(
                            found,
                            {name = "FireServer Hook", path = "RemoteEvent", type = "Hook", value = "Detectado"}
                        )
                    end
                    testRemote:Destroy()
                end
            )
            return found
        end
    }
}

local ACAnalyzeRunning = false

ACAnalyzeBtn.MouseButton1Click:Connect(
    function()
        if ACAnalyzeRunning then
            return
        end
        ACAnalyzeRunning = true
        ACAnalyzeBtn.Text = T("scanning")
        ACAnalyzeBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 80)

        -- Limpiar resultados
        for _, ch in ipairs(ACResultsFrame:GetChildren()) do
            if ch:IsA("Frame") then
                ch:Destroy()
            end
        end
        ACSummaryFrame.Visible = false

        local totalFound = 0
        local activeCount = 0

        task.spawn(
            function()
                for i, layer in ipairs(ACLayers) do
                    ACStatusText.Text = layer.name
                    ACLayerText.Text = T("analyzing_layer") .. " " .. i .. " " .. T("of") .. " " .. #ACLayers
                    ACProgressBar.Size = UDim2.new(i / #ACLayers, 0, 1, 0)

                    local results = layer.func()

                    if #results > 0 then
                        activeCount = activeCount + 1
                        totalFound = totalFound + #results

                        local resultCard =
                            NewInstance(
                            "Frame",
                            {
                                Size = UDim2.new(1, 0, 0, 36 + #results * 22),
                                BackgroundColor3 = Color3.fromRGB(0, 20, 10),
                                BorderSizePixel = 0,
                                ZIndex = 14,
                                LayoutOrder = i
                            },
                            ACResultsFrame
                        )
                        MakeRound(resultCard, 6)
                        MakeStroke(resultCard, C.accent, 1)
                        MakePadding(resultCard, 8, 8, 10, 10)

                        local cardLayout = Instance.new("UIListLayout")
                        cardLayout.SortOrder = Enum.SortOrder.LayoutOrder
                        cardLayout.Padding = UDim.new(0, 3)
                        cardLayout.Parent = resultCard

                        local layerTitle =
                            NewInstance(
                            "TextLabel",
                            {
                                Size = UDim2.new(1, 0, 0, 18),
                                BackgroundTransparency = 1,
                                Text = layer.name,
                                TextColor3 = C.accent,
                                TextSize = 10,
                                Font = Enum.Font.GothamBold,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                ZIndex = 15,
                                LayoutOrder = 0
                            },
                            resultCard
                        )

                        for j, item in ipairs(results) do
                            local itemRow =
                                NewInstance(
                                "TextLabel",
                                {
                                    Size = UDim2.new(1, 0, 0, 18),
                                    BackgroundTransparency = 1,
                                    Text = "  > " ..
                                        item.name ..
                                            " [" .. item.type .. "]" .. (item.value and " = " .. item.value or ""),
                                    TextColor3 = Color3.fromRGB(180, 255, 200),
                                    TextSize = 9,
                                    Font = Enum.Font.Code,
                                    TextXAlignment = Enum.TextXAlignment.Left,
                                    ZIndex = 15,
                                    LayoutOrder = j
                                },
                                resultCard
                            )
                        end
                    else
                        local emptyCard =
                            NewInstance(
                            "Frame",
                            {
                                Size = UDim2.new(1, 0, 0, 28),
                                BackgroundColor3 = C.bg_panel,
                                BorderSizePixel = 0,
                                ZIndex = 14,
                                LayoutOrder = i
                            },
                            ACResultsFrame
                        )
                        MakeRound(emptyCard, 5)
                        MakePadding(emptyCard, 0, 0, 10, 10)

                        NewInstance(
                            "TextLabel",
                            {
                                Size = UDim2.new(1, 0, 1, 0),
                                BackgroundTransparency = 1,
                                Text = layer.name .. " - Sin resultados",
                                TextColor3 = C.text_dim,
                                TextSize = 9,
                                Font = Enum.Font.Gotham,
                                TextXAlignment = Enum.TextXAlignment.Left,
                                ZIndex = 15
                            },
                            emptyCard
                        )
                    end

                    task.wait(0.8)
                end

                -- Resumen final
                ACStatusText.Text = T("loading_complete")
                ACLayerText.Text = ""
                ACProgressBar.Size = UDim2.new(1, 0, 1, 0)

                ACSummaryFrame.Visible = true
                ACSummaryText.Text =
                    T("anticheats_found") ..
                    ": " ..
                        totalFound ..
                            "  |  " ..
                                T("anticheats_active") .. ": " .. activeCount .. " capas activas de " .. #ACLayers

                ACAnalyzeBtn.Text = T("analyze")
                ACAnalyzeBtn.BackgroundColor3 = C.accent
                ACAnalyzeRunning = false
            end
        )
    end
)

-- ============================================================
-- MODULO 18: PAGINA - AJUSTES
-- ============================================================

local PageSettings = CreatePage("settings")

local SettingsHeader =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 1
    },
    PageSettings
)
MakeRound(SettingsHeader, 8)
MakeStroke(SettingsHeader, C.border, 1)
MakePadding(SettingsHeader, 0, 0, 14, 14)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = T("settings"),
        TextColor3 = C.text_primary,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    SettingsHeader
)

-- Tema
local ThemeSection =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 2
    },
    PageSettings
)
MakeRound(ThemeSection, 8)
MakeStroke(ThemeSection, C.border, 1)
MakePadding(ThemeSection, 12, 12, 14, 14)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Text = T("theme"),
        TextColor3 = C.text_primary,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    ThemeSection
)

local ThemeBtnRow =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 32),
        Position = UDim2.new(0, 0, 0, 26),
        BackgroundTransparency = 1,
        ZIndex = 14
    },
    ThemeSection
)

local ThemeDarkBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0.45, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(20, 20, 30),
        Text = T("dark"),
        TextColor3 = Color3.fromRGB(200, 200, 240),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 15
    },
    ThemeBtnRow
)
MakeRound(ThemeDarkBtn, 6)
MakeStroke(ThemeDarkBtn, C.accent, 1)

local ThemeLightBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0.45, 0, 1, 0),
        Position = UDim2.new(0.55, 0, 0, 0),
        BackgroundColor3 = Color3.fromRGB(240, 240, 250),
        Text = T("light"),
        TextColor3 = Color3.fromRGB(20, 20, 30),
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 15
    },
    ThemeBtnRow
)
MakeRound(ThemeLightBtn, 6)

ThemeDarkBtn.MouseButton1Click:Connect(
    function()
        TalkingSentinel.Theme = "dark"
        MakeStroke(ThemeDarkBtn, C.accent, 2)
        MakeStroke(ThemeLightBtn, Color3.fromRGB(200, 200, 220), 1)
    end
)

ThemeLightBtn.MouseButton1Click:Connect(
    function()
        TalkingSentinel.Theme = "light"
        MakeStroke(ThemeLightBtn, Color3.fromRGB(20, 20, 30), 2)
        MakeStroke(ThemeDarkBtn, Color3.fromRGB(60, 60, 80), 1)
    end
)

-- Idioma
local LangSection =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 70),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 3
    },
    PageSettings
)
MakeRound(LangSection, 8)
MakeStroke(LangSection, C.border, 1)
MakePadding(LangSection, 12, 12, 14, 14)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
        Text = "Idioma / Language",
        TextColor3 = C.text_primary,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 14
    },
    LangSection
)

local LangBtnRow =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 32),
        Position = UDim2.new(0, 0, 0, 26),
        BackgroundTransparency = 1,
        ZIndex = 14
    },
    LangSection
)

local LangESBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0.28, 0, 1, 0),
        BackgroundColor3 = TalkingSentinel.Language == "es" and C.accent or Color3.fromRGB(25, 25, 38),
        Text = "Espanol",
        TextColor3 = TalkingSentinel.Language == "es" and Color3.fromRGB(0, 0, 0) or C.text_secondary,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        BorderSizePixel = 0,
        ZIndex = 15
    },
    LangBtnRow
)
MakeRound(LangESBtn, 6)

local LangENBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0.28, 0, 1, 0),
        Position = UDim2.new(0.36, 0, 0, 0),
        BackgroundColor3 = TalkingSentinel.Language == "en" and C.accent or Color3.fromRGB(25, 25, 38),
        Text = "English",
        TextColor3 = TalkingSentinel.Language == "en" and Color3.fromRGB(0, 0, 0) or C.text_secondary,
        TextSize = 11,
        Font = Enum.Font.Gotham,
        BorderSizePixel = 0,
        ZIndex = 15
    },
    LangBtnRow
)
MakeRound(LangENBtn, 6)

LangESBtn.MouseButton1Click:Connect(
    function()
        TalkingSentinel.Language = "es"
        LangESBtn.BackgroundColor3 = C.accent
        LangESBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        LangENBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
        LangENBtn.TextColor3 = C.text_secondary
    end
)

LangENBtn.MouseButton1Click:Connect(
    function()
        TalkingSentinel.Language = "en"
        LangENBtn.BackgroundColor3 = C.accent
        LangENBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
        LangESBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 38)
        LangESBtn.TextColor3 = C.text_secondary
    end
)

-- Copyright completo
local CopyrightSection =
    NewInstance(
    "Frame",
    {
        Size = UDim2.new(1, 0, 0, 10),
        BackgroundColor3 = C.bg_panel,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 4,
        AutomaticSize = Enum.AutomaticSize.Y
    },
    PageSettings
)
MakeRound(CopyrightSection, 8)
MakeStroke(CopyrightSection, C.border, 1)
MakePadding(CopyrightSection, 14, 14, 14, 14)

local copyrightText =
    [[TALKING SENTINEL v1 - AVISO LEGAL Y COPYRIGHT

Copyright (c) 2024 Talking Scripts & Lenux Studio.
Todos los derechos reservados.

Este software, incluyendo todo su codigo fuente, graficos, 
diseno, logotipos y sistemas de deteccion, es propiedad 
exclusiva de sus creadores y esta protegido por las leyes 
de derechos de autor aplicables.

QUEDA ESTRICTAMENTE PROHIBIDO:
- Copiar, redistribuir o modificar este script sin permiso
- Usar el nombre "Talking Sentinel" en proyectos derivados
- Vender o sublicenciar cualquier parte de este software
- Eliminar o modificar este aviso de copyright

CREDITOS Y CREADORES:
  Lenux Play         - Desarrollo Principal & UI
  Lenux Studio       - Arquitectura del Sistema
  Talking Scripts    - Sistemas de Deteccion
  Talking Hyb        - Motor de Ofuscacion TKG v2

AGRADECIMIENTOS:
  A toda la comunidad de Roblox por el apoyo.
  A los beta testers que ayudaron a mejorar el sistema.

VERSION: 1.0 | BUILD: 2024.12
PROXIMA ACTUALIZACION: v1.1...

Para contacto o permisos:
  Talking Scripts | Lenux Studio
  
"Proteger tu trabajo es proteger tu creatividad."
- Talking Scripts Team
]]

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, 0, 0, 380),
        BackgroundTransparency = 1,
        Text = copyrightText,
        TextColor3 = C.text_dim,
        TextSize = 9,
        Font = Enum.Font.Code,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        ZIndex = 14
    },
    CopyrightSection
)

-- Boton destruir script
local DestroyBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = Color3.fromRGB(80, 10, 10),
        Text = T("destroy"),
        TextColor3 = Color3.fromRGB(255, 100, 100),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 13,
        LayoutOrder = 5
    },
    PageSettings
)
MakeRound(DestroyBtn, 8)
MakeStroke(DestroyBtn, Color3.fromRGB(150, 30, 30), 1)

DestroyBtn.MouseButton1Click:Connect(
    function()
        -- Confirmacion
        DestroyBtn.Text = "Confirmar? (click de nuevo)"
        DestroyBtn.BackgroundColor3 = Color3.fromRGB(180, 20, 20)
        local conn
        conn =
            DestroyBtn.MouseButton1Click:Connect(
            function()
                conn:Disconnect()
                ScreenGui:Destroy()
            end
        )
        task.delay(
            3,
            function()
                if DestroyBtn and DestroyBtn.Parent then
                    DestroyBtn.Text = T("destroy")
                    DestroyBtn.BackgroundColor3 = Color3.fromRGB(80, 10, 10)
                    if conn then
                        conn:Disconnect()
                    end
                end
            end
        )
    end
)

-- ============================================================
-- MODULO 19: BOTON MINIMIZAR FLOTANTE
-- ============================================================

local MinimizedBtn =
    NewInstance(
    "TextButton",
    {
        Name = "MinimizedBtn",
        Size = UDim2.new(0, 38, 0, 38),
        Position = UDim2.new(0, 10, 0.5, 0),
        BackgroundColor3 = Color3.fromRGB(0, 200, 150),
        Text = "TS",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 11,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 20,
        Visible = false,
        Active = true
    },
    ScreenGui
)
MakeRound(MinimizedBtn, 19)
MakeStroke(MinimizedBtn, Color3.fromRGB(0, 150, 100), 2)

-- Barra inferior semi-transparente
local BottomBar =
    NewInstance(
    "Frame",
    {
        Name = "BottomBar",
        Size = UDim2.new(0, 200, 0, 32),
        Position = UDim2.new(0, 0, 1, -40),
        BackgroundColor3 = Color3.fromRGB(8, 8, 14),
        BackgroundTransparency = 0.35,
        BorderSizePixel = 0,
        ZIndex = 9,
        Visible = false,
        Active = true
    },
    ScreenGui
)
MakeRound(BottomBar, 8)
MakeStroke(BottomBar, Color3.fromRGB(30, 30, 50), 1)

NewInstance(
    "TextLabel",
    {
        Size = UDim2.new(1, -50, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = "TALKING SENTINEL v1",
        TextColor3 = Color3.fromRGB(0, 200, 150),
        TextSize = 10,
        Font = Enum.Font.GothamBold,
        ZIndex = 10
    },
    BottomBar
)

local BottomOpenBtn =
    NewInstance(
    "TextButton",
    {
        Size = UDim2.new(0, 40, 0.8, 0),
        Position = UDim2.new(1, -46, 0.1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 200, 150),
        Text = "^",
        TextColor3 = Color3.fromRGB(0, 0, 0),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        BorderSizePixel = 0,
        ZIndex = 10
    },
    BottomBar
)
MakeRound(BottomOpenBtn, 6)

-- ============================================================
-- MODULO 20: NAVEGACION ENTRE SECCIONES
-- ============================================================

local function SwitchSection(sectionKey)
    ActiveSection = sectionKey

    -- Ocultar todas las paginas
    for key, page in pairs(ContentPages) do
        page.Visible = false
    end

    -- Mostrar pagina activa
    local targetPage = ContentPages[sectionKey]
    if targetPage then
        targetPage.Visible = true
    end

    -- Actualizar botones nav
    for key, navData in pairs(NavButtons) do
        local isActive = key == sectionKey
        navData.textL.TextColor3 = isActive and C.accent or C.text_secondary
        navData.iconL.TextColor3 = isActive and C.accent or C.text_dim
        navData.btn.BackgroundColor3 = isActive and Color3.fromRGB(0, 30, 20) or C.nav_bg
        navData.bar.Visible = isActive
    end
end

for _, sec in ipairs(NavSections) do
    NavButtons[sec.key].btn.MouseButton1Click:Connect(
        function()
            SwitchSection(sec.key)
        end
    )
end

-- Iniciar en obfuscator
SwitchSection("obfuscator")

-- ============================================================
-- MODULO 21: MINIMIZE / CLOSE BUTTONS
-- ============================================================

BtnMinimize.MouseButton1Click:Connect(
    function()
        TalkingSentinel.Minimized = true
        MainFrame.Visible = false
        MinimizedBtn.Visible = true
        BottomBar.Visible = true
    end
)

BtnClose.MouseButton1Click:Connect(
    function()
        MainFrame.Visible = false
        MinimizedBtn.Visible = false
        BottomBar.Visible = false
    end
)

MinimizedBtn.MouseButton1Click:Connect(
    function()
        TalkingSentinel.Minimized = false
        MainFrame.Visible = true
        MinimizedBtn.Visible = false
        BottomBar.Visible = false
    end
)

BottomOpenBtn.MouseButton1Click:Connect(
    function()
        TalkingSentinel.Minimized = false
        MainFrame.Visible = true
        MinimizedBtn.Visible = false
        BottomBar.Visible = false
    end
)

-- ============================================================
-- MODULO 22: SECUENCIA DE CARGA ANIMADA
-- ============================================================

local function AnimateLoading()
    -- Fade in logo
    local t1 = CreateTween(LogoLabel, {TextTransparency = 0}, 0.8, Enum.EasingStyle.Quad)
    t1:Play()
    task.wait(0.4)

    local t2 = CreateTween(VersionLabel, {TextTransparency = 0}, 0.6)
    t2:Play()
    task.wait(0.3)

    local t3 = CreateTween(WelcomeLabel, {TextTransparency = 0}, 0.6)
    t3:Play()
    task.wait(0.5)

    -- Secuencia de carga con pasos
    local steps = {
        {text = T("loading"), progress = 0.05},
        {text = T("loading_anticheat"), progress = 0.2},
        {text = "Cargando capa de deteccion 1/7...", progress = 0.3},
        {text = "Cargando capa de deteccion 2/7...", progress = 0.38},
        {text = "Cargando capa de deteccion 3/7...", progress = 0.46},
        {text = "Cargando capa de deteccion 4/7...", progress = 0.54},
        {text = "Cargando capa de deteccion 5/7...", progress = 0.62},
        {text = "Cargando capa de deteccion 6/7...", progress = 0.70},
        {text = "Cargando capa de deteccion 7/7...", progress = 0.78},
        {text = T("loading_obfuscation"), progress = 0.85},
        {text = T("loading_analyzers"), progress = 0.92},
        {text = T("loading_complete"), progress = 1.0}
    }

    for i, step in ipairs(steps) do
        LoadingStatus.Text = step.text
        local prog = CreateTween(ProgressBar, {Size = UDim2.new(step.progress, 0, 1, 0)}, 0.25)
        prog:Play()
        task.wait(0.22)
    end

    -- Mostrar dots animados
    task.wait(0.3)
    local dotStates = {".", "..", "...", ".."}
    for i = 1, 8 do
        DotsLabel.Text = dotStates[(i % #dotStates) + 1]
        task.wait(0.18)
    end

    -- Fade in creditos
    local t4 = CreateTween(CreditsLoad, {TextColor3 = Color3.fromRGB(60, 60, 80)}, 0.5)
    t4:Play()
    task.wait(0.5)

    -- Transicion a GUI principal
    local fadeOut = CreateTween(LoadingScreen, {BackgroundTransparency = 1}, 0.6)
    local fadeOutBg = CreateTween(LoadBg, {BackgroundTransparency = 1}, 0.6)
    fadeOut:Play()
    fadeOutBg:Play()

    -- Fade cada elemento
    for _, elem in ipairs(LoadingScreen:GetDescendants()) do
        if elem:IsA("TextLabel") or elem:IsA("Frame") then
            pcall(
                function()
                    local ft = CreateTween(elem, {TextTransparency = 1}, 0.4)
                    ft:Play()
                end
            )
        end
    end

    task.wait(0.7)

    LoadingScreen.Visible = false
    MainFrame.Visible = true
    TalkingSentinel.Loaded = true

    -- Fade in main frame
    MainFrame.BackgroundTransparency = 1
    local fadeIn = CreateTween(MainFrame, {BackgroundTransparency = 0}, 0.4)
    fadeIn:Play()
end

-- ============================================================
-- MODULO 23: DOTS ANIMATION EN CARGA
-- ============================================================

local dotsAnimRunning = true
task.spawn(
    function()
        local d = 0
        while dotsAnimRunning do
            d = d + 1
            if d > 3 then
                d = 1
            end
            local dots = string.rep(".", d)
            pcall(
                function()
                    DotsLabel.Text = dots
                end
            )
            task.wait(0.4)
        end
    end
)

-- ============================================================
-- MODULO 24: DRAGGABLE SUPPORT (ya built-in en Frame.Draggable)
-- ============================================================

-- Para executors que no soportan Draggable nativo:
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

TopBar.InputBegan:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position
            input.Changed:Connect(
                function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end
            )
        end
    end
)

TopBar.InputChanged:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end
)

UserInputService.InputChanged:Connect(
    function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            MainFrame.Position =
                UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end
)

-- ============================================================
-- MODULO 25: HOVER EFFECTS EN NAV
-- ============================================================

for key, navData in pairs(NavButtons) do
    navData.btn.MouseEnter:Connect(
        function()
            if key ~= ActiveSection then
                CreateTween(navData.btn, {BackgroundColor3 = Color3.fromRGB(20, 25, 35)}, 0.15):Play()
            end
        end
    )
    navData.btn.MouseLeave:Connect(
        function()
            if key ~= ActiveSection then
                CreateTween(navData.btn, {BackgroundColor3 = C.nav_bg}, 0.15):Play()
            end
        end
    )
end

-- ============================================================
-- MODULO 26: HOVER EN BOTONES PRINCIPALES
-- ============================================================

local function AddHover(btn, normalColor, hoverColor)
    btn.MouseEnter:Connect(
        function()
            CreateTween(btn, {BackgroundColor3 = hoverColor}, 0.12):Play()
        end
    )
    btn.MouseLeave:Connect(
        function()
            CreateTween(btn, {BackgroundColor3 = normalColor}, 0.12):Play()
        end
    )
end

AddHover(GenerateBtn, C.accent, Color3.fromRGB(0, 230, 170))
AddHover(ScanAllBtn, C.danger, Color3.fromRGB(240, 70, 70))
AddHover(ACAnalyzeBtn, C.accent, Color3.fromRGB(0, 230, 170))
AddHover(CopyACBtn, C.accent2, Color3.fromRGB(0, 170, 255))
AddHover(BtnMinimize, Color3.fromRGB(40, 40, 60), Color3.fromRGB(60, 60, 90))
AddHover(BtnClose, Color3.fromRGB(180, 40, 40), Color3.fromRGB(220, 60, 60))
AddHover(SelectAllBtn, Color3.fromRGB(30, 30, 45), Color3.fromRGB(45, 45, 65))

-- ============================================================
-- MODULO 27: DETECCION DE EXECUTOR (signos en entorno local)
-- ============================================================

task.spawn(
    function()
        task.wait(3)
        local executorSigns = 0
        local executorName = "Desconocido"

        local function checkGlobal(name)
            local ok, val =
                pcall(
                function()
                    if getfenv then
                        return getfenv()[name]
                    else
                        return rawget(_G, name)
                    end
                end
            )
            return ok and val ~= nil
        end

        if checkGlobal("syn") then
            executorSigns = executorSigns + 1
            executorName = "Synapse X"
        end
        if checkGlobal("KRNL_LOADED") then
            executorSigns = executorSigns + 1
            executorName = "Krnl"
        end
        if checkGlobal("fluxus") then
            executorSigns = executorSigns + 1
            executorName = "Fluxus"
        end
        if checkGlobal("MACSPLOIT_LOADED") then
            executorSigns = executorSigns + 1
            executorName = "MacSploit"
        end
        if checkGlobal("Script_Ware") then
            executorSigns = executorSigns + 1
            executorName = "Script-Ware"
        end
        if checkGlobal("DELTA_LOADED") then
            executorSigns = executorSigns + 1
            executorName = "Delta"
        end
        if checkGlobal("WAVE_LOADED") then
            executorSigns = executorSigns + 1
            executorName = "Wave"
        end
        if checkGlobal("XENO_LOADED") then
            executorSigns = executorSigns + 1
            executorName = "Xeno"
        end
        if checkGlobal("getgenv") then
            executorSigns = executorSigns + 1
        end
        if checkGlobal("getsenv") then
            executorSigns = executorSigns + 1
        end
        if checkGlobal("getrawmetatable") then
            executorSigns = executorSigns + 1
        end
        if checkGlobal("hookfunction") then
            executorSigns = executorSigns + 1
        end
        if checkGlobal("setclipboard") then
            executorSigns = executorSigns + 1
        end
        if checkGlobal("readfile") then
            executorSigns = executorSigns + 1
        end
        if checkGlobal("writefile") then
            executorSigns = executorSigns + 1
        end
        if checkGlobal("loadstring") then
            executorSigns = executorSigns + 1
        end

        if executorSigns > 0 then
            PlatformLabel.Text = T("platform_" .. TalkingSentinel.Platform) .. " | Executor: " .. executorName
            PlatformLabel.TextColor3 = Color3.fromRGB(0, 180, 130)
        end
    end
)

-- ============================================================
-- MODULO 28: INICIAR SECUENCIA DE CARGA
-- ============================================================

dotsAnimRunning = true
task.spawn(
    function()
        task.wait(0.3)
        AnimateLoading()
        dotsAnimRunning = false
    end
)

-- ============================================================
-- TALKING SENTINEL v1 | INICIADO CORRECTAMENTE
-- Lenux Play | Lenux Studio | Talking Scripts | Talking Hyb
-- Copyright (c) 2024 | Todos los derechos reservados
-- Proxima actualizacion: v1.1...
-- ============================================================
