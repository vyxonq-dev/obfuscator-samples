local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Orion/main/source"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Window = OrionLib:MakeWindow({
    Name = "Kaka Hub | Forgotten 2.3",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "KakaHub"
})

-- Update Logs Tab
local LogsTab = Window:MakeTab({
    Name = "Update Logs",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
LogsTab:AddParagraph("Recent Updates", [[
- add generator ui
- fix do all generator
- add stamina edit - sprint
- inf stamina idk if work
- paragraph in main tab
- esp for item and generator
- Aimbot is HERE!
]])

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MainTab:AddButton({
    Name = "Do All Generators",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local function getCharacter()
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            local humanoid = char:WaitForChild("Humanoid")
            return char, humanoid, hrp
        end

        local function teleportLeftOf(part, offset)
            local _, _, hrp = getCharacter()
            offset = offset or 5
            local leftCFrame = part.CFrame * CFrame.new(-offset, 0, 0)
            hrp.CFrame = leftCFrame + Vector3.new(0, 3, 0)
        end

        local function fireNearestPrompt(part, range)
            range = range or 10
            local _, _, hrp = getCharacter()
            local nearestPrompt
            local nearestDist = math.huge

            for _, descendant in ipairs(part:GetDescendants()) do
                if descendant:IsA("ProximityPrompt") then
                    local dist = (descendant.Parent.Position - hrp.Position).Magnitude
                    if dist < nearestDist and dist <= range then
                        nearestPrompt = descendant
                        nearestDist = dist
                    end
                end
            end

            if nearestPrompt then
                pcall(function()
                    nearestPrompt:InputHoldBegin()
                    task.wait(0.5)
                    nearestPrompt:InputHoldEnd()
                end)
            end
        end

        local function getAllGenerators()
            local gens = {}
            local success, map = pcall(function()
                return workspace:WaitForChild("Map"):WaitForChild("Ingame"):WaitForChild("Map")
            end)

            if success then
                for _, model in ipairs(map:GetDescendants()) do
                    if model:IsA("Model") and model.Name == "Generator" then
                        local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
                        local re = model:FindFirstChild("Remotes") and model.Remotes:FindFirstChild("RE")
                        if part and re then
                            table.insert(gens, {Part = part, Remote = re})
                        end
                    end
                end
            end
            return gens
        end

        local function activateAllGenerators()
            local generators = getAllGenerators()
            for _, gen in ipairs(generators) do
                teleportLeftOf(gen.Part, 5)
                task.wait(0.3)
                fireNearestPrompt(gen.Part)
                task.wait(0.2)
                for i = 1, 4 do
                    pcall(function()
                        gen.Remote:FireServer()
                    end)
                    task.wait(0.2)
                end
                task.wait(2)
            end
        end

        activateAllGenerators()
    end
})
MainTab:AddButton({
    Name = "Generator ui",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/BDT91tTw"))()
    end
})
MainTab:AddButton({
    Name = "Instant finished Generator",
    Callback = function()
        local fullMap = workspace:WaitForChild("Map"):WaitForChild("Ingame"):WaitForChild("Map")
        for _, descendant in ipairs(fullMap:GetDescendants()) do
            if descendant:IsA("Model") and descendant.Name == "Generator" then
                local remotes = descendant:FindFirstChild("Remotes")
                local re = remotes and remotes:FindFirstChild("RE")
                if re then
                    -- Fire only one generator and break
                    for i = 1, 4 do
                        pcall(function()
                            re:FireServer()
                        end)
                        task.wait(0.2)
                    end
                    break
                end
            end
        end
    end
})
MainTab:AddParagraph("Info", "Instant Generator is still work you had to go to generator hold e then use instant gen")
MainTab:AddToggle({
	Name = "Semi aimbot",
	Default = false,
	Callback = function(Value)
		getgenv().FaceHighHP = Value

		if Value then
			task.spawn(function()
				while getgenv().FaceHighHP do
					local myChar = Players.LocalPlayer.Character
					local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
					if myHRP then
						local target = nil
						local minDist = math.huge
						for _, plr in pairs(Players:GetPlayers()) do
							if plr ~= Players.LocalPlayer and plr.Character then
								local hum = plr.Character:FindFirstChildOfClass("Humanoid")
								local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
								if hum and hrp and hum.Health > 200 then
									local dist = (hrp.Position - myHRP.Position).Magnitude
									if dist < minDist then
										minDist = dist
										target = hrp
									end
								end
							end
						end
						if target then
							local lookPos = Vector3.new(target.Position.X, myHRP.Position.Y, target.Position.Z)
							myHRP.CFrame = CFrame.new(myHRP.Position, lookPos)
						end
					end
					task.wait(0.1)
				end
			end)
		end
	end
})
MainTab:AddButton({
	Name = "get Medkit",
	Callback = function()
		local player = game.Players.LocalPlayer
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not root then return end

		local medkitPrompt = workspace:FindFirstChild("Map")
			and workspace.Map:FindFirstChild("Ingame")
			and workspace.Map.Ingame:FindFirstChild("Medkit")
			and workspace.Map.Ingame.Medkit:FindFirstChild("ItemRoot")
			and workspace.Map.Ingame.Medkit.ItemRoot:FindFirstChildWhichIsA("ProximityPrompt")

		if medkitPrompt then
			local originalPosition = root.Position
			root.CFrame = CFrame.new(medkitPrompt.Parent.Position + Vector3.new(0, 2, 0))
			task.wait(0.2)
			fireproximityprompt(medkitPrompt)
			task.wait(0.3)
			root.CFrame = CFrame.new(originalPosition)
		else
			warn("Medkit prompt not found!")
		end
	end
})
MainTab:AddButton({
	Name = "get BloxyCola",
	Callback = function()
		local player = game.Players.LocalPlayer
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not root then return end

		local colaPrompt = workspace:FindFirstChild("Map")
			and workspace.Map:FindFirstChild("Ingame")
			and workspace.Map.Ingame:FindFirstChild("BloxyCola")
			and workspace.Map.Ingame.BloxyCola:FindFirstChild("ItemRoot")
			and workspace.Map.Ingame.BloxyCola.ItemRoot:FindFirstChildWhichIsA("ProximityPrompt")

		if colaPrompt then
			local originalPosition = root.Position
			root.CFrame = CFrame.new(colaPrompt.Parent.Position + Vector3.new(0, 2, 0))
			task.wait(0.2)
			fireproximityprompt(colaPrompt)
			task.wait(0.3)
			root.CFrame = CFrame.new(originalPosition)
		else
			warn("BloxyCola prompt not found!")
		end
	end
})
MainTab:AddButton({
	Name = "get Fries",
	Callback = function()
		local player = game.Players.LocalPlayer
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not root then return end

		local friesPrompt = workspace:FindFirstChild("Map")
			and workspace.Map:FindFirstChild("Ingame")
			and workspace.Map.Ingame:FindFirstChild("FriesFood")
			and workspace.Map.Ingame.FriesFood:FindFirstChild("ItemRoot")
			and workspace.Map.Ingame.FriesFood.ItemRoot:FindFirstChildWhichIsA("ProximityPrompt")

		if friesPrompt then
			local originalPosition = root.Position
			root.CFrame = CFrame.new(friesPrompt.Parent.Position + Vector3.new(0, 2, 0))
			task.wait(0.2)
			fireproximityprompt(friesPrompt)
			task.wait(0.3)
			root.CFrame = CFrame.new(originalPosition)
		else
			warn("Fries prompt not found!")
		end
	end
})
local PlayersTab = Window:MakeTab({
	Name = "Players",
	Icon = "rbxassetid://4483345998", -- optional icon
	PremiumOnly = false
})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Get initial player names (excluding LocalPlayer)
local function getOtherPlayers()
	local names = {}
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			table.insert(names, player.Name)
		end
	end
	return names
end

-- Store selected player
local selectedPlayer = nil

-- Create dropdown
local dropdown = PlayersTab:AddDropdown({
	Name = "Select Player",
	Default = "",
	Options = getOtherPlayers(),
	Callback = function(value)
		selectedPlayer = value
		print("Selected Player:", value)
	end
})

-- Update dropdown when players join/leave
Players.PlayerAdded:Connect(function()
	dropdown:Refresh(getOtherPlayers(), true)
end)

Players.PlayerRemoving:Connect(function()
	dropdown:Refresh(getOtherPlayers(), true)
end)
PlayersTab:AddButton({
	Name = "Go to Target",
	Callback = function()
		if selectedPlayer then
			local target = Players:FindFirstChild(selectedPlayer)
			if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
				local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				if hrp then
					hrp.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
				end
			end
		else
			warn("No player selected!")
		end
	end
})
local loopTP = false

PlayersTab:AddToggle({
	Name = "Loop TP to Target",
	Default = false,
	Callback = function(state)
		loopTP = state
		while loopTP do
			task.wait(0.2)
			if selectedPlayer then
				local target = Players:FindFirstChild(selectedPlayer)
				if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
					local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					if hrp then
						hrp.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0)
					end
				end
			end
		end
	end
})
local targetHealthLabel = PlayersTab:AddLabel("Target Health: N/A")

task.spawn(function()
	while true do
		task.wait(0.2)
		if selectedPlayer then
			local target = Players:FindFirstChild(selectedPlayer)
			if target and target.Character and target.Character:FindFirstChild("Humanoid") then
				local hp = math.floor(target.Character.Humanoid.Health)
				targetHealthLabel:Set("Target Health: " .. hp)
			else
				targetHealthLabel:Set("Target Health: N/A")
			end
		else
			targetHealthLabel:Set("Target Health: N/A")
		end
	end
end)
-- Aimbot Tab
local AimbotTab = Window:MakeTab({
    Name = "Aimbot",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local predictionValue = 3
local gojoAimEnabled = false
local aimConnection
local animConnection

AimbotTab:AddTextbox({
	Name = "Prediction (stud)",
	Default = "3",
	TextDisappear = true,
	Callback = function(Value)
		predictionValue = tonumber(Value) or 1
	end
})

AimbotTab:AddToggle({
	Name = "Gojo Aim",
	Default = false,
	Callback = function(Value)
		gojoAimEnabled = Value

		if gojoAimEnabled then
			local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				animConnection = humanoid.AnimationPlayed:Connect(function(track)
					if tostring(track.Animation.AnimationId):match("106690525393935") then
						if aimConnection then aimConnection:Disconnect() end
						local start = tick()

						aimConnection = RunService.RenderStepped:Connect(function()
							if not gojoAimEnabled or tick() - start > 1.5 then
								aimConnection:Disconnect()
								aimConnection = nil
								return
							end

							local target = nil
							for _, plr in pairs(Players:GetPlayers()) do
								if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Humanoid") then
									if plr.Character.Humanoid.Health > 333 then
										target = plr
										break
									end
								end
							end

							if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
								local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
								if root then
									local targetPos = target.Character.HumanoidRootPart.Position
									local dir = (targetPos + target.Character.HumanoidRootPart.Velocity * predictionValue - root.Position).Unit
									root.CFrame = CFrame.new(root.Position, root.Position + dir)
								end
							end
						end)
					end
				end)
			end
		else
			if aimConnection then
				aimConnection:Disconnect()
				aimConnection = nil
			end
			if animConnection then
				animConnection:Disconnect()
				animConnection = nil
			end
		end
	end
})
-- Misc Tab
local MiscTab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local slideCooldown = false

MiscTab:AddButton({
    Name = "Slide",
    Callback = function()
        if slideCooldown then
            OrionLib:MakeNotification({
                Name = "Slide",
                Content = "Slide is on cooldown!",
                Time = 2
            })
            return
        end

        local char = LocalPlayer.Character
        if not char then return end

        local hrp = char:FindFirstChild("HumanoidRootPart")
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hrp or not hum then return end

        local moveDir = hum.MoveDirection
        if moveDir.Magnitude == 0 then
            -- If no input, slide forward facing camera direction
            local cam = workspace.CurrentCamera
            if cam then
                moveDir = cam.CFrame.LookVector
            else
                moveDir = Vector3.new(0,0,1)
            end
        end

        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(1e5, 0, 1e5)
        bv.Velocity = moveDir.Unit * 80
        bv.Parent = hrp

        slideCooldown = true

        task.delay(0.3, function()
            bv:Destroy()
        end)

        task.delay(2, function()
            slideCooldown = false
        end)
    end
})
-- Inside your existing MiscTab section
MiscTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    ValueName = "Speed",
    Callback = function(value)
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = value
        end
    end
})

MiscTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 300,
    Default = 50,
    Increment = 1,
    ValueName = "Power",
    Callback = function(value)
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.JumpPower = value
        end
    end
})

local espEnabled = false
local espBoxes = {}

local function toggleESP(state)
    espEnabled = state

    for _, box in pairs(espBoxes) do
        box:Destroy()
    end
    table.clear(espBoxes)

    if not espEnabled then return end

    task.spawn(function()
        while espEnabled do
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    if not espBoxes[player] then
                        local box = Instance.new("BoxHandleAdornment")
                        box.Size = Vector3.new(4, 6, 2)
                        box.Color3 = Color3.new(1, 0, 0)
                        box.Adornee = player.Character.HumanoidRootPart
                        box.AlwaysOnTop = true
                        box.ZIndex = 5
                        box.Transparency = 0.5
                        box.Name = "ESPBox"
                        box.Parent = game.CoreGui
                        espBoxes[player] = box
                    end
                end
            end

            for p, box in pairs(espBoxes) do
                if not p:IsDescendantOf(Players) or not p.Character or not p.Character:FindFirstChild("HumanoidRootPart") then
                    box:Destroy()
                    espBoxes[p] = nil
                end
            end

            task.wait(1)
        end
    end)
end

MiscTab:AddToggle({
    Name = "Player ESP",
    Default = false,
    Callback = function(state)
        toggleESP(state)
    end
})
local ESPEnabled = false
local ESPTools = {}

local function createESP(tool)
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = tool
    box.Size = tool.Size
    box.Color3 = Color3.fromRGB(0, 255, 0)
    box.Transparency = 0.5
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Parent = tool
    return box
end

local function toggleESP(value)
    ESPEnabled = value
    if ESPEnabled then
        for _, tool in pairs(workspace.Map.Ingame:GetChildren()) do
            if tool:IsA("Tool") then
                if not ESPTools[tool] then
                    ESPTools[tool] = createESP(tool)
                end
            end
        end
    else
        for _, box in pairs(ESPTools) do
            box:Destroy()
        end
        ESPTools = {}
    end
end

workspace.Map.Ingame.ChildAdded:Connect(function(child)
    if ESPEnabled and child:IsA("Tool") then
        ESPTools[child] = createESP(child)
    end
end)

MiscTab:AddToggle({
    Name = "ESP item",
    Default = false,
    Callback = toggleESP
})
-- ESP Variables
local GeneratorESPEnabled = false
local GeneratorESP = {}

local function createGeneratorESP(generator)
    local box = Instance.new("BoxHandleAdornment")
    box.Adornee = generator
    box.Size = generator:GetExtentsSize()
    box.Color3 = Color3.fromRGB(0, 255, 255)
    box.Transparency = 0.5
    box.AlwaysOnTop = true
    box.ZIndex = 10
    box.Parent = generator

    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = generator
    billboard.Size = UDim2.new(0, 100, 0, 50)
    billboard.StudsOffset = Vector3.new(0, generator:GetExtentsSize().Y + 1, 0)
    billboard.AlwaysOnTop = true
    billboard.Parent = generator

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Text = "Generator"
    textLabel.Parent = billboard

    return {Box = box, Billboard = billboard, TextLabel = textLabel, Model = generator}
end

game:GetService("RunService").RenderStepped:Connect(function()
    if GeneratorESPEnabled then
        local playerPos = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        if playerPos then
            for _, data in pairs(GeneratorESP) do
                local distance = (data.Model.Position - playerPos).Magnitude
                data.TextLabel.Text = string.format("Generator | %.1f studs", distance)
            end
        end
    end
end)

local function toggleGeneratorESP(value)
    GeneratorESPEnabled = value

    if GeneratorESPEnabled then
        for _, gen in pairs(workspace.Map.Ingame.Map:GetChildren()) do
            if gen.Name:lower():find("generator") then
                if not GeneratorESP[gen] then
                    GeneratorESP[gen] = createGeneratorESP(gen)
                end
            end
        end
    else
        for _, data in pairs(GeneratorESP) do
            data.Box:Destroy()
            data.Billboard:Destroy()
        end
        GeneratorESP = {}
    end
end

MiscTab:AddToggle({
    Name = "ESP Generators",
    Default = false,
    Callback = toggleGeneratorESP
})

workspace.Map.Ingame.Map.ChildAdded:Connect(function(child)
    if GeneratorESPEnabled and child.Name:lower():find("generator") then
        GeneratorESP[child] = createGeneratorESP(child)
    end
end)
MiscTab:AddButton({
    Name = "Inf stamina",
    Callback = function()
        for _, module in pairs(getgc(true)) do
            if typeof(module) == "table" and rawget(module, "StaminaLoss") then
                module.StaminaLoss = 0
            end
        end

        OrionLib:MakeNotification({
            Name = "✅ Applied",
            Content = "inf stamina",
            Time = 3
        })
    end
})
MiscTab:AddParagraph("inf stamina info", [[
- btw every time new round start
- you had to use inf stamina again
]])
local staminaLossBox = MiscTab:AddTextbox({
    Name = "Stamina Loss",
    Default = "10",
    TextDisappear = false,
    Callback = function() end
})

local staminaGainBox = MiscTab:AddTextbox({
    Name = "Stamina Gain",
    Default = "20",
    TextDisappear = false,
    Callback = function() end
})

local sprintSpeedBox = MiscTab:AddTextbox({
    Name = "Sprint Speed",
    Default = "26",
    TextDisappear = false,
    Callback = function() end
})

MiscTab:AddButton({
    Name = "Apply Stamina Settings",
    Callback = function()
        local loss = tonumber(staminaLossBox.Text) or 10
        local gain = tonumber(staminaGainBox.Text) or 20
        local speed = tonumber(sprintSpeedBox.Text) or 26

        for _, module in pairs(getgc(true)) do
            if typeof(module) == "table" then
                if rawget(module, "StaminaLoss") then
                    module.StaminaLoss = loss
                end
                if rawget(module, "StaminaGain") then
                    module.StaminaGain = gain
                end
                if rawget(module, "SprintSpeed") then
                    module.SprintSpeed = speed
                end
            end
        end

        OrionLib:MakeNotification({
            Name = "✅ Applied",
            Content = "Stamina settings updated!",
            Time = 3
        })
    end
})
-- Milestones Tab
local MileTab = Window:MakeTab({
    Name = "Milestones",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MileTab:AddButton({
    Name = "Auto Killer Milestone not work anymore",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Auto Killer Milestone",
            Content = "Started auto milestone farming!",
            Time = 5
        })

        local function getAllGenerators()
            local generators = {}
            pcall(function()
                local fullMap = workspace:WaitForChild("Map"):WaitForChild("Ingame"):WaitForChild("Map")
                for _, descendant in ipairs(fullMap:GetDescendants()) do
                    if descendant:IsA("Model") and descendant.Name == "Generator" then
                        local remotes = descendant:FindFirstChild("Remotes")
                        local re = remotes and remotes:FindFirstChild("RE")
                        local part = descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart")
                        if re and part then
                            table.insert(generators, {RE = re, Pos = part.Position})
                        end
                    end
                end
            end)
            return generators
        end

        local function waitForCharacter()
            if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.CharacterAdded:Wait()
            end
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local hum = char:WaitForChild("Humanoid")
            local hrp = char:WaitForChild("HumanoidRootPart")
            return char, hum, hrp
        end

        local function teleport(pos)
            local _, _, hrp = waitForCharacter()
            hrp.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))
        end

        local function fireAllGenerators()
            local generators = getAllGenerators()
            local used = {}

            for _, gen in pairs(generators) do
                if not used[gen.RE] then
                    teleport(gen.Pos)
                    task.wait(1.5)
                    for i = 1, 4 do
                        pcall(function()
                            gen.RE:FireServer()
                        end)
                        task.wait(0.2)
                    end
                    used[gen.RE] = true
                end
            end
        end

        local function resetCharacter()
            local char = LocalPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.Health = 0
                end
            end
        end

        task.spawn(function()
            while true do
                local char, hum = waitForCharacter()

                repeat
                    task.wait(0.5)
                    char, hum = waitForCharacter()
                until hum.Health > 200

                fireAllGenerators()
                task.wait(1)
                resetCharacter()

                repeat
                    task.wait(1)
                    char, hum = waitForCharacter()
                until hum and hum.Health > 200

                task.wait(1.5)
            end
        end)
    end
})

MileTab:AddParagraph("Warning", "This might not work well since I'm lazy to fix it. Also, thanks for using!")

MileTab:AddToggle({
    Name = "Safe Spot",
    Default = false,
    Callback = function(value)
        getgenv().SafeSpotActive = value
        if value then
            local Players = game:GetService("Players")
            local localPlayer = Players.LocalPlayer
            local char = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")

            -- Save the position 1000 studs above current
            local safePos = hrp.Position + Vector3.new(0, 30, 0)

            task.spawn(function()
                while getgenv().SafeSpotActive do
                    if hrp then
                        hrp.CFrame = CFrame.new(safePos)
                    end
                    task.wait(0.0001) -- Teleport every 1 second, adjust as needed
                end
            end)
        end
    end
})
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://4483345998", -- you can use any icon asset ID here
    PremiumOnly = false
})
local notificationsEnabled = true
local volume = 50
local theme = "Light"

SettingsTab:AddToggle({
    Name = "Enable Notifications",
    Default = notificationsEnabled,
    Callback = function(value)
        notificationsEnabled = value
        print("Notifications enabled:", notificationsEnabled)
        -- You can add logic here to enable/disable notifications in your script
    end
})

SettingsTab:AddSlider({
    Name = "Volume",
    Min = 0,
    Max = 100,
    Default = volume,
    Increment = 5,
    Suffix = "%",
    Callback = function(value)
        volume = value
        print("Volume set to:", volume)
        -- Use volume in your audio system, if any
    end
})

SettingsTab:AddDropdown({
    Name = "Theme",
    Default = theme,
    Options = {"Light", "Dark"},
    Callback = function(value)
        theme = value
        print("Theme set to:", theme)
        -- Add your theme switching code here
    end
})

SettingsTab:AddButton({
    Name = "Reset Settings",
    Callback = function()
        notificationsEnabled = true
        volume = 50
        theme = "Light"

        -- Update UI controls to reflect defaults
        -- (Note: some libs need manual update, some auto-update)
        SettingsTab:SetToggle("Enable Notifications", notificationsEnabled)
        SettingsTab:SetSlider("Volume", volume)
        SettingsTab:SetDropdown("Theme", theme)

        print("Settings reset to default")
    end
})
local CreditTab = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://6023426923", -- (Optional) Change icon ID
	PremiumOnly = false
})
CreditTab:AddLabel("Script by: kaka tu")
CreditTab:AddLabel("Using Orion Library")
CreditTab:AddLabel("Uhh aimbot will definitely not come since im lazy :P")
OrionLib:Init()
