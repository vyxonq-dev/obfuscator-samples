if not game:IsLoaded()then game.Loaded:Wait()end;do ("JNKIE Game Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local S,P,G={"47f6457533b0d4edd7c432f2528207627a5071bb1f28db6ae10198c385607175","a4940999c1670fe6af4ec5b69d14d715121870b5f1e9e917c7f061c803b70770","cffebf9fcf41cb050a6a9963ec213e7ae19527e1916f74442fa8678d991c465e","b99290ab5a4cde0b21f5e8ae933b738230a72028938eca6d4555b13b34bc0fe8","3415417e9c64b305de708d3bdf8eff112790e2fd5ee6e7c16ea60d1a6b3a542c","6a738d69bfbf6714714cc37a11021c149c512e93db82b9c422ca99e0b686deb5","c4478f914b40e7536de54cdde6b938163195c98d1b5438e8e07a706e478e0e84","5bc8904499d814099b79a28983b4ba0f3a0f9186a56f7f89d62a746428f39529","d898b9a5388cec5ab69d6e457ab9cb63fe6dce51aa7f875eba6d16a24b38385f"},{[103820982596314]=1,[114234929420007]=2,[130960021905304]=3,[137233438285284]=4},{[6035872082]=5,[6061766680]=6,[7264587281]=7,[9641502068]=8,[10060242820]=9};local i=P[game.PlaceId]or G[game.GameId];if not i then local h="Unsupported game or script is down!";warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="Ravine";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end);return end;local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "ravine"
Junkie.identifier = "1064771"
Junkie.provider = "ravine"

local result = (function()
    getgenv().UI_CLOSED = false
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    local Colors = {
        background    = Color3.fromRGB(10, 10, 12),
        surface       = Color3.fromRGB(18, 14, 14),
        surfaceLight  = Color3.fromRGB(28, 20, 20),
        primary       = Color3.fromRGB(192, 0, 14),
        primaryDark   = Color3.fromRGB(140, 0, 8),
        primaryGlow   = Color3.fromRGB(220, 40, 40),
        accent        = Color3.fromRGB(180, 30, 30),
        success       = Color3.fromRGB(47, 183, 117),
        successDark   = Color3.fromRGB(37, 153, 97),
        successGlow   = Color3.fromRGB(67, 203, 137),
        error         = Color3.fromRGB(248, 81, 73),
        textPrimary   = Color3.fromRGB(230, 220, 220),
        textSecondary = Color3.fromRGB(160, 130, 130),
        textMuted     = Color3.fromRGB(110, 90, 90),
        border        = Color3.fromRGB(60, 30, 30),
        borderLight   = Color3.fromRGB(80, 40, 40),
        glass         = Color3.fromRGB(255, 255, 255),
        neonBlue      = Color3.fromRGB(255, 60, 60),
        neonPurple    = Color3.fromRGB(200, 0, 0)
    }

    local DISCORD_LINK = "https://discord.gg/get-ravine"

    local function saveVerifiedKey(key)
        pcall(function() writefile("verified_key.txt", key) end)
    end

    local function loadVerifiedKey()
        local ok, content = pcall(function() return readfile("verified_key.txt") end)
        return ok and content or nil
    end

    local function clearSavedKey()
        pcall(function() delfile("verified_key.txt") end)
    end

    local function loadUIFactory()
        return function(Colors, Players, TweenService, UserInputService, Lighting)
            local IconAssets = {
                shield = 84528813312016, x = 73070135088117,
                key = 128426502701541, link = 73034596791310, check = 83827110621355
            }

            local function createIconImage(name, size, color)
                local id = IconAssets[name]
                if id then
                    local img = Instance.new("ImageLabel")
                    img.BackgroundTransparency = 1
                    img.Size = UDim2.new(0, size or 18, 0, size or 18)
                    img.Image = "rbxassetid://" .. tostring(id)
                    img.ImageColor3 = color or Color3.fromRGB(255, 255, 255)
                    img.ScaleType = Enum.ScaleType.Fit
                    return img
                end
                return nil
            end

            return function(self)
                if self.gui then self.gui:Destroy() end
                self.gui = Instance.new("ScreenGui")
                self.gui.Name = "RavineKeySystem"
                self.gui.ResetOnSpawn = false
                self.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                self.gui.IgnoreGuiInset = true

                local backdrop = Instance.new("Frame")
                backdrop.Size = UDim2.new(1, 0, 1, 0)
                backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                backdrop.BackgroundTransparency = 0.35
                backdrop.BorderSizePixel = 0
                backdrop.Parent = self.gui

                local blur = Instance.new("BlurEffect")
                blur.Size = 16
                blur.Name = "JunkieUIBlur"
                blur.Parent = Lighting

                local container = Instance.new("Frame")
                container.Size = UDim2.new(0, 580, 0, 320)
                container.Position = UDim2.new(0.5, 0, 0.5, 0)
                container.AnchorPoint = Vector2.new(0.5, 0.5)
                container.BackgroundColor3 = Colors.surface
                container.BorderSizePixel = 0
                container.Parent = backdrop
                Instance.new("UICorner", container).CornerRadius = UDim.new(0, 14)
                
                local containerStroke = Instance.new("UIStroke")
                containerStroke.Color = Colors.primary
                containerStroke.Thickness = 1.5
                containerStroke.Transparency = 0.4
                containerStroke.Parent = container

                local glowFrame = Instance.new("Frame")
                glowFrame.Size = UDim2.new(1, 60, 1, 60)
                glowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
                glowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                glowFrame.BackgroundColor3 = Colors.primary
                glowFrame.BackgroundTransparency = 0.93
                glowFrame.BorderSizePixel = 0
                glowFrame.ZIndex = -1
                glowFrame.Parent = backdrop
                Instance.new("UICorner", glowFrame).CornerRadius = UDim.new(0, 30)
                TweenService:Create(glowFrame, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                    {BackgroundTransparency = 0.87, Size = UDim2.new(1, 80, 1, 80)}):Play()

                local topBar = Instance.new("Frame")
                topBar.Size = UDim2.new(1, 0, 0, 45)
                topBar.BackgroundColor3 = Colors.background
                topBar.BorderSizePixel = 0
                topBar.ZIndex = 10
                topBar.Parent = container
                Instance.new("UICorner", topBar).CornerRadius = UDim.new(0, 14)
                local topBarFix = Instance.new("Frame", topBar)
                topBarFix.Size = UDim2.new(1, 0, 0, 10)
                topBarFix.Position = UDim2.new(0, 0, 1, -10)
                topBarFix.BackgroundColor3 = Colors.background
                topBarFix.BorderSizePixel = 0

                local topBarLine = Instance.new("Frame")
                topBarLine.Size = UDim2.new(1, 0, 0, 1)
                topBarLine.Position = UDim2.new(0, 0, 1, -1)
                topBarLine.BackgroundColor3 = Colors.primary
                topBarLine.BackgroundTransparency = 0.4
                topBarLine.BorderSizePixel = 0
                topBarLine.Parent = topBar

                local brandLogo = Instance.new("Frame")
                brandLogo.Size = UDim2.new(0, 220, 1, 0)
                brandLogo.Position = UDim2.new(0, 16, 0, 0)
                brandLogo.BackgroundTransparency = 1
                brandLogo.ZIndex = 11
                brandLogo.Parent = topBar

                local brandIcon = createIconImage("shield", 20, Colors.primary)
                brandIcon.AnchorPoint = Vector2.new(0, 0.5)
                brandIcon.Position = UDim2.new(0, 0, 0.5, 0)
                brandIcon.ZIndex = 11
                brandIcon.Parent = brandLogo

                local brandText = Instance.new("TextLabel")
                brandText.BackgroundTransparency = 1
                brandText.Size = UDim2.new(1, -30, 1, 0)
                brandText.Position = UDim2.new(0, 28, 0, 0)
                brandText.Text = "Ravine Key System"
                brandText.TextColor3 = Colors.textPrimary
                brandText.TextSize = 15
                brandText.TextXAlignment = Enum.TextXAlignment.Left
                brandText.Font = Enum.Font.GothamSemibold
                brandText.ZIndex = 11
                brandText.Parent = brandLogo

                local closeButton = Instance.new("TextButton")
                closeButton.Size = UDim2.new(0, 30, 0, 30)
                closeButton.Position = UDim2.new(1, -40, 0.5, 0)
                closeButton.AnchorPoint = Vector2.new(0, 0.5)
                closeButton.BackgroundColor3 = Colors.primary
                closeButton.BackgroundTransparency = 0.7
                closeButton.BorderSizePixel = 0
                closeButton.Text = ""
                closeButton.AutoButtonColor = false
                closeButton.ZIndex = 11
                closeButton.Parent = topBar
                Instance.new("UICorner", closeButton).CornerRadius = UDim.new(0, 8)
                local closeIcon = createIconImage("x", 16, Colors.textPrimary)
                closeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                closeIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
                closeIcon.ZIndex = 12
                closeIcon.Parent = closeButton

                local contentArea = Instance.new("Frame")
                contentArea.Size = UDim2.new(1, -40, 1, -65)
                contentArea.Position = UDim2.new(0, 20, 0, 55)
                contentArea.BackgroundTransparency = 1
                contentArea.Parent = container

                local titleSection = Instance.new("Frame")
                titleSection.Size = UDim2.new(1, 0, 0, 85)
                titleSection.Position = UDim2.new(0, 0, 0, 5)
                titleSection.BackgroundTransparency = 1
                titleSection.Parent = contentArea

                local iconFrame = Instance.new("Frame")
                iconFrame.Size = UDim2.new(0, 52, 0, 52)
                iconFrame.Position = UDim2.new(0.5, -26, 0, 0)
                iconFrame.BackgroundColor3 = Colors.surfaceLight
                iconFrame.BorderSizePixel = 0
                iconFrame.Parent = titleSection
                Instance.new("UICorner", iconFrame).CornerRadius = UDim.new(0, 12)

                local iconGradient = Instance.new("UIGradient")
                iconGradient.Color = ColorSequence.new{
                    ColorSequenceKeypoint.new(0, Colors.primary),
                    ColorSequenceKeypoint.new(0.5, Colors.primaryGlow),
                    ColorSequenceKeypoint.new(1, Colors.accent)
                }
                iconGradient.Rotation = 45
                iconGradient.Parent = iconFrame

                local iconStroke = Instance.new("UIStroke")
                iconStroke.Color = Colors.primary
                iconStroke.Thickness = 2
                iconStroke.Transparency = 0.4
                iconStroke.Parent = iconFrame

                local mainIcon = createIconImage("shield", 26, Color3.fromRGB(255, 255, 255))
                mainIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                mainIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
                mainIcon.Parent = iconFrame

                local titleText = Instance.new("TextLabel")
                titleText.Size = UDim2.new(1, 0, 0, 24)
                titleText.Position = UDim2.new(0, 0, 0, 58)
                titleText.BackgroundTransparency = 1
                titleText.Text = "Ravine Scripts"
                titleText.TextColor3 = Colors.textPrimary
                titleText.TextSize = 17
                titleText.TextXAlignment = Enum.TextXAlignment.Center
                titleText.Font = Enum.Font.GothamBold
                titleText.Parent = titleSection

                local subtitleText = Instance.new("TextLabel")
                subtitleText.Size = UDim2.new(1, 0, 0, 18)
                subtitleText.Position = UDim2.new(0, 0, 0, 82)
                subtitleText.BackgroundTransparency = 1
                subtitleText.Text = "Made by xaaaxaa/yen"
                subtitleText.TextColor3 = Colors.textSecondary
                subtitleText.TextSize = 13
                subtitleText.TextXAlignment = Enum.TextXAlignment.Center
                subtitleText.Font = Enum.Font.Gotham
                subtitleText.Parent = titleSection

                local inputSection = Instance.new("Frame")
                inputSection.Size = UDim2.new(1, 0, 0, 46)
                inputSection.Position = UDim2.new(0, 0, 0, 115)
                inputSection.BackgroundColor3 = Colors.surfaceLight
                inputSection.BorderSizePixel = 0
                inputSection.Parent = contentArea
                Instance.new("UICorner", inputSection).CornerRadius = UDim.new(0, 10)
                local inputStroke = Instance.new("UIStroke")
                inputStroke.Color = Colors.border
                inputStroke.Thickness = 1
                inputStroke.Transparency = 0.4
                inputStroke.Parent = inputSection

                local keyIcon = createIconImage("key", 18, Colors.primary)
                keyIcon.AnchorPoint = Vector2.new(0, 0.5)
                keyIcon.Position = UDim2.new(0, 14, 0.5, 0)
                keyIcon.Parent = inputSection

                local keyInput = Instance.new("TextBox")
                keyInput.Size = UDim2.new(1, -50, 1, 0)
                keyInput.Position = UDim2.new(0, 40, 0, 0)
                keyInput.BackgroundTransparency = 1
                keyInput.PlaceholderText = "Enter your verification key"
                keyInput.PlaceholderColor3 = Colors.textMuted
                keyInput.Text = ""
                keyInput.TextColor3 = Colors.textPrimary
                keyInput.TextSize = 14
                keyInput.Font = Enum.Font.Gotham
                keyInput.Parent = inputSection

                local buttonSection = Instance.new("Frame")
                buttonSection.Size = UDim2.new(1, 0, 0, 40)
                buttonSection.Position = UDim2.new(0, 0, 0, 175)
                buttonSection.BackgroundTransparency = 1
                buttonSection.Parent = contentArea

                local getKeyButton = Instance.new("TextButton")
                getKeyButton.Size = UDim2.new(0.48, 0, 1, 0)
                getKeyButton.Position = UDim2.new(0, 0, 0, 0)
                getKeyButton.BackgroundColor3 = Colors.background
                getKeyButton.Text = "Get Key"
                getKeyButton.TextColor3 = Color3.fromRGB(220, 220, 220)
                getKeyButton.TextSize = 14
                getKeyButton.Font = Enum.Font.GothamSemibold
                getKeyButton.AutoButtonColor = false
                getKeyButton.Parent = buttonSection
                Instance.new("UICorner", getKeyButton).CornerRadius = UDim.new(0, 10)
                local getKeyStroke = Instance.new("UIStroke")
                getKeyStroke.Color = Colors.primary
                getKeyStroke.Thickness = 1.5
                getKeyStroke.Transparency = 0.2
                getKeyStroke.Parent = getKeyButton

                local verifyButton = Instance.new("TextButton")
                verifyButton.Size = UDim2.new(0.48, 0, 1, 0)
                verifyButton.Position = UDim2.new(0.52, 0, 0, 0)
                verifyButton.BackgroundColor3 = Colors.primary
                verifyButton.Text = "Verify Key"
                verifyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                verifyButton.TextSize = 14
                verifyButton.Font = Enum.Font.GothamSemibold
                verifyButton.AutoButtonColor = false
                verifyButton.Parent = buttonSection
                Instance.new("UICorner", verifyButton).CornerRadius = UDim.new(0, 10)

                local statusText = Instance.new("TextLabel")
                statusText.Size = UDim2.new(1, -40, 0, 20)
                statusText.Position = UDim2.new(0.5, 0, 1, -38)
                statusText.AnchorPoint = Vector2.new(0.5, 0)
                statusText.BackgroundTransparency = 1
                statusText.Text = ""
                statusText.TextColor3 = Colors.textSecondary
                statusText.Font = Enum.Font.Gotham
                statusText.TextSize = 12
                statusText.TextXAlignment = Enum.TextXAlignment.Center
                statusText.Visible = false
                statusText.Parent = container

                self.elements = {
                    backdrop = backdrop, container = container,
                    iconFrame = iconFrame, title = titleText,
                    subtitle = subtitleText, getLinkButton = getKeyButton,
                    inputFrame = inputSection, keyInput = keyInput,
                    verifyButton = verifyButton, statusText = statusText,
                    inputStroke = inputStroke, closeButton = closeButton,
                    glowFrame = glowFrame
                }

                closeButton.MouseButton1Click:Connect(function()
                    getgenv().UI_CLOSED = true
                    TweenService:Create(container, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(backdrop, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                    task.wait(0.2)
                    if blur then blur:Destroy() end
                    self.gui:Destroy()
                end)

               
                getKeyButton.MouseButton1Click:Connect(function()
                    if DISCORD_LINK and setclipboard then
                        setclipboard(DISCORD_LINK)
                        self:updateStatus("Discord link copied! Join for key!", Colors.success, 3)
                    else
                        self:updateStatus("Failed to copy link", Colors.error, 3)
                    end
                end)

                verifyButton.MouseButton1Click:Connect(function()
                    local key = keyInput.Text:gsub("%s+", "")
                    if key == "" then
                        self:updateStatus("Please enter a key", Colors.error, 3)
                        self:shakeInput()
                        return
                    end
                    self:updateStatus("Verifying...", Colors.primary, 0)
                    local result = Junkie.check_key(key)
                    if result and result.valid then
                        saveVerifiedKey(key)
                        getgenv().SCRIPT_KEY = key
                        self:updateStatus("Key verified!", Colors.success, 0)
                        task.wait(0.5)
                        self:close()
                    else
                        self:updateStatus("Invalid key", Colors.error, 3)
                        self:shakeInput()
                    end
                end)

                self.updateStatus = function(self, message, color, duration)
                    local st = self.elements.statusText
                    if st then
                        st.Text = message
                        st.TextColor3 = color or Colors.textSecondary
                        st.Visible = true
                        if duration and duration > 0 then
                            task.delay(duration, function()
                                if st and st.Text == message then st.Visible = false end
                            end)
                        end
                    end
                end

                self.shakeInput = function(self)
                    local f = self.elements.inputFrame
                    if not f then return end
                    local orig = f.Position
                    for i = 1, 3 do
                        TweenService:Create(f, TweenInfo.new(0.05), {Position = UDim2.new(orig.X.Scale, orig.X.Offset-8, orig.Y.Scale, orig.Y.Offset)}):Play()
                        task.wait(0.05)
                        TweenService:Create(f, TweenInfo.new(0.05), {Position = UDim2.new(orig.X.Scale, orig.X.Offset+8, orig.Y.Scale, orig.Y.Offset)}):Play()
                        task.wait(0.05)
                    end
                    f.Position = orig
                end

                self.close = function(self)
                    getgenv().UI_CLOSED = true
                    TweenService:Create(self.elements.container, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(self.elements.backdrop, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
                    task.wait(0.2)
                    if blur then blur:Destroy() end
                    self.gui:Destroy()
                end

                self.gui.Parent = game:GetService("CoreGui")
                return self.gui
            end
        end
    end

    local UI = {}
    UI.__index = UI

    function UI.new()
        local self = setmetatable({}, UI)
        self.player = Players.LocalPlayer
        self.gui = nil
        return self
    end

    UI.createUI = function(self)
        local UIFactory = loadUIFactory()
        local uiBuilder = UIFactory(Colors, Players, TweenService, UserInputService, Lighting)
        uiBuilder(self)
        return self.gui
    end

    local ui = UI.new()
    ui:createUI()

    local savedKey = loadVerifiedKey()
    if savedKey then
        local result = Junkie.check_key(savedKey)
        if result and result.valid then
            getgenv().SCRIPT_KEY = savedKey
            ui:close()
            return getgenv().SCRIPT_KEY
        else
            clearSavedKey()
        end
    end

    while not getgenv().UI_CLOSED do task.wait(0.1) end
    return getgenv().SCRIPT_KEY
end)()
do local k=getgenv().SCRIPT_KEY or SCRIPT_KEY or"";if type(k)~="string"then k=""end;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table"and type(syn.request)=="function"and syn.request)or(type(request)=="function"and request)or(type(http_request)=="function"and http_request)or(type(http)=="table"and type(http.request)=="function"and http.request);if type(r)~="function"then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/"..S[i].."?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table"and type(x.Body)=="string"and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED"or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if not a or type(x)~="table"or x.StatusCode~=200 or type(x.Body)~="string"or string.sub(x.Body,1,22)~="https://cdn.jnkie.com/"then warn(m);return end;a,x=q({Url=x.Body,Method="GET"});if not a or type(x)~="table"or x.StatusCode~=200 or type(x.Body)~="string"or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function"then warn(m);return end;f()end end