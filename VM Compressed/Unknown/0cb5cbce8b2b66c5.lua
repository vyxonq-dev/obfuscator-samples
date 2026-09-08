local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local FlyButton = Instance.new("TextButton")
local SpeedButton = Instance.new("TextButton")
local JumpButton = Instance.new("TextButton")
local NoclipButton = Instance.new("TextButton")
local InvisibleButton = Instance.new("TextButton")
local SpinButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 17, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0, 0, 0.525312066, 0)
Frame.Size = UDim2.new(0, 446, 0, 273)
Frame.Active = true
Frame.Draggable = true

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Position = UDim2.new(0.13143456, 0, -0.001354206, 0)
TextLabel.Size = UDim2.new(0, 301, 0, 80)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "Gorkon Hub"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

FlyButton.Name = "FlyButton"
FlyButton.Parent = Frame
FlyButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
FlyButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyButton.BorderSizePixel = 0
FlyButton.Position = UDim2.new(-3.90250356e-08, 0, 0.277570575, 0)
FlyButton.Size = UDim2.new(0, 203, 0, 52)
FlyButton.Font = Enum.Font.SourceSans
FlyButton.Text = "Fly"
FlyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyButton.TextScaled = true
FlyButton.TextSize = 14.000
FlyButton.TextWrapped = true
FlyButton.MouseButton1Click:Connect(function()
	repeat wait()
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
	local mouse = game.Players.LocalPlayer:GetMouse()
	repeat wait() until mouse
	local plr = game.Players.LocalPlayer
	local torso = plr.Character.Torso
	local flying = true
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 50
	local speed = 0

	function Fly()
		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		repeat wait()
			plr.Character.Humanoid.PlatformStand = true
			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0.1,0)
			end
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
	end
	mouse.KeyDown:connect(function(key)
		if key:lower() == "e" then
			if flying then flying = false
			else
				flying = true
				Fly()
			end
		elseif key:lower() == "w" then
			ctrl.f = 1
		elseif key:lower() == "s" then
			ctrl.b = -1
		elseif key:lower() == "a" then
			ctrl.l = -1
		elseif key:lower() == "d" then
			ctrl.r = 1
		end
	end)
	mouse.KeyUp:connect(function(key)
		if key:lower() == "w" then
			ctrl.f = 0
		elseif key:lower() == "s" then
			ctrl.b = 0
		elseif key:lower() == "a" then
			ctrl.l = 0
		elseif key:lower() == "d" then
			ctrl.r = 0
		end
	end)
	Fly()
end)

SpeedButton.Name = "SpeedButton"
SpeedButton.Parent = Frame
SpeedButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpeedButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpeedButton.BorderSizePixel = 0
SpeedButton.Position = UDim2.new(-3.90250356e-08, 0, 0.537389278, 0)
SpeedButton.Size = UDim2.new(0, 203, 0, 52)
SpeedButton.Font = Enum.Font.SourceSans
SpeedButton.Text = "Speed"
SpeedButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedButton.TextScaled = true
SpeedButton.TextSize = 14.000
SpeedButton.TextWrapped = true
SpeedButton.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 150
end)

JumpButton.Name = "JumpButton"
JumpButton.Parent = Frame
JumpButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
JumpButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
JumpButton.BorderSizePixel = 0
JumpButton.Position = UDim2.new(-3.90250356e-08, 0, 0.782102227, 0)
JumpButton.Size = UDim2.new(0, 203, 0, 52)
JumpButton.Font = Enum.Font.SourceSans
JumpButton.Text = "JumpPower"
JumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpButton.TextScaled = true
JumpButton.TextSize = 14.000
JumpButton.TextWrapped = true
JumpButton.MouseButton1Click:Connect(function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 200
end)

NoclipButton.Name = "NoclipButton"
NoclipButton.Parent = Frame
NoclipButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
NoclipButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
NoclipButton.BorderSizePixel = 0
NoclipButton.Position = UDim2.new(0.520328939, 0, 0.277570575, 0)
NoclipButton.Size = UDim2.new(0, 187, 0, 52)
NoclipButton.Font = Enum.Font.SourceSans
NoclipButton.Text = "Noclip"
NoclipButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NoclipButton.TextScaled = true
NoclipButton.TextSize = 14.000
NoclipButton.TextWrapped = true
NoclipButton.MouseButton1Click:Connect(function()
	local Noclip = nil
	local Clip = nil

	function noclip()
		Clip = false
		local function Nocl()
			if Clip == false and game.Players.LocalPlayer.Character ~= nil then
				for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
					if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
						v.CanCollide = false
					end
				end
			end
			wait(0.21) -- basic optimization
		end
		Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
	end

	function clip()
		if Noclip then Noclip:Disconnect() end
		Clip = true
	end

	noclip() -- to toggle noclip() and clip()
end)

InvisibleButton.Name = "InvisibleButton"
InvisibleButton.Parent = Frame
InvisibleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
InvisibleButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
InvisibleButton.BorderSizePixel = 0
InvisibleButton.Position = UDim2.new(0.520328939, 0, 0.537389278, 0)
InvisibleButton.Size = UDim2.new(0, 187, 0, 52)
InvisibleButton.Font = Enum.Font.SourceSans
InvisibleButton.Text = "Invisible"
InvisibleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
InvisibleButton.TextScaled = true
InvisibleButton.TextSize = 14.000
InvisibleButton.TextWrapped = true
InvisibleButton.MouseButton1Click:Connect(function()
	local ScriptStarted = false
	local Keybind = "F" --Set to whatever you want, has to be the name of a KeyCode Enum.
	local Transparency = true --Will make you slightly transparent when you are invisible. No reason to disable.
	local NoClip = false --Will make your fake character no clip.
	local Player = game:GetService("Players").LocalPlayer
	local RealCharacter = Player.Character or Player.CharacterAdded:Wait()
	local IsInvisible = false
	RealCharacter.Archivable = true
	local FakeCharacter = RealCharacter:Clone()
	local Part
	Part = Instance.new("Part", workspace)
	Part.Anchored = true
	Part.Size = Vector3.new(200, 1, 200)
	Part.CFrame = CFrame.new(0, -500, 0) --Set this to whatever you want, just far away from the map.
	Part.CanCollide = true
	FakeCharacter.Parent = workspace
	FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
	for i, v in pairs(RealCharacter:GetChildren()) do
		if v:IsA("LocalScript") then
			local clone = v:Clone()
			clone.Disabled = true
			clone.Parent = FakeCharacter
		end
	end
	if Transparency then
		for i, v in pairs(FakeCharacter:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0.7
			end
		end
	end
	local CanInvis = true
	function RealCharacterDied()
		CanInvis = false
		RealCharacter:Destroy()
		RealCharacter = Player.Character
		CanInvis = true
		isinvisible = false
		FakeCharacter:Destroy()
		workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
		RealCharacter.Archivable = true
		FakeCharacter = RealCharacter:Clone()
		Part:Destroy()
		Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Size = Vector3.new(200, 1, 200)
		Part.CFrame = CFrame.new(9999, 9999, 9999) --Set this to whatever you want, just far away from the map.
		Part.CanCollide = true
		FakeCharacter.Parent = workspace
		FakeCharacter.HumanoidRootPart.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
		for i, v in pairs(RealCharacter:GetChildren()) do
			if v:IsA("LocalScript") then
				local clone = v:Clone()
				clone.Disabled = true
				clone.Parent = FakeCharacter
			end
		end
		if Transparency then
			for i, v in pairs(FakeCharacter:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = 0.7
				end
			end
		end
		RealCharacter.Humanoid.Died:Connect(function()
			RealCharacter:Destroy()
			FakeCharacter:Destroy()
		end)
		Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
	end
	RealCharacter.Humanoid.Died:Connect(function()
		RealCharacter:Destroy()
		FakeCharacter:Destroy()
	end)
	Player.CharacterAppearanceLoaded:Connect(RealCharacterDied)
	local PseudoAnchor
	game:GetService "RunService".RenderStepped:Connect(
		function()
			if PseudoAnchor ~= nil then
				PseudoAnchor.CFrame = Part.CFrame * CFrame.new(0, 5, 0)
			end
			if NoClip then
				FakeCharacter.Humanoid:ChangeState(11)
			end
		end
	)
	PseudoAnchor = FakeCharacter.HumanoidRootPart
	local function Invisible()
		if IsInvisible == false then
			local StoredCF = RealCharacter.HumanoidRootPart.CFrame
			RealCharacter.HumanoidRootPart.CFrame = FakeCharacter.HumanoidRootPart.CFrame
			FakeCharacter.HumanoidRootPart.CFrame = StoredCF
			RealCharacter.Humanoid:UnequipTools()
			Player.Character = FakeCharacter
			workspace.CurrentCamera.CameraSubject = FakeCharacter.Humanoid
			PseudoAnchor = RealCharacter.HumanoidRootPart
			for i, v in pairs(FakeCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = false
				end
			end
			IsInvisible = true
		else
			local StoredCF = FakeCharacter.HumanoidRootPart.CFrame
			FakeCharacter.HumanoidRootPart.CFrame = RealCharacter.HumanoidRootPart.CFrame

			RealCharacter.HumanoidRootPart.CFrame = StoredCF

			FakeCharacter.Humanoid:UnequipTools()
			Player.Character = RealCharacter
			workspace.CurrentCamera.CameraSubject = RealCharacter.Humanoid
			PseudoAnchor = FakeCharacter.HumanoidRootPart
			for i, v in pairs(FakeCharacter:GetChildren()) do
				if v:IsA("LocalScript") then
					v.Disabled = true
				end
			end
			IsInvisible = false
		end
	end
	game:GetService("UserInputService").InputBegan:Connect(
	function(key, gamep)
		if gamep then
			return
		end
		if key.KeyCode.Name:lower() == Keybind:lower() and CanInvis and RealCharacter and FakeCharacter then
			if RealCharacter:FindFirstChild("HumanoidRootPart") and FakeCharacter:FindFirstChild("HumanoidRootPart") then
				Invisible()
			end
		end
	end
	)
	local Sound = Instance.new("Sound",game:GetService("SoundService"))
	Sound.SoundId = "rbxassetid://232127604"
	Sound:Play()
	game:GetService("StarterGui"):SetCore("SendNotification",{["Title"] = "Invisible Toggle Loaded",["Text"] = "Press "..Keybind.." to become change visibility.",["Duration"] = 20,["Button1"] = "Okay."})
end)

SpinButton.Name = "SpinButton"
SpinButton.Parent = Frame
SpinButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SpinButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpinButton.BorderSizePixel = 0
SpinButton.Position = UDim2.new(0.520328939, 0, 0.782102227, 0)
SpinButton.Size = UDim2.new(0, 187, 0, 52)
SpinButton.Font = Enum.Font.SourceSans
SpinButton.Text = "Infinite yield (Admin)"
SpinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpinButton.TextScaled = true
SpinButton.TextSize = 14.000
SpinButton.TextWrapped = true
SpinButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

CloseButton.Name = "CloseButton"
CloseButton.Parent = Frame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 11.000
CloseButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0.858744383, 0, -0.00366300368, 0)
CloseButton.Size = UDim2.new(0, 63, 0, 50)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(0, 0, 0)
CloseButton.TextScaled = true
CloseButton.TextSize = 14.000
CloseButton.TextWrapped = true
CloseButton.MouseButton1Click:Connect(function()
	Frame:Destroy()
end)