-- Cleanup previous UIs
if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services & Variables (Using your base)
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local Holding = false
local LockedTarget = nil 

-- Global Settings (Based on your input)
_G.AimbotEnabled = true
_G.TeamCheck = false 
_G.AimPart = "Head" 
_G.CircleRadius = 120
_G.CircleVisible = true
_G.CircleColor = Color3.fromRGB(0, 255, 0)

-- FOV Circle Creation
local FOVCircle = Drawing.new("Circle")
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Color = _G.CircleColor
FOVCircle.Thickness = 1
FOVCircle.Transparency = 0.7

-- Utility Functions
local function IsAlive(Player)
    return Player and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 and Player.Character:FindFirstChild(_G.AimPart)
end

local function GetClosestPlayer()
    local MaximumDistance = _G.CircleRadius
    local Target = nil

    for _, v in next, Players:GetPlayers() do
        if v ~= LocalPlayer and IsAlive(v) then
            if not _G.TeamCheck or v.Team ~= LocalPlayer.Team then
                local ScreenPoint, OnScreen = Camera:WorldToScreenPoint(v.Character[_G.AimPart].Position)
                if OnScreen then
                    local MousePos = UserInputService:GetMouseLocation()
                    local VectorDistance = (Vector2.new(MousePos.X, MousePos.Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                    
                    if VectorDistance < MaximumDistance then
                        MaximumDistance = VectorDistance
                        Target = v
                    end
                end
            end
        end
    end
    return Target
end

-- UI Window
local Window = Rayfield:CreateWindow({
   Name = "Sniper Arena | Precision Hub",
   LoadingTitle = "Loading Aimbot Engine...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = { Enabled = false }
})

local AimbotTab = Window:CreateTab("Aimbot", 4483362458)

AimbotTab:CreateSection("Main Settings")

AimbotTab:CreateToggle({
   Name = "Enable Aimbot",
   CurrentValue = true,
   Callback = function(Value) _G.AimbotEnabled = Value end,
})

AimbotTab:CreateToggle({
   Name = "Team Check",
   CurrentValue = false,
   Callback = function(Value) _G.TeamCheck = Value end,
})

AimbotTab:CreateDropdown({
   Name = "Target Part",
   Options = {"Head", "UpperTorso", "HumanoidRootPart"},
   CurrentOption = {"Head"},
   MultipleOptions = false,
   Callback = function(Option) _G.AimPart = Option[1] end,
})

AimbotTab:CreateSection("FOV Circle")

AimbotTab:CreateToggle({
   Name = "Show FOV Circle",
   CurrentValue = true,
   Callback = function(Value) FOVCircle.Visible = Value end,
})

AimbotTab:CreateSlider({
   Name = "FOV Radius",
   Range = {50, 500},
   Increment = 10,
   CurrentValue = 120,
   Callback = function(Value) 
       _G.CircleRadius = Value 
       FOVCircle.Radius = Value
   end,
})

-- Logic Connections
UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
        LockedTarget = nil
        FOVCircle.Color = _G.CircleColor
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = UserInputService:GetMouseLocation()
    
    if Holding and _G.AimbotEnabled then
        if not LockedTarget or not IsAlive(LockedTarget) then
            LockedTarget = GetClosestPlayer()
        end

        if LockedTarget and IsAlive(LockedTarget) then
            FOVCircle.Color = Color3.fromRGB(255, 0, 0)
            local targetPos = LockedTarget.Character[_G.AimPart].Position
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
        else
            FOVCircle.Color = _G.CircleColor
        end
    end
end)

Rayfield:Notify({
   Title = "Aimbot Ready",
   Content = "Hold Right Click to Lock Target",
   Duration = 5
})