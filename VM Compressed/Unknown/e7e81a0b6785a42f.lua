local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedFirst = game:GetService("ReplicatedFirst")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local InputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local rad = math.rad
local sin = math.sin
local random = math.random
local huge = math.huge

local camera = workspace.CurrentCamera

local ClientFramework = loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/AllAssetsForRecent/refs/heads/main/ClientFramework.lua"))()

local function tick()
	return Workspace:GetServerTimeNow()
end

local module = {}

local player = Players.LocalPlayer
function module.Weld(p1,p2,c0,name)
	local weld = Instance.new("Weld")
	weld.Name = name or "Weld"
	weld.Part0 = p1
	weld.Part1 = p2
	if c0 then
		weld.C0 = c0
	end
	weld.Parent = p2
	return weld
end


function module.shakeScreen(v)
	ClientFramework.Shake(v)
end

function module.GetParticles(m)
	local particleTable = {}
	for i,v in pairs(m:GetDescendants()) do
		if v:IsA("ParticleEmitter") then
			particleTable[v] = {
				Particle = v,
				Transparency = {},
				Size = {}
			}
			for i2 = 1, #particleTable[v]["Particle"].Transparency.Keypoints do
				particleTable[v]["Transparency"][i2] = {
					["Value"] = particleTable[v]["Particle"].Transparency.Keypoints[i2].Value,
					["Time"] = particleTable[v]["Particle"].Transparency.Keypoints[i2].Time
				}
			end
			for i2 = 1, #particleTable[v]["Particle"].Size.Keypoints do
				particleTable[v]["Size"][i2] = {
					["Value"] = particleTable[v]["Particle"].Size.Keypoints[i2].Value,
					["Time"] = particleTable[v]["Particle"].Size.Keypoints[i2].Time
				}
			end
			v.Size = NumberSequence.new(0)
			v.Transparency = NumberSequence.new(1)
		end
	end
	return particleTable
end
function module.GetParts(m)
	local partTable = {}
	local tab = m:GetDescendants()
	table.insert(tab, m)
	for i,v in pairs(tab) do
		if v:IsA("BasePart") then
			partTable[v] = {
				Part = v,
				Transparency = v.Transparency,
				Size = v.Size
			}
			v.Size = Vector3.new(0,0,0)
			v.Transparency = 1
		end
	end
	
	return partTable
end

function module.getGroundFromPosition(position)
	local ignoreList = {}		
	for i,v in pairs(workspace.Live:GetChildren()) do
		if v:FindFirstChild("Humanoid") then
			table.insert(ignoreList,v)
		end
	end
	
	local ray = Ray.new(position + Vector3.new(0,1,0),(Vector3.new(0,-10000000,0)))
	local hit,position = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList)
	return position
end
function module.checkRay(position, direction, unit)
	local ignoreList = {}		
	for i,v in pairs(workspace.Live:GetChildren()) do
		if v:FindFirstChild("Humanoid") then
			table.insert(ignoreList,v)
		end
	end
	
	local ray = Ray.new(position - direction.unit,(direction).unit * (unit + 1))
	local hit,position = workspace:FindPartOnRayWithIgnoreList(ray,ignoreList)
	return hit
end
function module.changeSizeAndTransparency(particleTable, particle, loop, reverse)
	task.spawn(function()
		local a = 1
		local b = 1
		local typ = "Size"
		local count = loop
		if reverse then
			a = loop
			loop = 1
			b = -1
		end
		for i = a, loop, b do
			for eee = 1, 2 do
				if typ == "Size" then
					typ = "Transparency"
				else
					typ = "Size"
				end
				local keyPoints = {}
				for i2 = 1, #particleTable[particle][typ] do
					if typ == "Transparency" then
						local T = particleTable[particle][typ][i2]["Time"]
						local V = particleTable[particle][typ][i2]["Value"]
						table.insert(keyPoints, NumberSequenceKeypoint.new(T, 1-((1-V)/count)*i))
					else
						table.insert(keyPoints, NumberSequenceKeypoint.new(particleTable[particle][typ][i2]["Time"], (particleTable[particle][typ][i2]["Value"] * (i/count))))
					end
				end
				particle[typ] = NumberSequence.new(keyPoints)
			end
		wait(0.03) end
	end)
end
function module.getSpot(hit,orgiginalCFrame,Distance)
	local relCF = orgiginalCFrame
	local cf = orgiginalCFrame
	for i = 1,360 do
		orgiginalCFrame = cf * CFrame.Angles(0,math.rad(i),0)
		local ray = Ray.new(orgiginalCFrame.p-orgiginalCFrame.rightVector, (orgiginalCFrame.lookVector).unit * Distance)
		local part, position = workspace:FindPartOnRay(ray, hit, false, true)
		local ray2 = Ray.new(orgiginalCFrame.p+orgiginalCFrame.rightVector, (orgiginalCFrame.lookVector).unit * Distance)
		local part2, position2 = workspace:FindPartOnRay(ray2, hit, false, true)
		
		if not part and not part2 then 
			return orgiginalCFrame
		end
	end
	return relCF
end
function module.getLockedOnPlayer(character)
	if character:FindFirstChild("LockOnScript") and character:FindFirstChild("LockOnScript").LockOn.Value then
		return character:FindFirstChild("LockOnScript").LockOn.Value
	else
		return false
	end
end

function module.qwait()
	game:GetService("RunService").RenderStepped:Wait()
end

function module.Lerp(a, b, t)
	return a + (b - a) * t
end

function module.BurstScreen(player,Gui,Color,howlong,w)
	task.spawn(function()
		local gui = player.Character.Resources.Guis.BurstScreen:Clone()
		gui[Gui].BackgroundTransparency = 0
		if Color then
			gui[Gui].BackgroundColor3 = Color
		end
		gui.Parent = player.PlayerGui
		if w then
			wait(w)
		end
		if not howlong then howlong = 10 end
		for i = 1,howlong do
			gui[Gui].BackgroundTransparency = gui[Gui].BackgroundTransparency + 1/howlong
		wait()end
		gui:Destroy()
	end)
end

function module.AddKeyframes(animation, parent)
	local character = parent.Parent
	local rootPart, humanoid = character:WaitForChild("HumanoidRootPart"), character:WaitForChild("Humanoid")
	animation.KeyframeReached:Connect(function(keyframe)
		if keyframe == "Pause" then
			animation:AdjustSpeed(0)
		elseif keyframe == "Step" then
			if humanoid.FloorMaterial == Enum.Material.Grass then
				character.Head["walking_step_grass"]:Play()
			elseif humanoid.FloorMaterial == Enum.Material.Sand or humanoid.FloorMaterial == Enum.Material.Snow or humanoid.FloorMaterial == Enum.Material.Mud then
				character.Head["walking_step_sand"]:Play()
			elseif humanoid.FloorMaterial == Enum.Material.Wood or humanoid.FloorMaterial == Enum.Material.WoodPlanks then
				character.Head["walking_step_wood"]:Play()
			elseif humanoid.FloorMaterial == Enum.Material.Concrete or humanoid.FloorMaterial == Enum.Material.Ground or humanoid.FloorMaterial == Enum.Material.Asphalt or humanoid.FloorMaterial == Enum.Material.Cobblestone or humanoid.FloorMaterial == Enum.Material.SmoothPlastic or humanoid.FloorMaterial == Enum.Material.Plastic or humanoid.FloorMaterial == Enum.Material.Slate then
				character.Head["walking_step_stone"]:Play()
			end
		elseif keyframe == "RepeatEnd" then
			local timePosition = animation:GetTimeOfKeyframe("RepeatStart")
			animation.TimePosition = timePosition
		end
	end)
end

function module.BlurEffect(blur,t)
	task.spawn(function()
		local blurObject = game.Lighting:FindFirstChild("Blur") or Instance.new("BlurEffect", game.Lighting)
		blurObject.Size = blur
		for i = 1,t do
			blurObject.Size = blurObject.Size - blur/t
		wait(0.03) end
	end)
end

function module.CreateTween(part, info, goal, play) --[Info]: length, style, direction, repeatTimes, willRepeat, waitTime
    local Goal = goal
    local TwInfo = TweenInfo.new(unpack(info))
    local Tween = game:GetService("TweenService"):Create(part, TwInfo, Goal)
    if play then Tween:Play() end
    return Tween
end

function module.GetPlayerParts(character)
	local tab = {}
	for i, v in pairs(character:GetDescendants()) do
		if v:IsA("BasePart") then
			table.insert(tab,v)
		end
	end
	return tab
end

function module.DisableEffects(part,effect)
	for i,v in pairs(part:GetChildren()) do
		if v.Name == effect then
			v.Enabled = false
		end
	end
end

function module.CheckTable(tab,object)
	for i,v in pairs(tab) do
		if v == object then
			return true
		end
	end
	return false
end

function module.getNearByHumanoids(size)
	local character = player.Character or player.CharacterAdded:Wait()
	local rootPart = character.HumanoidRootPart
	local victim
	
	for i,v in pairs(workspace.Live:GetChildren()) do
		local victimHRP = v:FindFirstChild("HumanoidRootPart") or v:FindFirstChild("Torso")
		if victimHRP and v ~= character then
			local foundPlayer = v
			
			local p1 = rootPart.Position + rootPart.CFrame.lookVector * size
			local p2 = victimHRP.Position
			
			if (p1 - p2).magnitude <= size then
				victim = v
			end
		end
	end
	return victim
end

function module.combatDamage(...)
	local character = player.Character or player.CharacterAdded:Wait()
	local rootPart = character.HumanoidRootPart
	local victim
	
	for i,v in pairs(workspace.Live:GetChildren()) do
		if v:FindFirstChild("HumanoidRootPart") and v ~= character then
			local foundPlayer = v
			
			local p1 = rootPart.Position + rootPart.CFrame.lookVector * 5
			local p2 = foundPlayer.HumanoidRootPart.Position
			
			if (p1 - p2).magnitude <= 6 then
				victim = foundPlayer
				
				if not Remotes.Damage:InvokeServer(victim, ...) then
					return nil
				end
			end
		end
	end
	return victim
end
function module.RotatePart(part)
	local functions = {}
	
	function functions:Play(angle, fadeIn, fadeOut)
		task.spawn(function()
			functions:Stop()
			
			module.Create("StringValue", "PlayingRotation", part)
			
			local x, y, z = unpack(angle)
			local originalX, originalY, originalZ = x, y, z
			
			if fadeIn then
				task.spawn(function()
					local t = fadeIn/0.03
					x,y,z = 0,0,0
					for i = 1, t do
						x = x + originalX/t
						y = y + originalY/t
						z = z + originalZ/t
					wait(0.03) end
				end)
			end
			
			local success = true
			while success and part:FindFirstChild("PlayingRotation") do
				success = pcall(function()
					if part.Parent:FindFirstChild(part.Name) then
						part.CFrame = part.CFrame * CFrame.Angles(x, y, z)
					end
				end)
				wait(0.03) 
			end
			if fadeOut and success then
				local fadingOut = true
				task.spawn(function()
					local t = fadeOut/0.03
					x,y,z = originalX,originalY,originalZ
					for i = 1, t do
						x = x - originalX/t
						y = y - originalY/t
						z = z - originalZ/t
						success = pcall(function()
							if part.Parent:FindFirstChild(part.Name) then
								part.CFrame = part.CFrame * CFrame.Angles(x, y, z)
							end
						end)
						if not success then break end
					wait(0.03) end
					fadingOut = false
				end)
			end
		end)
	end
	function functions:Stop()
		if part:FindFirstChild("PlayingRotation") then
			part:FindFirstChild("PlayingRotation"):Destroy()
		end
	end
	return functions
end
function module.CreateBodyMover(...)
	local mover, parent, force, value, debris = unpack(...)
	for i, v in pairs(parent:GetChildren()) do
		if v:IsA(mover) then
			v:Destroy()
		end
	end
	local bm = Instance.new(mover)
	bm.Name = "Client"
	if mover == "BodyPosition" then
		bm.MaxForce = force
		bm.Position = value
		bm.Parent = parent
	elseif mover == "BodyGyro" then
		bm.MaxTorque = force
		bm.CFrame = value
		bm.Parent = parent
	elseif mover == "BodyVelocity" then
		bm.MaxForce = force
		bm.Velocity = value
		bm.Parent = parent
	end
	if debris then
		game.Debris:AddItem(bm, debris)
	end
	return bm
end


return module
