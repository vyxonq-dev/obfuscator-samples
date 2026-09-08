local Players = game:GetService("Players")
local player = Players.LocalPlayer

local MiniHub = Instance.new("ScreenGui")
MiniHub.Name = "MiniHub"
MiniHub.Parent = player:WaitForChild("PlayerGui")
MiniHub.ResetOnSpawn = false
MiniHub.ResetOnSpawn = false
MiniHub.ZIndexBehavior = Enum.ZIndexBehavior.Global
MiniHub.DisplayOrder = 0
MiniHub.IgnoreGuiInset = false
MiniHub.Enabled = true
MiniHub.SelectionGroup = false

local Frame = Instance.new("Frame")
Frame.Name = "Frame"
Frame.Parent = MiniHub
Frame.Size = UDim2.new(0, 50, 0, 275)
Frame.Position = UDim2.new(0, 230, 0, 0)
Frame.AnchorPoint = Vector2.new(0, 0)
Frame.Visible = true
Frame.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
Frame.BackgroundTransparency = 0.20000000298023224
Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame.BorderSizePixel = 1
Frame.ClipsDescendants = false
Frame.LayoutOrder = 0
Frame.Selectable = false
Frame.SelectionGroup = false
Frame.SizeConstraint = Enum.SizeConstraint.RelativeXY
Frame.Rotation = 0
Frame.AutomaticSize = Enum.AutomaticSize.None
Frame.Transparency = 0.20000000298023224
Frame.Rotation = 0
Frame.Transparency = 0.20000000298023224

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = Frame

local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "UIStroke"
UIStroke.Parent = Frame
UIStroke.Enabled = true
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Thickness = 2.5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
UIStroke.Transparency = 0
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Color = Color3.fromRGB(0, 0, 0)
UIStroke.Transparency = 0

local UIDragDetector = Instance.new("UIDragDetector")
UIDragDetector.Name = "UIDragDetector"
UIDragDetector.Parent = Frame
UIDragDetector.Enabled = true

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Parent = Frame
ScrollingFrame.Size = UDim2.new(0, 275, 0, 275)
ScrollingFrame.Position = UDim2.new(0, 75, 0, 0)
ScrollingFrame.AnchorPoint = Vector2.new(0, 0)
ScrollingFrame.Visible = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
ScrollingFrame.BackgroundTransparency = 0
ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrame.BorderSizePixel = 1
ScrollingFrame.ClipsDescendants = true
ScrollingFrame.LayoutOrder = 0
ScrollingFrame.Selectable = true
ScrollingFrame.SelectionGroup = true
ScrollingFrame.SizeConstraint = Enum.SizeConstraint.RelativeXY
ScrollingFrame.Rotation = 0
ScrollingFrame.AutomaticSize = Enum.AutomaticSize.None
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 1.2000000476837158, 0)
ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
ScrollingFrame.ScrollBarThickness = 12
ScrollingFrame.ScrollingEnabled = true
ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.XY
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.None
ScrollingFrame.ElasticBehavior = Enum.ElasticBehavior.WhenScrollable
ScrollingFrame.ScrollBarImageTransparency = 1
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.Transparency = 0
ScrollingFrame.Rotation = 0
ScrollingFrame.Transparency = 0

local NamelessAdmin = Instance.new("TextButton")
NamelessAdmin.Name = "NamelessAdmin"
NamelessAdmin.Parent = ScrollingFrame
NamelessAdmin.Size = UDim2.new(0, 75, 0, 50)
NamelessAdmin.Position = UDim2.new(0, 100, 0, 135)
NamelessAdmin.AnchorPoint = Vector2.new(0, 0)
NamelessAdmin.Visible = true
NamelessAdmin.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
NamelessAdmin.BackgroundTransparency = 0
NamelessAdmin.BorderColor3 = Color3.fromRGB(27, 42, 53)
NamelessAdmin.BorderSizePixel = 1
NamelessAdmin.ClipsDescendants = false
NamelessAdmin.LayoutOrder = 0
NamelessAdmin.Selectable = true
NamelessAdmin.SelectionGroup = false
NamelessAdmin.SizeConstraint = Enum.SizeConstraint.RelativeXY
NamelessAdmin.Rotation = 0
NamelessAdmin.AutomaticSize = Enum.AutomaticSize.None
NamelessAdmin.Font = Enum.Font.Fantasy
NamelessAdmin.Text = "Nameless Admin "
NamelessAdmin.TextColor3 = Color3.fromRGB(255, 255, 255)
NamelessAdmin.TextSize = 8
NamelessAdmin.TextScaled = true
NamelessAdmin.TextWrapped = true
NamelessAdmin.TextXAlignment = Enum.TextXAlignment.Center
NamelessAdmin.TextYAlignment = Enum.TextYAlignment.Center
NamelessAdmin.TextTransparency = 0
NamelessAdmin.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
NamelessAdmin.TextStrokeTransparency = 1
NamelessAdmin.LineHeight = 1
NamelessAdmin.RichText = false
NamelessAdmin.TextTruncate = Enum.TextTruncate.None
NamelessAdmin.MaxVisibleGraphemes = -1
NamelessAdmin.Transparency = 0
NamelessAdmin.Rotation = 0
NamelessAdmin.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = NamelessAdmin

local InfiniteYield = Instance.new("TextButton")
InfiniteYield.Name = "InfiniteYield"
InfiniteYield.Parent = ScrollingFrame
InfiniteYield.Size = UDim2.new(0, 75, 0, 50)
InfiniteYield.Position = UDim2.new(0, 100, 0, 75)
InfiniteYield.AnchorPoint = Vector2.new(0, 0)
InfiniteYield.Visible = true
InfiniteYield.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
InfiniteYield.BackgroundTransparency = 0
InfiniteYield.BorderColor3 = Color3.fromRGB(27, 42, 53)
InfiniteYield.BorderSizePixel = 1
InfiniteYield.ClipsDescendants = false
InfiniteYield.LayoutOrder = 0
InfiniteYield.Selectable = true
InfiniteYield.SelectionGroup = false
InfiniteYield.SizeConstraint = Enum.SizeConstraint.RelativeXY
InfiniteYield.Rotation = 0
InfiniteYield.AutomaticSize = Enum.AutomaticSize.None
InfiniteYield.Font = Enum.Font.Fantasy
InfiniteYield.Text = "Infinite Yield"
InfiniteYield.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteYield.TextSize = 8
InfiniteYield.TextScaled = true
InfiniteYield.TextWrapped = true
InfiniteYield.TextXAlignment = Enum.TextXAlignment.Center
InfiniteYield.TextYAlignment = Enum.TextYAlignment.Center
InfiniteYield.TextTransparency = 0
InfiniteYield.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
InfiniteYield.TextStrokeTransparency = 1
InfiniteYield.LineHeight = 1
InfiniteYield.RichText = false
InfiniteYield.TextTruncate = Enum.TextTruncate.None
InfiniteYield.MaxVisibleGraphemes = -1
InfiniteYield.Transparency = 0
InfiniteYield.Rotation = 0
InfiniteYield.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = InfiniteYield

local ESP = Instance.new("TextButton")
ESP.Name = "ESP"
ESP.Parent = ScrollingFrame
ESP.Size = UDim2.new(0, 75, 0, 50)
ESP.Position = UDim2.new(0, 185, 0, 75)
ESP.AnchorPoint = Vector2.new(0, 0)
ESP.Visible = true
ESP.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ESP.BackgroundTransparency = 0
ESP.BorderColor3 = Color3.fromRGB(27, 42, 53)
ESP.BorderSizePixel = 1
ESP.ClipsDescendants = false
ESP.LayoutOrder = 0
ESP.Selectable = true
ESP.SelectionGroup = false
ESP.SizeConstraint = Enum.SizeConstraint.RelativeXY
ESP.Rotation = 0
ESP.AutomaticSize = Enum.AutomaticSize.None
ESP.Font = Enum.Font.Fantasy
ESP.Text = "ESP"
ESP.TextColor3 = Color3.fromRGB(255, 255, 255)
ESP.TextSize = 8
ESP.TextScaled = true
ESP.TextWrapped = true
ESP.TextXAlignment = Enum.TextXAlignment.Center
ESP.TextYAlignment = Enum.TextYAlignment.Center
ESP.TextTransparency = 0
ESP.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
ESP.TextStrokeTransparency = 1
ESP.LineHeight = 1
ESP.RichText = false
ESP.TextTruncate = Enum.TextTruncate.None
ESP.MaxVisibleGraphemes = -1
ESP.Transparency = 0
ESP.Rotation = 0
ESP.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = ESP

local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "UIStroke"
UIStroke.Parent = ScrollingFrame
UIStroke.Enabled = true
UIStroke.Color = Color3.fromRGB(54, 54, 54)
UIStroke.Thickness = 5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
UIStroke.Transparency = 0
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Color = Color3.fromRGB(54, 54, 54)
UIStroke.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = ScrollingFrame

local DEX = Instance.new("TextButton")
DEX.Name = "DEX"
DEX.Parent = ScrollingFrame
DEX.Size = UDim2.new(0, 75, 0, 50)
DEX.Position = UDim2.new(0, 10, 0, 75)
DEX.AnchorPoint = Vector2.new(0, 0)
DEX.Visible = true
DEX.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DEX.BackgroundTransparency = 0
DEX.BorderColor3 = Color3.fromRGB(27, 42, 53)
DEX.BorderSizePixel = 1
DEX.ClipsDescendants = false
DEX.LayoutOrder = 0
DEX.Selectable = true
DEX.SelectionGroup = false
DEX.SizeConstraint = Enum.SizeConstraint.RelativeXY
DEX.Rotation = 0
DEX.AutomaticSize = Enum.AutomaticSize.None
DEX.Font = Enum.Font.Fantasy
DEX.Text = "DEX"
DEX.TextColor3 = Color3.fromRGB(255, 255, 255)
DEX.TextSize = 8
DEX.TextScaled = true
DEX.TextWrapped = true
DEX.TextXAlignment = Enum.TextXAlignment.Center
DEX.TextYAlignment = Enum.TextYAlignment.Center
DEX.TextTransparency = 0
DEX.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
DEX.TextStrokeTransparency = 1
DEX.LineHeight = 1
DEX.RichText = false
DEX.TextTruncate = Enum.TextTruncate.None
DEX.MaxVisibleGraphemes = -1
DEX.Transparency = 0
DEX.Rotation = 0
DEX.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = DEX

local SuperRingPartsV6 = Instance.new("TextButton")
SuperRingPartsV6.Name = "SuperRingPartsV6"
SuperRingPartsV6.Parent = ScrollingFrame
SuperRingPartsV6.Size = UDim2.new(0, 75, 0, 50)
SuperRingPartsV6.Position = UDim2.new(0, 185, 0, 195)
SuperRingPartsV6.AnchorPoint = Vector2.new(0, 0)
SuperRingPartsV6.Visible = true
SuperRingPartsV6.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
SuperRingPartsV6.BackgroundTransparency = 0
SuperRingPartsV6.BorderColor3 = Color3.fromRGB(27, 42, 53)
SuperRingPartsV6.BorderSizePixel = 1
SuperRingPartsV6.ClipsDescendants = false
SuperRingPartsV6.LayoutOrder = 0
SuperRingPartsV6.Selectable = true
SuperRingPartsV6.SelectionGroup = false
SuperRingPartsV6.SizeConstraint = Enum.SizeConstraint.RelativeXY
SuperRingPartsV6.Rotation = 0
SuperRingPartsV6.AutomaticSize = Enum.AutomaticSize.None
SuperRingPartsV6.Font = Enum.Font.Fantasy
SuperRingPartsV6.Text = "Super Ring Parts V6"
SuperRingPartsV6.TextColor3 = Color3.fromRGB(255, 255, 255)
SuperRingPartsV6.TextSize = 8
SuperRingPartsV6.TextScaled = true
SuperRingPartsV6.TextWrapped = true
SuperRingPartsV6.TextXAlignment = Enum.TextXAlignment.Center
SuperRingPartsV6.TextYAlignment = Enum.TextYAlignment.Center
SuperRingPartsV6.TextTransparency = 0
SuperRingPartsV6.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
SuperRingPartsV6.TextStrokeTransparency = 1
SuperRingPartsV6.LineHeight = 1
SuperRingPartsV6.RichText = false
SuperRingPartsV6.TextTruncate = Enum.TextTruncate.None
SuperRingPartsV6.MaxVisibleGraphemes = -1
SuperRingPartsV6.Transparency = 0
SuperRingPartsV6.Rotation = 0
SuperRingPartsV6.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = SuperRingPartsV6

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "TextLabel"
TextLabel.Parent = ScrollingFrame
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Position = UDim2.new(0, 35, 0, 10)
TextLabel.AnchorPoint = Vector2.new(0, 0)
TextLabel.Visible = true
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BackgroundTransparency = 0
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 1
TextLabel.ClipsDescendants = false
TextLabel.LayoutOrder = 0
TextLabel.Selectable = false
TextLabel.SelectionGroup = false
TextLabel.SizeConstraint = Enum.SizeConstraint.RelativeXY
TextLabel.Rotation = 0
TextLabel.AutomaticSize = Enum.AutomaticSize.None
TextLabel.Font = Enum.Font.Fantasy
TextLabel.Text = "Virus MiniHub"
TextLabel.TextColor3 = Color3.fromRGB(247, 247, 247)
TextLabel.TextSize = 8
TextLabel.TextScaled = true
TextLabel.TextWrapped = true
TextLabel.TextXAlignment = Enum.TextXAlignment.Center
TextLabel.TextYAlignment = Enum.TextYAlignment.Center
TextLabel.TextTransparency = 0
TextLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextStrokeTransparency = 1
TextLabel.LineHeight = 1
TextLabel.RichText = false
TextLabel.TextTruncate = Enum.TextTruncate.None
TextLabel.MaxVisibleGraphemes = -1
TextLabel.Transparency = 0
TextLabel.Rotation = 0
TextLabel.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = TextLabel

local UIStroke = Instance.new("UIStroke")
UIStroke.Name = "UIStroke"
UIStroke.Parent = TextLabel
UIStroke.Enabled = true
UIStroke.Color = Color3.fromRGB(88, 88, 88)
UIStroke.Thickness = 1.5
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
UIStroke.Transparency = 0
UIStroke.LineJoinMode = Enum.LineJoinMode.Round
UIStroke.Color = Color3.fromRGB(88, 88, 88)
UIStroke.Transparency = 0

local FreePrivateServer = Instance.new("TextButton")
FreePrivateServer.Name = "FreePrivateServer"
FreePrivateServer.Parent = ScrollingFrame
FreePrivateServer.Size = UDim2.new(0, 75, 0, 50)
FreePrivateServer.Position = UDim2.new(0, 10, 0, 255)
FreePrivateServer.AnchorPoint = Vector2.new(0, 0)
FreePrivateServer.Visible = true
FreePrivateServer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FreePrivateServer.BackgroundTransparency = 0
FreePrivateServer.BorderColor3 = Color3.fromRGB(27, 42, 53)
FreePrivateServer.BorderSizePixel = 1
FreePrivateServer.ClipsDescendants = false
FreePrivateServer.LayoutOrder = 0
FreePrivateServer.Selectable = true
FreePrivateServer.SelectionGroup = false
FreePrivateServer.SizeConstraint = Enum.SizeConstraint.RelativeXY
FreePrivateServer.Rotation = 0
FreePrivateServer.AutomaticSize = Enum.AutomaticSize.None
FreePrivateServer.Font = Enum.Font.Fantasy
FreePrivateServer.Text = "Free Private Server (Made By Kiet)"
FreePrivateServer.TextColor3 = Color3.fromRGB(255, 255, 255)
FreePrivateServer.TextSize = 8
FreePrivateServer.TextScaled = true
FreePrivateServer.TextWrapped = true
FreePrivateServer.TextXAlignment = Enum.TextXAlignment.Center
FreePrivateServer.TextYAlignment = Enum.TextYAlignment.Center
FreePrivateServer.TextTransparency = 0
FreePrivateServer.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
FreePrivateServer.TextStrokeTransparency = 1
FreePrivateServer.LineHeight = 1
FreePrivateServer.RichText = false
FreePrivateServer.TextTruncate = Enum.TextTruncate.None
FreePrivateServer.MaxVisibleGraphemes = -1
FreePrivateServer.Transparency = 0
FreePrivateServer.Rotation = 0
FreePrivateServer.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = FreePrivateServer

local FlyGui = Instance.new("TextButton")
FlyGui.Name = "FlyGui"
FlyGui.Parent = ScrollingFrame
FlyGui.Size = UDim2.new(0, 75, 0, 50)
FlyGui.Position = UDim2.new(0, 10, 0, 195)
FlyGui.AnchorPoint = Vector2.new(0, 0)
FlyGui.Visible = true
FlyGui.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
FlyGui.BackgroundTransparency = 0
FlyGui.BorderColor3 = Color3.fromRGB(27, 42, 53)
FlyGui.BorderSizePixel = 1
FlyGui.ClipsDescendants = false
FlyGui.LayoutOrder = 0
FlyGui.Selectable = true
FlyGui.SelectionGroup = false
FlyGui.SizeConstraint = Enum.SizeConstraint.RelativeXY
FlyGui.Rotation = 0
FlyGui.AutomaticSize = Enum.AutomaticSize.None
FlyGui.Font = Enum.Font.Fantasy
FlyGui.Text = "Fly Gui (Mobile)"
FlyGui.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyGui.TextSize = 8
FlyGui.TextScaled = true
FlyGui.TextWrapped = true
FlyGui.TextXAlignment = Enum.TextXAlignment.Center
FlyGui.TextYAlignment = Enum.TextYAlignment.Center
FlyGui.TextTransparency = 0
FlyGui.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
FlyGui.TextStrokeTransparency = 1
FlyGui.LineHeight = 1
FlyGui.RichText = false
FlyGui.TextTruncate = Enum.TextTruncate.None
FlyGui.MaxVisibleGraphemes = -1
FlyGui.Transparency = 0
FlyGui.Rotation = 0
FlyGui.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = FlyGui

local UNCCheck = Instance.new("TextButton")
UNCCheck.Name = "UNCCheck"
UNCCheck.Parent = ScrollingFrame
UNCCheck.Size = UDim2.new(0, 75, 0, 50)
UNCCheck.Position = UDim2.new(0, 185, 0, 255)
UNCCheck.AnchorPoint = Vector2.new(0, 0)
UNCCheck.Visible = true
UNCCheck.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
UNCCheck.BackgroundTransparency = 0
UNCCheck.BorderColor3 = Color3.fromRGB(27, 42, 53)
UNCCheck.BorderSizePixel = 1
UNCCheck.ClipsDescendants = false
UNCCheck.LayoutOrder = 0
UNCCheck.Selectable = true
UNCCheck.SelectionGroup = false
UNCCheck.SizeConstraint = Enum.SizeConstraint.RelativeXY
UNCCheck.Rotation = 0
UNCCheck.AutomaticSize = Enum.AutomaticSize.None
UNCCheck.Font = Enum.Font.Fantasy
UNCCheck.Text = "UNC Check"
UNCCheck.TextColor3 = Color3.fromRGB(255, 255, 255)
UNCCheck.TextSize = 8
UNCCheck.TextScaled = true
UNCCheck.TextWrapped = true
UNCCheck.TextXAlignment = Enum.TextXAlignment.Center
UNCCheck.TextYAlignment = Enum.TextYAlignment.Center
UNCCheck.TextTransparency = 0
UNCCheck.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
UNCCheck.TextStrokeTransparency = 1
UNCCheck.LineHeight = 1
UNCCheck.RichText = false
UNCCheck.TextTruncate = Enum.TextTruncate.None
UNCCheck.MaxVisibleGraphemes = -1
UNCCheck.Transparency = 0
UNCCheck.Rotation = 0
UNCCheck.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = UNCCheck

local Aimbot = Instance.new("TextButton")
Aimbot.Name = "Aimbot"
Aimbot.Parent = ScrollingFrame
Aimbot.Size = UDim2.new(0, 75, 0, 50)
Aimbot.Position = UDim2.new(0, 10, 0, 135)
Aimbot.AnchorPoint = Vector2.new(0, 0)
Aimbot.Visible = true
Aimbot.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Aimbot.BackgroundTransparency = 0
Aimbot.BorderColor3 = Color3.fromRGB(27, 42, 53)
Aimbot.BorderSizePixel = 1
Aimbot.ClipsDescendants = false
Aimbot.LayoutOrder = 0
Aimbot.Selectable = true
Aimbot.SelectionGroup = false
Aimbot.SizeConstraint = Enum.SizeConstraint.RelativeXY
Aimbot.Rotation = 0
Aimbot.AutomaticSize = Enum.AutomaticSize.None
Aimbot.Font = Enum.Font.Fantasy
Aimbot.Text = "Aimbot"
Aimbot.TextColor3 = Color3.fromRGB(255, 255, 255)
Aimbot.TextSize = 8
Aimbot.TextScaled = true
Aimbot.TextWrapped = true
Aimbot.TextXAlignment = Enum.TextXAlignment.Center
Aimbot.TextYAlignment = Enum.TextYAlignment.Center
Aimbot.TextTransparency = 0
Aimbot.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Aimbot.TextStrokeTransparency = 1
Aimbot.LineHeight = 1
Aimbot.RichText = false
Aimbot.TextTruncate = Enum.TextTruncate.None
Aimbot.MaxVisibleGraphemes = -1
Aimbot.Transparency = 0
Aimbot.Rotation = 0
Aimbot.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = Aimbot

local InfiniteJump = Instance.new("TextButton")
InfiniteJump.Name = "InfiniteJump"
InfiniteJump.Parent = ScrollingFrame
InfiniteJump.Size = UDim2.new(0, 75, 0, 50)
InfiniteJump.Position = UDim2.new(0, 100, 0, 255)
InfiniteJump.AnchorPoint = Vector2.new(0, 0)
InfiniteJump.Visible = true
InfiniteJump.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
InfiniteJump.BackgroundTransparency = 0
InfiniteJump.BorderColor3 = Color3.fromRGB(27, 42, 53)
InfiniteJump.BorderSizePixel = 1
InfiniteJump.ClipsDescendants = false
InfiniteJump.LayoutOrder = 0
InfiniteJump.Selectable = true
InfiniteJump.SelectionGroup = false
InfiniteJump.SizeConstraint = Enum.SizeConstraint.RelativeXY
InfiniteJump.Rotation = 0
InfiniteJump.AutomaticSize = Enum.AutomaticSize.None
InfiniteJump.Font = Enum.Font.Fantasy
InfiniteJump.Text = "Infinite Jump"
InfiniteJump.TextColor3 = Color3.fromRGB(255, 255, 255)
InfiniteJump.TextSize = 8
InfiniteJump.TextScaled = true
InfiniteJump.TextWrapped = true
InfiniteJump.TextXAlignment = Enum.TextXAlignment.Center
InfiniteJump.TextYAlignment = Enum.TextYAlignment.Center
InfiniteJump.TextTransparency = 0
InfiniteJump.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
InfiniteJump.TextStrokeTransparency = 1
InfiniteJump.LineHeight = 1
InfiniteJump.RichText = false
InfiniteJump.TextTruncate = Enum.TextTruncate.None
InfiniteJump.MaxVisibleGraphemes = -1
InfiniteJump.Transparency = 0
InfiniteJump.Rotation = 0
InfiniteJump.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = InfiniteJump

local BackdoorScanner = Instance.new("TextButton")
BackdoorScanner.Name = "BackdoorScanner"
BackdoorScanner.Parent = ScrollingFrame
BackdoorScanner.Size = UDim2.new(0, 75, 0, 50)
BackdoorScanner.Position = UDim2.new(0, 100, 0, 195)
BackdoorScanner.AnchorPoint = Vector2.new(0, 0)
BackdoorScanner.Visible = true
BackdoorScanner.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
BackdoorScanner.BackgroundTransparency = 0
BackdoorScanner.BorderColor3 = Color3.fromRGB(27, 42, 53)
BackdoorScanner.BorderSizePixel = 1
BackdoorScanner.ClipsDescendants = false
BackdoorScanner.LayoutOrder = 0
BackdoorScanner.Selectable = true
BackdoorScanner.SelectionGroup = false
BackdoorScanner.SizeConstraint = Enum.SizeConstraint.RelativeXY
BackdoorScanner.Rotation = 0
BackdoorScanner.AutomaticSize = Enum.AutomaticSize.None
BackdoorScanner.Font = Enum.Font.Fantasy
BackdoorScanner.Text = "Lalol Backdoor"
BackdoorScanner.TextColor3 = Color3.fromRGB(255, 255, 255)
BackdoorScanner.TextSize = 8
BackdoorScanner.TextScaled = true
BackdoorScanner.TextWrapped = true
BackdoorScanner.TextXAlignment = Enum.TextXAlignment.Center
BackdoorScanner.TextYAlignment = Enum.TextYAlignment.Center
BackdoorScanner.TextTransparency = 0
BackdoorScanner.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
BackdoorScanner.TextStrokeTransparency = 1
BackdoorScanner.LineHeight = 1
BackdoorScanner.RichText = false
BackdoorScanner.TextTruncate = Enum.TextTruncate.None
BackdoorScanner.MaxVisibleGraphemes = -1
BackdoorScanner.Transparency = 0
BackdoorScanner.Rotation = 0
BackdoorScanner.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = BackdoorScanner

local Noclip = Instance.new("TextButton")
Noclip.Name = "Noclip"
Noclip.Parent = ScrollingFrame
Noclip.Size = UDim2.new(0, 75, 0, 50)
Noclip.Position = UDim2.new(0, 185, 0, 135)
Noclip.AnchorPoint = Vector2.new(0, 0)
Noclip.Visible = true
Noclip.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Noclip.BackgroundTransparency = 0
Noclip.BorderColor3 = Color3.fromRGB(27, 42, 53)
Noclip.BorderSizePixel = 1
Noclip.ClipsDescendants = false
Noclip.LayoutOrder = 0
Noclip.Selectable = true
Noclip.SelectionGroup = false
Noclip.SizeConstraint = Enum.SizeConstraint.RelativeXY
Noclip.Rotation = 0
Noclip.AutomaticSize = Enum.AutomaticSize.None
Noclip.Font = Enum.Font.Fantasy
Noclip.Text = "Noclip"
Noclip.TextColor3 = Color3.fromRGB(255, 255, 255)
Noclip.TextSize = 8
Noclip.TextScaled = true
Noclip.TextWrapped = true
Noclip.TextXAlignment = Enum.TextXAlignment.Center
Noclip.TextYAlignment = Enum.TextYAlignment.Center
Noclip.TextTransparency = 0
Noclip.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
Noclip.TextStrokeTransparency = 1
Noclip.LineHeight = 1
Noclip.RichText = false
Noclip.TextTruncate = Enum.TextTruncate.None
Noclip.MaxVisibleGraphemes = -1
Noclip.Transparency = 0
Noclip.Rotation = 0
Noclip.Transparency = 0

local UICorner = Instance.new("UICorner")
UICorner.Name = "UICorner"
UICorner.Parent = Noclip

--========================================-- 
-- This Part Has Been Written By Me Btw

local toggleGui = Instance.new("ScreenGui")
toggleGui.Parent = player:WaitForChild("PlayerGui")
toggleGui.ResetOnSpawn = false

local toggle = Instance.new("TextButton")

toggle.Name = "ToggleButton"
toggle.Parent = toggleGui

toggle.Text = "X"
toggle.TextScaled = true
toggle.TextColor3 = Color3.new(1, 1, 1)
toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
toggle.Position = UDim2.new(0, 25, 0, 75)
toggle.Size = UDim2.new(0, 50, 0, 50)
toggle.Draggable = true
toggle.Font = Enum.Font.Fantasy


local toggleCorner = Instance.new("UICorner")

toggleCorner.CornerRadius = UDim.new(0, 50)
toggleCorner.Parent = toggle

local toggleStroke = Instance.new("UIStroke")

toggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
toggleStroke.Thickness = 2.5
toggleStroke.Parent = toggle
toggleStroke.Color = Color3.fromRGB(50, 50, 50)


-- Now For The Clicks!1!1!1!1!

toggle.MouseButton1Click:Connect(function()

if MiniHub.Enabled then

MiniHub.Enabled = false

else

MiniHub.Enabled = true

   end
end)

DEX.MouseButton1Click:Connect(function()


loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
end)

InfiniteYield.MouseButton1Click:Once(function()

loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()


end)

ESP.MouseButton1Click:Connect(function()

loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/WRD%20ESP.lua"))()


end)

NamelessAdmin.MouseButton1Click:Connect(function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()

end)

FlyGui.MouseButton1Click:Connect(function()


loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()

end)



SuperRingPartsV6.MouseButton1Click:Connect(function()


loadstring(game:HttpGet("https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol"))()

end)

FreePrivateServer.MouseButton1Click:Connect(function()


loadstring(game:HttpGet("https://raw.githubusercontent.com/KietScripter/SprgScript/refs/heads/main/FreePrivateServer.lua"))()

end)



BackdoorScanner.MouseButton1Click:Connect(function()


loadstring(game:HttpGet('https://raw.githubusercontent.com/Its-LALOL/LALOL-Hub/main/Backdoor-Scanner/script'))()

end)

UNCCheck.MouseButton1Click:Connect(function()

loadstring(game:HttpGet("https://github.com/ltseverydayyou/uuuuuuu/blob/main/UNC%20test?raw=true"))()


end)

Aimbot.MouseButton1Click:Connect(function()


loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"))()


end)

InfiniteJump.MouseButton1Click:Connect(function()



local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end


  end)
end)

Noclip.MouseButton1Click:Connect(function()



local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) 
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() 




end)