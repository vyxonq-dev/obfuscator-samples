-- EXP0SE Hub - The Ultimate All-In-One Script
-- Made by Astral <3

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- Debug stuff
local debugMode = false
local function debugPrint(message)
    if debugMode then
        print("[DEBUG] " .. message)
    end
end

-- Variables
-- UI/Cursor
local customCursor = nil
-- ESP
local espEnabled = false
local espColor = Color3.fromRGB(255, 0, 0)
local selectedEspColor = Color3.fromRGB(255, 0, 0)
local espObjects = {}
local rainbowESP = false
local espTransparency = 0.5
local rainbowConnection = nil
local espHighlights = {}
-- Movement
local defaultWalkSpeed = 16
local defaultJumpPower = 50
local walkSpeedEnabled = false
local jumpPowerEnabled = false
local currentWalkSpeed = defaultWalkSpeed
local currentJumpPower = defaultJumpPower
-- Game stuff
local bypassEnabled = false
local attachedToBall = false
local ballAttachConnection = nil

-- Custom cursor functions
local function CreateCustomCursor()
    local cursor = Drawing.new("Circle")
    cursor.Radius = 5
    cursor.Filled = true
    cursor.Color = Color3.fromRGB(255, 255, 255)
    cursor.Transparency = 1
    cursor.ZIndex = 999
    cursor.Visible = true
    
    -- Update cursor position
    local connection = RunService.RenderStepped:Connect(function()
        local mousePos = UserInputService:GetMouseLocation()
        cursor.Position = Vector2.new(mousePos.X, mousePos.Y)
    end)
    
    -- Hide the default Roblox cursor
    UserInputService.MouseIconEnabled = false
    
    return {
        Cursor = cursor,
        Connection = connection,
        Remove = function(self)
            self.Cursor:Remove()
            self.Connection:Disconnect()
            UserInputService.MouseIconEnabled = true
        end
    }
end

local function EnableCustomCursor()
    if not customCursor then
        customCursor = CreateCustomCursor()
    end
end

local function DisableCustomCursor()
    if customCursor then
        customCursor:Remove()
        customCursor = nil
    end
end

-- ESP Functions
local function CreateESP(player)
    if player == LocalPlayer then return end
    
    local highlight = Instance.new("Highlight")
    highlight.FillColor = espColor
    highlight.OutlineColor = espColor
    highlight.FillTransparency = espTransparency
    highlight.OutlineTransparency = espTransparency - 0.2
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Enabled = espEnabled
    
    -- Add name billboard
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESPName"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Enabled = espEnabled
    
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.BackgroundTransparency = 1
    nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextColor3 = espColor
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    nameLabel.TextSize = 14
    nameLabel.Text = player.Name
    nameLabel.Parent = billboard
    
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Name = "DistanceLabel"
    distanceLabel.BackgroundTransparency = 1
    distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
    distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
    distanceLabel.Font = Enum.Font.SourceSans
    distanceLabel.TextColor3 = espColor
    distanceLabel.TextStrokeTransparency = 0
    distanceLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
    distanceLabel.TextSize = 12
    distanceLabel.Text = "0 studs"
    distanceLabel.Parent = billboard
    
    espHighlights[player] = {
        highlight = highlight,
        billboard = billboard,
        nameLabel = nameLabel,
        distanceLabel = distanceLabel
    }
    
    -- Apply to current character if it exists
    if player.Character then
        highlight.Parent = player.Character
        billboard.Parent = player.Character:FindFirstChild("Head") or player.Character.PrimaryPart
    end
end

local function UpdateESP()
    for player, esp in pairs(espHighlights) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and espEnabled then
            local hrp = player.Character.HumanoidRootPart
            
            -- Update ESP color (for rainbow effect)
            if rainbowESP then
                local hue = (tick() % 5) / 5
                local color = Color3.fromHSV(hue, 1, 1)
                esp.highlight.FillColor = color
                esp.highlight.OutlineColor = color
                esp.nameLabel.TextColor3 = color
                esp.distanceLabel.TextColor3 = color
            else
                esp.highlight.FillColor = espColor
                esp.highlight.OutlineColor = espColor
                esp.nameLabel.TextColor3 = espColor
                esp.distanceLabel.TextColor3 = espColor
            end
            
            -- Update transparency
            esp.highlight.FillTransparency = espTransparency
            esp.highlight.OutlineTransparency = math.max(0, espTransparency - 0.2)
            
            -- Update distance
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local distance = math.floor((LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude)
                esp.distanceLabel.Text = tostring(distance) .. " studs"
            end
            
            -- Make sure highlight is parented to character
            if esp.highlight.Parent ~= player.Character then
                esp.highlight.Parent = player.Character
            end
            
            -- Make sure billboard is parented to head or primary part
            local head = player.Character:FindFirstChild("Head")
            if head and esp.billboard.Parent ~= head then
                esp.billboard.Parent = head
            elseif esp.billboard.Parent == nil then
                esp.billboard.Parent = player.Character.PrimaryPart or hrp
            end
            
            -- Enable ESP elements
            esp.highlight.Enabled = true
            esp.billboard.Enabled = true
        else
            -- Disable ESP elements if character doesn't exist
            if esp.highlight then
                esp.highlight.Enabled = false
            end
            if esp.billboard then
                esp.billboard.Enabled = false
            end
        end
    end
end

local function EnableESP()
    espEnabled = true
    
    -- Create ESP for existing players
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and not espHighlights[player] then
            CreateESP(player)
        end
    end
    
    -- Connect update function
    if not espUpdateConnection then
        espUpdateConnection = RunService.RenderStepped:Connect(UpdateESP)
    end
    
    -- Enable all existing highlights
    for _, esp in pairs(espHighlights) do
        esp.highlight.Enabled = true
        esp.billboard.Enabled = true
    end
end

local function DisableESP()
    espEnabled = false
    
    -- Disable all highlights
    for _, esp in pairs(espHighlights) do
        esp.highlight.Enabled = false
        esp.billboard.Enabled = false
    end
    
    -- Disconnect update function
    if espUpdateConnection then
        espUpdateConnection:Disconnect()
        espUpdateConnection = nil
    end
end

-- Setting up the UI
debugPrint("Loading UI...")
local Window = Rayfield:CreateWindow({
    Name = "EXP0SE Hub All-In-One",
    LoadingTitle = "EXP0SE Hub Loading...",
    LoadingSubtitle = "by Astral",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "EXP0SEConfig",
        FileName = "EXP0SEAllInOneSettings"
    }
})

-- Tabs
debugPrint("Creating tabs...")
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
local MovementTab = Window:CreateTab("Movement", 4483362458)
local DisguiseTab = Window:CreateTab("Disguise", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- Disguise Tab Features
DisguiseTab:CreateToggle({
    Name = "Anti-Cheat Bypass",
    CurrentValue = bypassEnabled,
    Flag = "BypassToggle",
    Callback = function(Value)
        bypassEnabled = Value
        debugPrint("Anti-Cheat Bypass: " .. (Value and "Enabled" or "Disabled"))
    end
})

-- Visuals Tab Features
VisualsTab:CreateToggle({
    Name = "Custom Cursor",
    CurrentValue = false,
    Flag = "CursorToggle",
    Callback = function(Value)
        if Value then
            EnableCustomCursor()
        else
            DisableCustomCursor()
        end
        debugPrint("Custom Cursor: " .. (Value and "Enabled" or "Disabled"))
    end
})

VisualsTab:CreateToggle({
    Name = "ESP",
    CurrentValue = espEnabled,
    Flag = "ESPToggle",
    Callback = function(Value)
        if Value then
            EnableESP()
        else
            DisableESP()
        end
        debugPrint("ESP: " .. (Value and "Enabled" or "Disabled"))
    end
})

VisualsTab:CreateToggle({
    Name = "Rainbow ESP",
    CurrentValue = rainbowESP,
    Flag = "RainbowESPToggle",
    Callback = function(Value)
        rainbowESP = Value
        debugPrint("Rainbow ESP: " .. (Value and "Enabled" or "Disabled"))
    end
})

VisualsTab:CreateColorPicker({
    Name = "ESP Color",
    Color = espColor,
    Flag = "ESPColor",
    Callback = function(Value)
        espColor = Value
        selectedEspColor = Value
        debugPrint("ESP Color changed")
    end
})

VisualsTab:CreateSlider({
    Name = "ESP Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "",
    CurrentValue = espTransparency,
    Flag = "ESPTransparency",
    Callback = function(Value)
        espTransparency = Value
        debugPrint("ESP Transparency: " .. Value)
    end,
})

-- Movement Tab Features
MovementTab:CreateToggle({
    Name = "Speed Hack",
    CurrentValue = walkSpeedEnabled,
    Flag = "SpeedToggle",
    Callback = function(Value)
        walkSpeedEnabled = Value
        if Value then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = currentWalkSpeed
            end
        else
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = defaultWalkSpeed
            end
        end
        debugPrint("Speed Hack: " .. (Value and "Enabled" or "Disabled"))
    end
})

MovementTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "",
    CurrentValue = currentWalkSpeed,
    Flag = "WalkSpeedValue",
    Callback = function(Value)
        currentWalkSpeed = Value
        if walkSpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
        debugPrint("Walk Speed: " .. Value)
    end,
})

MovementTab:CreateToggle({
    Name = "Jump Power",
    CurrentValue = jumpPowerEnabled,
    Flag = "JumpToggle",
    Callback = function(Value)
        jumpPowerEnabled = Value
        if Value then
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.JumpPower = currentJumpPower
            end
        else
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.JumpPower = defaultJumpPower
            end
        end
        debugPrint("Jump Power: " .. (Value and "Enabled" or "Disabled"))
    end
})

MovementTab:CreateSlider({
    Name = "Jump Height",
    Range = {50, 300},
    Increment = 5,
    Suffix = "",
    CurrentValue = currentJumpPower,
    Flag = "JumpPowerValue",
    Callback = function(Value)
        currentJumpPower = Value
        if jumpPowerEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = Value
        end
        debugPrint("Jump Height: " .. Value)
    end,
})

-- Settings Tab Features
SettingsTab:CreateSection("User Interface")

SettingsTab:CreateToggle({
    Name = "Debug Mode",
    CurrentValue = debugMode,
    Flag = "DebugToggle",
    Callback = function(Value)
        debugMode = Value
        debugPrint("Debug Mode: " .. (Value and "Enabled" or "Disabled"))
    end
})

SettingsTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end
})

SettingsTab:CreateSection("Credits")

SettingsTab:CreateParagraph({
    Title = "Created By",
    Content = "Astral"
})

SettingsTab:CreateParagraph({
    Title = "Version",
    Content = "1.0.0 All-In-One"
})

-- Set up event handlers
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        CreateESP(player)
        
        -- Handle character added for new players
        player.CharacterAdded:Connect(function(character)
            if espHighlights[player] then
                espHighlights[player].highlight.Parent = character
                local head = character:WaitForChild("Head", 3)
                if head then
                    espHighlights[player].billboard.Parent = head
                else
                    espHighlights[player].billboard.Parent = character.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
                end
            end
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if espHighlights[player] then
        if espHighlights[player].highlight then
            espHighlights[player].highlight:Destroy()
        end
        if espHighlights[player].billboard then
            espHighlights[player].billboard:Destroy()
        end
        espHighlights[player] = nil
    end
end)

-- Character added event for maintaining speed/jump settings
LocalPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid")
    
    if walkSpeedEnabled then
        humanoid.WalkSpeed = currentWalkSpeed
    end
    
    if jumpPowerEnabled then
        humanoid.JumpPower = currentJumpPower
    end
end)

-- Initialize ESP for existing players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        CreateESP(player)
        
        -- Set up character added event for existing players
        player.CharacterAdded:Connect(function(character)
            if espHighlights[player] then
                espHighlights[player].highlight.Parent = character
                local head = character:WaitForChild("Head", 3)
                if head then
                    espHighlights[player].billboard.Parent = head
                else
                    espHighlights[player].billboard.Parent = character.PrimaryPart or character:FindFirstChild("HumanoidRootPart")
                end
            end
        end)
        
        -- Apply to existing characters
        if player.Character then
            if espHighlights[player] then
                espHighlights[player].highlight.Parent = player.Character
                local head = player.Character:FindFirstChild("Head")
                if head then
                    espHighlights[player].billboard.Parent = head
                else
                    espHighlights[player].billboard.Parent = player.Character.PrimaryPart or player.Character:FindFirstChild("HumanoidRootPart")
                end
            end
        end
    end
end

-- Show success notification
Rayfield:Notify({
    Title = "EXP0SE Hub",
    Content = "Version 1.0.0 loaded successfully!",
    Duration = 3,
    Image = 4483362458
})

debugPrint("EXP0SE Hub loaded successfully!")

-- your welcome pookie wookies