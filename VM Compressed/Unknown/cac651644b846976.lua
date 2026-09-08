-- Ro-Exec Script By lol_pogi & joe_
local AFlow = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local AFlowLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel") -- Status Indicator
local ScriptBox = Instance.new("TextBox")
local ScriptList = Instance.new("ScrollingFrame")
local ListLabel = Instance.new("TextLabel")

local AttachButton = Instance.new("TextButton")
local ExecuteButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local OpenFileButton = Instance.new("TextButton")
local SaveFileButton = Instance.new("TextButton")

local Attached = false

AFlow.Name = "AFlow"
AFlow.Parent = game.CoreGui
AFlow.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = AFlow
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Size = UDim2.new(0, 600, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(0, 600, 0, 30)
Title.Font = Enum.Font.Gotham
Title.Text = "Ro-Exec | v. 50qc3a"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

AFlowLabel.Name = "AFlowLabel"
AFlowLabel.Parent = MainFrame
AFlowLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AFlowLabel.BorderSizePixel = 0
AFlowLabel.Position = UDim2.new(0, 5, 0, 5)
AFlowLabel.Size = UDim2.new(0, 50, 0, 20)
AFlowLabel.Font = Enum.Font.Gotham
AFlowLabel.Text = "R-E |"
AFlowLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
AFlowLabel.TextSize = 14

-- Status Indicator
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 60, 0, 5)
StatusLabel.Size = UDim2.new(0, 100, 0, 20)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "🔴 not-ready"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14

ScriptBox.Name = "ScriptBox"
ScriptBox.Parent = MainFrame
ScriptBox.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScriptBox.BorderSizePixel = 0
ScriptBox.Position = UDim2.new(0, 10, 0, 40)
ScriptBox.Size = UDim2.new(0, 400, 0, 250)
ScriptBox.Font = Enum.Font.Gotham
ScriptBox.Text = 'print("hello!, user")' -- Default text updated
ScriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptBox.TextSize = 14
ScriptBox.TextXAlignment = Enum.TextXAlignment.Left
ScriptBox.TextYAlignment = Enum.TextYAlignment.Top
ScriptBox.MultiLine = true
ScriptBox.ClearTextOnFocus = false
ScriptBox.TextWrapped = false
ScriptBox.ClipsDescendants = true

ScriptList.Name = "ScriptList"
ScriptList.Parent = MainFrame
ScriptList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ScriptList.BorderSizePixel = 0
ScriptList.Position = UDim2.new(0, 420, 0, 40)
ScriptList.Size = UDim2.new(0, 170, 0, 250)
ScriptList.ScrollBarThickness = 6
ScriptList.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
ScriptList.CanvasSize = UDim2.new(0, 0, 1, 0)
ScriptList.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScriptList.ScrollingDirection = Enum.ScrollingDirection.Y

ListLabel.Name = "ListLabel"
ListLabel.Parent = ScriptList
ListLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ListLabel.BorderSizePixel = 0
ListLabel.Size = UDim2.new(1, 0, 0, 20)
ListLabel.Font = Enum.Font.Gotham
ListLabel.Text = "Scripts"
ListLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ListLabel.TextSize = 14

local function CreateScriptButton(name, parent, exec, position)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.BackgroundTransparency = 1
    Button.Size = UDim2.new(1, 0, 0, 30)
    Button.Position = UDim2.new(0, 0, 0, position)
    Button.Font = Enum.Font.Gotham
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.MouseButton1Click:Connect(function()
        loadstring(exec)()
    end)
    return Button
end

CreateScriptButton("IY.lua", ScriptList, "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()", 30)
CreateScriptButton("Owl Hub.lua", ScriptList, "loadstring(game:HttpGet('https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt'))()", 70)
CreateScriptButton("Dark Dex.lua", ScriptList, "loadstring(game:HttpGet('https://gist.githubusercontent.com/Toon-arch/6401445/raw/darkdexv4.lua'))()", 110)
CreateScriptButton("R6.lua", ScriptList, "game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)", 150)

AttachButton.Name = "AttachButton"
AttachButton.Parent = MainFrame
AttachButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AttachButton.Position = UDim2.new(0, 10, 1, -40)
AttachButton.Size = UDim2.new(0, 50, 0, 30)
AttachButton.Font = Enum.Font.Gotham
AttachButton.Text = "Attach"
AttachButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AttachButton.TextSize = 14
AttachButton.MouseButton1Click:Connect(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "A-Flow",
        Text = "Executor Attached!",
        Duration = 3
    })
    Attached = true
    StatusLabel.Text = "🟢 ready!" -- Status update
end)

local function CreateButton(name, parent, position, callback)
    local Button = Instance.new("TextButton")
    Button.Parent = parent
    Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Button.Position = position
    Button.Size = UDim2.new(0, 100, 0, 30)
    Button.Font = Enum.Font.Gotham
    Button.Text = name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.MouseButton1Click:Connect(callback)
    return Button
end

ExecuteButton = CreateButton("Execute", MainFrame, UDim2.new(0, 70, 1, -40), function()
    if not Attached then
        ScriptBox.Text = "Attach First!"
    else
        loadstring(ScriptBox.Text)()
    end
end)

ClearButton = CreateButton("Clear", MainFrame, UDim2.new(0, 180, 1, -40), function()
    ScriptBox.Text = ""
end)

OpenFileButton = CreateButton("Open File", MainFrame, UDim2.new(0, 290, 1, -40), function()
    print("Open File functionality not implemented.")
end)

SaveFileButton = CreateButton("Save File", MainFrame, UDim2.new(0, 400, 1, -40), function()
    print("Save File functionality not implemented.")
end)