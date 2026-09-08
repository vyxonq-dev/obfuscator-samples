--NU-FWQ
--[[
Integrated ESP LocalScript with Rayfield UI, Role Detection, Distance Locking,
Enhanced Hint Matching, and CUSTOMIZABLE NAMETAGS (Role/Username/Character Name).

UPDATED: Added dropdown menu to select nametag display mode:
- Role (Default): Shows the detected role
- Username: Shows the player's Roblox username
- Character Name: Shows the in-game character name from NPCSFolder
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
local lp = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local NPCSFolder = Workspace:WaitForChild("NPCSFolder")
local BloodFolder = Workspace:WaitForChild("BloodFolder")

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

    if not espEnabled then return end

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
    if not espEnabled then return end
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

-- Detect and apply roles
local function detectRoles()
    if not espEnabled then return end

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
        else
            clearOldStuff(player.Character)
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

    if not higherPriorityActive then
        if everyoneHasGunConditionMet and not rolesLockedByDistance then
            rolesLockedByDistance = true
            lockedDistanceRoles = {}

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
                rolesLockedByDistance = false
                lockedDistanceRoles = {}
                warn("Blood Debt Role Detector: Distance Lock failed to activate: Local HRP missing.")
            end
        elseif noOneHasGunConditionMet and rolesLockedByDistance then
            rolesLockedByDistance = false
            lockedDistanceRoles = {}
        end
    else
        if rolesLockedByDistance then
            rolesLockedByDistance = false
            lockedDistanceRoles = {}
        end
    end

    updateMatchingHintPlayers()

    for _, player in ipairs(Players:GetPlayers()) do
        if playersWithValidCharacters[player] then
            if newHighestPriorityKillerDetected and player == theSingleKillerGunHolder then
                tagPlayer(player, killerColor, killerLabel)
            elseif specificJuggernautDetected then
                if player == theSpecificJuggernautHolder then
                    tagPlayer(player, killerColor, killerLabel)
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
                        tagPlayer(player, vigilanteColor, vigilanteLabel)
                    else
                        tagPlayer(player, innocentColor, innocentLabel)
                    end
                end
            elseif specialKillerDetected then
                if playersWithSpecialWeapons[player] then
                    tagPlayer(player, killerColor, killerLabel)
                else
                    tagPlayer(player, innocentColor, innocentLabel)
                end
            elseif rolesLockedByDistance then
                local lockedRole = lockedDistanceRoles[player]
                if lockedRole then
                    if lockedRole == "Killer" then
                        tagPlayer(player, killerColor, killerLabel)
                    elseif lockedRole == "Innocent" then
                        tagPlayer(player, innocentColor, innocentLabel)
                    end
                else
                    clearOldStuff(player.Character)
                end
            elseif playersMatchingHints[player] and playersWithVigilanteWeapons[player] then
                tagPlayer(player, vigilanteHintColor, vigilanteHintLabel)
            elseif playersMatchingHints[player] and playersWithStandardKillerWeapons[player] then
                tagPlayer(player, killerHintColor, killerHintLabel)
            elseif playersMatchingHints[player] and not playersWithStandardKillerWeapons[player] and not playersWithVigilanteWeapons[player] then
                tagPlayer(player, hintMatchColor, hintMatchLabel)
            else
                local toolsByName = collectPlayerTools(player)
                local standardRole, standardColor, standardLabel = getStandardRoleFromWeapons(toolsByName)
                if standardRole then
                    tagPlayer(player, standardColor, standardLabel)
                else
                    tagPlayer(player, innocentColor, innocentLabel)
                end
            end
        else
            clearOldStuff(player.Character)
        end
    end
end

-- Function to disable ESP
local function disableEsp()
    if espEnabled then
        espEnabled = false
        stopEspLoop = true
        print("Blood Debt Role Detector: ESP Disabled")

        rolesLockedByDistance = false
        lockedDistanceRoles = {}
        playersMatchingHints = {}
        playersWithStandardKillerWeapons = {}
        firstVigilanteTracker = {}

        if espPlayerAddedConnection then
            espPlayerAddedConnection:Disconnect()
            espPlayerAddedConnection = nil
        end

        if hintTextConnection then
            hintTextConnection:Disconnect()
            hintTextConnection = nil
        end

        for player, connection in pairs(espCharacterAddedConnections) do
            if connection and typeof(connection) == "RBXScriptConnection" then
                connection:Disconnect()
            end
            espCharacterAddedConnections[player] = nil
        end
        espCharacterAddedConnections = {}

        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                clearOldStuff(player.Character)
            end
        end
        clearAllDroppedGunEsp() 
        Rayfield:Notify({
            Title = "ESP Disabled",
            Content = "Role detection and dropped gun ESP have been turned off.",
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
            detectRoles()
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
                        task.wait(0.5)
                        updateDroppedGunEsp()
                        detectRoles()
                    end
                    print("Blood Debt Role Detector: ESP Detection loop stopped.")
                end)

                espPlayerAddedConnection = game.Players.PlayerAdded:Connect(function(player)
                    local charAddedConn = player.CharacterAdded:Connect(function(character)
                        task.wait(0.1)
                        connectHintTextSignal()
                        detectRoles()
                    end)
                    espCharacterAddedConnections[player] = charAddedConn

                    if player.Character then
                        task.wait(0.1)
                        detectRoles()
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

                connectHintTextSignal()
                detectRoles()
                updateDroppedGunEsp()

                Rayfield:Notify({
                    Title = "ESP Enabled",
                    Content = "Role detection has been turned on.",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                print("Blood Debt Role Detector: ESP is already enabled.")
                Rayfield:Notify({
                    Title = "ESP Already On",
                    Content = "Role detection is already running.",
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
