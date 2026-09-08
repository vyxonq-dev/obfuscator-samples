local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "KArl Hub-V1.5",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Hi<3",
   LoadingSubtitle = "by KArl",
   ShowText = "KArlHub", -- for mobile users to unhide rayfield, change if you'd like
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
      Invite = "u2TGHjNRRp", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key_on_Discord",
      Subtitle = "JOIN TO MY DISCORD pls",
      Note = "key here = https://discord.gg/u2TGHjNRRp", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"ilovenuggets"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Main1Tab = Window:CreateTab("Main🏠", nil) -- Title, Image
local Section = Main1Tab:CreateSection("Online Claim")


local Toggle = Main1Tab:CreateToggle({
   Name = "Auto Claim Gift",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    for i = 1, 12 do
        local args = {
            "GetOnlineGift",
            i
        }

        game:GetService("ReplicatedStorage")
            :WaitForChild("RemoteEvent")
            :WaitForChild("ServerRemoteEvent")
            :FireServer(unpack(args))

        task.wait(0.3)
    end

    task.wait(30)
end

   end,
})

local Section = Main1Tab:CreateSection("Super Seed Event")

local Toggle = Main1Tab:CreateToggle({
   Name = "Auto Claim Event",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    for i = 1, 7 do
        local args = {
            "Business",
            "\229\133\145\230\141\162\230\153\174\233\128\154\230\180\187\229\138\168\229\165\150\229\138\177",
            i
        }

        game:GetService("ReplicatedStorage")
            :WaitForChild("RemoteEvent")
            :WaitForChild("ServerRemoteEvent")
            :FireServer(unpack(args))

        task.wait(0.5)
    end

    task.wait(60) -- wait before restarting 1→7
end

   end,
})

local Section = Main1Tab:CreateSection("Seed Event")

local Toggle = Main1Tab:CreateToggle({
   Name = "Auto Claim",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   while true do
local args = {
	"OpenEventEgg",
	2
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))
task.wait(0.2)
end 
   end,
})

local Section = Main1Tab:CreateSection("Spin The wheel")


local Toggle = Main1Tab:CreateToggle({
   Name = "Auto Spin",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
       local args = {
	"OpenSpecialEgg",
	"\232\189\172\231\155\152\232\155\139"
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))
       task.wait(1)
       end
   end,
})

local Toggle = Main1Tab:CreateToggle({
   Name = "Auto Fight Boss",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
     local args = {
    [1] = "Business",
    [2] = "\228\184\150\231\149\140Boss",
    [3] = 1,
    [4] = 1
}

game:GetService("ReplicatedStorage").RemoteEvent.ServerRemoteEvent:FireServer(unpack(args))
task.wait(10)
       end
   end,
})

local Button = Main1Tab:CreateButton({
   Name = "Redeem All Codes",
   Callback = function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

local codes = {
    "UPDATE1",
    "UPDATE2",
    "UPDATE3",
    "UPDATE4",
    "kgfruit",
    "CRYSTAL500",
    "Fuse777",
    "Best999",
    "Redress",
    "VIP888",
    "Grow888",
    "New666",
    "CRYSTAL1",
    "CRYSTAL2",
    "ITEMS100"
}

for _, code in ipairs(codes) do
    pcall(function()
        Remote:FireServer("GetCode", code)
    end)
    task.wait(2) -- wait 2 seconds between codes to avoid server ignoring requests
end
     end,
})

local Section = Main1Tab:CreateSection("Once you on the button it won't stop.")


local MainTab = Window:CreateTab("Auto Buy🏪", nil) -- Title, Image
local Section = MainTab:CreateSection("Auto Buy Seed🌾")

local Toggle = MainTab:CreateToggle({
   Name = "Tomato Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Pumpkin Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    for i = 1, 20 do
        remote:FireServer(
            "Buy_ArrayBool_Item",
            "\231\167\141\229\173\144",
            2
        )
        task.wait(0.2)
    end

    -- wait before starting the next 20 buys (optional)
    task.wait(1)
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Melon Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    -- buy 20 times
    for i = 1, 20 do
        remote:FireServer(
            "Buy_ArrayBool_Item",
            "\231\167\141\229\173\144", -- melon
            3
        )
        task.wait(0.2)
    end

    -- delay before repeating the 20 buys (optional)
    task.wait(1)
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Mini Corn Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    local args = {
	"Buy_ArrayBool_Item",
	"\231\167\141\229\173\144",
	4
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))
task.wait(0.2)
end
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Mushroom Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        5
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Cactus Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        6
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Sunflower Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        8
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Broccoli Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        7
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Chrysanthemum Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        9
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Peashooter Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        10
    )

    task.wait(1) -- 1 second delay between each buy
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Corn Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        11
    )

    task.wait(1) -- 1 second delay (infinite)
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Cactus Flower Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144", -- Cactus flower
        12
    )

    task.wait(1) -- 1 second delay between each buy
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Threepeater Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144", -- item
        14
    )

    task.wait(1) -- 1 second delay between each buy
end

   end,
})


local Toggle = MainTab:CreateToggle({
   Name = "Fire Peashooter Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        13
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Man-Eating Flower Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        15
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Alien Onion Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        16
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Capsid Brute Seed",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\231\167\141\229\173\144",
        17
    )

    task.wait(1) -- 1 second delay between buys
end

   end,
})


local Main3Tab = Window:CreateTab("Auto Buy Gear⚙️", nil) -- Title, Image
local Section = Main3Tab:CreateSection("Auto Buy Gear⚙️")

local Toggle = Main3Tab:CreateToggle({
   Name = "Water Bucket",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
     local args = {
	"Buy_ArrayBool_Item",
	"\233\129\147\229\133\183",
	1
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))
task.wait(0.2)
end
   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Yellow Bucket",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
  local args = {
	"Buy_ArrayBool_Item",
	"\233\129\147\229\133\183",
	9
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))
 task.wait(0.2)
  end
   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Purple Bucket",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    --purpole
local args = {
	"Buy_ArrayBool_Item",
	"\233\129\147\229\133\183",
	11
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))

  task.wait(0.2)
end 
   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Orange Bucket",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    local args = {
	"Buy_ArrayBool_Item",
	"\233\129\147\229\133\183",
	10
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))

  task.wait(0.2)
end 
   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Granade",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
    --granade
local args = {
	"Buy_ArrayBool_Item",
	"\233\129\147\229\133\183",
	2
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))

  task.wait(0.2)
end 
   end,
})


local Section = Main3Tab:CreateSection("Auto Buy Fruits🍉")

local Toggle = Main3Tab:CreateToggle({
   Name = "Reversion Fruit",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\233\129\147\229\133\183",
        8
    )

    task.wait(1) 
end

   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Frozen Fruit",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     while true do
     local args = {
	"Buy_ArrayBool_Item",
	"\233\129\147\229\133\183",
	3
}
game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent"):FireServer(unpack(args))
task.wait(0.2)
end
   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Flame Fruit",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\233\129\147\229\133\183",
        10
    )

    task.wait(1) 
end

   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Venom Fruit",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\233\129\147\229\133\183",
        5
    )

    task.wait(1) 
end

   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Darkness Fruit",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

local args = {
    "Buy_ArrayBool_Item",
    "\233\129\147\229\133\183",
    6
}

while true do
    pcall(function()
        Remote:FireServer(unpack(args))
    end)
    
    task.wait(1.5) -- 6161
end

   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Bomb Fruit",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
     local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\233\129\147\229\133\183",
        7
    )

    task.wait(1) -- 6767
end
   end,
})

local Toggle = Main3Tab:CreateToggle({
   Name = "Kg Fruit",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("RemoteEvent"):WaitForChild("ServerRemoteEvent")

while true do
    remote:FireServer(
        "Buy_ArrayBool_Item",
        "\233\129\147\229\133\183",
        12
    )

    task.wait(1) 
end

   end,
})

local Main2Tab = Window:CreateTab("Test1", nil) -- Title, Image
local Section = Main2Tab:CreateSection("Message!")

local Button = Main2Tab:CreateButton({
   Name = "We still adding features! ",
   Callback = function()
   print("We love you")
   end,
})

