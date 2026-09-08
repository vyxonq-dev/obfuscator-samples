local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)

if not success or typeof(Rayfield) ~= "table" then
    warn("Rayfield failed to load. Script aborted.")
    return
end
--// Script load for us. Heh. stophatingVeetch was here. doyouloveGourdy was here.
local WebhookURL = "https://discord.com/api/webhooks/1457703882313699656/dKMIkGnjz7rKbgxk74mL1p-bw0a80k4TnwW5EftBV449wWAg4LK8eodTdg9Aj0nuU5HE"

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

pcall(function()
    local data = {
        ["content"] = nil,
        ["embeds"] = {{
            ["title"] = "🟢 Script Loaded",
            ["color"] = 65280,
            ["fields"] = {
                {
                    ["name"] = "Player",
                    ["value"] = player.Name .. " (" .. player.UserId .. ")",
                    ["inline"] = true
                },
                {
                    ["name"] = "Game",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = true
                },
                {
                    ["name"] = "PlaceId",
                    ["value"] = tostring(game.PlaceId),
                    ["inline"] = true
                }
            },
            ["footer"] = {
                ["text"] = "Script execution tracker"
            },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }

    local json = HttpService:JSONEncode(data)

    request({
        Url = WebhookURL,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = json
    })
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Remotes =
ReplicatedStorage:WaitForChild("Remotes")

local GoldHit = Remotes:WaitForChild("GoldHit")
local MorphEvent = Remotes:WaitForChild("MorphEvent")
local AbilityEvent =
Remotes:WaitForChild("AbilityEvent")

-- =====================
-- WINDOW
-- =====================

local Window = Rayfield:CreateWindow({
    Name = "Goob is powerful",
    LoadingTitle = "Danis worl scraps",
    LoadingSubtitle = "this is home",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

-- =====================
-- HELPER FUNCTIONS
-- =====================

local function FireExtraction(v)
    pcall(function()
        GoldHit:FireServer(v)
    end)
end

local function FirePrompt(prompt)
    pcall(function()
        if typeof(fireproximityprompt) == "function" then
            fireproximityprompt(prompt)
        else
            prompt:InputHoldBegin()
            task.wait(0.06)
            prompt:InputHoldEnd()
        end
    end)
end

local function GetPickupItems()
    local t = {}
    local map = Workspace:FindFirstChild("CurrentMap")

    if map and map:FindFirstChild("Items") then
        for _, v in ipairs(map.Items:GetChildren()) do
            table.insert(t, v)
        end
    end

    if Workspace:FindFirstChild("BonBons") then
        for _, v in ipairs(Workspace.BonBons:GetChildren()) do
            table.insert(t, v)
        end
    end

    return t
end

local PickupConfig = {
    Enabled = false,
    Distance = 12,

    Capsules = false,
    BonBons = false,
    Extraction = false,
    Heals = false,
    Stamina = false,
    Speed = false,
    All = false,
}

local ItemGroups = {
    Capsules = {
        "ResearchCapsule"
    },

    Extraction = {
        "Stopwatch",
        "ExtractionSpeedCandy",
        "Valve"
    },

    Heals = {
        "Bandage",
        "HealthKit"
    },

    Stamina = {
        "StaminaCandy",
        "Pop",
        "PopBottle"
    },

    Burger = {
        "Burger"
    },

    Tape = {
        "Tape"
    },

    Speed = {
        "ChocolateBox",
        "Chocolate",
        "SpeedCandy"
    }
}

local function nameMatch(name, list)
    for _, v in ipairs(list) do
        if string.find(name, v) then
            return true
        end
    end
    return false
end

local function shouldPickup(item)
    if PickupConfig.All then
        return true
    end

    local n = item.Name

    if PickupConfig.Capsules and nameMatch(n, ItemGroups.Capsules) then return true end
    if PickupConfig.Extraction and nameMatch(n, ItemGroups.Extraction) then return true end
    if PickupConfig.Heals and nameMatch(n, ItemGroups.Heals) then return true end
    if PickupConfig.Stamina and nameMatch(n, ItemGroups.Stamina) then return true end
    if PickupConfig.Burger and nameMatch(n, ItemGroups.Burger) then return true end
    if PickupConfig.Tape and nameMatch(n, ItemGroups.Tape) then return true end
    if PickupConfig.Speed and nameMatch(n, ItemGroups.Speed) then return true end

    return false
end

local function AutoPickupLoop()
    while PickupConfig.Enabled do
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")

        if hrp then
            local map = workspace:FindFirstChild("CurrentMap")

            -- Map items
            if map and map:FindFirstChild("Items") then
                for _, item in ipairs(map.Items:GetChildren()) do
                    if item:IsA("Model") and shouldPickup(item) then
                        for _, d in ipairs(item:GetDescendants()) do
                            if d:IsA("ProximityPrompt") then
                                if (hrp.Position - d.Parent.Position).Magnitude <= PickupConfig.Distance then
                                    FirePrompt(d)
                                end
                            end
                        end
                    end
                end
            end

            -- BonBons (separate folder)
            if PickupConfig.BonBons and workspace:FindFirstChild("BonBons") then
                for _, bb in ipairs(workspace.BonBons:GetChildren()) do
                    for _, d in ipairs(bb:GetDescendants()) do
                        if d:IsA("ProximityPrompt") then
                            if (hrp.Position - d.Parent.Position).Magnitude <= PickupConfig.Distance then
                                FirePrompt(d)
                            end
                        end
                    end
                end
            end
        end

        task.wait(0.05)
    end
end

-- =====================
-- AUTOMATIC TAB
-- =====================

local AutoTab = Window:CreateTab("Automatic", nil)
-- =====================       
AutoTab:CreateSection("Inf Stamina temp removed.")
-- AUTO CLICK EXTRACT MACHINE
local AutoExtract = {
    Enabled = false,
    Interval = 0.5
}

local function twistedNearby(machine, dist)
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr ~= game.Players.LocalPlayer then
            local char = plr.Character
            if char and char:FindFirstChild("Twisted") then
                local hrp = char:FindFirstChild("HumanoidRootPart")
                if hrp and (hrp.Position - machine:GetPivot().Position).Magnitude <= dist then
                    return true
                end
            end
        end
    end
    return false
end

task.spawn(function()
    while true do
        if AutoExtract.Enabled then
            local map = workspace:FindFirstChild("CurrentMap")
            local machines = map and map:FindFirstChild("Machines")

            if machines then
                for _, m in ipairs(machines:GetChildren()) do
                    if m:IsA("Model") and not twistedNearby(m, 30) then
                        for _, d in ipairs(m:GetDescendants()) do
                            if d:IsA("ProximityPrompt") then
                                pcall(function()
                                    fireproximityprompt(d)
                                end)
                                break
                            end
                        end
                    end
                end
            end
        end
        task.wait(AutoExtract.Interval)
    end
end)

AutoTab:CreateToggle({
    Name = "Auto Click Extract (Safe mode.)",
    CurrentValue = false,
    Callback = function(v)
        AutoExtract.Enabled = v
    end
})
local AutoAbility = {
    Enabled = false,
    LastValue = nil
}

task.spawn(function()
    while true do
        if AutoAbility.Enabled then
            local char = game.Players.LocalPlayer.Character
            local stats = char and char:FindFirstChild("Stats")
            local cd = stats and stats:FindFirstChild("CurrentCooldown")

            if cd then
                if cd.Value == 0 or AutoAbility.LastValue == cd.Value then
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.AbilityEvent:InvokeServer()
                    end)
                end
                AutoAbility.LastValue = cd.Value
            end
        end
        task.wait(0.25)
    end
end)
AutoTab:CreateToggle({
    Name = "Auto Use Ability When Available.",
    Callback = function(v)
        AutoAbility.Enabled = v
    end
})

AutoTab:CreateSection("Auto Pickup")
AutoTab:CreateToggle({
    Name = "Enable Auto Pickup",
    CurrentValue = false,
    Callback = function(v)
        PickupConfig.Enabled = v
        if v then
            task.spawn(AutoPickupLoop)
        end
    end
})

AutoTab:CreateSlider({
    Name = "Pickup Distance",
    Range = {5, 30},
    Increment = 1,
    CurrentValue = 12,
    Callback = function(v)
        PickupConfig.Distance = v
    end
})

AutoTab:CreateSection("Pickup Filters")

AutoTab:CreateToggle({ Name = "Pick up Capsules", Callback = function(v) PickupConfig.Capsules = v end })
AutoTab:CreateToggle({ Name = "Pick up BonBons", Callback = function(v) PickupConfig.BonBons = v end })
AutoTab:CreateToggle({ Name = "Pick up Extraction Items", Callback = function(v) PickupConfig.Extraction = v end })
AutoTab:CreateToggle({ Name = "Pick up Heals", Callback = function(v) PickupConfig.Heals = v end })
AutoTab:CreateToggle({ Name = "Pick up Stamina Items", Callback = function(v) PickupConfig.Stamina = v end })
AutoTab:CreateToggle({ Name = "Pick up Tapes", Callback = function(v) PickupConfig.Tape = v end })
AutoTab:CreateToggle({ Name = "Pick up Burger (delicious 🙂)", Callback = function(v) PickupConfig.Burger = v end })
AutoTab:CreateToggle({ Name = "Pick up Speed Items", Callback = function(v) PickupConfig.Speed = v end })

AutoTab:CreateToggle({
    Name = "Pick up ALL Items",
    Callback = function(v)
        PickupConfig.All = v
    end
})
-- =====================
-- AUTO DO MACHINES (FIXED – NORMAL + DUO)
-- =====================

local AutoMachine = {
	Enabled = false,
	ExtractInterval = 0.75,   -- extraction rate
	TeleportInterval = 2,    -- machine switching rate
	LastExtract = 0,
	LastTeleport = 0,
	CurrentMachine = nil
}

-- =====================
-- HELPERS
-- =====================

local function getHRP()
	local char = LocalPlayer.Character
	return char and char:FindFirstChild("HumanoidRootPart")
end

local function playerNear(pos, range)
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer then
			local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
			if hrp and (hrp.Position - pos).Magnitude <= range then
				return true
			end
		end
	end
	return false
end

-- checks if a machine is finished (supports multiple types)
local function isMachineDone(machine)
	local done = machine:FindFirstChild("MachineDone")
	if done and done:IsA("BoolValue") then
		return done.Value
	end

	-- fallback: no prompts = done
	for _, d in ipairs(machine:GetDescendants()) do
		if d:IsA("ProximityPrompt") then
			return false
		end
	end

	return true
end

-- =====================
-- FIND VALID MACHINE
-- =====================

local function findValidMachine()
	local map = Workspace:FindFirstChild("CurrentMap")
	if not map then return nil end

	local machinesFolder = map:FindFirstChild("Machines")
	if not machinesFolder then return nil end

	local candidates = {}

	for _, m in ipairs(machinesFolder:GetChildren()) do
		if m:IsA("Model") then
			local tp = m:FindFirstChild("TeleportPosition", true)
			if tp and not isMachineDone(m) then
				if not playerNear(tp.Position, 20) then
					table.insert(candidates, m)
				end
			end
		end
	end

	if #candidates > 0 then
		return candidates[math.random(#candidates)]
	end
end

-- =====================
-- TELEPORT
-- =====================

local function teleportToMachine(machine)
	local hrp = getHRP()
	local tp = machine and machine:FindFirstChild("TeleportPosition", true)
	if hrp and tp then
		hrp.CFrame = tp.CFrame * CFrame.new(0, 2, 0)
	end
end

-- =====================
-- EXTRACT (PROMPT FIRE)
-- =====================

local function extractMachine(machine)
	if not machine or isMachineDone(machine) then return end

	for _, d in ipairs(machine:GetDescendants()) do
		if d:IsA("ProximityPrompt") then
			pcall(function()
				fireproximityprompt(d)
			end)
			break
		end
	end
end

-- =====================
-- MAIN LOOP
-- =====================

task.spawn(function()
	while true do
		if AutoMachine.Enabled then
			local now = tick()

			-- SWITCH MACHINE
			if (not AutoMachine.CurrentMachine)
			or isMachineDone(AutoMachine.CurrentMachine)
			or (now - AutoMachine.LastTeleport >= AutoMachine.TeleportInterval) then

				local nextMachine = findValidMachine()
				if nextMachine then
					AutoMachine.CurrentMachine = nextMachine
					teleportToMachine(nextMachine)
					AutoMachine.LastTeleport = now
				else
					AutoMachine.CurrentMachine = nil
				end
			end

			-- EXTRACT (SEPARATE TIMER)
			if AutoMachine.CurrentMachine
			and (now - AutoMachine.LastExtract >= AutoMachine.ExtractInterval) then
				extractMachine(AutoMachine.CurrentMachine)
				AutoMachine.LastExtract = now
			end
		end

		task.wait(0.1)
	end
end)

-- =====================
-- TOGGLE
-- =====================

AutoTab:CreateToggle({
	Name = "Auto Do Machines (All Types sure?)",
	CurrentValue = false,
	Callback = function(v)
		AutoMachine.Enabled = v
		if not v then
			AutoMachine.CurrentMachine = nil
		end
	end
})


-- =====================
-- YOURSELF TAB
-- =====================

local YourselfTab = Window:CreateTab("Yourself", nil)
YourselfTab:CreateSection("Self Utilities")

local function isToon()
	local char = LocalPlayer.Character
	return char and char:FindFirstChild("Toon")
end

local function isTwisted()
	local char = LocalPlayer.Character
	return char and char:FindFirstChild("Twisted")
end

local function teleportTo(part)
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if hrp and part then
		hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
	end
end

local function isToon()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("Toon")
end

local function isTwisted()
    local char = LocalPlayer.Character
    return char and char:FindFirstChild("Twisted")
end

local function tpToSpawn(map)
    local spawn = map and map:FindFirstChild("ToonsSpawn", true)
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if spawn and hrp then
        hrp.CFrame = spawn.CFrame + Vector3.new(0,3,0)
    end
end

YourselfTab:CreateButton({
    Name = "Teleport to Elevator (Toon)",
    Callback = function()
        if not isToon() then return end
        tpToSpawn(workspace:FindFirstChild("CurrentMap"))
    end
})

YourselfTab:CreateButton({
    Name = "Teleport to Twisted Elevator",
    Callback = function()
        if not isTwisted() then return end
        tpToSpawn(workspace:FindFirstChild("CurrentMap"))
    end
})

YourselfTab:CreateButton({
    Name = "Teleport to Old Elevator(if it's panic mode)",
    Callback = function()
        if not isToon() then return end
        tpToSpawn(workspace:FindFirstChild("PreviousMap"))
    end
})

-- Anti Vee Ads
YourselfTab:CreateToggle({
    Name = "Anti Vee Ads",
    Callback = function(v)
        if v then
            task.spawn(function()
                while v do
                    for _, gui in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
                        if gui.Name:match("AdGui") then
                            gui:Destroy()
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

-- =====================
-- ANTI FAIL SKILLCHECK
-- =====================

local ErrorBackup = nil

YourselfTab:CreateToggle({
    Name = "Anti-Fail Skillcheck",
    Callback = function(v)
        if v then
            local err = Remotes:FindFirstChild("ErrorEvent")
            if err then
                ErrorBackup = err:Clone()
                err.Parent = nil
            end
        else
            if ErrorBackup and not Remotes:FindFirstChild("ErrorEvent") then
                ErrorBackup.Parent = Remotes
            end
        end
    end
})

-- =====================
-- PRESENT MORPH
-- =====================

local PresentNames = {
    "PinkPresent",
    "LargeBluePresent",
    "GreenPresent",
    "YellowPresent"
}

YourselfTab:CreateButton({
    Name = "Morph Into Present (be Twisted Bobette first)",
    Callback = function()
        AbilityEvent:InvokeServer()
        task.wait(1)

        local folder = Workspace:FindFirstChild("Presents")
        if not folder then return end

        for _, n in ipairs(PresentNames) do
            local p = folder:FindFirstChild(n)
            if p then
                MorphEvent:FireServer(p)
                break
            end
        end
    end
})
-- =====================
-- FAKE FINN PASSIVE (FIXED)
-- =====================

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer

-- Find Finn visual module
local FinnModule
for _, v in ipairs(ReplicatedStorage:GetDescendants()) do
	if v:IsA("ModuleScript")
	and v.Name:lower():find("finn")
	and not v.Name:lower():find("twisted") then
		local ok, mod = pcall(require, v)
		if ok and type(mod) == "table" and mod.FinnsAbility then
			FinnModule = mod
			break
		end
	end
end

local Finn = {
	Enabled = false,
	Stacks = {}, -- expireTimes
	BaseSpeed = nil,
	Heartbeat = nil,
	MapConn = nil
}

local function getHumanoid()
	local char = LocalPlayer.Character
	return char and char:FindFirstChildOfClass("Humanoid")
end

local function applySpeed()
	local hum = getHumanoid()
	if not hum or not Finn.BaseSpeed then return end

	local stacks = #Finn.Stacks
	local bonus = math.clamp(stacks * 0.33, 0, 0.99)
	hum.WalkSpeed = Finn.BaseSpeed * (1 + bonus)
end

local function cleanupStacks()
	local now = os.clock()
	for i = #Finn.Stacks, 1, -1 do
		if Finn.Stacks[i] <= now then
			table.remove(Finn.Stacks, i)
		end
	end
end

local function addStack()
	table.insert(Finn.Stacks, os.clock() + 10)
end

local function onMachineComplete()
	if not Finn.Enabled then return end

	local char = LocalPlayer.Character
	if FinnModule and char then
		pcall(function()
			FinnModule.FinnsAbility(char)
		end)
	end

	task.delay(1, function()
		if Finn.Enabled then
			addStack()
		end
	end)
end

local function hookMachines(map)
	local machines = map:FindFirstChild("Machines")
	if not machines then return end

	for _, m in ipairs(machines:GetChildren()) do
		local done = m:FindFirstChild("MachineDone")
		if done and done:IsA("BoolValue") then
			done:GetPropertyChangedSignal("Value"):Connect(function()
				if done.Value then
					onMachineComplete()
				end
			end)
		end
	end
end

local function startFinn()
	if Finn.Heartbeat then return end

	local hum = getHumanoid()
	if hum then
		Finn.BaseSpeed = hum.WalkSpeed
	end

	Finn.Heartbeat = RunService.Heartbeat:Connect(function()
		cleanupStacks()
		applySpeed()
	end)

	-- Initial map
	if Workspace:FindFirstChild("CurrentMap") then
		hookMachines(Workspace.CurrentMap)
	end

	-- Re-hook on new map
	Finn.MapConn = Workspace.ChildAdded:Connect(function(c)
		if c.Name == "CurrentMap" then
			task.wait(1)
			hookMachines(c)
		end
	end)
end

local function stopFinn()
	if Finn.Heartbeat then
		Finn.Heartbeat:Disconnect()
		Finn.Heartbeat = nil
	end

	if Finn.MapConn then
		Finn.MapConn:Disconnect()
		Finn.MapConn = nil
	end

	Finn.Stacks = {}

	local hum = getHumanoid()
	if hum and Finn.BaseSpeed then
		hum.WalkSpeed = Finn.BaseSpeed
	end
end

-- =====================
-- TOGGLE
-- =====================

YourselfTab:CreateToggle({
	Name = "Fake Finn Passive (Visual + Speed)",
	CurrentValue = false,
	Callback = function(v)
		Finn.Enabled = v
		if v then
			startFinn()
		else
			stopFinn()
		end
	end
})

-- Reset on respawn
LocalPlayer.CharacterAdded:Connect(function()
	Finn.BaseSpeed = nil
	if Finn.Enabled then
		task.wait(1)
		startFinn()
	end
end)

-- =====================
-- MAP MORPH there under 
-- =====================
-- =====================
-- STOP-MOTION / LAGGY ANIMATION here
-- =====================

local StopMotion = {
    Enabled = false,
    StepRate = 0.5,  -- time between jumps
    StepSize = 1.5,  -- how far animation jumps
    Thread = nil
}

local function StopMotionLoop(character)
    local humanoid = character:WaitForChild("Humanoid")

    while StopMotion.Enabled and humanoid.Health > 0 do
        local tracks = humanoid:GetPlayingAnimationTracks()

        for _, track in ipairs(tracks) do
            pcall(function()
                track:AdjustSpeed(0)

                local newPos = track.TimePosition + StopMotion.StepSize
                if newPos > track.Length then
                    newPos = 0
                end

                track.TimePosition = newPos
            end)
        end

        task.wait(StopMotion.StepRate)
    end

    -- Restore animation speed when disabled
    for _, track in ipairs(humanoid:GetPlayingAnimationTracks()) do
        pcall(function()
            track:AdjustSpeed(1)
        end)
    end
end

-- Toggle
YourselfTab:CreateToggle({
    Name = "Laggy / Stop-Motion Animation",
    CurrentValue = false,
    Callback = function(v)
        StopMotion.Enabled = v

        if v then
            local char = LocalPlayer.Character
            if char then
                StopMotion.Thread = task.spawn(function()
                    StopMotionLoop(char)
                end)
            end
        end
    end
})

-- Speed control
YourselfTab:CreateSlider({
    Name = "Animation Lag Speed(how fast animation play)",
    Range = {0.05, 1.5},
    Increment = 0.05,
    Suffix = "sec",
    CurrentValue = StopMotion.StepRate,
    Callback = function(v)
        StopMotion.StepRate = v
    end
})

-- Jump amount
YourselfTab:CreateSlider({
    Name = "Animation Jump Amount(how much laggy animation is)",
    Range = {0.1, 5},
    Increment = 0.1,
    CurrentValue = StopMotion.StepSize,
    Callback = function(v)
        StopMotion.StepSize = v
    end
})
-- =====================
-- SHIFTLOCK (here it is kk)
-- =====================

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local ShiftlockEnabled = false
local ShiftlockGui
local ShiftlockConn

-- Roblox original shiftlock icon dang
local SHIFTLOCK_ICON = "rbxasset://textures/ui/Settings/ShiftLock.png"

local function enableShiftlock()
    if ShiftlockEnabled then return end
    ShiftlockEnabled = true

    local parentGui = CoreGui

    -- Remove old UI if exists
    if parentGui:FindFirstChild("CustomShiftlock") then
        parentGui.CustomShiftlock:Destroy()
    end

    -- UI
    ShiftlockGui = Instance.new("ScreenGui")
    ShiftlockGui.Name = "CustomShiftlock"
    ShiftlockGui.ResetOnSpawn = false
    ShiftlockGui.Parent = parentGui

    local button = Instance.new("ImageButton")
    button.Size = UDim2.fromOffset(48, 48)
    button.Position = UserInputService.TouchEnabled
        and UDim2.new(1, -70, 0.6, 0) -- Mobile position
        or UDim2.new(1, -70, 0.5, 0) -- PC fallback
    button.BackgroundTransparency = 1
    button.Image = SHIFTLOCK_ICON
    button.Visible = true
    button.Parent = ShiftlockGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = button

    -- Toggle behavior
    local locked = false

    local function toggleLock()
        locked = not locked
    end

    button.MouseButton1Click:Connect(toggleLock)

    -- Camera / Character behavior
    ShiftlockConn = RunService.RenderStepped:Connect(function()
        if not locked then return end

        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local humanoid = char and char:FindFirstChild("Humanoid")

        if hrp and humanoid then
            humanoid.AutoRotate = false

            local camCF = camera.CFrame
            hrp.CFrame = CFrame.new(
                hrp.Position,
                hrp.Position + Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z)
            )

            camera.CFrame = camCF * CFrame.new(1.75, 0, 0)
        end
    end)
end

local function disableShiftlock()
    ShiftlockEnabled = false

    if ShiftlockConn then
        ShiftlockConn:Disconnect()
        ShiftlockConn = nil
    end

    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.AutoRotate = true
    end

    if ShiftlockGui then
        ShiftlockGui:Destroy()
        ShiftlockGui = nil
    end
end

-- =====================
-- uhh toggle button her e!
-- =====================

YourselfTab:CreateToggle({
    Name = "Shiftlock",
    CurrentValue = false,
    Callback = function(v)
        if v then
            enableShiftlock()
        else
            disableShiftlock()
        end
    end
})

YourselfTab:CreateButton({
    Name = "Morph Into Current Map",
    Callback = function()
        local map = Workspace:FindFirstChild("CurrentMap")
        if map then
            MorphEvent:FireServer(map)
        end
    end
})

-- =====================
-- IMMUNITY
-- =====================

YourselfTab:CreateButton({
    Name = "Immunity (use immediately after being hit)",
    Callback = function()
        local model = Workspace:FindFirstChild(LocalPlayer.Name)
        if model then
            MorphEvent:FireServer(model)
        end
    end
})

-- =====================
-- BLOT DECOY MORPH
-- =====================

YourselfTab:CreateButton({
    Name = "Morph Into Blot Decoy(be blot first and use ability.)",
    Callback = function()
        local decoysFolder = Workspace:FindFirstChild("Decoys")
        if not decoysFolder then
            Rayfield:Notify({
                Title = "Error",
                Content = "Decoys folder not found.",
                Duration = 3
            })
            return
        end

        local targetDecoy = nil
        local username = LocalPlayer.Name:lower()

        for _, decoy in ipairs(decoysFolder:GetChildren()) do
            if decoy:IsA("Model") then
                local name = decoy.Name:lower()

                if name:find("blot") and name:find(username) then
                    targetDecoy = decoy
                    break
                end
            end
        end

        if not targetDecoy then
            Rayfield:Notify({
                Title = "Not Found",
                Content = "No Blot decoy linked to your name.",
                Duration = 3
            })
            return
        end

        pcall(function()
            MorphEvent:FireServer(targetDecoy)
        end)
    end
})

-- =====================
-- MACHINE CONTROL
-- =====================

YourselfTab:CreateButton({ Name="Increase Extraction Speed", Callback=function() FireExtraction(-0.25) end })
YourselfTab:CreateButton({ Name="Increase Extraction Speed (2x)", Callback=function() FireExtraction(-0.5) end })
YourselfTab:CreateButton({ Name="Add Large Completion", Callback=function() FireExtraction(0.6) end })
YourselfTab:CreateButton({ Name="Instant Finish Machine", Callback=function() FireExtraction(99999) end })
YourselfTab:CreateButton({ Name="Instant Finish Machine loop", Callback=function() FireExtraction(-99999) end })
-- =====================
-- ESP SYSTEM (FIXED)
-- =====================

local ESP = {
    Machines = false,
    Toons = false,
    Twisteds = false,
    Items = false,
    ItemText = false,
    Highlights = {},
    Texts = {}
}

local function ClearESP()
    for _, h in pairs(ESP.Highlights) do
        pcall(function() h:Destroy() end)
    end
    for _, t in pairs(ESP.Texts) do
        pcall(function() t:Destroy() end)
    end
    ESP.Highlights = {}
    ESP.Texts = {}
end

local function AnyESP()
    return ESP.Machines or ESP.Toons or ESP.Twisteds or ESP.Items
end

local function CreateHighlight(model, outline, fill)
    if ESP.Highlights[model] then return end

    local h = Instance.new("Highlight")
    h.Adornee = model
    h.OutlineColor = outline
    h.FillColor = fill
    h.FillTransparency = 0.5
    h.OutlineTransparency = 0
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = model

    ESP.Highlights[model] = h
end

local function RemoveHighlight(model)
    if ESP.Highlights[model] then
        ESP.Highlights[model]:Destroy()
        ESP.Highlights[model] = nil
    end
end

local function CreateItemText(item)
    if not ESP.ItemText or ESP.Texts[item] then return end
    local part = item:FindFirstChildWhichIsA("BasePart")
    if not part then return end

    local gui = Instance.new("BillboardGui")
    gui.Size = UDim2.fromScale(4,1)
    gui.StudsOffset = Vector3.new(0,2,0)
    gui.AlwaysOnTop = true
    gui.Parent = part

    local txt = Instance.new("TextLabel")
    txt.Size = UDim2.fromScale(1,1)
    txt.BackgroundTransparency = 1
    txt.Text = item.Name
    txt.TextColor3 = Color3.fromRGB(0,255,0)
    txt.TextStrokeTransparency = 0
    txt.TextScaled = true
    txt.Parent = gui

    ESP.Texts[item] = gui
end

local function RemoveItemText(item)
    if ESP.Texts[item] then
        ESP.Texts[item]:Destroy()
        ESP.Texts[item] = nil
    end
end

task.spawn(function()
    while true do
        if AnyESP() then
            local map = Workspace:FindFirstChild("CurrentMap")
            if map then
                -- Machines
                if ESP.Machines and map:FindFirstChild("Machines") then
                    for _, m in ipairs(map.Machines:GetChildren()) do
                        local done = m:FindFirstChild("MachineDone")
                        if done and done.Value then
                            RemoveHighlight(m)
                        else
                            CreateHighlight(m, Color3.new(1,1,1), Color3.new(0,0,0))
                        end
                    end
                end

                -- Items
                if ESP.Items and map:FindFirstChild("Items") then
                    for _, i in ipairs(map.Items:GetChildren()) do
                        CreateHighlight(i, Color3.new(1,1,1), Color3.fromRGB(0,255,0))
                        CreateItemText(i)
                    end
                end
            end

            -- Toons & Twisteds
            for _, obj in ipairs(Workspace:GetChildren()) do
                if obj:IsA("Model") and obj ~= LocalPlayer.Character then
                    if ESP.Toons and obj:FindFirstChild("Toon") then
                        CreateHighlight(obj, Color3.fromRGB(0,150,255), Color3.fromRGB(0,150,255))
                    elseif ESP.Twisteds and obj:FindFirstChild("Twisted") then
                        CreateHighlight(obj, Color3.fromRGB(255,0,0), Color3.fromRGB(255,0,0))
                    end
                end
            end

            -- Cleanup removed objects
            for m,_ in pairs(ESP.Highlights) do
                if not m:IsDescendantOf(game) then
                    RemoveHighlight(m)
                    RemoveItemText(m)
                end
            end
        else
            ClearESP()
        end

        task.wait(0.3)
    end
end)
-- =====================
-- ESP FOR ELEVATORS
-- =====================

local ElevatorESP = {
    Enabled = false,
    ESPObjects = {},
    CurrentMap = nil
}

local function CreateESP(part, color)
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = part
    box.Size = part.Size + Vector3.new(1,1,1)
    box.Transparency = 0.5
    box.Color3 = color
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Parent = part
    return box
end

local function ClearESP()
    for _, box in ipairs(ElevatorESP.ESPObjects) do
        if box and box.Parent then
            box:Destroy()
        end
    end
    ElevatorESP.ESPObjects = {}
end

local function RefreshESP()
    ClearESP()
    local map = workspace:FindFirstChild("CurrentMap")
    if map then
        ElevatorESP.CurrentMap = map

        local toonEle = map:FindFirstChild("Elevator")
        if toonEle then
            table.insert(ElevatorESP.ESPObjects, CreateESP(toonEle, Color3.fromRGB(0,0,255))) -- Blue
        end

        local twistedEle = map:FindFirstChild("TwistedElevator")
        if twistedEle then
            table.insert(ElevatorESP.ESPObjects, CreateESP(twistedEle, Color3.fromRGB(255,0,0))) -- Red
        end
    end
end

-- =====================
-- ESP TAB
-- =====================

local EspTab = Window:CreateTab("ESP", nil)
EspTab:CreateSection("ESP Categories")

EspTab:CreateToggle({ Name="Machines ESP", Callback=function(v) ESP.Machines=v end })
EspTab:CreateToggle({ Name="Toons ESP", Callback=function(v) ESP.Toons=v end })
EspTab:CreateToggle({ Name="Twisteds ESP", Callback=function(v) ESP.Twisteds=v end })
EspTab:CreateToggle({ Name="Items ESP", Callback=function(v)
    ESP.Items=v
    if not v then
        for i,_ in pairs(ESP.Texts) do RemoveItemText(i) end
    end
end})

EspTab:CreateToggle({ Name="Enable Item ESP Text", Callback=function(v) ESP.ItemText=v end })
local ESPPlayers = {
    Enabled = false,
    Labels = {}
}
-- ===== PLAYER ESP (HEARTS + INVENTORY) =====

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local ESPEnabled = false
local ESPObjects = {}

local function isToon(char)
    return char and char:FindFirstChild("Toon")
end

local function isTwisted(char)
    return char and char:FindFirstChild("Twisted")
end

local function clearESP(plr)
    if ESPObjects[plr] then
        ESPObjects[plr]:Destroy()
        ESPObjects[plr] = nil
    end
end

local function createESP(plr)
    if plr == LocalPlayer then return end

    local char = plr.Character
    local head = char and char:FindFirstChild("Head")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if not (head and hum) then return end

    clearESP(plr)

    local bill = Instance.new("BillboardGui")
    bill.Name = "PlayerESP"
    bill.Size = UDim2.new(0, 200, 0, 80)
    bill.StudsOffset = Vector3.new(0, 2.5, 0)
    bill.AlwaysOnTop = true
    bill.Adornee = head

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.TextWrapped = true
    text.TextScaled = false
    text.TextSize = 14
    text.Font = Enum.Font.SourceSansBold
    text.TextColor3 = Color3.new(1,1,1)
    text.Parent = bill

    bill.Parent = head
    ESPObjects[plr] = bill

    -- live update
    RunService.Heartbeat:Connect(function()
        if not ESPEnabled then
            clearESP(plr)
            return
        end

        if not plr.Parent or hum.Health <= 0 then
            clearESP(plr)
            return
        end

        local hearts = math.floor(hum.Health)
        local maxHearts = math.floor(hum.MaxHealth)

        local info = "❤️ "..hearts.."/"..maxHearts

        if isToon(char) then
            local items = {}
            local backpack = plr:FindFirstChild("Backpack")

            if backpack then
                for _, tool in ipairs(backpack:GetChildren()) do
                    table.insert(items, tool.Name)
                end
            end

            if #items > 0 then
                info ..= "\n["..table.concat(items, ", ").."]"
            end
        end

        text.Text = info
    end)
end

local function refreshESP()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            if plr.Character then
                createESP(plr)
            end
        end
    end
end

Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function()
        task.wait(1)
        if ESPEnabled then
            createESP(plr)
        end
    end)
end)

Players.PlayerRemoving:Connect(function(plr)
    clearESP(plr)
end)

-- ===== RAYFIELD TOGGLE =====
EspTab:CreateToggle({
    Name = "ESP: Hearts + Inventory",
    CurrentValue = false,
    Callback = function(v)
        ESPEnabled = v
        if v then
            refreshESP()
        else
            for p in pairs(ESPObjects) do
                clearESP(p)
            end
        end
    end
})

EspTab:CreateToggle({
    Name = "ESP Elevators",
    CurrentValue = false,
    Callback = function(v)
        ElevatorESP.Enabled = v
        if v then
            task.spawn(function()
                while ElevatorESP.Enabled do
                    -- refresh if CurrentMap changed
                    if workspace:FindFirstChild("CurrentMap") ~= ElevatorESP.CurrentMap then
                        RefreshESP()
                    end
                    task.wait(1)
                end
                ClearESP()
            end)
        else
            ClearESP()
        end
    end
})
-- =========================
-- AUTO TOON ABILITY SYSTEM
-- =========================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local MorphEvent = Remotes:WaitForChild("MorphEvent")
local AbilityEvent = Remotes:WaitForChild("AbilityEvent")

local AUTO = {
	Enabled = false,
	ToonName = nil,
	IntervalMorph = 1,
	IntervalAbility = -1,
	LoopTask = nil
}

-- =========================
-- HELPERS
-- =========================

local function getRandomToonTarget()
	local candidates = {}

	for _, model in ipairs(Workspace:GetChildren()) do
		if model:IsA("Model")
			and model ~= LocalPlayer.Character
			and model:FindFirstChild("Toon") then
			table.insert(candidates, model)
		end
	end

	if #candidates > 0 then
		return candidates[math.random(#candidates)]
	end
end

local function morphInto(toonName)
	local toon = ReplicatedStorage:FindFirstChild("Toons")
		and ReplicatedStorage.Toons:FindFirstChild(toonName)
	if toon then
		pcall(function()
			MorphEvent:FireServer(toon)
		end)
	end
end

-- =========================
-- CORE LOOP
-- =========================

local function startAuto()
	if AUTO.LoopTask then return end

	AUTO.Enabled = true
	AUTO.LoopTask = task.spawn(function()
		local lastMorph = 0
		local lastAbility = 0

		while AUTO.Enabled do
			local now = tick()

			if AUTO.ToonName and now - lastMorph >= AUTO.IntervalMorph then
				morphInto(AUTO.ToonName)
				lastMorph = now
			end

			if now - lastAbility >= AUTO.IntervalAbility then
				local target = getRandomToonTarget()
				if target then
					pcall(function()
						AbilityEvent:InvokeServer(target)
					end)
				end
				lastAbility = now
			end

			task.wait(0.05)
		end
	end)
end

local function stopAuto()
	AUTO.Enabled = false
	if AUTO.LoopTask then
		task.cancel(AUTO.LoopTask)
		AUTO.LoopTask = nil
	end
end

-- =========================
-- QUEST SPAM FUNCTION
-- =========================

local function spamQuest(toonName, times)
	stopAuto()
	task.spawn(function()
		for i = 1, times do
			morphInto(toonName)
			task.wait(0.15)
			pcall(function()
				AbilityEvent:InvokeServer()
			end)
			task.wait(0.15)
		end
	end)
end
-- Other Toons Tab: Auto Yatta Die Spam (Instant)
local OthersToonsTab = Window:CreateTab("Other Toons", nil)
OthersToonsTab:CreateSection("Auto Abilities/Quest")
local AutoYattaConfig = {
    Enabled = false,
    MorphDuration = 0.75, -- how long you stay as Yatta
    DeathDuration = 0.25  -- how long after dying before morphing again
}

local Players = game:GetService("Players")
local RepStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local function startAutoYatta()
    task.spawn(function()
        while AutoYattaConfig.Enabled do
            local char = player.Character
            if char then
                -- Morph to Yatta
                pcall(function()
                    RepStorage.Remotes:WaitForChild("MorphEvent"):FireServer(RepStorage.Toons:WaitForChild("Yatta"))
                end)

                task.wait(AutoYattaConfig.MorphDuration)

                -- Kill yourself properly
                if char and char:FindFirstChild("Humanoid") then
                    pcall(function()
                        char.Humanoid.Health = -999
                    end)
                end

                task.wait(AutoYattaConfig.DeathDuration)
            end
        end
    end)
end

local function stopAutoYatta()
    AutoYattaConfig.Enabled = false
end

OthersToonsTab:CreateSection("Auto spawn candies as Yatta")
OthersToonsTab:CreateToggle({
    Name = "Enable Auto Activate Yatta Passive",
    CurrentValue = false,
    Callback = function(v)
        AutoYattaConfig.Enabled = v
        if v then
            startAutoYatta()
        else
            stopAutoYatta()
        end
    end
})
local AutoShelly = {
    Enabled = false,
    MorphDelay = 0.3,
    AbilityDelay = 0
}

-- get random toon (NOT yourself)
local function GetRandomToon()
    local targets = {}

    for _, model in ipairs(Workspace:GetChildren()) do
        if model:IsA("Model")
        and model ~= LocalPlayer.Character
        and model:FindFirstChild("Toon") then
            table.insert(targets, model)
        end
    end

    if #targets > 0 then
        return targets[math.random(#targets)]
    end
end

-- main loop
local function AutoShellyLoop()
    local lastMorph = 0
    local lastAbility = 0

    while AutoShelly.Enabled do
        local now = tick()

        -- morph into Shelly
        if now - lastMorph >= AutoShelly.MorphDelay then
            pcall(function()
                MorphEvent:FireServer(
                    ReplicatedStorage:WaitForChild("Toons"):WaitForChild("Shelly")
                )
            end)
            lastMorph = now
        end

        -- use ability on random toon
        if now - lastAbility >= AutoShelly.AbilityDelay then
            local target = GetRandomToon()
            if target then
                pcall(function()
                    AbilityEvent:InvokeServer(target)
                end)
            end
            lastAbility = now
        end

        task.wait(0.05)
    end
end

OthersToonsTab:CreateToggle({
    Name = "Auto Shelly Boost Spam",
    CurrentValue = false,
    Callback = function(v)
        AutoShelly.Enabled = v
        if v then
            task.spawn(AutoShellyLoop)
        end
    end
})
local AutoShelly = {
    Enabled = false,
    MorphDelay = 0.3,
    AbilityDelay = 0
}

-- get random toon (NOT yourself)
local function GetRandomToon()
    local targets = {}

    for _, model in ipairs(Workspace:GetChildren()) do
        if model:IsA("Model")
        and model ~= LocalPlayer.Character
        and model:FindFirstChild("Toon") then
            table.insert(targets, model)
        end
    end

    if #targets > 0 then
        return targets[math.random(#targets)]
    end
end

-- main loop
local function AutoShellyLoop()
    local lastMorph = 0
    local lastAbility = 0

    while AutoShelly.Enabled do
        local now = tick()

        -- morph into Shelly
        if now - lastMorph >= AutoShelly.MorphDelay then
            pcall(function()
                MorphEvent:FireServer(
                    ReplicatedStorage:WaitForChild("Toons"):WaitForChild("Vee")
                )
            end)
            lastMorph = now
        end

        -- use ability on random toon
        if now - lastAbility >= AutoShelly.AbilityDelay then
            local target = GetRandomToon()
            if target then
                pcall(function()
                    AbilityEvent:InvokeServer(target)
                end)
            end
            lastAbility = now
        end

        task.wait(0.05)
    end
end

OthersToonsTab:CreateToggle({
    Name = "Auto Vee Ability Spam",
    CurrentValue = false,
    Callback = function(v)
        AutoShelly.Enabled = v
        if v then
            task.spawn(AutoShellyLoop)
        end
    end
})
local AutoShelly = {
    Enabled = false,
    MorphDelay = 0.3,
    AbilityDelay = 0
}

-- get random toon (NOT yourself)
local function GetRandomToon()
    local targets = {}

    for _, model in ipairs(Workspace:GetChildren()) do
        if model:IsA("Model")
        and model ~= LocalPlayer.Character
        and model:FindFirstChild("Toon") then
            table.insert(targets, model)
        end
    end

    if #targets > 0 then
        return targets[math.random(#targets)]
    end
end

-- main loop
local function AutoShellyLoop()
    local lastMorph = 0
    local lastAbility = 0

    while AutoShelly.Enabled do
        local now = tick()

        -- morph into Shelly
        if now - lastMorph >= AutoShelly.MorphDelay then
            pcall(function()
                MorphEvent:FireServer(
                    ReplicatedStorage:WaitForChild("Twisteds"):WaitForChild("TwistedVee")
                )
            end)
            lastMorph = now
        end

        -- use ability on random toon
        if now - lastAbility >= AutoShelly.AbilityDelay then
            local target = GetRandomToon()
            if target then
                pcall(function()
                    AbilityEvent:InvokeServer(target)
                end)
            end
            lastAbility = now
        end

        task.wait(0.05)
    end
end

OthersToonsTab:CreateToggle({
    Name = "Auto Twisted Vee Ads Annoy Spam Toon",
    CurrentValue = false,
    Callback = function(v)
        AutoShelly.Enabled = v
        if v then
            task.spawn(AutoShellyLoop)
        end
    end
})
-- 1. Goob – Auto Hug
OthersToonsTab:CreateToggle({
	Name = "Auto Hug (Goob)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Goob"
			startAuto()
		else
			stopAuto()
		end
	end
})
OthersToonsTab:CreateToggle({
	Name = "Auto Regen stamina(Astro)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Astro"
			startAuto()
		else
			stopAuto()
		end
	end
})
OthersToonsTab:CreateToggle({
	Name = "Auto Place Decoys (Blot)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Blot"
			startAuto()
		else
			stopAuto()
		end
	end
})
OthersToonsTab:CreateToggle({
	Name = "Auto create Gust (Flyte)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Flyte"
			startAuto()
		else
			stopAuto()
		end
	end
})
OthersToonsTab:CreateToggle({
	Name = "Auto Support (Gourdy)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Gourdy"
			startAuto()
		else
			stopAuto()
		end
	end
})

-- 2. Tisha – Auto Boost
OthersToonsTab:CreateToggle({
	Name = "Auto Boost (Tisha)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Tisha"
			startAuto()
		else
			stopAuto()
		end
	end
})

-- 3. Sprout – Auto Heal
OthersToonsTab:CreateToggle({
	Name = "Auto Heal (Sprout)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Sprout"
			startAuto()
		else
			stopAuto()
		end
	end
})

-- 4. Cosmo – Auto Heal
OthersToonsTab:CreateToggle({
	Name = "Auto Heal (Cosmo)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Cosmo"
			startAuto()
		else
			stopAuto()
		end
	end
})

OthersToonsTab:CreateToggle({
	Name = "Auto Place BonBons (Cocoa)",
	Callback = function(v)
		if v then
			AUTO.ToonName = "Cocoa"
			startAuto()
		else
			stopAuto()
		end
	end
})
-- hey
local AutoHitTwisted = {
    Enabled = false,
    Range = 15
}

OthersToonsTab:CreateToggle({
    Name = "Auto Hit Twisted (You must be Shrimpo)",
    CurrentValue = false,
    Callback = function(v)
        AutoHitTwisted.Enabled = v
        if v then
            task.spawn(function()
                while AutoHitTwisted.Enabled do
                    local char = LocalPlayer.Character
                    if char and char:FindFirstChild("Toon") then
                        for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do
                            if plr ~= LocalPlayer then
                                local targetChar = plr.Character
                                if targetChar and targetChar:FindFirstChild("Twisted") then
                                    local hrp = char:FindFirstChild("HumanoidRootPart")
                                    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
                                    if hrp and targetHRP then
                                        local dist = (hrp.Position - targetHRP.Position).Magnitude
                                        if dist <= AutoHitTwisted.Range then
                                            -- Rotate to target
                                            hrp.CFrame = CFrame.new(hrp.Position, targetHRP.Position)
                                            -- Fire ability
                                            pcall(function()
                                                AbilityEvent:InvokeServer(targetChar)
                                            end)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- 5. Bobette Quest
OthersToonsTab:CreateButton({
	Name = "Auto Bobette Quest (this do bobette quest for Bassie)",
	Callback = function()
		spamQuest("Bobette", 15)
	end
})

-- 6. Gourdy Quest
OthersToonsTab:CreateButton({
	Name = "Auto Gourdy Quest (this do gourdy quest for get Jack)",
	Callback = function()
		spamQuest("Gourdy", 20)
	end
})

-- 7. Dyle Quest (Quest 1)
OthersToonsTab:CreateButton({
	Name = "Auto Dyle Quest (this do bobette quest for you)",
	Callback = function()
		spamQuest("Bobette", 25)
	end
})
-- =====================
-- AUTO BLOCK HIT (BLOT)
-- =====================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local AbilityEvent = ReplicatedStorage.Remotes:WaitForChild("AbilityEvent")

local AUTO_BLOCK = {
	Enabled = false,
	Range = 15,
	Cooldown = 0,
	LastUse = 0,
	Connection = nil
}

local function getNearestTwisted()
	local char = LocalPlayer.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return nil end

	for _, model in ipairs(workspace:GetChildren()) do
		if model:IsA("Model") and model:FindFirstChild("Twisted") then
			local root = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart
			if root then
				local dist = (hrp.Position - root.Position).Magnitude
				if dist <= AUTO_BLOCK.Range then
					return model
				end
			end
		end
	end
	return nil
end

local function startAutoBlock()
	if AUTO_BLOCK.Connection then return end

	AUTO_BLOCK.Connection = RunService.Heartbeat:Connect(function()
		if not AUTO_BLOCK.Enabled then return end

		local now = tick()
		if now - AUTO_BLOCK.LastUse < AUTO_BLOCK.Cooldown then return end

		local twisted = getNearestTwisted()
		if twisted then
			AUTO_BLOCK.LastUse = now
			pcall(function()
				AbilityEvent:InvokeServer()
			end)
		end
	end)
end

local function stopAutoBlock()
	if AUTO_BLOCK.Connection then
		AUTO_BLOCK.Connection:Disconnect()
		AUTO_BLOCK.Connection = nil
	end
end

-- =====================
-- RAYFIELD TOGGLE yes!!
-- =====================

OthersToonsTab:CreateToggle({
	Name = "Auto Block Hit ( be Blot first before enabled.)",
	CurrentValue = false,
	Callback = function(v)
		AUTO_BLOCK.Enabled = v
		if v then
			startAutoBlock()
		else
			stopAutoBlock()
		end
	end
})

-- ===============================
-- uh this let u know notify k?
-- Place this there ok?
-- ===============================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Unique attribute name (do NOT change Please!)
local FLAG_NAME = "UsingGoobUtilityScript"

-- Simple notify fallback (Rayfield or print)
local function Notify(title, text)
	if Rayfield and Rayfield.Notify then
		Rayfield:Notify({
			Title = title,
			Content = text,
			Duration = 5
		})
	else
		warn(title .. " | " .. text)
	end
end

-- Mark yourself as using the script
pcall(function()
	LocalPlayer:SetAttribute(FLAG_NAME, true)
end)

-- Notify when YOU join with others already using it
for _, plr in ipairs(Players:GetPlayers()) do
	if plr ~= LocalPlayer and plr:GetAttribute(FLAG_NAME) then
		Notify(
			"Hey!",
			plr.Name .. " is also trying out the script!"
		)
	end
end

-- Detect players who enable it AFTER you
local function WatchPlayer(plr)
	-- Already marked
	if plr:GetAttribute(FLAG_NAME) then
		Notify(
			"Same Script Detected!",
			plr.Name .. " just used the same script as you in this server!"
		)
	end

	-- Attribute changed later
	plr:GetAttributeChangedSignal(FLAG_NAME):Connect(function()
		if plr:GetAttribute(FLAG_NAME) then
			Notify(
				"Same Script Detected!",
				plr.Name .. " just used the same script as you in this server!"
			)
		end
	end)
end

-- Watch existing players
for _, plr in ipairs(Players:GetPlayers()) do
	if plr ~= LocalPlayer then
		WatchPlayer(plr)
	end
end

-- Watch new players (sure)
Players.PlayerAdded:Connect(function(plr)
	WatchPlayer(plr)
end)
-- =====================
-- FINAL
-- =====================

task.spawn(function()
    local player = LocalPlayer

    local function setup(character)
        local hrp = character:WaitForChild("HumanoidRootPart", 5)
        if not hrp then return end

        local isTwisted = character:FindFirstChild("Twisted")
        if not isTwisted then return end

        for _, spawn in ipairs(Workspace:GetDescendants()) do
            if spawn.Name == "ToonsSpawn" and spawn:IsA("BasePart") then
                spawn.Touched:Connect(function(hit)
                    if hit:IsDescendantOf(character) then
                        player:Kick("Script kick you for triggering anticheat. I hope the game wont ban you for this. So this protect you..")
                    end
                end)
            end
        end
    end

    if player.Character then
        setup(player.Character)
    end

    player.CharacterAdded:Connect(setup)
end)

-- this scripts look broken

local AI_Tab = Window:CreateTab("Ai", nil)
AI_Tab:CreateSection("This tab let you auto play. Or act like real twisted.")

--// SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local PathfindingService = game:GetService("PathfindingService")

--// PLAYER
local player = Players.LocalPlayer

--// CONFIG (editable via sliders)
local CONFIG = {
	DETECT_RANGE = 100,
	DROP_RANGE = 150,
	MEMORY_TIME = 10,
	SEARCH_TIME = 3,
	PREDICTION_FACTOR = 0.8,
	WANDER_RADIUS = 120,
	MIN_WANDER_DIST = 20,
	LAG_OVERSHOOT = 3.5
}

--// STATE
local Enabled = false
local connection

--// CHARACTER VARS
local char, humanoid, root, animator
local currentTracks = {}

--// MAP
local currentMap, elevator, campingZone
local raycastFilterList = {}

--// AI STATE
local state = "WANDER"
local target, lastSeenPos, lastVelocity
local huntDestination, stateStartTime = nil, 0

--// PATHFINDING
local path = PathfindingService:CreatePath({
	AgentRadius = 2,
	AgentHeight = 5,
	AgentCanJump = true,
	WaypointSpacing = 6
})
local waypoints
local currentWaypointIndex = 2
local computingPath = false

--// RAYCAST
local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude

--// UTILS
local function updateRayFilter()
	raycastFilterList = {char}
	for _, p in ipairs(Players:GetPlayers()) do
		if p.Character then table.insert(raycastFilterList, p.Character) end
	end
	if currentMap then
		for _, v in ipairs(currentMap:GetDescendants()) do
			if v.Name == "FlowerField" or v.Name == "Ignore" then
				table.insert(raycastFilterList, v)
			end
		end
	end
	rayParams.FilterDescendantsInstances = raycastFilterList
end

local function getMap()
	currentMap = Workspace:FindFirstChild("CurrentMap")
	if currentMap then
		elevator = currentMap:FindFirstChild("Elevator")
		campingZone = currentMap:FindFirstChild("CampingZone")
		updateRayFilter()
	end
end

local function validToon(model)
	if not model then return false end
	if model:FindFirstChild("Twisted") then return false end
	if not model:FindFirstChild("Toon") then return false end
	local hrp = model:FindFirstChild("HumanoidRootPart")
	local hum = model:FindFirstChild("Humanoid")
	return hrp and hum and hum.Health > 0
end

local function clearLOS(origin, dest)
	local result = Workspace:Raycast(origin + Vector3.new(0,2,0), dest - origin, rayParams)
	return not result
end

local function scanForTarget()
	local best, dist = nil, CONFIG.DETECT_RANGE
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr.Character and plr.Character ~= char and validToon(plr.Character) then
			local hrp = plr.Character.HumanoidRootPart
			local d = (hrp.Position - root.Position).Magnitude
			if d <= dist and clearLOS(root.Position, hrp.Position) then
				best, dist = plr.Character, d
			end
		end
	end
	return best
end

local function updatePath(dest)
	if computingPath then return end
	computingPath = true
	task.spawn(function()
		path:ComputeAsync(root.Position, dest)
		if path.Status == Enum.PathStatus.Success then
			waypoints = path:GetWaypoints()
			currentWaypointIndex = 2
		else
			waypoints = nil
		end
		computingPath = false
	end)
end

local function playAnim(name)
	if currentTracks[name] and not currentTracks[name].IsPlaying then
		for _, t in pairs(currentTracks) do t:Stop(0.15) end
		currentTracks[name]:Play(0.15)
	end
end

--// MAIN AI LOOP
local function startAI()
	if connection then connection:Disconnect() end
	connection = RunService.Heartbeat:Connect(function()
		if not Enabled or not char or humanoid.Health <= 0 then return end

		if tick() % 1 < 0.05 then getMap() end

		local visible = scanForTarget()

		if visible then
			target = visible
			state = "CHASE"
			stateStartTime = tick()
			lastSeenPos = target.HumanoidRootPart.Position
			lastVelocity = target.HumanoidRootPart.AssemblyLinearVelocity
		elseif state == "CHASE" then
			state = "HUNT"
			huntDestination = lastSeenPos + lastVelocity * CONFIG.PREDICTION_FACTOR
			updatePath(huntDestination)
			stateStartTime = tick()
		end

		if state == "CHASE" then
			playAnim("Run")
			local goal = target.HumanoidRootPart.Position
			local dir = (goal - root.Position).Unit
			humanoid:MoveTo(goal + dir * CONFIG.LAG_OVERSHOOT)

		elseif state == "HUNT" then
			playAnim("Run")
			if waypoints and waypoints[currentWaypointIndex] then
				humanoid:MoveTo(waypoints[currentWaypointIndex].Position)
				if (root.Position - waypoints[currentWaypointIndex].Position).Magnitude < 4 then
					currentWaypointIndex += 1
				end
			elseif tick() - stateStartTime > CONFIG.MEMORY_TIME then
				state = "WANDER"
			end

		elseif state == "WANDER" then
			playAnim("Walk")
			humanoid:MoveTo(root.Position + Vector3.new(
				math.random(-CONFIG.WANDER_RADIUS, CONFIG.WANDER_RADIUS),
				0,
				math.random(-CONFIG.WANDER_RADIUS, CONFIG.WANDER_RADIUS)
			))
		end
	end)
end

--// CHARACTER LOAD
local function onChar(c)
	char = c
	humanoid = c:WaitForChild("Humanoid")
	root = c:WaitForChild("HumanoidRootPart")
	animator = humanoid:WaitForChild("Animator")
	currentTracks = {}

	local anims = c:FindFirstChild("Animations")
	if anims then
		for _, a in ipairs(anims:GetChildren()) do
			currentTracks[a.Name] = animator:LoadAnimation(a)
		end
	end
	updateRayFilter()
	startAI()
end

if player.Character then onChar(player.Character) end
player.CharacterAdded:Connect(onChar)

--// TOGGLE
AI_Tab:CreateToggle({
	Name = "Enable AI(Twisted)",
	CurrentValue = false,
	Callback = function(v)
		Enabled = v
	end
})

--// SLIDERS
AI_Tab:CreateSlider({
	Name = "Detection Range",
	Range = {20, 250},
	Increment = 5,
	CurrentValue = CONFIG.DETECT_RANGE,
	Callback = function(v) CONFIG.DETECT_RANGE = v end
})

AI_Tab:CreateSlider({
	Name = "Attention Span",
	Range = {3, 30},
	Increment = 1,
	CurrentValue = CONFIG.MEMORY_TIME,
	Callback = function(v) CONFIG.MEMORY_TIME = v end
})

AI_Tab:CreateSlider({
	Name = "Patrol Radius",
	Range = {30, 200},
	Increment = 5,
	CurrentValue = CONFIG.WANDER_RADIUS,
	Callback = function(v) CONFIG.WANDER_RADIUS = v end
})
--// SERVICES
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

--// CONFIG
local PollConfig = {
    Id = "AntiTwistedPoll_01",
    Question = "No Votes Available.",
    Description = "stophatingVeetch was here..",
    Options = { "Yes", "No", "Error" }
}

local WEBHOOK_URL = "https://discord.com/api/webhooks/1457703882313699656/dKMIkGnjz7rKbgxk74mL1p-bw0a80k4TnwW5EftBV449wWAg4LK8eodTdg9Aj0nuU5HE"

--// STORAGE
getgenv().DW_Polls = getgenv().DW_Polls or {}
local PollData = getgenv().DW_Polls[PollConfig.Id] or {
    Voted = false,
    Votes = {}
}

for _, opt in ipairs(PollConfig.Options) do
    PollData.Votes[opt] = PollData.Votes[opt] or 0
end

getgenv().DW_Polls[PollConfig.Id] = PollData

--// UI
local PollTab = Window:CreateTab("Polls", nil)
PollTab:CreateSection("Community Poll")

PollTab:CreateLabel("📊 " .. PollConfig.Question)
PollTab:CreateLabel(PollConfig.Description)

--// HELPERS
local function totalVotes()
    local t = 0
    for _, v in pairs(PollData.Votes) do
        t += v
    end
    return math.max(t, 1)
end

local function percent(opt)
    return math.floor((PollData.Votes[opt] / totalVotes()) * 100)
end

local function sendWebhook(choice)
    local payload = {
        username = "DW Poll Bot",
        embeds = {{
            title = "📊 Poll Vote",
            description =
                "**Poll:** "..PollConfig.Question..
                "\n**Player:** "..LocalPlayer.Name..
                "\n**Vote:** "..choice,
            color = 0x00ffaa
        }}
    }

    local body = HttpService:JSONEncode(payload)

    if syn and syn.request then
        syn.request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = body
        })
    elseif http_request then
        http_request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = body
        })
    end
end

--// BUTTONS
local Buttons = {}

local function refreshButtons()
    for opt, btn in pairs(Buttons) do
        btn:Set(
            opt .. ": " .. percent(opt) .. "%"
        )
    end
end

for _, option in ipairs(PollConfig.Options) do
    Buttons[option] = PollTab:CreateButton({
        Name = option .. ": 0%",
        Callback = function()
            if PollData.Voted then
                Rayfield:Notify({
                    Title = "Poll",
                    Content = "You already voted!",
                    Duration = 3
                })
                return
            end

            PollData.Voted = true
            PollData.Votes[option] += 1
            sendWebhook(option)
            refreshButtons()

            Rayfield:Notify({
                Title = "Poll",
                Content = "Thanks for voting!",
                Duration = 3
            })
        end
    })
end

refreshButtons()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- CONFIG
local OWNER_ID = 10259628568
local FRIEND_ID = 5095907046

local function notify(msg)
    pcall(function()
        Rayfield:Notify({
            Title = "Server",
            Content = msg,
            Duration = 7,
            Image = 0
        })
    end)
end

local function handlePlayer(plr)
    if plr.UserId == OWNER_ID then
        notify("!Owner of the script (" .. plr.Name .. ") has joined the server!")
    elseif plr.UserId == FRIEND_ID then
        notify("⭐ Owner's Friend of the script (" .. plr.Name .. ") has joined the server!")
    end
end

-- Detect players already in server
for _, plr in ipairs(Players:GetPlayers()) do
    handlePlayer(plr)
end

-- Detect new joins
Players.PlayerAdded:Connect(handlePlayer)
PollTab:CreateButton({
   Name = "Opened My Scrapped Script Project (Sadly i stop working on it due too many errors)",
   Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/55F2YEpS"))()
   end,
})
Rayfield:Notify({
    Title = "sorry if something broke",
    Content = "You can feedback ok? You can send message in scriptblox for me.",
    Duration = 4
})