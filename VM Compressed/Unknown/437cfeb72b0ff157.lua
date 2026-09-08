local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "FE KJ BY SHUTTHISDOWNORZLSE",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "FE KJ V2🔥",
   LoadingSubtitle = "by SHUTTHISDOWNORZLSE",
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

local HomeTab = Window:CreateTab("Home", 4483362458) -- Title, Image
local MovesTab = Window:CreateTab("Moves", 4483362458) -- Title, Image
local UltTab = Window:CreateTab("Ult Moves", 4483362458) -- Title, Image

local Button = HomeTab:CreateButton({
   Name = "KJ Spawn",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/XYepg7PZ"))()
   end,
})

local Label = HomeTab:CreateLabel("This Script Got Updated, Please Dont Hate", "rewind")

local Button = MovesTab:CreateButton({
   Name = "Ravage Miss",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/8nAJ99Xj"))()
   end,
})

local Button = MovesTab:CreateButton({
   Name = "Ravage",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/pQBSdrBG"))()
   end,
})

local Button = MovesTab:CreateButton({
   Name = "Swift Sweep Miss",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/6ayiG0N0"))()
   end,
})

local Button = MovesTab:CreateButton({
   Name = "Swift Sweep",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/qL2VT39L"))()
   end,
})

local Button = MovesTab:CreateButton({
   Name = "Collateral Ruin",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/mru4xKGM"))()
   end,
})

local Button = UltTab:CreateButton({
   Name = "KJ ULT 1",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/ne06g5pB"))()
   end,
})

local Button = UltTab:CreateButton({
   Name = "KJ ULT 2",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/iFHVfGQB"))()
   end,
})

local Button = UltTab:CreateButton({
   Name = "Stoic Bomb",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/FHj0Hgq6"))()
   end,
})

local Button = UltTab:CreateButton({
   Name = "20-20-20 Dropkick",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/VeNCEkvR"))()
   end,
})

local Button = UltTab:CreateButton({
   Name = "Five Seasons",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/AY2PahwT"))()
   end,
})

local Button = HomeTab:CreateButton({
   Name = "KJ M1'S",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/49UKg8EA"))()
   end,
})

local HaTab = Window:CreateTab("Hack", "rewind")

local Button = HaTab:CreateButton({
   Name = "Go to Weakest dummy",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/dUuDjGpe"))()
   end,
})

local MoviTab = Window:CreateTab("Movesets", 4483362458) -- Title, Image

local Button = MoviTab:CreateButton({
   Name = "SAITAMA TO GOJO",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/glr9e0g3/raw"))()
   end,
})

local Button = MoviTab:CreateButton({
   Name = "KJ SCRIPT (FOUNDED)",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RathaTepmanuth10/Kj-script-/main/Kj"))()
   end,
})

local Button = MoviTab:CreateButton({
   Name = "Saitama to mahito",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Mahitotsbupdate'))()
   end,
})

local ShitTab = Window:CreateTab("Hubs that i found", 4483362458) -- Title, Image

local Button = ShitTab:CreateButton({
   Name = "KJ XXL SCRIPT?",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/aWSWdgwR"))()
   end,
})

local Button = ShitTab:CreateButton({
   Name = "KADE HUB",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/m36ceTxh"))()
   end,
})

local Button = ShitTab:CreateButton({
   Name = "Betless hub but better?",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ILoveScripting680/BETLESSHUBBETTER/refs/heads/main/BETLESSHUBBETTER/BETLESSHUBBETTER/BETLESSHUBBETTER/BETLESSHUBBETTER/BETLESSHUBBETTER/BETLESSHUBBETTER/BETLESSHUBBETTER/BETLESSHUBBETTER"))()
   end,
})

local Button = MoviTab:CreateButton({
   Name = "Sonic to TOJI",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/kademboss/maddyhure/main/fe3feafeaefa"))()
   end,
})

local HelTab = Window:CreateTab("SUS🤨", 4483362458) -- Title, Image

local Button = HelTab:CreateButton({
   Name = "SUS SCRIPT 1",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Risimiya/StatuyevAnim/SCRIPTS/SCRIPTS"))()
   end,
})

local Button = HelTab:CreateButton({
   Name = "jerk off",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/mS3M3MhJ"))()
   end,
})

local Button = HelTab:CreateButton({
   Name = "SUS SCRIPT 2",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/3xmtEiEh", true))()
   end,
})

local OptionTab = Window:CreateTab("Option", 4483362458) -- Title, Image

local Button = OptionTab:CreateButton({
   Name = "FPS TEST",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/rtwENh1Q"))()
   end,
})

local Button = OptionTab:CreateButton({
   Name = "Notification Test",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/67RN5egy"))()
   end,
})

local Button = OptionTab:CreateButton({
   Name = "Close gui",
   Callback = function()
Rayfield:Destroy()
   end,
})
