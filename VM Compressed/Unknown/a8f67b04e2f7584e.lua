local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SHADERS | RIVALS HUB",
   LoadingTitle = "Loading Ultimate Shader Menu...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false 
})

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- 1. STORE ORIGINAL SETTINGS (Captures the "Normal" game state)
local OriginalSettings = {
    Technology = Lighting.Technology,
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    ExposureCompensation = Lighting.ExposureCompensation,
    EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
    EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Ambient = Lighting.Ambient
}

local OriginalMaterials = {}
for _, obj in pairs(workspace:GetDescendants()) do
    if obj:IsA("BasePart") then
        OriginalMaterials[obj] = {
            Material = obj.Material,
            Reflectance = obj.Reflectance,
            Color = obj.Color
        }
    end
end

--- UTILITY FUNCTIONS ---

local function resetToNormal()
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostProcessEffect") or v:IsA("Atmosphere") then v:Destroy() end
    end
    
    Lighting.Technology = OriginalSettings.Technology
    Lighting.Brightness = OriginalSettings.Brightness
    Lighting.ClockTime = OriginalSettings.ClockTime
    Lighting.ExposureCompensation = OriginalSettings.ExposureCompensation
    Lighting.EnvironmentSpecularScale = OriginalSettings.EnvironmentSpecularScale
    Lighting.EnvironmentDiffuseScale = OriginalSettings.EnvironmentDiffuseScale
    Lighting.OutdoorAmbient = OriginalSettings.OutdoorAmbient
    Lighting.Ambient = OriginalSettings.Ambient

    for obj, props in pairs(OriginalMaterials) do
        if obj and obj.Parent then
            obj.Material = props.Material
            obj.Reflectance = props.Reflectance
            obj.Color = props.Color
        end
    end
    
    Rayfield:Notify({Title = "Reset Complete", Content = "Game is back to normal.", Duration = 3})
end

local function applyBaseMovement()
    local char = player.Character or player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = 16
    hum.JumpPower = 50
    hum.UseJumpPower = true
end

--- TABS ---

local MainTab = Window:CreateTab("Shader Modes", 4483362458)

-- NEW: VOID WRAP MODE (Dark floor/walls, Bright wraps)
MainTab:CreateButton({
   Name = "Void Wrap (Dark Walls/Bright Skins)",
   Callback = function()
        resetToNormal()
        applyBaseMovement()
        
        -- Environmental Darkness
        Lighting.Technology = Enum.Technology.Future
        Lighting.ExposureCompensation = -0.8
        Lighting.EnvironmentSpecularScale = 1
        Lighting.EnvironmentDiffuseScale = 0.8 -- High diffuse makes wraps/skins pop
        Lighting.Ambient = Color3.fromRGB(5, 5, 5)
        
        local bloom = Instance.new("BloomEffect", Lighting)
        bloom.Intensity = 1.5; bloom.Threshold = 0.7
        
        local cc = Instance.new("ColorCorrectionEffect", Lighting)
        cc.Contrast = 0.6; cc.Saturation = 0.4
        
        -- Apply Part Logic
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                local name = obj.Name:lower()
                if name:find("floor") or name:find("wall") then
                    -- Dark Mirror Surfaces
                    obj.Material = Enum.Material.Glass
                    obj.Reflectance = 0.9
                    obj.Color = Color3.fromRGB(5, 5, 5) -- Very dark
                else
                    -- Ensure Wraps/Skins are visible and bright
                    obj.Material = Enum.Material.SmoothPlastic
                    obj.Reflectance = 0.4
                end
            end
        end
        Rayfield:Notify({Title = "Success", Content = "Void Wrap Active", Duration = 3})
   end,
})

-- BALANCED DARK GLOSS
MainTab:CreateButton({
   Name = "Balanced Dark Gloss",
   Callback = function()
        resetToNormal()
        applyBaseMovement()
        Lighting.Technology = Enum.Technology.Future
        Lighting.ExposureCompensation = -0.35
        Lighting.EnvironmentSpecularScale = 1
        local bloom = Instance.new("BloomEffect", Lighting)
        bloom.Intensity = 0.6; bloom.Size = 12
        local cc = Instance.new("ColorCorrectionEffect", Lighting)
        cc.Contrast = 0.4; cc.Saturation = 0.2
        Rayfield:Notify({Title = "Success", Content = "Balanced Gloss Active", Duration = 3})
   end,
})

-- ULTRA-COOL SHOWCASE
MainTab:CreateButton({
   Name = "Ultra-Cool Showcase",
   Callback = function()
        resetToNormal()
        applyBaseMovement()
        Lighting.Technology = Enum.Technology.Future
        Lighting.ExposureCompensation = -0.45
        local atmo = Instance.new("Atmosphere", Lighting)
        atmo.Density = 0.3; atmo.Glare = 0.5
        local bloom = Instance.new("BloomEffect", Lighting)
        bloom.Intensity = 1.5; bloom.Size = 30
        local cc = Instance.new("ColorCorrectionEffect", Lighting)
        cc.Contrast = 0.5; cc.Saturation = 0.4
        Rayfield:Notify({Title = "Success", Content = "Ultra-Cool Active", Duration = 3})
   end,
})

-- UTILS
local UtilsTab = Window:CreateTab("Utils", 4483362458)

UtilsTab:CreateButton({
   Name = "REMOVE ALL SHADERS (Total Reset)",
   Callback = function()
        resetToNormal()
   end,
})

Rayfield:Notify({
    Title = "Menu Loaded",
    Content = "Right Shift to toggle. Movement set to Normal.",
    Duration = 5
})