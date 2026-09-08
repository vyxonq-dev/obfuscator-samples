-- 1. Load Bracket V3.4
local Bracket = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Bracket/main/BracketV34_dev.lua"))()
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- 2. Create Window (Perfectly Centered)
local Window = Bracket:Window({
    Name = "360 NO SKOPE | '2026 is the new 2016'",
    Enabled = false,
    Color = Color3.fromRGB(255, 0, 0),
    Size = UDim2.new(0, 450, 0, 450),
    Position = UDim2.new(0.5, -225, 0.5, -225)
})

-- 3. Floating Squircle (Opposite Colors: White BG, Red Details)
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local FloatButton = Instance.new("ImageButton", ScreenGui)
FloatButton.Size = UDim2.new(0, 60, 0, 60)
FloatButton.Position = UDim2.new(0, 50, 0.5, -30)
FloatButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White BG
FloatButton.Image = "rbxassetid://1847190174"
FloatButton.ImageColor3 = Color3.fromRGB(255, 0, 0) -- Red Logo
FloatButton.BorderSizePixel = 0

Instance.new("UICorner", FloatButton).CornerRadius = UDim.new(0, 18)
local Stroke = Instance.new("UIStroke", FloatButton)
Stroke.Thickness = 3
Stroke.Color = Color3.fromRGB(255, 0, 0) -- Red Stroke

-- 4. Lego Animation & UI Reveal
local function toggleUI(open)
    if open then
        local info = TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In)
        TweenService:Create(FloatButton, info, {
            Rotation = 180, Size = UDim2.new(0, 0, 0, 0),
            ImageTransparency = 1, BackgroundTransparency = 1
        }):Play()
        task.wait(0.4)
        FloatButton.Visible = false
        Window:SetValue(true)
    else
        Window:SetValue(false)
        FloatButton.Visible = true
        TweenService:Create(FloatButton, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Rotation = 0, Size = UDim2.new(0, 60, 0, 60),
            ImageTransparency = 0, BackgroundTransparency = 0
        }):Play()
    end
end

FloatButton.MouseButton1Click:Connect(function() toggleUI(true) end)

-- 5. Tabs & Sections
local MainTab = Window:Tab({Name = "Main"})
local Combat = MainTab:Section({Name = "Combat", Side = "Left"})
local Visuals = MainTab:Section({Name = "Visuals", Side = "Right"})
local Misc = MainTab:Section({Name = "Miscellaneous", Side = "Left"})

-- Aimbot Vars
local aimEnabled = false
Combat:Toggle({Name = "Aimbot", Callback = function(s) aimEnabled = s end})

-- ESP Vars
local espEnabled = false
Visuals:Toggle({Name = "Player ESP", Callback = function(s) espEnabled = s end})
local fbEnabled = false
Visuals:Toggle({Name = "Fullbright", Callback = function(s) fbEnabled = s end})

-- The "Trap" Button
Misc:Button({
    Name = "Serversideify (FE Bypass)",
    Callback = function()
        LocalPlayer:Kick("\n\n[360 NO SKOPE ERROR]\nHah, gullible child.")
    end
})

Misc:Button({
    Name = "Minimize to Squircle",
    Callback = function() toggleUI(false) end
})

-- 6. Core Logic Loop
RunService.RenderStepped:Connect(function()
    -- Fullbright
    if fbEnabled then
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.GlobalShadows = false
    end

    -- Aimbot
    if aimEnabled then
        local target = nil
        local shortestDist = 1000
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
                local pos, onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
                if onScreen then
                    local mag = (Vector2.new(pos.X, pos.Y) - game:GetService("UserInputService"):GetMouseLocation()).Magnitude
                    if mag < shortestDist then
                        target = v
                        shortestDist = mag
                    end
                end
            end
        end
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
        end
    end
end)

-- Basic ESP using Folders (Legacy Style)
local function handleESP()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local highlight = v.Character:FindFirstChild("ESPHighlight") or Instance.new("Highlight", v.Character)
            highlight.Name = "ESPHighlight"
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.Enabled = espEnabled
        end
    end
end
RunService.Heartbeat:Connect(handleESP)