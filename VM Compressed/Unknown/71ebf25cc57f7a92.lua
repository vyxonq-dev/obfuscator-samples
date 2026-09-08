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

   Name = "Auto Click",

   Callback = function()while true do

    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Hit"):FireServer()

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Hit"):FireServer()

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Hit"):FireServer()

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Hit"):FireServer()

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Open Egg (5 Win)",

   Callback = function()local args = {

	"1Egg",	"Castle1"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Open Egg (50 Win)",

   Callback = function()local args = {

	"1Egg",

	"Castle2"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Auto Win",

   Callback = function()while true do

    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("StartRun"):FireServer()

local args = {

	0.99968866595391805

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("FinishRun"):FireServer(unpack(args))

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Auto Equip Best Pet",

   Callback = function()while true do

    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("EquipBest"):FireServer()

wait(10)

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Open Egg (125 Win)",

   Callback = function()local args = {

	"1Egg",

	"Castle3"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Auto Event Roll",

   Callback = function()while true do

    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("DoEventRoll"):InvokeServer()

wait(3)

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy Egg (2.5K Win)",

   Callback = function()local args = {

	"1Egg",

	"Farm1"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy Egg (12K Win)",

   Callback = function()local args = {

	"1Egg",

	"Farm2"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy Egg (65K Win)",

   Callback = function()local args = {

	"1Egg",

	"Farm3"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get All LuckBlock",

   Callback = function()local args = {

	1

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	2

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	3

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	4

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	5

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	6

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	7

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	8

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	9

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	10

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	11

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	12

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	13

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	14

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	15

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

local args = {

	16

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("CollectLuckyblock"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Open Egg (96K Win)",

   Callback = function()local args = {

	"1Egg",

	"Honey1"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Open Egg (480K Win)",

   Callback = function()local args = {

	"1Egg",

	"Honey2"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Open Egg (2.4M Win)",

   Callback = function()local args = {

	"1Egg",

	"Honey3"

}

game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Pet"):WaitForChild("BuyEgg"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})