if game.PlaceId ~= 136801880565837 then
    game:GetService("Players").LocalPlayer:Kick("solvent only supports flick if you want it to support another game contact me")
    return
end

local getinfo = getinfo or debug.getinfo
local Detected, Kill

setthreadidentity(2)

for i, v in getgc(true) do
    if typeof(v) == "table" then
        local DetectFunc = rawget(v, "Detected")
        local KillFunc = rawget(v, "Kill")
    
        if typeof(DetectFunc) == "function" and not Detected then
            Detected = DetectFunc
            
            hookfunction(Detected, function(Action, Info, NoCrash)
                if Action ~= "_" then
                    return true
                end
                return true
            end)
        end

        if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
            Kill = KillFunc
            hookfunction(Kill, function(Info)
            end)
        end
    end
end

local OldDebugInfo = getrenv().debug.info
hookfunction(getrenv().debug.info, newcclosure(function(...)
    local LevelOrFunc, Info = ...
    if Detected and LevelOrFunc == Detected then
        return coroutine.yield(coroutine.running())
    end
    return OldDebugInfo(...)
end))
setthreadidentity(7)

local library =
	loadstring(game:HttpGet("https://library.solvent.lol/"))()
local flags = library.flags

local exec_name = "unknown"
pcall(function()
	local a, b = identifyexecutor()
	if a and a ~= "" then
		exec_name = string.lower(a)
	elseif b and b ~= "" then
		exec_name = string.lower(b)
	end
end)

local window = library:window({
	name = "solvent - " .. tostring(exec_name),
	size = UDim2.fromOffset(600, 450),
})

do
	local combat_tab = window:tab({ name = "combat" })

    local combat = combat_tab:section({ name = "silent aim", side = "left" })

	local workspace = game:GetService("Workspace");
	local players = game:GetService("Players");
	local run_service = game:GetService("RunService");
	local lighting = game:GetService("Lighting");
	local virtual_input_manager = game:GetService("VirtualInputManager");
	local user_input_service = game:GetService("UserInputService");
	local core_gui = game:GetService("CoreGui");

	local local_player = players.LocalPlayer;
	local camera = workspace.CurrentCamera;

	local bullet_handler = require(game:GetService("ReplicatedStorage").ModuleScripts.GunModules.BulletHandler);
	local gun_framework = require(game:GetService("ReplicatedStorage").ModuleScripts.GunModules.GunFramework);
	
	function getAllTools()
		local tools = {}
		if local_player and local_player.Character then
			for _, tool in pairs(local_player.Character:GetChildren()) do
				if tool:IsA("Tool") then
					table.insert(tools, tool)
				end
			end
		end
		local backpack = local_player and local_player:FindFirstChild("Backpack")
		if backpack then
			for _, tool in pairs(backpack:GetChildren()) do
				if tool:IsA("Tool") then
					table.insert(tools, tool)
				end
			end
		end
		return tools
	end
	
	function getValidatedParts(flag_name, default)
		local selected_parts = flags[flag_name] or default
		if type(selected_parts) ~= "table" or #selected_parts == 0 then
			return default
		end
		return selected_parts
	end

	local cached_raycast_params = RaycastParams.new()
	cached_raycast_params.FilterType = Enum.RaycastFilterType.Blacklist

	local function get_color3_from_flag(flag_value)
		if typeof(flag_value) == "Color3" then
			return flag_value
		elseif type(flag_value) == "table" then
			if flag_value.Color and typeof(flag_value.Color) == "Color3" then
				return flag_value.Color
			elseif flag_value[1] and flag_value[2] and flag_value[3] then
				return Color3.new(flag_value[1], flag_value[2], flag_value[3])
			elseif flag_value.R and flag_value.G and flag_value.B then
				return Color3.new(flag_value.R, flag_value.G, flag_value.B)
			elseif flag_value.r and flag_value.g and flag_value.b then
				return Color3.new(flag_value.r, flag_value.g, flag_value.b)
			end
		end
		return Color3.fromRGB(200, 200, 200)
	end
	
	function raycast_wallcheck(origin: Vector3, target: Vector3, target_character: Model): boolean
		if not local_player or not local_player.Character or not target_character then
			return true
		end
		
		cached_raycast_params.FilterDescendantsInstances = {local_player.Character, target_character}
		
		local direction = (target - origin)
		local distance = direction.Magnitude
		local raycast_result = workspace:Raycast(origin, direction, cached_raycast_params)
		
		return raycast_result == nil
	end

	function get_closest_target(range: number)
		if not camera or not flags or not camera.ViewportSize then
			return nil
		end
		
		local apply_fov = (flags["silent_aim_show_fov"] and flags["silent_aim_use_fov"]) or false
		local fov_value = apply_fov and (flags["silent_aim_fov"] or 999) or math.huge
		local selected_parts = getValidatedParts("silent_aim_hit_parts", { "Head" })
		
		local closest_visible_part = nil
		local closest_visible_distance = range
		local closest_hidden_part = nil
		local closest_hidden_distance = range
		local screen_center = camera.ViewportSize / 2

		for _, player in players:GetPlayers() do
			if player == local_player then
				continue
			end
			
			local character = player.Character
			if not character then
				continue
			end
			
			local humanoid = character:FindFirstChild("Humanoid")
			if not humanoid or humanoid.Health == 0 then
				continue
			end
			
			for _, part_name in ipairs(selected_parts) do
				local part = character:FindFirstChild(part_name)
				if not part then
					continue
				end
				
				local screen_position, on_screen = camera:WorldToViewportPoint(part.Position)
				if not on_screen then
				continue
			end
				
				local screen_pos_2d = Vector2.new(screen_position.X, screen_position.Y)
				local distance = (screen_pos_2d - screen_center).Magnitude
				
				if apply_fov and distance > fov_value then
					continue
				end
				
				local camera_position = camera.CFrame.Position
				local is_visible = raycast_wallcheck(camera_position, part.Position, character)
				
				if flags["silent_aim_wallcheck"] then
					if is_visible then
						if distance < closest_visible_distance then
							closest_visible_part = part
							closest_visible_distance = distance
				end
			end
				else
					if distance < closest_visible_distance then
						closest_visible_part = part
						closest_visible_distance = distance
					end
				end
			end
		end

		if flags["silent_aim_wallcheck"] then
			return closest_visible_part
		end
		
		return closest_visible_part
	end

	local old_fire = bullet_handler.Fire;

	combat:toggle({
		name = "silent aim",
		flag = "silent_aim",
		default = false,
		callback = function(bool)
			if bool then
				bullet_handler.Fire = function(data)
					local closest = get_closest_target(999);
					if (closest) then
						data.Force = data.Force * 1000;
						data.Direction = (closest.Position - data.Origin).Unit;
					end
					return old_fire(data);
				end
			else
				bullet_handler.Fire = old_fire;
			end
		end,
		hitpart_picker = {
			name = "hit parts",
			flag = "silent_aim_hit_parts",
			default = { "Head" },
			multi = true,
			type = "R6",
			height = 260,
		},
	})

	combat:toggle({
		name = "wallcheck",
		flag = "silent_aim_wallcheck",
		default = false,
	})

	local fov_circle = Drawing.new("Circle")
	fov_circle.Visible = false
	fov_circle.ZIndex = -4
	fov_circle.Thickness = 2
	fov_circle.NumSides = 64
	fov_circle.Radius = 150
	fov_circle.Filled = false
	fov_circle.Transparency = 1
	fov_circle.Color = Color3.fromRGB(200, 200, 200)
	
	local fov_fill_circle = Drawing.new("Circle")
	fov_fill_circle.Visible = false
	fov_fill_circle.ZIndex = -5
	fov_fill_circle.Thickness = 1
	fov_fill_circle.NumSides = 64
	fov_fill_circle.Radius = 150
	fov_fill_circle.Filled = true
	fov_fill_circle.Transparency = 0.3
	fov_fill_circle.Color = Color3.fromRGB(200, 200, 200)
	
	local fov_display_radius = fov_circle.Radius
	
	local fov_glow_gui = nil
	local fov_glow_image = nil
	
local cached_muzzle_part = nil

local function find_muzzle_part()
	if cached_muzzle_part and (not cached_muzzle_part.Parent or not cached_muzzle_part:IsA("BasePart")) then
		cached_muzzle_part = nil
	end

	local char = local_player and local_player.Character
	if char then
		local tool = char:FindFirstChildOfClass("Tool")
		if tool then
			local muzzle = tool:FindFirstChild("Muz", true)
			if muzzle and muzzle:IsA("BasePart") then
				cached_muzzle_part = muzzle
				return muzzle
			end
		end
	end

	local imafedyou = workspace:FindFirstChild("imafedyou")
	if imafedyou then
		for _, desc in ipairs(imafedyou:GetDescendants()) do
			if desc:IsA("BasePart") and desc.Name == "Muz" then
				cached_muzzle_part = desc
				return desc
			end
		end
	end

	return cached_muzzle_part
end

local function get_muzzle_world()
	local muzzle = find_muzzle_part()
	if muzzle and muzzle:IsA("BasePart") then
		return muzzle.Position, muzzle.CFrame.LookVector
	end
	return nil
end

local function get_muzzle_screen_pos()
	if not camera then return nil end
	local pos3d, look = get_muzzle_world()
	if not pos3d then
		return nil
	end
	local pushed_pos = pos3d + (look or Vector3.new(0, 0, -1)) * 4
	local pos, on_screen = camera:WorldToViewportPoint(pushed_pos)
	if on_screen then
		return Vector2.new(pos.X, pos.Y)
	end
	return nil
end

local aimbot_fov_circle = Drawing.new("Circle")
aimbot_fov_circle.Visible = false
aimbot_fov_circle.ZIndex = -4
aimbot_fov_circle.Thickness = 2
aimbot_fov_circle.NumSides = 64
aimbot_fov_circle.Radius = 150
aimbot_fov_circle.Filled = false
aimbot_fov_circle.Transparency = 1
aimbot_fov_circle.Color = Color3.fromRGB(200, 200, 200)
local aimbot_fov_display_radius = aimbot_fov_circle.Radius
	
	local function destroy_fov_glow()
		if fov_glow_image then
			pcall(function()
				fov_glow_image:Destroy()
			end)
			fov_glow_image = nil
		end
		if fov_glow_gui then
			pcall(function()
				fov_glow_gui:Destroy()
			end)
			fov_glow_gui = nil
		end
	end
	
	local function ensure_fov_glow(radius, center)
		if not fov_glow_gui or not fov_glow_image then
			fov_glow_gui = Instance.new("ScreenGui")
			fov_glow_gui.IgnoreGuiInset = true
			fov_glow_gui.ResetOnSpawn = false
			fov_glow_gui.Name = "FOVGlow"
			fov_glow_gui.Parent = core_gui
			
			fov_glow_image = Instance.new("ImageLabel")
			fov_glow_image.Name = "Glow"
			fov_glow_image.BackgroundTransparency = 1
			fov_glow_image.Image = "rbxassetid://77586823013294"
			fov_glow_image.ImageTransparency = 0
			fov_glow_image.AnchorPoint = Vector2.new(0.5, 0.5)
			fov_glow_image.ZIndex = 999
			fov_glow_image.Size = UDim2.fromOffset(radius * 4, radius * 4)
			fov_glow_image.Position = UDim2.fromOffset(center.X, center.Y)
			fov_glow_image.Parent = fov_glow_gui
		end
		
		fov_glow_image.Size = UDim2.fromOffset(radius * 4, radius * 4)
		fov_glow_image.Position = UDim2.fromOffset(center.X, center.Y)
		fov_glow_image.ImageColor3 = get_color3_from_flag(flags["silent_aim_fov_color"]) or Color3.fromRGB(200, 200, 200)
		fov_glow_image.Visible = true
	end

	combat:toggle({
		name = "show fov",
		flag = "silent_aim_show_fov",
		default = false,
		settings = {
			silent_aim_fov_glow = {
				name = "fov glow",
				flag = "silent_aim_fov_glow",
		default = false,
				callback = function(bool)
					if not bool then
						destroy_fov_glow()
					end
				end,
			},
			silent_aim_breathing_fov = {
				name = "breathing fov",
				flag = "silent_aim_breathing_fov",
				default = false,
			},
			silent_aim_fov_origin = {
				name = "fov origin",
				flag = "silent_aim_fov_origin",
				items = { "screen", "mouse", "muzzle" },
				default = "screen",
			},
		},
		callback = function(bool)
			fov_circle.Visible = bool
		end,
	})

	combat:colorpicker({
		object = "show fov",
		flag = "silent_aim_fov_color",
		color = Color3.fromRGB(200, 200, 200),
		callback = function(color)
			fov_circle.Color = color
		end,
	})

	combat:toggle({
		name = "use fov",
		flag = "silent_aim_use_fov",
		default = false,
	})

	combat:slider({
		name = "fov size",
		flag = "silent_aim_fov",
		min = 10,
		max = 500,
		default = 95,
		interval = 1,
		callback = function(value)
			fov_circle.Radius = value
		end,
	})


	local gun_mods_section = combat_tab:section({ name = "gun mods", side = "left" })
	
	local stored_recoil_values = {}
	local stored_firerate_values = {}
	local stored_reloadtime_values = {}
	local apply_gun_mods_to_tools
	
	local aimbot_section = combat_tab:section({ name = "aimbot", side = "right" })
	
	local hitsound_section = combat_tab:section({ name = "hitsounds", side = "right" })
	
	local hitSoundIds = {
		bameware = "rbxassetid://3124331820",
		bell = "rbxassetid://6534947240",
		bubble = "rbxassetid://6534947588",
		pick = "rbxassetid://1347140027",
		pop = "rbxassetid://198598793",
		rust = "rbxassetid://1255040462",
		sans = "rbxassetid://3188795283",
		fart = "rbxassetid://130833677",
		big = "rbxassetid://5332005053",
		vine = "rbxassetid://5332680810",
		bruh = "rbxassetid://4578740568",
		skeet = "rbxassetid://5633695679",
		neverlose = "rbxassetid://6534948092",
		fatality = "rbxassetid://6534947869",
		bonk = "rbxassetid://5766898159",
		minecraft = "rbxassetid://4018616850"
	}

local function getSelectedHitSoundId()
	local chosen = flags["hitsound_choice"] or "neverlose"
	return hitSoundIds[chosen] or hitSoundIds.neverlose
end
	
	local function isHitSound(sound)
		if not sound or not sound:IsA("Sound") then
			return false
		end
		
		local soundName = sound.Name
		if soundName == "HitSound" then
			return true
		end
		
		local parent = sound.Parent
		if parent then
			if parent.Name == "Sounds" or parent.Name:lower() == "sounds" then
				local checkParent = parent.Parent
				while checkParent and checkParent ~= game do
					if checkParent:IsA("Tool") then
						return true
					end
					if checkParent:IsA("Folder") and checkParent.Name == "GunModules" then
						return true
					end
					if checkParent:IsA("ModuleScript") and checkParent.Name == "GunFramework" then
						return true
					end
					checkParent = checkParent.Parent
				end
			end
		end
		
		return false
	end
	
	local function isBangSound(sound)
		if not sound or not sound:IsA("Sound") then
			return false
		end
		
		local soundName = sound.Name
		if soundName == "Bang" then
			return true
		end
		
		return false
	end

local function applyHitSound(sound)
	if not (sound and sound:IsA("Sound") and isHitSound(sound)) then
		return
	end
	if not flags["hitsounds_enabled"] then
		return
	end
	local soundId = getSelectedHitSoundId()
	if sound.SoundId ~= soundId then
		sound.SoundId = soundId
	end
end

local function applyBangSound(sound)
	if not (sound and sound:IsA("Sound") and isBangSound(sound)) then
		return
	end
	if not flags["hitsounds_enabled"] then
		return
	end
	local soundId = getSelectedHitSoundId()
	if sound.SoundId ~= soundId then
		pcall(function()
			sound.SoundId = soundId
		end)
	end
end
	
	
	hitsound_section:toggle({
		name = "enable",
		flag = "hitsounds_enabled",
		default = false,
	})

hitsound_section:slider({
	name = "volume",
	flag = "hitsound_volume",
	min = 0,
	max = 10,
	default = 5,
	interval = 0.1,
	})

	local hitsound_options = {}
	for name, _ in pairs(hitSoundIds) do
		table.insert(hitsound_options, name)
	end
	table.sort(hitsound_options)
	
	hitsound_section:dropdown({
		name = "hitsound",
		flag = "hitsound_choice",
		items = hitsound_options,
		default = "neverlose",
	})

	gun_mods_section:slider({
		name = "recoil multiplier",
		flag = "recoil_multiplier",
		min = 0.1,
		max = 1000,
		default = 1.0,
		interval = 0.1,
		callback = function(value)
			for gun_model, _ in pairs(stored_recoil_values) do
				if not gun_model or not gun_model.Parent then
					stored_recoil_values[gun_model] = nil
				end
			end
			if apply_gun_mods_to_tools then
				apply_gun_mods_to_tools()
			end
		end,
	})

	gun_mods_section:slider({
		name = "fire rate multiplier (spam = kick)",
		flag = "firerate_multiplier",
		min = 0.1,
		max = 1000,
		default = 1.0,
		interval = 0.1,
		callback = function(value)
			for gun_model, _ in pairs(stored_firerate_values) do
				if not gun_model or not gun_model.Parent then
					stored_firerate_values[gun_model] = nil
			end
		end
			if apply_gun_mods_to_tools then
				apply_gun_mods_to_tools()
			end
		end,
	})

	gun_mods_section:slider({
		name = "reload time multiplier",
		flag = "reloadtime_multiplier",
		min = 0.1,
		max = 1000,
		default = 1.0,
		interval = 0.1,
		callback = function(value)
			for gun_model, _ in pairs(stored_reloadtime_values) do
				if not gun_model or not gun_model.Parent then
					stored_reloadtime_values[gun_model] = nil
				end
			end
			if apply_gun_mods_to_tools then
				apply_gun_mods_to_tools()
			end
		end,
	})

	aimbot_section:toggle({
		name = "aimbot",
		flag = "aimbot_enabled",
		default = false,
		keybind = true,
		keybind_mode = "hold",
		keybind_key = Enum.KeyCode.Q,
		hitpart_picker = {
			name = "hit parts",
			flag = "aimbot_hit_parts",
			default = { "Head" },
			multi = true,
			type = "R6",
		},
	})

	aimbot_section:toggle({
		name = "sticky",
		flag = "aimbot_sticky",
		default = false,
	})

	aimbot_section:slider({
		name = "smoothness",
		flag = "aimbot_smoothness",
		min = 1,
		max = 50,
		default = 10,
		interval = 1,
	})

	aimbot_section:toggle({
		name = "wallcheck",
		flag = "aimbot_wallcheck",
		default = false,
	})

	aimbot_section:toggle({
		name = "trigger bot",
		flag = "aimbot_triggerbot",
		default = false,
	})

	aimbot_section:toggle({
		name = "show fov",
		flag = "aimbot_show_fov",
		default = false,
		settings = {
			{
				name = "fov origin",
				flag = "aimbot_fov_origin",
				items = { "screen", "mouse", "muzzle" },
				default = "screen",
			},
			{
				name = "fov glow",
				flag = "aimbot_fov_glow",
				default = false,
			},
			{
				name = "breathing fov",
				flag = "aimbot_breathing_fov",
				default = false,
			},
		},
	})

	aimbot_section:colorpicker({
		object = "aimbot fov",
		flag = "aimbot_fov_color",
		color = Color3.fromRGB(200, 200, 200),
		callback = function(color)
			aimbot_fov_circle.Color = color
		end,
	})

	aimbot_section:toggle({
		name = "use fov",
		flag = "aimbot_use_fov",
		default = false,
	})

	aimbot_section:slider({
		name = "fov size",
		flag = "aimbot_fov",
		min = 10,
		max = 500,
		default = 150,
		interval = 1,
	})

	function get_closest_part_to_mouse()
		if not camera or not flags or not local_player then
			return nil, nil
		end
		
		local mouse = local_player:GetMouse()
		local mouse_pos = Vector2.new(mouse.X, mouse.Y)
		local origin_mode = flags["aimbot_fov_origin"] or "screen"
		local center = origin_mode == "mouse" and mouse_pos or (camera.ViewportSize / 2)
		local selected_parts = getValidatedParts("aimbot_hit_parts", { "Head" })
		local use_fov = flags["aimbot_use_fov"] or false
		local base_radius = flags["aimbot_fov"] or 99999
		local fov_radius = base_radius
		if flags["aimbot_breathing_fov"] then
			fov_radius = math.max(5, base_radius + math.sin(time() * 1.2) * (base_radius * 0.03))
		end
		
		local wallcheck_enabled = flags["aimbot_wallcheck"] or false
		
		local closest_part = nil
		local closest_distance = math.huge
		local closest_character = nil
		
		for _, player in players:GetPlayers() do
			if player == local_player then
				continue
			end
			
			local character = player.Character
			if not character then
				continue
			end
			
			local humanoid = character:FindFirstChild("Humanoid")
			if not humanoid or humanoid.Health == 0 then
				continue
			end
			
			for _, part_name in ipairs(selected_parts) do
				local part = character:FindFirstChild(part_name)
				if not part then
					continue
				end
				
				local screen_position, on_screen = camera:WorldToViewportPoint(part.Position)
				if not on_screen then
					continue
				end
				
				if wallcheck_enabled then
					local camera_position = camera.CFrame.Position
					local is_visible = raycast_wallcheck(camera_position, part.Position, character)
					if not is_visible then
						continue
					end
				end
				
				local screen_pos_2d = Vector2.new(screen_position.X, screen_position.Y)
				local distance = (screen_pos_2d - center).Magnitude
				if use_fov and distance > fov_radius then
					continue
				end
				
				if distance < closest_distance then
					closest_part = part
					closest_distance = distance
					closest_character = character
				end
			end
		end
		
		return closest_part, closest_character
	end

	local aimbot_target_part = nil
	local aimbot_target_character = nil
	local aimbot_was_active = false

	run_service.RenderStepped:Connect(function()
		if not camera or not flags then
			return
		end
		
		local aimbot_enabled = flags["aimbot_enabled"] or false
		if not aimbot_enabled then
			aimbot_target_part = nil
			aimbot_target_character = nil
			aimbot_was_active = false
			return
		end
		
		local aimbot_keybind_flag = flags["aimbot_enabled_keybind"]
		if not aimbot_keybind_flag then
			return
		end
		
		local mode = aimbot_keybind_flag.mode or "hold"
		local active = aimbot_keybind_flag.active or false
		
		if mode == "always" then
			active = true
		end
		
		local sticky = flags["aimbot_sticky"] or false
		
		if active and not aimbot_was_active then
			if not sticky then
				aimbot_target_part = nil
				aimbot_target_character = nil
			end
		end
		
		aimbot_was_active = active
		
		if active then
			if sticky and aimbot_target_character and aimbot_target_character.Parent then
				local humanoid = aimbot_target_character:FindFirstChild("Humanoid")
				if humanoid and humanoid.Health > 0 and aimbot_target_part and aimbot_target_part.Parent then
					local target_world_pos = aimbot_target_part.Position
					local camera_cframe = camera.CFrame
					local camera_pos = camera_cframe.Position
					
					local direction = (target_world_pos - camera_pos).Unit
					local target_cframe = CFrame.lookAt(camera_pos, camera_pos + direction)
					
					local smoothness = flags["aimbot_smoothness"] or 10
					local smooth_factor = math.clamp(1 / smoothness, 0.01, 1)
					
					local current_cframe = camera_cframe
					local lerped_cframe = current_cframe:Lerp(target_cframe, smooth_factor)
					
					camera.CFrame = lerped_cframe
				else
					aimbot_target_part = nil
					aimbot_target_character = nil
				end
			end
			
			local closest_part, closest_character = get_closest_part_to_mouse()
			
			if closest_part and closest_character then
				if not aimbot_target_character or aimbot_target_character ~= closest_character then
					if not sticky or not aimbot_target_character then
						aimbot_target_character = closest_character
							aimbot_target_part = closest_part
					end
				else
					local selected_parts = getValidatedParts("aimbot_hit_parts", { "Head" })
					local target_hit_part_name = selected_parts[1]
					local target_hit_part = aimbot_target_character:FindFirstChild(target_hit_part_name)
					if target_hit_part then
						aimbot_target_part = target_hit_part
					elseif not aimbot_target_part or not aimbot_target_part.Parent then
						aimbot_target_part = closest_part
					end
				end
			end
			
			if aimbot_target_part and aimbot_target_part.Parent then
				local humanoid = aimbot_target_part.Parent:FindFirstChild("Humanoid")
				if humanoid and humanoid.Health > 0 then
					local target_world_pos = aimbot_target_part.Position
					local camera_cframe = camera.CFrame
					local camera_pos = camera_cframe.Position
					
					local direction = (target_world_pos - camera_pos).Unit
					local target_cframe = CFrame.lookAt(camera_pos, camera_pos + direction)
					
					local smoothness = flags["aimbot_smoothness"] or 10
					local smooth_factor = math.clamp(1 / smoothness, 0.01, 1)
					
					local current_cframe = camera_cframe
					local lerped_cframe = current_cframe:Lerp(target_cframe, smooth_factor)
					
					camera.CFrame = lerped_cframe
				else
					aimbot_target_part = nil
					aimbot_target_character = nil
				end
			else
				if not sticky then
					aimbot_target_part = nil
					aimbot_target_character = nil
				end
			end
		else
			if not sticky then
				aimbot_target_part = nil
				aimbot_target_character = nil
			end
		end
		
		local triggerbot_enabled = flags["aimbot_triggerbot"] or false
		if triggerbot_enabled then
			local mouse = local_player:GetMouse()
			local target = mouse.Target
			if target and target.Parent then
				local humanoid = target.Parent:FindFirstChild("Humanoid")
				if humanoid and humanoid.Health > 0 and not target.Parent:FindFirstChild("ForceField") then
					virtual_input_manager:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
					task.delay(0.01, function()
						virtual_input_manager:SendMouseButtonEvent(0, 0, 0, false, nil, 0)
					end)
				end
			end
		end
	end)

	run_service.RenderStepped:Connect(function()
		local ui_open = getgenv().library and getgenv().library.ui_open
		if flags["silent_aim_show_fov"] and camera and camera.ViewportSize and not ui_open then
			local origin_mode = flags["silent_aim_fov_origin"] or "screen"
			local screen_center = camera.ViewportSize / 2
			local center = screen_center
			if origin_mode == "mouse" then
				center = user_input_service:GetMouseLocation()
			elseif origin_mode == "muzzle" then
				center = get_muzzle_screen_pos() or screen_center
			end
			local base_radius = flags["silent_aim_fov"] or 150
			local target_radius = base_radius
			
			if flags["silent_aim_breathing_fov"] then
				target_radius = math.max(5, base_radius + math.sin(time() * 1.2) * (base_radius * 0.03))
			end
			
			fov_display_radius = fov_display_radius + (target_radius - fov_display_radius) * 0.25
			local radius = fov_display_radius
			
			fov_circle.Position = center
			fov_circle.Radius = radius
			fov_circle.Color = get_color3_from_flag(flags["silent_aim_fov_color"]) or Color3.fromRGB(200, 200, 200)
			
			fov_circle.Filled = false
			fov_circle.Transparency = 1
			
				fov_fill_circle.Visible = false
			
			if flags["silent_aim_fov_glow"] then
				ensure_fov_glow(radius, center)
			elseif fov_glow_image then
				fov_glow_image.Visible = false
			end
			
			fov_circle.Visible = true
		else
			fov_circle.Visible = false
			fov_fill_circle.Visible = false
			if fov_glow_image then
				fov_glow_image.Visible = false
			end
		end

		if flags["aimbot_show_fov"] and camera and camera.ViewportSize and not ui_open then
			local origin_mode = flags["aimbot_fov_origin"] or "screen"
			local center = camera.ViewportSize / 2
			if origin_mode == "mouse" then
				center = user_input_service:GetMouseLocation()
			elseif origin_mode == "muzzle" then
				center = get_muzzle_screen_pos() or center
			end
			local base_radius = flags["aimbot_fov"] or 150
			local target_radius = base_radius
			if flags["aimbot_breathing_fov"] then
				target_radius = math.max(5, base_radius + math.sin(time() * 1.2) * (base_radius * 0.03))
			end
			aimbot_fov_display_radius = aimbot_fov_display_radius + (target_radius - aimbot_fov_display_radius) * 0.25
			aimbot_fov_circle.Visible = true
			aimbot_fov_circle.Position = center
			aimbot_fov_circle.Radius = aimbot_fov_display_radius
			aimbot_fov_circle.Color = get_color3_from_flag(flags["aimbot_fov_color"]) or Color3.fromRGB(200, 200, 200)
			local glow = flags["aimbot_fov_glow"] or false
			aimbot_fov_circle.Filled = glow
			aimbot_fov_circle.Transparency = glow and 0.6 or 1
		else
			aimbot_fov_circle.Visible = false
		end
	end)

	local original_gun_framework_new = gun_framework.new
	local hook_verified = false
	local hook_check_complete = false

	if original_gun_framework_new then
		gun_framework.new = function(gun_model)
			local configuration = gun_model and gun_model:FindFirstChild("Configuration")
			local recoil_value = configuration and configuration:FindFirstChild("Recoil")
			local firerate_value = configuration and configuration:FindFirstChild("FireRate")
			local reloadtime_value = configuration and configuration:FindFirstChild("reloadTime")
			
			local recoil_multiplier = flags["recoil_multiplier"] or 1.0
			if recoil_multiplier ~= 1.0 and recoil_value and recoil_value:IsA("Vector3Value") then
				if not stored_recoil_values[gun_model] then
					stored_recoil_values[gun_model] = recoil_value.Value
				end
				local original_recoil = stored_recoil_values[gun_model]
				recoil_value.Value = original_recoil * recoil_multiplier
			elseif recoil_value and recoil_value:IsA("Vector3Value") then
				if not stored_recoil_values[gun_model] then
					stored_recoil_values[gun_model] = recoil_value.Value
				end
			end
			
			local firerate_multiplier = flags["firerate_multiplier"] or 1.0
			if firerate_multiplier ~= 1.0 and firerate_value and firerate_value:IsA("NumberValue") then
				if not stored_firerate_values[gun_model] then
					stored_firerate_values[gun_model] = firerate_value.Value
				end
				firerate_value.Value = stored_firerate_values[gun_model] / firerate_multiplier
			elseif firerate_value and firerate_value:IsA("NumberValue") then
				if not stored_firerate_values[gun_model] then
					stored_firerate_values[gun_model] = firerate_value.Value
		end
	end

			local reloadtime_multiplier = flags["reloadtime_multiplier"] or 1.0
			if reloadtime_multiplier ~= 1.0 and reloadtime_value and reloadtime_value:IsA("NumberValue") then
				if not stored_reloadtime_values[gun_model] then
					stored_reloadtime_values[gun_model] = reloadtime_value.Value
				end
				reloadtime_value.Value = stored_reloadtime_values[gun_model] / reloadtime_multiplier
			elseif reloadtime_value and reloadtime_value:IsA("NumberValue") then
				if not stored_reloadtime_values[gun_model] then
					stored_reloadtime_values[gun_model] = reloadtime_value.Value
				end
			end
			
			local result = original_gun_framework_new(gun_model)
			
			local firerate_value = configuration and configuration:FindFirstChild("FireRate")
			local reloadtime_value = configuration and configuration:FindFirstChild("reloadTime")
			
			if (firerate_value and firerate_value:IsA("NumberValue")) or (reloadtime_value and reloadtime_value:IsA("NumberValue")) then
				hook_verified = true
			end
			
			return result
		end
		
		task.spawn(function()
			task.wait(8)
			
			if hook_check_complete then
						return
					end

			hook_check_complete = true
			
			if gun_framework.new == original_gun_framework_new then
				local_player:Kick("failed to hook")
				return
			end
			
			local test_gun_found = false
			
			local tools = getAllTools()
			for _, tool in pairs(tools) do
				local configuration = tool:FindFirstChild("Configuration")
				if configuration then
					local firerate_value = configuration:FindFirstChild("FireRate")
					local reloadtime_value = configuration:FindFirstChild("reloadTime")
					
					if (firerate_value and firerate_value:IsA("NumberValue")) or (reloadtime_value and reloadtime_value:IsA("NumberValue")) then
						test_gun_found = true
						
						if (firerate_value and stored_firerate_values[tool]) or (reloadtime_value and stored_reloadtime_values[tool]) then
							return
						end
					end
				end
			end
					
			if test_gun_found and not hook_verified then
				local_player:Kick("failed to hook")
					end
				end)
			else
		task.spawn(function()
			task.wait(5)
			local_player:Kick("failed to hook")
		end)
	end


	function apply_gun_mods_to_tools()
		local recoil_multiplier = flags["recoil_multiplier"] or 1.0
		local firerate_multiplier = flags["firerate_multiplier"] or 1.0
		local reloadtime_multiplier = flags["reloadtime_multiplier"] or 1.0
		
		local tools = getAllTools()
		
		for _, tool in pairs(tools) do
			local configuration = tool:FindFirstChild("Configuration")
			if not configuration then
				continue
			end
			
			if reloadtime_multiplier ~= 1.0 then
				local reloadtime_value = configuration:FindFirstChild("reloadTime")
				if reloadtime_value and reloadtime_value:IsA("NumberValue") then
					if not stored_reloadtime_values[tool] then
						stored_reloadtime_values[tool] = reloadtime_value.Value
					end
					reloadtime_value.Value = stored_reloadtime_values[tool] / reloadtime_multiplier
				end
			else
				if stored_reloadtime_values[tool] then
					local reloadtime_value = configuration:FindFirstChild("reloadTime")
					if reloadtime_value and reloadtime_value:IsA("NumberValue") then
						reloadtime_value.Value = stored_reloadtime_values[tool]
					end
				end
			end
			
			if firerate_multiplier ~= 1.0 then
				local firerate_value = configuration:FindFirstChild("FireRate")
				if firerate_value and firerate_value:IsA("NumberValue") then
					if not stored_firerate_values[tool] then
						stored_firerate_values[tool] = firerate_value.Value
					end
					firerate_value.Value = stored_firerate_values[tool] / firerate_multiplier
				end
			else
				if stored_firerate_values[tool] then
					local firerate_value = configuration:FindFirstChild("FireRate")
					if firerate_value and firerate_value:IsA("NumberValue") then
						firerate_value.Value = stored_firerate_values[tool]
					end
				end
			end
			
			if recoil_multiplier ~= 1.0 then
				local recoil_value = configuration:FindFirstChild("Recoil")
				if recoil_value and recoil_value:IsA("Vector3Value") then
					if not stored_recoil_values[tool] then
						stored_recoil_values[tool] = recoil_value.Value
					end
					recoil_value.Value = stored_recoil_values[tool] * recoil_multiplier
				end
			else
				if stored_recoil_values[tool] then
					local recoil_value = configuration:FindFirstChild("Recoil")
					if recoil_value and recoil_value:IsA("Vector3Value") then
						recoil_value.Value = stored_recoil_values[tool]
					end
				end
			end
		end
		
		for gun_model, _ in pairs(stored_reloadtime_values) do
			if not gun_model or not gun_model.Parent then
				stored_reloadtime_values[gun_model] = nil
			end
		end
		
		for gun_model, _ in pairs(stored_firerate_values) do
			if not gun_model or not gun_model.Parent then
				stored_firerate_values[gun_model] = nil
			end
		end
		
		for gun_model, _ in pairs(stored_recoil_values) do
			if not gun_model or not gun_model.Parent then
				stored_recoil_values[gun_model] = nil
			end
		end
	end
	
	run_service.Heartbeat:Connect(function()
		apply_gun_mods_to_tools()
	end)
	
	local_player.CharacterAdded:Connect(function(character)
		task.wait(0.5)
		apply_gun_mods_to_tools()
		
		character.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then
				task.wait(0.1)
				apply_gun_mods_to_tools()
			end
		end)
	end)
	
	local backpack = local_player:FindFirstChild("Backpack")
	if backpack then
		backpack.ChildAdded:Connect(function(child)
			if child:IsA("Tool") then
				task.wait(0.1)
				apply_gun_mods_to_tools()
			end
		end)
	end


	local visuals_tab = window:tab({ name = "visuals" })
	
	local esp_section = visuals_tab:section({ name = "esp", side = "left" })
	
	esp_section:slider({
		name = "max distance",
		flag = "chams_distance",
		min = 0,
		max = 2000,
		default = 400,
	})
	
	local chams_quads = {}
	local chams_connections = {}
	local chams_global_connection = nil
	local ui_open = getgenv().library and getgenv().library.ui_open

	local function safe_disconnect(conn)
		if conn and typeof(conn) == "RBXScriptConnection" then
			pcall(function()
				conn:Disconnect()
			end)
		end
	end

	local function safe_remove_drawing(obj)
		if obj and obj.Remove then
			pcall(function()
				obj.Visible = false
				obj:Remove()
			end)
		end
	end
	
	local function has_forcefield(player)
		if not flags["forcefield_check"] then
			return false
		end
		local character = player and player.Character
		if not character then
			return false
		end
		return character:FindFirstChild("INV", true) ~= nil
	end
	
	local function NewQuad(color)
		local quad = Drawing.new("Quad")
		quad.Visible = false
		quad.ZIndex = -5
		quad.PointA = Vector2.new(0, 0)
		quad.PointB = Vector2.new(0, 0)
		quad.PointC = Vector2.new(0, 0)
		quad.PointD = Vector2.new(0, 0)
		quad.Color = color
		quad.Filled = true
		quad.Thickness = 1
		quad.Transparency = 0.25
		return quad
	end
	
	local function ColorizeQuads(color, quads)
		for _, quad in pairs(quads) do
			if quad and quad.Color then
				quad.Color = color
			end
		end
	end
	
	local function RemoveChams(player)
		if not player then return end
		
		if chams_quads[player] then
			for part, quads in pairs(chams_quads[player]) do
				if quads then
					for _, quad in pairs(quads) do
						safe_remove_drawing(quad)
					end
				end
			end
			chams_quads[player] = nil
		end
		
		if chams_connections[player] then
			for part, connection in pairs(chams_connections[player]) do
				safe_disconnect(connection)
			end
			chams_connections[player] = nil
		end
	end
	
	local function RemoveAllChams()
		if chams_global_connection then
			chams_global_connection:Disconnect()
			chams_global_connection = nil
		end
		for player, _ in pairs(chams_quads) do
			RemoveChams(player)
		end
		for player, connection in pairs(chams_connections) do
			safe_disconnect(connection)
		end
		chams_quads = {}
		chams_connections = {}
	end
	
	local function ESP(part_obj, player)
		if not part_obj or not player then return end
		
		local part_name = part_obj.Name
		local default_chams_color = get_color3_from_flag(flags["chams_color"]) or Color3.fromRGB(200, 200, 200)
		
		if not chams_quads[player] then
			chams_quads[player] = {}
		end
		
		if chams_quads[player][part_obj] then
			return
		end
		
		local quads = {
			quad1 = NewQuad(default_chams_color),
			quad2 = NewQuad(default_chams_color),
			quad3 = NewQuad(default_chams_color),
			quad4 = NewQuad(default_chams_color),
			quad5 = NewQuad(default_chams_color),
			quad6 = NewQuad(default_chams_color)
		}
		
		chams_quads[player][part_obj] = quads
		
		local function setQuadsVisible(visible)
			for _, quad in pairs(quads) do
				if quad then
					quad.Visible = visible
				end
			end
		end
		
		local connection
		connection = run_service.RenderStepped:Connect(function()
			if not flags["chams_enabled"] then
				setQuadsVisible(false)
				return
			end
			if ui_open == nil and getgenv().library then
				ui_open = getgenv().library.ui_open
			end
			if ui_open then
				setQuadsVisible(false)
				return
			end
			
			local character = player.Character
			if not character or not character.Parent then
				setQuadsVisible(false)
				return
			end
			
			local humanoid = character:FindFirstChild("Humanoid")
			local humanoid_root_part = character:FindFirstChild("HumanoidRootPart")
			if not humanoid or not humanoid_root_part or humanoid.Health <= 0 then
				setQuadsVisible(false)
				return
			end
			
			if has_forcefield(player) then
				setQuadsVisible(false)
				return
			end
			
			local current_part = character:FindFirstChild(part_name)
			if not current_part then
				setQuadsVisible(false)
				return
			end
			
			local max_distance = flags["chams_distance"] or 2000
			local distance = (humanoid_root_part.Position - camera.CFrame.Position).Magnitude
			if distance > max_distance then
				setQuadsVisible(false)
				return
			end
				
			if not camera or not camera.CFrame then
				setQuadsVisible(false)
				return
			end
			
			local partpos, onscreen = camera:WorldToViewportPoint(current_part.Position)
			if not onscreen then
				setQuadsVisible(false)
				return
			end
			
			local camera_position = camera.CFrame.Position
			local is_visible = raycast_wallcheck(camera_position, current_part.Position, character)
			
			local global_visible_only = flags["esp_visible_only"] or false
			if global_visible_only and not is_visible then
				setQuadsVisible(false)
				return
			end
			
			local size_X = current_part.Size.X / 2
			local size_Y = current_part.Size.Y / 2
			local size_Z = current_part.Size.Z / 2
			local part_cframe = current_part.CFrame
			
			local Top1 = camera:WorldToViewportPoint((part_cframe * CFrame.new(-size_X, size_Y, -size_Z)).p)
			local Top2 = camera:WorldToViewportPoint((part_cframe * CFrame.new(-size_X, size_Y, size_Z)).p)
			local Top3 = camera:WorldToViewportPoint((part_cframe * CFrame.new(size_X, size_Y, size_Z)).p)
			local Top4 = camera:WorldToViewportPoint((part_cframe * CFrame.new(size_X, size_Y, -size_Z)).p)
			
			local Bottom1 = camera:WorldToViewportPoint((part_cframe * CFrame.new(-size_X, -size_Y, -size_Z)).p)
			local Bottom2 = camera:WorldToViewportPoint((part_cframe * CFrame.new(-size_X, -size_Y, size_Z)).p)
			local Bottom3 = camera:WorldToViewportPoint((part_cframe * CFrame.new(size_X, -size_Y, size_Z)).p)
			local Bottom4 = camera:WorldToViewportPoint((part_cframe * CFrame.new(size_X, -size_Y, -size_Z)).p)
			
			quads.quad1.PointA = Vector2.new(Top1.X, Top1.Y)
			quads.quad1.PointB = Vector2.new(Top2.X, Top2.Y)
			quads.quad1.PointC = Vector2.new(Top3.X, Top3.Y)
			quads.quad1.PointD = Vector2.new(Top4.X, Top4.Y)
			
			quads.quad2.PointA = Vector2.new(Bottom1.X, Bottom1.Y)
			quads.quad2.PointB = Vector2.new(Bottom2.X, Bottom2.Y)
			quads.quad2.PointC = Vector2.new(Bottom3.X, Bottom3.Y)
			quads.quad2.PointD = Vector2.new(Bottom4.X, Bottom4.Y)
			
			quads.quad3.PointA = Vector2.new(Top1.X, Top1.Y)
			quads.quad3.PointB = Vector2.new(Top2.X, Top2.Y)
			quads.quad3.PointC = Vector2.new(Bottom2.X, Bottom2.Y)
			quads.quad3.PointD = Vector2.new(Bottom1.X, Bottom1.Y)
			
			quads.quad4.PointA = Vector2.new(Top2.X, Top2.Y)
			quads.quad4.PointB = Vector2.new(Top3.X, Top3.Y)
			quads.quad4.PointC = Vector2.new(Bottom3.X, Bottom3.Y)
			quads.quad4.PointD = Vector2.new(Bottom2.X, Bottom2.Y)
			
			quads.quad5.PointA = Vector2.new(Top3.X, Top3.Y)
			quads.quad5.PointB = Vector2.new(Top4.X, Top4.Y)
			quads.quad5.PointC = Vector2.new(Bottom4.X, Bottom4.Y)
			quads.quad5.PointD = Vector2.new(Bottom3.X, Bottom3.Y)
			
			quads.quad6.PointA = Vector2.new(Top4.X, Top4.Y)
			quads.quad6.PointB = Vector2.new(Top1.X, Top1.Y)
			quads.quad6.PointC = Vector2.new(Bottom1.X, Bottom1.Y)
			quads.quad6.PointD = Vector2.new(Bottom4.X, Bottom4.Y)
			
			local current_color = get_color3_from_flag(flags["chams_color"]) or Color3.fromRGB(200, 200, 200)
			if not is_visible and flags["chams_enabled_invisible"] then
				current_color = get_color3_from_flag(flags["chams_invisible_color"]) or Color3.fromRGB(120, 120, 120)
			end
			
			ColorizeQuads(current_color, quads)
			setQuadsVisible(true)
			
			if not players:FindFirstChild(player.Name) then
				safe_disconnect(connection)
				RemoveChams(player)
				return
			end
		end)
		
		if not chams_connections[player] then
			chams_connections[player] = {}
		end
		chams_connections[player][part_obj] = connection
	end
	
	local function SetupChams(player)
		if player == local_player then
			return
		end
		
		if not player or not player.Parent then
			return
		end
		
		RemoveChams(player)
		
		task.spawn(function()
			if not player.Character then
				player.CharacterAdded:Wait()
			end
			
			if not player or not player.Parent then
				return
			end
			
			repeat
				task.wait(0.1)
				if not player or not player.Parent then
					return
				end
			until player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("Head")
			
			if not flags["chams_enabled"] or not player or not player.Parent then
				return
			end
			
			if not player.Character then
				return
			end
			
			for _, part in pairs(player.Character:GetChildren()) do
				if part:IsA("MeshPart") or part.Name == "Head" or part.Name == "Left Arm" or part.Name == "Right Arm" or part.Name == "Right Leg" or part.Name == "Left Leg" or part.Name == "Torso" then
					ESP(part, player)
				end
			end
			
			player.Character.ChildAdded:Connect(function(child)
				if child:IsA("MeshPart") or child.Name == "Head" or child.Name == "Left Arm" or child.Name == "Right Arm" or child.Name == "Right Leg" or child.Name == "Left Leg" or child.Name == "Torso" then
					ESP(child, player)
				end
			end)
		end)
	end
	
	esp_section:toggle({
		name = "chams",
		flag = "chams_enabled",
		default = false,
		settings = {
			invisible = {
				name = "invis chams",
				default = false,
				callback = function(bool)
				end,
			},
		},
		callback = function(bool)
			for player, quads_table in pairs(chams_quads) do
				if quads_table then
					for part, quads in pairs(quads_table) do
						if quads then
							for _, quad in pairs(quads) do
								if quad then
									quad.Visible = false
								end
							end
						end
					end
				end
			end
			
			if bool then
				for _, player in pairs(players:GetPlayers()) do
					if player ~= local_player and player.Parent then
						SetupChams(player)
						
						if not chams_connections[player] or not chams_connections[player].character then
							if not chams_connections[player] then
								chams_connections[player] = {}
							end
							chams_connections[player].character = player.CharacterAdded:Connect(function(character)
								if not player or not player.Parent or player == local_player then
									return
								end
								if flags["chams_enabled"] then
									RemoveChams(player)
									SetupChams(player)
								end
							end)
						end
					end
				end
			else
				RemoveAllChams()
			end
		end,
	})
	:colorpicker({
		flag = "chams_color",
		color = Color3.fromRGB(200, 200, 200),
	})
	:colorpicker({
		flag = "chams_invisible_color",
		color = Color3.fromRGB(0, 0, 0),
	})
	
	local function NewESPQuad(thickness, color)
		local quad = Drawing.new("Quad")
		quad.Visible = false
		quad.PointA = Vector2.new(0, 0)
		quad.PointB = Vector2.new(0, 0)
		quad.PointC = Vector2.new(0, 0)
		quad.PointD = Vector2.new(0, 0)
		quad.Color = color
		quad.Filled = false
		quad.Thickness = thickness
		quad.Transparency = 1
		return quad
	end
	
	local function NewESPLine(thickness, color)
		local line = Drawing.new("Line")
		line.Visible = false
		line.From = Vector2.new(0, 0)
		line.To = Vector2.new(0, 0)
		line.Color = color
		line.Thickness = thickness
		line.Transparency = 1
		return line
	end
	
	local function NewESPText(text, size, color)
		local text_drawing = Drawing.new("Text")
		text_drawing.Visible = false
		text_drawing.Text = text
		text_drawing.Size = size
		text_drawing.Color = color or Color3.fromRGB(255, 255, 255)
		text_drawing.Transparency = 1
		text_drawing.Outline = true
		text_drawing.OutlineColor = Color3.fromRGB(0, 0, 0)
		text_drawing.Center = true
		if library and library.font then
			text_drawing.Font = library.font
		end
		return text_drawing
	end
	
	local esp_libraries = {} 
	local esp_connections = {} 
	local esp_character_connections = {} 
	
	local function RemoveESP(player)
		if not player then return end
		
		local connection = esp_connections[player]
		if connection then
			esp_connections[player] = nil
			if typeof(connection) == "RBXScriptConnection" then
				pcall(function()
					connection:Disconnect()
				end)
			end
		end
		
		local char_connection = esp_character_connections[player]
		if char_connection then
			esp_character_connections[player] = nil
			if typeof(char_connection) == "RBXScriptConnection" then
				pcall(function()
					char_connection:Disconnect()
				end)
			end
		end
		
		local library = esp_libraries[player]
		if library then
			esp_libraries[player] = nil
			if library.box then
				pcall(function()
					library.box.Visible = false
					library.box:Remove()
				end)
			end
			if library.black then
				pcall(function()
					library.black.Visible = false
					library.black:Remove()
				end)
			end
			if library.tracer then
				pcall(function()
					library.tracer.Visible = false
					library.tracer:Remove()
				end)
			end
			if library.blacktracer then
				pcall(function()
					library.blacktracer.Visible = false
					library.blacktracer:Remove()
				end)
			end
			if library.healthbar then
				pcall(function()
					library.healthbar.Visible = false
					library.healthbar:Remove()
				end)
			end
			if library.greenhealth then
				pcall(function()
					library.greenhealth.Visible = false
					library.greenhealth:Remove()
				end)
			end
			if library.nametext then
				pcall(function()
					library.nametext.Visible = false
					library.nametext:Remove()
				end)
			end
			if library.distancetext then
				pcall(function()
					library.distancetext.Visible = false
					library.distancetext:Remove()
				end)
			end
		end

	end
	
	local function HideAllESP()
		for player, library in pairs(esp_libraries) do
			if library then
				for _, drawing in pairs(library) do
					if drawing then
						drawing.Visible = false
					end
				end
			end
		end
	end
	
	local function RemoveAllESP()
		HideAllESP()
		
		for player, _ in pairs(esp_libraries) do
			RemoveESP(player)
		end
		for player, connection in pairs(esp_character_connections) do
			if connection and typeof(connection) == "RBXScriptConnection" then
				pcall(function()
					connection:Disconnect()
				end)
			end
		end
		esp_libraries = {}
		esp_connections = {}
		esp_character_connections = {}

	end
	
	local function SetupESP(player)
		if player == local_player then
			return
		end
		
		if not player or not player.Parent then
			return
		end
		
		RemoveESP(player)
		
		if not flags["box_esp_enabled"] and not flags["tracers_enabled"] and not flags["healthbar_enabled"] and not flags["name_esp_enabled"] and not flags["distance_esp_enabled"] then
			return
		end
		
		local black = Color3.fromRGB(0, 0, 0)
		local box_color = get_color3_from_flag(flags["box_esp_color"]) or Color3.fromRGB(200, 200, 200)
		local tracer_color = get_color3_from_flag(flags["tracer_esp_color"]) or Color3.fromRGB(200, 200, 200)
		local name_color = get_color3_from_flag(flags["name_esp_color"]) or Color3.fromRGB(255, 255, 255)
		local distance_color = get_color3_from_flag(flags["distance_esp_color"]) or Color3.fromRGB(255, 255, 255)
		
		local library = {
			blacktracer = flags["tracers_enabled"] and NewESPLine(2, black) or nil,
			tracer = flags["tracers_enabled"] and NewESPLine(1, tracer_color) or nil,
			black = flags["box_esp_enabled"] and NewESPQuad(2, black) or nil,
			box = flags["box_esp_enabled"] and NewESPQuad(1, box_color) or nil,
			healthbar = flags["healthbar_enabled"] and NewESPLine(3, black) or nil,
			greenhealth = flags["healthbar_enabled"] and NewESPLine(1.5, black) or nil,
			nametext = flags["name_esp_enabled"] and NewESPText("", 14, name_color) or nil,
			distancetext = flags["distance_esp_enabled"] and NewESPText("", 14, distance_color) or nil
		}
		
		esp_libraries[player] = library
		
		local connection
		connection = run_service.RenderStepped:Connect(function()
			if not player or not player.Parent or not players:FindFirstChild(player.Name) then
				pcall(function()
					connection:Disconnect()
				end)
				RemoveESP(player)
			return
		end

			if getgenv().library and getgenv().library.ui_open then
				for _, drawing in pairs(library) do
					if drawing then
						drawing.Visible = false
					end
				end
				return
			end
		
			local box_enabled = flags["box_esp_enabled"] or false
			local tracers_enabled = flags["tracers_enabled"] or false
			local healthbar_enabled = flags["healthbar_enabled"] or false
			local name_esp_enabled = flags["name_esp_enabled"] or false
			local distance_esp_enabled = flags["distance_esp_enabled"] or false
			
			if not box_enabled and not tracers_enabled and not healthbar_enabled and not name_esp_enabled and not distance_esp_enabled then
				for _, drawing in pairs(library) do
					if drawing then
						drawing.Visible = false
					end
				end
			return
		end
		
			local character = player.Character
			if not character then
				for _, drawing in pairs(library) do
					if drawing then
						drawing.Visible = false
					end
				end
			return
		end
		
			local humanoid = character:FindFirstChild("Humanoid")
			local humanoid_root_part = character:FindFirstChild("HumanoidRootPart")
			local head = character:FindFirstChild("Head")
			
			if not humanoid or not humanoid_root_part or not head or humanoid.Health <= 0 then
				for _, drawing in pairs(library) do
					if drawing then
						drawing.Visible = false
					end
				end
			return
		end
		
			if has_forcefield(player) then
				for _, drawing in pairs(library) do
					if drawing then
						drawing.Visible = false
					end
				end
				return
			end
		
			local hum_pos, on_screen = camera:WorldToViewportPoint(humanoid_root_part.Position)
			if not on_screen then
				for _, drawing in pairs(library) do
					if drawing then
						drawing.Visible = false
					end
				end
				return
			end
			
			local head_pos = camera:WorldToViewportPoint(head.Position)
			local distance_y = math.clamp((Vector2.new(head_pos.X, head_pos.Y) - Vector2.new(hum_pos.X, hum_pos.Y)).Magnitude, 2, math.huge)
			local max_distance = flags["chams_distance"] or 2000
			local distance_from_cam = (humanoid_root_part.Position - camera.CFrame.Position).Magnitude
			if distance_from_cam > max_distance then
				for _, drawing in pairs(library) do
					if drawing then
						drawing.Visible = false
					end
				end
				return
			end
			
			if flags["esp_visible_only"] then
				local camera_position = camera.CFrame.Position
				local is_visible = raycast_wallcheck(camera_position, head.Position, character)
				if not is_visible then
					for _, drawing in pairs(library) do
						if drawing then
							drawing.Visible = false
						end
					end
					return
				end
			end

			
			if not box_enabled then
				if library.box then library.box.Visible = false end
				if library.black then library.black.Visible = false end
			elseif box_enabled and library.box and library.black then
				local function Size(item)
					item.PointA = Vector2.new(hum_pos.X + distance_y, hum_pos.Y - distance_y * 2)
					item.PointB = Vector2.new(hum_pos.X - distance_y, hum_pos.Y - distance_y * 2)
					item.PointC = Vector2.new(hum_pos.X - distance_y, hum_pos.Y + distance_y * 2)
					item.PointD = Vector2.new(hum_pos.X + distance_y, hum_pos.Y + distance_y * 2)
				end
				Size(library.box)
				Size(library.black)
				
				local box_color = get_color3_from_flag(flags["box_esp_color"]) or Color3.fromRGB(200, 200, 200)
				library.box.Color = box_color
				library.box.Visible = true
				library.black.Visible = true
			else
				if library.box then library.box.Visible = false end
				if library.black then library.black.Visible = false end
			end
			
			if not tracers_enabled then
				if library.tracer then library.tracer.Visible = false end
				if library.blacktracer then library.blacktracer.Visible = false end
					elseif tracers_enabled and library.tracer and library.blacktracer then
						if flags["tracer_follow_mouse"] then
							local mouse_location = user_input_service:GetMouseLocation()
							library.tracer.From = mouse_location
							library.blacktracer.From = mouse_location
						else
							local tracer_origin = flags["tracer_origin"] or "bottom"
							if tracer_origin == "middle" then
								library.tracer.From = camera.ViewportSize * 0.5
								library.blacktracer.From = camera.ViewportSize * 0.5
							elseif tracer_origin == "bottom" then
								library.tracer.From = Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y)
								library.blacktracer.From = Vector2.new(camera.ViewportSize.X * 0.5, camera.ViewportSize.Y)
							elseif tracer_origin == "top" then
								library.tracer.From = Vector2.new(camera.ViewportSize.X * 0.5, 0)
								library.blacktracer.From = Vector2.new(camera.ViewportSize.X * 0.5, 0)
							end
						end
				
				library.tracer.To = Vector2.new(hum_pos.X, hum_pos.Y + distance_y * 2)
				library.blacktracer.To = Vector2.new(hum_pos.X, hum_pos.Y + distance_y * 2)
				
				local tracer_color = get_color3_from_flag(flags["tracer_esp_color"]) or Color3.fromRGB(200, 200, 200)
				library.tracer.Color = tracer_color
				library.tracer.Visible = true
				library.blacktracer.Visible = true
			else
				if library.tracer then library.tracer.Visible = false end
				if library.blacktracer then library.blacktracer.Visible = false end
			end
			
			if not healthbar_enabled then
				if library.healthbar then library.healthbar.Visible = false end
				if library.greenhealth then library.greenhealth.Visible = false end
			elseif healthbar_enabled and library.healthbar and library.greenhealth then
				local d = (Vector2.new(hum_pos.X - distance_y, hum_pos.Y - distance_y * 2) - Vector2.new(hum_pos.X - distance_y, hum_pos.Y + distance_y * 2)).Magnitude
				local health_offset = humanoid.Health / humanoid.MaxHealth * d
				
				library.greenhealth.From = Vector2.new(hum_pos.X - distance_y - 4, hum_pos.Y + distance_y * 2)
				library.greenhealth.To = Vector2.new(hum_pos.X - distance_y - 4, hum_pos.Y + distance_y * 2 - health_offset)
				
				library.healthbar.From = Vector2.new(hum_pos.X - distance_y - 4, hum_pos.Y + distance_y * 2)
				library.healthbar.To = Vector2.new(hum_pos.X - distance_y - 4, hum_pos.Y - distance_y * 2)
				
				local green = Color3.fromRGB(0, 255, 0)
				local red = Color3.fromRGB(255, 0, 0)
				library.greenhealth.Color = red:Lerp(green, humanoid.Health / humanoid.MaxHealth)
				
				library.healthbar.Visible = true
				library.greenhealth.Visible = true
			else
				if library.healthbar then library.healthbar.Visible = false end
				if library.greenhealth then library.greenhealth.Visible = false end
			end
			
			if not name_esp_enabled then
				if library.nametext then library.nametext.Visible = false end
			elseif name_esp_enabled and library.nametext then
				local display_name = player.DisplayName or player.Name
				local text_size = math.max(8, math.min(14, distance_y * 0.5))
				library.nametext.Size = text_size
				library.nametext.Text = display_name
				library.nametext.Color = get_color3_from_flag(flags["name_esp_color"]) or Color3.fromRGB(255, 255, 255)
				library.nametext.Position = Vector2.new(hum_pos.X, hum_pos.Y - distance_y * 2 - 5)
				library.nametext.Visible = true
			end
			
			if not distance_esp_enabled then
				if library.distancetext then library.distancetext.Visible = false end
			elseif distance_esp_enabled and library.distancetext then
				local distance = math.floor(distance_from_cam)
				local text_size = math.max(8, math.min(14, distance_y * 0.5))
				library.distancetext.Size = text_size
				library.distancetext.Text = tostring(distance) .. "st"
				library.distancetext.Color = get_color3_from_flag(flags["distance_esp_color"]) or Color3.fromRGB(255, 255, 255)
				library.distancetext.Position = Vector2.new(hum_pos.X, hum_pos.Y + distance_y * 2 + 5)
				library.distancetext.Visible = true
			end
		end)
		
		esp_connections[player] = connection
		
		if not esp_character_connections[player] then
			esp_character_connections[player] = player.CharacterAdded:Connect(function(character)
				if not player or not player.Parent or player == local_player then
					return
				end
				task.wait(0.1)
				if flags["box_esp_enabled"] or flags["tracers_enabled"] or flags["healthbar_enabled"] or flags["name_esp_enabled"] or flags["distance_esp_enabled"] then
					RemoveESP(player)
					task.wait(0.1)
					SetupESP(player)
				end
			end)
		end
	end
	
	esp_section:toggle({
		name = "boxes",
		flag = "box_esp_enabled",
		default = false,
		callback = function(bool)
			for player, library in pairs(esp_libraries) do
				if library then
					if library.box then
						library.box.Visible = false
						pcall(function() library.box:Remove() end)
					end
					if library.black then
						library.black.Visible = false
						pcall(function() library.black:Remove() end)
					end
				end
			end
			
			for _, player in pairs(players:GetPlayers()) do
				if player ~= local_player and player.Parent then
					if flags["box_esp_enabled"] or flags["tracers_enabled"] or flags["healthbar_enabled"] or flags["name_esp_enabled"] or flags["distance_esp_enabled"] then
						SetupESP(player)
					else
						RemoveESP(player)
					end
		end
	end
		end,
	})

	esp_section:colorpicker({
		object = "boxes",
		flag = "box_esp_color",
		color = Color3.fromRGB(200, 200, 200),
	})

	esp_section:toggle({
		name = "visible only",
		flag = "esp_visible_only",
		default = false,
	})
	
	esp_section:toggle({
		name = "forcefield check",
		flag = "forcefield_check",
		default = false,
	})
	
	esp_section:toggle({
		name = "tracers",
		flag = "tracers_enabled",
		default = false,
		settings = {
			tracer_follow_mouse = {
				name = "tracers follow mouse",
				flag = "tracer_follow_mouse",
				default = false,
			},
			tracer_origin = {
				name = "tracer origin",
				items = {"top", "middle", "bottom"},
				flag = "tracer_origin",
				default = "bottom",
			},
		},
		callback = function(bool)
			for player, library in pairs(esp_libraries) do
				if library then
					if library.tracer then
						library.tracer.Visible = false
						pcall(function() library.tracer:Remove() end)
					end
					if library.blacktracer then
						library.blacktracer.Visible = false
						pcall(function() library.blacktracer:Remove() end)
					end
				end
			end
			
			for _, player in pairs(players:GetPlayers()) do
				if player ~= local_player and player.Parent then
					if flags["box_esp_enabled"] or flags["tracers_enabled"] or flags["healthbar_enabled"] or flags["name_esp_enabled"] or flags["distance_esp_enabled"] then
						SetupESP(player)
					else
						RemoveESP(player)
					end
				end
			end
		end,
	})
	
	local tracer_flags_section = esp_section:section({ name = "settings", side = "left" })
	
	tracer_flags_section:toggle({
		name = "tracers follow mouse",
		flag = "tracer_follow_mouse",
		default = false,
	})
	
	tracer_flags_section:dropdown({
		name = "tracer origin",
		flag = "tracer_origin",
		items = {"bottom", "middle", "top"},
		default = "bottom",
	})
	
	esp_section:colorpicker({
		object = "tracers",
		flag = "tracer_esp_color",
		color = Color3.fromRGB(200, 200, 200),
	})
	
	esp_section:toggle({
		name = "names",
		flag = "name_esp_enabled",
		default = false,
		callback = function(bool)
			for player, library in pairs(esp_libraries) do
				if library then
					if library.nametext then
						library.nametext.Visible = false
						pcall(function() library.nametext:Remove() end)
					end
		end
	end
	
			for _, player in pairs(players:GetPlayers()) do
				if player ~= local_player and player.Parent then
					if flags["box_esp_enabled"] or flags["tracers_enabled"] or flags["healthbar_enabled"] or flags["name_esp_enabled"] or flags["distance_esp_enabled"] then
						SetupESP(player)
					else
						RemoveESP(player)
			end
		end
	end
		end,
	})
	
	esp_section:colorpicker({
		object = "name esp",
		flag = "name_esp_color",
		color = Color3.fromRGB(255, 255, 255),
	})
	
	esp_section:toggle({
		name = "distance",
		flag = "distance_esp_enabled",
		default = false,
		callback = function(bool)
			for player, library in pairs(esp_libraries) do
				if library then
					if library.distancetext then
						library.distancetext.Visible = false
						pcall(function() library.distancetext:Remove() end)
					end
				end
			end
			
			for _, player in pairs(players:GetPlayers()) do
				if player ~= local_player and player.Parent then
					if flags["box_esp_enabled"] or flags["tracers_enabled"] or flags["healthbar_enabled"] or flags["name_esp_enabled"] or flags["distance_esp_enabled"] then
						SetupESP(player)
					else
						RemoveESP(player)
						end
					end
			end
		end,
	})
	
	esp_section:colorpicker({
		object = "distance esp",
		flag = "distance_esp_color",
		color = Color3.fromRGB(255, 255, 255),
	})

	esp_section:toggle({
		name = "health bar",
		flag = "healthbar_enabled",
		default = false,
		callback = function(bool)
			for player, library in pairs(esp_libraries) do
				if library then
					if library.healthbar then
						library.healthbar.Visible = false
						pcall(function() library.healthbar:Remove() end)
					end
					if library.greenhealth then
						library.greenhealth.Visible = false
						pcall(function() library.greenhealth:Remove() end)
					end
				end
			end
			
			for _, player in pairs(players:GetPlayers()) do
				if player ~= local_player and player.Parent then
					if flags["box_esp_enabled"] or flags["tracers_enabled"] or flags["healthbar_enabled"] or flags["name_esp_enabled"] or flags["distance_esp_enabled"] then
						SetupESP(player)
					else
						RemoveESP(player)
					end
				end
			end
		end,
	})
	
	players.PlayerAdded:Connect(function(player)
		if player == local_player then
			return
		end
		
		if flags["chams_enabled"] then
			SetupChams(player)
			if not chams_connections[player] or not chams_connections[player].character then
				if not chams_connections[player] then
					chams_connections[player] = {}
				end
				chams_connections[player].character = player.CharacterAdded:Connect(function(character)
					if not player or not player.Parent or player == local_player then
						return
					end
					if flags["chams_enabled"] then
						RemoveChams(player)
						task.wait(0.1)
						SetupChams(player)
					end
				end)
			end
		end
		
		if flags["box_esp_enabled"] or flags["tracers_enabled"] or flags["healthbar_enabled"] or flags["name_esp_enabled"] or flags["distance_esp_enabled"] then
			SetupESP(player)
		end
	end)
	
	players.PlayerRemoving:Connect(function(player)
		RemoveChams(player)
		RemoveESP(player)
	end)
	
	
	local weapon_material_section = visuals_tab:section({ name = "weapon material", side = "right" })
	
	local material_options = {
		"Plastic",
		"Neon",
		"Metal",
		"Wood",
		"Glass",
		"ForceField",
		"Concrete",
		"CorrodedMetal",
		"DiamondPlate",
		"Fabric",
		"Granite",
		"Grass",
		"Ice",
		"Marble",
		"Pebble",
		"Slate",
		"SmoothPlastic",
		"Sand",
		"Brick",
	}
	
	local material_enum_map = {
		Plastic = Enum.Material.Plastic,
		Neon = Enum.Material.Neon,
		Metal = Enum.Material.Metal,
		Wood = Enum.Material.Wood,
		Glass = Enum.Material.Glass,
		ForceField = Enum.Material.ForceField,
		Concrete = Enum.Material.Concrete,
		CorrodedMetal = Enum.Material.CorrodedMetal,
		DiamondPlate = Enum.Material.DiamondPlate,
		Fabric = Enum.Material.Fabric,
		Granite = Enum.Material.Granite,
		Grass = Enum.Material.Grass,
		Ice = Enum.Material.Ice,
		Marble = Enum.Material.Marble,
		Pebble = Enum.Material.Pebble,
		Slate = Enum.Material.Slate,
		SmoothPlastic = Enum.Material.SmoothPlastic,
		Sand = Enum.Material.Sand,
		Brick = Enum.Material.Brick,
	}
	
	local weapon_original_sizes = {}
	
	local function update_weapon_material()
		if not flags["weapon_material_enabled"] then
			return
		end
		
		local imafedyou = workspace:FindFirstChild("imafedyou")
		if not imafedyou then
			return
		end
		
		local weapon_color = get_color3_from_flag(flags["weapon_material_color"])
		local weapon_scale = flags["weapon_scale"] or 1
		
		for _, gun_skin in ipairs(imafedyou:GetChildren()) do
			local model = gun_skin:FindFirstChild("Model")
			if model then
				local union = model:FindFirstChild("Union")
				if union and union:IsA("UnionOperation") then
					if not weapon_original_sizes[union] then
						weapon_original_sizes[union] = union.Size
					end
					
					local material_name = flags["weapon_material"] or "Neon"
					local material_enum = material_enum_map[material_name] or Enum.Material.Neon
					union.Material = material_enum
					union.Color = weapon_color
					union.Size = weapon_original_sizes[union] * weapon_scale
				end
			end
		end
	end
	
	weapon_material_section:toggle({
		name = "enable",
		flag = "weapon_material_enabled",
		default = false,
		callback = function(bool)
			update_weapon_material()
		end,
	})
	
	weapon_material_section:dropdown({
		name = "material",
		flag = "weapon_material",
		items = material_options,
		default = "Neon",
		callback = function(value)
			if flags["weapon_material_enabled"] then
				update_weapon_material()
			end
		end,
	})
	
	weapon_material_section:colorpicker({
		object = "enable",
		flag = "weapon_material_color",
		color = Color3.fromRGB(200, 200, 200),
		callback = function(color)
			if flags["weapon_material_enabled"] then
				update_weapon_material()
			end
			if flags["arm_material_enabled"] then
				update_arms()
			end
		end,
	})
	
	weapon_material_section:slider({
		name = "size",
		flag = "weapon_scale",
		min = 0.1,
		max = 2,
		default = 1,
		interval = 0.01,
		callback = function(value)
			if flags["weapon_material_enabled"] then
				update_weapon_material()
				update_arms()
			end
		end,
	})
	
	run_service.RenderStepped:Connect(function()
		if flags["weapon_material_enabled"] then
			update_weapon_material()
		end
	end)

	local arm_material_section = visuals_tab:section({ name = "arm material", side = "right" })
	
	local arm_original_sizes = {}
	local viewmodel_initialized = false

	local function get_viewmodel()
		return workspace:FindFirstChild("ViewModel")
	end
	
	local function update_arms()
		if not viewmodel_initialized then
			return
		end
		
		local vm = get_viewmodel()
		if not vm then
			return
		end
		
		local left_arm = vm:FindFirstChild("Left Arm")
		local right_arm = vm:FindFirstChild("Right Arm")
		
		if not left_arm or not right_arm then
			return
		end
		
		local weapon_scale = flags["weapon_scale"] or 1
		
		if not arm_original_sizes[left_arm] then
			arm_original_sizes[left_arm] = left_arm.Size
		end
		if not arm_original_sizes[right_arm] then
			arm_original_sizes[right_arm] = right_arm.Size
		end
		
		if flags["weapon_material_enabled"] then
			left_arm.Size = arm_original_sizes[left_arm] * weapon_scale
			right_arm.Size = arm_original_sizes[right_arm] * weapon_scale
		else
			left_arm.Size = arm_original_sizes[left_arm]
			right_arm.Size = arm_original_sizes[right_arm]
		end
		
		if flags["hide_arms"] then
			left_arm.Transparency = 1
			right_arm.Transparency = 1
		elseif flags["arm_material_enabled"] then
			left_arm.Transparency = 0
			right_arm.Transparency = 0
			
			local material_name = flags["arm_material"] or "Neon"
			local material_enum = material_enum_map[material_name] or Enum.Material.Neon
			
			local arm_color = nil
			if flags["weapon_material_enabled"] then
				arm_color = get_color3_from_flag(flags["weapon_material_color"])
			else
				arm_color = get_color3_from_flag(flags["arm_material_color"])
			end
			
			for _, part in ipairs({left_arm, right_arm}) do
				if part:IsA("BasePart") then
					part.Material = material_enum
					if arm_color then
						part.Color = arm_color
					end
				end
			end
		else
			left_arm.Transparency = 0
			right_arm.Transparency = 0
		end
	end
	
	arm_material_section:toggle({
		name = "enable",
		flag = "arm_material_enabled",
		default = false,
		callback = function(bool)
			update_arms()
		end,
	})
	
	arm_material_section:colorpicker({
		object = "enable",
		flag = "arm_material_color",
		color = Color3.fromRGB(200, 200, 200),
		callback = function(color)
			if flags["arm_material_enabled"] then
				update_arms()
			end
		end,
	})
	
	arm_material_section:dropdown({
		name = "material",
		flag = "arm_material",
		items = material_options,
		default = "Neon",
		callback = function(value)
			if flags["arm_material_enabled"] then
				update_arms()
			end
		end,
	})
	
	arm_material_section:toggle({
		name = "hide arms",
		flag = "hide_arms",
		default = false,
		callback = function(bool)
			update_arms()
		end,
	})
	
	local viewmodel_check_connection = nil
	local connections_setup = false
	
	viewmodel_check_connection = run_service.Heartbeat:Connect(function()
		if connections_setup then
			return
		end

		local vm = get_viewmodel()
		if not vm then
			return
		end

			viewmodel_initialized = true
			connections_setup = true
			
		vm.ChildAdded:Connect(function(child)
			if child.Name == "Left Arm" or child.Name == "Right Arm" then
				update_arms()
			end
		end)
	
	run_service.RenderStepped:Connect(function()
		if flags["arm_material_enabled"] or flags["hide_arms"] or flags["weapon_material_enabled"] then
			update_arms()
				end
			end)
			
			if viewmodel_check_connection then
				viewmodel_check_connection:Disconnect()
				viewmodel_check_connection = nil
			end
	end)

	local self_material_section = visuals_tab:section({ name = "self material", side = "right" })
	local self_material_originals = {}
	local self_material_char_conn = nil

	local function is_part_of_tool(desc)
		local parent = desc.Parent
		while parent do
			if parent:IsA("Tool") then
				return true
			end
			parent = parent.Parent
		end
		return false
	end
	
	local function restore_self_material()
		for part, data in pairs(self_material_originals) do
			if part and part.Parent and data then
				part.Material = data.Material
				part.Transparency = data.Transparency
			end
		end
		table.clear(self_material_originals)
	end
	
	local function apply_self_material()
		if not flags["self_material_enabled"] then
			return
		end
		
		local char = local_player and local_player.Character
		if not char then
			return
		end
		
		local material_name = flags["self_material_choice"] or "ForceField"
		local material_enum = material_enum_map[material_name] or Enum.Material.ForceField
		local transparency = math.clamp(flags["self_material_transparency"] or 0, 0, 1)
		
	local allowed_parts = {
		Head = true,
		Torso = true,
		["UpperTorso"] = true,
		["LowerTorso"] = true,
		["Left Arm"] = true,
		["Right Arm"] = true,
		["Left Leg"] = true,
		["Right Leg"] = true,
		["LeftUpperArm"] = true,
		["LeftLowerArm"] = true,
		["LeftHand"] = true,
		["RightUpperArm"] = true,
		["RightLowerArm"] = true,
		["RightHand"] = true,
		["LeftUpperLeg"] = true,
		["LeftLowerLeg"] = true,
		["LeftFoot"] = true,
		["RightUpperLeg"] = true,
		["RightLowerLeg"] = true,
		["RightFoot"] = true,
	}
	
	for _, desc in ipairs(char:GetDescendants()) do
		if desc:IsA("BasePart") and not is_part_of_tool(desc) and allowed_parts[desc.Name] then
			if not self_material_originals[desc] then
				self_material_originals[desc] = {
					Material = desc.Material,
					Transparency = desc.Transparency,
				}
			end
			desc.Material = material_enum
			desc.Transparency = transparency
		end
	end
	end
	
	self_material_section:toggle({
		name = "enable",
		flag = "self_material_enabled",
		default = false,
		callback = function(state)
			if state then
				apply_self_material()
			else
				restore_self_material()
			end
		end,
	})
	
	self_material_section:dropdown({
		name = "material",
		flag = "self_material_choice",
		items = material_options,
		default = "ForceField",
		callback = function()
			if flags["self_material_enabled"] then
				apply_self_material()
			end
		end,
	})
	
	self_material_section:slider({
		name = "transparency",
		flag = "self_material_transparency",
		min = 0,
		max = 1,
		default = 0,
		interval = 0.05,
		callback = function()
			if flags["self_material_enabled"] then
				apply_self_material()
			end
		end,
	})
	
	local function bind_self_material()
		if self_material_char_conn then
			self_material_char_conn:Disconnect()
			self_material_char_conn = nil
		end
		
		if local_player then
			if local_player.Character then
				restore_self_material()
				apply_self_material()
			end
			
			self_material_char_conn = local_player.CharacterAdded:Connect(function()
				restore_self_material()
				apply_self_material()
			end)
		end
	end
	
	bind_self_material()

	local skybox_section = visuals_tab:section({ name = "skybox", side = "right" })
	
	local skyPresets = {
		["none"] = nil,
		["night"] = {
			Bk = "http://www.roblox.com/asset/?id=5346760450",
			Dn = "http://www.roblox.com/asset/?id=5346760689",
			Ft = "http://www.roblox.com/asset/?id=5346760919",
			Lf = "http://www.roblox.com/asset/?id=5346761102",
			Rt = "http://www.roblox.com/asset/?id=5346761335",
			Up = "http://www.roblox.com/asset/?id=5346761509"
		},
		["starry"] = {
			Bk = "http://www.roblox.com/asset/?id=119548893",
			Dn = "http://www.roblox.com/asset/?id=119548958",
			Ft = "http://www.roblox.com/asset/?id=119549025",
			Lf = "http://www.roblox.com/asset/?id=119549075",
			Rt = "http://www.roblox.com/asset/?id=119551641",
			Up = "http://www.roblox.com/asset/?id=119551676"
		},
		["classic"] = {
			Bk = "rbxassetid://678556371",
			Dn = "rbxassetid://678556361",
			Ft = "rbxassetid://678556368",
			Lf = "rbxassetid://678556373",
			Rt = "rbxassetid://678556360",
			Up = "rbxassetid://678556362"
		},
		["snow"] = {
			Bk = "http://www.roblox.com/asset/?id=155657655",
			Dn = "http://www.roblox.com/asset/?id=155674246",
			Ft = "http://www.roblox.com/asset/?id=155657609",
			Lf = "http://www.roblox.com/asset/?id=155657671",
			Rt = "http://www.roblox.com/asset/?id=155657619",
			Up = "http://www.roblox.com/asset/?id=155674931"
		}
	}
	
	local defaultSky = lighting:FindFirstChildOfClass("Sky")
	local defaultSkyProps = defaultSky and {
		Bk = defaultSky.SkyboxBk,
		Dn = defaultSky.SkyboxDn,
		Ft = defaultSky.SkyboxFt,
		Lf = defaultSky.SkyboxLf,
		Rt = defaultSky.SkyboxRt,
		Up = defaultSky.SkyboxUp,
		SunTextureId = defaultSky.SunTextureId,
		MoonTextureId = defaultSky.MoonTextureId,
		SunAngularSize = defaultSky.SunAngularSize,
		MoonAngularSize = defaultSky.MoonAngularSize
	}
	
	local function apply_skybox(skybox_name)
		local sky = lighting:FindFirstChildOfClass("Sky")
		if not sky then
			sky = Instance.new("Sky")
			sky.Parent = lighting
		end
		
		local preset = skyPresets[skybox_name]
		if preset == nil then
			if defaultSkyProps and defaultSky then
				sky.SkyboxBk = defaultSkyProps.Bk
				sky.SkyboxDn = defaultSkyProps.Dn
				sky.SkyboxFt = defaultSkyProps.Ft
				sky.SkyboxLf = defaultSkyProps.Lf
				sky.SkyboxRt = defaultSkyProps.Rt
				sky.SkyboxUp = defaultSkyProps.Up
			end
		else
			sky.SkyboxBk = preset.Bk
			sky.SkyboxDn = preset.Dn
			sky.SkyboxFt = preset.Ft
			sky.SkyboxLf = preset.Lf
			sky.SkyboxRt = preset.Rt
			sky.SkyboxUp = preset.Up
		end
	end
	
	skybox_section:dropdown({
		name = "skybox",
		flag = "skybox_preset",
		items = {"none", "night", "starry", "classic", "snow"},
		default = "none",
		callback = function(value)
			apply_skybox(value)
		end,
	})
	
	local celestial_textures = {
		["none"] = nil,
		["breachforums"] = "rbxassetid://94220513805365",
		["404chan"] = "rbxassetid://75587744096959"
	}
	
	local function update_celestial()
		local sky = lighting:FindFirstChildOfClass("Sky")
		if not sky then
			sky = Instance.new("Sky")
			sky.Parent = lighting
		end
		
		local texture = flags["celestial_texture"]
		if texture and texture ~= "none" then
			local texture_id = celestial_textures[texture]
			if texture_id then
				sky.SunTextureId = texture_id
				sky.MoonTextureId = texture_id
			end
		else
			if defaultSkyProps then
				if defaultSkyProps.SunTextureId then
					sky.SunTextureId = defaultSkyProps.SunTextureId
				end
				if defaultSkyProps.MoonTextureId then
					sky.MoonTextureId = defaultSkyProps.MoonTextureId
				end
			end
		end
		
		if flags["celestial_size"] then
			sky.SunAngularSize = flags["celestial_size"]
			sky.MoonAngularSize = flags["celestial_size"]
		end
	end
	
	skybox_section:slider({
		name = "clocktime",
		flag = "clocktime",
		min = 0,
		max = 24,
		default = lighting.ClockTime or 12,
		interval = 0.01,
		callback = function(value)
			lighting.ClockTime = value
		end,
	})
	
	skybox_section:dropdown({
		name = "celestial texture",
		flag = "celestial_texture",
		items = {"none", "breachforums", "404chan"},
		default = "none",
		callback = function(value)
			update_celestial()
		end,
	})
	
	skybox_section:slider({
		name = "celestial size",
		flag = "celestial_size",
		min = 0,
		max = 60,
		default = 21,
		interval = 1,
		callback = function(value)
			update_celestial()
		end,
	})

	local atmosphere_section = visuals_tab:section({ name = "atmosphere", side = "left" })
	
	local default_atmosphere_props = nil
	local created_custom_atmo = false
	
	local function get_atmosphere()
		local atmo = lighting:FindFirstChildOfClass("Atmosphere")
		if not atmo then
			atmo = Instance.new("Atmosphere")
			atmo.Name = "CustomAtmosphere"
			atmo.Parent = lighting
			created_custom_atmo = true
		end
		return atmo
	end
	
	local function store_atmosphere_defaults()
		if default_atmosphere_props then
			return
		end
		local atmo = lighting:FindFirstChildOfClass("Atmosphere")
		if atmo then
			default_atmosphere_props = {
				Color = atmo.Color,
				Decay = atmo.Decay,
				Density = atmo.Density,
				Offset = atmo.Offset,
				Glare = atmo.Glare,
				Haze = atmo.Haze,
			}
		end
	end
	
	local function restore_atmosphere()
		local atmo = lighting:FindFirstChildOfClass("Atmosphere")
		if not atmo then
			return
		end
		if default_atmosphere_props then
			atmo.Color = default_atmosphere_props.Color
			atmo.Decay = default_atmosphere_props.Decay
			atmo.Density = default_atmosphere_props.Density
			atmo.Offset = default_atmosphere_props.Offset
			atmo.Glare = default_atmosphere_props.Glare
			atmo.Haze = default_atmosphere_props.Haze
		elseif atmo.Name == "CustomAtmosphere" then
			atmo:Destroy()
		end
	end
	
	local function apply_atmosphere()
		if not flags["atmosphere_enabled"] then
			return
		end
		
		store_atmosphere_defaults()
		local atmo = get_atmosphere()
		atmo.Color = get_color3_from_flag(flags["atmosphere_color"]) or Color3.new(255/255, 255/255, 255/255)
		atmo.Decay = get_color3_from_flag(flags["atmosphere_decay"]) or Color3.new(255/255, 255/255, 255/255)
		atmo.Density = flags["atmosphere_density"] or 0.3
		atmo.Offset = flags["atmosphere_offset"] or 0.25
		atmo.Glare = flags["atmosphere_glare"] or 0
		atmo.Haze = flags["atmosphere_haze"] or 2
	end
	
	atmosphere_section:toggle({
		name = "enable",
		flag = "atmosphere_enabled",
		default = false,
		callback = function(state)
			if state then
				apply_atmosphere()
			else
				restore_atmosphere()
			end
		end,
	})
	
	atmosphere_section:colorpicker({
		object = "color",
		flag = "atmosphere_color",
		color = Color3.fromRGB(255, 255, 255),
		callback = function()
			if flags["atmosphere_enabled"] then
				apply_atmosphere()
			end
		end,
	})
	
	atmosphere_section:colorpicker({
		object = "decay",
		flag = "atmosphere_decay",
		color = Color3.fromRGB(200, 200, 200),
		callback = function()
			if flags["atmosphere_enabled"] then
				apply_atmosphere()
			end
		end,
	})
	
	atmosphere_section:slider({
		name = "density",
		flag = "atmosphere_density",
		min = 0,
		max = 1,
		default = 0.3,
		interval = 0.01,
		callback = function()
			if flags["atmosphere_enabled"] then
				apply_atmosphere()
			end
		end,
	})
	
	atmosphere_section:slider({
		name = "offset",
		flag = "atmosphere_offset",
		min = -1,
		max = 1,
		default = 0.25,
		interval = 0.01,
		callback = function()
			if flags["atmosphere_enabled"] then
				apply_atmosphere()
			end
		end,
	})
	
	atmosphere_section:slider({
		name = "glare",
		flag = "atmosphere_glare",
		min = 0,
		max = 10,
		default = 0,
		interval = 0.1,
		callback = function()
			if flags["atmosphere_enabled"] then
				apply_atmosphere()
			end
		end,
	})
	
	atmosphere_section:slider({
		name = "haze",
		flag = "atmosphere_haze",
		min = 0,
		max = 10,
		default = 2,
		interval = 0.1,
		callback = function()
			if flags["atmosphere_enabled"] then
				apply_atmosphere()
			end
		end,
	})
	
	local bloom_section = visuals_tab:section({ name = "bloom", side = "right" })
	
	local default_bloom_props = nil
	
	local function get_bloom()
		local bloom = lighting:FindFirstChildOfClass("BloomEffect")
		if not bloom then
			bloom = Instance.new("BloomEffect")
			bloom.Name = "CustomBloom"
			bloom.Parent = lighting
		end
		return bloom
	end
	
	local function store_bloom_defaults()
		if default_bloom_props then
			return
		end
		local bloom = lighting:FindFirstChildOfClass("BloomEffect")
		if bloom then
			default_bloom_props = {
				Intensity = bloom.Intensity,
				Size = bloom.Size,
				Threshold = bloom.Threshold,
				Enabled = bloom.Enabled,
			}
		end
	end
	
	local function restore_bloom()
		local bloom = lighting:FindFirstChildOfClass("BloomEffect")
		if not bloom then
			return
		end
		if default_bloom_props then
			bloom.Intensity = default_bloom_props.Intensity
			bloom.Size = default_bloom_props.Size
			bloom.Threshold = default_bloom_props.Threshold
			bloom.Enabled = default_bloom_props.Enabled
		elseif bloom.Name == "CustomBloom" then
			bloom:Destroy()
		else
			bloom.Enabled = false
		end
	end
	
	local function apply_bloom()
		if not flags["bloom_enabled"] then
			return
		end
		
		store_bloom_defaults()
		local bloom = get_bloom()
		bloom.Enabled = true
		bloom.Intensity = flags["bloom_intensity"] or 1
		bloom.Size = flags["bloom_size"] or 24
		bloom.Threshold = flags["bloom_threshold"] or 1
	end
	
	bloom_section:toggle({
		name = "enable",
		flag = "bloom_enabled",
		default = false,
		callback = function(state)
			if state then
				apply_bloom()
			else
				restore_bloom()
			end
		end,
	})
	
	bloom_section:slider({
		name = "intensity",
		flag = "bloom_intensity",
		min = 0,
		max = 10,
		default = 1,
		interval = 0.1,
		callback = function()
			if flags["bloom_enabled"] then
				apply_bloom()
			end
		end,
	})
	
	bloom_section:slider({
		name = "size",
		flag = "bloom_size",
		min = 0,
		max = 100,
		default = 24,
		interval = 1,
		callback = function()
			if flags["bloom_enabled"] then
				apply_bloom()
			end
		end,
	})
	
	bloom_section:slider({
		name = "threshold",
		flag = "bloom_threshold",
		min = 0,
		max = 5,
		default = 1,
		interval = 0.1,
		callback = function()
			if flags["bloom_enabled"] then
				apply_bloom()
			end
		end,
	})

	local stretch_section = visuals_tab:section({ name = "stretched res", side = "left" })
	local stretch_connection = nil
	
	local function disconnect_stretch()
		if stretch_connection then
			stretch_connection:Disconnect()
			stretch_connection = nil
		end
	end
	
	local function get_stretch_scale()
		local ui_value = math.max(flags["stretch_factor"] or 1, 0.01)
		-- Invert, but clamp to <=1 so Roblox doesn't clamp away values >1.
		-- Slider up → smaller scale → more stretch; neutral at 1.
		return math.clamp(1 / ui_value, 0.01, 1)
	end
	
	local function apply_stretch()
		disconnect_stretch()
		if not flags["stretch_enabled"] then
			return
		end
		
		stretch_connection = run_service.RenderStepped:Connect(function()
			if camera then
				local f = get_stretch_scale()
				-- Stretch using the provided formula: scale the Y basis; X/Z unchanged.
				-- CFrame.new(x, y, z, r00, r01, r02, r10, r11, r12, r20, r21, r22)
				local magic = CFrame.new(0, 0, 0, 1, 0, 0, 0, f, 0, 0, 0, 1)
				camera.CFrame = camera.CFrame * magic
			end
		end)
	end
	
	stretch_section:toggle({
		name = "enable stretch",
		flag = "stretch_enabled",
		default = false,
		callback = function(state)
			apply_stretch()
		end,
	})
	
	stretch_section:slider({
		name = "stretch factor",
		flag = "stretch_factor",
		min = 1,
		max = 5,
		default = 1,
		interval = 0.01,
		callback = function(value)
			if flags["stretch_enabled"] then
				apply_stretch()
			end
		end,
	})

	local function cleanup_visual_effects()
		pcall(ClearChinaHat)
		pcall(disable_souls)
		pcall(clear_bullet_tracers)
		pcall(restore_self_material)
		pcall(restore_atmosphere)
		pcall(restore_bloom)
		disconnect_stretch()
	end

local weather_section = visuals_tab:section({ name = "weather", side = "left" })

local rain_parts = {}
local rain_spawn_radius = 300
local rain_spawn_height = 100

weather_section:toggle({
	name = "cry in the rain",
	flag = "rain_enabled",
	default = false,
	callback = function(bool)
		if not bool then
			for _, part in ipairs(rain_parts) do
				if part and part.Parent then
					part:Destroy()
				end
			end
			rain_parts = {}
		end
	end,
})

weather_section:colorpicker({
	object = "rain",
	flag = "rain_color",
	color = Color3.fromRGB(200, 200, 200),
})

weather_section:slider({
	name = "rain speed",
	flag = "rain_speed",
	min = 0.1,
	max = 10,
		default = 0.5,
		interval = 0.1,
	})

weather_section:slider({
	name = "rain size",
	flag = "rain_size",
	min = 1,
	max = 20,
		default = 10,
		interval = 1,
	})

local snow_parts = {}
local snow_spawn_radius = 300
local snow_spawn_height = 100

weather_section:toggle({
	name = "cry in the snow",
	flag = "snow_enabled",
	default = false,
	callback = function(bool)
		if not bool then
			for _, part in ipairs(snow_parts) do
				if part and part.Parent then
					part:Destroy()
				end
			end
			snow_parts = {}
		end
	end,
})

weather_section:colorpicker({
	object = "snow",
	flag = "snow_color",
	color = Color3.fromRGB(255, 255, 255),
})

weather_section:slider({
	name = "snow speed",
	flag = "snow_speed",
	min = 0.1,
	max = 10,
	default = 0.1,
	interval = 0.1,
})

weather_section:slider({
	name = "snow size",
	flag = "snow_size",
	min = 1,
	max = 20,
	default = 5,
	interval = 1,
})

local misc_tab = window:tab({ name = "misc" })
local visual_misc_section = visuals_tab:section({ name = "misc", side = "left" })
local misc_movement_section = misc_tab:section({ name = "movement", side = "left" })
local misc_spin_section = misc_tab:section({ name = "spin", side = "right" })

local china_hat_lines = {}

local function ClearChinaHat()
	for _, lines in pairs(china_hat_lines) do
		for _, line in ipairs(lines) do
			if line and line.Remove then
				pcall(function()
					line:Remove()
				end)
			end
		end
	end
	china_hat_lines = {}
end

visual_misc_section:toggle({
	name = "china hat",
	flag = "china_hat_enabled",
	default = false,
	callback = function(bool)
		if not bool then
			for player, lines in pairs(china_hat_lines) do
				for _, line in ipairs(lines) do
					if line and line.Remove then
						line:Remove()
					end
				end
			end
			china_hat_lines = {}
		end
	end,
})

visual_misc_section:colorpicker({
	object = "china hat",
	flag = "china_hat_color",
	color = Color3.fromRGB(200, 200, 200),
	})

local soul_templates = nil
local applied_souls = {}
local soul_workspace_conn = nil
local soul_color = Color3.fromRGB(255, 255, 255)

local function build_soul_templates()
	if soul_templates then
		soul_templates:Destroy()
		soul_templates = nil
	end

	local Attachment = Instance.new("Attachment")

	local Sparks = Instance.new("ParticleEmitter")
	Sparks.Name = "Sparks"
	Sparks.Lifetime = NumberRange.new(1, 2.2)
	Sparks.SpreadAngle = Vector2.new(180, 180)
	Sparks.LightEmission = 1
	Sparks.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
	Sparks.Drag = 2
	Sparks.VelocitySpread = 180
	Sparks.Speed = NumberRange.new(6, 10)
	Sparks.Brightness = 2
	Sparks.Rate = 16
	Sparks.Size = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.35, 0.6, 0.5),
		NumberSequenceKeypoint.new(1, 0),
	})
	Sparks.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.5, 0.45),
		NumberSequenceKeypoint.new(1, 1),
	})
	Sparks.Acceleration = Vector3.new(0, 4, 0)
	Sparks.ZOffset = -1
	Sparks.Texture = "rbxassetid://8611887361"
	Sparks.RotSpeed = NumberRange.new(-30, 30)
	Sparks.Orientation = Enum.ParticleOrientation.VelocityParallel
	Sparks.Parent = Attachment

	local StarSparks = Instance.new("ParticleEmitter")
	StarSparks.Name = "Star Sparks"
	StarSparks.Lifetime = NumberRange.new(1.4, 2.4)
	StarSparks.SpreadAngle = Vector2.new(180, 180)
	StarSparks.LightEmission = 1
	StarSparks.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
	StarSparks.Drag = 2
	StarSparks.VelocitySpread = 180
	StarSparks.Speed = NumberRange.new(4, 8)
	StarSparks.Brightness = 2
	StarSparks.Rate = 12
	StarSparks.Size = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.35, 0.65, 0.65),
		NumberSequenceKeypoint.new(1, 0),
	})
	StarSparks.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.5, 0.5),
		NumberSequenceKeypoint.new(1, 1),
	})
	StarSparks.Acceleration = Vector3.new(0, 4, 0)
	StarSparks.ZOffset = 2
	StarSparks.Texture = "rbxassetid://8611887703"
	StarSparks.RotSpeed = NumberRange.new(-30, 30)
	StarSparks.Rotation = NumberRange.new(-30, 30)
	StarSparks.Parent = Attachment

	local StarSparks2 = StarSparks:Clone()
	StarSparks2.Parent = Attachment

	soul_templates = Attachment
	return soul_templates
end

local function cleanup_soul(model)
	local atts = applied_souls[model]
	if atts then
		applied_souls[model] = nil
		for _, att in ipairs(atts) do
			pcall(function()
				for _, desc in ipairs(att:GetDescendants()) do
					if desc:IsA("ParticleEmitter") then
						desc.Enabled = false
						desc.Rate = 0
					end
				end
				task.delay(2, function()
					pcall(function()
						att:Destroy()
					end)
				end)
			end)
		end
	end
end

local function find_deadbody_model(inst)
	if not inst then return nil end
	if inst:IsA("Model") and inst.Name == "deadbody" then
		return inst
	end
	local ancestor = inst:FindFirstAncestorWhichIsA("Model")
	if ancestor and ancestor.Name == "deadbody" then
		return ancestor
	end
	return nil
end

local function get_deadbody_root(model)
	if not model then return nil end
	return model:FindFirstChild("HumanoidRootPart")
		or model.PrimaryPart
		or model:FindFirstChild("LowerTorso")
		or model:FindFirstChild("Torso")
		or model:FindFirstChild("UpperTorso")
		or model:FindFirstChildWhichIsA("BasePart")
end

local function apply_soul_particles(inst)
	local model = find_deadbody_model(inst)
	if not model or applied_souls[model] then
		return
	end

	local template = soul_templates
	if not template then
		return
	end

	local root = get_deadbody_root(model)
	if not root then
		return
	end

	local att = template:Clone()
	att.Parent = root
	applied_souls[model] = { att }

	model.AncestryChanged:Connect(function(_, parent)
		if not parent then
			cleanup_soul(model)
		end
	end)
end

local function disable_souls()
	for model, _ in pairs(applied_souls) do
		cleanup_soul(model)
	end
	if soul_workspace_conn then
		soul_workspace_conn:Disconnect()
		soul_workspace_conn = nil
	end
end

local function enable_souls()
	disable_souls()
	build_soul_templates()
	for _, child in ipairs(workspace:GetDescendants()) do
		apply_soul_particles(child)
	end
	soul_workspace_conn = workspace.DescendantAdded:Connect(function(child)
		apply_soul_particles(child)
	end)
end

visual_misc_section:toggle({
	name = "soul particles",
	flag = "soul_particles_enabled",
	default = false,
	callback = function(state)
		if state then
			enable_souls()
		else
			disable_souls()
		end
	end,
})

local bullet_tracers = {}
local function clear_bullet_tracers()
	for _, tracer in ipairs(bullet_tracers) do
		if tracer.line then
			pcall(function()
				tracer.line.Visible = false
				tracer.line:Remove()
			end)
		end
	end
	table.clear(bullet_tracers)
end

local function project_world_to_screen(pos)
	if not camera then return nil end
	local p, on_screen = camera:WorldToViewportPoint(pos)
	if on_screen then
		return Vector2.new(p.X, p.Y)
	end
	return nil
end

local input_service = uis or game:GetService("UserInputService")

input_service.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		if not flags["bullet_tracers_enabled"] then
			return
		end
		local muzzle_pos, muzzle_dir = get_muzzle_world()
		if not muzzle_pos or not muzzle_dir then
			return
		end

		local tracer_len = 2000
		local end_pos = muzzle_pos + (muzzle_dir * tracer_len)
		local line = Drawing.new("Line")
		line.Thickness = 2
		line.Transparency = 1
		line.Color = get_color3_from_flag(flags["bullet_tracer_color"]) or Color3.fromRGB(200, 200, 200)
		line.Visible = true

		table.insert(bullet_tracers, {
			line = line,
			start_pos = muzzle_pos,
			end_pos = end_pos,
			created = tick(),
			lifetime = flags["bullet_tracer_lifetime"] or 1,
		})
	end
end)

run_service.RenderStepped:Connect(function()
	if not camera then return end
	for i = #bullet_tracers, 1, -1 do
		local t = bullet_tracers[i]
		local age = tick() - t.created
		local life = t.lifetime or 1
		if age >= life then
			if t.line then
				pcall(function() t.line:Remove() end)
			end
			table.remove(bullet_tracers, i)
		else
			local alpha = 1 - (age / life)
			local from2d = project_world_to_screen(t.start_pos)
			local to2d = project_world_to_screen(t.end_pos)
			if from2d and to2d then
				t.line.From = from2d
				t.line.To = to2d
				t.line.Transparency = alpha
				t.line.Visible = true
				t.line.Color = get_color3_from_flag(flags["bullet_tracer_color"]) or t.line.Color
			else
				t.line.Visible = false
			end
		end
	end
end)

visual_misc_section:toggle({
	name = "bullet tracers",
	flag = "bullet_tracers_enabled",
	default = false,
})

visual_misc_section:slider({
	name = "tracer lifetime",
	flag = "bullet_tracer_lifetime",
	min = 0.05,
	max = 3,
	default = 1,
	interval = 0.05,
})

visual_misc_section:colorpicker({
	object = "bullet tracers",
	flag = "bullet_tracer_color",
	color = Color3.fromRGB(200, 200, 200),
})

misc_movement_section:toggle({
	name = "bhop",
	flag = "bhop_enabled",
	default = false,
})

misc_movement_section:toggle({
	name = "speed",
	flag = "speed_enabled",
	default = false,
	keybind = true,
	keybind_mode = "toggle",
	keybind_key = nil,
})

misc_movement_section:slider({
	name = "speed value",
	flag = "speed_value",
	min = 0,
	max = 50,
	default = 20,
	interval = 1,
})

local function get_root(char)
	if not char then return nil end
	return char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")
end

local function remove_spin(char)
	local root = get_root(char)
	if not root then return end
	for _, v in ipairs(root:GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
end

local function apply_spin()
	if not flags["spinbot_enabled"] then return end
	local char = local_player and local_player.Character
	local root = get_root(char)
	if not root then return end

	remove_spin(char)

	local spinSpeed = flags["spinbot_speed"] or 20
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = root
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0, spinSpeed, 0)
end

misc_spin_section:toggle({
	name = "spin bot",
	flag = "spinbot_enabled",
	default = false,
	callback = function(bool)
		if bool then
			apply_spin()
		else
			remove_spin(local_player and local_player.Character)
		end
	end,
})

misc_spin_section:slider({
	name = "spin speed",
	flag = "spinbot_speed",
	min = 1,
	max = 100,
	default = 20,
	interval = 1,
	callback = function()
		if flags["spinbot_enabled"] then
			apply_spin()
		end
	end,
})

if local_player then
	local_player.CharacterAdded:Connect(function(char)
		task.defer(function()
			if flags["spinbot_enabled"] then
				apply_spin()
			end
		end)
		char.ChildRemoved:Connect(function()
			if flags["spinbot_enabled"] then
				apply_spin()
			end
		end)
	end)
end

run_service.Heartbeat:Connect(function(dt)
	local char = local_player and local_player.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))

	if hum and flags["bhop_enabled"] then
		if hum.MoveDirection.Magnitude > 0 and hum.FloorMaterial ~= Enum.Material.Air then
			hum:ChangeState(Enum.HumanoidStateType.Jumping)
			hum.Jump = true
		end
	end

	if hum and root and flags["speed_enabled"] then
		if hum.SeatPart then
			return
		end

		local move_dir = hum.MoveDirection
		if move_dir.Magnitude > 0 then
			local speed = flags["speed_value"] or 0
			if speed > 0 then
				local delta = move_dir.Unit * speed * dt
				local target_pos = root.Position + delta
				root.CFrame = CFrame.new(target_pos, target_pos + root.CFrame.LookVector)
			end
		end
	end
end)


run_service.RenderStepped:Connect(function()
	if flags["china_hat_enabled"] then
		if getgenv().library and getgenv().library.ui_open then
			for player, lines in pairs(china_hat_lines) do
				for _, line in ipairs(lines) do
					if line then
						line.Visible = false
					end
				end
			end
			return
		end
		
		if local_player and local_player.Character then
			local head = local_player.Character:FindFirstChild("Head")
			if head then
				local camera_pos = camera.CFrame.Position
				local head_pos = head.Position
				local distance_to_head = (camera_pos - head_pos).Magnitude
				local is_first_person = distance_to_head < 5
				
				if is_first_person then
					if china_hat_lines[local_player] then
						for _, line in ipairs(china_hat_lines[local_player]) do
							if line then
								line.Visible = false
							end
						end
					end
					return
				end
				
				local hat_height = 1.0
				local hat_radius = 1.5
				local segments = 48
				
				local apex_pos = Vector3.new(head_pos.X, head_pos.Y + hat_height + 0.15, head_pos.Z)
				local base_points = {}
				local bottom_points = {}
				
				for i = 0, segments - 1 do
					local angle = (2 * math.pi * i) / segments
					table.insert(base_points, Vector3.new(
						head_pos.X + hat_radius * math.cos(angle),
						head_pos.Y + 0.2,
						head_pos.Z + hat_radius * math.sin(angle)
					))
					table.insert(bottom_points, Vector3.new(
						head_pos.X + hat_radius * 0.95 * math.cos(angle),
						head_pos.Y + 0.15,
						head_pos.Z + hat_radius * 0.95 * math.sin(angle)
					))
				end
				
				local apex_screen, apex_on_screen = camera:WorldToViewportPoint(apex_pos)
				if apex_on_screen then
					local base_screen = {}
					local bottom_screen = {}
					local any_on_screen = apex_on_screen
					
					for _, point in ipairs(base_points) do
						local screen_pos, on_screen = camera:WorldToViewportPoint(point)
						table.insert(base_screen, Vector2.new(screen_pos.X, screen_pos.Y))
						if on_screen then
							any_on_screen = true
						end
					end
					
					for _, point in ipairs(bottom_points) do
						local screen_pos, on_screen = camera:WorldToViewportPoint(point)
						table.insert(bottom_screen, Vector2.new(screen_pos.X, screen_pos.Y))
					end
					
					if any_on_screen then
						local china_hat_color = get_color3_from_flag(flags["china_hat_color"]) or Color3.fromRGB(200, 200, 200)
						local alpha = 0.42
						
						if not china_hat_lines[local_player] then
							china_hat_lines[local_player] = {}
							for i = 1, segments * 2 do
								local line = Drawing.new("Line")
								line.Visible = false
								line.Thickness = 1
								line.Transparency = 1 - alpha
								line.Color = china_hat_color
								table.insert(china_hat_lines[local_player], line)
							end
							for i = 1, segments do
								local outline_line = Drawing.new("Line")
								outline_line.Visible = false
								outline_line.Thickness = 1.2
								outline_line.Transparency = 0.61
								outline_line.Color = Color3.new(0, 0, 0)
								table.insert(china_hat_lines[local_player], outline_line)
							end
							for i = 1, segments do
								local bottom_line = Drawing.new("Line")
								bottom_line.Visible = false
								bottom_line.Thickness = 1
								bottom_line.Transparency = 1 - alpha
								bottom_line.Color = china_hat_color
								table.insert(china_hat_lines[local_player], bottom_line)
							end
							for i = 1, segments do
								local bottom_outline = Drawing.new("Line")
								bottom_outline.Visible = false
								bottom_outline.Thickness = 1.2
								bottom_outline.Transparency = 0.61
								bottom_outline.Color = Color3.new(0, 0, 0)
								table.insert(china_hat_lines[local_player], bottom_outline)
							end
						end
						
						local apex_screen_vec = Vector2.new(apex_screen.X, apex_screen.Y)
						local apex_soft_radius = 2.0
						
						for i = 1, segments do
							local next = ((i) % segments) + 1
							local apex_offset = Vector2.new(
								apex_screen_vec.X + math.cos((2 * math.pi * (i - 1)) / segments) * apex_soft_radius,
								apex_screen_vec.Y + math.sin((2 * math.pi * (i - 1)) / segments) * apex_soft_radius
							)
							
							local line1 = china_hat_lines[local_player][(i - 1) * 2 + 1]
							local line2 = china_hat_lines[local_player][(i - 1) * 2 + 2]
							
							line1.From = apex_offset
							line1.To = base_screen[i]
							line1.Visible = true
							line1.Color = china_hat_color
							line1.Transparency = 1 - alpha
							
							line2.From = apex_offset
							line2.To = base_screen[next]
							line2.Visible = true
							line2.Color = china_hat_color
							line2.Transparency = 1 - alpha
						end
						
						for i = 1, segments do
							local next = ((i) % segments) + 1
							local outline_line = china_hat_lines[local_player][segments * 2 + i]
							outline_line.From = base_screen[i]
							outline_line.To = base_screen[next]
							outline_line.Visible = true
						end
						
						for i = 1, segments do
							local next = ((i) % segments) + 1
							local bottom_line = china_hat_lines[local_player][segments * 3 + i]
							bottom_line.From = bottom_screen[i]
							bottom_line.To = bottom_screen[next]
							bottom_line.Visible = true
							bottom_line.Color = china_hat_color
							bottom_line.Transparency = 1 - alpha
						end
						
						for i = 1, segments do
							local next = ((i) % segments) + 1
							local bottom_outline = china_hat_lines[local_player][segments * 4 + i]
							bottom_outline.From = bottom_screen[i]
							bottom_outline.To = bottom_screen[next]
							bottom_outline.Visible = true
						end
					end
				end
			end
		end
		
		for player, lines in pairs(china_hat_lines) do
			if player ~= local_player or not player or not player.Parent or not player.Character then
				for _, line in ipairs(lines) do
					if line and line.Remove then
						line:Remove()
					end
				end
				china_hat_lines[player] = nil
			end
		end
	else
		for player, lines in pairs(china_hat_lines) do
			for _, line in ipairs(lines) do
				if line and line.Remove then
					line:Remove()
				end
			end
		end
		china_hat_lines = {}
	end
end)

local_player.CharacterAdded:Connect(function(character)
	if flags["china_hat_enabled"] and china_hat_lines[local_player] then
		for _, line in ipairs(china_hat_lines[local_player]) do
			if line and line.Remove then
				line:Remove()
			end
		end
		china_hat_lines[local_player] = nil
	end
end)

players.PlayerRemoving:Connect(function(player)
	if player == local_player and china_hat_lines[local_player] then
		for _, line in ipairs(china_hat_lines[local_player]) do
			if line and line.Remove then
				line:Remove()
			end
		end
		china_hat_lines[local_player] = nil
	end
end)

run_service.Heartbeat:Connect(function()
	if flags["rain_enabled"] then
		if #rain_parts < 50 then
			local part = Instance.new("Part")
			local rain_size = flags["rain_size"] or 10
			part.Size = Vector3.new(0.1, math.random(rain_size * 0.5, rain_size * 1.5), 0.1)
			part.Material = Enum.Material.Neon
			local rain_color = get_color3_from_flag(flags["rain_color"]) or Color3.fromRGB(200, 200, 200)
			part.Color = rain_color
			part.Transparency = 0.3
			part.CanCollide = false
			part.Anchored = true
			
			local player_pos = local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
			if player_pos then
				local angle = math.random() * math.pi * 2
				local distance = math.random() * rain_spawn_radius
				local x = math.cos(angle) * distance
				local z = math.sin(angle) * distance
				local base_height = player_pos.Position.Y + rain_spawn_height
				local height_variation = math.random(-20, 20)
				part.CFrame = CFrame.new(player_pos.Position.X + x, base_height + height_variation, player_pos.Position.Z + z)
			else
				part.CFrame = CFrame.new(math.random(-100, 100), 50, math.random(-100, 100))
			end
			
			part.Parent = workspace
			table.insert(rain_parts, part)
		end
		
		local rain_speed = flags["rain_speed"] or 0.5
		local rain_color = get_color3_from_flag(flags["rain_color"]) or Color3.fromRGB(200, 200, 200)
		local player_pos = local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
		
		for i = #rain_parts, 1, -1 do
			local part = rain_parts[i]
			if part and part.Parent then
				part.Color = rain_color
				part.CFrame = part.CFrame * CFrame.new(0, -rain_speed, 0)
				
				local should_remove = false
				if part.Position.Y < -10 then
					should_remove = true
				elseif player_pos then
					local distance_from_player = (part.Position - player_pos.Position).Magnitude
					if distance_from_player > rain_spawn_radius * 1.5 then
						should_remove = true
					end
				end
				
				if should_remove then
					part:Destroy()
					table.remove(rain_parts, i)
				end
			else
				table.remove(rain_parts, i)
			end
		end
	else
		for _, part in ipairs(rain_parts) do
			if part and part.Parent then
				part:Destroy()
			end
		end
		rain_parts = {}
	end
	
	if flags["snow_enabled"] then
		if #snow_parts < 50 then
			local part = Instance.new("Part")
			local snow_size = flags["snow_size"] or 5
			local size_value = math.random(snow_size * 0.5, snow_size * 1.5) * 0.1
			part.Size = Vector3.new(size_value, size_value, size_value)
			part.Shape = Enum.PartType.Ball
			part.Material = Enum.Material.Neon
			local snow_color = get_color3_from_flag(flags["snow_color"]) or Color3.fromRGB(255, 255, 255)
			part.Color = snow_color
			part.Transparency = 0.3
			part.CanCollide = false
			part.Anchored = true
			
			local player_pos = local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
			if player_pos then
				local angle = math.random() * math.pi * 2
				local distance = math.random() * snow_spawn_radius
				local x = math.cos(angle) * distance
				local z = math.sin(angle) * distance
				local base_height = player_pos.Position.Y + snow_spawn_height
				local height_variation = math.random(-20, 20)
				part.CFrame = CFrame.new(player_pos.Position.X + x, base_height + height_variation, player_pos.Position.Z + z)
			else
				part.CFrame = CFrame.new(math.random(-100, 100), 50, math.random(-100, 100))
			end
			
			part.Parent = workspace
			table.insert(snow_parts, part)
		end
		
		local snow_speed = flags["snow_speed"] or 0.5
		local snow_color = get_color3_from_flag(flags["snow_color"]) or Color3.fromRGB(255, 255, 255)
		local player_pos = local_player.Character and local_player.Character:FindFirstChild("HumanoidRootPart")
		
		for i = #snow_parts, 1, -1 do
			local part = snow_parts[i]
			if part and part.Parent then
				part.Color = snow_color
				part.CFrame = part.CFrame * CFrame.new(0, -snow_speed, 0)
				
				local should_remove = false
				if part.Position.Y < -10 then
					should_remove = true
				elseif player_pos then
					local distance_from_player = (part.Position - player_pos.Position).Magnitude
					if distance_from_player > snow_spawn_radius * 1.5 then
						should_remove = true
					end
				end
				
				if should_remove then
					part:Destroy()
					table.remove(snow_parts, i)
				end
			else
				table.remove(snow_parts, i)
			end
		end
	else
		for _, part in ipairs(snow_parts) do
			if part and part.Parent then
				part:Destroy()
			end
		end
		snow_parts = {}
	end
end)

local configs = window:tab({ name = "configs" })
	
	local config = configs:section({ name = "theming", side = "right" })
	
	config:toggle({
		name = "keybind list",
		flag = "keybind_list",
		default = false,
		callback = function(bool)
			window.toggle_list(bool)
		end,
	})
	
	config:toggle({
		name = "watermark",
		flag = "watermark",
		default = true,
		callback = function(bool)
			window.toggle_watermark(bool)
		end,
	})
	
	config:keybind({
		name = "ui bind",
		default = Enum.KeyCode.Insert,
		display = "menu",
		callback = window.set_menu_visibility,
	})
	
	config:slider({
		name = "colorpicker animation speed",
		flag = "color_picker_anim_speed",
		min = 0,
		max = 5,
		default = 2,
		interval = 0.01,
	})
	
	config:colorpicker({
		color = Color3.fromRGB(200, 200, 200),
		flag = "accent",
		callback = function(color)
			library:update_theme("accent", color)
		end,
	})
	
	config:button({
		name = "copy jobid",
		callback = function()
			setclipboard(game.JobId)
		end,
	})
	config:button({
		name = "copy gameid",
		callback = function()
			setclipboard(game.GameId)
		end,
	})
	config:button({
		name = "rejoin",
		callback = function()
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, lp)
		end,
	})

	local configs_section = configs:section({ name = "configuration system", side = "left" })
	
	local sound_connections = {}
	local bang_sound_connections = {}
	
	local function setupSoundReplacement(sound)
		if sound and sound:IsA("Sound") and isHitSound(sound) then
			applyHitSound(sound)
			
			if not sound_connections[sound] then
				local connection = sound:GetPropertyChangedSignal("Playing"):Connect(function()
					if sound.Playing then
						applyHitSound(sound)
					end
				end)
				sound_connections[sound] = connection
				
				sound.AncestryChanged:Connect(function()
					if not sound.Parent then
						if sound_connections[sound] then
							sound_connections[sound]:Disconnect()
							sound_connections[sound] = nil
						end
					end
				end)
			end
		end
		
		if sound and sound:IsA("Sound") and isBangSound(sound) then
			applyBangSound(sound)
			
			if not bang_sound_connections[sound] then
				bang_sound_connections[sound] = sound:GetPropertyChangedSignal("SoundId"):Connect(function()
					applyBangSound(sound)
				end)
				
				sound.AncestryChanged:Connect(function()
					if not sound.Parent then
						if bang_sound_connections[sound] then
							bang_sound_connections[sound]:Disconnect()
							bang_sound_connections[sound] = nil
						end
					end
				end)
			end
		end
	end
	
	local function scanForSounds(parent)
		for _, sound in pairs(parent:GetDescendants()) do
			if sound:IsA("Sound") then
				setupSoundReplacement(sound)
			end
		end
	end
	
	local function scanForBangSounds(parent)
		for _, sound in pairs(parent:GetDescendants()) do
			if sound:IsA("Sound") and isBangSound(sound) then
				applyBangSound(sound)
			end
		end
	end
	
	if local_player then
		local_player.CharacterAdded:Connect(function(character)
			for _, tool in pairs(character:GetChildren()) do
				if tool:IsA("Tool") then
					scanForSounds(tool)
					tool.ChildAdded:Connect(function(child)
						if child:IsA("Sound") then
							setupSoundReplacement(child)
						end
						scanForSounds(tool)
					end)
				end
			end
			
			character.ChildAdded:Connect(function(child)
				if child:IsA("Tool") then
					scanForSounds(child)
					child.ChildAdded:Connect(function(descendant)
						if descendant:IsA("Sound") then
							setupSoundReplacement(descendant)
						end
						scanForSounds(child)
					end)
				end
			end)
		end)
		
		if local_player.Character then
			for _, tool in pairs(local_player.Character:GetChildren()) do
				if tool:IsA("Tool") then
					scanForSounds(tool)
				end
			end
		end
	end
	
	
	run_service.Heartbeat:Connect(function()
		local tools = getAllTools()
		for _, tool in pairs(tools) do
			scanForBangSounds(tool)
		end
		
		local current_time = tick()
		if not sound_scan_last_time or (current_time - sound_scan_last_time) > 0.5 then
			sound_scan_last_time = current_time
			
			scanForBangSounds(workspace)
			
			local replicatedStorage = game:GetService("ReplicatedStorage")
			scanForBangSounds(replicatedStorage)
			
			if flags["hitsounds_enabled"] then
				local chosen = flags["hitsound_choice"] or "neverlose"
				local soundId = hitSoundIds[chosen] or hitSoundIds.neverlose
				
				for _, tool in pairs(tools) do
					for _, sound in pairs(tool:GetDescendants()) do
					if sound:IsA("Sound") then
						if isHitSound(sound) and sound.SoundId ~= soundId then
							sound.SoundId = soundId
						elseif isBangSound(sound) and sound.SoundId ~= soundId then
							sound.SoundId = soundId
						end
						end
					end
				end
				
				local gunModules = replicatedStorage:FindFirstChild("ModuleScripts")
				if gunModules then
					local gunFramework = gunModules:FindFirstChild("GunModules")
					if gunFramework then
						for _, sound in pairs(gunFramework:GetDescendants()) do
						if sound:IsA("Sound") then
							if isHitSound(sound) and sound.SoundId ~= soundId then
								sound.SoundId = soundId
							elseif isBangSound(sound) and sound.SoundId ~= soundId then
								sound.SoundId = soundId
							end
							end
						end
					end
				end
			end
		end
	end)
	
	if not library.directory or library.directory == "" then
		library.directory = "solvent"
	end
	
	local config_folder = library.config_folder or "/configs"
	local dir = library.directory .. config_folder .. "/"

	local baseline_config = library:get_config()
	
	library.config_holder = configs_section:dropdown({ name = "configs", items = {}, flag = "config_name_list" })
	
	configs_section:textbox({ flag = "config_name_text_box" })
	
	configs_section:button({
		name = "create",
		callback = function()
			writefile(dir .. flags["config_name_text_box"] .. ".cfg", library:get_config())
			if library.config_list_update then
				pcall(function()
					library:config_list_update()
				end)
			end
		end,
	})
	
	configs_section:button({
		name = "delete",
		callback = function()
			library:panel({
				name = "are you sure you want to delete " .. flags["config_name_list"] .. " ?",
				options = { "yes", "no" },
				callback = function(option)
					if option == "yes" then
						local path = dir .. flags["config_name_list"] .. ".cfg"
						if isfile(path) then
							delfile(path)
						end
						if library.config_list_update then
							pcall(function()
								library:config_list_update()
							end)
						end
					end
				end,
			})
		end,
	})
	
	configs_section:button({
		name = "load",
		callback = function()
			local path = dir .. flags["config_name_list"] .. ".cfg"
			if isfile(path) then
				library:load_config(readfile(path))
			else
				library:notification({ text = "Config not found: " .. tostring(flags["config_name_list"]) })
			end
		end,
	})
	
	configs_section:button({
		name = "save",
		callback = function()
			writefile(dir .. flags["config_name_text_box"] .. ".cfg", library:get_config())
			if library.config_list_update then
				pcall(function()
					library:config_list_update()
				end)
			end
		end,
	})
	
	configs_section:button({
		name = "unload config",
		callback = function()
		pcall(RemoveAllChams)
		pcall(RemoveAllESP)
		pcall(ClearChinaHat)
		pcall(cleanup_visual_effects)
		pcall(function()
			library:load_config(baseline_config)
		end)
		end,
	})
	
	configs_section:button({
		name = "unload menu",
		callback = function()
		pcall(RemoveAllChams)
		pcall(RemoveAllESP)
		pcall(ClearChinaHat)
		pcall(cleanup_visual_effects)
		pcall(function()
			library:load_config(baseline_config)
		end)
		pcall(function()
			library:unload()
		end)
		end,
	})

	if library.config_list_update then
		pcall(function()
			library:config_list_update()
		end)
	end
end



