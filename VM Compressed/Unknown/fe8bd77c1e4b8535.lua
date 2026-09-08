local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "💪Spirit Bomb Simulator",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by WInXHUB",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "WINxHUB",
      Subtitle = "Key System",
      Note = "GO TO GET KEYY", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"SpiritBombSimulatorWINxHUB"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
Rayfield:Notify({
   Title = "WinXHUB",
   Content = "ENJOY",
   Duration = 2.7,
   Image = nil,
})
local homeTab = Window:CreateTab("Home", nil) -- Title, Image
local Button = homeTab:CreateButton({
   Name = "Get Power OP",
   Callback = function()
   
local args = {
    "Power",
    9999999999
}
game:GetService("ReplicatedStorage").Remotes.AddWheelSpinValue:FireServer(unpack(args))
wait()

   end,
})
local Button = homeTab:CreateButton({
   Name = "Get spin 99 OP",
   Callback = function()
   
local args = {
    "Spins",
    99
}
game:GetService("ReplicatedStorage").Remotes.AddWheelSpinValue:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "5x power free OP",
   Callback = function()
   local args = {
    "x5 Power",
    99999999999999999999999999999999999999999999999999
}
game:GetService("ReplicatedStorage").Remotes.AddWheelSpinValue:FireServer(unpack(args))
   end,
})
