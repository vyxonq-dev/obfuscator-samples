
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Voidex hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "please wait",
   LoadingSubtitle = "by lolipop",
   ShowText = "voidex hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

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

local Tab = Window:CreateTab("VoidexHuIsOnTop", 4483362458) -- Title, Image

local Section = Tab:CreateSection("Main")

local Button = Tab:CreateButton({
   Name = "AUTO WIN FARM(kinda slow but still good)",
   Callback = function()
     while true do
   local plr = game.Players.LocalPlayer
   local hum = plr.Character:WaitForChild("Humanoid")
local root = plr.Character:WaitForChild("HumanoidRootPart")
local final = game.Workspace.World:WaitForChild("FinalCheckpoint")
local finalcframe = final.CFrame
if root and finalcframe then
  root.CFrame = finalcframe
  wait(0.3)
  hum.Health = 0
end
task.wait(4.5)
end

   end,
})

local Button = Tab:CreateButton({
   Name = "Troll random player (very blatant + use glove)",
   Callback = function()
   local plr = game.Players.LocalPlayer
local plrs = game.Players
local root = plr.Character:WaitForChild("HumanoidRootPart")
local tpdelay = 3
local allplrs = {}

for _, player in ipairs(plrs:GetPlayers()) do
  if player ~= plr then
    table.insert(allplrs, player)
  end
end

if #allplrs > 0 then
  local randomplr = allplrs[math.random(1, #allplrs)]
  local randroot = randomplr.Character:WaitForChild("HumanoidRootPart")
  while task.wait(0.05) do
    if not randroot.Parent then break end
    root.CFrame = randroot.CFrame 
  end
end
   end,
})


local Button = Tab:CreateButton({
   Name = "Remove spikes (if there any)",
   Callback = function()
   -- no more spikes mfs

local world = game.Workspace.World
for _, stage in ipairs(world:GetChildren()) do
  if stage:IsA("Model") then
    for _, spikes in ipairs(stage:GetChildren()) do
      if spikes:IsA("Script") then
        spikes:Destroy()
        else
          print("No spikes found, make sure there is a stage with spikes")
      end
    end
  end
end
  
   end,
})
  
  
local Button = Tab:CreateButton({
Name = "Teleport to rainbow carpet",
Callback = function()
   local obby = game.Workspace.World.Stuff
local giver = obby:WaitForChild("Rainbow Magic Carpet giver"):WaitForChild("Giver")
local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local target = giver.CFrame
if target and root then
  root.CFrame = target
end
   end,
})

local Button = Tab:CreateButton({
   Name = "DELEATE ALL MINES🔥(client-side) still works!! (can get hit by other plr's mines, also works kinda badly)",
   Callback = function()
   local world = game.Workspace.World

for _, stage in ipairs(world:GetChildren()) do
  for _, minefold in ipairs(stage:GetChildren()) do
    if minefold:IsA("Folder") and minefold.Name == stage.Name .."Mines" then
      minefold:Destroy()
      
      for _, script in ipairs(stage:GetChildren()) do
        if script:IsA("ServerScript")  then
          script:Destroy()
        end
      end
    end
  end
end
   end,
})


local Button = Tab:CreateButton({
   Name = "YOU NEED TO HAVE BOMB, GUI WILL APPEAR WITH INPUT FOR PLR'S NAME (gui made by chat gpt, main script by me, script under this button)",
   Callback = function()
   print("SCRIPT IS BELOW")
   
   end,
})

local Button = Tab:CreateButton({
   Name = "PASS THE BOMB!",
   Callback = function()
   

--// Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BombGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

--// Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.5, -125, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

--// Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.Text = "Bomb Giver"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.Parent = frame

--// Player Name Input
local nameBox = Instance.new("TextBox")
nameBox.PlaceholderText = "Enter player name"
nameBox.Size = UDim2.new(1, -20, 0, 30)
nameBox.Position = UDim2.new(0, 10, 0, 50)
nameBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
nameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
nameBox.Font = Enum.Font.Gotham
nameBox.TextSize = 14
nameBox.ClearTextOnFocus = false
nameBox.Parent = frame

--// Button
local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 30)
button.Position = UDim2.new(0, 10, 0, 90)
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.Text = "Give Bomb"
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 14
button.Parent = frame

--// Script Functionality
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local event = ReplicatedStorage:WaitForChild("GiveBomb")

button.MouseButton1Click:Connect(function()
	local name = nameBox.Text
	if name == "" then
		warn("Please enter a player name.")
		return
	end

	local plr = game.Players:FindFirstChild(name)
	if not plr then
		warn("Player not found.")
		return
	end

	event:FireServer(plr)
end)

   end,
})







local Button = Tab:CreateButton({
   Name = "Deleate all hammers (if there any)",
   Callback = function()

local world = game.Workspace.World
for _, stage in ipairs(world:GetChildren()) do
  for _, hamer in ipairs(stage:GetChildren()) do
    if hamer.Name == "Hammer" then
      hamer:Destroy()
        
    end
  end
end
   end,
})




local Button = Tab:CreateButton({
   Name = "🗣️🔥SUPER MEGA SKIBIDI OP INFINITE INVISIBLE MINES SPAM",
   Callback = function()
   

-- Prevent duplicate GUIs
if game.CoreGui:FindFirstChild("BombSwitchGui") then
	game.CoreGui.BombSwitchGui:Destroy()
end

local event = game.ReplicatedStorage:WaitForChild("PlantBomb")

--// GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BombSwitchGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = game.CoreGui

-- Main Frame
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 260, 0, 120)
Frame.Position = UDim2.new(0.5, -130, 0.75, 0)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 0
Frame.Active = false
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

-- Drag bar 
local DragBar = Instance.new("Frame")
DragBar.Size = UDim2.new(1, 0, 0, 20)
DragBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DragBar.BorderSizePixel = 0
DragBar.Active = true
DragBar.Parent = Frame

local DragCorner = Instance.new("UICorner")
DragCorner.CornerRadius = UDim.new(0, 10)
DragCorner.Parent = DragBar

-- Instruction Label
local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(1, -10, 0, 40)
InfoLabel.Position = UDim2.new(0, 5, 0, 25)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextWrapped = true
InfoLabel.TextScaled = true
InfoLabel.Text = "Hold for a bit to turn on/off, after turning on, a lot of mines will spawn where you walk,(gui is kinda buggy), Best way to farm coins so far!"
InfoLabel.Font = Enum.Font.GothamSemibold
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.Parent = Frame

-- Button
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(1, -20, 0, 40)
Button.Position = UDim2.new(0, 10, 0, 70)
Button.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
Button.Text = "OFF"
Button.TextScaled = true
Button.Font = Enum.Font.GothamBold
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.AutoButtonColor = true
Button.Parent = Frame

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = Button

--// Toggle logic
local active = false

local function toggle()
	active = not active
	if active then
		Button.BackgroundColor3 = Color3.fromRGB(60, 255, 100)
		Button.Text = "ON"
	else
		Button.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
		Button.Text = "OFF"
	end
end

-- Make it toggle instantly
Button.MouseButton1Click:Connect(toggle)
Button.TouchTap:Connect(toggle)

--// Smooth Drag (mobile + pc)
local UserInputService = game:GetService("UserInputService")
local dragging, dragStart, startPos

local function update(input)
	local delta = input.Position - dragStart
	Frame.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + delta.X,
		startPos.Y.Scale,
		startPos.Y.Offset + delta.Y
	)
end

DragBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Frame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		update(input)
	end
end)

--// Main loop (fires event while ON)
task.spawn(function()
	while task.wait(0.1) do
		if active then
			event:FireServer()
		end
	end
end)

   end,
})