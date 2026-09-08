local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

if not game:IsLoaded() then
    game.Loaded:Wait()
end

while not Players.LocalPlayer do
    task.wait()
end

local player = Players.LocalPlayer
local env = getgenv and getgenv() or _G

if env.RunawaysScriptLoading and env.RunawaysScriptLoading ~= coroutine.running() then
    repeat
        task.wait(0.1)
    until not env.RunawaysScriptLoading
        or env.AutoLoot
        or os.clock() - (tonumber(env.RunawaysScriptLoadingAt) or 0) >= 60

    if env.AutoLoot
        and not env.AutoLoot.Unloaded
        and (tostring(env.RunawaysAutoFarmTransitionToken or "") == ""
            or env.RunawaysScriptLoadedTransition == tostring(env.RunawaysAutoFarmTransitionToken))
    then
        return env.AutoLoot
    end
end

env.RunawaysScriptLoading = coroutine.running()
env.RunawaysScriptLoadingAt = os.clock()
env.RunawaysScriptLoadingToken = tostring(env.RunawaysAutoFarmTransitionToken or "")

if env.RunawaysScriptLoadingToken ~= "" then
    env.RunawaysScriptLatestTransition = nil

    pcall(function()
        env.RunawaysScriptLatestTransition = game:GetService("TeleportService"):GetTeleportSetting("RUNAWAYS_AUTO_FARM_TRANSITION")
    end)

    if env.RunawaysScriptLatestTransition ~= nil
        and tostring(env.RunawaysScriptLatestTransition) ~= env.RunawaysScriptLoadingToken
    then
        env.RunawaysScriptLoading = nil
        env.RunawaysScriptLoadingAt = nil
        env.RunawaysScriptLoadingToken = nil
        env.RunawaysScriptLatestTransition = nil
        return env.AutoLoot
    end

    if env.RunawaysScriptLoadedTransition == env.RunawaysScriptLoadingToken
        and env.AutoLoot
        and not env.AutoLoot.Unloaded
    then
        env.RunawaysScriptLoading = nil
        env.RunawaysScriptLoadingAt = nil
        env.RunawaysScriptLoadingToken = nil
        env.RunawaysScriptLatestTransition = nil
        return env.AutoLoot
    end

end

env.RunawaysScriptLatestTransition = nil

if env.AutoLoot and type(env.AutoLoot.Unload) == "function" then
    env.RunawaysScriptReloading = true
    pcall(function()
        env.AutoLoot:Unload()
    end)
    env.RunawaysScriptReloading = nil
end

local dataModule = ReplicatedStorage:WaitForChild("Data")
local flow = require(ReplicatedStorage:WaitForChild("FlowClient"))
local data = require(dataModule)
local packages = require(ReplicatedStorage:WaitForChild("Packages"))
local luck = packages.Utility.Luck
local lootData = flow.Loot and require(dataModule:WaitForChild("Loot"):WaitForChild("Data")) or {}
local lootFolder = flow.Loot and workspace:WaitForChild("Loot") or workspace:FindFirstChild("Loot")

if flow.Loot then
    assert(type(flow.Loot.LootEquip) == "function", "LootEquip is unavailable")
end

local repo = "https://raw.githubusercontent.com/Ali-lov3/Obsidian-UiLibs/refs/heads/main/"
local telegram = game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Something/refs/heads/main/telegram"):match("^%s*(.-)%s*$")
local source = game:HttpGet(repo .. "Library.lua")
local target = "            table.clear(Buttons)\n            if Info.Multi then"
local replacement = [[            table.clear(Buttons)
            for _, child in MenuTable.Menu:GetChildren() do
                if not child:IsA("UIListLayout") then
                    child:Destroy()
                end
            end
            if Info.Multi then]]
local first, last = source:find(target, 1, true)

assert(first, "Obsidian dropdown update is unavailable")

source = source:sub(1, first - 1) .. replacement .. source:sub(last + 1)

if env.RunawaysScriptLoading ~= coroutine.running() then
    return env.AutoLoot
end

local library = loadstring(source)()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
local options = library.Options
local toggles = library.Toggles

env.AutoLoot = library

local hiddenInventoryCategories = {
    BigElectronic = true,
    Cash = true,
    Painting = true,
    VehiclePart = true,
}
local dropCategories = {}
local dropCategoryByName = {}
local lootValueByName = {}
local dropCategorySet = {}
local maxLootValue = 0

for _, entry in lootData do
    if entry.Item and entry.Category then
        dropCategoryByName[entry.Item] = entry.Category
        lootValueByName[entry.Item] = entry.Value
        maxLootValue = math.max(maxLootValue, tonumber(entry.Value) or 0)

        if not hiddenInventoryCategories[entry.Category] and not dropCategorySet[entry.Category] then
            dropCategorySet[entry.Category] = true
            dropCategories[#dropCategories + 1] = entry.Category
        end
    end
end

table.sort(dropCategories)

local function notify(text, duration)
    library:Notify({
        Title = "RUNAWAYS",
        Description = text,
        Time = duration or 4,
    })
end

local function isLoot(item)
    if item.Parent ~= lootFolder or not item:IsA("Model") then
        return false
    end

    local part = item.PrimaryPart

    return part
        and part:IsA("BasePart")
        and part.Parent == item
        and CollectionService:HasTag(item, "Draggable")
        and CollectionService:HasTag(item, "Equippable")
        and not CollectionService:HasTag(item, "BuyableLoot")
end

local function getLoot()
    local items = {}
    local names = {}
    local seen = {}

    if not lootFolder then
        return items, names
    end

    for _, item in lootFolder:GetChildren() do
        if isLoot(item) then
            items[#items + 1] = item

            if not seen[item.Name] then
                seen[item.Name] = true
                names[#names + 1] = item.Name
            end
        end
    end

    table.sort(items, function(a, b)
        return a.Name < b.Name
    end)
    table.sort(names)

    return items, names
end

local bringItems = {
    Names = select(2, getLoot()),
    Signatures = {},
    Token = nil,
    Running = false,
    Context = nil,
    CashToken = nil,
    CashAuraToken = nil,
    CashRunning = false,
    CashContext = nil,
}
local busy = false
local lootAuraLoop
local killLoop
library.Rage = {}
library.VehicleMods = {}

local function formatName(name)
    return (name:gsub("(%l)(%u)", "%1 %2"))
end

local function getToolCategory(tool)
    if tool:HasTag("Backpack") then
        return "Backpack"
    end

    return dropCategoryByName[tool.Name]
end

local limits = {
    BackpackLarge = data.Balance and data.Balance.MaxToolsLargeBackpack,
    BackpackMedium = data.Balance and data.Balance.MaxToolsMediumBackpack,
    BackpackSmall = data.Balance and data.Balance.MaxToolsSmallBackpack,
}

local function getBackpackUsage()
    local backpack = player:FindFirstChildOfClass("Backpack")
    local character = player.Character

    if not backpack then
        return
    end

    local used = #backpack:GetChildren()

    if character and character:FindFirstChildOfClass("Tool") then
        used += 1
    end

    for _, name in { "BackpackLarge", "BackpackMedium", "BackpackSmall" } do
        if backpack:FindFirstChild(name) or character and character:FindFirstChild(name) then
            return used, limits[name]
        end
    end

    return used, data.Balance and data.Balance.MaxTools
end

local function getPickupCFrame(root, part)
    local offset = root.Position - part.Position
    local direction = Vector3.new(offset.X, 0, offset.Z)

    direction = direction.Magnitude > 0.1 and direction.Unit or Vector3.new(0, 0, 1)

    local position = part.Position + direction * 3 + Vector3.new(0, 2.5, 0)
    return CFrame.lookAt(position, Vector3.new(part.Position.X, position.Y, part.Position.Z))
end

local function killAllNPCs(radius)
    local folder = workspace:FindFirstChild("NPCs")

    if not folder or not flow.NPCs or type(flow.NPCs.Damage) ~= "function" then
        return 0
    end

    local character = player.Character
    local playerRoot = character and character:FindFirstChild("HumanoidRootPart")
    local killed = 0

    for _, humanoid in folder:QueryDescendants("Humanoid") do
        local npc = humanoid:FindFirstAncestorWhichIsA("Model")
        local npcRoot = npc and npc:FindFirstChild("HumanoidRootPart")
        local inRange = not radius or playerRoot and npcRoot and (npcRoot.Position - playerRoot.Position).Magnitude <= radius

        if humanoid.Health > 0 and inRange then
            local ok = pcall(flow.NPCs.Damage, humanoid, humanoid.Health + 1)

            if ok then
                killed += 1
            end
        end
    end

    return killed
end

function library.Rage:AggroNPCs(radius)
    local folder = workspace:FindFirstChild("NPCs")
    local character = player.Character
    local playerRoot = character and character:FindFirstChild("HumanoidRootPart")

    if not folder or not playerRoot or not flow.NPCs or type(flow.NPCs.Threaten) ~= "function" then
        return 0
    end

    local count = 0

    for _, npc in folder:GetChildren() do
        local humanoid = npc:IsA("Model") and npc:FindFirstChildOfClass("Humanoid")
        local npcRoot = npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart")

        if humanoid and humanoid.Health > 0 and npcRoot and (npcRoot.Position - playerRoot.Position).Magnitude <= radius then
            pcall(flow.NPCs.Threaten, npc)
            count += 1
        end
    end

    return count
end

function library.Rage:BreakNearbySources(radius)
    local character = player.Character
    local playerRoot = character and character:FindFirstChild("HumanoidRootPart")

    if not playerRoot or not flow.DamageToOpen or type(flow.DamageToOpen.Damage) ~= "function" then
        return 0
    end

    local count = 0

    for _, source in CollectionService:GetTagged("DamageToOpen") do
        local health = source:IsDescendantOf(workspace) and source:FindFirstChild("Health")
        local part = source:IsA("Model") and (source.PrimaryPart or source:FindFirstChildWhichIsA("BasePart", true))

        if health and health:IsA("NumberValue") and health.Value > 0 and part and (part.Position - playerRoot.Position).Magnitude <= radius then
            pcall(flow.DamageToOpen.Damage, source, math.max(health.Value * 10, 100), "melee")
            count += 1
        end
    end

    return count
end

local instantPrompt = {
    Service = game:GetService("ProximityPromptService"),
    Active = false,
    States = setmetatable({}, { __mode = "k" }),
    Connections = setmetatable({}, { __mode = "k" }),
}

function instantPrompt:Set(prompt)
    if not prompt:IsA("ProximityPrompt") then
        return
    end

    if self.States[prompt] == nil then
        self.States[prompt] = prompt.HoldDuration
    end

    if not self.Connections[prompt] then
        self.Connections[prompt] = prompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
            if not self.Active or not prompt.Parent then
                return
            end

            local duration = prompt.HoldDuration

            if duration ~= 0 then
                self.States[prompt] = duration
                prompt.HoldDuration = 0
            end
        end)
    end

    prompt.HoldDuration = 0
end

function instantPrompt:Apply()
    for _, prompt in workspace:QueryDescendants("ProximityPrompt") do
        self:Set(prompt)
    end
end

function instantPrompt:Restore()
    self.Active = false

    for _, connection in self.Connections do
        connection:Disconnect()
    end

    table.clear(self.Connections)

    for prompt, duration in self.States do
        if prompt.Parent then
            prompt.HoldDuration = duration
        end
    end

    table.clear(self.States)
end

function instantPrompt:SetActive(value)
    if value then
        self.Active = true
        self:Apply()
    else
        self:Restore()
    end
end

local humanoidStates = setmetatable({}, { __mode = "k" })
local cameraStates = setmetatable({}, { __mode = "k" })
local collisionStates = setmetatable({}, { __mode = "k" })
local vehicleStates = setmetatable({}, { __mode = "k" })
local gravityState
local playerStepConnection
local infiniteJumpConnection
local weaponStepConnection
local activeVehicle
local vehicleStopToken
local fovRenderName = "RUNAWAYS_PlayerFOV"
local originalTakeDamage = flow.PlayerDamage and flow.PlayerDamage.TakeDamage
local originalAbandon = flow.Passout and flow.Passout.Abandon
local originalVehicleDamage = flow.DamageVehicle and flow.DamageVehicle.Damage
local originalSetAmmo = flow.Ammo and flow.Ammo.setAmmo
local originalSubtractReserve = flow.Ammo and flow.Ammo.substractReserve
local originalCameraRecoil = flow.Camera and flow.Camera.Recoil
local originalViewmodelRecoil = flow.Viewmodel and flow.Viewmodel.Recoil
local originalRadialFalloff = luck and luck.radialFalloff
local originalWeaponRaycast = flow.BulletsClient and flow.BulletsClient.raycast
local blockedRemote = function() end
local weaponConfigStates = setmetatable({}, { __mode = "k" })
local punchMods = {
    Config = data.Tools.GetToolConfig("Punch"),
    Configs = require(dataModule:WaitForChild("Tools"):WaitForChild("Melees")),
    ConfigStates = setmetatable({}, { __mode = "k" }),
    MeleeRuntimes = setmetatable({}, { __mode = "k" }),
    Character = nil,
    Function = nil,
    SpeedIndex = nil,
    LastSearch = 0,
    MeleeTool = nil,
    MeleeConfig = nil,
    MeleeFunction = nil,
    MeleeSpeedIndex = nil,
    MeleeLastSearch = 0,
}
punchMods.Defaults = {
    Damage = punchMods.Config.damage,
    Speed = punchMods.Config.hitsPerSecond,
    ObjectDamage = punchMods.Config.destructibleDamage,
}
punchMods.ConfigStates[punchMods.Config] = punchMods.Defaults
local teleports = {
    Maps = {},
    Signatures = {},
    Ids = setmetatable({}, { __mode = "k" }),
    NextId = 0,
    LastPosition = nil,
    SavedPosition = nil,
    RefuelToken = nil,
    RefuelContext = nil,
    OptionIds = {
        Buildings = "RunawaysTeleportBuilding",
        NPCs = "RunawaysTeleportNPC",
        Vehicles = "RunawaysTeleportVehicle",
        Players = "RunawaysTeleportPlayer",
    },
}
library.Teleports = teleports
local activeWeaponTool
local activeWeaponConfig
local activeWeaponRuntime
local vehicleAttributeNames = {
    "TopSpeedMPH",
    "Acceleration",
    "Torque",
    "BrakingPower",
    "TurningAngle",
    "TurningAngleSpeedFactor",
    "Downforce",
}
local vehicleCorners = { "fl", "fr", "rl", "rr" }

local function getHumanoid()
    local character = player.Character

    return character and character:FindFirstChildOfClass("Humanoid")
end

local function getCurrentVehicle()
    local humanoid = getHumanoid()
    local seat = humanoid and humanoid.SeatPart

    if not seat or not seat:IsA("VehicleSeat") or seat.Occupant ~= humanoid then
        return
    end

    local vehicle = seat:FindFirstAncestorOfClass("Model")

    if not vehicle or not vehicle:FindFirstChild("VehicleProperty") or not vehicle:FindFirstChild("system") then
        return
    end

    return vehicle
end

local function getVehicleChassis(vehicle)
    local system = vehicle and vehicle:FindFirstChild("system")

    return system and system:FindFirstChild("chassis")
end

local function getVehicleSeat(vehicle)
    local system = vehicle and vehicle:FindFirstChild("system")
    local seats = system and system:FindFirstChild("seats")

    return seats and seats:FindFirstChildWhichIsA("VehicleSeat")
end

function teleports:GetId(instance)
    local id = self.Ids[instance]

    if not id then
        self.NextId += 1
        id = self.NextId
        self.Ids[instance] = id
    end

    return id
end

function teleports:Refresh(force)
    local lists = {
        Buildings = {},
        NPCs = {},
        Vehicles = {},
        Players = {},
    }
    local map = workspace:FindFirstChild("Map")
    local buildings = map and map:FindFirstChild("Buildings")
    local npcs = workspace:FindFirstChild("NPCs")
    local vehicles = workspace:FindFirstChild("Vehicles")

    if buildings then
        for _, building in buildings:GetChildren() do
            local id = building:GetAttribute("BuildingId")
            local name = building.Name:lower()

            if building:IsA("Model") and not name:find("sign", 1, true) then
                local generatedId = self:GetId(building)

                lists.Buildings[#lists.Buildings + 1] = {
                    Instance = building,
                    Label = id ~= nil
                        and formatName(building.Name) .. " #" .. tostring(id)
                        or formatName(building.Name) .. " (Landmark #" .. generatedId .. ")",
                    Order = tonumber(id) or 1000000000 + generatedId,
                }
            end
        end
    end

    if npcs then
        for _, npc in CollectionService:GetTagged("NPC") do
            local humanoid = npc:IsA("Model") and npc:FindFirstChildOfClass("Humanoid")
            local root = npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart")

            if npc:IsA("Model") and npc:IsDescendantOf(npcs) and humanoid and root and humanoid.Health > 0 then
                lists.NPCs[#lists.NPCs + 1] = {
                    Instance = npc,
                    Label = formatName(npc.Name) .. " #" .. self:GetId(npc),
                    Order = self:GetId(npc),
                }
            end
        end
    end

    if vehicles then
        for _, vehicle in CollectionService:GetTagged("Vehicle") do
            local part = vehicle:IsA("Model")
                and (getVehicleChassis(vehicle) or getVehicleSeat(vehicle) or vehicle:FindFirstChildWhichIsA("BasePart", true))

            if vehicle:IsA("Model") and vehicle:IsDescendantOf(vehicles) and part then
                local label = formatName(vehicle.Name)

                if CollectionService:HasTag(vehicle, "MainVehicle") then
                    label ..= " (Your Vehicle)"
                end

                lists.Vehicles[#lists.Vehicles + 1] = {
                    Instance = vehicle,
                    Label = label .. " #" .. self:GetId(vehicle),
                    Order = self:GetId(vehicle),
                }
            end
        end
    end

    for _, targetPlayer in Players:GetPlayers() do
        if targetPlayer ~= player then
            local label = targetPlayer.Name

            if targetPlayer.DisplayName ~= targetPlayer.Name then
                label = targetPlayer.DisplayName .. " (@" .. targetPlayer.Name .. ")"
            end

            lists.Players[#lists.Players + 1] = {
                Instance = targetPlayer,
                Label = label,
                Order = targetPlayer.UserId,
            }
        end
    end

    for kind, entries in lists do
        table.sort(entries, function(a, b)
            if a.Order == b.Order then
                return a.Label < b.Label
            end

            return a.Order < b.Order
        end)

        local values = { "None" }
        local targets = {}

        for _, entry in entries do
            values[#values + 1] = entry.Label
            targets[entry.Label] = entry.Instance
        end

        self.Maps[kind] = targets

        local signature = table.concat(values, "\0")
        local option = options[self.OptionIds[kind]]

        if option then
            local current = option.Value

            if force or self.Signatures[kind] ~= signature then
                option:SetValues(values)
                option:SetValue(targets[current] and current or "None")
            elseif current ~= "None" and not targets[current] then
                option:SetValue("None")
            end
        end

        self.Signatures[kind] = signature
    end
end

function teleports:GetSelected(kind)
    local option = options[self.OptionIds[kind]]
    local targets = self.Maps[kind]
    local target = option and targets and targets[option.Value]

    if not target or not target.Parent then
        notify("Select an available target.")
        return
    end

    return target
end

function teleports:GetBuildingSurface(building)
    local best
    local bestScore = -math.huge

    for _, part in building:GetDescendants() do
        if part:IsA("BasePart") and part.CanCollide and part.Transparency < 0.95 then
            local name = part.Name:lower()

            if name == "road" or name == "floor" then
                local score = part.Size.X * part.Size.Z

                if name == "road" then
                    score += 1000000000
                end

                if score > bestScore then
                    best = part
                    bestScore = score
                end
            end
        end
    end

    return best
end

function teleports:Stream(position)
    pcall(function()
        player:RequestStreamAroundAsync(position, 5)
    end)
end

function teleports:GetDestination(kind, target)
    if kind == "Players" then
        local character = target.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")

        if character and (not humanoid or not root) then
            local ok, pivot = pcall(character.GetPivot, character)

            if ok then
                self:Stream(pivot.Position)
            end

            local expires = os.clock() + 4

            repeat
                task.wait(0.15)
                humanoid = character:FindFirstChildOfClass("Humanoid")
                root = character:FindFirstChild("HumanoidRootPart")
            until humanoid and root or not character.Parent or os.clock() >= expires
        end

        if not humanoid or not root or humanoid.Health <= 0 then
            return
        end

        local position = root.Position + root.CFrame.RightVector * 4 + Vector3.yAxis * 2
        return CFrame.lookAt(position, Vector3.new(root.Position.X, position.Y, root.Position.Z))
    end

    if not target:IsDescendantOf(workspace) then
        return
    end

    if kind == "NPCs" then
        local humanoid = target:FindFirstChildOfClass("Humanoid")
        local root = target:FindFirstChild("HumanoidRootPart")

        if not humanoid or not root or humanoid.Health <= 0 then
            return
        end

        local position = root.Position + root.CFrame.RightVector * 4 + Vector3.yAxis * 2
        return CFrame.lookAt(position, Vector3.new(root.Position.X, position.Y, root.Position.Z))
    end

    if kind == "Vehicles" then
        local part = getVehicleChassis(target)
            or getVehicleSeat(target)
            or target:FindFirstChildWhichIsA("BasePart", true)

        if not part then
            return
        end

        self:Stream(part.Position)

        if not target:IsDescendantOf(workspace) then
            return
        end

        local ok, boxCFrame, boxSize = pcall(target.GetBoundingBox, target)

        if not ok or typeof(boxCFrame) ~= "CFrame" or typeof(boxSize) ~= "Vector3" then
            return
        end

        local half = boxSize * 0.5
        local top = boxCFrame.Position.Y
            + math.abs(boxCFrame.RightVector.Y) * half.X
            + math.abs(boxCFrame.UpVector.Y) * half.Y
            + math.abs(boxCFrame.LookVector.Y) * half.Z
        local position = Vector3.new(boxCFrame.Position.X, top + 6, boxCFrame.Position.Z)
        local look = Vector3.new(boxCFrame.LookVector.X, 0, boxCFrame.LookVector.Z)

        if look.Magnitude < 0.1 then
            look = Vector3.new(part.CFrame.LookVector.X, 0, part.CFrame.LookVector.Z)
        end

        look = look.Magnitude > 0.1 and look.Unit or Vector3.new(0, 0, -1)
        return CFrame.lookAt(position, position + look, Vector3.yAxis)
    end

    if kind == "Buildings" then
        local surface = self:GetBuildingSurface(target)
        local anchor

        if not surface then
            local ok, pivot = pcall(target.GetPivot, target)

            if ok then
                anchor = pivot
                self:Stream(pivot.Position)
            end

            local expires = os.clock() + 4

            repeat
                task.wait(0.15)
                surface = self:GetBuildingSurface(target)
            until surface or not target.Parent or os.clock() >= expires
        end

        if not surface then
            if anchor and target.Parent then
                return CFrame.new(anchor.Position + Vector3.yAxis * 8) * anchor.Rotation
            end

            return
        end

        local position = surface.Position + Vector3.yAxis * (surface.Size.Y * 0.5 + 4)
        local look = Vector3.new(surface.CFrame.LookVector.X, 0, surface.CFrame.LookVector.Z)

        if look.Magnitude < 0.1 then
            look = Vector3.new(0, 0, -1)
        end

        return CFrame.lookAt(position, position + look.Unit, Vector3.yAxis)
    end
end

function teleports:GetRoadNear(z)
    local map = workspace:FindFirstChild("Map")

    if not map then
        return
    end

    local best
    local bestDistance = math.huge
    local bestArea = 0

    for _, part in map:GetDescendants() do
        local name = part.Name:lower()
        local parentName = part.Parent and part.Parent.Name:lower()

        if part:IsA("BasePart")
            and (name == "road" or name == "sideroad" or parentName == "road")
            and not name:find("pathfinding", 1, true)
            and part.CanCollide
            and part.Transparency < 0.95
        then
            local distance = math.max(math.abs(part.Position.Z - z) - math.max(part.Size.X, part.Size.Z) * 0.5, 0)
            local area = part.Size.X * part.Size.Z

            if distance < bestDistance or distance == bestDistance and area > bestArea then
                best = part
                bestDistance = distance
                bestArea = area
            end
        end
    end

    if bestDistance <= 2000 then
        return best
    end
end

function teleports:GetEndPrompt()
    local map = workspace:FindFirstChild("Map")
    local buildings = map and map:FindFirstChild("Buildings")
    local customs = buildings and buildings:FindFirstChild("CustomsFinal")

    if not customs then
        return
    end

    local customsBuilding = customs:FindFirstChild("CustomsBuilding")
    local finalDoor = customsBuilding and customsBuilding:FindFirstChild("FinalDoor")
    local command = finalDoor and finalDoor:FindFirstChild("Command")
    local commandButton = command and command:FindFirstChild("CommandButton")
    local holder = commandButton and commandButton:FindFirstChild("Prompt")
    local prompt = holder and (holder:IsA("ProximityPrompt") and holder or holder:FindFirstChildOfClass("ProximityPrompt"))

    if prompt then
        return prompt
    end

    local ok, candidates = pcall(customs.QueryDescendants, customs, "ProximityPrompt")

    if ok then
        for _, candidate in candidates do
            if candidate.ActionText == "Activate" and candidate:FindFirstAncestor("FinalDoor") then
                return candidate
            end
        end
    end
end

function teleports:GetEndAnchor(endZ, direction)
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local source = root and root.Position or Vector3.new(500, 2000, endZ)
    local map = workspace:FindFirstChild("Map")
    local buildings = map and map:FindFirstChild("Buildings")
    local best = source
    local bestDistance = math.huge

    if buildings then
        for _, building in buildings:GetChildren() do
            if building:IsA("Model") then
                local ok, pivot = pcall(building.GetPivot, building)

                if ok then
                    if building.Name == "CustomsFinal" then
                        return pivot:PointToWorldSpace(Vector3.new(-44.4001, 4.65, -16.5))
                    end

                    local distance = math.abs(endZ - pivot.Position.Z)
                    local side = (endZ - pivot.Position.Z) * direction

                    if side >= -500 and distance < bestDistance then
                        best = pivot.Position
                        bestDistance = distance
                    end
                end
            end
        end
    end

    return Vector3.new(best.X, best.Y + 30, endZ - direction * 35)
end

function teleports:GetEndPromptDestination(prompt, direction)
    local holder = prompt and prompt.Parent
    local holderCFrame

    if holder and holder:IsA("Attachment") then
        holderCFrame = holder.WorldCFrame
    elseif holder and holder:IsA("BasePart") then
        holderCFrame = holder.CFrame
    end

    if not holderCFrame then
        return
    end

    local outward = holderCFrame.LookVector

    if outward.Z * direction > 0 then
        outward = -outward
    end

    if math.abs(outward.Z) < 0.25 then
        outward = Vector3.new(0, 0, -direction)
    end

    local position = holderCFrame.Position + outward * 4
    local params = RaycastParams.new()

    params.FilterType = Enum.RaycastFilterType.Exclude
    params.FilterDescendantsInstances = player.Character and { player.Character } or {}

    local result = workspace:Raycast(
        position + Vector3.yAxis * 20,
        Vector3.new(0, -60, 0),
        params
    )

    if result then
        position = Vector3.new(position.X, result.Position.Y + 3.25, position.Z)
    end

    return CFrame.lookAt(
        position,
        Vector3.new(holderCFrame.Position.X, position.Y, holderCFrame.Position.Z),
        Vector3.yAxis
    )
end

function teleports:ParkEndVehicle(vehicle, endZ, direction)
    local chassis = getVehicleChassis(vehicle)

    if not chassis or not vehicle.Parent then
        return
    end

    local road = self:GetRoadNear(endZ)
    local position

    if road then
        position = Vector3.new(
            road.Position.X,
            road.Position.Y + road.Size.Y * 0.5 + 4.5,
            endZ - direction * 28
        )
    else
        local map = workspace:FindFirstChild("Map")
        local buildings = map and map:FindFirstChild("Buildings")
        local customs = buildings and buildings:FindFirstChild("CustomsFinal")
        local ok
        local pivot

        if customs then
            ok, pivot = pcall(customs.GetPivot, customs)
        end

        if ok then
            position = Vector3.new(pivot.Position.X, pivot.Position.Y + 5, endZ - direction * 28)
        end
    end

    if not position then
        return
    end

    local look = Vector3.new(chassis.CFrame.LookVector.X, 0, chassis.CFrame.LookVector.Z)

    if look.Magnitude < 0.1 then
        look = Vector3.new(0, 0, direction)
    end

    self:Move(CFrame.lookAt(position, position + look.Unit, Vector3.yAxis), vehicle, false)
end

function teleports:Move(destination, subject, saveLast)
    if typeof(destination) ~= "CFrame" then
        return false
    end

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if not character or not humanoid or not root or humanoid.Health <= 0 then
        notify("Character is unavailable.")
        return false
    end

    subject = subject or character

    local mover = subject == character and root or getVehicleChassis(subject)

    if not mover or not subject.Parent then
        notify("Teleport target is unavailable.")
        return false
    end

    local oldLast = self.LastPosition

    if saveLast ~= false then
        self.LastPosition = root.CFrame
    end

    local camera = workspace.CurrentCamera
    local cameraCFrame = camera and camera.CFrame
    local cameraSubject = camera and camera.CameraSubject
    local cameraType = camera and camera.CameraType

    if camera then
        camera.CameraType = Enum.CameraType.Scriptable
        camera.CFrame = cameraCFrame
    end

    local ok, message = pcall(function()
        if subject == character and humanoid.SeatPart then
            humanoid.Sit = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
            RunService.Heartbeat:Wait()
        end

        subject:PivotTo(destination * mover.CFrame:Inverse() * subject:GetPivot())
        mover.AssemblyLinearVelocity = Vector3.zero
        mover.AssemblyAngularVelocity = Vector3.zero
        RunService.Heartbeat:Wait()
    end)

    if camera and camera.Parent then
        camera.CameraSubject = cameraSubject
        camera.CameraType = cameraType
        camera.CFrame = cameraCFrame
    end

    if not ok then
        self.LastPosition = oldLast
        notify("Teleport failed: " .. tostring(message))
        return false
    end

    return true
end

function teleports:Go(kind)
    local target = self:GetSelected(kind)

    if not target then
        return
    end

    task.spawn(function()
        local destination = self:GetDestination(kind, target)

        if not destination then
            notify("Target position is unavailable.")
            return
        end

        self:Move(destination)
    end)
end

function teleports:GetEndZ()
    local flowModule = ReplicatedStorage:FindFirstChild("FlowClient")
    local gui = flowModule and flowModule:FindFirstChild("Gui")
    local distanceModule = gui and gui:FindFirstChild("DistanceToBorderClient")

    if distanceModule then
        local ok, module = pcall(require, distanceModule)

        if ok and type(module) == "table" then
            local callback = module.SetEndPos_event or module.SetEndPos

            if type(callback) == "function" and debug and type(debug.getupvalues) == "function" then
                local read, upvalues = pcall(debug.getupvalues, callback)

                if read and type(upvalues) == "table" then
                    if type(upvalues[1]) == "number" then
                        return upvalues[1]
                    end

                    for _, value in upvalues do
                        if type(value) == "number" and math.abs(value) > 1000 then
                            return value
                        end
                    end
                end
            end
        end
    end

    local playerGui = player:FindFirstChildOfClass("PlayerGui")

    if playerGui then
        for _, label in playerGui:GetDescendants() do
            if label:IsA("TextLabel") and label.Text:find("Mexico", 1, true) then
                local current = label.Parent

                while current and current ~= playerGui do
                    local value = tonumber(current.Name:match("^Border_(-?[%d%.]+)$"))

                    if value then
                        return value
                    end

                    current = current.Parent
                end
            end
        end
    end
end

function teleports:GetStartCFrame()
    local spawn = workspace:FindFirstChildOfClass("SpawnLocation")

    if not spawn or not spawn.Enabled then
        return
    end

    local excludes = { spawn }

    if player.Character then
        excludes[#excludes + 1] = player.Character
    end

    local parameters = RaycastParams.new()

    parameters.FilterType = Enum.RaycastFilterType.Exclude
    parameters.FilterDescendantsInstances = excludes
    parameters.RespectCanCollide = true

    local result = workspace:Raycast(spawn.Position + Vector3.yAxis * 6, -Vector3.yAxis * 20, parameters)
    local y = result and result.Position.Y + 3.5 or spawn.Position.Y + 3

    return CFrame.new(spawn.Position.X, y, spawn.Position.Z) * spawn.CFrame.Rotation
end

function teleports:ToEnd()
    task.spawn(function()
        local endZ = self:GetEndZ()
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")
        local vehicle = getCurrentVehicle()
        local mover = vehicle and getVehicleChassis(vehicle) or root

        if not endZ then
            notify("End position is unavailable.")
            return
        end

        if not humanoid or not mover or humanoid.Health <= 0 then
            notify("Character is unavailable.")
            return
        end

        local start = self:GetStartCFrame()
        local direction = (not start or endZ >= start.Position.Z) and 1 or -1
        local prompt = self:GetEndPrompt()

        if prompt then
            local destination = self:GetEndPromptDestination(prompt, direction)

            if destination then
                if vehicle then
                    self.LastPosition = root.CFrame
                    self:ParkEndVehicle(vehicle, endZ, direction)
                    self:Move(destination, nil, false)
                else
                    self:Move(destination)
                end

                return
            end
        end

        local position = self:GetEndAnchor(endZ, direction)

        self:Stream(position)
        prompt = self:GetEndPrompt()

        if prompt then
            local destination = self:GetEndPromptDestination(prompt, direction)

            if destination then
                if vehicle then
                    self.LastPosition = root.CFrame
                    self:ParkEndVehicle(vehicle, endZ, direction)
                    self:Move(destination, nil, false)
                else
                    self:Move(destination)
                end

                return
            end
        end

        local road = self:GetRoadNear(endZ)

        if road then
            position = Vector3.new(
                road.Position.X,
                road.Position.Y + road.Size.Y * 0.5 + 8,
                endZ - direction * 35
            )
        end

        local look = vehicle and Vector3.new(mover.CFrame.LookVector.X, 0, mover.CFrame.LookVector.Z)
            or Vector3.new(0, 0, direction)

        if look.Magnitude < 0.1 then
            look = Vector3.new(0, 0, direction)
        end

        if not self:Move(CFrame.lookAt(position, position + look.Unit, Vector3.yAxis), vehicle or character) then
            return
        end

        mover = vehicle and getVehicleChassis(vehicle) or character:FindFirstChild("HumanoidRootPart")

        local anchored = mover and mover.Anchored

        if mover then
            mover.Anchored = true
        end

        local waited, found = pcall(function()
            local expires = os.clock() + 12
            local loaded
            local refined = false

            repeat
                loaded = self:GetEndPrompt()

                if not loaded and not refined then
                    local map = workspace:FindFirstChild("Map")
                    local buildings = map and map:FindFirstChild("Buildings")
                    local customs = buildings and buildings:FindFirstChild("CustomsFinal")
                    local ok
                    local pivot

                    if customs then
                        ok, pivot = pcall(customs.GetPivot, customs)
                    end

                    if ok then
                        refined = true
                        self:Stream(pivot.Position)
                        loaded = self:GetEndPrompt()
                    end
                end

                if not loaded then
                    task.wait(0.2)
                end
            until loaded or not character.Parent or os.clock() >= expires

            return loaded
        end)

        if mover and mover.Parent then
            mover.Anchored = anchored
        end

        if waited then
            prompt = found
        end

        if prompt then
            local destination = self:GetEndPromptDestination(prompt, direction)

            if destination then
                if vehicle then
                    self:ParkEndVehicle(vehicle, endZ, direction)
                end

                self:Move(destination, nil, false)
                return
            end
        end

        road = self:GetRoadNear(endZ)

        if road then
            if vehicle then
                self:ParkEndVehicle(vehicle, endZ, direction)
            else
                position = Vector3.new(
                    road.Position.X,
                    road.Position.Y + road.Size.Y * 0.5 + 8,
                    endZ - direction * 20
                )
                self:Move(CFrame.lookAt(position, position + Vector3.new(0, 0, direction), Vector3.yAxis), nil, false)
            end
        end

        notify("End gate button is unavailable.")
    end)
end

function teleports:ToStart()
    task.spawn(function()
        local destination = self:GetStartCFrame()

        if not destination then
            notify("Start position is unavailable.")
            return
        end

        self:Stream(destination.Position)
        self:Move(destination)
    end)
end

function teleports:ToObjective()
    local destination = player:GetAttribute("Pointy")

    if typeof(destination) ~= "CFrame" then
        notify("Objective position is unavailable.")
        return
    end

    task.spawn(function()
        destination = CFrame.new(destination.Position + Vector3.yAxis * 4) * destination.Rotation
        self:Stream(destination.Position)
        self:Move(destination)
    end)
end

function teleports:SavePosition()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if not root then
        notify("Character is unavailable.")
        return
    end

    self.SavedPosition = root.CFrame
    notify("Position saved.")
end

function teleports:ToSaved()
    if not self.SavedPosition then
        notify("Save a position first.")
        return
    end

    task.spawn(function()
        self:Stream(self.SavedPosition.Position)
        self:Move(self.SavedPosition)
    end)
end

function teleports:ToLast()
    if not self.LastPosition then
        notify("No previous position.")
        return
    end

    task.spawn(function()
        local destination = self.LastPosition

        self:Stream(destination.Position)
        self:Move(destination, nil, false)
    end)
end

function teleports:GetRefuelVehicle()
    local current = getCurrentVehicle()

    if current then
        return current
    end

    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local nearest
    local nearestDistance = 60

    if not root then
        return
    end

    for _, vehicle in CollectionService:GetTagged("Vehicle") do
        local gas = vehicle:FindFirstChild("gasLevel")
        local property = vehicle:FindFirstChild("VehicleProperty")
        local system = vehicle:FindFirstChild("system")
        local gasSystem = system and system:FindFirstChild("gas")
        local collider = gasSystem and gasSystem:FindFirstChild("collider")

        if vehicle:IsA("Model") and vehicle:IsDescendantOf(workspace) and gas and property then
            local position = collider and collider.Position or vehicle:GetPivot().Position
            local distance = (position - root.Position).Magnitude

            if distance < nearestDistance then
                nearest = vehicle
                nearestDistance = distance
            end
        end
    end

    return nearest
end

function teleports:GetRefuelSystem(vehicle)
    local system = vehicle and vehicle:FindFirstChild("system")
    local gasSystem = system and system:FindFirstChild("gas")
    local collider = gasSystem and gasSystem:FindFirstChild("collider")
    local nearest
    local nearestGun
    local nearestDistance = 4
    local nearestCenter = math.huge
    local nearestGunDistance = math.huge
    local character = player.Character
    local playerRoot = character and character:FindFirstChild("HumanoidRootPart")

    if not collider or not collider:IsA("BasePart") or not playerRoot then
        return
    end

    for _, refuelSystem in CollectionService:GetTagged("GasPump") do
        local detector = refuelSystem:FindFirstChild("DetectCarCollider")
        local gun = refuelSystem:FindFirstChild("GasGun")
        local gunRoot = gun and gun:FindFirstChild("GetTargetCol")

        if refuelSystem:IsA("Model")
            and refuelSystem:IsDescendantOf(workspace)
            and detector
            and detector:IsA("BasePart")
            and gun
            and gunRoot
        then
            local localPosition = detector.CFrame:PointToObjectSpace(collider.Position)
            local halfSize = detector.Size * 0.5
            local distance = Vector3.new(
                math.max(math.abs(localPosition.X) - halfSize.X, 0),
                math.max(math.abs(localPosition.Y) - halfSize.Y, 0),
                math.max(math.abs(localPosition.Z) - halfSize.Z, 0)
            ).Magnitude
            local centerDistance = (detector.Position - collider.Position).Magnitude
            local gunDistance = (gunRoot.Position - playerRoot.Position).Magnitude
            local betterDistance = distance < nearestDistance - 0.001
            local sameDistance = math.abs(distance - nearestDistance) <= 0.001
            local betterGun = gunDistance < nearestGunDistance - 0.001
            local sameGun = math.abs(gunDistance - nearestGunDistance) <= 0.001

            if gunDistance <= 19
                and (betterDistance or sameDistance and (betterGun or sameGun and centerDistance < nearestCenter))
            then
                nearest = refuelSystem
                nearestGun = gun
                nearestDistance = distance
                nearestCenter = centerDistance
                nearestGunDistance = gunDistance
            end
        end
    end

    return nearest, nearestGun, collider
end

function teleports:PositionRefuelGun(context, collider)
    local gun = context and context.Gun
    local heldPart = context and context.HeldPart
    local control = context and context.ControlAttachment
    local character = player.Character
    local playerRoot = character and character:FindFirstChild("HumanoidRootPart")

    if not gun
        or not gun.Parent
        or not heldPart
        or not heldPart.Parent
        or not control
        or not control.Parent
        or not collider
        or not collider.Parent
        or not playerRoot
        or flow.LocalStates.GetValue("draggedObject"):get() ~= gun
    then
        return false
    end

    local direction = playerRoot.Position - collider.Position

    if direction.Magnitude < 0.1 then
        direction = collider.CFrame.RightVector
    else
        direction = direction.Unit
    end

    control.WorldPosition = control.WorldPosition:Lerp(collider.Position + direction * 2, 0.35)
    heldPart.AssemblyLinearVelocity = Vector3.zero
    heldPart.AssemblyAngularVelocity = Vector3.zero
    return true
end

function teleports:PayRefuel(refuelSystem)
    local pay = refuelSystem and refuelSystem:FindFirstChild("PayGas")
    local click = pay and pay:FindFirstChildWhichIsA("ClickDetector", true)

    if not click then
        return false
    end

    local success = pcall(fireclickdetector, click, 0, "MouseClick")

    return success
end

function teleports:StopRefuel()
    local context = self.RefuelContext
    local dragged

    self.RefuelContext = nil

    if not context then
        return
    end

    if flow.GasPump and type(flow.GasPump.Pour) == "function" and context.System and context.System.Parent then
        pcall(flow.GasPump.Pour, context.System, false)
    end

    pcall(function()
        dragged = flow.LocalStates.GetValue("draggedObject"):get()
    end)

    if context.OwnedDrag
        and flow.Draggables
        and type(flow.Draggables.Drop) == "function"
        and dragged == context.Gun
    then
        pcall(function()
            local gun = context.Gun
            local root = gun and gun:FindFirstChild("Root")
            local assembly = root and (root.AssemblyRootPart or root)
            local gunPlacement = root and root:FindFirstChild("BasePlacementGun")
            local base = gun and gun:FindFirstChild("BasePlacement")
            local pumpPlacement = base and base:FindFirstChild("BasePlacementPump")

            if assembly and gunPlacement and pumpPlacement then
                assembly.CFrame = pumpPlacement.WorldCFrame * gunPlacement.WorldCFrame:Inverse() * assembly.CFrame
                assembly.AssemblyLinearVelocity = Vector3.zero
                assembly.AssemblyAngularVelocity = Vector3.zero
            end
        end)

        pcall(flow.Draggables.Drop)
    end
end

function teleports:StartRefuel(token, vehicle, refuelSystem, gun, collider)
    if not flow.GasPump
        or type(flow.GasPump.Pour) ~= "function"
        or not flow.Draggables
        or type(flow.Draggables.Drop) ~= "function"
    then
        return false, "Auto refuel is unavailable."
    end

    local heldPart = gun and gun:FindFirstChild("GetTargetCol")
    local character = player.Character
    local playerRoot = character and character:FindFirstChild("HumanoidRootPart")

    if not heldPart then
        return false, "Gas pump is unavailable."
    end

    if not playerRoot or (heldPart.Position - playerRoot.Position).Magnitude > 19 then
        return false, "Stand closer to the gas pump."
    end

    local dragged = flow.LocalStates.GetValue("draggedObject"):get()

    if dragged and dragged ~= gun then
        return false, "Drop the held item first."
    end

    local ownedDrag = dragged ~= gun

    if ownedDrag then
        local pickup
        local searchOk, candidates = pcall(filtergc, "function", { Name = "pickup" }, false)

        if searchOk then
            for _, candidate in candidates do
                local infoOk, source = pcall(debug.info, candidate, "s")

                if infoOk and source == "ReplicatedStorage.FlowClient.Draggables" then
                    pickup = candidate
                    break
                end
            end
        end

        local pickupOk, pickupResult = pcall(pickup, heldPart)

        if not pickupOk or not pickupResult then
            return false, "Gas pump is busy."
        end
    end

    local gas = vehicle:FindFirstChild("gasLevel")
    local context = {
        Vehicle = vehicle,
        System = refuelSystem,
        Gun = gun,
        HeldPart = heldPart,
        OwnedDrag = ownedDrag,
        LastFuel = gas and gas.Value,
        LastChange = os.clock(),
    }

    self.RefuelContext = context

    task.wait(0.15)

    if self.RefuelToken ~= token or library.Unloaded then
        self:StopRefuel()
        return false
    end

    local grab = heldPart:FindFirstChild("GrabAttachment")
    local cameraOk, cameraPart = pcall(function()
        return flow.CameraPart and flow.CameraPart.GetCameraPart()
    end)
    local control

    if cameraOk and cameraPart then
        for _, attachment in cameraPart:GetChildren() do
            local align = attachment:IsA("Attachment") and attachment:FindFirstChildOfClass("AlignPosition")

            if align and align.Attachment0 == grab then
                control = attachment
                break
            end
        end
    end

    if not grab or not control or flow.LocalStates.GetValue("draggedObject"):get() ~= gun then
        self:StopRefuel()
        return false, "Gas pump is busy."
    end

    context.ControlAttachment = control

    if not self:PositionRefuelGun(context, collider) then
        self:StopRefuel()
        return false, "Move the vehicle closer to the gas pump."
    end

    for _ = 1, 30 do
        if not self:PositionRefuelGun(context, collider) then
            self:StopRefuel()
            return false, "Move the vehicle closer to the gas pump."
        end

        task.wait(0.04)
    end

    if self.RefuelToken ~= token or self.RefuelContext ~= context or library.Unloaded then
        self:StopRefuel()
        return false
    end

    self:PayRefuel(refuelSystem)
    pcall(flow.GasPump.Pour, refuelSystem, false)
    task.wait(0.05)
    pcall(flow.GasPump.Pour, refuelSystem, true)
    return true
end

function teleports:SetAutoRefuel(value)
    self.RefuelToken = nil
    self:StopRefuel()

    if not value then
        return
    end

    local token = {}

    self.RefuelToken = token

    task.spawn(function()
        local warned = false

        while self.RefuelToken == token and not library.Unloaded do
            local vehicle = self:GetRefuelVehicle()
            local gas = vehicle and vehicle:FindFirstChild("gasLevel")
            local property = vehicle and vehicle:FindFirstChild("VehicleProperty")
            local capacity = property and property:GetAttribute("GasCapacity")

            if gas and type(capacity) == "number" and gas.Value < capacity - 0.01 then
                local refuelSystem, gun, collider = self:GetRefuelSystem(vehicle)
                local context = self.RefuelContext

                if not refuelSystem then
                    self:StopRefuel()

                    if not warned then
                        notify("Park a vehicle next to a gas pump.", 5)
                        warned = true
                    end
                elseif not context or context.Vehicle ~= vehicle or context.System ~= refuelSystem then
                    self:StopRefuel()

                    local callOk, started, message = pcall(
                        self.StartRefuel,
                        self,
                        token,
                        vehicle,
                        refuelSystem,
                        gun,
                        collider
                    )

                    if not callOk then
                        self:StopRefuel()
                        started = false
                        message = "Auto refuel failed."
                    end

                    if not started and message and not warned then
                        notify(message, 5)
                        warned = true
                    elseif started then
                        warned = false
                    end
                elseif self:PositionRefuelGun(context, collider) then
                    if gas.Value > (context.LastFuel or gas.Value) then
                        context.LastFuel = gas.Value
                        context.LastChange = os.clock()
                        warned = false
                    elseif os.clock() - context.LastChange >= 2 then
                        pcall(flow.GasPump.Pour, refuelSystem, false)
                        task.wait(0.1)
                        pcall(flow.GasPump.Pour, refuelSystem, true)
                        context.LastChange = os.clock()

                        if not warned then
                            notify("Refueling paused. Move closer or check your cash.", 5)
                            warned = true
                        end
                    end
                else
                    self:StopRefuel()
                end
            else
                self:StopRefuel()

                if not vehicle and not warned then
                    notify("Stand next to a vehicle at a gas pump.", 5)
                    warned = true
                elseif vehicle and (not gas or type(capacity) ~= "number") and not warned then
                    notify("This vehicle cannot be refueled.", 5)
                    warned = true
                elseif vehicle and gas and type(capacity) == "number" then
                    warned = false
                end
            end

            task.wait(0.1)
        end

        if self.RefuelToken == token then
            self.RefuelToken = nil
            self:StopRefuel()
        end
    end)
end

function teleports:Destroy()
    self:SetAutoRefuel(false)
    table.clear(self.Maps)
    table.clear(self.Signatures)
    table.clear(self.Ids)
    self.LastPosition = nil
    self.SavedPosition = nil

    if library.Teleports == self then
        library.Teleports = nil
    end
end

local function stopVehicle(vehicle)
    local chassis = getVehicleChassis(vehicle)

    if not chassis then
        return
    end

    local token = {}
    local motors = {}

    vehicleStopToken = token

    for _, constraint in vehicle:QueryDescendants("HingeConstraint") do
        if constraint.ActuatorType == Enum.ActuatorType.Motor then
            motors[#motors + 1] = constraint
        end
    end

    task.spawn(function()
        local expires = os.clock() + 1.5

        while vehicleStopToken == token
            and not library.Unloaded
            and vehicle.Parent
            and chassis.Parent
            and os.clock() < expires
        do
            chassis.AssemblyLinearVelocity = Vector3.zero
            chassis.AssemblyAngularVelocity = Vector3.zero

            for _, motor in motors do
                if motor.Parent then
                    motor.AngularVelocity = 0
                end
            end

            RunService.PreSimulation:Wait()
        end

        if vehicleStopToken == token then
            vehicleStopToken = nil
        end
    end)
end

local function getMainVehicle()
    for _, vehicle in CollectionService:GetTagged("MainVehicle") do
        if vehicle:IsA("Model") and vehicle:IsDescendantOf(workspace) then
            return vehicle
        end
    end
end

local function blockedVehicleDamage(vehicle, ...)
    local protectedVehicle = getCurrentVehicle() or getMainVehicle()

    if protectedVehicle and vehicle == protectedVehicle then
        return
    end

    return originalVehicleDamage(vehicle, ...)
end

local function blockVehicleDamage(value)
    if not flow.DamageVehicle or type(originalVehicleDamage) ~= "function" then
        return
    end

    if value then
        flow.DamageVehicle.Damage = blockedVehicleDamage
    elseif flow.DamageVehicle.Damage == blockedVehicleDamage then
        flow.DamageVehicle.Damage = originalVehicleDamage
    end
end

local function getVehicleState(vehicle)
    local state = vehicleStates[vehicle]

    if state and state.Property.Parent then
        return state
    end

    local property = vehicle:FindFirstChild("VehicleProperty")

    if not property then
        return
    end

    state = {
        Property = property,
        Attributes = {},
        Wheels = {},
        PerformanceApplied = false,
        GripApplied = false,
        FuelApplied = false,
    }

    for _, name in vehicleAttributeNames do
        state.Attributes[name] = property:GetAttribute(name)
    end

    local system = vehicle:FindFirstChild("system")

    for _, cornerName in vehicleCorners do
        local corner = system and system:FindFirstChild(cornerName)
        local wheel = corner and corner:FindFirstChild("wheel_" .. cornerName)

        if wheel and wheel:IsA("BasePart") then
            state.Wheels[#state.Wheels + 1] = {
                Part = wheel,
                Properties = wheel.CustomPhysicalProperties,
            }
        end
    end

    vehicleStates[vehicle] = state
    return state
end

function library.VehicleMods:ApplyFuel(vehicle)
    local state = getVehicleState(vehicle)
    local gas = vehicle and vehicle:FindFirstChild("gasLevel")
    local capacity = state and state.Property:GetAttribute("GasCapacity")

    if not state or not gas or not gas:IsA("NumberValue") or type(capacity) ~= "number" then
        return
    end

    if not state.FuelApplied or gas.Value ~= capacity then
        state.FuelValue = gas.Value
    end

    gas.Value = capacity
    state.FuelApplied = true
end

function library.VehicleMods:RestoreFuel(vehicle)
    local state = vehicleStates[vehicle]

    if not state or not state.FuelApplied then
        return
    end

    local gas = vehicle and vehicle:FindFirstChild("gasLevel")

    if gas and gas:IsA("NumberValue") and state.FuelValue ~= nil then
        gas.Value = state.FuelValue
    end

    state.FuelApplied = false
    state.FuelValue = nil
end

local function restoreVehiclePerformance(vehicle)
    local state = vehicleStates[vehicle]

    if not state or not state.PerformanceApplied or not state.Property.Parent then
        return
    end

    for name, value in state.Attributes do
        state.Property:SetAttribute(name, value)
    end

    state.PerformanceApplied = false
end

local function restoreVehicleGrip(vehicle)
    local state = vehicleStates[vehicle]

    if not state or not state.GripApplied then
        return
    end

    for _, entry in state.Wheels do
        if entry.Part.Parent then
            entry.Part.CustomPhysicalProperties = entry.Properties
        end
    end

    state.GripApplied = false
end

local function restoreVehicle(vehicle)
    restoreVehiclePerformance(vehicle)
    restoreVehicleGrip(vehicle)
    library.VehicleMods:RestoreFuel(vehicle)
end

local function restoreAllVehiclePerformance()
    for vehicle in vehicleStates do
        restoreVehiclePerformance(vehicle)
    end
end

local function restoreAllVehicleGrip()
    for vehicle in vehicleStates do
        restoreVehicleGrip(vehicle)
    end
end

local function restoreAllVehicles()
    for vehicle in vehicleStates do
        restoreVehicle(vehicle)
    end

    activeVehicle = nil
    vehicleStopToken = nil
end

local function setVehicleMultiplier(property, attributes, name, multiplier)
    local value = attributes[name]

    if type(value) == "number" then
        property:SetAttribute(name, value * multiplier)
    end
end

local function applyVehiclePerformance(vehicle)
    local state = getVehicleState(vehicle)

    if not state then
        return
    end

    local property = state.Property
    local attributes = state.Attributes
    local topSpeed = options.RunawaysVehicleTopSpeedMultiplier.Value
    local acceleration = options.RunawaysVehicleAccelerationMultiplier.Value
    local torque = options.RunawaysVehicleTorqueMultiplier.Value
    local brakes = options.RunawaysVehicleBrakeMultiplier.Value
    local steering = options.RunawaysVehicleSteeringMultiplier.Value
    local downforce = options.RunawaysVehicleDownforceMultiplier.Value

    if state.PerformanceApplied
        and state.TopSpeedMultiplier == topSpeed
        and state.AccelerationMultiplier == acceleration
        and state.TorqueMultiplier == torque
        and state.BrakeMultiplier == brakes
        and state.SteeringMultiplier == steering
        and state.DownforceMultiplier == downforce
    then
        return
    end

    setVehicleMultiplier(property, attributes, "TopSpeedMPH", topSpeed)
    setVehicleMultiplier(property, attributes, "Acceleration", acceleration)
    setVehicleMultiplier(property, attributes, "Torque", torque)
    setVehicleMultiplier(property, attributes, "BrakingPower", brakes)
    setVehicleMultiplier(property, attributes, "TurningAngle", steering)
    setVehicleMultiplier(property, attributes, "Downforce", downforce)

    if type(attributes.TurningAngleSpeedFactor) == "number" then
        property:SetAttribute(
            "TurningAngleSpeedFactor",
            math.clamp(attributes.TurningAngleSpeedFactor * steering, 0, 1)
        )
    end

    state.PerformanceApplied = true
    state.TopSpeedMultiplier = topSpeed
    state.AccelerationMultiplier = acceleration
    state.TorqueMultiplier = torque
    state.BrakeMultiplier = brakes
    state.SteeringMultiplier = steering
    state.DownforceMultiplier = downforce
end

local function applyVehicleGrip(vehicle)
    local state = getVehicleState(vehicle)

    if not state then
        return
    end

    local grip = options.RunawaysVehicleTireGrip.Value

    if state.GripApplied and state.GripValue == grip then
        return
    end

    for _, entry in state.Wheels do
        local wheel = entry.Part

        if wheel.Parent then
            local properties = entry.Properties or wheel.CurrentPhysicalProperties

            wheel.CustomPhysicalProperties = PhysicalProperties.new(
                properties.Density,
                grip,
                properties.Elasticity,
                properties.FrictionWeight,
                properties.ElasticityWeight
            )
        end
    end

    state.GripApplied = true
    state.GripValue = grip
end

local function applyVehicleSettings()
    local vehicle = getCurrentVehicle()

    if activeVehicle and activeVehicle ~= vehicle then
        restoreVehicle(activeVehicle)
    end

    activeVehicle = vehicle

    if vehicle then
        if toggles.RunawaysVehiclePerformance and toggles.RunawaysVehiclePerformance.Value then
            applyVehiclePerformance(vehicle)
        else
            restoreVehiclePerformance(vehicle)
        end

        if toggles.RunawaysVehicleTireGripOverride and toggles.RunawaysVehicleTireGripOverride.Value then
            applyVehicleGrip(vehicle)
        else
            restoreVehicleGrip(vehicle)
        end

        if toggles.RunawaysVehicleInfiniteFuel and toggles.RunawaysVehicleInfiniteFuel.Value then
            library.VehicleMods:ApplyFuel(vehicle)
        else
            library.VehicleMods:RestoreFuel(vehicle)
        end
    end

    local utilityVehicle = vehicle or getMainVehicle()
    local indestructible = toggles.RunawaysVehicleIndestructible and toggles.RunawaysVehicleIndestructible.Value

    blockVehicleDamage(indestructible)

    if not utilityVehicle then
        return
    end

    local property = utilityVehicle:FindFirstChild("VehicleProperty")

    if indestructible then
        local health = utilityVehicle:FindFirstChild("vehicleHealth")
        local maxHealth = property and property:GetAttribute("MaxHealth")

        if health and type(maxHealth) == "number" then
            health.Value = maxHealth
        end
    end
end

local function getHumanoidState(humanoid)
    local state = humanoidStates[humanoid]

    if not state then
        state = {}
        humanoidStates[humanoid] = state
    end

    return state
end

local function restoreSpeed()
    for humanoid, state in humanoidStates do
        if state.WalkSpeed ~= nil then
            if humanoid.Parent then
                humanoid.WalkSpeed = state.WalkSpeed
            end

            state.WalkSpeed = nil
        end
    end
end

local function restoreJumpPower()
    for humanoid, state in humanoidStates do
        if state.UseJumpPower ~= nil then
            if humanoid.Parent then
                humanoid.JumpPower = state.JumpPower
                humanoid.JumpHeight = state.JumpHeight
                humanoid.UseJumpPower = state.UseJumpPower
            end

            state.UseJumpPower = nil
            state.JumpPower = nil
            state.JumpHeight = nil
        end
    end
end

local function restoreCollisions()
    for part, canCollide in collisionStates do
        if part.Parent then
            part.CanCollide = canCollide
        end
    end

    table.clear(collisionStates)
end

local function restoreFOV()
    for camera, fieldOfView in cameraStates do
        if camera.Parent then
            camera.FieldOfView = fieldOfView
        end
    end

    table.clear(cameraStates)
end

local function restoreGravity()
    if gravityState ~= nil then
        workspace.Gravity = gravityState
        gravityState = nil
    end
end

local function blockDamage(value)
    if flow.PlayerDamage and type(originalTakeDamage) == "function" then
        if value then
            flow.PlayerDamage.TakeDamage = blockedRemote
        elseif flow.PlayerDamage.TakeDamage == blockedRemote then
            flow.PlayerDamage.TakeDamage = originalTakeDamage
        end
    end

    if flow.Passout and type(originalAbandon) == "function" then
        if value then
            flow.Passout.Abandon = blockedRemote
        elseif flow.Passout.Abandon == blockedRemote then
            flow.Passout.Abandon = originalAbandon
        end
    end
end

local function restoreGodMode()
    blockDamage(false)

    for humanoid, state in humanoidStates do
        local original = state.GodMode

        if original then
            if humanoid.Parent then
                humanoid.BreakJointsOnDeath = original.BreakJointsOnDeath
                humanoid.RequiresNeck = original.RequiresNeck
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, original.DeadEnabled)
            end

            state.GodMode = nil
        end
    end
end

local function applyGodMode(humanoid)
    local state = getHumanoidState(humanoid)

    if not state.GodMode then
        state.GodMode = {
            BreakJointsOnDeath = humanoid.BreakJointsOnDeath,
            RequiresNeck = humanoid.RequiresNeck,
            DeadEnabled = humanoid:GetStateEnabled(Enum.HumanoidStateType.Dead),
        }
    end

    blockDamage(true)
    humanoid.BreakJointsOnDeath = false
    humanoid.RequiresNeck = false
    humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    humanoid.Health = humanoid.MaxHealth

    if humanoid:GetAttribute("Downed") == true then
        humanoid:SetAttribute("Downed", false)
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end

local function applyPlayerSettings()
    local humanoid = getHumanoid()

    if humanoid
        and (toggles.RunawaysPlayerGodMode and toggles.RunawaysPlayerGodMode.Value
            or library.AutoFarm and library.AutoFarm.Running and library.AutoFarm:GetContext() == "Game")
    then
        applyGodMode(humanoid)
    end

    if humanoid and humanoid.Health > 0 then
        local state = getHumanoidState(humanoid)

        if toggles.RunawaysPlayerSpeedBoost and toggles.RunawaysPlayerSpeedBoost.Value then
            if state.WalkSpeed == nil then
                state.WalkSpeed = humanoid.WalkSpeed
            end

            humanoid.WalkSpeed = options.RunawaysPlayerWalkSpeed.Value
        end

        if toggles.RunawaysPlayerJumpPowerOverride and toggles.RunawaysPlayerJumpPowerOverride.Value then
            if state.UseJumpPower == nil then
                state.UseJumpPower = humanoid.UseJumpPower
                state.JumpPower = humanoid.JumpPower
                state.JumpHeight = humanoid.JumpHeight
            end

            humanoid.UseJumpPower = true
            humanoid.JumpPower = options.RunawaysPlayerJumpPower.Value
        end
    end

    if toggles.RunawaysPlayerNoclip and toggles.RunawaysPlayerNoclip.Value then
        local character = player.Character

        if character then
            for _, part in character:QueryDescendants("BasePart") do
                if collisionStates[part] == nil then
                    collisionStates[part] = part.CanCollide
                end

                part.CanCollide = false
            end
        end
    end

    if toggles.RunawaysPlayerGravityOverride and toggles.RunawaysPlayerGravityOverride.Value then
        if gravityState == nil then
            gravityState = workspace.Gravity
        end

        workspace.Gravity = options.RunawaysPlayerGravity.Value
    end

    applyVehicleSettings()
end

local weaponRuntimeSearchAt = 0
local weaponRuntimeAttempts = 0
local weaponRuntimeSignature = ""
local weaponSourceNames = {
    Guns = true,
    RPG7 = true,
    GrenadeLauncher = true,
    Minigun = true,
    Flamethrower = true,
}

local function weaponToggle(name)
    return toggles[name] and toggles[name].Value == true
end

local function getWeaponConfig(tool)
    if not tool or not tool:IsA("Tool") then
        return
    end

    local name = tool:GetAttribute("BaseTool") or tool.Name
    local success, config = pcall(data.Tools.GetToolConfig, name)

    if not success or type(config) ~= "table" then
        return
    end

    if type(config.magCapacity) ~= "number"
        or type(config.recoilPattern) ~= "table"
        or type(config.maxRpm) ~= "number"
    then
        return
    end

    return config
end

local function getWeaponConfigState(config)
    local state = weaponConfigStates[config]

    if state then
        return state
    end

    state = {
        HasMaxRpm = config.maxRpm ~= nil,
        MaxRpm = config.maxRpm,
        HasMode = config.mode ~= nil,
        Mode = config.mode,
        HasPushForce = config.pushForce ~= nil,
        PushForce = config.pushForce,
    }
    weaponConfigStates[config] = state

    return state
end

local function applyWeaponConfig(config, state)
    local noCooldown = weaponToggle("RunawaysWeaponNoCooldown")
    local automatic = weaponToggle("RunawaysWeaponAutomatic")
    local noPushback = weaponToggle("RunawaysWeaponNoPushback")
    local signature = table.concat({ tostring(noCooldown), tostring(automatic), tostring(noPushback) }, ":")

    if state.Signature == signature then
        return
    end

    if state.HasMaxRpm then
        config.maxRpm = noCooldown and math.huge or state.MaxRpm
    end

    if state.HasMode then
        config.mode = automatic and "auto" or state.Mode
    end

    if noPushback then
        config.pushForce = nil
    elseif state.HasPushForce then
        config.pushForce = state.PushForce
    else
        config.pushForce = nil
    end

    state.Signature = signature
end

local function restoreWeaponConfigs()
    for config, state in weaponConfigStates do
        if state.HasMaxRpm then
            config.maxRpm = state.MaxRpm
        end

        if state.HasMode then
            config.mode = state.Mode
        end

        if state.HasPushForce then
            config.pushForce = state.PushForce
        else
            config.pushForce = nil
        end

        state.Signature = nil
    end
end

local function getWeaponSource(target)
    if type(target) ~= "function" or type(debug.info) ~= "function" then
        return
    end

    local success, source = pcall(debug.info, target, "s")

    if not success or type(source) ~= "string" then
        return
    end

    for name in weaponSourceNames do
        if source:find("FlowClient.Tools." .. name, 1, true) then
            return name
        end
    end
end

local function functionList(value)
    if type(value) == "function" then
        return { value }
    end

    local list = {}

    if type(value) == "table" then
        for _, entry in value do
            if type(entry) == "function" then
                list[#list + 1] = entry
            end
        end
    end

    return list
end

local function findGCFunctions(name, upvalues)
    if type(filtergc) ~= "function" then
        return {}
    end

    local success, result = pcall(filtergc, "function", {
        Name = name,
        Upvalues = upvalues,
    }, false)

    return success and functionList(result) or {}
end

local function getUpvalues(target)
    if type(target) ~= "function" or type(debug.getupvalues) ~= "function" then
        return {}
    end

    local success, values = pcall(debug.getupvalues, target)

    return success and values or {}
end

local function discoverWeaponRuntime(tool, config, configState)
    if type(debug.setupvalue) ~= "function" then
        return
    end

    local runtime = {
        Tool = tool,
        Config = config,
        Fires = {},
        Shoots = {},
    }
    local fireSeen = {}
    local shootSeen = {}

    for _, fire in findGCFunctions("fire", { tool }) do
        local source = getWeaponSource(fire)

        if source and not fireSeen[fire] then
            fireSeen[fire] = true

            local ammoIndex = source == "Flamethrower" and 9 or 1
            local success, ammo = pcall(debug.getupvalue, fire, ammoIndex)

            if success and type(ammo) == "number" then
                runtime.Fires[#runtime.Fires + 1] = {
                    Function = fire,
                    Index = ammoIndex,
                }
            end

            for _, shoot in findGCFunctions("shoot", { fire }) do
                if getWeaponSource(shoot) and not shootSeen[shoot] then
                    shootSeen[shoot] = true

                    local entry = {
                        Function = shoot,
                        Rpm = {},
                        Mode = {},
                    }

                    for index, value in getUpvalues(shoot) do
                        if configState.HasMaxRpm
                            and type(value) == "number"
                            and (value == configState.MaxRpm or value == config.maxRpm)
                        then
                            entry.Rpm[#entry.Rpm + 1] = index
                        elseif configState.HasMode
                            and type(value) == "string"
                            and (value == configState.Mode or value == config.mode)
                        then
                            entry.Mode[#entry.Mode + 1] = index
                        end
                    end

                    runtime.Shoots[#runtime.Shoots + 1] = entry
                end
            end
        end
    end

    if #runtime.Fires == 0 and #runtime.Shoots == 0 then
        return
    end

    return runtime
end

local function setRuntimeUpvalue(target, index, value)
    pcall(debug.setupvalue, target, index, value)
end

function punchMods:FindFunction(force)
    local character = player.Character

    if self.Character ~= character then
        self.Character = character
        self.Function = nil
        self.SpeedIndex = nil
        self.LastSearch = 0
    end

    if self.Function then
        return self.Function
    end

    if not character or not force and os.clock() - self.LastSearch < 0.5 then
        return
    end

    self.LastSearch = os.clock()

    for _, target in findGCFunctions("doPunch") do
        local values = getUpvalues(target)

        if values[2] == character and values[16] == self.Config and type(values[19]) == "number" then
            self.Function = target
            self.SpeedIndex = 19

            return target
        end
    end
end

function punchMods:GetConfigState(config)
    local state = self.ConfigStates[config]

    if not state then
        state = {
            Damage = config.damage,
            Speed = config.hitsPerSecond,
            ObjectDamage = config.destructibleDamage,
        }
        self.ConfigStates[config] = state
    end

    return state
end

function punchMods:FindMeleeFunction(force)
    local character = player.Character
    local tool = character and character:FindFirstChildOfClass("Tool")

    if not tool or not tool:HasTag("Melee") then
        tool = nil
    end

    if self.MeleeTool ~= tool then
        self.MeleeTool = tool
        self.MeleeConfig = nil
        self.MeleeFunction = nil
        self.MeleeSpeedIndex = nil
        self.MeleeLastSearch = 0
    end

    if self.MeleeFunction then
        return self.MeleeFunction
    end

    if not tool or not force and os.clock() - self.MeleeLastSearch < 0.5 then
        return
    end

    self.MeleeLastSearch = os.clock()

    local baseTool = tool:GetAttribute("BaseTool")
    local config = data.Tools.GetToolConfig(tool.Name) or type(baseTool) == "string" and data.Tools.GetToolConfig(baseTool)

    if type(config) ~= "table"
        or type(config.damage) ~= "number"
        or type(config.hitsPerSecond) ~= "number"
        or type(config.destructibleDamage) ~= "number"
    then
        return
    end

    self.MeleeConfig = config
    self:GetConfigState(config)

    for _, target in findGCFunctions("doSwing", { tool }) do
        local values = getUpvalues(target)

        if values[7] == tool and values[12] == config and type(values[15]) == "number" then
            self.MeleeFunction = target
            self.MeleeSpeedIndex = 15
            self.MeleeRuntimes[target] = {
                Config = config,
                Index = 15,
            }

            return target
        end
    end
end

function punchMods:Apply(force)
    local enabled = toggles.RunawaysPunchMods and toggles.RunawaysPunchMods.Value
    local damage = self.Defaults.Damage
    local speed = self.Defaults.Speed
    local objectDamage = self.Defaults.ObjectDamage

    if enabled then
        damage = options.RunawaysPunchDamage.Value
        speed = toggles.RunawaysPunchNoCooldown.Value and math.huge or options.RunawaysPunchSpeed.Value
        objectDamage = options.RunawaysPunchObjectDamage.Value
    end

    for _, config in self.Configs do
        local state = self:GetConfigState(config)

        config.damage = enabled and damage or state.Damage
        config.hitsPerSecond = enabled and speed or state.Speed
        config.destructibleDamage = enabled and objectDamage or state.ObjectDamage
    end

    local target = self:FindFunction(force)

    if target and self.SpeedIndex and type(debug.getupvalue) == "function" then
        local success, current = pcall(debug.getupvalue, target, self.SpeedIndex)

        if success and current ~= speed then
            setRuntimeUpvalue(target, self.SpeedIndex, speed)
        end
    end

    local meleeTarget = self:FindMeleeFunction(force)

    if meleeTarget and self.MeleeSpeedIndex and self.MeleeConfig and type(debug.getupvalue) == "function" then
        local state = self:GetConfigState(self.MeleeConfig)
        local meleeSpeed = enabled and speed or state.Speed
        local success, current = pcall(debug.getupvalue, meleeTarget, self.MeleeSpeedIndex)

        if success and current ~= meleeSpeed then
            setRuntimeUpvalue(meleeTarget, self.MeleeSpeedIndex, meleeSpeed)
        end
    end
end

function punchMods:Restore()
    for config, state in self.ConfigStates do
        config.damage = state.Damage
        config.hitsPerSecond = state.Speed
        config.destructibleDamage = state.ObjectDamage
    end

    if self.Function and self.SpeedIndex then
        setRuntimeUpvalue(self.Function, self.SpeedIndex, self.Defaults.Speed)
    end

    for target, runtime in self.MeleeRuntimes do
        local state = self.ConfigStates[runtime.Config]

        if state then
            setRuntimeUpvalue(target, runtime.Index, state.Speed)
        end
    end

    self.Character = nil
    self.Function = nil
    self.SpeedIndex = nil
    self.LastSearch = 0
    self.MeleeTool = nil
    self.MeleeConfig = nil
    self.MeleeFunction = nil
    self.MeleeSpeedIndex = nil
    self.MeleeLastSearch = 0
    self.MeleeRuntimes = setmetatable({}, { __mode = "k" })
end

local function setRuntimeAmmo(runtime, value)
    if not runtime or type(value) ~= "number" then
        return
    end

    for _, entry in runtime.Fires do
        setRuntimeUpvalue(entry.Function, entry.Index, value)
    end
end

local function restoreWeaponRuntime()
    local runtime = activeWeaponRuntime

    if not runtime then
        return
    end

    local ammo = runtime.Tool and runtime.Tool:GetAttribute("Ammo")

    if type(ammo) == "number" then
        setRuntimeAmmo(runtime, ammo)
    end

    local state = weaponConfigStates[runtime.Config]

    for _, entry in runtime.Shoots do
        if state then
            for _, index in entry.Rpm do
                setRuntimeUpvalue(entry.Function, index, state.MaxRpm)
            end

            for _, index in entry.Mode do
                setRuntimeUpvalue(entry.Function, index, state.Mode)
            end
        end
    end

    activeWeaponRuntime = nil
end

local function getWeaponCapacity(tool, config)
    return math.max(tonumber(config.magCapacity) or tonumber(tool:GetAttribute("MaxAmmo")) or tonumber(tool:GetAttribute("Ammo")) or 1, 1)
end

local function applyWeaponRuntime(runtime, configState)
    local noCooldown = weaponToggle("RunawaysWeaponNoCooldown")
    local automatic = weaponToggle("RunawaysWeaponAutomatic")

    for _, entry in runtime.Shoots do
        for _, index in entry.Rpm do
            setRuntimeUpvalue(entry.Function, index, noCooldown and math.huge or configState.MaxRpm)
        end

        for _, index in entry.Mode do
            setRuntimeUpvalue(entry.Function, index, automatic and "auto" or configState.Mode)
        end
    end

    if weaponToggle("RunawaysWeaponInfiniteAmmo") then
        setRuntimeAmmo(runtime, getWeaponCapacity(runtime.Tool, runtime.Config))
        runtime.InfiniteAmmo = true
    elseif runtime.InfiniteAmmo then
        local ammo = runtime.Tool:GetAttribute("Ammo")

        if type(ammo) == "number" then
            setRuntimeAmmo(runtime, ammo)
        end

        runtime.InfiniteAmmo = false
    end
end

local function applyWeaponSettings()
    for config, state in weaponConfigStates do
        applyWeaponConfig(config, state)
    end

    local character = player.Character
    local tool = character and character:FindFirstChildOfClass("Tool")
    local config = getWeaponConfig(tool)

    if not config then
        tool = nil
    end

    if tool ~= activeWeaponTool then
        restoreWeaponRuntime()
        activeWeaponTool = tool
        activeWeaponConfig = config
        weaponRuntimeSearchAt = 0
        weaponRuntimeAttempts = 0
    else
        activeWeaponConfig = config
    end

    if not tool or not config then
        return
    end

    local configState = getWeaponConfigState(config)

    applyWeaponConfig(config, configState)

    local needsRuntime = weaponToggle("RunawaysWeaponInfiniteAmmo")
        or weaponToggle("RunawaysWeaponNoCooldown")
        or weaponToggle("RunawaysWeaponAutomatic")
    local runtimeSignature = table.concat({
        tostring(weaponToggle("RunawaysWeaponInfiniteAmmo")),
        tostring(weaponToggle("RunawaysWeaponNoCooldown")),
        tostring(weaponToggle("RunawaysWeaponAutomatic")),
    }, ":")

    if runtimeSignature ~= weaponRuntimeSignature then
        weaponRuntimeSignature = runtimeSignature
        weaponRuntimeSearchAt = 0
        weaponRuntimeAttempts = 0
    end

    if needsRuntime and not activeWeaponRuntime and os.clock() >= weaponRuntimeSearchAt then
        weaponRuntimeAttempts += 1
        weaponRuntimeSearchAt = os.clock() + (weaponRuntimeAttempts <= 3 and 0.2 or 1.5)
        activeWeaponRuntime = discoverWeaponRuntime(tool, config, configState)
    end

    if activeWeaponRuntime then
        applyWeaponRuntime(activeWeaponRuntime, configState)
    end
end

local function weaponSetAmmo(tool, value, ...)
    if weaponToggle("RunawaysWeaponInfiniteAmmo")
        and tool == activeWeaponTool
        and activeWeaponRuntime
        and activeWeaponConfig
    then
        setRuntimeAmmo(activeWeaponRuntime, getWeaponCapacity(tool, activeWeaponConfig))
        return
    end

    return originalSetAmmo(tool, value, ...)
end

local function weaponSubtractReserve(config, value, ...)
    if weaponToggle("RunawaysWeaponInfiniteAmmo") and config == activeWeaponConfig then
        return
    end

    return originalSubtractReserve(config, value, ...)
end

local function weaponCameraRecoil(...)
    if weaponToggle("RunawaysWeaponNoRecoil") then
        return
    end

    return originalCameraRecoil(...)
end

local function weaponViewmodelRecoil(...)
    if weaponToggle("RunawaysWeaponNoRecoil") then
        return
    end

    return originalViewmodelRecoil(...)
end

local function weaponRadialFalloff(...)
    if weaponToggle("RunawaysWeaponNoSpread") and type(debug.info) == "function" then
        local caller = debug.info(2, "f")

        if getWeaponSource(caller) then
            return Vector2.zero
        end
    end

    return originalRadialFalloff(...)
end

local drawingLibrary = Drawing
local drawingAvailable = type(drawingLibrary) == "table" and type(drawingLibrary.new) == "function"
local espRenderName = "RUNAWAYS_ESP"
local silentAimRenderName = "RUNAWAYS_SilentAimFOV"
local silentAimCircle
local silentAimTargets = {}
local silentAimLastScan = 0
local silentAimRandom = Random.new()
local espScanToken
local espTargets = {
    Items = {},
    NPCs = {},
    Players = {},
    Vehicles = {},
    Safes = {},
}
local espVisuals = {
    Items = {},
    NPCs = {},
    Players = {},
    Vehicles = {},
    Safes = {},
}
local espConfig = {
    Items = {
        Toggle = "RunawaysESPItems",
        Color = "RunawaysESPItemColor",
        Box = "RunawaysESPItemBox",
        Tracer = "RunawaysESPItemTracer",
        Distance = "RunawaysESPItemDistance",
        Range = "RunawaysESPItemMaxDistance",
    },
    NPCs = {
        Toggle = "RunawaysESPNPCs",
        Color = "RunawaysESPNPCColor",
        Box = "RunawaysESPNPCBox",
        Tracer = "RunawaysESPNPCTracer",
        HealthBar = "RunawaysESPNPCHealthBar",
        Distance = "RunawaysESPNPCDistance",
        Range = "RunawaysESPNPCMaxDistance",
    },
    Players = {
        Toggle = "RunawaysESPPlayers",
        Color = "RunawaysESPPlayerColor",
        Box = "RunawaysESPPlayerBox",
        Tracer = "RunawaysESPPlayerTracer",
        HealthBar = "RunawaysESPPlayerHealthBar",
        Distance = "RunawaysESPPlayerDistance",
        Range = "RunawaysESPPlayerMaxDistance",
    },
    Vehicles = {
        Toggle = "RunawaysESPVehicles",
        Color = "RunawaysESPVehicleColor",
        Box = "RunawaysESPVehicleBox",
        Tracer = "RunawaysESPVehicleTracer",
        Distance = "RunawaysESPVehicleDistance",
        Range = "RunawaysESPVehicleMaxDistance",
    },
    Safes = {
        Toggle = "RunawaysESPSafes",
        Color = "RunawaysESPSafeColor",
        Box = "RunawaysESPSafeBox",
        Tracer = "RunawaysESPSafeTracer",
        Distance = "RunawaysESPSafeDistance",
        Range = "RunawaysESPSafeMaxDistance",
    },
}
local espFonts = {
    UI = 0,
    System = 1,
    Plex = 2,
    Monospace = 3,
}

local function newESPObject(kind)
    if not drawingAvailable then
        return
    end

    local success, object = pcall(drawingLibrary.new, kind)

    if not success or not object then
        drawingAvailable = false
        return
    end

    object.Visible = false
    return object
end

local function removeESPObject(object)
    if not object then
        return
    end

    object.Visible = false

    if not pcall(function()
        object:Remove()
    end) then
        pcall(function()
            object:Destroy()
        end)
    end
end

local function refreshSilentAimTargets()
    if os.clock() - silentAimLastScan < 0.35 then
        return
    end

    silentAimLastScan = os.clock()
    table.clear(silentAimTargets)

    for _, npc in CollectionService:GetTagged("NPC") do
        if npc:IsA("Model") and npc:IsDescendantOf(workspace) then
            silentAimTargets[#silentAimTargets + 1] = {
                Model = npc,
            }
        end
    end
end

local function projectAimPart(part, camera, center)
    if not part or not part:IsA("BasePart") or not part:IsDescendantOf(workspace) then
        return
    end

    local point, onScreen = camera:WorldToViewportPoint(part.Position)

    if not onScreen or point.Z <= 0 then
        return
    end

    local screenPoint = Vector2.new(point.X, point.Y)

    return (screenPoint - center).Magnitude
end

local function getAimPart(model, camera, center)
    local selection = options.RunawaysSilentAimTargetPart.Value

    if selection ~= "Closest Part" then
        local part = model:FindFirstChild(selection) or model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart

        return part, projectAimPart(part, camera, center)
    end

    local bestPart
    local bestDistance

    for _, part in model:GetChildren() do
        if part:IsA("BasePart") then
            local distance = projectAimPart(part, camera, center)

            if distance and (not bestDistance or distance < bestDistance) then
                bestPart = part
                bestDistance = distance
            end
        end
    end

    return bestPart, bestDistance
end

local function getShotOriginAndRange(arguments, camera)
    local origin = typeof(arguments.from) == "Vector3" and arguments.from or camera.CFrame.Position

    if typeof(arguments.to) == "Vector3" then
        return origin, (arguments.to - origin).Magnitude
    end

    if typeof(arguments.direction) == "Vector3" then
        return origin, type(arguments.length) == "number" and arguments.length or arguments.direction.Magnitude
    end

    if type(arguments.rayLength) == "number" then
        return camera.CFrame.Position, arguments.rayLength
    end
end

local function isAimTargetVisible(model, part, origin, config)
    if not weaponToggle("RunawaysSilentAimVisibleCheck") then
        return true
    end

    if type(originalWeaponRaycast) ~= "function" then
        return false
    end

    local success, result = pcall(originalWeaponRaycast, {
        from = origin,
        to = part.Position,
        config = config,
    }, player)

    return success
        and type(result) == "table"
        and result.success
        and result.hit
        and result.hit:IsDescendantOf(model)
end

local function getSilentAimTarget(arguments)
    if not weaponToggle("RunawaysSilentAimEnabled") then
        return
    end

    if silentAimRandom:NextNumber(0, 100) > options.RunawaysSilentAimHitChance.Value then
        return
    end

    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    local origin, range = getShotOriginAndRange(arguments, camera)

    if not origin or not range or range <= 0 then
        return
    end

    refreshSilentAimTargets()

    local center = camera.ViewportSize * 0.5
    local radius = options.RunawaysSilentAimFOVRadius.Value
    local bestPart
    local bestDistance

    for _, target in silentAimTargets do
        local model = target.Model
        local humanoid = model and model:FindFirstChildOfClass("Humanoid")

        if model
            and model:IsDescendantOf(workspace)
            and humanoid
            and humanoid.Health > 0
        then
            local part, distance = getAimPart(model, camera, center)

            if part
                and distance
                and distance <= radius
                and (part.Position - origin).Magnitude <= range
                and (not bestDistance or distance < bestDistance)
                and isAimTargetVisible(model, part, origin, arguments.config)
            then
                bestPart = part
                bestDistance = distance
            end
        end
    end

    return bestPart
end

local function weaponRaycast(arguments, shooter)
    if type(arguments) == "table"
        and type(arguments.config) == "table"
        and type(arguments.config.damage) == "number"
    then
        local target = getSilentAimTarget(arguments)

        if target then
            local camera = workspace.CurrentCamera
            local origin
            local range

            if camera then
                origin, range = getShotOriginAndRange(arguments, camera)
            end

            if origin and range and range > 0 then
                local direction = target.Position - origin

                if direction.Magnitude > 0 then
                    local redirected = table.clone(arguments)

                    if typeof(arguments.to) == "Vector3" then
                        redirected.to = target.Position
                    else
                        redirected.from = origin
                        redirected.direction = direction.Unit * range
                        redirected.rayLength = nil
                    end

                    arguments = redirected
                end
            end
        end
    end

    return originalWeaponRaycast(arguments, shooter)
end

local function updateSilentAimCircle()
    local visible = drawingAvailable
        and weaponToggle("RunawaysSilentAimEnabled")
        and weaponToggle("RunawaysSilentAimShowFOV")

    if not visible then
        if silentAimCircle then
            silentAimCircle.Visible = false
        end

        return
    end

    local camera = workspace.CurrentCamera

    if not camera then
        if silentAimCircle then
            silentAimCircle.Visible = false
        end

        return
    end

    if not silentAimCircle then
        silentAimCircle = newESPObject("Circle")

        if not silentAimCircle then
            return
        end

        silentAimCircle.Filled = false
        silentAimCircle.NumSides = 64
        silentAimCircle.ZIndex = 4
    end

    local color = options.RunawaysSilentAimFOVColor

    silentAimCircle.Position = camera.ViewportSize * 0.5
    silentAimCircle.Radius = options.RunawaysSilentAimFOVRadius.Value
    silentAimCircle.Color = color.Value
    silentAimCircle.Transparency = 1 - color.Transparency
    silentAimCircle.Thickness = options.RunawaysSilentAimFOVThickness.Value
    silentAimCircle.Visible = true
end

local function clearSilentAim()
    table.clear(silentAimTargets)
    silentAimLastScan = 0

    if silentAimCircle then
        removeESPObject(silentAimCircle)
        silentAimCircle = nil
    end
end

local function installWeaponHooks()
    if flow.Ammo and type(originalSetAmmo) == "function" then
        flow.Ammo.setAmmo = weaponSetAmmo
    end

    if flow.Ammo and type(originalSubtractReserve) == "function" then
        flow.Ammo.substractReserve = weaponSubtractReserve
    end

    if flow.Camera and type(originalCameraRecoil) == "function" then
        flow.Camera.Recoil = weaponCameraRecoil
    end

    if flow.Viewmodel and type(originalViewmodelRecoil) == "function" then
        flow.Viewmodel.Recoil = weaponViewmodelRecoil
    end

    if luck and type(originalRadialFalloff) == "function" then
        luck.radialFalloff = weaponRadialFalloff
    end

    if flow.BulletsClient and type(originalWeaponRaycast) == "function" then
        flow.BulletsClient.raycast = weaponRaycast
    end
end

local function restoreWeaponHooks()
    if flow.Ammo and flow.Ammo.setAmmo == weaponSetAmmo then
        flow.Ammo.setAmmo = originalSetAmmo
    end

    if flow.Ammo and flow.Ammo.substractReserve == weaponSubtractReserve then
        flow.Ammo.substractReserve = originalSubtractReserve
    end

    if flow.Camera and flow.Camera.Recoil == weaponCameraRecoil then
        flow.Camera.Recoil = originalCameraRecoil
    end

    if flow.Viewmodel and flow.Viewmodel.Recoil == weaponViewmodelRecoil then
        flow.Viewmodel.Recoil = originalViewmodelRecoil
    end

    if luck and luck.radialFalloff == weaponRadialFalloff then
        luck.radialFalloff = originalRadialFalloff
    end

    if flow.BulletsClient and flow.BulletsClient.raycast == weaponRaycast then
        flow.BulletsClient.raycast = originalWeaponRaycast
    end
end

local function newESPVisual(kind)
    local visual = {
        Text = newESPObject("Text"),
        Box = newESPObject("Square"),
        Tracer = newESPObject("Line"),
    }

    if kind == "NPCs" or kind == "Players" then
        visual.HealthBack = newESPObject("Line")
        visual.Health = newESPObject("Line")
    end

    if visual.Text then
        visual.Text.Center = true
        visual.Text.ZIndex = 3
    end

    if visual.Box then
        visual.Box.Filled = false
        visual.Box.ZIndex = 2
    end

    if visual.Tracer then
        visual.Tracer.ZIndex = 1
    end

    return visual
end

local function hideESPVisual(visual)
    for _, object in visual do
        object.Visible = false
    end
end

local function removeESPVisuals(registry)
    for target, visual in registry do
        for _, object in visual do
            removeESPObject(object)
        end

        registry[target] = nil
    end
end

local function clearESP()
    for _, registry in espVisuals do
        removeESPVisuals(registry)
    end

    for _, targets in espTargets do
        table.clear(targets)
    end
end

local function hideESP()
    for _, registry in espVisuals do
        for _, visual in registry do
            hideESPVisual(visual)
        end
    end
end

local function syncESPTargets(kind, targets)
    local active = {}
    local registry = espVisuals[kind]

    for _, target in targets do
        active[target] = true
    end

    for target, visual in registry do
        if not active[target] then
            for _, object in visual do
                removeESPObject(object)
            end

            registry[target] = nil
        end
    end

    espTargets[kind] = targets
end

local function getESPOrigin(camera)
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    return root and root.Position or camera.CFrame.Position
end

local function getVehiclePart(vehicle)
    local system = vehicle:FindFirstChild("system")

    return vehicle.PrimaryPart or system and system:FindFirstChild("chassis")
end

local function getESPTarget(kind, target)
    if kind == "Items" then
        if not isLoot(target) then
            return
        end

        return target, target.PrimaryPart
    end

    if kind == "NPCs" then
        local humanoid = target.Parent and target:FindFirstChildOfClass("Humanoid")
        local root = target.Parent and target:FindFirstChild("HumanoidRootPart")

        if not humanoid or not root then
            return
        end

        if toggles.RunawaysESPNPCActiveOnly.Value and humanoid.Health <= 0 then
            return
        end

        return target, root, humanoid
    end

    if kind == "Players" then
        local character = target.Parent == Players and target.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")

        if not humanoid or not root or humanoid.Health <= 0 then
            return
        end

        return character, root, humanoid
    end

    if kind == "Vehicles" then
        if not target.Parent then
            return
        end

        return target, getVehiclePart(target), nil, target:FindFirstChild("vehicleHealth")
    end

    if kind == "Safes" and target.Parent then
        if target:IsA("Model") then
            return target, target.PrimaryPart or target:FindFirstChildWhichIsA("BasePart", true)
        end

        if target:IsA("BasePart") then
            return nil, target
        end
    end
end

local function getESPBounds(model, part)
    if model then
        local success, boxCFrame, boxSize = pcall(model.GetBoundingBox, model)

        if success and boxSize.Magnitude > 0 then
            return boxCFrame, boxSize
        end
    end

    if part then
        return part.CFrame, part.Size
    end
end

local function projectESPBounds(camera, boxCFrame, boxSize)
    local minX = math.huge
    local minY = math.huge
    local maxX = -math.huge
    local maxY = -math.huge

    for _, x in { -1, 1 } do
        for _, y in { -1, 1 } do
            for _, z in { -1, 1 } do
                local offset = Vector3.new(boxSize.X * x, boxSize.Y * y, boxSize.Z * z) * 0.5
                local point = camera:WorldToViewportPoint(boxCFrame:PointToWorldSpace(offset))

                if point.Z <= 0 then
                    return
                end

                minX = math.min(minX, point.X)
                minY = math.min(minY, point.Y)
                maxX = math.max(maxX, point.X)
                maxY = math.max(maxY, point.Y)
            end
        end
    end

    local viewport = camera.ViewportSize

    if maxX < 0 or maxY < 0 or minX > viewport.X or minY > viewport.Y then
        return
    end

    local margin = 64

    minX = math.clamp(minX, -margin, viewport.X + margin)
    minY = math.clamp(minY, -margin, viewport.Y + margin)
    maxX = math.clamp(maxX, -margin, viewport.X + margin)
    maxY = math.clamp(maxY, -margin, viewport.Y + margin)

    return Vector2.new(minX, minY), Vector2.new(maxX - minX, maxY - minY)
end

local function getESPText(kind, target, humanoid, extra, distance)
    local parts = {}

    if kind == "Items" then
        if toggles.RunawaysESPItemName.Value then
            parts[#parts + 1] = formatName(target.Name)
        end

        if toggles.RunawaysESPItemCategory.Value then
            parts[#parts + 1] = formatName(dropCategoryByName[target.Name] or "Unknown")
        end

        if toggles.RunawaysESPItemPrice.Value then
            parts[#parts + 1] = "$" .. tostring(lootValueByName[target.Name] or 0)
        end
    elseif kind == "NPCs" then
        if toggles.RunawaysESPNPCName.Value then
            parts[#parts + 1] = formatName(target.Name)
        end

        if toggles.RunawaysESPNPCHealth.Value and humanoid.Health >= 0 then
            parts[#parts + 1] = string.format("%d/%d HP", humanoid.Health, humanoid.MaxHealth)
        end
    elseif kind == "Players" then
        if toggles.RunawaysESPPlayerName.Value then
            local name = target.DisplayName

            if target.DisplayName ~= target.Name then
                name ..= " (@" .. target.Name .. ")"
            end

            parts[#parts + 1] = name
        end

        if toggles.RunawaysESPPlayerHealth.Value then
            parts[#parts + 1] = string.format("%d/%d HP", humanoid.Health, humanoid.MaxHealth)
        end
    elseif kind == "Vehicles" then
        if toggles.RunawaysESPVehicleName.Value then
            parts[#parts + 1] = formatName(target.Name)
        end

        if toggles.RunawaysESPVehicleHealth.Value and extra then
            parts[#parts + 1] = tostring(math.round(extra.Value)) .. " HP"
        end
    elseif kind == "Safes" and toggles.RunawaysESPSafeName.Value then
        parts[#parts + 1] = formatName(target.Name)
    end

    if toggles[espConfig[kind].Distance].Value then
        parts[#parts + 1] = tostring(math.round(distance)) .. " studs"
    end

    return table.concat(parts, " | ")
end

local function getESPColor(kind, target)
    local colorOption = options[espConfig[kind].Color]

    if kind == "Items"
        and toggles.RunawaysESPItemHighValue.Value
        and (tonumber(lootValueByName[target.Name]) or 0) >= options.RunawaysESPItemHighValueThreshold.Value
    then
        colorOption = options.RunawaysESPItemHighValueColor
    end

    return colorOption.Value, 1 - colorOption.Transparency
end

local function getTracerOrigin(camera)
    local origin = options.RunawaysESPTracerOrigin.Value

    if origin == "Center" then
        return camera.ViewportSize * 0.5
    end

    if origin == "Mouse" and UserInputService.MouseEnabled then
        return UserInputService:GetMouseLocation()
    end

    if origin == "Mouse" then
        return camera.ViewportSize * 0.5
    end

    return Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y)
end

local function updateESPVisual(kind, target, visual, camera, origin)
    local model, part, humanoid, extra = getESPTarget(kind, target)

    if not part then
        hideESPVisual(visual)
        return
    end

    local distance = (part.Position - origin).Magnitude

    if distance > options[espConfig[kind].Range].Value then
        hideESPVisual(visual)
        return
    end

    local point, onScreen = camera:WorldToViewportPoint(part.Position)

    if point.Z <= 0 or not onScreen then
        hideESPVisual(visual)
        return
    end

    local showBox = toggles[espConfig[kind].Box].Value
    local showHealth = espConfig[kind].HealthBar
        and toggles[espConfig[kind].HealthBar].Value
        and humanoid
        and humanoid.Health >= 0
        and humanoid.MaxHealth > 0
    local position = Vector2.new(point.X, point.Y)
    local size = Vector2.zero

    if showBox or showHealth then
        local boxCFrame, boxSize = getESPBounds(model, part)

        if not boxCFrame then
            hideESPVisual(visual)
            return
        end

        position, size = projectESPBounds(camera, boxCFrame, boxSize)

        if not position then
            hideESPVisual(visual)
            return
        end
    end

    local color, transparency = getESPColor(kind, target)
    local text = getESPText(kind, target, humanoid, extra, distance)
    local thickness = options.RunawaysESPBoxThickness.Value

    if visual.Text and text ~= "" then
        visual.Text.Text = text
        visual.Text.Position = Vector2.new(position.X + size.X * 0.5, math.max(0, position.Y - options.RunawaysESPTextSize.Value - 2))
        visual.Text.Size = options.RunawaysESPTextSize.Value
        visual.Text.Font = espFonts[options.RunawaysESPFont.Value] or 2
        visual.Text.Color = color
        visual.Text.Transparency = transparency
        visual.Text.Outline = toggles.RunawaysESPTextOutline.Value
        visual.Text.OutlineColor = options.RunawaysESPOutlineColor.Value
        visual.Text.Visible = true
    elseif visual.Text then
        visual.Text.Visible = false
    end

    if visual.Box and showBox then
        visual.Box.Position = position
        visual.Box.Size = size
        visual.Box.Color = color
        visual.Box.Transparency = transparency
        visual.Box.Thickness = thickness
        visual.Box.Visible = true
    elseif visual.Box then
        visual.Box.Visible = false
    end

    if visual.Tracer and toggles[espConfig[kind].Tracer].Value then
        visual.Tracer.From = getTracerOrigin(camera)
        visual.Tracer.To = Vector2.new(position.X + size.X * 0.5, position.Y + size.Y)
        visual.Tracer.Color = color
        visual.Tracer.Transparency = transparency
        visual.Tracer.Thickness = thickness
        visual.Tracer.Visible = true
    elseif visual.Tracer then
        visual.Tracer.Visible = false
    end

    if visual.Health and showHealth then
        local ratio = math.clamp(humanoid.Health / humanoid.MaxHealth, 0, 1)
        local x = position.X - 4
        local bottom = position.Y + size.Y

        visual.HealthBack.From = Vector2.new(x, bottom)
        visual.HealthBack.To = Vector2.new(x, position.Y)
        visual.HealthBack.Color = Color3.new(0, 0, 0)
        visual.HealthBack.Transparency = transparency
        visual.HealthBack.Thickness = thickness + 2
        visual.HealthBack.Visible = true
        visual.Health.From = Vector2.new(x, bottom)
        visual.Health.To = Vector2.new(x, bottom - size.Y * ratio)
        visual.Health.Color = Color3.fromHSV(ratio * 0.33, 1, 1)
        visual.Health.Transparency = transparency
        visual.Health.Thickness = thickness
        visual.Health.Visible = true
    elseif visual.Health then
        visual.Health.Visible = false
        visual.HealthBack.Visible = false
    end
end

local function updateESP()
    if not toggles.RunawaysESPEnabled or not toggles.RunawaysESPEnabled.Value then
        return
    end

    if not drawingAvailable then
        hideESP()
        return
    end

    local camera = workspace.CurrentCamera

    if not camera then
        hideESP()
        return
    end

    local origin = getESPOrigin(camera)

    for kind, targets in espTargets do
        local config = espConfig[kind]
        local registry = espVisuals[kind]

        if toggles[config.Toggle].Value then
            for _, target in targets do
                local visual = registry[target]

                if not visual then
                    visual = newESPVisual(kind)
                    registry[target] = visual
                end

                updateESPVisual(kind, target, visual, camera, origin)
            end
        else
            for _, visual in registry do
                hideESPVisual(visual)
            end
        end
    end
end

local function scanESP()
    if not drawingAvailable or not toggles.RunawaysESPEnabled.Value then
        clearESP()
        return
    end

    local camera = workspace.CurrentCamera
    local origin = camera and getESPOrigin(camera)
    local items = {}
    local npcs = {}
    local players = {}
    local vehicles = {}
    local safes = {}

    local function inRange(part, limit)
        return part and (not origin or (part.Position - origin).Magnitude <= limit)
    end

    if toggles.RunawaysESPItems.Value and lootFolder then
        local selected = options.RunawaysESPItemCategories.Value
        local useCategories = next(selected) ~= nil
        local candidates = {}

        for _, item in lootFolder:GetChildren() do
            local category = dropCategoryByName[item.Name]
            local value = tonumber(lootValueByName[item.Name]) or 0

            if isLoot(item)
                and value >= options.RunawaysESPItemMinValue.Value
                and (not useCategories or selected[category])
            then
                local distance = origin and (item.PrimaryPart.Position - origin).Magnitude or 0

                if distance <= options.RunawaysESPItemMaxDistance.Value then
                    candidates[#candidates + 1] = {
                        Target = item,
                        Distance = distance,
                    }
                end
            end
        end

        table.sort(candidates, function(a, b)
            return a.Distance < b.Distance
        end)

        for index = 1, math.min(#candidates, options.RunawaysESPMaxItems.Value) do
            items[index] = candidates[index].Target
        end
    end

    if toggles.RunawaysESPNPCs.Value then
        local folder = workspace:FindFirstChild("NPCs")

        if folder then
            local seen = {}

            for _, humanoid in folder:QueryDescendants("Humanoid") do
                local npc = humanoid.Parent
                local root = npc and npc:FindFirstChild("HumanoidRootPart")

                if npc and npc:IsA("Model")
                    and not seen[npc]
                    and inRange(root, options.RunawaysESPNPCMaxDistance.Value)
                    and (not toggles.RunawaysESPNPCActiveOnly.Value or humanoid.Health > 0)
                then
                    seen[npc] = true
                    npcs[#npcs + 1] = npc

                    if #npcs >= 100 then
                        break
                    end
                end
            end
        end
    end

    if toggles.RunawaysESPPlayers.Value then
        for _, target in Players:GetPlayers() do
            local character = target.Character
            local root = character and character:FindFirstChild("HumanoidRootPart")

            if target ~= player and inRange(root, options.RunawaysESPPlayerMaxDistance.Value) then
                players[#players + 1] = target
            end
        end
    end

    if toggles.RunawaysESPVehicles.Value then
        local folder = workspace:FindFirstChild("Vehicles")

        if folder then
            for _, vehicle in folder:GetChildren() do
                local part = vehicle:IsA("Model") and getVehiclePart(vehicle)

                if part and inRange(part, options.RunawaysESPVehicleMaxDistance.Value) then
                    vehicles[#vehicles + 1] = vehicle

                    if #vehicles >= 100 then
                        break
                    end
                end
            end
        end
    end

    if toggles.RunawaysESPSafes.Value then
        for _, safe in CollectionService:GetTagged("Safe") do
            local _, part = getESPTarget("Safes", safe)

            if safe:IsDescendantOf(workspace) and inRange(part, options.RunawaysESPSafeMaxDistance.Value) then
                safes[#safes + 1] = safe

                if #safes >= 100 then
                    break
                end
            end
        end
    end

    syncESPTargets("Items", items)
    syncESPTargets("NPCs", npcs)
    syncESPTargets("Players", players)
    syncESPTargets("Vehicles", vehicles)
    syncESPTargets("Safes", safes)
end

local remoteShop = {
    Entries = {},
    Signature = "",
    Busy = false,
    Token = nil,
    Context = nil,
}

function remoteShop:GetCashValue()
    local leaderstats = player:FindFirstChild("leaderstats")
    local cash = leaderstats and leaderstats:FindFirstChild("Cash 💵")

    if cash and (cash:IsA("NumberValue") or cash:IsA("IntValue")) then
        return cash.Value
    end

    local playerGui = player:FindFirstChildOfClass("PlayerGui")
    local hud = playerGui and playerGui:FindFirstChild("HudGui")
    local panel = hud and hud:FindFirstChild("BottomPanel")
    local frame = panel and panel:FindFirstChild("CashAmount")
    local label = frame and frame:FindFirstChild("CashAmount")
    local digits = label and label.Text:gsub("[^%d]", "")

    return digits and tonumber(digits)
end

function remoteShop:CountNamedTools(name)
    local count = 0
    local backpack = player:FindFirstChildOfClass("Backpack")
    local character = player.Character

    for _, container in { backpack, character } do
        if container then
            for _, child in container:GetChildren() do
                if child:IsA("Tool") and child.Name == name then
                    count += 1
                end
            end
        end
    end

    return count
end

function remoteShop:DidPurchase(entry, beforeCash, beforeCount)
    if self:CountNamedTools(entry.Name) > beforeCount then
        return true
    end

    local current = self:GetCashValue()

    return entry.Price ~= nil
        and entry.Price > 0
        and beforeCash ~= nil
        and current ~= nil
        and beforeCash - current == entry.Price
end

function remoteShop:Refresh(force)
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local byName = {}

    for _, part in CollectionService:GetTagged("BuyableItem") do
        local itemName = part:IsA("BasePart") and part:GetAttribute("ItemName")
        local prompt = part:IsDescendantOf(workspace) and part:FindFirstChild("BuyPrompt")

        if type(itemName) == "string" and itemName ~= "" and prompt and prompt:IsA("ProximityPrompt") and prompt.Enabled then
            local distance = root and (part.Position - root.Position).Magnitude or 0
            local current = byName[itemName]

            if not current or distance < current.Distance then
                local price = tonumber((prompt.ActionText:gsub("[^%d]", "")))

                byName[itemName] = {
                    Name = itemName,
                    Part = part,
                    Prompt = prompt,
                    Price = price,
                    Action = prompt.ActionText,
                    Distance = distance,
                }
            end
        end
    end

    local sorted = {}

    for _, entry in byName do
        sorted[#sorted + 1] = entry
    end

    table.sort(sorted, function(a, b)
        return a.Name < b.Name
    end)

    local values = { "None" }
    local entries = {}

    for _, entry in sorted do
        local label = formatName(entry.Name) .. " | " .. entry.Action

        values[#values + 1] = label
        entries[label] = entry
    end

    self.Entries = entries

    local signature = table.concat(values, "\0")
    local option = options.RunawaysRemoteShopItem

    if option then
        local current = option.Value

        if force or self.Signature ~= signature then
            option:SetValues(values)
            option:SetValue(entries[current] and current or "None")
        elseif current ~= "None" and not entries[current] then
            option:SetValue("None")
        end
    end

    self.Signature = signature
end

function remoteShop:GetSelected()
    local option = options.RunawaysRemoteShopItem
    local entry = option and self.Entries[option.Value]

    if not entry or not entry.Part.Parent or not entry.Prompt.Parent then
        self:Refresh(true)
        option = options.RunawaysRemoteShopItem
        entry = option and self.Entries[option.Value]
    end

    if not entry then
        notify("Select an available shop item.")
        return
    end

    return entry
end

function remoteShop:Restore(context)
    context = context or self.Context

    if not context then
        return
    end

    local character = context.Character
    local root = context.Root

    if player.Character == character and character and character.Parent and root and root.Parent == character then
        pcall(function()
            character:PivotTo(context.StartPivot)
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end)
    end

    local camera = workspace.CurrentCamera or context.Camera

    if camera and camera.Parent then
        pcall(function()
            local subject = context.CameraSubject

            if player.Character ~= character or not subject or not subject.Parent then
                local currentCharacter = player.Character

                subject = currentCharacter and (currentCharacter:FindFirstChildOfClass("Humanoid") or currentCharacter:FindFirstChild("HumanoidRootPart"))
            end

            if subject then
                camera.CameraSubject = subject
            end

            if context.CameraType then
                camera.CameraType = context.CameraType
            end

            if context.CameraCFrame then
                camera.CFrame = context.CameraCFrame
            end
        end)
    end

    if self.Context == context then
        self.Context = nil
    end
end

function remoteShop:Buy()
    if self.Busy then
        notify("A purchase is already running.", 3)
        return
    end

    local entry = self:GetSelected()

    if not entry then
        return
    end

    if type(fireproximityprompt) ~= "function" then
        notify("Prompt activation is unavailable.", 6)
        return
    end

    local cash = self:GetCashValue()

    if entry.Price and cash and cash < entry.Price then
        notify(string.format("Not enough cash: $%d / $%d.", cash, entry.Price), 5)
        return
    end

    local used, limit = getBackpackUsage()

    if used and limit and used >= limit and not entry.Name:find("Backpack", 1, true) then
        notify(string.format("Inventory full: %d/%d.", used, limit), 5)
        return
    end

    local token = {}

    self.Token = token
    self.Busy = true

    task.spawn(function()
        if self.Token ~= token or library.Unloaded then
            return
        end

        local beforeCash = self:GetCashValue()
        local beforeCount = self:CountNamedTools(entry.Name)
        local context
        local ok, message = pcall(function()
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local root = character and character:FindFirstChild("HumanoidRootPart")

            if not character or not humanoid or not root or humanoid.Health <= 0 then
                error("Character is unavailable.", 0)
            end

            if humanoid.SeatPart then
                error("Exit the vehicle first.", 0)
            end

            local camera = workspace.CurrentCamera

            context = {
                Character = character,
                Root = root,
                StartPivot = character:GetPivot(),
                Camera = camera,
                CameraCFrame = camera and camera.CFrame,
                CameraSubject = camera and camera.CameraSubject,
                CameraType = camera and camera.CameraType,
            }

            if self.Token ~= token or library.Unloaded then
                return
            end

            self.Context = context

            if camera then
                camera.CameraType = Enum.CameraType.Scriptable
                camera.CFrame = context.CameraCFrame
            end

            character:PivotTo(getPickupCFrame(root, entry.Part))
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
            task.wait(0.35)

            if self.Token ~= token or library.Unloaded or not entry.Prompt.Parent then
                return
            end

            fireproximityprompt(entry.Prompt, entry.Prompt.HoldDuration, true)

            local expires = os.clock() + 1.5

            repeat
                task.wait(0.05)
            until self.Token ~= token
                or library.Unloaded
                or self:DidPurchase(entry, beforeCash, beforeCount)
                or os.clock() >= expires
        end)

        self:Restore(context)

        if self.Token ~= token then
            return
        end

        self.Token = nil
        self.Busy = false

        if library.Unloaded then
            return
        end

        local purchased = self:DidPurchase(entry, beforeCash, beforeCount)

        if not ok then
            notify("Purchase failed: " .. tostring(message), 6)
        elseif purchased then
            notify("Purchased " .. formatName(entry.Name) .. ".")
        else
            notify("Purchase was not completed.", 5)
        end
    end)
end

function remoteShop:Destroy()
    self.Token = nil
    self:Restore(self.Context)
    self.Busy = false
    table.clear(self.Entries)
end

library.LobbyShop = {
    Box = nil,
    Entries = {},
    Signature = "",
    Busy = false,
    Token = nil,
}

function library.LobbyShop:IsLobby()
    return library.AutoFarm and game.PlaceId == library.AutoFarm.LobbyPlaceId
end

function library.LobbyShop:GetData(key)
    if not flow.PlayerDataClient or type(flow.PlayerDataClient.get) ~= "function" then
        return
    end

    local ok, value = pcall(flow.PlayerDataClient.get, key)

    if ok then
        return value
    end
end

function library.LobbyShop:GetCoins()
    return tonumber(self:GetData("coins"))
end

function library.LobbyShop:GetOwnedCount(category, id)
    if category == "Classes" then
        local owned = self:GetData("ownedClasses")

        return type(owned) == "table" and owned[id] == true and 1 or 0
    end

    if category == "Vehicles" then
        local owned = self:GetData("cars")

        return type(owned) == "table" and owned[id] ~= nil and 1 or 0
    end

    local count = 0
    local stash = self:GetData("weaponStash")
    local equipped = self:GetData("equippedWeapons")

    if type(stash) == "table" then
        count += tonumber(stash[id]) or 0
    end

    if type(equipped) == "table" then
        for _, weaponId in equipped do
            if weaponId == id then
                count += 1
            end
        end
    end

    return count
end

function library.LobbyShop:FormatPrice(price)
    local value = tostring(math.max(0, math.floor(tonumber(price) or 0)))
    local formatted = value:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")

    return formatted .. " Credz"
end

function library.LobbyShop:GetCatalog(category)
    if category == "Classes" then
        return data.ClassesData
    end

    if category == "Vehicles" then
        return data.CarData and data.CarData.Cars
    end

    return data.WeaponData and data.WeaponData.Weapons
end

function library.LobbyShop:Refresh(force)
    if not self:IsLobby() or not self.Box then
        return
    end

    local categoryOption = options.RunawaysLobbyShopCategory
    local itemOption = options.RunawaysLobbyShopItem

    if not categoryOption or not itemOption then
        return
    end

    local category = categoryOption.Value

    if category ~= "Classes" and category ~= "Weapons" and category ~= "Vehicles" then
        category = "Classes"
    end

    local catalog = self:GetCatalog(category)
    local sorted = {}

    if type(catalog) == "table" then
        for id, info in catalog do
            local price = type(info) == "table" and tonumber(info.price)
            local available = price ~= nil

            if category == "Classes" and info.robuxPurchase == true then
                available = false
            elseif category == "Vehicles" and info.gamepassId ~= nil then
                available = false
            end

            if available and (category == "Weapons" or self:GetOwnedCount(category, id) == 0) then
                sorted[#sorted + 1] = {
                    Id = id,
                    Name = tostring(info.name or formatName(tostring(id))),
                    Price = price,
                    Category = category,
                    ItemCategory = tostring(info.category or ""),
                }
            end
        end
    end

    table.sort(sorted, function(a, b)
        if a.Name == b.Name then
            return tostring(a.Id) < tostring(b.Id)
        end

        return a.Name < b.Name
    end)

    local values = { "None" }
    local entries = {}

    for _, entry in sorted do
        local itemCategory = entry.Category == "Weapons" and entry.ItemCategory ~= "" and " [" .. entry.ItemCategory .. "]" or ""
        local label = entry.Name .. itemCategory .. " | " .. self:FormatPrice(entry.Price)

        values[#values + 1] = label
        entries[label] = entry
    end

    self.Entries = entries

    local signature = category .. "\0" .. table.concat(values, "\0")
    local current = itemOption.Value

    if force or self.Signature ~= signature then
        itemOption:SetValues(values)
        itemOption:SetValue(entries[current] and current or "None")
    elseif current ~= "None" and not entries[current] then
        itemOption:SetValue("None")
    end

    self.Signature = signature
end

function library.LobbyShop:GetSelected()
    local option = options.RunawaysLobbyShopItem
    local entry = option and self.Entries[option.Value]

    if not entry then
        self:Refresh(true)
        option = options.RunawaysLobbyShopItem
        entry = option and self.Entries[option.Value]
    end

    if not entry then
        notify("Select an available lobby item.")
        return
    end

    return entry
end

function library.LobbyShop:Buy()
    if not self:IsLobby() then
        notify("Lobby Shop is only available in the lobby.", 5)
        return
    end

    if self.Busy then
        notify("A lobby purchase is already running.", 3)
        return
    end

    local entry = self:GetSelected()

    if not entry then
        return
    end

    local coins = self:GetCoins()

    if coins and coins < entry.Price then
        notify(string.format("Not enough Credz: %d / %d.", coins, entry.Price), 5)
        return
    end

    local method = entry.Category == "Classes" and "BuyClass"
        or entry.Category == "Vehicles" and "BuyCar"
        or "BuyWeapon"
    local purchase = flow.PlayerDataServer and flow.PlayerDataServer[method]

    if type(purchase) ~= "function" then
        notify(method .. " is unavailable.", 5)
        return
    end

    local token = {}
    local beforeCount = self:GetOwnedCount(entry.Category, entry.Id)
    local beforeCoins = self:GetCoins()

    self.Token = token
    self.Busy = true

    task.spawn(function()
        local ok, result = pcall(purchase, entry.Id)
        local expires = os.clock() + 2
        local afterCount = beforeCount
        local afterCoins = beforeCoins

        repeat
            task.wait(0.05)
            afterCount = self:GetOwnedCount(entry.Category, entry.Id)
            afterCoins = self:GetCoins()
        until self.Token ~= token
            or library.Unloaded
            or afterCount > beforeCount
            or entry.Price > 0 and beforeCoins ~= nil and afterCoins ~= nil and beforeCoins - afterCoins >= entry.Price
            or os.clock() >= expires

        if self.Token ~= token then
            return
        end

        self.Token = nil
        self.Busy = false
        self:Refresh(true)

        if library.Unloaded then
            return
        end

        local purchased = result == true
            or afterCount > beforeCount
            or entry.Price > 0 and beforeCoins ~= nil and afterCoins ~= nil and beforeCoins - afterCoins >= entry.Price

        if not ok then
            notify("Lobby purchase failed: " .. tostring(result), 6)
        elseif purchased then
            notify("Purchased " .. entry.Name .. " for " .. self:FormatPrice(entry.Price) .. ".")
        else
            notify("Purchase was rejected by the server.", 5)
        end
    end)
end

function library.LobbyShop:Destroy()
    self.Token = nil
    self.Busy = false
    table.clear(self.Entries)
end

library.AutoFarm = {
    Version = 1,
    StatsVersion = 2,
    LobbyPlaceId = 118418618261207,
    GamePlaceId = 117311404196294,
    StatePath = "MyScriptHub/RUNAWAYS/auto_farm.json",
    StateKey = "RUNAWAYS_AUTO_FARM_STATE",
    EnabledKey = "RUNAWAYS_AUTO_FARM_ENABLED",
    SessionKey = "RUNAWAYS_AUTO_FARM_SESSION",
    TransitionKey = "RUNAWAYS_AUTO_FARM_TRANSITION",
    TeleportLoader = [[
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/RUNAWAYS.lua?cb=" .. tostring(os.time())))()
]],
    Running = false,
    ResumeRequested = false,
    Token = nil,
    QueueJob = nil,
    Revision = 0,
    Teleporting = false,
    RunActive = false,
    ActiveRunToken = nil,
    RunHeartbeat = 0,
    Phase = "Idle",
    Detail = "Ready",
    GateText = "--",
    LastError = "None",
    QueueStatus = "Not armed",
    WebhookStatus = "Idle",
    SessionId = "",
    TransitionToken = "",
    ExpectedPlaceId = 0,
    TransitionAt = 0,
    StartedAt = 0,
    RunStartedAt = 0,
    RunCashStart = 0,
    RunWinsStart = 0,
    LastCredzBalance = nil,
    LastWins = nil,
    PendingCredz = 0,
    PendingWins = 0,
    BalanceWarmupUntil = 0,
    GateStartedAt = 0,
    PendingFinish = false,
    FinishCrossed = false,
    PendingAt = 0,
    ResultBusy = false,
    ResultFinalized = false,
    ReplayRequested = false,
    SafeCFrame = nil,
    SafeCharacter = nil,
    SafeRootAnchored = nil,
    LastGameJob = "",
    LastSnapshot = nil,
    LastPersistAt = 0,
    StateReady = false,
    LastWebhookAt = 0,
    WebhookGeneration = 0,
    TeleportFailureGeneration = 0,
    TeleportRecoveryGeneration = 0,
    TeleportRetryCount = 0,
    TeleportRetryDelay = 0,
    TeleportRetryTarget = 0,
    TeleportRetryOptions = nil,
    TeleportRecovering = false,
    LastTeleportFailureAt = 0,
    Labels = {},
    LabelCache = {},
    LastUIProgressAt = 0,
    LastEndScreenScanAt = 0,
    Config = {
        LobbyDelay = 3,
        GateTimeout = 165,
        RetryDelay = 10,
        SafeGateWait = true,
        AutoReplay = true,
    },
    Webhook = {
        Enabled = false,
        URL = "",
        Events = {
            ["Session Started"] = true,
            ["Run Started"] = true,
            ["Run Completed"] = true,
            Error = true,
            Stopped = true,
        },
    },
    Stats = {
        Attempts = 0,
        Completed = 0,
        Failed = 0,
        Teleports = 0,
        GateActivations = 0,
        NPCAttacks = 0,
        Retries = 0,
        Replays = 0,
        CashEarned = 0,
        TotalRunTime = 0,
        BestRun = 0,
        LastRun = 0,
    },
}

function library.AutoFarm:GetContext()
    if game.PlaceId == self.LobbyPlaceId then
        return "Lobby"
    end

    if game.PlaceId == self.GamePlaceId then
        return "Game"
    end

    if flow.LobbyServer and type(flow.LobbyServer.create) == "function" then
        return "Lobby"
    end

    if workspace:FindFirstChild("Map") and flow.NPCs then
        return "Game"
    end

    return "Unsupported"
end

function library.AutoFarm:IsAutoReplayEnabled()
    if toggles.RunawaysAutoFarmAutoReplay then
        return toggles.RunawaysAutoFarmAutoReplay.Value == true
    end

    return self.Config.AutoReplay == true
end

function library.AutoFarm:GetQueueFunction()
    if type(queue_on_teleport) == "function" then
        return queue_on_teleport
    end

    if type(queueonteleport) == "function" then
        return queueonteleport
    end

    if type(syn) == "table" and type(syn.queue_on_teleport) == "function" then
        return syn.queue_on_teleport
    end

    if type(fluxus) == "table" and type(fluxus.queue_on_teleport) == "function" then
        return fluxus.queue_on_teleport
    end
end

function library.AutoFarm:GetTeleportLoader()
    return tostring(self.TeleportLoader or ""):match("^%s*(.-)%s*$") or ""
end

function library.AutoFarm:HasTeleportLoader()
    local loader = self:GetTeleportLoader()

    return loader ~= "" and not loader:match("^%-%-")
end

function library.AutoFarm:GetTeleportQueueError(expectedPlaceId)
    if not tonumber(expectedPlaceId) then
        return "Target place unavailable"
    end

    if not self:GetQueueFunction() then
        return "queue_on_teleport unavailable"
    end

    if not self:HasTeleportLoader() then
        return "Teleport loader is not configured"
    end
end

function library.AutoFarm:GetRequestFunction()
    if type(request) == "function" then
        return request
    end

    if type(http_request) == "function" then
        return http_request
    end

    if type(http) == "table" and type(http.request) == "function" then
        return http.request
    end

    if type(syn) == "table" and type(syn.request) == "function" then
        return syn.request
    end

    if type(fluxus) == "table" and type(fluxus.request) == "function" then
        return fluxus.request
    end
end

function library.AutoFarm:GetDataValue(name)
    if flow.LocalData and type(flow.LocalData.Get) == "function" then
        local ok, value = pcall(flow.LocalData.Get, name)

        if ok and type(value) == "number" then
            return value
        end
    end

    if flow.LocalData and type(flow.LocalData.GetValue) == "function" then
        local ok, observer = pcall(flow.LocalData.GetValue, name)

        if ok and observer then
            local read, value = pcall(function()
                return observer:get()
            end)

            if read and type(value) == "number" then
                return value
            end
        end
    end

    if flow.PlayerDataClient and type(flow.PlayerDataClient.getObserver) == "function" then
        local ok, observer = pcall(flow.PlayerDataClient.getObserver, name)

        if ok and observer and type(observer.get) == "function" then
            local read, value = pcall(observer.get, observer)

            if read and type(value) == "number" then
                return value
            end
        end
    end
end

function library.AutoFarm:GetCash()
    return self:GetDataValue("coins")
end

function library.AutoFarm:GetWins()
    return self:GetDataValue("wins")
end

function library.AutoFarm:GetEffectiveCredz()
    return (tonumber(self.LastCredzBalance) or 0) + math.max(0, tonumber(self.PendingCredz) or 0)
end

function library.AutoFarm:GetEffectiveWins()
    return (tonumber(self.LastWins) or 0) + math.max(0, tonumber(self.PendingWins) or 0)
end

function library.AutoFarm:SyncProgress(reset)
    local credz = self:GetCash()
    local wins = self:GetWins()

    if type(credz) == "number" then
        if reset or type(self.LastCredzBalance) ~= "number" then
            self.LastCredzBalance = credz
            self.PendingCredz = 0
        elseif credz > self.LastCredzBalance then
            local gained = credz - self.LastCredzBalance
            local accounted = math.min(gained, math.max(0, tonumber(self.PendingCredz) or 0))

            self.PendingCredz = math.max(0, self.PendingCredz - accounted)

            if os.clock() >= (tonumber(self.BalanceWarmupUntil) or 0) then
                self.Stats.CashEarned += gained - accounted
            end

            self.LastCredzBalance = credz
        end
    end

    if type(wins) == "number" then
        if reset or type(self.LastWins) ~= "number" then
            self.LastWins = wins
            self.PendingWins = 0
        elseif wins > self.LastWins then
            local gained = wins - self.LastWins
            local accounted = math.min(gained, math.max(0, tonumber(self.PendingWins) or 0))

            self.PendingWins = math.max(0, self.PendingWins - accounted)
            self.LastWins = wins
        end
    end

    return credz, wins
end

function library.AutoFarm:NormalizeStats()
    local active = self.RunStartedAt > 0 and 1 or 0
    local attempts = math.max(active, math.max(0, math.floor(tonumber(self.Stats.Attempts) or 0)))
    local resolved = math.max(0, attempts - active)
    local failed = math.min(math.max(0, math.floor(tonumber(self.Stats.Failed) or 0)), resolved)
    local completed = math.min(
        math.max(0, math.floor(tonumber(self.Stats.Completed) or 0)),
        math.max(0, resolved - failed)
    )

    self.Stats.Attempts = attempts
    self.Stats.Completed = completed
    self.Stats.Failed = failed
end

function library.AutoFarm:FormatDuration(value)
    local seconds = math.max(0, math.floor(tonumber(value) or 0))
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor(seconds % 3600 / 60)

    return string.format("%02d:%02d:%02d", hours, minutes, seconds % 60)
end

function library.AutoFarm:SetPhase(phase, detail)
    self.Phase = phase
    self.Detail = detail or ""
    self:UpdateUI()
end

function library.AutoFarm:SetLabel(name, text)
    local label = self.Labels[name]
    text = tostring(text)

    if self.LabelCache[name] == text then
        return
    end

    if label and type(label.SetText) == "function" then
        local changed = pcall(label.SetText, label, text)

        if changed then
            self.LabelCache[name] = text
        end
    end
end

function library.AutoFarm:UpdateUI()
    local nowClock = os.clock()

    if (self.StateReady or self.Running) and nowClock - self.LastUIProgressAt >= 1 then
        self.LastUIProgressAt = nowClock
        self:SyncProgress()
    end

    self:NormalizeStats()

    local now = os.time()
    local elapsed = self.StartedAt > 0 and now - self.StartedAt or 0
    local runElapsed = self.RunStartedAt > 0 and now - self.RunStartedAt or 0
    local completed = self.Stats.Completed
    local attempts = self.Stats.Attempts
    local successRate = attempts > 0 and completed / attempts * 100 or 0
    local average = completed > 0 and self.Stats.TotalRunTime / completed or 0
    local queueMode = not self:GetQueueFunction() and "Unavailable"
        or self:HasTeleportLoader() and "Loader ready"
        or "Loader placeholder"

    self:SetLabel("Status", "Status: " .. self.Phase .. "\n" .. self.Detail)
    self:SetLabel("Context", "Context: " .. self:GetContext() .. " | Place: " .. tostring(game.PlaceId))
    self:SetLabel("Queue", "Queue: " .. self.QueueStatus .. " | Mode: " .. queueMode)
    self:SetLabel("Session", "Session: " .. self:FormatDuration(elapsed) .. " | Credz: +" .. tostring(math.floor(self.Stats.CashEarned)))
    self:SetLabel("Runs", string.format("Runs: %d completed / %d started | %.1f%%", completed, attempts, successRate))
    self:SetLabel("Failures", "Failures: " .. self.Stats.Failed .. " | Retries: " .. self.Stats.Retries .. " | Replay votes: " .. self.Stats.Replays .. " | Teleports: " .. self.Stats.Teleports)
    self:SetLabel("Timing", "Average: " .. self:FormatDuration(average) .. " | Best: " .. self:FormatDuration(self.Stats.BestRun) .. " | Last: " .. self:FormatDuration(self.Stats.LastRun))
    self:SetLabel("Combat", "NPC attack requests: " .. self.Stats.NPCAttacks .. " | Gate activations: " .. self.Stats.GateActivations)
    self:SetLabel("Run", "Current run: " .. self:FormatDuration(runElapsed) .. " | Gate: " .. self.GateText)
    self:SetLabel("Error", "Last error: " .. self.LastError)
    self:SetLabel("Webhook", "Webhook: " .. self.WebhookStatus)
end

function library.AutoFarm:ResetStats()
    self:SyncProgress()

    local now = os.time()
    local active = self.Running and self.RunStartedAt > 0
    local runCashStart = self:GetEffectiveCredz()
    local runWinsStart = self:GetEffectiveWins()
    local gateStartedAt = active and self.GateStartedAt or 0

    self.StartedAt = now
    self.RunStartedAt = active and now or 0
    self.RunCashStart = runCashStart
    self.RunWinsStart = runWinsStart
    self.GateStartedAt = gateStartedAt
    self.LastError = "None"
    self.GateText = "--"
    self.Stats = {
        Attempts = active and 1 or 0,
        Completed = 0,
        Failed = 0,
        Teleports = 0,
        GateActivations = 0,
        NPCAttacks = 0,
        Retries = 0,
        Replays = 0,
        CashEarned = 0,
        TotalRunTime = 0,
        BestRun = 0,
        LastRun = 0,
    }
    self.LastCredzBalance = runCashStart
    self.LastWins = runWinsStart
    self.PendingCredz = 0
    self.PendingWins = 0
    self:Persist()
    self:UpdateUI()
end

function library.AutoFarm:GetSnapshot()
    if self.StateReady or self.Running then
        self:SyncProgress()
    end

    self:NormalizeStats()

    local events = {}

    for name, value in self.Webhook.Events do
        events[name] = value == true
    end

    if options.RunawaysAutoFarmWebhookEvents then
        table.clear(events)

        for name, value in options.RunawaysAutoFarmWebhookEvents.Value do
            events[name] = value == true
        end
    end

    return {
        Version = self.Version,
        StatsVersion = self.StatsVersion,
        Revision = self.Revision,
        UserId = player.UserId,
        Enabled = self.Running,
        SessionId = self.SessionId,
        TransitionToken = self.TransitionToken,
        ExpectedPlaceId = self.ExpectedPlaceId,
        TransitionAt = self.TransitionAt,
        Phase = self.Phase,
        Detail = self.Detail,
        StartedAt = self.StartedAt,
        RunStartedAt = self.RunStartedAt,
        RunCashStart = self.RunCashStart,
        RunWinsStart = self.RunWinsStart,
        LastCredzBalance = self.LastCredzBalance,
        LastWins = self.LastWins,
        PendingCredz = self.PendingCredz,
        PendingWins = self.PendingWins,
        GateStartedAt = self.GateStartedAt,
        PendingFinish = self.PendingFinish,
        FinishCrossed = self.FinishCrossed,
        PendingAt = self.PendingAt,
        LastGameJob = self.LastGameJob,
        LastError = self.LastError,
        UpdatedAt = os.time(),
        Stats = self.Stats,
        Config = {
            LobbyDelay = options.RunawaysAutoFarmLobbyDelay and options.RunawaysAutoFarmLobbyDelay.Value or self.Config.LobbyDelay,
            GateTimeout = options.RunawaysAutoFarmGateTimeout and options.RunawaysAutoFarmGateTimeout.Value or self.Config.GateTimeout,
            RetryDelay = options.RunawaysAutoFarmRetryDelay and options.RunawaysAutoFarmRetryDelay.Value or self.Config.RetryDelay,
            SafeGateWait = self.Config.SafeGateWait,
            AutoReplay = self.Config.AutoReplay,
        },
        Webhook = {
            Enabled = toggles.RunawaysAutoFarmWebhook and toggles.RunawaysAutoFarmWebhook.Value or self.Webhook.Enabled,
            URL = options.RunawaysAutoFarmWebhookURL and options.RunawaysAutoFarmWebhookURL.Value or self.Webhook.URL,
            Events = events,
        },
    }
end

function library.AutoFarm:Persist()
    self.Revision += 1

    local ok, encoded = pcall(function()
        return game:GetService("HttpService"):JSONEncode(self:GetSnapshot())
    end)

    if not ok then
        return false
    end

    self.LastSnapshot = encoded
    self.LastPersistAt = os.clock()

    local teleportService = game:GetService("TeleportService")

    pcall(teleportService.SetTeleportSetting, teleportService, self.StateKey, encoded)
    pcall(teleportService.SetTeleportSetting, teleportService, self.EnabledKey, self.Running)
    pcall(teleportService.SetTeleportSetting, teleportService, self.SessionKey, self.SessionId)
    pcall(teleportService.SetTeleportSetting, teleportService, self.TransitionKey, self.TransitionToken)

    if type(writefile) == "function" then
        if type(makefolder) == "function" then
            pcall(function()
                if type(isfolder) ~= "function" or not isfolder("MyScriptHub") then
                    makefolder("MyScriptHub")
                end
            end)
            pcall(function()
                if type(isfolder) ~= "function" or not isfolder("MyScriptHub/RUNAWAYS") then
                    makefolder("MyScriptHub/RUNAWAYS")
                end
            end)
        end

        pcall(writefile, self.StatePath, encoded)
    end

    return true
end

function library.AutoFarm:ApplyPreferences(snapshot)
    if type(snapshot) ~= "table" or snapshot.Version ~= self.Version or snapshot.UserId ~= player.UserId then
        return false
    end

    self.Revision = math.max(self.Revision, tonumber(snapshot.Revision) or 0)

    if type(snapshot.Config) == "table" then
        self.Config.LobbyDelay = tonumber(snapshot.Config.LobbyDelay) or self.Config.LobbyDelay
        self.Config.GateTimeout = tonumber(snapshot.Config.GateTimeout) or self.Config.GateTimeout
        self.Config.RetryDelay = tonumber(snapshot.Config.RetryDelay) or self.Config.RetryDelay

        if type(snapshot.Config.SafeGateWait) == "boolean" then
            self.Config.SafeGateWait = snapshot.Config.SafeGateWait
        end

        if type(snapshot.Config.AutoReplay) == "boolean" then
            self.Config.AutoReplay = snapshot.Config.AutoReplay
        end
    end

    if type(snapshot.Webhook) == "table" then
        self.Webhook.Enabled = snapshot.Webhook.Enabled == true
        self.Webhook.URL = tostring(snapshot.Webhook.URL or "")

        if type(snapshot.Webhook.Events) == "table" then
            table.clear(self.Webhook.Events)

            for name, value in snapshot.Webhook.Events do
                self.Webhook.Events[name] = value == true
            end
        end
    end

    return true
end

function library.AutoFarm:ApplySnapshot(snapshot)
    if not self:ApplyPreferences(snapshot) then
        return false
    end

    self.SessionId = tostring(snapshot.SessionId or "")
    self.TransitionToken = tostring(snapshot.TransitionToken or "")
    self.ExpectedPlaceId = tonumber(snapshot.ExpectedPlaceId) or 0
    self.TransitionAt = tonumber(snapshot.TransitionAt) or 0
    self.Revision = tonumber(snapshot.Revision) or 0
    self.StartedAt = tonumber(snapshot.StartedAt) or 0
    self.RunStartedAt = tonumber(snapshot.RunStartedAt) or 0
    self.RunCashStart = tonumber(snapshot.RunCashStart) or 0
    self.RunWinsStart = tonumber(snapshot.RunWinsStart) or 0
    self.LastCredzBalance = tonumber(snapshot.LastCredzBalance)
    self.LastWins = tonumber(snapshot.LastWins)
    self.PendingCredz = math.max(0, tonumber(snapshot.PendingCredz) or 0)
    self.PendingWins = math.max(0, tonumber(snapshot.PendingWins) or 0)
    self.GateStartedAt = tonumber(snapshot.GateStartedAt) or 0
    self.PendingFinish = snapshot.PendingFinish == true
    self.FinishCrossed = snapshot.FinishCrossed == true
    self.PendingAt = tonumber(snapshot.PendingAt) or 0
    self.LastGameJob = tostring(snapshot.LastGameJob or "")
    self.LastError = tostring(snapshot.LastError or "None")
    self.BalanceWarmupUntil = os.clock() + 10

    local legacyStats = (tonumber(snapshot.StatsVersion) or 1) < self.StatsVersion

    if type(snapshot.Stats) == "table" then
        for name, value in self.Stats do
            self.Stats[name] = tonumber(snapshot.Stats[name]) or value
        end
    end

    if legacyStats then
        local attempts = math.max(0, math.floor(tonumber(self.Stats.Attempts) or 0))
        local active = self.RunStartedAt > 0 and 1 or 0
        local resolved = math.max(0, attempts - active)
        local failed = math.min(math.max(0, math.floor(tonumber(self.Stats.Failed) or 0)), resolved)
        local currentCredz = self:GetCash()
        local currentWins = self:GetWins()

        self.Stats.Attempts = attempts
        self.Stats.Completed = math.max(0, resolved - failed)
        self.Stats.Failed = failed
        self.Stats.CashEarned = 0
        self.PendingCredz = 0
        self.PendingWins = 0

        if type(currentCredz) == "number"
            and (type(self.LastCredzBalance) ~= "number" or currentCredz > self.LastCredzBalance)
        then
            self.LastCredzBalance = currentCredz
        end

        if type(currentWins) == "number" and (type(self.LastWins) ~= "number" or currentWins > self.LastWins) then
            self.LastWins = currentWins
        end

        self.RunCashStart = tonumber(self.LastCredzBalance) or 0
        self.RunWinsStart = tonumber(self.LastWins) or 0
    end

    self:NormalizeStats()

    if type(self.LastCredzBalance) ~= "number" then
        self.LastCredzBalance = self:GetCash()
        self.PendingCredz = 0
    end

    if type(self.LastWins) ~= "number" then
        self.LastWins = self:GetWins()
        self.PendingWins = 0
    end

    if self.RunCashStart <= 0 and type(self.LastCredzBalance) == "number" then
        self.RunCashStart = self:GetEffectiveCredz()
    end

    if self.RunWinsStart <= 0 and type(self.LastWins) == "number" then
        self.RunWinsStart = self:GetEffectiveWins()
    end

    self.ResumeRequested = self.SessionId ~= ""
        and snapshot.Enabled == true
        and os.time() - (tonumber(snapshot.UpdatedAt) or 0) <= 900

    if snapshot.Enabled == true and not self.ResumeRequested then
        self.LastError = "Saved Auto Farm session expired"

        pcall(function()
            game:GetService("TeleportService"):SetTeleportSetting(self.EnabledKey, false)
        end)
    end

    self.LastSnapshot = nil

    return true
end

function library.AutoFarm:LoadState()
    local transitionToken = tostring(env.RunawaysAutoFarmTransitionToken or "")
    local queuedState = env.RunawaysAutoFarmQueuedState
    local resumeBest
    local resumeUpdated = -1
    local resumeRevision = -1
    local preferenceBest
    local preferenceUpdated = -1
    local preferenceRevision = -1

    env.RunawaysAutoFarmTransitionToken = nil
    env.RunawaysAutoFarmQueuedState = nil

    local function consider(value)
        if type(value) == "string" then
            local ok, decoded = pcall(game:GetService("HttpService").JSONDecode, game:GetService("HttpService"), value)

            if not ok then
                return
            end

            value = decoded
        end

        if type(value) ~= "table"
            or value.Version ~= self.Version
            or value.UserId ~= player.UserId
        then
            return
        end

        local updated = tonumber(value.UpdatedAt) or 0
        local revision = tonumber(value.Revision) or 0

        if updated > preferenceUpdated or updated == preferenceUpdated and revision >= preferenceRevision then
            preferenceBest = value
            preferenceUpdated = updated
            preferenceRevision = revision
        end

        local transitionAt = tonumber(value.TransitionAt) or 0

        if transitionToken ~= ""
            and tostring(value.TransitionToken or "") == transitionToken
            and (game.PlaceId == self.LobbyPlaceId or game.PlaceId == self.GamePlaceId)
            and transitionAt > 0
            and math.abs(os.time() - transitionAt) <= 900
            and tostring(value.SessionId or "") ~= ""
            and value.Enabled == true
            and os.time() - updated <= 900
            and (updated > resumeUpdated or updated == resumeUpdated and revision >= resumeRevision)
        then
            resumeBest = value
            resumeUpdated = updated
            resumeRevision = revision
        end
    end

    consider(queuedState)

    pcall(function()
        consider(game:GetService("TeleportService"):GetTeleportSetting(self.StateKey))
    end)

    if type(readfile) == "function" and type(isfile) == "function" then
        pcall(function()
            if isfile(self.StatePath) then
                consider(readfile(self.StatePath))
            end
        end)
    end

    if resumeBest and self:ApplySnapshot(resumeBest) and self.ResumeRequested then
        self.ExpectedPlaceId = game.PlaceId
        return
    end

    if preferenceBest then
        self:ApplyPreferences(preferenceBest)
    end

    self.ResumeRequested = false
    self.SessionId = ""
    self.TransitionToken = ""
    self.ExpectedPlaceId = 0
    self.TransitionAt = 0
    self.StartedAt = 0
    self.RunStartedAt = 0
    self.RunCashStart = 0
    self.RunWinsStart = 0
    self.LastCredzBalance = self:GetCash()
    self.LastWins = self:GetWins()
    self.PendingCredz = 0
    self.PendingWins = 0
    self.GateStartedAt = 0
    self.PendingFinish = false
    self.FinishCrossed = false
    self.PendingAt = 0
    self.LastGameJob = ""
    self.LastError = "None"
    self.GateText = "--"

    for name in self.Stats do
        self.Stats[name] = 0
    end
end

function library.AutoFarm:ApplyStoredOptions()
    if options.RunawaysAutoFarmLobbyDelay then
        options.RunawaysAutoFarmLobbyDelay:SetValue(self.Config.LobbyDelay)
    end

    if options.RunawaysAutoFarmGateTimeout then
        options.RunawaysAutoFarmGateTimeout:SetValue(self.Config.GateTimeout)
    end

    if options.RunawaysAutoFarmRetryDelay then
        options.RunawaysAutoFarmRetryDelay:SetValue(self.Config.RetryDelay)
    end

    if toggles.RunawaysAutoFarmSafeGateWait then
        toggles.RunawaysAutoFarmSafeGateWait:SetValue(self.Config.SafeGateWait)
    end

    if toggles.RunawaysAutoFarmAutoReplay then
        toggles.RunawaysAutoFarmAutoReplay:SetValue(self.Config.AutoReplay)
    end

    if options.RunawaysAutoFarmWebhookURL then
        options.RunawaysAutoFarmWebhookURL:SetValue(self.Webhook.URL)
    end

    if options.RunawaysAutoFarmWebhookEvents then
        options.RunawaysAutoFarmWebhookEvents:SetValue(self.Webhook.Events)
    end

    if toggles.RunawaysAutoFarmWebhook then
        toggles.RunawaysAutoFarmWebhook:SetValue(self.Webhook.Enabled)
    end
end

function library.AutoFarm:BuildWebhook(event, detail)
    local elapsed = self.StartedAt > 0 and os.time() - self.StartedAt or 0

    return {
        username = "RUNAWAYS",
        allowed_mentions = {
            parse = {},
        },
        embeds = {
            {
                title = "Auto Farm | " .. event,
                description = detail or self.Detail,
                color = event == "Error" and 15158332 or event == "Run Completed" and 5763719 or 3447003,
                fields = {
                    {
                        name = "Player",
                        value = player.DisplayName .. " (@" .. player.Name .. ")",
                        inline = true,
                    },
                    {
                        name = "Context",
                        value = self:GetContext() .. " | " .. tostring(game.PlaceId),
                        inline = true,
                    },
                    {
                        name = "Runs",
                        value = string.format(
                            "%d completed / %d started | %d replay votes",
                            self.Stats.Completed,
                            self.Stats.Attempts,
                            self.Stats.Replays
                        ),
                        inline = true,
                    },
                    {
                        name = "Economy",
                        value = "Session Credz: +" .. tostring(math.floor(self.Stats.CashEarned)),
                        inline = true,
                    },
                    {
                        name = "Combat",
                        value = "NPC requests: " .. self.Stats.NPCAttacks,
                        inline = true,
                    },
                    {
                        name = "Session",
                        value = self:FormatDuration(elapsed),
                        inline = true,
                    },
                },
                footer = {
                    text = "RUNAWAYS Auto Farm",
                },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            },
        },
    }
end

function library.AutoFarm:SendWebhook(event, detail, force)
    local enabled = toggles.RunawaysAutoFarmWebhook and toggles.RunawaysAutoFarmWebhook.Value or self.Webhook.Enabled
    local selected = options.RunawaysAutoFarmWebhookEvents and options.RunawaysAutoFarmWebhookEvents.Value or self.Webhook.Events

    if not force and (not enabled or not selected[event]) then
        return
    end

    local url = options.RunawaysAutoFarmWebhookURL and options.RunawaysAutoFarmWebhookURL.Value or self.Webhook.URL
    local requestFunction = self:GetRequestFunction()

    if not requestFunction then
        self.WebhookStatus = "HTTP unavailable"
        self:UpdateUI()
        return
    end

    url = tostring(url or ""):match("^%s*(.-)%s*$")

    if not url:match("^https://[%w%.%-]*discord[a-z]*%.com/api/webhooks/%d+/[%w_%-]+") then
        self.WebhookStatus = "Invalid URL"
        self:UpdateUI()
        return
    end

    local ok, body = pcall(function()
        return game:GetService("HttpService"):JSONEncode(self:BuildWebhook(event, detail))
    end)

    if not ok then
        self.WebhookStatus = "Encode failed"
        self:UpdateUI()
        return
    end

    local generation = self.WebhookGeneration
    local scheduledAt = math.max(os.clock(), self.LastWebhookAt + 1)

    self.LastWebhookAt = scheduledAt
    self.WebhookStatus = "Sending " .. event
    self:UpdateUI()

    task.spawn(function()
        local status = 0

        for attempt = 1, 2 do
            local waitFor = attempt == 1 and math.max(0, scheduledAt - os.clock()) or 0

            if waitFor > 0 then
                task.wait(waitFor)
            end

            if generation ~= self.WebhookGeneration or library.Unloaded then
                return
            end

            local sent, response = pcall(requestFunction, {
                Url = url,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                },
                Body = body,
            })

            status = sent and tonumber(response and (response.StatusCode or response.Status)) or 0

            if sent and status >= 200 and status < 300 then
                self.WebhookStatus = "Delivered"
                self:UpdateUI()
                return
            end

            local retryAfter = 1.5 * attempt

            if status == 429 and response and type(response.Body) == "string" then
                pcall(function()
                    local decoded = game:GetService("HttpService"):JSONDecode(response.Body)
                    retryAfter = math.max(retryAfter, tonumber(decoded.retry_after) or 0)
                end)
            end

            task.wait(retryAfter)
        end

        if generation == self.WebhookGeneration and not library.Unloaded then
            self.WebhookStatus = status > 0 and "HTTP " .. status or "Request failed"
            self:UpdateUI()
        end
    end)
end

function library.AutoFarm:QueueTeleport(reason, expectedPlaceId)
    expectedPlaceId = tonumber(expectedPlaceId)
    local queueError = self:GetTeleportQueueError(expectedPlaceId)

    if queueError then
        self.QueueStatus = queueError
        self:UpdateUI()
        return false, self.QueueStatus
    end

    local queueFunction = self:GetQueueFunction()
    local loader = self:GetTeleportLoader()

    if self.QueueJob == game.JobId and self.TransitionToken ~= "" then
        self.ExpectedPlaceId = expectedPlaceId
        self.TransitionAt = os.time()

        if not self:Persist() then
            return false, "Transition state is unavailable"
        end

        self.QueueStatus = "Armed: " .. tostring(reason)
        self:UpdateUI()
        return true
    end

    local transitionToken = table.concat({
        tostring(self.SessionId),
        game.JobId,
        tostring(expectedPlaceId),
        tostring(os.time()),
        tostring(math.random(100000, 999999)),
    }, ":")

    self.TransitionToken = transitionToken
    self.ExpectedPlaceId = expectedPlaceId
    self.TransitionAt = os.time()

    if not self:Persist() or type(self.LastSnapshot) ~= "string" then
        return false, "Transition state is unavailable"
    end

    local snapshot = self.LastSnapshot

    local payload = string.format(
        "if not game:IsLoaded() then game.Loaded:Wait() end\n"
            .. "if game.PlaceId == %d or game.PlaceId == %d then\n"
            .. "local p = game:GetService(%q)\n"
            .. "while not p.LocalPlayer do task.wait() end\n"
            .. "local t = game:GetService(%q)\n"
            .. "local v = nil\n"
            .. "pcall(function() v = t:GetTeleportSetting(%q) end)\n"
            .. "if t:GetTeleportSetting(%q) ~= false and tostring(v or '') == %q then\n"
            .. "local e = getgenv and getgenv() or _G\n"
            .. "if e.RunawaysAutoFarmQueueExecution ~= %q then\n"
            .. "e.RunawaysAutoFarmQueueExecution = %q\n"
            .. "e.RunawaysAutoFarmQueueLoading = %q\n"
            .. "local s = false\n"
            .. "for i = 1, 3 do\n"
            .. "e.RunawaysAutoFarmTransitionToken = %q\n"
            .. "e.RunawaysAutoFarmQueuedState = %q\n"
            .. "local o = pcall(function()\n"
            .. "%s\n"
            .. "end)\n"
            .. "if o then s = true break end\n"
            .. "task.wait(i)\n"
            .. "end\n"
            .. "if e.RunawaysAutoFarmQueueLoading == %q then e.RunawaysAutoFarmQueueLoading = nil end\n"
            .. "if not s and e.RunawaysAutoFarmQueueExecution == %q then\n"
            .. "e.RunawaysAutoFarmQueueExecution = nil\n"
            .. "if e.RunawaysScriptLoading == coroutine.running() then\n"
            .. "e.RunawaysScriptLoading = nil\n"
            .. "e.RunawaysScriptLoadingAt = nil\n"
            .. "e.RunawaysScriptLoadingToken = nil\n"
            .. "end\n"
            .. "end\n"
            .. "end\n"
            .. "end\n"
            .. "end",
        self.LobbyPlaceId,
        self.GamePlaceId,
        "Players",
        "TeleportService",
        self.TransitionKey,
        self.EnabledKey,
        transitionToken,
        transitionToken,
        transitionToken,
        transitionToken,
        transitionToken,
        snapshot,
        loader,
        transitionToken,
        transitionToken
    )
    local ok, message = pcall(queueFunction, payload)

    if not ok then
        self.TransitionToken = ""
        self.ExpectedPlaceId = 0
        self.TransitionAt = 0
        self.QueueStatus = "Queue failed"
        self:Persist()
        self:UpdateUI()
        return false, tostring(message)
    end

    self.QueueJob = game.JobId
    self.QueueStatus = "Armed: " .. tostring(reason)
    self:UpdateUI()

    return true
end

function library.AutoFarm:GetOwnedCar()
    if not flow.PlayerDataClient or type(flow.PlayerDataClient.getObserver) ~= "function" then
        return
    end

    local ok, observer = pcall(flow.PlayerDataClient.getObserver, "cars")

    if not ok or not observer or type(observer.get) ~= "function" then
        return
    end

    local read, cars = pcall(observer.get, observer)

    if not read or type(cars) ~= "table" then
        return
    end

    local names = {}

    for name in cars do
        names[#names + 1] = tostring(name)
    end

    table.sort(names)

    return names[1]
end

function library.AutoFarm:WaitForTeleport(token, duration, failureGeneration)
    local expires = os.clock() + duration
    failureGeneration = tonumber(failureGeneration) or self.TeleportFailureGeneration

    if self.TeleportFailureGeneration ~= failureGeneration then
        return false, "Teleport failed"
    end

    repeat
        if self.TeleportFailureGeneration ~= failureGeneration then
            return false, "Teleport failed"
        end

        if self.Teleporting then
            return true, "Teleport started"
        end

        task.wait(0.25)
    until not self.Running
        or self.Token ~= token
        or library.Unloaded
        or self.TeleportFailureGeneration ~= failureGeneration
        or os.clock() >= expires

    if self.Teleporting and self.TeleportFailureGeneration == failureGeneration then
        return true, "Teleport started"
    end

    return false, "Teleport timed out"
end


function library.AutoFarm:DismissTeleportError()
    local guiService = game:GetService("GuiService")

    pcall(guiService.ClearError, guiService)

    local promptGui = game:GetService("CoreGui"):FindFirstChild("RobloxPromptGui")
    local overlay = promptGui and promptGui:FindFirstChild("promptOverlay")
    local errorPrompt = overlay and (overlay:FindFirstChild("ErrorPrompt") or overlay:FindFirstChild("errorPrompt"))

    if not errorPrompt then
        return
    end

    local ok, buttons = pcall(errorPrompt.QueryDescendants, errorPrompt, "TextButton")

    if not ok then
        return
    end

    for _, button in buttons do
        local text = tostring(button.Text or ""):lower()

        if text == "ok" or text:find("reconnect", 1, true) then
            if type(firesignal) == "function" then
                pcall(firesignal, button.MouseButton1Click)
            else
                pcall(button.Activate, button)
            end

            break
        end
    end
end


function library.AutoFarm:StartTeleportRecovery(token)
    if not self.Running or self.Token ~= token or library.Unloaded then
        return
    end

    self.TeleportRecovering = true
    self.TeleportRecoveryGeneration += 1

    local generation = self.TeleportRecoveryGeneration
    local attempt = math.max(1, tonumber(self.TeleportRetryCount) or 1)
    local delays = { 2, 5, 10, 20, 30 }
    local delay = self.TeleportRetryDelay > 0 and self.TeleportRetryDelay or delays[math.min(attempt, #delays)]

    self.TeleportRetryDelay = 0
    self:SetPhase("Teleport Recovery", "Rejoining in " .. tostring(delay) .. " seconds | Attempt " .. tostring(attempt))
    self:Persist()

    task.spawn(function()
        local expires = os.clock() + delay

        repeat
            task.wait(0.25)
        until not self.Running
            or self.Token ~= token
            or library.Unloaded
            or self.TeleportRecoveryGeneration ~= generation
            or os.clock() >= expires

        if not self.Running
            or self.Token ~= token
            or library.Unloaded
            or self.TeleportRecoveryGeneration ~= generation
        then
            return
        end

        self:DismissTeleportError()

        local target = tonumber(self.TeleportRetryTarget)
        local retryOptions = self.TeleportRetryOptions
        local targetValid = target == self.LobbyPlaceId or target == self.GamePlaceId

        if not targetValid then
            target = self:IsAutoReplayEnabled() and self.GamePlaceId or self.LobbyPlaceId
        end

        local exactRetry = attempt <= 3
            and targetValid
            and typeof(retryOptions) == "Instance"
            and retryOptions:IsA("TeleportOptions")

        if not exactRetry then
            retryOptions = nil
        end

        self.QueueJob = nil
        self.Teleporting = false

        local queued, queueError = self:QueueTeleport("teleport recovery", target)

        if not queued then
            self.Stats.Retries += 1
            self.TeleportRetryCount += 1
            self.LastError = tostring(queueError)
            self:StartTeleportRecovery(token)
            return
        end

        self:SetPhase(
            exactRetry and "Retrying Teleport" or target == self.GamePlaceId and "Rejoining Game" or "Rejoining Lobby",
            "Recovery attempt " .. tostring(attempt)
        )
        self:Persist()

        local sourceJob = game.JobId
        local failureGeneration = self.TeleportFailureGeneration
        local called, teleportError = pcall(function()
            local teleportService = game:GetService("TeleportService")

            if exactRetry then
                teleportService:TeleportAsync(target, { player }, retryOptions)
            else
                teleportService:Teleport(target, player)
            end
        end)

        if not called then
            self.Teleporting = false
            self.Stats.Retries += 1
            self.TeleportRetryCount += 1
            self.LastError = tostring(teleportError)
            self:StartTeleportRecovery(token)
            return
        end

        local timeout = os.clock() + 30

        repeat
            task.wait(0.25)
        until not self.Running
            or self.Token ~= token
            or library.Unloaded
            or self.TeleportRecoveryGeneration ~= generation
            or self.TeleportFailureGeneration ~= failureGeneration
            or game.JobId ~= sourceJob
            or os.clock() >= timeout

        if self.Running
            and self.Token == token
            and not library.Unloaded
            and self.TeleportRecoveryGeneration == generation
            and self.TeleportFailureGeneration == failureGeneration
            and game.JobId == sourceJob
        then
            self.Teleporting = false
            self.Stats.Retries += 1
            self.TeleportRetryCount += 1
            self.LastError = "Teleport timed out"
            self:StartTeleportRecovery(token)
        end
    end)
end


function library.AutoFarm:HandleTeleportFailure(result, message, targetPlaceId, teleportOptions)
    if not self.Running or library.Unloaded then
        return
    end

    task.defer(self.DismissTeleportError, self)

    if os.clock() - self.LastTeleportFailureAt < 0.75 then
        return
    end

    self.LastTeleportFailureAt = os.clock()

    local target = tonumber(targetPlaceId)

    if target ~= self.LobbyPlaceId and target ~= self.GamePlaceId then
        target = tonumber(self.ExpectedPlaceId)
    end

    if target ~= self.LobbyPlaceId and target ~= self.GamePlaceId then
        target = self:GetContext() == "Game" and self:IsAutoReplayEnabled() and self.GamePlaceId
            or self.LobbyPlaceId
    end

    self.TeleportFailureGeneration += 1
    self.Teleporting = false
    self.QueueJob = nil
    self.ReplayRequested = false
    self.TeleportRetryCount += 1
    self.TeleportRetryTarget = target
    self.TeleportRetryOptions = typeof(teleportOptions) == "Instance" and teleportOptions or nil
    self.TeleportRetryDelay = result == Enum.TeleportResult.Flooded and 15 or 0
    self.Stats.Retries += 1
    self.LastError = tostring(message or result or "Teleport failed")
    self:SetCrossNoclip(false)
    self:SetPhase("Teleport Failed", self.LastError)
    self:Persist()
    self:SendWebhook("Error", self.LastError)
    self:StartTeleportRecovery(self.Token)
end

function library.AutoFarm:GetEndScreen()
    local playerGui = player:FindFirstChildOfClass("PlayerGui")
    local endFrame = playerGui and playerGui:FindFirstChild("EndFrame", true)

    if not playerGui then
        return
    end

    local function visible(instance)
        local current = instance

        while current and current ~= playerGui do
            if current:IsA("GuiObject") and not current.Visible then
                return false
            end

            if current:IsA("LayerCollector") and not current.Enabled then
                return false
            end

            current = current.Parent
        end

        return current == playerGui
    end

    local function layer(instance)
        local current = instance

        while current and current ~= playerGui do
            if current:IsA("LayerCollector") then
                return current
            end

            current = current.Parent
        end
    end

    if endFrame then
        if not visible(endFrame) then
            return
        end

        local escaped = endFrame:FindFirstChild("Escaped", true)
        local captured = endFrame:FindFirstChild("Captured", true)
        local option = endFrame:FindFirstChild("Replay", true) or endFrame:FindFirstChild("Lobby", true)

        if escaped and visible(escaped) then
            return endFrame, "Escaped"
        end

        if captured and visible(captured) then
            return endFrame, "Captured"
        end

        if option and visible(option) then
            return endFrame, "Ended"
        end

        for _, instance in endFrame:GetDescendants() do
            if instance:IsA("GuiObject") and visible(instance) then
                local name = instance.Name:lower()
                local text = (instance:IsA("TextLabel") or instance:IsA("TextButton")) and instance.Text:lower() or ""
                local isCaptured = name:find("captured", 1, true) ~= nil or text:find("captured", 1, true) ~= nil
                local isEscaped = name:find("escaped", 1, true) ~= nil or text:find("escaped", 1, true) ~= nil

                if isCaptured or isEscaped then
                    return endFrame, isCaptured and "Captured" or "Escaped"
                end
            end
        end

        return
    end

    if os.clock() - self.LastEndScreenScanAt < 1 then
        return
    end

    self.LastEndScreenScanAt = os.clock()

    for _, instance in playerGui:GetDescendants() do
        if instance:IsA("GuiObject") and visible(instance) then
            local name = instance.Name:lower()
            local text = (instance:IsA("TextLabel") or instance:IsA("TextButton")) and instance.Text:lower() or ""
            local isCaptured = name:find("captured", 1, true) ~= nil or text:find("captured", 1, true) ~= nil
            local isEscaped = name:find("escaped", 1, true) ~= nil or text:find("escaped", 1, true) ~= nil

            if isCaptured or isEscaped then
                return layer(instance) or endFrame, isCaptured and "Captured" or "Escaped"
            end
        end
    end

    return
end

function library.AutoFarm:IsVisible(instance)
    local playerGui = player:FindFirstChildOfClass("PlayerGui")
    local current = instance

    while current and current ~= playerGui do
        if current:IsA("GuiObject") and not current.Visible then
            return false
        end

        if current:IsA("LayerCollector") and not current.Enabled then
            return false
        end

        current = current.Parent
    end

    return current == playerGui
end

function library.AutoFarm:GetReplayButton(endFrame)
    if not endFrame then
        return
    end

    local function matches(button)
        if not button:IsA("GuiButton") or not self:IsVisible(button) then
            return false
        end

        local name = button.Name:lower()
        local text = button:IsA("TextButton") and tostring(button.Text or ""):lower() or ""

        if text == "" then
            local label = button:FindFirstChildWhichIsA("TextLabel", true)
            text = label and tostring(label.Text or ""):lower() or ""
        end

        return name:find("replay", 1, true) ~= nil or text:find("replay", 1, true) ~= nil
    end

    local direct = endFrame:FindFirstChild("Replay", true)

    if direct then
        if matches(direct) then
            return direct
        end

        local nested = direct:FindFirstChildWhichIsA("GuiButton", true)

        if nested and matches(nested) then
            return nested
        end
    end

    for _, button in endFrame:GetDescendants() do
        if matches(button) then
            return button
        end
    end
end

function library.AutoFarm:GetReplayVotes(button)
    if not button then
        return
    end

    local text = button:IsA("TextButton") and tostring(button.Text or "") or ""

    if text == "" then
        local label = button:FindFirstChildWhichIsA("TextLabel", true)
        text = label and tostring(label.Text or "") or ""
    end

    local current, required = text:match("(%d+)%s*/%s*(%d+)")

    return tonumber(current), tonumber(required)
end

function library.AutoFarm:RequestReplay(button)
    local lastError = "Replay is unavailable"

    if flow.GameManager and type(flow.GameManager.Replay) == "function" then
        local called, result = pcall(flow.GameManager.Replay)

        if called and result ~= false then
            return true
        end

        lastError = tostring(result or "Replay was rejected")
    end

    if button then
        if type(firesignal) == "function" then
            local clicked, clickError = pcall(firesignal, button.MouseButton1Click)

            if clicked then
                return true
            end

            lastError = tostring(clickError)
        else
            local clicked, clickError = pcall(button.Activate, button)

            if clicked then
                return true
            end

            lastError = tostring(clickError)
        end
    end

    return false, lastError
end

function library.AutoFarm:GetResultCredz(endFrame)
    local total = endFrame and endFrame:FindFirstChild("Total", true)

    if not total then
        return
    end

    for _, name in { "RobloxPlus", "Credz" } do
        local label = total:FindFirstChild(name, true)

        if label and (label:IsA("TextLabel") or label:IsA("TextButton")) and self:IsVisible(label) then
            local digits = tostring(label.Text or ""):gsub("[^%d]", "")
            local value = tonumber(digits)

            if value then
                return value
            end
        end
    end

    for _, label in total:GetDescendants() do
        if (label:IsA("TextLabel") or label:IsA("TextButton")) and self:IsVisible(label) then
            local text = tostring(label.Text or "")

            if text:lower():find("total:", 1, true) then
                local digits = text:gsub("[^%d]", "")
                local value = tonumber(digits)

                if value then
                    return value
                end
            end
        end
    end
end

function library.AutoFarm:FinalizeRun(outcome, detail, reward)
    if self.ResultFinalized then
        return
    end

    local duration = self.RunStartedAt > 0 and math.max(0, os.time() - self.RunStartedAt) or 0
    local active = self.RunStartedAt > 0

    self:SyncProgress()

    local effectiveCredz = self:GetEffectiveCredz()
    local effectiveWins = self:GetEffectiveWins()
    local earned = math.max(0, effectiveCredz - (tonumber(self.RunCashStart) or effectiveCredz))
    local reported = tonumber(reward)

    if active and reported and reported > earned then
        local missing = reported - earned

        self.Stats.CashEarned += missing
        self.PendingCredz += missing
        effectiveCredz += missing
        earned = reported
    end

    self:ReleaseSafeZone()
    self.ResultFinalized = true

    if active then
        self.Stats.Attempts = math.max(
            self.Stats.Attempts,
            self.Stats.Completed + self.Stats.Failed + 1
        )
    end

    if active and outcome == "Escaped" then
        self.Stats.Completed += 1

        if effectiveWins <= (tonumber(self.RunWinsStart) or effectiveWins) then
            self.PendingWins += 1
            effectiveWins += 1
        end

        self.Stats.LastRun = duration
        self.Stats.TotalRunTime += duration

        if self.Stats.BestRun == 0 or duration < self.Stats.BestRun then
            self.Stats.BestRun = duration
        end
    elseif active then
        self.Stats.Failed += 1
        self.Stats.LastRun = duration
    end

    self.PendingFinish = false
    self.FinishCrossed = false
    self.PendingAt = 0
    self.RunStartedAt = 0
    self.RunCashStart = effectiveCredz
    self.RunWinsStart = effectiveWins
    self.GateStartedAt = 0
    self.GatePassage = nil
    self.GateText = "--"

    if outcome == "Escaped" then
        self.LastError = "None"
        self:SetPhase("Run Completed", (detail or "Finish confirmed") .. " | +" .. tostring(math.floor(earned)) .. " Credz")
        self:Persist()

        if active then
            self:SendWebhook("Run Completed", self.Detail)
        end
    else
        self.LastError = "Run captured"
        self:SetPhase("Run Captured", detail or "Preparing the next run")
        self:Persist()

        if active then
            self:SendWebhook("Error", self.LastError)
        end
    end
end

function library.AutoFarm:CompletePending(detail)
    if not self.PendingFinish then
        return
    end

    local valid = self.LastGameJob ~= ""
        and self.LastGameJob ~= game.JobId
        and self.PendingAt > 0
        and self.FinishCrossed
        and os.time() - self.PendingAt <= 600

    if not valid then
        self.PendingFinish = false
        self.FinishCrossed = false
        self.PendingAt = 0
        self.LastError = "Pending completion expired"
        return
    end

    self:FinalizeRun("Escaped", detail or "Transition confirmed")
end

function library.AutoFarm:HandleEndScreen(token)
    if self.ResultBusy then
        return false, "Result is already being handled"
    end

    local endFrame, outcome = self:GetEndScreen()

    if not endFrame then
        return false, "Result screen is unavailable"
    end

    self.ResultBusy = true
    self:ReleaseSafeZone()
    local resultMap = workspace:FindFirstChild("Map")
    local resultCharacter = player.Character
    local resultRoot = resultCharacter and resultCharacter:FindFirstChild("HumanoidRootPart")
    local resultPosition = resultRoot and resultRoot.Position
    local resultPrompt = teleports:GetEndPrompt()
    local resultPromptEnabled = resultPrompt and resultPrompt.Enabled

    if outcome == "Ended" then
        local outcomeExpires = os.clock() + 2

        repeat
            task.wait(0.1)
            endFrame, outcome = self:GetEndScreen()
        until outcome ~= "Ended"
            or not endFrame
            or not self.Running
            or self.Token ~= token
            or os.clock() >= outcomeExpires
    end

    if outcome == "Escaped" or outcome == "Ended" and self.FinishCrossed then
        outcome = "Escaped"
    else
        outcome = "Captured"
    end

    local reward
    local rewardExpires = os.clock() + 3

    repeat
        reward = self:GetResultCredz(endFrame)

        if reward then
            break
        end

        task.wait(0.1)
    until not self.Running
        or self.Token ~= token
        or library.Unloaded
        or os.clock() >= rewardExpires

    if not self.Running or self.Token ~= token or library.Unloaded then
        self.ResultBusy = false
        return true, "Stopped"
    end

    self:FinalizeRun(
        outcome,
        outcome == "Escaped" and "Finish confirmed" or "The run ended before the finish",
        reward
    )

    if not self.Running or self.Token ~= token then
        self.ResultBusy = false
        return true, "Stopped"
    end

    local autoReplay = self:IsAutoReplayEnabled()

    if autoReplay then
        local replayStartedAt = os.clock()
        local replayExpires = replayStartedAt + 45
        local nextRequestAt = replayStartedAt
        local hiddenAt
        local queued = false
        local requests = 0

        self.ReplayRequested = true
        self:SetPhase("Auto Replay", "Waiting for the replay control")

        repeat
            self.RunHeartbeat = os.clock()

            if self.Teleporting then
                return true, "Teleporting"
            end

            local currentFrame = self:GetEndScreen()

            if not currentFrame then
                hiddenAt = hiddenAt or os.clock()

                local currentMap = workspace:FindFirstChild("Map")
                local currentCharacter = player.Character
                local currentHumanoid = currentCharacter and currentCharacter:FindFirstChildOfClass("Humanoid")
                local currentRoot = currentCharacter and currentCharacter:FindFirstChild("HumanoidRootPart")
                local currentPrompt = teleports:GetEndPrompt()
                local reset = currentMap and resultMap and currentMap ~= resultMap
                    or currentCharacter and resultCharacter and currentCharacter ~= resultCharacter
                    or currentPrompt and resultPrompt and currentPrompt ~= resultPrompt
                    or resultPrompt
                        and currentPrompt == resultPrompt
                        and not resultPromptEnabled
                        and currentPrompt.Enabled
                    or resultPosition
                        and currentRoot
                        and (currentRoot.Position - resultPosition).Magnitude >= 250

                if reset
                    and currentHumanoid
                    and currentHumanoid.Health > 0
                    and os.clock() - hiddenAt >= 0.75
                then
                    self.LastGameJob = ""
                    self.ReplayRequested = false
                    self.ResultBusy = false
                    self.QueueStatus = "Replay started"
                    self:Persist()
                    task.wait(1)
                    return true, "Replay"
                end
            else
                hiddenAt = nil
                endFrame = currentFrame

                if os.clock() >= nextRequestAt then
                    local replayButton = self:GetReplayButton(endFrame)
                    local currentVotes, requiredVotes = self:GetReplayVotes(replayButton)
                    local voteComplete = currentVotes
                        and requiredVotes
                        and requiredVotes > 0
                        and currentVotes >= requiredVotes

                    if voteComplete then
                        self:SetPhase("Auto Replay", "Replay vote confirmed")
                        nextRequestAt = os.clock() + 5
                    elseif replayButton or os.clock() - replayStartedAt >= 8 then
                        if not queued then
                            local queueError
                            queued, queueError = self:QueueTeleport("replay", self.GamePlaceId)

                            if not queued then
                                self.LastError = tostring(queueError)
                                self:SetPhase("Auto Replay", "Waiting for the teleport loader")
                                nextRequestAt = os.clock() + 3
                            end
                        end

                        if queued and requests < 10 then
                            local firstRequest = requests == 0

                            if firstRequest then
                                self.Stats.Replays += 1
                                self:SetPhase("Auto Replay", "Submitting replay vote")
                                self:Persist()
                            end

                            local requested, replayError = self:RequestReplay(replayButton)

                            if requested then
                                requests += 1
                                self:SetPhase("Auto Replay", "Replay vote submitted")
                            else
                                if firstRequest then
                                    self.Stats.Replays = math.max(0, self.Stats.Replays - 1)
                                    self:Persist()
                                end

                                self.LastError = tostring(replayError)
                                self:SetPhase("Auto Replay", self.LastError)
                            end

                            nextRequestAt = os.clock() + 2
                        elseif queued then
                            nextRequestAt = os.clock() + 3
                        end
                    else
                        nextRequestAt = os.clock() + 0.5
                    end
                end
            end

            task.wait(0.25)
        until not self.Running
            or self.Token ~= token
            or library.Unloaded
            or os.clock() >= replayExpires

        self.ReplayRequested = false

        if not self.Running or self.Token ~= token or library.Unloaded then
            self.ResultBusy = false
            return true, "Stopped"
        end

        local queuedReplay, queueError = self:QueueTeleport("replay recovery", self.GamePlaceId)

        if not queuedReplay then
            self.ResultBusy = false
            return false, tostring(queueError)
        end

        self:SetPhase("Restarting Game", "Replay did not start")

        local failureGeneration = self.TeleportFailureGeneration
        local called, replayError = pcall(
            game:GetService("TeleportService").Teleport,
            game:GetService("TeleportService"),
            self.GamePlaceId,
            player
        )

        if not called then
            self.ResultBusy = false
            return false, tostring(replayError)
        end

        if self:WaitForTeleport(token, 30, failureGeneration) then
            return true, "Teleporting"
        end

        if self.TeleportRecovering then
            return false, "Teleport recovery active"
        end

        self.ResultBusy = false

        return false, "Game restart did not start"
    end

    self.ReplayRequested = false

    if not self.Running or self.Token ~= token then
        self.ResultBusy = false
        return true, "Stopped"
    end

    if not flow.GameManager or type(flow.GameManager.BackToLobby) ~= "function" then
        self.ResultBusy = false
        return false, "Lobby return is unavailable"
    end

    local queued, queueError = self:QueueTeleport("lobby", self.LobbyPlaceId)

    if not queued then
        self.LastError = tostring(queueError)
    end

    local failureGeneration = self.TeleportFailureGeneration
    local called, lobbyError = pcall(flow.GameManager.BackToLobby)

    if not called then
        self.ResultBusy = false
        return false, tostring(lobbyError)
    end

    self:SetPhase("Returning to Lobby", "Replay was unavailable")

    if self:WaitForTeleport(token, 30, failureGeneration) then
        return true, "Teleporting"
    end

    self.ResultBusy = false

    return false, "Lobby teleport did not start"
end

function library.AutoFarm:RunLobby(token)
    if not flow.LobbyServer
        or type(flow.LobbyServer.play) ~= "function"
        or type(flow.LobbyServer.create) ~= "function"
        or type(flow.LobbyServer.exit) ~= "function"
    then
        return false, "Lobby API is unavailable"
    end

    if self.PendingFinish then
        self:SetPhase("Confirming Run", "Waiting for the lobby reward")

        local rewardExpires = os.clock() + 8

        repeat
            self:SyncProgress()

            if self:GetEffectiveWins() > (tonumber(self.RunWinsStart) or self:GetEffectiveWins()) then
                break
            end

            task.wait(0.5)
        until not self.Running or self.Token ~= token or os.clock() >= rewardExpires

        if not self.Running or self.Token ~= token then
            return true
        end

        self:CompletePending("Returned to lobby")
    end

    self:SetPhase("Lobby", "Waiting before the next game")

    local delay = options.RunawaysAutoFarmLobbyDelay and options.RunawaysAutoFarmLobbyDelay.Value or self.Config.LobbyDelay
    local expires = os.clock() + delay

    repeat
        task.wait(0.1)
    until not self.Running or self.Token ~= token or os.clock() >= expires

    if not self.Running or self.Token ~= token then
        return true
    end

    local car = self:GetOwnedCar()

    if not car then
        return false, "No owned vehicle is available"
    end

    local playerGui = player:FindFirstChildOfClass("PlayerGui")
    local createGui = playerGui and (playerGui:FindFirstChild("CreateLobbyGui") or playerGui:WaitForChild("CreateLobbyGui", 10))

    if not createGui then
        return false, "Create lobby UI is unavailable"
    end

    local queued, queueError = self:QueueTeleport("game", self.GamePlaceId)

    if not queued then
        return false, queueError
    end

    local createFrame = createGui and createGui:FindFirstChild("Frame")
    local exitFrame = createGui and createGui:FindFirstChild("Exit")

    for attempt = 1, 2 do
        if not self.Running or self.Token ~= token then
            return true
        end

        createFrame = createGui:FindFirstChild("Frame")
        exitFrame = createGui:FindFirstChild("Exit")

        if exitFrame and exitFrame.Visible then
            self:SetPhase("Lobby", "Leaving an existing queue")
            pcall(flow.LobbyServer.exit)

            local leaveExpires = os.clock() + 5

            repeat
                task.wait(0.1)
            until not exitFrame.Visible or not self.Running or self.Token ~= token or os.clock() >= leaveExpires

            if exitFrame.Visible then
                self.Stats.Retries += 1
                task.wait(attempt)
                continue
            end
        end

        if not createFrame or not createFrame.Visible then
            self:SetPhase("Lobby", "Requesting the next game")

            local played, playError = pcall(flow.LobbyServer.play)

            if not played then
                return false, tostring(playError)
            end

            local selectionExpires = os.clock() + 10

            repeat
                if self.Teleporting then
                    return true
                end

                task.wait(0.2)
            until not self.Running
                or self.Token ~= token
                or createFrame and createFrame.Visible
                or exitFrame and exitFrame.Visible
                or os.clock() >= selectionExpires
        end

        if exitFrame and exitFrame.Visible then
            self:SetPhase("Lobby", "Leaving an existing queue")
            self.Stats.Retries += 1
            pcall(flow.LobbyServer.exit)
            task.wait(attempt * 1.5)
            continue
        end

        if not createFrame or not createFrame.Visible then
            self.Stats.Retries += 1
            task.wait(attempt)
            continue
        end

        self:SetPhase("Creating Game", "Vehicle: " .. car .. " | Solo | Friends")

        createFrame.Visible = false

        local failureGeneration = self.TeleportFailureGeneration
        local created, createError = pcall(flow.LobbyServer.create, {
            maxPlayers = 1,
            permissions = "Friends",
            car = car,
        })

        if not created then
            return false, tostring(createError)
        end

        local joinExpires = os.clock() + 5

        repeat
            task.wait(0.2)
        until self.Teleporting
            or exitFrame and exitFrame.Visible
            or not self.Running
            or self.Token ~= token
            or os.clock() >= joinExpires

        local teleportStarted = self.Teleporting

        if not teleportStarted then
            teleportStarted = self:WaitForTeleport(token, 20, failureGeneration)
        end

        if teleportStarted then
            return true
        end

        if self.TeleportRecovering then
            return false, "Teleport recovery active"
        end

        self.Stats.Retries += 1
        pcall(flow.LobbyServer.exit)

        if flow.LobbyClient and type(flow.LobbyClient.forceLeave_event) == "function" then
            pcall(flow.LobbyClient.forceLeave_event)
        end

        task.wait(attempt * 2)
    end

    self:SetPhase("Refreshing Lobby", "Game creation timed out")

    local requeued, requeueError = self:QueueTeleport("lobby retry", self.LobbyPlaceId)

    if not requeued then
        return false, requeueError
    end

    local failureGeneration = self.TeleportFailureGeneration
    local teleported, teleportError = pcall(
        game:GetService("TeleportService").Teleport,
        game:GetService("TeleportService"),
        self.LobbyPlaceId,
        player
    )

    if not teleported then
        return false, tostring(teleportError)
    end

    if self:WaitForTeleport(token, 30, failureGeneration) then
        return true, "Teleporting"
    end

    return false, "Lobby refresh did not start"
end

function library.AutoFarm:ReachGate(token)
    self:SetPhase("Traveling", "Teleporting to the end gate")
    local endZ
    local expires = os.clock() + 20

    repeat
        endZ = teleports:GetEndZ()

        if not endZ then
            task.wait(0.25)
        end
    until endZ or not self.Running or self.Token ~= token or library.Unloaded or os.clock() >= expires

    if not endZ then
        return nil, nil, nil, "End position is unavailable"
    end

    local start = teleports:GetStartCFrame()
    local direction = (not start or endZ >= start.Position.Z) and 1 or -1
    local anchor = teleports:GetEndAnchor(endZ, direction)

    teleports:Stream(anchor)

    local prompt = teleports:GetEndPrompt()

    if not prompt then
        local road = teleports:GetRoadNear(endZ)
        local position

        if road then
            position = Vector3.new(
                road.Position.X,
                road.Position.Y + road.Size.Y * 0.5 + 5,
                endZ - direction * 30
            )
        else
            position = Vector3.new(anchor.X, anchor.Y + 4, endZ - direction * 30)
        end

        teleports:Move(
            CFrame.lookAt(position, position + Vector3.new(0, 0, direction), Vector3.yAxis),
            nil,
            false
        )
        teleports:Stream(anchor)
    end

    expires = os.clock() + 20

    repeat
        prompt = teleports:GetEndPrompt()

        if prompt then
            local destination = teleports:GetEndPromptDestination(prompt, direction)

            if destination then
                teleports:Move(destination, nil, false)
                task.wait(0.4)

                local character = player.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                local root = character and character:FindFirstChild("HumanoidRootPart")

                if humanoid
                    and root
                    and humanoid.Health > 0
                    and (root.Position - destination.Position).Magnitude <= math.max(prompt.MaxActivationDistance + 5, 14)
                then
                    self.GatePassage = self.GatePassage or self:GetGatePassage(prompt, direction, endZ)
                    return prompt, direction, endZ
                end
            end
        end

        task.wait(0.25)
    until not self.Running or self.Token ~= token or library.Unloaded or os.clock() >= expires

    if self.Running and self.Token == token and self.GateStartedAt > 0 and self.LastGameJob == game.JobId then
        self.GatePassage = self.GatePassage or self:GetGatePassage(nil, direction, endZ)

        if self.GatePassage then
            local position = self.GatePassage.Position - Vector3.new(0, 0, direction * 8)

            teleports:Move(
                CFrame.lookAt(position, position + Vector3.new(0, 0, direction), Vector3.yAxis),
                nil,
                false
            )

            return nil, direction, endZ, nil, true
        end
    end

    return nil, nil, nil, "End gate prompt was not reached"
end

function library.AutoFarm:GetFinalDoor(prompt)
    local finalDoor = prompt and prompt:FindFirstAncestor("FinalDoor")

    if finalDoor then
        return finalDoor
    end

    local map = workspace:FindFirstChild("Map")
    local buildings = map and map:FindFirstChild("Buildings")
    local customs = buildings and buildings:FindFirstChild("CustomsFinal")

    return customs and customs:FindFirstChild("FinalDoor", true)
end

function library.AutoFarm:GetGateTimer(prompt)
    local finalDoor = self:GetFinalDoor(prompt)

    if not finalDoor then
        return
    end

    local ok, labels = pcall(finalDoor.QueryDescendants, finalDoor, "TextLabel")

    if not ok then
        labels = {}

        for _, instance in finalDoor:GetDescendants() do
            if instance:IsA("TextLabel") then
                labels[#labels + 1] = instance
            end
        end
    end

    for _, label in labels do
        local text = label.Text
        local minutes, seconds = text:match("(%d+)%s*m%s*(%d+)%s*s")

        if not minutes then
            minutes, seconds = text:match("(%d+)%s*:%s*(%d+)")
        end

        if minutes and seconds then
            return tonumber(minutes) * 60 + tonumber(seconds), text
        end
    end
end

function library.AutoFarm:CaptureGate(prompt)
    local finalDoor = self:GetFinalDoor(prompt)
    local records = {}

    if not finalDoor then
        return records
    end

    local ok, parts = pcall(finalDoor.QueryDescendants, finalDoor, "BasePart")

    if not ok then
        parts = {}

        for _, instance in finalDoor:GetDescendants() do
            if instance:IsA("BasePart") then
                parts[#parts + 1] = instance
            end
        end
    end

    for _, part in parts do
        records[part] = {
            Position = part.Position,
            CanCollide = part.CanCollide,
            Transparency = part.Transparency,
        }
    end

    return records
end

function library.AutoFarm:GetGatePassage(prompt, direction, endZ)
    local finalDoor = self:GetFinalDoor(prompt)
    local command = finalDoor and finalDoor:FindFirstChild("Command", true)
    local leftHolder = finalDoor and finalDoor:FindFirstChild("DoorL")
    local rightHolder = finalDoor and finalDoor:FindFirstChild("DoorR")
    local leftDoor = leftHolder and leftHolder:FindFirstChild("Door", true)
    local rightDoor = rightHolder and rightHolder:FindFirstChild("Door", true)
    local best
    local bestScore = -math.huge

    if finalDoor then
        local ok, parts = pcall(finalDoor.QueryDescendants, finalDoor, "BasePart")

        if not ok then
            parts = {}

            for _, instance in finalDoor:GetDescendants() do
                if instance:IsA("BasePart") then
                    parts[#parts + 1] = instance
                end
            end
        end

        for _, part in parts do
            if part.CanCollide
                and part.Transparency < 0.95
                and part.Size.Y >= 4
                and (not command or not part:IsDescendantOf(command))
            then
                local name = part.Name:lower()
                local score = part.Size.X * part.Size.Y / math.max(part.Size.Z, 0.5)

                if name:find("door", 1, true) or name:find("gate", 1, true) then
                    score += 1000000
                elseif name:find("wall", 1, true) or name:find("frame", 1, true) then
                    score -= 1000000
                end

                if score > bestScore then
                    best = part
                    bestScore = score
                end
            end
        end
    end

    local road = teleports:GetRoadNear(endZ)
    local position = leftDoor
        and leftDoor:IsA("BasePart")
        and rightDoor
        and rightDoor:IsA("BasePart")
        and (leftDoor.Position + rightDoor.Position) * 0.5
        or best and best.Position
        or road and Vector3.new(road.Position.X, road.Position.Y + road.Size.Y * 0.5 + 3.5, endZ)

    if not position then
        local holder = prompt and prompt.Parent

        if holder and holder:IsA("Attachment") then
            position = holder.WorldPosition
        elseif holder and holder:IsA("BasePart") then
            position = holder.Position
        end
    end

    if not position then
        return
    end

    local parameters = RaycastParams.new()
    local excludes = {}

    parameters.FilterType = Enum.RaycastFilterType.Exclude

    if player.Character then
        excludes[#excludes + 1] = player.Character
    end

    if finalDoor then
        excludes[#excludes + 1] = finalDoor
    end

    parameters.FilterDescendantsInstances = excludes
    parameters.RespectCanCollide = true

    local result = workspace:Raycast(position + Vector3.yAxis * 30, -Vector3.yAxis * 80, parameters)

    if result then
        position = Vector3.new(position.X, result.Position.Y + 3.5, position.Z)
    elseif road then
        position = Vector3.new(position.X, road.Position.Y + road.Size.Y * 0.5 + 3.5, position.Z)
    end

    return {
        Position = position,
        Direction = direction,
        FinalDoor = finalDoor,
        DoorL = leftDoor,
        DoorR = rightDoor,
    }
end

function library.AutoFarm:IsGatePassageOpen(passage)
    if not passage or typeof(passage.Position) ~= "Vector3" then
        return false
    end

    local finalDoor = passage.FinalDoor

    if not finalDoor or not finalDoor.Parent then
        finalDoor = self:GetFinalDoor()
        passage.FinalDoor = finalDoor
    end

    if finalDoor then
        local leftHolder = finalDoor:FindFirstChild("DoorL")
        local rightHolder = finalDoor:FindFirstChild("DoorR")
        local currentLeft = leftHolder and leftHolder:FindFirstChild("Door", true)
        local currentRight = rightHolder and rightHolder:FindFirstChild("Door", true)

        if currentLeft and currentLeft:IsA("BasePart") then
            passage.DoorL = currentLeft
        end

        if currentRight and currentRight:IsA("BasePart") then
            passage.DoorR = currentRight
        end
    end

    local leftDoor = passage.DoorL
    local rightDoor = passage.DoorR

    if leftDoor
        and leftDoor.Parent
        and leftDoor:IsA("BasePart")
        and rightDoor
        and rightDoor.Parent
        and rightDoor:IsA("BasePart")
    then
        local difference = leftDoor.Position - rightDoor.Position

        if difference.Magnitude > 0.1 then
            local axis = difference.Unit
            local leftHalf = math.abs(leftDoor.CFrame.RightVector:Dot(axis)) * leftDoor.Size.X * 0.5
                + math.abs(leftDoor.CFrame.UpVector:Dot(axis)) * leftDoor.Size.Y * 0.5
                + math.abs(leftDoor.CFrame.LookVector:Dot(axis)) * leftDoor.Size.Z * 0.5
            local rightHalf = math.abs(rightDoor.CFrame.RightVector:Dot(axis)) * rightDoor.Size.X * 0.5
                + math.abs(rightDoor.CFrame.UpVector:Dot(axis)) * rightDoor.Size.Y * 0.5
                + math.abs(rightDoor.CFrame.LookVector:Dot(axis)) * rightDoor.Size.Z * 0.5
            local midpoint = (leftDoor.Position + rightDoor.Position) * 0.5

            passage.Position = Vector3.new(midpoint.X, passage.Position.Y, midpoint.Z)

            return difference.Magnitude - leftHalf - rightHalf >= 12
        end
    end

    local parameters = RaycastParams.new()

    parameters.FilterType = Enum.RaycastFilterType.Exclude
    parameters.FilterDescendantsInstances = player.Character and { player.Character } or {}
    parameters.RespectCanCollide = true

    local direction = Vector3.new(0, 0, passage.Direction)
    local result = workspace:Raycast(passage.Position - direction * 10, direction * 20, parameters)

    return result == nil
end

function library.AutoFarm:IsGateWindowOpen()
    if flow.CrimesGui
        and type(flow.CrimesGui.StartEndTimer_event) == "function"
        and debug
        and type(debug.getupvalues) == "function"
    then
        local ok, values = pcall(debug.getupvalues, flow.CrimesGui.StartEndTimer_event)

        if ok and type(values) == "table" then
            local opensAt = tonumber(values[2])
            local closesAt = tonumber(values[3])
            local now = workspace:GetServerTimeNow()

            if opensAt and closesAt and now >= opensAt and now < closesAt then
                return true
            end
        end
    end

    local playerGui = player:FindFirstChildOfClass("PlayerGui")
    local hud = playerGui and playerGui:FindFirstChild("HudGui")
    local events = hud and hud:FindFirstChild("Events")
    local closing = events and events:FindFirstChild("Closing")

    if not closing or not closing.Visible then
        return false
    end

    local timer = closing:FindFirstChild("Timer")
    local text = timer and timer.Text or ""
    local minutes, seconds = text:match("(%d+)%s*:%s*(%d+)")

    return not minutes or tonumber(minutes) * 60 + tonumber(seconds) > 0
end

function library.AutoFarm:IsGateMoving(records)
    for part, state in records do
        if not part.Parent
            or (part.Position - state.Position).Magnitude >= 5
            or state.CanCollide and not part.CanCollide
            or part.Transparency - state.Transparency >= 0.7
        then
            return true
        end
    end

    return false
end

function library.AutoFarm:ActivateGate(prompt, direction, token)
    if not self.Running or self.Token ~= token then
        return false, {}, "Auto Farm stopped"
    end

    if self.GateStartedAt > 0 and self.LastGameJob == game.JobId then
        local seconds = self:GetGateTimer(prompt)

        if not prompt.Enabled or seconds and seconds < 120 then
            return true, self:CaptureGate(prompt)
        end

        self.GateStartedAt = 0
    end

    self:SetPhase("Activating Gate", "Starting the two minute countdown")

    local records = self:CaptureGate(prompt)

    for attempt = 1, 3 do
        if not self.Running or self.Token ~= token then
            return false, records, "Auto Farm stopped"
        end

        local destination = teleports:GetEndPromptDestination(prompt, direction)

        if destination then
            teleports:Move(destination, nil, false)
            task.wait(0.4)
        end

        if not self.Running or self.Token ~= token then
            return false, records, "Auto Farm stopped"
        end

        local before = self:GetGateTimer(prompt)
        local fired = false

        if type(fireproximityprompt) == "function" then
            fired = pcall(fireproximityprompt, prompt)
        end

        if not fired then
            fired = pcall(function()
                local duration = prompt.HoldDuration

                prompt.HoldDuration = 0
                prompt:InputHoldBegin()
                task.wait(0.1)
                prompt:InputHoldEnd()
                prompt.HoldDuration = duration
            end)
        end

        if not self.Running or self.Token ~= token then
            return false, records, "Auto Farm stopped"
        end

        if fired then
            local expires = os.clock() + 6

            repeat
                local seconds = self:GetGateTimer(prompt)
                local accepted = not prompt.Enabled
                    or seconds and before and seconds < before
                    or seconds and seconds < 120

                if accepted then
                    self.GateStartedAt = os.time() - (seconds and math.max(0, 120 - seconds) or 0)
                    self.Stats.GateActivations += 1
                    self:Persist()

                    return true, records
                end

                task.wait(0.25)
            until os.clock() >= expires
                or not self.Running
                or self.Token ~= token
                or library.Unloaded

            if not self.Running or self.Token ~= token then
                return false, records, "Auto Farm stopped"
            end
        end

        self.Stats.Retries += 1
        task.wait(attempt)
    end

    self.GateStartedAt = 0

    return false, records, "Gate activation was not confirmed"
end

function library.AutoFarm:GetSafeCFrame()
    local passage = self.GatePassage

    if not passage or typeof(passage.Position) ~= "Vector3" then
        return
    end

    local finalDoor = passage.FinalDoor
    local customsBuilding = finalDoor and finalDoor:FindFirstAncestor("CustomsBuilding")
    local prompt = teleports:GetEndPrompt()
    local holder = prompt and prompt.Parent
    local promptPosition = holder and holder:IsA("Attachment") and holder.WorldPosition
        or holder and holder:IsA("BasePart") and holder.Position
        or passage.Position
    local bestFloor
    local bestDistance = math.huge

    if customsBuilding then
        for _, office in customsBuilding:GetChildren() do
            if office.Name == "CustomsOffice" then
                local floor = office:FindFirstChild("Floor", true)

                if floor and floor:IsA("BasePart") then
                    local distance = (floor.Position - promptPosition).Magnitude

                    if distance < bestDistance then
                        bestFloor = floor
                        bestDistance = distance
                    end
                end
            end
        end
    end

    if bestFloor then
        local position = bestFloor.CFrame:PointToWorldSpace(Vector3.new(5, bestFloor.Size.Y * 0.5 + 3.25, 8))
        local rayParameters = RaycastParams.new()
        local overlapParameters = OverlapParams.new()

        rayParameters.FilterType = Enum.RaycastFilterType.Exclude
        rayParameters.FilterDescendantsInstances = player.Character and { player.Character } or {}
        rayParameters.RespectCanCollide = true
        overlapParameters.FilterType = Enum.RaycastFilterType.Exclude
        overlapParameters.FilterDescendantsInstances = player.Character and { player.Character } or {}

        local floorHit = workspace:Raycast(position, -Vector3.yAxis * 6, rayParameters)
        local roofHit = workspace:Raycast(position, Vector3.yAxis * 30, rayParameters)
        local blocked = false

        for _, part in workspace:GetPartBoundsInBox(CFrame.new(position), Vector3.new(3.5, 5.5, 3.5), overlapParameters) do
            if part.CanCollide and part ~= bestFloor then
                blocked = true
                break
            end
        end

        if floorHit and roofHit and not blocked then
            return CFrame.lookAt(
                position,
                Vector3.new(promptPosition.X, position.Y, promptPosition.Z),
                Vector3.yAxis
            )
        end
    end

end

function library.AutoFarm:DisengageHelicopter()
    if flow.PoliceHeli and type(flow.PoliceHeli.Despawn) == "function" then
        pcall(flow.PoliceHeli.Despawn)
    end
end

function library.AutoFarm:ReleaseSafeZone()
    local character = self.SafeCharacter
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if root and self.SafeRootAnchored ~= nil then
        root.Anchored = self.SafeRootAnchored
        root.AssemblyLinearVelocity = Vector3.zero
        root.AssemblyAngularVelocity = Vector3.zero
    end

    self.SafeCFrame = nil
    self.SafeCharacter = nil
    self.SafeRootAnchored = nil
end

function library.AutoFarm:MoveToSafeZone(token)
    if not self.Config.SafeGateWait then
        self:ReleaseSafeZone()
        return true
    end

    if not self.Running or self.Token ~= token then
        return false, "Auto Farm stopped"
    end

    local destination = self:GetSafeCFrame()
    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if not destination or not humanoid or not root or humanoid.Health <= 0 then
        return false, "Safe gate position is unavailable"
    end

    self:ReleaseSafeZone()
    self.SafeCharacter = character
    self.SafeRootAnchored = root.Anchored
    self.SafeCFrame = destination

    local moved = teleports:Move(destination, nil, false)

    if not moved then
        self:ReleaseSafeZone()
        return false, "Could not enter the safe gate position"
    end

    if not self.Running or self.Token ~= token or library.Unloaded then
        self:ReleaseSafeZone()
        return false, "Auto Farm stopped"
    end

    if not self.Config.SafeGateWait then
        self:ReleaseSafeZone()
        return true
    end

    if player.Character ~= character or self.SafeCharacter ~= character or self.SafeCFrame ~= destination then
        self:ReleaseSafeZone()
        return false, "Character changed while entering the safe zone"
    end

    root = character:FindFirstChild("HumanoidRootPart")

    if not root then
        self:ReleaseSafeZone()
        return false, "Character changed while entering the safe zone"
    end

    root.CFrame = destination
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    root.Anchored = true
    self:DisengageHelicopter()
    self:SetPhase("Safe Gate Wait", "Protected from the helicopter until the gate opens")

    return true
end

function library.AutoFarm:MaintainSafeZone(token)
    if not self.Config.SafeGateWait then
        self:ReleaseSafeZone()
        return true
    end

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if character ~= self.SafeCharacter or not self.SafeCFrame then
        return self:MoveToSafeZone(token)
    end

    if not humanoid or not root or humanoid.Health <= 0 then
        return false, "Character is unavailable in the safe zone"
    end

    root.CFrame = self.SafeCFrame
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    root.Anchored = true

    return true
end

function library.AutoFarm:WaitForGate(token, prompt, records)
    local timeout = options.RunawaysAutoFarmGateTimeout and options.RunawaysAutoFarmGateTimeout.Value or self.Config.GateTimeout
    local expires = os.clock() + timeout

    self:SetPhase("Waiting for Gate", "God Mode and NPC clearing are active")

    repeat
        self.RunHeartbeat = os.clock()
        local endFrame = self:GetEndScreen()

        if endFrame then
            self:ReleaseSafeZone()
            local _, result = self:HandleEndScreen(token)

            return false, result
        end

        local safe, safeError = self:MaintainSafeZone(token)

        if not safe then
            self:ReleaseSafeZone()

            local resultExpires = os.clock() + 4

            repeat
                if self:GetEndScreen() then
                    local _, result = self:HandleEndScreen(token)

                    return false, result
                end

                task.wait(0.1)
            until not self.Running
                or self.Token ~= token
                or library.Unloaded
                or os.clock() >= resultExpires

            return false, safeError
        end

        local elapsed = math.max(0, os.time() - self.GateStartedAt)
        local seconds, text = self:GetGateTimer(prompt)

        if text then
            self.GateText = text
        else
            self.GateText = self:FormatDuration(math.max(120 - elapsed, 0)):sub(4)
        end

        self:UpdateUI()

        local passageRead, passageOpen = pcall(self.IsGatePassageOpen, self, self.GatePassage)
        local windowRead, gateWindowOpen = pcall(self.IsGateWindowOpen, self)
        local timedOpen = self.GateStartedAt > 0 and elapsed >= 120

        if passageRead and passageOpen or windowRead and gateWindowOpen or timedOpen then
            self:ReleaseSafeZone()
            return true
        end

        if os.clock() - self.LastPersistAt >= 10 then
            self:Persist()
        end

        task.wait(0.5)
    until not self.Running or self.Token ~= token or library.Unloaded or os.clock() >= expires

    if not self.Running or self.Token ~= token then
        self:ReleaseSafeZone()
        return false, "Auto Farm stopped"
    end

    self:ReleaseSafeZone()

    return false, "Gate wait timed out"
end

function library.AutoFarm:SetCrossNoclip(value)
    if value then
        if self.CrossCollisions then
            return
        end

        self.CrossCollisions = {}

        local character = player.Character

        if character then
            for _, part in character:GetDescendants() do
                if part:IsA("BasePart") then
                    self.CrossCollisions[part] = part.CanCollide
                    part.CanCollide = false
                end
            end
        end

        return
    end

    for part, canCollide in self.CrossCollisions or {} do
        if part.Parent then
            part.CanCollide = canCollide
        end
    end

    self.CrossCollisions = nil
end

function library.AutoFarm:WaitForFinishResult(token, duration)
    local expires = os.clock() + duration

    repeat
        if self.Teleporting then
            return true, "Teleporting"
        end

        local endFrame = self:GetEndScreen()

        if endFrame then
            self:SetCrossNoclip(false)
            return self:HandleEndScreen(token)
        end

        task.wait(0.2)
    until not self.Running
        or self.Token ~= token
        or library.Unloaded
        or os.clock() >= expires

    if not self.Running or self.Token ~= token then
        return true, "Stopped"
    end

    return false, "Finish result did not appear"
end

function library.AutoFarm:CrossGate(token, prompt, direction, endZ)
    self:ReleaseSafeZone()
    self:SetPhase("Entering Finish", "Crossing the opened gate")
    self:SetCrossNoclip(true)

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if not humanoid or not root or humanoid.Health <= 0 then
        self:SetCrossNoclip(false)
        return false, "Character is unavailable"
    end

    local passage = self.GatePassage or self:GetGatePassage(prompt, direction, endZ)

    if not passage then
        self:SetCrossNoclip(false)
        return false, "Gate passage is unavailable"
    end

    self:IsGatePassageOpen(passage)
    teleports:Stream(passage.Position)
    task.wait(0.4)

    local finishOffset = math.max(
        12,
        (tonumber(endZ) and (endZ - passage.Position.Z) * direction or 0) + 12
    )

    for _, offset in { -10, -3, 6, finishOffset, finishOffset + 24, finishOffset + 50, finishOffset + 85 } do
        if not self.Running or self.Token ~= token or library.Unloaded then
            self:SetCrossNoclip(false)
            return false, "Auto Farm stopped"
        end

        local position = passage.Position + Vector3.new(0, 0, direction * offset)
        local moved = teleports:Move(
            CFrame.lookAt(position, position + Vector3.new(0, 0, direction), Vector3.yAxis),
            nil,
            false
        )

        local crossedEnd = tonumber(endZ) and (position.Z - endZ) * direction >= 0 or offset >= 6

        if moved and crossedEnd and not self.FinishCrossed then
            self.FinishCrossed = true
            self:Persist()
        end

        task.wait(0.4)

        if self.Teleporting then
            self:SetCrossNoclip(false)
            return true, "Teleporting"
        end

        if self:GetEndScreen() then
            self:SetCrossNoclip(false)
            return self:HandleEndScreen(token)
        end
    end

    humanoid:MoveTo(passage.Position + Vector3.new(0, 0, direction * 110))

    local handled, result = self:WaitForFinishResult(token, 35)

    if handled then
        return true, result
    end

    self:SetCrossNoclip(false)

    return false, result
end

function library.AutoFarm:RunGame(token)
    if self.PendingFinish and self.LastGameJob ~= "" and self.LastGameJob ~= game.JobId then
        self:CompletePending("Replay transition confirmed")
    end

    if self:GetEndScreen() then
        return self:HandleEndScreen(token)
    end

    if self.LastGameJob ~= game.JobId then
        self:ReleaseSafeZone()
        self.BalanceWarmupUntil = os.clock() + 10
        self:SyncProgress()
        self.LastGameJob = game.JobId
        self.RunStartedAt = os.time()
        self.RunCashStart = self:GetEffectiveCredz()
        self.RunWinsStart = self:GetEffectiveWins()
        self.GateStartedAt = 0
        self.GatePassage = nil
        self.PendingFinish = false
        self.FinishCrossed = false
        self.PendingAt = 0
        self.ResultBusy = false
        self.ResultFinalized = false
        self.ReplayRequested = false
        self.Stats.Attempts += 1
        self:Persist()
        self:SendWebhook("Run Started", "Gameplay server joined")
    end

    self:SetPhase("Loading Game", "Waiting for the character and map")

    local expires = os.clock() + 30

    repeat
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")

        if humanoid and root and humanoid.Health > 0 and workspace:FindFirstChild("Map") then
            break
        end

        task.wait(0.25)
    until not self.Running or self.Token ~= token or os.clock() >= expires

    if not self.Running or self.Token ~= token then
        return true
    end

    do
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        local root = character and character:FindFirstChild("HumanoidRootPart")

        if not humanoid or not root or humanoid.Health <= 0 or not workspace:FindFirstChild("Map") then
            return false, "Gameplay did not finish loading"
        end
    end

    local prompt, direction, endZ, reachError, gateAlreadyActivated = self:ReachGate(token)

    if not prompt and not gateAlreadyActivated then
        return false, reachError
    end

    local records

    if gateAlreadyActivated then
        records = self:CaptureGate(prompt)
    else
        local activated, activationRecords, activationError = self:ActivateGate(prompt, direction, token)

        if not activated then
            return false, activationError
        end

        records = activationRecords
    end

    local opened, gateError = self:WaitForGate(token, prompt, records)

    if not opened then
        if gateError == "Replay" or gateError == "Teleporting" or gateError == "Stopped" then
            return true, gateError
        end

        return false, gateError
    end

    self.PendingFinish = true
    self.FinishCrossed = true
    self.PendingAt = os.time()
    self:Persist()

    local autoReplay = self:IsAutoReplayEnabled()
    local nextPlaceId = autoReplay and self.GamePlaceId or self.LobbyPlaceId
    local queued, queueError = self:QueueTeleport(autoReplay and "replay" or "lobby", nextPlaceId)

    if not queued then
        self.PendingFinish = false
        self.FinishCrossed = false
        self.PendingAt = 0
        return false, queueError
    end

    for attempt = 1, 3 do
        local crossed, crossError = self:CrossGate(token, prompt, direction, endZ)

        if crossed then
            return true, crossError
        end

        if not self.Running or self.Token ~= token then
            return true
        end

        self.Stats.Retries += 1
        self.LastError = crossError
        task.wait(attempt * 2)
    end

    self.PendingFinish = false
    self.FinishCrossed = false
    self.PendingAt = 0
    self:ReleaseSafeZone()

    return false, "Could not enter the finish"
end

function library.AutoFarm:ReleaseRun(token)
    if self.ActiveRunToken ~= token then
        return
    end

    self.RunActive = false
    self.ActiveRunToken = nil

    if self.Running and self.Token and self.Token ~= token and not library.Unloaded then
        task.spawn(self.Run, self, self.Token)
    end
end

function library.AutoFarm:Run(token)
    if self.RunActive then
        return
    end

    self.RunActive = true
    self.ActiveRunToken = token
    self.RunHeartbeat = os.clock()
    local failures = 0

    while self.Running and self.Token == token and not library.Unloaded do
        self.RunHeartbeat = os.clock()

        if self.TeleportRecovering then
            task.wait(0.25)
            continue
        end

        local executed, ok, message = xpcall(function()
            local context = self:GetContext()

            if context == "Lobby" then
                return self:RunLobby(token)
            end

            if context == "Game" then
                return self:RunGame(token)
            end

            return false, "Unsupported place: " .. tostring(game.PlaceId)
        end, function(message)
            if type(debug) == "table" and type(debug.traceback) == "function" then
                local read, trace = pcall(debug.traceback, tostring(message), 2)

                if read and type(trace) == "string" then
                    return trace
                end
            end

            return tostring(message)
        end)

        if not executed then
            message = ok
            ok = false
            self:ReleaseSafeZone()
            self:SetCrossNoclip(false)
            self.ResultBusy = false
            self.ReplayRequested = false
        end

        if self.TeleportRecovering then
            failures = 0
            task.wait(0.25)
            continue
        end

        if ok and message == "Replay" and not self.Teleporting and self.Running and self.Token == token then
            failures = 0
            task.wait(1)
            continue
        end

        if ok or self.Teleporting or not self.Running or self.Token ~= token then
            self:ReleaseRun(token)
            return
        end

        failures += 1
        self.Stats.Retries += 1

        self.LastError = tostring(message or "Unknown error")
        self:SetPhase("Retrying", self.LastError)
        self:Persist()
        self:SendWebhook("Error", self.LastError)

        local delay = options.RunawaysAutoFarmRetryDelay and options.RunawaysAutoFarmRetryDelay.Value or self.Config.RetryDelay
        local expires = os.clock() + math.min(delay * failures, 30)

        repeat
            self.RunHeartbeat = os.clock()
            task.wait(0.25)
        until not self.Running or self.Token ~= token or os.clock() >= expires
    end

    self:ReleaseRun(token)
end

function library.AutoFarm:Start()
    if self.Running then
        return
    end

    local resumed = self.ResumeRequested

    if not resumed then
        self.SessionId = tostring(player.UserId) .. "-" .. tostring(os.time()) .. "-" .. tostring(math.random(100000, 999999))
        self:ResetStats()
    elseif self.StartedAt <= 0 then
        self.StartedAt = os.time()
    end

    self.ResumeRequested = false
    self.Running = true
    self.RunActive = false
    self.ActiveRunToken = nil
    self.Teleporting = false
    self.TeleportRecoveryGeneration += 1
    self.TeleportRetryCount = 0
    self.TeleportRetryDelay = 0
    self.TeleportRetryTarget = 0
    self.TeleportRetryOptions = nil
    self.TeleportRecovering = false
    self.LastTeleportFailureAt = 0
    self.QueueJob = nil
    self.ResultBusy = false
    self.ResultFinalized = false
    self.ReplayRequested = false
    self.RunHeartbeat = os.clock()
    self.TransitionToken = ""
    self.ExpectedPlaceId = 0
    self.TransitionAt = 0
    self.Token = {}
    self.QueueStatus = "Not armed"
    self:Persist()
    self:SetPhase("Starting", "Preparing Auto Farm")

    local context = self:GetContext()
    local targetPlaceId = context == "Lobby" and self.GamePlaceId
        or context == "Game" and (self:IsAutoReplayEnabled() and self.GamePlaceId or self.LobbyPlaceId)
    local queueError = self:GetTeleportQueueError(targetPlaceId)

    if queueError then
        self.Running = false
        self.Token = nil
        self.QueueStatus = queueError
        self.LastError = tostring(queueError)
        self:SetPhase("Start Failed", self.LastError)
        self:Persist()
        notify("Auto Farm: " .. queueError .. ".")

        task.defer(function()
            if toggles.RunawaysAutoFarm and toggles.RunawaysAutoFarm.Value then
                toggles.RunawaysAutoFarm:SetValue(false)
            end
        end)

        return
    end

    if not resumed then
        self:SendWebhook("Session Started", "Auto Farm enabled")
    end

    task.spawn(function()
        local token = self.Token

        while self.Running and self.Token == token and not library.Unloaded do
            local context = self:GetContext()

            if context == "Game" then
                local humanoid = getHumanoid()

                if humanoid then
                    applyGodMode(humanoid)
                end

                self.Stats.NPCAttacks += killAllNPCs()
            end

            task.wait(context == "Game" and 0.4 or 1)
        end
    end)

    task.spawn(function()
        local token = self.Token

        while self.Running and self.Token == token and not library.Unloaded do
            local context = self:GetContext()

            if context == "Game" and not self.ResultBusy and not self.RunActive then
                local endFrame = self:GetEndScreen()

                if endFrame then
                    self:ReleaseSafeZone()
                    self:SetCrossNoclip(false)
                    self.RunActive = false
                    self.ActiveRunToken = nil
                    self.RunHeartbeat = os.clock()
                    self:SetPhase("Recovering", "Handling the result screen")
                    task.spawn(self.Run, self, token)
                end
            end

            task.wait(context == "Game" and 0.5 or 1)
        end
    end)

    task.spawn(self.Run, self, self.Token)
end

function library.AutoFarm:Stop(silent)
    if not self.Running and not self.ResumeRequested then
        return
    end

    if not silent then
        self:SendWebhook("Stopped", "Auto Farm disabled")
    end

    self.Running = false
    self.ResumeRequested = false
    self.Token = nil
    self.RunActive = false
    self.ActiveRunToken = nil
    self.Teleporting = false
    self.TeleportRecoveryGeneration += 1
    self.TeleportRetryCount = 0
    self.TeleportRetryDelay = 0
    self.TeleportRetryTarget = 0
    self.TeleportRetryOptions = nil
    self.TeleportRecovering = false
    self.LastTeleportFailureAt = 0
    self.QueueJob = nil
    self.TransitionToken = ""
    self.ExpectedPlaceId = 0
    self.TransitionAt = 0
    self.PendingFinish = false
    self.FinishCrossed = false
    self.PendingAt = 0
    self.ResultBusy = false
    self.ResultFinalized = false
    self.ReplayRequested = false
    self.RunHeartbeat = 0
    self.LastGameJob = ""
    self.RunStartedAt = 0
    self.RunCashStart = 0
    self.RunWinsStart = 0
    self.GateStartedAt = 0
    self.GatePassage = nil
    self.GateText = "--"
    self.QueueStatus = "Disabled"
    self:ReleaseSafeZone()
    self:SetCrossNoclip(false)
    self:DismissTeleportError()

    if not toggles.RunawaysPlayerGodMode or not toggles.RunawaysPlayerGodMode.Value then
        restoreGodMode()
    end

    pcall(function()
        game:GetService("TeleportService"):SetTeleportSetting(self.EnabledKey, false)
        game:GetService("TeleportService"):SetTeleportSetting(self.TransitionKey, "")
    end)

    self:SetPhase("Stopped", "Auto Farm is disabled")
    self:Persist()

    if not silent then
        notify("Auto Farm stopped.")
    end
end

function library.AutoFarm:Destroy(preserve)
    self.Running = false
    self.ResumeRequested = false
    self.Token = nil
    self.RunActive = false
    self.ActiveRunToken = nil
    self.Teleporting = false
    self.TeleportRecoveryGeneration += 1
    self.TeleportRetryCount = 0
    self.TeleportRetryDelay = 0
    self.TeleportRetryTarget = 0
    self.TeleportRetryOptions = nil
    self.TeleportRecovering = false
    self.LastTeleportFailureAt = 0
    self.ResultBusy = false
    self.ResultFinalized = false
    self.ReplayRequested = false
    self.WebhookGeneration += 1
    self:ReleaseSafeZone()
    self:SetCrossNoclip(false)
    self:DismissTeleportError()

    if self.TeleportConnection then
        self.TeleportConnection:Disconnect()
        self.TeleportConnection = nil
    end

    if self.TeleportFailedConnection then
        self.TeleportFailedConnection:Disconnect()
        self.TeleportFailedConnection = nil
    end

    if not toggles.RunawaysPlayerGodMode or not toggles.RunawaysPlayerGodMode.Value then
        restoreGodMode()
    end

    if not preserve then
        self.TransitionToken = ""
        self.ExpectedPlaceId = 0
        self.TransitionAt = 0
        env.RunawaysAutoFarmTransitionToken = nil

        pcall(function()
            game:GetService("TeleportService"):SetTeleportSetting(self.EnabledKey, false)
            game:GetService("TeleportService"):SetTeleportSetting(self.TransitionKey, "")
        end)

        self.PendingFinish = false
        self.FinishCrossed = false
        self.PendingAt = 0
        self.LastGameJob = ""
        self.RunStartedAt = 0
        self.RunCashStart = 0
        self.RunWinsStart = 0
        self.GateStartedAt = 0
        self.GatePassage = nil
        self.GateText = "--"
        self:Persist()
    end
end

local window = library:CreateWindow({
    Title = "RUNAWAYS",
    Footer = "RUNAWAYS | " .. telegram,
    Size = UDim2.fromOffset(library.IsMobile and 560 or 640, library.IsMobile and 360 or 520),
    NotifySide = "Right",
    ShowCustomCursor = not library.IsMobile,
    ShowMobileButtons = true,
    MobileButtonsSide = "Left",
    EnableCompacting = true,
})

local tabs = {
    Main = window:AddTab("Main", "package", ""),
    Player = window:AddTab("Player", "user", ""),
    Teleports = window:AddTab("Teleports", "map-pin", ""),
    Car = window:AddTab("Car Modify", "car-front", ""),
    Weapon = window:AddTab("Weapon", "crosshair", ""),
    ESP = window:AddTab("ESP", "eye", ""),
    AutoFarm = window:AddTab("Auto Farm", "bot", ""),
    Settings = window:AddTab("Settings", "settings", ""),
}

if library.LobbyShop:IsLobby() then
    library.LobbyShop.Box = tabs.Main:AddLeftGroupbox("Lobby Shop", "store")
end

local lootBox = tabs.Main:AddLeftGroupbox("Loot", "package-open")
local sellBox = tabs.Main:AddLeftGroupbox("Money", "badge-dollar-sign")
tabs.RemoteShopBox = tabs.Main:AddLeftGroupbox("Remote Shop", "shopping-cart")
local npcBox = library.IsMobile and tabs.Main:AddLeftGroupbox("NPCs", "users") or tabs.Main:AddRightGroupbox("NPCs", "users")
bringItems.Box = library.IsMobile and tabs.Main:AddLeftGroupbox("Bring Items", "package-plus") or tabs.Main:AddRightGroupbox("Bring Items", "package-plus")
local utilityBox = library.IsMobile and tabs.Main:AddLeftGroupbox("Utility", "wrench") or tabs.Main:AddRightGroupbox("Utility", "wrench")
local movementBox = tabs.Player:AddLeftGroupbox("Movement", "gauge")
local worldBox = library.IsMobile and tabs.Player:AddLeftGroupbox("Camera and World", "camera") or tabs.Player:AddRightGroupbox("Camera and World", "camera")
punchMods.Box = library.IsMobile and tabs.Player:AddLeftGroupbox("Melee Mods", "hand") or tabs.Player:AddRightGroupbox("Melee Mods", "hand")
teleports.LocationBox = tabs.Teleports:AddLeftGroupbox("Locations", "map-pin")
teleports.EntityBox = library.IsMobile and tabs.Teleports:AddLeftGroupbox("Entities", "users") or tabs.Teleports:AddRightGroupbox("Entities", "users")
local carPerformanceBox = tabs.Car:AddLeftGroupbox("Performance", "gauge")
local carUtilityBox = library.IsMobile and tabs.Car:AddLeftGroupbox("Vehicle Utility", "wrench") or tabs.Car:AddRightGroupbox("Vehicle Utility", "wrench")
local weaponBox = tabs.Weapon:AddLeftGroupbox("Weapon Mods", "crosshair")
local silentAimBox = library.IsMobile and tabs.Weapon:AddLeftGroupbox("Silent Aim", "target") or tabs.Weapon:AddRightGroupbox("Silent Aim", "target")
library.AutoFarm.ControlBox = tabs.AutoFarm:AddLeftGroupbox("Automation", "bot")
library.AutoFarm.StatsBox = tabs.AutoFarm:AddLeftGroupbox("Session Statistics", "chart-no-axes-combined")
library.AutoFarm.RunBox = library.IsMobile and tabs.AutoFarm:AddLeftGroupbox("Run Details", "route") or tabs.AutoFarm:AddRightGroupbox("Run Details", "route")
library.AutoFarm.WebhookBox = library.IsMobile and tabs.AutoFarm:AddLeftGroupbox("Webhook", "webhook") or tabs.AutoFarm:AddRightGroupbox("Webhook", "webhook")
local espLeft = tabs.ESP:AddLeftTabbox()
local espRight = library.IsMobile and espLeft or tabs.ESP:AddRightTabbox()
local espStyleBox = espLeft:AddTab("Style")
local espItemBox = espRight:AddTab("Items")
local espPlayerBox = espRight:AddTab("Players")
local espNPCBox = espRight:AddTab("NPCs")
local espWorldBox = espRight:AddTab("World")
local menuBox = tabs.Settings:AddLeftGroupbox("Menu", "wrench")

library.AutoFarm.ControlBox:AddToggle("RunawaysAutoFarm", {
    Text = "Auto Farm",
    Default = false,
    Callback = function(value)
        if value then
            library.AutoFarm:Start()
        else
            library.AutoFarm:Stop()
        end
    end,
})

library.AutoFarm.ControlBox:AddToggle("RunawaysAutoFarmSafeGateWait", {
    Text = "Safe Gate Wait",
    Default = true,
    Callback = function(value)
        library.AutoFarm.Config.SafeGateWait = value

        if not value then
            library.AutoFarm:ReleaseSafeZone()
        end

        if library.AutoFarm.StateReady then
            library.AutoFarm:Persist()
        end
    end,
})

library.AutoFarm.ControlBox:AddToggle("RunawaysAutoFarmAutoReplay", {
    Text = "Auto Replay",
    Default = true,
    Callback = function(value)
        library.AutoFarm.Config.AutoReplay = value

        if library.AutoFarm.StateReady then
            library.AutoFarm:Persist()
        end
    end,
})

library.AutoFarm.ControlBox:AddSlider("RunawaysAutoFarmLobbyDelay", {
    Text = "Delay Between Runs",
    Default = 3,
    Min = 0,
    Max = 30,
    Rounding = 0,
    Suffix = " seconds",
    Callback = function(value)
        library.AutoFarm.Config.LobbyDelay = value

        if library.AutoFarm.StateReady then
            library.AutoFarm:Persist()
        end
    end,
})

library.AutoFarm.ControlBox:AddSlider("RunawaysAutoFarmGateTimeout", {
    Text = "Gate Timeout",
    Default = 165,
    Min = 125,
    Max = 240,
    Rounding = 0,
    Suffix = " seconds",
    Callback = function(value)
        library.AutoFarm.Config.GateTimeout = value

        if library.AutoFarm.StateReady then
            library.AutoFarm:Persist()
        end
    end,
})

library.AutoFarm.ControlBox:AddSlider("RunawaysAutoFarmRetryDelay", {
    Text = "Retry Delay",
    Default = 10,
    Min = 3,
    Max = 30,
    Rounding = 0,
    Suffix = " seconds",
    Callback = function(value)
        library.AutoFarm.Config.RetryDelay = value

        if library.AutoFarm.StateReady then
            library.AutoFarm:Persist()
        end
    end,
})

library.AutoFarm.ControlBox:AddButton("Reset Statistics", function()
    library.AutoFarm:ResetStats()
    notify("Auto Farm statistics reset.")
end)

library.AutoFarm.Labels.Session = library.AutoFarm.StatsBox:AddLabel("Session: 00:00:00 | Credz: +0", true)
library.AutoFarm.Labels.Runs = library.AutoFarm.StatsBox:AddLabel("Runs: 0 completed / 0 started | 0.0%", true)
library.AutoFarm.Labels.Failures = library.AutoFarm.StatsBox:AddLabel("Failures: 0 | Retries: 0 | Replay votes: 0 | Teleports: 0", true)
library.AutoFarm.Labels.Timing = library.AutoFarm.StatsBox:AddLabel("Average: 00:00:00 | Best: 00:00:00 | Last: 00:00:00", true)
library.AutoFarm.Labels.Combat = library.AutoFarm.StatsBox:AddLabel("NPC attack requests: 0 | Gate activations: 0", true)

library.AutoFarm.Labels.Status = library.AutoFarm.RunBox:AddLabel("Status: Idle\nReady", true)
library.AutoFarm.Labels.Context = library.AutoFarm.RunBox:AddLabel("Context: Detecting", true)
library.AutoFarm.Labels.Queue = library.AutoFarm.RunBox:AddLabel("Queue: Not armed", true)
library.AutoFarm.Labels.Run = library.AutoFarm.RunBox:AddLabel("Current run: 00:00:00 | Gate: --", true)
library.AutoFarm.Labels.Error = library.AutoFarm.RunBox:AddLabel("Last error: None", true)
library.AutoFarm.Labels.Webhook = library.AutoFarm.RunBox:AddLabel("Webhook: Idle", true)

library.AutoFarm.WebhookBox:AddInput("RunawaysAutoFarmWebhookURL", {
    Text = "Discord Webhook URL",
    Default = "",
    Finished = true,
    ClearTextOnFocus = false,
    ClearTextOnBlur = false,
    Placeholder = "https://discord.com/api/webhooks/...",
    AllowEmpty = true,
    Callback = function(value)
        library.AutoFarm.Webhook.URL = tostring(value or "")

        if library.AutoFarm.StateReady then
            library.AutoFarm:Persist()
        end
    end,
})

library.AutoFarm.WebhookBox:AddToggle("RunawaysAutoFarmWebhook", {
    Text = "Webhook Notifications",
    Default = false,
    Callback = function(value)
        library.AutoFarm.Webhook.Enabled = value

        if library.AutoFarm.StateReady then
            library.AutoFarm:Persist()
        end
    end,
})

library.AutoFarm.WebhookBox:AddDropdown("RunawaysAutoFarmWebhookEvents", {
    Values = { "Session Started", "Run Started", "Run Completed", "Error", "Stopped" },
    Default = { "Session Started", "Run Started", "Run Completed", "Error", "Stopped" },
    Multi = true,
    Text = "Events",
    MaxVisibleDropdownItems = 8,
    Callback = function(value)
        library.AutoFarm.Webhook.Events = table.clone(value)

        if library.AutoFarm.StateReady then
            library.AutoFarm:Persist()
        end
    end,
})

library.AutoFarm.WebhookBox:AddButton("Send Test Webhook", function()
    library.AutoFarm:SendWebhook("Test", "Webhook connection test", true)
end)

library.AutoFarm.TeleportConnection = player.OnTeleport:Connect(function(state)
    if not library.AutoFarm.Running then
        return
    end

    if state == Enum.TeleportState.Started or state == Enum.TeleportState.InProgress then
        if not library.AutoFarm.Teleporting then
            library.AutoFarm.Stats.Teleports += 1
        end

        library.AutoFarm.Teleporting = true
        library.AutoFarm:SetPhase("Teleporting", "Moving to the next server")
        library.AutoFarm:Persist()
    end
end)

library.AutoFarm.TeleportFailedConnection = game:GetService("TeleportService").TeleportInitFailed:Connect(
    function(failedPlayer, result, message, targetPlaceId, teleportOptions)
        if failedPlayer ~= player then
            return
        end

        library.AutoFarm:HandleTeleportFailure(result, message, targetPlaceId, teleportOptions)
    end
)

teleports.LocationBox:AddLabel("Route")
teleports.LocationBox:AddButton("Teleport to End Gate", function()
    teleports:ToEnd()
end)
teleports.LocationBox:AddButton("Teleport to Start", function()
    teleports:ToStart()
end)
teleports.LocationBox:AddButton("Teleport to Objective", function()
    teleports:ToObjective()
end)
teleports.LocationBox:AddDivider()
teleports.LocationBox:AddDropdown("RunawaysTeleportBuilding", {
    Values = { "None" },
    Default = 1,
    Multi = false,
    Text = "Building",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
})
teleports.LocationBox:AddButton("Teleport to Building", function()
    teleports:Go("Buildings")
end)
teleports.LocationBox:AddDivider()
teleports.LocationBox:AddButton("Save Current Position", function()
    teleports:SavePosition()
end)
teleports.LocationBox:AddButton("Teleport to Saved Position", function()
    teleports:ToSaved()
end)
teleports.LocationBox:AddButton("Return to Previous Position", function()
    teleports:ToLast()
end)

teleports.EntityBox:AddDropdown("RunawaysTeleportNPC", {
    Values = { "None" },
    Default = 1,
    Multi = false,
    Text = "NPC",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
})
teleports.EntityBox:AddButton("Teleport to NPC", function()
    teleports:Go("NPCs")
end)
teleports.EntityBox:AddDropdown("RunawaysTeleportVehicle", {
    Values = { "None" },
    Default = 1,
    Multi = false,
    Text = "Vehicle",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
})
teleports.EntityBox:AddButton("Teleport to Vehicle", function()
    teleports:Go("Vehicles")
end)
teleports.EntityBox:AddDropdown("RunawaysTeleportPlayer", {
    Values = { "None" },
    Default = 1,
    Multi = false,
    Text = "Player",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
})
teleports.EntityBox:AddButton("Teleport to Player", function()
    teleports:Go("Players")
end)

npcBox:AddButton("Kill NPCs Once", function()
    local count = killAllNPCs()

    notify(string.format("Attacked NPCs: %d.", count), 4)
end)

npcBox:AddSlider("RunawaysRageNPCRadius", {
    Text = "Aura Radius",
    Default = 150,
    Min = 10,
    Max = 1000,
    Rounding = 0,
    Suffix = " studs",
})

npcBox:AddToggle("RunawaysRageNPCKillAura", {
    Text = "NPC Kill Aura",
    Default = false,
    Callback = function(value)
        library.Rage.KillAuraLoop = value and {} or nil

        local token = library.Rage.KillAuraLoop

        if not token then
            return
        end

        task.spawn(function()
            while library.Rage.KillAuraLoop == token and not library.Unloaded do
                killAllNPCs(options.RunawaysRageNPCRadius.Value)
                task.wait(0.15)
            end
        end)
    end,
})

npcBox:AddButton("Aggro Nearby NPCs", function()
    local count = library.Rage:AggroNPCs(options.RunawaysRageNPCRadius.Value)

    notify(string.format("Aggro requests: %d.", count), 4)
end)

sellBox:AddSlider("RunawaysRageWorldRadius", {
    Text = "Break Radius",
    Default = 100,
    Min = 10,
    Max = 1000,
    Rounding = 0,
    Suffix = " studs",
})

sellBox:AddButton("Break Nearby Cash Sources", function()
    local count = library.Rage:BreakNearbySources(options.RunawaysRageWorldRadius.Value)

    notify(string.format("Break requests: %d.", count), 4)
end)

if library.LobbyShop.Box then
    library.LobbyShop.Box:AddLabel("Credz purchases only")
    library.LobbyShop.Box:AddDropdown("RunawaysLobbyShopCategory", {
        Values = { "Classes", "Weapons", "Vehicles" },
        Default = 1,
        Multi = false,
        Text = "Category",
        Callback = function()
            library.LobbyShop:Refresh(true)
        end,
    })
    library.LobbyShop.Box:AddDropdown("RunawaysLobbyShopItem", {
        Values = { "None" },
        Default = 1,
        Multi = false,
        Text = "Item",
        Searchable = true,
        MaxVisibleDropdownItems = 12,
    })
    library.LobbyShop.Box:AddButton("Buy Selected Item", function()
        library.LobbyShop:Buy()
    end)
end

tabs.RemoteShopBox:AddLabel("Server prices apply")
tabs.RemoteShopBox:AddDropdown("RunawaysRemoteShopItem", {
    Values = { "None" },
    Default = 1,
    Multi = false,
    Text = "Item",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
})
tabs.RemoteShopBox:AddButton("Buy Selected Item", function()
    remoteShop:Buy()
end)

local function makeFullWidth(tab)
    local defaultRefresh = tab.RefreshSides

    function tab:RefreshSides()
        defaultRefresh(self)

        local left = self.Sides[1]
        local right = self.Sides[2]

        left.Size = UDim2.new(1, -3, left.Size.Y.Scale, left.Size.Y.Offset)
        right.Visible = false
    end

    tab:RefreshSides()
end

if library.IsMobile then
    for _, tab in { tabs.Main, tabs.Player, tabs.Teleports, tabs.Car, tabs.Weapon, tabs.ESP, tabs.AutoFarm, tabs.Settings } do
        makeFullWidth(tab)
    end
else
    local defaultESPRefresh = tabs.ESP.RefreshSides

    function tabs.ESP:RefreshSides()
        defaultESPRefresh(self)

        local left = self.Sides[1]
        local right = self.Sides[2]

        left.Size = UDim2.new(0.42, -3, left.Size.Y.Scale, left.Size.Y.Offset)
        right.Size = UDim2.new(0.58, -3, right.Size.Y.Scale, right.Size.Y.Offset)
    end

    tabs.ESP:RefreshSides()
end

lootBox:AddDropdown("LootItems", {
    Values = bringItems.Names,
    Default = {},
    Multi = true,
    Text = "Items",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
    FormatDisplayValue = formatName,
    FormatListValue = formatName,
})

bringItems.Box:AddDropdown("RunawaysBringItems", {
    Values = bringItems.Names,
    Default = {},
    Multi = true,
    Text = "Items",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
    FormatDisplayValue = formatName,
    FormatListValue = formatName,
})

bringItems.Box:AddDropdown("RunawaysBringCategories", {
    Values = dropCategories,
    Default = {},
    Multi = true,
    Text = "Categories",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
    FormatDisplayValue = formatName,
    FormatListValue = formatName,
})

bringItems.Box:AddButton("Bring Selected", function()
    bringItems:Start(false)
end)

bringItems.Box:AddButton("Bring All", function()
    bringItems:Start(true)
end)

bringItems.Box:AddButton("Stop Bring", function()
    bringItems:Stop()
end)

function bringItems:UpdateOption(id, values, force)
    local option = options[id]

    if not option then
        return
    end

    local signature = table.concat(values, "\0")
    local selected = table.clone(option.Value)
    local value = {}
    local changed = false

    for _, name in values do
        if selected[name] then
            value[name] = true
        end
    end

    for name in selected do
        if not value[name] then
            changed = true
            break
        end
    end

    if force or self.Signatures[id] ~= signature then
        option:SetValues(values)
        option:SetValue(value)
        self.Signatures[id] = signature
    elseif changed then
        option:SetValue(value)
    end
end

function bringItems:Refresh(force)
    local _, names = getLoot()

    self.Names = names
    self:UpdateOption("LootItems", names, force)
    self:UpdateOption("RunawaysBringItems", names, force)
    self:UpdateOption("RunawaysBringCategories", dropCategories, force)
end

function bringItems:Restore(context)
    context = context or self.Context

    if not context then
        return
    end

    local part = context.OwnedPart

    if part and part.Parent then
        pcall(flow.Loot.OwnNetworkRequest, part, nil)
        context.OwnedPart = nil
    end

    local character = context.Character
    local root = context.Root

    if player.Character == character and character and character.Parent and root and root.Parent == character then
        pcall(function()
            character:PivotTo(context.StartPivot)
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end)
    end

    local camera = workspace.CurrentCamera or context.Camera

    if camera and camera.Parent then
        local subject = context.CameraSubject

        if player.Character ~= character or not subject or not subject.Parent then
            local currentCharacter = player.Character

            subject = currentCharacter and (currentCharacter:FindFirstChildOfClass("Humanoid") or currentCharacter:FindFirstChild("HumanoidRootPart"))
        end

        if subject then
            pcall(function()
                camera.CameraSubject = subject
            end)
        end

        pcall(function()
            camera.CameraType = context.CameraType
        end)
        pcall(function()
            camera.CFrame = context.CameraCFrame
        end)
    end
end

function bringItems:Stop(silent)
    if not self.Running then
        if not silent then
            notify("Bring is not running.")
        end

        return
    end

    local context = self.Context

    self.Token = nil
    self.Running = false
    busy = false

    if context then
        self:Restore(context)

        if self.Context == context then
            self.Context = nil
        end
    end

    if not silent then
        notify("Bring stopped.", 3)
    end
end

function bringItems:Start(all)
    if self.Running then
        notify("Bring is already running.", 3)
        return
    end

    if busy then
        notify("Another inventory action is running.", 3)
        return
    end

    local selectedNames = table.clone(options.RunawaysBringItems.Value)
    local selectedCategories = table.clone(options.RunawaysBringCategories.Value)

    if not all and not next(selectedNames) and not next(selectedCategories) then
        notify("Select items or categories first.")
        return
    end

    local token = {}

    self.Token = token
    self.Running = true
    self.Context = nil
    busy = true

    task.spawn(function()
        local attempted = 0
        local brought = 0
        local failed = 0
        local stopped = false
        local character
        local root
        local startPivot
        local startRoot
        local camera
        local cameraCFrame
        local cameraSubject
        local cameraType
        local ownedPart
        local context

        local ok, message = pcall(function()
            character = player.Character

            local humanoid = character and character:FindFirstChildOfClass("Humanoid")

            root = character and character:FindFirstChild("HumanoidRootPart")

            if not character or not humanoid or not root or humanoid.Health <= 0 then
                error("Character is not ready.", 0)
            end

            if humanoid.SeatPart then
                error("Exit the vehicle first.", 0)
            end

            startPivot = character:GetPivot()
            startRoot = root.CFrame
            camera = workspace.CurrentCamera
            cameraCFrame = camera and camera.CFrame
            cameraSubject = camera and camera.CameraSubject
            cameraType = camera and camera.CameraType

            if self.Token ~= token or library.Unloaded then
                stopped = true
                return
            end

            context = {
                Character = character,
                Root = root,
                StartPivot = startPivot,
                Camera = camera,
                CameraCFrame = cameraCFrame,
                CameraSubject = cameraSubject,
                CameraType = cameraType,
            }
            self.Context = context

            if camera then
                camera.CameraType = Enum.CameraType.Scriptable
                camera.CFrame = cameraCFrame
            end

            local items = getLoot()

            for _, item in items do
                if self.Token ~= token or library.Unloaded then
                    stopped = true
                    break
                end

                local category = getToolCategory(item)

                if not all and not selectedNames[item.Name] and not (category and selectedCategories[category]) then
                    continue
                end

                if not isLoot(item) then
                    continue
                end

                attempted += 1

                local part = item.PrimaryPart
                local pickup = getPickupCFrame(root, part)

                character:PivotTo(pickup)
                root.AssemblyLinearVelocity = Vector3.zero
                root.AssemblyAngularVelocity = Vector3.zero
                task.wait(0.22)

                if self.Token ~= token or library.Unloaded then
                    stopped = true
                    break
                end

                if not isLoot(item) then
                    failed += 1

                    if character.Parent and root.Parent == character then
                        character:PivotTo(startPivot)
                        root.AssemblyLinearVelocity = Vector3.zero
                        root.AssemblyAngularVelocity = Vector3.zero
                    end

                    task.wait(0.06)
                    continue
                end

                if item:HasTag("Attachable") and type(flow.Loot.WeldDetach) == "function" then
                    pcall(flow.Loot.WeldDetach, part)

                    local weld = part:FindFirstChild("AttachableWeld")

                    if weld then
                        weld:Destroy()
                    end

                    task.wait(0.05)
                end

                if self.Token ~= token or library.Unloaded then
                    stopped = true
                    break
                end

                ownedPart = part
                context.OwnedPart = part

                local requestOk, granted = pcall(flow.Loot.OwnNetworkRequestAsync, part, true)

                if not requestOk then
                    local weld = part:FindFirstChild("AttachableWeld")

                    if weld then
                        weld:Destroy()
                    end

                    requestOk, granted = pcall(flow.Loot.OwnNetworkRequestAsync, part, true)
                end

                local ready = false

                if requestOk and granted then
                    local expires = os.clock() + 0.75

                    repeat
                        RunService.Heartbeat:Wait()
                        ready = part.Parent == item and not part.Anchored

                        if ready and type(isnetworkowner) == "function" then
                            local ownerOk, owns = pcall(isnetworkowner, part)

                            ready = ownerOk and owns
                        end
                    until ready or self.Token ~= token or library.Unloaded or os.clock() >= expires
                end

                if self.Token ~= token or library.Unloaded or self.Context ~= context then
                    stopped = true

                    local activeContext = self.Context

                    if not (activeContext and activeContext ~= context and activeContext.OwnedPart == part) then
                        pcall(flow.Loot.OwnNetworkRequest, part, nil)
                    end

                    ownedPart = nil
                    context.OwnedPart = nil
                    break
                end

                if ready and self.Token == token and not library.Unloaded and isLoot(item) then
                    local column = (attempted - 1) % 4
                    local row = math.floor((attempted - 1) / 4)
                    local targetPosition = (startRoot * CFrame.new((column - 1.5) * 4, 2, -7 - row * 4)).Position
                    local target = CFrame.new(targetPosition) * part.CFrame.Rotation

                    item:PivotTo(target * part.CFrame:Inverse() * item:GetPivot())
                    part.AssemblyLinearVelocity = Vector3.zero
                    part.AssemblyAngularVelocity = Vector3.zero
                    brought += 1
                else
                    failed += 1
                end

                if character.Parent and root.Parent == character then
                    character:PivotTo(startPivot)
                    root.AssemblyLinearVelocity = Vector3.zero
                    root.AssemblyAngularVelocity = Vector3.zero
                end

                RunService.Heartbeat:Wait()
                RunService.Heartbeat:Wait()
                pcall(flow.Loot.OwnNetworkRequest, part, nil)
                ownedPart = nil
                context.OwnedPart = nil
                task.wait(0.06)
            end
        end)

        if self.Context == context then
            self:Restore(context)
            self.Context = nil
        elseif ownedPart and ownedPart.Parent then
            local activeContext = self.Context

            if not (activeContext and activeContext ~= context and activeContext.OwnedPart == ownedPart) then
                pcall(flow.Loot.OwnNetworkRequest, ownedPart, nil)
            end
        end

        if self.Token ~= token then
            return
        end

        self.Token = nil
        self.Running = false
        busy = false

        if library.Unloaded then
            return
        end

        self:Refresh()

        if not ok then
            notify("Bring failed: " .. tostring(message), 6)
        elseif stopped then
            notify(string.format("Bring stopped. Brought: %d.", brought))
        elseif attempted == 0 then
            notify("Nothing to bring.")
        elseif failed == 0 then
            notify(string.format("Brought: %d.", brought))
        else
            notify(string.format("Brought: %d, failed: %d.", brought, failed), 6)
        end
    end)
end

function bringItems:GetCashAmount()
    local leaderstats = player:FindFirstChild("leaderstats")
    local cash = leaderstats and leaderstats:FindFirstChild("Cash 💵")

    if cash and (cash:IsA("NumberValue") or cash:IsA("IntValue")) then
        return cash.Value
    end

    local playerGui = player:FindFirstChildOfClass("PlayerGui")
    local hud = playerGui and playerGui:FindFirstChild("HudGui")
    local panel = hud and hud:FindFirstChild("BottomPanel")
    local frame = panel and panel:FindFirstChild("CashAmount")
    local label = frame and frame:FindFirstChild("CashAmount")
    local digits = label and label.Text:gsub("[^%d]", "")

    return digits and tonumber(digits)
end

function bringItems:IsCashSource(source)
    return source:IsA("Model")
        and source:IsDescendantOf(workspace)
        and source:HasTag("DamageToOpen")
        and source:FindFirstChild("Health") ~= nil
        and source:FindFirstChild("CashFx", true) ~= nil
end

function bringItems:GetCashDrops(sortDrops)
    local drops = {}
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local origin = root and root.Position or Vector3.zero

    for _, cash in CollectionService:GetTagged("Cash") do
        local holder = cash.Parent
        local sensor = holder and holder:FindFirstChild("TouchSensor", true)

        if cash:IsDescendantOf(workspace) and holder and holder:IsA("Model") and not holder:HasTag("ForbiddenLoot") and sensor and sensor:IsA("BasePart") then
            drops[#drops + 1] = cash
        end
    end

    if sortDrops ~= false then
        table.sort(drops, function(a, b)
            local aHolder = a.Parent
            local bHolder = b.Parent
            local aSensor = aHolder and aHolder:FindFirstChild("TouchSensor", true)
            local bSensor = bHolder and bHolder:FindFirstChild("TouchSensor", true)

            if not aSensor or not bSensor then
                return a.Name < b.Name
            end

            return (aSensor.Position - origin).Magnitude < (bSensor.Position - origin).Magnitude
        end)
    end

    return drops
end

function bringItems:CollectCashDrop(token, context, cash)
    if self.CashToken ~= token or self.CashContext ~= context or library.Unloaded then
        return false
    end

    local holder = cash and cash.Parent
    local sensor = holder and holder:FindFirstChild("TouchSensor", true)
    local character = context.Character
    local root = context.Root

    if not sensor or not sensor:IsA("BasePart") or not cash:IsDescendantOf(workspace) then
        return false
    end

    if player.Character ~= character or not character.Parent or root.Parent ~= character then
        return false
    end

    local offset = context.StartPivot.Position - sensor.Position
    local direction = Vector3.new(offset.X, 0, offset.Z)

    direction = direction.Magnitude > 0.05 and direction.Unit or Vector3.xAxis

    local position = sensor.Position + direction * 6 + Vector3.yAxis * 2.5

    if context.Camera and context.Camera.Parent then
        context.Camera.CameraType = Enum.CameraType.Scriptable
        context.Camera.CFrame = context.CameraCFrame
    end

    character:PivotTo(CFrame.lookAt(position, Vector3.new(sensor.Position.X, position.Y, sensor.Position.Z)))
    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    task.wait(0.8)

    if self.CashToken ~= token or self.CashContext ~= context or library.Unloaded then
        return false
    end

    local before = self:GetCashAmount()
    local called = pcall(flow.Cash.Collect, cash)
    local expires = os.clock() + 0.8

    repeat
        task.wait(0.05)

        local current = self:GetCashAmount()

        if not cash:IsDescendantOf(workspace) or before and current and current > before then
            return called
        end
    until self.CashToken ~= token or self.CashContext ~= context or library.Unloaded or os.clock() >= expires

    return called and not cash:IsDescendantOf(workspace)
end

function bringItems:StopCash(silent)
    if not self.CashRunning and not self.CashContext then
        if not silent then
            notify("Cash run is not running.")
        end

        return
    end

    local context = self.CashContext

    self.CashToken = nil
    self.CashRunning = false
    busy = false

    if context then
        self:Restore(context)

        if self.CashContext == context then
            self.CashContext = nil
        end
    end

    if not silent then
        notify("Cash run stopped.", 3)
    end
end

function bringItems:StartCashRun(breakSources)
    if self.CashRunning then
        notify("Cash run is already running.", 3)
        return
    end

    if busy then
        notify("Another inventory action is running.", 3)
        return
    end

    local selected = breakSources and table.clone(options.RunawaysCashSources.Value) or {}

    if breakSources and not next(selected) then
        notify("Select at least one cash source.")
        return
    end

    local token = {}

    self.CashToken = token
    self.CashRunning = true
    self.CashContext = nil
    busy = true

    task.spawn(function()
        local opened = 0
        local sourceAttempts = 0
        local attempted = 0
        local collected = 0
        local before = self:GetCashAmount()
        local context
        local ok, message = pcall(function()
            if not flow.Cash or type(flow.Cash.Collect) ~= "function" then
                error("Cash collection is unavailable.", 0)
            end

            if breakSources and (not flow.DamageToOpen or type(flow.DamageToOpen.Damage) ~= "function") then
                error("Cash sources are unavailable.", 0)
            end

            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local root = character and character:FindFirstChild("HumanoidRootPart")

            if not character or not humanoid or not root or humanoid.Health <= 0 then
                error("Character is not ready.", 0)
            end

            if humanoid.SeatPart then
                error("Exit the vehicle first.", 0)
            end

            local camera = workspace.CurrentCamera

            context = {
                Character = character,
                Root = root,
                StartPivot = character:GetPivot(),
                Camera = camera,
                CameraCFrame = camera and camera.CFrame,
                CameraSubject = camera and camera.CameraSubject,
                CameraType = camera and camera.CameraType,
            }

            if self.CashToken ~= token or library.Unloaded then
                return
            end

            self.CashContext = context

            if camera then
                camera.CameraType = Enum.CameraType.Scriptable
                camera.CFrame = context.CameraCFrame
            end

            if breakSources then
                local sources = {}

                for _, source in CollectionService:GetTagged("DamageToOpen") do
                    if self:IsCashSource(source) then
                        local health = source:FindFirstChild("Health")
                        local enabled = false

                        for tag in selected do
                            if source:HasTag(tag) then
                                enabled = true
                                break
                            end
                        end

                        if enabled and health and health:IsA("NumberValue") and health.Value > 0 then
                            sources[#sources + 1] = source
                        end
                    end
                end

                table.sort(sources, function(a, b)
                    return a.Name < b.Name
                end)

                for _, source in sources do
                    if self.CashToken ~= token or self.CashContext ~= context or library.Unloaded or player.Character ~= character or not character.Parent or root.Parent ~= character or humanoid.Health <= 0 then
                        return
                    end

                    local health = source:FindFirstChild("Health")
                    local maxHealth = source:FindFirstChild("MaxHealth")

                    if health and health:IsA("NumberValue") and health.Value > 0 then
                        sourceAttempts += 1
                        local damage = math.max(health.Value, maxHealth and maxHealth.Value or 0, 1) * 10

                        pcall(flow.DamageToOpen.Damage, source, damage, "melee")
                        local expires = os.clock() + 0.6

                        repeat
                            task.wait(0.05)
                        until not health.Parent or health.Value <= 0 or self.CashToken ~= token or self.CashContext ~= context or library.Unloaded or os.clock() >= expires

                        if self.CashToken ~= token or self.CashContext ~= context or library.Unloaded or player.Character ~= character or not character.Parent or root.Parent ~= character or humanoid.Health <= 0 then
                            return
                        end

                        if health.Parent and health.Value > 0 then
                            pcall(flow.DamageToOpen.Damage, source, damage, "melee")

                            expires = os.clock() + 0.5

                            repeat
                                task.wait(0.05)
                            until not health.Parent or health.Value <= 0 or self.CashToken ~= token or self.CashContext ~= context or library.Unloaded or os.clock() >= expires
                        end

                        if not health.Parent or health.Value <= 0 then
                            opened += 1
                        end
                    end
                end

                task.wait(0.8)
            end

            local seen = {}
            local tries = {}
            local quiet = 0

            for _ = 1, 12 do
                if self.CashToken ~= token or self.CashContext ~= context or library.Unloaded or player.Character ~= character or not character.Parent or root.Parent ~= character or humanoid.Health <= 0 then
                    return
                end

                local found = false

                for _, cash in self:GetCashDrops() do
                    if not seen[cash] and (tries[cash] or 0) < 2 then
                        if not tries[cash] then
                            attempted += 1
                        end

                        tries[cash] = (tries[cash] or 0) + 1
                        found = true

                        if self:CollectCashDrop(token, context, cash) then
                            seen[cash] = true
                            collected += 1
                        end

                        if player.Character ~= character or not character.Parent or root.Parent ~= character or humanoid.Health <= 0 then
                            return
                        end
                    end
                end

                quiet = found and 0 or quiet + 1

                if quiet >= (breakSources and 6 or 3) then
                    break
                end

                task.wait(found and 0.1 or 0.25)
            end
        end)

        if self.CashToken ~= token then
            if self.CashContext == context then
                self:Restore(context)
                self.CashContext = nil
            end

            return
        end

        if self.CashContext == context then
            self:Restore(context)
            self.CashContext = nil
        end

        self.CashToken = nil
        self.CashRunning = false
        busy = false

        if library.Unloaded then
            return
        end

        local current = self:GetCashAmount()
        local earned = before and current and math.max(current - before, 0)

        if not ok then
            notify("Cash run failed: " .. tostring(message), 6)
        elseif sourceAttempts == 0 and attempted == 0 then
            notify(breakSources and "No cash sources or drops found." or "No cash found.")
        elseif sourceAttempts > 0 and opened == 0 and attempted == 0 then
            notify("Cash sources were found, but none opened.", 6)
        elseif earned and earned > 0 then
            notify(string.format("Earned: $%d. Opened: %d, collected: %d.", earned, opened, collected), 6)
        else
            notify(string.format("Opened: %d, collected: %d.", opened, collected), 6)
        end
    end)
end

function bringItems:SetCashAura(value)
    self.CashAuraToken = value and {} or nil

    local token = self.CashAuraToken

    if not token then
        return
    end

    task.spawn(function()
        local attempts = setmetatable({}, { __mode = "k" })

        while self.CashAuraToken == token and not library.Unloaded do
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local root = character and character:FindFirstChild("HumanoidRootPart")

            if humanoid and root and humanoid.Health > 0 then
                for _, cash in self:GetCashDrops(false) do
                    local holder = cash.Parent
                    local sensor = holder and holder:FindFirstChild("TouchSensor", true)
                    local last = attempts[cash]

                    if flow.Cash and type(flow.Cash.Collect) == "function" and sensor and (sensor.Position - root.Position).Magnitude <= 7 and (not last or os.clock() - last >= 0.75) then
                        attempts[cash] = os.clock()
                        pcall(flow.Cash.Collect, cash)
                    end
                end
            end

            task.wait(0.12)
        end
    end)
end

function bringItems:Destroy()
    self:StopCash(true)
    self.CashAuraToken = nil
    self:Stop(true)
    table.clear(self.Names)
    table.clear(self.Signatures)
end

local function lootNearby()
    if busy then
        return false
    end

    local character = player.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    local root = character and character:FindFirstChild("HumanoidRootPart")
    local used, limit = getBackpackUsage()

    if not humanoid or not root or humanoid.Health <= 0 or humanoid.SeatPart or not used or not limit or used >= limit then
        return false
    end

    local items = getLoot()
    local nearest
    local nearestDistance = 8

    for _, item in items do
        local part = item.PrimaryPart
        local distance = part and (part.Position - root.Position).Magnitude

        if distance and distance <= nearestDistance then
            nearest = item
            nearestDistance = distance
        end
    end

    if not nearest or not isLoot(nearest) then
        return false
    end

    busy = true

    local ok, result = pcall(flow.Loot.LootEquip, nearest.PrimaryPart)

    busy = false

    return ok and result == "Success"
end

local function collect(filter)
    if busy then
        notify("Loot is already running.", 3)
        return
    end

    busy = true

    task.spawn(function()
        local attempted = 0
        local looted = 0
        local failed = 0
        local full = false
        local used
        local limit
        local character
        local root
        local startPivot
        local camera
        local cameraCFrame
        local cameraSubject
        local cameraType

        local ok, message = pcall(function()
            character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            root = character and character:FindFirstChild("HumanoidRootPart")

            if not character or not humanoid or not root or humanoid.Health <= 0 then
                error("Character is not ready.", 0)
            end

            if humanoid.SeatPart then
                error("Exit the vehicle first.", 0)
            end

            used, limit = getBackpackUsage()

            if not used or not limit then
                error("Backpack is not ready.", 0)
            end

            local items = getLoot()

            for _, item in items do
                if library.Unloaded then
                    break
                end

                if not filter(item.Name) or not isLoot(item) then
                    continue
                end

                local currentUsed, currentLimit = getBackpackUsage()

                if not currentUsed or not currentLimit then
                    error("Backpack is not ready.", 0)
                end

                used = math.max(used, currentUsed)
                limit = currentLimit

                if used >= limit then
                    full = true
                    break
                end

                attempted += 1

                local part = item.PrimaryPart
                local far = (root.Position - part.Position).Magnitude > 6

                if far then
                    if not startPivot then
                        startPivot = character:GetPivot()
                        camera = workspace.CurrentCamera
                        cameraCFrame = camera and camera.CFrame
                        cameraSubject = camera and camera.CameraSubject
                        cameraType = camera and camera.CameraType

                        if camera then
                            camera.CameraType = Enum.CameraType.Scriptable
                            camera.CFrame = cameraCFrame
                        end
                    end

                    character:PivotTo(getPickupCFrame(root, part))
                    root.AssemblyLinearVelocity = Vector3.zero
                    root.AssemblyAngularVelocity = Vector3.zero
                    task.wait(0.18)
                end

                local callOk, result = pcall(flow.Loot.LootEquip, part)

                if far and (not callOk or result ~= "Success") and isLoot(item) then
                    task.wait(0.15)
                    callOk, result = pcall(flow.Loot.LootEquip, part)
                end

                if callOk and result == "Success" then
                    looted += 1
                    used += 1
                else
                    failed += 1
                end

                task.wait(0.08)
            end
        end)

        if startPivot and character and character.Parent and root and root.Parent == character then
            character:PivotTo(startPivot)
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end

        if camera and camera.Parent then
            camera.CameraSubject = cameraSubject
            camera.CameraType = cameraType
            camera.CFrame = cameraCFrame
        end

        busy = false

        if library.Unloaded then
            return
        end

        bringItems:Refresh()

        if not ok then
            notify("Loot failed: " .. tostring(message), 6)
        elseif full then
            notify(string.format("Inventory full: %d/%d. Looted: %d.", used, limit, looted), 6)
        elseif attempted == 0 then
            notify("Nothing to loot.")
        elseif failed == 0 then
            notify(string.format("Looted: %d.", looted))
        else
            notify(string.format("Looted: %d, failed: %d.", looted, failed), 6)
        end
    end)
end

local function dropAllLoot()
    if busy then
        notify("Inventory action is already running.", 3)
        return
    end

    busy = true

    task.spawn(function()
        local dropped = 0

        local ok, message = pcall(function()
            local backpack = player:FindFirstChildOfClass("Backpack")
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local exclusions = table.clone(options.DropExclusions.Value)

            if not backpack or not character or not humanoid then
                error("Inventory is not ready.", 0)
            end

            local tools = {}

            for _, container in { backpack, character } do
                for _, tool in container:QueryDescendants("> Tool") do
                    local category = getToolCategory(tool)

                    if not tool:HasTag("Undroppable") and not (category and exclusions[category]) then
                        tools[#tools + 1] = tool
                    end
                end
            end

            humanoid:UnequipTools()

            for _, tool in tools do
                if tool.Parent == backpack or tool.Parent == character then
                    local callOk = pcall(flow.Loot.LootUnequip, tool, tool:HasTag("RemoteOnly"))

                    if callOk then
                        dropped += 1
                    end

                    task.wait(0.05)
                end
            end
        end)

        busy = false

        if library.Unloaded then
            return
        end

        if not ok then
            notify("Drop failed: " .. tostring(message), 6)
        elseif dropped == 0 then
            notify("Nothing to drop.")
        else
            notify(string.format("Dropped: %d.", dropped))
        end
    end)
end

local function getCashAmount()
    return bringItems:GetCashAmount()
end

local function sellAllLoot()
    if busy then
        notify("Inventory action is already running.", 3)
        return
    end

    busy = true

    task.spawn(function()
        local sold = 0
        local failed = 0
        local earned
        local character
        local root
        local startPivot
        local camera
        local cameraCFrame
        local cameraSubject
        local cameraType

        local ok, message = pcall(function()
            local backpack = player:FindFirstChildOfClass("Backpack")
            character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            root = character and character:FindFirstChild("HumanoidRootPart")
            local counter = CollectionService:GetTagged("PawnCounter")[1]
            local volume = counter and counter:FindFirstChild("Volume", true)
            local bell = counter and counter:FindFirstChild("CallBell", true)
            local prompt = bell and bell:FindFirstChildWhichIsA("ProximityPrompt", true)
            local exclusions = table.clone(options.SellExclusions.Value)

            if not backpack or not character or not humanoid or not root or humanoid.Health <= 0 then
                error("Inventory is not ready.", 0)
            end

            if humanoid.SeatPart then
                error("Exit the vehicle first.", 0)
            end

            if not volume or not bell or not prompt then
                error("Pawn shop is not available.", 0)
            end

            if prompt.Enabled then
                error("Pawn counter is occupied.", 0)
            end

            local tools = {}

            for _, container in { backpack, character } do
                for _, tool in container:QueryDescendants("> Tool") do
                    local category = getToolCategory(tool)
                    local value = lootValueByName[tool.Name]

                    if value and value > 0 and not tool:HasTag("Undroppable") and not (category and exclusions[category]) then
                        tools[#tools + 1] = tool
                    end
                end
            end

            if #tools == 0 then
                return
            end

            startPivot = character:GetPivot()
            camera = workspace.CurrentCamera
            cameraCFrame = camera and camera.CFrame
            cameraSubject = camera and camera.CameraSubject
            cameraType = camera and camera.CameraType

            if camera then
                camera.CameraType = Enum.CameraType.Scriptable
                camera.CFrame = cameraCFrame
            end

            local direction = bell.Position - volume.Position
            direction = Vector3.new(direction.X, 0, direction.Z)
            direction = direction.Magnitude > 0.1 and direction.Unit or -volume.CFrame.LookVector

            local position = volume.Position + direction * 3.8
            position = Vector3.new(position.X, volume.Position.Y + 0.35, position.Z)

            humanoid:UnequipTools()
            character:PivotTo(CFrame.lookAt(position, Vector3.new(volume.Position.X, position.Y, volume.Position.Z)))
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
            task.wait(0.25)

            local cashBefore = getCashAmount()
            local index = 1

            while index <= #tools and not library.Unloaded do
                local deposited = 0
                local batchValue = 0

                for _ = 1, 5 do
                    local tool = tools[index]

                    if not tool then
                        break
                    end

                    index += 1

                    if tool.Parent == backpack or tool.Parent == character then
                        local callOk = pcall(flow.Loot.LootUnequip, tool, tool:HasTag("RemoteOnly"))

                        if callOk then
                            local deadline = os.clock() + 0.75

                            repeat
                                task.wait()
                            until tool.Parent ~= backpack and tool.Parent ~= character or os.clock() >= deadline

                            if tool.Parent ~= backpack and tool.Parent ~= character then
                                deposited += 1
                                batchValue += lootValueByName[tool.Name]
                            else
                                failed += 1
                            end
                        else
                            failed += 1
                        end

                        task.wait(0.04)
                    end
                end

                if deposited > 0 then
                    local deadline = os.clock() + 3

                    repeat
                        task.wait(0.05)
                    until prompt.Enabled or os.clock() >= deadline

                    if not prompt.Enabled then
                        failed += deposited
                        break
                    end

                    local batchCash = getCashAmount()

                    local soldInBatch = 0

                    task.wait(0.15)

                    for _ = 1, deposited do
                        local currentCash = getCashAmount()

                        if batchCash and currentCash and currentCash - batchCash >= batchValue then
                            soldInBatch = deposited
                            break
                        end

                        deadline = os.clock() + 1.5

                        repeat
                            task.wait(0.03)
                            currentCash = getCashAmount()
                        until prompt.Enabled
                            or batchCash and currentCash and currentCash - batchCash >= batchValue
                            or os.clock() >= deadline

                        if batchCash and currentCash and currentCash - batchCash >= batchValue then
                            soldInBatch = deposited
                            break
                        end

                        if not prompt.Enabled then
                            break
                        end

                        local clickCash = currentCash

                        if fireproximityprompt then
                            fireproximityprompt(prompt)
                        else
                            prompt:InputHoldBegin()
                            task.wait(prompt.HoldDuration + 0.1)
                            prompt:InputHoldEnd()
                        end

                        local confirmed = false

                        deadline = os.clock() + 1.5

                        repeat
                            task.wait(0.05)
                            currentCash = getCashAmount()
                            confirmed = not prompt.Enabled or clickCash and currentCash and currentCash > clickCash
                        until confirmed or os.clock() >= deadline

                        if not confirmed then
                            break
                        end

                        soldInBatch += 1
                        task.wait(0.05)
                    end

                    local currentCash = getCashAmount()

                    if batchCash and currentCash and currentCash - batchCash >= batchValue then
                        soldInBatch = deposited
                    end

                    sold += soldInBatch

                    if soldInBatch < deposited then
                        failed += deposited - soldInBatch
                        break
                    end
                end
            end

            local cashAfter = getCashAmount()

            if cashBefore and cashAfter and cashAfter > cashBefore then
                earned = cashAfter - cashBefore
            end
        end)

        if startPivot and character and character.Parent and root and root.Parent == character then
            character:PivotTo(startPivot)
            root.AssemblyLinearVelocity = Vector3.zero
            root.AssemblyAngularVelocity = Vector3.zero
        end

        if camera and camera.Parent then
            camera.CameraSubject = cameraSubject
            camera.CameraType = cameraType
            camera.CFrame = cameraCFrame
        end

        busy = false

        if library.Unloaded then
            return
        end

        if not ok then
            notify("Sell failed: " .. tostring(message), 6)
        elseif sold == 0 and failed == 0 then
            notify("Nothing to sell.")
        elseif earned then
            notify(string.format("Sold: %d, earned: $%d.", sold, earned))
        elseif failed == 0 then
            notify(string.format("Sold: %d.", sold))
        else
            notify(string.format("Sold: %d, failed: %d.", sold, failed), 6)
        end
    end)
end

lootBox:AddButton({
    Text = "Loot Selected",
    Func = function()
        local selected = table.clone(options.LootItems.Value)

        if not next(selected) then
            notify("Select at least one item.", 3)
            return
        end

        collect(function(name)
            return selected[name] == true
        end)
    end,
})

lootBox:AddButton({
    Text = "Loot All",
    Func = function()
        collect(function()
            return true
        end)
    end,
})

lootBox:AddToggle("LootAura", {
    Text = "Loot Aura",
    Default = false,
    Callback = function(value)
        lootAuraLoop = value and {} or nil

        local token = lootAuraLoop

        if not token then
            return
        end

        task.spawn(function()
            while lootAuraLoop == token and not library.Unloaded do
                local picked = lootNearby()

                task.wait(picked and 0.1 or 0.2)
            end
        end)
    end,
})

lootBox:AddDropdown("DropExclusions", {
    Values = dropCategories,
    Default = table.find(dropCategories, "Backpack"),
    Multi = true,
    Text = "Keep Categories",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
    FormatDisplayValue = formatName,
    FormatListValue = formatName,
})

lootBox:AddButton({
    Text = "Drop All Loot",
    Func = dropAllLoot,
})

sellBox:AddDropdown("RunawaysCashSources", {
    Values = { "ATM", "Register", "Safe", "Nightstand", "Dumpster", "MailBox", "GarbageCan" },
    Default = { "ATM", "Register", "Safe", "Nightstand", "Dumpster", "MailBox", "GarbageCan" },
    Multi = true,
    Text = "Cash Sources",
    Searchable = true,
    MaxVisibleDropdownItems = 10,
    FormatDisplayValue = formatName,
    FormatListValue = formatName,
})

sellBox:AddButton({
    Text = "Cash Run",
    Func = function()
        bringItems:StartCashRun(true)
    end,
})

sellBox:AddButton({
    Text = "Collect All Cash",
    Func = function()
        bringItems:StartCashRun(false)
    end,
})

sellBox:AddButton({
    Text = "Stop Cash Run",
    Func = function()
        bringItems:StopCash()
    end,
})

sellBox:AddToggle("RunawaysCashAura", {
    Text = "Cash Aura",
    Default = false,
    Callback = function(value)
        bringItems:SetCashAura(value)
    end,
})

sellBox:AddDivider()

sellBox:AddDropdown("SellExclusions", {
    Values = dropCategories,
    Default = table.find(dropCategories, "Backpack"),
    Multi = true,
    Text = "Keep Categories",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
    FormatDisplayValue = formatName,
    FormatListValue = formatName,
})

sellBox:AddButton({
    Text = "Sell All Loot",
    Func = sellAllLoot,
})

npcBox:AddToggle("KillAllNPCs", {
    Text = "Kill All NPCs",
    Default = false,
    Callback = function(value)
        killLoop = value and {} or nil

        local token = killLoop

        if not token then
            return
        end

        task.spawn(function()
            while killLoop == token and not library.Unloaded do
                killAllNPCs()
                task.wait(0.5)
            end
        end)
    end,
})

do
    utilityBox:AddToggle("RunawaysInstantPrompt", {
        Text = "Instant Prompt",
        Default = false,
        Callback = function(value)
            instantPrompt:SetActive(value)
        end,
    })

    utilityBox:AddToggle("RunawaysVehicleAutoRefuel", {
        Text = "Auto Refuel",
        Default = false,
        Callback = function(value)
            teleports:SetAutoRefuel(value)
        end,
    })
end

local function useCurrentVehicle(callback)
    local vehicle = getCurrentVehicle()

    if not vehicle then
        notify("Enter the driver's seat first.")
        return
    end

    callback(vehicle)
end

carPerformanceBox:AddLabel("Uses the current vehicle's stock values")

carPerformanceBox:AddToggle("RunawaysVehiclePerformance", {
    Text = "Performance Mods",
    Default = false,
    Callback = function(value)
        if not value then
            restoreAllVehiclePerformance()
        end
    end,
})

carPerformanceBox:AddSlider("RunawaysVehicleTopSpeedMultiplier", {
    Text = "Top Speed",
    Default = 2,
    Min = 1,
    Max = 5,
    Rounding = 1,
    Suffix = "x",
})

carPerformanceBox:AddSlider("RunawaysVehicleAccelerationMultiplier", {
    Text = "Acceleration",
    Default = 3,
    Min = 1,
    Max = 10,
    Rounding = 1,
    Suffix = "x",
})

carPerformanceBox:AddSlider("RunawaysVehicleTorqueMultiplier", {
    Text = "Engine Torque",
    Default = 3,
    Min = 1,
    Max = 10,
    Rounding = 1,
    Suffix = "x",
})

carPerformanceBox:AddSlider("RunawaysVehicleBrakeMultiplier", {
    Text = "Brake Power",
    Default = 2,
    Min = 1,
    Max = 10,
    Rounding = 1,
    Suffix = "x",
})

carPerformanceBox:AddSlider("RunawaysVehicleSteeringMultiplier", {
    Text = "High-Speed Steering",
    Default = 1.5,
    Min = 0.5,
    Max = 3,
    Rounding = 1,
    Suffix = "x",
})

carPerformanceBox:AddSlider("RunawaysVehicleDownforceMultiplier", {
    Text = "Downforce",
    Default = 1.5,
    Min = 0,
    Max = 5,
    Rounding = 1,
    Suffix = "x",
})

carPerformanceBox:AddToggle("RunawaysVehicleTireGripOverride", {
    Text = "Drift Mode",
    Default = false,
    Callback = function(value)
        if not value then
            restoreAllVehicleGrip()
        end
    end,
})

carPerformanceBox:AddSlider("RunawaysVehicleTireGrip", {
    Text = "Drift Grip",
    Default = 0.6,
    Min = 0.1,
    Max = 2,
    Rounding = 1,
})

carUtilityBox:AddLabel("Driving controls require the driver seat")

carUtilityBox:AddToggle("RunawaysVehicleInfiniteFuel", {
    Text = "Infinite Fuel",
    Default = false,
    Callback = function(value)
        if value then
            return
        end

        for vehicle in vehicleStates do
            library.VehicleMods:RestoreFuel(vehicle)
        end
    end,
})

carUtilityBox:AddToggle("RunawaysVehicleIndestructible", {
    Text = "Indestructible Vehicle",
    Default = false,
    Callback = blockVehicleDamage,
})

carUtilityBox:AddButton("Flip Vehicle", function()
    useCurrentVehicle(function(vehicle)
        local chassis = getVehicleChassis(vehicle)
        local seat = getVehicleSeat(vehicle)

        if chassis and seat then
            local forward = Vector3.new(seat.CFrame.LookVector.X, 0, seat.CFrame.LookVector.Z)

            if forward.Magnitude < 0.1 then
                forward = Vector3.new(-chassis.CFrame.RightVector.X, 0, -chassis.CFrame.RightVector.Z)
            end

            if forward.Magnitude < 0.1 then
                forward = Vector3.new(0, 0, -1)
            end

            forward = forward.Unit

            local position = seat.Position + Vector3.new(0, 3, 0)
            local target = CFrame.lookAt(position, position + forward, Vector3.yAxis)

            vehicle:PivotTo(target * seat.CFrame:Inverse() * vehicle:GetPivot())
            chassis.AssemblyLinearVelocity = Vector3.zero
            chassis.AssemblyAngularVelocity = Vector3.zero
        end
    end)
end)

carUtilityBox:AddButton("Stop Vehicle", function()
    useCurrentVehicle(function(vehicle)
        stopVehicle(vehicle)
    end)
end)

carUtilityBox:AddButton("Reset Vehicle Mods", function()
    for _, name in {
        "RunawaysVehiclePerformance",
        "RunawaysVehicleTireGripOverride",
        "RunawaysVehicleInfiniteFuel",
        "RunawaysVehicleAutoRefuel",
        "RunawaysVehicleIndestructible",
    } do
        if toggles[name] then
            toggles[name]:SetValue(false)
        end
    end

    for _, name in {
        "RunawaysVehicleTopSpeedMultiplier",
        "RunawaysVehicleAccelerationMultiplier",
        "RunawaysVehicleTorqueMultiplier",
        "RunawaysVehicleBrakeMultiplier",
        "RunawaysVehicleSteeringMultiplier",
        "RunawaysVehicleDownforceMultiplier",
        "RunawaysVehicleTireGrip",
    } do
        if options[name] then
            options[name]:SetValue(options[name].Default)
        end
    end

    restoreAllVehicles()
    notify("Vehicle mods reset.")
end)

weaponBox:AddLabel("Applies to the equipped firearm")

weaponBox:AddToggle("RunawaysWeaponInfiniteAmmo", {
    Text = "Infinite Ammo",
    Default = false,
})

weaponBox:AddToggle("RunawaysWeaponNoCooldown", {
    Text = "No Cooldown",
    Default = false,
})

weaponBox:AddToggle("RunawaysWeaponAutomatic", {
    Text = "Automatic Fire",
    Default = false,
})

weaponBox:AddToggle("RunawaysWeaponNoRecoil", {
    Text = "No Recoil",
    Default = false,
})

weaponBox:AddToggle("RunawaysWeaponNoSpread", {
    Text = "No Spread",
    Default = false,
})

weaponBox:AddToggle("RunawaysWeaponNoPushback", {
    Text = "No Weapon Pushback",
    Default = false,
})

weaponBox:AddButton("Reset Weapon Mods", function()
    for _, name in {
        "RunawaysWeaponInfiniteAmmo",
        "RunawaysWeaponNoCooldown",
        "RunawaysWeaponAutomatic",
        "RunawaysWeaponNoRecoil",
        "RunawaysWeaponNoSpread",
        "RunawaysWeaponNoPushback",
    } do
        if toggles[name] then
            toggles[name]:SetValue(false)
        end
    end

    restoreWeaponRuntime()
    restoreWeaponConfigs()
    notify("Weapon mods reset.")
end)

silentAimBox:AddLabel("Screen-centered FOV")

silentAimBox:AddToggle("RunawaysSilentAimEnabled", {
    Text = "Silent Aim",
    Default = false,
})

if not library.IsMobile then
    toggles.RunawaysSilentAimEnabled:AddKeyPicker("RunawaysSilentAimKeybind", {
        Default = "Q",
        SyncToggleState = true,
        Mode = "Toggle",
        Text = "Silent Aim Keybind",
    })
end

silentAimBox:AddToggle("RunawaysSilentAimShowFOV", {
    Text = "Show FOV",
    Default = true,
    Callback = function(value)
        if value and not drawingAvailable then
            notify("Drawing API is unavailable")
            task.defer(function()
                toggles.RunawaysSilentAimShowFOV:SetValue(false)
            end)
        end
    end,
}):AddColorPicker("RunawaysSilentAimFOVColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "FOV Color",
    Transparency = 0,
})

silentAimBox:AddSlider("RunawaysSilentAimFOVRadius", {
    Text = "FOV Radius",
    Default = 150,
    Min = 25,
    Max = 500,
    Rounding = 0,
    Suffix = " px",
})

silentAimBox:AddSlider("RunawaysSilentAimFOVThickness", {
    Text = "FOV Thickness",
    Default = 1,
    Min = 1,
    Max = 4,
    Rounding = 0,
})

silentAimBox:AddSlider("RunawaysSilentAimHitChance", {
    Text = "Hit Chance",
    Default = 100,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Suffix = "%",
})

silentAimBox:AddDropdown("RunawaysSilentAimTargetPart", {
    Values = { "Head", "HumanoidRootPart", "Closest Part" },
    Default = 1,
    Text = "Target Part",
})

silentAimBox:AddToggle("RunawaysSilentAimVisibleCheck", {
    Text = "Visible Check",
    Default = true,
})

espStyleBox:AddToggle("RunawaysESPEnabled", {
    Text = "ESP Enabled",
    Default = false,
    Callback = function(value)
        if value and not drawingAvailable then
            notify("Drawing API is unavailable")
            task.defer(function()
                toggles.RunawaysESPEnabled:SetValue(false)
            end)
        elseif not value then
            clearESP()
        end
    end,
}):AddKeyPicker("RunawaysESPKeybind", {
    Default = "P",
    SyncToggleState = true,
    Mode = "Toggle",
    Text = "ESP Keybind",
})

espStyleBox:AddSlider("RunawaysESPTextSize", {
    Text = "Text Size",
    Default = 13,
    Min = 10,
    Max = 24,
    Rounding = 0,
})

espStyleBox:AddDropdown("RunawaysESPFont", {
    Values = { "UI", "System", "Plex", "Monospace" },
    Default = 3,
    Text = "Font",
})

espStyleBox:AddToggle("RunawaysESPTextOutline", {
    Text = "Text Outline",
    Default = true,
}):AddColorPicker("RunawaysESPOutlineColor", {
    Default = Color3.new(0, 0, 0),
    Title = "Outline Color",
    Transparency = 0,
})

espStyleBox:AddSlider("RunawaysESPBoxThickness", {
    Text = "Line Thickness",
    Default = 1,
    Min = 1,
    Max = 3,
    Rounding = 0,
})

espStyleBox:AddDropdown("RunawaysESPTracerOrigin", {
    Values = { "Bottom", "Center", "Mouse" },
    Default = 1,
    Text = "Tracer Origin",
})

espItemBox:AddToggle("RunawaysESPItems", {
    Text = "Item ESP",
    Default = true,
}):AddColorPicker("RunawaysESPItemColor", {
    Default = Color3.fromRGB(255, 210, 90),
    Title = "Item Color",
    Transparency = 0,
})

espItemBox:AddToggle("RunawaysESPItemName", {
    Text = "Show Name",
    Default = true,
})

espItemBox:AddToggle("RunawaysESPItemCategory", {
    Text = "Show Category",
    Default = true,
})

espItemBox:AddToggle("RunawaysESPItemPrice", {
    Text = "Show Price",
    Default = true,
})

espItemBox:AddToggle("RunawaysESPItemDistance", {
    Text = "Show Distance",
    Default = true,
})

espItemBox:AddToggle("RunawaysESPItemBox", {
    Text = "Boxes",
    Default = false,
})

espItemBox:AddToggle("RunawaysESPItemTracer", {
    Text = "Tracers",
    Default = false,
})

espItemBox:AddToggle("RunawaysESPItemHighValue", {
    Text = "High Value Color",
    Default = false,
}):AddColorPicker("RunawaysESPItemHighValueColor", {
    Default = Color3.fromRGB(80, 255, 130),
    Title = "High Value Color",
    Transparency = 0,
})

espItemBox:AddSlider("RunawaysESPItemHighValueThreshold", {
    Text = "High Value Threshold",
    Default = math.floor(maxLootValue * 0.6),
    Min = 0,
    Max = math.max(1, math.ceil(maxLootValue)),
    Rounding = 0,
    Prefix = "$",
})

espItemBox:AddSlider("RunawaysESPItemMinValue", {
    Text = "Minimum Value",
    Default = 0,
    Min = 0,
    Max = math.max(1, math.ceil(maxLootValue)),
    Rounding = 0,
    Prefix = "$",
})

espItemBox:AddDropdown("RunawaysESPItemCategories", {
    Values = dropCategories,
    Default = dropCategories,
    Multi = true,
    Text = "Categories",
    Searchable = true,
    MaxVisibleDropdownItems = 12,
    FormatDisplayValue = formatName,
    FormatListValue = formatName,
})

espItemBox:AddSlider("RunawaysESPItemMaxDistance", {
    Text = "Maximum Distance",
    Default = 1500,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Suffix = " studs",
})

espItemBox:AddSlider("RunawaysESPMaxItems", {
    Text = "Maximum Items",
    Default = 100,
    Min = 25,
    Max = 250,
    Rounding = 0,
})

espPlayerBox:AddToggle("RunawaysESPPlayers", {
    Text = "Player ESP",
    Default = true,
}):AddColorPicker("RunawaysESPPlayerColor", {
    Default = Color3.fromRGB(75, 210, 255),
    Title = "Player Color",
    Transparency = 0,
})

espPlayerBox:AddToggle("RunawaysESPPlayerName", {
    Text = "Show Name",
    Default = true,
})

espPlayerBox:AddToggle("RunawaysESPPlayerHealth", {
    Text = "Show Health",
    Default = true,
})

espPlayerBox:AddToggle("RunawaysESPPlayerDistance", {
    Text = "Show Distance",
    Default = true,
})

espPlayerBox:AddToggle("RunawaysESPPlayerBox", {
    Text = "Boxes",
    Default = true,
})

espPlayerBox:AddToggle("RunawaysESPPlayerHealthBar", {
    Text = "Health Bars",
    Default = true,
})

espPlayerBox:AddToggle("RunawaysESPPlayerTracer", {
    Text = "Tracers",
    Default = false,
})

espPlayerBox:AddSlider("RunawaysESPPlayerMaxDistance", {
    Text = "Maximum Distance",
    Default = 2500,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Suffix = " studs",
})

espNPCBox:AddToggle("RunawaysESPNPCs", {
    Text = "NPC ESP",
    Default = true,
}):AddColorPicker("RunawaysESPNPCColor", {
    Default = Color3.fromRGB(255, 90, 90),
    Title = "NPC Color",
    Transparency = 0,
})

espNPCBox:AddToggle("RunawaysESPNPCName", {
    Text = "Show Name",
    Default = true,
})

espNPCBox:AddToggle("RunawaysESPNPCHealth", {
    Text = "Show Health",
    Default = true,
})

espNPCBox:AddToggle("RunawaysESPNPCDistance", {
    Text = "Show Distance",
    Default = true,
})

espNPCBox:AddToggle("RunawaysESPNPCBox", {
    Text = "Boxes",
    Default = true,
})

espNPCBox:AddToggle("RunawaysESPNPCHealthBar", {
    Text = "Health Bars",
    Default = true,
})

espNPCBox:AddToggle("RunawaysESPNPCTracer", {
    Text = "Tracers",
    Default = false,
})

espNPCBox:AddToggle("RunawaysESPNPCActiveOnly", {
    Text = "Active NPCs Only",
    Default = false,
})

espNPCBox:AddSlider("RunawaysESPNPCMaxDistance", {
    Text = "Maximum Distance",
    Default = 2000,
    Min = 100,
    Max = 5000,
    Rounding = 0,
    Suffix = " studs",
})

espWorldBox:AddToggle("RunawaysESPVehicles", {
    Text = "Vehicle ESP",
    Default = true,
}):AddColorPicker("RunawaysESPVehicleColor", {
    Default = Color3.fromRGB(180, 110, 255),
    Title = "Vehicle Color",
    Transparency = 0,
})

espWorldBox:AddToggle("RunawaysESPVehicleName", {
    Text = "Vehicle Name",
    Default = true,
})

espWorldBox:AddToggle("RunawaysESPVehicleHealth", {
    Text = "Vehicle Health",
    Default = true,
})

espWorldBox:AddToggle("RunawaysESPVehicleDistance", {
    Text = "Vehicle Distance",
    Default = true,
})

espWorldBox:AddToggle("RunawaysESPVehicleBox", {
    Text = "Vehicle Boxes",
    Default = true,
})

espWorldBox:AddToggle("RunawaysESPVehicleTracer", {
    Text = "Vehicle Tracers",
    Default = false,
})

espWorldBox:AddSlider("RunawaysESPVehicleMaxDistance", {
    Text = "Vehicle Distance Limit",
    Default = 5000,
    Min = 100,
    Max = 10000,
    Rounding = 0,
    Suffix = " studs",
})

espWorldBox:AddDivider()

espWorldBox:AddToggle("RunawaysESPSafes", {
    Text = "Safe ESP",
    Default = true,
}):AddColorPicker("RunawaysESPSafeColor", {
    Default = Color3.fromRGB(255, 170, 60),
    Title = "Safe Color",
    Transparency = 0,
})

espWorldBox:AddToggle("RunawaysESPSafeName", {
    Text = "Safe Name",
    Default = true,
})

espWorldBox:AddToggle("RunawaysESPSafeDistance", {
    Text = "Safe Distance",
    Default = true,
})

espWorldBox:AddToggle("RunawaysESPSafeBox", {
    Text = "Safe Boxes",
    Default = true,
})

espWorldBox:AddToggle("RunawaysESPSafeTracer", {
    Text = "Safe Tracers",
    Default = false,
})

espWorldBox:AddSlider("RunawaysESPSafeMaxDistance", {
    Text = "Safe Distance Limit",
    Default = 5000,
    Min = 100,
    Max = 10000,
    Rounding = 0,
    Suffix = " studs",
})

punchMods.Box:AddLabel("Unarmed punches and melee weapons")

punchMods.Box:AddToggle("RunawaysPunchMods", {
    Text = "Melee Mods",
    Default = false,
    Callback = function(value)
        if value then
            punchMods:Apply(true)
        else
            punchMods:Restore()
        end
    end,
})

punchMods.Box:AddToggle("RunawaysPunchNoCooldown", {
    Text = "No Melee Cooldown",
    Default = false,
    Callback = function()
        punchMods:Apply(true)
    end,
})

punchMods.Box:AddSlider("RunawaysPunchDamage", {
    Text = "Melee Damage",
    Default = punchMods.Defaults.Damage,
    Min = 1,
    Max = 500,
    Rounding = 0,
    Callback = function()
        punchMods:Apply(true)
    end,
})

punchMods.Box:AddSlider("RunawaysPunchSpeed", {
    Text = "Melee Speed",
    Default = punchMods.Defaults.Speed,
    Min = 1,
    Max = 30,
    Rounding = 1,
    Suffix = " hits/s",
    Callback = function()
        punchMods:Apply(true)
    end,
})

punchMods.Box:AddSlider("RunawaysPunchObjectDamage", {
    Text = "Object Damage",
    Default = punchMods.Defaults.ObjectDamage,
    Min = 1,
    Max = 500,
    Rounding = 0,
    Callback = function()
        punchMods:Apply(true)
    end,
})

punchMods.Box:AddButton("Reset Melee Mods", function()
    for _, name in { "RunawaysPunchMods", "RunawaysPunchNoCooldown" } do
        if toggles[name] then
            toggles[name]:SetValue(false)
        end
    end

    for _, name in { "RunawaysPunchDamage", "RunawaysPunchSpeed", "RunawaysPunchObjectDamage" } do
        if options[name] then
            options[name]:SetValue(options[name].Default)
        end
    end

    punchMods:Restore()
    notify("Melee mods reset.")
end)

movementBox:AddToggle("RunawaysPlayerGodMode", {
    Text = "God Mode",
    Default = false,
    Callback = function(value)
        if not value then
            restoreGodMode()
        end
    end,
})

movementBox:AddToggle("RunawaysPlayerSpeedBoost", {
    Text = "Speed Boost",
    Default = false,
    Callback = function(value)
        if not value then
            restoreSpeed()
        end
    end,
})

movementBox:AddSlider("RunawaysPlayerWalkSpeed", {
    Text = "Walk Speed",
    Default = 30,
    Min = 15,
    Max = 100,
    Rounding = 0,
})

movementBox:AddToggle("RunawaysPlayerJumpPowerOverride", {
    Text = "Jump Power Override",
    Default = false,
    Callback = function(value)
        if not value then
            restoreJumpPower()
        end
    end,
})

movementBox:AddSlider("RunawaysPlayerJumpPower", {
    Text = "Jump Power",
    Default = 60,
    Min = 25,
    Max = 150,
    Rounding = 0,
})

movementBox:AddToggle("RunawaysPlayerInfiniteJump", {
    Text = "Infinite Jump",
    Default = false,
})

movementBox:AddToggle("RunawaysPlayerNoclip", {
    Text = "Noclip",
    Default = false,
    Callback = function(value)
        if not value then
            restoreCollisions()
        end
    end,
})

movementBox:AddToggle("RunawaysPlayerAntiAFK", {
    Text = "Anti AFK",
    Default = true,
    Callback = function(value)
        if library.RunawaysAntiAFKConnection then
            library.RunawaysAntiAFKConnection:Disconnect()
            library.RunawaysAntiAFKConnection = nil
        end

        if not value then
            return
        end

        local virtualUser = game:GetService("VirtualUser")

        library.RunawaysAntiAFKConnection = player.Idled:Connect(function()
            pcall(function()
                virtualUser:CaptureController()
                virtualUser:ClickButton2(Vector2.zero)
            end)
        end)
    end,
})

worldBox:AddToggle("RunawaysPlayerFOVOverride", {
    Text = "FOV Override",
    Default = false,
    Callback = function(value)
        if not value then
            restoreFOV()
        end
    end,
})

worldBox:AddSlider("RunawaysPlayerFieldOfView", {
    Text = "Field of View",
    Default = math.round(workspace.CurrentCamera and workspace.CurrentCamera.FieldOfView or 70),
    Min = 30,
    Max = 120,
    Rounding = 0,
})

worldBox:AddToggle("RunawaysPlayerGravityOverride", {
    Text = "Gravity Override",
    Default = false,
    Callback = function(value)
        if not value then
            restoreGravity()
        end
    end,
})

worldBox:AddSlider("RunawaysPlayerGravity", {
    Text = "Gravity",
    Default = math.round(workspace.Gravity),
    Min = 0,
    Max = 300,
    Rounding = 0,
})

installWeaponHooks()
instantPrompt.Connection = instantPrompt.Service.PromptShown:Connect(function(prompt)
    if instantPrompt.Active then
        instantPrompt:Set(prompt)
    end
end)
instantPrompt.AddedConnection = workspace.DescendantAdded:Connect(function(instance)
    if instantPrompt.Active and instance:IsA("ProximityPrompt") then
        instantPrompt:Set(instance)
    end
end)
playerStepConnection = RunService.PreSimulation:Connect(function()
    applyPlayerSettings()
    punchMods:Apply()
end)
weaponStepConnection = RunService.PreSimulation:Connect(applyWeaponSettings)
infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
    if not toggles.RunawaysPlayerInfiniteJump or not toggles.RunawaysPlayerInfiniteJump.Value then
        return
    end

    local humanoid = getHumanoid()

    if humanoid and humanoid.Health > 0 then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

pcall(function()
    RunService:UnbindFromRenderStep(fovRenderName)
end)
RunService:BindToRenderStep(fovRenderName, Enum.RenderPriority.Camera.Value + 2, function()
    if not toggles.RunawaysPlayerFOVOverride or not toggles.RunawaysPlayerFOVOverride.Value then
        return
    end

    local camera = workspace.CurrentCamera

    if not camera then
        return
    end

    if cameraStates[camera] == nil then
        cameraStates[camera] = camera.FieldOfView
    end

    camera.FieldOfView = options.RunawaysPlayerFieldOfView.Value
end)

pcall(function()
    RunService:UnbindFromRenderStep(silentAimRenderName)
end)
RunService:BindToRenderStep(silentAimRenderName, Enum.RenderPriority.Camera.Value + 11, updateSilentAimCircle)

pcall(function()
    RunService:UnbindFromRenderStep(espRenderName)
end)
RunService:BindToRenderStep(espRenderName, Enum.RenderPriority.Camera.Value + 10, updateESP)

espScanToken = {}
task.spawn(function()
    local token = espScanToken

    while espScanToken == token and not library.Unloaded do
        scanESP()
        task.wait(0.5)
    end
end)

menuBox:AddLabel("Menu key"):AddKeyPicker("MenuKeybind", {
    Default = "RightShift",
    NoUI = true,
    Text = "Menu key",
})

menuBox:AddButton("Unload", function()
    library:Unload()
end)

library.ToggleKeybind = options.MenuKeybind

library:OnUnload(function()
    library.AutoFarm:Destroy(env.RunawaysScriptReloading == true or library.AutoFarm.Teleporting)
    bringItems:Destroy()
    remoteShop:Destroy()
    library.LobbyShop:Destroy()
    lootAuraLoop = nil
    killLoop = nil
    library.Rage.KillAuraLoop = nil
    espScanToken = nil

    if playerStepConnection then
        playerStepConnection:Disconnect()
        playerStepConnection = nil
    end

    if infiniteJumpConnection then
        infiniteJumpConnection:Disconnect()
        infiniteJumpConnection = nil
    end

    if library.RunawaysAntiAFKConnection then
        library.RunawaysAntiAFKConnection:Disconnect()
        library.RunawaysAntiAFKConnection = nil
    end

    if weaponStepConnection then
        weaponStepConnection:Disconnect()
        weaponStepConnection = nil
    end

    if instantPrompt.Connection then
        instantPrompt.Connection:Disconnect()
        instantPrompt.Connection = nil
    end

    if instantPrompt.AddedConnection then
        instantPrompt.AddedConnection:Disconnect()
        instantPrompt.AddedConnection = nil
    end

    RunService:UnbindFromRenderStep(fovRenderName)
    RunService:UnbindFromRenderStep(silentAimRenderName)
    RunService:UnbindFromRenderStep(espRenderName)
    clearSilentAim()
    clearESP()
    restoreWeaponRuntime()
    restoreWeaponConfigs()
    restoreWeaponHooks()
    punchMods:Restore()
    teleports:Destroy()
    instantPrompt:Restore()
    restoreSpeed()
    restoreJumpPower()
    restoreCollisions()
    restoreFOV()
    restoreGravity()
    restoreGodMode()
    restoreAllVehicles()
    blockVehicleDamage(false)

    if env.AutoLoot == library then
        env.AutoLoot = nil
    end
end)

task.spawn(function()
    while not library.Unloaded do
        task.wait(1)

        if not library.Unloaded then
            if not busy then
                bringItems:Refresh()
            end

            teleports:Refresh()
            remoteShop:Refresh()
            library.LobbyShop:Refresh()
            library.AutoFarm:UpdateUI()

            if library.AutoFarm.Running
                and library.AutoFarm:GetContext() == "Game"
                and os.clock() - library.AutoFarm.LastPersistAt >= 10
            then
                library.AutoFarm:Persist()
            end
        end
    end
end)

ThemeManager:SetLibrary(library)
SaveManager:SetLibrary(library)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind", "RunawaysAutoFarm", "RunawaysAutoFarmWebhookURL" })

ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/RUNAWAYS")
SaveManager:SetSubFolder(tostring(game.PlaceId))

SaveManager:BuildConfigSection(tabs.Settings)
ThemeManager:ApplyToTab(tabs.Settings)

teleports:Refresh(true)
bringItems:Refresh(true)
remoteShop:Refresh(true)
library.LobbyShop:Refresh(true)
SaveManager:LoadAutoloadConfig()
bringItems:Refresh(true)
remoteShop:Refresh(true)
library.LobbyShop:Refresh(true)
library.AutoFarm:LoadState()
library.AutoFarm:ApplyStoredOptions()
library.AutoFarm.StateReady = true
library.AutoFarm:UpdateUI()

if library.AutoFarm.ResumeRequested then
    task.defer(function()
        if toggles.RunawaysAutoFarm and not toggles.RunawaysAutoFarm.Value then
            toggles.RunawaysAutoFarm:SetValue(true)
        else
            library.AutoFarm:Start()
        end
    end)
else
    library.AutoFarm:Persist()
end

if env.RunawaysScriptLoading == coroutine.running() then
    if env.RunawaysScriptLoadingToken ~= "" then
        env.RunawaysScriptLoadedTransition = env.RunawaysScriptLoadingToken
    end

    env.RunawaysScriptLoading = nil
    env.RunawaysScriptLoadingAt = nil
    env.RunawaysScriptLoadingToken = nil
end

return library
