local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Find who slap",
   LoadingTitle = "its loading prob",
   LoadingSubtitle = "by 1954",
   Theme = "Amethyst",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "whatdoesthisholdidk"
   },
   Discord = {
      Enabled = false,
      Invite = "",
      RememberJoins = true
   },
   KeySystem = false,
})

local Tab = Window:CreateTab("Ingame", 3057073083)
local Tab2 = Window:CreateTab("Other", 3057073083)
local Section = Tab:CreateSection("here")
local Section2 = Tab2:CreateSection("here")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local PerfectHitRemoteConn
local PerfectHitFireConn
local AutoDodgeConn
local NoclipConn

Tab:CreateButton({
   Name = "Bypass Camera",
   Callback = function()
       local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
       local hum = char:WaitForChild("Humanoid")

       local o = workspace.CurrentCamera.CFrame
       workspace.CurrentCamera:Destroy()

       repeat wait() until workspace.CurrentCamera ~= nil
       local camera = workspace.CurrentCamera

       camera.CameraType = Enum.CameraType.Custom
       camera.CFrame = o
       camera.CameraSubject = hum
   end,
})

Tab:CreateToggle({
   Name = "Perfect Hit (Firesignal Method, High Sunc)",
   CurrentValue = false,
   Flag = "PH_Firesignal",
   Callback = function(Value)
       getgenv().PHFire = Value
       local uiFrames = LocalPlayer.PlayerGui:FindFirstChild("Frames")
       if not uiFrames then return end
       local line = uiFrames.InGame.Bar.Line
       local hit = uiFrames.InGame.Hit

       if Value then
           PerfectHitFireConn = line:GetPropertyChangedSignal("Position"):Connect(function()
               if getgenv().PHFire and line.Position.Y.Scale >= 0.97 then
                   firesignal(hit.MouseButton1Up)
                   print("click!")
               end
           end)
       else
           if PerfectHitFireConn then PerfectHitFireConn:Disconnect() end
       end
   end,
})

Tab:CreateToggle({
   Name = "Perfect Hit (Remote Method, Universal, Worse.)",
   CurrentValue = false,
   Flag = "PH_Remote",
   Callback = function(Value)
       getgenv().PHRemote = Value
       local uiFrames = LocalPlayer.PlayerGui:FindFirstChild("Frames")
       if not uiFrames then return end
       local line = uiFrames.InGame.Bar.Line
       local hitevent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("Hit")

       if Value and hitevent then
           PerfectHitRemoteConn = line:GetPropertyChangedSignal("Position"):Connect(function()
               if getgenv().PHRemote and line.Position.Y.Scale >= 0.96 then
                   hitevent:FireServer(0.98)
                   hitevent:FireServer(0.98)
                   hitevent:FireServer(0.98)
               end
           end)
       else
           if PerfectHitRemoteConn then PerfectHitRemoteConn:Disconnect() end
       end
   end,
})

Tab:CreateToggle({
   Name = "Auto Slap Request",
   CurrentValue = false,
   Flag = "AutoSlap",
   Callback = function(Value)
       getgenv().AutoSlap = Value
       if Value then
           task.spawn(function()
               while getgenv().AutoSlap do
                   ReplicatedStorage.Events.Slap:FireServer()
                   task.wait()
               end
           end)
       end
   end,
})

Tab:CreateToggle({
   Name = "Auto Dodge",
   CurrentValue = false,
   Flag = "AutoDodge",
   Callback = function(Value)
       getgenv().AutoDodge = Value
       local uiFrames = LocalPlayer.PlayerGui:FindFirstChild("Frames")
       if not uiFrames then return end
       
       local dodgeButton = uiFrames.InGame:FindFirstChild("Dodge")
       if not dodgeButton then return end
       
       local label = dodgeButton:WaitForChild("TextLabel")
       local stroke = dodgeButton:WaitForChild("UIStroke")
       local dodge_event = ReplicatedStorage.Events.Dodge

       if Value then
           AutoDodgeConn = label:GetPropertyChangedSignal("Text"):Connect(function()
               if getgenv().AutoDodge then
                   for i = 1, 2 do
                       dodge_event:FireServer(label.Text)
                   end
                   label.TextScaled = false
                   label.TextSize = 42
                   label.Text = "Pressed."
                   label.TextColor3 = Color3.fromRGB(167, 243, 208)
                   dodgeButton.BackgroundColor3 = Color3.fromRGB(31, 42, 36)
                   stroke.Color = Color3.fromRGB(52, 211, 153)
               end
           end)
       else
           if AutoDodgeConn then AutoDodgeConn:Disconnect() end
       end
   end,
})

Tab2:CreateToggle({
   Name = "Head Fix",
   CurrentValue = false,
   Flag = "HeadFix",
   Callback = function(Value)
       getgenv().HeadFix = Value
       if Value then
           task.spawn(function()
               while getgenv().HeadFix do
                   local char = LocalPlayer.Character
                   if char and char:FindFirstChild("Head") then
                       char.Head.Transparency = 0
                   end
                   task.wait(0.1)
               end
           end)
       end
   end,
})

Tab:CreateToggle({
   Name = "Be Free (be able to move ingame)",
   CurrentValue = false,
   Flag = "BeFree",
   Callback = function(Value)
       getgenv().BeFree = Value
       if Value then
           task.spawn(function()
               while getgenv().BeFree do
                   local char = LocalPlayer.Character
                   if char and char:FindFirstChild("Humanoid") then
                       char.Humanoid.WalkSpeed = 16
                       char.Humanoid.JumpPower = 50
                   end
                   task.wait()
               end
           end)
       end
   end,
})

Tab2:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "NoclipToggle",
   Callback = function(Value)
       if Value then
           NoclipConn = RunService.Stepped:Connect(function()
               local char = LocalPlayer.Character
               if char then
                   if char:FindFirstChild("Head") then char.Head.CanCollide = false end
                   if char:FindFirstChild("Torso") then char.Torso.CanCollide = false end
               end
           end)
       else
           if NoclipConn then NoclipConn:Disconnect() end
       end
   end,
})

Tab:CreateToggle({
   Name = "Auto Join Arena",
   CurrentValue = false,
   Flag = "AutoJoinArena",
   Callback = function(Value)
       getgenv().AutoJoin = Value
       if Value then
           task.spawn(function()
               while getgenv().AutoJoin do
                   local bestArena = nil
                   local highestPlayers = 0
                   local arenasFolder = workspace:FindFirstChild("Arenas")
                   if arenasFolder then
                       for i = 1, 14 do
                           local arena = arenasFolder:FindFirstChild("Arena" .. i)
                           if arena and arena:FindFirstChild("Players") then
                               local playerCount = #arena.Players:GetChildren()
                               if playerCount > highestPlayers then
                                   highestPlayers = playerCount
                                   bestArena = "Arena" .. i
                               end
                           end
                       end
                   end
                   local char = LocalPlayer.Character
                   if bestArena and char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                       ReplicatedStorage.Events.JoinMatch:FireServer(bestArena)
                   end

                   task.wait(0.2)
               end
           end)
       end
   end,
})

Tab2:CreateToggle({
   Name = "Infinite Money (Farm Slaps)",
   CurrentValue = false,
   Flag = "FarmSlaps",
   Callback = function(Value)
       getgenv().FarmSlaps = Value
       if Value then
           task.spawn(function()
               local Event = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("CreateRE")
               if not Event then return end
               
               while getgenv().FarmSlaps do
                   Event:FireServer("Slap Premium Crate","Cammon", 0)
                   task.wait()
               end
           end)
       end
   end,
})

Tab2:CreateToggle({
   Name = "Infinite Money (Farm Chairs)",
   CurrentValue = false,
   Flag = "FarmChairs",
   Callback = function(Value)
       getgenv().FarmChairs = Value
       if Value then
           task.spawn(function()
               local Event = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("CreateRE")
               if not Event then return end
               
               while getgenv().FarmChairs do
                   Event:FireServer("Chair Premium Crate","Cammon", 0)
                   task.wait()
               end
           end)
       end
   end,
})