-- Croissant Hub Prison Life
--[[ loadstring(game:HttpGet("https://pastebin.com/raw/ViCTGWDC"))() ]]

local screenGuiName = "MainGUI"

-- Check if "MainGUI" already exists in CoreGui to prevent duplicates
if game:GetService("CoreGui"):FindFirstChild(screenGuiName) then
    game:GetService("CoreGui")[screenGuiName]:Destroy()
end

-- Create the ScreenGui in CoreGui so it persists after respawn
local screenGui = Instance.new("ScreenGui")
screenGui.Name = screenGuiName
screenGui.Parent = game:GetService("CoreGui")

-- Main Frame
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = true
mainFrame.Active = true
mainFrame.Draggable = true

-- Rounded corners
local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 10)

-- Title
local titleLabel = Instance.new("TextLabel", mainFrame)
titleLabel.Text = "Croissant Hub 🥐| Prison Life"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.Position = UDim2.new(0.02, 10, 0, 10)
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(0, 200, 0, 25)

-- Close and Minimize Buttons
local closeButton = Instance.new("TextButton", mainFrame)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(200, 50, 50)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.BackgroundTransparency = 1

local minimizeButton = Instance.new("TextButton", mainFrame)
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.GothamBold
minimizeButton.TextSize = 16
minimizeButton.Size = UDim2.new(0, 25, 0, 25)
minimizeButton.Position = UDim2.new(1, -60, 0, 5)
minimizeButton.BackgroundTransparency = 1

-- Tab Buttons
local tabFrame = Instance.new("Frame", mainFrame)
tabFrame.Position = UDim2.new(0, 10, 0, 50)
tabFrame.Size = UDim2.new(0, 100, 1, -60)
tabFrame.BackgroundTransparency = 1

local tabs = {
    {Name = "Main", Buttons = {"Prizz Admin", "Sky Hub", "Script Hub", "Animation Hub"}},
    {Name = "Tools", Buttons = {"IY", "Keystrokes", "Boost FPS", "Rochips Universal", "Nameless Admin", "Invisible Button", "Free Cam Mobile", "Pshade"}},
    {Name = "Settings", Buttons = {}},
    {Name = "Credits", Buttons = {}}
}

local currentContentFrame

local function showNotification()
    local guiColor = Color3.fromRGB(45, 45, 45)
    local textColor = Color3.fromRGB(255, 255, 255)
    local closeColor = Color3.fromRGB(200, 50, 50)

    local notificationGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    notificationGui.Name = "NotificationGUI"

    local notificationFrame = Instance.new("Frame", notificationGui)
    notificationFrame.AnchorPoint = Vector2.new(1, 1)
    notificationFrame.Position = UDim2.new(1, -20, 1, -20)
    notificationFrame.Size = UDim2.new(0, 200, 0, 50)
    notificationFrame.BackgroundColor3 = guiColor
    notificationFrame.BorderSizePixel = 0

    local cornerRadius = Instance.new("UICorner", notificationFrame)
    cornerRadius.CornerRadius = UDim.new(0, 10)

    local loadedText = Instance.new("TextLabel", notificationFrame)
    loadedText.Text = "Loaded up"
    loadedText.TextColor3 = textColor
    loadedText.Font = Enum.Font.GothamBold
    loadedText.TextSize = 18
    loadedText.Size = UDim2.new(1, -30, 1, 0)
    loadedText.BackgroundTransparency = 1

    local closeButton = Instance.new("TextButton", notificationFrame)
    closeButton.Text = "X"
    closeButton.TextColor3 = closeColor
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 14
    closeButton.Size = UDim2.new(0, 25, 0, 25)
    closeButton.Position = UDim2.new(1, -25, 0, 0)
    closeButton.BackgroundTransparency = 1

    local function fadeOutAndSlide()
        for i = 0, 1, 0.05 do
            notificationFrame.Position = UDim2.new(1, -20 + (100 * i), 1, -20)
            notificationFrame.BackgroundTransparency = i
            loadedText.TextTransparency = i
            closeButton.TextTransparency = i
            wait(0.05)
        end
        notificationGui:Destroy()
    end

    closeButton.MouseButton1Click:Connect(fadeOutAndSlide)
    wait(5)
    fadeOutAndSlide()
end

-- Notification game
local function displayGameLoadedNotification()
    local backgroundColor = Color3.fromRGB(35, 35, 35)
    local textColor = Color3.fromRGB(250, 250, 250)
    local closeBtnColor = Color3.fromRGB(210, 60, 60)

    local gameLoadedGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gameLoadedGui.Name = "GameLoadedNotification"

    local gameLoadedFrame = Instance.new("Frame", gameLoadedGui)
    gameLoadedFrame.AnchorPoint = Vector2.new(1, 1)
    gameLoadedFrame.Position = UDim2.new(1, -20, 1, -80)
    gameLoadedFrame.Size = UDim2.new(0, 210, 0, 55)
    gameLoadedFrame.BackgroundColor3 = backgroundColor
    gameLoadedFrame.BorderSizePixel = 0

    local frameCorner = Instance.new("UICorner", gameLoadedFrame)
    frameCorner.CornerRadius = UDim.new(0, 12)

    local gameLoadedText = Instance.new("TextLabel", gameLoadedFrame)
    gameLoadedText.Text = "Prison Life Game Detected"
    gameLoadedText.TextColor3 = textColor
    gameLoadedText.Font = Enum.Font.GothamBold
    gameLoadedText.TextSize = 18
    gameLoadedText.Size = UDim2.new(1, -30, 1, 0)
    gameLoadedText.BackgroundTransparency = 1

    local closeBtn = Instance.new("TextButton", gameLoadedFrame)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = closeBtnColor
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.Size = UDim2.new(0, 25, 0, 25)
    closeBtn.Position = UDim2.new(1, -25, 0, 0)
    closeBtn.BackgroundTransparency = 1

    local function slideOutAndFade()
        for i = 0, 1, 0.05 do
            gameLoadedFrame.Position = UDim2.new(1, -20 + (120 * i), 1, -80)
            gameLoadedFrame.BackgroundTransparency = i
            gameLoadedText.TextTransparency = i
            closeBtn.TextTransparency = i
            wait(0.05)
        end
        gameLoadedGui:Destroy()
    end

    closeBtn.MouseButton1Click:Connect(slideOutAndFade)
    wait(4)
    slideOutAndFade()
end

local function switchTab(tabIndex)
    if currentContentFrame then
        currentContentFrame.Visible = false
    end
    
    if not tabs[tabIndex].ContentFrame then
        local contentFrame = Instance.new("ScrollingFrame", mainFrame)
        contentFrame.Size = UDim2.new(1, -120, 1, -60)
        contentFrame.Position = UDim2.new(0, 120, 0, 50)
        contentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        contentFrame.BorderSizePixel = 0
        contentFrame.Visible = true
        contentFrame.CanvasSize = UDim2.new(0, 0, 1.5, 0)
        
        local contentCorner = Instance.new("UICorner", contentFrame)
        contentCorner.CornerRadius = UDim.new(0, 10)
        
        tabs[tabIndex].ContentFrame = contentFrame
        
        for i, buttonName in ipairs(tabs[tabIndex].Buttons) do
            local button = Instance.new("TextButton", contentFrame)
            button.Text = buttonName
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.GothamBold
            button.TextSize = 14
            button.Size = UDim2.new(1, -20, 0, 40)
            button.Position = UDim2.new(0, 10, 0, (i - 1) * 50)
            button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            button.BorderSizePixel = 0
            
            local buttonCorner = Instance.new("UICorner", button)
            buttonCorner.CornerRadius = UDim.new(0, 10)
            
            button.MouseButton1Click:Connect(function()
                print(buttonName)
                showNotification()
            end)
        end
    end
    
    tabs[tabIndex].ContentFrame.Visible = true
    currentContentFrame = tabs[tabIndex].ContentFrame
end

local isMinimized = false

minimizeButton.MouseButton1Click:Connect(function()
    if not isMinimized then
        mainFrame.Size = UDim2.new(0, 400, 0, 60)
        tabFrame.Visible = false
        if currentContentFrame then
            currentContentFrame.Visible = false
        end
    else
        mainFrame.Size = UDim2.new(0, 400, 0, 300)
        tabFrame.Visible = true
        if currentContentFrame then
            currentContentFrame.Visible = true
        end
    end
    isMinimized = not isMinimized
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

for i, tab in ipairs(tabs) do
    local tabButton = Instance.new("TextButton", tabFrame)
    tabButton.Text = tab.Name
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Font = Enum.Font.GothamBold
    tabButton.TextSize = 14
    tabButton.Size = UDim2.new(1, 0, 0, 40)
    tabButton.Position = UDim2.new(0, 0, 0, (i - 1) * 50)
    tabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tabButton.BorderSizePixel = 0
    
    local tabCorner = Instance.new("UICorner", tabButton)
    tabCorner.CornerRadius = UDim.new(0, 10)
    
    tabButton.MouseButton1Click:Connect(function()
        switchTab(i)
    end)
end

-- Color options for Settings tab
local colors = {
    {Name = "Default", Color = Color3.fromRGB(40, 40, 40)},
    {Name = "Blue", Color = Color3.fromRGB(0, 122, 204)},
    {Name = "Green", Color = Color3.fromRGB(0, 204, 153)},
    {Name = "Red", Color = Color3.fromRGB(204, 0, 0)},
    {Name = "Purple", Color = Color3.fromRGB(153, 0, 204)},
}

local function changeGuiColor(color)
    mainFrame.BackgroundColor3 = color
    for _, tab in ipairs(tabFrame:GetChildren()) do
        if tab:IsA("TextButton") then
            tab.BackgroundColor3 = color
        end
    end
end

-- Add options to Settings tab
local function setupSettingsTab()
    local contentFrame = tabs[3].ContentFrame

    -- Title for color change section
    local colorTitle = Instance.new("TextLabel", contentFrame)
    colorTitle.Text = "Change GUI Color:"
    colorTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    colorTitle.Font = Enum.Font.GothamBold
    colorTitle.TextSize = 16
    colorTitle.Position = UDim2.new(0, 10, 0, 10)
    colorTitle.Size = UDim2.new(1, -20, 0, 30)
    colorTitle.BackgroundTransparency = 1

    -- Create buttons for each color option
    for i, colorOption in ipairs(colors) do
        local colorButton = Instance.new("TextButton", contentFrame)
        colorButton.Text = colorOption.Name
        colorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        colorButton.Font = Enum.Font.GothamBold
        colorButton.TextSize = 14
        colorButton.Size = UDim2.new(1, -20, 0, 30)
        colorButton.Position = UDim2.new(0, 10, 0, 50 + (i - 1) * 40)
        colorButton.BackgroundColor3 = colorOption.Color
        colorButton.BorderSizePixel = 0

        local buttonCorner = Instance.new("UICorner", colorButton)
        buttonCorner.CornerRadius = UDim.new(0, 10)

        colorButton.MouseButton1Click:Connect(function()
            changeGuiColor(colorOption.Color)
        end)
    end

    -- Toggle GUI shape (rounded or rectangular)
    local shapeButton = Instance.new("TextButton", contentFrame)
    shapeButton.Text = "Toggle GUI Shape"
    shapeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    shapeButton.Font = Enum.Font.GothamBold
    shapeButton.TextSize = 14
    shapeButton.Size = UDim2.new(1, -20, 0, 30)
    shapeButton.Position = UDim2.new(0, 10, 0, 50 + #colors * 40)
    shapeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    shapeButton.BorderSizePixel = 0

    local shapeCorner = Instance.new("UICorner", shapeButton)
    shapeCorner.CornerRadius = UDim.new(0, 10)

    local isRounded = true
    shapeButton.MouseButton1Click:Connect(function()
        isRounded = not isRounded
        mainCorner.CornerRadius = isRounded and UDim.new(0, 10) or UDim.new(0, 0)
    end)
end

-- Credits tab setup
local function setupCreditsTab()
    local contentFrame = tabs[4].ContentFrame

    -- Title for credits
    local creditsTitle = Instance.new("TextLabel", contentFrame)
    creditsTitle.Text = "Credits"
    creditsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsTitle.Font = Enum.Font.GothamBold
    creditsTitle.TextSize = 16
    creditsTitle.Position = UDim2.new(0, 10, 0, 10)
    creditsTitle.Size = UDim2.new(1, -20, 0, 30)
    creditsTitle.BackgroundTransparency = 1

    -- Placeholder for credit names
    local creditText = Instance.new("TextLabel", contentFrame)
    creditText.Text = "Script made by pyst (some aren't made by me)"
    creditText.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditText.Font = Enum.Font.Gotham
    creditText.TextSize = 14
    creditText.Position = UDim2.new(0, 10, 0, 50)
    creditText.Size = UDim2.new(1, -20, 0, 150)
    creditText.TextWrapped = true
    creditText.BackgroundTransparency = 1
end

-- Setup for each tab's content frame
for i, tab in ipairs(tabs) do
    local contentFrame = Instance.new("ScrollingFrame", mainFrame)
    contentFrame.Size = UDim2.new(1, -120, 1, -60)
    contentFrame.Position = UDim2.new(0, 120, 0, 50)
    contentFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    contentFrame.BorderSizePixel = 0
    contentFrame.Visible = false
    contentFrame.CanvasSize = UDim2.new(0, 0, 1.5, 0)
    
    local contentCorner = Instance.new("UICorner", contentFrame)
    contentCorner.CornerRadius = UDim.new(0, 10)
    
    tabs[i].ContentFrame = contentFrame
    
    if tab.Name == "Settings" then
        setupSettingsTab()
    elseif tab.Name == "Credits" then
        setupCreditsTab()
    else
        for j, buttonName in ipairs(tab.Buttons) do
            local button = Instance.new("TextButton", contentFrame)
            button.Text = buttonName
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.GothamBold
            button.TextSize = 14
            button.Size = UDim2.new(1, -20, 0, 40)
            button.Position = UDim2.new(0, 10, 0, (j - 1) * 50)
            button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            button.BorderSizePixel = 0
            
            local buttonCorner = Instance.new("UICorner", button)
            buttonCorner.CornerRadius = UDim.new(0, 10)
            
            button.MouseButton1Click:Connect(function()
                if buttonName == "Prizz Admin" then
                    loadstring(game:HttpGet("https://rawscripts.net/raw/Prison-Life-Prizz-admin-19708"))()
                elseif buttonName == "Sky Hub" then
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
                elseif buttonName == "Script Hub" then
                    loadstring(game:HttpGet("https://pastebin.com/raw/XpEpd325"))()
                elseif buttonName == "Animation Hub" then
                    loadstring(game:HttpGet("https://pastebin.com/raw/gg0KgRnL"))()
                elseif buttonName == "Invisible Button" then
                    loadstring(game:HttpGet("https://pastebin.com/raw/SFr8TqM0"))()
                elseif buttonName == "IY" then
                    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
                elseif buttonName == "Keystrokes" then
                    loadstring(game:HttpGet("https://gist.githubusercontent.com/RedZenXYZ/4d80bfd70ee27000660e4bfa7509c667/raw/da903c570249ab3c0c1a74f3467260972c3d87e6/KeyBoard%2520From%2520Ohio%2520Fr%2520Fr"))()
                elseif buttonName == "Boost FPS" then
                    loadstring(game:HttpGet("https://pastebin.com/raw/MGSbKm7y"))()
                elseif buttonName == "Rochips Universal" then
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-rochips-universal-18294"))()
                elseif buttonName == "Nameless Admin" then
loadstring(game:HttpGet("https://raw.githubusercontent.com/FD2Team/Nameless-Admin-No-Byfron-Kick/main/Source",true))()
                elseif buttonName == "Free Cam Mobile" then
                    loadstring(game:HttpGet("https://pastebin.com/raw/7gqxncEt"))()
                 elseif buttonName == "Pshade" then
                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Pshade-Reborn-13862"))()
                end
                showNotification()
            end)
        end
    end
end

-- Ensure the first tab is visible by default
switchTab(1)
displayGameLoadedNotification() -- Shows what game the GUI is on