local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "😈RKK😈",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "👑Made by RKK👑",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
  Theme = "AmberGlow", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "King key system",
      Subtitle = "Key System",
      Note = "Join Discord Server https://discord.gg/3cZJ348y", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"HFIGHVBIRUI4784FHJ"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("🏠Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Section Example")

Rayfield:Notify({
   Title = "you have executed the script!",
   Content = "very good gui",
   Duration = 5,
   Image = nil,
})
local Button = MainTab:CreateButton({
   Name = "Infinte Jump",
   Callback = function()
    -- Infinite Jump Script
local Player = game.Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
 
UserInputService.JumpRequest:Connect(function()
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {0, 2000000000},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Dropdown = MainTab:CreateDropdown({
   Name = "Select Area",
   Options = {"Gun Shop","Car Selling Yard"},
   CurrentOption = "Gun Shop" or {"Option 1","Option 3"},
   MultiSelection = true, -- If MultiSelections is allowed
   Flag = "teleport", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Option)
        print(Options)
   end,
})

local TeleportTab = Window:CreateTab("🛠️Teleports", nil) -- Title, Image
local Section = TeleportTab:CreateSection("Shops")

local Button = TeleportTab:CreateButton({
   Name = "😈GunShop😈",
   Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/xBac0nBl1tzX/Teleport/refs/heads/main/Teleport-Tools.luau"))()
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "delarship",
   Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/xBac0nBl1tzX/Teleport/refs/heads/main/Teleport-Tools.luau"))()
   end,
})

local MiscTab = Window:CreateTab("🎲Misc", nil) -- Title, Image
local Section = MiscTab:CreateSection("Shops")




local Button = MainTab:CreateButton({
   Name = "Hitbox expander",
   Callback = function()
     loadstring(game:HttpGet("https://pastebin.com/raw/70q9iP6S"))()
   end,
})


local Button = MiscTab:CreateButton({
   Name = "aimbot hit box expander recommended",
   Callback = function()
        --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--Updated Keybind Logic now just type "RightShift" in the "K" 
--https://raw.githubusercontent.com/randomuser832/Settings/refs/heads/main/Settings for a rundown on the settings

--// SETTINGS (user-editable)
_G.AimbotEnabled = true
_G.TeamCheck = false
_G.AimPart = "Head"
_G.Sensitivity = 1 -- 1 = snap, lower = smooth

-- ESP Settings
_G.ESPEnabled = true
_G.ESPColorName = "green"
_G.ESPFilled = false
_G.ESPThickness = 1
_G.ESPTransparency = 1
_G.ESPRainbow = true

-- FOV Settings
_G.FOVEnabled = true
_G.FOVColorName = "white"
_G.FOVRadius = 60
_G.FOVFilled = false
_G.FOVTransparency = 0.7
_G.FOVThickness = 1
_G.FOVRainbow = true
_G.FOVCircleSides = 64


_G.ScriptEnabled = true
_G.ToggleKey = "RightShift"


loadstring(game:HttpGet("https://raw.githubusercontent.com/randomuser832/Scripts25/refs/heads/main/UniversalAimbotLoadString"))()


   end,
})


local Button = MainTab:CreateButton({
   Name = "Rivals",
   Callback = function()
    loadstring(game:HttpGet("https://soluna-script.vercel.app/main.lua",true))()
   end,
})

