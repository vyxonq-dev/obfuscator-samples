local stored_fonts = {}
gui_config = {
    Color = Color3.fromRGB(255, 255, 255),
    Keybind = Enum.KeyCode.Insert, -- for pc related only enum keys documentation: https://create.roblox.com/docs/reference/engine/enums/KeyCode
    Assets = false, -- set to true if you want custom background asset
    MinHeight = 100,
    MaxHeight = 600,
    InitialHeight = 400,
    MinWidth = 300,
    MaxWidth = 800,
    InitialWidth = 500
}

for _, v in Enum.Font:GetEnumItems() do
    table.insert(stored_fonts, v.Name)
end

local config = (getfenv().gui_config) or nil -- custom config or fully ignore this
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow(config, gethui())
local window_name = library:SetWindowName("Random Mafia Shooter | By MjContegazxc") -- title to use for gui


local tabs = {
    -- creates "main" tab
    main = window:CreateTab("Main"),
    game = window:CreateTab("Game"),
    settings = window:CreateTab("Settings")
}


local sections = {
Info = tabs.main:CreateSection("Stats"),
  Main = tabs.main:CreateSection("Main"),
Visual = tabs.main:CreateSection("Visual"), 
Player = tabs.main:CreateSection("LocalPlayer"),
 Game = tabs.game:CreateSection("Game"),
Discord = tabs.game:CreateSection("Discord"),
}

local cash_label = sections.Info:CreateLabel("Cash: "..game:GetService("Players").LocalPlayer.leaderstats.Cash.Value)
local kills_label = sections.Info:CreateLabel("Kills: "..game:GetService("Players").LocalPlayer.leaderstats.Kills.Value)
local deaths_label = sections.Info:CreateLabel("Deaths: "..game:GetService("Players").LocalPlayer.leaderstats.Deaths.Value)

spawn(function()
    while true do
        cash_label:UpdateText("Cash: "..game:GetService("Players").LocalPlayer.leaderstats.Cash.Value)
        kills_label:UpdateText("Kills: "..game:GetService("Players").LocalPlayer.leaderstats.Kills.Value)
        deaths_label:UpdateText("Deaths: "..game:GetService("Players").LocalPlayer.leaderstats.Deaths.Value)
        wait(1)
    end
end)


local autoCollectConnection
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local originalCollisions = {}

sections.Info:CreateToggle("Auto Collect Cash", false, function(state)
	if state then
		if autoCollectConnection then
			autoCollectConnection:Disconnect()
		end

		local function simulateMoveTo(targetPos)
			local character = LocalPlayer.Character
			if not character then return end
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			local root = character:FindFirstChild("HumanoidRootPart")
			if not humanoid or not root then return end

			-- disable collisions temporarily to ghost through
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end

			-- use MoveTo for realistic motion
			local reached = false
			humanoid:MoveTo(targetPos)
			local connection
			connection = humanoid.MoveToFinished:Connect(function(success)
				reached = success
				connection:Disconnect()
			end)

			-- fallback timer
			local start = tick()
			while not reached and tick() - start < 5 do
				RunService.Heartbeat:Wait()
				if (root.Position - targetPos).Magnitude < 5 then
					reached = true
					break
				end
			end

			-- restore collisions
			for _, part in pairs(character:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
		end

		autoCollectConnection = RunService.Heartbeat:Connect(function()
			local character = LocalPlayer.Character
			if not character then return end
			local root = character:FindFirstChild("HumanoidRootPart")
			if not root then return end

			local nearestCash, nearestPrompt, nearestDist
			nearestDist = math.huge

			for _, v in pairs(workspace.Valuables:GetChildren()) do
				local mesh = v:FindFirstChild("MeshPart") or v:FindFirstChild("Part") or v:FindFirstChild("UnionOperation")
				if mesh then
					local prompt = mesh:FindFirstChild("ProximityPrompt")
					if prompt then
						local dist = (mesh.Position - root.Position).Magnitude
						if dist < nearestDist then
							nearestDist = dist
							nearestCash = mesh
							nearestPrompt = prompt
						end
					end
				end
			end

			if nearestCash and nearestPrompt then
				if nearestDist > 7 then
					simulateMoveTo(nearestCash.Position)
				elseif nearestDist <= 7 then
					fireproximityprompt(nearestPrompt)
				end
			end
		end)

		window:Notify("Auto Collect Cash", " Real-movement collection enabled!", 3)
	else
		if autoCollectConnection then
			autoCollectConnection:Disconnect()
			autoCollectConnection = nil
		end
		window:Notify("Auto Collect Cash", " Disabled", 3)
	end
end)

local autoTakeConnection
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

sections.Info:CreateToggle("Auto Take Cash", false, function(state)
	if state then
		if autoTakeConnection then
			autoTakeConnection:Disconnect()
		end

		autoTakeConnection = RunService.Heartbeat:Connect(function()
			local character = LocalPlayer.Character
			if not character then return end
			local root = character:FindFirstChild("HumanoidRootPart")
			if not root then return end

			local nearestPrompt, nearestDist = nil, math.huge
			local nearestPos = nil

			for _, v in pairs(workspace.Valuables:GetChildren()) do
				local mesh = v:FindFirstChildWhichIsA("BasePart", true)
				if mesh then
					local prompt = mesh:FindFirstChildOfClass("ProximityPrompt") or
								   v:FindFirstChildOfClass("ProximityPrompt") or
								   (v:FindFirstChild("Model") and v.Model:FindFirstChildOfClass("ProximityPrompt"))
					
					if prompt and prompt.Enabled then
						local dist = (root.Position - mesh.Position).Magnitude
						if dist < nearestDist then
							nearestDist = dist
							nearestPrompt = prompt
							nearestPos = mesh.Position
						end
					end
				end
			end

			if nearestPrompt and nearestPos then
				local maxDist = nearestPrompt.MaxActivationDistance or 10
				if nearestDist > maxDist - 2 then
					-- Step slightly closer if too far
					local moveDir = (nearestPos - root.Position).Unit
					root.CFrame = CFrame.new(nearestPos - moveDir * (maxDist - 1))
					task.wait(0.05)
				end

				-- Make sure prompt is visible/enabled
				if nearestPrompt.Enabled then
					-- Fire multiple times with small gaps to ensure registration
					for i = 1, 4 do
						pcall(fireproximityprompt, nearestPrompt)
						task.wait(0.15)
					end
				end
			end
		end)

		window:Notify("Auto Take Cash", " Smart prompt firing started!", 3)
	else
		if autoTakeConnection then
			autoTakeConnection:Disconnect()
			autoTakeConnection = nil
		end
		window:Notify("Auto Take Cash", " Auto take disabled", 3)
	end
end)

local fastCashConnection

sections.Info:CreateToggle("Cash Fast Take", false, function(state)
    if state then
        if fastCashConnection then
            fastCashConnection:Disconnect()
        end
        fastCashConnection = RunService.Heartbeat:Connect(function()
            for _, valuable in pairs(workspace.Valuables:GetChildren()) do
                if valuable:FindFirstChild("HoldDuration") then
                    valuable.HoldDuration.Value = 0.1
                end
            end
        end)
        window:Notify("Cash Fast Take", " Instant cash grab enabled!", 3)
    else
        if fastCashConnection then
            fastCashConnection:Disconnect()
            fastCashConnection = nil
        end
        window:Notify("Cash Fast Take", " Instant cash disabled", 3)
    end
end)

-- Aimbot Variables
local aimbotEnabled = false
local showFOV = false
local fovCircle
local fovRadius = 50
local targetPart = "Head"
local aimbotConnection

-- Create FOV Circle
local function createFOVCircle()
    if fovCircle then fovCircle:Remove() end
    
    fovCircle = Drawing.new("Circle")
    fovCircle.Visible = showFOV
    fovCircle.Radius = fovRadius
    fovCircle.Color = Color3.fromRGB(255, 255, 255)
    fovCircle.Thickness = 2
    fovCircle.Filled = false
    fovCircle.Transparency = 1
    fovCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
end

-- Aimbot Function
local function aimbot()
    local camera = workspace.CurrentCamera
    local localPlayer = game.Players.LocalPlayer
    local localChar = localPlayer.Character
    if not localChar then return end
    local localRoot = localChar:FindFirstChild("HumanoidRootPart")
    if not localRoot then return end
    
    local closestTarget = nil
    local closestDistance = math.huge
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Character then
            local char = player.Character
            local target = char:FindFirstChild(targetPart) or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("UpperTorso")
            if target then
                local screenPoint, onScreen = camera:WorldToViewportPoint(target.Position)
                if onScreen then
                    local mouse = game:GetService("UserInputService"):GetMouseLocation()
                    local distance = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                    
                    if distance < fovRadius and distance < closestDistance then
                        closestDistance = distance
                        closestTarget = target
                    end
                end
            end
        end
    end
    
    if closestTarget then
        camera.CFrame = CFrame.new(camera.CFrame.Position, closestTarget.Position)
    end
end

-- Aimbot Toggle
sections.Main:CreateToggle("Aimbot", false, function(state)
    aimbotEnabled = state
    if state then
        aimbotConnection = game:GetService("RunService").RenderStepped:Connect(aimbot)
        window:Notify("Aimbot", " Aimbot Enabled", 3)
    else
        if aimbotConnection then
            aimbotConnection:Disconnect()
        end
        window:Notify("Aimbot", " Aimbot Disabled", 3)
    end
end)

-- Show FOV Circle Toggle
sections.Main:CreateToggle("Show FOV Circle", false, function(state)
    showFOV = state
    if fovCircle then
        fovCircle.Visible = state
    end
end)

-- FOV Radius Dropdown
sections.Main:CreateDropdown(
    "FOV Radius",
    {"25", "50", "75", "100", "125", "150"},
    function(value)
        fovRadius = tonumber(value)
        if fovCircle then
            fovCircle.Radius = fovRadius
        end
    end,
    "50",
    false
)

-- Target Part Dropdown
sections.Main:CreateDropdown(
    "Target Part",
    {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"},
    function(value)
        targetPart = value
    end,
    "Head",
    false
)

-- FOV Color Picker
sections.Main:CreateColorpicker("FOV Color", function(color)
    if fovCircle then
        fovCircle.Color = color
    end
end)

-- Initialize FOV Circle
createFOVCircle()

-- Update FOV Circle Position
game:GetService("RunService").RenderStepped:Connect(function()
    if fovCircle then
        fovCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    end
end)

sections.Main:CreateDivider()


local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Store all guns and defaults
local AllGuns = {}

-- Function to deep copy defaults
local function GetGunDefaults(gunModule)
    local gunConfig = require(gunModule)
    local defaultsCopy = {}
    for tier = 1, #gunConfig do
        defaultsCopy[tier] = {}
        for stat, value in pairs(gunConfig[tier]) do
            defaultsCopy[tier][stat] = value
        end
    end
    return defaultsCopy
end

-- Apply modified stats to all guns
local function ApplyStatToAllGuns(statName, newValue)
    for gunModule, defaults in pairs(AllGuns) do
        local gunConfig = require(gunModule)
        for tier = 1, #gunConfig do
            if gunConfig[tier][statName] ~= nil then
                gunConfig[tier][statName] = newValue
            end
        end
    end
    print("⚙️ Updated stat:", statName, "→", newValue)
end

-- Register all guns
local function RegisterGuns()
    local categories = {"Primary", "Secondary", "Special", "Melee", "Throwable"}
    for _, folderName in pairs(categories) do
        local folder = ReplicatedStorage.Modules.GunConfigHandler:FindFirstChild(folderName)
        if folder then
            for _, gunModule in pairs(folder:GetChildren()) do
                if gunModule:IsA("ModuleScript") then
                    AllGuns[gunModule] = GetGunDefaults(gunModule)
                    print("✅ Registered gun:", gunModule.Name)
                end
            end
        end
    end
end

RegisterGuns()

-- Gather all unique stats
local UniqueStats = {}
for _, defaults in pairs(AllGuns) do
    local tierDefaults = defaults[1]
    for stat, value in pairs(tierDefaults) do
        if UniqueStats[stat] == nil then
            UniqueStats[stat] = value
        end
    end
end

-- === Create UI for each unique stat ===
for stat, defaultValue in pairs(UniqueStats) do
    local valueType = typeof(defaultValue)

    -- Boolean stats → Toggle
    if valueType == "boolean" then
        sections.Main:CreateToggle(stat, defaultValue, function(value)
            ApplyStatToAllGuns(stat, value)
        end)

    -- Number stats → Slider
    elseif valueType == "number" then
        local min = math.max(defaultValue / 10, 0.001)
        local max = defaultValue * 10
        sections.Main:CreateSlider(
            stat,
            min,
            max,
            defaultValue,
            false,
            function(value)
                ApplyStatToAllGuns(stat, value)
            end
        )
    end
end

print("Hello Pussy By Mjcontegazxc)")

local noSpreadEnabled = false
local originalFireFunction = nil
local originalGunConfig = nil
local originalGrabGunConfig = nil

sections.Main:CreateToggle("No Spread & No Recoil", false, function(state)
    noSpreadEnabled = state
    
    if state then
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local GunScript = require(workspace.Players[LocalPlayer.Name].Weapons.Secondary.Gun.GunScript)

        for i = 1, debug.getinfo(GunScript).nparams do
            local name, value = debug.getupvalue(GunScript, i)
            if name == "v_u_157" then
                originalFireFunction = value
            end
            if name == "v_u_36" then
                originalGunConfig = value
            end
        end

        if originalGunConfig then
            originalGunConfig.Recoil = 0
            originalGunConfig.NormalSpread = 0
            originalGunConfig.RunSpread = 0
        end

        if originalFireFunction then
            debug.setupvalue(GunScript, debug.getupvalue(GunScript, "v_u_157"), function()
                if not originalGunConfig then return end
                
                local GunConfig = originalGunConfig
                local Character = LocalPlayer.Character
                if not Character then return end
                
                local Humanoid = Character:FindFirstChild("Humanoid")
                if not Humanoid or Humanoid.Health <= 0 then return end
                
                if GunConfig.Ammo <= 0 then return end
                
                local SpreadVector = Vector3.new(0, 0, 0)
                
                local ReplicatedNetwork = require(ReplicatedStorage.Framework.Network)
                ReplicatedNetwork.Fire:Fire()
                
                local Camera = workspace.CurrentCamera
                if Camera then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + Camera.CFrame.LookVector * 20)
                end
                
                task.wait(GunConfig.FireRate)
            end)
        end

        local GunConfigHandler = require(ReplicatedStorage.Modules.GunConfigHandler)
        originalGrabGunConfig = GunConfigHandler.GrabGunConfig

        GunConfigHandler.GrabGunConfig = function(gunName, tier)
            local config = originalGrabGunConfig(gunName, tier)
            
            config.Recoil = 0
            config.NormalSpread = 0
            config.RunSpread = 0
            
            return config
        end

        window:Notify("No Spread & No Recoil", "✅ Activated - Perfect accuracy!", 3)
    else
        if originalGunConfig then
            originalGunConfig.Recoil = originalGunConfig.Recoil or 1
            originalGunConfig.NormalSpread = originalGunConfig.NormalSpread or 1
            originalGunConfig.RunSpread = originalGunConfig.RunSpread or 1
        end

        if originalFireFunction then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local GunScript = require(workspace.Players[LocalPlayer.Name].Weapons.Secondary.Gun.GunScript)
            
            for i = 1, debug.getinfo(GunScript).nparams do
                local name, value = debug.getupvalue(GunScript, i)
                if name == "v_u_157" then
                    debug.setupvalue(GunScript, debug.getupvalue(GunScript, "v_u_157"), originalFireFunction)
                    break
                end
            end
        end

        if originalGrabGunConfig then
            local GunConfigHandler = require(ReplicatedStorage.Modules.GunConfigHandler)
            GunConfigHandler.GrabGunConfig = originalGrabGunConfig
        end

        window:Notify("No Spread & No Recoil", "❌ Deactivated - Normal gun behavior", 3)
    end
end)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local valuablesFolder = workspace:WaitForChild("Valuables")
local espList = {}
local espEnabled = false

local function createESP(targetPart)
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = targetPart
    billboard.Size = UDim2.new(0, 100, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 2, 0)
    billboard.AlwaysOnTop = true
    local label = Instance.new("TextLabel")
    label.Parent = billboard
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(0, 255, 255)
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true
    label.Text = "..."
    billboard.Parent = targetPart
    espList[targetPart] = {gui = billboard, label = label}
end

local function setupAllESP()
    for _, obj in ipairs(valuablesFolder:GetDescendants()) do
        if obj:IsA("ProximityPrompt") and obj.Parent and obj.Parent:IsA("MeshPart") then
            local meshPart = obj.Parent
            if not espList[meshPart] then
                createESP(meshPart)
            end
        end
    end
end

local function cleanupESP()
    for part, data in pairs(espList) do
        if not part or not part.Parent then
            if data.gui then
                data.gui:Destroy()
            end
            espList[part] = nil
        end
    end
end

RunService.RenderStepped:Connect(function()
    if not espEnabled then
        for _, data in pairs(espList) do
            if data.gui then
                data.gui.Enabled = false
            end
        end
        return
    end
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    setupAllESP()
    cleanupESP()
    for part, data in pairs(espList) do
        if data.gui then
            data.gui.Enabled = true
            local distance = (root.Position - part.Position).Magnitude
            data.label.Text = string.format("💰 %.1f studs", distance)
            data.label.TextColor3 = distance < 15 and Color3.fromRGB(0, 255, 0)
                or (distance < 40 and Color3.fromRGB(255, 255, 0)
                or Color3.fromRGB(255, 0, 0))
        end
    end
end)

sections.Visual:CreateToggle("Cash ESP", false, function(value)
    espEnabled = value
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local enemiesFolder = workspace:WaitForChild("Enemies")
local espList = {}
local espEnabled = false

local function createESP(enemy)
    if not enemy:FindFirstChild("HumanoidRootPart") then return end
    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = enemy.HumanoidRootPart
    billboard.Size = UDim2.new(0, 150, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true
    local label = Instance.new("TextLabel")
    label.Parent = billboard
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 50, 50)
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true
    label.Text = enemy.Name
    billboard.Parent = enemy
    local highlight = Instance.new("Highlight")
    highlight.Parent = enemy
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.Enabled = true
    espList[enemy] = {billboard = billboard, label = label, highlight = highlight}
end

local function cleanupESP()
    for enemy, data in pairs(espList) do
        if not enemy or not enemy.Parent then
            if data.billboard then data.billboard:Destroy() end
            if data.highlight then data.highlight:Destroy() end
            espList[enemy] = nil
        end
    end
end

local function setupAllESP()
    for _, enemy in ipairs(enemiesFolder:GetChildren()) do
        if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") then
            if not espList[enemy] then
                createESP(enemy)
            end
        end
    end
end

RunService.RenderStepped:Connect(function()
    if not espEnabled then
        for _, data in pairs(espList) do
            if data.billboard then data.billboard.Enabled = false end
            if data.highlight then data.highlight.Enabled = false end
        end
        return
    end
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    setupAllESP()
    cleanupESP()
    for enemy, data in pairs(espList) do
        if enemy:FindFirstChild("HumanoidRootPart") then
            if data.billboard then data.billboard.Enabled = true end
            if data.highlight then data.highlight.Enabled = true end
            local dist = (root.Position - enemy.HumanoidRootPart.Position).Magnitude
            data.label.Text = string.format("%s | %.1f studs", enemy.Name, dist)
            if dist < 25 then
                data.label.TextColor3 = Color3.fromRGB(0, 255, 0)
                data.highlight.FillColor = Color3.fromRGB(0, 255, 0)
            elseif dist < 60 then
                data.label.TextColor3 = Color3.fromRGB(255, 255, 0)
                data.highlight.FillColor = Color3.fromRGB(255, 255, 0)
            else
                data.label.TextColor3 = Color3.fromRGB(255, 0, 0)
                data.highlight.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end)

sections.Visual:CreateToggle("Enemy ESP + Chams", false, function(value)
    espEnabled = value
    if value then
        window:Notify("ESP Enabled", "Enemy ESP + Chams Activated", 3)
    else
        window:Notify("ESP Disabled", "Enemy ESP + Chams Deactivated", 3)
    end
end)


--// ⚙️ CIVILIAN ESP SYSTEM WITH TOGGLE + COLOR PICKER + NOTIFY

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local civiliansFolder = workspace:WaitForChild("Map"):WaitForChild("Civilians")
local espList = {}
local espEnabled = false
local chosenColor = Color3.fromRGB(50, 200, 255)

------------------------------------------------------
-- 🧱 ESP CREATION
------------------------------------------------------
local function createESP(model)
    local root = model:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Adornee = root
    billboard.Size = UDim2.new(0, 150, 0, 40)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local label = Instance.new("TextLabel")
    label.Parent = billboard
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.SourceSansBold
    label.TextScaled = true
    label.TextColor3 = chosenColor
    label.Text = model.Name

    billboard.Parent = model
    espList[model] = {billboard = billboard, label = label}

    local highlight = Instance.new("Highlight")
    highlight.Parent = model
    highlight.FillColor = chosenColor
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.Enabled = true
    espList[model].highlight = highlight
end

------------------------------------------------------
-- 🧹 CLEANUP
------------------------------------------------------
local function cleanupESP()
    for model, data in pairs(espList) do
        if not model or not model.Parent then
            if data.billboard then data.billboard:Destroy() end
            if data.highlight then data.highlight:Destroy() end
            espList[model] = nil
        end
    end
end

------------------------------------------------------
-- 🔍 SCANNER
------------------------------------------------------
local function setupAllESP()
    for _, model in ipairs(civiliansFolder:GetChildren()) do
        if model:IsA("Model") and model:FindFirstChild("HumanoidRootPart") then
            if not espList[model] then
                createESP(model)
            end
        end
    end
end

------------------------------------------------------
-- 🔁 LOOP
------------------------------------------------------
RunService.RenderStepped:Connect(function()
    if not espEnabled then return end

    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    setupAllESP()
    cleanupESP()

    for model, data in pairs(espList) do
        local hrp = model:FindFirstChild("HumanoidRootPart")
        if hrp then
            local dist = (root.Position - hrp.Position).Magnitude
            data.label.Text = string.format("%s | %.1f studs", model.Name, dist)

            if dist < 25 then
                data.label.TextColor3 = Color3.fromRGB(0, 255, 0)
                data.highlight.FillColor = Color3.fromRGB(0, 255, 0)
            elseif dist < 60 then
                data.label.TextColor3 = Color3.fromRGB(255, 255, 0)
                data.highlight.FillColor = Color3.fromRGB(255, 255, 0)
            else
                data.label.TextColor3 = chosenColor
                data.highlight.FillColor = chosenColor
            end
        end
    end
end)

------------------------------------------------------
-- 🎛️ UI INTEGRATION
------------------------------------------------------
sections.Visual:CreateToggle("Civilians ESP", nil, function(state)
    espEnabled = state
    if espEnabled then
        window:Notify("Civilians ESP", "👁️ ESP Activated", 5)
        setupAllESP()
    else
        window:Notify("Civilians ESP", "❌ ESP Deactivated", 5)
        for _, data in pairs(espList) do
            if data.billboard then data.billboard:Destroy() end
            if data.highlight then data.highlight:Destroy() end
        end
        espList = {}
    end
end)

sections.Visual:CreateColorpicker("ESP Color", function(color)
    chosenColor = color
    for _, data in pairs(espList) do
        if data.label then data.label.TextColor3 = color end
        if data.highlight then data.highlight.FillColor = color end
    end
    window:Notify("ESP Color Updated", "🎨 Color Changed", 4)
end)



sections.Player:CreateToggle("Anti AFK", true, function(state)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local vu = game:GetService("VirtualUser")

    if state and not _G.AntiAfkConnection then
        _G.AntiAfkConnection = LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        _G.AntiAfkHeartbeat = task.spawn(function()
            while _G.AntiAfkConnection do
                vu:CaptureController()
                vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(60)
            end
        end)
    elseif not state and _G.AntiAfkConnection then
        _G.AntiAfkConnection:Disconnect()
        _G.AntiAfkConnection = nil
        if _G.AntiAfkHeartbeat then
            task.cancel(_G.AntiAfkHeartbeat)
            _G.AntiAfkHeartbeat = nil
        end
    end
end)

sections.Player:CreateToggle("Auto Walk", false, function(state)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local AutoWalkEnabled = state
    local WalkSpeed = 20

    local function startAutoWalk()
        task.spawn(function()
            while AutoWalkEnabled do
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if humanoid and hrp then
                        humanoid.WalkSpeed = WalkSpeed
                        local forwardVector = hrp.CFrame.LookVector
                        hrp.CFrame = hrp.CFrame + forwardVector * 2
                    end
                end
                task.wait(0.1)
            end
        end)
    end

    if state then
        startAutoWalk()
    else
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
            end
        end
    end
end)

sections.Player:CreateToggle("Anti Idle", true, function(state)
    local VirtualUser = game:GetService("VirtualUser")
    local AntiIdleEnabled = state

    local function startAntiIdle()
        task.spawn(function()
            while AntiIdleEnabled do
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
                task.wait(30)
            end
        end)
    end

    if state then
        startAntiIdle()
    end
end)

sections.Player:CreateToggle("Infinite Jump", true, function(state)
    if state and not _G.JumpConnection then
        _G.JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            local lp = game:GetService("Players").LocalPlayer
            if lp.Character then
                local hum = lp.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum:ChangeState("Jumping")
                end
            end
        end)
    elseif not state and _G.JumpConnection then
        _G.JumpConnection:Disconnect()
        _G.JumpConnection = nil
    end
end)

sections.Player:CreateToggle("Noclip", true, function(state)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    if state and not _G.NoclipConnection then
        _G.NoclipConnection = RunService.Stepped:Connect(function()
            if lp.Character then
                for _, part in pairs(lp.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    elseif not state and _G.NoclipConnection then
        _G.NoclipConnection:Disconnect()
        _G.NoclipConnection = nil
    end
end)

sections.Player:CreateSlider(
    "Walk Speed",
    16,
    200,
    16,
    true,
    function(value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character then
            local hum = lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = value end
        end
    end
)

sections.Player:CreateSlider(
    "Gravity Delay",
    1,
    5,
    1,
    true,
    function(value)
        workspace.Gravity = 196.2 * value
    end
)

sections.Player:CreateSlider(
    "Jump Power",
    50,
    200,
    50,
    true,
    function(value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
            lp.Character.Humanoid.JumpPower = value
        end
    end
)

sections.Player:CreateSlider(
    "Field of View",
    70,
    120,
    70,
    true,
    function(value)
        workspace.CurrentCamera.FieldOfView = value
    end
)


sections.Player:CreateLabel("This script modifies your local player's properties and functions.\nIt only affects YOUR character and doesn't impact other players.\n\nWhat LocalPlayer controls:\n• Your character's movement speed and jumping\n• Your camera field of view\n• Your anti-afk status\n• Your noclip collision\n• Your gravity settings\n\nAll changes are client-side only and temporary.")


sections.Game:CreateButton("Rejoin Game", function()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    TeleportService:Teleport(game.PlaceId, player)
end)

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ServerID = ""

sections.Game:CreateTextBox("Server ID", "Enter server ID here", true, function(text)
    ServerID = text
end)

sections.Game:CreateToggle("Auto Join Server", false, function(state)
    if state then
        window:Notify("Auto Join", "Enabled - Joining server ID: "..ServerID, 4)
        if ServerID ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerID, LocalPlayer)
        else
            window:Notify("Auto Join", "No Server ID entered!", 4)
        end
    else
        window:Notify("Auto Join", "Disabled", 4)
    end
end)


sections.Discord:CreateButton("Join Discord", function()
    setclipboard("https://discord.gg/6vrw6tzex")
    window:Notify("Discord", "Link copied to clipboard!\nPaste in your browser to join: discord.gg/6vrw6tzex", 7)
end)


sections.Discord:CreateLabel("💬 Join our Discord community!\nGet script updates, new features, and support directly from the devs.")


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local watermark = library:Hud()

local lastUpdate = 0
local fps = 0

RunService.RenderStepped:Connect(function(dt)
    lastUpdate += 1
    if lastUpdate >= 10 then
        fps = math.floor(1 / dt)
        lastUpdate = 0
    end

    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    local time = os.date("%Y-%m-%d %H:%M:%S", os.time())

    watermark:SetText(
        string.format("%s | FPS: %d | Ping: %dms | %s", LocalPlayer.Name, fps, ping, time)
    )
end)


local config_manager = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/ConfigManager.lua"))()
config_manager:SetLibrary(library)
config_manager:SetWindow(window)
config_manager:SetFolder("Examnple Name") -- name for folder where configs will be stored
config_manager:BuildConfigSection(tabs.settings)
config_manager:LoadAutoloadConfig()
window:SetBackground("114178849342027") -- if you turned on assets set the background id here
window:SetTileOffset(100)
window:SetTileScale(0.5) -- on how large background asset should be
window:SetBackgroundColor(Color3.fromRGB(40, 40, 40))
window:SetBackgroundTransparency(0.5) -- on how transparent background should be for asset