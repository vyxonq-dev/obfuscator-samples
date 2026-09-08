local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Noctalis Universal',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local Tabs = {
    Main = Window:AddTab('Main'),
    Visuals = Window:AddTab('Visuals'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

local MovementGroup = Tabs.Main:AddLeftGroupbox('Movement')
local PhysicsGroup = Tabs.Main:AddRightGroupbox('Physics')
local TeleportGroup = Tabs.Main:AddLeftGroupbox('Teleport')

local movement = {
    InfiniteJump = false,
    Speed = 16,
    JumpPower = 50,
    Noclip = false,
    Fly = false,
    FlySpeed = 50
}

local function updateMovement()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = movement.Speed
        character.Humanoid.JumpPower = movement.JumpPower
    end
end

local InfiniteJumpToggle = MovementGroup:AddToggle('InfiniteJump', {
    Text = 'Infinite Jump',
    Default = false,
    Tooltip = 'Enable infinite jumping',
    Callback = function(value)
        movement.InfiniteJump = value
    end
})

local SpeedSlider = MovementGroup:AddSlider('WalkSpeed', {
    Text = 'Walk Speed',
    Default = 16,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        movement.Speed = value
        updateMovement()
    end
})

local JumpPowerSlider = MovementGroup:AddSlider('JumpPower', {
    Text = 'Jump Power',
    Default = 50,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        movement.JumpPower = value
        updateMovement()
    end
})

local NoclipToggle = MovementGroup:AddToggle('Noclip', {
    Text = 'Noclip',
    Default = false,
    Tooltip = 'Walk through walls',
    Callback = function(value)
        movement.Noclip = value
    end
})

local FlyToggle = MovementGroup:AddToggle('Fly', {
    Text = 'Fly Mode',
    Default = false,
    Tooltip = 'Enable flying',
    Callback = function(value)
        movement.Fly = value
        if value then 
            startFlying() 
        else
            if flyConnection then 
                flyConnection:Disconnect() 
                flyConnection = nil
            end
            local character = game.Players.LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local bodyVelocity = character.HumanoidRootPart:FindFirstChildOfClass("BodyVelocity")
                if bodyVelocity then
                    bodyVelocity:Destroy()
                end
            end
        end
    end
})

local FlySpeedSlider = MovementGroup:AddSlider('FlySpeed', {
    Text = 'Fly Speed',
    Default = 50,
    Min = 0,
    Max = 200,
    Rounding = 1,
    Callback = function(value)
        movement.FlySpeed = value
    end
})

PhysicsGroup:AddSlider('Gravity', {
    Text = 'Gravity',
    Default = 196.2,
    Min = 0,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        workspace.Gravity = value
    end
})

PhysicsGroup:AddToggle('AntiRagdoll', {
    Text = 'Anti Ragdoll',
    Default = false,
    Tooltip = 'Prevent ragdoll effects',
    Callback = function(value)
        if value then
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BallSocketConstraint") or part:IsA("HingeConstraint") then
                    part:Destroy()
                end
            end
        end
    end
})

local players = {}
for _, player in ipairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        table.insert(players, player.Name)
    end
end

local PlayerDropdown = TeleportGroup:AddDropdown('PlayerList', {
    Text = 'Players',
    Default = players[1] or "",
    Values = players,
    Callback = function(value) end
})

TeleportGroup:AddButton('Teleport to Player', function()
    local selectedPlayer = PlayerDropdown.Value
    local target = game.Players[selectedPlayer]
    
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        game.Players.LocalPlayer.Character:MoveTo(target.Character.HumanoidRootPart.Position)
    end
end)

local ClickTPToggle = TeleportGroup:AddToggle('ClickTP', {
    Text = 'Click Teleport',
    Default = false,
    Tooltip = 'Teleport to clicked location',
    Callback = function(value)
        if value then
            local connection
            connection = game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
                if input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessed then
                    local ray = workspace:ScreenPointToRay(input.Position.X, input.Position.Y)
                    local part, position = workspace:FindPartOnRay(ray, game.Players.LocalPlayer.Character)
                    
                    if part then
                        game.Players.LocalPlayer.Character:MoveTo(position)
                    end
                end
            end)
            table.insert(connections, connection)
        else
            for _, conn in pairs(connections) do
                conn:Disconnect()
            end
            connections = {}
        end
    end
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local ReachsGroup = Tabs.Main:AddRightGroupbox('Reach')
local ReachConnection
local CurrentReachDistance = 5

local ReachSlider = ReachsGroup:AddSlider('ReachDistance', {
    Text = 'Reach Distance',
    Default = 5,
    Min = 1,
    Max = 50,
    Rounding = 1,
    Callback = function(value)
        CurrentReachDistance = value
    end
})

local ReachToggle = ReachsGroup:AddToggle('ReachToggle', {
    Text = 'Reach',
    Default = false,
    Tooltip = 'Enable/Disable Reach with custom distance',
    Callback = function(enabled)
        if enabled then
            ReachBox = Instance.new("Part")
            ReachBox.Size = Vector3.new(10, 10, 10)
            ReachBox.Transparency = 0.5
            ReachBox.Anchored = true
            ReachBox.CanCollide = false
            ReachBox.Color = Color3.fromRGB(255, 0, 0)
            ReachBox.Material = Enum.Material.ForceField
            ReachBox.Name = "ReachBox"
            ReachBox.Parent = workspace

            ReachConnection = RunService.RenderStepped:Connect(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local hrp = char.HumanoidRootPart
                    ReachBox.CFrame = hrp.CFrame * CFrame.new(0, 0, -CurrentReachDistance)
                end
            end)
        else
            if ReachBox then
                ReachBox:Destroy()
                ReachBox = nil
            end
            if ReachConnection then
                ReachConnection:Disconnect()
                ReachConnection = nil
            end
        end
    end
})

local VisualsGroup = Tabs.Visuals:AddLeftGroupbox('ESP Settings')
local EffectsGroup = Tabs.Visuals:AddRightGroupbox('Visual Effects')

local espSettings = {
    Enabled = false,
    Box = true,
    Name = true,
    Health = true,
    Distance = true,
    TeamColor = true,
    TeamCheck = false,
    Fill = false,
    Tracers = false,
    Font = 2,
    Size = 13,
    BoxColor = Color3.fromRGB(255, 255, 255),
    TeamColors = {
        Friendly = Color3.fromRGB(0, 255, 0),
        Enemy = Color3.fromRGB(255, 0, 0)
    }
}

local espObjects = {}
local connections = {}

local function createESP(player)
    if player == game.Players.LocalPlayer then return end
    
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    
    local esp = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        Health = Drawing.new("Text"),
        Distance = Drawing.new("Text"),
        Tracer = Drawing.new("Line"),
        Fill = Drawing.new("Square"),
        Player = player,
        Character = character
    }
    
    esp.Box.Visible = false
    esp.Box.Color = espSettings.BoxColor
    esp.Box.Thickness = 1
    esp.Box.Filled = false
    
    esp.Name.Visible = false
    esp.Name.Color = Color3.new(1, 1, 1)
    esp.Name.Size = espSettings.Size
    esp.Name.Center = true
    esp.Name.Outline = true
    esp.Name.Font = espSettings.Font
    esp.Name.Text = player.Name
    
    esp.Health.Visible = false
    esp.Health.Size = espSettings.Size
    esp.Health.Center = true
    esp.Health.Outline = true
    esp.Health.Font = espSettings.Font
    
    esp.Distance.Visible = false
    esp.Distance.Size = espSettings.Size
    esp.Distance.Center = true
    esp.Distance.Outline = true
    esp.Distance.Font = espSettings.Font
    
    esp.Tracer.Visible = false
    esp.Tracer.Color = Color3.new(1, 1, 1)
    esp.Tracer.Thickness = 1
    
    esp.Fill.Visible = false
    esp.Fill.Transparency = 0.3
    esp.Fill.Color = Color3.new(0, 0, 0)
    esp.Fill.Filled = true
    
    espObjects[player] = esp
    
    local function updateESP()
        if not espSettings.Enabled or not character or not humanoidRootPart or not humanoid or not humanoidRootPart:IsDescendantOf(workspace) then
            for _, drawing in pairs(esp) do
                if typeof(drawing) == "table" and drawing.Visible then
                    drawing.Visible = false
                end
            end
            return
        end
        
        local localPlayer = game.Players.LocalPlayer
        local localCharacter = localPlayer.Character
        local camera = workspace.CurrentCamera
        
        if not localCharacter then return end
        
        local localRoot = localCharacter:FindFirstChild("HumanoidRootPart")
        if not localRoot then return end
        
        local rootPos, onScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)
        if not onScreen then
            for _, drawing in pairs(esp) do
                if typeof(drawing) == "table" and drawing.Visible then
                    drawing.Visible = false
                end
            end
            return
        end
        
        local boxSize = Vector2.new(math.floor(50 * (1 / rootPos.Z)), math.floor(60 * (1 / rootPos.Z)))
        local boxPosition = Vector2.new(math.floor(rootPos.X - boxSize.X / 2), math.floor(rootPos.Y - boxSize.Y / 2))
        
        local teamColor = espSettings.BoxColor
        if espSettings.TeamColor then
            if player.Team == localPlayer.Team then
                teamColor = espSettings.TeamColors.Friendly
            else
                teamColor = espSettings.TeamColors.Enemy
            end
        end
        
        if espSettings.Box then
            esp.Box.Size = boxSize
            esp.Box.Position = boxPosition
            esp.Box.Color = teamColor
            esp.Box.Visible = true
        else
            esp.Box.Visible = false
        end
        
        if espSettings.Fill then
            esp.Fill.Size = boxSize
            esp.Fill.Position = boxPosition
            esp.Fill.Color = teamColor
            esp.Fill.Visible = true
        else
            esp.Fill.Visible = false
        end
        
        if espSettings.Name then
            esp.Name.Position = Vector2.new(boxPosition.X + boxSize.X / 2, boxPosition.Y - esp.Name.TextBounds.Y - 2)
            esp.Name.Visible = true
        else
            esp.Name.Visible = false
        end
        
        if espSettings.Health then
            esp.Health.Text = string.format("%d/%d", humanoid.Health, humanoid.MaxHealth)
            esp.Health.Position = Vector2.new(boxPosition.X + boxSize.X / 2, boxPosition.Y + boxSize.Y + 2)
            
            local healthPercentage = humanoid.Health / humanoid.MaxHealth
            esp.Health.Color = Color3.new(1 - healthPercentage, healthPercentage, 0)
            esp.Health.Visible = true
        else
            esp.Health.Visible = false
        end
        
        if espSettings.Distance then
            local distance = (localRoot.Position - humanoidRootPart.Position).Magnitude
            esp.Distance.Text = string.format("%.1fm", distance)
            esp.Distance.Position = Vector2.new(boxPosition.X + boxSize.X / 2, boxPosition.Y + boxSize.Y + esp.Health.TextBounds.Y + 4)
            esp.Distance.Visible = true
        else
            esp.Distance.Visible = false
        end
        
        if espSettings.Tracers then
            esp.Tracer.From = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y)
            esp.Tracer.To = Vector2.new(rootPos.X, rootPos.Y)
            esp.Tracer.Color = teamColor
            esp.Tracer.Visible = true
        else
            esp.Tracer.Visible = false
        end
    end
    
    table.insert(connections, game:GetService("RunService").RenderStepped:Connect(updateESP))
end

local function removeESP(player)
    if espObjects[player] then
        for _, drawing in pairs(espObjects[player]) do
            if typeof(drawing) == "table" and drawing.Remove then
                drawing:Remove()
            end
        end
        espObjects[player] = nil
    end
end

local function toggleESP(state)
    espSettings.Enabled = state
    if state then
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                createESP(player)
            end
        end
        
        table.insert(connections, game.Players.PlayerAdded:Connect(function(player)
            createESP(player)
        end))
        
        table.insert(connections, game.Players.PlayerRemoving:Connect(function(player)
            removeESP(player)
        end))
    else
        for _, connection in ipairs(connections) do
            connection:Disconnect()
        end
        connections = {}
        
        for player, esp in pairs(espObjects) do
            removeESP(player)
        end
    end
end

local ESPEnabledToggle = VisualsGroup:AddToggle('ESPEnabled', {
    Text = 'ESP Enabled',
    Default = false,
    Tooltip = 'Enable/Disable ESP',
    Callback = function(value)
        toggleESP(value)
    end
})

local ESPBoxToggle = VisualsGroup:AddToggle('ESPBox', {
    Text = 'Box ESP',
    Default = true,
    Tooltip = 'Show box around players',
    Callback = function(value)
        espSettings.Box = value
    end
})

local ESPNameToggle = VisualsGroup:AddToggle('ESPName', {
    Text = 'Name ESP',
    Default = true,
    Tooltip = 'Show player names',
    Callback = function(value)
        espSettings.Name = value
    end
})

local ESPHealthToggle = VisualsGroup:AddToggle('ESPHealth', {
    Text = 'Health ESP',
    Default = true,
    Tooltip = 'Show player health',
    Callback = function(value)
        espSettings.Health = value
    end
})

local ESPDistanceToggle = VisualsGroup:AddToggle('ESPDistance', {
    Text = 'Distance ESP',
    Default = true,
    Tooltip = 'Show distance to players',
    Callback = function(value)
        espSettings.Distance = value
    end
})

local ESPTracersToggle = VisualsGroup:AddToggle('ESPTracers', {
    Text = 'Tracers',
    Default = false,
    Tooltip = 'Show lines to players',
    Callback = function(value)
        espSettings.Tracers = value
    end
})

local ESPFillToggle = VisualsGroup:AddToggle('ESPFill', {
    Text = 'Fill Box',
    Default = false,
    Tooltip = 'Fill ESP box',
    Callback = function(value)
        espSettings.Fill = value
    end
})

local ESPTeamColorToggle = VisualsGroup:AddToggle('ESPTeamColor', {
    Text = 'Team Colors',
    Default = true,
    Tooltip = 'Use team colors for ESP',
    Callback = function(value)
        espSettings.TeamColor = value
    end
})

local ESPTeamCheckToggle = VisualsGroup:AddToggle('ESPTeamCheck', {
    Text = 'Team Check',
    Default = false,
    Tooltip = 'Only show enemy ESP',
    Callback = function(value)
        espSettings.TeamCheck = value
    end
})

local ESPFontSizeSlider = VisualsGroup:AddSlider('ESPFontSize', {
    Text = 'Font Size',
    Default = 13,
    Min = 8,
    Max = 24,
    Rounding = 1,
    Callback = function(value)
        espSettings.Size = value
    end
})

local FullbrightToggle = EffectsGroup:AddToggle('Fullbright', {
    Text = 'Fullbright',
    Default = false,
    Tooltip = 'Enable fullbright mode',
    Callback = function(value)
        if value then
            game.Lighting.GlobalShadows = false
            game.Lighting.Brightness = 2
        else
            game.Lighting.GlobalShadows = true
            game.Lighting.Brightness = 1
        end
    end
})

local NoFogToggle = EffectsGroup:AddToggle('NoFog', {
    Text = 'Remove Fog',
    Default = false,
    Tooltip = 'Disables atmospheric fog',
    Callback = function(value)
        if value then
            game.Lighting.FogEnd = 9e9
        else
            game.Lighting.FogEnd = game.Lighting:GetAttribute("OriginalFogEnd") or 10000
        end
    end
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if movement.InfiniteJump and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if movement.Noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

local flyConnection
local function startFlying()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
    bodyVelocity.Parent = character:FindFirstChild("HumanoidRootPart")
    
    flyConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if not movement.Fly or not character:FindFirstChild("HumanoidRootPart") then
            if flyConnection then flyConnection:Disconnect() end
            if bodyVelocity then bodyVelocity:Destroy() end
            return
        end
        
        local root = character.HumanoidRootPart
        local cam = workspace.CurrentCamera.CFrame
        
        local flyDirection = Vector3.new()
        
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
            flyDirection = flyDirection + cam.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
            flyDirection = flyDirection - cam.LookVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
            flyDirection = flyDirection + cam.RightVector
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
            flyDirection = flyDirection - cam.RightVector
        end
        
        flyDirection = flyDirection.Unit * movement.FlySpeed
        
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
            flyDirection = flyDirection + Vector3.new(0, movement.FlySpeed/2, 0)
        end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
            flyDirection = flyDirection - Vector3.new(0, movement.FlySpeed/2, 0)
        end
        
        bodyVelocity.Velocity = flyDirection
    end)
end

if not game.Lighting:GetAttribute("OriginalFogEnd") then
    game.Lighting:SetAttribute("OriginalFogEnd", game.Lighting.FogEnd)
end

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end) 
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'Insert', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings() 

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

ThemeManager:SetFolder('MyScriptHub')
SaveManager:SetFolder('MyScriptHub/specific-game')

SaveManager:BuildConfigSection(Tabs['UI Settings']) 

ThemeManager:ApplyToTab(Tabs['UI Settings'])
