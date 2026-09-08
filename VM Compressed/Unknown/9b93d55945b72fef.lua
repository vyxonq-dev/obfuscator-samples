-- Cleanup previous UIs
if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Brainrot Jumps | Win Hub",
   LoadingTitle = "Calculating Jump Vector...",
   LoadingSubtitle = "by margrina234",
   ConfigurationSaving = { Enabled = false }
})

-- Variables
_G.AutoWin = false
_G.WinDelay = 2 
local EndPos = Vector3.new(-1296.4085693359375, 15.445926666259766, -6.995750427246094)

-- Tabs
local MainTab = Window:CreateTab("Main", 4483362458)

MainTab:CreateSection("Instant Teleport")

MainTab:CreateButton({
   Name = "TP to END (Instant Win)",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("HumanoidRootPart") then
           char.HumanoidRootPart.CFrame = CFrame.new(EndPos)
           
           Rayfield:Notify({
              Title = "Win Reached",
              Content = "Teleported to -1287, 12, -6",
              Duration = 3
           })
       end
   end,
})

MainTab:CreateSection("Auto Farm")

MainTab:CreateSlider({
   Name = "Auto TP Delay",
   Range = {0, 10},
   Increment = 0.5,
   CurrentValue = 2,
   Callback = function(Value)
       _G.WinDelay = Value
   end,
})

MainTab:CreateToggle({
   Name = "Enable Auto Win Farm",
   CurrentValue = false,
   Callback = function(Value)
       _G.AutoWin = Value
       
       task.spawn(function()
           while _G.AutoWin do
               local char = game.Players.LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                   char.HumanoidRootPart.CFrame = CFrame.new(EndPos)
               end
               task.wait(_G.WinDelay)
           end
       end)
   end,
})

MainTab:CreateSection("Character Tools")

MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
       local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
       if hum then hum.WalkSpeed = Value end
   end,
})

-- Anti-AFK
local VU = game:GetService("VirtualUser")
game.Players.LocalPlayer.Idled:Connect(function()
    VU:CaptureController()
    VU:ClickButton2(Vector2.new())
end)

Rayfield:Notify({
   Title = "Target Set!",
   Content = "Coordinates locked to the end zone.",
   Duration = 5
})