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

local Tab = Window:CreateTab("Buy", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Buy Grenade (1K)",

   Callback = function()local args = {

	"GrenadeWeapon"}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAction"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Restock Grenade (200Money)",

   Callback = function()local args = {

	"Grenades"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAmmo"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy Baseball (2.5k)",

   Callback = function()local args = {

	"BaseballWeapon"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAction"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Restock BaseBall (200Money)",

   Callback = function()local args = {

	"Baseballs"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAmmo"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy LandMines (5K)",

   Callback = function()local args = {

	"LandmineWeapon"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAction"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Restock LandMines (100Money)",

   Callback = function()local args = {

	"Landmines"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAmmo"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy slaphand (100Money)",

   Callback = function()local args = {

	"SlapHand"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAction"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy BowlingBall (6.5K)",

   Callback = function()local args = {

	"BowlingBallWeapon"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAction"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy Fireball (50K)",

   Callback = function()local args = {

	"FireballMagic"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAction"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy SmiteMagic (200K)",

   Callback = function()local args = {

	"SmiteMagic"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAction"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Buy gravity (1M)",

   Callback = function()local args = {

	"GravityWellMagic"

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("PurchaseAction"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("Auto", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Auto Get Money (rejoin for stop)",

   Callback = function()while true do

    local args = {

	106.47877502441406,

	vector.create(-18.58839225769043, 3.710418701171875, 0.04440941661596298)

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("DamageEvents"):WaitForChild("PhysicsDamage"):FireServer(unpack(args))

local args = {

	252.76406860351562,

	vector.create(0.007777094841003418, 3.1943986415863037, 0.14341013133525848)

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("DamageEvents"):WaitForChild("PhysicsDamage"):FireServer(unpack(args))

local args = {

	252.76406860351562,

	vector.create(0.007777094841003418, 3.1943986415863037, 0.14341013133525848)

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("DamageEvents"):WaitForChild("PhysicsDamage"):FireServer(unpack(args))

local args = {

	vector.create(-8.596359252929688, 4.3844194412231445, 0)

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("DamageEvents"):WaitForChild("SmiteDamage"):FireServer(unpack(args))

local args = {

	vector.create(-8.596359252929688, 4.3844194412231445, 0)

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("DamageEvents"):WaitForChild("SmiteDamage"):FireServer(unpack(args))

local args = {

	vector.create(3.355131149291992, 8.659073829650879, 0.001646110787987709)

}

game:GetService("ReplicatedStorage"):WaitForChild("Networking"):WaitForChild("Server"):WaitForChild("RemoteEvents"):WaitForChild("DamageEvents"):WaitForChild("VoidDamage"):FireServer(unpack(args))

wait()

end

   -- The function that takes place when the button is pressed

   end,

})