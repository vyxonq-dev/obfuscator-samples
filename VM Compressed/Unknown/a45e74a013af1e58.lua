-- Make Your Own Shit Skid and Copy = Gay 
local function CreateAnnouncementGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "AnnounceGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui")

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Name = "AnnounceLabel"
    TextLabel.Parent = ScreenGui
    TextLabel.Size = UDim2.new(0.6, 0, 0.08, 0)
    TextLabel.Position = UDim2.new(0.2, 0, 0.15, 0)
    TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    TextLabel.BackgroundTransparency = 0.25
    TextLabel.BorderSizePixel = 0
    TextLabel.TextColor3 = Color3.new(1, 1, 1)
    TextLabel.TextStrokeTransparency = 0.5
    TextLabel.TextScaled = true
    TextLabel.Font = Enum.Font.GothamBold
    TextLabel.Visible = false
end

local function RainbowColor(t)
    local frequency = 2
    return Color3.fromHSV((tick() * frequency + t) % 1, 1, 1)
end

function Announce(text)
    local gui = game:GetService("CoreGui"):FindFirstChild("AnnounceGui")
    if not gui then
        CreateAnnouncementGui()
        gui = game:GetService("CoreGui"):WaitForChild("AnnounceGui")
    end

    local label = gui:FindFirstChild("AnnounceLabel")
    if not label then return end

    label.Text = text
    label.Visible = true
    label.TextTransparency = 0
    label.TextStrokeTransparency = 0.5

    for i = 1, 100 do
        label.TextColor3 = RainbowColor(i)
        label.TextTransparency = i / 100
        label.TextStrokeTransparency = 0.5 + (i / 200)
        wait(0.05)
    end

    label.Visible = false
end

task.spawn(function()
    Announce("🌌 Don't Execute the Script 2 Times!1!1 (Please Wait..)")
end)

local function CreateUpdateGui()
    local TweenService = game:GetService("TweenService")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "UpdateGui"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = game:GetService("CoreGui")

    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.Size = UDim2.new(0.35, 0, 0.35, 0)
    Frame.Position = UDim2.new(0.325, 0, 0.3, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.BorderSizePixel = 0
    Frame.BackgroundTransparency = 0.1
    Frame.Active = true
    Frame.Draggable = true

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = Frame

    local TitleBar = Instance.new("Frame")
    TitleBar.Parent = Frame
    TitleBar.Size = UDim2.new(1, 0, 0.15, 0)
    TitleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TitleBar.BorderSizePixel = 0

    local Title = Instance.new("TextLabel")
    Title.Parent = TitleBar
    Title.Size = UDim2.new(0.85, 0, 1, 0)
    Title.Position = UDim2.new(0.05, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "📢 Script Updates"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextScaled = true

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = TitleBar
    CloseBtn.Size = UDim2.new(0.1, 0, 1, 0)
    CloseBtn.Position = UDim2.new(0.9, 0, 0, 0)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.new(1,1,1)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextScaled = true

    local UICorner2 = Instance.new("UICorner")
    UICorner2.CornerRadius = UDim.new(0, 8)
    UICorner2.Parent = CloseBtn

    local ScrollingFrame = Instance.new("ScrollingFrame")
    ScrollingFrame.Parent = Frame
    ScrollingFrame.Size = UDim2.new(0.95, 0, 0.8, 0)
    ScrollingFrame.Position = UDim2.new(0.025, 0, 0.18, 0)
    ScrollingFrame.BackgroundTransparency = 1
    ScrollingFrame.CanvasSize = UDim2.new(0,0,0,0)
    ScrollingFrame.ScrollBarThickness = 6

    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = ScrollingFrame
    UIListLayout.Padding = UDim.new(0,6)
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    local updates = {
        "- Added Natural disaster script 🌪",
        "- Join Discord PLS 💔"


    }

    for _,text in ipairs(updates) do
        local UpdateLabel = Instance.new("TextLabel")
        UpdateLabel.Parent = ScrollingFrame
        UpdateLabel.Size = UDim2.new(1,0,0,30)
        UpdateLabel.BackgroundTransparency = 0.2
        UpdateLabel.BackgroundColor3 = Color3.fromRGB(35,35,35)
        UpdateLabel.TextColor3 = Color3.fromRGB(255,255,255)
        UpdateLabel.Font = Enum.Font.Gotham
        UpdateLabel.TextSize = 16
        UpdateLabel.TextXAlignment = Enum.TextXAlignment.Left
        UpdateLabel.Text = text

        local UICorner3 = Instance.new("UICorner")
        UICorner3.CornerRadius = UDim.new(0,6)
        UICorner3.Parent = UpdateLabel
    end

    UIListLayout.Changed:Connect(function()
        ScrollingFrame.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y+10)
    end)

    Frame.Size = UDim2.new(0,0,0,0)
    Frame.BackgroundTransparency = 1
    TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.35,0,0.35,0),
        BackgroundTransparency = 0.1
    }):Play()

    CloseBtn.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(Frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Size = UDim2.new(0,0,0,0),
            BackgroundTransparency = 1
        })
        tween:Play()
        tween.Completed:Wait()
        ScreenGui:Destroy()
    end)
end

task.spawn(function()
    wait(1)
    CreateUpdateGui()
end)

local A = loadstring(game:HttpGet("https://raw.githubusercontent.com/ben1x1x1x1x/Loader/refs/heads/main/Gamelist"))()

function CheckingGame1()
    getgenv().Get = setmetatable({}, {
        __index = function(_, B)
            return game:GetService(B)
        end
    })

    for i, v in pairs(Games) do
        if i == game.PlaceId then
            loadstring(game:HttpGet(v))()
        end
    end
end

CheckingGame1()
