if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> ...any) return f; end;
local newcclosure = newcclosure or clonefunction;
local executor = identifyexecutor and identifyexecutor() or "Your executor";

if not (hookfunction and (filtergc or (getgc and debug.getconstants))) then
    local err = executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not (filtergc and (getgc and debug.getconstants)) and "filtergc getgc debug.getconstants" or "")
    return error(err);
end;

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));
local RunService: RunService = cloneref(game:GetService("RunService"));
local GuiService: GuiService = cloneref(game:GetService("GuiService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local filter: (script: (LocalScript | ModuleScript)?, strict: boolean, ...any) -> ((...any) -> ...any) = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/FILTERGC_LIBRARY/main.luau"))();

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local cont = plr.PlayerScripts:FindFirstChild("Controller");
if not cont then
    local err = "Script needs updating";
    return warn(err);
end;
cont = filter(cont, false, "Bullet", "EasterEggThing", "SCP-066");
if not cont then
    local err = "Failed to retrieve function";
    return warn(err);
end;

local deltaEnv = (getrenv and getrenv() or getgenv and getgenv() or _G)
local deltaShared = deltaEnv and deltaEnv.shared or nil
local deltaFramework = deltaShared and deltaShared.Delta or nil

local deltaIsRK = deltaFramework and deltaFramework.Get and function(player, enemy)
    local ok, isFriendly, isSpawnKill = pcall(function()
        return deltaFramework:Get('IsRK')(player, enemy)
    end)
    if not ok then return true end
    return isFriendly == false
end or nil

local function canTargetBeKilled(targetPlayer)
    if not targetPlayer then return true end
    if not deltaIsRK then return true end
    local player = (deltaEnv and deltaEnv.shared and deltaEnv.shared.Delta and deltaEnv.shared.Delta.Player) or nil
    if not player then return true end
    return deltaIsRK(player, targetPlayer)
end

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;
rp.RespectCanCollide = true;

local function getCameraRelativeSurfacePoints(part: BasePart, cameraCFrame: CFrame): {Vector3}
	local center = part.Position
	local right = cameraCFrame.RightVector
	local up = cameraCFrame.UpVector

	-- Scale so the offsets roughly reach the extremities
	-- (half the longest axis is a solid starting point)
	local scale = math.max(part.Size.X, part.Size.Y, part.Size.Z) * 0.55

	local offsets = {
		(right + up).Unit,
		(right - up).Unit,
		(-right + up).Unit,
		(-right - up).Unit,
	}

	local points = table.create(4)
	for i, dir in offsets do
		-- Point outside the part in camera-plane corner direction
		local outside = center + dir * scale
		-- Project onto the actual surface
		points[i] = part:GetClosestPointOnSurface(outside)
	end

	return points
end

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
	local char = plr.Character
	if not (char and part) then
		return false, nil
	end

	rp.FilterDescendantsInstances = {char}

	-- 1. Center (your original check)
	local dir = part.Position - origin
	local result = workspace:Raycast(origin, dir, rp)
	if not result then
		return true, nil
	end
	if result.Instance:IsDescendantOf(part.Parent) then
		return true, result.Instance
	end

	-- 2. Four camera-relative surface points
	local camCF = workspace.CurrentCamera.CFrame
	local cornerPoints = getCameraRelativeSurfacePoints(part, camCF)

	for _, point in cornerPoints do
		local cornerDir = point - origin
		local cornerResult = workspace:Raycast(origin, cornerDir, rp)

		if not cornerResult then
			return true, nil
		end

		if cornerResult.Instance:IsDescendantOf(part.Parent) then
			return true, cornerResult.Instance
		end
	end

	-- Everything blocked
	return false, result.Instance
end

-- UI & Settings Variables
local headshotAccuracy = 100
local fovSize = getgenv().sneeky_fov_size or 300

local getTarget = function(origin: Vector3)
    local cPart, cDistance = nil, fovSize;
    -- Exact center of the 3D viewport (ignores mouse position)
    local screenCenter = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2);

	-- Do Zombies;
	for _, zombie: Model in next, workspace.Zombies:GetChildren() do
		if not zombie:IsA("Model") then continue; end;

		local humanoid: Humanoid = zombie:FindFirstChildOfClass("Humanoid");
		if not humanoid or humanoid.Health <= 0 then continue; end;

		local head: BasePart = zombie:FindFirstChild("Head") or zombie.PrimaryPart or zombie:FindFirstChild("HumanoidRootPart");
		if not head then continue; end;

		local pos, onScreen = cam:WorldToViewportPoint(head.Position);
		if not onScreen then continue; end;

		local distance = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude;
		if distance < cDistance then
			cPart = head;
			cDistance = distance;
		end;
	end

	if cPart then
    	return cPart
	end -- Zombies prioritized.

    for _, player: Player in next, Players:GetPlayers() do
        if player == plr then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

        -- Headshot accuracy logic: 100% aims head, anything lower aims root part
        local tPart: BasePart
        if headshotAccuracy == 100 then
            tPart = char:FindFirstChild("Head") or char.PrimaryPart or char:FindFirstChild("HumanoidRootPart");
        else
            tPart = char.PrimaryPart or char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head");
        end
        
        if not tPart then continue; end;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        -- Uncommented visibility check
        local head = char:FindFirstChild("Head")
		local root = char:FindFirstChild("HumanoidRootPart") or char.PrimaryPart

		if not head and not root then continue end

		local isHeadVisible = head and select(1, isVisible(head, origin))
		local rootVisible = root and select(1, isVisible(root, origin))

		if not isHeadVisible and not rootVisible then
			continue
		end

        if canTargetBeKilled(player) == false then continue end;

        if nTPart then tPart = nTPart; end;

        local distance = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;

    return cPart;
end;

-- FOV Circle Drawing (Native Exploit Drawing API)
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 1.5
fovCircle.NumSides = 60
fovCircle.Radius = fovSize
fovCircle.Filled = false
fovCircle.Color = Color3.fromRGB(0, 100, 0) -- Darkish green
fovCircle.Visible = true
fovCircle.ZIndex = 2

local currentTarget = nil

-- Live target tracking to update FOV circle color and feed the hook
local timeSkip = 8;
local ticks = 0;
RunService.RenderStepped:Connect(function()
	ticks = ticks + 1;
	--- only run every 8 ticks
	if ticks % timeSkip ~= 0 then return end;
    if fovCircle then
        local inset = GuiService:GetGuiInset()
        local viewport = cam.ViewportSize
        -- Exact center of the screen accounting for the topbar inset
        fovCircle.Position = Vector2.new(viewport.X / 2, viewport.Y / 2 + inset.X)
        fovCircle.Radius = fovSize
        
        local origin = cam.CFrame.Position
        local target = getTarget(origin)
        if target then
            fovCircle.Color = Color3.fromRGB(255, 0, 0) -- Bright red
            currentTarget = target
        else
            fovCircle.Color = Color3.fromRGB(0, 100, 0) -- Darkish green
            currentTarget = nil
        end
    end
end)

-- Custom IMGUI Setup
local success, engine = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()
end)

if success and engine then
    local window = engine.new({
        text = "Silent Aim Settings",
        size = UDim2.new(0, 300, 0, 200),
    })
    window.open()

    local tab = window.new({
        text = "Configuration",
    })

    local sliderAccuracy = tab.new("slider", {
        text = "Headshot Accuracy (%)",
        min = 0,
        max = 100,
        value = 100,
        rounding = 0,
    })
    sliderAccuracy.event:Connect(function(val)
        headshotAccuracy = val
    end)

    local sliderFOV = tab.new("slider", {
        text = "FOV Size",
        min = 10,
        max = 1000,
        value = fovSize,
        rounding = 0,
    })
    sliderFOV.event:Connect(function(val)
        fovSize = val
    end)
else
    warn("Failed to load IMGUI library. Settings UI will not appear.")
end

getgenv().sneeky_silent_aim = true;
local old; old = clonefunction(hookfunction(cont, newcclosure(function(_, __, ...)
    local c = currentTarget;
    if c then
        return old(_, {
            ["Instance"] = c,
            ["Position"] = c.Position,
            ["Normal"] = Vector3.new(0, 1, 0),
            ["Material"] = c.Material
        }, ...);
    end;
    return old(_, __, ...);
end)));