local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Folder = "DreamSolutionsFlick_Config",
    Title = "Flick",
    Theme = "Dark",
    KeySystem = {
        SaveKey = true,
        Note = "Join discord to get key",
        Key = "DreamOnTop",
        URL = "https://discord.gg/8pYd7YgjtT",
    },
    Author = "DreamSolutions",
    Icon = "crosshair",
    Size = UDim2.fromOffset(460, 320),
})

local AimbotEnabled = false
local AimbotFOV = 200
local Smoothness = 5
local TeamCheck = true
local ESPEnabled = false

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.Color = Color3.fromRGB(0, 255, 170)
FOVCircle.Filled = false
FOVCircle.Transparency = 1
FOVCircle.Visible = false

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = game:GetService("UserInputService"):GetMouseLocation()
end)

local CombatTab = Window:Tab({ Title = "Combat", Icon = "target" })
local VisualsTab = Window:Tab({ Title = "Visuals", Icon = "eye" })
local UtilsTab = Window:Tab({ Title = "Utils", Icon = "box" })

local AimbotSection = CombatTab:Section({ Title = "Aimbot", Opened = true })

AimbotSection:Toggle({
    Title = "Enable Aimbot",
    Description = "Lock on target",
    Default = false,
    Callback = function(Value)
        AimbotEnabled = Value
        FOVCircle.Visible = Value
    end,
})

AimbotSection:Slider({
    Title = "FOV",
    Value = { Min = 0, Max = 800, Default = 200 },
    Callback = function(Value)
        AimbotFOV = Value
        FOVCircle.Radius = Value
    end,
})

AimbotSection:Slider({
    Title = "Smooth",
    Value = { Min = 1, Max = 20, Default = 5 },
    Callback = function(Value)
        Smoothness = Value
    end,
})

AimbotSection:Toggle({
    Title = "Team Check",
    Default = true,
    Callback = function(Value)
        TeamCheck = Value
    end,
})

local ESPSection = VisualsTab:Section({ Title = "ESP Settings", Opened = true })

local function CreateChams(player)
    if player.Character then
        local Highlight = Instance.new("Highlight")
        Highlight.Name = "Flick_ESP"
        Highlight.Adornee = player.Character
        Highlight.FillColor = Color3.fromRGB(0, 255, 170)
        Highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
        Highlight.FillTransparency = 0.25
        Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        Highlight.Parent = player.Character
    end
end

ESPSection:Toggle({
    Title = "Enable Chams",
    Default = false,
    Callback = function(Value)
        ESPEnabled = Value
        if Value then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then CreateChams(player) end
            end
        else
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Flick_ESP") then
                    player.Character.Flick_ESP:Destroy()
                end
            end
        end
    end,
})

local MovementSection = UtilsTab:Section({ Title = "Movement", Opened = true })

MovementSection:Button({
    Title = "Fly GUI",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/kATj6BSr/raw"))()
    end,
})