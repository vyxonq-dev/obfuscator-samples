local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "FE SCRIPTER [XENO] *AI*",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfleld",
   LoadingSubtitle = "by kickboxing",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "SCRIPTERS NEW", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/D8cEQFZy", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "key system",
      Subtitle = "key system",
      Note = "key for friend", -- Use this to tell the user how to get a key
      FileName = "key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Cone"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Chat", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Hello",
   Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Hello")
   end,
})
local Button = Tab:CreateButton({
   Name = "Penis",
   Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("=-")
   end,
})

local Button = Tab:CreateButton({
   Name = "Penis big",
   Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("=---")
   end,
})

local Button = Tab:CreateButton({
   Name = "HACK SERVER V1",
   Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("100% HACK")
   end,
})

local Button = Tab:CreateButton({
   Name = "FE",
   Callback = function()
   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("SCRIPTER IS COMING")
   end,
})

local Tab = Window:CreateTab("Console", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Hello",
   Callback = function()
   print("Hello")
   end,
})

local Button = Tab:CreateButton({
   Name = "What",
   Callback = function()
   print("What")
   end,
})

local Button = Tab:CreateButton({
   Name = "FE",
   Callback = function()
   print("ERROR 404")
   end,
})

local Button = Tab:CreateButton({
   Name = "Penis",
   Callback = function()
   print("=-")
   end,
})

local Button = Tab:CreateButton({
   Name = "Penis big",
   Callback = function()
   print("=----")
   end,
})

local Button = Tab:CreateButton({
   Name = "bomb",
   Callback = function()
   print("110101010101010101010101010101010101001010101010101010100101001010010101010101010101010101010101010101010101010101010111110101010101010101010101010101")
   end,
})

local Button = Tab:CreateButton({
   Name = "FE HACK V1",
   Callback = function()
   print("HACK SERVERS")
   end,
})

local Tab = Window:CreateTab("Other scripts", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "inf yleld",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Solara hub",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/Wfe784Xn/raw"))()
   end,
})

local Tab = Window:CreateTab("", 4483362458) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Hello!", Content = "Script for kickboxing267"})
local Paragraph = Tab:CreateParagraph({Title = "Friend", Content = "Bloxxer"})
