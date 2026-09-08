local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local Humanoid = character:WaitForChild("Humanoid")
local RunService = game:GetService("RunService")
if not getgenv().AfterImageModuleRef then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/nkojimioji-bit/scripts/refs/heads/main/anafterimage.lua"))()
	local _t = tick()
	repeat task.wait() until getgenv().AfterImageModuleRef or tick()-_t > 8
end
local AfterImageModule = getgenv().AfterImageModuleRef
local _allowArg0 = true
local _oldNC
_oldNC = hookmetamethod(game, "__namecall", function(self, ...)
	local method = getnamecallmethod()
	if checkcaller() and method == "InvokeServer" then
		local a = {...}
		if a[1] == 0 and not _allowArg0 then return end
	end
	return _oldNC(self, ...)
end)
--[[local function invokeArg0()
	_allowArg0 = true
	invokeArg0()
	_allowArg0 = false
end]]
local CollectionService = game:GetService("CollectionService")
local shrinemusicid = nil
task.spawn(function()
	pcall(function()
		if not isfile("shrinemusic.mp3") then
			writefile("shrinemusic.mp3", game:HttpGet("https://github.com/guyguy6765/Shrine/raw/refs/heads/main/Sukuna%20vs%20Mahoraga(Malevolent%20Shrine)%20Jujutsu%20Kaisen%20S2%20EP17%20OST%20%E5%91%AA%E8%A1%93%E5%BB%BB%E6%88%A6%20%5BEpic%20Cover%5D%20(mp3cut.net).mp3"))
		end
		shrinemusicid = getcustomasset("shrinemusic.mp3")
	end)
end)
local ASSET_ID = "111146183823385"
local loadedModel = nil
local replicatedstoragelocation = game:GetService("ReplicatedStorage")
local assetsfolderlocation = replicatedstoragelocation:FindFirstChild("assets")
if not assetsfolderlocation then
	assetsfolderlocation = Instance.new("Folder")
	assetsfolderlocation.Name = "assets"
	assetsfolderlocation.Parent = replicatedstoragelocation
end
local slashassettemplate = (function()
	local existingslash = assetsfolderlocation:FindFirstChild("slashprojectile")
	if existingslash then return existingslash end
	local loadsuccessful, loadedobjectlist = pcall(game.GetObjects, game, "rbxassetid://102765430908582")
	if loadsuccessful and loadedobjectlist and #loadedobjectlist > 0 then
		local slashpartclone = loadedobjectlist[1]:Clone()
		slashpartclone.Name = "slashprojectile"
		slashpartclone.Parent = assetsfolderlocation
		return slashpartclone
	end
	return nil
end)()

local fugaarrowtemplate = (function()
	local existing = assetsfolderlocation:FindFirstChild("fugaarrow")
	if existing then return existing end
	local ok, objs = pcall(game.GetObjects, game, "rbxassetid://76327469285571")
	if ok and objs and #objs > 0 then
		local clone = objs[1]:Clone()
		clone.Name = "fugaarrow"
		clone.Parent = assetsfolderlocation
		return clone
	end
	return nil
end)()

local shrineassetstemplate = (function()
	local existing = assetsfolderlocation:FindFirstChild("shrineassets")
	if existing then return existing end
	local ok, objs = pcall(game.GetObjects, game, "rbxassetid://131427597692904")
	if ok and objs and #objs > 0 then
		local clone = objs[1]:Clone()
		clone.Name = "shrineassets"
		clone.Parent = assetsfolderlocation
		return clone
	end
	return nil
end)()

local quickshrinetemplate = (function()
	local existing = assetsfolderlocation:FindFirstChild("Quickshrine")
	if existing then return existing end
	local ok, objs = pcall(game.GetObjects, game, "rbxassetid://116962240566225")
	if ok and objs and #objs > 0 then
		local clone = objs[1]:Clone()
		clone.Name = "Quickshrine"
		clone.Parent = assetsfolderlocation
		return clone
	end
	return nil
end)()

local missbbtemplate = (function()
	local existing = assetsfolderlocation:FindFirstChild("missbb")
	if existing then return existing end
	local ok, objs = pcall(game.GetObjects, game, "rbxassetid://81223801953796")
	if ok and objs and #objs > 0 then
		local clone = objs[1]:Clone()
		clone.Name = "missbb"
		clone.Parent = assetsfolderlocation
		return clone
	end
	return nil
end)()

local function loadAsset(id)
	local ok, objects = pcall(game.GetObjects, game, "rbxassetid://" .. id)
	if not ok or not objects or #objects == 0 then
		return nil
	end
	return objects[1]:Clone()
end


local tpseqactive = false
local frozenmdlcf = nil
local currentmdlhrp = nil
local function setupModelToFollowPlayer(char, mdl)
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local new_hrp = mdl:FindFirstChild("HumanoidRootPart")
	if not hrp or not new_hrp then
		return
	end
	local animateScript = char:FindFirstChild("Animate")
	if animateScript then
		animateScript.Disabled = true
	end

	local existingHumanoid = mdl:FindFirstChildOfClass("Humanoid")
	if existingHumanoid then existingHumanoid:Destroy() end
	local existingAnimator = mdl:FindFirstChildOfClass("Animator")
	if existingAnimator then existingAnimator:Destroy() end
	for _, v in ipairs(mdl:GetDescendants()) do
		if v:IsA("BasePart") then
			v.CanCollide = false
			if v.Name == "HumanoidRootPart" or v.Name == "RootPart" then
				v.Transparency = 1
			else
				v.Transparency = 0
			end
		end
	end
	if not mdl:FindFirstChild("Head") then
		local fakehead = Instance.new("Part")
		fakehead.Name = "Head"
		fakehead.Size = Vector3.new(1, 1, 1)
		fakehead.Transparency = 1
		fakehead.CanCollide = false
		fakehead.Anchored = false
		fakehead.Parent = mdl
		local weld = Instance.new("Weld")
		weld.Part0 = new_hrp
		weld.Part1 = fakehead
		weld.C0 = CFrame.new(0, 1.5, 0)
		weld.Parent = fakehead
	end
	mdl.Parent = workspace
	task.spawn(function()
		task.wait(0.5)
		local charhead = char:FindFirstChild("Head")
		local mdlhead = mdl:FindFirstChild("Head")
		if charhead and mdlhead then
			charhead.CFrame = mdlhead.CFrame
			local hw = Instance.new("WeldConstraint")
			hw.Part0 = mdlhead
			hw.Part1 = charhead
			hw.Parent = charhead
		end
	end)
	new_hrp.CFrame = hrp.CFrame + Vector3.new(0, 1, 0)
	new_hrp.Anchored = true
	new_hrp.Transparency = 1
	local currentConnection = nil
	currentConnection = RunService.Stepped:Connect(function()
		if not char.Parent or not hrp.Parent or not new_hrp.Parent then
			if currentConnection then
				currentConnection:Disconnect()
				currentConnection = nil
			end
			return
		end
		if tpseqactive and frozenmdlcf then
			new_hrp.CFrame = frozenmdlcf
		elseif not tpseqactive then
			new_hrp.CFrame = hrp.CFrame + Vector3.new(0, 1, 0)
		end
		if new_hrp.Transparency ~= 1 then
			new_hrp.Transparency = 1
		end
		for _, v in ipairs(mdl:GetDescendants()) do
			if v:IsA("BasePart") and (v.Name == "HumanoidRootPart" or v.Name == "RootPart") and v.Transparency ~= 1 then
				v.Transparency = 1
			end
		end
	end)
	task.spawn(function()
		local camscript = char:WaitForChild("cam", 5)
		if not camscript then return end
		local lv = camscript:FindFirstChild("lock")
		if lv then lv.Value = new_hrp end
		if getgenv().camstopconn then
			pcall(function() getgenv().camstopconn:Disconnect() end)
		end
		getgenv().camstopconn = RunService.Heartbeat:Connect(function()
			if not new_hrp or not new_hrp.Parent then
				pcall(function() getgenv().camstopconn:Disconnect() end)
				return
			end
			local desired = tpseqactive
			if camscript:GetAttribute("stop") ~= desired then
				camscript:SetAttribute("stop", desired)
			end
		end)
	end)
	currentmdlhrp = new_hrp
end
local function replaceplayerframe()
	task.spawn(function()
		local ok,teams = pcall(function()
			return player.PlayerGui:WaitForChild("Round",30):WaitForChild("Game",30):WaitForChild("Teams",30)
		end)
		if not ok or not teams then return end
		local pf = teams:FindFirstChild(player.Name)
		if not pf then
			local conn local found = false
			conn = teams.ChildAdded:Connect(function(c) if c.Name == player.Name then pf = c found = true conn:Disconnect() end end)
			local ws = tick()
			repeat task.wait(0.1) until found or tick()-ws > 15
		end
		if not pf then return end
		local frame = pf:FindFirstChild("Frame")
		local cc = frame and frame:FindFirstChild("Character")
		if not cc then return end
		cc:ClearAllChildren()
		local ok2,objs = pcall(game.GetObjects,game,"rbxassetid://"..ASSET_ID)
		if not ok2 or not objs or #objs == 0 then return end
		local asset = objs[1]:Clone()
		for _,v in ipairs(asset:GetDescendants()) do
			if v:IsA("BasePart") then v.Anchored = true v.CanCollide = false end
			if v:IsA("Humanoid") or v:IsA("Animator") or v:IsA("Script") or v:IsA("LocalScript") then pcall(function() v:Destroy() end) end
		end
		local assethrp = asset:FindFirstChild("HumanoidRootPart")
		if assethrp then assethrp.Transparency = 1 end
		asset.Parent = cc
	end)
end

local function setupviewport()
	task.spawn(function()
		local ok,vf = pcall(function()
			return player.PlayerGui:WaitForChild("Round",30):WaitForChild("Game",30):WaitForChild("SurvivorHP",30):WaitForChild("ViewportFrame",30)
		end)
		if not ok or not vf then return end
		local ok2,wm = pcall(function() return vf:WaitForChild("WorldModel",30) end)
		if not ok2 or not wm then return end
		local ok3,df = pcall(function() return wm:WaitForChild("Default",30) end)
		if not ok3 or not df then return end
		local function applyviewmodel()
			if df:FindFirstChild("FleetwayVP") then return end
			local vphrp = df:FindFirstChild("HumanoidRootPart")
			if not vphrp then return end
			for _,p in ipairs(df:GetDescendants()) do
				if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then p.Transparency = 1 end
			end
			for _, desc in ipairs(df:GetDescendants()) do
				if desc:IsA("MeshPart") then
					if desc.Name == "Head" then
						desc.MeshId = ""
						for _, child in ipairs(desc:GetChildren()) do
							if child:IsA("Beam") then child:Destroy() end
						end
					else
						pcall(function() desc:Destroy() end)
					end
				end
			end
			local ok4,objs = pcall(game.GetObjects,game,"rbxassetid://"..ASSET_ID)
			if not ok4 or not objs or #objs == 0 then return end
			local vpmdl = objs[1]:Clone()
			vpmdl.Name = "FleetwayVP"
			local vh = vpmdl:FindFirstChildOfClass("Humanoid") if vh then vh:Destroy() end
			local va = vpmdl:FindFirstChildOfClass("Animator") if va then va:Destroy() end
			for _,v in ipairs(vpmdl:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Anchored = true v.CanCollide = false
					if v.Name == "HumanoidRootPart" or v.Name == "RootPart" then v.Transparency = 1 end
				end
			end
			for _, desc in ipairs(vpmdl:GetDescendants()) do
				if desc:IsA("MeshPart") then
					if desc.Name == "Head" then
						desc.MeshId = ""
						for _, child in ipairs(desc:GetChildren()) do
							if child:IsA("Beam") then child:Destroy() end
						end
					else
						desc:Destroy()
					end
				end
			end
			local vpnewhrp = vpmdl:FindFirstChild("HumanoidRootPart")
			if vpnewhrp then
				vpmdl:PivotTo(vphrp.CFrame)
				local wc = Instance.new("WeldConstraint")
				wc.Part0 = vphrp wc.Part1 = vpnewhrp wc.Parent = vphrp
			end
			vpmdl.Parent = df
		end
		applyviewmodel()
		df.DescendantAdded:Connect(function()
			task.wait(0.5)
			if df:FindFirstChild("FleetwayVP") then return end
			applyviewmodel()
		end)
	end)
end
if humanoidRootPart then humanoidRootPart.Transparency = 1 end
for _, part in ipairs(character:GetDescendants()) do
	if part:IsA("BasePart") then part.Transparency = 1 end
end
for _, desc in ipairs(character:GetDescendants()) do
	if desc:IsA("MeshPart") then
		if desc.Name == "Head" then
			desc.MeshId = ""
			for _, child in ipairs(desc:GetChildren()) do
				if child:IsA("Beam") then child:Destroy() end
			end
		else
			desc:Destroy()
		end
	end
end
local newmdl = loadAsset(ASSET_ID)
if newmdl then
	setupModelToFollowPlayer(character, newmdl)
	loadedModel = newmdl
	setupviewport()
	replaceplayerframe()
end
if loadedModel then
	if not getgenv().Animator6DLoadedPro then
		loadstring(game:HttpGet("https://pastebin.com/raw/wCfiiUDj"))()
		repeat task.wait() until getgenv().Animator6DLoadedPro
	end
	local animationstoragecontainer = game:GetService("ReplicatedStorage"):FindFirstChild("CachedAnimations") or Instance.new("Folder")
	animationstoragecontainer.Name = "CachedAnimations"
	animationstoragecontainer.Parent = game:GetService("ReplicatedStorage")
	local AllKFSeq = {}
	local function scan(obj, path)
		if obj:IsA("KeyframeSequence") then
			local alreadycached = animationstoragecontainer:FindFirstChild(obj.Name)
			if not alreadycached then
				local clonedkeyframe = obj:Clone()
				clonedkeyframe.Parent = animationstoragecontainer
				table.insert(AllKFSeq, {Name = clonedkeyframe.Name, KFSeq = clonedkeyframe})
			else
				table.insert(AllKFSeq, {Name = alreadycached.Name, KFSeq = alreadycached})
			end
		end
		for _, child in pairs(obj:GetChildren()) do
			scan(child, path .. child.Name .. ".")
		end
	end
	scan(loadedModel, "")
	scan(character, "")
	do
		local la = loadedModel:FindFirstChild("leftarm")
		local ra = loadedModel:FindFirstChild("rightarm")
		if la then
			if not assetsfolderlocation:FindFirstChild("leftarm") then la:Clone().Parent = assetsfolderlocation end
			la:Destroy()
		end
		if ra then
			if not assetsfolderlocation:FindFirstChild("rightarm") then ra:Clone().Parent = assetsfolderlocation end
			ra:Destroy()
		end
	end
	for _, descendantobject in pairs(loadedModel:GetDescendants()) do
		if descendantobject:IsA("KeyframeSequence") then
			descendantobject:Destroy()
		end
	end

	if #AllKFSeq > 0 then
		local IdleKF = AllKFSeq[1].KFSeq
		local WalkKF = AllKFSeq[1].KFSeq
		local JumpKF = AllKFSeq[1].KFSeq
		local FallKF = nil
		local SitKF = AllKFSeq[1].KFSeq
		local RunKF = nil
		local CrouchKF = nil

		for _, anim in ipairs(AllKFSeq) do
			local n = anim.Name:lower()
			if n:find("run") or n:find("sprint") then 
				RunKF = anim.KFSeq
			elseif n:find("crouch") or n:find("slide") then 
				CrouchKF = anim.KFSeq
			elseif n:find("walk") and WalkKF == AllKFSeq[1].KFSeq then 
				WalkKF = anim.KFSeq
			elseif n:find("jump") then 
				JumpKF = anim.KFSeq
			elseif n:find("idle") then 
				IdleKF = anim.KFSeq
			elseif n:find("fall") then 
				FallKF = anim.KFSeq
			end
		end
		local slashm1keyframesequence = nil
		local fugaonkfseq = nil
		local quickshrinekfseq = nil
		local ab4kfseq = nil
		local stunnedstandkfseq = nil
		local stunnedwalkkfseq = nil
		for _, animationentry in ipairs(AllKFSeq) do
			local n = animationentry.Name:lower()
			if n:find("slashm1") then
				slashm1keyframesequence = animationentry.KFSeq
			elseif n:find("fugaon") then
				fugaonkfseq = animationentry.KFSeq
			elseif n:find("quickshrine") then
				quickshrinekfseq = animationentry.KFSeq
			elseif n:find("sukunagogo") then
				ab4kfseq = animationentry.KFSeq
			elseif n:find("stunnedwalk") then
				stunnedwalkkfseq = animationentry.KFSeq
			elseif n:find("stunnedstand") then
				stunnedstandkfseq = animationentry.KFSeq
			end
		end
		local stunactive = false
		local RunMode = false
		local CrouchMode = false
		local currentAnimation = nil
		local animationQueue = {}
		local isTransitioning = false
		local lastAnimation = nil
		local slashm1abilityinuse = false
		local slashm1cooldownactive = false
		local abilityanimlock = false
		local ANIMATIONS = {
			idle = {kfseq = IdleKF, isPlaying = false},
			walk = {kfseq = WalkKF, isPlaying = false},
			run = {kfseq = RunKF, isPlaying = false},
			jump = {kfseq = JumpKF, isPlaying = false},
			fall = {kfseq = JumpKF, isPlaying = false}
		}
		local currentAnimation = "idle"

		local function stopAllAnimations()
			for name, animData in pairs(ANIMATIONS) do
				if animData.isPlaying then
					animData.isPlaying = false
				end
			end
			getgenv().Animator6DStop()
		end

		local function playAnimation(animName)
			if not ANIMATIONS[animName] then return end
			if currentAnimation == animName and ANIMATIONS[animName].isPlaying then return end
			stopAllAnimations()
			local animData = ANIMATIONS[animName]
			if animData.kfseq then
				getgenv().Animator6D(animData.kfseq, 1, true, loadedModel)
				animData.isPlaying = true
				currentAnimation = animName
			end
		end
		local function updateAnimations()
			if slashm1abilityinuse or abilityanimlock or stunactive then return end
			if not character or not character:FindFirstChild("Humanoid") then return end
			local hum = Humanoid
			local state = hum:GetState()
			local moveDirection = hum.MoveDirection
			local targetAnimation = "idle"
			if state == Enum.HumanoidStateType.Jumping then
				targetAnimation = "jump"
			elseif state == Enum.HumanoidStateType.Freefall then
				targetAnimation = "fall"
			elseif moveDirection.Magnitude > 0.1 then
				if hum.WalkSpeed > 16 then
					targetAnimation = "run"
				else
					targetAnimation = "walk"
				end
			end
			playAnimation(targetAnimation)
		end
		Humanoid.StateChanged:Connect(updateAnimations)
		RunService.Heartbeat:Connect(updateAnimations)

		local slashm1cooldowntimer = 1
		local slashprojectilespeed = 300
		local slashprojectilemaxdistance = 1000
		local slashm1abilityinuse = false

		local abilitybar = nil
		pcall(function()
			local abfr = player.PlayerGui:WaitForChild("Round", 5):WaitForChild("Game", 5):WaitForChild("Ability", 5)
			local oldbar = abfr:FindFirstChild("Bar")
			if oldbar then oldbar:Destroy() end
			local ok, objs = pcall(game.GetObjects, game, "rbxassetid://82274736321737")
			if ok and objs and #objs > 0 then
				abilitybar = objs[1]:Clone()
				abilitybar.Parent = abfr
			end
		end)
		local function startcd(abiname, duration, oncomplete)
			local endtime = tick() + duration
			local conn
			conn = RunService.Heartbeat:Connect(function()
				local remaining = endtime - tick()
				if remaining <= 0 then
					conn:Disconnect()
					if abilitybar then
						local node = abilitybar:FindFirstChild(abiname, true)
						local lbl = node and node:FindFirstChild("CD", true)
						if lbl then lbl.Text = "" end
					end
					if oncomplete then oncomplete() end
				else
					if abilitybar then
						local node = abilitybar:FindFirstChild(abiname, true)
						local lbl = node and node:FindFirstChild("CD", true)
						if lbl then lbl.Text = tostring(math.ceil(remaining)) end
					end
				end
			end)
		end

		local ignoredanimids = {
			"rbxassetid://114931311516664","rbxassetid://120901692290619",
			"rbxassetid://82304255503452","rbxassetid://89689207385037",
			"rbxassetid://126204660151980","rbxassetid://87183092926841",
		}
		local function issurvivorignored(surchar)
			if not surchar then return true end
			if surchar:GetAttribute("State") == "downed" then return true end
			if surchar:GetAttribute("Team") == "EXE" then return true end
			local h = surchar:FindFirstChildOfClass("Humanoid")
			if h then
				local anim = h:FindFirstChildOfClass("Animator")
				if anim then
					for _, tr in ipairs(anim:GetPlayingAnimationTracks()) do
						local aid = tr.Animation and tr.Animation.AnimationId
						if aid then
							for _, bid in ipairs(ignoredanimids) do
								if aid == bid then return true end
							end
						end
					end
				end
			end
			return false
		end
		local function isstunned()
			local sd = character:GetAttribute("StunDur")
			return sd and sd > 0
		end
		local slashhitradius = 8
		local tpseqbusy = false
		local function slashtpseq(strucktarget)
			if tpseqbusy then return end
			local struckhrp = strucktarget:FindFirstChild("HumanoidRootPart")
			if not struckhrp then return end
			local mychar = player.Character
			local myhrp = mychar and mychar:FindFirstChild("HumanoidRootPart")
			if not myhrp then return end
			tpseqbusy = true
			local origcf = myhrp.CFrame
			frozenmdlcf = currentmdlhrp and currentmdlhrp.CFrame or (origcf + Vector3.new(0,1,0))
			tpseqactive = true
			myhrp.CFrame = CFrame.new(struckhrp.Position + struckhrp.CFrame.LookVector * 4, struckhrp.Position)
			local tpstart = tick()
			local lastspam = 0
			local conn
			conn = RunService.Heartbeat:Connect(function(dt)
				if not struckhrp.Parent or not myhrp.Parent or tick()-tpstart >= 0.1 then conn:Disconnect() return end
				myhrp.CFrame = CFrame.new(struckhrp.Position + struckhrp.CFrame.LookVector * 4, struckhrp.Position)
				pcall(sethiddenproperty, myhrp, "PhysicsRepRootPart", struckhrp)
				lastspam += dt
				if lastspam >= 0.09 then
					lastspam = 0
					pcall(function() game.Players.LocalPlayer.PlayerGui:WaitForChild("Round").Game.RemoteFunction:InvokeServer(0) end)
				end
			end)
			task.wait(0.1)
			if conn.Connected then conn:Disconnect() end
			pcall(sethiddenproperty, myhrp, "PhysicsRepRootPart", myhrp)
			myhrp.CFrame = origcf
			tpseqactive = false
			frozenmdlcf = nil
			tpseqbusy = false
		end
		local function spawnslashprojectile(startpositionvalue, directionvector)
			if not slashassettemplate then return end
			local slashclone = slashassettemplate:Clone()
			slashclone.Anchored = true
			slashclone.CanCollide = false
			slashclone.Massless = true
			slashclone.CFrame = CFrame.new(startpositionvalue, startpositionvalue + directionvector)
			slashclone.Transparency = 0.7
			slashclone.Material = Enum.Material.ForceField
			slashclone.Color = Color3.fromRGB(255, 0, 0)
			slashclone.Parent = workspace
			local function getoutersize()
				local ping = player:GetNetworkPing()
				local pingscale = math.max(1.2, 1.2 + math.max(0, ping - 0.1) * 2)
				return Vector3.new(slashclone.Size.X * pingscale, slashclone.Size.Y, slashclone.Size.Z * pingscale)
			end
			local outerbox = Instance.new("Part")
			outerbox.Anchored = true
			outerbox.CanCollide = false
			outerbox.Massless = true
			outerbox.Size = getoutersize()
			outerbox.Transparency = 0.7
			outerbox.Material = Enum.Material.ForceField
			outerbox.Color = Color3.fromRGB(0, 255, 0)
			outerbox.CFrame = slashclone.CFrame
			outerbox.Parent = workspace
			local distancetraveled = 0
			local hitdetected = false
			local arg0fired = false
			local movementconnection
			movementconnection = RunService.Heartbeat:Connect(function(deltatime)
				if not slashclone or not slashclone.Parent then
					if movementconnection then movementconnection:Disconnect() end
					if outerbox and outerbox.Parent then outerbox:Destroy() end
					return
				end
				local stepamount = slashprojectilespeed * deltatime
				distancetraveled = distancetraveled + stepamount
				local newpositionvalue = slashclone.Position + directionvector * stepamount
				slashclone.CFrame = CFrame.new(newpositionvalue, newpositionvalue + directionvector)
				outerbox.CFrame = slashclone.CFrame
				outerbox.Size = getoutersize()
				if not arg0fired and not tpseqactive then
					local op = OverlapParams.new()
					op.FilterType = Enum.RaycastFilterType.Exclude
					op.FilterDescendantsInstances = {slashclone, outerbox, character, loadedModel}
					local outerhits = workspace:GetPartBoundsInBox(outerbox.CFrame, outerbox.Size, op)
					for _, hitpart in ipairs(outerhits) do
						local hitchar = hitpart:FindFirstAncestorOfClass("Model")
						if hitchar and hitchar ~= character and hitchar ~= loadedModel and hitchar:GetAttribute("Team") == "Survivor" and not issurvivorignored(hitchar) then
							arg0fired = true
							pcall(function() game.Players.LocalPlayer.PlayerGui:WaitForChild("Round").Game.RemoteFunction:InvokeServer(0) end)
							break
						end
					end
				end
				if not hitdetected and not tpseqactive then
					local op = OverlapParams.new()
					op.FilterType = Enum.RaycastFilterType.Exclude
					op.FilterDescendantsInstances = {slashclone, outerbox, character, loadedModel}
					local hits = workspace:GetPartBoundsInBox(slashclone.CFrame, slashclone.Size, op)
					for _, hitpart in ipairs(hits) do
						local hitchar = hitpart:FindFirstAncestorOfClass("Model")
						if hitchar and hitchar ~= character and hitchar ~= loadedModel and hitchar:GetAttribute("Team") == "Survivor" and not issurvivorignored(hitchar) then
							hitdetected = true
							movementconnection:Disconnect()
							slashclone:Destroy()
							if outerbox and outerbox.Parent then outerbox:Destroy() end
							task.spawn(slashtpseq, hitchar)
							return
						end
					end
				end
				if distancetraveled >= slashprojectilemaxdistance then
					movementconnection:Disconnect()
					slashclone:Destroy()
					if outerbox and outerbox.Parent then outerbox:Destroy() end
				end
			end)
		end

		local function activateslashm1()
			if slashm1abilityinuse or slashm1cooldownactive or tpseqactive or isstunned() then return end
			if not slashm1keyframesequence then return end
			slashm1abilityinuse = true
			slashm1cooldownactive = true
			local hrpref = humanoidRootPart
			if not hrpref then
				slashm1abilityinuse = false
				slashm1cooldownactive = false
				return
			end
			stopAllAnimations()
			abilityanimlock = true
			getgenv().Animator6D(slashm1keyframesequence, 1, false, loadedModel)
			task.wait(0.2)
			local rawlookvector = hrpref.CFrame.LookVector
			local flatdirectionvector = Vector3.new(rawlookvector.X, 0, rawlookvector.Z).Unit
			spawnslashprojectile(hrpref.Position + flatdirectionvector * 3, flatdirectionvector)
			local animationduration = slashm1keyframesequence:FindFirstChild("Keyframe") and 0.5 or 0.5
			task.wait(animationduration)
			slashm1abilityinuse = false
			abilityanimlock = false
			updateAnimations()
			startcd("M1", slashm1cooldowntimer, function() slashm1cooldownactive = false end)
		end

		local fugacooldownactive = false
		local fugacdtimer = 3
		local fugarmed = false
		local fugaorbitconn = nil
		local fugaorbitpart = nil
		local fugaorbitpos = nil
		local fugaanimating = false

		local function getKFSeqDuration(kfseq)
			if not kfseq then return 6 end
			local mx = 0
			for _, kf in ipairs(kfseq:GetChildren()) do
				if kf:IsA("Keyframe") and kf.Time > mx then mx = kf.Time end
			end
			return mx > 0 and mx or 6
		end

		local function findpartinmodel(mdl, kws)
			for _, desc in mdl:GetDescendants() do
				if desc:IsA("BasePart") then
					local n = desc.Name:lower()
					local ok = true
					for _, kw in ipairs(kws) do if not n:find(kw:lower()) then ok = false break end end
					if ok then return desc end
				end
			end
		end

		local function applyarmfx()
			local lf = assetsfolderlocation:FindFirstChild("leftarm")
			local rf = assetsfolderlocation:FindFirstChild("rightarm")
			local lp = loadedModel:FindFirstChild("Left Arm", true)
			local rp = loadedModel:FindFirstChild("Right Arm", true)
			local spawned = {}
			if lf and lp then for _,c in ipairs(lf:GetChildren()) do local cl=c:Clone() cl.Parent=lp table.insert(spawned,cl) end end
			if rf and rp then for _,c in ipairs(rf:GetChildren()) do local cl=c:Clone() cl.Parent=rp table.insert(spawned,cl) end end
			return spawned
		end

		local function removearmfx(spawned)
			for _, obj in ipairs(spawned) do if obj and obj.Parent then obj:Destroy() end end
		end

		local function spawnfugaexplosion(pos)
			local tsref = game:GetService("TweenService")
			local db = game:GetService("Debris")
			local flash = Instance.new("Part")
			flash.Shape = Enum.PartType.Ball flash.Material = Enum.Material.Neon
			flash.Color = Color3.fromRGB(255,255,200) flash.Size = Vector3.one*22
			flash.Position = pos flash.Anchored = true
			flash.CanCollide = false flash.CanQuery = false flash.CanTouch = false flash.CastShadow = false
			flash.Parent = workspace
			tsref:Create(flash,TweenInfo.new(0.22),{Size=Vector3.one*70,Transparency=1}):Play()
			db:AddItem(flash,0.25)
			local sphere = Instance.new("Part")
			sphere.Shape = Enum.PartType.Ball sphere.Material = Enum.Material.Neon
			sphere.Color = Color3.fromRGB(210,55,0) sphere.Size = Vector3.one*14
			sphere.Transparency = 0.15 sphere.Position = pos sphere.Anchored = true
			sphere.CanCollide = false sphere.CanQuery = false sphere.CanTouch = false sphere.CastShadow = false
			sphere.Parent = workspace
			local light = Instance.new("PointLight")
			light.Color = Color3.fromRGB(255,100,0) light.Brightness = 40 light.Range = 280 light.Parent = sphere
			tsref:Create(sphere,TweenInfo.new(0.55,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=Vector3.one*190,Transparency=0.55}):Play()
			tsref:Create(light,TweenInfo.new(0.55),{Brightness=0}):Play()
			task.delay(0.55,function()
				tsref:Create(sphere,TweenInfo.new(0.5),{Size=Vector3.one*240,Transparency=1}):Play()
				db:AddItem(sphere,0.55)
			end)
			for i=1,5 do
				task.delay(i*0.065,function()
					local ring = Instance.new("Part")
					ring.Shape = Enum.PartType.Cylinder ring.Material = Enum.Material.Neon
					ring.Color = i%2==0 and Color3.fromRGB(255,130,0) or Color3.fromRGB(220,40,0)
					ring.Size = Vector3.new(2,8,8)
					ring.CFrame = CFrame.new(pos)*CFrame.Angles(math.random()*math.pi,math.random()*math.pi*2,0)*CFrame.Angles(0,math.rad(90),0)
					ring.Anchored = true ring.CanCollide = false ring.CanQuery = false ring.CanTouch = false ring.CastShadow = false
					ring.Parent = workspace
					tsref:Create(ring,TweenInfo.new(0.7,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=Vector3.new(2,220,220),Transparency=1}):Play()
					db:AddItem(ring,0.75)
				end)
			end
			local gring = Instance.new("Part")
			gring.Shape = Enum.PartType.Cylinder gring.Material = Enum.Material.Neon
			gring.Color = Color3.fromRGB(255,70,0) gring.Size = Vector3.new(0.8,6,6)
			gring.CFrame = CFrame.new(pos)*CFrame.Angles(0,0,math.rad(90))
			gring.Anchored = true gring.CanCollide = false gring.CanQuery = false gring.CanTouch = false gring.CastShadow = false
			gring.Parent = workspace
			tsref:Create(gring,TweenInfo.new(0.8,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Size=Vector3.new(0.8,255,255),Transparency=1}):Play()
			db:AddItem(gring,0.85)
		end

		local function doFugaTp(targethrp)
			local mychar = player.Character
			local myhrp = mychar and mychar:FindFirstChild("HumanoidRootPart")
			if not myhrp then return end
			local origcf = myhrp.CFrame
			frozenmdlcf = currentmdlhrp and currentmdlhrp.CFrame or (origcf+Vector3.new(0,1,0))
			tpseqactive = true tpseqbusy = true
			myhrp.CFrame = CFrame.new(targethrp.Position+targethrp.CFrame.LookVector*4,targethrp.Position)
			local tpstart = tick() local lastspam = 0
			local tpconn
			tpconn = RunService.Heartbeat:Connect(function(dt)
				if not targethrp.Parent or not myhrp.Parent or tick()-tpstart>=1.6 then tpconn:Disconnect() return end
				myhrp.CFrame = CFrame.new(targethrp.Position+targethrp.CFrame.LookVector*4,targethrp.Position)
				pcall(sethiddenproperty,myhrp,"PhysicsRepRootPart",targethrp)
				lastspam += dt
				if lastspam>=0.09 then
					lastspam=0
					pcall(function() game.Players.LocalPlayer.PlayerGui:WaitForChild("Round").Game.RemoteFunction:InvokeServer(0) end)
				end
			end)
			task.wait(1.6)
			if tpconn.Connected then tpconn:Disconnect() end
			pcall(sethiddenproperty,myhrp,"PhysicsRepRootPart",myhrp)
			myhrp.CFrame = origcf
			tpseqactive = false frozenmdlcf = nil tpseqbusy = false
		end

		local function detonate()
			if not fugarmed or not fugaorbitpos then return end
			local detonpos = fugaorbitpos
			if fugaorbitconn then fugaorbitconn:Disconnect() fugaorbitconn = nil end
			if fugaorbitpart and fugaorbitpart.Parent then fugaorbitpart:Destroy() end
			fugaorbitpart = nil fugarmed = false
			fugaanimating = false abilityanimlock = false
			spawnfugaexplosion(detonpos)
			local closestdist = math.huge local closesthrp = nil
			for _, obj in ipairs(workspace:GetDescendants()) do
				if obj:IsA("Model") and obj:GetAttribute("Team")=="Survivor" and not issurvivorignored(obj) then
					local hrp = obj:FindFirstChild("HumanoidRootPart")
					if hrp then
						local d = (hrp.Position-detonpos).Magnitude
						if d<=220 and d<closestdist then closestdist=d closesthrp=hrp end
					end
				end
			end
			fugacooldownactive = true
			if closesthrp then doFugaTp(closesthrp) else task.spawn(showmissbillboard) end
			startcd("ABI1", fugacdtimer, function() fugacooldownactive = false end)
		end

		local airfugacdactive = false
		local airfugacdtimer = 3

		local function activateairfuga()
			if airfugacdactive or tpseqactive or fugaanimating or isstunned() then return end
			local mychar = player.Character
			local myhrp = mychar and mychar:FindFirstChild("HumanoidRootPart")
			if not myhrp then return end
			fugaanimating = true abilityanimlock = true airfugacdactive = true
			local rayparam = RaycastParams.new()
			rayparam.FilterType = Enum.RaycastFilterType.Exclude
			rayparam.FilterDescendantsInstances = {character, loadedModel}
			local rayresult = workspace:Raycast(myhrp.Position + Vector3.new(0,1,0), Vector3.new(0,32,0), rayparam)
			local targetY = myhrp.Position.Y + 30
			if rayresult then targetY = math.min(targetY, rayresult.Position.Y - 3) end
			local floatpos = Vector3.new(myhrp.Position.X, targetY, myhrp.Position.Z)
			local bv = Instance.new("BodyVelocity")
			bv.MaxForce = Vector3.new(0,1e6,0)
			bv.Velocity = Vector3.new(0,50,0)
			bv.Parent = myhrp
			local facingconn = nil
			local reachedtop = false
			local riseconn
			riseconn = RunService.Heartbeat:Connect(function()
				if not myhrp or not myhrp.Parent then
					if riseconn then riseconn:Disconnect() end return
				end
				if myhrp.Position.Y >= targetY - 0.5 and not reachedtop then
					reachedtop = true
					riseconn:Disconnect()
					if bv and bv.Parent then bv:Destroy() end
					myhrp.CFrame = CFrame.new(floatpos)
					tpseqactive = true
					frozenmdlcf = CFrame.new(floatpos + Vector3.new(0,1,0))
					facingconn = RunService.Heartbeat:Connect(function()
						local uis2 = game:GetService("UserInputService")
						local dir
						if uis2.TouchEnabled and not uis2.MouseEnabled then
							dir = workspace.CurrentCamera.CFrame.LookVector
						else
							local m2 = player:GetMouse()
							local raw = m2.Hit.Position - (floatpos + Vector3.new(0,1,0))
							dir = raw.Magnitude > 0.001 and raw.Unit or workspace.CurrentCamera.CFrame.LookVector
						end
						frozenmdlcf = CFrame.new(floatpos + Vector3.new(0,1,0), floatpos + Vector3.new(0,1,0) + dir)
					end)
				end
			end)
			if fugaonkfseq then getgenv().Animator6D(fugaonkfseq,1,false,loadedModel) end
			local armfxobjs = applyarmfx()
			task.spawn(function()
				task.wait(3.4)
				if facingconn and facingconn.Connected then facingconn:Disconnect() end
				if riseconn and riseconn.Connected then riseconn:Disconnect() end
				if bv and bv.Parent then bv:Destroy() end
				local function airfugafinish()
					removearmfx(armfxobjs)
					fugaanimating = false abilityanimlock = false
					stopAllAnimations() updateAnimations()
					startcd("ABI1", airfugacdtimer, function() airfugacdactive = false end)
				end
				if not fugaanimating or not fugaarrowtemplate then
					tpseqactive = false frozenmdlcf = nil
					airfugafinish()
					return
				end
				local uis = game:GetService("UserInputService")
				local aimdir
				if uis.TouchEnabled and not uis.MouseEnabled then
					aimdir = workspace.CurrentCamera.CFrame.LookVector.Unit
				else
					local mouse = player:GetMouse()
					local raw = mouse.Hit.Position - floatpos
					aimdir = raw.Magnitude > 0.001 and raw.Unit or workspace.CurrentCamera.CFrame.LookVector.Unit
				end
				local fixedcf = CFrame.new(floatpos + Vector3.new(0,1,0), floatpos + Vector3.new(0,1,0) + aimdir)
				local modelconn = RunService.Heartbeat:Connect(function() frozenmdlcf = fixedcf end)
				local arrow = fugaarrowtemplate:Clone()
				arrow.Anchored = true arrow.CanCollide = false arrow.Massless = true
				local arrowstart = floatpos + aimdir * 3
				arrow.CFrame = CFrame.new(arrowstart, arrowstart + aimdir)
				arrow.Parent = workspace
				local arrowspeed = 200 local maxarrowdist = 120
				local arrowdist = 0 local hitfound = false
				local arrowconn
				local function onhit(lastpos)
					if modelconn.Connected then modelconn:Disconnect() end
					spawnfugaexplosion(lastpos)
					local closestdist = math.huge local closesthrp = nil
					for _, obj in ipairs(workspace:GetDescendants()) do
						if obj:IsA("Model") and obj:GetAttribute("Team") == "Survivor" and not issurvivorignored(obj) then
							local hrp = obj:FindFirstChild("HumanoidRootPart")
							if hrp then
								local d = (hrp.Position - lastpos).Magnitude
								if d <= 220 and d < closestdist then closestdist = d closesthrp = hrp end
							end
						end
					end
					tpseqactive = false frozenmdlcf = nil
					if closesthrp then doFugaTp(closesthrp) else task.spawn(showmissbillboard) end
					airfugafinish()
				end
				arrowconn = RunService.Heartbeat:Connect(function(dt)
					if not arrow or not arrow.Parent then
						if arrowconn then arrowconn:Disconnect() end return
					end
					local step = arrowspeed * dt
					arrowdist = arrowdist + step
					local newpos = arrow.Position + aimdir * step
					arrow.CFrame = CFrame.new(newpos, newpos + aimdir)
					if not hitfound then
						local op = OverlapParams.new()
						op.FilterType = Enum.RaycastFilterType.Exclude
						op.FilterDescendantsInstances = {arrow, character, loadedModel}
						local hits = workspace:GetPartBoundsInBox(arrow.CFrame, arrow.Size, op)
						for _, hitpart in ipairs(hits) do
							if not hitpart or not hitpart.Parent then continue end
							local hitcharmodel = hitpart:FindFirstAncestorOfClass("Model")
							local issurvivor = hitcharmodel and hitcharmodel:GetAttribute("Team") == "Survivor"
							local iswall = hitpart.CanCollide and not hitcharmodel
							if issurvivor or iswall then
								hitfound = true
								local lastpos = arrow.Position
								arrowconn:Disconnect()
								arrow:Destroy()
								task.spawn(onhit, lastpos)
								return
							end
						end
					end
					if arrowdist >= maxarrowdist then
						local lastpos = arrow.Position
						arrowconn:Disconnect()
						arrow:Destroy()
						if not hitfound then task.spawn(onhit, lastpos) end
					end
				end)
			end)
		end

		local function activatefuga()
			if tpseqactive or isstunned() then return end
			if fugarmed then task.spawn(detonate) return end
			local hstate = Humanoid:GetState()
			if hstate == Enum.HumanoidStateType.Freefall or hstate == Enum.HumanoidStateType.Jumping then
				task.spawn(activateairfuga)
				return
			end
			if fugacooldownactive or fugaanimating then return end
			fugaanimating = true
			if fugaonkfseq then getgenv().Animator6D(fugaonkfseq,1,false,loadedModel) end
			local armfxobjs = applyarmfx()
			local animdur = getKFSeqDuration(fugaonkfseq)
			task.spawn(function()
				task.wait(3.4)
				if not fugaanimating then removearmfx(armfxobjs) return end
				if not fugaarrowtemplate then fugaanimating=false removearmfx(armfxobjs) return end
				local mychar = player.Character
				local myhrp = mychar and mychar:FindFirstChild("HumanoidRootPart")
				local spawnpos = myhrp and myhrp.Position or Vector3.new(0,5,0)
				fugaorbitpos = spawnpos
				local arrow = fugaarrowtemplate:Clone()
				arrow.Anchored=true arrow.CanCollide=false arrow.Massless=true arrow.Parent=workspace
				fugaorbitpart = arrow
				local angle=0 local orbitrad=4 local orbitspd=math.pi*1.5
				fugaorbitconn = RunService.Heartbeat:Connect(function(dt)
					if not arrow.Parent then if fugaorbitconn then fugaorbitconn:Disconnect() fugaorbitconn=nil end return end
					angle += orbitspd*dt
					local ox=spawnpos.X+math.cos(angle)*orbitrad
					local oz=spawnpos.Z+math.sin(angle)*orbitrad
					local npos=Vector3.new(ox,spawnpos.Y+2,oz)
					local ldir=Vector3.new(math.cos(angle+math.pi/2),0,math.sin(angle+math.pi/2))
					arrow.CFrame=CFrame.new(npos,npos+ldir)
				end)
				fugarmed = true
				local remaining = animdur-3.4
				if remaining>0 then task.wait(remaining) end
				removearmfx(armfxobjs)
				fugaanimating = false
				abilityanimlock = false
				stopAllAnimations()
				updateAnimations()
			end)
		end

		local shrinerunning = false
		local shrinecd = 26
		local shrinecdactive = false

		local function activateshrine()
			if shrinecdactive or tpseqactive or shrinerunning or isstunned() then return end
			shrinerunning = true
			shrinecdactive = true
			task.spawn(function()
				pcall(function()
					game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Round"):WaitForChild("Game"):WaitForChild("RemoteFunction"):InvokeServer(2)
				end)
			end)
			local mychar = player.Character
			local myhrp = mychar and mychar:FindFirstChild("HumanoidRootPart")
			if not myhrp or not shrineassetstemplate then
				shrinerunning = false shrinecdactive = false return
			end
			local shrinemodelsrc = shrineassetstemplate:FindFirstChild("Shrine")
			local shrineslashessrc = shrineassetstemplate:FindFirstChild("ShrineSlashes")
			local lv = myhrp.CFrame.LookVector
			local backflat = myhrp.Position - Vector3.new(lv.X, 0, lv.Z).Unit * 15
			local shrinepos = Vector3.new(backflat.X, myhrp.Position.Y + 15, backflat.Z)
			local shrineclone = shrinemodelsrc and shrinemodelsrc:Clone() or nil
			if shrineclone then
				pcall(function()
					shrineclone:PivotTo(CFrame.new(shrinepos, Vector3.new(myhrp.Position.X, shrinepos.Y, myhrp.Position.Z)))
				end)
				shrineclone.Parent = workspace
			end
			local slashesclone = shrineslashessrc and shrineslashessrc:Clone() or nil
			local slashesprimary = nil
			if slashesclone then
				if slashesclone:IsA("BasePart") then
					slashesclone.Anchored = true
					slashesclone.CanCollide = false
					slashesprimary = slashesclone
					slashesclone.CFrame = myhrp.CFrame
					slashesclone.Parent = workspace
				else
					for _, p in ipairs(slashesclone:GetDescendants()) do
						if p:IsA("BasePart") then
							p.Anchored = true p.CanCollide = false
							if not slashesprimary then slashesprimary = p end
						end
					end
					pcall(function() slashesclone:PivotTo(myhrp.CFrame) end)
					slashesclone.Parent = workspace
				end
			end
			local shrineorigcf = myhrp.CFrame
			frozenmdlcf = currentmdlhrp and currentmdlhrp.CFrame or (myhrp.CFrame + Vector3.new(0, 1, 0))
			tpseqactive = true
			local introsnd = Instance.new("Sound")
			introsnd.SoundId = "rbxassetid://7817341182"
			introsnd.Volume = 1
			introsnd.Parent = workspace
			introsnd:Play()
			game:GetService("Debris"):AddItem(introsnd, 10)
			local shrinesnd = nil
			pcall(function()
				if shrinemusicid then
					shrinesnd = Instance.new("Sound")
					shrinesnd.SoundId = shrinemusicid
					shrinesnd.Volume = 1
					shrinesnd.Looped = true
					shrinesnd.Parent = workspace
					shrinesnd:Play()
				end
			end)
			local blackgui = Instance.new("ScreenGui")
			blackgui.Name = "shrineblackscreen"
			blackgui.ResetOnSpawn = false
			blackgui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			blackgui.IgnoreGuiInset = true
			pcall(function() blackgui.ScreenInsets = Enum.ScreenInsets.None end)
			blackgui.Parent = player.PlayerGui
			local blackframe = Instance.new("Frame")
			blackframe.Size = UDim2.new(1, 0, 1, 0)
			blackframe.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			blackframe.BorderSizePixel = 0
			blackframe.BackgroundTransparency = 0
			blackframe.ZIndex = 10
			blackframe.Parent = blackgui
			local soundvols = {}
			for _, snd in ipairs(workspace:GetDescendants()) do
				if snd:IsA("Sound") and snd ~= introsnd and snd ~= shrinesnd then
					soundvols[snd] = snd.Volume
					snd.Volume = 0
				end
			end
			local shrinesoundconn = workspace.DescendantAdded:Connect(function(obj)
				if obj:IsA("Sound") and obj ~= introsnd and obj ~= shrinesnd then
					soundvols[obj] = obj.Volume
					obj.Volume = 0
				end
				if obj:IsA("ParticleEmitter") then
					pcall(function() obj:Destroy() end)
				end
			end)
			task.wait(2.5)
			if not myhrp.Parent then
				shrinerunning = false shrinecdactive = false
				if shrineclone and shrineclone.Parent then shrineclone:Destroy() end
				if slashesclone and slashesclone.Parent then slashesclone:Destroy() end
				if blackgui and blackgui.Parent then blackgui:Destroy() end
				if shrinesnd and shrinesnd.Parent then shrinesnd:Destroy() end
				return
			end
			task.spawn(function()
				local tok, tobj = pcall(game.GetObjects, game, "rbxassetid://70513817759709")
				local transGui = nil local used = false
				if tok and tobj and #tobj > 0 then
					transGui = tobj[1]:Clone()
					transGui.ResetOnSpawn = false transGui.IgnoreGuiInset = true transGui.DisplayOrder = 20
					pcall(function() transGui.ScreenInsets = Enum.ScreenInsets.None end)
					transGui.Parent = player.PlayerGui
					local vp = transGui:FindFirstChildWhichIsA("ViewportFrame", true)
					if vp then
						used = true
						vp.CurrentCamera = workspace.CurrentCamera
						if shrineclone and shrineclone.Parent then
							local sc2 = shrineclone:Clone()
							for _, p in ipairs(sc2:GetDescendants()) do if p:IsA("BasePart") then p.Anchored=true p.CanCollide=false end end
							sc2.Parent = vp
						end
						if loadedModel and loadedModel.Parent then
							local lm2 = loadedModel:Clone()
							for _, p in ipairs(lm2:GetDescendants()) do if p:IsA("BasePart") then p.Anchored=true p.CanCollide=false end end
							lm2.Parent = vp
						end
						local cam2 = workspace.CurrentCamera
						local qdist = 0.11
						local anim = 1
						local tc
						tc = RunService.RenderStepped:Connect(function(dt)
							if not vp.Parent then tc:Disconnect() return end
							anim = math.max(0, anim - dt/0.75)
							local h2 = math.tan(math.rad(cam2.FieldOfView)/2)*qdist*2
							local w2 = h2*(vp.AbsoluteSize.X/math.max(1,vp.AbsoluteSize.Y))
							local ml = math.min(w2,h2)+0.001
							local maxD = ml/math.sqrt(2)
							local dtc = (1-anim)*maxD
							local look = cam2.CFrame.LookVector
							local right = cam2.CFrame.RightVector
							local up = cam2.CFrame.UpVector
							local q1r = vp:FindFirstChild("MaskQuadrant1")
							local qhz = q1r and q1r.Size.Z/2 or 0.5
							local lo = look*(qdist+qhz)
							local diag = 1/math.sqrt(2)
							local ro1 = (right+up)*diag*dtc
							local ro2 = (right-up)*diag*dtc
							local qd = {
								{"MaskQuadrant1", ro1, up},
								{"MaskQuadrant2", ro2, right},
								{"MaskQuadrant3", -ro1, -up},
								{"MaskQuadrant4", -ro2, -right},
							}
							for _, q in qd do
								local qn = vp:FindFirstChild(q[1])
								if qn then qn.CFrame = CFrame.lookAlong(cam2.CFrame.Position+lo+q[2], look, q[3]) end
							end
							if anim <= 0 then
								tc:Disconnect()
								if transGui and transGui.Parent then transGui:Destroy() end
								if blackgui and blackgui.Parent then blackgui:Destroy() end
							end
						end)
					end
				end
				if not used then
					game:GetService("TweenService"):Create(blackframe, TweenInfo.new(0.5), {BackgroundTransparency=1}):Play()
					task.delay(0.5, function()
						if blackgui and blackgui.Parent then blackgui:Destroy() end
						if transGui and transGui.Parent then transGui:Destroy() end
					end)
				end
			end)
			local shrineended = false
			local shootendconn
			shootendconn = myhrp.ChildAdded:Connect(function(child)
				if child:IsA("Sound") and child.Name == "ShootEnd" then
					shrineended = true
				end
			end)
			for _, snd in ipairs(myhrp:GetChildren()) do
				if snd:IsA("Sound") and snd.Name == "ShootEnd" then shrineended = true end
			end
			local currtarget = nil
			local camconn = RunService.Heartbeat:Connect(function()
				if not currtarget or not currtarget.Parent then return end
				pcall(function()
					local mychar2 = player.Character
					local cam = mychar2 and mychar2:FindFirstChild("cam")
					local mouse = cam and cam:FindFirstChild("Mouse")
					if not mouse then return end
					local orig = myhrp.Position
					local tpos = currtarget.Position
					local dir = (tpos - orig).Unit
					mouse:FireServer({
						Direction = dir,
						etc = tpos,
						Origin = orig
					})
				end)
			end)
			task.spawn(function()
				local sidx = 1
				local function getsurvisors()
					local list = {}
					for _, obj in ipairs(workspace:GetDescendants()) do
						if obj:IsA("Model") and obj:GetAttribute("Team") == "Survivor" and not issurvivorignored(obj) then
							local hrp = obj:FindFirstChild("HumanoidRootPart")
							if hrp then table.insert(list, {hrp = hrp, name = obj.Name}) end
						end
					end
					table.sort(list, function(a, b) return a.name < b.name end)
					local sorted = {}
					for _, e in ipairs(list) do table.insert(sorted, e.hrp) end
					return sorted
				end
				local shrinemaxend = tick() + 11
				while not shrineended and tick() < shrinemaxend do
					local survivors = getsurvisors()
					if #survivors > 0 then
						if sidx > #survivors then sidx = 1 end
						currtarget = survivors[sidx]
						sidx = sidx + 1
						if currtarget and currtarget.Parent and myhrp and myhrp.Parent then
							local tgt = currtarget
							myhrp.CFrame = CFrame.new(tgt.Position + tgt.CFrame.LookVector * 4, tgt.Position)
							local stepstart = tick()
							local lastspam = 0
							local stepconn
							stepconn = RunService.Heartbeat:Connect(function(dt)
								if shrineended or tick() - stepstart >= 0.4 then
									if stepconn then stepconn:Disconnect() end
									return
								end
								if not tgt.Parent or not myhrp.Parent then
									if stepconn then stepconn:Disconnect() end
									return
								end
								myhrp.CFrame = CFrame.new(tgt.Position + tgt.CFrame.LookVector * 4, tgt.Position)
								pcall(sethiddenproperty, myhrp, "PhysicsRepRootPart", tgt)
								lastspam += dt
								if lastspam >= 0.09 then
									lastspam = 0
									pcall(function() game.Players.LocalPlayer.PlayerGui:WaitForChild("Round").Game.RemoteFunction:InvokeServer(0) end)
								end
							end)
							task.wait(0.4)
							if stepconn and stepconn.Connected then stepconn:Disconnect() end
						else
							task.wait(0.4)
						end
					else
						task.wait(0.4)
					end
				end
				if shootendconn and shootendconn.Connected then shootendconn:Disconnect() end
				pcall(sethiddenproperty, myhrp, "PhysicsRepRootPart", myhrp)
				myhrp.CFrame = shrineorigcf
				tpseqactive = false frozenmdlcf = nil
				shrinerunning = false currtarget = nil
				camconn:Disconnect()
				if shrineclone and shrineclone.Parent then shrineclone:Destroy() end
				if slashesclone and slashesclone.Parent then slashesclone:Destroy() end
				if shrinesnd and shrinesnd.Parent then
					game:GetService("TweenService"):Create(shrinesnd, TweenInfo.new(0.7), {Volume = 0}):Play()
					task.delay(0.7, function() if shrinesnd and shrinesnd.Parent then shrinesnd:Destroy() end end)
				end
				local mycharend = player.Character
				local myhrpend = mycharend and mycharend:FindFirstChild("HumanoidRootPart")
				if myhrpend then
					for _, snd in ipairs(myhrpend:GetChildren()) do
						if snd:IsA("Sound") and snd.Name == "LaserLoop" then
							snd:Destroy()
						end
					end
				end
				if shrinesoundconn then shrinesoundconn:Disconnect() end
				task.spawn(function()
					local tsref = game:GetService("TweenService")
					for snd, vol in pairs(soundvols) do
						if snd and snd.Parent then
							tsref:Create(snd, TweenInfo.new(0.8), {Volume = vol}):Play()
						end
					end
				end)
				startcd("ABI2", shrinecd, function() shrinecdactive = false end)
			end)
		end

		RunService.Heartbeat:Connect(function()
			if not isstunned() then return end
			if slashm1abilityinuse then
				slashm1abilityinuse = false slashm1cooldownactive = false abilityanimlock = false
			end
			if fugaanimating then
				fugaanimating = false abilityanimlock = false
				if fugaorbitconn then fugaorbitconn:Disconnect() fugaorbitconn = nil end
				if fugaorbitpart and fugaorbitpart.Parent then fugaorbitpart:Destroy() end
				fugarmed = false
			end
			if tpseqactive then
				tpseqactive = false frozenmdlcf = nil tpseqbusy = false
			end
		end)
		do
			local CollectionService = game:GetService("CollectionService")
			RunService.Heartbeat:Connect(function()
				if CollectionService:HasTag(character, "Stunned") then
					CollectionService:RemoveTag(character, "Stunned")
				end
				local cs = Humanoid:GetState()
				if cs == Enum.HumanoidStateType.Physics or cs == Enum.HumanoidStateType.Ragdoll or
					cs == Enum.HumanoidStateType.FallingDown or cs == Enum.HumanoidStateType.PlatformStanding then
					Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
				end
			end)
		end
		local stuntrailstop = nil
		local stuntick = 0
		RunService.Heartbeat:Connect(function(dt)
			stuntick += dt
			if stuntick < 0.08 then return end
			stuntick = 0
			local nowstunned = isstunned()
			if nowstunned and not stunactive then
				stunactive = true
				pcall(function() character:SetAttribute("SpeedBoost", 0.3) end)
				if AfterImageModule and loadedModel then
					stuntrailstop = AfterImageModule.Trail({
						Target = loadedModel, Mode = "OM",
						OverrideTransparency = 0.5, Duration = 1.4, Interval = 0.28, MaxImages = 12,
						OM = {fadein = 0.12, hold = 0.7, fadeout = 0.58, color = Color3.fromRGB(60, 0, 0)}
					})
				end
			elseif not nowstunned and stunactive then
				stunactive = false
				pcall(function() character:SetAttribute("SpeedBoost", 1) end)
				if stuntrailstop then stuntrailstop() stuntrailstop = nil end
				stopAllAnimations()
				updateAnimations()
			end
			if stunactive and not abilityanimlock then
				local movedir = Humanoid.MoveDirection
				local targetstun = movedir.Magnitude > 0.1 and "stunnedwalk" or "stunnedstand"
				local kfseq = targetstun == "stunnedwalk" and stunnedwalkkfseq or stunnedstandkfseq
				if kfseq and currentAnimation ~= targetstun then
					getgenv().Animator6DStop()
					for _, v in pairs(ANIMATIONS) do v.isPlaying = false end
					getgenv().Animator6D(kfseq, 1, true, loadedModel)
					currentAnimation = targetstun
				end
			end
		end)
		do
			local passiveactive = false
			local lastneartime = tick()
			local passivetrailstop = nil
			local passivetick = 0
			RunService.Heartbeat:Connect(function(dt)
				passivetick += dt
				if passivetick < 0.5 then return end
				passivetick = 0
				if not character or not character.Parent then return end
				if tpseqactive then return end
				local myhrp2 = character:FindFirstChild("HumanoidRootPart")
				if not myhrp2 then return end
				local nearsurvivor = false
				local threshold = passiveactive and 70 or 60
				for _, obj in ipairs(workspace:GetDescendants()) do
					if obj:IsA("Model") and obj:GetAttribute("Team") == "Survivor" then
						local shrp = obj:FindFirstChild("HumanoidRootPart")
						if shrp and (shrp.Position - myhrp2.Position).Magnitude < threshold then
							nearsurvivor = true
							break
						end
					end
				end
				if nearsurvivor then
					lastneartime = tick()
					if passiveactive then
						passiveactive = false
						pcall(function() character:SetAttribute("SpeedBoost", 1) end)
						if passivetrailstop then passivetrailstop() passivetrailstop = nil end
					end
				elseif tick() - lastneartime >= 5 and not passiveactive then
					passiveactive = true
					pcall(function() character:SetAttribute("SpeedBoost", 2.5) end)
					if AfterImageModule and loadedModel then
						passivetrailstop = AfterImageModule.Trail({
							Target = loadedModel, Mode = "OM",
							OverrideTransparency = 0.35, Duration = 0.5, Interval = 0.05,
							OM = {fadein = 0.05, hold = 0.15, fadeout = 0.3, color = Color3.fromRGB(140, 0, 0)}
						})
					end
				end
			end)
		end
		do
			local slowbbactive = false
			local slowbbguis = {}
			local slowabovetimer = 0
			local ts3 = game:GetService("TweenService")
			RunService.Heartbeat:Connect(function(dt)
				if not character or not character.Parent then return end
				if not missbbtemplate then return end
				local ws = Humanoid.WalkSpeed
				if ws < 17 then
					slowabovetimer = 0
					if not slowbbactive then
						slowbbactive = true
						for _, obj in ipairs(workspace:GetDescendants()) do
							if obj:IsA("Model") and obj:GetAttribute("Team") == "Survivor" then
								local hrp = obj:FindFirstChild("HumanoidRootPart")
								if hrp then
									local bb = missbbtemplate:Clone()
									bb.Parent = hrp
									local img = bb:FindFirstChildWhichIsA("ImageLabel", true)
									if img then
										img.ImageTransparency = 1
										ts3:Create(img, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
									end
									table.insert(slowbbguis, {bb = bb, img = img})
								end
							end
						end
					end
				else
					if slowbbactive then
						slowabovetimer += dt
						if slowabovetimer >= 1 then
							slowbbactive = false slowabovetimer = 0
							for _, entry in ipairs(slowbbguis) do
								if entry.img and entry.img.Parent then
									ts3:Create(entry.img, TweenInfo.new(0.35), {ImageTransparency = 1}):Play()
									local bbref = entry.bb
									task.delay(0.4, function() if bbref and bbref.Parent then bbref:Destroy() end end)
								end
							end
							slowbbguis = {}
						end
					end
				end
			end)
		end
		local quickshrinecdactive = false
		local quickshrinecd = 26

		local function playquickshrinecut()
			local ts2 = game:GetService("TweenService")
			local cam = workspace.CurrentCamera
			local vps = cam.ViewportSize
			local diag = (vps.X + vps.Y) * 1.6
			local zw, zh = math.floor(vps.X * 1.02), math.floor(vps.Y * 1.02)
			local frozencf = cam.CFrame
			local frozenfov = cam.FieldOfView
			local imgcol = Color3.fromRGB(212, 184, 184)
			local amb = Color3.fromRGB(150, 140, 140)
			local lc = Color3.fromRGB(242, 236, 236)
			local bgcol = Color3.fromRGB(10, 6, 8)
			local lined = Vector2.new(-0.7071, 0.7071)
			local perp = Vector2.new(0.7071, 0.7071)
			local sg = Instance.new("ScreenGui")
			sg.Name = "qs_cut" sg.ResetOnSpawn = false sg.IgnoreGuiInset = true
			sg.DisplayOrder = 999
			pcall(function() sg.ScreenInsets = Enum.ScreenInsets.None end)
			sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling sg.Parent = player.PlayerGui
			local flash = Instance.new("Frame")
			flash.Size = UDim2.new(1, 0, 1, 0) flash.BackgroundColor3 = Color3.new(1, 1, 1)
			flash.BackgroundTransparency = 1 flash.BorderSizePixel = 0
			flash.ZIndex = 50 flash.Parent = sg
			ts2:Create(flash, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 0}):Play()
			local t0 = tick()
			local snapfolder = Instance.new("Folder")
			do
				local campos = frozencf.Position
				local descs = workspace:GetDescendants()
				local cands = {}
				local i = 1
				while i <= #descs do
					local last = math.min(i + 4499, #descs)
					for j = i, last do
						local obj = descs[j]
						if obj:IsA("BasePart") and not obj:IsA("Terrain") and obj.Transparency < 0.95 then
							local d = (obj.Position - campos).Magnitude
							if d <= 350 then cands[#cands + 1] = {o = obj, d = d} end
						end
					end
					i = last + 1
					if tick() - t0 > 0.15 then break end
					if i <= #descs then RunService.Heartbeat:Wait() end
				end
				table.sort(cands, function(a, b) return a.d < b.d end)
				local n = 0
				for _, e in ipairs(cands) do
					if n >= 650 or tick() - t0 > 0.2 then break end
					local ok, c = pcall(function() return e.o:Clone() end)
					if ok and c then
						for _, sub in ipairs(c:GetDescendants()) do
							if sub:IsA("BaseScript") or sub:IsA("ModuleScript") or sub:IsA("Sound") or sub:IsA("ParticleEmitter") or sub:IsA("Fire") or sub:IsA("Smoke") or sub:IsA("Sparkles") or sub:IsA("Trail") or sub:IsA("Beam") or sub:IsA("BillboardGui") or sub:IsA("SurfaceGui") or sub:IsA("ProximityPrompt") then
								pcall(function() sub:Destroy() end)
							end
						end
						pcall(function() c.Anchored = true c.CanCollide = false end)
						c.Parent = snapfolder
						n += 1
						if n % 120 == 0 then RunService.Heartbeat:Wait() end
					end
				end
			end
			local wholevf = Instance.new("ViewportFrame")
			wholevf.AnchorPoint = Vector2.new(0.5, 0.5)
			wholevf.Position = UDim2.new(0.5, 0, 0.5, 0)
			wholevf.Size = UDim2.new(0, vps.X, 0, vps.Y)
			wholevf.BackgroundColor3 = bgcol wholevf.BackgroundTransparency = 0
			wholevf.ImageColor3 = imgcol wholevf.Ambient = amb wholevf.LightColor = lc
			wholevf.Visible = false wholevf.ZIndex = 14 wholevf.Parent = sg
			local wcam = Instance.new("Camera")
			wcam.CFrame = frozencf wcam.FieldOfView = frozenfov wcam.Parent = wholevf
			wholevf.CurrentCamera = wcam
			snapfolder.Parent = wholevf
			local function makehalf(isleft)
				local holder = Instance.new("Frame")
				holder.AnchorPoint = Vector2.new(0.5, 0.5)
				holder.Position = UDim2.new(0.5, 0, 0.5, 0)
				holder.Size = UDim2.new(0, diag, 0, diag)
				holder.Rotation = 45
				holder.BackgroundTransparency = 1
				holder.Visible = false
				holder.ZIndex = 15
				holder.Parent = sg
				local clip = Instance.new("Frame")
				clip.Size = UDim2.new(0, diag / 2, 0, diag)
				clip.Position = UDim2.new(0, isleft and 0 or diag / 2, 0, 0)
				clip.BackgroundTransparency = 1
				clip.ClipsDescendants = true
				clip.ZIndex = 15
				clip.Parent = holder
				local vf = Instance.new("ViewportFrame")
				vf.AnchorPoint = Vector2.new(0.5, 0.5)
				vf.Position = UDim2.new(0, isleft and diag / 2 or 0, 0, diag / 2)
				vf.Size = UDim2.new(0, zw, 0, zh)
				vf.Rotation = -45
				vf.BackgroundColor3 = bgcol vf.BackgroundTransparency = 0
				vf.ImageColor3 = imgcol vf.Ambient = amb vf.LightColor = lc
				vf.ZIndex = 15
				local fc = Instance.new("Camera")
				fc.CFrame = frozencf fc.FieldOfView = frozenfov fc.Parent = vf
				vf.CurrentCamera = fc
				vf.Parent = clip
				return holder, vf
			end
			local lefth, leftvf = makehalf(true)
			local righth, rightvf = makehalf(false)
			local s2 = snapfolder:Clone()
			s2.Parent = leftvf
			RunService.Heartbeat:Wait()
			local s3 = snapfolder:Clone()
			s3.Parent = rightvf
			local cc = Instance.new("ColorCorrectionEffect")
			cc.Parent = game.Lighting
			local el = tick() - t0
			if el < 0.25 then task.wait(0.25 - el) end
			wholevf.Visible = true
			cc.Brightness = 0.1 cc.Contrast = 0.35 cc.Saturation = -0.45
			cc.TintColor = Color3.fromRGB(255, 230, 230)
			ts2:Create(flash, TweenInfo.new(0.11, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
			task.wait(0.11)
			if flash.Parent then flash:Destroy() end
			ts2:Create(wholevf, TweenInfo.new(0.225, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, zw, 0, zh)}):Play()
			task.wait(0.18)
			local drawstreak = Instance.new("Frame")
			drawstreak.Size = UDim2.new(0, 26, 0, 0)
			drawstreak.AnchorPoint = Vector2.new(0.5, 0)
			drawstreak.Position = UDim2.new(0.5, -lined.X * diag * 0.5, 0.5, -lined.Y * diag * 0.5)
			drawstreak.Rotation = 45
			drawstreak.BackgroundColor3 = Color3.fromRGB(185, 22, 32)
			drawstreak.BackgroundTransparency = 0.5 drawstreak.BorderSizePixel = 0
			drawstreak.ZIndex = 31 drawstreak.Parent = sg
			local drawline = Instance.new("Frame")
			drawline.Size = UDim2.new(0, 4, 0, 0)
			drawline.AnchorPoint = Vector2.new(0.5, 0)
			drawline.Position = drawstreak.Position
			drawline.Rotation = 45
			drawline.BackgroundColor3 = Color3.fromRGB(255, 246, 246)
			drawline.BackgroundTransparency = 0 drawline.BorderSizePixel = 0
			drawline.ZIndex = 32 drawline.Parent = sg
			ts2:Create(drawline, TweenInfo.new(0.045, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 4, 0, diag)}):Play()
			ts2:Create(drawstreak, TweenInfo.new(0.045, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 26, 0, diag)}):Play()
			task.wait(0.045)
			lefth.Visible = true righth.Visible = true
			wholevf:Destroy()
			ts2:Create(drawstreak, TweenInfo.new(0.07), {BackgroundTransparency = 1}):Play()
			ts2:Create(drawline, TweenInfo.new(0.09), {BackgroundTransparency = 1}):Play()
			task.delay(0.1, function()
				if drawstreak.Parent then drawstreak:Destroy() end
				if drawline.Parent then drawline:Destroy() end
			end)
			local gapglow = Instance.new("Frame")
			gapglow.Size = UDim2.new(0, 26, 0, diag)
			gapglow.AnchorPoint = Vector2.new(0.5, 0.5)
			gapglow.Position = UDim2.new(0.5, 0, 0.5, 0)
			gapglow.Rotation = 45
			gapglow.BackgroundColor3 = Color3.fromRGB(200, 26, 36)
			gapglow.BackgroundTransparency = 0.35 gapglow.BorderSizePixel = 0
			gapglow.ZIndex = 12 gapglow.Parent = sg
			local gg = Instance.new("UIGradient")
			gg.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0.1), NumberSequenceKeypoint.new(1, 1)
			})
			gg.Parent = gapglow
			local edgecore = Instance.new("Frame")
			edgecore.Size = UDim2.new(0, 2, 0, diag)
			edgecore.AnchorPoint = Vector2.new(0.5, 0.5)
			edgecore.Position = UDim2.new(0.5, 0, 0.5, 0)
			edgecore.Rotation = 45
			edgecore.BackgroundColor3 = Color3.fromRGB(255, 240, 240)
			edgecore.BackgroundTransparency = 0.1 edgecore.BorderSizePixel = 0
			edgecore.ZIndex = 24 edgecore.Parent = sg
			for i = 1, 3 do
				local ox = (i % 2 == 0) and 2.5 or -2.5
				lefth.Position = UDim2.new(0.5, ox, 0.5, -ox)
				righth.Position = UDim2.new(0.5, -ox, 0.5, ox)
				task.wait(0.015)
			end
			lefth.Position = UDim2.new(0.5, 0, 0.5, 0)
			righth.Position = UDim2.new(0.5, 0, 0.5, 0)
			local lsep = perp * -3
			local rsep = perp * 3
			ts2:Create(lefth, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {Position = UDim2.new(0.5, lsep.X, 0.5, lsep.Y)}):Play()
			ts2:Create(righth, TweenInfo.new(0.25, Enum.EasingStyle.Sine), {Position = UDim2.new(0.5, rsep.X, 0.5, rsep.Y)}):Play()
			local cracks = {}
			task.spawn(function()
				for i = 1, 7 do
					local t = (math.random() - 0.5) * 0.85
					local px = lined.X * t * diag * 0.5
					local py = lined.Y * t * diag * 0.5
					local cr = Instance.new("Frame")
					cr.Size = UDim2.new(0, 1, 0, 0)
					cr.AnchorPoint = Vector2.new(0.5, 0)
					cr.Position = UDim2.new(0.5, px, 0.5, py)
					cr.Rotation = 45 + (math.random() > 0.5 and 1 or -1) * math.random(28, 62)
					cr.BackgroundColor3 = Color3.fromRGB(118, 12, 18)
					cr.BackgroundTransparency = 0.1 cr.BorderSizePixel = 0
					cr.ZIndex = 22 cr.Parent = sg
					local kink = Instance.new("Frame")
					kink.Size = UDim2.new(0, 1, 0.55, 0)
					kink.AnchorPoint = Vector2.new(0.5, 0)
					kink.Position = UDim2.new(0.5, 0, 1, 0)
					kink.Rotation = (math.random() > 0.5 and 1 or -1) * math.random(14, 30)
					kink.BackgroundColor3 = cr.BackgroundColor3
					kink.BackgroundTransparency = 0.1 kink.BorderSizePixel = 0
					kink.ZIndex = 22 kink.Parent = cr
					table.insert(cracks, cr)
					ts2:Create(cr, TweenInfo.new(0.08, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0, 1, 0, math.random(38, 92))}):Play()
					task.wait(0.03)
				end
			end)
			task.wait(0.3)
			ts2:Create(edgecore, TweenInfo.new(0.025), {BackgroundTransparency = 0, Size = UDim2.new(0, 5, 0, diag)}):Play()
			task.wait(0.03)
			ts2:Create(edgecore, TweenInfo.new(0.08), {BackgroundTransparency = 1}):Play()
			task.delay(0.09, function() if edgecore.Parent then edgecore:Destroy() end end)
			for _, cr in ipairs(cracks) do
				ts2:Create(cr, TweenInfo.new(0.08), {BackgroundTransparency = 1}):Play()
			end
			ts2:Create(cc, TweenInfo.new(0.3), {Brightness = 0, Contrast = 0, Saturation = 0, TintColor = Color3.new(1, 1, 1)}):Play()
			ts2:Create(gapglow, TweenInfo.new(0.275), {BackgroundTransparency = 1}):Play()
			task.delay(0.3, function() if gapglow.Parent then gapglow:Destroy() end end)
			local pieces = {}
			table.insert(pieces, {f = lefth, bx = lsep.X, by = lsep.Y, px = 0, py = 0,
				vx = lined.X * 170, vy = lined.Y * 170 - 40, r = 0, rot0 = 45, av = -52, g = 2350, delay = 0})
			table.insert(pieces, {f = righth, bx = rsep.X, by = rsep.Y, px = 0, py = 0,
				vx = perp.X * 60 + 25, vy = 30, r = 0, rot0 = 45, av = 42, g = 2600, delay = 0.065})
			for i = 1, 13 do
				local t = (math.random() - 0.5) * 1.0
				local px = lined.X * t * diag * 0.42
				local py = lined.Y * t * diag * 0.42
				local sh = Instance.new("Frame")
				local big = math.random() > 0.55
				sh.Size = UDim2.new(0, math.random(4, 13), 0, math.random(12, 32))
				sh.AnchorPoint = Vector2.new(0.5, 0.5)
				sh.Position = UDim2.new(0.5, px, 0.5, py)
				sh.Rotation = 45 + math.random(-35, 35)
				sh.BackgroundColor3 = big and Color3.fromRGB(160, 24, 34) or Color3.fromRGB(24, 9, 11)
				sh.BackgroundTransparency = 0.05 sh.BorderSizePixel = 0
				sh.ZIndex = 30 sh.Parent = sg
				local side = (math.random() > 0.5) and 1 or -1
				table.insert(pieces, {
					f = sh, bx = px, by = py, px = 0, py = 0,
					vx = perp.X * side * math.random(140, 340), vy = perp.Y * side * math.random(60, 150) - math.random(150, 360),
					r = 0, rot0 = sh.Rotation, av = (math.random() > 0.5 and 1 or -1) * math.random(240, 660), g = 2700,
					delay = 0, fadeafter = 0.16, fadedur = 0.225
				})
			end
			local physconn
			local pstart = tick()
			physconn = RunService.RenderStepped:Connect(function(dt)
				local t = tick() - pstart
				for _, pc in ipairs(pieces) do
					if t >= pc.delay then
						pc.vy = pc.vy + pc.g * dt
						pc.px = pc.px + pc.vx * dt
						pc.py = pc.py + pc.vy * dt
						pc.r = pc.r + pc.av * dt
						if pc.f.Parent then
							pc.f.Position = UDim2.new(0.5, pc.bx + pc.px, 0.5, pc.by + pc.py)
							pc.f.Rotation = pc.rot0 + pc.r
							if pc.fadeafter and t > pc.fadeafter then
								pc.f.BackgroundTransparency = math.min(1, 0.05 + (t - pc.fadeafter) / pc.fadedur)
							end
						end
					end
				end
				if t > 0.7 then physconn:Disconnect() end
			end)
			task.wait(0.725)
			if physconn.Connected then physconn:Disconnect() end
			if cc and cc.Parent then cc:Destroy() end
			if sg and sg.Parent then sg:Destroy() end
		end
		local function activatequickshrine()
			if quickshrinecdactive or tpseqactive or isstunned() then return end
			quickshrinecdactive = true
			local mychar = player.Character
			local myhrp = mychar and mychar:FindFirstChild("HumanoidRootPart")
			if not myhrp then quickshrinecdactive = false return end
			local origcf = myhrp.CFrame
			task.spawn(function()
				pcall(function()
					game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Round"):WaitForChild("Game"):WaitForChild("RemoteFunction"):InvokeServer(1)
				end)
			end)
			frozenmdlcf = currentmdlhrp and currentmdlhrp.CFrame or (myhrp.CFrame + Vector3.new(0,1,0))
			tpseqactive = true abilityanimlock = true
			if quickshrinekfseq then getgenv().Animator6D(quickshrinekfseq,1,false,loadedModel) end
			task.spawn(function()
				if not AfterImageModule or not loadedModel then return end
				local hrpRef = loadedModel:FindFirstChild("HumanoidRootPart")
				if not hrpRef then return end
				local numG = 8 local radius = 14
				local center = hrpRef.Position
				local ghosts = {}
				for i = 1, numG do
					local ang = (i-1)*(math.pi*2/numG)
					local ok, clone = pcall(function() return loadedModel:Clone() end)
					if not ok or not clone then continue end
					for _, p in ipairs(clone:GetDescendants()) do
						if p:IsA("BasePart") then
							p.Color = Color3.new(0,0,0) p.Material = Enum.Material.Neon
							p.Transparency = 0.35 p.Anchored = true p.CanCollide = false
						elseif p:IsA("Humanoid") or p:IsA("Animator") or p:IsA("Script") or p:IsA("LocalScript") or p:IsA("Sound") or p:IsA("ParticleEmitter") or p:IsA("Trail") or p:IsA("Beam") then
							pcall(function() p:Destroy() end)
						end
					end
					local ghostHRP = clone:FindFirstChild("HumanoidRootPart")
					if ghostHRP then ghostHRP.Transparency = 1 end
					pcall(function() clone:PivotTo(hrpRef.CFrame) end)
					clone.Parent = workspace
					ghosts[i] = {model = clone, angle = ang}
				end
				local expandDur = 0.55 local expandStart = tick()
				local expandConn
				expandConn = RunService.Heartbeat:Connect(function()
					local t = math.min((tick()-expandStart)/expandDur, 1)
					local ease = 1-(1-t)^3
					for _, g in ipairs(ghosts) do
						if g.model.Parent then
							local pos = center + Vector3.new(math.cos(g.angle)*radius*ease, 0, math.sin(g.angle)*radius*ease)
							pcall(function() g.model:PivotTo(CFrame.new(pos, center)) end)
						end
					end
					if t >= 1 then expandConn:Disconnect() end
				end)
				task.wait(expandDur + 0.05)
				local orbitDur = 0.65 local orbitStart = tick()
				local startAngles = {}
				for i, g in ipairs(ghosts) do startAngles[i] = g.angle end
				local orbitConn
				orbitConn = RunService.Heartbeat:Connect(function()
					local t = math.min((tick()-orbitStart)/orbitDur, 1)
					local orbitA = t*math.pi*1.5
					for i, g in ipairs(ghosts) do
						if g.model.Parent then
							local a = startAngles[i]+orbitA
							local pos = center + Vector3.new(math.cos(a)*radius, 0, math.sin(a)*radius)
							pcall(function() g.model:PivotTo(CFrame.new(pos, center)) end)
						end
					end
					if t >= 1 then orbitConn:Disconnect() end
				end)
				task.wait(orbitDur + 0.05)
				local convDur = 0.4 local convStart = tick()
				local convStartPos = {}
				for i, g in ipairs(ghosts) do
					local a = startAngles[i]+math.pi*1.5
					convStartPos[i] = center + Vector3.new(math.cos(a)*radius, 0, math.sin(a)*radius)
				end
				local convConn
				convConn = RunService.Heartbeat:Connect(function()
					local t = math.min((tick()-convStart)/convDur, 1)
					local ease = t^2
					for i, g in ipairs(ghosts) do
						if g.model.Parent then
							local pos = convStartPos[i]:Lerp(center, ease)
							for _, p in ipairs(g.model:GetDescendants()) do
								if p:IsA("BasePart") and p.Name ~= "HumanoidRootPart" then
									p.Transparency = 0.35 + 0.65*ease
								end
							end
							pcall(function() g.model:PivotTo(CFrame.new(pos, center)) end)
						end
					end
					if t >= 1 then
						convConn:Disconnect()
						for _, g in ipairs(ghosts) do
							if g.model and g.model.Parent then g.model:Destroy() end
						end
					end
				end)
			end)
			for _, obj in ipairs(loadedModel:GetDescendants()) do
				if obj:IsA("Highlight") then obj:Destroy() end
			end
			for _, obj in ipairs(mychar:GetDescendants()) do
				if obj:IsA("Highlight") then obj:Destroy() end
			end
			task.spawn(function()
				local dd = nil
				local ws = tick()
				while not dd and tick()-ws < 6 do
					dd = mychar:FindFirstChild("Spindash", true)
					if not dd then RunService.Heartbeat:Wait() end
				end
				if not dd then return end
				local function hidedd(obj)
					if obj:IsA("BasePart") then obj.Transparency = 1 obj.LocalTransparencyModifier = 1 end
					if obj:IsA("Trail") then obj.Enabled = false obj.Transparency = 1 end
					if obj:IsA("ParticleEmitter") or obj:IsA("Beam") then obj.Enabled = false end
					if obj:IsA("SpecialMesh") or obj:IsA("SurfaceAppearance") then
						pcall(function() obj.Parent.Transparency = 1 end)
					end
				end
				hidedd(dd)
				for _, p in ipairs(dd:GetDescendants()) do hidedd(p) end
				dd.DescendantAdded:Connect(function(obj) hidedd(obj) end)
				local forceconn
				forceconn = RunService.Stepped:Connect(function()
					if not tpseqactive or not dd or not dd.Parent then
						if forceconn then forceconn:Disconnect() end return
					end
					pcall(function() dd.Transparency = 1 dd.LocalTransparencyModifier = 1 end)
					for _, p in ipairs(dd:GetDescendants()) do
						if p:IsA("BasePart") then
							pcall(function() p.Transparency = 1 p.LocalTransparencyModifier = 1 end)
						end
					end
				end)
			end)
			task.wait(2)
			if not myhrp.Parent then
				tpseqactive = false frozenmdlcf = nil tpseqbusy = false abilityanimlock = false
				quickshrinecdactive = false return
			end
			local qsinstance = nil
			if quickshrinetemplate then
				qsinstance = quickshrinetemplate:Clone()
				qsinstance.Name = "QuickshrineEffect"
				if qsinstance:IsA("BasePart") then
					qsinstance.Anchored = false qsinstance.CanCollide = false
					qsinstance.CFrame = myhrp.CFrame + Vector3.new(0,1,0)
					qsinstance.Parent = workspace
					local qw = Instance.new("WeldConstraint")
					qw.Part0 = myhrp qw.Part1 = qsinstance qw.Parent = qsinstance
				else
					for _, p in ipairs(qsinstance:GetDescendants()) do
						if p:IsA("BasePart") then p.Anchored=false p.CanCollide=false end
					end
					pcall(function() qsinstance:PivotTo(myhrp.CFrame+Vector3.new(0,1,0)) end)
					qsinstance.Parent = workspace
					local primarypart = qsinstance:FindFirstChildOfClass("BasePart")
					if primarypart then
						local qw = Instance.new("WeldConstraint")
						qw.Part0 = myhrp qw.Part1 = primarypart qw.Parent = primarypart
					end
				end
				local ts2 = game:GetService("TweenService")
				local particledata = {}
				for _, pe in ipairs(qsinstance:GetDescendants()) do
					if pe:IsA("ParticleEmitter") then
						particledata[pe] = pe.Rate pe.Rate = 0
					end
				end
				task.spawn(function()
					for pe, origrate in pairs(particledata) do
						if pe and pe.Parent then
							ts2:Create(pe, TweenInfo.new(0.9), {Rate = origrate}):Play()
						end
					end
				end)
			end
			local sidx = 1
			local qsending = false
			task.spawn(function()
				local dd = nil
				local ws = tick()
				while not dd and tick()-ws < 8 do
					dd = mychar:FindFirstChild("Spindash", true)
					if not dd then RunService.Heartbeat:Wait() end
				end
				if not dd then qsending = true return end
				local ddconn
				pcall(function()
					ddconn = dd.AncestryChanged:Connect(function()
						if not dd.Parent or not dd:IsDescendantOf(game) then
							qsending = true
							if ddconn then ddconn:Disconnect() end
						end
					end)
				end)
				while not qsending do
					if not dd.Parent then
						qsending = true
						if ddconn then ddconn:Disconnect() end
						return
					end
					task.wait(0.05)
				end
				if ddconn then ddconn:Disconnect() end
			end)
			local function getsurvivors_qs()
				local list = {}
				for _, obj in ipairs(workspace:GetDescendants()) do
					if obj:IsA("Model") and obj:GetAttribute("Team")=="Survivor" and not issurvivorignored(obj) then
						local hrp = obj:FindFirstChild("HumanoidRootPart")
						if hrp then table.insert(list,{hrp=hrp,name=obj.Name}) end
					end
				end
				table.sort(list,function(a,b) return a.name<b.name end)
				local sorted = {}
				for _, e in ipairs(list) do table.insert(sorted,e.hrp) end
				return sorted
			end
			while not qsending do
				local survivors = getsurvivors_qs()
				if #survivors > 0 then
					if sidx > #survivors then sidx = 1 end
					local tgt = survivors[sidx] sidx = sidx+1
					if tgt and tgt.Parent and myhrp and myhrp.Parent then
						myhrp.CFrame = CFrame.new(tgt.Position)
						local stepstart = tick() local lastspam = 0 local stepconn
						stepconn = RunService.Heartbeat:Connect(function(dt)
							if qsending or tick()-stepstart >= 0.1 then if stepconn then stepconn:Disconnect() end return end
							if not tgt.Parent or not myhrp.Parent then if stepconn then stepconn:Disconnect() end return end
							myhrp.CFrame = CFrame.new(tgt.Position)
							pcall(sethiddenproperty,myhrp,"PhysicsRepRootPart",tgt)
							lastspam += dt
							if lastspam >= 0.09 then
								lastspam = 0
								pcall(function() game.Players.LocalPlayer.PlayerGui:WaitForChild("Round").Game.RemoteFunction:InvokeServer(0) end)
							end
						end)
						task.wait(0.01)
						if stepconn and stepconn.Connected then stepconn:Disconnect() end
					end
				else
					task.wait(0.4)
				end
			end
			pcall(sethiddenproperty,myhrp,"PhysicsRepRootPart",myhrp)
			myhrp.CFrame = origcf
			tpseqactive = false frozenmdlcf = nil tpseqbusy = false abilityanimlock = false
			if qsinstance and qsinstance.Parent then
				local ts2 = game:GetService("TweenService")
				task.spawn(function()
					for _, pe in ipairs(qsinstance:GetDescendants()) do
						if pe:IsA("ParticleEmitter") then
							ts2:Create(pe,TweenInfo.new(0.9),{Rate=0}):Play()
						end
					end
					task.wait(0.9)
					if qsinstance and qsinstance.Parent then qsinstance:Destroy() end
				end)
			end
			task.spawn(playquickshrinecut)
			startcd("ABI3", quickshrinecd, function() quickshrinecdactive = false end)
			stopAllAnimations()
			updateAnimations()
		end
		local ab4cdactive = false
		local ab4cd = 31

		local function showmissbillboard()
			if not missbbtemplate then return end
			local ts2 = game:GetService("TweenService")
			for _, obj in ipairs(workspace:GetDescendants()) do
				if obj:IsA("Model") and obj:GetAttribute("Team") == "Survivor" then
					local hrp = obj:FindFirstChild("HumanoidRootPart")
					if hrp then
						local bb = missbbtemplate:Clone()
						bb.Parent = hrp
						local img = bb:FindFirstChildWhichIsA("ImageLabel", true)
						if img then
							img.ImageTransparency = 1
							ts2:Create(img, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
							task.delay(5, function()
								if img and img.Parent then
									ts2:Create(img, TweenInfo.new(0.35), {ImageTransparency = 1}):Play()
									task.delay(0.4, function() if bb and bb.Parent then bb:Destroy() end end)
								end
							end)
						end
					end
				end
			end
		end

		local function activateab4()
			if ab4cdactive or tpseqactive or isstunned() then return end
			local mychar = player.Character
			local myhrp = mychar and mychar:FindFirstChild("HumanoidRootPart")
			if not myhrp then return end
			ab4cdactive = true tpseqactive = true abilityanimlock = true
			local ab4active = true
			task.spawn(function()
				pcall(function() game.Players.LocalPlayer.PlayerGui:WaitForChild("Round").Game.RemoteFunction:InvokeServer(3) end)
			end)
			local lockcf = myhrp.CFrame
			frozenmdlcf = currentmdlhrp and currentmdlhrp.CFrame or (lockcf + Vector3.new(0,1,0))
			stopAllAnimations()
			if ab4kfseq then getgenv().Animator6D(ab4kfseq, 1, false, loadedModel) end
			local lockconn
			lockconn = RunService.Heartbeat:Connect(function()
				if not myhrp or not myhrp.Parent then lockconn:Disconnect() return end
				myhrp.CFrame = lockcf
				myhrp.AssemblyLinearVelocity = Vector3.zero
				myhrp.AssemblyAngularVelocity = Vector3.zero
			end)
			task.wait(0.9)
			lockconn:Disconnect()
			tpseqactive = false frozenmdlcf = nil
			local function ab4end()
				if not ab4active then return end
				ab4active = false
				abilityanimlock = false
				pcall(sethiddenproperty, myhrp, "PhysicsRepRootPart", myhrp)
				stopAllAnimations() updateAnimations()
				startcd("ABI4", ab4cd, function() ab4cdactive = false end)
			end
			task.delay(10, ab4end)
			local nearest = nil local nearestDist = math.huge
			for _, obj in ipairs(workspace:GetDescendants()) do
				if obj:IsA("Model") and obj:GetAttribute("Team") == "Survivor" and not issurvivorignored(obj) then
					local hrp = obj:FindFirstChild("HumanoidRootPart")
					if hrp then
						local d = (hrp.Position - myhrp.Position).Magnitude
						if d < nearestDist then nearestDist = d nearest = hrp end
					end
				end
			end
			if not nearest or not nearest.Parent then
				task.spawn(showmissbillboard)
				ab4end() return
			end
			local flyTime = math.max(0.15, math.min(0.5, 0.25 + (150-math.min(nearestDist,150))/150*0.25))
			local flyStart = tick()
			local startPos = myhrp.Position
			local imgT = 0 local imgPh = 0
			local imgConn
			imgConn = RunService.Heartbeat:Connect(function(dt)
				if not ab4active then imgConn:Disconnect() return end
				imgT += dt imgPh += dt*7
				if imgT < 0.05 then return end imgT = 0
				local v = (math.sin(imgPh)+1)/2
				if AfterImageModule then AfterImageModule.Single({Target=loadedModel,Mode="OM",OverrideTransparency=0.3,Duration=0.35,
					OM={fadein=0.04,hold=0.12,fadeout=0.18,color=Color3.new(v,v,v)}}) end
			end)
			local lastspam = 0 local reached = false
			local flyConn
			flyConn = RunService.Heartbeat:Connect(function(dt)
				if not ab4active then flyConn:Disconnect() return end
				if reached then flyConn:Disconnect() return end
				if not myhrp.Parent or not nearest.Parent then
					imgConn:Disconnect() flyConn:Disconnect() ab4end() return
				end
				local t = math.min((tick()-flyStart)/flyTime, 1)
				local ease = 1-(1-t)^2
				local newPos = startPos:Lerp(nearest.Position, ease)
				if (nearest.Position - newPos).Magnitude > 0.01 then
					myhrp.CFrame = CFrame.lookAt(newPos, nearest.Position)
				else
					myhrp.CFrame = CFrame.new(newPos)
				end
				pcall(sethiddenproperty, myhrp, "PhysicsRepRootPart", nearest)
				lastspam += dt
				if lastspam >= 0.09 then
					lastspam = 0
					pcall(function() game.Players.LocalPlayer.PlayerGui:WaitForChild("Round").Game.RemoteFunction:InvokeServer(0) end)
				end
				if t >= 1 or (nearest.Position - myhrp.Position).Magnitude < 4 then
					reached = true flyConn:Disconnect() imgConn:Disconnect()
					local sStart = tick() local sDur = 2.5
					local sAngle = 0 local sImgT = 0 local sPh = 0 local sSpam = 0
					local sConn
					sConn = RunService.Heartbeat:Connect(function(dt2)
						if not ab4active then sConn:Disconnect() return end
						if not myhrp.Parent or not nearest.Parent then sConn:Disconnect() ab4end() return end
						local se = tick()-sStart
						if se >= sDur then sConn:Disconnect() ab4end() return end
						local sp = se/sDur
						local radius = 13*(1-sp)
						sAngle += math.pi*(1.5+sp*5)*dt2
						local tpos = nearest.Position
						local nx = tpos.X+math.cos(sAngle)*radius
						local nz = tpos.Z+math.sin(sAngle)*radius
						local np = Vector3.new(nx, tpos.Y+1, nz)
						local lt = Vector3.new(tpos.X, tpos.Y+1, tpos.Z)
						if (lt-np).Magnitude > 0.01 then myhrp.CFrame = CFrame.lookAt(np, lt)
						else myhrp.CFrame = CFrame.new(np) end
						pcall(sethiddenproperty, myhrp, "PhysicsRepRootPart", nearest)
						sSpam += dt2
						if sSpam >= 0.09 then
							sSpam = 0
							pcall(function() game.Players.LocalPlayer.PlayerGui:WaitForChild("Round").Game.RemoteFunction:InvokeServer(0) end)
						end
						sImgT += dt2 sPh += dt2*4
						if sImgT >= 0.05 then
							sImgT = 0
							local v2 = (math.sin(sPh)+1)/2
							if AfterImageModule then AfterImageModule.Single({Target=loadedModel,Mode="OM",OverrideTransparency=0.25,Duration=0.5,
								OM={fadein=0.05,hold=0.2,fadeout=0.25,color=Color3.new(v2,v2,v2)}}) end
						end
					end)
				end
			end)
		end
		local abilityfuncs = {}
		abilityfuncs["ABI1"] = activatefuga
		abilityfuncs["ABI2"] = activateshrine
		abilityfuncs["ABI3"] = activatequickshrine
		abilityfuncs["ABI4"] = activateab4
		if abilitybar then
			for _, btn in ipairs(abilitybar:GetChildren()) do
				if btn:IsA("ImageButton") and abilityfuncs[btn.Name] then
					btn.MouseButton1Click:Connect(abilityfuncs[btn.Name])
				end
			end
		end
		local numtokc = {
			["1"] = Enum.KeyCode.One, ["2"] = Enum.KeyCode.Two,
			["3"] = Enum.KeyCode.Three, ["4"] = Enum.KeyCode.Four,
			["q"] = Enum.KeyCode.Q, ["e"] = Enum.KeyCode.E,
			["r"] = Enum.KeyCode.R, ["f"] = Enum.KeyCode.F,
			["z"] = Enum.KeyCode.Z, ["x"] = Enum.KeyCode.X,
			["c"] = Enum.KeyCode.C, ["t"] = Enum.KeyCode.T,
		}
		local kbmap = {}
		if abilitybar then
			for _, btn in ipairs(abilitybar:GetChildren()) do
				if btn:IsA("ImageButton") then
					local numlbl = btn:FindFirstChild("Num")
					if numlbl and abilityfuncs[btn.Name] then
						local kc = numtokc[numlbl.Text:lower()]
						if kc then
							kbmap[kc] = abilityfuncs[btn.Name]
						end
					end
				end
			end
		end
		local FORCE_MOBILE = false
		local UIS2 = game:GetService("UserInputService")
		local ismobile = (UIS2.TouchEnabled and not UIS2.MouseEnabled) or FORCE_MOBILE
		if abilitybar then
			local mi1 = abilitybar:FindFirstChild("MI1")
			if mi1 and mi1:IsA("ImageButton") then
				game:GetService("Players").LocalPlayer.PlayerGui.Round.Game.Ability.BG:Destroy()
				mi1.Activated:Connect(activateslashm1)
			end
			if ismobile then 				
				mi1.Visible = true
			end
		end
		if ismobile and abilitybar then
			local layout = abilitybar:FindFirstChildOfClass("UIListLayout")
			if layout then layout:Destroy() end
			local mobilepos = {
				ABI1 = UDim2.new(0.26, 0, -1.455, 0),
				ABI2 = UDim2.new(0.423, 0, -2.455, 0),
				ABI3 = UDim2.new(0.71, 0, -2.455, 0),
				ABI4 = UDim2.new(0.879, 0, -1.571, 0),
				MI1 = UDim2.new(0.722000003, 0, 0.80400002, 0),
			}
			for _, btn in ipairs(abilitybar:GetChildren()) do
				if btn:IsA("ImageButton") then
					if mobilepos[btn.Name] then btn.Position = mobilepos[btn.Name] end
					local numlbl = btn:FindFirstChild("Num")
					if numlbl then numlbl.Visible = false end
					local sc = btn:FindFirstChildOfClass("UIScale")
					if sc then sc.Scale = 1.2 end
				end
			end
		end
		game:GetService("UserInputService").InputBegan:Connect(function(inputobject, gameprocessedinput)
			if gameprocessedinput then return end
			if inputobject.KeyCode == Enum.KeyCode.V then
				activateslashm1()
				return
			end
			if kbmap[inputobject.KeyCode] then
				kbmap[inputobject.KeyCode]()
			end
		end)
	else

	end
end


player.CharacterAdded:Connect(function(char)
	character = char
	humanoidRootPart = char:WaitForChild("HumanoidRootPart")
	Humanoid = char:WaitForChild("Humanoid")
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then part.Transparency = 1 end
	end
	for _, desc in ipairs(character:GetDescendants()) do
		if desc:IsA("MeshPart") then
			if desc.Name == "Head" then
				desc.MeshId = ""
				for _, child in ipairs(desc:GetChildren()) do
					if child:IsA("Beam") then child:Destroy() end
				end
			else
				desc:Destroy()
			end
		end
	end
	local newMdl = loadAsset(ASSET_ID)
	if newMdl then
		setupModelToFollowPlayer(character, newMdl)
		loadedModel = newMdl
		setupviewport()
		replaceplayerframe()
	end
end)
--[[
		"https://github.com/guyguy6765/forchase/raw/refs/heads/main/simple.mp3",
		"sukuna1.mp3"]]
