-- Fixz Hub | Arsenal 🔫
-- Made By Fixz 64

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Utility
local function clamp(v, a, b)
    if v < a then return a elseif v > b then return b else return v end
end

-- State & Settings
local State = {
    ESP = false,
    ESP_TeamCheck = false,
    Aimbot = false,
    AimTeamCheck = false,
    SilentAim = false
}

local Settings = {
    AimFOV = 200,
    AimDist = 1200,
    AimSmooth = 25
}

-- ===== ESP System =====
local highlights = {}

local function ensureHighlightForPlayer(p)
    if highlights[p] and highlights[p].Instance and highlights[p].Instance.Parent then return end
    if not p.Character then return end
    
    local hl = Instance.new("Highlight")
    hl.Name = "FixzESP_" .. p.Name
    hl.Adornee = p.Character
    hl.FillColor = Color3.fromRGB(255, 100, 100)
    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
    hl.FillTransparency = 0.6
    hl.Enabled = false
    
    pcall(function()
        hl.Parent = game.CoreGui
    end)
    
    highlights[p] = {Instance = hl}
end

local function removeHighlightForPlayer(p)
    local data = highlights[p]
    if data and data.Instance then
        pcall(function() data.Instance:Destroy() end)
    end
    highlights[p] = nil
end

local function updateHighlightsState()
    for p, data in pairs(highlights) do
        if data and data.Instance then
            if p and p.Character then
                data.Instance.Adornee = p.Character
            end
            local ok = p and p.Character and (not State.ESP_TeamCheck or (p.Team ~= LocalPlayer.Team))
            data.Instance.Enabled = State.ESP and ok and p ~= LocalPlayer
        end
    end
end

-- Player events
Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(char)
        task.wait(1)
        ensureHighlightForPlayer(p)
        updateHighlightsState()
    end)
    task.delay(0.2, function() ensureHighlightForPlayer(p) end)
end)

Players.PlayerRemoving:Connect(function(p)
    removeHighlightForPlayer(p)
end)

for _, p in ipairs(Players:GetPlayers()) do
    ensureHighlightForPlayer(p)
end

-- ===== Aimbot System =====
local SilentTarget = nil

local function makeRayParams()
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.IgnoreWater = true
    return params
end

local function findClosestEnemy()
    local closest = nil
    local shortest = Settings.AimFOV
    local params = makeRayParams()
    
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
            if (not State.AimTeamCheck) or (not plr.Team) or (not LocalPlayer.Team) or (plr.Team ~= LocalPlayer.Team) then
                local head = plr.Character.Head
                local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                
                if onScreen then
                    local dist2D = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    
                    if dist2D < shortest then
                        local worldDist = (head.Position - Camera.CFrame.Position).Magnitude
                        
                        if worldDist <= Settings.AimDist then
                            local ray = Workspace:Raycast(Camera.CFrame.Position, (head.Position - Camera.CFrame.Position).Unit * Settings.AimDist, params)
                            
                            if ray and ray.Instance and ray.Instance:IsDescendantOf(plr.Character) then
                                shortest = dist2D
                                closest = plr
                            end
                        end
                    end
                end
            end
        end
    end
    
    return closest
end

-- Aimbot Loop
task.spawn(function()
    while true do
        if State.Aimbot then
            local target = findClosestEnemy()
            if target and target.Character and target.Character:FindFirstChild("Head") then
                local headPos = target.Character.Head.Position
                local desired = CFrame.new(Camera.CFrame.Position, headPos)
                local aimSpeed = clamp((Settings.AimSmooth/100), 0.01, 1)
                Camera.CFrame = Camera.CFrame:Lerp(desired, aimSpeed)
                
                if State.SilentAim then
                    SilentTarget = target
                else
                    SilentTarget = nil
                end
            else
                SilentTarget = nil
                task.wait(0.03)
            end
        else
            SilentTarget = nil
            task.wait(0.08)
        end
        task.wait()
    end
end)

-- ESP Update Loop
RunService.RenderStepped:Connect(function()
    pcall(updateHighlightsState)
end)

-- Cleanup
Players.PlayerRemoving:Connect(function(plr)
    removeHighlightForPlayer(plr)
end)

LocalPlayer.CharacterRemoving:Connect(function()
    for k, _ in pairs(highlights) do
        removeHighlightForPlayer(k)
    end
end)

-- ===== Rayfield UI with Key System =====
local Window = Rayfield:CreateWindow({
    Name = "Fixz Hub | Arsenal 🔫",
    LoadingTitle = "Fixz Hub",
    LoadingSubtitle = "Made By Fixz 64",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FixzHub",
        FileName = "ArsenalConfig"
    },
    Discord = {
        Enabled = true,
        Invite = "CDyrbSY8Gx",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Fixz Hub Key System",
        Subtitle = "Enter Key",
        Note = "Join Discord to get key: https://discord.gg/CDyrbSY8Gx",
        FileName = "FixzHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Fixz2025"}
    }
})

-- Tabs
local TabESP = Window:CreateTab("ESP", 4483362458)
local TabAimbot = Window:CreateTab("Aimbot", 4483362458)
local TabSettings = Window:CreateTab("Settings", 4483362458)

TabESP:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "ESP_Toggle",
    Callback = function(Value)
        State.ESP = Value
        updateHighlightsState()
    end,
})

TabESP:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Flag = "ESP_Team",
    Callback = function(Value)
        State.ESP_TeamCheck = Value
        updateHighlightsState()
    end,
})

-- Aimbot Tab
local TabAimbot = Window:CreateTab("Aimbot", 4483362458)

TabAimbot:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Flag = "Aimbot_Toggle",
    Callback = function(Value)
        State.Aimbot = Value
    end,
})

TabAimbot:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "Silent_Toggle",
    Callback = function(Value)
        State.SilentAim = Value
    end,
})

TabAimbot:CreateToggle({
    Name = "Team Check",
    CurrentValue = false,
    Flag = "Aimbot_Team",
    Callback = function(Value)
        State.AimTeamCheck = Value
    end,
})

TabAimbot:CreateSlider({
    Name = "FOV",
    Range = {50, 600},
    Increment = 5,
    CurrentValue = 200,
    Flag = "FOV_Slider",
    Callback = function(Value)
        Settings.AimFOV = Value
    end,
})

TabAimbot:CreateSlider({
    Name = "Distance",
    Range = {200, 5000},
    Increment = 50,
    CurrentValue = 1200,
    Flag = "Dist_Slider",
    Callback = function(Value)
        Settings.AimDist = Value
    end,
})

TabAimbot:CreateSlider({
    Name = "Smoothness",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 25,
    Flag = "Smooth_Slider",
    Callback = function(Value)
        Settings.AimSmooth = Value
    end,
})

Rayfield:LoadConfiguration()

print("Fixz Hub | Arsenal 🔫 loaded successfully!")