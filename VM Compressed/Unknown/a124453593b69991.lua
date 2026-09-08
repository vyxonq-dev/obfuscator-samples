local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local localPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- Settings
local settings = {
    AimbotEnabled = false,
    ShowFOV = true,
    FOVRadius = 100,
    FOVColor = Color3.fromRGB(255, 0, 0),
    FOVTransparency = 0.7,
    FOVThickness = 1,
    WallCheck = false,
    UIKey = Enum.KeyCode.K,
    Smoothness = 0.2,
    AimPart = "Head", -- Default aim part
    ESPEnabled = false,
    ChamColor = Color3.fromRGB(0, 255, 0),
    ChamTransparency = 0.5,
    CameraFOV = Camera.FieldOfView,
    Walkspeed = 16,
    Jumppower = 50
}

-- Chams Table
local chams = {}

-- Debug Function
local function debugPrint(message)
    print("[SkidSoftworks Debug] " .. tostring(message))
end

-- Chams Functions
local function applyChams(zombie)
    if chams[zombie] or not zombie:IsA("Model") or not zombie:FindFirstChild("Head") or not zombie:FindFirstChild("HumanoidRootPart") then
        debugPrint("Failed to apply chams to " .. tostring(zombie) .. ": Invalid model or missing parts")
        return
    end
    local highlight = Instance.new("Highlight")
    highlight.Adornee = zombie
    highlight.FillTransparency = 1
    highlight.OutlineColor = settings.ChamColor
    highlight.OutlineTransparency = settings.ChamTransparency
    highlight.Parent = zombie
    chams[zombie] = highlight
    debugPrint("Applied chams to " .. zombie.Name)
end

local function removeChams(zombie)
    if chams[zombie] then
        chams[zombie]:Destroy()
        chams[zombie] = nil
        debugPrint("Removed chams from " .. tostring(zombie))
    end
end

local function updateESP()
    local zombiesFolder = game.Workspace:FindFirstChild("Zombies")
    if not zombiesFolder then
        debugPrint("Zombies folder not found")
        return
    end
    for _, zombie in pairs(zombiesFolder:GetChildren()) do
        if zombie:IsA("Model") and zombie:FindFirstChild("Head") and zombie:FindFirstChild("HumanoidRootPart") then
            if settings.ESPEnabled then
                applyChams(zombie)
                if chams[zombie] then
                    chams[zombie].OutlineColor = settings.ChamColor
                    chams[zombie].OutlineTransparency = settings.ChamTransparency
                end
            else
                removeChams(zombie)
            end
        end
    end
end

local function monitorZombies()
    local zombiesFolder = game.Workspace:FindFirstChild("Zombies")
    if not zombiesFolder then
        debugPrint("Zombies folder not found for monitoring")
        return
    end
    zombiesFolder.ChildAdded:Connect(function(zombie)
        if settings.ESPEnabled and zombie:IsA("Model") and zombie:FindFirstChild("Head") and zombie:FindFirstChild("HumanoidRootPart") then
            applyChams(zombie)
        end
    end)
    zombiesFolder.ChildRemoved:Connect(function(zombie)
        removeChams(zombie)
    end)
end

-- Aimbot Functions
local function isInFOV(screenPosition)
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local distance = (screenPosition - center).Magnitude
    return distance <= settings.FOVRadius
end

local function wallCheck(startPos, endPos)
    if not settings.WallCheck then return true end
    local raycastParams = RaycastParams.new()
    raycastParams.FilterDescendantsInstances = {localPlayer.Character}
    raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
    local raycastResult = workspace:Raycast(startPos, (endPos - startPos).Unit * (endPos - startPos).Magnitude, raycastParams)
    if raycastResult then
        local hitPart = raycastResult.Instance
        local model = hitPart:FindFirstAncestorOfClass("Model")
        return model and model:FindFirstChild("Head") and model:FindFirstChild("HumanoidRootPart")
    end
    return true
end

local function aimAtNearestZombie()
    local character = localPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        debugPrint("Player character or HumanoidRootPart not found")
        return
    end
    local closestZombie, closestDistance, closestScreenDistance = nil, math.huge, math.huge
    local zombiesFolder = game.Workspace:FindFirstChild("Zombies")
    if not zombiesFolder then
        debugPrint("Zombies folder not found for aimbot")
        return
    end
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    for _, zombie in pairs(zombiesFolder:GetChildren()) do
        if zombie:IsA("Model") and zombie:FindFirstChild("Head") and zombie:FindFirstChild("HumanoidRootPart") then
            local aimPart = zombie:FindFirstChild(settings.AimPart) or zombie:FindFirstChild("Head")
            if not aimPart then
                debugPrint("Aim part " .. settings.AimPart .. " not found in " .. zombie.Name .. ", defaulting to Head")
                aimPart = zombie:FindFirstChild("Head")
            end
            local targetPos = aimPart.Position
            local screenPos, onScreen = Camera:WorldToViewportPoint(targetPos)
            if onScreen and isInFOV(Vector2.new(screenPos.X, screenPos.Y)) and wallCheck(character.HumanoidRootPart.Position, targetPos) then
                local screenVector = Vector2.new(screenPos.X, screenPos.Y)
                local screenDistance = (screenVector - screenCenter).Magnitude
                local distance = (character.HumanoidRootPart.Position - targetPos).Magnitude
                if screenDistance < closestScreenDistance or (screenDistance == closestScreenDistance and distance < closestDistance) then
                    closestDistance = distance
                    closestScreenDistance = screenDistance
                    closestZombie = zombie
                end
            end
        end
    end
    if closestZombie then
        if not mousemoverel then
            debugPrint("mousemoverel not supported by executor")
            return
        end
        local aimPart = closestZombie:FindFirstChild(settings.AimPart) or closestZombie:FindFirstChild("Head")
        local targetPosition = aimPart.Position
        local screenPos = Camera:WorldToViewportPoint(targetPosition)
        local mouse = UserInputService:GetMouseLocation()
        local newPos = Vector2.new(screenPos.X, screenPos.Y)
        local delta = newPos - mouse
        mousemoverel(delta.X * settings.Smoothness, delta.Y * settings.Smoothness) -- Always sticky aim
        debugPrint("Aiming at " .. closestZombie.Name .. "'s " .. settings.AimPart .. " at screen position " .. tostring(newPos))
    end
end

local Window = Library.CreateLib("Skid Softworks - Zombie Story", "Serpent")
local AimbotTab = Window:NewTab("Aimbot")
local ESPTab = Window:NewTab("ESP")
local ModTab = Window:NewTab("Gun Mods")
local ViewTab = Window:NewTab("View Model")

local AimbotSection = AimbotTab:NewSection("Aimbot Section")
local ModSection = ModTab:NewSection("Gun Mods Section")
local ViewSection = ViewTab:NewSection("View Models Section")

local ESPSection = ESPTab:NewSection("Esp Section")

local fovCircle
local function createFOVCircle()
    if fovCircle then
        fovCircle:Destroy()
    end
    fovCircle = Instance.new("Frame")
    fovCircle.Size = UDim2.new(0, settings.FOVRadius * 2, 0, settings.FOVRadius * 2)
    fovCircle.Position = UDim2.new(0.5, -settings.FOVRadius, 0.5, -settings.FOVRadius)
    fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
    fovCircle.BackgroundTransparency = 1
    fovCircle.Visible = settings.ShowFOV
    fovCircle.Parent = game:GetService("CoreGui") or localPlayer:WaitForChild("PlayerGui")
    local circleOutline = Instance.new("UIStroke")
    circleOutline.Color = settings.FOVColor
    circleOutline.Transparency = settings.FOVTransparency
    circleOutline.Thickness = settings.FOVThickness
    circleOutline.Parent = fovCircle
    Instance.new("UICorner", fovCircle).CornerRadius = UDim.new(1, 0)
    debugPrint("FOV circle created")
end

-- Aimbot Tab Elements
AimbotSection:NewToggle("Aimbot Enabled", "Enable or disable aimbot", function(state)
    settings.AimbotEnabled = state
    debugPrint("Aimbot Enabled set to " .. tostring(state))
end)

AimbotSection:NewToggle("Show FOV Circle", "Show the aimbot FOV circle", function(state)
    settings.ShowFOV = state
    if fovCircle then
        fovCircle.Visible = state
    end
    debugPrint("Show FOV Circle set to " .. tostring(state))
end)

AimbotSection:NewSlider("FOV Size", "Adjust aimbot FOV radius", 200, 50, function(value)
    settings.FOVRadius = value
    if fovCircle then
        fovCircle.Size = UDim2.new(0, value * 2, 0, value * 2)
        fovCircle.Position = UDim2.new(0.5, -value, 0.5, -value)
    end
    debugPrint("FOV Size set to " .. value)
end)

AimbotSection:NewDropdown("Aim Part", "Select the part to aim at", {"Head", "HumanoidRootPart"}, function(option)
    settings.AimPart = option
    debugPrint("Aim Part set to " .. option)
end)

AimbotSection:NewToggle("Wall Check", "Check for walls in aimbot", function(state)
    settings.WallCheck = state
    debugPrint("Wall Check set to " .. tostring(state))
end)

AimbotSection:NewSlider("Smoothness", "Adjust aimbot smoothness", 1, 0.1, function(value)
    settings.Smoothness = value
    debugPrint("Smoothness set to " .. value)
end)

-- ESP Tab Elements
ESPSection:NewToggle("ESP Enabled", "Enable or disable ESP", function(state)
    settings.ESPEnabled = state
    updateESP()
    debugPrint("ESP Enabled set to " .. tostring(state))
end)

ESPSection:NewDropdown("Cham Color", "Select ESP highlight color", {"Green", "Red", "Blue", "Yellow"}, function(option)
    local colors = {
        Green = Color3.fromRGB(0, 255, 0),
        Red = Color3.fromRGB(255, 0, 0),
        Blue = Color3.fromRGB(0, 0, 255),
        Yellow = Color3.fromRGB(255, 255, 0)
    }
    settings.ChamColor = colors[option]
    updateESP()
    debugPrint("Cham Color set to " .. option)
end)


ModSection:NewButton("No Recoil", "ButtonInfo", function()
    --// No Recoil Modifier by ChatGPT
-- Works with ZS_Framework based on provided paths

local function findWeaponTables()
	local found = {}
	for _, obj in ipairs(getgc(true)) do
		if type(obj) == "table" and rawget(obj, "Config") and rawget(obj, "WeaponId") then
			table.insert(found, obj)
		end
	end
	return found
end

-- Hook recoil function to disable recoil functionally
local function hookNoRecoil(weaponTable)
	if weaponTable.Recoil and type(weaponTable.Recoil) == "function" then
		hookfunction(weaponTable.Recoil, function(...) 
			-- No recoil
		end)
	end
end

-- Only remove recoil
local function removeRecoil(weaponTable)
	local config = weaponTable.Config
	if not config then return end

	-- Set recoil-related values to 0
	config.Recoil = 0
	config.HorizontalRecoil = 0
	config.VerticalRecoil = 0
	
	-- Optional: disable camera shake
	if config.CameraShake then
		config.CameraShake = nil
	end

	-- Hook function if there's a recoil method
	hookNoRecoil(weaponTable)
	
	print("[No Recoil Modifier] Modified:", weaponTable.Name or weaponTable.WeaponId)
end

-- Continuously scan and remove recoil
task.spawn(function()
	while true do
		local weapons = findWeaponTables()
		for _, wep in ipairs(weapons) do
			pcall(removeRecoil, wep)
		end
		task.wait(1)
	end
end)

end)

ModSection:NewButton("No Spread", "ButtonInfo", function()
    --// No Spread Modifier by ChatGPT
-- Works with ZS_Framework based on provided paths

local function findWeaponTables()
	local found = {}
	for _, obj in ipairs(getgc(true)) do
		if type(obj) == "table" and rawget(obj, "Config") and rawget(obj, "WeaponId") then
			table.insert(found, obj)
		end
	end
	return found
end

-- Only remove spread
local function removeSpread(weaponTable)
	local config = weaponTable.Config
	if not config then return end

	-- Set spread-related value to 0
	config.Spread = 0

	print("[No Spread Modifier] Modified:", weaponTable.Name or weaponTable.WeaponId)
end

-- Continuously scan and remove spread
task.spawn(function()
	while true do
		local weapons = findWeaponTables()
		for _, wep in ipairs(weapons) do
			pcall(removeSpread, wep)
		end
		task.wait(1)
	end
end)
end)


local selectedMaterial = "ForceField"
local selectedColor = Color3.fromRGB(255, 255, 255)
local rainbowEnabled = false
local rainbowSpeed = 1
local applying = false
local applyTask

local ignoreFolder = workspace:FindFirstChild("Ignore")
if not ignoreFolder then return end

ViewSection:NewDropdown("Material", "Choose Material", {"ForceField","Neon","Plastic","SmoothPlastic","Metal","Wood","Glass","Ice","DiamondPlate","Fabric","Grass","Slate","Concrete","Granite","Brick","Pebble","CorrodedMetal"}, function(mat)
	selectedMaterial = mat
end)

ViewSection:NewColorPicker("Color", "Pick Color", selectedColor, function(color)
	selectedColor = color
end)

ViewSection:NewToggle("Rainbow", "Toggle Rainbow Effect", function(state)
	rainbowEnabled = state
end)

ViewSection:NewSlider("Rainbow Speed", "Speed of Rainbow Color Change", 10, 0.1, function(val)
	rainbowSpeed = val
end)

ViewSection:NewToggle("Apply", "Toggle continuous apply", function(state)
	applying = state
	if applying then
		applyTask = task.spawn(function()
			while applying do
				local matEnum = Enum.Material[selectedMaterial]
				for _, model in pairs(ignoreFolder:GetChildren()) do
					if model:IsA("Model") then
						-- Apply to all BaseParts
						for _, obj in pairs(model:GetDescendants()) do
							if obj:IsA("BasePart") then
								obj.Material = matEnum
								if rainbowEnabled then
									local hue = (tick() * rainbowSpeed) % 1
									obj.Color = Color3.fromHSV(hue, 1, 1)
								else
									obj.Color = selectedColor
								end
							end
						end

						-- Check if model has arms
						local hasLeftArm = model:FindFirstChild("Left Arm") or model:FindFirstChild("LeftArm")
						local hasRightArm = model:FindFirstChild("Right Arm") or model:FindFirstChild("RightArm")
						if hasLeftArm or hasRightArm then
							for _, armName in pairs({"Left Arm", "Right Arm", "LeftArm", "RightArm"}) do
								local arm = model:FindFirstChild(armName)
								if arm then
									if arm:IsA("BasePart") then
										arm.Material = matEnum
										if rainbowEnabled then
											local hue = (tick() * rainbowSpeed) % 1
											arm.Color = Color3.fromHSV(hue, 1, 1)
										else
											arm.Color = selectedColor
										end
									else
										for _, part in pairs(arm:GetDescendants()) do
											if part:IsA("BasePart") then
												part.Material = matEnum
												if rainbowEnabled then
													local hue = (tick() * rainbowSpeed) % 1
													part.Color = Color3.fromHSV(hue, 1, 1)
												else
													part.Color = selectedColor
												end
											end
										end
									end
								end
							end
						else
							for _, partName in pairs({"Head", "HumanoidRootPart"}) do
								local part = model:FindFirstChild(partName)
								if part and part:IsA("BasePart") then
									part.Material = matEnum
									if rainbowEnabled then
										local hue = (tick() * rainbowSpeed) % 1
										part.Color = Color3.fromHSV(hue, 1, 1)
									else
										part.Color = selectedColor
									end
								end
							end
						end
					end
				end
				task.wait(0.1)
			end
		end)
	else
		if applyTask then
			applyTask = nil
		end
	end
end)


-- Initialize
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == settings.UIKey then
        Library:ToggleUI()
        debugPrint("UI toggled")
    end
end)

localPlayer.CharacterAdded:Connect(function(character)
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.WalkSpeed = settings.Walkspeed
        humanoid.JumpPower = settings.Jumppower
        debugPrint("Character initialized with Walkspeed: " .. settings.Walkspeed .. ", Jumppower: " .. settings.Jumppower)
    else
        debugPrint("Failed to find Humanoid in character")
    end
end)

RunService.RenderStepped:Connect(function()
    if settings.AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        aimAtNearestZombie()
    end
    if settings.ESPEnabled then
        updateESP()
    end
end)

Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
    if fovCircle then
        fovCircle.Size = UDim2.new(0, settings.FOVRadius * 2, 0, settings.FOVRadius * 2)
        fovCircle.Position = UDim2.new(0.5, -settings.FOVRadius, 0.5, -settings.FOVRadius)
        debugPrint("FOV circle updated for viewport change")
    end
end)

-- Initial Setup
createFOVCircle()
monitorZombies()
debugPrint("Script initialized successfully")
