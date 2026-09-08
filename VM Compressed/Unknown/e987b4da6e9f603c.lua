local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/noowtf31-ui/Arcylic/refs/heads/main/src.lua.txt"))()

-- Services
local uis = game:GetService("UserInputService")
local runser = game:GetService("RunService")
local plr = game.Players.LocalPlayer
local repl = game:GetService("ReplicatedStorage")

-- Fly Variables
local fly = false
local v = 75 

-- Noclip Variables
local NoclipConn = nil

-- Fly Functions
local function startFly()
    local char = plr.Character
    local humroot = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not humroot or not hum then return end

    hum.PlatformStand = true

    local alignori = Instance.new("AlignOrientation", humroot)
    alignori.Name = "FlyOri"
    alignori.Mode = Enum.OrientationAlignmentMode.OneAttachment
    alignori.Attachment0 = humroot:FindFirstChild("RootAttachment")
    alignori.Responsiveness = 50
    alignori.MaxTorque = 100000

    local alignpos = Instance.new("AlignPosition", humroot)
    alignpos.Name = "FlyPos"
    alignpos.Mode = Enum.PositionAlignmentMode.OneAttachment
    alignpos.Attachment0 = humroot:FindFirstChild("RootAttachment")
    alignpos.MaxForce = 100000

    fly = true
    task.spawn(function()
        local CurCam = workspace.CurrentCamera
        while fly and char and char.Parent do
            runser.RenderStepped:Wait()
            
            local direction = Vector3.new(0,0,0)
            
            if uis:IsKeyDown(Enum.KeyCode.W) then direction = direction + CurCam.CFrame.LookVector end
            if uis:IsKeyDown(Enum.KeyCode.S) then direction = direction - CurCam.CFrame.LookVector end
            if uis:IsKeyDown(Enum.KeyCode.A) then direction = direction - CurCam.CFrame.RightVector end
            if uis:IsKeyDown(Enum.KeyCode.D) then direction = direction + CurCam.CFrame.RightVector end
            
            alignori.CFrame = CurCam.CFrame
            
            if direction.Magnitude > 0 then
                alignpos.Position = humroot.Position + (direction.Unit * (v / 10))
            else
                alignpos.Position = humroot.Position
            end
        end
    end)
end

local function endFly()
    fly = false
    local char = plr.Character
    local humroot = char and char:FindFirstChild("HumanoidRootPart")
    
    if humroot then
        if humroot:FindFirstChild("FlyOri") then humroot.FlyOri:Destroy() end
        if humroot:FindFirstChild("FlyPos") then humroot.FlyPos:Destroy() end
    end
    
    if char and char:FindFirstChildOfClass("Humanoid") then
        char.Humanoid.PlatformStand = false
    end
end

-- Noclip Function
local function toggleNoclip(state)
    if state then
        NoclipConn = runser.Stepped:Connect(function()
            if plr.Character then
                for _, v in pairs(plr.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        v.CanCollide = false
                    end
                end
            end
        end)
    else
        if NoclipConn then
            NoclipConn:Disconnect()
            NoclipConn = nil
        end
    end
end

-- UI Setup
local window = Library.new("❓ LUCKY BLOCKS Battlegrounds GUI", "LBBG_Configs")
window:SetToggleKey(Enum.KeyCode.RightControl)

-- Sections
local PlayerSection = window:CreateSection("Player")
local LuckyBlockSection = window:CreateSection("Lucky Blocks")
local SettingsSection = window:CreateSection("Settings")

-- Tabs (Updated Icons)
local MovementTab = PlayerSection:CreateTab("Movement", "rbxassetid://10709775704")
local TrollingTab = PlayerSection:CreateTab("Trolling", "rbxassetid://10723407389")
local SpawnerTab = LuckyBlockSection:CreateTab("Spawner", "rbxassetid://10734898355")
local CreditsTab = SettingsSection:CreateTab("Credits", "rbxassetid://112235310154264")

-- Movement Tab Components
MovementTab:CreateToggle({
    Name = "Enable Fly",
    Default = false,
    Flag = "FlyEnabled",
    Callback = function(state)
        if state then startFly() else endFly() end
    end
})

MovementTab:CreateToggle({
    Name = "Enable Noclip",
    Default = false,
    Flag = "NoclipEnabled",
    Callback = function(state)
        toggleNoclip(state)
    end
})

MovementTab:CreateSlider({
    Name = "Fly Speed",
    Min = 10,
    Max = 500,
    Default = 75,
    Flag = "FlySpeed",
    Callback = function(value) v = value end
})

MovementTab:CreateSlider({
    Name = "Movement Speed",
    Min = 16,
    Max = 300,
    Default = 16,
    Flag = "WalkSpeed",
    Callback = function(value)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.WalkSpeed = value
        end
    end
})

MovementTab:CreateSlider({
    Name = "Jump Power",
    Min = 50,
    Max = 500,
    Default = 50,
    Flag = "JumpPower",
    Callback = function(value)
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.UseJumpPower = true
            plr.Character.Humanoid.JumpPower = value
        end
    end
})

-- Trolling Tab Components
TrollingTab:CreateSection("Trolling Utilities")

TrollingTab:CreateButton({
    Name = "Kawaii Fling",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/KAWAII-FREAKY-FLING/main/kawaii_freaky_fling.lua",true))()
        end)
        window:Notify({ Title = "Executed", Description = "Kawaii Fling loaded", Duration = 2 })
    end
})

TrollingTab:CreateButton({
    Name = "Infinity Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        window:Notify({ Title = "Executed", Description = "Infinite Yield loaded", Duration = 2 })
    end
})

-- Spawner Tab Components
SpawnerTab:CreateSection("Block Spawning")

SpawnerTab:CreateButton({
    Name = "Lucky Block",
    Callback = function()
        repl:WaitForChild("SpawnLuckyBlock"):FireServer()
        window:Notify({ Title = "Spawned", Description = "spawned a normal lucky block", Duration = 2 })
    end
})

SpawnerTab:CreateButton({
    Name = "Super Lucky Block",
    Callback = function()
        repl:WaitForChild("SpawnSuperBlock"):FireServer()
        window:Notify({ Title = "Spawned", Description = "spawned a super lucky block", Duration = 2 })
    end
})

SpawnerTab:CreateButton({
    Name = "Diamond Block",
    Callback = function()
        repl:WaitForChild("SpawnDiamondBlock"):FireServer()
        window:Notify({ Title = "Spawned", Description = "spawned a diamond lucky block", Duration = 2 })
    end
})

SpawnerTab:CreateButton({
    Name = "Rainbow Block",
    Callback = function()
        repl:WaitForChild("SpawnRainbowBlock"):FireServer()
        window:Notify({ Title = "Spawned", Description = "spawned a rainbow lucky block", Duration = 2 })
    end
})

SpawnerTab:CreateButton({
    Name = "Void Block",
    Callback = function()
        repl:WaitForChild("SpawnRainbowBlock"):FireServer()
        repl:WaitForChild("SpawnRainbowBlock"):FireServer()
        repl:WaitForChild("SpawnGalaxyBlock"):FireServer()
        repl:WaitForChild("SpawnRainbowBlock"):FireServer()
        repl:WaitForChild("SpawnGalaxyBlock"):FireServer()
        window:Notify({ Title = "Spawned", Description = "spawned a void lucky block", Duration = 2 })
    end
})

-- Credits Tab Components
CreditsTab:CreateSection("Made by D3IVI5")
