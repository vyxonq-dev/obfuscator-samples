local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "VirusPirusDirus ScriptHub Version 1.9",
   Icon = "award", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Welcome",
   LoadingSubtitle = "by innocent (VirusPirusDirus)",
   ShowText = "Script Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("BloxFruits", "apple") -- Title, Image
local Button = Tab:CreateButton({
   Name = "Vxeze Hub",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Dex-Bear/Vxezehub/refs/heads/main/Skidlamcho.txt"))()
   end,
})
local Button = Tab:CreateButton({
   Name = "Redz Hub",
   Callback = function()
local Settings = {
    JoinTeam = "Pirates"; -- Pirates / Marines
    Translator = false;   -- false / false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
  end,
})
local Tab2 = Window:CreateTab("Natural Disaster Survival", "hammer") -- Title, Image
local Button = Tab2:CreateButton({
   Name = "Nds Hub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KaterHub-Inc/NaturalDisasterSurvival/refs/heads/main/main.lua"))()
end,
})
local Button = Tab2:CreateButton({
   Name = "Nullfire (supports some additional games!)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
end,
})
local Button = Tab:CreateButton({
   Name = "Forge Hub (🔑Has Key System🔑)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Skzuppy/forge-hub/main/loader.lua"))()
end,
})
local Tab3 = Window:CreateTab("Misc", "code-xml") -- Title, Image = "Heart"
local Button = Tab3:CreateButton({
   Name = "Pshade Ultimate (Shaders Script)",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua'))()
end,
})
local Button = Tab2:CreateButton({
   Name = "Super Ring Parts v6 By Lukas",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol"))()
end,
})
local Button = Tab2:CreateButton({
   Name = "FE Gravity Inversion",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/96XzjEiK"))()
end,
})
local Button = Tab:CreateButton({
   Name = "Cokka Hub (🔑 Has Key System🔑)",
   Callback = function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua")()
end,
})
local Button = Tab3:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end,
})
local Button = Tab3:CreateButton({
   Name = "Nameless Admin",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
end,
})
local Button = Tab2:CreateButton({
   Name = "Blackhole script",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/pYhER1z4/raw"))()
end,
})
local Tab4 = Window:CreateTab("BackDoor Scanners", "wrench") -- Title, Heart
local Button = Tab4:CreateButton({
   Name = "LALOL Hub Backdoor",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script"))()
end,
})
local Button = Tab4:CreateButton({
   Name = "Lunar Backdoor",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/NWyEPHNA"))()
end,
})
local Button = Tab3:CreateButton({
   Name = "Fake Fps",
   Callback = function()
loadstring(game:HttpGet("https://gist.githubusercontent.com/jdihdzzzhack/e10f174a6903e17012423fdff80bf143/raw/f3e53f376ee9073dcaa181b8b784e27ed2706d99/gistfile1.txt"))()
end,
})
Rayfield:Notify({
   Title = "Warning:",
   Content = "Thanks For Using My Script!",
   Duration = 6.5,
   Image = "Heart"
})
Rayfield:Notify({
   Title = "Note:",
   Content = "Big update to 2.0 soon! planning on adding multiple games!",
   Duration = 6.5,
   Image = "bell",
})
local Button = Tab:CreateButton({
   Name = "Mukuro Hub (🔑Has Key System🔑)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/QuartyzScript/main/Loader.lua"))()
end
})
local Button = Tab:CreateButton({
   Name = "Ronix Blox Fruits (🔑Has Key System🔑)",
   Callback = function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/7d8a2a1a9a562a403b52532e58a14065.lua"))()
end
})
local Button = Tab4:CreateButton({
   Name = "Saturn Backdoor",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/KbUJxRqB/raw"))()
end
})
local Button = Tab4:CreateButton({
   Name = "IDK The Name",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/gojohdkaisenkt2/Gojohdkaisenkt-/refs/heads/main/L", true))()
end,
})
local Button = Tab4:CreateButton({
   Name = "Backdoor Scanner (Yes, its the name)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/wmudgFpR"))()
end
})
local Tab5 = Window:CreateTab("brookhaven", "map") -- title, image
local Button = Tab5:CreateButton({
   Name = "Chaos Hub",
   Callback = function()
loadstring(game:HttpGet(base64.decode("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL1Zlbm9tLWRldlgvQ2hhb3NIdWIvbWFpbi9sb2FkZXIubHVh")))();
end
})
local Button = Tab5:CreateButton({
   Name = "Coquette Hub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Daivd977/Deivd999/refs/heads/main/pessal"))()
end
})
local Button = Tab5:CreateButton({
   Name = "La Hub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Aham5la/Laal/refs/heads/main/Protected_5054203762517405.lua.txt"))()
end
})
local Button = Tab3:CreateButton({
   Name = "Dark Dex",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/memeenjoyer43/darkdex/refs/heads/main/script"))()
end
})
local Tab6 = Window:CreateTab("Fe Animations", "terminal") -- title, image
local Button = Tab6:CreateButton({
   Name = "Animation Gui",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/aqua-hub-is-a-skid-lol/refs/heads/main/animatrix"))()
end
})
local Button = Tab6:CreateButton({
   Name = "Fe scp 096",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YsJgITXR/raw"))()
end
})
local Button = Tab6:CreateButton({
   Name = "Fe Seraphic Blade",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))() --Anim
end
})
local Button = Tab6:CreateButton({
   Name = "Fe ShapeShifter",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/2C3cRXXp/raw"))()
end
})
local Button = Tab6:CreateButton({
   Name = "Fe Animation Gui",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/alifSTARZ/HERMAN-KONTOL-ANIMATION/refs/heads/main/Animation%20script%20by%20xploit%20force"))()
end,
})
local Button = Tab3:CreateButton({
   Name = "Funny Gravity Lay Script",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Underssky/GravityLayScript/refs/heads/main/MainGravityLay.txt"))()
end,
})
local Button = Tab2:CreateButton({
   Name = "Lukas Magnetic Hub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Lukashub-coder/Lukas-magnet/refs/heads/main/Lukas%20magnet"))()
end
})
local Tab7 = Window:CreateTab("Player", "user") -- Title, Image

local Slider = Tab7:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 250},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
local player = game.Players.LocalPlayer
   local character = player.Character
   local humanoid = character:FindFirstChildWhichIsA("Humanoid")

   if humanoid then
       humanoid.WalkSpeed = Value
   end
   end,
})
local Slider = Tab7:CreateSlider({
   Name = "Jump Power",
   Range = {50, 1000},
   Increment = 10,
   Suffix = "Jump Power",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
local player = game.Players.LocalPlayer
   local character = player.Character
   local humanoid = character:FindFirstChildWhichIsA("Humanoid")

   if humanoid then
       humanoid.JumpPower = Value
   end
   end,
})
local Button = Tab2:CreateButton({
   Name = "Tp Unanchored T (TUT)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/evilionx3/blackholetool/refs/heads/main/skibidi.lua"))() 
end
})
local Button = Tab3:CreateButton({
   Name = "Coordinates Script (Credits: VantaXock)",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/RrNU3XWN/raw"))()
end
})
local Button = Tab3:CreateButton({
   Name = "Sirius",
   Callback = function()
loadstring(game:HttpGet('https://sirius.menu/script'))();
end
})
local Tab8 = Window:CreateTab("Slap Battles", "hand") -- Title, Image
local Button = Tab8:CreateButton({
   Name = "Alchemist Abuser (credits DonjoSX)",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/DonjoScripts/Public-Scripts/refs/heads/Slap-Battles/Alchemist%20abuser.lua'))()
end
})
local Button = Tab8:CreateButton({
   Name = "Flowers Glove (credits DonjoSX)",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Umbrella-Scripter/Slap-Battles/refs/heads/main/F.L.O.W.E.R.lua'))()
end
})
local Button = Tab8:CreateButton({
   Name = "GodHuman V2 (Credits Incognito Scripts)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/main/GodHuman", true))()
end
})
