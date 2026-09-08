local Version = "1.6.62" -- static version.
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. Version .. "/main.lua"))()
	-- Anti AFK
	local vu = game:GetService("VirtualUser")
	game:GetService("Players").LocalPlayer.Idled:Connect(function()
		vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		task.wait(1)
		vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end)

	-- Services
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local LocalPlayer = Players.LocalPlayer
	local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
	local HttpService = game:GetService("HttpService")
	local workspace = game.Workspace
	local react = PlayerGui:WaitForChild("react")
	local notifications = react:WaitForChild("notifications")
	local rewardsPopup = react:WaitForChild("rewardsPopup")
	local camera = workspace.CurrentCamera
	local RunService = game:GetService("RunService")
	local humanoid, root
	local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
	local USE_SCRIPTED_CAMERA = true
	local savedCamera = {}
	local TeleportService = game:GetService("TeleportService")
	local CoreGui = game:GetService("CoreGui")
	local EncodingService = game:GetService("EncodingService")
	local UIS = game:GetService("UserInputService")

	-- Net
	local Net = {
        inviteDungeon = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("dungeonInviteToTeam"),
		depositOrnament = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("depositOrnament"),
		tradeOrnament = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("tradeOrnament"),
		teleportmap = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("teleport"),
		startdungeon = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("dungeonStart"),
		fightenemydungeon = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("dungeonFightEnemy"),
		votedungeon = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("dungeonVoteModifier"),
		buyraiditem = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("craft"),
		buyrankitem = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("buyRankedShopItem"),
		fightStoryBoss = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightStoryBoss"),
		fightRaidMinion = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightRaidMinion"),
		fightRaidBoss = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightRaidBoss"),
		setPartySlot = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("setDefaultPartySlot"),
		removePartyPosition = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("removePartyPosition"),
		addCardToParty = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("addCardToParty"),
		fightBattleTowerWave = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightBattleTowerWave"),
		fightGlobalBoss = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightGlobalBoss"),
		fightInfinite = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightInfinite"),
		forfeitBattle = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("forfeitBattle"),
		claimInfinite = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("claimInfinite"),
		pauseInfinite = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("pauseInfinite"),
		netSetting = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("setSetting"),
		activateAllLuckIndex = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("activateAllLuckIndex"),
		activeCardIndex = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("claimCardIndexRewards"),
		mergeCard = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("mergeCard"),
		fightGlobalBossZone = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightGlobalBossZone"),
		claimEvent = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("claimDailyQuest"),
		useItem = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("useItem"),
		redeemEvent = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("redeemCode"),
		upgradePoint = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("allocateUpgradePoint"),
		fightPlayer = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightPlayer"),
		fightEvent = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("fightRankedOpponent"),
		refreshEvent = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("refreshRanked"),
		showBattle = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("setSetting"),
		useXpBook = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("useXpBook"),
		buyDungeonUpgrade = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("buyDungeonUpgrade"),
		buyStockItem = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("buyChristmasStockShopItem"),
		buyEventDailyItem = ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("buyChristmasItemShopListing"),
	}

	-------------------------------------------------
	-- Data
	-------------------------------------------------

	local BossData = {
		List = {
			{
				key = "bijuu_beast",
				map = "ninja_village",
				teleport = CFrame.new(-143, 12, -6675),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "awakened_galactic_tyrant",
				map = "green_planet",
				teleport = CFrame.new(6164, 50, -31),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "king_of_curses",
				map = "shibuya_station",
				teleport = CFrame.new(-228, 37, 4944),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "combat_giant",
				map = "titans_city",
				teleport = CFrame.new(-5394, 14, -5941),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "awakened_pale_demon_lord",
				map = "dimensional_fortress",
				teleport = CFrame.new(4904, 151, 6338),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "soul_queen",
				map = "candy_island",
				teleport = CFrame.new(-5820, 57, 5368),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "awakened_shadow_monarch",
				map = "solo_city",
				teleport = CFrame.new(-8613, 283, -9580),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "lord_of_eminence",
				map = "eminence_lookout",
				teleport = CFrame.new(5583, 330, -8961),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "celestial_sovereign",
				map = "invaded_ninja_village",
				teleport = CFrame.new(1018, 476, 7846),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "undead_king",
				map = "necromancer_graveyard",
				teleport = CFrame.new(6180, 43, -4206),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "substitute_shinigami",
				map = "soul_king_castle",
				teleport = CFrame.new(-8352, 41, 9075),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "quincy_king",
				map = "empire_of_light",
				teleport = CFrame.new(1420, -7, -10854),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
			{
				key = "humanitys_weapon",
				map = "defense_force_base",
				teleport = CFrame.new(-29003, 3, 2121),
				modes = {"normal","medium","hard","extreme","nightmare","celestial"}
			},
		},

		TeamOptions = {
			"slot_1","slot_2","slot_3","slot_4",
			"slot_5","slot_6","slot_7","slot_8"
		}
	}

	-- Tower Data
	local TowerData = {
		Modes = {
			"battle_tower", "watery_depths", "frozen_landscape", "stone_citadel",
			"inferno_depths", "lunar_eclipse", "light_fairy", "xmas_snowy_entrance",
			"xmas_chilling_hall", "xmas_frozen_depths", "xmas_subzero_cove", "xmas_absolute_zero"
		},
		ModeNames = {
			battle_tower = "Battle Tower", watery_depths = "Watery Depths Tower",
			frozen_landscape = "Frozen Landscape Tower", stone_citadel = "Stone Citadel Tower",
			inferno_depths = "Inferno Depths Tower", lunar_eclipse = "Lunar Eclipse Tower",
			light_fairy = "Light Fairy Tower", xmas_snowy_entrance = "Part 1: Snowy Entrance",
			xmas_chilling_hall = "Part 2: Chilling Hall", xmas_frozen_depths = "Part 3: Frozen Depths",
			xmas_subzero_cove = "Part 4: Sub-Zero Cove", xmas_absolute_zero = "Part 5: Absolute Zero"
		},
		Waves = {},
		TeamOptions = BossData.TeamOptions
	}

	-- Generate waves
	for _, mode in ipairs(TowerData.Modes) do
		TowerData.Waves[mode] = {}
		local maxWave = (mode == "battle_tower" and 50) or (mode:find("xmas") and 10) or 25
		for i = 1, maxWave do
			table.insert(TowerData.Waves[mode], tostring(i))
		end
	end

	local StorylineData = {
		Maps = {"ninja_village", "green_planet", "shibuya_station", "titans_city", "dimensional_fortress",
			"candy_island", "solo_city", "eminence_lookout", "invaded_ninja_village", "necromancer_graveyard",
			"soul_kings_castle", "empire_of_light", "defense_force_base"},
		ModeOptions = {"normal", "medium", "hard", "extreme", "nightmare", "celestial"},
		TeamOptions = {"slot_1", "slot_2", "slot_3", "slot_4", "slot_5", "slot_6", "slot_7", "slot_8"},
		Mobs = {
			ninja_village = {
		{id = 367, name = "unstoppable_fist"}, {id = 371, name = "copy_ninja"}, {id = 370, name = "awakened_dark_avenger"},
		{id = 369, name = "awakened_promised_child"}, {id = 368, name = "six_paths_of_pain"}, {id = 366, name = "bijuu_beast"}
	},
	green_planet = {
		{id = 359, name = "ultimate_warrior"}, {id = 363, name = "body_switcher"}, {id = 360, name = "namekian_sage"},
		{id = 357, name = "awakened_prideful_prince"}, {id = 361, name = "awakened_earth_strongest"}, {id = 362, name = "awakened_galactic_tyrant"}
	},
	shibuya_station = {
		{id = 410, name = "cursed_doll"}, {id = 413, name = "awakened_shadow_summoner"}, {id = 412, name = "cursed_fist"},
		{id = 408, name = "rika_blessing"}, {id = 411, name = "limitless_master"}, {id = 409, name = "king_of_curses"}
	},
	titans_city = {
		{id = 335, name = "survey_commander"}, {id = 337, name = "blade_warrior"}, {id = 339, name = "armored_giant"},
		{id = 338, name = "beast_giant"}, {id = 336, name = "blade_captain"}, {id = 334, name = "combat_giant"}
	},
	dimensional_fortress = {
		{id = 350, name = "thunder_demon"}, {id = 353, name = "childish_demon"}, {id = 355, name = "compass_demon"},
		{id = 354, name = "awakened_frost_demon"}, {id = 351, name = "awaken_six_eye_slayer"}, {id = 352, name = "awakened_pale_demon_lord"}
	},
	candy_island = {
		{id = 331, name = "genie_commander"}, {id = 328, name = "candy_master"}, {id = 326, name = "biscuit_warrior"},
		{id = 330, name = "juice_queen"}, {id = 329, name = "mochi_emperor"}, {id = 327, name = "soul_queen"}
	},
	solo_city = {
		{id = 493, name = "light_saintess"}, {id = 496, name = "the_goliath"}, {id = 491, name = "shadow_bear"},
		{id = 494, name = "shadow_commander"}, {id = 492, name = "shadow_ant"}, {id = 495, name = "awakened_shadow_monarch"}
	},
	eminence_lookout = {
		{id = 306, name = "eminence_accountant"}, {id = 305, name = "eminence_scout"}, {id = 303, name = "eminence_cat"},
		{id = 302, name = "eminence_strategist"}, {id = 304, name = "eminence_commander"}, {id = 301, name = "lord_of_eminence"}
	},
	invaded_ninja_village = {
		{id = 347, name = "celestial_warrior"}, {id = 343, name = "mother_of_creation"}, {id = 344, name = "celestial_fisherman"},
		{id = 342, name = "celestial_destroyer"}, {id = 346, name = "awakened_impure_ghost"}, {id = 345, name = "celestial_sovereign"}
	},
	necromancer_graveyard = {
		{id = 386, name = "beast_tamer"}, {id = 388, name = "servant_of_the_undead"}, {id = 390, name = "undead_demon"},
		{id = 385, name = "undead_commander"}, {id = 387, name = "blood_valkyrie"}, {id = 389, name = "undead_king"}
	},
	soul_kings_castle = {
		{id = 397, name = "hornet_shinigami"}, {id = 401, name = "shinigami_strategist"}, {id = 402, name = "shinigami_illusionist"},
		{id = 399, name = "fate_weaver_shinigami"}, {id = 398, name = "shinigami_monk"}, {id = 400, name = "substitute_shinigami"}
	},
	empire_of_light = {
		{id = 323, name = "the_visionary"}, {id = 319, name = "the_antithesis"}, {id = 321, name = "the_x_axis"},
		{id = 322, name = "the_miracle"}, {id = 318, name = "the_balance"}, {id = 320, name = "quincy_king"}
	},
	defense_force_base = {
		{id = 375, name = "frostbite_sodier"}, {id = 378, name = "eightfold_slayer"}, {id = 380, name = "gun_blade_hunter"},
		{id = 376, name = "defense_force_captain"}, {id = 379, name = "defense_force_heiress"}, {id = 377, name = "monster_10"},
		{id = 374, name = "humanitys_weapon"}
	}
		}
	}

	local GlobalBossData = {
		Position = CFrame.new(1019, 9, -245),
		SpawnUTCWindows = {{18, 20}, {21, 23}, {0, 2}, {3, 5}, {6, 8}, {9, 11}, {12, 14}, {15, 17}},
		DurationHours = 2,
		TeamOptions = {"slot_1", "slot_2", "slot_3", "slot_4", "slot_5", "slot_6", "slot_7", "slot_8"},
	}

	local InfiniteData = {
		Modes = {"base", "nightmare", "potion", "ninja_village", "green_planet", "shibuya_station", "titans_city",
			"dimensional_fortress", "candy_island", "solo_city", "eminence_lookout", "invaded_ninja_village",
			"necromancer_graveyard", "soul_king_castle", "empire_of_light", "defense_force_base"},
		ModeNames = {
			base = "Infinite", nightmare = "HardCore", potion = "Potion", ninja_village = "Ninja Village",
			green_planet = "Green Planet", shibuya_station = "Shibuya Station", titans_city = "Titans City",
			dimensional_fortress = "Dimensional Fortress", candy_island = "Candy Island", solo_city = "Solo City",
			eminence_lookout = "Eminence Lookout", invaded_ninja_village = "Invaded Ninja Village",
			necromancer_graveyard = "Necromancer Graveyard", soul_king_castle = "Soul King's Castle",
			empire_of_light = "Empire of Light", defense_force_base = "Defense Force Base",
		},
		TeamOptions = {"slot_1", "slot_2", "slot_3", "slot_4", "slot_5", "slot_6", "slot_7", "slot_8"},
	}

	local CursedZoneData = {
		ColorGrades = {
			["0 0.278431 0.650980 1.000000 0 1 0.278431 0.650980 1.000000 0"] = 4,
			["0 0.345098 0.133333 0.552941 0 1 0.345098 0.133333 0.552941 0"] = 3,
			["0 0.000000 0.000000 0.000000 0 1.000000 0.000000 0.000000 0.000000 0"] = 2,
			["0 0.552941 0.000000 0.431373 0 1 0.552941 0.000000 0.431373 0"] = 1,
			["0 0.552941 0.000000 0.00784314 0 1 0.552941 0.000000 0.00784314 0"] = "special",
		},
		TeamOptions = {"slot_1", "slot_2", "slot_3", "slot_4", "slot_5", "slot_6", "slot_7", "slot_8"},
	}

	local RaidData = {
		["Monster 9"] = {modes = {"easy", "medium", "hard", "extreme"}, teleportName = "raid_monster_9"},
		["Cifer"] = { modes = {"easy", "medium", "hard", "extreme"}, teleportName = "raid_cifer"},
		["Creator of Flames"] = { modes = {"easy", "medium", "hard", "extreme"}, teleportName = "raid_creator_of_flames"},
		["Sword Deity"] = {modes = {"easy", "medium", "hard", "extreme"}, teleportName = "raid_sword_deity"},
		["Shadow Dragon"] = { modes = {"easy", "medium", "hard", "extreme"}, teleportName = "raid_shadow_dragon"},
		["Eternal Dragon"] = { modes = {"easy", "medium", "hard", "extreme"}, teleportName = "raid_eternal_dragon"},
	}

	local RaidItem = {
		legendary_book = {shop = "raid_general", id = 9, amount = 10, display_name = "Legendary Book"},
		epic_book = {shop = "raid_general", id = 8, amount = 10, display_name = "Epic Book"},
		rare_book = {shop = "raid_general", id = 7, amount = 10, display_name = "Rare Book"},
		uncommon_book = {shop = "raid_general", id = 6, amount = 10, display_name = "Uncommon Book"},
		common_book = {shop = "raid_general", id = 5, amount = 10, display_name = "Common Book"},
		gold_eternal_dragon = {shop = "raid_eternal_dragon", id = 1, amount = 20, display_name = "Gold Eternal Dragon"},
		gold_shadow_dragon = {shop = "raid_shadow_dragon", id = 1, amount = 10, display_name = "Gold Shadow Dragon"},
		gold_creator_of_flames = {shop = "raid_creator_of_flames", id = 1, amount = 5, display_name = "Gold Creator Of Flames"},
		gold_sword_deity = {shop = "raid_sword_deity", id = 1, amount = 7, display_name = "Gold Sword Deity"},
		gold_cifer = {shop = "raid_cifer", id = 1, amount = 5, display_name = "Gold Cifer"},
		gold_monster_9 = {shop = "raid_monster_9", id = 1, amount = 3, display_name = "Gold Monster 9"},
	}

	local RankItem = {
		["item:trait_reroll"] = {display_name = "Trait Reroll", amount = 500},
		["item:exploration_speedup_30_min"] = {display_name = "Exploration Speedup 30m", amount = 30},
		["item:exploration_speedup_1_hour"] = {display_name = "Exploration Speedup 1h", amount = 30},
		["item:exploration_speedup_3_hour"] = {display_name = "Exploration Speedup 3h", amount = 5},
		["item:exploration_speedup_8_hour"] = {display_name = "Exploration Speedup 8h", amount = 3},
		["item:exploration_speedup_12_hour"] = {display_name = "Exploration Speedup 12h", amount = 2},
		["item:exploration_speedup_24_hour"] = {display_name = "Exploration Speedup 24h", amount = 1},
		["item:exploration_speedup_3_day"] = {display_name = "Exploration Speedup 3d", amount = 1},
		["item:common_book"] = {display_name = "Common Book", amount = 2000},
		["item:uncommon_book"] = {display_name = "Uncommon Book", amount = 1500},
		["item:rare_book"] = {display_name = "Rare Book", amount = 1000},
		["item:epic_book"] = {display_name = "Epic Book", amount = 500},
		["item:legendary_book"] = {display_name = "Legendary Book", amount = 250},
		["item:mythical_book"] = {display_name = "Mythical Book", amount = 100},
	}

	local StockItem = {
		"item:small_green_present",
		"item:small_red_present",
		"item:small_blue_present",
		"item:medium_green_present",
		"item:medium_red_present",
		"item:medium_blue_present",
		"item:large_green_present",
		"item:large_red_present",
		"item:large_blue_present",
		"item:xlarge_green_present",
		"item:xlarge_red_present",
		"item:xlarge_blue_present",
		"item:rose_oni_present",
		"item:azure_oni_present",
		"item:frozen_princess_present",
		"item:the_returner_present",
		"item:christmas_skin_present"
	}
	local DailyItem = {
		"item:common_book",
		"item:uncommon_book",
		"item:rare_book",
		"item:epic_book",
		"item:legendary_book",
		"item:exploration_speedup_30_min",
		"item:exploration_speedup_1_hour",
		"item:exploration_speedup_3_hour",
		"item:exploration_speedup_8_hour",
		"item:exploration_speedup_12_hour",
		"item:exploration_speedup_24_hour",
		"item:exploration_speedup_3_day",
		"item:weak_festive_potion",
		"item:strong_festive_potion",
		"item:potent_festive_potion",
	}
	local MoonCycleData = {
		{Name = "full_moon", DisplayName = "Full Moon"}, {Name = "snow_moon", DisplayName = "Snow Moon"},
		{Name = "harvest_moon", DisplayName = "Harvest Moon"}, {Name = "blood_moon", DisplayName = "Blood Moon"},
		{Name = "wolf_moon", DisplayName = "Wolf Moon"}, {Name = "blue_moon", DisplayName = "Blue Moon"},
		{Name = "eclipse_moon", DisplayName = "Eclipse Moon"}, {Name = "monarch_moon", DisplayName = "Monarch Moon"},
		{Name = "tsukuyomi_moon", DisplayName = "Tsukuyomi Moon"}, {Name = "inferno_moon", DisplayName = "Inferno Moon"},
		{Name = "abyss_moon", DisplayName = "Abyss Moon"}, {Name = "spirit_moon", DisplayName = "Spirit Moon"},
	}

	local ExplorationData = {
		Modes = {"easy", "medium", "hard", "extreme", "nightmare", "celestial", "mythical", "transcendent", "eternal", "abyss"},
	}

	local UpgradeData = {
		Name = {"luck", "cooldown_reduction", "potion_duration", "border_chance", "boss_chance"},
		displayName = {"Luck", "Roll Speed", "Potion Duration", "Border Chance", "Boss Chance"},
	}

	local CodesData = {
		"MERRYCHRISTMAS1", "MERRYCHRISTMAS2", "MERRYCHRISTMAS3", "SPECIALCODE4", "RANKEDUPDATE1", "RANKEDUPDATE2",
		"RANKEDUPDATE3", "SPECIALCODE", "HALLOWEEN3", "HALLOWEEN2", "HALLOWEEN1", "imdoingmybest1", "imdoingmybest2",
		"imdoingmybest3", "ICECOLD", "40KPLAYERS", "UPDATE4NOW1", "UPDATE4NOW2", "UPDATE4NOW3", "SPECIALCODE2",
		"UPDATE4NOW4", "UPDATE4NOW5", "UPDATE4NOW6", "SPECIALCODE3", "UPDATE4QOL1", "UPDATE4QOL2", "UPDATE4QOL3",
		"SERVERLUCK3", "SERVERLUCK2", "SERVERLUCK1", "PRERANKEDUPDATE1", "PRERANKEDUPDATE2", "PRERANKEDUPDATE3",
		"THANKYOU-67da508e", "THANKYOU-5e3b8484", "THANKYOU-a90775fb", "CURSERAIDUPDATE1", "CURSERAIDUPDATE2",
		"CURSERAIDUPDATE3", "MINIUPDATE3NOW2", "MINIUPDATE3NOW", "MINIUPDATE3", "SORRY1", "SORRY2", "SORRY3",
		"UPDATE3", "UPDATE3NOW", "UPDATE3NOW2", "WELOVECODES1", "WELOVECODES2", "BUGFIXES1", "BUGFIXES2",
		"100MILLION3", "100MILLION2", "100MILLION1", "PATCH1", "PATCH2", "GLOBALBOSS4", "GLOBALBOSS3", "GLOBALBOSS2",
		"GLOBALBOSS1", "NEWHOTFIX12", "NEWHOTFIX11", "NEWHOTFIX10", "NEWHOTFIX9", "NEWHOTFIX7", "NEWHOTFIX8",
		"NEWHOTFIX6", "NEWHOTFIX5", "NEWHOTFIX3", "NEWHOTFIX4", "NEWHOTFIX2", "NEWHOTFIX1", "WELCOMETOACC",
		"ACCREWRITE", "NEWCODES", "BUGFIX3", "LUCKBOOST", "UPDATESOON", "BUGFIX", "BUGFIX2", "EMINENCEUPDATE",
		"HOTFIX10", "BUGFIXNOTUPDATE", "HOTFIX9", "HOTFIX8", "HOTFIX7", "THEUPDATE", "NOTTHEUPDATE", "HOTFIX6",
		"100KLIKES", "HOTFIX5", "HOTFIX4", "HOTFIX3", "HOTFIX2", "HOTFIX1", "10MILLION", "5MILLIONVISITS",
		"3MILLIONVISITS", "STPATRICKSDAY2025", "1MILLIONVISITS", "500KVISITS", "100KVISITS", "SORRYFORSHUTDOWN",
		"YAYCODES", "CHRISTMASTOWER1", "CHRISTMASTOWER2", "CHRISTMASTOWER3",
	}

	local LevelData = {
		Book = {"common_book", "uncommon_book", "rare_book", "epic_book", "legendary_book"},
		BookName = {
			commmon_book = "Common Book", uncommon_book = "Uncommon Book", rare_book = "Rare Book",
			epic_book = "Epic Book", legendary_book = "Legendary Book",
		},
	}
	-------------------------------------------------
	-- State
	-------------------------------------------------
	local State = {}

	-- Auto control riêng
	State.autoEnabledBoss, State.autoRunIdBoss = false, 0
	State.autoEnabledTower, State.autoRunIdTower = false, 0
	State.autoEnabledGb, State.autoRunIdGb = false, 0
	State.autoEnabledInf, State.autoRunIdInf = false, 0
	State.autoEnabledCombine, State.autoRunIdCombine = false, 0
	State.autoEnabledMinion, State.autoRunIdMinion = false, 0
	State.autoEnabledRaid, State.autoRunIdRaid = false, 0
	State.autoEnabledExploration = false
	State.autoEnabledQuest, State.autoRunIdQuest = false, 0

	local folderName = "CooldownFolder"
	local playerName = LocalPlayer.Name
	local ConfigPath = string.format("%s/%s_cooldown.json", folderName, playerName)
	if not isfolder(folderName) then makefolder(folderName) end

	local function secondsToNextMidnightEST()
		local nowUTC = os.time()
		local offset = 5 * 3600 -- EST = UTC - 5h
		local estNow = nowUTC - offset
		local daysSinceEpoch_est = math.floor(estNow / 86400)
		local nextMidnightEst_utc = (daysSinceEpoch_est + 1) * 86400 + offset
		return nextMidnightEst_utc - nowUTC
	end

	local ok, data = pcall(function() return HttpService:JSONDecode(readfile(ConfigPath)) end)
	local conf = (ok and data and data.cooldownExpire) or {
		BattleTower = os.time() + secondsToNextMidnightEST(),
		StoryBoss = os.time() + secondsToNextMidnightEST()
	}
	State.cooldownExpire = conf

	-- Quest
	State.questTeam = State.questTeam or "slot_8"
	State.healCard = State.healCard or "undead_king:gold"
	State.freezeCard = State.freezeCard or "soul_queen:basic"

	-- Storyline State
	State.storylineEnabled = State.storylineEnabled or false
	State.storylineSelectedMaps = State.storylineSelectedMaps or {}
	State.storylineTeams = State.storylineTeams or {}
	State.storylineSelectedMode = State.storylineSelectedMode or {}
	State.storylineRunId = State.storylineRunId or 0

	-- Boss
	State.selectedBosses = State.selectedBosses or {}
	State.bossTeams = State.bossTeams or {}
	State.alreadyFought = State.alreadyFought or {}
	State.bossSelectedModes = State.bossSelectedModes or {}
	State.bossRetry = State.bossRetry or 3

	for _, boss in ipairs(BossData.List) do
		local key = boss.key
		State.selectedBosses[key] = State.selectedBosses[key] or false
		State.bossTeams[key] = State.bossTeams[key] or "slot_1"
		State.alreadyFought[key] = State.alreadyFought[key] or {}
		State.bossSelectedModes[key] = State.bossSelectedModes[key] or {}
	end
	-- Battle Tower
	State.selectedTowerModes = {}
	State.towerTeams = {}
	State.towerAlreadyFought = {}
	State.towerSelectedWaves = {}
	State.BtRetry = State.BtRetry or 3

	for _, mode in ipairs(TowerData.Modes) do
		State.selectedTowerModes[mode] = false
		State.towerTeams[mode] = "slot_1"
		State.towerAlreadyFought[mode] = {}
		State.towerSelectedWaves[mode] = {}
	end

	-- Global Boss
	State.globalBossTeamHighHP = "slot_1"
	State.globalBossTeamLowHP = "slot_1"
	State.gbCheckedHighHp = false
	State.hasTeleported = false
	State.cursedGradeEnabled = State.cursedGradeEnabled or {[1] = false, [2] = false, [3] = false, [4] = false, special = false}
	State.cursedTeams = State.cursedTeams or {special = "slot_1", [1] = "slot_1", [2] = "slot_1", [3] = "slot_1", [4] = "slot_1"}
	State.autoEnabledCursed = State.autoEnabledCursed or false
	State.autoRunIdCursed = 0

	-- Infinite Tower
	State.InfinitieTeam = "slot_1"
	State.selectedInfMode = "base"
	State.enabledSwapTeam = false
	State.enabledResetInf = false
	State.teamSwap = "slot_1"
	State.floorSwap = 100
	State.floorRestart = 100
	State.autoCheckPoint = State.autoCheckPoint or false
	State.floorCheckPoint = State.floorCheckPoint or "100"

	-- Raid Boss
	State.selectedRaidBoss = State.selectedRaidBoss or "Creator of Flames"
	State.selectedRaidMode = State.selectedRaidMode or "easy"
	State.selectedRaidItem = State.selectedRaidItem or {}
	State.autoItemRaid = State.autoItemRaid or false

	-- Rank
	State.autoRanked = State.autoRanked or false
	State.autoRunIdRank = 0
	State.modeRanked = State.modeRanked or "scale"
	State.showRanked = State.showRanked or false
	State.selectedRankItem = State.selectedRankItem or {}
	State.autoItemRank = State.autoItemRank or false

	-- Exploration
	State.explorationCards = State.explorationCards or {}

	-- Combine Mode
	State.combineRunning = false
	State.combinePriority = {BattleTower = false, StoryBoss = false, GlobalBoss = false, InfTower = false}

	-- Player
	State.autoDismissEnabled = State.autoDismissEnabled or false
	State.autoEnabledLadder = State.autoEnabledLadder or false
	State.claimDailyQuest = State.claimDailyQuest or false
	State.autoClaimCoroutine = nil
	State.PlayerList = {}
	State.selectedPlayer = LocalPlayer.Name
	State.autofightplayer = false
	State.selectedMoon = {}
	State.autoPrestige = State.autoPrestige or false
	State.autoUpgrade = State.autoUpgrade or false
	State.selectedStat = State.selectedStat or "Luck"
	State.levelcard = State.levelcard or ""
	State.selectBook = State.selectBook or {"common"}
	State.autoBook = State.autoBook or false

	-- Misc
	State.discordWebhookURL = State.discordWebhookURL or ""
	State.sendWebhookBattle = State.sendWebhookBattle or false
	State.sendWebhookCd = State.sendWebhookCd or false
	State.sendWebhookResult = State.sendWebhookResult or false
	State.timeRejoin = State.timeRejoin or 30 * 60
	State.enableRejoin = State.enableRejoin or false
	State.boostfpsv1 = State.boostfpsv1 or false
	State.boostfpsv2 = State.boostfpsv2 or false

	-- Events
	State.autoStartDungeon = State.autoStartDungeon or false
	State.autoClearDungeon = State.autoClearDungeon or false
	State.autoVoteDungeon = State.autoVoteDungeon or false
	State.autoRunIdDungeon = State.autoRunIdDungeon or 0
	State.leaveDungeonFloor = State.leaveDungeonFloor or 100
	State.teamDungeon = State.teamDungeon or "slot_1"
	State.swapTeamDungeon = State.swapTeamDungeon or "slot_1"
	State.swapFloorDungeon = State.swapFloorDungeon or 100
	State.autoSwapTeamDungeon = State.autoSwapTeamDungeon or false
	State.autoDepositOrnament = State.autoDepositOrnament or false
	State.autoUpgradeDungeon = State.autoUpgradeDungeon or false
	State.selectedDungeonStat = State.selectedDungeonStat or {}
	State.selectedStockItem = State.selectedStockItem or {}
	State.autoStockItem = State.autoStockItem or false
	State.selectedDailyItem = State.selectedDailyItem or {}
	State.autoDailyItem = State.autoDailyItem or false
	State.autoTradeOrnament = State.autoTradeOrnament or false

	-------------------------------------------------
	-- Utils
	-------------------------------------------------
	local Utils = {}

	function Utils.notify(title, content, duration)
		WindUI:Notify({Title = title, Content = content, Duration = duration, Icon = "bird"})
	end

	function Utils.sendDiscordMessage(content)
		if not State.discordWebhookURL or State.discordWebhookURL == "" then
			warn("⚠️ Missing Discord Webhook URL.")
			return
		end

		local req = request or http_request or syn and syn.request
		local ok, err

		if req then
			ok, err = pcall(function()
				req({
					Url = State.discordWebhookURL,
					Method = "POST",
					Headers = {["Content-Type"] = "application/json"},
					Body = content,
				})
			end)
		else
			ok, err = pcall(function()
				HttpService:PostAsync(State.discordWebhookURL, content, Enum.HttpContentType.ApplicationJson)
			end)
		end

		if not ok then warn("❌ Webhook send failed:", err) else print("✅ Webhook sent") end
	end

	function Utils.pressE()
		local vim = game:GetService("VirtualInputManager")
		vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
		task.wait(0.08)
		vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
	end

	function Utils.pressZ()
		local vim = game:GetService("VirtualInputManager")
		vim:SendKeyEvent(true, Enum.KeyCode.Z, false, game)
		task.wait(0.08)
		vim:SendKeyEvent(false, Enum.KeyCode.Z, false, game)
	end

	-- Cooldown functions
	function Utils.setCooldown(mode, seconds)
		State.cooldownExpire[mode] = os.time() + seconds
		local success, conf = pcall(function() return HttpService:JSONDecode(readfile(ConfigPath)) end)
		conf = success and conf or {cooldownExpire = {}}
		conf.cooldownExpire[mode] = State.cooldownExpire[mode]
		writefile(ConfigPath, HttpService:JSONEncode({cooldownExpire = State.cooldownExpire}))
	end

	function Utils.getCooldown(mode)
		if State.cooldownExpire[mode] ~= nil then
			return math.max(0, State.cooldownExpire[mode] - os.time())
		end
		return 0
	end

	function Utils.isReady(mode)
		return Utils.getCooldown(mode) == 0
	end

	function Utils.cooldownText(mode)
		local remain = Utils.getCooldown(mode)
		local h = math.floor(remain / 3600)
		local m = math.floor((remain % 3600) / 60)
		local s = math.floor(remain % 60)
		if remain <= 0 then return "Ready!"
		elseif h > 0 then return string.format("%dh %dm %ds", h, m, s)
		elseif m > 0 then return string.format("%dm %ds", m, s)
		else return string.format("%ds", s) end
	end

	function Utils.parseTimeInput(input)
		if type(input) ~= "string" then return 0 end
		input = input:lower():gsub("%s+", "")
		if input == "" or input == "0" then return 0 end

		local h = tonumber(input:match("(%d+)h")) or 0
		local m = tonumber(input:match("(%d+)m")) or 0
		local s = tonumber(input:match("(%d+)s")) or 0

		if h == 0 and m == 0 and s == 0 then
			local onlynum = tonumber(input:match("(%d+)"))
			if onlynum then s = onlynum else return -1 end
		end

		return h * 3600 + m * 60 + s
	end

	function Utils.formatSeconds(sec)
		sec = math.max(0, math.floor(sec))
		local h = math.floor(sec / 3600)
		local m = math.floor((sec % 3600) / 60)
		local s = sec % 60
		if h > 0 then return string.format("%dh %dm %ds", h, m, s)
		elseif m > 0 then return string.format("%dm %ds", m, s)
		else return string.format("%ds", s) end
	end

	-- Global Boss Check
	function Utils.isBossSpawnTime()
		local now = os.date("!*t")
		local hour = now.hour

		for _, window in ipairs(GlobalBossData.SpawnUTCWindows) do
			local startH, endH = table.unpack(window)
			if startH <= endH then
				if hour >= startH and hour < endH then return true end
			else
				if hour >= startH or hour < endH then return true end
			end
		end
		return false
	end

	function Utils.teleport(cframe)
		local Players = game:GetService("Players")
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")
		hrp.CFrame = cframe
	end

	function Utils.teleportToBoss()
		local Players = game:GetService("Players")
		local player = Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local hrp = character:WaitForChild("HumanoidRootPart")
		hrp.CFrame = GlobalBossData.Position
	end

	function RedeemAllCodes()
		for _, code in ipairs(CodesData) do
			Net.redeemEvent:FireServer(code)
			print("[DEBUG] Redeemed code:", code)
			task.wait(0.5)
		end
		print("[DEBUG] Finished redeeming all codes")
	end

	function Utils.log(msg)
		print(("[%s] %s"):format(os.date("%H:%M:%S"), msg))
	end

	-- Popup check
	function Utils.hasPopupContaining(PlayerGui, keyword)
		if not PlayerGui or not keyword or keyword == "" then return false end
		local kw = keyword:lower()
		for _, gui in ipairs(PlayerGui:GetDescendants()) do
			if gui:IsA("TextLabel") or gui:IsA("TextButton") then
				local ok, txt = pcall(function() return tostring(gui.Text) end)
				if ok and txt and txt ~= "" and string.find(txt:lower(), kw, 1, true) then
					return true
				end
			end
		end
		return false
	end

	function Utils.isInRankedCombat()
		return Utils.hasPopupContaining(PlayerGui, "Please wait another ranked")
	end

	function Utils.isInBattlePopupPresent()
		local ok1, hideBtn = pcall(function() return react["1"]["5"]["5"]["3"] end)
		local ok2, showBtn = pcall(function() return react.hud.rollRow["2"]["2"]["3"] end)
		return (ok1 and hideBtn) or (ok2 and showBtn)
	end

	function Utils.getBattleResult()
		local ok, result = pcall(function() return react.battleEndScreen["3"]["2"].Text end)
		if ok then print(result) return result else return "none" end
	end

	-- Forfeit Battle
	function Utils.ForfeitUntilExit()
		while Utils.isInBattlePopupPresent() do
			Net.forfeitBattle:FireServer()
			task.wait(0.25)
		end
	end

	function Utils.getPing()
		local stats = game:GetService("Stats")
		local pingStat = stats.Network.ServerStatsItem["Data Ping"]
		if not pingStat then return 100 end
		return tonumber(pingStat:GetValueString():match("(%d+)")) or 100
	end

	function Utils.normalizeCardName(input)
		if not input or input == "" then return "" end
		input = input:gsub("^%s+", ""):gsub("%s+$", "")

		local name, rarity = input:match("([^:]+):?(.*)")
		if not name then return "" end

		name = name:lower():gsub("%s+", "_")
		rarity = rarity:lower():gsub("%s+", "")

		if rarity == "" and name:find("_") then
			local parts = {}
			for w in string.gmatch(name, "[^_]+") do table.insert(parts, w) end
			rarity = table.remove(parts) or ""
			name = table.concat(parts, "_")
		end

		return string.format("%s:%s", name, rarity)
	end

	function Utils.normalize(text)
		text = text:match("^%s*(.-)%s*$")
		text = text:lower()
		text = text:gsub("%s+", "_")
		return text
	end
	 function Utils.triggerConnections(signal)
	if type(getconnections) ~= "function" then return end
	for _, c in ipairs(getconnections(signal or {})) do
		pcall(c.Function)
	end
    end

     function Utils.safeClick(button)
	if not button then return false end
	if type(getconnections) == "function" then
		Utils.triggerConnections(button.Activated)
		Utils.triggerConnections(button.MouseButton1Click)
	else
		pcall(function()
			button:Activate()
		end)
	end
	return true
    end

    function Utils.waitWithCancel(seconds, conditionFn)
		local elapsed = 0
		while elapsed < seconds do
			if not conditionFn() then
				return false -- bị hủy
			end
			task.wait(1)
			elapsed += 1
		end
		return true -- đợi xong
	end

	-------------------------------------------------
	-- Events
	-------------------------------------------------
	State.autoAcceptInvite = State.autoAcceptInvite or false
	State.autoInviteDungeon = State.autoInviteDungeon or false

	local function IsDungeonLobbyPresent()
		for _, obj in ipairs(workspace:GetChildren()) do
			if string.match(obj.Name, "^Dungeon Lobby %d+$") then
				return true
			end
		end
		return false
	end
	local function AutoStartDungeonLoop()
		task.spawn(function()
			while State.autoStartDungeon do
				if not IsDungeonLobbyPresent() then
					if State.autoInviteDungeon then 
						for _, plr in ipairs(Players:GetPlayers()) do
							  if plr == Players.LocalPlayer then continue end
							  local args = {plr}
                              Net.inviteDungeon:FireServer(unpack(args))
							  task.wait(1)
						end
					end
					task.wait(7.5)
					local args = { "dungeon_christmas" }
					Net.startdungeon:FireServer(unpack(args))
					Utils.notify("Auto Dungeon", "Started a new dungeon!", 2)
				end
				task.wait(2)
			end
		end)
	end

	local function FindDungeonLobby()
		for _, obj in ipairs(workspace:GetChildren()) do
			if string.match(obj.Name, "^Dungeon Lobby %d+$") then
				return obj
			end
		end
		return nil
	end

	local function GetDungeonFloor()
		local success, text = pcall(function() return react.hud.dungeon["2"]["2"].Text end)
		return success and tonumber(text:match("%d+$")) or 0
	end

	local function isDungeonFailed()
		local success, text = pcall(function() return react.hud.dungeon["2"]["3"] end)
		if success and text.Text == "Dungeon failed" then
			return true
		end
		return false
	end

    local function handleNotification(child)
	if not State.autoAcceptInvite then
		return
	end
	task.wait() -- đợi react render
	local textObj =
		child:FindFirstChild("4")
		and child["4"]:FindFirstChild("3")
	if not textObj or not textObj:IsA("TextLabel") then
		return
	end
	local text = textObj.Text
	if not text then return end
	if text:find("has invited")  then
		local btn =
			child["4"]
			and child["4"]:FindFirstChild("4")
			and child["4"]["4"]:FindFirstChild("2")
			and child["4"]["4"]["2"]:FindFirstChild("2")
		if btn then
			Utils.safeClick(btn)
		end
	end
end
notifications.ChildAdded:Connect(handleNotification)
	


       function AutoClearDungeon()
		State.autoRunIdDungeon = State.autoRunIdDungeon + 1
		local runId = State.autoRunIdDungeon
		task.spawn(function()
			while State.autoClearDungeon and runId == State.autoRunIdDungeon do 
					Net.votedungeon:FireServer(0)
					local floor = GetDungeonFloor()
					if State.autoSwapTeamDungeon and floor and floor >= State.swapFloorDungeon then
						local args = { State.swapTeamDungeon }
						Net.setPartySlot:FireServer(unpack(args))
					else 
						local args = { State.teamDungeon }
						Net.setPartySlot:FireServer(unpack(args))
					end
					if floor and floor >= State.leaveDungeonFloor then
						Net.teleportmap:FireServer("lobby")
					end
					if isDungeonFailed() then
						Utils.notify("Auto Dungeon", "Dungeon failed detected, teleporting to lobby...", 2)
						Net.teleportmap:FireServer("lobby")
					end
					local args = { "show_battles", false }
		            Net.showBattle:FireServer(unpack(args))
					task.wait(2.5)
			end
		
		end)
		task.spawn(function()
			while State.autoClearDungeon and runId == State.autoRunIdDungeon do
				local dungeonfolder = FindDungeonLobby()
				if not dungeonfolder then 
					task.wait(0.3)  -- Nhanh detect lobby mới
					continue 
				end
				if dungeonfolder then
					local detectportal = dungeonfolder.ChildAdded:Connect(function(child)
					if not child.Name:match("^completion_portal") then return end
					task.wait(1)
					local portalCFrame = child.WorldPivot
					Utils.teleport(portalCFrame)
					end)
					for _, mob in ipairs(dungeonfolder:GetChildren()) do
						if not State.autoClearDungeon or runId ~= State.autoRunIdDungeon then
							break
						end
						if string.match(mob.Name, "^completion_portal") then
							local portalCFrame = mob.WorldPivot
							Utils.teleport(portalCFrame)
						end
						if not string.match(mob.Name, "^floor") and not string.match(mob.Name, "^completion_portal") then
							    if Utils.isInBattlePopupPresent() then 
									repeat 
										 task.wait(0.001) 
									until not Utils.isInBattlePopupPresent()
								end
								local serverId = mob:GetAttribute("serverEntityId")
								if serverId then
									pcall(function()
										Net.fightenemydungeon:FireServer(serverId)
									end)
									
								
									task.wait(0.15)
								end
						end
					end
					detectportal:Disconnect()
				end
				task.wait(0.1)
			end
		end)
	end

	function AutoDepositOrnament()
		task.spawn(function()
				while State.autoDepositOrnament do 
					for _, ornament in ipairs({"red","blue","green","yellow","purple"}) do
						local args = { ornament }
						for i = 1,10 do
								Net.depositOrnament:FireServer(unpack(args))
								task.wait(0.05)
						end
						task.wait(0.1)
						if State.autoTradeOrnament then Net.tradeOrnament:FireServer(unpack(args)) end
						task.wait(0.1)
					end
					ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("collectSnowflakes"):FireServer()

					task.wait(300)
				end
		
		end)
	end

	function AutoUpgradeDungeon()
		task.spawn(function()
				while State.autoUpgradeDungeon do 
					local statList = State.selectedDungeonStat
					for _, stat in ipairs(statList) do
						local args = { stat, "snowflake"}
						Net.buyDungeonUpgrade:FireServer(unpack(args))
						task.wait(0.1)
					end
					task.wait(5)
				end
		
		end)
	end

	function AutoBuyStockItems()
		task.spawn(function()
			while State.autoStockItem do
				local items = State.selectedStockItem or {}

				for _, item in ipairs(items) do
					if not State.autoStockItem then return end

					local tier = "tier_1"
					if item:find("medium") then
						tier = "tier_2"
					elseif item:find("xlarge") then
						tier = "tier_4"
					elseif item:find("large") then
						tier = "tier_3"
					elseif item:find("oni")
						or item:find("princess")
						or item:find("returner")
						or item:find("azure")
						or item:find("skin") then
						tier = "tier_5"
					end

					local args = { tier, item }
					for i = 1, 5 do
						if not State.autoStockItem then return end
						Net.buyStockItem:FireServer(unpack(args))
						task.wait(0.05)
					end

					task.wait(0.1)
				end

				-- ⬇️ thay task.wait(900) bằng wait có thể hủy
				if not Utils.waitWithCancel(600, function()
					return State.autoStockItem
				end) then
					return
				end
			end
		end)
	end

	function AutoBuyDailyItems()
		task.spawn(function()
			while State.autoDailyItem do
				local items = State.selectedDailyItem or {}

				for _, item in ipairs(items) do
					if not State.autoDailyItem then return end
					local tier = "tier_1"
					if item:find("common_book") or item:find("speed_up_30_minute") then
						tier = "tier_1"
					elseif item:find("uncommon_book") or item:find("speed_up_1_hour") then
						tier = "tier_2"
					elseif item:find("rare_book") or item:find("speed_up_3_hour")  then
						tier = "tier_3"
					elseif item:find("epic_book") or item:find("weak_festive_elixir") or item:find("speed_up_8_hour") then
						tier = "tier_4"
					elseif item:find("legendary_book") or item:find("strong_festive") or item:find("speed_up_12_hour") then
						tier = "tier_5"
					elseif item:find("potent_festive_elixir")  or item:find("3_day") or item:find("24_hour") then
						tier = "tier_6"
					end
					local args = { tier, item }
					local attempt = 5
					if item:find("book") then 
						attempt = 50
					end
					for i = 1, attempt do
						if not State.autoStockItem then return end
						Net.buyEventDailyItem:FireServer(unpack(args))
						task.wait(0.05)
						if item:find("legendary_book") then 
							Net.buyEventDailyItem:FireServer("tier_6", item)
							task.wait(0.05)
                        end
					end

					task.wait(0.1)
				end

				-- ⬇️ thay task.wait(900) bằng wait có thể hủy
				if not Utils.waitWithCancel(1800, function()
					return State.autoDailyItem
				end) then
					return
				end
			end
		end)
	end

	-------------------------------------------------
	-- Item
	-------------------------------------------------
	local stopAutoMoon = false
	local potions = {
		amount = 1,
		autouse = false,
	}
	local function CheckMoonNotify()
		for _, notify in ipairs(react.notifications:GetChildren()) do
			local child4 = notify:FindFirstChild("4")
			if child4 then
				local child3 = child4:FindFirstChild("3")
				if child3 and child3:IsA("TextLabel") then
					local text = child3.Text

					for _, moon in ipairs(State.selectedMoon) do
						if string.find(string.lower(text), string.lower(moon)) then
							return true
						end
					end
				end
			end
		end
		return false
	end

	local function automooncycle()
		if not potions.autouse then
			return
		end
		task.spawn(function()
			while potions.autouse do
				stopAutoMoon = false
				print("[DEBUG] Starting potion roll loop")

				while not stopAutoMoon and potions.autouse do
					Net.useItem:FireServer("moon_cycle_reroll_potion", potions.amount)
					task.wait(0.4)

					if CheckMoonNotify() then
						print("[DEBUG] Stop auto moon because desired moon appeared")
						stopAutoMoon = true
					end
				end

				print("[DEBUG] Waiting 180s before next round")
				task.wait(180)
			end
		end)
	end
	local function autobookitem()
		local books = State.selectBook
		local card = State.levelcard
		while State.autoBook do
			for _, book in ipairs(books) do
				if not State.autoBook or card ~= State.levelcard or books ~= State.selectBook then
					return
				end
				local args = { card, book }
				Net.useXpBook:FireServer(unpack(args))
				task.wait(0.075)
			end
			task.wait(0.075)
		end
	end

	local focusLost, focusGained

	local function EnableLowPower()
		if focusLost or focusGained then
			return
		end

		focusLost = UIS.WindowFocusReleased:Connect(function()
			if setfpscap then
				setfpscap(30)
			end
			RunService:Set3dRenderingEnabled(false)
		end)

		focusGained = UIS.WindowFocused:Connect(function()
			if setfpscap then
				setfpscap(60)
			end
			RunService:Set3dRenderingEnabled(true)
		end)
	end

	local function DisableLowPower()
		if focusLost then
			focusLost:Disconnect()
			focusLost = nil
		end
		if focusGained then
			focusGained:Disconnect()
			focusGained = nil
		end
		if setfpscap then
			setfpscap(60)
		end
		RunService:Set3dRenderingEnabled(true)
	end

	-------------------------------------------------
	-- Auto Reconnect
	-------------------------------------------------
	local function buildDisconnectPayload(reason)
		return HttpService:JSONEncode({
			content = string.format(
				"🛑 Player `%s` disconnected at %s\nPlaceId: %s\nReason: %s",
				tostring(LocalPlayer and LocalPlayer.Name or "Unknown"),
				os.date("%Y-%m-%d %H:%M:%S"),
				tostring(game.PlaceId),
				tostring(reason or "unknown")
			),
		})
	end

	local function tryReconnect()
		local maxAttempts = 5

		for i = 1, maxAttempts do
			local ok = pcall(function()
				TeleportService:Teleport(game.PlaceId, Players)
			end)
			if ok then
				return
			end
			task.wait(5)
		end

		TeleportService:Teleport(game.PlaceId, LocalPlayer)
	end

	local function getPromptOverlay()
		local ok, gui = pcall(function()
			return CoreGui:FindFirstChild("RobloxPromptGui") or CoreGui:WaitForChild("RobloxPromptGui", 3)
		end)
		if not ok or not gui then
			return nil
		end
		return gui:FindFirstChild("promptOverlay") or gui:WaitForChild("promptOverlay", 2)
	end

	local overlay = getPromptOverlay()
	if overlay then
		overlay.ChildAdded:Connect(function(child)
			if child and child.Name == "ErrorPrompt" then
				task.spawn(function()
					local message = "Unknown disconnect reason"
					local desc = child:FindFirstChild("MessageArea") and child.MessageArea:FindFirstChild("ErrorFrame")
					if desc and desc:FindFirstChild("ErrorMessage") then
						message = desc.ErrorMessage.Text
					end
					-- gửi webhook khi có lỗi disconnect
					local payload = buildDisconnectPayload(message)
					pcall(function()
						if Utils and Utils.sendDiscordMessage then
							Utils.sendDiscordMessage(payload)
						end
					end)
					task.wait(2)
					tryReconnect()
				end)
			end
		end)
	end

	-------------------------------------------------
	-- Auto Rejoin after X time amount
	-------------------------------------------------
	local function autoRejoinLoop()
		task.spawn(function()
			while true do
				-- Chờ đến khi bật toggle
				repeat
					task.wait(1)
				until State.enableRejoin

				-- Khi đã bật toggle, mới bắt đầu đếm
				print("[AutoRejoin] ✅ Auto Rejoin enabled.")
				while State.enableRejoin do
					task.wait(State.timeRejoin)
					if State.enableRejoin then
						print("[AutoRejoin] 🔄 Rejoining now...")
						pcall(tryReconnect)
					end
				end

				print("[AutoRejoin] ⏹ Auto Rejoin disabled.")
			end
		end)
	end
	autoRejoinLoop()
	-------------------------------------------------
	--  Dismiss Reward + Pick Up + Teleport + Auto Ladder + Auto Claim Quests
	-------------------------------------------------
	local locations = {
		["Sukuna_Global_Boss"] = CFrame.new(1019, 9, -245),
		["Trait_Shop"] = CFrame.new(121, 7, -96),
		["Craft"] = CFrame.new(357, 7, -332),
		["Craft_Event"] = CFrame.new(575, 7, -306),
		["Exploration"] = CFrame.new(298, 7, -396),
		["Potions"] = CFrame.new(58, 7, -156),
		["Towers"] = CFrame.new(402, 12, -445),
		["Raid_Shop"] = CFrame.new(421, 21, -28),
		["Dungeon_Shop"] = CFrame.new(345, 6, 840),
		["Dungeon_Tree"] = CFrame.new(210, 7, 613),
	}

	local humanoidRoot = character:WaitForChild("HumanoidRootPart")
	function Touch(part)
		if firetouchinterest then
			firetouchinterest(humanoidRoot, part, 0)
			task.wait()
			firetouchinterest(humanoidRoot, part, 1)
		else
			warn("firetouchinterest not available.")
		end
	end

	local pickupConn

	function AutoPickUp()
		print("[AutoPickUp] Enabled ✅")

		-- quét ban đầu
		for _, obj in ipairs(workspace:GetChildren()) do
			local name = obj.Name:lower()
			if name:find("box_") or name:find("potion_") then
				task.defer(function()
					local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
					if part then
						Touch(part)
					end
				end)
			end
		end

		-- lắng nghe spawn mới
		pickupConn = workspace.ChildAdded:Connect(function(obj)
			task.spawn(function()
				local name = obj.Name:lower()
				if name:find("box_") or name:find("potion_") then
					-- đợi cho model spawn xong (max 3s)
					local part
					for _ = 1, 30 do
						part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart", true)
						if part and part:FindFirstChildOfClass("TouchTransmitter") then
							break
						end
						task.wait(0.1)
					end

					if part then
						print("[Touch after spawn]", obj.Name)
						Touch(part)
					else
						warn("[Skip] no TouchInterest found for", obj.Name)
					end
				end
			end)
		end)
	end

	function StopAutoPickUp()
		if pickupConn then
			pickupConn:Disconnect()
			pickupConn = nil
		end
	end

	local popupConn

	function EnableDismissReward()
		if popupConn then
			return
		end
		print("[AutoDismiss] Enabled ✅")

		-- Gọi thử một lần nếu popup đang mở
		Utils.pressZ()

		-- Lắng nghe khi popup thêm nội dung mới (khi nó mở)
		popupConn = rewardsPopup["3"]["2"].ChildAdded:Connect(function()
			if #rewardsPopup["3"]["2"]:GetChildren() > 50 then
				task.wait(3)
			else
				task.wait(1)
			end
			if #rewardsPopup["3"]["2"]:GetChildren() > 1 then Utils.pressZ() end
		end)
	end
	function DisableDismisReward()
		if popupConn then
			popupConn:Disconnect()
			popupConn = nil
		end
	end
	--// Auto Ladder Script

	local function setCharacter(char)
		character = char
		humanoid = char:WaitForChild("Humanoid", 5)
		root = char:WaitForChild("HumanoidRootPart", 5)
	end
	local TELEPORT_POS = Vector3.new(311, 7, 131)
	local targetPos = Vector3.new(314.359558, 4.21313477, 134.109009)

	if LocalPlayer.Character then
		setCharacter(LocalPlayer.Character)
	end
	LocalPlayer.CharacterAdded:Connect(setCharacter)

	local function saveCameraState()
		if not camera then
			camera = workspace.CurrentCamera
		end
		savedCamera.type = camera.CameraType
		savedCamera.subject = camera.CameraSubject
		savedCamera.cframe = camera.CFrame
	end

	local function applyScriptedCamera()
		if not camera then
			camera = workspace.CurrentCamera
		end
		saveCameraState()
		camera.CameraType = Enum.CameraType.Scriptable
	end

	local function restoreCamera()
		if not camera then
			camera = workspace.CurrentCamera
		end
		if savedCamera.type then
			camera.CameraType = savedCamera.type
		end
		if savedCamera.subject then
			pcall(function()
				camera.CameraSubject = savedCamera.subject
			end)
		end
		if savedCamera.cframe then
			camera.CFrame = savedCamera.cframe
		end
		savedCamera = {}
	end

	local function teleportAndStart()
		if not root or not humanoid then
			Utils.notify("Auto Ladder", "Character chưa sẵn sàng", 2)
			return
		end

		root.CFrame = CFrame.lookAt(TELEPORT_POS, targetPos)
		task.wait(1)
		if USE_SCRIPTED_CAMERA then
			pcall(applyScriptedCamera)
		end
		task.wait(1)
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		repeat
			task.wait()
		until humanoid.FloorMaterial == Enum.Material.Air
		State.autoEnabledLadder = true
		Utils.notify("Auto Ladder", "Teleported → Facing ladder → Jumped → Auto-forward ON", 2)
	end

	local function stopAuto()
		State.autoEnabledLadder = false
		if USE_SCRIPTED_CAMERA then
			pcall(restoreCamera)
		end
		Utils.notify("Auto Ladder", "Auto-forward OFF", 2)
	end

	RunService.RenderStepped:Connect(function()
		if not State.autoEnabledLadder then
			return
		end
		if not humanoid or humanoid.Health <= 0 then
			return
		end
		if not root then
			return
		end

		if USE_SCRIPTED_CAMERA and camera then
			local lookPoint = root.Position + Vector3.new(0, 1.5, 0)
			local camPos = root.Position - root.CFrame.LookVector * 6 + Vector3.new(0, 2, 0)
			camera.CFrame = CFrame.lookAt(camPos, lookPoint)
		end

		local forward = Vector3.new(root.CFrame.LookVector.X, 0, root.CFrame.LookVector.Z)
		if forward.Magnitude > 0.01 then
			humanoid:Move(forward.Unit, false)
		end
	end)
	task.spawn(function()
		while true do
			task.wait(600) -- 600s = 10 phút
			if State.autoEnabledLadder then
				Utils.notify("Auto Ladder", "Reset chu kỳ sau 10 phút", 2)
				stopAuto() -- dừng auto-forward
				task.wait(1)
				teleportAndStart() -- bắt đầu lại toàn bộ chuỗi
			end
		end
	end)

	-- Auto Claim All Quest Script
	local function claimAllQuests()
		for questId = 1, 6 do
			Net.claimEvent:FireServer(questId)
			task.wait(0.5)
		end
	end

	-- Hàm bắt đầu vòng lặp claim tự động
	local function startAutoClaim()
		State.autoClaimCoroutine = coroutine.create(function()
			while State.claimDailyQuest do
				claimAllQuests()
				wait(60)
			end
		end)
		coroutine.resume(State.autoClaimCoroutine)
	end

	-- Hàm dừng vòng lặp tự động (bằng cách set flag false thì vòng lặp tự thoát)
	local function stopAutoClaim()
		State.claimDailyQuest = false
		-- Coroutine sẽ dừng do điều kiện vòng lặp
	end
	-------------------------------------------------
	-- Auto Upgrade
	-------------------------------------------------
	local displayToName = {}
	for i, d in ipairs(UpgradeData.displayName) do
		displayToName[d] = UpgradeData.Name[i]
	end

	function autoUpgradePoint()
		if not State.autoUpgrade then
			return
		end
		local stat = displayToName[State.selectedStat]
		while State.autoUpgrade do
			for _, i in ipairs({ 100, 10, 1 }) do
				local args = { stat, i }
				for j = 1, 9 do
					Net.upgradePoint:FireServer(unpack(args))
					task.wait(0.1)
				end
				task.wait(0.2)
			end
			task.wait(1)
		end
	end

	-------------------------------------------------
	-- Rank Shop
	-------------------------------------------------
	function autorankitem()
		while State.autoItemRank do
			print("🛒 [AutoRankItem] Buying selected rank items...")
			for _, i in pairs(State.selectedRankItem) do
				if not State.autoItemRank then
					return
				end
				local item = RankItem[i]
				for j = 1, item.amount do
					if not State.autoItemRank then return end
					print(i)
					local args = {i}
					Net.buyrankitem:FireServer(unpack(args))
					task.wait(0.075)
				end
				task.wait(0.5)
			end

			task.wait(3600)
		end
	end
	-------------------------------------------------
	-- Rank Controller
	-------------------------------------------------
	local Ranked = {}

	--=== Utility ===--
	local function safeGet(fn)
		local ok, result = pcall(fn)
		return ok and result or nil
	end

	local function triggerConnections(signal)
		if type(getconnections) ~= "function" then
			return
		end
		for _, c in ipairs(getconnections(signal or {})) do
			pcall(c.Function)
		end
	end

	local function safeClick(button)
		if not button then
			return false
		end
		if type(getconnections) == "function" then
			triggerConnections(button.Activated)
			triggerConnections(button.MouseButton1Click)
		else
			pcall(function()
				button:Activate()
			end)
		end
		return true
	end

	local function clickModeButton(mode)
		local button = safeGet(function()
			if mode == "scaled" then
				return react.ranked.ranked:GetChildren()[5]["3"]["2"]["2"].scaled["2"]
			else
				return react.ranked.ranked:GetChildren()[5]["3"]["2"]["2"].any["2"]
			end
		end)
		if button then
			safeClick(button)
			print("🔁 Switched Ranked mode to:", mode)
		end
	end

	

	--=== Core ===--
	local function getOpponentsFolder()
		local function tryGet()
			return safeGet(function()
				local ranked = react and react.ranked and react.ranked.ranked
				if not ranked then
					print("not ranked")
					return nil
				end
				local children = ranked:GetChildren()
				if #children < 5 then
					print("< 5")
					return nil
				end
				return children[5]["3"]["3"]["4"]["5"]["2"]["3"]
			end)
		end
		-- mở tab Ranked
		pcall(function()
			local nav = react:FindFirstChild("hud")
			local navFrame = nav and nav:FindFirstChild("navigation")
			local btn = navFrame and (navFrame:FindFirstChild("Ranked") or nav:FindFirstChild("Ranked"))
			if btn and btn:FindFirstChild("Ranked") then
				btn = btn.Ranked
			end
			safeClick(btn)
		end)
		local folder
		repeat
			if not State.autoRanked then
				return nil
			end
			task.wait(0.4)
			folder = tryGet()
		until folder
		-- tự đổi mode nếu cần
		if folder and (State.modeRanked == "any" or State.modeRanked == "scaled") then
			clickModeButton(State.modeRanked)
			task.wait(0.3)
		end
		repeat
			if not State.autoRanked then
				return nil
			end
			task.wait(0.4)
			folder = tryGet()
		until folder

		return folder
	end
	local function getStatus(opp)
		return safeGet(function()
			return opp["8"]["2"]["1"]["4"].Text
		end) or ""
	end
	local function waitUntilDone(opp)
		if not State.showRanked then
			local label = safeGet(function()
				return opp["8"]["2"]["1"]["4"]
			end)
			if not (label and label:IsA("TextLabel")) then
				return
			end
			if label.Text == "Won" or label.Text == "Lost" then
				return
			end

			local conn
			conn = label:GetPropertyChangedSignal("Text"):Connect(function()
				if label.Text == "Won" or label.Text == "Lost" then
					conn:Disconnect()
				end
			end)
			repeat
				if not State.autoRanked then
					return
				end
				task.wait()
			until not conn.Connected
		else
			repeat
				if not State.autoRanked then
					return
				end
				task.wait(0.2)
			until Utils.getBattleResult() ~= "none"
			-- đóng battleEnd popup và bật lại tab Ranked
			task.wait(1.5)
			repeat
				if not State.autoRanked then
					return
				end
				pcall(function()
					local popup = react:FindFirstChild("battleEndScreen")
					if popup then
						local btn = popup:FindFirstChild("2")
						if btn then
							safeClick(btn)
						end
					end
				end)
				task.wait(0.3)
			until not react:FindFirstChild("battleEndScreen")
		end
	end

	local function fightAll()
		local folder = getOpponentsFolder()
		if not folder then
			return
		end
		local args = { "show_battles", State.showRanked }
		Net.showBattle:FireServer(unpack(args))
		task.wait(0.15)
		while folder do
			local foundEnemy = false
			for _, opp in ipairs(folder:GetChildren()) do
				if not State.autoRanked then
					return
				end
				if opp.Name:match("^opponent_%d+$") then
					local s = getStatus(opp)
					if s == "Fight" or s == "Resume" then
						foundEnemy = true
						local id = tonumber(opp.Name:match("%d+"))
						print(("🎯 Attacking opponent %d (%s)"):format(id, s))

						local mode = State.modeRanked == "scaled" and "scaled" or "any"
						while State.autoRanked do
							Net.fightEvent:FireServer(mode, id)
							task.wait(0.75)
							if not Utils.hasPopupContaining(PlayerGui, "Please wait") then
								break
							end
							task.wait(3)
						end
						waitUntilDone(opp)

						-- Mở lại tab sau battle
						if State.showRanked then
							task.wait(0.5)
							local nav = react:FindFirstChild("hud")
							local btn = nav and nav.navigation and nav.navigation:FindFirstChild("Ranked")
							if btn and btn:FindFirstChild("Ranked") then
								btn = btn.Ranked
							end
							safeClick(btn)
						end

						task.wait(0.5)
						break -- ngắt vòng for, reload lại folder mới
					end
				end
			end

			if not foundEnemy then
				break -- không còn kẻ địch nào để đánh
			end

			-- reload folder mới sau mỗi trận
			task.wait(0.5)
			folder = getOpponentsFolder()
		end
	end

	local function allFinished(folder)
		if not folder then
			return false
		end
		for _, opp in ipairs(folder:GetChildren()) do
			if opp.Name:match("^opponent_%d+$") then
				local s = getStatus(opp)
				if s ~= "Won" and s ~= "Lost" and s ~= "Expired" then
					return false
				end
			end
		end
		return true
	end

	local function sendResults(folder)
		if not folder then
			return
		end
		local results, win, loss = {}, 0, 0
		for _, opp in ipairs(folder:GetChildren()) do
			if opp.Name:match("^opponent_%d+$") then
				local s = getStatus(opp)
				table.insert(results, opp.Name .. " → " .. s)
				if s == "Won" then
					win += 1
				elseif s == "Lost" then
					loss += 1
				end
			end
		end
		local msg = ("**Ranked Match Results**\n%s\n\n🏆 Wins: %d | ❌ Losses: %d"):format(
			table.concat(results, "\n"),
			win,
			loss
		)
		Utils.sendDiscordMessage(game:GetService("HttpService"):JSONEncode({ content = msg }))
	end

	--=== Auto Loop ===--
	function Ranked.runAuto()
		State.autoRunIdRank += 1
		local id = State.autoRunIdRank
		local args = { "show_battles", State.showRanked }
		Net.showBattle:FireServer(unpack(args))
		task.wait(0.15)

		task.spawn(function()
			print("🚀 Auto Ranked started.")
			while State.autoRanked and State.autoRunIdRank == id do
				fightAll() -- tự lấy folder, reload sau mỗi trận
				if not State.autoRanked or id ~= State.autoRunIdRank then
					break
				end
				-- đợi tab rank mở lại & folder load đủ
				local folder
				repeat
					task.wait(0.3)
					folder = getOpponentsFolder()
				until folder and #folder:GetChildren() > 0

				-- nếu tất cả đối thủ đã xong
				if allFinished(folder) then
					print("✅ All ranked fights finished.")

					if State.sendWebhookResult then
						sendResults(folder)
					end

					print("♻️ Refreshing ranked opponents...")
					local mode = State.modeRanked == "scaled" and "scaled" or "any"
					Net.refreshEvent:FireServer(mode)
					local newFolder
					local attempts = 0
					repeat
						task.wait(0.6)
						newFolder = getOpponentsFolder()
						attempts += 1
					until (newFolder and #newFolder:GetChildren() > 0) or attempts >= 100

					if not newFolder then
						print("⚠️ Failed to load new ranked folder after refresh.")
					else
						folder = newFolder
						print("✅ Ranked folder reloaded, resuming fights...")
					end
				end

				task.wait(1)
			end
			print("🛑 Auto Ranked stopped.")
		end)
	end

	function Ranked.stopAuto()
		State.autoRunIdRank += 1
	end
	-------------------------------------------------
	-- Raid Shop
	------------------------------------------------
	function autoraiditem()
		task.spawn(function()
			while State.autoItemRaid do
				for _, i in ipairs(State.selectedRaidItem) do
					if not State.autoItemRaid then return end

					local item = RaidItem[i]
					if not item then
						warn("RaidItem not found:", i)
						continue
					end

					local args = { item.shop, item.id, 1 }
					for j = 1, item.amount do
						if not State.autoItemRaid then return end
						Net.buyraiditem:FireServer(unpack(args))
						task.wait(0.075)
					end

					task.wait(0.5)
				end

				print("Bought All Daily Raid Item!!")

				-- ⏱️ wait 1800s nhưng có thể ngắt
				for t = 1, 1800 do
					if not State.autoItemRaid then return end
					task.wait(1)
				end
			end
		end)
	end
	-------------------------------------------------
	-- Raid Boss Controller
	------------------------------------------------
	local RaidBossController = {}
	function teleportToRaid(raidName)
		local raidInfo = RaidData[raidName]
		if raidInfo and raidInfo.teleportName then
			local args = { raidInfo.teleportName }
			ReplicatedStorage:WaitForChild("shared/network@eventDefinitions")
				:WaitForChild("teleport")
				:FireServer(unpack(args))
			Utils.notify("Raid Boss", "📍 Teleported to " .. raidName, 2)
			task.wait(1) -- chờ teleport xong
		end
	end
	local function getRaidServerEntityId(teleportName, timeout)
		timeout = timeout or 5
		local elapsed = 0

		while elapsed < timeout do
			local folder = workspace:FindFirstChild(teleportName)
			if folder then
				local boss = folder:FindFirstChild(teleportName)
				if boss then
					local id = boss:GetAttribute("serverEntityId")
					if id then
						return id
					end
				end
			end
			task.wait(0.25)
			elapsed += 0.25
		end

		return nil
	end

	function RaidBossController.runAuto()
		State.autoRunIdRaid = (State.autoRunIdRaid or 0) + 1
		local runId = State.autoRunIdRaid

		local raidName = State.selectedRaidBoss
		local selectedMode = State.selectedRaidMode or "easy"
		local raidInfo = RaidData[raidName]

		if not raidInfo then
			Utils.notify("Raid Boss", "❌ No raid selected!", 2)
			return
		end

		teleportToRaid(raidName)

		Utils.notify(
			"Raid Boss",
			"🔥 Auto Raid Started (" .. raidName .. ")",
			2
		)

		task.spawn(function()
			while State.autoEnabledRaid and runId == State.autoRunIdRaid do
				local entityId = getRaidServerEntityId(raidInfo.teleportName)

				if not entityId then
					Utils.notify(
						"Raid Boss",
						"⚠️ Boss not found, retrying...",
						2
					)
					task.wait(1)
					continue
				end

				Utils.notify(
					"Raid Boss",
					"⚔️ Fighting " .. raidName .. " | " .. selectedMode,
					2
				)

				pcall(function()
					Net.fightRaidBoss:FireServer(entityId, selectedMode)
				end)

				-- chờ popup
				local waited = 0
				local timeout = 2 * math.clamp(1 + Utils.getPing() / 320, 1, 4)

				while not Utils.isInBattlePopupPresent() and waited < timeout do
					if not State.autoEnabledRaid or runId ~= State.autoRunIdRaid then
						return
					end
					task.wait(0.25)
					waited += 0.25
				end

				-- chờ fight kết thúc
				while Utils.isInBattlePopupPresent() do
					if not State.autoEnabledRaid or runId ~= State.autoRunIdRaid then
						return
					end
					task.wait(0.5)
				end

				task.wait(0.5)
			end

			Utils.notify("Raid Boss", "🛑 Auto Raid Boss Stopped!", 2)
		end)
	end

	function RaidBossController.stopAuto()
		State.autoRunIdRaid = State.autoRunIdRaid + 1
	end

	-------------------------------------------------
	-- Auto Raid Minion Controller
	-------------------------------------------------
	local RaidMinionController = {}

	function RaidMinionController.runAuto()
		State.autoRunIdMinion = (State.autoRunIdMinion or 0) + 1
		local runId = State.autoRunIdMinion

		Utils.notify("Raid Minion", "🔥 Auto Raid Minion Started!", 2)
		local args = {
			"raid_creator_of_flames",
		}
		ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("teleport"):FireServer(unpack(args))

		task.spawn(function()
			while State.autoEnabledMinion and runId == State.autoRunIdMinion do
				local raidFolder = workspace:FindFirstChild("raid_creator_of_flames")
				if raidFolder then
					for _, mob in ipairs(raidFolder:GetChildren()) do
						if not State.autoEnabledMinion or runId ~= State.autoRunIdMinion then
							break
						end

						if mob:IsA("Model") or mob:IsA("Folder") or mob:IsA("Instance") then
							local name = mob.Name:lower()
							if string.find(name, "infernal") then
								local serverId = mob:GetAttribute("serverEntityId")
								if serverId then
									print("[Raid] Đánh:", mob.Name, "| ID:", serverId)
									pcall(function()
										Net.fightRaidMinion:FireServer(serverId)
									end)

									Utils.notify("Raid Minion", "⚔️ Fighting " .. mob.Name, 2)

									-- Đợi popup combat xuất hiện
									local waited = 0
									local ping = Utils.getPing()
									local timeout = 5 + math.clamp(ping / 200, 0, 10)
									while not Utils.isInBattlePopupPresent() and waited < timeout do
										if not State.autoEnabledMinion or runId ~= State.autoRunIdMinion then
											break
										end
										task.wait(0.5)
										waited = waited + 0.5
									end

									-- Đợi popup biến mất → trận kết thúc
									while Utils.isInBattlePopupPresent() do
										if not State.autoEnabledMinion or runId ~= State.autoRunIdMinion then
											break
										end
										task.wait(0.5)
									end

									task.wait(0.5)
								end
							end
						end
					end
				end
				task.wait(1)
			end
			Utils.notify("Raid Minion", "🛑 Auto Raid Minion Stopped!", 2)
		end)
	end

	function RaidMinionController.stopAuto()
		State.autoRunIdMinion = (State.autoRunIdMinion or 0) + 1
	end

	-------------------------------------------------
	-- Exploration Controller
	-------------------------------------------------
	local ExplorationController = {}

	local function prepareCards(cards)
		if not cards or type(cards) ~= "table" then
			return nil
		end
		local prepared = {}
		for _, c in ipairs(cards) do
			if type(c) == "string" and c ~= "" then
				table.insert(prepared, c)
			end
			if #prepared >= 4 then
				break
			end
		end
		if #prepared < 3 then
			return nil
		end
		return prepared
	end

	local function claimExploration(mode)
		pcall(function()
			Net.claimExploration = Net.claimExploration
				or ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("claimExploration")
			Net.claimExploration:FireServer(mode)
		end)
	end

	local function startExploration(mode, cards)
		pcall(function()
			Net.startExploration = Net.startExploration
				or ReplicatedStorage:WaitForChild("shared/network@eventDefinitions"):WaitForChild("startExploration")
			Net.startExploration:FireServer(mode, cards)
		end)
	end

	function ExplorationController.runAuto()
		State.autoRunIdExploration = (State.autoRunIdExploration or 0) + 1
		local runId = State.autoRunIdExploration

		Utils.notify("Exploration", "🚀 Auto Exploration Started!", 2)

		task.spawn(function()
			while State.autoEnabledExploration and runId == State.autoRunIdExploration do
				for _, mode in ipairs(ExplorationData.Modes) do
					if not State.autoEnabledExploration or runId ~= State.autoRunIdExploration then
						break
					end

					local cards = prepareCards(State.explorationCards[mode])
					if cards then
						claimExploration(mode)
						task.wait(0.7)
						startExploration(mode, cards)
						task.wait(2)
					end
				end

				-- chờ 60s trước khi lặp
				for i = 1, 60 do
					if not State.autoEnabledExploration or runId ~= State.autoRunIdExploration then
						break
					end
					task.wait(1)
				end
			end
			Utils.notify("Exploration", "🛑 Auto Exploration Stopped!", 2)
		end)
	end

	function ExplorationController.stopAuto()
		State.autoRunIdExploration = State.autoRunIdExploration + 1
	end

	-------------------------------------------------
	-- Global Boss Controller
	-------------------------------------------------

	local GlobalBossController = {}

	GlobalBossController._runningTask = nil
	local function getBossHP()
		for _, v in ipairs(PlayerGui:GetDescendants()) do
			if v:IsA("TextLabel") then
				local txt = v.Text:gsub(",", ""):gsub("%s+", "")
				local cur, max = txt:match("(%d+%.?%d*)/(%d+)")
				if cur and max then
					cur = math.floor(cur)
					max = tonumber(max)
					if max and max >= 1000000 then
						return cur -- chỉ trả current HP
					end
				end
			end
		end
		return nil
	end

	-- Run Auto Global Boss
	function GlobalBossController.runAuto()
		if GlobalBossController._runningTask then
			State.autoRunIdGb = (State.autoRunIdGb or 0) + 1
			GlobalBossController._runningTask = nil
		end
		local idboss
		State.autoRunIdGb = (State.autoRunIdGb or 0) + 1
		local runId = State.autoRunIdGb
		GlobalBossController._runningTask = task.spawn(function()
			local lastTeamChange = 0
			while State.autoEnabledGb and runId == State.autoRunIdGb do
				-- Kiểm tra boss spawn theo giờ
				if Utils.isBossSpawnTime() then
					-- Teleport nếu chưa teleport trong khung giờ
					if not State.hasTeleported then
						Utils.teleportToBoss()
						State.hasTeleported = true
						Utils.notify("Global Boss", "Teleported to boss!", 2)
						local boss = workspace.lobby.boss.awakened_king_of_curses
						idboss = boss:GetAttribute("serverEntityId")
						Net.setPartySlot:FireServer(State.globalBossTeamLowHP or "slot_1")
						lastTeamChange = os.clock()
						task.wait(0.3)
					end

					local curHp = getBossHP()
					if curHp and curHp >= 75000000 then
						local now = os.clock()
						if now - lastTeamChange >= 5 then
							Net.setPartySlot:FireServer(State.globalBossTeamHighHP or "slot_1")
							Utils.notify("Global Boss", " Change to team >= 75m ", 2)
							lastTeamChange = now
							task.wait(0.3)
						end
					end

					-- Spam fight boss
					if not Utils.isInBattlePopupPresent() then
						Net.fightGlobalBoss:FireServer(idboss)
					end
				else
					-- Boss despawn → reset flag
					State.hasTeleported = false
				end

				task.wait(1) -- delay giữa mỗi lần check/fight
			end
			GlobalBossController._runningTask = nil
		end)
	end

	-- Stop Auto Global Boss
	function GlobalBossController.stopAuto()
		State.hasTeleported = false
		State.autoRunIdGb = State.autoRunIdGb + 1
	end

	-------------------------------------------------
	-- Cursed Zone Controller
	-------------------------------------------------

	local CursedController = {}

	local ColorCache = {} -- cache lưu màu đã gặp để lần sau nhận nhanh hơn

	local function colorDistance(c1, c2)
		return math.sqrt((c1.R - c2.R) ^ 2 + (c1.G - c2.G) ^ 2 + (c1.B - c2.B) ^ 2)
	end

	local function getCursedGrade(zone)
		local aura = zone:FindFirstChild("aura")
		if not aura or not aura:IsA("ParticleEmitter") then
			return nil
		end

		local k1 = aura.Color.Keypoints[1].Value
		local k2 = aura.Color.Keypoints[#aura.Color.Keypoints].Value
		local avgColor = Color3.new((k1.R + k2.R) / 2, (k1.G + k2.G) / 2, (k1.B + k2.B) / 2)

		-- nếu màu đã cache rồi, trả luôn
		if ColorCache[zone.Name] then
			return ColorCache[zone.Name]
		end

		-- bảng màu chuẩn
		local refColors = {
			[4] = Color3.fromRGB(71, 166, 255), -- xanh dương nhạt
			[3] = Color3.fromRGB(88, 34, 141), -- tím xanh
			[2] = Color3.fromRGB(0, 0, 0), -- đen
			[1] = Color3.fromRGB(141, 0, 110), -- xanh tím
			["special"] = Color3.fromRGB(141, 0, 2), -- máu
		}

		local bestMatch, bestDiff = nil, math.huge
		for grade, ref in pairs(refColors) do
			local diff = colorDistance(avgColor, ref)
			if diff < bestDiff then
				bestDiff = diff
				bestMatch = grade
			end
		end

		-- nếu khác biệt đủ nhỏ thì chấp nhận
		if bestDiff < 0.1 then
			ColorCache[zone.Name] = bestMatch
			return bestMatch
		else
			warn("[Cursed] Unknown color zone:", zone.Name, avgColor)
		end

		return nil
	end
	function CursedController.runAuto()
		State.autoRunIdCursed = State.autoRunIdCursed + 1
		local runId = State.autoRunIdCursed
		local maxRetries = 5
		local gradePriority = { "special", 1, 2, 3, 4 }

		task.spawn(function()
			Utils.notify("Cursed", "Auto Cursed Zone Started (Priority: Special > 1 > 2 > 3 > 4)", 3)

			while State.autoEnabledCursed and runId == State.autoRunIdCursed do
				for _, grade in ipairs(gradePriority) do
					if not State.autoEnabledCursed or runId ~= State.autoRunIdCursed then
						return
					end

					if State.cursedGradeEnabled[grade] then
						for _, zone in ipairs(workspace:GetChildren()) do
							if zone.Name:match("^cursed_zone_") then
								local zoneGrade = getCursedGrade(zone)
								if zoneGrade == grade then
									local team = State.cursedTeams[tostring(grade)] or "slot_1"
									local icon = (grade == "special" and "[SPECIAL]") or "[CURSED]"
									local gradeName = tostring(grade):gsub("^s", "S")
									local zoneId = tonumber(zone.Name:match("cursed_zone_(%d+)"))

									if zoneId then
										Utils.notify(
											"Cursed",
											icon .. " Engaging Grade " .. gradeName .. " Zone " .. zoneId,
											2
										)

										for attempt = 1, maxRetries do
											if not State.autoEnabledCursed or runId ~= State.autoRunIdCursed then
												return
											end

											Net.setPartySlot:FireServer(team)
											task.wait(0.5)
											pcall(function()
												Net.fightGlobalBossZone:FireServer(zoneId)
											end)

											local popupWait = 0
											while not Utils.isInBattlePopupPresent() and popupWait < 3 do
												if not State.autoEnabledCursed or runId ~= State.autoRunIdCursed then
													return
												end
												task.wait(1)
												popupWait = popupWait + 1
											end

											if not Utils.isInBattlePopupPresent() then
												Utils.notify(
													"Cursed",
													"Zone " .. zoneId .. " already cleared — skipping.",
													2
												)
												break
											end

											if attempt > 1 then
												Utils.notify(
													"Cursed",
													"Retrying ("
														.. attempt
														.. "/"
														.. maxRetries
														.. ") Grade "
														.. gradeName
														.. " Zone "
														.. zoneId,
													2
												)
											end

											while Utils.isInBattlePopupPresent() do
												if not State.autoEnabledCursed or runId ~= State.autoRunIdCursed then
													return
												end
												task.wait(0.6)
											end
										end

										task.wait(1.5)
									end
								end
							end
						end
					end
				end

				task.wait(2)
			end

			Utils.notify("Cursed", "Auto Cursed Zone Stopped", 2)
		end)
	end

	function CursedController.stopAuto()
		State.autoEnabledCursed = false
		State.autoRunIdCursed = State.autoRunIdCursed + 1
	end

	-------------------------------------------------
	-- Boss Controller
	-------------------------------------------------
	local BossController = {}

	local function getServerEntityId(mapName, bossName, timeout)
		timeout = timeout or 10
		local t = 0

		while t < timeout do
			local map = workspace:FindFirstChild(mapName)
			if map then
				local bossFolder = map:FindFirstChild("boss")
				if bossFolder then
					local boss = bossFolder:FindFirstChild(bossName)
					if boss then
						local id = boss:GetAttribute("serverEntityId")
						if id then
							return id
						end
					end
				end
			end
			task.wait(0.3)
			t += 0.3
		end

		return nil
	end

	function BossController.fightBoss(boss, mode, runId)
		if not State.autoEnabledBoss or runId ~= State.autoRunIdBoss then
			return
		end

		local retries = 0
		local maxRetries = State.bossRetry or 3
		local name = boss.key

		while State.autoEnabledBoss and runId == State.autoRunIdBoss and retries < maxRetries do
			Net.setPartySlot:FireServer(State.bossTeams[boss.key] or "slot_1")
			Utils.notify("Story Boss", "⚔️ Fighting " .. name .. " | " .. mode, 2)

			-- teleport
			local char = LocalPlayer.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				char.HumanoidRootPart.CFrame = boss.teleport
			end

			task.wait(1)

			-- lấy id runtime
			local serverEntityId = getServerEntityId(boss.map, boss.key)
			if not serverEntityId then
				retries += 1
				task.wait(1)
				continue
			end

			-- fight
			Net.fightStoryBoss:FireServer(serverEntityId, mode)

			-- popup wait (giữ nguyên logic cũ)
			local waited = 0
			local timeout = 2.5 * math.clamp(1 + Utils.getPing() / 375, 1, 4)

			while not Utils.isInBattlePopupPresent() and waited < timeout do
				if not State.autoEnabledBoss or runId ~= State.autoRunIdBoss then return end
				task.wait(0.5)
				Net.fightStoryBoss:FireServer(serverEntityId, mode)
				waited += 0.5
			end

			if not Utils.isInBattlePopupPresent() then break end

			local elapsed = 0
			while Utils.isInBattlePopupPresent() and elapsed < 120 do
				task.wait(1)
				elapsed += 1
			end

			if Utils.getBattleResult() == "Victory" then
				State.alreadyFought[boss.key] = State.alreadyFought[boss.key] or {}
				State.alreadyFought[boss.key][mode] = true
				return
			end

			retries += 1
		end

		State.alreadyFought[boss.key] = State.alreadyFought[boss.key] or {}
		State.alreadyFought[boss.key][mode] = true
	end

	function BossController.runAuto()
		State.autoRunIdBoss = State.autoRunIdBoss + 1
		local runId = State.autoRunIdBoss

		State.alreadyFought = State.alreadyFought or {}

		-- init state theo KEY
		for _, boss in ipairs(BossData.List) do
			local key = boss.key
			State.alreadyFought[key] = State.alreadyFought[key] or {}
		end

		task.spawn(function()
			while State.autoEnabledBoss and runId == State.autoRunIdBoss do
				local plan = {}

				-- build plan theo thứ tự BossData.List
				for _, boss in ipairs(BossData.List) do
	local key = boss.key

	if State.selectedBosses[key] then
		local selectedModes = State.bossSelectedModes[key]
		local modesToFight = {}

		if not selectedModes or #selectedModes == 0 then
			for _, mode in ipairs(boss.modes) do
				if not State.alreadyFought[key][mode] then
					table.insert(modesToFight, mode)
				end
			end
		else
			local selectedLookup = {}
			for _, m in ipairs(selectedModes) do
				selectedLookup[m] = true
			end

			for _, mode in ipairs(boss.modes) do
				if selectedLookup[mode] and not State.alreadyFought[key][mode] then
					table.insert(modesToFight, mode)
				end
			end
		end

		if #modesToFight > 0 then
			table.insert(plan, {
				boss = boss,
				modes = modesToFight
			})
		end
	end
end

				-- không còn boss nào cần đánh
				if #plan == 0 then
					Utils.notify("Info", "All selected bosses done", 2)

					task.wait(0.5)
					if State.sendWebhookBattle then
						local embedDataSB = {
							embeds = {{
								title = "⚔️ Story Boss Finished",
								color = 0xff9933,
								description = "✅ Boss defeated!",
								footer = { text = "Auto-reported by script" },
								timestamp = DateTime.now():ToIsoDate(),
							}},
						}

						pcall(function()
							Utils.sendDiscordMessage(HttpService:JSONEncode(embedDataSB))
						end)
					end

					State.autoEnabledBoss = false
				else
					-- đánh theo đúng thứ tự data
					for _, item in ipairs(plan) do
						for _, mode in ipairs(item.modes) do
							if not State.autoEnabledBoss or runId ~= State.autoRunIdBoss then
								break
							end
							BossController.fightBoss(item.boss, mode, runId)
						end
						if not State.autoEnabledBoss or runId ~= State.autoRunIdBoss then
							break
						end
					end
				end

				task.wait(2)
			end
		end)
	end

	function BossController.stopAuto()
		State.autoRunIdBoss = State.autoRunIdBoss + 1
		State.alreadyFought = {}
	end

	-------------------------------------------------
	-- Storyline Controller (fixed)
	-------------------------------------------------
	local StorylineController = {}

	-- ⚔️ Đánh 1 mob trong 1 mode (retry từ State.bossRetry)
	function StorylineController.fightMob(id, mode, runId)
		if not State.storylineEnabled or runId ~= State.storylineRunId then
			return
		end

		local retries = 0
		local maxRetries = State.bossRetry or 3

		while State.storylineEnabled and runId == State.storylineRunId and retries < maxRetries do
			local ok, err = pcall(function()
				Net.fightStoryBoss:FireServer(id, mode)
			end)
			if not ok then
				Utils.notify("Error", tostring(err), 2)
				break
			end

			-- chờ popup combat xuất hiện
			local waited = 0
			local ping = Utils.getPing()
			local scale = math.clamp(1 + ping / 350, 1, 4)
			local timeout = 2.5 * scale
			while not Utils.isInBattlePopupPresent() and waited < timeout do
				if not State.storylineEnabled or runId ~= State.storylineRunId then
					return
				end
				task.wait(0.1)
				waited = waited + 0.1
			end

			if not Utils.isInBattlePopupPresent() then
				Utils.notify("No Response", "", 2)
				break
			end
			local elapsed = 0
			while Utils.isInBattlePopupPresent() and elapsed < 120 do
				if not State.storylineEnabled or runId ~= State.storylineRunId then
					return
				end
				task.wait(1)
				elapsed = elapsed + 1
			end

			local result = Utils.getBattleResult()

			if result == "Victory" then
				return
			else
				retries = retries + 1
			end
		end
	end

	-- 🗺️ Chạy 1 map (loop mode + all mobs)
	function StorylineController.fightMap(mapKey, runId)
		local selectedModes = State.storylineSelectedMode[mapKey]
		local mobs = StorylineData.Mobs[mapKey]
		if not mobs or #mobs == 0 then
			return
		end
		Net.setPartySlot:FireServer(State.storylineTeams[mapKey])
		task.wait(0.5)

		for _, mode in ipairs(selectedModes) do
			if runId ~= State.storylineRunId then
				break
			end
			Utils.notify("Storyline", "▶ Map: " .. mapKey .. " | Mode: " .. mode, 2)

			for _, mob in ipairs(mobs) do
				if runId ~= State.storylineRunId then
					break
				end
				Utils.notify("Storyline", "⚔️ Fighting " .. mob.name, 1.5)
				StorylineController.fightMob(mob.id, mode, runId)
				Utils.notify("Storyline", "✅ " .. mob.name .. " cleared", 1)
				task.wait(0.75)
			end
		end
	end

	-- 🔁 Auto vòng chính
	function StorylineController.runAuto()
		State.storylineRunId = State.storylineRunId + 1
		local runId = State.storylineRunId

		Utils.notify("Storyline", "📜 Storyline Auto Started", 2)

		task.spawn(function()
			for _, mapKey in ipairs(StorylineData.Maps) do
				if not State.storylineEnabled or runId ~= State.storylineRunId then
					break
				end
				if State.storylineSelectedMaps[mapKey] then
					StorylineController.fightMap(mapKey, runId)
					task.wait(1)
				end
			end

			Utils.notify("Storyline", "🛑 Storyline Auto Stopped", 2)
			State.storylineEnabled = false
		end)
	end

	-- ⛔ Dừng vòng auto
	function StorylineController.stop()
		State.storylineRunId = State.storylineRunId + 1
		Utils.notify("Storyline", "🔴 Storyline Auto Disabled", 2)
	end

	-------------------------------------------------
	-- BATTLE TOWER CONTROLLER
	-------------------------------------------------
	local TowerController = {}

	--- Fight Tower Wave Logic ---
	function TowerController.fightWave(mode, wave, runId)
		if not State.autoEnabledTower or runId ~= State.autoRunIdTower then
			return
		end
		local maxRetries = State.BtRetry or 3
		local success = false

		for attempt = 1, maxRetries do
			if success or not State.autoEnabledTower or runId ~= State.autoRunIdTower then
				return
			end

			Utils.notify(
				"Tower",
				("⚔️ Fighting %s | Wave %d (Try %d/%d)"):format(TowerData.ModeNames[mode], wave, attempt, maxRetries),
				4
			)

			-- set team
			local selectedTeam = State.towerTeams[mode] or "slot_1"
			Net.setPartySlot:FireServer(selectedTeam)

			-- gửi request đánh
			print("[Tower] Fight request:", mode, wave, "attempt", attempt)
			local ok, err = pcall(function()
				Net.fightBattleTowerWave:FireServer(mode, wave)
			end)
			if not ok then
				warn("[Tower] Fight request failed:", err)
				task.wait(2)
				-- tiếp attempt kế tiếp
			else
				-- đợi popup combat xuất hiện (nếu không xuất -> wave đã clear)
				local waited = 0
				local ping = Utils.getPing()
				local scale = math.clamp(1 + ping / 350, 1, 4)
				local timeout = 2.75 * scale
				while not Utils.isInBattlePopupPresent() and waited < timeout do
					if not State.autoEnabledTower or runId ~= State.autoRunIdTower then
						return
					end
					task.wait(0.5)
					waited = waited + 0.5
					Net.fightBattleTowerWave:FireServer(mode, wave)
				end

				if not Utils.isInBattlePopupPresent() then
					-- không có popup => wave đã clear
					Utils.notify("Tower", "✅ Wave " .. wave .. " already cleared. Skipping...", 3)
					success = true
					break
				end

				-- popup ĐÃ xuất hiện. Nếu attempt > 1 thì đây là bằng chứng lần trước thua.
				if attempt > 1 then
					if attempt < maxRetries then
						Utils.notify(
							"Tower",
							("💀 Previous attempt lost. Retrying (%d/%d)..."):format(attempt + 1, maxRetries),
							3
						)
					else
						Utils.notify(
							"Tower",
							("💀 Previous attempt lost. This was the last try (%d/%d)."):format(attempt, maxRetries),
							3
						)
					end
				end

				-- đang thật sự combat -> đợi kết thúc (qua các floor)
				local missingTime = 0
				while missingTime < 2 do
					if not State.autoEnabledTower or runId ~= State.autoRunIdTower then
						return
					end

					if Utils.isInBattlePopupPresent() then
						missingTime = 0
					else
						missingTime = missingTime + 0.2
					end

					task.wait(0.2)
				end
				-- sau khi trận kết thúc, tiếp vòng for để gửi fight lại nếu cần
				if attempt < maxRetries then
					task.wait(0.75) -- small delay trước lần thử tiếp theo
				end
			end
		end

		-- mark wave done
		State.towerAlreadyFought[mode] = State.towerAlreadyFought[mode] or {}
		State.towerAlreadyFought[mode][wave] = true

		if success then
			Utils.notify("Tower", "🏆 Wave " .. wave .. " finished!", 2)
		else
			Utils.notify("Tower", "❌ All retries used for Wave " .. wave .. ". Skipping...", 3)
		end
	end

	---- Run Auto Battle Tower ----
	function TowerController.runAuto()
		-- Khởi tạo dữ liệu nếu chưa có
		State.towerAlreadyFought = State.towerAlreadyFought or {}
		for _, mode in ipairs(TowerData.Modes) do
			State.towerAlreadyFought[mode] = State.towerAlreadyFought[mode] or {}
		end

		State.autoRunIdTower = (State.autoRunIdTower or 0) + 1
		local runId = State.autoRunIdTower

		task.spawn(function()
			while State.autoEnabledTower and runId == State.autoRunIdTower do
				local hasWaveToFight = false

				for _, mode in ipairs(TowerData.Modes) do
					if State.selectedTowerModes[mode] then
						-- Lấy waves đã chọn, nếu chưa chọn thì đánh tất cả
						local selectedWaves = State.towerSelectedWaves[mode]
						local maxWave = (mode == "battle_tower") and 50 or 25
						if not selectedWaves or #selectedWaves == 0 then
							selectedWaves = {}
							for i = 1, maxWave do
								table.insert(selectedWaves, i)
							end
						end

						for _, wave in ipairs(selectedWaves) do
							if not (State.towerAlreadyFought[mode] and State.towerAlreadyFought[mode][wave]) then
								hasWaveToFight = true
								TowerController.fightWave(mode, wave, runId)
							end

							if not State.autoEnabledTower or runId ~= State.autoRunIdTower then
								break
							end
						end
					end
				end

				if not hasWaveToFight then
					Utils.notify("Info", "All selected tower waves are done", 2)
					task.wait(0.5)

					if State.sendWebhookBattle then
						local embedData = {
							embeds = {
								{
									title = "🏰 Battle Tower Finished",
									color = 0x00ff99,
									description = "✅ All selected waves are done!",
									footer = { text = "Auto-reported by script" },
									timestamp = DateTime.now():ToIsoDate(),
								},
							},
						}

						pcall(function()
							Utils.sendDiscordMessage(HttpService:JSONEncode(embedData))
						end)
					end

					State.autoEnabledTower = false
					break
				end

				task.wait(2)
			end
		end)
	end

	-- Stop Battle Tower
	function TowerController.stopAuto()
		State.autoRunIdTower = State.autoRunIdTower + 1
		State.towerAlreadyFought = {}
	end

	-------------------------------------------------
	-- Infinitie Tower Control (gọn)
	-------------------------------------------------
	local InfTowerController = {}
	State.pauseInf = false
	State.floor = 1
	State.fightingInf = false
	State.fightingRunIdInf = 0

	local function getFloorFromGui()
		local success, modeLabel = pcall(function()
			return react["1"]["3"].mode
		end)
		if not success or not modeLabel or not modeLabel:IsA("TextLabel") then
			return nil
		end

		local text = modeLabel.Text
		if not text or text == "" then
			return nil
		end

		-- Tìm số tầng trong text, ví dụ "Tower XYZ: Floor 123"
		local floorStr = string.match(text:lower(), "floor%s*(%d+)")
		if floorStr then
			return tonumber(floorStr)
		end

		return nil
	end

	function InfTowerController.fighting()
		print("Start Fighting Infinite Tower")
		State.fightingRunIdInf = State.fightingRunIdInf + 1
		local runId = State.fightingRunIdInf

		local floorInfinite = getFloorFromGui() or 1
		if State.pauseInf then
			floorInfinite = State.floor
			State.pauseInf = false
		end
		local currentTeam = State.InfinitieTeam
		if State.autoEnabledInf and State.enabledSwapTeam and floorInfinite >= State.floorSwap then
			currentTeam = State.teamSwap
		end
		Net.setPartySlot:FireServer(currentTeam)
		local desireTeam = currentTeam
		task.wait(0.3)
		if State.autoCheckPoint then 
			if State.selectedInfMode == "base" then
				local floor = tonumber(State.floorCheckPoint)
				floor = floor / 100
				local args = {"base", floor}
				Net.fightInfinite:FireServer(unpack(args))
			else 
				local floor = tonumber(State.floorCheckPoint)
				floor = floor / 50 
				local args = {State.selectedInfMode, floor}
				Net.fightInfinite:FireServer(unpack(args))
			end
		else
		       Net.fightInfinite:FireServer(State.selectedInfMode)
		end
		task.spawn(function()
			while State.fightingInf and runId == State.fightingRunIdInf do
				local success, target = pcall(function()
					return react.hud.rollRow["2"]["2"]["3"]
				end)
				if success and target and target.Text == "Show Summary" then
					floorInfinite += 1
					repeat
						task.wait()
						if not target or not target.Parent then
							break
						end
					until target.Text ~= "Show Summary"
				end
				floorInfinite = getFloorFromGui() or floorInfinite
				if State.floor ~= floorInfinite then
					State.floor = floorInfinite
					print("Current Floor Infinite Tower: " .. floorInfinite)
				end
				if State.enabledResetInf and floorInfinite >= State.floorRestart and State.autoEnabledInf then
					Utils.ForfeitUntilExit()
					break
				end
				if State.autoEnabledInf and State.enabledSwapTeam and floorInfinite >= State.floorSwap then
					desireTeam = State.teamSwap
				else
					desireTeam = State.InfinitieTeam
				end
				if desireTeam ~= currentTeam then
					Net.setPartySlot:FireServer(desireTeam)
					currentTeam = desireTeam
				end
				task.wait(0.5)
			end
		end)
	end

	function InfTowerController.runAuto()
		State.autoRunIdInf = State.autoRunIdInf + 1
		local runId = State.autoRunIdInf
		Utils.notify("Inf Tower Mode", "Start Fight Infinite Tower", 2)

		task.spawn(function()
			while State.autoEnabledInf and runId == State.autoRunIdInf do
				if not State.autoEnabledInf or runId ~= State.autoRunIdInf then
					break
				end
				if State.fightingInf == false and getFloorFromGui() ~= nil then
					State.pauseInf = true
					State.floor = getFloorFromGui()
					State.fightingInf = true
					InfTowerController.fighting()
				end
				if not Utils.isInBattlePopupPresent() then
					local t0 = tick()
					while not Utils.isInBattlePopupPresent() do
						if not State.autoEnabledInf or runId ~= State.autoRunIdInf then
							break
						end
						if State.fightingInf == false and getFloorFromGui() ~= nil then
							State.pauseInf = true
							State.floor = getFloorFromGui()
							State.fightingInf = true
							InfTowerController.fighting()
						end

						if tick() - t0 > 5 then
							State.fightingInf = true
							InfTowerController.fighting()
						end
						task.wait(0.5)
					end
				end

				task.wait(1)
			end
		end)
	end

	function InfTowerController.pause()
		State.autoEnabledInf = false
		State.autoRunIdInf = State.autoRunIdInf + 1
		State.fightingInf = false
		State.fightingRunIdInf = State.fightingRunIdInf + 1
		State.pauseInf = true
		Net.netSetting:FireServer("infinite_tower_auto_advance_timer", 9)
		task.wait(1)
		local isInfRunning = true
		while isInfRunning do
			pcall(function()
				Net.pauseInfinite:FireServer()
			end)
			if not Utils.isInBattlePopupPresent() then
				local startTime = tick()
				while not Utils.isInBattlePopupPresent() do
					if tick() - startTime >= 3 then
						isInfRunning = false
						break
					end
					task.wait(1)
				end
			end
			task.wait(0.1)
		end

		task.wait(0.5)
		Net.netSetting:FireServer("infinite_tower_auto_advance_timer", 1)
		Utils.notify("Inf Tower", "Infinite Tower pause successfully", 2)
	end

	function InfTowerController.stopAuto()
		State.autoRunIdInf = State.autoRunIdInf + 1
		State.autoEnabledInf = false
		State.fightingInf = false
		State.fightingRunIdInf = State.fightingRunIdInf + 1
	end

	-------------------------------------------------
	-- Combine Mode Controller
	-------------------------------------------------
	local CombineModeController = {}
	local combineState = {
		priority = {
			BattleTower = false,
			StoryBoss = false,
			GlobalBoss = false,
			InfTower = false,
		},
	}

	task.spawn(function()
		while true do
			if State.sendWebhookCd then
				-- Lấy cooldown hiện tại
				local battle = Utils.cooldownText("BattleTower")
				local story = Utils.cooldownText("StoryBoss")
				local embedData = {
					embeds = {
						{
							title = "📅 Cooldown Tracker",
							color = 0x00ff99, -- màu xanh
							fields = {
								{ name = "🏰 Battle Tower", value = battle, inline = true },
								{ name = "⚔️ Story Boss", value = story, inline = true },
							},
							footer = { text = "Auto-updated every 5 minutes" },
							timestamp = DateTime.now():ToIsoDate(),
						},
					},
				}

				-- Encode JSON
				local jsonPayload = HttpService:JSONEncode(embedData)

				-- Gửi webhook
				pcall(function()
					Utils.sendDiscordMessage(jsonPayload)
				end)
			end
			task.wait(300) -- 5 phút gửi 1 lần
		end
	end)

	function CombineModeController.run()
		State.autoRunIdCombine = State.autoRunIdCombine + 1
		local runId = State.autoRunIdCombine

		if State.autoEnabledInf then
			pcall(function()
				InfTowerController.pause()
				task.wait(0.5)
			end)
		end
		task.spawn(function()
			while State.autoEnabledCombine and runId == State.autoRunIdCombine do
				if not State.autoEnabledCombine or runId ~= State.autoRunIdCombine then
					break
				end
				if combineState.priority.StoryBoss and State.selectedBosses then
					if Utils.isReady("StoryBoss") then
						InfTowerController.pause()
						State.alreadyFought = {}
						State.autoEnabledBoss = true
						BossController.runAuto()
						repeat
							task.wait(1)
						until not State.autoEnabledBoss
						Utils.setCooldown("StoryBoss", secondsToNextMidnightEST())
					end
				end
				if not State.autoEnabledCombine or runId ~= State.autoRunIdCombine then
					break
				end
				if combineState.priority.BattleTower and State.selectedTowerModes then
					if Utils.isReady("BattleTower") and not State.autoEnabledBoss then
						InfTowerController.pause()
						State.towerAlreadyFought = {}
						State.autoEnabledTower = true
						TowerController.runAuto()
						repeat
							task.wait(1)
						until not State.autoEnabledTower
						Utils.setCooldown("BattleTower", secondsToNextMidnightEST())
					end
				end
				if not State.autoEnabledCombine or runId ~= State.autoRunIdCombine then
					break
				end
				-- Global Boss
				if combineState.priority.GlobalBoss then
					if Utils.isBossSpawnTime() and not State.autoEnabledTower and not State.autoEnabledBoss then
						InfTowerController.pause()
						State.autoEnabledGb = true
						GlobalBossController.runAuto()
						repeat
							task.wait(1)
						until not Utils.isBossSpawnTime()
						State.autoEnabledGb = false
						State.autoRunIdGb = State.autoRunIdGb + 1
					end
				end
				if not State.autoEnabledCombine or runId ~= State.autoRunIdCombine then
					break
				end
				-- Infinite Tower
				if combineState.priority.InfTower then
					if
						not State.autoEnabledInf
						and not State.autoEnabledTower
						and not State.autoEnabledBoss
						and not State.autoEnabledGb
					then
						State.autoEnabledInf = true
						InfTowerController.runAuto()
					end
				end

				task.wait(1)
			end
		end)
	end

	function CombineModeController.stop()
		InfTowerController.stopAuto()
		State.autoEnabledGb = false
		State.autoRunIdGb = State.autoRunIdGb + 1
		State.autoEnabledBoss = false
		State.autoRunIdBoss = State.autoRunIdBoss + 1
		State.autoEnabledTower = false
		State.autoRunIdTower = State.autoRunIdTower + 1
		State.autoRunIdCombine = State.autoRunIdCombine + 1
		State.alreadyFought = {}
		State.towerAlreadyFought = {}
	end

	-- Hàm để UI set priority
	function CombineModeController.setPriority(mode, value)
		if combineState.priority[mode] ~= nil then
			combineState.priority[mode] = value
		end
	end

	----------------------------------------
	-- UI
	----------------------------------------

	local Window = WindUI:CreateWindow({
		Title = "Aqua Hub",
		Icon = "rbxassetid://114289527320220",
		Author = "by aquane1075",
		Folder = "AnimeCardClash",

		-- ↓ This all is Optional. You can remove it.
		Size = UDim2.fromOffset(850, 560),
		MinSize = Vector2.new(560, 350),
		MaxSize = Vector2.new(1000, 800),
		Transparent = true,
		Theme = "Crimson",
		Resizable = true,
		BackgroundImageTransparency = 0.05,
		Acrylic = true,
		SideBarWidth = 200,
		HideSearchBar = false,
		ScrollBarEnabled = false,
		User = {
			Enabled = false,
			Anonymous = false,
			Callback = function() end,
		},
		OpenButton = {
			Title = "Aqua hub UI", -- can be changed
			CornerRadius = UDim.new(0,16), -- fully rounded
			StrokeThickness = 2, -- removing outline
			Color = ColorSequence.new( -- gradient
			Color3.fromHex("FF0F7B"), 
			Color3.fromHex("F89B29")
		),
			Enabled = true, -- enable or disable openbutton
			OnlyMobile = false,
			Icon = "monitor",
			Draggable = true,
		},
	})

	WindUI:AddTheme({
		Name = "Elude Purple",

		-- 🌈 Base colors
		Accent = Color3.fromHex("#cf9bff"), -- tím sáng nhẹ làm màu chính
		Background = Color3.fromHex("#0e071a"), -- nền tím đậm
		Outline = Color3.fromHex("#caa8ff"), -- viền mỏng sáng tím
		Text = Color3.fromHex("#e6dbff"), -- chữ trắng pha tím
		Placeholder = Color3.fromHex("#a68dcf"),
		Button = Color3.fromHex("#3d2a5b"),
		Icon = Color3.fromHex("#c2a3ff"),

		-- ✨ Hover / highlights
		Hover = Color3.fromHex("#f4e4ff"),
		BackgroundTransparency = 0,

		-- 🌌 Window
		WindowBackground = Color3.fromHex("#0b0416"),
		WindowShadow = Color3.fromHex("#000000"),

		-- 🪞 Dialogs
		DialogBackground = Color3.fromHex("#120927"),
		DialogBackgroundTransparency = 0.05,
		DialogTitle = Color3.fromHex("#e2d9ff"),
		DialogContent = Color3.fromHex("#c2a3ff"),
		DialogIcon = Color3.fromHex("#d7b7ff"),

		-- 🪩 Topbar
		WindowTopbarButtonIcon = Color3.fromHex("#d7b7ff"),
		WindowTopbarTitle = Color3.fromHex("#f4eaff"),
		WindowTopbarAuthor = Color3.fromHex("#b388ff"),
		WindowTopbarIcon = Color3.fromHex("#e2d9ff"),

		-- 📁 Tabs
		TabBackground = Color3.fromHex("#1a0d33"),
		TabTitle = Color3.fromHex("#e2d9ff"),
		TabIcon = Color3.fromHex("#c2a3ff"),

		-- ⚙️ Elements
		ElementBackground = Color3.fromHex("#1a0d33"),
		ElementTitle = Color3.fromHex("#f4eaff"),
		ElementDesc = Color3.fromHex("#bda0ff"),
		ElementIcon = Color3.fromHex("#c2a3ff"),

		-- 📦 Popups
		PopupBackground = Color3.fromHex("#120b24"),
		PopupBackgroundTransparency = 0.1,
		PopupTitle = Color3.fromHex("#e2d9ff"),
		PopupContent = Color3.fromHex("#c2a3ff"),
		PopupIcon = Color3.fromHex("#bda0ff"),
	})

	-- 🌠 Gradient nền tạo hiệu ứng phát sáng ảo
	WindUI:Gradient({
		["0"] = { Color = Color3.fromHex("#201538"), Transparency = 0.05 },
		["100"] = { Color = Color3.fromHex("#120b24"), Transparency = 0.15 },
	}, {
		Rotation = 30,
	})
	local ConfigManager = Window.ConfigManager

	-- unique config cho từng account
	local configName = string.format("%s_%d", LocalPlayer.Name, LocalPlayer.UserId)
	local myConfig = ConfigManager:CreateConfig(configName)

	-- auto save khi leave
	Players.PlayerRemoving:Connect(function(v)
		if v == LocalPlayer then
			myConfig:Save()
		end
	end)

	Window:Tag({
		Title = "v2.0.0",
		Color = Color3.fromHex("#ffffff"),
	})
	Window:CreateTopbarButton("theme-switcher", "moon", function()
		WindUI:SetTheme(WindUI:GetCurrentTheme() == "Crimson" and "Elude Purple" or "Crimson")
		WindUI:Notify({
			Title = "Theme Changed",
			Content = "Current theme: " .. WindUI:GetCurrentTheme(),
			Duration = 2,
		})
	end, 990)

	local Dashboard = Window:Tab({
		Title = "Dashboard",
		Icon = "lucide:app-window", -- optional
	})

	local Keybind = Dashboard:Keybind({
		Title = "Keybind",
		Desc = "Keybind to open ui",
		Value = "LeftControl",
		Callback = function(v)
			Window:SetToggleKey(Enum.KeyCode[v])
		end,
	})

	local Themes = {
		"Elude Purple",
		"Dark",
		"Rose",
		"Light",
		"Plant",
		"Red",
		"Indigo",
		"Sky",
		"Violet",
		"Amber",
		"Emerald",
		"Midnight",
		"Crimson",
		"Monokai Pro",
		"Cotton Candy",
		"Rainbow",
		"",
	}
	local Theme = Dashboard:Dropdown({
		Title = "Select Theme",
		Values = Themes,
		Value = "Crimson",
		Flag = "Theme",
		Callback = function(option)
			WindUI:SetTheme(option)
		end,
	})

	local Event = Window:Section({
		Title = "Event",
		Icon = "lucide:calendar", -- optional
		Opened = false,
	})

	local Shop = Event:Tab({
		Title = "Shop",
		Icon = "lucide:shopping-cart", -- optional
	})
	Shop:Dropdown({
		Title = "Select Shop Stock Items",
		Values = StockItem,
		Value = State.selectedStockItem or {},
		Multi = true,
		AllowNone = false,
		Flag = "ShopStockItems",
		Callback = function(option)
			State.selectedStockItem = option
		end,
	})
	Shop:Dropdown({
		Title = "Select Shop Daily Items",
		Values = DailyItem,
		Value = State.selectedDailyItem or {},
		Multi = true,
		AllowNone = false,
		Flag = "ShopDailyItems",
		Callback = function(option)
			State.selectedDailyItem = option
		end,
	})

	Shop:Toggle({
		Title = "Auto Buy Shop Stock Items",
		Value = State.autoStockItem or false,
		Flag = "AutoBuyStockItems",
		Callback = function(v)
			State.autoStockItem = v
			if v then
				AutoBuyStockItems()
			end
		end,
	})
	Shop:Toggle({
		Title = "Auto Buy Shop Daily Items",
		Value = State.autoDailyItem or false,
		Flag = "AutoBuyDailyItems",
		Callback = function(v)
			State.autoDailyItem = v
			if v then
				AutoBuyDailyItems()
			end
		end,
	})
	local Upgrade = Event:Tab({
		Title = "Upgrade",
		Icon = "lucide:arrow-up-circle", -- optional
	})
	Upgrade:Dropdown({
		Title = "Select Upgrade Stats",
		Values = {"doubleOrnamentDrop","ornamentDropChance","doubleSnowflakeDrop","dungeonBattleSpeed"},
		Value = State.selectedDungeonStat or {},
		Multi = true,
		AllowNone = false,
		Flag = "UpgradeStats",
		Callback = function(option)
			State.selectedDungeonStat = option
		end,
	})
	Upgrade:Toggle({
		Title = "Auto Upgrade Merchant Stats",
		Value = State.autoUpgradeDungeon or false,
		Flag = "AutoUpgradeStats",
		Callback = function(v)
			State.autoUpgradeDungeon = v
			if v then
				AutoUpgradeDungeon()
			end
		end,
	})
	local Ornament = Event:Tab({
		Title = "Ornament",
		Icon = "lucide:gift", -- optional
	})
	Ornament:Toggle({
		Title = "Auto Trade Ornament",
		Value = State.autoTradeOrnament or false,
		Flag = "AutoTradeOrnament",
		Callback = function(v)
			State.autoTradeOrnament = v
		end,
	})
	Ornament:Toggle({
		Title = "Auto Deposit Ornament",
		Value = State.autoDepositOrnament or false,
		Flag = "AutoOrnament",
		Callback = function(v)
			State.autoDepositOrnament = v
			if v then
				AutoDepositOrnament()
			end
		end,
	})

	local Dungeon = Event:Tab({
		Title = "Dungeon",
		Icon = "lucide:door-open", -- optional
	})

	local DungeonSetting = Dungeon:Section({
		Title = "Dungeon Setting",
		Box = true,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})
	DungeonSetting:Toggle({
		Title = "Enable Auto Invite People",
		Value = State.autoInviteDungeon or false,
		Flag = "AutoInviteDungeon",
		Callback = function(v)
				State.autoInviteDungeon = v
		end,
	})
	DungeonSetting:Toggle({
		Title = "Enable Auto Accept Invite Dungeon",
		Value = State.autoAcceptInvite or false,
		Flag = "AutoAcceptInvite",
		Callback = function(v)
			State.autoAcceptInvite = v
		end,
	})
	DungeonSetting:Dropdown({
		Title = "Dungeon Team",
		Values = {"slot_1", "slot_2", "slot_3", "slot_4", "slot_5", "slot_6", "slot_7", "slot_8"},
		Value = State.teamDungeon or "slot_1",
		Flag = "DungeonTeam",
		SearchBarEnabled = true,
		Callback = function(option)
			State.teamDungeon = option
		end,
	})
	DungeonSetting:Dropdown({
		Title = "Dungeon Team Swap",
		Values = {"slot_1", "slot_2", "slot_3", "slot_4", "slot_5", "slot_6", "slot_7", "slot_8"},
		Value = State.swapTeamDungeon or "slot_1",
		Flag = "DungeonSwapTeam",
		SearchBarEnabled = true,		
		Callback = function(option)
				State.swapTeamDungeon = option
		end,
	})
	DungeonSetting:Input({
		Title = "Dungeon Swap Team Floor",
		Desc = "Default: 1",
		Value = State.swapFloorDungeon or "50",
		Type = "Input",
		Placeholder = "Enter floor to swap team dungeon",		
		Flag = "DungeonSwapTeamFloor",
		Callback = function(text)
				State.swapFloorDungeon = tonumber(text) or 50
		end,
	})
	DungeonSetting:Toggle({
		Title = "Enable Swap Team",
		Value = State.autoSwapTeamDungeon or false,
		Flag = "EnableSwapDungeonTeam",
		Callback = function(v)
				State.autoSwapTeamDungeon = v
		end,
	})
	DungeonSetting:Input({
		Title = "Dungeon Leave Floor",
		Desc = "Default: 100",
		Value = State.leaveDungeonFloor or "100",
		Type = "Input",
		Placeholder = "Enter floor to leave dungeon",		
		Flag = "DungeonLeaveFloor",
		Callback = function(text)
				State.leaveDungeonFloor = tonumber(text) or 100
		end,
	})

	Dungeon:Toggle({
		Title = "Auto Start Dungeon",
		Value = State.autoStartDungeon or false,
		Flag = "AutoStartDungeon",
		Callback = function(v)
			State.autoStartDungeon = v
			if v then
				AutoStartDungeonLoop()
			end
		end,
	})
	Dungeon:Toggle({
		Title = "Auto Clear Dungeon",
		Value = State.autoClearDungeon or false,
		Flag = "AutoClearDungeon",
		Callback = function(v)
			State.autoClearDungeon = v
			if v then
				AutoClearDungeon()
			end
		end,
	})

	local Pack = Window:Section({
		Title = "Farm",
		Icon = "lucide:slack",
		Opened = false,
	})

	local Storyline = Pack:Tab({
		Title = "Storyline",
		Icon = "lucide:swords", -- optional
	})
	State.storylineRetry = State.storylineRetry or 3

	Storyline:Input({
		Title = "Storyline Retry",
		Desc = "Default: 3",
		Value = "3",
		Type = "Input",
		Placeholder = "Enter storyline retry",
		Flag = "StorylineRetry",
		Callback = function(text)
			local n = tonumber(text)
			if not n or n <= 0 then
				Utils.notify("Error", "Please enter a valid number of retries (>=1)", 2)
				return
			end
			State.storylineRetry = math.floor(n)
			Utils.notify("Story Boss", "Max Retry set to " .. tostring(State.storylineRetry))
		end,
	})

	local StorylineSection = Storyline:Section({
		Title = "Storyline Config",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = false,
	})

	for i, mapKey in ipairs(StorylineData.Maps) do
		StorylineSection:Toggle({
			Title = mapKey,
			Value = State.storylineSelectedMaps[mapKey],
			Flag = "StorylineEnable_" .. mapKey,
			Callback = function(v)
				State.storylineSelectedMaps[mapKey] = v
			end,
		})
		StorylineSection:Dropdown({
			Title = "Mode (" .. mapKey .. ")",
			Values = StorylineData.ModeOptions,
			Value = State.storylineSelectedMode[mapKey],
			Multi = true,
			AllowNone = true,
			Flag = "StorylineMode_" .. mapKey,
			Callback = function(option)
				State.storylineSelectedMode[mapKey] = option
				print(table.concat(option, ", "))
			end,
		})
		StorylineSection:Dropdown({
			Title = "Team (" .. mapKey .. ")",
			Values = StorylineData.TeamOptions,
			Value = State.storylineTeams[mapKey] or "slot_1",
			Flag = "StorylineTeam_" .. mapKey,
			SearchBarEnabled = true,
			Callback = function(option)
				State.storylineTeams[mapKey] = option
			end,
		})
		if i < #StorylineData.Maps then
			StorylineSection:Space()
		end
	end

	Storyline:Section({
		Title = "Storyline Toggle",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})

	Storyline:Toggle({
		Title = "Enable Storyline Auto",
		Value = State.storylineEnabled or false,
		Flag = "EnableStorylineAuto",
		Callback = function(v)
			State.storylineEnabled = v
			if v then
				StorylineController.runAuto()
			else
				StorylineController.stop()
			end
		end,
	})
	local StoryBoss = Pack:Tab({
		Title = "Story Boss",
		Icon = "lucide:sword", -- optional
	})

	StoryBoss:Input({
		Title = "Story Boss Retry",
		Desc = "Default: 3",
		Value = "3",
		Type = "Input",
		Placeholder = "Enter story boss retry",
		Flag = "StoryBossRetry",
		Callback = function(text)
			local n = tonumber(text)
			if not n or n <= 0 then
				Utils.notify("Error", "Please enter a valid number of retries (>=1)", 2)
				return
			end
			State.bossRetry = math.floor(n)
			Utils.notify("Storyline", "Max Retry set to " .. tostring(State.bossRetry))
		end,
	})
	local function prettyName(str)
		return str
			:gsub("_", " ")
			:gsub("^%l", string.upper)
			:gsub(" %l", string.upper)
	end

	local StoryBossSection = StoryBoss:Section({
		Title = "Story Boss Setting",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = false,
	})

	for _, b in ipairs(BossData.List) do
		local key = b.key
		local label = prettyName(key)

		-- TOGGLE BOSS
		StoryBossSection:Toggle({
			Title = label,
			Value = false,
			Flag = "Boss_" .. key,
			Callback = function(state)
				State.selectedBosses[key] = state
				Utils.notify(
					"Boss Select",
					(state and "✔ " or "✖ ") .. label,
					2
				)
			end,
		})

		-- CHỌN ĐỘ KHÓ
		StoryBossSection:Dropdown({
			Title = label .. " | Difficulties",
			Values = b.modes,
			Value = State.bossSelectedModes[key] or {},
			Multi = true,
			AllowNone = true,
			Flag = "BossModes_" .. key,
			Callback = function(options)
				State.bossSelectedModes[key] = options
			end,
		})

		-- CHỌN TEAM
		StoryBossSection:Dropdown({
			Title = label .. " | Choose Team",
			Values = BossData.TeamOptions,
			Value = State.bossTeams[key],
			Flag = "Team_" .. key,
			SearchBarEnabled = true,
			Callback = function(option)
				State.bossTeams[key] = option
			end,
		})
		StoryBossSection:Space()
	end
	StoryBoss:Section({
		Title = "Story Boss Toggle",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})
	StoryBoss:Toggle({
		Title = "Fight Selected Story Boss",
		Value = false,
		Flag = "AutoFightStoryBoss",
		Callback = function(state)
			State.autoEnabledBoss = state
			if state then
				BossController.runAuto()
			else
				BossController.stopAuto()
			end	
		end,
	})

	local BattleTower = Pack:Tab({
		Title = "Battle Tower",
		Icon = "lucide:castle",
	})

	BattleTower:Input({
		Title = "Battle Tower Retry",
		Desc = "Default: 3",
		Value = "3",
		Type = "Input",
		Placeholder = "Enter battle tower retry",
		Flag = "BattleTowerRetry",
		Callback = function(text)
			local n = tonumber(text)
			if not n or n <= 0 then
				Utils.notify("Error", "Please enter a valid number of retries (>=1)", 2)
				return
			end
			State.BtRetry = math.floor(n)
			Utils.notify("Battle Tower", "Max Retry set to " .. tostring(State.BtRetry))
		end,
	})

	local BattleTowerSection = BattleTower:Section({
		Title = "Battle Tower Setting",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = false,
	})

	BattleTowerSection:Paragraph({
		Title = "Tip: ",
		Desc = "You can select waves for every mode  in the **Bulk Wave Select Input** ",
		Image = "rbxassetid://114289527320220",
		ImageSize = 30,
		Thumbnail = "",
		ThumbnailSize = 80,
		Locked = false,
	})
	local towerWaveDropdowns = {}
	for i, mode in ipairs(TowerData.Modes) do
		local label = TowerData.ModeNames[mode] or mode

		-- Toggle chọn mode để auto đánh
		BattleTowerSection:Toggle({
			Title = label,
			Value = false,
			Flag = "TowerMode_" .. mode,
			Callback = function(state)
				State.selectedTowerModes[mode] = state
				Utils.notify("Battle Tower", (state and "✔ " or "✖ ") .. label .. " selected", 2)
			end,
		})

		local dd = BattleTowerSection:Input({
			Title = label .. " | Select Waves",
			Placeholder = "e.g, 1,2,3 or all",
			Type = "Input",
			Flag = "TowerWaves_" .. mode,
			Callback = function(text)
				text = text:lower():gsub("%s+", "") -- xoá khoảng trắng, lowercase
				local waves = {}
				if text == "all" then
					-- 🟩 Nếu nhập "all", lấy toàn bộ waves từ dữ liệu
					for _, w in ipairs(TowerData.Waves[mode]) do
						table.insert(waves, tonumber(w))
					end
					Utils.notify("Tower", label .. " set to ALL waves (" .. #waves .. " total)", 2)
				else
					for w in string.gmatch(text, "%d+") do
						table.insert(waves, tonumber(w))
					end
					if #waves == 0 then
						Utils.notify(
							"⚠ Invalid Input",
							"Please enter numbers separated by commas (e.g., 1,2,3) or 'all'",
							3
						)
						return
					end
					Utils.notify("Tower", label .. " waves set: " .. table.concat(waves, ", "), 2)
				end
				State.towerSelectedWaves[mode] = waves
			end,
		})
		towerWaveDropdowns[mode] = dd
		BattleTowerSection:Dropdown({
			Title = label .. " | Team Slot",
			Values = TowerData.TeamOptions,
			Value = State.towerTeams[mode],
			Flag = "TowerTeam_" .. mode,
			SearchBarEnabled = true,
			Callback = function(option)
				State.towerTeams[mode] = option
				Utils.notify("Team Changed", label .. " → " .. option, 2)
			end,
		})
	end

	local BulkSelect = BattleTower:Section({
		Title = "Bulk Select Waves for all battle tower modes",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})
	BulkSelect:Input({
		Title = "Select waves for all battle towers",
		Placeholder = "e.g., 1,2,3",
		Type = "Input",
		Callback = function(text)
			text = text:lower():gsub("%s+", "")
			local waves = {}
			if text == "all" then
				-- 🟩 Nếu nhập "all", chọn tất cả waves cho từng mode
				for mode, dd in pairs(towerWaveDropdowns) do
					dd:Set("all")
				end
				Utils.notify("✅ Bulk Select", "Applied ALL waves to all tower modes", 3)
				return
			end
			for w in string.gmatch(text, "%d+") do
				table.insert(waves, w)
			end
			if #waves == 0 then
				Utils.notify("⚠ Invalid Input", "Please enter numbers separated by commas (e.g., 1,2,3)", 3)
				return
			end
			for mode, dd in pairs(towerWaveDropdowns) do
				dd:Set(table.concat(waves, ","))
			end
		end,
	})

	local BattleTowerToggle = BattleTower:Section({
		Title = "Battle Tower Fight Toggle",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})

	BattleTowerToggle:Toggle({
		Title = "Auto Fight Tower",
		Value = false,
		Flag = "AutoTower",
		Callback = function(state)
			State.autoEnabledTower = state
			if state then
				TowerController.runAuto()
			else
				TowerController.stopAuto()
			end
		end,
	})
	local InfiniteTower = Pack:Tab({
		Title = "Infinite Tower",
		Icon = "lucide:circle-arrow-up",
	})
	local InfiniteSetting = InfiniteTower:Section({
		Title = "Infinite Tower Setting",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})
	local modeOptions = {}
	for _, key in ipairs(InfiniteData.Modes) do
		table.insert(modeOptions, InfiniteData.ModeNames[key] or key)
	end

	InfiniteSetting:Dropdown({
		Title = "Infinite Team",
		Values = InfiniteData.TeamOptions,
		Value = State.InfinitieTeam or "slot_1",
		SearchBarEnabled = true,
		Flag = "InfiniteTeamDropdown",
		Callback = function(selected)
			State.InfinitieTeam = selected
			Utils.notify("INF TOWER", " Set Inf Team: " .. selected, 2)
		end,
	})
	InfiniteSetting:Dropdown({
		Title = "Infinite Mode",
		Values = modeOptions,
		Value = InfiniteData.ModeNames[State.selectedInfMode],
		Flag = "InfiniteModeDropdown",
		Callback = function(selected)
			for k, v in pairs(InfiniteData.ModeNames) do
				if v == selected then
					State.selectedInfMode = k
					break
				end
			end
			Utils.notify("Inf Tower", "Mode selected: " .. InfiniteData.ModeNames[State.selectedInfMode], 2)
		end,
	})
	InfiniteSetting:Input({
        	Title = "Select Floor CheckPoint",
		Desc = "Select if you want to check point key ",
		Value = State.floorCheckPoint,
		Placeholder = "Enter floor ( 50,100,150,...)",
		Type = "Input",
		Flag = "FloorCheckPoint",
		Callback = function(text)
			State.floorCheckPoint = text
		end,
	})
	InfiniteSetting:Toggle({
		Title = "Auto Use Check Point Key",
		Value = State.autoCheckPoint,
		Flag = "AutoCheckPoint",
		Callback = function(state)
			State.autoCheckPoint = state
		end,
	})
	local InfiniteSwap = InfiniteTower:Section({
		Title = "Infinite Tower Swap Team Setting",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})
	InfiniteSwap:Input({
		Title = "Select Swap Floor ",
		Desc = "Infinite Tower swap team at selected floor ",
		Value = "100",
		Placeholder = "Enter floor....",
		Type = "Input",
		Flag = "FloorToSwap",
		Callback = function(text)
			local floor = tonumber(text)
			State.floorSwap = floor
		end,
	})
	InfiniteSwap:Dropdown({
		Title = "Choose team to swap",
		Values = InfiniteData.TeamOptions,
		Value = State.teamSwap or "slot_1",
		SearchBarEnabled = true,
		Flag = "InfTeamSwap",
		Callback = function(option)
			State.teamSwap = option
			Utils.notify("Inf Tower", "Swap to " .. option .. " at " .. tostring(State.floorSwap) .. " Floor", 2)
		end,
	})
	InfiniteSwap:Toggle({
		Title = "Enable auto swap team",
		Value = false,
		Flag = "AutoSwapTeamInf",
		Callback = function(state)
			State.enabledSwapTeam = state
			Utils.notify("Inifnite Auto Swap Team", "Set to " .. State.enabledSwapTeam, 3)
		end,
	})
	local InfiniteReset = InfiniteTower:Section({
		Title = "Infinite Tower Reset Setting",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})
	InfiniteReset:Input({
		Title = "Select Reset Floor ",
		Desc = "Infinite Tower reset at selected floor ",
		Value = "100",
		Placeholder = "Enter floor....",
		Type = "Input",
		Flag = "FloorToReset",
		Callback = function(text)
			local floor = tonumber(text)
			State.floorRestart = floor
		end,
	})
	InfiniteReset:Toggle({
		Title = "Enable auto reset inf",
		Value = false,
		Flag = "AutoResetInf",
		Callback = function(value)
			State.enabledResetInf = value
			Utils.notify("Infinite Auto Reset", "Set to " .. value, 2)
		end,
	})
	local InfiniteToggleSection = InfiniteTower:Section({
		Title = "Infinite Tower auto fight toggle",
		Box = false,
		TextTransparency = 0.05,
		TextXAlignment = "Left",
		TextSize = 15, -- Default Size
		Opened = true,
	})
	local infinitetowertoggle = InfiniteToggleSection:Toggle({
		Title = "Start fighting Infinite Tower",
		Value = false,
		Flag = "enableAutoInfinite",
		Callback = function(value)
			State.autoEnabledInf = value
			if State.autoEnabledInf then
				print("Auto fight started for mode:", InfiniteData.ModeNames[State.selectedInfMode])
				InfTowerController.runAuto()
			else
				InfTowerController.stopAuto()
			end
		end,
	})

	-------------------------------------------------
	--  Global Boss Tab
	-------------------------------------------------
	local globalBossTab = Pack:Tab({
		Title = "Global Boss",
		Icon = "lucide:ghost",
	})
	local gradeOrder = { 4, 3, 2, 1, "special" }

	local cursedSection = globalBossTab:Section({
		Title = "Cursed Zone Settings",
		Box = false,
		Opened = true,
	})
	for _, grade in ipairs(gradeOrder) do
		local name = (grade == "special") and "Special" or ("Grade " .. grade)
		cursedSection:Toggle({
			Title = "Enable " .. name,
			Value = State.cursedGradeEnabled[grade],
			Flag = "EnableGrade_" .. tostring(grade),
			Callback = function(value)
				State.cursedGradeEnabled[grade] = value
				local icon = (grade == "special" and "🩸") or "💀"
				Utils.notify("Cursed", icon .. " " .. name .. " zones are now " .. (value and "enabled" or "disabled"), 2)
			end,
		})
	end

	for _, grade in ipairs(gradeOrder) do
		local name = (grade == "special") and "Special (Blood Aura)" or ("Grade " .. grade)
		cursedSection:Dropdown({
			Title = name .. " | Team Slot",
			Values = CursedZoneData.TeamOptions,
			Value = State.cursedTeams[tostring(grade)] or "slot_1",
			Flag = "TeamGrade_" .. tostring(grade),
			Callback = function(option)
				State.cursedTeams[tostring(grade)] = option
				local icon = (grade == "special" and "🩸") or "💀"
				Utils.notify("Cursed", icon .. " Set " .. name .. " team → " .. option, 2)
			end,
		})
	end
	cursedSection:Toggle({
		Title = "Enable Auto Fight Cursed Zones",
		Value = State.autoEnabledCursed or false,
		Flag = "AutoCursedZone",
		Callback = function(value)
			State.autoEnabledCursed = value
			if value then
				Utils.notify("Cursed", "💀 Auto Cursed Zone Enabled", 2)
				CursedController.runAuto()
			else
				Utils.notify("Cursed", "🛑 Auto Cursed Zone Disabled", 2)
				CursedController.stopAuto()
			end
		end,
	})

	local bossSection = globalBossTab:Section({
		Title = "Global Boss Settings",
		Box = false,
		Opened = true,
	})

	bossSection:Dropdown({
		Title = "Team (Boss HP < 75M)",
		Values = GlobalBossData.TeamOptions,
		Value = State.globalBossTeamLowHP or "slot_1",
		Flag = "GbLowHpTeam",
		Callback = function(option)
			local selected = option or "slot_1"
			State.globalBossTeamLowHP = tostring(selected)
			Utils.notify("Global Boss", "Set Low HP Team: " .. selected, 2)
		end,
	})

	bossSection:Dropdown({
		Title = "Team (Boss HP ≥ 75M)",
		Values = GlobalBossData.TeamOptions,
		Value = State.globalBossTeamHighHP or "slot_1",
		Flag = "GbHighHpTeam",
		Callback = function(option)
			local selected = option or "slot_1"
			State.globalBossTeamHighHP = tostring(selected)
			Utils.notify("Global Boss", "Set High HP Team: " .. selected, 2)
		end,
	})
	local globalbosstoggle = bossSection:Toggle({
		Title = "Enable Auto Global Boss",
		Value = State.autoEnabledGb or false,
		Flag = "AutoGlobalBoss",
		Callback = function(value)
			State.autoEnabledGb = value
			if value then
				Utils.notify("Global Boss", "⚔️ Auto Global Boss Enabled", 2)
				GlobalBossController.runAuto()
			else
				Utils.notify("Global Boss", "🛑 Auto Global Boss Disabled", 2)
				GlobalBossController.stopAuto()
			end
		end,
	})
	-------------------------------------------------
	-- ⚙️ Hybrid Mode Tab
	-------------------------------------------------
	local combineTab = Pack:Tab({
		Title = "Hybrid Mode",
		Icon = "lucide:combine",
	})

	local cdSection = combineTab:Section({
		Title = "Cooldown Display",
		Box = false,
		Opened = true,
	})

	local CooldownParagraph = cdSection:Paragraph({
		Title = "Cooldown: ",
		Desc = "",
		Image = "lucide:clock",
		ImageSize = 26,
		Locked = false,
	})

	task.spawn(function()
		while true do
			CooldownParagraph:SetDesc(
				"Story Boss: " .. Utils.cooldownText("StoryBoss") .. "\nBattle Tower: " .. Utils.cooldownText("BattleTower")
			)
			task.wait(1)
		end
	end)

	local inputSection = combineTab:Section({
		Title = "Set Cooldown Timers",
		Box = false,
		Opened = true,
	})

	inputSection:Paragraph({
		Title = "🕒 Cooldown Format Help",
		Desc = [[
			Enter time like `xh ym zs`

			Examples:
			- 6h → 6 hours
			- 30m → 30 minutes
			- 45s → 45 seconds
			- 1h20m30s → 1 hour 20 minutes 30s
			- 0 → reset instantly
			]],
		Locked = false,
	})
	inputSection:Input({
		Title = "Set Battle Tower Cooldown",
		Placeholder = "e.g. 1h30m15s or 0",
		Callback = function(text)
			if not text or text == "" then
				return -- bỏ qua nếu chưa nhập gì
			end
			local seconds = Utils.parseTimeInput(text)
			if seconds >= 0 then
				Utils.setCooldown("BattleTower", seconds)
				if seconds == 0 then
					Utils.notify("Cooldown", " Battle Tower cooldown reset to 0", 2)
				else
					Utils.notify("Cooldown", " Battle Tower cooldown set to " .. text, 2)
				end
			else
				Utils.notify("Error", "Invalid input! Example: 1h30m5s or 0", 2)
			end
		end,
	})
	inputSection:Input({
		Title = "Set Story Boss Cooldown",
		Placeholder = "e.g. 1h30m15s or 0",
		Callback = function(text)
			if not text or text == "" then
				return -- bỏ qua nếu chưa nhập gì
			end
			local seconds = Utils.parseTimeInput(text)
			if seconds >= 0 then
				Utils.setCooldown("StoryBoss", seconds)
				if seconds == 0 then
					Utils.notify("Cooldown", "Story Boss cooldown reset to 0", 2)
				else
					Utils.notify("Cooldown", "Story Boss cooldown set to " .. text, 2)
				end
			else
				Utils.notify("Error", "Invalid input! Example: 1h30m5s or 0", 2)
			end
		end,
	})

	local modeSection = combineTab:Section({
		Title = "Combine Mode Settings",
		Box = false,
		Opened = true,
	})

	modeSection:Paragraph({
		Title = "Select mode to hybrid",
	})

	for _, mode in ipairs({ "BattleTower", "StoryBoss", "GlobalBoss", "InfTower" }) do
		modeSection:Toggle({
			Title = "Enable " .. mode,
			Value = State.combinePriority[mode],
			Flag = "Combine" .. mode,
			Callback = function(value)
				State.combinePriority[mode] = value
				CombineModeController.setPriority(mode, value)
				Utils.notify("Hybrid Mode", mode .. " priority " .. (value and "enabled" or "disabled"), 2)
			end,
		})
	end

	modeSection:Toggle({
		Title = "▶ Run Hybrid Mode",
		Value = State.autoEnabledCombine or false,
		Flag = "RunCombineMode",
		Callback = function(value)
			State.autoEnabledCombine = value
			if value then
				Utils.notify("Hybrid Mode", "⚙️ Hybrid Mode started.", 2)
				CombineModeController.run()
			else
				Utils.notify("Hybrid Mode", "🛑 Hybrid Mode stopped.", 2)
				CombineModeController.stop()
			end
		end,
	})
	-------------------------------------------------
	-- 🗺️ Exploration Tab (WindUI version)
	-------------------------------------------------
	local explorationTab = Pack:Tab({
		Title = "Exploration",
		Icon = "lucide:ship",
	})

	local cardSection = explorationTab:Section({
		Title = "Exploration Card Input",
		Box = false,
		Opened = true,
	})

	cardSection:Paragraph({
		Title = "",
		Desc = [[
			Valid Card Name Examples:
			- Green Bomber:Secret
			- green_bomber:secret
			]],
		Image = "rbxassetid://114289527320220",
		ImageSize = 30,
		Locked = false,
	})
	local explorationInputs = {}
	-- Duyệt qua các mode
	for i, mode in ipairs(ExplorationData.Modes) do
		local modeTitle = "Mode: " .. mode:sub(1, 1):upper() .. mode:sub(2)

		local modeSection = explorationTab:Section({
			Title = modeTitle,
			Box = false,
			Opened = true,
		})

		-- Nếu chưa có bảng cho mode thì tạo
		State.explorationCards[mode] = State.explorationCards[mode] or { "", "", "", "" }
		explorationInputs[mode] = explorationInputs[mode] or {}
		for i = 1, 4 do
			local input = modeSection:Input({
				Title = string.format("Card %d for %s mode", i, mode),
				Placeholder = "Green Bomber:Secret",
				Value = State.explorationCards[mode][i] or "",
				Flag = string.format("Card%d_%s", i, mode),
				Callback = function(text)
					State.explorationCards[mode] = State.explorationCards[mode] or { "", "", "", "" }
					State.explorationCards[mode][i] = Utils.normalizeCardName(text)
					Utils.notify("Exploration", string.format("%s - Card %d saved!", mode, i), 1.5)
				end,
			})
			explorationInputs[mode][i] = input
		end
	end
	local cardconfig = explorationTab:Section({
		Title = " Import and Export Cards Config",
		Box = false,
		Opened = true,
	})
	cardconfig:Button({
		Title = "📋 Copy Current Cards(Export)",
		Icon = "lucide:copy",
		Callback = function()
			local allCards = {}

			for _, mode in ipairs(ExplorationData.Modes) do
				local cards = State.explorationCards[mode] or {}
				local formatted = string.format("%s: %s", mode, table.concat(cards, ", "))
				table.insert(allCards, formatted)
			end

			-- Gộp toàn bộ mode vào một chuỗi
			local output = table.concat(allCards, "\n")

			-- Copy vào clipboard (tuỳ executor)
			if setclipboard then
				setclipboard(output)
				Utils.notify("Exploration", "✅ Copied all exploration cards to clipboard!", 2)
			else
				warn("[Clipboard] Your executor does not support setclipboard()")
				Utils.notify("Error", "Clipboard not supported in this executor.", 3)
			end
		end,
	})

	cardconfig:Input({
		Title = "📥 Import Cards (Paste text here)",
		Placeholder = "Paste your card config here...",
		Type = "Input",
		Callback = function(text)
			if not text or text == "" then
				Utils.notify("Exploration", "⚠ Please paste card data!", 2)
				return
			end

			-- Ví dụ input hợp lệ:
			-- easy: Green Bomber:Secret, Red Magician:Rare
			-- hard: Blue Killer:Secret, Red Ninja:Secret
			for line in text:gmatch("[^\r\n]+") do
				local mode, cards = line:match("(%w+)%s*:%s*(.+)")
				if mode and cards and State.explorationCards[mode] then
					local list = {}
					for card in cards:gmatch("[^,]+") do
						table.insert(list, Utils.normalizeCardName(card))
					end

					-- Gán lại giá trị và cập nhật UI
					for i = 1, 4 do
						local val = list[i] or ""
						State.explorationCards[mode][i] = val
						if explorationInputs[mode] and explorationInputs[mode][i] then
							explorationInputs[mode][i]:Set(val)
						end
					end

					Utils.notify("Exploration", string.format("✅ Imported cards for %s mode", mode), 2)
				end
			end
		end,
	})

	local autoSection = explorationTab:Section({
		Title = "⚙️ Auto Exploration",
		Box = false,
		Opened = true,
	})

	autoSection:Toggle({
		Title = "Enable Auto Exploration",
		Value = State.autoEnabledExploration or false,
		Flag = "AutoExplorationToggle",
		Callback = function(state)
			State.autoEnabledExploration = state
			if state then
				ExplorationController.runAuto()
				Utils.notify("Exploration", "🗺️ Auto Exploration Enabled", 2)
			else
				ExplorationController.stopAuto()
				Utils.notify("Exploration", "🛑 Auto Exploration Disabled", 2)
			end
		end,
	})

	local Quest = Pack:Tab({
		Title = "Quest",
		Icon = "lucide:scroll-text",
	})

	Quest:Toggle({
		Title = "Auto Claim Daily Quests",
		Value = State.claimDailyQuest or false,
		Flag = "ClaimDailyQuestsToggle",
		Callback = function(value)
			State.claimDailyQuest = value
			if value then
				startAutoClaim()
			else
				stopAutoClaim()
			end
		end,
	})


	local RaidTab = Pack:Tab({
		Title = "Raid",
		Icon = "lucide:shield",
	})
	local minionSection = RaidTab:Section({
		Title = "Raid Minion",
		Box = false,
		Opened = true,
	})
	minionSection:Toggle({
		Title = " Auto Raid Minion (Infernal + Infernal Demon)",
		Value = State.autoEnabledMinion or false,
		Flag = "AutoRaidMinionToggle",
		Callback = function(value)
			State.autoEnabledMinion = value
			if value then
				RaidMinionController.runAuto()
			else
				RaidMinionController.stopAuto()
			end
		end,
	})
	local raidSection = RaidTab:Section({
		Title = "Raid Boss",
		Box = false,
		Opened = true,
	})
	raidSection:Dropdown({
		Title = "🎯 Select Raid Boss",
		Values = { "Monster 9", "Cifer", "Creator of Flames", "Sword Deity", "Shadow Dragon", "Eternal Dragon" },
		Value = State.selectedRaidBoss or "Monster 9",
		Flag = "SelectRaidBossDropdown",
		Callback = function(option)
			local selectedName = tostring(option)
			State.selectedRaidBoss = selectedName
			Utils.notify("Raid Boss", "✅ Selected: " .. selectedName, 2)
		end,
	})

	raidSection:Dropdown({
		Title = "🎯 Select Raid Boss Mode",
		Values = { "normal", "medium", "hard", "extreme" },
		Value = State.selectedRaidMode or "easy",
		Flag = "SelectRaidModeDropdown",
		Callback = function(option)
			local selectedName = tostring(option)
			State.selectedRaidMode = selectedName
			Utils.notify("Raid Mode", "✅ Selected: " .. selectedName, 2)
		end,
	})
	raidSection:Toggle({
		Title = "🔥 Auto Raid Boss",
		Value = State.autoEnabledRaid or false,
		Flag = "AutoRaidBossToggle",
		Callback = function(value)
			State.autoEnabledRaid = value
			if value then
				RaidBossController.runAuto()
			else
				RaidBossController.stopAuto()
			end
		end,
	})
	local raidShop = RaidTab:Section({
		Title = " Raid Shop",
		Box = false,
		Opened = true,
	})
	local values = {}
	local DisplayToKey = {}

	for key, item in pairs(RaidItem) do
		local display = item.display_name
		table.insert(values, display)
		DisplayToKey[display] = key
	end
	raidShop:Dropdown({
		Title = "Select Item To Auto Buy",
		Values = values,
		Multi = true,
		Flag = "RaidDailyItem",
		Callback = function(option)
			State.selectedRaidItem = {}
			for _, display in ipairs(option) do
				local key = DisplayToKey[display]
				table.insert(State.selectedRaidItem, key)
			end
		end,
	})
	raidShop:Toggle({
		Title = "Auto Buy Raid Item",
		Value = State.autoItemRaid or false,
		Flag = "AutoRaidItemDailyToggle",
		Callback = function(value)
			State.autoItemRaid = value
			if value == true then
				autoraiditem()
			end
		end,
	})

	-------------------------------------------------
	-- 👑 Ranked Tab (WindUI)
	-------------------------------------------------
	local RankedTab = Pack:Tab({
		Title = "Ranked",
		Icon = "lucide:crown",
	})

	local ranked = RankedTab:Section({
		Title = "Auto Ranked",
		Box = false,
		Opened = true,
	})

	-- 🎮 Select Ranked Mode
	ranked:Dropdown({
		Title = "Select Mode Rank",
		Values = { "scaled", "any" },
		Value = State.modeRanked or "scaled",
		Flag = "ranked_mode",
		Callback = function(option)
			State.modeRanked = option
			Utils.notify("Ranked", "Select mode: " .. option, 2)
		end,
	})

	-- 👁️ Show Rank Battle Toggle
	ranked:Toggle({
		Title = "Show Rank Battle",
		Value = State.showRanked or false,
		Flag = "showranktoggle",
		Callback = function(value)
			State.showRanked = value
		end,
	})

	-- ⚔️ Auto Ranked Mode Toggle
	ranked:Toggle({
		Title = "Auto Selected Ranked",
		Value = State.autoRanked or false,
		Flag = "autoRanked",
		Callback = function(value)
			State.autoRanked = value
			if value then
				Ranked.runAuto()
			else
				Ranked.stopAuto()
			end
		end,
	})

	local rankedshop = RankedTab:Section({
		Title = "Ranked Shop",
		Box = false,
		Opened = true,
	})
	local rankitems = {}
	local name_to_id = {}

	for id, item in pairs(RankItem) do
		local display = item.display_name
		table.insert(rankitems, display)
		name_to_id[display] = id
	end
	rankedshop:Dropdown({
		Title = "Select Item To Auto Buy",
		Values = rankitems,
		Multi = true,
		Flag = "SelectedRankedItem",
		Callback = function(option)
			State.selectedRankItem = {}
			for _, display in ipairs(option) do
				local id = name_to_id[display]
					table.insert(State.selectedRankItem, id)
			end

		end,
	})
	rankedshop:Toggle({
		Title = "Auto Buy Rank Item",
		Value = State.autoItemRank or false,
		Flag = "AutoRankedItem",
		Callback = function(value)
			State.autoItemRank = value
			if value == true then
				autorankitem()
			end
		end,
	})
	Window:Divider()
	local Player = Window:Section({
		Title = "Player",
		Icon = "user-round",
		Opened = false,
	})
	local TeleportTab = Player:Tab({
		Title = "Teleport",
		Icon = "lucide:map-pin",
	})

	-- 🗺️ Tạo button teleport cho từng địa điểm
	for name, cframe in pairs(locations) do
		TeleportTab:Button({
			Title = name,
			Icon = "lucide:navigation",
			Callback = function()
				Utils.teleport(cframe)
				Utils.notify("Teleport", "📍 Teleported to " .. name, 2)
			end,
		})
	end
	local UpgradeTab = Player:Tab({
		Title = "Stat",
		Icon = "lucide:route",
	})

	-- 📊 Select stat to upgrade
	UpgradeTab:Dropdown({
		Title = "Select Upgrade Stat",
		Values = UpgradeData.displayName,
		Value = State.selectedStat or UpgradeData.displayName[1],
		Flag = "selectedStatUpgrade",
		Callback = function(option)
			State.selectedStat = option
			print(State.selectedStat)
		end,
	})

	UpgradeTab:Toggle({
		Title = "Auto Upgrade Selected Stat",
		Value = State.autoUpgrade or false,
		Flag = "autoUpgrade",
		Callback = function(value)
			State.autoUpgrade = value
			autoUpgradePoint()
		end,
	})

	UpgradeTab:Button({
		Title = "Reset Upgrade Points",
		Icon = "lucide:rotate-ccw",
		Callback = function()
			local args = { "base" }
			ReplicatedStorage:WaitForChild("shared/network@eventDefinitions")
				:WaitForChild("resetUpgrades")
				:FireServer(unpack(args))
			Utils.notify("Upgrade", "🔄 Upgrade points reset!", 2)
		end,
	})

	UpgradeTab:Toggle({
		Title = "Auto Upgrade Prestige",
		Value = State.autoPrestige or false,
		Flag = "autoPrestige",
		Callback = function(value)
			State.autoPrestige = value
			if value then
				task.spawn(function()
					while State.autoPrestige do
						local args = { "prestige_luck", 1 }
						Net.upgradePoint:FireServer(unpack(args))
						task.wait(0.25)
					end
				end)
			end
		end,
	})
	-------------------------------------------------
	-- ⚔️ PVP Tab (WindUI)
	-------------------------------------------------
	local PVPtab = Player:Tab({
		Title = "PVP",
		Icon = "lucide:hand-fist",
	})

	-- 🧍 Dropdown chọn player để gửi battle
	local PlayerListDropdown = PVPtab:Dropdown({
		Title = "Select Player to Battle",
		Values = State.PlayerList or {},
		Value = State.selectedPlayer or "",
		Flag = "SelectPVPPlayer",
		Callback = function(option)
			if option and option ~= "" then
				State.selectedPlayer = option
			else
				State.selectedPlayer = nil
			end
		end,
	})

	PVPtab:Button({
		Title = "Refresh Player List",
		Icon = "lucide:refresh-cw",
		Callback = function()
			local playerNames = {}
			for _, player in ipairs(Players:GetPlayers()) do
				table.insert(playerNames, player.Name)
			end

			State.PlayerList = playerNames
			PlayerListDropdown:Refresh(State.PlayerList)
			PlayerListDropdown:Set(LocalPlayer.Name) -- clear selection
			Utils.notify("PVP", "🔁 Player list refreshed!", 2)
		end,
	})
	local function startFightPlayer()
		if not State.autofightplayer then
			return
		end

		while State.autofightplayer do
			local name = State.selectedPlayer
			if name and name ~= "" then
				local target = Players:FindFirstChild(name)
				if target then
					Net.fightPlayer:FireServer(target)
				else
					warn("⚠️ Player không tồn tại hoặc chưa online!")
				end
			else
				warn("⚠️ Chưa chọn player để fight!")
			end

			-- đợi popup match loading
			local popupWait = 0
			while not Utils.isInBattlePopupPresent() and popupWait < 2 do
				if not State.autofightplayer then
					return
				end
				task.wait(0.5)
				popupWait += 0.5
			end

			while Utils.isInBattlePopupPresent() do
				if not State.autofightplayer then
					return
				end
				task.wait(0.5)
			end

			task.wait(1)
		end
	end

	PVPtab:Toggle({
		Title = "Auto Fight Selected Player",
		Value = State.autofightplayer or false,
		Flag = "AutoFightPVP",
		Callback = function(value)
			State.autofightplayer = value
			if value then
				startFightPlayer()
				Utils.notify("PVP", "⚔️ Auto fight started!", 2)
			else
				Utils.notify("PVP", "🛑 Auto fight stopped!", 2)
			end
		end,
	})
	local ItemTab = Player:Tab({
		Title = "Item",
		Icon = "lucide:flask-round",
	})
	local levelSection = ItemTab:Section({
		Title = "📖XP Book ",
		Box = true,
		Opened = true,
	})
	levelSection:Input({
		Title = "Select Card",
		Desc = "Enter Card Name",
		Type = "Input",
		Placeholder = "Ex: Mother of Creation",
		Flag = "levelCard",
		Callback = function(input)
			State.levelcard = Utils.normalize(input)
		end,
	})
	levelSection:Dropdown({
		Title = "Select level books",
		Values = LevelData.Book,
		Value = State.selectBook or { "common_book" },
		Multi = true,
		AllowNone = true,
		Flag = "selectedBooks",
		Callback = function(option)
			State.selectBook = option
		end,
	})
	levelSection:Toggle({
		Title = "Auto Use Books",
		Desc = "Use all selected book(amount 1) to select card every 0.1s",
		Value = State.autoBook,
		Flag = "autoBookItems",
		Callback = function(value)
			State.autoBook = value
			if value then
				autobookitem()
			end
		end,
	})
	local MoonSection = ItemTab:Section({
		Title = "🌙 Moon Cycle Potions",
		Box = true,
		Opened = true,
	})

	MoonSection:Dropdown({
		Title = "Amount of Moon Cycle Potion",
		Values = { "1", "10", "50", "100", "1000" },
		Value = "1",
		Flag = "MoonPotionAmount",
		Callback = function(value)
			potions.amount = tonumber(value)
		end,
	})

	-- 🌕 Select moons to stop
	local MoonOptions = {}
	for _, moon in ipairs(MoonCycleData) do
		table.insert(MoonOptions, moon.DisplayName)
	end

	MoonSection:Dropdown({
		Title = "Select Moons to Stop",
		Values = MoonOptions,
		Value = State.selectedMoon or {},
		Multi = true,
		AllowNone = true,
		Flag = "MoonDropdown",
		Callback = function(options)
			State.selectedMoon = options
		end,
	})

	MoonSection:Toggle({
		Title = "Auto Moon Cycle Potion",
		Value = potions.autouse or false,
		Flag = "AutoMoonCycle",
		Callback = function(value)
			potions.autouse = value
			automooncycle()
		end,
	})

	local UtilitiesTab = Player:Tab({
		Title = "Utilities",
		Icon = "lucide:settings",
	})

	UtilitiesTab:Toggle({
		Title = "Auto Dismiss Reward Popup",
		Value = false,
		Flag = "AutoDismissToggle",
		Callback = function(value)
			if value then
				EnableDismissReward()
			else
				DisableDismisReward()
			end
		end,
	})
	UtilitiesTab:Toggle({
		Title = "Auto Pick Up Floor",
		Value = false,
		Flag = "AutoPickUpFloorToggle",
		Callback = function(value)
			if value then
				AutoPickUp()
			else
				StopAutoPickUp()
			end
		end,
	})

	UtilitiesTab:Toggle({
		Title = "Auto Ladder",
		Value = State.autoEnabledLadder or false,
		Flag = "AutoLadderToggle",
		Callback = function(value)
			State.autoEnabledLadder = value
			if value then
				teleportAndStart()
			else
				stopAuto()
			end
		end,
	})

	local activeAllLuckAndCardIndex = false

	local function activateLuckAndCardIndex()
		activeAllLuckAndCardIndex = true
		while activeAllLuckAndCardIndex do
			Net.activateAllLuckIndex:FireServer()
			task.wait(1)
			Net.activeCardIndex:FireServer()
			task.wait(60)
		end
	end

	UtilitiesTab:Toggle({
		Title = "Auto Activate All Luck and Card Index",
		Value = false,
		Flag = "AutoActiveLuckIndex",
		Callback = function(value)
			if value then
				activateLuckAndCardIndex()
			else
				activeAllLuckAndCardIndex = false
			end
		end,
	})

	UtilitiesTab:Button({
		Title = "Merge All Cards",
		Icon = "lucide:layers",
		Callback = function()
			Net.mergeCard:FireServer()
		end,
	})

	UtilitiesTab:Button({
		Title = "Redeem All Codes",
		Icon = "lucide:ticket",
		Callback = function()
			RedeemAllCodes()
		end,
	})
	Window:Divider()
	local Misc = Window:Section({
		Title = "Misc",
		Icon = "list-minus",
		Opened = false,
	})

	local WebhookTab = Misc:Tab({
		Title = "Webhook",
		Icon = "lucide:bell",
	})

	local WebhookSection = WebhookTab:Section({
		Title = "Webhook Config",
		Box = false,
		Opened = true,
	})

	WebhookSection:Input({
		Title = "Discord Webhook URL",
		Placeholder = "Enter Discord webhook URL",
		Value = State.discordWebhookURL or "",
		Flag = "WebhookURL",
		Callback = function(text)
			State.discordWebhookURL = text
			Utils.notify("Webhook", "✅ Webhook URL updated", 2)
		end,
	})

	WebhookSection:Button({
		Title = "Test Webhook",
		Icon = "lucide:send",
		Callback = function()
			local msgTable = {
				content = string.format(
					"✅ **Webhook test successful!**\nPlayer: `%s`\nGame: %s\nTime: %s",
					tostring(LocalPlayer and LocalPlayer.Name or "Unknown"),
					tostring(game.PlaceId),
					os.date("%Y-%m-%d %H:%M:%S")
				),
			}

			local payload = HttpService:JSONEncode(msgTable)
			print("[TestWebhook] Sending test message to Discord...")

			local ok, err = pcall(function()
				Utils.sendDiscordMessage(payload)
			end)

			if ok then
				Utils.notify("Webhook", "✅ Test message sent! Check your Discord.", 3)
			else
				Utils.notify("Webhook", "❌ Failed to send: " .. tostring(err), 3)
			end
		end,
	})

	WebhookSection:Toggle({
		Title = "Auto Send Webhook when finish Story Boss / Battle Tower",
		Value = State.sendWebhookBattle or false,
		Flag = "BattleWebhookToggle",
		Callback = function(value)
			State.sendWebhookBattle = value
		end,
	})

	WebhookSection:Toggle({
		Title = "Auto Send Webhook for Boss/BT cooldowns",
		Value = State.sendWebhookCd or false,
		Flag = "CdWebhookToggle",
		Callback = function(value)
			State.sendWebhookCd = value
		end,
	})

	WebhookSection:Toggle({
		Title = "Auto Send Webhook for Ranked Results",
		Value = State.sendWebhookResult or false,
		Flag = "ResultWebhookToggle",
		Callback = function(value)
			State.sendWebhookResult = value
		end,
	})
	local Rejoin = Misc:Tab({
		Title = "Auto Rejoin Settings",
		Icon = "gamepad-directional",
	})

	local times = {}
	for i = 10, 180, 10 do
		table.insert(times, i .. "m")
	end

	Rejoin:Dropdown({
		Title = "Rejoin Time",
		Values = times,
		Value = tostring(State.timeRejoin or "10m"),
		Flag = "RejoinTime",
		Callback = function(value)
			local minutes = tonumber(value:match("(%d+)"))
			if minutes then
				State.timeRejoin = minutes * 60
			end
		end,
	})

	Rejoin:Toggle({
		Title = "Enable Auto Rejoin",
		Value = State.enableRejoin or false,
		Flag = "EnableRejoin",
		Callback = function(value)
			State.enableRejoin = value
		end,
	})

	Rejoin:Button({
		Title = "Test Rejoin Now",
		Icon = "lucide:refresh-cw",
		Callback = function()
			pcall(tryReconnect)
		end,
	})

	Rejoin:Toggle({
		Title = "Auto Execute On Rejoin / Server Hop",
		Value = false,
		Flag = "AutoExecRejoin",
		Callback = function(value)
			if value then
				local ScriptURL =
					"https://raw.githubusercontent.com/aquapy1075-blip/animecardclashscript/refs/heads/main/animecardclash.lua"
				if syn and syn.queue_on_teleport then
					syn.queue_on_teleport(string.format([[loadstring(game:HttpGet("%s"))()]], ScriptURL))
				elseif queue_on_teleport then
					queue_on_teleport(string.format([[loadstring(game:HttpGet("%s"))()]], ScriptURL))
				end
			end
		end,
	})

	local PerformanceTab = Misc:Tab({
		Title = "Performance",
		Icon = "lucide:cpu",
	})

	PerformanceTab:Toggle({
		Title = "Boost FPS (V1)",
		Value = State.boostfpsv1 or false,
		Flag = "BoostFpsToggle",
		Callback = function(value)
			State.boostfpsv1 = value
			if value then
				_G.Settings = {
					Players = {
						["Ignore Me"] = true,
						["Ignore Others"] = true,
						["Ignore Tools"] = true,
					},
					Meshes = { Destroy = false, LowDetail = true },
					Images = { Invisible = true, LowDetail = false, Destroy = false },
					["No Particles"] = true,
					["No Camera Effects"] = true,
					["No Explosions"] = true,
					["No Clothes"] = true,
					["Low Water Graphics"] = true,
					["No Shadows"] = true,
					["Low Rendering"] = true,
					["Low Quality Parts"] = true,
				}
				loadstring(
					game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua")
				)()
			end
		end,
	})

	PerformanceTab:Toggle({
		Title = "Boost FPS (V2, Better but affects visuals)",
		Value = State.boostfpsv2 or false,
		Flag = "BoostFpsV2Toggle",
		Callback = function(value)
			State.boostfpsv2 = value
			if value then
				_G.Settings = {
					Players = {
						["Ignore Me"] = true,
						["Ignore Others"] = true,
						["Ignore Tools"] = true,
					},
					Meshes = { NoMesh = true, NoTexture = true, Destroy = false },
					Images = { Invisible = true, Destroy = false },
					Explosions = { Smaller = true, Invisible = false, Destroy = true },
					Particles = { Invisible = true, Destroy = false },
					TextLabels = { LowerQuality = false, Invisible = false, Destroy = false },
					MeshParts = {
						LowerQuality = true,
						Invisible = true,
						NoTexture = true,
						NoMesh = true,
						Destroy = false,
					},
					Other = {
						["No Particles"] = true,
						["FPS Cap"] = true,
						["No Camera Effects"] = true,
						["No Clothes"] = true,
						["Low Water Graphics"] = true,
						["No Shadows"] = true,
						["Low Rendering"] = true,
						["Low Quality Parts"] = true,
						["Low Quality Models"] = true,
						["Reset Materials"] = true,
						["Lower Quality MeshParts"] = true,
						ClearNilInstances = false,
					},
				}
				loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
			end
		end,
	})

	PerformanceTab:Toggle({
		Title = "FocusMode(Pc Only)",
		Value = false,
		Flag = "FocusMode",
		Callback = function(value)
			if value then
				EnableLowPower()
			else
				DisableLowPower()
			end
		end,
	})
	PerformanceTab:Toggle({
		Title = "Disable 3D Rendering (Reduce GPU Load)",
		Value = false,
		Flag = "DisableRenderToggle",
		Callback = function(value)
			RunService:Set3dRenderingEnabled(not value)
		end,
	})

	PerformanceTab:Button({
		Title = "Hide Username (Client)",
		Icon = "lucide:user-x",
		Callback = function()
			LocalPlayer.Name = "Aqua Hub"
		end,
	})

	myConfig:Load()
	task.spawn(function()
		while task.wait(15) do
			myConfig:Save()
		end
	end)
