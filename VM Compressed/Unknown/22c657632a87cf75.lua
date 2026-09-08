local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "killstreak Button Test REMASTERED Auto",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
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
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "killstreak Button Test REMASTERED",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"killstreak"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("killstreak","key22")
   }
})
local Tab = Window:CreateTab("Auto Farm", 4483362458) -- Title, Image
local Button = Tab:CreateButton({
   Name = "Auto click [ can't stop And lag to ]",
   Callback = function()
   -- Generated with Sigma Spy Github: https://github.com/depthso/Sigma-Spy
-- Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Remote
local GiveKill = ReplicatedStorage.AdminEvents.GiveKill -- RemoteEvent 

while wait() do
    GiveKill:FireServer()
end

   end,
})
local Button = Tab:CreateButton({
   Name = "Rejoin",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-rejoin-73208"))()

local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
   -- The function that takes place when the button is pressed
   end,
})
   end,
})
local Tab = Window:CreateTab("Fly script", "rewind")
local Button = Tab:CreateButton({
   Name = "Fly v3",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gui-Fly-v3-37111"))()
   end,
})