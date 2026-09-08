-- script for https://www.roblox.com/games/117092473484161
-- made by public main @pubmain on discord, github.com/pubmain
if game.PlaceId ~= 117092473484161 then
    return warn("not in game")
end
local function load_url<A..., R...>(url: string): (A...) -> R...
	local Callback, Error = loadstring(game:HttpGet(url))
	if Error then
		return error(Error, 2)
	end
	return (Callback :: any) :: (A...) -> R...
end

local function get_gun(player: Player): Tool?
	if player.Character and player.Character:FindFirstChildOfClass("Tool") then
		return player.Character:FindFirstChildOfClass("Tool")
	end
	return player.Backpack:FindFirstChildOfClass("Tool")
end

local LIBRARY_ID = "shittycbroclonelmao"
if getgenv()[LIBRARY_ID] then
	pcall(getgenv()[LIBRARY_ID].Destroy, getgenv()[LIBRARY_ID])
end

local empty_callback = function() end

local library: AnkaUi = load_url("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua")()
getgenv()[LIBRARY_ID] = library

local players = game:GetService("Players")
local local_player = players.LocalPlayer

local window = library:CreateWindow({ WindowName = "CBRO shit idk - public main" }, gethui())
local main_tab = window:CreateTab("main")
local kill_all_section = main_tab:CreateSection("kill all")
local spoof_player = kill_all_section:CreateToggle("spoof player", true, empty_callback)
local select_random_player = kill_all_section:CreateToggle("select random spoofed player", true, empty_callback)
local spoofed_player_list = kill_all_section:CreateDropdown("spoofed player", {}, empty_callback)
local function update_player_list()
	local options = {}
	for _, player in players:GetPlayers() do
		if player == local_player then
			continue
		end
		options[player] = player.Name
	end
	spoofed_player_list:ChangeOptions(options, spoofed_player_list:GetOption())
end
kill_all_section
	:CreateButton("kill all", function()
		local spoofed_player = local_player

		if spoof_player:GetState() then
			local spoofed_player_name = spoofed_player_list:GetOption()
			local new_spoofed_player = players:FindFirstChild(spoofed_player_name) :: Player?
			if not new_spoofed_player then
				if select_random_player:GetState() then
					for _, player in players:GetPlayers() do
						if player == local_player or player.Team ~= local_player.Team or not player.Character then
							continue
						end
						spoofed_player = player
						break
					end
				end
				update_player_list()
				spoofed_player_list:SetOption(nil)
			else
				if not new_spoofed_player.Character then
					window:Notify("CBRO", "selected player isnt alive", 5)
				else
					spoofed_player = new_spoofed_player
				end
			end
		end
		local gun = get_gun(spoofed_player)
		if not gun then
			return window:Notify("CBRO", "no gun found", 5)
		end
		local cs_engine = gun:FindFirstChild("CSEngine") :: LocalScript
		local stats = gun:FindFirstChild("Stats") :: Folder
		-- no idea what those values are
		local v7, v12 = nil, nil
		local TPB = gun:FindFirstChild("TPB")
		if TPB then
			TPB = TPB.Value
		end

		for _, player in players:GetPlayers() do
			if not player.Character or player.Team == spoofed_player.Team then
				continue
			end
			local part = player.Character:FindFirstChild("Head") :: BasePart
			if not part then
				continue
			end
			local distance = 0 --(workspace.CurrentCamera.CFrame.Position - part.Position).Magnitude
			cs_engine.Fire:FireServer(
				distance,
				spoofed_player.Character.Head.CFrame.Rotation,
				spoofed_player.Character,
				TPB,
				spoofed_player.Character.Head.Position,
				part,
				v7,
				v12,
				part,
				gun.Ammo.Value,
				500, --stats.HeadDamage.Value,
				spoofed_player,
				stats.MSX.Value,
				math.huge, --stats.Range.Value,
				500, --stats.Damage.Value,
				500, --stats.LimbDamage.Value,
				stats.Penetration.Value,
				v12,
				spoofed_player.Character.Head.Position,
				stats.ArmorPenetration.Value,
				false
			)
			task.wait(0.3)
		end
	end)
	:CreateKeybind(Enum.KeyCode.Unknown, empty_callback)

update_player_list()

table.insert(library.Connections, players.PlayerAdded:Connect(update_player_list))
table.insert(library.Connections, players.PlayerRemoving:Connect(update_player_list))

local misc_section = main_tab:CreateSection("misc")
local ear_rape: Toggle
ear_rape = misc_section:CreateToggle("ear rape", false, function(value)
	if not value then
		return
	end
	while ear_rape:GetState() do
		task.wait(0)
		local teammate, enemy
		for _, player in players:GetPlayers() do
			if not player.Character or player == local_player or not get_gun(player) then
				continue
			end
			if player.Team == local_player.Team then
				teammate = player
			else
				enemy = player
			end
			if teammate and enemy then
				break
			end
		end
		for _, target_player in { teammate, enemy } do
			local gun = get_gun(target_player)
			if not gun:FindFirstChild("Ammo") then
				continue
			end
			local cs_engine = gun:FindFirstChild("CSEngine") :: LocalScript
			local stats = gun:FindFirstChild("Stats") :: Folder
			-- no idea what those values are
			local v7, v12 = nil, nil
			local TPB = gun:FindFirstChild("TPB")
			if TPB then
				TPB = TPB.Value
			end
			for _, player in players:GetPlayers() do
				if not player.Character or player.Team ~= target_player.Team or player == local_player then
					continue
				end
				local part = player.Character:FindFirstChild("Head")
				if not part then
					continue
				end
				local distance = -1 / 0 --(workspace.CurrentCamera.CFrame.Position - part.Position).Magnitude
				cs_engine.Fire:FireServer(
					distance,
					part.CFrame.Rotation,
					target_player.Character,
					TPB,
					part.Position,
					part,
					v7,
					v12,
					part,
					gun.Ammo.Value,
					stats.HeadDamage.Value,
					target_player,
					stats.MSX.Value,
					stats.Range.Value,
					stats.Damage.Value,
					stats.LimbDamage.Value,
					stats.Penetration.Value,
					v12,
					part.Position,
					stats.ArmorPenetration.Value,
					false
				)
			end
		end
	end
end)

-- doesnt work unfortunately
-- local disable_weapons: Toggle
-- disable_weapons = misc_section:CreateToggle("disable weapons", false, function(value)
-- 	if not value then
-- 		return
-- 	end
-- 	while disable_weapons:GetState() do
-- 		task.wait(1)
-- 		local local_gun = get_gun(local_player)
-- 		if not local_gun then
-- 			window:Notify("CBRO", "no gun found")
-- 			disable_weapons:SetState(false)
-- 			break
-- 		end
-- 		local cs_engine = local_gun:FindFirstChild("CSEngine") :: LocalScript
-- 		for _, player in players:GetPlayers() do
-- 			local gun = get_gun(player)
-- 			if not gun then
-- 				continue
-- 			end
-- 			for _, value in gun:GetDescendants() do
-- 				if value:IsA("ValueBase") then
-- 					cs_engine.ChangeValue:FireServer(value, 0)
-- 				end
-- 			end
-- 		end
-- 	end
-- end)
