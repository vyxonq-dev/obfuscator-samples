-- Execute external Spider Script
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))("Spider Script")

-----------------------------
-- Services and Variables  --
-----------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Backpack = LocalPlayer:WaitForChild("Backpack")

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local Humanoid = Character:WaitForChild("Humanoid")

-------------------------------------------------
-- [1] STARE TOOL & UI (Orbiting a target)   --
-------------------------------------------------
-- Default orbit parameters
local orbitSpeed = 1      -- Default orbit speed (min: 0)
local orbitRadius = 6     -- Default orbit radius (min: 2.5) – adjusted by 0.1 increments
local orbitHeight = 4     -- Default orbit height (min: 2)

-- UI Setup (visible only when holding Stare)
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = PlayerGui
screenGui.Enabled = false  -- Only visible when holding the tool

-- Container frame anchored to the top-right
local controlFrame = Instance.new("Frame")
controlFrame.Size = UDim2.new(0, 200, 0, 210)
controlFrame.AnchorPoint = Vector2.new(1, 0)
controlFrame.Position = UDim2.new(1, -10, 0, 10)
controlFrame.BackgroundTransparency = 1
controlFrame.Parent = screenGui

-- Helper to create a parameter group (label and two side‐by‐side buttons)
local function createParamGroup(parent, yPos, paramName, initialValue)
    local label = Instance.new("TextLabel")
    label.Name = paramName .. "Label"
    label.Size = UDim2.new(0, 200, 0, 30)
    label.Position = UDim2.new(0, 0, 0, yPos)
    label.Text = paramName .. ": " .. tostring(initialValue)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Parent = parent

    local btnFrame = Instance.new("Frame")
    btnFrame.Name = paramName .. "Buttons"
    btnFrame.Size = UDim2.new(0, 200, 0, 30)
    btnFrame.Position = UDim2.new(0, 0, 0, yPos + 30)
    btnFrame.BackgroundTransparency = 1
    btnFrame.Parent = parent

    local minusBtn = Instance.new("TextButton")
    minusBtn.Name = paramName .. "Minus"
    minusBtn.Size = UDim2.new(0.5, 0, 1, 0)
    minusBtn.Position = UDim2.new(0, 0, 0, 0)
    minusBtn.Text = "-"
    minusBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    minusBtn.TextColor3 = Color3.new(1, 1, 1)
    minusBtn.TextScaled = true
    minusBtn.Parent = btnFrame

    local plusBtn = Instance.new("TextButton")
    plusBtn.Name = paramName .. "Plus"
    plusBtn.Size = UDim2.new(0.5, 0, 1, 0)
    plusBtn.Position = UDim2.new(0.5, 0, 0, 0)
    plusBtn.Text = "+"
    plusBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    plusBtn.TextColor3 = Color3.new(1, 1, 1)
    plusBtn.TextScaled = true
    plusBtn.Parent = btnFrame

    return {
        label = label,
        minus = minusBtn,
        plus = plusBtn,
    }
end

-- Create parameter groups for Speed, Radius, and Height.
local speedGroup = createParamGroup(controlFrame, 0, "Speed", orbitSpeed)
local radiusGroup = createParamGroup(controlFrame, 70, "Radius", orbitRadius)
local heightGroup = createParamGroup(controlFrame, 140, "Height", orbitHeight)

-- Speed button logic (increments of 1, min 0)
speedGroup.plus.MouseButton1Click:Connect(function()
    orbitSpeed = orbitSpeed + 1
    speedGroup.label.Text = "Speed: " .. tostring(orbitSpeed)
end)
speedGroup.minus.MouseButton1Click:Connect(function()
    orbitSpeed = math.max(0, orbitSpeed - 1)
    speedGroup.label.Text = "Speed: " .. tostring(orbitSpeed)
end)

-- Radius button logic (increments of 0.1, min 2.5)
radiusGroup.plus.MouseButton1Click:Connect(function()
    orbitRadius = orbitRadius + 0.1
    radiusGroup.label.Text = "Radius: " .. string.format("%.1f", orbitRadius)
end)
radiusGroup.minus.MouseButton1Click:Connect(function()
    orbitRadius = math.max(2.5, orbitRadius - 0.1)
    radiusGroup.label.Text = "Radius: " .. string.format("%.1f", orbitRadius)
end)

-- Height button logic (increments of 1, min 2)
heightGroup.plus.MouseButton1Click:Connect(function()
    orbitHeight = orbitHeight + 1
    heightGroup.label.Text = "Height: " .. tostring(orbitHeight)
end)
heightGroup.minus.MouseButton1Click:Connect(function()
    orbitHeight = math.max(2, orbitHeight - 1)
    heightGroup.label.Text = "Height: " .. tostring(orbitHeight)
end)

-- Create the Stare tool
local stareTool = Instance.new("Tool")
stareTool.Name = "Stare"
stareTool.RequiresHandle = false
stareTool.Parent = Backpack

local stareOrbiting = false
local stareConn, stareClickConn
local stareBP, stareBG

stareTool.Equipped:Connect(function(mouse)
    screenGui.Enabled = true  -- Show the UI when holding Stare
    stareClickConn = mouse.Button1Down:Connect(function()
        if stareOrbiting then return end
        local targetPart = mouse.Target
        if targetPart then
            local targetChar = targetPart:FindFirstAncestorOfClass("Model")
            local targetPlayer = targetChar and Players:GetPlayerFromCharacter(targetChar)
            if targetPlayer and targetPlayer ~= LocalPlayer then
                local targetHRP = targetChar:FindFirstChild("HumanoidRootPart") or targetChar:FindFirstChild("Torso")
                if targetHRP then
                    stareOrbiting = true
                    Humanoid.PlatformStand = true

                    stareBP = Instance.new("BodyPosition")
                    stareBP.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                    stareBP.P = 1e4
                    stareBP.D = 100
                    stareBP.Parent = HRP

                    stareBG = Instance.new("BodyGyro")
                    stareBG.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
                    stareBG.P = 1e4
                    stareBG.D = 100
                    stareBG.Parent = HRP

                    local angle = 0
                    stareConn = RunService.RenderStepped:Connect(function(dt)
                        if not (targetHRP and targetHRP.Parent) then
                            stareConn:Disconnect()
                            stareOrbiting = false
                            if stareBP then stareBP:Destroy() stareBP = nil end
                            if stareBG then stareBG:Destroy() stareBG = nil end
                            return
                        end

                        angle = angle + (orbitSpeed * dt)
                        local targetPos = targetHRP.Position
                        local desiredPos = targetPos + Vector3.new(orbitRadius * math.cos(angle), orbitHeight, orbitRadius * math.sin(angle))
                        stareBP.Position = desiredPos

                        local direction = targetPos - desiredPos
                        local horizontalDir = Vector3.new(direction.X, 0, direction.Z)
                        if horizontalDir.Magnitude < 0.001 then
                            horizontalDir = Vector3.new(0, 0, -1)
                        else
                            horizontalDir = horizontalDir.Unit
                        end
                        local baseCFrame = CFrame.new(desiredPos, desiredPos + horizontalDir)
                        local downwardTilt = CFrame.Angles(math.rad(-45), 0, 0)
                        stareBG.CFrame = baseCFrame * downwardTilt
                    end)
                end
            end
        end
    end)
end)

stareTool.Unequipped:Connect(function()
    screenGui.Enabled = false  -- Hide UI when tool is unequipped
    if stareClickConn then
        stareClickConn:Disconnect()
        stareClickConn = nil
    end
    if stareConn then
        stareConn:Disconnect()
        stareConn = nil
    end
    if stareBP then
        stareBP:Destroy()
        stareBP = nil
    end
    if stareBG then
        stareBG:Destroy()
        stareBG = nil
    end
    stareOrbiting = false
    Humanoid.PlatformStand = false
    HRP.Velocity = Vector3.new(0, 0, 0)
    HRP.RotVelocity = Vector3.new(0, 0, 0)
end)

-------------------------------------------------
-- [2] BANG TOOL (Teleport behind target)     --
-------------------------------------------------
local bangTool = Instance.new("Tool")
bangTool.Name = "Bang"
bangTool.ToolTip = "Winter arc of palace fr"
bangTool.RequiresHandle = false
bangTool.Parent = Backpack

local bangOrbiting = false
local bangConn, bangBP, bangBG, bangClickConn
local bangTime = 0
local distanceBehind = 1.2  -- Distance behind target is now 1.2 studs

bangTool.Equipped:Connect(function(mouse)
    -- Enable PlatformStand for Bang tool
    Humanoid.PlatformStand = true
    bangClickConn = mouse.Button1Down:Connect(function()
        if bangOrbiting then return end
        local targetPart = mouse.Target
        if targetPart then
            local targetChar = targetPart:FindFirstAncestorOfClass("Model")
            local targetPlayer = targetChar and Players:GetPlayerFromCharacter(targetChar)
            if targetPlayer and targetPlayer ~= LocalPlayer then
                local targetHRP = targetChar:FindFirstChild("HumanoidRootPart") or targetChar:FindFirstChild("Torso")
                if targetHRP then
                    bangOrbiting = true
                    bangTime = 0

                    bangBP = Instance.new("BodyPosition")
                    bangBP.MaxForce = Vector3.new(1e5, 1e5, 1e5)
                    bangBP.P = 1e4
                    bangBP.D = 100
                    bangBP.Parent = HRP

                    bangBG = Instance.new("BodyGyro")
                    bangBG.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
                    bangBG.P = 1e4
                    bangBG.D = 100
                    bangBG.Parent = HRP

                    bangConn = RunService.RenderStepped:Connect(function(dt)
                        if not (targetHRP and targetHRP.Parent) then
                            bangConn:Disconnect()
                            bangOrbiting = false
                            if bangBP then bangBP:Destroy() bangBP = nil end
                            if bangBG then bangBG:Destroy() bangBG = nil end
                            return
                        end

                        bangTime = bangTime + dt
                        local targetPos = targetHRP.Position
                        local targetLook = targetHRP.CFrame.LookVector
                        local desiredPos = targetPos - (targetLook * distanceBehind)
                        bangBP.Position = desiredPos

                        -- More intense oscillation: frequency increased to 8 and amplitude increased to 40°.
                        local frequency = 8
                        local amplitude = math.rad(40)
                        local pitchOsc = math.sin(bangTime * frequency) * amplitude
                        local baseCFrame = CFrame.new(desiredPos, desiredPos + targetLook)
                        bangBG.CFrame = baseCFrame * CFrame.Angles(pitchOsc, 0, 0)
                    end)
                end
            end
        end
    end)
end)

bangTool.Unequipped:Connect(function()
    if bangClickConn then
        bangClickConn:Disconnect()
        bangClickConn = nil
    end
    if bangConn then
        bangConn:Disconnect()
        bangConn = nil
    end
    if bangBP then
        bangBP:Destroy()
        bangBP = nil
    end
    if bangBG then
        bangBG:Destroy()
        bangBG = nil
    end
    bangOrbiting = false
    Humanoid.PlatformStand = false
    HRP.Velocity = Vector3.new(0, 0, 0)
    HRP.RotVelocity = Vector3.new(0, 0, 0)
end)

-------------------------------------------------
-- [3] FLOAT TOOL (Bob up/down & tilt)          --
-------------------------------------------------
local floatTool = Instance.new("Tool")
floatTool.Name = "Float"
floatTool.ToolTip = "Makes you float and tilt while you walk."
floatTool.RequiresHandle = false
floatTool.Parent = Backpack

local floatConn, floatBP, floatBG
local baseY = 0
local floatStartTime = 0

floatTool.Equipped:Connect(function(mouse)
    -- Float tool does not force PlatformStand, so movement remains normal.
    baseY = HRP.Position.Y
    floatStartTime = tick()
    
    floatBP = Instance.new("BodyPosition")
    floatBP.MaxForce = Vector3.new(0, 1e5, 0)
    floatBP.P = 1e4
    floatBP.D = 100
    floatBP.Parent = HRP
    
    floatBG = Instance.new("BodyGyro")
    floatBG.MaxTorque = Vector3.new(0, 0, 1e5)
    floatBG.P = 1e4
    floatBG.D = 100
    floatBG.Parent = HRP
    
    floatConn = RunService.RenderStepped:Connect(function(dt)
        local t = tick() - floatStartTime
        local offsetY = math.sin(t * 1) * 2  -- Vertical bobbing
        floatBP.Position = Vector3.new(HRP.Position.X, baseY + offsetY, HRP.Position.Z)
        
        local rollOsc = math.sin(t * 1) * math.rad(10)  -- Tilt (roll) oscillation
        local _, currentYaw, _ = HRP.CFrame:ToEulerAnglesYXZ()
        floatBG.CFrame = CFrame.Angles(0, currentYaw, rollOsc)
    end)
end)

floatTool.Unequipped:Connect(function()
    if floatConn then
        floatConn:Disconnect()
        floatConn = nil
    end
    if floatBP then
        floatBP:Destroy()
        floatBP = nil
    end
    if floatBG then
        floatBG:Destroy()
        floatBG = nil
    end
    HRP.Velocity = Vector3.new(0, 0, 0)
    HRP.RotVelocity = Vector3.new(0, 0, 0)
end)
