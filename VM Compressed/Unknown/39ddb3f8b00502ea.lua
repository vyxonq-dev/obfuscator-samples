
if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "1% Size Infinite | Pro Hub",
   LoadingTitle = "Loading Interface...",
   LoadingSubtitle = "margrina",
   ConfigurationSaving = {
      Enabled = false 
   },
   KeySystem = false 
})


_G.AutoFarm = false
_G.WaitTime = 3 
local TargetPosition = Vector3.new(-336.82, 391.02, 1245.82)


local MainTab = Window:CreateTab("Teleports", 4483362458)
local FarmTab = Window:CreateTab("Auto Farm", 4483362459)

-- [ TELEPORTS ]
MainTab:CreateButton({
   Name = "Single TP to +1B Wins",
   Callback = function()
       local character = game.Players.LocalPlayer.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           character.HumanoidRootPart.CFrame = CFrame.new(TargetPosition)
       end
   end,
})

-- [ AUTO FARM ]
FarmTab:CreateSlider({
   Name = "Teleport Delay (Seconds)",
   Range = {0, 30},
   Increment = 1,
   CurrentValue = 3,
   Callback = function(Value)
       _G.WaitTime = Value
   end,
})

FarmTab:CreateToggle({
   Name = "Enable Auto TP Farm",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoFarm = Value
       if _G.AutoFarm then
           task.spawn(function()
               while _G.AutoFarm do
                   local character = game.Players.LocalPlayer.Character
                   if character and character:FindFirstChild("HumanoidRootPart") then
                       character.HumanoidRootPart.CFrame = CFrame.new(TargetPosition)
                   end
                   task.wait(_G.WaitTime)
               end
           end)
       end
   end,
})

-- [ Anti-AFK - הוספתי אוטומטית כדי שלא תנותק ]
local VirtualUser = game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

Rayfield:Notify({
   Title = "Script Loaded!",
   Content = "The menu is now active on your screen.",
   Duration = 5
})