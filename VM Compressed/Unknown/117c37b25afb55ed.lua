local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "ð FARM MANAGEMENT PANEL ð", 
   LoadingTitle = "Initializing Systems...", 
   Theme = "DarkThemes"
})
local MainTab = Window:CreateTab("â¡ MAIN CONTROLS", nil)

-- 1. Auto Money Function
local autoMoney = false
MainTab:CreateToggle({
   Name = "ð¸ Auto Collect Currency",
   Callback = function(Value)
       autoMoney = Value
       if autoMoney then
           task.spawn(function()
               while autoMoney do
                   game:GetService("ReplicatedStorage"):WaitForChild("AwardTutorialMoney"):FireServer()
                   task.wait(0.1)
               end
           end)
       end
   end,
})

-- 2. Buy Seeds Function
local autoBuySeed = false
MainTab:CreateToggle({
   Name = "ð Auto Buy Mushroom Seeds",
   Callback = function(Value)
       autoBuySeed = Value
       if autoBuySeed then
           task.spawn(function()
               local args = {"Magic Mushroom Seed", 0}
               while autoBuySeed do
                   game:GetService("ReplicatedStorage"):WaitForChild("BuySeedRequest"):FireServer(unpack(args))
                   task.wait(0.1)
               end
           end)
       end
   end,
})

-- 3. Use Booster at Footsteps Location
local autoFollowFootsteps = false
MainTab:CreateToggle({
   Name = "ð£ Auto Apply Booster at Position",
   Callback = function(Value)
       autoFollowFootsteps = Value
       if autoFollowFootsteps then
           task.spawn(function()
               local Players = game:GetService("Players")
               local LocalPlayer = Players.LocalPlayer
               
               while autoFollowFootsteps do
                   if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                       local currentPos = LocalPlayer.Character.HumanoidRootPart.Position
                       local args = {currentPos, "Growth Booster"}
                       game:GetService("ReplicatedStorage"):WaitForChild("BoosterUsedRequest"):FireServer(unpack(args))
                   end
                   task.wait(0.1)
               end
           end)
       end
   end,
})

-- 4. Slider for Jump Height (JumpPower)
MainTab:CreateSlider({
   Name = "ð¦ Adjust Jump Height (JumpPower)",
   Min = 50,
   Max = 300,
   CurrentValue = 50,
   Flag = "JumpSlider",
   Callback = function(Value)
       local player = game.Players.LocalPlayer
       if player.Character and player.Character:FindFirstChild("Humanoid") then
           player.Character.Humanoid.UseJumpPower = true
           player.Character.Humanoid.JumpPower = Value
       end
   end,
})
