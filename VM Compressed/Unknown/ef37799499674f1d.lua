local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

local Events = ReplicatedStorage:WaitForChild("Events")
local InvokeServerAction = Events:WaitForChild("InvokeServerAction")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
 Name = "Auto Win",
 LoadingTitle = "Skethboard simulator/Throw a basketball",
 LoadingSubtitle = "by BAPAK KAU",
 ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Main", 4483362458)
local Section = Tab:CreateSection("Auto Win Controls")

local selectedZone = "1"
local autoWin = false

Tab:CreateDropdown({
 Name = "Select Zone",
 Options = {"1","2","3","4","5","6","7","8","9"},
 CurrentOption = {"1"},
 MultiSelection = false,
 Callback = function(opt)
  selectedZone = opt[1]
 end
})

Tab:CreateToggle({
 Name = "Auto Win",
 CurrentValue = false,
 Flag = "AutoWinToggle",
 Callback = function(state)
  autoWin = state
  if state then
   task.spawn(function()
    while autoWin do
     local startZ, totalDistance, laps = 1000, 2500, 0
     local distance = root.Position.Z - startZ + laps * totalDistance
     local ok, res = pcall(function()
      return InvokeServerAction:InvokeServer("Gameplay", "Win", tonumber(selectedZone), distance)
     end)
     if ok then
      print(("[AutoWin] Zone %s | XP: %s"):format(selectedZone, tostring(res)))
     else
      warn("[AutoWin] Failed to send win:", res)
     end
     task.wait(0.5)
    end
   end)
  end
 end
})