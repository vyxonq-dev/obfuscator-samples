-- Load Orion UI
local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
    Name = "Pablo Hub - Arsenal",
    HidePremium = true,
    SaveConfig = true,
    ConfigFolder = "PabloHub"
})

-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

-- Wait for character
local function GetHRP()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    return char, hrp
end

-- Variables
local AimbotEnabled = false
local AimbotFOV = 100
local AimbotPart = "Head"
local TeamCheck = true
local ESPEnabled = false
local FlyEnabled = false
local NoclipEnabled = false
local InfiniteJumpEnabled = false
local WaterInvisible = false

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- Utility
local function LerpVector3(a,b,alpha) return a + (b-a)*alpha end

-- Main RenderStepped
RunService.RenderStepped:Connect(function()
    local char, hrp = GetHRP()
    local cam = Workspace.CurrentCamera

    -- Aimbot
    if AimbotEnabled then
        local closest, shortest = nil, math.huge
        local aimPos = isMobile and Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2) or UserInputService:GetMouseLocation()
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild(AimbotPart) and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
                if TeamCheck and plr.Team == LocalPlayer.Team then continue end
                local part = plr.Character[AimbotPart]
                -- Visible check with raycast
                local rayParams = RaycastParams.new()
                rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
                rayParams.IgnoreWater = true
                local ray = Workspace:Raycast(cam.CFrame.Position, (part.Position - cam.CFrame.Position), rayParams)
                if ray and ray.Instance:IsDescendantOf(part.Parent) then
                    local screenPos, onScreen = cam:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local dist = (Vector2.new(screenPos.X, screenPos.Y)-aimPos).Magnitude
                        if dist < shortest and dist <= AimbotFOV then
                            closest = plr
                            shortest = dist
                        end
                    end
                end
            end
        end
        if closest then
            local targetPart = closest.Character[AimbotPart]
            cam.CFrame = CFrame.new(cam.CFrame.Position, LerpVector3(cam.CFrame.Position + cam.CFrame.LookVector, targetPart.Position, 0.3))
        end
    end

    -- ESP
    if ESPEnabled then
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                if not plr.Character:FindFirstChild("ESPBox") then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Name = "ESPBox"
                    box.Adornee = plr.Character.HumanoidRootPart
                    box.AlwaysOnTop = true
                    box.ZIndex = 10
                    box.Size = Vector3.new(2,5,1)
                    box.Color3 = Color3.fromRGB(255,0,0)
                    box.Parent = plr.Character
                end
            end
        end
    else
        for _, plr in pairs(Players:GetPlayers()) do
            if plr.Character and plr.Character:FindFirstChild("ESPBox") then
                plr.Character.ESPBox:Destroy()
            end
        end
    end

    -- Fly/Swim
    if FlyEnabled then
        local bv = hrp:FindFirstChild("FlyBV") or Instance.new("BodyVelocity")
        bv.Name = "FlyBV"
        bv.MaxForce = Vector3.new(1e6,1e6,1e6)
        bv.Parent = hrp

        local bg = hrp:FindFirstChild("FlyBG") or Instance.new("BodyGyro")
        bg.Name = "FlyBG"
        bg.MaxTorque = Vector3.new(1e6,1e6,1e6)
        bg.CFrame = hrp.CFrame
        bg.Parent = hrp

        local camCF = cam.CFrame
        local move = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - camCF.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + camCF.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0,1,0) end
        if move.Magnitude > 0 then bv.Velocity = move.Unit*100 else bv.Velocity = Vector3.new(0,0,0) end
        bg.CFrame = CFrame.new(hrp.Position, hrp.Position + camCF.LookVector)
    else
        if hrp:FindFirstChild("FlyBV") then hrp.FlyBV:Destroy() end
        if hrp:FindFirstChild("FlyBG") then hrp.FlyBG:Destroy() end
    end

    -- Noclip
    if NoclipEnabled then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end

    -- Water invisible
    if WaterInvisible then
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Material == Enum.Material.Water then
                v.Transparency = 1
                v.CanCollide = false
            end
        end
    end
end)

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        LocalPlayer.Character.Humanoid:ChangeState("Jumping")
    end
end)

-- Orion UI
local Tab = Window:MakeTab({Name="Main", Icon="rbxassetid://4483345998", PremiumOnly=false})
Tab:AddToggle({Name="Aimbot", Default=false, Callback=function(v) AimbotEnabled=v end})
Tab:AddSlider({Name="Aimbot FOV", Min=50, Max=500, Default=100, Color=Color3.fromRGB(255,255,255), Increment=5, Callback=function(v) AimbotFOV=v end})
Tab:AddToggle({Name="ESP", Default=false, Callback=function(v) ESPEnabled=v end})
Tab:AddToggle({Name="Infinite Jump", Default=false, Callback=function(v) InfiniteJumpEnabled=v end})
Tab:AddToggle({Name="Fly/Swim", Default=false, Callback=function(v) FlyEnabled=v end})
Tab:AddToggle({Name="Noclip", Default=false, Callback=function(v) NoclipEnabled=v end})
Tab:AddToggle({Name="Invisible Water", Default=false, Callback=function(v) WaterInvisible=v end})

OrionLib:Init()