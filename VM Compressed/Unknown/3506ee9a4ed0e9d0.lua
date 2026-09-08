local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Oblivion-Side ScriptHub",
   Icon = 135532970199139, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Oblivion-Side",
   LoadingSubtitle = "by bloxy",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "invitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Oblivion-Key System",
      Subtitle = "key system hehe",
      Note = "join discord.gg/teamc00lkidd", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"TeamC00lkidd"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "the script is loading",
   Content = "made by blox",
   Duration = 6.5,
   Image = 4483362458,
})

local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image
local FEScriptsTab = Window:CreateTab("FE Scripts", 4483362458) -- Title, Image
local HubsTab = Window:CreateTab("Hubs", 4483362458) -- Title, Image
local GamesTab = Window:CreateTab("Games", 4483362458) -- Title, Image
local FEScriptsSection = FEScriptsTab:CreateSection("FE Scripts found on the internet")
local PlayerSection = PlayerTab:CreateSection("Modify Your Character")
local GamesSection = GamesTab:CreateSection("stole scripts hehe")

local Button = FEScriptsTab:CreateButton({
   Name = "Lalol Hub Backdoor",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()
   end,
})

local Button = FEScriptsTab:CreateButton({
   Name = "Free Admin Hack Panel",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/aNxeh5wu",true))()
   end,
})

local Button = PlayerTab:CreateButton({
   Name = "INF Yield",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Slider = PlayerTab:CreateSlider({
   Name = "Speed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = PlayerTab:CreateSlider({
   Name = "JumpPower Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Height",
   CurrentValue = 16,
   Flag = "sliderjp", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Infinite Jump Toggle (KEYBOARD)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Button = FEScriptsTab:CreateButton({
   Name = "Egor/Wally WEST⚡️",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/loldo-g/RobloxEgorScript/refs/heads/main/script.lua"))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "Redz Hub (Might Be Down)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
   end,
})

local Button = FEScriptsTab:CreateButton({
   Name = "RC7",
   Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CoreGui/Scripts/main/RC7"))()
   end,
})

local Button = FEScriptsTab:CreateButton({
   Name = "FE Hub Script [Best]",
   Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/Script'))()
   end,
})

local Button = FEScriptsTab:CreateButton({
   Name = "FE Btools",
   Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/WaqDDa8v'))()
    end,
})

local Button = GamesTab:CreateButton({
   Name = "NPC Control",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty23.lua"))()
   end,
})

local Button = FEScriptsTab:CreateButton({
   Name = "FE Punch Tool",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CoolScripts1/Fling-Punch/refs/heads/main/Fling%20Punch"))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "99 Nights Hacks",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VWExtra/main/NightsInTheForest.lua", true))()
   end,
})

local Button = GamesTab:CreateButton({
   Name = "Steal A Brainrot (Risky & Dectectable)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ily123950/Vulkan/refs/heads/main/Trx"))()
   end,
})