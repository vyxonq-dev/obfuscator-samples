-- SERVICES

local TweenService = game:GetService("TweenService")

local UserInputService = game:GetService("UserInputService")

------------------------------------------------------------------

-- Helper: Safely retrieve, compile, and execute remote code.

------------------------------------------------------------------

local function runRemoteScript(url)

    local ok, response = pcall(function()

        return game:HttpGet(url, false)

    end)

    if not ok then

        warn("Failed to retrieve script from: " .. url)

        return

    end

    local func = loadstring(response)

    if type(func) ~= "function" then

        warn("Remote script from " .. url .. " did not return a function.")

        return

    end

    local execSuccess, err = pcall(func)

    if not execSuccess then

        warn("Error executing script from " .. url .. ": " .. tostring(err))

    end

end

------------------------------------------------------------------

-- UI CREATION

------------------------------------------------------------------

local player = game.Players.LocalPlayer

local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")

screenGui.Name = "ModernHubUI"

screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

screenGui.Parent = playerGui

-- Main Frame (600x400, modern dark look)

local mainFrame = Instance.new("Frame")

mainFrame.Name = "MainFrame"

mainFrame.Size = UDim2.new(0,600,0,400)

mainFrame.Position = UDim2.new(0.5,-300,0.5,-200)

mainFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)

mainFrame.BackgroundTransparency = 0.1

mainFrame.BorderSizePixel = 0

mainFrame.Active = true

mainFrame.Draggable = true

mainFrame.Parent = screenGui

local mfCorner = Instance.new("UICorner", mainFrame)

mfCorner.CornerRadius = UDim.new(0,20)

------------------------------------------------------------------

-- Title Bar (Top Header)

------------------------------------------------------------------

local titleBar = Instance.new("Frame")

titleBar.Name = "TitleBar"

titleBar.Size = UDim2.new(1,0,0,60)

titleBar.BackgroundColor3 = Color3.fromRGB(20,20,20)

titleBar.BorderSizePixel = 0

titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")

titleLabel.Name = "TitleLabel"

titleLabel.Size = UDim2.new(1,-100,1,0)

titleLabel.Position = UDim2.new(0,100,0,0)

titleLabel.BackgroundTransparency = 1

titleLabel.Font = Enum.Font.GothamBold

titleLabel.Text = "Pilots universal hub"

titleLabel.TextColor3 = Color3.new(1,1,1)

titleLabel.TextScaled = true

titleLabel.Parent = titleBar

local verLabel = Instance.new("TextLabel")

verLabel.Name = "VersionLabel"

verLabel.Size = UDim2.new(0,80,1,0)

verLabel.Position = UDim2.new(0,10,0,0)

verLabel.BackgroundTransparency = 1

verLabel.Font = Enum.Font.GothamBold

verLabel.Text = "v2.0.1"  -- Updated version!

verLabel.TextColor3 = Color3.fromRGB(200,200,200)

verLabel.TextScaled = true

verLabel.Parent = titleBar

------------------------------------------------------------------

-- Left Sidebar with Tabs

------------------------------------------------------------------

local sidebar = Instance.new("Frame")

sidebar.Name = "Sidebar"

sidebar.Size = UDim2.new(0,150,0,340)  -- 400 - 60 = 340

sidebar.Position = UDim2.new(0,0,0,60)

sidebar.BackgroundColor3 = Color3.fromRGB(40,40,40)

sidebar.BorderSizePixel = 0

sidebar.Parent = mainFrame

local sbCorner = Instance.new("UICorner", sidebar)

sbCorner.CornerRadius = UDim.new(0,20)

local sbLayout = Instance.new("UIListLayout", sidebar)

sbLayout.SortOrder = Enum.SortOrder.LayoutOrder

sbLayout.Padding = UDim.new(0,15)

sbLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Define the four tabs: Hubs, Admin Scripts, Settings, About.

local tabNames = {"Hubs", "Admin Scripts", "Settings", "About"}

local tabButtons = {}

for i, name in ipairs(tabNames) do

    local btn = Instance.new("TextButton")

    btn.Name = "Tab_" .. name

    btn.Size = UDim2.new(1, -20, 0, 40)

    btn.BackgroundColor3 = Color3.fromRGB(60,60,60)

    btn.BorderSizePixel = 0

    local btnCorner = Instance.new("UICorner", btn)

    btnCorner.CornerRadius = UDim.new(0,10)

    btn.Font = Enum.Font.Gotham

    btn.Text = name

    btn.TextColor3 = Color3.new(1,1,1)

    btn.TextScaled = true

    btn.Parent = sidebar

    table.insert(tabButtons, {button = btn, contentId = name:lower()})

end

------------------------------------------------------------------

-- Content Area (Right Side)

------------------------------------------------------------------

local contentArea = Instance.new("Frame")

contentArea.Name = "ContentArea"

contentArea.Size = UDim2.new(1, -150, 1, -60)

contentArea.Position = UDim2.new(0,150,0,60)

contentArea.BackgroundColor3 = Color3.fromRGB(35,35,35)

contentArea.BorderSizePixel = 0

contentArea.Parent = mainFrame

local contentCorner = Instance.new("UICorner", contentArea)

contentCorner.CornerRadius = UDim.new(0,20)

------------------------------------------------------------------

-- CONTENT FUNCTIONS

------------------------------------------------------------------

local function clearContentArea()

    for _, child in ipairs(contentArea:GetChildren()) do

        if child:IsA("GuiObject") then child:Destroy() end

    end

end

-- Default Welcome Content: Sparkly rainbow-gradient message.

local function showWelcomeContent()

    clearContentArea()

    local welcome = Instance.new("TextLabel")

    welcome.Name = "WelcomeLabel"

    welcome.Size = UDim2.new(0.9,0,0.4,0)

    welcome.AnchorPoint = Vector2.new(0.5,0.5)

    welcome.Position = UDim2.new(0.5,0,0.5,0)

    welcome.BackgroundTransparency = 1

    welcome.Font = Enum.Font.GothamBold

    welcome.Text = "Welcome to the new and improved Pilots universal hub!"

    welcome.TextColor3 = Color3.new(1,1,1)

    welcome.TextScaled = true

    welcome.Parent = contentArea

    local grad = Instance.new("UIGradient", welcome)

    grad.Color = ColorSequence.new({

        ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)),

        ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0,255,0)),

        ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0,0,255)),

        ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,255)),

    })

    welcome.TextTransparency = 0.2

    spawn(function()

        while true do

            wait(math.random(3,5))

            local tInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

            local tween1 = TweenService:Create(welcome, tInfo, {TextTransparency = 0})

            tween1:Play()

            tween1.Completed:Wait()

            local tween2 = TweenService:Create(welcome, tInfo, {TextTransparency = 0.2})

            tween2:Play()

            tween2.Completed:Wait()

        end

    end)

end

-- HUBS CONTENT: 10 hub buttons with preset names and remote URLs.

local function createHubsContent()

    clearContentArea()

    local hubContent = Instance.new("ScrollingFrame")

    hubContent.Name = "HubContent"

    hubContent.Size = UDim2.new(1, -20, 1, -20)

    hubContent.Position = UDim2.new(0,10,0,10)

    hubContent.BackgroundTransparency = 1

    hubContent.ScrollBarThickness = 6

    hubContent.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

    hubContent.Parent = contentArea

    local listLayout = Instance.new("UIListLayout", hubContent)

    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    listLayout.Padding = UDim.new(0,10)

    local hubs = {

        {name="YARHM", url="https://rawscripts.net/raw/Universal-Script-YARHM-12403"},

        {name="Shakshoka", url="https://rawscripts.net/raw/Universal-Script-Shakshoka-Universal-Hub-40697"},

        {name="skibidi hub", url="https://rawscripts.net/raw/Universal-Script-Skibidi-Hub-KEYLESS-39864"},

        {name="XVC hub", url="https://rawscripts.net/raw/Universal-Script-XVC-Hub-126-Games-Keyless-40671"},

        {name="acro hub", url="https://rawscripts.net/raw/Universal-Script-Acro-hub-universal-38960"},

        {name="crypton hub", url="https://rawscripts.net/raw/Universal-Script-Crypton-v3-1-39902"},

        {name="avtor hub", url="https://rawscripts.net/raw/Universal-Script-Universall-Avtor-Hub-12564"},

        {name="system broken", url="https://rawscripts.net/raw/Universal-Script-System-Broken-31821"},

        {name="sky hub", url="https://rawscripts.net/raw/Universal-Script-BlueSky-Hub-Universal-37417"},

        {name="solara hub", url="https://rawscripts.net/raw/Universal-Script-Solara-Hub-340-Games-With-Easy-Key-System-40704"},

    }

    for i, hub in ipairs(hubs) do

        local btn = Instance.new("TextButton")

        btn.Name = "HubButton" .. i

        btn.Size = UDim2.new(1,0,0,40)

        btn.BackgroundColor3 = Color3.fromRGB(80,0,80)

        btn.TextColor3 = Color3.new(1,1,1)

        btn.Font = Enum.Font.GothamSemibold

        btn.TextScaled = true

        btn.Text = hub.name

        btn.Parent = hubContent

        local btnCorner = Instance.new("UICorner", btn)

        btnCorner.CornerRadius = UDim.new(0,10)

        btn.MouseButton1Click:Connect(function()

            runRemoteScript(hub.url)

        end)

    end

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

        hubContent.CanvasSize = UDim2.new(0,0,0,listLayout.AbsoluteContentSize.Y)

    end)

end

-- ADMIN SCRIPTS CONTENT: 10 blue admin script buttons.

local function createAdminScriptsContent()

    clearContentArea()

    local adminContent = Instance.new("ScrollingFrame")

    adminContent.Name = "AdminContent"

    adminContent.Size = UDim2.new(1, -20, 1, -20)

    adminContent.Position = UDim2.new(0,10,0,10)

    adminContent.BackgroundTransparency = 1

    adminContent.ScrollBarThickness = 6

    adminContent.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar

    adminContent.Parent = contentArea

    local listLayout = Instance.new("UIListLayout", adminContent)

    listLayout.SortOrder = Enum.SortOrder.LayoutOrder

    listLayout.Padding = UDim.new(0,10)

    for i = 1, 10 do

        local btn = Instance.new("TextButton")

        btn.Name = "AdminButton" .. i

        btn.Size = UDim2.new(1,0,0,40)

        btn.BackgroundColor3 = Color3.fromRGB(0,0,255)  -- Blue buttons.

        btn.TextColor3 = Color3.new(1,1,1)

        btn.Font = Enum.Font.GothamSemibold

        btn.TextScaled = true

        if i == 1 then

            btn.Text = "Infinite Yield Reborn"

            btn.MouseButton1Click:Connect(function()

                runRemoteScript("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-Reborn-Legacy-21819")

            end)

        elseif i == 2 then

            btn.Text = "nameless admin"

            btn.MouseButton1Click:Connect(function()

                runRemoteScript("https://rawscripts.net/raw/Universal-Script-nameless-admin-so-good-38584")

            end)

        elseif i == 3 then

            btn.Text = "AK admin"

            btn.MouseButton1Click:Connect(function()

                runRemoteScript("https://rawscripts.net/raw/Universal-Script-AK-ADMIN-38029")

            end)

        elseif i == 4 then

            btn.Text = "cmd lxte"

            btn.MouseButton1Click:Connect(function()

                runRemoteScript("https://raw.githubusercontent.com/lxte/cmd/main/testing-main.lua")

            end)

        elseif i == 5 then

            btn.Text = "brick admin"

            btn.MouseButton1Click:Connect(function()

                runRemoteScript("https://rawscripts.net/raw/Universal-Script-Brick-Admin-Rewrite-7028")

            end)

        elseif i == 6 then

            btn.Text = "fates admin"

            btn.MouseButton1Click:Connect(function()

                runRemoteScript("https://rawscripts.net/raw/Universal-Script-Fates-Admin-25715")

            end)

        elseif i == 7 then

            btn.Text = "proton admin"

            btn.MouseButton1Click:Connect(function()

                runRemoteScript("https://api.luarmor.net/files/v3/loaders/5e6e6cc1bb32fd926764d064e2c60a3b.lua")

            end)

        elseif i == 8 then

            btn.Text = "quirky cmd"

            btn.MouseButton1Click:Connect(function()

                runRemoteScript("https://rawscripts.net/raw/Universal-Script-QuirkyCMD-FE-admin-8667")

            end)

        elseif i == 9 then

            btn.Text = "homebrew admin"

            btn.MouseButton1Click:Connect(function()

                _G.CustomUI = false

                loadstring(game:HttpGet("https://raw.githubusercontent.com/mgamingpro/HomebrewAdmin/master/Main", true))()

            end)

        elseif i == 10 then

            btn.Text = "CMD X"

            btn.MouseButton1Click:Connect(function()

                loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()

            end)

        end

        btn.Parent = adminContent

        local btnCorner = Instance.new("UICorner", btn)

        btnCorner.CornerRadius = UDim.new(0,10)

    end

    listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

        adminContent.CanvasSize = UDim2.new(0,0,0,listLayout.AbsoluteContentSize.Y)

    end)

end

-- SETTINGS CONTENT: Change UI Color for the entire UI (except top), Rename Top, Serverhop (placeholder).

local function createSettingsContent()

    clearContentArea()

    local setFrame = Instance.new("Frame")

    setFrame.Size = UDim2.new(1, -20, 1, -20)

    setFrame.Position = UDim2.new(0,10,0,10)

    setFrame.BackgroundTransparency = 1

    setFrame.Parent = contentArea

    local setLayout = Instance.new("UIListLayout", setFrame)

    setLayout.SortOrder = Enum.SortOrder.LayoutOrder

    setLayout.Padding = UDim.new(0,15)

    -- Improved Change UI Color: It now affects all major UI areas (except the TitleBar).

    local colorBtn = Instance.new("TextButton")

    colorBtn.Size = UDim2.new(1,0,0,40)

    colorBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)

    colorBtn.Font = Enum.Font.GothamBold

    colorBtn.TextScaled = true

    colorBtn.TextColor3 = Color3.new(1,1,1)

    colorBtn.Text = "Change UI Color"

    colorBtn.Parent = setFrame

    colorBtn.MouseButton1Click:Connect(function()

        local overlay = Instance.new("ScrollingFrame")

        overlay.Name = "ColorOverlay"

        overlay.Size = UDim2.new(0,400,0,100)

        overlay.Position = UDim2.new(0.5,-200,0.5,-50)

        overlay.BackgroundColor3 = Color3.fromRGB(20,20,20)

        overlay.BorderSizePixel = 0

        overlay.CanvasSize = UDim2.new(0,800,0,100)

        overlay.ScrollingDirection = Enum.ScrollingDirection.X

        overlay.Parent = contentArea

        local uc = Instance.new("UICorner", overlay)

        uc.CornerRadius = UDim.new(0,10)

        local availableColors = {

            {name="Default", color=Color3.fromRGB(30,30,30)},

            {name="Midnight", color=Color3.fromRGB(10,10,40)},

            {name="Crimson", color=Color3.fromRGB(100,0,0)},

            {name="Forest", color=Color3.fromRGB(0,100,0)},

            {name="Royal", color=Color3.fromRGB(0,0,100)},

            {name="Violet", color=Color3.fromRGB(80,0,80)},

            {name="Sunset", color=Color3.fromRGB(255,100,50)},

            {name="Ocean", color=Color3.fromRGB(0,150,200)},

            {name="Gold", color=Color3.fromRGB(255,215,0)},

            {name="Emerald", color=Color3.fromRGB(0,200,80)}

        }

        local function darkenColor(color, factor)

            factor = factor or 0.5

            return Color3.new(color.R * factor, color.G * factor, color.B * factor)

        end

        for i, option in ipairs(availableColors) do

            local cBtn = Instance.new("TextButton")

            cBtn.Name = "ColorOption_" .. option.name

            cBtn.Size = UDim2.new(0,40,0,40)

            cBtn.Position = UDim2.new(0, (i-1)*45 + 10, 0, 30)

            cBtn.BackgroundColor3 = option.color

            cBtn.Text = ""

            cBtn.Parent = overlay

            cBtn.MouseButton1Click:Connect(function()

                -- Set the entire UI: mainFrame, sidebar, and contentArea.

                mainFrame.BackgroundColor3 = option.color

                sidebar.BackgroundColor3 = darkenColor(option.color, 0.4)

                contentArea.BackgroundColor3 = darkenColor(option.color, 0.4)

                overlay:Destroy()

            end)

        end

    end)

    local renameBtn = Instance.new("TextButton")

    renameBtn.Size = UDim2.new(1,0,0,40)

    renameBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)

    renameBtn.Font = Enum.Font.GothamBold

    renameBtn.TextScaled = true

    renameBtn.TextColor3 = Color3.new(1,1,1)

    renameBtn.Text = "Rename Top"

    renameBtn.Parent = setFrame

    renameBtn.MouseButton1Click:Connect(function()

        local inputBox = Instance.new("TextBox")

        inputBox.Size = UDim2.new(0,300,0,50)

        inputBox.Position = UDim2.new(0.5,-150,0.5,-25)

        inputBox.BackgroundColor3 = Color3.fromRGB(50,50,50)

        inputBox.TextColor3 = Color3.new(1,1,1)

        inputBox.Font = Enum.Font.GothamBold

        inputBox.PlaceholderText = "Enter new title..."

        inputBox.ClearTextOnFocus = true

        inputBox.Parent = contentArea

        inputBox:CaptureFocus()

        inputBox.FocusLost:Connect(function(enterPressed)

            if enterPressed and inputBox.Text ~= "" then

                titleLabel.Text = inputBox.Text

            end

            inputBox:Destroy()

        end)

    end)

    local serverhopBtn = Instance.new("TextButton")

    serverhopBtn.Size = UDim2.new(1,0,0,40)

    serverhopBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)

    serverhopBtn.Font = Enum.Font.GothamBold

    serverhopBtn.TextScaled = true

    serverhopBtn.TextColor3 = Color3.new(1,1,1)

    serverhopBtn.Text = "Serverhop (Coming Soon)"

    serverhopBtn.Parent = setFrame

end

-- ABOUT CONTENT: Information about the hub and its owner.

local function createAboutContent()

    clearContentArea()

    local aboutFrame = Instance.new("Frame")

    aboutFrame.Size = UDim2.new(1, -20, 1, -20)

    aboutFrame.Position = UDim2.new(0,10,0,10)

    aboutFrame.BackgroundTransparency = 1

    aboutFrame.Parent = contentArea

    local aboutLabel = Instance.new("TextLabel")

    aboutLabel.Size = UDim2.new(1,0,1,0)

    aboutLabel.BackgroundTransparency = 1

    aboutLabel.Font = Enum.Font.GothamBold

    aboutLabel.TextScaled = true

    aboutLabel.TextColor3 = Color3.new(1,1,1)

    aboutLabel.Text = "Pilots Universal Hub\n\nA universal hub for scripts.\nOwner: ZERETET\n\nDesigned for ease-of-use and future expansion."

    aboutLabel.Parent = aboutFrame

end

------------------------------------------------------------------

-- TAB BUTTON BEHAVIOR: Switch content based on selected tab.

------------------------------------------------------------------

local function clearContentAndReset()

    for _, child in ipairs(contentArea:GetChildren()) do

        if child:IsA("GuiObject") then child:Destroy() end

    end

end

for _, tabInfo in ipairs(tabButtons) do

    tabInfo.button.MouseButton1Click:Connect(function()

        clearContentAndReset()

        if tabInfo.contentId == "hubs" then

            createHubsContent()

        elseif tabInfo.contentId == "admin scripts" then

            createAdminScriptsContent()

        elseif tabInfo.contentId == "settings" then

            createSettingsContent()

        elseif tabInfo.contentId == "about" then

            createAboutContent()

        else

            showWelcomeContent()

        end

    end)

end

------------------------------------------------------------------

-- Initially show default welcome content.

------------------------------------------------------------------

showWelcomeContent()