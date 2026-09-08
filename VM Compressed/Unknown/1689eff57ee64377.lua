if unexpected_LOAD then return end
pcall(function() getgenv().unexpected_LOAD = true end)

function missing(t, f, fallback)
    if type(f) == t then return f end
    return fallback
end

--#core
cloneref = missing("function", cloneref, function(...) return ... end)
queueteleport = missing("function", queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport))
--#coreEnd

--#imports
COREGUI = cloneref(game:GetService("CoreGui"))
PLRS = cloneref(game:GetService("Players"))
UIS = cloneref(game:GetService("UserInputService"))
RS = cloneref(game:GetService("RunService"))
GS = cloneref(game:GetService("GuiService"))
LP = cloneref(PLRS.LocalPlayer)
TS = cloneref(game:GetService("TweenService"))
HS = cloneref(game:GetService("HttpService"))
TPS = cloneref(game:GetService("TeleportService"))
WS = cloneref(game:GetService("Workspace"))
VU = cloneref(game:GetService("VirtualUser"))
CAM = cloneref(WS.CurrentCamera)
MOBILE = UIS.TouchEnabled
--#importsEnd

--#importFuncs
CHAR = LP.Character or LP.CharacterAdded:Wait()
HUM = cloneref(CHAR:WaitForChild("Humanoid"))
HRP = cloneref(CHAR:WaitForChild("HumanoidRootPart"))

LP.CharacterAdded:Connect(function(c)
	CHAR = c
	HUM = cloneref(c:WaitForChild("Humanoid"))
	HRP = cloneref(c:WaitForChild("HumanoidRootPart"))
end)
--#importFuncsEnd

local FQ = {
    FONTS = {
        REGULAR = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        BOLD    = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        ITALIC  = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Italic),
    },
    COLORS = {
        BACKGROUND = Color3.fromRGB(0, 0, 0),
        STROKE     = Color3.fromRGB(50, 50, 50),
        TEXT_MAIN  = Color3.fromRGB(220, 220, 220),
        TEXT_DIM   = Color3.fromRGB(120, 120, 120),
        ACCENT     = Color3.fromRGB(100, 100, 100),
    },
    SIZES = {
        CLI_WIDTH      = 167,
        CLI_WIDTH_FULL = 230,
        CLI_HEIGHT     = 54,
        PILL_HEIGHT    = 71,
    },
    PADDING = {
        SMALL  = UDim.new(0, 4),
        MEDIUM = UDim.new(0, 8),
    }
}

local function CREATE_CORNER(PARENT, RADIUS_SCALE, RADIUS_OFFSET)
    local CORNER = Instance.new("UICorner")
    CORNER.CornerRadius = UDim.new(RADIUS_SCALE or 0, RADIUS_OFFSET or 0)
    CORNER.Parent = PARENT
    return CORNER
end

local function CREATE_STROKE(PARENT, COLOR, APPLY_MODE)
    local STROKE = Instance.new("UIStroke")
    STROKE.Color = COLOR or FQ.COLORS.STROKE
    STROKE.ApplyStrokeMode = APPLY_MODE or Enum.ApplyStrokeMode.Border
    STROKE.Parent = PARENT
    return STROKE
end

local function CREATE_ASPECT(PARENT, RATIO)
    local AR = Instance.new("UIAspectRatioConstraint")
    if RATIO then
        AR.AspectRatio = RATIO
    end
    AR.Parent = PARENT
    return AR
end

local unexpected_UI = {};
local currentVersion = "g2"
local function randomString(length, charset)
	length = length or math.random(10, 20)
	charset = charset or "abcdefghijklmnopqRStuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	local chars = {}
	local charsetLength = #charset
	for i = 1, length do
		local rand = math.random(1, charsetLength)
		chars[i] = charset:sub(rand, rand)
	end
	return table.concat(chars)
end

local function mk(class, parent, props)
	local o = Instance.new(class, parent)
	if props then
		for k, v in pairs(props) do
			o[k] = v
		end
	end
	return o
end

unexpected_UI.UI = mk("ScreenGui", gethui() or COREGUI, { Name = randomString() })

unexpected_UI.PILL = mk("Frame", unexpected_UI.UI, {
	ZIndex = 0,
	BorderSizePixel = 0,
	BackgroundColor3 = FQ.COLORS.BACKGROUND,
	Size = UDim2.new(0, 218, 0, 71),
	Position = UDim2.new(0.5, -109, 1, -150),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Name = "Pill",
})
CREATE_CORNER(unexpected_UI.PILL, 1, 0)
CREATE_STROKE(unexpected_UI.PILL, FQ.COLORS.STROKE)

unexpected_UI.CLI = mk("TextBox", unexpected_UI.PILL, {
	CursorPosition = -1,
	Name = "CLI",
	TextXAlignment = Enum.TextXAlignment.Left,
	PlaceholderColor3 = FQ.COLORS.TEXT_DIM,
	BorderSizePixel = 0,
	TextWrapped = true,
	TextSize = 20,
	TextColor3 = FQ.COLORS.TEXT_MAIN,
	BackgroundColor3 = Color3.fromRGB(255,255,255),
	FontFace = FQ.FONTS.REGULAR,
	PlaceholderText = "unexpected " .. currentVersion,
	Size = UDim2.new(0, 167, 0, 54),
	Position = UDim2.new(0, 25, 0.5, -27),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Text = "",
	ClearTextOnFocus = false,
	ZIndex = 1,
	BackgroundTransparency = 1,
})

unexpected_UI.PREDICTOR = mk("TextLabel", unexpected_UI.PILL, {
	Name = "Predictor",
	TextXAlignment = Enum.TextXAlignment.Left,
	BorderSizePixel = 0,
	TextWrapped = true,
	TextSize = 20,
	TextColor3 = FQ.COLORS.STROKE,
	BackgroundColor3 = Color3.fromRGB(255,255,255),
	FontFace = FQ.FONTS.REGULAR,
	Size = UDim2.new(0, 167, 0, 54),
	Position = UDim2.new(0, 25, 0.5, -27),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Text = "",
	ZIndex = 0,
	BackgroundTransparency = 1,
})

unexpected_UI.MENU = mk("ImageButton", unexpected_UI.PILL, {
	BorderSizePixel = 0,
	BackgroundTransparency = 1,
	BackgroundColor3 = Color3.fromRGB(255,255,255),
	ImageColor3 = FQ.COLORS.ACCENT,
	Image = "rbxassetid://10734887784",
	Size = UDim2.new(0, 30, 0, 30),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Name = "Menu",
	Position = UDim2.new(0.83776, 0, 0.28169, 0),
})
CREATE_ASPECT(unexpected_UI.MENU)

unexpected_UI.MENUFRAME = mk("Frame", unexpected_UI.PILL, {
	BorderSizePixel = 0,
	BackgroundColor3 = FQ.COLORS.BACKGROUND,
	ClipsDescendants = true,
	Size = UDim2.new(0, 339, 0, 348),
	Position = UDim2.new(0.5, -169, 1, -428),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Name = "MenuFrame",
	Visible = false,
})
CREATE_CORNER(unexpected_UI.MENUFRAME, 0.1, 0)
CREATE_STROKE(unexpected_UI.MENUFRAME, FQ.COLORS.STROKE);

unexpected_UI.LABEL = mk("TextLabel", unexpected_UI.MENUFRAME, {
	TextWrapped = true,
	ZIndex = 2,
	TextSize = 25,
	TextXAlignment = Enum.TextXAlignment.Left,
	BackgroundColor3 = Color3.fromRGB(255,255,255),
	FontFace = FQ.FONTS.BOLD,
	TextColor3 = FQ.COLORS.TEXT_MAIN,
	BackgroundTransparency = 1,
	Size = UDim2.new(0,127,0,19),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Text = "menu",
	Name = "Label",
	Position = UDim2.new(0.0885,0,0.07471,0),
})

unexpected_UI.CMDS_BUTTON = mk("TextButton", unexpected_UI.MENUFRAME, {
	BorderSizePixel = 0,
	TextSize = 18,
	TextColor3 = FQ.COLORS.TEXT_MAIN,
	BackgroundColor3 = FQ.COLORS.BACKGROUND,
	FontFace = FQ.FONTS.REGULAR,
	Size = UDim2.new(0,278,0,51),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Text = "commands",
	Name = "cmdsButton",
	Visible = true,
	Position = UDim2.new(0.0885,0,0.17241,0),
})
CREATE_CORNER(unexpected_UI.CMDS_BUTTON, 0.3, 0)
CREATE_STROKE(unexpected_UI.CMDS_BUTTON, FQ.COLORS.STROKE)

unexpected_UI.DISCORD = mk("TextButton", unexpected_UI.MENUFRAME, {
	BorderSizePixel = 0,
	TextSize = 18,
	TextColor3 = FQ.COLORS.TEXT_MAIN,
	BackgroundColor3 = FQ.COLORS.BACKGROUND,
	FontFace = FQ.FONTS.REGULAR,
	Size = UDim2.new(0,278,0,51),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Text = "discord",
	Name = "discordButton",
	Visible = true,
	Position = UDim2.new(0.0885,0,0.35991,0),
})

unexpected_UI.DISCORD.MouseButton1Click:Connect(function()
	setclipboard("https://discord.gg/J73SnGB2y2")
	if typeof(httprequest) == "function" then
		httprequest({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				Origin = "https://discord.com"
			},
			Body = HS:JSONEncode({
				cmd = "INVITE_BROWSER",
				nonce = HS:GenerateGUID(false),
				args = { code = "J73SnGB2y2" }
			})
		})
	end
end)

CREATE_CORNER(unexpected_UI.DISCORD, 0.3, 0)
CREATE_STROKE(unexpected_UI.DISCORD, FQ.COLORS.STROKE)

unexpected_UI.CMDFRAME = mk("Frame", unexpected_UI.MENUFRAME, {
	BorderSizePixel = 0,
	BackgroundColor3 = Color3.fromRGB(255,255,255),
	Size = UDim2.new(0,339,0,348),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Name = "commandFrame",
	BackgroundTransparency = 1,
	Visible = false,
})

unexpected_UI.BTNLIST = mk("ScrollingFrame", unexpected_UI.CMDFRAME, {
    Active = true,
    BorderSizePixel = 0,
    CanvasSize = UDim2.new(0,0,10,0),
    BackgroundColor3 = Color3.fromRGB(255,255,255),
    Name = "buttonList",
    Size = UDim2.new(0,278,0,210),
    ScrollBarImageColor3 = FQ.COLORS.ACCENT,
    Position = UDim2.new(0.0885,0,0.32184,0),
    BorderColor3 = FQ.COLORS.BACKGROUND,
    ScrollBarThickness = 1,
    BackgroundTransparency = 1,
})

unexpected_UI.CMDEXAMPLE = mk("TextButton", nil, {
	BorderSizePixel = 0,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextSize = 18,
	TextColor3 = FQ.COLORS.TEXT_MAIN,
	BackgroundColor3 = FQ.COLORS.BACKGROUND,
	FontFace = FQ.FONTS.REGULAR,
	Size = UDim2.new(0,278,0,33),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Text = "command / command",
	Name = "commandExample",
	Visible = false,
})

unexpected_UI.CMDBACK = mk("ImageButton", unexpected_UI.CMDFRAME, {
	BorderSizePixel = 0,
	BackgroundTransparency = 1,
	BackgroundColor3 = Color3.fromRGB(255,255,255),
	ImageColor3 = FQ.COLORS.ACCENT,
	Image = "rbxassetid://10709812784",
	Size = UDim2.new(0,38,0,30),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Name = "commandBack",
	Position = UDim2.new(0.0885,0,0.82759,0),
})
CREATE_ASPECT(unexpected_UI.CMDBACK)

local unexpected = {}
local commandListData = {}
local commandListArray = {}
local commandButtonCache = {}
local _sharedTooltip = nil
local _sharedTooltipToken = 0
local _sharedTooltipConn = nil
local _btnPool = {}
local _btnMeta = setmetatable({}, { __mode = "k" })

local trieRoot = { children = {}, entries = {} }
local function trieInsert(key, entry)
	local node = trieRoot
	for i = 1, #key do
		local c = key:sub(i, i)
		if not node.children[c] then node.children[c] = { children = {}, entries = {} } end
		node = node.children[c]
		table.insert(node.entries, { key = key, entry = entry })
	end
end

function unexpected:addcmd(name, desc, func, aliases, usageArgs)
	aliases = aliases or {}
	usageArgs = usageArgs or {}

	local displayName = name
	local actualName = string.gsub(name, "^%[.-%]%s*", "")

	local entry = {
		Original = actualName,
		Description = desc,
		Execute = func,
		Aliases = aliases,
		UsageArgs = usageArgs,
		DisplayName = displayName,
	}

	entry._lowerOriginal = string.lower(actualName)
	entry._lowerAliases = {}
	for _, alias in ipairs(aliases) do table.insert(entry._lowerAliases, string.lower(alias)) end

	commandListData[entry._lowerOriginal] = entry
	for _, l in ipairs(entry._lowerAliases) do commandListData[l] = entry end

	trieInsert(entry._lowerOriginal, entry)
	for _, l in ipairs(entry._lowerAliases) do trieInsert(l, entry) end

	table.insert(commandListArray, entry)
end

local function clearcmdList()
	for _, btn in ipairs(commandButtonCache) do
		_btnMeta[btn] = nil
		btn.Visible = false
		btn.Parent = nil
		table.insert(_btnPool, btn)
	end
	commandButtonCache = {}
	unexpected_UI.BTNLIST.CanvasSize = UDim2.new(0, 0, 0, 0)
	if _sharedTooltip then _sharedTooltip.Visible = false end
end

local _fadeTargets = setmetatable({}, { __mode = "k" })
local function getfadeTargets(frame)
	local t = _fadeTargets[frame]
	if t then return t end
	t = {}
	for _, c in ipairs(frame:GetDescendants()) do
		if c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") or c:IsA("ImageLabel") or c:IsA("ImageButton") then
			table.insert(t, c)
		end
	end
	_fadeTargets[frame] = t
	return t
end

local function playTween(obj, props, time, style)
	return TS:Create(obj, TweenInfo.new(time or 0.2, style or Enum.EasingStyle.Sine), props)
end

local function showcmdList()
	clearcmdList()
	local index = 0
	local used = {}
	local BTNLIST = unexpected_UI.BTNLIST
	local CMDEXAMPLE = unexpected_UI.CMDEXAMPLE

	if not _sharedTooltip then
		_sharedTooltip = mk("TextLabel", unexpected_UI.UI, {
			BackgroundColor3 = FQ.COLORS.BACKGROUND,
			Visible = false,
			Font = Enum.Font.Gotham,
			TextColor3 = FQ.COLORS.TEXT_MAIN,
			TextSize = 18,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			ZIndex = 9999,
			AutomaticSize = Enum.AutomaticSize.XY,
			Size = UDim2.new(0,300,0,0),
			BorderSizePixel = 0,
		})
		mk("UIStroke", _sharedTooltip, { ApplyStrokeMode = Enum.ApplyStrokeMode.Border, Color = FQ.COLORS.STROKE })
		mk("UICorner", _sharedTooltip, { CornerRadius = UDim.new(0.1, 0) })
		mk("UIPadding", _sharedTooltip, { PaddingBottom = UDim.new(0,6), PaddingLeft = UDim.new(0,8), PaddingRight = UDim.new(0,8) })
		mk("UITextSizeConstraint", _sharedTooltip, { MaxTextSize = 18 })
			_localGuiInset = GS:GetGuiInset()
			_sharedTooltipConn = RS.RenderStepped:Connect(function()
				if _sharedTooltip and _sharedTooltip.Visible then
						local mousePos = UIS:GetMouseLocation() - _localGuiInset
					_sharedTooltip.Position = UDim2.new(0, mousePos.X + 10, 0, mousePos.Y + 10)
				end
			end)
	end

	for _, entry in ipairs(commandListArray) do
		if not used[entry] then
			used[entry] = true
			local btn = table.remove(_btnPool)
			if not btn then
				btn = CMDEXAMPLE:Clone()
				btn.MouseEnter:Connect(function()
					local meta = _btnMeta[btn]
					local d = meta and meta.data
					if not d or not _sharedTooltip then return end
					_sharedTooltipToken = _sharedTooltipToken + 1
					meta.myToken = _sharedTooltipToken
					_sharedTooltip.Text = tostring(d.Description) .. "\n" .. tostring(meta.usage or "")
					_sharedTooltip.Visible = true
					local mousePos = UIS:GetMouseLocation() - _localGuiInset
					_sharedTooltip.Position = UDim2.new(0, mousePos.X + 10, 0, mousePos.Y + 10)
				end)
				btn.MouseLeave:Connect(function()
					local meta = _btnMeta[btn]
					if meta and meta.myToken and meta.myToken == _sharedTooltipToken then
						if _sharedTooltip then _sharedTooltip.Visible = false end
					end
				end)
				btn.MouseButton1Click:Connect(function()
					local meta = _btnMeta[btn]
					local d = meta and meta.data
					if not d then return end
					unexpected_UI.CLI.Text = d.Original
					task.defer(function() unexpected_UI.CLI:CaptureFocus() end)
				end)
			end

			local allNames = {entry.DisplayName}
			for _, alias in ipairs(entry.Aliases) do table.insert(allNames, alias) end
			btn.Text = table.concat(allNames, " / ")
			btn.Text = table.concat(allNames, " / ")
			btn.Visible = true
			btn.Position = UDim2.new(0, 0, 0, index * 32)
			btn.Parent = BTNLIST

			_btnMeta[btn] = { data = entry, usage = ( (#entry.UsageArgs > 0) and ("usage: " .. entry.Original .. " [" .. table.concat(entry.UsageArgs, "] [") .. "]") ) or ("usage: " .. entry.Original) }

			table.insert(commandButtonCache, btn)
			index = index + 1
		end
	end
	unexpected_UI.BTNLIST.CanvasSize = UDim2.new(0, 0, 0, index * 32)
end

--#notification
local notificationQueue = {}
local isNotif = false
local notifSeq = 0
local notifUI = mk("Frame", unexpected_UI.UI, {
	Name = "Notification",
	BackgroundColor3 = FQ.COLORS.BACKGROUND,
	Position = UDim2.new(1, -378, 0.962686539, -189),
	Size = UDim2.new(0, 328, 0, 169),
	Visible = false,
})
CREATE_CORNER(notifUI, 0.2, 0)
CREATE_STROKE(notifUI, FQ.COLORS.STROKE)

local notiftitle = mk("TextLabel", notifUI, {
	Name = "Title",
	BackgroundTransparency = 1,
	Position = UDim2.new(0.088,0,0.176,0),
	Size = UDim2.new(0,250,0,25),
	Font = Enum.Font.GothamBold,
	Text = "Title",
	TextColor3 = FQ.COLORS.TEXT_MAIN,
	TextSize = 25,
	TextXAlignment = Enum.TextXAlignment.Left,
})

local notiftext = mk("TextLabel", notifUI, {
	Name = "Description",
	BackgroundTransparency = 1,
	Position = UDim2.new(0.088,0,0.36,0),
	Size = UDim2.new(0,250,0,60),
	Font = Enum.Font.Gotham,
	Text = "Description",
	TextColor3 = FQ.COLORS.TEXT_MAIN,
	TextSize = 20,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextYAlignment = Enum.TextYAlignment.Top,
})

local loadingBar = mk("Frame", notifUI, {
	Name = "Bar",
	BackgroundColor3 = Color3.fromRGB(99,99,99),
	Position = UDim2.new(0.09,0,0,0),
	Size = UDim2.new(0.82,0,0,1),
})

local notifPos = notifUI.Position

local function notifQueue()
	notifSeq = notifSeq + 1
	local mySeq = notifSeq

	if #notificationQueue == 0 then
		isNotif = false

		local fadeOutTween = playTween(notifUI, {
			BackgroundTransparency = 1,
			Position = notifPos + UDim2.new(0, 0, 0, 10),
		}, 0.25)

		for _, v in ipairs(notifUI:GetDescendants()) do
			if v:IsA("TextLabel") then
				playTween(v, {TextTransparency = 1}, 0.25):Play()
			end
		end

		fadeOutTween:Play()

		task.delay(0.3, function()
			notifUI.Visible = false
			notifUI.Position = notifPos
			notifUI.BackgroundTransparency = 0
			for _, v in ipairs(notifUI:GetDescendants()) do
				if v:IsA("TextLabel") then
					v.TextTransparency = 0
				end
			end
		end)
		return
	end

	isNotif = true
	local data = table.remove(notificationQueue, 1)

	local total = #notificationQueue + 1
	notiftitle.Text = string.format("%s (%d)", tostring(data.title), total)
	notiftext.Text = tostring(data.text)
	loadingBar.Size = UDim2.new(0.82, 0, 0, 1)
	notifUI.Visible = true

	if total == 1 then
		notifUI.BackgroundTransparency = 1
		for _, v in ipairs(notifUI:GetDescendants()) do
			if v:IsA("TextLabel") then
				v.TextTransparency = 1
			end
		end

		playTween(notifUI, {
			BackgroundTransparency = 0,
			Position = notifPos,
		}, 0.25):Play()

		for _, v in ipairs(notifUI:GetDescendants()) do
			if v:IsA("TextLabel") then
				playTween(v, {TextTransparency = 0}, 0.25):Play()
			end
		end
	end

	local barTween = playTween(loadingBar, { Size = UDim2.new(0, 0, 0, 1) }, 5, Enum.EasingStyle.Linear)
	barTween:Play()

	task.delay(5, function()
		if mySeq == notifSeq then
			notifQueue()
		end
	end)
end

function unexpected:notify(title, ...)
	local args = {...}
	local text = table.concat(args, " ")

	table.insert(notificationQueue, {
		title = tostring(title or "Notification"),
		text = text
	})

	if isNotif then
		local currentTitle = string.match(notiftitle.Text, "^(.-) %(%d+%)$") or notiftitle.Text
		notiftitle.Text = string.format("%s (%d)", currentTitle, #notificationQueue + 1)
	else
		notifQueue()
	end
end

--#inputs
unexpected_UI["CLI"]:GetPropertyChangedSignal("Text"):Connect(function()
	local input = unexpected_UI["CLI"].Text
	local cmdName = string.match(input, "^%S+") or ""
	local suggestion = ""

	if cmdName ~= "" then
		local lowerCmd = string.lower(cmdName)
		local node = trieRoot
		for i = 1, #lowerCmd do
			if not node then break end
			local c = lowerCmd:sub(i, i)
			node = node.children and node.children[c]
		end
		if node and node.entries and #node.entries > 0 then
			local bestKey, bestEntry = nil, nil
			for _, rec in ipairs(node.entries) do
				if not bestKey or rec.key < bestKey then bestKey = rec.key bestEntry = rec.entry end
			end
			if bestKey then
				local completion = string.sub(bestKey, #cmdName + 1)
				suggestion = input .. completion
			end
		end
	end

	unexpected_UI["PREDICTOR"].Text = suggestion
end)

unexpected_UI["CLI"].FocusLost:Connect(function(enterPressed)
	if enterPressed then
		local inputText = unexpected_UI["CLI"].Text
		local cmdName, argsText = string.match(inputText, "^(%S+)%s*(.*)$")
		if not cmdName then return end

		local cmd = commandListData[string.lower(cmdName)]
		if cmd then
			local args = {}
			for arg in string.gmatch(argsText, "%S+") do
				table.insert(args, arg)
			end
			cmd.Execute(table.unpack(args))
		end

		unexpected_UI["CLI"].Text = ""
		unexpected_UI["PREDICTOR"].Text = ""
	end
end)
--#inputsEnd

--#search
unexpected_UI.SEARCHBAR = mk("TextBox", unexpected_UI.CMDFRAME, {
	CursorPosition = -1,
	Name = "searchBar",
	PlaceholderColor3 = FQ.COLORS.TEXT_DIM,
	BorderSizePixel = 0,
	TextSize = 18,
	TextColor3 = FQ.COLORS.TEXT_MAIN,
	BackgroundColor3 = Color3.fromRGB(255,255,255),
	FontFace = FQ.FONTS.REGULAR,
	PlaceholderText = "search a command",
	Size = UDim2.new(0,278,0,41),
	Position = UDim2.new(0.0885,0,0.17816,0),
	BorderColor3 = FQ.COLORS.BACKGROUND,
	Text = "",
	BackgroundTransparency = 1,
})

local function updateList(filter)
	filter = string.lower(filter or "")
	local all, filtered = {}, {}

	for _, c in ipairs(unexpected_UI["BTNLIST"]:GetChildren()) do
		if c:IsA("TextButton") then table.insert(all, c) end
	end

	if filter == "" then
		for i, btn in ipairs(all) do
			btn.Visible = true
			btn.Position = UDim2.new(0, 0, 0, (i - 1) * 32)
		end
		return
	end

	local node = trieRoot
	for i = 1, #filter do
		node = node.children and node.children[filter:sub(i, i)] or nil
		if not node then break end
	end

	if node and node.entries then
		for _, rec in ipairs(node.entries) do
			for _, btn in ipairs(all) do
				if _btnMeta[btn] and _btnMeta[btn].data == rec.entry then
					table.insert(filtered, btn)
					break
				end
			end
		end
	end

	table.sort(filtered, function(a, b) return a.Text < b.Text end)

	for i, btn in ipairs(filtered) do
		btn.Position = UDim2.new(0, 0, 0, (i - 1) * 32)
		btn.Visible = true
	end

	for _, btn in ipairs(all) do
		btn.Visible = table.find(filtered, btn) ~= nil
	end
end

do
	local token = 0
	unexpected_UI["SEARCHBAR"]:GetPropertyChangedSignal("Text"):Connect(function()
		token = token + 1
		local my = token
		local txt = unexpected_UI["SEARCHBAR"].Text
		task.delay(0.12, function()
			if my == token then updateList(txt) end
		end)
	end)
end
--#searchEnd

--#utils
local configFile = "unexpected_config.json"
local defaultConfig = {
    keepUX = true,
    Plugins = {}
}

CONFIG = CONFIG or {}

local function lc()
    local config = {}
    if isfile(configFile) then
        local success, content = pcall(readfile, configFile)
        if success and content then
            local ok, parsed = pcall(function()
                return HS:JSONDecode(content)
            end)
            if ok and typeof(parsed) == "table" then
                config = parsed
            end
        end
    end
    for key, default in pairs(defaultConfig) do
        if config[key] == nil then
            config[key] = default
        end
        getgenv()[key] = config[key]
    end
    CONFIG = config
    return config
end

function UX_rconfig()
    CONFIG = lc()
    pcall(writefile, configFile, HS:JSONEncode(CONFIG))
end

function UX_config()
    if not CONFIG then CONFIG = lc() end
    pcall(writefile, configFile, HS:JSONEncode(CONFIG))
end
--#utilsEnd

--#imports
local MENU = unexpected_UI["PILL"]:FindFirstChild("Menu")
local CLI = unexpected_UI["PILL"]:FindFirstChild("CLI")
local MENUFRAME = unexpected_UI["PILL"]:WaitForChild("MenuFrame")
local LASTFOCUSED = os.clock()
local HIDDEN = false

local indicator = mk("ImageButton", unexpected_UI.PILL.Parent, {
	Size = UDim2.new(0,20,0,20),
	Position = UDim2.new(0,20,1,-40),
	BackgroundColor3 = Color3.fromRGB(80,80,80),
	Visible = false,
	ZIndex = 20,
	BorderSizePixel = 0,
})
CREATE_CORNER(indicator, 1, 0)
--#importesEnd

--#initiliaze
unexpected_UI["PILL"].AnchorPoint = Vector2.new(0.5, 0.5)
unexpected_UI["PILL"].Position = UDim2.new(0.5, 0, 1, -150)
unexpected_UI["PILL"].Visible = false
MENUFRAME.AnchorPoint = Vector2.new(0.5, 1)
MENUFRAME.Position = UDim2.new(0.5, 0, 1, -80)
MENUFRAME.Size = UDim2.new(0, 339, 0, 0)
--#initializeEnd

local MENUON, HOVERED, shithover = false, false, false
local MENUFRAMES = {
	command = MENUFRAME:WaitForChild("commandFrame")
}
local MENUS = {
	MENUFRAME:WaitForChild("cmdsButton"),
	MENUFRAME:WaitForChild("discordButton")
}

--#fadesHandler
local function buttonTP(button, target)
	local prop = button:IsA("ImageButton") and "ImageTransparency" or "TextTransparency"
	playTween(button, { [prop] = target }, 0.2, Enum.EasingStyle.Sine):Play()
end

local function fadeIn(frame)
	frame.Visible = true
	local targets = getfadeTargets(frame)
	for _, c in ipairs(targets) do
		if c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") then
			c.TextTransparency = 1
			playTween(c, { TextTransparency = 0 }):Play()
		elseif c:IsA("ImageLabel") or c:IsA("ImageButton") then
			c.ImageTransparency = 1
			playTween(c, { ImageTransparency = 0 }):Play()
		end
	end
end

local function fadeOut(frame)
	local targets = getfadeTargets(frame)
	for _, c in ipairs(targets) do
		if c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") then
			playTween(c, { TextTransparency = 1 }):Play()
		elseif c:IsA("ImageLabel") or c:IsA("ImageButton") then
			playTween(c, { ImageTransparency = 1 }):Play()
		end
	end
	task.delay(0.2, function() frame.Visible = false end)
end

RS.Heartbeat:Connect(function()
	local m = LP:GetMouse()
	local mp, pos, size = Vector2.new(m.X, m.Y), unexpected_UI["PILL"].AbsolutePosition, unexpected_UI["PILL"].AbsoluteSize
	shithover = mp.X >= pos.X and mp.X <= pos.X + size.X and mp.Y >= pos.Y and mp.Y <= pos.Y + size.Y
end)

--#lovetween
local function SHS(hovered)
	if MOBILE then
		HOVERED = true
		unexpected_UI["PILL"].Size, unexpected_UI["CLI"].Size = UDim2.new(0, 339, 0, 71), UDim2.new(0, 230, 0, 54)
		unexpected_UI["MENU"].ImageTransparency = 0
		buttonTP(MENU, 0)
		return
	end
	if MENUON and hovered then
		HOVERED = true
		playTween(unexpected_UI["PILL"], { Size = UDim2.new(0, 339, 0, 71) }, 0.25, Enum.EasingStyle.Quint):Play()
		local NS = UDim2.new(0, 230, 0, 54)
		playTween(CLI, { Size = NS }, 0.25, Enum.EasingStyle.Quint):Play()
		playTween(unexpected_UI["PREDICTOR"], { Size = NS }, 0.25, Enum.EasingStyle.Quint):Play()
		buttonTP(MENU, 0)
		return
	end
	HOVERED = hovered
	local gSize = hovered and 339 or 218
	local cSize = hovered and 230 or 167
	playTween(unexpected_UI["PILL"], { Size = UDim2.new(0, gSize, 0, 71) }, 0.25, Enum.EasingStyle.Quint):Play()
	playTween(CLI, { Size = UDim2.new(0, cSize, 0, 54) }, 0.25, Enum.EasingStyle.Quint):Play()
	buttonTP(MENU, hovered and 0 or 1)
end

unexpected_UI["PILL"].InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		shithover = true
		LASTFOCUSED = os.clock()
		SHS(true)
	end
end)

unexpected_UI["PILL"].InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		task.delay(0.05, function()
			shithover = false
			if not CLI:IsFocused() and not MENUON then SHS(false) end
		end)
	end
end)

MENU.MouseButton1Click:Connect(function()
	LASTFOCUSED = os.clock()
	MENUON = not MENUON
	if MENUON then
		MENUFRAME.Size, MENUFRAME.Visible = UDim2.new(0, 339, 0, 0), true
		playTween(unexpected_UI["PILL"], { Size = UDim2.new(0, 339, 0, 71) }, 0.25, Enum.EasingStyle.Quint):Play()
		local NS = UDim2.new(0, 230, 0, 54)
		playTween(CLI, { Size = NS }, 0.25, Enum.EasingStyle.Quint):Play()
		playTween(unexpected_UI["PREDICTOR"], { Size = NS }, 0.25, Enum.EasingStyle.Quint):Play()
		playTween(MENUFRAME, { Size = UDim2.new(0, 339, 0, 348) }, 0.25, Enum.EasingStyle.Quint):Play()
		buttonTP(MENU, 0)
	else
		local collapse = playTween(MENUFRAME, { Size = UDim2.new(0, 339, 0, 0) }, 0.25, Enum.EasingStyle.Quint)
		collapse:Play()
		collapse.Completed:Once(function()
			if not MENUON then MENUFRAME.Visible = false end
		end)
		SHS(HOVERED)
	end
end)

MENUS[1].MouseButton1Click:Connect(function()
	for _, b in ipairs(MENUS) do b.Visible = false end
	showcmdList()
	fadeIn(MENUFRAMES.command)
end)

MENUFRAMES.command:WaitForChild("commandBack").MouseButton1Click:Connect(function()
    fadeOut(MENUFRAMES.command)
    clearcmdList()
    task.delay(0.1, function() for _, b in ipairs(MENUS) do b.Visible = true end end)
end)

local function hidePILL()
	for _, c in ipairs(unexpected_UI["PILL"]:GetDescendants()) do
		if c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") then
			playTween(c, { TextTransparency = 1 }, 0.2, Enum.EasingStyle.Sine):Play()
		elseif c:IsA("ImageLabel") or c:IsA("ImageButton") then
			playTween(c, { ImageTransparency = 1 }, 0.2, Enum.EasingStyle.Sine):Play()
		end
	end
	local shrink = playTween(unexpected_UI["PILL"], { Size = UDim2.new(0, 0, 0, 0) }, 0.25, Enum.EasingStyle.Quint)
	shrink:Play()
	shrink.Completed:Once(function()
		unexpected_UI["PILL"].Visible = false
		indicator.Visible = true
	end)
end

RS.Heartbeat:Connect(function()
	if not CLI:IsFocused() and not MENUON and os.clock() - LASTFOCUSED > 5 and not HIDDEN then
		HIDDEN = true
		hidePILL()
	end
end)

local oneMenu = false
local function showPILL(yn)
	unexpected_UI["PILL"].Visible = true
	unexpected_UI["PILL"].Size = UDim2.new(0, 218, 0, 71)
	HIDDEN = false
	LASTFOCUSED = os.clock()
	indicator.Visible = false
	if MOBILE and not MENUON then SHS(true) end
	for _, c in ipairs(unexpected_UI["PILL"]:GetDescendants()) do
		if c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") then
			playTween(c, { TextTransparency = 0 }, 0.2, Enum.EasingStyle.Sine):Play()
		elseif c:IsA("ImageLabel") or c:IsA("ImageButton") then
			if not oneMenu then
				c.ImageTransparency = 1
				oneMenu = true
			elseif yn == 1 then
				playTween(c, { ImageTransparency = 0 }, 0.2, Enum.EasingStyle.Sine):Play()
			else
				c.ImageTransparency = 1
			end
		end
	end
end

indicator.MouseButton1Click:Connect(function() showPILL() end)
CLI.Focused:Connect(function() LASTFOCUSED = os.clock() end)
CLI.FocusLost:Connect(function()
	LASTFOCUSED = os.clock()
	task.delay(0.05, function()
		if not shithover and not MENUON then SHS(false) end
	end)
end)

UIS.InputBegan:Connect(function(input, processed)
	if not processed and input.KeyCode == Enum.KeyCode.Semicolon then
		task.wait(0.01)
		CLI.Text, unexpected_UI["PREDICTOR"].Text = "", ""
		CLI:CaptureFocus()
		LASTFOCUSED = os.clock()
		showPILL(1)
		if shithover or MENUON then
			unexpected_UI["PILL"].Size = UDim2.new(0, 339, 0, 71)
			CLI.Size = UDim2.new(0, 230, 0, 54)
			unexpected_UI["PREDICTOR"].Size = UDim2.new(0, 230, 0, 54)
			unexpected_UI["MENU"].ImageTransparency = 0
			buttonTP(MENU, 0)
		else
			SHS(true)
			playTween(unexpected_UI["PILL"], { Size = UDim2.new(0, 339, 0, 71) }, 0.25, Enum.EasingStyle.Quint):Play()
			local NS = UDim2.new(0, 230, 0, 54)
			playTween(CLI, { Size = NS }, 0.25, Enum.EasingStyle.Quint):Play()
			playTween(unexpected_UI["PREDICTOR"], { Size = NS }, 0.25, Enum.EasingStyle.Quint):Play()
			buttonTP(MENU, 0)
		end
	end
end)

UIS.InputEnded:Connect(function(input, processed)
	if input.KeyCode == Enum.KeyCode.Semicolon then
		HOVERED = false
		if not shithover and not MENUON and not CLI:IsFocused() then
			playTween(unexpected_UI["PILL"], { Size = UDim2.new(0, 218, 0, 71) }, 0.25, Enum.EasingStyle.Quint):Play()
			playTween(CLI, { Size = UDim2.new(0, 167, 0, 54) }, 0.25, Enum.EasingStyle.Quint):Play()
			buttonTP(MENU, 1)
		elseif MENUON then
			unexpected_UI["PILL"].Size, CLI.Size = UDim2.new(0, 339, 0, 71), UDim2.new(0, 230, 0, 54)
			buttonTP(MENU, 0)
		end
	end
end)

UX_rconfig()

--#pluginSystem
local PLUGIN_DIR = "unexpected_plugins"
if not isfolder(PLUGIN_DIR) then
    makefolder(PLUGIN_DIR)
end

if type(CONFIG.Plugins) ~= "table" then
    CONFIG.Plugins = {}
end

local function LOAD_PLUGIN(NAME)
    local PATH = string.format("%s/%s.ux", PLUGIN_DIR, NAME)
    if not isfile(PATH) then
        unexpected:notify("unexpected", ("Plugin '%s' missing, removed from config."):format(NAME))
        CONFIG.Plugins[NAME] = nil
        UX_config()
        return false
    end

    local ENV = setmetatable({ unexpected = unexpected }, { __index = getfenv() })

    local OK, RESULT = pcall(function()
        return setfenv(loadstring(readfile(PATH)), ENV)()
    end)

    if not OK then
        unexpected:notify("unexpected", ("Error in plugin '%s': %s"):format(NAME, tostring(RESULT)))
        return false
    end

    if type(RESULT) == "table" and RESULT.Commands then
        for CMD_NAME, CMD in pairs(RESULT.Commands) do
            if type(CMD.Function) == "function" then
                unexpected:addcmd(
                    CMD.ListName or CMD_NAME,
                    CMD.Description or "No description.",
                    CMD.Function,
                    CMD.Aliases or {},
                    CMD.Args or {}
                )
            end
        end
    end

    unexpected:notify("unexpected", "Loaded plugin: " .. (RESULT.PluginName or NAME))
    return true
end

for NAME, ENABLED in pairs(CONFIG.Plugins) do
    if ENABLED then
        LOAD_PLUGIN(NAME)
    end
end

unexpected:addcmd("plugin", "Add a plugin", function(NAME)
    if not NAME or NAME == "" then
        return unexpected:notify("unexpected", "Usage: plugin [name]")
    end
    if LOAD_PLUGIN(NAME) then
        CONFIG.Plugins[NAME] = true
        UX_config()
    end
end, nil, {"name"})


unexpected:addcmd("unplugin", "Remove a plugin", function(NAME)
    if not NAME or NAME == "" then
        return unexpected:notify("unexpected", "Usage: unplugin [name]")
    end
    if CONFIG.Plugins[NAME] then
        CONFIG.Plugins[NAME] = nil
        UX_config()
        unexpected:notify("unexpected", "Plugin '" .. NAME .. "' removed.")
    else
        unexpected:notify("unexpected", "Plugin '" .. NAME .. "' is not enabled.")
    end
end, nil, {"name"})
--#pluginSystemEnd

--#commands
unexpected:addcmd("discord", "Discord Server", function()
    setclipboard("https://discord.gg/J73SnGB2y2")
	if typeof(httprequest) == "function" then
		httprequest({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				Origin = "https://discord.com"
			},
			Body = HS:JSONEncode({
				cmd = "INVITE_BROWSER",
				nonce = HS:GenerateGUID(false),
				args = { code = "J73SnGB2y2" }
			})
		})
	end
end, nil, nil)


unexpected:addcmd("unexspy", "Remote spy", function()
	unexpected:notify("unexspy", "Deprecated.")
end, {"remotespy"}, nil)

unexpected:addcmd("goto", "Teleport to a player", function(targetName)
	local name = targetName:lower()
	local target
	if name == "random" then
		local t = {} for _, p in ipairs(PLRS:GetPlayers()) do if p ~= LP then t[#t+1] = p end end
		target = #t > 0 and t[math.random(#t)] or nil
	else
		for _, p in ipairs(PLRS:GetPlayers()) do
			if p.Name:lower() == name or p.DisplayName:lower() == name then target = p break end
		end
	end
	local root = target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")
	if root then HRP.CFrame = root.CFrame + Vector3.new(0, 3, 0) end
end, nil, {"playerName"})

local noclip
unexpected:addcmd("noclip", "Walk through walls", function()
    if noclip then return unexpected:notify("noclip", "Already noclipping.") end
    noclip = RS.Stepped:Connect(function()
        for _, p in ipairs(CHAR:GetDescendants()) do
            if typeof(p) == "Instance" and p:IsA("BasePart") then p.CanCollide = false end
        end
    end)
end)

unexpected:addcmd("unnoclip", "Disable noclip", function()
    if noclip then
        noclip:Disconnect()
        noclip = nil
    end
    for _, p in ipairs(CHAR:GetDescendants()) do
        if typeof(p) == "Instance" and p:IsA("BasePart") then p.CanCollide = true end
    end
end, {"clip"}, nil)

unexpected:addcmd("reset", "Resets your character", function()
    CHAR:BreakJoints()
end)

unexpected:addcmd("clearhats", "Removes all hats", function()
    for _, item in ipairs(CHAR:GetChildren()) do
        if item:IsA("Accessory") then
            item:Destroy()
        end
    end
end)

unexpected:addcmd("pos", "Prints your position", function()
    unexpected:notify("position", tostring(HRP.Position))
end)

unexpected:addcmd("platformstand", "Toggles PlatformStand", function()
    HUM.PlatformStand = not HUM.PlatformStand
end)

unexpected:addcmd("resetcam", "Resets the camera to your character", function()
    WS.CurrentCamera.CameraSubject = HUM
end)

unexpected:addcmd("flip", "Flips your character upside down", function()
    if HRP then
        HRP.CFrame = HRP.CFrame * CFrame.Angles(math.pi, 0, 0)
    end
end)

unexpected:addcmd("glide", "Enable glide mode", function()
    HUM.JumpPower = 0
    HUM.AutoRotate = false
    local sv = Instance.new("BodyVelocity")
    sv.Name = "GlideVelocity"
    sv.MaxForce = Vector3.new(0, math.huge, 0)
    sv.Velocity = Vector3.new(0, -10, 0)
    sv.Parent = HRP
end)

unexpected:addcmd("unglide", "Disable glide mode", function()
    local glide = HRP:FindFirstChild("GlideVelocity")
    if glide then glide:Destroy() end
    HUM.JumpPower = 50
    HUM.AutoRotate = true
end)

unexpected:addcmd("iceslide", "Slide around with low friction", function()
    for _, part in ipairs(CHAR:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CustomPhysicalProperties = PhysicalProperties.new(0.1, 0.3, 0.5)
        end
    end
end)

unexpected:addcmd("uniceslide", "Restore normal walking friction", function()
    for _, part in ipairs(CHAR:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
        end
    end
end)

unexpected:addcmd("walkspeed", "Set your walkspeed", function(speed)
    HUM.WalkSpeed = tonumber(speed) or 16
end, nil, {"speed"})

unexpected:addcmd("jumppower", "Set your jumppower", function(power)
    HUM.JumpPower = tonumber(power) or 50
end, nil, {"power"})

unexpected:addcmd("sit", "Force sit", function()
    HUM.Sit = true
end)

unexpected:addcmd("stand", "Force stand", function()
    HUM.Sit = false
    HUM:ChangeState(Enum.HumanoidStateType.GettingUp)
end, {"unsit"}, nil)

local spinning, spinConnection = false, nil
unexpected:addcmd("spin", "Spin your character", function(speed)
    speed = tonumber(speed) or 5
    if spinning and spinConnection then return end
    spinning = true
    spinConnection = RS.Heartbeat:Connect(function()
        if HRP then
            HRP.CFrame = HRP.CFrame * CFrame.Angles(0, math.rad(speed), 0)
        end
    end)
    task.delay(10, function()
        if spinning and spinConnection then
            spinConnection:Disconnect()
            spinConnection = nil
            spinning = false
        end
    end)
end, nil, {"speed"})

unexpected:addcmd("unspin", "Stop spinning your character", function()
    if spinConnection then
        spinConnection:Disconnect()
        spinConnection = nil
    end
    spinning = false
end)

unexpected:addcmd("stun", "Freezes your character (PlatformStand)", function()
    HUM.PlatformStand = true
end)

unexpected:addcmd("unstun", "Remove fake stun", function()
    HUM.PlatformStand = false
end)

unexpected:addcmd("jump", "Forces local jump", function()
    HUM:ChangeState(Enum.HumanoidStateType.Jumping)
end)

unexpected:addcmd("state", "Set HumanoidState", function(args)
    local input = args[1]
    if not input then return end
    input = input:upper()
    for _, state in ipairs(Enum.HumanoidStateType:GetEnumItems()) do
        if state.Name:upper() == input then
            HUM:ChangeState(state)
            return
        end
    end
end)

unexpected:addcmd("[CLIENT] freeze", "Freeze character", function()
    for _, p in ipairs(CHAR:GetChildren()) do
        if p:IsA("BasePart") then
            p.Anchored = true
        end
    end
end)

unexpected:addcmd("[CLIENT] unfreeze", "Unfreeze your character", function()
    for _, p in ipairs(CHAR:GetChildren()) do
        if p:IsA("BasePart") then
            p.Anchored = false
        end
    end
end)

unexpected:addcmd("print", "Prints all arguments", function(...) 
    print(...) 
end, {"echo", "say"}, {"..."})

unexpected:addcmd("notify", "Notify all arguments", function(...) 
    unexpected:notify("unexpected", ...)
end, nil, {"..."})

unexpected:addcmd("cmds", "Shows commands", function()
	unexpected:notify("unexpected", "Check the menu.")
end)

unexpected:addcmd("rejoin", "Rejoins the current server", function()
    TPS:Teleport(game.PlaceId, LP)
end)

unexpected:addcmd("keepUX", "Keep 'unexpected' running even on rejoin", function(state)
	state = typeof(state) == "string" and state:lower() or ""
	if state == "true" then
		getgenv().keepUX = true
	elseif state == "false" then
		getgenv().keepUX = false
	else
		unexpected:notify("keepUX", "Usage: keepUX true/false")
		return
	end
	UX_config()
	unexpected:notify("keepUX", "Now set to:", tostring(getgenv().keepUX))
end, nil, {"true/false"})

local flying, flyConnA, flyConnB = false, nil, nil
unexpected:addcmd("fly", "Enable flying", function(spd)
	if flying then return unexpected:notify("flying", "Unfly first before changing speed") end
	spd, flying = tonumber(spd) or 3, true

	HUM.PlatformStand = true
	bv, bg = Instance.new("BodyVelocity", HRP), Instance.new("BodyGyro", HRP)
	bv.MaxForce, bg.MaxTorque, bg.P = Vector3.one * 1e6, Vector3.one * 1e6, 1e4

	local input = {w = 0, s = 0, a = 0, d = 0, up = 0, down = 0}

	if MOBILE then
		HUM.StateChanged:Connect(function(_, state)
			if state == Enum.HumanoidStateType.Jumping then
				input.up = 1
				task.delay(0.3, function() input.up = 0 end)
			end
		end)
	else
		local function set(k, v)
			if k == Enum.KeyCode.W then input.w = v elseif k == Enum.KeyCode.S then input.s = -v
			elseif k == Enum.KeyCode.A then input.a = -v elseif k == Enum.KeyCode.D then input.d = v
			elseif k == Enum.KeyCode.Space then input.up = v elseif k == Enum.KeyCode.LeftShift then input.down = -v end
		end
		flyConnA = UIS.InputBegan:Connect(function(i, g) if not g then set(i.KeyCode, 1) end end)
		flyConnB = UIS.InputEnded:Connect(function(i) set(i.KeyCode, 0) end)
	end

	task.spawn(function()
		while flying and HRP and CAM do
			task.wait()
			local move = MOBILE and HUM.MoveDirection + Vector3.new(0, input.up, 0)
				or Vector3.new(input.a + input.d, input.up + input.down, -(input.w + input.s))
			bv.Velocity = move.Magnitude > 0 and CAM.CFrame:VectorToWorldSpace(move.Unit) * spd * 10 or Vector3.zero
			bg.CFrame = CAM.CFrame
			HUM:ChangeState(Enum.HumanoidStateType.FallingDown)
		end
	end)
end, nil, {"speed"})

unexpected:addcmd("unfly", "Disable flying", function()
	flying = false
	HUM.PlatformStand = false
	if flyConnA then flyConnA:Disconnect() flyConnA = nil end
	if flyConnB then flyConnB:Disconnect() flyConnB = nil end
	for _, inst in ipairs({bv, bg}) do if inst and inst.Destroy then inst:Destroy() end end
	task.wait()
	HUM:ChangeState(Enum.HumanoidStateType.Jumping)
end)

local afConn, lastSafe, count = nil, nil, 0
unexpected:addcmd("antifling", "Stops flings via velocity detection", function()
	if afConn then return end
	afConn = RS.Heartbeat:Connect(function()
		local lv, av = HRP.AssemblyLinearVelocity, HRP.AssemblyAngularVelocity
		if lv.Magnitude > 250 or av.Magnitude > 250 then
			count += 1
			if count >= 2 then
				HRP.AssemblyLinearVelocity = Vector3.zero
				HRP.AssemblyAngularVelocity = Vector3.zero
				if lastSafe then HRP.CFrame = lastSafe end
				count = 0
			end
		else
			count = 0
			if lv.Magnitude < 10 and av.Magnitude < 10 then
				lastSafe = HRP.CFrame
			end
		end
	end)
end)

unexpected:addcmd("unantifling", "Disables fling protection", function()
    if afConn then afConn:Disconnect() afConn = nil end
end)

local banging, conn = false
unexpected:addcmd("bang", "Bang someone", function(name, speedArg)
	if banging then return end
	local target = table.find(PLRS:GetPlayers(), function(p)
		local n = name:lower()
		return p.Name:lower() == n or p.DisplayName:lower() == n
	end)
	if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

	local speed, thrp = tonumber(speedArg) or 5, target.Character.HumanoidRootPart
	local t, inwards = 0, true
	banging = true

	conn = RS.Heartbeat:Connect(function(dt)
	
		if not banging then conn:Disconnect() conn = nil return end
		local lv = thrp.CFrame.LookVector.Unit
		local back = thrp.Position - lv * 2
		local front = thrp.Position - lv
		local cf = CFrame.new(inwards and front or back, thrp.Position)

		t = math.min(t + dt * speed, 1)
		HRP.CFrame = HRP.CFrame:Lerp(cf, t)
		if t >= 1 then inwards = not inwards t = 0 end
	end)
end)

unexpected:addcmd("unbang", "Stop banging", function()
	banging = false
	conn = conn and conn:Disconnect()
end)

unexpected:addcmd("antiafk", "Never get kicked", function()
    LP.Idled:Connect(function()
        VU:ClickButton2(Vector2.new())
    end)
end)

unexpected:addcmd("execute", "Execute code", function(...)
    loadstring(...)()
end, nil, {...})

--#locales
UX_rconfig()
showPILL()

if MOBILE then
    SHS(true)
    unexpected_UI["PILL"].Size = UDim2.fromOffset(339, 71)
    unexpected_UI["CLI"].Size = UDim2.fromOffset(230, 54)
    unexpected_UI["MENU"].ImageTransparency = 0
end

local tpCHECK = false
LP.OnTeleport:Connect(function(State)
	if getgenv().keepUX and not tpCHECK and queueteleport then
		tpCHECK = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/audio-wav/unexpected-g2/refs/heads/main/source'))()")
	end
end)

task.spawn(function()
    local success, result = pcall(function() return HS:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/audio-wav/unexpected-g2/refs/heads/main/version")) end)
    if success and typeof(result) == "table" then
        if result.version ~= currentVersion then
            unexpected:notify("unexpected", "You are using an old version (current: " .. currentVersion .. ", latest: " .. result.version .. ")")
        end
        if result.shout ~= "" then
            unexpected:notify("unexpected", result.shout)
        end
    end
end)
--#localesEnd
