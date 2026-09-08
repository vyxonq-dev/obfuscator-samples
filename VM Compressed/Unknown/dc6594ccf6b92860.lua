-- Hip Height Changer Script
-- Made by SpinningShrimpo Yt/Tiktok/Discord User of creator: TUTFORCONFIG display: MugiceeXD
-- Uses Rayfield UI Library
-- Hip Height: 2-17 | Toggle On/Off | No Walk Sway Fix

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Hip Height Changer | Made by SpinningShrimpo",
    LoadingTitle = "Hip Height Changer",
    LoadingSubtitle = "Made by SpinningShrimpo | Discord/Yt/Tiktok",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = false, -- Toggle always starts OFF on execute
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
})

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Variables
local isEnabled = false  -- Always starts OFF
local currentHeight = 2
local hipHeightConnection = nil
local swayFixConnection = nil

-- Default RootJoint C0 (Roblox standard)
local DEFAULT_ROOT_C0 = CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)

-- Sway Fix
local function enableSwayFix(character)
    if swayFixConnection then
        swayFixConnection:Disconnect()
        swayFixConnection = nil
    end

    local hrp = character:WaitForChild("HumanoidRootPart", 5)
    if not hrp then return end

    local rootJoint = hrp:WaitForChild("RootJoint", 5)
    if not rootJoint then return end

    swayFixConnection = RunService.Stepped:Connect(function()
        if isEnabled and rootJoint and rootJoint.Parent then
            local c0 = rootJoint.C0
            local rx, ry, rz = c0:ToEulerAnglesXYZ()
            rootJoint.C0 = CFrame.new(0, c0.Y, c0.Z) * CFrame.fromEulerAnglesXYZ(rx, ry, rz)
        end
    end)
end

local function disableSwayFix(character)
    if swayFixConnection then
        swayFixConnection:Disconnect()
        swayFixConnection = nil
    end

    local char = character or LocalPlayer.Character
    if char then
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then
            local rootJoint = hrp:FindFirstChild("RootJoint")
            if rootJoint then
                rootJoint.C0 = DEFAULT_ROOT_C0
            end
        end
    end
end

local function applyHipHeight(height)
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.HipHeight = height
        end
        enableSwayFix(character)
    end

    if hipHeightConnection then
        hipHeightConnection:Disconnect()
    end

    hipHeightConnection = LocalPlayer.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        if isEnabled then
            local hum = char:WaitForChild("Humanoid", 5)
            if hum then
                hum.HipHeight = currentHeight
            end
            enableSwayFix(char)
        end
    end)
end

local function resetHipHeight()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.HipHeight = 2
        end
    end

    disableSwayFix()

    if hipHeightConnection then
        hipHeightConnection:Disconnect()
        hipHeightConnection = nil
    end
end

-- UI: Tab
local MainTab = Window:CreateTab("Hip Height", 4483362458)

-- Controls Section
MainTab:CreateSection("Controls")

-- Toggle starts OFF
local Toggle = MainTab:CreateToggle({
    Name = "Enable Hip Height",
    CurrentValue = false,
    Flag = "HipHeightToggle",
    Callback = function(Value)
        isEnabled = Value
        if isEnabled then
            applyHipHeight(currentHeight)
        else
            resetHipHeight()
        end
    end,
})

local Slider = MainTab:CreateSlider({
    Name = "Hip Height",
    Range = {2, 17},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = 2,
    Flag = "HipHeightSlider",
    Callback = function(Value)
        currentHeight = Value
        if isEnabled then
            applyHipHeight(currentHeight)
        end
    end,
})

-- Presets Section
MainTab:CreateSection("Quick Presets")

local presets = {
    {name = "Default (2)",                              value = 2},
    {name = "12 (Cannot distract pebble,dyle,dandy)",   value = 12},
    {name = "17 (can distract lethals and pebble)",     value = 17},
}

for _, preset in ipairs(presets) do
    MainTab:CreateButton({
        Name = preset.name,
        Callback = function()
            currentHeight = preset.value
            Slider:Set(preset.value)
            if isEnabled then
                applyHipHeight(preset.value)
            end
            Rayfield:Notify({
                Title = "Preset Applied",
                Content = "Hip Height set to " .. preset.value .. " studs",
                Duration = 2,
                Image = 4483362458,
            })
        end,
    })
end

-- Info Section
MainTab:CreateSection("Info")
MainTab:CreateLabel("Hip Height Range: 2 - 17 studs")
MainTab:CreateLabel("Default Roblox Hip Height: ~2 studs")
MainTab:CreateLabel("Made by SpinningShrimpo | Discord/Yt/Tiktok")

-- Load notification
Rayfield:Notify({
    Title = "Hip Height Changer",
    Content = "Loaded! Made by SpinningShrimpo\nFind me on Discord/Yt/Tiktok!",
    Duration = 5,
    Image = 4483362458,
})
