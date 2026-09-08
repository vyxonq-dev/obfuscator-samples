local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "kuncicoco hub v1",
   Icon =117829097495168, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "kuncicoco hub v3",
   LoadingSubtitle = "by 4x2x9x4x0",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Who is the spy", 4483362458) -- Title, Image
local Section = Tab:CreateSection("this hacker")
local Divider = Tab:CreateDivider()
Rayfield:Notify({
   Title = "Notification Title",
   Content = "Notification Content",
   Duration = 6.5,
   Image = 4483362458,
})

local Button = Tab:CreateButton({
   Name = "admin commands",
   Callback = function()
   -- The function that takes place when the button is pressed

game:GetService("Players").LocalPlayer.PlayerGui.Interface.Main.adminFrame.Visible = true

   end,
})

local Button = Tab:CreateButton({
   Name = "ESP word",
   Callback = function()
   -- The function that takes place when the button is pressed

loadstring(game:HttpGet("https://rawscripts.net/raw/Who-is-the-Spy-spy-finder-and-tells-you-words-of-people-13786"))()

   end,
})

local Button = Tab:CreateButton({
   Name = "ESP Player",
   Callback = function()
   -- The function that takes place when the button is pressed

loadstring(game:HttpGet("https://rawscripts.net/raw/Who-is-the-Spy-Spy-finder-13415"))()

   end,
})

local Button = Tab:CreateButton({
   Name = "Who is the spy scripts",
   Callback = function()
   -- The function that takes place when the button is pressed

loadstring(game:HttpGet("https://pastefy.app/eeWpIR5D/raw"))()

   end,
})