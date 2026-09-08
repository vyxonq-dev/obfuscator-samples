--Made By Shartmastaa.
print("Hi. im Bart Simpson!")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Bart's Simps",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "loading bart's simps",
   LoadingSubtitle = "by Shartmastaa/obama have dihh 💔💔💔",
   ShowText = "bart simp", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = true,
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

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Who Are You?",
      Subtitle = "Tip: a simpson",
      Note = "look at tip", -- Use this to tell the user how to get a key
      FileName = "ThisIsBartKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Bart"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

--variantbles
local plr = game.Players.LocalPlayer
local plrgui = plr:WaitForChild("PlayerGui")
local char = plr.Character or plr.CharacterAdded:Wait()
local ts = plrgui:WaitForChild("TeamSelector")
local TPtext = ""
local grav = game.Workspace.Gravity
local hum = char.Humanoid
local hrp = char.HumanoidRootPart

--scirpt
local MainTab = Window:CreateTab("Main", 0)
local Section = MainTab:CreateSection("Gui Related")

local TeamToggle = MainTab:CreateToggle({
   Name = "Team Selector (ONLY USE IF NOT ALREADY ROLE, IF YOU SELECT ANOTHER TEAM WHILE BEING ALREADY A TEAM, YOU WILL GET KICKED)",
   CurrentValue = true,
   Flag = "TToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   		if Value == true then
						ts.Enabled = true
  		else
						ts.Enabled = false
      end
   end,
})

local PlrTab = Window:CreateTab("Player", "user") -- Title, Image

local TPInput = PlrTab:CreateInput({
   Name = "Player username",
   CurrentValue = "",
   PlaceholderText = "username",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
   TPtext = Text
   end,
})
local TPButton = PlrTab:CreateButton({
   Name = "Tp to Player",
   Callback = function()
   char.HumanoidRootPart.CFrame = game.Workspace[Text].HumanoidRootPart.CFrame
   end,
})
local OfButton = PlrTab:CreateButton({
   Name = "Offset Y by 30 (use if ur urself)",
   Callback = function()
   hrp.CFrame = CFrame.new(hrp.Position) + Vector3.new(0, 30, 0)
   end,
})

local HSection = PlrTab:CreateSection("Humanoid Related")

local SitButton = PlrTab:CreateButton({
   Name = "Sit",
   Callback = function()
   hum.Sit = true
   end,
})
local WSSlider = PlrTab:CreateSlider({
   Name = "Walkspeed",
   Range = {13, 200},
   Increment = 1,
   Suffix = "namber",
   CurrentValue = 13,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   hum.WalkSpeed = Value
   end,
})
local JPSlider = PlrTab:CreateSlider({
   Name = "JumpPower",
   Range = {1, 150},
   Increment = 1,
   Suffix = "applez",
   CurrentValue = 30,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   	hum.JumpPower = Value
	hum.JumpHeight = (Value^2) / (2 * grav)
   end,
})

local VTab = Window:CreateTab("Visual", "eye") -- Title, Image
local blr = Instance.new("Blur", game.Lighting)

local VISlider = VTab:CreateSlider({
   Name = "Visual Impairment",
   Range = {0, 100},
   Increment = 0.5,
   Suffix = "amount",
   CurrentValue = 0,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   blr.Size = Value
   end,
})
