local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Plinko RNG",
   Icon = 0,
   LoadingTitle = "Loading Plinko RNG GUI",
   LoadingSubtitle = "by Unknown",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "PlinkoRNGConfig"
   }
})

-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458) -- Replace with any valid image ID if needed
local MainSection = MainTab:CreateSection("Main Functions")

-- Inf Cash Button
MainTab:CreateButton({
   Name = "Inf Cash",
   Info = "Grants infinite cash by invoking the RegisterBall event.",
   Interact = "Click to Activate",
   Callback = function()
      -- Infinite Cash Functionality
      local args = {
         [1] = 9999999999999999999,
         [2] = true
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("EconomyService"):WaitForChild("RF"):WaitForChild("RegisterBall"):InvokeServer(unpack(args))
      print("Inf Cash Activated!")
   end,
})

-- Auto Rebirth Toggle
MainTab:CreateToggle({
   Name = "Auto Rebirth",
   Info = "Toggle to enable or disable automatic rebirths.",
   CurrentValue = false,
   Flag = "AutoRebirthToggle", -- Unique identifier for configuration saving
   Callback = function(Value)
      _G.AutoRebirth = Value -- Update the global variable based on toggle state
      if _G.AutoRebirth then
         spawn(function()
            while _G.AutoRebirth do
               task.wait(0)
               game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("RebirthService"):WaitForChild("RF"):WaitForChild("Rebirth"):InvokeServer()
            end
         end)
         print("Auto Rebirth Activated!")
      else
         print("Auto Rebirth Deactivated!")
      end
   end,
})

-- Misc Tab
local MiscTab = Window:CreateTab("Misc", 4483362458) -- Replace with any valid image ID if needed
local MiscSection = MiscTab:CreateSection("Miscellaneous Features")

-- Anti-AFK Toggle
MiscTab:CreateToggle({
   Name = "Enable Anti-AFK",
   Info = "Prevents Roblox from detecting inactivity.",
   CurrentValue = false,
   Flag = "AntiAFKToggle", -- Unique identifier for saving configuration
   Callback = function(Value)
      local Players = game:GetService("Players")
      local player = Players.LocalPlayer
      local vu = game:GetService("VirtualUser")

      if Value then
         print("Anti-AFK Enabled")
         _G.AntiAFK = true

         task.spawn(function()
            while _G.AntiAFK do
               vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
               task.wait(1)
               vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
               task.wait(300) -- Waits 5 minutes between actions
            end
         end)
      else
         print("Anti-AFK Disabled")
         _G.AntiAFK = false
      end
   end,
})

Rayfield:LoadConfiguration()