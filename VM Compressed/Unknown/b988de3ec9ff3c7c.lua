if not game:IsLoaded() then
	game.Loaded:Wait()
end

repeat task.wait(0.1) until game.PlaceId ~= 0
repeat task.wait(0.1) until game:GetService("Players").LocalPlayer
repeat task.wait(0.1) until game:GetService("Workspace").CurrentCamera

local GAMES = {
	["3226555017"] = {
		name = "SCP: Site Roleplay",
		url = "https://api.jnkie.com/api/v1/luascripts/public/4fa86c6a73196bf8a2bb94234c069925d24fb2d6beeebb8683e6dd0c997c3c8a/download"
	},
	["12196278347"] = {
		name = "Refinery Caves 2",
		url = "https://api.jnkie.com/api/v1/luascripts/public/b58914084e6def7d6d6476aa75b1c028075cfe85156ae93a027d09f38a72c721/download"
	},
	["98626216952426"] = {
		name = "Naramo Nuclear Plant",
		url = "https://api.jnkie.com/api/v1/luascripts/public/86e7ce3479f8686809da4db8bc437a2e1800e4f83f223d0d091e3a9f06c41680/download"
	},
	["6172932937"] = {
		name = "Energy Assault",
		url = "https://api.jnkie.com/api/v1/luascripts/public/a2a45e4964bf767b1ad70f5f8ee2882fde0a548fe15110fc43c3969c7475fef0/download"
	},
	["863266079"] = {
		name = "Apocalypse Rising 2",
		url = "https://api.jnkie.com/api/v1/luascripts/public/6bed93c42a6aea7af5193c70d2e9d0abfeaf0db4114e7ecf2bb9d0d6d81d3d03/download"
	},
	["10077968348"] = {
		name = "Apocalypse Rising 2",
		url = "https://api.jnkie.com/api/v1/luascripts/public/6bed93c42a6aea7af5193c70d2e9d0abfeaf0db4114e7ecf2bb9d0d6d81d3d03/download"
	},
	["93911318070665"] = {
		name = "Apocalypse Rising 2",
		url = "https://api.jnkie.com/api/v1/luascripts/public/6bed93c42a6aea7af5193c70d2e9d0abfeaf0db4114e7ecf2bb9d0d6d81d3d03/download"
	},
	["105446216022659"] = {
		name = "Apocalypse Rising 2",
		url = "https://api.jnkie.com/api/v1/luascripts/public/6bed93c42a6aea7af5193c70d2e9d0abfeaf0db4114e7ecf2bb9d0d6d81d3d03/download"
	}
}

local AR2_UNIVERSE_ID = 358276974

local entry = GAMES[tostring(game.PlaceId)]

if not entry then
	pcall(function()
		if game.GameId == AR2_UNIVERSE_ID then
			entry = GAMES["863266079"]
		end
	end)
end

if not entry then
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Multy Hub",
			Text = "This game is not supported.",
			Duration = 5
		})
	end)
	return
end

pcall(function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "Multy Hub",
		Text = "Loading " .. entry.name .. "...",
		Duration = 3
	})
end)

task.wait(1)

loadstring(game:HttpGet(entry.url))()