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

   Name = "Get Drageer (20K Star)",

   Callback = function()local args = {

	"Drageer",	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Blaze (16K Star)",

   Callback = function()local args = {

	"Blaze",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Foxy (12K Star)",

   Callback = function()local args = {

	"Foxy",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Zoom (9.5K Star)",

   Callback = function()local args = {

	"Zoom",

	"Zoom"

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Zotron (8.5K Star)",

   Callback = function()local args = {

	"Zotron",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Firefly (6.5K Star)",

   Callback = function()local args = {

	"Firefly",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Radion (5K Star)",

   Callback = function()local args = {

	"Radion",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Eruption (3.5K Star)",

   Callback = function()local args = {

	"Eruption",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Pegasus (2.5K Star)",

   Callback = function()local args = {

	"Pegasus",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Jet (1.5K Star)",

   Callback = function()local args = {

	"Jet",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Butterfly (1.2K Star)",

   Callback = function()local args = {

	"Butterfly",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Angel Blitz (1K Star)",

   Callback = function()local args = {

	"Angel Blitz",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Demon Blitz (1K Star)",

   Callback = function()local args = {

	"Demon Blitz",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Steampunk (850 Star)",

   Callback = function()local args = {

	"Steampunk",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Spike (750 Star)",

   Callback = function()local args = {

	"Spike",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Blastar (600 Star)",

   Callback = function()local args = {

	"Blastar",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Mermada (500 star)",

   Callback = function()local args = {

	"Mermada",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Maguma",

   Callback = function()local args = {

	"Maguma",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Shock (400 star)",

   Callback = function()local args = {

	"Shock",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Igno (325 Star)",

   Callback = function()local args = {

	"Igno",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get Plasmo (250 star)",

   Callback = function()local args = {

	"Plasmo",

	""

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GetStarterSnails"):InvokeServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})