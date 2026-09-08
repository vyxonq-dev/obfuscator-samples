local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/ohmygodnah4-jpg/IDKSCRIPT/refs/heads/main/main.lua'))()

local Window = Rayfield:CreateWindow({
   Name = "Sunset Hub Laucher",
   Icon = 1298248131, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Sunset Hub Laucher",
   LoadingSubtitle = "Fetching script...",
   ShowText = "Sunset Hub Laucher", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
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

local Tab = Window:CreateTab("Main", 1297549585) -- Title, Image

local function notify(Type)
   if Type == "error" or Type == "Error" then
      Rayfield:Notify({
         Title = "Error",
         Content = "Couldn't find any game",
         Duration = 6.5,
         Image = 1297496107,
      })
   elseif Type == "yes" then 
      Rayfield:Notify({
         Title = "Success",
         Content = "Luanch Hub done",
         Duration = 6.5,
         Image = 14562122555,
      })
   end
end
local Section = Tab:CreateSection("RoughBlade")

local Button = Tab:CreateButton({
   Name = "Launch RoughBalde",
   Callback = function()
         notify(yes)
         loadstring(game:HttpGet('https://raw.githubusercontent.com/ohmygodnah4-jpg/IDKSCRIPT/refs/heads/main/roughblade.lua'))()
   end,
})

local Section = Tab:CreateSection("NDS")

local Button = Tab:CreateButton({
   Name = "Launch NDS",
   Callback = function()
         notify(yes)
         loadstring(game:HttpGet('https://raw.githubusercontent.com/ohmygodnah4-jpg/IDKSCRIPT/refs/heads/main/NDS.lua'))()
   end,
})
