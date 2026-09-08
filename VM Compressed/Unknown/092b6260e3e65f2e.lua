local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/magbux/BorealisUiLib/refs/heads/main/Library.Lua"))()
local plr = game:GetService("Players").LocalPlayer

local admins = {7961390436}

local connections = {
	["AntiVoid"] = false,
	["ESP"] = {nil, {}};
	["Hitbox"] = {false, 16};
	["Speed"] = {false, 16};
	["JumpHeight"] = {false, 7.2};
	["SBP"] = false;
	["InfHealth"] = false;
	["AntiVoidBounciness"] = 100;
}

-- Create A Window (Put The Tab Name Behind The Section Name)
local Window = Library.new("CubeWare")

-- Create A Tab
local CombatTab = Window:MakeTab("Combat");
local TpTab = Window:MakeTab("Teleports");
local PerformanceTab = Window:MakeTab("Performance")
local OtherTab = Window:MakeTab("Other")

CombatTab:AddSlider({
	Name = "Hitbox Expander",
	Max = 250;
	Default = 3;
	Mix = 1;
	Callback = function(Value)
		connections["Hitbox"][2] = tonumber(Value)

		if connections["Hitbox"][1] == true then return end
		
		while task.wait(0.2) do
			connections["Hitbox"][1] = true

			for _, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v ~= plr then
					local success, message = pcall(function()
						if Value > 0 then
							v.Character.HumanoidRootPart.Size = Vector3.new(tonumber(connections["Hitbox"][2]), tonumber(connections["Hitbox"][2]), tonumber(connections["Hitbox"][2]))
							v.Character.HumanoidRootPart.CanCollide = false;
							v.Character.HumanoidRootPart.Transparency = 0.6;
							v.Character.HumanoidRootPart.Color = Color3.new(1, 0, 0)

							for _, y in pairs(v.Character:GetChildren()) do
								if y then
									if y:IsA("BasePart") then
										if v.Character:FindFirstAncestorOfClass("Humanoid").Health <= 0 then
										y.CanCollide = false
									end
								end
							end
						end
					elseif Value <= 0 then
						v.Character.HumanoidRootPart.Size = Vector3.new(2, 4, 2)
						v.Character.HumanoidRootPart.CanCollide = false;
						v.Character.HumanoidRootPart.Transparency = 0.6;
						v.Character.HumanoidRootPart.Color = Color3.new(1, 0, 0)

						for _, y in pairs(v.Character:GetChildren()) do
							if y then
								if y:IsA("BasePart") then
									if v.Character:FindFirstAncestorOfClass("Humanoid").Health <= 0 then
										y.CanCollide = false
									end
								end

								task.wait(0.025)
							end

							task.wait(0.025)
						end
					end
				end)
			end
		end
		end
	end
})

CombatTab:AddSlider({
	Name = "Speed Increaser",
	Max = 140;
	Default = tonumber(plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed);
	Callback = function(Value)
		connections["Speed"][2] = tonumber(Value)

		if connections["Speed"][1] == true then return end

		while task.wait(0.05) do
			connections["Speed"][1] = true

			pcall(function()
				if plr.Character:FindFirstChildOfClass("Humanoid") then
					plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = tonumber(connections["Speed"][2])
				end
			end)
		end
	end
})

CombatTab:AddSlider({
	Name = "Jump Height Increaser",
	Max = 45;
	Default = 7.2;
	Callback = function(Value)
		connections["JumpHeight"][2] = tonumber(Value)

		if connections["JumpHeight"][1] == true then return end

		while task.wait(0.05) do
			connections["JumpHeight"][1] = true

			pcall(function()
				if plr.Character:FindFirstChildOfClass("Humanoid") then
					plr.Character:FindFirstChildOfClass("Humanoid").JumpHeight = tonumber(connections["JumpHeight"][2])
					plr.Character:FindFirstChildOfClass("Humanoid").UseJumpPower = false
				end
			end)
		end
	end
})

CombatTab:AddSlider({
	Name = "Anti Void Bounciness",
	Max = 450;
	Default = 100;
	Callback = function(Value)
		connections["AntiVoidBounciness"] = tonumber(Value)
	end
})

CombatTab:AddToggle({
	Name = "Anti Void";
	Callback = function(Value)
		connections["AntiVoid"] = Value

		if Value == true then
			local s = Instance.new("Part", workspace);

			s.Name = "AntiVoid";
			s.CanCollide = true;
			s.Position = plr.Character.PrimaryPart.Position - Vector3.new(0, 5.5, 0)
			s.Transparency = 0.6;
			s.Color = Color3.new(1, 1, 1);
			s.Size = Vector3.new(2048, 1, 2048)
			s.Anchored = true;

			s.Touched:Connect(function(hit)
				if hit:IsDescendantOf(plr.Character) then
					plr.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, tonumber(connections["AntiVoidBounciness"]) or 100, 0)
				end
			end)

			task.spawn(function()
				repeat
					 task.wait()

					 if (plr.Character.HumanoidRootPart.Position - s.Position).Magnitude >= 2000 then
						 s.Position = Vector3.new(plr.Character.HumanoidRootPart.Position.X, s.Position.Y, plr.Character.PrimaryPart.Position.Z)
					 end
				until connections["AntiVoid"] == false
			end)
		elseif Value == false then
			if workspace:FindFirstChild("AntiVoid") then
				workspace:WaitForChild("AntiVoid"):Destroy()
			end
		end
	end
})

CombatTab:AddToggle({
	Name = "Snap Behind Player";
	Callback = function(Value)
		connections["SBP"] = Value

		
		if connections["SBP"] == true then
			  pcall(function()
				repeat
				 	task.wait(0.05)

					for _, v in pairs(game:GetService("Players"):GetPlayers()) do
						if v.Team ~= plr.Team then
							if v.Character ~= nil and v ~= plr then
								 if v.Character:FindFirstChild("Head") then
						 			 if (v.Character.Head.Position - plr.Character.HumanoidRootPart.Position).Magnitude <= 16 and v.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
										 plr.Character.PrimaryPart.Position = v.Character.Head.Position + v.Character.Head.CFrame.LookVector * -3
									 end
						 		end
					 		end
						end
				 	end
			   until connections["SBP"] == false
			end)
		end
	end
})

CombatTab:AddToggle({
	Name = "ESP (See All)";
	Callback = function(Value)
		if Value == true then
			local s = nil
			local s2 = nil

			for i = 1, #game:GetService("Players"):GetPlayers() do
				local t_plr = game:GetService("Players"):GetPlayers()[tonumber(i)]

				if t_plr ~= plr then
					if not t_plr.Character:FindFirstChild("CubewareHighlight") then
						local h = Instance.new("Highlight", t_plr.Character);

						h.Name = "CubewareHighlight";
						h.Adornee = t_plr.Character
					end

					s = t_plr.CharacterAdded:Connect(function()
						repeat task.wait() until t_plr.Character ~= nil

						if not t_plr.Character:FindFirstChild("CubewareHighlight") then
							local h = Instance.new("Highlight", t_plr.Character);

							h.Name = "CubeWareHighlight";
							h.Adornee = t_plr.Character
						end
					end)
				end
			end

			s2 = game:GetService("Players").PlayerAdded:Connect(function(plr)
				s = plr.CharacterAdded:Connect(function()
					if not plr.Character:FindFirstChildOfClass("Highlight") then
						local h = Instance.new("Highlight", plr.Character);

						h.Adoornee = v.Character.PrimaryPart;
						h.FillTransparency = 1;
						h.OutlineTransparency = 0;
						h.Name = "CubeWareHighlight"
					end
				end)
			end)

			table.insert(connections["ESP"][2], s)
			table.insert(connections["ESP"][2], s2)
		elseif Value == false then
			for i = 1, #game:GetService("Players"):GetPlayers() do
				local t_plr = game:GetService("Players"):GetPlayers()[tonumber(i)]

				if t_plr ~= plr then
					if t_plr.Character:FindFirstChild("CubeWareHighlight") then
						t_plr.Character:WaitForChild("CubeWareHighlight"):Destroy()
					end
				end
			end

			pcall(function()
				for _, v in pairs(connections["ESP"][2]) do
					if v then
						v:Disconnect()
						table.remove(connections["ESP"][2], table.find(connections["ESP"][2], s))
					end
				end

				connections["ESP"] = {nil, {}}
			end)
		end	
	end
})

TpTab:AddButton({
	Name = "Invincible (Sends u to blackbox)";
	Callback = function()
		plr.Character.PrimaryPart.CFrame = CFrame.new(0, 10^15, 0)
	end
})

TpTab:AddButton({
	Name = "Home (Sends u to the origin of the game).";
	Callback = function()
		plr.Character.PrimaryPart.CFrame = CFrame.new(0, 0, 0)
	end
})

PerformanceTab:AddButton({
	Name = "No Textures",
	Callback = function()
		pcall(function()
			for _, v in pairs(game:GetDescendants()) do
				if v:IsA("BasePart") then
					if v.Material == Enum.Material["SmoothPlastic"] then continue end

					v.Material = Enum.Material["SmoothPlastic"]

					if v:FindFirstChildOfClass("SpecialMesh") then
						v.TextureId = "rbxassetid://0"
					end

					if v:FindFirstChildOfClass("Decal") or v:FindFirstChildOfClass("Texture") then
						for _, y in pairs(v:GetChildren()) do
							if y:IsA("Decal") or y:IsA("Texture") then
								y:Destroy()
							end	
						end
					end
				end
			end
		end)
	end
});

PerformanceTab:AddButton({
	Name = "No Meshes",
	Callback = function()
		pcall(function()
			for _, v in pairs(game:GetDescendants()) do
				if v:IsA("SpecialMesh") then
					v:Destroy()
				end
			end
		end)
	end
});

PerformanceTab:AddSlider({
	Name = "Brightness",
	Max = 5;
	Default = 0;
	Callback = function(Value)
		pcall(function()
			 game:GetService("Lighting").Brightness = Value;
			 game:GetService("Lighting").ExposureCompensation = Value 
		end)
	end
})

OtherTab:AddButton({
	Name = "Load Dex",
	Callback = function()
		pcall(function()
			 loadstring(game:HttpGet("https://gist.githubusercontent.com/BROgenesis/958c1fee7d8ad100da7f7d020d5d67f3/raw/8dc95caca1b46aa9f4d9dd2433f6be3d9bc69e45/Dex++"))()
		end)
	end
})

OtherTab:AddButtons({
	Name = "Invisibility Gui";
	Callback = function()
		pcall(function()
			loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
		end)
	end
})

OtherTab:AddToggle({
	Name = "Inf Health (Client Sided)";
	Callback = function(Value)
		connections["InfHealth"] = Value
		 
		if Value == true then
			repeat
				local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")

        		task.wait(0.1)
       			 
				if humanoid.Health < humanoid.MaxHealth then
            		humanoid.Health = humanoid.MaxHealth
		       	end
   			until connections["InfHealth"] == false
		end
	end
})

--[[
OtherTab:AddTextBox({
	Name = "Auto Toxic Message";
    PlaceholderText = "INSERT AUTO TOXIC MESSAGE"
})
]]

task.spawn(function()
    pcall(function()
		for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			if table.find(admins, v.UserId) then
				v.Chatted:Connect(function(msg)
					if msg == ";kick all" and not table.find(admins, plr.UserId) then
						plr:Kick("Kicked by admin")
					end
				end)
			end
		end

		game:GetService("Players").PlayerAdded:Connect(function(plr)
    		if table.find(admins, plr.UserId) then
				plr.Chatted:Connect(function(msg)
					if msg == ";kick all" and not table.find(admins, plr.UserId) then
						plr:Kick("Kicked by admin")
					end
				end)
			end
		end)
	end)
end)
