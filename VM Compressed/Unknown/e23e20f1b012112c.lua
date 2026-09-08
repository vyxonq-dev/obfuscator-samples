local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Joe Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Joe Hub",
   LoadingSubtitle = "by Joe",
   ShowText = "Joe", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Joe Hub V2"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "9cmZFrbBdm", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Joe Hub",
      Subtitle = "Key System",
      Note = "Key is in Discord.", -- Use this to tell the user how to get a key
      FileName = "JoeHubKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/szCvBJtY"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("♾️ Universal ♾️", nill) -- Title, Image
local MainSection = MainTab:CreateSection("Scripts")
Rayfield:Notify({
   Title = "Hallo",
   Content = "Thank you for choosing Joe Hub!",
   Duration = 3.0,
   Image = nill,
})

local MainButton = MainTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

local MainButton = MainTab:CreateButton({
   Name = "Health Bar ESP (Buggy)",
   Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/Vs7RDcg9"))()
   end,
})

local BloxTab = Window:CreateTab("⚡ Blox Fruits 🔥", nill) -- Title, Image
local BloxSection = BloxTab:CreateSection("Scripts")

local BloxButton = BloxTab:CreateButton({
   Name = "Money Auto Farm",
   Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/7nS8ENSu"))()
   end,
})

local BloxButton = BloxTab:CreateButton({
   Name = "Redz Hub (NOT MINE!!)",
   Callback = function()
            local Settings = {
    JoinTeam = "Pirates"; -- Pirates / Marines
    Translator = true;   -- true / false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
   end,
})

local FakeTab = Window:CreateTab("☠️ Impossible Squid Game! Glass Bridge 2 ☠️", nill) -- Title, Image
local FakeSection = FakeTab:CreateSection("Scripts")
local FakeButton = FakeTab:CreateButton({
   Name = "Auto Farm",
   Callback = function()
            loadstring(game:HttpGet("https://pastebin.com/raw/8eh4Wadj", true))()
end,
})

local BoomTab = Window:CreateTab("💥 Destruction Simulator 💥", nill) 
local BoomSection = BoomTab:CreateSection("Scripts")
local BoomButton = BoomTab:CreateButton({
   Name = "Nuke",
   Callback = function()
           loadstring(game:HttpGet("https://pastebin.com/raw/F8AiKnbB", true))()
end,

})
local BoomButton = BoomTab:CreateButton({
   Name = "Nuke Server *Crashes everyone*",
   Callback = function()
           loadstring(game:HttpGet("https://pastebin.com/raw/1Nhve7MF", true))()
end,
})

local BoomButton = BoomTab:CreateButton({
   Name = "Infinite Money + XP",
   Callback = function()
           loadstring(game:HttpGet("https://pastebin.com/raw/r7Mj31v4", true))()
end,
})

local AbilityTab = Window:CreateTab("⚡Ability Wars ⚡", nill)
local AbilitySection = AbilityTab:CreateSection("Soon...")
