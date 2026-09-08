local Players = game:GetService("Players") local LocalPlayer = Players.LocalPlayer local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() local Humanoid = Character:WaitForChild("Humanoid") local ReplicatedStorage = game:GetService("ReplicatedStorage") local RunService = game:GetService("RunService")

local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))() local Notifier = Compkiller.newNotify() local Window = Compkiller.new({ Name = "Bazooka Script", Keybind = "LeftAlt", Logo = "rbxassetid://120245531583106", Scale = Compkiller.Scale.Window, TextSize = 15, })

Notifier.new({ Title = "Loaded", Content = "Bazooka UI Ready!", Duration = 6, Icon = "check-circle" })

local Knit = nil local KnitStarted = false local function getService(name) if Knit then local success, result = pcall(function() return Knit.GetService(name) end) if success then return result end end end

task.spawn(function() while not KnitStarted do task.wait(1) local KnitModule = ReplicatedStorage:FindFirstChild("Packages") and ReplicatedStorage.Packages:FindFirstChild("Knit") if KnitModule then local ok, loaded = pcall(function() return require(KnitModule) end) if ok and loaded and loaded.Started then Knit = loaded KnitStarted = true end end end end)

local PowerClick = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("PowerClickFarmEvent") local Shoot = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("ShootEvent") local EarnWins = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("EarnWinsEvent") local ReduceBoss = ReplicatedStorage:WaitForChild("RemoteEvents"):FindFirstChild("ReduceBossHealthEvent") local VisualizeShoot = ReplicatedStorage.Packages._Index["sleitnick_knit@1.7.0"].knit.Services.BulletService.RF.VisualizeShoot

local autoClick = false local autoShoot = false local autoWins = false local autoRebirth = false local antiAFK = false local autoFastWin = false local oneHitBoss = false local lastBossHit = 0

local notifiedFast = false

RunService.Heartbeat:Connect(function() if autoClick then PowerClick:FireServer() end end)

RunService.Heartbeat:Connect(function() if autoShoot then Shoot:FireServer() end end)

RunService.Heartbeat:Connect(function() if autoWins then if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then EarnWins:FireServer(225,false) end end end)

RunService.Heartbeat:Connect(function() if autoRebirth then local args = { LocalPlayer } local Rebirth = ReplicatedStorage.Packages._Index:FindFirstChild("sleitnick_knit@1.7.0") if Rebirth then local service = Rebirth.knit.Services.RebirthService if service and service.RF and service.RF.Rebirth then pcall(function() service.RF.Rebirth:InvokeServer(unpack(args)) end) end end end end)

RunService.Heartbeat:Connect(function() if antiAFK then Humanoid:ChangeState(Enum.HumanoidStateType.Jumping) if Humanoid.Sit then Humanoid.Sit = false end end end)

RunService.Heartbeat:Connect(function() if autoFastWin then if not notifiedFast then notifiedFast = true Notifier.new({ Title = "Auto Earn Fast Win", Content = "Stand in Shoot Area!", Duration = 5, Icon = "zap" }) end EarnWins:FireServer(35,false) end end)

RunService.Heartbeat:Connect(function() if oneHitBoss and tick() - lastBossHit > 2.5 then lastBossHit = tick() for _, model in ipairs(workspace:GetChildren()) do if model:IsA("Model") and model:FindFirstChild("BulletPivot") then pcall(function() VisualizeShoot:InvokeServer(model.BulletPivot, 200) if ReduceBoss then ReduceBoss:FireServer() end end) break end end end end)

Window:DrawCategory({ Name = "Automation" }) local tab1 = Window:DrawTab({ Name = "Main", Icon = "bolt", EnableScrolling = true }) local sec1 = tab1:DrawSection({ Name = "Toggles", Position = 'left' })

sec1:AddToggle({ Name = "Very Fast Power Click", Flag = "AutoClick", Default = false, Callback = function(v) autoClick = v end }) sec1:AddToggle({ Name = "Auto Shoot", Flag = "AutoShoot", Default = false, Callback = function(v) autoShoot = v end }) sec1:AddToggle({ Name = "Auto Earn Wins", Flag = "AutoWins", Default = false, Callback = function(v) autoWins = v end }) sec1:AddToggle({ Name = "Auto Earn Fast Win", Flag = "AutoFastWin", Default = false, Callback = function(v) autoFastWin = v end }) sec1:AddToggle({ Name = "Auto Rebirth", Flag = "AutoRebirth", Default = false, Callback = function(v) autoRebirth = v end }) sec1:AddToggle({ Name = "Anti AFK", Flag = "AntiAFK", Default = false, Callback = function(v) antiAFK = v end }) sec1:AddToggle({ Name = "One Hit Boss", Flag = "OneHitBoss", Default = false, Callback = function(v) oneHitBoss = v end })

Window:DrawCategory({ Name = "Player Mods" }) local tab2 = Window:DrawTab({ Name = "Player", Icon = "user" }) local sec2 = tab2:DrawSection({ Name = "Movement", Position = 'left' })

sec2:AddSlider({ Name = "WalkSpeed", Flag = "WalkSpeed", Min = 16, Max = 200, Default = 16, Callback = function(v) LocalPlayer.Character.Humanoid.WalkSpeed = v end }) sec2:AddSlider({ Name = "JumpPower", Flag = "JumpPower", Min = 50, Max = 200, Default = 50, Callback = function(v) LocalPlayer.Character.Humanoid.JumpPower = v end })

local noclipActive = false sec2:AddToggle({ Name = "Noclip", Flag = "Noclip", Default = false, Callback = function(v) noclipActive = v end, })

RunService.Stepped:Connect(function() if noclipActive and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid:ChangeState(11) end end)

