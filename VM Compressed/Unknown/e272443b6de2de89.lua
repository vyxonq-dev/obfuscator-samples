local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Risky Roads🌋",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Made by WinxHUB",
   ShowText = "winxHUB", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst ", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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
Rayfield:Notify({
   Title = "Success exe",
   Content = "have fun",
   Duration = 2.5,
   Image = nil,
})
local homeTab = Window:CreateTab("Home", nil) -- Title, Image\
local PlayerTab = Window:CreateTab("Player", nil) -- Title, Image
local checkTab = Window:CreateTab("checkpoint", nil) -- Title, Image

local Button = checkTab:CreateButton({
   Name = "checkpoint 1",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(572.433, 2440.91, -250.009, -0.0484053232, -0.0577930696, 0.997154355, -0, 0.998324633, 0.0578608923, -0.998827815, 0.00280077523, -0.0483242236)
         
   end,
})
    local Button = checkTab:CreateButton({
   Name = "check point 2",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9901.399, 2300.219, 612)
   end,
})
       local Button = checkTab:CreateButton({
   Name = "check point 2.5",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16066.001, 2220, 1774, -0.0789642185, -0.00559652969, 0.996861756, -2.9103827e-11, 0.999984205, 0.00561405998, -0.996877432, 0.000443309837, -0.0789629743)
                
   end,
})
       local Button = checkTab:CreateButton({
   Name = "check point 3",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-18439.969, 2118.595, 328.816, 0.74512583, -0.128885388, -0.654351711, -7.4505806e-9, 0.981148958, -0.193253502, 0.66692394, 0.143998176, 0.73107934)
                
   end,
        })
    local Button = checkTab:CreateButton({
   Name = "check point 4",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-26060.17, 1212.199, -2102.312)
   end,
})
     local Button = checkTab:CreateButton({
   Name = "check point 4.5",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-28546.178, 1187.437, -2479.617, -0.927612126, -0.0206150785, 0.372975677, -0, 0.998476088, 0.0551876724, -0.373544991, 0.051192753, -0.926198423)
                
   end,
})
    local Button = checkTab:CreateButton({
   Name = "check point 5",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-30676.799, 1964.621, -2382.596)
   end,
})
    local Button = checkTab:CreateButton({
   Name = "check point 6",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-37708.801, 1790.121, -1881.596)
   end,
})
    local Button = checkTab:CreateButton({
   Name = "check point 7",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-45595.281, 1472.919, -208.855)
   end,
})
    local Button = checkTab:CreateButton({
   Name = "check point 8",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-55308.402, 1510.68, 1779.304)
   end,
})
 local Button = PlayerTab:CreateButton({
   Name = "Reset",
   Callback = function()
   local args = {
    game:GetService("Players")
}
game:GetService("ReplicatedStorage").RespawnPlayerAtLastCheckpointEvent:FireServer(unpack(args))
   end,
    })
local Button = homeTab:CreateButton({
   Name = "Spawn Raptor",
   Callback = function()
   local args = {
    "Raptor"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Spawn Benz",
   Callback = function()
   local args = {
    "Benz"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Lambo",
   Callback = function()
   local args = {
    "Lambo"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Golf Cart",
   Callback = function()
  local args = {
    "GolfCart"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Bugatti",
   Callback = function()
   local args = {
    "Bugatti"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Dune Buggy",
   Callback = function()
   local args = {
    "Buggy"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Jeep",
   Callback = function()
   local args = {
    "Jeep"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Police Car",
   Callback = function()
   local args = {
    "PoliceCar"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Race Car",
   Callback = function()
  local args = {
    "RaceCar"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
        end
})
local Button = homeTab:CreateButton({
   Name = "Tank",
   Callback = function()
   local args = {
    "Tank"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
    local Button = hoomeTab:CreateButton({
   Name = "ATV",
   Callback = function()
   local args = {
    "ATV"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})

local Button = homeTab:CreateButton({
   Name = "Bike",
   Callback = function()
   local args = {
    "Bike"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
    local Button = homeTab:CreateButton({
   Name = "Cyber Truck",
   Callback = function()
   local args = {
    "CyberTruck"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
    local Button = homeTab:CreateButton({
   Name = "Fire Truck",
   Callback = function()
   local args = {
    "FireTruck"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
local Button = homeTab:CreateButton({
   Name = "Monster Truck",
   Callback = function()
   local args = {
    "MonsterTruck"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
    local Button = homeTab:CreateButton({
   Name = "The Beast",
   Callback = function()
   local args = {
    "TheBeast"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
    local Button = homeTab:CreateButton({
   Name = "TungTung Mobile",
   Callback = function()
   local args = {
    "TungTungMobile"
}
game:GetService("ReplicatedStorage").CarSpawnEvent:FireServer(unpack(args))
   end,
})
