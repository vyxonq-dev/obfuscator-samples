local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "⛏️ Dig to Earth's CORE!",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "⛏️ Dig to Earth's CORE!📜",
   LoadingSubtitle = "by Bob",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
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

local MainTab = Window:CreateTab("MainTab", 0) -- Title, Image

local Button = MainTab:CreateButton({
   Name = "👑💸Money Farm OP💸👑 (Spam It!)",
   Callback = function()

local args = {
	8
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinPrizeEvent"):FireServer(unpack(args))

   end,
})


local Button = MainTab:CreateButton({
   Name = "🏆Wins Farmer🏆",
   Callback = function()
   while wait(2) do
local args = {
	"Cup15"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TreasureEvent"):FireServer(unpack(args))
end
   end,
})



local Toggle = MainTab:CreateToggle({
   Name = "💵Money Farm💵", 
   CurrentValue = false,
   Flag = "Money Farm", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
while wait() do
local args = {
	"hello"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DigEvent"):FireServer(unpack(args))
end
   end,
})


local Button = MainTab:CreateButton({
   Name = "💎Gem Farm💎",
   Callback = function()
while wait() do
local args = {
	20,
	"bye"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GemEvent"):FireServer(unpack(args))
end
   end,
})




local Button = MainTab:CreateButton({
   Name = "🎁Spin Farm Cool Down (60 seconds)🎁",
   Callback = function()
while wait() do
local args = {
	"Chest"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TreasureEvent"):FireServer(unpack(args))
end
 
   end,
})

local Button = MainTab:CreateButton({
   Name = "💰Money Bag Farm💰",
   Callback = function()
while wait() do
local args = {
	"MoneyBag"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TreasureEvent"):FireServer(unpack(args))
end
       
   end,
})

local Button = MainTab:CreateButton({
   Name = "⚡LightShard Farm⚡",
   Callback = function()
while wait() do 
local args = {
	"LightShard"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TreasureEvent"):FireServer(unpack(args))
end

   end,
})

local Button = MainTab:CreateButton({
   Name = "💪Strength💪",
   Callback = function()
while wait() do
local args = {
	"Strength",
	100
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))
end         
   end,
})

local Button = MainTab:CreateButton({
   Name = "🚶WalkSpeed🚶",
   Callback = function()
while wait() do
local args = {
	"WalkSpeed",
	100
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))
end         
   end,
})

local Button = MainTab:CreateButton({
   Name = "✨GemChance✨",
   Callback = function()
while wait() do
local args = {
	"GemChance",
	100
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))
end         
   end,
})

local Button = MainTab:CreateButton({
   Name = "🐾PetLuck🐾",
   Callback = function()
while wait() do
local args = {
	"PetLuck",
	100
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))
end         
   end,
})









local WorldsTab = Window:CreateTab("Worlds", 0) -- Title, Image


local Button = WorldsTab:CreateButton({
   Name = "🌳World 1🌳",
   Callback = function()
      local args = {1}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🌵World 2🌵",
   Callback = function()
      local args = {2}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "⛄World 3⛄",
   Callback = function()
      local args = {3}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🌋World 4🌋",
   Callback = function()
      local args = {4}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🌴World 5🌴",
   Callback = function()
      local args = {5}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🍭World 6🍭",
   Callback = function()
      local args = {6}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🪸World 7🪸",
   Callback = function()
      local args = {7}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🚀World 8🚀",
   Callback = function()
      local args = {8}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🔮World 9🔮",
   Callback = function()
      local args = {9}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🪽World 10🪽",
   Callback = function()
      local args = {10}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🌠World 11🌠",
   Callback = function()
      local args = {11}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🧙World 12🧙",
   Callback = function()
      local args = {12}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🏜️World 13🏜️",
   Callback = function()
      local args = {13}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🦃World 14🦃",
   Callback = function()
      local args = {14}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Button = WorldsTab:CreateButton({
   Name = "🌑World 15🌑",
   Callback = function()
      local args = {15}
      game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("WorldTeleportEvent"):FireServer(unpack(args))
      
      -- KILL PLAYER
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("Humanoid") then
         player.Character.Humanoid.Health = 0
      end
   end,
})

local Tab = Window:CreateTab("Pets", 0) -- Title, Image

local Button = Tab:CreateButton({
   Name = "🐧Best Pet (Blue Penguin)🐧",
   Callback = function()
   local args = {
	"Blue Penguin"
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PetCageEvent"):FireServer(unpack(args))

   end,
})

local Button = Tab:CreateButton({
   Name = "🐧Make Blue Penguin(Gold)🟡",
   Callback = function()
   local args = {
	"Blue Penguin",
	100
}
game:GetService("ReplicatedStorage"):WaitForChild("PetRemotes"):WaitForChild("GoldPetCraftEvent"):FireServer(unpack(args))

   end,
})

local Button = Tab:CreateButton({
   Name = "🐧Make Blue Penguin(Void)OP🌌",
   Callback = function()
   local args = {
	"Blue Penguin",
	100
}
game:GetService("ReplicatedStorage"):WaitForChild("PetRemotes"):WaitForChild("VoidPetCraftEvent"):FireServer(unpack(args))
   end,
})