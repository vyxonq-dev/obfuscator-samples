local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Library = {
    Icons = {},
    Themes = {
        ["Dark"]     = {Main = Color3.fromRGB(18, 18, 18), Accent = Color3.fromRGB(255, 255, 255), Outline = Color3.fromRGB(40, 40, 40), Text = Color3.fromRGB(230, 230, 230), Secondary = Color3.fromRGB(30, 30, 30)},
        ["Light"]    = {Main = Color3.fromRGB(240, 240, 240), Accent = Color3.fromRGB(0, 0, 0), Outline = Color3.fromRGB(200, 200, 200), Text = Color3.fromRGB(40, 40, 40), Secondary = Color3.fromRGB(220, 220, 220)},
        ["Nebula"]   = {Main = Color3.fromRGB(15, 10, 25), Accent = Color3.fromRGB(150, 50, 255), Outline = Color3.fromRGB(45, 30, 70), Text = Color3.fromRGB(240, 240, 240), Secondary = Color3.fromRGB(25, 20, 45)},
        ["Obsidian"] = {Main = Color3.fromRGB(10, 10, 10), Accent = Color3.fromRGB(120, 120, 120), Outline = Color3.fromRGB(30, 30, 30), Text = Color3.fromRGB(200, 200, 200), Secondary = Color3.fromRGB(20, 20, 20)},
        ["Aurora"]   = {Main = Color3.fromRGB(10, 25, 20), Accent = Color3.fromRGB(0, 255, 150), Outline = Color3.fromRGB(30, 60, 50), Text = Color3.fromRGB(230, 255, 240), Secondary = Color3.fromRGB(15, 40, 35)},
        ["Eclipse"]  = {Main = Color3.fromRGB(15, 15, 20), Accent = Color3.fromRGB(255, 100, 0), Outline = Color3.fromRGB(40, 30, 30), Text = Color3.fromRGB(255, 230, 230), Secondary = Color3.fromRGB(25, 20, 20)},
        ["Carbon"]   = {Main = Color3.fromRGB(25, 25, 25), Accent = Color3.fromRGB(200, 0, 0), Outline = Color3.fromRGB(50, 50, 50), Text = Color3.fromRGB(220, 220, 220), Secondary = Color3.fromRGB(35, 35, 35)},
        ["Ember"]    = {Main = Color3.fromRGB(25, 15, 10), Accent = Color3.fromRGB(255, 120, 0), Outline = Color3.fromRGB(60, 30, 10), Text = Color3.fromRGB(255, 240, 230), Secondary = Color3.fromRGB(40, 25, 15)},
        ["Glacier"]  = {Main = Color3.fromRGB(15, 20, 30), Accent = Color3.fromRGB(0, 200, 255), Outline = Color3.fromRGB(40, 60, 80), Text = Color3.fromRGB(230, 245, 255), Secondary = Color3.fromRGB(25, 35, 50)},
        ["Volt"]     = {Main = Color3.fromRGB(15, 15, 10), Accent = Color3.fromRGB(220, 255, 0), Outline = Color3.fromRGB(50, 50, 20), Text = Color3.fromRGB(245, 255, 220), Secondary = Color3.fromRGB(25, 25, 15)},
        ["Nova"]     = {Main = Color3.fromRGB(20, 10, 30), Accent = Color3.fromRGB(255, 0, 200), Outline = Color3.fromRGB(60, 20, 80), Text = Color3.fromRGB(255, 230, 250), Secondary = Color3.fromRGB(35, 15, 50)},
        ["Aether"]   = {Main = Color3.fromRGB(10, 10, 25), Accent = Color3.fromRGB(0, 255, 255), Outline = Color3.fromRGB(30, 30, 70), Text = Color3.fromRGB(220, 255, 255), Secondary = Color3.fromRGB(20, 20, 45)}
    },
    CurrentTheme = nil
}

Library.CurrentTheme = Library.Themes["Dark"]

local iconSuccess, iconData = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/deedlemcdoodledeedlemcdoodle-creator/SpectravaxHub/main/everylucideassetin.lua"))()
end)
if iconSuccess and type(iconData) == "table" then Library.Icons = iconData end

function Library:SetTheme(name)
    if Library.Themes[name] then
        Library.CurrentTheme = Library.Themes[name]
    end
end

function Library:CreateWindow(title, iconName)
    local theme = Library.CurrentTheme
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Basic_UI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = gethui and gethui() or game:GetService("CoreGui") or LocalPlayer:WaitForChild("PlayerGui")

    local Main = Instance.new("Frame", ScreenGui)
    Main.Size = UDim2.new(0, 210, 0, 280)
    Main.Position = UDim2.new(0.5, -105, 0.5, -140)
    Main.BackgroundColor3 = theme.Main
    Main.BorderSizePixel = 0
    Main.Active = true
    Main.Draggable = true 

    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)
    local Stroke = Instance.new("UIStroke", Main)
    Stroke.Color = theme.Outline
    Stroke.Thickness = 1

    local Header = Instance.new("TextLabel", Main)
    Header.Size = UDim2.new(1, 0, 0, 35)
    Header.BackgroundTransparency = 1
    Header.Text = (iconName and "        " or "  ") .. title
    Header.TextColor3 = theme.Text
    Header.TextXAlignment = Enum.TextXAlignment.Left
    Header.Font = Enum.Font.GothamBold
    Header.TextSize = 13

    if iconName and Library.Icons[iconName] then
        local TitleIcon = Instance.new("ImageLabel", Main)
        TitleIcon.Size = UDim2.new(0, 16, 0, 16)
        TitleIcon.Position = UDim2.new(0, 8, 0, 9)
        TitleIcon.BackgroundTransparency = 1
        TitleIcon.Image = Library.Icons[iconName]
        TitleIcon.ImageColor3 = theme.Text
    end

    local CloseBtn = Instance.new("TextButton", Main)
    CloseBtn.Size = UDim2.new(0, 24, 0, 24)
    CloseBtn.Position = UDim2.new(1, -29, 0, 5)
    CloseBtn.BackgroundColor3 = theme.Secondary
    CloseBtn.Text = "×" 
    CloseBtn.TextColor3 = theme.Text
    CloseBtn.TextSize = 20
    CloseBtn.Font = Enum.Font.Gotham
    Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 4)
    local cStroke = Instance.new("UIStroke", CloseBtn)
    cStroke.Color = theme.Outline
    CloseBtn.Activated:Connect(function() ScreenGui:Destroy() end)

    local Container = Instance.new("ScrollingFrame", Main)
    Container.Size = UDim2.new(1, -14, 1, -45)
    Container.Position = UDim2.new(0, 7, 0, 40)
    Container.BackgroundTransparency = 1
    Container.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Container.ScrollBarThickness = 0
    local Layout = Instance.new("UIListLayout", Container)
    Layout.Padding = UDim.new(0, 6)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder

    local Elements = {}

    function Elements:Label(text)
        local Label = Instance.new("TextLabel", Container)
        Label.Size = UDim2.new(1, 0, 0, 20)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.TextColor3 = theme.Text
        Label.Font = Enum.Font.Gotham
        Label.TextSize = 11
        Label.TextTransparency = 0.4
    end

    function Elements:CopyLabel(text, content)
        local Frame = Instance.new("Frame", Container)
        Frame.Size = UDim2.new(1, 0, 0, 28)
        Frame.BackgroundTransparency = 1
        local Label = Instance.new("TextLabel", Frame)
        Label.Size = UDim2.new(0.7, 0, 1, 0)
        Label.BackgroundTransparency = 1
        Label.Text = text
        Label.TextColor3 = theme.Text
        Label.Font = Enum.Font.Gotham
        Label.TextSize = 11
        Label.TextXAlignment = Enum.TextXAlignment.Left
        local Btn = Instance.new("TextButton", Frame)
        Btn.Size = UDim2.new(0.28, 0, 0.8, 0)
        Btn.Position = UDim2.new(0.72, 0, 0.1, 0)
        Btn.BackgroundColor3 = theme.Accent
        Btn.Text = "Copy"
        Btn.TextColor3 = theme.Main
        Btn.Font = Enum.Font.GothamBold
        Btn.TextSize = 10
        Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 4)
        Btn.Activated:Connect(function()
            if setclipboard then setclipboard(content or text) Btn.Text = "Done!" task.wait(1) Btn.Text = "Copy" end
        end)
    end

    function Elements:Button(text, iconName, callback)
        local Button = Instance.new("TextButton", Container)
        Button.Size = UDim2.new(1, 0, 0, 30)
        Button.BackgroundColor3 = theme.Secondary
        Button.Text = (iconName and "       " or "") .. text
        Button.TextColor3 = theme.Text
        Button.Font = Enum.Font.Gotham
        Button.TextSize = 12
        Button.TextXAlignment = Enum.TextXAlignment.Left
        Button.AutoButtonColor = false
        Instance.new("UICorner", Button).CornerRadius = UDim.new(0, 4)

        if iconName and Library.Icons[iconName] then
            local Icon = Instance.new("ImageLabel", Button)
            Icon.Size = UDim2.new(0, 16, 0, 16)
            Icon.Position = UDim2.new(0, 8, 0.5, -8)
            Icon.BackgroundTransparency = 1
            Icon.Image = Library.Icons[iconName]
            Icon.ImageColor3 = theme.Text
        end

        Button.Activated:Connect(function()
            TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = theme.Accent}):Play()
            TweenService:Create(Button, TweenInfo.new(0.1), {TextColor3 = theme.Main}):Play()
            task.wait(0.1)
            TweenService:Create(Button, TweenInfo.new(0.1), {BackgroundColor3 = theme.Secondary}):Play()
            TweenService:Create(Button, TweenInfo.new(0.1), {TextColor3 = theme.Text}):Play()
            if callback then callback() end
        end)
    end

    function Elements:Slider(text, min, max, default, callback)
        local default = math.clamp(default, min, max)
        local SliderFrame = Instance.new("Frame", Container)
        SliderFrame.Size = UDim2.new(1, 0, 0, 40)
        SliderFrame.BackgroundTransparency = 1
        local Label = Instance.new("TextLabel", SliderFrame)
        Label.Text = text
        Label.Size = UDim2.new(1, 0, 0, 18)
        Label.BackgroundTransparency = 1
        Label.TextColor3 = theme.Text
        Label.Font = Enum.Font.Gotham
        Label.TextSize = 11
        Label.TextXAlignment = Enum.TextXAlignment.Left
        local ValLabel = Instance.new("TextLabel", SliderFrame)
        ValLabel.Text = tostring(default)
        ValLabel.Size = UDim2.new(1, -5, 0, 18)
        ValLabel.BackgroundTransparency = 1
        ValLabel.TextColor3 = theme.Text
        ValLabel.Font = Enum.Font.Gotham
        ValLabel.TextXAlignment = Enum.TextXAlignment.Right
        ValLabel.TextSize = 11
        local Bar = Instance.new("Frame", SliderFrame)
        Bar.Size = UDim2.new(1, -6, 0, 4)
        Bar.Position = UDim2.new(0, 3, 0, 26)
        Bar.BackgroundColor3 = theme.Secondary
        Instance.new("UICorner", Bar)
        local Fill = Instance.new("Frame", Bar)
        Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
        Fill.BackgroundColor3 = theme.Accent
        Instance.new("UICorner", Fill)
        local Circle = Instance.new("Frame", Fill)
        Circle.Size = UDim2.new(0, 10, 0, 10)
        Circle.AnchorPoint = Vector2.new(0.5, 0.5)
        Circle.Position = UDim2.new(1, 0, 0.5, 0)
        Circle.BackgroundColor3 = theme.Accent
        Instance.new("UICorner", Circle).CornerRadius = UDim.new(1, 0)
        local dragging = false
        local function Update(input)
            local pos = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
            Fill.Size = UDim2.new(pos, 0, 1, 0)
            local val = math.floor(((max - min) * pos) + min)
            ValLabel.Text = tostring(val)
            if callback then callback(val) end
        end
        Bar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true Update(input) end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then Update(input) end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
        end)
    end

    function Elements:Dropdown(text, list, callback)
        local DropdownFrame = Instance.new("Frame", Container)
        DropdownFrame.Size = UDim2.new(1, 0, 0, 28)
        DropdownFrame.BackgroundColor3 = theme.Secondary
        DropdownFrame.ClipsDescendants = true
        Instance.new("UICorner", DropdownFrame).CornerRadius = UDim.new(0, 4)

        local DropBtn = Instance.new("TextButton", DropdownFrame)
        DropBtn.Size = UDim2.new(1, 0, 0, 28)
        DropBtn.BackgroundTransparency = 1
        DropBtn.Text = text .. " +"
        DropBtn.TextColor3 = theme.Text
        DropBtn.Font = Enum.Font.Gotham
        DropBtn.TextSize = 12

        local OptionScroll = Instance.new("ScrollingFrame", DropdownFrame)
        OptionScroll.Size = UDim2.new(1, 0, 0, 125)
        OptionScroll.Position = UDim2.new(0, 0, 0, 28)
        OptionScroll.BackgroundTransparency = 1
        OptionScroll.BorderSizePixel = 0
        OptionScroll.ScrollBarThickness = 2
        OptionScroll.ScrollBarImageColor3 = theme.Accent
        OptionScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

        local OptionLayout = Instance.new("UIListLayout", OptionScroll)
        OptionLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local toggled = false
        DropBtn.Activated:Connect(function()
            toggled = not toggled
            local contentHeight = math.min(#list * 25, 125)
            local goalSize = toggled and UDim2.new(1, 0, 0, 28 + contentHeight) or UDim2.new(1, 0, 0, 28)
            TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {Size = goalSize}):Play()
            DropBtn.Text = toggled and text .. " -" or text .. " +"
        end)

        for i, v in pairs(list) do
            local Option = Instance.new("TextButton", OptionScroll)
            Option.Size = UDim2.new(1, 0, 0, 25)
            Option.BackgroundTransparency = 1
            Option.Text = v
            Option.TextColor3 = theme.Text
            Option.Font = Enum.Font.Gotham
            Option.TextSize = 11

            Option.Activated:Connect(function()
                toggled = false
                TweenService:Create(DropdownFrame, TweenInfo.new(0.2), {Size = UDim2.new(1, 0, 0, 28)}):Play()
                DropBtn.Text = text .. " +"
                if callback then callback(v) end
            end)
        end
    end

    return Elements
end

return Library
