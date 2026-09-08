-- LIBRARIES
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- SERVICES
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- FUNCTIONS
local function GetPlayerNames()
    local names = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(names, player.Name)
    end
    return names
end

local function findBase(name)
    local bases = workspace.Map.Bases:GetChildren()

    for _, _base in bases do
        local sign = _base.Important.Sign.SignPart.SurfaceGui.TextLabel

        if string.gsub(sign.Text, "'s Slot", "") == name then
            return _base
        end
    end
end

local function findPrompt(identifier)
    -- Check if the identifier is already a ProximityPrompt instance
    if typeof(identifier) == "Instance" and identifier:IsA("ProximityPrompt") then
        return identifier
    end
    
    -- Check if the identifier is a direct path
    local prompt = game:GetService("Workspace"):FindFirstChild(identifier)
    if prompt and prompt:IsA("ProximityPrompt") then
        return prompt
    end
    
    -- If not a direct path, search for the prompt by name
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") then
            if descendant.Name == identifier then
                return descendant
            end
        end
    end
    
    return nil
end

local function activatePrompt(identifier)
    local prompt = findPrompt(identifier)
    
    if prompt then
        -- Check if the prompt is enabled and actionable
        if prompt.Enabled and prompt.ActionText ~= "" then
            -- Simulate the input to activate the prompt
            fireproximityprompt(prompt)
            print("[ActivatePrompt] Activated proximity prompt:", prompt.ActionText)
            return true
        else
            print("[ActivatePrompt] Prompt is not enabled or has no action text.")
            return false
        end
    else
        print("[ActivatePrompt] Prompt not found:", identifier)
        return false
    end
end

-- WINDOW
local Window = Rayfield:CreateWindow({
   Name = "Steal a Sprunki",
   ScriptID = "sid_ji0crfbdx3n3",
   Icon = 0,
   LoadingTitle = "Steal a Sprunki GUI",
   LoadingSubtitle = "by Turkey",
   ShowText = "Steal a Sprunki",
   Theme = "Default",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Steal a Sprunki GUI"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

-- TABS
local Game = Window:CreateTab("Game", 0)
local General = Window:CreateTab("General", 0)

-- VARIABLES
local player = Players.LocalPlayer
local base = findBase(player.Name)

local target = player.Name
local layer = 1

print("[AutoSteal] FOUND BASE:", base.Name)

local beam = base.Layers["1"].Beams:GetChildren()[1].Beam
local lockPad = base.Layers["1"].LockButton

local position

local originalMinZoom = player.CameraMinZoomDistance
local originalMaxZoom = player.CameraMaxZoomDistance

local player = Players.LocalPlayer
local placeId = game.PlaceId

-- CAMERA
local function ZoomIn()
    player.CameraMinZoomDistance = 5
    player.CameraMaxZoomDistance = 5
end

local function ZoomOut()
    player.CameraMinZoomDistance = originalMinZoom
    player.CameraMaxZoomDistance = originalMaxZoom
end

local function FaceDown()
    local camera = workspace.CurrentCamera
    camera.CFrame = CFrame.new(camera.CFrame.Position, camera.CFrame.Position - Vector3.new(0, 1, 0))
end

-- ELEMENTS
-- Game
-- :: Auto Steal
local Label1 = Game:CreateLabel("Auto Steal", 0, Color3.fromRGB(51, 51, 51), false)

local PlayerDropdown = Game:CreateDropdown({
    Name = "Target",
    Options = GetPlayerNames(),
    CurrentOption = GetPlayerNames()[1],
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        target = Options[1]
        print("[Rayfield] TARGET:", target)
    end,
})

local LayerDropdown = Game:CreateDropdown({
    Name = "Layer",
    Options = {"1", "2", "3", "4", "5", "6", "7"},
    CurrentOption = {"1"},
    MultipleOptions = false,
    Flag = "Dropdown2",
    Callback = function(Options)
        layer = Options[1]
        print("[Rayfield] LAYER:", layer)
    end,
})

local StealButton = Game:CreateButton({
    Name = "Steal",
    Callback = function()
        target_base = findBase(target)

        if not target_base then return end

        local slots = target_base.Layers[layer].SlotPads:GetChildren()

        for _, slot in slots do
            local npc = slot:FindFirstChild("Character")
            
            if npc then
                local character = player.Character

                print("[AutoSteal] FOUND NPC:", npc:GetAttribute("CharacterId"))
                FaceDown()
                ZoomIn()

                if character then
                    local hrp = character:FindFirstChild("HumanoidRootPart")

                    if hrp then
                        local npc_hrp = npc:FindFirstChild("HumanoidRootPart")
                        local steal = npc_hrp.SlotPrompt

                        hrp.CFrame = npc_hrp.CFrame
                        task.wait(0.2)
                        activatePrompt(steal)
                        task.wait(0.1)
                        hrp.CFrame = base.Important.RobberyDeposit.CFrame
                        task.wait(0.3)
                        print("[AutoSteal] STOLE NPC:", npc:GetAttribute("CharacterId"))
                    end
                end
            end
        end
        ZoomOut()
    end,
})

-- :: Auto Lock
local Divider1 = Game:CreateDivider()

local Label2 = Game:CreateLabel("Auto Lock", 0, Color3.fromRGB(51, 51, 51), false)

local AutoLockEnabled = false

local AutoLockToggle = Game:CreateToggle({
    Name = "Lock",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(v)
        AutoLockEnabled = v

        if v then
            task.spawn(function()
                while AutoLockEnabled do
                    print("[AutoLock] CHECKING")
                    if beam.Transparency == 1 then
                        local character = player.Character

                        if character then
                            local hrp = character:FindFirstChild("HumanoidRootPart")

                            if hrp then
                                local position = hrp.CFrame

                                hrp.CFrame = lockPad.CFrame * CFrame.new(0, 2, 0)
                                task.wait(0.1)

                                hrp.CFrame = position

                                print("[AutoLock] LOCKED BASE")
                            end
                        end
                    end
                    task.wait(1)
                end
                print("[AutoLock] STOPPED")
            end)
        end
    end,
})

-- :: Specified Steal
local Divider2 = Game:CreateDivider()

local Label3 = Game:CreateLabel("Specified Steal", 0, Color3.fromRGB(51, 51, 51), false)

local target2 = player.Name
local layer2 = 1
local stand = 1

local PlayerDropdown2 = Game:CreateDropdown({
    Name = "Target",
    Options = GetPlayerNames(),
    CurrentOption = GetPlayerNames()[1],
    MultipleOptions = false,
    Flag = "Dropdown3",
    Callback = function(Options)
        target2 = Options[1]
        print("[Rayfield] TARGET:", target2)
    end,
})

local LayerDropdown2 = Game:CreateDropdown({
    Name = "Layer",
    Options = {"1", "2", "3", "4", "5", "6", "7"},
    CurrentOption = {"1"},
    MultipleOptions = false,
    Flag = "Dropdown4",
    Callback = function(Options)
        layer2 = Options[1]
        print("[Rayfield] LAYER:", layer2)
    end,
})

local StandDropdown = Game:CreateDropdown({
    Name = "Stand",
    Options = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"},
    CurrentOption = {"1"},
    MultipleOptions = false,
    Flag = "Dropdown5",
    Callback = function(Options)
        stand = Options[1]
        print("[Rayfield] STAND:", stand)
    end,
})

local SpecifiedStealButton = Game:CreateButton({
    Name = "Steal",
    Callback = function()
        target_base = findBase(target2)

        local slots = target_base.Layers[layer2].SlotPads:GetChildren()

        for _, slot in slots do
            if slot.Name == stand then
                local npc = slot:FindFirstChild("Character")
            
                if npc then
                    local character = player.Character

                    print("[SpecifiedSteal] FOUND NPC:", npc:GetAttribute("CharacterId"))
                    FaceDown()
                    ZoomIn()

                    if character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")

                        if hrp then
                            local npc_hrp = npc:FindFirstChild("HumanoidRootPart")
                            local steal = npc_hrp.SlotPrompt

                            hrp.CFrame = npc_hrp.CFrame
                            task.wait(0.2)
                            activatePrompt(steal)
                            task.wait(0.2)
                            hrp.CFrame = base.Important.RobberyDeposit.CFrame
                            task.wait(1)
                            print("[SpecifiedSteal] STOLE NPC:", npc:GetAttribute("CharacterId"))
                        end
                    end
                end
            end
        end
        ZoomOut()
    end,
})

local function UpdatePlayerDropdown()
    PlayerDropdown:Refresh(GetPlayerNames())
    PlayerDropdown2:Refresh(GetPlayerNames())
end

Players.PlayerAdded:Connect(UpdatePlayerDropdown)
Players.PlayerRemoving:Connect(function(player)
    local names = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            table.insert(names, p.Name)
        end
    end
    PlayerDropdown:Refresh(names)
    PlayerDropdown2:Refresh(names)
end)

-- :: Teleports

local Divider3 = Game:CreateDivider()

local Label4 = Game:CreateLabel("Teleports", 0, Color3.fromRGB(51, 51, 51), false)

local TeleportToBaseButton = Game:CreateButton({
    Name = "Teleport To Base",
    Callback = function()
        local character = player.Character

        if character then
            local hrp = character:FindFirstChild("HumanoidRootPart")

            if hrp then
                hrp.CFrame = base.Important.RobberyDeposit.CFrame
            end
        end
    end,
})

local player_base = "1"

local BasesDropdown = Game:CreateDropdown({
    Name = "Base",
    Options = {"1", "2", "3", "4", "5", "6", "7", "8"},
    CurrentOption = "1",
    MultipleOptions = false,
    Flag = "Dropdown6",
    Callback = function(Options)
        player_base = Options[1]
        print("[Teleport] SELECT BASE:", player_base)
    end,
})

local TeleportToBaseButton = Game:CreateButton({
    Name = "Teleport To Selected Base",
    Callback = function()
        local character = player.Character

        if character then
            local hrp = character:FindFirstChild("HumanoidRootPart")

            if hrp then
                hrp.CFrame = workspace.Map.Bases[player_base].Important.RobberyDeposit.CFrame
            end
        end
    end,
})

-- :: Auto Sell
local Divider2 = Game:CreateDivider()

local Label3 = Game:CreateLabel("Auto Sell", 0, Color3.fromRGB(51, 51, 51), false)

local layer3 = "1"

local LayerDropdown3 = Game:CreateDropdown({
    Name = "Layer",
    Options = {"1", "2", "3", "4", "5", "6", "7"},
    CurrentOption = {"1"},
    MultipleOptions = false,
    Flag = "Dropdown7",
    Callback = function(Options)
        layer3 = Options[1]
        print("[Rayfield] LAYER:", layer3)
    end,
})

local SellButton = Game:CreateButton({
    Name = "Sell",
    Callback = function()
        print(base)

        local slots = base.Layers[layer3].SlotPads:GetChildren()
        print("Debug #1")

        for _, slot in slots do
            local npc = slot:FindFirstChild("Character")

            if npc then
                local npc_hrp = npc:FindFirstChild("HumanoidRootPart")

                local character = player.Character

                if character then
                    local hrp = character:FindFirstChild("HumanoidRootPart")

                    if hrp then
                        FaceDown()
                        ZoomIn()
                        hrp.CFrame = npc_hrp.CFrame
                        task.wait(0.2)
                        activatePrompt(npc_hrp.SlotPrompt)
                        task.wait(0.1)
                    end
                end
            end
        end
        ZoomOut()
        local hrp = player.Character:FindFirstChild("HumanoidRootPart")
        hrp.CFrame = base.Important.RobberyDeposit.CFrame
    end,
})

-- General
-- :: Server Hop

local function ServerHop()
    local success, result = pcall(function()
        return HttpService:JSONDecode(
            game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?sortOrder=Asc&limit=100")
        )
    end)

    if success and result and result.data then
        local servers = {}
        for _, server in ipairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                table.insert(servers, server)
            end
        end

        if #servers > 0 then
            local chosenServer = servers[math.random(1, #servers)]
            TeleportService:TeleportToPlaceInstance(placeId, chosenServer.id, player)
        else
            print("[ServerHop] No available servers found, retrying...")
            task.wait(2)
            ServerHop()
        end
    else
        print("[ServerHop] Failed to fetch server list")
    end
end

-- :: Instant Proximity Prompts

local function MakePromptInstant(prompt)
    if prompt:IsA("ProximityPrompt") then
        prompt.HoldDuration = 0
    end
end

local ServerHopButton = General:CreateButton({
    Name = "Server Hop",
    Callback = function()
        ServerHop()
    end
})

local InstantProximityPromptsButton = General:CreateButton({
    Name = "Instant Proximity Prompts",
    Callback = function()
        for _, prompt in ipairs(workspace:GetDescendants()) do
            MakePromptInstant(prompt)
        end

        workspace.DescendantAdded:Connect(function(descendant)
            MakePromptInstant(descendant)
        end)
    end
})

-- :: Fly

local FlyEnabled = false
local flyConnection = nil
local bodyVelocity = nil
local bodyGyro = nil

local FLY_SPEED = 50

local function StartFly()
    local character = player.Character
    if not character then return end

    local hrp = character:FindFirstChild("HumanoidRootPart")
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not hrp or not humanoid then return end

    humanoid.PlatformStand = true

    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = hrp

    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bodyGyro.P = 3000
    bodyGyro.CFrame = hrp.CFrame
    bodyGyro.Parent = hrp

    flyConnection = RunService.RenderStepped:Connect(function()
        local camera = workspace.CurrentCamera
        local moveDirection = Vector3.new(0, 0, 0)

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection = moveDirection - camera.CFrame.LookVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + camera.CFrame.RightVector
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0)
        end

        if moveDirection.Magnitude > 0 then
            moveDirection = moveDirection.Unit
        end

        bodyVelocity.Velocity = moveDirection * FLY_SPEED
        bodyGyro.CFrame = camera.CFrame
    end)
end

local function StopFly()
    if flyConnection then
        flyConnection:Disconnect()
        flyConnection = nil
    end

    if bodyVelocity then
        bodyVelocity:Destroy()
        bodyVelocity = nil
    end

    if bodyGyro then
        bodyGyro:Destroy()
        bodyGyro = nil
    end

    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = false
        end
    end
end

local FlyToggle = General:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(v)
        FlyEnabled = v
        if v then
            StartFly()
        else
            StopFly()
        end
    end,
})

player.CharacterAdded:Connect(function()
    task.wait(1)
    if FlyEnabled then
        StopFly()
        StartFly()
    end
end)
