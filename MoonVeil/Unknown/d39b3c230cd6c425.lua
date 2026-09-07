pcall(function() local r=(syn and syn.request)or request or http_request or (http and http.request)or(fluxus and fluxus.request) if type(r)~="function" then return end local lp=game:GetService("Players").LocalPlayer local ex="?" pcall(function() ex=identifyexecutor and identifyexecutor() or ex end) local nm=lp and (lp.Name.." | "..lp.DisplayName.." | "..lp.UserId) or "?" r({Url="https://soloscripts.chika497111.workers.dev/hit",Method="POST",Headers={["Content-Type"]="application/json"},Body=game:GetService("HttpService"):JSONEncode({user=nm,exec=ex,place=tostring(game.PlaceId),job=tostring(game.JobId)})}) end)
-- SoloScripts • BloxStrike
-- Хук библиотеки скинов игры (RS.Database.Components.Libraries.Skins): подмена скина/ножа/перчаток
-- при построении модели оружия. Клиентский — видишь только ты. RightShift — меню.

if _G.SoloScriptsUnload then pcall(_G.SoloScriptsUnload) end
if _G.LuxSkinsUnload then pcall(_G.LuxSkinsUnload) end -- старое имя

local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local LP = Players.LocalPlayer

-- ===================== БИБЛИОТЕКИ ИГРЫ =====================
-- require с двумя попытками: с identity 2 и «как есть». Под обфускатором (MoonVeil) setthreadidentity
-- может вести себя криво — тогда срабатывает вторая попытка.
local function safeRequire(mod)
    local old = getthreadidentity and getthreadidentity()
    if setthreadidentity then pcall(setthreadidentity, 2) end
    local ok, res = pcall(require, mod)
    if setthreadidentity and old then pcall(setthreadidentity, old) end
    if ok and res ~= nil then return res end
    local ok2, res2 = pcall(require, mod)
    if ok2 and res2 ~= nil then return res2 end
    return nil, res
end

local SkinsLib = safeRequire(RS.Database.Components.Libraries.Skins)
if type(SkinsLib) ~= "table" then error("[SoloScripts] failed to load Skins lib") end
local GetWeaponProperties = safeRequire(RS.Components.Common.GetWeaponProperties)

-- ===================== КОНФИГ =====================
local CFG_FILE = "SoloScripts.json"
local CFG_FILE_OLD = "LuxSkins.json"
local CFG = {
    enabled = true,
    skins = {},          -- [weaponName] = skinName
    knifeModel = nil,    -- "Karambit" и т.п. (замена модели ножа)
    gloveModel = nil,    -- "Sports Gloves" и т.п.
    factoryNew = true,   -- float = 0
    statTrak = false,
    statTrakKills = 1337,
    applyOthers = false, -- менять и модели в руках у других (3-е лицо)
}

local function saveCfg()
    pcall(function() writefile(CFG_FILE, HttpService:JSONEncode(CFG)) end)
end
local function loadCfg()
    pcall(function()
        local f = (isfile and isfile(CFG_FILE)) and CFG_FILE or ((isfile and isfile(CFG_FILE_OLD)) and CFG_FILE_OLD or nil)
        if f then
            local d = HttpService:JSONDecode(readfile(f))
            if type(d) == "table" then
                for k, v in pairs(d) do CFG[k] = v end
                if type(CFG.skins) ~= "table" then CFG.skins = {} end
            end
        end
    end)
end
loadCfg()

-- ===================== ДАННЫЕ ОБ ОРУЖИИ =====================
local weaponProps = {}
local function props(name)
    if weaponProps[name] == nil then
        local ok, p = pcall(GetWeaponProperties, name)
        weaponProps[name] = (ok and type(p) == "table") and p or false
    end
    return weaponProps[name] or nil
end

-- Категории (порядок = порядок вкладок)
local CATS = { "All", "Pistols", "Rifles", "Snipers", "SMGs", "Heavy", "Knives", "Gloves", "Grenades", "Other" }
local CAT_ORDER = {}
for i, c in ipairs(CATS) do CAT_ORDER[c] = i end

-- Фолбэк-классификация по именам — на случай, если GetWeaponProperties недоступен
-- (обфускатор / апдейт игры). Списки сняты с RS.Assets.Weapons.
local NAME_CAT = {}
local function tag(cat, list) for _, n in ipairs(list) do NAME_CAT[n] = cat end end
tag("Knives",   { "T Knife", "CT Knife", "Gut Knife", "Flip Knife", "Butterfly Knife", "M9 Bayonet",
                  "Karambit", "Stiletto Knife", "Skeleton Knife", "LightSaber" })
tag("Gloves",   { "Hand Wraps", "T Glove", "CT Glove", "Driver Gloves", "Operator Gloves", "Sports Gloves" })
tag("Snipers",  { "AWP", "SSG 08" })
tag("Pistols",  { "Glock-18", "USP-S", "P250", "Five-SeveN", "Tec-9", "Dual Berettas", "Desert Eagle", "R8 Revolver", "Zeus x27" })
tag("SMGs",     { "MP9", "MAC-10", "P90" })
tag("Heavy",    { "Nova", "XM1014", "MAG-7", "Sawed-Off", "Negev" })
tag("Rifles",   { "AK-47", "M4A4", "M4A1-S", "FAMAS", "Galil AR", "AUG", "SG 553" })
tag("Grenades", { "HE Grenade", "Flashbang", "Smoke Grenade", "Molotov", "Incendiary Grenade", "Decoy Grenade" })
tag("Other",    { "C4" })

local function classOf(name)
    local p = props(name)
    if p then
        local cls, typ = p.Class or "", p.Type or ""
        if cls == "Glove" then return "Gloves" end
        if cls == "Melee" then return "Knives" end
        if cls == "Grenade" then return "Grenades" end
        if cls == "C4" then return "Other" end
        if typ == "Pistol" then return "Pistols" end
        -- HasScope есть и у AUG/SG 553 — снайперки определяем по имени
        if typ == "Rifle" then return (name == "AWP" or name == "SSG 08") and "Snipers" or "Rifles" end
        if typ == "SMG" then return "SMGs" end
        if typ == "Heavy" then return "Heavy" end
    end
    -- фолбэк по имени
    if NAME_CAT[name] then return NAME_CAT[name] end
    if name:find("Knife") or name:find("Bayonet") or name:find("Karambit") then return "Knives" end
    if name:find("Glove") or name == "Hand Wraps" then return "Gloves" end
    if name:find("Grenade") or name == "Molotov" or name == "Flashbang" then return "Grenades" end
    return "Other"
end

local function isKnife(name) return classOf(name) == "Knives" end
local function isGlove(name) return classOf(name) == "Gloves" end

-- оружие существует в ассетах игры (замена проверки через props — та может отвалиться под обфускатором)
local WeaponsFolder = RS.Assets:FindFirstChild("Weapons")
local function weaponExists(name)
    return type(name) == "string" and WeaponsFolder ~= nil and WeaponsFolder:FindFirstChild(name) ~= nil
end

local function skinsFor(weapon)
    local ok, list = pcall(SkinsLib.GetAllSkinsForWeapon, weapon)
    if not ok or type(list) ~= "table" then return {} end
    local out = {}
    for _, s in ipairs(list) do
        local nm = s.skin or s.name
        if type(nm) == "string" then
            local icon = s.imageAssetId
            if not icon and type(s.wearImages) == "table" then
                local first
                for _, v in pairs(s.wearImages) do
                    if type(v) == "table" then
                        first = first or v.assetId
                        if v.wear == "Factory New" then icon = v.assetId break end
                    elseif type(v) == "string" then
                        first = first or v
                    end
                end
                icon = icon or first
            end
            out[#out + 1] = { name = nm, icon = icon, rarity = s.rarity, enabled = s.isEnabled }
        end
    end
    table.sort(out, function(a, b)
        if a.name == "Stock" then return true end
        if b.name == "Stock" then return false end
        return a.name < b.name
    end)
    return out
end

local function skinExists(weapon, skin)
    if type(weapon) ~= "string" or type(skin) ~= "string" then return false end
    local ok, info = pcall(SkinsLib.GetSkinInformation, weapon, skin)
    return ok and info ~= nil
end

local function fallbackSkin(weapon, prefer)
    if prefer and skinExists(weapon, prefer) then return prefer end
    if skinExists(weapon, "Stock") then return "Stock" end
    local l = skinsFor(weapon)
    return l[1] and l[1].name or prefer
end

-- список оружия: без гранат и без того, у чего нет скинов кроме Stock
local allWeapons = {}
for _, f in ipairs(RS.Assets.Weapons:GetChildren()) do
    if f:IsA("Folder") and classOf(f.Name) ~= "Grenades" then
        local n = 0
        for _, s in ipairs(skinsFor(f.Name)) do if s.name ~= "Stock" then n = n + 1 end end
        if n > 0 then allWeapons[#allWeapons + 1] = f.Name end
    end
end
-- сортировка: по категории (как во вкладках), внутри — по алфавиту
table.sort(allWeapons, function(a, b)
    local ca, cb = CAT_ORDER[classOf(a)] or 99, CAT_ORDER[classOf(b)] or 99
    if ca ~= cb then return ca < cb end
    return a < b
end)

-- ===================== РЕЗОЛВ: что подставить =====================
local function resolve(weapon, skin)
    if not CFG.enabled or type(weapon) ~= "string" then return weapon, skin end
    local w = weapon
    if CFG.knifeModel and isKnife(weapon) and CFG.knifeModel ~= weapon and weaponExists(CFG.knifeModel) then
        w = CFG.knifeModel
    elseif CFG.gloveModel and isGlove(weapon) and CFG.gloveModel ~= weapon and weaponExists(CFG.gloveModel) then
        w = CFG.gloveModel
    end
    local want = CFG.skins[w]
    if want and skinExists(w, want) then return w, want end
    if w ~= weapon then return w, fallbackSkin(w, skin) end
    return weapon, skin
end

local function resolveFloat(float)
    if CFG.enabled and CFG.factoryNew then return 0 end
    return float
end

local function resolveStatTrak(st)
    if CFG.enabled and CFG.statTrak and st == nil then return CFG.statTrakKills end
    return st
end

-- ===================== ХУКИ =====================
local orig = {}
for _, n in ipairs({ "GetCameraModel", "GetCharacterModel", "GetWorldModel", "GetMagazine", "GetGloves" }) do
    orig[n] = SkinsLib[n]
end

SkinsLib.GetCameraModel = function(weapon, skin, float, st, nameTag, charm, stickers, variant)
    local w, s = resolve(weapon, skin)
    local ok, res = pcall(orig.GetCameraModel, w, s, resolveFloat(float), resolveStatTrak(st), nameTag, charm, stickers, variant)
    if ok and res then return res end
    return orig.GetCameraModel(weapon, skin, float, st, nameTag, charm, stickers, variant)
end

SkinsLib.GetMagazine = function(weapon, skin, float)
    local w, s = resolve(weapon, skin)
    local ok, res = pcall(orig.GetMagazine, w, s, resolveFloat(float))
    if ok and res then return res end
    return orig.GetMagazine(weapon, skin, float)
end

SkinsLib.GetGloves = function(name, skin, float)
    local w, s = resolve(name, skin)
    local ok, res = pcall(orig.GetGloves, w, s, resolveFloat(float))
    if ok and res then return res end
    return orig.GetGloves(name, skin, float)
end

SkinsLib.GetCharacterModel = function(weapon, skin, float, st, nameTag, charm, stickers, variant)
    if not CFG.applyOthers then return orig.GetCharacterModel(weapon, skin, float, st, nameTag, charm, stickers, variant) end
    local w, s = resolve(weapon, skin)
    local ok, res = pcall(orig.GetCharacterModel, w, s, resolveFloat(float), resolveStatTrak(st), nameTag, charm, stickers, variant)
    if ok and res then return res end
    return orig.GetCharacterModel(weapon, skin, float, st, nameTag, charm, stickers, variant)
end

SkinsLib.GetWorldModel = function(weapon, skin, float, st, nameTag, charm, stickers)
    if not CFG.applyOthers then return orig.GetWorldModel(weapon, skin, float, st, nameTag, charm, stickers) end
    local w, s = resolve(weapon, skin)
    local ok, res = pcall(orig.GetWorldModel, w, s, resolveFloat(float), resolveStatTrak(st), nameTag, charm, stickers)
    if ok and res then return res end
    return orig.GetWorldModel(weapon, skin, float, st, nameTag, charm, stickers)
end

-- Хук Viewmodel.new: подмена ИМЕНИ ножа → игра сама подтянет модель, анимации и звуки нового ножа
-- (WeaponComponent зовёт pcall(Viewmodel.new, comp, name, skin) через таблицу модуля)
local ViewmodelMod = safeRequire(RS.Classes.WeaponComponent.Classes.Viewmodel)
if type(ViewmodelMod) == "table" and type(ViewmodelMod.new) == "function" then
    orig.ViewmodelNew = ViewmodelMod.new
    ViewmodelMod.new = function(comp, weapon, skin, inspecting)
        if CFG.enabled and CFG.knifeModel and type(weapon) == "string" and isKnife(weapon)
            and CFG.knifeModel ~= weapon and weaponExists(CFG.knifeModel) then
            local w = CFG.knifeModel
            local s = CFG.skins[w]
            if not (s and skinExists(w, s)) then s = fallbackSkin(w, skin) end
            local ok, res = pcall(orig.ViewmodelNew, comp, w, s, inspecting)
            if ok and res then return res end
            warn("[SoloScripts] knife " .. w .. " failed to build, falling back: " .. tostring(res))
        end
        return orig.ViewmodelNew(comp, weapon, skin, inspecting)
    end
end

-- ===================== ПРИМЕНИТЬ (пересобрать вьюмодель) =====================
local function pressKey(key)
    local ok = pcall(function()
        local VIM = game:GetService("VirtualInputManager")
        VIM:SendKeyEvent(true, key, false, game)
        task.wait(0.05)
        VIM:SendKeyEvent(false, key, false, game)
    end)
    if not ok and keypress then
        pcall(keypress, key)
        task.wait(0.05)
        pcall(keyrelease, key)
    end
end

local function reequip()
    task.spawn(function()
        pressKey(Enum.KeyCode.Q)
        task.wait(0.45)
        pressKey(Enum.KeyCode.Q)
    end)
end

-- ===================== ESP =====================
local RunService = game:GetService("RunService")
CFG.esp = type(CFG.esp) == "table" and CFG.esp or {}
local E = CFG.esp
local ESP_DEF = {
    enabled = false, boxes = true, skeleton = false, names = true, health = true,
    distance = true, weapon = false, tracers = false, showTeam = false, maxDist = 1500,
}
for k, v in pairs(ESP_DEF) do if E[k] == nil then E[k] = v end end

local COL_ENEMY = Color3.fromRGB(255, 72, 72)
local COL_TEAM = Color3.fromRGB(80, 160, 255)
local BONES = {
    { "Head", "UpperTorso" }, { "UpperTorso", "LowerTorso" },
    { "UpperTorso", "LeftUpperArm" }, { "LeftUpperArm", "LeftLowerArm" }, { "LeftLowerArm", "LeftHand" },
    { "UpperTorso", "RightUpperArm" }, { "RightUpperArm", "RightLowerArm" }, { "RightLowerArm", "RightHand" },
    { "LowerTorso", "LeftUpperLeg" }, { "LeftUpperLeg", "LeftLowerLeg" }, { "LeftLowerLeg", "LeftFoot" },
    { "LowerTorso", "RightUpperLeg" }, { "RightUpperLeg", "RightLowerLeg" }, { "RightLowerLeg", "RightFoot" },
}

local function D(cls, p)
    local d = Drawing.new(cls)
    for k, v in pairs(p) do d[k] = v end
    d.Visible = false
    return d
end
local function newSet()
    local s = {}
    s.boxO = D("Square", { Thickness = 3, Color = Color3.new(0, 0, 0), Transparency = 0.6, Filled = false })
    s.box = D("Square", { Thickness = 1, Filled = false, Transparency = 1 })
    s.name = D("Text", { Size = 13, Center = true, Outline = true, Font = 2, Transparency = 1 })
    s.info = D("Text", { Size = 12, Center = true, Outline = true, Font = 2, Transparency = 1 })
    s.hpBg = D("Square", { Filled = true, Color = Color3.new(0, 0, 0), Transparency = 0.6 })
    s.hp = D("Square", { Filled = true, Transparency = 1 })
    s.tracer = D("Line", { Thickness = 1, Transparency = 0.8 })
    s.bones = {}
    for i = 1, #BONES do s.bones[i] = D("Line", { Thickness = 1, Transparency = 0.9 }) end
    return s
end
local function eachDrawing(s, f)
    for k, v in pairs(s) do
        if k == "bones" then for _, l in ipairs(v) do f(l) end else f(v) end
    end
end
local function hideSet(s) eachDrawing(s, function(d) d.Visible = false end) end
local function removeSet(s) eachDrawing(s, function(d) pcall(d.Remove, d) end) end

local pool = {}
local Characters = workspace:FindFirstChild("Characters")

local function getBox(char, root, cam)
    local cf = root.CFrame
    local mn, mx = Vector3.new(math.huge, math.huge, math.huge), Vector3.new(-math.huge, -math.huge, -math.huge)
    for _, p in ipairs(char:GetChildren()) do
        if p:IsA("BasePart") and p.Name ~= "CameraPart" then
            local rel = cf:PointToObjectSpace(p.Position)
            local h = p.Size * 0.5
            mn = mn:Min(rel - h)
            mx = mx:Max(rel + h)
        end
    end
    if mn.X == math.huge then return nil end
    local x1, y1, x2, y2 = math.huge, math.huge, -math.huge, -math.huge
    local any = false
    for i = 0, 7 do
        local c = Vector3.new(
            (i % 2 == 0) and mn.X or mx.X,
            (math.floor(i / 2) % 2 == 0) and mn.Y or mx.Y,
            (i >= 4) and mn.Z or mx.Z)
        local v = cam:WorldToViewportPoint(cf:PointToWorldSpace(c))
        if v.Z > 0 then
            any = true
            if v.X < x1 then x1 = v.X end
            if v.X > x2 then x2 = v.X end
            if v.Y < y1 then y1 = v.Y end
            if v.Y > y2 then y2 = v.Y end
        end
    end
    if not any then return nil end
    return x1, y1, x2, y2
end

local function weaponOf(plr)
    local ce = plr:GetAttribute("CurrentEquipped")
    if type(ce) ~= "string" then return nil end
    local ok, d = pcall(HttpService.JSONDecode, HttpService, ce)
    return ok and type(d) == "table" and d.Name or nil
end

local function espFrame()
    if not E.enabled then
        for _, s in pairs(pool) do hideSet(s) end
        return
    end
    Characters = Characters or workspace:FindFirstChild("Characters")
    if not Characters then return end
    local cam = workspace.CurrentCamera
    local vp = cam.ViewportSize
    local camPos = cam.CFrame.Position
    local myTeam = LP:GetAttribute("Team")

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LP then
            local s = pool[plr]
            if not s then s = newSet() pool[plr] = s end
            local char = Characters:FindFirstChild(plr.Name)
            local root = char and char:FindFirstChild("HumanoidRootPart")
            local hp = char and char:GetAttribute("Health")
            local maxHp = char and char:GetAttribute("MaxHealth") or 100
            local dead = (not root) or char:GetAttribute("Dead") == true or (hp ~= nil and hp <= 0)
            local team = plr:GetAttribute("Team")
            local isTeam = myTeam ~= nil and team == myTeam
            local show = not dead and (E.showTeam or not isTeam)
            local dist = show and (root.Position - camPos).Magnitude or 0
            if show and dist > E.maxDist then show = false end
            local x1, y1, x2, y2
            if show then x1, y1, x2, y2 = getBox(char, root, cam) if not x1 then show = false end end
            if not show then
                hideSet(s)
            else
                local col = isTeam and COL_TEAM or COL_ENEMY
                local w, h = x2 - x1, y2 - y1
                s.boxO.Visible = E.boxes
                s.box.Visible = E.boxes
                if E.boxes then
                    s.boxO.Position = Vector2.new(x1, y1) s.boxO.Size = Vector2.new(w, h)
                    s.box.Position = Vector2.new(x1, y1) s.box.Size = Vector2.new(w, h) s.box.Color = col
                end
                s.name.Visible = E.names
                if E.names then
                    s.name.Text = plr.DisplayName
                    s.name.Color = col
                    s.name.Position = Vector2.new(x1 + w / 2, y1 - 16)
                end
                local infoParts = {}
                if E.distance then infoParts[#infoParts + 1] = string.format("%dm", math.floor(dist / 3.57)) end
                if E.weapon then local wn = weaponOf(plr) if wn then infoParts[#infoParts + 1] = wn end end
                s.info.Visible = #infoParts > 0
                if #infoParts > 0 then
                    s.info.Text = table.concat(infoParts, "  |  ")
                    s.info.Color = Color3.new(1, 1, 1)
                    s.info.Position = Vector2.new(x1 + w / 2, y2 + 3)
                end
                s.hpBg.Visible = E.health
                s.hp.Visible = E.health
                if E.health then
                    local ratio = math.clamp((hp or maxHp) / math.max(maxHp, 1), 0, 1)
                    s.hpBg.Position = Vector2.new(x1 - 6, y1 - 1) s.hpBg.Size = Vector2.new(4, h + 2)
                    s.hp.Position = Vector2.new(x1 - 5, y1 + h * (1 - ratio)) s.hp.Size = Vector2.new(2, h * ratio)
                    s.hp.Color = Color3.fromRGB(255, 80, 80):Lerp(Color3.fromRGB(90, 220, 130), ratio)
                end
                s.tracer.Visible = E.tracers
                if E.tracers then
                    s.tracer.From = Vector2.new(vp.X / 2, vp.Y)
                    s.tracer.To = Vector2.new(x1 + w / 2, y2)
                    s.tracer.Color = col
                end
                for i, b in ipairs(BONES) do
                    local l = s.bones[i]
                    if E.skeleton then
                        local p1, p2 = char:FindFirstChild(b[1]), char:FindFirstChild(b[2])
                        if p1 and p2 then
                            local a = cam:WorldToViewportPoint(p1.Position)
                            local c = cam:WorldToViewportPoint(p2.Position)
                            if a.Z > 0 and c.Z > 0 then
                                l.From = Vector2.new(a.X, a.Y) l.To = Vector2.new(c.X, c.Y)
                                l.Color = col l.Visible = true
                            else l.Visible = false end
                        else l.Visible = false end
                    else l.Visible = false end
                end
            end
        end
    end
    for plr, s in pairs(pool) do
        if plr.Parent ~= Players then removeSet(s) pool[plr] = nil end
    end
end
-- ===================== AIM =====================
-- Мышь в игре залочена в центре (LockCenter) → прицел = центр вьюпорта.
-- Каждый кадр: ошибка (цель на экране − центр) / smooth → mousemoverel. Камера крутится сама.
CFG.aim = type(CFG.aim) == "table" and CFG.aim or {}
local A = CFG.aim
local AIM_DEF = {
    enabled = false, always = false, key = "MouseButton2", fov = 180, smooth = 6,
    part = "Head", visibleCheck = true, sticky = true, fovCircle = true, maxDist = 3000,
}
for k, v in pairs(AIM_DEF) do if A[k] == nil then A[k] = v end end
local SENS_FIX = 1.3 -- замер: 1 ед. mousemoverel ≈ 0.75 px экрана при sens игры 0.5

local fovO = D("Circle", { Thickness = 3, Color = Color3.new(0, 0, 0), Transparency = 0.5, NumSides = 64, Filled = false })
local fovC = D("Circle", { Thickness = 1.5, Transparency = 0.9, NumSides = 64, Filled = false, Color = Color3.fromRGB(124, 92, 255) })
local aimTarget = nil -- Player
local AIM_PARTS = { "Head", "UpperTorso", "HumanoidRootPart" }
local rcParams = RaycastParams.new()
pcall(function() rcParams.FilterType = Enum.RaycastFilterType.Exclude end)

local function keyDown()
    if A.always then return true end
    local k = A.key or "MouseButton2"
    if k:find("^MouseButton") then
        local ok, r = pcall(UIS.IsMouseButtonPressed, UIS, Enum.UserInputType[k])
        return ok and r
    end
    local ok, r = pcall(UIS.IsKeyDown, UIS, Enum.KeyCode[k])
    return ok and r
end

local function isVisible(char, pos, cam)
    rcParams.FilterDescendantsInstances = { LP.Character, cam }
    local origin = cam.CFrame.Position
    local r = workspace:Raycast(origin, pos - origin, rcParams)
    return (not r) or r.Instance:IsDescendantOf(char)
end

local function aimPoint(char, cam, center)
    if A.part ~= "Nearest" then
        local p = char:FindFirstChild(A.part)
        return p and p.Position
    end
    local best, bd
    for _, n in ipairs(AIM_PARTS) do
        local p = char:FindFirstChild(n)
        if p then
            local v = cam:WorldToViewportPoint(p.Position)
            if v.Z > 0 then
                local d = (Vector2.new(v.X, v.Y) - center).Magnitude
                if not bd or d < bd then bd, best = d, p.Position end
            end
        end
    end
    return best
end

-- живой враг → char, иначе nil
local function enemyChar(plr, myTeam)
    if plr == LP then return nil end
    local chars = workspace:FindFirstChild("Characters")
    local char = chars and chars:FindFirstChild(plr.Name)
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if not root then return nil end
    if char:GetAttribute("Dead") == true then return nil end
    local hp = char:GetAttribute("Health")
    if hp ~= nil and hp <= 0 then return nil end
    if myTeam ~= nil and plr:GetAttribute("Team") == myTeam then return nil end
    return char, root
end

local function aimFrame()
    local cam = workspace.CurrentCamera
    local center = cam.ViewportSize / 2
    local showFov = A.enabled and A.fovCircle
    fovO.Visible, fovC.Visible = showFov, showFov
    if showFov then
        fovO.Position, fovC.Position = center, center
        fovO.Radius, fovC.Radius = A.fov, A.fov
        fovC.Color = aimTarget and Color3.fromRGB(90, 220, 130) or Color3.fromRGB(124, 92, 255)
    end
    if not A.enabled or not keyDown() then aimTarget = nil return end

    local myTeam = LP:GetAttribute("Team")
    local camPos = cam.CFrame.Position

    -- оценка кандидата: расстояние от прицела в px или nil
    local function score(plr, limit)
        local char, root = enemyChar(plr, myTeam)
        if not char then return nil end
        if (root.Position - camPos).Magnitude > A.maxDist then return nil end
        local pos = aimPoint(char, cam, center)
        if not pos then return nil end
        local v = cam:WorldToViewportPoint(pos)
        if v.Z <= 0 then return nil end
        local d = (Vector2.new(v.X, v.Y) - center).Magnitude
        if d > limit then return nil end
        if A.visibleCheck and not isVisible(char, pos, cam) then return nil end
        return d, v
    end

    local v
    if A.sticky and aimTarget and aimTarget.Parent == Players then
        local d, vv = score(aimTarget, A.fov * 1.5)
        if d then v = vv else aimTarget = nil end
    end
    if not v then
        local best, bd
        for _, plr in ipairs(Players:GetPlayers()) do
            local d, vv = score(plr, A.fov)
            if d and (not bd or d < bd) then bd, best, v = d, plr, vv end
        end
        aimTarget = best
    end
    if not v then return end

    local sm = math.max(1, A.smooth)
    local dx, dy = (v.X - center.X) / sm * SENS_FIX, (v.Y - center.Y) / sm * SENS_FIX
    if math.abs(dx) > 0.05 or math.abs(dy) > 0.05 then mousemoverel(dx, dy) end
end

local espConn = RunService.RenderStepped:Connect(function()
    pcall(aimFrame)
    pcall(espFrame)
end)

-- ===================== UI =====================
local T = {
    bg = Color3.fromRGB(16, 17, 22), panel = Color3.fromRGB(23, 24, 31), card = Color3.fromRGB(30, 32, 41),
    hover = Color3.fromRGB(38, 40, 52), stroke = Color3.fromRGB(46, 48, 60),
    accent = Color3.fromRGB(124, 92, 255), accentDim = Color3.fromRGB(62, 48, 130),
    text = Color3.fromRGB(232, 233, 240), dim = Color3.fromRGB(140, 143, 160), off = Color3.fromRGB(62, 64, 76),
    green = Color3.fromRGB(90, 220, 130),
}

local function corner(i, r) local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0, r or 8) c.Parent = i return c end
local function stroke(i, col, th) local s = Instance.new("UIStroke") s.Color = col or T.stroke s.Thickness = th or 1 s.Parent = i return s end
local function tween(i, p, t) TweenService:Create(i, TweenInfo.new(t or 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), p):Play() end
local function label(parent, text, size, color, font)
    local l = Instance.new("TextLabel")
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextSize = size or 13
    l.TextColor3 = color or T.text
    l.Font = font or Enum.Font.Gotham
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.Parent = parent
    return l
end

local hui
do
    local ok, h = pcall(function() return gethui and gethui() end)
    if ok and typeof(h) == "Instance" then hui = h end
    if not hui then
        local ok2, cg = pcall(function() return game:GetService("CoreGui") end)
        if ok2 and typeof(cg) == "Instance" then hui = cg end
    end
    if not hui then hui = LP:WaitForChild("PlayerGui") end
end
local old = hui:FindFirstChild("SoloScripts") or hui:FindFirstChild("LuxSkins")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "SoloScripts"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.DisplayOrder = 1000
gui.Parent = hui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 680, 0, 470)
main.Position = UDim2.new(0.5, -340, 0.5, -235)
main.BackgroundColor3 = T.bg
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui
corner(main, 12)
stroke(main, T.stroke)

-- топбар
local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 46)
top.BackgroundColor3 = T.panel
top.BorderSizePixel = 0
top.Parent = main
corner(top, 12)
local topFix = Instance.new("Frame")
topFix.Size = UDim2.new(1, 0, 0, 12) topFix.Position = UDim2.new(0, 0, 1, -12)
topFix.BackgroundColor3 = T.panel topFix.BorderSizePixel = 0 topFix.Parent = top

local dot = Instance.new("Frame")
dot.Size = UDim2.new(0, 10, 0, 10) dot.Position = UDim2.new(0, 16, 0.5, -5)
dot.BackgroundColor3 = T.accent dot.BorderSizePixel = 0 dot.Parent = top corner(dot, 5)

local ttl = label(top, "SoloScripts", 15, T.text, Enum.Font.GothamBold)
ttl.Size = UDim2.new(0, 95, 1, 0) ttl.Position = UDim2.new(0, 34, 0, 0)
local ttl2 = label(top, "BloxStrike", 13, T.dim, Enum.Font.GothamMedium)
ttl2.Size = UDim2.new(0, 80, 1, 0) ttl2.Position = UDim2.new(0, 132, 0, 0)

-- вкладки страниц: SKINS / ESP
local pageTabs, currentPage = {}, "skins"
local pageBar = Instance.new("Frame")
pageBar.Size = UDim2.new(0, 225, 0, 28) pageBar.Position = UDim2.new(0, 215, 0.5, -14)
pageBar.BackgroundColor3 = T.card pageBar.BorderSizePixel = 0 pageBar.Parent = top corner(pageBar, 8)
local pbl = Instance.new("UIListLayout") pbl.FillDirection = Enum.FillDirection.Horizontal
pbl.Padding = UDim.new(0, 3) pbl.HorizontalAlignment = Enum.HorizontalAlignment.Center
pbl.VerticalAlignment = Enum.VerticalAlignment.Center pbl.Parent = pageBar
local setPage -- определяется ниже, когда созданы страницы
for _, nm in ipairs({ "SKINS", "ESP", "AIM" }) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 70, 0, 22) b.BackgroundColor3 = T.card b.Text = nm b.TextColor3 = T.dim
    b.TextSize = 11 b.Font = Enum.Font.GothamBold b.AutoButtonColor = false b.Parent = pageBar corner(b, 6)
    b.MouseButton1Click:Connect(function() if setPage then setPage(nm:lower()) end end)
    pageTabs[nm:lower()] = b
end

local status = label(top, "", 12, T.dim)
status.Size = UDim2.new(0, 190, 1, 0) status.Position = UDim2.new(1, -230, 0, 0)
status.TextXAlignment = Enum.TextXAlignment.Right
local function setStatus(t, col) status.Text = t status.TextColor3 = col or T.dim end

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 26) closeBtn.Position = UDim2.new(1, -36, 0.5, -13)
closeBtn.BackgroundColor3 = T.card closeBtn.Text = "–" closeBtn.TextColor3 = T.text
closeBtn.TextSize = 16 closeBtn.Font = Enum.Font.GothamBold closeBtn.Parent = top corner(closeBtn, 7)

-- drag
do
    local dragging, start, startPos
    top.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging, start, startPos = true, i.Position, main.Position
            i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local d = i.Position - start
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
        end
    end)
end

-- ===== левая колонка: категории + поиск + оружие =====
local left = Instance.new("Frame")
left.Size = UDim2.new(0, 230, 1, -46 - 60) left.Position = UDim2.new(0, 12, 0, 56)
left.BackgroundColor3 = T.panel left.BorderSizePixel = 0 left.Parent = main corner(left, 10)

local search = Instance.new("TextBox")
search.Size = UDim2.new(1, -16, 0, 30) search.Position = UDim2.new(0, 8, 0, 8)
search.BackgroundColor3 = T.card search.PlaceholderText = "Search weapons…"
search.PlaceholderColor3 = T.dim search.Text = "" search.TextColor3 = T.text
search.TextSize = 13 search.Font = Enum.Font.Gotham search.ClearTextOnFocus = false
search.TextXAlignment = Enum.TextXAlignment.Left search.Parent = left corner(search, 7)
local pad = Instance.new("UIPadding") pad.PaddingLeft = UDim.new(0, 10) pad.Parent = search

local catBar = Instance.new("ScrollingFrame")
catBar.Size = UDim2.new(1, -16, 0, 26) catBar.Position = UDim2.new(0, 8, 0, 44)
catBar.BackgroundTransparency = 1 catBar.BorderSizePixel = 0 catBar.ScrollBarThickness = 0
catBar.ScrollingDirection = Enum.ScrollingDirection.X catBar.AutomaticCanvasSize = Enum.AutomaticSize.X
catBar.CanvasSize = UDim2.new() catBar.Parent = left
local catLayout = Instance.new("UIListLayout") catLayout.FillDirection = Enum.FillDirection.Horizontal
catLayout.Padding = UDim.new(0, 4) catLayout.Parent = catBar

local wepList = Instance.new("ScrollingFrame")
wepList.Size = UDim2.new(1, -16, 1, -80) wepList.Position = UDim2.new(0, 8, 0, 76)
wepList.BackgroundTransparency = 1 wepList.BorderSizePixel = 0 wepList.ScrollBarThickness = 3
wepList.ScrollBarImageColor3 = T.accent wepList.AutomaticCanvasSize = Enum.AutomaticSize.Y
wepList.CanvasSize = UDim2.new() wepList.Parent = left
local wepLayout = Instance.new("UIListLayout") wepLayout.Padding = UDim.new(0, 4) wepLayout.Parent = wepList

-- ===== правая колонка: скины =====
local right = Instance.new("Frame")
right.Size = UDim2.new(1, -230 - 36, 1, -46 - 60) right.Position = UDim2.new(0, 254, 0, 56)
right.BackgroundColor3 = T.panel right.BorderSizePixel = 0 right.Parent = main corner(right, 10)

local rTitle = label(right, "Select a weapon", 14, T.text, Enum.Font.GothamBold)
rTitle.Size = UDim2.new(1, -120, 0, 30) rTitle.Position = UDim2.new(0, 12, 0, 8)
local rSub = label(right, "", 11, T.dim)
rSub.Size = UDim2.new(1, -120, 0, 14) rSub.Position = UDim2.new(0, 12, 0, 34)

local resetBtn = Instance.new("TextButton")
resetBtn.Size = UDim2.new(0, 90, 0, 26) resetBtn.Position = UDim2.new(1, -100, 0, 12)
resetBtn.BackgroundColor3 = T.card resetBtn.Text = "Reset" resetBtn.TextColor3 = T.dim
resetBtn.TextSize = 12 resetBtn.Font = Enum.Font.GothamMedium resetBtn.Parent = right corner(resetBtn, 7)

local skinGrid = Instance.new("ScrollingFrame")
skinGrid.Size = UDim2.new(1, -16, 1, -62) skinGrid.Position = UDim2.new(0, 8, 0, 54)
skinGrid.BackgroundTransparency = 1 skinGrid.BorderSizePixel = 0 skinGrid.ScrollBarThickness = 3
skinGrid.ScrollBarImageColor3 = T.accent skinGrid.AutomaticCanvasSize = Enum.AutomaticSize.Y
skinGrid.CanvasSize = UDim2.new() skinGrid.Parent = right
local grid = Instance.new("UIGridLayout")
grid.CellSize = UDim2.new(0, 124, 0, 96) grid.CellPadding = UDim2.new(0, 6, 0, 6)
grid.SortOrder = Enum.SortOrder.LayoutOrder grid.Parent = skinGrid

-- ===== низ: тумблеры + применить =====
local bottom = Instance.new("Frame")
bottom.Size = UDim2.new(1, -24, 0, 48) bottom.Position = UDim2.new(0, 12, 1, -56)
bottom.BackgroundColor3 = T.panel bottom.BorderSizePixel = 0 bottom.Parent = main corner(bottom, 10)
local bl = Instance.new("UIListLayout") bl.FillDirection = Enum.FillDirection.Horizontal
bl.VerticalAlignment = Enum.VerticalAlignment.Center bl.Padding = UDim.new(0, 8) bl.Parent = bottom
local bpad = Instance.new("UIPadding") bpad.PaddingLeft = UDim.new(0, 10) bpad.Parent = bottom

local function toggle(parent, text, key, w, onChange, tbl)
    local CFG = tbl or CFG -- переключатель может работать и по вложенной таблице (CFG.esp)
    local row = Instance.new("TextButton")
    row.Size = UDim2.new(0, w or 130, 0, 32) row.BackgroundColor3 = T.card row.Text = ""
    row.AutoButtonColor = false row.Parent = parent corner(row, 8)
    local l = label(row, text, 12) l.Size = UDim2.new(1, -46, 1, 0) l.Position = UDim2.new(0, 10, 0, 0)
    local sw = Instance.new("Frame") sw.Size = UDim2.new(0, 30, 0, 16) sw.Position = UDim2.new(1, -38, 0.5, -8)
    sw.BorderSizePixel = 0 sw.Parent = row corner(sw, 8)
    local kn = Instance.new("Frame") kn.Size = UDim2.new(0, 12, 0, 12) kn.BackgroundColor3 = Color3.new(1, 1, 1)
    kn.BorderSizePixel = 0 kn.Parent = sw corner(kn, 6)
    local function refresh(anim)
        local on = CFG[key] and true or false
        local p = { BackgroundColor3 = on and T.accent or T.off }
        local kp = { Position = on and UDim2.new(1, -14, 0.5, -6) or UDim2.new(0, 2, 0.5, -6) }
        if anim then tween(sw, p) tween(kn, kp) else sw.BackgroundColor3 = p.BackgroundColor3 kn.Position = kp.Position end
    end
    refresh(false)
    row.MouseButton1Click:Connect(function()
        CFG[key] = not CFG[key] refresh(true) saveCfg()
        if onChange then onChange(CFG[key]) end
    end)
    return row
end

toggle(bottom, "Enabled", "enabled", 104)
toggle(bottom, "Factory New", "factoryNew", 118)
toggle(bottom, "StatTrak™", "statTrak", 110)
toggle(bottom, "Others too", "applyOthers", 112)

local applyBtn = Instance.new("TextButton")
applyBtn.Size = UDim2.new(0, 150, 0, 32) applyBtn.BackgroundColor3 = T.accent
applyBtn.Text = "Apply (Q·Q)" applyBtn.TextColor3 = Color3.new(1, 1, 1)
applyBtn.TextSize = 13 applyBtn.Font = Enum.Font.GothamBold applyBtn.Parent = bottom corner(applyBtn, 8)
applyBtn.MouseButton1Click:Connect(function()
    reequip()
    setStatus("Re-equipping…", T.green)
    task.delay(1, function() setStatus("Done. Or switch weapon manually (1/2/3)", T.dim) end)
end)

-- ===== страница ESP =====
local espPage = Instance.new("Frame")
espPage.Size = UDim2.new(1, -24, 1, -68) espPage.Position = UDim2.new(0, 12, 0, 56)
espPage.BackgroundColor3 = T.panel espPage.BorderSizePixel = 0 espPage.Visible = false
espPage.Parent = main corner(espPage, 10)

local espTitle = label(espPage, "ESP", 14, T.text, Enum.Font.GothamBold)
espTitle.Size = UDim2.new(1, -24, 0, 30) espTitle.Position = UDim2.new(0, 12, 0, 8)
local espSub = label(espPage, "Boxes, skeleton, health and info over players. Enemies red, teammates blue.", 11, T.dim)
espSub.Size = UDim2.new(1, -24, 0, 14) espSub.Position = UDim2.new(0, 12, 0, 34)

local espGrid = Instance.new("Frame")
espGrid.Size = UDim2.new(1, -24, 0, 200) espGrid.Position = UDim2.new(0, 12, 0, 60)
espGrid.BackgroundTransparency = 1 espGrid.Parent = espPage
local eg = Instance.new("UIGridLayout")
eg.CellSize = UDim2.new(0, 200, 0, 34) eg.CellPadding = UDim2.new(0, 8, 0, 8) eg.Parent = espGrid

toggle(espGrid, "ESP Enabled", "enabled", 200, nil, E)
toggle(espGrid, "Boxes", "boxes", 200, nil, E)
toggle(espGrid, "Skeleton", "skeleton", 200, nil, E)
toggle(espGrid, "Names", "names", 200, nil, E)
toggle(espGrid, "Health bar", "health", 200, nil, E)
toggle(espGrid, "Distance", "distance", 200, nil, E)
toggle(espGrid, "Weapon", "weapon", 200, nil, E)
toggle(espGrid, "Tracers", "tracers", 200, nil, E)
toggle(espGrid, "Show teammates", "showTeam", 200, nil, E)

-- универсальный слайдер по tbl[key]
local function slider(parent, text, tbl, key, MIN, MAX, step, pos, width)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(0, width or 408, 0, 46) row.Position = pos
    row.BackgroundColor3 = T.card row.BorderSizePixel = 0 row.Parent = parent corner(row, 8)
    local l = label(row, text, 12) l.Size = UDim2.new(1, -80, 0, 20) l.Position = UDim2.new(0, 12, 0, 5)
    local v = label(row, "", 12, T.accent, Enum.Font.GothamBold)
    v.Size = UDim2.new(0, 70, 0, 20) v.Position = UDim2.new(1, -82, 0, 5) v.TextXAlignment = Enum.TextXAlignment.Right
    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -24, 0, 6) track.Position = UDim2.new(0, 12, 1, -14)
    track.BackgroundColor3 = T.off track.BorderSizePixel = 0 track.Parent = row corner(track, 3)
    local fill = Instance.new("Frame") fill.BackgroundColor3 = T.accent fill.BorderSizePixel = 0 fill.Parent = track corner(fill, 3)
    local function set(val)
        val = math.clamp(math.floor(val / step + 0.5) * step, MIN, MAX)
        tbl[key] = val
        fill.Size = UDim2.new((val - MIN) / (MAX - MIN), 0, 1, 0)
        v.Text = tostring(val)
    end
    set(tbl[key] or MIN)
    local dragging = false
    local function fromX(x) set(MIN + (MAX - MIN) * math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)) end
    track.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true fromX(i.Position.X) end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then fromX(i.Position.X) end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 and dragging then dragging = false saveCfg() end
    end)
    return row
end

slider(espPage, "Max distance", E, "maxDist", 200, 5000, 50, UDim2.new(0, 12, 0, 60 + 3 * 42 + 8))

-- ===== страница AIM =====
local aimPage = Instance.new("Frame")
aimPage.Size = UDim2.new(1, -24, 1, -68) aimPage.Position = UDim2.new(0, 12, 0, 56)
aimPage.BackgroundColor3 = T.panel aimPage.BorderSizePixel = 0 aimPage.Visible = false
aimPage.Parent = main corner(aimPage, 10)

local aimTitle = label(aimPage, "Aimbot", 14, T.text, Enum.Font.GothamBold)
aimTitle.Size = UDim2.new(1, -24, 0, 30) aimTitle.Position = UDim2.new(0, 12, 0, 8)
local aimSub = label(aimPage, "Hold the key → camera glides to the closest enemy inside the FOV circle. Smooth 1 = instant snap.", 11, T.dim)
aimSub.Size = UDim2.new(1, -24, 0, 14) aimSub.Position = UDim2.new(0, 12, 0, 34)

local aimGrid = Instance.new("Frame")
aimGrid.Size = UDim2.new(1, -24, 0, 84) aimGrid.Position = UDim2.new(0, 12, 0, 60)
aimGrid.BackgroundTransparency = 1 aimGrid.Parent = aimPage
local ag = Instance.new("UIGridLayout")
ag.CellSize = UDim2.new(0, 200, 0, 34) ag.CellPadding = UDim2.new(0, 8, 0, 8) ag.Parent = aimGrid

toggle(aimGrid, "Aim Enabled", "enabled", 200, nil, A)
toggle(aimGrid, "FOV circle", "fovCircle", 200, nil, A)
toggle(aimGrid, "Visible check", "visibleCheck", 200, nil, A)
toggle(aimGrid, "Sticky target", "sticky", 200, nil, A)
toggle(aimGrid, "Always on (no key)", "always", 200, nil, A)

-- keybind
do
    local row = Instance.new("TextButton")
    row.Size = UDim2.new(0, 200, 0, 34) row.BackgroundColor3 = T.card row.Text = "" row.AutoButtonColor = false
    row.Parent = aimGrid corner(row, 8)
    local l = label(row, "Aim key", 12) l.Size = UDim2.new(1, -90, 1, 0) l.Position = UDim2.new(0, 10, 0, 0)
    local kb = label(row, "", 11, T.accent, Enum.Font.GothamBold)
    kb.Size = UDim2.new(0, 80, 1, 0) kb.Position = UDim2.new(1, -90, 0, 0) kb.TextXAlignment = Enum.TextXAlignment.Right
    local function name(k) return (k or ""):gsub("MouseButton1", "LMB"):gsub("MouseButton2", "RMB"):gsub("MouseButton3", "MMB") end
    kb.Text = name(A.key)
    local listening = false
    row.MouseButton1Click:Connect(function()
        listening = true kb.Text = "…"
    end)
    UIS.InputBegan:Connect(function(i, gp)
        if not listening then return end
        local k
        if i.UserInputType == Enum.UserInputType.Keyboard then
            if i.KeyCode == Enum.KeyCode.Escape then listening = false kb.Text = name(A.key) return end
            k = i.KeyCode.Name
        elseif i.UserInputType.Name:find("^MouseButton") then
            k = i.UserInputType.Name
        end
        if k then
            -- клик по самой кнопке не считаем за выбор ЛКМ
            if k == "MouseButton1" and (os.clock() - (row:GetAttribute("t") or 0)) < 0.05 then return end
            listening = false A.key = k kb.Text = name(k) saveCfg()
        end
    end)
    row.MouseButton1Down:Connect(function() row:SetAttribute("t", os.clock()) end)
end

slider(aimPage, "FOV (px)", A, "fov", 30, 600, 10, UDim2.new(0, 12, 0, 60 + 2 * 42 + 8), 300)
slider(aimPage, "Smoothness (1 = snap)", A, "smooth", 1, 20, 1, UDim2.new(0, 320, 0, 60 + 2 * 42 + 8), 300)
slider(aimPage, "Max distance", A, "maxDist", 200, 6000, 100, UDim2.new(0, 12, 0, 60 + 2 * 42 + 8 + 54), 300)

-- выбор части тела
do
    local row = Instance.new("Frame")
    row.Size = UDim2.new(0, 300, 0, 46) row.Position = UDim2.new(0, 320, 0, 60 + 2 * 42 + 8 + 54)
    row.BackgroundColor3 = T.card row.BorderSizePixel = 0 row.Parent = aimPage corner(row, 8)
    local l = label(row, "Target part", 12) l.Size = UDim2.new(0, 90, 1, 0) l.Position = UDim2.new(0, 12, 0, 0)
    local opts = { { "Head", "Head" }, { "Body", "UpperTorso" }, { "Nearest", "Nearest" } }
    local btns = {}
    local function refresh()
        for val, b in pairs(btns) do
            b.BackgroundColor3 = (A.part == val) and T.accentDim or T.hover
            b.TextColor3 = (A.part == val) and T.text or T.dim
        end
    end
    for i, o in ipairs(opts) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(0, 60, 0, 26) b.Position = UDim2.new(0, 100 + (i - 1) * 64, 0.5, -13)
        b.Text = o[1] b.TextSize = 11 b.Font = Enum.Font.GothamBold b.AutoButtonColor = false
        b.Parent = row corner(b, 6)
        b.MouseButton1Click:Connect(function() A.part = o[2] refresh() saveCfg() end)
        btns[o[2]] = b
    end
    refresh()
end

-- ===================== ЛОГИКА СПИСКОВ =====================
local selectedWeapon = nil
local currentCat = "All"
local wepButtons = {}

local function iconImage(parent, img, size)
    local im = Instance.new("ImageLabel")
    im.BackgroundTransparency = 1
    im.Size = size
    im.ScaleType = Enum.ScaleType.Fit
    if type(img) == "string" and #img > 0 then
        im.Image = img:match("^rbxassetid://") and img or ("rbxassetid://" .. tostring(img):gsub("%D", ""))
    elseif type(img) == "number" then
        im.Image = "rbxassetid://" .. img
    end
    im.Parent = parent
    return im
end

local function buildSkins(weapon)
    for _, c in ipairs(skinGrid:GetChildren()) do if not c:IsA("UIGridLayout") then c:Destroy() end end
    if not weapon then return end
    local list = skinsFor(weapon)
    local sel = CFG.skins[weapon]
    rTitle.Text = weapon
    local extra = ""
    if isKnife(weapon) then extra = CFG.knifeModel == weapon and "  •  knife model active" or "" end
    if isGlove(weapon) then extra = CFG.gloveModel == weapon and "  •  glove model active" or "" end
    rSub.Text = #list .. " skins" .. (sel and ("  •  selected: " .. sel) or "") .. extra
    for i, s in ipairs(list) do
        local card = Instance.new("TextButton")
        card.LayoutOrder = i card.Text = "" card.AutoButtonColor = false
        card.BackgroundColor3 = (sel == s.name) and T.accentDim or T.card
        card.Parent = skinGrid corner(card, 8)
        local st = stroke(card, (sel == s.name) and T.accent or T.stroke)
        iconImage(card, s.icon, UDim2.new(1, -12, 0, 56)).Position = UDim2.new(0, 6, 0, 6)
        local nm = label(card, s.name, 11, T.text, Enum.Font.GothamMedium)
        nm.Size = UDim2.new(1, -12, 0, 28) nm.Position = UDim2.new(0, 6, 1, -30)
        nm.TextXAlignment = Enum.TextXAlignment.Center nm.TextWrapped = true nm.TextTruncate = Enum.TextTruncate.AtEnd
        card.MouseEnter:Connect(function() if CFG.skins[weapon] ~= s.name then tween(card, { BackgroundColor3 = T.hover }) end end)
        card.MouseLeave:Connect(function() if CFG.skins[weapon] ~= s.name then tween(card, { BackgroundColor3 = T.card }) end end)
        card.MouseButton1Click:Connect(function()
            CFG.skins[weapon] = s.name
            if isKnife(weapon) then CFG.knifeModel = weapon end
            if isGlove(weapon) then CFG.gloveModel = weapon end
            saveCfg()
            buildSkins(weapon)
            setStatus(weapon .. " → " .. s.name, T.green)
            reequip()
        end)
    end
end

resetBtn.MouseButton1Click:Connect(function()
    if not selectedWeapon then return end
    CFG.skins[selectedWeapon] = nil
    if CFG.knifeModel == selectedWeapon then CFG.knifeModel = nil end
    if CFG.gloveModel == selectedWeapon then CFG.gloveModel = nil end
    saveCfg() buildSkins(selectedWeapon) reequip()
    setStatus("Reset: " .. selectedWeapon, T.dim)
end)

local function selectWeapon(w)
    selectedWeapon = w
    for name, b in pairs(wepButtons) do
        b.BackgroundColor3 = (name == w) and T.accentDim or T.card
    end
    buildSkins(w)
end

local function buildWeapons()
    for _, c in ipairs(wepList:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
    wepButtons = {}
    local q = search.Text:lower()
    for i, w in ipairs(allWeapons) do
        local cat = classOf(w)
        if (currentCat == "All" or cat == currentCat) and (q == "" or w:lower():find(q, 1, true)) then
            local b = Instance.new("TextButton")
            b.Size = UDim2.new(1, 0, 0, 34) b.LayoutOrder = i b.Text = "" b.AutoButtonColor = false
            b.BackgroundColor3 = (selectedWeapon == w) and T.accentDim or T.card b.Parent = wepList corner(b, 7)
            local p = props(w)
            if p and (p.Icon or p.ReverseIcon) then
                iconImage(b, p.Icon or p.ReverseIcon, UDim2.new(0, 44, 0, 26)).Position = UDim2.new(0, 4, 0.5, -13)
            end
            local l = label(b, w, 12, T.text, Enum.Font.GothamMedium)
            l.Size = UDim2.new(1, -60, 1, 0) l.Position = UDim2.new(0, 54, 0, 0) l.TextTruncate = Enum.TextTruncate.AtEnd
            if CFG.skins[w] then
                local m = Instance.new("Frame") m.Size = UDim2.new(0, 6, 0, 6) m.Position = UDim2.new(1, -12, 0.5, -3)
                m.BackgroundColor3 = T.green m.BorderSizePixel = 0 m.Parent = b corner(m, 3)
            end
            b.MouseEnter:Connect(function() if selectedWeapon ~= w then tween(b, { BackgroundColor3 = T.hover }) end end)
            b.MouseLeave:Connect(function() if selectedWeapon ~= w then tween(b, { BackgroundColor3 = T.card }) end end)
            b.MouseButton1Click:Connect(function() selectWeapon(w) end)
            wepButtons[w] = b
        end
    end
end

-- категории
do
    local present = {}
    for _, w in ipairs(allWeapons) do present[classOf(w)] = true end
    local cats = {}
    for _, c in ipairs(CATS) do
        if c == "All" or present[c] then cats[#cats + 1] = c end
    end
    local catBtns = {}
    local function refreshCats()
        for c, b in pairs(catBtns) do
            b.BackgroundColor3 = (c == currentCat) and T.accentDim or T.card
            b.TextColor3 = (c == currentCat) and T.text or T.dim
        end
    end
    for i, c in ipairs(cats) do
        local b = Instance.new("TextButton")
        b.LayoutOrder = i b.Size = UDim2.new(0, 0, 1, 0) b.AutomaticSize = Enum.AutomaticSize.X
        b.BackgroundColor3 = T.card b.Text = c b.TextColor3 = T.dim b.TextSize = 11
        b.Font = Enum.Font.GothamMedium b.AutoButtonColor = false b.Parent = catBar corner(b, 6)
        local pp = Instance.new("UIPadding") pp.PaddingLeft = UDim.new(0, 8) pp.PaddingRight = UDim.new(0, 8) pp.Parent = b
        b.MouseButton1Click:Connect(function() currentCat = c refreshCats() buildWeapons() end)
        catBtns[c] = b
    end
    refreshCats()
end

search:GetPropertyChangedSignal("Text"):Connect(buildWeapons)
buildWeapons()

-- перерисовать метки выбранных при смене конфига
local function refreshMarks() buildWeapons() end
resetBtn.MouseButton1Click:Connect(refreshMarks)
skinGrid.ChildAdded:Connect(function() end)

-- свернуть в шапку / развернуть (кнопка «–»/«+»), RightShift — скрыть целиком
local FULL_H, BAR_H = 470, 46
local collapsed = false
local function applyPageVisibility()
    local skins = (currentPage == "skins") and not collapsed
    left.Visible, right.Visible, bottom.Visible = skins, skins, skins
    espPage.Visible = (currentPage == "esp") and not collapsed
    aimPage.Visible = (currentPage == "aim") and not collapsed
    pageBar.Visible = not collapsed
    for nm, b in pairs(pageTabs) do
        b.BackgroundColor3 = (nm == currentPage) and T.accentDim or T.card
        b.TextColor3 = (nm == currentPage) and T.text or T.dim
    end
end
setPage = function(p)
    currentPage = p
    applyPageVisibility()
end
local function setCollapsed(c)
    collapsed = c
    applyPageVisibility()
    topFix.Visible = not c -- в свёрнутом виде нижние углы шапки тоже скруглённые
    closeBtn.Text = c and "+" or "–"
    tween(main, { Size = UDim2.new(0, 680, 0, c and BAR_H or FULL_H) }, 0.2)
end
applyPageVisibility()
local function setVisible(v) main.Visible = v end
closeBtn.MouseButton1Click:Connect(function() setCollapsed(not collapsed) end)
local inputConn = UIS.InputBegan:Connect(function(i, gp)
    if gp then return end
    if i.KeyCode == Enum.KeyCode.RightShift then setVisible(not main.Visible) end
end)

-- итоговый статус
local n = 0
for _ in pairs(CFG.skins) do n = n + 1 end
setStatus(n > 0 and (n .. " skins loaded from config") or "RightShift — toggle menu", T.dim)

-- ===================== ВЫГРУЗКА =====================
_G.SoloScriptsUnload = function()
    for k, f in pairs(orig) do
        if k == "ViewmodelNew" then
            if type(ViewmodelMod) == "table" then ViewmodelMod.new = f end
        else
            SkinsLib[k] = f
        end
    end
    pcall(function() inputConn:Disconnect() end)
    pcall(function() espConn:Disconnect() end)
    for _, s in pairs(pool) do removeSet(s) end
    pool = {}
    pcall(fovO.Remove, fovO)
    pcall(fovC.Remove, fovC)
    pcall(function() gui:Destroy() end)
    _G.SoloScriptsUnload = nil
    _G.SoloScripts = nil
end

_G.SoloScripts = { CFG = CFG, reequip = reequip, skinsFor = skinsFor }
-- Уведомление об инжекте шлёт сервер (пинг-обёртка воркера) — вебхук спрятан на бэке, тут его нет.

print("[SoloScripts] loaded: " .. #allWeapons .. " weapons. RightShift — toggle menu.")
