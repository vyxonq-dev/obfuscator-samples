--[[ Script by SpectravaxISBACK, scripted by: SpectravaxISBACK of course.

SPECTRAVAXISBACK IS TUFF!!
SPECTRAVAXISBACK IS TUFF!!
SPECTRAVAXISBACK IS TUFF!!
SPECTRAVAXISBACK IS TUFF!!
SPECTRAVAXISBACK IS TUFF!!
SPECTRAVAXISBACK IS TUFF!!

]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "[⭐] Spectravax Hub (V0.01)",
   LoadingTitle = "Loading the script...",
   LoadingSubtitle = "By SpectravaxISBACK...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "DMC_AutoFun",
      FileName = "config"
   },
   KeySystem = false
})

local MainTab = Window:CreateTab("🎮 Main", nil)
local SettingsTab = Window:CreateTab("⚙️ Settings", nil)

-- Services & Vars
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local plr = Players.LocalPlayer
local leaderstats = plr:WaitForChild("leaderstats")
local cashStat = leaderstats:WaitForChild("Cash")
local cashStart = cashStat.Value
local autoTPEnabled = false
local tpDelay = 1.0  -- Default 1s interval

-- Safe TP Function (Finds GetCash/obby*/Model -> TP Above)
local function tpToObby()
   local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
   if not hrp then return false end
   
   for _, obj in pairs(Workspace:GetDescendants()) do
      if obj:IsA("BasePart") then
         local name = obj.Name
         local lower = name:lower()
         if lower:find("getcash") or lower:find("obby") or name == "Model" then
            hrp.CFrame = obj.CFrame + Vector3.new(0, 5, 0)
            return true
         end
      end
   end
   return false
end

-- Auto-TP Loop
local autoTPConnection
local function toggleAutoTP(state)
   autoTPEnabled = state
   if state then
      autoTPConnection = RunService.Heartbeat:Connect(function()
         if tick() % tpDelay < 0.02 then
            tpToObby()
         end
      end)
      Rayfield:Notify({
         Title = "🚀 Auto-TP ON!",
         Content = "Teleporting to obby/GetCash every " .. tpDelay .. "s (Safe Cash!)",
         Duration = 4
      })
   else
      if autoTPConnection then
         autoTPConnection:Disconnect()
         autoTPConnection = nil
      end
      Rayfield:Notify({Title = "⏹️ Auto-TP OFF", Content = " Successfully turned off.", Duration = 3})
   end
end

-- GUI: Main Tab
MainTab:CreateToggle({
   Name = "Auto-Teleport to Obby",
   CurrentValue = false,
   Flag = "AutoTPToggle",
   Callback = toggleAutoTP
})

MainTab:CreateButton({
   Name = "Teleport to Obby",
   Callback = function()
      if tpToObby() then
         Rayfield:Notify({Title = "✨ Teleported to Obby!", Content = " Successfully teleported.", Duration = 2})
      else
         Rayfield:Notify({Title = "❌ No Obby Found", Content = "Wait for minigame spawn...", Duration = 3})
      end
   end
})

MainTab:CreateParagraph({
   Title = "Cash Status",
   Content = "Gains auto-notified below!"
})

-- Settings Tab (No Scan Mode = No Errors!)
SettingsTab:CreateSlider({
   Name = "Set Auto-TP EV (Every Seconds)",
   Range = {0.5, 5},
   Increment = 0.1,
   CurrentValue = 1.0,
   Flag = "TPDelaySlider",
   Callback = function(value)
      tpDelay = value
      if autoTPEnabled then
         Rayfield:Notify({Title = "⚙️ TP Delay → " .. value .. "s", Duration = 2})
      end
   end
})

SettingsTab:CreateButton({
   Name = "Destroy GUI",
   Callback = function()
      Rayfield:Destroy()
   end
})

-- Cash Gain Notifier (Instant on TP Rewards)
cashStat.Changed:Connect(function(newVal)
   if newVal > cashStart then
      local gain = newVal - cashStart
      Rayfield:Notify({
         Title = "💰 Cash Gained! +$" .. gain,
         Content = "Total: $" .. newVal,
         Duration = 4
      })
      cashStart = newVal
   end
end)

-- Respawn Handler (Restart Auto-TP)
plr.CharacterAdded:Connect(function()
   task.wait(3)
   cashStart = cashStat.Value
   if autoTPEnabled then
      toggleAutoTP(false)
      task.wait(0.5)
      toggleAutoTP(true)
   end
end)

-- Keybind: Right Shift for Auto-TP Toggle
Rayfield:AddKeybind({
   DefaultKey = Enum.KeyCode.RightShift,
   Name = "Auto-TP Toggle",
   Callback = function()
      toggleAutoTP(not autoTPEnabled)
   end
})

Rayfield:Notify({
   Title = "Spectravax",
   Content = "Script is now loaded, enjoy!",
   Duration = 7
})
