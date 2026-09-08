local Players = game:GetService("Players") local ReplicatedStorage = game:GetService("ReplicatedStorage") local Workspace = game:GetService("Workspace") local RunService = game:GetService("RunService") local LP = Players.LocalPlayer local Char = LP.Character or LP.CharacterAdded:Wait() local HRP = Char:WaitForChild("HumanoidRootPart")

local CK = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))() local UI = CK.new({ Name = "Gun Tycoon", Keybind = "RightAlt", Scale = CK.Scale.Full })

local Tab = UI:DrawTab({ Name = "Main", Icon = "target" }) local Sec = Tab:DrawSection({ Name = "Combat", Position = "left" }) local Move = Tab:DrawSection({ Name = "Movement", Position = "right" }) local Util = Tab:DrawSection({ Name = "Utility", Position = "left" })

local gunConfig = {} local ammoProperty, reloadProperty, fireRateProperty, maxDistanceProperty local collecting = false local collectingTP = false local autoRebirth = false local antiAFK = false local allPlayersTP = false local storedPosition = nil

Sec:AddToggle({ Name = "Infinite Ammo", Flag = "InfAmmo", Default = false, Callback = function(state) local tool = LP.Backpack:FindFirstChildOfClass("Tool") if tool and tool:FindFirstChild("Configuration") then ammoProperty = tool.Configuration:FindFirstChild("ClipSize") if ammoProperty then ammoProperty:GetPropertyChangedSignal("Value"):Connect(function() if state then ammoProperty.Value = math.huge end end) if state then ammoProperty.Value = math.huge end end end end })

Sec:AddSlider({ Name = "Reload Speed", Flag = "ReloadSpeed", Min = 0.01, Max = 5, Default = 1, Callback = function(val) local tool = LP.Backpack:FindFirstChildOfClass("Tool") if tool and tool:FindFirstChild("Configuration") then reloadProperty = tool.Configuration:FindFirstChild("ReloadSpeed") if reloadProperty then reloadProperty.Value = val end end end })

Sec:AddToggle({ Name = "Rapid Fire", Flag = "RapidFire", Default = false, Callback = function(state) local tool = LP.Backpack:FindFirstChildOfClass("Tool") if tool and tool:FindFirstChild("Configuration") then fireRateProperty = tool.Configuration:FindFirstChild("FireRate") if fireRateProperty then fireRateProperty.Value = state and 0.05 or 0.15 end end end })

Sec:AddToggle({ Name = "Max Distance", Flag = "MaxDistance", Default = false, Callback = function(state) local tool = LP.Backpack:FindFirstChildOfClass("Tool") if tool and tool:FindFirstChild("Configuration") then maxDistanceProperty = tool.Configuration:FindFirstChild("MaxDistance") if maxDistanceProperty then maxDistanceProperty.Value = state and 9999 or 500 end end end })

Move:AddSlider({ Name = "WalkSpeed", Flag = "WalkSpeed", Min = 16, Max = 100, Default = 16, Callback = function(val) local hum = Char:FindFirstChildOfClass("Humanoid") if hum then hum.WalkSpeed = val end end })

Move:AddSlider({ Name = "JumpPower", Flag = "JumpPower", Min = 50, Max = 200, Default = 50, Callback = function(val) local hum = Char:FindFirstChildOfClass("Humanoid") if hum then hum.JumpPower = val end end })

Move:AddToggle({ Name = "Noclip", Flag = "Noclip", Default = false, Callback = function(state) RunService.Stepped:Connect(function() if state then for _, v in pairs(Char:GetDescendants()) do if v:IsA("BasePart") and v.CanCollide then v.CanCollide = false end end end end) end })

Move:AddToggle({ Name = "Infinite Jump", Flag = "InfJump", Default = false, Callback = function(state) if state then game:GetService("UserInputService").JumpRequest:Connect(function() Char:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end) end end })

Util:AddToggle({ Name = "ESP (Skeleton)", Flag = "ESPSkel", Default = false, Callback = function(state) if state then for _, player in pairs(Players:GetPlayers()) do if player ~= LP and player.Character and player.Character:FindFirstChild("Humanoid") then local Billboard = Instance.new("BillboardGui", player.Character) Billboard.Size = UDim2.new(0, 200, 0, 50) Billboard.Adornee = player.Character:FindFirstChild("HumanoidRootPart") Billboard.AlwaysOnTop = true local Text = Instance.new("TextLabel", Billboard) Text.Size = UDim2.new(1, 0, 1, 0) Text.Text = player.Name Text.BackgroundTransparency = 1 Text.TextColor3 = Color3.new(1, 0, 0) Text.TextScaled = true end end end end })

Util:AddToggle({ Name = "Auto Collect", Flag = "AutoCollect", Default = false, Callback = function(state) collecting = state end })

Util:AddToggle({ Name = "Auto Collect/TP", Flag = "AutoCollectTP", Default = false, Callback = function(state) collectingTP = state if state then storedPosition = HRP.CFrame else if storedPosition then HRP.CFrame = storedPosition end end end })

Util:AddToggle({ Name = "Auto Rebirth", Flag = "AutoRebirth", Default = false, Callback = function(state) autoRebirth = state end })

Util:AddToggle({ Name = "Anti AFK", Flag = "AntiAFK", Default = false, Callback = function(state) antiAFK = state end })

Util:AddToggle({ Name = "Bring Players", Flag = "BringPlayers", Default = false, Callback = function(state) allPlayersTP = state end })

RunService.RenderStepped:Connect(function() if collecting then ReplicatedStorage.Remotes.CollectCollector:FireServer() end if collectingTP then local atm = Workspace.Tycoons[LP.Name].ATM.Looks.Part HRP.CFrame = atm.CFrame + Vector3.new(0, 2, 0) ReplicatedStorage.Remotes.CollectCollector:FireServer() end if autoRebirth then ReplicatedStorage.Remotes.RequestRebirth:FireServer() end if antiAFK then VirtualInputManager:SendKeyEvent(true, "W", false, game) end if allPlayersTP then for _, p in pairs(Players:GetPlayers()) do if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then p.Character.HumanoidRootPart.CFrame = HRP.CFrame * CFrame.new(0, 0, -1) end end end end)

