--[[
	Purpa UI Library - Prototype V0.3.2 Custom Tabs / Remove API

	Simple Roblox Lua UI library for script creators.
	Create windows, tabs, sections, labels, buttons, toggles, sliders,
	textboxes, dropdowns, keybinds and notifications with short commands.

	HOW TO USE:

	local PUI = loadstring(game:HttpGet("OFFICIAL_PURPA_UI_LINK"))()

	local Window = PUI:CreateWindow({
		Title = "My Hub",
		Subtitle = "Made with Purpa UI",
		Theme = "Graphite"
	})

	local Main = Window:Tab("Main")

	Main:Button("Normal Button", function()
		print("Clicked")
	end)

	Main:Button({
		Text = "Custom Button",
		Height = 52,
		Color = Color3.fromRGB(255, 120, 80),
		HoverColor = Color3.fromRGB(255, 150, 110),
		TextColor = Color3.fromRGB(255, 255, 255),
		TextSize = 15,
		Corner = 12,
	}, function()
		print("Custom clicked")
	end)

	Main:Toggle("Auto Farm", false, function(value)
		print(value)
	end)

	Main:Slider("Speed", 16, 100, 25, function(value)
		print(value)
	end)

	BASIC SYNTAX:

	PUI:CreateWindow({Title = "My Hub", Theme = "Graphite"})
	Window:Tab("Tab Name")
	Tab:Label("Text")
	Tab:Button("Name", function() end)
	Tab:Button({Text = "Name", Color = Color3.fromRGB(...)}, function() end)
	Tab:Toggle("Name", false, function(value) end)
	Tab:Slider("Name", min, max, default, function(value) end)
	Tab:TextBox("Name", "Placeholder", function(text) end)
	Tab:Dropdown("Name", {"A", "B"}, "A", function(selected) end)
	Tab:Section("Section Name")
	Tab:Separator()
	Tab:Paragraph("Title", "Text")
	Tab:Keybind("Open Menu", Enum.KeyCode.RightShift, function(key) end)
	Window:Notify("Title", "Message", "success", 3)

	EASY API ALIASES:

	Window:AddTab("Tab Name")
	Tab:AddLabel("Text")
	Tab:AddButton("Name", function() end)
	Tab:AddToggle("Name", false, function(value) end)
	Tab:AddSlider("Name", min, max, default, function(value) end)
	Tab:AddTextBox("Name", "Placeholder", function(text) end)
	Tab:AddDropdown("Name", {"A", "B"}, "A", function(selected) end)
	Tab:AddSection("Section Name")
	Tab:AddSeparator()
	Tab:AddParagraph("Title", "Text")
	Tab:AddKeybind("Name", Enum.KeyCode.RightShift, function(key) end)

	Both styles work:
	Main:Button(...) and Main:AddButton(...)

	THEMES:

	Graphite, Midnight, Professional, Dark, White, Red, Orange, Yellow, Green, Cyan, Blue, Purple, Pink, Rainbow

	NOTES:

	- If you only load the library and add nothing below it,
	  Purpa UI will show a small help window.
	- Fixed helper naming conflict: addCorner/addStroke/addPadding.
	- Default style is more professional / less childish.
	- Purpa UI checks only its own API usage.
	- It does not touch or check your other script logic.
]]

local PurpaUI = {}
PurpaUI.__index = PurpaUI

PurpaUI._Internal = {
	WindowCreated = false,
	ElementCount = 0,
	HelpShown = false,
	Warnings = {},
	Version = "0.3.1",
}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Themes = {

	Graphite = {
		Background = Color3.fromRGB(14, 15, 18),
		Second = Color3.fromRGB(22, 24, 29),
		Third = Color3.fromRGB(31, 34, 40),
		Accent = Color3.fromRGB(88, 130, 190),
		Text = Color3.fromRGB(238, 240, 245),
		SubText = Color3.fromRGB(145, 150, 160),
		Error = Color3.fromRGB(210, 75, 85),
		Success = Color3.fromRGB(80, 185, 125),
	},

	Midnight = {
		Background = Color3.fromRGB(10, 12, 20),
		Second = Color3.fromRGB(17, 20, 32),
		Third = Color3.fromRGB(25, 30, 45),
		Accent = Color3.fromRGB(95, 125, 210),
		Text = Color3.fromRGB(240, 243, 255),
		SubText = Color3.fromRGB(145, 153, 175),
		Error = Color3.fromRGB(220, 80, 95),
		Success = Color3.fromRGB(85, 190, 135),
	},

	Professional = {
		Background = Color3.fromRGB(17, 17, 19),
		Second = Color3.fromRGB(26, 26, 30),
		Third = Color3.fromRGB(35, 35, 41),
		Accent = Color3.fromRGB(110, 120, 135),
		Text = Color3.fromRGB(245, 245, 247),
		SubText = Color3.fromRGB(155, 155, 165),
		Error = Color3.fromRGB(205, 80, 80),
		Success = Color3.fromRGB(90, 175, 120),
	},

	Dark = {Background=Color3.fromRGB(18,18,26),Second=Color3.fromRGB(25,25,36),Third=Color3.fromRGB(32,32,46),Accent=Color3.fromRGB(120,120,255),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(170,170,185),Error=Color3.fromRGB(255,90,90),Success=Color3.fromRGB(90,220,130)},
	White = {Background=Color3.fromRGB(235,235,245),Second=Color3.fromRGB(250,250,255),Third=Color3.fromRGB(220,220,235),Accent=Color3.fromRGB(80,120,255),Text=Color3.fromRGB(25,25,35),SubText=Color3.fromRGB(80,80,95),Error=Color3.fromRGB(230,70,80),Success=Color3.fromRGB(50,180,100)},
	Red = {Background=Color3.fromRGB(25,16,18),Second=Color3.fromRGB(40,24,28),Third=Color3.fromRGB(58,32,38),Accent=Color3.fromRGB(255,80,95),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(210,175,180),Error=Color3.fromRGB(255,70,70),Success=Color3.fromRGB(100,230,150)},
	Orange = {Background=Color3.fromRGB(28,20,14),Second=Color3.fromRGB(44,30,20),Third=Color3.fromRGB(64,42,26),Accent=Color3.fromRGB(255,145,60),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(220,190,160),Error=Color3.fromRGB(255,85,85),Success=Color3.fromRGB(110,230,150)},
	Yellow = {Background=Color3.fromRGB(26,24,14),Second=Color3.fromRGB(40,36,20),Third=Color3.fromRGB(60,54,28),Accent=Color3.fromRGB(255,220,70),Text=Color3.fromRGB(255,255,245),SubText=Color3.fromRGB(220,210,165),Error=Color3.fromRGB(255,90,80),Success=Color3.fromRGB(110,230,140)},
	Green = {Background=Color3.fromRGB(14,24,18),Second=Color3.fromRGB(22,38,28),Third=Color3.fromRGB(30,56,40),Accent=Color3.fromRGB(80,220,120),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(170,215,185),Error=Color3.fromRGB(255,85,90),Success=Color3.fromRGB(90,240,140)},
	Cyan = {Background=Color3.fromRGB(12,22,25),Second=Color3.fromRGB(20,36,42),Third=Color3.fromRGB(28,52,60),Accent=Color3.fromRGB(70,230,230),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(170,220,225),Error=Color3.fromRGB(255,90,90),Success=Color3.fromRGB(100,230,160)},
	Blue = {Background=Color3.fromRGB(14,18,28),Second=Color3.fromRGB(22,30,46),Third=Color3.fromRGB(30,42,64),Accent=Color3.fromRGB(80,155,255),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(170,190,215),Error=Color3.fromRGB(255,90,90),Success=Color3.fromRGB(90,220,150)},
	Purple = {Background=Color3.fromRGB(20,16,30),Second=Color3.fromRGB(31,24,48),Third=Color3.fromRGB(42,32,66),Accent=Color3.fromRGB(170,95,255),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(190,175,210),Error=Color3.fromRGB(255,90,120),Success=Color3.fromRGB(100,230,155)},
	Pink = {Background=Color3.fromRGB(28,16,26),Second=Color3.fromRGB(44,24,42),Third=Color3.fromRGB(64,34,60),Accent=Color3.fromRGB(255,100,190),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(225,175,210),Error=Color3.fromRGB(255,80,110),Success=Color3.fromRGB(100,230,150)},
	Rainbow = {Background=Color3.fromRGB(18,18,28),Second=Color3.fromRGB(26,26,40),Third=Color3.fromRGB(36,36,56),Accent=Color3.fromRGB(255,95,170),Text=Color3.fromRGB(255,255,255),SubText=Color3.fromRGB(200,200,220),Error=Color3.fromRGB(255,75,90),Success=Color3.fromRGB(100,240,150),Rainbow=true,RainbowColors={Color3.fromRGB(255,80,90),Color3.fromRGB(255,150,60),Color3.fromRGB(255,230,70),Color3.fromRGB(80,230,120),Color3.fromRGB(70,230,230),Color3.fromRGB(80,150,255),Color3.fromRGB(180,90,255),Color3.fromRGB(255,100,200)}}
}

local function puiWarn(message)
	message = tostring(message or "Unknown warning")
	table.insert(PurpaUI._Internal.Warnings, message)
	warn("[PurpaUI] " .. message)
end

local function validateCallback(name, callback, required)
	if callback == nil and not required then return true end
	if type(callback) ~= "function" then
		puiWarn(name .. " callback should be a function.")
		return false
	end
	return true
end

local function validateText(name, value, fallback)
	if value == nil or tostring(value) == "" then
		puiWarn(name .. " is empty. Using fallback: " .. tostring(fallback))
		return fallback
	end
	return tostring(value)
end

local function create(className, props, parent)
	local obj = Instance.new(className)
	for key, value in pairs(props or {}) do obj[key] = value end
	if parent then obj.Parent = parent end
	return obj
end

local function addCorner(parent, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 8)
	c.Parent = parent
	return c
end

local function addStroke(parent, color, thickness, transparency)
	local s = Instance.new("UIStroke")
	s.Color = color
	s.Thickness = thickness or 1
	s.Transparency = transparency or 0
	s.Parent = parent
	return s
end

local function addPadding(parent, l, r, t, b)
	local p = Instance.new("UIPadding")
	p.PaddingLeft = UDim.new(0, l or 0)
	p.PaddingRight = UDim.new(0, r or 0)
	p.PaddingTop = UDim.new(0, t or 0)
	p.PaddingBottom = UDim.new(0, b or 0)
	p.Parent = parent
	return p
end

local function tween(obj, info, props)
	if not obj then return nil end
	local tw = TweenService:Create(obj, info or TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props)
	tw:Play()
	return tw
end

local function safeCallback(callback, ...)
	if type(callback) ~= "function" then return end
	local ok, err = pcall(callback, ...)
	if not ok then warn("[PurpaUI] Callback error:", err) end
end

local function getTheme(name)
	return Themes[name or "Graphite"] or Themes.Graphite or Themes.Dark
end

local function cloneTheme(theme)
	local newTheme = {}
	for key, value in pairs(theme) do newTheme[key] = value end
	return newTheme
end

local function applyThemeOverrides(theme, custom)
	if type(custom) ~= "table" then return theme end
	local result = cloneTheme(theme)
	for key, value in pairs(custom) do
		if typeof(value) == "Color3" or type(value) == "boolean" or type(value) == "table" then
			result[key] = value
		end
	end
	return result
end

local function normalizeButtonArgs(textOrConfig, callback)
	local cfg = {}
	if type(textOrConfig) == "table" then
		cfg = textOrConfig
		callback = callback or cfg.Callback or cfg.OnClick or cfg.Click
	else
		cfg.Text = textOrConfig
	end
	cfg.Text = tostring(cfg.Text or cfg.Name or "Button")
	cfg.Height = tonumber(cfg.Height or cfg.SizeY or 44) or 44
	cfg.Color = cfg.Color or cfg.BackgroundColor or nil
	cfg.HoverColor = cfg.HoverColor or nil
	cfg.TextColor = cfg.TextColor or nil
	cfg.TextSize = tonumber(cfg.TextSize or 14) or 14
	cfg.Font = cfg.Font or Enum.Font.GothamBold
	cfg.Corner = tonumber(cfg.Corner or cfg.Round or 8) or 8
	cfg.StrokeColor = cfg.StrokeColor
	cfg.StrokeTransparency = cfg.StrokeTransparency
	cfg.StrokeThickness = cfg.StrokeThickness
	cfg.LayoutOrder = cfg.LayoutOrder
	cfg.Align = cfg.Align or Enum.TextXAlignment.Center
	return cfg, callback
end

local function normalizeToggleArgs(textOrConfig, default, callback)
	local cfg = {}
	if type(textOrConfig) == "table" then
		cfg = textOrConfig
		default = cfg.Default
		callback = callback or cfg.Callback or cfg.OnChanged or cfg.Changed
	else
		cfg.Text = textOrConfig
	end
	cfg.Text = tostring(cfg.Text or cfg.Name or "Toggle")
	cfg.Height = tonumber(cfg.Height or 44) or 44
	cfg.Default = default == true
	cfg.Color = cfg.Color or nil
	cfg.OffColor = cfg.OffColor or nil
	cfg.TextColor = cfg.TextColor or nil
	cfg.TextSize = tonumber(cfg.TextSize or 14) or 14
	cfg.Font = cfg.Font or Enum.Font.GothamBold
	cfg.Corner = tonumber(cfg.Corner or 10) or 10
	return cfg, callback
end

local function normalizeSliderArgs(textOrConfig, min, max, default, callback)
	local cfg = {}
	if type(textOrConfig) == "table" then
		cfg = textOrConfig
		min = cfg.Min
		max = cfg.Max
		default = cfg.Default
		callback = callback or cfg.Callback or cfg.OnChanged or cfg.Changed
	else
		cfg.Text = textOrConfig
	end
	cfg.Text = tostring(cfg.Text or cfg.Name or "Slider")
	cfg.Min = tonumber(min) or 0
	cfg.Max = tonumber(max) or 100
	cfg.Default = tonumber(default) or cfg.Min
	cfg.Height = tonumber(cfg.Height or 58) or 58
	cfg.Color = cfg.Color or nil
	cfg.TextColor = cfg.TextColor or nil
	cfg.TextSize = tonumber(cfg.TextSize or 14) or 14
	cfg.Font = cfg.Font or Enum.Font.GothamBold
	cfg.Decimals = tonumber(cfg.Decimals or 0) or 0
	return cfg, callback
end

local function roundNumber(num, decimals)
	local mult = 10 ^ (decimals or 0)
	return math.floor(num * mult + 0.5) / mult
end

local function showGettingStartedHelp()
	if PurpaUI._Internal.HelpShown or PurpaUI._Internal.WindowCreated then return end
	PurpaUI._Internal.HelpShown = true
	local old = PlayerGui:FindFirstChild("PurpaUI_GettingStarted")
	if old then old:Destroy() end
	local gui = create("ScreenGui", {Name="PurpaUI_GettingStarted", IgnoreGuiInset=true, ResetOnSpawn=false, DisplayOrder=999999}, PlayerGui)
	local dim = create("Frame", {Size=UDim2.new(1,0,1,0), BackgroundColor3=Color3.fromRGB(0,0,0), BackgroundTransparency=0.35, BorderSizePixel=0}, gui)
	local frame = create("Frame", {AnchorPoint=Vector2.new(0.5,0.5), Size=UDim2.fromOffset(560,360), Position=UDim2.new(0.5,0,0.5,0), BackgroundColor3=Color3.fromRGB(18,18,28), BorderSizePixel=0}, dim)
	local scale = create("UIScale", {}, frame)
	local cam = workspace.CurrentCamera
	if cam then local v = cam.ViewportSize; scale.Scale = math.clamp(math.min(v.X/650, v.Y/430), 0.65, 1) end
	addCorner(frame,14); addStroke(frame, Color3.fromRGB(170,95,255), 1, 0.25)
	create("TextLabel", {Size=UDim2.new(1,-30,0,42), Position=UDim2.fromOffset(15,12), BackgroundTransparency=1, Text="Purpa UI loaded, but nothing was added", TextColor3=Color3.fromRGB(255,255,255), Font=Enum.Font.GothamBlack, TextSize=20, TextXAlignment=Enum.TextXAlignment.Left}, frame)
	create("TextLabel", {Size=UDim2.new(1,-30,0,230), Position=UDim2.fromOffset(15,62), BackgroundTransparency=1, TextColor3=Color3.fromRGB(220,220,235), Font=Enum.Font.Code, TextSize=14, TextWrapped=true, TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top, Text=[[You loaded the library, but did not create a window.

Use this below the loadstring:

local Window = PUI:CreateWindow({
    Title = "My Hub",
    Theme = "Graphite"
})

local Main = Window:Tab("Main")

Main:Button("Click Me", function()
    print("Clicked")
end)]],}, frame)
	local close = create("TextButton", {Size=UDim2.fromOffset(150,38), Position=UDim2.new(0.5,-75,1,-52), BackgroundColor3=Color3.fromRGB(170,95,255), BorderSizePixel=0, Text="Got it", TextColor3=Color3.fromRGB(255,255,255), Font=Enum.Font.GothamBold, TextSize=15}, frame)
	addCorner(close,9)
	close.MouseButton1Click:Connect(function() gui:Destroy() end)
	frame.BackgroundTransparency = 1
	TweenService:Create(frame, TweenInfo.new(0.18), {BackgroundTransparency=0}):Play()
end

local Window = {}; Window.__index = Window
local Tab = {}; Tab.__index = Tab

function PurpaUI:CreateWindow(config)
	PurpaUI._Internal.WindowCreated = true
	config = config or {}
	local selectedTheme = applyThemeOverrides(getTheme(config.Theme), config.Colors or config.ThemeColors)
	local title = config.Title or "Purpa UI"
	local subtitle = config.Subtitle or "Prototype V0.2.1"
	local size = config.Size or UDim2.fromOffset(640, 420)
	local old = PlayerGui:FindFirstChild("PurpaUILibrary")
	if old and config.AllowMultiple ~= true then old:Destroy() end
	local gui = create("ScreenGui", {Name=config.Name or "PurpaUILibrary", IgnoreGuiInset=true, ResetOnSpawn=false, DisplayOrder=config.DisplayOrder or 99999}, PlayerGui)
	local main = create("Frame", {AnchorPoint=Vector2.new(0.5,0.5), Position=config.Position or UDim2.new(0.5,0,0.5,0), Size=size, BackgroundColor3=selectedTheme.Background, BackgroundTransparency=config.BackgroundTransparency or 0, BorderSizePixel=0}, gui)
	addCorner(main, config.Corner or 10)
	local mainStroke = addStroke(main, selectedTheme.Accent, 1, 0.58)
	local scale = create("UIScale", {}, main)
	local topbarHeight = config.TopbarHeight or 56
	local topbar = create("Frame", {Size=UDim2.new(1,0,0,topbarHeight), BackgroundColor3=selectedTheme.Second, BorderSizePixel=0}, main)
	addCorner(topbar, config.Corner or 10)
	local titleLabel = create("TextLabel", {Size=UDim2.new(1,-120,0,26), Position=UDim2.fromOffset(16,7), BackgroundTransparency=1, Text=title, TextColor3=selectedTheme.Text, Font=config.TitleFont or Enum.Font.GothamBlack, TextSize=config.TitleSize or 20, TextXAlignment=Enum.TextXAlignment.Left}, topbar)
	local subtitleLabel = create("TextLabel", {Size=UDim2.new(1,-120,0,20), Position=UDim2.fromOffset(16,32), BackgroundTransparency=1, Text=subtitle, TextColor3=selectedTheme.SubText, Font=config.SubtitleFont or Enum.Font.Gotham, TextSize=config.SubtitleSize or 13, TextXAlignment=Enum.TextXAlignment.Left}, topbar)
	local minimizeButton = create("TextButton", {Size=UDim2.fromOffset(34,32), Position=UDim2.new(1,-82,0,12), BackgroundColor3=selectedTheme.Third, BorderSizePixel=0, Text="-", TextColor3=selectedTheme.Text, Font=Enum.Font.GothamBold, TextSize=20, AutoButtonColor=false}, topbar)
	addCorner(minimizeButton, 8)
	local closeButton = create("TextButton", {Size=UDim2.fromOffset(34,32), Position=UDim2.new(1,-42,0,12), BackgroundColor3=selectedTheme.Error, BorderSizePixel=0, Text="X", TextColor3=Color3.fromRGB(255,255,255), Font=Enum.Font.GothamBold, TextSize=14, AutoButtonColor=false}, topbar)
	addCorner(closeButton, 8)
	local tabWidth = config.TabWidth or 160
	local tabList = create("Frame", {Size=UDim2.new(0,tabWidth,1,-70), Position=UDim2.fromOffset(12,62), BackgroundColor3=selectedTheme.Second, BorderSizePixel=0}, main)
	addCorner(tabList, config.PanelCorner or 9); addPadding(tabList, 8, 8, 8, 8)
	create("UIListLayout", {Padding=UDim.new(0,7), SortOrder=Enum.SortOrder.LayoutOrder}, tabList)
	local pages = create("Frame", {Size=UDim2.new(1,-tabWidth-30,1,-70), Position=UDim2.fromOffset(tabWidth+20,62), BackgroundColor3=selectedTheme.Second, BorderSizePixel=0}, main)
	addCorner(pages, config.PanelCorner or 9)
	local notificationHolder = create("Frame", {AnchorPoint=Vector2.new(1,1), Position=UDim2.new(1,-18,1,-18), Size=UDim2.fromOffset(310,300), BackgroundTransparency=1}, gui)
	create("UIListLayout", {Padding=UDim.new(0,8), SortOrder=Enum.SortOrder.LayoutOrder, VerticalAlignment=Enum.VerticalAlignment.Bottom}, notificationHolder)
	local mobileButton = create("TextButton", {Size=UDim2.fromOffset(54,54), Position=UDim2.new(0,18,0.5,-27), BackgroundColor3=selectedTheme.Accent, BorderSizePixel=0, Text=config.MobileButtonText or "PUI", TextColor3=selectedTheme.Text, Font=Enum.Font.GothamBlack, TextSize=14, AutoButtonColor=false, Visible=config.MobileButton ~= false and UserInputService.TouchEnabled}, gui)
	addCorner(mobileButton, 999)
	local self = setmetatable({Gui=gui, Main=main, Topbar=topbar, TabList=tabList, Pages=pages, Theme=selectedTheme, Tabs={}, CurrentTab=nil, Scale=scale, NotificationHolder=notificationHolder, MobileButton=mobileButton, Minimized=false, Closed=false, Config=config, _MainStroke=mainStroke, _TitleLabel=titleLabel, _SubtitleLabel=subtitleLabel}, Window)
	if selectedTheme.Rainbow == true then self:_StartRainbow() end
	local function autoScale()
		local cam = workspace.CurrentCamera; if not cam then return end
		local viewport = cam.ViewportSize
		local sx = viewport.X / 760; local sy = viewport.Y / 520
		scale.Scale = math.clamp(math.min(sx, sy), config.MinScale or 0.62, config.MaxScale or 1)
	end
	autoScale()
	self._scaleConnection = RunService.RenderStepped:Connect(function()
		if not gui.Parent then if self._scaleConnection then self._scaleConnection:Disconnect() end return end
		autoScale()
	end)
	local dragging = false; local dragStart; local startPos
	topbar.InputBegan:Connect(function(input)
		if config.Draggable == false then return end
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = true; dragStart = input.Position; startPos = main.Position end
	end)
	topbar.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging = false end
	end)
	self._dragConnection = UserInputService.InputChanged:Connect(function(input)
		if not dragging then return end
		if input.UserInputType ~= Enum.UserInputType.MouseMovement and input.UserInputType ~= Enum.UserInputType.Touch then return end
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X / scale.Scale, startPos.Y.Scale, startPos.Y.Offset + delta.Y / scale.Scale)
	end)
	minimizeButton.MouseButton1Click:Connect(function() self:Toggle() end)
	mobileButton.MouseButton1Click:Connect(function() self:Toggle() end)
	closeButton.MouseButton1Click:Connect(function() self:Destroy() end)
	return self
end

function Window:_StartRainbow()
	if self._rainbowConnection then self._rainbowConnection:Disconnect() end
	local colors = self.Theme.RainbowColors or {self.Theme.Accent}
	local index = 1; local lastSwitch = os.clock()
	self._rainbowConnection = RunService.RenderStepped:Connect(function()
		if not self.Gui or not self.Gui.Parent then if self._rainbowConnection then self._rainbowConnection:Disconnect() end return end
		if os.clock() - lastSwitch < 0.65 then return end
		lastSwitch = os.clock(); index = index + 1; if index > #colors then index = 1 end
		local color = colors[index]; self.Theme.Accent = color
		if self._MainStroke then tween(self._MainStroke, TweenInfo.new(0.4), {Color=color}) end
		if self.MobileButton then tween(self.MobileButton, TweenInfo.new(0.4), {BackgroundColor3=color}) end
		if self.CurrentTab and self.CurrentTab.Button then tween(self.CurrentTab.Button, TweenInfo.new(0.4), {BackgroundColor3=color}) end
	end)
end

function Window:Toggle()
	self.Minimized = not self.Minimized
	if self.Minimized then
		tween(self.Main, nil, {Size=UDim2.fromOffset(self.Main.AbsoluteSize.X / self.Scale.Scale, self.Config.TopbarHeight or 56)})
		self.TabList.Visible = false; self.Pages.Visible = false
	else
		tween(self.Main, nil, {Size=self.Config.Size or UDim2.fromOffset(650,430)})
		task.delay(0.12, function() if self.Main and self.Main.Parent then self.TabList.Visible = true; self.Pages.Visible = true end end)
	end
end

function Window:Destroy()
	self.Closed = true
	if self._scaleConnection then self._scaleConnection:Disconnect() end
	if self._dragConnection then self._dragConnection:Disconnect() end
	if self._rainbowConnection then self._rainbowConnection:Disconnect() end
	if self.Gui then self.Gui:Destroy() end
end

function Window:SetTitle(newTitle) if self._TitleLabel then self._TitleLabel.Text = tostring(newTitle or "") end end
function Window:SetSubtitle(newSubtitle) if self._SubtitleLabel then self._SubtitleLabel.Text = tostring(newSubtitle or "") end end

function Window:Notify(title, message, mode, duration)
	title = title or "Notification"; message = message or ""; mode = mode or "info"; duration = duration or 3
	local color = self.Theme.Accent
	if mode == "success" then color = self.Theme.Success elseif mode == "error" then color = self.Theme.Error end
	local card = create("Frame", {Size=UDim2.fromOffset(310,78), BackgroundColor3=self.Theme.Second, BorderSizePixel=0, BackgroundTransparency=1}, self.NotificationHolder)
	addCorner(card, 10); addStroke(card, color, 1, 0.25)
	local bar = create("Frame", {Size=UDim2.new(0,4,1,-16), Position=UDim2.fromOffset(8,8), BackgroundColor3=color, BorderSizePixel=0}, card)
	addCorner(bar,999)
	create("TextLabel", {Size=UDim2.new(1,-28,0,24), Position=UDim2.fromOffset(20,8), BackgroundTransparency=1, Text=title, TextColor3=self.Theme.Text, Font=Enum.Font.GothamBold, TextSize=15, TextXAlignment=Enum.TextXAlignment.Left}, card)
	create("TextLabel", {Size=UDim2.new(1,-28,0,38), Position=UDim2.fromOffset(20,32), BackgroundTransparency=1, Text=message, TextColor3=self.Theme.SubText, Font=Enum.Font.Gotham, TextSize=13, TextWrapped=true, TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top}, card)
	tween(card, TweenInfo.new(0.2), {BackgroundTransparency=0})
	task.delay(duration, function() if card and card.Parent then tween(card, TweenInfo.new(0.18), {BackgroundTransparency=1}); task.delay(0.2, function() if card and card.Parent then card:Destroy() end end) end end)
end

function Window:Tab(name)
	name = validateText("Tab name", name, "Tab")
	local page = create("ScrollingFrame", {Name=name.."_Page", Size=UDim2.new(1,-16,1,-16), Position=UDim2.fromOffset(8,8), BackgroundTransparency=1, BorderSizePixel=0, ScrollBarThickness=5, CanvasSize=UDim2.fromOffset(0,0), Visible=false}, self.Pages)
	local layout = create("UIListLayout", {Padding=UDim.new(0,8), SortOrder=Enum.SortOrder.LayoutOrder}, page)
	layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() page.CanvasSize = UDim2.fromOffset(0, layout.AbsoluteContentSize.Y + 10) end)
	local tabButton = create("TextButton", {Size=UDim2.new(1,0,0,38), BackgroundColor3=self.Theme.Third, BorderSizePixel=0, Text=name, TextColor3=self.Theme.SubText, Font=Enum.Font.GothamBold, TextSize=14, AutoButtonColor=false}, self.TabList)
	addCorner(tabButton, 9)
	local tab = setmetatable({Name=name, Window=self, Button=tabButton, Page=page, Layout=layout, Elements={}}, Tab)
	self.Tabs[name] = tab
	tabButton.MouseButton1Click:Connect(function() self:SelectTab(name) end)
	if not self.CurrentTab then self:SelectTab(name) end
	return tab
end

function Window:SelectTab(name)
	for tabName, tab in pairs(self.Tabs) do
		local selected = tabName == name
		tab.Page.Visible = selected
		if selected then
			tab.Button.TextColor3 = self.Theme.Text
			tween(tab.Button, nil, {BackgroundColor3=self.Theme.Accent})
			self.CurrentTab = tab
		else
			tab.Button.TextColor3 = self.Theme.SubText
			tween(tab.Button, nil, {BackgroundColor3=self.Theme.Third})
		end
	end
end

function Tab:_Base(label, height)
	local holder = create("Frame", {Size=UDim2.new(1,-4,0,height or 44), BackgroundColor3=self.Window.Theme.Third, BorderSizePixel=0}, self.Page)
	addCorner(holder, 10); addStroke(holder, self.Window.Theme.Accent, 1, 0.85)
	return holder
end


function Tab:Section(textOrConfig)
	local cfg = {}

	if type(textOrConfig) == "table" then
		cfg = textOrConfig
	else
		cfg.Text = textOrConfig
	end

	cfg.Text = validateText("Section title", cfg.Text or cfg.Name, "Section")
	cfg.Height = tonumber(cfg.Height or 42) or 42
	cfg.TextColor = cfg.TextColor or self.Window.Theme.Text
	cfg.LineColor = cfg.LineColor or self.Window.Theme.Accent
	cfg.TextSize = tonumber(cfg.TextSize or 14) or 14
	cfg.Font = cfg.Font or Enum.Font.GothamBlack

	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1

	local holder = create("Frame", {
		Size = UDim2.new(1, -4, 0, cfg.Height),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	}, self.Page)

	local label = create("TextLabel", {
		Size = UDim2.new(1, -20, 0, 24),
		Position = UDim2.fromOffset(10, 0),
		BackgroundTransparency = 1,
		Text = cfg.Text,
		TextColor3 = cfg.TextColor,
		Font = cfg.Font,
		TextSize = cfg.TextSize,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, holder)

	local line = create("Frame", {
		Size = UDim2.new(1, -20, 0, 1),
		Position = UDim2.fromOffset(10, 31),
		BackgroundColor3 = cfg.LineColor,
		BackgroundTransparency = cfg.LineTransparency or 0.35,
		BorderSizePixel = 0,
	}, holder)

	return {
		Object = holder,
		Label = label,
		Line = line,

		Set = function(_, newText)
			label.Text = tostring(newText or "")
		end,

		SetColor = function(_, color)
			if typeof(color) == "Color3" then
				line.BackgroundColor3 = color
			end
		end,
	}
end

function Tab:Separator(config)
	config = config or {}

	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1

	local holder = create("Frame", {
		Size = UDim2.new(1, -4, 0, tonumber(config.Height or 16) or 16),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	}, self.Page)

	local line = create("Frame", {
		Size = UDim2.new(1, -20, 0, tonumber(config.Thickness or 1) or 1),
		Position = UDim2.new(0, 10, 0.5, 0),
		BackgroundColor3 = config.Color or self.Window.Theme.Third,
		BackgroundTransparency = config.Transparency or 0.15,
		BorderSizePixel = 0,
	}, holder)

	return {
		Object = holder,
		Line = line,

		SetColor = function(_, color)
			if typeof(color) == "Color3" then
				line.BackgroundColor3 = color
			end
		end,
	}
end

function Tab:Paragraph(titleOrConfig, text)
	local cfg = {}

	if type(titleOrConfig) == "table" then
		cfg = titleOrConfig
	else
		cfg.Title = titleOrConfig
		cfg.Text = text
	end

	cfg.Title = validateText("Paragraph title", cfg.Title or cfg.Name, "Paragraph")
	cfg.Text = tostring(cfg.Text or cfg.Description or "")
	cfg.Height = tonumber(cfg.Height or 74) or 74
	cfg.TitleColor = cfg.TitleColor or self.Window.Theme.Text
	cfg.TextColor = cfg.TextColor or self.Window.Theme.SubText
	cfg.Color = cfg.Color or self.Window.Theme.Third
	cfg.Corner = tonumber(cfg.Corner or 10) or 10

	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1

	local holder = create("Frame", {
		Size = UDim2.new(1, -4, 0, cfg.Height),
		BackgroundColor3 = cfg.Color,
		BorderSizePixel = 0,
	}, self.Page)

	addCorner(holder, cfg.Corner)
	addStroke(holder, cfg.StrokeColor or self.Window.Theme.Accent, 1, cfg.StrokeTransparency or 0.9)

	local titleLabel = create("TextLabel", {
		Size = UDim2.new(1, -20, 0, 22),
		Position = UDim2.fromOffset(10, 7),
		BackgroundTransparency = 1,
		Text = cfg.Title,
		TextColor3 = cfg.TitleColor,
		Font = cfg.TitleFont or Enum.Font.GothamBold,
		TextSize = cfg.TitleSize or 14,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, holder)

	local textLabel = create("TextLabel", {
		Size = UDim2.new(1, -20, 1, -34),
		Position = UDim2.fromOffset(10, 30),
		BackgroundTransparency = 1,
		Text = cfg.Text,
		TextColor3 = cfg.TextColor,
		Font = cfg.TextFont or Enum.Font.Gotham,
		TextSize = cfg.TextSize or 13,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
	}, holder)

	return {
		Object = holder,
		Title = titleLabel,
		Text = textLabel,

		SetTitle = function(_, newTitle)
			titleLabel.Text = tostring(newTitle or "")
		end,

		SetText = function(_, newText)
			textLabel.Text = tostring(newText or "")
		end,
	}
end

function Tab:Keybind(textOrConfig, defaultKey, callback)
	local cfg = {}

	if type(textOrConfig) == "table" then
		cfg = textOrConfig
		defaultKey = cfg.Default or cfg.Key or cfg.KeyCode
		callback = callback or cfg.Callback or cfg.OnPressed or cfg.Pressed
	else
		cfg.Text = textOrConfig
	end

	cfg.Text = validateText("Keybind name", cfg.Text or cfg.Name, "Keybind")
	cfg.Height = tonumber(cfg.Height or 44) or 44
	cfg.Color = cfg.Color or self.Window.Theme.Second
	cfg.HoverColor = cfg.HoverColor or self.Window.Theme.Accent
	cfg.TextColor = cfg.TextColor or self.Window.Theme.Text
	cfg.TextSize = tonumber(cfg.TextSize or 14) or 14
	cfg.Font = cfg.Font or Enum.Font.GothamBold
	cfg.Corner = tonumber(cfg.Corner or 8) or 8
	defaultKey = defaultKey or Enum.KeyCode.RightShift

	validateCallback("Keybind", callback, false)
	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1

	local currentKey = defaultKey
	local waitingForKey = false
	local holder = self:_Base(cfg.Text, cfg.Height)

	local label = create("TextLabel", {
		Size = UDim2.new(1, -128, 1, 0),
		Position = UDim2.fromOffset(12, 0),
		BackgroundTransparency = 1,
		Text = cfg.Text,
		TextColor3 = cfg.TextColor,
		Font = cfg.Font,
		TextSize = cfg.TextSize,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, holder)

	local keyButton = create("TextButton", {
		Size = UDim2.fromOffset(104, 30),
		Position = UDim2.new(1, -116, 0.5, -15),
		BackgroundColor3 = cfg.Color,
		BorderSizePixel = 0,
		Text = tostring(currentKey.Name or currentKey),
		TextColor3 = cfg.TextColor,
		Font = Enum.Font.GothamBold,
		TextSize = 13,
		AutoButtonColor = false,
	}, holder)

	addCorner(keyButton, cfg.Corner)

	keyButton.MouseEnter:Connect(function()
		tween(keyButton, nil, {BackgroundColor3 = cfg.HoverColor})
	end)

	keyButton.MouseLeave:Connect(function()
		tween(keyButton, nil, {BackgroundColor3 = cfg.Color})
	end)

	keyButton.MouseButton1Click:Connect(function()
		waitingForKey = true
		keyButton.Text = "Press key..."
	end)

	local conn
	conn = UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if gameProcessed then
			return
		end

		if waitingForKey then
			if input.UserInputType == Enum.UserInputType.Keyboard then
				currentKey = input.KeyCode
				keyButton.Text = tostring(currentKey.Name)
				waitingForKey = false
			end
			return
		end

		if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == currentKey then
			safeCallback(callback, currentKey)
		end
	end)

	holder.Destroying:Connect(function()
		if conn then
			conn:Disconnect()
		end
	end)

	return {
		Object = holder,
		Button = keyButton,

		Get = function()
			return currentKey
		end,

		Set = function(_, key)
			if typeof(key) == "EnumItem" then
				currentKey = key
				keyButton.Text = tostring(key.Name)
			end
		end,

		OnPressed = function(_, newCallback)
			callback = newCallback
		end,
	}
end

function Tab:Label(textOrConfig)
	local cfg = type(textOrConfig) == "table" and textOrConfig or {Text=textOrConfig}
	cfg.Text = validateText("Label text", cfg.Text or cfg.Name, "Label")
	cfg.Height = tonumber(cfg.Height or 36) or 36
	cfg.TextColor = cfg.TextColor or self.Window.Theme.SubText
	cfg.TextSize = tonumber(cfg.TextSize or 14) or 14
	cfg.Font = cfg.Font or Enum.Font.GothamSemibold
	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1
	local holder = self:_Base(cfg.Text, cfg.Height)
	local label = create("TextLabel", {Size=UDim2.new(1,-20,1,0), Position=UDim2.fromOffset(10,0), BackgroundTransparency=1, Text=cfg.Text, TextColor3=cfg.TextColor, Font=cfg.Font, TextSize=cfg.TextSize, TextXAlignment=cfg.Align or Enum.TextXAlignment.Left}, holder)
	return {Object=holder, Label=label, Set=function(_, newText) label.Text = tostring(newText) end, SetTextColor=function(_, color) if typeof(color)=="Color3" then label.TextColor3=color end end}
end

function Tab:Button(textOrConfig, callback)
	local cfg; cfg, callback = normalizeButtonArgs(textOrConfig, callback)
	validateCallback("Button", callback, false)
	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1
	local holder = self:_Base(cfg.Text, cfg.Height)
	holder.LayoutOrder = cfg.LayoutOrder or holder.LayoutOrder
	local baseColor = cfg.Color or self.Window.Theme.Second
	local hoverColor = cfg.HoverColor or self.Window.Theme.Accent
	local textColor = cfg.TextColor or self.Window.Theme.Text
	local button = create("TextButton", {Size=UDim2.new(1,-12,1,-10), Position=UDim2.fromOffset(6,5), BackgroundColor3=baseColor, BorderSizePixel=0, Text=cfg.Text, TextColor3=textColor, Font=cfg.Font, TextSize=cfg.TextSize, TextXAlignment=cfg.Align, AutoButtonColor=false}, holder)
	addCorner(button, cfg.Corner)
	if cfg.StrokeColor then addStroke(button, cfg.StrokeColor, cfg.StrokeThickness or 1, cfg.StrokeTransparency or 0) end
	button.MouseEnter:Connect(function() tween(button, nil, {BackgroundColor3=hoverColor}) end)
	button.MouseLeave:Connect(function() tween(button, nil, {BackgroundColor3=baseColor}) end)
	button.MouseButton1Click:Connect(function() safeCallback(callback) end)
	return {Object=holder, Button=button, SetText=function(_, newText) cfg.Text=tostring(newText); button.Text=cfg.Text end, SetColor=function(_, newColor) if typeof(newColor)=="Color3" then baseColor=newColor; button.BackgroundColor3=newColor end end, SetHoverColor=function(_, newColor) if typeof(newColor)=="Color3" then hoverColor=newColor end end, SetTextColor=function(_, newColor) if typeof(newColor)=="Color3" then button.TextColor3=newColor end end, SetSize=function(_, height) height=tonumber(height) or cfg.Height; cfg.Height=height; holder.Size=UDim2.new(1,-4,0,height) end, OnClick=function(_, newCallback) callback=newCallback end}
end

function Tab:Toggle(textOrConfig, default, callback)
	local cfg; cfg, callback = normalizeToggleArgs(textOrConfig, default, callback)
	validateCallback("Toggle", callback, false)
	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1
	local value = cfg.Default == true
	local holder = self:_Base(cfg.Text, cfg.Height)
	local textColor = cfg.TextColor or self.Window.Theme.Text
	local onColor = cfg.Color or self.Window.Theme.Accent
	local offColor = cfg.OffColor or self.Window.Theme.Second
	local label = create("TextLabel", {Size=UDim2.new(1,-72,1,0), Position=UDim2.fromOffset(12,0), BackgroundTransparency=1, Text=cfg.Text, TextColor3=textColor, Font=cfg.Font, TextSize=cfg.TextSize, TextXAlignment=Enum.TextXAlignment.Left}, holder)
	local toggle = create("TextButton", {Size=UDim2.fromOffset(48,24), Position=UDim2.new(1,-60,0.5,-12), BackgroundColor3=value and onColor or offColor, BorderSizePixel=0, Text="", AutoButtonColor=false}, holder)
	addCorner(toggle,999)
	local knob = create("Frame", {Size=UDim2.fromOffset(18,18), Position=value and UDim2.new(1,-21,0.5,-9) or UDim2.new(0,3,0.5,-9), BackgroundColor3=self.Window.Theme.Text, BorderSizePixel=0}, toggle)
	addCorner(knob,999)
	local function set(newValue, call)
		value = newValue == true
		tween(toggle, nil, {BackgroundColor3=value and onColor or offColor})
		tween(knob, nil, {Position=value and UDim2.new(1,-21,0.5,-9) or UDim2.new(0,3,0.5,-9)})
		if call then safeCallback(callback, value) end
	end
	toggle.MouseButton1Click:Connect(function() set(not value, true) end)
	holder.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then set(not value, true) end end)
	return {Object=holder, Get=function() return value end, Set=function(_, newValue) set(newValue, true) end, SetText=function(_, newText) label.Text=tostring(newText) end, SetColor=function(_, newColor) if typeof(newColor)=="Color3" then onColor=newColor; if value then toggle.BackgroundColor3=onColor end end end, OnChanged=function(_, newCallback) callback=newCallback end}
end

function Tab:Slider(textOrConfig, min, max, default, callback)
	local cfg; cfg, callback = normalizeSliderArgs(textOrConfig, min, max, default, callback)
	validateCallback("Slider", callback, false)
	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1
	if cfg.Max <= cfg.Min then cfg.Max = cfg.Min + 1 end
	local value = math.clamp(cfg.Default, cfg.Min, cfg.Max)
	local holder = self:_Base(cfg.Text, cfg.Height)
	local accent = cfg.Color or self.Window.Theme.Accent
	local textColor = cfg.TextColor or self.Window.Theme.Text
	local label = create("TextLabel", {Size=UDim2.new(1,-20,0,24), Position=UDim2.fromOffset(12,3), BackgroundTransparency=1, Text=cfg.Text..": "..tostring(roundNumber(value,cfg.Decimals)), TextColor3=textColor, Font=cfg.Font, TextSize=cfg.TextSize, TextXAlignment=Enum.TextXAlignment.Left}, holder)
	local bar = create("Frame", {Size=UDim2.new(1,-24,0,8), Position=UDim2.fromOffset(12,38), BackgroundColor3=self.Window.Theme.Second, BorderSizePixel=0}, holder)
	addCorner(bar,999)
	local fill = create("Frame", {Size=UDim2.new((value-cfg.Min)/(cfg.Max-cfg.Min),0,1,0), BackgroundColor3=accent, BorderSizePixel=0}, bar)
	addCorner(fill,999)
	local dragging = false
	local function setValue(newValue, call)
		value = math.clamp(tonumber(newValue) or value, cfg.Min, cfg.Max)
		value = roundNumber(value, cfg.Decimals)
		local percent = (value - cfg.Min) / (cfg.Max - cfg.Min)
		label.Text = cfg.Text .. ": " .. tostring(value)
		tween(fill, TweenInfo.new(0.08), {Size=UDim2.new(percent,0,1,0)})
		if call then safeCallback(callback, value) end
	end
	local function setFromX(x, call)
		local percent = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
		setValue(cfg.Min + (cfg.Max - cfg.Min) * percent, call)
	end
	bar.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging=true; setFromX(input.Position.X, true) end end)
	UserInputService.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then dragging=false end end)
	UserInputService.InputChanged:Connect(function(input) if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then setFromX(input.Position.X, true) end end)
	return {Object=holder, Get=function() return value end, Set=function(_, newValue) setValue(newValue, true) end, SetText=function(_, newText) cfg.Text=tostring(newText); label.Text=cfg.Text..": "..tostring(value) end, SetColor=function(_, newColor) if typeof(newColor)=="Color3" then accent=newColor; fill.BackgroundColor3=newColor end end, OnChanged=function(_, newCallback) callback=newCallback end}
end

function Tab:TextBox(textOrConfig, placeholder, callback)
	local cfg = {}
	if type(textOrConfig) == "table" then cfg = textOrConfig; placeholder = cfg.Placeholder or cfg.PlaceholderText; callback = callback or cfg.Callback or cfg.OnSubmit or cfg.Submit else cfg.Text = textOrConfig end
	cfg.Text = validateText("TextBox name", cfg.Text or cfg.Name, "TextBox")
	cfg.Height = tonumber(cfg.Height or 54) or 54
	cfg.TextColor = cfg.TextColor or self.Window.Theme.Text
	cfg.BoxColor = cfg.BoxColor or self.Window.Theme.Second
	cfg.TextSize = tonumber(cfg.TextSize or 14) or 14
	cfg.Font = cfg.Font or Enum.Font.GothamBold
	validateCallback("TextBox", callback, false)
	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1
	local holder = self:_Base(cfg.Text, cfg.Height)
	create("TextLabel", {Size=UDim2.new(0.35,-16,1,0), Position=UDim2.fromOffset(12,0), BackgroundTransparency=1, Text=cfg.Text, TextColor3=cfg.TextColor, Font=cfg.Font, TextSize=cfg.TextSize, TextXAlignment=Enum.TextXAlignment.Left}, holder)
	local box = create("TextBox", {Size=UDim2.new(0.65,-18,0,32), Position=UDim2.new(0.35,4,0.5,-16), BackgroundColor3=cfg.BoxColor, BorderSizePixel=0, Text=cfg.Default or "", PlaceholderText=placeholder or "Enter text...", TextColor3=self.Window.Theme.Text, PlaceholderColor3=self.Window.Theme.SubText, Font=Enum.Font.Gotham, TextSize=13, ClearTextOnFocus=cfg.ClearTextOnFocus == true, TextXAlignment=Enum.TextXAlignment.Left}, holder)
	addCorner(box, cfg.Corner or 8); addPadding(box, 8, 8, 0, 0)
	box.FocusLost:Connect(function(enterPressed) if enterPressed or cfg.SubmitOnFocusLost then safeCallback(callback, box.Text) end end)
	return {Object=holder, Box=box, Get=function() return box.Text end, Set=function(_, value) box.Text=tostring(value or "") end, OnSubmit=function(_, newCallback) callback=newCallback end}
end

function Tab:Dropdown(textOrConfig, options, default, callback)
	local cfg = {}
	if type(textOrConfig) == "table" then cfg = textOrConfig; options = cfg.Options; default = cfg.Default; callback = callback or cfg.Callback or cfg.OnSelect or cfg.Select else cfg.Text = textOrConfig end
	options = options or {}
	cfg.Text = validateText("Dropdown name", cfg.Text or cfg.Name, "Dropdown")
	cfg.Height = tonumber(cfg.Height or 44) or 44
	cfg.Color = cfg.Color or self.Window.Theme.Second
	cfg.TextColor = cfg.TextColor or self.Window.Theme.Text
	cfg.TextSize = tonumber(cfg.TextSize or 14) or 14
	cfg.Font = cfg.Font or Enum.Font.GothamBold
	validateCallback("Dropdown", callback, false)
	PurpaUI._Internal.ElementCount = PurpaUI._Internal.ElementCount + 1
	local selected = default or options[1] or "None"
	local open = false
	local holder = self:_Base(cfg.Text, cfg.Height)
	local mainButton = create("TextButton", {Size=UDim2.new(1,-12,0,34), Position=UDim2.fromOffset(6,5), BackgroundColor3=cfg.Color, BorderSizePixel=0, Text=cfg.Text..": "..tostring(selected), TextColor3=cfg.TextColor, Font=cfg.Font, TextSize=cfg.TextSize, AutoButtonColor=false}, holder)
	addCorner(mainButton, cfg.Corner or 8)
	local optionHolder = create("Frame", {Size=UDim2.new(1,-12,0,0), Position=UDim2.fromOffset(6,43), BackgroundTransparency=1, ClipsDescendants=true, Visible=true}, holder)
	create("UIListLayout", {Padding=UDim.new(0,4), SortOrder=Enum.SortOrder.LayoutOrder}, optionHolder)
	local function closeDropdown()
		open = false
		tween(holder, nil, {Size=UDim2.new(1,-4,0,cfg.Height)})
		tween(optionHolder, nil, {Size=UDim2.new(1,-12,0,0)})
	end
	local function rebuild()
		for _, child in ipairs(optionHolder:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
		for _, option in ipairs(options) do
			local optionButton = create("TextButton", {Size=UDim2.new(1,0,0,30), BackgroundColor3=self.Window.Theme.Second, BorderSizePixel=0, Text=tostring(option), TextColor3=self.Window.Theme.SubText, Font=Enum.Font.Gotham, TextSize=13, AutoButtonColor=false}, optionHolder)
			addCorner(optionButton, 7)
			optionButton.MouseButton1Click:Connect(function()
				selected = option; mainButton.Text = cfg.Text .. ": " .. tostring(selected)
				closeDropdown(); safeCallback(callback, selected)
			end)
		end
	end
	rebuild()
	mainButton.MouseButton1Click:Connect(function()
		open = not open
		local targetHeight = open and (#options * 34) or 0
		local holderHeight = open and (48 + targetHeight) or cfg.Height
		tween(holder, nil, {Size=UDim2.new(1,-4,0,holderHeight)})
		tween(optionHolder, nil, {Size=UDim2.new(1,-12,0,targetHeight)})
	end)
	return {Object=holder, Get=function() return selected end, Set=function(_, value) selected=value; mainButton.Text=cfg.Text..": "..tostring(selected); safeCallback(callback, selected) end, SetOptions=function(_, newOptions) options=newOptions or {}; rebuild() end, OnSelect=function(_, newCallback) callback=newCallback end}
end

function PurpaUI:Notify(title, message, mode, duration)
	local gui = PlayerGui:FindFirstChild("PurpaUILibrary_QuickNotify")
	if not gui then gui = create("ScreenGui", {Name="PurpaUILibrary_QuickNotify", IgnoreGuiInset=true, ResetOnSpawn=false, DisplayOrder=999999}, PlayerGui) end
	local holder = gui:FindFirstChild("Holder")
	if not holder then
		holder = create("Frame", {Name="Holder", AnchorPoint=Vector2.new(1,1), Position=UDim2.new(1,-18,1,-18), Size=UDim2.fromOffset(310,300), BackgroundTransparency=1}, gui)
		create("UIListLayout", {Padding=UDim.new(0,8), SortOrder=Enum.SortOrder.LayoutOrder, VerticalAlignment=Enum.VerticalAlignment.Bottom}, holder)
	end
	local theme = Themes.Dark; local color = theme.Accent
	if mode == "success" then color = theme.Success elseif mode == "error" then color = theme.Error end
	local card = create("Frame", {Size=UDim2.fromOffset(310,72), BackgroundColor3=theme.Second, BorderSizePixel=0, BackgroundTransparency=0}, holder)
	addCorner(card, 10); addStroke(card, color, 1, 0.3)
	create("TextLabel", {Size=UDim2.new(1,-20,0,24), Position=UDim2.fromOffset(10,8), BackgroundTransparency=1, Text=title or "Notification", TextColor3=theme.Text, Font=Enum.Font.GothamBold, TextSize=15, TextXAlignment=Enum.TextXAlignment.Left}, card)
	create("TextLabel", {Size=UDim2.new(1,-20,0,34), Position=UDim2.fromOffset(10,32), BackgroundTransparency=1, Text=message or "", TextColor3=theme.SubText, Font=Enum.Font.Gotham, TextSize=13, TextWrapped=true, TextXAlignment=Enum.TextXAlignment.Left, TextYAlignment=Enum.TextYAlignment.Top}, card)
	task.delay(duration or 3, function() if card and card.Parent then tween(card, nil, {BackgroundTransparency=1}); task.delay(0.2, function() if card and card.Parent then card:Destroy() end end) end end)
end

function PurpaUI:GetThemes()
	local list = {}
	for name in pairs(Themes) do table.insert(list, name) end
	table.sort(list)
	return list
end

function PurpaUI:GetWarnings()
	return PurpaUI._Internal.Warnings
end


--[[
	====================================================
	V0.3.2 CUSTOM TABS / REMOVE API / STACK NOTIFICATIONS
	====================================================

	New:
	- Window:AddCustomTab("Name")
	- Window:CreateTabs({"Main", "Visual", "Settings"})
	- Window:RemoveTab("Name")
	- Window:ClearTabs()
	- Tab:Clear()
	- Tab:Destroy()
	- Any element:Destroy(), :Remove(), :Hide(), :Show(), :SetVisible(bool)
	- Notifications now stack from bottom to top.
]]

local PurpaUI_NotificationCounter = 0

local function PurpaUI_StackNotify(holder, theme, title, message, mode, duration)
	if not holder then
		return nil
	end

	PurpaUI_NotificationCounter = PurpaUI_NotificationCounter + 1

	title = tostring(title or "Notification")
	message = tostring(message or "")
	mode = tostring(mode or "info")
	duration = tonumber(duration or 3) or 3

	local color = theme.Accent
	if mode == "success" then
		color = theme.Success
	elseif mode == "error" then
		color = theme.Error
	elseif mode == "warning" then
		color = theme.Warning or Color3.fromRGB(255, 190, 80)
	end

	local card = create("Frame", {
		Size = UDim2.fromOffset(310, 0),
		BackgroundColor3 = theme.Second,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = PurpaUI_NotificationCounter,
	}, holder)

	addCorner(card, 10)
	addStroke(card, color, 1, 0.25)

	local bar = create("Frame", {
		Size = UDim2.new(0, 4, 1, -16),
		Position = UDim2.fromOffset(8, 8),
		BackgroundColor3 = color,
		BorderSizePixel = 0,
	}, card)
	addCorner(bar, 999)

	create("TextLabel", {
		Size = UDim2.new(1, -28, 0, 24),
		Position = UDim2.fromOffset(20, 8),
		BackgroundTransparency = 1,
		Text = title,
		TextColor3 = theme.Text,
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
	}, card)

	create("TextLabel", {
		Size = UDim2.new(1, -28, 0, 38),
		Position = UDim2.fromOffset(20, 32),
		BackgroundTransparency = 1,
		Text = message,
		TextColor3 = theme.SubText,
		Font = Enum.Font.Gotham,
		TextSize = 13,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,
	}, card)

	tween(card, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.fromOffset(310, 78),
		BackgroundTransparency = 0,
	})

	task.delay(duration, function()
		if card and card.Parent then
			tween(card, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				Size = UDim2.fromOffset(310, 0),
				BackgroundTransparency = 1,
			})

			task.delay(0.2, function()
				if card and card.Parent then
					card:Destroy()
				end
			end)
		end
	end)

	return card
end

function Window:Notify(title, message, mode, duration)
	return PurpaUI_StackNotify(self.NotificationHolder, self.Theme, title, message, mode, duration)
end

function PurpaUI:Notify(title, message, mode, duration)
	local gui = PlayerGui:FindFirstChild("PurpaUILibrary_QuickNotify")

	if not gui then
		gui = create("ScreenGui", {
			Name = "PurpaUILibrary_QuickNotify",
			IgnoreGuiInset = true,
			ResetOnSpawn = false,
			DisplayOrder = 999999,
		}, PlayerGui)
	end

	local holder = gui:FindFirstChild("Holder")

	if not holder then
		holder = create("Frame", {
			Name = "Holder",
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -18, 1, -18),
			Size = UDim2.fromOffset(310, 360),
			BackgroundTransparency = 1,
			ClipsDescendants = false,
		}, gui)

		create("UIListLayout", {
			Padding = UDim.new(0, 8),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
		}, holder)
	end

	return PurpaUI_StackNotify(holder, Themes.Graphite or Themes.Dark, title, message, mode, duration)
end

local function PurpaUI_removeFromList(list, value)
	for i = #list, 1, -1 do
		if list[i] == value then
			table.remove(list, i)
		end
	end
end

local function PurpaUI_setGuiObjectEnabled(root, enabled)
	if not root then
		return
	end

	root:SetAttribute("PurpaUI_Enabled", enabled == true)

	for _, item in ipairs(root:GetDescendants()) do
		if item:IsA("GuiButton") or item:IsA("TextBox") then
			item.Active = enabled == true
			item.Selectable = enabled == true
		end

		if item:IsA("TextLabel") or item:IsA("TextButton") or item:IsA("TextBox") then
			item.TextTransparency = enabled and 0 or 0.45
		end
	end
end

local function PurpaUI_enhanceElement(tab, element)
	if type(element) ~= "table" or element.__PurpaUIEnhanced then
		return element
	end

	element.__PurpaUIEnhanced = true
	element.Tab = element.Tab or tab

	if element.Object and typeof(element.Object) == "Instance" then
		function element:Destroy()
			if self.Object and self.Object.Parent then
				self.Object:Destroy()
			end

			if self.Tab and self.Tab.Elements then
				PurpaUI_removeFromList(self.Tab.Elements, self)
			end
		end

		element.Remove = element.Destroy

		function element:SetVisible(state)
			if self.Object then
				self.Object.Visible = state == true
			end
		end

		function element:Show()
			self:SetVisible(true)
		end

		function element:Hide()
			self:SetVisible(false)
		end

		function element:Enable()
			self.Enabled = true
			PurpaUI_setGuiObjectEnabled(self.Object, true)
		end

		function element:Disable()
			self.Enabled = false
			PurpaUI_setGuiObjectEnabled(self.Object, false)
		end

		function element:GetObject()
			return self.Object
		end
	end

	return element
end

local function PurpaUI_selectFirstTab(window)
	for name in pairs(window.Tabs) do
		window:SelectTab(name)
		return true
	end

	window.CurrentTab = nil
	return false
end

local function PurpaUI_enhanceTab(tab)
	if type(tab) ~= "table" or tab.__PurpaUITabEnhanced then
		return tab
	end

	tab.__PurpaUITabEnhanced = true
	tab.Elements = tab.Elements or {}

	function tab:Clear()
		for i = #self.Elements, 1, -1 do
			local element = self.Elements[i]

			if type(element) == "table" and element.Object and element.Object.Parent then
				element.Object:Destroy()
			end

			self.Elements[i] = nil
		end

		if self.Page then
			for _, child in ipairs(self.Page:GetChildren()) do
				if not child:IsA("UIListLayout") and not child:IsA("UIPadding") then
					child:Destroy()
				end
			end
		end
	end

	function tab:Destroy()
		self:Clear()

		if self.Window and self.Window.Tabs then
			self.Window.Tabs[self.Name] = nil
		end

		local wasSelected = self.Window and self.Window.CurrentTab == self

		if self.Button then
			self.Button:Destroy()
		end

		if self.Page then
			self.Page:Destroy()
		end

		if wasSelected and self.Window then
			PurpaUI_selectFirstTab(self.Window)
		end
	end

	tab.Remove = tab.Destroy

	function tab:GetName()
		return self.Name
	end

	return tab
end

local PurpaUI_originalWindowTab = Window.Tab

function Window:Tab(nameOrConfig, config)
	local cfg = {}

	if type(nameOrConfig) == "table" then
		cfg = nameOrConfig
	else
		cfg = config or {}
		cfg.Name = nameOrConfig
	end

	local name = validateText("Tab name", cfg.Name or cfg.Text or cfg.Title, "Custom Tab")

	if cfg.Replace == true and self.Tabs[name] then
		self.Tabs[name]:Destroy()
	end

	local tab = PurpaUI_originalWindowTab(self, name)
	PurpaUI_enhanceTab(tab)

	if cfg.Icon then
		tab.Button.Text = tostring(cfg.Icon) .. "  " .. name
	end

	if cfg.Order then
		tab.Button.LayoutOrder = tonumber(cfg.Order) or tab.Button.LayoutOrder
	end

	if cfg.Color and typeof(cfg.Color) == "Color3" then
		tab.Button.BackgroundColor3 = cfg.Color
	end

	return tab
end

function Window:GetTab(name)
	return self.Tabs[tostring(name)]
end

function Window:RemoveTab(name)
	local tab = self.Tabs[tostring(name)]
	if tab then
		tab:Destroy()
		return true
	end
	return false
end

Window.DeleteTab = Window.RemoveTab

function Window:ClearTabs()
	for _, tab in pairs(self.Tabs) do
		if type(tab) == "table" and tab.Destroy then
			tab:Destroy()
		end
	end

	self.Tabs = {}
	self.CurrentTab = nil
end

Window.ClearAll = Window.ClearTabs

function Window:CreateTabs(tabList)
	local created = {}

	for _, item in ipairs(tabList or {}) do
		local tab = self:Tab(item)
		created[tab.Name] = tab
	end

	return created
end

Window.CustomTab = Window.Tab
Window.AddCustomTab = Window.Tab
Window.CreateCustomTab = Window.Tab
Window.NewTab = Window.Tab

local PurpaUI_elementMethodNames = {
	"Section",
	"Label",
	"Button",
	"Toggle",
	"Slider",
	"TextBox",
	"Dropdown",
	"Separator",
	"Paragraph",
	"Keybind",
}

for _, methodName in ipairs(PurpaUI_elementMethodNames) do
	local originalMethod = Tab[methodName]

	if originalMethod then
		Tab[methodName] = function(self, ...)
			PurpaUI_enhanceTab(self)

			local element = originalMethod(self, ...)
			PurpaUI_enhanceElement(self, element)

			if type(element) == "table" then
				table.insert(self.Elements, element)
			end

			return element
		end
	end
end



--[[
	====================================================
	API ALIASES / EASY COMMANDS
	====================================================

	Both styles work:

	Main:Button("Click", function() end)
	Main:AddButton("Click", function() end)

	Movement:Slider("Speed", 16, 100, 25, function(value) end)
	Movement:AddSlider("Speed", 16, 100, 25, function(value) end)
]]

Tab.AddLabel = Tab.Label
Tab.AddButton = Tab.Button
Tab.AddToggle = Tab.Toggle
Tab.AddSlider = Tab.Slider
Tab.AddTextBox = Tab.TextBox
Tab.AddTextbox = Tab.TextBox
Tab.AddInput = Tab.TextBox
Tab.AddDropdown = Tab.Dropdown
Tab.AddSection = Tab.Section
Tab.AddSeparator = Tab.Separator
Tab.AddParagraph = Tab.Paragraph
Tab.AddKeybind = Tab.Keybind

Window.AddTab = Window.Tab
Window.CreateTab = Window.Tab
Window.Select = Window.SelectTab
Window.Close = Window.Destroy

task.delay(1.25, function()
	if not PurpaUI._Internal.WindowCreated then showGettingStartedHelp() end
end)

return PurpaUI