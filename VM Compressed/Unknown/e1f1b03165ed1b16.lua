local stored_fonts = {}
gui_config = {
    Color = Color3.fromRGB(255, 255, 255),
    Keybind = Enum.KeyCode.Insert, -- for pc related only enum keys documentation: https://create.roblox.com/docs/reference/engine/enums/KeyCode
    Assets = false, -- set to true if you want custom background asset
    MinHeight = 100,
    MaxHeight = 600,
    InitialHeight = 400,
    MinWidth = 300,
    MaxWidth = 800,
    InitialWidth = 500
}

for _, v in Enum.Font:GetEnumItems() do
    table.insert(stored_fonts, v.Name)
end

local config = (getfenv().gui_config) or nil -- custom config or fully ignore this
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow(config, gethui())
local window_name = library:SetWindowName("Mythical Tower Defense| By MjContegazxc") -- title to use for gui


local tabs = {
    -- creates "main" tab
    main = window:CreateTab("Main"),
    game = window:CreateTab("Game"),
    settings = window:CreateTab("Settings")
}


local sections = {
Info = tabs.main:CreateSection("Stats"),
  Main = tabs.main:CreateSection("Main"),
Mob = tabs.main:CreateSection("Mobs"),
Teleport = tabs.main:CreateSection("Teleport"),
Player = tabs.main:CreateSection("LocalPlayer"),
Upgrade = tabs.main:CreateSection("Upgrade"),
 Game = tabs.game:CreateSection("Game"),
Discord = tabs.game:CreateSection("Discord"),
}

-- Time Label
local time_label = sections.Info:CreateLabel("Time: "..os.date("%H:%M:%S"))

spawn(function()
    while true do
        time_label:UpdateText("Time: "..os.date("%H:%M:%S"))
        wait(1)
    end
end)

-- Stats Labels
local gem_label = sections.Info:CreateLabel("Gem: ...")
local kills_label = sections.Info:CreateLabel("Kills: ...")
local wins_label = sections.Info:CreateLabel("Wins: ...")
local waves_label = sections.Info:CreateLabel("Waves: ...")
local exp_label = sections.Info:CreateLabel("EXP: ...")
local coins_label = sections.Info:CreateLabel("Coins: ...")
local pumpkins_label = sections.Info:CreateLabel("Pumpkins: ...")
local money_label = sections.Info:CreateLabel("Money: ...")
local level_label = sections.Info:CreateLabel("Level: ...")
local keys_label = sections.Info:CreateLabel("Spooky Keys: ...")

spawn(function()
    while true do
        local player = game:GetService("Players").LocalPlayer
        
        if player then
            if player:FindFirstChild("leaderstats") then
                local leaderstats = player.leaderstats
                if leaderstats:FindFirstChild("Kills") then
                    kills_label:UpdateText("Kills: "..tostring(leaderstats.Kills.Value))
                end
                if leaderstats:FindFirstChild("Wins") then
                    wins_label:UpdateText("Wins: "..tostring(leaderstats.Wins.Value))
                end
                if leaderstats:FindFirstChild("Waves") then
                    waves_label:UpdateText("Waves: "..tostring(leaderstats.Waves.Value))
                end
            end
            
            if player:FindFirstChild("Gems") then
                gem_label:UpdateText("Gem: "..tostring(player.Gems.Value))
            end
            if player:FindFirstChild("EXP") then
                exp_label:UpdateText("EXP: "..tostring(player.EXP.Value))
            end
            if player:FindFirstChild("Coins") then
                coins_label:UpdateText("Coins: "..tostring(player.Coins.Value))
            end
            if player:FindFirstChild("Pumpkins") then
                pumpkins_label:UpdateText("Pumpkins: "..tostring(player.Pumpkins.Value))
            end
            if player:FindFirstChild("Money") then
                money_label:UpdateText("Money: "..tostring(player.Money.Value))
            end
            if player:FindFirstChild("Level") then
                level_label:UpdateText("Level: "..tostring(player.Level.Value))
            end
            if player:FindFirstChild("Spooky_Keys") then
                keys_label:UpdateText("Spooky Keys: "..tostring(player.Spooky_Keys.Value))
            end
        end
        
        wait(0.5)
    end
end)

local autoQuitEnabled = false
local quitConnection
local quitMinutes = 1

-- Textbox for minutes input
sections.Info:CreateTextBox(
    "Quit After Minutes(any numbers)",
    "1",
    true, -- numbers only
    function(value)
        quitMinutes = tonumber(value) or 1
    end
)

-- Auto Quit Toggle
sections.Info:CreateToggle("Auto Quit Game Based Mins", false, function(state)
    autoQuitEnabled = state
    if state then
        local startTime = tick()
        local targetTime = quitMinutes * 60
        
        quitConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if tick() - startTime >= targetTime then
                game:GetService("TeleportService"):Teleport(102304385522813)
                quitConnection:Disconnect()
            end
        end)
        
        window:Notify("Auto Quit Game", "Auto Quit Enabled - " .. quitMinutes .. " minutes", 3)
    else
        if quitConnection then
            quitConnection:Disconnect()
        end
        window:Notify("Auto Quit Game", "Auto Quit Disabled", 3)
    end
end)

sections.Info:CreateButton(
    "Back To Lobby",
    function()
        window:Notify("Back To Lobby", "Teleporting to Lobby...", 3)
        game:GetService("TeleportService"):Teleport(102304385522813)
    end
)

sections.Info:CreateDivider()

local autoQuitEnabled = false
local quitConnection
local targetGems = 100

sections.Info:CreateTextBox(
    "Target Gems",
    "100",
    true,
    function(value)
        targetGems = tonumber(value) or 100
    end
)

sections.Info:CreateToggle("Auto Back Lobby(Target Gem)", false, function(state)
    autoQuitEnabled = state
    if quitConnection then
        quitConnection:Disconnect()
        quitConnection = nil
    end
    
    if state then
        quitConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local player = game.Players.LocalPlayer
            if player then
                local gems = player:FindFirstChild("Gems")
                if gems and gems.Value >= targetGems then
                    game:GetService("TeleportService"):Teleport(102304385522813)
                    if quitConnection then
                        quitConnection:Disconnect()
                    end
                end
            end
        end)
        
        window:Notify("Auto Quit Game", "Auto Quit Enabled - " .. targetGems .. " gems", 3)
    else
        window:Notify("Auto Quit Game", "Auto Quit Disabled", 3)
    end
end)

sections.Info:CreateDivider()

-- mj


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local workspace = game:GetService("Workspace")

local autoJoinEnabled = false
local joinConnection
local selectedMap = "Magic Forest"

-- 🔹 Find any descendant safely (by name)
local function deepFind(parent, name)
	for _, descendant in ipairs(parent:GetDescendants()) do
		if descendant.Name == name then
			return descendant
		end
	end
	return nil
end

-- 🔹 Smart path detection
local function getMatchmaking()
	local events = deepFind(ReplicatedStorage, "Events")
	local matchmaking = events and deepFind(events, "Matchmaking") or deepFind(ReplicatedStorage, "Matchmaking")
	local fireQueue = matchmaking and deepFind(matchmaking, "FireQueue")
	local mapSelect = matchmaking and deepFind(matchmaking, "MapSelected")

	-- Try to find queue spots even if nested differently
	local queueSpots = deepFind(workspace, "QueueSpots")
	local quickQueue = queueSpots and queueSpots:FindFirstChild("quickQueue")

	return fireQueue, mapSelect, quickQueue
end

-- 🔹 Dropdown for map selection
sections.Main:CreateDropdown(
	"Select Map",
	{"Magic Forest", "Dragon's Den", "Pyramid", "Peak", "Islands"},
	function(value)
		selectedMap = value
	end,
	"Magic Forest",
	false
)

-- 🔹 Toggle for Auto Join
sections.Main:CreateToggle("Auto Join Matchmaking", false, function(state)
	autoJoinEnabled = state

	if joinConnection then
		joinConnection:Disconnect()
		joinConnection = nil
	end

	if state then
		joinConnection = RunService.Heartbeat:Connect(function()
			pcall(function()
				local fireQueue, mapSelect, quickQueue = getMatchmaking()
				if not (fireQueue and mapSelect and quickQueue) then return end

				-- Fire queue
				fireQueue:FireServer(quickQueue, true)

				-- Wait a bit before selecting map to ensure join registers
				task.wait(0.2)
				mapSelect:FireServer(selectedMap, quickQueue)
			end)
		end)

		window:Notify("Auto Join Matchmaking", "Enabled (Dynamic Finder)", 3)
	else
		window:Notify("Auto Join Matchmaking", "Disabled", 3)
	end
end)


sections.Main:CreateToggle("Auto Game Start", false, function(state)
    if state then
        local Events = game:GetService("ReplicatedStorage").Events
        Events.Game.GameStart:FireServer()
        window:Notify("Auto Game Start", "Auto Game Start Enabled", 3)
    else
        window:Notify("Auto Game Start", "Auto Game Start Disabled", 3)
    end
end)

sections.Main:CreateToggle("Auto Play Again", false, function(state)
    if state then
        local Events = game:GetService("ReplicatedStorage").Events
        Events.Game.PlayAgain:FireServer()
        window:Notify("Auto Play Again", "Auto Play Again Enabled", 3)
    else
        window:Notify("Auto Play Again", "Auto Play Again Disabled", 3)
    end
end)

sections.Main:CreateDivider()

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Root = Character:WaitForChild("HumanoidRootPart")

local autoFarmEnabled = false
local autoCollectEnabled = false
local farmConn, collectConn

-- 🔹 Smooth Move (no instant teleport)
local function smoothMove(targetPos)
	local char = LocalPlayer.Character
	local root = char and char:FindFirstChild("HumanoidRootPart")
	if not root then return end

	local direction = (targetPos - root.Position)
	local distance = direction.Magnitude
	if distance < 1 then return end
	local step = direction.Unit * math.min(distance, 8)
	root.CFrame = CFrame.new(root.Position + step)
end

-- 🔹 Touch/Proximity collector
local function tryCollectGem(gem)
	local part = gem:IsA("BasePart") and gem or gem:FindFirstChildWhichIsA("BasePart")
	if not part then return end

	if part:FindFirstChild("TouchInterest") then
		firetouchinterest(Root, part, 0)
		firetouchinterest(Root, part, 1)
	else
		-- fallback: move close enough
		if (Root.Position - part.Position).Magnitude > 6 then
			smoothMove(part.Position)
		end
	end
end


local function getAllGems()
	local gems = {}
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("BasePart") and obj.Name == "Gem" then
			table.insert(gems, obj)
		end
	end
	return gems
end

-- 🔸 Auto Farm (touch)
sections.Main:CreateToggle("Auto Farm Gems", false, function(state)
	autoFarmEnabled = state
	if state then
		farmConn = RunService.Heartbeat:Connect(function()
			for _, gem in pairs(getAllGems()) do
				pcall(tryCollectGem, gem)
			end
		end)
		window:Notify("Auto Farm Gems", "Touch Mode Enabled", 3)
	else
		if farmConn then farmConn:Disconnect() end
		window:Notify("Auto Farm Gems", "Disabled", 3)
	end
end)

-- 🔸 Auto Collect (smart TP)
sections.Main:CreateToggle("Auto Collect Gems (TP)", false, function(state)
	autoCollectEnabled = state
	if state then
		collectConn = RunService.Heartbeat:Connect(function()
			local char = LocalPlayer.Character
			local root = char and char:FindFirstChild("HumanoidRootPart")
			if not root then return end

			for _, gem in pairs(getAllGems()) do
				pcall(function()
					root.CFrame = gem.CFrame + Vector3.new(0, 3, 0)
					task.wait(0.1)
				end)
			end
		end)
		window:Notify("Auto Collect Gems (TP)", "Smart TP Enabled", 3)
	else
		if collectConn then collectConn:Disconnect() end
		window:Notify("Auto Collect Gems (TP)", "Disabled", 3)
	end
end)

sections.Main:CreateToggle("Skip Wave", false, function(state)
    if state then
        local Events = game:GetService("ReplicatedStorage").Events
        Events.Game.SkipWave:FireServer(true)
        window:Notify("Skip Wave", "Skip Wave Enabled", 3)
    else
        window:Notify("Skip Wave", "Skip Wave Disabled", 3)
    end
end)

sections.Main:CreateToggle("Auto Skip Wave", false, function(state)
    if state then
        local Events = game:GetService("ReplicatedStorage").Events
        Events.Game.SkipCurrentRound:FireServer()
        window:Notify("Auto Skip Wave", "Auto Skip Wave Enabled", 3)
    else
        window:Notify("Auto Skip Wave", "Auto Skip Wave Disabled", 3)
    end
end)

sections.Main:CreateSlider(
    "Speed Gameplay (Wave)",
    1,
    100,
    2,
    false,
    function(value)
        local Player = game.Players.LocalPlayer
        local Events = game:GetService("ReplicatedStorage").Events
        Events.Game.SetSpeed:FireServer(tostring(value))
    end
)

local autoVoteEnabled = false
local selectedDifficulty = "Medium"

sections.Main:CreateDropdown(
    "Vote Difficulty",
    {"Medium", "Hard", "Impossible", "Diabolical"},
    function(value)
        selectedDifficulty = value
        if autoVoteEnabled then
            local Events = game:GetService("ReplicatedStorage").Events
            Events.Game.DifficultyVote:FireServer(selectedDifficulty)
        end
    end,
    "Medium",
    false
)

sections.Main:CreateToggle("Auto Vote", false, function(state)
    autoVoteEnabled = state
    if state then
        local Events = game:GetService("ReplicatedStorage").Events
        Events.Game.DifficultyVote:FireServer(selectedDifficulty)
        window:Notify("Auto Vote", "Auto Vote Enabled", 3)
    else
        window:Notify("Auto Vote", "Auto Vote Disabled", 3)
    end
end)

local autoBattlePassFarmEnabled = false
local battlePassConnection

sections.Main:CreateToggle("Auto Battle Pass Farm", false, function(state)
    autoBattlePassFarmEnabled = state
    
    if battlePassConnection then
        battlePassConnection:Disconnect()
        battlePassConnection = nil
    end

    if state then
        local Events = game:GetService("ReplicatedStorage").Events
        local Player = game.Players.LocalPlayer
        
        Player:SetAttribute("LevelS0", 50)
        Player:SetAttribute("OwnsS0", true)
        Player:SetAttribute("Pumpkins", 9999)
        
        battlePassConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for level = 1, 50 do
                Events.Data.BattlePass:FireServer(level, false)
                Events.Data.BattlePass:FireServer(level, true)
            end
        end)
        
        window:Notify("Auto Battle Pass Farm", "Auto Battle Pass Farm Enabled", 3)
    else
        window:Notify("Auto Battle Pass Farm", "Auto Battle Pass Farm Disabled", 3)
    end
end)


-- Gem Boost Toggle
sections.Main:CreateToggle("Gem Boost", false, function(state)
    if state then
        local Player = game.Players.LocalPlayer
        Player:SetAttribute("GemsBoost", 99999999)
        window:Notify("Gem Boost", "Gem Boost Enabled", 3)
    else
        local Player = game.Players.LocalPlayer
        Player:SetAttribute("GemsBoost", 1)
        window:Notify("Gem Boost", "Gem Boost Disabled", 3)
    end
end)

-- Get Passes Button
sections.Main:CreateButton("Get Passes", function()
    local Events = game:GetService("ReplicatedStorage").Events
    local Player = game.Players.LocalPlayer
    
    -- Gift all items
    Events.localEvents.Gift:FireServer(Player.Name, "VIP")
    Events.localEvents.Gift:FireServer(Player.Name, "Starter Bundle")
    Events.localEvents.Gift:FireServer(Player.Name, "3x Speed")
    Events.localEvents.Gift:FireServer(Player.Name, "0.5x Speed")
    Events.localEvents.Gift:FireServer(Player.Name, "+1 Unit")
    Events.localEvents.Gift:FireServer(Player.Name, "Tower Storage")
    
    -- Set attributes
    Player:SetAttribute("VIP", true)
    Player:SetAttribute("Owns_HalfSpeed", true)
    Player:SetAttribute("Owns_Speed", true)
    Player:SetAttribute("MaxUnits", 999)
    
    window:Notify("Get Passes", "All passes and VIP unlocked", 3)
end)


local spamReviveEnabled = false
local reviveConnection

sections.Main:CreateToggle("Spam Revive", false, function(state)
    spamReviveEnabled = state
    if state then
        local Player = game.Players.LocalPlayer
        Player:SetAttribute("Revives", 999)
        
        reviveConnection = game:GetService("RunService").Heartbeat:Connect(function()
            game.ReplicatedStorage.Events.localEvents.PromptProduct:FireServer("1st Revive")
        end)
        
        window:Notify("Buggy Toggle", "Spam Revive Enabled", 3)
    else
        if reviveConnection then
            reviveConnection:Disconnect()
        end
        window:Notify("Buggy Toggle", "Spam Revive Disabled", 3)
    end
end, "buggy", "this trigger to buy robux make sure you have robux......")


local autoFakeBossEnabled = false
local fakeBossConnection

sections.Main:CreateToggle("Auto Fake Boss", false, function(state)
    autoFakeBossEnabled = state
    if state then
        local Events = game:GetService("ReplicatedStorage").Events
        
        fakeBossConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local fakeBoss = {
                Name = "Ultimate Boss",
                GetAttribute = function(attr)
                    if attr == "HP" then return 0 end
                    if attr == "MaxHP" then return 1000000 end
                    if attr == "Class" then return "Boss" end
                end
            }
            
            Events.Game.BossSpawn:FireServer(fakeBoss)
        end)
        
        window:Notify("Buggy Toggle", "Auto Fake Boss Enabled", 3)
    else
        if fakeBossConnection then
            fakeBossConnection:Disconnect()
        end
        window:Notify("Buggy Toggle", "Auto Fake Boss Disabled", 3)
    end
end, "buggy", "This Is Useless Feature I included sorry")

local autoSpinEnabled = false
local spinConnection

-- Auto Spin Toggle
sections.Main:CreateToggle("Auto Spin", false, function(state)
    autoSpinEnabled = state
    if state then
        spinConnection = game:GetService("RunService").Heartbeat:Connect(function()
            game:GetService("ReplicatedStorage").Events.Interactions.WheelVisual:FireServer()
        end)
        window:Notify("Auto Spin", "Auto Spin Enabled", 3)
    else
        if spinConnection then
            spinConnection:Disconnect()
        end
        window:Notify("Auto Spin", "Auto Spin Disabled", 3)
    end
end)

sections.Main:CreateDivider()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local whitelistedRarities = {"Common"}
local autoLockConnection

sections.Main:CreateDropdown(
    "Whitelist Rarity",
    {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Hidden", "Unique"},
    function(selected)
        whitelistedRarities = {selected}
        print("Whitelist set to:", selected)
    end,
    "Common",
    true 
)

sections.Main:CreateToggle("Auto Lock Towers", false, function(state)
    if state then
        print("Auto Lock ON")

        autoLockConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local success, data = pcall(function()
                return ReplicatedStorage.Events.Data.GetDataLocal:InvokeServer(LocalPlayer)
            end)
            
            if success and data and data.Towers then
                for _, tower in pairs(data.Towers) do
                    local towerName = tower.Name
                    local towerInGame = ReplicatedStorage.Towers:FindFirstChild(towerName)
                    
                    if towerInGame then
                        local rarity = towerInGame:GetAttribute("Rarity")
                        if rarity and table.find(whitelistedRarities, rarity) and not tower.Locked then
                            print("Auto-locking:", towerName, "(Rarity:", rarity .. ")")
                            ReplicatedStorage.Events.Data.Lock:FireServer(tower)
                        end
                    end
                end
            end
        end)
    else
        print("Auto Lock OFF")
        if autoLockConnection then
            autoLockConnection:Disconnect()
            autoLockConnection = nil
        end
    end
end)

local autoEquipEnabled = false
local equipConnection

-- Auto Equip Best Tower Toggle
sections.Main:CreateToggle("Auto Equip Best Tower", false, function(state)
    autoEquipEnabled = state
    if state then
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local player = Players.LocalPlayer
        
        local function equipBestTowers()
            local equipEvent = ReplicatedStorage.Events.Data.Equip
            local data = ReplicatedStorage.Events.Data.GetDataLocal:InvokeServer(player)
            local TowerCalc = require(ReplicatedStorage.Modules.TowerCalc)
            
            local maxSlots = tonumber(data.Slots) or 1
            maxSlots = math.max(1, maxSlots)
            
            local towersWithScores = {}
            for _, tower in ipairs(data.Towers) do
                local score = TowerCalc:ReturnTowerValue(tower)
                table.insert(towersWithScores, {
                    tower = tower,
                    score = score
                })
            end
            
            table.sort(towersWithScores, function(a, b)
                return (a.score or 0) > (b.score or 0)
            end)
            
            for _, tower in ipairs(data.Towers) do
                if tower.Equipped then
                    equipEvent:FireServer(tower)
                end
            end
            
            local equippedTypes = {}
            local equippedCount = 0
            
            for _, item in ipairs(towersWithScores) do
                local tower = item.tower
                
                if equippedCount >= maxSlots then
                    break
                end
                
                if not equippedTypes[tower.Name] then
                    equipEvent:FireServer(tower)
                    equippedTypes[tower.Name] = true
                    equippedCount = equippedCount + 1
                end
            end
        end
        
        equipBestTowers()
        equipConnection = game:GetService("RunService").Heartbeat:Connect(equipBestTowers)
        
        window:Notify("Auto Equip Best Tower", "Auto Equip Best Tower Enabled", 3)
    else
        if equipConnection then
            equipConnection:Disconnect()
        end
        window:Notify("Auto Equip Best Tower", "Auto Equip Best Tower Disabled", 3)
    end
end)


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local blacklistedRarities = {"Common"}
local autoSellConnection

sections.Main:CreateDropdown(
    "Blacklist Rarity",
    {"Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Hidden", "Unique"},
    function(selected)
        blacklistedRarities = {selected}
        print("Blacklist set to:", selected)
    end,
    "Common",
    true 
)

sections.Main:CreateToggle("Auto Sell Towers", false, function(state)
    if state then
        print("Auto Sell ON")

        autoSellConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local success, data = pcall(function()
                return ReplicatedStorage.Events.Data.GetDataLocal:InvokeServer(LocalPlayer)
            end)
            
            if success and data and data.Towers then
                for _, tower in pairs(data.Towers) do
                    local towerName = tower.Name
                    local towerInGame = ReplicatedStorage.Towers:FindFirstChild(towerName)
                    
                    if towerInGame and not tower.Locked and not tower.Equipped then
                        local rarity = towerInGame:GetAttribute("Rarity")
                        if rarity and table.find(blacklistedRarities, rarity) then
                            print("Auto-selling:", towerName, "(Rarity:", rarity .. ")")
                            ReplicatedStorage.Events.Data.Sell:FireServer(tower.ID)
                        end
                    end
                end
            end
        end)
    else
        print("Auto Sell OFF")
        if autoSellConnection then
            autoSellConnection:Disconnect()
            autoSellConnection = nil
        end
    end
end)


local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")

local sellAllEnabled = false
local sellConnection

-- 🔹 Helper: safely get a descendant
local function deepFind(parent, name)
	for _, descendant in ipairs(parent:GetDescendants()) do
		if descendant.Name == name then
			return descendant
		end
	end
	return nil
end

sections.Main:CreateToggle("Auto Sell All Tower", false, function(state)
	sellAllEnabled = state

	-- Always disconnect old loop safely
	if sellConnection then
		sellConnection:Disconnect()
		sellConnection = nil
	end

	if state then
		sellConnection = RunService.Heartbeat:Connect(function()
			pcall(function()
				-- ✅ Find the Towers folder safely
				local towers = workspace:FindFirstChild("Towers")
				if not towers then return end

				-- ✅ Find the SellTower remote safely
				local events = ReplicatedStorage:FindFirstChild("Events")
				local towerEvent = events and events:FindFirstChild("Tower")
				local sellRemote = towerEvent and towerEvent:FindFirstChild("SellTower")

				if not sellRemote then return end

				-- ✅ Loop through all towers owned by the player
				for _, tower in pairs(towers:GetChildren()) do
					if tower:IsA("Model") or tower:IsA("BasePart") then
						sellRemote:FireServer(tower)
					end
				end
			end)
		end)

		window:Notify("Auto Sell All", "Auto Sell All Enabled (Safe Mode)", 3)
	else
		window:Notify("Auto Sell All", "Auto Sell All Disabled", 3)
	end
end)



local espEnabled = false
local espColor = Color3.fromRGB(255, 255, 255)
local espConnection
local espLabels = {}

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Create or update ESP label
local function updateESP(mob, distance, screenPoint)
    local label = espLabels[mob]

    if not label then
        label = Drawing.new("Text")
        label.Size = 13
        label.Center = true
        label.Outline = true
        label.OutlineColor = Color3.new(0, 0, 0)
        label.Visible = true
        espLabels[mob] = label
    end

    label.Color = espColor
    label.Text = mob.Name .. " [" .. math.floor(distance) .. " studs]"
    label.Position = Vector2.new(screenPoint.X, screenPoint.Y - 20)
end

-- Cleanup ESP labels
local function clearESP()
    for mob, label in pairs(espLabels) do
        if label then
            label:Remove()
        end
    end
    espLabels = {}
end

sections.Mob:CreateToggle("ESP Distance", false, function(state)
    espEnabled = state

    if state then
        espConnection = RunService.RenderStepped:Connect(function()
            local localChar = LocalPlayer.Character
            local localRoot = localChar and localChar:FindFirstChild("HumanoidRootPart")
            if not localRoot then return end

            -- Mark all for removal
            local activeMobs = {}

            for _, mob in pairs(workspace.Mobs:GetChildren()) do
                local rootPart = mob:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    local distance = (localRoot.Position - rootPart.Position).Magnitude
                    local screenPoint, onScreen = Camera:WorldToViewportPoint(rootPart.Position)

                    if onScreen then
                        activeMobs[mob] = true
                        updateESP(mob, distance, screenPoint)
                    end
                end
            end

            -- Remove ESPs for mobs no longer valid
            for mob, label in pairs(espLabels) do
                if not activeMobs[mob] then
                    label:Remove()
                    espLabels[mob] = nil
                end
            end
        end)

        window:Notify("ESP Distance", "ESP Distance Enabled", 3)
    else
        if espConnection then
            espConnection:Disconnect()
            espConnection = nil
        end
        clearESP()
        window:Notify("ESP Distance", "ESP Distance Disabled", 3)
    end
end)

-- ESP Color Picker
sections.Mob:CreateColorpicker("ESP Color", function(color)
    espColor = color
    for _, label in pairs(espLabels) do
        if label then
            label.Color = color
        end
    end
end)


-- Teleport to Code Button
sections.Teleport:CreateButton("Teleport to Code", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(105.427902, 3.58985829, -175.203125, 0.482574612, -4.25777813e-08, -0.87585485, 4.65028336e-08, 1, -2.29909052e-08, 0.87585485, -2.96349043e-08, 0.482574612)
        window:Notify("Teleport", "Teleported to Code", 3)
    end
end)

-- Teleport to Shop Button
sections.Teleport:CreateButton("Teleport to Shop", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(36.3761482, 6.02107477, -202.174301, 0.187250122, 3.69586779e-08, 0.982312262, -7.15376591e-10, 1, -3.74877942e-08, -0.982312262, 6.31687103e-09, 0.187250122)
        window:Notify("Teleport", "Teleported to Shop", 3)
    end
end)

sections.Teleport:CreateButton("Teleport to Upgrade", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(141.495926, 6.02107477, -203.569748, -0.18797259, 7.07450027e-08, -0.982174277, 1.05132436e-08, 1, 7.00169025e-08, 0.982174277, 2.83542145e-09, -0.18797259)
        window:Notify("Teleport", "Teleported to Upgrade", 3)
    end
end)


sections.Teleport:CreateButton("Teleport to Endless", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(-11.8595963, 6.02107477, -150.985535, -0.0812038705, -6.05182926e-09, 0.996697485, -1.70126011e-10, 1, 6.0580212e-09, -0.996697485, 3.22370602e-10, -0.0812038705)
        window:Notify("Teleport", "Teleported to Endless", 3)
    end
end)


sections.Teleport:CreateButton("Teleport to Freeward", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(67.1358109, 3.58985829, -133.487305, -0.984808743, 2.52378349e-08, 0.173642516, 2.75284631e-08, 1, 1.07832872e-08, -0.173642516, 1.53995874e-08, -0.984808743)
        window:Notify("Teleport", "Teleported to Freereward", 3)
    end
end)

-- Teleport to Trading Button
sections.Teleport:CreateButton("Teleport to Afk Zone", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(127.094971, 3.58985829, -162.037903, 0.778486013, 6.34224762e-08, -0.627661943, 4.51428139e-09, 1, 1.06644642e-07, 0.627661943, -8.58548077e-08, 0.778486013)
        
        for i = 1, 6 do
            local prompt = workspace.Lobby.Interact.Trading.LightCore.ProximityPrompt
            if prompt then
                fireproximityprompt(prompt)
            end
            wait(0.1)
        end
        
        window:Notify("Teleport", "Teleported to reroll Afk Zone", 3)
    end
end)

-- Teleport to Reroll Stats Button
sections.Teleport:CreateButton("Teleport to Trading", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        root.CFrame = CFrame.new(142.275925, 3.58985806, -164.675339, 0.316785812, 4.96844272e-08, -0.948497117, -8.44966674e-09, 1, 4.95601853e-08, 0.948497117, -7.68547803e-09, 0.316785812)
        window:Notify("Teleport", "Teleported to Trading", 3)
    end
end)

sections.Player:CreateToggle("Anti AFK", true, function(state)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local vu = game:GetService("VirtualUser")

    if state and not _G.AntiAfkConnection then
        _G.AntiAfkConnection = LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        _G.AntiAfkHeartbeat = task.spawn(function()
            while _G.AntiAfkConnection do
                vu:CaptureController()
                vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(60)
            end
        end)
    elseif not state and _G.AntiAfkConnection then
        _G.AntiAfkConnection:Disconnect()
        _G.AntiAfkConnection = nil
        if _G.AntiAfkHeartbeat then
            task.cancel(_G.AntiAfkHeartbeat)
            _G.AntiAfkHeartbeat = nil
        end
    end
end)

sections.Player:CreateToggle("Auto Walk", false, function(state)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local AutoWalkEnabled = state
    local WalkSpeed = 20

    local function startAutoWalk()
        task.spawn(function()
            while AutoWalkEnabled do
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if humanoid and hrp then
                        humanoid.WalkSpeed = WalkSpeed
                        local forwardVector = hrp.CFrame.LookVector
                        hrp.CFrame = hrp.CFrame + forwardVector * 2
                    end
                end
                task.wait(0.1)
            end
        end)
    end

    if state then
        startAutoWalk()
    else
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
            end
        end
    end
end)

sections.Player:CreateToggle("Anti Idle", true, function(state)
    local VirtualUser = game:GetService("VirtualUser")
    local AntiIdleEnabled = state

    local function startAntiIdle()
        task.spawn(function()
            while AntiIdleEnabled do
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
                task.wait(30)
            end
        end)
    end

    if state then
        startAntiIdle()
    end
end)

sections.Player:CreateToggle("Infinite Jump", true, function(state)
    if state and not _G.JumpConnection then
        _G.JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            local lp = game:GetService("Players").LocalPlayer
            if lp.Character then
                local hum = lp.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum:ChangeState("Jumping")
                end
            end
        end)
    elseif not state and _G.JumpConnection then
        _G.JumpConnection:Disconnect()
        _G.JumpConnection = nil
    end
end)

sections.Player:CreateToggle("Noclip", true, function(state)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    if state and not _G.NoclipConnection then
        _G.NoclipConnection = RunService.Stepped:Connect(function()
            if lp.Character then
                for _, part in pairs(lp.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    elseif not state and _G.NoclipConnection then
        _G.NoclipConnection:Disconnect()
        _G.NoclipConnection = nil
    end
end)

sections.Player:CreateSlider(
    "Walk Speed",
    16,
    200,
    16,
    true,
    function(value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character then
            local hum = lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = value end
        end
    end
)

sections.Player:CreateSlider(
    "Gravity Delay",
    1,
    5,
    1,
    true,
    function(value)
        workspace.Gravity = 196.2 * value
    end
)

sections.Player:CreateSlider(
    "Jump Power",
    50,
    200,
    50,
    true,
    function(value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
            lp.Character.Humanoid.JumpPower = value
        end
    end
)

sections.Player:CreateSlider(
    "Field of View",
    70,
    120,
    70,
    true,
    function(value)
        workspace.CurrentCamera.FieldOfView = value
    end
)


local savedPosition = nil

-- Save Position Button
sections.Player:CreateButton("Save Position", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        savedPosition = root.CFrame
        window:Notify("Save Position", "Position Saved", 3)
    end
end)

-- Load Position Button
sections.Player:CreateButton("Load Position", function()
    if savedPosition then
        local char = game.Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = savedPosition
            window:Notify("Load Position", "Position Loaded", 3)
        end
    else
        window:Notify("Load Position", "No Position Saved", 3)
    end
end)


sections.Player:CreateLabel("This script modifies your local player's properties and functions.\nIt only affects YOUR character and doesn't impact other players.\n\nWhat LocalPlayer controls:\n• Your character's movement speed and jumping\n• Your camera field of view\n• Your anti-afk status\n• Your noclip collision\n• Your gravity settings\n\nAll changes are client-side only and temporary.")

local autoUpgradeEnabled = false
local upgradeConnection
local upgradeDelay = 0.3

sections.Upgrade:CreateSlider(
    "Upgrade Delay",
    0.01,
    10,
    0.3,
    false,
    function(value)
        upgradeDelay = value
    end
)

sections.Upgrade:CreateToggle("Auto Upgrade All Towers", false, function(state)
    autoUpgradeEnabled = state
    if upgradeConnection then
        upgradeConnection:Disconnect()
        upgradeConnection = nil
    end
    
    if state then
        upgradeConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for _, tower in pairs(workspace.Towers:GetChildren()) do
                local args = {
                    [1] = tower
                }
                game:GetService("ReplicatedStorage").Events.Tower.UpgradeTower:FireServer(unpack(args))
            end
            wait(upgradeDelay)
        end)
        
        window:Notify("Auto Upgrade All Towers", "Auto Upgrade All Towers Enabled", 3)
    else
        window:Notify("Auto Upgrade All Towers", "Auto Upgrade All Towers Disabled", 3)
    end
end)

sections.Upgrade:CreateDivider()

local autoBuyEnabled = false
local autoBuyAllEnabled = false
local buyConnection
local selectedItems = {}

sections.Upgrade:CreateDropdown(
    "Select Items to Buy",
    {"1","10"},
    function(selected)
        selectedItems[selected] = true
    end,
    "1",
    true
)

sections.Upgrade:CreateToggle("Auto Buy Selected", false, function(state)
    autoBuyEnabled = state
    if buyConnection then
        buyConnection:Disconnect()
        buyConnection = nil
    end
    
    if state then
        buyConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for item, _ in pairs(selectedItems) do
                local args = {
                    [1] = "Classic",
                    [2] = tonumber(item)
                }
                game:GetService("ReplicatedStorage").Events.Data.Buy:InvokeServer(unpack(args))
            end
        end)
        window:Notify("Auto Buy Selected", "Auto Buy Selected Enabled", 3)
    else
        window:Notify("Auto Buy Selected", "Auto Buy Selected Disabled", 3)
    end
end)

sections.Upgrade:CreateToggle("Auto Buy All", false, function(state)
    autoBuyAllEnabled = state
    if buyConnection then
        buyConnection:Disconnect()
        buyConnection = nil
    end
    
    if state then
        buyConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for i = 1, 10 do
                local args = {
                    [1] = "Classic",
                    [2] = i
                }
                game:GetService("ReplicatedStorage").Events.Data.Buy:InvokeServer(unpack(args))
            end
        end)
        window:Notify("Auto Buy All", "Auto Buy All Enabled", 3)
    else
        window:Notify("Auto Buy All", "Auto Buy All Disabled", 3)
    end
end)

sections.Game:CreateButton("Rejoin Game", function()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    TeleportService:Teleport(game.PlaceId, player)
end)

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ServerID = ""

sections.Game:CreateTextBox("Server ID", "Enter server ID here", true, function(text)
    ServerID = text
end)

sections.Game:CreateToggle("Auto Join Server", false, function(state)
    if state then
        window:Notify("Auto Join", "Enabled - Joining server ID: "..ServerID, 4)
        if ServerID ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerID, LocalPlayer)
        else
            window:Notify("Auto Join", "No Server ID entered!", 4)
        end
    else
        window:Notify("Auto Join", "Disabled", 4)
    end
end)


sections.Discord:CreateButton("Join Discord", function()
    setclipboard("https://discord.gg/6vrw6tzex")
    window:Notify("Discord", "Link copied to clipboard!\nPaste in your browser to join: discord.gg/6vrw6tzex", 7)
end)


sections.Discord:CreateLabel("💬 Join our Discord community!\nGet script updates, new features, and support directly from the devs.")


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local watermark = library:Hud()

local lastUpdate = 0
local fps = 0

RunService.RenderStepped:Connect(function(dt)
    lastUpdate += 1
    if lastUpdate >= 10 then
        fps = math.floor(1 / dt)
        lastUpdate = 0
    end

    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    local time = os.date("%Y-%m-%d %H:%M:%S", os.time())

    watermark:SetText(
        string.format("%s | FPS: %d | Ping: %dms | %s", LocalPlayer.Name, fps, ping, time)
    )
end)


local config_manager = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/ConfigManager.lua"))()
config_manager:SetLibrary(library)
config_manager:SetWindow(window)
config_manager:SetFolder("Examnple Name") -- name for folder where configs will be stored
config_manager:BuildConfigSection(tabs.settings)
config_manager:LoadAutoloadConfig()
window:SetBackground("114178849342027") -- if you turned on assets set the background id here
window:SetTileOffset(100)
window:SetTileScale(0.5) -- on how large background asset should be
window:SetBackgroundColor(Color3.fromRGB(40, 40, 40))
window:SetBackgroundTransparency(0.5) -- on how transparent background should be for asset
