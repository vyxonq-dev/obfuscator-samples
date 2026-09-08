--[[ 
    RAIX HUB - ORION UI
    Owner: Prince
    Credit: RAIX
    Date: 2025
]]

-- SERVICES
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local LocalPlayer = Players.LocalPlayer

-- ORION UI
local OrionLib = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/shlexware/Orion/main/source"
))()

-- WINDOW
local Window = OrionLib:MakeWindow({
    Name = "RAIX HUB",
    HidePremium = true,
    SaveConfig = false,
    ConfigFolder = "RAIX"
})

-- TAB
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483362458",
    PremiumOnly = false
})

--------------------------------------------------
-- SPEED
--------------------------------------------------
MainTab:AddToggle({
    Name = "Speed Boost",
    Default = false,
    Callback = function(Value)
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = Value and 30 or 16
        end
    end
})

--------------------------------------------------
-- JUMP
--------------------------------------------------
MainTab:AddToggle({
    Name = "Jump Boost",
    Default = false,
    Callback = function(Value)
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.UseJumpPower = true
            hum.JumpPower = Value and 80 or 50
        end
    end
})

--------------------------------------------------
-- WALL INVISIBLE / NOCLIP
--------------------------------------------------
MainTab:AddToggle({
    Name = "Wall Invisible (Noclip)",
    Default = false,
    Callback = function(Value)
        for _,v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = not Value
                v.Transparency = Value and 0.6 or 0
            end
        end
    end
})

--------------------------------------------------
-- INSTANT PROXIMITY PROMPT
--------------------------------------------------
MainTab:AddToggle({
    Name = "Instant Proximity Prompt",
    Default = false,
    Callback = function(Value)
        if Value then
            ProximityPromptService.PromptButtonHoldBegan:Connect(function(p)
                fireproximityprompt(p)
            end)
        end
    end
})

--------------------------------------------------
-- PLAYER ESP (NOT COVERED)
--------------------------------------------------
MainTab:AddToggle({
    Name = "Player ESP",
    Default = false,
    Callback = function(Value)
        for _,plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = plr.Character.HumanoidRootPart
                if Value then
                    if not hrp:FindFirstChild("RAIX_ESP") then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Name = "RAIX_ESP"
                        box.Adornee = hrp
                        box.Size = Vector3.new(4,6,4)
                        box.AlwaysOnTop = true
                        box.ZIndex = 10
                        box.Transparency = 0.5
                        box.Color3 = Color3.new(1,1,1)
                        box.Parent = hrp
                    end
                else
                    if hrp:FindFirstChild("RAIX_ESP") then
                        hrp.RAIX_ESP:Destroy()
                    end
                end
            end
        end
    end
})

--------------------------------------------------
-- HITBOX EXTENDER
--------------------------------------------------
MainTab:AddToggle({
    Name = "Hitbox Extender",
    Default = false,
    Callback = function(Value)
        for _,plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = plr.Character.HumanoidRootPart
                hrp.Size = Value and Vector3.new(8,8,8) or Vector3.new(2,2,1)
                hrp.Transparency = Value and 0.6 or 1
                hrp.CanCollide = false
            end
        end
    end
})

--------------------------------------------------
-- INIT
--------------------------------------------------
OrionLib:Init()
