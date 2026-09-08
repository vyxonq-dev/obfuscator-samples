local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Performance Booster",
    SubTitle = "by Gemini",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- PC Users can use Left Control
})

-- CREATE FLOATING TOGGLE BUTTON (For Mobile/Delta Users)
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ToggleButton.Position = UDim2.new(0.05, 0, 0.1, 0) -- Position on screen
ToggleButton.Size = UDim2.new(0, 80, 0, 40)
ToggleButton.Text = "Toggle UI"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Draggable = true -- You can move it around

ToggleButton.MouseButton1Click:Connect(function()
    Window:Minimize() -- Built-in Fluent function to toggle visibility
end)

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "zap" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

--- [ PERFORMANCE BUTTONS ] ---

Tabs.Main:AddButton({
    Title = "Boost FPS",
    Description = "Removes textures and shadows for max speed.",
    Callback = function()
        local settings = settings()
        settings.Rendering.QualityLevel = Enum.QualityLevel.Level01
        
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
                v.Material = Enum.Material.Plastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
        game:GetService("Lighting").GlobalShadows = false
        
        Fluent:Notify({Title = "Applied", Content = "FPS Boost Active", Duration = 3})
    end
})

Tabs.Main:AddSlider("FPSCap", {
    Title = "FPS Cap",
    Default = 60,
    Min = 30,
    Max = 999999999999999999999999999999999999999999999999999999999999999999999999,
    Rounding = 0,
    Callback = function(Value)
        setfpscap(Value)
    end
})

Tabs.Settings:AddButton({
    Title = "Destroy UI",
    Description = "Completely removes the script and toggle button.",
    Callback = function()
        Window:Destroy()
        ScreenGui:Destroy()
    end
})

Window:SelectTab(1)
