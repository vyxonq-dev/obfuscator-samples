-- ================================
--         EDIT THIS SECTION
-- ================================
if getgenv().XFent_Is_In_LoadMain then
	warn("[XFENT DEBUG] Infinite loop completely blocked! Your Junkie Dashboard is still serving the Key UI Loader instead of your Main Script.")
	return
end

local Config = {
	Service        = "XFent",
	Identifier     = "1056672",
	Provider       = "XFent",
	MaxKeyAttempts = 5,
	KeyFile        = "XFentNewHub.txt",
	Discord        = "WAJWzXt2MH",
	Website        = "https://xfentlol.mysellauth.com",
	KeyUrl         = "https://jnkie.com/get-key/xfentlol",
	GameSupport = {
	Universal = {
		Name    = "",
		Free    = "",
		Premium = "",
	},
	},
}

local Colors = {
	Overlay = Color3.fromRGB(2, 2, 3),
	Panel   = Color3.fromRGB(12, 12, 14),
	Panel2  = Color3.fromRGB(18, 18, 21),
	Input   = Color3.fromRGB(8, 8, 10),
	Line    = Color3.fromRGB(38, 38, 44),
	Red     = Color3.fromRGB(255, 28, 36),
	Text    = Color3.fromRGB(245, 245, 245),
	Muted   = Color3.fromRGB(145, 145, 152),
	Dim     = Color3.fromRGB(82, 82, 90),
	Green   = Color3.fromRGB(95, 220, 125),
	Yellow  = Color3.fromRGB(235, 195, 85),
}

local Customization = {
	-- [[ INTRO & PANEL TEXTS ]] --
	IntroLetter1 = "X",
	IntroLetter2 = "F",
	
	PanelTitle1  = "X",
	PanelTitle2  = "Fent",
	PanelSub     = "key system",
	
	-- [[ THEME COLORS ]] --
	ThemeColor   = Colors.Red,
	
	-- [[ BACKGROUND ]] --
	RainLetter   = "X",
	RainColor1   = Colors.Red,
	RainColor2   = Colors.Text,
	
	-- [[ MAIN STATUS & INPUT TEXTS ]] --
	StatusReady     = "ready",
	StatusWait      = "paste key to continue",
	PlaceholderText = "Insert key here.",
	
	-- [[ BUTTON TEXTS ]] --
	RedeemButton = "redeem",
	GetKeyButton = "key link",
	
	-- [[ NOTIFICATIONS ]] --
	NotifSystem  = "System",
	NotifSuccess = "Success",
	NotifError   = "Denied",
	
	MsgKeyFound  = "Key detected, loading...",
	MsgKeyValid  = "Key is valid! Have fun.",
	MsgNoKey     = "No key detected.",
	
	ColorSuccess = Colors.Green,
	ColorError   = Colors.Red,
	ColorSystem  = Colors.Yellow,
	ColorDim     = Colors.Dim,
	
	-- [[ COPY BUTTONS ]] --
	CopyKeyLink  = Config.KeyUrl,
	CopyDiscord  = "discord.gg/" .. Config.Discord,
	CopyWebsite  = Config.Website,
	
	MsgCopiedDiscord = "discord copied",
	MsgCopiedWebsite = "website copied",
	MsgCopiedKeyLink = "key link copied",
}

-- Intro timing (seconds)
local SLIDE_IN_TIME  = 0.60  -- X and F fly to center
local HOLD_TIME      = 0.30  -- pause at center before blowup
local BLOWUP_TIME    = 0.55  -- scale up + fade out
local PANEL_DELAY    = 0.10  -- gap before panel appears
local PANEL_TIME     = 0.40  -- panel slide-in
-- ================================
--       DO NOT EDIT BELOW
-- ================================

local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Lighting         = game:GetService("Lighting")
local LocalPlayer      = Players.LocalPlayer
local PlayerGui        = LocalPlayer:WaitForChild("PlayerGui")

local function cleanupKeyUI()
	for _, c in ipairs(PlayerGui:GetChildren()) do
		if c.Name == "XFentKeySystem" or c.Name == "XFentJunkieClean" or c.Name == "XFentJunkieOverlay" or c.Name == "XFentCustomTerminal" or c.Name == "XFentTestKeyUI" then
			pcall(c.Destroy, c)
		end
	end
	local b = Lighting:FindFirstChild("XFentKeyBlur")
	if b then pcall(b.Destroy, b) end
end

local function Notify(title, text, duration, color)
	duration = duration or 3
	color = color or Colors.Red

	local NotifGui = PlayerGui:FindFirstChild("XFentNotificationsGui")
	if not NotifGui then
		NotifGui = Instance.new("ScreenGui")
		NotifGui.Name = "XFentNotificationsGui"
		NotifGui.ResetOnSpawn = false
		NotifGui.DisplayOrder = 1000
		NotifGui.Parent = PlayerGui

		local NotifContainer = Instance.new("Frame")
		NotifContainer.Name = "Container"
		NotifContainer.Size = UDim2.new(0, 300, 1, -20)
		NotifContainer.Position = UDim2.new(1, -320, 0, 0)
		NotifContainer.BackgroundTransparency = 1
		NotifContainer.Parent = NotifGui

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		UIListLayout.Padding = UDim.new(0, 10)
		UIListLayout.Parent = NotifContainer
	end

	local container = NotifGui.Container

	local wrapper = Instance.new("Frame")
	wrapper.Size = UDim2.new(1, 0, 0, 60)
	wrapper.BackgroundTransparency = 1
	wrapper.Parent = container

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.Position = UDim2.new(1.2, 0, 0, 0) -- Start off-screen to the right
	frame.BackgroundTransparency = 1
	frame.BackgroundColor3 = Colors.Panel
	frame.BorderSizePixel = 0
	frame.Parent = wrapper
	

	
	local border = Instance.new("UIStroke")
	border.Color = Color3.new(1, 1, 1)
	border.Thickness = 1.5
	border.Transparency = 1
	border.Parent = frame

	local bgGrad = Instance.new("UIGradient")
	bgGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, color), 
		ColorSequenceKeypoint.new(0.5, Colors.Panel), 
		ColorSequenceKeypoint.new(1, color)
	})
	bgGrad.Rotation = 0
	bgGrad.Parent = border

	local rsConnection
	rsConnection = game:GetService("RunService").RenderStepped:Connect(function(dt)
		if bgGrad.Parent then
			bgGrad.Rotation = (bgGrad.Rotation + dt * 45) % 360
		else
			if rsConnection then rsConnection:Disconnect() end
		end
	end)

	local titleLbl = Instance.new("TextLabel")
	titleLbl.BackgroundTransparency = 1
	titleLbl.Position = UDim2.new(0, 14, 0, 10)
	titleLbl.Size = UDim2.new(1, -28, 0, 20)
	titleLbl.Text = title
	titleLbl.TextColor3 = color
	titleLbl.TextSize = 15
	titleLbl.Font = Enum.Font.GothamBold
	titleLbl.TextXAlignment = Enum.TextXAlignment.Left
	titleLbl.TextTransparency = 1
	titleLbl.Parent = frame

	local textLbl = Instance.new("TextLabel")
	textLbl.BackgroundTransparency = 1
	textLbl.Position = UDim2.new(0, 14, 0, 30)
	textLbl.Size = UDim2.new(1, -28, 0, 20)
	textLbl.Text = text
	textLbl.TextColor3 = Colors.Text
	textLbl.TextSize = 13
	textLbl.Font = Enum.Font.GothamMedium
	textLbl.TextXAlignment = Enum.TextXAlignment.Left
	textLbl.TextTransparency = 1
	textLbl.Parent = frame

	-- Animate In (increased to 0.55s so the slide is very visible)
	TweenService:Create(frame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0}):Play()
	TweenService:Create(border, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Transparency = 0}):Play()
	TweenService:Create(titleLbl, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	TweenService:Create(textLbl, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

	task.spawn(function()
		task.wait(duration)
		TweenService:Create(frame, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1.2, 0, 0, 0), BackgroundTransparency = 1}):Play()
		TweenService:Create(border, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Transparency = 1}):Play()
		TweenService:Create(titleLbl, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
		TweenService:Create(textLbl, TweenInfo.new(0.55, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
		task.wait(0.55)
		wrapper:Destroy()
	end)
end

local function hasFS()
	return pcall(function() return type(writefile) == "function" end)
		and pcall(function() return type(readfile) == "function" end)
		and pcall(function() return type(isfile) == "function" end)
end
local fsOk = hasFS()

local function saveKey(k)  if not fsOk then return end pcall(function() writefile(Config.KeyFile, k) end) end
local function loadKey()
	if not fsOk then return nil end
	local ok, v = pcall(function() return readfile(Config.KeyFile) end)
	if ok and v and v ~= "" then
		return v:gsub("%s+", "") -- Remove any hidden spaces or newlines
	end
	return nil
end

local function getScript()
	local fallback = Config.GameSupport.Universal and Config.GameSupport.Universal.Free or ""
	
	for key, data in pairs(Config.GameSupport) do
		if key == game.PlaceId or key == game.GameId then
			return (data.Free and data.Free ~= "") and data.Free or fallback
		end
		if type(data) == "table" and type(data.Places) == "table" then
			if table.find(data.Places, game.PlaceId) or table.find(data.Places, game.GameId) then
				return (data.Free and data.Free ~= "") and data.Free or fallback
			end
		end
	end
	
	return fallback
end

local function loadMain() 
	local s = getScript() 
	if s == "" then return end

	task.spawn(function()
		task.wait(0.5)
		
		local ok, err = pcall(function()
			local url = s:match("https?://[%w%-_%.%?%.:/%+=&]+")
			if url and s:match("loadstring") then
				local code = game:HttpGet(url)
				local func, compileErr = loadstring(code)
				if not func then return error("Compile Error from URL: " .. tostring(compileErr)) end
				
				getgenv().XFent_Is_In_LoadMain = true
				local result = func()
				getgenv().XFent_Is_In_LoadMain = false
				return result
			else
				local func, compileErr = loadstring(s)
				if not func then return error("Compile Error: " .. tostring(compileErr)) end
				
				getgenv().XFent_Is_In_LoadMain = true
				local result = func()
				getgenv().XFent_Is_In_LoadMain = false
				return result
			end
		end)
	end)
end

local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service    = Config.Service
Junkie.identifier = Config.Identifier
Junkie.provider   = Config.Provider

local function validateKey(key)
	if not key or key == "" then return false, "enter a key" end
	local ok, res = pcall(function() return Junkie.check_key(key) end)
	if not ok then return false, "validation error" end
	
	if res and res.valid then
		getgenv().SCRIPT_KEY = res.message == "KEYLESS" and "KEYLESS" or key
		
		-- Set Junkie Runtime Globals as per documentation
		getgenv().JD_IS_PREMIUM = res.is_premium or false
		getgenv().JD_EXPIRES_AT = res.expires_at or 0
		getgenv().JD_DISCORD_ID = res.discord_id or ""
		getgenv().JD_DISCORD_USERNAME = res.discord_username or ""
		getgenv().JD_CREATED_AT = res.created_at or 0
		getgenv().JD_REASON = res.reason or ""
		
		if res.message ~= "KEYLESS" then saveKey(key) end
		getgenv().LOAD = true
		return true, "access granted"
	end
	
	local errStr = res and tostring(res.error or res.message or "invalid key") or "invalid key"
	if errStr == "HWID_MISMATCH" then errStr = "Max HWID reached or mismatch" end
	if errStr == "KEY_EXPIRED" then errStr = "Expired key" end
	if errStr == "KEY_INVALID" then errStr = "Invalid key" end
	if errStr == "ALREADY_USED" then errStr = "Key already used" end
	
	return false, errStr
end

local savedKeyStatus  = "no saved key found"
local savedKeyExpired = false

local skipUI = false
local savedKey = loadKey()
if savedKey then
	Notify(Customization.NotifSystem, Customization.MsgKeyFound, 2.5, Customization.ColorSystem)
	local valid, msg = validateKey(savedKey)
	if valid then 
		Notify(Customization.NotifSuccess, Customization.MsgKeyValid, 3, Customization.ColorSuccess)
		cleanupKeyUI() 
		skipUI = true
	else
		Notify(Customization.NotifError, msg or "Expired key", 4, Customization.ColorError)
		savedKeyStatus  = "expired key"
		savedKeyExpired = true
	end
else
	Notify(Customization.NotifSystem, Customization.MsgNoKey, 2.5, Customization.ColorDim)
end

-- helpers
local function corner(p, r) end
local function lbl(p, t, pos, sz, col, ts, f)
	local l = Instance.new("TextLabel") l.BackgroundTransparency = 1 l.Position = pos l.Size = sz l.Text = t
	l.TextColor3 = col or Colors.Text l.TextSize = ts or 14 l.Font = f or Enum.Font.GothamMedium
	l.TextXAlignment = Enum.TextXAlignment.Left l.TextYAlignment = Enum.TextYAlignment.Center
	l.TextTruncate = Enum.TextTruncate.AtEnd l.Parent = p return l
end
local function btn(p, t, pos, sz, bg, fg)
	local b = Instance.new("TextButton") b.Position = pos b.Size = sz b.BackgroundColor3 = bg or Colors.Panel2
	b.BorderSizePixel = 0 b.AutoButtonColor = false b.Text = t b.TextColor3 = fg or Colors.Text
	b.TextSize = 13 b.Font = Enum.Font.GothamMedium b.Parent = p corner(b, 6)
	b:SetAttribute("BaseR", b.BackgroundColor3.R) b:SetAttribute("BaseG", b.BackgroundColor3.G) b:SetAttribute("BaseB", b.BackgroundColor3.B)
	b.MouseEnter:Connect(function() if b:GetAttribute("Active") then return end TweenService:Create(b, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(28, 28, 32)}):Play() end)
	b.MouseLeave:Connect(function() if b:GetAttribute("Active") then return end TweenService:Create(b, TweenInfo.new(0.16), {BackgroundColor3 = Color3.new(b:GetAttribute("BaseR"), b:GetAttribute("BaseG"), b:GetAttribute("BaseB"))}):Play() end)
	return b
end

if not skipUI then
	cleanupKeyUI()
	local keyConnections = {}
	local keyUiAlive = true
	local gui
	local blur
	local function trackConnection(conn)
		if conn then
			keyConnections[#keyConnections + 1] = conn
		end
		return conn
	end
	local function destroyKeyGui()
		keyUiAlive = false
		for _, conn in ipairs(keyConnections) do
			pcall(function()
				if conn and conn.Disconnect then
					conn:Disconnect()
				end
			end)
		end
		table.clear(keyConnections)
		if blur then
			pcall(function() blur:Destroy() end)
			blur = nil
		end
		if gui then
			pcall(function() gui:Destroy() end)
		end
	end

	-- GUI root
	gui = Instance.new("ScreenGui")
	gui.Name = "XFentKeySystem" gui.ResetOnSpawn = false gui.IgnoreGuiInset = true
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling gui.DisplayOrder = 999 gui.Parent = PlayerGui

	local overlay = Instance.new("Frame")
	overlay.Size = UDim2.fromScale(1, 1) overlay.BackgroundColor3 = Colors.Overlay
	overlay.BackgroundTransparency = 1 overlay.BorderSizePixel = 0 overlay.Parent = gui

	blur = Instance.new("BlurEffect")
	blur.Name = "XFentKeyBlur" blur.Size = 0 blur.Parent = Lighting
	TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()

	-- ========== INTRO ==========
	local LETTER_START = 72
	local LETTER_MID   = 96
	local LETTER_BIG   = 260

	local introX = Instance.new("TextLabel")
	introX.BackgroundTransparency = 1
	introX.AnchorPoint = Vector2.new(0.5, 0.5)
	introX.Size = UDim2.fromOffset(LETTER_START, LETTER_START)
	introX.Position = UDim2.new(0, -60, 0, -60)
	introX.Text = Customization.IntroLetter1
	introX.TextColor3 = Colors.Text
	introX.TextTransparency = 0
	introX.TextSize = LETTER_START
	introX.TextScaled = true
	introX.Font = Enum.Font.GothamBlack
	introX.ZIndex = 10
	introX.Parent = overlay

	local introF = Instance.new("TextLabel")
	introF.BackgroundTransparency = 1
	introF.AnchorPoint = Vector2.new(0.5, 0.5)
	introF.Size = UDim2.fromOffset(LETTER_START, LETTER_START)
	introF.Position = UDim2.new(1, 60, 1, 60)
	introF.Text = Customization.IntroLetter2
	introF.TextColor3 = Customization.ThemeColor
	introF.TextTransparency = 0
	introF.TextSize = LETTER_START
	introF.TextScaled = true
	introF.Font = Enum.Font.GothamBlack
	introF.ZIndex = 10
	introF.Parent = overlay

	local easeIn  = Enum.EasingStyle.Exponential
	local easeOut = Enum.EasingStyle.Exponential

	local function emitParticles(pos)
		for i = 1, 16 do
			local p = Instance.new("Frame")
			p.Size = UDim2.fromOffset(8, 8)
			p.BackgroundColor3 = (i % 2 == 0) and Customization.ThemeColor or Colors.Text
			p.Position = pos
			p.AnchorPoint = Vector2.new(0.5, 0.5)
			p.BorderSizePixel = 0
			corner(p, 4)
			p.Parent = overlay
			local angle = math.rad(math.random(0, 360))
			local dist = math.random(50, 120)
			local endPos = UDim2.new(pos.X.Scale, pos.X.Offset + math.cos(angle)*dist, pos.Y.Scale, pos.Y.Offset + math.sin(angle)*dist)
			TweenService:Create(p, TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				Position = endPos,
				BackgroundTransparency = 1,
				Size = UDim2.fromOffset(0, 0),
				Rotation = math.random(-180, 180)
			}):Play()
			task.delay(0.5, function() if p then p:Destroy() end end)
		end
	end

	local function runIntro(onDone)
		local tSlide = TweenInfo.new(SLIDE_IN_TIME, easeOut, Enum.EasingDirection.Out)
		TweenService:Create(introX, tSlide, {
			Position = UDim2.new(0.5, -LETTER_MID//2 - 18, 0.5, -LETTER_MID//2),
			Size     = UDim2.fromOffset(LETTER_MID, LETTER_MID),
			Rotation = 360,
		}):Play()
		TweenService:Create(introF, tSlide, {
			Position = UDim2.new(0.5, LETTER_MID//2 - 18, 0.5, -LETTER_MID//2 + 28),
			Size     = UDim2.fromOffset(LETTER_MID, LETTER_MID),
			Rotation = -360,
		}):Play()

		task.wait(SLIDE_IN_TIME + HOLD_TIME)
		emitParticles(UDim2.new(0.5, 0, 0.5, 0))

		local tBlow = TweenInfo.new(BLOWUP_TIME, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		TweenService:Create(introX, tBlow, {
			Position         = UDim2.new(0.5, -LETTER_BIG//2 - 6, 0.5, -LETTER_BIG//2),
			Size             = UDim2.fromOffset(LETTER_BIG, LETTER_BIG),
			TextTransparency = 1,
		}):Play()
		TweenService:Create(introF, tBlow, {
			Position         = UDim2.new(0.5, LETTER_BIG//2 - 18, 0.5, -LETTER_BIG//2 + 18),
			Size             = UDim2.fromOffset(LETTER_BIG, LETTER_BIG),
			TextTransparency = 1,
		}):Play()
		TweenService:Create(blur, TweenInfo.new(BLOWUP_TIME, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0}):Play()
		task.wait(BLOWUP_TIME)
		TweenService:Create(blur, TweenInfo.new(0.2), {Size = 0}):Play()
		introX:Destroy()
		introF:Destroy()
		task.wait(PANEL_DELAY)
		onDone()
	end

	-- ========== MAIN PANEL ==========
	local panel = Instance.new("Frame")
	panel.Size = UDim2.fromOffset(520, 300)
	panel.Position = UDim2.new(0.5, -260, 0.5, -120)
	panel.BackgroundColor3 = Colors.Panel
	panel.BackgroundTransparency = 1
	panel.BorderSizePixel = 0 panel.Active = true
	panel.Parent = overlay panel.Visible = false
	corner(panel, 8)

	local border = Instance.new("UIStroke") border.Color = Color3.new(1,1,1) border.Thickness = 1.5 border.Transparency = 0 border.Parent = panel
	local bgGrad = Instance.new("UIGradient") bgGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Customization.ThemeColor), ColorSequenceKeypoint.new(0.5, Colors.Panel), ColorSequenceKeypoint.new(1, Customization.ThemeColor)}) bgGrad.Rotation = 0 bgGrad.Parent = border

	local shadow = Instance.new("ImageLabel")
	shadow.Name = "Shadow"
	shadow.AnchorPoint = Vector2.new(0.5, 0.5)
	shadow.Position = UDim2.new(0.5, 0, 0.5, 2)
	shadow.Size = UDim2.new(1, 45, 1, 45)
	shadow.BackgroundTransparency = 1
	shadow.Image = "rbxassetid://6015897843"
	shadow.ImageColor3 = Color3.new(0,0,0)
	shadow.ImageTransparency = 0.5
	shadow.ZIndex = -1
	shadow.Parent = panel

	task.spawn(function()
		local rs = game:GetService("RunService")
		local t = 0
		trackConnection(rs.RenderStepped:Connect(function(dt)
			if not keyUiAlive or not gui.Parent then return end
			t = t + dt * 45
			bgGrad.Rotation = t % 360
		end))
	end)

	local top = Instance.new("Frame") top.Size = UDim2.new(1, 0, 0, 58) top.BackgroundColor3 = Colors.Panel top.BorderSizePixel = 0 top.Parent = panel
	lbl(top, Customization.PanelTitle1, UDim2.new(0, 18, 0, 3),  UDim2.new(0, 28,  0, 34), Colors.Text, 31, Enum.Font.GothamBlack)
	lbl(top, Customization.PanelTitle2, UDim2.new(0, 43, 0, 3),  UDim2.new(0, 105, 0, 34), Customization.ThemeColor,  31, Enum.Font.GothamBlack)
	lbl(top, Customization.PanelSub,    UDim2.new(0, 20, 0, 35), UDim2.new(0, 180, 0, 18), Colors.Muted, 12, Enum.Font.GothamMedium)

	local clock = lbl(top, "00:00:00", UDim2.new(1, -124, 0, 0), UDim2.new(0, 80, 1, 0), Colors.Muted, 12, Enum.Font.GothamMedium)
	clock.TextXAlignment = Enum.TextXAlignment.Right

	local closeBtn = Instance.new("TextButton") closeBtn.Size = UDim2.fromOffset(42, 58) closeBtn.Position = UDim2.new(1, -42, 0, 0)
	closeBtn.BackgroundTransparency = 1 closeBtn.BorderSizePixel = 0 closeBtn.AutoButtonColor = false
	closeBtn.Text = "x" closeBtn.TextColor3 = Colors.Muted closeBtn.TextSize = 16 closeBtn.Font = Enum.Font.GothamBold closeBtn.Parent = top
	closeBtn.MouseButton1Click:Connect(function() 
		destroyKeyGui()
		getgenv().XFent_KeySystem_Loaded = false
	end)

	local div = Instance.new("Frame") div.Size = UDim2.new(1, -36, 0, 1) div.Position = UDim2.new(0, 18, 0, 58) div.BackgroundColor3 = Colors.Line div.BorderSizePixel = 0 div.Parent = panel

	local avatar = Instance.new("ImageLabel") avatar.Size = UDim2.fromOffset(44, 44) avatar.Position = UDim2.new(0, 18, 0, 78)
	avatar.BackgroundColor3 = Colors.Panel2 avatar.BorderSizePixel = 0
	avatar.Image = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
	avatar.Parent = panel corner(avatar, 6)

	local hour = os.date("*t").hour
	local Greeting = hour >= 5 and hour < 12 and "good morning" or hour >= 12 and hour < 17 and "good afternoon" or "good evening"
	lbl(panel, Greeting, UDim2.new(0, 74, 0, 76), UDim2.new(0, 270, 0, 26), Colors.Text, 22, Enum.Font.GothamBlack)
	lbl(panel, string.lower(LocalPlayer.DisplayName), UDim2.new(0, 74, 0, 102), UDim2.new(0, 270, 0, 18), Colors.Muted, 14, Enum.Font.GothamMedium)

	local status = lbl(panel, Customization.StatusReady, UDim2.new(1, -162, 0, 80), UDim2.new(0, 142, 0, 20), Colors.Text, 14, Enum.Font.GothamBold)
	status.TextXAlignment = Enum.TextXAlignment.Right
	local statusSmall = lbl(panel, Customization.StatusWait, UDim2.new(1, -222, 0, 102), UDim2.new(0, 202, 0, 18), Colors.Muted, 11, Enum.Font.GothamMedium)
	statusSmall.TextXAlignment = Enum.TextXAlignment.Right

	local keyInput = Instance.new("TextBox")
	keyInput.Size = UDim2.new(1, -36, 0, 42) keyInput.Position = UDim2.new(0, 18, 0, 146)
	keyInput.BackgroundColor3 = Colors.Input keyInput.BorderSizePixel = 0
	keyInput.ClearTextOnFocus = false keyInput.PlaceholderText = "" keyInput.PlaceholderColor3 = Colors.Dim
	keyInput.Text = "" keyInput.TextColor3 = Colors.Text keyInput.TextSize = 14 keyInput.Font = Enum.Font.GothamMedium
	keyInput.TextXAlignment = Enum.TextXAlignment.Left keyInput.Parent = panel corner(keyInput, 6)

	keyInput.Focused:Connect(function() TweenService:Create(border, TweenInfo.new(0.3), {Thickness = 2.5}):Play() end)
	keyInput.FocusLost:Connect(function() TweenService:Create(border, TweenInfo.new(0.3), {Thickness = 1.5}):Play() end)

	local function shakeInput()
		local orig = keyInput.Position
		for _, o in ipairs({-8, 8, -6, 6, -3, 3, 0}) do
			TweenService:Create(keyInput, TweenInfo.new(0.035), {Position = UDim2.new(orig.X.Scale, orig.X.Offset + o, orig.Y.Scale, orig.Y.Offset)}):Play()
			task.wait(0.038)
		end
		keyInput.Position = orig
	end

	local redeem  = btn(panel, Customization.RedeemButton, UDim2.new(0, 18,  0, 204), UDim2.new(0, 154, 0, 38), Colors.Text,   Color3.fromRGB(10, 10, 12))
	local keyLink = btn(panel, Customization.GetKeyButton, UDim2.new(0, 186, 0, 204), UDim2.new(0, 100, 0, 38), Colors.Panel2, Colors.Text)
	local discBtn = btn(panel, "",         UDim2.new(0, 300, 0, 204), UDim2.new(0, 94,  0, 38), Colors.Panel2, Colors.Text)
	local webBtn  = btn(panel, "",         UDim2.new(0, 408, 0, 204), UDim2.new(0, 94,  0, 38), Colors.Panel2, Colors.Muted)

	local di = Instance.new("ImageLabel") di.Size = UDim2.fromOffset(18, 18) di.Position = UDim2.new(0.5, -9, 0.5, -9) di.BackgroundTransparency = 1 di.Image = "rbxassetid://18505728201" di.Parent = discBtn
	local wi = Instance.new("ImageLabel") wi.Size = UDim2.fromOffset(22, 22) wi.Position = UDim2.new(0.5, -11, 0.5, -11) wi.BackgroundTransparency = 1 wi.Image = "rbxassetid://15366746378" wi.Parent = webBtn

	local log = lbl(panel, "log: " .. savedKeyStatus, UDim2.new(0, 18, 0, 260), UDim2.new(1, -36, 0, 18), savedKeyExpired and Colors.Red or Colors.Muted, 11, Enum.Font.GothamMedium)

	local attempts, busy, loadingToken = 0, false, 0

	local function setStatus(big, small, col)
		status.Text = string.lower(tostring(big)) status.TextColor3 = col or Colors.Text
		statusSmall.Text = string.lower(tostring(small or "")) statusSmall.TextColor3 = col or Colors.Muted
		log.Text = "log: " .. string.lower(tostring(small or big or ""))
	end

	local function copyText(t, msg)
		if setclipboard then setclipboard(t) setStatus("copied", msg, Colors.Green)
		else setStatus("unsupported", "clipboard unavailable", Colors.Red) end
	end

	local function runValidation()
		if busy then return end busy = true attempts += 1
		if attempts > Config.MaxKeyAttempts then setStatus("locked", "max attempts reached", Colors.Red) busy = false return end
		setStatus("checking", "validating key", Colors.Yellow)
		loadingToken += 1 local token = loadingToken
		task.spawn(function()
			local dots = {"checking", "checking.", "checking..", "checking..."}
			local i = 1
			while busy and token == loadingToken and gui.Parent do
				redeem.Text = dots[i] i = (i % #dots) + 1 task.wait(0.25)
			end
		end)
		local valid, message = validateKey(keyInput.Text)
		loadingToken += 1
		if valid then
			Notify(Customization.NotifSuccess, Customization.MsgKeyFound, 3, Customization.ColorSuccess)
			setStatus("authorized", message, Customization.ColorSuccess) redeem.Text = "granted"
			task.wait(0.55)
			destroyKeyGui()
			-- Main source continues after the key gate in the hosted JNkie script.
		else
			Notify(Customization.NotifError, message, 3.5, Customization.ColorError)
			setStatus("denied", message, Customization.ColorError) redeem.Text = Customization.RedeemButton task.spawn(shakeInput)
		end
		busy = false
	end

	redeem.MouseButton1Click:Connect(runValidation)
	keyLink.MouseButton1Click:Connect(function() copyText(Customization.CopyKeyLink, Customization.MsgCopiedKeyLink) end)
	discBtn.MouseButton1Click:Connect(function() copyText(Customization.CopyDiscord, Customization.MsgCopiedDiscord) end)
	webBtn.MouseButton1Click:Connect(function() copyText(Customization.CopyWebsite, Customization.MsgCopiedWebsite) end)
	keyInput.FocusLost:Connect(function(e) if e then runValidation() end end)

	task.spawn(function()
		runIntro(function()
			panel.Visible = true
			TweenService:Create(panel, TweenInfo.new(PANEL_TIME, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Position            = UDim2.new(0.5, -260, 0.5, -150),
				BackgroundTransparency = 0,
			}):Play()
		end)
	end)

	task.spawn(function() while keyUiAlive and gui.Parent do clock.Text = os.date("%I:%M %p") task.wait(1) end end)

	task.spawn(function()
		local RunService = game:GetService("RunService")
		local embers = {}
		for i = 1, 46 do
			local x = Instance.new("TextLabel")
			x.BackgroundTransparency = 1
			x.Text = Customization.RainLetter
			x.TextColor3 = (i % 5 == 0) and Color3.fromRGB(255, 235, 210) or Color3.fromRGB(255, math.random(28, 80), math.random(28, 45))
			x.TextTransparency = math.random(68, 88) / 100
			x.TextSize = math.random(8, 18)
			x.Font = Enum.Font.GothamBlack
			x.Size = UDim2.fromOffset(28, 28)
			x.Position = UDim2.new(0.5, math.random(-275, 275), 0.5, math.random(-190, 245))
			x.Rotation = math.random(-25, 25)
			x.ZIndex = 0
			x.Active = false
			x.Visible = false
			x.Parent = overlay

			local trail = x:Clone()
			trail.TextTransparency = 0.94
			trail.TextSize = math.max(8, x.TextSize - 3)
			trail.ZIndex = 0
			trail.Visible = false
			trail.Parent = overlay

			embers[i] = {
				ui = x,
				trail = trail,
				lastPos = x.Position,
				xOffset = math.random(-275, 275),
				yOffset = math.random(-190, 245),
				rise = math.random(18, 48),
				drift = math.random(-12, 12),
				wobble = math.random() * math.pi * 2,
				wobbleSpeed = math.random(12, 26) / 10,
				spin = math.random(-55, 55),
				hasTrail = i % 2 == 0
			}
		end

		local emberCenter = UDim2.new(panel.Position.X.Scale, panel.Position.X.Offset + 260, panel.Position.Y.Scale, panel.Position.Y.Offset + 150)
		trackConnection(RunService.RenderStepped:Connect(function(dt)
			if not keyUiAlive or not gui.Parent then return end
			local targetCenter = UDim2.new(panel.Position.X.Scale, panel.Position.X.Offset + 260, panel.Position.Y.Scale, panel.Position.Y.Offset + 150)
			local followAlpha = math.clamp(dt * 4, 0, 1)
			emberCenter = UDim2.new(
				targetCenter.X.Scale,
				emberCenter.X.Offset + (targetCenter.X.Offset - emberCenter.X.Offset) * followAlpha,
				targetCenter.Y.Scale,
				emberCenter.Y.Offset + (targetCenter.Y.Offset - emberCenter.Y.Offset) * followAlpha
			)

			for _, item in ipairs(embers) do
				local u = item.ui
				if u.Parent then
					item.wobble = item.wobble + dt * item.wobbleSpeed
					item.xOffset = item.xOffset + dt * item.drift
					item.yOffset = item.yOffset - dt * item.rise

					if item.yOffset < -270 then
						item.xOffset = math.random(-275, 275)
						item.yOffset = math.random(210, 300)
						item.rise = math.random(18, 48)
						item.drift = math.random(-12, 12)
						u.TextTransparency = math.random(68, 88) / 100
						u.TextColor3 = (math.random(1, 5) == 1) and Color3.fromRGB(255, 235, 210) or Color3.fromRGB(255, math.random(28, 80), math.random(28, 45))
					end

					u.Visible = panel.Visible
					item.trail.Visible = panel.Visible and item.hasTrail
					if item.hasTrail then
						item.trail.Position = item.lastPos
						item.trail.Rotation = u.Rotation - 18
					end

					u.Position = UDim2.new(
						emberCenter.X.Scale,
						emberCenter.X.Offset + item.xOffset + math.sin(item.wobble) * 12,
						emberCenter.Y.Scale,
						emberCenter.Y.Offset + item.yOffset
					)
					item.lastPos = u.Position
					u.Rotation = (u.Rotation + dt * item.spin) % 360
				end
			end
		end))
	end)

	task.spawn(function()
		while keyUiAlive and gui.Parent do
			local text = Customization.PlaceholderText
			if keyUiAlive and keyInput.Text == "" and not keyInput:IsFocused() then
				for i = 1, #text do if not keyUiAlive or not gui.Parent or keyInput.Text ~= "" or keyInput:IsFocused() then break end keyInput.PlaceholderText = string.sub(text, 1, i) task.wait(0.035) end
				task.wait(0.9)
				for i = #text, 0, -1 do if not keyUiAlive or not gui.Parent or keyInput.Text ~= "" or keyInput:IsFocused() then break end keyInput.PlaceholderText = string.sub(text, 1, i) task.wait(0.025) end
				task.wait(0.25)
			else task.wait(0.2) end
		end
	end)

	top.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = true; dragStart = i.Position; startPos = panel.Position end end)
	UserInputService.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then dragging = false end end)
	UserInputService.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
			local d = i.Position - dragStart; panel.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
end

if not skipUI then
	while not getgenv().LOAD do
		task.wait(0.1)
	end
end

-- Do not call loadMain() here. In the JNkie-hosted script, the Project Delta
-- source continues after this key gate, so calling loadMain() manually causes
-- XFent Project Delta to run twice.
task.delay(1, function()
	getgenv().LOAD = false -- Reset so it can be re-executed later.
end)

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/0992a7faf3b621a34554d68561b85abefb1af7f3223de90315339a71e5bc5b6d?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end