local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Jacobangelosantoss hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "SUB TO @JACOBANGELOSANTOSS!!!!",
   LoadingSubtitle = "by Jacobangelosantoss",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Jacobangelosantoss hub"
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
      Note = "If this pop up use key Hello because this hub is keyless ", -- Use this to tell the user how to get a key
      FileName = "KeyJacobangelosantossHub", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Universal", 4483362458) -- Title, Image



local Button = Tab:CreateButton({
   Name = "Fly gui",
   Callback = function()
   loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
   end,
})



local Button = Tab:CreateButton({
   Name = "3rd person",
   Callback = function()
   game.Players.LocalPlayer.CameraMinZoomDistance, game.Players.LocalPlayer.CameraMaxZoomDistance, workspace.CurrentCamera.CameraType, workspace.CurrentCamera.CameraSubject = 1, 16, Enum.CameraType.Custom, game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
   end,
})



local Button = Tab:CreateButton({
   Name = "Wallhop and ladder gui",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()
   end,
})



local Button = Tab:CreateButton({
   Name = "Invis Car gui",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Fe-Invisible-Car-GUi_382"))()
   end,
})



local Button = Tab:CreateButton({
   Name = "coolkid gui",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkid-UI-37757"))()
   end,
})



local Button = Tab:CreateButton({
   Name = "tptool",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Teleport-Tools-34066"))()
   end,
})



local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 2000},
   Increment = 10,
   Suffix = "Walkspeed",
   CurrentValue = 16,
   Flag = "SliderWalk", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})



local Slider = Tab:CreateSlider({
   Name = "Jump power",
   Range = {0, 2000},
   Increment = 10,
   Suffix = "Jump Power",
   CurrentValue = 50,
   Flag = "SliderJump", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.JumpHeight = Value
   -- The variable (Value) is a number which correlates to the value the slider is currently at
   end,
})



local Button = Tab:CreateButton({
   Name = "record",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20record%20V3%20script'))()
   end,
})



local Button = Tab:CreateButton({
   Name = "Nameless Admin",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source"))();
   end,
})



local Button = Tab:CreateButton({
   Name = "Vfly script",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Vfly-script-by-me-11871"))()
   end,
})




local Button = Tab:CreateButton({
   Name = "Sword auto clicker",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/JacobAngeloSantos/3rd-person-roblox/refs/heads/main/autoclickersword.lua"))()
   end,
})



local Button = Tab:CreateButton({
   Name = "Freecam",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/JacobAngeloSantos/3rd-person-roblox/refs/heads/main/freecamriblox.lua"))()
   end,
})


local Tab = Window:CreateTab("Client Replication", "computer")



local Button = Tab:CreateButton({
   Name = "Grab knife v4",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V4.lua"))()
   end,
})



local Tab = Window:CreateTab("Backdoored games", "shield-alert")
local Button = Tab:CreateButton({
   Name = "Backdoor",
   Callback = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Lalol-Hub-Legacy-Backdoor-39254"))()
   end,
})


local Tab = Window:CreateTab("Grow a garden", 4483362458) -- Title, Image



local Button = Tab:CreateButton({
   Name = "inf money",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer

-- Wait for leaderstats and Sheckles to load
local leaderstats = player:WaitForChild("leaderstats")
local sheckles = leaderstats:WaitForChild("Sheckles")

-- Set Sheckles to infinity
sheckles.Value = math.huge

-- Wait for the GUI and TextLabel
local shecklesUI = player:WaitForChild("PlayerGui"):WaitForChild("Sheckles_UI")
local textLabel = shecklesUI:WaitForChild("TextLabel")

-- Set the text to 'inf'
textLabel.Text = "inf"
   end,
})
