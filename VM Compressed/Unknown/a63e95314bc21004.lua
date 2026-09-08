local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Ultra Sky DELTA",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loaded Sky",
   LoadingSubtitle = "by KICKALL/Kickboxing267",
   ShowText = "Script", -- for mobile users to unhide rayfield, change if you'd like
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

local Tab = Window:CreateTab("Home/Main", 10723407389) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Creator", Content = "Not FE"})

local Button = Tab:CreateButton({
   Name = "Loaded DELTA SkyBox",
   Callback = function(v)
   local skybox = Instance.new("Sky")
skybox.SkyboxBk = "rbxassetid://117012443612361" -- Replace with your skybox ID
skybox.SkyboxDn = "rbxassetid://117012443612361"
skybox.SkyboxFt = "rbxassetid://117012443612361"
skybox.SkyboxLf = "rbxassetid://117012443612361"
skybox.SkyboxRt = "rbxassetid://117012443612361"
skybox.SkyboxUp = "rbxassetid://117012443612361"
skybox.Parent = game.Lighting
   end,
})
