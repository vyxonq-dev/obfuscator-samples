
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/Zentrix"))()
local selectedTheme = "Default"
local V = "V.0.17"

library:CreateWindow({
	Title = "Universel - by Iliankytb",-- Title of the script
	Theme = selectedTheme,--View more theme in my dicord server!
	Icon = 0,-- 0 = no icon or add number
	Intro = false,--Intro or no
	IntroTitle = "Zentrix Library Testing",--the intro title
	KeyPC = Enum.KeyCode.K,--the key for pc for Open/close the frame
	Data = {
		EnableSavingData = true,--Enabling data saver or no
		DisableNotifyingLoadedData = false,--set it to true for disable the notify when loaded data
		FolderName = "SaverUniversalScript",--Folder Name,you can change it
		FileName = "IliankYTB",-- File name for the data saver,you can change it
	},
	Discord = {
		Enabled = false,--enable to copy the discord
		DiscordLink = "https://discord.gg/E2TqYRsRP4",-- put thr entire Link of discord
		RememberJoin = false,-- Set this ti false to make them copy the link every time they load the script
		Duration = 5,-- 5 is the default you can change the number only for remember join
	},
	KeySystem = false,--Key System or no
	KeySettings = {
		Title = "Zentrix Library Testing Key System",--Title of the key(just like that)
		Note = "the key is Zentrix",-- The method for obtaining
		FileName = "Key",-- File name or no for saving the key
		SaveKey = true,-- saving the key or no
		GrabKeyFromSite = false,--Coming soon
		Key = {"Zentrix"},-- the name you can add many name, Exemple "Key","Key2" or you can add a function to add key but i don't really know
		AddGetKeyButton = false,
		AddDiscordButton = true,
		DiscordLink = "NoInviteLink",
		GetKeyLink = "NoKeyLink",
	},
}, function(window)
local InfoTab = window:CreateTab("Info",0)
local PlayerTab = window:CreateTab("Player",0)
local GameTab = window:CreateTab("Game",0)
local EspTab = window:CreateTab("Esp",0)
local AimbotTab = window:CreateTab("Aimbot",0)
local DiscordTab = window:CreateTab("Discord",0)
local SettingsTab = window:CreateTab("Settings",0)
local ActiveSpeedBoost,ActiveNoclip,ActiveEspPlayers,ActivateFly,ActivateInfiniteJump,AlrActivatedFlyPC,ActiveNoCooldownPrompt,ActiveAimbot,HowAim,MaxDistanceForAimbot = false,false,false,false,false,false,false,false,"Camera",0
local ParagraphInfoServer = InfoTab:AddParagraph({Title = "",Content = "Loading",Name = "Paragraph1"})
local LocalPlayer = game.Players.LocalPlayer
local LimitRangerEsp = 25
local DisableLimitRangerEsp = false
local Camera = Workspace.CurrentCamera
local ActiveDistanceEsp = false
local ValueSpeed = 16
local ValueJP = 50
local ActivateEditJumpPower = false
local MarketplaceService = game:GetService("MarketplaceService")
local infoGameName = MarketplaceService:GetProductInfo(game.PlaceId)
local OldSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local OldJP = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local ActiveFullBright = false
local OldBrightness = Game.Lighting.Brightness
local OldAmbient = Game.Lighting.Ambient
task.spawn(function()
local executor, version = identifyexecutor()
print('Running on:', executor, version)

local Executor = InfoTab:AddText({
		Text = "Executor: "..executor.." Version: "..version,
		Name = "VersionScript"
	})
end)
local Version = InfoTab:AddText({
		Text = "Version:"..V,
		Name = "VersionScript"
	})
window:Notify({
				Title = "Script Version!",
				Message = V,
				Duration = 7.5,
})
local AimbotSettings = {
    ["Verify Wall"] = false,
    ["Verify Team Color"] = false,
    ["Target Bot"] = false,
    ["Infinite Aimbot Distance"] = false,
}
local ESPs = {}
local LineESPEnabled = false 
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local IYMouse = Players.LocalPlayer:GetMouse()
local FLYING = false
local QEfly = true
local iyflyspeed = 1
local vehicleflyspeed = 1

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function getDistance(a, b)
	return (a.Position - b.Position).Magnitude
end

local function hasClearLineOfSight(from, to)
	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Blacklist
	rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
	local result = workspace:Raycast(from.Position, (to.Position - from.Position), rayParams)
	return not (result and result.Instance and result.Instance.Transparency < 1)
end

local function isValidTarget(char)
	if not char or char == LocalPlayer.Character then return false end
	local humanoid = char:FindFirstChildWhichIsA("Humanoid")
	local head = char:FindFirstChild("Head")
	if not humanoid or not head then return false end
	if humanoid.Health == 0 then return false end
	if AimbotSettings["Verify Team Color"] then
		local player = Players:GetPlayerFromCharacter(char)
		if player and player.TeamColor == LocalPlayer.TeamColor then return false end
	end
	if AimbotSettings["Verify Wall"] then
		local myHead = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")
		if myHead and not hasClearLineOfSight(myHead, head) then return false end
	end
	return true
end

local function aimToClosestTarget()
	local myCharacter = LocalPlayer.Character
	local myHead = myCharacter and myCharacter:FindFirstChild("Head")
	local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
	if not (myHead and myRoot) then return end

	local Camera = workspace.CurrentCamera

	local function isInCameraView(part)
		local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
		return onScreen and screenPos.Z > 0
	end

	local closestTarget = nil
	local shortestDistance = AimbotSettings["Infinite Aimbot Distance"] and math.huge or MaxDistanceForAimbot

	if AimbotSettings["Target Bot"] then
		for _, instance in pairs(workspace:GetDescendants()) do
			if instance:IsA("Humanoid") and instance.Health > 0 and isValidTarget(instance.Parent) then
				local character = instance.Parent
				local head = character:FindFirstChild("Head")
				local root = character:FindFirstChild("HumanoidRootPart")

				if head and root and (isInCameraView(head) or isInCameraView(root)) then
					local distance = getDistance(myHead, head)
					if distance < shortestDistance then
						shortestDistance = distance
						closestTarget = head
					end
				end
			end
		end
	else
		for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
			local character = player.Character
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			local head = character and character:FindFirstChild("Head")
			local root = character and character:FindFirstChild("HumanoidRootPart")

			if humanoid and humanoid.Health > 0 and head and root and isValidTarget(character) then
				if isInCameraView(head) or isInCameraView(root) then
					local distance = getDistance(myHead, head)
					if distance < shortestDistance then
						shortestDistance = distance
						closestTarget = head
					end
				end
			end
		end
	end

	if closestTarget then
		if HowAim == "Camera" then
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestTarget.Position)
		elseif HowAim == "Character" then
			local lookVector = (closestTarget.Position - myRoot.Position).Unit
			myRoot.CFrame = CFrame.new(
				myRoot.Position,
				myRoot.Position + Vector3.new(lookVector.X, 0, lookVector.Z)
			)
		end
	end
end

local function aimToClosestTargetOld()
	local myCharacter = LocalPlayer.Character
	local myHead = myCharacter and myCharacter:FindFirstChild("Head")
	local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
	if not (myHead and myRoot) then return end

	local closestTarget = nil
	local shortestDistance = 0
if AimbotSettings["Infinite Aimbot Distance"] then
shortestDistance = math.huge
else
shortestDistance = MaxDistanceForAimbot
end 
if AimbotSettings["Target Bot"] then
	for _, instance in pairs(workspace:GetDescendants()) do
		if instance:IsA("Humanoid") and instance.Health > 0 then
if isValidTarget(instance.Parent) then
			local head = instance.Parent:FindFirstChild("Head")
			if head then
				local distance = getDistance(myHead, head)
				if distance < shortestDistance then
					shortestDistance = distance
					closestTarget = head
				end
end
			end
		end
	end
else
for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
	local character = player.Character
	local humanoid = character and character:FindFirstChildOfClass("Humanoid")
	local head = character and character:FindFirstChild("Head")

	if humanoid and humanoid.Health > 0 and head and isValidTarget(character) then
		local distance = getDistance(myHead, head)
		if distance < shortestDistance then
			shortestDistance = distance
			closestTarget = head
		end
	end
end

end
	if closestTarget then
		if HowAim == "Camera" then
			Camera.CFrame = CFrame.new(Camera.CFrame.Position, closestTarget.Position)
		elseif HowAim == "Character" then
			local lookVector = (closestTarget.Position - myRoot.Position).Unit
			local newCFrame = CFrame.new(myRoot.Position, myRoot.Position + Vector3.new(lookVector.X, 0, lookVector.Z))
			myRoot.CFrame = newCFrame
		end
	end
end


local function getServerInfo()
	local Players = game:GetService("Players")
	local playerCount = #Players:GetPlayers()
local maxPlayers = game:GetService("Players").MaxPlayers
local isStudio = game:GetService("RunService"):IsStudio()

	return {
		PlaceId = game.PlaceId,
		JobId = game.JobId,
		IsStudio = isStudio,
		CurrentPlayers = playerCount,
MaxPlayers =maxPlayers
	}
end

local function sFLY(vfly)
	repeat wait() until Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	repeat wait() until IYMouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.CFrame = T.CFrame
		BV.Velocity = Vector3.new(0, 0, 0)
		BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat wait()
				if not vfly and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
					Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.Velocity = Vector3.new(0, 0, 0)
				end
				BG.CFrame = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
				Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = IYMouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or iyflyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or iyflyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or iyflyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or iyflyspeed)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = IYMouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

local function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
		Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

local velocityHandlerName = "BodyVelocity"
local gyroHandlerName = "BodyGyro"
local mfly1
local mfly2

local function UnMobileFly()
	pcall(function()
		FLYING = false
		local root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		root:FindFirstChild(velocityHandlerName):Destroy()
		root:FindFirstChild(gyroHandlerName):Destroy()
		Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
		mfly1:Disconnect()
		mfly2:Disconnect()
	end)
end

local function MobileFly()
	UnMobileFly()
	FLYING = true

	local root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local camera = workspace.CurrentCamera
	local v3none = Vector3.new()
	local v3zero = Vector3.new(0, 0, 0)
	local v3inf = Vector3.new(9e9, 9e9, 9e9)

	local controlModule = require(Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
	local bv = Instance.new("BodyVelocity")
	bv.Name = velocityHandlerName
	bv.Parent = root
	bv.MaxForce = v3zero
	bv.Velocity = v3zero

	local bg = Instance.new("BodyGyro")
	bg.Name = gyroHandlerName
	bg.Parent = root
	bg.MaxTorque = v3inf
	bg.P = 1000
	bg.D = 50

	mfly1 = Players.LocalPlayer.CharacterAdded:Connect(function()
		local bv = Instance.new("BodyVelocity")
		bv.Name = velocityHandlerName
		bv.Parent = root
		bv.MaxForce = v3zero
		bv.Velocity = v3zero

		local bg = Instance.new("BodyGyro")
		bg.Name = gyroHandlerName
		bg.Parent = root
		bg.MaxTorque = v3inf
		bg.P = 1000
		bg.D = 50
	end)

	mfly2 = RunService.RenderStepped:Connect(function()
		root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
		camera = workspace.CurrentCamera
		if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild(velocityHandlerName) and root:FindFirstChild(gyroHandlerName) then
			local humanoid = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			local VelocityHandler = root:FindFirstChild(velocityHandlerName)
			local GyroHandler = root:FindFirstChild(gyroHandlerName)

			VelocityHandler.MaxForce = v3inf
			GyroHandler.MaxTorque = v3inf
			humanoid.PlatformStand = true
			GyroHandler.CFrame = camera.CoordinateFrame
			VelocityHandler.Velocity = v3none

			local direction = controlModule:GetMoveVector()
			if direction.X > 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * ((iyflyspeed) * 50))
			end
			if direction.X < 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * ((iyflyspeed) * 50))
			end
			if direction.Z > 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * ((iyflyspeed) * 50))
			end
			if direction.Z < 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * ((iyflyspeed) * 50))
			end
		end
	end)
end
RunService.RenderStepped:Connect(function(dt)
task.spawn(function()
	local updatedInfo = getServerInfo()
	local updatedContent = string.format(
		"🎮 Game: %s\n📌 PlaceId: %s\n🔑 JobId: %s\n🧪 IsStudio: %s\n👥 Players: %d/%d",
	infoGameName.Name,
    	updatedInfo.PlaceId,
		updatedInfo.JobId,
		
		tostring(updatedInfo.IsStudio),
		updatedInfo.CurrentPlayers,
updatedInfo.MaxPlayers

	)

	ParagraphInfoServer:Set({
		Title = "Info",
		Content = updatedContent
	})
end)
	local cameraPosition = Camera.CFrame.Position
	local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
task.spawn(function()
	for _, esp in ipairs(ESPs) do
		local part = esp.Part
		local highlight = esp.Highlight
		local billboard = esp.Billboard
		local label = esp.Label
		local line = esp.Line
if not part or not highlight or not billboard or not label or not line then return end
		if part and part.Parent and highlight and billboard then
			local distance = (cameraPosition - part.Position).Magnitude
			local screenPos, onScreen = Camera:WorldToViewportPoint(part.Position)
			local withinRange = DisableLimitRangerEsp or distance <= LimitRangerEsp

			highlight.Enabled = withinRange and onScreen
			billboard.Enabled = withinRange and onScreen

			if ActiveDistanceEsp then
				label.Text = esp.Text .. " (" .. math.floor(distance + 0.5) .. " m)"
			else
				label.Text = esp.Text
			end

			if LineESPEnabled then
				if onScreen and withinRange then
					line.Visible = true
					line.From = screenCenter
					line.To = Vector2.new(screenPos.X, screenPos.Y)
				else
					line.Visible = false
				end
			else
				line.Visible = false
			end
		else
			if line then line.Visible = false end
		end
	end
    end)
if ActiveAimbot then
aimToClosestTarget()
end
if ActiveFullBright then
if game.Lighting then 
game.Lighting.Brightness = 5
game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
end  
end
if game.Players.LocalPlayer.Character then
if ActiveSpeedBoost then 
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ValueSpeed 
end
if ActivateEditJumpPower then 
game.Players.LocalPlayer.Character.Humanoid.JumpPower = ValueJP
end
if ActiveNoclip then 
if game.Players.LocalPlayer.Character then
for _, Parts in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if Parts:IsA("BasePart") and Parts.CanCollide then
Parts.CanCollide = false
end
end
end
end
end
end)
local function CreateEsp(Char, Color, Text, Parent,Num)
	if not Char or not Parent then return end
	if Char:FindFirstChild("ESP") and Char:FindFirstChildOfClass("Highlight") then return end

	
	local highlight = Char:FindFirstChildOfClass("Highlight") or Instance.new("Highlight")
	highlight.Name = "ESP_Highlight"
	highlight.Adornee = Char
	highlight.FillColor = Color
	highlight.FillTransparency = 1
	highlight.OutlineColor = Color
	highlight.OutlineTransparency = 0
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	highlight.Enabled = false
	highlight.Parent = Char

	
	local billboard = Char:FindFirstChild("ESP") or Instance.new("BillboardGui")
	billboard.Name = "ESP"
	billboard.Size = UDim2.new(0, 50, 0, 25)
	billboard.AlwaysOnTop = true
	billboard.StudsOffset = Vector3.new(0, Num, 0)
	billboard.Adornee = Parent
	billboard.Enabled = false
	billboard.Parent = Parent

	local label = billboard:FindFirstChildOfClass("TextLabel") or Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = Text
	label.TextColor3 = Color
	label.TextScaled = true
	label.Parent = billboard

	local line = Drawing.new("Line")
	line.Visible = false
	line.Color = Color
	line.Thickness = 1.5
	line.Transparency = 1

	table.insert(ESPs, {
		Char = Char,
		Highlight = highlight,
		Billboard = billboard,
		Label = label,
		Part = Parent,
		Line = line,
		Text = Text,
		Color = Color
	})
end

local function KeepEsp(Char, Parent)
	if not Char or not Char:FindFirstChildOfClass("Highlight") then return end
	if not Parent or not Parent:FindFirstChildOfClass("BillboardGui") then return end

	for i = #ESPs, 1, -1 do 
		local esp = ESPs[i]
		if esp.Char == Char then 
			if esp.Highlight then esp.Highlight:Destroy() end
			if esp.Billboard then esp.Billboard:Destroy() end
			if esp.Line then esp.Line:Destroy() end

			table.remove(ESPs, i) 
		end
	end
end

local function copyToClipboard(text)
    if setclipboard then
        setclipboard(text)
    else
        warn("setclipboard is not supported in this environment.")
    end
end

local DiscordLink = DiscordTab:AddButton({
    Text = "Discord Link",
   Name = "DiscordLink",
   Callback = function()
copyToClipboard("https://discord.gg/E2TqYRsRP4")
end,
})

local PlayerActiveEspPlayersToggle = EspTab:AddToggle({
    Text = "Esp Players",
   Name = "PlayerActiveEspPlayersToggle",
   Default = false,
   Flag = "PlayerActiveEspPlayersToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActiveEspPlayers = Value 
if ActiveEspPlayers  then
for _, Players in pairs(Game:GetService("Players"):GetChildren()) do
if Players:isA("Player") and Players.Character and Players.Character:FindFirstChild("Head") and not Players.Character:FindFirstChildOfClass("Highlight") and not Players.Character.Head:FindFirstChildOfClass("BillboardGui") then
CreateEsp(Players.Character,Color3.fromRGB(255,255,255),Players.Name,Players.Character.Head,2)
end
end
else
for _, Players in pairs(Game:GetService("Players"):GetChildren()) do
if Players:isA("Player") and Players.Character and Players.Character:FindFirstChild("Head") and  Players.Character:FindFirstChildOfClass("Highlight") and  Players.Character.Head:FindFirstChildOfClass("BillboardGui") then
KeepEsp(Players.Character,Players.Character.Head)
end
end
end
end,
})

local PlayerNoclipToggle = PlayerTab:AddToggle({
    Text = "Noclip",
   Name = "PlayerNoclipToggle",
   Default = false,
   Flag = "PlayerNoclipToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActiveNoclip = Value 
if ActiveNoclip then 
if game.Players.LocalPlayer.Character then
for _, Parts in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if Parts:IsA("BasePart") and Parts.CanCollide then
Parts.CanCollide = false
end
end
end
else
if game.Players.LocalPlayer.Character then
for _, Parts in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
if Parts:IsA("BasePart") and not Parts.CanCollide then
Parts.CanCollide = true
end
end
end
end
end,
})

local PlayerFlySpeedSlider = PlayerTab:AddSlider({
    Text = "Fly Speed(Recommended to put 1 or below 5!)",
   Name = "PlayerFlySpeedSlider",
  Min = 1,
   Max = 10,
   Default = 1,
   Flag = "PlayerFlySpeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
iyflyspeed = Value
end, 
})

local PlayerFlyToggle = PlayerTab:AddToggle({
    Text = "Fly",
   Name = "PlayerFlyToggle",
   Default = false,
   Flag = "PlayerFlyToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActivateFly = Value 
task.spawn(function()
if not FLYING and ActivateFly then
			if UserInputService.TouchEnabled then
				MobileFly()
			else
task.spawn(function()
if not AlrActivatedFlyPC then 
AlrActivatedFlyPC = true
window:Notify({
				Title = "Fly!",
				Message = "When you enable to fly you can press F to fly/unfly (it won't disable the button!)",
				Duration = 5,
})
end
end)
				NOFLY()
				wait()
				sFLY()
			end
		elseif FLYING and not ActivateFly then
			if UserInputService.TouchEnabled then
				UnMobileFly()
			else
				NOFLY()
			end
		end
end)
end,
})

local PlayerInfiniteJumpToggle = PlayerTab:AddToggle({
    Text = "Infinite Jump",
   Name = "PlayerInfiniteJumpToggle",
   Default = false,
   Flag = "PlayerInfiniteJumpToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActivateInfiniteJump = Value 
end,
})

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.F then
		if not FLYING and ActivateFly then
			if UserInputService.TouchEnabled then
				MobileFly()
			else
				NOFLY()
				wait()
				sFLY()
			end
		elseif FLYING and ActivateFly then
			if UserInputService.TouchEnabled then
				UnMobileFly()
			else
				NOFLY()
			end
		end
	end
end)


local PlayerSpeedSlider = PlayerTab:AddSlider({
    Text = "Player Speed",
   Name = "PlayerSpeedSlider",
  Min = 0,
  Max = 2500,
   Default = 16,
   Flag = "PlayerSpeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
ValueSpeed = Value
end, 
})

local PlayerActiveModifyingSpeedToggle = PlayerTab:AddToggle({
    Text = "Active Modifying Player Speed",
   Name = "PlayerActiveModifyingSpeedToggle",
   Default = false,
   Flag = "PlayerActiveModifyingSpeedToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActiveSpeedBoost = Value 
if ActiveSpeedBoost then 
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ValueSpeed 
else
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = OldSpeed 
end
end,
})

local PlayerSpeedSlider2 = PlayerTab:AddSlider({
    Text = "Player Jump Power",
   Name = "PlayerSpeedSlider2",
  Min = 0,
  Max = 1000,
   Default = 50,
   Flag = "PlayerSpeedSlider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
ValueJP = Value
end, 
})

local PlayerActiveModifyingSpeedToggle = PlayerTab:AddToggle({
    Text = "Active Modifying Player Speed",
   Name = "PlayerActiveModifyingSpeedToggle2",
   Default = false,
   Flag = "PlayerActiveModifyingSpeedToggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActivateEditJumpPower = Value 
if ActivateEditJumpPower then 
game.Players.LocalPlayer.Character.Humanoid.JumpPower = ValueJP
else
game.Players.LocalPlayer.Character.Humanoid.JumpPower = OldJP
end
end,
})


local PlayerActiveAimbot = AimbotTab:AddToggle({
    Text = "Active Aimbot",
   Name = "PlayerActiveAimbot",
   Default = false,
   Flag = "PlayerActiveAimbot", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActiveAimbot = Value 
end,
})



local AimbotDropdown = AimbotTab:AddDropdown({
    Text = "Aimbot Settings",
    Name = "AimbotDropdown",
    Options = {"Verify Wall", "Verify Team Color", "Target Bot", "Infinite Aimbot Distance"},
    Default = "",
    MultiSelect = true,
    Flag = "AimbotDropdown",
    Callback = function(Options1)
        if AimbotSettings[Options1] == nil then
            return
        end

    
        AimbotSettings[Options1] = not AimbotSettings[Options1]

       
    end,
})


local AimbotDropdown2 = AimbotTab:AddDropdown({
    Text = "Aiming Settings",
    Name = "AimbotDropdown2",
    Options = {"Camera", "Character"},
    Default = "Camera",
    MultiSelect = false,
    Flag = "AimbotDropdown2",
    Callback = function(Options)
        if Options == "Camera" then
            HowAim = "Camera"
        elseif Options == "Character" then
            HowAim = "Character"
        end
    end,
})

local DistanceAimbotSlider = AimbotTab:AddSlider({
    Text = "Distance Aimbot(Work Only if Infinite Aimbot Distance Is Disabled!)",
   Name = "DistanceAimbotSlider",
  Min = 10,
  Max = 1500,
   Default = 0,
   Flag = "DistanceAimbotSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
MaxDistanceForAimbot = Value
end,
})

local ButtonLoadForsakenCheat = GameTab:AddButton({
    Text = "Forsaken Cheat(by Iliankytb)",
   Name = "ButtonLoadForsakenCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestForsakenScript"))()
end,
})

local ButtonLoadFiveNightsCheat = GameTab:AddButton({
    Text = "Five Nights:Hunted Cheat(by Iliankytb)",
   Name = "ButtonLoadFiveNightsCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/CheatFiveNightHunted"))()
end,
})


local ButtonLoadRFTwoCheat = GameTab:AddButton({
    Text = "Rainbow Friends 2 Cheat(by Iliankytb)",
   Name = "ButtonLoadRFTwoCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestRainbowFriendsTwo"))()
end,
})
local ButtonLoadDoorsCheat = GameTab:AddButton({
    Text = "Doors Cheat(by Iliankytb)",
   Name = "ButtonLoadDoorsCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/NewBestDoorsScriptIliankytb"))()
end,
})
local ButtonLoadHZCheat = GameTab:AddButton({
    Text = "Hunty Zombies Cheat(by Iliankytb)",
   Name = "ButtonLoadHZCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestFreeHuntyZombies"))()
end,
})
--[[local PlaceId = InfoTab:CreateButton({
   Name = "Copy PlaceId",
   Callback = function()
copyToClipboard(game.PlaceId)
end,
})]]
local ButtonLoadInkGameCheat = GameTab:AddButton({
    Text = "Ink Game Cheat(by Iliankytb)",
   Name = "ButtonLoadInkGameCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestInkGameCheat"))()
end,
})
local ButtonLoadEvadeCheat = GameTab:AddButton({
    Text = "Evade Cheat(by Iliankytb)",
   Name = "ButtonLoadEvadeCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/NewbestEvadeCheat"))()
end,
})

local ButtonLoadRBC1Cheat = GameTab:AddButton({
    Text ="Rainbow Friends Chapter 1 Cheat(by Iliankytb)",
   Name = "ButtonLoadRBC1Cheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestRainbowFriendOne"))()
end,
})
local ButtonLoadGAGCheat = GameTab:AddButton({
    Text ="Grow a garden Cheat(by Iliankytb)",
   Name = "ButtonLoadGAGCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/cheatgrowagarden"))()
end,
})
local ButtonLoad99NightsInTheForestCheat = GameTab:AddButton({
    Text ="99 Nights in the forest Cheat(by Iliankytb)",
   Name = "ButtonLoad99NightsInTheForestCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/Best99NightsInTheForest"))()
end,
})
local ButtonLoadInfiniteYieldCheat = PlayerTab:AddButton({
    Text = "Infinite Yield",
   Name = "ButtonLoadInfiniteYieldCheat",
     Callback = function(Value)
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end,
})
local ButtonLoadPiggyCheat = GameTab:AddButton({
    Text = "Piggy Cheat(by Iliankytb)",
   Name = "ButtonLoadPiggyCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/CheatPiggy"))()
end,
})
local ButtonLoadAntarcticaExpeditionCheat = GameTab:AddButton({
    Text ="Antartica Expedition Cheat(by Iliankytb)",
   Name = "ButtonLoadAntarcticaExpeditionCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestAntarticaExpedition"))()
end,
})
local ButtonLoadFischCheat = GameTab:AddButton({
    Text ="Fisch Cheat(by Iliankytb)",
   Name = "ButtonLoadFischCheat",
     Callback = function(Value)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/NewBestFischScript"))()
end,
})

local ButtonUnloadCheat = SettingsTab:AddButton({
    Text = "Unload Cheat",
   Name = "ButtonUnloadCheat",
   Callback = function()

end,
})
local EspDistanceSlider = SettingsTab:AddSlider({
  Text = "Distance for esp",
Name = "EspDistanceSlider",
  Min = 25,
Max = 1500,
   Default = 25,
   Flag = "EspDistanceSlider",
   Callback = function(Value)
LimitRangerEsp = Value
end,  
})
local DisableLimitEsp = SettingsTab:AddToggle({
  Text = "Disable Esp Distance Limiter",
Name = "DisableLimitEsp",
   CurrentValue = false,
   Flag = "DEDL",
   Callback = function(Value)
DisableLimitRangerEsp = Value
end,  
})
local ActiveDistEsp = SettingsTab:AddToggle({
  Text = "Distance Esp",
Name = "DistanceEsp",
   CurrentValue = false,
   Flag = "DistanceEsp",
   Callback = function(Value)
ActiveDistanceEsp = Value
end,  
})

local LineEsp = SettingsTab:AddToggle({
  Text = "Line for esp",
Name = "LineEsp",
   CurrentValue = false,
   Flag = "LFE",
   Callback = function(Value)
LineESPEnabled = Value
end,  
})

local PlayerFullBright = PlayerTab:AddToggle({
    Text = "Full Bright",
   Name = "PlayerFullBright",
   Default = false,
   Flag = "PlayerFullBright",
   Callback = function(Value)
ActiveFullBright = Value 
if ActiveFullBright then 
if game.Lighting then 
game.Lighting.Brightness = 5
game.Lighting.Ambient = Color3.fromRGB(255, 255, 255) 
end  
else
if game.Lighting then 
game.Lighting.Brightness = OldBrightness
game.Lighting.Ambient = OldAmbient
end  
end
end,  
})
local NoCooldownpromptToggle = PlayerTab:AddToggle({
    Text = "Instant Interact",
   Name = "NoCooldownpromptToggle",
   Default = false,
   Flag = "NoCooldownpromptToggle", 
   Callback = function(Value)
ActiveNoCooldownPrompt = Value  
if ActiveNoCooldownPrompt then
for _,Assets in pairs(Game.Workspace:GetDescendants()) do  
if Assets:isA("ProximityPrompt") then 
if Assets.HoldDuration ~= 0 then
Assets:SetAttribute("HoldDurationOld",Assets.HoldDuration)
Assets.HoldDuration = 0
end
end 
end  
else
for _,Assets in pairs(Game.Workspace:GetDescendants()) do  
if Assets:isA("ProximityPrompt") then 
if Assets:GetAttribute("HoldDurationOld") and Assets:GetAttribute("HoldDurationOld") ~= 0 then
Assets.HoldDuration = Assets:GetAttribute("HoldDurationOld")
end
end 
end   
end
end,
})
local ChangeThemeDropdown = SettingsTab:AddDropdown({
		Text = "Change Theme:",
		Name = "CTD",
		Options = {"Default", "Light", "RedDark","BlueNeon","GreenMatrix","PurpleDream","Sunset",
		"Ocean","Toxic","Storm","LimePop","Cyber","Chocolate","RoseGold","CottonCandy","NightSky","Steel",
			"GoldLux","Ice","TealWave","FrostFire","DarkMatter","Lava","PinkCandy","Sakura","DeepSpace","Skyline","Crimson"
			,"Desert","Camo","Plasma","Arctic","Slate","Vaporwave"
			
		},
		Default = "Default",
		MultiSelect = false,
		Flag = "CTD", --Put a name flag for save data if you enabled saving data
		Callback = function(choice)
window:ChangeTheme(choice)
		end
	})

	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
if ActivateInfiniteJump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
end
	end)


library:LoadData()
workspace.DescendantAdded:Connect(function(child)
if ActiveNoCooldownPrompt then
if child:isA("ProximityPrompt") then 
if child.HoldDuration ~= 0 then
child:SetAttribute("HoldDurationOld",child.HoldDuration)
child.HoldDuration = 0
end
end 
end  
task.wait(0.75)
if ActiveEspPlayers  then
    local Players = game:GetService("Players"):GetPlayerFromCharacter(child)
    if Players then
if   child and child.PrimaryPart then
 if Players.Character:FindFirstChild("Head") and not Players.Character:FindFirstChildOfClass("Highlight") and not Players.Character.Head:FindFirstChildOfClass("BillboardGui") then
CreateEsp(Players.Character,Color3.fromRGB(255,255,255),Players.Name,Players.Character.Head,2)
end
end
end
end
end)
workspace.DescendantRemoving:Connect(function(child)
if ActiveEspPlayers  then
    local Players = game:GetService("Players"):GetPlayerFromCharacter(child)
    if Players then
if   child and child.PrimaryPart then
 if Players.Character:FindFirstChild("Head") and Players.Character:FindFirstChildOfClass("Highlight") and  Players.Character.Head:FindFirstChildOfClass("BillboardGui") then
KeepEsp(Players.Character,Players.Character.Head)
end
end
end
end
end)
end)
