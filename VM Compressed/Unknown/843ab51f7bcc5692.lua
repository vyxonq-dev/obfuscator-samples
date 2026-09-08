--Christmas update!!!
_G.AutofarmSettings = {
	AntiAfk = true,
	ResetWhenFullBag = true
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/NoCapital2/MM2Autofarm/refs/heads/main/ChristmasAutofarm"))()
return

if not game:IsLoaded() then
	game.Loaded:Wait()
end
SettingsAutofarm = {}
if _G.AutofarmSettings then
	SettingsAutofarm = _G.AutofarmSettings
else
	_G.AutofarmSettings = {}
	SettingsAutofarm = {AntiAfk = true, DelayFarm = 3}
end
if _G.AutoFarmMM2IsLoaded then return end
_G.AutoFarmMM2IsLoaded = true
Player = game.Players.LocalPlayer
Players = game.Players
CoreGui = game.CoreGui
GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/elfandtears/GuiLibrary/main/source.lua"))()
RunService = game:GetService("RunService")
CoinCollectedEvent = game.ReplicatedStorage.Remotes.Gameplay.CoinCollected
RoundStartEvent = game.ReplicatedStorage.Remotes.Gameplay.RoundStart
RoundEndEvent = game.ReplicatedStorage.Remotes.Gameplay.RoundEndFade
RandomNameFunction = GuiLibrary.RandomName
MainGui = GuiLibrary.ScreenGUI({
	Name = RandomNameFunction(),
	ResetOnSpawn = false,
	Parent = CoreGui
})
MainFrame = GuiLibrary.Frame({
	Name = RandomNameFunction(),
	AnchorPoint = Vector2.new(.5, .5),
	BackgroundColor3 = Color3.new(1, 0.6, 0.2),
	Position = UDim2.new(.5, 0, .5, 0),
	Size = UDim2.new(0.131, 0, 0.413, 0),
	ZIndex = 2,
	Parent = MainGui,
	Draggable_ = true
})
MainFrameBorder = GuiLibrary.Frame({
	Name = RandomNameFunction(),
	AnchorPoint = Vector2.new(.5, .5),
	BackgroundColor3 = Color3.new(0, 0, 0),
	Position = UDim2.new(.5, 0, .5, 0),
	Size = UDim2.new(0.138, 0, 0.434, 0),
	ZIndex = 1,
	Parent = MainGui,
	attach = MainFrame
})
MainFrameUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 12),
	Parent = MainFrame
})
MainFrameBorderUiCorner = GuiLibrary.UICorner({
	Name = RandomNameFunction(),
	CornerRadius = UDim.new(0, 12),
	Parent = MainFrameBorder
})
CloseMainFrameButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.8, 0, 0, 0),
	Size = UDim2.new(0.2, 0, 0.125, 0),
	["Font"] = Enum.Font.FredokaOne,
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
	Size = UDim2.new(0.8, 0, 0.125, 0),
	["Font"] = Enum.Font.FredokaOne,
	Text = "Autofarm",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
AntiAfkButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(0.9, 1, 0),
	BorderColor3 = Color3.new(1, 1, 1),
	BorderSizePixel = 2,
	Position = UDim2.new(0.1, 0, 0.125, 0),
	Size = UDim2.new(0.8, 0, 0.125, 0),
	["Font"] = Enum.Font.FredokaOne,
	Text = "Anti afk",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
StartAutofarmButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(0.9, 1, 0),
	BorderColor3 = Color3.new(1, 1, 1),
	BorderSizePixel = 2,
	Position = UDim2.new(0.1, 0, 0.282, 0),
	Size = UDim2.new(0.8, 0, 0.125, 0),
	["Font"] = Enum.Font.FredokaOne,
	Text = "Start",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
Disable3DRenderingButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(0.9, 1, 0),
	BorderColor3 = Color3.new(1, 1, 1),
	BorderSizePixel = 2,
	Position = UDim2.new(0.1, 0, 0.438, 0),
	Size = UDim2.new(0.8, 0, 0.125, 0),
	["Font"] = Enum.Font.FredokaOne,
	Text = "Disable 3D rendering",
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	ZIndex = 2,
	Parent = MainFrame
})
ImproveFPSButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(0.9, 1, 0),
	BorderColor3 = Color3.new(1, 1, 1),
	BorderSizePixel = 2,
	Position = UDim2.new(0.1, 0, 0.595, 0),
	Size = UDim2.new(0.8, 0, 0.125, 0),
	["Font"] = Enum.Font.FredokaOne,
	Text = "Improve FPS",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
CoinTypeButton = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	BackgroundColor3 = Color3.new(0.9, 1, 0),
	BorderColor3 = Color3.new(1, 1, 1),
	BorderSizePixel = 2,
	Position = UDim2.new(0.1, 0, 0.757, 0),
	Size = UDim2.new(0.8, 0, 0.125, 0),
	["Font"] = Enum.Font.FredokaOne,
	Text = "Farm coin type: Candy",
	ZIndex = 2,
	TextColor3 = Color3.new(0, 0, 0),
	TextScaled = true,
	Parent = MainFrame
})
OpenAutofarmGui = GuiLibrary.TextButton({
	Name = RandomNameFunction(),
	AnchorPoint = Vector2.new(.5, .5),
	BackgroundColor3 = Color3.new(1, 0.333333, 0.498039),
	BorderColor3 = Color3.new(0, 0, 0),
	BorderSizePixel = 2,
	BorderMode = Enum.BorderMode.Inset,
	Position = UDim2.new(0.5, 0, 0.028, 0),
	Size = UDim2.new(0.104, 0, 0.052, 0),
	["Font"] = Enum.Font.FredokaOne,
	Text = "Open autofarm gui",
	ZIndex = 4,
	TextColor3 = Color3.new(1, 1, 1),
	TextScaled = true,
	Visible = false,
	Parent = MainGui
})

--from infinity yield lol
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

--yeah yeah this button do nothing, you cant turn off anti afk
function AntiAFKButton()
	if not AntiAfkState then
		AntiAfkState = true
		AntiAfkButton.TextColor3 = Color3.new(0, 1, 0)
		AntiAFK()
	else
		AntiAfkState = false
		AntiAfkButton.TextColor3 = Color3.new(1, 1, 1)
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
		StartAutofarmButton.TextColor3 = Color3.new(1, 1, 1)
	end
end

--Disable your 3D rendering for improve your fps
D3RenderingDisabled = false
function Disabl3dRender()
	if not D3RenderingDisabled then
		D3RenderingDisabled = true
		RunService:Set3dRenderingEnabled(false)
		Disable3DRenderingButton.TextColor3 = Color3.new(0, 1, 0)
	else
		D3RenderingDisabled = false
		RunService:Set3dRenderingEnabled(true)
		Disable3DRenderingButton.TextColor3 = Color3.new(1, 1, 1)
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
		ImproveFPSButton.TextColor3 = Color3.new(1, 1, 1)
	end
end

CoinTypes = {"Candy", "Coin"}
CurrentCoinType = "Candy"
PositionOfCoinType = 1
function ChangeBeachballType(cointype)
	if cointype then
		if table.find(CoinTypes, cointype) then
			CurrentCoinType = cointype
			PositionOfCoinType = table.find(CoinTypes, cointype)
			CoinTypeButton.Text = "Farm coin type: "..cointype
			return
		end
		return
	end
	if PositionOfCoinType ~= table.maxn(CoinTypes) then
		PositionOfCoinType += 1
		CoinTypeButton.Text = "Farm coin type: "..CoinTypes[PositionOfCoinType]
		CurrentCoinType = CoinTypes[PositionOfCoinType]
	else
		PositionOfCoinType = 1
		CoinTypeButton.Text = "Farm coin type: "..CoinTypes[PositionOfCoinType]
		CurrentCoinType = CoinTypes[PositionOfCoinType]
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

AutofarmDelay = 3
ResetWhenFullBag = false
AutofarmIN = false
bringpose = CFrame.new(math.random(-5, 5), -100, math.random(-5, 5)) --nvm
safepart = Instance.new("Part")
safepart.Anchored = true
safepart.Massless = true
safepart.Transparency = 1
safepart.Size = Vector3.new(2048, 0.5, 2048)
safepart.CFrame = bringpose * CFrame.new(0, -0.9, 0)
safepart.Parent = workspace

function returncoincontaier()
	for _, v in workspace:GetChildren() do
		if v:FindFirstChild("CoinContainer") and v:IsA("Model") then
			return v:FindFirstChild("CoinContainer")
		end
	end
	return false
end

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

--yes yes autofarm using loops, but its still nice
spawn(function()
	while true do
		if AutofarmStarted and AutofarmIN and Player.Character and returncoincontaier() then
			PcallTP(bringpose)
			for _, v in pairs(returncoincontaier():GetChildren()) do
				if v:GetAttribute("CoinID") == CurrentCoinType and v:FindFirstChild("TouchInterest") then
					for i = 1,7 do
						PcallTP(v.CFrame)
						task.wait(0.03)
					end
					break
				end
			end
			PcallTP(bringpose)
		end
		task.wait(AutofarmDelay)
	end
end)

RoundStartEvent.OnClientEvent:Connect(function()
	if AutofarmStarted then Player.Character.HumanoidRootPart.CFrame = bringpose end
	AutofarmIN = true
end)

RoundEndEvent.OnClientEvent:Connect(function()
	AutofarmIN = false
end)

--Improve fps connections:
for _, player1 in pairs(Players:GetChildren()) do
	player1.CharacterAdded:Connect(function(char)
		task.wait(0.5) --just because
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
		task.wait(0.5) --just because
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
Disable3DRenderingButton.MouseButton1Click:Connect(Disabl3dRender)
CoinTypeButton.MouseButton1Click:Connect(ChangeBeachballType)
CloseMainFrameButton.MouseButton1Click:Connect(CloseGuiCheck)
OpenAutofarmGui.MouseButton1Click:Connect(CloseGuiCheck)

--Configs
for Configname, Configvalue in pairs(SettingsAutofarm) do
	if Configname == "AntiAfk" and Configvalue == true then
		AntiAFKButton()
	elseif Configname == "DelayFarm" and tonumber(Configvalue) and tonumber(Configvalue) < 8 then
		AutofarmDelay = tonumber(Configvalue)
	elseif Configname == "StartAutofarm" and Configvalue == true then
		StartAutofarmButtonC()
	elseif Configname == "ImproveFPS" and Configvalue == true then
		ImproveFPSButtonC()
	elseif Configname == "Disable3DRendering" and Configvalue == true then
		Disabl3dRender()
	elseif Configname == "CoinType" and Configvalue then
		if Configvalue == "Beachball" then Configvalue = "Candy" end
		ChangeBeachballType(Configvalue)
	elseif Configname == "ResetWhenFullBag" and Configvalue == true then
		ResetWhenFullBag = true
	end
end
