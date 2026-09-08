--// MONSTER HUB (RAYFIELD STYLE)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "MONSTER HUB ð¹",
   LoadingTitle = "Monster Hub Loading...",
   LoadingSubtitle = "by Monster",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "MonsterHubConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "F4BaB3V5U",
      RememberJoins = true
   },
   KeySystem = false
})

-- MAIN SCRIPTS TAB
local MainTab = Window:CreateTab("Scripts", 4483362458) -- Title & Tab Icon

-- SECTION
local Section = MainTab:CreateSection("Available Scripts")

-- BUTTONS
MainTab:CreateButton({
   Name = "RIVALS SCRIPT",
   Callback = function()
       pcall(function()
           loadstring(game:HttpGet("https://rawscripts.net/raw/RIVALS-AI-MADE-AIMBOT-238604"))()
       end)
   end,
})

MainTab:CreateButton({
   Name = "BE A YOUTUBER (INF MONEY)",
   Callback = function()
       pcall(function()
           local args = {
               [1] = "Hot Sauce",
               [2] = -9000e9000
           }
           game:GetService("ReplicatedStorage").events.buyGear:FireServer(unpack(args))
       end)
   end,
})

MainTab:CreateButton({
   Name = "ROB IT SCRIPT",
   Callback = function()
       pcall(function()
           loadstring(game:HttpGet("https://rawscripts.net/raw/ROB-IT-AUTOFARM-AUTO-STEAL-INF-GEMS-92429"))()
       end)
   end,
})

MainTab:CreateButton({
   Name = "BAKE OR DIE SCRIPT",
   Callback = function()
       pcall(function()
           loadstring(game:HttpGet("https://rawscripts.net/raw/Bake-or-Die-INFINITE-NUGGETS-AND-CASH-USE-BEFORE-ITS-PATCHED-AND-MORE-224716"))()
       end)
   end,
})

MainTab:CreateButton({
   Name = "NINJA LEGENDS (INF MONEY)",
   Callback = function()
       pcall(function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/KGuestCheatsJ2/Sc/refs/heads/main/NL", true))()
       end)
   end,
})

MainTab:CreateButton({
   Name = "FLICK SCRIPT",
   Callback = function()
       pcall(function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/vylerascripts/vylera-scripts/main/flick.lua"))()
       end)
   end,
})

MainTab:CreateButton({
   Name = "Forsaken Script",
   Callback = function()
       pcall(function()
           loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Forsaken-Script/refs/heads/main/lua"))()
       end)
   end,
})

MainTab:CreateButton({
   Name = "AGE EVELUTION [INF MONEY]",
   Callback = function()
       pcall(function()
           local args = {
               vector.create(-685.1201171875, 1.9517230987548828, 300.91046142578125),
               900000000000 -- edit this value then collect the money in the pad
           }
           game:GetService("ReplicatedStorage"):WaitForChild("DropperEvents"):WaitForChild("CollectDrop"):FireServer(unpack(args))
       end)
   end,
})

-- SETTINGS TAB
local SettingsTab = Window:CreateTab("Settings", 7072721682)

local CommunitySection = SettingsTab:CreateSection("Community & Socials")

SettingsTab:CreateButton({
   Name = "MONSTER HUB COMMUNITY",
   Callback = function()
       local discordLink = "https://discord.gg/F4BaB3V5U"
       if setclipboard then
           setclipboard(discordLink)
           Rayfield:Notify({
               Title = "Discord Link Copied!",
               Content = "Copied the Discord invite to your clipboard.",
               Duration = 5,
               Image = 4483362458,
           })
       else
           Rayfield:Notify({
               Title = "Clipboard Error",
               Content = "Your executor does not support setclipboard.",
               Duration = 5,
               Image = 4483362458,
           })
       end
   end,
})
