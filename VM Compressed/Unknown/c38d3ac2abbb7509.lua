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

local Tab = Window:CreateTab("", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Get Crazy things",

   Callback = function()local args = {

	"Cash",	99999999999999999

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddValueEvent"):FireServer(unpack(args))

local args = {

	999999999999999

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GemEvent"):FireServer(unpack(args))

local args = {

	"Spins",

	9999999999

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddRewardEvent"):FireServer(unpack(args))

local args = {

	"Rainbow",

	50

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("BuyTrailEvent"):FireServer(unpack(args))

local args = {

	"Rainbow"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EquipTrailEvent"):FireServer(unpack(args))

local args = {

	"CashRateLevel",

	41,

	589560

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

local args = {

	"LuckyMergeLevel",

	41,

	3000

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

local args = {

	"AutoMergeLevel",

	21,

	104857600000000

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

local args = {

	"MaxBlocksLevel",

	21,

	16200

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

local args = {

	"SpawnRateLevel",

	30,

	720

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Rebirth",

   Callback = function()local args = {

	50,

	0,

	150

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RebirthConfirmEvent"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Upgrade SpawnTier",

   Callback = function()local args = {

	"SpawnTierLevel",

	90,

	720

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpgradeEvent"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Spawn Brainrot (50)",

   Callback = function()local args = {

	"Blocks",

	50

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("AddRewardEvent"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("Settings", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Turn Off Camera shake",

   Callback = function()local args = {

	"CamShake",

	false

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SettingsEvent"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})