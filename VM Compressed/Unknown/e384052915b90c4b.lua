--NU-FWQ
--[[
Integrated ESP LocalScript with Rayfield UI, Role Detection, Distance Locking,
Enhanced Hint Matching, CUSTOMIZABLE NAMETAGS, and Aimbot.
UPDATED: Modified bullet redirection to support multiple target selection:
- Removed "All" option
- Added multi-select dropdown for Killer, Vigilante, and Innocent
- Innocent targets are players without guns or unregistered guns
- Role Detection is now always active.
- ESP is now a visual layer that reads from the Role Detection data.
]]
-- Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
-- Create the window
local Window = Rayfield:CreateWindow({
    Name = "Blood Debt Role Detector",
    Icon = 0,
    LoadingTitle = "Rayfield Role Detector",
    LoadingSubtitle = "by Sirius",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    }
})
-- Create the tab
local Tab = Window:CreateTab("Players", "rewind")
-- NEW: Nametag display mode variable
local nametagMode = "Role" -- Options: "Role", "Username", "Character Name"
-- Weapon lists
local killerWeapons = {
    ["CharcoalSteel JS-22"] = true,
    ["Pretty Pink RR-LCP"] = true,
    ["JS2-BondsDerringy"] = true,
    ["GILDED"] = true,
    ["Kamatov"] = true,
    ["JS2-Derringy"] = true,
    ["JS-22"] = true,
    ["RR-LightCompactPistolS"] = true,
    ["J9-Mereta"] = true,
    ["RY's GG-17"] = true,
    ["RR-LCP"] = true,
    ["Door'bler"] = true,
    ["JS1-Competitor"] = true,
    ["AT's KAR15"] = true,
    ["VK's ANKM"] = true,
    ["Clothed Sawn-off"] = true,
    ["Sawn-off"] = true,
    ["Clothed Rosen-Obrez"] = true,
    ["Rosen-Obrez"] = true,
    ["GraySteel K1911"] = true,
    ["DarkSteel K1911"] = true,
    ["SilverSteel K1911"] = true,
    ["K1911"] = true,
    ["ZZ-90"] = true,
    ["SKORPION"] = true,
    ["Mares Leg"] = true,
    ["RR-LightCompactPistol"] = true,
    ["KamatovS"] = true,
    ["ChromeSlide Turqoise RR-LCP"] = true,
    ["JS1-CYCLOPS"] = true,
    ["THUMPA"] = true,
    ["LUT-E 'KRUS'"] = true,
    ["Memories"] = true,
    ["Hammer n Bullet"] = true,
    ["JS-22GILDED"] = true,
    ["Sawn-offGILDED"] = true,
    ["Door'bler TIGERSTRIPES"] = true,
    ["Anatoly's JS-22"] = true,
    ["PLASTIC JS-22"] = true,
    ["JTS225-OBREZ"] = true,
    ["HEARDBALLA"] = true,
    ["Whiteout Rosen-Obrez"] = true,
    ["Whiteout RR-LCP"] = true,
    ["JTS225-Obrez Monochrome"] = true,
    ["JTS225-Obrez"] = true,
    ["Sawn-off10"] = true,
    ["Nikolai's 'Dented'"] = true,
    ["JS-44"] = true,
    ["BandagePack"] = true,
    ["JTS225-Obrez Poly"] = true,
    ["Mares Leg10"] = true,
    ["RR-LCP10"] = true,
    ["JTS225-Obrez Partycannon"] = true,
    ["Bandages"] = true,
    ["corrodedmetal JS-22"] = true,
    ["CharcoalSteel JS-44"] = true,
    ["SKORPION10"] = true,
    ["Meretta486Palubu Sawn-Off"] = true,
    ["KamatovDRUM"] = true,
    ["Micro KZI"] = true,
    ["Whiteout RR-LightCompactPistolS"] = true,
    ["Clothed SKORPION"] = true,
    ["CharcoalSteel SKORPION"] = true,
    ["Charcoal Steel SKORPION"] = true,
    ["Katya's 'Memories'"] = true,
    ["Dual SKORPS"] = true,
    ["HWISSH-KP9"] = true,
    ["JS2-DerringyGILDED"] = true,
    ["K1911GILDED"] = true,
    ["Mandols-5"] = true,
    ["RDG-2B"] = true,
    ["Testament"] = true,
    ["Jolibri"] = true,
    ["JAVELIN-OBREZS"] = true,
    ["GZhG-7.62"] = true,
    ["AGM22"] = true,
    ["RR-Mark2"] = true,
    ["Dual LCPs"] = true,
    ["RR-LightCompactPistolS10"] = true,
    ["Wild Mandols-5"] = true,
    ["AK47 Case Hardened 1000000"] = true,
    ["Kensington20"] = true,
    ["Kensington"] = true,
    ["ZOZ-106"] = true,
    ["Whizz"] = true,
    ["Rosen Nagan"] = true,
    ["WISP"] = true,
    ["WISP Pearl"] = true,
    ["MAK-1020"] = true,
    ["SKORPION 'AMIRNOV"] = true,
    ["PTRB-41"] = true,
    ["Memorial"] = true,
    ["Mooser"] = true,
    ["VA's ANKM"] = true,
    ["HW-K7"] = true,
    ["TG's JAVELIN-ZVD"] = true,
    ["KR7S"] = true,
    ["RUZKH-12"] = true,
    ["TEKE-9"] = true,
    ["TG's JTS225"] = true,
    ["Mason's Machete"] = true,
    ["Pretty Pink RVK"] = true,
    ["Comically Large Spoon"] = true,
    ["Skeleton Rosen-Obrez"] = true,
    ["Berf-JOLT"] = true,
    ["1895-Rosey"] = true,
    ["K1911 'Memorial'"] = true,
    ["APZ"] = true,
    ["Door'bler"] = true,
    ["JTS225-ObrezGILDED"] = true,
    ["Casaro 91"] = true,
}
local vigilanteWeapons = {
    ["Beagle"] = true,
    ["Beagle TIGERSTRIPES"] = true,
    ["Paradise Beagle"] = true,
    ["IZVEKH-412"] = true,
    ["SilverSteel RR-Snubby"] = true,
    ["RR-Snubby"] = true,
    ["ZKZ-Obrez"] = true,
    ["GG-17"] = true,
    ["J9-M"] = true,
    ["J9-Meretta"] = true,
    ["Pretty Pink GG-17"] = true,
    ["GG-17 TAN"] = true,
    ["GG-17GILDED"] = true,
    ["RR-SnubbyGILDED"] = true,
    ["HWISSH-226"] = true,
    ["ZKZ-Obrez10"] = true,
    ["Buxxberg-COMPACT"] = true,
    ["Pretty Pink Buxxberg-COMPACT"] = true,
    ["JS-5A-Obrez"] = true,
    ["Dual Elites"] = true,
    ["RR-Snubby10"] = true,
    ["DRICO"] = true,
    ["HW-M5K"] = true,
    ["CharcoalSteel I412"] = true,
    ["GG-1720"] = true,
    ["Dual GG-17s"] = true,
    ["Dual GG 17s"] = true,
    ["Mini Ranch Rifle"] = true,
    ["Clothed ZKZ-Obrez"] = true,
    ["Case Hardened DRICO"] = true,
}
local specialKillerWeapons = {
    ["RY's GG-17"] = true,
    ["AT's KAR15"] = true,
    ["VK's ANKM"] = true,
    ["VA's ANKM"] = true,
    ["RVK"] = true,
    ["GZhG-7.62"] = true,
    ["AK47 Case Hardened 1000000"] = true,
    ["TG's JAVELIN-ZVD"] = true,
    ["Mason's Machete"] = true,
    ["Pretty Pink RVK"] = true,
}
local specificJuggernautWeapons = {
    ["AK47 Case Hardened 1000000"] = true,
    ["RVK"] = true,
    ["Pretty Pink RVK"] = true,
}
local allRoleWeapons = {}
for name, _ in pairs(killerWeapons) do allRoleWeapons[name] = true end
for name, _ in pairs(vigilanteWeapons) do allRoleWeapons[name] = true end
-- Define Role Colors and Labels
local killerColor = Color3.fromRGB(255, 0, 0)
local killerLabel = "KILLER"
local innocentColor = Color3.fromRGB(0, 255, 0)
local innocentLabel = "INNOCENT"
local vigilanteColor = Color3.fromRGB(0, 255, 255)
local vigilanteLabel = "VIGILANTE"
local hintMatchColor = Color3.new(1, 1, 0)
local hintMatchLabel = "HINT MATCH"
local vigilanteHintColor = Color3.fromRGB(128, 0, 128)
local vigilanteHintLabel = "VIGILANTE + HINT MATCH"
local killerHintColor = Color3.fromRGB(255, 165, 0)
local killerHintLabel = "KILLER + HINT MATCH"
local distanceThreshold = 30
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local NPCSFolder = Workspace:WaitForChild("NPCSFolder")
local BloodFolder = Workspace:WaitForChild("BloodFolder")
local Camera = Workspace.CurrentCamera
-- State variables
local espEnabled = false
local stopEspLoop = false
local espPlayerAddedConnection = nil
local espCharacterAddedConnections = {}
local rolesLockedByDistance = false
local lockedDistanceRoles = {}
local playersMatchingHints = {}
local hintTextConnection = nil
local firstVigilanteTracker = {}
local playersWithStandardKillerWeapons = {}
local droppedGunConnections = {}
-- NEW: Central data store for player roles. This is always updated.
local playerRoles = {}
-- NEW: Aimbot targeting modes (can select multiple)
local bulletRedirectionModes = {"Killer"} -- Default to Killer only
-- NEW: Function to get character name from NPCSFolder
local function getCharacterName(player)
    if NPCSFolder then
        local playerNPCModel = NPCSFolder:FindFirstChild(player.Name)
        if playerNPCModel then
            -- Try multiple possible locations for the character name
            
            -- Check for a StringValue named "CharacterName" or similar
            local charNameValue = playerNPCModel:FindFirstChild("CharacterName") 
                or playerNPCModel:FindFirstChild("NPCName")
                or playerNPCModel:FindFirstChild("Name")
            
            if charNameValue and charNameValue:IsA("StringValue") then
                return charNameValue.Value
            end
            
            -- Check in Configuration folder
            local configObject = playerNPCModel:FindFirstChild("Configuration")
            if configObject then
                local nameInConfig = configObject:FindFirstChild("CharacterName")
                    or configObject:FindFirstChild("NPCName")
                    or configObject:FindFirstChild("Name")
                
                if nameInConfig and nameInConfig:IsA("StringValue") then
                    return nameInConfig.Value
                end
            end
            
            -- Check for Humanoid's DisplayName
            local humanoid = playerNPCModel:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.DisplayName ~= player.Name then
                return humanoid.DisplayName
            end
        end
    end
    return player.Name -- Fallback to username if not found
end
-- UPDATED: Add floating name tag with customizable text
local function addNameTag(character, text, color, player)
    local head = character:FindFirstChild("Head")
    if not head then return end

    local oldTag = head:FindFirstChild("RoleBillboard")
    if oldTag then oldTag:Destroy() end

    -- Determine what text to display based on nametagMode
    local displayText = text
    if nametagMode == "Username" then
        displayText = player.Name
    elseif nametagMode == "Character Name" then
        displayText = getCharacterName(player)
    end
    -- If nametagMode == "Role", displayText remains as the passed 'text' parameter

    local bb = Instance.new("BillboardGui")
    bb.Name = "RoleBillboard"
    bb.Size = UDim2.new(0, 100, 0, 20)
    bb.StudsOffset = Vector3.new(0, 2.5, 0)
    bb.Adornee = head
    bb.AlwaysOnTop = true
    bb.Parent = head

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = displayText
    label.TextColor3 = color
    label.TextStrokeTransparency = 0.2
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold
    label.Parent = bb
end
-- Clear previous overlays
local function clearOldStuff(character)
    if not character then return end

    local oldHighlight = character:FindFirstChild("RoleHighlight")
    if oldHighlight and oldHighlight:IsA("Highlight") then
        oldHighlight:Destroy()
    end

    local head = character:FindFirstChild("Head")
    if head then
        local tag = head:FindFirstChild("RoleBillboard")
        if tag then tag:Destroy() end
    end
end

local function clearDroppedGunEsp(gunTool)
    if not gunTool then return end
    local old = gunTool:FindFirstChildWhichIsA("Highlight")
    if old then old:Destroy() end
end

local function addDroppedGunEsp(gunTool)
    if not gunTool or not gunTool:IsA("Tool") then return end

    clearDroppedGunEsp(gunTool)

    local highlight = Instance.new("Highlight")
    highlight.Name = "DroppedGunHighlight"
    highlight.Adornee = gunTool                     -- ← Highlights the WHOLE gun (all parts + welds)
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = true
    highlight.FillColor = Color3.fromRGB(255, 255, 0)       -- Bright yellow
    highlight.FillTransparency = 0.4
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)  -- White outline
    highlight.OutlineTransparency = 0
    highlight.Parent = gunTool                       -- Parent to the Tool itself
end

local function updateDroppedGunEsp()
    if not espEnabled or not BloodFolder then return end

    for _, obj in ipairs(BloodFolder:GetChildren()) do
        if obj:IsA("Tool") then
            local weaponName = obj.Name
            if killerWeapons[weaponName] or vigilanteWeapons[weaponName] or specialKillerWeapons[weaponName] then
                addDroppedGunEsp(obj)

                -- Track removal in case it's picked up
                if not droppedGunConnections[obj] then
                    droppedGunConnections[obj] = obj.AncestryChanged:Connect(function()
                        if not obj.Parent then
                            clearDroppedGunEsp(obj)
                            droppedGunConnections[obj]:Disconnect()
                            droppedGunConnections[obj] = nil
                        end
                    end)
                end
            end
        end
    end
end

-- Clear all dropped gun ESP when disabling
local function clearAllDroppedGunEsp()
    if BloodFolder then
        for _, obj in BloodFolder:GetChildren() do
            if obj:IsA("Tool") then
                clearDroppedGunEsp(obj)
            end
        end
    end
    for tool, conn in pairs(droppedGunConnections) do
        if conn and conn.Connected then conn:Disconnect() end
        droppedGunConnections[tool] = nil
    end
end
-- UPDATED: Tag player by role (now passes player object for nametag customization)
local function tagPlayer(player, roleColor, labelText)
    if not player.Character then return end
    clearOldStuff(player.Character)

    local highlight = Instance.new("Highlight", player.Character)
    highlight.Name = "RoleHighlight"
    highlight.Archivable = true
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = true
    highlight.FillColor = roleColor
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0

    if labelText then
        addNameTag(player.Character, labelText, roleColor, player)
    end
end
-- Helper function to collect a player's tools
local function collectPlayerTools(player)
    local tools = {}
    local backpack = player:FindFirstChildOfClass("Backpack")
    if backpack then
        for _, tool in ipairs(backpack:GetChildren()) do
            if tool:IsA("Tool") then
                tools[tool.Name] = tool
            end
        end
    end
    if player.Character then
        for _, tool in ipairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") then
                tools[tool.Name] = tool
            end
        end
    end

    if NPCSFolder then
        local playerNPCModel = NPCSFolder:FindFirstChild(player.Name)
        if playerNPCModel then
            for _, child in ipairs(playerNPCModel:GetChildren()) do
                if child:IsA("Tool") then
                    tools[child.Name] = child
                end
            end
        end
    end

    return tools
end
-- Helper function to get standard role based on weapons
local function getStandardRoleFromWeapons(toolsByName)
    local role = nil
    local color = nil
    local label = nil

    for weaponName, _ in pairs(killerWeapons) do
        if not specialKillerWeapons[weaponName] and toolsByName[weaponName] then
            role = "Killer"
            color = killerColor
            label = killerLabel
            return role, color, label
        end
    end

    for weaponName, _ in pairs(vigilanteWeapons) do
        if toolsByName[weaponName] then
            role = "Vigilante"
            color = vigilanteColor
            label = vigilanteLabel
            return role, color, label
        end
    end

    return nil, nil, nil
end
-- Function to parse a single string of hint content
local function parseSingleHint(hintContent)
    local hintType = "invalid"
    local hintValue = nil
    local cleanedContent = hintContent:match("^%s*(.-)%s*$") or ""

    if string.len(cleanedContent) == 0 then
        return hintType, hintValue
    end

    local taskMatch = cleanedContent:match("^Is often seen%s*(.*)$")
    if taskMatch then
        hintType = "task"
        hintValue = taskMatch:match("^%s*(.-)%s*$")
        return hintType, hintValue
    end

    local traitBracketMatch = cleanedContent:match("^%[.-%]$")
    if traitBracketMatch then
        local cleanClue = traitBracketMatch:gsub("[%[%]]", ""):match("^%s*(.-)%s*$") or ""
        if string.len(cleanClue) > 0 and cleanClue:lower() ~= "assigned task" and cleanClue:lower() ~= "seen" then
            hintType = "trait"
            hintValue = cleanClue
            return hintType, hintValue
        end
    end

    if hintType == "invalid" then
        hintType = "trait"
        hintValue = cleanedContent
    end

    return hintType, hintValue
end
-- Function to update the playersMatchingHints table
local function updateMatchingHintPlayers()
    playersMatchingHints = {}

    local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
    if not PlayerGui then return end

    local TargetHintLabel = PlayerGui:FindFirstChild("RESETONDEATHStatusGui") and PlayerGui.RESETONDEATHStatusGui:FindFirstChild("TARGETHINT")

    if not TargetHintLabel or not TargetHintLabel:IsA("TextLabel") then
        return
    end

    local hintText = TargetHintLabel.Text

    if string.len(string.gsub(hintText, "%s", "")) == 0 then
        return
    end

    local hintPrefix = "Hints : "
    local lowerHintText = string.lower(hintText)
    local lowerHintPrefix = string.lower(hintPrefix)

    if lowerHintText:sub(1, string.len(lowerHintPrefix)) ~= lowerHintPrefix then
        return
    end

    local actualHintContent = hintText:sub(string.len(hintPrefix) + 1):match("^%s*(.-)%s*$")

    local individualHintParts = {}
    local currentPos = 1
    while currentPos <= string.len(actualHintContent) do
        local nextPlus = string.find(actualHintContent, " + ", currentPos, true)
        if nextPlus then
            local hintPart = string.sub(actualHintContent, currentPos, nextPlus - 1)
            table.insert(individualHintParts, hintPart)
            currentPos = nextPlus + string.len(" + ")
        else
            local hintPart = string.sub(actualHintContent, currentPos)
            table.insert(individualHintParts, hintPart)
            currentPos = string.len(actualHintContent) + 1
        end
    end

    if #individualHintParts == 0 and string.len(actualHintContent) > 0 then
        table.insert(individualHintParts, actualHintContent)
    end

    local targetConditions = {}

    for i, hintPartContent in ipairs(individualHintParts) do
        local targetNumberMatch = hintPartContent:match("^%[%s*(%d+)%s*%]")
        local targetNumber = tonumber(targetNumberMatch) or 1
        local cleanedHintPartContent = hintPartContent:gsub("^%[%s*%d+%s*%]%s*", ""):match("^%s*(.-)%s*$") or ""

        local hintType, hintValue = parseSingleHint(cleanedHintPartContent)

        if hintType ~= "invalid" and hintValue and string.len(hintValue) > 0 then
            if not targetConditions[targetNumber] then
                targetConditions[targetNumber] = {}
            end
            table.insert(targetConditions[targetNumber], { type = hintType, value = hintValue })
        end
    end

    if next(targetConditions) == nil then
        return
    end

    if not NPCSFolder then
        return
    end

    for _, player in Players:GetPlayers() do
        if player ~= lp then
            local playerNPCModel = NPCSFolder:FindFirstChild(player.Name)

            if playerNPCModel then
                local configObject = playerNPCModel:FindFirstChild("Configuration")
                local playerMatchesAnyTarget = false

                for targetNumber, conditionsForTarget in pairs(targetConditions) do
                    local playerMatchesAllConditionsForTarget = true

                    for i, condition in ipairs(conditionsForTarget) do
                        local conditionMet = false

                        if condition.type == "task" then
                            local assignedTaskObject = playerNPCModel:FindFirstChild("AssignedTask")
                            if assignedTaskObject and assignedTaskObject:IsA("StringValue") and assignedTaskObject.Value == condition.value then
                                conditionMet = true
                            end
                        elseif condition.type == "trait" then
                            if configObject then
                                for _, configChild in ipairs(configObject:GetChildren()) do
                                    if configChild:IsA("StringValue") then
                                        if configChild.Value == condition.value then
                                            conditionMet = true
                                            break
                                        end
                                    end
                                end
                            end
                        end

                        if not conditionMet then
                            playerMatchesAllConditionsForTarget = false
                            break
                        end
                    end

                    if playerMatchesAllConditionsForTarget then
                        playerMatchesAnyTarget = true
                        break
                    end
                end

                if playerMatchesAnyTarget then
                    playersMatchingHints[player] = true
                end
            end
        end
    end
end
-- Function to connect the hint text changed signal
local function connectHintTextSignal()
    if hintTextConnection then
        hintTextConnection:Disconnect()
        hintTextConnection = nil
    end

    local PlayerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
    if not PlayerGui then return end

    local statusGui = PlayerGui:WaitForChild("RESETONDEATHStatusGui", 20)
    if not statusGui then
        return
    end

    local TargetHintLabel = statusGui:WaitForChild("TARGETHINT", 10)
    if not TargetHintLabel or not TargetHintLabel:IsA("TextLabel") then
        return
    end

    hintTextConnection = TargetHintLabel:GetPropertyChangedSignal("Text"):Connect(updateMatchingHintPlayers)
    updateMatchingHintPlayers()
end
-- Detect and apply roles. This function now only updates the playerRoles table.
local function detectRoles()
    local everyoneHasGunConditionMet = false
    local noOneHasGunConditionMet = false
    local newHighestPriorityKillerDetected = false
    local theSingleKillerGunHolder = nil
    local specificJuggernautDetected = false
    local theSpecificJuggernautHolder = nil
    local specialKillerDetected = false
    local playersWithSpecialWeapons = {}
    local playersWithValidCharacters = {}
    local playersWithoutAnyGun = {}
    local playersWithAnyGun = {}
    local playersWithVigilanteWeapons = {}
    playersWithStandardKillerWeapons = {}
    local vigilanteCount = 0
    local killerGunHoldersCount = 0
    local singleKillerGunHolderCandidate = nil

    -- Clear previous roles before detection
    playerRoles = {}

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= lp and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            playersWithValidCharacters[player] = true

            local toolsByName = collectPlayerTools(player)
            local hasAnyRoleWeapon = false
            local hasVigilanteWeapon = false
            local hasKillerWeapon = false

            for name, tool in pairs(toolsByName) do
                if specialKillerWeapons[name] then
                    specialKillerDetected = true
                    playersWithSpecialWeapons[player] = true

                    if specificJuggernautWeapons[name] then
                        specificJuggernautDetected = true
                        theSpecificJuggernautHolder = player
                    end
                end
                if allRoleWeapons[name] then
                    hasAnyRoleWeapon = true
                end
                if vigilanteWeapons[name] then
                    hasVigilanteWeapon = true
                    playersWithVigilanteWeapons[player] = true
                end
                if killerWeapons[name] then
                    hasKillerWeapon = true
                    if not specialKillerWeapons[name] then
                        playersWithStandardKillerWeapons[player] = true
                    end
                end
            end

            if hasVigilanteWeapon then
                vigilanteCount = vigilanteCount + 1
                if firstVigilanteTracker[player] == nil then
                    firstVigilanteTracker[player] = true
                end
            end

            if hasKillerWeapon then
                killerGunHoldersCount = killerGunHoldersCount + 1
                singleKillerGunHolderCandidate = player
            end

            if not hasAnyRoleWeapon then
                playersWithoutAnyGun[player] = true
            else
                playersWithAnyGun[player] = true
            end
        end
    end

    if vigilanteCount == 1 and killerGunHoldersCount == 1 and singleKillerGunHolderCandidate then
        newHighestPriorityKillerDetected = true
        theSingleKillerGunHolder = singleKillerGunHolderCandidate
        specialKillerDetected = false
        specificJuggernautDetected = false
        rolesLockedByDistance = false
        lockedDistanceRoles = {}

        if theSingleKillerGunHolder == lp then
            updateMatchingHintPlayers()
        end
    end

    local otherPlayersWithCharCount = 0
    for player, _ in pairs(playersWithValidCharacters) do
        if player ~= lp then otherPlayersWithCharCount = otherPlayersWithCharCount + 1 end
    end

    local allValidTargetsHaveGun = true
    for player, _ in pairs(playersWithValidCharacters) do
        if playersWithoutAnyGun[player] then
            allValidTargetsHaveGun = false
            break
        end
    end
    if allValidTargetsHaveGun and otherPlayersWithCharCount > 0 then
        everyoneHasGunConditionMet = true
    end

    local anyValidTargetHasGun = false
    for player, _ in pairs(playersWithValidCharacters) do
        if playersWithAnyGun[player] then
            anyValidTargetHasGun = true
            break
        end
    end
    if not anyValidTargetHasGun and otherPlayersWithCharCount > 0 then
        noOneHasGunConditionMet = true
    end

    local higherPriorityActive = newHighestPriorityKillerDetected or specificJuggernautDetected or specialKillerDetected
    
    -- REFACTORED: Manage Distance Lock State based on clear, non-overlapping conditions.
    if higherPriorityActive or noOneHasGunConditionMet then
        -- DEACTIVATE LOCK: A high-priority role has appeared, OR everyone has disarmed.
        if rolesLockedByDistance then
            rolesLockedByDistance = false
            lockedDistanceRoles = {}
        end
    elseif everyoneHasGunConditionMet then
        -- ACTIVATE LOCK: Everyone has a weapon and no high-priority roles are present.
        -- This block only runs once when the condition is first met.
        if not rolesLockedByDistance then
            rolesLockedByDistance = true
            lockedDistanceRoles = {} -- Clear old roles before recalculating.
    
            local localHRP = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            if localHRP then
                for player, _ in pairs(playersWithValidCharacters) do
                    local playerHRP = player.Character:FindFirstChild("HumanoidRootPart")
                    if playerHRP then
                        local distance = (localHRP.Position - playerHRP.Position).Magnitude
                        if distance >= distanceThreshold then
                            lockedDistanceRoles[player] = "Killer"
                        else
                            lockedDistanceRoles[player] = "Innocent"
                        end
                    end
                end
            else
                -- Activation failed, reset state.
                rolesLockedByDistance = false
                lockedDistanceRoles = {}
                warn("Blood Debt Role Detector: Distance Lock failed to activate: Local HRP missing.")
            end
        end
    end
    -- If none of these conditions are met (e.g., some have guns, some don't), 
    -- the 'rolesLockedByDistance' state persists from the previous check, fulfilling the user's request.

    updateMatchingHintPlayers()

    for _, player in ipairs(Players:GetPlayers()) do
        if playersWithValidCharacters[player] then
            if newHighestPriorityKillerDetected and player == theSingleKillerGunHolder then
                playerRoles[player] = {label = killerLabel, color = killerColor}
            elseif specificJuggernautDetected then
                if player == theSpecificJuggernautHolder then
                    playerRoles[player] = {label = killerLabel, color = killerColor}
                else
                    local toolsByName = collectPlayerTools(player)
                    local hasAnyRoleWeapon = false
                    for name, _ in pairs(toolsByName) do
                        if allRoleWeapons[name] then
                            hasAnyRoleWeapon = true
                            break
                        end
                    end

                    if hasAnyRoleWeapon then
                        playerRoles[player] = {label = vigilanteLabel, color = vigilanteColor}
                    else
                        playerRoles[player] = {label = innocentLabel, color = innocentColor}
                    end
                end
            elseif specialKillerDetected then
                if playersWithSpecialWeapons[player] then
                    -- This player has a special weapon, they are the Killer.
                    playerRoles[player] = {label = killerLabel, color = killerColor}
                elseif playersWithVigilanteWeapons[player] then
                    -- FIXED: Check if other players are Vigilantes instead of defaulting to Innocent.
                    playerRoles[player] = {label = vigilanteLabel, color = vigilanteColor}
                else
                    -- This player has no special weapon and no vigilante weapon, they are Innocent.
                    playerRoles[player] = {label = innocentLabel, color = innocentColor}
                end
            elseif rolesLockedByDistance then
                local lockedRole = lockedDistanceRoles[player]
                if lockedRole then
                    if lockedRole == "Killer" then
                        playerRoles[player] = {label = killerLabel, color = killerColor}
                    elseif lockedRole == "Innocent" then
                        playerRoles[player] = {label = innocentLabel, color = innocentColor}
                    end
                end
            elseif playersMatchingHints[player] and playersWithVigilanteWeapons[player] then
                playerRoles[player] = {label = vigilanteHintLabel, color = vigilanteHintColor}
            elseif playersMatchingHints[player] and playersWithStandardKillerWeapons[player] then
                playerRoles[player] = {label = killerHintLabel, color = killerHintColor}
            elseif playersMatchingHints[player] and not playersWithStandardKillerWeapons[player] and not playersWithVigilanteWeapons[player] then
                playerRoles[player] = {label = hintMatchLabel, color = hintMatchColor}
            else
                local toolsByName = collectPlayerTools(player)
                local standardRole, standardColor, standardLabel = getStandardRoleFromWeapons(toolsByName)
                if standardRole then
                    playerRoles[player] = {label = standardLabel, color = standardColor}
                else
                    playerRoles[player] = {label = innocentLabel, color = innocentColor}
                end
            end
        end
    end
end
-- NEW: This function reads from playerRoles and applies visuals if ESP is on.
local function updateEspVisuals()
    if not espEnabled then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= lp and player.Character then
            local roleData = playerRoles[player]
            if roleData then
                tagPlayer(player, roleData.color, roleData.label)
            else
                clearOldStuff(player.Character)
            end
        elseif player.Character then
            clearOldStuff(player.Character)
        end
    end
end
-- UPDATED: updateEspVisuals now also handles dropped guns
local function updateEspVisuals()
    if not espEnabled then return end
    
    -- Player ESP (unchanged)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= lp and player.Character then
            local roleData = playerRoles[player]
            if roleData then
                tagPlayer(player, roleData.color, roleData.label)
            else
                clearOldStuff(player.Character)
            end
        elseif player.Character then
            clearOldStuff(player.Character)
        end
    end

    -- Dropped Gun ESP
    updateDroppedGunEsp()
end
-- UPDATED: disableEsp now also cleans dropped guns
local function disableEsp()
    if espEnabled then
        espEnabled = false
        stopEspLoop = true
        print("Blood Debt Role Detector: ESP Disabled")

        -- ... [your existing cleanup code] ...

        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                clearOldStuff(player.Character)
            end
        end

        -- Clear dropped gun ESP
        clearAllDroppedGunEsp()

        Rayfield:Notify({
            Title = "ESP Disabled",
            Content = "Role visuals and dropped gun ESP have been turned off.",
            Duration = 3,
            Image = 4483362458
        })
    end
end
-- Function to teleport to dropped gun
local function tpToDroppedGun()
    if not BloodFolder then
        warn("Blood Debt Role Detector: BloodFolder not available for teleport.")
        Rayfield:Notify({
            Title = "Error",
            Content = "BloodFolder not found in Workspace.",
            Duration = 5,
            Image = 4483362458
        })
        return
    end

    local foundGun = false
    for _, item in ipairs(BloodFolder:GetChildren()) do
        if item:IsA("Tool") and (killerWeapons[item.Name] or vigilanteWeapons[item.Name] or specialKillerWeapons[item.Name]) then
            local handle = item:FindFirstChild("Handle")

            if handle and handle:IsA("BasePart") then
                local targetPosition = handle.Position + Vector3.new(0, 5, 0)

                if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                    lp.Character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                    foundGun = true
                    break
                else
                    warn("Blood Debt Role Detector: Local player character or HRP not found for teleport.")
                    Rayfield:Notify({
                        Title = "Error",
                        Content = "Cannot teleport: Your character is not ready.",
                        Duration = 5,
                        Image = 4483362458
                    })
                    return
                end
            else
                warn("Tool '"..item.Name.."' found in BloodFolder but missing a valid Handle part for teleportation.")
            end
        end
    end

    if not foundGun then
        Rayfield:Notify({
            Title = "No Gun Found",
            Content = "There are no valid guns in the BloodFolder.",
            Duration = 5,
            Image = 4483362458
        })
    end
end
-- NEW: Dropdown for Nametag Mode Selection
local DropdownNametagMode = Tab:CreateDropdown({
    Name = "Nametag Display Mode",
    Options = {"Role", "Username", "Character Name"},
    CurrentOption = {"Role"},
    MultipleOptions = false,
    Flag = "NametagModeDropdown",
    Callback = function(Option)
        nametagMode = Option[1] or "Role"
        print("Blood Debt Role Detector: Nametag mode changed to:", nametagMode)
        
        -- Re-apply tags to update nametags immediately
        if espEnabled then
            updateEspVisuals()
        end
        
        Rayfield:Notify({
            Title = "Nametag Mode Changed",
            Content = "Now displaying: " .. nametagMode,
            Duration = 3,
            Image = 4483362458
        })
    end,
})
-- Teleport to Dropped Gun button
local ButtonTPGunCreateSuccess, ButtonTPGun = pcall(function()
    return Tab:CreateButton({
        Name = "Teleport to Dropped Gun",
        Callback = function()
            tpToDroppedGun()
        end
    })
end)

if not ButtonTPGunCreateSuccess or not ButtonTPGun then
    warn("Blood Debt Role Detector: Failed to create Teleport to Dropped Gun button.")
else
    print("Blood Debt Role Detector: Teleport to Dropped Gun button created successfully.")
end
-- Enable ESP button
local ButtonEnableESPCreateSuccess, ButtonEnableESP = pcall(function()
    return Tab:CreateButton({
        Name = "Enable ESP",
        Callback = function()
            if not espEnabled then
                espEnabled = true
                stopEspLoop = false
                print("Blood Debt Role Detector: ESP Enabled")

                task.spawn(function()
                    while espEnabled and not stopEspLoop do
                        updateEspVisuals()
                        task.wait(0.5)
                    end
                    print("Blood Debt Role Detector: ESP Visuals loop stopped.")
                end)

                espPlayerAddedConnection = game.Players.PlayerAdded:Connect(function(player)
                    local charAddedConn = player.CharacterAdded:Connect(function(character)
                        task.wait(0.1)
                        updateEspVisuals()
                    end)
                    espCharacterAddedConnections[player] = charAddedConn

                    if player.Character then
                        task.wait(0.1)
                        updateEspVisuals()
                    end
                end)

                game.Players.PlayerRemoving:Connect(function(player)
                    if espCharacterAddedConnections[player] then
                        if typeof(espCharacterAddedConnections[player]) == "RBXScriptConnection" then
                            espCharacterAddedConnections[player]:Disconnect()
                        end
                        espCharacterAddedConnections[player] = nil
                    end
                    clearOldStuff(player.Character)
                end)
                
                updateEspVisuals()

                Rayfield:Notify({
                    Title = "ESP Enabled",
                    Content = "Role visuals have been turned on.",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                print("Blood Debt Role Detector: ESP is already enabled.")
                Rayfield:Notify({
                    Title = "ESP Already On",
                    Content = "Role visuals are already running.",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        end
    })
end)

if not ButtonEnableESPCreateSuccess or not ButtonEnableESP then
    warn("Blood Debt Role Detector: Failed to create Enable ESP button.")
else
    print("Blood Debt Role Detector: Enable ESP button created successfully.")
end
-- Disable ESP button
local ButtonDisableESPCreateSuccess, ButtonDisableESP = pcall(function()
    return Tab:CreateButton({
        Name = "Disable ESP",
        Callback = function()
            disableEsp()
        end
    })
end)
BloodFolder.ChildRemoved:Connect(function(child)
    if child:IsA("Tool") then
        clearDroppedGunEsp(child)
        if droppedGunConnections[child] then
            droppedGunConnections[child]:Disconnect()
            droppedGunConnections[child] = nil
        end
    end
end)
if not ButtonDisableESPCreateSuccess or not ButtonDisableESP then
    warn("Blood Debt Role Detector: Failed to create Disable ESP button.")
else
    print("Blood Debt Role Detector: Disable ESP button created successfully.")
end
Rayfield:Notify({
    Title = "ESP Script Initialized",
    Content = "Customizable nametags enabled. Select display mode from dropdown.",
    Duration = 5,
    Image = 4483362458
})
local AimbotTab = Window:CreateTab("Aimbot")
-- =========================================================================================
-- || START OF AIMBOT SECTION ||
-- =========================================================================================
local LocalAimbotConfig = {
    HitChance = 100,
    wallcheck = false,
    TargetParts = { "Torso" },
    radius = 150,
    aimbotEnabled = true,
    fovVisible = true
}
local run = run_on_actor or run_on_thread
local availableActors = getactors or getactorthreads
local AimbotActor = availableActors()[1] -- Get the actor thread we will send messages to.
local function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end
-- NEW: Multi-select dropdown for bullet redirection targets
AimbotTab:CreateDropdown({
    Name = "Bullet Redirection Target",
    Options = {"Killer", "Vigilante", "Innocent"},
    CurrentOption = {"Killer"},
    MultipleOptions = true,
    Flag = "BulletRedirectionDropdown",
    Callback = function(Options)
        bulletRedirectionModes = Options
        print("Blood Debt Role Detector: Bullet Redirection modes changed to:", table.concat(Options, ", "))
        Rayfield:Notify({
            Title = "Aimbot Targets Changed",
            Content = "Now targeting: " .. table.concat(Options, ", "),
            Duration = 3,
            Image = 4483362458
        })
    end,
})
AimbotTab:CreateToggle({
    Name = "Aimbot Enabled",
    CurrentValue = LocalAimbotConfig.aimbotEnabled,
    Callback = function(value)
        LocalAimbotConfig.aimbotEnabled = value
        if AimbotActor then
            -- Send the update to the actor's island
            run(AimbotActor, string.format("getgenv().aimbotEnabled = %s", tostring(value)))
        end
    end,
})
AimbotTab:CreateSlider({
    Name = "Hit Chance",
    Range = {0, 100},
    Increment = 1,
    Suffix = "%",
    CurrentValue = LocalAimbotConfig.HitChance,
    Callback = function(value)
        LocalAimbotConfig.HitChance = value
        if AimbotActor then
            run(AimbotActor, string.format("getgenv().HitChance = %d", value))
        end
    end,
})
AimbotTab:CreateToggle({
    Name = "Wallcheck",
    CurrentValue = LocalAimbotConfig.wallcheck,
    Callback = function(value)
        LocalAimbotConfig.wallcheck = value
        if AimbotActor then
            run(AimbotActor, string.format("getgenv().wallcheck = %s", tostring(value)))
        end
    end,
})
AimbotTab:CreateDropdown({
    Name = "Target Parts",
    Options = {"Head", "Torso", "Left Leg", "Right Leg", "Left Arm", "Right Arm"},
    CurrentOption = {"Torso"},
    MultipleOptions = true,
    Callback = function(Options)
        LocalAimbotConfig.TargetParts = Options
        -- We need to format the table into a string like '{"Head", "Torso"}'
        local partsString = "{"
        for i, p in ipairs(Options) do
            partsString = partsString .. '"' .. p .. '"' .. (i == #Options and "" or ", ")
        end
        partsString = partsString .. "}"
        if AimbotActor then
            run(AimbotActor, string.format("getgenv().TargetParts = %s", partsString))
        end
    end,
})
AimbotTab:CreateSlider({
    Name = "FOV Radius",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "",
    CurrentValue = LocalAimbotConfig.radius,
    Callback = function(value)
        LocalAimbotConfig.radius = value
        if AimbotActor then
            run(AimbotActor, string.format("getgenv().radius = %d", value))
        end
    end,
})
AimbotTab:CreateToggle({
    Name = "FOV Visible",
    CurrentValue = LocalAimbotConfig.fovVisible,
    Callback = function(value)
        LocalAimbotConfig.fovVisible = value
        -- No need to send this one to the actor, the main thread handles it.
    end,
})
-- The FOV Circle runs in the MAIN SCRIPT, reading from the local config state.
do
    local circle = Drawing.new("Circle")
    circle.Filled = false
    circle.NumSides = 30
    circle.Thickness = 2
    circle.Color = Color3.new(1, 1, 1)
    RunService.RenderStepped:Connect(function()
        if circle and LocalAimbotConfig then
            local viewportSize = Camera.ViewportSize
            local screenCenter = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
            circle.Radius = LocalAimbotConfig.radius
            circle.Position = screenCenter
            circle.Visible = LocalAimbotConfig.fovVisible
        end
    end)
end
local function CheckFFlagValue(Name, Value)
    local Success, Result = pcall(getfflag, Name)
    if not Success then
        return false
    end
    if typeof(Result) == "boolean" then
        return Result
    end
    if typeof(Result) == "string" then
        return Result == tostring(Value)
    end
    return false
end
-- This function loads the ENTIRE aimbot logic (including the hook) into the actor thread.
-- It now bakes the INITIAL settings into the script, just like the original Script 2.
local function LoadAimbotScript()
   
    local targetPartsString = "{"
    for i, p in ipairs(LocalAimbotConfig.TargetParts) do
        targetPartsString = targetPartsString .. '"' .. p .. '"' .. (i == #LocalAimbotConfig.TargetParts and "" or ", ")
    end
    targetPartsString = targetPartsString .. "}"
    local code = string.format([=[
-- This entire block runs in a parallel world (the actor thread)
-- Initialize the getgenv() environment for this script's context with the initial values.
if getgenv().HitChance == nil then getgenv().HitChance = %d end
if getgenv().wallcheck == nil then getgenv().wallcheck = %s end
if getgenv().TargetParts == nil then getgenv().TargetParts = %s end
if getgenv().radius == nil then getgenv().radius = %d end
if getgenv().aimbotEnabled == nil then getgenv().aimbotEnabled = %s end
if getgenv().fovVisible == nil then getgenv().fovVisible = %s end
if getgenv().validAimbotTargets == nil then getgenv().validAimbotTargets = {} end
local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local UserInputService = cloneref(game:GetService("UserInputService"))
local Gun_utls = ReplicatedStorage:WaitForChild("gun_res", 30)
local gun_lib = Gun_utls:WaitForChild("lib", 30)
local projectileHandlerMod = gun_lib:WaitForChild("projectileHandler", 30)
local FastCast = require(projectileHandlerMod:WaitForChild("FastCastRedux", 30))
local Camera = Workspace.CurrentCamera
local Bin
do
Bin = setmetatable({}, {
__tostring = function()
return "Bin"
end,
})
Bin.__index = Bin
function Bin.new(...)
local self = setmetatable({}, Bin)
return self:constructor(...) or self
end
function Bin:constructor()
end
function Bin:add(item)
local node = {
item = item,
}
if self.head == nil then
self.head = node
end
if self.tail then
self.tail.next = node
end
self.tail = node
return item
end
function Bin:batch(...)
local args = { ... }
for _, item in args do
local node = {
item = item,
}
if self.head == nil then
self.head = node
end
if self.tail then
self.tail.next = node
end
self.tail = node
end
return args
end
function Bin:destroy()
while self.head do
local item = self.head.item
if type(item) == "function" then
item()
elseif typeof(item) == "RBXScriptConnection" then
item:Disconnect()
elseif type(item) == "thread" then
task.cancel(item)
elseif item.destroy ~= nil then
item:destroy()
elseif item.Destroy ~= nil then
item:Destroy()
end
self.head = self.head.next
end
end
function Bin:isEmpty()
return self.head == nil
end
end
local BaseComponent
do
BaseComponent = setmetatable({}, {
__tostring = function()
return "BaseComponent"
end,
})
BaseComponent.__index = BaseComponent
function BaseComponent.new(...)
local self = setmetatable({}, BaseComponent)
return self:constructor(...) or self
end
function BaseComponent:constructor(instance)
self.instance = instance
self.bin = Bin.new()
end
function BaseComponent:destroy()
self.bin:destroy()
end
end
local RigComponent
do
local super = BaseComponent
RigComponent = setmetatable({}, {
__tostring = function()
return "RigComponent"
end,
__index = super,
})
RigComponent.__index = RigComponent
function RigComponent.new(...)
local self = setmetatable({}, RigComponent)
return self:constructor(...) or self
end
function RigComponent:constructor(instance)
super.constructor(self, instance)
local root = instance:WaitForChild("HumanoidRootPart")
if root == nil then
error("Root part not found")
end
local head = instance:WaitForChild("Head")
if head == nil then
error("Head not found")
end
local humanoid = instance:WaitForChild("Humanoid")
if humanoid == nil then
error("Humanoid not found")
end
self.root = root
self.head = head
self.humanoid = humanoid
local bin = self.bin
bin:batch(humanoid.Died:Connect(function()
return self:destroy()
end), instance.Destroying:Connect(function()
return self:destroy()
end))
end
end
local CharacterComponent
do
local super = RigComponent
CharacterComponent = setmetatable({}, {
__tostring = function()
return "CharacterComponent"
end,
__index = super,
})
CharacterComponent.__index = CharacterComponent
function CharacterComponent.new(...)
local self = setmetatable({}, CharacterComponent)
return self:constructor(...) or self
end
function CharacterComponent:constructor(instance)
super.constructor(self, instance)
end
CharacterComponent.active = {}
end
local PlayerComponent
do
local super = BaseComponent
PlayerComponent = setmetatable({}, {
__tostring = function()
return "PlayerComponent"
end,
__index = super,
})
PlayerComponent.__index = PlayerComponent
function PlayerComponent.new(...)
local self = setmetatable({}, PlayerComponent)
return self:constructor(...) or self
end
function PlayerComponent:constructor(instance)
super.constructor(self, instance)
self.name = self.instance.Name
local character = instance.Character
if character then
task.spawn(function()
return self:onCharacterAdded(character)
end)
end
local bin = self.bin
bin:batch(instance.CharacterAdded:Connect(function(character)
return self:onCharacterAdded(character)
end), instance.CharacterRemoving:Connect(function()
return self:onCharacterRemoving()
end))
bin:add(function()
local _active = PlayerComponent.active
local _instance = instance
local _valueExisted = _active[_instance] ~= nil
_active[_instance] = nil
return _valueExisted
end)
local _active = PlayerComponent.active
local _instance = instance
local _self = self
_active[_instance] = _self
end
function PlayerComponent:onCharacterAdded(character)
local _result = self.character
if _result ~= nil then
_result:destroy()
end
self.character = CharacterComponent.new(character)
end
function PlayerComponent:onCharacterRemoving()
local _result = self.character
if _result ~= nil then
_result:destroy()
end
self.character = nil
end
function PlayerComponent:getName()
return self.name
end
function PlayerComponent:getCharacter()
return self.character
end
PlayerComponent.active = {}
end
local ComponentController = {}
do
local _container = ComponentController
local rayParams
local onPlayerAdded = function(instance)
PlayerComponent.new(instance)
end
local getRandomPart = function(character)
local currentTargetParts = getgenv().TargetParts
local _newValue = table.create(#currentTargetParts)
local _callback = function(partName)
return character.instance:FindFirstChild(partName)
end
for _k, _v in ipairs(currentTargetParts) do
_newValue[_k] = _callback(_v, _k - 1, currentTargetParts)
end
local _newValue_1 = {}
local _callback_1 = function(part)
return part ~= nil
end
local _length = 0
for _k, _v in ipairs(_newValue) do
if _callback_1(_v, _k - 1, _newValue) == true then
_length += 1
_newValue_1[_length] = _v
end
end
local availableParts = _newValue_1
if #availableParts == 0 then
return nil
end
local randomIndex = Random.new():NextInteger(1, #availableParts)
return availableParts[randomIndex]
end
local function getTarget()
local list = PlayerComponent.active
local viewportSize = Camera.ViewportSize
local screenCenter = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
local bestTarget
local bestPart
local weight = -math.huge
local _callback = function(component)
if getgenv().validAimbotTargets[component:getName()] == nil then
return nil
end
local character = component:getCharacter()
if character == nil then
return nil
end
local targetPart = getRandomPart(character)
if targetPart == nil then
return nil
end
local position = character.root.Position
local viewportPoint = Camera:WorldToViewportPoint(position)
if viewportPoint.Z < 0 then
return nil
end
if getgenv().wallcheck then
local origin = Camera.CFrame.Position
rayParams.FilterDescendantsInstances = { character.instance, LocalPlayer.Character }
local result = Workspace:Raycast(origin, position - origin, rayParams)
if result then
return nil
end
end
local screenDistance = (Vector2.new(viewportPoint.X, viewportPoint.Y) - screenCenter).Magnitude
if screenDistance > getgenv().radius then
return nil
end
local prio = 1e3 - screenDistance
if prio > weight then
bestTarget = character
bestPart = targetPart
weight = prio
end
end
for _k, _v in pairs(list) do
_callback(_v, _k, list)
end
return bestTarget, bestPart
end
_container.getTarget = getTarget
local function __init()
local _exp = Players:GetPlayers()
local _callback = function(instance)
return instance ~= LocalPlayer and task.spawn(onPlayerAdded, instance)
end
for _k, _v in ipairs(_exp) do
_callback(_v, _k - 1, _exp)
end
Players.PlayerAdded:Connect(onPlayerAdded)
Players.PlayerRemoving:Connect(function(instance)
local _active = PlayerComponent.active
local _instance = instance
local _result = _active[_instance]
if _result ~= nil then
_result = _result:destroy()
end
return _result
end)
rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
rayParams.IgnoreWater = true
end
_container.__init = __init
end
local RangeController = {}
do
local _container = RangeController
local target
local calculateChance = function(Percentage)
Percentage = math.floor(Percentage)
local random = Random.new()
local chance = math.floor(random:NextNumber(0, 1) * 100) / 100
return chance <= Percentage / 100
end
local getTarget = ComponentController.getTarget
local function __init()
local oldFire = FastCast.Fire
FastCast.Fire = function(_table, origin, direction, velocity, FastCastBehaviour)
local target, targetPart = getTarget()
local chance = calculateChance(getgenv().HitChance)
if getgenv().aimbotEnabled and target and targetPart and chance then
local _position = targetPart.Position
local _origin = origin
local newDirection = (_position - _origin).Unit * 1000
direction = newDirection
velocity = newDirection * 9e9
end
return oldFire(_table, origin, direction, velocity, FastCastBehaviour)
end
end
_container.__init = __init
end
local CameraController = {}
do
local _container = CameraController
local function __init()
Camera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
Camera = Workspace.CurrentCamera or Camera
end)
end
_container.__init = __init
end
ComponentController.__init()
RangeController.__init()
CameraController.__init()
    ]=],
    LocalAimbotConfig.HitChance,
    tostring(LocalAimbotConfig.wallcheck),
    targetPartsString,
    LocalAimbotConfig.radius,
    tostring(LocalAimbotConfig.aimbotEnabled),
    tostring(LocalAimbotConfig.fovVisible)
    )
    return code
end
-- NEW: Helper function to check if a table contains a value
local function tableContains(tbl, value)
    for _, v in ipairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end
-- NEW: This is the main, always-on loop for Role Detection and Aimbot Target Updating.
task.spawn(function()
    connectHintTextSignal()
    while true do
        -- Step 1: Detect roles and populate the playerRoles table.
        detectRoles()
        
        -- Step 2: Determine valid aimbot targets based on the selected modes.
        local validTargetNames = {}
        
        for player, data in pairs(playerRoles) do
            if data then
                -- Check if this player's role matches any selected target mode
                local shouldTarget = false
                
                -- Check for Killer targeting
                if tableContains(bulletRedirectionModes, "Killer") then
                    if data.label == killerLabel or data.label == killerHintLabel then
                        shouldTarget = true
                    end
                end
                
                -- Check for Vigilante targeting
                if tableContains(bulletRedirectionModes, "Vigilante") then
                    if data.label == vigilanteLabel or data.label == vigilanteHintLabel then
                        shouldTarget = true
                    end
                end
                
                -- Check for Innocent targeting
                if tableContains(bulletRedirectionModes, "Innocent") then
                    if data.label == innocentLabel or data.label == hintMatchLabel then
                        shouldTarget = true
                    end
                end
                
                if shouldTarget then
                    validTargetNames[player.Name] = true
                end
            end
        end
        
        -- Step 3: Serialize the list of names and send it to the aimbot actor thread.
        local namesString = "{"
        for name, _ in pairs(validTargetNames) do
            namesString = namesString .. '["' .. name .. '"]=true,'
        end
        namesString = namesString .. "}"
        
        if AimbotActor then
            run(AimbotActor, string.format("getgenv().validAimbotTargets = %s", namesString))
        end
        
        task.wait(0.5)
    end
end)
if AimbotActor then
    if CheckFFlagValue("DebugRunParallelLuaOnMainThread", true) then
        print("User ran with FFlag ON")
        loadstring(LoadAimbotScript())()
    else
        print("User ran with run_on_actors")
        run(AimbotActor, LoadAimbotScript())
    end
else
    warn("Aimbot could not be loaded: No available actor threads.")
end
-- =========================================================================================
-- || END OF AIMBOT SECTION ||
-- =========================================================================================
-- End of Script
