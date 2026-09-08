local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "LakeHub / Lakeview RP 🏡",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "by Semyon",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Lakeview RP 🏡"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local PlayerTab = Window:CreateTab("Truck", "truck")
local Button = PlayerTab:CreateButton({
   Name = "Sleeper Semi Truck",
   Callback = function()
   
local args = {
	"Spawn",
	"Sleeper Semi Truck"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))

   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Flat Semi Truck",
   Callback = function()
   
local args = {
	"Spawn",
	"Flat Semi Truck"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))

   end,
})


local PlayerTab = Window:CreateTab("VIP Trailers", "caravan")
local Button = PlayerTab:CreateButton({
   Name = "Large Camper",
   Callback = function()
   local args = {
	"Spawn",
	"Large Camper"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Toy Hauler Camper",
   Callback = function()
   local args = {
	"Spawn",
	"Toy Hauler Camper"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Logger",
   Callback = function()
   local args = {
	"Spawn",
	"Logger"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Semi Trailer",
   Callback = function()
   local args = {
	"Spawn",
	"Semi Trailer"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Flatbed Semi Trailer",
   Callback = function()
   local args = {
	"Spawn",
	"Flatbed Semi Trailer"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Fishing Boat Trailer",
   Callback = function()
   local args = {
	"Spawn",
	"Fishing Boat Trailer"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Yacht Trailer",
   Callback = function()
   local args = {
	"Spawn",
	"Yacht Trailer"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local PlayerTab = Window:CreateTab("Helicopters", "plane")
local Button = PlayerTab:CreateButton({
   Name = "Small Helicopter",
   Callback = function()
   local args = {
	"Spawn",
	"Small Helicopter"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Police Helicopter",
   Callback = function()
   local args = {
	"Spawn",
	"Police Helicopter"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Emergency Helicopter",
   Callback = function()
   local args = {
	"Spawn",
	"Emergency Helicopter"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})
local Label = PlayerTab:CreateLabel("CAN BE SPAWNED AT EMPTY SPOT", "info")

local PlayerTab = Window:CreateTab("Vehicles", "car")
local Button = PlayerTab:CreateButton({
   Name = "Green Armored Humvee",
   Callback = function()
   local args = {
	"Spawn",
	"Green Armored Humvee"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Armored Humvee",
   Callback = function()
   local args = {
	"Spawn",
	"Armored Humvee"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Sports Car",
   Callback = function()
   local args = {
	"Spawn",
	"Sports Car"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Rugged Pickup",
   Callback = function()
   local args = {
	"Spawn",
	"Rugged Pickup"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Tactical Truck (SPECIAL FORCE)",
   Callback = function()
   local args = {
	"Spawn",
	"Tactical Truck"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Park Ranger Pickup",
   Callback = function()
   
local args = {
	"Spawn",
	"Park Ranger Pickup"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))

   end,
})

local PlayerTab = Window:CreateTab("Hide Lakeview", "eye-off")
local Button = PlayerTab:CreateButton({
   Name = "Click to Hide",
   Callback = function()
   local element = game:GetService("Players").LocalPlayer.PlayerGui.LoadingScreen:GetChildren()[3]:GetChildren()[4]
element.Visible = false

   end,
})

local PlayerTab = Window:CreateTab("Houses", "home")
local Button = PlayerTab:CreateButton({
   Name = "Log Cabin",
   Callback = function()
   local args = {
	"SpawnHouse",
	"Log Cabin"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Military Base",
   Callback = function()
   local args = {
	"SpawnHouse",
	"Military Base"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Mansion",
   Callback = function()
   local args = {
	"SpawnHouse",
	"Mansion"
}
game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))


   end,
})
local Label = PlayerTab:CreateLabel("Make sure to buy a plot, and when ure in the house selector menu, just select the house you want from this menu ", "info")


local PlayerTab = Window:CreateTab("CASH", "dollar-sign")
local Button = PlayerTab:CreateButton({
   Name = "GET 1 MILLION",
   Callback = function()
local amountToAdd = -1000000 

local args = {
	"EconomyWithdraw",
	amountToAdd,
	"Free Money" 
}


local remoteFunction = game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteFunction")



remoteFunction:InvokeServer(unpack(args))

print("Sent request to add money!")

	

   end,
})
local PlayerTab = Window:CreateTab("Fire Starter", "flame")
local Button = PlayerTab:CreateButton({
   Name = "ENABLE CKICK FIRE",
   Callback = function()
   local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()

local remoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("RemoteEvent")

local debounce = false
local cooldown = 0

local function onPlayerClick()
    if debounce then
        return
    end
    debounce = true

    local clickPosition = mouse.Hit.p

    local args = {
        "firestarter",
        clickPosition
    }

    remoteEvent:FireServer(unpack(args))

    task.wait(cooldown)
    debounce = false
end

mouse.Button1Down:Connect(onPlayerClick)
   end,
})
local Label = PlayerTab:CreateLabel("REMEMBER, U CAN'T DISABLE THIS, U HAVE TO REJOIN", "triangle-alert")
local Label = PlayerTab:CreateLabel("HOW IT WORKS?: ENABLE IT AND CLICK ANYWHERE TO START A FIRE", "info")
local Button = PlayerTab:CreateButton({
   Name = "REJOIN BUTTON!",
   Callback = function()
   local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

 

ts:Teleport(game.PlaceId, p)
   end,
})
local PlayerTab = Window:CreateTab("Credits", "code")
local Label = PlayerTab:CreateLabel("Semyon", "user-cog")
local Label = PlayerTab:CreateLabel("Rayfield UI", "droplet")
