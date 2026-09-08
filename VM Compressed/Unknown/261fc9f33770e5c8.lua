local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "PRSN Hub V1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "PRSN Hub",
   LoadingSubtitle = "by Yallto_Weak",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/UWP8JVRfhK", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "PRSN Hub V1",
      Subtitle = "Key System",
      Note = "https://discord.gg/ZM8Hu4xu", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Yalltoweak"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Section = Tab:CreateSection("TP")
local Button = Tab:CreateButton({
   Name = "Prison",
   Callback = function()
   local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
rootPart.CFrame = workspace.Prison_Halls.floor:GetChildren()[5].CFrame
   end,
})
local Button = Tab:CreateButton({
   Name = "COP ROOM",
   Callback = function()
   local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
rootPart.CFrame = workspace.Prison_Guard_Outpost.floor.CFrame
   end,
})
local Button = Tab:CreateButton({
   Name = "Criminal base",
   Callback = function()
   local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
rootPart.CFrame = workspace.Warehouses.Outside:GetChildren()[12].CFrame
   end,
})
local Button = Tab:CreateButton({
   Name = "Yard",
   Callback = function()
   local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
rootPart.CFrame = workspace:GetChildren()[19].paths:GetChildren()[19].CFrame
   end,
})
local Section = Tab:CreateSection("Items")
local Button = Tab:CreateButton({
   Name = "Im to Lazy to make it, ima make it on V2",
   Callback = function()
	Print("Im to Lazy")
   end,
})