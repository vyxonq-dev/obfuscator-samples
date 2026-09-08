local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

if game.CoreGui:FindFirstChild("Library") then
	game.CoreGui:FindFirstChild("Library"):Destroy()
end
if game.CoreGui:FindFirstChild("Key") then
	game.CoreGui:FindFirstChild("Key"):Destroy()
end

local Notify = loadstring(game:HttpGet("https://cortax.cc/files/notify.lua"))()
getgenv().CortaxNotify = Notify
task.wait(1)

getgenv().CortaxNotify:Send("Cortax.cc", "Key system finished loading!", 3)

local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "Cortax"
Junkie.identifier = "1009055"
Junkie.provider = "Cortax"

local Key = {}
function Key:CreateKeyUI(Version)

	local boxInput = nil
	local finalKey = nil
	local scriptFinishedLoading = false

	local LayoutCounter = 0
		
	local dragging = false
	local dragSource = nil
	local dragStart = nil
	local startPos = nil
	local iconOffset = Vector2.new(0, 0)
	local lastGoalPos = nil
	local DRAG_SPEED = 11

	local saveKey = true

	local Key_1 = Instance.new("ScreenGui")
	local Main_1 = Instance.new("Frame")
	local UICorner_1 = Instance.new("UICorner")
	local UIStroke_1 = Instance.new("UIStroke")
	local TopBar_1 = Instance.new("Frame")
	local Title_1 = Instance.new("TextLabel")
	local UIPadding_1 = Instance.new("UIPadding")
	local Description_1 = Instance.new("TextLabel")
	local UIPadding_2 = Instance.new("UIPadding")
	local NavigationHolder_1 = Instance.new("Frame")
	local UIStroke_2 = Instance.new("UIStroke")
	local UICorner_2 = Instance.new("UICorner")
	local NavLine_1 = Instance.new("Frame")
	local MinimizeButton_1 = Instance.new("TextButton")
	local MinimizeIcon_1 = Instance.new("ImageLabel")
	local CloseButton_1 = Instance.new("TextButton")
	local CloseIcon_1 = Instance.new("ImageLabel")
	local ElementsHolder_1 = Instance.new("Frame")
	local Box_1 = Instance.new("Frame")
	local BoxTitle_1 = Instance.new("TextLabel")
	local UIPadding_3 = Instance.new("UIPadding")
	local BoxDescription_1 = Instance.new("TextLabel")
	local UIPadding_4 = Instance.new("UIPadding")
	local TextBoxHolder_1 = Instance.new("Frame")
	local UIStroke_3 = Instance.new("UIStroke")
	local UICorner_3 = Instance.new("UICorner")
	local TextBox_1 = Instance.new("TextBox")
	local UIPadding_5 = Instance.new("UIPadding")
	local SubmitButtonHolder_1 = Instance.new("Frame")
	local UIStroke_4 = Instance.new("UIStroke")
	local UICorner_4 = Instance.new("UICorner")
	local SubmitButton_1 = Instance.new("TextButton")
	local ClearButtonHolder_1 = Instance.new("Frame")
	local UIStroke_5 = Instance.new("UIStroke")
	local UICorner_5 = Instance.new("UICorner")
	local ClearButton_1 = Instance.new("TextButton")
	local UICorner_6 = Instance.new("UICorner")
	local UIStroke_6 = Instance.new("UIStroke")
	local Toggle_1 = Instance.new("Frame")
	local ToggleTitle_1 = Instance.new("TextLabel")
	local UIPadding_6 = Instance.new("UIPadding")
	local ToggleDescription_1 = Instance.new("TextLabel")
	local UIPadding_7 = Instance.new("UIPadding")
	local TogglerHolder_1 = Instance.new("Frame")
	local UIStroke_7 = Instance.new("UIStroke")
	local UICorner_7 = Instance.new("UICorner")
	local TogglerIndicator_1 = Instance.new("Frame")
	local UICorner_8 = Instance.new("UICorner")
	local TogglerButton_1 = Instance.new("TextButton")
	local UIStroke_8 = Instance.new("UIStroke")
	local UICorner_9 = Instance.new("UICorner")
	local Button_1 = Instance.new("Frame")
	local ButtonHolder_1 = Instance.new("Frame")
	local UIStroke_9 = Instance.new("UIStroke")
	local UICorner_10 = Instance.new("UICorner")
	local ButtonButton_1 = Instance.new("TextButton")
	local UIStroke_10 = Instance.new("UIStroke")
	local UICorner_11 = Instance.new("UICorner")
	local ButtonHolder_2 = Instance.new("Frame")
	local UIStroke_11 = Instance.new("UIStroke")
	local UICorner_12 = Instance.new("UICorner")
	local ButtonButton_2 = Instance.new("TextButton")
	local ButtonHolder_3 = Instance.new("Frame")
	local UIStroke_99 = Instance.new("UIStroke")
	local UICorner_99 = Instance.new("UICorner")
	local UIStroke_4 = Instance.new("UIStroke")
	local UICorner_4 = Instance.new("UICorner")
	local ButtonButton_3 = Instance.new("TextButton")
	local ButtonHolder_4 = Instance.new("Frame")
	local UIStroke_100 = Instance.new("UIStroke")
	local UICorner_100 = Instance.new("UICorner")
	local ButtonButton_4 = Instance.new("TextButton")
	local DragUI_1 = Instance.new("ImageButton")
	local OpenUIHolder_1 = Instance.new("Frame")
	local UICorner_14 = Instance.new("UICorner")
	local UIStroke_13 = Instance.new("UIStroke")
	local OpenUI_1 = Instance.new("ImageButton")

	local Minimized = false
	local OriginalSize = Main_1.Size
	local IsAnimating = false
	
	Key_1.Name = "Key"
	Key_1.Parent = game.CoreGui

	Main_1.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Main_1.Name = "Main"
	Main_1.Parent = Key_1
	Main_1.Position = UDim2.new(0.5, -203.5, 0.5, -145)
	Main_1.Size = UDim2.new(0, 407, 0, 290)
	Main_1.Selectable = false

	UICorner_1.Parent = Main_1

	UIStroke_1.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_1.Parent = Main_1

	TopBar_1.BackgroundTransparency = 1
	TopBar_1.Name = "TopBar"
	TopBar_1.Parent = Main_1
	TopBar_1.Size = UDim2.new(1, 0, 0, 60)
	TopBar_1.Selectable = false

	Title_1.BackgroundTransparency = 1
	Title_1.Name = "Title"
	Title_1.Parent = TopBar_1
	Title_1.Size = UDim2.new(1, -150, 0, 60)
	Title_1.Selectable = false
	Title_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	Title_1.RichText = true
	Title_1.Text = "<b>Cortax.cc</b>"
	Title_1.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title_1.TextSize = 20
	Title_1.TextTruncate = Enum.TextTruncate.SplitWord
	Title_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_1.Parent = Title_1
	UIPadding_1.PaddingBottom = UDim.new(0, 10)
	UIPadding_1.PaddingLeft = UDim.new(0, 16)

	Description_1.BackgroundTransparency = 1
	Description_1.Name = "Description"
	Description_1.Parent = TopBar_1
	Description_1.Size = UDim2.new(1, -150, 0, 60)
	Description_1.Selectable = false
	Description_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	Description_1.RichText = true
	Description_1.Text = "Key System <b>| " .. Version .. "</b>"
	Description_1.TextColor3 = Color3.fromRGB(190, 190, 190)
	Description_1.TextSize = 16
	Description_1.TextTruncate = Enum.TextTruncate.SplitWord
	Description_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_2.Parent = Description_1
	UIPadding_2.PaddingBottom = UDim.new(0, 10)
	UIPadding_2.PaddingLeft = UDim.new(0, 16)
	UIPadding_2.PaddingTop = UDim.new(0, 40)

	NavigationHolder_1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	NavigationHolder_1.Name = "NavigationHolder"
	NavigationHolder_1.Parent = TopBar_1
	NavigationHolder_1.Position = UDim2.new(1, -76, 0.28299999237060547, 0)
	NavigationHolder_1.Size = UDim2.new(0, 60, 0, 25)
	NavigationHolder_1.Selectable = false

	UIStroke_2.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_2.Parent = NavigationHolder_1

	UICorner_2.Parent = NavigationHolder_1

	NavLine_1.AnchorPoint = Vector2.new(0.5, 0)
	NavLine_1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	NavLine_1.BorderSizePixel = 0
	NavLine_1.Name = "NavLine"
	NavLine_1.Parent = NavigationHolder_1
	NavLine_1.Position = UDim2.new(0.5, 0, 0, 0)
	NavLine_1.Size = UDim2.new(0, 1, 1, 0)
	NavLine_1.Selectable = false

	MinimizeButton_1.BackgroundTransparency = 1
	MinimizeButton_1.Name = "MinimizeButton"
	MinimizeButton_1.Parent = NavigationHolder_1
	MinimizeButton_1.Size = UDim2.new(0, 30, 0, 25)
	MinimizeButton_1.Text = ""
	MinimizeButton_1.TextSize = 14

	MinimizeIcon_1.AnchorPoint = Vector2.new(0.5, 0.5)
	MinimizeIcon_1.BackgroundTransparency = 1
	MinimizeIcon_1.Name = "MinimizeIcon"
	MinimizeIcon_1.Parent = MinimizeButton_1
	MinimizeIcon_1.Position = UDim2.new(0.5, 0, 0.5, 0)
	MinimizeIcon_1.Size = UDim2.new(0, 18, 0, 18)
	MinimizeIcon_1.Image = "rbxassetid://75550123309801"
	MinimizeIcon_1.ImageContent = Content.fromUri("rbxassetid://75550123309801")

	CloseButton_1.BackgroundTransparency = 1
	CloseButton_1.Name = "CloseButton"
	CloseButton_1.Parent = NavigationHolder_1
	CloseButton_1.Position = UDim2.new(0, 30, 0, 0)
	CloseButton_1.Size = UDim2.new(0, 30, 0, 25)
	CloseButton_1.Text = ""
	CloseButton_1.TextSize = 14

	CloseIcon_1.AnchorPoint = Vector2.new(0.5, 0.5)
	CloseIcon_1.BackgroundTransparency = 1
	CloseIcon_1.Name = "CloseIcon"
	CloseIcon_1.Parent = CloseButton_1
	CloseIcon_1.Position = UDim2.new(0.5, 0, 0.5, 0)
	CloseIcon_1.Size = UDim2.new(0, 18, 0, 18)
	CloseIcon_1.Image = "rbxassetid://101064721108854"
	CloseIcon_1.ImageContent = Content.fromUri("rbxassetid://101064721108854")

	ElementsHolder_1.BackgroundTransparency = 1
	ElementsHolder_1.Name = "ElementsHolder"
	ElementsHolder_1.Parent = TopBar_1
	ElementsHolder_1.Position = UDim2.new(0, 0, 1, 0)
	ElementsHolder_1.Size = UDim2.new(0, 407, 0, 224)
	ElementsHolder_1.Selectable = false

	Box_1.BackgroundTransparency = 1
	Box_1.Name = "Box"
	Box_1.Parent = ElementsHolder_1
	Box_1.Position = UDim2.new(0.039000000804662704, 0, 0, 5)
	Box_1.Size = UDim2.new(0.9606879353523254, -16, 0, 90)
	Box_1.ClipsDescendants = true
	Box_1.Selectable = false

	BoxTitle_1.BackgroundTransparency = 1
	BoxTitle_1.Name = "BoxTitle"
	BoxTitle_1.Parent = Box_1
	BoxTitle_1.Size = UDim2.new(1, -16, 0, 20)
	BoxTitle_1.Selectable = false
	BoxTitle_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	BoxTitle_1.RichText = true
	BoxTitle_1.Text = "<b>Enter Key</b>"
	BoxTitle_1.TextColor3 = Color3.fromRGB(170, 170, 170)
	BoxTitle_1.TextSize = 18
	BoxTitle_1.TextTruncate = Enum.TextTruncate.SplitWord
	BoxTitle_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_3.Parent = BoxTitle_1
	UIPadding_3.PaddingLeft = UDim.new(0, 10)
	UIPadding_3.PaddingTop = UDim.new(0, 8)

	BoxDescription_1.BackgroundTransparency = 1
	BoxDescription_1.Name = "BoxDescription"
	BoxDescription_1.Parent = Box_1
	BoxDescription_1.Size = UDim2.new(1, -16, 0, 20)
	BoxDescription_1.Selectable = false
	BoxDescription_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	BoxDescription_1.Text = "Enter your obtained key here"
	BoxDescription_1.TextColor3 = Color3.fromRGB(120, 120, 120)
	BoxDescription_1.TextSize = 16
	BoxDescription_1.TextTruncate = Enum.TextTruncate.SplitWord
	BoxDescription_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_4.Parent = BoxDescription_1
	UIPadding_4.PaddingLeft = UDim.new(0, 10)
	UIPadding_4.PaddingTop = UDim.new(0, 45)

	TextBoxHolder_1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	TextBoxHolder_1.Name = "TextBoxHolder"
	TextBoxHolder_1.Parent = Box_1
	TextBoxHolder_1.Position = UDim2.new(0, 10, 0, 50)
	TextBoxHolder_1.Size = UDim2.new(1, -180, 0, 30)
	TextBoxHolder_1.Selectable = false

	UIStroke_3.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_3.Parent = TextBoxHolder_1

	UICorner_3.CornerRadius = UDim.new(0, 6)
	UICorner_3.Parent = TextBoxHolder_1

	TextBox_1.BackgroundTransparency = 1
	TextBox_1.ClearTextOnFocus = false
	TextBox_1.CursorPosition = -1
	TextBox_1.Parent = TextBoxHolder_1
	TextBox_1.Size = UDim2.new(1, 0, 1, 0)
	TextBox_1.ClipsDescendants = true
	TextBox_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	TextBox_1.PlaceholderColor3 = Color3.fromRGB(190, 190, 190)
	TextBox_1.PlaceholderText = "..."
	TextBox_1.Text = ""
	TextBox_1.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextBox_1.TextSize = 16
	TextBox_1.TextTruncate = Enum.TextTruncate.SplitWord
	TextBox_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_5.Parent = TextBox_1
	UIPadding_5.PaddingLeft = UDim.new(0, 10)
	UIPadding_5.PaddingRight = UDim.new(0, 10)

	SubmitButtonHolder_1.Name = "SubmitButtonHolder"
	SubmitButtonHolder_1.Parent = Box_1
	SubmitButtonHolder_1.Position = UDim2.new(1, -160, 0, 50)
	SubmitButtonHolder_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SubmitButtonHolder_1.Size = UDim2.new(0, 70, 0, 30)
	SubmitButtonHolder_1.Selectable = false

	UIStroke_4.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_4.Parent = SubmitButtonHolder_1

	UICorner_4.CornerRadius = UDim.new(0, 6)
	UICorner_4.Parent = SubmitButtonHolder_1

	SubmitButton_1.BackgroundTransparency = 1
	SubmitButton_1.Name = "SubmitButton"
	SubmitButton_1.Parent = SubmitButtonHolder_1
	SubmitButton_1.Size = UDim2.new(1, 0, 1, 0)
	SubmitButton_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	SubmitButton_1.RichText = true
	SubmitButton_1.Text = "Submit"
	SubmitButton_1.TextSize = 17
	SubmitButton_1.TextTruncate = Enum.TextTruncate.SplitWord

	ClearButtonHolder_1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	ClearButtonHolder_1.Name = "ClearButtonHolder"
	ClearButtonHolder_1.Parent = Box_1
	ClearButtonHolder_1.Position = UDim2.new(1, -80, 0, 50)
	ClearButtonHolder_1.Size = UDim2.new(0, 70, 0, 30)
	ClearButtonHolder_1.Selectable = false

	UIStroke_5.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_5.Parent = ClearButtonHolder_1

	UICorner_5.CornerRadius = UDim.new(0, 6)
	UICorner_5.Parent = ClearButtonHolder_1

	ClearButton_1.BackgroundTransparency = 1
	ClearButton_1.Name = "ClearButton"
	ClearButton_1.Parent = ClearButtonHolder_1
	ClearButton_1.Size = UDim2.new(1, 0, 1, 0)
	ClearButton_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ClearButton_1.RichText = true
	ClearButton_1.Text = "Clear"
	ClearButton_1.TextColor3 = Color3.fromRGB(255, 255, 255)
	ClearButton_1.TextSize = 17
	ClearButton_1.TextTruncate = Enum.TextTruncate.SplitWord

	UICorner_6.Parent = Box_1

	UIStroke_6.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_6.Parent = Box_1

	Toggle_1.BackgroundTransparency = 1
	Toggle_1.Name = "Toggle"
	Toggle_1.Parent = ElementsHolder_1
	Toggle_1.Position = UDim2.new(0.039000000804662704, 0, 0, 105)
	Toggle_1.Size = UDim2.new(0.9606879353523254, -16, 0, 50)
	Toggle_1.ClipsDescendants = true
	Toggle_1.Selectable = false

	ToggleTitle_1.BackgroundTransparency = 1
	ToggleTitle_1.Name = "ToggleTitle"
	ToggleTitle_1.Parent = Toggle_1
	ToggleTitle_1.Size = UDim2.new(1, -86, 1, 0)
	ToggleTitle_1.Selectable = false
	ToggleTitle_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ToggleTitle_1.RichText = true
	ToggleTitle_1.Text = "<b>Save Key</b>"
	ToggleTitle_1.TextColor3 = Color3.fromRGB(170, 170, 170)
	ToggleTitle_1.TextSize = 18
	ToggleTitle_1.TextTruncate = Enum.TextTruncate.SplitWord
	ToggleTitle_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_6.Parent = ToggleTitle_1
	UIPadding_6.PaddingBottom = UDim.new(0, 20)
	UIPadding_6.PaddingLeft = UDim.new(0, 10)

	ToggleDescription_1.BackgroundTransparency = 1
	ToggleDescription_1.Name = "ToggleDescription"
	ToggleDescription_1.Parent = Toggle_1
	ToggleDescription_1.Size = UDim2.new(1, -86, 1, 0)
	ToggleDescription_1.Selectable = false
	ToggleDescription_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ToggleDescription_1.RichText = true
	ToggleDescription_1.Text = "Saves your key for the next execution"
	ToggleDescription_1.TextColor3 = Color3.fromRGB(120, 120, 120)
	ToggleDescription_1.TextSize = 16
	ToggleDescription_1.TextTruncate = Enum.TextTruncate.SplitWord
	ToggleDescription_1.TextXAlignment = Enum.TextXAlignment.Left

	UIPadding_7.Parent = ToggleDescription_1
	UIPadding_7.PaddingLeft = UDim.new(0, 10)
	UIPadding_7.PaddingTop = UDim.new(0, 20)

	TogglerHolder_1.AnchorPoint = Vector2.new(0, 0.5)
	TogglerHolder_1.Name = "TogglerHolder"
	TogglerHolder_1.Parent = Toggle_1
	TogglerHolder_1.Position = UDim2.new(1, -50, 0.5, 0)
	TogglerHolder_1.Size = UDim2.new(0, 40, 0, 20)
	TogglerHolder_1.Selectable = false
	TogglerHolder_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

	UIStroke_7.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_7.Parent = TogglerHolder_1

	UICorner_7.CornerRadius = UDim.new(0, 10)
	UICorner_7.Parent = TogglerHolder_1

	TogglerIndicator_1.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	TogglerIndicator_1.Name = "TogglerIndicator"
	TogglerIndicator_1.Parent = TogglerHolder_1
	TogglerIndicator_1.Position = UDim2.new(0, 20, 0, 1)
	TogglerIndicator_1.Size = UDim2.new(0, 18, 0, 18)
	TogglerIndicator_1.Selectable = false

	UICorner_8.Parent = TogglerIndicator_1

	TogglerButton_1.BackgroundTransparency = 1
	TogglerButton_1.Name = "TogglerButton"
	TogglerButton_1.Parent = TogglerHolder_1
	TogglerButton_1.Size = UDim2.new(1, 0, 1, 0)
	TogglerButton_1.Text = ""
	TogglerButton_1.TextSize = 14

	UIStroke_8.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_8.Parent = Toggle_1

	UICorner_9.Parent = Toggle_1

	Button_1.BackgroundTransparency = 1
	Button_1.Name = "Button"
	Button_1.Parent = ElementsHolder_1
	Button_1.Position = UDim2.new(0.039000000804662704, 0, 0, 165)
	Button_1.Size = UDim2.new(0.9610000252723694, -16, 0, 50)
	Button_1.ClipsDescendants = true
	Button_1.Selectable = false

	ButtonHolder_1.AnchorPoint = Vector2.new(0.5, 0.5)
	ButtonHolder_1.Name = "ButtonHolder"
	ButtonHolder_1.Parent = Button_1
	ButtonHolder_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonHolder_1.Position = UDim2.new(0, 143, 0.5, 0)
	ButtonHolder_1.Size = UDim2.new(0, 85, 0, 30)
	ButtonHolder_1.Selectable = false

	UIStroke_9.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_9.Parent = ButtonHolder_1

	UICorner_10.CornerRadius = UDim.new(0, 6)
	UICorner_10.Parent = ButtonHolder_1

	ButtonButton_1.BackgroundTransparency = 1
	ButtonButton_1.Name = "ButtonButton"
	ButtonButton_1.Parent = ButtonHolder_1
	ButtonButton_1.Size = UDim2.new(1, 0, 1, 0)
	ButtonButton_1.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ButtonButton_1.RichText = true
	ButtonButton_1.Text = "Premium"
	ButtonButton_1.TextSize = 17
	ButtonButton_1.TextTruncate = Enum.TextTruncate.SplitWord
	
	UIStroke_10.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_10.Parent = Button_1

	UICorner_11.Parent = Button_1

	ButtonHolder_2.AnchorPoint = Vector2.new(0, 0.5)
	ButtonHolder_2.Name = "ButtonHolder"
	ButtonHolder_2.Parent = Button_1
	ButtonHolder_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonHolder_2.Position = UDim2.new(0, 190, 0.5, 0)
	ButtonHolder_2.Size = UDim2.new(0, 85, 0, 30)
	ButtonHolder_2.Selectable = false

	UIStroke_11.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_11.Parent = ButtonHolder_2

	UICorner_12.CornerRadius = UDim.new(0, 6)
	UICorner_12.Parent = ButtonHolder_2

	ButtonButton_2.BackgroundTransparency = 1
	ButtonButton_2.Name = "ButtonButton"
	ButtonButton_2.Parent = ButtonHolder_2
	ButtonButton_2.Size = UDim2.new(1, 0, 1, 0)
	ButtonButton_2.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ButtonButton_2.RichText = true
	ButtonButton_2.Text = "Discord"
	ButtonButton_2.TextSize = 17
	ButtonButton_2.TextTruncate = Enum.TextTruncate.SplitWord

	ButtonHolder_3.AnchorPoint = Vector2.new(0, 0.5)
	ButtonHolder_3.Name = "ButtonHolder"
	ButtonHolder_3.Parent = Button_1
	ButtonHolder_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonHolder_3.Position = UDim2.new(0, 10, 0.5, 0)
	ButtonHolder_3.Size = UDim2.new(0, 85, 0, 30)
	ButtonHolder_3.Selectable = false

	UIStroke_99.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_99.Parent = ButtonHolder_3

	UICorner_99.CornerRadius = UDim.new(0, 6)
	UICorner_99.Parent = ButtonHolder_3

	ButtonButton_3.BackgroundTransparency = 1
	ButtonButton_3.Name = "ButtonButton"
	ButtonButton_3.Parent = ButtonHolder_3
	ButtonButton_3.Size = UDim2.new(1, 0, 1, 0)
	ButtonButton_3.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ButtonButton_3.RichText = true
	ButtonButton_3.Text = "Get Key"
	ButtonButton_3.TextSize = 17
	ButtonButton_3.TextTruncate = Enum.TextTruncate.SplitWord
	
	ButtonHolder_4.AnchorPoint = Vector2.new(0, 0.5)
	ButtonHolder_4.Name = "ButtonHolder"
	ButtonHolder_4.Parent = Button_1
	ButtonHolder_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ButtonHolder_4.Position = UDim2.new(0, 280, 0.5, 0)
	ButtonHolder_4.Size = UDim2.new(0, 85, 0, 30)
	ButtonHolder_4.Selectable = false

	UIStroke_100.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_100.Parent = ButtonHolder_4

	UICorner_100.CornerRadius = UDim.new(0, 6)
	UICorner_100.Parent = ButtonHolder_4

	ButtonButton_4.BackgroundTransparency = 1
	ButtonButton_4.Name = "ButtonButton"
	ButtonButton_4.Parent = ButtonHolder_4
	ButtonButton_4.Size = UDim2.new(1, 0, 1, 0)
	ButtonButton_4.FontFace = Font.new("rbxassetid://16658221428", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
	ButtonButton_4.RichText = true
	ButtonButton_4.Text = "Group"
	ButtonButton_4.TextSize = 17
	ButtonButton_4.TextTruncate = Enum.TextTruncate.SplitWord

	DragUI_1.AnchorPoint = Vector2.new(0.5, 0)
	DragUI_1.BackgroundTransparency = 1
	DragUI_1.Name = "DragUI"
	DragUI_1.Parent = Main_1
	DragUI_1.Position = UDim2.new(0.5, 0, 1, -5)
	DragUI_1.Size = UDim2.new(0, 267, 0, 26)
	DragUI_1.Image = "rbxassetid://85013248490002"
	DragUI_1.ImageContent = Content.fromUri("rbxassetid://85013248490002")

	OpenUIHolder_1.Active = true
	OpenUIHolder_1.AnchorPoint = Vector2.new(0.5, 0.5)
	OpenUIHolder_1.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	OpenUIHolder_1.Name = "OpenUIHolder"
	OpenUIHolder_1.Parent = Key_1
	OpenUIHolder_1.Position = UDim2.new(0, -20, 0.5, 0)
	OpenUIHolder_1.Size = UDim2.new(0, 25, 0, 25)
	OpenUIHolder_1.Selectable = false

	UICorner_14.Parent = OpenUIHolder_1

	UIStroke_13.Color = Color3.fromRGB(40, 40, 40)
	UIStroke_13.Parent = OpenUIHolder_1

	OpenUI_1.BackgroundTransparency = 1
	OpenUI_1.Name = "OpenUI"
	OpenUI_1.Parent = OpenUIHolder_1
	OpenUI_1.Size = UDim2.new(0, 25, 0, 25)
	OpenUI_1.Image = "rbxassetid://76392913095647"
	OpenUI_1.ImageContent = Content.fromUri("rbxassetid://76392913095647")

	local function ExitSequence(isClosing)
		if IsAnimating then return end
		IsAnimating = true

		OriginalSize = Main_1.Size

		for _, child in ipairs(Main_1:GetChildren()) do
			if child:IsA("GuiObject") then
				child.Visible = false
			end
		end

		local ExitTween = TweenService:Create(Main_1, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 5, 0, 0),
			Position = UDim2.new(0.5, 0, 1, 50) 
		})

		ExitTween:Play()
		ExitTween.Completed:Wait()

		if isClosing then
			Key_1:Destroy()
		else
			local OpenUIButton = TweenService:Create(OpenUIHolder_1, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
				Position = UDim2.new(0, 30, 0.5, 0)
			})
			OpenUIButton:Play()
			Minimized = true
			Main_1.Visible = false
		end

		IsAnimating = false
	end

	local function RestoreSequence()
		if not Minimized or IsAnimating then return end
		IsAnimating = true

		local ViewportSize = workspace.CurrentCamera.ViewportSize
		local TargetPos = UDim2.new(
			0.5, -OriginalSize.X.Offset / 2, 
			0.5, -OriginalSize.Y.Offset / 2
		)

		startPos = TargetPos
		lastGoalPos = TargetPos

		Main_1.Size = UDim2.new(0, 5, 0, 5)
		Main_1.Position = UDim2.new(0.5, 0, 1, -10)
		Main_1.Visible = true

		local CloseUIButton = TweenService:Create(OpenUIHolder_1, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
			Position = UDim2.new(0, -20, 0.5, 0)
		})
		CloseUIButton:Play()

		local RestoreTween = TweenService:Create(Main_1, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
			Size = OriginalSize,
			Position = TargetPos
		})

		RestoreTween:Play()
		RestoreTween.Completed:Wait()

		for _, child in ipairs(Main_1:GetChildren()) do
			if child:IsA("GuiObject") then
				child.Visible = true
			end
		end

		Minimized = false
		IsAnimating = false
	end

	local function hasFileSystemSupport()
		return type(writefile) == "function" and type(readfile) == "function"
	end

	local function saveVerifiedKey(key)
		if not hasFileSystemSupport() then return end
		if saveKey then
			pcall(function() writefile("cortax_cc_key.txt", key) end)
		end
	end

	local function grantAccess(key)
		saveVerifiedKey(key)
		getgenv().CortaxNotify:Send("Cortax.cc", "Valid key!", 1.5)
		task.wait(1.5)
		ExitSequence(true)
		finalKey = key
		scriptFinishedLoading = true
		getgenv().SCRIPT_KEY = finalKey
		loadstring(game:HttpGet("https://cortax.cc/files/games.lua"))()
	end

	local ok, savedKey = pcall(function() return readfile("cortax_cc_key.txt") end)
	if ok and savedKey and savedKey ~= "" then
		TextBox_1.Text = savedKey
		getgenv().CortaxNotify:Send("Cortax.cc", "Saved key found!", 3)
	end

	SubmitButton_1.MouseButton1Click:Connect(function()
		local buttonTween3 = TweenService:Create(SubmitButtonHolder_1, TweenInfo.new(0.1), {Position = UDim2.new(1, -160, 0, 51)})
		buttonTween3:Play()

		buttonTween3.Completed:Connect(function()
			local buttonTween4 = TweenService:Create(SubmitButtonHolder_1, TweenInfo.new(0.1), {Position = UDim2.new(1, -160, 0, 50)})
			buttonTween4:Play()
		end)

		local input = TextBox_1.Text
		local result = Junkie.check_key(input)
        
		if result and result.valid then
			grantAccess(input)
		else
			getgenv().CortaxNotify:Send("Cortax.cc", "Invalid key!", 3)
		end
	end)

	local debounce = false
	local toggled = true 

	TogglerButton_1.MouseButton1Click:Connect(function()
		if debounce == false then
			if toggled == false then
				debounce = true
				local onTween1 = TweenService:Create(TogglerIndicator_1, TweenInfo.new(0.2), {Position = UDim2.new(0, 20, 0, 1)})
				local onTween2 = TweenService:Create(TogglerIndicator_1, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(15, 15, 15)})
				local onTween3 = TweenService:Create(TogglerHolder_1, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)})
				onTween1:Play()
				onTween2:Play()
				onTween3:Play()
				debounce = false
				toggled = true
				saveKey = toggled
				getgenv().CortaxNotify:Send("Cortax.cc", "Key will be saved!", 3)
			elseif toggled == true then
				debounce = true
				local offTween1 = TweenService:Create(TogglerIndicator_1, TweenInfo.new(0.2), {Position = UDim2.new(0, 2, 0, 1)})
				local offTween2 = TweenService:Create(TogglerIndicator_1, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)})
				local offTween3 = TweenService:Create(TogglerHolder_1, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)})
				offTween1:Play()
				offTween2:Play()
				offTween3:Play()
				debounce = false
				toggled = false
				saveKey = toggled
				getgenv().CortaxNotify:Send("Cortax.cc", "Key won't be saved!", 3)
			end
		end
	end)

	ButtonButton_4.MouseButton1Click:Connect(function()
		local buttonTween3 = TweenService:Create(ButtonHolder_4, TweenInfo.new(0.1), {Position = UDim2.new(0, 280, 0.5, 1)})
		buttonTween3:Play()

		buttonTween3.Completed:Connect(function()
			local buttonTween4 = TweenService:Create(ButtonHolder_4, TweenInfo.new(0.1), {Position = UDim2.new(0, 280, 0.5, 0)})
			buttonTween4:Play()
		end)
		local link = Junkie.get_key_link()
		setclipboard("https://cortax.cc/group")
		getgenv().CortaxNotify:Send("Cortax.cc", "Roblox Group link copied to clipboard!", 3)
	end)

	ButtonButton_3.MouseButton1Click:Connect(function()
		local buttonTween3 = TweenService:Create(ButtonHolder_3, TweenInfo.new(0.1), {Position = UDim2.new(0, 10, 0.5, 1)})
		buttonTween3:Play()

		buttonTween3.Completed:Connect(function()
			local buttonTween4 = TweenService:Create(ButtonHolder_3, TweenInfo.new(0.1), {Position = UDim2.new(0, 10, 0.5, 0)})
			buttonTween4:Play()
		end)
		local link = Junkie.get_key_link()
		setclipboard(link)
		getgenv().CortaxNotify:Send("Cortax.cc", "Key link copied to clipboard!", 3)
	end)

	ButtonButton_2.MouseButton1Click:Connect(function()
		local buttonTween3 = TweenService:Create(ButtonHolder_2, TweenInfo.new(0.1), {Position = UDim2.new(0, 190, 0.5, 1)})
		buttonTween3:Play()

		buttonTween3.Completed:Connect(function()
			local buttonTween4 = TweenService:Create(ButtonHolder_2, TweenInfo.new(0.1), {Position = UDim2.new(0, 190, 0.5, 0)})
			buttonTween4:Play()
		end)
		setclipboard("https://cortax.cc/discord")
		getgenv().CortaxNotify:Send("Cortax.cc", "Discord invite copied to clipboard!", 3)
	end)

	ButtonButton_1.MouseButton1Click:Connect(function()
		local buttonTween3 = TweenService:Create(ButtonHolder_1, TweenInfo.new(0.1), {Position = UDim2.new(0, 143, 0.5, 1)})
		buttonTween3:Play()

		buttonTween3.Completed:Connect(function()
			local buttonTween4 = TweenService:Create(ButtonHolder_1, TweenInfo.new(0.1), {Position = UDim2.new(0, 143, 0.5, 0)})
			buttonTween4:Play()
		end)
		setclipboard("https://cortax.cc/shop")
		getgenv().CortaxNotify:Send("Cortax.cc", "Shop copied to clipboard!", 3)
	end)

	ClearButton_1.MouseButton1Click:Connect(function()
		local buttonTween3 = TweenService:Create(ClearButtonHolder_1, TweenInfo.new(0.1), {Position = UDim2.new(1, -80, 0, 51)})
		buttonTween3:Play()

		buttonTween3.Completed:Connect(function()
			local buttonTween4 = TweenService:Create(ClearButtonHolder_1, TweenInfo.new(0.1), {Position = UDim2.new(1, -80, 0, 50)})
			buttonTween4:Play()
		end)
		TextBox_1.Text = ""
		boxInput = ""
		getgenv().CortaxNotify:Send("Cortax.cc", "Cleared Input", 3)
	end)

	local function Lerp(a, b, m)
		return a + (b - a) * m
	end

	local function Update(dt)
		if not startPos then return end

		if dragging then
			local mouseLocation = UserInputService:GetMouseLocation()
			local delta = mouseLocation - dragStart

			lastGoalPos = UDim2.new(
				startPos.X.Scale, startPos.X.Offset + delta.X, 
				startPos.Y.Scale, startPos.Y.Offset + delta.Y
			)
		end

		if lastGoalPos then
			Main_1.Position = UDim2.new(
				lastGoalPos.X.Scale, 
				Lerp(Main_1.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED),
				lastGoalPos.Y.Scale, 
				Lerp(Main_1.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED)
			)
		end
	end

	local function InitDrag(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = UserInputService:GetMouseLocation()
			startPos = Main_1.Position

			local connection
			connection = UserInputService.InputEnded:Connect(function(endInput)
				if endInput.UserInputType == Enum.UserInputType.MouseButton1 or endInput.UserInputType == Enum.UserInputType.Touch then
					dragging = false
					connection:Disconnect()
				end
			end)
		end
	end

	Main_1.InputBegan:Connect(InitDrag)
	DragUI_1.InputBegan:Connect(InitDrag)

	RunService.Heartbeat:Connect(Update)

	MinimizeButton_1.MouseButton1Click:Connect(function()
		ExitSequence(false)
	end)

	CloseButton_1.MouseButton1Click:Connect(function()
		ExitSequence(true)
	end)

	OpenUI_1.MouseButton1Click:Connect(function()
		if Minimized then
			RestoreSequence()
		end
	end)

	UserInputService.InputBegan:Connect(function(input, gp)
		if not gp and input.KeyCode == Enum.KeyCode.LeftControl then
			if Minimized then
				RestoreSequence()
			end
		end
	end)

	UserInputService.InputBegan:Connect(function(input, gp)
		if not gp and input.KeyCode == Enum.KeyCode.LeftControl then
			if not Minimized then
				ExitSequence()
			end
		end
	end)
end

Key:CreateKeyUI("2.3.1-hotfix")

return Key