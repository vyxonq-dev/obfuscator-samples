local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
Name = "Utility Hub",
LoadingTitle = "Rayfield Hub",
LoadingSubtitle = "Auto Tap & Anti-Near TP",
ConfigurationSaving = { Enabled = false },
KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)
MainTab:CreateSection("Automation Features")

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer

--== AUTO TAP CENTER ==--
local autoTap = false
MainTab:CreateToggle({
Name = "Auto Tap (Center Screen)",
CurrentValue = false,
Callback = function(state)
autoTap = state
if state then
Rayfield:Notify({ Title = "Auto Tap", Content = "Started tapping at center", Duration = 3 })
task.spawn(function()
while autoTap do
task.wait(0.2)
local screenSize = workspace.CurrentCamera.ViewportSize
local pos = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
pcall(function()
VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 1)
task.wait(0.05)
VirtualInputManager:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 1)
end)
end
end)
else
Rayfield:Notify({ Title = "Auto Tap", Content = "Stopped auto tap", Duration = 2 })
end
end
})

--== UNIVERSAL ANTI-PLAYER SYSTEM ==--
local autoAntiPlayer = false
local useBaseplate = false
local teleportStuds = 30
local detectionRange = 30
local maxWorldBoundary = 5000

MainTab:CreateInput({
Name = "Set Teleport Distance (Studs)",
PlaceholderText = "Enter teleport distance (default 30)",
RemoveTextAfterFocusLost = false,
Callback = function(value)
local num = tonumber(value)
if num and num > 5 then
teleportStuds = math.clamp(num, 5, 2000)
detectionRange = teleportStuds -- match input
Rayfield:Notify({
Title = "Distance Updated",
Content = "Teleport & detection range set to " .. teleportStuds .. " studs.",
Duration = 2
})
else
Rayfield:Notify({
Title = "Invalid Input",
Content = "Please enter a valid number (>5).",
Duration = 2
})
end
end
})

MainTab:CreateToggle({
Name = "Use Baseplate Mode (Free Movement)",
CurrentValue = false,
Callback = function(state)
useBaseplate = state
Rayfield:Notify({
Title = "Baseplate Mode",
Content = useBaseplate and "Free movement mode enabled." or "Safe in-map mode enabled.",
Duration = 2
})
end
})

--== Baseplate Under Player ==--
local function createBaseplateBelowPlayer()
local char = LocalPlayer.Character
if not char or not char:FindFirstChild("HumanoidRootPart") then return end
local hrp = char.HumanoidRootPart
local plate = Instance.new("Part")
plate.Size = Vector3.new(6, 1, 6)
plate.Anchored = true
plate.Color = Color3.fromRGB(120, 120, 120)
plate.Material = Enum.Material.Metal
plate.CFrame = CFrame.new(hrp.Position - Vector3.new(0, hrp.Size.Y + 3, 0))
plate.Parent = Workspace
end

--== Find Safe Spot ==--
local function getSafeSpotNear(position)
local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Blacklist
rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
for i = 1, 15 do
local randomAngle = math.rad(math.random(0, 360))
local offset = Vector3.new(math.cos(randomAngle), 0, math.sin(randomAngle)) * teleportStuds
local targetPos = position + offset + Vector3.new(0, 30, 0)
local result = Workspace:Raycast(targetPos, Vector3.new(0, -100, 0), rayParams)
if result and result.Instance and result.Instance.CanCollide then
return result.Position + Vector3.new(0, 3, 0)
end
end
return nil
end

--== Teleport Function ==--
local function performTeleport(hrp)
local currentPos = hrp.Position
if useBaseplate then
local randomAngle = math.rad(math.random(0, 360))
local offset = Vector3.new(math.cos(randomAngle), 0, math.sin(randomAngle)) * (teleportStuds + math.random(0, 80))
local newPos = currentPos + offset + Vector3.new(0, 5, 0)
if newPos.Magnitude > maxWorldBoundary then
newPos = newPos.Unit * maxWorldBoundary
end
pcall(function()
hrp.CFrame = CFrame.new(newPos)
end)
createBaseplateBelowPlayer()
else
local safePos = getSafeSpotNear(currentPos)
if safePos then
pcall(function()
hrp.CFrame = CFrame.new(safePos)
end)
end
end
end

--== Toggle Anti Player ==--
MainTab:CreateToggle({
Name = "Anti-Near Player (Universal)",
CurrentValue = false,
Callback = function(state)
autoAntiPlayer = state
if state then
Rayfield:Notify({
Title = "Anti-Near Player",
Content = "Active: Teleports when someone is within " .. detectionRange .. " studs.",
Duration = 3
})
task.spawn(function()
while autoAntiPlayer do
task.wait(0.5)
local char = LocalPlayer.Character
if not char or not char:FindFirstChild("HumanoidRootPart") then continue end
local hrp = char.HumanoidRootPart

local nearest, nearestDist = nil, math.huge  
 for _, plr in ipairs(Players:GetPlayers()) do  
  if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then  
   local dist = (plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude  
   if dist < nearestDist then  
    nearestDist = dist  
    nearest = plr  
   end  
  end  
 end  

 if nearest and nearestDist <= detectionRange then  
  performTeleport(hrp)  
  Rayfield:Notify({  
   Title = "Anti-Near Player",  
   Content = "Teleported away from " .. nearest.Name .. " (" .. math.floor(nearestDist) .. " studs)",  
   Duration = 2  
  })  
 end  
end

end)
else
Rayfield:Notify({ Title = "Anti-Near Player", Content = "Disabled.", Duration = 2 })
end
end
})


--== AUTO MOVE AROUND MAP ==--
local autoMove = false
local moveInterval = 10
local lastTeleportPos = nil

local function findFarthestSafeSpot()
 local char = LocalPlayer.Character
 if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
 local hrp = char.HumanoidRootPart
 local myPos = hrp.Position
 local candidates = {}

 local rayParams = RaycastParams.new()
 rayParams.FilterType = Enum.RaycastFilterType.Blacklist
 rayParams.FilterDescendantsInstances = {char}

 -- Buat 60 titik acak di area luas
 for i = 1, 60 do
  local randomPos = myPos + Vector3.new(math.random(-600, 600), 150, math.random(-600, 600))
  local result = Workspace:Raycast(randomPos, Vector3.new(0, -300, 0), rayParams)
  if result and result.Instance and result.Instance.CanCollide then
   table.insert(candidates, result.Position + Vector3.new(0, 4, 0))
  end
 end

 if #candidates == 0 then return nil end

 local bestPos, maxDist = nil, -math.huge
 for _, pos in ipairs(candidates) do
  if lastTeleportPos and (pos - lastTeleportPos).Magnitude < 100 then
   continue
  end
  local minDistToPlayer = math.huge
  for _, plr in ipairs(Players:GetPlayers()) do
   if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
    local dist = (pos - plr.Character.HumanoidRootPart.Position).Magnitude
    if dist < minDistToPlayer then
     minDistToPlayer = dist
    end
   end
  end
  if minDistToPlayer > maxDist then
   maxDist = minDistToPlayer
   bestPos = pos
  end
 end

 return bestPos
end

local function teleportToSafeSpot()
 local char = LocalPlayer.Character
 if not char or not char:FindFirstChild("HumanoidRootPart") then return end
 local hrp = char.HumanoidRootPart
 local safePos = findFarthestSafeSpot()
 if not safePos then return end

 pcall(function()
  hrp.CFrame = CFrame.new(safePos)
  lastTeleportPos = safePos
 end)

 if useBaseplate then
  local plate = Instance.new("Part")
  plate.Size = Vector3.new(6, 1, 6)
  plate.Anchored = true
  plate.Color = Color3.fromRGB(120, 120, 120)
  plate.Material = Enum.Material.Metal
  plate.CFrame = CFrame.new(safePos - Vector3.new(0, 3, 0))
  plate.Parent = Workspace
 end

 Rayfield:Notify({
  Title = "Auto Move",
  Content = "Teleported to new location safely.",
  Duration = 2
 })
end

MainTab:CreateInput({
 Name = "Move Interval (seconds)",
 PlaceholderText = "Default: 10",
 RemoveTextAfterFocusLost = false,
 Callback = function(value)
  local num = tonumber(value)
  if num and num > 1 then
   moveInterval = math.clamp(num, 1, 120)
   Rayfield:Notify({
    Title = "Interval Updated",
    Content = "Teleport every " .. moveInterval .. " seconds.",
    Duration = 2
   })
  else
   Rayfield:Notify({
    Title = "Invalid Input",
    Content = "Please enter a valid number > 1.",
    Duration = 2
   })
  end
 end
})

MainTab:CreateToggle({
 Name = "Auto Move Around Map",
 CurrentValue = false,
 Callback = function(state)
  autoMove = state
  if state then
   Rayfield:Notify({
    Title = "Auto Move",
    Content = "Teleporting every " .. moveInterval .. " seconds...",
    Duration = 3
   })
   task.spawn(function()
    while autoMove do
     task.wait(moveInterval)
     teleportToSafeSpot()
    end
   end)
  else
   Rayfield:Notify({
    Title = "Auto Move",
    Content = "Stopped moving around map.",
    Duration = 2
   })
  end
 end
})

local visualTab = loadstring(game:HttpGet("https://pastebin.com/raw/jb37dqiW"))()
visualTab.CreateVisualTab(Window, Rayfield, Players, RunService)