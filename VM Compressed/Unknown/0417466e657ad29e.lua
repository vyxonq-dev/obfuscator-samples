local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/Test.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/addons/ThemeManagerCopy.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/Library/LinoriaLib/addons/SaveManagerCopy.lua"))()

local RunService = game:GetService("RunService")
local Cam = workspace.CurrentCamera

local Window = Library:CreateWindow({
    Title = "Brother's vow", -- Renamed as requested
    Center = true,
    AutoShow = true,
    Resizable = true,
    Footer = 'Item Collector Script',
	Icon = 125448486325517,
	AutoLock = true,
    ShowCustomCursor = true,
    NotifySide = "Right",
    TabPadding = 2,
    MenuFadeTime = 0
})

local MainTab = Window:AddTab('Main', 'rbxassetid://7734053426')
local SettingsTab = Window:AddTab('Settings', 'rbxassetid://6034175330')
local PlayerTab = Window:AddTab('Player', 'rbxassetid://4637953258')

local ItemCollectorGroup = MainTab:AddLeftGroupbox("Item Collector")
local OtherToolsGroup = MainTab:AddLeftGroupbox("Misc")
local ESPSettingsGroup = MainTab:AddRightGroupbox("ESP Settings")
local CollectionSettingsGroup = SettingsTab:AddLeftGroupbox("Collection Settings")
local MovementSettingsGroup = PlayerTab:AddLeftGroupbox("Movement")

local items = {
    "Tec9", "Revolver", "Shiv", "Bottle", "Medkit",
    "PrimaryAmmo", "SecondaryAmmo", 
    "Beans", "Candy Bar", "ShellsAmmo", "M1911", "DoubleBarrel"
}

local selectedItem = nil
local collecting = false

local collectTimeout = 5
local teleportDelay = 0.1
local firePPDelay = 0.1

local player = game.Players.LocalPlayer
local walkspeed = player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.WalkSpeed or 16
local jumpboost = player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player.Character.Humanoid.JumpPower or 50
local noclipEnabled = false

local playersEspEnabled = false
local enemyEspEnabled = false

-- Use tables to store Highlight instances, keyed by the character/model
local playerHighlights = {}
local enemyHighlights = {}

local ItemSelectDropdown = ItemCollectorGroup:AddDropdown('Select Item', {
    Text = 'Select Item',
    Values = items,
    Default = items[1] or 'Tec9',
    Multi = false,
    Callback = function(Value)
        selectedItem = Value
    end
})

CollectionSettingsGroup:AddInput('Collection Timeout', {
    Default = collectTimeout,
    Numeric = true,
    Text = 'Seconds to wait before error',
    Placeholder = 'Timeout in seconds',
    Callback = function(Value)
        collectTimeout = tonumber(Value) or collectTimeout
    end
})

CollectionSettingsGroup:AddInput('Teleport Delay', {
    Default = teleportDelay,
    Numeric = true,
    Text = 'Delay after teleport',
    Placeholder = 'Delay in seconds',
    Callback = function(Value)
        teleportDelay = tonumber(Value) or teleportDelay
    end
})

CollectionSettingsGroup:AddInput('Fire PP Delay', {
    Default = firePPDelay,
    Numeric = true,
    Text = 'Delay between firing proximity prompts',
    Placeholder = 'Delay in seconds',
    Callback = function(Value)
        firePPDelay = tonumber(Value) or firePPDelay
    end
})

MovementSettingsGroup:AddSlider('Walkspeed', {
    Min = 0, Max = 100, Default = walkspeed, Rounding = 1,
    Text = 'Set your character\'s walkspeed',
    Callback = function(Value)
        walkspeed = Value
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.WalkSpeed = walkspeed
        end
    end
})

MovementSettingsGroup:AddSlider('Jump Power', {
    Min = 0, Max = 100, Default = jumpboost, Rounding = 1,
    Text = 'Set your character\'s jump power',
    Callback = function(Value)
        jumpboost = Value
        if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
            player.Character.Humanoid.JumpPower = jumpboost
        end
    end
})

MovementSettingsGroup:AddToggle('Noclip', {
    Default = noclipEnabled,
    Text = 'Toggle noclip',
    Callback = function(state)
        noclipEnabled = state
        if player.Character then
            for _, part in ipairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = not state
                end
            end
        end
    end
})

ESPSettingsGroup:AddToggle('Players ESP', {
    Default = playersEspEnabled,
    Text = 'Highlight other players',
    Callback = function(state)
        playersEspEnabled = state
        if not state then
            -- Disable all existing player highlights when turned off
            for char, highlight in pairs(playerHighlights) do
                if highlight.Parent == char then -- Ensure it's still parented
                    highlight.Enabled = false
                end
            end
        end
    end
})

ESPSettingsGroup:AddToggle('Enemy ESP', {
    Default = enemyEspEnabled,
    Text = 'Highlight enemies',
    Callback = function(state)
        enemyEspEnabled = state
        if not state then
            -- Disable all existing enemy highlights when turned off
            for enemy, highlight in pairs(enemyHighlights) do
                if highlight.Parent == enemy then -- Ensure it's still parented
                    highlight.Enabled = false
                end
            end
        end
    end
})

local function getRoot(char)
    return char:FindFirstChild('HumanoidRootPart') or char:FindFirstChildWhichIsA('BasePart')
end

local function findAllParts(name)
    local foundParts = {}
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA('BasePart') and v.Name:lower() == name:lower() then
            table.insert(foundParts, v)
        end
    end
    return foundParts
end

local function firepp(targetPart)
    if fireproximityprompt and targetPart then
        local prompt = targetPart:FindFirstChildOfClass('ProximityPrompt')
        if prompt then
            fireproximityprompt(prompt)
            return true
        end
    else
        warn('Exploit does not support fireproximityprompt or targetPart is nil')
    end
    return false
end

ItemCollectorGroup:AddButton('Collect Selected Item', function()
    if collecting then
        Library:Notify('Already collecting an item. Please wait.', 3)
        return
    end

    if not selectedItem then
        Library:Notify('Please select an item first!', 3)
        return
    end

    collecting = true
    local char = player.Character
    if not char then
        Library:Notify('Your character is not available.', 3)
        collecting = false
        return
    end

    local root = getRoot(char)
    local savedPos = root.CFrame
    local itemCollected = false
    local startTime = tick()

    Library:Notify('Attempting to collect: ' .. selectedItem, 3)

    local initialPartsInWorld = findAllParts(selectedItem)

    if #initialPartsInWorld == 0 then
        Library:Notify('Item "' .. selectedItem .. '" not found in the game world.', 3)
        collecting = false
        return
    end

    while tick() - startTime < collectTimeout and not itemCollected do
        local partsCurrentlyInWorld = findAllParts(selectedItem)
        
        if #partsCurrentlyInWorld == 0 then
            itemCollected = true
            Library:Notify('Successfully collected all instances of: ' .. selectedItem, 3)
            break
        end

        for i, partToCollect in ipairs(partsCurrentlyInWorld) do
            if partToCollect and partToCollect.Parent and partToCollect:IsDescendantOf(workspace) then
                if player.Character:FindFirstChildOfClass('Humanoid').SeatPart then
                    player.Character:FindFirstChildOfClass('Humanoid').Sit = false
                    task.wait(teleportDelay)
                end
                root.CFrame = partToCollect.CFrame
                task.wait(teleportDelay)

                for j = 1, 5 do
                    firepp(partToCollect)
                    task.wait(firePPDelay)

                    if not partToCollect:IsDescendantOf(workspace) then
                        break 
                    end
                end
            end
            
            partsCurrentlyInWorld = findAllParts(selectedItem)
            if #partsCurrentlyInWorld == 0 then
                itemCollected = true
                Library:Notify('Successfully collected all instances of: ' .. selectedItem, 3)
                break
            end
            
            task.wait(teleportDelay)
        end

        if not itemCollected and #partsCurrentlyInWorld > 0 then
            task.wait(0.5) 
        end
    end

    if root and savedPos then
        root.CFrame = savedPos
    end
    
    if not itemCollected then
        Library:Notify('Error: Failed to collect all instances of ' .. selectedItem .. ' within ' .. collectTimeout .. ' seconds, or some items remained uncollectable.', 5)
    end

    collecting = false
end)

OtherToolsGroup:AddButton('Aimbot skidded', function()
    local fov = 136 
    local UserInputService = game:GetService("UserInputService") 

    local FOVring = Drawing.new("Circle") 
    FOVring.Visible = false 
    FOVring.Thickness = 2 
    FOVring.Color = Color3.fromRGB(128, 0, 128) 
    FOVring.Filled = false 
    FOVring.Radius = fov 
    FOVring.Position = Cam.ViewportSize / 2

    local isAiming = false

    local ScreenGui = Instance.new("ScreenGui") 
    ScreenGui.Parent = game.CoreGui

    local ToggleButton = Instance.new("TextButton") 
    ToggleButton.Size = UDim2.new(0, 120, 0, 40) 
    ToggleButton.Position = UDim2.new(0, 10, 0, 10) 
    ToggleButton.Text = "AIMBOT: OFF" 
    ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
    ToggleButton.TextColor3 = Color3.fromRGB(255, 50, 50) 
    ToggleButton.Font = Enum.Font.GothamBold 
    ToggleButton.TextSize = 14 
    ToggleButton.Parent = ScreenGui

    local function updateDrawings() 
        FOVring.Position = Cam.ViewportSize / 2 
        FOVring.Radius = fov * (Cam.ViewportSize.Y / 1080) 
    end

    local function aimAtTarget(targetPosition) 
        local currentCF = Cam.CFrame 
        local targetDirection = (targetPosition - currentCF.Position).Unit 
        local smoothFactor = 0.581 
        local newLookVector = currentCF.LookVector:Lerp(targetDirection, smoothFactor) 
        Cam.CFrame = CFrame.new(currentCF.Position, currentCF.Position + newLookVector) 
    end

    local function getTargetHeadPosition() 
        local closestPos = nil 
        local shortestDist = math.huge

        for _, enemy in ipairs(workspace:GetChildren()) do
            if enemy:IsA("Model") and enemy.Name == "Enemy" and enemy:FindFirstChild("Head") and enemy:FindFirstChild("Humanoid") then
                local humanoid = enemy.Humanoid
                if humanoid.Health > 0 then
                    local head = enemy.Head
                    local screenPos, onScreen = Cam:WorldToViewportPoint(head.Position)

                    if onScreen then
                        local dist = (Vector2.new(screenPos.X, screenPos.Y) - (Cam.ViewportSize / 2)).Magnitude
                        if dist <= fov and dist < shortestDist then
                            shortestDist = dist
                            closestPos = head.Position
                        end
                    end
                end
            end
        end
        return closestPos
    end

    RunService.Heartbeat:Connect(function() 
        updateDrawings() 
        if isAiming then 
            local targetPos = getTargetHeadPosition() 
            if targetPos then 
                aimAtTarget(targetPos) 
            end 
        end 
    end)

    ToggleButton.MouseButton1Click:Connect(function() 
        isAiming = not isAiming 
        FOVring.Visible = isAiming 
        ToggleButton.Text = "AIMBOT: " .. (isAiming and "ON" or "OFF") 
        ToggleButton.TextColor3 = isAiming and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50) 
    end)

    local dragging, dragInput, dragStart, startPos 
    local function update(input) 
        local delta = input.Position - dragStart 
        ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
    end

    ToggleButton.InputBegan:Connect(function(input) 
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
            dragging = true 
            dragStart = input.Position 
            startPos = ToggleButton.Position 
            input.Changed:Connect(function() 
                if input.UserInputState == Enum.UserInputState.End then 
                    dragging = false 
                end 
            end) 
        end 
    end)

    ToggleButton.InputChanged:Connect(function(input) 
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
            dragInput = input 
        end 
    end)

    UserInputService.InputChanged:Connect(function(input) 
        if input == dragInput and dragging then 
            update(input) 
        end 
    end)

    game:GetService("Players").PlayerRemoving:Connect(function() 
        FOVring:Remove() 
        ScreenGui:Destroy() 
    end)
end)

RunService.Heartbeat:Connect(function()
    -- Players ESP Management
    local activePlayers = {}
    if playersEspEnabled then
        for _, p in ipairs(game.Players:GetPlayers()) do
            if p ~= player and p.Character then
                local char = p.Character
                activePlayers[char] = true

                local highlight = playerHighlights[char]
                if not highlight or not highlight.Parent then
                    highlight = Instance.new("Highlight")
                    highlight.OutlineColor = Color3.fromRGB(0, 255, 0) -- Green outline
                    highlight.FillTransparency = 1 -- Invisible fill
                    highlight.Parent = char
                    playerHighlights[char] = highlight
                end
                highlight.Enabled = true
            end
        end
    end
    -- Disable highlights for players no longer active or when ESP is off
    for char, highlight in pairs(playerHighlights) do
        if not activePlayers[char] or not playersEspEnabled then
            if highlight.Parent == char then -- Ensure it's still parented to avoid errors on destroyed characters
                highlight.Enabled = false
            end
        end
    end

    -- Enemy ESP Management
    local activeEnemies = {}
    if enemyEspEnabled then
        for _, enemy in ipairs(workspace:GetChildren()) do
            if enemy:IsA("Model") and enemy.Name == "Enemy" and enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("Head") then
                local humanoid = enemy.Humanoid
                if humanoid.Health > 0 then
                    activeEnemies[enemy] = true

                    local highlight = enemyHighlights[enemy]
                    if not highlight or not highlight.Parent then
                        highlight = Instance.new("Highlight")
                        highlight.OutlineColor = Color3.fromRGB(255, 0, 0) -- Red outline
                        highlight.FillTransparency = 1 -- Invisible fill
                        highlight.Parent = enemy
                        enemyHighlights[enemy] = highlight
                    end
                    highlight.Enabled = true
                end
            end
        end
    end
    -- Disable highlights for enemies no longer active or when ESP is off
    for enemy, highlight in pairs(enemyHighlights) do
        if not activeEnemies[enemy] or not enemyEspEnabled then
            if highlight.Parent == enemy then -- Ensure it's still parented
                highlight.Enabled = false
            end
        end
    end
end)
