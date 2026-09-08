local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Mental Hub",
   LoadingTitle = "Dont Get Crushed By 67",
   LoadingSubtitle = "by Mental Hub",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MentalHub_DGC67",
      FileName = "MentalHubConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", 
      RememberJoins = true 
   },
   KeySystem = false, 
})

-- [ SERVICES ]
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- [ VARIABLES ]
local Flags = {
    AutoFarmSelected = false,
    SelectedWorld = nil,
    FarmDelay = 10, -- Set to 10s to be safe against 20s cooldown
    AutoRebirth = false,
    AutoWalkSpeed = false,
    AutoCash = false,
    AutoHealth = false,
    -- Player Settings
    FlyEnabled = false,
    FlySpeed = 50,
    WalkSpeedToggle = false,
    WalkSpeedValue = 16,
    Noclip = false,
    InfJump = false
}

-- [ DYNAMIC SCANNER ]
-- Scans for worlds and returns a list of names for the UI and a table for logic
local function ScanWorlds()
    local worldData = {}
    local worldNames = {}
    local worldsFolder = Workspace:FindFirstChild("Worlds")
    
    if worldsFolder then
        for _, worldFolder in pairs(worldsFolder:GetChildren()) do
            -- Check if structure matches: World -> Nodes -> Win
            local nodes = worldFolder:FindFirstChild("Nodes")
            if nodes then
                local winPart = nodes:FindFirstChild("Win")
                if winPart then
                    worldData[worldFolder.Name] = winPart
                    table.insert(worldNames, worldFolder.Name)
                end
            end
        end
    end
    table.sort(worldNames) -- Sort alphabetically for clean UI
    return worldNames, worldData
end

-- Initial Scan
local WorldNames, WorldMap = ScanWorlds()

-- [ FUNCTIONS ]
local function TeleportTo(cframe)
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        -- Force CFrame update
        hrp.CFrame = cframe
        
        -- Velocity reset to prevent anti-cheat fling
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
        
        -- Touch simulation (Pro Method: Move slightly up to trigger TouchInterest)
        task.wait(0.1)
        if hrp then
            hrp.CFrame = cframe * CFrame.new(0, 2, 0)
        end
    end
end

local function StartFly()
    local char = LocalPlayer.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    local human = char:FindFirstChild("Humanoid")
    if not root or not human then return end

    -- Cleanup existing
    for _, v in pairs(root:GetChildren()) do
        if v.Name == "MentalHubFly" then v:Destroy() end
    end

    local bv = Instance.new("BodyVelocity", root)
    bv.Name = "MentalHubFly"
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Velocity = Vector3.zero

    local bg = Instance.new("BodyGyro", root)
    bg.Name = "MentalHubFly"
    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.P = 9e4
    bg.CFrame = root.CFrame

    task.spawn(function()
        while Flags.FlyEnabled and char.Parent do
            human.PlatformStand = true
            
            local cam = workspace.CurrentCamera
            local moveDir = human.MoveDirection
            local speed = Flags.FlySpeed
            
            if moveDir.Magnitude > 0 then
                 local look = cam.CFrame.LookVector
                 local right = cam.CFrame.RightVector
                 local newVel = (moveDir.X * right + moveDir.Z * look) * speed
                 newVel = newVel + Vector3.new(0, moveDir.Y * speed, 0) 
                 
                 -- Forward priority for mobile/controller
                 if moveDir.Magnitude > 0 then
                    bv.Velocity = cam.CFrame.LookVector * speed
                 end
                 bg.CFrame = cam.CFrame
            else
                 bv.Velocity = Vector3.zero
            end
            
            bg.CFrame = cam.CFrame
            RunService.RenderStepped:Wait()
        end
        
        if human then human.PlatformStand = false end
        if bv then bv:Destroy() end
        if bg then bg:Destroy() end
    end)
end

-- [ UI CONSTRUCTION ]
local MainTab = Window:CreateTab("Main", 4483362458) 
local ShopTab = Window:CreateTab("Shop", 4483362458)
local PlayerTab = Window:CreateTab("Player", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- [ MAIN TAB ]

MainTab:CreateSection("Target Farming")

local WorldDropdown = MainTab:CreateDropdown({
   Name = "Select Best World",
   Options = WorldNames,
   CurrentOption = {WorldNames[1] or "None"},
   MultipleOptions = false,
   Flag = "SelectedWorld",
   Callback = function(Option)
        -- Option returns table in Rayfield
        Flags.SelectedWorld = Option[1]
   end,
})

MainTab:CreateButton({
   Name = "Refresh World List",
   Callback = function()
        local newNames, newMap = ScanWorlds()
        WorldMap = newMap -- Update the logic map
        WorldDropdown:Refresh(newNames, true) -- Update the UI
   end,
})

MainTab:CreateToggle({
   Name = "Auto Farm Selected World",
   CurrentValue = false,
   Flag = "AutoFarmSelected",
   Callback = function(Value)
        Flags.AutoFarmSelected = Value
        if Value then
            task.spawn(function()
                while Flags.AutoFarmSelected do
                    if not Flags.SelectedWorld then
                         Rayfield:Notify({Title = "Warning", Content = "Select a world first!", Duration = 3})
                         Flags.AutoFarmSelected = false
                         break
                    end
                    
                    local targetPart = WorldMap[Flags.SelectedWorld]
                    
                    if targetPart then
                        TeleportTo(targetPart.CFrame)
                        -- Wait for the win cooldown
                        task.wait(Flags.FarmDelay)
                    else
                         Rayfield:Notify({Title = "Error", Content = "Selected world not found (try Refresh)", Duration = 3})
                         Flags.AutoFarmSelected = false
                         break
                    end
                end
            end)
        end
   end,
})

MainTab:CreateSlider({
    Name = "Farm Loop Delay (Seconds)",
    Range = {1, 60},
    Increment = 1,
    Suffix = "s",
    CurrentValue = 21,
    Flag = "FarmDelay",
    Callback = function(Value)
        Flags.FarmDelay = Value
    end,
})

MainTab:CreateSection("Rebirth")

MainTab:CreateToggle({
   Name = "Auto Rebirth",
   CurrentValue = false,
   Flag = "AutoRebirth",
   Callback = function(Value)
        Flags.AutoRebirth = Value
        if Value then
            task.spawn(function()
                while Flags.AutoRebirth do
                    pcall(function()
                        -- Ensure remote exists before firing to prevent errors
                        local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                        if remotes and remotes:FindFirstChild("rebirthReq") then
                            remotes.rebirthReq:FireServer()
                        end
                    end)
                    task.wait(5)
                end
            end)
        end
   end,
})

-- [ PLAYER TAB ]

PlayerTab:CreateSection("Movement")

PlayerTab:CreateToggle({
    Name = "Universal Fly",
    CurrentValue = false,
    Flag = "FlyEnabled",
    Callback = function(Value)
        Flags.FlyEnabled = Value
        if Value then
            StartFly()
        end
    end,
})

PlayerTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 300},
    Increment = 10,
    Suffix = "Studs",
    CurrentValue = 50,
    Flag = "FlySpeed",
    Callback = function(Value)
        Flags.FlySpeed = Value
    end,
})

PlayerTab:CreateToggle({
    Name = "Set WalkSpeed (Loop)",
    CurrentValue = false,
    Flag = "WalkSpeedToggle",
    Callback = function(Value)
        Flags.WalkSpeedToggle = Value
    end,
})

PlayerTab:CreateSlider({
    Name = "WalkSpeed Value",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 16,
    Flag = "WalkSpeedValue",
    Callback = function(Value)
        Flags.WalkSpeedValue = Value
    end,
})

PlayerTab:CreateSection("Physics")

PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Noclip",
    Callback = function(Value)
        Flags.Noclip = Value
    end,
})

PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfJump",
    Callback = function(Value)
        Flags.InfJump = Value
    end,
})

-- [ SHOP TAB ]

ShopTab:CreateSection("Upgrades")

local function AutoBuy(upgradeName)
    task.spawn(function()
        while Flags["Auto"..upgradeName] do
            pcall(function()
                local remotes = ReplicatedStorage:FindFirstChild("Remotes")
                if remotes and remotes:FindFirstChild("CashShop") then
                     remotes.CashShop:InvokeServer("Upgrade", upgradeName)
                end
            end)
            task.wait(0.5)
        end
    end)
end

ShopTab:CreateToggle({
   Name = "Auto Buy WalkSpeed",
   CurrentValue = false,
   Flag = "AutoWalkSpeed",
   Callback = function(Value)
        Flags.AutoWalkSpeed = Value
        if Value then AutoBuy("WalkSpeed") end
   end,
})

ShopTab:CreateToggle({
   Name = "Auto Buy Cash Multiplier",
   CurrentValue = false,
   Flag = "AutoCash",
   Callback = function(Value)
        Flags.AutoCash = Value
        if Value then AutoBuy("Cash") end
   end,
})

ShopTab:CreateToggle({
   Name = "Auto Buy Health",
   CurrentValue = false,
   Flag = "AutoHealth",
   Callback = function(Value)
        Flags.AutoHealth = Value
        if Value then AutoBuy("Health") end
   end,
})

-- [ MISC TAB ]

MiscTab:CreateSection("Info")

MiscTab:CreateButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/QA2yHSuTjw")
        Rayfield:Notify({
            Title = "Success",
            Content = "Discord Link Copied to Clipboard",
            Duration = 3,
            Image = 4483362458
        })
    end,
})

MiscTab:CreateButton({
    Name = "Unload Script",
    Callback = function()
        Rayfield:Destroy()
    end,
})

-- [ LOGIC HANDLERS ]

RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    if char then
        if Flags.WalkSpeedToggle then
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum.WalkSpeed = Flags.WalkSpeedValue
            end
        end
        
        if Flags.Noclip then
            for _, part in pairs(char:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if Flags.InfJump then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

Rayfield:Notify({
   Title = "Mental Hub Loaded",
   Content = "Select a World to Farm",
   Duration = 5,
   Image = 4483362458,
})
