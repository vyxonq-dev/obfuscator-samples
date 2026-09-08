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

   Name = "Auto  exp gems (wait until gift comes)",

   Callback = function()while true do

    local args = {

	"Claim",	2

}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Gift"):FireServer(unpack(args))

local args = {

	"Claim",

	1

}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Gift"):FireServer(unpack(args))

local args = {

	"Claim",

	3

}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Gift"):FireServer(unpack(args))

local args = {

	"Claim",

	4

}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Gift"):FireServer(unpack(args))

wait()

end

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Start Bloodmoon (just visual i think)",

   Callback = function()local args = {

	"BloodMoonStarted"

}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BloodMoon"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Stop Bloodmoon",

   Callback = function()local args = {

	"BloodMoonFinished"

}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("BloodMoon"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})

local Button = Tab:CreateButton({

   Name = "Get 10X Pet (you need wait the gift)",

   Callback = function()local args = {

	"Claim",

	5

}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Gift"):FireServer(unpack(args))

   -- The function that takes place when the button is pressed

   end,

})