function identifyexecutor()
   return "Executor"
end

if game.CoreGui:FindFirstChild("Execute") == nil then
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "Execute"

_G.GuiName = {
	{ "FrameGui", "Frame" },
	{ "Label", "TextLabel" },
	{ "Button", "TextButton" },
	{ "ImagesLabel", "ImageLabel" },
	{ "ImagesButton", "ImageButton" },
	{ "Box", "TextBox" },
	{ "Corner", "UICorner" },
	{ "Stroke", "UIStroke" },
	{ "Gradient", "UIGradient" },
	{ "ListLayout", "UIListLayout" },
	{ "Scrolling", "ScrollingFrame" },
	{ "Script", "LocalScript" }
}

makefolder("ExecuteGet/Script")
makefolder("ExecuteGet/TabScript")

if game.CoreGui:FindFirstChild("Execute") then
Exe = game.CoreGui:FindFirstChild("Execute")
end

if Exe:FindFirstChild("ToggleUi1") == nil then
local TOGGLE = {}
TOGGLE["Ui"] = Instance.new("ScreenGui", gui)
TOGGLE["DaIcon"] = Instance.new("ImageButton", TOGGLE["Ui"])
TOGGLE["das"] = Instance.new("UICorner", TOGGLE["DaIcon"])

TOGGLE["Ui"].Name = "ToggleUi1"
TOGGLE["Ui"].ResetOnSpawn = false

TOGGLE["DaIcon"].Size = UDim2.new(0,45,0,45)
local DaIconPositionX = game:GetService("GuiService"):GetScreenResolution().X / 2 - TOGGLE["DaIcon"].Size.X.Offset / 2
local DaIconPositionY = game:GetService("GuiService"):GetScreenResolution().Y / 2 - TOGGLE["DaIcon"].Size.Y.Offset / 2
TOGGLE["DaIcon"].Position = UDim2.new(0,DaIconPositionX,0,DaIconPositionY/20)
TOGGLE["DaIcon"].Draggable = true
TOGGLE["DaIcon"].Image = "rbxassetid://7734091286"
TOGGLE["DaIcon"].BackgroundColor3 = Color3.fromRGB(255, 186, 117)
TOGGLE["DaIcon"].BorderColor3 = Color3.fromRGB(255, 186, 117)
task.spawn(function()
while true do
    for i = 0, 255, 4 do
        TOGGLE["DaIcon"].BorderColor3 = Color3.fromHSV(i/256, 1, 1)
        TOGGLE["DaIcon"].BackgroundColor3 = Color3.fromHSV(i/256, .5, .8)
        wait()
    end
end
end)
TOGGLE["DaIcon"].MouseButton1Click:Connect(function()
if Exe:FindFirstChild("MainUi") then
	Exe:FindFirstChild("MainUi").Visible = not Exe:FindFirstChild("MainUi").Visible
end
end)
TOGGLE["das"]["CornerRadius"] = UDim.new(0.20000000298023224, 0)
end

------ Clear Script ------

function CreateClear(Name,call)
if game.CoreGui.Execute:FindFirstChild(Name) ~= nil then
game.CoreGui.Execute:FindFirstChild(Name):Destroy()
else
local StartClear = Instance.new("Frame")
StartClear.Name = Name
StartClear.Size = UDim2.new(0, 310, 0, 125)
StartClear.Position = UDim2.new(0.3, 0, 0.3, 0)
StartClear.BackgroundColor3 = Color3.new(1, 1, 1)
StartClear.Active = true
StartClear.BackgroundTransparency = 0 
StartClear.Draggable = true
StartClear.Parent = gui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = StartClear

local UICorner = Instance.new("UIStroke")
UICorner.Color = Color3.new(0, 0, 0)
UICorner.Thickness = 2.7
UICorner.Parent = StartClear

local FrameTextLabel = Instance.new("Frame")
FrameTextLabel.Size = UDim2.new(0.95, 0, 0.35, 0)
FrameTextLabel.Position = UDim2.new(0.025, 0, 0.08, 0)
FrameTextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
FrameTextLabel.BorderColor3 = Color3.new(0, 0, 0)
FrameTextLabel.BorderSizePixel = 1
FrameTextLabel.Active = true
FrameTextLabel.BackgroundTransparency = 0 
FrameTextLabel.Parent = StartClear

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = FrameTextLabel

local UICorner = Instance.new("UIStroke")
UICorner.Color = Color3.new(0, 0, 0)
UICorner.Thickness = 2.4
UICorner.Parent = FrameTextLabel

local LabelClear = Instance.new("TextLabel")
LabelClear.Size = UDim2.new(1, 0, 1, 0)
LabelClear.Position = UDim2.new(0, 0, 0, 0)
LabelClear.BackgroundColor3 = Color3.new(1,1,1)
LabelClear.Text = "Are You Ready "..Name.."?"
LabelClear.TextSize = 11
LabelClear.TextWrapped = true
LabelClear.TextColor3 = Color3.new(0,0,0)
LabelClear.BackgroundTransparency = 1
LabelClear.Parent = FrameTextLabel

local FrameTextButton = Instance.new("Frame")
FrameTextButton.Size = UDim2.new(0.4, 0, 0.4, 0)
FrameTextButton.Position = UDim2.new(0.06, 0, 0.51, 0)
FrameTextButton.BackgroundColor3 = Color3.new(1, 1, 1)
FrameTextButton.BorderColor3 = Color3.new(0, 0, 0)
FrameTextButton.BorderSizePixel = 1
FrameTextButton.Active = true
FrameTextButton.BackgroundTransparency = 0
FrameTextButton.Parent = StartClear

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = FrameTextButton

local UICorner = Instance.new("UIStroke")
UICorner.Color = Color3.new(0, 0, 0)
UICorner.Thickness = 2.4
UICorner.Parent = FrameTextButton

local YesClear = Instance.new("TextButton")
YesClear.Size = UDim2.new(1, 0, 1, 0)
YesClear.Position = UDim2.new(0, 0, 0, 0)
YesClear.BackgroundColor3 = Color3.new(1,1,1)
YesClear.Text = "Yes"
YesClear.TextSize = 15
YesClear.BackgroundTransparency = 1
YesClear.TextColor3 = Color3.new(0,0,0)
YesClear.Parent = FrameTextButton
YesClear.MouseButton1Click:Connect(function()
pcall(call)
game.CoreGui.Execute:FindFirstChild(Name):Destroy()
end)

local FrameTextButton = Instance.new("Frame")
FrameTextButton.Size = UDim2.new(0.4, 0, 0.4, 0)
FrameTextButton.Position = UDim2.new(0.52, 0, 0.5, 0)
FrameTextButton.BackgroundColor3 = Color3.new(1, 1, 1)
FrameTextButton.BorderColor3 = Color3.new(0, 0, 0)
FrameTextButton.BorderSizePixel = 1
FrameTextButton.Active = true
FrameTextButton.BackgroundTransparency = 0
FrameTextButton.Parent = StartClear

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = FrameTextButton

local UICorner = Instance.new("UIStroke")
UICorner.Color = Color3.new(0, 0, 0)
UICorner.Thickness = 2.4
UICorner.Parent = FrameTextButton

local NoClear = Instance.new("TextButton")
NoClear.Size = UDim2.new(1, 0, 1, 0)
NoClear.Position = UDim2.new(0, 0, 0, 0)
NoClear.BackgroundColor3 = Color3.new(1,1,1)
NoClear.Text = "No"
NoClear.TextSize = 15
NoClear.BackgroundTransparency = 1
NoClear.TextColor3 = Color3.new(0,0,0)
NoClear.Parent = FrameTextButton
NoClear.MouseButton1Click:Connect(function()
game.CoreGui.Execute:FindFirstChild(Name):Destroy()
end)
end
end

local Color0 = Color3.new(0, 0, 0)
local Color1 = Color3.new(255, 255, 255)

local Frame1 = Instance.new("Frame")
Frame1.Name = "MainUi"
Frame1.Size = UDim2.new(0, 500, 0, 260)
Frame1.Position = UDim2.new(0.5, -264, 0.5, -148)
Frame1.BackgroundColor3 = Color3.new(1, 1, 1)
Frame1.BorderColor3 = Color3.new(0, 0, 0)
Frame1.BorderSizePixel = 1
Frame1.Active = true
Frame1.BackgroundTransparency = 0 
Frame1.Draggable = true
Frame1.Parent = gui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 7)
UICorner.Parent = Frame1

local UICorner = Instance.new("UIStroke")
UICorner.Color = Color3.new(0, 0, 0)
UICorner.Thickness = 3
UICorner.Parent = Frame1

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(1, 0, 0.13, 0)
TextLabel.Position = UDim2.new(0, 0, 0, 0)
TextLabel.BackgroundColor3 = Color1
TextLabel.BorderColor3 = Color3.new(0, 0, 0)
TextLabel.BorderSizePixel = 1
TextLabel.Text = "Article Hub - Executor"
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color0
TextLabel.Font = Enum.Font.Code
TextLabel.FontSize = "Size18"
TextLabel.Parent = Frame1

local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(0.08, 0, 1, 0)
TextButton.Position = UDim2.new(0.92, 0, 0, 0)
TextButton.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = "X"
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size28"
TextButton.Parent = TextLabel
TextButton.MouseButton1Click:Connect(function()
gui:Destroy()
end)

local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(0.08, 0, 1, 0)
TextButton.Position = UDim2.new(0.84, 0, 0, 0)
TextButton.BackgroundColor3 = Color3.new(0, 0, 0)
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = "-"
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size28"
TextButton.Parent = TextLabel
TextButton.MouseButton1Click:Connect(function()
if Exe:FindFirstChild("MainUi") then
	Exe:FindFirstChild("MainUi").Visible = false
end
end)

local ImageButton = Instance.new("ImageButton")
ImageButton.Size = UDim2.new(0.08, 0, 1, 0)
ImageButton.Position = UDim2.new(0, 0, 0, 0)
ImageButton.BackgroundColor3 = Color0
ImageButton.ImageColor3 = Color0
ImageButton.Image = "rbxassetid://4370318685"
ImageButton.ImageTransparency = 0
ImageButton.BackgroundTransparency = 1
ImageButton.Parent = TextLabel
ImageButton.MouseButton1Click:Connect(function()
if Exe:FindFirstChild("MainUi") and Exe.MainUi:FindFirstChild("FileHub") and Exe.MainUi.FileHub:FindFirstChild("Main") then
Exe.MainUi.FileHub.Main.ChoseHub.Visible = not Exe.MainUi.FileHub.Main.ChoseHub.Visible
end
end)

local FolderTab = Instance.new("Folder")
FolderTab.Name = "FileHub"
FolderTab.Parent = Frame1
if Exe:FindFirstChild("MainUi") and Exe.MainUi:FindFirstChild("FileHub") then
FolderTabRe = Exe.MainUi:FindFirstChild("FileHub")
end
function TabletFol(Name)
for i, v in pairs(Exe.MainUi:FindFirstChild("FileHub"):GetChildren()) do
if v:IsA("Frame") then
v.Visible = false
end
end
if Exe.MainUi:FindFirstChild("FileHub"):FindFirstChild(Name) then
Exe.MainUi:FindFirstChild("FileHub")[Name].Visible = true
end
end

local Frame = Instance.new("Frame")
Frame.Name = "Main"
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BorderColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 1
Frame.Active = true
Frame.ZIndex = 0
Frame.BackgroundTransparency = 1
Frame.Parent = FolderTabRe

if FolderTabRe:FindFirstChild("Main") then
Main = FolderTabRe.Main
end

local ButtonNext = Instance.new("TextButton")
ButtonNext.Name = "NextToMain"
ButtonNext.Size = UDim2.new(0.08, 0, 1, 0)
ButtonNext.Position = UDim2.new(0.089, 0, 0, 0)
ButtonNext.BackgroundColor3 = Color1
ButtonNext.BorderColor3 = Color3.new(0, 0, 0)
ButtonNext.BorderSizePixel = 1
ButtonNext.Text = "<"
ButtonNext.BackgroundTransparency = 1
ButtonNext.TextColor3 = Color0
ButtonNext.Font = Enum.Font.Code
ButtonNext.FontSize = "Size18"
ButtonNext.Parent = TextLabel
ButtonNext.MouseButton1Click:Connect(function()
	TabletFol("Main")
end)

local TextBox = Instance.new("TextBox")
TextBox.Name = "ScriptBox (Normal)"
TextBox.Size = UDim2.new(0.98, 0, 0.5, 0)
TextBox.Position = UDim2.new(0.01, 0, 0.3, 0)
TextBox.BackgroundColor3 = Color1
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 1
TextBox.Text = ""
TextBox.PlaceholderText = "Welcome To Executor, Get Some You Have Insert the Script so it can be Execute"
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextWrapped = true
TextBox.ClipsDescendants = true
TextBox.MultiLine = true
TextBox.ClearTextOnFocus = false
TextBox.TextColor3 = Color0
TextBox.BackgroundTransparency = 0
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 15
TextBox.Parent = Frame

local Folder = Instance.new("Folder")
Folder.Name = "FileTab"
Folder.Parent = Frame

local Framebutton = Instance.new("Frame")
Framebutton.Size = UDim2.new(0.98, 0, 0.15, 0)
Framebutton.Position = UDim2.new(0.01, 0, 0.83, 0)
Framebutton.BackgroundColor3 = Color0
Framebutton.BorderColor3 = Color3.new(0, 0, 0)
Framebutton.BorderSizePixel = 1
Framebutton.Active = true
Framebutton.BackgroundTransparency = 1
Framebutton.Parent = Frame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Framebutton

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.HorizontalAlignment = "Left"
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.FillDirection = "Horizontal"
UIListLayout.VerticalAlignment = "Center"
UIListLayout.Parent = Framebutton

local function Button(Name, Callback)
ButtonClone = Instance.new("Frame")
ButtonClone.Size = UDim2.new(0.1867, 0, 1, 0)
ButtonClone.Position = UDim2.new(0, 0, 0, 0)
ButtonClone.BackgroundColor3 = Color3.new(1, 1, 1)
ButtonClone.BorderColor3 = Color3.new(0, 0, 0)
ButtonClone.BorderSizePixel = 1
ButtonClone.Active = true
ButtonClone.BackgroundTransparency = 0 
ButtonClone.Parent = Framebutton

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = ButtonClone

local Stoke = Instance.new("UIStroke")
Stoke.Color = Color3.new(0, 0, 0)
Stoke.Thickness = 2
Stoke.Parent = ButtonClone

local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.BackgroundColor3 = Color1
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = Name
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size18"
TextButton.Parent = ButtonClone
TextButton.MouseButton1Click:Connect(function()
	pcall(Callback)
end)
end

Button("Execute", function()
TextTab = nil
if Main:FindFirstChild("FileTab") then
for i, v in pairs(Main:FindFirstChild("FileTab"):GetChildren()) do
if v:IsA("TextBox") and v.Visible == true then
TextTab = v
end
end
end
if TextTab then
func, err = loadstring(TextTab.Text)
else
if Main:FindFirstChild("ScriptBox (Normal)") then
func, err = loadstring(Main:FindFirstChild("ScriptBox (Normal)").Text)
end
end
    if func then
        pcall(func)
    else
        print(err)
  end
end)

Button("Clear", function()
TextTabClear = nil
CreateClear("Create Script", function()
if Main:FindFirstChild("FileTab") then
for i, v in pairs(Main:FindFirstChild("FileTab"):GetChildren()) do
if v:IsA("TextBox") and v.Visible == true then
TextTabClear = v
end
end
end
if TextTabClear then
TextTabClear.Text = ""
else
if Main:FindFirstChild("ScriptBox (Normal)") then
Main:FindFirstChild("ScriptBox (Normal)").Text = ""
end
end
end)
end)

Button("Copy", function()
TextTabCopy = nil
if Main:FindFirstChild("FileTab") then
for i, v in pairs(Main:FindFirstChild("FileTab"):GetChildren()) do
if v:IsA("TextBox") and v.Visible == true then
TextTabCopy = v
end
end
end
if TextTabCopy then
setclipboard(TextTabCopy.Text)
else
if Main:FindFirstChild("ScriptBox (Normal)") then
setclipboard(Main:FindFirstChild("ScriptBox (Normal)").Text)
end
end
end)

Button("Save Script", function()
TextTabSave = nil
if Main:FindFirstChild("FileTab") then
for i, v in pairs(Main:FindFirstChild("FileTab"):GetChildren()) do
if v:IsA("TextBox") and v.Visible == true then
TextTabSave = v
end
end
end
if TextTabSave then
writefile("ExecuteGet/Script/"..TextTabSave.Name.."", TextTabSave.Text)
ButtonTab3(TextTabSave.Name, TextTabSave.Text)
else
if Main:FindFirstChild("ScriptBox (Normal)") then
writefile("ExecuteGet/Script/".."ScriptBox (Normal)".."", Main:FindFirstChild("ScriptBox (Normal)").Text)
ButtonTab3("ScriptBox (Normal)", Main:FindFirstChild("ScriptBox (Normal)").Text)
end
end
end)

Button("Script Hub", function()
TabletFol("SCRIPTHUB")
end)

---- Create Tab ----

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "TabScrolling"
ScrollingFrame.Size = UDim2.new(0.88, 0, 0.13, 0)
ScrollingFrame.Position = UDim2.new(0.11, 0, 0.15, 0)
ScrollingFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame.BorderSizePixel = 1.5
ScrollingFrame.BackgroundTransparency = 0 
ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.X
ScrollingFrame.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.None
ScrollingFrame.ScrollBarThickness = 0
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame.Parent = Frame

local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0, 5)
Padding.Parent = ScrollingFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout.Parent = ScrollingFrame

local function updateCanvasSize()
    local contentWidth = UIListLayout.AbsoluteContentSize.X + 10
    ScrollingFrame.CanvasSize = UDim2.new(0, contentWidth, 0, ScrollingFrame.AbsoluteSize.Y)
end

updateCanvasSize()
ScrollingFrame.ChildAdded:Connect(updateCanvasSize)
ScrollingFrame.ChildRemoved:Connect(updateCanvasSize)

local ButtonClone = Instance.new("Frame")
ButtonClone.Name = "Normal"
ButtonClone.Size = UDim2.new(0, 100, 0, 25)
ButtonClone.Position = UDim2.new(0, 0, 0, 0)
ButtonClone.BackgroundColor3 = Color3.new(1, 1, 1)
ButtonClone.BorderColor3 = Color3.new(0, 0, 0)
ButtonClone.BorderSizePixel = 1
ButtonClone.Active = true
ButtonClone.BackgroundTransparency = 0 
ButtonClone.Parent = ScrollingFrame

local Stoke = Instance.new("UIStroke")
Stoke.Color = Color3.new(0, 0, 0)
Stoke.Thickness = 2
Stoke.Parent = ButtonClone

local TextButton = Instance.new("TextButton")
TextButton.Name = "Tab Normal"
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.BackgroundColor3 = Color1
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = "Normal"
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size14"
TextButton.Parent = ButtonClone
TextButton.MouseButton1Click:Connect(function()
if Main:FindFirstChild("FileTab") then
for i, v in pairs(Main:FindFirstChild("FileTab"):GetChildren()) do
if v:IsA("TextBox") and v.Visible == true then
v.Visible = false
end
end
end
if Main:FindFirstChild("ScriptBox (Normal)") then
Main:FindFirstChild("ScriptBox (Normal)").Visible = true
end
end)

function ScrollingButton(Name, FolderScript)
ButtonClone = Instance.new("Frame")
ButtonClone.Name = Name
ButtonClone.Size = UDim2.new(0, 100, 0, 25)
ButtonClone.Position = UDim2.new(0, 0, 0, 0)
ButtonClone.BackgroundColor3 = Color3.new(1, 1, 1)
ButtonClone.BorderColor3 = Color3.new(0, 0, 0)
ButtonClone.BorderSizePixel = 1
ButtonClone.Active = true
ButtonClone.BackgroundTransparency = 0 
ButtonClone.Parent = ScrollingFrame

local Stoke = Instance.new("UIStroke")
Stoke.Color = Color3.new(0, 0, 0)
Stoke.Thickness = 2
Stoke.Parent = ButtonClone

local TextButton = Instance.new("TextButton")
TextButton.Name = "New "..Name
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.BackgroundColor3 = Color1
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = Name
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size14"
TextButton.Parent = ButtonClone
TextButton.MouseButton1Click:Connect(function()
if Main:FindFirstChild("FileTab") then
for i, v in pairs(Main:FindFirstChild("FileTab"):GetChildren()) do
if v:IsA("TextBox") and v.Visible == true then
v.Visible = false
end
end
if Main.FileTab:FindFirstChild("ScriptBox ("..Name..")") then
Main.FileTab["ScriptBox ("..Name..")"].Visible = true
end
end
end)

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.2, 0, 1, 0)
Button.Position = UDim2.new(0.8, 0, 0, 0)
Button.BackgroundColor3 = Color3.new(0, 0, 0)
Button.BorderColor3 = Color3.new(0, 0, 0)
Button.BorderSizePixel = 1
Button.Text = "X"
Button.BackgroundTransparency = 1
Button.TextColor3 = Color0
Button.Font = Enum.Font.Code
Button.FontSize = "Size18"
Button.Parent = TextButton
Button.MouseButton1Click:Connect(function()
if Main:FindFirstChild("FileTab") then
delfolder("ExecuteGet/TabScript/"..Name.."")
Main.TabScrolling:FindFirstChild(Name):Destroy()
Main.FileTab:FindFirstChild("ScriptBox ("..Name..")"):Destroy()
_G.MusTab = 0
for i,v in pairs(Main.FileTab:GetChildren()) do
if v:IsA("TextBox") then
_G.MusTab = _G.MusTab + 1
end
end
if Main:FindFirstChild("ScriptBox (Normal)") then
Main:FindFirstChild("ScriptBox (Normal)").Visible = true
end
end
end)

if writefile then
	writefile("ExecuteGet/TabScript/"..Name.."/Script", "")
end

if Main:FindFirstChild("FileTab") then
local CloneTextBox = Main:FindFirstChild("ScriptBox (Normal)"):Clone()
CloneTextBox.Visible = false
CloneTextBox.Text = FolderScript or ""
CloneTextBox.Name = "ScriptBox ("..Name..")"
CloneTextBox.PlaceholderText = Name..", Get Some You Have Insert the Script so it can be Execute"
CloneTextBox.Parent = Main.FileTab
CloneTextBox:GetPropertyChangedSignal("Text"):Connect(function()
	if writefile then
		writefile("ExecuteGet/TabScript/"..Name.."/Script", CloneTextBox.Text)
	end
end)
end
end

if _G.MusTab == nil then
    _G.MusTab = 0
end
local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(0.087, 0, 0.13, 0)
TextButton.Position = UDim2.new(0.01, 0, 0.15, 0)
TextButton.BackgroundColor3 = Color1
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = "+"
TextButton.BackgroundTransparency = 0
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size24"
TextButton.Parent = Frame
TextButton.MouseButton1Click:Connect(function()
_G.MusTab = _G.MusTab + 1
if not isfolder("ExecuteGet/TabScript/Tab "..tostring(_G.MusTab)) then
ScrollingButton("Tab "..tostring(_G.MusTab), "")
makefolder("ExecuteGet/TabScript/Tab "..tostring(_G.MusTab))
else
_G.MusTab = _G.MusTab + 1
ScrollingButton("Tab "..tostring(_G.MusTab), "")
makefolder("ExecuteGet/TabScript/Tab "..tostring(_G.MusTab).."")
end
end)

local prefix = "ExecuteGet/TabScript/"
for i, v in ipairs(listfiles(prefix)) do
	if isfolder(v) then
		folderName = v:match("^.+[\\/](.+)$") or v
		for _, f in ipairs(listfiles(v)) do
			if isfile(f) then
				ScrollingButton(folderName, readfile(f))
			end
		end
	end
end

--- Tab Hub New ---

local FrameOb = Instance.new("Frame")
FrameOb.Name = "ChoseHub"
FrameOb.Size = UDim2.new(0.3, 0, 1, 0)
FrameOb.Position = UDim2.new(-0.32, 0, 0, 0)
FrameOb.BackgroundColor3 = Color3.new(1, 1, 1)
FrameOb.BorderColor3 = Color3.new(0, 0, 0)
FrameOb.BorderSizePixel = 1
FrameOb.Active = true
FrameOb.Visible = false
FrameOb.BackgroundTransparency = 0 
FrameOb.Parent = Frame

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 7)
UICorner.Parent = FrameOb

local UICorner = Instance.new("UIStroke")
UICorner.Color = Color3.new(0, 0, 0)
UICorner.Thickness = 3
UICorner.Parent = FrameOb

local ScrollingFrame2 = Instance.new("ScrollingFrame")
ScrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame2.Position = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame2.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame2.BorderSizePixel = 1
ScrollingFrame2.BackgroundTransparency = 1
ScrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame2.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.ScrollBarThickness = 6
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.Parent = FrameOb

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.Parent = ScrollingFrame2

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame2

local function updateCanvasSize2()
    local contentHeight = UIListLayout.AbsoluteContentSize.Y
    ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, contentHeight)
end

updateCanvasSize2()
ScrollingFrame2.ChildAdded:Connect(updateCanvasSize2)
ScrollingFrame2.ChildRemoved:Connect(updateCanvasSize2)

local function ButtonTab2(Name, Callback)
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.9, 0, 0, 30)
Button.Position = UDim2.new(0.8, 0, 0, 0)
Button.BackgroundColor3 = Color1
Button.BorderColor3 = Color3.new(0, 0, 0)
Button.BorderSizePixel = 1
Button.Text = Name
Button.BackgroundTransparency = 0
Button.TextColor3 = Color0
Button.Font = Enum.Font.Code
Button.FontSize = "Size18"
Button.Parent = ScrollingFrame2
Button.MouseButton1Click:Connect(function()
	pcall(Callback)
end)
end

ButtonTab2("Save Script", function()
TabletFol("SaveScript")
end)

ButtonTab2("Create Gui", function()
TabletFol("CreateGui")
end)

------ Save Script --------

local FrameSave = Instance.new("Frame")
FrameSave.Name = "SaveScript"
FrameSave.Size = UDim2.new(1, 0, 1, 0)
FrameSave.Position = UDim2.new(0, 0, 0, 0)
FrameSave.BackgroundColor3 = Color3.new(1, 1, 1)
FrameSave.BorderColor3 = Color3.new(0, 0, 0)
FrameSave.BorderSizePixel = 1
FrameSave.Active = true
FrameSave.Visible = false
FrameSave.ZIndex = 0
FrameSave.BackgroundTransparency = 1
FrameSave.Parent = FolderTabRe

local NameSave = Instance.new("TextBox")
NameSave.Size = UDim2.new(0.98, 0, 0.13, 0)
NameSave.Position = UDim2.new(0.01, 0, 0.15, 0)
NameSave.BackgroundColor3 = Color1
NameSave.BorderColor3 = Color3.new(0, 0, 0)
NameSave.BorderSizePixel = 1
NameSave.Text = ""
NameSave.TextWrapped = true
NameSave.PlaceholderText = "What is name save script"
NameSave.TextColor3 = Color0
NameSave.BackgroundTransparency = 0
NameSave.Font = Enum.Font.Code
NameSave.FontSize = "Size18"
NameSave.Parent = FrameSave

local CloneTextBox = Main:FindFirstChild("ScriptBox (Normal)"):Clone()
CloneTextBox.Name = "ScriptSave"
CloneTextBox.Text = ""
CloneTextBox.Size = UDim2.new(0.98, 0, 0.5, 0)
CloneTextBox.Position = UDim2.new(0.01, 0, 0.3, 0)
CloneTextBox.PlaceholderText = "Get Some You Have Insert the Script so it can be Saves"
CloneTextBox.Parent = FrameSave

local Framebutton = Instance.new("Frame")
Framebutton.Size = UDim2.new(0.98, 0, 0.15, 0)
Framebutton.Position = UDim2.new(0.01, 0, 0.83, 0)
Framebutton.BackgroundColor3 = Color0
Framebutton.BorderColor3 = Color3.new(0, 0, 0)
Framebutton.BorderSizePixel = 1
Framebutton.Active = true
Framebutton.BackgroundTransparency = 1
Framebutton.Parent = FrameSave

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Framebutton

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.HorizontalAlignment = "Left"
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.FillDirection = "Horizontal"
UIListLayout.VerticalAlignment = "Center"
UIListLayout.Parent = Framebutton

local function ButtonSave(Name, Callback)
ButtonClone = Instance.new("Frame")
ButtonClone.Size = UDim2.new(0.32, 0, 1, 0)
ButtonClone.Position = UDim2.new(0, 0, 0, 0)
ButtonClone.BackgroundColor3 = Color3.new(1, 1, 1)
ButtonClone.BorderColor3 = Color3.new(0, 0, 0)
ButtonClone.BorderSizePixel = 1
ButtonClone.Active = true
ButtonClone.BackgroundTransparency = 0 
ButtonClone.Parent = Framebutton

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = ButtonClone

local Stoke = Instance.new("UIStroke")
Stoke.Color = Color3.new(0, 0, 0)
Stoke.Thickness = 2
Stoke.Parent = ButtonClone

local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.BackgroundColor3 = Color1
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = Name
TextButton.TextWrapped = true
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size14"
TextButton.Parent = ButtonClone
TextButton.MouseButton1Click:Connect(function()
	pcall(Callback)
end)
end

ButtonSave("Save Script", function()
if FolderTabRe:FindFirstChild("SaveScript") and FolderTabRe.SaveScript:FindFirstChild("TextBox") then
writefile("ExecuteGet/Script/"..FolderTabRe.SaveScript:FindFirstChild("TextBox").Text.."", FolderTabRe.SaveScript:FindFirstChild("ScriptSave").Text)
ButtonTab3(FolderTabRe.SaveScript:FindFirstChild("TextBox").Text, FolderTabRe.SaveScript:FindFirstChild("ScriptSave").Text)
end
end)

ButtonSave("Clear Script", function()
CreateClear("Clear Script", function()
if FolderTabRe:FindFirstChild("SaveScript") and FolderTabRe.SaveScript:FindFirstChild("TextBox") then
FolderTabRe.SaveScript:FindFirstChild("TextBox").Text = ""
FolderTabRe.SaveScript:FindFirstChild("ScriptSave").Text = ""
end
end)
end)

ButtonSave("Open Save", function()
TabletFol("OpenSaveScript")
end)

------ Open Save Script --------

local FrameSaveOpen = Instance.new("Frame")
FrameSaveOpen.Name = "OpenSaveScript"
FrameSaveOpen.Size = UDim2.new(1, 0, 1, 0)
FrameSaveOpen.Position = UDim2.new(0, 0, 0, 0)
FrameSaveOpen.BackgroundColor3 = Color3.new(1, 1, 1)
FrameSaveOpen.BorderColor3 = Color3.new(0, 0, 0)
FrameSaveOpen.BorderSizePixel = 1
FrameSaveOpen.Active = true
FrameSaveOpen.Visible = false
FrameSaveOpen.ZIndex = 0
FrameSaveOpen.BackgroundTransparency = 1
FrameSaveOpen.Parent = FolderTab

local FrameOpennah = Instance.new("Frame")
FrameOpennah.Size = UDim2.new(0.98, 0, 0.83, 0)
FrameOpennah.Position = UDim2.new(0.01, 0, 0.15, 0)
FrameOpennah.BackgroundColor3 = Color3.new(1, 1, 1)
FrameOpennah.BorderColor3 = Color3.new(0, 0, 0)
FrameOpennah.BorderSizePixel = 1
FrameOpennah.Active = true
FrameOpennah.BackgroundTransparency = 0
FrameOpennah.Parent = FrameSaveOpen

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = FrameOpennah

local UICorner = Instance.new("UIStroke")
UICorner.Color = Color3.new(0, 0, 0)
UICorner.Thickness = 2
UICorner.Parent = FrameOpennah

local ScrollingFrame2 = Instance.new("ScrollingFrame")
ScrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame2.Position = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame2.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame2.BorderSizePixel = 1
ScrollingFrame2.BackgroundTransparency = 1
ScrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame2.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.ScrollBarThickness = 6
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.Parent = FrameOpennah

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.Parent = ScrollingFrame2

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 7)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame2

local function updateCanvasSize2()
    local contentHeight = UIListLayout.AbsoluteContentSize.Y
    ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, contentHeight)
end

updateCanvasSize2()
ScrollingFrame2.ChildAdded:Connect(updateCanvasSize2)
ScrollingFrame2.ChildRemoved:Connect(updateCanvasSize2)

function ButtonTab3(Name, Callback)
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.95, 0, 0, 35)
Button.Position = UDim2.new(0.8, 0, 0, 0)
Button.BackgroundColor3 = Color1
Button.BorderColor3 = Color3.new(0, 0, 0)
Button.BorderSizePixel = 1
Button.Text = Name
Button.BackgroundTransparency = 0
Button.TextColor3 = Color0
Button.Font = Enum.Font.Code
Button.FontSize = "Size18"
Button.Parent = ScrollingFrame2
Button.MouseButton1Click:Connect(function()
	func, err = loadstring(Callback)
	if func then
		pcall(func)
	else
		print(err)
	end
end)

local ButtonX = Instance.new("TextButton")
ButtonX.Size = UDim2.new(0.09, 0, 1, 0)
ButtonX.Position = UDim2.new(0.91, 0, 0, 0)
ButtonX.BackgroundColor3 = Color1
ButtonX.BorderColor3 = Color3.new(0, 0, 0)
ButtonX.BorderSizePixel = 1
ButtonX.Text = "X"
ButtonX.BackgroundTransparency = 1
ButtonX.TextColor3 = Color0
ButtonX.Font = Enum.Font.Code
ButtonX.FontSize = "Size28"
ButtonX.Parent = Button
ButtonX.MouseButton1Click:Connect(function()
CreateClear("Delete File?", function()
if FolderTabRe:FindFirstChild("OpenSaveScript") and FolderTabRe.OpenSaveScript:FindFirstChild("Frame") then
delfile("ExecuteGet/Script/"..Name)
for i, v in pairs(FolderTabRe.OpenSaveScript.Frame:FindFirstChild("ScrollingFrame"):GetChildren()) do
if v:IsA("TextButton") and v.Text == (Name) then
v:Destroy()
end
end
end
end)
end)
end

local prefix = "ExecuteGet/Script/"
for i, v in ipairs(listfiles(prefix)) do
    local name = v:gsub("^"..prefix, "")
    ButtonTab3(name, readfile(v))
end

---- Credit Gui ----

local FrameCreditGui = Instance.new("Frame")
FrameCreditGui.Name = "CreateGui"
FrameCreditGui.Size = UDim2.new(1, 0, 1, 0)
FrameCreditGui.Position = UDim2.new(0, 0, 0, 0)
FrameCreditGui.BackgroundColor3 = Color3.new(1, 1, 1)
FrameCreditGui.BorderColor3 = Color3.new(0, 0, 0)
FrameCreditGui.BorderSizePixel = 1
FrameCreditGui.Active = true
FrameCreditGui.ZIndex = 0
FrameCreditGui.Visible = false
FrameCreditGui.BackgroundTransparency = 1
FrameCreditGui.Parent = FolderTab
if Exe.MainUi:FindFirstChild("FileHub"):FindFirstChild("CreateGui") then
Guicredit = Exe.MainUi.FileHub.CreateGui
end

local CloneTextBox = Main:FindFirstChild("ScriptBox (Normal)"):Clone()
CloneTextBox.Name = "ScriptMakeGui"
CloneTextBox.Text = ""
CloneTextBox.Size = UDim2.new(0.76, 0, 0.65, 0)
CloneTextBox.Position = UDim2.new(0.01, 0, 0.15, 0)
CloneTextBox.PlaceholderText = "-- put your mainframe into the screengui that I have made (frame.Parent = gui)"
CloneTextBox.Parent = FrameCreditGui

local Framebutton = Instance.new("Frame")
Framebutton.Size = UDim2.new(0.98, 0, 0.15, 0)
Framebutton.Position = UDim2.new(0.01, 0, 0.83, 0)
Framebutton.BackgroundColor3 = Color0
Framebutton.BorderColor3 = Color3.new(0, 0, 0)
Framebutton.BorderSizePixel = 1
Framebutton.Active = true
Framebutton.BackgroundTransparency = 1
Framebutton.Parent = FrameCreditGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Framebutton

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.HorizontalAlignment = "Left"
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.FillDirection = "Horizontal"
UIListLayout.VerticalAlignment = "Center"
UIListLayout.Parent = Framebutton

local function ButtonGui(Name, Callback)
ButtonClone = Instance.new("Frame")
ButtonClone.Size = UDim2.new(0.1867, 0, 1, 0)
ButtonClone.Position = UDim2.new(0, 0, 0, 0)
ButtonClone.BackgroundColor3 = Color3.new(1, 1, 1)
ButtonClone.BorderColor3 = Color3.new(0, 0, 0)
ButtonClone.BorderSizePixel = 1
ButtonClone.Active = true
ButtonClone.BackgroundTransparency = 0 
ButtonClone.Parent = Framebutton

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = ButtonClone

local Stoke = Instance.new("UIStroke")
Stoke.Color = Color3.new(0, 0, 0)
Stoke.Thickness = 2
Stoke.Parent = ButtonClone

local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.BackgroundColor3 = Color1
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = Name
TextButton.BackgroundTransparency = 1
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size18"
TextButton.Parent = ButtonClone
TextButton.MouseButton1Click:Connect(function()
	pcall(Callback)
end)
end

ButtonGui("MORE GUI", function()
if Guicredit:FindFirstChild("MoreMakeGui") then
Guicredit:FindFirstChild("MoreMakeGui").Visible = not Guicredit:FindFirstChild("MoreMakeGui").Visible
end
end)

ButtonGui("UPDATE", function()
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Article GUI") then
game.Players.LocalPlayer.PlayerGui:FindFirstChild("Article GUI"):Destroy()
end
local GUI = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
GUI.ResetOnSpawn = false
GUI.Name = "Article GUI"
local func, err = loadstring('gui = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Article GUI") '..Guicredit:FindFirstChild("ScriptMakeGui").Text)
        if func then
            pcall(func)
        else
        print(err)
      end
end)

ButtonGui("COPY", function()
if setclipboard then
setclipboard([[
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "TEXT NAME"

]]..Guicredit:FindFirstChild("ScriptMakeGui").Text)
elseif not setclipboard then
Old = Guicredit:FindFirstChild("ScriptMakeGui").Text
wait(0.1)
Guicredit:FindFirstChild("ScriptMakeGui").Text = ([[
-- 1. Press Hold The Screen
-- 2. Select All 
-- 3. Copy Now
-- Dont rush to exit, you will lose everything
-- You have to copy it first before you can exit.
---------------------------------------------------------------

]]..Old)
end
end)

ButtonGui("CONSOLE")

ButtonGui("CLEAN", function()
CreateClear("Clean Script", function()
if Guicredit:FindFirstChild("ScriptMakeGui") then
Guicredit:FindFirstChild("ScriptMakeGui").Text = ""
end
end)
end)

local FrameMoreGui = Instance.new("Frame")
FrameMoreGui.Name = "MoreGuiLookup"
FrameMoreGui.Size = UDim2.new(0.2, 0, 0.65, 0)
FrameMoreGui.Position = UDim2.new(0.785, 0, 0.15, 0)
FrameMoreGui.BackgroundColor3 = Color3.new(1, 1, 1)
FrameMoreGui.BorderColor3 = Color3.new(0, 0, 0)
FrameMoreGui.BorderSizePixel = 1
FrameMoreGui.Active = true
FrameMoreGui.BackgroundTransparency = 0 
FrameMoreGui.Parent = FrameCreditGui

local ScrollingFrame2 = Instance.new("ScrollingFrame")
ScrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame2.Position = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame2.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame2.BorderSizePixel = 1
ScrollingFrame2.BackgroundTransparency = 1
ScrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame2.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.ScrollBarThickness = 6
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.Parent = FrameMoreGui

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.Parent = ScrollingFrame2

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame2

local function updateCanvasSize2()
    local contentHeight = UIListLayout.AbsoluteContentSize.Y
    ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, contentHeight)
end

updateCanvasSize2()
ScrollingFrame2.ChildAdded:Connect(updateCanvasSize2)
ScrollingFrame2.ChildRemoved:Connect(updateCanvasSize2)

local function ButtonGuiTab(Name, Callback)
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.9, 0, 0, 30)
Button.Position = UDim2.new(0.8, 0, 0, 0)
Button.BackgroundColor3 = Color1
Button.BorderColor3 = Color3.new(0, 0, 0)
Button.BorderSizePixel = 1
Button.Text = Name
Button.BackgroundTransparency = 0
Button.TextColor3 = Color0
Button.Font = Enum.Font.Code
Button.FontSize = "Size18"
Button.Parent = ScrollingFrame2
Button.MouseButton1Click:Connect(function()
	pcall(Callback)
end)
end

------- More Gui -------

local FrameMoreGuiM = Instance.new("Frame")
FrameMoreGuiM.Name = "MoreMakeGui"
FrameMoreGuiM.Size = UDim2.new(0.4, 0, 1, 0)
FrameMoreGuiM.Position = UDim2.new(-0.42, 0, 0, 0)
FrameMoreGuiM.BackgroundColor3 = Color3.new(1, 1, 1)
FrameMoreGuiM.BorderColor3 = Color3.new(0, 0, 0)
FrameMoreGuiM.BorderSizePixel = 1
FrameMoreGuiM.Active = true
FrameMoreGuiM.Visible = false
FrameMoreGuiM.BackgroundTransparency = 0 
FrameMoreGuiM.Parent = FrameCreditGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 7)
UICorner.Parent = FrameMoreGuiM

local Stoke = Instance.new("UIStroke")
Stoke.Color = Color3.new(0, 0, 0)
Stoke.Thickness = 3
Stoke.Parent = FrameMoreGuiM

local TextScFrame = Instance.new("Frame")
TextScFrame.Size = UDim2.new(1, 0, 0.145, 0)
TextScFrame.Position = UDim2.new(0, 0, 0, 0)
TextScFrame.BackgroundColor3 = Color3.new(1, 1, 1)
TextScFrame.BorderColor3 = Color3.new(0, 0, 0)
TextScFrame.BorderSizePixel = 1
TextScFrame.Active = true
TextScFrame.BackgroundTransparency = 1
TextScFrame.Parent = FrameMoreGuiM

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 5)
Corner.Parent = TextScFrame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(1, 0, 1, 0)
TextBox.Position = UDim2.new(0, 0, 0, 0)
TextBox.BackgroundColor3 = Color1
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 1
TextBox.Text = "Text"
TextBox.TextColor3 = Color0
TextBox.BackgroundTransparency = 1
TextBox.Font = Enum.Font.Code
TextBox.FontSize = "Size14"
TextBox.TextSize = 15
TextBox.Parent = TextScFrame

local ScrollingFrame2 = Instance.new("ScrollingFrame")
ScrollingFrame2.Size = UDim2.new(1, 0, 0.85, 0)
ScrollingFrame2.Position = UDim2.new(0, 0, 0.15, 0)
ScrollingFrame2.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame2.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame2.BorderSizePixel = 1
ScrollingFrame2.BackgroundTransparency = 1
ScrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame2.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.ScrollBarThickness = 0
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.Parent = FrameMoreGuiM

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.Parent = ScrollingFrame2

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 5)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame2

local function updateCanvasSize2()
    local contentHeight = UIListLayout.AbsoluteContentSize.Y
    ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, contentHeight + 17)
end

updateCanvasSize2()
ScrollingFrame2.ChildAdded:Connect(updateCanvasSize2)
ScrollingFrame2.ChildRemoved:Connect(updateCanvasSize2)

function TextButtonBox(Button, Textbox)
Button.Text = Button.Text or "Text"
Button.Callback = Button.Callback or function() end

Textbox.PlaceholderText = Textbox.PlaceholderText or "Text"
Textbox.Callback = Textbox.Callback or function() end

local TextButton = Instance.new("TextButton")
TextButton.Size = UDim2.new(0, 186, 0, 35)
TextButton.Position = UDim2.new(0, 0, 0, 0)
TextButton.BackgroundColor3 = Color1
TextButton.BorderColor3 = Color3.new(0, 0, 0)
TextButton.BorderSizePixel = 1
TextButton.Text = Button.Text
TextButton.BackgroundTransparency = 0
TextButton.TextColor3 = Color0
TextButton.Font = Enum.Font.Code
TextButton.FontSize = "Size14"
TextButton.Parent = ScrollingFrame2
TextButton.MouseButton1Click:Connect(function()
	pcall(Button.Callback)
end)

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.25, 0, 1, 0)
TextBox.Position = UDim2.new(0.75, 0, 0, 0)
TextBox.BackgroundColor3 = Color1
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 1
TextBox.Text = ""
TextBox.TextWrapped = true
TextBox.PlaceholderText = Textbox.PlaceholderText
TextBox.TextColor3 = Color0
TextBox.BackgroundTransparency = 0
TextBox.Font = Enum.Font.Code
TextBox.FontSize = "Size10"
TextBox.Parent = TextButton
TextBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		Textbox.Callback(TextBox.Text)
	end
end)
end

function CopyGui(Gui)
Gui.Choose = Gui.Choose or "Frame"
Gui.NameOut = Gui.NameOut or "MyGui"
Name = Gui.NameOut

if Gui.Choose == "Frame" then
setclipboard(string.format([[
local %s = Instance.new("Frame")
%s.Size = UDim2.new(0.5, 0, 0.5, 0)
%s.Position = UDim2.new(0.5, 0, 0.5, 0)
%s.BackgroundColor3 = Color3.new(1, 1, 1)
%s.BorderColor3 = Color3.new(0, 0, 0)
%s.BorderSizePixel = 1
%s.Active = true
%s.BackgroundTransparency = 0 
%s.Draggable = true
%s.Parent = gui

]], Name, Name, Name, Name, Name, Name, Name, Name, Name, Name))
elseif Gui.Choose == "TextLabel" then
setclipboard(string.format([[
local %s = Instance.new("TextLabel")
%s.Size = UDim2.new(0.3, 0, 0.2, 0)
%s.Position = UDim2.new(0.5, 0, 0.5, 0)
%s.BackgroundColor3 = Color3.new(0, 0, 0)
%s.BorderColor3 = Color3.new(0, 0, 0)
%s.BorderSizePixel = 1
%s.Text = "Text"
%s.BackgroundTransparency = 0 
%s.TextColor3 = Color3.new(255, 255, 255)
%s.Font = Enum.Font.Code
%s.Parent = nill

]], Name, Name, Name, Name, Name, Name, Name, Name, Name, Name, Name))
elseif Gui.Choose == "TextButton" then
setclipboard(string.format([[
local %s = Instance.new("TextButton")
%s.Size = UDim2.new(0.3, 0, 0.2, 0)
%s.Position = UDim2.new(0.5, 0, 0.5, 0)
%s.BackgroundColor3 = Color3.new(0, 0, 0)
%s.BorderColor3 = Color3.new(0, 0, 0)
%s.BorderSizePixel = 1
%s.Text = "Text"
%s.BackgroundTransparency = 0 
%s.TextColor3 = Color3.new(255, 255, 255)
%s.Font = Enum.Font.Code
%s.Parent = nill

]], Name, Name, Name, Name, Name, Name, Name, Name, Name, Name, Name))
elseif Gui.Choose == "ImageButton" then
setclipboard(string.format([[
local %s = Instance.new("ImageButton")
%s.Size = UDim2.new(0.3, 0, 0.2, 0)
%s.Position = UDim2.new(0.5, 0, 0.5, 0)
%s.BackgroundColor3 = Color3.new(0, 0, 0)
%s.ImageColor3 = Color3.new(1, 0, 0)
%s.Image = "rbxassetid://0"
%s.ImageTransparency = 0.5
%s.ScaleType = Enum.ScaleType.Sliced
%s.BackgroundTransparency = 0 
%s.Parent = nill

]], Name, Name, Name, Name, Name, Name, Name, Name, Name, Name))
elseif Gui.Choose == "ImageLabel" then
setclipboard(string.format([[
local %s = Instance.new("ImageLabel")
%s.Size = UDim2.new(0.3, 0, 0.2, 0)
%s.Position = UDim2.new(0.5, 0, 0.5, 0)
%s.BackgroundColor3 = Color3.new(0, 0, 0)
%s.ImageColor3 = Color3.new(1, 0, 0)
%s.Image = "rbxassetid://0"
%s.ImageTransparency = 0.5
%s.BackgroundTransparency = 0
%s.ScaleType = Enum.ScaleType.Sliced
%s.Parent = nill

]], Name, Name, Name, Name, Name, Name, Name, Name, Name, Name))
elseif Gui.Choose == "TextBox" then
setclipboard(string.format([[
local %s = Instance.new("TextBox")
%s.Size = UDim2.new(0.3, 0, 0.2, 0)
%s.Position = UDim2.new(0.5, 0, 0.5, 0)
%s.BackgroundColor3 = Color3.new(0, 0, 0)
%s.BorderColor3 = Color3.new(0, 0, 0)
%s.BorderSizePixel = 1
%s.Text = "Text"
%s.TextColor3 = Color3.new(255, 255, 255)
%s.BackgroundTransparency = 0
%s.Font = Enum.Font.Code
%s.TextSize = 15
%s.Parent = nill

]], Name, Name, Name, Name, Name, Name, Name, Name, Name, Name, Name, Name))
elseif Gui.Choose == "UICorner" then
setclipboard(string.format([[
local %s = Instance.new("UICorner")
%s.CornerRadius = UDim.new(0, 5)
%s.Parent = nill

]], Name, Name, Name))
elseif Gui.Choose == "UIStroke" then
setclipboard(string.format([[
local %s = Instance.new("UIStroke")
%s.Color = Color3.new(0, 0, 0)
%s.Thickness = 2
%s.Parent = nill

]], Name, Name, Name, Name))
elseif Gui.Choose == "UIGradient" then
setclipboard(string.format([[
local %s = Instance.new("UIGradient")
%s.ColorSequence = {
      Color3.fromRGB(255, 0, 0), 
      Color3.fromRGB(0, 255, 0), 
      Color3.fromRGB(0, 0, 255)
}
%s.Transparency = 0.5
%s.Rotation = 90
%s.Parent = gui

]], Name, Name, Name, Name, Name))
elseif Gui.Choose == "UIGradient" then
setclipboard(string.format([[
local %s = Instance.new("UIListLayout")
%s.HorizontalAlignment = Enum.HorizontalAlignment.Center
%s.SortOrder = Enum.SortOrder.LayoutOrder
%s.Padding = UDim.new(0, 10)
%s.Parent = gui

]], Name, Name, Name, Name, Name))
elseif Gui.Choose == "ScrollingFrame" then
setclipboard(string.format([[
local %s = Instance.new("ScrollingFrame")
%s.Size = UDim2.new(0.5, 0, 0.5, 0)
%s.Position = UDim2.new(0.5, 0, 0.5, 0)
%s.BackgroundColor3 = Color3.new(1, 1, 1)
%s.BorderColor3 = Color3.new(0, 0, 0)
%s.BorderSizePixel = 1
%s.ScrollBarThickness = 5
%s.BackgroundTransparency = 0 
%s.Parent = gui

]], Name, Name, Name, Name, Name, Name, Name, Name, Name))
elseif Gui.Choose == "LocalScript" then
setclipboard(string.format([[
local %s = Instance.new("LocalScript", nill)
%s.Parent.MouseButton1Click:Connect(function()
	--- Code
end)

]], Name, Name))
end
end

for i, v in ipairs(_G.GuiName) do
local NameClass = v[2]
TextButtonBox(
	{
	Text = NameClass,
	Callback = function()
		CopyGui({Choose = NameClass, NameOut = _G.GuiName[i][2]})
	end
	},
	{
	PlaceholderText = NameClass,
	Callback = function(Value)
		_G.GuiName[i][2] = Value
	end
})
end

---- Script Hub ----

local FrameHub = Instance.new("Frame")
FrameHub.Name = "SCRIPTHUB"
FrameHub.Size = UDim2.new(1, 0, 1, 0)
FrameHub.Position = UDim2.new(0, 0, 0, 0)
FrameHub.BackgroundColor3 = Color3.new(1, 1, 1)
FrameHub.BorderColor3 = Color3.new(0, 0, 0)
FrameHub.BorderSizePixel = 1
FrameHub.Active = true
FrameHub.Visible = false
FrameHub.ZIndex = 0
FrameHub.BackgroundTransparency = 1
FrameHub.Parent = FolderTab

local FrameSoCool = Instance.new("Frame")
FrameSoCool.Size = UDim2.new(0.98, 0, 0.83, 0)
FrameSoCool.Position = UDim2.new(0.01, 0, 0.15, 0)
FrameSoCool.BackgroundColor3 = Color3.new(1, 1, 1)
FrameSoCool.BorderColor3 = Color3.new(0, 0, 0)
FrameSoCool.BorderSizePixel = 1
FrameSoCool.Active = true
FrameSoCool.BackgroundTransparency = 0 
FrameSoCool.Parent = FrameHub

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = FrameSoCool

local Strok = Instance.new("UIStroke")
Strok.Color = Color3.new(0, 0, 0)
Strok.Thickness = 2.5
Strok.Parent = FrameSoCool

local ScrollingFrame2 = Instance.new("ScrollingFrame")
ScrollingFrame2.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame2.Position = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.BackgroundColor3 = Color3.new(1, 1, 1)
ScrollingFrame2.BorderColor3 = Color3.new(0, 0, 0)
ScrollingFrame2.BorderSizePixel = 1
ScrollingFrame2.BackgroundTransparency = 1
ScrollingFrame2.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollingFrame2.HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
ScrollingFrame2.ScrollBarThickness = 0
ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingFrame2.Parent = FrameSoCool

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.Parent = ScrollingFrame2

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 7)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame2

local function updateCanvasSize2()
    local contentHeight = UIListLayout.AbsoluteContentSize.Y
    ScrollingFrame2.CanvasSize = UDim2.new(0, 0, 0, contentHeight + 20)
end

updateCanvasSize2()
ScrollingFrame2.ChildAdded:Connect(updateCanvasSize2)
ScrollingFrame2.ChildRemoved:Connect(updateCanvasSize2)

local function ButtonTab3(Name, Callback)
local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0.9, 0, 0, 35)
Button.Position = UDim2.new(0.8, 0, 0, 0)
Button.BackgroundColor3 = Color1
Button.BorderColor3 = Color3.new(0, 0, 0)
Button.BorderSizePixel = 1
Button.Text = Name
Button.BackgroundTransparency = 0
Button.TextColor3 = Color0
Button.Font = Enum.Font.Code
Button.FontSize = "Size18"
Button.Parent = ScrollingFrame2
Button.MouseButton1Click:Connect(function()
	pcall(Callback)
end)
end

ButtonTab3("Inf Yield", function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)

ButtonTab3("Fly PE V3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end)

ButtonTab3("Simple Spy", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/SimpleSpy/SourceBeta.lua"))()
end)

ButtonTab3("Dex V4", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Articles-Hub/ROBLOXScript/refs/heads/main/SCRIPT/Dex-v4.lua"))()
end)

ButtonTab3("Dex V3", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
end)

ButtonTab3("Dex V2", function()
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
wait(2)
repeat task.wait()
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Dex") and game.Players.LocalPlayer.PlayerGui.Dex.ResetOnSpawn == true then
game.Players.LocalPlayer.PlayerGui.Dex.ResetOnSpawn = false
end
until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Dex") and game.Players.LocalPlayer.PlayerGui.Dex.ResetOnSpawn == false
end)

---- Soon ----
end