-- Cleanup previous UIs
if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services & Variables
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local EndPos = Vector3.new(-12.70, 329.88, -140.30)
_G.AutoTP = false

-- UI Window
local Window = Rayfield:CreateWindow({
   Name = "Admin Tower | End TP",
   LoadingTitle = "Focusing on the Goal...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Teleport", 4483362459)

-- [ TELEPORT SECTION ]
MainTab:CreateSection("End Controls")

-- כפתור לשיגור ידני מיידי
MainTab:CreateButton({
   Name = "TP TO END",
   Info = "Teleport instantly to the coordinates",
   Callback = function()
       if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
           LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(EndPos)
           Rayfield:Notify({Title = "Success", Content = "Teleported to End!", Duration = 2})
       end
   end,
})

-- טוגל לשיגור אוטומטי (למשל כשהסיבוב מתחיל או כשאתה עושה Spawn)
MainTab:CreateToggle({
   Name = "Auto TP to End",
   Info = "Automatically teleports you when you respawn",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoTP = Value
       
       -- לופ שבודק אם חזרת לחיים ומשגר אותך
       task.spawn(function()
           while _G.AutoTP do
               if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                   -- בודק אם אתה רחוק מהסוף (למשל בתחתית המגדל) ומשגר
                   local dist = (LocalPlayer.Character.HumanoidRootPart.Position - EndPos).Magnitude
                   if dist > 50 then 
                       LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(EndPos)
                   end
               end
               task.wait(1)
           end
       end)
   end,
})

-- הגנה מפני נפילה (Keep Alive at End)
LocalPlayer.CharacterAdded:Connect(function(char)
    if _G.AutoTP then
        task.wait(0.5) -- מחכה שהדמות תיטען
        local hrp = char:WaitForChild("HumanoidRootPart", 5)
        if hrp then
            hrp.CFrame = CFrame.new(EndPos)
        end
    end
end)

Rayfield:Notify({
   Title = "TP Tool Ready",
   Content = "Manual and Auto TP are online.",
   Duration = 5
})