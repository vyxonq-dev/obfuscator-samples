local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "GEMINI HUB | RIVALS",
   LoadingTitle = "Neural Interface Loading...",
   ConfigurationSaving = {
      Enabled = true,
      Folder = "GeminiHub",
      FileName = "RivalsConfig"
   },
   Discord = {
      Enabled = true,
      Invite = "gemini-hub",
      RememberJoins = true
   },
   KeySystem = false,
   Theme = "Custom", -- Enable custom theme for neon effect
   CustomTheme = {
        MainColor = Color3.fromRGB(15, 15, 20), -- Deep Black
        AccentColor = Color3.fromRGB(190, 0, 255), -- Neon Purple
        BackgroundColor = Color3.fromRGB(10, 10, 12), -- Darker Black
        TextColor = Color3.fromRGB(255, 255, 255),
        PlaceholderColor = Color3.fromRGB(150, 150, 150),
        SectionColor = Color3.fromRGB(30, 30, 40),
        TopBarColor = Color3.fromRGB(20, 20, 25)
   }
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Mouse = LocalPlayer:GetMouse()

-- Variables
local combat = {
    aimbot = false,
    triggerbot = false,
    useFov = false,
    showFov = false,
    smoothness = 0.1,
    fov = 150,
    targetPart = "Head"
}

local visual = {
    boxes = false,
    tracers = false,
    names = false,
    espColor = Color3.fromRGB(190, 0, 255) -- Neon Purple
}

local misc = {
    walkspeed = 16,
    jumppower = 50,
    enabled = false
}

-- FOV Circle (Neon Style)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2.5
FOVCircle.Visible = false
FOVCircle.Color = Color3.fromRGB(190, 0, 255) -- Neon Purple
FOVCircle.Filled = false
FOVCircle.NumSides = 100
FOVCircle.Transparency = 1 -- Full brightness for neon look

-- ESP Storage
local esps = {}

local function createEsp(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = visual.espColor
    box.Thickness = 2
    box.Filled = false
    
    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = visual.espColor
    tracer.Thickness = 1.5
    
    esps[player] = {Box = box, Tracer = tracer}
end

local function removeEsp(player)
    if esps[player] then
        esps[player].Box:Remove()
        esps[player].Tracer:Remove()
        esps[player] = nil
    end
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then createEsp(player) end
end

Players.PlayerAdded:Connect(createEsp)
Players.PlayerRemoving:Connect(removeEsp)

-- Tabs with neon-consistent icons
local MainTab = Window:CreateTab("Dashboard", 4370345144)
local CombatTab = Window:CreateTab("Neural Aim", 7733960981)
local EspTab = Window:CreateTab("Visuals", 7733956118)
local MiscTab = Window:CreateTab("Utilities", 7734053495)

MainTab:CreateSection("System Status")
MainTab:CreateLabel("Core: Gemini Engine v2.0 [NEON]")
MainTab:CreateLabel("Status: Optimizing Performance...")

MainTab:CreateSection("Session Control")
MainTab:CreateButton({
   Name = "Deactivate Interface",
   Callback = function()
      Rayfield:Destroy()
   end,
})

MainTab:CreateButton({
   Name = "Join Community Hub",
   Callback = function()
      setclipboard("discord.gg/gemini")
   end,
})

CombatTab:CreateSection("Automated Combat Systems")

CombatTab:CreateToggle({
   Name = "Predictive Aimbot",
   CurrentValue = false,
   Callback = function(Value)
      combat.aimbot = Value
   end,
})

CombatTab:CreateSlider({
   Name = "Neural Smoothing",
   Range = {1, 30},
   Increment = 1,
   CurrentValue = 5,
   Callback = function(Value)
      combat.smoothness = 1 / Value
   end,
})

CombatTab:CreateSection("Assistance Tools")

CombatTab:CreateToggle({
   Name = "Auto-Trigger",
   CurrentValue = false,
   Callback = function(Value)
      combat.triggerbot = Value
   end,
})

CombatTab:CreateToggle({
   Name = "Constrain to FOV",
   CurrentValue = false,
   Callback = function(Value)
      combat.useFov = Value
   end,
})

CombatTab:CreateToggle({
   Name = "Visualize FOV",
   CurrentValue = false,
   Callback = function(Value)
      combat.showFov = Value
      FOVCircle.Visible = Value
   end,
})

CombatTab:CreateSlider({
   Name = "FOV Aperture",
   Range = {10, 800},
   Increment = 1,
   CurrentValue = 150,
   Callback = function(Value)
      combat.fov = Value
      FOVCircle.Radius = Value
   end,
})

EspTab:CreateSection("Enhanced Vision")

EspTab:CreateToggle({
   Name = "Frame Highlights (Box)",
   CurrentValue = false,
   Callback = function(Value)
      visual.boxes = Value
   end,
})

EspTab:CreateToggle({
   Name = "Target Vectors (Tracers)",
   CurrentValue = false,
   Callback = function(Value)
      visual.tracers = Value
   end,
})

EspTab:CreateColorPicker({
    Name = "Interface Color Theme",
    Color = Color3.fromRGB(190, 0, 255),
    Callback = function(Value)
        visual.espColor = Value
        FOVCircle.Color = Value
        for _, obj in pairs(esps) do
            obj.Box.Color = Value
            obj.Tracer.Color = Value
        end
    end
})

MiscTab:CreateSection("Physical Overrides")

MiscTab:CreateToggle({
   Name = "Enable Enhancements",
   CurrentValue = false,
   Callback = function(Value)
      misc.enabled = Value
   end,
})

MiscTab:CreateSlider({
   Name = "Neural Velocity (Walkspeed)",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      misc.walkspeed = Value
   end,
})

MiscTab:CreateSlider({
   Name = "Gravitational Impulse (Jump)",
   Range = {50, 200},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value)
      misc.jumppower = Value
   end,
})

MiscTab:CreateSection("Network Tools")

MiscTab:CreateButton({
   Name = "Synchronize New Server (Hop)",
   Callback = function()
      local servers = {}
      local success, result = pcall(function()
         return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100")).data
      end)
      if success then
         for _, v in pairs(result) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
               table.insert(servers, v.id)
            end
         end
         if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], LocalPlayer)
         else
            Rayfield:Notify({Title = "System Error", Content = "No suitable node found."})
         end
      end
   end,
})

MiscTab:CreateButton({
   Name = "Reconnect to Instance",
   Callback = function()
      TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
   end,
})

MiscTab:CreateButton({
   Name = "Inject Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

-- Helper Functions
local function getClosestPlayer()
    local target = nil
    local dist = combat.fov

    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild(combat.targetPart) and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            local screenPos, onScreen = Camera:WorldToViewportPoint(v.Character[combat.targetPart].Position)
            if onScreen then
                local mouseDist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if mouseDist < dist then
                    dist = mouseDist
                    target = v
                end
            end
        end
    end
    return target
end

-- Main Loop
RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    if combat.aimbot then
        local target = getClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(combat.targetPart) then
            local targetPart = target.Character[combat.targetPart]
            local targetPos = targetPart.Position
            
            if targetPart.Velocity.Magnitude > 0 then
                targetPos = targetPos + (targetPart.Velocity * 0.05)
            end
            
            local targetCFrame = CFrame.new(Camera.CFrame.Position, targetPos)
            Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, math.clamp(combat.smoothness * 2.5, 0, 0.98))
        end
    end

    if combat.triggerbot then
        local targetObj = Mouse.Target
        if targetObj and targetObj.Parent then
            local player = Players:GetPlayerFromCharacter(targetObj.Parent) or Players:GetPlayerFromCharacter(targetObj.Parent.Parent)
            
            if player and player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                local canShoot = true
                if combat.useFov then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(targetObj.Position)
                    local mouseDist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if not onScreen or mouseDist > combat.fov then
                        canShoot = false
                    end
                end
                if canShoot then mouse1click() end
            end
        end
    end

    if misc.enabled then
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = misc.walkspeed
                humanoid.JumpPower = misc.jumppower
                humanoid.UseJumpPower = true
            end
        end
    end

    for player, obj in pairs(esps) do
        local box = obj.Box
        local tracer = obj.Tracer
        
        if (visual.boxes or visual.tracers) and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
            local pos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            if onScreen then
                if visual.boxes then
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                        local legPos = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position - Vector3.new(0, 3, 0))
                        box.Size = Vector2.new(2000 / pos.Z, headPos.Y - legPos.Y)
                        box.Position = Vector2.new(pos.X - box.Size.X / 2, pos.Y - box.Size.Y / 2)
                        box.Visible = true
                    end
                else box.Visible = false end

                if visual.tracers then
                    tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    tracer.To = Vector2.new(pos.X, pos.Y)
                    tracer.Visible = true
                else tracer.Visible = false end
            else box.Visible = false tracer.Visible = false end
        else box.Visible = false tracer.Visible = false end
    end
end)

Rayfield:Notify({
   Title = "Gemini Hub Initialized",
   Content = "Neural Neon Systems Online.",
   Duration = 6,
   Image = 4483362458
})