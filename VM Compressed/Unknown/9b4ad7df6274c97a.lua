--[[ working executors
Wave
Zenith
Solora [some issues]
JJsploit [havent tested]
]]
local TweenService = game:GetService('TweenService')
local Players = game:GetService('Players')
local UserInputService = game:GetService('UserInputService')
local MarketplaceService = game:GetService('MarketplaceService')
local player = Players.LocalPlayer
local placeName = MarketplaceService:GetProductInfo(game.PlaceId).Name

print('gorilla ui loader is up creating window')

local games = {
    [110507045583849] = 'https://raw.githubusercontent.com/SoNotClose/Gorilla-UI/main/Gorilla%20UI/src/Gorilla%20Tag%20Ultra/main.lua', -- Gorilla Tag Ultra
    [8877152338] = 'https://raw.githubusercontent.com/SoNotClose/Gorilla-UI/main/Gorilla%20UI/src/Gorilla%20Tag%20Experience/main.lua', -- Gorilla Tag Experience
    [10701984492] = 'https://raw.githubusercontent.com/SoNotClose/Gorilla-UI/main/Gorilla%20UI/src/Orangutag/main.lua', -- Orangutag
}

local scriptURL = games[game.PlaceId]
if not scriptURL then
    player:Kick('GAME NOT SUPPORTED BY GORILLA UI\nIF YOU THINK IT SHOULD PLEASE CONTACT ME\nps @sonotclose')
    return
end

local gui = Instance.new('ScreenGui')
gui.Name = 'GorillaUILoader' -- updating this soon bc in some games it doesnt appear
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = player:WaitForChild('PlayerGui')

local frame = Instance.new('Frame')
frame.Size = UDim2.new(0, 350, 0, 200)
frame.Position = UDim2.new(0.5, -175, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 1
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new('UICorner', frame).CornerRadius = UDim.new(0, 8)

local stroke = Instance.new('UIStroke')
stroke.Color = Color3.fromRGB(60, 60, 60)
stroke.Thickness = 2
stroke.Transparency = 1
stroke.Parent = frame

local function createLabel(parent, text, size, pos, font, textSize, color)
    local label = Instance.new('TextLabel', parent)
    label.Size = size
    label.Position = pos or UDim2.new(0, 0, 0, 0)
    label.Text = text
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.Font = font
    label.TextSize = textSize
    label.TextWrapped = true
    label.TextTransparency = 1
    return label
end

local title = createLabel(frame, 'GORILLA UI LOADER', UDim2.new(1, 0, 0.2, 0), nil, Enum.Font.FredokaOne, 22, Color3.fromRGB(255, 120, 0))
local info = createLabel(frame, 'This game is supported by Gorilla UI\n[' .. game.PlaceId .. '] {' .. placeName .. '}\nWould you like to load?', UDim2.new(1, -20, 0.4, 0), UDim2.new(0, 10, 0.2, 0), Enum.Font.Gotham, 16, Color3.fromRGB(230, 230, 230))

local function createButton(text, color, pos)
    local btn = Instance.new('TextButton', frame)
    btn.Size = UDim2.new(0.45, 0, 0.2, 0)
    btn.Position = pos
    btn.Text = text
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.BackgroundTransparency = 1
    btn.TextTransparency = 1
    Instance.new('UICorner', btn).CornerRadius = UDim.new(0, 6)

    local baseColor = color
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = baseColor:Lerp(Color3.new(1, 1, 1), 0.2)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = baseColor
        }):Play()
    end)

    return btn
end

local yes = createButton('YES', Color3.fromRGB(0, 170, 0), UDim2.new(0.05, 0, 0.7, 0))
local no = createButton('NO', Color3.fromRGB(170, 0, 0), UDim2.new(0.5, 0, 0.7, 0))

local function fadeIn()
    local tweenInfo = TweenInfo.new(0.5)
    TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0}):Play()
    TweenService:Create(stroke, tweenInfo, {Transparency = 0}):Play()
    TweenService:Create(title, tweenInfo, {TextTransparency = 0}):Play()
    TweenService:Create(info, tweenInfo, {TextTransparency = 0}):Play()
    TweenService:Create(yes, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    TweenService:Create(no, tweenInfo, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
end

fadeIn()

local function closeGUI(callback)
    local tweenInfo = TweenInfo.new(0.4)
    TweenService:Create(frame, tweenInfo, {BackgroundTransparency = 1}):Play()
    TweenService:Create(stroke, tweenInfo, {Transparency = 1}):Play()
    TweenService:Create(title, tweenInfo, {TextTransparency = 1}):Play()
    TweenService:Create(info, tweenInfo, {TextTransparency = 1}):Play()
    TweenService:Create(yes, tweenInfo, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    TweenService:Create(no, tweenInfo, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    wait(0.4)
    gui:Destroy()
    if callback then callback() end
end

yes.MouseButton1Click:Connect(function()
    closeGUI(function()
        loadstring(game:HttpGet(scriptURL))()
    end)
end)

no.MouseButton1Click:Connect(function()
    closeGUI()
end)

_G.CloseGorillaUILoader = closeGUI

local isVisible = true
local function setVisibility(visible)
    local transparency = visible and 0 or 1
    local tweenInfo = TweenInfo.new(0.4)
    TweenService:Create(frame, tweenInfo, {BackgroundTransparency = transparency}):Play()
    TweenService:Create(stroke, tweenInfo, {Transparency = transparency}):Play()
    TweenService:Create(title, tweenInfo, {TextTransparency = transparency}):Play()
    TweenService:Create(info, tweenInfo, {TextTransparency = transparency}):Play()
    TweenService:Create(yes, tweenInfo, {BackgroundTransparency = transparency, TextTransparency = transparency}):Play()
    TweenService:Create(no, tweenInfo, {BackgroundTransparency = transparency, TextTransparency = transparency}):Play()
end

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.RightShift then
        isVisible = not isVisible
        setVisibility(isVisible)
    end
end)

-- PASTED FROM VISUAL STUDIO CODE IGNORE COMMITS

