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

local Tab = Window:CreateTab("Auto Heal", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Auto Heal",

   Callback = function()while true do

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Heal"):FireServer()

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("Choice (after get choice you can use inf)", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Tower",

   Callback = function()local args = {

	"Tower"}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Dice",

   Callback = function()local args = {

	"Dice"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Shuriken",

   Callback = function()local args = {

	"Shuriken"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Feather",

   Callback = function()local args = {

	"Feather"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Poison",

   Callback = function()local args = {

	"Poison"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Trident",

   Callback = function()local args = {

	"Trident"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Anchor",

   Callback = function()local args = {

	"Anchor"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Giant",

   Callback = function()local args = {

	"Giant"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Toxin",

   Callback = function()local args = {

	"Toxin"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Apple",

   Callback = function()local args = {

	"Apple"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Bloodluts",

   Callback = function()local args = {

	"Bloodlust"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Spades",

   Callback = function()local args = {

	"Spades"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Stick",

   Callback = function()local args = {

	"Stick"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Tornado",

   Callback = function()local args = {

	"Tornado"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Ammo",

   Callback = function()local args = {

	"Ammo"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Shades",

   Callback = function()local args = {

	"Shades"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Storm",

   Callback = function()local args = {

	"Storm"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Bandage",

   Callback = function()local args = {

	"Bandage"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Arrow",

   Callback = function()local args = {

	"Arrow"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Target",

   Callback = function()local args = {

	"Target"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("Misc", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Auto Collect Everthing",

   Callback = function()while true do

    local args = {

	"Amethyst"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Money"):FireServer(unpack(args))

local args = {

	"Coin"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Money"):FireServer(unpack(args))

local args = {

	"Sapphire"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Money"):FireServer(unpack(args))

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Collect All Rewards",

   Callback = function()local args = {

	"Spent8000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent20000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent45000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent70000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent100000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent200000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent300000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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

local Tab = Window:CreateTab("Auto Heal", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Auto Heal",

   Callback = function()while true do

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Heal"):FireServer()

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("Choice (after get choice you can use inf)", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Tower",

   Callback = function()local args = {

	"Tower"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Dice",

   Callback = function()local args = {

	"Dice"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Shuriken",

   Callback = function()local args = {

	"Shuriken"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Feather",

   Callback = function()local args = {

	"Feather"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Poison",

   Callback = function()local args = {

	"Poison"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Trident",

   Callback = function()local args = {

	"Trident"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Anchor",

   Callback = function()local args = {

	"Anchor"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Giant",

   Callback = function()local args = {

	"Giant"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Toxin",

   Callback = function()local args = {

	"Toxin"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Apple",

   Callback = function()local args = {

	"Apple"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Bloodluts",

   Callback = function()local args = {

	"Bloodlust"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Spades",

   Callback = function()local args = {

	"Spades"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Stick",

   Callback = function()local args = {

	"Stick"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Tornado",

   Callback = function()local args = {

	"Tornado"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Ammo",

   Callback = function()local args = {

	"Ammo"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Shades",

   Callback = function()local args = {

	"Shades"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Storm",

   Callback = function()local args = {

	"Storm"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Bandage",

   Callback = function()local args = {

	"Bandage"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Arrow",

   Callback = function()local args = {

	"Arrow"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Target",

   Callback = function()local args = {

	"Target"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Choice"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Tab = Window:CreateTab("Misc", 4483362458) -- Title, Image

local Button = Tab:CreateButton({

   Name = "Auto Collect Everthing",

   Callback = function()while true do

    local args = {

	"Amethyst"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Money"):FireServer(unpack(args))

local args = {

	"Coin"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Money"):FireServer(unpack(args))

local args = {

	"Sapphire"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Money"):FireServer(unpack(args))

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Collect All Rewards",

   Callback = function()local args = {

	"Spent8000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent20000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent45000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent70000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent100000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent200000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

local args = {

	"Spent300000"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Reward"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})