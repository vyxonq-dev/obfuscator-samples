local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = "Hitbox & ESP",
    Footer = "Obsidian UI",
    NotifySide = "Right",
    ShowCustomCursor = true,
})

local Tabs = {
    Main = Window:AddTab("Main", "target"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

-- // Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- // Variables
local Drawing = Drawing or require(game:GetService("ReplicatedStorage"):WaitForChild("Drawing"))
local ESP_Cache = {}

-- // Skeleton Bone Connections
local SkeletonConnections = {
    {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"}, {"LowerTorso", "LeftUpperLeg"},
    {"LeftUpperLeg", "LeftLowerLeg"}, {"LeftLowerLeg", "LeftFoot"}, {"LowerTorso", "RightUpperLeg"},
    {"RightUpperLeg", "RightLowerLeg"}, {"RightLowerLeg", "RightFoot"}, {"UpperTorso", "LeftUpperArm"},
    {"LeftUpperArm", "LeftLowerArm"}, {"LeftLowerArm", "LeftHand"}, {"UpperTorso", "RightUpperArm"},
    {"RightUpperArm", "RightLowerArm"}, {"RightLowerArm", "RightHand"},
    {"Head", "Torso"}, {"Torso", "Left Arm"}, {"Torso", "Right Arm"}, {"Torso", "Left Leg"}, {"Torso", "Right Leg"}
}

-- // Physics Fixes (only used for Head, NOT for HRP)
local NoFriction = PhysicalProperties.new(0.01, 0, 0, 0, 0)

-- // Helper: Team Check
local function IsTeammate(player)
    if LocalPlayer.Neutral or player.Neutral then return false end
    if LocalPlayer.Team and player.Team and LocalPlayer.Team == player.Team then return true end
    if LocalPlayer.TeamColor and player.TeamColor and LocalPlayer.TeamColor == player.TeamColor then return true end
    return false
end

-- // Helper: Create Drawing
local function CreateDrawing(type, properties)
    local drawing = Drawing.new(type)
    for k, v in pairs(properties) do
        drawing[k] = v
    end
    return drawing
end

-- // Helper: Reset a part back to defaults
local function ResetPart(part)
    if not part then return end

    if part.Name == "HumanoidRootPart" then
        part.Size = Vector3.new(2, 2, 1)
        part.Transparency = 1
        part.CanCollide = false
    elseif part.Name == "Head" then
        part.Size = Vector3.new(1.2, 1, 1.2)
        part.Transparency = 0
        part.CanCollide = true
        part.Massless = false
        part.CustomPhysicalProperties = nil
    end
end

-- // Helper: Reset ALL possible hitbox parts on a character
local function ResetAllHitboxParts(character)
    if not character then return end
    ResetPart(character:FindFirstChild("Head"))
    ResetPart(character:FindFirstChild("HumanoidRootPart"))
end

-- // Helper: Get the target part
local function GetHitboxPart(character, target)
    if target == "Head" then
        return character:FindFirstChild("Head")
    elseif target == "HumanoidRootPart" then
        return character:FindFirstChild("HumanoidRootPart")
    end
    return nil
end

-- // Helper: Expand a part for hitbox
local function ExpandPart(part, size, transparency)
    if not part then return end

    part.Size = Vector3.new(size, size, size)
    part.Transparency = transparency
    part.CanCollide = false

    if part.Name ~= "HumanoidRootPart" then
        part.Massless = true
        part.CustomPhysicalProperties = NoFriction
    end
end

-- // UI: Hitbox
local HitboxGroup = Tabs.Main:AddLeftGroupbox("Hitbox Settings")

HitboxGroup:AddToggle("HitboxToggle", {
    Text = "Enable Hitbox",
    Default = false,
    Callback = function(Value)
        if not Value then
            for _, player in next, Players:GetPlayers() do
                if player ~= LocalPlayer and player.Character then
                    ResetAllHitboxParts(player.Character)
                end
            end
        end
    end
})

HitboxGroup:AddToggle("HitboxTeamCheck", { Text = "Team Check", Default = false })

HitboxGroup:AddDropdown("HitboxPart", {
    Values = { "Head", "HumanoidRootPart" },
    Default = 1,
    Multi = false,
    Text = "Target Part",
    Callback = function(Value)
        for _, player in next, Players:GetPlayers() do
            if player ~= LocalPlayer and player.Character then
                ResetAllHitboxParts(player.Character)
            end
        end
    end
})

HitboxGroup:AddSlider("HitboxSize", { Text = "Hitbox Size", Default = 10, Min = 2, Max = 200, Rounding = 1 })
HitboxGroup:AddSlider("HitboxTransparency", { Text = "Transparency", Default = 0.9, Min = 0, Max = 1, Rounding = 1 })

-- // UI: Visuals
local VisualsGroup = Tabs.Main:AddRightGroupbox("Visuals")

VisualsGroup:AddToggle("EspEnabled", { Text = "Enable ESP", Default = false })
VisualsGroup:AddToggle("EspTeamCheck", { Text = "ESP Team Check", Default = false })
VisualsGroup:AddToggle("EspUseTeamColor", { Text = "Use Team Colors", Default = false, Tooltip = "Overrides custom colors with Player Team Color" })
VisualsGroup:AddSlider("EspMaxDist", { Text = "Max Distance", Default = 1000, Min = 100, Max = 5000, Rounding = 0 })

VisualsGroup:AddDivider()
VisualsGroup:AddToggle("EspBox", { Text = "Box ESP", Default = false })
    :AddColorPicker("BoxColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Box Color" })
VisualsGroup:AddDropdown("BoxType", { Values = { "Full", "Corner" }, Default = 1, Text = "Box Style" })
VisualsGroup:AddSlider("BoxThickness", { Text = "Box Thickness", Default = 1, Min = 1, Max = 5, Rounding = 1 })

VisualsGroup:AddDivider()
VisualsGroup:AddToggle("EspSkeleton", { Text = "Skeleton ESP", Default = false })
    :AddColorPicker("SkeletonColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Skeleton Color" })

VisualsGroup:AddDivider()
VisualsGroup:AddToggle("EspTracers", { Text = "Tracers", Default = false })
    :AddColorPicker("TracerColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Tracer Color" })
VisualsGroup:AddDropdown("TracerOrigin", { Values = { "Bottom", "Center", "Top" }, Default = 1, Text = "Tracer Origin" })

VisualsGroup:AddDivider()
VisualsGroup:AddToggle("EspHealth", { Text = "Health Bar", Default = false })
VisualsGroup:AddToggle("EspHealthText", { Text = "Health Number", Default = false })
VisualsGroup:AddSlider("HealthThickness", { Text = "Health Thickness", Default = 1, Min = 1, Max = 4, Rounding = 1 })

VisualsGroup:AddToggle("EspDistance", { Text = "Distance Info", Default = false })
    :AddColorPicker("TextColor", { Default = Color3.fromRGB(255, 255, 255), Title = "Text Color" })

-- // Track death connections
local DeathConnections = {}

local function HookCharacterDeath(player)
    if DeathConnections[player] then
        DeathConnections[player]:Disconnect()
        DeathConnections[player] = nil
    end
    local char = player.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return end
    DeathConnections[player] = hum.Died:Connect(function()
        ResetAllHitboxParts(char)
    end)
end

for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        HookCharacterDeath(player)
        player.CharacterAdded:Connect(function()
            task.wait(0.1)
            HookCharacterDeath(player)
        end)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        task.wait(0.1)
        HookCharacterDeath(player)
    end)
end)

-- // Functions for ESP
local function RemoveESP(player)
    if ESP_Cache[player] then
        local c = ESP_Cache[player]
        if c.Tracer then c.Tracer:Remove() end
        if c.Box then c.Box:Remove() end
        if c.HealthBarOutline then c.HealthBarOutline:Remove() end
        if c.HealthBar then c.HealthBar:Remove() end
        if c.HealthText then c.HealthText:Remove() end
        if c.Text then c.Text:Remove() end
        if c.Skeleton then for _, l in pairs(c.Skeleton) do l:Remove() end end
        if c.CornerLines then for _, l in pairs(c.CornerLines) do l:Remove() end end
        ESP_Cache[player] = nil
    end
end

local function UpdateESP()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if not ESP_Cache[player] then
                local cache = {
                    Tracer = CreateDrawing("Line", {Visible = false}),
                    Box = CreateDrawing("Square", {Visible = false, Filled = false}),
                    HealthBarOutline = CreateDrawing("Square", {Visible = false, Filled = true, Color = Color3.new(0,0,0), Transparency = 1}),
                    HealthBar = CreateDrawing("Square", {Visible = false, Filled = true}),
                    HealthText = CreateDrawing("Text", {Visible = false, Center = false, Outline = true, Size = 13, Color = Color3.new(0,1,0)}),
                    Text = CreateDrawing("Text", {Visible = false, Center = true, Outline = true, Size = 16}),
                    Skeleton = {},
                    CornerLines = {}
                }
                for i = 1, 16 do table.insert(cache.Skeleton, CreateDrawing("Line", {Visible = false})) end
                for i = 1, 8 do table.insert(cache.CornerLines, CreateDrawing("Line", {Visible = false})) end
                ESP_Cache[player] = cache
            end

            local cache = ESP_Cache[player]
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local head = char and char:FindFirstChild("Head")

            cache.Tracer.Visible = false
            cache.Box.Visible = false
            cache.HealthBar.Visible = false
            cache.HealthBarOutline.Visible = false
            cache.HealthText.Visible = false
            cache.Text.Visible = false
            for _, l in pairs(cache.Skeleton) do l.Visible = false end
            for _, l in pairs(cache.CornerLines) do l.Visible = false end

            if Toggles.EspEnabled.Value and char and hrp and hum and hum.Health > 0 then
                if not (Toggles.EspTeamCheck.Value and IsTeammate(player)) then
                    local dist = (hrp.Position - Camera.CFrame.Position).Magnitude
                    if dist <= Options.EspMaxDist.Value then
                        local vec, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                        if onScreen then
                            local useTeamColor = Toggles.EspUseTeamColor.Value
                            local teamColor = player.TeamColor.Color

                            if Toggles.EspTracers.Value then
                                cache.Tracer.Visible = true
                                cache.Tracer.Thickness = 1
                                cache.Tracer.Color = useTeamColor and teamColor or Options.TracerColor.Value
                                cache.Tracer.To = Vector2.new(vec.X, vec.Y)
                                local origin = Options.TracerOrigin.Value
                                if origin == "Bottom" then
                                    cache.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                                elseif origin == "Center" then
                                    cache.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                elseif origin == "Top" then
                                    cache.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, 0)
                                end
                            end

                            local headPos = head.Position + Vector3.new(0, 0.5, 0)
                            local footPos = hrp.Position - Vector3.new(0, 3, 0)
                            local headVec = Camera:WorldToViewportPoint(headPos)
                            local footVec = Camera:WorldToViewportPoint(footPos)
                            local height = math.abs(headVec.Y - footVec.Y)
                            local width = height / 1.5
                            local topLeft = Vector2.new(vec.X - (width/2), headVec.Y)

                            if Toggles.EspBox.Value then
                                local color = useTeamColor and teamColor or Options.BoxColor.Value
                                local thickness = Options.BoxThickness.Value
                                if Options.BoxType.Value == "Full" then
                                    cache.Box.Visible = true
                                    cache.Box.Size = Vector2.new(width, height)
                                    cache.Box.Position = topLeft
                                    cache.Box.Color = color
                                    cache.Box.Thickness = thickness
                                else
                                    local lineLen = width / 4
                                    local lines = cache.CornerLines
                                    local x, y = topLeft.X, topLeft.Y
                                    local w, h = width, height
                                    local function SetLine(idx, from, to)
                                        local l = lines[idx]
                                        l.Visible = true
                                        l.From = from
                                        l.To = to
                                        l.Color = color
                                        l.Thickness = thickness
                                    end
                                    SetLine(1, Vector2.new(x, y), Vector2.new(x + lineLen, y))
                                    SetLine(2, Vector2.new(x, y), Vector2.new(x, y + lineLen))
                                    SetLine(3, Vector2.new(x + w, y), Vector2.new(x + w - lineLen, y))
                                    SetLine(4, Vector2.new(x + w, y), Vector2.new(x + w, y + lineLen))
                                    SetLine(5, Vector2.new(x, y + h), Vector2.new(x + lineLen, y + h))
                                    SetLine(6, Vector2.new(x, y + h), Vector2.new(x, y + h - lineLen))
                                    SetLine(7, Vector2.new(x + w, y + h), Vector2.new(x + w - lineLen, y + h))
                                    SetLine(8, Vector2.new(x + w, y + h), Vector2.new(x + w, y + h - lineLen))
                                end
                            end

                            if Toggles.EspSkeleton.Value then
                                local skelColor = useTeamColor and teamColor or Options.SkeletonColor.Value
                                local idx = 1
                                for _, pair in ipairs(SkeletonConnections) do
                                    local p1 = char:FindFirstChild(pair[1])
                                    local p2 = char:FindFirstChild(pair[2])
                                    if p1 and p2 and cache.Skeleton[idx] then
                                        local s1, v1 = Camera:WorldToViewportPoint(p1.Position)
                                        local s2, v2 = Camera:WorldToViewportPoint(p2.Position)
                                        if v1 and v2 then
                                            local l = cache.Skeleton[idx]
                                            l.Visible = true
                                            l.From = Vector2.new(s1.X, s1.Y)
                                            l.To = Vector2.new(s2.X, s2.Y)
                                            l.Color = skelColor
                                            l.Thickness = 1
                                            idx = idx + 1
                                        end
                                    end
                                end
                            end

                            if Toggles.EspHealth.Value or Toggles.EspHealthText.Value then
                                local hpPct = hum.Health / hum.MaxHealth
                                local barH = height * hpPct
                                local thick = Options.HealthThickness.Value
                                local offset = 4 + thick
                                if Toggles.EspHealth.Value then
                                    cache.HealthBarOutline.Visible = true
                                    cache.HealthBarOutline.Size = Vector2.new(thick + 2, height + 2)
                                    cache.HealthBarOutline.Position = Vector2.new(topLeft.X - offset - 1, topLeft.Y - 1)
                                    cache.HealthBar.Visible = true
                                    cache.HealthBar.Color = Color3.fromHSV(hpPct * 0.3, 1, 1)
                                    cache.HealthBar.Size = Vector2.new(thick, barH)
                                    cache.HealthBar.Position = Vector2.new(topLeft.X - offset, footVec.Y - barH)
                                end
                                if Toggles.EspHealthText.Value then
                                    cache.HealthText.Visible = true
                                    cache.HealthText.Text = tostring(math.floor(hum.Health))
                                    cache.HealthText.Position = Vector2.new(topLeft.X - offset - 20, (footVec.Y - barH) - 2)
                                end
                            end

                            if Toggles.EspDistance.Value then
                                cache.Text.Visible = true
                                cache.Text.Text = string.format("[%d] %s", math.floor(dist), player.Name)
                                cache.Text.Color = Options.TextColor.Value
                                cache.Text.Position = Vector2.new(vec.X, footVec.Y + 2)
                            end
                        end
                    end
                end
            end
        end
    end
end

-- // Main Loop
RunService.RenderStepped:Connect(function()
    UpdateESP()

    if not Toggles.HitboxToggle.Value then return end

    local size = Options.HitboxSize.Value
    local transparency = Options.HitboxTransparency.Value
    local target = Options.HitboxPart.Value
    local teamCheck = Toggles.HitboxTeamCheck.Value

    for _, player in next, Players:GetPlayers() do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            local pPart = GetHitboxPart(char, target)

            if pPart and hum then
                local shouldExpand = (hum.Health > 0) and not (teamCheck and IsTeammate(player))

                if shouldExpand then
                    ExpandPart(pPart, size, transparency)
                else
                    ResetPart(pPart)
                end
            end
        end
    end
end)

Players.PlayerRemoving:Connect(function(player)
    RemoveESP(player)
    if player.Character then
        ResetAllHitboxParts(player.Character)
    end
    if DeathConnections[player] then
        DeathConnections[player]:Disconnect()
        DeathConnections[player] = nil
    end
end)

-- // Settings Setup
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

MenuGroup:AddButton("Unload", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            ResetAllHitboxParts(p.Character)
        end
        RemoveESP(p)
    end
    for _, conn in pairs(DeathConnections) do conn:Disconnect() end
    DeathConnections = {}
    Library:Unload()
end)

MenuGroup:AddLabel("Menu Keybind"):AddKeyPicker("MenuKeybind", { Default = "RightControl", NoUI = true, Text = "Menu keybind" })
Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder("MyScriptHub")
SaveManager:SetFolder("MyScriptHub/specific-game")

ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:BuildConfigSection(Tabs["UI Settings"])
SaveManager:LoadAutoSettingsig()
