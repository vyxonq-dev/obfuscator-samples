--[[
UPD : 2/26/23 12:53AM EST
UPD DSC : FIXED MOST OF CONFIG LOADING + ADDED OUTLINE

modified stormy.solutions ui lib
find an example by just looking for stormy.solutions online
wsg ma ;) btw this isnt the actual script, ITS JUST THE UI LIBRARY, idk why people wanna send me this thinking it is
--]]
getgenv().values = {}
local library = {}
function library:New(name)
local Signal = loadstring(game:HttpGet("https://nyulachan.github.io/nyula/Nyula/Signal"))()
library.ConfigSave = Signal.new("ConfigSave")
library.ConfigLoad = Signal.new("ConfigLoad")
library.OnlineConfigLoad = Signal.new("OnlineConfigLoad")

local ConfigSave = library.ConfigSave
local ConfigLoad = library.ConfigLoad
local OnlineConfigLoad = library.OnlineConfigLoad

local txt = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
function library:Tween(...) TweenService:Create(...):Play() end
local cfglocation = "nyula/configs/"
if not isfolder("nyula") then
    makefolder("nyula")
end
if not isfolder("nyula/configs") then
    makefolder("nyula/configs")
end
if not isfolder("nyula/luas") then
    makefolder("nyula/luas")
end

local Vec2 = Vector2.new
local Vec3 = Vector3.new
local CF = CFrame.new
local INST = Instance.new
local COL3 = Color3.new
local COL3RGB = Color3.fromRGB
local COL3HSV = Color3.fromHSV
local CLAMP = math.clamp
local DEG = math.deg
local FLOOR = math.floor
local ACOS = math.acos
local RANDOM = math.random
local ATAN2 = math.atan2
local HUGE = math.huge
local RAD = math.rad
local MIN = math.min
local POW = math.pow
local UDIM2 = UDim2.new
local CFAngles = CFrame.Angles
local FIND = string.find
local LEN = string.len
local SUB = string.sub
local GSUB = string.gsub
local RAY = Ray.new
local INSERT = table.insert
local TBLFIND = table.find
local TBLREMOVE = table.remove
local TBLSORT = table.sort


function rgbtotbl(rgb)
	return {R = rgb.R, G = rgb.G, B = rgb.B}
end
function tbltorgb(tbl)
	return COL3(tbl.R, tbl.G, tbl.B)
end
function String2Clr(text)
    local wdh = string.split(text)
    return Color3.fromRGB(wdh[1],wdh[2],wdh[3])
end
function clrtoRGB(RGB)
    return Color3.new(RGB.R*255,RGB.G*255,RGB.B*255)
end
local function deepCopy(original)
	local copy = {}
	for k, v in pairs(original) do
		if type(v) == "table" then
			v = deepCopy(v)
		end
		copy[k] = v
	end
	return copy
end
function library:ConfigFix(cfg)
	local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation..cfg..".txt"))
	for i,Tabs in pairs(copy) do
		for i,Sectors in pairs(Tabs) do
			for i,Elements in pairs(Sectors) do
				if Elements.Color ~= nil then
					local a = Elements.Color
					Elements.Color = String2Clr(a)
				end
			end
		end
	end
	return copy
end
function library:SaveConfig(cfg)
	local copy = deepCopy(values)
	for i,Tabs in pairs(copy) do
		for i,Sectors in pairs(Tabs) do
			for i,Elements in pairs(Sectors) do
				if Elements.Color ~= nil then
				    local a = Elements.Color
				    Elements.Color = tostring(a)
				elseif type(Elements) == "table" then
				    for i,v in pairs(Elements) do
				        if type(v) == "table" then
				            local a = v.Color
				            v.Color = tostring(v.Color)
				            v.Toggle = v.Toggle
				            v.FixedByNyula = true -- holy shit this took a while to do
				            v.Text = v.Text
				            --[[
				            for n,m in pairs(v) do
				                print(n,m)
				            end
				            --]]
				        end
				    end
				end
			end
		end
	end
	writefile(cfglocation..cfg..".txt", game:GetService("HttpService"):JSONEncode(copy))
end
function library:OnlineConfigFix(cfg)
	local copy = cfg
	for i,Tabs in pairs(copy) do
		for i,Sectors in pairs(Tabs) do
			for i,Elements in pairs(Sectors) do
				if Elements.Color ~= nil then
					local a = Elements.Color
					Elements.Color = tbltorgb(a)
				end
			end
		end
	end
	return copy
end
function library:OnlineDeepCopy(original)
	local copy = {}
	for k, v in pairs(original) do
		if type(v) == "table" then
			v = library:OnlineDeepCopy(v)
		end
		copy[k] = v
	end
	return copy
end
    
    
    
	local menu = {}

	local Ova = INST("ScreenGui")
	local Menu = INST("ImageLabel")
	local TextLabel = INST("TextLabel")
	local TabButtons = INST("Frame")
	local UIListLayout = INST("UIListLayout")
	local Tabs = INST("Frame")

	Ova.Name = "nyula"
	Ova.ResetOnSpawn = false
	Ova.ZIndexBehavior = "Global"
	Ova.DisplayOrder = 420133769

	local UIScale = INST("UIScale")
	UIScale.Parent = Ova

	function menu:SetScale(scale)
		UIScale.Scale = scale
	end

	local but = INST("TextButton")
	but.Modal = true
	but.Text = ""
	but.BackgroundTransparency = 1
	but.Parent = Ova

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()

	Menu.Name = "Menu"
	Menu.Parent = Ova
	Menu.BackgroundColor3 = COL3RGB(20, 20, 20)
	Menu.Position = UDIM2(0.5, -300, 0.5, -300)
	Menu.Size = UDIM2(0, 610, 0, 400)
	Menu.Image = "http://www.roblox.com/asset/?id=7265208537"
	Menu.BorderSizePixel = 2.5
	Menu.BorderColor3 = Color3.fromRGB(48, 113, 169)
	-- ondihpar

	library.uiopen = true
	
	function library:ToggleMenu()
		Ova.Enabled = not Ova.Enabled
		library.uiopen = Ova.Enabled
	end	
    
	library.dragging = false
	do
		local UserInputService = game:GetService("UserInputService")
		local a = Menu
		local dragInput
		local dragStart
		local startPos
		local function update(input)
			local delta = input.Position - dragStart
			a.Position = UDIM2(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
		a.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				library.dragging = true
				dragStart = input.Position
				startPos = a.Position

				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						library.dragging = false
					end
				end)
			end
		end)
		a.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				dragInput = input
			end
		end)
		UserInputService.InputChanged:Connect(function(input)
			if input == dragInput and library.dragging then
				update(input)
			end
		end)
	end

	TextLabel.Parent = Menu
	TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1
	TextLabel.Position = UDIM2(0, 7, 0, 0)
	TextLabel.Size = UDIM2(0, 0, 0, 29)
	TextLabel.Size = UDIM2(0, txt:GetTextSize(name, 15, Enum.Font.SourceSansSemibold, Vec2(700, TextLabel.AbsoluteSize.Y)).X, 0, 29)
	TextLabel.Font = Enum.Font.SourceSansSemibold
	TextLabel.Text = name
	TextLabel.TextColor3 = COL3RGB(255, 255, 255)
	TextLabel.TextSize = 15.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left

	TabButtons.Name = "TabButtons"
	TabButtons.Parent = Menu
	TabButtons.BackgroundColor3 = COL3RGB(255, 255, 255)
	TabButtons.BackgroundTransparency = 1
	TabButtons.Position = UDIM2(TextLabel.Size.X.Scale, TextLabel.Size.X.Offset+10, 0, 0)
	TabButtons.Size = UDIM2(TextLabel.Size.X.Scale, 590-TextLabel.Size.X.Offset, 0, 29)

	UIListLayout.Parent = TabButtons
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center

	Tabs.Name = "Tabs"
	Tabs.Parent = Menu
	Tabs.BackgroundColor3 = COL3RGB(255, 255, 255)
	Tabs.BackgroundTransparency = 1.000
	Tabs.Position = UDIM2(0, 0, 0, 32)
	Tabs.Size = UDIM2(0, 610, 0, 400)

	local first = true
	local currenttab

	function menu:Tab(text)
		local tabname
		tabname = text
		local Tab = {}
		values[tabname] = {}

		local TextButton = INST("TextButton")
		TextButton.BackgroundColor3 = COL3RGB(255, 255, 255)
		TextButton.BackgroundTransparency = 1
		TextButton.Size = UDIM2(0, txt:GetTextSize(text, 15, Enum.Font.SourceSansSemibold, Vec2(700,700)).X+12, 1, 0)
		TextButton.Font = Enum.Font.SourceSansSemibold
		TextButton.Text = text
		TextButton.TextColor3 = COL3RGB(200, 200, 200)
		TextButton.TextSize = 15.000
		TextButton.Parent = TabButtons

		local TabGui = INST("ImageLabel")
		local Left = INST("ScrollingFrame")
		local UIListLayout = INST("UIListLayout")
		local Right = INST("ScrollingFrame")
		local UIListLayout_2 = INST("UIListLayout")

		TabGui.Name = "TabGui"
		TabGui.Parent = Tabs
		TabGui.BackgroundColor3 = COL3RGB(0, 0, 0)
		TabGui.BackgroundTransparency = 1.000
		TabGui.Size = UDIM2(1, 0, 1, 0)
		TabGui.Visible = false
		TabGui.Image = "rbxassetid://0"
		TabGui.ImageColor3 = Color3.fromRGB(0, 0, 0)
		TabGui.ScaleType = Enum.ScaleType.Tile
		TabGui.TileSize = UDim2.new(0, 80, 0, 80)

		Left.Name = "Left"
		Left.Parent = TabGui
		Left.BackgroundColor3 = COL3RGB(255, 255, 255)
		Left.BackgroundTransparency = 1.000
		Left.Position = UDIM2(0, 15, 0, 11)
		Left.Size = UDIM2(0, 279, 0, 543)
		Left.BorderSizePixel = 0
		Left.ScrollBarThickness = 4
		Left.AutomaticCanvasSize = "Y"
		Left.ScrollBarImageColor3 = Color3.fromRGB(48, 113, 169)
		Left.CanvasSize = UDIM2(0, 0, 0, 0)
		

		UIListLayout.Parent = Left
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 10)

		Right.Name = "Right"
		Right.Parent = TabGui
		Right.BackgroundColor3 = COL3RGB(255, 255, 255)
		Right.BackgroundTransparency = 1.000
		Right.Position = UDIM2(0, 303, 0, 11)
		Right.Size = UDIM2(0, 279, 0, 543)
		Right.BorderSizePixel = 0
		Right.ScrollBarThickness = 4
		Right.AutomaticCanvasSize = "Y"
		Right.ScrollBarImageColor3 = Color3.fromRGB(48, 113, 169)
		Right.CanvasSize = UDIM2(0, 0, 0, 0)


		UIListLayout_2.Parent = Right
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 10)

		if first then
			TextButton.TextColor3 = COL3RGB(255, 255, 255)
			currenttab = text
			TabGui.Visible = true
			first = false
		end

		TextButton.MouseButton1Down:Connect(function()
			if currenttab ~= text then
				for i,v in pairs(TabButtons:GetChildren()) do
					if v:IsA("TextButton") then
						library:Tween(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
					end
				end
				for i,v in pairs(Tabs:GetChildren()) do
					v.Visible = false
				end
				library:Tween(TextButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
				currenttab = text
				TabGui.Visible = true
			end
		end)

		function Tab:MSector(text, side)
			local sectorname = text
			local MSector = {}
			values[tabname][text] = {}


			local Section = INST("Frame")
			local SectionText = INST("TextLabel")
			local Inner = INST("Frame")
			local sectiontabs = INST("Frame")
			local UIListLayout_2 = INST("UIListLayout")

			Section.Name = "Section"
			Section.Parent = TabGui[side]
			Section.BackgroundColor3 = COL3RGB(20,20,20)
			Section.BorderColor3 = COL3RGB(24,24,24)
			Section.BorderSizePixel = 0
			Section.Size = UDIM2(1, 0, 0, 33)

			SectionText.Name = "SectionText"
			SectionText.Parent = Section
			SectionText.BackgroundColor3 = COL3RGB(255, 255, 255)
			SectionText.BackgroundTransparency = 1.000
			--SectionText.Position = UDIM2(0, 7, 0, -12)
			SectionText.Position = UDIM2(0, 7, 0, -6)
			SectionText.Size = UDIM2(0, 270, 0, 19)
			SectionText.ZIndex = 2
			SectionText.Font = Enum.Font.SourceSansSemibold
			SectionText.Text = text
			SectionText.TextColor3 = COL3RGB(255, 255, 255)
			SectionText.TextSize = 15.000
			SectionText.TextXAlignment = Enum.TextXAlignment.Left
			

			Inner.Name = "Inner"
			Inner.Parent = Section
			Inner.BackgroundColor3 = COL3RGB(20,20,20)
			Inner.BorderColor3 = COL3RGB(0, 0, 0)
			Inner.BorderSizePixel = 0
			Inner.Position = UDIM2(0, 1, 0, 1)
			Inner.Size = UDIM2(1, -2, 1, -9)

			sectiontabs.Name = "sectiontabs"
			sectiontabs.Parent = Section
			sectiontabs.BackgroundColor3 = COL3RGB(255, 255, 255)
			sectiontabs.BackgroundTransparency = 1.000
			sectiontabs.Position = UDIM2(0, 0, 0, 6)
			sectiontabs.Size = UDIM2(1, 0, 0, 22)

			UIListLayout_2.Parent = sectiontabs
			UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout_2.Padding = UDim.new(0,4)

			local firs = true
			local selected
			function MSector:Tab(text)
				local tab = {}
				values[tabname][sectorname][text] = {}
				local tabtext = text

				local tabsize = UDIM2(1, 0, 0, 44)

				local tab1 = INST("Frame")
				local UIPadding = INST("UIPadding")
				local UIListLayout = INST("UIListLayout")
				local TextButton = INST("TextButton")

				tab1.Name = text
				tab1.Parent = Inner
				tab1.BackgroundColor3 = COL3RGB(20,20,20)
				tab1.BorderColor3 = COL3RGB(24,24,24)
				tab1.BorderSizePixel = 0
				tab1.Position = UDIM2(0, 0, 0, 30)
				tab1.Size = UDIM2(1, 0, 1, -21)
				tab1.Name = text
				tab1.Visible = false

				UIPadding.Parent = tab1
				UIPadding.PaddingTop = UDim.new(0, 0)

				UIListLayout.Parent = tab1
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0, 1)

				TextButton.Parent = sectiontabs
				TextButton.BackgroundColor3 = COL3RGB(255, 255, 255)
				TextButton.BackgroundTransparency = 1.000
				TextButton.Size = UDIM2(0, txt:GetTextSize(text, 14, Enum.Font.SourceSansSemibold, Vec2(700,700)).X + 2, 1, 0)
				TextButton.Font = Enum.Font.SourceSansSemibold
				TextButton.Text = text
				TextButton.TextColor3 = COL3RGB(200, 200, 200)
				TextButton.TextSize = 14.000
				TextButton.Name = text

				TextButton.MouseButton1Down:Connect(function()
					for i,v in pairs(Inner:GetChildren()) do
						v.Visible = false
					end
					for i,v in pairs(sectiontabs:GetChildren()) do
						if v:IsA("TextButton") then
							library:Tween(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})
						end
					end
					Section.Size = tabsize
					tab1.Visible = true
					library:Tween(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
				end)

				function tab:Element(type, text, data, callback)
					local Element = {}
					data = data or {}
					callback = callback or function() end
					values[tabname][sectorname][tabtext][text] = {}

					if type == "Jumbobox" then
						tabsize = tabsize + UDIM2(0,0,0, 39)
						Element.value = {Jumbobox = {}}
						data.options = data.options or {}

						local Dropdown = INST("Frame")
						local Button = INST("TextButton")
						local TextLabel = INST("TextLabel")
						local Drop = INST("ScrollingFrame")
						local Button_2 = INST("TextButton")
						local TextLabel_2 = INST("TextLabel")
						local UIListLayout = INST("UIListLayout")
						local ImageLabel = INST("ImageLabel")
						local TextLabel_3 = INST("TextLabel")

						Dropdown.Name = "Dropdown"
						Dropdown.Parent = tab1
						Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255)
						Dropdown.BackgroundTransparency = 1.000
						Dropdown.Position = UDIM2(0, 0, 0.255102038, 0)
						Dropdown.Size = UDIM2(1, 0, 0, 39)

						Button.Name = "Button"
						Button.Parent = Dropdown
						Button.BackgroundColor3 = COL3RGB(24,24,24)
						Button.BorderColor3 = COL3RGB(24,24,24)
						Button.Position = UDIM2(0, 30, 0, 16)
						Button.Size = UDIM2(0, 175, 0, 17)
						Button.AutoButtonColor = false
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = COL3RGB(0, 0, 0)
						Button.TextSize = 14.000

						TextLabel.Parent = Button
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.BorderColor3 = COL3RGB(24,24,24)
						TextLabel.Position = UDIM2(0, 5, 0, 0)
						TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = "..."
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					

						local abcd = TextLabel

						Drop.Name = "Drop"
						Drop.Parent = Button
						Drop.Active = true
						Drop.BackgroundColor3 = COL3RGB(24,24,24)
						Drop.BorderColor3 = COL3RGB(24,24,24)
						Drop.Position = UDIM2(0, 0, 1, 1)
						Drop.Size = UDIM2(1, 0, 0, 20)
						Drop.Visible = false
						Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.CanvasSize = UDIM2(0, 0, 0, 0)
						Drop.ScrollBarThickness = 4
						Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.AutomaticCanvasSize = "Y"
						Drop.ZIndex = 5
						Drop.ScrollBarImageColor3 = COL3RGB(119,0,255)

						UIListLayout.Parent = Drop
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

						values[tabname][sectorname][tabtext][text] = Element.value
						local num = #data.options
						if num > 5 then
							Drop.Size = UDIM2(1, 0, 0, 85)
						else
							Drop.Size = UDIM2(1, 0, 0, 17*num)
						end
						local first = true

						local function updatetext()
							local old = {}
							for i,v in ipairs(data.options) do
								if TBLFIND(Element.value.Jumbobox, v) then
									INSERT(old, v)
								else
								end
							end
							local str = ""


							if #old == 0 then
								str = "..."
							else
								if #old == 1 then
									str = old[1]
								else
									for i,v in ipairs(old) do
										if i == 1 then
											str = v
										else
											if i > 2 then
												if i < 4 then
													str = str..",  ..."
												end
											else
												str = str..",  "..v
											end
										end
									end
								end
							end

							abcd.Text = str
						end
						for i,v in ipairs(data.options) do
							do
								local Button = INST("TextButton")
								local TextLabel = INST("TextLabel")

								Button.Name = v
								Button.Parent = Drop
								Button.BackgroundColor3 = COL3RGB(24,24,24)
								Button.BorderColor3 = COL3RGB(24,24,24)
								Button.Position = UDIM2(0, 30, 0, 16)
								Button.Size = UDIM2(0, 175, 0, 17)
								Button.AutoButtonColor = false
								Button.Font = Enum.Font.SourceSans
								Button.Text = ""
								Button.TextColor3 = COL3RGB(0, 0, 0)
								Button.TextSize = 14.000
								Button.BorderSizePixel = 0
								Button.ZIndex = 6

								TextLabel.Parent = Button
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
								TextLabel.BackgroundTransparency = 1.000
								TextLabel.BorderColor3 = COL3RGB(24,24,24)
								TextLabel.Position = UDIM2(0, 5, 0, -1)
								TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
								TextLabel.Font = Enum.Font.SourceSansSemibold
								TextLabel.Text = v
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)
								TextLabel.TextSize = 14.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left
							
								TextLabel.ZIndex = 6

								Button.MouseButton1Down:Connect(function()
									if TBLFIND(Element.value.Jumbobox, v) then
										for i,a in pairs(Element.value.Jumbobox) do
											if a == v then
												TBLREMOVE(Element.value.Jumbobox, i)
											end
										end
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
									else
										INSERT(Element.value.Jumbobox, v)
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(119,0,255)})
									end
									updatetext()

									values[tabname][sectorname][tabtext][text] = Element.value
									callback(Element.value)
								end)
								Button.MouseEnter:Connect(function()
									if not TBLFIND(Element.value.Jumbobox, v) then
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
									end
								end)
								Button.MouseLeave:Connect(function()
									if not TBLFIND(Element.value.Jumbobox, v) then
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
									end
								end)

								first = false
							end
						end
						function Element:SetValue(val)
							Element.value = val
							for i,v in pairs(Drop:GetChildren()) do
								if v.Name ~= "UIListLayout" then
									if TBLFIND(val.Jumbobox, v.Name) then
										v.TextLabel.TextColor3 = COL3RGB(175, 175, 175)
									else
										v.TextLabel.TextColor3 = COL3RGB(200, 200, 200)
									end
								end
							end
							updatetext()
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(val)
						end
						if data.default then
							Element:SetValue(data.default)
						end

						ImageLabel.Parent = Button
						ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						ImageLabel.BackgroundTransparency = 1.000
						ImageLabel.Position = UDIM2(0, 165, 0, 6)
						ImageLabel.Size = UDIM2(0, 6, 0, 4)
						ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"

						TextLabel_3.Parent = Dropdown
						TextLabel_3.BackgroundColor3 = COL3RGB(200, 200, 200)
						TextLabel_3.BackgroundTransparency = 1.000
						TextLabel_3.Position = UDIM2(0, 32, 0, -1)
						TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)
						TextLabel_3.Font = Enum.Font.SourceSansSemibold
						TextLabel_3.Text = text
						TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel_3.TextSize = 14.000
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

						Button.MouseButton1Down:Connect(function()
							Drop.Visible = not Drop.Visible
							if not Drop.Visible then
								Drop.CanvasPosition = Vec2(0,0)
							end
						end)
						local indrop = false
						local ind = false
						Drop.MouseEnter:Connect(function()
							indrop = true
						end)
						Drop.MouseLeave:Connect(function()
							indrop = false
						end)
						Button.MouseEnter:Connect(function()
							ind = true
						end)
						Button.MouseLeave:Connect(function()
							ind = false
						end)
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								if Drop.Visible == true and not indrop and not ind then
									Drop.Visible = false
									Drop.CanvasPosition = Vec2(0,0)
								end
							end
						end)
					elseif type == "TextBox" then
					tabsize = tabsize + UDIM2(0,0,0,32)
					Element.value = {Text = data.default and data.default.Text or ""}

					local Box = INST("Frame")
					local TextBox = INST("TextBox")

					Box.Name = "Box"
					Box.Parent = tab1
					Box.BackgroundColor3 = COL3RGB(255, 255, 255)
					Box.BackgroundTransparency = 1.000
					Box.Position = UDIM2(0, 0, 0.542059898, 0)
					Box.Size = UDIM2(1, 0, 0, 30)

					TextBox.Parent = Box
					TextBox.BackgroundColor3 = COL3RGB(24,24,24)
					TextBox.BorderColor3 = COL3RGB(24,24,24)
					TextBox.Position = UDIM2(0.108303241, 0, 0.224465579, 0)
					TextBox.Size = UDIM2(0, 175, 0, 20)
					TextBox.Font = Enum.Font.SourceSans
					TextBox.PlaceholderText = data.placeholder
					TextBox.Text = Element.value.Text
					TextBox.TextColor3 = COL3RGB(255, 255, 255)
					TextBox.TextSize = 14.000
					TextBox.ClearTextOnFocus = false

					values[tabname][sectorname][tabtext][text] = Element.value

					TextBox:GetPropertyChangedSignal("Text"):Connect(function()
						if LEN(TextBox.Text) > 10 then
							TextBox.Text = SUB(TextBox.Text, 1, 10)
						end
						Element.value.Text = TextBox.Text
						values[tabname][sectorname][tabtext][text] = Element.value
						callback(Element.value)
					end)

					function Element:SetValue(value)
						Element.value = value
						values[tabname][sectorname][tabtext][text] = Element.value
						TextBox.Text = Element.value.Text
					end

					elseif type == "ToggleKeybind" then
						tabsize = tabsize + UDIM2(0,0,0,16)
						Element.value = {Toggle = data.default and data.default.Toggle or false, Key, Type = "Toggle", Active = false}

						local Toggle = INST("Frame")
						local Button = INST("TextButton")
						local Color = INST("Frame")
						local TextLabel = INST("TextLabel")

						Toggle.Name = "Toggle"
						Toggle.Parent = tab1
						Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000
						Toggle.Size = UDIM2(1, 0, 0, 15)

						Button.Name = "Button"
						Button.Parent = Toggle
						Button.BackgroundColor3 = COL3RGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000
						Button.Size = UDIM2(1, 0, 1, 0)
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = COL3RGB(0, 0, 0)
						Button.TextSize = 14.000

						Color.Name = "Color"
						Color.Parent = Button
						Color.BackgroundColor3 = COL3RGB(24,24,24)
						Color.BorderColor3 = COL3RGB(27, 3275, 35)
						Color.Position = UDIM2(0, 15, 0.5, -5)
						Color.Size = UDIM2(0, 8, 0, 8)
						local binding = false
						TextLabel.Parent = Button
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.Position = UDIM2(0, 32, 0, -1)
						TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = text
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					

						local function update()
							if Element.value.Toggle then
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(119, 0, 255)})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
							else
								
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(24,24,24)})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
							end
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(Element.value)
						end

						Button.MouseButton1Down:Connect(function()
							if not binding then
								Element.value.Toggle = not Element.value.Toggle
								update()
								values[tabname][sectorname][tabtext][text] = Element.value
								callback(Element.value)
							end
						end)
						if data.default then
							update()
						end
						values[tabname][sectorname][tabtext][text] = Element.value
						do
							local Keybind = INST("TextButton")
							local Frame = INST("Frame")
							local Always = INST("TextButton")
							local UIListLayout = INST("UIListLayout")
							local Hold = INST("TextButton")
							local Toggle = INST("TextButton")

							Keybind.Name = "Keybind"
							Keybind.Parent = Button
							Keybind.BackgroundColor3 = COL3RGB(24,24,24)
							Keybind.BorderColor3 = COL3RGB(24,24,24)
							Keybind.Position = UDIM2(0, 270, 0.5, -6)
							Keybind.Text = "NONE"
							Keybind.Size = UDIM2(0, 43, 0, 12)
							Keybind.Size = UDIM2(0,txt:GetTextSize("NONE", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12)
							Keybind.AutoButtonColor = false
							Keybind.Font = Enum.Font.SourceSansSemibold
							Keybind.TextColor3 = COL3RGB(200, 200, 200)
							Keybind.TextSize = 14.000
							Keybind.AnchorPoint = Vec2(1,0)
							Keybind.ZIndex = 3

							Frame.Parent = Keybind
							Frame.BackgroundColor3 = COL3RGB(24,24,24)
							Frame.BorderColor3 = COL3RGB(24,24,24)
							Frame.Position = UDIM2(1, -49, 0, 1)
							Frame.Size = UDIM2(0, 49, 0, 49)
							Frame.Visible = false
							Frame.ZIndex = 3

							Always.Name = "Always"
							Always.Parent = Frame
							Always.BackgroundColor3 = COL3RGB(24,24,24)
							Always.BackgroundTransparency = 1.000
							Always.BorderColor3 = COL3RGB(24,24,24)
							Always.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)
							Always.Size = UDIM2(1, 0, 0, 16)
							Always.AutoButtonColor = false
							Always.Font = Enum.Font.SourceSansBold
							Always.Text = "Always"
							Always.TextColor3 = COL3RGB(200, 200, 200)
							Always.TextSize = 14.000
							Always.ZIndex = 3

							UIListLayout.Parent = Frame
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

							Hold.Name = "Hold"
							Hold.Parent = Frame
							Hold.BackgroundColor3 = COL3RGB(24,24,24)
							Hold.BackgroundTransparency = 1.000
							Hold.BorderColor3 = COL3RGB(24,24,24)
							Hold.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)
							Hold.Size = UDIM2(1, 0, 0, 16)
							Hold.AutoButtonColor = false
							Hold.Font = Enum.Font.SourceSansSemibold
							Hold.Text = "Hold"
							Hold.TextColor3 = COL3RGB(200, 200, 200)
							Hold.TextSize = 14.000
							Hold.ZIndex = 3

							Toggle.Name = "Toggle"
							Toggle.Parent = Frame
							Toggle.BackgroundColor3 = COL3RGB(24,24,24)
							Toggle.BackgroundTransparency = 1.000
							Toggle.BorderColor3 = COL3RGB(24,24,24)
							Toggle.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)
							Toggle.Size = UDIM2(1, 0, 0, 16)
							Toggle.AutoButtonColor = false
							Toggle.Font = Enum.Font.SourceSansSemibold
							Toggle.Text = "Toggle"
							Toggle.TextColor3 = COL3RGB(48, 113, 169)
							Toggle.TextSize = 14.000
							Toggle.ZIndex = 3

							for _,button in pairs(Frame:GetChildren()) do
								if button:IsA("TextButton") then
									button.MouseButton1Down:Connect(function()
										Element.value.Type = button.Text
										Frame.Visible = false
										Element.value.Active = Element.value.Type == "Always" and true or false
										if Element.value.Type == "Always" then
											
										end
										for _,button in pairs(Frame:GetChildren()) do
											if button:IsA("TextButton") and button.Text ~= Element.value.Type then
												button.Font = Enum.Font.SourceSansSemibold
												library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})
											end
										end
										button.Font = Enum.Font.SourceSansBold
										button.TextColor3 = COL3RGB(60, 0, 90)
										values[tabname][sectorname][tabtext][text] = Element.value
										callback(Element.value)
									end)
									button.MouseEnter:Connect(function()
										if Element.value.Type ~= button.Text then
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255,255,255)})
										end
									end)
									button.MouseLeave:Connect(function()
										if Element.value.Type ~= button.Text then
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})
										end
									end)
								end
							end
							Keybind.MouseButton1Down:Connect(function()
								if not binding then
									wait()
									binding = true
									Keybind.Text = "..."
									Keybind.Size = UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12)
								end
							end)
							Keybind.MouseButton2Down:Connect(function()
								if not binding then
									Frame.Visible = not Frame.Visible
								end
							end)
							local Player = game.Players.LocalPlayer
							local Mouse = Player:GetMouse()
							local InFrame = false
							Frame.MouseEnter:Connect(function()
								InFrame = true
							end)
							Frame.MouseLeave:Connect(function()
								InFrame = false
							end)
							local InFrame2 = false
							Keybind.MouseEnter:Connect(function()
								InFrame2 = true
							end)
							Keybind.MouseLeave:Connect(function()
								InFrame2 = false
							end)
							game:GetService("UserInputService").InputBegan:Connect(function(input)
								if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then
									if Frame.Visible == true and not InFrame and not InFrame2 then
										Frame.Visible = false
									end
								end
								if binding then
									binding = false
									Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper()
									Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12)
									Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name
									if input.KeyCode.Name == "Backspace" then
										Keybind.Text = "NONE"
										Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12)
										Element.value.Key = nil
									end
								else
									if Element.value.Key ~= nil then
										if FIND(Element.value.Key, "Mouse") then
											if input.UserInputType == Enum.UserInputType[Element.value.Key] then
												if Element.value.Type == "Hold" then
													Element.value.Active = true
													if Element.value.Active and Element.value.Toggle then
		
													else
														
													end
												elseif Element.value.Type == "Toggle" then
													Element.value.Active = not Element.value.Active
													if Element.value.Active and Element.value.Toggle then
		
													else
														
													end
												end
											end
										else
											if input.KeyCode == Enum.KeyCode[Element.value.Key] then
												if Element.value.Type == "Hold" then
													Element.value.Active = true
													if Element.value.Active and Element.value.Toggle then
		
													else
														
													end
												elseif Element.value.Type == "Toggle" then
													Element.value.Active = not Element.value.Active
													if Element.value.Active and Element.value.Toggle then
		
													else
														
													end
												end
											end
										end
									else
										Element.value.Active = true
									end
								end
								values[tabname][sectorname][tabtext][text] = Element.value
								callback(Element.value)
							end)
							game:GetService("UserInputService").InputEnded:Connect(function(input)
								if Element.value.Key ~= nil then
									if FIND(Element.value.Key, "Mouse") then
										if input.UserInputType == Enum.UserInputType[Element.value.Key] then
											if Element.value.Type == "Hold" then
												Element.value.Active = false
												if Element.value.Active and Element.value.Toggle then
	
												else
													
												end
											end
										end
									else
										if input.KeyCode == Enum.KeyCode[Element.value.Key] then
											if Element.value.Type == "Hold" then
												Element.value.Active = false
												if Element.value.Active and Element.value.Toggle then
	
												else
													
												end
											end
										end
									end
								end
								values[tabname][sectorname][tabtext][text] = Element.value
								callback(Element.value)
							end)
						end
						function Element:SetValue(value)
							Element.value = value
							update()
						end
					elseif type == "Toggle" then
						tabsize = tabsize + UDIM2(0,0,0,19)
						Element.value = {Toggle = data.default and data.default.Toggle or false}

						local Toggle = INST("Frame")
						local Button = INST("TextButton")
						local Color = INST("Frame")
						local TextLabel = INST("TextLabel")

						Toggle.Name = "Toggle"
						Toggle.Parent = tab1
						Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000
						Toggle.Size = UDIM2(1, 0, 0, 15)

						Button.Name = "Button"
						Button.Parent = Toggle
						Button.BackgroundColor3 = COL3RGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000
						Button.Size = UDIM2(1, 0, 1, 0)
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = COL3RGB(0, 0, 0)
						Button.TextSize = 14.000

						Color.Name = "Color"
						Color.Parent = Button
						Color.BackgroundColor3 = COL3RGB(24,24,24)
						Color.BorderColor3 = COL3RGB(24,24,24)
						Color.Position = UDIM2(0, 15, 0.5, -5)
						Color.Size = UDIM2(0, 8, 0, 8)

						TextLabel.Parent = Button
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.Position = UDIM2(0, 32, 0, -1)
						TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = text
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					

						local function update()
							if Element.value.Toggle then
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(48, 113, 169)})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
							else
								
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(24,24,24)})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
							end
							values[tabname][sectorname][tabtext][text] = Element.value
						end

						Button.MouseButton1Down:Connect(function()
							Element.value.Toggle = not Element.value.Toggle
							update()
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(Element.value)
						end)
						if data.default then
							update()
						end
						values[tabname][sectorname][tabtext][text] = Element.value
						function Element:SetValue(value)
							Element.value = value
							values[tabname][sectorname][tabtext][text] = Element.value
							update()
							callback(Element.value)
						end
						--callback(data.default and data.default.Toggle or false)
					elseif type == "ToggleColor" then
						tabsize = tabsize + UDim2.new(0,0,0,16)
						Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or Color3.fromRGB(255,255,255)}

						local Toggle = INST("Frame")
						local Button = INST("TextButton")
						local Color = INST("Frame")
						local TextLabel = INST("TextLabel")

						Toggle.Name = "Toggle"
						Toggle.Parent = tab1
						Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000
						Toggle.Size = UDIM2(1, 0, 0, 15)

						Button.Name = "Button"
						Button.Parent = Toggle
						Button.BackgroundColor3 = COL3RGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000
						Button.Size = UDIM2(1, 0, 1, 0)
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = COL3RGB(0, 0, 0)
						Button.TextSize = 14.000

						Color.Name = "Color"
						Color.Parent = Button
						Color.BackgroundColor3 = COL3RGB(24,24,24)
						Color.BorderColor3 = COL3RGB(24,24,24)
						Color.Position = UDIM2(0, 15, 0.5, -5)
						Color.Size = UDIM2(0, 8, 0, 8)

						TextLabel.Parent = Button
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.Position = UDIM2(0, 32, 0, -1)
						TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = text
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					

						local function update()
							if Element.value.Toggle then
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(48, 113, 169)})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})
							else
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(24, 24, 24)})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})
							end
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(Element.value)
						end

						local ColorH,ColorS,ColorV

						local ColorP = INST("TextButton")
						local Frame = INST("Frame")
						local Colorpick = INST("ImageButton")
						local ColorDrag = INST("Frame")
						local Huepick = INST("ImageButton")
						local Huedrag = INST("Frame")

						ColorP.Name = "ColorP"
						ColorP.Parent = Button
						ColorP.AnchorPoint = Vec2(1, 0)
						ColorP.BackgroundColor3 = COL3RGB(255, 0, 0)
						ColorP.BorderColor3 = COL3RGB(24,24,24)
						ColorP.Position = UDIM2(0, 270, 0.5, -4)
						ColorP.Size = UDIM2(0, 18, 0, 8)
						ColorP.AutoButtonColor = false
						ColorP.Font = Enum.Font.SourceSansSemibold
						ColorP.Text = ""
						ColorP.TextColor3 = COL3RGB(200, 200, 200)
						ColorP.TextSize = 14.000

						Frame.Parent = ColorP
						Frame.BackgroundColor3 = COL3RGB(24,24,24)
						Frame.BorderColor3 = COL3RGB(24,24,24)
						Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0)
						Frame.Size = UDIM2(0, 200, 0, 170)
						Frame.Visible = false
						Frame.ZIndex = 3

						Colorpick.Name = "Colorpick"
						Colorpick.Parent = Frame
						Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255)
						Colorpick.BorderColor3 = COL3RGB(24,24,24)
						Colorpick.ClipsDescendants = false
						Colorpick.Position = UDIM2(0, 40, 0, 10)
						Colorpick.Size = UDIM2(0, 150, 0, 150)
						Colorpick.AutoButtonColor = false
						Colorpick.Image = "rbxassetid://4155801252"
						Colorpick.ImageColor3 = COL3RGB(255, 0, 0)
						Colorpick.ZIndex = 3

						ColorDrag.Name = "ColorDrag"
						ColorDrag.Parent = Colorpick
						ColorDrag.AnchorPoint = Vec2(0.5, 0.5)
						ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255)
						ColorDrag.BorderColor3 = COL3RGB(24,24,24)
						ColorDrag.Size = UDIM2(0, 4, 0, 4)
						ColorDrag.ZIndex = 3

						Huepick.Name = "Huepick"
						Huepick.Parent = Frame
						Huepick.BackgroundColor3 = COL3RGB(255, 255, 255)
						Huepick.BorderColor3 = COL3RGB(24,24,24)
						Huepick.ClipsDescendants = false
						Huepick.Position = UDIM2(0, 10, 0, 10)
						Huepick.Size = UDIM2(0, 20, 0, 150)
						Huepick.AutoButtonColor = false
						Huepick.Image = "rbxassetid://3641079629"
						Huepick.ImageColor3 = COL3RGB(255, 0, 0)
						Huepick.ImageTransparency = 1
						Huepick.BackgroundTransparency = 0
						Huepick.ZIndex = 3

						local HueFrameGradient = INST("UIGradient")
						HueFrameGradient.Rotation = 90
						HueFrameGradient.Name = "HueFrameGradient"
						HueFrameGradient.Parent = Huepick
						HueFrameGradient.Color = ColorSequence.new {
							ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)),
							ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)),
							ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)),
							ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)),
							ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)),
							ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)),
							ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0))
						}	

						Huedrag.Name = "Huedrag"
						Huedrag.Parent = Huepick
						Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255)
						Huedrag.BorderColor3 = COL3RGB(24,24,24)
						Huedrag.Size = UDIM2(1, 0, 0, 2)
						Huedrag.ZIndex = 3

						ColorP.MouseButton1Down:Connect(function()
							Frame.Visible = not Frame.Visible
						end)
						local abc = false
						local inCP = false
						ColorP.MouseEnter:Connect(function()
							abc = true
						end)
						ColorP.MouseLeave:Connect(function()
							abc = false
						end)
						Frame.MouseEnter:Connect(function()
							inCP = true
						end)
						Frame.MouseLeave:Connect(function()
							inCP = false
						end)

						ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)
						ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)
						ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)

						if data.default.Color ~= nil then
							ColorH, ColorS, ColorV = data.default.Color:ToHSV()

							ColorH = CLAMP(ColorH,0,1)
							ColorS = CLAMP(ColorS,0,1)
							ColorV = CLAMP(ColorV,0,1)
							ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)

							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
							Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)
						end

						local mouse = LocalPlayer:GetMouse()
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								if not dragging and not abc and not inCP then
									Frame.Visible = false
								end
							end
						end)

						local function updateColor()
							local ColorX = (math.clamp(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)
							local ColorY = (math.clamp(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)
							ColorDrag.Position = UDim2.new(ColorX, 0, ColorY, 0)
							ColorS = 1-ColorX
							ColorV = 1-ColorY
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							values[tabname][sectorname][tabtext][text] = Element.value
							Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
							callback(Element.value)
						end
						local function updateHue()
							local y = math.clamp(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)
							Huedrag.Position = UDim2.new(0, 0, 0, y)
							hue = y/148
							ColorH = 1-hue
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							values[tabname][sectorname][tabtext][text] = Element.value
							Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)
							callback(Element.value)
						end
						Colorpick.MouseButton1Down:Connect(function()
							updateColor()
							moveconnection = mouse.Move:Connect(function()
								updateColor()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateColor()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
						Huepick.MouseButton1Down:Connect(function()
							updateHue()
							moveconnection = mouse.Move:Connect(function()
								updateHue()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateHue()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
 
						Button.MouseButton1Down:Connect(function()
							Element.value.Toggle = not Element.value.Toggle
							update()
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(Element.value)
						end)
						if data.default then
							update()
						end
						values[tabname][sectorname][tabtext][text] = Element.value
						--print(Element.value.Color)
						--print(values[tabname][sectorname][tabtext][text].Color)
						function Element:SetValue(value)
						    if typeof(value) == "table" then -- table is good
						        local dangman1 = String2Clr(value.Color)
						        local dangman2 = clrtoRGB(dangman1)
						        value.Color = dangman2
						    elseif typeof(value) == "Color3" then -- sum wrong with a toggle
						        local wthbro = value 
						        value = {}
						        value.Color = wthbro
						        value.Toggle = false
						    end
							Element.value = value
							local duplicate = Color3.new(value.Color.R, value.Color.G, value.Color.B)
							ColorH, ColorS, ColorV = duplicate:ToHSV()
							ColorH = math.clamp(ColorH,0,1)
							ColorS = math.clamp(ColorS,0,1)
							ColorV = math.clamp(ColorV,0,1)
 
							ColorDrag.Position = UDim2.new(1-ColorS,0,1-ColorV,0)
							Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
							update()
							Huedrag.Position = UDim2.new(0, 0, 1-ColorH, -1)
						end
					elseif type == "ToggleTrans" then
						tabsize = tabsize + UDIM2(0,0,0,16)
						Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0}

						local Toggle = INST("Frame")
						local Button = INST("TextButton")
						local Color = INST("Frame")
						local TextLabel = INST("TextLabel")

						Toggle.Name = "Toggle"
						Toggle.Parent = tab1
						Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)
						Toggle.BackgroundTransparency = 1.000
						Toggle.Size = UDIM2(1, 0, 0, 15)

						Button.Name = "Button"
						Button.Parent = Toggle
						Button.BackgroundColor3 = COL3RGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000
						Button.Size = UDIM2(1, 0, 1, 0)
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = COL3RGB(0, 0, 0)
						Button.TextSize = 14.000

						Color.Name = "Color"
						Color.Parent = Button
						Color.BackgroundColor3 = COL3RGB(24,24,24)
						Color.BorderColor3 = COL3RGB(24,24,24)
						Color.Position = UDIM2(0, 15, 0.5, -5)
						Color.Size = UDIM2(0, 8, 0, 8)

						TextLabel.Parent = Button
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.Position = UDIM2(0, 32, 0, -1)
						TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = text
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					

						local function update()
							if Element.value.Toggle then
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(119, 0, 255)})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
							else
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(24,24,24)})
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
							end
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(Element.value)
						end

						local ColorH,ColorS,ColorV

						local ColorP = INST("TextButton")
						local Frame = INST("Frame")
						local Colorpick = INST("ImageButton")
						local ColorDrag = INST("Frame")
						local Huepick = INST("ImageButton")
						local Huedrag = INST("Frame")

						ColorP.Name = "ColorP"
						ColorP.Parent = Button
						ColorP.AnchorPoint = Vec2(1, 0)
						ColorP.BackgroundColor3 = COL3RGB(255, 0, 0)
						ColorP.BorderColor3 = COL3RGB(24,24,24)
						ColorP.Position = UDIM2(0, 270, 0.5, -4)
						ColorP.Size = UDIM2(0, 18, 0, 8)
						ColorP.AutoButtonColor = false
						ColorP.Font = Enum.Font.SourceSansSemibold
						ColorP.Text = ""
						ColorP.TextColor3 = COL3RGB(200, 200, 200)
						ColorP.TextSize = 14.000

						Frame.Parent = ColorP
						Frame.BackgroundColor3 = COL3RGB(24,24,24)
						Frame.BorderColor3 = COL3RGB(24,24,24)
						Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0)
						Frame.Size = UDIM2(0, 200, 0, 190)
						Frame.Visible = false
						Frame.ZIndex = 3

						Colorpick.Name = "Colorpick"
						Colorpick.Parent = Frame
						Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255)
						Colorpick.BorderColor3 = COL3RGB(24,24,24)
						Colorpick.ClipsDescendants = false
						Colorpick.Position = UDIM2(0, 40, 0, 10)
						Colorpick.Size = UDIM2(0, 150, 0, 150)
						Colorpick.AutoButtonColor = false
						Colorpick.Image = "rbxassetid://4155801252"
						Colorpick.ImageColor3 = COL3RGB(255, 0, 0)
						Colorpick.ZIndex = 3

						ColorDrag.Name = "ColorDrag"
						ColorDrag.Parent = Colorpick
						ColorDrag.AnchorPoint = Vec2(0.5, 0.5)
						ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255)
						ColorDrag.BorderColor3 = COL3RGB(24,24,24)
						ColorDrag.Size = UDIM2(0, 4, 0, 4)
						ColorDrag.ZIndex = 3

						Huepick.Name = "Huepick"
						Huepick.Parent = Frame
						Huepick.BackgroundColor3 = COL3RGB(255, 255, 255)
						Huepick.BorderColor3 = COL3RGB(24,24,24)
						Huepick.ClipsDescendants = true
						Huepick.Position = UDIM2(0, 10, 0, 10)
						Huepick.Size = UDIM2(0, 20, 0, 150)
						Huepick.AutoButtonColor = false
						Huepick.Image = "rbxassetid://3641079629"
						Huepick.ImageColor3 = COL3RGB(255, 0, 0)
						Huepick.ImageTransparency = 1
						Huepick.BackgroundTransparency = 0
						Huepick.ZIndex = 3

						local HueFrameGradient = INST("UIGradient")
						HueFrameGradient.Rotation = 90
						HueFrameGradient.Name = "HueFrameGradient"
						HueFrameGradient.Parent = Huepick
						HueFrameGradient.Color = ColorSequence.new {
							ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)),
							ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)),
							ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)),
							ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)),
							ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)),
							ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)),
							ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0))
						}	

						Huedrag.Name = "Huedrag"
						Huedrag.Parent = Huepick
						Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255)
						Huedrag.BorderColor3 = COL3RGB(24,24,24)
						Huedrag.Size = UDIM2(1, 0, 0, 2)
						Huedrag.ZIndex = 3

						local Transpick = INST("ImageButton")
						local Transcolor = INST("ImageLabel")
						local Transdrag = INST("Frame")

						Transpick.Name = "Transpick"
						Transpick.Parent = Frame
						Transpick.BackgroundColor3 = COL3RGB(255, 255, 255)
						Transpick.BorderColor3 = COL3RGB(24,24,24)
						Transpick.Position = UDIM2(0, 10, 0, 167)
						Transpick.Size = UDIM2(0, 180, 0, 15)
						Transpick.AutoButtonColor = false
						Transpick.Image = "rbxassetid://3887014957"
						Transpick.ScaleType = Enum.ScaleType.Tile
						Transpick.TileSize = UDIM2(0, 10, 0, 10)
						Transpick.ZIndex = 3

						Transcolor.Name = "Transcolor"
						Transcolor.Parent = Transpick
						Transcolor.BackgroundColor3 = COL3RGB(255, 255, 255)
						Transcolor.BackgroundTransparency = 1.000
						Transcolor.Size = UDIM2(1, 0, 1, 0)
						Transcolor.Image = "rbxassetid://3887017050"
						Transcolor.ImageColor3 = COL3RGB(255, 0, 4)
						Transcolor.ZIndex = 3

						Transdrag.Name = "Transdrag"
						Transdrag.Parent = Transcolor
						Transdrag.BackgroundColor3 = COL3RGB(255, 255, 255)
						Transdrag.BorderColor3 = COL3RGB(24,24,24)
						Transdrag.Position = UDIM2(0, -1, 0, 0)
						Transdrag.Size = UDIM2(0, 2, 1, 0)
						Transdrag.ZIndex = 3

						ColorP.MouseButton1Down:Connect(function()
							Frame.Visible = not Frame.Visible
						end)
						local abc = false
						local inCP = false
						ColorP.MouseEnter:Connect(function()
							abc = true
						end)
						ColorP.MouseLeave:Connect(function()
							abc = false
						end)
						Frame.MouseEnter:Connect(function()
							inCP = true
						end)
						Frame.MouseLeave:Connect(function()
							inCP = false
						end)

						ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)
						ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)
						ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)

						if data.default.Color ~= nil then
							ColorH, ColorS, ColorV = data.default.Color:ToHSV()

							ColorH = CLAMP(ColorH,0,1)
							ColorS = CLAMP(ColorS,0,1)
							ColorV = CLAMP(ColorV,0,1)
							ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)

							Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)

							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
							Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)
						end
						if data.default.Transparency ~= nil then
							Transdrag.Position = UDIM2(data.default.Transparency, -1, 0, 0)
						end
						local mouse = LocalPlayer:GetMouse()
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								if not dragging and not abc and not inCP then
									Frame.Visible = false
								end
							end
						end)

						local function updateColor()
							local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)
							local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)
							ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0)
							ColorS = 1-ColorX
							ColorV = 1-ColorY
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
							Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)
							values[tabname][sectorname][tabtext][text] = Element.value
							Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)
							callback(Element.value)
						end
						local function updateHue()
							local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)
							Huedrag.Position = UDIM2(0, 0, 0, y)
							hue = y/148
							ColorH = 1-hue
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
							Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
							values[tabname][sectorname][tabtext][text] = Element.value
							Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)
							callback(Element.value)
						end
						local function updateTrans()
							local x = CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178)
							Transdrag.Position = UDIM2(0, x, 0, 0)
							Element.value.Transparency = (x/178)
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(Element.value)
						end
						Transpick.MouseButton1Down:Connect(function()
							updateTrans()
							moveconnection = mouse.Move:Connect(function()
								updateTrans()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateTrans()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
						Colorpick.MouseButton1Down:Connect(function()
							updateColor()
							moveconnection = mouse.Move:Connect(function()
								updateColor()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateColor()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
						Huepick.MouseButton1Down:Connect(function()
							updateHue()
							moveconnection = mouse.Move:Connect(function()
								updateHue()
							end)
							releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									updateHue()
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)

						Button.MouseButton1Down:Connect(function()
							Element.value.Toggle = not Element.value.Toggle
							update()
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(Element.value)
						end)
						if data.default then
							update()
						end
						values[tabname][sectorname][tabtext][text] = Element.value
						function Element:SetValue(value)
						    -- DONT FIX THIS ITS LOWK USELESS (NOT RLLY BUT YK)
						    --[[
							Element.value = value
							local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B)
							ColorH, ColorS, ColorV = duplicate:ToHSV()
							ColorH = CLAMP(ColorH,0,1)
							ColorS = CLAMP(ColorS,0,1)
							ColorV = CLAMP(ColorV,0,1)

							ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)
							Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
							ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
							update()
							Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)
							--]]
						end
					elseif type == "Dropdown" then
						tabsize = tabsize + UDIM2(0,0,0,42)
						Element.value = {Dropdown = data.options[1]}

						local Dropdown = INST("Frame")
						local Button = INST("TextButton")
						local TextLabel = INST("TextLabel")
						local Drop = INST("ScrollingFrame")
						local Button_2 = INST("TextButton")
						local TextLabel_2 = INST("TextLabel")
						local UIListLayout = INST("UIListLayout")
						local ImageLabel = INST("ImageLabel")
						local TextLabel_3 = INST("TextLabel")

						Dropdown.Name = "Dropdown"
						Dropdown.Parent = tab1
						Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255)
						Dropdown.BackgroundTransparency = 1.000
						Dropdown.Position = UDIM2(0, 0, 0.255102038, 0)
						Dropdown.Size = UDIM2(1, 0, 0, 39)

						Button.Name = "Button"
						Button.Parent = Dropdown
						Button.BackgroundColor3 = COL3RGB(24,24,24)
						Button.BorderColor3 = COL3RGB(24,24,24)
						Button.Position = UDIM2(0, 30, 0, 16)
						Button.Size = UDIM2(0, 175, 0, 17)
						Button.AutoButtonColor = false
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = COL3RGB(0, 0, 0)
						Button.TextSize = 14.000

						TextLabel.Parent = Button
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.BorderColor3 = COL3RGB(24,24,24)
						TextLabel.Position = UDIM2(0, 5, 0, 0)
						TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = Element.value.Dropdown
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					

						local abcd = TextLabel

						Drop.Name = "Drop"
						Drop.Parent = Button
						Drop.Active = true
						Drop.BackgroundColor3 = COL3RGB(24,24,24)
						Drop.BorderColor3 = COL3RGB(24,24,24)
						Drop.Position = UDIM2(0, 0, 1, 1)
						Drop.Size = UDIM2(1, 0, 0, 20)
						Drop.Visible = false
						Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.CanvasSize = UDIM2(0, 0, 0, 0)
						Drop.ScrollBarThickness = 4
						Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
						Drop.AutomaticCanvasSize = "Y"
						Drop.ZIndex = 5
						Drop.ScrollBarImageColor3 = COL3RGB(119,0,255)

						UIListLayout.Parent = Drop
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

						local num = #data.options
						if num > 5 then
							Drop.Size = UDIM2(1, 0, 0, 85)
						else
							Drop.Size = UDIM2(1, 0, 0, 17*num)
						end
						Drop.CanvasSize = UDIM2(1, 0, 0, 17*num)
						local first = true
						for i,v in ipairs(data.options) do
							do
								local Button = INST("TextButton")
								local TextLabel = INST("TextLabel")

								Button.Name = v
								Button.Parent = Drop
								Button.BackgroundColor3 = COL3RGB(24,24,24)
								Button.BorderColor3 = COL3RGB(24,24,24)
								Button.Position = UDIM2(0, 30, 0, 16)
								Button.Size = UDIM2(0, 175, 0, 17)
								Button.AutoButtonColor = false
								Button.Font = Enum.Font.SourceSans
								Button.Text = ""
								Button.TextColor3 = COL3RGB(0, 0, 0)
								Button.TextSize = 14.000
								Button.BorderSizePixel = 0
								Button.ZIndex = 6

								TextLabel.Parent = Button
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
								TextLabel.BackgroundTransparency = 1.000
								TextLabel.BorderColor3 = COL3RGB(24,24,24)
								TextLabel.Position = UDIM2(0, 5, 0, -1)
								TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
								TextLabel.Font = Enum.Font.SourceSansSemibold
								TextLabel.Text = v
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)
								TextLabel.TextSize = 14.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left
							
								TextLabel.ZIndex = 6

								Button.MouseButton1Down:Connect(function()
									Drop.Visible = false
									Element.value.Dropdown = v
									abcd.Text = v
									values[tabname][sectorname][tabtext][text] = Element.value
									callback(Element.value)
									Drop.CanvasPosition = Vec2(0,0)
								end)
								Button.MouseEnter:Connect(function()
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)})
								end)
								Button.MouseLeave:Connect(function()
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)})
								end)

								first = false
							end
						end

						function Element:SetValue(val)
							Element.value = val
							abcd.Text = val.Dropdown
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(val)
						end

						ImageLabel.Parent = Button
						ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						ImageLabel.BackgroundTransparency = 1.000
						ImageLabel.Position = UDIM2(0, 165, 0, 6)
						ImageLabel.Size = UDIM2(0, 6, 0, 4)
						ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"

						TextLabel_3.Parent = Dropdown
						TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel_3.BackgroundTransparency = 1.000
						TextLabel_3.Position = UDIM2(0, 32, 0, -1)
						TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)
						TextLabel_3.Font = Enum.Font.SourceSansSemibold
						TextLabel_3.Text = text
						TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel_3.TextSize = 14.000
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

						Button.MouseButton1Down:Connect(function()
							Drop.Visible = not Drop.Visible
							if not Drop.Visible then
								Drop.CanvasPosition = Vec2(0,0)
							end
						end)
						local indrop = false
						local ind = false
						Drop.MouseEnter:Connect(function()
							indrop = true
						end)
						Drop.MouseLeave:Connect(function()
							indrop = false
						end)
						Button.MouseEnter:Connect(function()
							ind = true
						end)
						Button.MouseLeave:Connect(function()
							ind = false
						end)
						game:GetService("UserInputService").InputBegan:Connect(function(input)
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
								if Drop.Visible == true and not indrop and not ind then
									Drop.Visible = false
									Drop.CanvasPosition = Vec2(0,0)
								end
							end
						end)
						values[tabname][sectorname][tabtext][text] = Element.value
					elseif type == "Slider" then
						tabsize = tabsize + UDIM2(0,0,0,25)

						local Slider = INST("Frame")
						local TextLabel = INST("TextLabel")
						local Button = INST("TextButton")
						local Frame = INST("Frame")
						local UIGradient = INST("UIGradient")
						local Value = INST("TextLabel")

						Slider.Name = "Slider"
						Slider.Parent = tab1
						Slider.BackgroundColor3 = COL3RGB(255, 255, 255)
						Slider.BackgroundTransparency = 1.000
						Slider.Position = UDIM2(0, 0, 0.653061211, 0)
						Slider.Size = UDIM2(1, 0, 0, 25)

						TextLabel.Parent = Slider
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.Position = UDIM2(0, 32, 0, -2)
						TextLabel.Size = UDIM2(0, 100, 0, 15)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = text
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					

						Button.Name = "Button"
						Button.Parent = Slider
						Button.BackgroundColor3 = COL3RGB(24,24,24)
						Button.BorderColor3 = COL3RGB(24,24,24)
						Button.Position = UDIM2(0, 30, 0, 15)
						Button.Size = UDIM2(0, 175, 0, 5)
						Button.AutoButtonColor = false
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = COL3RGB(0, 0, 0)
						Button.TextSize = 14.000

						Frame.Parent = Button
						Frame.BackgroundColor3 = COL3RGB(255, 255, 255)
						Frame.BorderSizePixel = 0
						Frame.Size = UDIM2(0.5, 0, 1, 0)

						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, COL3RGB(119,0,255)), ColorSequenceKeypoint.new(1, COL3RGB(119,0,255))}
						UIGradient.Rotation = 90
						UIGradient.Parent = Frame

						Value.Name = "Value"
						Value.Parent = Slider
						Value.BackgroundColor3 = COL3RGB(255, 255, 255)
						Value.BackgroundTransparency = 1.000
						Value.Position = UDIM2(0, 150, 0, -1)
						Value.Size = UDIM2(0, 55, 0, 15)
						Value.Font = Enum.Font.SourceSansSemibold
						Value.Text = "50"
						Value.TextColor3 = COL3RGB(200, 200, 200)
						Value.TextSize = 14.000
						Value.TextXAlignment = Enum.TextXAlignment.Right
						local min, max, default, division = data.min or 0, data.max or 100, data.default or 0, data.division or 1
						Element.value = {Slider = default}

						function Element:SetValue(value)
							Element.value = value
							local a
							if min > 0 then
								a = ((Element.value.Slider - min)) / (max-min)
							else
								a = (Element.value.Slider-min)/(max-min)
							end
							Value.Text = Element.value.Slider
							Frame.Size = UDIM2(a,0,1,0)
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(value)
						end
						local a
						if min > 0 then
							a = ((Element.value.Slider - min)) / (max-min)
						else
							a = (Element.value.Slider-min)/(max-min)
						end
						Value.Text = Element.value.Slider
						Frame.Size = UDIM2(a,0,1,0)
						values[tabname][sectorname][tabtext][text] = Element.value
						local uis = game:GetService("UserInputService")
						local mouse = game.Players.LocalPlayer:GetMouse()
						local val
						Button.MouseButton1Down:Connect(function()
							Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
							val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X*division) + tonumber(min)) or 0
							Value.Text = val/division
							Element.value.Slider = val/division
							values[tabname][sectorname][tabtext][text] = Element.value
							callback(Element.value)
							moveconnection = mouse.Move:Connect(function()
								Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
								val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X*division) + tonumber(min))
								Value.Text = val/division
								Element.value.Slider = val/division
								values[tabname][sectorname][tabtext][text] = Element.value
								callback(Element.value)
							end)
							releaseconnection = uis.InputEnded:Connect(function(Mouse)
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
									Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
									val = FLOOR((((tonumber(max) - tonumber(min)) / 175) * Frame.AbsoluteSize.X*division) + tonumber(min))
									values[tabname][sectorname][tabtext][text] = Element.value
									callback(Element.value)
									moveconnection:Disconnect()
									releaseconnection:Disconnect()
								end
							end)
						end)
					elseif type == "Button" then
						tabsize = tabsize + UDIM2(0,0,0,30)
						local Button = INST("Frame")
						local Button_2 = INST("TextButton")
						local TextLabel = INST("TextLabel")

						Button.Name = "Button"
						Button.Parent = tab1
						Button.BackgroundColor3 = COL3RGB(255, 255, 255)
						Button.BackgroundTransparency = 1.000
						Button.Position = UDIM2(0, 0, 0.236059487, 0)
						Button.Size = UDIM2(1, 0, 0, 24)

						Button_2.Name = "Button"
						Button_2.Parent = Button
						Button_2.BackgroundColor3 = COL3RGB(24,24,24)
						Button_2.BorderColor3 = COL3RGB(24,24,24)
						Button_2.Position = UDIM2(0, 30, 0.5, -9)
						Button_2.Size = UDIM2(0, 175, 0, 18)
						Button_2.AutoButtonColor = false
						Button_2.Font = Enum.Font.SourceSans
						Button_2.Text = ""
						Button_2.TextColor3 = COL3RGB(0, 0, 0)
						Button_2.TextSize = 14.000

						TextLabel.Parent = Button_2
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.BorderColor3 = COL3RGB(24,24,24)
						TextLabel.Size = UDIM2(1, 0, 1, 0)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = text
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000

						function Element:SetValue()
						end

						Button_2.MouseButton1Down:Connect(function()
							TextLabel.TextColor3 = COL3RGB(119,0,255)
							library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
							callback()
						end)
						Button_2.MouseEnter:Connect(function()
							library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
						end)
						Button_2.MouseLeave:Connect(function()
							library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
						end)
					end
					
					ConfigLoad:Connect(function(cfg)
					    -- possibly broken one
						local fix = library:ConfigFix(cfg)
						if fix and fix[tabname] and fix[tabname][sectorname] and fix[tabname][sectorname][tabtext] and fix[tabname][sectorname][tabtext][text] ~= nil then
							Element:SetValue(fix[tabname][sectorname][tabtext][text])
						end
					end)

					OnlineConfigLoad:Connect(function(cfg) -- has to be the json decoded one
						local fix = library:OnlineConfigFix(cfg)
						if fix[tabname][sectorname][tabtext][text] ~= nil then
							Element:SetValue(fix[tabname][sectorname][tabtext][text])
						end
					end)
					
					return Element
				end


				if firs then
					coroutine.wrap(function()
						game:GetService("RunService").RenderStepped:Wait()
						Section.Size = tabsize
					end)()
					selected = text
					TextButton.TextColor3 = COL3RGB(255,255,255)
					tab1.Visible = true
					firs = false
				end

				return tab
			end

			return MSector
		end
		function Tab:Sector(text, side)
			local sectorname = text
			local Sector = {}
			values[tabname][text] = {}
			local Section = INST("Frame")
			local SectionText = INST("TextLabel")
			local Inner = INST("Frame")
			local UIListLayout = INST("UIListLayout")

			Section.Name = "Section"
			Section.Parent = TabGui[side]
			Section.BackgroundColor3 = COL3RGB(24,24,24)
			Section.BorderColor3 = COL3RGB(24,24,24)
			Section.BorderSizePixel = 0
			Section.Position = UDIM2(0.00358422939, 0, 0, 0)
			Section.Size = UDIM2(1, 0, 0, 24)

			SectionText.Name = "SectionText"
			SectionText.Parent = Section
			SectionText.BackgroundColor3 = COL3RGB(255, 255, 255)
			SectionText.BackgroundTransparency = 1.000
			SectionText.Position = UDIM2(0, 7, 0, -6)
			SectionText.Size = UDIM2(0, 270, 0, 19)
			SectionText.ZIndex = 2
			SectionText.Font = Enum.Font.SourceSansSemibold
			SectionText.Text = text
			SectionText.TextColor3 = COL3RGB(255, 255, 255)
			SectionText.TextSize = 15.000
			SectionText.TextXAlignment = Enum.TextXAlignment.Left
			

			Inner.Name = "Inner"
			Inner.Parent = Section
			Inner.BackgroundColor3 = COL3RGB(20, 20, 20)
			Inner.BorderColor3 = COL3RGB(24,24,24)
			Inner.BorderSizePixel = 0
			Inner.Position = UDIM2(0, 1, 0, 1)
			Inner.Size = UDIM2(1, -2, 1, -2)

			local UIPadding = INST("UIPadding")

			UIPadding.Parent = Inner
			UIPadding.PaddingTop = UDim.new(0, 10)

			UIListLayout.Parent = Inner
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0,1)

			function Sector:Element(type, text, data, callback)
				local Element = {}
				data = data or {}
				callback = callback or function() end
				values[tabname][sectorname][text] = {}
				if type == "ScrollDrop" then
					Section.Size = Section.Size + UDIM2(0,0,0,39)
					Element.value = {Scroll = {}, Dropdown = ""}

					for i,v in pairs(data.options) do
						Element.value.Scroll[i] = v[1]
					end

					local joe = {}
					if data.alphabet then
						local copy = {}
						for i,v in pairs(data.options) do
							INSERT(copy, i)
						end
						TBLSORT(copy, function(a,b)
							return a < b
						end)
						joe = copy
					else
						for i,v in pairs(data.options) do
							INSERT(joe, i)
						end
					end

					local Dropdown = INST("Frame")
					local Button = INST("TextButton")
					local TextLabel = INST("TextLabel")
					local Drop = INST("ScrollingFrame")
					local Button_2 = INST("TextButton")
					local TextLabel_2 = INST("TextLabel")
					local UIListLayout = INST("UIListLayout")
					local ImageLabel = INST("ImageLabel")
					local TextLabel_3 = INST("TextLabel")

					Dropdown.Name = "Dropdown"
					Dropdown.Parent = Inner
					Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255)
					Dropdown.BackgroundTransparency = 1.000
					Dropdown.Position = UDIM2(0, 0, 0, 0)
					Dropdown.Size = UDIM2(1, 0, 0, 39)

					Button.Name = "Button"
					Button.Parent = Dropdown
					Button.BackgroundColor3 = COL3RGB(24,24,24)
					Button.BorderColor3 = COL3RGB(24,24,24)
					Button.Position = UDIM2(0, 30, 0, 16)
					Button.Size = UDIM2(0, 175, 0, 17)
					Button.AutoButtonColor = false
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = COL3RGB(0, 0, 0)
					Button.TextSize = 14.000

					local TextLabel = INST("TextLabel")

					TextLabel.Parent = Button
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.BorderColor3 = COL3RGB(24,24,24)
					TextLabel.Position = UDIM2(0, 5, 0, 0)
					TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = "lol"
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				

					local abcd = TextLabel

					Drop.Name = "Drop"
					Drop.Parent = Button
					Drop.Active = true
					Drop.BackgroundColor3 = COL3RGB(24,24,24)
					Drop.BorderColor3 = COL3RGB(24,24,24)
					Drop.Position = UDIM2(0, 0, 1, 1)
					Drop.Size = UDIM2(1, 0, 0, 20)
					Drop.Visible = false
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.CanvasSize = UDIM2(0, 0, 0, 0)
					Drop.ScrollBarThickness = 4
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.AutomaticCanvasSize = "Y"
					Drop.ZIndex = 5
					Drop.ScrollBarImageColor3 = COL3RGB(119,0,255)

					UIListLayout.Parent = Drop
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder


					local amount = data.Amount or 6
					Section.Size = Section.Size + UDIM2(0,0,0,amount * 16 + 8)

					local num = #joe
					if num > 5 then
						Drop.Size = UDIM2(1, 0, 0, 85)
					else
						Drop.Size = UDIM2(1, 0, 0, 17*num)
					end
					local first = true
					for i,v in ipairs(joe) do
						do
							local joell = v
							local Scroll = INST("Frame")
							local joe2 = data.options[v]
							local Button = INST("TextButton")
							local TextLabel = INST("TextLabel")

							Button.Name = v
							Button.Parent = Drop
							Button.BackgroundColor3 = COL3RGB(24,24,24)
							Button.BorderColor3 = COL3RGB(24,24,24)
							Button.Position = UDIM2(0, 30, 0, 16)
							Button.Size = UDIM2(0, 175, 0, 17)
							Button.AutoButtonColor = false
							Button.Font = Enum.Font.SourceSans
							Button.Text = ""
							Button.TextColor3 = COL3RGB(0, 0, 0)
							Button.TextSize = 14.000
							Button.BorderSizePixel = 0
							Button.ZIndex = 6

							TextLabel.Parent = Button
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
							TextLabel.BackgroundTransparency = 1.000
							TextLabel.BorderColor3 = COL3RGB(24,24,24)
							TextLabel.Position = UDIM2(0, 5, 0, -1)
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
							TextLabel.Font = Enum.Font.SourceSansSemibold
							TextLabel.Text = v
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)
							TextLabel.TextSize = 14.000
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left
						
							TextLabel.ZIndex = 6

							Button.MouseButton1Down:Connect(function()
								Drop.Visible = false
								Drop.CanvasPosition = Vec2(0,0)
								abcd.Text = v
								for i,v in pairs(Scroll.Parent:GetChildren()) do
									if v:IsA("Frame") then
										v.Visible = false
									end
								end
								Element.value.Dropdown = v
								Scroll.Visible = true
								callback(Element.value)
							end)
							Button.MouseEnter:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)})
							end)
							Button.MouseLeave:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)})
							end)

							if first then
								abcd.Text = v
								Element.value.Dropdown = v
							end
							local Frame = INST("ScrollingFrame")
							local UIListLayout = INST("UIListLayout")

							Scroll.Name = "Scroll"
							Scroll.Parent = Dropdown
							Scroll.BackgroundColor3 = COL3RGB(255, 255, 255)
							Scroll.BackgroundTransparency = 1.000
							Scroll.Position = UDIM2(0, 0, 0, 0)
							Scroll.Size = UDIM2(1, 0, 0, amount * 16 + 8)
							Scroll.Visible = first
							Scroll.Name = v


							Frame.Name = "Frame"
							Frame.Parent = Scroll
							Frame.Active = true
							Frame.BackgroundColor3 = COL3RGB(24,24,24)
							Frame.BorderColor3 = COL3RGB(24,24,24)
							Frame.Position = UDIM2(0, 30, 0, 40)
							Frame.Size = UDIM2(0, 175, 0, 16 * amount)
							Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
							Frame.CanvasSize = UDIM2(0, 0, 0, 0)
							Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282"
							Frame.ScrollBarThickness = 4
							Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282"
							Frame.AutomaticCanvasSize = "Y"
							Frame.ScrollBarImageColor3 = COL3RGB(119,0,255)

							UIListLayout.Parent = Frame
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
							local joll = true
							for i,v in ipairs(joe2) do
								local Button = INST("TextButton")
								local TextLabel = INST("TextLabel")

								Button.Name = v
								Button.Parent = Frame
								Button.BackgroundColor3 = COL3RGB(24,24,24)
								Button.BorderColor3 = COL3RGB(24,24,24)
								Button.BorderSizePixel = 0
								Button.Position = UDIM2(0, 30, 0, 16)
								Button.Size = UDIM2(1, 0, 0, 16)
								Button.AutoButtonColor = false
								Button.Font = Enum.Font.SourceSans
								Button.Text = ""
								Button.TextColor3 = COL3RGB(0, 0, 0)
								Button.TextSize = 14.000

								TextLabel.Parent = Button
								TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
								TextLabel.BackgroundTransparency = 1.000
								TextLabel.BorderColor3 = COL3RGB(24,24,24)
								TextLabel.Position = UDIM2(0, 4, 0, -1)
								TextLabel.Size = UDIM2(1, 1, 1, 1)
								TextLabel.Font = Enum.Font.SourceSansSemibold
								TextLabel.Text = v
								TextLabel.TextColor3 = COL3RGB(200, 200, 200)
								TextLabel.TextSize = 14.000
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left
							
								if joll then
									joll = false
									TextLabel.TextColor3 = COL3RGB(119,0,255)
								end

								Button.MouseButton1Down:Connect(function()

									for i,v in pairs(Frame:GetChildren()) do
										if v:IsA("TextButton") then
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
										end
									end

									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})

									Element.value.Scroll[joell] = v

									values[tabname][sectorname][text] = Element.value
									callback(Element.value)
								end)
								Button.MouseEnter:Connect(function()
									if Element.value.Scroll[joell] ~= v then
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
									end
								end)
								Button.MouseLeave:Connect(function()
									if Element.value.Scroll[joell] ~= v then
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
									end
								end)
							end
							first = false
						end
					end

					ImageLabel.Parent = Button
					ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					ImageLabel.BackgroundTransparency = 1.000
					ImageLabel.Position = UDIM2(0, 165, 0, 6)
					ImageLabel.Size = UDIM2(0, 6, 0, 4)
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"

					TextLabel_3.Parent = Dropdown
					TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel_3.BackgroundTransparency = 1.000
					TextLabel_3.Position = UDIM2(0, 32, 0, -1)
					TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)
					TextLabel_3.Font = Enum.Font.SourceSansSemibold
					TextLabel_3.Text = text
					TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel_3.TextSize = 14.000
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
				

					Button.MouseButton1Down:Connect(function()
						Drop.Visible = not Drop.Visible
						if not Drop.Visible then
							Drop.CanvasPosition = Vec2(0,0)
						end
					end)
					local indrop = false
					local ind = false
					Drop.MouseEnter:Connect(function()
						indrop = true
					end)
					Drop.MouseLeave:Connect(function()
						indrop = false
					end)
					Button.MouseEnter:Connect(function()
						ind = true
					end)
					Button.MouseLeave:Connect(function()
						ind = false
					end)
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if Drop.Visible == true and not indrop and not ind then
								Drop.Visible = false
								Drop.CanvasPosition = Vec2(0,0)
							end
						end
					end)

					function Element:SetValue(tbl)
						Element.value = tbl
						abcd.Text = tbl.Dropdown
						values[tabname][sectorname][text] = Element.value
						for i,v in pairs(Dropdown:GetChildren()) do
							if v:IsA("Frame") then
								if v.Name == Element.value.Dropdown then
									v.Visible = true
								else
									v.Visible = false
								end
								for _,bad in pairs(v.Frame:GetChildren()) do
									if bad:IsA("TextButton") then
										bad.TextLabel.TextColor3 = COL3RGB(200, 200, 200)
										if bad.Name == Element.value.Scroll[v.Name] then
											bad.TextLabel.TextColor3 = COL3RGB(119,0,255)
										end
									end
								end
							end
						end
					end

					if data.default then
						Element:SetValue(data.default)
					end

					values[tabname][sectorname][text] = Element.value

				elseif type == "Scroll" then
					local amount = data.Amount or 6
					Section.Size = Section.Size + UDIM2(0,0,0,amount * 16 + 8)
					if data.alphabet then
						TBLSORT(data.options, function(a,b)
							return a < b
						end)
					end
					Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]}

					local Scroll = INST("Frame")
					local Frame = INST("ScrollingFrame")
					local UIListLayout = INST("UIListLayout")

					Scroll.Name = "Scroll"
					Scroll.Parent = Inner
					Scroll.BackgroundColor3 = COL3RGB(255, 255, 255)
					Scroll.BackgroundTransparency = 1.000
					Scroll.Position = UDIM2(0, 0, 00, 0)
					Scroll.Size = UDIM2(1, 0, 0, amount * 16 + 8)


					Frame.Name = "Frame"
					Frame.Parent = Scroll
					Frame.Active = true
					Frame.BackgroundColor3 = COL3RGB(24,24,24)
					Frame.BorderColor3 = COL3RGB(24,24,24)
					Frame.Position = UDIM2(0, 30, 0, 0)
					Frame.Size = UDIM2(0, 175, 0, 16 * amount)
					Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
					Frame.CanvasSize = UDIM2(0, 0, 0, 0)
					Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282"
					Frame.ScrollBarThickness = 4
					Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282"
					Frame.AutomaticCanvasSize = "Y"
					Frame.ScrollBarImageColor3 = COL3RGB(119,0,255)

					UIListLayout.Parent = Frame
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
					local first = true
					for i,v in ipairs(data.options) do
						local Button = INST("TextButton")
						local TextLabel = INST("TextLabel")

						Button.Name = v
						Button.Parent = Frame
						Button.BackgroundColor3 = COL3RGB(24,24,24)
						Button.BorderColor3 = COL3RGB(24,24,24)
						Button.BorderSizePixel = 0
						Button.Position = UDIM2(0, 30, 0, 16)
						Button.Size = UDIM2(1, 0, 0, 16)
						Button.AutoButtonColor = false
						Button.Font = Enum.Font.SourceSans
						Button.Text = ""
						Button.TextColor3 = COL3RGB(0, 0, 0)
						Button.TextSize = 14.000

						TextLabel.Parent = Button
						TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.BorderColor3 = COL3RGB(24,24,24)
						TextLabel.Position = UDIM2(0, 4, 0, -1)
						TextLabel.Size = UDIM2(1, 1, 1, 1)
						TextLabel.Font = Enum.Font.SourceSansSemibold
						TextLabel.Text = v
						TextLabel.TextColor3 = COL3RGB(200, 200, 200)
						TextLabel.TextSize = 14.000
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					
						if first then first = false
							TextLabel.TextColor3 = COL3RGB(119,0,255)
						end

						Button.MouseButton1Down:Connect(function()

							for i,v in pairs(Frame:GetChildren()) do
								if v:IsA("TextButton") then
									library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
								end
							end

							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})

							Element.value.Scroll = v

							values[tabname][sectorname][text] = Element.value
							callback(Element.value)
						end)
						Button.MouseEnter:Connect(function()
							if Element.value.Scroll ~= v then
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
							end
						end)
						Button.MouseLeave:Connect(function()
							if Element.value.Scroll ~= v then
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
							end
						end)
					end

					function Element:SetValue(val)
						Element.value = val

						for i,v in pairs(Frame:GetChildren()) do
							if v:IsA("TextButton") then
								library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
							end
						end

						library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
						values[tabname][sectorname][text] = Element.value
						callback(Element.value)
					end
					values[tabname][sectorname][text] = Element.value
				elseif type == "Jumbobox" then
					Section.Size = Section.Size + UDIM2(0,0,0,39)
					Element.value = {Jumbobox = {}}
					data.options = data.options or {}

					local Dropdown = INST("Frame")
					local Button = INST("TextButton")
					local TextLabel = INST("TextLabel")
					local Drop = INST("ScrollingFrame")
					local Button_2 = INST("TextButton")
					local TextLabel_2 = INST("TextLabel")
					local UIListLayout = INST("UIListLayout")
					local ImageLabel = INST("ImageLabel")
					local TextLabel_3 = INST("TextLabel")

					Dropdown.Name = "Dropdown"
					Dropdown.Parent = Inner
					Dropdown.BackgroundColor3 = COL3RGB(33, 35, 255)
					Dropdown.BackgroundTransparency = 1.000
					Dropdown.Position = UDIM2(0, 0, 0.255102038, 0)
					Dropdown.Size = UDIM2(1, 0, 0, 39)

					Button.Name = "Button"
					Button.Parent = Dropdown
					Button.BackgroundColor3 = COL3RGB(24,24,24)
					Button.BorderColor3 = COL3RGB(24,24,24)
					Button.Position = UDIM2(0, 30, 0, 16)
					Button.Size = UDIM2(0, 175, 0, 17)
					Button.AutoButtonColor = false
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = COL3RGB(0, 0, 0)
					Button.TextSize = 14.000

					TextLabel.Parent = Button
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.BorderColor3 = COL3RGB(24,24,24)
					TextLabel.Position = UDIM2(0, 5, 0, 0)
					TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = "..."
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				

					local abcd = TextLabel

					Drop.Name = "Drop"
					Drop.Parent = Button
					Drop.Active = true
					Drop.BackgroundColor3 = COL3RGB(24,24,24)
					Drop.BorderColor3 = COL3RGB(24,24,24)
					Drop.Position = UDIM2(0, 0, 1, 1)
					Drop.Size = UDIM2(1, 0, 0, 20)
					Drop.Visible = false
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.CanvasSize = UDIM2(0, 0, 0, 0)
					Drop.ScrollBarThickness = 4
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
					--Drop.AutomaticCanvasSize = "Y"
					for i,v in pairs(data.options) do
						Drop.CanvasSize = Drop.CanvasSize + UDIM2(0, 0, 0, 17)
					end
					Drop.ZIndex = 5
					Drop.ScrollBarImageColor3 = COL3RGB(119,0,255)

					UIListLayout.Parent = Drop
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

					values[tabname][sectorname][text] = Element.value

					local num = #data.options
					if num > 5 then
						Drop.Size = UDIM2(1, 0, 0, 85)
					else
						Drop.Size = UDIM2(1, 0, 0, 17*num)
					end
					local first = true

					local function updatetext()
						local old = {}
						for i,v in ipairs(data.options) do
							if TBLFIND(Element.value.Jumbobox, v) then
								INSERT(old, v)
							else
							end
						end
						local str = ""


						if #old == 0 then
							str = "..."
						else
							if #old == 1 then
								str = old[1]
							else
								for i,v in ipairs(old) do
									if i == 1 then
										str = v
									else
										if i > 2 then
											if i < 4 then
												str = str..",  ..."
											end
										else
											str = str..",  "..v
										end
									end
								end
							end
						end

						abcd.Text = str
					end
					for i,v in ipairs(data.options) do
						do
							local Button = INST("TextButton")
							local TextLabel = INST("TextLabel")

							Button.Name = v
							Button.Parent = Drop
							Button.BackgroundColor3 = COL3RGB(24,24,24)
							Button.BorderColor3 = COL3RGB(24,24,24)
							Button.Position = UDIM2(0, 30, 0, 16)
							Button.Size = UDIM2(0, 175, 0, 17)
							Button.AutoButtonColor = false
							Button.Font = Enum.Font.SourceSans
							Button.Text = ""
							Button.TextColor3 = COL3RGB(0, 0, 0)
							Button.TextSize = 14.000
							Button.BorderSizePixel = 0
							Button.ZIndex = 6

							TextLabel.Parent = Button
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
							TextLabel.BackgroundTransparency = 1.000
							TextLabel.BorderColor3 = COL3RGB(24,24,24)
							TextLabel.Position = UDIM2(0, 5, 0, -1)
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
							TextLabel.Font = Enum.Font.SourceSansSemibold
							TextLabel.Text = v
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)
							TextLabel.TextSize = 14.000
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left
						
							TextLabel.ZIndex = 6

							Button.MouseButton1Down:Connect(function()
								if TBLFIND(Element.value.Jumbobox, v) then
									for i,a in pairs(Element.value.Jumbobox) do
										if a == v then
											TBLREMOVE(Element.value.Jumbobox, i)
										end
									end
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
								else
									INSERT(Element.value.Jumbobox, v)
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(119,0,255)})
								end
								updatetext()

								values[tabname][sectorname][text] = Element.value
								callback(Element.value)
							end)
							Button.MouseEnter:Connect(function()
								if not TBLFIND(Element.value.Jumbobox, v) then
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
								end
							end)
							Button.MouseLeave:Connect(function()
								if not TBLFIND(Element.value.Jumbobox, v) then
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
								end
							end)

							first = false
						end
					end
					function Element:SetValue(val)
						Element.value = val
						for i,v in pairs(Drop:GetChildren()) do
							if v.Name ~= "UIListLayout" then
								if TBLFIND(val.Jumbobox, v.Name) then
									v.TextLabel.TextColor3 = COL3RGB(119,0,255)
								else
									v.TextLabel.TextColor3 = COL3RGB(200, 200, 200)
								end
							end
						end
						updatetext()
						values[tabname][sectorname][text] = Element.value
						callback(val)
					end
					if data.default then
						Element:SetValue(data.default)
					end

					ImageLabel.Parent = Button
					ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					ImageLabel.BackgroundTransparency = 1.000
					ImageLabel.Position = UDIM2(0, 165, 0, 6)
					ImageLabel.Size = UDIM2(0, 6, 0, 4)
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"

					TextLabel_3.Parent = Dropdown
					TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel_3.BackgroundTransparency = 1.000
					TextLabel_3.Position = UDIM2(0, 32, 0, -1)
					TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)
					TextLabel_3.Font = Enum.Font.SourceSansSemibold
					TextLabel_3.Text = text
					TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel_3.TextSize = 14.000
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

					Button.MouseButton1Down:Connect(function()
						Drop.Visible = not Drop.Visible
						if not Drop.Visible then
							Drop.CanvasPosition = Vec2(0,0)
						end
					end)
					local indrop = false
					local ind = false
					Drop.MouseEnter:Connect(function()
						indrop = true
					end)
					Drop.MouseLeave:Connect(function()
						indrop = false
					end)
					Button.MouseEnter:Connect(function()
						ind = true
					end)
					Button.MouseLeave:Connect(function()
						ind = false
					end)
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if Drop.Visible == true and not indrop and not ind then
								Drop.Visible = false
								Drop.CanvasPosition = Vec2(0,0)
							end
						end
					end)
				elseif type == "ToggleKeybind" then
					Section.Size = Section.Size + UDIM2(0,0,0,16)
					Element.value = {Toggle = data.default and data.default.Toggle or false, Key = data.default and data.default.Key or Key, Type = data.default and data.default.Type or "Toggle", Active = data.default and data.default.Active or false}

					local Toggle = INST("Frame")
					local Button = INST("TextButton")
					local Color = INST("Frame")
					local TextLabel = INST("TextLabel")

					Toggle.Name = "Toggle"
					Toggle.Parent = Inner
					Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000
					Toggle.Size = UDIM2(1, 0, 0, 15)

					Button.Name = "Button"
					Button.Parent = Toggle
					Button.BackgroundColor3 = COL3RGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000
					Button.Size = UDIM2(1, 0, 1, 0)
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = COL3RGB(0, 0, 0)
					Button.TextSize = 14.000

					Color.Name = "Color"
					Color.Parent = Button
					Color.BackgroundColor3 = COL3RGB(24,24,24)
					Color.BorderColor3 = COL3RGB(24,24,24)
					Color.Position = UDIM2(0, 15, 0.5, -5)
					Color.Size = UDIM2(0, 8, 0, 8)
					local binding = false
					TextLabel.Parent = Button
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDIM2(0, 32, 0, -1)
					TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = text
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				

					local function update()
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(119, 0, 255)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
						else
							
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(24,24,24)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
						end
						values[tabname][sectorname][text] = Element.value
						--callback(Element.value)
					end

					Button.MouseButton1Down:Connect(function()
						if not binding then
							Element.value.Toggle = not Element.value.Toggle
							update()
							values[tabname][sectorname][text] = Element.value
							callback(Element.value)
						end
					end)
					if data.default then
						update()
					end
					values[tabname][sectorname][text] = Element.value
					-- not responding
					do
						local Keybind = INST("TextButton")
						local Frame = INST("Frame")
						local Always = INST("TextButton")
						local UIListLayout = INST("UIListLayout")
						local Hold = INST("TextButton")
						local Toggle = INST("TextButton")

						Keybind.Name = "Keybind"
						Keybind.Parent = Button
						Keybind.BackgroundColor3 = COL3RGB(24,24,24)
						Keybind.BorderColor3 = COL3RGB(24,24,24)
						Keybind.Position = UDIM2(0, 270, 0.5, -6)
						Keybind.Text = data.default and data.default.Key or "NONE"
						Keybind.Size = UDIM2(0, 43, 0, 12)
						Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12)
						Keybind.AutoButtonColor = false
						Keybind.Font = Enum.Font.SourceSansSemibold
						Keybind.TextColor3 = COL3RGB(200, 200, 200)
						Keybind.TextSize = 14.000
						Keybind.AnchorPoint = Vec2(1,0)
						Keybind.ZIndex = 3

						Frame.Parent = Keybind
						Frame.BackgroundColor3 = COL3RGB(24,24,24)
						Frame.BorderColor3 = COL3RGB(24,24,24)
						Frame.Position = UDIM2(1, -49, 0, 1)
						Frame.Size = UDIM2(0, 49, 0, 49)
						Frame.Visible = false
						Frame.ZIndex = 3

						Always.Name = "Always"
						Always.Parent = Frame
						Always.BackgroundColor3 = COL3RGB(24,24,24)
						Always.BackgroundTransparency = 1.000
						Always.BorderColor3 = COL3RGB(24,24,24)
						Always.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)
						Always.Size = UDIM2(1, 0, 0, 16)
						Always.AutoButtonColor = false
						Always.Font = Enum.Font.SourceSansBold
						Always.Text = "Always"
						Always.TextColor3 = COL3RGB(200,200,200)
						Always.TextSize = 14.000
						Always.ZIndex = 3

						UIListLayout.Parent = Frame
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

						Hold.Name = "Hold"
						Hold.Parent = Frame
						Hold.BackgroundColor3 = COL3RGB(24,24,24)
						Hold.BackgroundTransparency = 1.000
						Hold.BorderColor3 = COL3RGB(24,24,24)
						Hold.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)
						Hold.Size = UDIM2(1, 0, 0, 16)
						Hold.AutoButtonColor = false
						Hold.Font = Enum.Font.SourceSansSemibold
						Hold.Text = "Hold"
						Hold.TextColor3 = COL3RGB(200, 200, 200)
						Hold.TextSize = 14.000
						Hold.ZIndex = 3

						Toggle.Name = "Toggle"
						Toggle.Parent = Frame
						Toggle.BackgroundColor3 = COL3RGB(24,24,24)
						Toggle.BackgroundTransparency = 1.000
						Toggle.BorderColor3 = COL3RGB(24,24,24)
						Toggle.Position = UDIM2(-3.03289485, 231, 0.115384616, -6)
						Toggle.Size = UDIM2(1, 0, 0, 16)
						Toggle.AutoButtonColor = false
						Toggle.Font = Enum.Font.SourceSansSemibold
						Toggle.Text = "Toggle"
						Toggle.TextColor3 = COL3RGB(119,0,255)
						Toggle.TextSize = 14.000
						Toggle.ZIndex = 3

						for _,button in pairs(Frame:GetChildren()) do
							if button:IsA("TextButton") then
								button.MouseButton1Down:Connect(function()
									Element.value.Type = button.Text
									Frame.Visible = false
									if Element.value.Active ~= (Element.value.Type == "Always" and true or false) then
										Element.value.Active = Element.value.Type == "Always" and true or false
										callback(Element.value)
									end
									if button.Text == "Always" then
										
									end
									for _,button in pairs(Frame:GetChildren()) do
										if button:IsA("TextButton") and button.Text ~= Element.value.Type then
											button.Font = Enum.Font.SourceSansSemibold
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})
										end
									end
									button.Font = Enum.Font.SourceSansBold
									button.TextColor3 = COL3RGB(119,0,255)
									values[tabname][sectorname][text] = Element.value
								end)
								button.MouseEnter:Connect(function()
									if Element.value.Type ~= button.Text then
										library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255,255,255)})
									end
								end)
								button.MouseLeave:Connect(function()
									if Element.value.Type ~= button.Text then
										library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200,200,200)})
									end
								end)
							end
						end
						Keybind.MouseButton1Down:Connect(function()
							if not binding then
								wait()
								binding = true
								Keybind.Text = "..."
								Keybind.Size = UDIM2(0,txt:GetTextSize("...", 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12)
							end
						end)
						Keybind.MouseButton2Down:Connect(function()
							if not binding then
								Frame.Visible = not Frame.Visible
							end
						end)
						local Player = game.Players.LocalPlayer
						local Mouse = Player:GetMouse()
						local InFrame = false
						Frame.MouseEnter:Connect(function()
							InFrame = true
						end)
						Frame.MouseLeave:Connect(function()
							InFrame = false
						end)
						local InFrame2 = false
						Keybind.MouseEnter:Connect(function()
							InFrame2 = true
						end)
						Keybind.MouseLeave:Connect(function()
							InFrame2 = false
						end)
						game:GetService("UserInputService").InputBegan:Connect(function(input,typing)
						    if typing then return end
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then
								if Frame.Visible == true and not InFrame and not InFrame2 then
									Frame.Visible = false
								end
							end
							if binding then
								binding = false
								Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper()
								Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 5,0, 12)
								Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name
								if input.KeyCode.Name == "Backspace" then
									Keybind.Text = "NONE"
									Keybind.Size = UDIM2(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.SourceSansSemibold, Vec2(700, 12)).X + 4,0, 12)
									Element.value.Key = nil
									Element.value.Active = false
								end
								callback(Element.value)
							else
								if Element.value.Key ~= nil then
									if FIND(Element.value.Key, "Mouse") then
										if input.UserInputType == Enum.UserInputType[Element.value.Key] then
											if Element.value.Type == "Hold" then
												Element.value.Active = true
												callback(Element.value)
												if Element.value.Active and Element.value.Toggle then
	
												else
													
												end
											elseif Element.value.Type == "Toggle" then
												Element.value.Active = not Element.value.Active
												callback(Element.value)
												if Element.value.Active and Element.value.Toggle then
	
												else
													
												end
											end
										end
									else
										if input.KeyCode == Enum.KeyCode[Element.value.Key] then
											if Element.value.Type == "Hold" then
												Element.value.Active = true
												callback(Element.value)
												if Element.value.Active and Element.value.Toggle then
	
												else
													
												end
											elseif Element.value.Type == "Toggle" then
												Element.value.Active = not Element.value.Active
												callback(Element.value)
												if Element.value.Active and Element.value.Toggle then
	
												else
													
												end
											end
										end
									end
								else
									Element.value.Active = false
								end
							end
							values[tabname][sectorname][text] = Element.value
						end)
						game:GetService("UserInputService").InputEnded:Connect(function(input,typing)
						    if typing then return end
							if Element.value.Key ~= nil then
								if FIND(Element.value.Key, "Mouse") then
									if input.UserInputType == Enum.UserInputType[Element.value.Key] then
										if Element.value.Type == "Hold" then
											Element.value.Active = false
											callback(Element.value)
											if Element.value.Active then

											else
												
											end
										end
									end
								else
									if input.KeyCode == Enum.KeyCode[Element.value.Key] then
										if Element.value.Type == "Hold" then
											Element.value.Active = false
											callback(Element.value)
											if Element.value.Active then

											else
												
											end
										end
									end
								end
							end
							values[tabname][sectorname][text] = Element.value
						end)
					end
					function Element:SetValue(value)
						Element.value = value
						update()
					end
				elseif type == "Toggle" then
					Section.Size = Section.Size + UDIM2(0,0,0,19)
					Element.value = {Toggle = data.default and data.default.Toggle or false}

					local Toggle = INST("Frame")
					local Button = INST("TextButton")
					local Color = INST("Frame")
					local TextLabel = INST("TextLabel")

					Toggle.Name = "Toggle"
					Toggle.Parent = Inner
					Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000
					Toggle.Size = UDIM2(1, 0, 0, 15)

					Button.Name = "Button"
					Button.Parent = Toggle
					Button.BackgroundColor3 = COL3RGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000
					Button.Size = UDIM2(1, 0, 1, 0)
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = COL3RGB(0, 0, 0)
					Button.TextSize = 14.000

					Color.Name = "Color"
					Color.Parent = Button
					Color.BackgroundColor3 = COL3RGB(24,24,24)
					Color.BorderColor3 = COL3RGB(24,24,24)
					Color.Position = UDIM2(0, 15, 0.5, -5)
					Color.Size = UDIM2(0, 8, 0, 8)

					TextLabel.Parent = Button
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDIM2(0, 32, 0, -1)
					TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = text
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				

					local function update()
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(119, 0, 255)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
						else
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(24,24,24)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
						end
						values[tabname][sectorname][text] = Element.value
					end

					Button.MouseButton1Down:Connect(function()
						Element.value.Toggle = not Element.value.Toggle
						update()
						values[tabname][sectorname][text] = Element.value
						callback(Element.value)
					end)
					if data.default then
						update()
					end
					values[tabname][sectorname][text] = Element.value
					function Element:SetValue(value)
						Element.value = value
						values[tabname][sectorname][text] = Element.value
						update()
						callback(Element.value)
					end
				elseif type == "ToggleColor" then
					Section.Size = Section.Size + UDIM2(0,0,0,16)
					Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255)}

					local Toggle = INST("Frame")
					local Button = INST("TextButton")
					local Color = INST("Frame")
					local TextLabel = INST("TextLabel")

					Toggle.Name = "Toggle"
					Toggle.Parent = Inner
					Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000
					Toggle.Size = UDIM2(1, 0, 0, 15)

					Button.Name = "Button"
					Button.Parent = Toggle
					Button.BackgroundColor3 = COL3RGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000
					Button.Size = UDIM2(1, 0, 1, 0)
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = COL3RGB(0, 0, 0)
					Button.TextSize = 14.000

					Color.Name = "Color"
					Color.Parent = Button
					Color.BackgroundColor3 = COL3RGB(24,24,24)
					Color.BorderColor3 = COL3RGB(24,24,24)
					Color.Position = UDIM2(0, 15, 0.5, -5)
					Color.Size = UDIM2(0, 8, 0, 8)

					TextLabel.Parent = Button
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDIM2(0, 32, 0, -1)
					TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = text
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				

					local function update()
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(119, 0, 255)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
						else
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(24,24,24)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
						end
						values[tabname][sectorname][text] = Element.value
					end

					local ColorH,ColorS,ColorV

					local ColorP = INST("TextButton")
					local Frame = INST("Frame")
					local Colorpick = INST("ImageButton")
					local ColorDrag = INST("Frame")
					local Huepick = INST("ImageButton")
					local Huedrag = INST("Frame")

					ColorP.Name = "ColorP"
					ColorP.Parent = Button
					ColorP.AnchorPoint = Vec2(1, 0)
					ColorP.BackgroundColor3 = COL3RGB(255, 0, 0)
					ColorP.BorderColor3 = COL3RGB(24,24,24)
					ColorP.Position = UDIM2(0, 270, 0.5, -4)
					ColorP.Size = UDIM2(0, 18, 0, 8)
					ColorP.AutoButtonColor = false
					ColorP.Font = Enum.Font.SourceSansSemibold
					ColorP.Text = ""
					ColorP.TextColor3 = COL3RGB(200, 200, 200)
					ColorP.TextSize = 14.000

					Frame.Parent = ColorP
					Frame.BackgroundColor3 = COL3RGB(24,24,24)
					Frame.BorderColor3 = COL3RGB(24,24,24)
					Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0)
					Frame.Size = UDIM2(0, 200, 0, 170)
					Frame.Visible = false
					Frame.ZIndex = 3

					Colorpick.Name = "Colorpick"
					Colorpick.Parent = Frame
					Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255)
					Colorpick.BorderColor3 = COL3RGB(24,24,24)
					Colorpick.ClipsDescendants = false
					Colorpick.Position = UDIM2(0, 40, 0, 10)
					Colorpick.Size = UDIM2(0, 150, 0, 150)
					Colorpick.AutoButtonColor = false
					Colorpick.Image = "rbxassetid://4155801252"
					Colorpick.ImageColor3 = COL3RGB(255, 0, 0)
					Colorpick.ZIndex = 3

					ColorDrag.Name = "ColorDrag"
					ColorDrag.Parent = Colorpick
					ColorDrag.AnchorPoint = Vec2(0.5, 0.5)
					ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255)
					ColorDrag.BorderColor3 = COL3RGB(24,24,24)
					ColorDrag.Size = UDIM2(0, 4, 0, 4)
					ColorDrag.ZIndex = 3

					Huepick.Name = "Huepick"
					Huepick.Parent = Frame
					Huepick.BackgroundColor3 = COL3RGB(255, 255, 255)
					Huepick.BorderColor3 = COL3RGB(24,24,24)
					Huepick.ClipsDescendants = false
					Huepick.Position = UDIM2(0, 10, 0, 10)
					Huepick.Size = UDIM2(0, 20, 0, 150)
					Huepick.AutoButtonColor = false
					Huepick.Image = "rbxassetid://3641079629"
					Huepick.ImageColor3 = COL3RGB(255, 0, 0)
					Huepick.ImageTransparency = 1
					Huepick.BackgroundTransparency = 0
					Huepick.ZIndex = 3

					local HueFrameGradient = INST("UIGradient")
					HueFrameGradient.Rotation = 90
					HueFrameGradient.Name = "HueFrameGradient"
					HueFrameGradient.Parent = Huepick
					HueFrameGradient.Color = ColorSequence.new {
						ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)),
						ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)),
						ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)),
						ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)),
						ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0))
					}	

					Huedrag.Name = "Huedrag"
					Huedrag.Parent = Huepick
					Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255)
					Huedrag.BorderColor3 = COL3RGB(24,24,24)
					Huedrag.Size = UDIM2(1, 0, 0, 2)
					Huedrag.ZIndex = 3

					ColorP.MouseButton1Down:Connect(function()
						Frame.Visible = not Frame.Visible
					end)
					local abc = false
					local inCP = false
					ColorP.MouseEnter:Connect(function()
						abc = true
					end)
					ColorP.MouseLeave:Connect(function()
						abc = false
					end)
					Frame.MouseEnter:Connect(function()
						inCP = true
					end)
					Frame.MouseLeave:Connect(function()
						inCP = false
					end)

					ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)
					ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)
					ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)

					if data.default and data.default.Color ~= nil then
						ColorH, ColorS, ColorV = data.default.Color:ToHSV()

						ColorH = CLAMP(ColorH,0,1)
						ColorS = CLAMP(ColorS,0,1)
						ColorV = CLAMP(ColorV,0,1)
						ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)

						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
						Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)

						values[tabname][sectorname][text] = data.default.Color
					end

					local mouse = LocalPlayer:GetMouse()
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if not dragging and not abc and not inCP then
								Frame.Visible = false
							end
						end
					end)

					local function updateColor()
						local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)
						local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)
						ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0)
						ColorS = 1-ColorX
						ColorV = 1-ColorY
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
						values[tabname][sectorname][text] = Element.value
						Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)
						callback(Element.value)
					end
					local function updateHue()
						local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)
						Huedrag.Position = UDIM2(0, 0, 0, y)
						hue = y/148
						ColorH = 1-hue
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
						values[tabname][sectorname][text] = Element.value
						Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)
						callback(Element.value)
					end
					Colorpick.MouseButton1Down:Connect(function()
						updateColor()
						moveconnection = mouse.Move:Connect(function()
							updateColor()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateColor()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
					Huepick.MouseButton1Down:Connect(function()
						updateHue()
						moveconnection = mouse.Move:Connect(function()
							updateHue()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateHue()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)

					Button.MouseButton1Down:Connect(function()
						Element.value.Toggle = not Element.value.Toggle
						update()
						values[tabname][sectorname][text] = Element.value
						callback(Element.value)
					end)
					if data.default then
						update()
					end
					values[tabname][sectorname][text] = Element.value
					function Element:SetValue(value)
					    -- FIX THIS NOW
					    local dangman1 = String2Clr(value.Color)
					    local dangman2 = clrtoRGB(dangman1)
					    value.Color = dangman2
						Element.value = value
						local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B)
						ColorH, ColorS, ColorV = duplicate:ToHSV()
						ColorH = CLAMP(ColorH,0,1)
						ColorS = CLAMP(ColorS,0,1)
						ColorV = CLAMP(ColorV,0,1)

						ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
						update()
						Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)
						callback(value)
					end
				elseif type == "ToggleTrans" then
					Section.Size = Section.Size + UDIM2(0,0,0,16)
					Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or COL3RGB(255,255,255), Transparency = data.default and data.default.Transparency or 0}

					local Toggle = INST("Frame")
					local Button = INST("TextButton")
					local Color = INST("Frame")
					local TextLabel = INST("TextLabel")

					Toggle.Name = "Toggle"
					Toggle.Parent = Inner
					Toggle.BackgroundColor3 = COL3RGB(255, 255, 255)
					Toggle.BackgroundTransparency = 1.000
					Toggle.Size = UDIM2(1, 0, 0, 15)

					Button.Name = "Button"
					Button.Parent = Toggle
					Button.BackgroundColor3 = COL3RGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000
					Button.Size = UDIM2(1, 0, 1, 0)
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = COL3RGB(0, 0, 0)
					Button.TextSize = 14.000

					Color.Name = "Color"
					Color.Parent = Button
					Color.BackgroundColor3 = COL3RGB(24,24,24)
					Color.BorderColor3 = COL3RGB(24,24,24)
					Color.Position = UDIM2(0, 15, 0.5, -5)
					Color.Size = UDIM2(0, 8, 0, 8)

					TextLabel.Parent = Button
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDIM2(0, 32, 0, -1)
					TextLabel.Size = UDIM2(0.111913361, 208, 1, 0)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = text
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				

					local function update()
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(119, 0, 255)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
						else
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(24,24,24)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
						end
						values[tabname][sectorname][text] = Element.value
						callback(Element.value)
					end

					local ColorH,ColorS,ColorV

					local ColorP = INST("TextButton")
					local Frame = INST("Frame")
					local Colorpick = INST("ImageButton")
					local ColorDrag = INST("Frame")
					local Huepick = INST("ImageButton")
					local Huedrag = INST("Frame")

					ColorP.Name = "ColorP"
					ColorP.Parent = Button
					ColorP.AnchorPoint = Vec2(1, 0)
					ColorP.BackgroundColor3 = COL3RGB(255, 0, 0)
					ColorP.BorderColor3 = COL3RGB(24,24,24)
					ColorP.Position = UDIM2(0, 270, 0.5, -4)
					ColorP.Size = UDIM2(0, 18, 0, 8)
					ColorP.AutoButtonColor = false
					ColorP.Font = Enum.Font.SourceSansSemibold
					ColorP.Text = ""
					ColorP.TextColor3 = COL3RGB(200, 200, 200)
					ColorP.TextSize = 14.000

					Frame.Parent = ColorP
					Frame.BackgroundColor3 = COL3RGB(24,24,24)
					Frame.BorderColor3 = COL3RGB(24,24,24)
					Frame.Position = UDIM2(-0.666666687, -170, 1.375, 0)
					Frame.Size = UDIM2(0, 200, 0, 190)
					Frame.Visible = false
					Frame.ZIndex = 3

					Colorpick.Name = "Colorpick"
					Colorpick.Parent = Frame
					Colorpick.BackgroundColor3 = COL3RGB(255, 255, 255)
					Colorpick.BorderColor3 = COL3RGB(24,24,24)
					Colorpick.ClipsDescendants = false
					Colorpick.Position = UDIM2(0, 40, 0, 10)
					Colorpick.Size = UDIM2(0, 150, 0, 150)
					Colorpick.AutoButtonColor = false
					Colorpick.Image = "rbxassetid://4155801252"
					Colorpick.ImageColor3 = COL3RGB(255, 0, 0)
					Colorpick.ZIndex = 3

					ColorDrag.Name = "ColorDrag"
					ColorDrag.Parent = Colorpick
					ColorDrag.AnchorPoint = Vec2(0.5, 0.5)
					ColorDrag.BackgroundColor3 = COL3RGB(255, 255, 255)
					ColorDrag.BorderColor3 = COL3RGB(24,24,24)
					ColorDrag.Size = UDIM2(0, 4, 0, 4)
					ColorDrag.ZIndex = 3

					Huepick.Name = "Huepick"
					Huepick.Parent = Frame
					Huepick.BackgroundColor3 = COL3RGB(255, 255, 255)
					Huepick.BorderColor3 = COL3RGB(24,24,24)
					Huepick.ClipsDescendants = true
					Huepick.Position = UDIM2(0, 10, 0, 10)
					Huepick.Size = UDIM2(0, 20, 0, 150)
					Huepick.AutoButtonColor = false
					Huepick.Image = "rbxassetid://3641079629"
					Huepick.ImageColor3 = COL3RGB(255, 0, 0)
					Huepick.ImageTransparency = 1
					Huepick.BackgroundTransparency = 0
					Huepick.ZIndex = 3

					local HueFrameGradient = INST("UIGradient")
					HueFrameGradient.Rotation = 90
					HueFrameGradient.Name = "HueFrameGradient"
					HueFrameGradient.Parent = Huepick
					HueFrameGradient.Color = ColorSequence.new {
						ColorSequenceKeypoint.new(0.00, COL3RGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.17, COL3RGB(255, 0, 255)),
						ColorSequenceKeypoint.new(0.33, COL3RGB(0, 0, 255)),
						ColorSequenceKeypoint.new(0.50, COL3RGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.67, COL3RGB(0, 255, 0)),
						ColorSequenceKeypoint.new(0.83, COL3RGB(255, 255, 0)),
						ColorSequenceKeypoint.new(1.00, COL3RGB(255, 0, 0))
					}	

					Huedrag.Name = "Huedrag"
					Huedrag.Parent = Huepick
					Huedrag.BackgroundColor3 = COL3RGB(255, 255, 255)
					Huedrag.BorderColor3 = COL3RGB(24,24,24)
					Huedrag.Size = UDIM2(1, 0, 0, 2)
					Huedrag.ZIndex = 3

					local Transpick = INST("ImageButton")
					local Transcolor = INST("ImageLabel")
					local Transdrag = INST("Frame")

					Transpick.Name = "Transpick"
					Transpick.Parent = Frame
					Transpick.BackgroundColor3 = COL3RGB(255, 255, 255)
					Transpick.BorderColor3 = COL3RGB(24,24,24)
					Transpick.Position = UDIM2(0, 10, 0, 167)
					Transpick.Size = UDIM2(0, 180, 0, 15)
					Transpick.AutoButtonColor = false
					Transpick.Image = "rbxassetid://3887014957"
					Transpick.ScaleType = Enum.ScaleType.Tile
					Transpick.TileSize = UDIM2(0, 10, 0, 10)
					Transpick.ZIndex = 3

					Transcolor.Name = "Transcolor"
					Transcolor.Parent = Transpick
					Transcolor.BackgroundColor3 = COL3RGB(255, 255, 255)
					Transcolor.BackgroundTransparency = 1.000
					Transcolor.Size = UDIM2(1, 0, 1, 0)
					Transcolor.Image = "rbxassetid://3887017050"
					Transcolor.ImageColor3 = COL3RGB(255, 0, 4)
					Transcolor.ZIndex = 3

					Transdrag.Name = "Transdrag"
					Transdrag.Parent = Transcolor
					Transdrag.BackgroundColor3 = COL3RGB(255, 255, 255)
					Transdrag.BorderColor3 = COL3RGB(24,24,24)
					Transdrag.Position = UDIM2(0, -1, 0, 0)
					Transdrag.Size = UDIM2(0, 2, 1, 0)
					Transdrag.ZIndex = 3

					ColorP.MouseButton1Down:Connect(function()
						Frame.Visible = not Frame.Visible
					end)
					local abc = false
					local inCP = false
					ColorP.MouseEnter:Connect(function()
						abc = true
					end)
					ColorP.MouseLeave:Connect(function()
						abc = false
					end)
					Frame.MouseEnter:Connect(function()
						inCP = true
					end)
					Frame.MouseLeave:Connect(function()
						inCP = false
					end)

					ColorH = (CLAMP(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)
					ColorS = 1-(CLAMP(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)
					ColorV = 1-(CLAMP(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)

					if data.default and data.default.Color ~= nil then
						ColorH, ColorS, ColorV = data.default.Color:ToHSV()

						ColorH = CLAMP(ColorH,0,1)
						ColorS = CLAMP(ColorS,0,1)
						ColorV = CLAMP(ColorV,0,1)
						ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)

						Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)

						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
						Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)
					end
					if data.default and data.default.Transparency ~= nil then
						Transdrag.Position = UDIM2(data.default.Transparency, -1, 0, 0)
					end
					local mouse = LocalPlayer:GetMouse()
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if not dragging and not abc and not inCP then
								Frame.Visible = false
							end
						end
					end)

					local function updateColor()
						local ColorX = (CLAMP(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)
						local ColorY = (CLAMP(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)
						ColorDrag.Position = UDIM2(ColorX, 0, ColorY, 0)
						ColorS = 1-ColorX
						ColorV = 1-ColorY
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
						Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)
						values[tabname][sectorname][text] = Element.value
						Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)
						callback(Element.value)
					end
					local function updateHue()
						local y = CLAMP(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)
						Huedrag.Position = UDIM2(0, 0, 0, y)
						hue = y/148
						ColorH = 1-hue
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
						Transcolor.ImageColor3 = COL3HSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
						values[tabname][sectorname][text] = Element.value
						Element.value.Color = COL3HSV(ColorH, ColorS, ColorV)
						callback(Element.value)
					end
					local function updateTrans()
						local x = CLAMP(mouse.X - Transpick.AbsolutePosition.X, 0, 178)
						Transdrag.Position = UDIM2(0, x, 0, 0)
						Element.value.Transparency = (x/178)
						values[tabname][sectorname][text] = Element.value
						callback(Element.value)
					end
					Transpick.MouseButton1Down:Connect(function()
						updateTrans()
						moveconnection = mouse.Move:Connect(function()
							updateTrans()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateTrans()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
					Colorpick.MouseButton1Down:Connect(function()
						updateColor()
						moveconnection = mouse.Move:Connect(function()
							updateColor()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateColor()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
					Huepick.MouseButton1Down:Connect(function()
						updateHue()
						moveconnection = mouse.Move:Connect(function()
							updateHue()
						end)
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								updateHue()
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)

					Button.MouseButton1Down:Connect(function()
						Element.value.Toggle = not Element.value.Toggle
						update()
						values[tabname][sectorname][text] = Element.value
						callback(Element.value)
					end)
					if data.default then
						if Element.value.Toggle then
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(155, 155, 155)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
						else
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = COL3RGB(24,24,24)})
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
						end
						values[tabname][sectorname][text] = Element.value
					end
					values[tabname][sectorname][text] = Element.value
					function Element:SetValue(value)
						Element.value = value
						local duplicate = COL3(value.Color.R, value.Color.G, value.Color.B)
						ColorH, ColorS, ColorV = duplicate:ToHSV()
						ColorH = CLAMP(ColorH,0,1)
						ColorS = CLAMP(ColorS,0,1)
						ColorV = CLAMP(ColorV,0,1)

						ColorDrag.Position = UDIM2(1-ColorS,0,1-ColorV,0)
						Colorpick.ImageColor3 = COL3HSV(ColorH, 1, 1)
						ColorP.BackgroundColor3 = COL3HSV(ColorH, ColorS, ColorV)
						update()
						Huedrag.Position = UDIM2(0, 0, 1-ColorH, -1)
					end
				elseif type == "TextBox" then
					Section.Size = Section.Size + UDIM2(0,0,0,35)
					Element.value = {Text = data.default and data.default.text or ""}

					local Box = INST("Frame")
					local TextBox = INST("TextBox")

					Box.Name = "Box"
					Box.Parent = Inner
					Box.BackgroundColor3 = COL3RGB(255, 255, 255)
					Box.BackgroundTransparency = 1.000
					Box.Position = UDIM2(0, 0, 0.542059898, 0)
					Box.Size = UDIM2(1, 0, 0, 30)

					TextBox.Parent = Box
					TextBox.BackgroundColor3 = COL3RGB(24,24,24)
					TextBox.BorderColor3 = COL3RGB(24,24,24)
					TextBox.Position = UDIM2(0.108303241, 0, 0.224465579, 0)
					TextBox.Size = UDIM2(0, 175, 0, 20)
					TextBox.Font = Enum.Font.SourceSans
					TextBox.PlaceholderText = data.placeholder
					TextBox.Text = Element.value.Text
					TextBox.TextColor3 = COL3RGB(255, 255, 255)
					TextBox.TextSize = 14.000
					TextBox.ClearTextOnFocus = false

					values[tabname][sectorname][text] = Element.value

					TextBox:GetPropertyChangedSignal("Text"):Connect(function()
						if LEN(TextBox.Text) > 10 then
							TextBox.Text = SUB(TextBox.Text, 1, 10)
						end
						Element.value.Text = TextBox.Text
						values[tabname][sectorname][text] = Element.value
						callback(Element.value)
					end)

					function Element:SetValue(value)
						Element.value = value
						values[tabname][sectorname][text] = Element.value
						TextBox.Text = Element.value.Text
					end

				elseif type == "Dropdown" then
					Section.Size = Section.Size + UDIM2(0,0,0,42)
					Element.value = {Dropdown = data.options[1]}

					local Dropdown = INST("Frame")
					local Button = INST("TextButton")
					local TextLabel = INST("TextLabel")
					local Drop = INST("ScrollingFrame")
					local Button_2 = INST("TextButton")
					local TextLabel_2 = INST("TextLabel")
					local UIListLayout = INST("UIListLayout")
					local ImageLabel = INST("ImageLabel")
					local TextLabel_3 = INST("TextLabel")

					Dropdown.Name = "Dropdown"
					Dropdown.Parent = Inner
					Dropdown.BackgroundColor3 = COL3RGB(255, 255, 255)
					Dropdown.BackgroundTransparency = 1.000
					Dropdown.Position = UDIM2(0, 0, 0.255102038, 0)
					Dropdown.Size = UDIM2(1, 0, 0, 39)

					Button.Name = "Button"
					Button.Parent = Dropdown
					Button.BackgroundColor3 = COL3RGB(24,24,24)
					Button.BorderColor3 = COL3RGB(24,24,24)
					Button.Position = UDIM2(0, 30, 0, 16)
					Button.Size = UDIM2(0, 175, 0, 17)
					Button.AutoButtonColor = false
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = COL3RGB(0, 0, 0)
					Button.TextSize = 14.000

					TextLabel.Parent = Button
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.BorderColor3 = COL3RGB(24,24,24)
					TextLabel.Position = UDIM2(0, 5, 0, 0)
					TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = Element.value.Dropdown
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				

					local abcd = TextLabel

					Drop.Name = "Drop"
					Drop.Parent = Button
					Drop.Active = true
					Drop.BackgroundColor3 = COL3RGB(24,24,24)
					Drop.BorderColor3 = COL3RGB(24,24,24)
					Drop.Position = UDIM2(0, 0, 1, 1)
					Drop.Size = UDIM2(1, 0, 0, 20)
					Drop.Visible = false
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.CanvasSize = UDIM2(0, 0, 0, 0)
					Drop.ScrollBarThickness = 4
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"
					Drop.AutomaticCanvasSize = "Y"
					Drop.ZIndex = 5
					Drop.ScrollBarImageColor3 = COL3RGB(119, 0, 255)
					local mkan = Drop
					
					
					UIListLayout.Parent = Drop
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

					local num = #data.options
					if num > 5 then
						Drop.Size = UDIM2(1, 0, 0, 85)
					else
						Drop.Size = UDIM2(1, 0, 0, 17*num)
					end
					local first = true
					for i,v in ipairs(data.options) do
						do
							local Button = INST("TextButton")
							local TextLabel = INST("TextLabel")

							Button.Name = v
							Button.Parent = Drop
							Button.BackgroundColor3 = COL3RGB(24,24,24)
							Button.BorderColor3 = COL3RGB(24,24,24)
							Button.Position = UDIM2(0, 30, 0, 16)
							Button.Size = UDIM2(0, 175, 0, 17)
							Button.AutoButtonColor = false
							Button.Font = Enum.Font.SourceSans
							Button.Text = ""
							Button.TextColor3 = COL3RGB(0, 0, 0)
							Button.TextSize = 14.000
							Button.BorderSizePixel = 0
							Button.ZIndex = 6

							TextLabel.Parent = Button
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
							TextLabel.BackgroundTransparency = 1.000
							TextLabel.BorderColor3 = COL3RGB(24,24,24)
							TextLabel.Position = UDIM2(0, 5, 0, -1)
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
							TextLabel.Font = Enum.Font.SourceSansSemibold
							TextLabel.Text = v
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)
							TextLabel.TextSize = 14.000
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left
						
							TextLabel.ZIndex = 6

							Button.MouseButton1Down:Connect(function()
								Drop.Visible = false
								Element.value.Dropdown = v
								abcd.Text = v
								values[tabname][sectorname][text] = Element.value
								callback(Element.value)
								Drop.CanvasPosition = Vec2(0,0)
							end)
							Button.MouseEnter:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)})
							end)
							Button.MouseLeave:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)})
							end)

							first = false
						end
					end
					
					function Element:GetRid(buttontext)
					    delfile(cfglocation..buttontext..".txt")
					    abcd.Text = ""
					    
					    for i,v in pairs(mkan:GetChildren()) do
					        if v.Name == buttontext then
					            v:Destroy()
					        end
					    end
					    
					    data.options = {}
					    for i,v in pairs(mkan:GetChildren()) do
					        table.insert(data.options,v.Name)
					    end
					    
					    local num = #data.options
					    if num > 5 then
					        mkan.Size = UDIM2(1, 0, 0, 85)
					    else
					        mkan.Size = UDIM2(1, 0, 0, 17*num)
					    end
					end
					function Element:Update(droptext)
					    do
					        for i,v in pairs(mkan:GetChildren()) do
					            if v.Name == "create a config" then
					                v:Destroy()
					            end
					        end
					        local num = #data.options
					        if num > 5 then
					            mkan.Size = UDIM2(1, 0, 0, 85)
					        else
					            mkan.Size = UDIM2(1, 0, 0, 17*num)
					        end
							local Button = INST("TextButton")
							local TextLabel = INST("TextLabel")

							Button.Name = droptext
							Button.Parent = Drop
							Button.BackgroundColor3 = COL3RGB(24,24,24)
							Button.BorderColor3 = COL3RGB(24,24,24)
							Button.Position = UDIM2(0, 30, 0, 16)
							Button.Size = UDIM2(0, 175, 0, 17)
							Button.AutoButtonColor = false
							Button.Font = Enum.Font.SourceSans
							Button.Text = ""
							Button.TextColor3 = COL3RGB(0, 0, 0)
							Button.TextSize = 14.000
							Button.BorderSizePixel = 0
							Button.ZIndex = 6

							TextLabel.Parent = Button
							TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
							TextLabel.BackgroundTransparency = 1.000
							TextLabel.BorderColor3 = COL3RGB(24,24,24)
							TextLabel.Position = UDIM2(0, 5, 0, -1)
							TextLabel.Size = UDIM2(-0.21714285, 208, 1, 0)
							TextLabel.Font = Enum.Font.SourceSansSemibold
							TextLabel.Text = droptext
							TextLabel.TextColor3 = COL3RGB(200, 200, 200)
							TextLabel.TextSize = 14.000
							TextLabel.TextXAlignment = Enum.TextXAlignment.Left
						
							TextLabel.ZIndex = 6

							Button.MouseButton1Down:Connect(function()
								Drop.Visible = false
								Element.value.Dropdown = droptext
								abcd.Text = droptext
								values[tabname][sectorname][text] = Element.value
								callback(Element.value)
								Drop.CanvasPosition = Vec2(0,0)
							end)
							Button.MouseEnter:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(255, 255, 255)})
							end)
							Button.MouseLeave:Connect(function()
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  COL3RGB(200, 200, 200)})
							end)

							first = false
							data.options = {}
					        for i,v in pairs(mkan:GetChildren()) do
					            table.insert(data.options,v.Name)
					        end
						end
					end

					function Element:SetValue(val)
						Element.value = val
						abcd.Text = val.Dropdown
						values[tabname][sectorname][text] = Element.value
						callback(val)
					end
					
					function Element:GetList()
					    return data.options
					end
					
					ImageLabel.Parent = Button
					ImageLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					ImageLabel.BackgroundTransparency = 1.000
					ImageLabel.Position = UDIM2(0, 165, 0, 6)
					ImageLabel.Size = UDIM2(0, 6, 0, 4)
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"

					TextLabel_3.Parent = Dropdown
					TextLabel_3.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel_3.BackgroundTransparency = 1.000
					TextLabel_3.Position = UDIM2(0, 32, 0, -1)
					TextLabel_3.Size = UDIM2(0.111913361, 208, 0.382215232, 0)
					TextLabel_3.Font = Enum.Font.SourceSansSemibold
					TextLabel_3.Text = text
					TextLabel_3.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel_3.TextSize = 14.000
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left

					Button.MouseButton1Down:Connect(function()
						Drop.Visible = not Drop.Visible
						if not Drop.Visible then
							Drop.CanvasPosition = Vec2(0,0)
						end
					end)
					local indrop = false
					local ind = false
					Drop.MouseEnter:Connect(function()
						indrop = true
					end)
					Drop.MouseLeave:Connect(function()
						indrop = false
					end)
					Button.MouseEnter:Connect(function()
						ind = true
					end)
					Button.MouseLeave:Connect(function()
						ind = false
					end)
					game:GetService("UserInputService").InputBegan:Connect(function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
							if Drop.Visible == true and not indrop and not ind then
								Drop.Visible = false
								Drop.CanvasPosition = Vec2(0,0)
							end
						end
					end)
					values[tabname][sectorname][text] = Element.value
				elseif type == "Slider" then

					Section.Size = Section.Size + UDIM2(0,0,0,25)

					local Slider = INST("Frame")
					local TextLabel = INST("TextLabel")
					local Button = INST("TextButton")
					local Frame = INST("Frame")
					local UIGradient = INST("UIGradient")
					local Value = INST("TextLabel")

					Slider.Name = "Slider"
					Slider.Parent = Inner
					Slider.BackgroundColor3 = COL3RGB(255, 255, 255)
					Slider.BackgroundTransparency = 1.000
					Slider.Position = UDIM2(0, 0, 0.653061211, 0)
					Slider.Size = UDIM2(1, 0, 0, 25)

					TextLabel.Parent = Slider
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.Position = UDIM2(0, 32, 0, -2)
					TextLabel.Size = UDIM2(0, 100, 0, 15)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = text
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				

					Button.Name = "Button"
					Button.Parent = Slider
					Button.BackgroundColor3 = COL3RGB(24,24,24)
					Button.BorderColor3 = COL3RGB(24,24,24)
					Button.Position = UDIM2(0, 30, 0, 15)
					Button.Size = UDIM2(0, 175, 0, 5)
					Button.AutoButtonColor = false
					Button.Font = Enum.Font.SourceSans
					Button.Text = ""
					Button.TextColor3 = COL3RGB(0, 0, 0)
					Button.TextSize = 14.000

					Frame.Parent = Button
					Frame.BackgroundColor3 = COL3RGB(119, 0, 255)
					Frame.BorderSizePixel = 0
					Frame.Size = UDIM2(0.5, 0, 1, 0)

					--UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, COL3RGB(153, 153, 153)), ColorSequenceKeypoint.new(1, COL3RGB(255, 0, 0))}
					--UIGradient.Rotation = 90
					--UIGradient.Parent = Frame

					Value.Name = "Value"
					Value.Parent = Slider
					Value.BackgroundColor3 = COL3RGB(255, 255, 255)
					Value.BackgroundTransparency = 1.000
					Value.Position = UDIM2(0, 150, 0, -1)
					Value.Size = UDIM2(0, 55, 0, 15)
					Value.Font = Enum.Font.SourceSansSemibold
					Value.Text = "50"
					Value.TextColor3 = COL3RGB(200, 200, 200)
					Value.TextSize = 14.000
					Value.TextXAlignment = Enum.TextXAlignment.Right
					local min, max, default, division = data.min or 0, data.max or 100, data.default or 0, data.division or 1
					Element.value = {Slider = default}

					function Element:SetValue(value)
						Element.value = value
						local a
						if min > 0 then
							a = ((Element.value.Slider - min)) / (max-min)
						else
							a = ((Element.value.Slider - min)) / (max-min)
						end
						Value.Text = Element.value.Slider
						Frame.Size = UDIM2(a,0,1,0)
						values[tabname][sectorname][text] = Element.value
						callback(value)
					end
					local a
					--[[
						
					]]
					if min > 0 then
						a = ((Element.value.Slider - min)) / (max-min)
					else
						a = ((Element.value.Slider - min)) / (max-min)
					end
					Value.Text = Element.value.Slider
					Frame.Size = UDIM2(a,0,1,0)
					values[tabname][sectorname][text] = Element.value
					local uis = game:GetService("UserInputService")
					local mouse = game.Players.LocalPlayer:GetMouse()
					local val
					Button.MouseButton1Down:Connect(function()
						--[[
							min = -4
							max = 4
							division = 10

							(4/10)-(-4/10)= 0.4 + 0.4 = 0.8*10 = 8.0 -4.0 = 4.0
							(4/10)-(-4/10) = 0.8/175 = 0.004~ * 0 = 0 -4 = -4.0




						]]
						Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
						if division > 1 then
							val = FLOOR((((((tonumber(max))/division) - (tonumber(min))/division) / 175) * Frame.AbsoluteSize.X*division) + (tonumber(min))) or 0
							Value.Text = val
							Element.value.Slider = val
						else
							val = FLOOR((((tonumber(max) - (tonumber(min))/division) / 175) * Frame.AbsoluteSize.X*division) + (tonumber(min))) or 0
							Value.Text = val/division
							Element.value.Slider = val/division
						end
						values[tabname][sectorname][text] = Element.value
						callback(Element.value)
						moveconnection = mouse.Move:Connect(function()
							Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
							if division > 1 then
								val = FLOOR((((((tonumber(max))/division) - (tonumber(min))/division) / 175) * Frame.AbsoluteSize.X*division) + (tonumber(min))) or 0
								Value.Text = val
								Element.value.Slider = val
							else
								val = FLOOR((((tonumber(max) - (tonumber(min))/division) / 175) * Frame.AbsoluteSize.X*division) + (tonumber(min))) or 0
								Value.Text = val/division
								Element.value.Slider = val/division
							end
							values[tabname][sectorname][text] = Element.value
							callback(Element.value)
						end)
						releaseconnection = uis.InputEnded:Connect(function(Mouse)
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
								Frame.Size = UDIM2(0, CLAMP(mouse.X - Frame.AbsolutePosition.X, 0, 175), 0, 5)
								if division > 1 then
									val = FLOOR((((((tonumber(max))/division) - (tonumber(min))/division) / 175) * Frame.AbsoluteSize.X*division) + (tonumber(min))) or 0
								else
									val = FLOOR((((tonumber(max) - (tonumber(min))/division) / 175) * Frame.AbsoluteSize.X*division) + (tonumber(min))) or 0
								end
								values[tabname][sectorname][text] = Element.value
								callback(Element.value)
								moveconnection:Disconnect()
								releaseconnection:Disconnect()
							end
						end)
					end)
				elseif type == "Button" then
					Section.Size = Section.Size + UDIM2(0,0,0,24)
					local Button = INST("Frame")
					local Button_2 = INST("TextButton")
					local TextLabel = INST("TextLabel")

					Button.Name = "Button"
					Button.Parent = Inner
					Button.BackgroundColor3 = COL3RGB(255, 255, 255)
					Button.BackgroundTransparency = 1.000
					Button.Position = UDIM2(0, 0, 0.236059487, 0)
					Button.Size = UDIM2(1, 0, 0, 24)

					Button_2.Name = "Button"
					Button_2.Parent = Button
					Button_2.BackgroundColor3 = COL3RGB(24,24,24)
					Button_2.BorderColor3 = COL3RGB(24,24,24)
					Button_2.Position = UDIM2(0, 30, 0.5, -9)
					Button_2.Size = UDIM2(0, 175, 0, 18)
					Button_2.AutoButtonColor = false
					Button_2.Font = Enum.Font.SourceSans
					Button_2.Text = ""
					Button_2.TextColor3 = COL3RGB(0, 0, 0)
					Button_2.TextSize = 14.000

					TextLabel.Parent = Button_2
					TextLabel.BackgroundColor3 = COL3RGB(255, 255, 255)
					TextLabel.BackgroundTransparency = 1.000
					TextLabel.BorderColor3 = COL3RGB(24,24,24)
					TextLabel.Size = UDIM2(1, 0, 1, 0)
					TextLabel.Font = Enum.Font.SourceSansSemibold
					TextLabel.Text = text
					TextLabel.TextColor3 = COL3RGB(200, 200, 200)
					TextLabel.TextSize = 14.000

					function Element:SetValue()
					end

					Button_2.MouseButton1Down:Connect(function()
						TextLabel.TextColor3 = COL3RGB(119, 0, 255)
						library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
						callback()
					end)
					Button_2.MouseEnter:Connect(function()
						library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(255, 255, 255)})
					end)
					Button_2.MouseLeave:Connect(function()
						library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = COL3RGB(200, 200, 200)})
					end)
				end
				
				ConfigLoad:Connect(function(cfg)
					pcall(function()
						local fix = library:ConfigFix(cfg)
						if fix[tabname][sectorname][text] ~= nil then
							Element:SetValue(fix[tabname][sectorname][text])
						end
					end)
				end)

				OnlineConfigLoad:Connect(function(cfg) -- has to be the json decoded one
					pcall(function()
						local fix = library:OnlineConfigFix(cfg)
						if fix[tabname][sectorname][tabtext][text] ~= nil then
							Element:SetValue(fix[tabname][sectorname][tabtext][text])
						end
					end)
				end)
				
				

				return Element
			end
			return Sector
		end

		return Tab
	end

	Ova.Parent = game.CoreGui

	return menu
end
return library
