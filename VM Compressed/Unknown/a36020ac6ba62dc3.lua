local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local MainWindow = Rayfield:CreateWindow({
	Name = "Skaters Of Hell",
	LoadingTitle = "Loading...",
	LoadingSubtitle = "by WinX ",
	ConfigurationSaving = {
	   Enabled = false,
	   FolderName = nil, -- Create a custom folder for your hub/game
	   FileName = "McDonalds Hub"
	},
	Discord = {
	   Enabled = false,
	   Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD.
	   RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = true, -- Set this to true to use our key system
	KeySettings = {
	   Title = "WinX HUB",
	   Subtitle = "Key System",
	   Note = "Key:https://link-center.net/1428223/1T0YxQnn3pDM",
	   FileName = "SiriusKey",
	   SaveKey = false,
	   GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
	   Key = "SkatersOfHellWinX"
	}
 })


 local MainTab = MainWindow:CreateTab("Main", nil) -- Title, Image
local Section = MainTab:CreateSection("main")

 local Button = MainTab:CreateButton({
	Name = "Skip state",
	Callback = function(v)
		game:GetService("ReplicatedStorage").SkipIt:FireServer()
	end,
 })
local Button = MainTab:CreateButton({
	Name = "resetFull",
	Callback = function(v)
		game:GetService("ReplicatedStorage").ReSetFull:FireServer()
	end,
    })
 local MainTab = MainWindow:CreateTab("unlock Skate", nil) -- Title, Image
local Section = MainTab:CreateSection("main")

local Button = MainTab:CreateButton({
        
	Name = "Skate strawberry",
	Callback = function(v)
		local args = {
    "Strawberry",
    0,
    "Skate2"
}
game:GetService("ReplicatedStorage").BuySkates:FireServer(unpack(args))
	end,
    })
local Button = MainTab:CreateButton({
        
	Name = "Baby Blue",
	Callback = function(v)
local args = {
    "Baby Blue",
    0,
    "Skate3"
}
game:GetService("ReplicatedStorage").BuySkates:FireServer(unpack(args))
	end,
    })
local Button = MainTab:CreateButton({
        
	Name = "Classic skate",
	Callback = function(v)
local args = {
    "Classic",
    0,
    "Skate4"
}
game:GetService("ReplicatedStorage").BuySkates:FireServer(unpack(args))
	end,
    })
local Button = MainTab:CreateButton({
        
	Name = "Greenish skate",
	Callback = function(v)
local args = {
    "Greenish",
    0,
    "Skate5"
}
game:GetService("ReplicatedStorage").BuySkates:FireServer(unpack(args))
	end,
    })
local Button = MainTab:CreateButton({
        
	Name = "Magenta skate",
	Callback = function(v)
local args = {
    "Magenta",
    0,
    "Skate6"
}
game:GetService("ReplicatedStorage").BuySkates:FireServer(unpack(args))
	end,
    })
local Button = MainTab:CreateButton({
        
	Name = "Blueberry skate",
	Callback = function(v)
local args = {
    "BlueBerry",
    0,
    "Skate7"
}
game:GetService("ReplicatedStorage").BuySkates:FireServer(unpack(args))
	end,
    })
local Button = MainTab:CreateButton({
        
	Name = "Electric Blue skate",
	Callback = function(v)
local args = {
    "Electric Blue",
    0,
    "Skate8"
}
game:GetService("ReplicatedStorage").BuySkates:FireServer(unpack(args))
	end,
    })
local Button = MainTab:CreateButton({
        
	Name = "Neon green skate",
	Callback = function(v)
local args = {
    "Neon Green",
    0,
    "Skate9"
}
game:GetService("ReplicatedStorage").BuySkates:FireServer(unpack(args))
	end,
    })
local MainTab = MainWindow:CreateTab("Equip trails", nil) -- Title, Image
local Section = MainTab:CreateSection("main")

local Button = MainTab:CreateButton({
   Name = "cyan trails",
   Callback = function()
   local args = {
    "Cyan",
    "Trail2"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Pink trails",
   Callback = function()
  local args = {
    "Pink",
    "Trail3"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Black trails",
   Callback = function()
   local args = {
    "Black",
    "Trail4"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Sky trails",
   Callback = function()
  local args = {
    "Sky",
    "Trail5"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "RedDark trails",
   Callback = function()
   local args = {
    "RedDark",
    "Trail6"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Yellow trails",
   Callback = function()
   local args = {
    "Yellow",
    "Trail7"        
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Blue trails",
   Callback = function()
  local args = {
    "Blue",
    "Trail8"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Scary trails",
   Callback = function()
   local args = {
    "Scary",
    "Trail9"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Deep trails",
   Callback = function()
   local args = {
    "Deep",
    "Trail10"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Raindow trails",
   Callback = function()
   local args = {
    "Rainbow",
    "Trail11"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})
local Button = MainTab:CreateButton({
   Name = "Grey trails",
   Callback = function()
  local args = {
    "Grey",
    "Trail12"
}
game:GetService("ReplicatedStorage").EquipPower:FireServer(unpack(args))
   end,
})








 
