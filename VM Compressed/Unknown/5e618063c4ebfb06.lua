-- [[ Cryptic Hub - المحرك الرئيسي V9.0 ]]
-- المطور: يامي
-- يدعم 4 لغات: العربية، الإنجليزية، الروسية، البرتغالية

local HttpService     = game:GetService("HttpService")
local Players         = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local StarterGui      = game:GetService("StarterGui")
local lp              = Players.LocalPlayer

local Cryptic = {
    Config = {
        UserName = "OnlyCryptic", RepoName = "Cryptic", Branch = "hm",
        Discord = "https://discord.gg/QSvQJs7BdP"
    },
    -- ملاحظة: قوائم الماب (NameMatchers / PlaceIds / GameIds) صارت
    -- بملف Cryptic/Maps/index.lua لإبقاء هذا الملف نظيف.
    -- يتم تحميلها أدناه بعد تعريف Import.
}

-- ============================================================
-- استيراد ملف من المستودع
-- ============================================================
local function Import(path)
    local url = "https://raw.githubusercontent.com/" .. Cryptic.Config.UserName .. "/" .. Cryptic.Config.RepoName .. "/" .. Cryptic.Config.Branch .. "/" .. path .. "?v=" .. tick()
    local s, r = pcall(game.HttpGet, game, url)
    if s and r then
        local f = loadstring(r)
        if f then return f() end
    end
    return nil
end

-- ============================================================
-- تحميل سجل الماب من Cryptic/Maps/index.lua
-- (هيك main.lua يبقى نظيف وكل ماب جديد ينضاف هناك)
-- ============================================================
do
    local registry = Import("Maps/index.lua")
    if type(registry) == "table" then
        Cryptic.MapNameMatchers = registry.NameMatchers or {}
        Cryptic.Maps            = registry.PlaceIds     or {}
        Cryptic.GameIds         = registry.GameIds      or {}
    else
        Cryptic.MapNameMatchers = {}
        Cryptic.Maps            = {}
        Cryptic.GameIds         = {}
    end
end

-- ============================================================
-- تحميل i18n وإتاحته عالمياً قبل أي شي
-- ============================================================
local i18n = Import("i18n.lua")
if i18n then
    i18n.Load()                        -- يقرأ اللغة المحفوظة لو موجودة
    getgenv().CrypticI18n = i18n       -- متاح لكل الموديولات
end

-- ============================================================
-- بناء الهيكل (يستخدم i18n لأسماء التابات الديناميكية)
-- ============================================================
local function T(key)
    if i18n then return i18n.T(key) end
    return key
end

local function BuildStructure()
    -- الأيقونة + " " + الترجمة
    Cryptic.Structure = {
        ["player"]      = { Icon = "👤", Key = "tab.player",   Folder = "Player",   Files = {"lol", "auto_apple", "speed", "fly", "jumppower", "noclip", "walkfling", "antifling", "wallwalk", "nofall", "infinitejump", "restart", "discord"} },
        ["tools"]       = { Icon = "🔧", Key = "tab.tools",    Folder = "Misc",     Files = {"lol", "tptool", "auto_tool", "fling_tool", "emotes", "esp", "shiftlock", "invis_tool", "spin_tool", "x-ray", "fullbright", "no_fog", "camera"} },
        ["target"]      = { Icon = "🎯", Key = "tab.target",   Folder = "Combat",   Files = {"target_select", "target_tp", "target_spectate", "target_aimbot", "target_sit", "target_mimic", "target_fling", "bring_parts", "carry", "jark", "Target_follow", "target_esp", "copy_skin1", "target_emotes", "target_facesit", "info_t", "skinz"} },
        ["server"]      = { Icon = "🌐", Key = "tab.server",   Folder = "Server",   Files = {"server", "rejoin", "join_id", "players"} },
        ["teleport"]    = { Icon = "📍", Key = "tab.teleport", Folder = "Teleport", Files = {"lol", "tp_locations", "checkpoint"} },
        ["other"]       = { Icon = "⚡", Key = "tab.other",    Folder = "Other",    Files = {"animations", "lol", "vfly", "zero_gravity", "anti_block", "anti_sit", "fling_all", "infinite_zoom", "no_camera_clip", "anti_afk"} },
        ["settings"]    = { Icon = "⚙️", Key = "tab.settings", Folder = "Settings",  Files = {"transparency", "settings", "suggestion_box"} },
    }
    Cryptic.TabsOrder = {
        "player", "tools", "target", "other", "teleport", "server", "settings"
    }
end

-- اسم تاب جاهز بالأيقونة + الترجمة
local function TabDisplayName(id)
    local data = Cryptic.Structure[id]
    if not data then return id end
    if data._isMapTab and data._mapData then
        return "🗺️ " .. data._mapData.Name
    end
    return T(data.Key)
end

local function TabIcon(id)
    local data = Cryptic.Structure[id]
    if not data then return nil end
    if data._isMapTab then return nil end
    return data.Icon
end

local ElementCache = {}
local function LoadElement(elementName)
    if ElementCache[elementName] then return ElementCache[elementName] end
    local url = "https://raw.githubusercontent.com/" .. Cryptic.Config.UserName .. "/" .. Cryptic.Config.RepoName .. "/" .. Cryptic.Config.Branch .. "/UI/Elements/" .. elementName .. ".lua?v=" .. tick()
    local s, r = pcall(game.HttpGet, game, url)
    if s and r then
        local chunk = loadstring(r)
        if chunk then
            local func = chunk()
            ElementCache[elementName] = func
            return func
        end
    end
    warn("Cryptic Hub: Failed to load element - " .. elementName)
    return nil
end

local function InjectMapTab()
    local mapFilePath

    -- ───── طريقة 1: مطابقة باسم اللعبة (الأقوى) ─────
    if Cryptic.MapNameMatchers then
        local placeName
        pcall(function()
            placeName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        end)
        if placeName and placeName ~= "" then
            local lower = string.lower(placeName)
            for _, m in ipairs(Cryptic.MapNameMatchers) do
                if m.pattern and m.file and string.find(lower, m.pattern, 1, true) then
                    mapFilePath = m.file
                    break
                end
            end
        end
    end

    -- ───── طريقة 2: PlaceId (إيديات الأماكن المعروفة) ─────
    if not mapFilePath and Cryptic.Maps then
        mapFilePath = Cryptic.Maps[game.PlaceId]
    end

    -- ───── طريقة 4: GameId / UniverseId (يغطي كل العوالم) ─────
    if not mapFilePath and Cryptic.GameIds then
        mapFilePath = Cryptic.GameIds[game.GameId]
    end

    if not mapFilePath then return end

    local mapData = Import(mapFilePath .. ".lua")
    if type(mapData) ~= "table" then return end

    local id = "map_current"
    Cryptic.Structure[id] = { _isMapTab = true, _mapData = mapData }
    table.insert(Cryptic.TabsOrder, 2, id)
end

-- ============================================================
-- إعادة الدخول للسيرفر بعد تغيير اللغة
-- ============================================================
local function RejoinForLanguage()
    local loaderURL = string.format(
        "https://raw.githubusercontent.com/%s/%s/%s/main.lua",
        Cryptic.Config.UserName, Cryptic.Config.RepoName, Cryptic.Config.Branch
    )
    local loader = string.format(
        'task.wait(2); pcall(function() loadstring(game:HttpGet(%q .. "?v=" .. tick()))() end)',
        loaderURL
    )

    -- صف التشغيل التلقائي بعد التيليبورت
    pcall(function()
        if queue_on_teleport then
            queue_on_teleport(loader)
        elseif syn and syn.queue_on_teleport then
            syn.queue_on_teleport(loader)
        elseif fluxus and fluxus.queue_on_teleport then
            fluxus.queue_on_teleport(loader)
        end
    end)

    local function notify(text)
        pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = "Cryptic Hub", Text = text, Duration = 5,
            })
        end)
    end

    -- 1) محاولة العودة لنفس السيرفر
    notify(T("lang.rejoining"))
    local sameOk = pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
    end)
    if sameOk then return end

    -- 2) لو فشل، Server Hop عبر Roblox API
    notify(T("lang.hopping"))
    local hopOk = false
    pcall(function()
        local cursor = ""
        for _ = 1, 4 do
            local apiUrl = "https://games.roblox.com/v1/games/" .. game.PlaceId
                .. "/servers/Public?sortOrder=Asc&limit=100"
                .. (cursor ~= "" and ("&cursor=" .. cursor) or "")
            local res = game:HttpGet(apiUrl)
            if not res or res == "" then break end
            local data = HttpService:JSONDecode(res)
            if data and data.data then
                for _, srv in ipairs(data.data) do
                    if srv.id ~= game.JobId
                       and type(srv.playing) == "number"
                       and type(srv.maxPlayers) == "number"
                       and srv.playing < srv.maxPlayers then
                        local ok = pcall(function()
                            TeleportService:TeleportToPlaceInstance(game.PlaceId, srv.id, lp)
                        end)
                        if ok then hopOk = true return end
                    end
                end
                if data.nextPageCursor and data.nextPageCursor ~= "" then
                    cursor = data.nextPageCursor
                else break end
            else break end
        end
    end)
    if hopOk then return end

    -- 3) لو ما قدرنا، نخلي اللاعب يخرج ويدخل يدوياً
    notify(T("lang.fail"))
end

-- ============================================================
-- بدء واجهة Cryptic Hub
-- ============================================================
local function StartCrypticHub()
    BuildStructure()
    InjectMapTab()
    local UI = Import("UI/Core.lua")

    if UI then
        local MainWin = UI:CreateWindow("Cryptic Hub / " .. Cryptic.Config.Discord)

        -- إتاحة فتح اختيار اللغة من الـCore (شارة العلم)
        getgenv().CrypticOpenLangPicker = function()
            local Picker = Import("UI/LanguagePicker.lua")
            if Picker and i18n then
                Picker.Show(i18n, function(code)
                    if not code then return end
                    if code == i18n.Get() then return end
                    i18n.Set(code)
                    RejoinForLanguage()
                end, { closable = true, preselected = i18n.Get() })
            end
        end

        for _, tabId in ipairs(Cryptic.TabsOrder) do
            local tabData = Cryptic.Structure[tabId]
            if tabData then
                local CurrentTab = MainWin:CreateTab(TabDisplayName(tabId), TabIcon(tabId))

                local elementsList = {
                    "Button", "Toggle", "TimedToggle", "Input", "LargeInput",
                    "SpeedControl", "Dropdown", "PlayerSelector", "AddAutoOffToggle", "ProfileCard",
                    "Line", "Label", "Paragraph", "Folder"
                }

                for _, el in ipairs(elementsList) do
                    CurrentTab["Add" .. el] = function(self, ...)
                        local elementFunc = LoadElement(el)
                        if elementFunc then return elementFunc(self, ...) end
                    end
                end

                task.spawn(function(data, tab, nameOfTab)
                    -- 1. معالجة تاب الماب المخصص
                    if data._isMapTab and data._mapData then
                        local mapData = data._mapData
                        -- لو الماب عنده دالة Render خاصة → نشغّلها مباشرةً
                        if type(mapData.Render) == "function" then
                            pcall(function() mapData.Render(tab, UI) end)
                        else
                            -- وإلا نعرض بطاقات السكربتات التقليدية
                            tab:AddLabel("🗺️ " .. T("tab.map_scripts"))
                            local MapCardFunc = LoadElement("MapCard")
                            if MapCardFunc then pcall(function() MapCardFunc(tab, mapData) end) end
                        end
                        return
                    end

                    -- دالة مساعدة: تشغل قائمة ملفات وتضيف خط فاصل تلقائياً بينها
                    local function RunModules(targetTab, folder, fileList)
                        for i, fname in ipairs(fileList) do
                            local filePath = (folder == "") and (fname .. ".lua") or ("Modules/" .. folder .. "/" .. fname .. ".lua")
                            local init = Import(filePath)
                            if type(init) == "function" then
                                local ok, result = pcall(init, targetTab, UI)
                                if ok and result ~= false then
                                    targetTab:AddLine()
                                end
                            end
                        end
                    end

                    -- 2. معالجة تاب الاستهداف (نظام القوائم الفرعية)
                    if nameOfTab == "target" then
                        local tsInit = Import("Modules/Combat/target_select.lua")
                        if type(tsInit) == "function" then pcall(function() tsInit(tab, UI) end) end

                        local function MakeOpen(title, icon)
                            local openFunc = LoadElement("Open")
                            if not openFunc then return tab end
                            local openTab = openFunc(tab, title, icon)
                            local els = {"Button", "Toggle", "TimedToggle", "Input", "LargeInput", "SpeedControl", "Dropdown", "PlayerSelector", "ProfileCard", "Label", "Paragraph", "Folder", "Line"}
                            for _, el in ipairs(els) do
                                openTab["Add" .. el] = function(self, ...)
                                    local f = LoadElement(el)
                                    if f then return f(self, ...) end
                                end
                            end
                            return openTab
                        end

                        -- ── 1. مراقبة / Spy ──────────────────────────────────
                        local spyTab = MakeOpen("مراقبة / Spy", "👁️")
                        for _, fname in ipairs({"target_spectate", "target_tp", "Target_follow", "target_esp", "skinz", "info_t"}) do
                            local init = Import("Modules/Combat/" .. fname .. ".lua")
                            if type(init) == "function" then pcall(function() init(spyTab, UI) end) end
                        end

                        -- ── 2. مزح / Fun (تشغيل حصري: زر واحد فقط) ─────────
                        local funTab = MakeOpen("مزح / Fun", "😂")
                        local funGroup = {}

                        local origFunToggle = funTab.AddToggle
                        funTab.AddToggle = function(self, label, callback)
                            local toggleObj
                            local wrapped = function(active)
                                if active then
                                    for _, other in ipairs(funGroup) do
                                        if other ~= toggleObj then
                                            pcall(function() other:SetState(false) end)
                                        end
                                    end
                                end
                                if callback then callback(active) end
                            end
                            toggleObj = origFunToggle(self, label, wrapped)
                            if toggleObj then table.insert(funGroup, toggleObj) end
                            return toggleObj
                        end

                        for _, fname in ipairs({"bang", "target_facesit", "jark", "target_hug", "target_sit", "backpack", "carry"}) do
                            local init = Import("Modules/Combat/" .. fname .. ".lua")
                            if type(init) == "function" then pcall(function() init(funTab, UI) end) end
                        end

                        -- ── 3. خدع / Tricks ──────────────────────────────────
                        local tricksTab = MakeOpen("خدع / Tricks", "🎭")
                        for _, fname in ipairs({"target_fling", "bring_parts", "target_mimic", "copy_walk", "target_aimbot", "target_emotes"}) do
                            local init = Import("Modules/Combat/" .. fname .. ".lua")
                            if type(init) == "function" then pcall(function() init(tricksTab, UI) end) end
                        end

                        return
                    end

                    -- 3. معالجة تاب أخرى (نظام القوائم الفرعية)
                    if nameOfTab == "other" then
                        local function MakeOpen(title, icon)
                            local openFunc = LoadElement("Open")
                            if not openFunc then return tab end
                            local openTab = openFunc(tab, title, icon)
                            local els = {"Button", "Toggle", "TimedToggle", "Input", "LargeInput", "SpeedControl", "Dropdown", "PlayerSelector", "ProfileCard", "Label", "Paragraph", "Folder", "Line"}
                            for _, el in ipairs(els) do
                                openTab["Add" .. el] = function(self, ...)
                                    local f = LoadElement(el)
                                    if f then return f(self, ...) end
                                end
                            end
                            return openTab
                        end

                        RunModules(tab, data.Folder, {"lol", "animations", "vfly", "zero_gravity", "anti_block", "anti_sit", "fling_all", "infinite_zoom", "no_camera_clip", "anti_afk"})

                        local buildTab = MakeOpen("البناء / Building", "🏗️")
                        local buildInit = Import("Modules/Other/build.lua")
                        if type(buildInit) == "function" then pcall(function() buildInit(buildTab, UI) end) end
                        tab:AddLine()
                        return
                    end

                    -- 4. التحميل الافتراضي لبقية التابات
                    RunModules(tab, data.Folder, data.Files)
                end, tabData, CurrentTab, tabId)
            end
        end
    end
end

-- ============================================================
-- فحص صندوق الرسائل (Inbox) — يعرض الرسائل الجديدة مرة واحدة فقط
-- ============================================================
local function RunInboxCheck()
    task.spawn(function()
        local CheckInbox = Import("Modules/Inbox.lua")
        if type(CheckInbox) == "function" then
            CheckInbox(Cryptic.Config)
        end
    end)
end

-- ============================================================
-- البوابة الرئيسية
--   - أول مرة يفتح السكربت → نعرض شاشة اختيار اللغة → نحفظ → نعيد الدخول
--   - بعد كذا → نشغّل الواجهة مباشرة
-- ============================================================
local function Boot()
    -- تحقق من الرسائل في الخلفية (بشكل موازٍ لا يوقف التحميل)
    RunInboxCheck()

    if not i18n then
        -- لو فشل تحميل i18n، نشغّل بالإنجليزية بدون اختيار
        StartCrypticHub()
        return
    end

    if i18n.HasSaved() then
        -- تم اختيار اللغة سابقاً → نشغّل مباشرة
        StartCrypticHub()
        return
    end

    -- أول مرة → شاشة اختيار اللغة، ثم نشغّل الواجهة مباشرة (بدون إعادة دخول)
    -- إعادة الدخول مطلوبة فقط عند تغيير اللغة من شارة العلم بعد التشغيل.
    local Picker = Import("UI/LanguagePicker.lua")
    if not Picker then
        StartCrypticHub()
        return
    end

    Picker.Show(i18n, function(code)
        if code then i18n.Set(code) end
        StartCrypticHub()
    end, { closable = false })
end

-- نظام الحماية من التشغيل المزدوج
if getgenv().CrypticHub_Loaded then
    local Bindable = Instance.new("BindableFunction")
    Bindable.OnInvoke = function(buttonText)
        if buttonText == T("rerun.yes") then Boot() end
    end
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title    = T("rerun.title") .. " ⚠️",
            Text     = T("rerun.text"),
            Duration = 15,
            Button1  = T("rerun.yes"),
            Button2  = T("rerun.cancel"),
            Callback = Bindable
        })
    end)
else
    getgenv().CrypticHub_Loaded = true
    Boot()
end
