local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Errorsytem hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Errorsystem hub (alpha)",
   LoadingSubtitle = "By hat8ooalt",
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

   KeySystem = True, -- Set this to true to use our key system
   KeySettings = {
      Title = "Errorsystem hub key system",
      Subtitle = "Key System",
      Note = "https://pastebin.com/ZimjLFfG", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = True, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Errorsystem is back"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
}) 
local Tab = Window:CreateTab("Scripts", 4483362458)
local Section = Tab:CreateSection("universal scripts")
local Divider = Tab:CreateDivider()
local Button = Tab:CreateButton({
   Name = "Nameless admin",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Bypass chat (Bannable)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/XE3Scripts/Axur/refs/heads/main/AxurBypassV2",true))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Chat bot",
   Callback = function()
shared.Personality = "You are a very obidient boy who is obssesed with me and loves me, Always refer to me as Mommy, You always use emojis such as :3 and >_< and you act cute like a femboy."
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlamesW/OpenAI/home/ChatBot.lua"))();
   end,
})