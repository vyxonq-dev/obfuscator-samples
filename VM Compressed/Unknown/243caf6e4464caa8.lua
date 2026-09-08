repeat task.wait() until game:IsLoaded()
wait(5)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local utility = game.Players.LocalPlayer.PlayerScripts.Client.Utility
local util = require(utility)
local data = util.data
local playerItems = data.items or {}
local playerStats = data.stats or {}

-- Auto detect: in hub or in game
local inHub = pcall(function() return ReplicatedStorage.Remotes.Play ~= nil end)
local create_room, start_remote
if inHub then
    create_room = ReplicatedStorage.Remotes.Play:WaitForChild("create_room")
    start_remote = ReplicatedStorage.Remotes.Play:WaitForChild("start")
end

local MATERIAL_DROPS = {
	["Zenkai Ore"] = { world = "GT City", mode = "Story", acts = {1,2} },
	["Ki Resonant Crystal"] = { world = "GT City", mode = "Story", acts = {3,4} },
	["Stellar Ki Quartz"] = { world = "GT City", mode = "Story", acts = {5,6} },
	["Limitbreak Obsidian"] = { world = "GT City", mode = "Story", acts = {7,8} },
	["Eclipse Godstone"] = { world = "GT City", mode = "Story", acts = {9,10} },
	["Currentbinder Rope"] = { world = "Marine Lobby", mode = "Story", acts = {1,2} },
	["Depthglass Bottle"] = { world = "Marine Lobby", mode = "Story", acts = {3,4} },
	["Stormwake Sailcloth"] = { world = "Marine Lobby", mode = "Story", acts = {5,6} },
	["Beastblood Catalyst"] = { world = "Marine Lobby", mode = "Story", acts = {7,8} },
	["King's Haki Residue"] = { world = "Marine Lobby", mode = "Story", acts = {9,10} },
	["Shinobi Bone"] = { world = "Ninja Village", mode = "Story", acts = {1,2} },
	["Binding Cloth"] = { world = "Ninja Village", mode = "Story", acts = {3,4} },
	["Genjutsu Fog Vial"] = { world = "Ninja Village", mode = "Story", acts = {5,6} },
	["Fuin Script Paper"] = { world = "Ninja Village", mode = "Story", acts = {7,8} },
	["Chakra Fragment"] = { world = "Ninja Village", mode = "Story", acts = {9,10} },
	["Apostle Iron"] = { world = "Eclipse (Before)", mode = "Story", acts = {1,2} },
	["Eclipse Stone"] = { world = "Eclipse (Before)", mode = "Story", acts = {3,4} },
	["Brand Ash"] = { world = "Eclipse (Before)", mode = "Story", acts = {5,6} },
	["Moonlit Silver"] = { world = "Eclipse (Before)", mode = "Story", acts = {7,8} },
	["Black Sun Amber"] = { world = "Eclipse (Before)", mode = "Story", acts = {9,10} },
	["Gryphon"] = { world = "Marine Lobby", mode = "Squadron", act = 3 },
	["Pelli"] = { world = "Marine Lobby", mode = "Squadron", act = 1 },
	["Headband"] = { world = "Ninja Village", mode = "Squadron", act = 1 },
	["Karashi's Book"] = { world = "Ninja Village", mode = "Squadron", act = 2 },
	["Shuriken"] = { world = "Ninja Village", mode = "Squadron", act = 3 },
	["Power Pole"] = { world = "GT City", mode = "Squadron", act = 3 },
	["Scouter"] = { world = "GT City", mode = "Squadron", act = 2 },
	["Zeni"] = { world = "GT City", mode = "Squadron", act = 1 },
	["Behelit"] = { world = "Eclipse (Before)", mode = "Squadron", act = 1 },
	["Cavalry Saber"] = { world = "Eclipse (Before)", mode = "Squadron", act = 3 },
	["Dragon Slayer (Evo)"] = { world = "Eclipse (Before)", mode = "Squadron", act = 4 },
	["White Behelit"] = { world = "Eclipse (Before)", mode = "Raid", act = 1 },
	["Hogyoku Orb"] = { world = "Katakara Bridge", mode = "Challenge", act = 1 },
    ["Gold"] = { world = "GT City", mode = "Story", acts = {1} }
}

local MAP_LIST = {
    "GT City",
    "Marine Lobby",
    "Ninja Village",
    "Eclipse (Before)",
    "Katakara Bridge"
}

local Window = Fluent:CreateWindow({
    Title = "Evo & Stage Automation",
    SubTitle = "Anime Squadron" .. (inHub and " [HUB]" or " [IN-GAME]"),
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 520),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = { 
    Main = Window:AddTab({ Title = "Evo Farm", Icon = "sword" }),
    AutoJoin = Window:AddTab({ Title = "Auto Join", Icon = "door-open" })
}

local Options = Fluent.Options
local selectedUnit = nil
local units = {}
local unitIds = {}

local function getEvoData(template)
    if not template then return nil end
    local d = template:FindFirstChild("data")
    if not d then return nil end
    local ok, mod = pcall(require, d)
    if not ok then return nil end
    return mod.awakening or mod.evolution or mod.evolve or mod.evo
end

local function findTemplate(name)
    if not name then return nil end
    local t = ReplicatedStorage.Characters:FindFirstChild(name)
    if t then return t end
    for _, child in ipairs(ReplicatedStorage.Characters:GetChildren()) do
        if child.Name:lower() == name:lower() then return child end
        if child.Name:find(name, 1, true) or name:find(child.Name, 1, true) then return child end
    end
    return nil
end

for id, char in pairs(data.characters or {}) do
    if not char or not char.name then continue end
    if unitIds[char.name] then continue end
    unitIds[char.name] = true

    local template = findTemplate(char.name)
    if not template then continue end

    local evo = getEvoData(template)
    if not evo then continue end
    if not evo.cost or not evo.object then continue end

    local missingMats = {}
    for mat, needed in pairs(evo.cost) do
        local have = playerItems[mat] or playerStats[mat] or 0
        if have < needed then
            missingMats[#missingMats+1] = { mat = mat, have = have, need = needed, short = needed - have }
        end
    end
    local traitStr = ""
    if char.trait then
        traitStr = char.trait
        if char.trait_2 then traitStr = traitStr .. "+" .. char.trait_2 end
    end
    units[#units+1] = {
        id = id, name = char.name, target = evo.object.Name,
        level = char.level, shiny = char.shiny, traitStr = traitStr,
        missing = missingMats, numMissing = #missingMats,
        fullCost = evo.cost
    }
end

table.sort(units, function(a,b) return a.numMissing > b.numMissing end)

local hasWrite = pcall(function() writefile("EFarmTest.txt", "1"); delfile("EFarmTest.txt") end)

local function saveCurrentFarmedMat(matName)
    if not hasWrite then return end
    pcall(function() writefile("EFarmCurrentMat.txt", matName) end)
end

local function loadCurrentFarmedMat()
    if not hasWrite then return "" end
    local ok, res = pcall(function() return readfile("EFarmCurrentMat.txt") end)
    if ok and res then
        return res:match("^%s*(.-)%s*$") or ""
    end
    return ""
end

-- Sửa logic hàm Save: Đảm bảo dữ liệu dạng Object đồng bộ chuẩn JSON string
local function saveAutoJoinConfig()
    if not hasWrite then return end
    local mode = Options.StageMode and Options.StageMode.Value or "Story"
    local world = Options.StageMap and Options.StageMap.Value or "GT City"
    local difficulty = Options.StageDiff and Options.StageDiff.Value or "Normal"
    local act = Options.StageAct and tonumber(Options.StageAct.Value) or 1
    local enabled = Options.AutoJoinStage and Options.AutoJoinStage.Value or false
    
    local config = { mode = mode, world = world, difficulty = difficulty, act = act, enabled = enabled }
    pcall(function() writefile("EFarmAutoJoin.txt", HttpService:JSONEncode(config)) end)
end

local function loadAutoJoinConfig()
    if not hasWrite then return nil end
    local ok, res = pcall(function() return HttpService:JSONDecode(readfile("EFarmAutoJoin.txt")) end)
    return ok and res or nil
end

local function saveSelectedUnitName(name)
    if not hasWrite then return end
    pcall(function() writefile("EFarmUnit.txt", HttpService:JSONEncode(name)) end)
end

local function loadSelectedUnitName()
    if not hasWrite then return "" end
    local ok, data = pcall(function() return HttpService:JSONDecode(readfile("EFarmUnit.txt")) end)
    return (ok and type(data) == "string" and data) or ""
end

local function saveUnitsList()
    if not hasWrite then return end
    local dataOut = {}
    for _, u in ipairs(units) do
        dataOut[u.name] = {
            level = u.level, shiny = u.shiny, traitStr = u.traitStr,
            target = u.target, fullCost = u.fullCost
        }
    end
    pcall(function() writefile("EFarmUnits.txt", HttpService:JSONEncode(dataOut)) end)
end

local function loadUnitsList()
    if not hasWrite then return {} end
    local ok, dataIn = pcall(function()
        return HttpService:JSONDecode(readfile("EFarmUnits.txt"))
    end)
    if ok and type(dataIn) == "table" then return dataIn end
    return {}
end

if inHub then
    saveUnitsList()
    task.spawn(function()
        while true do
            task.wait(30)
            pcall(function()
                local m = require(utility)
                data = m.data
                playerItems = data.items or {}
                playerStats = data.stats or {}
            end)
            for _, u in ipairs(units) do
                local missing = {}
                for mat, needed in pairs(u.fullCost) do
                    local have = playerItems[mat] or playerStats[mat] or 0
                    if have < needed then
                        missing[#missing+1] = { mat = mat, have = have, need = needed, short = needed - have }
                    end
                end
                u.missing = missing; u.numMissing = #missing
            end
            saveUnitsList()
        end
    end)
else
    local savedData = loadUnitsList()
    if next(savedData) then
        units = {}
        for name, info in pairs(savedData) do
            local fullCost = info.fullCost or {}
            local missing = {}
            for mat, needed in pairs(fullCost) do
                local have = playerItems[mat] or playerStats[mat] or 0
                if have < needed then
                    missing[#missing+1] = { mat = mat, have = have, need = needed, short = needed - have }
                end
            end
            local level, shiny, traitStr = info.level or 1, info.shiny or false, info.traitStr or ""
            for _, char in pairs(data.characters or {}) do
                if char.name == name then
                    level = char.level; shiny = char.shiny
                    traitStr = char.trait or ""
                    if char.trait_2 then traitStr = traitStr .. "+" .. char.trait_2 end
                    break
                end
            end
            units[#units+1] = {
                name = name, level = level, shiny = shiny, traitStr = traitStr,
                target = info.target or "?", missing = missing, numMissing = #missing,
                fullCost = fullCost
            }
        end
        table.sort(units, function(a,b) return a.numMissing > b.numMissing end)
    end
end

local unitNames = { "Select a unit..." }
local unitMap = { ["Select a unit..."] = nil }
local unitByName = {}
for _, u in ipairs(units) do
    local shiny = u.shiny and " [SHINY]" or ""
    local trait = u.traitStr ~= "" and " [" .. u.traitStr .. "]" or ""
    local key = "Lv" .. tostring(u.level) .. " " .. u.name .. shiny .. trait .. " need" .. tostring(u.numMissing)
    unitNames[#unitNames+1] = key
    unitMap[key] = u
    unitByName[u.name] = u
end

-- ===================================================================
-- CONFIG CHI TIẾT TAB 1: EVO FARM
-- ===================================================================
Tabs.Main:AddParagraph({
    Title = "Evo Material Farmer",
    Content = inHub and ("HUB Mode - Đang có " .. #units .. " unit đủ điều kiện") or ("GAME Mode - Đồng bộ dữ liệu nền thành công")
})

local function refreshData(u)
    pcall(function()
        local m = require(utility)
        data = m.data
        playerItems = data.items or {}
        playerStats = data.stats or {}
    end)
    if not u then return end
    local cost = u.fullCost
    local template = ReplicatedStorage.Characters:FindFirstChild(u.name)
    if template and template:FindFirstChild("data") then
        local ok, mod = pcall(require, template.data)
        if ok then
            cost = (mod.awakening or mod.evolution or mod.evolve or mod.evo or {}).cost
        end
    end
    cost = cost or u.fullCost
    local newMissing = {}
    for mat, needed in pairs(cost) do
        local have = playerItems[mat] or playerStats[mat] or 0
        if have < needed then
            newMissing[#newMissing+1] = { mat = mat, have = have, need = needed, short = needed - have }
        end
    end
    u.missing = newMissing
    u.numMissing = #newMissing
end

local function logMaterialStatus(unit)
    if not unit then return end
    print("===== Evo Material [" .. unit.name .. "] =====")
    for mat, needed in pairs(unit.fullCost) do
        local have = playerItems[mat] or playerStats[mat] or 0
        print("  " .. (have >= needed and "READY" or "NEED") .. " " .. mat .. ": " .. tostring(have) .. "/" .. tostring(needed))
    end
    print("=====================================")
end

Tabs.Main:AddButton({
    Title = "Cập nhật số liệu Material",
    Description = "Làm tươi số lượng vật phẩm trong túi đồ hiện tại",
    Callback = function()
        pcall(function()
            refreshData(selectedUnit)
            if selectedUnit then pcall(showUnitInfo, selectedUnit); pcall(logMaterialStatus, selectedUnit) end
        end)
        Fluent:Notify({ Title = "Cập nhật", Content = "Đã làm mới số liệu kho đồ!", Duration = 3 })
    end
})

local unitDropdown = Tabs.Main:AddDropdown("UnitSelect", {
    Title = "Chọn mục tiêu Unit",
    Values = unitNames, Multi = false, Default = 1,
})

local diffDropdown = Tabs.Main:AddDropdown("Difficulty", {
    Title = "Độ khó phòng tạo (Auto Farm)",
    Values = {"Normal", "Hard"}, Multi = false, Default = 1,
})

function showUnitInfo(unit)
    if not unit then return end
    local lines = {}
    local s = unit.shiny and " [SHINY]" or ""
    local t = unit.traitStr ~= "" and " Trait: " .. unit.traitStr or ""
    lines[#lines+1] = unit.name .. s .. " Lv" .. unit.level .. t
    lines[#lines+1] = "-> Target: " .. unit.target
    lines[#lines+1] = "Danh sách yêu cầu:"
    for mat, needed in pairs(unit.fullCost) do
        local have = playerItems[mat] or playerStats[mat] or 0
        local icon = have >= needed and "✓" or "✗"
        local drop = MATERIAL_DROPS[mat]
        local d = ""
        if drop then
            local a = drop.acts and drop.acts[#drop.acts] or drop.act or 1
            d = " [" .. drop.world .. " A" .. a .. " " .. drop.mode .. "]"
        end
        lines[#lines+1] = icon .. " " .. mat .. ": " .. tostring(have) .. "/" .. tostring(needed) .. d
    end
    if unit.numMissing > 0 then
        lines[#lines+1] = "Còn thiếu " .. unit.numMissing .. " loại:"
        for _, m in ipairs(unit.missing) do
            lines[#lines+1] = "  - " .. m.mat .. " x" .. tostring(m.short)
        end
    else
        lines[#lines+1] = "ĐÃ ĐỦ NGUYÊN LIỆU! Có thể tiến hoá."
    end
    Fluent:Notify({ Title = unit.name, Content = table.concat(lines, "\n"), Duration = 10 })
end

local farming = false
local autoFarmToggle = Tabs.Main:AddToggle("AutoFarm", {
    Title = "Kích hoạt Auto Farm Theo Unit",
    Description = "Tự động tìm map, nhảy map khi đủ nguyên liệu.",
    Default = false,
})


-- ===================================================================
-- CONFIG CHI TIẾT TAB 2: AUTO JOIN (ĐÃ FIX LỖI KHÔNG LƯU CONFIG)
-- ===================================================================
Tabs.AutoJoin:AddParagraph({ 
    Title = "Hệ thống thiết lập phòng chơi", 
    Content = "Cấu hình tự chọn độc lập, máy sẽ tự lặp lại màn này không cần điều kiện kho đồ." 
})

local stageModeDropdown = Tabs.AutoJoin:AddDropdown("StageMode", {
    Title = "Chế độ (Mode)",
    Values = {"Story", "Squadron", "Raid", "Challenge"}, Multi = false, Default = 1,
})
stageModeDropdown:OnChanged(function() saveAutoJoinConfig() end)

local stageMapDropdown = Tabs.AutoJoin:AddDropdown("StageMap", {
    Title = "Bản đồ (Map)",
    Values = MAP_LIST, Multi = false, Default = 1,
})
stageMapDropdown:OnChanged(function() saveAutoJoinConfig() end)

local stageDiffDropdown = Tabs.AutoJoin:AddDropdown("StageDiff", {
    Title = "Độ khó (Difficulty)",
    Values = {"Normal", "Hard"}, Multi = false, Default = 1,
})
stageDiffDropdown:OnChanged(function() saveAutoJoinConfig() end)

local stageActDropdown = Tabs.AutoJoin:AddDropdown("StageAct", {
    Title = "Hồi (Act)",
    Values = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"}, Multi = false, Default = 1,
})
stageActDropdown:OnChanged(function() saveAutoJoinConfig() end)

local autoJoinEnabled = false
local autoJoinToggle = Tabs.AutoJoin:AddToggle("AutoJoinStage", {
    Title = "Kích hoạt Auto Join Stage",
    Description = inHub and "Tự động tạo phòng và bắt đầu màn chơi đã chọn" or "Đang trong trận - Giữ trạng thái để tự Auto Replay",
    Default = false,
})


-- ===================================================================
-- THUẬT TOÁN LOGIC XỬ LÝ VÀ ĐIỀU HƯỚNG REMOTES
-- ===================================================================
local allowToggleOff = false
local function setFarmOff()
    allowToggleOff = true
    farming = false
    autoFarmToggle:SetValue(false)
    allowToggleOff = false
end

local function setAutoJoinOff()
    allowToggleOff = true
    autoJoinEnabled = false
    autoJoinToggle:SetValue(false)
    allowToggleOff = false
end

local function getFirstDrop(u)
    if not u then return nil end
    for _, m in ipairs(u.missing or {}) do
        local d = MATERIAL_DROPS[m.mat]
        if d then return d, m.mat end
    end
    return nil
end

local function enterGame(u)
    local drop, matName = getFirstDrop(u)
    if not drop then return false end
    saveCurrentFarmedMat(matName or "")
    
    local act = drop.acts and drop.acts[#drop.acts] or drop.act or 1
    local diff = diffDropdown.Value
    local ok, err = create_room:InvokeServer({
        boosted = true, act = act, difficulty = diff,
        mode = drop.mode, only_friends = false, world = drop.world
    })
    if not ok then return false end
    print("Farming: " .. matName .. " at " .. drop.world .. " A" .. act .. " " .. drop.mode)
    task.wait(1.5)
    pcall(function() start_remote:InvokeServer() end)
    return true
end

local function enterGameManual()
    local mode = stageModeDropdown.Value
    local world = stageMapDropdown.Value
    local diff = stageDiffDropdown.Value
    local act = tonumber(stageActDropdown.Value) or 1
    
    saveCurrentFarmedMat("MANUAL_STAGE")
    saveAutoJoinConfig() -- Đồng bộ trạng thái File trước khi dịch chuyển

    local ok, err = create_room:InvokeServer({
        boosted = true, act = act, difficulty = diff,
        mode = mode, only_friends = false, world = world
    })
    if not ok then return false end
    print("Auto Join Stage: " .. world .. " - Mode: " .. mode .. " - Act: " .. tostring(act) .. " [" .. diff .. "]")
    task.wait(1.5)
    pcall(function() start_remote:InvokeServer() end)
    return true
end

local function scanRewards(endScreen)
    if not endScreen then return false end
    local rewardsFrame = endScreen:FindFirstChild("Rewards")
    local scroll = rewardsFrame and rewardsFrame:FindFirstChild("ScrollingFrame")
    if not scroll then return false end
    local added = false
    for _, child in ipairs(scroll:GetChildren()) do
        if child:IsA("ImageButton") then
            local qtyLabel = child:FindFirstChild("Quantity")
            local qty = qtyLabel and tonumber(qtyLabel.Text) or 0
            if qty and qty > 0 then
                local name = child.Name
                if playerItems[name] ~= nil then
                    playerItems[name] = (playerItems[name] or 0) + qty
                    added = true
                elseif playerStats[name] ~= nil then
                    playerStats[name] = (playerStats[name] or 0) + qty
                    added = true
                end
            end
        end
    end
    return added
end

local gameReplay, gameEnding, gameTeleport
pcall(function() gameReplay = ReplicatedStorage.Remotes.Game:WaitForChild("replay") end)
pcall(function() gameEnding = ReplicatedStorage.Remotes.Game:WaitForChild("ending") end)
pcall(function() gameTeleport = ReplicatedStorage.Remotes.Players:WaitForChild("teleport") end)

if gameEnding then
    gameEnding.OnClientEvent:Connect(function()
        local endScreen = nil
        local playerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        for i = 1, 10 do
            local menus = playerGui:FindFirstChild("Menus")
            if menus then
                endScreen = menus:FindFirstChild("EndScreen")
                if endScreen and endScreen.Visible then break end
            end
            task.wait(0.5)
        end

        if not endScreen then
            if gameReplay and (farming or autoJoinEnabled) then pcall(function() gameReplay:FireServer() end) end
            return
        end

        pcall(scanRewards, endScreen)

        -- Ưu tiên 1: Đang bật Auto Join Stage thủ công ở Tab 2
        if autoJoinEnabled then
            if gameReplay then pcall(function() gameReplay:FireServer() end) end
            return
        end

        -- Ưu tiên 2: Đang chạy Auto Farm Unit ở Tab 1
        if not farming then return end

        local u = selectedUnit
        if u then
            pcall(refreshData, u)
            pcall(logMaterialStatus, u)
        end

        if not u or u.numMissing == 0 then
            setFarmOff()
            if gameTeleport then pcall(function() gameTeleport:FireServer() end) end
            return
        end

        local trackedMat = loadCurrentFarmedMat()
        local curMatDone = true
        
        if trackedMat and trackedMat ~= "" and trackedMat ~= "MANUAL_STAGE" then
            local neededAmount = u.fullCost[trackedMat] or 0
            local currentHave = playerItems[trackedMat] or playerStats[trackedMat] or 0
            if currentHave < neededAmount then curMatDone = false end
        else
            local _, fallbackMat = getFirstDrop(u)
            if fallbackMat then
                trackedMat = fallbackMat
                saveCurrentFarmedMat(fallbackMat)
                curMatDone = false
            end
        end

        if curMatDone then
            if gameTeleport then pcall(function() gameTeleport:FireServer() end) end
        else
            if gameReplay then pcall(function() gameReplay:FireServer() end) end
        end
    end)
end

local function doFarmLoop()
    local u = selectedUnit
    if not u then setFarmOff(); return end

    refreshData(u)
    logMaterialStatus(u)

    if u.numMissing == 0 then setFarmOff(); return end
    if not getFirstDrop(u) then setFarmOff(); return end

    if inHub and create_room and start_remote then
        if not enterGame(u) then setFarmOff(); return end
    end
    while farming do task.wait(5) end
end

local function doAutoJoinLoop()
    if inHub and create_room and start_remote then
        if not enterGameManual() then setAutoJoinOff(); return end
    end
    while autoJoinEnabled do task.wait(5) end
end

local function isActuallyInGame()
    local hasGame = pcall(function() return ReplicatedStorage.Remotes.Game ~= nil end)
    local hasPlay = pcall(function() return ReplicatedStorage.Remotes.Play ~= nil end)
    return hasGame and not hasPlay
end

unitDropdown:OnChanged(function(val)
    local u = unitMap[val]
    selectedUnit = u
    if u then
        saveSelectedUnitName(u.name)
        pcall(refreshData, u)
        pcall(showUnitInfo, u)
        pcall(logMaterialStatus, u)
        if farming and inHub and u.numMissing > 0 then
            task.spawn(doFarmLoop)
        end
    end
end)

autoFarmToggle:OnChanged(function(value)
    if value and autoJoinEnabled then
        Fluent:Notify({ Title = "Xung đột", Content = "Vui lòng tắt Auto Join Stage trước!", Duration = 4 })
        autoFarmToggle:SetValue(false)
        return
    end

    if not value and farming and isActuallyInGame() and not allowToggleOff then
        autoFarmToggle:SetValue(true)
        return
    end
    farming = value
    if value then
        if inHub then
            if not selectedUnit then return end
            if selectedUnit.numMissing == 0 then setFarmOff(); return end
            task.spawn(doFarmLoop)
        end
    end
end)

autoJoinToggle:OnChanged(function(value)
    if value and farming then
        Fluent:Notify({ Title = "Xung đột", Content = "Vui lòng tắt Auto Farm bên Tab 1 trước!", Duration = 4 })
        autoJoinToggle:SetValue(false)
        return
    end

    if not value and autoJoinEnabled and isActuallyInGame() and not allowToggleOff then
        autoJoinToggle:SetValue(true)
        return
    end

    autoJoinEnabled = value
    saveAutoJoinConfig() -- Cập nhật trạng thái bật/tắt vào file ngay lập tức

    if value then
        if inHub then
            task.spawn(doAutoJoinLoop)
        else
            Fluent:Notify({ Title = "Auto Join Stage", Content = "Đang trong game - Sẽ tự động Replay khi hết trận.", Duration = 4 })
        end
    end
end)

local TabsS = Window:AddTab({ Title = "Settings", Icon = "settings" })
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("EvoFarmer2")
SaveManager:SetFolder("EvoFarmer2/configs")
InterfaceManager:BuildInterfaceSection(TabsS)
SaveManager:BuildConfigSection(TabsS)

Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()

-- KHỞI TẠO ĐỒNG BỘ CONFIG CŨ CHUẨN XÁC
task.spawn(function()
    task.wait(0.5)
    
    local savedJoin = loadAutoJoinConfig()
    if savedJoin then
        pcall(function() stageModeDropdown:SetValue(savedJoin.mode) end)
        pcall(function() stageMapDropdown:SetValue(savedJoin.world) end)
        pcall(function() stageDiffDropdown:SetValue(savedJoin.difficulty) end)
        pcall(function() stageActDropdown:SetValue(tostring(savedJoin.act)) end)
        task.wait(0.2)
        if savedJoin.enabled and not farming then
            autoJoinToggle:SetValue(true)
        end
    end

    if not selectedUnit then
        local savedName = loadSelectedUnitName()
        if savedName ~= "" and unitByName[savedName] then
            selectedUnit = unitByName[savedName]
            for key, u in pairs(unitMap) do
                if u == selectedUnit then
                    unitDropdown:SetValue(key)
                    break
                end
            end
        end
    end
    if selectedUnit then refreshData(selectedUnit) end
    if farming and inHub and selectedUnit and selectedUnit.numMissing > 0 then
        task.spawn(doFarmLoop)
    elseif autoJoinEnabled and inHub then
        task.spawn(doAutoJoinLoop)
    end
end)

Fluent:Notify({ Title = "Hệ thống", Content = "Đã sửa xong lỗi lưu Config Auto Join Stage!", Duration = 5 })
 
