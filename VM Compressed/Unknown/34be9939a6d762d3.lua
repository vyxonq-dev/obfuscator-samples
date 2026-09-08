local Library = {}
Library.__index = Library

function Library.new()
	local self = setmetatable({}, Library)

	local modules
	if game:GetService("RunService"):IsStudio() then
		modules = require(script.Modules) else
		modules = loadstring(game:HttpGet("https://raw.githubusercontent.com/Gimkit0/toshokan-lib/refs/heads/main/modules.lua"))()
	end

	self.Services = {
		TweenService = game:GetService("TweenService"),
		RunService = game:GetService("RunService"),
		UserInputService = game:GetService("UserInputService"),
		Players = game:GetService("Players"),
		GuiService = game:GetService("GuiService"),
	}
	self.Modules = {
		Fade = modules.Fade(),
		Resuponshibu = modules.Resuponshibu(),
		States = modules.States(),
		TextAnimation = modules.TextAnimation(),
		TabControl = modules.TabControl(),
		SmoothScroll = modules.SmoothScroll(),
		Ripple = modules.Ripple(),
		SearchModule = modules.SearchModule(),
		SnapDragon = modules.Snapdragon(),
	}
	self.Storage = {
		Connections = {},
		ThemeConns = {},

		CurrentTheme = nil,
	}
	self.LibConfig = {
		DEFAULT_THEME = "Dark",
		THEMES = {
			["DARK"] = {
				THEME_COLOR = Color3.fromRGB(255, 178, 83),

				BACKGROUND = Color3.fromRGB(25, 25, 25),
				LIGHT_BACKGROUND = Color3.fromRGB(50, 50, 50),
				BACKGROUND_TRANSPARENCY = .1,
				BACKGROUND_IMAGE = 16255699706,
				BACKGROUND_IMAGE_TRANSPARENCY = .2,
				BACKGROUND_IMAGE_COLOR = Color3.fromRGB(255, 255, 255),
				DROPSHADOW = Color3.fromRGB(20, 20, 20),
				DROPSHADOW_TRANSPARENCY = .2,

				REGULAR_TEXT = Color3.fromRGB(235, 235, 235),
				SHADED_TEXT = Color3.fromRGB(150, 150, 150),
				THEME_FILL_TEXT = Color3.fromRGB(0, 0, 0),

				OUTLINE = Color3.fromRGB(50, 50, 50),
				UNDERLINE = Color3.fromRGB(50, 50, 50),

				SUGGESTION_TRANSPAENCY = .2,

				REGULAR_BUTTON_TRANSPARENCY = 1,
				REGULAR_BUTTON_HOVER_TRANSPARENCY = .9,
				REGULAR_BUTTON_CLICK_TRANSPARENCY = .5,

				RIPPLE_COLOR = Color3.fromRGB(255, 255, 255),
				RIPPLE_TRANSPARENCY = .95,
				RIPPLE_CLICK_TRANSPARENCY = .8,

				HEADER_SHADOW = Color3.fromRGB(25, 25, 25),
				HEADER_SHADOW_TRANSPARENCY = .7,
				HEADER_SHAODW_BOTTOM_TRANSPARENCY = .1,
				HEADER_TRANSPARENCY = .5,
			}
		},
	}

	self.tween = function(obj, info, goal)
		local tween = self.Services.TweenService:Create(obj, info, goal)
		tween:Play()
		return tween
	end
	self.spawn = function(callback, debug)
		if type(callback) == "function" then
			if debug then
				task.spawn(callback)
			else
				task.spawn(pcall, callback)
			end
		end
	end
	self.validateConfig = function(defaults, config)
		if not config then
			config = {}
		end

		for k, v in pairs(defaults) do
			if (config[k] == nil) then
				config[k] = v
			end
		end
		return config
	end
	self.addConn = function(name, conn, recursive : boolean?)
		self.spawn(function()
			if recursive then
				if (self.Storage.Connections[name]) then
					self.Storage.Connections[name]:Disconnect()
				end
			end
			self.Storage.Connections[name] = conn
		end)
	end
	self.removeConn = function(name)
		if (self.Storage.Connections[name]) then
			self.Storage.Connections[name]:Disconnect()
			self.Storage.Connections[name] = nil
		end
	end
	self.selectTheme = function(themes, name)
		name = name:lower()

		for index, value in pairs(themes) do
			if (name == index:lower()) then
				self.spawn(function()
					for _, conn in ipairs(self.Storage.ThemeConns) do
						conn(value)
					end
				end, true)
				self.Storage.CurrentTheme = value
				return value
			end
		end
		return nil
	end
	self.onSwitchTheme = function(conn)
		if type(conn) == "function" then
			table.insert(self.Storage.ThemeConns, conn)
		end
		if self.Storage.CurrentTheme then
			self.spawn(function()
				conn(self.Storage.CurrentTheme)
			end)
		end
	end
	self.switchConfig = function(config)
		self.LibConfig = self.validateConfig(self.LibConfig, config)
	end
	self.propertiesApply = function(obj, propTable)
		for prop, value in pairs(propTable) do
			obj[prop] = value
		end
	end

	return self
end

function Library:Window(config)
	local winTable = {}
	local G2L = {}

	config = self.validateConfig({
		TITLE = "Window",
		ICON = 0,

		ON_DESTROY = function() end,
	}, config)
	winTable.Config = config

	local theme = self.Storage.CurrentTheme

	local menuOpened = false

	local windowParent
	if self.Services.RunService:IsStudio() then
		windowParent = self.Services.Players.LocalPlayer:WaitForChild("PlayerGui") else
		windowParent = game:GetService("CoreGui")
	end

	G2L["1"] = Instance.new("GuiMain", windowParent)
	G2L["1"]["IgnoreGuiInset"] = true
	G2L["1"]["ScreenInsets"] = Enum.ScreenInsets.DeviceSafeInsets
	G2L["1"]["ResetOnSpawn"] = false

	G2L["2"] = Instance.new("Frame", G2L["1"])
	G2L["2"]["BorderSizePixel"] = 0
	G2L["2"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	G2L["2"]["BackgroundTransparency"] = 1
	G2L["2"]["Size"] = UDim2.new(0, 600, 0, 450)
	G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
	G2L["2"]["Name"] = [[element]]

	G2L["3"] = Instance.new("Frame", G2L["2"])
	G2L["3"]["BorderSizePixel"] = 0
	G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["3"]["BackgroundTransparency"] = 1
	G2L["3"]["Size"] = UDim2.new(1, 0, 0, 50)
	G2L["3"]["ClipsDescendants"] = true
	G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["3"]["Name"] = [[Header]]

	G2L["4"] = Instance.new("Frame", G2L["3"])
	G2L["4"]["BorderSizePixel"] = 0
	G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["4"]["BackgroundTransparency"] = 1
	G2L["4"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["4"]["Name"] = [[Prop]]

	G2L["5"] = Instance.new("UIPadding", G2L["4"])
	G2L["5"]["PaddingTop"] = UDim.new(0, 15)
	G2L["5"]["Name"] = [[Padding]]
	G2L["5"]["PaddingRight"] = UDim.new(0, 15)
	G2L["5"]["PaddingBottom"] = UDim.new(0, 15)
	G2L["5"]["PaddingLeft"] = UDim.new(0, 15)

	G2L["6"] = Instance.new("TextLabel", G2L["4"])
	G2L["6"]["ZIndex"] = 6
	G2L["6"]["BorderSizePixel"] = 0
	G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Left
	G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	G2L["6"]["TextSize"] = 15
	G2L["6"]["TextColor3"] = Color3.fromRGB(151, 151, 151)
	G2L["6"]["AutomaticSize"] = Enum.AutomaticSize.X
	G2L["6"]["Size"] = UDim2.new(0, 0, 1, 0)
	G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["6"]["Text"] = [[Window Title]]
	G2L["6"]["Name"] = [[Title]]
	G2L["6"]["BackgroundTransparency"] = 1

	G2L["7"] = Instance.new("Frame", G2L["4"])
	G2L["7"]["BorderSizePixel"] = 0
	G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["7"]["BackgroundTransparency"] = 1
	G2L["7"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["7"]["Name"] = [[MainButtons]]

	G2L["8"] = Instance.new("UIListLayout", G2L["7"])
	G2L["8"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
	G2L["8"]["FillDirection"] = Enum.FillDirection.Horizontal
	G2L["8"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Right
	G2L["8"]["Padding"] = UDim.new(0, 10)
	G2L["8"]["SortOrder"] = Enum.SortOrder.LayoutOrder

	G2L["9"] = Instance.new("Frame", G2L["3"])
	G2L["9"]["ZIndex"] = 5
	G2L["9"]["BorderSizePixel"] = 0
	G2L["9"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26)
	G2L["9"]["BackgroundTransparency"] = 0.5
	G2L["9"]["Size"] = UDim2.new(1, 0, 1, 20)
	G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["9"]["Name"] = [[Background]]

	G2L["a"] = Instance.new("UICorner", G2L["9"])
	G2L["a"]["Name"] = [[Round]]
	G2L["a"]["CornerRadius"] = UDim.new(0, 10)

	G2L["b"] = Instance.new("Frame", G2L["3"])
	G2L["b"]["ZIndex"] = 8
	G2L["b"]["BorderSizePixel"] = 0
	G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0)
	G2L["b"]["AnchorPoint"] = Vector2.new(0.5, 1)
	G2L["b"]["BackgroundTransparency"] = 1
	G2L["b"]["Size"] = UDim2.new(0, 0, 0, 1)
	G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["b"]["Position"] = UDim2.new(0.5, 0, 1, 0)
	G2L["b"]["Name"] = [[IncompleteUnderline]]

	G2L["c"] = Instance.new("Frame", G2L["3"])
	G2L["c"]["ZIndex"] = 7
	G2L["c"]["BorderSizePixel"] = 0
	G2L["c"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51)
	G2L["c"]["AnchorPoint"] = Vector2.new(0.5, 1)
	G2L["c"]["BackgroundTransparency"] = 1
	G2L["c"]["Size"] = UDim2.new(1, 0, 0, 1)
	G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["c"]["Position"] = UDim2.new(0.5, 0, 1, 0)
	G2L["c"]["Name"] = [[CompleteUnderline]]

	G2L["d"] = Instance.new("Frame", G2L["2"])
	G2L["d"]["ZIndex"] = -10
	G2L["d"]["BorderSizePixel"] = 0
	G2L["d"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26)
	G2L["d"]["BackgroundTransparency"] = 0.10000000149011612
	G2L["d"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["d"]["Name"] = [[Background]]

	G2L["e"] = Instance.new("UICorner", G2L["d"])
	G2L["e"]["Name"] = [[Round]]
	G2L["e"]["CornerRadius"] = UDim.new(0, 10)

	G2L["f"] = Instance.new("ImageLabel", G2L["d"])
	G2L["f"]["ZIndex"] = -11
	G2L["f"]["BorderSizePixel"] = 0
	G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["f"]["ImageColor3"] = Color3.fromRGB(22, 22, 22)
	G2L["f"]["ImageTransparency"] = 0.20000000298023224
	G2L["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	G2L["f"]["Image"] = [[rbxassetid://5587865193]]
	G2L["f"]["Size"] = UDim2.new(1.600000023841858, 0, 1.2999999523162842, 0)
	G2L["f"]["Name"] = [[DropShadow]]
	G2L["f"]["BackgroundTransparency"] = 1
	G2L["f"]["Position"] = UDim2.new(0.5074800252914429, 0, 0.5098000168800354, 0)

	G2L["10"] = Instance.new("ImageLabel", G2L["d"])
	G2L["10"]["ZIndex"] = -11
	G2L["10"]["BorderSizePixel"] = 0
	G2L["10"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["10"]["ImageTransparency"] = 0.20000000298023224
	G2L["10"]["Image"] = [[rbxassetid://16255699706]]
	G2L["10"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["10"]["Name"] = [[Image]]
	G2L["10"]["BackgroundTransparency"] = 1

	G2L["11"] = Instance.new("UICorner", G2L["10"])
	G2L["11"]["Name"] = [[Round]]
	G2L["11"]["CornerRadius"] = UDim.new(0, 15)

	G2L["12"] = Instance.new("Folder", G2L["2"])
	G2L["12"]["Name"] = [[Interactive]]

	G2L["13"] = Instance.new("Frame", G2L["12"])
	G2L["13"]["ZIndex"] = 100
	G2L["13"]["BorderSizePixel"] = 0
	G2L["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["13"]["AnchorPoint"] = Vector2.new(1, 0)
	G2L["13"]["BackgroundTransparency"] = 1
	G2L["13"]["Size"] = UDim2.new(0, 50, 1, 0)
	G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["13"]["Position"] = UDim2.new(1, 0, 0, 0)
	G2L["13"]["Name"] = [[MusicGradient]]

	G2L["14"] = Instance.new("UIGradient", G2L["13"])
	G2L["14"]["Transparency"] = NumberSequence.new{NumberSequenceKeypoint.new(0.000, 0.5),NumberSequenceKeypoint.new(1.000, 0.5)}
	G2L["14"]["Name"] = [[Gradient]]
	G2L["14"]["Rotation"] = 180
	G2L["14"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(255, 0, 0)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(26, 26, 26))}
	G2L["14"]["Offset"] = Vector2.new(0.5, 0)

	G2L["15"] = Instance.new("UICorner", G2L["13"])
	G2L["15"]["Name"] = [[Round]]
	G2L["15"]["CornerRadius"] = UDim.new(0, 10)

	G2L["16"] = Instance.new("ImageLabel", G2L["12"])
	G2L["16"]["ZIndex"] = 20
	G2L["16"]["BorderSizePixel"] = 0
	G2L["16"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["16"]["ImageTransparency"] = 1
	G2L["16"]["Image"] = [[http://www.roblox.com/asset/?id=874674558]]
	G2L["16"]["Size"] = UDim2.new(1, 0, 0, 50)
	G2L["16"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["16"]["Name"] = [[HeaderShadow]]
	G2L["16"]["BackgroundTransparency"] = 1
	G2L["16"]["Position"] = UDim2.new(0, 0, 0, 50)

	G2L["17"] = Instance.new("UIPadding", G2L["16"])
	G2L["17"]["PaddingTop"] = UDim.new(0, 15)
	G2L["17"]["Name"] = [[Padding]]
	G2L["17"]["PaddingRight"] = UDim.new(0, 15)
	G2L["17"]["PaddingBottom"] = UDim.new(0, 5)
	G2L["17"]["PaddingLeft"] = UDim.new(0, 15)

	G2L["18"] = Instance.new("TextLabel", G2L["16"])
	G2L["18"]["TextTruncate"] = Enum.TextTruncate.AtEnd
	G2L["18"]["ZIndex"] = 21
	G2L["18"]["BorderSizePixel"] = 0
	G2L["18"]["TextYAlignment"] = Enum.TextYAlignment.Bottom
	G2L["18"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["18"]["TextXAlignment"] = Enum.TextXAlignment.Left
	G2L["18"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	G2L["18"]["TextTransparency"] = 1
	G2L["18"]["TextSize"] = 13
	G2L["18"]["TextColor3"] = Color3.fromRGB(151, 151, 151)
	G2L["18"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["18"]["Text"] = [[This is a description for label]]
	G2L["18"]["Name"] = [[Desc]]
	G2L["18"]["BackgroundTransparency"] = 1

	G2L["19"] = Instance.new("TextLabel", G2L["16"])
	G2L["19"]["TextTruncate"] = Enum.TextTruncate.AtEnd
	G2L["19"]["ZIndex"] = 21
	G2L["19"]["BorderSizePixel"] = 0
	G2L["19"]["TextYAlignment"] = Enum.TextYAlignment.Top
	G2L["19"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["19"]["TextXAlignment"] = Enum.TextXAlignment.Left
	G2L["19"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal)
	G2L["19"]["TextTransparency"] = 1
	G2L["19"]["TextSize"] = 15
	G2L["19"]["TextColor3"] = Color3.fromRGB(236, 236, 236)
	G2L["19"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["19"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["19"]["Text"] = [[Header Label]]
	G2L["19"]["Name"] = [[Label]]
	G2L["19"]["BackgroundTransparency"] = 1

	G2L["1a"] = Instance.new("ImageLabel", G2L["12"])
	G2L["1a"]["ZIndex"] = 20
	G2L["1a"]["BorderSizePixel"] = 0
	G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["1a"]["ImageTransparency"] = 1
	G2L["1a"]["Image"] = [[http://www.roblox.com/asset/?id=874674558]]
	G2L["1a"]["Size"] = UDim2.new(1, 0, 0.4000000059604645, 0)
	G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["1a"]["Name"] = [[HoverShadow]]
	G2L["1a"]["BackgroundTransparency"] = 1
	G2L["1a"]["Position"] = UDim2.new(0, 0, 0, 50)

	G2L["1b"] = Instance.new("Frame", G2L["2"])
	G2L["1b"]["BorderSizePixel"] = 0
	G2L["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["1b"]["AnchorPoint"] = Vector2.new(0, 1)
	G2L["1b"]["BackgroundTransparency"] = 1
	G2L["1b"]["Size"] = UDim2.new(1, 0, 1, -50)
	G2L["1b"]["ClipsDescendants"] = true
	G2L["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["1b"]["Position"] = UDim2.new(0, 0, 1, 0)
	G2L["1b"]["Name"] = [[Container]]

	G2L["1c"] = Instance.new("UIScale", G2L["2"])
	G2L["1c"]["Name"] = [[Scale]]

	G2L["1d"] = Instance.new("Frame", G2L["2"])
	G2L["1d"]["ZIndex"] = 99999
	G2L["1d"]["BorderSizePixel"] = 0
	G2L["1d"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["1d"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	G2L["1d"]["BackgroundTransparency"] = 1
	G2L["1d"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["1d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["1d"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
	G2L["1d"]["Name"] = [[Intro]]

	G2L["1e"] = Instance.new("Frame", G2L["1d"])
	G2L["1e"]["ZIndex"] = -10
	G2L["1e"]["BorderSizePixel"] = 0
	G2L["1e"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26)
	G2L["1e"]["BackgroundTransparency"] = 1
	G2L["1e"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["1e"]["Name"] = [[Background]]

	G2L["1f"] = Instance.new("UIGridLayout", G2L["1e"])
	G2L["1f"]["FillDirection"] = Enum.FillDirection.Vertical
	G2L["1f"]["StartCorner"] = Enum.StartCorner.BottomLeft
	G2L["1f"]["VerticalAlignment"] = Enum.VerticalAlignment.Bottom
	G2L["1f"]["SortOrder"] = Enum.SortOrder.LayoutOrder
	G2L["1f"]["Name"] = [[Grid]]
	G2L["1f"]["CellSize"] = UDim2.new(0.20000000298023224, 0, 0.20000000298023224, 0)
	G2L["1f"]["CellPadding"] = UDim2.new(0, 0, 0, 0)

	G2L["20"] = Instance.new("Frame", G2L["1d"])
	G2L["20"]["ZIndex"] = 99999
	G2L["20"]["BorderSizePixel"] = 0
	G2L["20"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26)
	G2L["20"]["BackgroundTransparency"] = 1
	G2L["20"]["Size"] = UDim2.new(0.20000000298023224, 0, 0.20000000298023224, 0)
	G2L["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["20"]["Name"] = [[Template]]

	G2L["21"] = Instance.new("UICorner", G2L["20"])
	G2L["21"]["Name"] = [[Round]]
	G2L["21"]["CornerRadius"] = UDim.new(1, 0)

	G2L["22"] = Instance.new("UIScale", G2L["20"])
	G2L["22"]["Scale"] = 1.0000000116860974e-07
	G2L["22"]["Name"] = [[Scale]]

	G2L["23"] = Instance.new("ImageLabel", G2L["1d"])
	G2L["23"]["ZIndex"] = -11
	G2L["23"]["BorderSizePixel"] = 0
	G2L["23"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["23"]["ImageColor3"] = Color3.fromRGB(22, 22, 22)
	G2L["23"]["ImageTransparency"] = 1
	G2L["23"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
	G2L["23"]["Image"] = [[rbxassetid://5587865193]]
	G2L["23"]["Size"] = UDim2.new(1.600000023841858, 0, 1.2999999523162842, 0)
	G2L["23"]["Name"] = [[DropShadow]]
	G2L["23"]["BackgroundTransparency"] = 1
	G2L["23"]["Position"] = UDim2.new(0.5074800252914429, 0, 0.5098000168800354, 0)

	G2L["24"] = Instance.new("UIScale", G2L["1d"])
	G2L["24"]["Name"] = [[MusicScale]]

	G2L["25"] = Instance.new("Frame", G2L["2"])
	G2L["25"]["ZIndex"] = 25
	G2L["25"]["BorderSizePixel"] = 0
	G2L["25"]["BackgroundColor3"] = Color3.fromRGB(26, 26, 26)
	G2L["25"]["AnchorPoint"] = Vector2.new(0, 1)
	G2L["25"]["BackgroundTransparency"] = 1
	G2L["25"]["Size"] = UDim2.new(1, 0, 1, -50)
	G2L["25"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["25"]["Position"] = UDim2.new(0, 0, 1, 0)
	G2L["25"]["Visible"] = false
	G2L["25"]["Name"] = [[Menu]]

	G2L["26"] = Instance.new("ScrollingFrame", G2L["25"])
	G2L["26"]["Active"] = true
	G2L["26"]["ZIndex"] = 26
	G2L["26"]["BorderSizePixel"] = 0
	G2L["26"]["CanvasSize"] = UDim2.new(0, 0, 0, 0)
	G2L["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["26"]["AnchorPoint"] = Vector2.new(0, 1)
	G2L["26"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
	G2L["26"]["BackgroundTransparency"] = 1
	G2L["26"]["Size"] = UDim2.new(1, 0, 1, -40)
	G2L["26"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["26"]["ScrollBarThickness"] = 0
	G2L["26"]["Position"] = UDim2.new(0, 0, 1, 0)
	G2L["26"]["Name"] = [[Buttons]]

	G2L["27"] = Instance.new("UIPadding", G2L["26"])
	G2L["27"]["PaddingTop"] = UDim.new(0, 30)
	G2L["27"]["Name"] = [[Padding]]
	G2L["27"]["PaddingBottom"] = UDim.new(0, 15)

	G2L["28"] = Instance.new("UIListLayout", G2L["26"])
	G2L["28"]["Name"] = [[Layout]]
	G2L["28"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
	G2L["28"]["Padding"] = UDim.new(0, 10)
	G2L["28"]["SortOrder"] = Enum.SortOrder.LayoutOrder

	G2L["29"] = Instance.new("UIPadding", G2L["25"])
	G2L["29"]["Name"] = [[Padding]]

	G2L["2a"] = Instance.new("Frame", G2L["25"])
	G2L["2a"]["BorderSizePixel"] = 0
	G2L["2a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["2a"]["BackgroundTransparency"] = 1
	G2L["2a"]["Size"] = UDim2.new(1, 0, 0, 40)
	G2L["2a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["2a"]["Name"] = [[Top]]

	G2L["2b"] = Instance.new("TextBox", G2L["2a"])
	G2L["2b"]["PlaceholderColor3"] = Color3.fromRGB(151, 151, 151)
	G2L["2b"]["ZIndex"] = 26
	G2L["2b"]["BorderSizePixel"] = 0
	G2L["2b"]["TextSize"] = 15
	G2L["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left
	G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
	G2L["2b"]["TextColor3"] = Color3.fromRGB(236, 236, 236)
	G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal)
	G2L["2b"]["BackgroundTransparency"] = 0.5
	G2L["2b"]["PlaceholderText"] = [[Search for pages!]]
	G2L["2b"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["2b"]["Text"] = [[]]
	G2L["2b"]["Name"] = [[Search]]
	G2L["2b"]["ClearTextOnFocus"] = false
	G2L["2b"]["ClipsDescendants"] = true

	G2L["2c"] = Instance.new("UICorner", G2L["2b"])
	G2L["2c"]["Name"] = [[Corner]]
	G2L["2c"]["CornerRadius"] = UDim.new(0, 10)

	G2L["2d"] = Instance.new("UIPadding", G2L["2b"])
	G2L["2d"]["PaddingTop"] = UDim.new(0, 15)
	G2L["2d"]["Name"] = [[Padding]]
	G2L["2d"]["PaddingRight"] = UDim.new(0, 15)
	G2L["2d"]["PaddingBottom"] = UDim.new(0, 15)
	G2L["2d"]["PaddingLeft"] = UDim.new(0, 15)

	G2L["2g"] = Instance.new("UIStroke", G2L["2b"]);
	G2L["2g"]["Color"] = Color3.fromRGB(51, 51, 51);
	G2L["2g"]["Name"] = [[Outline]];
	G2L["2g"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
	G2L["2g"]["Transparency"] = 1

	G2L["2e"] = Instance.new("UICorner", G2L["25"])
	G2L["2e"]["Name"] = [[Round]]
	G2L["2e"]["CornerRadius"] = UDim.new(0, 10)

	G2L["2f"] = Instance.new("ImageButton", G2L["25"])
	G2L["2f"]["ZIndex"] = 24
	G2L["2f"]["BorderSizePixel"] = 0
	G2L["2f"]["ImageTransparency"] = 1
	G2L["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
	G2L["2f"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]]
	G2L["2f"]["Size"] = UDim2.new(1, 0, 1, 0)
	G2L["2f"]["Name"] = [[Overlay]]
	G2L["2f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
	G2L["2f"]["BackgroundTransparency"] = 1

	G2L["2g"] = Instance.new("UIDragDetector", G2L["2"])
	G2L["2g"]["Name"] = "Drag"

	local gui = G2L["1"]
	local main = G2L["2"]
	local header = main:WaitForChild("Header")
	local intro = main:WaitForChild("Intro")
	local menu = main:WaitForChild("Menu")
	local container = main:WaitForChild("Container")
	local background = main:WaitForChild("Background")
	local dropShadow = background:WaitForChild("DropShadow")
	local interactive = main:WaitForChild("Interactive")
	
	local dragDetector = main:WaitForChild("Drag")

	local title = header.Prop.Title

	local responsive = self.Modules.Resuponshibu.new()
	local textAnim = self.Modules.TextAnimation.new()
	local fade = self.Modules.Fade
	local smoothScroll = self.Modules.SmoothScroll
	local ripple = self.Modules.Ripple
	local searchModule = self.Modules.SearchModule
	local tabControl = self.Modules.TabControl.new()
	local states = self.Modules.States.new(main, main.Drag, {
		SPEED = .5,

		EASING_STYLE = Enum.EasingStyle.Quint,
		EASING_DIRECTION = Enum.EasingDirection.Out,

		MINIMIZED_SIZE = UDim2.new(0,header.Prop.Title.AbsoluteSize.X + 350,0,50),

		ON_MINIMIZED = function()
			container.Visible = false
			background.Visible = false
		end,
		ON_MAXIMIZED = function()end,
		ON_NORMALIZE = function()
			container.Visible = true
			background.Visible = true
		end,
	})

	local blur = nil
	local selectedPage = nil

	local loading = true

	responsive:Set(gui, 1600, true)
	smoothScroll(menu.Buttons, .05)
	searchModule(menu.Top.Search, menu.Buttons)
	
	local snapDragonController = self.Modules.SnapDragon.createDragController(menu, {
		SnapEnabled = false,
	})
	snapDragonController:SetEnabled(false)
	
	local function switchDrag()
		if self.Services.GuiService.MenuIsOpen then
			snapDragonController:SetEnabled(true)
			dragDetector.Enabled = false
		else
			snapDragonController:SetEnabled(false)
			dragDetector.Enabled = true
		end
	end
	
	switchDrag()
	self.addConn("ROBLOX_MENU", self.Services.GuiService:GetPropertyChangedSignal("MenuIsOpen"):Connect(function()
		switchDrag()
	end))

	self.addConn("SEARCH_FOCUSED", menu.Top.Search.Focused:Connect(function()
		self.tween(menu.Top.Search, TweenInfo.new(.5), {BackgroundTransparency = 0})
		self.tween(menu.Top.Search.Outline, TweenInfo.new(.5), {Transparency = 0})
		ripple:PopRipple(menu.Top.Search, {
			Color = theme.THEME_COLOR,
			Speed = .5
		})
	end))
	self.addConn("SEARCH_FOCUSLOST", menu.Top.Search.FocusLost:Connect(function()
		if #menu.Top.Search.Text <= 0 then
			self.tween(menu.Top.Search, TweenInfo.new(.5), {BackgroundTransparency = 0.5})
			self.tween(menu.Top.Search.Outline, TweenInfo.new(.5), {Transparency = 1})
		end
	end))



	self.addConn("HEADER_HOVER", header.MouseEnter:Connect(function()
		self.tween(interactive.HeaderShadow, TweenInfo.new(.5), {ImageTransparency = .7})
		self.tween(header.Background, TweenInfo.new(.5), {BackgroundTransparency = 0})
		self.tween(header.IncompleteUnderline, TweenInfo.new(.5), {Size = UDim2.new(1,0,0,1)})
		header.IncompleteUnderline.BackgroundTransparency = 0
		self.tween(header.IncompleteUnderline, TweenInfo.new(.5), {BackgroundTransparency = 1})
		self.tween(header.CompleteUnderline, TweenInfo.new(2), {BackgroundTransparency = 0})
	end))
	self.addConn("HEADER_UNHOVER", header.MouseLeave:Connect(function()
		self.tween(interactive.HeaderShadow, TweenInfo.new(.5), {ImageTransparency = 1})
		self.tween(header.Background, TweenInfo.new(.5), {BackgroundTransparency = .5})
		self.tween(header.IncompleteUnderline, TweenInfo.new(.5), {Size = UDim2.new(0,0,0,1)})
		header.IncompleteUnderline.BackgroundTransparency = 1
		self.tween(header.IncompleteUnderline, TweenInfo.new(.5), {BackgroundTransparency = 0})
		self.tween(header.CompleteUnderline, TweenInfo.new(2), {BackgroundTransparency = 1})
	end))

	winTable.Instances = G2L

	winTable.circleButton = function(config)
		local circleTable = {}
		local G2L = {}

		config = self.validateConfig({
			NAME = "Circle Button",
			ICON = 0,

			PARENT = winTable.Instances["1"],

			SIZE = UDim2.new(0, 20, 0, 20),

			CALLBACK = function()
				print("Clicked")
			end,
		}, config)

		G2L["2"] = Instance.new("ImageButton", G2L["1"])
		G2L["2"]["ZIndex"] = 6
		G2L["2"]["BorderSizePixel"] = 0
		G2L["2"]["ImageTransparency"] = 1
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		G2L["2"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]]
		G2L["2"]["Size"] = UDim2.new(0, 20, 0, 20)
		G2L["2"]["Name"] = [[element]]
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		G2L["2"]["Position"] = UDim2.new(1, 0, 0.5, 0)
		G2L["2"]["BackgroundTransparency"] = 1

		G2L["3"] = Instance.new("ImageLabel", G2L["2"])
		G2L["3"]["ZIndex"] = 6
		G2L["3"]["BorderSizePixel"] = 0
		G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
		G2L["3"]["ImageTransparency"] = 1
		G2L["3"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
		G2L["3"]["Image"] = [[http://www.roblox.com/asset/?id=5552526748]]
		G2L["3"]["Size"] = UDim2.new(1.7999999523162842, 0, 1.7999999523162842, 0)
		G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		G2L["3"]["Name"] = [[Ripple]]
		G2L["3"]["BackgroundTransparency"] = 1
		G2L["3"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

		G2L["4"] = Instance.new("UIScale", G2L["3"])
		G2L["4"]["Scale"] = 1.0000000116860974e-07
		G2L["4"]["Name"] = [[Scale]]

		G2L["5"] = Instance.new("ImageLabel", G2L["2"])
		G2L["5"]["ZIndex"] = 7
		G2L["5"]["ImageColor3"] = Color3.fromRGB(151, 151, 151)
		G2L["5"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
		G2L["5"]["Image"] = [[rbxassetid://2777727756]]
		G2L["5"]["Size"] = UDim2.new(1, 0, 1, 0)
		G2L["5"]["BorderColor3"] = Color3.fromRGB(28, 43, 54)
		G2L["5"]["Name"] = [[Icon]]
		G2L["5"]["BackgroundTransparency"] = 1
		G2L["5"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)

		G2L["6"] = Instance.new("UIScale", G2L["2"])
		G2L["6"]["Name"] = [[ClickScale]]

		local button = G2L["2"]
		local icon = button.Icon
		local ripple = button.Ripple
		local clickScale = button.ClickScale

		circleTable.Instances = G2L

		button.Parent = config.PARENT

		self.addConn("CIRCLE_BUTTON_HOVER", button.MouseEnter:Connect(function()
			self.tween(ripple.Scale, TweenInfo.new(0.25), {Scale = 1})
			self.tween(ripple, TweenInfo.new(0.5), {ImageTransparency = theme.RIPPLE_TRANSPARENCY})
			self.tween(ripple, TweenInfo.new(0.5), {BackgroundColor3 = theme.RIPPLE})
			self.tween(icon, TweenInfo.new(.5), {ImageColor3 = theme.REGULAR_TEXT})
		end))
		self.addConn("CIRCLE_BUTTON_UNHOVER", button.MouseLeave:Connect(function()
			self.tween(ripple.Scale, TweenInfo.new(0.25), {Scale = 0})
			self.tween(ripple, TweenInfo.new(0.15), {ImageTransparency = 1})
			self.tween(icon, TweenInfo.new(.5), {ImageColor3 = theme.SHADED_TEXT})
		end))
		self.addConn("CIRCLE_BUTTON_ACTIVATED", button.Activated:Connect(function()
			--_t._sounds.CircleClick:Play()
			self.spawn(function()
				task.wait()
				self.tween(clickScale, TweenInfo.new(0.1), {Scale = 1.1})
				self.tween(ripple, TweenInfo.new(0.1), {ImageTransparency = theme.RIPPLE_CLICK_TRANSPARENCY})
				task.wait(.05)
				self.tween(clickScale, TweenInfo.new(0.1), {Scale = 1})
				self.tween(ripple, TweenInfo.new(0.25), {ImageTransparency = theme.RIPPLE_TRANSPARENCY})
			end)
			config.CALLBACK()
		end))
		self.addConn("CIRCLE_BUTTON_MOUSEHOLD", button.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch) then
				self.tween(clickScale, TweenInfo.new(1), {Scale = .8})
				self.tween(ripple, TweenInfo.new(0.5), {ImageTransparency = theme.RIPPLE_CLICK_TRANSPARENCY})
			end
		end))
		self.addConn("CIRCLE_BUTTON_MOUSERELEASED", button.InputEnded:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch) then
				self.tween(clickScale, TweenInfo.new(0.1), {Scale = 1})
				self.tween(ripple, TweenInfo.new(0.1), {ImageTransparency = theme.RIPPLE_TRANSPARENCY})
			end
		end))

		circleTable.changeIcon = function(iconId)
			icon.Image = `rbxassetid://{iconId}`
		end
		circleTable.changeName = function(name)
			button.Name = name
		end

		circleTable.changeIcon(config.ICON)
		circleTable.changeName(config.NAME)

		button.Size = config.SIZE
		self.onSwitchTheme(function(theme)
			icon.ImageColor3 = theme.SHADED_TEXT
			ripple.ImageColor3 = theme.RIPPLE_COLOR
		end)

		return circleTable
	end
	winTable.pageButton = function(config)
		local buttonTable = {}
		local G2L = {}

		config = self.validateConfig({
			NAME = "Page Button",
			DESCRIPTION = "This is a description",
			ICON = 0,
		}, config)

		G2L["2"] = Instance.new("ImageButton", G2L["1"]);
		G2L["2"]["ZIndex"] = 26;
		G2L["2"]["BorderSizePixel"] = 0;
		G2L["2"]["ImageTransparency"] = 1;
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["2"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
		G2L["2"]["Size"] = UDim2.new(1, 0, 0, 50);
		G2L["2"]["Name"] = [[element]];
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["2"]["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.element.Container
		G2L["3"] = Instance.new("Frame", G2L["2"]);
		G2L["3"]["ZIndex"] = 25;
		G2L["3"]["BorderSizePixel"] = 0;
		G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["3"]["BackgroundTransparency"] = 1;
		G2L["3"]["Size"] = UDim2.new(1, 0, 1, 0);
		G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["3"]["Name"] = [[Container]];

		-- StarterGui.ScreenGui.element.Container.Padding
		G2L["4"] = Instance.new("UIPadding", G2L["3"]);
		G2L["4"]["PaddingTop"] = UDim.new(0, 5);
		G2L["4"]["Name"] = [[Padding]];
		G2L["4"]["PaddingRight"] = UDim.new(0, 5);
		G2L["4"]["PaddingBottom"] = UDim.new(0, 5);
		G2L["4"]["PaddingLeft"] = UDim.new(0, 5);

		-- StarterGui.ScreenGui.element.Container.Icon
		G2L["5"] = Instance.new("ImageLabel", G2L["3"]);
		G2L["5"]["ZIndex"] = 26;
		G2L["5"]["BorderSizePixel"] = 0;
		G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["5"]["ImageColor3"] = Color3.fromRGB(255, 0, 0);
		G2L["5"]["ImageTransparency"] = 1;
		G2L["5"]["AnchorPoint"] = Vector2.new(0, 0.5);
		G2L["5"]["Image"] = [[rbxassetid://119893371750481]];
		G2L["5"]["Size"] = UDim2.new(0, 25, 0, 25);
		G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["5"]["Name"] = [[Icon]];
		G2L["5"]["BackgroundTransparency"] = 1;
		G2L["5"]["Position"] = UDim2.new(0, 5, 0.5, 0);

		-- StarterGui.ScreenGui.element.Container.Title
		G2L["6"] = Instance.new("TextLabel", G2L["3"]);
		G2L["6"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
		G2L["6"]["ZIndex"] = 26;
		G2L["6"]["BorderSizePixel"] = 0;
		G2L["6"]["TextYAlignment"] = Enum.TextYAlignment.Top;
		G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
		G2L["6"]["TextTransparency"] = 1;
		G2L["6"]["TextSize"] = 14;
		G2L["6"]["TextColor3"] = Color3.fromRGB(236, 236, 236);
		G2L["6"]["Size"] = UDim2.new(1, 0, 1, 0);
		G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["6"]["Text"] = [[Title]];
		G2L["6"]["Name"] = [[Title]];
		G2L["6"]["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.element.Container.Title.Padding
		G2L["7"] = Instance.new("UIPadding", G2L["6"]);
		G2L["7"]["PaddingTop"] = UDim.new(0, 5);
		G2L["7"]["Name"] = [[Padding]];
		G2L["7"]["PaddingRight"] = UDim.new(0, 40);
		G2L["7"]["PaddingLeft"] = UDim.new(0, 40);

		-- StarterGui.ScreenGui.element.Container.Desc
		G2L["8"] = Instance.new("TextLabel", G2L["3"]);
		G2L["8"]["TextTruncate"] = Enum.TextTruncate.AtEnd;
		G2L["8"]["ZIndex"] = 26;
		G2L["8"]["BorderSizePixel"] = 0;
		G2L["8"]["TextYAlignment"] = Enum.TextYAlignment.Bottom;
		G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
		G2L["8"]["TextTransparency"] = 1;
		G2L["8"]["TextSize"] = 13;
		G2L["8"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
		G2L["8"]["Size"] = UDim2.new(1, 0, 1, 0);
		G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["8"]["Text"] = [[Description for this page]];
		G2L["8"]["Name"] = [[Desc]];
		G2L["8"]["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.element.Container.Desc.Padding
		G2L["9"] = Instance.new("UIPadding", G2L["8"]);
		G2L["9"]["PaddingTop"] = UDim.new(0, 5);
		G2L["9"]["Name"] = [[Padding]];
		G2L["9"]["PaddingRight"] = UDim.new(0, 40);
		G2L["9"]["PaddingBottom"] = UDim.new(0, 5);
		G2L["9"]["PaddingLeft"] = UDim.new(0, 40);

		-- StarterGui.ScreenGui.element.Underline
		G2L["a"] = Instance.new("Frame", G2L["2"]);
		G2L["a"]["ZIndex"] = 26;
		G2L["a"]["BorderSizePixel"] = 0;
		G2L["a"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
		G2L["a"]["AnchorPoint"] = Vector2.new(0.5, 1);
		G2L["a"]["BackgroundTransparency"] = 1;
		G2L["a"]["Size"] = UDim2.new(1, 0, 0, 1);
		G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["a"]["Position"] = UDim2.new(0.5, 0, 1, 0);
		G2L["a"]["Name"] = [[Underline]];

		-- StarterGui.ScreenGui.element.Corner
		G2L["b"] = Instance.new("UICorner", G2L["2"]);
		G2L["b"]["Name"] = [[Corner]];
		G2L["b"]["CornerRadius"] = UDim.new(0, 10);

		-- StarterGui.ScreenGui.element.Scale
		G2L["c"] = Instance.new("UIScale", G2L["2"]);
		G2L["c"]["Scale"] = 0.949999988079071;
		G2L["c"]["Name"] = [[Scale]];

		local button = G2L["2"]
		local container = button.Container
		local underline = button.Underline
		local icon = container.Icon
		local title = container.Title
		local description = container.Desc

		buttonTable.changeName = function(name, iconId, desc)
			if name then
				button.Name = name
				title.Text = name
			end
			if iconId then
				icon.Image = `rbxassetid://{iconId}`
			end
			if desc then
				description.Text = desc
			end
		end
		buttonTable.Instance = button

		buttonTable.changeName(config.NAME, config.ICON, config.DESCRIPTION)
		self.onSwitchTheme(function(theme)
			title.TextColor3 = theme.REGULAR_TEXT
			description.TextColor3 = theme.SHADED_TEXT
			icon.ImageColor3 = theme.THEME_COLOR
			button.BackgroundColor3 = theme.THEME_COLOR
			underline.BackgroundColor3 = theme.UNDERLINE
		end)

		return buttonTable
	end
	winTable.changeName = function(name)
		if not name then
			name = ""
		end

		name = tostring(name)

		title.Text = name
		gui.Name = math.random(1, 99999999)
		main.Name = math.random(1, 99999999)

		textAnim:PopText(title, TweenInfo.new(.5, Enum.EasingStyle.Elastic), -10, .05)
	end
	winTable.setWindowState = function(state)
		states:ChangeState(state)
		if state == "normal" then
			header.Prop.MainButtons.Maximize.Icon.Image = `rbxassetid://{11036884234}`
			header.Prop.MainButtons.Minimize.Icon.Image = `rbxassetid://{17601421663}`
		elseif state == "minimize" then
			header.Prop.MainButtons.Maximize.Icon.Image = `rbxassetid://{11036884234}`
			header.Prop.MainButtons.Minimize.Icon.Image = `rbxassetid://{17612085260}`
		elseif state == "maximize" then
			header.Prop.MainButtons.Maximize.Icon.Image = `rbxassetid://{10137941941}`
			header.Prop.MainButtons.Minimize.Icon.Image = `rbxassetid://{17601421663}`
		end
	end
	winTable.toggleMinimize = function()
		if states:CheckState("_minimized") then
			winTable.setWindowState("normal")
		else
			winTable.setWindowState("minimize")
		end
	end
	winTable.toggleMaximize = function()
		if states:CheckState("_maximized") then
			winTable.setWindowState("normal")
		else
			winTable.setWindowState("maximize")
		end
	end
	winTable.openMenu = function()
		if (not menuOpened)
			and (not states:CheckState("_minimized"))
		then
			task.spawn(function()
				menuOpened = true
				menu.Visible = menuOpened

				interactive.HeaderShadow.Visible = false

				self.tween(menu, TweenInfo.new(.5), {BackgroundTransparency = .1})

				self.tween(menu.Padding, TweenInfo.new(.5), {PaddingLeft = UDim.new(0, 15)})
				self.tween(menu.Padding, TweenInfo.new(.5), {PaddingRight = UDim.new(0, 15)})
				self.tween(menu.Padding, TweenInfo.new(.5), {PaddingTop = UDim.new(0, 15)})
				self.tween(menu.Padding, TweenInfo.new(.5), {PaddingBottom = UDim.new(0, 15)})

				self.tween(menu.Top.Search, TweenInfo.new(.5), {BackgroundTransparency = .5})
				self.tween(menu.Top.Search, TweenInfo.new(.5), {TextTransparency = 0})
				
				if #menu.Top.Search.Text > 0 then
					self.tween(menu.Top.Search.Outline, TweenInfo.new(.5), {Transparency = 0})
				end
				
				task.wait(.2)
				for _, button in ipairs(menu.Buttons:GetChildren()) do
					if button:IsA("ImageButton") then
						button.Underline.Visible = true
						self.tween(button.Container.Desc, TweenInfo.new(.5), {TextTransparency = 0})
						self.tween(button.Container.Title, TweenInfo.new(.5), {TextTransparency = 0})
						self.tween(button.Container.Icon, TweenInfo.new(.5), {ImageTransparency = 0})
						self.tween(button.Underline, TweenInfo.new(.5), {BackgroundTransparency = 0})
						self.tween(button.Scale, TweenInfo.new(.5), {Scale = 1})
						if selectedPage then
							self.tween(selectedPage.temp, TweenInfo.new(.5), {BackgroundTransparency = .85})
							selectedPage.temp.Underline.Visible = false
						end
						if button:GetAttribute("Selected") == true then
							self.tween(button, TweenInfo.new(.5), {BackgroundTransparency = .9})
						end
						task.wait(.05)
					end
				end
			end)
		end
	end
	winTable.closeMenu = function()
		self.spawn(function()
			menuOpened = false

			interactive.HeaderShadow.Visible = true

			self.tween(menu, TweenInfo.new(.5), {BackgroundTransparency = 1})

			self.tween(menu.Padding, TweenInfo.new(.5), {PaddingLeft = UDim.new(0, 0)})
			self.tween(menu.Padding, TweenInfo.new(.5), {PaddingRight = UDim.new(0, 0)})
			self.tween(menu.Padding, TweenInfo.new(.5), {PaddingTop = UDim.new(0, 0)})
			self.tween(menu.Padding, TweenInfo.new(.5), {PaddingBottom = UDim.new(0, 0)})

			self.tween(menu.Top.Search, TweenInfo.new(.5), {BackgroundTransparency = 1})
			self.tween(menu.Top.Search, TweenInfo.new(.5), {TextTransparency = 1})
			self.tween(menu.Top.Search.Outline, TweenInfo.new(.5), {Transparency = 1})
			task.spawn(function()
				for _, button in ipairs(menu.Buttons:GetChildren()) do
					if button:IsA("ImageButton") then
						self.tween(button.Container.Desc, TweenInfo.new(.5), {TextTransparency = 1})
						self.tween(button.Container.Title, TweenInfo.new(.5), {TextTransparency = 1})
						self.tween(button.Container.Icon, TweenInfo.new(.5), {ImageTransparency = 1})
						self.tween(button.Underline, TweenInfo.new(.5), {BackgroundTransparency = 1})
						self.tween(button, TweenInfo.new(.5), {BackgroundTransparency = 1})
						self.tween(button.Scale, TweenInfo.new(.5), {Scale = .95})
						task.wait(.05)
					end
				end
			end)
			task.wait(.5)
			menu.Visible = menuOpened
		end)
	end
	winTable.addHoverLabel = function(button, title, desc)
		self.addConn("OBJECT_HOVER", button.MouseEnter:Connect(function()
			interactive.HeaderShadow.Label.Text = title
			interactive.HeaderShadow.Desc.Text = desc
			interactive.HeaderShadow.Label.TextTransparency = 1
			interactive.HeaderShadow.Desc.TextTransparency = 1
			interactive.HeaderShadow.Padding.PaddingLeft = UDim.new(0,0)

			self.tween(interactive.HeaderShadow.Padding, TweenInfo.new(.5), {PaddingLeft = UDim.new(0, 15)})

			self.tween(interactive.HeaderShadow.Label, TweenInfo.new(.5), {TextTransparency = 0})
			self.tween(interactive.HeaderShadow.Desc, TweenInfo.new(.5), {TextTransparency = 0})
			self.tween(interactive.HeaderShadow, TweenInfo.new(.5), {ImageTransparency = theme.HEADER_SHADOW_TRANSPARENCY})
			self.tween(interactive.HoverShadow, TweenInfo.new(.5), {ImageTransparency = theme.HEADER_SHAODW_BOTTOM_TRANSPARENCY})
		end))
		self.addConn("OBJECT_UNHOVER", button.MouseLeave:Connect(function()
			self.tween(interactive.HeaderShadow.Label, TweenInfo.new(.5), {TextTransparency = 1})
			self.tween(interactive.HeaderShadow.Desc, TweenInfo.new(.5), {TextTransparency = 1})
			self.tween(interactive.HeaderShadow, TweenInfo.new(.5), {ImageTransparency = theme.HEADER_SHADOW_TRANSPARENCY})
			self.tween(interactive.HeaderShadow, TweenInfo.new(.5), {BackgroundTransparency = 1})
			self.tween(interactive.HoverShadow, TweenInfo.new(.5), {ImageTransparency = 1})
		end))
	end
	winTable.toggleMenu = function()
		if menuOpened then
			winTable.closeMenu(menu, interactive)
		else
			winTable.openMenu(menu, interactive)
		end
	end
	winTable.defaultTheme = function()
		theme = self.selectTheme(self.LibConfig.THEMES, self.LibConfig.DEFAULT_THEME)
	end
	winTable.theme = theme
	winTable.lib = self

	function winTable:Page(config)
		repeat task.wait() until not loading

		local pageTable = {}
		local G2L = {}

		local self = winTable.lib

		config = self.validateConfig({
			TITLE = "Page",
			DESCRIPTION = "This is a description",
			ICON = 0,
			
			LAYOUT_TYPE = "list",
			LAYOUT_PROPERTIES = {
				["Padding"] = UDim.new(0, 10),
				["SortOrder"] = Enum.SortOrder.LayoutOrder,
			},
			
			SEARCH_ENABLED = true,
		}, config)

		G2L["2"] = Instance.new("ScrollingFrame", container);
		G2L["2"]["Active"] = true;
		G2L["2"]["BorderSizePixel"] = 0;
		G2L["2"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["2"]["BackgroundTransparency"] = 1;
		G2L["2"]["Size"] = UDim2.new(1, 0, 1, 0);
		G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["2"]["ScrollBarThickness"] = 0;
		G2L["2"]["Name"] = [[element]];

		G2L["3"] = Instance.new("TextLabel", G2L["2"]);
		G2L["3"]["TextWrapped"] = true;
		G2L["3"]["BorderSizePixel"] = 0;
		G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		G2L["3"]["TextSize"] = 15;
		G2L["3"]["TextColor3"] = Color3.fromRGB(236, 236, 236);
		G2L["3"]["Size"] = UDim2.new(.5, 0, 0, 20);
		G2L["3"]["TextTruncate"] = Enum.TextTruncate.AtEnd
		G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["3"]["Text"] = [[Title]];
		G2L["3"]["Name"] = [[Title]];
		G2L["3"]["BackgroundTransparency"] = 1;

		G2L["4"] = Instance.new("Frame", G2L["3"]);
		G2L["4"]["BorderSizePixel"] = 0;
		G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
		G2L["4"]["AnchorPoint"] = Vector2.new(0, 1);
		G2L["4"]["Size"] = UDim2.new(0, 15, 0, 1);
		G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["4"]["Position"] = UDim2.new(0, 0, 1, 0);
		G2L["4"]["Name"] = [[Underline]];

		G2L["5"] = Instance.new("ImageLabel", G2L["2"]);
		G2L["5"]["ImageColor3"] = Color3.fromRGB(255, 0, 0);
		G2L["5"]["AnchorPoint"] = Vector2.new(1, 0.5);
		G2L["5"]["Image"] = [[rbxassetid://119893371750481]];
		G2L["5"]["Size"] = UDim2.new(0, 20, 0, 20);
		G2L["5"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
		G2L["5"]["Name"] = [[Icon]];
		G2L["5"]["BackgroundTransparency"] = 1;
		G2L["5"]["Position"] = UDim2.new(1, 0, 0, 10);

		G2L["6"] = Instance.new("UIPadding", G2L["2"]);
		G2L["6"]["PaddingTop"] = UDim.new(0, 15);
		G2L["6"]["Name"] = [[Padding]];
		G2L["6"]["PaddingRight"] = UDim.new(0, 15);
		G2L["6"]["PaddingBottom"] = UDim.new(0, 15);
		G2L["6"]["PaddingLeft"] = UDim.new(0, 15);

		G2L["7"] = Instance.new("ScrollingFrame", G2L["2"]);
		G2L["7"]["BorderSizePixel"] = 0;
		G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		G2L["7"]["AnchorPoint"] = Vector2.new(0, 1);
		G2L["7"]["BackgroundTransparency"] = 1;
		G2L["7"]["Size"] = UDim2.new(1, 0, 1, -40);
		G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		G2L["7"]["Position"] = UDim2.new(0, 0, 1, 0);
		G2L["7"]["Name"] = [[Content]];
		G2L["7"]["ScrollBarThickness"] = 5;
		G2L["7"]["ScrollBarImageTransparency"] = 0;
		G2L["7"]["CanvasSize"] = UDim2.new(0,0,0,0);
		G2L["7"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
		
		if type(config.LAYOUT_TYPE) == "string" then
			local layoutType = config.LAYOUT_TYPE:lower()
			if layoutType == "list" then
				local layout = Instance.new("UIListLayout", G2L["7"])
				layout.Name = [[ListLayout]]
				
				self.propertiesApply(layout, config.LAYOUT_PROPERTIES)
			elseif layoutType == "grid" then
				local layout = Instance.new("UIGridLayout", G2L["7"])
				layout.Name = [[GridLayout]]
				
				self.propertiesApply(layout, config.LAYOUT_PROPERTIES)
			end
		end

		G2L["9"] = Instance.new("UIPadding", G2L["7"]);
		G2L["9"]["PaddingTop"] = UDim.new(0, 15);
		G2L["9"]["Name"] = [[Padding]];
		G2L["9"]["PaddingRight"] = UDim.new(0, 10);
		G2L["9"]["PaddingBottom"] = UDim.new(0, 10);
		G2L["9"]["PaddingLeft"] = UDim.new(0, 10);
		
		G2L["2b"] = Instance.new("TextBox", G2L["2"])
		G2L["2b"]["PlaceholderColor3"] = Color3.fromRGB(151, 151, 151)
		G2L["2b"]["ZIndex"] = 3
		G2L["2b"]["BorderSizePixel"] = 0
		G2L["2b"]["TextSize"] = 15
		G2L["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left
		G2L["2b"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36)
		G2L["2b"]["TextColor3"] = Color3.fromRGB(236, 236, 236)
		G2L["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal)
		G2L["2b"]["BackgroundTransparency"] = 0.5
		G2L["2b"]["PlaceholderText"] = [[Search]]
		G2L["2b"]["Size"] = UDim2.new(.35, 0, 0, 30)
		G2L["2b"]["Position"] = UDim2.new(1, -35, 0, -5)
		G2L["2b"]["AnchorPoint"] = Vector2.new(1, 0)
		G2L["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
		G2L["2b"]["Text"] = [[]]
		G2L["2b"]["Name"] = [[Search]]
		G2L["2b"]["ClearTextOnFocus"] = false
		G2L["2b"]["ClipsDescendants"] = true

		G2L["2c"] = Instance.new("UICorner", G2L["2b"])
		G2L["2c"]["Name"] = [[Corner]]
		G2L["2c"]["CornerRadius"] = UDim.new(0, 10)

		G2L["2d"] = Instance.new("UIPadding", G2L["2b"])
		G2L["2d"]["PaddingTop"] = UDim.new(0, 15)
		G2L["2d"]["Name"] = [[Padding]]
		G2L["2d"]["PaddingRight"] = UDim.new(0, 15)
		G2L["2d"]["PaddingBottom"] = UDim.new(0, 15)
		G2L["2d"]["PaddingLeft"] = UDim.new(0, 15)

		G2L["2g"] = Instance.new("UIStroke", G2L["2b"]);
		G2L["2g"]["Color"] = Color3.fromRGB(51, 51, 51);
		G2L["2g"]["Name"] = [[Outline]];
		G2L["2g"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;
		G2L["2g"]["Transparency"] = 1

		local frame = G2L["2"]
		local content = frame.Content
		local title = frame.Title
		local search = frame.Search
		local icon = frame.Icon

		smoothScroll(content)
		searchModule(search, content)
		
		if config.SEARCH_ENABLED then
			search.Visible = true else
			search.Visible = false
		end

		local buttonTable = winTable.pageButton({
			NAME = config.TITLE,
			DESCRIPTION = config.DESCRIPTION,
			ICON = config.ICON,
		})
		local button = buttonTable.Instance

		button.Parent = menu.Buttons

		local tabModule = tabControl:AddTab(button, config.TITLE, function(session)
			selectedPage = session

			winTable.closeMenu()
			frame.Visible = true
			self.tween(frame, TweenInfo.new(1.5, Enum.EasingStyle.Quint), {Position = UDim2.new(0,0,0,0)})
		end, function()
			self.spawn(function(tab)
				local tween = self.tween(frame, TweenInfo.new(2,  Enum.EasingStyle.Quint), {Position = UDim2.new(0,0,1,0)})
				tween.Completed:Wait()
				frame.Visible = tab.active
			end)
		end)

		pageTable.changeName = function(name, iconId, desc)
			if name then
				title.Text = name
				frame.Name = name
				button.Name = name
			end
			if iconId then
				icon.Image = `rbxassetid://{iconId}`
			end
			buttonTable.changeName(name, iconId, desc)
		end
		
		self.addConn("SEARCH_FOCUSED", search.Focused:Connect(function()
			self.tween(search, TweenInfo.new(.5), {BackgroundTransparency = 0})
			self.tween(search.Outline, TweenInfo.new(.5), {Transparency = 0})
			ripple:PopRipple(search, {
				Color = theme.THEME_COLOR,
				Speed = .5
			})
		end))
		self.addConn("SEARCH_FOCUSLOST", search.FocusLost:Connect(function()
			if #search.Text <= 0 then
				self.tween(search, TweenInfo.new(.5), {BackgroundTransparency = 0.5})
				self.tween(search.Outline, TweenInfo.new(.5), {Transparency = 1})
			end
		end))

		function pageTable:Button(config)
			local buttonTable = {}
			local G2L = {}

			local self = winTable.lib

			config = self.validateConfig({
				NAME = "Button",
				DESCRIPTION = "This is a description",

				CALLBACK = function()
					print("Clicked button!")
				end,
			}, config)

			G2L["2"] = Instance.new("ImageButton", G2L["1"]);
			G2L["2"]["BorderSizePixel"] = 0;
			G2L["2"]["AutoButtonColor"] = false;
			G2L["2"]["ImageTransparency"] = 1;
			G2L["2"]["BackgroundColor3"] = Color3.fromRGB(36, 36, 36);
			G2L["2"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
			G2L["2"]["Size"] = UDim2.new(1, 0, 0, 40);
			G2L["2"]["Name"] = [[Button]];
			G2L["2"]["ClipsDescendants"] = true;
			G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["2"]["BackgroundTransparency"] = .8;

			G2L["3"] = Instance.new("TextLabel", G2L["2"]);
			G2L["3"]["BorderSizePixel"] = 0;
			G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["3"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			G2L["3"]["TextSize"] = 14;
			G2L["3"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
			G2L["3"]["AutomaticSize"] = Enum.AutomaticSize.X;
			G2L["3"]["Size"] = UDim2.new(0, 0, 0, 20);
			G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["3"]["Text"] = [[Button Example]];
			G2L["3"]["Name"] = [[Title]];
			G2L["3"]["BackgroundTransparency"] = 1;
			G2L["3"]["Position"] = UDim2.new(0, 0, 0, -10);
			G2L["3"]["RichText"] = true;

			G2L["4"] = Instance.new("UIPadding", G2L["3"]);
			G2L["4"]["PaddingLeft"] = UDim.new(0, 25);

			G2L["5"] = Instance.new("UIPadding", G2L["2"]);
			G2L["5"]["PaddingTop"] = UDim.new(0, 20);
			G2L["5"]["Name"] = [[Padding]];
			G2L["5"]["PaddingRight"] = UDim.new(0, 15);
			G2L["5"]["PaddingBottom"] = UDim.new(0, 15);
			G2L["5"]["PaddingLeft"] = UDim.new(0, 15);

			G2L["6"] = Instance.new("UICorner", G2L["2"]);
			G2L["6"]["Name"] = [[Round]];

			G2L["7"] = Instance.new("ImageLabel", G2L["2"]);
			G2L["7"]["ImageColor3"] = Color3.fromRGB(255, 0, 0);
			G2L["7"]["AnchorPoint"] = Vector2.new(0, 0.5);
			G2L["7"]["Image"] = [[rbxassetid://14549269851]];
			G2L["7"]["Size"] = UDim2.new(0, 15, 0, 15);
			G2L["7"]["BorderColor3"] = Color3.fromRGB(28, 43, 54);
			G2L["7"]["Name"] = [[Icon]];
			G2L["7"]["BackgroundTransparency"] = 1;

			G2L["8"] = Instance.new("UIStroke", G2L["2"]);
			G2L["8"]["Color"] = Color3.fromRGB(51, 51, 51);
			G2L["8"]["Name"] = [[Outline]];
			G2L["8"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			G2L["9"] = Instance.new("TextLabel", G2L["2"]);
			G2L["9"]["BorderSizePixel"] = 0;
			G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["9"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
			G2L["9"]["TextSize"] = 14;
			G2L["9"]["TextColor3"] = Color3.fromRGB(151, 151, 151);
			G2L["9"]["AutomaticSize"] = Enum.AutomaticSize.Y;
			G2L["9"]["Size"] = UDim2.new(0, 0, 0, 20);
			G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["9"]["Text"] = [[This is a description]];
			G2L["9"]["Name"] = [[Description]];
			G2L["9"]["BackgroundTransparency"] = 1;
			G2L["9"]["Position"] = UDim2.new(0, 0, 0, 25);

			G2L["a"] = Instance.new("UIPadding", G2L["9"]);
			G2L["a"]["PaddingLeft"] = UDim.new(0, 25);

			G2L["b"] = Instance.new("UIScale", G2L["2"]);
			G2L["b"]["Name"] = [[ClickScale]];

			local button = G2L["2"]
			local outline = button.Outline
			local icon = button.Icon
			local description = button.Description
			local title = button.Title

			local lastSize = button.Size

			local descOpened = false

			local descButton = winTable.circleButton({
				NAME = "Description Activate",
				ICON = 2717396089,

				SIZE = UDim2.new(0, 15, 0, 15),

				PARENT = button,

				CALLBACK = function()
					if not descOpened then
						descOpened = not descOpened
						self.tween(button, TweenInfo.new(.5), {
							Size = UDim2.new(lastSize.X.Scale, lastSize.X.Offset, lastSize.Y.Scale, description.AbsoluteSize.Y + 55)
						})
					else
						descOpened = not descOpened
						self.tween(button, TweenInfo.new(.5), {Size = lastSize})
					end
				end,
			})
			descButton.Instances["2"].Position = UDim2.new(1,0,0,-7)
			descButton.Instances["2"].AnchorPoint = Vector2.new(1, 0)

			buttonTable.changeName = function(name, desc)
				if name then
					title.Text = name
					button.Name = name
				end
				if desc then
					description.Text = desc
				end
			end

			self.addConn("BUTTON_CLICK", button.Activated:Connect(function()
				ripple:PopRipple(button, {
					Color = theme.THEME_COLOR,
					Speed = .5
				})
				config.CALLBACK()
			end))
			self.addConn("BUTTON_HOVER", button.MouseEnter:Connect(function()
				self.tween(button, TweenInfo.new(.5), {BackgroundColor3 = theme.LIGHT_BACKGROUND})
				self.tween(button, TweenInfo.new(.5), {BackgroundTransparency = .5})
			end))
			self.addConn("BUTTON_UNHOVER", button.MouseLeave:Connect(function()
				self.tween(button, TweenInfo.new(.5), {BackgroundColor3 = theme.BACKGROUND})
				self.tween(outline, TweenInfo.new(.5), {Color = theme.OUTLINE})
				self.tween(button, TweenInfo.new(.5), {BackgroundTransparency = .8})
			end))
			self.addConn("BUTTON_HOLDING", button.MouseButton1Down:Connect(function()
				self.tween(outline, TweenInfo.new(.5), {Color = theme.THEME_COLOR})
			end))
			self.addConn("BUTTON_UNHOLDING", button.MouseButton1Up:Connect(function()
				self.tween(outline, TweenInfo.new(.5), {Color = theme.OUTLINE})
			end))

			self.onSwitchTheme(function(theme)
				title.TextColor3 = theme.REGULAR_TEXT
				description.TextColor3 = theme.SHADED_TEXT
				outline.Color = theme.OUTLINE
				icon.ImageColor3 = theme.THEME_COLOR
				button.BackgroundColor3 = theme.BACKGROUND
			end)

			button.Parent = content
			buttonTable.changeName(config.NAME, config.DESCRIPTION)
		end
		
		function pageTable:GamePalete(config)
			local gameTable = {}
			local G2L = {}
			
			G2L["2"] = Instance.new("Frame", G2L["1"]);
			G2L["2"]["BorderSizePixel"] = 0;
			G2L["2"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
			G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
			G2L["2"]["Size"] = UDim2.new(0, 250, 0, 175);
			G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["2"]["Name"] = [[GameTemplate]];

			G2L["3"] = Instance.new("ImageLabel", G2L["2"]);
			G2L["3"]["ZIndex"] = 2;
			G2L["3"]["BorderSizePixel"] = 0;
			G2L["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["3"]["Image"] = [["https://www.roblox.com/asset-thumbnail/image?assetId=9872472334&width=768&height=432&format=png"]];
			G2L["3"]["Size"] = UDim2.new(1, 0, 1, -40);
			G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["3"]["BackgroundTransparency"] = 1;
			G2L["3"]["Name"] = [[Thumbnail]];

			G2L["4"] = Instance.new("UICorner", G2L["3"]);
			G2L["4"]["Name"] = [[Corner]];

			G2L["5"] = Instance.new("UICorner", G2L["2"]);
			G2L["5"]["Name"] = [[Corner]];

			G2L["6"] = Instance.new("TextLabel", G2L["2"]);
			G2L["6"]["BorderSizePixel"] = 0;
			G2L["6"]["TextSize"] = 14;
			G2L["6"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
			G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["6"]["BackgroundTransparency"] = 1;
			G2L["6"]["AnchorPoint"] = Vector2.new(0, 1);
			G2L["6"]["Size"] = UDim2.new(1, 0, 0, 40);
			G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["6"]["Text"] = [[Fuzify]];
			G2L["6"]["Name"] = [[GameCreator]];
			G2L["6"]["Position"] = UDim2.new(0, 0, 1, 0);
			G2L["6"]["TextTruncate"] = Enum.TextTruncate.AtEnd

			G2L["7"] = Instance.new("UIPadding", G2L["6"]);
			G2L["7"]["Name"] = [[Padding]];
			G2L["7"]["PaddingLeft"] = UDim.new(0, 35);

			G2L["8"] = Instance.new("ImageLabel", G2L["6"]);
			G2L["8"]["BorderSizePixel"] = 0;
			G2L["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["8"]["AnchorPoint"] = Vector2.new(0, 0.5);
			G2L["8"]["Image"] = [[rbxassetid://7992557358]];
			G2L["8"]["Size"] = UDim2.new(0, 20, 0, 20);
			G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["8"]["BackgroundTransparency"] = 1;
			G2L["8"]["Name"] = [[Icon]];
			G2L["8"]["Position"] = UDim2.new(0, -25, 0.5, 0);
			
			G2L["9"] = Instance.new("TextLabel", G2L["2"]);
			G2L["9"]["ZIndex"] = 2;
			G2L["9"]["BorderSizePixel"] = 0;
			G2L["9"]["TextSize"] = 20;
			G2L["9"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			G2L["9"]["BackgroundTransparency"] = 1;
			G2L["9"]["Size"] = UDim2.new(1, 0, 0, 35);
			G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			G2L["9"]["Text"] = [[Evade]];
			G2L["9"]["Name"] = [[GameName]];
			G2L["9"]["TextTruncate"] = Enum.TextTruncate.AtEnd
			
			local textStroke = Instance.new("UIStroke", G2L["9"])
			textStroke.Thickness = 2
			
			local palete = G2L["2"]
			local gameCreator = palete.GameCreator
			local gameName = palete.GameName
			local thumbnail = palete.Thumbnail

			local self = winTable.lib

			config = self.validateConfig({
				GAME_TABLE = {
					Name = "Game Name",
					Description = "The game's description",
					Creator = "Fuzify",

					Thumbnail = "https://www.roblox.com/asset-thumbnail/image?assetId="..game.PlaceId.."&width=768&height=432&format=png",

					Players = 0,
					MaxPlayers = 0,
					PlaceId = 1234567890,
				}
			}, config)
			
			gameTable.changeGamePalete = function(newTable)
				palete.Name = newTable.Name
				gameName.Text = newTable.Name
				gameCreator.Text = newTable.Creator.Name
				thumbnail.Image = newTable.Thumbnail
			end
			
			gameTable.changeGamePalete(config.GAME_TABLE)
			
			self.onSwitchTheme(function(theme)
				gameName.TextColor3 = theme.REGULAR_TEXT
				gameCreator.TextColor3 = theme.REGULAR_TEXT
				gameCreator.Icon.ImageColor3 = theme.THEME_COLOR
				textStroke.Color = theme.BACKGROUND
				palete.BackgroundColor3 = theme.LIGHT_BACKGROUND
			end)
			
			palete.Parent = content
			
			return gameTable
		end

		pageTable.changeName(config.TITLE, config.ICON)

		frame.Parent = container
		frame.Position = UDim2.new(0,0,1,0)

		self.onSwitchTheme(function(theme)
			title.TextColor3 = theme.REGULAR_TEXT
			title.Underline.BackgroundColor3 = theme.THEME_COLOR
			icon.ImageColor3 = theme.THEME_COLOR
			content.ScrollBarImageColor3 = theme.THEME_COLOR
			
			search.BackgroundColor3 = theme.LIGHT_BACKGROUND
			search.TextColor3 = theme.REGULAR_TEXT
			search.PlaceholderColor3 = theme.SHADED_TEXT
			search.Outline.Color = theme.THEME_COLOR
		end)

		return pageTable
	end

	function winTable:Destroy()
		config.ON_DESTROY(gui)
		gui:Destroy()
	end

	self.spawn(function()
		header.Visible = false
		background.Visible = false
		container.Visible = false
	end)

	self.spawn(function()
		local menuButton = winTable.circleButton({NAME = "Menu", ICON = 2777728378, PARENT = header.Prop, CALLBACK = function()
			winTable.toggleMenu()
		end,})
		menuButton.Instances["2"].Position = UDim2.new(.5, 0, .5, 0)
		menuButton.Instances["2"].AnchorPoint = Vector2.new(.5, .5)
		local minimizeButton = winTable.circleButton({NAME = "Minimize", ICON = 17601421663, PARENT = header.Prop.MainButtons, CALLBACK = function()
			winTable.toggleMinimize()
			winTable.closeMenu()
		end,})
		minimizeButton.Instances["2"].Icon.Size = UDim2.new(0,16,0,16)
		local maximizeButton = winTable.circleButton({NAME = "Maximize", ICON = 11036884234, PARENT = header.Prop.MainButtons, CALLBACK = function()
			winTable.toggleMaximize()
		end,})
		local closeButton = winTable.circleButton({NAME = "Close", ICON = 2777727756, PARENT = header.Prop.MainButtons, CALLBACK = function()
			container.Visible = false
			header.Visible = false
			intro.Visible = true

			if blur then
				blur:Destroy()
			end
			
			winTable.closeMenu()

			self.tween(intro.Background.Grid, TweenInfo.new(.25), {CellSize = UDim2.new(
				.2,
				0,
				.2,
				0
				)
			})
			for _, obj in ipairs(interactive:GetChildren()) do
				if obj:IsA("ImageLabel") or obj:IsA("Frame") then
					obj.Visible = false
				end
			end
			for _, temp in ipairs(intro.Background:GetChildren()) do
				if temp:IsA("Frame") then
					self.tween(temp, TweenInfo.new(.5), {BackgroundTransparency = 0})
					self.tween(temp.Round, TweenInfo.new(.5), {CornerRadius = UDim.new(0,0)})
					self.tween(temp, TweenInfo.new(.5), {BackgroundColor3 = theme.THEME_COLOR})
					task.wait()
				end
			end
			task.wait(.25)

			header.Visible = false
			background.Visible = false
			container.Visible = false

			self.tween(intro.Background.Grid, TweenInfo.new(10), {CellSize = UDim2.new(
				intro.Background.Grid.CellSize.X.Scale,
				intro.Background.Grid.CellSize.X.Offset,
				0,
				0
				)
			})
			for _, temp in ipairs(intro.Background:GetChildren()) do
				if temp:IsA("Frame") then
					self.tween(temp, TweenInfo.new(.5), {BackgroundTransparency = 1})
					self.tween(temp.Round, TweenInfo.new(.5), {CornerRadius = UDim.new(1,0)})
					self.tween(temp, TweenInfo.new(.5), {BackgroundColor3 = theme.THEME_FILL_TEXT})
				end
			end
			task.wait(.5)
			winTable:Destroy()
		end,})

		winTable.addHoverLabel(menuButton.Instances["2"], "Menu", "Opens the menu to the other pages.")
		winTable.addHoverLabel(closeButton.Instances["2"], "Close", "Closes the entire window. [Cannot open again]")
		winTable.addHoverLabel(maximizeButton.Instances["2"], "Maximize", "Makes the window go in fullscreen.")
		winTable.addHoverLabel(minimizeButton.Instances["2"], "Minimize", "Minimizes the winodw")
	end)

	self.spawn(function()
		for i = 1, 25 do
			local temp = intro.Template:Clone()
			temp.BackgroundColor3 = theme.THEME_COLOR
			temp.Parent = intro.Background

			self.tween(temp, TweenInfo.new(.5), {BackgroundTransparency = 0})
			self.tween(temp.Scale, TweenInfo.new(.5), {Scale = 1})
			self.tween(temp.Round, TweenInfo.new(.5), {CornerRadius = UDim.new(0,0)})
			task.wait()
		end
		for _, temp in ipairs(intro.Background:GetChildren()) do
			if temp:IsA("Frame") then
				self.tween(temp, TweenInfo.new(.5), {BackgroundColor3 = theme.THEME_FILL_TEXT})
				task.wait()
			end
		end
		self.tween(intro.Background.Grid, TweenInfo.new(10), {CellSize = UDim2.new(
			intro.Background.Grid.CellSize.X.Scale,
			intro.Background.Grid.CellSize.X.Offset,
			0,
			0
			)
		})
		for _, temp in ipairs(intro.Background:GetChildren()) do
			if temp:IsA("Frame") then
				self.tween(temp, TweenInfo.new(.5), {BackgroundTransparency = 1})
				self.tween(temp.Round, TweenInfo.new(.5), {CornerRadius = UDim.new(1,0)})
				--task.wait()
			end
		end
		task.wait(.5)
		intro.Visible = false

		fade:FadeClose(main, 0)
		background.Visible = true
		task.wait(.1)
		fade:FadeOpen(main, .25)
		container.Visible = true
		task.wait(.25)
		header.Visible = true
		winTable.changeName(config.TITLE)
		loading = false
	end)

	self.onSwitchTheme(function(theme)
		background.BackgroundColor3 = theme.BACKGROUND
		dropShadow.ImageColor3 = theme.DROPSHADOW
		dropShadow.ImageTransparency = theme.DROPSHADOW_TRANSPARENCY
		background.Image.Image = `rbxassetid://{theme.BACKGROUND_IMAGE}`
		background.Image.ImageTransparency = theme.BACKGROUND_IMAGE_TRANSPARENCY
		background.Image.ImageColor3 = theme.BACKGROUND_IMAGE_COLOR

		header.Background.BackgroundColor3 = theme.BACKGROUND
		header.Background.BackgroundTransparency = theme.HEADER_TRANSPARENCY
		header.IncompleteUnderline.BackgroundColor3 = theme.THEME_COLOR
		header.CompleteUnderline.BackgroundColor3 = theme.UNDERLINE

		menu.BackgroundColor3 = theme.BACKGROUND
		menu.Top.Search.BackgroundColor3 = theme.LIGHT_BACKGROUND
		menu.Top.Search.TextColor3 = theme.REGULAR_TEXT
		menu.Top.Search.PlaceholderColor3 = theme.SHADED_TEXT
		menu.Top.Search.Outline.Color = theme.THEME_COLOR

		interactive.HeaderShadow.ImageColor3 = theme.HEADER_SHADOW
		interactive.HeaderShadow.Label.TextColor3 = theme.REGULAR_TEXT
		interactive.HeaderShadow.Desc.TextColor3 = theme.SHADED_TEXT
		interactive.HoverShadow.ImageColor3 = theme.HEADER_SHADOW

		title.TextColor3 = theme.SHADED_TEXT
	end)

	return winTable
end

return Library
