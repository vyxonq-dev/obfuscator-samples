local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")
local drawingSupported = Drawing and true or false
local Window = Rayfield:CreateWindow({
    Name = "Skid Softworks - Defusal",
    LoadingTitle = "Skid Softworks - Defusal",
    LoadingSubtitle = "Skid Softworks",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "GunModsConfig",
        FileName = "GunMods"
    },
    KeySystem = false
})
local MainTab = Window:CreateTab("Gun Mods", "rewind")
local MainSection = MainTab:CreateSection("Gun Mods")
local originalAttributes = {}
local originalWalkspeed = 16
local function updateOriginalWalkspeed()
    if LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            originalWalkspeed = humanoid.WalkSpeed
        end
    end
end
LocalPlayer.CharacterAdded:Connect(updateOriginalWalkspeed)
if LocalPlayer.Character then
    updateOriginalWalkspeed()
end
local function saveOriginalAttributes()
    local weapons = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons")
    if not weapons then
        Rayfield:Notify({
            Title = "Error",
            Content = "Weapons folder not found in ReplicatedStorage.",
            Duration = 5,
            Image = "alert-triangle"
        })
        return
    end
    for _, weapon in pairs(weapons:GetChildren()) do
        if weapon:IsA("Folder") then
            originalAttributes[weapon.Name] = {
                Penetration = weapon:GetAttribute("Penetration"),
                Bullets = weapon:GetAttribute("Bullets"),
                RecoilX = weapon:GetAttribute("RecoilX"),
                RecoilY = weapon:GetAttribute("RecoilY"),
                JumpSpread = weapon:GetAttribute("JumpSpread"),
                LadderSpread = weapon:GetAttribute("LadderSpread"),
                LandSpread = weapon:GetAttribute("LandSpread"),
                MoveSpread = weapon:GetAttribute("MoveSpread"),
                Spread = weapon:GetAttribute("Spread"),
                CrouchSpread = weapon:GetAttribute("CrouchSpread"),
                FireSpread = weapon:GetAttribute("FireSpread"),
                Auto = weapon:GetAttribute("Auto"),
                ClipRefill = weapon:GetAttribute("ClipRefill"),
                EquipTime = weapon:GetAttribute("EquipTime"),
                FireRate = weapon:GetAttribute("FireRate")
            }
        end
    end
end
saveOriginalAttributes()
local function modifyWeapons(attributes)
    local weapons = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons")
    if not weapons then
        Rayfield:Notify({
            Title = "Error",
            Content = "Weapons folder not found in ReplicatedStorage.",
            Duration = 5,
            Image = "alert-triangle"
        })
        return
    end
    for _, weapon in pairs(weapons:GetChildren()) do
        if weapon:IsA("Folder") then
            for attr, value in pairs(attributes) do
                if weapon:GetAttribute(attr) ~= nil and value ~= nil then
                    weapon:SetAttribute(attr, value)
                end
            end
        end
    end
end
MainTab:CreateToggle({
    Name = "Max Wall Bang",
    CurrentValue = false,
    Flag = "MaxPenetration",
    Callback = function(Value)
        local default = next(originalAttributes) and originalAttributes[next(originalAttributes)].Penetration or nil
        modifyWeapons({Penetration = Value and "9e999" or default})
    end
})
MainTab:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Flag = "NoRecoil",
    Callback = function(Value)
        local defaultX = next(originalAttributes) and originalAttributes[next(originalAttributes)].RecoilX or nil
        local defaultY = next(originalAttributes) and originalAttributes[next(originalAttributes)].RecoilY or nil
        modifyWeapons({
            RecoilX = Value and 0 or defaultX,
            RecoilY = Value and 0 or defaultY
        })
    end
})
MainTab:CreateToggle({
    Name = "No Spread",
    CurrentValue = false,
    Flag = "NoSpread",
    Callback = function(Value)
        local defaults = next(originalAttributes) and originalAttributes[next(originalAttributes)] or {}
        local spreadAttrs = {
            JumpSpread = Value and 0 or defaults.JumpSpread,
            LadderSpread = Value and 0 or defaults.LadderSpread,
            LandSpread = Value and 0 or defaults.LandSpread,
            MoveSpread = Value and 0 or defaults.MoveSpread,
            Spread = Value and 0 or defaults.Spread,
            CrouchSpread = Value and 0 or defaults.CrouchSpread,
            FireSpread = Value and 0 or defaults.FireSpread
        }
        modifyWeapons(spreadAttrs)
    end
})
MainTab:CreateToggle({
    Name = "Full Auto",
    CurrentValue = false,
    Flag = "FullAuto",
    Callback = function(Value)
        local default = next(originalAttributes) and originalAttributes[next(originalAttributes)].Auto or nil
        modifyWeapons({Auto = Value or default})
    end
})
MainTab:CreateToggle({
    Name = "Instant Reload",
    CurrentValue = false,
    Flag = "InstantReload",
    Callback = function(Value)
        local default = next(originalAttributes) and originalAttributes[next(originalAttributes)].ClipRefill or nil
        modifyWeapons({ClipRefill = Value and 0 or default})
    end
})
MainTab:CreateToggle({
    Name = "Instant Equip",
    CurrentValue = false,
    Flag = "InstantEquip",
    Callback = function(Value)
        local default = next(originalAttributes) and originalAttributes[next(originalAttributes)].EquipTime or nil
        modifyWeapons({EquipTime = Value and 0 or default})
    end
})
MainTab:CreateToggle({
    Name = "Rapid Fire",
    CurrentValue = false,
    Flag = "RapidFire",
    Callback = function(Value)
        local default = next(originalAttributes) and originalAttributes[next(originalAttributes)].FireRate or nil
        modifyWeapons({FireRate = Value and 0.01 or default})
    end
})
MainTab:CreateSlider({
    Name = "Shotgun Pellets",
    Range = {1, 50},
    Increment = 1,
    Suffix = "Pellets",
    CurrentValue = 1,
    Flag = "BulletCount",
    Callback = function(Value)
        modifyWeapons({Bullets = Value})
    end
})
MainTab:CreateSlider({
    Name = "Walkspeed",
    Range = {16, 100},
    Increment = 1,
    Suffix = "Studs/s",
    CurrentValue = 16,
    Flag = "Walkspeed",
    Callback = function(Value)
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = Value
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Humanoid not found for walkspeed adjustment.",
                    Duration = 5,
                    Image = "alert-triangle"
                })
            end
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Character not loaded for walkspeed adjustment.",
                Duration = 5,
                Image = "alert-triangle"
            })
        end
    end
})
MainTab:CreateButton({
    Name = "Reset Modifications",
    Callback = function()
        local weapons = game:GetService("ReplicatedStorage"):FindFirstChild("Weapons")
        if not weapons then
            Rayfield:Notify({
                Title = "Error",
                Content = "Weapons folder not found in ReplicatedStorage.",
                Duration = 5,
                Image = "alert-triangle"
            })
            return
        end
        for _, weapon in pairs(weapons:GetChildren()) do
            if weapon:IsA("Folder") and originalAttributes[weapon.Name] then
                for attr, value in pairs(originalAttributes[weapon.Name]) do
                    if value ~= nil and weapon:GetAttribute(attr) ~= nil then
                        weapon:SetAttribute(attr, value)
                    end
                end
            end
        end
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = originalWalkspeed
            end
        end
        Rayfield:Notify({
            Title = "Reset Complete",
            Content = "All modifications have been reset.",
            Duration = 3,
            Image = "rewind"
        })
    end
})
local ESPTab = Window:CreateTab("ESP", "eye")
local ESPSection = ESPTab:CreateSection("ESP Settings")
local espEnabled = false
local espDrawings = {}
if not drawingSupported then
    Rayfield:Notify({
        Title = "Warning",
        Content = "ESP not supported: Drawing API unavailable.",
        Duration = 5,
        Image = "alert-triangle"
    })
end
local function createESP(player)
    if player == LocalPlayer then return end
    if drawingSupported then
        local drawing = Drawing.new("Square")
        drawing.Visible = false
        drawing.Color = Color3.new(1, 0, 0)
        drawing.Thickness = 2
        drawing.Filled = false
        espDrawings[player] = drawing
    end
end
local function updateESP()
    for player, drawing in pairs(espDrawings) do
        if player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                local screenPos, onScreen = Camera:WorldToViewportPoint(root.Position)
                if onScreen and espEnabled then
                    drawing.Visible = true
                    drawing.Size = Vector2.new(1000 / screenPos.Z, 2000 / screenPos.Z)
                    drawing.Position = Vector2.new(screenPos.X - drawing.Size.X / 2, screenPos.Y - drawing.Size.Y / 2)
                else
                    drawing.Visible = false
                end
            else
                drawing.Visible = false
            end
        else
            drawing.Visible = false
        end
    end
end
local function cleanupESP(player)
    if espDrawings[player] then
        espDrawings[player]:Remove()
        espDrawings[player] = nil
    end
end
ESPTab:CreateToggle({
    Name = "Enable 2D ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        espEnabled = Value
        if Value and drawingSupported then
            for _, player in pairs(Players:GetPlayers()) do
                createESP(player)
            end
            RunService:BindToRenderStep("ESPUpdate", Enum.RenderPriority.Camera.Value + 1, updateESP)
            Players.PlayerAdded:Connect(createESP)
            Players.PlayerRemoving:Connect(cleanupESP)
        else
            RunService:UnbindFromRenderStep("ESPUpdate")
            for _, drawing in pairs(espDrawings) do
                drawing:Remove()
            end
            espDrawings = {}
        end
    end
})
Rayfield:Notify({
    Title = "Client Mods Loaded",
    Content = "Client-side mods GUI has been successfully loaded!",
    Duration = 5,
    Image = "check-circle"
})
Rayfield:LoadConfiguration()
