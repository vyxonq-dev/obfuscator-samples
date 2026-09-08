local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "SandMan's Shitty Hub",
   LoadingTitle = "SandMan's Hub",
   LoadingSubtitle = "by SandMan",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SandManHubs",
      FileName = "CurrentGame"
   },
})

local MainTab = Window:CreateTab("ð  Main", nil)

-- ==================== MONEY ====================
local MoneySection = MainTab:CreateSection("Money")

local InfMoneyEnabled = false

MainTab:CreateToggle({
   Name = "Inf Money",
   CurrentValue = false,
   Flag = "InfMoney",
   Callback = function(Value)
      InfMoneyEnabled = Value
      if Value then
         task.spawn(function()
            while InfMoneyEnabled do
               game:GetService("ReplicatedStorage").Events.CashEvent:FireServer(11111)
               task.wait(0)
            end
         end)
      end
   end,
})

-- ==================== ITEMS ====================
local ItemsSection = MainTab:CreateSection("Items")

MainTab:CreateButton({
   Name = "Get a Rocket Launcher",
   Callback = function()
      game:GetService("ReplicatedStorage").Events.AwardRocket:FireServer()
      Rayfield:Notify({
         Title = "Success",
         Content = "Rocket Launcher claimed!",
         Duration = 4,
      })
   end,
})

-- ==================== BOOSTS ====================
local BoostSection = MainTab:CreateSection("Boosts")

local InfSkiBoostEnabled = false

MainTab:CreateToggle({
   Name = "Inf Ski Boost",
   CurrentValue = false,
   Flag = "InfSkiBoost",
   Callback = function(Value)
      InfSkiBoostEnabled = Value
      if Value then
         task.spawn(function()
            while InfSkiBoostEnabled do
               game:GetService("ReplicatedStorage").Events.ApplyBoost:FireServer(4)
               task.wait(0)
            end
         end)
      end
   end,
})

Rayfield:Notify({
   Title = "SandMan's Hub",
   Content = "Inf Ski Boost added!",
   Duration = 5,
})