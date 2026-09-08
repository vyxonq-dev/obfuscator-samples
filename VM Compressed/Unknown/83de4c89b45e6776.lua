--!nolint
--!nocheck

local luarmorApi = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
luarmorApi.script_id = "2550564d617e41ddac42bb044ba829dc"

if not isfolder("LeafHubV2") then
	makefolder("LeafHubV2")
end

getgenv().LEAFHUB_RAYFIELD = loadstring(
	game:HttpGet("https://raw.githubusercontent.com/SecondNewtonLaw/RandomScripts/refs/heads/dev/UIModded.lua")
)()

getgenv().LEAFHUB_WINDOW = getgenv().LEAFHUB_RAYFIELD:CreateWindow({
	Name = "Leaf Hub V2",
	Icon = "leaf",
	LoadingTitle = "Leaf Hub V2",
	LoadingSubtitle = "by Leaf Team",

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,

	ConfigurationSaving = {
		Enabled = true,
		FolderName = "LeafHubV2",
		FileName = "LeafHubV2" .. tostring(game.PlaceId),
	},

	Discord = {
		Enabled = true,
		Invite = "aVvENbeUq2",
		RememberJoins = true,
	},

	KeySystem = true,
	KeySettings = {
		Title = "Leaf Hub V2 | Key System",
		Subtitle = "A tree filled with keys is the best tree...",
		Note = "You can get a key in our Discord server!",
		FileName = "LeafHubV2/key.txt",
		SaveKey = true,
		GrabKeyFromSite = false,
		ValidateCallback = function(key)
			local status = luarmorApi.check_key(key)
			if status.code == "KEY_VALID" then
				script_key = key
			elseif status.code == "KEY_HWID_LOCKED" then
				game.Players.LocalPlayer:Kick("The key you are using does not belong to you.")
			else
				return false
			end
			return true
		end,
	},
})

while task.wait() and not script_key do
end

luarmorApi.load_script()
