local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "N0rm4lkidd GUI",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "N0rm4lkidd GUI Loading",
   LoadingSubtitle = "by N0rm4lkidd",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "N0rm4lkidd GUI"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/rRWksnsMDs", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key Needed",
      Subtitle = "Key System",
      Note = "Join Discord: https://discord.gg/rRWksnsMDs", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/cWY7YiFj"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Local Player", nil) -- Title, Image

local Section = Tab:CreateSection("Player Characteristics")

local Slider = Tab:CreateSlider({
   Name = "Speed Slider",
   Range = {0, 300},
   Increment = 4,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Speed", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 500},
   Increment = 10,
   Suffix = "JumpPower",
   CurrentValue = 50,
   Flag = "JumpPower", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Gravity",
   Range = {0, 1999},
   Increment = 9,
   Suffix = "Gravity",
   CurrentValue = 196,
   Flag = "Gravity", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Workspace.Gravity = (Value)
   end,
})

local Tab = Window:CreateTab("Other Scripts", nil) -- Title, Image

local Section = Tab:CreateSection("Scripts")

local Button = Tab:CreateButton({
   Name = "Inf Yield",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "MM2 Script",
   Callback = function()
       for _, url in pairs({
    "https://raw.githubusercontent.com/Dekos-lgbty/halloweens/refs/heads/main/autofarms",
    "https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"
}) do
    loadstring(game:HttpGet(url, true))()
end
   end,
})

local Button = Tab:CreateButton({
   Name = "Bypass Chat",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/shakk-code/SigmaBypasser/refs/heads/main/source", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Nameless Admin",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))();
   end,
})