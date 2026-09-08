-- Fire Fix
if not getgenv().Fix then
	getgenv().Fix = loadstring(game:HttpGet("https://raw.githubusercontent.com/ReliefScript/firefix/refs/heads/main/main.lua"))()
end

-- Blur
local Blur = loadstring(game:HttpGet("https://raw.githubusercontent.com/ReliefScript/firefix/refs/heads/main/blur.lua"))()

-- Services
local function Service(Name)
	return cloneref(game:GetService(Name))
end

local Players = Service("Players")
local CoreGui = Service("CoreGui")
local TweenService = Service("TweenService")

-- Variables & Functions
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local function Pad(Inst)
	local Padding = Instance.new("UIPadding")
	Padding.Parent = Inst

	local Tree = {}

	function Tree:A(X, Y)
		X = X or 0
		Y = Y or 0
		Padding.PaddingLeft = UDim.new(X, Y)
		Padding.PaddingRight = UDim.new(X, Y)
		Padding.PaddingTop = UDim.new(X, Y)
		Padding.PaddingBottom = UDim.new(X, Y)
		return Tree
	end

	function Tree:L(X, Y)
		Padding.PaddingLeft = UDim.new(X or 0, Y or 0)
		return Tree
	end

	function Tree:R(X, Y)
		Padding.PaddingRight = UDim.new(X or 0, Y or 0)
		return Tree
	end

	function Tree:T(X, Y)
		Padding.PaddingTop = UDim.new(X or 0, Y or 0)
		return Tree
	end

	function Tree:B(X, Y)
		Padding.PaddingBottom = UDim.new(X or 0, Y or 0)
		return Tree
	end

	return Tree
end

local function Ratio(Inst, Amount)
	local Constraint = Instance.new("UIAspectRatioConstraint")
	Constraint.Parent = Inst
	Constraint.AspectRatio = Amount or 1
end

local function Stroke(Inst)
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Parent = Inst
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	local Tree = {}

	function Tree:Transparency(Number)
		UIStroke.Transparency = Number
		return Tree
	end

	return Tree
end

local function Round(Inst, X, Y)
	local Corner = Instance.new("UICorner")
	Corner.Parent = Inst
	Corner.CornerRadius = UDim.new(X or 0, Y or 0)
end

local function Center(Inst)
	Inst.AnchorPoint = Vector2.new(0.5, 0.5)
	Inst.Position = UDim2.new(0.5, 0, 0.5,0)
end

-- Ui
local Screen = Instance.new("ScreenGui")
Screen.Parent = CoreGui
Screen.Name = "Screen"
Screen.DisplayOrder = 1e6
Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Open = Instance.new("TextButton")
Open.Parent = Screen
Open.BackgroundTransparency = 1
Open.AnchorPoint = Vector2.new(0.5, 0, 0, 0)
Open.Position = UDim2.new(0.5, 0, 0, 0)
Open.Size = UDim2.new(0, 0, 0.05, 0)
Open.AutomaticSize = Enum.AutomaticSize.X
Open.Text = "+"
Open.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
Open.TextScaled = true
Open.TextColor3 = Color3.new(1, 1, 1)
Open.TextStrokeTransparency = 0.5
Open.TextXAlignment = Enum.TextXAlignment.Right
Open.Visible = false

local Main = Instance.new("Frame")
Main.Parent = Screen
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Size = UDim2.new(0.3, 0, 0.3, 0)
Main.BorderColor3 = Color3.new(0, 0, 0)
Main.Name = "Main"
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -7, 0.5, -1)
Main.BackgroundTransparency = 0.5
Main.BackgroundColor3 = Color3.new(0, 0, 0)
Main.Active = true
Main.Draggable = true
Ratio(Main, 1.765)
Blur.new(Main, "Rectangle")
--Blur.

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Active = false
Title.TextStrokeTransparency = 0.5
Title.BorderSizePixel = 0
Title.TextScaled = true
Title.BackgroundColor3 = Color3.new(1, 1, 1)
Title.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
Title.TextSize = 14
Title.Size = UDim2.new(0.83, 0, 0.093, 0)
Title.BorderColor3 = Color3.new(0, 0, 0)
Title.Text = "RQCCC'S DEBUG MENU"
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextTransparency = 0.2
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.024, 0, 0.038, 0)
Title.Name = "Title"

local Divider = Instance.new("Frame")
Divider.Parent = Main
Divider.Active = false
Divider.Size = UDim2.new(0, 2, 0.7, 0)
Divider.BorderColor3 = Color3.new(0, 0, 0)
Divider.Name = "Divider"
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0.15, 0, 0.2, 0)
Divider.BackgroundTransparency = 0.8
Divider.BackgroundColor3 = Color3.new(1, 1, 1)
Stroke(Divider):Transparency(0.8)

local Close = Instance.new("TextButton")
Close.Parent = Main
Close.TextStrokeTransparency = 0.5
Close.BorderSizePixel = 0
Close.TextScaled = true
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
Close.Selectable = true
Close.TextSize = 14
Close.TextXAlignment = Enum.TextXAlignment.Right
Close.Size = UDim2.new(0.15, 0, 0.093, 0)
Close.TextTransparency = 0.2
Close.TextColor3 = Color3.new(1, 1, 1)
Close.BorderColor3 = Color3.new(0, 0, 0)
Close.Text = "X"
Close.BackgroundTransparency = 1
Close.Position = UDim2.new(0.825, 0, 0.038, 0)
Close.Name = "Close"

local TabHolder = Instance.new("Frame")
TabHolder.Parent = Main
TabHolder.Active = false
TabHolder.Size = UDim2.new(0.15, 0, 0.7, 0)
TabHolder.BorderColor3 = Color3.new(0, 0, 0)
TabHolder.Name = "TabHolder"
TabHolder.BorderSizePixel = 0
TabHolder.Position = UDim2.new(0, 0, 0.2, 0)
TabHolder.BackgroundTransparency = 1
TabHolder.BackgroundColor3 = Color3.new(1, 1, 1)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = TabHolder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local FrameHolder = Instance.new("Frame")
FrameHolder.Parent = Main
FrameHolder.Active = false
FrameHolder.Size = UDim2.new(0.818, 0, 0.7, 0)
FrameHolder.BorderColor3 = Color3.new(0, 0, 0)
FrameHolder.Name = "FrameHolder"
FrameHolder.BorderSizePixel = 0
FrameHolder.Position = UDim2.new(0.165, 0, 0.2, 0)
FrameHolder.BackgroundTransparency = 1
FrameHolder.BackgroundColor3 = Color3.new(1, 1, 1)

-- Setup

Close.MouseButton1Down:Connect(function()
	Main.Visible = false
	Open.Visible = true
end)

Open.MouseButton1Down:Connect(function()
	Main.Visible = true
	Open.Visible = false
end)

local Tabs = {}

local function RegisterTab(Name)
	local Tree = {Selected = #Tabs == 0 or false}

	local Tab = Instance.new("TextButton")
	Tab.Parent = TabHolder
	Tab.Name = Name
	Tab.TextStrokeTransparency = 0.5
	Tab.BorderSizePixel = 0
	Tab.TextScaled = true
	Tab.BackgroundColor3 = Color3.new(1, 1, 1)
	Tab.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
	Tab.Size = UDim2.new(1, 0, 0.15, 0)
	Tab.TextTransparency = Tree.Selected and 0.2 or 0.5
	Tab.TextColor3 = Color3.new(1, 1, 1)
	Tab.Text = Name:upper()
	Tab.BackgroundTransparency = 1
	Tree.Button = Tab
	Pad(Tab):A(0.15):L(0.1):R(0.1)

	local TabFrame = Instance.new("Frame")
	TabFrame.Parent = FrameHolder
	TabFrame.Size = UDim2.new(1, 0, 1, 0)
	TabFrame.BorderColor3 = Color3.new(0, 0, 0)
	TabFrame.BorderSizePixel = 0
	TabFrame.BackgroundTransparency = 1
	TabFrame.BackgroundColor3 = Color3.new(1, 1, 1)
	TabFrame.Visible = #Tabs == 0
	Tree.Frame = TabFrame

	Tab.MouseEnter:Connect(function()
		if Tree.Selected then return end
		Tab.TextTransparency = 0.2
	end)

	Tab.MouseLeave:Connect(function()
		if Tree.Selected then return end
		Tab.TextTransparency = 0.5
	end)

	Tab.MouseButton1Down:Connect(function()
		for _, T in Tabs do
			T.Frame.Visible = false
			T.Button.TextTransparency = 0.5
			T.Selected = false
		end
		TabFrame.Visible = true
		Tab.TextTransparency = 0.2
		Tree.Selected = true
	end)

	table.insert(Tabs, Tree)
	return TabFrame
end

local function List(Parent, Callback)
	local List = Instance.new("ScrollingFrame")
	List.Parent = Parent
	List.Active = false
	List.Size = UDim2.new(0.651, 0, 1, 0)
	List.BorderColor3 = Color3.new(0, 0, 0)
	List.Name = "List"
	List.BorderSizePixel = 0
	List.Position = UDim2.new(0, 0, 0, 0)
	List.BackgroundTransparency = 0.7
	List.BackgroundColor3 = Color3.new(0, 0, 0)
	List.CanvasSize = UDim2.new(0, 0, 0, 0)
	List.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local UIListLayout2 = Instance.new("UIListLayout")
	UIListLayout2.Parent = List
	UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder

	local LoadLabel = Instance.new("TextLabel")
	LoadLabel.Parent = List
	LoadLabel.BackgroundTransparency = 1
	LoadLabel.Size = UDim2.new(1, 0, 1, 0)
	LoadLabel.Text = "Loading..."
	LoadLabel.TextScaled = true
	LoadLabel.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
	LoadLabel.TextColor3 = Color3.new(1, 1, 1)
	LoadLabel.TextStrokeTransparency = 0.5
	Pad(LoadLabel):A(0.1)

	local Info = Instance.new("Frame")
	Info.Parent = Parent
	Info.Active = false
	Info.Size = UDim2.new(0.334, 0, 1, 0)
	Info.BorderColor3 = Color3.new(0, 0, 0)
	Info.Name = "Info"
	Info.BorderSizePixel = 0
	Info.Position = UDim2.new(0.666, 0, 0, 0)
	Info.BackgroundTransparency = 0.7
	Info.BackgroundColor3 = Color3.new(0, 0, 0)

	local Title2 = Instance.new("TextLabel")
	Title2.Parent = Info
	Title2.Active = false
	Title2.TextStrokeTransparency = 0.5
	Title2.BorderSizePixel = 0
	Title2.TextScaled = true
	Title2.BackgroundColor3 = Color3.new(1, 1, 1)
	Title2.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
	Title2.TextSize = 14
	Title2.Size = UDim2.new(0.83, 0, 0.122, 0)
	Title2.BorderColor3 = Color3.new(0, 0, 0)
	Title2.Text = "NAME"
	Title2.TextColor3 = Color3.new(1, 1, 1)
	Title2.TextTransparency = 0.2
	Title2.BackgroundTransparency = 1
	Title2.Position = UDim2.new(0.081, 0, 0.028, 0)
	Title2.Name = "Title"

	local Fire = Instance.new("TextButton")
	Fire.Parent = Info
	Fire.TextStrokeTransparency = 0.5
	Fire.BorderSizePixel = 0
	Fire.TextScaled = true
	Fire.BackgroundColor3 = Color3.new(0, 0, 0)
	Fire.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
	Fire.Selectable = true
	Fire.TextSize = 14
	Fire.Size = UDim2.new(0.868, 0, 0.15, 0)
	Fire.TextTransparency = 0.2
	Fire.TextColor3 = Color3.new(1, 1, 1)
	Fire.BorderColor3 = Color3.new(0, 0, 0)
	Fire.Text = "FIRE"
	Fire.BackgroundTransparency = 0.5
	Fire.Position = UDim2.new(0.065, 0, 0.799, 0)
	Fire.Name = "Fire"
	Pad(Fire):A(0.15):R(0.1):L(0.1)

	local Tp = Instance.new("TextButton")
	Tp.Parent = Info
	Tp.TextStrokeTransparency = 0.5
	Tp.BorderSizePixel = 0
	Tp.TextScaled = true
	Tp.BackgroundColor3 = Color3.new(0, 0, 0)
	Tp.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
	Tp.Selectable = true
	Tp.TextSize = 14
	Tp.Size = UDim2.new(0.868, 0, 0.15, 0)
	Tp.TextTransparency = 0.2
	Tp.TextColor3 = Color3.new(1, 1, 1)
	Tp.BorderColor3 = Color3.new(0, 0, 0)
	Tp.Text = "TP TO"
	Tp.BackgroundTransparency = 0.5
	Tp.Position = UDim2.new(0.065, 0, 0.615, 0)
	Tp.Name = "Tp"
	Pad(Tp):A(0.15):R(0.1):L(0.1)

	local Path = Instance.new("TextLabel")
	Path.Parent = Info
	Path.Active = false
	Path.TextStrokeTransparency = 0.5
	Path.BorderSizePixel = 0
	Path.TextScaled = true
	Path.BackgroundColor3 = Color3.new(1, 1, 1)
	Path.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
	Path.TextSize = 14
	Path.Size = UDim2.new(0.83, 0, 0.345, 0)
	Path.BorderColor3 = Color3.new(0, 0, 0)
	Path.Text = "PATH TO THE INSTANCE GOES HERE."
	Path.TextColor3 = Color3.new(1, 1, 1)
	Path.TextTransparency = 0.2
	Path.BackgroundTransparency = 1
	Path.Position = UDim2.new(0.081, 0, 0.212, 0)
	Path.Name = "Path"

	local Loaded = false
	local Archive = {}

	local Tree = {}

	function Tree:SetInfo(Text, PathText)
		Path.Text = PathText
		Title2.Text = Text
	end

	function Tree:AddToList(Name, Callback)
		local ListItem = Instance.new("TextButton")
		ListItem.Parent = List
		ListItem.TextStrokeTransparency = 0.5
		ListItem.BorderSizePixel = 0
		ListItem.TextScaled = true
		ListItem.BackgroundColor3 = Color3.new(1, 1, 1)
		ListItem.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
		ListItem.Selectable = true
		ListItem.TextSize = 14
		ListItem.TextXAlignment = Enum.TextXAlignment.Left
		ListItem.Size = UDim2.new(1, 0, 0.1, 0)
		ListItem.TextColor3 = Color3.new(1, 1, 1)
		ListItem.BorderColor3 = Color3.new(0, 0, 0)
		ListItem.Text = Name
		ListItem.BackgroundTransparency = 1
		ListItem.Name = "ListItem"
		ListItem.Visible = Loaded
		Pad(ListItem):T(0.1):B(0.1):L(0.02)
		Archive[Name] = ListItem

		ListItem.MouseEnter:Connect(function()
			ListItem.BackgroundTransparency = 0.9
		end)

		ListItem.MouseLeave:Connect(function()
			ListItem.BackgroundTransparency = 1
		end)

		ListItem.MouseButton1Down:Connect(Callback)
	end

	function Tree:RemoveFromList(Name)
		local Found = Archive[Name]
		if Found then
			Found:Destroy()
			if Title2.Text == Name then
				Title2.Text = "NAME"
				Path.Text = "PATH TO THE INSTANCE GOES HERE."
				return 1
			end
		end
	end

	function Tree:TPInit(Callback)
		Tp.MouseButton1Down:Connect(Callback)
	end

	function Tree:FireInit(Callback)
		Fire.MouseButton1Down:Connect(Callback)
	end

	function Tree:Load()
		if Loaded then return end

		for _, L in Archive do
			L.Visible = true
		end
		Loaded = true
		LoadLabel:Destroy()
	end

	return Tree
end

local function SearchInst(List, ClassName, Callback)
	local Info = {nil, nil}

	local function HandleItem(Inst)
		if Inst:IsA(ClassName) then
			local Part = Inst.Parent
			if not Part or not Part:IsA("BasePart") then return end

			List:AddToList(Part.Name, function()
				Info = {Part, Inst}
				List:SetInfo(Part.Name, Inst:GetFullName():gsub("%.", " > "))
			end)

			local C C = Part.AncestryChanged:Connect(function(_, NewParent)
				if NewParent == nil then
					C:Disconnect()
					local WasSelected = List:RemoveFromList(Part.Name)
					if WasSelected then
						Info = {nil, nil}
					end
				end
			end)
		end
	end

	task.spawn(function()
		for _, Inst in workspace:GetDescendants() do
			HandleItem(Inst)
			if _ % 100 == 0 then task.wait() end
		end
		workspace.DescendantAdded:Connect(HandleItem)
		List:Load()
	end)

	List:TPInit(function()
		local Part = Info[1]
		if Part then
			LocalPlayer.Character:PivotTo(Part.CFrame)
		end
	end)

	List:FireInit(function()
		local Inst = Info[2]
		if Inst then
			Callback(Inst)
		end
	end)
end

-- Touch Tab
local Touch = RegisterTab("Touch")
local TouchList = List(Touch)

SearchInst(TouchList, "TouchTransmitter", function(Inst)
	firetouchinterest(Inst)
end)

-- Click Tab
local Click = RegisterTab("Click")
local ClickList = List(Click)

SearchInst(ClickList, "ClickDetector", function(Inst)
	fireclickdetector(Inst)
end)

-- Prompt Tab
local Prompt = RegisterTab("Prompt")
local PromptList = List(Prompt)

SearchInst(PromptList, "ProximityPrompt", function(Inst)
	fireproximityprompt(Inst)
end)

-- Misc Tab
local Misc = RegisterTab("Misc")

local ToggleFrame = Instance.new("Frame")
ToggleFrame.Parent = Misc
ToggleFrame.Size = UDim2.new(1, 0, 0.125, 0)
ToggleFrame.BackgroundTransparency = 1

local Title = Instance.new("TextLabel")
Title.Parent = ToggleFrame
Title.Text = "Show Part Names"
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0.8, 0, 1, 0)
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
Title.TextStrokeTransparency = 0.5
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Pad(Title):A(0.07):L(0.02)

local Toggle = Instance.new("TextButton")
Toggle.Parent = ToggleFrame
Toggle.Text = ""
Toggle.AutoButtonColor = false
Toggle.AnchorPoint = Vector2.new(1, 0)
Toggle.Position = UDim2.new(1, 0, 0, 0)
Toggle.Size = UDim2.new(0.125, 0, 1, 0)
Toggle.BorderSizePixel = 0
Toggle.BackgroundColor3 = Color3.new(1, 0, 0)
Stroke(Toggle)
Round(Toggle, 1)

local Info = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local Toggled = false
Toggle.MouseButton1Down:Connect(function()
	Toggled = not Toggled

	local NewColor = Toggled and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
	TweenService:Create(Toggle, Info, {
		BackgroundColor3 = NewColor
	}):Play()

	if Toggled then
		local DisplayLabel = Instance.new("TextLabel")
		DisplayLabel.Parent = Screen
		DisplayLabel.Name = "DisplayLabel"
		DisplayLabel.TextColor3 = Color3.new(1, 1, 1)
		DisplayLabel.TextStrokeTransparency = 0.5
		DisplayLabel.FontFace = Font.new("rbxasset://fonts/families/Inconsolata.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal)
		DisplayLabel.TextScaled = true
		DisplayLabel.Size = UDim2.fromScale(0, 0.02)
		DisplayLabel.BackgroundTransparency = 0.5
		DisplayLabel.BackgroundColor3 = Color3.new(0, 0, 0)
		DisplayLabel.BorderSizePixel = 0
		DisplayLabel.AutomaticSize = Enum.AutomaticSize.X
		DisplayLabel.TextXAlignment = Enum.TextXAlignment.Left

		task.spawn(function()
			while Toggled do
				task.wait()

				local Target = Mouse.Target
				if Target then
					DisplayLabel.Text = Target:GetFullName()
				else
					DisplayLabel.Text = "???"
				end

				DisplayLabel.Position = UDim2.fromOffset(Mouse.X, Mouse.Y)
			end
		end)
	else
		Screen.DisplayLabel:Destroy()
	end
end)
