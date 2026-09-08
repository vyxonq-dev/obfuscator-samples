local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- // Custom Get Key Overlay
local GetKeyGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")
local Corner = Instance.new("UICorner")

GetKeyGui.Name = "NagiGetKey"
GetKeyGui.Parent = game:GetService("CoreGui")
GetKeyGui.DisplayOrder = 999

Frame.Size = UDim2.new(0, 120, 0, 40)
Frame.Position = UDim2.new(0.5, -60, 0.5, 80)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Parent = GetKeyGui

Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = Frame

Button.Size = UDim2.new(1, 0, 1, 0)
Button.BackgroundTransparency = 1
Button.Text = "Get Key"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.GothamBold
Button.TextSize = 14
Button.Parent = Frame

Button.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/MQAut7egGp")
    Rayfield:Notify({
        Title = "Copied!",
        Content = "Discord link copied to clipboard.",
        Duration = 3,
        Image = 4483362458,
    })
end)

-- // Rayfield Window
local Window = Rayfield:CreateWindow({
   Name = "Nagi's Hub universal",
   LoadingTitle = "Nagi's Hub",
   LoadingSubtitle = "by Nagi",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "NagisHub",
      FileName = "Universal"
   },
   KeySystem = true,
   KeySettings = {
      Title = "Key System",
      Subtitle = "Join Discord for key",
      FileName = "NagisKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"REO1002"}
   }
})

-- Cleanup key helper
if GetKeyGui then GetKeyGui:Destroy() end

local MainTab = Window:CreateTab("Abilities", 4483362458)
local CombatTab = Window:CreateTab("Combat", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- // Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local flyEnabled = false
local flySpeed = 50
local walkSpeedEnabled = false
local walkSpeedValue = 16
local jumpBoostEnabled = false
local jumpPowerValue = 50
local noclipEnabled = false
local antiAFKEnabled = false

local playerAimbotEnabled = false
local npcAimbotEnabled = false

-- // Aimbot Logic
local function getClosest(targetType)
    local closestTarget = nil
    local shortestDistance = math.huge

    if targetType == "Player" then
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
                local pos, onScreen = camera:WorldToViewportPoint(v.Character.Head.Position)
                if onScreen then
                    local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)).Magnitude
                    if distance < shortestDistance then
                        closestTarget = v.Character.Head
                        shortestDistance = distance
                    end
                end
            end
        end
    elseif targetType == "NPC" then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Humanoid") and v.Parent ~= character and not game.Players:GetPlayerFromCharacter(v.Parent) and v.Health > 0 then
                local head = v.Parent:FindFirstChild("Head") or v.Parent:FindFirstChild("HumanoidRootPart")
                if head then
                    local pos, onScreen = camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(camera.ViewportSize.X/2, camera.ViewportSize.Y/2)).Magnitude
                        if distance < shortestDistance then
                            closestTarget = head
                            shortestDistance = distance
                        end
                    end
                end
            end
        end
    end
    return closestTarget
end

RunService.RenderStepped:Connect(function()
    if playerAimbotEnabled then
        local target = getClosest("Player")
        if target then
            camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
        end
    elseif npcAimbotEnabled then
        local target = getClosest("NPC")
        if target then
            camera.CFrame = CFrame.new(camera.CFrame.Position, target.Position)
        end
    end
end)

-- // 3D Camera Relative Flight
local bg, bv
local function startFly()
    if bg then bg:Destroy() end
    if bv then bv:Destroy() end
    
    bg = Instance.new("BodyGyro", rootPart)
    bv = Instance.new("BodyVelocity", rootPart)
    
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    bv.velocity = Vector3.new(0, 0, 0)

    task.spawn(function()
        while flyEnabled and character and rootPart do
            humanoid.PlatformStand = true
            bg.cframe = camera.CFrame
            
            local moveDir = humanoid.MoveDirection
            if moveDir.Magnitude > 0 then
                local look = camera.CFrame.LookVector
                local right = camera.CFrame.RightVector
                local horizontalLook = Vector3.new(look.X, 0, look.Z).Unit
                local horizontalRight = Vector3.new(right.X, 0, right.Z).Unit
                
                local forwardAmount = moveDir:Dot(horizontalLook)
                local rightAmount = moveDir:Dot(horizontalRight)
                
                bv.velocity = (look * forwardAmount + right * rightAmount) * flySpeed
            else
                bv.velocity = Vector3.new(0, 0, 0)
            end
            RunService.RenderStepped:Wait()
        end
        if bg then bg:Destroy() end
        if bv then bv:Destroy() end
        humanoid.PlatformStand = false
    end)
end

-- // Combat UI
CombatTab:CreateToggle({
   Name = "Player Aimbot",
   CurrentValue = false,
   Callback = function(Value)
      playerAimbotEnabled = Value
   end,
})

CombatTab:CreateToggle({
   Name = "NPC Aimbot",
   CurrentValue = false,
   Callback = function(Value)
      npcAimbotEnabled = Value
   end,
})

-- // Abilities UI
MainTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Callback = function(Value)
      flyEnabled = Value
      if flyEnabled then startFly() end
   end,
})

MainTab:CreateSlider({
   Name = "Fly Speed",
   Range = {10, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 50,
   Callback = function(Value)
      flySpeed = Value
   end,
})

MainTab:CreateToggle({
   Name = "Walk Speed Boost",
   CurrentValue = false,
   Callback = function(Value)
      walkSpeedEnabled = Value
      if not Value then humanoid.WalkSpeed = 16 end
   end,
})

MainTab:CreateSlider({
   Name = "Boost Speed",
   Range = {16, 500},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Callback = function(Value)
      walkSpeedValue = Value
   end,
})

MainTab:CreateToggle({
   Name = "Jump Boost",
   CurrentValue = false,
   Callback = function(Value)
      jumpBoostEnabled = Value
      humanoid.UseJumpPower = true
      if not Value then humanoid.JumpPower = 50 end
   end,
})

MainTab:CreateSlider({
   Name = "Jump Height",
   Range = {50, 500},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Callback = function(Value)
      jumpPowerValue = Value
   end,
})

MainTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Callback = function(Value)
      noclipEnabled = Value
   end,
})

MiscTab:CreateToggle({
   Name = "Anti AFK",
   CurrentValue = false,
   Callback = function(Value)
      antiAFKEnabled = Value
   end,
})

-- // Stability Loops
RunService.Stepped:Connect(function()
    if walkSpeedEnabled then humanoid.WalkSpeed = walkSpeedValue end
    if jumpBoostEnabled then humanoid.JumpPower = jumpPowerValue end
    
    if noclipEnabled and character then
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

player.Idled:Connect(function()
    if antiAFKEnabled then
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), camera.CFrame)
        task.wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), camera.CFrame)
    end
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    if flyEnabled then startFly() end
end)