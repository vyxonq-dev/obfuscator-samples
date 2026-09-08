local PlaceId = 116495829188952
local GameId = 70876832253163
local ScVer = "v1.52"
local Players = game:GetService("Players")
local CP = game:GetService("ContentProvider")
local CS = game:GetService("CollectionService")
local plr = Players.LocalPlayer
if game.PlaceId ~= GameId then warn("Renzy Hub [Dead Rails] " .. ScVer .." doesn't work in this place!") return end
if game.CoreGui:FindFirstChild("Skibidi9960") or plr.PlayerGui:FindFirstChild("Skibidi9960") then warn("Script is already running!") return end

queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local TeleportCheck = false
plr.OnTeleport:Connect(function(State)
	if (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Renzy9967/WHOEVERMOVEFIRSTISGAY./refs/heads/main/Renzy%20Hub%20%5BDead%20Rails%5D'))()")
	else
		warn('Incompatible Exploit','Your exploit does not support this command (missing queue_on_teleport)')
	end
end)

local DRMenu = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")
local Frames = Instance.new("Frame")
local Credits = Instance.new("Frame")
local Renzyyiluvu = Instance.new("TextLabel")
local text = Instance.new("TextLabel")
local ExitConfirm = Instance.new("TextButton")
local Warn = Instance.new("TextLabel") 
local Yes = Instance.new("TextButton")
local No = Instance.new("TextButton")
local UIScale = Instance.new("UIScale")
local Main = Instance.new("Frame")
local GetItem = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Item = Instance.new("TextBox")
local Mode = Instance.new("TextBox")
local Amount = Instance.new("TextBox")
local Search = Instance.new("TextButton")
local Bring = Instance.new("TextButton")
local ModeList = Instance.new("ScrollingFrame")
local Title_2 = Instance.new("TextLabel")
local UIGridLayout = Instance.new("UIGridLayout")
local Template = Instance.new("TextButton")
local ItemList = Instance.new("ScrollingFrame")
local Title_3 = Instance.new("TextLabel")
local UIGridLayout_2 = Instance.new("UIGridLayout")
local Template_2 = Instance.new("TextButton")
local Stop = Instance.new("TextButton")
local Other = Instance.new("Frame")
local Title_4 = Instance.new("TextLabel")
local AutoBonds = Instance.new("TextButton")
local Title_5 = Instance.new("TextLabel")
local AutoWins = Instance.new("TextButton")
local Title_6 = Instance.new("TextLabel")
local AutoChallenges = Instance.new("TextButton")
local Title_7 = Instance.new("TextLabel")
local Esp = Instance.new("Frame")
local Title_8 = Instance.new("TextLabel")
local DestinationList = Instance.new("ScrollingFrame")
local Title_9 = Instance.new("TextLabel")
local UIGridLayout_3 = Instance.new("UIGridLayout")
local Template_3 = Instance.new("TextButton")
local Title_10 = Instance.new("TextLabel")
local PlayerEsp = Instance.new("TextButton")
local ItemEsp = Instance.new("TextButton")
local Title_11 = Instance.new("TextLabel")
local MobEsp = Instance.new("TextButton")
local Title_12 = Instance.new("TextLabel")
local Teleport = Instance.new("Frame")
local Title_13 = Instance.new("TextLabel")
local Destination = Instance.new("TextBox")
local TeleportBtn = Instance.new("TextButton")
local Title_14 = Instance.new("TextLabel")
local Player = Instance.new("Frame")
local Holder_2 = Instance.new("Frame")
local Title_15 = Instance.new("TextLabel")
local Noclip = Instance.new("TextButton")
local Title_16 = Instance.new("TextLabel")
local Instantpp = Instance.new("TextButton")
local Title_17 = Instance.new("TextLabel")
local Infinitejump = Instance.new("TextButton")
local Title_18 = Instance.new("TextLabel")
local Flyspeed = Instance.new("TextBox")
local Fly = Instance.new("TextButton")
local Title_19 = Instance.new("TextLabel")
local Desc_2 = Instance.new("TextLabel")
local Antivoid = Instance.new("TextButton")
local Aimbot = Instance.new("TextButton")
local Title_20 = Instance.new("TextLabel")
local Antiafk = Instance.new("TextButton")
local Title_21 = Instance.new("TextLabel")
local Fullbright = Instance.new("TextButton")
local Credits_2 = Instance.new("TextButton")
local Main_2 = Instance.new("TextButton")
local Player_2 = Instance.new("TextButton")
local Exit = Instance.new("TextButton")
local Selection = Instance.new("Frame")
local Bg = Instance.new("ImageLabel")
local Loading = Instance.new("ImageLabel")
local Text = Instance.new("TextLabel")
local UIGradient = Instance.new("UIGradient")
local Transition = Instance.new("ImageLabel")
local Toggle = Instance.new("TextButton")
local Bg_2 = Instance.new("ImageLabel")
local AimbotToggle = Instance.new("TextButton")
local Bg_3 = Instance.new("ImageLabel")
local BillboardUI = Instance.new("BillboardGui")
local espInfo = Instance.new("TextLabel")
local espFol = Instance.new("Folder")

local function CreateUIStroke(Parent,Color,Thickness,Mode)
	local uiStroke = Instance.new("UIStroke")
	uiStroke.Parent = Parent
	uiStroke.Color = Color
	uiStroke.Thickness = Thickness
	uiStroke.ApplyStrokeMode = Mode
	return uiStroke
end
local function CreateUIConstraint(Parent,AspectRatio,AspectType,DominantAxis)
	local uiStroke = Instance.new("UIAspectRatioConstraint")
	uiStroke.Parent = Parent
	uiStroke.AspectRatio = AspectRatio or 1
	uiStroke.AspectType = AspectType or Enum.AspectType.FitWithinMaxSize
	uiStroke.DominantAxis = DominantAxis or Enum.DominantAxis.Width
	return uiStroke
end

DRMenu.Name = "Skibidi9960"
espFol.Name = "SkibidiEsp"
local success = pcall(function()
	DRMenu.Parent = game.CoreGui
end)
if not success then
	DRMenu.Parent = plr.PlayerGui
end
DRMenu.IgnoreGuiInset = true
local success2 = pcall(function()
	espFol.Parent = game.CoreGui
end)
if not success2 then
	espFol.Parent = plr.PlayerGui
end

Bg.AnchorPoint = Vector2.new(0.5, 0.5)
Bg.BackgroundColor3 = Color3.new(1, 1, 1)
Bg.BackgroundTransparency = 1
Bg.BorderColor3 = Color3.new(0, 0, 0)
Bg.BorderSizePixel = 0
Bg.Position = UDim2.new(0.5, 0, 0.5, 0)
Bg.Size = UDim2.new(1.25, 0, 1.25, 0)
Bg.ZIndex = 0
Bg.Image = "rbxassetid://139342256927542"
Loading.AnchorPoint = Vector2.new(0.5, 0.5)
Loading.BackgroundColor3 = Color3.new(1, 1, 1)
Loading.BackgroundTransparency = 1
Loading.BorderColor3 = Color3.new(0, 0, 0)
Loading.BorderSizePixel = 0
Loading.Position = UDim2.new(0.5, 0, 0.5, 0)
Loading.Size = UDim2.new(1.5, 0, 1.5, 0)
Loading.Image = "rbxassetid://139342256927542"
Transition.AnchorPoint = Vector2.new(0.5, 0.5)
Transition.BackgroundColor3 = Color3.new(1, 1, 1)
Transition.BackgroundTransparency = 1
Transition.BorderColor3 = Color3.new(0, 0, 0)
Transition.BorderSizePixel = 0
Transition.Position = UDim2.new(0.5, 0, 1.5, 0)
Transition.Size = UDim2.new(1, 0, 1, 0)
Transition.Image = "rbxassetid://106959228463900"
CP:PreloadAsync({Loading})
CP:PreloadAsync({Transition})
CP:PreloadAsync({Bg})

BillboardUI.Name = "Esp"
BillboardUI.Parent = espFol
BillboardUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardUI.Active = true
BillboardUI.AlwaysOnTop = true
BillboardUI.LightInfluence = 1
BillboardUI.Size = UDim2.new(0, 100, 0, 50)
BillboardUI.StudsOffset = Vector3.new(0, 3, 0)
BillboardUI.Enabled = false

espInfo.Parent = BillboardUI
espInfo.BackgroundColor3 = Color3.new(1, 1, 1)
espInfo.BackgroundTransparency = 1
espInfo.BorderColor3 = Color3.new(0, 0, 0)
espInfo.BorderSizePixel = 0
espInfo.Size = UDim2.new(1, 0, 1, 0)
espInfo.Font = Enum.Font.TitilliumWeb
espInfo.FontFace.Bold = true
espInfo.Text = "Item | 0 studs"
espInfo.TextColor3 = Color3.new(1, 1, 1)
espInfo.TextScaled = true
espInfo.TextSize = 14
espInfo.TextStrokeTransparency = 0
espInfo.TextWrapped = true

Holder.Name = "Holder"
Holder.Parent = DRMenu
Holder.AnchorPoint = Vector2.new(0.5, 0.5)
Holder.BackgroundColor3 = Color3.new(0, 0, 0)
Holder.BorderColor3 = Color3.new(1, 1, 1)
Holder.Position = UDim2.new(0.5, 0, 0.5, 0)
Holder.Size = UDim2.new(0.570229471, 0, 0.584521413, 0)
CreateUIConstraint(Holder, 1.524)
Instance.new("UIDragDetector", Holder)

Frames.Name = "Frames"
Frames.Parent = Holder
Frames.BackgroundColor3 = Color3.new(0.0392157, 0.0392157, 0.0392157)
Frames.BorderColor3 = Color3.new(0, 0, 0)
Frames.BorderSizePixel = 0
Frames.ClipsDescendants = true
Frames.Position = UDim2.new(-0.00139300746, 0, 0.170415133, 0)
Frames.Size = UDim2.new(1, 0, 0.828326166, 0)

Credits.Name = "Credits"
Credits.Parent = Frames
Credits.BackgroundColor3 = Color3.new(0.0392157, 0.0392157, 0.0392157)
Credits.BorderColor3 = Color3.new(0, 0, 0)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0, 0, 0.5, 0)
Credits.Size = UDim2.new(1, 0, 1, 0)

Renzyyiluvu.Name = "Renzyy i luv u"
Renzyyiluvu.Parent = Credits
Renzyyiluvu.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Renzyyiluvu.BorderColor3 = Color3.new(0, 0, 0)
Renzyyiluvu.BorderSizePixel = 0
Renzyyiluvu.Position = UDim2.new(0.187174588, 0, 0.152010277, 0)
Renzyyiluvu.Size = UDim2.new(0.643894553, 0, 0.259067357, 0)
Renzyyiluvu.Font = Enum.Font.TitilliumWeb
Renzyyiluvu.Text = "Made by Renzy " .. ScVer
Renzyyiluvu.TextColor3 = Color3.new(1, 1, 1)
Renzyyiluvu.TextScaled = true
Renzyyiluvu.TextSize = 14
Renzyyiluvu.TextWrapped = true

text.Name = "text"
text.Parent = Credits
text.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
text.BorderColor3 = Color3.new(0, 0, 0)
text.BorderSizePixel = 0
text.Position = UDim2.new(0.219101146, 0, 0.480114192, 0)
text.Size = UDim2.new(0.561797738, 0, 0.259067357, 0)
text.Font = Enum.Font.TitilliumWeb
text.Text = "Works better on solo"
text.TextColor3 = Color3.new(1, 1, 1)
text.TextScaled = true
text.TextSize = 14
text.TextWrapped = true

Main.Name = "Main"
Main.Parent = Frames
Main.BackgroundColor3 = Color3.new(0.0392157, 0.0392157, 0.0392157)
Main.BorderColor3 = Color3.new(0, 0, 0)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 0, 0.5, 0)
Main.Size = UDim2.new(1, 0, 1, 0)
Main.Visible = false

GetItem.Name = "GetItem"
GetItem.Parent = Main
GetItem.AnchorPoint = Vector2.new(0, 0.5)
GetItem.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
GetItem.BorderColor3 = Color3.new(0, 0, 0)
GetItem.BorderSizePixel = 0
GetItem.Position = UDim2.new(0, 0, 0.5, 0)
GetItem.Size = UDim2.new(0.331822872, 0, 1, 0)

Title.Name = "Title"
Title.Parent = GetItem
Title.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title.BackgroundTransparency = 1
Title.BorderColor3 = Color3.new(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0365169048, 0, 0.0162119046, 0)
Title.Size = UDim2.new(0.917482316, 0, 0.114570431, 0)
Title.Font = Enum.Font.TitilliumWeb
Title.Text = "Get Item"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextScaled = true
Title.TextSize = 14
Title.TextStrokeTransparency = 0
Title.TextWrapped = true
CreateUIStroke(Title, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Item.Name = "Item"
Item.Parent = GetItem
Item.Active = true
Item.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Item.BorderColor3 = Color3.new(0, 0, 0)
Item.BorderSizePixel = 0
Item.Position = UDim2.new(0.0365169048, 0, 0.184470356, 0)
Item.Selectable = false
Item.Size = UDim2.new(0.917482316, 0, 0.0877760202, 0)
Item.Font = Enum.Font.TitilliumWeb
Item.PlaceholderText = "Select Item"
Item.ShowNativeInput = false
Item.Text = ""
Item.TextColor3 = Color3.new(1, 1, 1)
Item.TextScaled = true
Item.TextSize = 14
Item.TextStrokeTransparency = 0
Item.TextWrapped = true

Mode.Name = "Mode"
Mode.Parent = GetItem
Mode.Active = true
Mode.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Mode.BorderColor3 = Color3.new(0, 0, 0)
Mode.BorderSizePixel = 0
Mode.Position = UDim2.new(0.0365169048, 0, 0.428445011, 0)
Mode.Selectable = false
Mode.Size = UDim2.new(0.917482316, 0, 0.0877760202, 0)
Mode.Font = Enum.Font.TitilliumWeb
Mode.PlaceholderText = "Select Mode"
Mode.ShowNativeInput = false
Mode.Text = ""
Mode.TextColor3 = Color3.new(1, 1, 1)
Mode.TextScaled = true
Mode.TextSize = 14
Mode.TextStrokeTransparency = 0
Mode.TextWrapped = true

Amount.Name = "Amount"
Amount.Parent = GetItem
Amount.Active = true
Amount.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Amount.BorderColor3 = Color3.new(0, 0, 0)
Amount.BorderSizePixel = 0
Amount.Position = UDim2.new(0.0365169048, 0, 0.310664147, 0)
Amount.Selectable = false
Amount.Size = UDim2.new(0.917482316, 0, 0.0877760202, 0)
Amount.Font = Enum.Font.TitilliumWeb
Amount.PlaceholderText = "Set Amount"
Amount.ShowNativeInput = false
Amount.Text = ""
Amount.TextColor3 = Color3.new(1, 1, 1)
Amount.TextScaled = true
Amount.TextSize = 14
Amount.TextStrokeTransparency = 0
Amount.TextWrapped = true

Search.Name = "Search"
Search.Parent = GetItem
Search.BackgroundColor3 = Color3.new(0, 1, 0)
Search.BorderColor3 = Color3.new(1, 1, 1)
Search.Position = UDim2.new(0.174212664, 0, 0.559333086, 0)
Search.Size = UDim2.new(0.649208307, 0, 0.0878479332, 0)
Search.Font = Enum.Font.TitilliumWeb
Search.Text = "Search Item"
Search.TextColor3 = Color3.new(1, 1, 1)
Search.TextScaled = true
Search.TextSize = 14
Search.TextStrokeTransparency = 0
Search.TextWrapped = true

Bring.Name = "Bring"
Bring.Parent = GetItem
Bring.BackgroundColor3 = Color3.new(0, 1, 0)
Bring.BorderColor3 = Color3.new(1, 1, 1)
Bring.Position = UDim2.new(0.174212664, 0, 0.693939745, 0)
Bring.Size = UDim2.new(0.649208307, 0, 0.0878479332, 0)
Bring.Font = Enum.Font.TitilliumWeb
Bring.Text = "Bring All"
Bring.TextColor3 = Color3.new(1, 1, 1)
Bring.TextScaled = true
Bring.TextSize = 14
Bring.TextStrokeTransparency = 0
Bring.TextWrapped = true

Stop.Name = "Stop"
Stop.Parent = GetItem
Stop.BackgroundColor3 = Color3.new(1, 0, 0)
Stop.BorderColor3 = Color3.new(1, 1, 1)
Stop.Position = UDim2.new(0.174212664, 0, 0.832752645, 0)
Stop.Size = UDim2.new(0.648999989, 0, 0.0879999995, 0)
Stop.Font = Enum.Font.TitilliumWeb
Stop.Text = "Stop"
Stop.TextColor3 = Color3.new(1, 1, 1)
Stop.TextScaled = true
Stop.TextSize = 14
Stop.TextStrokeTransparency = 0
Stop.TextWrapped = true

ModeList.Name = "ModeList"
ModeList.Parent = GetItem
ModeList.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
ModeList.BorderColor3 = Color3.new(0, 0, 0)
ModeList.Position = UDim2.new(0.0824705586, 0, 0.298067868, 0)
ModeList.Selectable = false
ModeList.Size = UDim2.new(0.833999991, 0, 0.671999991, 0)
ModeList.Visible = false
ModeList.CanvasSize = UDim2.new(0, 0, 5, 0)
ModeList.ScrollingDirection = Enum.ScrollingDirection.Y
ModeList.AutomaticCanvasSize = Enum.AutomaticSize.Y
ModeList.ScrollBarThickness = 5

Title_2.Name = "Title"
Title_2.Parent = ModeList
Title_2.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Title_2.BorderColor3 = Color3.new(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.0365169048, 0, 0.0162119046, 0)
Title_2.Size = UDim2.new(0.917482257, 0, 0.114570431, 0)
Title_2.Font = Enum.Font.TitilliumWeb
Title_2.Text = "Mode List"
Title_2.TextColor3 = Color3.new(0.6, 1, 0.678431)
Title_2.TextScaled = true
Title_2.TextSize = 14
Title_2.TextStrokeTransparency = 0
Title_2.TextWrapped = true

UIGridLayout.Parent = ModeList
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(1, 0, 0, 25)

Template.Name = "Template"
Template.Parent = ModeList
Template.Active = true
Template.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Template.BorderColor3 = Color3.new(0, 0, 0)
Template.BorderSizePixel = 0
Template.Position = UDim2.new(0.0365169048, 0, 0.0162119046, 0)
Template.Selectable = false
Template.Size = UDim2.new(0.917482257, 0, 0.114570431, 0)
Template.Font = Enum.Font.TitilliumWeb
Template.Text = "skibidi"
Template.TextColor3 = Color3.new(1, 1, 1)
Template.TextScaled = true
Template.TextSize = 14
Template.TextStrokeTransparency = 0
Template.TextWrapped = true

ItemList.Name = "ItemList"
ItemList.Parent = GetItem
ItemList.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
ItemList.BorderColor3 = Color3.new(0, 0, 0)
ItemList.Position = UDim2.new(0.0824705586, 0, 0.298067868, 0)
ItemList.Selectable = false
ItemList.Size = UDim2.new(0.833999991, 0, 0.671999991, 0)
ItemList.Visible = false
ItemList.CanvasSize = UDim2.new(0, 0, 5, 0)
ItemList.ScrollingDirection = Enum.ScrollingDirection.Y
ItemList.AutomaticCanvasSize = Enum.AutomaticSize.Y
ItemList.ScrollBarThickness = 5

Title_3.Name = "Title"
Title_3.Parent = ItemList
Title_3.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Title_3.BorderColor3 = Color3.new(0, 0, 0)
Title_3.BorderSizePixel = 0
Title_3.Position = UDim2.new(0.0365169048, 0, 0.0162119046, 0)
Title_3.Size = UDim2.new(0.917482257, 0, 0.114570431, 0)
Title_3.Font = Enum.Font.TitilliumWeb
Title_3.Text = "Item Lists"
Title_3.TextColor3 = Color3.new(0.6, 1, 0.678431)
Title_3.TextScaled = true
Title_3.TextSize = 14
Title_3.TextStrokeTransparency = 0
Title_3.TextWrapped = true

UIGridLayout_2.Parent = ItemList
UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout_2.CellSize = UDim2.new(1, 0, 0, 25)

Template_2.Name = "Template"
Template_2.Parent = ItemList
Template_2.Active = true
Template_2.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Template_2.BorderColor3 = Color3.new(0, 0, 0)
Template_2.BorderSizePixel = 0
Template_2.Position = UDim2.new(0.0365169048, 0, 0.0162119046, 0)
Template_2.Selectable = false
Template_2.Size = UDim2.new(0.917482257, 0, 0.114570431, 0)
Template_2.Font = Enum.Font.TitilliumWeb
Template_2.Text = "skibidi"
Template_2.TextColor3 = Color3.new(1, 1, 1)
Template_2.TextScaled = true
Template_2.TextSize = 14
Template_2.TextStrokeTransparency = 0
Template_2.TextWrapped = true

Other.Name = "Other"
Other.Parent = Main
Other.AnchorPoint = Vector2.new(1, 0.5)
Other.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
Other.BorderColor3 = Color3.new(0, 0, 0)
Other.BorderSizePixel = 0
Other.Position = UDim2.new(1, 0, 0.5, 0)
Other.Size = UDim2.new(0.331822872, 0, 1, 0)

Title_4.Name = "Title"
Title_4.Parent = Other
Title_4.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_4.BackgroundTransparency = 1
Title_4.BorderColor3 = Color3.new(0, 0, 0)
Title_4.BorderSizePixel = 0
Title_4.Position = UDim2.new(0.0365169048, 0, 0.0162119046, 0)
Title_4.Size = UDim2.new(0.917482316, 0, 0.114570431, 0)
Title_4.Font = Enum.Font.TitilliumWeb
Title_4.Text = "Other"
Title_4.TextColor3 = Color3.new(1, 1, 1)
Title_4.TextScaled = true
Title_4.TextSize = 14
Title_4.TextStrokeTransparency = 0
Title_4.TextWrapped = true
CreateUIStroke(Title_4, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

AutoBonds.Name = "AutoBonds"
AutoBonds.Parent = Other
AutoBonds.BackgroundColor3 = Color3.new(1, 0.666667, 0.498039)
AutoBonds.BorderColor3 = Color3.new(1, 1, 1)
AutoBonds.Position = UDim2.new(0.167340472, 0, 0.180751443, 0)
AutoBonds.Size = UDim2.new(0.649208307, 0, 0.134769186, 0)
AutoBonds.Font = Enum.Font.TitilliumWeb
AutoBonds.Text = "Auto Bonds"
AutoBonds.TextColor3 = Color3.new(1, 1, 1)
AutoBonds.TextScaled = true
AutoBonds.TextSize = 14
AutoBonds.TextStrokeTransparency = 0
AutoBonds.TextWrapped = true

Title_5.Name = "Title"
Title_5.Parent = AutoBonds
Title_5.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_5.BackgroundTransparency = 1
Title_5.BorderColor3 = Color3.new(0, 0, 0)
Title_5.BorderSizePixel = 0
Title_5.Position = UDim2.new(-0.132859871, 0, 1.83790886, 0)
Title_5.Size = UDim2.new(1.27740753, 0, -0.770756304, 0)
Title_5.Font = Enum.Font.TitilliumWeb
Title_5.Text = "Auto Bonds +70 per match"
Title_5.TextColor3 = Color3.new(1, 1, 1)
Title_5.TextScaled = true
Title_5.TextSize = 14
Title_5.TextStrokeTransparency = 0
Title_5.TextWrapped = true

AutoWins.Name = "AutoWins"
AutoWins.Parent = Other
AutoWins.BackgroundColor3 = Color3.new(1, 1, 0)
AutoWins.BorderColor3 = Color3.new(1, 1, 1)
AutoWins.Position = UDim2.new(0.167340472, 0, 0.449964851, 0)
AutoWins.Size = UDim2.new(0.649208307, 0, 0.134769186, 0)
AutoWins.Font = Enum.Font.TitilliumWeb
AutoWins.Text = "Auto Wins"
AutoWins.TextColor3 = Color3.new(1, 1, 1)
AutoWins.TextScaled = true
AutoWins.TextSize = 14
AutoWins.TextStrokeTransparency = 0
AutoWins.TextWrapped = true

Title_6.Name = "Title"
Title_6.Parent = AutoWins
Title_6.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_6.BackgroundTransparency = 1
Title_6.BorderColor3 = Color3.new(0, 0, 0)
Title_6.BorderSizePixel = 0
Title_6.Position = UDim2.new(-0.132859871, 0, 1.83790886, 0)
Title_6.Size = UDim2.new(1.27740753, 0, -0.770756304, 0)
Title_6.Font = Enum.Font.TitilliumWeb
Title_6.Text = "Timer: 10:00"
Title_6.TextColor3 = Color3.new(1, 0, 0)
Title_6.TextScaled = true
Title_6.TextSize = 14
Title_6.TextStrokeTransparency = 0
Title_6.TextWrapped = true

AutoChallenges.Name = "AutoChallenges"
AutoChallenges.Parent = Other
AutoChallenges.BackgroundColor3 = Color3.new(0.470588, 0.235294, 0)
AutoChallenges.BorderColor3 = Color3.new(1, 1, 1)
AutoChallenges.Position = UDim2.new(0.167340472, 0, 0.723384738, 0)
AutoChallenges.Size = UDim2.new(0.649208307, 0, 0.134769186, 0)
AutoChallenges.Font = Enum.Font.TitilliumWeb
AutoChallenges.Text = "Auto Challenges"
AutoChallenges.TextColor3 = Color3.new(0.470588, 0.470588, 0.470588)
AutoChallenges.TextScaled = true
AutoChallenges.TextSize = 14
AutoChallenges.TextStrokeTransparency = 0
AutoChallenges.TextWrapped = true

Title_7.Name = "Title"
Title_7.Parent = AutoChallenges
Title_7.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_7.BackgroundTransparency = 1
Title_7.BorderColor3 = Color3.new(0, 0, 0)
Title_7.BorderSizePixel = 0
Title_7.Position = UDim2.new(-0.132859871, 0, 1.83790886, 0)
Title_7.Size = UDim2.new(1.27740753, 0, -0.770756304, 0)
Title_7.Font = Enum.Font.TitilliumWeb
Title_7.Text = "WIP"
Title_7.TextColor3 = Color3.new(1, 1, 0)
Title_7.TextScaled = true
Title_7.TextSize = 14
Title_7.TextStrokeTransparency = 0
Title_7.TextWrapped = true

Esp.Name = "Esp"
Esp.Parent = Main
Esp.AnchorPoint = Vector2.new(0.5, 0.5)
Esp.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
Esp.BorderColor3 = Color3.new(0, 0, 0)
Esp.BorderSizePixel = 0
Esp.Position = UDim2.new(0.5, 0, 0.69846344, 0)
Esp.Size = UDim2.new(0.331822902, 0, 0.606112182, 0)

Title_8.Name = "Title"
Title_8.Parent = Esp
Title_8.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_8.BackgroundTransparency = 1
Title_8.BorderColor3 = Color3.new(0, 0, 0)
Title_8.BorderSizePixel = 0
Title_8.Position = UDim2.new(0.0370000899, 0, 0.0160002988, 0)
Title_8.Size = UDim2.new(0.917000055, 0, 0.183325827, 0)
Title_8.Font = Enum.Font.TitilliumWeb
Title_8.Text = "Esp"
Title_8.TextColor3 = Color3.new(1, 1, 1)
Title_8.TextScaled = true
Title_8.TextSize = 14
Title_8.TextStrokeTransparency = 0
Title_8.TextWrapped = true
CreateUIStroke(Title_8, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Title_10.Name = "Title"
Title_10.Parent = Esp
Title_10.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_10.BackgroundTransparency = 1
Title_10.BorderColor3 = Color3.new(1, 1, 1)
Title_10.BorderSizePixel = 0
Title_10.Position = UDim2.new(0.0271778945, 0, 0.258863807, 0)
Title_10.Size = UDim2.new(0.733879268, 0, 0.156526983, 0)
Title_10.Font = Enum.Font.TitilliumWeb
Title_10.Text = "Player Esp"
Title_10.TextColor3 = Color3.new(1, 1, 1)
Title_10.TextScaled = true
Title_10.TextSize = 14
Title_10.TextStrokeTransparency = 0
Title_10.TextWrapped = true
CreateUIStroke(Title_10, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

PlayerEsp.Name = "PlayerEsp"
PlayerEsp.Parent = Esp
PlayerEsp.BackgroundColor3 = Color3.new(1, 0, 0)
PlayerEsp.BorderColor3 = Color3.new(1, 1, 1)
PlayerEsp.Position = UDim2.new(0.826647818, 0, 0.258340865, 0)
PlayerEsp.Size = UDim2.new(0.143921658, 0, 0.156527027, 0)
PlayerEsp.Font = Enum.Font.TitilliumWeb
PlayerEsp.Text = ""
PlayerEsp.TextColor3 = Color3.new(1, 1, 1)
PlayerEsp.TextScaled = true
PlayerEsp.TextSize = 14
PlayerEsp.TextStrokeTransparency = 0
PlayerEsp.TextWrapped = true

ItemEsp.Name = "ItemEsp"
ItemEsp.Parent = Esp
ItemEsp.BackgroundColor3 = Color3.new(1, 0, 0)
ItemEsp.BorderColor3 = Color3.new(1, 1, 1)
ItemEsp.Position = UDim2.new(0.826647818, 0, 0.494303167, 0)
ItemEsp.Size = UDim2.new(0.143921658, 0, 0.156527027, 0)
ItemEsp.Font = Enum.Font.TitilliumWeb
ItemEsp.Text = ""
ItemEsp.TextColor3 = Color3.new(1, 1, 1)
ItemEsp.TextScaled = true
ItemEsp.TextSize = 14
ItemEsp.TextStrokeTransparency = 0
ItemEsp.TextWrapped = true

Title_11.Name = "Title" 
Title_11.Parent = Esp
Title_11.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_11.BackgroundTransparency = 1
Title_11.BorderColor3 = Color3.new(1, 1, 1)
Title_11.BorderSizePixel = 0
Title_11.Position = UDim2.new(0.0271778945, 0, 0.494826078, 0)
Title_11.Size = UDim2.new(0.733879268, 0, 0.156526983, 0)
Title_11.Font = Enum.Font.TitilliumWeb
Title_11.Text = "Item Esp"
Title_11.TextColor3 = Color3.new(1, 1, 1)
Title_11.TextScaled = true
Title_11.TextSize = 14
Title_11.TextStrokeTransparency = 0
Title_11.TextWrapped = true
CreateUIStroke(Title_11, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

MobEsp.Name = "MobEsp"
MobEsp.Parent = Esp
MobEsp.BackgroundColor3 = Color3.new(1, 0, 0)
MobEsp.BorderColor3 = Color3.new(1, 1, 1)
MobEsp.Position = UDim2.new(0.826647818, 0, 0.723325372, 0)
MobEsp.Size = UDim2.new(0.143921658, 0, 0.156527027, 0)
MobEsp.Font = Enum.Font.TitilliumWeb
MobEsp.Text = ""
MobEsp.TextColor3 = Color3.new(1, 1, 1)
MobEsp.TextScaled = true
MobEsp.TextSize = 14
MobEsp.TextStrokeTransparency = 0
MobEsp.TextWrapped = true

Title_12.Name = "Title"
Title_12.Parent = Esp
Title_12.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_12.BackgroundTransparency = 1
Title_12.BorderColor3 = Color3.new(1, 1, 1)
Title_12.BorderSizePixel = 0
Title_12.Position = UDim2.new(0.0271778945, 0, 0.723848283, 0)
Title_12.Size = UDim2.new(0.733879268, 0, 0.156526983, 0)
Title_12.Font = Enum.Font.TitilliumWeb
Title_12.Text = "Mob/Enemy Esp"
Title_12.TextColor3 = Color3.new(1, 1, 1)
Title_12.TextScaled = true
Title_12.TextSize = 14
Title_12.TextStrokeTransparency = 0
Title_12.TextWrapped = true
CreateUIStroke(Title_12, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Teleport.Name = "Teleport"
Teleport.Parent = Main
Teleport.AnchorPoint = Vector2.new(0.5, 0.5)
Teleport.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
Teleport.BorderColor3 = Color3.new(0, 0, 0)
Teleport.BorderSizePixel = 0
Teleport.Position = UDim2.new(0.5, 0, 0.199220076, 0)
Teleport.Size = UDim2.new(0.331822902, 0, 0.398440152, 0)

Title_13.Name = "Title"
Title_13.Parent = Teleport
Title_13.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_13.BackgroundTransparency = 1
Title_13.BorderColor3 = Color3.new(0, 0, 0)
Title_13.BorderSizePixel = 0
Title_13.Position = UDim2.new(0.0365168676, 0, 0.040688429, 0)
Title_13.Size = UDim2.new(0.917482197, 0, 0.287547529, 0)
Title_13.Font = Enum.Font.TitilliumWeb
Title_13.Text = "Teleport"
Title_13.TextColor3 = Color3.new(1, 1, 1)
Title_13.TextScaled = true
Title_13.TextSize = 14
Title_13.TextStrokeTransparency = 0
Title_13.TextWrapped = true
CreateUIStroke(Title_13, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Destination.Name = "Item"
Destination.Parent = Teleport
Destination.Active = true
Destination.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Destination.BorderColor3 = Color3.new(0, 0, 0)
Destination.BorderSizePixel = 0
Destination.Position = UDim2.new(0.0365168676, 0, 0.389079779, 0)
Destination.Selectable = false
Destination.Size = UDim2.new(0.917482197, 0, 0.220299482, 0)
Destination.Font = Enum.Font.TitilliumWeb
Destination.PlaceholderText = "Select Destination"
Destination.ShowNativeInput = false
Destination.Text = ""
Destination.TextColor3 = Color3.new(1, 1, 1)
Destination.TextScaled = true
Destination.TextSize = 14
Destination.TextStrokeTransparency = 0
Destination.TextWrapped = true

TeleportBtn.Name = "Yes"
TeleportBtn.Parent = Teleport
TeleportBtn.BackgroundColor3 = Color3.new(0, 1, 0)
TeleportBtn.BorderColor3 = Color3.new(1, 1, 1)
TeleportBtn.Position = UDim2.new(0.174212649, 0, 0.683280468, 0)
TeleportBtn.Size = UDim2.new(0.649208307, 0, 0.230298474, 0)
TeleportBtn.Font = Enum.Font.TitilliumWeb
TeleportBtn.Text = "Teleport"
TeleportBtn.TextColor3 = Color3.new(1, 1, 1)
TeleportBtn.TextScaled = true
TeleportBtn.TextSize = 14
TeleportBtn.TextStrokeTransparency = 0
TeleportBtn.TextWrapped = true

DestinationList.Name = "DestinationList"
DestinationList.Parent = Teleport
DestinationList.BackgroundColor3 = Color3.new(0.156863, 0.156863, 0.156863)
DestinationList.BorderColor3 = Color3.new(0, 0, 0)
DestinationList.Position = UDim2.new(0.0824704841, 0, 0.657017171, 0)
DestinationList.Selectable = false
DestinationList.Size = UDim2.new(0.833504975, 0, 1.78018272, 0)
DestinationList.Visible = false
DestinationList.CanvasSize = UDim2.new(0, 0, 5, 0)
DestinationList.ScrollingDirection = Enum.ScrollingDirection.Y
DestinationList.AutomaticCanvasSize = Enum.AutomaticSize.Y
DestinationList.ScrollBarThickness = 5

UIGridLayout_3.Parent = DestinationList
UIGridLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout_3.CellSize = UDim2.new(1, 0, 0, 25)

Template_3.Name = "Template"
Template_3.Parent = DestinationList
Template_3.Active = true
Template_3.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Template_3.BorderColor3 = Color3.new(0, 0, 0)
Template_3.BorderSizePixel = 0
Template_3.Position = UDim2.new(0.0365169048, 0, 0.0162119046, 0)
Template_3.Selectable = false
Template_3.Size = UDim2.new(0.917482257, 0, 0.114570431, 0)
Template_3.Font = Enum.Font.TitilliumWeb
Template_3.Text = "skibidi"
Template_3.TextColor3 = Color3.new(1, 1, 1)
Template_3.TextScaled = true
Template_3.TextSize = 14
Template_3.TextStrokeTransparency = 0
Template_3.TextWrapped = true

Title_14.Name = "Title"
Title_14.Parent = DestinationList
Title_14.BackgroundColor3 = Color3.new(0.47451, 0.47451, 0.47451)
Title_14.BorderColor3 = Color3.new(0, 0, 0)
Title_14.BorderSizePixel = 0
Title_14.Position = UDim2.new(0.0365169048, 0, 0.0162119046, 0)
Title_14.Size = UDim2.new(0.917482257, 0, 0.114570431, 0)
Title_14.Font = Enum.Font.TitilliumWeb
Title_14.Text = "Destination"
Title_14.TextColor3 = Color3.new(0.6, 1, 0.678431)
Title_14.TextScaled = true
Title_14.TextSize = 14
Title_14.TextStrokeTransparency = 0
Title_14.TextWrapped = true

Player.Name = "Player"
Player.Parent = Frames
Player.BackgroundColor3 = Color3.new(0.0392157, 0.0392157, 0.0392157)
Player.BorderColor3 = Color3.new(0, 0, 0)
Player.BorderSizePixel = 0
Player.Position = UDim2.new(0, 0, 0.5, 0)
Player.Size = UDim2.new(1, 0, 1, 0)
Player.Visible = false

Holder_2.Name = "Holder"
Holder_2.Parent = Player
Holder_2.AnchorPoint = Vector2.new(0, 0.5)
Holder_2.BackgroundColor3 = Color3.new(0.105882, 0.105882, 0.105882)
Holder_2.BorderColor3 = Color3.new(0, 0, 0)
Holder_2.BorderSizePixel = 0
Holder_2.Position = UDim2.new(0, 0, 0.5, 0)
Holder_2.Size = UDim2.new(1.00139296, 0, 1, 0)

Title_15.Name = "Title"
Title_15.Parent = Holder_2
Title_15.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_15.BackgroundTransparency = 1
Title_15.BorderColor3 = Color3.new(1, 1, 1)
Title_15.BorderSizePixel = 0
Title_15.Position = UDim2.new(0.0890312567, 0, 0.0503513254, 0)
Title_15.Size = UDim2.new(0.274512559, 0, 0.130562693, 0)
Title_15.Font = Enum.Font.TitilliumWeb
Title_15.Text = "Noclip"
Title_15.TextColor3 = Color3.new(1, 1, 1)
Title_15.TextScaled = true
Title_15.TextSize = 14
Title_15.TextStrokeTransparency = 0
Title_15.TextWrapped = true
CreateUIStroke(Title_15, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Noclip.Name = "Noclip"
Noclip.Parent = Holder_2
Noclip.BackgroundColor3 = Color3.new(1, 0, 0)
Noclip.BorderColor3 = Color3.new(1, 1, 1)
Noclip.Position = UDim2.new(0.390692383, 0, 0.0503511988, 0)
Noclip.Size = UDim2.new(0.0707751736, 0, 0.130562708, 0)
Noclip.Font = Enum.Font.TitilliumWeb
Noclip.Text = ""
Noclip.TextColor3 = Color3.new(1, 1, 1)
Noclip.TextScaled = true
Noclip.TextSize = 14
Noclip.TextStrokeTransparency = 0
Noclip.TextWrapped = true

Title_16.Name = "Title"
Title_16.Parent = Holder_2
Title_16.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_16.BackgroundTransparency = 1
Title_16.BorderColor3 = Color3.new(1, 1, 1)
Title_16.BorderSizePixel = 0
Title_16.Position = UDim2.new(0.0890312567, 0, 0.281706601, 0)
Title_16.Size = UDim2.new(0.274512559, 0, 0.130562693, 0)
Title_16.Font = Enum.Font.TitilliumWeb
Title_16.Text = "Instant ProximityPrompt"
Title_16.TextColor3 = Color3.new(1, 1, 1)
Title_16.TextScaled = true
Title_16.TextSize = 14
Title_16.TextStrokeTransparency = 0
Title_16.TextWrapped = true
CreateUIStroke(Title_16, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Instantpp.Name = "Instantpp"
Instantpp.Parent = Holder_2
Instantpp.BackgroundColor3 = Color3.new(1, 0, 0)
Instantpp.BorderColor3 = Color3.new(1, 1, 1)
Instantpp.Position = UDim2.new(0.390692383, 0, 0.281706482, 0)
Instantpp.Size = UDim2.new(0.0707751736, 0, 0.130562708, 0)
Instantpp.Font = Enum.Font.TitilliumWeb
Instantpp.Text = ""
Instantpp.TextColor3 = Color3.new(1, 1, 1)
Instantpp.TextScaled = true
Instantpp.TextSize = 14
Instantpp.TextStrokeTransparency = 0
Instantpp.TextWrapped = true

Title_17.Name = "Title"
Title_17.Parent = Holder_2
Title_17.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_17.BackgroundTransparency = 1
Title_17.BorderColor3 = Color3.new(1, 1, 1)
Title_17.BorderSizePixel = 0
Title_17.Position = UDim2.new(0.0890312567, 0, 0.496236026, 0)
Title_17.Size = UDim2.new(0.274512559, 0, 0.130562693, 0)
Title_17.Font = Enum.Font.TitilliumWeb
Title_17.Text = "Infinite Jump"
Title_17.TextColor3 = Color3.new(1, 1, 1)
Title_17.TextScaled = true
Title_17.TextSize = 14
Title_17.TextStrokeTransparency = 0
Title_17.TextWrapped = true
CreateUIStroke(Title_17, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Infinitejump.Name = "Infinitejump"
Infinitejump.Parent = Holder_2
Infinitejump.BackgroundColor3 = Color3.new(1, 0, 0)
Infinitejump.BorderColor3 = Color3.new(1, 1, 1)
Infinitejump.Position = UDim2.new(0.390692383, 0, 0.496235907, 0)
Infinitejump.Size = UDim2.new(0.0707751736, 0, 0.130562708, 0)
Infinitejump.Font = Enum.Font.TitilliumWeb
Infinitejump.Text = ""
Infinitejump.TextColor3 = Color3.new(1, 1, 1)
Infinitejump.TextScaled = true
Infinitejump.TextSize = 14
Infinitejump.TextStrokeTransparency = 0
Infinitejump.TextWrapped = true

Title_18.Name = "Title"
Title_18.Parent = Holder_2
Title_18.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_18.BackgroundTransparency = 1
Title_18.BorderColor3 = Color3.new(1, 1, 1)
Title_18.BorderSizePixel = 0
Title_18.Position = UDim2.new(0.0890312567, 0, 0.702352524, 0)
Title_18.Size = UDim2.new(0.274512559, 0, 0.130562693, 0)
Title_18.Font = Enum.Font.TitilliumWeb
Title_18.Text = "Fly (OP)"
Title_18.TextColor3 = Color3.new(1, 1, 1)
Title_18.TextScaled = true
Title_18.TextSize = 14
Title_18.TextStrokeTransparency = 0
Title_18.TextWrapped = true
CreateUIStroke(Title_18, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Flyspeed.Name = "Amount"
Flyspeed.Parent = Holder_2
Flyspeed.Active = true
Flyspeed.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Flyspeed.BorderColor3 = Color3.new(0, 0, 0)
Flyspeed.BorderSizePixel = 0
Flyspeed.Position = UDim2.new(0.112159491, 0, 0.872320056, 0)
Flyspeed.Selectable = false
Flyspeed.Size = UDim2.new(0.227530211, 0, 0.0919989944, 0)
Flyspeed.Font = Enum.Font.TitilliumWeb
Flyspeed.PlaceholderText = "Enter a Number"
Flyspeed.ShowNativeInput = false
Flyspeed.Text = "Speed: 1"
Flyspeed.TextColor3 = Color3.new(1, 1, 1)
Flyspeed.TextScaled = true
Flyspeed.TextSize = 14
Flyspeed.TextStrokeTransparency = 0
Flyspeed.TextWrapped = true

Fly.Name = "Fly"
Fly.Parent = Holder_2
Fly.BackgroundColor3 = Color3.new(1, 0, 0)
Fly.BorderColor3 = Color3.new(1, 1, 1)
Fly.Position = UDim2.new(0.390692383, 0, 0.702352405, 0)
Fly.Size = UDim2.new(0.0707751736, 0, 0.130562708, 0)
Fly.Font = Enum.Font.TitilliumWeb
Fly.Text = ""
Fly.TextColor3 = Color3.new(1, 1, 1)
Fly.TextScaled = true
Fly.TextSize = 14
Fly.TextStrokeTransparency = 0
Fly.TextWrapped = true

Title_19.Name = "Title"
Title_19.Parent = Holder_2
Title_19.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_19.BackgroundTransparency = 1
Title_19.BorderColor3 = Color3.new(1, 1, 1)
Title_19.BorderSizePixel = 0
Title_19.Position = UDim2.new(0.536545217, 0, 0.0503513254, 0)
Title_19.Size = UDim2.new(0.274512559, 0, 0.130562693, 0)
Title_19.Font = Enum.Font.TitilliumWeb
Title_19.Text = "Anti-void"
Title_19.TextColor3 = Color3.new(1, 1, 1)
Title_19.TextScaled = true
Title_19.TextSize = 14
Title_19.TextStrokeTransparency = 0
Title_19.TextWrapped = true
CreateUIStroke(Title_19, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Desc_2.Name = "Desc"
Desc_2.Parent = Title_19
Desc_2.AnchorPoint = Vector2.new(0.5, 0)
Desc_2.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Desc_2.BackgroundTransparency = 1
Desc_2.BorderColor3 = Color3.new(1, 1, 1)
Desc_2.BorderSizePixel = 0
Desc_2.Position = UDim2.new(0.500000298, 0, 1.63937771, 0)
Desc_2.Size = UDim2.new(1.00000012, 0, -0.662378371, 0)
Desc_2.Font = Enum.Font.TitilliumWeb
Desc_2.Text = "Best with noclip"
Desc_2.TextColor3 = Color3.new(1, 1, 1)
Desc_2.TextScaled = true
Desc_2.TextSize = 14
Desc_2.TextStrokeTransparency = 0
Desc_2.TextWrapped = true

Antivoid.Name = "Antivoid"
Antivoid.Parent = Holder_2
Antivoid.BackgroundColor3 = Color3.new(1, 0, 0)
Antivoid.BorderColor3 = Color3.new(1, 1, 1)
Antivoid.Position = UDim2.new(0.838206291, 0, 0.0503511988, 0)
Antivoid.Size = UDim2.new(0.0707751736, 0, 0.130562708, 0)
Antivoid.Font = Enum.Font.TitilliumWeb
Antivoid.Text = ""
Antivoid.TextColor3 = Color3.new(1, 1, 1)
Antivoid.TextScaled = true
Antivoid.TextSize = 14
Antivoid.TextStrokeTransparency = 0
Antivoid.TextWrapped = true

Aimbot.Name = "Aimbot"
Aimbot.Parent = Holder_2
Aimbot.BackgroundColor3 = Color3.new(1, 0, 0)
Aimbot.BorderColor3 = Color3.new(1, 1, 1)
Aimbot.Position = UDim2.new(0.536545217, 0, 0.698938966, 0)
Aimbot.Size = UDim2.new(0.274512589, 0, 0.130562693, 0)
Aimbot.Font = Enum.Font.TitilliumWeb
Aimbot.Text = "Aimbot"
Aimbot.TextColor3 = Color3.new(1, 1, 1)
Aimbot.TextScaled = true
Aimbot.TextSize = 14
Aimbot.TextStrokeTransparency = 0
Aimbot.TextWrapped = true

Title_20.Name = "Title"
Title_20.Parent = Holder_2
Title_20.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_20.BackgroundTransparency = 1
Title_20.BorderColor3 = Color3.new(1, 1, 1)
Title_20.BorderSizePixel = 0
Title_20.Position = UDim2.new(0.536545217, 0, 0.281706601, 0)
Title_20.Size = UDim2.new(0.274512559, 0, 0.130562693, 0)
Title_20.Font = Enum.Font.TitilliumWeb
Title_20.Text = "Anti-Afk"
Title_20.TextColor3 = Color3.new(1, 1, 1)
Title_20.TextScaled = true
Title_20.TextSize = 14
Title_20.TextStrokeTransparency = 0
Title_20.TextWrapped = true
CreateUIStroke(Title_20, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Antiafk.Name = "Antiafk"
Antiafk.Parent = Holder_2
Antiafk.BackgroundColor3 = Color3.new(1, 0, 0)
Antiafk.BorderColor3 = Color3.new(1, 1, 1)
Antiafk.Position = UDim2.new(0.838206291, 0, 0.281706482, 0)
Antiafk.Size = UDim2.new(0.0707751736, 0, 0.130562708, 0)
Antiafk.Font = Enum.Font.TitilliumWeb
Antiafk.Text = ""
Antiafk.TextColor3 = Color3.new(1, 1, 1)
Antiafk.TextScaled = true
Antiafk.TextSize = 14
Antiafk.TextStrokeTransparency = 0
Antiafk.TextWrapped = true

Title_21.Name = "Title"
Title_21.Parent = Holder_2
Title_21.BackgroundColor3 = Color3.new(0.368627, 0.368627, 0.368627)
Title_21.BackgroundTransparency = 1
Title_21.BorderColor3 = Color3.new(1, 1, 1)
Title_21.BorderSizePixel = 0
Title_21.Position = UDim2.new(0.536010206, 0, 0.496236056, 0)
Title_21.Size = UDim2.new(0.274512559, 0, 0.130562693, 0)
Title_21.Font = Enum.Font.TitilliumWeb
Title_21.Text = "Full bright"
Title_21.TextColor3 = Color3.new(1, 1, 1)
Title_21.TextScaled = true
Title_21.TextSize = 14
Title_21.TextStrokeTransparency = 0
Title_21.TextWrapped = true
CreateUIStroke(Title_21, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Border)

Fullbright.Name = "Fullbright"
Fullbright.Parent = Holder_2
Fullbright.BackgroundColor3 = Color3.new(1, 0, 0)
Fullbright.BorderColor3 = Color3.new(1, 1, 1)
Fullbright.Position = UDim2.new(0.83767134, 0, 0.496235907, 0)
Fullbright.Size = UDim2.new(0.0707751736, 0, 0.130562708, 0)
Fullbright.Font = Enum.Font.TitilliumWeb
Fullbright.Text = ""
Fullbright.TextColor3 = Color3.new(1, 1, 1)
Fullbright.TextScaled = true
Fullbright.TextSize = 14
Fullbright.TextStrokeTransparency = 0
Fullbright.TextWrapped = true

Credits_2.Name = "Credits"
Credits_2.Parent = Holder
Credits_2.BackgroundColor3 = Color3.new(0, 0, 0)
Credits_2.BorderColor3 = Color3.new(1, 1, 1)
Credits_2.Size = UDim2.new(0.29494381, 0, 0.167381972, 0)
Credits_2.Font = Enum.Font.TitilliumWeb
Credits_2.Text = "Credits"
Credits_2.TextColor3 = Color3.new(1, 1, 1)
Credits_2.TextScaled = true
Credits_2.TextSize = 14
Credits_2.TextWrapped = true

Main_2.Name = "Main"
Main_2.Parent = Holder
Main_2.BackgroundColor3 = Color3.new(0, 0, 0)
Main_2.BorderColor3 = Color3.new(1, 1, 1)
Main_2.Position = UDim2.new(0.29494381, 0, 0, 0)
Main_2.Size = UDim2.new(0.29494381, 0, 0.167381972, 0)
Main_2.Font = Enum.Font.TitilliumWeb
Main_2.Text = "Main"
Main_2.TextColor3 = Color3.new(1, 1, 1)
Main_2.TextScaled = true
Main_2.TextSize = 14
Main_2.TextWrapped = true

Player_2.Name = "Player"
Player_2.Parent = Holder
Player_2.BackgroundColor3 = Color3.new(0, 0, 0)
Player_2.BorderColor3 = Color3.new(1, 1, 1)
Player_2.Position = UDim2.new(0.589887619, 0, 0, 0)
Player_2.Size = UDim2.new(0.29494381, 0, 0.167381972, 0)
Player_2.Font = Enum.Font.TitilliumWeb
Player_2.Text = "Player"
Player_2.TextColor3 = Color3.new(1, 1, 1)
Player_2.TextScaled = true
Player_2.TextSize = 14
Player_2.TextWrapped = true

Exit.Name = "Exit"
Exit.Parent = Holder
Exit.BackgroundColor3 = Color3.new(0, 0, 0)
Exit.BorderColor3 = Color3.new(1, 1, 1)
Exit.Position = UDim2.new(0.887640476, 0, 0, 0)
Exit.Size = UDim2.new(0.112359561, 0, 0.167381972, 0)
Exit.Font = Enum.Font.TitilliumWeb
Exit.Text = "X"
Exit.TextColor3 = Color3.new(1, 0, 0)
Exit.TextScaled = true
Exit.TextSize = 14
Exit.TextWrapped = true

Selection.Name = "Selection"
Selection.Parent = Holder
Selection.Active = true
Selection.BackgroundColor3 = Color3.new(0, 0, 0)
Selection.BackgroundTransparency = 1
Selection.BorderColor3 = Color3.new(1, 1, 1)
Selection.Selectable = true
Selection.Size = UDim2.new(0.29494381, 0, 0.167381972, 0)
CreateUIStroke(Selection, Color3.fromRGB(0, 255, 0), 1, Enum.ApplyStrokeMode.Border)

Bg.Name = "Bg"
Bg.Parent = Holder

Loading.Name = "Loading"
Loading.Parent = Holder

Text.Name = "Text"
Text.Parent = Loading
Text.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Text.BackgroundTransparency = 1
Text.BorderColor3 = Color3.new(0, 0, 0)
Text.BorderSizePixel = 0
Text.Position = UDim2.new(0.294685513, 0, 0.363789588, 0)
Text.Size = UDim2.new(0.410048246, 0, 0.267089158, 0)
Text.ZIndex = 2
Text.RichText = true
Text.Font = Enum.Font.TitilliumWeb
Text.Text = "<font color='rgb(255, 0, 0)'>L</font><font color='rgb(255, 85, 0)'>O</font><font color='rgb(255, 170, 0)'>A</font><font color='rgb(85, 255, 0)'>D</font><font color='rgb(0, 85, 255)'>I</font><font color='rgb(75, 0, 130)'>N</font><font color='rgb(170, 0, 255)'>G</font>"
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextScaled = true
Text.TextSize = 14
Text.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Text.TextStrokeTransparency = 0
Text.FontFace.Bold = true
CreateUIStroke(Text, Color3.fromRGB(255, 255, 255), 1, Enum.ApplyStrokeMode.Contextual)
UIGradient.Parent = Text.UIStroke
UIGradient.Rotation = 90
UIGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), 
	ColorSequenceKeypoint.new(0.166, Color3.fromRGB(255, 255, 0)), 
	ColorSequenceKeypoint.new(0.329, Color3.fromRGB(0, 255, 0)), 
	ColorSequenceKeypoint.new(0.498, Color3.fromRGB(0, 255, 255)),
	ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)), 
	ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)), 
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
})

Transition.Name = "Transition"
Transition.Parent = Frames

Toggle.Name = "Toggle"
Toggle.Parent = DRMenu
Toggle.BackgroundColor3 = Color3.new(0, 0, 0)
Toggle.BorderColor3 = Color3.new(1, 1, 1)
Toggle.Position = UDim2.new(0.00987713877, 0, 0.303462327, 0)
Toggle.Size = UDim2.new(0.0741222352, 0, 0.0794297382, 0)
Toggle.Font = Enum.Font.TitilliumWeb
Toggle.Text = "Toggle Menu"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextScaled = true
Toggle.TextSize = 14
Toggle.TextWrapped = true
CreateUIConstraint(Toggle, 1.458)

Bg_2.Name = "Bg"
Bg_2.Parent = Toggle
Bg_2.AnchorPoint = Vector2.new(0.5, 0.5)
Bg_2.BackgroundColor3 = Color3.new(1, 1, 1) 
Bg_2.BackgroundTransparency = 1
Bg_2.BorderColor3 = Color3.new(0, 0, 0)
Bg_2.BorderSizePixel = 0
Bg_2.Position = UDim2.new(0.5, 0, 0.5, 0)
Bg_2.Size = UDim2.new(1.25, 0, 1.25, 0)
Bg_2.ZIndex = 0
Bg_2.Image = "rbxassetid://139342256927542"

AimbotToggle.Name = "AimbotToggle"
AimbotToggle.Parent = DRMenu
AimbotToggle.BackgroundColor3 = Color3.new(1, 0, 0)
AimbotToggle.BorderColor3 = Color3.new(1, 1, 1)
AimbotToggle.Position = UDim2.new(0.00987713784, 0, 0.22199592, 0)
AimbotToggle.Size = UDim2.new(0.0741222352, 0, 0.0570264719, 0)
AimbotToggle.Font = Enum.Font.Unknown
AimbotToggle.Text = "Aimbot: Off"
AimbotToggle.TextColor3 = Color3.new(1, 1, 1)
AimbotToggle.TextScaled = true
AimbotToggle.TextSize = 14
AimbotToggle.TextWrapped = true
AimbotToggle.Visible = false
CreateUIConstraint(AimbotToggle, 2.057)

Bg_3.Name = "Bg"
Bg_3.Parent = AimbotToggle
Bg_3.AnchorPoint = Vector2.new(0.5, 0.5)
Bg_3.BackgroundColor3 = Color3.new(1, 1, 1) 
Bg_3.BackgroundTransparency = 1
Bg_3.BorderColor3 = Color3.new(0, 0, 0)
Bg_3.BorderSizePixel = 0
Bg_3.Position = UDim2.new(0.5, 0, 0.5, 0)
Bg_3.Size = UDim2.new(1.25, 0, 1.5, 0)
Bg_3.ZIndex = 0
Bg_3.Image = "rbxassetid://139342256927542"

ExitConfirm.Name = "ExitConfirm"
ExitConfirm.Parent = Frames
ExitConfirm.AnchorPoint = Vector2.new(0.5, 0.5)
ExitConfirm.BackgroundColor3 = Color3.new(0.164706, 0.164706, 0.164706)
ExitConfirm.BackgroundTransparency = 0.550000011920929
ExitConfirm.BorderColor3 = Color3.new(0, 0, 0)
ExitConfirm.BorderSizePixel = 0
ExitConfirm.AutoButtonColor = false
ExitConfirm.Text = ""
ExitConfirm.ZIndex = 999
ExitConfirm.Position = UDim2.new(0.5, 0, 0.5, 0)
ExitConfirm.Size = UDim2.new(0.5, 0, 0.5, 0)
ExitConfirm.Visible = false

Warn.Name = "Warn"
Warn.Parent = ExitConfirm
Warn.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
Warn.BackgroundTransparency = 1
Warn.BorderColor3 = Color3.new(0, 0, 0)
Warn.BorderSizePixel = 0
Warn.ZIndex = 999
Warn.Position = UDim2.new(0.0477528088, 0, 0.103626944, 0)
Warn.Size = UDim2.new(0.901685417, 0, 0.471502602, 0)
Warn.Font = Enum.Font.TitilliumWeb
Warn.RichText = true
Warn.FontFace.Bold = true
Warn.Text = "Are you sure want to <font color='rgb(255, 0, 0)'>Exit</font> menu?"
Warn.TextColor3 = Color3.new(1, 1, 1)
Warn.TextScaled = true
Warn.TextSize = 14
Warn.TextStrokeTransparency = 0
Warn.TextWrapped = true

Yes.Name = "Yes"
Yes.Parent = ExitConfirm
Yes.BackgroundColor3 = Color3.new(0, 1, 0)
Yes.BorderColor3 = Color3.new(1, 1, 1)
Yes.Position = UDim2.new(0.112359554, 0, 0.647668421, 0)
Yes.Size = UDim2.new(0.29494381, 0, 0.202072546, 0)
Yes.Font = Enum.Font.TitilliumWeb
Yes.Text = "Yes"
Yes.TextColor3 = Color3.new(1, 1, 1)
Yes.TextScaled = true
Yes.TextSize = 14
Yes.ZIndex = 999
Yes.TextStrokeTransparency = 0
Yes.TextWrapped = true

No.Name = "No"
No.Parent = ExitConfirm
No.BackgroundColor3 = Color3.new(1, 0, 0)
No.BorderColor3 = Color3.new(1, 1, 1)
No.Position = UDim2.new(0.587078631, 0, 0.647668421, 0)
No.Size = UDim2.new(0.29494381, 0, 0.202072546, 0)
No.Font = Enum.Font.TitilliumWeb
No.Text = "No"
No.TextColor3 = Color3.new(1, 1, 1)
No.TextScaled = true
No.TextSize = 14
No.ZIndex = 999
No.TextStrokeTransparency = 0
No.TextWrapped = true

UIScale.Parent = ExitConfirm
UIScale.Scale = 0.5

local Items = {
	"Model_Unicorn",
	"StrangeMachine",
	"StrangeMask",
	"Vampire Knife",
	"BrainJar",
	"Model_Werewolf",
	"Model_Vampire",
	"Cavalry Sword",
	"Shovel",
	"Tomahawk",
	"Bond",
	"Jade Sword",
	"Pickaxe",
	"Dynamite",
	"Molotov",
	"Holy Water",
	"Crucifix",
	"Cannon",
	"MaximGun",
	"Bolt Action Rifle",
	"Rifle",
	"Sawed-Off Shotgun",
	"Shotgun",
	"Mauser",
	"Navy Revolver",
	"Revolver",
	"Supply Depot Key",
	"Coal",
	"Chair",
	"Torch",
	"Snake Oil",
	"Bandage",
	"Sheet Metal",
	"LightningRod",
	"Tumbleweed",
	"GoldPocketWatch",
	"GoldStatue",
	"GoldPlate",
	"GoldPainting",
	"GoldNugget",
	"GoldCup",
	"GoldBar",
	"SilverBar",
	"Painting",
	"Banjo",
	"Torso_Armor",
	"Right Arm_Armor",
	"Left Arm_Armor",
	"Head_Armor",
	"JadeTablet1",
	"JadeTablet2",
	"JadeTablet3",
	"JadeTablet4",
	"RifleAmmo",
	"RevolverAmmo",
	"JadeTablet3",
	"JadeTablet4",
	"OpenableCrate",
	"Camera",
	"Lantern",
	"GlassBottle",
	"Ladder",
	"Vase",
	"Book",
	"Wheel",
	"Rope",
	"Newspaper",
	"Excalibur",
	"Spear",
	"Sword",
	"Landmine",
	"Holy Hand Grenade",
	"HorseCart",
	"Saddle",
	"Crossbow",
	"Blunderbuss",
	"Teapot",
 "ArrowAmmo", 
 "Ballista", 
 "Elephant Rifle", 
 "FireworkAmmo", 
 "Springfield", 
 "ShotgunShells", 
 "Landmine", 
 "Flintlock", 
 "Model_Horse", 
 "GlassBottle", 
 "AcidMine", 
 "Barrel", 
 "Revolver Rifle", 
 "Statue", 
 "VaseTwo", 
 "Model_Wolf",
 "AcidBarrel", 
 "BarbedWire", 
 "BallistaBolts", 
 "BottleRocketLauncher", 
 "LeftWerewolfLeg", 
 "RightWerewolfLeg", 
 "LeftWerewolfArm",
 "RightWerewolfArm", 
 "WerewolfTorso", 
 "CannonBalls", 
 "LincolnsTopHat",
 "ChallengePumpkin",
}
local Destinations = {	"Train", "0km",	 "79km", "FortConstitution",	"Sterling",	"VampireCastle",		"TeslaLab",	"Farm",		"StrangePyramid",	 "EvilChurch", "OutlawCamp", "StillwaterPrison", "AbandonedMine", "LincolnsTrainPOI"}
local rareItems = {
	"Model_Unicorn",
	"Model_Tesla"
}
local ItemModes = {	"Collect",	"Store",	"PickUp", "Equip", "Teleport"}
local Trains = {		"armor",	"cattle",	"default",	"golden", "ghost", "passenger", "presidential", "wooden", "dracula",}
local EspColor = {
	["Corpse"] = Color3.fromRGB(0, 170, 255),
	["Item"] = Color3.fromRGB(255, 255, 255),
	["Mob"] = Color3.fromRGB(255, 0, 0),
	["Player"] = Color3.fromRGB(0, 255, 0),
	["BankCombo"] = Color3.fromRGB(255, 255, 0),
	["RareItem"] = Color3.fromRGB(255, 0, 255),
}
local allToggleButtons = {ItemEsp, MobEsp, PlayerEsp, Antivoid, Fly, Fullbright, Infinitejump, Instantpp, Noclip}
local allTextBoxes = {Item, Mode, Amount, Flyspeed}
local train = nil
local trainSeat = nil
local searchingItem = false
local bringingItem = false
local currentSection = nil
local sectionDb = false
local teleportDb = false
local exitDb = false
local runningConnections = {
	GetItem = nil,
	Teleport = nil,
	cameraConnection = nil,
	cameraThread = nil,
	antivoidLoop = nil,
	noclipLoop = nil,
	flyLoop = nil,
	humStateConn = nil,
	infJump = nil,
	instantPP = nil,
	chairConn = nil,
	fullBright = nil
}
local Var = {
	localPlayer = {antiVoid = false, aimbotTarget = nil, aimbotToggle = false, aimbot = false, noClip = false, instantPP = false, infJump = false, fly = false, antiAfk = false, fullBright = false, flySpeed = 1},
	getItemVar = {selectedItem = nil, itemAmount = 0, selectedMode = "Store", cancelGetItem = false},
	espVar = {playersEsp = false, itemsEsp = false, mobsEsp = false},
	teleportVar = {selectedDestination = nil},
}
local EspInstances = {}

local char = plr.Character or plr.CharacterAdded:Wait()
local hum: Humanoid = char:WaitForChild("Humanoid")
local root = hum.RootPart
local head = char:WaitForChild("Head")

local infNum = 1.7976931348622742e+308
local lastPos = root.Position
local start = Vector3.new(42, -3, 30000) 
local endpos = Vector3.new(-506.865, -3, -49221.016)
local crankPos = Vector3.new(-351.3, 3.5, -49041.695)
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TS = game:GetService("TweenService")
local VirtualUser = game:GetService("VirtualUser")
local Lighting = game:GetService("Lighting")
local PPS = game:GetService("ProximityPromptService")
local Baseplates = workspace.Baseplates
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local Network = ReplicatedStorage:WaitForChild("Shared"):WaitForChild("Network")
local RemoteEvent = Network:WaitForChild("RemoteEvent")
local RemotePromise = Network:WaitForChild("RemotePromise"):WaitForChild("Remotes")

local collectNetwork = RemotePromise.C_ActivateObject
local equipArmorNetwork  = Remotes.Object.EquipObject
local pickUpNetwork = Remotes.Tool.PickUpTool
local storeNetwork = Remotes.StoreItem
local dropItemNetwork = Remotes.DropItem
local reloadNetwork = Remotes.Weapon.Reload
local unweldNetwork = RemoteEvent.RequestUnweld
local crankTimer = 600
local winTimer = 300
local crankDB = false

local camera = workspace.CurrentCamera
local overrideCam = false
local flying = false

local Memory = {}

--- SCRIPT FUNCTIONS ---

--[[local function cameraLookAt(targetPos: Vector3, override: boolean)
	if not override then
		if overrideCam then return end
		camCurrentLook = true
	else
		overrideCam = false -- let the thread before close
		camCurrentLook = false
		task.wait(0.2)
		overrideCam = true
	end

	if runningConnections.cameraThread then
		overrideCam = false
		camCurrentLook = false -- Thread will clean itself up on next wait iteration
	end

	local thread = coroutine.create(function()
		local success, err = pcall(function()
			runningConnections.cameraConnection = RunService.Stepped:Connect(function()
				-- Update the camera CFrame to look at the target position
				camera.CFrame = CFrame.lookAt(camera.CFrame.Position, targetPos)
			end)

			if override then
				repeat task.wait() until not overrideCam
			else
				repeat task.wait() until not camCurrentLook
			end
		end)

		if runningConnections.cameraConnection then
			runningConnections.cameraConnection:Disconnect()
			runningConnections.cameraConnection = nil
		end

		overrideCam = false
		camCurrentLook = false
		runningConnections.cameraThread = nil

		if not success then
			warn("CameraLookAt Error:", err)
		end
	end)

	runningConnections.cameraThread = thread
	coroutine.resume(thread)
end]]

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local velocityHandlerName = randomString()
local gyroHandlerName = randomString()
local mfly1
local mfly2

local function toggleAllHumState(hum: Humanoid, blacklist: {Enum.HumanoidStateType}?, toggle: boolean)
	-- Known non-toggleable states (source: devforum/tests)
	local nonToggleable = {
		[Enum.HumanoidStateType.None] = true,
	}

	for _, state in Enum.HumanoidStateType:GetEnumItems() do
		if not nonToggleable[state] and (not blacklist or not table.find(blacklist, state)) then
			pcall(function()
				hum:SetStateEnabled(state, toggle)
			end)
		end
	end
end

local function setCanCollide(instance, bool)
	for _, v in pairs(instance:GetDescendants()) do
		if v:IsA("BasePart") and not v:IsA("Seat") then
			v.CanCollide = bool
		end
	end
end

local function unfly()
	pcall(function()
		--[[if Var.localPlayer.chair then
			setCanCollide(Var.localPlayer.chair, true)
		end]]
		root:FindFirstChild(velocityHandlerName):Destroy()
		root:FindFirstChild(gyroHandlerName):Destroy()
		mfly1:Disconnect()
		mfly2:Disconnect()
		flying = false
		--toggleAllHumState(hum, nil, true)
	end)
end

local function fly(speed)
	unfly()
	flying = true
	speed = speed or 5
	local v3none = Vector3.new()
	local v3zero = Vector3.new(0, 0, 0)
	local v3inf = Vector3.new(infNum, infNum, infNum)

	--toggleAllHumState(hum, {Enum.HumanoidStateType.Seated}, false)

--[[	if Var.localPlayer.chair then
		setCanCollide(Var.localPlayer.chair, false)
	end]]

	local controlModule = require(plr.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
	local bv = Instance.new("BodyVelocity")
	bv.Name = velocityHandlerName
	bv.Parent = root
	bv.MaxForce = v3zero
	bv.Velocity = v3zero
	bv.P = infNum

	local bg = Instance.new("BodyGyro")
	bg.Name = gyroHandlerName
	bg.Parent = root
	bg.MaxTorque = v3inf
	bg.P = 1000
	bg.D = 50

	mfly1 = plr.CharacterAdded:Connect(function()
		local bv = Instance.new("BodyVelocity")
		bv.Name = velocityHandlerName
		bv.Parent = root
		bv.MaxForce = v3zero
		bv.Velocity = v3zero
		bv.P = infNum

		local bg = Instance.new("BodyGyro")
		bg.Name = gyroHandlerName
		bg.Parent = root
		bg.MaxTorque = v3inf
		bg.P = 1000
		bg.D = 50
	end)

	mfly2 = RunService.RenderStepped:Connect(function()
		if hum and root and root:FindFirstChild(velocityHandlerName) and root:FindFirstChild(gyroHandlerName) then
			local VelocityHandler = root:FindFirstChild(velocityHandlerName)
			local GyroHandler = root:FindFirstChild(gyroHandlerName)

			VelocityHandler.MaxForce = v3inf
			GyroHandler.MaxTorque = v3inf
			GyroHandler.CFrame = camera.CoordinateFrame
			VelocityHandler.Velocity = v3none

			local direction = controlModule:GetMoveVector()
			if direction.X > 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (speed * 50))
			end
			if direction.X < 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (speed * 50))
			end
			if direction.Z > 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (speed * 50))
			end
			if direction.Z < 0 then
				VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (speed * 50))
			end
		end
	end)
end

local function toggleAntiVoid(enabled)
	if enabled then
		runningConnections.antivoidLoop = RunService.Stepped:Connect(function()
			if root and root.Position.Y <= workspace.FallenPartsDestroyHeight + 100 then
				root.AssemblyLinearVelocity = root.AssemblyLinearVelocity + Vector3.new(0, 250, 0)
			end
		end)
	else
		if runningConnections.antivoidLoop then
			runningConnections.antivoidLoop:Disconnect()
			runningConnections.antivoidLoop = nil
		end
	end
end
local function toggleNoClip(enabled)
	if enabled then
		runningConnections.noclipLoop = RunService.Stepped:Connect(function()
			for _, child in pairs(char:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true then
					child.CanCollide = false
				end
			end
		end)
	else
		if runningConnections.noclipLoop then
			runningConnections.noclipLoop:Disconnect()
			runningConnections.noclipLoop = nil
		end
		for _, child in pairs(char:GetDescendants()) do
			if child:IsA("BasePart") and child.CanCollide == false then
				child.CanCollide = true
			end
		end
	end
end
--[[local function toggleFly(enabled)
	if enabled then
		if not IsOnMobile then
			NOFLY()
			wait()
			sFLY(true)
		else
			mobilefly(speaker, true)
		end
	else
		if not IsOnMobile then NOFLY() else unmobilefly(speaker) end
		if runningConnections.flyLoop then
			runningConnections.flyLoop:Disconnect()
			runningConnections.flyLoop = nil
		end
	end
end]]
local function antiAfk()
	local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(Players.LocalPlayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		Players.LocalPlayer.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
end

local function updateEspUI()
	for model, info in pairs(EspInstances) do
		task.spawn(function()
			local overrideColor = false
			local dist = math.floor((model:GetPivot().Position - root.Position).Magnitude)
			if not Players:GetPlayerFromCharacter(model) then
				if dist > 2500 then info.ui.Enabled = false info.highlight.Enabled = false return end
			elseif Players:GetPlayerFromCharacter(model) then
				info.ui.TextLabel.Text = model.Name .. " | " .. tostring(dist)
				if not overrideColor then
					info.ui.TextLabel.TextColor3 = EspColor.Player
				end
				info.ui.Enabled = Var.espVar.playersEsp
				return
			end
			info.ui.Enabled = true
			info.highlight.Enabled = true
			if model.Name == "BankCombo" then
				info.ui.TextLabel.Text = model.Name .. " | " .. tostring(dist) .. " m | " .. model.BankCombo.SurfaceGui.TextLabel.Text
				info.ui.TextLabel.TextColor3 = EspColor.BankCombo
				overrideColor = true
			elseif model.Name == "Bank" or model.Name == "BankDestroyed" then
				local vault = model:FindFirstChild("Vault")
				if not vault then return end
				info.ui.TextLabel.Text = model.Name .. " | " .. "Combo: " .. tostring(vault.Combination.Value)
				info.ui.TextLabel.TextColor3 = EspColor.BankCombo
				overrideColor = true
			elseif table.find(rareItems, model.Name) then
				info.ui.TextLabel.Text = model.Name .. " | " .. tostring(dist)
				info.ui.TextLabel.TextColor3 = EspColor.RareItem
				overrideColor = true
			else
				info.ui.TextLabel.Text = model.Name .. " | " .. tostring(dist)
			end

			if model:HasTag("Corpse") then
				if not overrideColor then
					info.ui.TextLabel.TextColor3 = EspColor.Corpse
				end
				info.ui.Enabled = Var.espVar.itemsEsp
			elseif model:HasTag("DraggableObject") then
				if not overrideColor then
					info.ui.TextLabel.TextColor3 = EspColor.Item
				end
				info.ui.Enabled = Var.espVar.itemsEsp
			elseif model:HasTag("Enemy") then
				if not overrideColor then
					info.ui.TextLabel.TextColor3 = EspColor.Mob
				end
				info.ui.Enabled = Var.espVar.mobsEsp
			else
				if model.Name == "Bank" or model.Name == "BankDestroyed" then
					info.ui.TextLabel.TextColor3 = EspColor.BankCombo
					info.ui.Enabled = true
				else
					info.ui.TextLabel.TextColor3 = EspColor.Item
					info.ui.Enabled = Var.espVar.itemsEsp
				end
			end
		end)
	end
end

local function createEsp(model: Model)
	if EspInstances[model] ~= nil then return end
	if not model:IsDescendantOf(workspace) then return end
	if (model:HasTag("NotDestroyedBuilding") or model:HasTag("DestroyedBuilding")) and not string.lower(model.Name):match("bank") then return end

	local hightlight = Instance.new("Highlight")
	hightlight.Parent = espFol
	hightlight.Name = model.Name
	hightlight.Adornee = model
	local espUI = BillboardUI:Clone()
	espUI.Parent = espFol
	espUI.Name = model.Name
	espUI.Adornee = model
	local dist = (model:GetPivot().Position - root.Position).Magnitude
	espUI.TextLabel.Text = model.Name .. " | " .. tostring(dist)
	if model.Name == "Bank" or model.Name == "BankDestroyed" then
		hightlight.FillTransparency = 0.9
		hightlight.OutlineTransparency = 0.9
		hightlight.FillColor = EspColor.BankCombo
		espUI.Size = UDim2.new(0, 100, 0, 50)
		espUI.StudsOffset = Vector3.new(0, 10, 0)
	end

	EspInstances[model] = {highlight = hightlight, ui = espUI}
end

local function removeEsp(model: Model)
	if EspInstances[model] == nil then return end
	EspInstances[model].highlight:Destroy()
	EspInstances[model].ui:Destroy()
	EspInstances[model] = nil
end

local function handleEsp(tag: string)
	for _, v in pairs(CS:GetTagged(tag)) do
		task.spawn(function()
			createEsp(v)
		end)
	end
	CS:GetInstanceAddedSignal(tag):Connect(createEsp)
	CS:GetInstanceRemovedSignal(tag):Connect(removeEsp)
end

task.spawn(function()
	for _, v in pairs(Players:GetPlayers()) do
		local plrChar = v.Character or v.CharacterAdded:Wait()
		createEsp(plrChar)
		plrChar.AncestryChanged:Connect(function(_, parent)
			if not parent then
				removeEsp(plrChar)
			end
		end)
	end
end)

local function getNearestItem(itemName, instancePath)
	instancePath = instancePath or workspace.RuntimeItems
	local item, lastDist = nil, math.huge
	for _, v in pairs(instancePath:GetChildren()) do
		if v.Name == itemName and v:IsA("Model") and v.PrimaryPart then
			-- Chair specific checks
			if itemName == "Chair" then
				local seat = v:FindFirstChildWhichIsA("Seat")
				local weld = v.PrimaryPart:FindFirstChildWhichIsA("WeldConstraint")

				if seat and seat.Occupant then continue end
				if weld and weld.Name == "DragWeldConstraint" then
					root.CFrame = v.PrimaryPart.CFrame
					unweldNetwork:FireServer(v)
					task.wait(0.2)
				end
			end

			local dist = (v.PrimaryPart.Position - root.Position).Magnitude
			if dist < lastDist then
				item = v
				lastDist = dist
			end
		else
			if Destinations[itemName] then
				if not v.PrimaryPart then
					local base = v:FindFirstChildWhichIsA("BasePart")
					local posTemp = base and base.Position or v:GetPivot().Position

					local tik = 0
					while tik < 3 and not v.PrimaryPart do
						root.CFrame = CFrame.new(posTemp)
						tik += 1
						wait(1)
					end
					if not v.PrimaryPart then
						error("Couldn't find PrimaryPart inside: " .. v.Name)
						return
					end
					Item = v
				end
			end
		end
	end
	return item
end

local function moveTo(startPos, targetPos, speed)
	startPos = startPos or root.Position
	targetPos = targetPos or startPos
	speed = speed or 250

	hum.JumpHeight = 0
	hum.JumpPower = 0

	local reached = false

	while not reached do
		local currentPos = root.Position
		local direction = targetPos - currentPos
		local distance = direction.Magnitude

		if distance <= 0.5 then
			reached = true
			break
		end

		local moveStep = direction.Unit * math.min(speed, distance)
		root.CFrame = CFrame.new(currentPos + moveStep)

		task.wait(0.01)
	end

	root.Velocity = Vector3.zero
	root.CFrame = CFrame.new(targetPos + Vector3.new(0, 3, 0))

	hum.JumpHeight = 7.2
	hum.JumpPower = 50
	print("Arrived at destination.")
end

local function searchItem(itemname, instancePath, startPos, speed, maxAttempts, blacklist)
	print("starting search item", itemname)
	startPos = startPos or start
	instancePath = instancePath or workspace.RuntimeItems
	speed = speed or 250
	local newpos = (CFrame.new(startPos) * CFrame.new(0, -6, 0)).Position
	maxAttempts = maxAttempts or 2
	local attempts = 0
	local returning = false

	while not returning do
		local found = nil
		for _, obj in pairs(instancePath:GetChildren()) do
			if obj.Name == itemname and (not blacklist or not blacklist[obj]) then
				-- Validate availability
				if itemname == "Chair" then
					local seat = obj:FindFirstChildWhichIsA("Seat")
					if seat and not seat.Occupant then
						found = obj
						break
					end
				else
					local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
					if primary then
						local weld = primary:FindFirstChildWhichIsA("WeldConstraint")
						if not weld or weld.Name ~= "DragWeldConstraint" then
							found = obj
							break
						end
					end
				end
			end
		end

		hum.JumpHeight = 0
		hum.JumpPower = 0

		local currentDistance = (newpos - start).Magnitude
		local totalDistance = (endpos - start).Magnitude

		if currentDistance >= totalDistance then
			attempts += 1
			newpos = start
		end

		if attempts >= maxAttempts then
			returning = true
			flying = false
			task.spawn(function()
				for i = 1, 3 do
					root.Velocity = Vector3.new(0,0,0)
					root.CFrame = CFrame.new(lastPos) * CFrame.new(0,3,0)
					wait(1)
				end
				wait(1)
				hum.JumpHeight = 7.2
				hum.JumpPower = 50
			end)
			return false, error(itemname .. " not found after max attempts, teleporting back to start")
		end

		root.CFrame = CFrame.new(newpos, endpos) * CFrame.new(0, 0, -speed)
		newpos = root.Position

		if found then break end
		task.wait(0.01)
	end

	hum.JumpHeight = 7.2
	hum.JumpPower = 50
	return true
end

local function equipSack()
	if not char:FindFirstChild("Sack") and plr.Backpack:FindFirstChild("Sack") then
		hum:EquipTool(plr.Backpack.Sack)
	end
end

local function teleportToTrain()
	if not train and not trainSeat then return end
		
	if trainSeat and trainSeat.Occupant == nil then
		if Var.localPlayer.fly and Memory.Seat then
			root.CFrame = train:GetPivot() * CFrame.new(0,20,0)
		end
		--trainSeat:Sit(hum)
		return true
	else
		if not Var.localPlayer.fly then
			for _, seat in pairs(train:GetDescendants()) do
				if seat:IsA("VehicleSeat") and seat.Occupant == nil then
					seat:Sit(hum)
				end
			end
			if not hum.Sit then
				return false
			else
				return true
			end
		else
			root.CFrame = train:GetPivot() * CFrame.new(0,20,0)
		end
	end
	return false
end

local function teleportDestination(Destinationarg)
	--if Destinationarg ~= nil then assert(typeof(Destination) == "string", "Destination must be string!") end
	local selected = Destinationarg ~= nil and Destinationarg or Var.teleportVar.selectedDestination
	if not table.find(Destinations, selected) or
		teleportDb then
		return
	end
	teleportDb = true
	local chair = nil
	local randomBuildings = {["OutlawCamp"] = true, ["Farm"] = true, ["EvilChurch"] = true, ["AbandonedMine"] = true}
	local thread = coroutine.create(function()
		lastPos = root.Position
		local selectedDestination = selected
		local path = (randomBuildings[selectedDestination]) and workspace.RandomBuildings or workspace

		local success, msg = pcall(function()
			if selectedDestination == "Train" then
				teleportToTrain()
				teleportDb = false
				runningConnections.Teleport = nil
				return
			end

			if selectedDestination == "79km" then
				local targetPosition = Vector3.new(-348.684, 3, -48436.215)
				hum.JumpHeight = 0
				hum.JumpPower = 0
				for i = 1, 2 do
					root.Velocity = Vector3.new(0,0,0)
					root.CFrame = CFrame.new(targetPosition) * CFrame.new(0,3,0)
					wait(1)
				end
				wait(1)
				hum.JumpHeight = 7.2
				hum.JumpPower = 50
				teleportDb = false
				runningConnections.Teleport = nil
				if not Memory["79km"] then
					Memory["79km"] = targetPosition
				end
				return
			elseif selectedDestination == "0km" then
				local targetPosition = start
				hum.JumpHeight = 0
				hum.JumpPower = 0
				for i = 1, 2 do
					root.Velocity = Vector3.new(0,0,0)
					root.CFrame = CFrame.new(targetPosition) * CFrame.new(0,3,0)
					wait(1)
				end
				wait(1)
				hum.JumpHeight = 7.2
				hum.JumpPower = 50
				teleportDb = false
				runningConnections.Teleport = nil
				if not Memory["0km"] then
					Memory["0km"] = targetPosition
				end
				return
			elseif selectedDestination == "StrangePyramid" then
				local targetPosition = Vector3.new(901.7, 12, -39467)
				hum.JumpHeight = 0
				hum.JumpPower = 0
				for i = 1, 2 do
					root.Velocity = Vector3.new(0,0,0)
					root.CFrame = CFrame.new(targetPosition) * CFrame.new(0,3,0)
					wait(1)
				end
				wait(1)
				hum.JumpHeight = 7.2
				hum.JumpPower = 50
				teleportDb = false
				runningConnections.Teleport = nil
				if not Memory.StrangePyramid then
					Memory.StrangePyramid = targetPosition
				end
				return
			elseif selectedDestination == "TeslaLab" then
				local targetCF = workspace.TeslaLab:GetPivot()
				hum.JumpHeight = 0
				hum.JumpPower = 0
				for i = 1, 2 do
					root.Velocity = Vector3.new(0,0,0)
					root.CFrame = targetCF 
					wait(1)
				end
				wait(1)
				hum.JumpHeight = 7.2
				hum.JumpPower = 50
				teleportDb = false
				runningConnections.Teleport = nil
				if not Memory.TeslaLab then
					Memory.TeslaLab = targetCF.Position
				end
				return
			end

			local rootPos = root.Position
			searchItem(selectedDestination, path, Vector3.new(rootPos.X, start.Y, rootPos.Z), 150, 2)
			local foundModel = getNearestItem(selectedDestination, path)

			if foundModel then
				root.Anchored = true
				wait(.25)
				root.CFrame = foundModel:GetPivot()
				wait(.1)
				if selectedDestination == "Farm" then
					local floor = foundModel:FindFirstChild("Floor")
					root.CFrame = floor.CFrame * CFrame.new(0, 0, -30)
				elseif selectedDestination == "VampireCastle" then
					local floor = foundModel.House:FindFirstChild("MainFloor")
					root.CFrame = floor.CFrame * CFrame.new(0, 0, -80)
					if not Memory.VampireCastle then
						Memory.VampireCastle = floor.Position
					end
				elseif selectedDestination == "EvilChurch" then
					local floor = foundModel:FindFirstChild("Floor")
					root.CFrame = floor.CFrame * CFrame.new(60, 0, 0)
				elseif selectedDestination == "OutlawCamp" then
					local floor = foundModel:FindFirstChild("Floor")
					root.CFrame = floor.CFrame * CFrame.new(90, 0, -90)
				elseif selectedDestination == "StillwaterPrison" then
					local floor = foundModel:FindFirstChild("OutsideSpawnNode")
					root.CFrame = floor.CFrame * CFrame.new(0, 0, 500)
					if not Memory.StillwaterPrison then
						Memory.StillwaterPrison = floor.Position
					end
				elseif selectedDestination == "AbandonedMine" then
					local floor = foundModel:FindFirstChild("PorchFloor")
					root.CFrame = floor.CFrame * CFrame.new(0, 0, -30)
				else
					local goalCF = CFrame.new(foundModel.PrimaryPart.Position) * CFrame.new(0, 3, 0)
					root.CFrame = goalCF
					if not Memory[selectedDestination] then
						Memory[selectedDestination] = goalCF.Position
					end
				end
				root.Anchored = false
			end
		end)

		if not success then
			warn("Teleport Error:", msg)
		end
		if chair then
			setCanCollide(chair, true)
		end
		teleportDb = false
		runningConnections.Teleport = nil
		hum.JumpHeight = 7.2
		hum.JumpPower = 50
	end)
	runningConnections.Teleport = thread
	coroutine.resume(thread)
end

local function setCamZoom(mode: "Normal" | "Lock")
	if mode == "Normal" then
		plr.CameraMaxZoomDistance = 128
		plr.CameraMinZoomDistance = 0.5
		camera.CameraSubject = hum
		plr.CameraMode = Enum.CameraMode.LockFirstPerson
	elseif mode == "Lock" then
		plr.CameraMaxZoomDistance = 5
		plr.CameraMinZoomDistance = 5
		plr.CameraMode = Enum.CameraMode.Classic
	end
end

local function ownChair(targetPos: Vector3?)
	if Memory.Seat ~= nil then if Memory.Seat.Parent ~= nil and Memory.Seat.Anchored then Memory.Seat.Anchored = false end Memory.Seat:Sit(hum) if not flying then fly(Var.localPlayer.flySpeed) end return end
	hum.Sit = false
	hum:ChangeState(Enum.HumanoidStateType.Running)
	local MaximGun = workspace.RuntimeItems:WaitForChild("MaximGun", 0.5)
	if MaximGun == nil then
		searchItem("MaximGun", workspace.RuntimeItems, start, 250)
		MaximGun = workspace.RuntimeItems:FindFirstChild("MaximGun")
	end
	root.CFrame = MaximGun:GetPivot()
	wait()
	local seat = MaximGun.VehicleSeat
	local weldConstraint = seat:FindFirstChildWhichIsA("WeldConstraint")
	if weldConstraint then
		weldConstraint:Destroy()
	end
	Memory.Seat = seat
	seat:Sit(hum)
	wait(1)
	hum.Sit = false
	seat.HeadsUpDisplay = false
	wait(.5)
	seat:Sit(hum)
	wait(.5)
	if targetPos then
		root.CFrame = CFrame.new(targetPos)
	else
		root.CFrame = CFrame.new(lastPos)
	end
	return true
end

local function handleUnicorn(path)
	local uni = path:FindFirstChild("Model_Unicorn")
	local vehicleSeat = uni:FindFirstChildWhichIsA("VehicleSeat")
	if vehicleSeat and uni:GetAttribute("Tamed") == true then
		local params = RaycastParams.new()
		params.FilterDescendantsInstances = {uni}
		params.FilterType = Enum.RaycastFilterType.Exclude

		local result = workspace:Raycast(uni.PrimaryPart.Position+Vector3.new(0,1,0),  Vector3.new(0,5,0), params)
		if result then
			local enemyChar = result.Instance.Parent
			if enemyChar and string.find(string.lower(enemyChar.Name), string.lower("Outlaw")) then
				local enemyHum = enemyChar:FindFirstChildWhichIsA("Humanoid")
				if enemyHum then
					local done = false
					local newPos = root.Position

					hum:UnequipTools()
					local rifle = plr.Backpack:FindFirstChild("Rifle")

					if not rifle then
						searchItem("Rifle", workspace.RuntimeItems, start, 250, 1)
						rifle = getNearestItem("Rifle")
						if not rifle then return end
						rifle.PrimaryPart = rifle.PrimaryPart or rifle:FindFirstChildWhichIsA("BasePart")
						root.CFrame = CFrame.new(rifle.PrimaryPart.Position) * CFrame.new(0, 3, 0)
						wait(.2)
						pickUpNetwork:FireServer(rifle)
						root.CFrame = CFrame.new(newPos)
					end

					local stateFol = rifle:FindFirstChild("ClientWeaponState")
					local serverStateFol = rifle:FindFirstChild("ServerWeaponState")
					local config = rifle:FindFirstChild("WeaponConfiguration")
					if not stateFol or not serverStateFol or not config then return end
					local currentAmmo = stateFol:FindFirstChild("CurrentAmmo")
					local serverCurrentAmmo = stateFol:FindFirstChild("CurrentAmmo")
					if not currentAmmo then
						currentAmmo = Instance.new("NumberValue")
						currentAmmo.Name = "CurrentAmmo"
						currentAmmo.Value = serverCurrentAmmo and serverCurrentAmmo.Value or 6
						currentAmmo.Parent = rifle
					end

					hum:EquipTool(rifle)
					mouse1click()
					wait(.2)
					if Var.localPlayer.aimbot then
						Var.localPlayer.aimbotTarget = enemyHum
					else
						camera.CameraSubject = enemyHum
						setCamZoom("Lock")
						runningConnections.cameraConnection = RunService.RenderStepped:Connect(function()
							camera.CFrame = CFrame.lookAt(camera.CFrame.Position, enemyChar.Head)
						end)
					end

					while currentAmmo.Value >= 0 and enemyHum.Health > 0 do
						task.spawn(function()
							root.CFrame = CFrame.new(uni.PrimaryPart.Position - Vector3.new(0, -6, 0))
						end)
						mouse1press()
						wait(.2)
						mouse1release() 
					end
					if not Var.localPlayer.aimbot and runningConnections.cameraConnection then
						runningConnections.cameraConnection:Disconnect()
						runningConnections.cameraConnection = nil
						setCamZoom("Normal")
					end
				end
			end
		end
	end
end

local function findNearestEnemy(pos: Vector3, radius: number): Model
	local nearestEnemy = nil
	local nearestDistance = radius
	for _, enemy in pairs(CS:GetTagged("Enemy")) do
		if not enemy:IsDescendantOf(workspace) or enemy:HasTag("Animal") then continue end
		if enemy and enemy.PrimaryPart and enemy.Name ~= plr.Name then
			local enemyHum = enemy:FindFirstChildWhichIsA("Humanoid")
			local distance = (enemy:GetPivot().Position - pos).Magnitude
			if enemyHum.Health > 0 and distance < nearestDistance then
				nearestEnemy = enemy
				nearestDistance = distance
			end
		end
	end
	return nearestEnemy
end

local function aimbot(toggle: boolean)
	if toggle then
		Var.localPlayer.aimbot = true
		Var.localPlayer.aimbotTarget = nil
		if runningConnections.aimbotConnection then
			runningConnections.aimbotConnection:Disconnect()
		end

		runningConnections.aimbotConnection = RunService.RenderStepped:Connect(function()
			local enemyModel = findNearestEnemy(root.Position, 500)
			if enemyModel then
				local head = enemyModel:FindFirstChild("Head")
				if not head then 
					head = enemyModel.PrimaryPart or enemyModel.Head or enemyModel:FindFirstChildWichIsA("BasePart")
				end
				Var.localPlayer.aimbotTarget = head
				camera.CameraSubject = Var.localPlayer.aimbotTarget
				setCamZoom("Lock")
			else
				Var.localPlayer.aimbotTarget = nil
				setCamZoom("Normal")
			end
		end)
	else
		Var.localPlayer.aimbot = false
		Var.localPlayer.aimbotTarget = nil
		if runningConnections.aimbotConnection then
			runningConnections.aimbotConnection:Disconnect()
			runningConnections.aimbotConnection = nil
		end
		setCamZoom("Normal")
	end
end

local function scanForItems(itemName, instancePath): {Instances}
	local foundItems = {}
	--[[for _, obj in pairs(CS:GetTagged("DraggableObject")) do
		if not obj:IsDescendantOf(workspace) then continue end
		if obj.Name == itemName and not table.find(foundItems, obj) then
			-- Validate availability
			local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
			if primary then
				local weld = primary:FindFirstChildWhichIsA("WeldConstraint")
				if weld and weld.Name ~= "DragWeldConstraint" then
				   unweldNetwork:FireServer(obj)
				end
			end
			table.insert(foundItems, obj)
		end
	end]]
	instancePath = instancePath or workspace.RuntimeItems
	local newpos = (CFrame.new(start) * CFrame.new(0, -6, 0)).Position
	local returning = false
	local maxAttempts = 1
	local attempts = 0

	for _, obj in pairs(instancePath:GetChildren()) do
		if obj.Name == itemName and not table.find(foundItems, obj) then
			-- Validate availability
			local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
			if primary then
				local weld = primary:FindFirstChildWhichIsA("WeldConstraint")
				if not weld or weld.Name ~= "DragWeldConstraint" then
					table.insert(foundItems, obj)
				end
			end
		end
	end

	while not returning do
		hum.JumpHeight = 0
		hum.JumpPower = 0

		local currentDistance = (newpos - start).Magnitude
		local totalDistance = (endpos - start).Magnitude

		root.CFrame = CFrame.new(newpos, endpos) * CFrame.new(0, 0, -100)
		newpos = root.Position

		for _, obj in pairs(instancePath:GetChildren()) do
			if obj.Name == itemName and not table.find(foundItems, obj) then
				-- Validate availability
				local primary = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
				if primary then
					local weld = primary:FindFirstChildWhichIsA("WeldConstraint")
					if not weld or weld.Name ~= "DragWeldConstraint" then
						table.insert(foundItems, obj)
					end
				end
			end
		end

		if attempts >= maxAttempts then
			break
		end

		if currentDistance >= totalDistance then
			attempts += 1
			newpos = start
		end

		task.wait(0.01)
	end

	hum.JumpHeight = 7.2
	hum.JumpPower = 50
	print("Total ", itemName, ": ", #foundItems)
	return foundItems
end

local function getItem(bring: boolean)
	if not table.find(ItemModes, Var.getItemVar.selectedMode) or
		not table.find(Items, Var.getItemVar.selectedItem) or
		runningConnections.GetItem or
		teleportDb then
		return
	end
	teleportDb = true
	local collectedItems = {}

	Var.getItemVar.cancelGetItem = false
	--toggleNoClip(true)
	--toggleAntiVoid(true)

	local thread = coroutine.create(function()
		local chair = nil
		local lastCF = root.CFrame
		local success, msg = pcall(function()
			lastPos = root.Position

			local selectedItem = Var.getItemVar.selectedItem
			local selectedMode = Var.getItemVar.selectedMode
			local loopAmount = Var.getItemVar.itemAmount
			local path = (selectedItem == "Model_Unicorn") and workspace or workspace.RuntimeItems
			local count = 0
			local noMoreItems = false

			if not Memory.Seat then
				local suces = ownChair()
				if not suces then
					teleportDb = false
					return
				end
			end

 if not hum.Sit then
  ownChair()
 end

			chair = Memory.Seat
			local count = 0

			local function dropAllItems()
				root.CFrame = lastCF
				root.Velocity = Vector3.new(0, 0, 0)
				root.AssemblyLinearVelocity = Vector3.new(0,0,0)
				wait(1)
				for _ = 1, 10 do
					root.CFrame = lastCF
					root.Velocity = Vector3.new(0,0,0)
					root.AssemblyLinearVelocity = Vector3.new(0,0,0)
					dropItemNetwork:FireServer()
					task.wait()
				end
			end

			if bring then
				local scannedItems = scanForItems(selectedItem, workspace.RuntimeItems)
				print("bringing ", selectedItem)
				for i = 1, #scannedItems do
					if Var.getItemVar.cancelGetItem then break end
					root.CFrame = scannedItems[i]:GetPivot() * CFrame.new(0, -4, 0)

					local foundItem = scannedItems[i]
					if foundItem and not collectedItems[foundItem] then
						collectedItems[foundItem] = true

						if selectedItem == "Model_Unicorn" then
							handleUnicorn(workspace)
						end

						equipSack()

						foundItem.PrimaryPart = foundItem.PrimaryPart or foundItem:FindFirstChildWhichIsA("BasePart")

						local tik = 0
						while foundItem.Parent and tik < 10 do
							task.spawn(function()
								root.CFrame = CFrame.new(foundItem.PrimaryPart.Position - Vector3.new(0, 4, 0))
							end)
							storeNetwork:FireServer(foundItem)
							tik += 0.1
							wait(0.01)
						end

						if not foundItem.Parent then
							count += 1
						else
							if count == 0 then
								root.CFrame = lastCF
								break
							end
						end

						if count >= 10 then
							dropAllItems()
							count = 0
							wait(0.1)
						end
					end
				end

				-- Reset position and chair
				--setCanCollide(chair, true)
				dropAllItems()
			else
				print("Getting ", selectedItem)
				for i = 1, loopAmount do
					if Var.getItemVar.cancelGetItem then break end

					searchItem(selectedItem, path, start, 150)

					if selectedItem == "Model_Unicorn" and path:FindFirstChild(selectedItem) then
						handleUnicorn(workspace)
					end

					local foundItem = getNearestItem(selectedItem)

					if foundItem then
						foundItem.PrimaryPart = foundItem.PrimaryPart or foundItem:FindFirstChildWhichIsA("BasePart")
						root.CFrame = foundItem:GetPivot() * CFrame.new(0, -4, 0)
						local tik = 0

						if selectedMode == "Store" then
							equipSack()
							storeNetwork:FireServer(foundItem)
						elseif selectedMode == "Collect" then
							collectNetwork:FireServer(foundItem)
						elseif selectedMode == "PickUp" then
							pickUpNetwork:FireServer(foundItem)
						elseif selectedMode == "Equip" then
							equipArmorNetwork:FireServer(foundItem)
   elseif selectedMode == "Teleport" then
							root.CFrame = foundItem:GetPivot() * CFrame.new(0, -4, 0)
						end

						while foundItem.Parent and tik < 5 do
							task.spawn(function()
								root.CFrame = CFrame.new(foundItem.PrimaryPart.Position - Vector3.new(0, 4, 0))
							end)
							if selectedMode == "Store" then
								equipSack()
								storeNetwork:FireServer(foundItem)
							elseif selectedMode == "Collect" then
								collectNetwork:FireServer(foundItem)
							elseif selectedMode == "PickUp" then
								pickUpNetwork:FireServer(foundItem)
							elseif selectedMode == "Equip" then
								equipArmorNetwork:FireServer(foundItem)
   elseif selectedMode == "Teleport" then
							root.CFrame = foundItem:GetPivot() * CFrame.new(0, -4, 0)
   break
							end
							tik += 0.1
							wait(0.01)
						end

					end
				end
			end
		end)

		if not success then
			warn("GetItem Error:", msg)
		end

		toggleNoClip(Var.localPlayer.noClip)
		toggleAntiVoid(Var.localPlayer.antiVoid)

		if chair then
			--setCanCollide(chair, true)
		end

		root.CFrame = lastCF
		root.Velocity = Vector3.new(0,0,0)
		--unfly()
		hum.JumpHeight = 7.2
		hum.JumpPower = 50
		teleportDb = false
		--runningConnections.humStateConn:Disconnect()
		runningConnections.GetItem = nil
	end)

	runningConnections.GetItem = thread
	coroutine.resume(thread)
end

--- UI FUNCTIONS ---

local function openSection(newSection: Frame)
	if sectionDb or newSection.Name == currentSection then return end
	sectionDb = true
	local lastSection
	local btn = Holder:FindFirstChild(newSection.Name)
	if currentSection then
		lastSection = Frames:FindFirstChild(currentSection)
	end
	TS:Create(Transition, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
	TS:Create(Selection, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = btn.Position, Size = btn.Size}):Play()
	if lastSection then
		TS:Create(lastSection, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Position = UDim2.new(0, 0, 0.5, 0)}):Play()
	end
	wait(0.25)
	newSection.Visible = true
	TS:Create(newSection, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
	wait(0.5)
	if lastSection then
		lastSection.Visible = false
	end
	TS:Create(Transition, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {Position = UDim2.new(0.5, 0, 1.5, 0)}):Play()
	wait(.5)
	currentSection = newSection.Name
	sectionDb = false
end

local function promptExitMenu()
	if exitDb then return end
	exitDb = true
	sectionDb = true
	TS:Create(Selection, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = Exit.Position, Size = Exit.Size}):Play()
	ExitConfirm.Visible = true
	TS:Create(UIScale, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 2}):Play()
end
local function closeExit()
	local btn = Holder:FindFirstChild(currentSection)
	if not btn then
		currentSection = "Credits"
		btn = Holder:FindFirstChild(currentSection)
	end
	TS:Create(Selection, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Position = btn.Position, Size = btn.Size}):Play()
	TS:Create(UIScale, TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Scale = 0.5}):Play()
	wait(.8)
	ExitConfirm.Visible = false
	sectionDb = false
	exitDb = false
end
local function safeExit()
	local keysToRemove = {}
	for key, connection in pairs(runningConnections) do
		if typeof(connection) == "RBXScriptConnection" and connection.Connected then
			connection:Disconnect()
			table.insert(keysToRemove, key)
		elseif typeof(connection) == "boolean" then
			table.insert(keysToRemove, key)
		end
	end
	for _, key in ipairs(keysToRemove) do
		runningConnections[key] = nil
	end
end

local function loadMenu()
	wait(5)
	TS:Create(Text, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	TS:Create(Text.UIStroke, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Transparency = 1}):Play()
	TS:Create(Loading, TweenInfo.new(0.8, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {ImageTransparency = 1}):Play()
	wait(0.4)
	openSection(Credits)
end

local function setupToggleBtn()
	for _, Button in ipairs(allToggleButtons) do
		task.spawn(function()
			local toggled = false
			Button.MouseButton1Click:Connect(function()
				toggled = not toggled
				Button.Active = false
				Button.BackgroundTransparency = 0.5
				Button.BackgroundColor3 = toggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
				wait(0.2)
				Button.Active = true
			end)
		end)
	end
end

local function setupExclusiveFocus(targetBox: TextBox, allBoxes: {TextBox})
	targetBox.Focused:Connect(function()
		for _, box in ipairs(allBoxes) do
			if box ~= targetBox then
				box.Selectable = false
				box.TextEditable = false
			end
		end
	end)

	targetBox.FocusLost:Connect(function()
		for _, box in ipairs(allBoxes) do
			box.Selectable = true
			box.TextEditable = true
		end
	end)
end

local function handleTextBox(Box: TextBox, ScrollingFrame: ScrollingFrame, Lists: {string})
	local frameName = ScrollingFrame.Name

	local function handleFindMatch(str: string)
		for _, v in pairs(ScrollingFrame:GetChildren()) do
			if v:IsA("TextButton") then
				v.Visible = string.find(string.lower(v.Text), string.lower(str)) ~= nil
			end
		end
	end

	local function updateCanvasSize()
		ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
		ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIGridLayout.AbsoluteContentSize.Y + 25)
	end

	local function enableOtherButton(blacklisted: TextButton, togle: boolean)
		for _, v in pairs(ScrollingFrame:GetChildren()) do
			if v:IsA("TextButton") and v ~= blacklisted then
				v.Active = togle
			end
		end
	end

	local function handleList()
		local Template: TextButton = ScrollingFrame:FindFirstChild("Template")
		if not Template then warn(ScrollingFrame, "Doesn't have a Template!") return end

		local UIGridLayout = ScrollingFrame:FindFirstChildOfClass("UIGridLayout")
		if not UIGridLayout then warn("No UIGridLayout in", ScrollingFrame) return end

		local Clone = Template:Clone()
		Template.Parent = nil -- Remove from view but keep in memory
		for _, child in pairs(ScrollingFrame:GetChildren()) do
			if child:IsA("TextButton") and child ~= Template then
				child:Destroy()
			end
		end

		for _, v in ipairs(Lists) do
			local new = Clone:Clone()
			new.Name = v
			new.Text = v
			new.Visible = true
			new.Active = true
			new.Parent = ScrollingFrame
			new.MouseButton1Click:Connect(function()
				if not new.Active then return end
				if frameName == "ItemList" then
					Var.getItemVar.selectedItem = v
				elseif frameName == "ModeList" then
					Var.getItemVar.selectedMode = v
				elseif frameName == "DestinationList" then
					Var.teleportVar.selectedDestination = v
				end
				Box.Text = v
				Box:ReleaseFocus()
			end)
			updateCanvasSize()
		end

		ScrollingFrame.ChildAdded:Connect(updateCanvasSize)
		ScrollingFrame.ChildRemoved:Connect(updateCanvasSize)
	end

	Box.Focused:Connect(function()
		ScrollingFrame.Visible = true
	end)

	Box.FocusLost:Connect(function(Enter)
		wait(.1)
		ScrollingFrame.Visible = false
		wait(.1)
		for _, v in pairs(ScrollingFrame:GetChildren()) do
			if v:IsA("TextButton") then
				v.Visible = true
			end
		end

		local typed = string.lower(Box.Text)
		local function findAndAssign(matchingList, targetVar, targetField)
			for _, option in ipairs(matchingList) do
				if string.lower(option) == typed then
					targetVar[targetField] = option
					Box.Text = option
					print(option)
					return true
				end
			end
			return false
		end

		local success = false
		if frameName == "ItemList" then
			success = findAndAssign(Lists, Var.getItemVar, "selectedItem")
		elseif frameName == "ModeList" then
			success = findAndAssign(Lists, Var.getItemVar, "selectedMode")
		elseif frameName == "DestinationList" then
			success = findAndAssign(Lists, Var.teleportVar, "selectedDestination")
		end

		if not success then
			Box.Text = ""
		end
	end)

	Box:GetPropertyChangedSignal("Text"):Connect(function()
		handleFindMatch(Box.Text)
		updateCanvasSize()
	end)

	handleList()
end

setupToggleBtn()

for _, box in ipairs(allTextBoxes) do
	setupExclusiveFocus(box, allTextBoxes)
end

for _, v in pairs(Trains) do
   local foundTrain = workspace:FindFirstChild(v)
	if foundTrain then
		train = foundTrain
		trainSeat = train.RequiredComponents.Controls.ConductorSeat:FindFirstChildWhichIsA("VehicleSeat")
		break
	end
end

loadMenu()
task.spawn(function()
	handleTextBox(Item, ItemList, Items)
end)
task.spawn(function()
	handleTextBox(Mode, ModeList, ItemModes)
end)
task.spawn(function()
	handleTextBox(Destination, DestinationList, Destinations)
end)
Amount:GetPropertyChangedSignal("Text"):Connect(function()
	Amount.Text = Amount.Text:gsub('%D+', '');
	local num = tonumber(Amount.Text)
	if num then
		if num == 0 then
			num = 1
			Amount.Text = "1"
		end
		Var.getItemVar.itemAmount = num
	else
		Amount.Text = ""
	end
end)

Credits_2.MouseButton1Click:Connect(function()
	openSection(Credits)
end)
Main_2.MouseButton1Click:Connect(function()
	openSection(Main)
end)
Player_2.MouseButton1Click:Connect(function()
	openSection(Player)
end)
Exit.MouseButton1Click:Connect(function()
	if exitDb then return end
	promptExitMenu()
end)
Yes.MouseButton1Click:Connect(function()
	safeExit()
	DRMenu:Destroy()
	script:Destroy()
end)
No.MouseButton1Click:Connect(function()
	closeExit()
end)
Search.MouseButton1Click:Connect(function()
	getItem()
end)
Bring.MouseButton1Click:Connect(function()
	getItem(true)
end)
Stop.MouseButton1Click:Connect(function()
	if runningConnections.GetItem then
		Var.getItemVar.cancelGetItem = true
		coroutine.close(runningConnections.GetItem)
		runningConnections.GetItem = nil
		overrideCam = false
		teleportDb = false
		root.CFrame = CFrame.new(lastPos)
	end
end)
TeleportBtn.MouseButton1Click:Connect(function()
	teleportDestination()
end)
Toggle.MouseButton1Click:Connect(function()
	Holder.Visible = not Holder.Visible
end)
ItemEsp.MouseButton1Click:Connect(function()
	Var.espVar.itemsEsp = not Var.espVar.itemsEsp
end)
MobEsp.MouseButton1Click:Connect(function()
	Var.espVar.mobsEsp = not Var.espVar.mobsEsp
end)
PlayerEsp.MouseButton1Click:Connect(function()
	Var.espVar.playersEsp = not Var.espVar.playersEsp
end)
AutoBonds.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/Renzy9967/WHOEVERMOVEFIRSTISGAY./refs/heads/main/Auto-Bonds'))()
end)
AutoWins.MouseButton1Click:Connect(function()
	--if crankTimer > 0 and crankDB then return end
	if teleportDb then return end
	crankDB = true
	teleportDb = true
	lastPos = root.Position
	if not Memory.Seat then
		local suces = ownChair()
		if not suces then
			teleportDb = false
			return
		end
	end

	local attempts = 0
	local maxAttempts = 10
	local prompt : ProximityPrompt = nil 
	local foundPrompt = false

	while not foundPrompt do
		root.CFrame = CFrame.new(crankPos)

		for _, endprompt: ProximityPrompt in pairs(Baseplates:GetDescendants()) do
			if endprompt:IsA("ProximityPrompt") and prompt.Name == "EndGame" then
				prompt = endprompt
				foundPrompt = true
				break
			end
		end
		
		wait(1)
	end

	prompt.Triggered:Once(function()
		attempts = maxAttempts
	end)

	while attempts < maxAttempts do
		attempts += 1
		prompt.RequiresLineOfSight = false
		prompt.HoldDuration = 0
		prompt.MaxActivationDistance = math.huge
		prompt.Enabled = true

		if fireproximityprompt then
			prompt:InputHoldBegin()
			fireproximityprompt(prompt)
		else
			prompt:InputHoldBegin()
			wait(.1)
			prompt:InputHoldEnd()
		end
		wait(.1)
	end

	root.CFrame = CFrame.new(lastPos)
	root.Velocity = Vector3.new(0,0,0)
	root.AssemblyLinearVelocity = Vector3.new(0,0,0)
	teleportDb = false
	task.spawn(function()
		for i = winTimer, 0, -1 do
			local minutes = math.floor(i / 60)
			local seconds = i % 60
			local text = string.format("%02d:%02d", minutes, seconds)
			Title_6.Text = text
			Title_6.TextColor3 = Color3.fromRGB(0, 255, 0)
			winTimer = i
			wait(1)
		end
	end)
end)
Fullbright.MouseButton1Click:Connect(function()
	Var.localPlayer.fullBright = not Var.localPlayer.fullBright
	if Var.localPlayer.fullBright then
		local atmosphere = Lighting:FindFirstChild("Atmosphere")
		if atmosphere then
			atmosphere.Density = 0
		end
		runningConnections.fullBright = game:GetService("RunService").RenderStepped:Connect(function()
			Lighting.Brightness = 1
			Lighting.Ambient = Color3.fromRGB(255, 255, 255)
			Lighting.GlobalShadows = false
		end)
	else
		if runningConnections.fullBright then
			runningConnections.fullBright:Disconnect()
			runningConnections.fullBright = nil
		end
	end
end)
Infinitejump.MouseButton1Click:Connect(function()
	Var.localPlayer.infJump = not Var.localPlayer.infJump
	if Var.localPlayer.infJump then
		runningConnections.infJump = game:GetService("UserInputService").JumpRequest:Connect(function()
			hum:ChangeState(Enum.HumanoidStateType.Jumping)
		end)
	else
		if runningConnections.infJump then
			runningConnections.infJump:Disconnect()
			runningConnections.infJump = nil
		end
	end
end)
Instantpp.MouseButton1Click:Connect(function()
	Var.localPlayer.instantPP = not Var.localPlayer.instantPP
	if Var.localPlayer.instantPP then
		runningConnections.instantPP = PPS.PromptButtonHoldBegan:Connect(function(prompt)
			if fireproximityprompt then
				fireproximityprompt(prompt)
			else
				prompt.RequiresLineOfSight = false
				prompt.HoldDuration = 0
				prompt:InputHoldBegin()
				wait(.1)
				prompt:InputHoldEnd()
			end
		end)
	else
		if runningConnections.instantPP then
			runningConnections.instantPP:Disconnect()
			runningConnections.instantPP = nil
		end
	end
end)
Noclip.MouseButton1Click:Connect(function()
	Var.localPlayer.noClip = not Var.localPlayer.noClip
	toggleNoClip(Var.localPlayer.noClip)
end)
Antivoid.MouseButton1Click:Connect(function()
	Var.localPlayer.antiVoid = not Var.localPlayer.antiVoid
	toggleAntiVoid(Var.localPlayer.antiVoid)
end)
Antiafk.MouseButton1Click:Connect(function()
	antiAfk()
end)
Flyspeed.FocusLost:Connect(function(enterPressed)
	local clean = Flyspeed.Text:gsub('%D+', '')
	local num = tonumber(clean)
	if num and num > 0 then
		Flyspeed.Text = "Speed: " .. num
		Var.localPlayer.flySpeed = num
		if Var.localPlayer.fly then
			fly(num)
		end
	else
		Flyspeed.Text = ""
	end
end)
Fly.MouseButton1Click:Connect(function()
	Var.localPlayer.fly = not Var.localPlayer.fly
	if Var.localPlayer.fly then
		if not Memory.Seat and teleportDb then return end
		if not Memory.Seat and not teleportDb then 
			lastPos = root.Position
			ownChair(lastPos)
		end

		if Memory.Seat ~= nil and Memory.Seat.Anchored then
			Memory.Seat.Anchored = false
		end

		if not hum.Sit and Memory.Seat ~= nil then
			Memory.Seat.CFrame = root.CFrame
			Memory.Seat:Sit(hum)
		end
		wait()
		fly(Var.localPlayer.flySpeed)
		wait(1)
		setCamZoom("Normal")
	else
		unfly()
		hum.Sit = false
		if Memory.Seat ~= nil and not Memory.Seat.Anchored then
			Memory.Seat.Anchored = true
		end
	end
end)
Aimbot.MouseButton1Click:Connect(function()
	if Var.localPlayer.aimbotToggle then return end
	Var.localPlayer.aimbotToggle = true
	AimbotToggle.Visible = true
end)
AimbotToggle.MouseButton1Click:Connect(function()
	Var.localPlayer.aimbot = not Var.localPlayer.aimbot
	if Var.localPlayer.aimbot then
		aimbot(true)
		AimbotToggle.Text = "Aimbot: On"
		AimbotToggle.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
	else
		aimbot(false)
		AimbotToggle.Text = "Aimbot: Off"
		AimbotToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	end
end)

-- OTHER FUNCTIONS --

task.spawn(function()
	for i = crankTimer, 0, -1 do
		local minutes = math.floor(i / 60)
		local seconds = i % 60
		local text = string.format("Please wait: %02d:%02d", minutes, seconds)
		Title_6.Text = text
		crankTimer = i
		wait(1)
	end
end)

task.spawn(function()
	while Var.localPlayer.fly do
		if not hum.Sit and Memory.Seat ~= nil then
			Memory.Seat.CFrame = root.CFrame
			Memory.Seat:Sit(hum)
		end
		wait(1)
	end
end)

handleEsp("DraggableObject")
handleEsp("Enemy")
handleEsp("NotDestroyedBuilding")
handleEsp("DestroyedBuilding")
RunService.RenderStepped:Connect(updateEspUI)
