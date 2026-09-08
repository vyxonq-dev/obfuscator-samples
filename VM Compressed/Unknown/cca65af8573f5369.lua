local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerMouse = Player:GetMouse()

local splib = {
    Themes = loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/splibv2/main/Themes.lua"))(),
    Info = {
        Version = "1.1.5"
    },
    Save = {
        UISize = {550, 380},
        TabSize = 160,
        Theme = "Red"
    },
    Settings = {},
    Connection = {},
    Instances = {},
    Elements = {},
    Options = {},
    Flags = {},
    Tabs = {},
    Icons = loadstring(game:HttpGet("https://raw.githubusercontent.com/as6cd0/splibv2/main/Icons.lua"))()
}

-- ok this is redz lib v5 but now its for sp cuz its has edited in full! and  big improvent and added more functions by sp to contact the the dev discord @nadermohamed22
local Binds = {}
local Toggles = {}

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local isPC = not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled

local ViewportSize = workspace.CurrentCamera.ViewportSize
local UIScale = isPC and ViewportSize.Y / 550 or ViewportSize.Y / 425

local Settings = splib.Settings
local Flags = splib.Flags

local SettingsFile = "sp library.json"
local LoadedToggles = {}
if isfile(SettingsFile) then
    local ok, data = pcall(HttpService.JSONDecode, HttpService, readfile(SettingsFile))
    if ok and type(data) == "table" then
        LoadedToggles = data
    end
end

local DropdownsFile = "dropdowns.json"
local LoadedDropdowns = {}
if isfile(DropdownsFile) then
    local ok, data = pcall(function()
        return HttpService:JSONDecode(readfile(DropdownsFile))
    end)

    if ok and type(data) == "table" then
        LoadedDropdowns = data
    end
end

local function SaveCfg(filename)
    local data = {}
    for flag, obj in pairs(splib.Flags) do
        if obj.Save then
            data[flag] = obj.Value
        end
    end
    writefile(filename .. ".json", HttpService:JSONEncode(data))
end

local function LoadCfg(filename)
    if isfile(filename .. ".json") then
        local ok, data = pcall(HttpService.JSONDecode, HttpService, readfile(filename .. ".json"))
        if ok and type(data) == "table" then
            for flag, value in pairs(data) do
                local obj = splib.Flags[flag]
                if obj and obj.Set then
                    obj:Set(value)
                    obj.Value = value
                end
            end
        end
    end
end

LoadCfg("sp library")

local SetProps, SetChildren, InsertTheme, Create do
	InsertTheme = function(Instance, Type)
		table.insert(splib.Instances, {
			Instance = Instance,
			Type = Type
		})
		return Instance
	end
	
	SetChildren = function(Instance, Children)
		if Children then
			table.foreach(Children, function(_,Child)
				Child.Parent = Instance
			end)
		end
		return Instance
	end
	
	SetProps = function(Instance, Props)
		if Props then
			table.foreach(Props, function(prop, value)
				Instance[prop] = value
			end)
		end
		return Instance
	end
	
	Create = function(...)
		local args = {...}
		if type(args) ~= "table" then return end
		local new = Instance.new(args[1])
		local Children = {}
		
		if type(args[2]) == "table" then
			SetProps(new, args[2])
			SetChildren(new, args[3])
			Children = args[3] or {}
		elseif typeof(args[2]) == "Instance" then
			new.Parent = args[2]
			SetProps(new, args[3])
			SetChildren(new, args[4])
			Children = args[4] or {}
		end
		return new
	end
	
local function Save(file)
		if readfile and isfile and isfile(file) then
			local decode = HttpService:JSONDecode(readfile(file))
			
			if type(decode) == "table" then
				if rawget(decode, "UISize") then splib.Save["UISize"] = decode["UISize"] end
				if rawget(decode, "TabSize") then splib.Save["TabSize"] = decode["TabSize"] end
				if rawget(decode, "Theme") and VerifyTheme(decode["Theme"]) then splib.Save["Theme"] = decode["Theme"] end
			end
		end
	end
	
	pcall(Save, "sp library.json")
end


local Funcs = {} do
	function Funcs:InsertCallback(tab, func)
		if type(func) == "function" then
			table.insert(tab, func)
		end
		return func
	end
	
function Funcs:FireCallback(tab, ...)
    for _, v in ipairs(tab) do
        if type(v) == "function" then
            task.spawn(v, ...)
        end
    end
end
	
	function Funcs:ToggleVisible(Obj, Bool)
		Obj.Visible = (Bool ~= nil) and Bool or Obj.Visible
	end
	
function Funcs:ToggleParent(Obj, Parent, Bool)
    if Bool ~= nil then
        if Bool then
            Obj.Parent = Parent
        else
            Obj.Parent = nil
        end
    else
        Obj.Parent = Obj.Parent and nil or Parent
    end
end
	
	function Funcs:GetConnectionFunctions(ConnectedFuncs, func)
		local Connected = { Function = func, Connected = true }
		
		function Connected:Disconnect()
			if self.Connected then
				table.remove(ConnectedFuncs, table.find(ConnectedFuncs, self.Function))
				self.Connected = false
			end
		end
		
		function Connected:Fire(...)
			if self.Connected then
				task.spawn(self.Function, ...)
			end
		end
		
		return Connected
	end
	
	function Funcs:GetCallback(Configs, index)
		local func = Configs[index] or Configs.Callback or function() end
		
		if type(func) == "table" then
			return ({function(Value) func[1][func[2]] = Value end})
		end
		return {func}
	end
end

local Connections, Connection = {}, splib.Connection do
	local function NewConnectionList(List)
		if type(List) ~= "table" then return end
		
		for _,CoName in ipairs(List) do
			local ConnectedFuncs, Connect = {}, {}
			Connection[CoName] = Connect
			Connections[CoName] = ConnectedFuncs
			Connect.Name = CoName
			
			function Connect:Connect(func)
				if type(func) == "function" then
					table.insert(ConnectedFuncs, func)
					return Funcs:GetConnectionFunctions(ConnectedFuncs, func)
				end
			end
			
			function Connect:Once(func)
				if type(func) == "function" then
					local Connected;
					
					local _NFunc;_NFunc = function(...)
						task.spawn(func, ...)
						Connected:Disconnect()
					end
					
					Connected = Funcs:GetConnectionFunctions(ConnectedFuncs, _NFunc)
					return Connected
				end
			end
		end
	end
	
	function Connection:FireConnection(CoName, ...)
		local Connection = type(CoName) == "string" and Connections[CoName] or Connections[CoName.Name]
		for _,Func in pairs(Connection) do
			task.spawn(Func, ...)
		end
	end
	
	NewConnectionList({"FlagsChanged", "ThemeChanged", "FileSaved", "ThemeChanging", "OptionAdded"})
end

local GetFlag, SetFlag, CheckFlag do
	CheckFlag = function(Name)
		return type(Name) == "string" and Flags[Name] ~= nil
	end
	
	GetFlag = function(Name)
		return type(Name) == "string" and Flags[Name]
	end
	
	SetFlag = function(Flag, Value)
		if Flag and (Value ~= Flags[Flag] or type(Value) == "table") then
			Flags[Flag] = Value
			Connection:FireConnection("FlagsChanged", Flag, Value)
		end
	end
	
	local db
	Connection.FlagsChanged:Connect(function(Flag, Value)
		local ScriptFile = Settings.ScriptFile
		if not db and ScriptFile and writefile then
			db=true;task.wait(0.1);db=false
			
			local Success, Encoded = pcall(function()
				-- local _Flags = {}
				-- for _,Flag in pairs(Flags) do _Flags[_] = Flag.Value end
				return HttpService:JSONEncode(Flags)
			end)
			
			if Success then
				local Success = pcall(writefile, ScriptFile, Encoded)
				if Success then
					Connection:FireConnection("FileSaved", "Script-Flags", ScriptFile, Encoded)
				end
			end
		end
	end)
end

local saved = {}
if isfile("sp library.json") then
  local ok,data = pcall(HttpService.JSONDecode, HttpService, readfile("sp library.json"))
  if ok and type(data)=="table" then saved = data end
end
splib.Save = {
  UISize  = saved.UISize  or splib.Save.UISize,
  TabSize = saved.TabSize or splib.Save.TabSize,
  Theme   = saved.Theme   or splib.Save.Theme,
}

local bindConnections = {}
local shouldClearToggles = false

local GUI_NAME = "sp Library"
local oldGui = CoreGui:FindFirstChild(GUI_NAME)
if oldGui then
    for _, conn in ipairs(bindConnections) do
        if typeof(conn) == "RBXScriptConnection" and conn.Connected then
            conn:Disconnect()
        end
    end
    table.clear(bindConnections)

    if splib and type(splib.ClearAllBinds) == "function" then
        splib:ClearAllBinds()
    end
    if shouldClearToggles and splib and type(splib.ClearAllToggles) == "function" then
        splib:ClearAllToggles()
    end

    oldGui:Destroy()
end

local ScreenGui = Create("ScreenGui", CoreGui, {
    Name = GUI_NAME,
}, {
    Create("UIScale", {
        Scale = UIScale,
        Name = "Scale"
    })
})

local function GetStr(val)
	if type(val) == "function" then
		return val()
	end
	return val
end

local function ConnectSave(Instance, func)
	Instance.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
			while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do task.wait()
			end
		end
		func()
	end)
end

local function CreateTween(Configs)
	local Instance = Configs[1] or Configs.Instance
	local Prop = Configs[2] or Configs.Prop
	local NewVal = Configs[3] or Configs.NewVal
	local Time = Configs[4] or Configs.Time or 0.5
	local TweenWait = Configs[5] or Configs.wait or false
	local TweenInfo = TweenInfo.new(Time, Enum.EasingStyle.Quint)
	
	local Tween = TweenService:Create(Instance, TweenInfo, {[Prop] = NewVal})
	Tween:Play()
	if TweenWait then
		Tween.Completed:Wait()
	end
	return Tween
end

local function AddDraggingFunctionality(DragPoint, Main)
    pcall(
        function()
            local Dragging, DragInput, MousePos, FramePos = false
            DragPoint.InputBegan:Connect(
                function(Input)
                    if
                        Input.UserInputType == Enum.UserInputType.MouseButton1 or
                            Input.UserInputType == Enum.UserInputType.Touch
                     then
                        Dragging = true
                        MousePos = Input.Position
                        FramePos = Main.Position

                        Input.Changed:Connect(
                            function()
                                if Input.UserInputState == Enum.UserInputState.End then
                                    Dragging = false
                                end
                            end
                        )
                    end
                end
            )

            DragPoint.InputChanged:Connect(
                function(Input)
                    if
                        Input.UserInputType == Enum.UserInputType.MouseMovement or
                            Input.UserInputType == Enum.UserInputType.Touch
                     then
                        DragInput = Input
                    end
                end
            )

            UserInputService.InputChanged:Connect(
                function(Input)
                    if Input == DragInput and Dragging then
                        local Delta = Input.Position - MousePos
                        TweenService:Create(
                            Main,
                            TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                            {
                                Position = UDim2.new(
                                    FramePos.X.Scale,
                                    FramePos.X.Offset + Delta.X,
                                    FramePos.Y.Scale,
                                    FramePos.Y.Offset + Delta.Y
                                )
                            }
                        ):Play()
                    end
                end
            )
        end
    )
end

local function MakeDrag(Instance)
    SetProps(Instance, {
        Active = true,
        AutoButtonColor = false
    })

    AddDraggingFunctionality(Instance, Instance)

    return Instance
end

local function VerifyTheme(Theme)
	for name,_ in pairs(splib.Themes) do
		if name == Theme then
			return true
		end
	end
end

local function SaveJson(FileName, save)
	if writefile then
		local json = HttpService:JSONEncode(save)
		writefile(FileName, json)
	end
end

local Theme = splib.Themes[splib.Save.Theme]

local function AddEle(Name, Func)
	splib.Elements[Name] = Func
end

local function Make(Ele, Instance, props, ...)
	local Element = splib.Elements[Ele](Instance, props, ...)
	return Element
end

AddEle("Corner", function(parent, CornerRadius)
	local New = SetProps(Create("UICorner", parent, {
		CornerRadius = CornerRadius or UDim.new(0, 7)
	}), props)
	return New
end)

AddEle("Stroke", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("UIStroke", parent, {
		Color = args[1] or Theme["Color Stroke"],
		Thickness = args[2] or 1,
		ApplyStrokeMode = "Border"
	}), props), "Stroke")
	return New
end)

AddEle("Button", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("TextButton", parent, {
		Text = "",
		Size = UDim2.fromScale(1, 1),
		BackgroundColor3 = Theme["Color Hub 2"],
		AutoButtonColor = false
	}), props), "Frame")
	
	New.MouseEnter:Connect(function()
		New.BackgroundTransparency = 0.4
	end)
	New.MouseLeave:Connect(function()
		New.BackgroundTransparency = 0
	end)
	if args[1] then
		New.Activated:Connect(args[1])
	end
	return New
end)

AddEle("Gradient", function(parent, props, ...)
	local args = {...}
	local New = InsertTheme(SetProps(Create("UIGradient", parent, {
		Color = Theme["Color Hub 1"]
	}), props), "Gradient")
	return New
end)

local function ButtonFrame(parent, Title, Description, HolderSize, isBind)
    if type(HolderSize) == "boolean" then
        isBind, HolderSize = HolderSize, nil
    end

    local Frame = Make("Button", parent, {
        Size = UDim2.new(1, 0, 0, 29),
        AutomaticSize = Enum.AutomaticSize.Y,
        TextWrapped = true,
        Name = "Option"
    })
    Make("Corner", Frame, UDim.new(0, 10))

    local TitleL = InsertTheme(Create("TextLabel", Frame, {
        Font = Enum.Font.GothamMedium,
        TextColor3 = Theme["Color Text"],
        AutomaticSize = "Y",
        Size = UDim2.new(1, -80, 0, 0),
        Position = UDim2.new(0, 0, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundTransparency = 1,
        TextSize = 10,
        TextXAlignment = "Left",
        TextTruncate = "AtEnd",
        Text = Title or "",
        RichText = true
    }), "Text")

    local DescL = InsertTheme(Create("TextLabel", Frame, {
        Font = Enum.Font.Gotham,
        TextColor3 = Theme["Color Dark Text"],
        AutomaticSize = "Y",
        Size = UDim2.new(1, -80, 0, 0),
        Position = UDim2.new(0, 12, 0, 15),
        BackgroundTransparency = 1,
        TextWrapped = true,
        TextSize = 8,
        TextXAlignment = "Left",
        Text = Description or "",
        RichText = true
    }), "DarkText")

    local LabelHolder = Create("Frame", Frame, {
        AutomaticSize = "Y",
        BackgroundTransparency = 1,
        Size = HolderSize or UDim2.new(1, -80, 0, 25),
        Position = UDim2.new(0, 10, 0),
        AnchorPoint = Vector2.new(0, 0)
    }, {
        Create("UIListLayout", {
            SortOrder = "LayoutOrder",
            VerticalAlignment = "Center",
            Padding = UDim.new(0, 2)
        }),
        Create("UIPadding", {
            PaddingTop    = UDim.new(0, 5),
            PaddingBottom = UDim.new(0, 5)
        }),
        TitleL,
        DescL,
    })

    local bindBox
    if isBind then
        bindBox = Create("TextButton", Frame, {
            Name               = "BindBox",
            Text               = "",
            Font               = Enum.Font.GothamBold,
            TextSize           = 14,
            TextColor3         = Theme["Color Text"],
            Size               = UDim2.new(0, 45, 0, 24),
            Position           = UDim2.new(1, -10, 0, 1.9),
            AnchorPoint        = Vector2.new(1, 0),
            BackgroundColor3   = Color3.fromRGB(0,0,0),
            BackgroundTransparency = 0,
        })
InsertTheme(bindBox, "Text")
InsertTheme(bindBox, "Stroke")
Make("Corner", bindBox, UDim.new(0.25, 0))

        Frame.AutomaticSize = Enum.AutomaticSize.None
        Frame.Size = UDim2.new(1, 0, 0, 30)

        bindBox:SetAttribute("Ready", false)
        bindBox:SetAttribute("Displayed", false)

        bindBox:GetPropertyChangedSignal("Text"):Connect(function()
            if not bindBox:GetAttribute("Ready") then
                return
            end

            if not bindBox:GetAttribute("Displayed") then
                bindBox:SetAttribute("Displayed", true)
                bindBox.Size = UDim2.new(0, bindBox.TextBounds.X + 8, 0, 24)
                return
            end

            task.defer(function()
                local newWidth = bindBox.TextBounds.X + 8
                local tween = TweenService:Create(
                    bindBox,
                    TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
                    {Size = UDim2.new(0, newWidth, 0, 24)}
                )
                tween:Play()
            end)
        end)
    end
    local Label = {}
    function Label:SetTitle(nt)
        if type(nt)=="string" and nt:match("%S") then
            TitleL.Text = nt
        end
    end
    function Label:SetDesc(nd)
        if type(nd)=="string" and nd:match("%S") then
            DescL.Visible, DescL.Text = true, nd
            LabelHolder.Position, LabelHolder.AnchorPoint = UDim2.new(0,10,0), Vector2.new(0,0)
        else
            DescL.Visible, DescL.Text = false, ""
            LabelHolder.Position, LabelHolder.AnchorPoint = UDim2.new(0,10,0.5), Vector2.new(0,0.5)
        end
    end
    Label:SetTitle(Title)
    Label:SetDesc(Description)

    return Frame, Label, bindBox, ColorBox
end
local function GetColor(Instance)
	if not Instance then return nil end

	if Instance:IsA("TextLabel") or Instance:IsA("TextBox") or Instance:IsA("TextButton") then
		return "TextColor3"
	elseif Instance:IsA("Frame") or Instance:IsA("ScrollingFrame") then
		return "BackgroundColor3"
	elseif Instance:IsA("ImageLabel") then
		return "ImageColor3"
	elseif Instance:IsA("UIStroke") then
		return "Color"
	elseif Instance:IsA("UIGradient") then
		return "Color"
	end

	return nil
end

-- /////////// --
function splib:GetIcon(index)
	if type(index) ~= "string" or index:find("rbxassetid://") or #index == 0 then
		return index
	end
	
	local firstMatch = nil
	index = string.lower(index):gsub("lucide", ""):gsub("-", "")
	
	if self.Icons[index] then
	  return self.Icons[index]
	end
	
	for Name, Icon in self.Icons do
		if Name == index then
			return Icon
		elseif not firstMatch and Name:find(index, 1, true) then
			firstMatch = Icon
		end
	end
	
	return firstMatch or index
end

function splib:SetTheme(NewTheme)
	if not VerifyTheme(NewTheme) then return end
	
	splib.Save.Theme = NewTheme
	SaveJson("sp library.json", splib.Save)
	Theme = splib.Themes[NewTheme]
	
	Connection:FireConnection("ThemeChanged", NewTheme)
	table.foreach(splib.Instances, function(_,Val)
		if Val.Type == "Gradient" then
			Val.Instance.Color = Theme["Color Hub 1"]
		elseif Val.Type == "Frame" then
			Val.Instance.BackgroundColor3 = Theme["Color Hub 2"]
		elseif Val.Type == "Stroke" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Stroke"]
		elseif Val.Type == "Theme" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
		elseif Val.Type == "Text" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Text"]
		elseif Val.Type == "DarkText" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Dark Text"]
		elseif Val.Type == "ScrollBar" then
			Val.Instance[GetColor(Val.Instance)] = Theme["Color Theme"]
		end
	end)
end

function splib:SetScale(NewScale)
	NewScale = ViewportSize.Y / math.clamp(NewScale, 300, 2000)
	UIScale, ScreenGui.Scale.Scale = NewScale, NewScale
end

local SaveChangesEnabled = true

local ToggleEnabled
local EnableSetting
local RainbowMainFrameDefault
local RainbowTitleDefault
local RainbowSubTitleDefault

function splib:MakeWindow(Configs)

    ToggleEnabled = (Configs.Toggle == nil and Configs.EnableToggle == nil) 
       or (Configs.Toggle == true or Configs.EnableToggle == true)
    EnableSetting = (Configs.Setting == nil and Configs.EnableSetting == nil)
       or (Configs.Setting == true or Configs.EnableSetting == true)
    local ToggleIcon = tostring(Configs.ToggleIcon or "rbxassetid://83114982417764")
    local WIcon = Configs[4] or Configs.Icon or Configs.ScriptIcon
    local WTitle = Configs[1] or Configs.Name or Configs.Title or "SP Lib v2"
    local WMiniText = Configs[2] or Configs.SubTitle or Configs.SubName or "by : SP Hub"
    RainbowMainFrameDefault = Configs.RainbowMainFrameDefault or Configs.RainbowMainFrame or false
    RainbowTitleDefault = Configs.RainbowTitleDefault or Configs.RainbowTitle or false
    RainbowSubTitleDefault = Configs.RainbowSubTitleDefault or Configs.RainbowSubTitle or false


function splib:MakeWindow(Configs)

    local WTitle = Configs[1] or Configs.Name or Configs.Title or "SP Lib v2"
    local WMiniText = Configs[2] or Configs.SubTitle or Configs.SubName or "by : SP Hub"
    local WIcon = Configs[4] or Configs.Icon or Configs.ScriptIcon

    local SaveConfig = Configs.SaveFolder or Configs.SaveConfig or WTitle

    RainbowMainFrameDefault = Configs.RainbowMainFrameDefault or Configs.RainbowMainFrame or false
    RainbowTitleDefault = Configs.RainbowTitleDefault or Configs.RainbowTitle or false
    RainbowSubTitleDefault = Configs.RainbowSubTitleDefault or Configs.RainbowSubTitle or false
    
    EnableSetting = (Configs.Setting == nil and Configs.EnableSetting == nil)
       or (Configs.Setting == true or Configs.EnableSetting == true)

    ToggleEnabled = (Configs.Toggle == nil and Configs.EnableToggle == nil)
       or (Configs.Toggle == true or Configs.EnableToggle == true)
    local ToggleIcon = tostring(Configs.ToggleIcon or "rbxassetid://83114982417764")
    local HidePremium = Configs.HidePremium == true
    local Callback = Configs.Callback or function() end
    local CloseCallback = Configs.CloseCallback or false

    shouldClearToggles = (Configs.CloseCallback == true)


    if Configs.IntroEnabled == nil then
        Configs.IntroEnabled = true
    end

    Configs.IntroText = Configs.IntroText or "SP Lib v2"
    Configs.IntroIcon = Configs.IntroIcon or "rbxassetid://8834748103"

    local function LoadSequence()
        MainWindow.Visible = false
        local LoadSequenceLogo = SetProps(
            MakeElement("Image", Configs.IntroIcon),
            {
                Parent = ScreenGui,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 0, 0.4, 0),
                Size = UDim2.new(0, 28, 0, 28),
                ImageColor3 = Color3.fromRGB(255, 255, 255),
                ImageTransparency = 1
            }
        )
        local LoadSequenceText = SetProps(
            MakeElement("Label", Configs.IntroText, 14),
            {
                Parent = ScreenGui,
                Size = UDim2.new(1, 0, 1, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.new(0.5, 19, 0.5, 0),
                TextXAlignment = Enum.TextXAlignment.Center,
                Font = Enum.Font.GothamBold,
                TextTransparency = 1
            }
        )
        TweenService:Create(LoadSequenceLogo, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
        wait(0.8)
        TweenService:Create(LoadSequenceLogo, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -(LoadSequenceText.TextBounds.X / 2), 0.5, 0)}):Play()
        wait(0.3)
        TweenService:Create(LoadSequenceText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
        wait(2)
        TweenService:Create(LoadSequenceText, TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
        MainWindow.Visible = true
        LoadSequenceLogo:Destroy()
        LoadSequenceText:Destroy()
    end

    if Configs.IntroEnabled then
        LoadSequence()
    end

    local function LoadFile()
        local File = Settings.ScriptFile
        if type(File) ~= "string" then return end
        if not readfile or not isfile then return end
        if pcall(isfile, File) then
            local raw = readfile(File)
            local ok, t = pcall(HttpService.JSONDecode, HttpService, raw)
            if ok and type(t)=="table" then
                Flags = t
            end
        end
    end; LoadFile()

   
    if HidePremium then
        for _, el in ipairs(Window:GetPremiumElements()) do
            el.Visible = false
        end
    end

    local function saveSettings()
        if not SaveConfig then return end
        if not isfolder(Settings.ConfigFolder) then
            makefolder(Settings.ConfigFolder)
        end
        local filePath = Settings.ConfigFolder.."/config.json"
        writefile(filePath, HttpService:JSONEncode(Flags))
    end
    Window.SomeToggle.Changed:Connect(function(val)
        Flags.SomeToggle = val
        saveSettings()
    end)

    if SaveConfig then
        Window.CloseButton.MouseButton1Click:Connect(function()
            saveSettings()
        end)
    end

    return Window
end
	
	local UISizeX, UISizeY = unpack(splib.Save.UISize)
local MainFrame = InsertTheme(Create("ImageButton", ScreenGui, {
    Size = UDim2.fromOffset(UISizeX * 0.8, UISizeY * 0.8),
    Position = UDim2.new(0.5, -UISizeX * 0.4, 0.5, -UISizeY * 0.4),
    BackgroundTransparency = 0,
    Name = "Hub",
    Visible = true
}), "Main")

MakeDrag(MainFrame)
Make("Gradient", MainFrame, {
    Rotation = 45
})

local originalMainPos = MainFrame.Position

local function isHalfOutside(frame)
    local absPos = frame.AbsolutePosition
    local absSize = frame.AbsoluteSize
    local screenSize = workspace.CurrentCamera.ViewportSize

    local halfW = absSize.X / 2
    local halfH = absSize.Y / 2

    if absPos.X + absSize.X < halfW then
        return true
    elseif absPos.Y + absSize.Y < halfH then
        return true
    elseif absPos.X > screenSize.X - halfW then
        return true
    elseif absPos.Y > screenSize.Y - halfH then
        return true
    end
    return false
end

task.spawn(function()
    while task.wait(1) do
        if isHalfOutside(MainFrame) then
            local leftTime = 2
            while leftTime > 0 do
                task.wait(1)
                if not isHalfOutside(MainFrame) then
                    break
                end
                leftTime -= 1
            end
            if isHalfOutside(MainFrame) then
                TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                    Position = originalMainPos
                }):Play()
            end
        end
    end
end)

local MainCorner = Make("Corner", MainFrame, UDim.new(0, 10))


	local Components = Create("Folder", MainFrame, {
		Name = "Components"
	})
	
	local DropdownHolder = Create("Folder", ScreenGui, {
		Name = "Dropdown"
	})

    local CustomColorHolder = Create("Folder", ScreenGui, {
	    Name = "CustomColor"
    })
	
	local TopBar = Create("Frame", Components, {
		Size = UDim2.new(1, 0, 0, 28),
		BackgroundTransparency = 1,
		Name = "Top Bar"
	})

    local titlePosX = 15

    if WIcon and WIcon ~= "" then
        Create("ImageLabel", TopBar, {
            Name = "TitleIcon",
            Position = UDim2.new(0, 10, 0.5),
            AnchorPoint = Vector2.new(0, 0.5),
            Size = UDim2.new(0, 22, 0, 22),
            BackgroundTransparency = 1,
            ScaleType = Enum.ScaleType.Fit,
            Image = WIcon,
        })
        titlePosX = 37
    end

    local Title = InsertTheme(Create("TextLabel", TopBar, {
        Position = UDim2.new(0, titlePosX, 0.5),
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = "XY",
        Text = WTitle,
        TextXAlignment = "Left",
        TextSize = 12,
        TextColor3 = Theme["Color Text"],
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBlack,
        Name = "Title"
    }, {
        InsertTheme(Create("TextLabel", {
            Size = UDim2.fromScale(0, 1),
            AutomaticSize = "X",
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(1, 5, 0.9),
            Text = WMiniText,
            TextColor3 = Theme["Color Dark Text"],
            BackgroundTransparency = 1,
            TextXAlignment = "Left",
            TextYAlignment = "Bottom",
            TextSize = 8,
            Font = Enum.Font.Gotham,
            Name = "SubTitle"
        }), "DarkText")
    }), "Text")

	local MainScroll = InsertTheme(Create("ScrollingFrame", Components, {
		Size = UDim2.new(0, splib.Save.TabSize, 1, -TopBar.Size.Y.Offset),
		ScrollBarImageColor3 = Theme["Color Theme"],
		Position = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(0, 1),
		ScrollBarThickness = 1.5,
		BackgroundTransparency = 1,
		ScrollBarImageTransparency = 0.2,
		CanvasSize = UDim2.new(),
		AutomaticCanvasSize = "Y",
		ScrollingDirection = "Y",
		BorderSizePixel = 0,
		Name = "Tab Scroll"
	}, {
		Create("UIPadding", {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
			PaddingBottom = UDim.new(0, 10)
		}), Create("UIListLayout", {
			Padding = UDim.new(0, 5)
		})
	}), "ScrollBar")

--[[
 local SearchBox = Create("TextBox", MainScroll, {
    Size = UDim2.new(1, 0, 0, 24),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = Color3.fromRGB(13, 13, 13),
    PlaceholderText = "Search",
    Text = "",
    TextXAlignment = Enum.TextXAlignment.Left,
    TextTruncate = Enum.TextTruncate.AtEnd,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    ClearTextOnFocus = false,
    Font = Enum.Font.Gotham,
    TextSize = 10,
    TextWrapped = false,
})
Make("Corner", SearchBox)
]]

	local Containers = Create("Frame", Components, {
		Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Name = "Containers"
	})
	
local function TweenTransparency(obj, target)
	if obj and obj:IsA("GuiObject") then
		TweenService:Create(obj, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			BackgroundTransparency = target
		}):Play()
	end
end

local ControlSize1, ControlSize2 = MakeDrag(Create("ImageButton", MainFrame, {
	Size = UDim2.new(0, 10, 0, 10),
	Position = MainFrame.Size,
	Active = true,
    Image = "rbxassetid://6153965696",
	AnchorPoint = Vector2.new(0.8, 0.8),
	BackgroundTransparency = 1,
	Name = "Control Hub Size"
})), MakeDrag(Create("ImageButton", MainFrame, {
	Size = UDim2.new(0, 15, 1, -20),
	Position = UDim2.new(0, MainScroll.Size.X.Offset, 1, 0),
	AnchorPoint = Vector2.new(0.5, 1),
	Active = true,
	BackgroundTransparency = 1,
	Name = "Control Tab Size"
}))
Make("Corner", ControlSize1, UDim.new(0.10, 0))
Make("Corner", ControlSize2)

local function ControlSize()
    local Pos1, Pos2 = ControlSize1.Position, ControlSize2.Position
    
    local minX, maxX
    local minY, maxY

    if isPC then
        minX, maxX = 350, 550
        minY, maxY = 300, 400
    else
        minX, maxX = 300, 400
        minY, maxY = 200, 260
    end

    ControlSize1.Position = UDim2.fromOffset(
        math.clamp(Pos1.X.Offset, minX, maxX),
        math.clamp(Pos1.Y.Offset, minY, maxY)
    )

    local minClamp = 50
    ControlSize2.Position = UDim2.new(0, math.clamp(Pos2.X.Offset, minClamp, 100), 1, 0)

    MainScroll.Size = UDim2.new(0, ControlSize2.Position.X.Offset, 1, -TopBar.Size.Y.Offset)
    Containers.Size = UDim2.new(1, -MainScroll.Size.X.Offset, 1, -TopBar.Size.Y.Offset)
    MainFrame.Size = ControlSize1.Position
end

local function SetupDragTransparency(control)
	control.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			TweenTransparency(control, 0.5)
		end
	end)

	control.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			TweenTransparency(control, 1)
		end
	end)
end

SetupDragTransparency(ControlSize1)
SetupDragTransparency(ControlSize2)

ControlSize1:GetPropertyChangedSignal("Position"):Connect(ControlSize)
ControlSize2:GetPropertyChangedSignal("Position"):Connect(ControlSize)

local hoverConnections = {}
local originalSizeX = 30
local expandedSizeX = 160
local userSizeX = originalSizeX
local minClamp = 50

local function tweenControlSizeX(toX)
    local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local goal = { Position = UDim2.new(0, toX, 1, 0) }
    local tween = TweenService:Create(ControlSize2, tweenInfo, goal)
    tween:Play()
    tween.Completed:Connect(function()
        userSizeX = toX
        ControlSize()
    end)
end

local function enableSidebarHover()
    for _, conn in ipairs(hoverConnections) do
        if conn.Connected then conn:Disconnect() end
    end
    hoverConnections = {}

    table.insert(hoverConnections,
        MainScroll.MouseEnter:Connect(function()
            tweenControlSizeX(expandedSizeX)
        end)
    )
    table.insert(hoverConnections,
        MainScroll.MouseLeave:Connect(function()
            tweenControlSizeX(minClamp)
        end)
    )
end

local function disableSidebarHover()
    for _, conn in ipairs(hoverConnections) do
        if conn.Connected then conn:Disconnect() end
    end
    hoverConnections = {}

    tweenControlSizeX(expandedSizeX)
end

if isPC then
    ControlSize2.Position = UDim2.new(0, originalSizeX, 1, 0)
    ControlSize()

    if splib.Flags["sidebarHover"] and splib.Flags["sidebarHover"].Value then
        enableSidebarHover()
    end
end

ConnectSave(ControlSize1, function()
    if not Minimized then
        splib.Save.UISize = {MainFrame.Size.X.Offset, MainFrame.Size.Y.Offset}
        SaveJson("sp library.json", splib.Save)
    end
end)

ConnectSave(ControlSize2, function()
    splib.Save.TabSize = MainScroll.Size.X.Offset
    SaveJson("sp library.json", splib.Save)
end)

	local ButtonsFolder = Create("Folder", TopBar, {
		Name = "Buttons"
	})
	
	local CloseButton = Create("ImageButton", {
		Size = UDim2.new(0, 14, 0, 14),
		Position = UDim2.new(1, -10, 0.5),
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundTransparency = 1,
		Image = "rbxassetid://10747384394",
		AutoButtonColor = false,
		Name = "Close"
	})

local SettingButton = SetProps(CloseButton:Clone(), {
    Position = UDim2.new(1, -60, 0.5),
    Size = UDim2.new(0, 14, 0, 14),
    Image = "rbxassetid://11385220704",
    Name = "Settings",
    Visible = EnableSetting
})

	local MinimizeButton = SetProps(CloseButton:Clone(), {
		Position = UDim2.new(1, -35, 0.5),
		Image = "rbxassetid://10734896206",
		Name = "Minimize"
	})
	
	SetChildren(ButtonsFolder, {
		CloseButton,
		MinimizeButton,
        SettingButton
	})
	
	local Minimized, SaveSize, WaitClick
	local Window, FirstTab = {}, false

local shouldClearToggles = Configs.CloseCallback == true

local function CloseUI()
    for _, conn in ipairs(bindConnections) do
        if typeof(conn) == "RBXScriptConnection" and conn.Connected then
            conn:Disconnect()
        end
    end
    table.clear(bindConnections)

    if splib.ClearAllBinds then
        splib:ClearAllBinds()
    end
    if shouldClearToggles and splib.ClearAllToggles then
        splib:ClearAllToggles()
    end

    ScreenGui:Destroy()
end

function splib:Destroy()
CloseUI()
end

CloseButton.Activated:Connect(CloseUI)

SettingButton.MouseButton1Click:Connect(function()
	for _, container in ipairs(ContainerList) do
		container.Visible = false
	end
	SettingTab.Visible = true
end)

	function Window:MinimizeBtn()
		if WaitClick then return end
		WaitClick = true
		
		if Minimized then
			MinimizeButton.Image = "rbxassetid://10734896206"
			CreateTween({MainFrame, "Size", SaveSize, 0.25, true})
			ControlSize1.Visible = true
			ControlSize2.Visible = true
			Minimized = false
		else
			MinimizeButton.Image = "rbxassetid://10734924532"
			SaveSize = MainFrame.Size
			ControlSize1.Visible = false
			ControlSize2.Visible = false
			CreateTween({MainFrame, "Size", UDim2.fromOffset(MainFrame.Size.X.Offset, 28), 0.25, true})
			Minimized = true
		end
		
		WaitClick = false
	end
	function Window:Minimize()
		MainFrame.Visible = not MainFrame.Visible
	end
	function Window:AddMinimizeButton(Configs)
		local Button = MakeDrag(Create("ImageButton", ScreenGui, {
			Size = UDim2.fromOffset(35, 35),
			Position = UDim2.fromScale(0.15, 0.15),
			BackgroundTransparency = 1,
			BackgroundColor3 = Theme["Color Hub 2"],
			AutoButtonColor = false
		}))
		
		local Stroke, Corner
		if Configs.Corner then
			Corner = Make("Corner", Button)
			SetProps(Corner, Configs.Corner)
		end
		if Configs.Stroke then
			Stroke = Make("Stroke", Button)
			SetProps(Stroke, Configs.Corner)
		end
		
		SetProps(Button, Configs.Button)
		Button.Activated:Connect(Window.Minimize)
		
		return {
			Stroke = Stroke,
			Corner = Corner,
			Button = Button
		}
	end

local tweenInfoHideUI = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local OriginalPos = MainFrame.Position
local UIVisibleed = true

local function ToggleUI()
    UIHidden = not UIHidden

    if UIHidden then
        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {
                Position = MainFrame.Position + UDim2.new(0, 0, 0.1, 0),
            }
        ):Play()

        wait(0.1)
        MainFrame.Visible = false
    else
        MainFrame.Visible = true
        TweenService:Create(
            MainFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {
                Position = MainFrame.Position - UDim2.new(0, 0, 0.1, 0),
            }
        ):Play()
    end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        ToggleUI()
    end
end)

local boundaryConnections = {}
local originalMainPos = MainFrame.Position

local T = Instance.new("ImageButton", ScreenGui)
local sizeValue = isPC and 50 or 38
T.Size = UDim2.new(0, sizeValue, 0, sizeValue)
T.Visible = ToggleEnabled
local xPos = isPC and 0.10 or (isMobile and 0.10 or 0.10)
T.Position = UDim2.new(xPos, 0, 0.1, 0)
T.Image = tostring(ToggleIcon)
T.Active = true 
local Corner = Instance.new("UICorner", T)
Corner.CornerRadius = UDim.new(0, 8)

local isHolding    = false
local didLongPress = false
local holdTween    = nil
local startPos     = nil
local moved        = false
local propConn     = nil
local holdTask     = nil
local holdDuration = 1
local normalSizere = UDim2.new(0, sizeValue, 0, sizeValue)

local holdBar = Instance.new("Frame", T)
holdBar.AnchorPoint = Vector2.new(0, 1)
holdBar.Position  = UDim2.new(0, 0.92, 0.92, 0)
holdBar.Size = UDim2.new(0, 0, 0, 4)
holdBar.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
holdBar.BorderSizePixel = 0
local HoCorner = Instance.new("UICorner", holdBar)
HoCorner.CornerRadius = UDim.new(0, 14)


local originalPosition = T.Position

local function doLongPress()
    TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
        Position = originalMainPos
    }):Play()
end

AddDraggingFunctionality(T, T)

local function checkBounds()
  local absPos  = T.AbsolutePosition
  local absSize = T.AbsoluteSize
  local screen  = workspace.CurrentCamera.ViewportSize
  if absPos.X < 0
  or absPos.Y < 0
  or absPos.X + absSize.X > screen.X
  or absPos.Y + absSize.Y > screen.Y then
    TweenService:Create(T, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
      Position = originalPosition
    }):Play()
  end
end

function enableBoundaryProtection()
  disableBoundaryProtection()
  boundaryConnections[#boundaryConnections+1] = T.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
      task.delay(0.25, checkBounds)
    end
  end)
end

function disableBoundaryProtection()
  for _, conn in ipairs(boundaryConnections) do
    if conn.Connected then conn:Disconnect() end
  end
  boundaryConnections = {}
end

T.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        isHolding = true
        didLongPress = false

        local startPos = T.Position
        local propConn
        local holdTween

        propConn = T:GetPropertyChangedSignal("Position"):Connect(function()
            if T.Position ~= startPos then
                if holdTween then
                    holdTween:Cancel()
                    holdTween = nil
                end
                TweenService:Create(holdBar, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
                    Size = UDim2.new(0, 0, 0, 4)
                }):Play()
                propConn:Disconnect()
            end
        end)

        holdBar.Size = UDim2.new(0, 0, 0, 4)
        holdTween = TweenService:Create(holdBar, TweenInfo.new(holdDuration, Enum.EasingStyle.Linear), {
            Size = UDim2.new(1, 0, 0, 4)
        })
        holdTween:Play()

        holdTween.Completed:Connect(function()
            if isHolding and T.Position == startPos then
                didLongPress = true
                doLongPress()
            end
        end)
    end
end)

T.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        isHolding = false

        if holdTween then
            holdTween:Cancel()
            holdTween = nil
        end
        TweenService:Create(holdBar, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, 0, 0, 4)
        }):Play()

        if propConn then
            propConn:Disconnect()
            propConn = nil
        end
    end
end)

T.MouseButton1Click:Connect(function()
    if didLongPress then
        didLongPress = false
        return
    end
    ToggleUI()
end)

local normalSize = UDim2.new(0, sizeValue, 0, sizeValue)
local hoverSize = UDim2.new(0, sizeValue + 6, 0, sizeValue + 10)
local tweenInfo2 = TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local function getCenteredPosition(originalSize, newSize, originalPosition)
    local xOffset = (newSize.X.Offset - originalSize.X.Offset) / 2
    local yOffset = (newSize.Y.Offset - originalSize.Y.Offset) / 2
    return UDim2.new(originalPosition.X.Scale, originalPosition.X.Offset - xOffset, originalPosition.Y.Scale, originalPosition.Y.Offset - yOffset)
end

T.MouseEnter:Connect(function()
    local hoverPosition = getCenteredPosition(normalSize, hoverSize, T.Position)
    TweenService:Create(T, tweenInfo2, {Size = hoverSize, Position = hoverPosition}):Play()
end)

T.MouseLeave:Connect(function()
    local normalPosition = getCenteredPosition(hoverSize, normalSize, T.Position)
    TweenService:Create(T, tweenInfo2, {Size = normalSize, Position = normalPosition}):Play()
end)

T.MouseButton1Click:Connect(function()
    local growTween = TweenService:Create(T, tweenInfo2, {Size = hoverSize})
    growTween:Play()

    local shineIn = TweenService:Create(T, TweenInfo.new(0.1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0.6})
    local shineOut = TweenService:Create(T, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0})

    shineIn:Play()
    shineIn.Completed:Wait()
    shineOut:Play()
end)

	function Window:Set(Val1, Val2)
		if type(Val1) == "string" and type(Val2) == "string" then
			Title.Text = Val1
			Title.SubTitle.Text = Val2
		elseif type(Val1) == "string" then
			Title.Text = Val1
		end
	end
	function Window:Dialog(Configs)
		if MainFrame:FindFirstChild("Dialog") then return end
		if Minimized then
			Window:MinimizeBtn()
		end
		
		local DTitle = Configs[1] or Configs.Title or "Dialog"
		local DText = Configs[2] or Configs.Text or "This is a Dialog"
		local DOptions = Configs[3] or Configs.Options or {}
		
		local Frame = Create("Frame", {
			Active = true,
			Size = UDim2.fromOffset(250 * 1.08, 150 * 1.08),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			InsertTheme(Create("TextLabel", {
				Font = Enum.Font.GothamBold,
				Size = UDim2.new(1, 0, 0, 20),
				Text = DTitle,
				TextXAlignment = "Left",
				TextColor3 = Theme["Color Text"],
				TextSize = 15,
				Position = UDim2.fromOffset(15, 5),
				BackgroundTransparency = 1
			}), "Text"),
			InsertTheme(Create("TextLabel", {
				Font = Enum.Font.GothamMedium,
				Size = UDim2.new(1, -25),
				AutomaticSize = "Y",
				Text = DText,
				TextXAlignment = "Left",
				TextColor3 = Theme["Color Dark Text"],
				TextSize = 12,
				Position = UDim2.fromOffset(15, 25),
				BackgroundTransparency = 1,
				TextWrapped = true
			}), "DarkText")
		})Make("Gradient", Frame, {Rotation = 270})Make("Corner", Frame)
		
		local ButtonsHolder = Create("Frame", Frame, {
			Size = UDim2.fromScale(1, 0.35),
			Position = UDim2.fromScale(0, 1),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundColor3 = Theme["Color Hub 2"],
			BackgroundTransparency = 1
		}, {
			Create("UIListLayout", {
				Padding = UDim.new(0, 10),
				VerticalAlignment = "Center",
				FillDirection = "Horizontal",
				HorizontalAlignment = "Center"
			})
		})
		
		local Screen = InsertTheme(Create("Frame", MainFrame, {
			BackgroundTransparency = 0.6,
			Active = true,
			BackgroundColor3 = Theme["Color Hub 2"],
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme["Color Stroke"],
			Name = "Dialog"
		}), "Stroke")
		
		MainCorner:Clone().Parent = Screen
		Frame.Parent = Screen
		CreateTween({Frame, "Size", UDim2.fromOffset(250, 150), 0.2})
		CreateTween({Frame, "Transparency", 0, 0.15})
		CreateTween({Screen, "Transparency", 0.3, 0.15})
		
		local ButtonCount, Dialog = 1, {}
		function Dialog:Button(Configs)
			local Name = Configs[1] or Configs.Name or Configs.Title or ""
			local Callback = Configs[2] or Configs.Callback or function()end
			
			ButtonCount = ButtonCount + 1
			local Button = Make("Button", ButtonsHolder)
			Make("Corner", Button)
			SetProps(Button, {
				Text = Name,
				Font = Enum.Font.GothamBold,
				TextColor3 = Theme["Color Text"],
				TextSize = 12
			})
			
			for _,Button in pairs(ButtonsHolder:GetChildren()) do
				if Button:IsA("TextButton") then
					Button.Size = UDim2.new(1 / ButtonCount, -(((ButtonCount - 1) * 20) / ButtonCount), 0, 32) -- Fluent Library :)
				end
			end
			Button.Activated:Connect(Dialog.Close)
			Button.Activated:Connect(Callback)
		end
		function Dialog:Close()
			CreateTween({Frame, "Size", UDim2.fromOffset(250 * 1.08, 150 * 1.08), 0.2})
			CreateTween({Screen, "Transparency", 1, 0.15})
			CreateTween({Frame, "Transparency", 1, 0.15, true})
			Screen:Destroy()
		end
		table.foreach(DOptions, function(_,Button)
			Dialog:Button(Button)
		end)
		return Dialog
	end
	function Window:SelectTab(TabSelect)
		if type(TabSelect) == "number" then
			splib.Tabs[TabSelect].func:Enable()
		else
			for _,Tab in pairs(splib.Tabs) do
				if Tab.Cont == TabSelect.Cont then
					Tab.func:Enable()
				end
			end
		end
	end
    local ContainerList = {}
function Window:MakeTab(paste, Configs)
		if type(paste) == "table" then Configs = paste end
		local TName = Configs[1] or Configs.Title or Configs.Name or "Tab!"
		local TIcon = Configs[2] or Configs.Icon or ""
        
    if Configs.IsMobile and not isMobile then
        return nil
    end

    if Configs.IsPC and not isPC then
        return nil
    end
		
		TIcon = splib:GetIcon(TIcon)
		if not TIcon:find("rbxassetid://") or TIcon:gsub("rbxassetid://", ""):len() < 6 then
			TIcon = false
		end
		
		local TabSelect = Make("Button", MainScroll, {
			Size = UDim2.new(1, 0, 0, 24)
		})Make("Corner", TabSelect)
		
		local LabelTitle = InsertTheme(Create("TextLabel", TabSelect, {
			Size = UDim2.new(1, TIcon and -25 or -15, 1),
			Position = UDim2.fromOffset(TIcon and 25 or 15),
			BackgroundTransparency = 1,
			Font = Enum.Font.GothamMedium,
			Text = TName,
			TextColor3 = Theme["Color Text"],
			TextSize = 9,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTransparency = (FirstTab and 0.3) or 0,
			TextTruncate = "AtEnd"
		}), "Text")
		
		local LabelIcon = InsertTheme(Create("ImageLabel", TabSelect, {
			Position = UDim2.new(0, 8, 0.5),
			Size = UDim2.new(0, 13, 0, 13),
			AnchorPoint = Vector2.new(0, 0.5),
			Image = TIcon or "",
			BackgroundTransparency = 1,
			ImageTransparency = (FirstTab and 0.3) or 0
		}), "Text")
		
		local Selected = InsertTheme(Create("Frame", TabSelect, {
			Size = FirstTab and UDim2.new(0, 4, 0, 4) or UDim2.new(0, 4, 0, 13),
			Position = UDim2.new(0, 1, 0.5),
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = Theme["Color Theme"],
			BackgroundTransparency = FirstTab and 1 or 0
		}), "Theme")Make("Corner", Selected, UDim.new(0.5, 0))

local SettingTab = InsertTheme(Create("ScrollingFrame", {
    Size = UDim2.new(1, 0, 1, 0),
    Position = UDim2.new(0, 0, 1),
    AnchorPoint = Vector2.new(0, 1),
    ScrollBarThickness = 1.5,
    BackgroundTransparency = 1,
    ScrollBarImageTransparency = 0.2,
    ScrollBarImageColor3 = Theme["Color Theme"],
    AutomaticCanvasSize = "Y",
    ScrollingDirection = "Y",
    BorderSizePixel = 0,
    CanvasSize = UDim2.new(),
    Name = "SettingsTab"
}, {
    Create("UIPadding", {
        PaddingLeft = UDim.new(0, 10),
        PaddingRight = UDim.new(0, 10),
        PaddingTop = UDim.new(0, 10),
        PaddingBottom = UDim.new(0, 10)
    }),
    Create("UIListLayout", {
        Padding = UDim.new(0, 5)
    })
}), "ScrollBar")

		local Container = InsertTheme(Create("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 1),
			AnchorPoint = Vector2.new(0, 1),
			ScrollBarThickness = 1.5,
			BackgroundTransparency = 1,
			ScrollBarImageTransparency = 0.2,
			ScrollBarImageColor3 = Theme["Color Theme"],
			AutomaticCanvasSize = "Y",
			ScrollingDirection = "Y",
			BorderSizePixel = 0,
			CanvasSize = UDim2.new(),
			Name = ("Container %i [ %s ]"):format(#ContainerList + 1, TName)
		}, {
			Create("UIPadding", {
				PaddingLeft = UDim.new(0, 10),
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 10),
				PaddingBottom = UDim.new(0, 10)
			}), Create("UIListLayout", {
				Padding = UDim.new(0, 5)
			})
		}), "ScrollBar")

		table.insert(ContainerList, SettingTab)
		table.insert(ContainerList, Container)
		
		if not FirstTab then Container.Parent = Containers end
		
		local Tab = { Enabled = (FirstTab == false) }
		
local function Tabs()
    if Container.Parent then return end
    for _,Frame in pairs(ContainerList) do
        if Frame:IsA("ScrollingFrame") and Frame ~= Container then
            Frame.Parent = nil
        end
    end
    Container.Parent = Containers
    Container.Size = UDim2.new(1, 0, 1, 150)
    table.foreach(splib.Tabs, function(_,Tab)
        if Tab.Cont ~= Container then
            Tab.func:Disable()
        end
    end)
    Tab.Enabled = true
    CreateTween({Container, "Size", UDim2.new(1, 0, 1, 0), 0.5})
    CreateTween({LabelTitle, "TextTransparency", 0, 0.35})
    CreateTween({LabelIcon, "ImageTransparency", 0, 0.35})
    
    local originalPosition = Selected.Position
    
    local downPosition = UDim2.new(originalPosition.X.Scale, originalPosition.X.Offset, originalPosition.Y.Scale, originalPosition.Y.Offset + 5)
    
    local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenInfo2 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    TweenService:Create(Selected, tweenInfo, { Position = downPosition }):Play()
    
    task.delay(0.1, function()
        TweenService:Create(Selected, tweenInfo2, { Position = originalPosition }):Play()
    end)
    CreateTween({Selected, "Size", UDim2.new(0, 4, 0, 13), 0.50})
    CreateTween({Selected, "BackgroundTransparency", 0, 0.50})
end
		TabSelect.Activated:Connect(Tabs)
		
        FirstTab = true
		table.insert(splib.Tabs, {TabInfo = {Name = TName, Icon = TIcon}, func = Tab, Cont = Container})
		Tab.Cont = Container
		if not table.find(ContainerList, SettingTab) then
    table.insert(ContainerList, SettingTab)
end

local SettingTabHandler = {
    Enabled = false
}

function SettingTabHandler:Enable()
    if SettingTab.Parent then return end
    for _, Frame in pairs(ContainerList) do
        if Frame:IsA("ScrollingFrame") and Frame ~= SettingTab then
            Frame.Parent = nil
        end
    end
    SettingTab.Parent = Containers
    SettingTab.Size = UDim2.new(1, 0, 1, 150)
    table.foreach(splib.Tabs, function(_, tab)
        if tab.Cont ~= SettingTab then
            tab.func:Disable()
        end
    end)

    SettingTabHandler.Enabled = true
    CreateTween({SettingTab, "Size", UDim2.new(1, 0, 1, 0), 0.5})
end

function SettingTabHandler:Disable()
    SettingTabHandler.Enabled = false
    SettingTab.Parent = nil
end

SettingButton.MouseButton1Click:Connect(function()
    SettingTabHandler:Enable()
end)
		function Tab:Disable()
		  self.Enabled = false
			Container.Parent = nil
			CreateTween({LabelTitle, "TextTransparency", 0.3, 0.35})
			CreateTween({LabelIcon, "ImageTransparency", 0.3, 0.35})
			CreateTween({Selected, "Size", UDim2.new(0, 4, 0, 4), 0.50})
			CreateTween({Selected, "BackgroundTransparency", 1, 0.50})
		end
		function Tab:Enable()
			Tabs()
		end
		function Tab:Visible(Bool)
			Funcs:ToggleVisible(TabSelect, Bool)
			Funcs:ToggleParent(Container, Bool, Containers)
		end
		function Tab:Destroy() TabSelect:Destroy() Container:Destroy() end
		function Tab:AddSection(Configs)
			local SectionName = type(Configs) == "string" and Configs or Configs[1] or Configs.Name or Configs.Title or Configs.Section
			
            if Configs.IsMobile and not isMobile then
                return nil
            end

            if Configs.IsPC and not isPC then
                return nil
            end

            local container = Configs.__force_container or Container

			local SectionFrame = Create("Frame", container, {
				Size = UDim2.new(1, 0, 0, 20),
				BackgroundTransparency = 1,
				Name = "Option"
			})
			
			local SectionLabel = InsertTheme(Create("TextLabel", SectionFrame, {
				Font = Enum.Font.GothamBold,
				Text = SectionName,
				TextColor3 = Theme["Color Text"],
				Size = UDim2.new(1, -25, 1, 0),
				Position = UDim2.new(0, 5),
				BackgroundTransparency = 1,
				TextTruncate = "AtEnd",
				TextSize = 14,
				TextXAlignment = "Left"
			}), "Text")
			
			local Section = {}
			table.insert(splib.Options, {type = "Section", Name = SectionName, func = Section})
			function Section:Visible(Bool)
				if Bool == nil then SectionFrame.Visible = not SectionFrame.Visible return end
				SectionFrame.Visible = Bool
			end
			function Section:Destroy()
				SectionFrame:Destroy()
			end
			function Section:Set(New)
				if New then
					SectionLabel.Text = GetStr(New)
				end
			end
			return Section
		end

local function SaveFlagValue(flag, value)
  local filename = "sp lib v2.json"
  local data = {}

  if isfile(filename) then
    local ok, existing = pcall(function()
      return HttpService:JSONDecode(readfile(filename))
    end)
    if ok and type(existing) == "table" then
      data = existing
    end
  end

  data[flag] = value

  local ok, encoded = pcall(function()
    return HttpService:JSONEncode(data)
  end)
  if ok then
    writefile(filename, encoded)
  end
end

local function LoadFlagValue(flag)
    local filename = "sp lib v2.json"
    if not isfile(filename) then
        return nil
    end

    local ok, data = pcall(function()
        return HttpService:JSONDecode(readfile(filename))
    end)
    if not ok or type(data) ~= "table" then
        return nil
    end

    return data[flag]
end

local function SaveDropdownFlag(flag, value)
	local data = {}

	if isfile(DropdownsFile) then
		local ok, existing = pcall(function()
			return HttpService:JSONDecode(readfile(DropdownsFile))
		end)
		if ok and type(existing) == "table" then
			data = existing
		end
	end

	data[flag] = value

	local ok, encoded = pcall(function()
		return HttpService:JSONEncode(data)
	end)

	if ok then
		writefile(DropdownsFile, encoded)
	end
end

local function LoadDropdownFlag(flag)
	if isfile(DropdownsFile) then
		local ok, existing = pcall(function()
			return HttpService:JSONDecode(readfile(DropdownsFile))
		end)
		if ok and type(existing) == "table" then
			return existing[flag]
		end
	end
	return nil
end

local BindsFile = "binds.json"
local function SaveBindFlag(flag, keyName)
    local data = {}
    if isfile(BindsFile) then
        local ok, existing = pcall(function()
            return HttpService:JSONDecode(readfile(BindsFile))
        end)
        if ok and type(existing) == "table" then
            data = existing
        end
    end

    data[flag] = keyName

    local ok, encoded = pcall(function()
        return HttpService:JSONEncode(data)
    end)
    if ok then
        writefile(BindsFile, encoded)
    end
end

local function LoadBindFlag(flag)
    if isfile(BindsFile) then
        local ok, existing = pcall(function()
            return HttpService:JSONDecode(readfile(BindsFile))
        end)
        if ok and type(existing) == "table" then
            return existing[flag]
        end
    end
    return nil
end

function splib:MakeNotification(Configs)
	local function ToColor3(val)
		if typeof(val) == "ColorSequence" then
			local ok, kp = pcall(function() return val.Keypoints[1] end)
			if ok and kp and kp.Value then
				return kp.Value
			end
		elseif typeof(val) == "Color3" then
			return val
		end
		return Color3.fromRGB(255, 255, 255)
	end

	if isNotificationCooldown then return end
	isNotificationCooldown = true
	task.delay(0.5, function()
		isNotificationCooldown = false
	end)

	if type(Configs) == "string" then
		Configs = { Name = Configs }
	elseif type(Configs) ~= "table" then
		Configs = {}
	end
	Configs.Name     = Configs.Name     or "Notification"
	Configs.Content  = Configs.Content  or "This is a test."
	Configs.Image    = Configs.Image    or "rbxassetid://4384403532"
	Configs.Time     = tonumber(Configs.Time) or 4

	if Configs.IsMobile and not isMobile then return end
	if Configs.IsPC     and not isPC     then return end

	local holder = self.NotificationHolder
	if not holder or not holder.Parent then
		local isMobileSize = isMobile and 150 or 225

		holder = Create("Frame", ScreenGui, {
			Name = "NotificationHolder",
			AnchorPoint = Vector2.new(1, 1),
			Position = UDim2.new(1, -20, 1, -20),
			Size = UDim2.new(0, isMobileSize, 0, 0),
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			ZIndex = 9999,
		})

		Create("UIListLayout", holder, {
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom,
			Padding = UDim.new(0, 8),
		})

		self.NotificationHolder = holder
	end

	local layoutOrder = (#holder:GetChildren() or 0) + 1
	local notifParent = Create("Frame", holder, {
		Name = "NotifContainer",
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = layoutOrder,
	})

	local hub1 = ToColor3(Theme and Theme["Color Hub 1"])
	local strokeClr = ToColor3(Theme and Theme["Color Stroke"])
	local textClr = ToColor3(Theme and Theme["Color Text"])

local notifFrame = Create("TextButton", notifParent, {
    Name = "NotificationFrame",
    BackgroundColor3 = hub1 or strokeClr or Color3.fromRGB(30,30,30),
    BackgroundTransparency = 1,
    Size = UDim2.new(1, 0, 0, 0),
    AutomaticSize = Enum.AutomaticSize.Y,
    ZIndex = 1000,
    Text = "",
})
	InsertTheme(notifFrame, "Main")
	Make("Corner", notifFrame, UDim.new(0.18, 0))

	Create("UIStroke", notifFrame, {
		Color = strokeClr or textClr or Color3.fromRGB(200,200,200),
		Thickness = 1,
		Transparency = 0,
	})

	Create("UIPadding", notifFrame, {
		PaddingLeft = UDim.new(0, 12),
		PaddingTop = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 12),
		PaddingBottom = UDim.new(0, 10),
	})

	local icon = Create("ImageLabel", notifFrame, {
		Name = "Icon",
		Size = UDim2.new(0, 36, 0, 36),
		Image = Configs.Image,
		BackgroundTransparency = 1,
		ScaleType = Enum.ScaleType.Fit,
		Position = UDim2.new(0, 0, 0, 0),
		ZIndex = 1001,
	})
	Make("Corner", icon, UDim.new(0.3, 0))

	local title = Create("TextLabel", notifFrame, {
		Name = "Title",
		TextColor3 = textClr or Color3.new(1,1,1),
		Position = UDim2.new(0, 40, 0, 0),
		Size = UDim2.new(1, -44 - 36, 0, 20),
		Font = Enum.Font.GothamBold,
		TextSize = (isPC and 12) or 10,
		Text = Configs.Name,
		BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        AutomaticSize = Enum.AutomaticSize.Y,
		ZIndex = 1001,
	})
	InsertTheme(title, "Text")

	local content = Create("TextLabel", notifFrame, {
		Name = "Content",
		TextColor3 = textClr or Color3.new(1,1,1),
		Position = UDim2.new(0, 44, 0, title.Size.Y.Offset + 2),
		Size = UDim2.new(1, -44 - 36, 0, 0),
		Font = Enum.Font.Gotham,
		TextSize = 14,
		Text = tostring(Configs.Content),
		TextWrapped = true,
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		ZIndex = 1001,
	})
	InsertTheme(content, "Text")

	local timerText = Create("TextLabel", notifFrame, {
		Name = "TimerText",
		Size = UDim2.new(0, 34, 0, 20),
		Position = UDim2.new(1, -25, 0, -6),
		BackgroundTransparency = 1,
		Font = Enum.Font.GothamBold,
		TextSize = 14,
		TextColor3 = textClr or Color3.new(1,1,1),
		Text = tostring(math.ceil(Configs.Time)),
		TextXAlignment = Enum.TextXAlignment.Center,
		TextYAlignment = Enum.TextYAlignment.Center,
		ZIndex = 1003,
	})
	InsertTheme(timerText, "Text")

notifFrame.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(icon, TweenInfo.new(0.6), { ImageTransparency = 1 })
    local frameTween = TweenService:Create(notifFrame, TweenInfo.new(0.6), { BackgroundTransparency = 0.75 })
    
    closeTween:Play()
    frameTween:Play()
    
    task.delay(0.3, function()
        local outTween = TweenService:Create(notifFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
            Position = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1,
        })
        outTween:Play()
        task.delay(0.6, function()
            pcall(function() notifParent:Destroy() end)
        end)
    end)
end)

	notifFrame.Position = UDim2.new(1, 0, 0, 0)

	TweenService:Create(notifFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = 0,
	}):Play()
	TweenService:Create(icon, TweenInfo.new(0.32), { ImageTransparency = 0 }):Play()

	task.spawn(function()
		local total = math.max(0, tonumber(Configs.Time) or 4)
		local t = total
		local alive = true

		local last = tick()
		while t > 0 and alive do
			local now = tick()
			local dt = now - last
			last = now
			t = t - dt
			pcall(function()
				timerText.Text = tostring(math.ceil(math.max(0, t)))
			end)
			task.wait(0.1)
		end

		pcall(function()
			if alive then
				TweenService:Create(icon, TweenInfo.new(0.6), { ImageTransparency = 1 }):Play()
				TweenService:Create(notifFrame, TweenInfo.new(0.6), { BackgroundTransparency = 0.75 }):Play()
				task.wait(0.3)
				local out = TweenService:Create(notifFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
					Position = UDim2.new(1, 0, 0, 0),
					BackgroundTransparency = 1,
				})
				out:Play()
				task.wait(0.6)
				pcall(function() notifParent:Destroy() end)
			end
		end)
	end)
end

function Tab:AddLabel(Configs)
    if type(Configs) == "string" then
        Configs = { Configs }
    end
    local PName = Configs[1] or Configs.Title or "Label"
    local PDesc = Configs[2] or Configs.Text or ""

    if Configs.IsMobile and not isMobile then
        return nil
    end

    if Configs.IsPC and not isPC then
        return nil
    end

    local container = Configs.__force_container or Container
    local Frame, LabelFunc = ButtonFrame(container, PName, PDesc, UDim2.new(1, -20))
    
    local Label = {}
    function Label:Visible(...) Funcs:ToggleVisible(Frame, ...) end
    function Label:Destroy() Frame:Destroy() end
    function Label:SetTitle(Val)
        LabelFunc:SetTitle(GetStr(Val))
    end
    function Label:SetDesc(Val)
        LabelFunc:SetDesc(GetStr(Val))
    end
    function Label:Set(Val1, Val2)
        if Val1 then
            LabelFunc:SetTitle(GetStr(Val1))
        end
        if Val2 then
            LabelFunc:SetDesc(GetStr(Val2))
        end
    end
    return Label
end

function Tab:AddBind(Configs)
    if type(Configs) == "string" then
        Configs = { Name = Configs }
    end

    local Name     = Configs.Name     or Configs.Title or "Bind"
    local Desc     = Configs.Desc     or Configs.Description or ""
    local Default  = Configs.Default  or Enum.KeyCode.Unknown
    local Hold     = Configs.Hold     or false
    local Callback = Configs.Callback or function() end
    local Flag     = Configs.Flag     or nil
    local Save     = Configs.Save     or false

    if Flag then
        local savedName = LoadBindFlag(Flag)
        if savedName then
            local ok, keyCode = pcall(function()
                return Enum.KeyCode[savedName]
            end)
            if ok and keyCode then
                Default = keyCode
            end
        end
    end

    if Configs.IsMobile and not isMobile then return nil end
    if Configs.IsPC     and not isPC     then return nil end

    local container = Configs.__force_container or Container
    local Frame, LabelFunc, BindBox = ButtonFrame(container, Name, Desc, UDim2.new(1, -20), true)
BindBox:GetPropertyChangedSignal("TextColor3"):Connect(function()
    if Theme and Theme["Color Text"] then
        if BindBox.TextColor3 ~= Theme["Color Text"] then
            BindBox.TextColor3 = Theme["Color Text"]
        end
    end
end)
    Frame.AutomaticSize = Enum.AutomaticSize.None
    Frame.Size = UDim2.new(1, 0, 0, 30)

    local state = {
        Value   = Default,
        Binding = false,
        Hold    = Hold,
        Save    = Save,
    }

    local Holding = false
    local recentlyBound = false
    local bindConn = nil
    local bindInputConn = nil

    local function updateDisplay()
        if not BindBox or not BindBox.Parent then return end

        local nm = (typeof(state.Value) == "EnumItem" and state.Value.Name) or tostring(state.Value)
        BindBox.Text = nm

        task.defer(function()
            if BindBox and Theme and Theme["Color Text"] then
                BindBox.TextColor3 = Theme["Color Text"]
            end
        end)

        if not BindBox:GetAttribute("Ready") then
            BindBox:SetAttribute("Ready", true)
        end
    end

    updateDisplay()

    Frame:SetAttribute("LockVisibility", false)

    Frame.Activated:Connect(function()
        if state.Binding or recentlyBound then return end

        if not Frame.Visible then
            Frame.Visible = true
        end

        task.wait()

        state.Binding = true
        Frame:SetAttribute("LockVisibility", true)

        if BindBox and BindBox.Parent then
            BindBox.Text = "..."
            if Theme and Theme["Color Text"] then
                BindBox.TextColor3 = Theme["Color Text"]
            end
        end

        if bindInputConn and bindInputConn.Connected then
            bindInputConn:Disconnect()
            bindInputConn = nil
        end

        bindInputConn = UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if not state.Binding then return end

            if input.UserInputType ~= Enum.UserInputType.Keyboard then
                if BindBox and BindBox.Parent then
                    BindBox.Text = "Invalid"
                end
                task.delay(0.4, updateDisplay)
                state.Binding = false
                Frame:SetAttribute("LockVisibility", false)
                bindInputConn:Disconnect()
                bindInputConn = nil
                return
            end

            if input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
                state.Value = input.KeyCode
                updateDisplay()

                if Flag then
                    SaveBindFlag(Flag, input.KeyCode.Name)
                    splib.Flags[Flag] = state
                end

                if state.Save then
                    SaveCfg(game.GameId)
                end

                recentlyBound = true
                task.delay(0.25, function()
                    recentlyBound = false
                end)
            end

            state.Binding = false
            Frame:SetAttribute("LockVisibility", false)
            bindInputConn:Disconnect()
            bindInputConn = nil
        end)

        task.delay(6, function()
            if state.Binding then
                state.Binding = false
                Frame:SetAttribute("LockVisibility", false)
                if bindInputConn and bindInputConn.Connected then
                    bindInputConn:Disconnect()
                    bindInputConn = nil
                end
                updateDisplay()
            end
        end)
    end)

    bindConn = UserInputService.InputBegan:Connect(function(input, gp)
        if gp or state.Binding or recentlyBound then return end

        local match = false
        if typeof(state.Value) == "EnumItem" then
            if input.KeyCode == state.Value then
                match = true
            elseif input.UserInputType == state.Value then
                match = true
            end
        end

        if match then
            if state.Hold then
                Holding = true
                Callback(Holding)
            else
                Callback()
            end
        end
    end)

    table.insert(bindConnections, bindConn)

    UserInputService.InputEnded:Connect(function(input)
        if state.Hold and input.KeyCode == state.Value then
            Holding = false
            Callback(Holding)
        end
    end)

    local objBind = {}
    function objBind:Get() return state.Value end
    function objBind:Visible(val) Funcs:ToggleVisible(Frame, val) end
    function objBind:Destroy()
        state.Value = Enum.KeyCode.Unknown
        if bindConn and bindConn.Connected then bindConn:Disconnect() end
        if bindInputConn and bindInputConn.Connected then bindInputConn:Disconnect() end
        Frame:Destroy()
    end
    function objBind:Callback(fn)
        if type(fn) == "function" then Callback = fn end
    end
    function objBind:Set(val)
        if typeof(val) == "EnumItem" or type(val) == "number" then
            state.Value = val
            updateDisplay()
        end
    end

    table.insert(Binds, objBind)

    return objBind
end

function splib:ClearAllBinds()
    print("Clearing Binds, count:", #Binds)
    for _, bind in ipairs(Binds) do
        if bind.Set then
            bind:Set(Enum.KeyCode.Unknown)
        end
    end
end

function Tab:AddImageLabel(Configs)
    local Title = Configs[1] or Configs.Name or Configs.Title or "Image Label"
    local Desc = Configs.Desc or Configs.Description or ""
    local Logo = Configs[2] or Configs.Image or ""
    local Rainbow = Configs.Rainbow or false

            if Configs.IsMobile and not isMobile then
                return nil
            end

            if Configs.IsPC and not isPC then
                return nil
            end

    local Holder = Create("Frame", Container, {
        Size = UDim2.new(1, 0, 0, 65),
        Name = "Option",
        BackgroundTransparency = 1
    })

    local FrameHolder = InsertTheme(Create("Frame", Holder, {
        Size = UDim2.new(1, 0, 0, 65),
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 0, 1),
        BackgroundColor3 = Theme["Color Hub 2"]
    }), "Frame")
    Make("Corner", FrameHolder)

    local ImageLabel = Create("ImageLabel", FrameHolder, {
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0, 7, 0, 7),
        Image = Logo,
        BackgroundTransparency = 1
    })
    Make("Corner", ImageLabel, UDim.new(0, 4))
    local ImageStroke = Make("Stroke", ImageLabel, { Thickness = 1 })

    local LTitle = InsertTheme(Create("TextLabel", FrameHolder, {
        Size = UDim2.new(1, -65, 0, 15),
        Position = UDim2.new(0, 65, 0, 7),
        Font = Enum.Font.GothamBold,
        TextColor3 = Theme["Color Text"],
        TextXAlignment = "Left",
        BackgroundTransparency = 1,
        TextSize = 10,
        Text = Title
    }), "Text")

    local LDesc = InsertTheme(Create("TextLabel", FrameHolder, {
        Size = UDim2.new(1, -65, 0, 0),
        Position = UDim2.new(0, 65, 0, 22),
        TextWrapped = "Y",
        AutomaticSize = "Y",
        Font = Enum.Font.Gotham,
        TextColor3 = Theme["Color Dark Text"],
        TextXAlignment = "Left",
        BackgroundTransparency = 1,
        TextSize = 8,
        Text = Desc
    }), "DarkText")

    local rainbowConnection
    local function StartRainbow()
        if rainbowConnection then return end
        rainbowConnection = task.spawn(function()
            while ImageStroke and ImageStroke.Parent do
                local t = tick() * 0.5
                local r = math.sin(t) * 0.5 + 0.5
                local g = math.sin(t + 2) * 0.5 + 0.5
                local b = math.sin(t + 4) * 0.5 + 0.5
                ImageStroke.Color = Color3.new(r, g, b)
                task.wait()
            end
        end)
    end

    local function StopRainbow()
        if rainbowConnection then
            rainbowConnection = nil
        end
        if ImageStroke then
            ImageStroke.Color = Theme["Color Text"]
        end
    end

    if Rainbow then
        StartRainbow()
    end

    local ImageLabelObj = {}
    function ImageLabelObj:SetImage(newImage)
        ImageLabel.Image = newImage
    end
    function ImageLabelObj:GetImage()
        return ImageLabel.Image
    end
    function ImageLabelObj:Visible(...)
        Funcs:ToggleVisible(Holder, ...)
    end
    function ImageLabelObj:Destroy()
        Holder:Destroy()
    end

    return ImageLabelObj
end


function Tab:AddParagraph(...)
    local args = {...}

    local Configs
    if #args == 1 and type(args[1]) == "table" then
        Configs = args[1]
    else
        Configs = {
            args[1], -- PName = Configs[1]
            args[2]  -- PDesc = Configs[2]
        }
    end

    local PName = Configs[1] or Configs.Title or "Paragraph"
    local PDesc = Configs[2] or Configs.Text  or ""

    if Configs.IsMobile and not isMobile then
        return nil
     end

    if Configs.IsPC and not isPC then
        return nil
     end
    
    local container = Configs.__force_container or Container
    local Frame, LabelFunc = ButtonFrame(container, PName, PDesc, UDim2.new(1, -20))

    local Paragraph = {}
    function Paragraph:Visible(...) Funcs:ToggleVisible(Frame, ...) end
    function Paragraph:Destroy()   Frame:Destroy() end
    function Paragraph:SetTitle(Val) LabelFunc:SetTitle(GetStr(Val)) end
    function Paragraph:SetDesc(Val)  LabelFunc:SetDesc(GetStr(Val))  end
    function Paragraph:Set(Val1, Val2)
        if Val1 and Val2 then
            LabelFunc:SetTitle(GetStr(Val1))
            LabelFunc:SetDesc(GetStr(Val2))
        elseif Val1 then
            LabelFunc:SetDesc(GetStr(Val1))
        end
    end

    return Paragraph
end
function Tab:AddButton(Configs)
			local BName = Configs[1] or Configs.Name or Configs.Title or "Button!"
			local BDescription = Configs.Desc or Configs.Description or ""
			local Callback = Funcs:GetCallback(Configs, 2)

            if Configs.IsMobile and not isMobile then
                return nil
            end

            if Configs.IsPC and not isPC then
                return nil
            end
			
            local container = Configs.__force_container or Container
			local FButton, LabelFunc = ButtonFrame(container, BName, BDescription, UDim2.new(1, -20))
			
			local ButtonIcon = Create("ImageLabel", FButton, {
				Size = UDim2.new(0, 14, 0, 14),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Image = "rbxassetid://10709791437"
			})

		FButton.Activated:Connect(function()
				Funcs:FireCallback(Callback)
			end)

			local Button = {}
			function Button:Visible(...) Funcs:ToggleVisible(FButton, ...) end
			function Button:Destroy() FButton:Destroy() end
			function Button:Callback(...) Funcs:InsertCallback(Callback, ...) end
			function Button:Set(Val1, Val2)
				if type(Val1) == "string" and type(Val2) == "string" then
					LabelFunc:SetTitle(Val1)
					LabelFunc:SetDesc(Val2)
				elseif type(Val1) == "string" then
					LabelFunc:SetTitle(Val1)
				elseif type(Val1) == "function" then
					Callback = Val1
				end
			end
			return Button
		end

function Tab:AddToggle(Configs)
    local TName    = Configs[1] or Configs.Name or Configs.Title or "Toggle"
    local TDesc    = Configs.Desc or Configs.Description or ""
    local Callback = Funcs:GetCallback(Configs, 3)
    local Flag     = Configs[4] or Configs.Flag or false
    local Default  = Configs[2] or Configs.Default or false

    if Flag then
        local saved = LoadFlagValue(Flag)
        if type(saved) == "boolean" then
            Default = saved
        end
    end

    if Configs.IsMobile and not isMobile then return nil end
    if Configs.IsPC     and not isPC     then return nil end

    local container = Configs.__force_container or Container
    local Button, LabelFunc = ButtonFrame(container, TName, TDesc, UDim2.new(1, -38))

    local ToggleHolder = InsertTheme(Create("Frame", Button, {
        Size             = UDim2.new(0, 35, 0, 18),
        Position         = UDim2.new(1, -10, 0.5),
        AnchorPoint      = Vector2.new(1, 0.5),
        BackgroundColor3 = Theme["Color Stroke"],
    }), "Stroke")
    Make("Corner", ToggleHolder, UDim.new(0.5, 0))

    local Slider = Create("Frame", ToggleHolder, {
        BackgroundTransparency = 1,
        Size                   = UDim2.new(0.8, 0, 0.8, 0),
        Position               = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint            = Vector2.new(0.5, 0.5),
    })

    local Toggle = InsertTheme(Create("Frame", Slider, {
        Size                   = UDim2.new(0, 12, 0, 12),
        Position               = UDim2.new(Default and 1 or 0, 0, 0.5),
        AnchorPoint            = Vector2.new(Default and 1 or 0, 0.5),
        BackgroundColor3       = Theme["Color Theme"],
        BackgroundTransparency = Default and 0 or 0.8,
    }), "Theme")
    Make("Corner", Toggle, UDim.new(0.5, 0))

    local WaitClick
local function SetToggle(Val)
    if WaitClick then return end
    WaitClick = true
    Default = Val

    if not (control and control.internal) then
        Default = Val
    end

    if Flag and not (control and control.internal) then
        SaveFlagValue(Flag, Val)
    end

        Funcs:FireCallback(Callback, Default)

local tweenInfoOn = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local tweenInfoOff = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

if Default then
    TweenService:Create(Toggle, tweenInfoOn, {
        Position = UDim2.new(1, 0, 0.5),
        BackgroundTransparency = 0,
        AnchorPoint = Vector2.new(1, 0.5),
        Size = UDim2.new(0, 14, 0, 14)
    }):Play()
    task.delay(0.1, function()
        if Default and Toggle and Toggle.Parent then
            TweenService:Create(Toggle, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 12, 0, 12)
            }):Play()
        end
    end)
else
    TweenService:Create(Toggle, tweenInfoOff, {
        Position = UDim2.new(0, 0, 0.5),
        BackgroundTransparency = 0.8,
        AnchorPoint = Vector2.new(0, 0.5)
    }):Play()
end

        WaitClick = false
    end

if Flag then
    splib.Flags[Flag] = {
        Value = Default,
        Save  = true,
        Set   = SetToggle,
    }
end

    task.spawn(SetToggle, Default)
    Button.Activated:Connect(function()
        SetToggle(not Default)
    end)

    local Toggle = {}
    function Toggle:Visible(...) Funcs:ToggleVisible(Button, ...) end
    function Toggle:Destroy()     Button:Destroy()           end
    function Toggle:Callback(...) Funcs:InsertCallback(Callback, ...)() end
function Toggle:Set(Val1, control)
    if type(Val1) == "string" and type(control) == "string" then
        LabelFunc:SetTitle(Val1)
        LabelFunc:SetDesc(control)
    elseif type(Val1) == "string" then
        LabelFunc:SetTitle(Val1, false, true)
    elseif type(Val1) == "boolean" then
        if WaitClick and (not control or not control.internal) then
            repeat task.wait() until not WaitClick
        end
        task.spawn(SetToggle, Val1, control)
    elseif type(Val1) == "function" then
        Callback = Val1
    end
end

function Toggle:ForceCallback(val)
    Funcs:FireCallback(Callback, val)
end

Toggle.GetValue = function()
    return Default
end

function Toggle:SetText(newTitle, newDesc)
    if newTitle then 
        LabelFunc:SetTitle(newTitle) 
    end
    if newDesc then 
        LabelFunc:SetDesc(newDesc) 
    end
end

   table.insert(Toggles, { object = Toggle, default = Default })
    return Toggle
end

function splib:ClearAllToggles()
    print("Clearing Toggles, count:", #Toggles)
    for _, entry in ipairs(Toggles) do
        if entry.object and type(entry.object.ForceCallback) == "function" then
            entry.object:ForceCallback(false)
        end
    end
end
		function Tab:AddDropdown(Configs)
			local DName = Configs[1] or Configs.Name or Configs.Title or "Dropdown"
			local DDesc = Configs.Desc or Configs.Description or ""
			local DOptions = Configs[2] or Configs.Options or {}
            local Flag = Configs[4] or Configs.Flag or false
            local OpDefault = Configs[3] or Configs.Default
			local DMultiSelect = Configs.MultiSelect or false
			local Callback = Funcs:GetCallback(Configs, 4)
 
            if Configs.IsMobile and not isMobile then
                return nil
            end
 
            if Configs.IsPC and not isPC then
                return nil
            end
 
if not OpDefault and Flag then
    local loaded = LoadDropdownFlag(Flag)
    if loaded then
        OpDefault = loaded
    end
end

if Flag then
    local saved = LoadDropdownFlag(Flag)
    if saved ~= nil then
        OpDefault = saved
    end
end

			local container = Configs.__force_container or Container
            local Button, LabelFunc = ButtonFrame(container, DName, DDesc, UDim2.new(1, -20))
 
			local SelectedFrame = InsertTheme(Create("Frame", Button, {
				Size = UDim2.new(0, 150, 0, 18),
				Position = UDim2.new(1, -10, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Theme["Color Stroke"]
			}), "Stroke")Make("Corner", SelectedFrame, UDim.new(0, 4))

local function updateSelectedFrameSize()
    local scale = isPC and 0.23 or 0.15
    local mineWidth = isPC and 80 or 60
    local newWidth = math.clamp(Button.AbsoluteSize.X * scale, mineWidth, 150)
    SelectedFrame.Size = UDim2.new(0, newWidth, 0, 18)
end

Button:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSelectedFrameSize)
updateSelectedFrameSize()

			local ActiveLabel = InsertTheme(Create("TextLabel", SelectedFrame, {
				Size = UDim2.new(0.85, 0, 0.85, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				BackgroundTransparency = 1,
				Font = Enum.Font.GothamBold,
				TextScaled = true,
				TextColor3 = Theme["Color Text"],
				Text = "..."
			}), "Text")
 
			local Arrow = Create("ImageLabel", SelectedFrame, {
				Size = UDim2.new(0, 15, 0, 15),
				Position = UDim2.new(0, -5, 0.5),
				AnchorPoint = Vector2.new(1, 0.5),
				Image = "rbxassetid://10709791523",
				BackgroundTransparency = 1
			})
 
			local NoClickFrame = Create("TextButton", DropdownHolder, {
				Name = "AntiClick",
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Visible = false,
				Text = ""
			})
 
			local DropFrame = Create("Frame", NoClickFrame, {
				Size = UDim2.new(SelectedFrame.Size.X, 0, 0),
				BackgroundTransparency = 0.1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				AnchorPoint = Vector2.new(0, 1),
				Name = "DropdownFrame",
				ClipsDescendants = true,
				Active = true
			})Make("Corner", DropFrame)Make("Stroke", DropFrame)Make("Gradient", DropFrame, {Rotation = 60})
 
			local ScrollFrame = InsertTheme(Create("ScrollingFrame", DropFrame, {
				ScrollBarImageColor3 = Theme["Color Theme"],
				Size = UDim2.new(1, 0, 1, 0),
				ScrollBarThickness = 1.5,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				CanvasSize = UDim2.new(),
				ScrollingDirection = "Y",
				AutomaticCanvasSize = "Y",
				Active = true
			}, {
				Create("UIPadding", {
					PaddingLeft = UDim.new(0, 8),
					PaddingRight = UDim.new(0, 8),
					PaddingTop = UDim.new(0, 5),
					PaddingBottom = UDim.new(0, 5)
				}), Create("UIListLayout", {
					Padding = UDim.new(0, 4)
				})
			}), "ScrollBar")
 
			local isCooldown = false
			local ScrollSize, WaitClick = 5
 
			local function Disable()
	        if isCooldown then return end
	        isCooldown = true
	        WaitClick = true
				CreateTween({Arrow, "Rotation", 0, 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out})
				CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.2, true})
				CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.2})
				Arrow.Image = "rbxassetid://10709791523"
				NoClickFrame.Visible = false
	WaitClick = false
	task.delay(0.11, function()
		isCooldown = false
	end)
end
 
			local function GetFrameSize()
				return UDim2.fromOffset(152, ScrollSize)
			end
 
			local function CalculateSize()
				local Count = 0
				for _,Frame in pairs(ScrollFrame:GetChildren()) do
					if Frame:IsA("Frame") or Frame.Name == "Option" then
						Count = Count + 1
					end
				end
				ScrollSize = (math.clamp(Count, 0, 10) * 25) + 10
				if NoClickFrame.Visible then
					NoClickFrame.Visible = true
					CreateTween({DropFrame, "Size", GetFrameSize(), 0.2, true})
				end
			end
 
 
local function Minimize()
	if WaitClick or isCooldown then return end
	WaitClick = true
	isCooldown = true
 
	if NoClickFrame.Visible then
		CreateTween({Arrow, "Rotation", 0, 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out})
		Arrow.Image = "rbxassetid://10709791523"
		CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.15})
		CreateTween({DropFrame, "Size", UDim2.new(0, 152, 0, 0), 0.15, true})
		NoClickFrame.Visible = false
	else
		NoClickFrame.Visible = true
		Arrow.Image = "rbxassetid://10709791523"
		CreateTween({Arrow, "Rotation", 180, 0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out})
		CreateTween({Arrow, "ImageColor3", Theme["Color Theme"], 0.15})
		CreateTween({DropFrame, "Size", GetFrameSize(), 0.15, true})
	end
 
	task.delay(0.11, function()
		isCooldown = false
	end)
 
	WaitClick = false
end
 
			local function CalculatePos()
				local FramePos = SelectedFrame.AbsolutePosition
				local ScreenSize = ScreenGui.AbsoluteSize
				local ClampX = math.clamp((FramePos.X / UIScale), 0, ScreenSize.X / UIScale - DropFrame.Size.X.Offset)
				local ClampY = math.clamp((FramePos.Y / UIScale) , 0, ScreenSize.Y / UIScale)
 
				local NewPos = UDim2.fromOffset(ClampX, ClampY)
				local AnchorPoint = FramePos.Y > ScreenSize.Y / 1.4 and 1 or ScrollSize > 80 and 0.5 or 0
				DropFrame.AnchorPoint = Vector2.new(0, AnchorPoint)
				CreateTween({DropFrame, "Position", NewPos, 0.1})
			end
local AddNewOptions, GetOptions, AddOption, RemoveOption, Selected, SelectOption, UpdateSelected
local Options, OptionList = {}, {}
do
    local saved = (type(CheckFlag) == "function" and CheckFlag(Flag) and GetFlag(Flag)) or nil
    local Default = type(OpDefault) ~= "table" and {OpDefault} or OpDefault or {}
    local MultiSelect = DMultiSelect
    local InitialSelection = saved or Default[1]
    Selected = MultiSelect and {} or InitialSelection

    if MultiSelect then
        for _, v in ipairs(saved or Default or {}) do
            if type(v) == "string" then Selected[v] = true end
        end
    end

    local function normalizeNameValue(index, Value)
        if type(index) == "table" then
            Value = index[2]; index = index[1]
        end
        local Name
        if type(index) == "string" then
            Name = index
        elseif Value ~= nil then
            Name = tostring(Value)
        else
            Name = tostring(index)
        end
        if Value == nil then Value = Name end
        return Name, Value
    end

    local function CallbackSelected()
        pcall(function()
            if Flag and type(SaveDropdownFlag) == "function" then
                if MultiSelect then
                    local list = {}
                    for _, nm in ipairs(OptionList) do if Selected[nm] then table.insert(list, nm) end end
                    SaveDropdownFlag(Flag, list)
                else
                    SaveDropdownFlag(Flag, tostring(Selected))
                end
            end
        end)
        pcall(function() Funcs:FireCallback(Callback, Selected) end)
    end

    local function UpdateLabel()
        if MultiSelect then
            local list = {}
            for _, name in ipairs(OptionList) do
                if Selected[name] then table.insert(list, name) end
            end
            ActiveLabel.Text = #list > 0 and table.concat(list, ", ") or "..."
        else
            ActiveLabel.Text = tostring(Selected or "...")
        end
    end

    UpdateSelected = function()
        for _, name in ipairs(OptionList) do
            local v = Options[name]
            if v and v.nodes then
                local nodes, Stats = v.nodes, v.Stats
                local isSel
                if MultiSelect then
                    isSel = (Selected[name] == true)
                else
                    isSel = (v.Value == Selected) or (v.Name == Selected)
                end
                pcall(function()
                    CreateTween({nodes[2], "BackgroundTransparency", isSel and 0 or (MultiSelect and 0.8 or 1), 0.35})
                    CreateTween({nodes[2], "Size", isSel and UDim2.fromOffset(4, (MultiSelect and 12 or 14)) or UDim2.fromOffset(4, 4), 0.35})
                    CreateTween({nodes[3], "TextTransparency", isSel and 0 or 0.4, 0.35})
                end)
            end
        end
        UpdateLabel()
    end

    local function SelectByObject(optionObj)
        if not optionObj then return end
        if MultiSelect then
            optionObj.Stats = not optionObj.Stats
            Selected[optionObj.Name] = optionObj.Stats
            CallbackSelected()
        else
            optionObj.LastCB = tick()
            Selected = optionObj.Value
            CallbackSelected()
        end
        UpdateSelected()
    end

    local InBulkUpdate = false
    
    AddOption = function(index, Value)
        if type(index) == "table" then
            Value = index[2]; index = index[1]
        end

        local Name
        if type(index) == "string" then Name = index
        elseif Value ~= nil then Name = tostring(Value)
        else Name = tostring(index) end

        if not Name or Name == "" then return end
        if Value == nil then Value = Name end
        if Options[Name] then return end

        local opt = {
            index = index,
            Value = Value,
            Name = Name,
            Stats = false,
            LastCB = 0,
            nodes = nil
        }
        Options[Name] = opt
        table.insert(OptionList, Name)

        if MultiSelect then
            local stat = Selected[Name]
            Selected[Name] = stat or false
            opt.Stats = stat or false
        end

        local Button = Make("Button", ScrollFrame, {
            Name = "Option",
            Size = UDim2.new(1, 0, 0, 21),
            Position = UDim2.new(0, 0, 0.5),
            AnchorPoint = Vector2.new(0, 0.5)
        }) Make("Corner", Button, UDim.new(0,4))

        local IsSelected = InsertTheme(Create("Frame", Button, {
            Position = UDim2.new(0, 1, 0.5),
            Size = UDim2.new(0, 4, 0, 4),
            BackgroundColor3 = Theme["Color Theme"],
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 0.5)
        }), "Theme") Make("Corner", IsSelected, UDim.new(0.5, 0))

        local OptioneName = InsertTheme(Create("TextLabel", Button, {
            Size = UDim2.new(1, 0, 1, 0),
            Position = UDim2.new(0, 10),
            Text = Name,
            TextColor3 = Theme["Color Text"],
            Font = Enum.Font.GothamBold,
            TextXAlignment = "Left",
            BackgroundTransparency = 1,
            TextTransparency = 0.4
        }), "Text")

        Button.Activated:Connect(function()
            SelectByObject(opt)
        end)

        opt.nodes = {Button, IsSelected, OptioneName}

        if not InBulkUpdate then
            pcall(CalculateSize)
            UpdateSelected()
        end
    end

    RemoveOption = function(index, Value)
        local Name
        if type(index) == "number" then Name = OptionList[index]
        elseif type(index) == "string" then Name = index
        elseif Value ~= nil then Name = tostring(Value)
        else Name = tostring(index) end

        if not Name or not Options[Name] then return end

        local opt = Options[Name]
        if opt.nodes and opt.nodes[1] then pcall(function() opt.nodes[1]:Destroy() end) end

        Options[Name] = nil
        for i, nm in ipairs(OptionList) do
            if nm == Name then table.remove(OptionList, i); break end
        end

        if MultiSelect then
            Selected[Name] = nil
        else
            if Selected == opt.Value or Selected == Name then
                Selected = nil
            end
        end

        if not InBulkUpdate then
            UpdateSelected()
            pcall(CalculateSize)
        end
    end

    SelectOption = function(key)
        if key == nil then return end
        if type(key) == "number" then
            key = OptionList[key]
            if not key then return end
        end
        local opt = Options[key]
        if not opt then
            for _, name in ipairs(OptionList) do
                local o = Options[name]
                if o and (o.Value == key or tostring(o.Value) == tostring(key) or o.Name == key) then
                    opt = o; break
                end
            end
        end
        if not opt then return end
        if MultiSelect then
            opt.Stats = not opt.Stats
            Selected[opt.Name] = opt.Stats
        else
            Selected = opt.Value
        end
        CallbackSelected()
        UpdateSelected()
    end

    GetOptions = function() return Options end

    AddNewOptions = function(List, Clear)
        local OldSelected
        if MultiSelect then
            OldSelected = {}
            for k, v in pairs(Selected) do
                if v then
                    OldSelected[k] = true
                end
            end
        else
            OldSelected = Selected
        end

        InBulkUpdate = true

        if Clear then
            for i = #OptionList, 1, -1 do
                RemoveOption(OptionList[i])
            end
        end

        for _, v in ipairs(List or {}) do
            AddOption(v)
        end

        InBulkUpdate = false

        if OldSelected ~= nil then
            if MultiSelect and type(OldSelected) == "table" then
                for name, _ in pairs(OldSelected) do
                    local opt = Options[name]
                    if opt then
                        opt.Stats = true
                        Selected[name] = true
                    end
                end
            else
                SelectOption(OldSelected)
            end
        end

        CallbackSelected()
        UpdateSelected()
        pcall(CalculateSize)
    end

    InBulkUpdate = true
    for _, v in ipairs(DOptions or {}) do
        AddOption(v)
    end
    InBulkUpdate = false

    if InitialSelection ~= nil then
        if MultiSelect and type(InitialSelection) == "table" then
            for _, want in ipairs(InitialSelection) do
                for _, nm in ipairs(OptionList) do
                    local o = Options[nm]
                    if o and (o.Value == want or o.Name == want or tostring(o.Value) == tostring(want)) then
                        o.Stats = true
                        Selected[o.Name] = true
                        break
                    end
                end
            end
            CallbackSelected()
            UpdateSelected()
        else
            SelectOption(InitialSelection)
        end
    else
        UpdateSelected()
    end
end
			Button.Activated:Connect(Minimize)
			NoClickFrame.MouseButton1Down:Connect(Disable)
			NoClickFrame.MouseButton1Click:Connect(Disable)
			MainFrame:GetPropertyChangedSignal("Visible"):Connect(Disable)
			SelectedFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(CalculatePos)
 
			Button.Activated:Connect(CalculateSize)
			ScrollFrame.ChildAdded:Connect(CalculateSize)
			ScrollFrame.ChildRemoved:Connect(CalculateSize)
			CalculatePos()
			CalculateSize()

    local Dropdown = {}

    function Dropdown:Visible(...) Funcs:ToggleVisible(Button, ...) end
    function Dropdown:Destroy() pcall(function() Button:Destroy() end); pcall(function() DropFrame:Destroy() end) end
    function Dropdown:Callback(...) Funcs:InsertCallback(Callback, ...)(Selected) end
    function Dropdown:Add(...) local args = {...}; local list = {}; if type(args[1]) == "table" and args[1][1] ~= nil then list = args[1] else list = args end for _, v in ipairs(list) do AddOption(v) end UpdateSelected() end
    function Dropdown:Remove(key) RemoveOption(key) end
    function Dropdown:Refresh(newOptions, deleteOld) AddNewOptions(newOptions or {}, not not deleteOld); UpdateSelected() end
    function Dropdown:Select(val) SelectOption(val) end
    function Dropdown:Set(val, Clear)
        if type(val) == "table" then AddNewOptions(val, not Clear)
        elseif type(val) == "function" then Callback = val
        else SelectOption(val) end
        pcall(UpdateSelected)
    end
function Dropdown:GetValue()
    if DMultiSelect then
        local res = {}
        for i, nm in ipairs(OptionList) do
            if Selected[nm] then table.insert(res, i) end
        end
        return res
    else
        return Selected
    end
end

    Dropdown.Flag = Flag
    return Dropdown
end
local SlidersFile = "sliders.json"
local function SaveSliderFlag(flag, value)
    local data = {}
    if isfile(SlidersFile) then
        local ok, existing = pcall(function()
            return HttpService:JSONDecode(readfile(SlidersFile))
        end)
        if ok and type(existing) == "table" then
            data = existing
        end
    end

    data[flag] = value

    local ok, encoded = pcall(function()
        return HttpService:JSONEncode(data)
    end)
    if ok then
        writefile(SlidersFile, encoded)
    end
end

local function LoadSliderFlag(flag)
    if isfile(SlidersFile) then
        local ok, existing = pcall(function()
            return HttpService:JSONDecode(readfile(SlidersFile))
        end)
        if ok and type(existing) == "table" then
            return existing[flag]
        end
    end
    return nil
end
function Tab:AddSlider(Configs)
    local SName = Configs[1] or Configs.Name or Configs.Title or "Slider"
    local SDesc = Configs.Desc or Configs.ValueName or Configs.Description or ""
    local Min = Configs[2] or Configs.MinValue or Configs.Min or 10
    local Max = Configs[3] or Configs.MaxValue or Configs.Max or 100
    local Increase = Configs[4] or Configs.Increase or Configs.Increment or 1
    local Callback = Funcs:GetCallback(Configs, 6)
    local Flag = Configs[7] or Configs.Flag
    local Default = Configs[5] or Configs.Default

    if Flag then
        local saved = LoadSliderFlag(Flag)
        if type(saved) == "number" then
            Default = saved
        end
    end

    if type(Default) ~= "number" then
        Default = (Min + Max) / 2
    end

    if Configs.IsMobile and not isMobile then return nil end
    if Configs.IsPC and not isPC then return nil end

    local container = Configs.__force_container or Container
    local Button, LabelFunc = ButtonFrame(container, SName, SDesc, UDim2.new(1, -20))
    local SliderHolder = Create("TextButton", Button, {
        Size = UDim2.new(0.40, 0, 1),
        Position = UDim2.new(1),
        AnchorPoint = Vector2.new(1, 0),
        AutoButtonColor = false,
        Text = "",
        BackgroundTransparency = 1
    })

    local SliderBar = InsertTheme(Create("Frame", SliderHolder, {
        BackgroundColor3 = Theme["Color Stroke"],
        Size = UDim2.new(1, -20, 0, 6),
        Position = UDim2.new(0.5, 0, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5)
    }), "Stroke") Make("Corner", SliderBar)

    local Indicator = InsertTheme(Create("Frame", SliderBar, {
        BackgroundColor3 = Theme["Color Theme"],
        Size = UDim2.fromScale(0.3, 1),
        BorderSizePixel = 0
    }), "Theme") Make("Corner", Indicator)

    local SliderHandle = Create("Frame", SliderBar, {
        Size = UDim2.new(0, 16, 0, 16),
        BackgroundColor3 = Color3.fromRGB(69, 69, 69),
        Position = UDim2.fromScale(0, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundTransparency = 0,
        Active = true
    })
    Make("Corner", SliderHandle, UDim.new(1, 0))

    local HandleInner = Create("Frame", SliderHandle, {
        Size = UDim2.new(1, -6, 1, -6),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Theme["Color Theme"],
        BackgroundTransparency = 0,
        BorderSizePixel = 0
    })
    Make("Corner", HandleInner, UDim.new(1, 0))

    local LabelVal = InsertTheme(Create("TextBox", SliderHolder, {
        Size = UDim2.new(0, 14, 0, 14),
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(0, 0, 0.5),
        BackgroundTransparency = 1,
        TextColor3 = Theme["Color Text"],
        Font = Enum.Font.FredokaOne,
        TextSize = 11
    }), "Text")
    local UIScale = Create("UIScale", LabelVal)
    local BaseMousePos = Create("Frame", SliderBar, { Position = UDim2.new(0,0,0.5,0), Visible = false })

    LabelVal.ClearTextOnFocus = false
    LabelVal.TextEditable = true

    local value = Default

    local function quantize(v)
        v = math.clamp(v, Min, Max)
        if Increase and Increase ~= 0 then
            v = math.floor(v / Increase + 0.5) * Increase
        end
        return v
    end

    local function UpdateLabel(NewValue)
        value = NewValue
        LabelVal.Text = string.format("%.1f", NewValue)
        if Flag then pcall(function() SaveSliderFlag(Flag, NewValue) end) end
        pcall(function() Funcs:FireCallback(Callback, NewValue) end)
    end

    local function AnimateHandle(toScale)
        local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        TweenService:Create(SliderHandle, tweenInfo, { Position = UDim2.new(toScale, 0, 0.5, 0) }):Play()
    end

    local function UpdateValues()
        local scale = SliderHandle.Position.X.Scale
        pcall(function()
            TweenService:Create(Indicator, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = UDim2.new(scale, 0, 1, 0) }):Play()
        end)
        local NewValue = scale * (Max - Min) + Min
        NewValue = quantize(NewValue)
        UpdateLabel(NewValue)
    end

    SliderHolder.MouseButton1Down:Connect(function()
        TweenService:Create(SliderHandle, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { Size = UDim2.new(0, 14, 0, 14) }):Play()
        Container.ScrollingEnabled = false
        while UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
            local mouseX = Player:GetMouse().X
            local rel = (mouseX - BaseMousePos.AbsolutePosition.X) / SliderBar.AbsoluteSize.X
            local clamped = math.clamp(rel, 0, 1)
            AnimateHandle(clamped)
            task.wait()
        end
        TweenService:Create(SliderHandle, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { Size = UDim2.new(0, 16, 0, 16) }):Play()
        Container.ScrollingEnabled = true
        if Flag then SaveSliderFlag(Flag, value) end
    end)

    LabelVal:GetPropertyChangedSignal("Text"):Connect(function()
        UIScale.Scale = 0.3
        CreateTween({UIScale, "Scale", 1.2, 0.1})
        CreateTween({LabelVal, "Rotation", math.random(-1, 1) * 5, 0.15, true})
        CreateTween({UIScale, "Scale", 1, 0.2})
        CreateTween({LabelVal, "Rotation", 0, 0.1})
    end)

    local function SetSlider(NewValue)
        if type(NewValue) ~= "number" then return end
        NewValue = quantize(NewValue)
        UpdateLabel(NewValue)
        local pos = (NewValue - Min) / (Max - Min)
        AnimateHandle(math.clamp(pos, 0, 1))
    end

    do
        local pos = (Default - Min) / (Max - Min)
        SliderHandle.Position = UDim2.new(math.clamp(pos,0,1), 0, 0.5, 0)
        Indicator.Size = UDim2.new(math.clamp(pos,0,1), 0, 1, 0)
        LabelVal.Text = string.format("%.1f", Default)
    end

LabelVal.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local input = tonumber(LabelVal.Text)
            if input then
                if Flag then pcall(function() SaveSliderFlag(Flag, input) end) end
                input = quantize(input)
                LabelVal.Text = string.format("%.1f", input)

                if input ~= value then
                    SetSlider(input)
                else
                    local pos = (input - Min) / (Max - Min)
                    AnimateHandle(math.clamp(pos, 0, 1))
                end
            else
                LabelVal.Text = string.format("%.1f", value)
            end
        end
    end)

    SliderHandle:GetPropertyChangedSignal("Position"):Connect(UpdateValues)

    local Slider = {}
    function Slider:Set(a, b)
        if a and b then LabelFunc:SetTitle(a); LabelFunc:SetDesc(b)
        elseif type(a) == "string" then LabelFunc:SetTitle(a)
        elseif type(a) == "function" then Callback = a
        elseif type(a) == "number" then SetSlider(a)
        end
    end
    function Slider:Callback(...) Funcs:InsertCallback(Callback, ...)(tonumber(value)) end
    function Slider:Visible(...) Funcs:ToggleVisible(Button, ...) end
    function Slider:Destroy() Button:Destroy() end
    return Slider
end

local TextBoxesFile = "textboxes.json"
local function SaveTextBoxFlag(flag, value)
    local data = {}
    if isfile(TextBoxesFile) then
        local ok, existing = pcall(function()
            return HttpService:JSONDecode(readfile(TextBoxesFile))
        end)
        if ok and type(existing) == "table" then
            data = existing
        end
    end

    data[flag] = value

    local ok, encoded = pcall(function()
        return HttpService:JSONEncode(data)
    end)
    if ok then
        writefile(TextBoxesFile, encoded)
    end
end

local function LoadTextBoxFlag(flag)
    if isfile(TextBoxesFile) then
        local ok, existing = pcall(function()
            return HttpService:JSONDecode(readfile(TextBoxesFile))
        end)
        if ok and type(existing) == "table" then
            return existing[flag]
        end
    end
    return nil
end
function Tab:AddTextbox(Configs)
    local TName = Configs[1] or Configs.Name or Configs.Title or "Text Box"
    local TDesc = Configs.Desc or Configs.Description or ""
    local TDefault = Configs[2] or Configs.Default or ""
    local Flag = Configs[6] or Configs.Flag
    local TPlaceholderText = Configs[5] or Configs.PlaceholderText or "Input"
    local TClearText = Configs[3] or Configs.ClearText or false
    local Callback = Funcs:GetCallback(Configs, 4)

    if Flag then
        local saved = LoadTextBoxFlag(Flag)
        if saved ~= nil then
            TDefault = saved
        end
    end

    if Configs.IsMobile and not isMobile then
        return nil
    end

    if Configs.IsPC and not isPC then
        return nil
    end

    if type(TDefault) ~= "string" or TDefault:gsub(" ", ""):len() < 1 then
        TDefault = ""
    end

    local container = Configs.__force_container or Container
    local Button, LabelFunc = ButtonFrame(container, TName, TDesc, UDim2.new(1, -38))

    local SelectedFrame = InsertTheme(Create("Frame", Button, {
        Size = UDim2.new(0, 125, 0, 18),
        Position = UDim2.new(1, -10, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Theme["Color Stroke"]
    }), "Stroke")
    Make("Corner", SelectedFrame, UDim.new(0, 4))

local function updateSelectedFrame2Size()
    local scale = isPC and 0.22 or 0.14
    local mineWidth = isPC and 60 or 50
    local newWidth = math.clamp(Button.AbsoluteSize.X * scale, mineWidth, 125)
    SelectedFrame.Size = UDim2.new(0, newWidth, 0, 18)
end

Button:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateSelectedFrame2Size)
updateSelectedFrame2Size()

    local TextBoxInput = InsertTheme(Create("TextBox", SelectedFrame, {
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamBold,
        TextScaled = true,
        TextColor3 = Theme["Color Text"],
        ClearTextOnFocus = TClearText,
        PlaceholderText = TPlaceholderText,
        Text = TDefault
    }), "Text")

    local Pencil = Create("ImageLabel", SelectedFrame, {
        Size = UDim2.new(0, 12, 0, 12),
        Position = UDim2.new(0, -5, 0.5, 0),
        AnchorPoint = Vector2.new(1, 0.5),
        Image = "rbxassetid://15637081879",
        BackgroundTransparency = 1
    })

    local TextBox = {}

    local function UpdateSize()
        local padding = 20
        local textWidth = TextBoxInput.TextBounds.X
        local minWidth, maxWidth = 60, 300
        local newWidth = math.clamp(textWidth * 0.55 + padding, minWidth, maxWidth)

        TweenService:Create(
            SelectedFrame,
            TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
            {Size = UDim2.new(0, newWidth, 0, 18)}
        ):Play()
    end

    TextBoxInput:GetPropertyChangedSignal("Text"):Connect(UpdateSize)

    TextBoxInput.Focused:Connect(function()
        CreateTween({Pencil, "ImageColor3", Theme["Color Theme"], 0.4})
    end)
    TextBoxInput.FocusLost:Connect(function()
        CreateTween({Pencil, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.4})
    end)

    local function Input()
        local Text = TextBoxInput.Text
        if Text:gsub(" ", ""):len() > 0 then
            if TextBox.OnChanging then
                Text = TextBox.OnChanging(Text) or Text
            end
        if Flag then
            SaveTextBoxFlag(Flag, Text)
        end
            Funcs:FireCallback(Callback, Text)
            TextBoxInput.Text = Text
        end
    end

    TextBoxInput.FocusLost:Connect(Input)
    Input()

    TextBox.OnChanging = false
    function TextBox:Visible(...) Funcs:ToggleVisible(Button, ...) end
    function TextBox:Destroy() Button:Destroy() end

    return TextBox
end
local ColorPickersFile = "colorpickers.json"
local function SaveColorPickerFlag(flag, color: Color3)
	local data = {}
	if isfile(ColorPickersFile) then
		local ok, existing = pcall(function()
			return HttpService:JSONDecode(readfile(ColorPickersFile))
		end)
		if ok and type(existing) == "table" then
			data = existing
		end
	end

	data[flag] = {
		r = color.R,
		g = color.G,
		b = color.B
	}

	local ok, encoded = pcall(function()
		return HttpService:JSONEncode(data)
	end)
	if ok then
		writefile(ColorPickersFile, encoded)
	end
end

local function LoadColorPickerFlag(flag): Color3?
	if isfile(ColorPickersFile) then
		local ok, existing = pcall(function()
			return HttpService:JSONDecode(readfile(ColorPickersFile))
		end)
		if ok and type(existing) == "table" then
			local saved = existing[flag]
			if saved and saved.r and saved.g and saved.b then
				return Color3.new(saved.r, saved.g, saved.b)
			end
		end
	end
	return nil
end
function Tab:AddColorpicker(Configs)
    local TName    = Configs[1] or Configs.Name or Configs.Title or "Color Picker"
    local TDesc    = Configs.Desc or Configs.Description or ""
    local TDefault = Configs[2] or Configs.Default or Color3.fromRGB(255,255,255)
    local Flag = Configs[6] or Configs.Flag
    local Callback = Configs.Callback
 
if Flag then
	local saved = LoadColorPickerFlag(Flag)
	if saved ~= nil then
		TDefault = saved
	end
end

    if Configs.IsMobile and not isMobile then return end
    if Configs.IsPC     and not isPC     then return end
 
   local ColorH, ColorS, ColorV = Color3.toHSV(TDefault)

   local container = Configs.__force_container or Container
   local Frame, LabelFunc = ButtonFrame(container, TName, TDesc, UDim2.new(1, -25, 0, 25))
 
    local ColorBox = InsertTheme(Create("TextButton", Frame, {
        Name = "ColorBox",
        Text = "",
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        TextColor3 = Theme["Color Text"],
        Size = UDim2.new(0, 40, 0, 18),
        Position = UDim2.new(1, -10, 0, 3),
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = TDefault,
        BackgroundTransparency = 0,
    }), "Stroke")
    Make("Corner", ColorBox, UDim.new(0.25, 0))
 
local NoClickFrame = Create("TextButton", CustomColorHolder, {
	Name = "AntiClick",
	Size = UDim2.new(1, 0, 1, 0),
	BackgroundTransparency = 1,
	Text = "",
	ZIndex = 2,
	Visible = false
})

local CustomColorFrame = Create("Frame", NoClickFrame, {
	Size = UDim2.new(0, 260, 0, 160),
	Position = UDim2.new(0.5, 0, 0.5, 0),
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	BackgroundTransparency = 0.1,
	Name = "CustomColorFrame",
	Visible = false,
	ZIndex = 5
})
Make("Corner", CustomColorFrame, UDim.new(0, 6))
Make("Stroke", CustomColorFrame, {
	Color = Color3.fromRGB(80, 80, 80),
	Transparency = 0.3,
	Thickness = 1.5
})
local TopBar = Create("Frame", CustomColorFrame, {
	Size = UDim2.new(1, 0, 0, 25),
	Position = UDim2.new(0, 0, 0, 0),
	BackgroundColor3 = Color3.fromRGB(40, 40, 40),
	BackgroundTransparency = 0.2
})
Make("Corner", TopBar, UDim.new(0, 6))

local TitleLabel = Create("TextLabel", TopBar, {
	Size = UDim2.new(1, -30, 1, 0),
	Position = UDim2.new(0, 10, 0, 0),
	BackgroundTransparency = 1,
	Text = "Custom Color",
	TextColor3 = Color3.fromRGB(240, 240, 240),
	TextSize = 12,
	Font = Enum.Font.GothamSemibold,
	TextXAlignment = Enum.TextXAlignment.Left
})

local CloseButton = Create("TextButton", TopBar, {
    Size = UDim2.new(0, 20, 0, 20),
    Position = UDim2.new(1, -5, 0.5, 0),
    AnchorPoint = Vector2.new(1, 0.5),
    BackgroundColor3 = Color3.fromRGB(200, 50, 50),
    Text = "X",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 14,
    ZIndex = 7,
    AutoButtonColor = false
})
Make("Corner", CloseButton, UDim.new(0, 4))
Make("Stroke", CloseButton, {
	Color = Color3.fromRGB(150, 30, 30),
	Thickness = 1
})

local ColorPreview = Create("Frame", CustomColorFrame, {
	Size = UDim2.new(0, 40, 0, 40),
	Position = UDim2.new(0, 15, 0, 35),
	BackgroundColor3 = TDefault,
	BackgroundTransparency = 0,
	ZIndex = 6
})
Make("Corner", ColorPreview, UDim.new(0, 4))
Make("Stroke", ColorPreview, {
	Color = Color3.fromRGB(100, 100, 100),
	Transparency = 0.4,
	Thickness = 1
})

local ColorCodeBox = Create("TextBox", CustomColorFrame, {
    Name = "ColorCodeBox",
    Size = UDim2.new(0, 120, 0, 22),
    Position = UDim2.new(0, 65, 0, 35),
    BackgroundColor3 = Color3.fromRGB(45, 45, 45),
    TextColor3 = Color3.fromRGB(230, 230, 230),
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
    ClearTextOnFocus = false,
    ZIndex = 6,
    Text = "",
    PlaceholderText = "HEX Color Code",
    PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
})
Make("Corner", ColorCodeBox, UDim.new(0, 4))
Make("Stroke", ColorCodeBox, {
	Color = Color3.fromRGB(70, 70, 70),
	Thickness = 1
})

ColorCodeBox.Text = LoadFlagValue("ColorCodeBoxText") or ""
ColorCodeBox.FocusLost:Connect(function()
    SaveFlagValue("ColorCodeBoxText", ColorCodeBox.Text)
end)

local ColorCodeBoxUD = Create("TextBox", CustomColorFrame, {
    Name = "ColorCodeBoxUD",
    Size = UDim2.new(0, 120, 0, 22),
    Position = UDim2.new(0, 65, 0, 65),
    BackgroundColor3 = Color3.fromRGB(45, 45, 45),
    TextColor3 = Color3.fromRGB(230, 230, 230),
    Font = Enum.Font.Gotham,
    TextSize = 13,
    TextXAlignment = Enum.TextXAlignment.Left,
    ClearTextOnFocus = false,
    ZIndex = 6,
    Text = "",
    PlaceholderText = "RGB Values",
    PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
})
Make("Corner", ColorCodeBoxUD, UDim.new(0, 4))
Make("Stroke", ColorCodeBoxUD, {
	Color = Color3.fromRGB(70, 70, 70),
	Thickness = 1
})

ColorCodeBoxUD.Text = LoadFlagValue("ColorCodeBoxUDText") or ""
ColorCodeBoxUD.FocusLost:Connect(function()
    SaveFlagValue("ColorCodeBoxUDText", ColorCodeBoxUD.Text)
end)

local ColorCanvas = Create("Frame", CustomColorFrame, {
    Name = "ColorCanvas",
    Size = UDim2.new(0, 150, 0, 100),
    Position = UDim2.new(0, 15, 0, 95),
    BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1),
    BackgroundTransparency = 0,
    ZIndex = 6
})
Make("Corner", ColorCanvas, UDim.new(0, 4))
Make("Stroke", ColorCanvas, {
	Color = Color3.fromRGB(70, 70, 70),
	Thickness = 1
})

local satImage = Create("ImageLabel", ColorCanvas, {
    Name = "SaturationValueImage",
    Size = UDim2.new(1, 0, 1, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    BackgroundTransparency = 1,
    Image = "rbxassetid://4155801252",
    ScaleType = Enum.ScaleType.Stretch,
    ZIndex = 8
})
Make("Corner", satImage, UDim.new(0, 3.99))

local ColorSelection = Create("ImageLabel", ColorCanvas, {
    Name = "ColorSelection",
    Size = UDim2.new(0, 14, 0, 14),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(ColorS, 0, 1 - ColorV, 0),
    BackgroundTransparency = 1,
    Image = "rbxassetid://4805639000",
    ZIndex = 9,
    ImageColor3 = Color3.fromRGB(255, 255, 255)
})
Make("Corner", ColorSelection)

local HueBar = Create("Frame", CustomColorFrame, {
    Name = "HueBar",
    Size = UDim2.new(0, 18, 0, 100),
    Position = UDim2.new(1, -30, 0, 95),
    BackgroundTransparency = 0,
    ZIndex = 8
})
Make("Corner", HueBar, UDim.new(0, 4))
Make("Stroke", HueBar, {
	Color = Color3.fromRGB(70, 70, 70),
	Thickness = 1
})

local HueGradient = Create("UIGradient", HueBar, {
    Rotation = 270,
    Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0,   Color3.fromRGB(255,   0,   4)),
        ColorSequenceKeypoint.new(0.2, Color3.fromRGB(234, 255,   0)),
        ColorSequenceKeypoint.new(0.4, Color3.fromRGB( 21, 255,   0)),
        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(  0, 255, 255)),
        ColorSequenceKeypoint.new(0.8, Color3.fromRGB(  0,  17, 255)),
        ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255,   0, 251)),
        ColorSequenceKeypoint.new(1,   Color3.fromRGB(255,   0,   4)),
    }
})

local HueSelection = Create("ImageLabel", HueBar, {
    Name = "HueSelection",
    Size = UDim2.new(0, 16, 0, 16),
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.new(0.5, 0, 1 - ColorH, 0),
    BackgroundTransparency = 1,
    Image = "rbxassetid://4805639000",
    ZIndex = 9,
    ImageColor3 = Color3.fromRGB(255, 255, 255)
})
Make("Corner", HueSelection)

local RandomButton = Create("ImageButton", TopBar, {
    Name = "RandomButton",
    Size = UDim2.new(0, 20, 0, 20),
    Position = UDim2.new(1, -30, 0.5, 0),
    AnchorPoint = Vector2.new(1, 0.5),
    BackgroundTransparency = 1,
    Image = "rbxassetid://7484765651",
    ScaleType = Enum.ScaleType.Fit,
    ZIndex = 8
})
Make("Corner", RandomButton, UDim.new(0, 3))
Make("Stroke", RandomButton, {
    Color = Color3.fromRGB(100, 100, 100),
    Thickness = 1
})

    local Arrow = Create("ImageLabel", ColorBox, {
        Size = UDim2.new(0, 12, 0, 12),
        Position = UDim2.new(0, 13, 0.5, 0),
        AnchorPoint = Vector2.new(0, 0.5),
        Image = "rbxassetid://10709791523",
        Rotation = -90,
        BackgroundTransparency = 1,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ZIndex = 6
    })

local PresetsList = Create("ScrollingFrame", Frame, {
    Size = UDim2.new(1, -140, 0, 32),
    Position = UDim2.new(0, 87, -0.2, 0),
    BackgroundTransparency = 1,
    ScrollBarThickness = 7,
    ScrollBarImageTransparency = 0.7,
    ScrollBarImageColor3 = Theme["Color Theme"],
    ScrollingDirection = "X" 
})
Make("Corner", PresetsList, UDim.new(0, 4))
InsertTheme(PresetsList, "Stroke")

CloseButton.Activated:Connect(function()
     CloseButton.Visible = false
     ColorPreview.Visible = false
     TopBar.Visible = false
     ColorCodeBox.Visible = false
     ColorCodeBoxUD.Visible = false
     ColorCanvas.Visible = false
     ColorSelection.Visible = false
     HueBar.Visible = false
     HueSelection.Visible = false
    CreateTween({CustomColorFrame, "Size", UDim2.new(0, 260, 0, 0), 0.25})
    task.delay(0.2, function()
        CustomColorFrame.Visible = false
        NoClickFrame.Visible = false
    end)
end)

PresetsList.ScrollingDirection = Enum.ScrollingDirection.X
PresetsList.ClipsDescendants = true

local ListLayout = Create("UIListLayout", PresetsList, {
    FillDirection = Enum.FillDirection.Horizontal,
    HorizontalAlignment = Enum.HorizontalAlignment.Left,
    VerticalAlignment = Enum.VerticalAlignment.Center,
    SortOrder = Enum.SortOrder.LayoutOrder,
    Padding = UDim.new(0, 5)
})

ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    PresetsList.CanvasSize = UDim2.new(0, ListLayout.AbsoluteContentSize.X + 6, 0, 0)
end)

local presetColors = {
    "Rainbow",
    Color3.fromRGB(255, 255, 255), -- White
    Color3.fromRGB(  0,   0,   0), -- Black
    Color3.fromRGB(255,   0,   0), -- Red
    Color3.fromRGB(255, 242,   0), -- Yellow
    Color3.fromRGB(  0, 162, 232), -- Blue
    Color3.fromRGB(128,   0, 128), -- Purple
    Color3.fromRGB(  0, 255, 127), -- Spring Green
    Color3.fromRGB(255, 105, 180), -- Hot Pink
    Color3.fromRGB(255, 140,   0), -- Orange
    Color3.fromRGB( 75,   0, 130), -- Indigo
    Color3.fromRGB( 64, 224, 208), -- Turquoise
}

local RunS = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local isCooldown = false
local WaitClick  = false
local ScrollSize = 0

local function rgbToHex(c)
    local r = math.floor(c.R * 255)
    local g = math.floor(c.G * 255)
    local b = math.floor(c.B * 255)
    return string.format("#%02X%02X%02X", r, g, b)
end

local function rgbToRGBString(color)
    local r = math.floor(color.R * 255)
    local g = math.floor(color.G * 255)
    local b = math.floor(color.B * 255)
    return string.format("(%d, %3d, %3d)", r, g, b)
end

local function hexToColor3(hex)
	if hex:sub(1,1) == "#" then hex = hex:sub(2) end
	if #hex ~= 6 then return nil end
	local r = tonumber(hex:sub(1,2), 16)
	local g = tonumber(hex:sub(3,4), 16)
	local b = tonumber(hex:sub(5,6), 16)
	if not (r and g and b) then return nil end
	return Color3.fromRGB(r, g, b)
end

local function rgbStringToColor3(text)
	local r, g, b = text:match("%(?%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%)?")
	r, g, b = tonumber(r), tonumber(g), tonumber(b)
	if not (r and g and b) then return nil end
	if r > 255 or g > 255 or b > 255 then return nil end
	return Color3.fromRGB(r, g, b)
end

local function updateColor()
    ColorCanvas.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
    local newC = Color3.fromHSV(ColorH, ColorS, ColorV)
    ColorBox.BackgroundColor3 = newC
    ColorPreview.BackgroundColor3 = newC
    ColorCodeBox.Text = rgbToHex(newC)
    ColorCodeBoxUD.Text = rgbToRGBString(newC)
    if Flag then
        SaveColorPickerFlag(Flag, newC)
    end
    Callback(newC)
end

ColorCodeBox.FocusLost:Connect(function()
	local newColor = hexToColor3(ColorCodeBox.Text)
	if newColor then
		local h, s, v = Color3.toHSV(newColor)
		ColorH, ColorS, ColorV = h, s, v
		updateColor()
        ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
	end
end)

ColorCodeBoxUD.FocusLost:Connect(function()
	local newColor = rgbStringToColor3(ColorCodeBoxUD.Text)
	if newColor then
		local h, s, v = Color3.toHSV(newColor)
		ColorH, ColorS, ColorV = h, s, v
		updateColor()
        ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
	end
end)

ColorCanvas.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local function updateColorCanvas()
            local inputPosition = input.Position or UserInputService:GetMouseLocation()
            local relativeX = inputPosition.X - ColorCanvas.AbsolutePosition.X
            local relativeY = inputPosition.Y - ColorCanvas.AbsolutePosition.Y
            local x = math.clamp(relativeX / ColorCanvas.AbsoluteSize.X, 0, 1)
            local y = math.clamp(relativeY / ColorCanvas.AbsoluteSize.Y, 0, 1)
            ColorSelection.Position = UDim2.new(x, 0, y, 0)
            ColorS = x
            ColorV = 1 - y
            updateColor()
        end

        updateColorCanvas()

        local updateConnection
        local function stopUpdating()
            if updateConnection and updateConnection.Connected then
                updateConnection:Disconnect()
                updateConnection = nil
            end
        end

        updateConnection = UserInputService.InputChanged:Connect(function(changedInput)
            if (changedInput.UserInputType == Enum.UserInputType.MouseMovement or 
                changedInput.UserInputType == Enum.UserInputType.Touch) and 
               (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or
                UserInputService:IsTouchPressed()) then
                
                local inputPosition = changedInput.Position or UserInputService:GetMouseLocation()
                local relativeX = inputPosition.X - ColorCanvas.AbsolutePosition.X
                local relativeY = inputPosition.Y - ColorCanvas.AbsolutePosition.Y
                local x = math.clamp(relativeX / ColorCanvas.AbsoluteSize.X, 0, 1)
                local y = math.clamp(relativeY / ColorCanvas.AbsoluteSize.Y, 0, 1)
                ColorSelection.Position = UDim2.new(x, 0, y, 0)
                ColorS = x
                ColorV = 1 - y
                updateColor()
            end
        end)

        local endConnection = UserInputService.InputEnded:Connect(function(endInput)
            if endInput.UserInputType == Enum.UserInputType.MouseButton1 or 
               endInput.UserInputType == Enum.UserInputType.Touch then
                stopUpdating()
                if endConnection and endConnection.Connected then
                    endConnection:Disconnect()
                end
            end
        end)
    end
end)

HueBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        local function updateHueBar()
            local inputPosition = input.Position or UserInputService:GetMouseLocation()
            local relativeY = inputPosition.Y - HueBar.AbsolutePosition.Y
            local y = math.clamp(relativeY / HueBar.AbsoluteSize.Y, 0, 1)
            HueSelection.Position = UDim2.new(0.5, 0, y, 0)
            ColorH = 1 - y
            updateColor()
        end

        updateHueBar()

        local updateConnection
        local function stopUpdating()
            if updateConnection and updateConnection.Connected then
                updateConnection:Disconnect()
                updateConnection = nil
            end
        end

        updateConnection = UserInputService.InputChanged:Connect(function(changedInput)
            if (changedInput.UserInputType == Enum.UserInputType.MouseMovement or 
                changedInput.UserInputType == Enum.UserInputType.Touch) and 
               (UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or
                UserInputService:IsTouchPressed()) then
                
                local inputPosition = changedInput.Position or UserInputService:GetMouseLocation()
                local relativeY = inputPosition.Y - HueBar.AbsolutePosition.Y
                local y = math.clamp(relativeY / HueBar.AbsoluteSize.Y, 0, 1)
                HueSelection.Position = UDim2.new(0.5, 0, y, 0)
                ColorH = 1 - y
                updateColor()
            end
        end)

        local endConnection = UserInputService.InputEnded:Connect(function(endInput)
            if endInput.UserInputType == Enum.UserInputType.MouseButton1 or 
               endInput.UserInputType == Enum.UserInputType.Touch then
                stopUpdating()
                if endConnection and endConnection.Connected then
                    endConnection:Disconnect()
                end
            end
        end)
    end
end)

local function GetCustomFrameSize()
    return UDim2.fromOffset(CustomColorFrame.Size.X.Offset, ScrollSize)
end

local function CalculateCustomColorPos()
	local BoxPos = ColorBox.AbsolutePosition
	local ScreenSize = ScreenGui.AbsoluteSize

	local offsetY = 35

	local anchorY = (BoxPos.Y > ScreenSize.Y / 1.4) and 1 or 0
	local anchorX = (BoxPos.X > ScreenSize.X / 2) and 1 or 0

	local adjustedY = (anchorY == 1)
		and (BoxPos.Y - offsetY)
		or  (BoxPos.Y + offsetY)

	local ClampX = math.clamp(BoxPos.X / UIScale, 0, ScreenSize.X / UIScale - CustomColorFrame.Size.X.Offset)
	local ClampY = math.clamp(adjustedY / UIScale, 0, ScreenSize.Y / UIScale - CustomColorFrame.Size.Y.Offset)

	local NewPos = UDim2.fromOffset(ClampX, ClampY)

	CustomColorFrame.AnchorPoint = Vector2.new(anchorX, anchorY)
	CreateTween({CustomColorFrame, "Position", NewPos, 0.1})
end

local buttons = {}
local isCooldown = false
 
local Colorpicker = {
    Value = TDefault,
    Type = "Colorpicker"
}

local cooldownTime = .6
local lastActionTime = 0

local function closeColors()
if tick() - lastActionTime < cooldownTime then
    return
end
lastActionTime = tick()

    local total = #buttons
    for k = 1, total do
        local idx = total - k + 1
        local b = buttons[idx]

        delay((k-1) * 0.05, function()
            CreateTween({b, "Size", UDim2.new(0, 0, 0, 8), 0.1})
            CreateTween({b, "BackgroundTransparency", 1, 0.2})
            delay(0.2, function()
                if b and b.Parent then
                    b:Destroy()
                end
            end)
        end)
    end

    delay((#buttons-1) * 0.05 + 0.2, function()
        buttons = {}
        PresetsList.Visible = false
    end)
end

local function openColors()

if tick() - lastActionTime < cooldownTime then
    return
end
lastActionTime = tick()

    if #buttons > 0 then return end

    buttons = {}
    PresetsList.Visible = true

    for i, col in ipairs(presetColors) do
        local btn = Create("TextButton", PresetsList, {
            Name = "ChooseColor" .. i,
            Size = UDim2.new(0, 15, 0, 18),
            BackgroundColor3 = (typeof(col) == "string") and Color3.new(1,1,1) or col,
            BackgroundTransparency = 1,
            Text = "",
            BorderSizePixel = 0,
            ZIndex = 5,
            LayoutOrder = i
        })

        Make("Corner", btn, UDim.new(0.25, 0))

        if col == "Rainbow" then
            local gradient = Instance.new("UIGradient")
            gradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 165, 0)),
                ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),
                ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 0)),
                ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 127, 255)),
                ColorSequenceKeypoint.new(0.83, Color3.fromRGB(139, 0, 255)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 255)),
            })
            gradient.Rotation = 45
            gradient.Parent = btn

            btn.Activated:Connect(function()
                CalculateCustomColorPos()
                ColorCodeBox.Visible = false
                ColorPreview.Visible = false
                TopBar.Visible = false
                CloseButton.Visible = false
                ColorCodeBoxUD.Visible = false
                ColorCanvas.Visible = false
                ColorSelection.Visible = false
                HueBar.Visible = false
                HueSelection.Visible = false
                
                if isCooldown then return end
                isCooldown = true
                WaitClick = true

                if NoClickFrame.Visible then
                    CreateTween({CustomColorFrame, "Size", UDim2.new(0, 260, 0, 0), 0.25})
                    task.delay(0.2, function()
                        CustomColorFrame.Visible = false
                        NoClickFrame.Visible = false
                        isCooldown = false
                        WaitClick = false
                    end)
                else
                    CustomColorFrame.Size = UDim2.new(0, 260, 0, 0)
                    CloseButton.Visible = true
                    CustomColorFrame.Visible = true
                    NoClickFrame.Visible = true
                    ColorCodeBox.Visible = true
                    ColorPreview.Visible = true
                    TopBar.Visible = true
                    ColorCodeBoxUD.Visible = true
                    ColorCanvas.Visible = true
                    ColorSelection.Visible = true
                    HueBar.Visible = true
                    HueSelection.Visible = true
                    CreateTween({CustomColorFrame, "Size", UDim2.new(0, 200, 0, 200), 0.25})
                    task.delay(0.2, function()
                        isCooldown = false
                        WaitClick = false
                    end)
                end
            end)
        else
            btn.Activated:Connect(function()
                if Flag then SaveColorPickerFlag(Flag, col) end
                Colorpicker:SetColor(col)
    local h, s, v = Color3.toHSV(col)
    ColorH, ColorS, ColorV = h, s, v
    
    ColorPreview.BackgroundColor3 = col
    ColorBox.BackgroundColor3 = col
    ColorCodeBox.Text = rgbToHex(col)
    ColorCodeBoxUD.Text = rgbToRGBString(col)
    ColorCanvas.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
    ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
    HueSelection.Position = UDim2.new(0.5, 0, 1 - ColorH, 0)

            end)
        end

        table.insert(buttons, btn)

        delay((i - 1) * 0.05, function()
            CreateTween({btn, "Size", UDim2.new(0, 15, 0, 13), 0.2})
            CreateTween({btn, "BackgroundTransparency", 0, 0.2})
        end)
    end
end

local function updateRandomButtonHover(isHovering)
    if isHovering then
        RandomButton.ImageColor3 = Color3.fromRGB(230, 230, 230)
        RandomButton.Stroke.Color = Color3.fromRGB(150, 150, 150)
    else
        RandomButton.ImageColor3 = Color3.fromRGB(200, 200, 200)
        RandomButton.Stroke.Color = Color3.fromRGB(100, 100, 100)
    end
end

RandomButton.MouseButton1Click:Connect(function()
    if isRainbowActive then
        stopRainbowEffect()
    end
    
    local randomColor = Color3.new(math.random(), math.random(), math.random())
    
    local h, s, v = Color3.toHSV(randomColor)
    ColorH, ColorS, ColorV = h, s, v
    
    ColorPreview.BackgroundColor3 = randomColor
    ColorBox.BackgroundColor3 = randomColor
    ColorCodeBox.Text = rgbToHex(randomColor)
    ColorCodeBoxUD.Text = rgbToRGBString(randomColor)
    ColorCanvas.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
    ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
    HueSelection.Position = UDim2.new(0.5, 0, 1 - ColorH, 0)
    
    if typeof(Callback) == "function" then
        Callback(randomColor)
    end
    
    if Flag then
        SaveColorPickerFlag(Flag, randomColor)
    end
end)

RandomButton.MouseEnter:Connect(function()
    updateRandomButtonHover(true)
end)
RandomButton.MouseLeave:Connect(function()
    updateRandomButtonHover(false)
end)

ColorBox.Activated:Connect(function()
        if isCooldown then return end
        isCooldown = true

    local isOpen = #buttons > 0

    if isOpen then
        closeColors()
        CreateTween({Arrow, "Rotation", -90, 0.25})
        CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.25})
    else
        openColors()
        CreateTween({Arrow, "Rotation", 90, 0.25})
        CreateTween({Arrow, "ImageColor3", Theme["Color Theme"], 0.25})
    end

    task.delay(0.3, function()
        isCooldown = false
    end)
end)

    Frame.Activated:Connect(function()
        if isCooldown then return end
        isCooldown = true

        local isOpen = buttons[1] and buttons[1].Parent
 
        if isOpen then
            closeColors()
            CreateTween({Arrow, "Rotation", -90, 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out})
            CreateTween({Arrow, "ImageColor3", Color3.fromRGB(255, 255, 255), 0.25})
        else
            openColors()
            CreateTween({Arrow, "Rotation", 90, 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out})
            CreateTween({Arrow, "ImageColor3", Theme["Color Theme"], 0.25})
        end
 
        task.delay(0.3, function()
            isCooldown = false
        end)
    end)
 
function Colorpicker:Set(Value)
    self.Value = Value
    ColorBox.BackgroundColor3 = Value
    if typeof(Callback) == "function" then
        Callback(Value)
    end
end
 
function Colorpicker:SetColor(col)
    self:Set(col)
end

function Colorpicker:Destroy()
    Frame:Destroy()
end
 
function Colorpicker:Visible(state)
    Frame.Visible = state
end
 
function Colorpicker:Callback(fn)
    if typeof(fn) == "function" then
        Callback = fn
    end
end
    return Colorpicker
end
		function Tab:AddDiscordInvite(Configs)
			local Title = Configs[1] or Configs.Name or Configs.Title or "Discord"
			local Desc = Configs.Desc or Configs.Description or ""
			local Logo = Configs[2] or Configs.Logo or ""
			local Invite = Configs[3] or Configs.Invite or ""
			
			local InviteHolder = Create("Frame", Container, {
				Size = UDim2.new(1, 0, 0, 80),
				Name = "Option",
				BackgroundTransparency = 1
			})
			
			local InviteLabel = Create("TextLabel", InviteHolder, {
				Size = UDim2.new(1, 0, 0, 15),
				Position = UDim2.new(0, 5),
				TextColor3 = Color3.fromRGB(40, 150, 255),
				Font = Enum.Font.GothamBold,
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextSize = 10,
				Text = Invite
			})
			
			local FrameHolder = InsertTheme(Create("Frame", InviteHolder, {
				Size = UDim2.new(1, 0, 0, 65),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1),
				BackgroundColor3 = Theme["Color Hub 2"]
			}), "Frame")Make("Corner", FrameHolder)
			
			local ImageLabel = Create("ImageLabel", FrameHolder, {
				Size = UDim2.new(0, 30, 0, 30),
				Position = UDim2.new(0, 7, 0, 7),
				Image = Logo,
				BackgroundTransparency = 1
			})Make("Corner", ImageLabel, UDim.new(0, 4))Make("Stroke", ImageLabel)
			
			local LTitle = InsertTheme(Create("TextLabel", FrameHolder, {
				Size = UDim2.new(1, -52, 0, 15),
				Position = UDim2.new(0, 44, 0, 7),
				Font = Enum.Font.GothamBold,
				TextColor3 = Theme["Color Text"],
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextSize = 10,
				Text = Title
			}), "Text")
			
			local LDesc = InsertTheme(Create("TextLabel", FrameHolder, {
				Size = UDim2.new(1, -52, 0, 0),
				Position = UDim2.new(0, 44, 0, 22),
				TextWrapped = "Y",
				AutomaticSize = "Y",
				Font = Enum.Font.Gotham,
				TextColor3 = Theme["Color Dark Text"],
				TextXAlignment = "Left",
				BackgroundTransparency = 1,
				TextSize = 8,
				Text = Desc
			}), "DarkText")
			
			local JoinButton = Create("TextButton", FrameHolder, {
				Size = UDim2.new(1, -14, 0, 16),
				AnchorPoint = Vector2.new(0.5, 1),
				Position = UDim2.new(0.5, 0, 1, -7),
				Text = "Join",
				Font = Enum.Font.GothamBold,
				TextSize = 12,
				TextColor3 = Color3.fromRGB(220, 220, 220),
				BackgroundColor3 = Color3.fromRGB(50, 150, 50)
			})Make("Corner", JoinButton, UDim.new(0, 5))
			
			local ClickDelay
			JoinButton.Activated:Connect(function()
				setclipboard(Invite)
				if ClickDelay then return end
				
				ClickDelay = true
				SetProps(JoinButton, {
					Text = "Copied to Clipboard",
					BackgroundColor3 = Color3.fromRGB(100, 100, 100),
					TextColor3 = Color3.fromRGB(150, 150, 150)
				})task.wait(5)
				SetProps(JoinButton, {
					Text = "Join",
					BackgroundColor3 = Color3.fromRGB(50, 150, 50),
					TextColor3 = Color3.fromRGB(220, 220, 220)
				})ClickDelay = false
			end)
			
			local DiscordInvite = {}
			function DiscordInvite:Destroy() InviteHolder:Destroy() end
			function DiscordInvite:Visible(...) Funcs:ToggleVisible(InviteHolder, ...) end
			return DiscordInvite
		end

-- local SettingTab

Tab:AddSection({
    Name = "Settings",
    __force_container = SettingTab
})

local uiSizeMode = "Medium"

local customUIsize = 600

local function mobileOffset()
    return isMobile and -200 or 0
end

Tab:AddDropdown({
    Name = "UI Size",
    Options = {"Small", "Medium", "Large", "Custom"},
    Default = "Medium",
    Flag = "UISize",
    Callback = function(v)
        uiSizeMode = v
        local offset = mobileOffset()

        if v == "Small" then
            splib:SetScale(700 + offset)

        elseif v == "Medium" then
            splib:SetScale(600 + offset)

        elseif v == "Large" then
            splib:SetScale(500 + offset)

        elseif v == "Custom" then
            splib:SetScale(customUIsize + offset)
        end
    end,
    __force_container = SettingTab
})

Tab:AddSlider({
    Name = "Custom Size",
    Min = 450,
    Max = 800,
    Increment = 5,
    Default = customUIsize,
    Flag = "CustomUISize",
    Callback = function(value)
        customUIsize = value
        if uiSizeMode == "Custom" then
            splib:SetScale(customUIsize + mobileOffset())
        end
    end,
   __force_container = SettingTab
})

Tab:AddDropdown({
    Name = "UI Theme",
    Options = {"Red", "Darker", "Dark", "Purple","NeonBlue", "Sunset", "Ocean", "RoseGold", "Matrix", "Green", "Orange", "Pink", "Gold", "Cyan"},
    Default = splib.Save.Theme or "Red",
    Callback = function(selectedTheme)
        splib:SetTheme(selectedTheme)
        splib.Save.Theme = selectedTheme
        SaveJson("sp library.json", splib.Save)
    end,
    __force_container = SettingTab
})

Tab:AddToggle({
  Name = "Toggle UI Icon Protection",
  Default = true,
  Flag = "UIProtection",
  Callback = function(enabled)
    if enabled then
      checkBounds()
      enableBoundaryProtection()
    else
      disableBoundaryProtection()
    end
  end,
    __force_container = SettingTab
})

Tab:AddToggle({
    Name = "Sidebar Hover Expand",
    Flag = "SidebarHover",
    Default = true,
    IsPC = true,
    Callback = function(enabled)
        if enabled then
            enableSidebarHover()
            tweenControlSizeX(minClamp)
        else
            disableSidebarHover()
        end
    end,
    __force_container = SettingTab
})

Tab:AddToggle({
    Name = "Sidebar Hover Expand",
    Flag = "SidebarHoverMobile",
    Default = true,
    IsMobile = true,
    Callback = function(enabled)
        if enabled then
            tweenControlSizeX(minClamp)
        else
            tweenControlSizeX(expandedSizeX)
        end
    end,
    __force_container = SettingTab
})

Tab:AddSection({
    Name = "UI",
    __force_container = SettingTab
})

local rainbowStroke

rainbowStroke = Make("Stroke", MainFrame, {
    Thickness = 2
})

local rainbowColors = {
    Red = Color3.fromRGB(255, 0, 0),
    Orange = Color3.fromRGB(255, 165, 0),
    Yellow = Color3.fromRGB(255, 255, 0),
    Green = Color3.fromRGB(0, 255, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Purple = Color3.fromRGB(128, 0, 128),
    Pink = Color3.fromRGB(255, 105, 180),
    Cyan = Color3.fromRGB(0, 255, 255),
    White = Color3.fromRGB(255, 255, 255),
    Black = Color3.fromRGB(0, 0, 0)
}

task.spawn(function()
    while rainbowStroke and rainbowStroke.Parent do
        local t = tick() * 0.5
        local r = math.sin(t) * 0.5 + 0.5
        local g = math.sin(t + 2) * 0.5 + 0.5
        local b = math.sin(t + 4) * 0.5 + 0.5
        rainbowStroke.Color = Color3.new(r, g, b)
        task.wait()
    end
end)

Tab:AddToggle({
    Name = "Rainbow MainFrame",
    Flag = "RainbowMainFrame",
    Default = RainbowMainFrameDefault,
    Callback = function(enabled)
        rainbowStroke.Transparency = enabled and 0 or 1
    end,
    __force_container = SettingTab
})

local SubTitle = Title:FindFirstChild("SubTitle")

local titleRainbowEnabled = false
local subtitleRainbowEnabled = false

task.spawn(function()
    while true do
        local t = tick() * 0.5
        local r = math.sin(t) * 0.5 + 0.5
        local g = math.sin(t + 2) * 0.5 + 0.5
        local b = math.sin(t + 4) * 0.5 + 0.5
        local rainbowColor = Color3.new(r, g, b)

        if titleRainbowEnabled and Title then
            Title.TextColor3 = rainbowColor
        end

        if subtitleRainbowEnabled and SubTitle then
            SubTitle.TextColor3 = rainbowColor
        end

        task.wait()
    end
end)

Tab:AddToggle({
    Name = "Rainbow Title",
    Flag = "RainbowTitle",
    Default = RainbowTitleDefault,
    Callback = function(enabled)
        titleRainbowEnabled = enabled
        if not enabled and Title then
            Title.TextColor3 = Theme["Color Text"]
        end
    end,
    __force_container = SettingTab
})

Tab:AddToggle({
    Name = "Rainbow SubTitle",
    Flag = "RainbowSubTitle",
    Default = RainbowSubTitleDefault,
    Callback = function(enabled)
        subtitleRainbowEnabled = enabled
        if not enabled and SubTitle then
            SubTitle.TextColor3 = Theme["Color Dark Text"]
        end
    end,
    __force_container = SettingTab
})

		return Tab
	end
	MinimizeButton.Activated:Connect(Window.MinimizeBtn)
	return Window
end

return splib
