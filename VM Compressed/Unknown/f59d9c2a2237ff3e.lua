local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nulls BossFight",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "CHILL!!!",
   LoadingSubtitle = "by ScriptTrol",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big-Hub"
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

local MainTab = Window:CreateTab("Gui", nil) -- Title, Image

local MainButton = MainTab:CreateButton({
   Name = "Admin Panel (First Anit Kick)",
   Callback = function()
   game:GetService("Players").LocalPlayer.PlayerGui.AdminPanelNULL.Enabled = true
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "Time (First Anit Kick)",
   Callback = function()
   game:GetService("Players").LocalPlayer.PlayerGui.TimerGui.Enabled = true
   game:GetService("Players").LocalPlayer.PlayerGui.TimerGui.ResetOnSpawn = false
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "Kill Null directly (First Anit Kick)",
   Callback = function()
   game:GetService("Players").LocalPlayer.PlayerGui.KillNull.Enabled = true
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "Anit Kick (By Verosv)",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/puryVwow/raw"))()
   end,
})

local Main1Tab = Window:CreateTab("Teleport", nil)

local Main1Button = Main1Tab:CreateButton({
   Name = "Shop",
   Callback = function()
   local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-528.981506, 105.169647, 1652.33765, 0.0929900408, -3.90961148e-08, 0.99566704, -9.20627627e-08, 1, 4.78644289e-08, -0.99566704, -9.61147748e-08, 0.0929900408)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Exit",
   Callback = function()
   local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-288.203735, 105.069199, 1653.36426, 0.0164544936, -5.15667153e-08, -0.999864638, -4.30299281e-08, 1, -5.22818269e-08, 0.999864638, 4.38843735e-08, 0.0164544936)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
   end,
})

local Main1Button = Main1Tab:CreateButton({
   Name = "Door",
   Callback = function()
   local pl = game.Players.LocalPlayer.Character.HumanoidRootPart
local location = CFrame.new(-259.148529, 105.069199, 1615.90088, -0.0863405988, -7.62296537e-09, -0.99626565, -8.19938819e-08, 1, -5.45601064e-10, 0.99626565, 8.16405858e-08, -0.0863405988)
local humanoid = game.Players.LocalPlayer.Character.Humanoid
humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
wait(0.1)
pl.CFrame = location
   end,
})
