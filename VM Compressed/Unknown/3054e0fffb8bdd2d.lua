local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ð¦ The Storage HUB ð¦",
   Icon = 0,
   LoadingTitle = "ð¦ The Storage HUB ð¦",
   LoadingSubtitle = "Made by: @arquivehacks",
   ShowText = "Rayfield",
   Theme = "Default",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "tshub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local MainTab = Window:CreateTab("ð Visuals")
local MainSection = MainTab:CreateSection("ESP")

local TogglePlayers = MainTab:CreateToggle({
    Name = "Players",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if not _G.ESP then _G.ESP = {} end
        local esp = _G.ESP

        if Value == esp.active then return end
        esp.active = Value

        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local live = workspace:FindFirstChild("Live")
        if not live then
            warn("Folder 'Live' not found.")
            return
        end

        local PRICE_TABLE = {
            ["Baseball Bat"] = 90, ["Double Barrel Shotgun"] = 550,
            ["Flamethrower"] = 300, ["Revolver"] = 125, ["Sledgehammer"] = 500,
            ["Shotgun"] = 450, ["AK47"] = 200, ["SMG"] = 275, ["Fire Axe"] = 200,
            ["Knife"] = 50, ["Katana"] = 175, ["Medium Ammo"] = 3, ["GÃ¡s Can"] = 89,
            ["Storage Flakes"] = 14, ["Iron Ore"] = 52, ["Apple"] = 2,
            ["Agent 1 Key"] = 315, ["Prangles"] = 52, ["Banana"] = 2,
            ["Coal Ore"] = 15, ["Milk"] = 18, ["Burger"] = 8, ["Chocolate Bar"] = 5,
            ["Medkit"] = 52, ["Skeleton Key"] = 78, ["Bronze Ore"] = 3,
            ["Pickaxe"] = 157, ["Soda"] = 15, ["Empty Bottle"] = 1,
            ["Fried Chicken"] = 8, ["Canned Chicken"] = 36, ["EMP Grenade"] = 94,
            ["Light Ammo"] = 2, ["Waffles"] = 15, ["Screwdriver"] = 18,
            ["Red Book"] = 68, ["Purple Book"] = 22, ["Components"] = 21,
            ["Mug"] = 5, ["Dark Anime Painting"] = 19, ["White Book"] = 47,
            ["Gold Bar"] = 231, ["Ancient Knife"] = 68, ["Pink Book"] = 24,
            ["Baby VÃªnus Guytrap"] = 735, ["Cartoon Painting"] = 15,
            ["King's Crown"] = 525, ["Ramen"] = 100, ["Yellow Book"] = 90,
            ["Blue Book"] = 27, ["Green Key"] = 50, ["Red Key"] = 50,
            ["Pain Painting"] = 56, ["Silver Ore"] = 45,
        }

        local function hideRobloxNameTag(character)
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            end
        end

        local function parseItemName(name)
            local qty = 1
            local base = name
            local startPos, endPos = string.find(name, "%[%d+x%]")
            if startPos then
                local bracketContent = string.sub(name, startPos + 1, endPos - 1)
                local numStr = string.gsub(bracketContent, "x", "")
                qty = tonumber(numStr) or 1
                base = string.sub(name, 1, startPos - 1) .. string.sub(name, endPos + 1)
                base = string.gsub(base, "^%s+", "")
                base = string.gsub(base, "%s+$", "")
            end
            return base, qty
        end

        local function calculateIW(player)
            local backpack = player:FindFirstChild("Backpack")
            if not backpack then return 0 end
            local total = 0
            for _, item in ipairs(backpack:GetChildren()) do
                local itemName = item.Name
                local baseName, qty = parseItemName(itemName)
                local price = PRICE_TABLE[baseName]
                if price then
                    total = total + (price * qty)
                end
            end
            return total
        end

        local function addESP(character)
            if not character:IsA("Model") then return end
            if character == player.Character then return end
            if not esp.active then return end

            hideRobloxNameTag(character)
            if character:FindFirstChild("PlayerHighlight") then return end

            local highlight = Instance.new("Highlight")
            highlight.Name = "PlayerHighlight"
            highlight.FillTransparency = 1
            highlight.OutlineTransparency = 0.25
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = character

            local root = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChildWhichIsA("BasePart")
            if not root then return end

            local billboard = Instance.new("BillboardGui")
            billboard.Name = "PlayerESP"
            billboard.Adornee = root
            billboard.Size = UDim2.new(0, 150, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 4.2, 0)
            billboard.AlwaysOnTop = true
            billboard.MaxDistance = math.huge
            billboard.LightInfluence = 0
            billboard.Parent = character

            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.TextColor3 = Color3.fromRGB(255, 255, 255)
            text.TextStrokeTransparency = 0.6
            text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            text.TextSize = 10
            text.Font = Enum.Font.Gotham
            text.TextWrapped = true
            text.Parent = billboard

            task.spawn(function()
                while character.Parent and text.Parent and esp.active do
                    local myChar = player.Character
                    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                    local distance = (myRoot and root) and (myRoot.Position - root.Position).Magnitude or 0
                    local playerFromChar = Players:GetPlayerFromCharacter(character)
                    local iw = 0
                    if playerFromChar and playerFromChar ~= player then
                        iw = calculateIW(playerFromChar)
                    end
                    text.Text = string.format("EIW: %d$\n%s [%dm]", iw, character.Name, math.floor(distance))
                    task.wait(0.1)
                end
            end)
        end

        local function removeAllESP()
            for _, character in ipairs(live:GetChildren()) do
                local highlight = character:FindFirstChild("PlayerHighlight")
                if highlight then highlight:Destroy() end
                local billboard = character:FindFirstChild("PlayerESP")
                if billboard then billboard:Destroy() end
            end
        end

        local function scanPlayers()
            for _, character in ipairs(live:GetChildren()) do
                addESP(character)
            end
        end

        if Value then
            removeAllESP()
            scanPlayers()
            esp.connection = live.ChildAdded:Connect(function(character)
                task.wait(0.2)
                addESP(character)
            end)
            esp.loopThread = task.spawn(function()
                while esp.active do
                    scanPlayers()
                    task.wait(0.5)
                end
            end)
        else
            if esp.connection then
                esp.connection:Disconnect()
                esp.connection = nil
            end
            if esp.loopThread then
                task.cancel(esp.loopThread)
                esp.loopThread = nil
            end
            removeAllESP()
        end
    end,
})

local ToggleEnemies = MainTab:CreateToggle({
    Name = "Enemies",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        if not _G.MobsESP then _G.MobsESP = {} end
        local mobsESP = _G.MobsESP

        if Value == mobsESP.active then return end
        mobsESP.active = Value

        local player = game:GetService("Players").LocalPlayer
        local mobs = workspace:FindFirstChild("Mobs")
        if not mobs then
            warn("Folder 'Mobs' not found.")
            return
        end

        local function hideRobloxNameTag(character)
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
            end
        end

        local function addESP(character)
            if not character:IsA("Model") then return end
            if not mobsESP.active then return end

            hideRobloxNameTag(character)
            if character:FindFirstChild("MobHighlight") then return end

            local highlight = Instance.new("Highlight")
            highlight.Name = "MobHighlight"
            highlight.FillTransparency = 1
            highlight.OutlineTransparency = 0.25
            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = character

            local root = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChildWhichIsA("BasePart")
            if root then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "MobESP"
                billboard.Adornee = root
                billboard.Size = UDim2.new(0, 150, 0, 30)
                billboard.StudsOffset = Vector3.new(0, 4.2, 0)
                billboard.AlwaysOnTop = true
                billboard.MaxDistance = math.huge
                billboard.LightInfluence = 0
                billboard.Parent = character

                local text = Instance.new("TextLabel")
                text.Size = UDim2.new(1, 0, 1, 0)
                text.BackgroundTransparency = 1
                text.TextColor3 = Color3.fromRGB(255, 0, 0)
                text.TextStrokeTransparency = 0.6
                text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                text.TextSize = 10
                text.Font = Enum.Font.Gotham
                text.Parent = billboard

                task.spawn(function()
                    while character.Parent and text.Parent and mobsESP.active do
                        local myChar = player.Character
                        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                        if myRoot and root then
                            local distance = (myRoot.Position - root.Position).Magnitude
                            text.Text = character.Name .. " [" .. math.floor(distance) .. "m]"
                        else
                            text.Text = character.Name
                        end
                        task.wait(0.1)
                    end
                end)
            end
        end

        local function removeAllESP()
            for _, mob in ipairs(mobs:GetChildren()) do
                local highlight = mob:FindFirstChild("MobHighlight")
                if highlight then highlight:Destroy() end
                local billboard = mob:FindFirstChild("MobESP")
                if billboard then billboard:Destroy() end
            end
        end

        local function scanMobs()
            for _, mob in ipairs(mobs:GetChildren()) do
                addESP(mob)
            end
        end

        if Value then
            removeAllESP()
            scanMobs()
            mobsESP.connection = mobs.ChildAdded:Connect(function(mob)
                task.wait(0.2)
                addESP(mob)
            end)
            mobsESP.loopThread = task.spawn(function()
                while mobsESP.active do
                    scanMobs()
                    task.wait(0.5)
                end
            end)
        else
            if mobsESP.connection then
                mobsESP.connection:Disconnect()
                mobsESP.connection = nil
            end
            if mobsESP.loopThread then
                task.cancel(mobsESP.loopThread)
                mobsESP.loopThread = nil
            end
            removeAllESP()
        end
    end,
})

local ToggleLoot = MainTab:CreateToggle({
    Name = "Loot",
    CurrentValue = false,
    Flag = "Toggle3",
    Callback = function(Value)
        if not _G.LootESP then _G.LootESP = {} end
        local lootESP = _G.LootESP

        if Value == lootESP.active then return end
        lootESP.active = Value

        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local storages = workspace:FindFirstChild("Storages")
        if not storages then
            warn("Folder 'Storages' not found.")
            return
        end

        local function addHighlight(item)
            if not (item:IsA("Model") or item:IsA("BasePart")) then return end
            if not lootESP.active then return end
            if item:FindFirstChild("LootHighlight") then return end

            local highlight = Instance.new("Highlight")
            highlight.Name = "LootHighlight"
            highlight.FillTransparency = 1
            highlight.OutlineTransparency = 0.25
            highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = item

            local adornee = item:IsA("Model") and (item.PrimaryPart or item:FindFirstChildWhichIsA("BasePart")) or item
            if adornee then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "LootName"
                billboard.Adornee = adornee
                billboard.Size = UDim2.new(0, 150, 0, 30)
                billboard.StudsOffset = Vector3.new(0, 4.2, 0)
                billboard.AlwaysOnTop = true
                billboard.MaxDistance = math.huge
                billboard.LightInfluence = 0
                billboard.Parent = item

                local text = Instance.new("TextLabel")
                text.Name = "DistanceText"
                text.Size = UDim2.new(1, 0, 1, 0)
                text.BackgroundTransparency = 1
                text.TextColor3 = Color3.fromRGB(255, 255, 0)
                text.TextStrokeTransparency = 0.6
                text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                text.TextSize = 10
                text.Font = Enum.Font.Gotham
                text.TextScaled = false
                text.Parent = billboard

                task.spawn(function()
                    while item.Parent and text.Parent and lootESP.active do
                        local character = player.Character
                        local root = character and character:FindFirstChild("HumanoidRootPart")
                        if root then
                            local distance = (root.Position - adornee.Position).Magnitude
                            text.Text = item.Name .. " [" .. math.floor(distance) .. "m]"
                        end
                        task.wait(0.1)
                    end
                end)
            end
        end

        local function removeAllLootESP()
            for _, room in ipairs(storages:GetChildren()) do
                local contents = room:FindFirstChild("Contents")
                local loot = contents and contents:FindFirstChild("Loot")
                if loot then
                    for _, item in ipairs(loot:GetChildren()) do
                        local highlight = item:FindFirstChild("LootHighlight")
                        if highlight then highlight:Destroy() end
                        local billboard = item:FindFirstChild("LootName")
                        if billboard then billboard:Destroy() end
                    end
                end
            end
        end

        local function updateLoot()
            for _, room in ipairs(storages:GetChildren()) do
                local contents = room:FindFirstChild("Contents")
                local loot = contents and contents:FindFirstChild("Loot")
                if loot then
                    for _, item in ipairs(loot:GetChildren()) do
                        addHighlight(item)
                    end
                end
            end
        end

        if Value then
            removeAllLootESP()
            updateLoot()
            lootESP.loopThread = task.spawn(function()
                while lootESP.active do
                    updateLoot()
                    task.wait(0.1)
                end
            end)
        else
            if lootESP.loopThread then
                task.cancel(lootESP.loopThread)
                lootESP.loopThread = nil
            end
            removeAllLootESP()
        end
    end,
})

local FullBrightSection = MainTab:CreateSection("FullBright")
local fullBrightActive = false
local fullBrightConnection = nil
local fullBrightLoop = nil

local ButtonFullBright = MainTab:CreateButton({
    Name = "Enable FullBright",
    Callback = function()
        if fullBrightActive then
            Rayfield:Notify({
                Title = "FullBright Already Active!",
                Content = "FullBright is already running.",
                Duration = 3,
            })
            return
        end

        fullBrightActive = true
        local Lighting = game:GetService("Lighting")

        local function removeAtmosphere()
            local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
            if atmosphere then
                atmosphere.Density = 0
                atmosphere.Haze = 0
                atmosphere.Glare = 0
                atmosphere.Offset = 0
            end
        end

        removeAtmosphere()
        fullBrightConnection = Lighting.ChildAdded:Connect(removeAtmosphere)
        fullBrightLoop = task.spawn(function()
            while fullBrightActive do
                removeAtmosphere()
                task.wait(0.5)
            end
        end)

        Rayfield:Notify({
            Title = "FullBright Activated!",
            Content = "Now you can see better!",
            Duration = 5,
        })
    end,
})

local MovimentTab = Window:CreateTab("ð Moviment")

local SprintSection = MovimentTab:CreateSection("Sprint")

local autoSprintActive = false
local autoSprintThread = nil

local ToggleAutoSprint = MovimentTab:CreateToggle({
    Name = "Auto Sprint",
    CurrentValue = false,
    Flag = "Toggle4",
    Callback = function(Value)
        if Value == autoSprintActive then return end
        autoSprintActive = Value

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
        if not Remotes then
            warn("Remotes folder not found.")
            return
        end
        local RemoteEvent = Remotes:FindFirstChild("RemoteEvent")
        if not RemoteEvent then
            warn("RemoteEvent not found.")
            return
        end

        if Value then
            autoSprintThread = task.spawn(function()
                while autoSprintActive do
                    pcall(function()
                        RemoteEvent:FireServer("Run")
                    end)
                    task.wait()
                end
            end)
        else
            if autoSprintThread then
                task.cancel(autoSprintThread)
                autoSprintThread = nil
            end
        end
    end,
})

local PanicSection = MovimentTab:CreateSection("Panic")

local PanicLabel = MovimentTab:CreateLabel(
    "Press the keybind to teleport to your storage.",
    nil,
    Color3.fromRGB(100, 200, 255),
    false
)

local panicEnabled = false
local TogglePanic = MovimentTab:CreateToggle({
    Name = "Enable Panic",
    CurrentValue = false,
    Flag = "Toggle5",
    Callback = function(Value)
        panicEnabled = Value
    end,
})

local PanicKeybind = MovimentTab:CreateKeybind({
    Name = "Panic Keybind",
    CurrentKeybind = "P",
    HoldToInteract = false,
    Flag = "Keybind1",
    Callback = function(Keybind)
        if not panicEnabled then
            return
        end

        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local HRP = Character:FindFirstChild("HumanoidRootPart")
        if not HRP then
            warn("HumanoidRootPart not found")
            return
        end

        local storages = workspace:FindFirstChild("Storages")
        if not storages then
            warn("Storages folder not found")
            return
        end

        local found = false
        for _, storage in ipairs(storages:GetChildren()) do
            local claimed = storage:FindFirstChild("ClaimedStorage")
            if claimed then
                local gui = claimed:FindFirstChild("Gui")
                local label = gui and gui:FindFirstChild("Label")
                if label and label:IsA("TextLabel") then
                    if label.Text:find(LocalPlayer.Name, 1, true) then
                        local floor = storage:FindFirstChild("Floor")
                        if floor then
                            HRP.CFrame = floor.CFrame + Vector3.new(0, 3, 0)
                            Rayfield:Notify({
                                Title = "Panic",
                                Content = "Teleported to your storage!",
                                Duration = 3,
                            })
                            found = true
                            break
                        end
                    end
                end
            end
        end

        if not found then
            Rayfield:Notify({
                Title = "Panic",
                Content = "No storage found with your name.",
                Duration = 3,
            })
        end
    end,
})

local MiscTab = Window:CreateTab("âï¸ Misc")

local AimSection = MiscTab:CreateSection("Aim")

local AimLabel = MiscTab:CreateLabel(
    "Aimbot only works against players.",
    nil,
    Color3.fromRGB(100, 200, 255),
    false
)

local aimbotActive = false
local aimbotConnection = nil

local ToggleAimbot = MiscTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Toggle6",
    Callback = function(Value)
        if Value == aimbotActive then return end
        aimbotActive = Value

        if Value then
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local UserInputService = game:GetService("UserInputService")
            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera

            local ACQUIRE_FOV = 20
            local RELEASE_FOV = 35
            local ANGLE_SWITCH_THRESHOLD = 3
            local SMOOTH_FACTOR = 0.2

            local HoldingMouse = false
            local currentTargetRoot = nil
            local RaycastParams = RaycastParams.new()
            RaycastParams.FilterType = Enum.RaycastFilterType.Blacklist

            local function getCharacter()
                return LocalPlayer.Character
            end

            local function hasValidWeapon()
                local character = getCharacter()
                if not character then return false end
                local tool = character:FindFirstChildOfClass("Tool")
                if not tool then return false end
                local validWeapons = {
                    ["Revolver"] = true,
                    ["Shotgun"] = true,
                    ["Double Barrel Shotgun"] = true,
                    ["SMG"] = true,
                    ["AK47"] = true,
                    ["Deagle"] = true,
                    ["Flamethrower"] = true,
                    ["LMG"] = true
                }
                return validWeapons[tool.Name] == true
            end

            local function isTargetVisible(targetRoot)
                local character = getCharacter()
                if not character then return false end
                local origin = Camera.CFrame.Position
                local targetPos = targetRoot.Position
                local direction = (targetPos - origin).Unit
                local distance = (targetPos - origin).Magnitude
                RaycastParams.FilterDescendantsInstances = {
                    character,
                    targetRoot.Parent
                }
                local result = workspace:Raycast(origin, direction * distance, RaycastParams)
                return result == nil
            end

            local function getTargetInfo(targetRoot)
                if not targetRoot or not targetRoot.Parent then return nil end
                local hum = targetRoot.Parent:FindFirstChild("Humanoid")
                if not hum or hum.Health <= 0 then return nil end
                local cameraPos = Camera.CFrame.Position
                local cameraLook = Camera.CFrame.LookVector
                local currentPos = targetRoot.Position
                local directionToTarget = (currentPos - cameraPos).Unit
                local dot = cameraLook:Dot(directionToTarget)
                local angle = math.acos(math.clamp(dot, -1, 1))
                local angleDeg = math.deg(angle)
                local distance = (currentPos - cameraPos).Magnitude
                return {
                    root = targetRoot,
                    angle = angle,
                    angleDeg = angleDeg,
                    distance = distance,
                    targetPos = currentPos
                }
            end

            local function isCurrentTargetValid()
                if not currentTargetRoot or not currentTargetRoot.Parent then return false end
                local info = getTargetInfo(currentTargetRoot)
                if not info then return false end
                if not isTargetVisible(currentTargetRoot) then return false end
                if info.angleDeg > RELEASE_FOV then return false end
                return true
            end

            local function findBestTarget()
                local bestInfo = nil
                local secondBestInfo = nil
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer then
                        local char = player.Character
                        if char then
                            local root = char:FindFirstChild("HumanoidRootPart")
                            if root then
                                local info = getTargetInfo(root)
                                if info and info.angleDeg <= ACQUIRE_FOV and isTargetVisible(root) then
                                    if not bestInfo or info.angle < bestInfo.angle then
                                        secondBestInfo = bestInfo
                                        bestInfo = info
                                    elseif not secondBestInfo or info.angle < secondBestInfo.angle then
                                        secondBestInfo = info
                                    end
                                end
                            end
                        end
                    end
                end
                if bestInfo and secondBestInfo then
                    local diff = math.abs(bestInfo.angleDeg - secondBestInfo.angleDeg)
                    if diff < ANGLE_SWITCH_THRESHOLD then
                        if secondBestInfo.distance < bestInfo.distance then
                            bestInfo = secondBestInfo
                        end
                    end
                end
                return bestInfo
            end

            local inputBeganConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
                if gameProcessed then return end
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    HoldingMouse = true
                    currentTargetRoot = nil
                end
            end)

            local inputEndedConnection = UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    HoldingMouse = false
                    currentTargetRoot = nil
                end
            end)

            aimbotConnection = RunService.RenderStepped:Connect(function()
                if not HoldingMouse then return end
                if not hasValidWeapon() then return end

                local targetInfo = nil
                if isCurrentTargetValid() then
                    targetInfo = getTargetInfo(currentTargetRoot)
                else
                    currentTargetRoot = nil
                    local newInfo = findBestTarget()
                    if newInfo then
                        currentTargetRoot = newInfo.root
                        targetInfo = newInfo
                    end
                end

                if targetInfo then
                    local targetCFrame = CFrame.lookAt(Camera.CFrame.Position, targetInfo.targetPos)
                    Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, SMOOTH_FACTOR)
                end
            end)

            _G.AimbotConnections = {
                inputBegan = inputBeganConnection,
                inputEnded = inputEndedConnection,
                render = aimbotConnection
            }
        else
            if _G.AimbotConnections then
                _G.AimbotConnections.inputBegan:Disconnect()
                _G.AimbotConnections.inputEnded:Disconnect()
                _G.AimbotConnections.render:Disconnect()
                _G.AimbotConnections = nil
            end
            if aimbotConnection then
                aimbotConnection:Disconnect()
                aimbotConnection = nil
            end
        end
    end,
})

local ItemsSection = MiscTab:CreateSection("Items")

local delayRemoved = false

local ButtonRemoveDelay = MiscTab:CreateButton({
    Name = "Remove Items Delay",
    Callback = function()
        if delayRemoved then
            Rayfield:Notify({
                Title = "Already Executed!",
                Content = "Items delay has already been removed.",
                Duration = 3,
            })
            return
        end

        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
            end
        end

        workspace.DescendantAdded:Connect(function(v)
            if v:IsA("ProximityPrompt") then
                v.HoldDuration = 0
            end
        end)

        delayRemoved = true

        Rayfield:Notify({
            Title = "Success!",
            Content = "Items delay removed successfully!",
            Duration = 3,
        })
    end,
})