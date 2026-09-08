local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))()

-- KEY SYSTEM
local KeyWindow = ReGui:Window({
    Title = "UltraVioletX - Key System",
    Size = UDim2.fromOffset(350, 180),
    NoClose = true,
    NoCollapse = true,
    NoResize = true
})

local KeyInput = KeyWindow:InputText({
    Label = "Enter your key",
    Placeholder = "Paste key here...",
    Value = ""
})

KeyWindow:Label({Text = "Get key from Discord:"})
KeyWindow:Label({Text = "https://discord.gg/2PPmxCDsJW"})

KeyWindow:Button({
    Text = "Submit Key",
    Callback = function()
        if KeyInput:GetValue() == "iuj2iuhj4ujh3qj87753" then
            -- Official way: Close fully removes the window and cleans up
            KeyWindow:Close()
            task.wait(0.1)  -- Tiny frame delay to avoid any render glitch
            LoadMainMenu()
        else
            KeyInput:SetValue("")
            KeyInput:SetLabel("Wrong Key! Try again.")
            task.wait(1.5)
            KeyInput:SetLabel("Enter your key")
        end
    end
})

-- MAIN MENU (loads only after key success)
function LoadMainMenu()
    local Home = ReGui:Window({
        Title = "UltraVioletX",
        Size = UDim2.fromOffset(420, 560)
    })

    Home:Separator({Text = "Aim"})

    -- // AIMBOT + VISIBLE FOV CIRCLE (PASTE THIS WHOLE BLOCK)
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Aimbot = {
    Enabled = false,
    TeamCheck = true,
    FOV = 50
}

-- FOV Circle (shows only when aimbot is on)
local Circle = Drawing.new("Circle")
Circle.Thickness = 2
Circle.Color = Color3.fromRGB(255, 0, 255)
Circle.Filled = false
Circle.Transparency = 0.8
Circle.Radius = Aimbot.FOV
Circle.Visible = false

local function GetClosest()
    local closest = nil
    local shortest = math.huge
    local mousePos = UserInputService:GetMouseLocation()

    for _, player in Players:GetPlayers() do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            if Aimbot.TeamCheck and player.Team == LocalPlayer.Team then continue end

            local head = player.Character.Head
            local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if onScreen then
                local dist = (Vector2.new(pos.X, pos.Y) - mousePos).Magnitude
                if dist < Aimbot.FOV and dist < shortest then
                    shortest = dist
                    closest = head
                end
            end
        end
    end
    return closest
end

-- TOGGLE
Home:Radiobox({
    Label = "Aimbot",
    Value = false,
    Callback = function(self, Value)
        Aimbot.Enabled = Value
        Circle.Visible = Value  -- shows circle when aimbot is on
    end
})

-- FOV SLIDER
Home:SliderInt({
    Label = "Aimbot FOV",
    Value = 50,
    Minimum = 40,
    Maximum = 67,
    Callback = function(self, Value)
        Aimbot.FOV = Value
        Circle.Radius = Value
    end
})

-- MAIN LOOP (put once at the bottom of your script)
RunService.RenderStepped:Connect(function()
    local mousePos = UserInputService:GetMouseLocation()
    Circle.Position = mousePos
    Circle.Radius = Aimbot.FOV

    if Aimbot.Enabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = GetClosest()
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
        end
    end
end)


    -- // FPS-FIXED RAPID FIRE – WORKS ON EVERY GUN (PISTOLS/SNIPERS/ROCKETS/ALL) NO LAG
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local RapidEnabled = false
local originals = {}
local rapidTask = nil

local function ApplyRapid(enable)
    for _, v in pairs(ReplicatedStorage.Weapons:GetDescendants()) do
        if v.Name == "FireRate" or v.Name == "BFireRate" then
            if enable then
                if not originals[v] then
                    originals[v] = v.Value
                end
                -- Disable server resets
                pcall(function()
                    for _, conn in pairs(getconnections(v.Changed)) do
                        conn:Disable()
                    end
                end)
                v.Value = 0.03  -- Safe value, no crash
            else
                if originals[v] then
                    v.Value = originals[v]
                end
            end
        end
    end
end

local function SetToolRapid(tool)
    pcall(function()
        local gs = tool:WaitForChild("GunScript", 2)
        if gs then
            for _, v in pairs(gs:GetDescendants()) do
                if v.Name == "FireRate" or v.Name == "BFireRate" then
                    v.Value = 0.03
                end
            end
        end
    end)
end

-- Tool equip listeners (zero FPS impact)
local function SetupListeners()
    local function onToolAdded(tool)
        if RapidEnabled and tool:IsA("Tool") then
            task.spawn(function()
                task.wait(0.2)
                SetToolRapid(tool)
            end)
        end
    end

    -- Backpack
    LocalPlayer.Backpack.ChildAdded:Connect(onToolAdded)
    -- Character (equipped)
    if LocalPlayer.Character then
        LocalPlayer.Character.ChildAdded:Connect(onToolAdded)
    end
    LocalPlayer.CharacterAdded:Connect(function(char)
        char.ChildAdded:Connect(onToolAdded)
    end)
end
SetupListeners()  -- Run once

-- YOUR TOGGLE (replace old one)
Home:Radiobox({
    Label = "Rapid Fire",
    Value = false,
    Callback = function(self, Value)
        RapidEnabled = Value
        ApplyRapid(Value)
        
        -- FPS-friendly reapply loop (every 0.5s only if ON)
        if rapidTask then
            task.cancel(rapidTask)
            rapidTask = nil
        end
        if Value then
            rapidTask = task.spawn(function()
                while RapidEnabled do
                    ApplyRapid(true)
                    task.wait(0.5)
                end
            end)
        end
        
        print("Rapid Fire:", Value and "ON (0 FPS drop)" or "OFF")
    end
})

    Home:Separator({Text = "Player"})

    -- // ULTRA SIMPLE & WORKING ARSENAL ESP + TRACERS (DEC 2025)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ESP_ENABLED = false
local TEAM_CHECK = true
local TRACERS = false

local esp_objects = {}
local connection

local function add_player(plr)
    if plr == LocalPlayer then return end
    
    local box = Drawing.new("Square")
    box.Thickness = 2
    box.Filled = false
    box.Color = Color3.fromRGB(255,0,0)
    box.Visible = false

    local tracer = Drawing.new("Line")
    tracer.Thickness = 2
    tracer.Color = Color3.fromRGB(255,0,0)
    tracer.Visible = false

    esp_objects[plr] = {box = box, tracer = tracer}
end

local function remove_player(plr)
    if esp_objects[plr] then
        esp_objects[plr].box:Remove()
        esp_objects[plr].tracer:Remove()
        esp_objects[plr] = nil
    end
end

local function update()
    for plr, objs in pairs(esp_objects) do
        local success, err = pcall(function()
            if not plr.Character or not plr.Character:FindFirstChild("Head") or not plr.Character:FindFirstChild("HumanoidRootPart") or plr.Character:FindFirstChild("Humanoid").Health <= 0 then
                objs.box.Visible = false
                objs.tracer.Visible = false
                return
            end

            local root = plr.Character.HumanoidRootPart
            local head = plr.Character.Head

            local root_pos, on_screen = Camera:WorldToViewportPoint(root.Position)
            local head_pos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0,1,0))
            local leg_pos = Camera:WorldToViewportPoint(root.Position - Vector3.new(0,4,0))

            if not on_screen then
                objs.box.Visible = false
                objs.tracer.Visible = false
                return
            end

            local is_team = TEAM_CHECK and plr.Team == LocalPlayer.Team
            local color = is_team and Color3.fromRGB(0,255,0) or Color3.fromRGB(255,0,0)

            objs.box.Color = color
            objs.tracer.Color = color

            local height = math.abs(head_pos.Y - leg_pos.Y)
            local width = height * 0.5

            objs.box.Size = Vector2.new(width, height)
            objs.box.Position = Vector2.new(root_pos.X - width/2, head_pos.Y)
            objs.box.Visible = ESP_ENABLED

            if TRACERS then
                objs.tracer.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                objs.tracer.To = Vector2.new(root_pos.X, leg_pos.Y)
                objs.tracer.Visible = true
            else
                objs.tracer.Visible = false
            end
        end)

        if not success then
            remove_player(plr)
        end
    end
end

-- Clean start
for _, plr in pairs(Players:GetPlayers()) do
    add_player(plr)
end

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Wait()
    add_player(plr)
end)

Players.PlayerRemoving:Connect(remove_player)

-- UI Toggles
Home:Radiobox({
    Label = "ESP",
    Value = false,
    Callback = function(self, val)
        ESP_ENABLED = val
        if val and not connection then
            connection = RunService.RenderStepped:Connect(update)
        elseif not val and connection then
            connection:Disconnect()
            connection = nil
            for _, objs in pairs(esp_objects) do
                objs.box.Visible = false
                objs.tracer.Visible = false
            end
        end
    end
})

Home:Radiobox({
    Label = "Team Check",
    Value = true,
    Callback = function(self, val)
        TEAM_CHECK = val
    end
})

Home:Radiobox({
    Label = "Tracers",
    Value = false,
    Callback = function(self, val)
        TRACERS = val
    end
})

print("ACTUALLY WORKING Arsenal ESP Loaded ❤️")

    --// Arsenal Flight (Working Dec 2025 - All Executors)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

local LocalPlayer = Players.LocalPlayer

local FlightEnabled = false
local Speed = 75
local BodyPos, BodyGyro
local UpdateConnection
local CharAddedConnection

--// Start Flight
local function StartFlight()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    local Humanoid = Character:FindFirstChild("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not Humanoid or not RootPart then return end
    
    Humanoid.PlatformStand = true
    
    BodyPos = Instance.new("BodyPosition")
    BodyPos.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    BodyPos.P = 16000
    BodyPos.D = 1000
    BodyPos.Parent = RootPart
    
    BodyGyro = Instance.new("BodyGyro")
    BodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    BodyGyro.P = 5000
    BodyGyro.Parent = RootPart
end

--// Stop Flight
local function StopFlight()
    if BodyPos then
        BodyPos:Destroy()
        BodyPos = nil
    end
    if BodyGyro then
        BodyGyro:Destroy()
        BodyGyro = nil
    end
    
    local Character = LocalPlayer.Character
    if Character and Character:FindFirstChild("Humanoid") then
        Character.Humanoid.PlatformStand = false
    end
end

--// Update Flight
local function UpdateFlight()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") or not BodyPos or not BodyGyro then
        return
    end
    
    local RootPart = Character.HumanoidRootPart
    local MoveVector = Vector3.new()
    
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        MoveVector = MoveVector + Camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        MoveVector = MoveVector - Camera.CFrame.LookVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        MoveVector = MoveVector - Camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        MoveVector = MoveVector + Camera.CFrame.RightVector
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        MoveVector = MoveVector + Vector3.new(0, 1, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        MoveVector = MoveVector - Vector3.new(0, 1, 0)
    end
    
    if MoveVector.Magnitude > 0 then
        MoveVector = MoveVector.Unit * Speed
    end
    
    BodyPos.Position = RootPart.Position + MoveVector
    BodyGyro.CFrame = Camera.CFrame
end

--// Toggle Function
local function ToggleFlight(Value)
    FlightEnabled = Value
    
    if Value then
        -- Connect CharacterAdded
        CharAddedConnection = LocalPlayer.CharacterAdded:Connect(function(Character)
            Character:WaitForChild("Humanoid")
            Character:WaitForChild("HumanoidRootPart")
            StartFlight()
        end)
        
        -- Start on current character
        if LocalPlayer.Character then
            StartFlight()
        end
        
        -- Start update loop
        UpdateConnection = RunService.Heartbeat:Connect(UpdateFlight)
    else
        StopFlight()
        
        -- Disconnect connections
        if UpdateConnection then
            UpdateConnection:Disconnect()
            UpdateConnection = nil
        end
        if CharAddedConnection then
            CharAddedConnection:Disconnect()
            CharAddedConnection = nil
        end
    end
end

--// UI Toggle
Home:Radiobox({
    Label = "Flight",
    Value = false,
    Callback = function(self, Value)
        ToggleFlight(Value)
        print("Flight:", Value and "ON" or "OFF")
    end
})

print("Arsenal Flight Loaded! (WASD + Space/Shift - Works Perfectly)")

    --// Arsenal No Clip (Working Dec 2025 - All Executors)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local NoClipEnabled = false
local NoClipConnection = nil

--// NoClip Loop (Sets ALL parts CanCollide = false)
local function NoClipLoop()
    local Character = LocalPlayer.Character
    if Character then
        for _, Part in pairs(Character:GetDescendants()) do
            if Part:IsA("BasePart") then
                Part.CanCollide = false
            end
        end
    end
end

--// Toggle Function
local function ToggleNoClip(Value)
    NoClipEnabled = Value
    
    if Value then
        -- Start continuous loop (handles respawns automatically)
        NoClipConnection = RunService.Stepped:Connect(NoClipLoop)
    else
        -- Stop loop
        if NoClipConnection then
            NoClipConnection:Disconnect()
            NoClipConnection = nil
        end
        -- Restore collisions (for current character)
        local Character = LocalPlayer.Character
        if Character then
            for _, Part in pairs(Character:GetDescendants()) do
                if Part:IsA("BasePart") then
                    Part.CanCollide = true
                end
            end
        end
    end
end

--// UI Toggle
Home:Radiobox({
    Label = "No Clip",
    Value = false,
    Callback = function(self, Value)
        ToggleNoClip(Value)
        print("No Clip:", Value and "ON" or "OFF")
    end
})

print("Arsenal No Clip Loaded! (Clip through EVERYTHING)")

    --// Arsenal Speed (ASSEMBLY VELOCITY BYPASS - 100% WORKING Dec 2025)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local CurrentSpeed = 16
local SpeedConnection = nil
local CharacterAddedConnection

--// Velocity Speed Loop (ULTIMATE BYPASS)
local function SpeedLoop()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    local Humanoid = Character:FindFirstChild("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    if not Humanoid or not RootPart then return end
    
    Humanoid.WalkSpeed = 16  -- Anti-reset
    
    local MoveDirection = Humanoid.MoveDirection
    if MoveDirection.Magnitude > 0 then
        local MoveVelocity = MoveDirection * CurrentSpeed
        RootPart.AssemblyLinearVelocity = Vector3.new(
            MoveVelocity.X, 
            RootPart.AssemblyLinearVelocity.Y,  -- Preserve vertical (jump/fall)
            MoveVelocity.Z
        )
    end
end

--// Start Loop
local function StartSpeedLoop()
    if SpeedConnection then return end
    SpeedConnection = RunService.Heartbeat:Connect(SpeedLoop)
end

--// Stop Loop
local function StopSpeedLoop()
    if SpeedConnection then
        SpeedConnection:Disconnect()
        SpeedConnection = nil
    end
end

--// Respawn Handler
local function OnCharacterAdded(Character)
    Character:WaitForChild("Humanoid", 5)
    Character:WaitForChild("HumanoidRootPart", 5)
    task.wait(0.1)
    
    local Humanoid = Character.Humanoid
    Humanoid.WalkSpeed = 16
    
    -- Restart loop if active
    if CurrentSpeed > 16 and not SpeedConnection then
        StartSpeedLoop()
    end
end

--// Connect Events
CharacterAddedConnection = LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)

--// Initial Apply
task.spawn(function()
    task.wait(1)
    if LocalPlayer.Character then
        OnCharacterAdded(LocalPlayer.Character)
    end
end)

--// UI Slider
Home:SliderInt({
    Label = "Speed",
    Value = 16,
    Minimum = 16,
    Maximum = 400,
    Callback = function(self, Value)
        CurrentSpeed = Value
        
        if Value > 16 then
            StartSpeedLoop()
        else
            StopSpeedLoop()
            -- Restore normal
            local Character = LocalPlayer.Character
            if Character and Character:FindFirstChild("Humanoid") then
                Character.Humanoid.WalkSpeed = 16
            end
        end
        
        print("Speed:", Value)
    end
})

print("Arsenal SPEED FIXED! (AssemblyLinearVelocity Bypass - SMOOTH & UNDETECTABLE)")

    --// Arsenal Jump Power (RESET FIXED - Dec 2025, All Executors)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local CurrentJumpPower = 50
local JumpConnection = nil
local CharacterAddedConnection

--// Force Jump Loop (Handles High + PERFECT RESET)
local function JumpLoop()
    local Character = LocalPlayer.Character
    if not Character then return end
    
    local Humanoid = Character:FindFirstChild("Humanoid")
    if not Humanoid then return end
    
    if CurrentJumpPower > 50 then
        -- High Jump Mode
        Humanoid.UseJumpPower = true
        Humanoid.JumpPower = CurrentJumpPower
    else
        -- PERFECT RESET (Arsenal Default)
        Humanoid.UseJumpPower = false
        Humanoid.JumpHeight = 7.2
    end
end

--// Start Loop (Always On - Handles Everything)
local function StartJumpLoop()
    if JumpConnection then return end
    JumpConnection = RunService.Stepped:Connect(JumpLoop)
end

--// Respawn Handler
local function OnCharacterAdded(Character)
    Character:WaitForChild("Humanoid", 5)
    Character:WaitForChild("HumanoidRootPart", 5)
    task.wait(0.1)
    
    JumpLoop()  -- Instant apply
end

--// Connect Events
CharacterAddedConnection = LocalPlayer.CharacterAdded:Connect(OnCharacterAdded)

--// Start Loop Immediately
StartJumpLoop()

--// Initial Apply
task.spawn(function()
    task.wait(1)
    if LocalPlayer.Character then
        OnCharacterAdded(LocalPlayer.Character)
    end
end)

--// UI Slider
Home:SliderInt({
    Label = "Jump Power",
    Value = 50,
    Minimum = 50,
    Maximum = 300,
    Callback = function(self, Value)
        CurrentJumpPower = Value
        print("Jump:", Value)
    end
})

print("Arsenal Jump Power FIXED! (50=Normal Reset, >50=Super High - Always Stays)")

    Home:Separator({Text = "Info"})

    Home:Label({Text = "UltraVioletX - By Waffley"})
    Home:Label({Text = "Version: 1.0.0"})
end
