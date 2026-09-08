
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/Zentrix"))()
local selectedTheme = "Default"
local V = "V.0.35"
library:CreateWindow({
	Title = "Evade - by Iliankytb",-- Title of the script
	Theme = selectedTheme,--View more theme in my dicord server!
	Icon = 0,-- 0 = no icon or add number
	Intro = false,--Intro or no
	IntroTitle = "Zentrix Library Testing",--the intro title
	KeyPC = Enum.KeyCode.K,--the key for pc for Open/close the frame
	Data = {
		EnableSavingData = true,--Enabling data saver or no
		DisableNotifyingLoadedData = false,--set it to true for disable the notify when loaded data
		FolderName = "SaverEvade",--Folder Name,you can change it
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
local DiscordTab = window:CreateTab("Discord",0)
local SettingsTab = window:CreateTab("Settings",0)
local LimitRangerEsp = 100
local ActiveSpeedBoost,ActiveEspPlayers,ActiveEspBots,ActiveAutoWin,ActiveAutoFarmMoney,InReviving,AutoFarmSummerEvent,ActiveEspSummerEvent,InTickets,ActiveDistanceEsp = false,false,false,false,false,false,false,false,false,false
local ParagraphInfoServer = InfoTab:AddParagraph({Title = "",Content = "Loading",Name = "Paragraph1"})
local DisableLimitRangerEsp = false
local Currentlydoingtheevent = false
local ValueSpeed = 16
local FullBright = false
local cantdoingtheautowinsecurity = false
local AutoRevive = false
local ShowTimer = false
local ActivateFly = false
local AlrActivatedFlyPC = false
local MarketplaceService = game:GetService("MarketplaceService")
local infoGameName = MarketplaceService:GetProductInfo(game.GameId)

local UserInputService = game:GetService("UserInputService")
local ScreenGuiTimer = Instance.new("ScreenGui")
ScreenGuiTimer.Parent = game:GetService("CoreGui")

local LabelTimer = Instance.new("TextLabel")
LabelTimer.Size = UDim2.new(0.15, 0, 0.05, 0)          
LabelTimer.Position = UDim2.new(0.85, 0, 0.5, -25)        
LabelTimer.BackgroundTransparency = 1              
LabelTimer.Text = "Time"
LabelTimer.TextColor3 = Color3.new(1, 1, 1)         
LabelTimer.TextScaled = true          
LabelTimer.TextStrokeTransparency = 0              
LabelTimer.Font = Enum.Font.GothamBold
LabelTimer.Visible = false
LabelTimer.Parent = ScreenGuiTimer

local Version = InfoTab:AddText({
		Text = "Version:"..V,
		Name = "VersionScript"
	})
window:Notify({
				Title = "Script Version!",
				Message = V,
				Duration = 7.5,
})
local function GetDownedPlayer()
        for _, v in pairs(game.Workspace.Game.Players:GetChildren()) do
            if v:GetAttribute("Downed") and not v:GetAttribute("Carried") then
                return v
            end
        end
        return nilk
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
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local IYMouse = Players.LocalPlayer:GetMouse()
local FLYING = false
local QEfly = true
local iyflyspeed = 1
local vehicleflyspeed = 1

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
local ESPs = {}
local Camera = workspace.CurrentCamera
local LineESPEnabled = false 
local cantrevivebcidk = false

local function CreateEsp(Char, Color, Text, Parent,num)
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
	billboard.StudsOffset = Vector3.new(0, num, 0)
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

RunService.RenderStepped:Connect(function()
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
     if ShowTimer then
            if workspace.Game.Stats then
            LabelTimer.Text = tonumber(workspace.Game.Stats:GetAttribute("Timer"))
            end
        end
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
    if ActiveAutoWin and not cantdoingtheautowinsecurity and not Currentlydoingtheevent then
 if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (not InReviving or game.Players.LocalPlayer.Character:GetAttribute("State") ~= "Downed") and not game.Players.LocalPlayer.Character:GetAttribute("Carrying") then
local securityPart = game.Workspace:FindFirstChild("SecurityPart") or Instance.new("Part")
            securityPart.Name = "SecurityPart"
            securityPart.Size = Vector3.new(10, 1, 10)
            securityPart.Position = Vector3.new(0, 500, 0)
            securityPart.Anchored = true
            securityPart.Parent = game.Workspace
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = securityPart.CFrame + Vector3.new(0, 3, 0)  -- Téléporte le joueur au-dessus de la Part de sécurité
         cantdoingtheautowinsecurity = true
            wait(0.5)
            securityPart:Destroy()
            wait(0.25)
            cantdoingtheautowinsecurity = false
end 
end
if FullBright then
    if Game.Lighting then 
game.Lighting.Brightness = 2
game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
end 
end
if AutoFarmSummerEvent and not Currentlydoingtheevent and not InReviving then
Currentlydoingtheevent = true
    for _, child in pairs(game.Workspace.Game.Effects.Tickets:GetChildren()) do
if  child and  child:IsA("Model") and child.PrimaryPart and child.Name == "Visual"  then 
 if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (not InReviving or game.Players.LocalPlayer.Character:GetAttribute("State")~= "Downed") and not game.Players.LocalPlayer.Character:GetAttribute("Carrying") then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = child.PrimaryPart.CFrame + Vector3.new(0, 3, 0)           
wait(0.5)
end
end
end
Currentlydoingtheevent = false
end
if AutoRevive and not cantrevivebcidk then
   if game.Players.LocalPlayer.Character:GetAttribute("Downed") then
       game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true)
  cantrevivebcidk = true
  wait(3)
  cantrevivebcidk = false
  end
end
if  ActiveAutoFarmMoney and not InReviving and not Currentlydoingtheevent then
 if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:GetAttribute("State") ~= "Downed" and not game.Players.LocalPlayer.Character:GetAttribute("Carrying") then
local downedPlayer = GetDownedPlayer()
          if downedPlayer and downedPlayer:FindFirstChild("HumanoidRootPart") and downedPlayer ~= game.Players.LocalPlayer then
          InReviving = true    
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = downedPlayer.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
             game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive",true,downedPlayer)
                wait(0.5)
        InReviving = false
            end
end 
end
if ActiveSpeedBoost then 
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = ValueSpeed 
end
    end
    end)
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

local EspPlayersToggle = EspTab:AddToggle({
Text = "Players Esp",
   Name = "EspPlayersToggle",
   Default = false,
   Flag = "EspPlayers", 
   Callback = function(Value)
ActiveEspPlayers = Value 
if ActiveEspPlayers then
    for _, Assets in pairs(Players:GetChildren()) do
        if Assets and Assets.Character then
            if Assets.Character:GetAttribute("RigType") == "R15" then
                local Char = Assets.Character:FindFirstChildOfClass("Model")
                if Char then
                    local Head = Char:FindFirstChild("Head")

                    if Head
                    and not Char.Parent:FindFirstChildOfClass("Highlight")
                    and not Head:FindFirstChildOfClass("BillboardGui") then

                        CreateEsp(Char, Color3.fromRGB(255,255,255), Assets.Name, Head, 1)
                    end
                end

            else
                local Char = Assets.Character
                local Head = Char:FindFirstChild("Head")

                if Head
                and not Char:FindFirstChildOfClass("Highlight")
                and not Head:FindFirstChildOfClass("BillboardGui") then

                    CreateEsp(Char, Color3.fromRGB(255,255,255), Assets.Name, Head, 1)
                end
            end

        end
    end

else

    for _, Assets in pairs(Players:GetChildren()) do
        if Assets and Assets.Character then

     
            if Assets.Character:GetAttribute("RigType") == "R15" then
                local Char = Assets.Character:FindFirstChildOfClass("Model")
                if Char then
                    local Head = Char:FindFirstChild("Head")

                    if Head
                    and Char.Parent:FindFirstChildOfClass("Highlight")
                    and Head:FindFirstChildOfClass("BillboardGui") then

                        KeepEsp(Char, Head)
                    end
                end

     
            else
                local Char = Assets.Character
                local Head = Char:FindFirstChild("Head")

                if Head
                and Char:FindFirstChildOfClass("Highlight")
                and Head:FindFirstChildOfClass("BillboardGui") then

                    KeepEsp(Char, Head)
                end
            end

        end
    end

end
end,
})
local EspBotsToggle = EspTab:AddToggle({
Text = "Bots Esp",
   Name = "EspBotsToggle",
   Default = false,
   Flag = "EspBots", 
   Callback = function(Value)
ActiveEspBots = Value 
if ActiveEspBots then
    for _, Assets in pairs(game.Workspace.Game.Players:GetChildren()) do  
        if  Assets:IsA("Model") and Assets.PrimaryPart and Assets:GetAttribute("Team") == "Nextbot"  then
            if  not Assets:FindFirstChildOfClass("Highlight") and  Assets.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
             Assets.PrimaryPart.Transparency = 0.99
            CreateEsp(Assets, Color3.fromRGB(255,0,0), Assets.Name, Assets.PrimaryPart, -2)
             elseif not Assets:FindFirstChildOfClass("Highlight") and not Assets.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
            Assets.PrimaryPart.Transparency = 0.99
            CreateEsp(Assets, Color3.fromRGB(255,0,0), Assets.Name, Assets.PrimaryPart, -2)
             end
        end
    end
else
    for _, Assets in pairs(game.Workspace.Game.Players:GetChildren()) do  
        if Assets
        and Assets:IsA("Model")
        and Assets.PrimaryPart
        and Assets:GetAttribute("Team") == "Nextbot"
        and Assets:FindFirstChildOfClass("Highlight")
        and Assets.PrimaryPart:FindFirstChildOfClass("BillboardGui") then

            Assets.PrimaryPart.Transparency = 1
            KeepEsp(Assets, Assets.PrimaryPart)
        end
    end  
end

end,
})
local EspHalloweenEventToggle = EspTab:AddToggle({
Text = "Halloween Event Esp",
   Name = "EspHalloweenEventToggle",
   Default = false,
   Flag = "EspHalloweenEvent", 
   Callback = function(Value)
ActiveEspSummerEvent = Value 
if ActiveEspSummerEvent then
for _,Assets in pairs(game.Workspace.Game.Effects.Tickets:GetChildren()) do  
if Assets and Assets:IsA("Model") and Assets.PrimaryPart and Assets.Name == "Visual" and not Assets:FindFirstChildOfClass("Highlight") and not Assets.PrimaryPart:FindFirstChildOfClass("BillboardGui") then 
CreateEsp(Assets,Color3.fromRGB(0,255,255),"Tickets",Assets.PrimaryPart,-2) 
end 
end  
else
for _,Assets in pairs(Game.Workspace.Game.Effects.Tickets:GetChildren()) do  
if Assets and Assets:IsA("Model") and Assets.PrimaryPart and Assets.Name == "Visual"  and Assets:FindFirstChildOfClass("Highlight") and Assets.PrimaryPart:FindFirstChildOfClass("BillboardGui") then 
KeepEsp(Assets,Assets.PrimaryPart) 
end 
end   
end
end,
})
local AutoWinToggle = GameTab:AddToggle({
Text = "Auto Farm Win",
   Name = "AutoWinToggle",
   Default = false,
   Flag = "AutoWinToggle1", 
   Callback = function(Value)
ActiveAutoWin = Value 
end,
})
local AutoFarmMoneyToggle = GameTab:AddToggle({
Text = "Auto Farm Money",
   Name = "AutoFarmMoneyToggle",
   Default = false,
   Flag = "AutoFarmMoneyToggle1", 
   Callback = function(Value)
ActiveAutoFarmMoney = Value 
end,
})
local AutoFarmSummerEventToggle = GameTab:AddToggle({
Text = "Auto Farm Summer Event",
   Name = "AutoFarmSummerEventToggle",
   Default = false,
   Flag = "AutoFarmSummerEventToggle1", 
   Callback = function(Value)
AutoFarmSummerEvent = Value 
if AutoFarmSummerEvent then
Currentlydoingtheevent = true
    for _, child in pairs(game.Workspace.Game.Effects.Tickets:GetChildren()) do
if  child and  child:IsA("Model") and child.PrimaryPart and child.Name == "Visual"  then 
 if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (not InReviving or game.Players.LocalPlayer.Character:GetAttribute("State")~= "Downed") then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = child.PrimaryPart.CFrame + Vector3.new(0, 3, 0) 
if not AutoFarmSummerEvent then
Currentlydoingtheevent = false
break
end
wait(0.5)
if not AutoFarmSummerEvent then
Currentlydoingtheevent = false
break
end
end
end
end
Currentlydoingtheevent = false
end
end,
})

local PlayerSpeedSlider = PlayerTab:AddSlider({
Text = "Player Speed",
   Name = "PlayerSpeedSlider",
  Min = 0,
		Max = 2500,
		Default = 0,
   Flag = "PSSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
ValueSpeed = Value
end,
})

local PlayerActiveModifyingSpeedToggle = PlayerTab:AddToggle({
Text = "Active Modifying Player Speed(work only while doing an emote!)",
   Name = "PlayerActiveModifyingSpeedToggle",
   Default = false,
   Flag = "ButtonSpeed1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
  ActiveSpeedBoost = Value 
end,
})

local ButtonUnloadCheat = SettingsTab:AddButton({
Text = "Unload Cheat",
   Name = "ButtonUnloadCheat",
   Callback = function()

end,
})
local LimitRangerEspSlider = SettingsTab:AddSlider({
Text =  "Limit Ranger for esp",
   Name ="LimitRangerEspSlider",
   Min =25,
   Max = 1000,
   Default = 100,
   Flag = "LimitRangerEsp1",
   Callback = function(Value)
LimitRangerEsp = Value
end, 
})  
local DisableLimitRangerEspToggle = SettingsTab:AddToggle({
Text =  "Disable Limit Ranger Esp",
   Name ="DisableLimitRangerEspToggle",
   Default = false,
   Flag = "ButtonDLRE", 
   Callback = function(Value)
  DisableLimitRangerEsp = Value 
end,
})
local DistanceEspToggle = SettingsTab:AddToggle({
Text =  "Activate Distance For Esp",
   Name ="DistanceEspToggle",
   Default = false,
   Flag = "ButtonADFE", 
   Callback = function(Value)
  ActiveDistanceEsp = Value 
end,
})
local AutoReviveToggle = PlayerTab:AddToggle({
Text =  "Auto Revive",
   Name ="AutoReviveToggle",
   Default = false,
   Flag = "AutoReviveToggle", 
   Callback = function(Value)
  AutoRevive = Value 
end,
})
local TraitsToggle = SettingsTab:AddToggle({
Text =  "Trait for esp",
   Name ="TraitTogglke",
   Default = false,
   Flag = "ButtonTTR", 
   Callback = function(Value)
  LineESPEnabled = Value 
end,
})
local ShowTimerThings = GameTab:AddToggle({
Text =  "Show Timer",
   Name ="ShowTimer",
   Default = false,
   Flag = "ShowTimer", 
   Callback = function(Value)
  ShowTimer = Value 
  LabelTimer.Visible = ShowTimer
end,
})
local FullBrightsThings = GameTab:AddToggle({
Text =  "Full Bright",
   Name ="FullBright",
   Default = false,
   Flag = "FullBright", 
   Callback = function(Value)
  FullBright = Value 
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
   Flag = "ButtonFly", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
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
	local Notif = window:Notify({
		Title = "Fly!",
		Message = "When you enable to fly you can press F to fly/unfly (it won't disable the button!)!",
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

library:LoadData()
workspace.DescendantAdded:Connect(function(child)
task.wait(0.75)

 if ActiveEspPlayers then
        local playerA = game:GetService("Players"):GetPlayerFromCharacter(child)
        if playerA then
            if child:GetAttribute("RigType") == "R15" then
                local subModel = child:FindFirstChildOfClass("Model")
                if subModel then
                    if subModel:FindFirstChild("Head") 
                    and not subModel:FindFirstChildOfClass("Highlight") 
                    and not subModel.Head:FindFirstChildOfClass("BillboardGui") then
                        CreateEsp(subModel, Color3.fromRGB(255,255,255), playerA.Name, subModel.Head, 1)
                    end
                end
            else
                if child:IsA("Model") 
                and child:FindFirstChild("Head") 
                and not child:FindFirstChildOfClass("Highlight") 
                and not child.Head:FindFirstChildOfClass("BillboardGui") then
                    CreateEsp(child, Color3.fromRGB(255,255,255), playerA.Name, child.Head, 1)
                end
            end

        end
    end

if ActiveEspBots then
    if  child:IsA("Model") and child.PrimaryPart and child.Parent == game.Workspace.Game.Players  and child:GetAttribute("Team") == "Nextbot"  then
      if   not child:FindFirstChildOfClass("Highlight") and  child.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
      child.PrimaryPart.Transparency = 0.99
        CreateEsp(child, Color3.fromRGB(255,0,0), child.Name, child.PrimaryPart, -2)
     elseif   not child:FindFirstChildOfClass("Highlight") and not child.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
        child.PrimaryPart.Transparency = 0.99
        CreateEsp(child, Color3.fromRGB(255,0,0), child.Name, child.PrimaryPart, -2)
        end
    end
end


if ActiveEspSummerEvent then
if child and child:IsA("Model") and child.PrimaryPart and child.Name == "Visual" and child.Parent == game.Workspace.Game.Effects.Tickets and not child:FindFirstChildOfClass("Highlight") and not child.PrimaryPart:FindFirstChildOfClass("BillboardGui") then 
CreateEsp(child,Color3.fromRGB(0,255,255),"Tickets",child.PrimaryPart,-2) 
end 
end  

end)
workspace.DescendantRemoving:Connect(function(child)
    if ActiveEspPlayers then
        local playerA = game:GetService("Players"):GetPlayerFromCharacter(child)
        if playerA then

            if child:GetAttribute("RigType") == "R15" then
                local subModel = child:FindFirstChildOfClass("Model")
                if subModel then
                    if subModel:FindFirstChild("Head") 
                    and  subModel:FindFirstChildOfClass("Highlight") 
                    and  subModel.Head:FindFirstChildOfClass("BillboardGui") then
                        KeepEsp(subModel, subModel.Head)
                    end
                end

        
            else
                if child:IsA("Model") 
                and child:FindFirstChild("Head") 
                and  child:FindFirstChildOfClass("Highlight") 
                and  child.Head:FindFirstChildOfClass("BillboardGui") then
                    KeepEsp(child,child.Head)
                end
            end

        end
    end

    if ActiveEspBots then
    if child:IsA("Model") and child.Parent == workspace.Game.Players and child.PrimaryPart  and child:GetAttribute("Team") == "Nextbot"  then
        if  child:FindFirstChildOfClass("Highlight")  and child.PrimaryPart:FindFirstChildOfClass("BillboardGui") then
        KeepEsp(child, child.PrimaryPart)
        end
    end
end

    if ActiveEspSummerEvent then
        if child
          and child:IsA("Model") 
        and child.PrimaryPart
        and child.Name == "Visual"
        and child.Parent == workspace.Game.Effects.Tickets
        and child:FindFirstChildOfClass("Highlight")
        and child.PrimaryPart:FindFirstChildOfClass("BillboardGui")
        then
            KeepEsp(child, child.PrimaryPart)
        end
    end
end)

end)
