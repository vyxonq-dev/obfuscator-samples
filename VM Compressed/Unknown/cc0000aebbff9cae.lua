local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local marketService = game:GetService("MarketplaceService")
local ContentProvider = game:GetService("ContentProvider")

local function GenerateKey()
	local chars = "ابتثجحخدذرزسشصضطظعغفقكلمنهويABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
	local length = math.random(7, 16)
	local name = ""
	for i = 1, length do
		local rand = math.random(1, #chars)
		name = name .. string.sub(chars, rand, rand)
	end
	return name
end

local Colors = {
	Black = Color3.fromRGB(16, 16, 16),
	Header = Color3.fromRGB(21, 21, 21),
	Section = Color3.fromRGB(24, 24, 24),
	Accent = Color3.fromRGB(255, 106, 133),
	Border = Color3.fromRGB(29, 29, 29),
	Text = Color3.fromRGB(255, 255, 255),
	Muted = Color3.fromRGB(150, 150, 150),
	Select = Color3.fromRGB(30, 30, 30),
	Green = Color3.fromRGB(150, 255, 150),
	Red = Color3.fromRGB(255, 100, 100),
	Purple = Color3.fromRGB(180, 120, 255)
}

local FontSB = Font.new('rbxasset://fonts/families/GothamSSm.json', Enum.FontWeight.SemiBold)

local function Tween(obj, props, t, style)
	local tween = TweenService:Create(obj, TweenInfo.new(t or 0.35, style or Enum.EasingStyle.Quint), props)
	tween:Play()
	return tween
end

local function ApplyShadow(parent)
	local s = Instance.new("ImageLabel", parent)
	s.Name = GenerateKey()
	s.AnchorPoint, s.BackgroundTransparency, s.Position = Vector2.new(0.5, 0.5), 1, UDim2.new(0.5, 0, 0.5, 0)
	s.Size = UDim2.new(1, 47, 1, 47)
	s.Image, s.ImageColor3, s.ImageTransparency = "rbxassetid://6014261993", Color3.new(0, 0, 0), 0.75
	s.ScaleType, s.SliceCenter = Enum.ScaleType.Slice, Rect.new(49, 49, 450, 450)
	s.ZIndex = parent.ZIndex - 1
	return s
end

local StatusURL = "https://raw.githubusercontent.com/123hoipopper13r6/NeverHit.lua/refs/heads/main/Game-Support/Status.lua"
local StatusCache = {}
local IconCache = {}
local GameRegistry = {}
local DataReady = false

local function GetStatusColor(text)
	local t = text:lower()
	if t:find("working") or t:find("ok") then
		return Colors.Green
	elseif t:find("not working") or t:find("broken") then
		return Colors.Red
	elseif t:find("dev") or t:find("development") then
		return Colors.Purple
	end
	return Colors.Muted
end

task.spawn(function()
	local ok, res = pcall(function() return game:HttpGet(StatusURL) end)
	if ok then
		for key, status in res:gmatch("([%w%d]+)%s*=%s*\"([^\"]+)\"") do
			StatusCache[key] = status
		end
	end
	DataReady = true
end)

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = GenerateKey()

local Main = Instance.new("CanvasGroup", ScreenGui)
Main.Name = GenerateKey()
Main.AnchorPoint, Main.Position = Vector2.new(0.5, 0.5), UDim2.new(0.5, 0, 0.5, 0)
Main.Size, Main.BackgroundColor3, Main.BorderSizePixel = UDim2.new(0, 560, 0, 340), Colors.Black, 0
Main.GroupTransparency = 1
local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 2)
local MainShadow = ApplyShadow(Main)
MainShadow.ImageTransparency = 1

local function CircleClose()
	Tween(MainShadow, {ImageTransparency = 1}, 0.4, Enum.EasingStyle.Linear)
	Tween(MainCorner, {CornerRadius = UDim.new(1, 0)}, 0.4, Enum.EasingStyle.Linear)
	local closeTween = Tween(Main, {Size = UDim2.new(0, 0, 0, 0), GroupTransparency = 1}, 0.4, Enum.EasingStyle.Linear)
	closeTween.Completed:Wait()
	ScreenGui:Destroy()
end

local ContentFrame = Instance.new("Frame", Main)
ContentFrame.Name = GenerateKey()
ContentFrame.Size = UDim2.new(1, 0, 1, 0)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Visible = false

local LoadingLabel = Instance.new("TextLabel", Main)
LoadingLabel.Name = GenerateKey()
LoadingLabel.Size = UDim2.new(1, 0, 1, 0)
LoadingLabel.BackgroundTransparency = 1
LoadingLabel.FontFace = FontSB
LoadingLabel.TextColor3 = Colors.Muted
LoadingLabel.TextSize = 14
LoadingLabel.Text = "LOADING ASSETS..."

local Header = Instance.new("Frame", ContentFrame)
Header.Name = GenerateKey()
Header.Size, Header.BackgroundColor3, Header.BorderSizePixel = UDim2.new(1, 0, 0, 40), Colors.Header, 0
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 2)

local Line = Instance.new("Frame", Header)
Line.Name = GenerateKey()
Line.AnchorPoint, Line.Position, Line.Size = Vector2.new(0, 1), UDim2.new(0, 0, 1, 0), UDim2.new(1, 0, 0, 1)
Line.BackgroundColor3, Line.BorderSizePixel = Colors.Border, 0

local Title = Instance.new("TextLabel", Header)
Title.Name = GenerateKey()
Title.Position, Title.Size, Title.BackgroundTransparency = UDim2.new(0, 15, 0, 0), UDim2.new(0, 300, 1, 0), 1
Title.FontFace, Title.TextSize = FontSB, 17
Title.RichText = true
Title.Text = '<font color="#ffffff">NEVERHIT</font><font color="#ff6a85">.LUA</font>'
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("ImageButton", Header)
CloseBtn.Name = GenerateKey()
CloseBtn.AnchorPoint, CloseBtn.Position = Vector2.new(1, 0.5), UDim2.new(1, -12, 0.5, 0)
CloseBtn.Size = UDim2.new(0, 16, 0, 16)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Image = "rbxassetid://10747384394"
CloseBtn.ImageColor3 = Colors.Muted

CloseBtn.MouseEnter:Connect(function() Tween(CloseBtn, {ImageColor3 = Colors.Accent, Rotation = 90}, 0.3) end)
CloseBtn.MouseLeave:Connect(function() Tween(CloseBtn, {ImageColor3 = Colors.Muted, Rotation = 0}, 0.3) end)
CloseBtn.MouseButton1Click:Connect(CircleClose)

local SidebarFrame = Instance.new("Frame", ContentFrame)
SidebarFrame.Name = GenerateKey()
SidebarFrame.Position, SidebarFrame.Size = UDim2.new(0, 12, 0, 52), UDim2.new(0, 200, 1, -64)
SidebarFrame.BackgroundColor3, SidebarFrame.BorderSizePixel = Colors.Section, 0
Instance.new("UICorner", SidebarFrame).CornerRadius = UDim.new(0, 2)
local s1 = Instance.new("UIStroke", SidebarFrame) s1.Color = Colors.Border

local Scroll = Instance.new("ScrollingFrame", SidebarFrame)
Scroll.Name = GenerateKey()
Scroll.Size, Scroll.Position, Scroll.BackgroundTransparency = UDim2.new(1, -10, 1, -10), UDim2.new(0, 5, 0, 5), 1
Scroll.BorderSizePixel, Scroll.ScrollBarThickness = 0, 0
local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 3)

local PreviewFrame = Instance.new("Frame", ContentFrame)
PreviewFrame.Name = GenerateKey()
PreviewFrame.Position, PreviewFrame.Size = UDim2.new(0, 225, 0, 52), UDim2.new(1, -237, 1, -64)
PreviewFrame.BackgroundColor3 = Colors.Section
Instance.new("UICorner", PreviewFrame).CornerRadius = UDim.new(0, 2)
local s2 = Instance.new("UIStroke", PreviewFrame) s2.Color = Colors.Border

local PreviewImg = Instance.new("ImageLabel", PreviewFrame)
PreviewImg.Name = GenerateKey()
PreviewImg.AnchorPoint, PreviewImg.Position = Vector2.new(0.5, 0), UDim2.new(0.5, 0, 0, 25)
PreviewImg.Size, PreviewImg.BackgroundColor3 = UDim2.new(0, 100, 0, 100), Colors.Black
Instance.new("UIStroke", PreviewImg).Color = Colors.Border
Instance.new("UICorner", PreviewImg).CornerRadius = UDim.new(0, 2)

local PreviewName = Instance.new("TextLabel", PreviewFrame)
PreviewName.Name = GenerateKey()
PreviewName.Position, PreviewName.Size, PreviewName.BackgroundTransparency = UDim2.new(0, 0, 0, 135), UDim2.new(1, 0, 0, 25), 1
PreviewName.FontFace, PreviewName.TextSize, PreviewName.TextColor3 = FontSB, 16, Colors.Text
PreviewName.Text = "N/A"

local StatusText = Instance.new("TextLabel", PreviewFrame)
StatusText.Name = GenerateKey()
StatusText.Position, StatusText.Size, StatusText.BackgroundTransparency = UDim2.new(0, 0, 0, 155), UDim2.new(1, 0, 0, 20), 1
StatusText.FontFace, StatusText.TextSize, StatusText.TextColor3 = FontSB, 12, Colors.Muted
StatusText.Text = "SELECT A GAME"

local LoadBtn = Instance.new("TextButton", PreviewFrame)
LoadBtn.Name = GenerateKey()
LoadBtn.AnchorPoint, LoadBtn.Position = Vector2.new(0.5, 1), UDim2.new(0.5, 0, 1, -15)
LoadBtn.Size, LoadBtn.BackgroundColor3, LoadBtn.BorderSizePixel = UDim2.new(1, -40, 0, 35), Colors.Accent, 0
LoadBtn.FontFace, LoadBtn.TextSize, LoadBtn.TextColor3 = FontSB, 13, Color3.new(0, 0, 0)
LoadBtn.Text, LoadBtn.AutoButtonColor = "LOAD SCRIPT", false
Instance.new("UICorner", LoadBtn).CornerRadius = UDim.new(0, 2)

local Selected = nil

local function AddGame(name, id, callback)
	local gameKey = tostring(id)
	task.spawn(function()
		local info = marketService:GetProductInfo(id)
		local asset = "rbxassetid://" .. (info.IconImageAssetId or 0)
		IconCache[gameKey] = asset
		pcall(function() ContentProvider:PreloadAsync({asset}) end)
	end)

	local Btn = Instance.new("TextButton", Scroll)
	Btn.Name = GenerateKey()
	Btn.Size, Btn.BackgroundTransparency, Btn.Text = UDim2.new(1, 0, 0, 35), 1, ""
	Btn.BackgroundColor3 = Colors.Select
	Btn.AutoButtonColor = false
	Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 2)
	
	local Txt = Instance.new("TextLabel", Btn)
	Txt.Name = GenerateKey()
	Txt.Size, Txt.Position, Txt.BackgroundTransparency = UDim2.new(1, -10, 1, 0), UDim2.new(0, 12, 0, 0), 1
	Txt.FontFace, Txt.TextSize, Txt.TextColor3 = FontSB, 11, Colors.Muted
	Txt.Text, Txt.TextXAlignment = name:upper(), Enum.TextXAlignment.Left

	local Bar = Instance.new("Frame", Btn)
	Bar.Name = GenerateKey()
	Bar.Size, Bar.Position, Bar.BackgroundColor3 = UDim2.new(0, 2, 0.5, 0), UDim2.new(0, 0, 0.25, 0), Colors.Accent
	Bar.BorderSizePixel, Bar.BackgroundTransparency = 0, 1

	Btn.MouseEnter:Connect(function() 
		if Selected ~= callback then 
			Tween(Btn, {BackgroundTransparency = 0.8}, 0.2)
			Tween(Txt, {TextColor3 = Colors.Text}, 0.2) 
		end 
	end)
	Btn.MouseLeave:Connect(function() 
		if Selected ~= callback then 
			Tween(Btn, {BackgroundTransparency = 1}, 0.2)
			Tween(Txt, {TextColor3 = Colors.Muted}, 0.2) 
		end 
	end)

	local function SelectThis()
		Selected = callback
		PreviewName.Text = name:upper()
		for _, v in pairs(Scroll:GetChildren()) do
			if v:IsA("TextButton") then 
				v:FindFirstChildOfClass("TextLabel").TextColor3 = Colors.Muted
				v:FindFirstChildOfClass("Frame").BackgroundTransparency = 1
				v.BackgroundTransparency = 1
			end
		end
		Txt.TextColor3 = Colors.Accent
		Bar.BackgroundTransparency = 0
		Btn.BackgroundTransparency = 0.5
		PreviewImg.Image = IconCache[gameKey] or IconCache[name:upper()] or ""
		PreviewImg.ImageTransparency = 0
		local rawStatus = StatusCache[gameKey] or StatusCache[name:upper()] or "Unknown"
		StatusText.Text = "STATUS: " .. rawStatus:upper()
		StatusText.TextColor3 = GetStatusColor(rawStatus)
	end

	Btn.MouseButton1Click:Connect(SelectThis)
	table.insert(GameRegistry, SelectThis)
end

LoadBtn.MouseButton1Click:Connect(function() 
	if Selected then 
		Tween(LoadBtn, {TextTransparency = 1}, 0.1)
		task.wait(0.1)
		LoadBtn.Text = "LOADING..."
		Tween(LoadBtn, {TextTransparency = 0}, 0.1)
		
		local func = Selected
		task.spawn(function()
			task.spawn(func)
			task.wait(0.2)
			LoadBtn.Text = "LOADED"
			task.wait(0.2)
			CircleClose()
		end)
	end 
end)

local dragging, dragStart, startPos
Header.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = Main.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

uis.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

local function Start()
	local targetSize = UDim2.new(0, 560, 0, 340)
	Main.Size = UDim2.new(0, 560, 0, 0)
	Tween(MainShadow, {ImageTransparency = 0.75}, 0.8)
	Tween(Main, {GroupTransparency = 0, Size = targetSize}, 0.6, Enum.EasingStyle.Back)
	
	local startT = tick()
	while not DataReady and (tick() - startT < 2) do
		task.wait()
	end
	
	Tween(LoadingLabel, {TextTransparency = 1}, 0.3)
	task.wait(0.3)
	LoadingLabel:Destroy()
	ContentFrame.Visible = true
	if GameRegistry[1] then GameRegistry[1]() end
end

AddGame("Universal", 3392487150, function() print("Test") end)
AddGame("Penablox HvH", 122764594952227, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/123hoipopper13r6/NeverHit.lua/refs/heads/main/Game-Support/Penablox.lua"))() end)
AddGame("Europhium HvH", 82638711520338, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/123hoipopper13r6/NeverHit.lua/refs/heads/main/Game-Support/Europhium.lua"))() end)
AddGame("Sultanisimus HvH", 120331934510435, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/123hoipopper13r6/NeverHit.lua/refs/heads/main/Game-Support/Sultanisimus.lua"))() end)

Start()
