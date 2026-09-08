local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Hikarl",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Hi Exploiters",
   LoadingSubtitle = "by Karl",
   ShowText = "karkHub", -- for mobile users to unhide rayfield, change if you'd like
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
   Title = "README",
   Content = "The auto buy sometimes not buying so wait for 2 minutes",
   Duration = 10,
   Image = nil,
})

local Main1Tab = Window:CreateTab("🔥Auto Equip Brainrot🔥", nil) -- Title, Image
local MainSection = Main1Tab:CreateSection("Auto Equip")



local Main2Tab = Window:CreateTab("🔥Auto Plant Seed🔥", nil) -- Title, Image
local Main2Section = Main2Tab:CreateSection("Auto Plant")

local Toggle = Main1Tab:CreateToggle({
   Name = "🔥Auto Equip Best☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
   game:GetService("ReplicatedStorage").Remotes.EquipBestItemRE:FireServer()
task.wait(10)
end
   end,
})

local Toggle = Main1Tab:CreateToggle({
   Name = "🔥Auto Boss Battle☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
       game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StartChallengeRE"):FireServer()
       task.wait(100)
end
   end,
})

local MainTab = Window:CreateTab("🔥Auto Buy Items🔥", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Auto Buy")

local Toggle = MainTab:CreateToggle({
   Name = "Normal Bucket☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
     for i = 1, 5 do
local args = {
   [1] = "ResourceStore",
    [2] = "BUCKET_F1",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.StoreBuyRF:InvokeServer(unpack(args))
task.wait(1)
    end
    task.wait(120)
end
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Iron Bucket☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
   for i = 1, 5 do
local args = {
    [1] = "ResourceStore",
    [2] = "BUCKET_E1",
    [3] = 1
}

      game:GetService("ReplicatedStorage").Remotes.StoreBuyRF:InvokeServer(unpack(args))
      task.wait(1)
    end

    task.wait(123)
end
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Golden Bucket☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    for i = 1, 3 do
        local args = {
            [1] = "ResourceStore",
            [2] = "BUCKET_M1",
            [3] = 1
        }

        game:GetService("ReplicatedStorage").Remotes.StoreBuyRF:InvokeServer(unpack(args))
        task.wait(0.5) -- small delay to avoid spam/kick
    end

    task.wait(125) -- wait after 3 buys
end
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Diamond Bucket☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
     for i = 1, 3 do
  local args = {
	"ResourceStore",
	"BUCKET_D1",
	1
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StoreBuyRF"):InvokeServer(unpack(args))
task.wait(1)
end
task.wait(127)
end
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Freeze Granade☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
     for i = 1,5 do
local args = {
    [1] = "ResourceStore",
    [2] = "BOOM_R1",
    [3] = 1
}

game:GetService("ReplicatedStorage").Remotes.StoreBuyRF:InvokeServer(unpack(args))
task.wait(1)
     end
task.wait(129)
end 
   end,
})


local Toggle = MainTab:CreateToggle({
   Name = "Wooden Stick☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do 
   for i = 1, 5 do 
local args = {
	"ResourceStore",
	"BAT_F1",
	1
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StoreBuyRF"):InvokeServer(unpack(args))
task.wait(1)
end
task.wait(132)
end
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Shuriken☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
     for i = 1, 5 do
local args = {
	"ResourceStore",
	"GUN_R1",
	1
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StoreBuyRF"):InvokeServer(unpack(args))
task.wait(1)
end
task.wait(133)
end
   end,
})

local Toggle = Main2Tab:CreateToggle({
   Name = "Auto Plant Cactus☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    for i = 1, 49 do
        local args = {
            [1] = i,
            [2] = "IT_SEED_L1",
            [3] = true
        }

       game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceSlotRE"):FireServer(unpack(args))
        task.wait(10)
    end
end
--Cactus SEED
   end,
})

local Toggle = Main2Tab:CreateToggle({
   Name = "Auto Plant Corn☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  while true do
    for i = 1, 49 do
        local args = {
            [1] = i,
            [2] = "IT_SEED_M2",
            [3] = true
        }

       game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceSlotRE"):FireServer(unpack(args))
        task.wait(10)
    end
end
--CornSEED
   end,
})

local Toggle = Main2Tab:CreateToggle({
   Name = "Auto Plant jalapeno☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    while true do
    for i = 1, 49 do
        local args = {
            [1] = i,
            [2] = "IT_SEED_L3",
            [3] = true
        }

       game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceSlotRE"):FireServer(unpack(args))
        task.wait(10)
    end
end
   end,
})

local Toggle = Main2Tab:CreateToggle({
   Name = "Auto Plant DevilFlowe☠️",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    for i = 1, 49 do
        local args = {
            [1] = i,
            [2] = "IT_SEED_D1",
            [3] = true
        }

       game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceSlotRE"):FireServer(unpack(args))
        task.wait(10)
    end
end
   end,
})

local Button = Main2Tab:CreateButton({
   Name = "You need to rejoin just to off the auto plant",
   Callback = function()
     print("We love you!!")
   end,
})

 --[[while true do
    for i = 1, 49 do
        local args = {
            [1] = i,
            [2] = "IT_SEED_D1",
            [3] = true
        }

       game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceSlotRE"):FireServer(unpack(args))
        task.wait(10)
    end
end]]





--[[local args = {
	43,
	"IT_SEED_D1",
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceSlotRE"):FireServer(unpack(args)) 
--Devilflower SEED

--[[local args = {
	36,
	"IT_SEED_M2",
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceSlotRE"):FireServer(unpack(args))
--CornSEED]]

--[[]]
--loadstring(game:HttpGet("https://pastefy.app/vjarmJ5J/raw"))()

