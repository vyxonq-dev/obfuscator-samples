-- Load Kavo UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Create Main Window
local Window = Library.CreateLib(".gg/aKWn23Bcm5", "DarkTheme")

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("PlaceBlock")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Player setup
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

-- Available blocks (add more as needed)
local AvailableBlocks = {
    "Oak Log",
    "Grass Block",
    "Stone",
    "Cobblestone",
    "Brick",
    "Glass",
    "Sand",
    "Gravel",
    "Planks",
    "Wool",
    "Gold Block",
    "Iron Block",
    "Diamond Block",
    "Emerald Block",
    "Redstone Block",
    "Lapis Block",
    "Quartz Block",
    "Concrete",
    "Terracotta"
}

-- Block type mappings (adjust based on your game)
local BlockTypeMap = {
    ["Oak Log"] = "1Grass",
    ["Grass Block"] = "1Grass",
    ["Stone"] = "1Stone",
    ["Cobblestone"] = "1Cobblestone",
    ["Brick"] = "1Brick",
    ["Glass"] = "1Glass",
    ["Sand"] = "1Sand",
    ["Gravel"] = "1Gravel",
    ["Planks"] = "1WoodPlanks",
    ["Wool"] = "1Wool",
    ["Gold Block"] = "1Gold",
    ["Iron Block"] = "1Iron",
    ["Diamond Block"] = "1Diamond"
}

-- Configuration with ZERO delay by default
local BuilderConfig = {
    selectedBlock = "Oak Log",
    blockType = "1Grass",
    material = Enum.NormalId.Top,
    delay = 0, -- ZERO DELAY - fastest placement
    previewEnabled = true,
    previewTransparency = 0.7,
    previewColor = Color3.fromRGB(255, 255, 255),
    isPlacing = false,
    fillSize = 5,
    maxFillSize = 50, -- Increased from 10 to 50
    showFillPreview = false,
    fillPreview = nil,
    customFillSize = 10 -- User can input custom values
}

-- Preview parts storage
local previewParts = {}
local fillPreviewParts = {}

-- ====================
-- PREVIEW SYSTEM
-- ====================
local function createPreviewPart(position, size)
    local part = Instance.new("Part")
    part.Name = "BlockPreview"
    part.Size = Vector3.new(size, size, size)
    part.Position = position
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = BuilderConfig.previewTransparency
    part.Color = BuilderConfig.previewColor
    part.Material = Enum.Material.Neon
    part.CastShadow = false
    
    local highlight = Instance.new("SelectionBox")
    highlight.Adornee = part
    highlight.Color3 = BuilderConfig.previewColor
    highlight.Parent = part
    
    part.Parent = workspace
    return part
end

local function clearPreviews()
    for _, part in ipairs(previewParts) do
        if part then
            part:Destroy()
        end
    end
    previewParts = {}
end

local function clearFillPreview()
    if BuilderConfig.fillPreview then
        BuilderConfig.fillPreview:Destroy()
        BuilderConfig.fillPreview = nil
    end
    for _, part in ipairs(fillPreviewParts) do
        if part then
            part:Destroy()
        end
    end
    fillPreviewParts = {}
end

-- ====================
-- BLOCK PLACEMENT (ZERO DELAY)
-- ====================
local function placeBlock(position)
    local args = {
        workspace:WaitForChild(BuilderConfig.blockType),
        BuilderConfig.material,
        position,
        BuilderConfig.selectedBlock
    }
    remote:FireServer(unpack(args))
end

local function placeBlockInstantly(position)
    -- Use spawn for instant placement without delays
    task.spawn(function()
        placeBlock(position)
    end)
end

local function updateSelectedBlock(blockName)
    BuilderConfig.selectedBlock = blockName
    BuilderConfig.blockType = BlockTypeMap[blockName] or "1Grass"
    
    if BuilderConfig.previewEnabled then
        local colorMap = {
            ["Oak Log"] = Color3.fromRGB(139, 69, 19),
            ["Grass Block"] = Color3.fromRGB(100, 200, 100),
            ["Stone"] = Color3.fromRGB(128, 128, 128),
            ["Brick"] = Color3.fromRGB(178, 34, 34),
            ["Glass"] = Color3.fromRGB(173, 216, 230),
            ["Gold Block"] = Color3.fromRGB(255, 215, 0),
            ["Iron Block"] = Color3.fromRGB(200, 200, 200),
            ["Diamond Block"] = Color3.fromRGB(0, 255, 255),
            ["Emerald Block"] = Color3.fromRGB(0, 200, 0),
            ["Redstone Block"] = Color3.fromRGB(255, 0, 0)
        }
        
        BuilderConfig.previewColor = colorMap[blockName] or Color3.fromRGB(255, 255, 255)
    end
end

-- ====================
-- ADVANCED FILL SYSTEM (CUSTOM SIZES)
-- ====================
local function showFillPreview(position, size)
    clearFillPreview()
    
    if not BuilderConfig.previewEnabled or not BuilderConfig.showFillPreview then return end
    
    -- Clamp size to prevent crashes
    local clampedSize = math.clamp(size, 1, BuilderConfig.maxFillSize)
    if clampedSize > 20 then
        -- Large previews use simpler visualization
        local preview = createPreviewPart(position, clampedSize * 4)
        preview.Transparency = 0.85
        preview.Color = Color3.fromRGB(0, 200, 255)
        table.insert(fillPreviewParts, preview)
        return
    end
    
    local halfSize = math.floor(clampedSize / 2)
    local startPos = Vector3.new(
        math.floor(position.X / 4) * 4,
        math.floor(position.Y / 4) * 4,
        math.floor(position.Z / 4) * 4
    )
    
    -- Create fill volume preview (optimized for large sizes)
    for x = -halfSize, halfSize do
        for y = -halfSize, halfSize do
            for z = -halfSize, halfSize do
                local blockPos = Vector3.new(
                    startPos.X + (x * 4),
                    startPos.Y + (y * 4),
                    startPos.Z + (z * 4)
                )
                
                local preview = createPreviewPart(blockPos, 4)
                preview.Transparency = 0.8
                preview.Color = Color3.fromRGB(0, 200, 255)
                table.insert(fillPreviewParts, preview)
            end
        end
    end
end

local function fillArea(position, size)
    if BuilderConfig.isPlacing then return end
    BuilderConfig.isPlacing = true
    clearFillPreview()
    
    -- Clamp and validate size
    local clampedSize = math.clamp(size, 1, BuilderConfig.maxFillSize)
    
    -- Warning for large fills
    if clampedSize > 15 then
        print("⚠️ Large fill detected: " .. clampedSize .. "x" .. clampedSize .. "x" .. clampedSize)
        print("Total blocks: " .. ((clampedSize * 2 + 1) ^ 3))
    end
    
    local halfSize = math.floor(clampedSize / 2)
    local startPos = Vector3.new(
        math.floor(position.X / 4) * 4,
        math.floor(position.Y / 4) * 4,
        math.floor(position.Z / 4) * 4
    )
    
    local totalBlocks = (clampedSize * 2 + 1) ^ 3
    print("Starting fill: " .. totalBlocks .. " blocks...")
    
    -- Optimized placement with task.spawn for zero delay
    local tasks = {}
    
    for x = -halfSize, halfSize do
        for y = -halfSize, halfSize do
            for z = -halfSize, halfSize do
                local blockPos = Vector3.new(
                    startPos.X + (x * 4),
                    startPos.Y + (y * 4),
                    startPos.Z + (z * 4)
                )
                
                -- Use task.spawn for instant placement
                table.insert(tasks, task.spawn(function()
                    placeBlockInstantly(blockPos)
                end))
            end
        end
    end
    
    BuilderConfig.isPlacing = false
    print("✓ Fill complete! Placed " .. totalBlocks .. " blocks instantly")
end

-- ====================
-- REAL-TIME PREVIEW
-- ====================
local previewConnection
local function startPreviewSystem()
    if previewConnection then
        previewConnection:Disconnect()
    end
    
    if not BuilderConfig.previewEnabled then return end
    
    previewConnection = RunService.Heartbeat:Connect(function()
        if BuilderConfig.isPlacing then return end
        
        local lookVector = humanoidRootPart.CFrame.LookVector
        local previewDistance = 12
        local previewPos = humanoidRootPart.Position + (lookVector * previewDistance)
        
        previewPos = Vector3.new(
            math.floor(previewPos.X / 4) * 4 + 2,
            math.floor(previewPos.Y / 4) * 4 + 2,
            math.floor(previewPos.Z / 4) * 4 + 2
        )
        
        clearPreviews()
        
        local preview = createPreviewPart(previewPos, 4)
        preview.Color = BuilderConfig.previewColor
        table.insert(previewParts, preview)
        
        if BuilderConfig.showFillPreview then
            showFillPreview(previewPos, BuilderConfig.fillSize)
        end
    end)
end

-- ====================
-- KAVO UI CREATION
-- ====================

-- Block Selection Tab
local BlockTab = Window:NewTab("Block Selection")
local BlockSection = BlockTab:NewSection("Choose Block Type")

-- Create block buttons with colors
for _, blockName in ipairs(AvailableBlocks) do
    BlockSection:NewButton(blockName, "Select " .. blockName, function()
        updateSelectedBlock(blockName)
        print("Selected: " .. blockName)
    end)
end

BlockSection:NewLabel("Current: " .. BuilderConfig.selectedBlock)

-- Instant Build Tab (removed delay settings)
local BuildTab = Window:NewTab("Instant Build")
local BuildSection = BuildTab:NewSection("Zero-Delay Building")

BuildSection:NewButton("Place Block", "Instant placement at cursor", function()
    local lookVector = humanoidRootPart.CFrame.LookVector
    local placePos = humanoidRootPart.Position + (lookVector * 10)
    placePos = Vector3.new(
        math.floor(placePos.X / 4) * 4 + 2,
        math.floor(placePos.Y / 4) * 4 + 2,
        math.floor(placePos.Z / 4) * 4 + 2
    )
    
    placeBlockInstantly(placePos)
end)

BuildSection:NewButton("Instant 10x10 Platform", "Create platform instantly", function()
    if BuilderConfig.isPlacing then return end
    BuilderConfig.isPlacing = true
    
    local startPos = humanoidRootPart.Position
    local halfSize = 5
    
    for x = -halfSize, halfSize do
        for z = -halfSize, halfSize do
            local pos = Vector3.new(
                startPos.X + (x * 8),
                startPos.Y - 5,
                startPos.Z + (z * 8)
            )
            placeBlockInstantly(pos)
        end
    end
    
    BuilderConfig.isPlacing = false
    print("Platform created instantly!")
end)

-- Enhanced Fill Tool Tab
local FillTab = Window:NewTab("Fill Tool")
local FillSection = FillTab:NewSection("Custom Size Filling")

-- Custom fill size input
FillSection:NewTextBox("Custom Fill Size", "Enter size (1-" .. BuilderConfig.maxFillSize .. ")", function(txt)
    local size = tonumber(txt)
    if size and size > 0 then
        local clampedSize = math.clamp(size, 1, BuilderConfig.maxFillSize)
        BuilderConfig.fillSize = clampedSize
        BuilderConfig.customFillSize = clampedSize
        print("Fill size set to: " .. clampedSize)
    end
end)

-- Fill size presets
FillSection:NewButton("Small (3x3x3)", "Quick small fill", function()
    BuilderConfig.fillSize = 3
    BuilderConfig.customFillSize = 3
end)

FillSection:NewButton("Medium (7x7x7)", "Medium fill", function()
    BuilderConfig.fillSize = 7
    BuilderConfig.customFillSize = 7
end)

FillSection:NewButton("Large (15x15x15)", "Large fill", function()
    BuilderConfig.fillSize = 15
    BuilderConfig.customFillSize = 15
end)

FillSection:NewButton("Massive (25x25x25)", "Very large fill", function()
    BuilderConfig.fillSize = 25
    BuilderConfig.customFillSize = 25
end)

FillSection:NewToggle("Show Fill Preview", "Preview fill area", function(state)
    BuilderConfig.showFillPreview = state
    if not state then
        clearFillPreview()
    end
end)

FillSection:NewButton("Fill at Cursor", "Fill where you're looking", function()
    local lookVector = humanoidRootPart.CFrame.LookVector
    local fillPos = humanoidRootPart.Position + (lookVector * 15)
    fillArea(fillPos, BuilderConfig.fillSize)
end)

FillSection:NewButton("Fill Below", "Fill area below player", function()
    local playerPos = humanoidRootPart.Position
    fillArea(Vector3.new(playerPos.X, playerPos.Y - 8, playerPos.Z), BuilderConfig.fillSize)
end)

FillSection:NewButton("Fill Around", "Fill area around player", function()
    local playerPos = humanoidRootPart.Position
    fillArea(playerPos, BuilderConfig.fillSize)
end)

-- Preview Settings Tab
local PreviewTab = Window:NewTab("Preview")
local PreviewSection = PreviewTab:NewSection("Visual Settings")

PreviewSection:NewToggle("Enable Preview", "Show placement preview", function(state)
    BuilderConfig.previewEnabled = state
    if state then
        startPreviewSystem()
    else
        clearPreviews()
        clearFillPreview()
        if previewConnection then
            previewConnection:Disconnect()
            previewConnection = nil
        end
    end
end)

PreviewSection:NewSlider("Preview Transparency", "", 90, 30, function(value)
    BuilderConfig.previewTransparency = value / 100
end)

-- Keybinds Tab
local KeyTab = Window:NewTab("Keybinds")
local KeySection = KeyTab:NewSection("Instant Controls")

KeySection:NewKeybind("INSTANT Place", "Place block instantly", Enum.KeyCode.E, function()
    local lookVector = humanoidRootPart.CFrame.LookVector
    local placePos = humanoidRootPart.Position + (lookVector * 10)
    placePos = Vector3.new(
        math.floor(placePos.X / 4) * 4 + 2,
        math.floor(placePos.Y / 4) * 4 + 2,
        math.floor(placePos.Z / 4) * 4 + 2
    )
    
    placeBlockInstantly(placePos)
end)

KeySection:NewKeybind("INSTANT Fill", "Quick fill at cursor", Enum.KeyCode.F, function()
    local lookVector = humanoidRootPart.CFrame.LookVector
    local fillPos = humanoidRootPart.Position + (lookVector * 15)
    fillArea(fillPos, BuilderConfig.customFillSize)
end)

KeySection:NewKeybind("Toggle UI", "Show/Hide GUI", Enum.KeyCode.RightShift, function()
    Window:ToggleUI()
end)

KeySection:NewKeybind("Cycle Block", "Cycle through blocks", Enum.KeyCode.Q, function()
    local currentIndex = table.find(AvailableBlocks, BuilderConfig.selectedBlock) or 1
    local nextIndex = (currentIndex % #AvailableBlocks) + 1
    updateSelectedBlock(AvailableBlocks[nextIndex])
    print("Cycled to: " .. AvailableBlocks[nextIndex])
end)

-- Utilities Tab
local UtilTab = Window:NewTab("Utilities")
local UtilSection = UtilTab:NewSection("Tools")

UtilSection:NewButton("Clear All Previews", "Remove previews", function()
    clearPreviews()
    clearFillPreview()
end)

UtilSection:NewButton("Emergency Stop", "Stop all placement", function()
    BuilderConfig.isPlacing = false
    clearPreviews()
    clearFillPreview()
end)

UtilSection:NewLabel("Settings Info:")
UtilSection:NewLabel("Delay: 0ms (Instant)")
UtilSection:NewLabel("Max Fill Size: " .. BuilderConfig.maxFillSize)

-- ====================
-- INITIALIZATION
-- ====================
print("=================================")
print("ULTIMATE BLOCK BUILDER LOADED")
print("=================================")
print("Features:")
print("• ZERO DELAY placement")
print("• " .. #AvailableBlocks .. " blocks available")
print("• Custom fill sizes up to " .. BuilderConfig.maxFillSize)
print("• Instant keybinds (E, F, Q)")
print("• Visual preview system")
print("=================================")

-- Start systems
startPreviewSystem()

-- Cleanup
game:GetService("Players").PlayerRemoving:Connect(function(leavingPlayer)
    if leavingPlayer == player then
        clearPreviews()
        clearFillPreview()
        if previewConnection then
            previewConnection:Disconnect()
        end
    end
end)

-- Auto-set fill size to custom value
BuilderConfig.fillSize = BuilderConfig.customFillSize
print("Auto-configured: Delay=0ms, Fill Size=" .. BuilderConfig.customFillSize)