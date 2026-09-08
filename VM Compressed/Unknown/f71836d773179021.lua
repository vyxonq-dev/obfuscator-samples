local TweenService = game:GetService("TweenService")
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local BackgroundBlur = Instance.new("BlurEffect")
local Shadow = Instance.new("ImageLabel")
local Subtitle = Instance.new("TextLabel")
BackgroundBlur.Size = 24
BackgroundBlur.Parent = game:GetService("Lighting")
ScreenGui.Name = "option"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 500, 0, 300)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BackgroundTransparency = 0.15
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
Shadow.Name = "Shadow"
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.8
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.BackgroundTransparency = 1
Shadow.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 60)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Do you want to load the legacy?"
Title.TextColor3 = Color3.fromRGB(240, 240, 240)
Title.Font = Enum.Font.GothamSemibold
Title.TextSize = 22
Title.TextTransparency = 1
Title.Parent = MainFrame
Subtitle.Size = UDim2.new(1, 0, 0, 25)
Subtitle.Position = UDim2.new(0, 0, 0, 50)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Choose your preferred version"
Subtitle.TextColor3 = Color3.fromRGB(200, 200, 200)
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 14
Subtitle.TextTransparency = 1
Subtitle.Parent = MainFrame

local function createOption(name, iconId, pos, text, description)
    local Container = Instance.new("Frame")
    local IconContainer = Instance.new("Frame")
    local Icon = Instance.new("ImageLabel")
    local Button = Instance.new("TextButton")
    local BtnCorner = Instance.new("UICorner")
    local BtnStroke = Instance.new("UIStroke")
    local OptionTitle = Instance.new("TextLabel")
    local OptionDesc = Instance.new("TextLabel")
    local IconCorner = Instance.new("UICorner")
    Container.Size = UDim2.new(0, 200, 0, 180)
    Container.Position = pos
    Container.BackgroundTransparency = 1
    Container.Parent = MainFrame
    IconContainer.Size = UDim2.new(0, 70, 0, 70)
    IconContainer.Position = UDim2.new(0.5, -35, 0.1, 0)
    IconContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    IconContainer.BackgroundTransparency = 0.9
    IconContainer.Parent = Container
    IconCorner.CornerRadius = UDim.new(1, 0)
    IconCorner.Parent = IconContainer
    Icon.Size = UDim2.new(0, 40, 0, 40)
    Icon.Position = UDim2.new(0.5, -20, 0.5, -20)
    Icon.Image = iconId
    Icon.BackgroundTransparency = 1
    Icon.ImageTransparency = 1
    Icon.Parent = IconContainer
    OptionTitle.Size = UDim2.new(1, 0, 0, 30)
    OptionTitle.Position = UDim2.new(0, 0, 0.5, 0)
    OptionTitle.BackgroundTransparency = 1
    OptionTitle.Text = text
    OptionTitle.TextColor3 = Color3.fromRGB(240, 240, 240)
    OptionTitle.Font = Enum.Font.GothamSemibold
    OptionTitle.TextSize = 16
    OptionTitle.TextTransparency = 1
    OptionTitle.Parent = Container
    OptionDesc.Size = UDim2.new(1, -20, 0, 40)
    OptionDesc.Position = UDim2.new(0, 10, 0.65, 0)
    OptionDesc.BackgroundTransparency = 1
    OptionDesc.Text = description
    OptionDesc.TextColor3 = Color3.fromRGB(180, 180, 180)
    OptionDesc.Font = Enum.Font.Gotham
    OptionDesc.TextSize = 12
    OptionDesc.TextTransparency = 1
    OptionDesc.TextWrapped = true
    OptionDesc.Parent = Container
    Button.Size = UDim2.new(0, 140, 0, 36)
    Button.Position = UDim2.new(0.5, -70, 0.85, 0)
    Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Button.BackgroundTransparency = 0.9
    Button.Text = "Select"
    Button.Font = Enum.Font.GothamSemibold
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.AutoButtonColor = true
    Button.TextTransparency = 1
    Button.Parent = Container
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Button
    
    BtnStroke.Color = Color3.fromRGB(80, 80, 80)
    BtnStroke.Transparency = 0.8
    BtnStroke.Thickness = 1
    BtnStroke.Parent = Button
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.7,
            BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        }):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.2), {
            Transparency = 0.5
        }):Play()
    end)
    
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.9,
            BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        }):Play()
        TweenService:Create(BtnStroke, TweenInfo.new(0.2), {
            Transparency = 0.8
        }):Play()
    end)

    return Button, Icon, OptionTitle, OptionDesc, IconContainer
end

local YesBtn, OldIcon, OldTitle, OldDesc, OldIconContainer = createOption("Yes", 
    "rbxassetid://132214308111067", 
    UDim2.new(0.05, 0, 0.3, 0), 
    "LEGACY VERSION", 
    "Same Old features as before\n(Bad injectors would work here and it wouldn't be updated)"
)

local NoBtn, NewIcon, NewTitle, NewDesc, NewIconContainer = createOption("No", 
    "rbxassetid://7734056878", 
    UDim2.new(0.52, 0, 0.3, 0), 
    "NEW VERSION", 
    "New features and improvements\n(Bad Injectors are not recommended)"
)

local tw = function()
    local info = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    
    TweenService:Create(MainFrame, info, {BackgroundTransparency = 0.15}):Play()
    task.wait(0.1)
    TweenService:Create(Title, info, {TextTransparency = 0}):Play()
    TweenService:Create(Subtitle, info, {TextTransparency = 0}):Play()
    task.wait(0.2)
    TweenService:Create(OldIcon, info, {ImageTransparency = 0}):Play()
    TweenService:Create(NewIcon, info, {ImageTransparency = 0}):Play()
    TweenService:Create(OldIconContainer, info, {BackgroundTransparency = 0.9}):Play()
    TweenService:Create(NewIconContainer, info, {BackgroundTransparency = 0.9}):Play()
    TweenService:Create(OldTitle, info, {TextTransparency = 0}):Play()
    TweenService:Create(NewTitle, info, {TextTransparency = 0}):Play()
    TweenService:Create(OldDesc, info, {TextTransparency = 0}):Play()
    TweenService:Create(NewDesc, info, {TextTransparency = 0}):Play()
    TweenService:Create(YesBtn, info, {TextTransparency = 0, BackgroundTransparency = 0.9}):Play()
    TweenService:Create(NoBtn, info, {TextTransparency = 0, BackgroundTransparency = 0.9}):Play()
end

local function get(url)
    local info = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    TweenService:Create(BackgroundBlur, info, {Size = 0}):Play()
    TweenService:Create(MainFrame, info, {BackgroundTransparency = 1}):Play()
    TweenService:Create(Shadow, info, {ImageTransparency = 1}):Play()
    
    for _, v in pairs(MainFrame:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextButton") then
            TweenService:Create(v, info, {TextTransparency = 1, BackgroundTransparency = 1}):Play()
        elseif v:IsA("ImageLabel") then
            TweenService:Create(v, info, {ImageTransparency = 1}):Play()
        elseif v:IsA("Frame") then
            TweenService:Create(v, info, {BackgroundTransparency = 1}):Play()
        elseif v:IsA("UIStroke") then
            TweenService:Create(v, info, {Transparency = 1}):Play()
        end
    end
    
    task.wait(0.5)
    ScreenGui:Destroy()
    BackgroundBlur:Destroy()
    loadstring(game:HttpGet(url))()
end

YesBtn.MouseButton1Click:Connect(function()
    get("https://raw.githubusercontent.com/hm5650/HBSS/refs/heads/main/HBSS_Old.lua")
end)

NoBtn.MouseButton1Click:Connect(function()
    get("https://raw.githubusercontent.com/hm5650/HBSS/refs/heads/main/HBSS_New.lua")
end)

tw()
