local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "BWL Hub",
    LoadingTitle = "BWL Hub",
    LoadingSubtitle = "NFL Universe",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NFLUniverse",
        FileName = "Config"
    }
})

local MainTab = Window:CreateTab("Main", nil)
local CreditsTab = Window:CreateTab("Credits", nil)

-- Variables
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local plr = Players.LocalPlayer

local teleportEnabled = false
local desyncMagsEnabled = false
local walkSpeedEnabled = false
local jumpPowerEnabled = false
local customWalkSpeed = 25
local customJumpPower = 50

-- Tackle Reach Variables
local tackleReachEnabled = false
local tackleReachDistance = 15

-- Auto Catch Variables
local autoCatchEnabled = false
local autoCatchDistance = 25

-- CFrame Speed Variables
local cframeSpeedEnabled = false
local cframeSpeed = 1

-- Desync Variables
local magnetEnabled = false
local magnetDistance = 120
local posCache = {}
local theonern = nil
local ifsm1gotfb = false
local og1 = CFrame.new()
local prvnt = false

local char = plr.Character or plr.CharacterAdded:Wait()
local hrp = char:WaitForChild('HumanoidRootPart')

local validNames = {
    ['Football'] = true,
    ['Football MeshPart'] = true
}

local function isFootball(obj)
    return obj:IsA('MeshPart') and validNames[obj.Name]
end

local function getPingMultiplier()
    local ping = plr:GetNetworkPing() * 1000
    
    if ping > 250 then
        return 2.5
    elseif ping > 200 then
        return 2.0
    elseif ping > 150 then
        return 1.7
    elseif ping > 100 then
        return 1.4
    elseif ping > 50 then
        return 1.2
    else
        return 1.0
    end
end

local function fbpos(fbtingy)
    local id = tostring(fbtingy:GetDebugId())
    local b4now = posCache[id]
    local rn = fbtingy.Position
    posCache[id] = rn
    return rn, b4now or rn
end

local function ifsm1gotit()
    if theonern and theonern.Parent then
        local parent = theonern.Parent
        if parent:IsA('Model') and game.Players:GetPlayerFromCharacter(parent) then
            return true
        end
        for _, player in next, game.Players:GetPlayers() do
            if player.Character and theonern:IsDescendantOf(player.Character) then
                return true
            end
        end
    end
    return false
end

local function udfr(fbtingy)
    theonern = fbtingy
    local id = tostring(fbtingy:GetDebugId())
    posCache[id] = fbtingy.Position
end

workspace.DescendantAdded:Connect(function(d)
    if isFootball(d) then
        udfr(d)
        ifsm1gotfb = false
        d.AncestryChanged:Connect(function()
            if d.Parent and d.Parent:IsA('Model') and game.Players:GetPlayerFromCharacter(d.Parent) then
                ifsm1gotfb = true
            elseif d.Parent == workspace or d.Parent == nil then
                ifsm1gotfb = false
            end
        end)
    end
end)

workspace.DescendantRemoving:Connect(function(d)
    if d == theonern then
        theonern = nil
        ifsm1gotfb = false
    end
end)

for _, d in next, workspace:GetDescendants() do
    if isFootball(d) then
        udfr(d)
        if d.Parent and d.Parent:IsA('Model') and game.Players:GetPlayerFromCharacter(d.Parent) then
            ifsm1gotfb = true
        end
    end
end

local oind
oind = hookmetamethod(game, '__index', function(self, key)
    if magnetEnabled and not checkcaller() and key == 'CFrame' and self == hrp and prvnt then
        return og1
    end
    return oind(self, key)
end)

game:GetService('RunService').Heartbeat:Connect(function()
    if not magnetEnabled or not theonern or not theonern.Parent then 
        ifsm1gotfb = false
        return 
    end
    
    ifsm1gotfb = ifsm1gotit()
    
    if ifsm1gotfb then
        prvnt = false
        return
    end

    local pos, old = fbpos(theonern)
    local d0 = (hrp.Position - pos).Magnitude
    if d0 > magnetDistance then return end

    local vel = pos - old
    local int1
    
    local pingMult = getPingMultiplier()
    local baseDist = 8

    if vel.Magnitude > 0.1 then
        int1 = pos + (vel.Unit * baseDist * pingMult)
    else
        int1 = pos + Vector3.new(5, 0, 5) * pingMult
    end

    int1 = Vector3.new(int1.X, math.max(int1.Y, pos.Y), int1.Z)

    og1 = hrp.CFrame
    prvnt = true
    hrp.CFrame = CFrame.new(int1)
    game:GetService('RunService').RenderStepped:Wait()
    hrp.CFrame = og1
    prvnt = false
end)

plr.CharacterAdded:Connect(function(c2)
    char = c2
    hrp = c2:WaitForChild('HumanoidRootPart')
    prvnt = false
    posCache = {}
end)

-- Get Football Function
local function getFootball()
    -- Check Park Map
    local parkMap = Workspace:FindFirstChild("ParkMap")
    if parkMap and parkMap:FindFirstChild("Replicated") then
        local fields = parkMap.Replicated:FindFirstChild("Fields")
        if fields then
            local parkFields = {
                fields:FindFirstChild("LeftField"),
                fields:FindFirstChild("RightField"),
                fields:FindFirstChild("BLeftField"),
                fields:FindFirstChild("BRightField"),
                fields:FindFirstChild("HighField"),
                fields:FindFirstChild("TLeftField"),
                fields:FindFirstChild("TRightField")
            }
            
            for _, field in ipairs(parkFields) do
                if field and field:FindFirstChild("Replicated") then
                    local football = field.Replicated:FindFirstChild("Football")
                    if football and football:IsA("BasePart") then 
                        return football 
                    end
                end
            end
        end
    end
    
    -- Check Games Folder
    local gamesFolder = Workspace:FindFirstChild("Games")
    if gamesFolder then
        for _, gameInstance in ipairs(gamesFolder:GetChildren()) do
            local replicatedFolder = gameInstance:FindFirstChild("Replicated")
            if replicatedFolder then
                for _, item in ipairs(replicatedFolder:GetChildren()) do
                    if item:IsA("BasePart") and item.Name == "Football" then 
                        return item 
                    end
                end
            end
        end
    end
    
    return nil
end

-- Tackle Reach Section
local TackleSection = MainTab:CreateSection("Tackle Reach")

local TackleReachToggle = MainTab:CreateToggle({
    Name = "Enable Tackle Reach",
    CurrentValue = false,
    Flag = "TackleReach",
    Callback = function(Value)
        tackleReachEnabled = Value
    end,
})

local TackleReachSlider = MainTab:CreateSlider({
    Name = "Tackle Distance",
    Range = {5, 30},
    Increment = 1,
    CurrentValue = 15,
    Flag = "TackleDistance",
    Callback = function(Value)
        tackleReachDistance = Value
    end,
})

-- Auto Catch Section
local AutoCatchSection = MainTab:CreateSection("Auto Catch")

local AutoCatchToggle = MainTab:CreateToggle({
    Name = "Enable Auto Catch",
    CurrentValue = false,
    Flag = "AutoCatch",
    Callback = function(Value)
        autoCatchEnabled = Value
    end,
})

local AutoCatchSlider = MainTab:CreateSlider({
    Name = "Catch Distance",
    Range = {10, 50},
    Increment = 1,
    CurrentValue = 25,
    Flag = "CatchDistance",
    Callback = function(Value)
        autoCatchDistance = Value
    end,
})

-- Tackle Reach Handler
RunService.Heartbeat:Connect(function()
    if not tackleReachEnabled then return end
    
    local character = plr.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    -- Find all players within tackle range
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= plr and player.Character then
            local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
            local targetHumanoid = player.Character:FindFirstChild("Humanoid")
            
            if targetRoot and targetHumanoid then
                local distance = (rootPart.Position - targetRoot.Position).Magnitude
                
                -- Extend hitbox by modifying Size temporarily
                if distance <= tackleReachDistance then
                    if not targetRoot:FindFirstChild("TackleHitbox") then
                        local hitbox = Instance.new("Part")
                        hitbox.Name = "TackleHitbox"
                        hitbox.Size = targetRoot.Size * 2
                        hitbox.Transparency = 1
                        hitbox.CanCollide = false
                        hitbox.Anchored = false
                        hitbox.Massless = true
                        hitbox.CFrame = targetRoot.CFrame
                        hitbox.Parent = targetRoot
                        
                        local weld = Instance.new("WeldConstraint")
                        weld.Part0 = targetRoot
                        weld.Part1 = hitbox
                        weld.Parent = hitbox
                    end
                else
                    local hitbox = targetRoot:FindFirstChild("TackleHitbox")
                    if hitbox then
                        hitbox:Destroy()
                    end
                end
            end
        end
    end
end)

-- Auto Catch Handler
RunService.Heartbeat:Connect(function()
    if not autoCatchEnabled then return end
    
    local character = plr.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then return end
    
    -- Find the football
    local ball = getFootball()
    if not ball then return end
    
    -- Check if ball is in the air and within catch distance
    local distance = (rootPart.Position - ball.Position).Magnitude
    
    if distance <= autoCatchDistance then
        -- Check if ball is moving (being thrown)
        if ball.AssemblyLinearVelocity.Magnitude > 5 then
            -- Teleport to ball position to catch it
            rootPart.CFrame = CFrame.new(ball.Position)
            wait(0.05)
        end
    end
end)

-- CFrame Speed Handler
RunService.RenderStepped:Connect(function()
    if not cframeSpeedEnabled then return end
    
    local character = plr.Character
    if not character then return end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChild("Humanoid")
    if not rootPart or not humanoid then return end
    
    -- Check if player is moving
    if humanoid.MoveDirection.Magnitude > 0 then
        -- Move in the direction the player is facing
        local moveDirection = humanoid.MoveDirection
        rootPart.CFrame = rootPart.CFrame + (moveDirection * cframeSpeed)
    end
end)

-- Pull Vector / Ball Magnet Section
local BallSection = MainTab:CreateSection("Pull Vector")

local pullMode = "Hold" -- "Hold" or "Toggle"
local pullActive = false

local PullModeToggle = MainTab:CreateToggle({
    Name = "Toggle Mode (Off = Hold Mode)",
    CurrentValue = false,
    Flag = "PullMode",
    Callback = function(Value)
        pullMode = Value and "Toggle" or "Hold"
        if not Value then
            pullActive = false
            magnetEnabled = false
            prvnt = false
        end
    end,
})

local MagnetDistanceSlider = MainTab:CreateSlider({
    Name = "Pull Distance",
    Range = {0, 120},
    Increment = 1,
    CurrentValue = 120,
    Flag = "MagnetDistance",
    Callback = function(Value)
        magnetDistance = Value
    end,
})

-- Keybind for Pull Vector (PC + Mobile Support)
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    -- PC: Left Click | Mobile: Screen Tap
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if pullMode == "Hold" then
            pullActive = true
            magnetEnabled = true
        elseif pullMode == "Toggle" then
            pullActive = not pullActive
            magnetEnabled = pullActive
            if not pullActive then
                prvnt = false
            end
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    -- PC: Left Click | Mobile: Screen Tap
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        if pullMode == "Hold" then
            pullActive = false
            magnetEnabled = false
            prvnt = false
        end
    end
end)

local TeleportToggle = MainTab:CreateToggle({
    Name = "Teleport to Ball",
    CurrentValue = false,
    Flag = "TeleportBall",
    Callback = function(Value)
        teleportEnabled = Value
        
        if Value then
            spawn(function()
                while teleportEnabled do
                    local ball = getFootball()
                    local character = plr.Character
                    if ball and character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(ball.Position + Vector3.new(0, 3, 0))
                        end
                    end
                    wait(0.1)
                end
            end)
        end
    end,
})

-- Speed Section
local SpeedSection = MainTab:CreateSection("Speed")

local SpeedToggle = MainTab:CreateToggle({
    Name = "Enable WalkSpeed",
    CurrentValue = false,
    Flag = "Speed",
    Callback = function(Value)
        walkSpeedEnabled = Value
        
        local character = plr.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if Value then
                    humanoid.WalkSpeed = customWalkSpeed
                else
                    humanoid.WalkSpeed = 16
                end
            end
        end
    end,
})

local SpeedSlider = MainTab:CreateSlider({
    Name = "WalkSpeed Value",
    Range = {25, 55},
    Increment = 1,
    CurrentValue = 25,
    Flag = "SpeedValue",
    Callback = function(Value)
        customWalkSpeed = Value
        
        if walkSpeedEnabled then
            local character = plr.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid.WalkSpeed = Value
                end
            end
        end
    end,
})

local CFrameSpeedToggle = MainTab:CreateToggle({
    Name = "Enable CFrame Speed",
    CurrentValue = false,
    Flag = "CFrameSpeed",
    Callback = function(Value)
        cframeSpeedEnabled = Value
    end,
})

local CFrameSpeedSlider = MainTab:CreateSlider({
    Name = "CFrame Speed",
    Range = {1, 5},
    Increment = 0.1,
    CurrentValue = 1,
    Flag = "CFrameSpeedValue",
    Callback = function(Value)
        cframeSpeed = Value
    end,
})

-- Jump Power Section
local JumpSection = MainTab:CreateSection("Jump Power")

local JumpToggle = MainTab:CreateToggle({
    Name = "Enable Jump Power",
    CurrentValue = false,
    Flag = "Jump",
    Callback = function(Value)
        jumpPowerEnabled = Value
    end,
})

local JumpSlider = MainTab:CreateSlider({
    Name = "Jump Power",
    Range = {10, 200},
    Increment = 5,
    CurrentValue = 50,
    Flag = "JumpValue",
    Callback = function(Value)
        customJumpPower = Value
    end,
})

-- Jump Power Handler
local character = plr.Character or plr.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

humanoid.Jumping:Connect(function()
    if jumpPowerEnabled and humanoidRootPart then
        local jumpVelocity = Vector3.new(0, customJumpPower, 0)
        humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z) + jumpVelocity
    end
end)

-- Character Respawn Handler
plr.CharacterAdded:Connect(function(char)
    character = char
    humanoid = char:WaitForChild("Humanoid")
    humanoidRootPart = char:WaitForChild("HumanoidRootPart")
    
    humanoid.Jumping:Connect(function()
        if jumpPowerEnabled and humanoidRootPart then
            local jumpVelocity = Vector3.new(0, customJumpPower, 0)
            humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z) + jumpVelocity
        end
    end)
    
    if walkSpeedEnabled then
        humanoid.WalkSpeed = customWalkSpeed
    end
end)

Rayfield:LoadConfiguration()

-- Credits Tab
local CreditsSection = CreditsTab:CreateSection("Credits")

CreditsTab:CreateLabel("🌟 | Puff")
CreditsTab:CreateLabel("💰 | DevSphere")
CreditsTab:CreateLabel("💵 | BWL")
CreditsTab:CreateLabel("⭐ | .9953.")