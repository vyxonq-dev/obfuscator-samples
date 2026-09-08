-- Script Hub Configuration
local SCRIPTS = {
    UTD = {
        id = "fefdbbf2ecc297b66352edbee99c4d89",
        places = {
            [133410800847665] = true, -- UTD Lobby
            [106402284955512] = true, -- UTD In Game
        }
    },
    ALS = {
        id = "61a5ee8980352bbf717ab957bf207611",
        places = {
            [12886143095] = true,
            [18583778121] = true,
            [12900046592] = true,
        }
    }
}

-- Determine which script to load based on PlaceId
local currentPlaceId = game.PlaceId
local currentScript = nil

for name, config in pairs(SCRIPTS) do
    if config.places[currentPlaceId] then
        currentScript = config
        print("Lune Hub: Detected", name, "game")
        break
    end
end

if not currentScript then
    warn("Lune Hub: Unsupported game (PlaceId:", currentPlaceId, ")")
    return
end

-- Check if already has valid key
if script_key then
    local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
    api.script_id = currentScript.id
    local result = api.check_key(script_key)
    if result.code == "KEY_VALID" then
        api.load_script()
        return
    end
end

local tween = game:GetService("TweenService")
local input = game:GetService("UserInputService")


local discord = "https://discord.gg/3MNMjGWRmw"
local getkey = "https://ads.luarmor.net/get_key?for=Lune_Key-SAfBokULSJJW"

local gui = Instance.new("ScreenGui")
gui.Name = math.random(1000, 9999)
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = gethui() or game.CoreGui

-- background dim
local dim = Instance.new("Frame", gui)
dim.Size = UDim2.new(1, 0, 1, 0)
dim.Position = UDim2.new(0, 0, 0, 0)
dim.BackgroundColor3 = Color3.new(0, 0, 0)
dim.BackgroundTransparency = 0.4
dim.BorderSizePixel = 0

-- main container
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 420, 0, 380)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 24)
main.BorderSizePixel = 0

local mainCorner = Instance.new("UICorner", main)
mainCorner.CornerRadius = UDim.new(0, 14)

-- gradient background
local gradientBg = Instance.new("Frame", main)
gradientBg.Size = UDim2.new(1, 0, 1, 0)
gradientBg.BackgroundColor3 = Color3.fromRGB(120, 70, 255)
gradientBg.BackgroundTransparency = 0.92
gradientBg.BorderSizePixel = 0
gradientBg.ZIndex = 0

local gradCorner = Instance.new("UICorner", gradientBg)
gradCorner.CornerRadius = UDim.new(0, 14)

local gradient = Instance.new("UIGradient", gradientBg)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 60, 200)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 80, 180))
}
gradient.Rotation = 135

-- top accent line
local accent = Instance.new("Frame", main)
accent.Size = UDim2.new(1, 0, 0, 3)
accent.BackgroundColor3 = Color3.fromRGB(120, 70, 255)
accent.BorderSizePixel = 0

local accentCorner = Instance.new("UICorner", accent)
accentCorner.CornerRadius = UDim.new(0, 14)

local accentGrad = Instance.new("UIGradient", accent)
accentGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 70, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 90, 255))
}

-- title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -60, 0, 40)
title.Position = UDim2.new(0, 30, 0, 35)
title.BackgroundTransparency = 1
title.Text = "Lune | Key System"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 26
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left

-- subtitle
local subtitle = Instance.new("TextLabel", main)
subtitle.Size = UDim2.new(1, -60, 0, 20)
subtitle.Position = UDim2.new(0, 30, 0, 72)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Enter your Lune access key to continue\nBuy a monthly key from the discord or use the ad system."
subtitle.TextColor3 = Color3.fromRGB(160, 160, 175)
subtitle.TextSize = 14
subtitle.Font = Enum.Font.Gotham
subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- key input
local inputFrame = Instance.new("Frame", main)
inputFrame.Size = UDim2.new(1, -60, 0, 50)
inputFrame.Position = UDim2.new(0, 30, 0, 115)
inputFrame.BackgroundColor3 = Color3.fromRGB(28, 28, 35)
inputFrame.BorderSizePixel = 0

local inputCorner = Instance.new("UICorner", inputFrame)
inputCorner.CornerRadius = UDim.new(0, 10)

local inputStroke = Instance.new("UIStroke", inputFrame)
inputStroke.Color = Color3.fromRGB(45, 45, 55)
inputStroke.Thickness = 1.5

local keybox = Instance.new("TextBox", inputFrame)
keybox.Size = UDim2.new(1, -24, 1, 0)
keybox.Position = UDim2.new(0, 12, 0, 0)
keybox.BackgroundTransparency = 1
keybox.PlaceholderText = "Paste your key here..."
keybox.PlaceholderColor3 = Color3.fromRGB(100, 100, 115)
keybox.Text = ""
keybox.TextColor3 = Color3.new(1, 1, 1)
keybox.TextSize = 15
keybox.Font = Enum.Font.Gotham
keybox.TextXAlignment = Enum.TextXAlignment.Left
keybox.ClearTextOnFocus = false

-- submit button
local submit = Instance.new("TextButton", main)
submit.Size = UDim2.new(1, -60, 0, 48)
submit.Position = UDim2.new(0, 30, 0, 180)
submit.BackgroundColor3 = Color3.fromRGB(120, 70, 255)
submit.BorderSizePixel = 0
submit.Text = "Submit Key"
submit.TextColor3 = Color3.new(1, 1, 1)
submit.TextSize = 15
submit.Font = Enum.Font.GothamBold
submit.AutoButtonColor = false

local submitCorner = Instance.new("UICorner", submit)
submitCorner.CornerRadius = UDim.new(0, 10)

local submitGrad = Instance.new("UIGradient", submit)
submitGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(120, 70, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 90, 255))
}
submitGrad.Rotation = 90

-- divider with text
local dividerLeft = Instance.new("Frame", main)
dividerLeft.Size = UDim2.new(0.35, -10, 0, 1)
dividerLeft.Position = UDim2.new(0, 30, 0, 255)
dividerLeft.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
dividerLeft.BorderSizePixel = 0

local dividerText = Instance.new("TextLabel", main)
dividerText.Size = UDim2.new(0, 100, 0, 20)
dividerText.Position = UDim2.new(0.5, 0, 0, 245)
dividerText.AnchorPoint = Vector2.new(0.5, 0)
dividerText.BackgroundTransparency = 1
dividerText.Text = "need a key?"
dividerText.TextColor3 = Color3.fromRGB(120, 120, 135)
dividerText.TextSize = 12
dividerText.Font = Enum.Font.Gotham

local dividerRight = Instance.new("Frame", main)
dividerRight.Size = UDim2.new(0.35, -10, 0, 1)
dividerRight.Position = UDim2.new(0.65, 10, 0, 255)
dividerRight.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
dividerRight.BorderSizePixel = 0

-- buttons
local btnContainer = Instance.new("Frame", main)
btnContainer.Size = UDim2.new(1, -60, 0, 45)
btnContainer.Position = UDim2.new(0, 30, 0, 285)
btnContainer.BackgroundTransparency = 1

local discordBtn = Instance.new("TextButton", btnContainer)
discordBtn.Size = UDim2.new(0.48, 0, 1, 0)
discordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
discordBtn.BorderSizePixel = 0
discordBtn.Text = "Discord"
discordBtn.TextColor3 = Color3.new(1, 1, 1)
discordBtn.TextSize = 14
discordBtn.Font = Enum.Font.GothamBold
discordBtn.AutoButtonColor = false

local discordCorner = Instance.new("UICorner", discordBtn)
discordCorner.CornerRadius = UDim.new(0, 9)

local adkeyBtn = Instance.new("TextButton", btnContainer)
adkeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
adkeyBtn.Position = UDim2.new(0.52, 0, 0, 0)
adkeyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
adkeyBtn.BorderSizePixel = 0
adkeyBtn.Text = "Get Key"
adkeyBtn.TextColor3 = Color3.new(1, 1, 1)
adkeyBtn.TextSize = 14
adkeyBtn.Font = Enum.Font.GothamBold
adkeyBtn.AutoButtonColor = false

local adkeyCorner = Instance.new("UICorner", adkeyBtn)
adkeyCorner.CornerRadius = UDim.new(0, 9)

local adkeyStroke = Instance.new("UIStroke", adkeyBtn)
adkeyStroke.Color = Color3.fromRGB(60, 60, 72)
adkeyStroke.Thickness = 1.5

-- status notification
local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, -60, 0, 30)
status.Position = UDim2.new(0, 30, 0, 345)
status.BackgroundTransparency = 1
status.Text = ""
status.TextColor3 = Color3.fromRGB(255, 100, 100)
status.TextSize = 12
status.Font = Enum.Font.GothamBold
status.Visible = false

-- link popup
local linkPopup = Instance.new("Frame", gui)
linkPopup.Size = UDim2.new(0, 360, 0, 160)
linkPopup.Position = UDim2.new(0.5, 0, 0.5, 0)
linkPopup.AnchorPoint = Vector2.new(0.5, 0.5)
linkPopup.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
linkPopup.BorderSizePixel = 0
linkPopup.Visible = false

local popupCorner = Instance.new("UICorner", linkPopup)
popupCorner.CornerRadius = UDim.new(0, 12)

local popupStroke = Instance.new("UIStroke", linkPopup)
popupStroke.Color = Color3.fromRGB(60, 60, 75)
popupStroke.Thickness = 2

local popupTitle = Instance.new("TextLabel", linkPopup)
popupTitle.Size = UDim2.new(1, -30, 0, 40)
popupTitle.Position = UDim2.new(0, 15, 0, 15)
popupTitle.BackgroundTransparency = 1
popupTitle.Text = "Copy this link"
popupTitle.TextColor3 = Color3.new(1, 1, 1)
popupTitle.TextSize = 15
popupTitle.Font = Enum.Font.GothamBold
popupTitle.TextXAlignment = Enum.TextXAlignment.Left

local linkBox = Instance.new("TextBox", linkPopup)
linkBox.Size = UDim2.new(1, -30, 0, 45)
linkBox.Position = UDim2.new(0, 15, 0, 60)
linkBox.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
linkBox.BorderSizePixel = 0
linkBox.Text = ""
linkBox.TextColor3 = Color3.fromRGB(150, 180, 255)
linkBox.TextSize = 13
linkBox.Font = Enum.Font.Gotham
linkBox.TextEditable = false
linkBox.ClearTextOnFocus = false

local linkBoxCorner = Instance.new("UICorner", linkBox)
linkBoxCorner.CornerRadius = UDim.new(0, 8)

local closePopup = Instance.new("TextButton", linkPopup)
closePopup.Size = UDim2.new(1, -30, 0, 38)
closePopup.Position = UDim2.new(0, 15, 0, 115)
closePopup.BackgroundColor3 = Color3.fromRGB(120, 70, 255)
closePopup.BorderSizePixel = 0
closePopup.Text = "Close"
closePopup.TextColor3 = Color3.new(1, 1, 1)
closePopup.TextSize = 14
closePopup.Font = Enum.Font.GothamBold

local closeCorner = Instance.new("UICorner", closePopup)
closeCorner.CornerRadius = UDim.new(0, 8)

-- functions
local function showNotif(msg, isError)
    status.Text = msg
    status.TextColor3 = isError and Color3.fromRGB(255, 100, 100) or Color3.fromRGB(100, 255, 120)
    status.Visible = true
    task.wait(3)
    status.Visible = false
end

local function displayLink(url)
    linkBox.Text = url
    linkPopup.Visible = true
    linkBox:CaptureFocus()
end

-- hover effects
submit.MouseEnter:Connect(function()
    tween:Create(submit, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(135, 80, 255)}):Play()
end)
submit.MouseLeave:Connect(function()
    tween:Create(submit, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 70, 255)}):Play()
end)

discordBtn.MouseEnter:Connect(function()
    tween:Create(discordBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(98, 111, 252)}):Play()
end)
discordBtn.MouseLeave:Connect(function()
    tween:Create(discordBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(88, 101, 242)}):Play()
end)

adkeyBtn.MouseEnter:Connect(function()
    tween:Create(adkeyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 52)}):Play()
end)
adkeyBtn.MouseLeave:Connect(function()
    tween:Create(adkeyBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(35, 35, 42)}):Play()
end)

keybox.Focused:Connect(function()
    tween:Create(inputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(120, 70, 255)}):Play()
end)
keybox.FocusLost:Connect(function(enter)
    tween:Create(inputStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(45, 45, 55)}):Play()
    if enter then submit.Activated:Fire() end
end)

-- button clicks
discordBtn.Activated:Connect(function()
    local ok = pcall(function() setclipboard(discord) end)
    if ok then
        showNotif("Discord link copied!", false)
    else
        displayLink(discord)
    end
end)

adkeyBtn.Activated:Connect(function()
    local ok = pcall(function() setclipboard(getkey) end)
    if ok then
        showNotif("Key link copied!", false)
    else
        displayLink(getkey)
    end
end)

closePopup.Activated:Connect(function()
    linkPopup.Visible = false
end)

submit.Activated:Connect(function()
    local key = keybox.Text:gsub("^%s+", ""):gsub("%s+$", "")
    
    if #key < 10 then
        showNotif("Please enter a valid key", true)
        return
    end
    
    showNotif("Checking key...", false)
    
    local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
    api.script_id = currentScript.id
    
    local result = api.check_key(key)
    
    if result.code == "KEY_VALID" then
        showNotif("Valid! Loading...", false)
        script_key = key
        task.wait(0.8)
        gui:Destroy()
        api.load_script()
    elseif result.code == "KEY_HWID_LOCKED" then
        showNotif("HWID mismatch - reset via bot", true)
    elseif result.code == "KEY_INCORRECT" then
        showNotif("Invalid or expired key", true)
    else
        showNotif(result.message or "Unknown error", true)
    end
end)

-- dragging
local dragging, dragInput, dragStart, startPos

main.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = inp.Position
        startPos = main.Position
        
        inp.Changed:Connect(function()
            if inp.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

main.InputChanged:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = inp
    end
end)

input.InputChanged:Connect(function(inp)
    if inp == dragInput and dragging then
        local delta = inp.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- entrance animation
main.Size = UDim2.new(0, 0, 0, 0)
dim.BackgroundTransparency = 1

tween:Create(dim, TweenInfo.new(0.3), {BackgroundTransparency = 0.4}):Play()
tween:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 420, 0, 380)
}):Play()
