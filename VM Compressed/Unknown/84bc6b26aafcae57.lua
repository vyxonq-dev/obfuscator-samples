local playerHRP = game.Players.LocalPlayer.Character.HumanoidRootPart
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Escape Experiment | Cheater's Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Cheater's Hub",
   LoadingSubtitle = "Have fun!",
   ShowText = "Show", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = 	true -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Cheater's Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Cheater's Hub Key System",
      Subtitle = "Complete the steps to unlock script access.",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})
local Stages = Window:CreateTab("Stages", 4483362458) -- Title, Image
local StageTeleports = Stages:CreateSection("Teleports")
local Stage1 = Stages:CreateButton({
   Name = "Teleport to Stage 1",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-39.5, -0.5, 39.5)
   -- The function that takes place when the button is pressed
   end,
})
local Stage2 = Stages:CreateButton({
   Name = "Teleport to Stage 2",
   Callback = function()
	playerHRP.CFrame = CFrame.new(85.5, 84.5, -85.5)
   -- The function that takes place when the button is pressed
   end,
})
local Stage3 = Stages:CreateButton({
   Name = "Teleport to Stage 3",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-39.5, 129.5, -35.5)
   -- The function that takes place when the button is pressed
   end,
})
local Stage4 = Stages:CreateButton({
   Name = "Teleport to Stage 4",
   Callback = function()
	playerHRP.CFrame = CFrame.new(80.5, 124.49999237060547, 94.5)
   -- The function that takes place when the button is pressed
   end,
})
local Stage5 = Stages:CreateButton({
   Name = "Teleport to Stage 5",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-39.5, 174.5, -15.5)
   -- The function that takes place when the button is pressed
   end,
})
local Stage6 = Stages:CreateButton({
   Name = "Teleport to Stage 6",
   Callback = function()
	playerHRP.CFrame = CFrame.new(410.5, -290.50006103515625, -35.50000762939453)
   -- The function that takes place when the button is pressed
   end,
})
local Stage7 = Stages:CreateButton({
   Name = "Teleport to Stage 7",
   Callback = function()
	playerHRP.CFrame = CFrame.new(25.5, 272.49993896484375, -50.5)
   -- The function that takes place when the button is pressed
   end,
})
local Stage8 = Stages:CreateButton({
   Name = "Teleport to Stage 8",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-19.5, 297.49993896484375, -5.5)
   -- The function that takes place when the button is pressed
   end,
})
local Stage9 = Stages:CreateButton({
   Name = "Teleport to Stage 9",
   Callback = function()
	playerHRP.CFrame = CFrame.new(138, 574.4999389648438, -32.99998474121094)
   -- The function that takes place when the button is pressed
   end,
})
local Stage10 = Stages:CreateButton({
   Name = "Teleport to Stage 10",
   Callback = function()
	playerHRP.CFrame = CFrame.new(138, 417.5, -33)
   -- The function that takes place when the button is pressed
   end,
})
local Stage11 = Stages:CreateButton({
   Name = "Teleport to Stage 11",
   Callback = function()
	playerHRP.CFrame = CFrame.new(138, 589.5, 17.00000762939453)
   -- The function that takes place when the button is pressed
   end,
})
local Stage12 = Stages:CreateButton({
   Name = "Teleport to Stage 12 (also gives badge)",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-1939.5, 162.5, -90.50000762939453)
   -- The function that takes place when the button is pressed
   end,
})
local Label = Stages:CreateLabel("WARNING: Teleporting to DEADBEEF stages requires you to input '0xdeadbeef' into the Reset Stage Menu to function properly!", 4483362458, Color3.fromRGB(255, 255, 255), false)
local Deadbeef1 = Stages:CreateButton({
   Name = "Teleport to Deadbeef Stage 1",
   Callback = function()
	playerHRP.CFrame = CFrame.new(365.5, 134.5, -836)
   -- The function that takes place when the button is pressed
   end,
})
local Deadbeef2 = Stages:CreateButton({
   Name = "Teleport to Deadbeef Stage 2",
   Callback = function()
	playerHRP.CFrame = CFrame.new(255.5, 124.499755859375, -971)
   -- The function that takes place when the button is pressed
   end,
})
local Deadbeef3 = Stages:CreateButton({
   Name = "Teleport to Deadbeef Stage 3",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-229.5, 189.5, -800.5)
   -- The function that takes place when the button is pressed
   end,
})
local Badges = Window:CreateTab("Badges", 4483362458) -- Title, Image
local BadgeObtainment = Badges:CreateSection("Badges")
local WinBadge = BadgeObtainment:CreateButton({
   Name = "Experimentation Complete (also unlocks all stages)",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-1939.5, 162.5, -90.50000762939453)
   -- The function that takes place when the button is pressed
   end,
})
local HiddenBadge1 = BadgeObtainment:CreateButton({
   Name = "Hidden Badge 1",
   Callback = function()
	playerHRP.CFrame = CFrame.new(395.5, -327.5, -10.499999046325684)
   -- The function that takes place when the button is pressed
   end,
})
local HiddenBadge2 = BadgeObtainment:CreateButton({
   Name = "Hidden Badge 2",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-117, 302.49993896484375, 7.000006675720215)
   -- The function that takes place when the button is pressed
   end,
})
local HiddenBadge3 = BadgeObtainment:CreateButton({
   Name = "Hidden Badge 3",
   Callback = function()
	playerHRP.CFrame = CFrame.new(75.91587829589844, 424.4662780761719, -27.50016212463379)
   -- The function that takes place when the button is pressed
   end,
})
local HiddenBadge4 = BadgeObtainment:CreateButton({
   Name = "Hidden Badge 4",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-9.500015258789062, 1157.5, -20.5)
   -- The function that takes place when the button is pressed
   end,
})
local HiddenBadge5 = BadgeObtainment:CreateButton({
   Name = "Hidden Badge 5",
   Callback = function()
	playerHRP.CFrame = CFrame.new(135.5, 242.5, -35.5)
   -- The function that takes place when the button is pressed
   end,
})
local DeadbeefBadge = BadgeObtainment:CreateButton({
   Name = "DEADBEEF (type in '0xdeadbeef' into the stage reset before running, also confirm the reset)",
   Callback = function()
	playerHRP.CFrame = CFrame.new(-284.5, 194.0070343017578, -800.5)
   -- The function that takes place when the button is pressed
   end,
})
local AllBadge = BadgeObtainment:CreateButton({
   Name = "Master of Escape (type in '0xdeadbeef' into the stage reset before running, also confirm the reset)",
   Callback = function()
   playerHRP.CFrame = CFrame.new(-1939.5, 162.5, -90.50000762939453)
   wait(0.5)
	playerHRP.CFrame = CFrame.new(-284.5, 194.0070343017578, -800.5)
	wait(0.5)
	playerHRP.CFrame = CFrame.new(135.5, 242.5, -35.5)
	wait(0.5)
	playerHRP.CFrame = CFrame.new(-9.500015258789062, 1157.5, -20.5)
	wait(0.5)
	playerHRP.CFrame = CFrame.new(75.91587829589844, 424.4662780761719, -27.50016212463379)
	wait(0.5)
	playerHRP.CFrame = CFrame.new(-117, 302.49993896484375, 7.000006675720215)
	wait(0.5)
	playerHRP.CFrame = CFrame.new(395.5, -327.5, -10.499999046325684)
	wait(0.3)
	Rayfield:Notify({
   Title = "Cheater's Hub",
   Content = "Once all the badge popups have appeared, rejoin the game to receive the badge!",
   Duration = 6.5,
   Image = 4483362458,
})
   -- The function that takes place when the button is pressed
   end,
})