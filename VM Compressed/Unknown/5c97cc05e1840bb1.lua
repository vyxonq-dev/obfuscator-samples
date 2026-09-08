if true then
	repeat task.wait() until game:IsLoaded()
	local _SL_SUC, ERR = pcall(function()
		local wavesVer = 2.54
		local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
		local sfb30BOK32v0 = loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/random/refs/heads/main/bktOV03.lua'))()
		local notifs = loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/random/main/FE2Notifs.lua'))()
		local randomGen = game:GetService('HttpService'):GenerateGUID(false):gsub('-',''):lower()
		local randomGen2 = game:GetService('HttpService'):GenerateGUID(false):gsub('-',''):lower()

		local subs = {
			'button instatp!!!!',
			"You're banned for exploiting",
			'hacker',
			'im reporting you',
			'i took a snapshot!'
		}
		
		local ltitles = {
			'welcome',
			'welcome'
		}

		local part = Instance.new('Part', workspace)
		local lplr = game:GetService('Players').LocalPlayer
		local RunService = game:GetService("RunService")
		local currtween = nil
		local currbutton = nil
		local _autofarmdelay = 0
		local _autofarmavali = false
		part.Anchored = true
		part.Size = Vector3.new(500, 1, 500)
		local dvoR3BO2 = sfb30BOK32v0.eo3VO3v0('vk3Vx8',"Surrounded by this Flame")

		local clmain
		local function alert(text)
			notifs.alert(text,Color3.new(0.8, 0.498039, 2))
		end

		for i,v in next, game:GetService('ReplicatedStorage').Remote:GetDescendants() do
			if v:IsA('RemoteFunction') then
				v.OnClientInvoke = function()
					wait(9e9)
					return {}
				end
			end
		end

		local olds
		olds = hookmetamethod(game, '__namecall', function(self, ...)
			local method = getnamecallmethod()
			local args = {
				...
			}
			if tostring(self) == 'Survived' and method == 'InvokeServer' then
				args[3] = math.random(1,95) + math.random()
				return olds(self, unpack(args))
			end
			return olds(self, ...)
		end)
		local lib = Rayfield:CreateWindow({
			Name = "WAVES V" .. wavesVer .. " [FE2: V63.01]",
			LoadingTitle = ltitles[math.random(1, #ltitles)],
			LoadingSubtitle = subs[math.random(1, #subs)],
		})
		game:GetService("ReplicatedStorage").Remote.ClientTimelines.Teleport.OnClientEvent:Connect(function()
			if getgenv().gettingbuttons and currtween and currbutton then
				currtween:Pause()
				local _lolteleported = Instance.new('StringValue', currbutton)
				_lolteleported.Name = '_DoNotTeleportTimelines'
			end
		end)
		getgenv().godmode = nil
		getgenv().waterwalk = nil
		getgenv().muteemotes = nil
		getgenv().skipLoading = nil
		getgenv().changedEmote = 0
		getgenv().walkspeed = 20
		getgenv().jumppower = 50
		local infoTab = lib:CreateTab("Info")
		local mainTab = lib:CreateTab("Map")
		local lpTab = lib:CreateTab("LocalPlayer")
		local miscTab = lib:CreateTab("Misc")
		local challengeTab = lib:CreateTab("Challenges")
		infoTab:CreateLabel('[⚠️/x] - where x is chance of getting anticheated')
		infoTab:CreateLabel('[✅] - Tested and safe')
		infoTab:CreateLabel(tostring(wavesVer) .. ":")
		infoTab:CreateLabel('[~] Fixed the script after the security update (x2)')
		infoTab:CreateLabel('[~] Fixed the script not winning on emulators (hopefully)')
		function isRandomString(str)
			for i = 1, #str do
				local ltr = str:sub(i, i)
				if ltr:lower() == ltr then
					return false
				end
			end
			return true
		end
		function getButton()
			for i, v in next, workspace.Multiplayer:WaitForChild('Map'):GetDescendants() do
				if (v.IsA(v, 'TouchTransmitter') and v.Parent.Name:upper() == v.Parent.Name and not v.Parent:FindFirstChild(randomGen2) and not v.Parent:FindFirstChild('_DoNotTeleportTimelines')) or (v.IsA(v, 'BasePart') and v.Name == 'ExitRegion') then
					local btnthinglol = (v:IsA('TouchTransmitter') and v.Parent or 'ExitRegionDoNot')
					return btnthinglol
				end
			end
			local btncon = nil
			local btnawait = nil
			btncon = workspace.Multiplayer.Map.DescendantAdded:Connect(function(v)
				if (v.IsA(v, 'TouchTransmitter') and v.Parent.Name:upper() == v.Parent.Name and not v.Parent:FindFirstChild(randomGen2) and not v.Parent:FindFirstChild('_DoNotTeleportTimelines')) or (v.IsA(v, 'BasePart') and v.Name == 'ExitRegion') then
					btnawait = (v:IsA('TouchTransmitter') and v.Parent or 'ExitRegionDoNot')
					btncon:Disconnect()
				end
			end)
			repeat
				task.wait(0.15)
				if _autofarmavali then
					_autofarmdelay = _autofarmdelay + 0.15
				else
					_autofarmavali = true
				end
			until btnawait ~= nil or not workspace.Multiplayer:FindFirstChild('Map') or exitRegionExists(workspace.Multiplayer:WaitForChild('Map'))
			if btncon then
				btncon:Disconnect()
			end
			if btnawait == nil then
				btnawait = true
			end
			return btnawait
		end
		function Time(targetpos, skipComb)
			local Combined = lplr.Character.Humanoid.RootPart.Position - targetpos
			local tme = ((Combined * Vector3.new(0.6, 0, 0.6)).Magnitude / 23)
			if skipComb then
				return tme
			end
			if tme - _autofarmdelay <= 0 then
				return 'Teleport'
			end
			return tme - _autofarmdelay
		end
		workspace.Multiplayer.ChildAdded:Connect(function(v)
			if v.Name == 'Map' then
				if getgenv().skipLoading then
					task.wait(1)
					sfb30BOK32v0.cl3C33vbo('b4j09B','Shinigami Gods Follow Me I am Empty Like Hollow','Wfu3HG0',nil)
				end
			end
		end)
		workspace.Multiplayer.DescendantAdded:Connect(function(t)
			task.wait()
			if string.match(string.lower(t.Name), 'water') and t.IsA(t, 'BasePart') and getgenv().waterwalk then
				t.CanCollide = true
			end
			if getgenv().gOpti then
				if t:IsA('BasePart') and not t.Parent:FindFirstChild('TouchTransmitter') and #t.Name < 5 and t.Parent.Name ~= 'Map' and t.Name ~= 'ExitRegion' then
					t.Transparency = 1
				end
			end
		end)
		function fetchZipline()
			if workspace.Multiplayer:FindFirstChild('Map') then
				local isZipline, ziplinePart
				for i, v in next, workspace.Multiplayer.Map:GetDescendants() do
					if v.Name == 'StartPole' and v:IsA('Model') and v:FindFirstChild('Base') then
						isZipline = true
						ziplinePart = v.Base
					end
				end
				if ziplinePart then
					return ziplinePart
				else
					return false
				end
			else
				return false
			end
		end
		function tp(cframe, speed, exr)
			local plr = game:GetService("Players").LocalPlayer.Character
			local _hum = plr:FindFirstChildOfClass('Humanoid')
			if not exr then
				task.wait(0.21)
				_hum.RootPart.Anchored = true
			end
			local tween = game:GetService("TweenService")
			local TWEEN = tween:Create(_hum.RootPart, TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
				CFrame = CFrame.new(cframe.Position)
			})
			currtween = TWEEN
			TWEEN:Play()
			local finished = false
			local connect;
			connect = TWEEN.Completed:Connect(function()
				_hum.RootPart.Anchored = false
				connect:Disconnect()
				finished = true;
			end)
			repeat
				_hum.RootPart.Velocity = Vector3.zero
				_hum.RootPart.RotVelocity = Vector3.zero
				RunService.Heartbeat:Wait()
			until finished == true or (currbutton and currbutton:FindFirstChild('_DoNotTeleportTimelines') or false)
			_hum.RootPart.Anchored = false
			currtween = nil
		end
		function handler()
			char = lplr.Character
			char:WaitForChild('Humanoid')
			char.Humanoid:GetPropertyChangedSignal('Health'):Connect(function()
				if getgenv().godmode then
					char.Humanoid.MaxHealth = 99999
					char.Humanoid.Health = 99999
				end
			end)
			if getgenv().changedEmote ~= 0 and getsenv then
				local script = getsenv(char.Animate)
				script.changeEmote(changedEmote)
			end
		end
		function exitRegionExists(map)
			local exitReg
			for i,v in next, map:GetChildren() do
				if v.Name == 'ExitRegion' and v:IsA('BasePart') then
					exitReg = v
					break
				end		
			end
			for i, v in next, map:GetDescendants() do
				if v.Name == 'ExitRegion' and v:IsA('BasePart') then
					exitReg = v
					break
				end
			end
			if exitReg and exitReg:IsA('Model') then
				return exitReg.PrimaryPart
			elseif exitReg and exitReg:IsA('BasePart') then
				return exitReg
			else
				return false
			end
		end
		handler()
		lplr.CharacterAdded:Connect(function(char)
			handler()
			task.wait(5)
			lplr.Character:WaitForChild('Humanoid').WalkSpeed = getgenv().walkspeed
			lplr.Character.Humanoid.JumpPower = getgenv().jumppower
			lplr.Character:WaitForChild('Humanoid'):GetPropertyChangedSignal('WalkSpeed'):Connect(function()
				if lplr.Character:WaitForChild('Humanoid').WalkSpeed < getgenv().walkspeed then
					lplr.Character:WaitForChild('Humanoid').WalkSpeed = getgenv().walkspeed
				end
			end)
			lplr.Character:WaitForChild('Humanoid'):GetPropertyChangedSignal('JumpPower'):Connect(function()
				if lplr.Character:WaitForChild('JumpPower').JumpPower < getgenv().jumppower then
					lplr.Character:WaitForChild('JumpPower').JumpPower = getgenv().jumppower
				end
			end)
		end)
		function float()
			task.spawn(function()
				if gettingbuttons then
					fpart = Instance.new('Part', workspace)
					fpart.Name = 'floatpart'
					fpart.Anchored = true
					while task.wait() and getgenv().gettingbuttons do
						fpart.CFrame = CFrame.new(lplr.Character:WaitForChild('HumanoidRootPart').Position - Vector3.new(0, 3, 0))
					end
				end
			end)
		end
		local waypoints
		local DeathConnection, TCon1, TCon2, FCon, alreadyConnected, reconCon, dieDelay
		dieDelay = 0
		local function newreconnect()
			DeathConnection = lplr.CharacterRemoving:Connect(function()
				dieDelay = 0
				if not getgenv().gettingbuttons then
					return
				end
				if reconCon then
					task.cancel(reconCon)
					reconCon = nil
				end
				_autofarmavali = false
				local nInstance = Instance.new('StringValue', workspace.Multiplayer:WaitForChild('Map'))
				nInstance.Name = randomGen
				DeathConnection:Disconnect()
				if FCon and getgenv().gettingbuttons then
					getgenv().gettingbuttons = false
					task.cancel(FCon)
					repeat
						task.wait()
					until lplr.Character
					for i = 0, 4 do
						sfb30BOK32v0.cl3C33vbo('b4j09B','My Eyes are on You You are like Princess Mononoke','Wfu3HG0',nil)
						task.wait(1)
					end
					repeat
						task.wait()
					until not workspace:WaitForChild('Multiplayer'):WaitForChild('Map'):FindFirstChild(randomGen)
					getgenv().gettingbuttons = true
					FCon = task.spawn(startfarm)
				end
			end)
			if reconCon then
				task.cancel(reconCon)
				reconCon = nil
			end
			local nInstance = Instance.new('StringValue', (workspace.Multiplayer:FindFirstChild('Map') and workspace.Multiplayer.Map or game:GetService('TestService')))
			nInstance.Name = randomGen
			pcall(task.cancel,FCon)
			getgenv().gettingbuttons = true
			_autofarmavali = false
			repeat
				task.wait()
			until not workspace:WaitForChild('Multiplayer'):WaitForChild('Map'):FindFirstChild(randomGen)
			FCon = task.spawn(startfarm)
		end
		function startfarm()
			while game:GetService('RunService').Heartbeat:Wait() do
				if not getgenv().gettingbuttons then
					break
				end
				if not reconCon then
					reconCon = task.spawn(newreconnect)
					alert('Disconnected reconCon')
				end
				local map = workspace.Multiplayer:WaitForChild('Map')
				local hrp = lplr.Character:FindFirstChildOfClass('Humanoid').RootPart
				hrp.Parent.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
				local wConfig, btns, button
				_autofarmdelay = 0
				while btns == nil do
					local s1, e1 = pcall(function()
						btns = getButton()
					end)
					if not s1 then
						warn(e1)
						alert(e1)
					end
					if btns == 'ExitRegionDoNot' then
						btns = true
					end
					game:GetService('RunService').Heartbeat:Wait()
				end
				local isExitRegion = exitRegionExists(map)
				if isExitRegion then
					local successEND, errEND = pcall(function()
						local _remoteCon
						_remoteCon = dvoR3BO2.OnClientEvent:Connect(function()
							_remoteCon:Disconnect()
							dieDelay = dieDelay +  1
							if dieDelay >= 2 then
								lplr.Character:FindFirstChildOfClass('Humanoid'):ChangeState('Dead')
							end
						end)
						task.wait(0.2)
						local ExitRegion = isExitRegion
						local olderegionsize = ExitRegion.Size
						ExitRegion.Size = Vector3.new(0.1, 0.1, 0.1)
						tp(ExitRegion.CFrame, Time(ExitRegion.Position, true), true)
						for i = 0, 5 do
							hrp.CFrame = CFrame.new(ExitRegion.Position)
							task.wait(0.01)
						end
						task.wait(1.6)
						ExitRegion.Size = olderegionsize
					end)
					if not successEND then
						hrp.Parent:FindFirstChildOfClass('Humanoid'):ChangeState(Enum.HumanoidStateType.Dead)
						warn(errEND)
						alert('FATAL ERROR: ' .. errEND)
					end
					break
				end
				local sex, esex = pcall(function()
					alert('Zooming to the button ' .. btns.Name)
				end)
				if not sex then
					alert('FATAL ERROR: ' .. esex)
					task.wait(1)
					hrp.Parent:FindFirstChildOfClass('Humanoid'):ChangeState(Enum.HumanoidStateType.Dead)
				end
				if not map:FindFirstChild('waves.config') then
					alert('Creating "waves.config" folder')
					wConfig = Instance.new('Folder', map)
					wConfig.Name = 'waves.config'
				else
					wConfig = map:FindFirstChild('waves.config')
				end
				if not wConfig:FindFirstChild('InstaPress') then
					local InstaPressData = Instance.new('BoolValue', wConfig)
					InstaPressData.Name = 'InstaPress'
				end
				if wConfig['InstaPress'].Value == false then
					task.wait(1)
					wConfig['InstaPress'].Value = true
					hrp.CFrame = CFrame.new(btns.Position)
					task.wait(0.15)
					local pdata_lol = Instance.new('BindableFunction', btns)
					pdata_lol.Name = randomGen2
				end
				button = btns
				currbutton = btns
				hrp.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 20, 0))
				btns.CanTouch = false
				local _TPTime = Time(button.Position)
				hrp.CFrame = CFrame.new(hrp.Position + Vector3.new(0, 20, 0))
				if typeof(_TPTime) == 'number' and _TPTime > 65 then
					lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
					alert('>65s tp time. cancelling.')
				end
				if _TPTime == 'Teleport' then
					hrp.CFrame = CFrame.new(button.Position)
				else
					tp(button.CFrame, _TPTime)
				end
				hrp.CFrame = CFrame.new(button.Position + Vector3.new(0, 5, 0))
				task.wait(0.05)
				btns.CanTouch = true
				if button then
					for i = 0, 7 do
						hrp.CFrame = CFrame.new(button.Position + Vector3.new(0.1, math.random(), 0))
						task.wait(0.05)
					end
				end
				hrp.CFrame = CFrame.new(button.Position)
				local pdata_lol = Instance.new('BindableFunction', btns)
				pdata_lol.Name = randomGen2
				_autofarmavali = false
				currbutton = nil
			end
		end
		mainTab:CreateToggle({
			Name = "Autofarm [✅, EXEC IN THE MAP]",
			CurrentValue = false,
			Callback = function(getbtns)
				getgenv().gettingbuttons = getbtns
				if getbtns then
					FCon = task.spawn(startfarm)
				else
					task.cancel(FCon)
				end
			end,
		})
		function _autoget()
			task.spawn(function()
				while task.wait(3) and getgenv().misc do
					if not getgenv().misc then
						break
					end
					local _map
					_map = workspace.Multiplayer:WaitForChild('Map')
					for i, v in next, _map:GetDescendants() do
						if string.match(string.lower(v.Name), 'lost') and v.IsA(v, 'BasePart') then
							v.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.Position)
						elseif (string.match(string.lower(v.Name), 'rescue')) and v:FindFirstChild('Contact') then
							v.Contact.CFrame = CFrame.new(lplr.Character.HumanoidRootPart.Position)
						end
					end
				end
			end)
		end
		mainTab:CreateToggle({
			Name = 'AutoTP to ExitRegion [⚠️/very low]',
			CurrentValue = false,
			Callback = function(tper)
				getgenv().tptoexit = tper
				while task.wait(2) and getgenv().tptoexit do
					if not getgenv().tptoexit then
						break
					end
					local map = workspace.Multiplayer:WaitForChild('Map')
					for i, v in next, map:GetDescendants() do
						if v.Name == 'ExitRegion' then
							tp(v.CFrame, 4.5)
							task.wait(4.5)
						end
					end
				end
			end,
		})
		mainTab:CreateToggle({
			Name = 'Auto Get Lost Pages/Escapees [✅]',
			CurrentValue = false,
			Callback = function(gr)
				getgenv().misc = gr
				_autoget()
			end,
		})
		mainTab:CreateToggle({
			Name = 'Skip Loading [✅]',
			CurrentValue = false,
			Callback = function(value)
				getgenv().skipLoading = value
			end,
		})
		mainTab:CreateToggle({
			Name = 'Water Walk [✅]',
			CurrentValue = false,
			Callback = function(wwalk)
				getgenv().waterwalk = wwalk
				for i, t in next, workspace.Multiplayer.Map:GetDescendants() do
					if string.match(string.lower(t.Name), 'water') and t.IsA(t, 'BasePart') and getgenv().waterwalk then
						t.CanCollide = waterwalk
					end
				end
			end
		})
		mainTab:CreateToggle({
			Name = 'Auto Safespot [✅]',
			CurrentValue = false,
			Callback = function(Value)
				getgenv().safespot = Value
				task.spawn(function()
					while task.wait(5) and safespot do
						if not safespot then
							break
						end
						if (lplr.Character.Humanoid.RootPart.Position - part.Position).Magnitude > 250 or ((lplr.Character.Humanoid.RootPart.Position - part.Position).Magnitude) < -250 then
							sfb30BOK32v0.cl3C33vbo('b4j09B','My Eyes are on You You are like Princess Mononoke','Wfu3HG0',nil)
							lplr.Character:WaitForChild('HumanoidRootPart').CFrame = CFrame.new(part.Position + Vector3.new(0, 5, 0))
						end
					end
				end)
			end,
		})
		lpTab:CreateToggle({
			Name = 'GodMode [✅]',
			CurrentValue = false,
			Callback = function(gm)
				getgenv().godmode = gm
				handler()
			end,
		})
		lpTab:CreateSlider({
			Name = "WalkSpeed [✅]",
			Range = {
				20,
				26,
			},
			Increment = 1,
			CurrentValue = 20,
			Callback = function(ws)
				getgenv().walkspeed = ws
				lplr.Character:WaitForChild('Humanoid').WalkSpeed = walkspeed
			end,
		})
		lpTab:CreateSlider({
			Name = "JumpPower [✅]",
			Range = {
				50,
				75
			},
			Increment = 1,
			CurrentValue = 50,
			Callback = function(jp)
				getgenv().jumppower = jp
				lplr.Character:WaitForChild('Humanoid').JumpPower = jumppower
			end,
		})
		miscTab:CreateToggle({
			Name = 'Autofarm Optimization [✅, BE IN THE LIFT]',
			CurrentValue = false,
			Callback = function(ao)
				getgenv().gOpti = ao
			end
		})
		miscTab:CreateButton({
			Name = 'VIP Emote Bypass [✅]',
			Callback = function()
				local Players = game:GetService('Players')
				local function Change(Character)
					local script = getsenv(Character.Animate)
					script.changeEmote(1584520816)
				end
				Change(Players.LocalPlayer.Character)
				local function newCharacter(Character)
					task.wait(1)
					Change(Character)
				end
				Players.LocalPlayer.CharacterAdded:Connect(newCharacter)
			end
		})
		miscTab:CreateButton({
			Name = "Don't Save Session Data [✅]",
			Callback = function()
				sfb30BOK32v0.cl3C33vbo('b4j09B','My Veins are Tense as if I am on the Edge of Death','Wfu3HG0','RUNSLIDE','\255','Controls',nil,'Gamepad')
				alert("✅ After you will server hop, you'll have the same stats as of now [Currency, XP, Level]")
			end
		})
		challengeTab:CreateButton({
			Name = 'Regenerate Air',
			Callback = function()
				sfb30BOK32v0.cl3C33vbo('b4j09B','Kiss of Heated Steel Soul Burning with Cold','Wfu3HG0',5000)
			end
		})
		challengeTab:CreateButton({
			Name = 'Slide Under Barriers',
			Callback = function()
				for i, v in next, workspace.Multiplayer.Map:GetDescendants() do
					if v.Name == 'SlideBeam' and v:IsA('BasePart') then
						sfb30BOK32v0.cl3C33vbo('b4j09B','Blood Traces Desolator Minamoto Clan of Elders','Wfu3HG0',v.Position - Vector3.new(1, 1, 0), v.Position + Vector3.new(0, -1, 1))
					end
				end
			end
		})
		alert('WAVES V' .. wavesVer .. ' loaded')
	end)
	if not _SL_SUC then
		game:GetService('Players').LocalPlayer:Kick(ERR)
		task.wait(2)
		game.Shutdown(game)
	end
end
