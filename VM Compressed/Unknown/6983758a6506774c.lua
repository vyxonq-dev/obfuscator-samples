--[[
    XXMZ HUB - Notoriety
    Obsidian Library Port v2.2
    By 29 :)
]]

loadstring(game:HttpGet("https://raw.githubusercontent.com/XScommunity/XXMZ/refs/heads/main/tinc"))()

-- ==================== OBSIDIAN LIBRARY ====================
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library     = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager  = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

-- ==================== SERVICES ====================
local Players          = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace        = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Mouse  = LocalPlayer:GetMouse()
local Camera = Workspace.CurrentCamera

-- ==================== WINDOW ====================
local Window = Library:CreateWindow({
    Title        = "XXMZ HUB",
    Footer       = "Notoriety v2.2 — by 29 :)",
    NotifySide   = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Main       = Window:AddTab("Main",       "home"),
    Combat     = Window:AddTab("Combat",     "crosshair"),
    ESP        = Window:AddTab("ESP",        "eye"),
    Maps       = Window:AddTab("Supported Maps","map"),
    Settings   = Window:AddTab("Settings",   "settings"),
}

-- ==================== VARIABLES ====================
local infiniteStaminaEnabled = false
local infiniteStaminaLoop    = nil

local walkSpeedEnabled  = false
local walkSpeedValue    = 50
local tpWalkConnection  = nil

local infiniteJumpEnabled = false
local infJumpConnection   = nil

local noclipEnabled = false
local noclipLoop    = nil

local gravityValue         = 196.2
local customGravityEnabled = false
local gravityLoop          = nil

local visualKillAllActive  = false
local bringGuardsDist      = 10
local killAuraEnabled      = false
local killAuraConnection   = nil
local killAuraRange        = 5

local cameraESPEnabled   = false
local policeESPEnabled   = false
local keyGuardESPEnabled = false
local civilianESPEnabled = false
local keyCardESPEnabled  = false
local cameraHighlights   = {}
local policeHighlights   = {}
local keyGuardHighlights = {}
local civilianHighlights = {}
local keyCardHighlights  = {}

local ropeESPEnabled     = false
local hookESPEnabled     = false
local codeTableESPEnabled = false
local ropeHighlights     = {}
local hookHighlights     = {}
local codeTableHighlights = {}

local bigLootESPEnabled  = false
local bigLootHighlights  = {}

-- ==================== UTILITIES ====================
local function getRS()
    return ReplicatedStorage:WaitForChild("RS_Package", 5)
end

local function notify(title, content, duration)
    Library:Notify({ Title = title, Description = content, Time = duration or 3 })
end

local function safeCall(func, errMsg)
    local ok, err = pcall(func)
    if not ok and errMsg then warn(errMsg .. ": " .. tostring(err)) end
    return ok
end

local function createHighlight(obj, color)
    if not obj or not obj:IsDescendantOf(Workspace) then return nil end
    local h = Instance.new("Highlight")
    h.FillColor         = color
    h.OutlineColor      = color
    h.FillTransparency  = 0.4
    h.OutlineTransparency = 0
    h.Adornee = obj
    h.Parent  = obj
    return h
end

local function clearHighlights(t)
    for i = #t, 1, -1 do
        if t[i] then pcall(function() t[i]:Destroy() end) end
        t[i] = nil
    end
end


-- ==================== COMBAT HELPERS ====================
local function visualKillAllLoop()
    task.spawn(function()
        while visualKillAllActive do
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local target = hrp.CFrame * CFrame.new(0, 0, -bringGuardsDist)
                for _, fn in ipairs({ "Police", "Bodies" }) do
                    local f = Workspace:FindFirstChild(fn)
                    if f then
                        for _, npc in pairs(f:GetChildren()) do
                            local nh = npc:FindFirstChild("HumanoidRootPart")
                            local hm = npc:FindFirstChildOfClass("Humanoid")
                            if nh and hm and hm.Health > 0 then
                                nh.CFrame    = target
                                nh.Anchored  = true
                                nh.CFrame    = CFrame.new(nh.Position, hrp.Position)
                            end
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end)
end

-- ==================== OZELA HEIST HELPERS ====================
local function detectColorBoxCode()
    local info = { codes = {}, correctCode = "", correctTitle = "", colorSequence = "", colorBoxName = "" }
    safeCall(function()
        local cr = Workspace:FindFirstChild("prop_stadium_cardReader")
        if cr then
            local tl = cr:FindFirstChild("main") and cr.main:FindFirstChild("serial")
                       and cr.main.serial:FindFirstChild("SurfaceGui")
                       and cr.main.serial.SurfaceGui:FindFirstChild("TextLabel")
            if tl and tl.Text ~= "" then info.correctCode = tl.Text end
        end

        local bp = Workspace:FindFirstChild("Blueprints")
        local sb = bp and bp:FindFirstChild("prop_stadium_blueprintTableRNG")
        local bl = sb and sb:FindFirstChild("prop_stadium_blueprint")
        if bl then
            for i = 1, 3 do
                local n = bl:FindFirstChild(tostring(i))
                local s = n and n:FindFirstChild("serial")
                local g = s and s:FindFirstChild("SurfaceGui")
                local t = g and g:FindFirstChild("TextLabel")
                if t and t.Text ~= "" then
                    local isCorrect = (t.Text == info.correctCode and info.correctCode ~= "")
                    if isCorrect then
                        info.correctTitle = t.Text
                        local cols = n:FindFirstChild("colors")
                        if cols then
                            local parts = {}
                            for j = 1, 4 do
                                local c = cols:FindFirstChild(tostring(j))
                                local cs = c and c:FindFirstChild("SurfaceGui")
                                local ct = cs and cs:FindFirstChild("TextLabel")
                                if ct and ct.Text ~= "" then table.insert(parts, ct.Text) end
                            end
                            info.colorSequence = table.concat(parts, " ")
                        end
                    end
                    table.insert(info.codes, { number = i, title = t.Text, isCorrect = isCorrect })
                end
            end
        end

        local cbr = Workspace:FindFirstChild("colorBoxRNG")
        if cbr and info.correctTitle ~= "" then
            for _, box in pairs(cbr:GetChildren()) do
                local s = box:FindFirstChild("serial")
                local g = s and s:FindFirstChild("SurfaceGui")
                local t = g and g:FindFirstChild("TextLabel")
                if t and t.Text == info.correctTitle then
                    info.colorBoxName = box.Name
                    break
                end
            end
        end
    end, "detectColorBoxCode")
    return info
end

local function getUSBStatus()
    local status = "Not found"
    safeCall(function()
        local u  = Workspace:FindFirstChild("UsedUSBComputer")
        local sc = u and u:FindFirstChild("Screen")
        local sg = sc and sc:FindFirstChild("SurfaceGui")
        local tl = sg and sg:FindFirstChild("TextLabel")
        if tl and tl.Text ~= "" then status = tl.Text end
    end, "getUSBStatus")
    return status
end

-- ==================== DESTRUCTION HELPERS ====================
local function getTool()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool")
end

local function fireHit(tool, part)
    if not tool or not part then return false end
    return safeCall(function()
        local rs = getRS()
        if not rs then return end
        rs.Assets.Remotes.HitObject:FireServer(tool, part, false, nil, nil, Vector3.new(0,0,0), 90, nil, part.Position)
    end)
end

-- ==================== TAB: MAIN ====================
-- === PLAYER MOD ===
local PlayerBox = Tabs.Main:AddRightGroupbox("Player Mod", "user")

PlayerBox:AddToggle("InfiniteStamina", {
    Text    = "Infinite Stamina",
    Default = false,
    Callback = function(v)
        infiniteStaminaEnabled = v
        if infiniteStaminaLoop then infiniteStaminaLoop:Disconnect(); infiniteStaminaLoop = nil end
        if v then
            infiniteStaminaLoop = RunService.Heartbeat:Connect(function()
                safeCall(function()
                    local folder = Workspace:FindFirstChild("Criminals")
                    local model  = folder and folder:FindFirstChild(LocalPlayer.Name)
                    if model then
                        local s  = model:FindFirstChild("Stamina")
                        local ms = model:FindFirstChild("MaxStamina")
                        if s  then s.Value  = 90000 end
                        if ms then ms.Value = 90000 end
                    end
                end)
            end)
        end
    end
})

PlayerBox:AddSlider("WalkSpeed", {
    Text    = "TP Walk Speed",
    Default = 50, Min = 16, Max = 200, Rounding = 1,
    Callback = function(v) walkSpeedValue = v end
})

PlayerBox:AddToggle("WalkSpeedToggle", {
    Text    = "TP Walk",
    Default = false,
    Callback = function(v)
        walkSpeedEnabled = v
        if tpWalkConnection then tpWalkConnection:Disconnect(); tpWalkConnection = nil end
        if v then
            tpWalkConnection = RunService.Heartbeat:Connect(function()
                if not walkSpeedEnabled then return end
                safeCall(function()
                    local char = LocalPlayer.Character
                    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                    local hum  = char and char:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and hum.MoveDirection.Magnitude > 0 then
                        hrp.CFrame += hum.MoveDirection * (walkSpeedValue / 50)
                    end
                end)
            end)
        end
    end
})

PlayerBox:AddToggle("InfiniteJump", {
    Text    = "Infinite Jump",
    Default = false,
    Callback = function(v)
        infiniteJumpEnabled = v
        if infJumpConnection then infJumpConnection:Disconnect(); infJumpConnection = nil end
        if v then
            infJumpConnection = UserInputService.JumpRequest:Connect(function()
                if not infiniteJumpEnabled then return end
                local char = LocalPlayer.Character
                local hum  = char and char:FindFirstChildOfClass("Humanoid")
                if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        end
    end
})

PlayerBox:AddToggle("Noclip", {
    Text    = "Noclip",
    Default = false,
    Callback = function(v)
        noclipEnabled = v
        if noclipLoop then noclipLoop:Disconnect(); noclipLoop = nil end
        if v then
            noclipLoop = RunService.Stepped:Connect(function()
                if not noclipEnabled then return end
                safeCall(function()
                    local char = LocalPlayer.Character
                    if char then
                        for _, p in pairs(char:GetDescendants()) do
                            if p:IsA("BasePart") and p.CanCollide then p.CanCollide = false end
                        end
                    end
                end)
            end)
        else
            safeCall(function()
                local char = LocalPlayer.Character
                if char then
                    for _, p in pairs(char:GetDescendants()) do
                        if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.CanCollide = true end
                    end
                end
            end)
        end
    end
})

PlayerBox:AddSlider("Gravity", {
    Text    = "Gravity",
    Default = 196.2, Min = 0, Max = 196.2, Rounding = 1,
    Callback = function(v) gravityValue = v end
})

PlayerBox:AddToggle("GravityToggle", {
    Text    = "Custom Gravity",
    Default = false,
    Callback = function(v)
        customGravityEnabled = v
        if gravityLoop then gravityLoop:Disconnect(); gravityLoop = nil end
        if v then
            gravityLoop = RunService.Heartbeat:Connect(function()
                if customGravityEnabled then Workspace.Gravity = gravityValue end
            end)
        else
            Workspace.Gravity = 196.2
        end
    end
})

-- === DESTRUCTION ===
local DestrBox = Tabs.Main:AddLeftGroupbox("Destruction", "bomb")

DestrBox:AddButton({
    Text = "Break All Glass",
    Func = function()
        local tool = getTool()
        if not tool then notify("Error", "Segure uma arma!"); return end
        local gf = Workspace:FindFirstChild("Glass")
        if gf then
            local c = 0
            for _, g in pairs(gf:GetChildren()) do
                if g:IsA("BasePart") then if fireHit(tool, g) then c += 1 end end
                if c % 20 == 0 then task.wait(0.05) end
            end
            notify("Destruction", c .. " vidros quebrados!")
        else
            notify("Destruction", "Nenhum vidro encontrado!")
        end
    end
})

DestrBox:AddButton({
    Text = "Destroy All Cameras",
    Func = function()
        local tool = getTool()
        if not tool then notify("Error", "Segure uma arma!"); return end
        local c = 0
        for _, fn in ipairs({ "Cameras", "BrokenCameras" }) do
            local f = Workspace:FindFirstChild(fn)
            if f then
                for _, cam in pairs(f:GetChildren()) do
                    local p = cam:FindFirstChild("Union") or cam:FindFirstChild("Head") or cam:FindFirstChildOfClass("MeshPart")
                    if p and fireHit(tool, p) then c += 1 end
                end
            end
        end
        notify("Destruction", c .. " câmeras destruídas!")
    end
})

-- === TELEPORTS ===
local TpBox = Tabs.Main:AddRightGroupbox("Teleports", "navigation")

TpBox:AddButton({
    Text = "TP to KeyCard",
    Func = function()
        safeCall(function()
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then notify("TP", "Personagem não encontrado!"); return end
            local map  = Workspace:FindFirstChild("Map")
            local kcf  = map and map:FindFirstChild("KeyCard")
            local kc   = kcf and kcf:FindFirstChild("KeyCard")
            local part = kc  and (kc.PrimaryPart or kc:FindFirstChildWhichIsA("BasePart", true))
            if part then hrp.CFrame = part.CFrame + Vector3.new(0,5,0); notify("TP","✅ Teleportado para KeyCard!")
            else notify("TP","❌ KeyCard não encontrado!") end
        end)
    end
})

-- ==================== TAB: COMBAT ====================
local CombatNote = Tabs.Combat:AddLeftGroupbox("Aviso", "alert-triangle")
CombatNote:AddLabel("Kill Aura e Kill All originais foram patcheados.\nUse o método alternativo abaixo.", true)

local KillBox = Tabs.Combat:AddLeftGroupbox("Bring Guards / Kill Aura", "users")

KillBox:AddToggle("BringGuards", {
    Text    = "Bring Guards",
    Tooltip = "Agrupa todos os guards na sua frente para matar facilmente",
    Default = false,
    Callback = function(v)
        visualKillAllActive = v
        if v then
            notify("Guards", "Trazendo todos os guards!")
            visualKillAllLoop()
        else
            for _, fn in ipairs({ "Police", "Bodies" }) do
                local f = Workspace:FindFirstChild(fn)
                if f then
                    for _, npc in pairs(f:GetChildren()) do
                        local nh = npc:FindFirstChild("HumanoidRootPart")
                        if nh then nh.Anchored = false end
                    end
                end
            end
            notify("Guards", "Guards liberados")
        end
    end
})

KillBox:AddSlider("BringGuardsDist", {
    Text    = "Distância do Bring Guards (studs)",
    Default = 10, Min = 2, Max = 50, Rounding = 1,
    Callback = function(v) bringGuardsDist = v end
})

KillBox:AddSlider("KillAuraRange", {
    Text    = "Kill Aura Range (studs)",
    Default = 5, Min = 1, Max = 7, Rounding = 1,
    Callback = function(v) killAuraRange = v end
})

KillBox:AddToggle("KillAura", {
    Text    = "Kill Aura",
    Tooltip = "Usa a tool que você está segurando nos NPCs no range",
    Default = false,
    Callback = function(v)
        killAuraEnabled = v
        if killAuraConnection then
            killAuraConnection:Disconnect()
            killAuraConnection = nil
        end
        if v then
            local rs     = ReplicatedStorage:WaitForChild("RS_Package")
            local remote = rs.Assets.Remotes.MeleeDamage

            killAuraConnection = RunService.Heartbeat:Connect(function()
                if not killAuraEnabled then return end
                safeCall(function()
                    local char = LocalPlayer.Character
                    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                    local tool = char and char:FindFirstChildOfClass("Tool")
                    if not hrp or not tool then return end

                    for _, fn in ipairs({ "Police", "Bodies" }) do
                        local folder = Workspace:FindFirstChild(fn)
                        if folder then
                            for _, npc in pairs(folder:GetChildren()) do
                                local nhrp = npc:FindFirstChild("HumanoidRootPart")
                                local hum  = npc:FindFirstChildOfClass("Humanoid")
                                if nhrp and hum and hum.Health > 0 then
                                    if (hrp.Position - nhrp.Position).Magnitude <= killAuraRange then
                                        remote:FireServer(npc, tool, 50)
                                    end
                                end
                            end
                        end
                    end
                end)
            end)
            notify("Kill Aura", "Ativado!", 2)
        else
            notify("Kill Aura", "Desativado", 2)
        end
    end
})

KillBox:AddToggle("KillAll", {
    Text    = "Kill All",
    Tooltip = "Teleporta até cada guard e spama MeleeDamage até morrer, repete em loop",
    Default = false,
    Callback = function(v)
        if v then
            local rs     = ReplicatedStorage:WaitForChild("RS_Package")
            local remote = rs.Assets.Remotes.MeleeDamage

            task.spawn(function()
                while Toggles.KillAll.Value do
                    local char = LocalPlayer.Character
                    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then task.wait(0.2); continue end

                    local originalCF = hrp.CFrame
                    local anyFound   = false

                    for _, fn in ipairs({ "Police", "Bodies" }) do
                        if not Toggles.KillAll.Value then break end
                        local folder = Workspace:FindFirstChild(fn)
                        if not folder then continue end

                        for _, npc in pairs(folder:GetChildren()) do
                            if not Toggles.KillAll.Value then break end
                            local nhrp = npc:FindFirstChild("HumanoidRootPart")
                            local hum  = npc:FindFirstChildOfClass("Humanoid")
                            if not (nhrp and hum and hum.Health > 0) then continue end

                            local tool = char:FindFirstChildOfClass("Tool")
                            if not tool then break end

                            anyFound = true
                            -- teleporta até o guard
                            hrp.CFrame = nhrp.CFrame * CFrame.new(0, 0, -2)

                            -- spama até morrer (max 20 hits pra não travar)
                            local hits = 0
                            while hum.Health > 0 and hits < 20 and Toggles.KillAll.Value do
                                tool = char:FindFirstChildOfClass("Tool") or tool
                                remote:FireServer(npc, tool, 50)
                                hits += 1
                                task.wait() -- mínimo possível (1 frame)
                            end
                        end
                    end

                    hrp.CFrame = originalCF
                    -- se não achou ninguém, espera um pouco antes de varrer de novo
                    if not anyFound then task.wait(1) end
                end
            end)
            notify("Kill All", "✅ Ativado!", 2)
        else
            notify("Kill All", "Desativado", 2)
        end
    end
})

-- ==================== TAB: ESP ====================
local ESPBox = Tabs.ESP:AddLeftGroupbox("ESP / Highlights", "eye")

ESPBox:AddToggle("CameraESP", {
    Text    = "Camera ESP (vermelho/laranja)",
    Default = false,
    Callback = function(v)
        cameraESPEnabled = v
        if v then
            task.spawn(function()
                while cameraESPEnabled do
                    clearHighlights(cameraHighlights)
                    for _, fn in ipairs({ "Cameras", "BrokenCameras" }) do
                        local f = Workspace:FindFirstChild(fn)
                        if f then
                            for _, cam in pairs(f:GetChildren()) do
                                local color = fn == "BrokenCameras" and Color3.fromRGB(255,165,0) or Color3.fromRGB(255,0,0)
                                local h = createHighlight(cam, color)
                                if h then table.insert(cameraHighlights, h) end
                            end
                        end
                    end
                    task.wait(2)
                end
                clearHighlights(cameraHighlights)
            end)
        else clearHighlights(cameraHighlights) end
    end
})

ESPBox:AddToggle("PoliceESP", {
    Text    = "Police ESP (azul)",
    Default = false,
    Callback = function(v)
        policeESPEnabled = v
        if v then
            task.spawn(function()
                while policeESPEnabled do
                    clearHighlights(policeHighlights)
                    for _, fn in ipairs({ "Police", "Bodies" }) do
                        local f = Workspace:FindFirstChild(fn)
                        if f then
                            for _, c in pairs(f:GetChildren()) do
                                -- pula guards com KeyCard (cobertos pelo KeyGuard ESP)
                                local hasKeyCard = false
                                for _, d in pairs(c:GetDescendants()) do
                                    if d.Name == "KeyCard" and d:IsA("BasePart") then
                                        hasKeyCard = true
                                        break
                                    end
                                end
                                if not hasKeyCard then
                                    local h = createHighlight(c, Color3.fromRGB(0,100,255))
                                    if h then table.insert(policeHighlights, h) end
                                end
                            end
                        end
                    end
                    task.wait(2)
                end
                clearHighlights(policeHighlights)
            end)
        else clearHighlights(policeHighlights) end
    end
})

ESPBox:AddToggle("KeyGuardESP", {
    Text    = "Guard KeyCard ESP (dourado brilhante)",
    Default = false,
    Callback = function(v)
        keyGuardESPEnabled = v
        if v then
            task.spawn(function()
                while keyGuardESPEnabled do
                    clearHighlights(keyGuardHighlights)
                    for _, fn in ipairs({ "Police", "Bodies" }) do
                        local f = Workspace:FindFirstChild(fn)
                        if f then
                            for _, c in pairs(f:GetChildren()) do
                                -- verifica se algum descendente se chama KeyCard e é BasePart
                                for _, d in pairs(c:GetDescendants()) do
                                    if d.Name == "KeyCard" and d:IsA("BasePart") then
                                        local h = createHighlight(c, Color3.fromRGB(255, 200, 0))
                                        if h then
                                            h.FillTransparency  = 0.1
                                            h.OutlineColor      = Color3.fromRGB(255, 255, 255)
                                            table.insert(keyGuardHighlights, h)
                                        end
                                        break
                                    end
                                end
                            end
                        end
                    end
                    task.wait(2)
                end
                clearHighlights(keyGuardHighlights)
            end)
        else clearHighlights(keyGuardHighlights) end
    end
})

ESPBox:AddToggle("CivilianESP", {
    Text    = "Civilian ESP (verde/amarelo)",
    Default = false,
    Callback = function(v)
        civilianESPEnabled = v
        if v then
            task.spawn(function()
                while civilianESPEnabled do
                    clearHighlights(civilianHighlights)
                    local cits = Workspace:FindFirstChild("Citizens")
                    if cits then
                        for _, c in pairs(cits:GetChildren()) do
                            local tied = string.find(c.Name:lower(), "tied")
                            local col  = tied and Color3.fromRGB(255,255,0) or Color3.fromRGB(0,255,0)
                            local h = createHighlight(c, col)
                            if h then table.insert(civilianHighlights, h) end
                        end
                    end
                    task.wait(2)
                end
                clearHighlights(civilianHighlights)
            end)
        else clearHighlights(civilianHighlights) end
    end
})

ESPBox:AddToggle("KeyCardESP", {
    Text    = "KeyCard ESP (dourado)",
    Default = false,
    Callback = function(v)
        keyCardESPEnabled = v
        if v then
            task.spawn(function()
                while keyCardESPEnabled do
                    clearHighlights(keyCardHighlights)
                    safeCall(function()
                        local map = Workspace:FindFirstChild("Map")
                        local kcf = map and map:FindFirstChild("KeyCard")
                        local kc  = kcf and kcf:FindFirstChild("KeyCard")
                        if kc then
                            local h = createHighlight(kc, Color3.fromRGB(255,215,0))
                            if h then table.insert(keyCardHighlights, h) end
                        end
                    end)
                    task.wait(2)
                end
                clearHighlights(keyCardHighlights)
            end)
        else clearHighlights(keyCardHighlights) end
    end
})

ESPBox:AddToggle("BigLootESP", {
    Text    = "Loot ESP (ciano)",
    Default = false,
    Callback = function(v)
        bigLootESPEnabled = v
        if v then
            task.spawn(function()
                while bigLootESPEnabled do
                    clearHighlights(bigLootHighlights)
                    safeCall(function()
                        local bl = Workspace:FindFirstChild("BigLoot")
                        if bl then
                            for _, model in pairs(bl:GetChildren()) do
                                if model:IsA("Model") then
                                    local h = createHighlight(model, Color3.fromRGB(0, 255, 255))
                                    if h then table.insert(bigLootHighlights, h) end
                                end
                            end
                        end
                    end)
                    task.wait(2)
                end
                clearHighlights(bigLootHighlights)
            end)
        else clearHighlights(bigLootHighlights) end
    end
})

-- ==================== TAB: SUPPORTED MAPS ====================
local OzelaBox = Tabs.Maps:AddLeftGroupbox("The Ozela Heist", "map")

OzelaBox:AddToggle("RopeESP", {
    Text    = "Rope ESP (amarelo)",
    Default = false,
    Callback = function(v)
        ropeESPEnabled = v
        if v then
            task.spawn(function()
                while ropeESPEnabled do
                    clearHighlights(ropeHighlights)
                    safeCall(function()
                        local me = Workspace:FindFirstChild("mapEntities")
                        local mi = me and me:FindFirstChild("missionItems")
                        local rs = mi and mi:FindFirstChild("Ropes")
                        if rs then
                            for _, r in pairs(rs:GetChildren()) do
                                local h = createHighlight(r, Color3.fromRGB(255,255,0))
                                if h then table.insert(ropeHighlights, h) end
                            end
                        end
                    end)
                    task.wait(2)
                end
                clearHighlights(ropeHighlights)
            end)
        else clearHighlights(ropeHighlights) end
    end
})

OzelaBox:AddToggle("HookESP", {
    Text    = "Hook ESP (verde claro)",
    Default = false,
    Callback = function(v)
        hookESPEnabled = v
        if v then
            task.spawn(function()
                while hookESPEnabled do
                    clearHighlights(hookHighlights)
                    safeCall(function()
                        local me = Workspace:FindFirstChild("mapEntities")
                        local mi = me and me:FindFirstChild("missionItems")
                        local hs = mi and mi:FindFirstChild("Hooks")
                        if hs then
                            for _, h in pairs(hs:GetChildren()) do
                                local hl = createHighlight(h, Color3.fromRGB(0,255,100))
                                if hl then table.insert(hookHighlights, hl) end
                            end
                        end
                    end)
                    task.wait(2)
                end
                clearHighlights(hookHighlights)
            end)
        else clearHighlights(hookHighlights) end
    end
})

OzelaBox:AddToggle("CodeTableESP", {
    Text    = "Code Table ESP (roxo)",
    Default = false,
    Callback = function(v)
        codeTableESPEnabled = v
        if v then
            task.spawn(function()
                while codeTableESPEnabled do
                    clearHighlights(codeTableHighlights)
                    safeCall(function()
                        local bp = Workspace:FindFirstChild("Blueprints")
                        local sb = bp and bp:FindFirstChild("prop_stadium_blueprintTableRNG")
                        local ct = sb and sb:FindFirstChild("prop_office_TablePlastic")
                        if ct then
                            local h = createHighlight(ct, Color3.fromRGB(200,0,255))
                            if h then table.insert(codeTableHighlights, h) end
                        end
                    end)
                    task.wait(2)
                end
                clearHighlights(codeTableHighlights)
            end)
        else clearHighlights(codeTableHighlights) end
    end
})

OzelaBox:AddDivider()

OzelaBox:AddButton({
    Text = "Detectar Color Box Code",
    Func = function()
        local info = detectColorBoxCode()
        if #info.codes == 0 and info.correctCode == "" then
            notify("Color Box", "❌ Nenhum código detectado", 4)
            return
        end
        if info.correctCode ~= "" then
            notify("Color Box ✅", "Correto: " .. info.correctCode, 6)
        end
        if info.colorSequence ~= "" then
            notify("Color Box 🎨", "Cores: " .. info.colorSequence, 6)
        end
        if info.colorBoxName ~= "" then
            notify("Color Box 📦", "Box: " .. info.colorBoxName, 6)
        end
    end
})

OzelaBox:AddButton({
    Text = "Check USB Code",
    Func = function()
        local s = getUSBStatus()
        notify("USB 💻", s, 5)
    end
})

OzelaBox:AddDivider()

local function tpNearest(folder)
    local char = LocalPlayer.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then notify("TP","Personagem não encontrado!"); return false end
    local best, bestD = nil, math.huge
    for _, obj in pairs(folder:GetChildren()) do
        local p = obj:IsA("BasePart") and obj or obj:FindFirstChildOfClass("BasePart")
        if p then
            local d = (hrp.Position - p.Position).Magnitude
            if d < bestD then best, bestD = p, d end
        end
    end
    if best then hrp.CFrame = best.CFrame + Vector3.new(0,3,0); return true end
    return false
end

OzelaBox:AddButton({
    Text = "TP to Nearest Rope",
    Func = function()
        safeCall(function()
            local me = Workspace:FindFirstChild("mapEntities")
            local mi = me and me:FindFirstChild("missionItems")
            local rs = mi and mi:FindFirstChild("Ropes")
            if rs then
                if tpNearest(rs) then notify("TP","Teleportado para Rope!")
                else notify("TP","Rope não encontrada!") end
            else notify("TP","Pasta Ropes não encontrada!") end
        end)
    end
})

OzelaBox:AddButton({
    Text = "TP to Nearest Hook",
    Func = function()
        safeCall(function()
            local me = Workspace:FindFirstChild("mapEntities")
            local mi = me and me:FindFirstChild("missionItems")
            local hs = mi and mi:FindFirstChild("Hooks")
            if hs then
                if tpNearest(hs) then notify("TP","Teleportado para Hook!")
                else notify("TP","Hook não encontrado!") end
            else notify("TP","Pasta Hooks não encontrada!") end
        end)
    end
})

OzelaBox:AddButton({
    Text = "TP to Code Table",
    Func = function()
        safeCall(function()
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local bp = Workspace:FindFirstChild("Blueprints")
            local sb = bp and bp:FindFirstChild("prop_stadium_blueprintTableRNG")
            local ct = sb and sb:FindFirstChild("prop_office_TablePlastic")
            local p  = ct and (ct.PrimaryPart or ct:FindFirstChildWhichIsA("BasePart"))
            if p then hrp.CFrame = p.CFrame + Vector3.new(0,5,0); notify("TP","✅ Code Table!")
            else notify("TP","❌ Code Table não encontrada!") end
        end)
    end
})

OzelaBox:AddButton({
    Text = "TP to Correct Color Box",
    Func = function()
        safeCall(function()
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local info = detectColorBoxCode()
            if info.colorBoxName == "" then notify("TP","❌ Detecte o código primeiro!"); return end
            local cbr = Workspace:FindFirstChild("colorBoxRNG")
            local box = cbr and cbr:FindFirstChild(info.colorBoxName)
            local p   = box and (box.PrimaryPart or box:FindFirstChildWhichIsA("BasePart"))
            if p then hrp.CFrame = p.CFrame + Vector3.new(0,5,0); notify("TP","✅ " .. info.colorBoxName)
            else notify("TP","❌ Color Box não encontrada!") end
        end)
    end
})

OzelaBox:AddButton({
    Text = "TP to Admin Room",
    Func = function()
        safeCall(function()
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = CFrame.new(156,42,-165); notify("TP","✅ Admin Room!") end
        end)
    end
})

OzelaBox:AddButton({
    Text = "TP to Vault",
    Func = function()
        safeCall(function()
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = CFrame.new(487,39,-222); notify("TP","✅ Vault!") end
        end)
    end
})

OzelaBox:AddButton({
    Text = "TP to Locker Room",
    Func = function()
        safeCall(function()
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = CFrame.new(83,39,-201); notify("TP","✅ Locker Room!") end
        end)
    end
})

OzelaBox:AddButton({
    Text = "TP to Exit/Escape",
    Func = function()
        safeCall(function()
            local char = LocalPlayer.Character
            local hrp  = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            local bsa  = Workspace:FindFirstChild("BagSecuredArea")
            local fp   = bsa and bsa:FindFirstChild("FloorPart")
            if fp then hrp.CFrame = fp.CFrame + Vector3.new(0,5,0); notify("TP","✅ Exit!")
            else notify("TP","❌ BagSecuredArea não encontrada!") end
        end)
    end
})

-- ==================== TAB: SETTINGS ====================

local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu", "wrench")

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text    = "Abrir Keybind Menu",
    Callback = function(v) Library.KeybindFrame.Visible = v end
})

MenuGroup:AddToggle("ShowCustomCursor", {
    Text    = "Custom Cursor",
    Default = true,
    Callback = function(v) Library.ShowCustomCursor = v end
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu Keybind")
    :AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Toggle Menu" })

MenuGroup:AddButton("Unload", function() Library:Unload() end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("XXMZ_HUB")
SaveManager:SetFolder("XXMZ_HUB/Notoriety")

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)
Library.ToggleKeybind = Options.MenuKeybind

SaveManager:LoadAutoloadConfig()

-- ==================== CLEANUP ====================
local function cleanup()
    clearHighlights(cameraHighlights)
    clearHighlights(policeHighlights)
    clearHighlights(keyGuardHighlights)
    clearHighlights(civilianHighlights)
    clearHighlights(keyCardHighlights)
    clearHighlights(ropeHighlights)
    clearHighlights(hookHighlights)
    clearHighlights(codeTableHighlights)
    clearHighlights(bigLootHighlights)
    for _, v in ipairs({ tpWalkConnection, infJumpConnection, noclipLoop, gravityLoop, infiniteStaminaLoop, killAuraConnection }) do
        if v then v:Disconnect() end
    end
    visualKillAllActive = false
    killAuraEnabled     = false
    Workspace.Gravity   = 196.2
end

Players.LocalPlayer.OnTeleport:Connect(cleanup)
Library:OnUnload(cleanup)

notify("XXMZ HUB v2.2", "Carregado com sucesso! ✅", 5)
