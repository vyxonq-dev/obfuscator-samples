local RED_ACCENT = Color3.fromRGB(220, 20, 60)
local DARK_GLASS = Color3.fromRGB(12, 12, 12)
local FIELD_BG = Color3.fromRGB(20, 20, 20)
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)
local SUBTITLE_COLOR = Color3.fromRGB(170, 170, 170)

local correctKey = "iblameaabis"
local LocalPlayer = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local function ExecuteHub()
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()

local window = library:AddWindow("Sad V1", {
    main_color = Color3.fromRGB(0, 0, 0), -- Color
    min_size = Vector2.new(470, 470), -- Size of the GUI
    can_resize = false,
})

-- Main Tab
local Main = window:AddTab("Main")
local folder = Main:AddFolder("Brawl")

-- God Mode Toggle
local godModeToggle = false
folder:AddSwitch("God Mode (Brawl)", function(State)
    godModeToggle = State
    if State then
        task.spawn(function()
            while godModeToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(0)
            end
        end)
    end
end)

-- Auto Join Brawl Toggle
local autoJoinToggle = false
folder:AddSwitch("Auto Join Brawl", function(State)
    autoJoinToggle = State
    if State then
        task.spawn(function()
            while autoJoinToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(2)
            end
        end)
    end
end)

-- Misc Tab
local folder2 = Main:AddFolder("Misc")

-- Destroy Ad Teleport Button
folder2:AddButton("Destroy Ad Teleport", function()
    local part = workspace:FindFirstChild("RobloxForwardPortals")
    if part then
        part:Destroy()
    end
end)

folder2:AddButton("Permanent Shift Lock", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/CjNsnSDy'))()
end)

folder2:AddButton("Anti AFK", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))()
end)

-- Unable Trade Toggle
folder2:AddSwitch("Disable Trade", function(State)
    if State then
        game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer("disableTrading")
    else
        game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer("enableTrading")
    end
end)

-- Hide Pets Toggle
folder2:AddSwitch("Hide Pets", function(State)
    if State then
        game:GetService("ReplicatedStorage").rEvents.showPetsEvent:FireServer("hidePets")
    else
        game:GetService("ReplicatedStorage").rEvents.showPetsEvent:FireServer("showPets")
    end
end)

folder2:AddLabel("-------------")

local autoRepToggle = false
folder2:AddSwitch("Auto Lift", function(State)
    autoRepToggle = State
    if State then
        task.spawn(function()
            while autoRepToggle do
                game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer("rep")
                task.wait(0.1)
            end
        end)
    end
end)

Main:AddLabel("---Auto Farm---")
local folder3 = Main:AddFolder("Auto Farm Jungle")

-- Auto Jungle Bench Toggle
local jungleBenchToggle = false
folder3:AddSwitch("Auto Jungle Bench", function(State)
    jungleBenchToggle = State
    if State then
        task.spawn(function()
            while jungleBenchToggle do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8629.88086, 64.8842468, 1855.03467))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bench"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Jungle Bar Lift Toggle
local jungleBarLiftToggle = false
folder3:AddSwitch("Auto Jungle Bar Lift", function(State)
    jungleBarLiftToggle = State
    if State then
        task.spawn(function()
            while jungleBarLiftToggle do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8678.05566, 14.5030098, 2089.25977))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bar Lift"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Jungle Squat Toggle
local jungleSquatToggle = false
folder3:AddSwitch("Auto Jungle Squat", function(State)
    jungleSquatToggle = State
    if State then
        task.spawn(function()
            while jungleSquatToggle do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8374.25586, 34.5933418, 2932.44995))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Squat"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

local AutoEquip = Main:AddFolder("Auto Equip")

-- Auto Equip Weight Toggle
local equipWeightToggle = false
AutoEquip:AddSwitch("Auto Equip Weight", function(State)
    equipWeightToggle = State
    if State then
        task.spawn(function()
            while equipWeightToggle do
                local weightTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
                if weightTool then
                    weightTool.Parent = game.Players.LocalPlayer.Character
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Equip Pushups Toggle
local equipPushupsToggle = false
AutoEquip:AddSwitch("Auto Equip Pushups", function(State)
    equipPushupsToggle = State
    if State then
        task.spawn(function()
            while equipPushupsToggle do
                local pushupsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
                if pushupsTool then
                    pushupsTool.Parent = game.Players.LocalPlayer.Character
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Equip Situps Toggle
local equipSitupsToggle = false
AutoEquip:AddSwitch("Auto Equip Situps", function(State)
    equipSitupsToggle = State
    if State then
        task.spawn(function()
            while equipSitupsToggle do
                local situpsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
                if situpsTool then
                    situpsTool.Parent = game.Players.LocalPlayer.Character
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Equip Handstand Toggle
local equipHandstandToggle = false
AutoEquip:AddSwitch("Auto Equip Handstands", function(State)
    equipHandstandToggle = State
    if State then
        task.spawn(function()
            while equipHandstandToggle do
                local handstandTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstand")
                if handstandTool then
                    handstandTool.Parent = game.Players.LocalPlayer.Character
                end
                task.wait(0.1)
            end
        end)
    end
end)

local Rebirth = Main:AddFolder("Auto Rebirths")

local autoRebirth = false

local switch = Rebirth:AddSwitch("Auto Rebirth (Normal)", function(state)
    autoRebirth = state
    while autoRebirth do
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthRemote"):InvokeServer("rebirthRequest")
        task.wait(0.1)
    end
end)

local autoSizeLoop = nil

local switch = Rebirth:AddSwitch("Auto Size 2", function(state)
    if state then
        autoSizeLoop = task.spawn(function()
            while task.wait(0) do
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 2)
            end
        end)
    else
        if autoSizeLoop then
            task.cancel(autoSizeLoop)
            autoSizeLoop = nil
        end
    end
end)

local switch = Rebirth:AddSwitch("Hide All Frames", function(state)
    local rSto = game:GetService("ReplicatedStorage")
		for _, obj in pairs(rSto:GetChildren()) do
			if obj.Name:match("Frame$") then
				obj.Visible = not state
			end
		end
end)

Rebirth:AddLabel("---Op Stuff---")

local switch = Rebirth:AddSwitch("Fast Rebirths", function(state)
    if state then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0o0o0o0o0o0o0o0o0o0o0o0o/0o0o0o0o/refs/heads/main/Kk"))()
    end
end)

local switch = Rebirth:AddSwitch("Speed Grind (No Rebirth)", function(Value)
    local isGrinding = Value

    if not Value then
        return
    end

    for i = 1, 12 do
        task.spawn(function()
            while isGrinding do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0.083)
            end
        end)
    end
end)

local Rock = Main:AddFolder("Rock Farm")

local selectrock = ""

local switch = Rock:AddSwitch("Auto Punch Jungle Rock (10M)", function(state)
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 10000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
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

local switch = Rock:AddSwitch("Auto Punch King Rock (5M)", function(state)
    selectrock = "Muscle King Gym Rock"
		getgenv().autoFarm = state
		while getgenv().autoFarm do
			task.wait()
			if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
				for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
					if v.Name == "neededDurability" and v.Value == 5000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
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

local switch = Rock:AddSwitch("Auto Punch Legend Rock (1M)", function(state)
    selectrock = "Legend Gym Rock"
		getgenv().autoFarm = state
		while getgenv().autoFarm do
			task.wait()
			if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
				for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
					if v.Name == "neededDurability" and v.Value == 1000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
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

local switch = Rock:AddSwitch("Auto Punch Inferno Rock (750K)", function(state)
    selectrock = "Eternal Gym Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 750000 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 750000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
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

local switch = Rock:AddSwitch("Auto Punch Mythical Rock (400K)", function(state)
    selectrock = "Mythical Gym Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 400000 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 400000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
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

local switch = Rock:AddSwitch("Auto Punch Frost Rock (150K)", function(state)
    selectrock = "Frost Gym Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 150000 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 150000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
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

local switch = Rock:AddSwitch("Auto Punch Tiny Rock (0)", function(state)
    selectrock = "Tiny Island Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 0 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 0 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
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

local Stats = window:AddTab("Stats")

local function abbreviateNumber(value)
    if value >= 1e15 then
        return string.format("%.1fQa", value / 1e15)
    elseif value >= 1e12 then
        return string.format("%.1fT", value / 1e12)
    elseif value >= 1e9 then
        return string.format("%.1fB", value / 1e9)
    elseif value >= 1e6 then
        return string.format("%.1fM", value / 1e6)
    elseif value >= 1e3 then
        return string.format("%.1fK", value / 1e3)
    else
        return tostring(value)
    end
end

local labels = {
    TimeSpentLabel = Stats:AddLabel("Time spent in this server: 00:00"),
    StrengthGainedLabel = Stats:AddLabel("Amount of strength gained in this server: 0"),
    DurabilityGainedLabel = Stats:AddLabel("Amount of durability gained in this server: 0"),
    AgilityGainedLabel = Stats:AddLabel("Amount of agility gained in this server: 0"),
    KillsGainedLabel = Stats:AddLabel("Amount of kills gained in this server: 0"),
    EvilKarmaGainedLabel = Stats:AddLabel("Amount of Evil Karma gained in this server: 0"),
    GoodKarmaGainedLabel = Stats:AddLabel("Amount of Good Karma gained in this server: 0")
}

local function createMyLabels()
    local player = game.Players.LocalPlayer
    if not player then return end

    local leaderstats = player:WaitForChild("leaderstats")
    if not leaderstats then return end

    local strengthStat = leaderstats:WaitForChild("Strength")
    local durabilityStat = player:WaitForChild("Durability")
    local agilityStat = player:WaitForChild("Agility")
    local killsStat = leaderstats:WaitForChild("Kills")
    local evilKarmaStat = player:WaitForChild("evilKarma")
    local goodKarmaStat = player:WaitForChild("goodKarma")

    local initialStrength = strengthStat.Value or 0
    local initialDurability = durabilityStat.Value or 0
    local initialAgility = agilityStat.Value or 0
    local initialKills = killsStat.Value or 0
    local initialEvilKarma = evilKarmaStat.Value or 0
    local initialGoodKarma = goodKarmaStat.Value or 0

    local startTime = tick()

    local function updateLabels()
        local strengthGained = strengthStat.Value - initialStrength
        local durabilityGained = durabilityStat.Value - initialDurability
        local agilityGained = agilityStat.Value - initialAgility
        local killsGained = killsStat.Value - initialKills
        local evilKarmaGained = evilKarmaStat.Value - initialEvilKarma
        local goodKarmaGained = goodKarmaStat.Value - initialGoodKarma

        labels.StrengthGainedLabel.Text = "Amount of strength gained in this server: " .. abbreviateNumber(strengthGained)
        labels.DurabilityGainedLabel.Text = "Amount of durability gained in this server: " .. abbreviateNumber(durabilityGained)
        labels.AgilityGainedLabel.Text = "Amount of agility gained in this server: " .. abbreviateNumber(agilityGained)
        labels.KillsGainedLabel.Text = "Amount of kills gained in this server: " .. abbreviateNumber(killsGained)
        labels.EvilKarmaGainedLabel.Text = "Amount of Evil Karma gained in this server: " .. abbreviateNumber(evilKarmaGained)
        labels.GoodKarmaGainedLabel.Text = "Amount of Good Karma gained in this server: " .. abbreviateNumber(goodKarmaGained)
    end

    local function updateTimeSpent()
        local timeSpent = tick() - startTime
        local minutes = math.floor(timeSpent / 60)
        local seconds = math.floor(timeSpent % 60)
        labels.TimeSpentLabel.Text = string.format("Time spent in this server: %02d:%02d", minutes, seconds)
    end

    strengthStat.Changed:Connect(updateLabels)
    durabilityStat.Changed:Connect(updateLabels)
    agilityStat.Changed:Connect(updateLabels)
    killsStat.Changed:Connect(updateLabels)
    evilKarmaStat.Changed:Connect(updateLabels)
    goodKarmaStat.Changed:Connect(updateLabels)

    game:GetService("RunService").Heartbeat:Connect(updateTimeSpent)

    updateLabels()
end

createMyLabels()

local Player = window:AddTab("Player")

-- WalkSpeed Textbox & Toggle
local walkSpeedValue = 16 -- Default speed
Player:AddTextBox("WalkSpeed", function(text)
    local speed = tonumber(text)
    if speed and speed >= 1 and speed <= 500 then
        walkSpeedValue = speed
    end
end)

local setSpeed = false
Player:AddSwitch("Set Speed", function(state)
    setSpeed = state
    while setSpeed do
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeedValue
        task.wait(0.1)
    end
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 -- Reset to default
end)

-- JumpPower Textbox & Toggle
local jumpPowerValue = 50 -- Default JumpPower
Player:AddTextBox("JumpPower", function(text)
    local jump = tonumber(text)
    if jump then
        jumpPowerValue = jump
    end
end)

local applyJumpPower = false
Player:AddSwitch("Apply JumpPower", function(state)
    applyJumpPower = state
    game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true

    if applyJumpPower then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPowerValue
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50 -- Reset
    end
end)

-- Avatar Size Textbox & Toggle
local sizeValue = 1 -- Default size (normal)
Player:AddTextBox("Size", function(text)
    local size = tonumber(text)
    if size and size >= 1 and size <= 100 then
        sizeValue = size
    end
end)

local setSize = false
Player:AddSwitch("Set Sizes", function(state)
    setSize = state
    local char = game.Players.LocalPlayer.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if state then
                humanoid.BodyDepthScale.Value = sizeValue
                humanoid.BodyHeightScale.Value = sizeValue
                humanoid.BodyWidthScale.Value = sizeValue
                humanoid.HeadScale.Value = sizeValue
            else
                humanoid.BodyDepthScale.Value = 1
                humanoid.BodyHeightScale.Value = 1
                humanoid.BodyWidthScale.Value = 1
                humanoid.HeadScale.Value = 1
            end
        end
    end
end)

Player:AddLabel("-------------")

local switch = Player:AddSwitch("Lock Position", function(Value)
    if Value then
        -- Lock Position
        local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
            end
        end)
    else
        -- Unlock Position
        if getgenv().posLock then
            getgenv().posLock:Disconnect()
            getgenv().posLock = nil
        end
    end
end)

local Killing = window:AddTab("Killing")

-- Auto Punch [No Animation] Toggle
local autoPunchNoAnim = false
Killing:AddSwitch("Auto Punch", function(state)
    autoPunchNoAnim = state

    while autoPunchNoAnim do
        local player = game.Players.LocalPlayer
        local playerName = player.Name
        local punchTool =
            player.Backpack:FindFirstChild("Punch") or
            game.Workspace:FindFirstChild(playerName):FindFirstChild("Punch")

        if punchTool then
            if punchTool.Parent ~= game.Workspace:FindFirstChild(playerName) then
                punchTool.Parent = game.Workspace:FindFirstChild(playerName) -- Equip the tool
            end

            -- Fire the punch event for both hands
            player.muscleEvent:FireServer("punch", "rightHand")
            player.muscleEvent:FireServer("punch", "leftHand")
        else
            warn("Punch tool not found")
            autoPunchNoAnim = false -- Stop loop if tool is missing
        end

        wait() -- Adjust delay if needed
    end
end)

Killing:AddButton("Speed Punch", function()
    local player = game.Players.LocalPlayer
    local punch = player.Backpack:FindFirstChild("Punch")
    local character = game.Workspace:FindFirstChild(player.Name)
    local punch1

    if character then
        punch1 = character:FindFirstChild("Punch")
    end

    local attackTime = 0 -- Fast punch time

    if punch and punch:FindFirstChild("attackTime") then
        punch.attackTime.Value = attackTime
    elseif punch1 and punch1:FindFirstChild("attackTime") then
        punch1.attackTime.Value = attackTime
    end
end)

Killing:AddButton("Normal Punch", function()
    local player = game.Players.LocalPlayer
    local punch = player.Backpack:FindFirstChild("Punch")
    local character = game.Workspace:FindFirstChild(player.Name)
    local punch1

    if character then
        punch1 = character:FindFirstChild("Punch")
    end

    local attackTime = 0.35 -- Default punch time

    if punch and punch:FindFirstChild("attackTime") then
        punch.attackTime.Value = attackTime
    elseif punch1 and punch1:FindFirstChild("attackTime") then
        punch1.attackTime.Value = attackTime
    end
end)

local whitelist = {} -- Table to store whitelisted players

-- Create the Whitelist Textbox
Killing:AddTextBox("Whitelist Player", function(text)
    local targetPlayer = game.Players:FindFirstChild(text)
    if targetPlayer then
        whitelist[targetPlayer.Name] = true
    end
end)

-- Auto Kill Toggle
local autoKill = false
Killing:AddSwitch("Auto Kill", function(bool)
    autoKill = bool -- Control variable

    while autoKill do
        local player = game.Players.LocalPlayer

        for _, target in ipairs(game.Players:GetPlayers()) do
            if target ~= player and not whitelist[target.Name] then -- Exclude whitelisted players and the local player
                local targetChar = target.Character
                local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

                if rootPart then
                    local rightHand = player.Character and player.Character:FindFirstChild("RightHand")
                    local leftHand = player.Character and player.Character:FindFirstChild("LeftHand")

                    if rightHand and leftHand then
                        firetouchinterest(rightHand, rootPart, 1) -- Start touch event
                        firetouchinterest(leftHand, rootPart, 1)
                        firetouchinterest(rightHand, rootPart, 0) -- End touch event
                        firetouchinterest(leftHand, rootPart, 0)
                    end
                end
            end
        end

        wait(0.1) -- Adjust the delay for optimized performance
    end
end)

local targetPlayerName = nil -- Variable to store the target player name

-- Create the Target Name Textbox
Killing:AddTextBox("Player Username", function(text)
    targetPlayerName = text
end)

-- Kill Target Toggle
local killTarget = false
Killing:AddSwitch("Auto Kill Player", function(bool)
    killTarget = bool -- Control variable

    while killTarget do
        local player = game.Players.LocalPlayer
        local target = game.Players:FindFirstChild(targetPlayerName)

        if target and target ~= player then
            local targetChar = target.Character
            local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

            if rootPart then
                local rightHand = player.Character and player.Character:FindFirstChild("RightHand")
                local leftHand = player.Character and player.Character:FindFirstChild("LeftHand")

                if rightHand and leftHand then
                    firetouchinterest(rightHand, rootPart, 1) -- Start touch event
                    firetouchinterest(leftHand, rootPart, 1)
                    firetouchinterest(rightHand, rootPart, 0) -- End touch event
                    firetouchinterest(leftHand, rootPart, 0)
                end
            end
        end

        wait(0.1) -- Adjust the delay as needed
    end
end)

local switch = Killing:AddSwitch("View Player", function(Value)
end)

Killing:AddLabel("-------------")

Killing:AddTextBox("Ring Aura Size", function(text)
end)

Killing:AddTextBox("Whitelist Player", function(text)
end)

local switch = Killing:AddSwitch("Enable Ring Aura", function(Value)
end)

local TrackStats = window:AddTab("Track Stats")

local targetPlayer = nil

local textbox = TrackStats:AddTextBox("Player Username", function(text)
    local player = game.Players:FindFirstChild(text)
    if player then
        targetPlayer = player
    else
        targetPlayer = nil
        resetTargetStats()
    end
end)

local labels = {
    TargetStats = TrackStats:AddLabel("Target Stats:"),
    StrengthLabel = TrackStats:AddLabel("Strength: 0"),
    DurabilityLabel = TrackStats:AddLabel("Durability: 0"),
    AgilityLabel = TrackStats:AddLabel("Agility: 0"),
    RebirthsLabel = TrackStats:AddLabel("Rebirths: 0"),
    KillsLabel = TrackStats:AddLabel("Kills: 0"),
    EvilKarmaLabel = TrackStats:AddLabel("Evil Karma: 0"),
    GoodKarmaLabel = TrackStats:AddLabel("Good Karma: 0"),
    EquippedPetsLabel = TrackStats:AddLabel("Equipped Pets:"),
}

-- Create pet labels
for i = 1, 8 do
    labels["Pet" .. i .. "Label"] = TrackStats:AddLabel("Pet" .. i .. ": No pet Equipped")
end

local function updateTargetStats()
    if not targetPlayer then return end

    local leaderstats = targetPlayer:FindFirstChild("leaderstats")
    local goodKarma = targetPlayer:FindFirstChild("goodKarma")
    local evilKarma = targetPlayer:FindFirstChild("evilKarma")

    if leaderstats then
        labels.StrengthLabel.Text = "Strength: " .. abbreviateNumber(leaderstats:FindFirstChild("Strength") and leaderstats.Strength.Value or 0)
        labels.DurabilityLabel.Text = "Durability: " .. abbreviateNumber(targetPlayer:FindFirstChild("Durability") and targetPlayer.Durability.Value or 0)
        labels.AgilityLabel.Text = "Agility: " .. abbreviateNumber(targetPlayer:FindFirstChild("Agility") and targetPlayer.Agility.Value or 0)
        labels.RebirthsLabel.Text = "Rebirths: " .. abbreviateNumber(leaderstats:FindFirstChild("Rebirths") and leaderstats.Rebirths.Value or 0)
        labels.KillsLabel.Text = "Kills: " .. abbreviateNumber(leaderstats:FindFirstChild("Kills") and leaderstats.Kills.Value or 0)
    end

    labels.EvilKarmaLabel.Text = "Evil Karma: " .. abbreviateNumber(evilKarma and evilKarma.Value or 0)
    labels.GoodKarmaLabel.Text = "Good Karma: " .. abbreviateNumber(goodKarma and goodKarma.Value or 0)

    -- Update pet labels properly (reading the pet name from IntValue instances)
    for i = 1, 8 do
        local petValue = targetPlayer:FindFirstChild("pet" .. i)
        if petValue and petValue:IsA("IntValue") and petValue.Value ~= "" then
            labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": " .. petValue.Value
        else
            labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": No pet Equipped"
        end
    end
end

local function resetTargetStats()
    labels.StrengthLabel.Text = "Strength: 0"
    labels.DurabilityLabel.Text = "Durability: 0"
    labels.AgilityLabel.Text = "Agility: 0"
    labels.RebirthsLabel.Text = "Rebirths: 0"
    labels.KillsLabel.Text = "Kills: 0"
    labels.EvilKarmaLabel.Text = "Evil Karma: 0"
    labels.GoodKarmaLabel.Text = "Good Karma: 0"

    for i = 1, 8 do
        labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": No pet Equipped"
    end
end

task.spawn(function()
    while task.wait(0.1) do
        if targetPlayer then
            updateTargetStats()
        end
    end
end)

local Teleport = window:AddTab("Teleport")

Teleport:AddButton("Tiny Island", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.8626194, 6.0588026, 2087.88672, -0.999396682, -9.72631931e-09, 0.034730725, -6.63278898e-09, 1, 8.91870684e-08, -0.034730725, 8.8902901e-08, -0.999396682)
end)

Teleport:AddButton("Starter Island", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(226.252472, 8.1526947, 219.366516, -0.00880406145, 3.58277887e-08, -0.999961257, -4.41204939e-08, 1, 3.62176351e-08, 0.999961257, 4.44376482e-08, -0.00880406145)
end)

Teleport:AddButton("Beach", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-365.798309, 44.5082932, -501.618591, 0.00878552441, -6.19950713e-09, 0.999961436, -4.37451603e-10, 1, 6.20358964e-09, -0.999961436, -4.91936492e-10, 0.00878552441)
end)

Teleport:AddButton("Frost Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2933.47998, 29.6399612, -579.946045, 0.0345239155, -1.03010173e-07, 0.999403894, 1.03015294e-08, 1, 1.02715752e-07, -0.999403894, 6.74923806e-09, 0.0345239155)
end)

Teleport:AddButton("Mythical Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2659.50635, 21.6095238, 934.690613, 0.999999881, 4.98906161e-08, 0.000502891606, -4.98585742e-08, 1, -6.37288338e-08, -0.000502891606, 6.37037516e-08, 0.999999881)
end)

Teleport:AddButton("Eternal Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7176.19141, 45.394104, -1106.31421, 0.971191287, -2.38377185e-09, 0.238301158, 1.41694778e-09, 1, 4.22844915e-09, -0.238301158, -3.76897269e-09, 0.971191287)
end)

Teleport:AddButton("Legend Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4446.91699, 1004.46698, -3983.76074, -0.999961317, -1.97616366e-08, 0.00879266672, -1.93830077e-08, 1, 4.31365149e-08, -0.00879266672, 4.29661292e-08, -0.999961317)
end)

Teleport:AddButton("Muscle King", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8626, 15, -5730)
end)

Teleport:AddButton("Jungle Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8137, 28, 2820)
end)

local Credits = window:AddTab("Design")

Credits:AddLabel("Paid Version")
Credits:AddLabel("Script Made By Myers")
Credits:AddLabel("Discord: producertag7seix7.")
end

local gui = Instance.new("ScreenGui")
gui.Name = "EnchantedKeySystem"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Name = "MainFrame"
main.Size = UDim2.new(0, 350, 0, 230)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = DARK_GLASS
main.BackgroundTransparency = 0.15 
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 14)

local stroke = Instance.new("UIStroke", main)
stroke.Thickness = 1.5
stroke.Color = RED_ACCENT
stroke.Transparency = 0.6
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 60)
title.BackgroundTransparency = 1
title.TextColor3 = TEXT_COLOR
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Text = "ENCHANTED HUB"
title.Parent = main

local line = Instance.new("Frame", main)
line.Size = UDim2.new(0.3, 0, 0, 2)
line.Position = UDim2.new(0.35, 0, 0, 50)
line.BackgroundColor3 = RED_ACCENT
line.BorderSizePixel = 0

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.85, 0, 0, 42)
keyBox.Position = UDim2.new(0.5, 0, 0.45, 0)
keyBox.AnchorPoint = Vector2.new(0.5, 0.5)
keyBox.BackgroundColor3 = FIELD_BG
keyBox.BackgroundTransparency = 0.3
keyBox.TextColor3 = TEXT_COLOR
keyBox.PlaceholderText = "Enter Activation Key..."
keyBox.PlaceholderColor3 = Color3.fromRGB(90, 90, 90)
keyBox.Text = ""
keyBox.Font = Enum.Font.Gotham
keyBox.TextSize = 14
keyBox.Parent = main

local kbCorner = Instance.new("UICorner", keyBox)
kbCorner.CornerRadius = UDim.new(0, 8)

local kbStroke = Instance.new("UIStroke", keyBox)
kbStroke.Thickness = 1
kbStroke.Color = Color3.fromRGB(255, 255, 255)
kbStroke.Transparency = 0.9

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Size = UDim2.new(0.41, 0, 0, 38)
getKeyBtn.Position = UDim2.new(0.075, 0, 0.68, 0)
getKeyBtn.BackgroundColor3 = FIELD_BG
getKeyBtn.BackgroundTransparency = 0.2
getKeyBtn.TextColor3 = SUBTITLE_COLOR
getKeyBtn.Font = Enum.Font.GothamMedium
getKeyBtn.TextSize = 13
getKeyBtn.Text = "GET KEY"
getKeyBtn.Parent = main
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0, 8)

local verifyBtn = Instance.new("TextButton")
verifyBtn.Size = UDim2.new(0.41, 0, 0, 38)
verifyBtn.Position = UDim2.new(0.515, 0, 0.68, 0)
verifyBtn.BackgroundColor3 = RED_ACCENT
verifyBtn.TextColor3 = TEXT_COLOR
verifyBtn.Font = Enum.Font.GothamBold
verifyBtn.TextSize = 13
verifyBtn.Text = "VERIFY"
verifyBtn.Parent = main
Instance.new("UICorner", verifyBtn).CornerRadius = UDim.new(0, 8)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, 0, 0, 30)
status.Position = UDim2.new(0, 0, 0.88, 0)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(120, 120, 120)
status.Font = Enum.Font.Gotham
status.TextSize = 11
status.Text = "System: Awaiting Input"
status.Parent = main

getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/tRMqCFqsz3")
    status.Text = "Link copied to clipboard!"
    task.wait(2)
    status.Text = "System: Awaiting Input"
end)

verifyBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        status.Text = "Authentication Successful"
        status.TextColor3 = Color3.fromRGB(50, 255, 150)
        TweenService:Create(stroke, TweenInfo.new(0.5), {Color = Color3.fromRGB(50, 255, 150)}):Play()
        task.wait(1)
        gui:Destroy()
        ExecuteHub()
    else
        status.Text = "Invalid Key"
        status.TextColor3 = RED_ACCENT
        keyBox.Text = ""
        task.wait(2)
        status.Text = "System: Awaiting Input"
        status.TextColor3 = Color3.fromRGB(120, 120, 120)
    end
end)
