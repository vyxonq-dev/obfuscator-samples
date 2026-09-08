local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SURPG Script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "SURPG Script",
   LoadingSubtitle = "by... NO IT'S FREE",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
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

local Tab = Window:CreateTab("Teleport", "rewind")
local Section = Tab:CreateSection("Teleport NPC")

local Button = Tab:CreateButton({
   Name = "TP Yuma",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-542.017334, 1.52008057, 372.310364, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
   end,
})
local Button = Tab:CreateButton({
   Name = "TP Zym",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3592.95898, 3.79999971, -629.109924, 0.944372773, -0, -0.328876942, 0, 1, -0, 0.328876942, 0, 0.944372773)
   end,
})
local Button = Tab:CreateButton({
   Name = "TP Shoe(Doudle Rings Guy)",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3138.85498, 4.1110878, -625.684021, 0, 0, -1, 0, 1, 0, 1, 0, 0)
   end,
})
local Button = Tab:CreateButton({
   Name = "TP Saru",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3478.49414, 16.5050011, 311.828003, 1, 0, 0, 0, 1, 0, 0, 0, 1)
   end,
})
local Button = Tab:CreateButton({
   Name = "TP Rocks",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2656.05029, 8.92827606, 492.365448, 0.642763317, 0, 0.766064942, 0, 1, 0, -0.766064942, 0, 0.642763317)
   end,
})
local Button = Tab:CreateButton({
   Name = "TP Risyari",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(602.341736, 50.9073372, -56.1730652, -0.180490494, 0, 0.983576655, 0, 1, 0, -0.983576655, 0, -0.180490494)
   end,
})
local Button = Tab:CreateButton({
   Name = "TP Onion",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4544.07324, 6.80090237, 2288.82397, -1, 0, 0, 0, 1, 0, 0, 0, -1)
   end,
})
local Button = Tab:CreateButton({
   Name = "TP Cachi",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4893.42529, 8.49990845, -371.776337, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
   end,
})

local Tab = Window:CreateTab("Client", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Local")

local Slider = Tab:CreateSlider({
   Name = "Speed Set",
   Range = {0, 9999},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 50,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Tab = Window:CreateTab("Miss", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Fe Script")
local Button = Tab:CreateButton({
   Name = "Infiniteyield",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Dex",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/memeenjoyer43/darkdex/refs/heads/main/script"))()   end,
})

local Tab = Window:CreateTab("ChaosEmeralds", "rewind")
local Section = Tab:CreateSection("ChaosEmeralds")

local Button = Tab:CreateButton({
   Name = "Blue",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4975.18799, 23.4073219, -213.228027, -0.509275079, 0, 0.860603809, 0, 1, 0, -0.860603809, 0, -0.509275079)
   end,
})

local Button = Tab:CreateButton({
   Name = "Cyan",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9614.04297, 140.099091, 25974.2676, -0.844477057, 0, 0.535591781, 0, 1, 0, -0.535591781, 0, -0.844477057)
   end,
})

local Button = Tab:CreateButton({
   Name = "Green",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3312.23608, 193.336487, 2470.729, 0.382424474, 0, 0.923986733, 0, 1, 0, -0.923986733, 0, 0.382424474)
   end,
})

local Button = Tab:CreateButton({
   Name = "Purple",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(26251.2891, 486.58783, -2881.09473, 0.579511583, 0, -0.814963996, 0, 1, 0, 0.814963996, 0, 0.579511583)
   end,
})

local Button = Tab:CreateButton({
   Name = "Red",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-22953.5938, 25.8132401, 645.609375, 0.986043453, 0, -0.16648826, 0, 1, 0, 0.16648826, 0, 0.986043453)
   end,
})

local Button = Tab:CreateButton({
   Name = "White",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-729.187012, 239.276642, -48.4003906, -0.855512917, 0, 0.517781436, 0, 1, 0, -0.517781436, 0, -0.855512917)
   end,
})

local Button = Tab:CreateButton({
   Name = "Yellow",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-18022.9199, 595.093933, 35344.6172, -0.986808896, 0, -0.161889523, 0, 1, 0, 0.161889523, 0, -0.986808896)
   end,
})

Rayfield:LoadConfiguration()