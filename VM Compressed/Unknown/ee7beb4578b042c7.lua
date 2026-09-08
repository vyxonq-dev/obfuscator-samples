local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Quandale Hub",
   LoadingTitle = "Loading Quandale Hub...",
   LoadingSubtitle = "by GeckyZeGecko",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "QuandaleHub",
      FileName = "UserConfig"
   }
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local _G = {
    AntiAFK = false,
    GodMode = false,
    AutoFarm = false,
    Flying = false,
    FlySpeed = 50,
    Jorking = false
}

-- Anti-AFK Logic
local virtualUser = game:GetService("VirtualUser")
LocalPlayer.Idled:Connect(function()
    if _G.AntiAFK then
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
    end
end)

-- IY-Style Fly Logic
local function sFLY()
    repeat wait() until LocalPlayer and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid")
    local T = LocalPlayer.Character.HumanoidRootPart
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = 0

    local function FLY()
        _G.Flying = true
        local BG = Instance.new('BodyGyro', T)
        local BV = Instance.new('BodyVelocity', T)
        BG.P = 9e4
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        
        task.spawn(function()
            repeat wait()
                LocalPlayer.Character.Humanoid.PlatformStand = true
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = 50
                elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                    SPEED = 0
                end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * _G.FlySpeed
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                    BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * _G.FlySpeed
                else
                    BV.velocity = Vector3.new(0, 0, 0)
                end
                BG.cframe = workspace.CurrentCamera.CoordinateFrame
            until not _G.Flying
            BG:Destroy()
            BV:Destroy()
            LocalPlayer.Character.Humanoid.PlatformStand = false
        end)
    end
    
    local FlyKeyDown = UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 1
        elseif input.KeyCode == Enum.KeyCode.S then CONTROL.B = -1
        elseif input.KeyCode == Enum.KeyCode.A then CONTROL.L = -1
        elseif input.KeyCode == Enum.KeyCode.D then CONTROL.R = 1
        elseif input.KeyCode == Enum.KeyCode.Space then CONTROL.Q = 1
        elseif input.KeyCode == Enum.KeyCode.LeftShift then CONTROL.E = -1 end
    end)
    
    local FlyKeyUp = UserInputService.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.W then CONTROL.F = 0
        elseif input.KeyCode == Enum.KeyCode.S then CONTROL.B = 0
        elseif input.KeyCode == Enum.KeyCode.A then CONTROL.L = 0
        elseif input.KeyCode == Enum.KeyCode.D then CONTROL.R = 0
        elseif input.KeyCode == Enum.KeyCode.Space then CONTROL.Q = 0
        elseif input.KeyCode == Enum.KeyCode.LeftShift then CONTROL.E = 0 end
    end)
    FLY()
end

-- Tabs Setup
local MainTab = Window:CreateTab("Main Cheats", 4483362458)

MainTab:CreateToggle({
   Name = "Anti-AFK",
   CurrentValue = false,
   Callback = function(Value) _G.AntiAFK = Value end,
})

MainTab:CreateToggle({
   Name = "God Mode (Immunity)",
   CurrentValue = false,
   Callback = function(Value)
      _G.GodMode = Value
      LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, not Value)
   end,
})

MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {1, 1000},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {1, 1000},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value) LocalPlayer.Character.Humanoid.JumpPower = Value end,
})

-- Movement Tab
local MoveTab = Window:CreateTab("Movement & Fly", 4483362458)

MoveTab:CreateToggle({
   Name = "Enable Fly (IY Style)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Flying = Value
      if Value then sFLY() end
   end,
})

MoveTab:CreateSlider({
   Name = "Fly Speed",
   Range = {1, 1000},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value) _G.FlySpeed = Value end,
})

-- Auto-Farm Tab
local FarmTab = Window:CreateTab("Auto-Farm", 4483362458)

local function startFarm()
    while _G.AutoFarm do
        local char = LocalPlayer.Character
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            -- Initial Start Point
            root.CFrame = CFrame.new(-55, 45, 0)
            task.wait(0.1)
            -- Glide to Mid Point
            TweenService:Create(root, TweenInfo.new(15, Enum.EasingStyle.Linear), {CFrame = CFrame.new(-55, 45, 9475)}):Play()
            task.wait(15.1)
            -- Glide to Chest Point
            TweenService:Create(root, TweenInfo.new(5, Enum.EasingStyle.Linear), {CFrame = CFrame.new(-55, -359, 9493)}):Play()
            task.wait(5.1)
            
            task.wait(4) -- Reset Delay
            char:BreakJoints()
            
            task.wait(15) -- Updated Repeat Delay (15 Seconds)
        end
        task.wait()
    end
end

FarmTab:CreateToggle({
   Name = "Enable Auto-Farm",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarm = Value
      if Value then task.spawn(startFarm) end
   end,
})


--// Create ESP Tab
local ESPTab = Window:CreateTab("ESP", 4483362458) -- icon ID optional

-- Function to add highlight
local function addHighlight(object, fillColor)
    if object:FindFirstChild("Highlight") then return end
    local highlight = Instance.new("Highlight")
    highlight.FillColor = fillColor
    highlight.OutlineColor = Color3.new(1,1,1)
    highlight.Parent = object
end

-- Toggle for Player ESP
ESPTab:CreateToggle({
    Name = "Player ESP (Blue)",
    CurrentValue = false,
    Flag = "PlayerESP",
    Callback = function(state)
        if state then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character then
                    addHighlight(player.Character, Color3.fromRGB(0,0,255))
                end
            end
            game.Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(char)
                    addHighlight(char, Color3.fromRGB(0,0,255))
                end)
            end)
        else
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Highlight") then
                    player.Character.Highlight:Destroy()
                end
            end
        end
    end,
})

-- Toggle for Boat ESP
ESPTab:CreateToggle({
    Name = "Boat ESP (Green)",
    CurrentValue = false,
    Flag = "BoatESP",
    Callback = function(state)
        if state then
            for _, model in pairs(workspace:GetChildren()) do
                if model:IsA("Model") and model:FindFirstChild("BoatMotor") then
                    addHighlight(model, Color3.fromRGB(0,255,0))
                end
            end
            workspace.ChildAdded:Connect(function(child)
                if child:IsA("Model") and child:FindFirstChild("BoatMotor") then
                    addHighlight(child, Color3.fromRGB(0,255,0))
                end
            end)
        else
            for _, model in pairs(workspace:GetChildren()) do
                if model:IsA("Model") and model:FindFirstChild("Highlight") then
                    model.Highlight:Destroy()
                end
            end
        end
    end,
})