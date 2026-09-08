local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nondefined GUI - Interliminality",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Welcome...",
   LoadingSubtitle = "by Nondefined",
   ShowText = "Nondefined GUI", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean",

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Nondefined GUI, lol"
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

local Tab = Window:CreateTab("1 Chapter - 1 Episode", nil) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Shop location. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "The second location. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Director room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, -3, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Skinwalkers room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator"):WaitForChild("ElevatorButton")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(-3, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location shop2 room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, -3, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location chill zone room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location school room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, -3, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location school room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location cold room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Tab = Window:CreateTab("1 Chapter - 2 Episode", nil) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Location start room. Teleport to trigger part",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("FinalCutscene"):WaitForChild("Trigger")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Skinwalkers room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, -3, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Pool room. Teleport to plushe (Badge Collectable)",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("CollectablePlushie")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Pool room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Mannequins room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, -3, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Danger Mannequins room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location The Searcher elevator. Skip this level (teleport next level)",
   Callback = function()
        local event = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        event:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location The Patient monster room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, -3, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location ChannelSurfing. Skip this level (teleport next level)",
   Callback = function()
        local event = game.ReplicatedStorage:WaitForChild("ExitMap")
        event:FireServer()
   end,
})

local Tab = Window:CreateTab("1 Chapter - 3 Episode", nil) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Location Start room. Teleport to elevator",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitDoor")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Baby monster room. Unlock Door",
   Callback = function()
        local target = workspace:WaitForChild("ExitDoor"):WaitForChild("DoorPrompt")
        target.Enabled = true
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Parkour room. Teleport to plushe (Badge Collectable)",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("Collectables"):WaitForChild("CollectablePlushie")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Parkour room. Pls, just beat it",
   Callback = function()
        print("Beat the parkour, pls pls pls!!!")
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Vents. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Pictures room. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Puzzle room. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location TRAIN. Teleport to exit)",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitPart")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Tab = Window:CreateTab("2 Chapter - 1 Episode", nil) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Location Start room. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Just Cutscene room. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Fever. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location School. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Parking room. Teleport to plushe (Badge Collectable)",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("EntityPlushie")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})

local Button = Tab:CreateButton({
   Name = "Location Parking room. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Mannequins room. Skip the level",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Chill Zone room. Skip the level)",
   Callback = function()
        local target = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("TeleportEvent")
        target:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Location Skipping level room. Teleport to exit)",
   Callback = function()
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")
local target = workspace:WaitForChild("ExitElevator")

local cf

if target:IsA("Model") then
	cf = target:GetPivot()
else
	cf = target.CFrame * CFrame.new(0, 0, 0)
end

root.CFrame = cf


   end,
})