local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Durian Hub TOH gear giver ",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Durian Hub TOH gear giver ",
   LoadingSubtitle = "by Durian_BruhRBLX",
   ShowText = "Durian Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Durian Hub TOH gear giver ",
      Subtitle = "The key is Durian",
      Note = "The key is Durian", -- Use this to tell the user how to get a key
      FileName = "DurianHubTOHKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Durian"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Get items", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Get Banana",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.banana.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Get Bomb",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.bomb.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Get Cola",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.cola.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Get Fishing Rod",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.fishingrod.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Get Fusion Coil",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.fusion.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Get Gravity Coil",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.gravity.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Get Grapple Hook",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.hook.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Get Trowel",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.trowel.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Get Speed Coil",
   Callback = function()
   game:GetService("ReplicatedStorage").Assets.Gear.speed.Parent = game.Players.LocalPlayer.Backpack-- The function that takes place when the button is pressed
   end,
})