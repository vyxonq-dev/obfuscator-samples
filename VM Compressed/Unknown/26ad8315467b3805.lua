-- Charger Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Boxing Slayers GUI",
   LoadingTitle = "Rayfield Interface",
   LoadingSubtitle = "by me",
   ConfigurationSaving = { Enabled = false }
})

local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

-- Onglets
local MainTab = Window:CreateTab("Main", 4483362458)
local PetsTab = Window:CreateTab("Pets", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)

local autoClick = false
local autoFarm1 = false
local antiIdle = false
local autoEquipBest = false
local autoBuyEgg = false

local clickDelay = 0.01

-- 🔥 Auto Click
local function startAutoClick()
   task.spawn(function()
      while autoClick do
         game:GetService("ReplicatedStorage")
            :WaitForChild("Remotes")
            :WaitForChild("Click")
            :FireServer("Click")
         task.wait(clickDelay)
      end
   end)
end

MainTab:CreateToggle({
   Name = "Auto Click",
   CurrentValue = false,
   Callback = function(v)
      autoClick = v
      if v then startAutoClick() end
   end
})

MainTab:CreateSlider({
   Name = "Click Speed (ms)",
   Range = {1, 100},
   Increment = 1,
   Suffix = "ms",
   CurrentValue = 10,
   Callback = function(v)
      clickDelay = v / 1000
   end
})

-- 🗺️ Auto Farm Boss 1
local function teleportToBoss1()
   local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
   local hrp = char:WaitForChild("HumanoidRootPart")
   local part = workspace.MapsWorlds.World1.Rings.Ring.Matt.Part118
   hrp.CFrame = part.CFrame + Vector3.new(0,5,0)
end

MainTab:CreateToggle({
   Name = "Auto Farm Boss 1",
   CurrentValue = false,
   Callback = function(v)
      autoFarm1 = v
      if v then
         teleportToBoss1()
         autoClick = true
         startAutoClick()
      else
         autoClick = false
      end
   end
})

-- 🐾 Auto Equip Best Pets
PetsTab:CreateToggle({
   Name = "Auto Equip Best Pets",
   CurrentValue = false,
   Callback = function(v)
      autoEquipBest = v
      task.spawn(function()
         while autoEquipBest do
            local args = { "Best" }
            game:GetService("ReplicatedStorage")
               :WaitForChild("Remotes")
               :WaitForChild("Inventory")
               :FireServer(unpack(args))
            task.wait(5)
         end
      end)
   end
})

-- 🥚 Auto Buy Best Egg
PetsTab:CreateToggle({
   Name = "Auto Buy Best Egg",
   CurrentValue = false,
   Callback = function(v)
      autoBuyEgg = v
      task.spawn(function()
         while autoBuyEgg do
            local args = {
               "Hatch",
               "4",
               1,
               {}
            }
            game:GetService("ReplicatedStorage")
               :WaitForChild("Remotes")
               :WaitForChild("Egg")
               :FireServer(unpack(args))
            task.wait(1)
         end
      end)
   end
})

-- 🛡️ Anti Idle
MiscTab:CreateToggle({
   Name = "Anti Idle Ban",
   CurrentValue = false,
   Callback = function(v)
      antiIdle = v
      if v then
         LocalPlayer.Idled:Connect(function()
            if antiIdle then
               VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
               task.wait(1)
               VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end
         end)
      end
   end
})