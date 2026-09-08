--[[
    Roll for Chiikawa [RNG] Grinder
    Author: hidevin
    UI: ObsidianUltra (fork of Obsidian)
    Toggle: Right Shift
]]

-- Bump the shared generation so any older instance's loops die on the next check.
getgenv().ChiikawaGrinder_Gen = (getgenv().ChiikawaGrinder_Gen or 0) + 1
local MY_GEN = getgenv().ChiikawaGrinder_Gen
local function alive()
    return getgenv().ChiikawaGrinder_Gen == MY_GEN
end

local repo = "https://raw.githubusercontent.com/joustingmatch/ObsidianUltra/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

local GAME_NAME = "Roll for Chiikawa!"

-- ===== Anti-AFK (always on) =====
pcall(function()
    LocalPlayer.Idled:Connect(function()
        VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
end)

-- ===== Game data =====
local ChiikawaData = require(ReplicatedStorage:WaitForChild("ChiikawaData"))
local ShinyUtil = require(ReplicatedStorage:WaitForChild("ShinyUtil"))
local RebirthConfig = require(ReplicatedStorage:WaitForChild("RebirthConfig"))
local CrafteoConfig = require(ReplicatedStorage:WaitForChild("CrafteoConfig"))

local TirarRuleta = ReplicatedStorage:WaitForChild("TirarRuleta")
local ComprarMejora = ReplicatedStorage:WaitForChild("ComprarMejora")
local EquiparChiikawa = ReplicatedStorage:WaitForChild("EquiparChiikawa")
local HacerRebirth = ReplicatedStorage:WaitForChild("HacerRebirth")
local Craftear = ReplicatedStorage:WaitForChild("Craftear")
local ComprarExpandir = ReplicatedStorage:WaitForChild("ComprarExpandir")

local ChiikawaPorNombre = {}
for _, c in ipairs(ChiikawaData.Chiikawas) do
    ChiikawaPorNombre[c.Nombre] = c
end

local RarezaRank = {}
for i, r in ipairs(ChiikawaData.OrdenRarezas) do
    RarezaRank[r] = i
end

local VariantePorClave = {}
for _, v in ipairs(ChiikawaData.Variantes) do
    VariantePorClave[v.Clave] = v
end

-- ===== Cleanup previous instances =====
pcall(function()
    local hui = gethui()
    if hui then
        for _, child in ipairs(hui:GetChildren()) do
            if child:IsA("ScreenGui") and child:GetAttribute("ChiikawaGrinder") == true then
                child:Destroy()
            end
        end
    end
end)

-- ===== Window =====
local Window = Library:CreateWindow({
    Title = GAME_NAME,
    Footer = "Please leave a like on Rscripts if it works. Author:hidevin",
    ToggleKeybind = Enum.KeyCode.RightShift,
    NotifySide = "Right",
    SearchbarSize = UDim2.fromScale(0.35, 1),
})

task.spawn(function()
    pcall(function()
        local frame = Library.MainFrame
        if frame then
            local sg = frame:FindFirstAncestorOfClass("ScreenGui") or frame
            sg:SetAttribute("ChiikawaGrinder", true)
        end
    end)
end)

if STATE then
    STATE.onCleanup(function()
        pcall(function() Library:Unload() end)
    end)
end

-- ===== Tabs =====
local FarmingTab = Window:AddTab({ Name = "Farming", Icon = "zap", Description = "Roll, place best, rebirth" })
local UpgradeTab = Window:AddTab({ Name = "Upgrades", Icon = "trending-up", Description = "Luck, speed and rolls" })
local CraftTab = Window:AddTab({ Name = "Craft", Icon = "flask-conical", Description = "Combine Chiikawas" })
local SettingsTab = Window:AddTab({ Name = "UI Settings", Icon = "settings", Description = "Configs and info" })

-- ===== Farming tab =====
local RollBox = FarmingTab:AddLeftGroupbox("Auto Roll", "sparkles")
RollBox:AddLabel("Rolls the roulette automatically.", false)
local AutoRoll = RollBox:AddToggle("AutoRoll", { Text = "Auto Roll", Default = false })
local RollInterval = RollBox:AddSlider("RollInterval", { Text = "Roll interval", Min = 0.1, Max = 30, Default = 0.5, Rounding = 1, Suffix = "s" })

local ChiBox = FarmingTab:AddLeftGroupbox("Chiikawas", "star")
local AutoPlaceBest = ChiBox:AddToggle("AutoPlaceBest", { Text = "Auto Place Best", Default = false })
local PlaceInterval = ChiBox:AddSlider("PlaceInterval", { Text = "Place interval", Min = 0.1, Max = 30, Default = 3, Rounding = 1, Suffix = "s" })
local AutoRebirth = ChiBox:AddToggle("AutoRebirth", { Text = "Auto Rebirth", Default = false })
local RebirthInterval = ChiBox:AddSlider("RebirthInterval", { Text = "Rebirth interval", Min = 0.1, Max = 30, Default = 5, Rounding = 1, Suffix = "s" })
ChiBox:AddLabel("Rebirth saves your 2 best Chiikawas.", false)

local UnlockBox = FarmingTab:AddLeftGroupbox("Slots", "unlock")
local AutoUnlockSlots = UnlockBox:AddToggle("AutoUnlockSlots", { Text = "Auto Unlock New Slots", Default = false })
local UnlockInterval = UnlockBox:AddSlider("UnlockInterval", { Text = "Unlock interval", Min = 0.1, Max = 30, Default = 3, Rounding = 1, Suffix = "s" })
UnlockBox:AddLabel("Buys money slots and rebirth-gated slots.", false)

FarmingTab:AddLeftGroupbox("Info", "info"):AddLabel("Press RIGHT SHIFT to open/close this window.", true)

-- ===== Upgrades tab =====
local UpgradeBox = UpgradeTab:AddLeftGroupbox("Auto Upgrade", "arrow-up")
local AutoUpgrade = UpgradeBox:AddToggle("AutoUpgrade", { Text = "Auto Upgrade", Default = false })
local UpgradeInterval = UpgradeBox:AddSlider("UpgradeInterval", { Text = "Upgrade interval", Min = 0.1, Max = 30, Default = 1, Rounding = 1, Suffix = "s" })

local UpgradeNames = { Suerte = "Luck", Velocidad = "Speed", Rolls = "Rolls" }
local UpgradeList = UpgradeBox:AddDropdown("UpgradeList", {
    Text = "Upgrades to buy",
    Values = { "Suerte", "Velocidad", "Rolls" },
    Default = { "Suerte", "Velocidad", "Rolls" },
    Multi = true,
    FormatDisplayValue = function(v) return UpgradeNames[v] or v end,
    FormatListValue = function(v) return UpgradeNames[v] or v end,
})

-- ===== Craft tab =====
local CraftBox = CraftTab:AddLeftGroupbox("Auto Craft", "hammer")
local AutoCraft = CraftBox:AddToggle("AutoCraft", { Text = "Auto Craft", Default = false })
local CraftInterval = CraftBox:AddSlider("CraftInterval", { Text = "Craft interval", Min = 0.1, Max = 30, Default = 1, Rounding = 1, Suffix = "s" })

local RecipeLabels = {}
local RecipeByLabel = {}
for i, paso in ipairs(CrafteoConfig.Cadena) do
    local label = paso.De .. " -> " .. paso.A
    RecipeLabels[#RecipeLabels + 1] = label
    RecipeByLabel[label] = i
end

local CraftRecipe = CraftBox:AddDropdown("CraftRecipe", {
    Text = "Recipe",
    Values = RecipeLabels,
    Default = RecipeLabels[1],
})
local CraftVariant = CraftBox:AddDropdown("CraftVariant", {
    Text = "Variant",
    Values = { "Normal", "Shiny", "Gold", "Void", "Glitch" },
    Default = "Normal",
})

-- ===== Settings tab =====
SettingsTab:AddLeftGroupbox("Info", "info"):AddLabel("Right Shift toggles the UI. Anti-AFK is always on.", true)

pcall(function()
    local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
    SaveManager:SetLibrary(Library)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetFolder("hidevin/RollForChiikawa")
    SaveManager:BuildConfigSection(SettingsTab)
    SaveManager:LoadAutoloadConfig()
end)

-- ===== Helpers =====
local function getMoney()
    local ls = LocalPlayer:FindFirstChild("leaderstats")
    local m = ls and ls:FindFirstChild("Money")
    return m and m.Value or 0
end

local function getRebirths()
    local ls = LocalPlayer:FindFirstChild("leaderstats")
    local r = ls and ls:FindFirstChild("Rebirths")
    return r and r.Value or 0
end

local function getOwnedChiikawas()
    local owned = {}
    local function addName(baseName, variantClave)
        local data = ChiikawaPorNombre[baseName]
        if not data then return end
        local mult = 1
        if variantClave and VariantePorClave[variantClave] then
            mult = VariantePorClave[variantClave].Multiplicador or 1
        end
        local score = (data.Genera or 0) * mult
        local existing = owned[baseName]
        if not existing or score > existing.score then
            owned[baseName] = {
                fullName = (variantClave and ShinyUtil.ValorVariante(baseName, variantClave)) or baseName,
                score = score,
                rank = RarezaRank[data.Rareza] or 0,
            }
        end
    end

    local normal = LocalPlayer:FindFirstChild("ChiikawasObtenidos")
    if normal then
        for _, v in ipairs(normal:GetChildren()) do addName(v.Name, nil) end
    end
    for _, variant in ipairs(ChiikawaData.Variantes) do
        local folder = LocalPlayer:FindFirstChild(variant.CarpetaInv)
        if folder then
            for _, v in ipairs(folder:GetChildren()) do addName(v.Name, variant.Clave) end
        end
    end

    local list = {}
    for _, v in pairs(owned) do list[#list + 1] = v end
    table.sort(list, function(a, b)
        if a.score ~= b.score then return a.score > b.score end
        return a.rank > b.rank
    end)
    return list
end

local function placeBest()
    local unlocked = LocalPlayer:FindFirstChild("SlotsDesbloqueados")
    local slots = LocalPlayer:FindFirstChild("Slots")
    if not unlocked or not slots then return end

    local slotNames = {}
    for _, v in ipairs(unlocked:GetChildren()) do
        if v:IsA("BoolValue") and v.Value then slotNames[#slotNames + 1] = v.Name end
    end
    if #slotNames == 0 then return end

    local owned = getOwnedChiikawas()
    for i, sn in ipairs(slotNames) do
        if i > #owned then break end
        local sv = slots:FindFirstChild(sn)
        if sv and sv.Value ~= owned[i].fullName then
            pcall(function() EquiparChiikawa:FireServer(sn, owned[i].fullName) end)
        end
    end
end

local function doRebirth()
    local money = getMoney()
    local rebirths = getRebirths()
    local cost = RebirthConfig.precio(rebirths)
    if money < cost then return end

    local owned = getOwnedChiikawas()
    if #owned < 2 then return end

    local saved = { owned[1].fullName, owned[2].fullName }
    pcall(function() HacerRebirth:InvokeServer(saved) end)
end

local function unlockSlots()
    local SlotsConfig = ChiikawaData.SlotsConfig
    local unlocked = LocalPlayer:FindFirstChild("SlotsDesbloqueados")
    if not unlocked or not SlotsConfig then return end

    local money = getMoney()
    local rebirths = getRebirths()

    for i, name in ipairs(ChiikawaData.SlotsNormales) do
        local cfg = SlotsConfig[name]
        if cfg then
            local slot = unlocked:FindFirstChild(name)
            local isUnlocked = slot and slot.Value or false
            if not isUnlocked then
                local tipo = cfg.tipo
                local cantidad = cfg.cantidad or 0
                if tipo == "dinero" and money >= cantidad then
                    pcall(function() ComprarExpandir:FireServer(i, "dinero") end)
                    return
                elseif tipo == "rebirth" and rebirths >= cantidad then
                    pcall(function() ComprarExpandir:FireServer(i, "dinero") end)
                    return
                end
            end
        end
    end
end

local function buyUpgrades()
    local active = UpgradeList:GetActiveValues()
    local want = {}
    for _, name in ipairs(active) do want[name] = true end

    local Mejoras = LocalPlayer:FindFirstChild("Mejoras")
    local maxBy = { Suerte = 15, Velocidad = 15, Rolls = 2 }
    for _, name in ipairs({ "Suerte", "Velocidad", "Rolls" }) do
        if want[name] then
            local m = Mejoras and Mejoras:FindFirstChild(name)
            local lvl = m and m.Value or 0
            if lvl < (maxBy[name] or 15) then
                pcall(function() ComprarMejora:FireServer(name) end)
            end
        end
    end
end

local function doCraft()
    local label = CraftRecipe.Value
    local paso = RecipeByLabel[label]
    if not paso then return end
    local variant = CraftVariant.Value or "Normal"
    pcall(function() Craftear:InvokeServer(paso, variant) end)
end

-- ===== Loops =====
task.spawn(function()
    while alive() do
        if AutoRoll.Value then
            pcall(function() TirarRuleta:InvokeServer() end)
            task.wait(math.max(0.1, RollInterval.Value))
        else
            task.wait(0.5)
        end
    end
end)

task.spawn(function()
    while alive() do
        if AutoPlaceBest.Value then
            placeBest()
            task.wait(math.max(0.1, PlaceInterval.Value))
        else
            task.wait(1)
        end
    end
end)

task.spawn(function()
    while alive() do
        if AutoRebirth.Value then
            doRebirth()
            task.wait(math.max(0.1, RebirthInterval.Value))
        else
            task.wait(1)
        end
    end
end)

task.spawn(function()
    while alive() do
        if AutoUpgrade.Value then
            buyUpgrades()
            task.wait(math.max(0.1, UpgradeInterval.Value))
        else
            task.wait(1)
        end
    end
end)

task.spawn(function()
    while alive() do
        if AutoCraft.Value then
            doCraft()
            task.wait(math.max(0.1, CraftInterval.Value))
        else
            task.wait(1)
        end
    end
end)

task.spawn(function()
    while alive() do
        if AutoUnlockSlots.Value then
            unlockSlots()
            task.wait(math.max(0.1, UnlockInterval.Value))
        else
            task.wait(1)
        end
    end
end)

pcall(function()
    Library:Notify({
        Title = GAME_NAME,
        Content = "Loaded! Press Right Shift to open/close.",
        Duration = 6,
    })
end)
