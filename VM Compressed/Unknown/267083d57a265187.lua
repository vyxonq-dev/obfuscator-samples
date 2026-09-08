local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SunDrop Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading SunDrop Hub",
   LoadingSubtitle = "by SunDrop/MarioChey",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "R", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "SunDropHub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "5AMbtnAK", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "SunDrop Hub | Key ",
      Subtitle = "SunDrop Hub Key System",
      Note = "discord.gg/5AMbtnAK", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/stDhjPL3"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local TrollTab = Window:CreateTab("🤚Troll Is a Pinning Tower🤚", nil) -- Title, Image
local Section = TrollTab:CreateSection("Anti Slap")

local Button = TrollTab:CreateButton({
   Name = "Anti Slap",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Troll-is-a-pinning-tower-2-slap-all-script-80739"))()
   end,
})

local Section = TrollTab:CreateSection("Troll Button(key is CM_KALAN)")

local Button = TrollTab:CreateButton({
   Name = "Troll Button",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ProGamerBoy610/Loading-gui/refs/heads/main/Troll%20button%20tower"))()
   end,
})

local Section = TrollTab:CreateSection("Walkspeed")

local Slider = TrollTab:CreateSlider({
   Name = "WalkSpeed Changer",
   Range = {16, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Section = TrollTab:CreateSection("Infinite Jump")

local Toggle = TrollTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local InfiniteJumpEnabled = false

UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local character = Players.LocalPlayer.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
      InfiniteJumpEnabled = Value
   end,
})