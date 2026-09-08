-- Fixz Hub | Flick
-- Clean FPS script with Rayfield UI

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Fixz Hub | Flick",
   LoadingTitle = "Fixz Hub Loading",
   LoadingSubtitle = "by Fixz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FixzHub",
      FileName = "FlickConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = false
   },
   KeySystem = false,
   KeySettings = {
      Title = "Fixz Hub",
      Subtitle = "Key System",
      Note = "No Key Required",
      FileName = "Key",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {""}
   }
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Variables
local aimlockEnabled = false
local aimbotEnabled = false
local smoothAim = false
local aimPart = "Head"
local fovEnabled = false
local fovSize = 100
local fovCircle = nil
local smoothness = 0.4
local wallCheck = true
local targetPlayer = nil

local espEnabled = false
local espBoxes = {}
local espNames = {}
local espHealth = {}
local espDistance = {}

local xrayEnabled = false
local originalTransparencies = {}

-- Create FOV Circle
local function createFOVCircle()
    if fovCircle then fovCircle:Remove() end
    fovCircle = Drawing.new("Circle")
    fovCircle.Thickness = 2
    fovCircle.NumSides = 50
    fovCircle.Radius = fovSize
    fovCircle.Filled = false
    fovCircle.Transparency = 1
    fovCircle.Color = Color3.fromRGB(255, 255, 255)
    fovCircle.Visible = false
    fovCircle.ZIndex = 2
end

-- Update FOV Circle
local function updateFOVCircle()
    if fovCircle then
        local centerX = Camera.ViewportSize.X / 2
        local centerY = Camera.ViewportSize.Y / 2
        fovCircle.Position = Vector2.new(centerX, centerY)
        fovCircle.Radius = fovSize
        fovCircle.Visible = fovEnabled and (aimlockEnabled or aimbotEnabled)
    end
end

-- Get Closest Player to Crosshair
local function getClosestPlayerToCursor()
    local closestPlayer = nil
    local shortestDistance = fovEnabled and fovSize or math.huge
    local mousePos = UserInputService:GetMouseLocation()
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local targetPart = player.Character:FindFirstChild(aimPart)
                if targetPart then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(targetPart.Position)
                    
                    if onScreen then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                        
                        if wallCheck then
                            local ray = Ray.new(Camera.CFrame.Position, (targetPart.Position - Camera.CFrame.Position).Unit * 1000)
                            local hit, position = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character})
                            
                            if hit and hit:IsDescendantOf(player.Character) then
                                if distance < shortestDistance then
                                    closestPlayer = player
                                    shortestDistance = distance
                                end
                            end
                        else
                            if distance < shortestDistance then
                                closestPlayer = player
                                shortestDistance = distance
                            end
                        end
                    end
                end
            end
        end
    end
    
    return closestPlayer
end

-- Aimlock Function
local function aimlock()
    if not aimlockEnabled then return end
    
    local target = getClosestPlayerToCursor()
    if target and target.Character then
        local targetPart = target.Character:FindFirstChild(aimPart)
        if targetPart then
            local aimPosition = targetPart.Position
            local cameraPosition = Camera.CFrame.Position
            local direction = (aimPosition - cameraPosition).Unit
            
            if smoothAim then
                local targetCFrame = CFrame.new(cameraPosition, cameraPosition + direction)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, smoothness)
            else
                Camera.CFrame = CFrame.new(cameraPosition, cameraPosition + direction)
            end
        end
    end
end

-- Aimbot Function (Silent Aim)
local function aimbot()
    if not aimbotEnabled then return end
    
    local target = getClosestPlayerToCursor()
    if target then
        targetPlayer = target
    else
        targetPlayer = nil
    end
end

-- ESP Functions
local function createESP(player)
    if player == LocalPlayer then return end
    
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.fromRGB(255, 255, 255)
    box.Thickness = 2
    box.Transparency = 1
    box.Filled = false
    
    local name = Drawing.new("Text")
    name.Visible = false
    name.Center = true
    name.Outline = true
    name.Color = Color3.fromRGB(255, 255, 255)
    name.Size = 16
    name.Font = 2
    
    local health = Drawing.new("Text")
    health.Visible = false
    health.Center = true
    health.Outline = true
    health.Color = Color3.fromRGB(0, 255, 0)
    health.Size = 14
    health.Font = 2
    
    local distance = Drawing.new("Text")
    distance.Visible = false
    distance.Center = true
    distance.Outline = true
    distance.Color = Color3.fromRGB(255, 255, 255)
    distance.Size = 14
    distance.Font = 2
    
    espBoxes[player] = box
    espNames[player] = name
    espHealth[player] = health
    espDistance[player] = distance
end

local function removeESP(player)
    if espBoxes[player] then
        espBoxes[player]:Remove()
        espBoxes[player] = nil
    end
    if espNames[player] then
        espNames[player]:Remove()
        espNames[player] = nil
    end
    if espHealth[player] then
        espHealth[player]:Remove()
        espHealth[player] = nil
    end
    if espDistance[player] then
        espDistance[player]:Remove()
        espDistance[player] = nil
    end
end

local function updateESP()
    for player, box in pairs(espBoxes) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") then
            local hrp = player.Character.HumanoidRootPart
            local humanoid = player.Character.Humanoid
            local head = player.Character:FindFirstChild("Head")
            
            if humanoid.Health > 0 and head then
                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                
                if onScreen then
                    local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                    local legPos = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))
                    
                    local height = math.abs(headPos.Y - legPos.Y)
                    local width = height / 2
                    
                    box.Size = Vector2.new(width, height)
                    box.Position = Vector2.new(screenPos.X - width / 2, screenPos.Y - height / 2)
                    box.Visible = true
                    
                    local dist = (LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                    
                    espNames[player].Text = player.Name
                    espNames[player].Position = Vector2.new(screenPos.X, headPos.Y - 20)
                    espNames[player].Visible = true
                    
                    espHealth[player].Text = "HP: " .. math.floor(humanoid.Health)
                    espHealth[player].Position = Vector2.new(screenPos.X, legPos.Y + 5)
                    espHealth[player].Visible = true
                    
                    espDistance[player].Text = math.floor(dist) .. " studs"
                    espDistance[player].Position = Vector2.new(screenPos.X, legPos.Y + 20)
                    espDistance[player].Visible = true
                else
                    box.Visible = false
                    espNames[player].Visible = false
                    espHealth[player].Visible = false
                    espDistance[player].Visible = false
                end
            else
                box.Visible = false
                espNames[player].Visible = false
                espHealth[player].Visible = false
                espDistance[player].Visible = false
            end
        else
            box.Visible = false
            if espNames[player] then espNames[player].Visible = false end
            if espHealth[player] then espHealth[player].Visible = false end
            if espDistance[player] then espDistance[player].Visible = false end
        end
    end
end

-- X-Ray Function
local function toggleXRay(enabled)
    if enabled then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and not obj:IsDescendantOf(LocalPlayer.Character) then
                originalTransparencies[obj] = obj.Transparency
                obj.Transparency = 0.7
            end
        end
    else
        for obj, transparency in pairs(originalTransparencies) do
            if obj and obj.Parent then
                obj.Transparency = transparency
            end
        end
        originalTransparencies = {}
    end
end

-- Create Tabs
local CombatTab = Window:CreateTab("Combat", 4483362458)
local VisualsTab = Window:CreateTab("Visuals", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- Combat Section
local AimlockSection = CombatTab:CreateSection("Aimlock")

local AimlockToggle = CombatTab:CreateToggle({
   Name = "Enable Aimlock",
   CurrentValue = false,
   Flag = "AimlockToggle",
   Callback = function(Value)
      aimlockEnabled = Value
      createFOVCircle()
   end,
})

local SmoothAimToggle = CombatTab:CreateToggle({
   Name = "Smooth Aim",
   CurrentValue = false,
   Flag = "SmoothAimToggle",
   Callback = function(Value)
      smoothAim = Value
   end,
})

local SmoothnessSlider = CombatTab:CreateSlider({
   Name = "Smoothness",
   Range = {0.1, 1},
   Increment = 0.05,
   CurrentValue = 0.4,
   Flag = "SmoothnessSlider",
   Callback = function(Value)
      smoothness = Value
   end,
})

local WallCheckToggle = CombatTab:CreateToggle({
   Name = "Wall Check",
   CurrentValue = true,
   Flag = "WallCheckToggle",
   Callback = function(Value)
      wallCheck = Value
   end,
})

local AimPartDropdown = CombatTab:CreateDropdown({
   Name = "Target Body Part",
   Options = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart"},
   CurrentOption = {"Head"},
   MultipleOptions = false,
   Flag = "AimPartDropdown",
   Callback = function(Option)
      aimPart = Option[1]
   end,
})

local FOVSection = CombatTab:CreateSection("FOV Circle")

local FOVToggle = CombatTab:CreateToggle({
   Name = "Enable FOV",
   CurrentValue = false,
   Flag = "FOVToggle",
   Callback = function(Value)
      fovEnabled = Value
      createFOVCircle()
   end,
})

local FOVSlider = CombatTab:CreateSlider({
   Name = "FOV Size",
   Range = {50, 500},
   Increment = 10,
   CurrentValue = 100,
   Flag = "FOVSlider",
   Callback = function(Value)
      fovSize = Value
      if fovCircle then
         fovCircle.Radius = Value
      end
   end,
})

local FOVColorPicker = CombatTab:CreateColorPicker({
   Name = "FOV Color",
   Color = Color3.fromRGB(255, 255, 255),
   Flag = "FOVColor",
   Callback = function(Value)
      if fovCircle then
         fovCircle.Color = Value
      end
   end
})

local AimbotSection = CombatTab:CreateSection("Aimbot (Silent)")

local AimbotToggle = CombatTab:CreateToggle({
   Name = "Enable Aimbot",
   CurrentValue = false,
   Flag = "AimbotToggle",
   Callback = function(Value)
      aimbotEnabled = Value
   end,
})

-- Visuals Section
local ESPSection = VisualsTab:CreateSection("ESP")

local ESPToggle = VisualsTab:CreateToggle({
   Name = "Enable ESP",
   CurrentValue = false,
   Flag = "ESPToggle",
   Callback = function(Value)
      espEnabled = Value
      
      if Value then
         for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
               createESP(player)
            end
         end
         
         RunService:BindToRenderStep("UpdateESP", Enum.RenderPriority.Camera.Value + 1, updateESP)
      else
         RunService:UnbindFromRenderStep("UpdateESP")
         
         for player, _ in pairs(espBoxes) do
            removeESP(player)
         end
      end
   end,
})

local ESPColorPicker = VisualsTab:CreateColorPicker({
   Name = "ESP Color",
   Color = Color3.fromRGB(255, 255, 255),
   Flag = "ESPColor",
   Callback = function(Value)
      for _, box in pairs(espBoxes) do
         box.Color = Value
      end
      for _, name in pairs(espNames) do
         name.Color = Value
      end
      for _, dist in pairs(espDistance) do
         dist.Color = Value
      end
   end
})

local XRaySection = VisualsTab:CreateSection("X-Ray")

local XRayToggle = VisualsTab:CreateToggle({
   Name = "Enable X-Ray",
   CurrentValue = false,
   Flag = "XRayToggle",
   Callback = function(Value)
      xrayEnabled = Value
      toggleXRay(Value)
   end,
})

local XRaySlider = VisualsTab:CreateSlider({
   Name = "X-Ray Transparency",
   Range = {0, 1},
   Increment = 0.1,
   CurrentValue = 0.7,
   Flag = "XRayTransparency",
   Callback = function(Value)
      if xrayEnabled then
         for obj, _ in pairs(originalTransparencies) do
            if obj and obj.Parent then
               obj.Transparency = Value
            end
         end
      end
   end,
})

-- Settings Section
local InfoSection = SettingsTab:CreateSection("Info")

SettingsTab:CreateParagraph({
   Title = "Fixz Hub | Flick",
   Content = "A clean and simple FPS script for Flick.\n\nFeatures:\n- Aimlock with FOV\n- Silent Aimbot\n- ESP (Boxes, Names, Health, Distance)\n- X-Ray Vision\n\nCreated by Fixz"
})

local ControlsSection = SettingsTab:CreateSection("Controls")

SettingsTab:CreateKeybind({
   Name = "Toggle UI",
   CurrentKeybind = "RightShift",
   HoldToInteract = false,
   Flag = "UIKeybind",
   Callback = function(Keybind)
   end,
})

SettingsTab:CreateButton({
   Name = "Destroy GUI",
   Callback = function()
      Rayfield:Destroy()
   end,
})

-- Main Loop
RunService.RenderStepped:Connect(function()
    updateFOVCircle()
    aimlock()
    aimbot()
end)

-- Player Events
Players.PlayerAdded:Connect(function(player)
    if espEnabled and player ~= LocalPlayer then
        createESP(player)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

-- Notifications
Rayfield:Notify({
   Title = "Fixz Hub Loaded",
   Content = "Script loaded successfully!",
   Duration = 5,
   Image = 4483362458,
   Actions = {
      Ignore = {
         Name = "Okay",
         Callback = function()
         end
      },
   },
})