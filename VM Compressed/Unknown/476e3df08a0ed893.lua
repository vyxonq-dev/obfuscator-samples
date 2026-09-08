--// 🧩 Key Check GUI
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

pcall(function() CoreGui:FindFirstChild("RuneXKeyUI"):Destroy() end)

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "RuneXKeyUI"
ScreenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", ScreenGui)
frame.Position = UDim2.new(0.5, -150, 0.5, -100)
frame.Size = UDim2.new(0, 300, 0, 200)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.Text = "RuneX Key System"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true
title.BackgroundTransparency = 1

local textbox = Instance.new("TextBox", frame)
textbox.PlaceholderText = "Enter Key Here"
textbox.Size = UDim2.new(0.9, 0, 0, 40)
textbox.Position = UDim2.new(0.05, 0, 0.35, 0)
textbox.Text = ""
textbox.TextScaled = true
textbox.Font = Enum.Font.Gotham
textbox.TextColor3 = Color3.new(1, 1, 1)
textbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", textbox)

local statusText = Instance.new("TextLabel", frame)
statusText.Position = UDim2.new(0.1, 0, 0.65, 0)
statusText.Size = UDim2.new(0.8, 0, 0.15, 0)
statusText.Text = ""
statusText.TextColor3 = Color3.new(1, 1, 1)
statusText.Font = Enum.Font.Gotham
statusText.TextScaled = true
statusText.BackgroundTransparency = 1

local submit = Instance.new("TextButton", frame)
submit.Text = "Submit"
submit.Size = UDim2.new(0.42, 0, 0, 35)
submit.Position = UDim2.new(0.05, 0, 0.82, 0)
submit.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
submit.TextScaled = true
submit.Font = Enum.Font.GothamBold
submit.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", submit)

local getKey = Instance.new("TextButton", frame)
getKey.Text = "Get Key"
getKey.Size = UDim2.new(0.42, 0, 0, 35)
getKey.Position = UDim2.new(0.53, 0, 0.82, 0)
getKey.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
getKey.TextScaled = true
getKey.Font = Enum.Font.Gotham
getKey.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", getKey)

local discord = Instance.new("TextButton", frame)
discord.Text = "Join Discord"
discord.Size = UDim2.new(0.9, 0, 0, 30)
discord.Position = UDim2.new(0.05, 0, 0.18, 0)
discord.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discord.TextScaled = true
discord.Font = Enum.Font.Gotham
discord.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", discord)

submit.MouseButton1Click:Connect(function()
	if textbox.Text == "RuneX00" then
		statusText.Text = "✅ Key Accepted! Loading..."
		task.wait(1)
		ScreenGui:Destroy()

		--// ✅ RAYFIELD GUI LOADS BELOW
		local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

		local Window = Rayfield:CreateWindow({
			Name = "RuneX hub | v1.0",
			LoadingTitle = "Loading....",
			LoadingSubtitle = "by jboskid",
			ShowText = "RX",
			Theme = "Ocean",
			ToggleUIKeybind = "K",
			ConfigurationSaving = {
				Enabled = true,
				FileName = "AbilityWarsTools"
			}
		})

		local MainTab = Window:CreateTab("Main")
		local CreditsTab = Window:CreateTab("Credits")

		local defaultHitboxSize = Vector3.new(2, 2, 1)
		local KillAuraEnabled = false
		local HitboxSize = 20
		local KillAuraRange = 25
		local AntiVoidEnabled = true

		MainTab:CreateButton({
			Name = "Anti-Ragdoll (K for Toggle)",
			Callback = function()
				local Humanoid, HRP
				local AntiEnabled = true
				local function freeze()
					if not AntiEnabled or not HRP or not Humanoid then return end
					HRP.Velocity = Vector3.new(0, HRP.Velocity.Y, 0)
					HRP.RotVelocity = Vector3.zero
					if Humanoid:GetState() == Enum.HumanoidStateType.Ragdoll or Humanoid.PlatformStand then
						Humanoid:ChangeState(Enum.HumanoidStateType.Running)
						Humanoid.PlatformStand = false
					end
					if Humanoid.WalkSpeed ~= 16 then Humanoid.WalkSpeed = 16 end
				end
				local function cleanRagdoll(char)
					Humanoid = char:WaitForChild("Humanoid")
					HRP = char:WaitForChild("HumanoidRootPart")
					for _,v in ipairs(char:GetDescendants()) do
						if v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") or v:IsA("Motor6D") then
							if v.Name:lower():find("ragdoll") or v.Name:lower():find("constraint") then
								v:Destroy()
							end
						end
					end
					char.DescendantAdded:Connect(function(desc)
						if desc:IsA("BallSocketConstraint") or desc:IsA("HingeConstraint") or desc:IsA("Motor6D") then
							if desc.Name:lower():find("ragdoll") or desc.Name:lower():find("constraint") then
								desc:Destroy()
							end
						end
					end)
				end
				Players.LocalPlayer.CharacterAdded:Connect(cleanRagdoll)
				if Players.LocalPlayer.Character then cleanRagdoll(Players.LocalPlayer.Character) end
				UserInputService.InputBegan:Connect(function(input, gp)
					if not gp and input.KeyCode == Enum.KeyCode.K then
						AntiEnabled = not AntiEnabled
						Rayfield:Notify({
							Title = "Anti-Ragdoll",
							Content = AntiEnabled and "Enabled" or "Disabled",
							Duration = 3
						})
					end
				end)
				RunService.Stepped:Connect(function()
					if AntiEnabled then pcall(freeze) end
				end)
			end
		})

		MainTab:CreateToggle({
			Name = "Anti-Void",
			CurrentValue = true,
			Callback = function(val) AntiVoidEnabled = val end
		})

		RunService.Heartbeat:Connect(function()
			if AntiVoidEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
				if LocalPlayer.Character.HumanoidRootPart.Position.Y < -10 then
					LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
					LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.zero
				end
			end
		end)

		MainTab:CreateSlider({
			Name = "Kill Aura Range + Hitbox",
			Range = {10, 30},
			Increment = 1,
			Suffix = "studs",
			CurrentValue = 20,
			Callback = function(v)
				HitboxSize = v
				KillAuraRange = v
			end
		})

		MainTab:CreateToggle({
			Name = "Kill Aura",
			CurrentValue = false,
			Callback = function(state)
				KillAuraEnabled = state
				if not state then
					for _, p in ipairs(Players:GetPlayers()) do
						if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
							local r = p.Character.HumanoidRootPart
							r.Size = defaultHitboxSize
							r.Transparency = 0
							r.Material = Enum.Material.Plastic
							r.Color = Color3.new(1,1,1)
							r.CanCollide = true
						end
					end
				else
					Rayfield:Notify({Title = "Kill Aura", Content = "Enabled", Duration = 3})
				end
			end
		})

		RunService.RenderStepped:Connect(function()
			if KillAuraEnabled then
				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
						local root = player.Character.HumanoidRootPart
						root.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
						root.Transparency = 0.6
						root.Color = Color3.new(1, 0, 0)
						root.Material = Enum.Material.ForceField
						root.CanCollide = false
					end
				end

				local char = LocalPlayer.Character
				if char and char:FindFirstChild("HumanoidRootPart") then
					local closest, dist = nil, KillAuraRange
					for _, player in ipairs(Players:GetPlayers()) do
						if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
							local mag = (char.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
							if mag <= dist then
								dist = mag
								closest = player
							end
						end
					end
					if closest then
						mouse1click() -- must be supported by executor
					end
				end
			end
		end)

		MainTab:CreateToggle({
			Name = "Infinite Jump",
			CurrentValue = false,
			Callback = function(state)
				_G.InfiniteJump = state
				UserInputService.JumpRequest:Connect(function()
					if _G.InfiniteJump then
						local char = LocalPlayer.Character
						if char and char:FindFirstChild("Humanoid") then
							char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						end
					end
				end)
			end
		})

		MainTab:CreateToggle({
			Name = "Speed Boost",
			CurrentValue = false,
			Callback = function(val)
				local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
				if hum then hum.WalkSpeed = val and 80 or 16 end
			end
		})

		MainTab:CreateButton({
			Name = "Reset Character",
			Callback = function()
				if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end
			end
		})

		MainTab:CreateToggle({
			Name = "Player ESP",
			CurrentValue = false,
			Callback = function(state)
				for _, p in pairs(Players:GetPlayers()) do
					if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
						if state then
							local esp = Instance.new("BillboardGui", p.Character)
							esp.Name = "PlayerESP"
							esp.Adornee = p.Character.HumanoidRootPart
							esp.AlwaysOnTop = true
							esp.Size = UDim2.new(0, 100, 0, 40)
							esp.StudsOffset = Vector3.new(0, 3, 0)
							local label = Instance.new("TextLabel", esp)
							label.Size = UDim2.new(1, 0, 1, 0)
							label.BackgroundTransparency = 1
							label.Text = p.Name
							label.TextColor3 = Color3.new(1, 0, 0)
							label.TextScaled = true
							label.Font = Enum.Font.GothamBold
						else
							if p.Character:FindFirstChild("PlayerESP") then
								p.Character.PlayerESP:Destroy()
							end
						end
					end
				end
			end
		})

		CreditsTab:CreateButton({
			Name = "Credit to jboskid",
			Callback = function()
				Rayfield:Notify({
					Title = "Thanks!",
					Content = "Script made by: jboskid",
					Duration = 5
				})
			end
		})
	else
		statusText.Text = "❌ Invalid Key"
	end
end)

getKey.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard("https://pastebin.com/raw/UckhSvmM")
		statusText.Text = "📋 Key URL copied!"
	end
end)

discord.MouseButton1Click:Connect(function()
	if syn and syn.openurl then
		syn.openurl("https://discord.gg/W2MsGP4FyR")
	elseif setclipboard then
		setclipboard("https://discord.gg/W2MsGP4FyR")
		statusText.Text = "📋 Discord link copied!"
	end
end)