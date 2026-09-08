local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS          = game:GetService("UserInputService")
local LocalPlayer  = Players.LocalPlayer or {UserId = 0}

local ENCODED_KEY = { 310,415,445,412,346,403,403,424 }

local function getValidKey()
	local key = ""
	for _, v in ipairs(ENCODED_KEY) do
		key = key .. string.char(math.floor((v-100)/3))
	end
	return key
end

local VALID_KEY = getValidKey()
local KEY_FILE  = "fayy_auth_" .. tostring(LocalPlayer.UserId) .. ".dat"

local function isAlreadyAuthenticated()
	if not isfile or not isfile(KEY_FILE) then return false end
	local ok, saved = pcall(readfile, KEY_FILE)
	if not ok or not saved or saved == "" then return false end
	return saved:match("^%s*(.-)%s*$") == VALID_KEY
end

local function saveAuthentication(key)
	if writefile then pcall(writefile, KEY_FILE, key) end
end

if isAlreadyAuthenticated() then
	pcall(function()
		loadstring(game:HttpGet(
			"https://raw.githubusercontent.com/FayyMeng/Reel-a-Brainrot/refs/heads/main/ReelABrainrot%20lua", true))()
	end)
	return
end

local function createGUI()
	local CONFIG = {
		LootLabsURL   = "https://loot-link.com/s?PjFzpiuu&data=7hDViHN3IUApLO81kcTWQvsiOu8MpWS2E1PgPDNMF2Lk9TSjosa%2BUPqT2U3UYmRc",
		MainScriptUrl = "https://raw.githubusercontent.com/FayyMeng/Reel-a-Brainrot/refs/heads/main/ReelABrainrot%20lua",
		DiscordURL    = "https://discord.gg/Dz2BafGg7",
	}

	local C = {
		G2_Top  = Color3.fromRGB(255,229,241),
		G2_Mid  = Color3.fromRGB(240, 66,255),
		G2_Bot  = Color3.fromRGB(114, 38,255),
		G4_Top  = Color3.fromRGB(114, 38,255),
		G4_Mid  = Color3.fromRGB( 22,  0,120),
		G4_Dark = Color3.fromRGB(  1,  0, 48),
		White   = Color3.fromRGB(255,255,255),
		TxtLt   = Color3.fromRGB(255,229,241),
		TxtDim  = Color3.fromRGB(200,160,230),
		OK      = Color3.fromRGB( 80,220,160),
		Err     = Color3.fromRGB(255, 80,100),
		Warn    = Color3.fromRGB(255,200, 80),
	}

	local CYCLE = { C.G2_Mid, C.G2_Bot, C.G2_Top, C.G4_Top, C.G4_Mid, C.G2_Mid }

	local isMobile = UIS.TouchEnabled
	local W, H     = isMobile and 480 or 600, isMobile and 220 or 280
	local R        = isMobile and 14 or 18
	local PAD      = isMobile and 10 or 14
	local FS       = {
		title = isMobile and 13 or 16,
		body  = isMobile and 11 or 13,
		small = isMobile and 10 or 12,
		btn   = isMobile and 11 or 13,
	}

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name         = "FayyKeyGUI_v6"
	ScreenGui.Parent       = game:GetService("CoreGui")
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local TBSize = isMobile and 52 or 62

	local ToggleHolder = Instance.new("Frame")
	ToggleHolder.Name                 = "ToggleHolder"
	ToggleHolder.Size                 = UDim2.new(0, TBSize+12, 0, TBSize+6)
	ToggleHolder.Position             = UDim2.new(0, 8, 0.5, -(TBSize/2)-13)
	ToggleHolder.BackgroundTransparency = 1
	ToggleHolder.BorderSizePixel      = 0
	ToggleHolder.ZIndex               = 10
	ToggleHolder.Parent               = ScreenGui

	local ToggleOutline = Instance.new("Frame")
	ToggleOutline.Size                 = UDim2.new(0, TBSize+6, 0, TBSize+6)
	ToggleOutline.Position             = UDim2.new(0, 3, 0, -3)
	ToggleOutline.BackgroundColor3     = C.G2_Mid
	ToggleOutline.BackgroundTransparency = 0
	ToggleOutline.BorderSizePixel      = 0
	ToggleOutline.ZIndex               = 10
	ToggleOutline.Parent               = ToggleHolder

	local TOCorner = Instance.new("UICorner")
	TOCorner.CornerRadius = UDim.new(0, isMobile and 14 or 16)
	TOCorner.Parent = ToggleOutline

	local ToggleBtn = Instance.new("TextButton")
	ToggleBtn.Name             = "ToggleBtn"
	ToggleBtn.Size             = UDim2.new(0, TBSize, 0, TBSize)
	ToggleBtn.Position         = UDim2.new(0, 6, 0, 0)
	ToggleBtn.BackgroundColor3 = C.G4_Mid
	ToggleBtn.BorderSizePixel  = 0
	ToggleBtn.Text             = "🔑"
	ToggleBtn.TextSize         = isMobile and 24 or 28
	ToggleBtn.Font             = Enum.Font.GothamBold
	ToggleBtn.TextColor3       = C.White
	ToggleBtn.ZIndex           = 11
	ToggleBtn.Parent           = ToggleHolder

	local TCorner = Instance.new("UICorner")
	TCorner.CornerRadius = UDim.new(0, isMobile and 12 or 14)
	TCorner.Parent = ToggleBtn

	local TGrad = Instance.new("UIGradient")
	TGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.G2_Mid),
		ColorSequenceKeypoint.new(1, C.G4_Top),
	})
	TGrad.Rotation = 135
	TGrad.Parent = ToggleBtn

	do
		local dragging, dragStart, startPos = false, nil, nil

		ToggleBtn.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
				dragging  = true
				dragStart = input.Position
				startPos  = ToggleHolder.Position
			end
		end)

		UIS.InputChanged:Connect(function(input)
			if dragging and (
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch) then
				local delta = input.Position - dragStart
				ToggleHolder.Position = UDim2.new(
					startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y
				)
			end
		end)

		UIS.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
				dragging = false
			end
		end)
	end

	local BP = 4
	local Outline = Instance.new("Frame")
	Outline.Name             = "Outline"
	Outline.Size             = UDim2.new(0, W+BP*2, 0, H+BP*2)
	Outline.Position         = UDim2.new(0.5, -(W/2)-BP, 0.5, -(H/2)-BP)
	Outline.BackgroundColor3 = C.G2_Mid
	Outline.BorderSizePixel  = 0
	Outline.ZIndex           = 1
	Outline.Parent           = ScreenGui

	local OCorner = Instance.new("UICorner")
	OCorner.CornerRadius = UDim.new(0, R+BP)
	OCorner.Parent = Outline

	local Container = Instance.new("Frame")
	Container.Name             = "Container"
	Container.Size             = UDim2.new(0, W, 0, H)
	Container.Position         = UDim2.new(0.5, -W/2, 0.5, -H/2)
	Container.BackgroundColor3 = C.G4_Dark
	Container.BorderSizePixel  = 0
	Container.ClipsDescendants = true
	Container.ZIndex           = 2
	Container.Parent           = ScreenGui

	local ContCorner = Instance.new("UICorner")
	ContCorner.CornerRadius = UDim.new(0, R)
	ContCorner.Parent = Container

	local BgGrad = Instance.new("UIGradient")
	BgGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,   C.G4_Top),
		ColorSequenceKeypoint.new(0.5, C.G4_Mid),
		ColorSequenceKeypoint.new(1,   C.G4_Dark),
	})
	BgGrad.Rotation = 135
	BgGrad.Parent = Container

	local LEFT_W  = math.floor(W * 0.37)
	local RIGHT_W = W - LEFT_W

	local LeftPanel = Instance.new("Frame")
	LeftPanel.Size             = UDim2.new(0, LEFT_W, 1, 0)
	LeftPanel.BackgroundColor3 = C.G2_Mid
	LeftPanel.BorderSizePixel  = 0
	LeftPanel.ZIndex           = 3
	LeftPanel.Parent           = Container

	local LPCorner = Instance.new("UICorner")
	LPCorner.CornerRadius = UDim.new(0, R)
	LPCorner.Parent = LeftPanel

	local LPFill = Instance.new("Frame")
	LPFill.Size             = UDim2.new(0, R, 1, 0)
	LPFill.Position         = UDim2.new(1, -R, 0, 0)
	LPFill.BackgroundColor3 = C.G2_Mid
	LPFill.BorderSizePixel  = 0
	LPFill.ZIndex           = 3
	LPFill.Parent           = LeftPanel

	local LPGrad = Instance.new("UIGradient")
	LPGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,   C.G2_Mid),
		ColorSequenceKeypoint.new(0.6, C.G2_Bot),
		ColorSequenceKeypoint.new(1,   C.G4_Mid),
	})
	LPGrad.Rotation = 150
	LPGrad.Parent = LeftPanel

	local Divider = Instance.new("Frame")
	Divider.Name             = "Divider"
	Divider.Size             = UDim2.new(0, 4, 1, 0)
	Divider.Position         = UDim2.new(0, LEFT_W, 0, 0)
	Divider.BackgroundColor3 = C.G2_Mid
	Divider.BorderSizePixel  = 0
	Divider.ZIndex           = 5
	Divider.Parent           = Container

	local DivGrad = Instance.new("UIGradient")
	DivGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,   C.G2_Top),
		ColorSequenceKeypoint.new(0.5, C.G2_Mid),
		ColorSequenceKeypoint.new(1,   C.G4_Top),
	})
	DivGrad.Rotation = 90
	DivGrad.Parent = Divider

	local logoSz = isMobile and 38 or 48
	local LogoBg = Instance.new("Frame")
	LogoBg.Size                 = UDim2.new(0, logoSz, 0, logoSz)
	LogoBg.Position             = UDim2.new(0.5, -logoSz/2, 0, isMobile and 14 or 18)
	LogoBg.BackgroundColor3     = C.White
	LogoBg.BackgroundTransparency = 0.72
	LogoBg.BorderSizePixel      = 0
	LogoBg.ZIndex               = 4
	LogoBg.Parent               = LeftPanel

	local LBCorner = Instance.new("UICorner")
	LBCorner.CornerRadius = UDim.new(0, isMobile and 10 or 12)
	LBCorner.Parent = LogoBg

	local LogoEmoji = Instance.new("TextLabel")
	LogoEmoji.Size               = UDim2.new(1,0,1,0)
	LogoEmoji.BackgroundTransparency = 1
	LogoEmoji.Text               = "🔑"
	LogoEmoji.TextSize           = isMobile and 20 or 26
	LogoEmoji.Font               = Enum.Font.GothamBold
	LogoEmoji.TextColor3         = C.White
	LogoEmoji.ZIndex             = 5
	LogoEmoji.Parent             = LogoBg

	local TitleLbl = Instance.new("TextLabel")
	TitleLbl.Size               = UDim2.new(1,-8,0,isMobile and 18 or 22)
	TitleLbl.Position           = UDim2.new(0,4,0, logoSz+(isMobile and 20 or 26))
	TitleLbl.BackgroundTransparency = 1
	TitleLbl.Text               = "FAYY SCRIPT"
	TitleLbl.TextColor3         = C.White
	TitleLbl.Font               = Enum.Font.GothamBold
	TitleLbl.TextSize           = FS.title
	TitleLbl.TextXAlignment     = Enum.TextXAlignment.Center
	TitleLbl.ZIndex             = 4
	TitleLbl.Parent             = LeftPanel

	local SubLbl = Instance.new("TextLabel")
	SubLbl.Size               = UDim2.new(1,-8,0,isMobile and 14 or 18)
	SubLbl.Position           = UDim2.new(0,4,0, logoSz+(isMobile and 40 or 50))
	SubLbl.BackgroundTransparency = 1
	SubLbl.Text               = "Reel A Brainrot"
	SubLbl.TextColor3         = C.TxtLt
	SubLbl.Font               = Enum.Font.GothamBold
	SubLbl.TextSize           = FS.small
	SubLbl.TextXAlignment     = Enum.TextXAlignment.Center
	SubLbl.ZIndex             = 4
	SubLbl.Parent             = LeftPanel

	local AnnLbl = Instance.new("TextLabel")
	AnnLbl.Size               = UDim2.new(1,-8,0,isMobile and 36 or 44)
	AnnLbl.Position           = UDim2.new(0,4,1,isMobile and -44 or -52)
	AnnLbl.BackgroundTransparency = 1
	AnnLbl.Text               = "📢  Get key on the right!"
	AnnLbl.TextColor3         = C.TxtLt
	AnnLbl.Font               = Enum.Font.GothamBold
	AnnLbl.TextSize           = FS.small
	AnnLbl.TextWrapped        = true
	AnnLbl.TextXAlignment     = Enum.TextXAlignment.Center
	AnnLbl.ZIndex             = 4
	AnnLbl.Parent             = LeftPanel

	local RightPanel = Instance.new("Frame")
	RightPanel.Size             = UDim2.new(0, RIGHT_W, 1, 0)
	RightPanel.Position         = UDim2.new(0, LEFT_W, 0, 0)
	RightPanel.BackgroundTransparency = 1
	RightPanel.ZIndex           = 3
	RightPanel.Parent           = Container

	local CloseBtn = Instance.new("TextButton")
	CloseBtn.Size             = UDim2.new(0, isMobile and 26 or 32, 0, isMobile and 26 or 32)
	CloseBtn.Position         = UDim2.new(1, isMobile and -30 or -38, 0, isMobile and 6 or 8)
	CloseBtn.BackgroundColor3 = C.White
	CloseBtn.BackgroundTransparency = 0.80
	CloseBtn.Text             = "✕"
	CloseBtn.TextColor3       = C.White
	CloseBtn.Font             = Enum.Font.GothamBold
	CloseBtn.TextSize         = isMobile and 13 or 15
	CloseBtn.ZIndex           = 6
	CloseBtn.Parent           = RightPanel

	local CBCorner = Instance.new("UICorner")
	CBCorner.CornerRadius = UDim.new(0, isMobile and 7 or 8)
	CBCorner.Parent = CloseBtn

	local KCH = isMobile and 56 or 70
	local KeyCard = Instance.new("Frame")
	KeyCard.Size             = UDim2.new(1,-PAD*2,0,KCH)
	KeyCard.Position         = UDim2.new(0,PAD,0,PAD)
	KeyCard.BackgroundColor3 = C.G2_Bot
	KeyCard.BorderSizePixel  = 0
	KeyCard.ZIndex           = 4
	KeyCard.Parent           = RightPanel

	local KCCorner = Instance.new("UICorner")
	KCCorner.CornerRadius = UDim.new(0, isMobile and 10 or 12)
	KCCorner.Parent = KeyCard

	local KCGrad = Instance.new("UIGradient")
	KCGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,   C.G2_Mid),
		ColorSequenceKeypoint.new(0.6, C.G2_Bot),
		ColorSequenceKeypoint.new(1,   C.G4_Mid),
	})
	KCGrad.Rotation = 120
	KCGrad.Parent = KeyCard

	local KCIcon = Instance.new("TextLabel")
	KCIcon.Size               = UDim2.new(0,isMobile and 28 or 36,1,0)
	KCIcon.Position           = UDim2.new(0,isMobile and 8 or 12,0,0)
	KCIcon.BackgroundTransparency = 1
	KCIcon.Text               = "💎"
	KCIcon.TextSize           = isMobile and 20 or 26
	KCIcon.Font               = Enum.Font.GothamBold
	KCIcon.TextColor3         = C.White
	KCIcon.ZIndex             = 5
	KCIcon.Parent             = KeyCard

	local KCTitle = Instance.new("TextLabel")
	KCTitle.Size               = UDim2.new(1,isMobile and -108 or -134,0,isMobile and 20 or 24)
	KCTitle.Position           = UDim2.new(0,isMobile and 42 or 54,0,isMobile and 8 or 11)
	KCTitle.BackgroundTransparency = 1
	KCTitle.Text               = "LootLabs"
	KCTitle.TextColor3         = C.White
	KCTitle.Font               = Enum.Font.GothamBold
	KCTitle.TextSize           = FS.body
	KCTitle.TextXAlignment     = Enum.TextXAlignment.Left
	KCTitle.ZIndex             = 5
	KCTitle.Parent             = KeyCard

	local KCDesc = Instance.new("TextLabel")
	KCDesc.Size               = UDim2.new(1,isMobile and -108 or -134,0,isMobile and 14 or 18)
	KCDesc.Position           = UDim2.new(0,isMobile and 42 or 54,0,isMobile and 29 or 37)
	KCDesc.BackgroundTransparency = 1
	KCDesc.Text               = "Click to copy key link"
	KCDesc.TextColor3         = C.TxtLt
	KCDesc.Font               = Enum.Font.GothamBold
	KCDesc.TextSize           = FS.small
	KCDesc.TextXAlignment     = Enum.TextXAlignment.Left
	KCDesc.ZIndex             = 5
	KCDesc.Parent             = KeyCard

	local GKW = isMobile and 78 or 94
	local GKH = isMobile and 28 or 34
	local GetKeyBtn = Instance.new("TextButton")
	GetKeyBtn.Size             = UDim2.new(0,GKW,0,GKH)
	GetKeyBtn.Position         = UDim2.new(1,-GKW-(isMobile and 8 or 10),0.5,-GKH/2)
	GetKeyBtn.BackgroundColor3 = C.White
	GetKeyBtn.Text             = "GET KEY"
	GetKeyBtn.TextColor3       = C.G4_Mid
	GetKeyBtn.Font             = Enum.Font.GothamBold
	GetKeyBtn.TextSize         = FS.btn
	GetKeyBtn.ZIndex           = 6
	GetKeyBtn.Parent           = KeyCard

	local GKCorner = Instance.new("UICorner")
	GKCorner.CornerRadius = UDim.new(0, isMobile and 7 or 9)
	GKCorner.Parent = GetKeyBtn

	local inputY = PAD + KCH + PAD - 2
	local IRH    = isMobile and 30 or 38

	local InputOutline = Instance.new("Frame")
	InputOutline.Size             = UDim2.new(1,-PAD*2+4,0,IRH+4)
	InputOutline.Position         = UDim2.new(0,PAD-2,0,inputY-2)
	InputOutline.BackgroundColor3 = C.G2_Mid
	InputOutline.BorderSizePixel  = 0
	InputOutline.ZIndex           = 3
	InputOutline.Parent           = RightPanel

	local IOCorner = Instance.new("UICorner")
	IOCorner.CornerRadius = UDim.new(0, isMobile and 10 or 12)
	IOCorner.Parent = InputOutline

	local IOGrad = Instance.new("UIGradient")
	IOGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0,   C.G2_Mid),
		ColorSequenceKeypoint.new(0.5, C.G2_Bot),
		ColorSequenceKeypoint.new(1,   C.G4_Mid),
	})
	IOGrad.Rotation = 90
	IOGrad.Parent = InputOutline

	task.spawn(function()
		local rot = 0
		while InputOutline and InputOutline.Parent do
			rot = (rot + 1.5) % 360
			IOGrad.Rotation = rot
			task.wait(0.03)
		end
	end)

	local InputRow = Instance.new("Frame")
	InputRow.Size             = UDim2.new(1,-PAD*2,0,IRH)
	InputRow.Position         = UDim2.new(0,PAD,0,inputY)
	InputRow.BackgroundColor3 = C.White
	InputRow.BackgroundTransparency = 0.85
	InputRow.BorderSizePixel  = 0
	InputRow.ZIndex           = 4
	InputRow.Parent           = RightPanel

	local IRCorner = Instance.new("UICorner")
	IRCorner.CornerRadius = UDim.new(0, isMobile and 8 or 10)
	IRCorner.Parent = InputRow

	local IRGrad = Instance.new("UIGradient")
	IRGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.G2_Bot),
		ColorSequenceKeypoint.new(1, C.G4_Top),
	})
	IRGrad.Rotation = 90
	IRGrad.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0.80),
		NumberSequenceKeypoint.new(1, 0.87),
	})
	IRGrad.Parent = InputRow

	local KeyIconLbl = Instance.new("TextLabel")
	KeyIconLbl.Size               = UDim2.new(0,isMobile and 26 or 32,1,0)
	KeyIconLbl.Position           = UDim2.new(0,2,0,0)
	KeyIconLbl.BackgroundTransparency = 1
	KeyIconLbl.Text               = "🔐"
	KeyIconLbl.TextSize           = isMobile and 14 or 18
	KeyIconLbl.Font               = Enum.Font.GothamBold
	KeyIconLbl.TextColor3         = C.TxtLt
	KeyIconLbl.ZIndex             = 5
	KeyIconLbl.Parent             = InputRow

	local KeyInput = Instance.new("TextBox")
	KeyInput.Size               = UDim2.new(1,isMobile and -32 or -40,1,-4)
	KeyInput.Position           = UDim2.new(0,isMobile and 28 or 36,0,2)
	KeyInput.BackgroundTransparency = 1
	KeyInput.PlaceholderText    = "Paste your key here..."
	KeyInput.PlaceholderColor3  = C.TxtDim
	KeyInput.Text               = ""
	KeyInput.TextColor3         = C.White
	KeyInput.Font               = Enum.Font.GothamBold
	KeyInput.TextSize           = FS.body
	KeyInput.ClearTextOnFocus   = false
	KeyInput.ZIndex             = 5
	KeyInput.Parent             = InputRow

	local btnY  = inputY + IRH + (isMobile and 6 or 8)
	local BtnRow = Instance.new("Frame")
	BtnRow.Size             = UDim2.new(1,-PAD*2,0,isMobile and 28 or 34)
	BtnRow.Position         = UDim2.new(0,PAD,0,btnY)
	BtnRow.BackgroundTransparency = 1
	BtnRow.ZIndex           = 4
	BtnRow.Parent           = RightPanel

	local SubmitBtn = Instance.new("TextButton")
	SubmitBtn.Size             = UDim2.new(0.56,-3,1,0)
	SubmitBtn.BackgroundColor3 = C.G2_Mid
	SubmitBtn.Text             = "✅  SUBMIT KEY"
	SubmitBtn.TextColor3       = C.White
	SubmitBtn.Font             = Enum.Font.GothamBold
	SubmitBtn.TextSize         = FS.btn
	SubmitBtn.ZIndex           = 5
	SubmitBtn.Parent           = BtnRow

	local SBCorner = Instance.new("UICorner")
	SBCorner.CornerRadius = UDim.new(0, isMobile and 7 or 9)
	SBCorner.Parent = SubmitBtn

	local SBGrad = Instance.new("UIGradient")
	SBGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.G2_Mid),
		ColorSequenceKeypoint.new(1, C.G2_Bot),
	})
	SBGrad.Rotation = 90
	SBGrad.Parent = SubmitBtn

	local ClearBtn = Instance.new("TextButton")
	ClearBtn.Size             = UDim2.new(0.44,-3,1,0)
	ClearBtn.Position         = UDim2.new(0.56,3,0,0)
	ClearBtn.BackgroundColor3 = C.White
	ClearBtn.BackgroundTransparency = 0.82
	ClearBtn.Text             = "🗑️  CLEAR"
	ClearBtn.TextColor3       = C.TxtLt
	ClearBtn.Font             = Enum.Font.GothamBold
	ClearBtn.TextSize         = FS.btn
	ClearBtn.ZIndex           = 5
	ClearBtn.Parent           = BtnRow

	local CBtnCorner = Instance.new("UICorner")
	CBtnCorner.CornerRadius = UDim.new(0, isMobile and 7 or 9)
	CBtnCorner.Parent = ClearBtn

	local botY   = btnY + (isMobile and 28 or 34) + (isMobile and 6 or 8)
	local BotRow = Instance.new("Frame")
	BotRow.Size             = UDim2.new(1,-PAD*2,0,isMobile and 32 or 40)
	BotRow.Position         = UDim2.new(0,PAD,0,botY)
	BotRow.BackgroundColor3 = C.G4_Top
	BotRow.BorderSizePixel  = 0
	BotRow.ZIndex           = 4
	BotRow.Parent           = RightPanel

	local BotCorner = Instance.new("UICorner")
	BotCorner.CornerRadius = UDim.new(0, isMobile and 8 or 10)
	BotCorner.Parent = BotRow

	local BotGrad = Instance.new("UIGradient")
	BotGrad.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, C.G4_Top),
		ColorSequenceKeypoint.new(1, C.G4_Mid),
	})
	BotGrad.Rotation = 90
	BotGrad.Parent = BotRow

	local DIcon = Instance.new("TextLabel")
	DIcon.Size               = UDim2.new(0,isMobile and 26 or 32,1,0)
	DIcon.Position           = UDim2.new(0,isMobile and 6 or 8,0,0)
	DIcon.BackgroundTransparency = 1
	DIcon.Text               = "🎮"
	DIcon.TextSize           = isMobile and 15 or 19
	DIcon.Font               = Enum.Font.GothamBold
	DIcon.TextColor3         = C.White
	DIcon.ZIndex             = 5
	DIcon.Parent             = BotRow

	local DTitle = Instance.new("TextLabel")
	DTitle.Size               = UDim2.new(1,isMobile and -120 or -148,0,isMobile and 14 or 18)
	DTitle.Position           = UDim2.new(0,isMobile and 36 or 46,0,isMobile and 4 or 5)
	DTitle.BackgroundTransparency = 1
	DTitle.Text               = "Join our Discord"
	DTitle.TextColor3         = C.White
	DTitle.Font               = Enum.Font.GothamBold
	DTitle.TextSize           = FS.body
	DTitle.TextXAlignment     = Enum.TextXAlignment.Left
	DTitle.ZIndex             = 5
	DTitle.Parent             = BotRow

	local StatusLabel = Instance.new("TextLabel")
	StatusLabel.Size               = UDim2.new(1,isMobile and -120 or -148,0,isMobile and 11 or 13)
	StatusLabel.Position           = UDim2.new(0,isMobile and 36 or 46,0,isMobile and 19 or 23)
	StatusLabel.BackgroundTransparency = 1
	StatusLabel.Text               = "✨  Click GET KEY to start"
	StatusLabel.TextColor3         = C.TxtDim
	StatusLabel.Font               = Enum.Font.GothamBold
	StatusLabel.TextSize           = FS.small
	StatusLabel.TextXAlignment     = Enum.TextXAlignment.Left
	StatusLabel.ZIndex             = 5
	StatusLabel.Parent             = BotRow

	local JW = isMobile and 60 or 76
	local JH = isMobile and 22 or 28
	local JoinBtn = Instance.new("TextButton")
	JoinBtn.Size             = UDim2.new(0,JW,0,JH)
	JoinBtn.Position         = UDim2.new(1,-JW-(isMobile and 6 or 8),0.5,-JH/2)
	JoinBtn.BackgroundColor3 = C.White
	JoinBtn.Text             = "JOIN"
	JoinBtn.TextColor3       = C.G4_Top
	JoinBtn.Font             = Enum.Font.GothamBold
	JoinBtn.TextSize         = FS.btn
	JoinBtn.ZIndex           = 6
	JoinBtn.Parent           = BotRow

	local JCorner = Instance.new("UICorner")
	JCorner.CornerRadius = UDim.new(0, isMobile and 6 or 8)
	JCorner.Parent = JoinBtn

	local centerPos = UDim2.new(0.5,-W/2,0.5,-H/2)
	Container.Position          = UDim2.new(0.5,-W/2,0.65,-H/2)
	Container.BackgroundTransparency = 1
	Outline.Position            = UDim2.new(0.5,-(W/2)-BP,0.65,-(H/2)-BP)
	Outline.BackgroundTransparency = 1

	local inTI = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
	TweenService:Create(Container, inTI, { Position=centerPos, BackgroundTransparency=0 }):Play()
	TweenService:Create(Outline, inTI, {
		Position = UDim2.new(0.5,-(W/2)-BP,0.5,-(H/2)-BP),
		BackgroundTransparency = 0,
	}):Play()

	task.spawn(function()
		local idx = 1
		while Outline and Outline.Parent do
			local nxt = (idx % #CYCLE) + 1
			local ti  = TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
			TweenService:Create(Outline,       ti, { BackgroundColor3 = CYCLE[nxt] }):Play()
			TweenService:Create(Divider,       ti, { BackgroundColor3 = CYCLE[nxt] }):Play()
			TweenService:Create(ToggleOutline, ti, { BackgroundColor3 = CYCLE[nxt] }):Play()
			TweenService:Create(ToggleBtn,     ti, { BackgroundColor3 = CYCLE[nxt] }):Play()
			DivGrad.Rotation = (DivGrad.Rotation + 15) % 360
			idx = nxt
			task.wait(1.2)
		end
	end)

	local function addHover(btn, dt, ht)
		local os, op = btn.Size, btn.Position
		btn.MouseEnter:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.14, Enum.EasingStyle.Quad), {
				BackgroundTransparency = ht,
				Size     = UDim2.new(os.X.Scale,os.X.Offset+2,os.Y.Scale,os.Y.Offset+2),
				Position = UDim2.new(op.X.Scale,op.X.Offset-1,op.Y.Scale,op.Y.Offset-1),
			}):Play()
		end)
		btn.MouseLeave:Connect(function()
			TweenService:Create(btn, TweenInfo.new(0.14, Enum.EasingStyle.Quad), {
				BackgroundTransparency = dt, Size=os, Position=op,
			}):Play()
		end)
	end

	addHover(GetKeyBtn, 0,    0.08)
	addHover(SubmitBtn, 0,    0.07)
	addHover(JoinBtn,   0,    0.08)
	addHover(ClearBtn,  0.82, 0.70)
	addHover(ToggleBtn, 0,    0.10)

	local isVisible = true
	ToggleBtn.MouseButton1Click:Connect(function()
		isVisible = not isVisible
		if isVisible then
			Container.Position = UDim2.new(0.5,-W/2,0.65,-H/2)
			Outline.Position   = UDim2.new(0.5,-(W/2)-BP,0.65,-(H/2)-BP)
			local ti = TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
			TweenService:Create(Container, ti, { Position=centerPos, BackgroundTransparency=0 }):Play()
			TweenService:Create(Outline, ti, {
				Position = UDim2.new(0.5,-(W/2)-BP,0.5,-(H/2)-BP),
				BackgroundTransparency = 0,
			}):Play()
			ToggleBtn.Text = "🔑"
		else
			local ti = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
			TweenService:Create(Container, ti, {
				Position = UDim2.new(0.5,-W/2,1.3,-H/2), BackgroundTransparency=1
			}):Play()
			TweenService:Create(Outline, ti, {
				Position = UDim2.new(0.5,-(W/2)-BP,1.3,-(H/2)-BP), BackgroundTransparency=1
			}):Play()
			ToggleBtn.Text = "👁"
		end
	end)

	CloseBtn.MouseButton1Click:Connect(function()
		local ti = TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
		TweenService:Create(Container, ti, {
			Position = UDim2.new(0.5,-W/2,1.3,-H/2), BackgroundTransparency=1
		}):Play()
		TweenService:Create(Outline, ti, {
			Position = UDim2.new(0.5,-(W/2)-BP,1.3,-(H/2)-BP), BackgroundTransparency=1
		}):Play()
		TweenService:Create(ToggleHolder,  ti, { BackgroundTransparency=1 }):Play()
		TweenService:Create(ToggleOutline, ti, { BackgroundTransparency=1 }):Play()
		task.wait(0.35)
		ScreenGui:Destroy()
	end)

	local function copyLink(url, btn, origColor)
		if setclipboard then
			setclipboard(url)
			local prev = btn.Text
			btn.Text       = "✓ COPIED"
			btn.TextColor3 = C.OK
			StatusLabel.Text       = "✅  Link copied! Open in browser"
			StatusLabel.TextColor3 = C.OK
			task.wait(2)
			btn.Text       = prev
			btn.TextColor3 = origColor
			StatusLabel.Text       = "✨  Click GET KEY to start"
			StatusLabel.TextColor3 = C.TxtDim
		else
			StatusLabel.Text       = "❌  Clipboard not supported"
			StatusLabel.TextColor3 = C.Err
		end
	end

	GetKeyBtn.MouseButton1Click:Connect(function()
		copyLink(CONFIG.LootLabsURL, GetKeyBtn, C.G4_Mid)
	end)

	JoinBtn.MouseButton1Click:Connect(function()
		copyLink(CONFIG.DiscordURL, JoinBtn, C.G4_Top)
		StatusLabel.Text       = "🎮  Discord link copied!"
		StatusLabel.TextColor3 = C.G2_Bot
		task.wait(2.5)
		StatusLabel.Text       = "✨  Click GET KEY to start"
		StatusLabel.TextColor3 = C.TxtDim
	end)

	ClearBtn.MouseButton1Click:Connect(function()
		KeyInput.Text          = ""
		StatusLabel.Text       = "🗑️  Input cleared"
		StatusLabel.TextColor3 = C.Warn
		task.wait(1.5)
		StatusLabel.Text       = "✨  Click GET KEY to start"
		StatusLabel.TextColor3 = C.TxtDim
	end)

	task.spawn(function()
		if isfile and isfile(KEY_FILE) then
			local ok, content = pcall(readfile, KEY_FILE)
			if ok and content and content ~= "" then
				KeyInput.Text          = content
				StatusLabel.Text       = "🔄  Saved key detected"
				StatusLabel.TextColor3 = Color3.fromRGB(0,200,255)
			end
		end
	end)

	SubmitBtn.MouseButton1Click:Connect(function()
		local userKey = KeyInput.Text:gsub("%s+","")
		if userKey == "" then
			StatusLabel.Text       = "❌  Please enter a key!"
			StatusLabel.TextColor3 = C.Err
			return
		end
		StatusLabel.Text       = "🔍  Verifying..."
		StatusLabel.TextColor3 = C.Warn

		task.spawn(function()
			if userKey == VALID_KEY then
				saveAuthentication(userKey)
				StatusLabel.Text       = "✅  Key Valid!"
				StatusLabel.TextColor3 = C.OK
				local ti = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.In)
				TweenService:Create(Container, ti, { BackgroundTransparency=1 }):Play()
				TweenService:Create(Outline,   ti, { BackgroundTransparency=1 }):Play()
				task.wait(0.45)
				ScreenGui:Destroy()
				pcall(function()
					loadstring(game:HttpGet(CONFIG.MainScriptUrl, true))()
				end)
			else
				StatusLabel.Text       = "❌  Wrong key. Try again."
				StatusLabel.TextColor3 = C.Err
				local origPos = InputRow.Position
				for i = 1, 4 do
					TweenService:Create(InputRow, TweenInfo.new(0.05,Enum.EasingStyle.Quad), {
						Position = UDim2.new(origPos.X.Scale, origPos.X.Offset+(i%2==0 and 5 or -5),
						                     origPos.Y.Scale, origPos.Y.Offset)
					}):Play()
					task.wait(0.05)
				end
				TweenService:Create(InputRow, TweenInfo.new(0.08,Enum.EasingStyle.Quad), {
					Position = origPos
				}):Play()
				if isfile and isfile(KEY_FILE) then pcall(delfile, KEY_FILE) end
				task.wait(2)
				StatusLabel.Text       = "✨  Click GET KEY to start"
				StatusLabel.TextColor3 = C.TxtDim
			end
		end)
	end)

	KeyInput.FocusLost:Connect(function(enterPressed)
		if enterPressed then SubmitBtn.MouseButton1Click:Fire() end
	end)
end

createGUI()
