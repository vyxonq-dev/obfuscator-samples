--Universal Script Reworked
--Made by: RobloxPlayer31is

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Universal Hub", "Ocean")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

local NoRagdoll = false
local connection
local SpeedValue = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local JumpValue = 50
local InfiniteJumpEnabled = false
local flying = false
local flySpeed = 50
local mover, att, heartbeatConnection
local espEnabled = false


local originalSettings = {
    Brightness = Lighting.Brightness,
    ClockTime = Lighting.ClockTime,
    FogEnd = Lighting.FogEnd,
    GlobalShadows = Lighting.GlobalShadows,
    Ambient = Lighting.Ambient,
    OutdoorAmbient = Lighting.OutdoorAmbient
}

local Tab = Window:NewTab("Local Player")
local Section = Tab:NewSection("Player")
local Tab2 = Window:NewTab("Main")
local Section2 = Tab2:NewSection("Main")
local ESPSection = Tab2:NewSection("Visuals")


task.spawn(function()
    while task.wait() do
        pcall(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = SpeedValue
                LocalPlayer.Character.Humanoid.JumpPower = JumpValue
            end
        end)
    end
end)


Section:NewSlider("Speed changer", "Changes your speed", 500, 16, function(s)
    SpeedValue = s
end)

Section:NewSlider("Jump power", "Changes your jump power", 300, 50, function(j)
    JumpValue = j
end)

Section:NewButton("Reset walkspeed and jump power", "Resets to default", function()
    SpeedValue = 16
    JumpValue = 50
end)

Section:NewToggle("Infinite Jump", "Jump as many times as you want", function(state)
    InfiniteJumpEnabled = state
end)

UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local character = LocalPlayer.Character
        local hum = character and character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local SitConnection = false
local AntiSitConnection = false

Section:NewToggle("Sit", "Makes your character sit", function(state)
    SitConnection = state
    if state then
        task.spawn(function()
            while SitConnection do
                local character = LocalPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if humanoid and not humanoid.Sit then
                    humanoid.Sit = true
                end
                task.wait(0.2)
            end
        end)
    else
        local character = LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Sit = false
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 2
            humanoid.Jump = true 
        end
    end
end)

Section:NewToggle("Anti sit", "Prevents your character from sitting", function(state)
    AntiSitConnection = state
    if state then
        SitConnection = false 
        
        task.spawn(function()
            while AntiSitConnection do
                local character = LocalPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                
                if humanoid and humanoid.Sit then
                    humanoid.Sit = false
                end
                task.wait()
            end
        end)
    end
end)


Section2:NewButton("Toggle Fly", "Enables/Disables flight", function()
    local camera = workspace.CurrentCamera
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local root = char.HumanoidRootPart
    local hum = char:FindFirstChild("Humanoid")
    
    flying = not flying
    
    if flying then
        hum:ChangeState(Enum.HumanoidStateType.Physics)
        att = Instance.new("Attachment", root)
        mover = Instance.new("LinearVelocity", root)
        mover.Attachment0 = att
        mover.MaxForce = math.huge
        mover.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
        
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            local dir = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= camera.CFrame.RightVector end
            
            if mover and mover.Parent then
                mover.VectorVelocity = (dir.Magnitude > 0) and (dir.Unit * flySpeed) or Vector3.zero
            end
            local camLook = camera.CFrame.LookVector
            root.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(camLook.X, 0, camLook.Z))
        end)
    else
        if heartbeatConnection then heartbeatConnection:Disconnect() end
        if mover then mover:Destroy() end
        if att then att:Destroy() end
        hum:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end)

Section2:NewTextBox("Fly Speed", "Set speed (Default 50)", function(txt)
    flySpeed = tonumber(txt) or 50
end)

Section2:NewToggle("Noclip", "Makes your character Noclip", function(state)
    _G.noclip = state
    
    task.spawn(function()
        while _G.noclip do
            local char = LocalPlayer.Character
            if char then
                for _, v in pairs(char:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
            task.wait()
        end
        
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = true
                    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 1
                    game.Players.LocalPlayer.Character.Humanoid.Jump = true
                end
            end
        end
    end)
end)

Section2:NewButton("Reset your character", "Resets your character", function()
    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Health = 0
        else
            character:BreakJoints()
        end
    end
end)

Section2:NewToggle("Anti ragdoll", "prevents you from being ragdolled", function(state)
    NoRagdoll = state
    local function disableRagdoll(character)
        local humanoid = character:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, not NoRagdoll)
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not NoRagdoll)
        end
    end

    if NoRagdoll then
        if LocalPlayer.Character then disableRagdoll(LocalPlayer.Character) end
        connection = LocalPlayer.CharacterAdded:Connect(disableRagdoll)
    else
        if connection then connection:Disconnect() connection = nil end
        if LocalPlayer.Character then disableRagdoll(LocalPlayer.Character) end
    end
end)

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local walkInAirConnection = nil

Section2:NewToggle("Walk in air", "Lets your character walk in the air", function(state)
    if state then
        walkInAirConnection = RunService.Heartbeat:Connect(function()
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
                character.Humanoid.HipHeight = 20
            end
        end)
    else
        if walkInAirConnection then
            walkInAirConnection:Disconnect()
            walkInAirConnection = nil
        end
        
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.HipHeight = 0
        end
    end
end)


local function ApplyESP(plr)
    local function createHighlight(char)
        if not char:FindFirstChild("ESP_Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Name = "ESP_Highlight"
            highlight.Adornee = char
            highlight.FillTransparency = 0.5
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.Parent = char
        end
    end

    plr.CharacterAdded:Connect(function(char)
        if espEnabled then task.wait(0.5) createHighlight(char) end
    end)
    
    if plr.Character and espEnabled then createHighlight(plr.Character) end
end

ESPSection:NewToggle("Player ESP", "Highlights all players", function(state)
    espEnabled = state
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            if espEnabled then
                ApplyESP(plr)
            else
                local h = plr.Character:FindFirstChild("ESP_Highlight")
                if h then h:Destroy() end
            end
        end
    end
end)

Players.PlayerAdded:Connect(ApplyESP)

ESPSection:NewToggle("Full Bright", "Makes game bright and removes shadows", function(state)
    if state then
        originalSettings.Brightness = Lighting.Brightness
        originalSettings.ClockTime = Lighting.ClockTime
        originalSettings.FogEnd = Lighting.FogEnd
        originalSettings.GlobalShadows = Lighting.GlobalShadows
        originalSettings.Ambient = Lighting.Ambient
        originalSettings.OutdoorAmbient = Lighting.OutdoorAmbient

        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
        Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
    else
        Lighting.Brightness = originalSettings.Brightness
        Lighting.ClockTime = originalSettings.ClockTime
        Lighting.FogEnd = originalSettings.FogEnd
        Lighting.GlobalShadows = originalSettings.GlobalShadows
        Lighting.Ambient = originalSettings.Ambient
        Lighting.OutdoorAmbient = originalSettings.OutdoorAmbient
    end
end)


local Tab3 = Window:NewTab("Tools/Client-side control")
local Section3 = Tab3:NewSection("Tools/Client-side control")

Section3:NewButton("Spawn Brick", "Client Sided", function()
    local Part = Instance.new("Part", workspace)
    Part.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
end)

Section3:NewButton("Click teleport tool", "Gives you the click teleport tool", function()
    local player = game:GetService("Players").LocalPlayer
    local tpTool = Instance.new("Tool")
    tpTool.Name = "Click TP"
    tpTool.RequiresHandle = false
    tpTool.Parent = player.Backpack
    
    tpTool.Activated:Connect(function()
        local mouse = player:GetMouse()
        local pos = mouse.Hit.Position
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, 3, 0))
        end
    end)
end)

Section3:NewButton("Explode yourself", "Explodes your character (Client only)", function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local explosion = Instance.new("Explosion")
        explosion.BlastRadius = 100
        explosion.BlastPressure = 9999999
        explosion.Position = player.Character.HumanoidRootPart.Position
        explosion.Parent = player.Character.HumanoidRootPart
    end
end)

Section3:NewButton("Bypass first person view", "Lets you use third person view", function()
    game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic
    print("Bypassed!")
end)

Section3:NewButton("Speed tool", "Become Usain Bolt!", function()
    local player = game.Players.LocalPlayer
    local tool = Instance.new("Tool")
    tool.Name = "Speed Coil"
    tool.RequiresHandle = true
    tool.CanBeDropped = false
    tool.ToolTip = "Makes you super fast!"
    
    local Handle = Instance.new("Part")
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(1, 1, 1)
    Handle.BrickColor = BrickColor.new("Bright blue")
    Handle.Material = Enum.Material.Neon
    Handle.Parent = tool

    local Sound = Instance.new("Sound")
    Sound.Name = "EquipSound"
    Sound.SoundId = "rbxassetid://99173388"
    Sound.Volume = 0.5
    Sound.Parent = Handle

    tool.Parent = player.Backpack

    tool.Equipped:Connect(function()
        Sound:Play()
        SpeedValue = 60
    end)

    tool.Unequipped:Connect(function()
        SpeedValue = 16
    end)
end)

Section3:NewButton("Jump tool", "Jump like a bunny!", function()
    local player = game.Players.LocalPlayer
    local tool = Instance.new("Tool")
    tool.Name = "Jump Coil"
    tool.RequiresHandle = true
    tool.CanBeDropped = false
    tool.ToolTip = "Makes you jump high!"
    
    local Handle1 = Instance.new("Part")
    Handle1.Name = "Handle"
    Handle1.Size = Vector3.new(1, 1, 1)
    Handle1.BrickColor = BrickColor.new("Bright red")
    Handle1.Material = Enum.Material.Neon
    Handle1.Parent = tool

    local Sound = Instance.new("Sound")
    Sound.Name = "EquipSound"
    Sound.SoundId = "rbxassetid://16619553"
    Sound.Volume = 0.5
    Sound.Parent = Handle1

    tool.Parent = player.Backpack

    tool.Equipped:Connect(function()
        Sound:Play()
        JumpValue = 130
    end)

    tool.Unequipped:Connect(function()
        JumpValue = 50
    end)
end)

local Tacos

local SectionMusic = Tab3:NewSection("Music")

SectionMusic:NewToggle("Play its Raining Tacos", "Plays music", function(state)
    if state then
        Tacos = Instance.new("Sound")
        Tacos.Parent = game:GetService("SoundService")
        Tacos.SoundId = "rbxassetid://142376088"
        Tacos.Looped = true
        Tacos:Play()
    else
        if Tacos then
            Tacos:Stop()
            Tacos:Destroy()
            Tacos = nil
        end
    end
end)

local Section4 = Tab2:NewSection("Remote Exploitation")

local targetName = ""
local foundRemote = nil

Section4:NewTextBox("Target Player", "Username", function(txt)
    targetName = txt
end)

Section4:NewButton("Scan for kill Remotes", "Scans ReplicatedStorage for events", function()
    local keywords = {"Damage", "Kill", "Health", "Hit", "Life", "Death", "Die", "KillAll", "kill", "Admin"}
    local storage = game:GetService("ReplicatedStorage")
    
    for _, v in pairs(storage:GetDescendants()) do
        if v:IsA("RemoteEvent") then
            for _, keyword in pairs(keywords) do
                if string.find(v.Name:lower(), keyword:lower()) then
                    foundRemote = v
                    print("Potential Remote Found: " .. v.Name)
                    break
                end
            end
        end
    end
    
    if foundRemote then
        print("Scan Complete", "Found potential remote: " .. foundRemote.Name, 5)
    else
        print("Scan Failed", "No obvious kill remotes found.", 5)
    end
end)

Section4:NewButton("Execute Kill", "Fires the detected remote", function()
    local targetPlr = game.Players:FindFirstChild(targetName)
    
    if not targetPlr then
        print("Error", "Player not found", 3)
        return
    end

    if foundRemote then
        foundRemote:FireServer(targetPlr, math.huge)
        foundRemote:FireServer(targetPlr.Character, math.huge)
        print("Fired", "Sent signal to " .. foundRemote.Name, "NOTE: IT WORKS BY SCANNING THE NAME OF THE REMOTE SO EVEN IF FOUND IT MIGHT NOT WORK!")
    else
        print("Error", "No remote selected/found. Run Scan first.", 3)
    end
end)

local Tab4 = Window:NewTab("Credits")
local CreditsSection = Tab4:NewSection("Credits Info")
CreditsSection:NewLabel("Script made by RobloxPlayer31is")
CreditsSection:NewLabel("Kavo UI made by xHeptc")

local Tab5 = Window:NewTab("Game")
local GameSection = Tab5:NewSection("Game info")
GameSection:NewLabel("Current place ID: " .. game.PlaceId)
GameSection:NewLabel("Current game ID: " .. game.GameId)
GameSection:NewLabel("Creator ID: " .. game.CreatorId)
