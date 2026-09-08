--[[
    ventureAI 
    
    by saucekid (https://discord.gg/eX5k7TKN4F)
    
    CREDITS:
    - sukaretto#8874 (https://discord.gg/PFuQMWMhQQ)
    - ObscureScapter (https://v3rmillion.net/member.php?action=profile&uid=387561)
--]]

_G.safemode = _G.safemode or true
repeat wait() until game:IsLoaded()
if executed_ then
    noti.full({ Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Warning",
        Description = "You have already executed this script once", MessageBoxIcon = "Warning", MessageBoxButtons = "OK" })
    return;
end

-- compatability.
if not getgenv then
    _G.getgenv = function()
        return _G
    end
end
if not syn then
    getgenv().syn = {
        request = function(t)
            return http_request(t)
        end,
        protect_gui = function(object) end
    }
    getgenv().isfile = function(t)
        return pcall(function()
            readfile(t)
        end)
    end
    getgenv().delfile = function() end
end


-- { variables.
local game = game;
local httpGet = game.HttpGet;

local quick = loadstring(httpGet(game, 'https://raw.githubusercontent.com/Belkworks/quick/master/init.lua'))();
local broom = loadstring(httpGet(game, 'https://raw.githubusercontent.com/Belkworks/broom/master/init.lua'))();
local pathing = loadstring(httpGet(game, 'https://pastebin.com/raw/9H6fukVH'))();
pathing.Visualize = true;

_G.Config = { ["Theme"] = "dark" }
getgenv().noti = {
    full = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/main/source.lua"))().Show,
    normal = function(...) loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/saucekid/UI-Libraries/main/NordNotify.lua", true))():Notify(...) end
}

-- services.
local s = quick.Service;
local workspace = s.Workspace;
local replicatedStorage = s.ReplicatedStorage;
local runService = s.RunService;

-- indexing.
local cf, v3 = CFrame.new, Vector3.new;

local findFirstChild, findFirstChildOfClass, waitForChild = game.FindFirstChild, game.FindFirstChildOfClass,
    game.WaitForChild;
local getChildren, getPartsByRadius = game.GetChildren, workspace.GetPartBoundsInRadius;

local create, destroy = Instance.new, game.Destroy;
local fire, fireServer = create 'BindableEvent'.Fire, create 'RemoteEvent'.FireServer;

local string_find = string.find;
local string_format = string.format;

local jsonE, jsonD = function(o) return game.HttpService:JSONEncode(o) end,
    function(o) return game.HttpService:JSONDecode(o) end

local c = game.Loaded;
local connect, cwait = c.Connect, c.Wait;
local render, step, heartBeat = runService.RenderStepped, runService.Stepped, runService.Heartbeat;

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

-- client.
local client = quick.User;
local character = client.Character or cwait(client.CharacterAdded);
local root = waitForChild(character, 'HumanoidRootPart');
local gyro = waitForChild(root, 'BodyGyro')
local humanoid = waitForChild(character, 'Humanoid');

local distanceFromCharacter = client.DistanceFromCharacter;
local characterPathing = pathing.new(character,
    { AgentRadius = 3, AgentHeight = 4, AgentCanJump = true, WaypointSpacing = 8.2 }, {
        Costs = {
            Water = math.huge,
            Neon = math.huge
        }
    }, {
    TIME_VARIANCE = 0.001,
    COMPARISON_CHECKS = 2,
    JUMP_WHEN_STUCK = true
});

for i, v in pairs(getconnections(client.Idled)) do
    v:Disable()
end

if game.PlaceVersion > 991 then 
    noti.full({ Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Warning",
    Description = "Game version has changed since latest update \n Continue?", MessageBoxIcon = "Warning", MessageBoxButtons = "YesNo",
        Result = function(res)
        if (res == "Yes") then
            confirm = true
        end
    end})
    repeat task.wait() until confirm 
end
getgenv().executed_ = true

-- things.
local map = workspace.Map;
local quests = client.PlayerGui.Quests.QuestFrame.Quests
local projectiles = workspace.Projectiles;
local rangeIndicators = workspace.RangeIndicators
local IPDFunctions = require(replicatedStorage.Modules.IPDFunctions)
local clientEquipped = client.stats.Equipped;

-- remotes&attacking.
local remotes = replicatedStorage.Remotes;
local action = remotes.Action;

local attackRemotes = {
    Melee = action.MeleeAttack,
    Magic = action.MagicAttack,
    Bow = action.BowAttack
}
local useAbility = action.ActivateAbility;
local dungeonVoting = remotes.UI.EndDungeon.EndOfDungeonVote;

-- weapon calculation.
local Weapons = {
    [1] = { hitDelay = 1.2, range = 110 },
    [2] = { hitDelay = 1.2, range = 100 },

    Types = {
        Melee = {
            "Hammer",
            "Dagger",
            "Axe",
            "Spear",
            "Sword",
            "Rapier",
            "Polearm",
            "Greatsword",
            "Katana",
            "TowerShield"
        },
        Bow   = {
            "Bow",
            "Crossbow",
            "Rifle"
        },
        Magic = {
            "Staff",
            "Wand",
            "Book",
        }
    }
}
do
    function Weapons.getWeaponCooldown(weapon, weaponData)
        local Tags = findFirstChild(weaponData, "Tags");
        local attackBoost = IPDFunctions:GetBoostValue(character, "AttackSpeedBoost");

        if Tags then
            for q, c in next, getChildren(Tags) do
                attackBoost = attackBoost + IPDFunctions:GetBoostValue(character, c.Name .. "AttackSpeedBoost")
            end
        end

        return findFirstChild(weaponData, "NoAttack") and 1.2 or
            1 /
            (
            weaponData.AttackSpeed.Value * 1.03 ^ (weapon.Rarity.Value - weaponData.BaseRarity.Value) *
                (1 + attackBoost / 100))
    end

    function Weapons.calculate(weapon)
        local weaponType = weapon.ItemType.Value;
        local weaponIndex = weapon.Name:gsub("Wep", "")

        local weaponTypeFolder = replicatedStorage.ItemData[weaponType];
        local weaponData = quick.find(getChildren(weaponTypeFolder), function(w) return w.Name == weapon.ItemID.Value end);

        local attackType
        for i, class in pairs(Weapons.Types) do
            if table.find(class, weaponType) then
                attackType = i
            end
        end

        local equippedWeapon = Weapons[tonumber(weaponIndex)]
        local otherWeapon = tonumber(weaponIndex) == 1 and Weapons[2] or Weapons[1]
        if weaponData and attackType then
            equippedWeapon.Type = attackType
            equippedWeapon.weapon = weapon
            equippedWeapon.data = weaponData
            equippedWeapon.remote = attackRemotes[attackType]
            equippedWeapon.range = findFirstChild(weaponData, "Range") and weaponData.Range.Value or equippedWeapon.range;
            equippedWeapon.Ranged = (attackType == "Magic" or attackType == "Bow") and true or false;

            if not otherWeapon.remote then
                for i, v in pairs(equippedWeapon) do
                    otherWeapon[i] = v
                end
            end
        else
            equippedWeapon.remote = nil
        end
    end

    local function weaponChanged(w)
        Weapons.calculate(w);
        connect(w.ItemID.Changed, function() Weapons.calculate(w) end);
    end

    quick.each(getChildren(clientEquipped), function(v) if string_find(v.Name, 'Wep') then weaponChanged(v) end end);
    connect(clientEquipped.ChildAdded, function(v)
        if string_find(v.Name, 'Wep') then
            weaponChanged(v);
        end
    end);
end

-- classes.
local hostile = ({ params = (function()
    local _ = OverlapParams.new()
    _.FilterDescendantsInstances = { workspace.NPCS }
    _.FilterType = Enum.RaycastFilterType.Whitelist;

    return _;
end)(), filtered = {
    ['GoblinBashWatermelon'] = true
} });
do
    function hostile:group(wep)
        local parts = quick.map(getPartsByRadius(workspace, root.Position, Weapons[wep].range, self.params),
            function(p)
                return p.Parent;
            end);

        return quick.uniq(quick.filter(parts,
            function(p) return not self.filtered[p.Name] and p.Parent == workspace.NPCS end));
    end

    hostile.partBlacklist = { workspace.NPCS, workspace.DeadNPCS, workspace.NextNPCS, workspace.Projectiles,
        damageIndicators, findFirstChild(workspace, "Local"), workspace.Map:FindFirstChild("Throne"), client.Character }
    function hostile:behindWall(hostile)
        local fromPart = findFirstChild(character, "Wep1") or root
        local CF = CFrame.new(hostile.HumanoidRootPart.Position, fromPart:GetPivot().p);
        local _ = RaycastParams.new();
        _.IgnoreWater = true
        _.FilterDescendantsInstances = self.partBlacklist;
        _.FilterType = Enum.RaycastFilterType.Blacklist;

        local hit = workspace:Raycast(CF.p, CF.LookVector * (hostile.HumanoidRootPart.Position - root.Position).magnitude
            , _)
        if hit and
            (
            (hit.Instance.Transparency >= .3 or hit.Instance.Parent == client.Character) and
                hit.Instance.ClassName ~= "Terrain") and not table.find(self.partBlacklist, hit.Instance) then
            table.insert(self.partBlacklist, hit.Instance)
        end
        return hit
    end

    local lastHostile
    function hostile:nearest()
        local nearestVis = { behindWall = false, distance = math.huge }
        local nearest = { behindWall = true, distance = math.huge }

        for _, v in next, getChildren(workspace.NPCS) do
            if self.filtered[v.Name] or (not findFirstChild(v, 'HumanoidRootPart')) then continue end
            local wall = self:behindWall(v)
            local magnitude = distanceFromCharacter(client, v.HumanoidRootPart.Position);
            if wall then
                if magnitude < nearest.distance then
                    nearest.instance = v
                    nearest.distance = magnitude
                end
            else
                if magnitude < nearestVis.distance then
                    nearestVis.instance = v
                    nearestVis.distance = magnitude
                end
            end
        end

        local selected = nearestVis.instance and nearestVis or nearest
        if lastHostile and lastHostile.instance and findFirstChild(lastHostile.instance, "Humanoid") and
            lastHostile.instance.Humanoid.Health > 0 and selected.instance ~= lastHostile.instance and
            selected.instance ~= replicatedStorage.ControlSettings.CurrentBoss.Value and
            selected.distance > Weapons[1].range and selected.distance > lastHostile.distance then
            return lastHostile.instance, lastHostile.distance, lastHostile.behindWall; -- fuck you
        end
        lastHostile = { instance = selected.instance, distance = selected.distance, behindWall = selected.behindWall }

        return selected.instance, selected.distance, selected.behindWall;
    end
end


local ability = {}
do
    ability.items = {}
    ability.wrapper = {
        ["1"] = 3,
        ["2"] = 4,
        ["3"] = 5,
        ["4"] = 6
    }
    function ability.register(item)
        local itemType = item.ItemType.Value;
        local itemIndex = item.Name:gsub("Item", "")

        local itemTypeFolder = replicatedStorage.ItemData[itemType];
        local itemData = quick.find(getChildren(itemTypeFolder), function(i) return i.Name == item.ItemID.Value end);

        if itemType == "Spell" or item.ItemID.Value:find("Potion") then
            local abilityType = item.ItemID.Value:find("Roll") and "Roll" or
                item.ItemID.Value:find("Potion") and "Potion" or "Spell"
            local abilityData = replicatedStorage.AbilityData:FindFirstChild(itemData.DisplayName.Value)

            ability.items[tonumber(itemIndex)] = {
                Type = abilityType,
                remote = ability.wrapper[itemIndex],
                potion = (abilityType == "Potion" and item.ItemID.Value:find("Heal")) and "Heal" or
                    (abilityType == "Potion" and item.ItemID.Value:find("Mana")) and "Mana" or false,
                mana = abilityData and abilityData.ManaCost.Value
            }
        else
            ability.items[tonumber(itemIndex)] = nil
        end
    end

    function ability.cooldown(a)
        local attributes = findFirstChild(character, 'Attributes');
        return attributes and findFirstChild(attributes.Value, 'Cooldowns') and
            findFirstChild((attributes.Value).Cooldowns, string_format('Wep%dAbilityCD', a)) ~= nil;
    end

    function ability.getMana()
        local mana = findFirstChild(character, 'Mana')
        if not mana then return end
        return mana.Value, mana and mana.Max.Value
    end

    function ability:use(a)
        if (not self.cooldown(a)) then
            task.spawn(fireServer, useAbility, a);
            return true;
        end
        return false;
    end

    function ability:getAbility(itemType)
        local abilities = {}
        for _, item in pairs(self.items) do
            if item.Type == itemType then
                table.insert(abilities, item)
            end
        end
        return abilities
    end

    -- potion
    function ability.potion()
        local potions = ability:getAbility("Potion")
        local mana, maxMana = ability.getMana()
        if potions then
            for _, potion in pairs(potions) do
                if potion.potion == "Heal" and humanoid.Health <= humanoid.MaxHealth / 2 then
                    return ability:use(potion.remote)
                elseif potion.potion == "Mana" and mana <= maxMana / 2 then
                    return ability:use(potion.remote)
                end
            end
        end
    end

    -- spells
    function ability:castSpells()
        local spells = self:getAbility("Spell")
        local mana, maxMana = ability.getMana()
        if spells then
            for _, spell in pairs(spells) do
                if mana >= spell.mana then
                    local success = ability:use(spell.remote)
                end
            end
        end
    end

    -- roll
    function ability.canRoll()
        local rolls = ability:getAbility("Roll")
        if rolls then
            for _, roll in pairs(rolls) do
                return not ability.cooldown(roll.remote)
            end
        end
        return false
    end

    function ability.roll()
        local rolls = ability:getAbility("Roll")
        if rolls then
            for _, roll in pairs(rolls) do
                local success = ability:use(roll.remote)
            end
        end
    end

    -- dash
    function ability.dash()
        return ability:use(999)
    end

    function ability.canDash()
        return not ability.cooldown(999)
    end

    local function itemChanged(w)
        ability.register(w);
        connect(w.ItemID.Changed, function() ability.register(w) end);
    end

    quick.each(getChildren(clientEquipped), function(v) if string_find(v.Name, 'Item') then itemChanged(v) end end);
    connect(clientEquipped.ChildAdded, function(v)
        if string_find(v.Name, 'Item') then
            itemChanged(v);
        end
    end);
end

local function attack(group, wep)
    local targetMap = #group > 0 and quick.map(group, function(v)
        return { TargetCharacter = v,
            KnockbackDirection = cf(v3(root.Position.X, v.HumanoidRootPart.Position.Y, root.Position.Z),
                v.HumanoidRootPart.Position).LookVector }
    end);

    if not targetMap then return end

    local w = Weapons[wep]
    if w and w.remote then
        w.remote:FireServer(wep, { Targets = targetMap })
        ability:use(wep);
    end
end

-- ESP
local ESP = {}
do
    function ESP:Create(base, name, trackername, studs, color)
        local bb = Instance.new('BillboardGui', game.CoreGui)
        bb.Adornee = base
        bb.ExtentsOffset = Vector3.new(0, 1, 0)
        bb.AlwaysOnTop = true
        bb.Size = UDim2.new(0, 6, 0, 6)
        bb.StudsOffset = Vector3.new(0, 1, 0)
        bb.Name = trackername

        local frame = Instance.new('Frame', bb)
        frame.ZIndex = 10
        frame.BackgroundTransparency = 0.3
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = color or Color3.fromRGB(255, 0, 0)

        local txtlbl = Instance.new('TextLabel', bb)
        txtlbl.ZIndex = 10
        txtlbl.BackgroundTransparency = 1
        txtlbl.Position = UDim2.new(0, 0, 0, -48)
        txtlbl.Size = UDim2.new(1, 0, 10, 0)
        txtlbl.Font = 'ArialBold'
        txtlbl.FontSize = 'Size12'
        txtlbl.Text = name
        txtlbl.TextStrokeTransparency = 0.5
        txtlbl.TextColor3 = color or Color3.fromRGB(255, 0, 0)

        local txtlblstud = Instance.new('TextLabel', bb)
        txtlblstud.ZIndex = 10
        txtlblstud.BackgroundTransparency = 1
        txtlblstud.Position = UDim2.new(0, 0, 0, -35)
        txtlblstud.Size = UDim2.new(1, 0, 10, 0)
        txtlblstud.Font = 'ArialBold'
        txtlblstud.FontSize = 'Size12'
        txtlblstud.Text = tostring(studs) .. " Studs"
        txtlblstud.TextStrokeTransparency = 0.5
        txtlblstud.TextColor3 = Color3.new(255, 255, 255)
    end

    function ESP:Clear(espname)
        for _, v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == espname and v:isA('BillboardGui') then
                v:Destroy()
            end
        end
    end
end

function claimQuests()
    for i, quest in pairs(quests:GetDescendants()) do
        if findFirstChild(quest, "Frame") then
            quest = findFirstChild(client.stats.Quests, quest.Name)
            if findFirstChild(quest, "C") then
                remotes.UI.Quests.ClaimRewards:FireServer(quest.Name);
                local rewards = ""
                do
                    for i, v in pairs(quest.Rewards:GetChildren()) do
                        rewards = rewards .. v.Name .. ": " .. tostring(v.Value) .. "                   \n"
                    end
                end
                noti.normal(quest.Title.Value, rewards, "success", 10)
            end
        end
    end
end

loadstring(game:HttpGet("https://pastebin.com/raw/tUUGAeaH", true))()

-- file system.
local folderpath = [[ventureAI/]]

if makefolder then
    makefolder("ventureAI")
end

local function existsFile(name)
    if not readfile then return end
    return pcall(function()
        return readfile(folderpath .. name)
    end)
end

function load(name, settings)
    if not existsFile(name) then return end
    local _, Result = pcall(readfile, folderpath .. name);
    if _ then
        local _, Loaded = pcall(game.HttpService.JSONDecode, game.HttpService, Result);
        if _ then
            for i, v in pairs(Loaded) do
                settings[i] = v;
                pcall(settings[i], v);
            end
        end
    end
end

function save(table, name)
    if writefile then
        writefile(folderpath .. name, jsonE(table));
    end
end

-- flags.
local autoDungeon, ignore = create 'BindableEvent';

local flags = {
    pathFind = true,
    speed = false,
    speedInt = 20,
    killAura = true,
    damage = false,
    damageInt = 5,
    autoDungeon = false,
    autoPotion = true,
    autoDodge = true,
    autoSpell = true,
    anims = false,
    dashWarp = true,
    jumping = true,
    gateTeleport = true,
    keepDistance = false,
    distanceAway = 30,
    visualize = false,
    autoExec = true
};
load("dungeon.json", flags)


-- auto execute.
connect(client.OnTeleport, function(State)
    if State == Enum.TeleportState.Started and syn and flags.autoExec then
        queueteleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/saucekid/scripts/main/Venture%20Tale/ventureAI.lua"))()]])
    end
end)


-- lib.
local lib = loadstring(httpGet(game, 'https://raw.githubusercontent.com/saucekid/UI-Libraries/main/compact.lua'))().init("ventureAI"
    , "v2.1.0", 1, UDim2.new(0.2, 0, 0.2, 0), UDim2.new(0, 600, 0, 300));
do
    if game.PlaceId == 4809447488 then
        flags = {
            selectedDungeon = "Goblin Cave",
            selectedDifficulty = "Easy",
            hardCore = false,
            endless = false,
            heroic = false,
            autoStart = false,
            autoExec = true
        };
        load("lobby.json", flags)

        local dungeons, realDungeons, difficulties =
        { "Goblin Cave", "Enchanted Forest", "Bandit Castle" },
            {
                ["Goblin Cave"] = "GoblinCave",
                ["Enchanted Forest"] = "EnchantedForest",
                ["Bandit Castle"] = "BanditCastle",
            },
            { "Easy", "Normal", "Hard", "Raid"}

        local dungeonTab, miscTab = lib:AddTab("Lobby", "Join/create dungeons");
        do
            dungeonTab:AddSeperator("Dungeons")
            dungeonTab:AddButton({
                title = 'Start Solo',
                desc = "Starts the selected solo dungeon",
                callback = function()
                    noti.normal("Solo Dungeon", string_format("Starting %s %s lobby", flags.selectedDifficulty, flags.selectedDungeon), "success", 5)
                    remotes.UI.Lobby.StartLobby:FireServer(realDungeons[flags.selectedDungeon], flags.selectedDifficulty, {
                        ["EnemyLevel"] = 0,
                        ["MaximumLevel"] = "",
                        ["Heroic"] = flags.heroic,
                        ["MinimumLevel"] = "",
                        ["Endless"] = flags.endless,
                        ["EnemyDamageReduction"] = 0,
                        ["EnemyHealth"] = 0,
                        ["EnemyDamage"] = 0,
                        ["Hardcore"] = flags.hardCore,
                        ["FriendsOnly"] = false
                    }, "Solo")
                end
            });

            dungeonTab:AddButton({
                title = 'Create Lobby',
                desc = "Creates a lobby for the selected dungeon",
                callback = function()
                    noti.full({ Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Confirmation",
                        Description = string_format("Create a %s %s lobby?", flags.selectedDifficulty,
                            flags.selectedDungeon), MessageBoxIcon = "Question", MessageBoxButtons = "YesNo",
                        Result = function(res)
                            if (res == "Yes") then
                                remotes.UI.Lobby.CreateLobby:FireServer(realDungeons[flags.selectedDungeon], flags.selectedDifficulty, {   
                                    ["EnemyLevel"] = 0,
                                    ["MaximumLevel"] = "",
                                    ["Heroic"] = flags.heroic,
                                    ["MinimumLevel"] = "",
                                    ["Endless"] = flags.endless,
                                    ["EnemyDamageReduction"] = 0,
                                    ["EnemyHealth"] = 0,
                                    ["EnemyDamage"] = 0,
                                    ["Hardcore"] = flags.hardCore,
                                    ["FriendsOnly"] = false 
                                })
                            end
                        end 
                    })
                end
            })


            dungeonTab:AddToggle({
                title = 'Auto Start',
                desc = 'Automatically starts selected dungeon with a countdown',
                checked = flags.autoStart,
                callback = function(state)
                    flags.autoStart = state
                    coroutine.wrap(function()
                        local countDown
                        for i = 5, 1, -1 do
                            if countDown then countDown:Remove() end
                            if not flags.autoStart then return end
                            countDown = Drawing.new("Text")
                            countDown.Text = tostring(i)
                            countDown.Color = Color3.new(1, 1, 1)
                            countDown.Outline = true
                            countDown.OutlineColor = Color3.new(0, 0, 0)
                            countDown.Size = 50
                            countDown.Center = true
                            countDown.Visible = true
                            countDown.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2,
                                workspace.CurrentCamera.ViewportSize.Y / 2 - (game.GuiService:GetGuiInset().Y / 2))
                            wait(1)
                        end
                        countDown:Remove()
                        remotes.UI.Lobby.StartLobby:FireServer(realDungeons[flags.selectedDungeon],
                            flags.selectedDifficulty, flags.hardCore, "Solo")
                    end)()
                end
            });

            dungeonTab:AddDropdown({
                title = "Dungeon",
                desc = "Select a dungeon",
                options = dungeons,
                default = table.find(dungeons, flags.selectedDungeon),
                callback = function(option)
                    flags.selectedDungeon = dungeons[option]
                end
            })

            dungeonTab:AddDropdown({
                title = "Difficulty",
                desc = "Select a difficulty",
                options = difficulties,
                default = table.find(difficulties, flags.selectedDifficulty),
                callback = function(option)
                    flags.selectedDifficulty = difficulties[option]
                end
            })


            dungeonTab:AddToggle({
                title = 'Hardcore',
                desc = 'Toggles hardcore mode for selected dungeon',
                checked = flags.hardCore,
                callback = function(state)
                    flags.hardCore = state
                end
            });

            dungeonTab:AddToggle({
                title = 'Endless',
                desc = 'Toggles endless mode for selected dungeon',
                checked = flags.endless,
                callback = function(state)
                    flags.endless = state
                end
            });
                    
                    
            dungeonTab:AddToggle({
                title = 'Heroic',
                desc = 'Toggles heroic modifier for selected dungeon',
                checked = flags.heroic,
                callback = function(state)
                    flags.heroic = state
                end
            });
        
            miscTab:AddSeperator("Game")
            miscTab:AddButton({
                title = 'Claim Quests',
                desc = "Claims any quests that have been completed",
                callback = claimQuests
            });

            miscTab:AddSeperator("Servers")
            miscTab:AddButton({
                title = 'Rejoin',
                desc = "Rejoins the game",
                callback = function()
                    noti.normal("Server", "Rejoining the server", "success", 5)
                    game:GetService("TeleportService"):Teleport(4809447488, client)
                end
            });

            miscTab:AddButton({
                title = 'Serverhop',
                desc = "Joins a different server",
                callback = function()
                    local servers = {}
                    local req = syn.request({ Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"
                        , game.PlaceId) })
                    local body = jsonD(req.Body)
                    if body and body.data then
                        for i, v in next, body.data do
                            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and
                                v.playing < v.maxPlayers and v.id ~= game.JobId then
                                table.insert(servers, 1, v.id)
                            end
                        end
                    end
                    if #servers > 0 then
                        noti.normal("Server", "Hopping to a new server", "success", 5)
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                            servers[math.random(1, #servers)], client)
                    else
                        return noti.normal("Server", "Couldn't find a server", "success", 5)
                    end
                end
            });

            miscTab:AddToggle({
                title = 'Auto-Execute',
                desc = "Automatically executes script on new server",
                checked = flags.autoExec,
                callback = function(state)
                    flags.autoExec = state
                end
            });

            miscTab:AddSeperator("Support")
            miscTab:AddButton({
                title = 'Join Discord',
                desc = 'Joins the discord server instantly (SYNAPSE ONLY)',
                callback = function()
                    local json = {
                        ["cmd"] = "INVITE_BROWSER",
                        ["args"] = {
                            ["code"] = "eX5k7TKN4F"
                        },
                        ["nonce"] = 'a'
                    }
                    spawn(function()
                        print(syn.request({
                            Url = 'http://127.0.0.1:6463/rpc?v=1',
                            Method = 'POST',
                            Headers = {
                                ['Content-Type'] = 'application/json',
                                ['Origin'] = 'https://discord.com'
                            },
                            Body = game:GetService('HttpService'):JSONEncode(json),
                        }).Body)
                    end)
                end
            });
            connect(game.Players.PlayerRemoving, function(plr)
                if plr == client then
                    save(flags, "lobby.json")
                end
            end)
        end
        return
    end

    local adTab, settingsTab = lib:AddTab("Main", "Toggle and settings");
    do
        adTab:AddSeperator("AI")
        adTab:AddToggle({
            title = 'ON/OFF',
            desc = 'Toggles ventureAI',
            checked = flags.autoDungeon,
            callback = function(state)
                flags.autoDungeon = state
                fire(autoDungeon, state);
            end
        });

        settingsTab:AddSeperator("Settings")
        settingsTab:AddToggle({
            title = 'Kill Aura',
            desc = 'Kills monsters around you',
            checked = flags.killAura,
            callback = function(state)
                flags.killAura = state;

                function killAura(wep)
                    if not Weapons[wep] then return end
                    local cooldown = Weapons.getWeaponCooldown(Weapons[wep].weapon, Weapons[wep].data)
                    local hostiles = hostile:group(wep);
                    attack(hostiles, wep);
                    return (#hostiles == 0 and 0) or cooldown or 0
                end

                coroutine.wrap(function()
                    while flags.killAura do
                        local cooldown = killAura(1)
                        task.wait(cooldown)
                    end
                end)()

                coroutine.wrap(function()
                    while flags.killAura do
                        local cooldown = killAura(2)
                        task.wait(cooldown)
                    end
                end)()
            end
        });

        settingsTab:AddToggle({
            title = 'Auto Potion',
            desc = 'Automatically uses mana & health potions',
            checked = flags.autoPotion,
            callback = function(state)
                flags.autoPotion = state
            end
        });

        settingsTab:AddToggle({
            title = 'Auto Dodge',
            desc = 'Automatically dodges boss & enemy attacks',
            checked = flags.autoDodge,
            callback = function(state)
                if state and not ability.canRoll() then
                    noti.normal("Warning", "Equip roll for optimum auto dodge", "success", 5)
                end
                flags.autoDodge = state
            end
        });

        settingsTab:AddToggle({
            title = 'Auto Cast Spell',
            desc = 'Automatically cast spells at enemies',
            checked = flags.autoSpell,
            callback = function(state)
                flags.autoSpell = state
            end
        });

        settingsTab:AddToggle({
            title = 'Animations',
            desc = 'Shows weapon animations using mouse input (glitchy)',
            checked = flags.anims,
            callback = function(state)
                flags.anims = state
                if state then
                    noti.normal("Warning", "Disable animations if your having input problems", "warn", 5)
                end
            end
        });

        settingsTab:AddToggle({
            title = 'Teleport to gates',
            desc = 'Teleports to gate instead of pathfinding',
            checked = flags.gateTeleport,
            callback = function(state)
                flags.gateTeleport = state
            end
        });

        settingsTab:AddToggle({
            title = 'Teleport if stuck',
            desc = 'Teleports to enemy if stuck (enable if you get stuck)',
            checked = flags.dashWarp,
            callback = function(state)
                flags.dashWarp = state
            end
        });


        settingsTab:AddToggle({
            title = 'Smart Jump',
            desc = 'Jumps when near enemies to attempt to dodge',
            checked = flags.jumping,
            callback = function(state)
                flags.anims = state
            end
        });


        if Weapons[1].Ranged or (Weapons[2] and Weapons[2].Ranged) then
            settingsTab:AddToggle({
                title = 'Keep Distance with Ranged',
                desc = 'Stays away from enemies to prevent damage',
                checked = flags.keepDistance,
                callback = function(state)
                    flags.keepDistance = state
                end
            });

            settingsTab:AddSlider({
                title = 'Distance',
                desc = 'Distance to stay away',
                values = { min = 0, max = 100, default = flags.distanceAway, round = 1 },
                callback = function(state)
                    flags.distanceAway = state
                end
            });
        else
            flags.keepDistance = false
        end

        adTab:AddToggle({
            title = 'Visualization',
            desc = 'Visualizes AI',
            checked = flags.visualize,
            callback = function(state)
                flags.visualize = state
                pathing.Visualize = state
            end
        });
    end


    local miscTab, serverTab = lib:AddTab("Misc.", "Miscellaneous functions");
    do
        serverTab:AddSeperator("Servers")
        serverTab:AddButton({
            title = 'Join Lobby',
            desc = 'Joins the lobby of the game',
            callback = function()
                noti.normal("Server", "Joining the lobby", "success", 5)
                game:GetService("TeleportService"):Teleport(4809447488, client)
            end
        });

        miscTab:AddSeperator("Misc")
        miscTab:AddButton({
            title = 'Join Discord',
            desc = 'Joins the discord server instantly (SYNAPSE ONLY)',
            callback = function()
                local json = {
                    ["cmd"] = "INVITE_BROWSER",
                    ["args"] = {
                        ["code"] = "eX5k7TKN4F"
                    },
                    ["nonce"] = 'a'
                }
                spawn(function()
                    print(syn.request({
                        Url = 'http://127.0.0.1:6463/rpc?v=1',
                        Method = 'POST',
                        Headers = {
                            ['Content-Type'] = 'application/json',
                            ['Origin'] = 'https://discord.com'
                        },
                        Body = game:GetService('HttpService'):JSONEncode(json),
                    }).Body)
                end)
            end
        });

        miscTab:AddToggle({
            title = 'Auto-Execute',
            desc = 'Automatically executes script on new server',
            checked = flags.autoExec,
            callback = function(state)
                flags.autoExec = state
            end
        });

        adTab:AddSeperator("Auto Claim Quests")

        local questCon
        adTab:AddToggle({
            title = 'ON/OFF',
            desc = 'Toggles auto claim quest',
            checked = flags.autoQuest,
            callback = function(state)
                flags.autoQuest = state
                if questCon then
                    questCon:Disconnect()
                end
                if state then
                    claimQuests()
                    questCon = connect(client.stats.Quests.DescendantAdded, function(i)
                        if i.Name == "C" then
                            claimQuests()
                        end
                    end)
                end
            end
        });

        adTab:AddSeperator("Walk Speed")
        adTab:AddToggle({
            title = 'ON/OFF',
            desc = 'Toggle speed hacks',
            checked = flags.speed,
            callback = function(state)
                flags.speed = state
                if state then
                    spoof(humanoid, "WalkSpeed", 16)
                    coroutine.wrap(function()
                        while flags.speed do
                            if humanoid then
                                humanoid.WalkSpeed = flags.speedInt
                            else
                                repeat task.wait() until humanoid
                                spoof(humanoid, "WalkSpeed", 16)
                            end
                            task.wait()
                        end
                    end)()
                else
                    unspoof(humanoid, "WalkSpeed")
                end
            end
        });

        getgenv().oldSpeed = flags.speedInt
        adTab:AddSlider({
            title = 'Speed',
            desc = 'Speed of your humanoid with speed enabled',
            values = { min = 0, max = 22, default = flags.speedInt, round = 1 },
            callback = function(state)
                oldSpeed = state
                flags.speedInt = state
            end
        });


    end
end

do
    local autoDungeon_broom = broom();

    local mousePos
    local faceCF
    local behindWall

    local function inAttackRadius()
        for _, indicator in next, getChildren(rangeIndicators) do
            if indicator.Name == "LingeringSpear" then continue end
            if indicator:IsA("Folder") then indicator = findFirstChild(indicator, 'Main') or
                findFirstChildOfClass(indicator, "BasePart") end

            indicator.Position = Vector3.new(indicator.Position.X, root.Position.Y, indicator.Position.Z)
            if not findFirstChild(indicator, "TouchInterest") then
                connect(indicator.Touched, function() end)
            end
            local touching = indicator:GetTouchingParts()
            for i, v in pairs(touching) do
                if v.Parent == character then
                    return indicator
                end
            end
        end
        return false
    end

    local function dashWarp(cf)
        if not flags.dashWarp then return end
        local res = ability:use(999);
        if res then
            task.wait(0.165);
            character:PivotTo(cf);
            root:GetPropertyChangedSignal("Position"):Wait()
        end
    end

    connect(autoDungeon.Event, function(state)
        if not state then return autoDungeon_broom:clean() end

        for _, v in pairs(map:GetChildren()) do
            if v.Name:find("Gate") then
                for _, part in pairs(v:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "Tiles" then
                        part.CanCollide = false
                    end
                end
            end
        end

        for _, v in pairs(map.Segments:GetDescendants()) do
            if v:IsA("BasePart") and v.Transparency < 1 and
                (
                v.Parent.Name == "Balustrade1_Angled_Variant1" or v.Parent.Name == "Balustrade1_Straight_Variant2" or
                    not v.Name:find("Wall") and not v.Name:find("Bricks") and not v.Name:find("Floor") and
                    not v.Parent.Name:find("Floor") and not v.Name:lower():find("coin")) then
                v.CanCollide = false
            end
            if v.Name == "HurtBox" then
                v.CanCollide = true
                v.Transparency = 0
            end
        end


        autoDungeon_broom:GiveTask(connect(map.Segments.DescendantAdded, function(v)
            if v.Name == "HurtBox" then
                v.CanCollide = true
                v.Transparency = 0
            end
        end))

        gyro.P = 3000
        autoDungeon_broom:GiveTask(connect(gyro:GetPropertyChangedSignal("CFrame"), function()
            pcall(function() gyro.CFrame = CFrame.new(root.Position, faceCF) end)
        end))

        local stuck = 0
        local lastCF = character:GetPivot()
        local sameHealth = 0
        autoDungeon_broom:GiveTask(connect(render, function()
            if not root or (humanoid and humanoid.Health == 0) then return end

            local hostile, distance, _ = hostile:nearest();
            behindWall = _
            local potion = (flags.autoPotion) and ability.potion()
            local dodge = flags.autoDodge and (inAttackRadius())
            local gate, loot = (
                findFirstChild(projectiles, 'WaitingForPlayers') or findFirstChild(projectiles, 'BossWaitingForPlayers')
                ), findFirstChild(map, 'LootPrompt', true);
            local boss, dungeonFailed = replicatedStorage.ControlSettings.CurrentBoss.Value,
                replicatedStorage.ControlSettings.Failed.Value;

            faceCF = ((hostile and not behindWall) or (hostile and dodge)) and hostile.HumanoidRootPart.Position or
                behindWall and humanoid.WalkToPoint or client:GetMouse().Hit.Position

            if gate then
                if flags.gateTeleport then
                    root.CFrame = gate.CFrame + Vector3.yAxis;
                else
                    if not gate then return end
                    characterPathing._settings.TIME_VARIANCE = 2
                    local gatePath = gate.Name == "BossWaitingForPlayers" and
                        characterPathing:Run(gate.Position + gate.CFrame.lookVector * -40) or
                        characterPathing:Run(gate.Position + gate.CFrame.rightVector * 5);
                    local distanceFromLast = (lastCF.p - character:GetPivot().p).Magnitude
                    if distanceFromLast < 0.2 then
                        stuck = stuck + 1
                        if stuck > 100 then
                            stuck = 0
                            root.CFrame = gate.CFrame + Vector3.yAxis;
                        end
                        return
                    elseif distanceFromLast > 0.2 then
                        stuck = 0
                    end
                    lastCF = character:GetPivot()
                end
                return;
            elseif loot or dungeonFailed then
                if loot then
                    fireproximityprompt(loot);
                end
                fireServer(dungeonVoting, 'ReplayDungeon');
            elseif dodge then
                characterPathing._settings.JUMP_WHEN_STUCK = flags.jumping and false

                characterPathing:Run(root.Position + root.CFrame.rightVector * -8);
                if (ability.canRoll() or ability.canDash()) then
                    mousePos = root.Position + root.CFrame.rightVector * -8
                    ability.roll()
                    ability.dash()
                    return
                end
                mousePos = hostile and findFirstChild(hostile, "HumanoidRootPart") and hostile.HumanoidRootPart.Position
            elseif hostile and findFirstChild(hostile, "HumanoidRootPart") then
                -- Spider Patch
                local hostilePos = findFirstChild(hostile, 'Waiting' .. hostile.Name) and
                    Vector3.new(hostile.HumanoidRootPart.Position.X, root.Position.Y, hostile.HumanoidRootPart.Position.Z)
                    or hostile.HumanoidRootPart.Position

                mousePos = behindWall and humanoid.WalkToPoint or hostile.HumanoidRootPart.Position
                characterPathing._settings.COMPARISON_CHECKS = (distance < 15 and flags.jumping) and 1 or 2
                characterPathing._settings.TIME_VARIANCE = (
                    distance < 50 or boss or findFirstChild(hostile, 'Waiting' .. hostile.Name)) and 0.07 or 1

                -- Cast Spells
                local castSpells = (flags.autoSpell and not behindWall and distance < 20) and ability:castSpells()
                --game:GetService("Players").LocalPlayer.PlayerGui.DungeonPlaceUI.EndlessGui.EndlessController

                -- ESP
                ESP:Clear("Hostile")
                if flags.visualize then
                    ESP:Create(hostile.HumanoidRootPart, hostile.Name, "Hostile", math.floor(distance + 0.5),
                        behindWall and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0))
                end

                if boss and boss:FindFirstChild("DamageReduction", true) then
                    return characterPathing:Run(root.Position + root.CFrame.lookVector * -7);
                end

                -- Keep Distance
                if findFirstChild(hostile, "Humanoid") and hostile.Humanoid.Health == hostile.Humanoid.MaxHealth then -- ranged not hitting fix
                    sameHealth = sameHealth + 1
                else
                    sameHealth = 0
                end

                if sameHealth < 100 then
                    if distance <= flags.distanceAway and flags.keepDistance and not behindWall then
                        if distance >= 15 then
                            characterPathing:Run(root.Position + root.CFrame.lookVector * -7);
                        else
                            characterPathing:Run(hostilePos + hostile.HumanoidRootPart.CFrame.lookVector * -10);
                        end
                        return
                    elseif distance > flags.distanceAway and distance < Weapons[1].range and flags.keepDistance and
                        not behindWall then
                        return
                    end
                end

                --Pathfinding
                local enemyOffset = findFirstChild(hostile, "HideHealthBar") and math.clamp(Weapons[1].range, 0, 10) or
                    -math.clamp(Weapons[1].range, 0, 10)
                local pathEnemy = characterPathing:Run(hostilePos +
                    hostile.HumanoidRootPart.CFrame.lookVector * enemyOffset);

                -- Stuck
                local distanceFromLast = (lastCF.p - character:GetPivot().p).Magnitude
                if distanceFromLast < 0.2 and not humanoid.Jump and not boss then
                    stuck = stuck + 1
                    if stuck > 100 and findFirstChild(hostile, "HumanoidRootPart") then
                        stuck = 0
                        dashWarp(hostile.HumanoidRootPart.CFrame)
                    end
                    return
                elseif distanceFromLast > 0.2 then
                    stuck = 0
                end
                lastCF = character:GetPivot()

                -- Dash if behind wall
                if behindWall and stuck < 5 then
                    ability.dash()
                    ability.roll()
                end
            end
        end));
    end);

    connect(client.CharacterAdded, function(newCharacter)
        character = newCharacter;
        root = waitForChild(newCharacter, 'HumanoidRootPart');
        gyro = waitForChild(root, "BodyGyro");
        gyro.P = 3000
        humanoid = waitForChild(newCharacter, 'Humanoid');
        characterPathing = pathing.new(newCharacter,
            { AgentRadius = 3, AgentHeight = 4, AgentCanJump = true, WaypointSpacing = 8.2 }, {
                Costs = {
                    Water = math.huge,
                    Neon = math.huge
                }
            }, {
            TIME_VARIANCE = 0.001,
            COMPARISON_CHECKS = 2,
            JUMP_WHEN_STUCK = true
        });


        for _, v in pairs(map:GetChildren()) do
            if v.Name:find("Gate") then
                for _, part in pairs(v:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "Tiles" then
                        part.CanCollide = false
                    end
                end
            end
        end

        for _, v in pairs(map.Segments:GetDescendants()) do
            if v:IsA("BasePart") and v.Transparency < 1 and
                (
                v.Parent.Name == "Balustrade1_Angled_Variant1" or v.Parent.Name == "Balustrade1_Straight_Variant2" or
                    not v.Name:find("Wall") and not v.Name:find("Bricks") and not v.Name:find("Floor") and
                    not v.Parent.Name:find("Floor") and not v.Name:lower():find("coin")) then
                v.CanCollide = false
            end
            if v.Name == "HurtBox" then
                v.CanCollide = true
                v.Transparency = 0
            end
        end

        table.insert(hostile.partBlacklist, character)
        if flags.autoDungeon then
            autoDungeon_broom:GiveTask(connect(gyro:GetPropertyChangedSignal("CFrame"), function()
                pcall(function() gyro.CFrame = CFrame.new(root.Position, faceCF) end)
            end))
        end
    end);

    fire(autoDungeon, flags.autoDungeon);

    connect(game.Players.PlayerRemoving, function(plr)
        if plr == client then
            mouse2release()
            save(flags, "dungeon.json")
        end
    end)

    local DungeonGui = client.PlayerGui.DungeonClear
    connect(DungeonGui.DungeonClearLabel:GetPropertyChangedSignal("Visible"), function()
        if DungeonGui.DungeonClearLabel.Visible then
            fireServer(dungeonVoting, 'ReplayDungeon');
        end
    end)

    oldNamecall = hookfunction(getrawmetatable(game).__namecall, newcclosure(function(self, ...)
        local Args       = { ... }
        local callMethod = getnamecallmethod()
        if callMethod == "FireServer" then
            if self.Name == "UpdateMouseDirection" and flags.autoDungeon then
                Args[1] = mousePos;
            end
            if attackRemotes[self.Name:gsub("Attack", "")] and flags.killAura then
                if checkcaller() then
                    if (
                        behindWall and self ~= attackRemotes.Melee and
                            not replicatedStorage.ControlSettings.CurrentBoss.Value) then
                        return;
                    end
                    if self ~= attackRemotes.Melee then
                        coroutine.wrap(function()
                            flags.speedInt = 10
                            task.wait(.5)
                            flags.speedInt = oldSpeed
                        end)()
                    end
                    if not behindWall and flags.anims then
                        coroutine.wrap(function()
                            mouse2press()
                            task.wait(.5)
                            mouse2release()
                        end)()
                    end
                else
                    if flags.autoDungeon then
                        return;
                    end
                end
            end
        end
        return oldNamecall(self, unpack(Args))
    end))
end
--[[
    ventureAI 
    
    by saucekid (https://discord.gg/eX5k7TKN4F)
    
    CREDITS:
    - sukaretto#8874 (https://discord.gg/PFuQMWMhQQ)
    - ObscureScapter (https://v3rmillion.net/member.php?action=profile&uid=387561)
--]]

_G.safemode = _G.safemode or true
repeat wait() until game:IsLoaded()
if executed_ then
    noti.full({ Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Warning",
        Description = "You have already executed this script once", MessageBoxIcon = "Warning", MessageBoxButtons = "OK" })
    return;
end

-- compatability.
if not getgenv then
    _G.getgenv = function()
        return _G
    end
end
if not syn then
    getgenv().syn = {
        request = function(t)
            return http_request(t)
        end,
        protect_gui = function(object) end
    }
    getgenv().isfile = function(t)
        return pcall(function()
            readfile(t)
        end)
    end
    getgenv().delfile = function() end
end

getgenv().executed_ = true

-- { variables.
local game = game;
local httpGet = game.HttpGet;

local quick = loadstring(httpGet(game, 'https://raw.githubusercontent.com/Belkworks/quick/master/init.lua'))();
local broom = loadstring(httpGet(game, 'https://raw.githubusercontent.com/Belkworks/broom/master/init.lua'))();
local pathing = loadstring(httpGet(game, 'https://pastebin.com/raw/9H6fukVH'))();
pathing.Visualize = true;

_G.Config = { ["Theme"] = "dark" }
getgenv().noti = {
    full = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/NotificationGUI/main/source.lua"))().Show,
    normal = function(...) loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/saucekid/UI-Libraries/main/NordNotify.lua", true))():Notify(...) end
}

-- services.
local s = quick.Service;
local workspace = s.Workspace;
local replicatedStorage = s.ReplicatedStorage;
local runService = s.RunService;

-- indexing.
local cf, v3 = CFrame.new, Vector3.new;

local findFirstChild, findFirstChildOfClass, waitForChild = game.FindFirstChild, game.FindFirstChildOfClass,
    game.WaitForChild;
local getChildren, getPartsByRadius = game.GetChildren, workspace.GetPartBoundsInRadius;

local create, destroy = Instance.new, game.Destroy;
local fire, fireServer = create 'BindableEvent'.Fire, create 'RemoteEvent'.FireServer;

local string_find = string.find;
local string_format = string.format;

local jsonE, jsonD = function(o) return game.HttpService:JSONEncode(o) end,
    function(o) return game.HttpService:JSONDecode(o) end

local c = game.Loaded;
local connect, cwait = c.Connect, c.Wait;
local render, step, heartBeat = runService.RenderStepped, runService.Stepped, runService.Heartbeat;

local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

-- client.
local client = quick.User;
local character = client.Character or cwait(client.CharacterAdded);
local root = waitForChild(character, 'HumanoidRootPart');
local gyro = waitForChild(root, 'BodyGyro')
local humanoid = waitForChild(character, 'Humanoid');

local distanceFromCharacter = client.DistanceFromCharacter;
local characterPathing = pathing.new(character,
    { AgentRadius = 3, AgentHeight = 4, AgentCanJump = true, WaypointSpacing = 8.2 }, {
        Costs = {
            Water = math.huge,
            Neon = math.huge
        }
    }, {
    TIME_VARIANCE = 0.001,
    COMPARISON_CHECKS = 2,
    JUMP_WHEN_STUCK = true
});

for i, v in pairs(getconnections(client.Idled)) do
    v:Disable()
end

if _G.safemode and game.PlaceVersion > 970 then client:Kick("\nGame Updated.\nWait For Script Update!") return end

-- things.
local map = workspace.Map;
local quests = client.PlayerGui.Quests.QuestFrame.Quests
local projectiles = workspace.Projectiles;
local rangeIndicators = workspace.RangeIndicators
local IPDFunctions = require(replicatedStorage.Modules.IPDFunctions)
local clientEquipped = client.stats.Equipped;

-- remotes&attacking.
local remotes = replicatedStorage.Remotes;
local action = remotes.Action;

local attackRemotes = {
    Melee = action.MeleeAttack,
    Magic = action.MagicAttack,
    Bow = action.BowAttack
}
local useAbility = action.ActivateAbility;
local dungeonVoting = remotes.UI.EndDungeon.EndOfDungeonVote;

-- weapon calculation.
local Weapons = {
    [1] = { hitDelay = 1.2, range = 110 },
    [2] = { hitDelay = 1.2, range = 100 },

    Types = {
        Melee = {
            "Hammer",
            "Dagger",
            "Axe",
            "Spear",
            "Sword",
            "Rapier",
            "Polearm",
            "Greatsword",
            "Katana",
            "TowerShield"
        },
        Bow   = {
            "Bow",
            "Crossbow",
        },
        Magic = {
            "Staff",
            "Wand",
            "Book",
        }
    }
}
do
    function Weapons.getWeaponCooldown(weapon, weaponData)
        local Tags = findFirstChild(weaponData, "Tags");
        local attackBoost = IPDFunctions:GetBoostValue(character, "AttackSpeedBoost");

        if Tags then
            for q, c in next, getChildren(Tags) do
                attackBoost = attackBoost + IPDFunctions:GetBoostValue(character, c.Name .. "AttackSpeedBoost")
            end
        end

        return findFirstChild(weaponData, "NoAttack") and 1.2 or
            1 /
            (
            weaponData.AttackSpeed.Value * 1.03 ^ (weapon.Rarity.Value - weaponData.BaseRarity.Value) *
                (1 + attackBoost / 100))
    end

    function Weapons.calculate(weapon)
        local weaponType = weapon.ItemType.Value;
        local weaponIndex = weapon.Name:gsub("Wep", "")

        local weaponTypeFolder = replicatedStorage.ItemData[weaponType];
        local weaponData = quick.find(getChildren(weaponTypeFolder), function(w) return w.Name == weapon.ItemID.Value end);

        local attackType
        for i, class in pairs(Weapons.Types) do
            if table.find(class, weaponType) then
                attackType = i
            end
        end

        local equippedWeapon = Weapons[tonumber(weaponIndex)]
        local otherWeapon = tonumber(weaponIndex) == 1 and Weapons[2] or Weapons[1]
        if weaponData and attackType then
            equippedWeapon.Type = attackType
            equippedWeapon.weapon = weapon
            equippedWeapon.data = weaponData
            equippedWeapon.remote = attackRemotes[attackType]
            equippedWeapon.range = findFirstChild(weaponData, "Range") and weaponData.Range.Value or equippedWeapon.range;
            equippedWeapon.Ranged = (attackType == "Magic" or attackType == "Bow") and true or false;

            if not otherWeapon.remote then
                for i, v in pairs(equippedWeapon) do
                    otherWeapon[i] = v
                end
            end
        else
            equippedWeapon.remote = nil
        end
    end

    local function weaponChanged(w)
        Weapons.calculate(w);
        connect(w.ItemID.Changed, function() Weapons.calculate(w) end);
    end

    quick.each(getChildren(clientEquipped), function(v) if string_find(v.Name, 'Wep') then weaponChanged(v) end end);
    connect(clientEquipped.ChildAdded, function(v)
        if string_find(v.Name, 'Wep') then
            weaponChanged(v);
        end
    end);
end

-- classes.
local hostile = ({ params = (function()
    local _ = OverlapParams.new()
    _.FilterDescendantsInstances = { workspace.NPCS }
    _.FilterType = Enum.RaycastFilterType.Whitelist;

    return _;
end)(), filtered = {
    ['GoblinBashWatermelon'] = true
} });
do
    function hostile:group(wep)
        local parts = quick.map(getPartsByRadius(workspace, root.Position, Weapons[wep].range, self.params),
            function(p)
                return p.Parent;
            end);

        return quick.uniq(quick.filter(parts,
            function(p) return not self.filtered[p.Name] and p.Parent == workspace.NPCS end));
    end

    hostile.partBlacklist = { workspace.NPCS, workspace.DeadNPCS, workspace.NextNPCS, workspace.Projectiles,
        damageIndicators, findFirstChild(workspace, "Local"), workspace.Map:FindFirstChild("Throne"), client.Character }
    function hostile:behindWall(hostile)
        local fromPart = findFirstChild(character, "Wep1") or root
        local CF = CFrame.new(hostile.HumanoidRootPart.Position, fromPart:GetPivot().p);
        local _ = RaycastParams.new();
        _.IgnoreWater = true
        _.FilterDescendantsInstances = self.partBlacklist;
        _.FilterType = Enum.RaycastFilterType.Blacklist;

        local hit = workspace:Raycast(CF.p, CF.LookVector * (hostile.HumanoidRootPart.Position - root.Position).magnitude
            , _)
        if hit and
            (
            (hit.Instance.Transparency >= .3 or hit.Instance.Parent == client.Character) and
                hit.Instance.ClassName ~= "Terrain") and not table.find(self.partBlacklist, hit.Instance) then
            table.insert(self.partBlacklist, hit.Instance)
        end
        return hit
    end

    local lastHostile
    function hostile:nearest()
        local nearestVis = { behindWall = false, distance = math.huge }
        local nearest = { behindWall = true, distance = math.huge }

        for _, v in next, getChildren(workspace.NPCS) do
            if self.filtered[v.Name] or (not findFirstChild(v, 'HumanoidRootPart')) then continue end
            local wall = self:behindWall(v)
            local magnitude = distanceFromCharacter(client, v.HumanoidRootPart.Position);
            if wall then
                if magnitude < nearest.distance then
                    nearest.instance = v
                    nearest.distance = magnitude
                end
            else
                if magnitude < nearestVis.distance then
                    nearestVis.instance = v
                    nearestVis.distance = magnitude
                end
            end
        end

        local selected = nearestVis.instance and nearestVis or nearest
        if lastHostile and lastHostile.instance and findFirstChild(lastHostile.instance, "Humanoid") and
            lastHostile.instance.Humanoid.Health > 0 and selected.instance ~= lastHostile.instance and
            selected.instance ~= replicatedStorage.ControlSettings.CurrentBoss.Value and
            selected.distance > Weapons[1].range and selected.distance > lastHostile.distance then
            return lastHostile.instance, lastHostile.distance, lastHostile.behindWall; -- fuck you
        end
        lastHostile = { instance = selected.instance, distance = selected.distance, behindWall = selected.behindWall }

        return selected.instance, selected.distance, selected.behindWall;
    end
end


local ability = {}
do
    ability.items = {}
    ability.wrapper = {
        ["1"] = 3,
        ["2"] = 4,
        ["3"] = 5,
        ["4"] = 6
    }
    function ability.register(item)
        local itemType = item.ItemType.Value;
        local itemIndex = item.Name:gsub("Item", "")

        local itemTypeFolder = replicatedStorage.ItemData[itemType];
        local itemData = quick.find(getChildren(itemTypeFolder), function(i) return i.Name == item.ItemID.Value end);

        if itemType == "Spell" or item.ItemID.Value:find("Potion") then
            local abilityType = item.ItemID.Value:find("Roll") and "Roll" or
                item.ItemID.Value:find("Potion") and "Potion" or "Spell"
            local abilityData = replicatedStorage.AbilityData:FindFirstChild(itemData.DisplayName.Value)

            ability.items[tonumber(itemIndex)] = {
                Type = abilityType,
                remote = ability.wrapper[itemIndex],
                potion = (abilityType == "Potion" and item.ItemID.Value:find("Heal")) and "Heal" or
                    (abilityType == "Potion" and item.ItemID.Value:find("Mana")) and "Mana" or false,
                mana = abilityData and abilityData.ManaCost.Value
            }
        else
            ability.items[tonumber(itemIndex)] = nil
        end
    end

    function ability.cooldown(a)
        local attributes = findFirstChild(character, 'Attributes');
        return attributes and findFirstChild(attributes.Value, 'Cooldowns') and
            findFirstChild((attributes.Value).Cooldowns, string_format('Wep%dAbilityCD', a)) ~= nil;
    end

    function ability.getMana()
        local mana = findFirstChild(character, 'Mana')
        if not mana then return end
        return mana.Value, mana and mana.Max.Value
    end

    function ability:use(a)
        if (not self.cooldown(a)) then
            task.spawn(fireServer, useAbility, a);
            return true;
        end
        return false;
    end

    function ability:getAbility(itemType)
        local abilities = {}
        for _, item in pairs(self.items) do
            if item.Type == itemType then
                table.insert(abilities, item)
            end
        end
        return abilities
    end

    -- potion
    function ability.potion()
        local potions = ability:getAbility("Potion")
        local mana, maxMana = ability.getMana()
        if potions then
            for _, potion in pairs(potions) do
                if potion.potion == "Heal" and humanoid.Health <= humanoid.MaxHealth / 2 then
                    return ability:use(potion.remote)
                elseif potion.potion == "Mana" and mana <= maxMana / 2 then
                    return ability:use(potion.remote)
                end
            end
        end
    end

    -- spells
    function ability:castSpells()
        local spells = self:getAbility("Spell")
        local mana, maxMana = ability.getMana()
        if spells then
            for _, spell in pairs(spells) do
                if mana >= spell.mana then
                    local success = ability:use(spell.remote)
                end
            end
        end
    end

    -- roll
    function ability.canRoll()
        local rolls = ability:getAbility("Roll")
        if rolls then
            for _, roll in pairs(rolls) do
                return not ability.cooldown(roll.remote)
            end
        end
        return false
    end

    function ability.roll()
        local rolls = ability:getAbility("Roll")
        if rolls then
            for _, roll in pairs(rolls) do
                local success = ability:use(roll.remote)
            end
        end
    end

    -- dash
    function ability.dash()
        return ability:use(999)
    end

    function ability.canDash()
        return not ability.cooldown(999)
    end

    local function itemChanged(w)
        ability.register(w);
        connect(w.ItemID.Changed, function() ability.register(w) end);
    end

    quick.each(getChildren(clientEquipped), function(v) if string_find(v.Name, 'Item') then itemChanged(v) end end);
    connect(clientEquipped.ChildAdded, function(v)
        if string_find(v.Name, 'Item') then
            itemChanged(v);
        end
    end);
end

local function attack(group, wep)
    local targetMap = #group > 0 and quick.map(group, function(v)
        return { TargetCharacter = v,
            KnockbackDirection = cf(v3(root.Position.X, v.HumanoidRootPart.Position.Y, root.Position.Z),
                v.HumanoidRootPart.Position).LookVector }
    end);

    if not targetMap then return end

    local w = Weapons[wep]
    if w and w.remote then
        w.remote:FireServer(wep, { Targets = targetMap })
        ability:use(wep);
    end
end

-- ESP
local ESP = {}
do
    function ESP:Create(base, name, trackername, studs, color)
        local bb = Instance.new('BillboardGui', game.CoreGui)
        bb.Adornee = base
        bb.ExtentsOffset = Vector3.new(0, 1, 0)
        bb.AlwaysOnTop = true
        bb.Size = UDim2.new(0, 6, 0, 6)
        bb.StudsOffset = Vector3.new(0, 1, 0)
        bb.Name = trackername

        local frame = Instance.new('Frame', bb)
        frame.ZIndex = 10
        frame.BackgroundTransparency = 0.3
        frame.Size = UDim2.new(1, 0, 1, 0)
        frame.BackgroundColor3 = color or Color3.fromRGB(255, 0, 0)

        local txtlbl = Instance.new('TextLabel', bb)
        txtlbl.ZIndex = 10
        txtlbl.BackgroundTransparency = 1
        txtlbl.Position = UDim2.new(0, 0, 0, -48)
        txtlbl.Size = UDim2.new(1, 0, 10, 0)
        txtlbl.Font = 'ArialBold'
        txtlbl.FontSize = 'Size12'
        txtlbl.Text = name
        txtlbl.TextStrokeTransparency = 0.5
        txtlbl.TextColor3 = color or Color3.fromRGB(255, 0, 0)

        local txtlblstud = Instance.new('TextLabel', bb)
        txtlblstud.ZIndex = 10
        txtlblstud.BackgroundTransparency = 1
        txtlblstud.Position = UDim2.new(0, 0, 0, -35)
        txtlblstud.Size = UDim2.new(1, 0, 10, 0)
        txtlblstud.Font = 'ArialBold'
        txtlblstud.FontSize = 'Size12'
        txtlblstud.Text = tostring(studs) .. " Studs"
        txtlblstud.TextStrokeTransparency = 0.5
        txtlblstud.TextColor3 = Color3.new(255, 255, 255)
    end

    function ESP:Clear(espname)
        for _, v in pairs(game.CoreGui:GetChildren()) do
            if v.Name == espname and v:isA('BillboardGui') then
                v:Destroy()
            end
        end
    end
end

function claimQuests()
    for i, quest in pairs(quests:GetDescendants()) do
        if findFirstChild(quest, "Frame") then
            quest = findFirstChild(client.stats.Quests, quest.Name)
            if findFirstChild(quest, "C") then
                remotes.UI.Quests.ClaimRewards:FireServer(quest.Name);
                local rewards = ""
                do
                    for i, v in pairs(quest.Rewards:GetChildren()) do
                        rewards = rewards .. v.Name .. ": " .. tostring(v.Value) .. "                   \n"
                    end
                end
                noti.normal(quest.Title.Value, rewards, "success", 10)
            end
        end
    end
end

loadstring(game:HttpGet("https://pastebin.com/raw/tUUGAeaH", true))()

-- file system.
local folderpath = [[ventureAI/]]

if makefolder then
    makefolder("ventureAI")
end

local function existsFile(name)
    if not readfile then return end
    return pcall(function()
        return readfile(folderpath .. name)
    end)
end

function load(name, settings)
    if not existsFile(name) then return end
    local _, Result = pcall(readfile, folderpath .. name);
    if _ then
        local _, Loaded = pcall(game.HttpService.JSONDecode, game.HttpService, Result);
        if _ then
            for i, v in pairs(Loaded) do
                settings[i] = v;
                pcall(settings[i], v);
            end
        end
    end
end

function save(table, name)
    if writefile then
        writefile(folderpath .. name, jsonE(table));
    end
end

-- flags.
local autoDungeon, ignore = create 'BindableEvent';

local flags = {
    pathFind = true,
    speed = false,
    speedInt = 20,
    killAura = true,
    damage = false,
    damageInt = 5,
    autoDungeon = false,
    autoPotion = true,
    autoDodge = true,
    autoSpell = true,
    anims = false,
    dashWarp = true,
    jumping = true,
    gateTeleport = true,
    keepDistance = false,
    distanceAway = 30,
    visualize = false,
    autoExec = true
};
load("dungeon.json", flags)


-- auto execute.
connect(client.OnTeleport, function(State)
    if State == Enum.TeleportState.Started and syn and flags.autoExec then
        queueteleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/saucekid/scripts/main/Venture%20Tale/ventureAI.lua"))()]])
    end
end)


-- lib.
local lib = loadstring(httpGet(game, 'https://raw.githubusercontent.com/saucekid/UI-Libraries/main/compact.lua'))().init("ventureAI"
    , "v2.1.0", 1, UDim2.new(0.2, 0, 0.2, 0), UDim2.new(0, 600, 0, 300));
do
    if game.PlaceId == 4809447488 then
        flags = {
            selectedDungeon = "Goblin Cave",
            selectedDifficulty = "Easy",
            hardCore = false,
            endless = false,
            heroic = false,
            autoStart = false,
            autoExec = true
        };
        load("lobby.json", flags)

        local dungeons, realDungeons, difficulties =
        { "Goblin Cave", "Enchanted Forest", "Bandit Castle" },
            {
                ["Goblin Cave"] = "GoblinCave",
                ["Enchanted Forest"] = "EnchantedForest",
                ["Bandit Castle"] = "BanditCastle",
            },
            { "Easy", "Normal", "Hard", "Raid"}

        local dungeonTab, miscTab = lib:AddTab("Lobby", "Join/create dungeons");
        do
            dungeonTab:AddSeperator("Dungeons")
            dungeonTab:AddButton({
                title = 'Start Solo',
                desc = "Starts the selected solo dungeon",
                callback = function()
                    noti.normal("Solo Dungeon", string_format("Starting %s %s lobby", flags.selectedDifficulty, flags.selectedDungeon), "success", 5)
                    remotes.UI.Lobby.StartLobby:FireServer(realDungeons[flags.selectedDungeon], flags.selectedDifficulty, {
                        ["EnemyLevel"] = 0,
                        ["MaximumLevel"] = "",
                        ["Heroic"] = flags.heroic,
                        ["MinimumLevel"] = "",
                        ["Endless"] = flags.endless,
                        ["EnemyDamageReduction"] = 0,
                        ["EnemyHealth"] = 0,
                        ["EnemyDamage"] = 0,
                        ["Hardcore"] = flags.hardCore,
                        ["FriendsOnly"] = false
                    }, "Solo")
                end
            });

            dungeonTab:AddButton({
                title = 'Create Lobby',
                desc = "Creates a lobby for the selected dungeon",
                callback = function()
                    noti.full({ Position = UDim2.new(0.5, 0, 0.5, 0), Text = "Confirmation",
                        Description = string_format("Create a %s %s lobby?", flags.selectedDifficulty,
                            flags.selectedDungeon), MessageBoxIcon = "Question", MessageBoxButtons = "YesNo",
                        Result = function(res)
                            if (res == "Yes") then
                                remotes.UI.Lobby.CreateLobby:FireServer(realDungeons[flags.selectedDungeon], flags.selectedDifficulty, {   
                                    ["EnemyLevel"] = 0,
                                    ["MaximumLevel"] = "",
                                    ["Heroic"] = flags.heroic,
                                    ["MinimumLevel"] = "",
                                    ["Endless"] = flags.endless,
                                    ["EnemyDamageReduction"] = 0,
                                    ["EnemyHealth"] = 0,
                                    ["EnemyDamage"] = 0,
                                    ["Hardcore"] = flags.hardCore,
                                    ["FriendsOnly"] = false 
                                })
                            end
                        end 
                    })
                end
            })


            dungeonTab:AddToggle({
                title = 'Auto Start',
                desc = 'Automatically starts selected dungeon with a countdown',
                checked = flags.autoStart,
                callback = function(state)
                    flags.autoStart = state
                    coroutine.wrap(function()
                        local countDown
                        for i = 5, 1, -1 do
                            if countDown then countDown:Remove() end
                            if not flags.autoStart then return end
                            countDown = Drawing.new("Text")
                            countDown.Text = tostring(i)
                            countDown.Color = Color3.new(1, 1, 1)
                            countDown.Outline = true
                            countDown.OutlineColor = Color3.new(0, 0, 0)
                            countDown.Size = 50
                            countDown.Center = true
                            countDown.Visible = true
                            countDown.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2,
                                workspace.CurrentCamera.ViewportSize.Y / 2 - (game.GuiService:GetGuiInset().Y / 2))
                            wait(1)
                        end
                        countDown:Remove()
                        remotes.UI.Lobby.StartLobby:FireServer(realDungeons[flags.selectedDungeon],
                            flags.selectedDifficulty, flags.hardCore, "Solo")
                    end)()
                end
            });

            dungeonTab:AddDropdown({
                title = "Dungeon",
                desc = "Select a dungeon",
                options = dungeons,
                default = table.find(dungeons, flags.selectedDungeon),
                callback = function(option)
                    flags.selectedDungeon = dungeons[option]
                end
            })

            dungeonTab:AddDropdown({
                title = "Difficulty",
                desc = "Select a difficulty",
                options = difficulties,
                default = table.find(difficulties, flags.selectedDifficulty),
                callback = function(option)
                    flags.selectedDifficulty = difficulties[option]
                end
            })


            dungeonTab:AddToggle({
                title = 'Hardcore',
                desc = 'Toggles hardcore mode for selected dungeon',
                checked = flags.hardCore,
                callback = function(state)
                    flags.hardCore = state
                end
            });

            dungeonTab:AddToggle({
                title = 'Endless',
                desc = 'Toggles endless mode for selected dungeon',
                checked = flags.endless,
                callback = function(state)
                    flags.endless = state
                end
            });
                    
                    
            dungeonTab:AddToggle({
                title = 'Heroic',
                desc = 'Toggles heroic modifier for selected dungeon',
                checked = flags.heroic,
                callback = function(state)
                    flags.heroic = state
                end
            });
        
            miscTab:AddSeperator("Game")
            miscTab:AddButton({
                title = 'Claim Quests',
                desc = "Claims any quests that have been completed",
                callback = claimQuests
            });

            miscTab:AddSeperator("Servers")
            miscTab:AddButton({
                title = 'Rejoin',
                desc = "Rejoins the game",
                callback = function()
                    noti.normal("Server", "Rejoining the server", "success", 5)
                    game:GetService("TeleportService"):Teleport(4809447488, client)
                end
            });

            miscTab:AddButton({
                title = 'Serverhop',
                desc = "Joins a different server",
                callback = function()
                    local servers = {}
                    local req = syn.request({ Url = string.format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"
                        , game.PlaceId) })
                    local body = jsonD(req.Body)
                    if body and body.data then
                        for i, v in next, body.data do
                            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and
                                v.playing < v.maxPlayers and v.id ~= game.JobId then
                                table.insert(servers, 1, v.id)
                            end
                        end
                    end
                    if #servers > 0 then
                        noti.normal("Server", "Hopping to a new server", "success", 5)
                        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId,
                            servers[math.random(1, #servers)], client)
                    else
                        return noti.normal("Server", "Couldn't find a server", "success", 5)
                    end
                end
            });

            miscTab:AddToggle({
                title = 'Auto-Execute',
                desc = "Automatically executes script on new server",
                checked = flags.autoExec,
                callback = function(state)
                    flags.autoExec = state
                end
            });

            miscTab:AddSeperator("Support")
            miscTab:AddButton({
                title = 'Join Discord',
                desc = 'Joins the discord server instantly (SYNAPSE ONLY)',
                callback = function()
                    local json = {
                        ["cmd"] = "INVITE_BROWSER",
                        ["args"] = {
                            ["code"] = "eX5k7TKN4F"
                        },
                        ["nonce"] = 'a'
                    }
                    spawn(function()
                        print(syn.request({
                            Url = 'http://127.0.0.1:6463/rpc?v=1',
                            Method = 'POST',
                            Headers = {
                                ['Content-Type'] = 'application/json',
                                ['Origin'] = 'https://discord.com'
                            },
                            Body = game:GetService('HttpService'):JSONEncode(json),
                        }).Body)
                    end)
                end
            });
            connect(game.Players.PlayerRemoving, function(plr)
                if plr == client then
                    save(flags, "lobby.json")
                end
            end)
        end
        return
    end

    local adTab, settingsTab = lib:AddTab("Main", "Toggle and settings");
    do
        adTab:AddSeperator("AI")
        adTab:AddToggle({
            title = 'ON/OFF',
            desc = 'Toggles ventureAI',
            checked = flags.autoDungeon,
            callback = function(state)
                flags.autoDungeon = state
                fire(autoDungeon, state);
            end
        });

        settingsTab:AddSeperator("Settings")
        settingsTab:AddToggle({
            title = 'Kill Aura',
            desc = 'Kills monsters around you',
            checked = flags.killAura,
            callback = function(state)
                flags.killAura = state;

                function killAura(wep)
                    if not Weapons[wep] then return end
                    local cooldown = Weapons.getWeaponCooldown(Weapons[wep].weapon, Weapons[wep].data)
                    local hostiles = hostile:group(wep);
                    attack(hostiles, wep);
                    return (#hostiles == 0 and 0) or cooldown or 0
                end

                coroutine.wrap(function()
                    while flags.killAura do
                        local cooldown = killAura(1)
                        task.wait(cooldown)
                    end
                end)()

                coroutine.wrap(function()
                    while flags.killAura do
                        local cooldown = killAura(2)
                        task.wait(cooldown)
                    end
                end)()
            end
        });

        settingsTab:AddToggle({
            title = 'Auto Potion',
            desc = 'Automatically uses mana & health potions',
            checked = flags.autoPotion,
            callback = function(state)
                flags.autoPotion = state
            end
        });

        settingsTab:AddToggle({
            title = 'Auto Dodge',
            desc = 'Automatically dodges boss & enemy attacks',
            checked = flags.autoDodge,
            callback = function(state)
                if state and not ability.canRoll() then
                    noti.normal("Warning", "Equip roll for optimum auto dodge", "success", 5)
                end
                flags.autoDodge = state
            end
        });

        settingsTab:AddToggle({
            title = 'Auto Cast Spell',
            desc = 'Automatically cast spells at enemies',
            checked = flags.autoSpell,
            callback = function(state)
                flags.autoSpell = state
            end
        });

        settingsTab:AddToggle({
            title = 'Animations',
            desc = 'Shows weapon animations using mouse input (glitchy)',
            checked = flags.anims,
            callback = function(state)
                flags.anims = state
                if state then
                    noti.normal("Warning", "Disable animations if your having input problems", "warn", 5)
                end
            end
        });

        settingsTab:AddToggle({
            title = 'Teleport to gates',
            desc = 'Teleports to gate instead of pathfinding',
            checked = flags.gateTeleport,
            callback = function(state)
                flags.gateTeleport = state
            end
        });

        settingsTab:AddToggle({
            title = 'Teleport if stuck',
            desc = 'Teleports to enemy if stuck (enable if you get stuck)',
            checked = flags.dashWarp,
            callback = function(state)
                flags.dashWarp = state
            end
        });


        settingsTab:AddToggle({
            title = 'Smart Jump',
            desc = 'Jumps when near enemies to attempt to dodge',
            checked = flags.jumping,
            callback = function(state)
                flags.anims = state
            end
        });


        if Weapons[1].Ranged or (Weapons[2] and Weapons[2].Ranged) then
            settingsTab:AddToggle({
                title = 'Keep Distance with Ranged',
                desc = 'Stays away from enemies to prevent damage',
                checked = flags.keepDistance,
                callback = function(state)
                    flags.keepDistance = state
                end
            });

            settingsTab:AddSlider({
                title = 'Distance',
                desc = 'Distance to stay away',
                values = { min = 0, max = 100, default = flags.distanceAway, round = 1 },
                callback = function(state)
                    flags.distanceAway = state
                end
            });
        else
            flags.keepDistance = false
        end

        adTab:AddToggle({
            title = 'Visualization',
            desc = 'Visualizes AI',
            checked = flags.visualize,
            callback = function(state)
                flags.visualize = state
                pathing.Visualize = state
            end
        });
    end


    local miscTab, serverTab = lib:AddTab("Misc.", "Miscellaneous functions");
    do
        serverTab:AddSeperator("Servers")
        serverTab:AddButton({
            title = 'Join Lobby',
            desc = 'Joins the lobby of the game',
            callback = function()
                noti.normal("Server", "Joining the lobby", "success", 5)
                game:GetService("TeleportService"):Teleport(4809447488, client)
            end
        });

        miscTab:AddSeperator("Misc")
        miscTab:AddButton({
            title = 'Join Discord',
            desc = 'Joins the discord server instantly (SYNAPSE ONLY)',
            callback = function()
                local json = {
                    ["cmd"] = "INVITE_BROWSER",
                    ["args"] = {
                        ["code"] = "eX5k7TKN4F"
                    },
                    ["nonce"] = 'a'
                }
                spawn(function()
                    print(syn.request({
                        Url = 'http://127.0.0.1:6463/rpc?v=1',
                        Method = 'POST',
                        Headers = {
                            ['Content-Type'] = 'application/json',
                            ['Origin'] = 'https://discord.com'
                        },
                        Body = game:GetService('HttpService'):JSONEncode(json),
                    }).Body)
                end)
            end
        });

        miscTab:AddToggle({
            title = 'Auto-Execute',
            desc = 'Automatically executes script on new server',
            checked = flags.autoExec,
            callback = function(state)
                flags.autoExec = state
            end
        });

        adTab:AddSeperator("Auto Claim Quests")

        local questCon
        adTab:AddToggle({
            title = 'ON/OFF',
            desc = 'Toggles auto claim quest',
            checked = flags.autoQuest,
            callback = function(state)
                flags.autoQuest = state
                if questCon then
                    questCon:Disconnect()
                end
                if state then
                    claimQuests()
                    questCon = connect(client.stats.Quests.DescendantAdded, function(i)
                        if i.Name == "C" then
                            claimQuests()
                        end
                    end)
                end
            end
        });

        adTab:AddSeperator("Walk Speed")
        adTab:AddToggle({
            title = 'ON/OFF',
            desc = 'Toggle speed hacks',
            checked = flags.speed,
            callback = function(state)
                flags.speed = state
                if state then
                    spoof(humanoid, "WalkSpeed", 16)
                    coroutine.wrap(function()
                        while flags.speed do
                            if humanoid then
                                humanoid.WalkSpeed = flags.speedInt
                            else
                                repeat task.wait() until humanoid
                                spoof(humanoid, "WalkSpeed", 16)
                            end
                            task.wait()
                        end
                    end)()
                else
                    unspoof(humanoid, "WalkSpeed")
                end
            end
        });

        getgenv().oldSpeed = flags.speedInt
        adTab:AddSlider({
            title = 'Speed',
            desc = 'Speed of your humanoid with speed enabled',
            values = { min = 0, max = 22, default = flags.speedInt, round = 1 },
            callback = function(state)
                oldSpeed = state
                flags.speedInt = state
            end
        });



        adTab:AddSeperator("Damage Multiplier")
        adTab:AddToggle({
            title = 'ON/OFF',
            desc = 'Toggle damage multiplier',
            checked = flags.damage,
            callback = function(state)
                flags.damage = state
            end
        });

        adTab:AddSlider({
            title = 'Multiplier',
            desc = 'How many times damage is multiplier',
            values = { min = 0, max = 5, default = flags.damageInt, round = 1 },
            callback = function(state)
                flags.damageInt = state
            end
        });
    end
end

noti.normal("Warning", "Damage multiplier is unsafe, you may get banned", "warn", 5)

do
    local autoDungeon_broom = broom();

    local mousePos
    local faceCF
    local behindWall

    local function inAttackRadius()
        for _, indicator in next, getChildren(rangeIndicators) do
            if indicator.Name == "LingeringSpear" then continue end
            if indicator:IsA("Folder") then indicator = findFirstChild(indicator, 'Main') or
                findFirstChildOfClass(indicator, "BasePart") end

            indicator.Position = Vector3.new(indicator.Position.X, root.Position.Y, indicator.Position.Z)
            if not findFirstChild(indicator, "TouchInterest") then
                connect(indicator.Touched, function() end)
            end
            local touching = indicator:GetTouchingParts()
            for i, v in pairs(touching) do
                if v.Parent == character then
                    return indicator
                end
            end
        end
        return false
    end

    local function dashWarp(cf)
        if not flags.dashWarp then return end
        local res = ability:use(999);
        if res then
            task.wait(0.165);
            character:PivotTo(cf);
            root:GetPropertyChangedSignal("Position"):Wait()
        end
    end

    connect(autoDungeon.Event, function(state)
        if not state then return autoDungeon_broom:clean() end

        for _, v in pairs(map:GetChildren()) do
            if v.Name:find("Gate") then
                for _, part in pairs(v:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "Tiles" then
                        part.CanCollide = false
                    end
                end
            end
        end

        for _, v in pairs(map.Segments:GetDescendants()) do
            if v:IsA("BasePart") and v.Transparency < 1 and
                (
                v.Parent.Name == "Balustrade1_Angled_Variant1" or v.Parent.Name == "Balustrade1_Straight_Variant2" or
                    not v.Name:find("Wall") and not v.Name:find("Bricks") and not v.Name:find("Floor") and
                    not v.Parent.Name:find("Floor") and not v.Name:lower():find("coin")) then
                v.CanCollide = false
            end
            if v.Name == "HurtBox" then
                v.CanCollide = true
                v.Transparency = 0
            end
        end


        autoDungeon_broom:GiveTask(connect(map.Segments.DescendantAdded, function(v)
            if v.Name == "HurtBox" then
                v.CanCollide = true
                v.Transparency = 0
            end
        end))

        gyro.P = 3000
        autoDungeon_broom:GiveTask(connect(gyro:GetPropertyChangedSignal("CFrame"), function()
            pcall(function() gyro.CFrame = CFrame.new(root.Position, faceCF) end)
        end))

        local stuck = 0
        local lastCF = character:GetPivot()
        local sameHealth = 0
        autoDungeon_broom:GiveTask(connect(render, function()
            if not root or (humanoid and humanoid.Health == 0) then return end

            local hostile, distance, _ = hostile:nearest();
            behindWall = _
            local potion = (flags.autoPotion) and ability.potion()
            local dodge = flags.autoDodge and (inAttackRadius())
            local gate, loot = (
                findFirstChild(projectiles, 'WaitingForPlayers') or findFirstChild(projectiles, 'BossWaitingForPlayers')
                ), findFirstChild(map, 'LootPrompt', true);
            local boss, dungeonFailed = replicatedStorage.ControlSettings.CurrentBoss.Value,
                replicatedStorage.ControlSettings.Failed.Value;

            faceCF = ((hostile and not behindWall) or (hostile and dodge)) and hostile.HumanoidRootPart.Position or
                behindWall and humanoid.WalkToPoint or client:GetMouse().Hit.Position

            if gate then
                if flags.gateTeleport then
                    root.CFrame = gate.CFrame + Vector3.yAxis;
                else
                    if not gate then return end
                    characterPathing._settings.TIME_VARIANCE = 2
                    local gatePath = gate.Name == "BossWaitingForPlayers" and
                        characterPathing:Run(gate.Position + gate.CFrame.lookVector * -40) or
                        characterPathing:Run(gate.Position + gate.CFrame.rightVector * 5);
                    local distanceFromLast = (lastCF.p - character:GetPivot().p).Magnitude
                    if distanceFromLast < 0.2 then
                        stuck = stuck + 1
                        if stuck > 100 then
                            stuck = 0
                            root.CFrame = gate.CFrame + Vector3.yAxis;
                        end
                        return
                    elseif distanceFromLast > 0.2 then
                        stuck = 0
                    end
                    lastCF = character:GetPivot()
                end
                return;
            elseif loot or dungeonFailed then
                if loot then
                    fireproximityprompt(loot);
                end
                fireServer(dungeonVoting, 'ReplayDungeon');
            elseif dodge then
                characterPathing._settings.JUMP_WHEN_STUCK = flags.jumping and false

                characterPathing:Run(root.Position + root.CFrame.rightVector * -8);
                if (ability.canRoll() or ability.canDash()) then
                    mousePos = root.Position + root.CFrame.rightVector * -8
                    ability.roll()
                    ability.dash()
                    return
                end
                mousePos = hostile and findFirstChild(hostile, "HumanoidRootPart") and hostile.HumanoidRootPart.Position
            elseif hostile and findFirstChild(hostile, "HumanoidRootPart") then
                -- Spider Patch
                local hostilePos = findFirstChild(hostile, 'Waiting' .. hostile.Name) and
                    Vector3.new(hostile.HumanoidRootPart.Position.X, root.Position.Y, hostile.HumanoidRootPart.Position.Z)
                    or hostile.HumanoidRootPart.Position

                mousePos = behindWall and humanoid.WalkToPoint or hostile.HumanoidRootPart.Position
                characterPathing._settings.COMPARISON_CHECKS = (distance < 15 and flags.jumping) and 1 or 2
                characterPathing._settings.TIME_VARIANCE = (
                    distance < 50 or boss or findFirstChild(hostile, 'Waiting' .. hostile.Name)) and 0.07 or 1

                -- Cast Spells
                local castSpells = (flags.autoSpell and not behindWall and distance < 20) and ability:castSpells()
                --game:GetService("Players").LocalPlayer.PlayerGui.DungeonPlaceUI.EndlessGui.EndlessController

                -- ESP
                ESP:Clear("Hostile")
                if flags.visualize then
                    ESP:Create(hostile.HumanoidRootPart, hostile.Name, "Hostile", math.floor(distance + 0.5),
                        behindWall and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 0))
                end

                if boss and boss:FindFirstChild("DamageReduction", true) then
                    return characterPathing:Run(root.Position + root.CFrame.lookVector * -7);
                end

                -- Keep Distance
                if findFirstChild(hostile, "Humanoid") and hostile.Humanoid.Health == hostile.Humanoid.MaxHealth then -- ranged not hitting fix
                    sameHealth = sameHealth + 1
                else
                    sameHealth = 0
                end

                if sameHealth < 100 then
                    if distance <= flags.distanceAway and flags.keepDistance and not behindWall then
                        if distance >= 15 then
                            characterPathing:Run(root.Position + root.CFrame.lookVector * -7);
                        else
                            characterPathing:Run(hostilePos + hostile.HumanoidRootPart.CFrame.lookVector * -10);
                        end
                        return
                    elseif distance > flags.distanceAway and distance < Weapons[1].range and flags.keepDistance and
                        not behindWall then
                        return
                    end
                end

                --Pathfinding
                local enemyOffset = findFirstChild(hostile, "HideHealthBar") and math.clamp(Weapons[1].range, 0, 10) or
                    -math.clamp(Weapons[1].range, 0, 10)
                local pathEnemy = characterPathing:Run(hostilePos +
                    hostile.HumanoidRootPart.CFrame.lookVector * enemyOffset);

                -- Stuck
                local distanceFromLast = (lastCF.p - character:GetPivot().p).Magnitude
                if distanceFromLast < 0.2 and not humanoid.Jump and not boss then
                    stuck = stuck + 1
                    if stuck > 100 and findFirstChild(hostile, "HumanoidRootPart") then
                        stuck = 0
                        dashWarp(hostile.HumanoidRootPart.CFrame)
                    end
                    return
                elseif distanceFromLast > 0.2 then
                    stuck = 0
                end
                lastCF = character:GetPivot()

                -- Dash if behind wall
                if behindWall and stuck < 5 then
                    ability.dash()
                    ability.roll()
                end
            end
        end));
    end);

    connect(client.CharacterAdded, function(newCharacter)
        character = newCharacter;
        root = waitForChild(newCharacter, 'HumanoidRootPart');
        gyro = waitForChild(root, "BodyGyro");
        gyro.P = 3000
        humanoid = waitForChild(newCharacter, 'Humanoid');
        characterPathing = pathing.new(newCharacter,
            { AgentRadius = 3, AgentHeight = 4, AgentCanJump = true, WaypointSpacing = 8.2 }, {
                Costs = {
                    Water = math.huge,
                    Neon = math.huge
                }
            }, {
            TIME_VARIANCE = 0.001,
            COMPARISON_CHECKS = 2,
            JUMP_WHEN_STUCK = true
        });


        for _, v in pairs(map:GetChildren()) do
            if v.Name:find("Gate") then
                for _, part in pairs(v:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "Tiles" then
                        part.CanCollide = false
                    end
                end
            end
        end

        for _, v in pairs(map.Segments:GetDescendants()) do
            if v:IsA("BasePart") and v.Transparency < 1 and
                (
                v.Parent.Name == "Balustrade1_Angled_Variant1" or v.Parent.Name == "Balustrade1_Straight_Variant2" or
                    not v.Name:find("Wall") and not v.Name:find("Bricks") and not v.Name:find("Floor") and
                    not v.Parent.Name:find("Floor") and not v.Name:lower():find("coin")) then
                v.CanCollide = false
            end
            if v.Name == "HurtBox" then
                v.CanCollide = true
                v.Transparency = 0
            end
        end

        table.insert(hostile.partBlacklist, character)
        if flags.autoDungeon then
            autoDungeon_broom:GiveTask(connect(gyro:GetPropertyChangedSignal("CFrame"), function()
                pcall(function() gyro.CFrame = CFrame.new(root.Position, faceCF) end)
            end))
        end
    end);

    fire(autoDungeon, flags.autoDungeon);

    connect(game.Players.PlayerRemoving, function(plr)
        if plr == client then
            mouse2release()
            save(flags, "dungeon.json")
        end
    end)

    local DungeonGui = client.PlayerGui.DungeonClear
    connect(DungeonGui.DungeonClearLabel:GetPropertyChangedSignal("Visible"), function()
        if DungeonGui.DungeonClearLabel.Visible then
            fireServer(dungeonVoting, 'ReplayDungeon');
        end
    end)

    local function deepCopy(original)
        local copy = {}
        for k, v in pairs(original) do
            if type(v) == "table" then
                v = deepCopy(v)
            end
            copy[k] = v
        end
        return copy
    end

    oldNamecall = hookfunction(getrawmetatable(game).__namecall, newcclosure(function(self, ...)
        local Args       = { ... }
        local callMethod = getnamecallmethod()
        if callMethod == "FireServer" then
            if self.Name == "UpdateMouseDirection" and flags.autoDungeon then
                Args[1] = mousePos;
            end
            if attackRemotes[self.Name:gsub("Attack", "")] and flags.killAura then
                if checkcaller() then
                    if (
                        behindWall and self ~= attackRemotes.Melee and
                            not replicatedStorage.ControlSettings.CurrentBoss.Value) then
                        return;
                    end
                    if self ~= attackRemotes.Melee then
                        coroutine.wrap(function()
                            flags.speedInt = 10
                            task.wait(.5)
                            flags.speedInt = oldSpeed
                        end)()
                    end
                    if not behindWall and flags.anims then
                        coroutine.wrap(function()
                            mouse2press()
                            task.wait(.5)
                            mouse2release()
                        end)()
                    end
                else
                    if flags.autoDungeon then
                        return;
                    end
                end
                if flags.damage then
                    for i = 1, flags.damageInt do
                        local clone = deepCopy(Args[2].Targets)
                        for i, v in pairs(clone) do
                            table.insert(Args[2].Targets, v)
                        end
                    end
                    return oldNamecall(self, unpack(Args))
                end
            end
        end
        return oldNamecall(self, unpack(Args))
    end))
end
