--// CONFIGURATION
local OwnerID = 8816493943
local ProfileLink = "https://www.roblox.com/users/8816493943/profile"
local ScriptURL = "https://raw.githubusercontent.com/lyutovovk/dwdamn/refs/heads/main/main.lua"

--// SERVICES
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

--// OWNER BYPASS
if LocalPlayer.UserId == OwnerID then
    loadstring(game:HttpGet(ScriptURL))()
    return 
end

--// THEME (Copied from Source)
local Theme = {
    Background = Color3.fromRGB(18, 18, 24),
    Sidebar = Color3.fromRGB(23, 23, 30),
    Text = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(160, 160, 175),
    Accent = Color3.fromRGB(0, 122, 255), -- iOS Blue
    Stroke = Color3.fromRGB(60, 60, 80),
    Success = Color3.fromRGB(50, 205, 50),
    Destructive = Color3.fromRGB(255, 59, 48),
    CornerRadius = UDim.new(0, 14)
}

--// GUI SETUP
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "DandysWorld_Verify"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true

--// MAIN WINDOW FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Name = "Window"
MainFrame.Size = UDim2.new(0, 500, 0, 280) 
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -140)
MainFrame.BackgroundColor3 = Theme.Background
MainFrame.BackgroundTransparency = 1 -- Start transparent for animation
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Theme.Stroke
MainStroke.Thickness = 1
MainStroke.Parent = MainFrame

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = Theme.CornerRadius

--// ANIMATION: OPEN WINDOW
TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 500, 0, 280),
    BackgroundTransparency = 0.05
}):Play()

--// SIDEBAR DESIGN
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 160, 1, 0)
Sidebar.BackgroundColor3 = Theme.Sidebar
Sidebar.BackgroundTransparency = 0
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = Theme.CornerRadius

local SidebarGradient = Instance.new("UIGradient")
SidebarGradient.Rotation = 45
SidebarGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200,200,200))
}
SidebarGradient.Parent = Sidebar

--// SIDEBAR CONTENT
local Title = Instance.new("TextLabel")
Title.Text = "Verification"
Title.TextColor3 = Theme.Text
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Size = UDim2.new(1, -30, 0, 20)
Title.Position = UDim2.new(0, 15, 0, 60)
Title.BackgroundTransparency = 1
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Sidebar

local SubTitle = Instance.new("TextLabel")
SubTitle.Text = "Please follow to\naccess the script."
SubTitle.TextColor3 = Theme.TextDim
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 12
SubTitle.Size = UDim2.new(1, -30, 0, 30)
SubTitle.Position = UDim2.new(0, 15, 0, 85)
SubTitle.BackgroundTransparency = 1
SubTitle.TextXAlignment = Enum.TextXAlignment.Left
SubTitle.Parent = Sidebar

--// WINDOW CONTROLS (macOS Dots)
local ControlsHolder = Instance.new("Frame")
ControlsHolder.Size = UDim2.new(0, 60, 0, 20)
ControlsHolder.Position = UDim2.new(0, 15, 0, 15)
ControlsHolder.BackgroundTransparency = 1
ControlsHolder.Parent = MainFrame

local function CreateDot(color, offset)
    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 12, 0, 12)
    Dot.Position = UDim2.new(0, offset, 0, 0)
    Dot.BackgroundColor3 = color
    Dot.Parent = ControlsHolder
    Instance.new("UICorner", Dot).CornerRadius = UDim.new(1, 0)
end
CreateDot(Color3.fromRGB(255, 95, 87), 0)  -- Red
CreateDot(Color3.fromRGB(255, 189, 46), 20) -- Yellow
CreateDot(Color3.fromRGB(40, 200, 64), 40)  -- Green

--// CONTENT AREA
local ContentPageHolder = Instance.new("Frame")
ContentPageHolder.Size = UDim2.new(1, -160, 1, 0)
ContentPageHolder.Position = UDim2.new(0, 160, 0, 0)
ContentPageHolder.BackgroundTransparency = 1
ContentPageHolder.Parent = MainFrame

local Padding = Instance.new("UIPadding", ContentPageHolder)
Padding.PaddingTop = UDim.new(0, 60)
Padding.PaddingLeft = UDim.new(0, 20)
Padding.PaddingRight = UDim.new(0, 20)

local ListLayout = Instance.new("UIListLayout", ContentPageHolder)
ListLayout.Padding = UDim.new(0, 15)

--// BUTTON GENERATOR (Exact Style from Source)
local function CreateButton(Text, Callback)
    local ButtonFrame = Instance.new("Frame", ContentPageHolder)
    ButtonFrame.Size = UDim2.new(1, 0, 0, 45)
    ButtonFrame.BackgroundColor3 = Theme.Accent
    ButtonFrame.BackgroundTransparency = 0.2
    Instance.new("UICorner", ButtonFrame).CornerRadius = UDim.new(0, 10)
    
    local Gradient = Instance.new("UIGradient")
    Gradient.Rotation = 90
    Gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,255,255)),
        ColorSequenceKeypoint.new(1, Theme.Accent)
    }
    Gradient.Transparency = NumberSequence.new{
        NumberSequenceKeypoint.new(0, 0.7),
        NumberSequenceKeypoint.new(1, 0.1)
    }
    Gradient.Parent = ButtonFrame
    
    local BtnStroke = Instance.new("UIStroke", ButtonFrame)
    BtnStroke.Color = Color3.fromRGB(255,255,255)
    BtnStroke.Transparency = 0.6
    BtnStroke.Thickness = 1

    local Btn = Instance.new("TextButton", ButtonFrame)
    Btn.Size = UDim2.new(1, 0, 1, 0)
    Btn.BackgroundTransparency = 1
    Btn.Text = Text
    Btn.TextColor3 = Color3.fromRGB(255,255,255)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 14

    Btn.MouseEnter:Connect(function()
        TweenService:Create(ButtonFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0.1}):Play()
    end)
    Btn.MouseLeave:Connect(function()
        TweenService:Create(ButtonFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0.2}):Play()
    end)

    Btn.MouseButton1Click:Connect(function()
        Callback(Btn)
    end)
end

--// VERIFICATION LOGIC
local function CheckIfFollowing(userId, targetId)
    local success, result = pcall(function()
        local url = string.format("https://friends.roproxy.com/v1/users/%d/followings?limit=100", userId)
        local response = game:HttpGet(url)
        local data = HttpService:JSONDecode(response)
        
        for _, user in pairs(data.data) do
            if user.id == targetId then return true end
        end
        return false
    end)
    return success and result
end

--// CREATE BUTTONS
CreateButton("Copy Profile Link", function(btn)
    if setclipboard then
        setclipboard(ProfileLink)
        btn.Text = "Link Copied!"
        task.wait(2)
        btn.Text = "Copy Profile Link"
    else
        btn.Text = "Clipboard Not Supported"
    end
end)

CreateButton("Verify Following", function(btn)
    btn.Text = "Checking..."
    
    if CheckIfFollowing(LocalPlayer.UserId, OwnerID) then
        btn.Text = "Success!"
        
        TweenService:Create(MainFrame, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        
        task.wait(0.6)
        ScreenGui:Destroy()
        loadstring(game:HttpGet(ScriptURL))()
    else
        btn.Text = "Not Following!"
        task.wait(2)
        btn.Text = "Verify Following"
    end
end)

--// DRAGGING LOGIC
local Dragging, DragInput, DragStart, StartPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
    end
end)
MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then Dragging = false end
end)
UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then DragInput = input end
end)
RunService.RenderStepped:Connect(function()
    if Dragging and DragInput then
        local Delta = DragInput.Position - DragStart
        MainFrame.Position = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + Delta.X, StartPos.Y.Scale, StartPos.Y.Offset + Delta.Y)
    end
end)
