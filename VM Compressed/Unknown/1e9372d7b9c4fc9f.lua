local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Crate/Aura Farm",
   Icon = 0,
   LoadingTitle = "Roll Crates For Aura",
   LoadingSubtitle = "by MonstaaRs",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "QTEConfig",
      FileName = "BigHub"
   },
   KeySystem = false,
})

local Tab = Window:CreateTab("Main Features", 4483362458)
local _G = _G or {}
_G.ToggleState = false
_G.QTEEndToggleState = false

-- Feature 1: Toggle for QTE Success
Tab:CreateToggle({
   Name = "Aura",
   CurrentValue = false,
   Flag = "QTEToggle",
   Callback = function(Value)
      _G.ToggleState = Value
      if _G.ToggleState then
         task.spawn(function()
            local Event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Remotes"):WaitForChild("QTE_Success")
            while _G.ToggleState do
               Event:FireServer("Glacier Core")
               task.wait(0)
            end
         end)
      end
   end,
})

-- Feature 2: Toggle for QTE End
Tab:CreateToggle({
   Name = "Crates",
   CurrentValue = false,
   Flag = "QTEEndToggle",
   Callback = function(Value)
      _G.QTEEndToggleState = Value
      if _G.QTEEndToggleState then
         task.spawn(function()
            local Event = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Remotes"):WaitForChild("QTE_End")
            while _G.QTEEndToggleState do
               Event:FireServer("Glacier Core", 4)
               task.wait(0.1)
            end
         end)
      end
   end,
})

Rayfield:LoadConfiguration()
