local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "CrypterHub | Build A Boat For Tresure",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "CrypterHub",
   LoadingSubtitle = "",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "CrypterHub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "8TqxPDEx97", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "key join the discord server for the key ty.",
      Subtitle = "Key System",
      Note = "join discord.gg/8TqxPDEx97", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"thanksforusing"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("AutoFarm", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Auto Complete")

Rayfield:Notify({
   Title = "Executed!",
   Content = "",
   Duration = 5,
   Image = 0,
})

local Button = MainTab:CreateButton({
   Name = "1 Completion",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptPerson/SimpleScripts/refs/heads/main/1_Completion.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "3 Completions",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptPerson/SimpleScripts/refs/heads/main/3_Completions.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "5 Completions",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptPerson/SimpleScripts/refs/heads/main/5_Completions.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "10 Completions",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptPerson/SimpleScripts/refs/heads/main/10_Completions.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "50 Completions",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptPerson/SimpleScripts/refs/heads/main/50_Completions.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "100 Completions",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptPerson/SimpleScripts/refs/heads/main/100_Completions.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Completions (YOU CANNOT STOP THIS SCRIPT AFTER ACTIVATION)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptPerson/SimpleScripts/refs/heads/main/Inf_Completions.lua"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Anti-Afk (Moves mouse. Please close the UI)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CryptPerson/SimpleScripts/refs/heads/main/AntiAfk.lua"))()
   end,
})
