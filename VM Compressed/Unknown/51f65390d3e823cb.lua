local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local keyFile = "BSMT_key.txt"
local keyUrl = "https://thebsmt.xyz"

local http = syn and syn.request or request or (http and http.request)
assert(http, "Executor doesn't support HTTP")

local function saveKey(key)
    pcall(function() writefile(keyFile, key) end)
end

local function loadKey()
    if isfile and isfile(keyFile) then return readfile(keyFile) end
end

local gui = Instance.new("ScreenGui")
gui.Name = "BSMTKeySystem"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game:GetService("CoreGui")

local blur = Instance.new("BlurEffect", game.Lighting)
blur.Size = 0
TweenService:Create(blur, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = 15}):Play()

local main = Instance.new("Frame")
main.Name = "MainContainer"
main.Size = UDim2.new(0, 500, 0, 350)
main.Position = UDim2.new(0.5, 0, 0.5, 0)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(24, 25, 32)
main.BorderSizePixel = 0
main.ClipsDescendants = true
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 8)
mainCorner.Parent = main

local dragging, dragInput, dragStart, startPos
local function updateDrag(input)
    local delta = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

local header = Instance.new("Frame")
header.Name = "Header"
header.Size = UDim2.new(1, 0, 0, 60)
header.BackgroundColor3 = Color3.fromRGB(40, 41, 52)
header.BorderSizePixel = 0
header.Parent = main

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 8)
headerCorner.Parent = header

local headerCoverBottom = Instance.new("Frame")
headerCoverBottom.Size = UDim2.new(1, 0, 0, 8)
headerCoverBottom.Position = UDim2.new(0, 0, 1, -8)
headerCoverBottom.BackgroundColor3 = Color3.fromRGB(40, 41, 52)
headerCoverBottom.BorderSizePixel = 0
headerCoverBottom.Parent = header

local headerSeparator = Instance.new("Frame")
headerSeparator.Name = "Separator"
headerSeparator.AnchorPoint = Vector2.new(0, 1)
headerSeparator.BackgroundColor3 = Color3.fromRGB(163, 33, 38)
headerSeparator.BorderSizePixel = 0
headerSeparator.Position = UDim2.new(0, 0, 1, 0)
headerSeparator.Size = UDim2.new(1, 0, 0, 3)
headerSeparator.Parent = header

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 20, 0, 0)
title.BackgroundTransparency = 1
title.Text = "BASEMENT HUB"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

local subtitle = Instance.new("TextLabel")
subtitle.Name = "Subtitle"
subtitle.Size = UDim2.new(1, -100, 0, 15)
subtitle.Position = UDim2.new(0, 20, 1, -20)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Key Authentication System"
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 12
subtitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.Parent = header

local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -50, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(59, 59, 71)
closeBtn.BorderSizePixel = 0
closeBtn.Text = ""
closeBtn.AutoButtonColor = false
closeBtn.Parent = header

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 6)
closeBtnCorner.Parent = closeBtn

local closeIcon = Instance.new("ImageLabel")
closeIcon.Size = UDim2.new(0, 20, 0, 20)
closeIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
closeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
closeIcon.BackgroundTransparency = 1
closeIcon.Image = "rbxassetid://11520882762"
closeIcon.ImageRectOffset = Vector2.new(48, 0)
closeIcon.ImageRectSize = Vector2.new(20, 20)
closeIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
closeIcon.Parent = closeBtn

closeBtn.MouseEnter:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(231, 76, 60)}):Play()
end)

closeBtn.MouseLeave:Connect(function()
    TweenService:Create(closeBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(59, 59, 71)}):Play()
end)

closeBtn.MouseButton1Click:Connect(function()
    TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
    TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    task.wait(0.3)
    gui:Destroy()
    blur:Destroy()
end)

local content = Instance.new("Frame")
content.Name = "Content"
content.Size = UDim2.new(1, -40, 1, -80)
content.Position = UDim2.new(0, 20, 0, 70)
content.BackgroundTransparency = 1
content.Parent = main

local inputSection = Instance.new("Frame")
inputSection.Name = "InputSection"
inputSection.Size = UDim2.new(1, 0, 0, 80)
inputSection.BackgroundTransparency = 1
inputSection.Parent = content

local inputLabel = Instance.new("TextLabel")
inputLabel.Size = UDim2.new(1, 0, 0, 20)
inputLabel.BackgroundTransparency = 1
inputLabel.Text = "Enter License Key"
inputLabel.Font = Enum.Font.GothamMedium
inputLabel.TextSize = 14
inputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
inputLabel.TextXAlignment = Enum.TextXAlignment.Left
inputLabel.Parent = inputSection

local keyInputBg = Instance.new("Frame")
keyInputBg.Name = "KeyInputBackground"
keyInputBg.Size = UDim2.new(1, 0, 0, 45)
keyInputBg.Position = UDim2.new(0, 0, 0, 25)
keyInputBg.BackgroundColor3 = Color3.fromRGB(59, 59, 71)
keyInputBg.BorderSizePixel = 0
keyInputBg.Parent = inputSection

local keyInputCorner = Instance.new("UICorner")
keyInputCorner.CornerRadius = UDim.new(0, 6)
keyInputCorner.Parent = keyInputBg

local keyInputPadding = Instance.new("UIPadding")
keyInputPadding.PaddingBottom = UDim.new(0, 1)
keyInputPadding.PaddingLeft = UDim.new(0, 1)
keyInputPadding.PaddingRight = UDim.new(0, 1)
keyInputPadding.PaddingTop = UDim.new(0, 1)
keyInputPadding.Parent = keyInputBg

local keyInputInner = Instance.new("Frame")
keyInputInner.Size = UDim2.new(1, 0, 1, 0)
keyInputInner.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
keyInputInner.BorderSizePixel = 0
keyInputInner.Parent = keyInputBg

local keyInputInnerCorner = Instance.new("UICorner")
keyInputInnerCorner.CornerRadius = UDim.new(0, 6)
keyInputInnerCorner.Parent = keyInputInner

local keyInputInnerPadding = Instance.new("UIPadding")
keyInputInnerPadding.PaddingBottom = UDim.new(0, 1)
keyInputInnerPadding.PaddingLeft = UDim.new(0, 1)
keyInputInnerPadding.PaddingRight = UDim.new(0, 1)
keyInputInnerPadding.PaddingTop = UDim.new(0, 1)
keyInputInnerPadding.Parent = keyInputInner

local keyInputBox = Instance.new("TextBox")
keyInputBox.Name = "KeyInput"
keyInputBox.Size = UDim2.new(1, -20, 1, 0)
keyInputBox.Position = UDim2.new(0, 10, 0, 0)
keyInputBox.BackgroundColor3 = Color3.fromRGB(31, 31, 43)
keyInputBox.BorderSizePixel = 0
keyInputBox.PlaceholderText = "XXXX-XXXX-XXXX-XXXX"
keyInputBox.PlaceholderColor3 = Color3.fromRGB(139, 141, 147)
keyInputBox.Text = ""
keyInputBox.Font = Enum.Font.GothamMedium
keyInputBox.TextSize = 16
keyInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInputBox.ClearTextOnFocus = false
keyInputBox.Parent = keyInputInner

local keyInputBoxCorner = Instance.new("UICorner")
keyInputBoxCorner.CornerRadius = UDim.new(0, 6)
keyInputBoxCorner.Parent = keyInputBox

local statusLabel = Instance.new("TextLabel")
statusLabel.Name = "Status"
statusLabel.Size = UDim2.new(1, 0, 0, 25)
statusLabel.Position = UDim2.new(0, 0, 0, 95)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = ""
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 14
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.Parent = content

local submitBtn = Instance.new("TextButton")
submitBtn.Name = "SubmitButton"
submitBtn.Size = UDim2.new(1, 0, 0, 45)
submitBtn.Position = UDim2.new(0, 0, 0, 130)
submitBtn.BackgroundColor3 = Color3.fromRGB(59, 59, 71)
submitBtn.BorderSizePixel = 0
submitBtn.Text = ""
submitBtn.AutoButtonColor = false
submitBtn.Parent = content

local submitBtnCorner = Instance.new("UICorner")
submitBtnCorner.CornerRadius = UDim.new(0, 6)
submitBtnCorner.Parent = submitBtn

local submitBtnPadding = Instance.new("UIPadding")
submitBtnPadding.PaddingBottom = UDim.new(0, 1)
submitBtnPadding.PaddingLeft = UDim.new(0, 1)
submitBtnPadding.PaddingRight = UDim.new(0, 1)
submitBtnPadding.PaddingTop = UDim.new(0, 1)
submitBtnPadding.Parent = submitBtn

local submitBtnInner = Instance.new("Frame")
submitBtnInner.Size = UDim2.new(1, 0, 1, 0)
submitBtnInner.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
submitBtnInner.BorderSizePixel = 0
submitBtnInner.Parent = submitBtn

local submitBtnInnerCorner = Instance.new("UICorner")
submitBtnInnerCorner.CornerRadius = UDim.new(0, 6)
submitBtnInnerCorner.Parent = submitBtnInner

local submitBtnInnerPadding = Instance.new("UIPadding")
submitBtnInnerPadding.PaddingBottom = UDim.new(0, 1)
submitBtnInnerPadding.PaddingLeft = UDim.new(0, 1)
submitBtnInnerPadding.PaddingRight = UDim.new(0, 1)
submitBtnInnerPadding.PaddingTop = UDim.new(0, 1)
submitBtnInnerPadding.Parent = submitBtnInner

local submitBtnContent = Instance.new("Frame")
submitBtnContent.Size = UDim2.new(1, 0, 1, 0)
submitBtnContent.BackgroundColor3 = Color3.fromRGB(163, 33, 38)
submitBtnContent.BorderSizePixel = 0
submitBtnContent.Parent = submitBtnInner

local submitBtnContentCorner = Instance.new("UICorner")
submitBtnContentCorner.CornerRadius = UDim.new(0, 6)
submitBtnContentCorner.Parent = submitBtnContent

local submitBtnText = Instance.new("TextLabel")
submitBtnText.Size = UDim2.new(1, 0, 1, 0)
submitBtnText.BackgroundTransparency = 1
submitBtnText.Text = "VERIFY KEY"
submitBtnText.Font = Enum.Font.GothamBold
submitBtnText.TextSize = 16
submitBtnText.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtnText.Parent = submitBtnContent

submitBtn.MouseEnter:Connect(function()
    TweenService:Create(submitBtnContent, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 40, 45)}):Play()
end)

submitBtn.MouseLeave:Connect(function()
    TweenService:Create(submitBtnContent, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(163, 33, 38)}):Play()
end)

local buttonContainer = Instance.new("Frame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(1, 0, 0, 50)
buttonContainer.Position = UDim2.new(0, 0, 1, -60)
buttonContainer.BackgroundTransparency = 1
buttonContainer.Parent = content

local getKeyBtn = Instance.new("TextButton")
getKeyBtn.Name = "GetKeyButton"
getKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
getKeyBtn.Position = UDim2.new(0, 0, 0, 0)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(59, 59, 71)
getKeyBtn.BorderSizePixel = 0
getKeyBtn.Text = ""
getKeyBtn.AutoButtonColor = false
getKeyBtn.Parent = buttonContainer

local getKeyBtnCorner = Instance.new("UICorner")
getKeyBtnCorner.CornerRadius = UDim.new(0, 6)
getKeyBtnCorner.Parent = getKeyBtn

local getKeyBtnPadding = Instance.new("UIPadding")
getKeyBtnPadding.PaddingBottom = UDim.new(0, 1)
getKeyBtnPadding.PaddingLeft = UDim.new(0, 1)
getKeyBtnPadding.PaddingRight = UDim.new(0, 1)
getKeyBtnPadding.PaddingTop = UDim.new(0, 1)
getKeyBtnPadding.Parent = getKeyBtn

local getKeyBtnInner = Instance.new("Frame")
getKeyBtnInner.Size = UDim2.new(1, 0, 1, 0)
getKeyBtnInner.BackgroundColor3 = Color3.fromRGB(31, 31, 43)
getKeyBtnInner.BorderSizePixel = 0
getKeyBtnInner.Parent = getKeyBtn

local getKeyBtnInnerCorner = Instance.new("UICorner")
getKeyBtnInnerCorner.CornerRadius = UDim.new(0, 6)
getKeyBtnInnerCorner.Parent = getKeyBtnInner

local getKeyIcon = Instance.new("ImageLabel")
getKeyIcon.Size = UDim2.new(0, 20, 0, 20)
getKeyIcon.Position = UDim2.new(0, 10, 0.5, 0)
getKeyIcon.AnchorPoint = Vector2.new(0, 0.5)
getKeyIcon.BackgroundTransparency = 1
getKeyIcon.Image = "rbxassetid://11293977610"
getKeyIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
getKeyIcon.Parent = getKeyBtnInner

local getKeyText = Instance.new("TextLabel")
getKeyText.Size = UDim2.new(1, -40, 1, 0)
getKeyText.Position = UDim2.new(0, 35, 0, 0)
getKeyText.BackgroundTransparency = 1
getKeyText.Text = "Get Key"
getKeyText.Font = Enum.Font.GothamBold
getKeyText.TextSize = 14
getKeyText.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyText.TextXAlignment = Enum.TextXAlignment.Left
getKeyText.Parent = getKeyBtnInner

getKeyBtn.MouseEnter:Connect(function()
    TweenService:Create(getKeyBtnInner, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 60)}):Play()
end)

getKeyBtn.MouseLeave:Connect(function()
    TweenService:Create(getKeyBtnInner, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(31, 31, 43)}):Play()
end)

getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://thebsmt.xyz")
    statusLabel.Text = "🔗 Key link copied to clipboard!"
    statusLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
    task.wait(2)
    statusLabel.Text = ""
end)

local discordBtn = Instance.new("TextButton")
discordBtn.Name = "DiscordButton"
discordBtn.Size = UDim2.new(0.48, 0, 1, 0)
discordBtn.Position = UDim2.new(0.52, 0, 0, 0)
discordBtn.BackgroundColor3 = Color3.fromRGB(59, 59, 71)
discordBtn.BorderSizePixel = 0
discordBtn.Text = ""
discordBtn.AutoButtonColor = false
discordBtn.Parent = buttonContainer

local discordBtnCorner = Instance.new("UICorner")
discordBtnCorner.CornerRadius = UDim.new(0, 6)
discordBtnCorner.Parent = discordBtn

local discordBtnPadding = Instance.new("UIPadding")
discordBtnPadding.PaddingBottom = UDim.new(0, 1)
discordBtnPadding.PaddingLeft = UDim.new(0, 1)
discordBtnPadding.PaddingRight = UDim.new(0, 1)
discordBtnPadding.PaddingTop = UDim.new(0, 1)
discordBtnPadding.Parent = discordBtn

local discordBtnInner = Instance.new("Frame")
discordBtnInner.Size = UDim2.new(1, 0, 1, 0)
discordBtnInner.BackgroundColor3 = Color3.fromRGB(31, 31, 43)
discordBtnInner.BorderSizePixel = 0
discordBtnInner.Parent = discordBtn

local discordBtnInnerCorner = Instance.new("UICorner")
discordBtnInnerCorner.CornerRadius = UDim.new(0, 6)
discordBtnInnerCorner.Parent = discordBtnInner

local discordIcon = Instance.new("ImageLabel")
discordIcon.Size = UDim2.new(0, 20, 0, 20)
discordIcon.Position = UDim2.new(0, 10, 0.5, 0)
discordIcon.AnchorPoint = Vector2.new(0, 0.5)
discordIcon.BackgroundTransparency = 1
discordIcon.Image = "rbxassetid://129546045826001"
discordIcon.ImageColor3 = Color3.fromRGB(114, 137, 218)
discordIcon.Parent = discordBtnInner

local discordText = Instance.new("TextLabel")
discordText.Size = UDim2.new(1, -40, 1, 0)
discordText.Position = UDim2.new(0, 35, 0, 0)
discordText.BackgroundTransparency = 1
discordText.Text = "Discord"
discordText.Font = Enum.Font.GothamBold
discordText.TextSize = 14
discordText.TextColor3 = Color3.fromRGB(255, 255, 255)
discordText.TextXAlignment = Enum.TextXAlignment.Left
discordText.Parent = discordBtnInner

discordBtn.MouseEnter:Connect(function()
    TweenService:Create(discordBtnInner, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 60)}):Play()
end)

discordBtn.MouseLeave:Connect(function()
    TweenService:Create(discordBtnInner, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(31, 31, 43)}):Play()
end)

discordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/HEwtHApuE4")
    statusLabel.Text = "💬 Discord invite copied to clipboard!"
    statusLabel.TextColor3 = Color3.fromRGB(114, 137, 218)
    task.wait(2)
    statusLabel.Text = ""
end)

local function showUniversalDialog()
    local dialogGui = Instance.new("ScreenGui")
    dialogGui.Name = "UniversalDialog"
    dialogGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    dialogGui.IgnoreGuiInset = true
    dialogGui.Parent = game:GetService("CoreGui")
    
    local dialogBg = Instance.new("Frame")
    dialogBg.Size = UDim2.new(1, 0, 1, 0)
    dialogBg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    dialogBg.BackgroundTransparency = 0.5
    dialogBg.BorderSizePixel = 0
    dialogBg.Parent = dialogGui
    
    local dialog = Instance.new("Frame")
    dialog.Size = UDim2.new(0, 400, 0, 200)
    dialog.Position = UDim2.new(0.5, 0, 0.5, 0)
    dialog.AnchorPoint = Vector2.new(0.5, 0.5)
    dialog.BackgroundColor3 = Color3.fromRGB(24, 25, 32)
    dialog.BorderSizePixel = 0
    dialog.Parent = dialogGui
    
    local dialogCorner = Instance.new("UICorner")
    dialogCorner.CornerRadius = UDim.new(0, 8)
    dialogCorner.Parent = dialog
    
    local dialogHeader = Instance.new("Frame")
    dialogHeader.Size = UDim2.new(1, 0, 0, 50)
    dialogHeader.BackgroundColor3 = Color3.fromRGB(40, 41, 52)
    dialogHeader.BorderSizePixel = 0
    dialogHeader.Parent = dialog
    
    local dialogHeaderCorner = Instance.new("UICorner")
    dialogHeaderCorner.CornerRadius = UDim.new(0, 8)
    dialogHeaderCorner.Parent = dialogHeader
    
    local dialogHeaderCover = Instance.new("Frame")
    dialogHeaderCover.Size = UDim2.new(1, 0, 0, 8)
    dialogHeaderCover.Position = UDim2.new(0, 0, 1, -8)
    dialogHeaderCover.BackgroundColor3 = Color3.fromRGB(40, 41, 52)
    dialogHeaderCover.BorderSizePixel = 0
    dialogHeaderCover.Parent = dialogHeader
    
    local dialogTitle = Instance.new("TextLabel")
    dialogTitle.Size = UDim2.new(1, -20, 1, 0)
    dialogTitle.Position = UDim2.new(0, 20, 0, 0)
    dialogTitle.BackgroundTransparency = 1
    dialogTitle.Text = "⚠️ Game Not Supported"
    dialogTitle.Font = Enum.Font.GothamBold
    dialogTitle.TextSize = 16
    dialogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    dialogTitle.TextXAlignment = Enum.TextXAlignment.Left
    dialogTitle.Parent = dialogHeader
    
    local dialogMessage = Instance.new("TextLabel")
    dialogMessage.Size = UDim2.new(1, -40, 0, 60)
    dialogMessage.Position = UDim2.new(0, 20, 0, 60)
    dialogMessage.BackgroundTransparency = 1
    dialogMessage.Text = "This game is not currently supported.\nWould you like to load the Universal script instead?"
    dialogMessage.Font = Enum.Font.Gotham
    dialogMessage.TextSize = 14
    dialogMessage.TextColor3 = Color3.fromRGB(200, 200, 200)
    dialogMessage.TextWrapped = true
    dialogMessage.TextXAlignment = Enum.TextXAlignment.Left
    dialogMessage.TextYAlignment = Enum.TextYAlignment.Top
    dialogMessage.Parent = dialog
    
    local yesBtn = Instance.new("TextButton")
    yesBtn.Size = UDim2.new(0.42, 0, 0, 40)
    yesBtn.Position = UDim2.new(0.08, 0, 1, -50)
    yesBtn.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
    yesBtn.BorderSizePixel = 0
    yesBtn.Text = "Yes, Load Universal"
    yesBtn.Font = Enum.Font.GothamBold
    yesBtn.TextSize = 14
    yesBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    yesBtn.AutoButtonColor = false
    yesBtn.Parent = dialog
    
    local yesBtnCorner = Instance.new("UICorner")
    yesBtnCorner.CornerRadius = UDim.new(0, 6)
    yesBtnCorner.Parent = yesBtn
    
    local noBtn = Instance.new("TextButton")
    noBtn.Size = UDim2.new(0.42, 0, 0, 40)
    noBtn.Position = UDim2.new(0.5, 0, 1, -50)
    noBtn.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
    noBtn.BorderSizePixel = 0
    noBtn.Text = "No, Cancel"
    noBtn.Font = Enum.Font.GothamBold
    noBtn.TextSize = 14
    noBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    noBtn.AutoButtonColor = false
    noBtn.Parent = dialog
    
    local noBtnCorner = Instance.new("UICorner")
    noBtnCorner.CornerRadius = UDim.new(0, 6)
    noBtnCorner.Parent = noBtn
    
    yesBtn.MouseEnter:Connect(function()
        TweenService:Create(yesBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 220, 130)}):Play()
    end)
    
    yesBtn.MouseLeave:Connect(function()
        TweenService:Create(yesBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(46, 204, 113)}):Play()
    end)
    
    noBtn.MouseEnter:Connect(function()
        TweenService:Create(noBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(245, 90, 75)}):Play()
    end)
    
    noBtn.MouseLeave:Connect(function()
        TweenService:Create(noBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(231, 76, 60)}):Play()
    end)
    
    yesBtn.MouseButton1Click:Connect(function()
        TweenService:Create(dialog, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        task.wait(0.2)
        dialogGui:Destroy()
        loadstring(game:HttpGet(universalScriptUrl))()
    end)
    
    noBtn.MouseButton1Click:Connect(function()
        TweenService:Create(dialog, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        task.wait(0.2)
        dialogGui:Destroy()
    end)
    
    dialog.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(dialog, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 400, 0, 200)}):Play()
end

local function getFingerprint()
    local lp = game:GetService("Players").LocalPlayer
    return lp and lp.Name or "Unknown"
end

local function encrypt(tbl, nonce, seed)
    local raw = HttpService:JSONEncode(tbl)
    local out = {}

    for i = 1, #raw do
        local b = raw:byte(i)
        b = bit32.bxor(b, nonce:byte((i - 1) % #nonce + 1))
        b = (b + seed) % 256
        out[i] = string.char(b)
    end

    local encrypted = table.concat(out)
    
    if base64 and base64.encode then
        return base64.encode(encrypted)
    elseif base64_encode then
        return base64_encode(encrypted)
    elseif crypt and crypt.base64encode then
        return crypt.base64encode(encrypted)
    elseif crypt and crypt.base64.encode then
        return crypt.base64.encode(encrypted)
    else
        error("No Base64 encoding function available in this executor")
    end
end

submitBtn.MouseButton1Click:Connect(function()
    local key = keyInputBox.Text
    if key == "" then return end

    submitBtnText.Text = "VALIDATING..."
    statusLabel.Text = "Securing session..."
    statusLabel.TextColor3 = Color3.fromRGB(241, 196, 15)

    local hs = http({
        Url = keyUrl .. "/handshake",
        Method = "GET"
    })

    if hs.StatusCode ~= 200 then
        submitBtnText.Text = "VERIFY KEY"
        statusLabel.Text = "Handshake failed"
        statusLabel.TextColor3 = Color3.fromRGB(231, 76, 60)
        return
    end

    local hsData = HttpService:JSONDecode(hs.Body)
    local nonce, seed, ts = hsData.nonce, hsData.seed, hsData.ts

    local payload = encrypt({
        key = key,
        fingerprint = getFingerprint(), 
        placeId = game.PlaceId,
        ts = ts,
        clientId = game:GetService("RbxAnalyticsService"):GetClientId(),
        exec = identifyexecutor and identifyexecutor() or "unk"
    }, nonce, seed)

    local res = http({
        Url = keyUrl .. "/verify",
        Method = "POST",
        Headers = { ["Content-Type"] = "text/plain" },
        Body = payload
    })

    local body = HttpService:JSONDecode(res.Body or "{}")

    if not body.token then
        submitBtnText.Text = "VERIFY KEY"
        statusLabel.Text = body.error or "Auth failed"
        statusLabel.TextColor3 = Color3.fromRGB(231, 76, 60)
        return
    end

    saveKey(key)
    _G.__SESSION = body.token

    submitBtnText.Text = "✓ VERIFIED"
    statusLabel.Text = "Loading script..."
    statusLabel.TextColor3 = Color3.fromRGB(46, 204, 113)

    task.wait(0.5)

    TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
    TweenService:Create(main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)}):Play()
    
    task.wait(0.4)
    
    gui:Destroy()
    blur:Destroy()

    local scriptRes = http({
        Url = keyUrl .. "/script",
        Method = "GET",
        Headers = {
            Authorization = "Bearer " .. _G.__SESSION
        }
    })

    loadstring(scriptRes.Body)()
end)

local savedKey = loadKey()
if savedKey and savedKey ~= "" then
    keyInputBox.Text = savedKey
    statusLabel.Text = "🔑 Saved key loaded"
    statusLabel.TextColor3 = Color3.fromRGB(114, 137, 218)
end

main.Size = UDim2.new(0, 0, 0, 0)
TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 500, 0, 350)}):Play()
