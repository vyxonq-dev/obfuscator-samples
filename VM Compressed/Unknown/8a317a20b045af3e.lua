local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Elite Universal Lock",
   LoadingTitle = "Applying Fixes...",
   LoadingSubtitle = "by minecraftsbni",
   ConfigurationSaving = { Enabled = false }
})

-- // Variables
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local AimlockEnabled = false
local FOVRadius = 150
local Smoothing = 1 -- Instant Snap

-- // THE CIRCLE (Guaranteed Visibility)
local Gui = Instance.new("ScreenGui")
Gui.Name = "UniversalCircle"
Gui.Parent = game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")
Gui.IgnoreGuiInset = true

local Ring = Instance.new("Frame")
Ring.Parent = Gui
Ring.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Ring.BackgroundTransparency = 1 
Ring.AnchorPoint = Vector2.new(0.5, 0.5)
Ring.Position = UDim2.new(0.5, 0, 0.5, 0)

local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 255, 255)
UIStroke.Parent = Ring

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Ring

-- // TARGETING LOGIC (Lock to anyone in circle)
local function GetClosestToCenter()
    local Target = nil
    local ClosestDistance = FOVRadius
    local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("Head") then
            local Hum = Player.Character:FindFirstChildOfClass("Humanoid")
            if Hum and Hum.Health > 0 then
                local Pos, OnScreen = Camera:WorldToViewportPoint(Player.Character.Head.Position)
                
                if OnScreen then
                    local Distance = (Vector2.new(Pos.X, Pos.Y) - Center).Magnitude
                    if Distance <= FOVRadius and Distance < ClosestDistance then
                        Target = Player
                        ClosestDistance = Distance
                    end
                end
            end
        end
    end
    return Target
end

-- // THE LOCK-ON LOOP
RunService:BindToRenderStep("LockOn", Enum.RenderPriority.Camera.Value + 1, function()
    Ring.Size = UDim2.new(0, FOVRadius * 2, 0, FOVRadius * 2)
    
    if AimlockEnabled then
        local Target = GetClosestToCenter()
        if Target and Target.Character and Target.Character:FindFirstChild("Head") then
            -- Force Camera CFrame to Target
            local TargetPos = Target.Character.Head.Position
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, TargetPos), 1/Smoothing)
        end
    end
end)

-- // UI CONTROLS
local Tab = Window:CreateTab("Main", 4483362458)

Tab:CreateToggle({
   Name = "Enable Aimlock",
   CurrentValue = false,
   Callback = function(Value) AimlockEnabled = Value end,
})

Tab:CreateSlider({
   Name = "Circle Radius",
   Range = {50, 800},
   Increment = 1,
   CurrentValue = 150,
   Callback = function(Value) FOVRadius = Value end,
})

Tab:CreateSlider({
   Name = "Snap Power (Lower = Faster)",
   Range = {1, 10},
   Increment = 1,
   CurrentValue = 1,
   Callback = function(Value) Smoothing = Value end,
})
