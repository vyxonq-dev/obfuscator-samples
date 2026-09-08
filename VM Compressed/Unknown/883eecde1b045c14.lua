--[[
    Universal Cheat Menu Template
    Features: Aimbot (Mouse/Camera), Trigger Bot, Advanced ESP, Hitbox Expander, Universal Flight
    Library: Rayfield
]]

-- Disable Rayfield console logging
getgenv().RayfieldConfig = {
    DisableDisplay = true,
    DisableBuildWarnings = true
}

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Universal Menu | v2.0",
   LoadingTitle = "Loading Josh Hub...",
   LoadingSubtitle = "by Joshthewizz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Joshthewizz",
      FileName = "UniversalConfig"
   }
})

-- // Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

-- // Settings State
local Settings = {
    -- Aimbot
    AimbotEnabled = false,
    AimbotMethod = "Camera", -- "Camera" or "Mouse"
    AimbotWallCheck = false,
    AimbotSmoothness = 1,
    AimbotFOV = 100,
    AimbotBind = Enum.UserInputType.MouseButton2,
    -- Trigger Bot
    TriggerBotEnabled = false,
    -- ESP
    ESPEnabled = false,
    ESPTracers = false,
    ESPNames = false,
    ESPFillColor = Color3.fromRGB(255, 0, 0),
    ESPOutlineColor = Color3.fromRGB(255, 255, 255),
    ESPFillTransparency = 0.5,
    -- Misc
    HitboxSize = 2,
    HitboxEnabled = false,
    HitboxTransparency = 0.7,
    -- Universal Features
    FlightEnabled = false,
    FlightSpeed = 50
}

local IsAimbotting = false

-- ESP Cache for Drawings
local ESP_Cache = {}

-- // FOV Circle
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Visible = false

-- // Tabs
local CombatTab = Window:CreateTab("Combat", 4483362458)
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
local WorldTab = Window:CreateTab("World", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- // COMBAT: Aimbot & Trigger Bot
CombatTab:CreateSection("Aimbot")

CombatTab:CreateToggle({
   Name = "Enable Aimbot",
   CurrentValue = false,
   Flag = "AimbotEnabled", 
   Callback = function(Value)
      Settings.AimbotEnabled = Value
      FOVCircle.Visible = Value
   end,
})

CombatTab:CreateDropdown({
   Name = "Aimbot Method",
   Options = {"Camera", "Mouse"},
   CurrentOption = "Camera",
   Flag = "AimbotMethod",
   Callback = function(Option)
      Settings.AimbotMethod = Option
   end,
})

CombatTab:CreateKeybind({
   Name = "Aimbot Bind",
   CurrentKeybind = "MouseButton2",
   HoldToInteract = true,
   Flag = "AimbotBind",
   Callback = function(Keybind)
      Settings.AimbotBind = Keybind
   end,
})

CombatTab:CreateToggle({
   Name = "Wall Check",
   CurrentValue = false,
   Flag = "WallCheck",
   Callback = function(Value)
      Settings.AimbotWallCheck = Value
   end,
})

CombatTab:CreateSlider({
   Name = "Aimbot FOV",
   Range = {0, 800},
   Increment = 10,
   CurrentValue = 100,
   Flag = "FOV",
   Callback = function(Value)
      Settings.AimbotFOV = Value
      FOVCircle.Radius = Value
   end,
})

CombatTab:CreateSection("Trigger Bot")

CombatTab:CreateToggle({
    Name = "Trigger Bot",
    CurrentValue = false,
    Flag = "TriggerBot",
    Callback = function(Value)
        Settings.TriggerBotEnabled = Value
    end,
})

CombatTab:CreateSection("Hitbox Expander")

CombatTab:CreateToggle({
   Name = "Enable Hitbox Expander",
   CurrentValue = false,
   Flag = "HitboxEnabled",
   Callback = function(Value)
      Settings.HitboxEnabled = Value
   end,
})

-- // VISUALS
VisualsTab:CreateSection("Main ESP")

VisualsTab:CreateToggle({
   Name = "Enable Highlights ESP",
   CurrentValue = false,
   Flag = "ESPMain",
   Callback = function(Value)
      Settings.ESPEnabled = Value
   end,
})

VisualsTab:CreateToggle({
   Name = "Show Tracers",
   CurrentValue = false,
   Flag = "ESPTracers",
   Callback = function(Value)
      Settings.ESPTracers = Value
   end,
})

VisualsTab:CreateToggle({
   Name = "Show Names",
   CurrentValue = false,
   Flag = "ESPNames",
   Callback = function(Value)
      Settings.ESPNames = Value
   end,
})

VisualsTab:CreateSection("Customization")

VisualsTab:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "ESPFillColor",
    Callback = function(Value)
        Settings.ESPFillColor = Value
    end
})

VisualsTab:CreateSlider({
   Name = "Fill Transparency",
   Range = {0, 1},
   Increment = 0.1,
   CurrentValue = 0.5,
   Flag = "ESPTrans",
   Callback = function(Value)
      Settings.ESPFillTransparency = Value
   end,
})

-- // WORLD
WorldTab:CreateSection("Universal Flight")

WorldTab:CreateToggle({
   Name = "Enable Flight",
   CurrentValue = false,
   Flag = "FlightEnabled",
   Callback = function(Value)
      Settings.FlightEnabled = Value
   end,
})

WorldTab:CreateSlider({
   Name = "Flight Speed",
   Range = {10, 300},
   Increment = 5,
   CurrentValue = 50,
   Flag = "FlightSpeed",
   Callback = function(Value)
      Settings.FlightSpeed = Value
   end,
})

-- // SETTINGS
SettingsTab:CreateSection("Config")

SettingsTab:CreateButton({
   Name = "Save Config",
   Callback = function()
      Rayfield:SaveConfiguration()
   end,
})

SettingsTab:CreateButton({
   Name = "Unload Script",
   Callback = function()
      pcall(function()
          FOVCircle:Destroy()
          for _, cache in pairs(ESP_Cache) do
              cache.Tracer:Remove()
              cache.Name:Remove()
          end
          Rayfield:Destroy()
      end)
   end,
})

-- // Internal Logic
local function IsVisible(TargetPart, TargetCharacter)
    if not Settings.AimbotWallCheck then return true end
    local Character = LocalPlayer.Character
    if not Character then return false end
    local Params = RaycastParams.new()
    Params.FilterType = Enum.RaycastFilterType.Exclude
    Params.FilterDescendantsInstances = {Character, Camera}
    local Result = workspace:Raycast(Camera.CFrame.Position, TargetPart.Position - Camera.CFrame.Position, Params)
    return Result and Result.Instance:IsDescendantOf(TargetCharacter) or not Result
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Settings.AimbotBind or input.KeyCode == Settings.AimbotBind then
        IsAimbotting = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Settings.AimbotBind or input.KeyCode == Settings.AimbotBind then
        IsAimbotting = false
    end
end)

-- Player Join/Leave logic for Drawing ESP
local function CreateESP(player)
    local tracer = Drawing.new("Line")
    tracer.Thickness = 1
    tracer.Visible = false
    
    local nameTag = Drawing.new("Text")
    nameTag.Size = 18
    nameTag.Center = true
    nameTag.Outline = true
    nameTag.Visible = false
    
    ESP_Cache[player] = {Tracer = tracer, Name = nameTag}
end

for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then CreateESP(p) end
end
Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(function(p)
    if ESP_Cache[p] then
        pcall(function()
            ESP_Cache[p].Tracer:Remove()
            ESP_Cache[p].Name:Remove()
        end)
        ESP_Cache[p] = nil
    end
end)

-- Silent Main Loop
RunService.RenderStepped:Connect(function(delta)
    pcall(function()
        if not FOVCircle then return end
        FOVCircle.Position = UserInputService:GetMouseLocation()
        
        -- Trigger Bot
        if Settings.TriggerBotEnabled then
            local target = Mouse.Target
            if target and target.Parent then
                local character = target.Parent:IsA("Model") and target.Parent or target.Parent.Parent
                local player = Players:GetPlayerFromCharacter(character)
                
                if player and player ~= LocalPlayer and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
                    mouse1click()
                end
            end
        end

        -- Aimbot Execution
        if Settings.AimbotEnabled and IsAimbotting then
            local closestPlayer = nil
            local shortestDistance = Settings.AimbotFOV
            
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    local head = player.Character.Head
                    local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen and IsVisible(head, player.Character) then
                        local dist = (Vector2.new(pos.X, pos.Y) - UserInputService:GetMouseLocation()).Magnitude
                        if dist < shortestDistance then
                            closestPlayer = player
                            shortestDistance = dist
                        end
                    end
                end
            end
            
            if closestPlayer then
                local headPos = closestPlayer.Character.Head.Position
                if Settings.AimbotMethod == "Camera" then
                    Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, headPos), 1 / Settings.AimbotSmoothness)
                else
                    local pos = Camera:WorldToViewportPoint(headPos)
                    if mousemoverel then
                        mousemoverel((pos.X - UserInputService:GetMouseLocation().X) / Settings.AimbotSmoothness, (pos.Y - UserInputService:GetMouseLocation().Y) / Settings.AimbotSmoothness)
                    end
                end
            end
        end

        -- Flight Logic
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") and Settings.FlightEnabled then
            local hrp = char.HumanoidRootPart
            hrp.Velocity = Vector3.new(0, 0, 0)
            local moveDir = Vector3.new(0, 0, 0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDir = moveDir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDir = moveDir - Vector3.new(0, 1, 0) end
            hrp.CFrame = hrp.CFrame + (moveDir * Settings.FlightSpeed * delta)
        end

        -- Hitbox & ESP Updates
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                -- Hitbox
                local head = player.Character:FindFirstChild("Head")
                if head then
                    head.Size = Settings.HitboxEnabled and Vector3.new(Settings.HitboxSize, Settings.HitboxSize, Settings.HitboxSize) or Vector3.new(1.2, 1.2, 1.2)
                    head.Transparency = Settings.HitboxEnabled and Settings.HitboxTransparency or 0
                end
                
                -- Highlights
                local highlight = player.Character:FindFirstChild("ESP_Highlight")
                if Settings.ESPEnabled then
                    if not highlight then
                        highlight = Instance.new("Highlight", player.Character)
                        highlight.Name = "ESP_Highlight"
                    end
                    highlight.FillColor = Settings.ESPFillColor
                    highlight.FillTransparency = Settings.ESPFillTransparency
                elseif highlight then
                    highlight:Destroy()
                end

                -- Drawing ESP (Tracers/Names)
                local cache = ESP_Cache[player]
                if cache and head then
                    local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    
                    if onScreen then
                        if Settings.ESPTracers then
                            cache.Tracer.Visible = true
                            cache.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                            cache.Tracer.To = Vector2.new(pos.X, pos.Y)
                            cache.Tracer.Color = Settings.ESPFillColor
                        else
                            cache.Tracer.Visible = false
                        end

                        if Settings.ESPNames then
                            cache.Name.Visible = true
                            cache.Name.Position = Vector2.new(pos.X, pos.Y - 30)
                            cache.Name.Text = player.Name
                            cache.Name.Color = Settings.ESPFillColor
                        else
                            cache.Name.Visible = false
                        end
                    else
                        cache.Tracer.Visible = false
                        cache.Name.Visible = false
                    end
                end
            end
        end
    end)
end)

Rayfield:LoadConfiguration()