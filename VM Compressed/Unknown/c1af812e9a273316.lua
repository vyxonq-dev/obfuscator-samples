local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Gear Giver GUI 1.5",
   Theme = "Dark",
   LoadingTitle = "Loading...",
   LoadingSubtitle = "made by hyper",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Gear Hub"
   },

KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Gear giver Gui",
      Subtitle = "Key System",
      Note = "Key Is Gear Giver",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true,-- , -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Gear Giver"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Tools")

local Button = Tab:CreateButton({
   Name = "Load Tools Giver V2",
   Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/qpbQo0lr/raw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load Tools Giver V1",
   Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/bfyJbBkd/raw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load Patrick Tools Giver",
   Callback = function()
    loadstring(game:HttpGet(('https://pastefy.app/VYIAk3o1/raw'),true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Load admin Tools Giver (only works for prison life)",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/AZVi2tuK"))()
   end,
})

local Button = Tab:CreateButton({
  Name = "ninjabart122's ROBLOX Tablet",
   Callback = function()
    --tablet
_G.tablet = game:GetObjects('rbxassetid://99641902')[1]
_G.tablet.Parent = game.Players.LocalPlayer.Backpack
_G.tablet.Equipped:Connect(function()
local Sound = Instance.new("Sound") 
local Id = "58479849"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 3
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Call Me A CellPhone",
   Callback = function()
    --tablet
_G.tablet = game:GetObjects('rbxassetid://88146505')[1]
_G.tablet.Parent = game.Players.LocalPlayer.Backpack
_G.tablet.Equipped:Connect(function()
local Sound = Instance.new("Sound") 
local Id = "58520081"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 3
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "ROBLOX Portable Game System (RPGS)",
   Callback = function()
    --tablet
_G.tablet = game:GetObjects('rbxassetid://58574445')[1]
_G.tablet.Parent = game.Players.LocalPlayer.Backpack
_G.tablet.Equipped:Connect(function()
local Sound = Instance.new("Sound") 
local Id = "267261112"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 3
end)
   end,
})


local Button = Tab:CreateButton({
   Name = "Goala Cola",
   Callback = function()
    --tablet
_G.tablet = game:GetObjects('rbxassetid://28672001')[1]
_G.tablet.Parent = game.Players.LocalPlayer.Backpack
_G.tablet.Equipped:Connect(function()
local Sound = Instance.new("Sound") 
local Id = "28490593"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 3
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Larry’s Night Guard Flashlight",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/0R8tujtA"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "RAIG Table",
   Callback = function()
    --tablet
_G.tablet = game:GetObjects('rbxassetid://110789105')[1]
_G.tablet.Parent = game.Players.LocalPlayer.Backpack
_G.tablet.Equipped:Connect(function()
local Sound = Instance.new("Sound") 
local Id = "111896685"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 3
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Jack O' Splosion",
   Callback = function()
    --tablet
_G.tablet = game:GetObjects('rbxassetid://62803173')[1]
_G.tablet.Parent = game.Players.LocalPlayer.Backpack
_G.tablet.Equipped:Connect(function()
local Sound = Instance.new("Sound") 
local Id = "13378571"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 3
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Cowbell",
   Callback = function()
    --tablet
_G.tablet = game:GetObjects('rbxassetid://20373160')[1]
_G.tablet.Parent = game.Players.LocalPlayer.Backpack
_G.tablet.Equipped:Connect(function()
local Sound = Instance.new("Sound") 
local Id = "20005706"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 3
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Wall Walker",
   Callback = function()
    --tablet
_G.tablet = game:GetObjects('rbxassetid://35683911')[1]
_G.tablet.Parent = game.Players.LocalPlayer.Backpack
_G.tablet.Equipped:Connect(function()
local Sound = Instance.new("Sound") 
local Id = "32347162"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 3
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Korblox Mage Staff",
   Callback = function()
--Staff
_G.staff = game:GetObjects('rbxassetid://127506105')[1]
_G.staff.Parent = game.Players.LocalPlayer.Backpack
_G.staff.Equipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 40
local Sound = Instance.new("Sound") 
local Id = "30583931"
Sound.Parent = game.Workspace
Sound.SoundId = "rbxassetid://"..Id
Sound.Playing = true
Sound.Looped = false
Sound.Volume = 1
end)
_G.staff.Unequipped:Connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Blue Hyperlaser gun",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/8KrWxdNj"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Red Hyperlaser gun",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Eh8uJ8Ci"))()
   end,
})

local Tab = Window:CreateTab("Extra Tools")

local Button = Tab:CreateButton({
   Name = "Speed tool",
   Callback = function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Speed Tool"
tool.Activated:connect(function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 60
end)
tool.Parent = game.Players.LocalPlayer.Backpack
   end,
})


local Button = Tab:CreateButton({
   Name = "Jump tool",
   Callback = function() 
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Jump Tool"
tool.Activated:connect(function()
game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
end)
tool.Parent = game.Players.LocalPlayer.Backpack
   end,
})


local Button = Tab:CreateButton({
   Name = "Gravity tool",
   Callback = function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Gravity Tool"
tool.Activated:connect(function()
game.workspace.Gravity = 100
end)
tool.Parent = game.Players.LocalPlayer.Backpack
   end,
})


local Button = Tab:CreateButton({
   Name = "Teleport tool",
   Callback = function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "Teleport tool"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
   end,
})

local Tab = Window:CreateTab("Doors Tools")

local Button = Tab:CreateButton({
   Name = "Magnet",
   Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Golden Flashlight",
   Callback = function()
loadstring(game:HttpGet(("https://raw.githubusercontent.com/aadyian9000/the-thing/main/GoldenGummyFlashlight.lua"),true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Infinite Vitamins",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/refs/heads/main/Inf_Vitamins.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Shears On Anything",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/z2EUuziF"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Pink Tablet",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/umRteEPy​"))()
   end,
})

local Tab = Window:CreateTab("Misc")

local Button = Tab:CreateButton({
   Name = "Click To See Key Status",
   Callback = function()
    -- Notification library
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest"))();
 local Notify = Notification.Notify;

 Notify({
		 Description = "Key Status in never";
		 Title = "Key";
		 Duration = 20;
		 
});
   end,
})

local Button = Tab:CreateButton({
   Name = "Load ECCS Gear Giver",
   Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Dhgnt7hi"))("Copyright SHON ECCS Co")
   end,
})

local Button = Tab:CreateButton({
   Name = "Unload Ui",
   Callback = function()
    Rayfield:Destroy()
   end,
})

local Button = Tab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Use Command [Enable Inventory] to enable your inventory in doors and evade",
   Callback = function()
   end,
})
