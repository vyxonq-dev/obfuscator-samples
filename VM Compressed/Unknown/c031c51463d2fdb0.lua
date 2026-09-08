--====================================================
-- Prison Life TP HUB+  (Rayfield Full Integrated Version)
--====================================================

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Prison Life TP HUB+",
    LoadingTitle = "Prison Life TP HUB+",
    LoadingSubtitle = "Made by @tp",
    ConfigurationSaving = { Enabled = false }
})

--====================================================
-- Create Tabs
--====================================================

local AIMTab   = Window:CreateTab("AIMBOT")
local ESPTab   = Window:CreateTab("ESP")
local TPTab    = Window:CreateTab("TELEPORT")
local GunTab   = Window:CreateTab("GUN BOOST")
local JumpTab  = Window:CreateTab("INFINITE JUMP")
local TaserTab = Window:CreateTab("TASER RESIST")

--====================================================
-- Basic Variables
--====================================================

local player = game.Players.LocalPlayer
local cam = workspace.CurrentCamera

local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid")

local AimbotEnabled = false
local ESPEnabled = false
local ESP3DEnabled = false
local infJumpEnabled = false
local AntiTaserEnabled = false

local AimPart = "Head"
local FOV = 120
local Smoothness = 0.25
local WallCheck = true

local targetTeamName = "Guards" -- Prison Life police team name

--====================================================
-- Rainbow Function
--====================================================

local function rainbow()
    return Color3.fromHSV((tick() % 5) / 5, 1, 1)
end

--====================================================
-- FOV Circle
--====================================================

local Circle = Drawing.new("Circle")
Circle.Thickness = 2
Circle.NumSides = 100
Circle.Visible = false
Circle.Radius = FOV * (300/200)
Circle.Filled = false

--====================================================
-- AIMBOT GUI
--====================================================

AIMTab:CreateToggle({
    Name = "AIMBOT",
    CurrentValue = false,
    Callback = function(v)
        AimbotEnabled = v
        Circle.Visible = v
    end
})

AIMTab:CreateToggle({
    Name = "Disable Aim Through Walls (WallCheck)",
    CurrentValue = true,
    Callback = function(v)
        WallCheck = v
    end
})

AIMTab:CreateSlider({
    Name = "FOV Size",
    Range = {50, 300},
    Increment = 5,
    CurrentValue = 120,
    Callback = function(v)
        FOV = v
        Circle.Radius = v * (300/200)
    end
})

AIMTab:CreateSlider({
    Name = "Aim Smoothness",
    Range = {0.05, 1},
    Increment = 0.05,
    CurrentValue = 0.25,
    Callback = function(v)
        Smoothness = v
    end
})

--====================================================
-- ESP GUI
--====================================================

ESPTab:CreateToggle({
    Name = "ESP (Guards Only)",
    CurrentValue = false,
    Callback = function(v)
        ESPEnabled = v
    end
})

ESPTab:CreateToggle({
    Name = "3D ESP (Rainbow Outline)",
    CurrentValue = false,
    Callback = function(v)
        ESP3DEnabled = v
    end
})

--====================================================
-- TELEPORT GUI
--====================================================

local function addTP(name, pos)
    TPTab:CreateButton({
        Name = name,
        Callback = function()
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(pos)
            end
        end
    })
end

addTP("AK-47", Vector3.new(-936.25, 97, 2034.75))
addTP("Police Office", Vector3.new(813.64, 99.98, 2222.8))
addTP("Criminal Area", Vector3.new(-974.03, 108.32, 2059.43))
addTP("Tower", Vector3.new(821.95, 125.84, 2586.53))

--====================================================
-- INFINITE JUMP
--====================================================

JumpTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(v)
        infJumpEnabled = v
    end
})

--====================================================
-- TASER RESIST
--====================================================

TaserTab:CreateToggle({
    Name = "Taser Resistance (No Ragdoll)",
    CurrentValue = false,
    Callback = function(v)
        AntiTaserEnabled = v
        Rayfield:Notify({
            Title = "Taser Resistance",
            Content = (v and "Enabled" or "Disabled"),
            Duration = 2
        })
    end
})

--====================================================
-- AK-47 Infinite Ammo
--====================================================

GunTab:CreateButton({
    Name = "AK-47 Infinite Ammo",
    Callback = function()
        local function monitor(tool)
            if tool.Name == "AK-47" then
                task.spawn(function()
                    while tool.Parent == player.Backpack or tool.Parent == player.Character do
                        local ammo = tool:FindFirstChild("Ammo")
                            or tool:FindFirstChild("GunSettings")
                            and tool.GunSettings:FindFirstChild("Ammo")
                        if ammo then ammo.Value = 999999 end
                        task.wait(0.1)
                    end
                end)
            end
        end

        player.Backpack.ChildAdded:Connect(monitor)
        if player.Character then
            player.Character.ChildAdded:Connect(monitor)
        end

        Rayfield:Notify({
            Title = "Gun Boost",
            Content = "AK-47 Infinite Ammo Enabled",
            Duration = 3
        })
    end
})

--====================================================
-- Visibility Check
--====================================================

local function canSee(part)
    if not WallCheck then return true end
    local origin = cam.CFrame.Position
    local direction = (part.Position - origin)
    local params = RaycastParams.new()
    params.FilterDescendantsInstances = {player.Character}
    params.FilterType = Enum.RaycastFilterType.Blacklist
    local result = workspace:Raycast(origin, direction, params)
    return not result or result.Instance:IsDescendantOf(part.Parent)
end

--====================================================
-- ESP Setup
--====================================================

local labels = {}

local function getLabel(plr)
    if not labels[plr] then
        local txt = Drawing.new("Text")
        txt.Size = 16
        txt.Outline = true
        txt.Visible = false
        txt.Color = Color3.fromRGB(0, 255, 255)
        labels[plr] = txt
    end
    return labels[plr]
end

--====================================================
-- Main Loop (AIMBOT / ESP / TASER RESIST)
--====================================================

game:GetService("RunService").RenderStepped:Connect(function()

    -- Taser Resistance
    if AntiTaserEnabled then
        humanoid.PlatformStand = false
        humanoid.Sit = false
    end

    -- FOV Circle
    if AimbotEnabled then
        Circle.Color = rainbow()
        Circle.Position = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
        Circle.Radius = FOV * (300/200)
    end

    -- AIMBOT
    if AimbotEnabled then
        local nearest = nil
        local shortest = FOV

        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Team and plr.Team.Name == targetTeamName then
                local c = plr.Character
                if c and c:FindFirstChild(AimPart)
                    and c:FindFirstChild("Humanoid")
                    and c.Humanoid.Health > 0 then

                    local pos, visible = cam:WorldToViewportPoint(c[AimPart].Position)
                    if visible then
                        local dist = (Vector2.new(pos.X, pos.Y)
                            - Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)).Magnitude
                        if dist < shortest and canSee(c[AimPart]) then
                            shortest = dist
                            nearest = c[AimPart]
                        end
                    end
                end
            end
        end

        if nearest then
            local dir = (nearest.Position - cam.CFrame.Position).Unit
            cam.CFrame = cam.CFrame:Lerp(
                CFrame.new(cam.CFrame.Position, cam.CFrame.Position + dir),
                Smoothness
            )
        end
    end

    -- ESP
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr.Team and plr.Team.Name == targetTeamName
            and plr.Character
            and plr.Character:FindFirstChild("HumanoidRootPart") then

            local hrp = plr.Character.HumanoidRootPart
            local headPos, visible = cam:WorldToViewportPoint(hrp.Position)
            local label = getLabel(plr)

            if ESPEnabled then
                if visible then
                    label.Visible = true
                    label.Position = Vector2.new(headPos.X, headPos.Y)
                    label.Text = plr.Name
                    label.Color = Color3.fromRGB(0, 200, 255)
                else
                    label.Visible = false
                end
            else
                label.Visible = false
            end

            -- 3D ESP Highlight
            if ESP3DEnabled then
                if not plr.Character:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight", plr.Character)
                    h.FillTransparency = 1
                    h.OutlineTransparency = 0
                end
                plr.Character.Highlight.OutlineColor = rainbow()
            else
                if plr.Character:FindFirstChild("Highlight") then
                    plr.Character.Highlight:Destroy()
                end
            end
        end
    end
end)

--====================================================
-- Infinite Jump
--====================================================

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpEnabled then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

--====================================================
-- Respawn Support
--====================================================

player.CharacterAdded:Connect(function(new)
    char = new
    humanoid = new:WaitForChild("Humanoid")
end)
