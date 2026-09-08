-- ✅ Votka Hub – Final Version w/ Fully Functional Hitbox Restore + New ESP + Tracers

local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local DISCORD_INVITE = "https://discord.gg/dJJ3psbAxw"

local Window = Library:CreateWindow({
    Title = "Votka Hub",
    Footer = "Release Build",
    Center = true,
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab("Main", "user"),
    Visuals = Window:AddTab("Visuals", "eye"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-- STATES
local AimEnabled, FOVEnabled, GunTrackerEnabled, VisibilityCheck = false, false, false, true
local AimStrength, AimFOV, TargetPart = 0.15, 120, "Head"
local HitboxEnabled, HitboxSize, HitboxTransparency = false, 10, 0.6
local ShowAdvancedESP, ShowTracers = false, false

-- DRAWINGS
local FOVCircle = Drawing.new("Circle")
FOVCircle.Filled = false
FOVCircle.Thickness = 2
FOVCircle.Color = Color3.fromRGB(255,255,255)
FOVCircle.Visible = false

local Tracker = Drawing.new("Line")
Tracker.Thickness = 2
Tracker.Color = Color3.fromRGB(0,255,0)
Tracker.Visible = false

-- HITBOX SIZES
local HitboxOriginalSizes = {}

-- Aimbot UI
local AimBox = Tabs.Main:AddLeftGroupbox("Aimbot")
AimBox:AddToggle("AimbotToggle", { Text = "Enable Aimbot", Callback = function(v) AimEnabled = v end })
AimBox:AddToggle("VisibilityCheck", { Text = "Visibility Check", Default = true, Callback = function(v) VisibilityCheck = v end })
AimBox:AddSlider("AimStrength", { Text = "Aim Strength", Min = 0.05, Max = 1, Default = 0.15, Rounding = 2, Callback = function(v) AimStrength = v end })
AimBox:AddDropdown("TargetPart", { Text = "Target Part", Values = { "Head", "HumanoidRootPart" }, Default = 1, Callback = function(v) TargetPart = v end })

-- FOV UI
local FOVBox = Tabs.Main:AddRightGroupbox("FOV")
FOVBox:AddToggle("FOVToggle", { Text = "Show FOV Circle", Callback = function(v) FOVEnabled = v; FOVCircle.Visible = v end })
FOVBox:AddSlider("AimFOV", { Text = "FOV Radius", Min = 20, Max = 400, Default = 120, Callback = function(v) AimFOV = v end })

-- Gun Tracker UI
local TrackerBox = Tabs.Main:AddRightGroupbox("Gun Tracker")
TrackerBox:AddToggle("GunTrackerToggle", {
    Text = "Enable Gun Tracker",
    Callback = function(v)
        GunTrackerEnabled = v
        if not v then Tracker.Visible = false end
    end
})

-- Hitbox Expander UI
local HitboxBox = Tabs.Main:AddLeftGroupbox("Hitbox Expander")
HitboxBox:AddToggle("HitboxToggle", { Text = "Enable Hitbox Expander", Callback = function(v) HitboxEnabled = v end })
HitboxBox:AddSlider("HitboxSize", { Text = "Hitbox Size", Min = 6, Max = 13, Default = 10, Rounding = 0, Callback = function(v) HitboxSize = v end })
HitboxBox:AddSlider("HitboxTransparency", { Text = "Hitbox Transparency", Min = 0, Max = 1, Default = 0.6, Rounding = 2, Callback = function(v) HitboxTransparency = v end })

-- Discord
local DiscordBox = Tabs.Main:AddLeftGroupbox("Community")
DiscordBox:AddButton({
    Text = "Copy Discord Invite",
    Func = function()
        if setclipboard then setclipboard(DISCORD_INVITE) end
    end
})

-- ADVANCED ESP
local ESPDrawings = {}
local function isEnemy(p) return not p.Team or not LocalPlayer.Team or p.Team ~= LocalPlayer.Team end

local function createESP(p)
    ESPDrawings[p] = {
        Name = Drawing.new("Text"),
        Health = Drawing.new("Text"),
        Tracer = Drawing.new("Line")
    }
    local d = ESPDrawings[p]
    d.Name.Size = 13 d.Name.Center = true d.Name.Outline = true d.Name.Font = 2 d.Name.Color = Color3.fromRGB(255,255,255)
    d.Health.Size = 12 d.Health.Center = true d.Health.Outline = true d.Health.Font = 2 d.Health.Color = Color3.fromRGB(0,255,0)
    d.Tracer.Thickness = 1.5 d.Tracer.Color = Color3.fromRGB(255,0,0)
end

local function removeESP(p)
    if ESPDrawings[p] then for _, obj in pairs(ESPDrawings[p]) do obj:Remove() end ESPDrawings[p] = nil end
end

for _,p in ipairs(Players:GetPlayers()) do if p ~= LocalPlayer then createESP(p) end end
Players.PlayerAdded:Connect(function(p) if p ~= LocalPlayer then createESP(p) end end)
Players.PlayerRemoving:Connect(removeESP)

local ESPBox = Tabs.Visuals:AddLeftGroupbox("Advanced ESP")
ESPBox:AddToggle("ESPEnabled", { Text = "Enable ESP (Name + Health)", Callback = function(v) ShowAdvancedESP = v end })
ESPBox:AddToggle("TracersEnabled", { Text = "Enable Tracers", Callback = function(v) ShowTracers = v end })

-- LOOP
RunService.RenderStepped:Connect(function()
    local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    FOVCircle.Position = center
    FOVCircle.Radius = AimFOV
    FOVCircle.Visible = FOVEnabled

    for _, plr in ipairs(Players:GetPlayers()) do
        local char = plr.Character
        if char then
            for _, partName in ipairs({"Head", "HumanoidRootPart", "UpperTorso", "Torso"}) do
                local part = char:FindFirstChild(partName)
                if part and part:IsA("BasePart") then
                    if HitboxEnabled and plr ~= LocalPlayer then
                        if not HitboxOriginalSizes[part] then
                            HitboxOriginalSizes[part] = part.Size
                        end
                        part.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                        part.Transparency = HitboxTransparency
                        part.CanCollide = false
                    elseif HitboxOriginalSizes[part] then
                        part.Size = HitboxOriginalSizes[part]
                        part.Transparency = 0
                        HitboxOriginalSizes[part] = nil
                    end
                end
            end
        end
    end

    for plr, esp in pairs(ESPDrawings) do
        local char = plr.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")

        if char and hrp and hum and hum.Health > 0 and isEnemy(plr) then
            local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
            if onScreen and ShowAdvancedESP then
                esp.Name.Text = plr.Name
                esp.Name.Position = Vector2.new(pos.X, pos.Y - 20)
                esp.Name.Visible = true

                esp.Health.Text = "HP: " .. math.floor(hum.Health)
                esp.Health.Position = Vector2.new(pos.X, pos.Y - 6)
                esp.Health.Visible = true

                if ShowTracers then
                    esp.Tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                    esp.Tracer.To = Vector2.new(pos.X, pos.Y)
                    esp.Tracer.Visible = true
                else
                    esp.Tracer.Visible = false
                end
            else
                esp.Name.Visible = false
                esp.Health.Visible = false
                esp.Tracer.Visible = false
            end
        else
            esp.Name.Visible = false
            esp.Health.Visible = false
            esp.Tracer.Visible = false
        end
    end

    -- Aimbot
    if not AimEnabled then return end
    local closest, dist = nil, AimFOV
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and isEnemy(plr) then
            local part = plr.Character:FindFirstChild(TargetPart)
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if part and hum and hum.Health > 0 then
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position)
                local mag = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                if onScreen and mag < dist then
                    dist = mag
                    closest = part
                end
            end
        end
    end

    if closest then
        Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, closest.Position), AimStrength)
        if GunTrackerEnabled then
            local tPos = Camera:WorldToViewportPoint(closest.Position)
            Tracker.From = center
            Tracker.To = Vector2.new(tPos.X, tPos.Y)
            Tracker.Visible = true
        else
            Tracker.Visible = false
        end
    else
        Tracker.Visible = false
    end
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyTheme("Default")