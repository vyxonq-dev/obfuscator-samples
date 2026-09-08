--[[
you better have a good reason on WHY you are looking at the script raw
]]
if not game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Loaded") then
	local data = Instance.new("NumberValue") --does this really matter no i added it for a damn reason
	data.Name = "Loaded"
	data.Parent = game:GetService("Players").LocalPlayer.PlayerScripts
	print("Loaded Scripts")
	local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
	local event = ""
	local fling = false
	local opt = false
	local antiteleport = false
	local range = 15
	local partsdipping = false
	-- Create the main window
	local noclip = false
	local speed = 16
	local infjump = false
	local fakerun = false
	local infjumpv2 = false
	local antifling = false
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid")
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local bodyVelocity = Instance.new("BodyVelocity")
	local Window = Rayfield:CreateWindow({
		Name = "W112ND",
		LoadingTitle = "Please wait",
		LoadingSubtitle = "By windows11_2nd",
		ShowText = "W112ND", 
		ConfigurationSaving = { 
			Enabled = true,
			FolderName = "Exploits", 
			FileName = "Tools"
		},
		Discord = {
			Enabled = false,
			Invite = "",
			RememberJoins = true
		},
		KeySystem = false 
	})
	Rayfield:Notify({
		Title = "Warning",
		Content = "This is the only OFFICAL W112ND watch out for fake versions.",
		Duration = 4
	})
	-- Create a tab
	local Tab = Window:CreateTab("Universial", 4483362458)
	local Tab2 = Window:CreateTab("MM2", 4483362458)
	local Tab3 = Window:CreateTab("Fred's House", 4483362458)
	local Tab4 = Window:CreateTab("PHONK EDIT TOWER", 4483362458)

	-- Add a button
	Tab:CreateButton({
		Name = "Get all tools",
		Callback = function()
			Rayfield:Notify({
				Title = "Message",
				Content = "Getting all tools!",
				Duration = 4
			})
			for i,v in pairs(game:GetDescendants()) do
				if v:IsA("Tool") then
					v:Clone().Parent = game:GetService("Players").LocalPlayer.Backpack
				end
			end
		end
	})
	Tab:CreateButton({
		Name = "Teleport to tools (workspace)",
		Callback = function()
			Rayfield:Notify({
				Title = "Message",
				Content = "Getting all tools!",
				Duration = 4
			})
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Tool") then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
					task.wait()
				end
			end
		end
	})
	Tab:CreateButton({
		Name = "Teleport to every parts (workspace)",
		Callback = function()
			Rayfield:Notify({
				Title = "Message",
				Content = "Teleporting..",
				Duration = 4
			})
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("BasePart") then
					game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
					task.wait()
				end
			end
		end
	})
	Tab:CreateButton({
		Name = "Aimbot",
		Callback = function()
			Rayfield:Notify({
				Title = "HUD",
				Content = "Setting up aimbot!",
				Duration = 4
			})
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") then
					local player = game:GetService("Players"):GetPlayerFromCharacter(v)
					if player then
						game:GetService("Players").LocalPlayer:GetMouse().Target = player.Character.HumanoidRootPart
						task.wait(0.15)
					end
				end
			end
		end
	})
	Tab2:CreateButton({
		Name = "Read Users (only after round started)",
		Callback = function()
			Rayfield:Notify({
				Title = "Heads Up",
				Content = "Fetching for people",
				Duration = 4
			})
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") then
					local player = game:GetService("Players"):GetPlayerFromCharacter(v)
					if player then
						for i,v in pairs(player.Backpack:GetChildren()) do
							if v:IsA("Tool") then
								if v.Name ~= "Emotes" then
									if v.Name ~= "AAAAA" then
										local hl = Instance.new("Highlight")
										local bb = Instance.new("BillboardGui")
										local tt = Instance.new("TextLabel")
										hl.FillColor = Color3.new(1, 1, 1)
										hl.OutlineColor = Color3.new(1, 1, 1)
										hl.Parent = player.Character
										bb.Size = UDim2.new(0,100,0,25)
										tt.Text = v.Name
										bb.AlwaysOnTop = true
										tt.BackgroundTransparency = 1
										tt.TextColor3 = Color3.new(1, 1, 1)
										tt.TextScaled = true
										tt.Font = Enum.Font.BuilderSansBold
										bb.StudsOffsetWorldSpace = Vector3.new(0,4,0)
										tt.Parent = bb
										bb.Enabled = true
										tt.TextTransparency = 0
										tt.Visible = true
										tt.Size = UDim2.new(1,0,1,0)
										bb.Parent = player.Character
										if v.Name == "Knife" then
											hl.FillColor = Color3.new(1, 0, 0)
										end
										if v.Name == "Gun" then
											hl.FillColor = Color3.new(0, 0.482353, 1)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	})
	Tab:CreateButton({
		Name = "Fetch for Users",
		Callback = function()
			Rayfield:Notify({
				Title = "Heads Up!",
				Content = "Fetching for players...",
				Duration = 4
			})
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") then
					local player = game:GetService("Players"):GetPlayerFromCharacter(v)
					if player then
						local hl = Instance.new("Highlight")
						hl.FillColor = Color3.new(1, 1, 1)
						hl.OutlineColor = Color3.new(1, 1, 1)
						hl.Parent = player.Character
					end
				end
			end
		end
	})
	Tab:CreateButton({
		Name = "Fetch for Users (Via username)",
		Callback = function()
			Rayfield:Notify({
				Title = "Heads Up!",
				Content = "Fetching for players by username...",
				Duration = 4
			})
			for i,part in pairs(workspace:GetDescendants()) do
				if part:IsA("Model") then
					local player = game:GetService("Players")
					for i,v in pairs(player:GetDescendants()) do
						if v:IsA("Player") then
							if v.Name == part.Name then
								local hl = Instance.new("Highlight")
								hl.FillColor = Color3.new(1, 1, 1)
								hl.OutlineColor = Color3.new(1, 1, 1)
								hl.Parent = v.Character
							end
						end
					end
				end
			end
		end
	})
	Tab2:CreateButton({
		Name = "Go to Sheriff (only after round started)",
		Callback = function()
			Rayfield:Notify({
				Title = "Heads Up",
				Content = "Fetching for sheriff",
				Duration = 4
			})
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") then
					local player = game:GetService("Players"):GetPlayerFromCharacter(v)
					if player then
						for i,v in pairs(player.Backpack:GetChildren()) do
							if v:IsA("Tool") and v.Name == "Gun" then
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
							end
						end
					end
				end
			end
		end
	})
	Tab2:CreateButton({
		Name = "Go to Murderer (only after round started)",
		Callback = function()
			Rayfield:Notify({
				Title = "Heads Up",
				Content = "Fetching for murderer",
				Duration = 4
			})
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") then
					local player = game:GetService("Players"):GetPlayerFromCharacter(v)
					if player then
						for i,v in pairs(player.Backpack:GetChildren()) do
							if v:IsA("Tool") and v.Name == "Knife" then
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
							end
						end
					end
				end
			end
		end
	})
	Tab:CreateButton({
		Name = "Teleport to everyone",
		Callback = function()
			Rayfield:Notify({
				Title = "Heads Up!",
				Content = "Teleporting To everyone (5ms)!",
				Duration = 4
			})
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("Model") then
					local plr = game:GetService("Players"):GetPlayerFromCharacter(v)
					if plr then
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
						task.wait(0.5)
					end
				end
			end
		end
	})
	Tab:CreateSlider({
		Name = "Speed",
		Range = {1, 100},
		Increment = 1,
		Suffix = "USpeed",
		CurrentValue = 16,
		Flag = "UserSpeed",
		Callback = function(Value)
			game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Value
			speed = Value
		end,
	})
	Tab:CreateInput({
		Name = "RemoteEvents",
		CurrentValue = "",
		PlaceholderText = "Fire all remote event text",
		RemoveTextAfterFocusLost = false,
		Flag = "FARET",
		Callback = function(Text)
			for i,v in pairs(game.ReplicatedStorage:GetDescendants()) do
				if v:IsA("RemoteEvent") then
					v:FireServer(Text)
				end
			end
		end,
	})
	local Toggle = Tab:CreateToggle({
		Name = "Noclip",
		CurrentValue = false,
		Flag = "Nocliping", 
		Callback = function(Value)
			noclip = Value
		end,
	})
	local Toggle = Tab:CreateToggle({
		Name = "Xray",
		CurrentValue = false,
		Flag = "Xray",
		Callback = function(Value)
			if Value == true then
				for i,v in pairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						v.LocalTransparencyModifier = 0.5
					end
				end
			else
				for i,v in pairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						v.LocalTransparencyModifier = 0
					end
				end
			end
		end,
	})
	Tab:CreateButton({
		Name = "Remove Client Kick Scripts",
		Callback = function()
			for i,v in pairs(workspace:GetDescendants()) do
				if v:IsA("LocalScript") then
					if v.Source:lower():find("kick") then
						v:Destroy()
					end
				end
			end
		end
	})
	local Toggle = Tab:CreateToggle({
		Name = "Optimization",
		CurrentValue = false,
		Flag = "opt",
		Callback = function(Value)
			opt = Value
		end,
	})
	Tab:CreateSlider({
		Name = "Render",
		Range = {1, 100},
		Increment = 1,
		Suffix = "rendering",
		CurrentValue = 15,
		Flag = "renderopt", 
		Callback = function(Value)
			range = Value
		end,
	})
	local Toggle = Tab:CreateToggle({
		Name = "Walkfling",
		CurrentValue = false,
		Flag = "WF",
		Callback = function(Value)
			fling = Value
		end,
	})
	local Toggle = Tab:CreateToggle({
		Name = "Fake Run",
		CurrentValue = false,
		Flag = "FR", 
		Callback = function(Value)
			fakerun = Value
		end,
	})
	local Toggle = Tab:CreateToggle({
		Name = "Inf Jump",
		CurrentValue = false,
		Flag = "IJ", 
		Callback = function(Value)
			infjump = Value
		end,
	})
	local Toggle = Tab:CreateToggle({
		Name = "(Stable) Inf Jump",
		CurrentValue = false,
		Flag = "IJ", 
		Callback = function(Value)
			infjumpv2 = Value
		end,
	})
	local Toggle = Tab:CreateToggle({
		Name = "Anti-Teleport (best for anticheat games)",
		CurrentValue = false,
		Flag = "ANTITeleport", 
		Callback = function(Value)
			antiteleport = Value
		end,
	})
	local Toggle = Tab:CreateToggle({
		Name = "Anti-Fling V2",
		CurrentValue = false,
		Flag = "AntiFling", 
		Callback = function(Value)
			antifling = Value
		end,
	})
	Tab:CreateButton({
		Name = "Dipping parts",
		Callback = function()
			partsdipping = true
		end
	})
	local Toggle = Tab3:CreateToggle({
		Name = "Inf Stamina",
		CurrentValue = false,
		Flag = "infstamina",
		Callback = function(Value)
			if Value == true then
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Advantage") then
					game:GetService("Players").LocalPlayer.Character:FindFirstChild("Advantage").Value = math.huge
				end
			else
				if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Advantage") then
					game:GetService("Players").LocalPlayer.Character:FindFirstChild("Advantage").Value = 1
				end
			end
		end,
	})
	Tab:CreateButton({
		Name = "Spawn F3X",
		Callback = function()
			local obj = game:GetObjects("rbxassetid://142785488")[1] -- F3X asset
			obj.Parent = game:GetService("Players").LocalPlayer.Backpack

			for _,desc in ipairs(obj:GetDescendants()) do
				if desc:IsA("Script") then
					desc:Destroy() -- remove server-only scripts
				end
			end

		end
	})
	Tab:CreateButton({
		Name = "Load Instance Explorer",
		Callback = function()		loadstring(game:HttpGet("https://gist.githubusercontent.com/robloxluakrnlaccount/c54cf333afc0fde82cbcd80ef15ab3bd/raw/instance%2520explorer.lua"))()
		end
	})
	Tab4:CreateButton({
		Name = "Remove Phonk",
		Callback = function()
			for _,v in pairs(player.PlayerScripts:GetChildren()) do
				if v.Name == "LocalScript" then
					v:Destroy()
				end
			end
		end
	})
	-- ✅ Optimized script without duplicate locals

	-- Optimized render loop
	local function render()
		local char = player.Character
		if not char then return end

		for _, v in ipairs(char:GetDescendants()) do
			if v:IsA("BasePart") then
				if noclip then
					v.CanCollide = false
					v.LocalTransparencyModifier = 0.5
				else
					v.LocalTransparencyModifier = 0
				end
			end
		end

		char:WaitForChild("Humanoid").WalkSpeed = speed
	end

	-- Instead of connecting 7x, just one RenderStepped is enough
	RunService.RenderStepped:Connect(render)


	-- Anti-teleportation (runs once with task loop, no multiple connections)
	local function antiteleportation()
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")
		local lastPos = hrp.Position

		while antiteleport and task.wait() do
			local distance = (hrp.Position - lastPos).Magnitude
			if distance > 5 then
				hrp.CFrame = CFrame.new(lastPos)
				hrp.Anchored = false
			end
			lastPos = hrp.Position
		end
	end
	task.spawn(antiteleportation)


	-- Infinite Jump
	local waiting = false
	local function InfJumpRender()
		local char = player.Character
		if not char then return end
		local humanoid = char:FindFirstChildOfClass("Humanoid")
		local rootPart = char:FindFirstChild("HumanoidRootPart")
		if not humanoid or not rootPart then return end

		if infjump and not waiting and humanoid.Jump then
			local currentVel = rootPart.AssemblyLinearVelocity
			humanoid.UseJumpPower = true
			rootPart.AssemblyLinearVelocity = Vector3.new(
				currentVel.X,
				humanoid.JumpPower,
				currentVel.Z
			)

			waiting = true
			repeat task.wait() until not humanoid.Jump
			waiting = false
		end
	end
	RunService.RenderStepped:Connect(InfJumpRender)


	-- Fake Run
	local waiting2 = false
	local function RunRenderFakeRun()
		local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if not root then return end

		if fakerun and not waiting2 then
			root.AssemblyLinearVelocity = Vector3.new(0,0,50)
			root.Anchored = true
		else
			root.Anchored = false
		end
	end
	RunService.RenderStepped:Connect(RunRenderFakeRun)


	-- Fling
	local running = false
	local function start()
		if running or not fling then return end
		running = true

		while fling and task.wait() do
			for _, v in ipairs(workspace:GetChildren()) do
				if v:IsA("Model") then
					local p = Players:GetPlayerFromCharacter(v)
					if p then
						local char = p.Character
						if char then
							local root = char:FindFirstChild("HumanoidRootPart")
							if root then
								root.AssemblyLinearVelocity = Vector3.new(0,1000000,0)
							end
						end
					end
				end
			end
		end
		running = false
	end
	RunService.RenderStepped:Connect(start)


	-- Anti-fling
	local function antiflingrun()
		local char = player.Character
		if not char then return end
		local root = char:FindFirstChild("HumanoidRootPart")
		if antifling and root then
			root.AssemblyLinearVelocity = Vector3.new(0,0,0)
		end
	end
	RunService.RenderStepped:Connect(antiflingrun)


	-- Infinite Jump v2
	UserInputService.JumpRequest:Connect(function()
		local char = player.Character
		if not char then return end
		local humanoid = char:FindFirstChildOfClass("Humanoid")
		if infjumpv2 and humanoid then
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end)


	-- Part stretching
	RunService.RenderStepped:Connect(function()
		if partsdipping then
			for _, v in ipairs(workspace:GetChildren()) do
				if v:IsA("BasePart") and not Players:GetPlayerFromCharacter(v.Parent) then
					local range = 10
					local pos = player:DistanceFromCharacter(Vector3.new(v.Position.X,4,v.Position.Z))
					if pos > range then
						pos = range
					end
					v.Size = Vector3.new(v.Size.X, pos, v.Size.Z)
				end
			end
		end
	end)
end