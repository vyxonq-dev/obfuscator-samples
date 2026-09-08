local Wizard = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Wizard.service = "loltestflork"
Wizard.identifier = "5211"
Wizard.provider = "florktestlol"

local result = (function()
    getgenv().UI_CLOSED = false
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local Lighting = game:GetService("Lighting")
    local Colors = {
        background = Color3.fromRGB(13, 17, 23),
        surface = Color3.fromRGB(22, 27, 34),
        surfaceLight = Color3.fromRGB(30, 36, 44),
        primary = Color3.fromRGB(88, 166, 255),
        primaryDark = Color3.fromRGB(58, 136, 225),
        primaryGlow = Color3.fromRGB(120, 180, 255),
        accent = Color3.fromRGB(136, 87, 224),
        success = Color3.fromRGB(47, 183, 117),
        successDark = Color3.fromRGB(37, 153, 97),
        successGlow = Color3.fromRGB(67, 203, 137),
        error = Color3.fromRGB(248, 81, 73),
        textPrimary = Color3.fromRGB(230, 237, 243),
        textSecondary = Color3.fromRGB(139, 148, 158),
        textMuted = Color3.fromRGB(110, 118, 129),
        border = Color3.fromRGB(48, 54, 61),
        borderLight = Color3.fromRGB(63, 71, 79),
        glass = Color3.fromRGB(255, 255, 255),
        neonBlue = Color3.fromRGB(0, 229, 255),
        neonPurple = Color3.fromRGB(187, 134, 252)
    }
    
    local function hasFileSystemSupport()
        local hasWritefile = pcall(function() return type(writefile) == "function" end)
        local hasReadfile = pcall(function() return type(readfile) == "function" end)
        local hasIsfile = pcall(function() return type(isfile) == "function" end)
        return hasWritefile and hasReadfile and hasIsfile
    end
    
    local fileSystemSupported = hasFileSystemSupport()
    
    local function saveVerifiedKey(key)
        if not fileSystemSupported then return false end
        local ok = pcall(function()
            writefile("verified_key.txt", key)
        end)
        return ok
    end
    
    local function loadVerifiedKey()
        if not fileSystemSupported then 
            return nil 
        end
        
        local ok, content = pcall(function()
            return readfile("verified_key.txt")
        end)
        
        if not ok or not content then 
            return nil 
        end
        return content
    end
    
    local function clearSavedKey()
        if not fileSystemSupported then return false end
        local ok = pcall(function() delfile("verified_key.txt") end)
        return ok
    end
    

    local function loadUIFactory()
        return function(Colors, Players, TweenService, UserInputService, Lighting)
        local IconAssets = {
            shield = 84528813312016,
            x = 73070135088117,
            key = 128426502701541,
            link = 73034596791310,
            check = 83827110621355
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
                if img:IsA("ImageLabel") and img.ResampleMode ~= nil then
                    img.ResampleMode = Enum.ResamplerMode.Default
                end
                return img
            end

            local lbl = Instance.new("TextLabel")
            lbl.BackgroundTransparency = 1
            lbl.Size = UDim2.new(0, size or 18, 0, size or 18)
            lbl.TextScaled = true
            lbl.Font = Enum.Font.SourceSansBold
            lbl.TextColor3 = color or Color3.fromRGB(255, 255, 255)
            lbl.Text = ({ shield = "🛡️", key = "🔑", link = "🔗", x = "✕", check = "✓" })[name] or "🔘"
            return lbl
        end
        return function(self)
            if self.gui then
                self.gui:Destroy()
            end
            
            self.gui = Instance.new("ScreenGui")
            self.gui.Name = "WizardKeySystemUI"
            self.gui.ResetOnSpawn = false
            self.gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            self.gui.IgnoreGuiInset = true
            
            local backdrop = Instance.new("Frame")
            backdrop.Name = "Backdrop"
            backdrop.Size = UDim2.new(1, 0, 1, 0)
            backdrop.Position = UDim2.new(0, 0, 0, 0)
            backdrop.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            backdrop.BackgroundTransparency = 0.4
            backdrop.BorderSizePixel = 0
            backdrop.Parent = self.gui
            
            local blur = Instance.new("BlurEffect")
            blur.Size = 16
            blur.Name = "WizardUIBlur"
            blur.Parent = Lighting
            
            local container = Instance.new("Frame")
            container.Name = "Container"
            
            local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
            local viewportSize = workspace.CurrentCamera.ViewportSize
            
            if isMobile then
                container.Size = UDim2.new(0.6, 0, 0, math.min(320, viewportSize.Y * 0.8))
                container.Position = UDim2.new(0.5, 0, 0.5, 0)
                container.AnchorPoint = Vector2.new(0.5, 0.5)
            else
                container.Size = UDim2.new(0, 580, 0, 320)
                container.Position = UDim2.new(0.5, 0, 0.5, 0)
                container.AnchorPoint = Vector2.new(0.5, 0.5)
            end
            
            container.BackgroundColor3 = Colors.surface
            container.BorderSizePixel = 0
            container.Parent = backdrop
            
            container:SetAttribute("IsMobile", isMobile)
            
            local containerCorner = Instance.new("UICorner")
            containerCorner.CornerRadius = UDim.new(0, 14)
            containerCorner.Parent = container
            
            local containerStroke = Instance.new("UIStroke")
            containerStroke.Color = Colors.border
            containerStroke.Thickness = 1
            containerStroke.Transparency = 0.3
            containerStroke.Parent = container
            
            local shadow = Instance.new("Frame")
            shadow.Name = "Shadow"
            shadow.Size = UDim2.new(1, 40, 1, 40)
            shadow.Position = UDim2.new(0.5, 0, 0.5, 6)
            shadow.AnchorPoint = Vector2.new(0.5, 0.5)
            shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            shadow.BackgroundTransparency = 0.7
            shadow.BorderSizePixel = 0
            shadow.ZIndex = 0
            shadow.Parent = backdrop
            
            local shadowCorner = Instance.new("UICorner")
            shadowCorner.CornerRadius = UDim.new(0, 18)
            shadowCorner.Parent = shadow
            
            local glowFrame = Instance.new("Frame")
            glowFrame.Name = "GlowEffect"
            glowFrame.Size = UDim2.new(1, 60, 1, 60)
            glowFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
            glowFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            glowFrame.BackgroundColor3 = Colors.primary
            glowFrame.BackgroundTransparency = 0.95
            glowFrame.BorderSizePixel = 0
            glowFrame.ZIndex = -1
            glowFrame.Parent = backdrop
            
            local glowCorner = Instance.new("UICorner")
            glowCorner.CornerRadius = UDim.new(0, 30)
            glowCorner.Parent = glowFrame

            local glowTween = TweenService:Create(glowFrame,
                TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
                {BackgroundTransparency = 0.9, Size = UDim2.new(1, 80, 1, 80)}
            )
            glowTween:Play()
            
            local glassOverlay = Instance.new("Frame")
            glassOverlay.Name = "GlassOverlay"
            glassOverlay.Size = UDim2.new(1, 0, 1, 0)
            glassOverlay.Position = UDim2.new(0, 0, 0, 0)
            glassOverlay.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            glassOverlay.BackgroundTransparency = 0.98
            glassOverlay.BorderSizePixel = 0
            glassOverlay.ZIndex = 1
            glassOverlay.Parent = container
            
            local glassCorner = Instance.new("UICorner")
            glassCorner.CornerRadius = UDim.new(0, 14)
            glassCorner.Parent = glassOverlay
            
            local glassGradient = Instance.new("UIGradient")
            glassGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 200, 200))
            }
            glassGradient.Rotation = 45
            glassGradient.Transparency = NumberSequence.new{
                NumberSequenceKeypoint.new(0, 0.96),
                NumberSequenceKeypoint.new(0.5, 0.98),
                NumberSequenceKeypoint.new(1, 1)
            }
            glassGradient.Parent = glassOverlay
            
            local topBar = Instance.new("Frame")
            topBar.Name = "TopBar"
            topBar.Size = UDim2.new(1, 0, 0, 45)
            topBar.Position = UDim2.new(0, 0, 0, 0)
            topBar.BackgroundColor3 = Colors.background
            topBar.BorderSizePixel = 0
            topBar.ZIndex = 10
            topBar.Parent = container
            
            local topBarCorner = Instance.new("UICorner")
            topBarCorner.CornerRadius = UDim.new(0, 14)
            topBarCorner.Parent = topBar

            local topBarFix = Instance.new("Frame")
            topBarFix.Size = UDim2.new(1, 0, 0, 10)
            topBarFix.Position = UDim2.new(0, 0, 1, -10)
            topBarFix.BackgroundColor3 = Colors.background
            topBarFix.BorderSizePixel = 0
            topBarFix.Parent = topBar
            
            local brandLogo = Instance.new("Frame")
            brandLogo.Name = "BrandLogo"
            brandLogo.Size = UDim2.new(0, 200, 1, 0)
            brandLogo.Position = UDim2.new(0, 20, 0, 0)
            brandLogo.BackgroundTransparency = 1
            brandLogo.ZIndex = 11
            brandLogo.Parent = topBar

            local brandLogoIcon = createIconImage("shield", 20, Colors.primary)
            brandLogoIcon.AnchorPoint = Vector2.new(0, 0.5)
            brandLogoIcon.Position = UDim2.new(0, 0, 0.5, 0)
            brandLogoIcon.ZIndex = 11
            brandLogoIcon.Parent = brandLogo

            local brandLogoText = Instance.new("TextLabel")
            brandLogoText.BackgroundTransparency = 1
            brandLogoText.Size = UDim2.new(1, -30, 1, 0)
            brandLogoText.Position = UDim2.new(0, 28, 0, 0)
            brandLogoText.Text = "Wizard"
            brandLogoText.TextColor3 = Colors.textPrimary
            brandLogoText.TextSize = 15
            brandLogoText.TextXAlignment = Enum.TextXAlignment.Left
            brandLogoText.Font = Enum.Font.GothamSemibold
            brandLogoText.ZIndex = 11
            brandLogoText.Parent = brandLogo
            
            local closeButton = Instance.new("TextButton")
            closeButton.Name = "CloseButton"
            closeButton.Size = UDim2.new(0, 30, 0, 30)
            closeButton.Position = UDim2.new(1, -40, 0.5, 0)
            closeButton.AnchorPoint = Vector2.new(0, 0.5)
            closeButton.BackgroundColor3 = Colors.error
            closeButton.BackgroundTransparency = 0.8
            closeButton.BorderSizePixel = 0
            closeButton.Text = ""
            closeButton.AutoButtonColor = false
            closeButton.ZIndex = 11
            closeButton.Parent = topBar
            
            local closeCorner = Instance.new("UICorner")
            closeCorner.CornerRadius = UDim.new(0, 8)
            closeCorner.Parent = closeButton

            local closeIcon = createIconImage("x", 16, Colors.textPrimary)
            closeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            closeIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
            closeIcon.ZIndex = 12
            closeIcon.Parent = closeButton
            

            local contentArea = Instance.new("Frame")
            contentArea.Name = "ContentArea"
            contentArea.Size = UDim2.new(1, -40, 1, -65)
            contentArea.Position = UDim2.new(0, 20, 0, 55)
            contentArea.BackgroundTransparency = 1
            contentArea.Parent = container
            
            local titleSection = Instance.new("Frame")
            titleSection.Name = "TitleSection"
            titleSection.Size = UDim2.new(1, 0, 0, 85)
            titleSection.Position = UDim2.new(0, 0, 0, 5)
            titleSection.BackgroundTransparency = 1
            titleSection.Parent = contentArea
            

            local iconFrame = Instance.new("Frame")
            iconFrame.Name = "IconFrame"
            iconFrame.Size = UDim2.new(0, 52, 0, 52)
            iconFrame.Position = UDim2.new(0.5, -26, 0, 0)
            iconFrame.BackgroundColor3 = Colors.surfaceLight
            iconFrame.BorderSizePixel = 0
            iconFrame.Parent = titleSection
            
            local iconCorner = Instance.new("UICorner")
            iconCorner.CornerRadius = UDim.new(0, 12)
            iconCorner.Parent = iconFrame
  
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
            iconStroke.Transparency = 0.5
            iconStroke.Parent = iconFrame
            
            local strokeGradient = Instance.new("UIGradient")
            strokeGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Colors.neonBlue),
                ColorSequenceKeypoint.new(0.5, Colors.primary),
                ColorSequenceKeypoint.new(1, Colors.neonPurple)
            }
            strokeGradient.Rotation = 0
            strokeGradient.Parent = iconStroke
            
        
            local strokeTween = TweenService:Create(strokeGradient,
                TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
                {Rotation = 360}
            )
            strokeTween:Play()
            
            local mainIcon = createIconImage("shield", 26, Color3.fromRGB(255, 255, 255))
            mainIcon.AnchorPoint = Vector2.new(0.5, 0.5)
            mainIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
            mainIcon.Parent = iconFrame
        
            
            local titleText = Instance.new("TextLabel")
            titleText.Name = "TitleText"
            titleText.Size = UDim2.new(1, 0, 0, 24)
            titleText.Position = UDim2.new(0, 0, 0, 58)
            titleText.BackgroundTransparency = 1
            titleText.Text = self.title
            titleText.TextColor3 = Colors.textPrimary
            titleText.TextSize = 17
            titleText.TextXAlignment = Enum.TextXAlignment.Center
            titleText.Font = Enum.Font.GothamBold
            titleText.Parent = titleSection
            
            local subtitleText = Instance.new("TextLabel")
            subtitleText.Name = "SubtitleText"
            subtitleText.Size = UDim2.new(1, 0, 0, 18)
            subtitleText.Position = UDim2.new(0, 0, 0, 82)
            subtitleText.BackgroundTransparency = 1
            subtitleText.Text = self.subtitle
            subtitleText.TextColor3 = Colors.textSecondary
            subtitleText.TextSize = 13
            subtitleText.TextXAlignment = Enum.TextXAlignment.Center
            subtitleText.Font = Enum.Font.Gotham
            subtitleText.Parent = titleSection
            
            local inputSection = Instance.new("Frame")
            inputSection.Name = "InputSection"
            inputSection.Size = UDim2.new(1, 0, 0, 46)
            inputSection.Position = UDim2.new(0, 0, 0, 115)
            inputSection.BackgroundColor3 = Colors.surfaceLight
            inputSection.BorderSizePixel = 0
            inputSection.Parent = contentArea
            
            local inputCorner = Instance.new("UICorner")
            inputCorner.CornerRadius = UDim.new(0, 10)
            inputCorner.Parent = inputSection
            
            local inputStroke = Instance.new("UIStroke")
            inputStroke.Color = Colors.border
            inputStroke.Thickness = 1
            inputStroke.Transparency = 0.5
            inputStroke.Parent = inputSection
            

            local keyIcon = createIconImage("key", 18, Colors.primary)
            keyIcon.AnchorPoint = Vector2.new(0, 0.5)
            keyIcon.Position = UDim2.new(0, 14, 0.5, 0)
            keyIcon.Parent = inputSection
            
            local keyInput = Instance.new("TextBox")
            keyInput.Name = "KeyInput"
            keyInput.Size = UDim2.new(1, -50, 1, 0)
            keyInput.Position = UDim2.new(0, 40, 0, 0)
            keyInput.BackgroundTransparency = 1
            keyInput.PlaceholderText = "Enter your verification key"
            keyInput.PlaceholderColor3 = Colors.textMuted
            keyInput.Text = ""
            keyInput.TextColor3 = Colors.textPrimary
            keyInput.TextSize = 14
            keyInput.TextXAlignment = Enum.TextXAlignment.Left
            keyInput.TextTruncate = Enum.TextTruncate.AtEnd
            keyInput.Font = Enum.Font.Gotham
            keyInput.ClearTextOnFocus = false
            keyInput.Parent = inputSection
            
            local buttonSection = Instance.new("Frame")
            buttonSection.Name = "ButtonSection"
            buttonSection.Size = UDim2.new(1, 0, 0, 40)
            buttonSection.Position = UDim2.new(0, 0, 0, 175)
            buttonSection.BackgroundTransparency = 1
            buttonSection.Parent = contentArea
            
            local getLinkButton = Instance.new("TextButton")
            getLinkButton.Name = "GetLinkButton"
            getLinkButton.Size = UDim2.new(0.48, 0, 1, 0)
            getLinkButton.Position = UDim2.new(0, 0, 0, 0)
            getLinkButton.BackgroundColor3 = Colors.primary
            getLinkButton.Text = ""  
            getLinkButton.Font = Enum.Font.GothamSemibold
            getLinkButton.TextSize = 14
            getLinkButton.BorderSizePixel = 0
            getLinkButton.AutoButtonColor = false
            getLinkButton.Parent = buttonSection

            local getLinkCorner = Instance.new("UICorner")
            getLinkCorner.CornerRadius = UDim.new(0, 10)
            getLinkCorner.Parent = getLinkButton

            local getLinkGradient = Instance.new("UIGradient")
            getLinkGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Colors.primary),
                ColorSequenceKeypoint.new(1, Colors.primaryDark)
            }
            getLinkGradient.Rotation = 90
            getLinkGradient.Parent = getLinkButton

            local getLinkGlow = Instance.new("UIStroke")
            getLinkGlow.Color = Colors.primaryGlow
            getLinkGlow.Thickness = 0
            getLinkGlow.Transparency = 0.8
            getLinkGlow.Parent = getLinkButton

            local getLinkIcon = createIconImage("link", 16, Color3.fromRGB(255, 255, 255))
            getLinkIcon.AnchorPoint = Vector2.new(0, 0.5)
            getLinkIcon.Position = UDim2.new(0, 12, 0.5, 0)
            getLinkIcon.Parent = getLinkButton

            local getLinkText = Instance.new("TextLabel")
            getLinkText.Name = "ButtonText"
            getLinkText.Size = UDim2.new(1, 0, 1, 0)  
            getLinkText.Position = UDim2.new(0, 0, 0, 0)
            getLinkText.BackgroundTransparency = 1
            getLinkText.Text = "Get Link"
            getLinkText.TextColor3 = Color3.fromRGB(255, 255, 255)  
            getLinkText.Font = Enum.Font.GothamSemibold
            getLinkText.TextSize = 14  
            getLinkText.TextXAlignment = Enum.TextXAlignment.Center  
            getLinkText.Parent = getLinkButton

            local verifyButton = Instance.new("TextButton")
            verifyButton.Name = "VerifyButton"
            verifyButton.Size = UDim2.new(0.48, 0, 1, 0)
            verifyButton.Position = UDim2.new(0.52, 0, 0, 0)
            verifyButton.BackgroundColor3 = Colors.success
            verifyButton.BorderSizePixel = 0
            verifyButton.Text = ""  
            verifyButton.TextSize = 14
            verifyButton.Font = Enum.Font.GothamSemibold
            verifyButton.AutoButtonColor = false
            verifyButton.Parent = buttonSection

            local verifyCorner = Instance.new("UICorner")
            verifyCorner.CornerRadius = UDim.new(0, 10)
            verifyCorner.Parent = verifyButton

            local verifyGradient = Instance.new("UIGradient")
            verifyGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Colors.success),
                ColorSequenceKeypoint.new(1, Colors.successDark)
            }
            verifyGradient.Rotation = 90
            verifyGradient.Parent = verifyButton

            local verifyGlow = Instance.new("UIStroke")
            verifyGlow.Color = Colors.successGlow
            verifyGlow.Thickness = 0
            verifyGlow.Transparency = 0.8
            verifyGlow.Parent = verifyButton

            local verifyIcon = createIconImage("check", 16, Color3.fromRGB(255, 255, 255))
            verifyIcon.AnchorPoint = Vector2.new(0, 0.5)
            verifyIcon.Position = UDim2.new(0, 12, 0.5, 0)
            verifyIcon.Parent = verifyButton

            local verifyText = Instance.new("TextLabel")
            verifyText.Name = "ButtonText"
            verifyText.Size = UDim2.new(1, 0, 1, 0)  
            verifyText.Position = UDim2.new(0, 0, 0, 0)
            verifyText.BackgroundTransparency = 1
            verifyText.Text = "Verify Key"
            verifyText.TextColor3 = Color3.fromRGB(255, 255, 255)  
            verifyText.Font = Enum.Font.GothamSemibold
            verifyText.TextSize = 14  
            verifyText.TextXAlignment = Enum.TextXAlignment.Center  
            verifyText.Parent = verifyButton
            
        
            local statusBar = Instance.new("Frame")
            statusBar.Name = "StatusBar"
            statusBar.Size = UDim2.new(1, -40, 0, 2)
            statusBar.Position = UDim2.new(0.5, 0, 1, -14)
            statusBar.AnchorPoint = Vector2.new(0.5, 0)
            statusBar.BackgroundColor3 = Colors.border
            statusBar.BorderSizePixel = 0
            statusBar.Parent = container

            local statusText = Instance.new("TextLabel")
            statusText.Name = "StatusText"
            statusText.BackgroundTransparency = 1
            statusText.Text = ""
            statusText.TextColor3 = Colors.textSecondary
            statusText.Font = Enum.Font.Gotham
            statusText.TextSize = 12
            statusText.TextXAlignment = Enum.TextXAlignment.Center
            statusText.Size = UDim2.new(1, -40, 0, 20)
            statusText.Position = UDim2.new(0.5, 0, 1, -38)
            statusText.AnchorPoint = Vector2.new(0.5, 0)
            statusText.Visible = false
            statusText.Parent = container
            

            self.elements = {
                backdrop = backdrop,
                container = container,
                iconFrame = iconFrame,
                brandLogo = brandLogo,
                title = titleText,
                subtitle = subtitleText,
                getLinkButton = getLinkButton,
                inputContainer = inputSection,
                inputFrame = inputSection,
                keyInput = keyInput,
                verifyButton = verifyButton,
                statusBar = statusBar,
                statusText = statusText,
                inputStroke = inputStroke,
                closeButton = closeButton,
                glassOverlay = glassOverlay,
                glowFrame = glowFrame
            }
            
            local function createAmbientParticle()
                local particle = Instance.new("Frame")
                particle.Name = "AmbientParticle"
                particle.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
                particle.Position = UDim2.new(math.random(), 0, 1, 0)
                particle.BackgroundColor3 = Colors.primaryGlow
                particle.BackgroundTransparency = 0.7
                particle.BorderSizePixel = 0
                particle.Parent = container
                
                local particleCorner = Instance.new("UICorner")
                particleCorner.CornerRadius = UDim.new(1, 0)
                particleCorner.Parent = particle
                
                local floatTween = TweenService:Create(particle,
                    TweenInfo.new(math.random(8, 12), Enum.EasingStyle.Linear),
                    {
                        Position = UDim2.new(particle.Position.X.Scale, 0, -0.1, 0),
                        BackgroundTransparency = 1
                    }
                )
                floatTween:Play()
                
                floatTween.Completed:Connect(function()
                    particle:Destroy()
                end)
            end
            
            task.spawn(function()
                while container and container.Parent do
                    createAmbientParticle()
                    task.wait(math.random(2, 4))
                end
            end)
            
            local getLinkStroke = getLinkButton:FindFirstChild("UIStroke")
            if getLinkStroke then
                getLinkStroke.Name = "GetLinkButtonGlow"
            end
            local verifyStroke = verifyButton:FindFirstChild("UIStroke")
            if verifyStroke then
                verifyStroke.Name = "VerifyButtonGlow"
            end

            local function setupAnimations()
                local elements = self.elements
                
                if elements.closeButton then
                    elements.closeButton.MouseEnter:Connect(function()
                        TweenService:Create(elements.closeButton, TweenInfo.new(0.2), {
                            BackgroundTransparency = 0.2
                        }):Play()
                    end)
                    
                    elements.closeButton.MouseLeave:Connect(function()
                        TweenService:Create(elements.closeButton, TweenInfo.new(0.2), {
                            BackgroundTransparency = 0.8
                        }):Play()
                    end)
                end
                
                if elements.getLinkButton then
                    elements.getLinkButton.MouseEnter:Connect(function()
                        TweenService:Create(elements.getLinkButton, TweenInfo.new(0.2), {
                            BackgroundColor3 = Colors.primaryGlow,
                            Size = UDim2.new(0.48, 2, 1, 2),
                            Position = UDim2.new(0, -1, 0, -1)
                        }):Play()
                        
                        local glow = elements.getLinkButton:FindFirstChild("GetLinkButtonGlow")
                        if glow then
                            TweenService:Create(glow, TweenInfo.new(0.2), {
                                Thickness = 2,
                                Transparency = 0.3
                            }):Play()
                        end
                    end)
                    
                    elements.getLinkButton.MouseLeave:Connect(function()
                        TweenService:Create(elements.getLinkButton, TweenInfo.new(0.2), {
                            BackgroundColor3 = Colors.primary,
                            Size = UDim2.new(0.48, 0, 1, 0),
                            Position = UDim2.new(0, 0, 0, 0)
                        }):Play()
                        
                        local glow = elements.getLinkButton:FindFirstChild("GetLinkButtonGlow")
                        if glow then
                            TweenService:Create(glow, TweenInfo.new(0.2), {
                                Thickness = 0,
                                Transparency = 0.8
                            }):Play()
                        end
                    end)
                    
                    elements.getLinkButton.MouseButton1Down:Connect(function()
                        TweenService:Create(elements.getLinkButton, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
                            Size = UDim2.new(0.47, 0, 0.95, 0),
                            Position = UDim2.new(0.005, 0, 0.025, 0)
                        }):Play()
                    end)
                    
                    elements.getLinkButton.MouseButton1Up:Connect(function()
                        TweenService:Create(elements.getLinkButton, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
                            Size = UDim2.new(0.48, 0, 1, 0),
                            Position = UDim2.new(0, 0, 0, 0)
                        }):Play()
                    end)
                end
                
                if elements.verifyButton then
                    elements.verifyButton.MouseEnter:Connect(function()
                        TweenService:Create(elements.verifyButton, TweenInfo.new(0.2), {
                            BackgroundColor3 = Colors.successGlow,
                            Size = UDim2.new(0.48, 2, 1, 2),
                            Position = UDim2.new(0.52, -1, 0, -1)
                        }):Play()
                        
                        local glow = elements.verifyButton:FindFirstChild("VerifyButtonGlow")
                        if glow then
                            TweenService:Create(glow, TweenInfo.new(0.2), {
                                Thickness = 2,
                                Transparency = 0.3
                            }):Play()
                        end
                    end)
                    
                    elements.verifyButton.MouseLeave:Connect(function()
                        TweenService:Create(elements.verifyButton, TweenInfo.new(0.2), {
                            BackgroundColor3 = Colors.success,
                            Size = UDim2.new(0.48, 0, 1, 0),
                            Position = UDim2.new(0.52, 0, 0, 0)
                        }):Play()
                        
                        local glow = elements.verifyButton:FindFirstChild("VerifyButtonGlow")
                        if glow then
                            TweenService:Create(glow, TweenInfo.new(0.2), {
                                Thickness = 0,
                                Transparency = 0.8
                            }):Play()
                        end
                    end)
                    
                    elements.verifyButton.MouseButton1Down:Connect(function()
                        TweenService:Create(elements.verifyButton, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
                            Size = UDim2.new(0.47, 0, 0.95, 0),
                            Position = UDim2.new(0.525, 0, 0.025, 0)
                        }):Play()
                    end)
                    
                    elements.verifyButton.MouseButton1Up:Connect(function()
                        TweenService:Create(elements.verifyButton, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
                            Size = UDim2.new(0.48, 0, 1, 0),
                            Position = UDim2.new(0.52, 0, 0, 0)
                        }):Play()
                    end)
                end
                
                if elements.keyInput and elements.inputStroke then
                    elements.keyInput.Focused:Connect(function()
                        TweenService:Create(elements.inputStroke, TweenInfo.new(0.2), {
                            Color = Colors.primary,
                            Thickness = 2,
                            Transparency = 0
                        }):Play()
                    end)
                    
                    elements.keyInput.FocusLost:Connect(function()
                        TweenService:Create(elements.inputStroke, TweenInfo.new(0.2), {
                            Color = Colors.border,
                            Thickness = 1,
                            Transparency = 0.5
                        }):Play()
                    end)
                end
            end
            
            local function animateEntrance()
                local container = self.elements.container
                local backdrop = self.elements.backdrop
                
                if container then
                    container.BackgroundTransparency = 1
                    TweenService:Create(container, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                        BackgroundTransparency = 0
                    }):Play()
                end
                
                if backdrop then
                    backdrop.BackgroundTransparency = 1
                    TweenService:Create(backdrop, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                        BackgroundTransparency = 0.4
                    }):Play()
                end
            end
            
            self.gui.Parent = game:GetService("CoreGui")
            
            self.gui.AncestryChanged:Connect(function(_, parent)
                if parent == nil then
                    local blur = Lighting:FindFirstChild("WizardUIBlur")
                    if blur then blur:Destroy() end
                end
            end)
            
    
            self.showSuccess = function(self, message)
                if not self.elements then return end
                
                local container = self.elements.container
                local loadingOverlay = container:FindFirstChild("LoadingOverlay")
                
                if loadingOverlay then
                    local mainContainer = loadingOverlay:FindFirstChild("MainContainer")
                    local spinnerContainer = mainContainer and mainContainer:FindFirstChild("SpinnerContainer")
                    local loadingText = mainContainer and mainContainer:FindFirstChild("LoadingText")
                    local hintText = mainContainer and mainContainer:FindFirstChild("HintText")
                    
                    if spinnerContainer then
                        TweenService:Create(
                            spinnerContainer,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Rotation = 0}
                        ):Play()
                        
                        for _, child in ipairs(spinnerContainer:GetChildren()) do
                            if child:IsA("Frame") then
                                TweenService:Create(
                                    child,
                                    TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {BackgroundTransparency = 1}
                                ):Play()
                                
                                local stroke = child:FindFirstChildOfClass("UIStroke")
                                if stroke then
                                    TweenService:Create(
                                        stroke,
                                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                        {Transparency = 1}
                                    ):Play()
                                end
                            end
                        end
                        
                        task.wait(0.25)
                        
                        local checkmarkContainer = Instance.new("Frame")
                        checkmarkContainer.Name = "CheckmarkContainer"
                        checkmarkContainer.BackgroundTransparency = 1
                        checkmarkContainer.Size = UDim2.new(1, 0, 1, 0)
                        checkmarkContainer.Position = UDim2.new(0, 0, 0, 0)
                        checkmarkContainer.Parent = mainContainer
                        
                        local successCircle = Instance.new("Frame")
                        successCircle.Name = "SuccessCircle"
                        successCircle.BackgroundColor3 = Color3.fromRGB(34, 197, 94)
                        successCircle.BackgroundTransparency = 1
                        successCircle.Size = UDim2.new(0, 80, 0, 80)
                        successCircle.Position = UDim2.new(0.5, 0, 0, 20)
                        successCircle.AnchorPoint = Vector2.new(0.5, 0)
                        successCircle.Parent = checkmarkContainer
                        
                        local successCorner = Instance.new("UICorner")
                        successCorner.CornerRadius = UDim.new(1, 0)
                        successCorner.Parent = successCircle
                        
                        local glowRing = Instance.new("Frame")
                        glowRing.Name = "GlowRing"
                        glowRing.BackgroundTransparency = 1
                        glowRing.Size = UDim2.new(1, 16, 1, 16)
                        glowRing.Position = UDim2.new(0.5, 0, 0.5, 0)
                        glowRing.AnchorPoint = Vector2.new(0.5, 0.5)
                        glowRing.Parent = successCircle
                        
                        local glowStroke = Instance.new("UIStroke")
                        glowStroke.Color = Color3.fromRGB(34, 197, 94)
                        glowStroke.Thickness = 3
                        glowStroke.Transparency = 1
                        glowStroke.Parent = glowRing
                        
                        local glowCorner = Instance.new("UICorner")
                        glowCorner.CornerRadius = UDim.new(1, 0)
                        glowCorner.Parent = glowRing
                        
                        local checkmark = Instance.new("TextLabel")
                        checkmark.Name = "Checkmark"
                        checkmark.BackgroundTransparency = 1
                        checkmark.Size = UDim2.new(1, 0, 1, 0)
                        checkmark.Position = UDim2.new(0, 0, 0, -4)
                        checkmark.Font = Enum.Font.GothamBold
                        checkmark.Text = "✓"
                        checkmark.TextColor3 = Color3.fromRGB(255, 255, 255)
                        checkmark.TextSize = 0
                        checkmark.TextTransparency = 1
                        checkmark.Parent = successCircle
                        
                        TweenService:Create(
                            successCircle,
                            TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                            {BackgroundTransparency = 0.15, Size = UDim2.new(0, 90, 0, 90)}
                        ):Play()
                        
                        task.wait(0.1)
                        TweenService:Create(
                            glowStroke,
                            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Transparency = 0.3}
                        ):Play()
                        
                        TweenService:Create(
                            glowRing,
                            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {Size = UDim2.new(1, 24, 1, 24)}
                        ):Play()
                        
                        task.wait(0.15)
                        TweenService:Create(
                            checkmark,
                            TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                            {TextSize = 52, TextTransparency = 0}
                        ):Play()
                        
                        task.wait(0.3)
                        TweenService:Create(
                            successCircle,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true),
                            {Size = UDim2.new(0, 92, 0, 92)}
                        ):Play()
                    end
                    
                    if loadingText then
                        task.wait(0.1)
                        loadingText.Text = message or "Verified!"
                        loadingText.TextColor3 = Color3.fromRGB(34, 197, 94)
                        
                        TweenService:Create(
                            loadingText,
                            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextSize = 18}
                        ):Play()
                    end
                    
                    if hintText then
                        hintText.Text = "Starting script"
                        hintText.TextColor3 = Color3.fromRGB(34, 197, 94)
                    end
                end
                
                task.wait(0.8)
            end
            
            self.updateStatus = function(self, message, color, duration)
                local statusText = self.elements.statusText
                local statusBar = self.elements.statusBar
                
                if statusText then
                    statusText.Text = message
                    statusText.TextColor3 = color or Colors.textSecondary
                    statusText.Visible = true
                    
                    if statusBar then
                        TweenService:Create(statusBar, TweenInfo.new(0.2), {
                            BackgroundColor3 = color or Colors.border,
                            Size = UDim2.new(1, -40, 0, 3)
                        }):Play()
                    end
                    
                    if duration and duration > 0 then
                        task.delay(duration, function()
                            if statusText and statusText.Text == message then
                                statusText.Visible = false
                                if statusBar then
                                    TweenService:Create(statusBar, TweenInfo.new(0.2), {
                                        BackgroundColor3 = Colors.border,
                                        Size = UDim2.new(1, -40, 0, 2)
                                    }):Play()
                                end
                            end
                        end)
                    end
                end
            end
            
            self.setButtonLoading = function(self, button, text, loading)
                if loading then
                    local buttonText = button:FindFirstChild("ButtonText")
                    if buttonText then
                        buttonText.Text = text
                    end
                    button.Interactable = false
                    
                    local spinner = button:FindFirstChild("LoadingSpinner")
                    if not spinner then
                        spinner = Instance.new("Frame")
                        spinner.Name = "LoadingSpinner"
                        spinner.Size = UDim2.new(0, 14, 0, 14)
                        spinner.Position = UDim2.new(0, 12, 0.5, -7)
                        spinner.BackgroundColor3 = Colors.textPrimary
                        spinner.BackgroundTransparency = 0.7
                        spinner.BorderSizePixel = 0
                        spinner.Parent = button
                        
                        local spinnerCorner = Instance.new("UICorner")
                        spinnerCorner.CornerRadius = UDim.new(1, 0)
                        spinnerCorner.Parent = spinner
                        
                        TweenService:Create(spinner, 
                            TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), 
                            {Rotation = 360}
                        ):Play()
                    end
                else
                    local buttonText = button:FindFirstChild("ButtonText")
                    if buttonText then
                        buttonText.Text = text
                    end
                    button.Interactable = true
                    
                    local spinner = button:FindFirstChild("LoadingSpinner")
                    if spinner then spinner:Destroy() end
                end
            end
            
            self.shakeInput = function(self)
                local frame = self.elements.inputFrame
                if not frame then return end
                
                local orig = frame.Position
                
                for i = 1, 3 do
                    TweenService:Create(frame, TweenInfo.new(0.05), {
                        Position = UDim2.new(orig.X.Scale, orig.X.Offset - 8, orig.Y.Scale, orig.Y.Offset)
                    }):Play()
                    task.wait(0.05)
                    TweenService:Create(frame, TweenInfo.new(0.05), {
                        Position = UDim2.new(orig.X.Scale, orig.X.Offset + 8, orig.Y.Scale, orig.Y.Offset)
                    }):Play()
                    task.wait(0.05)
                end
                
                frame.Position = orig
            end
            
            self.animateSuccess = function(self)
                local iconFrame = self.elements.iconFrame
                if iconFrame then
                    TweenService:Create(iconFrame, TweenInfo.new(0.2, Enum.EasingStyle.Back), {
                        Size = UDim2.new(0, 62, 0, 62),
                        Position = UDim2.new(0.5, -31, 0, -5)
                    }):Play()
                    
                    task.wait(0.2)
                    
                    TweenService:Create(iconFrame, TweenInfo.new(0.2), {
                        Size = UDim2.new(0, 52, 0, 52),
                        Position = UDim2.new(0.5, -26, 0, 0)
                    }):Play()
                end
            end
            
            self.close = function(self)
                if not self.gui then return end
                getgenv().UI_CLOSED = true
                local container = self.elements.container
                local backdrop = self.elements.backdrop
                local blur = Lighting:FindFirstChild("WizardUIBlur")
                
                TweenService:Create(container, TweenInfo.new(0.2), {
                    BackgroundTransparency = 1
                }):Play()
                
                TweenService:Create(backdrop, TweenInfo.new(0.2), {
                    BackgroundTransparency = 1
                }):Play()
                
                task.wait(0.2)
                
                if blur then blur:Destroy() end
                self.gui:Destroy()
                self.gui = nil
            end
            
            self.setLoadingState = function(self, isLoading, message)
                if not self.elements then return end
                
                local container = self.elements.container
                local inputFrame = self.elements.inputFrame
                local verifyButton = self.elements.verifyButton
                local getLinkButton = self.elements.getLinkButton
                local iconFrame = self.elements.iconFrame
                local title = self.elements.title
                local subtitle = self.elements.subtitle
                local statusLabel = self.elements.statusLabel
                
                if isLoading then
                    if inputFrame then inputFrame.Visible = false end
                    if verifyButton then verifyButton.Visible = false end
                    if getLinkButton then getLinkButton.Visible = false end
                    if iconFrame then iconFrame.Visible = false end
                    if title then title.Visible = false end
                    if subtitle then subtitle.Visible = false end
                    if statusLabel then statusLabel.Visible = false end
                    
                    local loadingOverlay = container:FindFirstChild("LoadingOverlay")
                    if not loadingOverlay then
                        loadingOverlay = Instance.new("Frame")
                        loadingOverlay.Name = "LoadingOverlay"
                        loadingOverlay.BackgroundTransparency = 1
                        loadingOverlay.Size = UDim2.new(1, 0, 1, 0)
                        loadingOverlay.Position = UDim2.new(0, 0, 0, 0)
                        loadingOverlay.ZIndex = 100
                        loadingOverlay.Parent = container
                        
                        local mainContainer = Instance.new("CanvasGroup")
                        mainContainer.Name = "MainContainer"
                        mainContainer.BackgroundTransparency = 1
                        mainContainer.AnchorPoint = Vector2.new(0.5, 0.5)
                        mainContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
                        mainContainer.Size = UDim2.new(0, 280, 0, 200)
                        mainContainer.Parent = loadingOverlay
                        
                        local spinnerContainer = Instance.new("Frame")
                        spinnerContainer.Name = "SpinnerContainer"
                        spinnerContainer.BackgroundTransparency = 1
                        spinnerContainer.AnchorPoint = Vector2.new(0.5, 0)
                        spinnerContainer.Position = UDim2.new(0.5, 0, 0, 20)
                        spinnerContainer.Size = UDim2.new(0, 80, 0, 80)
                        spinnerContainer.Parent = mainContainer
                        
                        local bgCircle = Instance.new("Frame")
                        bgCircle.Name = "BgCircle"
                        bgCircle.BackgroundTransparency = 1
                        bgCircle.Size = UDim2.new(1, 0, 1, 0)
                        bgCircle.ZIndex = 2
                        bgCircle.Parent = spinnerContainer
                        
                        local bgStroke = Instance.new("UIStroke")
                        bgStroke.Color = Colors.accent
                        bgStroke.Thickness = 4
                        bgStroke.Transparency = 0.85
                        bgStroke.Parent = bgCircle
                        
                        local bgCorner = Instance.new("UICorner")
                        bgCorner.CornerRadius = UDim.new(1, 0)
                        bgCorner.Parent = bgCircle
                        
                        local arcCircle = Instance.new("Frame")
                        arcCircle.Name = "ArcCircle"
                        arcCircle.BackgroundTransparency = 1
                        arcCircle.Size = UDim2.new(1, 0, 1, 0)
                        arcCircle.ZIndex = 3
                        arcCircle.Parent = spinnerContainer
                        
                        local arcStroke = Instance.new("UIStroke")
                        arcStroke.Color = Colors.accent
                        arcStroke.Thickness = 4
                        arcStroke.Transparency = 0
                        arcStroke.Parent = arcCircle
                        
                        local arcCorner = Instance.new("UICorner")
                        arcCorner.CornerRadius = UDim.new(1, 0)
                        arcCorner.Parent = arcCircle
                        
                        local arcGradient = Instance.new("UIGradient")
                        arcGradient.Transparency = NumberSequence.new({
                            NumberSequenceKeypoint.new(0, 0),
                            NumberSequenceKeypoint.new(0.4, 0),
                            NumberSequenceKeypoint.new(0.7, 0.3),
                            NumberSequenceKeypoint.new(0.85, 0.7),
                            NumberSequenceKeypoint.new(1, 1)
                        })
                        arcGradient.Rotation = 0
                        arcGradient.Parent = arcStroke
                        
                        local spinTween = TweenService:Create(
                            spinnerContainer,
                            TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
                            {Rotation = 360}
                        )
                        spinTween:Play()
                        
                        task.spawn(function()
                            while loadingOverlay and loadingOverlay.Parent do
                                arcGradient.Rotation = (arcGradient.Rotation + 8) % 360
                                task.wait(0.03)
                            end
                        end)
                        
                        local loadingText = Instance.new("TextLabel")
                        loadingText.Name = "LoadingText"
                        loadingText.BackgroundTransparency = 1
                        loadingText.AnchorPoint = Vector2.new(0.5, 0)
                        loadingText.Position = UDim2.new(0.5, 0, 0, 130)
                        loadingText.Size = UDim2.new(1, 0, 0, 25)
                        loadingText.Font = Enum.Font.GothamBold
                        loadingText.Text = message or "Loading information"
                        loadingText.TextColor3 = Colors.textPrimary
                        loadingText.TextSize = 16
                        loadingText.Parent = mainContainer
                        
                        local hintText = Instance.new("TextLabel")
                        hintText.Name = "HintText"
                        hintText.BackgroundTransparency = 1
                        hintText.AnchorPoint = Vector2.new(0.5, 0)
                        hintText.Position = UDim2.new(0.5, 0, 0, 160)
                        hintText.Size = UDim2.new(1, 0, 0, 20)
                        hintText.Font = Enum.Font.Gotham
                        hintText.Text = "Please wait a moment"
                        hintText.TextColor3 = Colors.textSecondary
                        hintText.TextSize = 12
                        hintText.TextTransparency = 0.3
                        hintText.Parent = mainContainer
                        
                        local textPulseTween = TweenService:Create(
                            hintText,
                            TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1, true),
                            {TextTransparency = 0.6}
                        )
                        textPulseTween:Play()
                        
                        task.spawn(function()
                            local dots = 0
                            while loadingOverlay and loadingOverlay.Parent do
                                dots = (dots % 3) + 1
                                if loadingText and loadingText.Parent then
                                    loadingText.Text = (message or "Loading information") .. string.rep(".", dots)
                                end
                                task.wait(0.5)
                            end
                        end)
                        
                        mainContainer.GroupTransparency = 1
                        TweenService:Create(
                            mainContainer,
                            TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {GroupTransparency = 0}
                        ):Play()
                    end
                    
                    loadingOverlay.Visible = true
                else
                    if inputFrame then inputFrame.Visible = true end
                    if verifyButton then verifyButton.Visible = true end
                    if getLinkButton then getLinkButton.Visible = true end
                    if iconFrame then iconFrame.Visible = true end
                    if title then title.Visible = true end
                    if subtitle then subtitle.Visible = true end
                    if statusLabel then 
                        statusLabel.Visible = true
                        statusLabel.Text = "Enter your key to continue"
                        statusLabel.TextColor3 = Colors.textSecondary
                    end
                
                    local loadingOverlay = container:FindFirstChild("LoadingOverlay")
                    if loadingOverlay then
                        loadingOverlay:Destroy()
                    end
                end
            end
            
            setupAnimations()
            animateEntrance()
    
            self.createToast = function(message, duration, toastType)
                duration = duration or 3
                toastType = toastType or "info" -- "info", "success", "loading"
                
                local toast = Instance.new("Frame")
                toast.Name = "Toast"
                toast.Size = UDim2.new(0, 0, 0, 50)
                toast.Position = UDim2.new(1, -20, 1, -20)
                toast.AnchorPoint = Vector2.new(1, 1)
                toast.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
                toast.BorderSizePixel = 0
                toast.ZIndex = 10000
                toast.Parent = self.gui
                
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 10)
                corner.Parent = toast
                
                local shadow = Instance.new("ImageLabel")
                shadow.Name = "Shadow"
                shadow.BackgroundTransparency = 1
                shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
                shadow.Size = UDim2.new(1, 30, 1, 30)
                shadow.AnchorPoint = Vector2.new(0.5, 0.5)
                shadow.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
                shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
                shadow.ImageTransparency = 0.7
                shadow.ScaleType = Enum.ScaleType.Slice
                shadow.SliceCenter = Rect.new(10, 10, 10, 10)
                shadow.ZIndex = toast.ZIndex - 1
                shadow.Parent = toast
                
                local icon = Instance.new("TextLabel")
                icon.Name = "Icon"
                icon.Size = UDim2.new(0, 40, 1, 0)
                icon.Position = UDim2.new(0, 0, 0, 0)
                icon.BackgroundTransparency = 1
                icon.Font = Enum.Font.SourceSansBold
                icon.TextSize = 20
                icon.TextColor3 = Color3.fromRGB(255, 255, 255)
                icon.ZIndex = toast.ZIndex + 1
                
                if toastType == "loading" then
                    icon.Text = "⏳"
                elseif toastType == "success" then
                    icon.Text = "✓"
                    icon.TextColor3 = Color3.fromRGB(76, 175, 80)
                else
                    icon.Text = "ℹ️"
                    icon.TextColor3 = Color3.fromRGB(66, 165, 245)
                end
                icon.Parent = toast
                
                local text = Instance.new("TextLabel")
                text.Name = "Text"
                text.Size = UDim2.new(1, -50, 1, 0)
                text.Position = UDim2.new(0, 40, 0, 0)
                text.BackgroundTransparency = 1
                text.Font = Enum.Font.GothamMedium
                text.TextSize = 14
                text.TextColor3 = Color3.fromRGB(230, 230, 230)
                text.Text = message
                text.TextXAlignment = Enum.TextXAlignment.Left
                text.TextYAlignment = Enum.TextYAlignment.Center
                text.TextTruncate = Enum.TextTruncate.AtEnd
                text.ZIndex = toast.ZIndex + 1
                text.Parent = toast
                
                local textService = game:GetService("TextService")
                local textBounds = textService:GetTextSize(
                    message,
                    text.TextSize,
                    text.Font,
                    Vector2.new(300, 50)
                )
                local targetWidth = math.min(math.max(textBounds.X + 60, 200), 350)
                
                local slideTween = TweenService:Create(
                    toast,
                    TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
                    {
                        Size = UDim2.new(0, targetWidth, 0, 50),
                        Position = UDim2.new(1, -20, 1, -20)
                    }
                )
                slideTween:Play()
                
                if toastType == "loading" then
                    task.spawn(function()
                        local rotation = 0
                        while toast and toast.Parent do
                            rotation = (rotation + 10) % 360
                            local spinChars = {"⏳", "⌛"}
                            icon.Text = spinChars[(math.floor(rotation / 180) % 2) + 1]
                            task.wait(0.1)
                        end
                    end)
                end
                
                if toastType ~= "loading" then
                    task.delay(duration, function()
                        if toast and toast.Parent then

                            local fadeOut = TweenService:Create(
                                toast,
                                TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                                {
                                    Position = UDim2.new(1, 20, 1, -20),
                                    BackgroundTransparency = 1
                                }
                            )
                            
                            TweenService:Create(icon, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                            TweenService:Create(text, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                            TweenService:Create(shadow, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
                            
                            fadeOut:Play()
                            fadeOut.Completed:Connect(function()
                                toast:Destroy()
                            end)
                        end
                    end)
                end
                
                return toast
            end
            
            return self.gui
        end
        end 
    end 
    
    local UI = {}
    UI.__index = UI
    
    function UI.new(options)
        local self = setmetatable({}, UI)
        
        self.options = options or {}
        self.title = self.options.title or "discord.gg/wizardhub 24/7 support"
        self.subtitle = self.options.subtitle or "Powered by Wizard Development"
        self.description = self.options.description or "Please complete the key verification to continue"
        
        self.lastRequestTime = 0
        self.requestCooldown = 15
        self.maxAttempts = 5
        self.currentAttempts = 0
        
        self.player = Players.LocalPlayer
        self.gui = nil
        self.hwid = game:GetService("RbxAnalyticsService"):GetClientId()
        
        self._connections = {}
        
        return self
    end
    
    UI.createUI = function(self)
        local UIFactory = loadUIFactory()
        
        if UIFactory then
            local uiBuilder = UIFactory(Colors, Players, TweenService, UserInputService, Lighting)
            if uiBuilder then
                uiBuilder(self)
            else
                error("UI builder initialization failed")
                return
            end
        else
            error("Failed to load UI factory")
            return
        end
        
        if self.elements and self.elements.closeButton then
            table.insert(self._connections, self.elements.closeButton.MouseButton1Click:Connect(function()
                self:close()
            end))
        end
        
        if self.elements and self.elements.getLinkButton then
            table.insert(self._connections, self.elements.getLinkButton.MouseButton1Click:Connect(function()
                self:handleGetLink()
            end))
        end
        
        if self.elements and self.elements.verifyButton then
            table.insert(self._connections, self.elements.verifyButton.MouseButton1Click:Connect(function()
                self:handleVerifyKey()
            end))
        end
        
        if self.elements and self.elements.keyInput then
            table.insert(self._connections, self.elements.keyInput.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    self:handleVerifyKey()
                end
            end))
        end
        
        return self.gui
    end
    
    function UI:close()
        getgenv().UI_CLOSED = true
        for _, conn in ipairs(self._connections or {}) do
            pcall(function() conn:Disconnect() end)
        end
        self._connections = {}
        if self.gui then self.gui:Destroy() end
        return getgenv().SCRIPT_KEY
    end
    
    function UI:handleGetLink()
        local secureGetKeyLink = Wizard.get_key_link()
        if not secureGetKeyLink then
            self:updateStatus("System not initialized", Colors.error, 3)
            return
        end
        local link = secureGetKeyLink
        
        if link then
            if setclipboard then
                setclipboard(link)
                self:updateStatus("Link copied to clipboard!", Colors.success, 3)
            else
                self:updateStatus("Get link: " .. link, Colors.primary, 10)
            end
        else
            self:updateStatus("Failed to get link", Colors.error, 3)
        end
    end
    
    function UI:handleVerifyKey()
        local key = self.elements.keyInput.Text:gsub("%s+", "")
        
        if key == "" then
            self:updateStatus("Please enter a key", Colors.error, 3)
            self:shakeInput()
            return
        end
        
        if self.setButtonLoading then
            self:setButtonLoading(self.elements.verifyButton, "Verifying", true)
        end
        self:updateStatus("Verifying...", Colors.primary, 0)
        
        if self.elements.keyInput.Interactable ~= nil then
            self.elements.keyInput.Interactable = false
        end
        
        local result = Wizard.check_key(key)
        
        if result and result.valid then
            saveVerifiedKey(key)
            self:updateStatus("Key verified!", Colors.success, 0)
            if self.animateSuccess then self:animateSuccess() end
            
            task.wait(1.5)
            getgenv().SCRIPT_KEY = key
            self:close()
            return 
        else
            self:updateStatus("Invalid key", Colors.error, 3)
            if self.shakeInput then self:shakeInput() end
            
            if self.setButtonLoading then
                self:setButtonLoading(self.elements.verifyButton, "Verify Key", false)
            end
            if self.elements.keyInput.Interactable ~= nil then
                self.elements.keyInput.Interactable = true
            end
        
        end
    end

    local ui = UI.new(options)
    ui:createUI()

    if ui.setLoadingState then
        ui:setLoadingState(true, "Checking verification...")
    end

    local savedKey = loadVerifiedKey()
    local keyToCheck = savedKey
    if not keyToCheck then
        keyToCheck = getgenv().SCRIPT_KEY
    end
    
    local result = Wizard.check_key(keyToCheck)
    if result and result.valid then
        if result.message == "KEYLESS" then
            if ui.showSuccess then
                ui:showSuccess("Keyless Mode ✓")
            end
            getgenv().SCRIPT_KEY = "KEYLESS"
            if ui.close then ui:close() end
            return
        end
        
        if result.message == "KEY_VALID" then
            if not savedKey and keyToCheck then
                saveVerifiedKey(keyToCheck)
            end
            
            if ui.showSuccess then
                local successMsg = savedKey and "Saved Key Verified ✓" or "Key Verified ✓"
                ui:showSuccess(successMsg)
            end
            getgenv().SCRIPT_KEY = keyToCheck
            if ui.close then ui:close() end
            return
        end
        
        if savedKey and not result.key_valid then
            clearSavedKey()
        end
        
    end
    
    if ui.setLoadingState then
        ui:setLoadingState(false)
    end

    while not getgenv().UI_CLOSED do
        task.wait(0.1)
    end
    return getgenv().SCRIPT_KEY
end)()

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/6448a11f7f4030529fb16498d4fccbea5625d689df2628fa08ebf62b941c760b?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end