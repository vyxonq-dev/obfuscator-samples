if not game:IsLoaded() then
	game.Loaded:Wait()
end
SettingsAutofarm = {}
if _G.AutofarmSettings then
	SettingsAutofarm = _G.AutofarmSettings
else
	_G.AutofarmSettings = {}
	SettingsAutofarm = {AntiAfk = true, ResetWhenFullBag = true}
end
if _G.AutoFarmMM2IsLoaded then return end
_G.AutoFarmMM2IsLoaded = true
Player = game.Players.LocalPlayer
Players = game.Players
CoreGui = game.CoreGui
GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/elfandtears/GuiLibrary/main/source.lua"))()
RunService = game:GetService("RunService")
TweenService = game:GetService("TweenService")
CoinCollectedEvent = game.ReplicatedStorage.Remotes.Gameplay.CoinCollected
RoundStartEvent = game.ReplicatedStorage.Remotes.Gameplay.RoundStart
RoundEndEvent = game.ReplicatedStorage.Remotes.Gameplay.RoundEndFade
RandomNameFunction = GuiLibrary.RandomName
autofarmstopevent = Instance.new("BindableEvent")
MainGui = GuiLibrary.ScreenGUI({
	Name = RandomNameFunction(),
	ResetOnSpawn = false,
	Parent = CoreGui
})
MainFrame = GuiLibrary.Frame({
	Name = RandomNameFunction(),
	AnchorPoint = Vector2.new(.5, .5),
	BackgroundColor3 = Color3.new(0.0627451, 0.984314, 1),
	Position = UDim2.new(.5, 0, .5, 0),
	Size = UDim2.new(0.146, 0, 0.207, 0),
	ZIndex = 2,
	Parent = MainGui,
	Draggable_ = true
})
MainFrameBorder = GuiLibrary.Frame({
	Name = RandomNameFunction(),
	AnchorPoint = Vector2.new(.5, .5),
	BackgroundColor3 = Color3.new(0, 0, 0),
	Position = UDim2.new(.5, 0, .5, 0),
	Size = UDim2.new(0.152, 0, 0.217, 0),
	ZIndex = 1,
	Parent = MainGui,
	attach = MainFrame
})
MainFrameUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 8),
	Parent = MainFrame
})
MainFrameBorderUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 8),
	Parent = MainFrameBorder
})
CloseMainFrameButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.821, 0, 0, 0),
	Size = UDim2.new(0.179, 0, 0.25, 0),
	["Font"] = Enum.Font.Kalam,
	Text = "X",
	ZIndex = 2,
	TextColor3 = Color3.new(1, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
NameTextLabel = GuiLibrary.TextLabel({
	Name = RandomNameFunction(),
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(0.821, 0, 0.25, 0),
	["Font"] = Enum.Font.Kalam,
	Text = "Christmas autofarm",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
AntiAfkButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BorderColor3 = Color3.new(0, 0, 0),
	BorderSizePixel = 2,
	Position = UDim2.new(0.518, 0, 0.6, 0),
	Size = UDim2.new(0.446, 0, 0.25, 0),
	["Font"] = Enum.Font.Kalam,
	Text = "Anti AFK",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
AntiAfkUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 8),
	Parent = AntiAfkButton
})
StartAutofarmButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BorderColor3 = Color3.new(0, 0, 0),
	BorderSizePixel = 2,
	Position = UDim2.new(0.029, 0, 0.25, 0),
	Size = UDim2.new(0.446, 0, 0.25, 0),
	["Font"] = Enum.Font.Kalam,
	Text = "START",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
StartAutofarmUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 8),
	Parent = StartAutofarmButton
})
RAFBButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BorderColor3 = Color3.new(0, 0, 0),
	BorderSizePixel = 2,
	Position = UDim2.new(0.518, 0, 0.25, 0),
	Size = UDim2.new(0.446, 0, 0.25, 0),
	["Font"] = Enum.Font.Kalam,
	Text = "Reset after full bag",
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	ZIndex = 2,
	Parent = MainFrame
})
RAFBUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 8),
	Parent = RAFBButton
})
ImproveFPSButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(1, 1, 1),
	BorderColor3 = Color3.new(0, 0, 0),
	BorderSizePixel = 2,
	Position = UDim2.new(0.029, 0, 0.6, 0),
	Size = UDim2.new(0.446, 0, 0.25, 0),
	["Font"] = Enum.Font.Kalam,
	Text = "Improve FPS",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
ImproveFPSUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 8),
	Parent = ImproveFPSButton
})
OpenAutofarmGui = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	AnchorPoint = Vector2.new(.5, .5),
	BackgroundColor3 = Color3.new(0, 1, 1),
	BorderColor3 = Color3.new(0, 0, 0),
	BorderSizePixel = 2,
	BorderMode = Enum.BorderMode.Inset,
	Position = UDim2.new(0.5, 0, 0.028, 0),
	Size = UDim2.new(0.104, 0, 0.052, 0),
	["Font"] = Enum.Font.Kalam,
	Text = "Open autofarm gui",
	ZIndex = 4,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Visible = false,
	Parent = MainGui
})
OpenAutofarmGuiUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 8),
	Parent = OpenAutofarmGui
})

AntiAfkState = false
function AntiAFK()
	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(Player.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		local VirtualUser = cloneref(game:GetService("VirtualUser"))
		Players.LocalPlayer.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
end

function AntiAFKButton()
	if not AntiAfkState then
		AntiAfkState = true
		AntiAfkButton.TextColor3 = Color3.new(0, 1, 0)
		AntiAFK()
	else
		AntiAfkState = false
		AntiAfkButton.TextColor3 = Color3.new(0, 0, 0)
	end
end

AutofarmStarted = false
function StartAutofarmButtonC()
	if not AutofarmStarted then
		AutofarmStarted = true
		AutofarmIN = true
		StartAutofarmButton.TextColor3 = Color3.new(0, 1, 0)
	else
		AutofarmStarted = false
		StartAutofarmButton.TextColor3 = Color3.new(0, 0, 0)
		autofarmstopevent:Fire()
	end
end

ImproveFPSenabled = false
function ImproveFPSButtonC()
	if not ImproveFPSenabled then
		ImproveFPSenabled = true
		for _, player in pairs(Players:GetChildren()) do
			if player.Character then
				for _, part in pairs(player.Character:GetChildren()) do
					if part:IsA("Accessory") then
						part:Destroy()
					end
					if part.Name == "Radio" then
						part:Destroy()
					end
				end
			end
		end
		ImproveFPSButton.TextColor3 = Color3.new(0, 1, 0)
	else
		ImproveFPSenabled = false
		ImproveFPSButton.TextColor3 = Color3.new(0, 0, 0)
	end
end

function CloseGuiCheck()
	if MainFrame.Visible == true then
		OpenAutofarmGui.Visible = true
		MainFrame.Visible = false
		MainFrameBorder.Visible = false
	else
		MainFrame.Visible = true
		MainFrameBorder.Visible = true
		OpenAutofarmGui.Visible = false
	end
end

ResetWhenFullBag = false
function RWFBButtonC()
	if not ResetWhenFullBag then
		ResetWhenFullBag = true
		RAFBButton.TextColor3 = Color3.new(0, 1, 0)
	else
		ResetWhenFullBag = false
		RAFBButton.TextColor3 = Color3.new(0, 0, 0)
	end
end

AutofarmIN = false

function returncoincontaier()
	for _, v in workspace:GetChildren() do
		if v:FindFirstChild("CoinContainer") and v:IsA("Model") then
			return v:FindFirstChild("CoinContainer")
		end
	end
	return false
end

CurrentCoinType = "SnowToken"
CoinCollectedEvent.OnClientEvent:Connect(function(cointype, current, max)
	AutofarmIN = true
	if cointype == CurrentCoinType and tonumber(current) == tonumber(max) then
		AutofarmIN = false
		if ResetWhenFullBag then
			Player.Character.Humanoid.Health = 0
		end
	end
end)

function PcallTP(Position)
	if Player.Character then
		if Player.Character:FindFirstChild("HumanoidRootPart") then
			Player.Character.HumanoidRootPart.CFrame = Position
		end
	end
end

function FindNearestCoin(container)
	local coin = nil
	local magn = math.huge
	for _, v in pairs(container:GetChildren()) do
		if v:GetAttribute("CoinID") == CurrentCoinType and v:FindFirstChild("TouchInterest") then
			if Player.Character then
				if Player.Character:FindFirstChild("HumanoidRootPart") then
					if math.abs((Player.Character.HumanoidRootPart.Position - v.Position).Magnitude) < magn then
						coin = v
						magn = math.abs((Player.Character.HumanoidRootPart.Position - v.Position).Magnitude)
					end
				end
			end
		end
	end
	local gg = {coin, magn}
	return gg
end

spawn(function()
	while true do
		if AutofarmStarted and AutofarmIN and Player.Character and returncoincontaier() then
			if FindNearestCoin(returncoincontaier())[1] ~= nil then
				local dds = FindNearestCoin(returncoincontaier())
				if dds[2] > 150 then PcallTP(dds[1].CFrame); continue end
				local strg = TweenService:Create(Player.Character.HumanoidRootPart, TweenInfo.new(dds[2] / 20, Enum.EasingStyle.Linear), {CFrame = CFrame.new(dds[1].Position)})
				strg:Play()
				autofarmstopevent.Event:Connect(function()
					strg:Cancel()
				end)
				while dds[1]:FindFirstChild("TouchInterest") do
					wait()
				end
				strg:Cancel()
				wait(0.0001)
			end
		else
			wait(0.3)
		end
		wait(0.0001)
	end
end)

RoundStartEvent.OnClientEvent:Connect(function()
	AutofarmIN = true
end)

RoundEndEvent.OnClientEvent:Connect(function()
	AutofarmIN = false
end)

for _, player1 in pairs(Players:GetChildren()) do
	player1.CharacterAdded:Connect(function(char)
		task.wait(0.5)
		if ImproveFPSenabled then
			for _, part in pairs(char:GetChildren()) do
				if part:IsA("Accessory") then
					part:Destroy()
				end
				if part.Name == "Radio" then
					part:Destroy()
				end
			end
		end
	end)
end

Players.PlayerAdded:Connect(function(player1)
	player1.CharacterAdded:Connect(function(char)
		task.wait(0.5)
		if ImproveFPSenabled then
			for _, part in pairs(char:GetChildren()) do
				if part:IsA("Accessory") then
					part:Destroy()
				end
				if part.Name == "Radio" then
					part:Destroy()
				end
			end
		end
	end)
end)

--Buttons connections
AntiAfkButton.MouseButton1Click:Connect(AntiAFKButton)
ImproveFPSButton.MouseButton1Click:Connect(ImproveFPSButtonC)
StartAutofarmButton.MouseButton1Click:Connect(StartAutofarmButtonC)
CloseMainFrameButton.MouseButton1Click:Connect(CloseGuiCheck)
RAFBButton.MouseButton1Click:Connect(RWFBButtonC)
OpenAutofarmGui.MouseButton1Click:Connect(CloseGuiCheck)

--Configs
for Configname, Configvalue in pairs(SettingsAutofarm) do
	if Configname == "AntiAfk" and Configvalue == true then
		AntiAFKButton()
	elseif Configname == "StartAutofarm" and Configvalue == true then
		StartAutofarmButtonC()
	elseif Configname == "ImproveFPS" and Configvalue == true then
		ImproveFPSButtonC()
	elseif Configname == "ResetWhenFullBag" and Configvalue == true then
		RWFBButtonC()
	end
end
