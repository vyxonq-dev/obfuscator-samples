local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({

   Name = "Lheny Hub",

   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).

   LoadingTitle = "Rayfield Interface Suite",

   LoadingSubtitle = "by Me",

   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Get Money",

   Callback = function()local args = {

	5400000000000000}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]TryJump"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Auto Get Wins(world1)",

   Callback = function()while true do

    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]TryGetBanana"):FireServer()

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]TryGetBanana"):FireServer()

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]TryGetBanana"):FireServer()

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Auto Get Win (world2)",

   Callback = function()while true do

    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]TryGetBanana"):FireServer()

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Open Egg (16T)",

   Callback = function()local args = {

	"Egg6",

	5

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Luck"):WaitForChild("[C-S]DoLuck"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Obsidian chest",

   Callback = function()local args = {

	"Box_D"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Box"):WaitForChild("AddBox"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Prison chest",

   Callback = function()local args = {

	"Box_B"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Box"):WaitForChild("AddBox"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get luck potion",

   Callback = function()local args = {

	2

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Spin"):WaitForChild("GetReward"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Speed Potion",

   Callback = function()local args = {

	3

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Spin"):WaitForChild("GetReward"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Luck Potion (better)",

   Callback = function()local args = {

	4

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Spin"):WaitForChild("GetReward"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Azure latch chest",

   Callback = function()local args = {

	5

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Spin"):WaitForChild("GetReward"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Pet (1.5B)",

   Callback = function()local args = {

	6

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Spin"):WaitForChild("GetReward"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Stamina Potion",

   Callback = function()local args = {

	10

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Forever"):WaitForChild("ClaimReward"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Win Potion",

   Callback = function()local args = {

	13

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Forever"):WaitForChild("ClaimReward"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Hell Pigman Chest",

   Callback = function()local args = {

	19

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Forever"):WaitForChild("ClaimReward"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("Auto", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Auto Open Azure chest",

   Callback = function()while true do

    local args = {

	"Box_C"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Box"):WaitForChild("LuckOnce"):InvokeServer(unpack(args))

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Auto Open Obsidian Chest",

   Callback = function()while true do

    local args = {

	"Box_D"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Box"):WaitForChild("LuckOnce"):InvokeServer(unpack(args))

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Auto Open Prison Chest",

   Callback = function()while true do

    local args = {

	"Box_B"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("Box"):WaitForChild("LuckOnce"):InvokeServer(unpack(args))

wait()

end

   -- The function that takes place when the button is pressed

   end,

})