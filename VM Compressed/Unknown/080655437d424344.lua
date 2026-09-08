local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, -20)
title.Text = "Key System Enchanted Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Parent = frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragInput = nil
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local KeySystem = Instance.new("TextBox")
KeySystem.Size = UDim2.new(1, 0, 0.5, 0)
KeySystem.Position = UDim2.new(0, 0, 0, 0)
KeySystem.Text = "Enter the Key"
KeySystem.TextColor3 = Color3.new(0, 0, 0)
KeySystem.BackgroundTransparency = 0.5
KeySystem.BackgroundColor3 = Color3.new(1, 1, 1)
KeySystem.TextWrapped = true
KeySystem.Parent = frame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.5, 0, 0.5, 0)
SubmitButton.Position = UDim2.new(0, 0, 0.5, 0)
SubmitButton.Text = "Submit"
SubmitButton.Parent = frame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.Parent = frame

CloseButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Size = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Position = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Text = "Copy Key Link"
GetKeyButton.Parent = frame
--------------------------------------------------------------------------
SubmitButton.MouseButton1Click:Connect(function()
    local KeySystem = KeySystem.Text
    if KeySystem == "iblameaabis" then   
screenGui:Destroy()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local window = library:AddWindow("DUCKS SCRIPT By MCL_HAVOC || Deobfuscate By Aabis", {
    main_color = Color3.fromRGB(66, 164, 115), -- Custom emerald green color
    min_size = Vector2.new(700, 900),
    can_resize = true,
})

local mainTab = window:AddTab("Main")
local farmTab = window:AddTab("Farm")
local serverTab = window:AddTab("Server")
local killerTab = window:AddTab("Killer")
local statsTab = window:AddTab("Stats")
local performanceTab = window:AddTab("Performance")
local rebirth = window:AddTab("Rebirth")
local pets = window:AddTab("Pets")

mainTab:Show()

mainTab:AddLabel("Main Features")

local parts = {}
local partSize = 2048
local totalDistance = 50000
local startPosition = Vector3.new(-2, -9.5, -2)
local numberOfParts = math.ceil(totalDistance / partSize)

local function createParts()
    for x = 0, numberOfParts - 1 do
        for z = 0, numberOfParts - 1 do
            local newPartSide = Instance.new("Part")
            newPartSide.Size = Vector3.new(partSize, 1, partSize)
            newPartSide.Position = startPosition + Vector3.new(x * partSize, 0, z * partSize)
            newPartSide.Anchored = true
            newPartSide.Transparency = 1
            newPartSide.CanCollide = true
            newPartSide.Name = "Part_Side_" .. x .. "_" .. z
            newPartSide.Parent = workspace
            table.insert(parts, newPartSide)
            
            local newPartLeftRight = Instance.new("Part")
            newPartLeftRight.Size = Vector3.new(partSize, 1, partSize)
            newPartLeftRight.Position = startPosition + Vector3.new(-x * partSize, 0, z * partSize)
            newPartLeftRight.Anchored = true
            newPartLeftRight.Transparency = 1
            newPartLeftRight.CanCollide = true
            newPartLeftRight.Name = "Part_LeftRight_" .. x .. "_" .. z
            newPartLeftRight.Parent = workspace
            table.insert(parts, newPartLeftRight)
            
            local newPartUpLeft = Instance.new("Part")
            newPartUpLeft.Size = Vector3.new(partSize, 1, partSize)
            newPartUpLeft.Position = startPosition + Vector3.new(-x * partSize, 0, -z * partSize)
            newPartUpLeft.Anchored = true
            newPartUpLeft.Transparency = 1
            newPartUpLeft.CanCollide = true
            newPartUpLeft.Name = "Part_UpLeft_" .. x .. "_" .. z
            newPartUpLeft.Parent = workspace
            table.insert(parts, newPartUpLeft)
            
            local newPartUpRight = Instance.new("Part")
            newPartUpRight.Size = Vector3.new(partSize, 1, partSize)
            newPartUpRight.Position = startPosition + Vector3.new(x * partSize, 0, -z * partSize)
            newPartUpRight.Anchored = true
            newPartUpRight.Transparency = 1
            newPartUpRight.CanCollide = true
            newPartUpRight.Name = "Part_UpRight_" .. x .. "_" .. z
            newPartUpRight.Parent = workspace
            table.insert(parts, newPartUpRight)
        end
    end
end

local function makePartsWalkthrough()
    for _, part in ipairs(parts) do
        if part and part.Parent then
            part.CanCollide = false
        end
    end
end

local function makePartsSolid()
    for _, part in ipairs(parts) do
        if part and part.Parent then
            part.CanCollide = true
        end
    end
end

mainTab:AddSwitch("Full Walk On Water", function(bool)
    if bool then
        createParts()
    else
        makePartsWalkthrough()
    end
end)

mainTab:AddTextBox("Speed Changer", function(value)
    local selectedSpeed = value
    
    _G.AutoSpeed = true
    
    if _G.AutoSpeed then
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(selectedSpeed)
        end
    end
end)

mainTab:AddTextBox("Size Changer", function(value)
    local selectedSize = value
    
    _G.AutoSize = true
    
    if _G.AutoSize then
        game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", tonumber(selectedSize))
    end
end)


farmTab:AddLabel("Rock Farming")

local function gettool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end

local tinyIslandRockSwitch = farmTab:AddSwitch("Farm Tiny Island Rock", function(bool)
    selectrock = "Tiny Island Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 0 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 0 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local starterIslandRockSwitch = farmTab:AddSwitch("Farm Starter Island Rock", function(bool)
    selectrock = "Starter Island Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 100 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 100 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local legendBeachRockSwitch = farmTab:AddSwitch("Farm Legend Beach Rock", function(bool)
    selectrock = "Legend Beach Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 5000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 5000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local frostGymRockSwitch = farmTab:AddSwitch("Farm Frost Gym Rock", function(bool)
    selectrock = "Frost Gym Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 150000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 150000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local mythicalGymRockSwitch = farmTab:AddSwitch("Farm Mythical Gym Rock", function(bool)
    selectrock = "Mythical Gym Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 400000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 400000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local eternalGymRockSwitch = farmTab:AddSwitch("Farm Eternal Gym Rock", function(bool)
    selectrock = "Eternal Gym Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 750000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 750000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local legendGymRockSwitch = farmTab:AddSwitch("Farm Legend Gym Rock", function(bool)
    selectrock = "Legend Gym Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 1000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local muscleKingGymRockSwitch = farmTab:AddSwitch("Farm Muscle King Gym Rock", function(bool)
    selectrock = "Muscle King Gym Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 5000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)

local ancientJungleRockSwitch = farmTab:AddSwitch("Farm Ancient Jungle Rock", function(bool)
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = bool
    
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 10000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                            
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)


serverTab:AddLabel("Server Options")

serverTab:AddButton("Rejoin Server", function()
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

local joinLowPlayerServerSwitch = serverTab:AddSwitch("Join Low Player Server", function(bool)
    if bool then
        local module = loadstring(game:HttpGet("https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua"))()
        module:Teleport(game.PlaceId, "Lowest")
    end
end)

serverTab:AddButton("Full Optimization", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
            v.Enabled = false
        end
    end
    
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    lighting.Brightness = 0
    
    settings().Rendering.QualityLevel = 1
    
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            if v.Parent and (v.Parent:FindFirstChild("Humanoid") or v.Parent.Parent:FindFirstChild("Humanoid")) then
            else
                v.Reflectance = 0
            end
        end
    end
    
    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Optimization",
        Text = "Full optimization applied!",
        Duration = 5
    })
end)

killerTab:AddLabel("Killing Features")

_G.whitelistedPlayers = _G.whitelistedPlayers or {}
_G.targetPlayer = _G.targetPlayer or ""

local function checkCharacter()
    if not game.Players.LocalPlayer.Character then
        repeat
            task.wait()
        until game.Players.LocalPlayer.Character
    end
    return game.Players.LocalPlayer.Character
end

local function gettool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end

local function killPlayer(target)
    local character = checkCharacter()
    if character and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        if character:FindFirstChild("LeftHand") then
            firetouchinterest(target.Character.HumanoidRootPart, character.LeftHand, 0)
            firetouchinterest(target.Character.HumanoidRootPart, character.LeftHand, 1)
            gettool()
        end
    end
end

local function findClosestPlayer(input)
    if not input or input == "" then return nil end
    
    input = input:lower()
    local bestMatch = nil
    local bestScore = 0
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local username = player.Name:lower()
            local displayName = player.DisplayName:lower()
            
            local usernameMatch = username:find(input, 1, true) ~= nil
            local displayMatch = displayName:find(input, 1, true) ~= nil
            
            local usernameScore = 0
            local displayScore = 0
            
            if usernameMatch then
                usernameScore = (#input / #username) * 100
                if username:sub(1, #input) == input then
                    usernameScore = usernameScore + 50
                end
            end
            
            if displayMatch then
                displayScore = (#input / #displayName) * 100
                if displayName:sub(1, #input) == input then
                    displayScore = displayScore + 50
                end
            end
            
            local score = math.max(usernameScore, displayScore)
            
            if score > bestScore then
                bestScore = score
                bestMatch = player
            end
        end
    end
    
    if bestScore > 20 then
        return bestMatch
    end
    
    return nil
end

local whitelistedPlayersLabel = killerTab:AddLabel("Whitelisted Players: None")

local targetPlayerLabel = killerTab:AddLabel("Target Player: None")

local function updateWhitelistedPlayersLabel()
    if #_G.whitelistedPlayers == 0 then
        whitelistedPlayersLabel.Text = "Whitelisted Players: None"
    else
        local displayText = "Whitelisted Players: "
        for i, playerInfo in ipairs(_G.whitelistedPlayers) do
            if i > 1 then displayText = displayText .. ", " end
            displayText = displayText .. playerInfo
        end
        whitelistedPlayersLabel.Text = displayText
    end
end

local function updateTargetPlayerLabel()
    if _G.targetPlayer == "" then
        targetPlayerLabel.Text = "Target Player: None"
    else
        targetPlayerLabel.Text = "Target Player: " .. _G.targetPlayer
    end
end

local autoWhitelistFriendsSwitch = killerTab:AddSwitch("Auto Whitelist Friends", function(bool)
    _G.autoWhitelistFriends = bool
    
    if bool then
        for _, player in pairs(game.Players:GetPlayers()) do
            if player:IsFriendsWith(game.Players.LocalPlayer.UserId) then
                local playerInfo = player.Name .. " (" .. player.DisplayName .. ")"
                if not table.find(_G.whitelistedPlayers, playerInfo) then
                    table.insert(_G.whitelistedPlayers, playerInfo)
                end
            end
        end
        updateWhitelistedPlayersLabel()
    end
end)

game.Players.PlayerAdded:Connect(function(player)
    if _G.autoWhitelistFriends and player:IsFriendsWith(game.Players.LocalPlayer.UserId) then
        local playerInfo = player.Name .. " (" .. player.DisplayName .. ")"
        if not table.find(_G.whitelistedPlayers, playerInfo) then
            table.insert(_G.whitelistedPlayers, playerInfo)
            updateWhitelistedPlayersLabel()
        end
    end
end)

killerTab:AddTextBox("Whitelist Player (Enter Username/Display)", function(text)
    if text and text ~= "" then
        local player = findClosestPlayer(text)
        if player then
            local playerInfo = player.Name .. " (" .. player.DisplayName .. ")"
            
            local alreadyWhitelisted = false
            for _, info in ipairs(_G.whitelistedPlayers) do
                if info:find(player.Name, 1, true) then
                    alreadyWhitelisted = true
                    break
                end
            end
            
            if not alreadyWhitelisted then
                table.insert(_G.whitelistedPlayers, playerInfo)
                updateWhitelistedPlayersLabel()
            end
        end
    end
end)

killerTab:AddTextBox("Unwhitelist Player (Enter Username/Display)", function(text)
    if text and text ~= "" then
        local textLower = text:lower()
        for i, playerInfo in ipairs(_G.whitelistedPlayers) do
            if playerInfo:lower():find(textLower, 1, true) then
                table.remove(_G.whitelistedPlayers, i)
                updateWhitelistedPlayersLabel()
                return
            end
        end
        
        local player = findClosestPlayer(text)
        if player then
            for i, playerInfo in ipairs(_G.whitelistedPlayers) do
                if playerInfo:find(player.Name, 1, true) then
                    table.remove(_G.whitelistedPlayers, i)
                    updateWhitelistedPlayersLabel()
                    break
                end
            end
        end
    end
end)

killerTab:AddButton("Clear All Whitelisted", function()
    _G.whitelistedPlayers = {}
    updateWhitelistedPlayersLabel()
end)

local autoKillAllSwitch = killerTab:AddSwitch("Auto Kill All (except Whitelist)", function(bool)
    _G.autoKillAll = bool
    
    if bool then
        spawn(function()
            while _G.autoKillAll do
                local players = game:GetService("Players"):GetPlayers()
                
                if #players <= 1 then
                    task.wait(1)
                    continue
                end
                
                for _, player in ipairs(players) do
                    if player == game.Players.LocalPlayer or not _G.autoKillAll then
                        continue
                    end
                    
                    local isWhitelisted = false
                    for _, whitelistedInfo in ipairs(_G.whitelistedPlayers) do
                        if whitelistedInfo:find(player.Name, 1, true) then
                            isWhitelisted = true
                            break
                        end
                    end
                    
                    if not isWhitelisted then
                        killPlayer(player)
                        task.wait(0.05)
                    end
                end
                
                task.wait(0.5)
            end
        end)
    end
end)

killerTab:AddTextBox("Target Player (Enter Username/Display)", function(text)
    if text and text ~= "" then
        local player = findClosestPlayer(text)
        if player then
            _G.targetPlayer = player.Name .. " (" .. player.DisplayName .. ")"
            updateTargetPlayerLabel()
        end
    end
end)

killerTab:AddButton("Clear Target", function()
    _G.targetPlayer = ""
    updateTargetPlayerLabel()
end)

local autoKillTargetSwitch = killerTab:AddSwitch("Auto Kill Target", function(bool)
    _G.autoKillTarget = bool
    
    if bool and _G.targetPlayer ~= "" then
        spawn(function()
            while _G.autoKillTarget and _G.targetPlayer ~= "" do
                local targetName = _G.targetPlayer:match("^([^%(]+)")
                if targetName then
                    targetName = targetName:gsub("%s+$", "")
                    local targetPlayer = game.Players:FindFirstChild(targetName)
                    if targetPlayer then
                        killPlayer(targetPlayer)
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)

killerTab:AddButton("Kill All (except Whitelist)", function()
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local isWhitelisted = false
            for _, whitelistedInfo in ipairs(_G.whitelistedPlayers) do
                if whitelistedInfo:find(player.Name, 1, true) then
                    isWhitelisted = true
                    break
                end
            end
            
            if not isWhitelisted then
                killPlayer(player)
            end
        end
    end
end)

killerTab:AddButton("Kill Target", function()
    if _G.targetPlayer ~= "" then
        local targetName = _G.targetPlayer:match("^([^%(]+)")
        if targetName then
            targetName = targetName:gsub("%s+$", "")
            local targetPlayer = game.Players:FindFirstChild(targetName)
            if targetPlayer then
                killPlayer(targetPlayer)
            end
        end
    end
end)

performanceTab:AddLabel("Performance Options")

performanceTab:AddButton("Remove Textures", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        end
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Performance",
        Text = "Textures removed!",
        Duration = 5
    })
end)

performanceTab:AddButton("Reduce Graphics", function()
    settings().Rendering.QualityLevel = 1
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Performance",
        Text = "Graphics reduced!",
        Duration = 5
    })
end)

performanceTab:AddButton("Disable Shadows", function()
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Performance",
        Text = "Shadows disabled!",
        Duration = 5
    })
end)

performanceTab:AddButton("Disable Effects", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
            v.Enabled = false
        end
    end
    
    local lighting = game:GetService("Lighting")
    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Performance",
        Text = "Effects disabled!",
        Duration = 5
    })
end)

performanceTab:AddButton("Simplify Materials", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            if v.Parent and (v.Parent:FindFirstChild("Humanoid") or v.Parent.Parent:FindFirstChild("Humanoid")) then
            else
                v.Reflectance = 0
            end
        end
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Performance",
        Text = "Materials simplified!",
        Duration = 5
    })
end)

performanceTab:AddButton("Remove Fog", function()
    local lighting = game:GetService("Lighting")
    lighting.FogEnd = 9e9
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Performance",
        Text = "Fog removed!",
        Duration = 5
    })
end)

performanceTab:AddButton("Full Optimization", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
            v.Enabled = false
        end
    end
    
    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    lighting.Brightness = 0
    
    settings().Rendering.QualityLevel = 1
    
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            if v.Parent and (v.Parent:FindFirstChild("Humanoid") or v.Parent.Parent:FindFirstChild("Humanoid")) then
            else
                v.Reflectance = 0
            end
        end
    end
    
    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Performance",
        Text = "Full optimization applied!",
        Duration = 5
    })
end)

-- Initialize labels
updateWhitelistedPlayersLabel()
updateTargetPlayerLabel()

-- Stats Tab Implementation
statsTab:AddLabel("â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”")
statsTab:AddLabel("ðŸ“Š PLAYER STATISTICS")
statsTab:AddLabel("â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”")

-- Session tracking variables
local sessionStartTime = os.time()
local sessionStartStrength = 0
local sessionStartDurability = 0
local sessionStartAgility = 0
local sessionStartKills = 0
local sessionStartRebirths = 0
local hasStartedTracking = false

-- Basic stats section with current and gained values
statsTab:AddLabel("ðŸ’ª STRENGTH")
local strengthStatsLabel = statsTab:AddLabel("Current: Loading... | Gained: 0")
local strengthRateLabel = statsTab:AddLabel("Rate: 0/min")

statsTab:AddLabel("ðŸ›¡ï¸ DURABILITY")
local durabilityStatsLabel = statsTab:AddLabel("Current: Loading... | Gained: 0")
local durabilityRateLabel = statsTab:AddLabel("Rate: 0/min")

statsTab:AddLabel("ðŸƒ AGILITY")
local agilityStatsLabel = statsTab:AddLabel("Current: Loading... | Gained: 0")
local agilityRateLabel = statsTab:AddLabel("Rate: 0/min")

statsTab:AddLabel("ðŸ”„ REBIRTHS")
local rebirthsStatsLabel = statsTab:AddLabel("Current: Loading... | Gained: 0")
local rebirthsRateLabel = statsTab:AddLabel("Rate: 0/min")

statsTab:AddLabel("ðŸ’€ KILLS")
local killsStatsLabel = statsTab:AddLabel("Current: Loading... | Gained: 0")
local killsRateLabel = statsTab:AddLabel("Rate: 0/min")

statsTab:AddLabel("ðŸ¥Š BRAWLS")
local brawlsLabel = statsTab:AddLabel("Current: Loading...")

statsTab:AddLabel("ðŸ˜‡ GOOD KARMA")
local goodKarmaLabel = statsTab:AddLabel("Current: Loading...")

statsTab:AddLabel("ðŸ˜ˆ EVIL KARMA")
local evilKarmaLabel = statsTab:AddLabel("Current: Loading...")

statsTab:AddLabel("ðŸ‘‘ MUSCLE KING")
local muscleKingTimeLabel = statsTab:AddLabel("Time: Loading...")

statsTab:AddLabel("â±ï¸ SESSION INFORMATION")
local sessionTimeLabel = statsTab:AddLabel("Time: 00:00:00")

-- Utility function for formatting numbers
local function formatNumber(number)
    if number >= 1e15 then return string.format("%.2fQ", number/1e15)
    elseif number >= 1e12 then return string.format("%.2fT", number/1e12)
    elseif number >= 1e9 then return string.format("%.2fB", number/1e9)
    elseif number >= 1e6 then return string.format("%.2fM", number/1e6)
    elseif number >= 1e3 then return string.format("%.2fK", number/1e3)
    end
    return tostring(math.floor(number))
end

local function formatNumberWithCommas(number)
    local formatted = tostring(math.floor(number))
    local k
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then break end
    end
    return formatted
end

local function formatTime(seconds)
    local days = math.floor(seconds / 86400)
    local hours = math.floor((seconds % 86400) / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60
    
    if days > 0 then
        return string.format("%dd %02dh %02dm %02ds", days, hours, minutes, secs)
    else
        return string.format("%02d:%02d:%02d", hours, minutes, secs)
    end
end

-- Initialize tracking
local function startTracking()
    if not hasStartedTracking then
        local player = game.Players.LocalPlayer
        sessionStartStrength = player.leaderstats.Strength.Value
        sessionStartDurability = player.Durability.Value
        sessionStartAgility = player.Agility.Value
        sessionStartKills = player.leaderstats.Kills.Value
        sessionStartRebirths = player.leaderstats.Rebirths.Value
        sessionStartTime = os.time()
        hasStartedTracking = true
    end
end

-- Update stats function
local function updateStats()
    local player = game.Players.LocalPlayer
    
    -- Start tracking if not started yet
    if not hasStartedTracking then
        startTracking()
    end
    
    -- Calculate gains
    local currentStrength = player.leaderstats.Strength.Value
    local currentDurability = player.Durability.Value
    local currentAgility = player.Agility.Value
    local currentKills = player.leaderstats.Kills.Value
    local currentRebirths = player.leaderstats.Rebirths.Value
    
    local strengthGain = currentStrength - sessionStartStrength
    local durabilityGain = currentDurability - sessionStartDurability
    local agilityGain = currentAgility - sessionStartAgility
    local killsGain = currentKills - sessionStartKills
    local rebirthsGain = currentRebirths - sessionStartRebirths
    
    -- Update stats with current and gained values
    strengthStatsLabel.Text = string.format("Current: %s | Gained: %s", 
        formatNumber(currentStrength), formatNumber(strengthGain))
    
    durabilityStatsLabel.Text = string.format("Current: %s | Gained: %s", 
        formatNumber(currentDurability), formatNumber(durabilityGain))
    
    agilityStatsLabel.Text = string.format("Current: %s | Gained: %s", 
        formatNumber(currentAgility), formatNumber(agilityGain))
    
    rebirthsStatsLabel.Text = string.format("Current: %s | Gained: %s", 
        formatNumber(currentRebirths), formatNumber(rebirthsGain))
    
    killsStatsLabel.Text = string.format("Current: %s | Gained: %s", 
        formatNumber(currentKills), formatNumber(killsGain))
    
    -- Update other combat stats
    if player.leaderstats:FindFirstChild("Brawls") then
        brawlsLabel.Text = string.format("Current: %s", formatNumber(player.leaderstats.Brawls.Value))
    end
    
    if player:FindFirstChild("goodKarma") then
        goodKarmaLabel.Text = string.format("Current: %s", formatNumber(player.goodKarma.Value))
    end
    
    if player:FindFirstChild("evilKarma") then
        evilKarmaLabel.Text = string.format("Current: %s", formatNumber(player.evilKarma.Value))
    end
    
    -- Time stats update
    if player:FindFirstChild("muscleKingTime") then
        muscleKingTimeLabel.Text = string.format("Time: %s", formatTime(player.muscleKingTime.Value))
    end
    
    -- Session time update
    local elapsedTime = os.time() - sessionStartTime
    local timeString = formatTime(elapsedTime)
    sessionTimeLabel.Text = string.format("Time: %s", timeString)
    
    -- Calculate and update rates (prevent division by zero)
    if elapsedTime > 0 then
        local minutesElapsed = elapsedTime / 60
        
        local strengthPerMinute = math.floor(strengthGain / minutesElapsed)
        local durabilityPerMinute = math.floor(durabilityGain / minutesElapsed)
        local agilityPerMinute = math.floor(agilityGain / minutesElapsed)
        local killsPerMinute = math.floor(killsGain / minutesElapsed)
        local rebirthsPerMinute = rebirthsGain / minutesElapsed
        
        strengthRateLabel.Text = string.format("Rate: %s/min", formatNumber(strengthPerMinute))
        durabilityRateLabel.Text = string.format("Rate: %s/min", formatNumber(durabilityPerMinute))
        agilityRateLabel.Text = string.format("Rate: %s/min", formatNumber(agilityPerMinute))
        killsRateLabel.Text = string.format("Rate: %s/min", formatNumber(killsPerMinute))
        rebirthsRateLabel.Text = string.format("Rate: %.2f/min", rebirthsPerMinute)
    end
end

-- Update stats initially
updateStats()

-- Update stats every 2 seconds
spawn(function()
    while wait(2) do
        updateStats()
    end
end)

-- Add buttons for additional functionality
statsTab:AddLabel("â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”")
statsTab:AddLabel("ðŸ› ï¸ Copy Stats")
statsTab:AddLabel("â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”â”")

statsTab:AddButton("Reset Tracking", function()
    local player = game.Players.LocalPlayer
    sessionStartStrength = player.leaderstats.Strength.Value
    sessionStartDurability = player.Durability.Value
    sessionStartAgility = player.Agility.Value
    sessionStartKills = player.leaderstats.Kills.Value
    sessionStartRebirths = player.leaderstats.Rebirths.Value
    sessionStartTime = os.time()
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Stats Tracking",
        Text = "Session progress tracking has been reset!",
        Duration = 5
    })
end)

statsTab:AddButton("Copy Stats to Clipboard", function()
    local player = game.Players.LocalPlayer
    local statsText = "Muscle Legends Stats:\n\n"
    
    statsText = statsText .. "ðŸ’ª Strength: " .. formatNumberWithCommas(player.leaderstats.Strength.Value) .. "\n"
    statsText = statsText .. "ðŸ›¡ï¸ Durability: " .. formatNumberWithCommas(player.Durability.Value) .. "\n"
    statsText = statsText .. "ðŸƒ Agility: " .. formatNumberWithCommas(player.Agility.Value) .. "\n"
    statsText = statsText .. "ðŸ”„ Rebirths: " .. formatNumberWithCommas(player.leaderstats.Rebirths.Value) .. "\n"
    statsText = statsText .. "ðŸ’€ Kills: " .. formatNumberWithCommas(player.leaderstats.Kills.Value) .. "\n"
    statsText = statsText .. "ðŸ¥Š Brawls: " .. formatNumberWithCommas(player.leaderstats.Brawls.Value) .. "\n"
    statsText = statsText .. "ðŸ˜‡ Good Karma: " .. formatNumberWithCommas(player.goodKarma.Value) .. "\n"
    statsText = statsText .. "ðŸ˜ˆ Evil Karma: " .. formatNumberWithCommas(player.evilKarma.Value) .. "\n"
    statsText = statsText .. "ðŸ‘‘ Muscle King Time: " .. formatTime(player.muscleKingTime.Value) .. "\n\n"
    
    -- Add session stats if tracking has started
    if hasStartedTracking then
        local elapsedTime = os.time() - sessionStartTime
        local strengthGain = player.leaderstats.Strength.Value - sessionStartStrength
        local durabilityGain = player.Durability.Value - sessionStartDurability
        local agilityGain = player.Agility.Value - sessionStartAgility
        local killsGain = player.leaderstats.Kills.Value - sessionStartKills
        local rebirthsGain = player.leaderstats.Rebirths.Value - sessionStartRebirths
        
        statsText = statsText .. "--- Session Stats ---\n"
        statsText = statsText .. "â±ï¸ Session Time: " .. formatTime(elapsedTime) .. "\n"
        statsText = statsText .. "ðŸ’ª Strength Gained: " .. formatNumberWithCommas(strengthGain) .. "\n"
        statsText = statsText .. "ðŸ›¡ï¸ Durability Gained: " .. formatNumberWithCommas(durabilityGain) .. "\n"
        statsText = statsText .. "ðŸƒ Agility Gained: " .. formatNumberWithCommas(agilityGain) .. "\n"
        statsText = statsText .. "ðŸ’€ Kills Gained: " .. formatNumberWithCommas(killsGain) .. "\n"
        statsText = statsText .. "ðŸ”„ Rebirths Gained: " .. formatNumberWithCommas(rebirthsGain) .. "\n"
        
        -- Add rates
        if elapsedTime > 0 then
            local minutesElapsed = elapsedTime / 60
            
            statsText = statsText .. "\n--- Gain Rates ---\n"
            statsText = statsText .. "ðŸ’ª Strength: " .. formatNumberWithCommas(math.floor(strengthGain / minutesElapsed)) .. "/min\n"
            statsText = statsText .. "ðŸ›¡ï¸ Durability: " .. formatNumberWithCommas(math.floor(durabilityGain / minutesElapsed)) .. "/min\n"
            statsText = statsText .. "ðŸƒ Agility: " .. formatNumberWithCommas(math.floor(agilityGain / minutesElapsed)) .. "/min\n"
            statsText = statsText .. "ðŸ’€ Kills: " .. formatNumberWithCommas(math.floor(killsGain / minutesElapsed)) .. "/min\n"
            statsText = statsText .. "ðŸ”„ Rebirths: " .. string.format("%.2f", rebirthsGain / minutesElapsed) .. "/min\n"
        end
    end
    
    setclipboard(statsText)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Stats Copied",
        Text = "Your stats have been copied to clipboard!",
        Duration = 5
    })
end)

local function unequipAllPets()
    local petsFolder = player.petsFolder

    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                ReplicatedStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end
    task.wait(0.1)
end

local function equipUniquePet(petName)
    unequipAllPets()
    task.wait(0.01)
    for _, pet in pairs(player.petsFolder.Unique:GetChildren()) do
        if pet.Name == petName then
            ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
        end
    end
end

local function findMachine(machineName)
    local machine = workspace.machinesFolder:FindFirstChild(machineName)
    if not machine then
        for _, folder in pairs(workspace:GetChildren()) do
            if folder:IsA("Folder") and folder.Name:find("machines") then
                machine = folder:FindFirstChild(machineName)
                if machine then break end
            end
        end
    end
    return machine
end

local function pressE()
    local vim = game:GetService("VirtualInputManager")
    vim:SendKeyEvent(true, "E", false, game)
    task.wait(0.1)
    vim:SendKeyEvent(false, "E", false, game)
end

local function useOneEgg()
    ReplicatedStorage.rEvents.proteinEggEvent:FireServer("useEgg")
end

rebirth:AddLabel("Rebirth Farm Settings")

rebirth:AddTextBox("Target Rebirth", function(text)
    targetRebirth = tonumber(text) or math.huge
end)

-- Variable to store the position lock connection
local positionLockConnection = nil

-- Function to lock player position
local function lockPlayerPosition(position)
    if positionLockConnection then
        positionLockConnection:Disconnect()
    end
    
    positionLockConnection = game:GetService("RunService").Heartbeat:Connect(function()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = position
        end
    end)
end

-- Function to unlock player position
local function unlockPlayerPosition()
    if positionLockConnection then
        positionLockConnection:Disconnect()
        positionLockConnection = nil
    end
end

-- Add position lock toggle
rebirth:AddSwitch("Lock Position", function(bool)
    if bool then
        -- Get current position and lock it
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local currentPosition = player.Character.HumanoidRootPart.CFrame
            lockPlayerPosition(currentPosition)
        end
    else
        -- Unlock position
        unlockPlayerPosition()
    end
end)

local packFarm = rebirth:AddSwitch("Pack Farm", function(bool)
    isRunning = bool
    
    task.spawn(function()
        while isRunning do
            local currentRebirths = player.leaderstats.Rebirths.Value
            local rebirthCost = 10000 + (5000 * currentRebirths)
            
            if player.ultimatesFolder:FindFirstChild("Golden Rebirth") then
                local goldenRebirths = player.ultimatesFolder["Golden Rebirth"].Value
                rebirthCost = math.floor(rebirthCost * (1 - (goldenRebirths * 0.1)))
            end

            unequipAllPets()
            task.wait(0.1)
            equipUniquePet("Swift Samurai")
            
            while isRunning and player.leaderstats.Strength.Value < rebirthCost do
                for i = 1, 10 do
                    player.muscleEvent:FireServer("rep")
                end
                task.wait()
            end

            unequipAllPets()
            task.wait(0.1)
            equipUniquePet("Tribal Overlord")

            local machine = findMachine("Jungle Bar Lift")
            if machine and machine:FindFirstChild("interactSeat") then
                player.Character.HumanoidRootPart.CFrame = machine.interactSeat.CFrame * CFrame.new(0, 3, 0)
                repeat
                    task.wait(0.1)
                    pressE()
                until player.Character.Humanoid.Sit
            end

            local initialRebirths = player.leaderstats.Rebirths.Value
            repeat
                ReplicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                task.wait(0.1)
            until player.leaderstats.Rebirths.Value > initialRebirths

            if not isRunning then break end
            task.wait()
        end
    end)
end)

local frameToggle = rebirth:AddSwitch("Hide All Frames", function(bool)
    local rSto = game:GetService("ReplicatedStorage")
    for _, obj in pairs(rSto:GetChildren()) do
        if obj.Name:match("Frame$") then
            obj.Visible = not bool
        end
    end
end)

local speedGrind = rebirth:AddSwitch("Speed Grind (No Rebirth)", function(bool)
    local isGrinding = bool
    
    if not bool then
        unequipAllPets()
        return
    end
    
    equipUniquePet("Swift Samurai")
    
    for i = 1, 23 do
        task.spawn(function()
            while isGrinding do
                player.muscleEvent:FireServer("rep")
                task.wait()
            end
        end)
    end
end)




local pets = window:AddTab("Pets")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Pet section
pets:AddLabel("PETS")

-- Create pet dropdown with the correct format
local selectedPet = "Neon Guardian" -- Default selection
local petDropdown = pets:AddDropdown("Select Pet", function(text)
    selectedPet = text
    print("Selected pet: " .. text)
end)

-- Add pet options
petDropdown:Add("Neon Guardian")
petDropdown:Add("Blue Birdie")
petDropdown:Add("Blue Bunny")
petDropdown:Add("Blue Firecaster")
petDropdown:Add("Blue Pheonix")
petDropdown:Add("Crimson Falcon")
petDropdown:Add("Cybernetic Showdown Dragon")
petDropdown:Add("Dark Golem")
petDropdown:Add("Dark Legends Manticore")
petDropdown:Add("Dark Vampy")
petDropdown:Add("Darkstar Hunter")
petDropdown:Add("Eternal Strike Leviathan")
petDropdown:Add("Frostwave Legends Penguin")
petDropdown:Add("Gold Warrior")
petDropdown:Add("Golden Pheonix")
petDropdown:Add("Golden Viking")
petDropdown:Add("Green Butterfly")
petDropdown:Add("Green Firecaster")
petDropdown:Add("Infernal Dragon")
petDropdown:Add("Lightning Strike Phantom")
petDropdown:Add("Magic Butterfly")
petDropdown:Add("Muscle Sensei")
petDropdown:Add("Orange Hedgehog")
petDropdown:Add("Orange Pegasus")
petDropdown:Add("Phantom Genesis Dragon")
petDropdown:Add("Purple Dragon")
petDropdown:Add("Purple Falcon")
petDropdown:Add("Red Dragon")
petDropdown:Add("Red Firecaster")
petDropdown:Add("Red Kitty")
petDropdown:Add("Silver Dog")
petDropdown:Add("Ultimate Supernova Pegasus")
petDropdown:Add("Ultra Birdie")
petDropdown:Add("White Pegasus")
petDropdown:Add("White Pheonix")
petDropdown:Add("Yellow Butterfly")

-- Auto open pet toggle
pets:AddSwitch("Auto Open Pet", function(bool)
    _G.AutoHatchPet = bool
    
    if bool then
        spawn(function()
            while _G.AutoHatchPet and selectedPet ~= "" do
                local petToOpen = ReplicatedStorage.cPetShopFolder:FindFirstChild(selectedPet)
                if petToOpen then
                    ReplicatedStorage.cPetShopRemote:InvokeServer(petToOpen)
                end
                task.wait(1)
            end
        end)
    end
end)

-- Aura section
pets:AddLabel("AURAS")

-- Create aura dropdown with the correct format
local selectedAura = "Blue Aura" -- Default selection
local auraDropdown = pets:AddDropdown("Select Aura", function(text)
    selectedAura = text
    print("Selected aura: " .. text)
end)

-- Add aura options
auraDropdown:Add("Astral Electro")
auraDropdown:Add("Azure Tundra")
auraDropdown:Add("Blue Aura")
auraDropdown:Add("Dark Electro")
auraDropdown:Add("Dark Lightning")
auraDropdown:Add("Dark Storm")
auraDropdown:Add("Electro")
auraDropdown:Add("Enchanted Mirage")
auraDropdown:Add("Entropic Blast")
auraDropdown:Add("Eternal Megastrike")
auraDropdown:Add("Grand Supernova")
auraDropdown:Add("Green Aura")
auraDropdown:Add("Inferno")
auraDropdown:Add("Lightning")
auraDropdown:Add("Muscle King")
auraDropdown:Add("Power Lightning")
auraDropdown:Add("Purple Aura")
auraDropdown:Add("Purple Nova")
auraDropdown:Add("Red Aura")
auraDropdown:Add("Supernova")
auraDropdown:Add("Ultra Inferno")
auraDropdown:Add("Ultra Mirage")
auraDropdown:Add("Unstable Mirage")
auraDropdown:Add("Yellow Aura")

-- Auto open aura toggle
pets:AddSwitch("Auto Open Aura", function(bool)
    _G.AutoHatchAura = bool
    
    if bool then
        spawn(function()
            while _G.AutoHatchAura and selectedAura ~= "" do
                local auraToOpen = ReplicatedStorage.cPetShopFolder:FindFirstChild(selectedAura)
                if auraToOpen then
                    ReplicatedStorage.cPetShopRemote:InvokeServer(auraToOpen)
                end
                task.wait(1)
            end
        end)
    end
end)

  end
end)
GetKeyButton.MouseButton1Click:Connect(function()
 setclipboard("https://rekonise.com/get-key-of-enchanted-hub-3p3up") 
end) 
