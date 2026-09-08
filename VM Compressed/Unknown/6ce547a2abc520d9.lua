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

   Name = "Slide (World1)",

   Callback = function()local args = {

	"Slide",	workspace:WaitForChild("Maps"):WaitForChild("Map_1")

}

game:GetService("ReplicatedStorage"):WaitForChild("R_Server"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Equip Rider",

   Callback = function()local args = {

	"Equip_Rider",

	"Unequipped",

	"Rider_71"

}

game:GetService("ReplicatedStorage"):WaitForChild("R_Server"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Equip Tank",

   Callback = function()local args = {

	"Equip_Rider",

	"Unequipped",

	"Rider_Tank_Pass"

}

game:GetService("ReplicatedStorage"):WaitForChild("R_Server"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("Get Pets", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Cappuccino diamond",

   Callback = function()local args = {

	"Give_Pet",

	"Pet_Cappuccino_Diamond"

}

game:GetService("ReplicatedStorage"):WaitForChild("R_Pets"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "chimpanzinibanini",

   Callback = function()local args = {

	"Give_Pet",

	"Pet_Chimpanzini_Bananini"

}

game:GetService("ReplicatedStorage"):WaitForChild("R_Pets"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Baby_Tralalero_Diamond",

   Callback = function()local args = {

	"Give_Pet",

	"Pet_Baby_Tralalero_Diamond"

}

game:GetService("ReplicatedStorage"):WaitForChild("R_Pets"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "EasterIce",

   Callback = function()local args = {

	"Give_Pet",

	"Pet_EasterIce"

}

game:GetService("ReplicatedStorage"):WaitForChild("R_Pets"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("TP", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Tp End (World 1 You cant get win)",

   Callback = function()local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart

rootPart.CFrame = CFrame.new(12.5410004, 7018.66309, 15101.0166, 0, 0, 1, 1, 0, 0, 0, 1, 0)

-- teleport

   -- The function that takes place when the button is pressed

   end,

})