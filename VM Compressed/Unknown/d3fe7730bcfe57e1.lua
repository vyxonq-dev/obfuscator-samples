local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Homeless Simulator",
   LoadingTitle = "by N1AL",
   LoadingSubtitle = "Ultimate Money Farm",
   KeySystem = false
})

local Tab = Window:CreateTab("Money Farm", 4483362458)

local rs    = game:GetService("ReplicatedStorage")
local inf   = rs:WaitForChild("TicTacToeWin")  -- Remote sama, tapi nama variable baru
local trash = rs:WaitForChild("TrashLoot")
local sell  = rs:WaitForChild("SellAllItems")

getgenv().InfOn   = false
getgenv().TrashOn = false
getgenv().Speed   = 2

-- Warning besar
Tab:CreateLabel("⚠️⚠️⚠️ IMPORTANT ⚠️⚠️⚠️")
Tab:CreateLabel("After turning ON any farm,")
Tab:CreateLabel("YOU CANNOT BUY ANY ITEMS")
Tab:CreateLabel("(house, upgrades, tools, etc)")
Tab:CreateLabel("→ Turn OFF all toggles → Rejoin → Then buy")
Tab:CreateLabel("")

Tab:CreateDropdown({
   Name = "Farm Speed",
   Options = {"Normal", "Turbo", "Insane"},
   CurrentOption = "Turbo",
   Callback = function(val)
      getgenv().Speed = (val == "Normal" and 1) or (val == "Turbo" and 2) or 3
   end,
})

-- Toggle baru: Infinite Money Farm (dah takde TicTacToe langsung)
Tab:CreateToggle({
   Name = "Infinite Money Farm (Instant $5 Spam)",
   CurrentValue = false,
   Callback = function(val)
      getgenv().InfOn = val
      if val then
         task.spawn(function()
            while getgenv().InfOn do
               for i = 1, 80 * getgenv().Speed do 
                  inf:FireServer() 
               end
               task.wait()
            end
         end)
         Rayfield:Notify({Title="Infinite Money", Content="ON - $5 flooding!", Duration=3})
      else
         Rayfield:Notify({Title="Infinite Money", Content="OFF", Duration=3})
      end
   end,
})

Tab:CreateToggle({
   Name = "Trash Full Farm (Can + Auto Sell)",
   CurrentValue = false,
   Callback = function(val)
      getgenv().TrashOn = val
      if val then
         task.spawn(function()
            while getgenv().TrashOn do
               for i = 1, 45 * getgenv().Speed do
                  trash:FireServer("Trash Can")
                  sell:FireServer()
               end
               task.wait()
            end
         end)
         Rayfield:Notify({Title="Trash Farm", Content="ON - money tsunami!", Duration=3})
      else
         Rayfield:Notify({Title="Trash Farm", Content="OFF", Duration=3})
      end
   end,
})

Tab:CreateLabel("Note: Equip the Trash Tool first")

Tab:CreateButton({
   Name = "Instant Burst 1000x Cash",
   Callback = function()
      for i = 1, 1000 do
         trash:FireServer("Trash Can")
         sell:FireServer()
      end
      Rayfield:Notify({Title="Burst", Content="1000x cash injected!", Duration=4})
   end,
})

Tab:CreateLabel("")
Tab:CreateLabel("YouTube: N1AL")
Tab:CreateLabel("Subscribe & Like")

Rayfield:Notify({Title="Loaded", Content="Homeless Simulator Script by N1AL", Duration=5})