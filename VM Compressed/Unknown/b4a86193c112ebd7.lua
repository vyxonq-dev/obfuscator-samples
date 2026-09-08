local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "The 1,000,000 JumpRope",
   LoadingTitle = "By Xula",
   LoadingSubtitle = "Loading...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "JumpropeConfig"
   },
   KeySystem = false
})

-- Create "Main" tab
local MainTab = Window:CreateTab("Main", 4483362458)

-- Button 1: Infinite Moneh
MainTab:CreateButton({
   Name = "Inf moneh 🤑💰",
   Callback = function()
      local args = {
         "inf"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("CratesUtilities")
         :WaitForChild("Remotes"):WaitForChild("GiveReward"):FireServer(unpack(args))
   end
})

-- Button 2: Custom Moneh Input
MainTab:CreateInput({
   Name = "Custom Moneh 💵",
   PlaceholderText = "Enter amount of money",
   RemoveTextAfterFocusLost = false,
   Callback = function(input)
      local args = { tostring(input) }
      game:GetService("ReplicatedStorage"):WaitForChild("CratesUtilities")
         :WaitForChild("Remotes"):WaitForChild("GiveReward"):FireServer(unpack(args))
   end
})

-- Create "Others" tab
local OthersTab = Window:CreateTab("Others", 4483362458)

-- Input: Set JumpPower
OthersTab:CreateInput({
   Name = "JumpPower 🔼",
   PlaceholderText = "Enter JumpPower",
   RemoveTextAfterFocusLost = true,
   Callback = function(input)
      local num = tonumber(input)
      if num then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
      end
   end
})

-- Input: Set WalkSpeed
OthersTab:CreateInput({
   Name = "WalkSpeed 🏃‍♂️",
   PlaceholderText = "Enter WalkSpeed",
   RemoveTextAfterFocusLost = true,
   Callback = function(input)
      local num = tonumber(input)
      if num then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
      end
   end
})