local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local luacode = ""
local Window = Rayfield:CreateWindow({
   Name = "Raw Link Executor",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Durian Hub",
   LoadingSubtitle = "Raw Link Executor",
   ShowText = "UI", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = DurianHub, -- Create a custom folder for your hub/game
      FileName = "RawLinkExecutor"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Durian Hub",
      Subtitle = "Raw Link Executor",
      Note = "The key is Durian", -- Use this to tell the user how to get a key
      FileName = "RawLinkExecutor", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Durian"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Raw Link Executor", 4483362458) -- Title, Image
local Input = Tab:CreateInput({
   Name = "Raw Link",
   CurrentValue = "",
   PlaceholderText = "e.g: https://rawlink.com",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
   -- The function that takes place when the input is changed
   loadstring(game:HttpGet(Text))()
   luacode = Text-- The variable (Text) is a string for the value in the text box
   end,
})
local Button = Tab:CreateButton({
   Name = "Execute",
   Callback = function()
   loadstring(game:HttpGet(luacode))()-- The function that takes place when the button is pressed
   end,
})
local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Toggle = MiscTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   loadstring(game:HttpGet("https://gist.githubusercontent.com/DurianBruhRBLX/3c3f2a6399d58bdb77f6ea38a5fb34b0/raw/6722caf6ba5ad97ca9962723523baa37a4e7b55d/ESP.lua"))() -- The function that takes place when the toggle is pressed
   -- The variable (Value) is a boolean on whether the toggle is true or false
   end,
})
local Button = MiscTab:CreateButton({
   Name = "IY (Infinite Yield)",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() -- The function that takes place when the button is pressed
   end,
})
local Button = MiscTab:CreateButton({
   Name = "Chat Bypasser",
   Callback = function()
   Rayfield:Notify({
  	Title = "Credits to fearless for ts",
  	Content = "And btw it will lag the fuck out of ur device",
  	Duration = 3,
  	Image = 4483362458,
	})
   loadstring(game:HttpGet("https://raw.githubusercontent.com/fearlessd3v/TEAM-FEARLESS/refs/heads/main/fearless-chat-bypass"))()-- The function that takes place when the button is pressed
   end,
}) 
