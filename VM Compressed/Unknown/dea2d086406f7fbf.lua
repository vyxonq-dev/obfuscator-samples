local __DARKLUA_BUNDLE_MODULES

__DARKLUA_BUNDLE_MODULES = {
    cache = {},
    load = function(m)
        if not __DARKLUA_BUNDLE_MODULES.cache[m] then
            __DARKLUA_BUNDLE_MODULES.cache[m] = {
                c = __DARKLUA_BUNDLE_MODULES[m](),
            }
        end

        return __DARKLUA_BUNDLE_MODULES.cache[m].c
    end,
}

do
    function __DARKLUA_BUNDLE_MODULES.a()
        local TweenService = game:GetService('TweenService')
        local RunService = game:GetService('RunService')
        local UserInputService = game:GetService('UserInputService')
        local Players = game:GetService('Players')
        local StarterGui = game:GetService('StarterGui')
        local TextChatService = game:GetService('TextChatService')

        while Players.LocalPlayer == nil do
            task.wait()
        end

        local LocalPlayer = Players.LocalPlayer
        local Mouse = LocalPlayer:GetMouse()
        local gui_util = {}

        gui_util.gui_holder = nil
        gui_util.content_env = nil
        gui_util.dropdowns_holders = {}
        gui_util.dropdowns_labels = {}
        gui_util.dropdowns_options = {}
        gui_util.notification = nil
        gui_util.notif_stack = {}
        gui_util.notif_busy = false
        gui_util.zindexes = {
            window_holder = 1,
            app_name_holder = 2,
            app_name_content = 3,
            section = 2,
            dropdown_holder = 2,
            dropdown_label_holder = 5,
            dropdown_label_content = 6,
            dropdown_options_holder = 3,
            dropdown_option = 4,
            element_frame = 2,
            element_content = 3,
        }
        gui_util.ScaleElements = function()
            while gui_util.gui_holder == nil do
                task.wait()
            end

            local gh_size = gui_util.gui_holder.AbsoluteSize

            for _, label in ipairs(gui_util.dropdowns_labels)do
                label.Size = UDim2.new(1, 0, 0, gh_size.Y / 31.7352)
            end
            for _, option in ipairs(gui_util.dropdowns_options)do
                option.Size = UDim2.new(1, 0, 0, gh_size.Y / 73.2727)
            end
            for _, holder in ipairs(gui_util.dropdowns_holders)do
                holder.Size = UDim2.new(1, 0, 0, gh_size.Y / 32.3538)
            end
            for _, notif_data in pairs(gui_util.notif_stack)do
                notif_data.Body.TextSize = (gh_size.X + gh_size.Y) / 272.63
                gui_util.notification.Body.TextSize = (gh_size.X + gh_size.Y) / 272.63
            end
        end
        gui_util.GetUbuntuText = function(text)
            local UbuntuText = Instance.new('TextLabel')

            UbuntuText.BackgroundTransparency = 1
            UbuntuText.TextColor3 = Color3.fromRGB(255, 255, 255)
            UbuntuText.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            UbuntuText.Text = text
            UbuntuText.TextScaled = true

            return UbuntuText
        end
        gui_util.InitGUIHolder = function()
            local hidden_ui = game:GetService('CoreGui')
            local GUIHolder = Instance.new('ScreenGui')

            GUIHolder.IgnoreGuiInset = true

            local ds_invite = gui_util.GetUbuntuText('discord.gg/AsWAVd5dqf')

            ds_invite.FontFace = Font.new('rbxasset://fonts/families/Montserrat.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            ds_invite.AnchorPoint = Vector2.new(1, 0)
            ds_invite.Position = UDim2.fromScale(0.9965000152587891, 0.005)
            ds_invite.Size = UDim2.fromScale(0.074, 0.014)
            ds_invite.RichText = true
            ds_invite.Parent = GUIHolder
            GUIHolder.Parent = hidden_ui

            GUIHolder:GetPropertyChangedSignal('AbsoluteSize'):Connect(gui_util.ScaleElements)

            local system_message = 
[[Press ; to open the command prompt.
Press Z to open the info panel about the players.]]

            StarterGui:SetCore('ChatMakeSystemMessage', {
                Text = system_message,
                Color = Color3.fromRGB(255, 255, 255),
                Font = Enum.Font.SourceSansBold,
            })
            TextChatService:WaitForChild('TextChannels', math.huge):WaitForChild('RBXGeneral', math.huge):DisplaySystemMessage(system_message)

            gui_util.gui_holder = GUIHolder
        end
        gui_util.CreateWindow = function(app_name)
            local WindowHolder = Instance.new('Frame')

            WindowHolder.BorderSizePixel = 0
            WindowHolder.Size = UDim2.fromScale(0.182390004, 0.36800000071525574)
            WindowHolder.BackgroundColor3 = Color3.fromRGB(30, 31, 37)
            WindowHolder.Position = UDim2.fromScale(0.2, 0.2)
            WindowHolder.Visible = false
            WindowHolder.Parent = gui_util.gui_holder

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.02, 0)
            UICorner.Parent = WindowHolder

            local AppNameHolder = Instance.new('Frame')

            AppNameHolder.BorderSizePixel = 0
            AppNameHolder.Size = UDim2.fromScale(1, 0.064290002)
            AppNameHolder.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
            AppNameHolder.Name = 'app_name_holder'
            AppNameHolder.Parent = WindowHolder

            local AppName = Instance.new('TextLabel')

            AppName.Size = UDim2.fromScale(1, 1)
            AppName.BackgroundTransparency = 1
            AppName.Text = app_name
            AppName.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            AppName.TextScaled = true
            AppName.TextColor3 = Color3.fromRGB(255, 255, 255)
            AppName.Name = 'app_name'
            AppName.Parent = AppNameHolder

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.28025999665260315, 0)
            UIPadding.PaddingTop = UDim.new(0.28025999665260315, 0)
            UIPadding.Parent = AppName

            local UICorner2 = UICorner:Clone()

            UICorner2.CornerRadius = UDim.new(0.2, 0)
            UICorner2.Parent = AppNameHolder

            local SquareCornerRight = Instance.new('Frame')

            SquareCornerRight.BorderSizePixel = 0
            SquareCornerRight.Size = UDim2.fromScale(0.0250000004, 0.400000006)
            SquareCornerRight.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
            SquareCornerRight.Position = UDim2.fromScale(0, 0.6)
            SquareCornerRight.BorderSizePixel = 0
            SquareCornerRight.Parent = AppNameHolder

            local SquareCornerLeft = SquareCornerRight:Clone()

            SquareCornerLeft.Position = UDim2.fromScale(0.975, 0.6)
            SquareCornerLeft.Parent = AppNameHolder

            local CloseButton = Instance.new('ImageButton')

            CloseButton.Size = UDim2.fromScale(0.029, 0.85)
            CloseButton.Position = UDim2.fromScale(0.944999993, 0)
            CloseButton.Image = 'http://www.roblox.com/asset/?id=18469798055'
            CloseButton.BackgroundTransparency = 1
            CloseButton.Name = 'close_button'
            CloseButton.Parent = AppName

            CloseButton.MouseButton1Click:Connect(function()
                WindowHolder.Visible = false
            end)

            return WindowHolder
        end
        gui_util.MakeWindowDraggable = function(window)
            local holding = false
            local InitialX, InitialY, UIInitialPos

            window.InputBegan:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    return
                end

                holding = true
                InitialX, InitialY, UIInitialPos = Mouse.X, Mouse.Y, window.Position

                while holding and RunService.RenderStepped:Wait() do
                    window.Position = UIInitialPos - UDim2.fromOffset(InitialX - Mouse.X, InitialY - Mouse.Y)
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                    return
                end

                holding = false
            end)
        end
        gui_util.AddContentHolder = function(window)
            local ContentHolder = Instance.new('ScrollingFrame')

            ContentHolder.BorderSizePixel = 0
            ContentHolder.Size = UDim2.fromScale(0.0233299993, 0.0862499997)
            ContentHolder.Position = UDim2.fromScale(0.023, 0.086)
            ContentHolder.Size = UDim2.fromScale(0.949999988079071, 0.8921800255775452)
            ContentHolder.BackgroundTransparency = 1
            ContentHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            ContentHolder.CanvasSize = UDim2.fromScale(0, 1)
            ContentHolder.ScrollBarThickness = 2
            ContentHolder.ScrollingDirection = Enum.ScrollingDirection.Y
            ContentHolder.BorderSizePixel = 0
            ContentHolder.Parent = window

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.Padding = UDim.new(0.015, 0)
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = ContentHolder

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingRight = UDim.new(0.021, 0)
            UIPadding.Parent = ContentHolder

            UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function(
            )
                if UIListLayout.AbsoluteContentSize.Y > ContentHolder.AbsoluteSize.Y then
                    UIListLayout.VerticalFlex = Enum.UIFlexAlignment.SpaceBetween
                end
            end)

            return ContentHolder
        end
        gui_util.SetContentEnv = function(content_holder)
            gui_util.content_env = content_holder
        end
        gui_util.AddElementFrame = function()
            local ElementFrame = Instance.new('Frame')

            ElementFrame.BorderSizePixel = 0
            ElementFrame.Size = UDim2.fromScale(1, 0.091)
            ElementFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 25)
            ElementFrame.Parent = gui_util.content_env

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.15, 0)
            UICorner.Parent = ElementFrame

            return ElementFrame
        end
        gui_util.AddClickableElementFrame = function(onclick)
            local ElementFrame = Instance.new('ImageButton')

            ElementFrame.Size = UDim2.fromScale(1, 0.091)
            ElementFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 25)
            ElementFrame.AutoButtonColor = false
            ElementFrame.Parent = gui_util.content_env

            ElementFrame.MouseButton1Click:Connect(function()
                onclick()
            end)
            ElementFrame.MouseButton1Click:Connect(function()
                onclick()
            end)
            ElementFrame.MouseEnter:Connect(function()
                TweenService:Create(ElementFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(38, 38, 43),
                }):Play()
            end)
            ElementFrame.MouseLeave:Connect(function()
                TweenService:Create(ElementFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(22, 22, 25),
                }):Play()
            end)

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.15, 0)
            UICorner.Parent = ElementFrame

            return ElementFrame
        end
        gui_util.AddSection = function(section_name)
            local Label = Instance.new('TextLabel')

            Label.Size = UDim2.fromScale(1, 0.05)
            Label.Position = UDim2.fromScale(0.038, 0.116)
            Label.BackgroundTransparency = 1
            Label.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Label.TextScaled = true
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.Text = section_name
            Label.Parent = gui_util.content_env

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.3, 0)
            UIPadding.Parent = Label

            return Label
        end
        gui_util.AddHelpSection = function(section_name)
            local Label = Instance.new('TextLabel')

            Label.Size = UDim2.fromScale(1, 0.058)
            Label.BackgroundColor3 = Color3.fromRGB(47, 49, 58)
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Label.Text = section_name
            Label.TextScaled = true
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.BorderSizePixel = 0
            Label.Parent = gui_util.content_env

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.15626999735832214, 0)
            UIPadding.PaddingTop = UDim.new(0.15626999735832214, 0)
            UIPadding.PaddingLeft = UDim.new(0.028669999912381172, 0)
            UIPadding.Parent = Label

            return Label
        end
        gui_util.AddHelpButton = function(button_name, onclick)
            local was_clicked = false
            local hovered = false
            local Button = Instance.new('TextButton')

            Button.Size = UDim2.fromScale(1, 0.054999999701976776)
            Button.BackgroundColor3 = Color3.fromRGB(41, 47, 67)
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextScaled = true
            Button.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Button.Text = button_name
            Button.AutoButtonColor = false
            Button.BorderSizePixel = 0
            Button.Parent = gui_util.content_env

            Button.MouseButton1Click:Connect(function()
                onclick()

                was_clicked = true

                local Tween = TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(57, 65, 93),
                })

                Tween:Play()
                Tween.Completed:Wait()

                was_clicked = false

                TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = hovered == true and Color3.fromRGB(33, 38, 54) or Color3.fromRGB(41, 47, 67),
                }):Play()
            end)
            Button.MouseEnter:Connect(function()
                hovered = true

                if was_clicked then
                    return
                end

                TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(33, 38, 54),
                }):Play()
            end)
            Button.MouseLeave:Connect(function()
                hovered = false

                if was_clicked then
                    return
                end

                TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(41, 47, 67),
                }):Play()
            end)

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.15000000596046448, 0)
            UIPadding.PaddingTop = UDim.new(0.15000000596046448, 0)
            UIPadding.Parent = Button
        end
        gui_util.AddTextBlock = function(text, y_scale)
            local TextBlock = Instance.new('TextLabel')

            TextBlock.Size = UDim2.fromScale(1, y_scale)
            TextBlock.BackgroundTransparency = 1
            TextBlock.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBlock.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            TextBlock.Text = text
            TextBlock.TextScaled = true
            TextBlock.TextXAlignment = Enum.TextXAlignment.Left
            TextBlock.LineHeight = 1.3
            TextBlock.Parent = gui_util.content_env

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingLeft = UDim.new(0.035840000957250595, 0)
            UIPadding.Parent = TextBlock
        end
        gui_util.AddElementLabel = function(element, label, x_scale, y_scale)
            local Label = Instance.new('TextLabel')

            Label.Size = UDim2.fromScale(0.529, 0.375)
            Label.Position = UDim2.fromScale(x_scale or 0.04, y_scale or 0.3)
            Label.BackgroundTransparency = 1
            Label.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Label.TextScaled = true
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.Text = label
            Label.Parent = element

            return Label
        end
        gui_util.AddElementInput = function(element, plc_text, onfocuslost)
            local Input = Instance.new('TextBox')

            Input.Size = UDim2.fromScale(0.23656000196933746, 0.5311899781227112)
            Input.Position = UDim2.fromScale(0.7239999771118164, 0.23240000009536743)
            Input.Text = ''
            Input.PlaceholderText = plc_text or ''
            Input.BackgroundColor3 = Color3.fromRGB(34, 35, 45)
            Input.TextColor3 = Color3.fromRGB(255, 255, 255)
            Input.ClearTextOnFocus = true
            Input.TextScaled = true
            Input.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Input.Parent = element

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.25, 0)
            UICorner.Parent = Input

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.16561999917030334, 0)
            UIPadding.PaddingTop = UDim.new(0.16561999917030334, 0)
            UIPadding.Parent = Input

            local focus_lost = function()
                onfocuslost(Input.Text)
            end

            Input.FocusLost:Connect(focus_lost)

            return Input, focus_lost
        end
        gui_util.AddElementButton = function(element, button_text, onclick)
            local hovered = false
            local was_clicked = false
            local Button = Instance.new('TextButton')

            Button.Size = UDim2.fromScale(0.23656000196933746, 0.5311899781227112)
            Button.Position = UDim2.fromScale(0.7239999771118164, 0.23240000009536743)
            Button.Text = button_text
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.BackgroundColor3 = Color3.fromRGB(62, 85, 137)
            Button.TextScaled = true
            Button.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Button.AutoButtonColor = false
            Button.Parent = element

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.25, 0)
            UICorner.Parent = Button

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.16561999917030334, 0)
            UIPadding.PaddingTop = UDim.new(0.16561999917030334, 0)
            UIPadding.Parent = Button

            Button.MouseButton1Click:Connect(function()
                onclick()

                was_clicked = true

                local Tween = TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(42, 58, 92),
                })

                Tween:Play()
                Tween.Completed:Wait()

                was_clicked = false

                TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = hovered == true and Color3.fromRGB(50, 69, 110) or Color3.fromRGB(62, 85, 137),
                }):Play()
            end)
            Button.MouseEnter:Connect(function()
                hovered = true

                if was_clicked then
                    return
                end

                TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(50, 69, 110),
                }):Play()
            end)
            Button.MouseLeave:Connect(function()
                hovered = false

                if was_clicked then
                    return
                end

                TweenService:Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(62, 85, 137),
                }):Play()
            end)

            return Button
        end
        gui_util.AddElementKeyLabel = function(element, key)
            local KeyLabel = Instance.new('TextLabel')

            KeyLabel.Size = UDim2.fromScale(0.07168000191450119, 0.6639900207519531)
            KeyLabel.Position = UDim2.fromScale(0.02800000086426735, 0.16699999570846558)
            KeyLabel.TextScaled = true
            KeyLabel.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            KeyLabel.BackgroundColor3 = Color3.fromRGB(47, 49, 58)
            KeyLabel.Text = key
            KeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeyLabel.Parent = element

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.2, 0)
            UICorner.Parent = KeyLabel

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.13249999284744263, 0)
            UIPadding.PaddingTop = UDim.new(0.13249999284744263, 0)
            UIPadding.Parent = KeyLabel
        end
        gui_util.CreateDropdown = function(dropdown_name)
            local opened = false
            local dropdown = {}
            local frame_holder = Instance.new('Frame')

            frame_holder.BorderSizePixel = 0
            frame_holder.Size = UDim2.fromScale(1, 0.089)
            frame_holder.BackgroundColor3 = Color3.fromRGB(32, 33, 42)
            frame_holder.Parent = gui_util.content_env

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.05, 0)
            UICorner.Parent = frame_holder

            local options_holder = Instance.new('ScrollingFrame')

            options_holder.BorderSizePixel = 0
            options_holder.Size = UDim2.fromScale(0.962, 0.67)
            options_holder.Position = UDim2.fromScale(0.028, 0.268)
            options_holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            options_holder.CanvasSize = UDim2.fromScale(0, 1)
            options_holder.ScrollBarThickness = 3
            options_holder.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
            options_holder.ScrollingDirection = Enum.ScrollingDirection.Y
            options_holder.ScrollingEnabled = false
            options_holder.BackgroundTransparency = 1
            options_holder.BorderSizePixel = 0
            options_holder.Parent = frame_holder

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingRight = UDim.new(0.025, 0)
            UIPadding.Parent = options_holder

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.Padding = UDim.new(0.085, 0)
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            UIListLayout.Parent = options_holder

            local dropdown_holder = gui_util.AddElementFrame()

            gui_util.AddElementLabel(dropdown_holder, dropdown_name)

            dropdown_holder.Size = UDim2.new(1, 0, 0, gui_util.gui_holder.AbsoluteSize.Y / 32.3538)
            dropdown_holder.Parent = frame_holder

            table.insert(gui_util.dropdowns_holders, dropdown_holder)

            local choice = gui_util.AddElementLabel(dropdown_holder, '. . .')

            choice.Size = UDim2.fromScale(0.48, 0.375)
            choice.Position = UDim2.fromScale(0.4, 0.3)
            choice.TextColor3 = Color3.fromRGB(100, 100, 100)
            choice.TextXAlignment = Enum.TextXAlignment.Right
            choice.Name = 'Choice'

            local Arrow = Instance.new('ImageButton')

            Arrow.Size = UDim2.fromScale(0.045, 0.4705899953842163)
            Arrow.Position = UDim2.fromScale(0.9063000082969666, 0.2639400064945221)
            Arrow.BackgroundTransparency = 1
            Arrow.Image = 'http://www.roblox.com/asset/?id=18476657075'
            Arrow.Parent = dropdown_holder

            Arrow.MouseButton1Click:Connect(function()
                opened = not opened
                gui_util.dropdowns_holders[options_holder] = opened
                options_holder.ScrollingEnabled = opened

                TweenService:Create(Arrow, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Rotation = opened == true and 180 or 0,
                }):Play()
                TweenService:Create(frame_holder, TweenInfo.new(0.2, opened == true and Enum.EasingStyle.Back or Enum.EasingStyle.Sine, opened == true and Enum.EasingDirection.Out or Enum.EasingDirection.InOut), {
                    Size = opened == true and UDim2.fromScale(1, 0.41) or UDim2.fromScale(1, 0.089),
                }):Play()
                TweenService:Create(UIListLayout, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    Padding = opened == true and UDim.new(0.05, 0) or UDim.new(0.085, 0),
                }):Play()
            end)

            dropdown.ClearChoice = function(_)
                choice.Text = '. . .'
            end
            dropdown.SetChoice = function(choice_text)
                choice.Text = choice_text
            end
            dropdown.ApplyVerticalFlex = function(_)
                options_holder.UIListLayout.VerticalFlex = Enum.UIFlexAlignment.SpaceBetween
            end
            dropdown.options_holder = options_holder

            return dropdown
        end
        gui_util.AddDropdownOption = function(dropdown, option_name, onclick)
            local hovered = false
            local was_clicked = false
            local Option = Instance.new('TextButton')

            Option.Size = UDim2.new(1, 0, 0, gui_util.gui_holder.AbsoluteSize.Y / 73.2727)
            Option.BackgroundColor3 = Color3.fromRGB(49, 51, 65)
            Option.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Option.TextColor3 = Color3.fromRGB(255, 255, 255)
            Option.Text = option_name
            Option.AutoButtonColor = false
            Option.BorderSizePixel = 0
            Option.TextScaled = true
            Option.Parent = dropdown.options_holder

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.125, 0)
            UIPadding.PaddingTop = UDim.new(0.125, 0)
            UIPadding.Parent = Option

            Option.MouseButton1Click:Connect(function()
                if not gui_util.dropdowns_holders[dropdown.options_holder] then
                    return
                end

                onclick()

                dropdown.options_holder.Parent.Frame.Choice.Text = option_name
                was_clicked = true

                local Tween = TweenService:Create(Option, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(75, 79, 100),
                })

                Tween:Play()
                Tween.Completed:Wait()

                was_clicked = false

                TweenService:Create(Option, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = hovered == true and Color3.fromRGB(33, 35, 44) or Color3.fromRGB(49, 51, 65),
                }):Play()
            end)
            Option.MouseEnter:Connect(function()
                if not gui_util.dropdowns_holders[dropdown.options_holder] then
                    return
                end

                hovered = true

                if was_clicked then
                    return
                end

                TweenService:Create(Option, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(33, 35, 44),
                }):Play()
            end)
            Option.MouseLeave:Connect(function()
                hovered = false

                if was_clicked then
                    return
                end

                TweenService:Create(Option, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(49, 51, 65),
                }):Play()
            end)
            table.insert(gui_util.dropdowns_options, Option)

            if dropdown.options_holder.UIListLayout.AbsoluteContentSize.Y > dropdown.options_holder.AbsoluteSize.Y then
                dropdown.options_holder.UIListLayout.VerticalFlex = Enum.UIFlexAlignment.SpaceBetween
            end

            return Option
        end
        gui_util.AddElementToggle = function(element, ontoggle)
            local enabled = false
            local Toggle = Instance.new('ImageButton')

            Toggle.Size = UDim2.fromScale(0.06758999824523926, 0.6451799869537354)
            Toggle.Position = UDim2.fromScale(0.8909400105476379, 0.1759600043296814)
            Toggle.BackgroundColor3 = Color3.fromRGB(34, 35, 45)
            Toggle.AutoButtonColor = false
            Toggle.Parent = element

            local press = function()
                enabled = not enabled

                TweenService:Create(Toggle, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = enabled == true and Color3.fromRGB(62, 85, 137) or Color3.fromRGB(34, 35, 45),
                }):Play()
                ontoggle(enabled)
            end

            Toggle.MouseButton1Click:Connect(press)

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.2, 0)
            UICorner.Parent = Toggle

            return press
        end
        gui_util.CreateToggle = function(toggle_name, ontoggle)
            local toggle = {}
            local toggle_holder = gui_util.AddElementFrame()

            gui_util.AddElementLabel(toggle_holder, toggle_name)

            local press_func = gui_util.AddElementToggle(toggle_holder, ontoggle)

            toggle.Call = press_func

            return toggle
        end
        gui_util.CreateInput = function(input_name, plc_text, onfocuslost)
            local input = {}
            local input_holder = gui_util.AddElementFrame()

            gui_util.AddElementLabel(input_holder, input_name)

            local textbox, focus_lost_func = gui_util.AddElementInput(input_holder, plc_text, onfocuslost)

            input.Call = focus_lost_func
            input.ChangePlcText = function(_, text)
                textbox.PlaceholderText = text
            end
            input.ChangeText = function(_, text)
                textbox.Text = text
            end

            return input
        end

        gui_util.InitGUIHolder()

        local notification_holder = Instance.new('Frame')

        notification_holder.BorderSizePixel = 0
        notification_holder.Size = UDim2.fromScale(0.215, 0.0885)
        notification_holder.BackgroundColor3 = Color3.fromRGB(34, 35, 41)

        local UICorner = Instance.new('UICorner')

        UICorner.CornerRadius = UDim.new(0.075, 0)
        UICorner.Parent = notification_holder

        local TimeBar = Instance.new('Frame')

        TimeBar.BorderSizePixel = 0
        TimeBar.Size = UDim2.fromScale(0.95, 0.02)
        TimeBar.Position = UDim2.fromScale(0.025, 0.91)
        TimeBar.Name = 'TimeBar'
        TimeBar.Parent = notification_holder

        local Label = gui_util.GetUbuntuText('')

        Label.TextScaled = true
        Label.Size = UDim2.fromScale(1, 0.131)
        Label.Position = UDim2.fromScale(0, 0.082)
        Label.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Name = 'Label'
        Label.Parent = notification_holder

        local UIPadding = Instance.new('UIPadding')

        UIPadding.PaddingLeft = UDim.new(0.025, 0)
        UIPadding.Parent = Label

        local size = gui_util.gui_holder.AbsoluteSize
        local Body = gui_util.GetUbuntuText('')

        Body.TextWrapped = true
        Body.TextXAlignment = Enum.TextXAlignment.Left
        Body.TextYAlignment = Enum.TextYAlignment.Top
        Body.Size = UDim2.fromScale(1, 0.787)
        Body.Position = UDim2.fromScale(0, 0.213)
        Body.TextScaled = false
        Body.TextSize = (size.X + size.Y) / 272.63
        Body.Name = 'Body'
        Body.Parent = notification_holder

        local UIPadding2 = Instance.new('UIPadding')

        UIPadding2.PaddingLeft = UDim.new(0.025, 0)
        UIPadding2.PaddingRight = UDim.new(0.025, 0)
        UIPadding2.PaddingTop = UDim.new(0.05, 0)
        UIPadding2.Parent = Body
        gui_util.notification = notification_holder
        gui_util.SendNotification = function(label_text, body_text, timeout)
            while gui_util.notif_busy == true do
                task.wait()
            end

            gui_util.notif_busy = true

            local Notification = gui_util.notification:Clone()

            Notification.Position = UDim2.fromScale(1, 0.21)
            Notification.Parent = gui_util.gui_holder

            local Label = Notification.Label

            Label.Text = label_text

            local Body = Notification.Body

            Body.Text = body_text

            local last_frame_tween = nil

            for notif, notif_data in pairs(gui_util.notif_stack)do
                notif_data.needed_pos = notif_data.needed_pos - 0.1
                notif_data.needed_bgt = notif_data.needed_bgt + 0.1
                notif_data.needed_tt = notif_data.needed_tt + 0.25
                last_frame_tween = TweenService:Create(notif, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
                    Position = UDim2.fromScale(0.781, notif_data.needed_pos),
                })

                last_frame_tween:Play()
                TweenService:Create(notif, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundTransparency = notif_data.needed_bgt,
                }):Play()
                TweenService:Create(notif_data.label, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextTransparency = notif_data.needed_tt,
                }):Play()
                TweenService:Create(notif_data.body, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextTransparency = notif_data.needed_tt,
                }):Play()
            end

            if last_frame_tween ~= nil then
                last_frame_tween.Completed:Wait()
            end

            gui_util.notif_stack[Notification] = {
                label = Label,
                body = Body,
                needed_pos = 0.21,
                needed_bgt = 0,
                needed_tt = 0,
            }

            local init_tween = TweenService:Create(Notification, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Position = UDim2.fromScale(0.781, 0.21),
            })

            init_tween:Play()
            init_tween.Completed:Wait()
            TweenService:Create(Notification.TimeBar, TweenInfo.new(timeout, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                Size = UDim2.fromScale(0, 0.02),
            }):Play()

            gui_util.notif_busy = false

            task.wait(timeout)

            local destroying_tween = TweenService:Create(Notification, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Position = UDim2.fromScale(0.781, -0.1),
            })

            destroying_tween:Play()
            destroying_tween.Completed:Wait()

            gui_util.notif_stack[Notification] = nil

            Notification:Destroy()
        end
        gui_util.CreateHotkeyInput = function(key, onfocuslost)
            local input = {}
            local input_holder = gui_util.AddElementFrame()

            gui_util.AddElementLabel(input_holder, 'Key', 0.135)
            gui_util.AddElementKeyLabel(input_holder, key)

            local textbox, focus_lost_func = gui_util.AddElementInput(input_holder, 'command', onfocuslost)

            input.Call = focus_lost_func
            input.ChangeText = function(_, text)
                textbox.Text = text
            end

            return input
        end
        gui_util.CreateButton = function(button_label, button_text, onclick)
            local button = {}
            local button_holder = gui_util.AddElementFrame()

            gui_util.AddElementLabel(button_holder, button_label)
            gui_util.AddElementButton(button_holder, button_text, onclick)

            button.Call = onclick

            return button
        end
        gui_util.CreateClickableInput = function(
            input_name,
            plc_text,
            onfocuslost,
            onclick
        )
            local input = {}
            local input_holder = gui_util.AddClickableElementFrame(onclick)

            gui_util.AddElementLabel(input_holder, input_name)

            local textbox, focus_lost_func = gui_util.AddElementInput(input_holder, plc_text, onfocuslost)

            textbox.Focused:Connect(function()
                onfocuslost(textbox.Text)
            end)

            input.Call = focus_lost_func
            input.holder = input_holder
            input.textbox = textbox
            input.ChangePlcText = function(_, text)
                textbox.PlaceholderText = text
            end
            input.ChangeText = function(_, text)
                textbox.Text = text
            end

            return input
        end

        return gui_util
    end
    function __DARKLUA_BUNDLE_MODULES.b()
        local places = {}

        places.lobby = 740581508
        places.missions = {
            3200010305,
            2797881676,
            2625195454,
            3590667014,
            2951213182,
            4518266946,
            4661507759,
            4768829954,
            4134003540,
            3925577908,
            4388762338,
            5071816792,
            5188855685,
            5862433299,
            2215221144,
            7799530284,
        }
        places.place_group = 'unknown'

        if game.PlaceId == places.lobby then
            places.place_group = 'lobby'
        elseif table.find(places.missions, game.PlaceId) then
            places.place_group = 'mission'
        end

        return places
    end
    function __DARKLUA_BUNDLE_MODULES.c()
        local cache = {}

        cache.flags = {}
        cache.conns = {}
        cache.hide_spot = nil
        cache.flash_effects = {}
        cache.doors = nil
        cache.shoot_cooldown = false
        cache.tools_initted = false
        cache.SendResponse = nil
        cache.ValidateCommand = nil
        cache.help_window = nil
        cache.keybinds_window = nil
        cache.startup_window = nil
        cache.interact_objects = {}
        cache.players_data = nil
        cache.killaura_mode = nil
        cache.GetRemote = nil
        cache.GetWeaponKey = nil
        cache.weaponkey_cmds = {
            spkill = false,
            teamheal = false,
        }
        cache.npcs_in_tower = {}
        cache.npcs_in_orbit = {}
        cache.npcs_data = {}
        cache.complex_cmds = {
            killboss = nil,
            autofarm = nil,
            lockinteract = nil,
            unlockinteract = nil,
        }
        cache.locked_interacts = {}
        cache.disarm = {}
        cache.commands_holder = nil

        return cache
    end
    function __DARKLUA_BUNDLE_MODULES.d()
        local HttpService = game:GetService('HttpService')
        local Players = game:GetService('Players')
        local RunService = game:GetService('RunService')
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local VirtualInputManager = game:GetService('VirtualInputManager')
        local GuiService = game:GetService('GuiService')
        local Stats = game:GetService('Stats')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local places = __DARKLUA_BUNDLE_MODULES.load('b')
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local GameState = nil
        local Difficulty = nil
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer.PlayerGui
        local tools = {}

        tools.emulate_input = {
            StartHold = function(Key)
                VirtualInputManager:SendKeyEvent(true, Key, false, game.Workspace)
            end,
            StopHold = function(Key)
                VirtualInputManager:SendKeyEvent(false, Key, false, game.Workspace)
            end,
            Hold = function(Key, HoldTime)
                VirtualInputManager:SendKeyEvent(true, Key, false, game.Workspace)
                task.wait(HoldTime)
                VirtualInputManager:SendKeyEvent(false, Key, false, game.Workspace)
            end,
            Press = function(Key)
                VirtualInputManager:SendKeyEvent(true, Key, false, game.Workspace)
                task.wait(0.005)
                VirtualInputManager:SendKeyEvent(false, Key, false, game.Workspace)
            end,
        }

        if places.place_group == 'mission' then
            GameState = ReplicatedStorage:WaitForChild('GameState', math.huge)
            Difficulty = GameState:WaitForChild('Difficulty', math.huge).Value
            tools.FireBullet = nil
            tools.PlayerHit = nil
            tools.register_hit = nil
            tools.WeaponKey = nil
            tools.FirstTimeNoKey = true
            tools.ClearWeaponKey = nil

            task.spawn(function()
                local Weapons = PlayerGui:WaitForChild('Weapons', math.huge)
                local BulletLocal = getsenv(Weapons:WaitForChild('BulletLocal', math.huge))

                while BulletLocal.l1l == nil do
                    task.wait()
                end

                tools.register_hit = BulletLocal.l1l

                while BulletLocal.PlayerHitRemote == nil do
                    task.wait()
                end

                tools.PlayerHit = BulletLocal.PlayerHitRemote

                local WeaponKey = require(Weapons:WaitForChild('WeaponKey', math.huge))

                tools.WeaponKey = WeaponKey
                tools.ClearWeaponKey = WeaponKey.ClearWeaponKey

                local cloned = clonefunction(WeaponKey.ClearWeaponKey)

                WeaponKey.ClearWeaponKey = function()
                    if not cache.flags.teamheal and not cache.flags.spkill and (not cache.flags.killaura or (cache.flags.killaura == true and cache.killaura_mode ~= 2)) then
                        cloned()
                    end
                end

                task.spawn(function()
                    while task.wait(0.1) do
                        if not cache.weaponkey_cmds.teamheal and not cache.weaponkey_cmds.spkill and (not cache.flags.killaura or (cache.flags.killaura == true and cache.killaura_mode ~= 2)) then
                            continue
                        end
                        if WeaponKey.Key == nil then
                            while WeaponKey.Key == nil and task.wait(0.1) do
                                WeaponKey.Key = cache.GetRemote('GenerateWeaponKey'):InvokeServer()
                            end
                        end
                    end
                end)
            end)
        end

        tools.StopTask = function(task_to_cancel)
            if task_to_cancel ~= nil then
                local status = coroutine.status(task_to_cancel)

                if status == 'dead' then
                    return
                end
                if status ~= 'suspended' then
                    coroutine.yield(task_to_cancel)
                end

                coroutine.close(task_to_cancel)

                task_to_cancel = nil
            end
        end
        tools.ClearTableTask = function(t, task_name)
            if t[task_name] ~= nil then
                local status = coroutine.status(t[task_name])

                if status == 'dead' then
                    return
                end
                if status ~= 'suspended' then
                    coroutine.yield(t[task_name])
                end

                coroutine.close(t[task_name])

                t[task_name] = nil
            end
        end
        tools.ClearTableConn = function(t, conn_name)
            if t[conn_name] ~= nil then
                t[conn_name]:Disconnect()

                t[conn_name] = nil
            end
        end
        tools.CreatePendingTask = function(func)
            local pending_task = coroutine.create(func)

            coroutine.resume(pending_task)

            return pending_task
        end
        tools.WaitWithCancel = function(
            parent,
            child_name,
            timeout,
            current_task
        )
            local child = parent:WaitForChild(child_name, timeout)

            if child == nil then
                tools.StopTask(current_task)

                return nil
            else
                return child
            end
        end
        tools.AsyncWait = function(parent, child_name, timeout, func, ...)
            local args = {...}

            if parent:FindFirstChild(child_name) then
                func(unpack(args))
            else
                task.spawn(function()
                    local child = parent:WaitForChild(child_name, timeout)

                    if child ~= nil then
                        func(unpack(args))
                    end
                end)
            end
        end
        tools.ComparePositions = function(pos1, pos2, inaccuracy)
            return (pos1.X > pos2.X - inaccuracy and pos1.X < pos2.X + inaccuracy) and (pos1.Y > pos2.Y - inaccuracy and pos1.Y < pos2.Y + inaccuracy) and (pos1.Z > pos2.Z - inaccuracy and pos1.Z < pos2.Z + inaccuracy)
        end
        tools.Proxy = function(t, func1, func2)
            local meta = {}

            meta.__index = function(_, i)
                if func1 ~= nil then
                    func1(t, i)
                end

                return t[i]
            end
            meta.__newindex = function(_, i, v)
                if func2 ~= nil then
                    func2(t, i, v)
                end

                t[i] = v
            end

            local proxy = setmetatable({}, meta)

            return proxy
        end
        tools.jsonify = function(t)
            return HttpService:JSONEncode(t)
        end
        tools.unjsonify = function(json)
            return HttpService:JSONDecode(json)
        end
        tools.GetDictLen = function(dict)
            local len = 0

            for _, _ in pairs(dict)do
                len = len + 1
            end

            return len
        end
        tools.AddAlignP = function(attachment, parent)
            local AlignPosition = Instance.new('AlignPosition')

            AlignPosition.Enabled = false
            AlignPosition.Attachment0 = attachment
            AlignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
            AlignPosition.ForceLimitMode = Enum.ForceLimitMode.PerAxis
            AlignPosition.MaxAxesForce = Vector3.new(2500000, 2500000, 2500000)
            AlignPosition.Responsiveness = 200
            AlignPosition.Parent = parent

            return AlignPosition
        end
        tools.AddAlignO = function(attachment, parent)
            local AlignOrientation = Instance.new('AlignOrientation')

            AlignOrientation.Enabled = false
            AlignOrientation.Attachment0 = attachment
            AlignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
            AlignOrientation.MaxTorque = 2500000
            AlignOrientation.Responsiveness = 200
            AlignOrientation.CFrame = CFrame.Angles(0, math.rad(math.random(0, 180)), 0)
            AlignOrientation.Parent = parent

            return AlignOrientation
        end
        tools.WaitForChildren = function(parent, ...)
            local children = {...}
            local count = #children

            for _, part in ipairs(parent:GetChildren())do
                local index = table.find(children, part.Name)

                if index == nil then
                    continue
                end

                children[index] = part
                count = count - 1

                if count == 0 then
                    return children
                end
            end

            if count > 0 then
                local listener

                listener = parent.ChildAdded:Connect(function(part)
                    local index = table.find(children, part.Name)

                    if index == nil then
                        return
                    end

                    children[index] = part
                    count = count - 1

                    if count == 0 then
                        listener:Disconnect()
                    end
                end)

                while count > 0 do
                    task.wait()
                end
            end

            return children
        end
        tools.IncreaseSimulationRadius = function()
            local SimulationRadiusFunc = nil

            if sethiddenproperty ~= nil and gethiddenproperty ~= nil then
                SimulationRadiusFunc = function()
                    repeat
                        task.wait(0.1)
                    until pcall(function()
                        gethiddenproperty(LocalPlayer, 'SimulationRadius')
                    end) ~= false

                    sethiddenproperty(LocalPlayer, 'SimulationRadius', 2500)
                end
            elseif setsimulationradius ~= nil then
                SimulationRadiusFunc = function()
                    setsimulationradius(2500, 5000)
                end
            end

            RunService.RenderStepped:Connect(function()
                LocalPlayer.MaximumSimulationRadius = 5000

                SimulationRadiusFunc()
            end)
        end
        tools.RoundNumber = function(num, decimal_places)
            local integral, fractional = math.modf(num)

            fractional = string.sub(tostring(fractional), 1, 2 + (decimal_places or 2))

            return integral + tonumber(fractional)
        end
        tools.WaitForChildWithIndex = function(parent, index)
            local children = parent:GetChildren()
            local count = #children

            if count >= index then
                return children[index]
            else
                local listener

                listener = parent.ChildAdded:Connect(function(child)
                    table.insert(children, child)

                    count = count + 1
                end)

                while count < index do
                    task.wait(0.25)
                end

                listener:Disconnect()

                return children[index]
            end
        end
        tools.SimulateShoot = function(Object, Damage)
            if tools.FireBullet == nil then
                if hookmetamethod ~= nil and getsenv ~= nil and checkcaller ~= nil and getnamecallmethod ~= nil then
                    tools.FireBullet = cache.GetRemote('FireBullet')
                else
                    tools.FireBullet = PlayerGui:WaitForChild('Weapons', math.huge):WaitForChild('BulletLocal', math.huge):WaitForChild('FireBullet', math.huge)
                end
            end
            if typeof(tools.FireBullet) == 'Instance' then
                tools.FireBullet:Fire(Object.Position, Object.Position, Vector3.new(0, 
-1E-13, 0), Damage, 100, 100, 100, 100)
                task.wait(1)
            else
                while tools.WeaponKey.Key == nil do
                    task.wait()
                end

                tools.FireBullet:FireServer(Object.Position, Object.Position, Vector3.new(0, 
-1E-13, 0), Damage, 100, 100, 100, 100)
            end
        end
        tools.SimulateKnifeHit = function(humanoid, part, damage)
            while tools.register_hit == nil or tools.WeaponKey == nil do
                task.wait()
            end
            while tools.WeaponKey.Key == nil do
                task.wait()
            end

            local _, hitreg = tools.register_hit()

            tools.PlayerHit:FireServer(humanoid, damage, 25, part, Vector3.new(0, 
-3, 0), Vector3.new(), 50, hitreg, tools.WeaponKey.Key)
            task.wait(0.05)
        end
        tools.AddBeam = function(parent, attachment_0)
            local beam = Instance.new('Beam')

            beam.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
            }
            beam.LightEmission = 0
            beam.LightInfluence = 0
            beam.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 0),
            })
            beam.ZOffset = 0
            beam.Attachment0 = attachment_0
            beam.FaceCamera = true
            beam.Segments = 1
            beam.Width0 = 0.005
            beam.Width1 = 0.005
            beam.Enabled = false
            beam.Parent = parent

            return beam
        end
        tools.TimerInText = function(
            text_holder,
            left_side,
            seconds,
            right_side
        )
            for sec = seconds, 0, -1 do
                text_holder.Text = left_side .. '0:' .. (sec > 9 and tostring(sec) or '0' .. tostring(sec)) .. right_side

                task.wait(1)
            end
        end
        tools.CalculateDamage = function(data, player, damage)
            damage = damage == nil and data.humanoid.MaxHealth - data.humanoid.Health or damage

            local FriendlyFire = ReplicatedStorage:FindFirstChild('FriendlyFire')

            FriendlyFire = (FriendlyFire == nil or player == LocalPlayer) and 1 or FriendlyFire.Value

            local ABL = data.humanoid:FindFirstChild('ArmorBlockLow')

            if ABL == nil then
                local diff_mul = (1.1385 + (0.1485 * (Difficulty - 1)))

                return damage / diff_mul / FriendlyFire
            else
                local armor_mul = (1 - ABL.Value)

                return damage / armor_mul / FriendlyFire
            end
        end
        tools.PlayerDataByName = function(player_name)
            player_name = string.lower(player_name)

            for player, data in pairs(cache.players_data)do
                local display_name = string.lower(player.DisplayName)

                if string.match(display_name, '^' .. player_name) ~= nil then
                    return data
                end
            end
            for player, data in pairs(cache.players_data)do
                local real_name = string.lower(player.Name)

                if string.match(real_name, '^' .. player_name) ~= nil then
                    return data
                end
            end

            return nil
        end
        tools.ConvertBool = function(value)
            return value == true and 'yes' or 'no'
        end
        tools.ComparePositions = function(pos1, pos2, inaccuracy)
            return (pos1 - pos2).Magnitude <= inaccuracy
        end
        tools.ExactPosBetweenVectors = function(
            pos1,
            pos2,
            required_magnitude,
            inaccuracy
        )
            return math.abs((pos1 - pos2).Magnitude - required_magnitude) <= inaccuracy
        end
        tools.ChildCounter = function(needed_count, parent, func)
            local count = 0
            local children = {}

            for _, obj in ipairs(parent:GetChildren())do
                if func(obj) == false then
                    continue
                end

                table.insert(children, obj)

                count = count + 1

                if count == needed_count then
                    break
                end
            end

            if count < needed_count then
                local listener

                listener = parent.ChildAdded:Connect(function(obj)
                    if func(obj) == false then
                        return
                    end

                    table.insert(children, obj)

                    count = count + 1

                    if count == needed_count then
                        listener:Disconnect()
                    end
                end)
            end

            while count ~= needed_count do
                task.wait()
            end

            return children
        end
        tools.FireTouchTrigger = function(trigger)
            local character = LocalPlayer.Character

            if not character then
                return
            end

            local hrp = character:FindFirstChild('HumanoidRootPart')

            if not hrp then
                return
            end

            while trigger.Parent ~= nil and task.wait(0.1) do
                firetouchinterest(hrp, trigger, 0)
                wait(0.05)
                firetouchinterest(hrp, trigger, 1)
            end
        end
        tools.ClickGuiButton = function(button)
            local properties = {
                Position = nil,
                Size = nil,
                Visible = nil,
                Parent = nil,
                Active = nil,
            }

            for property, _ in pairs(properties)do
                properties[property] = button[property]
            end

            local button_copy = button:Clone()

            button_copy.Parent = properties.Parent
            button.Visible = true
            button.Position = UDim2.fromOffset(0, 0)
            button.Size = UDim2.fromScale(0.00001, 0.00001)
            button.Active = true
            button.Parent = gui_util.gui_holder

            while button.GuiState ~= Enum.GuiState.Hover do
                GuiService.SelectedObject = button

                task.wait()
            end

            local pressed = false
            local listener

            listener = button:GetPropertyChangedSignal('GuiState'):Connect(function(
            )
                if button.GuiState == Enum.GuiState.Press then
                    pressed = true

                    listener:Disconnect()
                end
            end)

            while pressed == false and GuiService.SelectedObject == button do
                tools.emulate_input.Press(Enum.KeyCode.Return)
            end

            for property, value in pairs(properties)do
                button[property] = value
            end

            button_copy:Destroy()
        end
        tools.GetPing = function()
            return Stats.PerformanceStats.Ping:GetValue() / 1000
        end

        return tools
    end
    function __DARKLUA_BUNDLE_MODULES.e()
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local config = {}

        config.config = nil
        config.template = {
            keybinds = {
                ['O'] = '',
                ['P'] = '',
                ['K'] = '',
                ['L'] = '',
                ['M'] = '',
                ['Y'] = '',
                ['N'] = '',
                [','] = '',
                ['['] = '',
                [']'] = '',
                ["'"] = '',
                ['.'] = '',
            },
            startup_cmds = {},
            first_time = true,
            scr_settings = {
                startup_response = false,
                af_loud_behaviour = 'reset',
                af_time_exceed_behaviour = 'reset',
            },
        }
        config.Save = function()
            if not isfolder('deimos') then
                makefolder('deimos')
            end

            writefile('deimos/config.json', tools.jsonify(config.config))
        end
        config.Read = function()
            if not isfolder('deimos') or not isfile('deimos/config.json') then
                return nil
            end

            return tools.unjsonify(readfile('deimos/config.json'))
        end

        local saved_config = config.Read()

        if saved_config ~= nil and saved_config ~= '' then
            config.config = saved_config

            for key, value in pairs(config.template)do
                if config.config[key] == nil then
                    config.config[key] = typeof(value) == 'table' and table.clone(value) or value
                end
            end
        else
            config.config = config.template

            config.Save()
        end

        return config
    end
    function __DARKLUA_BUNDLE_MODULES.f()
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local config = __DARKLUA_BUNDLE_MODULES.load('e')
        local scr_settings = {}

        scr_settings.window = nil
        scr_settings.settings = config.config.scr_settings
        scr_settings.Render = function()
            scr_settings.window = gui_util.CreateWindow('root@kali: /terminal/settings')
            scr_settings.window.Position = UDim2.fromScale(0.067, 0.101)

            gui_util.MakeWindowDraggable(scr_settings.window)

            local content_holder = gui_util.AddContentHolder(scr_settings.window)

            gui_util.SetContentEnv(content_holder)
            gui_util.AddSection('Terminal')
            gui_util.CreateToggle('Send responses caused by startup commands', function(
                is_enabled
            )
                scr_settings.settings.no_startup_response = is_enabled

                config.Save()
            end)
            gui_util.AddSection('Autofarm')

            local dropdown = gui_util.CreateDropdown('Behaviour when loud starts')

            dropdown.SetChoice(scr_settings.settings.af_loud_behaviour)

            for _, action in ipairs({
                'reset',
                'turn off autofarm',
            })do
                gui_util.AddDropdownOption(dropdown, action, function()
                    scr_settings.settings.af_loud_behaviour = action

                    config.Save()
                end)
            end

            local dropdown = gui_util.CreateDropdown('Behaviour when the action takes too long')

            dropdown.SetChoice(scr_settings.settings.af_time_exceed_behaviour)

            for _, action in ipairs({
                'reset',
                'turn off autofarm',
            })do
                gui_util.AddDropdownOption(dropdown, action, function()
                    scr_settings.settings.af_time_exceed_behaviour = action

                    config.Save()
                end)
            end
        end

        return scr_settings
    end
    function __DARKLUA_BUNDLE_MODULES.g()
        local Players = game:GetService('Players')
        local LocalPlayer = Players.LocalPlayer
        local Level = game.Workspace:WaitForChild('Level', math.huge)
        local PlrModels = Level:WaitForChild('Players', math.huge)
        local Glass = Level:WaitForChild('Glass', math.huge)
        local Actors = Level:WaitForChild('Actors', math.huge)
        local esp_holder = nil
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local esp_mgr = {}

        esp_mgr.settings = {
            civilians = {
                FillColor = Color3.fromRGB(0, 0, 0),
                FillTransparency = 0.5,
                OutlineColor = Color3.fromRGB(0, 0, 0),
                OutlineTransparency = 0.5,
            },
            workers = {
                FillColor = Color3.fromRGB(255, 255, 255),
                FillTransparency = 0.5,
                OutlineColor = Color3.fromRGB(0, 0, 0),
                OutlineTransparency = 0.5,
            },
            guards = {
                FillColor = Color3.fromRGB(255, 0, 0),
                FillTransparency = 0.5,
                OutlineColor = Color3.fromRGB(0, 0, 0),
                OutlineTransparency = 0.5,
            },
            specials = {
                FillColor = Color3.fromRGB(0, 0, 255),
                FillTransparency = 0.5,
                OutlineColor = Color3.fromRGB(0, 0, 0),
                OutlineTransparency = 0.5,
            },
            enemies = {
                FillColor = Color3.fromRGB(255, 0, 0),
                FillTransparency = 0.25,
                OutlineColor = Color3.fromRGB(0, 0, 0),
                OutlineTransparency = 0.5,
            },
            snipers = {
                FillColor = Color3.fromRGB(255, 255, 255),
                FillTransparency = 0,
                OutlineColor = Color3.fromRGB(255, 255, 255),
                OutlineTransparency = 0,
            },
            allies = {
                FillColor = Color3.fromRGB(255, 171, 0),
                FillTransparency = 0.5,
                OutlineColor = Color3.fromRGB(0, 0, 0),
                OutlineTransparency = 0.5,
            },
            cams = {
                FillColor = Color3.fromRGB(0, 255, 0),
                FillTransparency = 0.5,
                OutlineColor = Color3.fromRGB(0, 0, 0),
                OutlineTransparency = 0.5,
            },
            players = {
                FillColor = Color3.fromRGB(255, 165, 0),
                FillTransparency = 0.75,
                OutlineColor = Color3.fromRGB(255, 165, 0),
                OutlineTransparency = 0,
            },
            objects = {
                FillColor = Color3.fromRGB(255, 255, 0),
                FillTransparency = 0.75,
                OutlineColor = Color3.fromRGB(255, 255, 0),
                OutlineTransparency = 0,
            },
            items = {
                Color3 = Color3.fromRGB(30, 223, 0),
                Radius = 0.1,
                AlwaysOnTop = true,
            },
            weapons = {
                Color3 = Color3.fromRGB(255, 217, 0),
                Radius = 0.1,
                AlwaysOnTop = true,
            },
        }
        esp_mgr.data = {esps = {}}
        esp_mgr.AddNPCsESP = function()
            local ESPModel = Instance.new('Model')

            ESPModel.Name = 'ESP'
            ESPModel.Parent = Actors
            esp_holder = ESPModel

            for _, team in ipairs({
                'civilians',
                'workers',
                'guards',
                'specials',
                'enemies',
                'snipers',
                'allies',
            })do
                local ESPGroup = Instance.new('Model')

                ESPGroup.Name = team
                ESPGroup.Parent = ESPModel

                local ESP = Instance.new('Highlight')

                for property, value in pairs(esp_mgr.settings[team])do
                    ESP[property] = value
                end

                ESP.Enabled = cache.flags and cache.flags.esp or false
                ESP.Adornee = ESPGroup
                ESP.Parent = ESPGroup

                table.insert(esp_mgr.data.esps, ESP)
            end
        end
        esp_mgr.AddCamsESP = function()
            local ESPGroup = Instance.new('Model')

            ESPGroup.Name = 'cams'
            ESPGroup.Parent = esp_holder

            local ESP = Instance.new('Highlight')

            for property, value in pairs(esp_mgr.settings['cams'])do
                ESP[property] = value
            end

            ESP.Enabled = cache.flags and cache.flags.esp or false
            ESP.Adornee = ESPGroup
            ESP.Parent = ESPGroup

            table.insert(esp_mgr.data.esps, ESP)

            for _, obj in ipairs(Glass:GetChildren())do
                if obj.Name == 'ExteriorCam' then
                    obj.Parent = ESPGroup
                end
            end

            Glass.ChildAdded:Connect(function(obj)
                if obj.Name == 'ExteriorCam' then
                    task.wait(0.5)

                    obj.Parent = ESPGroup
                end
            end)
            task.spawn(function()
                for i = 0, 8, 0.25 do
                    ESP.Adornee = nil

                    task.wait(0.25)

                    ESP.Adornee = ESPGroup
                end
            end)
        end
        esp_mgr.AddPlayersESP = function()
            local internal = function(character)
                if character.Name == LocalPlayer.Name then
                    return
                end

                local ESP = Instance.new('Highlight')

                for property, value in pairs(esp_mgr.settings['players'])do
                    ESP[property] = value
                end

                ESP.Enabled = cache.flags and cache.flags.esp or false
                ESP.Adornee = character
                ESP.Parent = character

                table.insert(esp_mgr.data.esps, ESP)
                task.spawn(function()
                    for i = 0, 2, 0.25 do
                        ESP.Adornee = nil

                        task.wait(0.25)

                        ESP.Adornee = character
                    end
                end)
            end

            for _, player in ipairs(PlrModels:GetChildren())do
                if player == LocalPlayer then
                    continue
                end

                task.spawn(internal, player)
            end

            PlrModels.ChildAdded:Connect(internal)
        end
        esp_mgr.AddItemAdornment = function(base, group_name)
            local ESP = Instance.new('SphereHandleAdornment')

            for property, value in pairs(esp_mgr.settings[group_name])do
                ESP[property] = value
            end

            ESP.ZIndex = 1
            ESP.Adornee = base
            ESP.Visible = cache.flags and cache.flags.esp or false
            ESP.Parent = base

            table.insert(esp_mgr.data.esps, ESP)
        end
        esp_mgr.AddObjectESP = function(parent)
            local ESP = Instance.new('Highlight')

            for property, value in pairs(esp_mgr.settings['objects'])do
                ESP[property] = value
            end

            ESP.Enabled = cache.flags and cache.flags.esp or false
            ESP.Adornee = parent
            ESP.Parent = parent

            table.insert(esp_mgr.data.esps, ESP)
        end

        return esp_mgr
    end
    function __DARKLUA_BUNDLE_MODULES.h()
        local Players = game:GetService('Players')
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local Events = ReplicatedStorage:WaitForChild('Events', math.huge)
        local GetRemote = Events:WaitForChild('GetKey', math.huge)
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local places = __DARKLUA_BUNDLE_MODULES.load('b')
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer.PlayerGui
        local Status = LocalPlayer:WaitForChild('Status', math.huge)

        Status:WaitForChild('Scripts', math.huge)

        local _ = ReplicatedStorage.Weapons.Data.UP9
        local rmts_mgr = {}

        rmts_mgr.remotes = {}
        rmts_mgr.FireBullet = nil
        rmts_mgr.FireBulletDmg = nil
        rmts_mgr.GetRemote = function(remote_name)
            while rmts_mgr.remotes[remote_name] == nil do
                task.wait()
            end

            return rmts_mgr.remotes[remote_name]
        end
        cache.GetRemote = rmts_mgr.GetRemote

        if places.place_group == 'mission' then
            if game.PlaceId == 4768829954 then
                rmts_mgr.remotes['MethodVote'] = ReplicatedStorage:WaitForChild('MethodVote', math.huge)
            end

            task.spawn(function()
                local Weapons = PlayerGui:WaitForChild('Weapons', math.huge)
                local WeaponScript = Weapons:WaitForChild('WeaponScript', math.huge)

                rmts_mgr.remotes['TryPickup'] = WeaponScript:WaitForChild('TryPickup', math.huge)
            end)

            if getsenv ~= nil and hookmetamethod ~= nil and getnamecallmethod ~= nil and checkcaller ~= nil then
                task.spawn(function()
                    local Weapons = PlayerGui:WaitForChild('Weapons', math.huge)
                    local PingLocation = Weapons:WaitForChild('WeaponGui', math.huge):WaitForChild('PingLocation', math.huge)
                    local env = getsenv(PingLocation)

                    while env.procPing == nil do
                        task.wait()
                    end

                    rmts_mgr.remotes['PingLocation'] = debug.getupvalue(env.procPing, 2)

                    local WeaponScript = Weapons:WaitForChild('WeaponScript', math.huge)
                    local env = getsenv(WeaponScript)

                    while env.equipWeapon == nil or env.getModdedStats == nil do
                        task.wait()
                    end

                    local old = clonefunction(env.getModdedStats)

                    getPerk = env.getPerk
                    env.getModdedStats = function(arg)
                        local modded_stats = old(arg)

                        if rmts_mgr.FireBulletDmg == 250 then
                            for _, stat in ipairs({
                                'FireRate',
                                'FireDelay',
                                'ReloadSpeed',
                            })do
                                modded_stats[stat] = 0
                            end

                            modded_stats['FireType'] = 1
                            modded_stats['Type'] = 'SMG'

                            for _, stat in ipairs({
                                'MagazineSize',
                                'MagSize',
                            })do
                                modded_stats[stat] = 1000000000000000000
                            end
                            for _, stat in ipairs({
                                'SpreadAimMin',
                                'SpreadAimMax',
                                'SpreadAimMovMin',
                                'SpreadAimMovMax',
                                'SpreadHipMin',
                                'SpreadHipMax',
                                'SpreadAimMax',
                                'SpreadHipMovMin',
                                'SpreadHipMovMax',
                                'SpreadDecrease',
                                'SpreadIncrease',
                                'RecoilXMin',
                                'RecoilXSpread',
                                'RecoilUp',
                                'RecoilDecrease',
                                'RecoilFirstShot',
                                'RecoilCam',
                                'RecoilCamTm',
                            })do
                                modded_stats[stat] = 0.00000000001
                            end
                        end

                        return modded_stats
                    end

                    local equipWeapon = env.equipWeapon
                    local scr_remotes = debug.getupvalue(equipWeapon, 4)

                    for remote_name, remote_table in pairs(scr_remotes)do
                        rmts_mgr.remotes[remote_name] = remote_table
                    end

                    local BulletLocal = Weapons:WaitForChild('BulletLocal', math.huge)
                    local env = getsenv(BulletLocal)

                    while env.FireBulletRemote == nil do
                        task.wait()
                    end

                    local FireBullet = env.FireBulletRemote
                    local FireBulletObj = BulletLocal:WaitForChild('FireBullet', math.huge)

                    rmts_mgr.remotes['FireBullet'] = FireBullet

                    local mt = getrawmetatable(game)
                    local old = mt.__namecall

                    setreadonly(mt, false)

                    mt.__namecall = function(self, ...)
                        local method = getnamecallmethod()

                        if self == FireBulletObj and method == 'Fire' and rmts_mgr.FireBulletDmg ~= nil then
                            local args = {...}

                            args[4] = rmts_mgr.FireBulletDmg

                            return old(self, unpack(args))
                        end

                        return old(self, ...)
                    end

                    setreadonly(mt, true)
                end)

                if debug ~= nil and debug.getupvalue ~= nil then
                    task.spawn(function()
                        local scr = PlayerGui:WaitForChild('InventoryGui', math.huge):WaitForChild('InvScript', math.huge)
                        local env = getsenv(scr)

                        while env.stopItemDrag == nil do
                            task.wait()
                        end

                        rmts_mgr.remotes['AuthItemMove'] = debug.getupvalue(env.stopItemDrag, 18)
                    end)
                end
            end

            task.spawn(function()
                local Animate = PlayerGui:WaitForChild('Animate', math.huge)

                for _, remote in ipairs(tools.WaitForChildren(Animate, 'SetAnim', 'SetLean', 'SetShoulders', 'SetWeight', 'UpdateInputs'))do
                    rmts_mgr.remotes[remote.Name] = remote
                end
            end)
            task.spawn(function()
                pcall(function()
                    local InventoryValidation = require(game:GetService('ReplicatedStorage'):WaitForChild('Loadout', math.huge):WaitForChild('InventoryValidation', math.huge))
                    local Hash = InventoryValidation.Hash

                    for normal_name, for_hash_name in pairs({
                        ['GenerateWeaponKey'] = 'GenerateWeaponKey_7zU',
                        ['AmmoReplicate'] = 'AmmoReplicate_8Z1',
                        ['AmmoReplicateAkimbo'] = 'AmmoReplicateAkimbo_av7',
                        ['FireGrenade'] = 'FireGrenade_1Gs',
                    })do
                        local name_hash = Hash(for_hash_name)
                        local remote_table = rmts_mgr.GetRemote(name_hash)

                        rmts_mgr.remotes[name_hash] = nil
                        rmts_mgr.remotes[normal_name] = remote_table
                    end
                end)
            end)
            task.spawn(function()
                local GameState = ReplicatedStorage:WaitForChild('GameState', math.huge)
                local SetGameDifficulty = GameState:WaitForChild('SetGameDifficulty', math.huge)

                rmts_mgr.remotes['SetGameDifficulty'] = SetGameDifficulty

                local Weapons = ReplicatedStorage:WaitForChild('Weapons', math.huge)
                local Objectives = Weapons:WaitForChild('Objectives', math.huge)

                for _, remote in ipairs(tools.WaitForChildren(Objectives, 'ChangeStageTarget', 'AddStage'))do
                    rmts_mgr.remotes[remote.Name] = remote
                end
            end)
        end
        if places.place_group == 'lobby' then
            local lobby_remotes = ReplicatedStorage:WaitForChild('Lobby', math.huge):WaitForChild('Trig', math.huge)

            for _, remote in ipairs(tools.WaitForChildren(lobby_remotes, 'CreateLobby', 'KickPlayer', 'StartGame', 'LeaveLobby'))do
                rmts_mgr.remotes[remote.Name] = remote
            end
        end

        task.spawn(function()
            for _, remote_name in ipairs({
                'BuyWeapon',
                'BuyAttachment',
                'SetAttachment',
            })do
                local remote, key = GetRemote:InvokeServer(remote_name)

                if remote.Name == 'RemoteEvent' then
                    rmts_mgr.remotes[remote_name] = {
                        FireServer = function(_, ...)
                            remote:FireServer(key, ...)
                        end,
                    }
                else
                    rmts_mgr.remotes[remote_name] = {
                        InvokeServer = function(_, ...)
                            return remote:InvokeServer(key, ...)
                        end,
                    }
                end
            end
        end)
        task.spawn(function()
            local ObjectivesRemotes = ReplicatedStorage:WaitForChild('Weapons', math.huge):WaitForChild('Objectives', math.huge)

            for _, remote_name in ipairs({
                'AddStage',
                'ChangeStageTarget',
                'NewObjective',
                'SetStageName',
                'ClearStage',
            })do
                local remote = ObjectivesRemotes:WaitForChild(remote_name)

                rmts_mgr.remotes[remote.Name] = remote
            end
        end)

        return rmts_mgr
    end
    function __DARKLUA_BUNDLE_MODULES.i()
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local Players = game:GetService('Players')
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer.PlayerGui
        local PlayerWeapons = nil
        local WeaponGui = nil
        local ObjectivesHolder = nil
        local ObjectiveManagment = nil
        local PlayerObjectives = nil
        local GameState = ReplicatedStorage:WaitForChild('GameState', math.huge)

        GameState:WaitForChild('Stage', math.huge)

        local Difficulty = GameState:WaitForChild('Difficulty', math.huge).Value

        task.spawn(function()
            PlayerWeapons = PlayerGui:WaitForChild('Weapons', math.huge)
            WeaponGui = PlayerWeapons:WaitForChild('WeaponGui', math.huge)
            ObjectivesHolder = WeaponGui:WaitForChild('Objectives', math.huge)
            ObjectiveManagment = ObjectivesHolder:WaitForChild('ObjectiveManagment', math.huge)
            PlayerObjectives = ObjectiveManagment:WaitForChild('Objectives', math.huge)
        end)

        local Weapons = ReplicatedStorage:WaitForChild('Weapons', math.huge)

        Weapons:WaitForChild('Objectives', math.huge)

        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local esp_mgr = __DARKLUA_BUNDLE_MODULES.load('g')
        local rmts_mgr = __DARKLUA_BUNDLE_MODULES.load('h')

        __DARKLUA_BUNDLE_MODULES.load('c')

        local Level = workspace:WaitForChild('Level', math.huge)
        local GroundBags = Level:WaitForChild('GroundBags', math.huge)

        Level:WaitForChild('GroundItems', math.huge)

        local Geometry = Level:WaitForChild('Geometry', math.huge)

        Level:WaitForChild('Triggers', math.huge)

        local Doors = Geometry:WaitForChild('Doors', math.huge)
        local Actors = Level:WaitForChild('Actors', math.huge)
        local ms_data

        ms_data = {
            [3200010305] = {
                sort_flags = {
                    guards = {
                        name = {
                            'SC Guard',
                        },
                    },
                    specials = {
                        name = {
                            'SC Commander',
                        },
                    },
                    enemies = {
                        name = {
                            'SC Soldier',
                            'SC Shredder',
                        },
                    },
                    allies = {
                        name = {
                            'Rose',
                        },
                    },
                    final = {
                        'guards',
                        'specials',
                        'enemies',
                        'allies',
                    },
                },
                fraction_type = 2,
                alt_music = 'rbxassetid://1837844069',
                hide_spot = Vector3.new(70.85807037353516, 20.098060607910156, 199.99752807617188),
                objects_esp = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if string.find(obj.Name, 'Room') and obj:FindFirstChild('Computer') then
                            esp_mgr.AddObjectESP(obj.Computer)
                        end
                    end
                end,
            },
            [2797881676] = {
                sort_flags = {
                    guards = {
                        name = {
                            'Guard',
                        },
                    },
                    specials = {
                        name = {
                            'Ryan',
                        },
                    },
                    enemies = {
                        name = {
                            'SWAT',
                            'Aegis Unit',
                        },
                    },
                    final = {
                        'guards',
                        'specials',
                        'snipers',
                    },
                },
                fraction_type = 1,
                alt_music = 'rbxassetid://1843513001',
                hide_spot = Vector3.new(-51.04850769042969, 14.899995803833008, 
-56.45438003540039),
                pb_amt = (function()
                    if Difficulty >= 4 and Difficulty <= 5 then
                        return 3
                    elseif Difficulty >= 2 and Difficulty <= 3 then
                        return 2
                    else
                        return 1
                    end
                end)(),
                objects_esp = function()
                    tools.ChildCounter(ms_data[game.PlaceId].pb_amt + 1, Geometry, function(
                        child
                    )
                        if child.Name == 'Computer' or child.Name == 'PowerBox' then
                            esp_mgr.AddObjectESP(child)

                            return true
                        else
                            return false
                        end
                    end)
                    rmts_mgr.GetRemote('ChangeStageTarget').OnClientEvent:Connect(function(
                        ...
                    )
                        local args = {...}

                        if not args[4] or args[4].Name ~= 'Part' then
                            return
                        end

                        esp_mgr.AddObjectESP(args[4])
                    end)
                end,
            },
            [2625195454] = {
                sort_flags = {
                    civilians = {
                        name = {
                            'Civilian',
                        },
                    },
                    workers = {
                        name = {
                            'Employee',
                        },
                    },
                    guards = {
                        name = {
                            'Guard',
                        },
                    },
                    specials = {
                        name = {
                            'Manager',
                        },
                    },
                    enemies = {
                        name = {
                            'SWAT',
                            'Aegis Unit',
                        },
                    },
                    final = {
                        'guards',
                        'specials',
                        'snipers',
                    },
                },
                fraction_type = 1,
                hide_spot = Vector3.new(165.1376190185547, 173.49996948242188, -160.21685791015625),
                alt_music = 'rbxassetid://1842802436',
                objects_esp = function()
                    local ManagerComputer = Geometry:WaitForChild('ManagerComputer', math.huge)
                    local Safe = Geometry:WaitForChild('Safe', math.huge)
                    local AccComputers = Geometry:WaitForChild('AccComputers', math.huge)

                    esp_mgr.AddObjectESP(ManagerComputer)
                    esp_mgr.AddObjectESP(Safe)

                    for _, computer in ipairs(AccComputers:GetChildren())do
                        task.spawn(function()
                            if computer:WaitForChild('Interact', 3) ~= nil then
                                esp_mgr.AddObjectESP(computer)
                            end
                        end)
                    end
                end,
            },
            [3590667014] = {
                sort_flags = {
                    workers = {has_intel = true},
                    guards = {
                        name = {
                            'Phoenix Operative',
                        },
                    },
                    specials = {
                        inventory = 'KeycardBlue',
                    },
                    enemies = {
                        name = {
                            'SC Soldier',
                            'SC Shredder',
                        },
                    },
                    final = {
                        'workers',
                        'specials',
                        'enemies',
                    },
                },
                fraction_type = 2,
                alt_music = 'rbxassetid://1842940300',
                hide_spot = Vector3.new(21.38668441772461, 18.50002670288086, -32.37154006958008),
                kill_boss = function()
                    local Helicopter = Actors:WaitForChild('Helo', math.huge)
                    local Base = Helicopter:WaitForChild('Base', math.huge)
                    local Health = Helicopter:WaitForChild('ObjectHealth', math.huge)

                    while Health.Value > 0 do
                        tools.SimulateShoot(Base, 50000)
                        task.wait(1)
                    end
                end,
                get_door_unlocker = function()
                    tools.WaitForChildWithIndex(Geometry, 1827)

                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj:FindFirstChild('Escape') then
                            return obj.Escape:WaitForChild('Interact', math.huge):WaitForChild('Active', math.huge)
                        end
                    end

                    return nil
                end,
                instagrab = function(is_enabled)
                    local internal = function(objective)
                        while objective.Adornee == nil do
                            task.wait()
                        end

                        local obj = objective.Adornee

                        if obj.Name ~= 'Union' then
                            return
                        end

                        obj.Parent.Parent:WaitForChild('ServerPickup', math.huge):WaitForChild('PickupTime', math.huge).Value = is_enabled and 0 or 6
                    end

                    while PlayerObjectives == nil do
                        task.wait()
                    end

                    for _, objective in ipairs(PlayerObjectives:GetChildren())do
                        internal(objective)
                    end

                    PlayerObjectives.ChildAdded:Connect(function(objective)
                        internal(objective)
                    end)
                end,
                objects_esp = function()
                    esp_mgr.AddObjectESP(Geometry:WaitForChild('PowerBox', math.huge))
                    esp_mgr.AddObjectESP(ms_data.current.get_door_unlocker().Parent.Parent.Parent)
                    tools.ChildCounter(3, Geometry, function(obj)
                        if obj.Name ~= 'FileFolder' then
                            return false
                        end

                        esp_mgr.AddObjectESP(obj)

                        return true
                    end)
                end,
            },
            [2951213182] = {
                sort_flags = {
                    civilians = {
                        name = {
                            'Civilian',
                        },
                    },
                    workers = {
                        name = {
                            'Employee',
                        },
                    },
                    guards = {
                        name = {
                            'Guard',
                        },
                    },
                    specials = {
                        name = {
                            'Manager',
                        },
                    },
                    enemies = {
                        name = {
                            'Police',
                            'SWAT',
                            'Aegis Unit',
                        },
                    },
                    final = {
                        'workers',
                        'guards',
                        'specials',
                        'snipers',
                    },
                },
                fraction_type = 1,
                alt_music = 'rbxassetid://1838627011',
                hide_spot = Vector3.new(39.4105339050293, 3.4001095294952393, 113.61088562011719),
                get_door_unlocker = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj.Name ~= 'FireDoor' or obj.WorldPivot.LookVector.X < 0 then
                            continue
                        end

                        local OpenTrig = obj:WaitForChild('OpenTrig', math.huge)

                        OpenTrig:WaitForChild('Part', math.huge).Size = Vector3.new(5, 7, 2)

                        local Interact = OpenTrig:WaitForChild('Interact', math.huge)
                        local ObjectTip = Interact:WaitForChild('ObjectTip', math.huge)
                        local Active = Interact:WaitForChild('Active', math.huge)

                        Active:GetPropertyChangedSignal('Value'):Connect(function(
                        )
                            if Active.Value == false then
                                ObjectTip.Value = 'Bypass the sensors first'
                            else
                                ObjectTip.Value = 'Hit [F] to open'
                            end
                        end)

                        return Active
                    end

                    return nil
                end,
                instagrab = function(is_enabled)
                    local count = 0

                    for _, bag in ipairs(GroundBags:GetChildren())do
                        if bag.Name ~= 'Cash' then
                            continue
                        end

                        count = count + 1
                        bag:WaitForChild('PickupTime', math.huge).Value = is_enabled and 0 or 6
                    end

                    if count < 6 then
                        GroundBags.ChildAdded:Connect(function(bag)
                            if bag.Name ~= 'Cash' then
                                return
                            end

                            bag:WaitForChild('PickupTime', math.huge).Value = is_enabled and 0 or 6
                        end)
                    end
                end,
                objects_esp = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj.Name == 'ServerRoom' then
                            esp_mgr.AddObjectESP(obj.Computer)
                        end
                    end

                    esp_mgr.AddObjectESP(tools.WaitForChildWithIndex(Geometry, 1229))
                end,
            },
            [4518266946] = {
                sort_flags = {
                    workers = {
                        inventory = 'KeycardHS',
                    },
                    guards = {
                        name = {
                            'Halcyon Operative',
                        },
                    },
                    specials = {
                        name = {
                            'Falcon',
                        },
                    },
                    allies = {
                        name = {
                            'Rivera',
                        },
                    },
                    enemies = {
                        name = {
                            'TRU',
                            'Aegis Unit',
                        },
                    },
                    final = {
                        'specials',
                        'snipers',
                    },
                },
                fraction_type = 1,
                alt_music = 'rbxassetid://1837798598',
                hide_spot = Vector3.new(-21.118181228637695, 3.500000476837158, 
-20.95203971862793),
                objects_esp = function()
                    for _, obj in ipairs(Doors:GetChildren())do
                        if obj:FindFirstChild('ServerUnlock') then
                            esp_mgr.AddObjectESP(obj)
                        end
                    end
                end,
            },
            [4661507759] = {
                sort_flags = {
                    workers = {
                        name = {
                            'Analyst',
                            'Tech',
                        },
                    },
                    guards = {
                        name = {
                            'Security',
                            'Janitor',
                        },
                    },
                    specials = {
                        name = {
                            'Agent Nightshade',
                            'Agent Hemlock',
                        },
                    },
                    enemies = {
                        name = {
                            'ETF',
                            'Aegis Unit',
                        },
                    },
                    final = {
                        'workers',
                        'guards',
                        'specials',
                        'enemies',
                    },
                },
                fraction_type = 1,
                alt_music = 'rbxassetid://1842940420',
                hide_spot = Vector3.new(52.52033233642578, 15, 188.01849365234375),
                boss_health = {
                    [1] = 10500,
                    [2] = 14000,
                    [3] = 17500,
                    [4] = 2100,
                    [5] = 24500,
                },
                kill_boss = function()
                    local Helicopter = Actors:WaitForChild('Helo', math.huge)
                    local Base = Helicopter:WaitForChild('Base', math.huge)
                    local Health = Helicopter:WaitForChild('ObjectHealth', math.huge)
                    local _ = ms_data.current.boss_health[Difficulty]

                    while Health.Value ~= 0 do
                        tools.SimulateShoot(Base, 50000)
                        task.wait(1)
                    end
                end,
                objects_esp = function()
                    local RightColor = Geometry:WaitForChild('MetalDetector0', math.huge):WaitForChild('Wire', math.huge).Color
                    local pc_found = false

                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj.Name == 'Model' then
                            if (obj:FindFirstChild('SafeDoor') or (obj:FindFirstChild('PowerBoxDoor') and obj:WaitForChild('Wire', math.huge).Color == RightColor)) then
                                esp_mgr.AddObjectESP(obj)
                            else
                                for _, obj_child in ipairs(obj:GetChildren())do
                                    if obj_child.Name ~= 'Model' or not obj_child:FindFirstChild('Interact') or not obj_child.Interact:FindFirstChild('ObjectTip') then
                                        continue
                                    end

                                    pc_found = true

                                    esp_mgr.AddObjectESP(obj)
                                end
                            end
                        end
                    end

                    if pc_found == false then
                        local listener

                        listener = Geometry.DescendantAdded:Connect(function(
                            obj
                        )
                            if obj.Name ~= 'ObjectTip' then
                                return
                            end

                            while obj.Value == nil or obj.Value == '' do
                                task.wait()
                            end

                            if obj.Value ~= 'Hold [F] to authorize' then
                                return
                            end

                            esp_mgr.AddObjectESP(obj.Parent.Parent)
                            listener:Disconnect()
                        end)
                    end
                end,
            },
            [4768829954] = {
                sort_flags = {
                    workers = {
                        name = {
                            'Workshop Tech',
                            'Programmer',
                            'Tech',
                        },
                    },
                    guards = {
                        name = {
                            'Base Security',
                        },
                    },
                    specials = {
                        name = {
                            'Elite Operative',
                            'Onyx Unit',
                        },
                    },
                    enemies = {
                        name = {
                            'Halcyon Operative',
                            'Juggernaut',
                        },
                    },
                    final = {
                        'workers',
                        'guards',
                        'specials',
                        'enemies',
                    },
                },
                fraction_type = 2,
                alt_music = 'rbxassetid://1842802498',
                hide_spot = Vector3.new(94.17521667480469, 21.497360229492188, 216.7227325439453),
            },
            [2215221144] = {
                sort_flags = {
                    guards = {
                        name = {
                            'Guard',
                        },
                    },
                    specials = {
                        inventory = 'KeycardRed',
                    },
                    enemies = {
                        name = {
                            'SWAT',
                            'Aegis Unit',
                        },
                    },
                    final = {
                        'specials',
                        'enemies',
                    },
                },
                fraction_type = 1,
                alt_music = 'rbxassetid://1843497734',
                hide_spot = Vector3.new(20.715, 7.23954, 62.0234),
                objects_esp = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj.Name == 'PowerBox' then
                            esp_mgr.AddObjectESP(obj)
                        end
                    end
                end,
            },
            [4134003540] = {
                sort_flags = {
                    civilians = {
                        name = {
                            'Civilian',
                        },
                    },
                    workers = {
                        name = {
                            'Staff',
                        },
                    },
                    guards = {
                        name = {
                            'Guard',
                        },
                    },
                    specials = {
                        name = {
                            'Auctioneer',
                        },
                    },
                    final = {
                        'workers',
                        'guards',
                        'specials',
                    },
                },
                fraction_type = 1,
                hide_spot = Vector3.new(37.45741271972656, 3.4001107215881348, 98.5108871459961),
                objects_esp = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj.Name == 'Clipboard' or obj.Name == 'Computer' then
                            esp_mgr.AddObjectESP(obj)
                        end
                    end
                end,
            },
            [3925577908] = {
                sort_flags = {
                    civilians = {
                        name = {
                            'Civilian',
                        },
                    },
                    workers = {
                        name = {
                            'Staff',
                        },
                    },
                    guards = {
                        name = {
                            'Guard',
                        },
                    },
                    specials = {
                        inventory = 'KeycardRed',
                        intel = 'KeypadCode',
                    },
                    final = {
                        'workers',
                        'specials',
                    },
                },
                fraction_type = 1,
                hide_spot = Vector3.new(-4.096112251281738, 7.500090599060059, -54.025657653808594),
                objects_esp = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj:FindFirstChild('SafeDoor') or obj:FindFirstChild('Case') or (obj:FindFirstChild('Interact') and (table.find({
                            'Keypad',
                            '"Artifact"',
                            'Circuit Box',
                        }, obj.Interact.ObjectName.Value))) then
                            esp_mgr.AddObjectESP(obj)
                        end
                    end
                end,
                instagrab = function(_)
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj.Name ~= 'CaseArtifact' then
                            continue
                        end

                        obj:WaitForChild('PickupTime', math.huge):Destroy()

                        obj:WaitForChild('Interact', math.huge).Value = true
                    end
                    for _, bag in ipairs(GroundBags:GetChildren())do
                        if bag.Name ~= 'CrateArtifact' then
                            continue
                        end

                        bag:WaitForChild('PickupTime', math.huge):Destroy()

                        bag:WaitForChild('Interact', math.huge).Value = true
                    end

                    GroundBags.ChildAdded:Connect(function(bag)
                        if bag.Name ~= 'CrateArtifact' then
                            return
                        end

                        bag:WaitForChild('PickupTime', math.huge):Destroy()

                        bag:WaitForChild('Interact', math.huge).Value = true
                    end)
                end,
            },
            [4388762338] = {
                sort_flags = {
                    guards = {
                        name = {
                            'Guard',
                        },
                    },
                    final = {
                        'guards',
                    },
                },
                fraction_type = 1,
                hide_spot = Vector3.new(165.1376190185547, 173.49996948242188, -160.21685791015625),
                objects_esp = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if table.find({
                            'Keypad',
                            'PowerBox',
                            'CameraPanel',
                            'DoorLockPanel',
                            'Toolbox',
                        }, obj.Name) then
                            esp_mgr.AddObjectESP(obj)
                        elseif obj.Name == 'Servers' then
                            esp_mgr.AddObjectESP(obj.Computer)
                        end
                    end
                end,
            },
            [5071816792] = {
                sort_flags = {
                    guards = {
                        name = {
                            'Guard',
                        },
                    },
                    final = {
                        'guards',
                    },
                },
                fraction_type = 1,
                hide_spot = Vector3.new(88.99303436279297, 23.910255432128906, -1.1216182708740234),
                objects_esp = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        if (obj.Name == 'PowerBox' or obj:FindFirstChild('SafeDoor')) or (obj:FindFirstChild('Interact') and obj.Interact.ObjectName.Value == 'Files') then
                            esp_mgr.AddObjectESP(obj)
                        elseif obj:FindFirstChild('Desk') and obj.Desk:FindFirstChild('Computer') then
                            esp_mgr.AddObjectESP(obj.Desk.Computer)
                        end
                    end
                end,
                instagrab = function(is_enabled)
                    GroundBags:WaitForChild('CashBag', math.huge):WaitForChild('PickupTime', math.huge).Value = is_enabled and 0 or 6
                end,
            },
            [5188855685] = {
                sort_flags = {
                    civilians = {
                        name = {
                            'Civilian',
                        },
                    },
                    guards = {
                        name = {
                            'Police',
                            'Detective',
                        },
                    },
                    specials = {
                        name = {
                            'Evidence Custodian',
                            'Police Captain',
                        },
                    },
                    enemies = {
                        name = {
                            'SWAT',
                            'Aegis Unit',
                        },
                    },
                    allies = {
                        name = {
                            'Jade',
                        },
                    },
                    final = {
                        'guards',
                        'specials',
                        'snipers',
                        'allies',
                    },
                },
                hide_spot = Vector3.new(2.96498, 3.48513, 90.5891),
                fraction_type = 1,
                alt_music = 'rbxassetid://1836789312',
                objects_esp = function()
                    for _, obj in ipairs(Geometry:GetChildren())do
                        task.spawn(function()
                            if obj:WaitForChild('Interact', 10) and obj.Interact:WaitForChild('ObjectName', 10) and table.find({
                                'File',
                                'Radio',
                            }, obj.Interact.ObjectName.Value) then
                                esp_mgr.AddObjectESP(obj)
                            end
                        end)
                    end
                end,
            },
            [5862433299] = {
                sort_flags = {
                    enemies = {
                        name = {
                            'SWAT',
                            'Aegis Unit',
                        },
                    },
                    allies = {
                        name = {
                            'Jade',
                        },
                    },
                    final = {
                        'allies',
                        'snipers',
                    },
                },
                fraction_type = 1,
                alt_music = 'rbxassetid://1836808611',
                hide_spot = Vector3.new(237.0268096923828, 16.700029373168945, 45.57285690307617),
                kill_boss = function()
                    for count = 1, 2, 1 do
                        local Turret = Actors:WaitForChild('Turret', math.huge)
                        local Base = Turret:WaitForChild('Gun', math.huge)
                        local Health = Turret:WaitForChild('ObjectHealth', math.huge)

                        while Health.Value > 0 do
                            tools.SimulateShoot(Base, 50000)
                            task.wait(1)
                        end

                        Turret.Name = 'Turret '
                    end
                end,
                instagrab = function(_)
                    for _, bag in ipairs(GroundBags:GetChildren())do
                        if bag.Name ~= 'Gold' then
                            continue
                        end

                        task.spawn(function()
                            bag:WaitForChild('PickupTime', math.huge):Destroy()
                        end)
                    end

                    GroundBags.ChildAdded:Connect(function(bag)
                        if bag.Name ~= 'Gold' then
                            return
                        end

                        bag:WaitForChild('PickupTime', math.huge):Destroy()
                    end)
                end,
            },
            [7799530284] = {
                sort_flags = {
                    civilians = {
                        name = {
                            'Civilian',
                        },
                    },
                    workers = {
                        name = {
                            'Employee',
                        },
                    },
                    guards = {
                        name = {
                            'Guard',
                            'Elite Guard',
                        },
                    },
                    specials = {
                        name = {
                            'Manager',
                            "Manager's Assistant",
                        },
                    },
                    final = {
                        'workers',
                        'guards',
                        'specials',
                    },
                },
                hide_spot = Vector3.new(46.8819, 5.31316, 5.74569),
                fraction_type = 1,
                instagrab = function()
                    for _, bag in ipairs(GroundBags:GetChildren())do
                        if not string.find(bag.Name, 'Cash') then
                            continue
                        end

                        bag:WaitForChild('PickupTime', math.huge).Value = 0
                    end

                    GroundBags.ChildAdded:Connect(function(bag)
                        if not string.find(bag.Name, 'Cash') then
                            return
                        end

                        bag:WaitForChild('PickupTime', math.huge).Value = 0
                    end)
                end,
            },
        }
        ms_data.current = ms_data[game.PlaceId]

        local current = ms_data.current

        ms_data.wave_amt = (current.fraction_type == 1 and 3 or 4) * (Difficulty <= 3 and 6 or 10)
        ms_data.wavebreak = (current.fraction_type == 1 and 28 or 14)
        ms_data.police_count = 0
        ms_data.wave = 0

        return ms_data
    end
    function __DARKLUA_BUNDLE_MODULES.j()
        local Players = game:GetService('Players')
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local RunService = game:GetService('RunService')
        local UserInputService = game:GetService('UserInputService')
        local TweenService = game:GetService('TweenService')
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local ms_data = __DARKLUA_BUNDLE_MODULES.load('i')
        local Level = workspace:WaitForChild('Level', math.huge)
        local GameState = ReplicatedStorage:WaitForChild('GameState', math.huge)
        local LoudStage = GameState:WaitForChild('Stage', math.huge)
        local info_panel = {}

        info_panel.content_holder = nil
        info_panel.ms_info = nil
        info_panel.ent_count = nil
        info_panel.players_count = 0
        info_panel.players_count_text = nil
        info_panel.AddSection = function(section_name)
            local label = Instance.new('TextLabel')

            label.BackgroundTransparency = 1
            label.Size = UDim2.fromScale(1, 0.048)
            label.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            label.Text = section_name
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextScaled = true
            label.TextXAlignment = Enum.TextXAlignment.Left
            label.Parent = info_panel.content_holder

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.3, 0)
            UIPadding.PaddingLeft = UDim.new(0.01, 0)
            UIPadding.PaddingTop = UDim.new(0.1)
            UIPadding.Parent = label

            local line = Instance.new('Frame')

            line.Size = UDim2.fromScale(1, 0.08)
            line.Position = UDim2.fromScale(0, 1)
            line.BorderSizePixel = 0
            line.Parent = label
        end
        info_panel.AddTableCell = function(
            table_line,
            segments_count,
            cell_text
        )
            local CellText = Instance.new('TextLabel')

            CellText.TextColor3 = Color3.fromRGB(255, 255, 255)
            CellText.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            CellText.TextScaled = true
            CellText.Text = cell_text
            CellText.Size = UDim2.fromScale(1 / segments_count, 1)
            CellText.BackgroundTransparency = 1
            CellText.Parent = table_line

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.175, 0)
            UIPadding.PaddingTop = UDim.new(0.175, 0)
            UIPadding.Parent = CellText

            return CellText
        end
        info_panel.CreateTable = function(columns)
            local table_holder = Instance.new('Frame')

            table_holder.Size = UDim2.fromScale(1, 0.083)
            table_holder.BackgroundTransparency = 1
            table_holder.BorderSizePixel = 0
            table_holder.Parent = info_panel.content_holder

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = table_holder

            local labels_holder = Instance.new('Frame')

            labels_holder.Size = UDim2.fromScale(1, 0.497)
            labels_holder.BackgroundColor3 = Color3.fromRGB(30, 31, 37)
            labels_holder.BackgroundTransparency = 0.45
            labels_holder.BorderSizePixel = 0
            labels_holder.Parent = table_holder

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.HorizontalFlex = Enum.UIFlexAlignment.Fill
            UIListLayout.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout.Parent = labels_holder

            local values_holder = labels_holder:Clone()

            values_holder.BackgroundColor3 = Color3.fromRGB(39, 40, 48)
            values_holder.Parent = table_holder

            local values_labels = {}
            local segments_count = tools.GetDictLen(columns)

            for _, data in ipairs(columns)do
                for label, value in pairs(data)do
                    info_panel.AddTableCell(labels_holder, segments_count, label)

                    local value_label = info_panel.AddTableCell(values_holder, segments_count, value)

                    value_label.Name = label

                    table.insert(values_labels, value_label)
                end
            end

            return values_labels
        end
        info_panel.CreatePairsPack = function(
            player_info,
            scale_x,
            scale_y,
            columns
        )
            local pairs_holder = Instance.new('Frame')

            pairs_holder.BackgroundTransparency = 1
            pairs_holder.Size = UDim2.fromScale(0.146, 0.688)
            pairs_holder.Position = UDim2.fromScale(scale_x, scale_y)
            pairs_holder.BorderSizePixel = 0
            pairs_holder.Parent = player_info

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = pairs_holder

            local values_labels = {}

            for _, data in ipairs(columns)do
                for label, value in pairs(data)do
                    local pair_holder = Instance.new('Frame')

                    pair_holder.BorderSizePixel = 0
                    pair_holder.BackgroundTransparency = 1
                    pair_holder.Size = UDim2.fromScale(1, 0.17)
                    pair_holder.Parent = pairs_holder

                    local label_text = gui_util.GetUbuntuText(label)

                    label_text.Size = UDim2.fromScale(1, 1)
                    label_text.TextXAlignment = Enum.TextXAlignment.Left
                    label_text.Parent = pair_holder

                    local value_text = label_text:Clone()

                    value_text.Name = label
                    value_text.Text = value
                    value_text.TextXAlignment = Enum.TextXAlignment.Right
                    value_text.Parent = pair_holder

                    table.insert(values_labels, value_text)
                end
            end

            return values_labels
        end
        info_panel.AddPlayerInfo = function(player)
            local name = player.Name
            local display_name = player.DisplayName
            local user_id = player.UserId
            local headshot = Players:GetUserThumbnailAsync(user_id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            local PlayerData = player:WaitForChild('PlayerData', math.huge)
            local chars_data = PlayerData:WaitForChild('Character', math.huge)
            local current_char = tostring(chars_data.Value)
            local char_data_obj = chars_data:WaitForChild('Char' .. current_char)
            local char_data = char_data_obj.Value

            char_data = tools.unjsonify(char_data)

            local current_exp = char_data.EXP
            local current_level = tostring(math.floor(math.sqrt(tonumber(current_exp) / 320)))

            if current_level == '0' then
                current_level = '1'
            end

            local classes = ' '

            for _, perk in ipairs(char_data.PRK)do
                if string.find(perk, 'Base') then
                    perk = string.gsub(string.lower(perk), 'base', '')
                    classes = classes .. perk .. ', '
                end
            end

            classes = string.sub(classes, 0, -3)

            local money_obj = PlayerData:WaitForChild('Money', math.huge)
            local money = tostring(money_obj.Value)
            local pro_bonus_obj = PlayerData:WaitForChild('ProBonus', math.huge)
            local pro_bonus = tostring(pro_bonus_obj.Value)
            local join_date = nil
            local event_unlocks = nil
            local sw_data = nil
            local info_holder = Instance.new('Frame')

            info_holder.Size = UDim2.fromScale(1, 0.23)
            info_holder.BackgroundColor3 = Color3.fromRGB(30, 31, 37)
            info_holder.BackgroundTransparency = 0.45
            info_holder.BorderSizePixel = 0

            local separator = Instance.new('Frame')

            separator.Size = UDim2.fromScale(0.002, 0.897)
            separator.Position = UDim2.fromScale(0.494, 0.05)
            separator.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
            separator.BorderSizePixel = 0
            separator.Parent = info_holder

            local datapack1 = Instance.new('Frame')

            datapack1.BackgroundTransparency = 1
            datapack1.Size = UDim2.fromScale(0.472, 0.887)
            datapack1.Position = UDim2.fromScale(0.014, 0.06)
            datapack1.BorderSizePixel = 0
            datapack1.Parent = info_holder

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0.018, 0)
            UIListLayout.Parent = datapack1

            local Frame = Instance.new('Frame')

            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.fromScale(1, 0.225)
            Frame.BackgroundTransparency = 1
            Frame.Parent = datapack1

            RunService.RenderStepped:Wait()

            local name_label = Instance.new('TextLabel')

            if name ~= display_name then
                name_label.Text = name .. ' (' .. display_name .. ')'
            else
                name_label.Text = name
            end

            name_label.BackgroundTransparency = 1
            name_label.TextColor3 = Color3.fromRGB(255, 255, 255)
            name_label.Size = UDim2.fromScale(1, 0.5)
            name_label.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            name_label.TextXAlignment = Enum.TextXAlignment.Left
            name_label.TextScaled = true
            name_label.Parent = Frame

            local health_bg = Instance.new('Frame')

            health_bg.BorderSizePixel = 0
            health_bg.Size = UDim2.fromScale(0.845, 0.2)
            health_bg.Position = UDim2.fromScale(0, 0.7)
            health_bg.BackgroundColor3 = Color3.fromRGB(47, 49, 58)
            health_bg.Parent = Frame

            local health = health_bg:Clone()

            health.BackgroundColor3 = Color3.fromRGB(56, 129, 0)
            health.Position = UDim2.fromScale(0, 0)
            health.Size = UDim2.fromScale(1, 1)
            health.Parent = health_bg

            local health_value = Instance.new('TextLabel')

            health_value.Size = UDim2.fromScale(0.333, 0.4)
            health_value.Position = UDim2.fromScale(0.5099999904632568, 0.2)
            health_value.BackgroundTransparency = 1
            health_value.TextColor3 = Color3.fromRGB(255, 255, 255)
            health_value.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Medium, Enum.FontStyle.Normal)
            health_value.TextScaled = true
            health_value.Text = 'N/A'
            health_value.TextXAlignment = Enum.TextXAlignment.Right
            health_value.Parent = Frame

            local player_headshot = Instance.new('ImageLabel')

            player_headshot.BorderSizePixel = 0
            player_headshot.Size = UDim2.fromScale(0.068, 1)
            player_headshot.AnchorPoint = Vector2.new(1, 0)
            player_headshot.Position = UDim2.fromScale(1, -0.1)
            player_headshot.BackgroundColor3 = Color3.fromRGB(47, 49, 58)
            player_headshot.Image = headshot
            player_headshot.Parent = Frame

            local Frame = Instance.new('Frame')

            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.fromScale(1, 0.124)
            Frame.BackgroundTransparency = 1
            Frame.Parent = datapack1

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout.HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
            UIListLayout.Parent = Frame

            local level_text = gui_util.GetUbuntuText('level: 1 (320 exp)')

            level_text.TextXAlignment = Enum.TextXAlignment.Left
            level_text.Size = UDim2.fromScale(0.391, 1)
            level_text.Text = 'level: ' .. current_level .. ' (' .. current_exp .. ' exp)'
            level_text.Parent = Frame

            local money_text = gui_util.GetUbuntuText('money: 0')

            money_text.TextXAlignment = Enum.TextXAlignment.Center
            money_text.Size = UDim2.fromScale(0.327, 1)
            money_text.Text = 'money: ' .. money
            money_text.Parent = Frame

            local pro_bonus_text = gui_util.GetUbuntuText('pro bonus: 0%')

            pro_bonus_text.TextXAlignment = Enum.TextXAlignment.Right
            pro_bonus_text.Size = UDim2.fromScale(0.238, 1)
            pro_bonus_text.Text = 'pro bonus: ' .. pro_bonus .. '%'
            pro_bonus_text.Parent = Frame

            local join_date_text = gui_util.GetUbuntuText('join date: no data')

            join_date_text.TextXAlignment = Enum.TextXAlignment.Left
            join_date_text.Size = UDim2.fromScale(1, 0.13)
            join_date_text.Text = 'join date: no data'
            join_date_text.Parent = datapack1

            local classes_text = gui_util.GetUbuntuText('classes: no data')

            classes_text.TextXAlignment = Enum.TextXAlignment.Left
            classes_text.Size = UDim2.fromScale(1, 0.13)
            classes_text.Text = 'classes: ' .. classes
            classes_text.Parent = datapack1

            local event_unlocks_text = gui_util.GetUbuntuText('event unlocks: no data')

            event_unlocks_text.TextXAlignment = Enum.TextXAlignment.Left
            event_unlocks_text.Size = UDim2.fromScale(1, 0.13)
            event_unlocks_text.Parent = datapack1

            local shadow_war_text = gui_util.GetUbuntuText('shadow war: no data')

            shadow_war_text.TextXAlignment = Enum.TextXAlignment.Left
            shadow_war_text.Size = UDim2.fromScale(1, 0.13)
            shadow_war_text.Parent = datapack1

            local ms_data_label = gui_util.GetUbuntuText('Current Mission Data')

            ms_data_label.Size = UDim2.fromScale(0.4, 0.11)
            ms_data_label.Position = UDim2.fromScale(0.512, 0.06)
            ms_data_label.TextXAlignment = Enum.TextXAlignment.Left
            ms_data_label.Parent = info_holder

            local block1 = info_panel.CreatePairsPack(info_holder, 0.512, 0.209, {
                {
                    ['kills:'] = '0',
                },
                {
                    ['headshots:'] = '0',
                },
                {
                    ['knockouts:'] = '0',
                },
                {
                    ['holdups:'] = '0',
                },
                {
                    ['shots fired:'] = '0',
                },
                {
                    ['shots hit:'] = '0',
                },
            })
            local block2 = info_panel.CreatePairsPack(info_holder, 0.674, 0.209, {
                {
                    ['armed:'] = 'false',
                },
                {
                    ['disguise:'] = '0',
                },
                {
                    ['intimidate:'] = 'false',
                },
                {
                    ['weapon sup.:'] = 'false',
                },
                {
                    ['suspicious:'] = 'false',
                },
                {
                    ['threat mul.:'] = '1',
                },
            })
            local block3 = info_panel.CreatePairsPack(info_holder, 0.837, 0.209, {
                {
                    ['trespassing:'] = 'false',
                },
                {
                    ['caught tresp.:'] = 'false',
                },
                {
                    ['final warning:'] = 'false',
                },
                {
                    ['zone:'] = 'N/A',
                },
            })

            RunService.RenderStepped:Wait()

            info_holder.Parent = info_panel.content_holder

            char_data_obj:GetPropertyChangedSignal('Value'):Connect(function()
                char_data = char_data_obj.Value
                current_exp = char_data.EXP
                current_level = tostring(math.floor(math.sqrt(tonumber(current_exp) / 320)))
                level_text.Text = 'level: ' .. current_level .. ' (' .. current_exp .. ' exp)'
            end)
            money_obj:GetPropertyChangedSignal('Value'):Connect(function()
                money = tostring(money_obj.Value)
                money_text.Text = 'money: ' .. money
            end)
            pro_bonus_obj:GetPropertyChangedSignal('Value'):Connect(function()
                pro_bonus = tostring(pro_bonus_obj.Value)
                pro_bonus_text.Text = 'pro bonus: ' .. pro_bonus .. '%'
            end)
            task.spawn(function()
                join_date = PlayerData:WaitForChild('JoinDate', 2)

                if join_date ~= nil then
                    join_date = DateTime.fromUnixTimestamp(join_date.Value):FormatUniversalTime('DD MMM YYYY, ddd, hh:mm:ss.SSS A UTC', 'en-us')
                    join_date_text.Text = 'join date: ' .. join_date
                else
                    join_date_text.Text = 'join date: no data (old gen acc)'
                end
            end)
            task.spawn(function()
                event_unlocks = PlayerData:WaitForChild('EventUnlocks', 5)

                if not event_unlocks then
                    return
                end

                local internal = function()
                    local unlocks = ''

                    for _, accessory in ipairs(event_unlocks:GetChildren())do
                        unlocks = unlocks .. accessory.Name .. ', '
                    end

                    unlocks = string.sub(unlocks, 0, -3)
                    event_unlocks_text.Text = 'event unlocks: ' .. unlocks
                end

                internal()

                local listener

                listener = event_unlocks.ChildAdded:Connect(internal)

                task.wait(2)
                listener:Disconnect()
            end)
            task.spawn(function()
                sw_data = PlayerData:WaitForChild('SWData', 5)

                if not sw_data then
                    return
                end

                sw_data = tools.WaitForChildren(sw_data, 'Wins', 'Losses', 'Kills', 'Deaths', 'Rating')

                for index, data in ipairs(sw_data)do
                    sw_data[index] = tostring(data.Value)
                end

                shadow_war_text.Text = 'shadow war: wins - ' .. sw_data[1] .. ', losses - ' .. sw_data[2] .. ', kills - ' .. sw_data[3] .. ', deaths - ' .. sw_data[4] .. ', rating - ' .. sw_data[5]
            end)

            local player_status = player:WaitForChild('Status', math.huge)
            local player_stats = player_status:WaitForChild('Stats', math.huge)
            local stats_objs = tools.WaitForChildren(player_stats, 'Kills', 'Headshots', 'Knockouts', 'Holdups', 'ShotsFired', 'ShotsHit')

            for index = 1, 6, 1 do
                block1[index].Text = tostring(stats_objs[index].Value)

                stats_objs[index]:GetPropertyChangedSignal('Value'):Connect(function(
                )
                    block1[index].Text = tostring(stats_objs[index].Value)
                end)
            end

            local flags = Level:WaitForChild('Flags', math.huge):WaitForChild(name, math.huge)

            flags = tools.WaitForChildren(flags, 'Armed', 'Disguise', 'Intimidate', 'Suppressed', 'Suspicious', 'Threat')

            for index = 1, 6, 1 do
                if index ~= 6 then
                    block2[index].Text = tostring(tools.ConvertBool(flags[index].Value))

                    flags[index]:GetPropertyChangedSignal('Value'):Connect(function(
                    )
                        block2[index].Text = tostring(tools.ConvertBool(flags[index].Value))
                    end)
                else
                    block2[index].Text = tostring(flags[index].Value)

                    flags[index]:GetPropertyChangedSignal('Value'):Connect(function(
                    )
                        block2[index].Text = tostring(flags[index].Value)
                    end)
                end
            end

            local flags2 = Level:WaitForChild('Flags', math.huge):WaitForChild(name, math.huge)
            local trespassing = flags2:WaitForChild('Trespassing', math.huge)

            block3[1].Text = tostring(tools.ConvertBool(trespassing.Value))

            trespassing:GetPropertyChangedSignal('Value'):Connect(function()
                block3[1].Text = tostring(tools.ConvertBool(trespassing.Value))
            end)

            local trespass_detect = flags2:WaitForChild('TrespassDetect', math.huge)

            block3[2].Text = tostring(tools.ConvertBool(trespass_detect.Value ~= nil))

            trespass_detect:GetPropertyChangedSignal('Value'):Connect(function()
                block3[2].Text = tostring(tools.ConvertBool(trespass_detect.Value ~= nil))
            end)

            local final_warning = trespass_detect:WaitForChild('Final', math.huge)

            block3[3].Text = tostring(tools.ConvertBool(final_warning.Value))

            final_warning:GetPropertyChangedSignal('Value'):Connect(function()
                block3[3].Text = tostring(tools.ConvertBool(final_warning.Value))
            end)

            local current_zone = flags2:WaitForChild('Zone', math.huge)

            block3[4].Text = current_zone.Value

            current_zone:GetPropertyChangedSignal('Value'):Connect(function()
                block3[4].Text = current_zone.Value
            end)

            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild('Humanoid', 5)
            local char_health = tostring(humanoid.Health)
            local char_max_health = tostring(humanoid.MaxHealth)

            health_value.Text = char_health .. '/' .. char_max_health

            humanoid:GetPropertyChangedSignal('Health'):Connect(function()
                char_health = tostring(tools.RoundNumber(humanoid.Health))
                health_value.Text = char_health .. '/' .. char_max_health

                local x_scale = humanoid.Health / humanoid.MaxHealth

                health.Size = UDim2.fromScale(x_scale > 1 and 1 or x_scale, 1)
            end)
            humanoid:GetPropertyChangedSignal('MaxHealth'):Connect(function()
                char_health = tostring(humanoid.Health)
                char_max_health = tostring(humanoid.MaxHealth)
                health_value.Text = char_health .. '/' .. char_max_health
            end)
        end
        info_panel.Render = function()
            local panel_holder = Instance.new('Frame')

            panel_holder.BorderSizePixel = 0
            panel_holder.Size = UDim2.fromScale(0.336, 0.395)
            panel_holder.Position = UDim2.fromScale(0, 1)
            panel_holder.BackgroundColor3 = Color3.fromRGB(30, 31, 37)
            panel_holder.BackgroundTransparency = 0.15
            panel_holder.Parent = gui_util.gui_holder

            local is_opened = false

            UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode ~= Enum.KeyCode.Z or UserInputService:GetFocusedTextBox() ~= nil then
                    return
                end

                is_opened = not is_opened

                TweenService:Create(panel_holder, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0), {
                    Position = UDim2.fromScale(0, is_opened == true and 0.6060000061988831 or 1),
                }):Play()
            end)

            local content_holder = Instance.new('ScrollingFrame')

            content_holder.BorderSizePixel = 0
            content_holder.BackgroundTransparency = 1
            content_holder.Position = UDim2.fromScale(0.008, 0.018)
            content_holder.Size = UDim2.fromScale(0.981, 0.965)
            content_holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            content_holder.CanvasSize = UDim2.fromScale(0, 1)
            content_holder.ScrollBarThickness = 2
            content_holder.ScrollingDirection = Enum.ScrollingDirection.Y
            content_holder.Parent = panel_holder
            info_panel.content_holder = content_holder

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Padding = UDim.new(0.02, 0)
            UIListLayout.Parent = content_holder

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingRight = UDim.new(0.015, 0)
            UIPadding.Parent = content_holder

            local decorative_label = Instance.new('TextLabel')

            decorative_label.BackgroundTransparency = 1
            decorative_label.TextColor3 = Color3.fromRGB(255, 255, 255)
            decorative_label.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            decorative_label.Size = UDim2.fromScale(1, 0.031)
            decorative_label.Text = 'Deimos v2.0.0 - SERVER_ID [' .. game.JobId .. '] PLACE_VERSION [' .. game.PlaceVersion .. ']'
            decorative_label.TextScaled = true
            decorative_label.TextXAlignment = Enum.TextXAlignment.Left
            decorative_label.Parent = content_holder

            info_panel.AddSection('Mission Info')

            info_panel.ms_info = info_panel.CreateTable({
                {
                    ['FFM'] = '0',
                },
                {
                    ['loud started'] = 'no',
                },
                {
                    ['difficulty'] = '1',
                },
                {
                    ['no kills'] = 'yes',
                },
                {
                    ['start time'] = 'not started',
                },
                {
                    ['wave kills'] = 'N/A',
                },
                {
                    ['current wave'] = '0',
                },
                {
                    ['wave state'] = 'not started',
                },
            })

            task.spawn(function()
                local FriendlyFire = ReplicatedStorage:WaitForChild('FriendlyFire', 5)

                if not FriendlyFire then
                    return
                end

                info_panel.ms_info[1].Text = tostring(FriendlyFire.Value)
            end)

            local difficulties = {
                'rookie',
                'professional',
                'operative',
                'elite',
                'legend',
            }
            local difficulty = GameState:WaitForChild('Difficulty', math.huge)

            while difficulty.Value == nil do
                task.wait()
            end

            info_panel.ms_info[3].Text = difficulty.Value == 0 and 'N/A' or difficulties[difficulty.Value]

            difficulty:GetPropertyChangedSignal('Value'):Connect(function()
                info_panel.ms_info[3].Text = difficulties[difficulty.Value]
            end)

            local no_kills = GameState:WaitForChild('NoKills', math.huge)

            info_panel.ms_info[4].Text = tostring(tools.ConvertBool(no_kills.Value))

            no_kills:GetPropertyChangedSignal('Value'):Connect(function()
                info_panel.ms_info[4].Text = tostring(tools.ConvertBool(no_kills.Value))
            end)

            local start_time = GameState:WaitForChild('Start', math.huge)

            if start_time.Value == 0 then
                local listener

                listener = start_time:GetPropertyChangedSignal('Value'):Connect(function(
                )
                    info_panel.ms_info[5].Text = tostring(tools.RoundNumber(start_time.Value)) .. 's'

                    listener:Disconnect()
                end)
            else
                info_panel.ms_info[5].Text = tostring(tools.RoundNumber(start_time.Value))
            end

            LoudStage:GetPropertyChangedSignal('Value'):Connect(function()
                info_panel.ms_info[2].Text = tools.ConvertBool(true)

                if LoudStage.Value == 1 then
                    info_panel.ms_info[8].Text = 'intermission'
                else
                    info_panel.ms_info[8].Text = 'in progress'
                    info_panel.ms_info[7].Text = '1'
                    info_panel.ms_info[6].Text = '0/' .. tostring(ms_data.wave_amt - 3) .. ' (' .. tostring(ms_data.wave_amt) .. ')'
                end
            end)
            info_panel.AddSection('Entity Count')

            info_panel.ent_count = info_panel.CreateTable({
                {
                    ['allies'] = '0',
                },
                {
                    ['workers'] = '0',
                },
                {
                    ['guards'] = '0',
                },
                {
                    ['specials'] = '0',
                },
                {
                    ['civilians'] = '0',
                },
                {
                    ['enemies'] = '0',
                },
                {
                    ['snipers'] = '0',
                },
                {
                    ['all npcs'] = '0',
                },
                {
                    ['players'] = '1',
                },
            })
            info_panel.players_count_text = info_panel.ent_count[9]

            info_panel.AddSection('Players Info')

            for _, player in ipairs(Players:GetPlayers())do
                info_panel.players_count = info_panel.players_count + 1

                task.spawn(info_panel.AddPlayerInfo, player)
            end

            info_panel.players_count_text.Text = tostring(info_panel.players_count)

            Players.PlayerAdded:Connect(function(player)
                info_panel.players_count = info_panel.players_count + 1
                info_panel.players_count_text.Text = tostring(info_panel.players_count)

                task.spawn(info_panel.AddPlayerInfo, player)
            end)
            Players.PlayerRemoving:Connect(function()
                info_panel.players_count = info_panel.players_count - 1
                info_panel.players_count_text.Text = tostring(info_panel.players_count)
            end)
        end

        return info_panel
    end
    function __DARKLUA_BUNDLE_MODULES.k()
        local RunService = game:GetService('RunService')
        local Players = game:GetService('Players')
        local ReplicatedStorage = game:GetService('ReplicatedStorage')

        workspace.FallenPartsDestroyHeight = -5E4

        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local ms_data = __DARKLUA_BUNDLE_MODULES.load('i')
        local info_panel = __DARKLUA_BUNDLE_MODULES.load('j')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local rmts_mgr = __DARKLUA_BUNDLE_MODULES.load('h')
        local GetRemote = rmts_mgr.GetRemote
        local LocalPlayer = Players.LocalPlayer
        local PlayerAttachment = nil
        local Mouse = LocalPlayer:GetMouse()
        local Level = game.Workspace:WaitForChild('Level', math.huge)

        Level:WaitForChild('GroundWeps', math.huge)

        local Actors = Level:WaitForChild('Actors', math.huge)
        local ESP = Actors:WaitForChild('ESP', math.huge)
        local Triggers = Level:WaitForChild('Triggers', math.huge)
        local SnipersSpots = Triggers:FindFirstChild('Snipers')
        local SniperPos = {}

        if SnipersSpots ~= nil then
            for _, spot in ipairs(SnipersSpots:GetChildren())do
                table.insert(SniperPos, spot.Position)
            end
        end

        local SniperSpotsCount = #SniperPos
        local npc_mgr = {}
        local ent_count = info_panel.ent_count

        npc_mgr.wave_kills = 0
        npc_mgr.wave_in_progress = false
        npc_mgr.wave = 0
        npc_mgr.enemy_spawned = false

        local GameState = ReplicatedStorage:WaitForChild('GameState', math.huge)
        local LoudStage = GameState:WaitForChild('Stage', math.huge)
        local Difficulty = GameState:WaitForChild('Difficulty', math.huge)

        LoudStage:GetPropertyChangedSignal('Value'):Connect(function()
            npc_mgr.wave = 1
            npc_mgr.wave_in_progress = true
        end)

        npc_mgr.npcs_data = {
            civilians = {
                npcs = {},
                count = 0,
                count_text = ent_count[5],
            },
            allies = {
                npcs = {},
                count = 0,
                count_text = ent_count[1],
            },
            workers = {
                npcs = {},
                count = 0,
                count_text = ent_count[2],
            },
            guards = {
                npcs = {},
                count = 0,
                count_text = ent_count[3],
            },
            specials = {
                npcs = {},
                count = 0,
                count_text = ent_count[4],
            },
            enemies = {
                npcs = {},
                count = 0,
                count_text = ent_count[6],
            },
            snipers = {
                npcs = {},
                count = 0,
                count_text = ent_count[7],
            },
            all = {
                npcs = {},
                count = 0,
                count_text = ent_count[8],
            },
        }
        cache.npcs_data = npc_mgr.npcs_data
        npc_mgr.aliases = {
            c = npc_mgr.npcs_data.civilians.npcs,
            a = npc_mgr.npcs_data.allies.npcs,
            w = npc_mgr.npcs_data.workers.npcs,
            g = npc_mgr.npcs_data.guards.npcs,
            s = npc_mgr.npcs_data.specials.npcs,
            e = npc_mgr.npcs_data.enemies.npcs,
            sp = npc_mgr.npcs_data.snipers.npcs,
            all = npc_mgr.npcs_data.all.npcs,
        }
        npc_mgr.cache = {torsos = {}}
        npc_mgr.AssignTeam = function(npc, team, data)
            local old_data = npc_mgr.npcs_data['all'].npcs[npc]

            if old_data ~= nil then
                local old_team = old_data.team

                npc_mgr.npcs_data[old_team].npcs[npc] = nil

                do
                    local __DARKLUA_VAR = npc_mgr.npcs_data[old_team]

                    __DARKLUA_VAR.count = __DARKLUA_VAR.count - 1
                end

                npc_mgr.npcs_data[old_team].count_text.Text = tostring(npc_mgr.npcs_data[old_team].count)
                old_data.team = team
            else
                data.team = team
                npc_mgr.npcs_data['all'].npcs[npc] = data

                do
                    local __DARKLUA_VAR = npc_mgr.npcs_data['all']

                    __DARKLUA_VAR.count = __DARKLUA_VAR.count + 1
                end

                npc_mgr.npcs_data['all'].count_text.Text = tostring(npc_mgr.npcs_data['all'].count)
            end

            npc_mgr.npcs_data[team].npcs[npc] = data

            do
                local __DARKLUA_VAR = npc_mgr.npcs_data[team]

                __DARKLUA_VAR.count = __DARKLUA_VAR.count + 1
            end

            npc_mgr.npcs_data[team].count_text.Text = tostring(npc_mgr.npcs_data[team].count)
            npc.Parent = ESP[team]
        end
        npc_mgr.GetNpcsFromTeamByAmt = function(team_aliase, amount)
            local npcs = {}
            local left = amount

            for npc, _ in pairs(npc_mgr.aliases[team_aliase])do
                table.insert(npcs, npc)

                left = left - 1

                if left == 0 then
                    break
                end
            end

            return amount == 1 and npcs[1] or npcs
        end
        npc_mgr.RemoveTeam = function(npc)
            local data = npc_mgr.npcs_data['all'].npcs[npc]

            if not data then
                return
            end
            if data.aegis_unit == false and npc_mgr.wave_in_progress == true then
                npc_mgr.wave_kills = npc_mgr.wave_kills + 1
                info_panel.ms_info[6].Text = tostring(npc_mgr.wave_kills) .. '/' .. tostring(ms_data.wave_amt - 3 - ms_data.police_count) .. ' (' .. tostring(ms_data.wave_amt) .. ')'

                if npc_mgr.wave_kills >= ms_data.wave_amt - 3 - ms_data.police_count then
                    npc_mgr.wave_in_progress = false

                    task.spawn(function()
                        tools.TimerInText(info_panel.ms_info[8], 'break: (', ms_data.wavebreak, ')')

                        npc_mgr.wave_kills = 0
                        npc_mgr.wave_in_progress = true
                        npc_mgr.wave = npc_mgr.wave + 1

                        if npc_mgr.wave > 1 and Difficulty.Value == 3 then
                            ms_data.wave_amt = (ms_data.current.fraction_type == 1 and 3 or 4) * 10 + ms_data.police_count
                        end

                        info_panel.ms_info[7].Text = tostring(npc_mgr.wave)
                        info_panel.ms_info[8].Text = 'in progress'
                        info_panel.ms_info[6].Text = '0/' .. tostring(ms_data.wave_amt - 3 - ms_data.police_count) .. ' (' .. tostring(ms_data.wave_amt) .. ')'
                    end)
                end
            end

            npc_mgr.npcs_data[data.team].npcs[npc] = nil

            do
                local __DARKLUA_VAR = npc_mgr.npcs_data[data.team]

                __DARKLUA_VAR.count = __DARKLUA_VAR.count - 1
            end

            npc_mgr.npcs_data[data.team].count_text.Text = tostring(npc_mgr.npcs_data[data.team].count)
            npc_mgr.npcs_data['all'].npcs[npc] = nil

            do
                local __DARKLUA_VAR0 = npc_mgr.npcs_data['all']

                __DARKLUA_VAR0.count = __DARKLUA_VAR0.count - 1
            end

            npc_mgr.npcs_data['all'].count_text.Text = tostring(npc_mgr.npcs_data['all'].count)

            if data.beam ~= nil then
                data.beam.Enabled = false
            end
        end
        npc_mgr.checks = {
            ObjectName = function(name)
                for team, data in pairs(ms_data.current.sort_flags)do
                    if data.name ~= nil and table.find(data.name, name.Value) then
                        return team
                    end
                end

                return nil
            end,
            IntelHolder = function()
                for team, data in pairs(ms_data.current.sort_flags)do
                    if data.has_intel ~= nil then
                        return team
                    end
                end

                return nil
            end,
            Intel = function(intel)
                for team, data in pairs(ms_data.current.sort_flags)do
                    if data.intel ~= nil and data.intel == intel.Value then
                        return team
                    end
                end

                return nil
            end,
            InventoryItem = function(inventory)
                local items = {}

                if inventory.ClassName == 'Folder' then
                    for _, item in ipairs(inventory:GetChildren())do
                        table.insert(items, item.Name)
                    end
                elseif inventory.ClassName == 'IntValue' then
                    table.insert(items, inventory.Name)
                end

                for team, data in pairs(ms_data.current.sort_flags)do
                    if data.inventory ~= nil and table.find(items, data.inventory) then
                        return team
                    end
                end

                return nil
            end,
            IsAegisUnit = function(name)
                return table.find({
                    'SC Shredder',
                    'Aegis Unit',
                    'Juggernaut',
                }, name) ~= nil
            end,
            IsFinal = function(team)
                return table.find(ms_data.current.sort_flags.final, team) ~= nil
            end,
        }
        npc_mgr.NoclipNPC = function(data, can_collide)
            if not data then
                return
            end

            local character = data.character

            if not character then
                return
            end

            local body_parts = tools.WaitForChildren(character, 'HumanoidRootPart', 'LowerTorso', 'UpperTorso', 'Head', 'HeadM', 'Hat')

            for _, body_part in ipairs(body_parts)do
                body_part.CanCollide = can_collide
            end
        end
        npc_mgr.MoveNPC = function(npc, pos)
            local data = npc_mgr.npcs_data['all'].npcs[npc]

            if data == nil or data.align_p == nil or data.align_o == nil then
                return
            end

            npc_mgr.NoclipNPC(data, false)

            data.align_p.Enabled = true
            data.align_p.Position = pos
            data.align_o.Enabled = true
            data.align_o.CFrame = CFrame.Angles(0, math.rad(math.random(0, 180)), 0)
        end
        npc_mgr.WaitForExactNpcPos = function(npc, pos, inaccuracy)
            local data = npc_mgr.npcs_data.all.npcs[npc]

            while data.hrp and ((data.hrp.Position - pos).Magnitude > inaccuracy or data.hrp.AssemblyLinearVelocity.Magnitude > 0.05) do
                task.wait()
            end
        end
        npc_mgr.WaitForRadioCallEnd = function(npc)
            local data = npc_mgr.npcs_data.all.npcs[npc]

            if data == nil then
                return
            end

            while data and data.character == nil do
                task.wait()
            end

            local radio = data.character:WaitForChild('Head', math.huge):WaitForChild('Investigate', math.huge):WaitForChild('Radio', math.huge)

            while radio and radio.Visible == true do
                task.wait()
            end
        end
        npc_mgr.VoidNPC = function(npc)
            npc_mgr.MoveNPC(npc, Vector3.new(0, -25E5, 0))
        end
        npc_mgr.HideNPC = function(npc)
            npc_mgr.MoveNPC(npc, ms_data.current.hide_spot)
        end
        npc_mgr.KillNPC = function(npc)
            local data = npc_mgr.npcs_data['all'].npcs[npc]

            data.humanoid.Health = 0
        end
        npc_mgr.ListenForDeath = function(npc, character, humanoid)
            local parent_listener

            parent_listener = npc:GetPropertyChangedSignal('Parent'):Connect(function(
            )
                if not npc or npc.Parent == nil or not npc.Parent:IsDescendantOf(Actors) then
                    parent_listener:Disconnect()
                    npc_mgr.RemoveTeam(npc)
                end
            end)

            local npc_child_listener

            npc_child_listener = npc.ChildRemoved:Connect(function(child)
                if child.Name == 'S97Shield' then
                    return
                end

                npc_child_listener:Disconnect()
                npc_mgr.RemoveTeam(npc)
            end)

            local char_child_listener

            char_child_listener = character.ChildRemoved:Connect(function(
                child
            )
                if child.Name == 'Bullet' or child.Name == 'Part' or child.Name == 'Hat' then
                    return
                end

                char_child_listener:Disconnect()
                npc_mgr.RemoveTeam(npc)
            end)

            local health_listener

            health_listener = humanoid:GetPropertyChangedSignal('Health'):Connect(function(
            )
                if humanoid.Health <= 0 then
                    health_listener:Disconnect()
                    npc_mgr.RemoveTeam(npc)
                end
            end)
        end
        npc_mgr.TorsosNoclipLoop = function()
            RunService.RenderStepped:Connect(function()
                for _, torso in ipairs(npc_mgr.cache.torsos)do
                    if torso.CanCollide == true then
                        torso.CanCollide = false
                    end
                end
            end)
        end
        npc_mgr.GetNPCOnRay = function()
            local ray = Ray.new(Mouse.UnitRay.Origin, Mouse.UnitRay.Direction * 1000)
            local IntersectionPart = game.Workspace:FindPartOnRayWithWhitelist(ray, {ESP})

            return IntersectionPart ~= nil and IntersectionPart.Parent.Parent or nil
        end
        npc_mgr.PostProcess = function(npc, team, data, sort)
            if team ~= nil then
                if team == 'enemies' then
                    data.aegis_unit = npc_mgr.checks.IsAegisUnit(data.name)

                    if cache.flags.rmshields == true then
                        task.spawn(function()
                            local shield = npc:WaitForChild('S97Shield', math.huge)

                            if shield == nil then
                                return
                            end

                            shield:Destroy()
                        end)
                    end
                    if game.PlaceId == 2951213182 and npc_mgr.enemy_spawned == false and data.name ~= 'Police' then
                        npc_mgr.enemy_spawned = true

                        for _, data in pairs(npc_mgr.npcs_data.enemies.npcs)do
                            if data.name == 'Police' then
                            end
                        end

                        info_panel.ms_info[6].Text = tostring(npc_mgr.wave_kills) .. '/' .. tostring(ms_data.wave_amt - 3 - ms_data.police_count) .. ' (' .. tostring(ms_data.wave_amt) .. ')'
                    end
                end

                npc_mgr.AssignTeam(npc, team, data)

                if cache.flags.killaura == true then
                    if cache.killaura_mode == 2 then
                        while data and data.humanoid and data.humanoid.Health > 0 do
                            tools.SimulateKnifeHit(data.humanoid, data.hrp, 1000)
                            task.wait(0.25)
                        end
                    else
                        if team ~= 'snipers' then
                            npc_mgr.KillNPC(npc)
                        end
                    end
                else
                    if team == 'enemies' and cache.flags.loud == true then
                        npc_mgr.MoveNPC(npc, Vector3.new(1e9, 1e9, 1e9))
                    end
                end
                if team == 'snipers' then
                    if cache.flags.spkill == true and (cache.flags.killaura == false or (cache.flags.killaura == true and cache.killaura_mode ~= 2)) then
                        task.spawn(function()
                            while data and data.humanoid and data.humanoid.Health > 0 do
                                tools.SimulateKnifeHit(data.humanoid, data.hrp, 1000)
                                task.wait(0.25)
                            end
                        end)
                    end
                end
                if team == 'allies' and cache.flags.allyimmunity == true then
                    task.spawn(function()
                        local Team = data.humanoid:WaitForChild('Team', math.huge)

                        if Team ~= nil then
                            Team.Value = 1
                        end
                    end)
                end
                if cache.flags.disarm == true and (table.find(cache.disarm, npc_mgr.aliases.all) or table.find(cache.disarm, npc_mgr.npcs_data[data.team].npcs)) then
                    local internal = function(data)
                        while data.weapon.Value ~= nil and data.weapon.Value.Parent ~= nil do
                            GetRemote('AuthItemMove'):InvokeServer(data.weapon.Value, data.weapon.Value.Parent, nil)
                            task.wait(0.05)
                        end
                    end

                    if data.weapon.Value == nil then
                        data.weapon:GetPropertyChangedSignal('Value'):Connect(function(
                        )
                            if data.weapon.Value ~= nil then
                                task.spawn(internal, data)
                            end
                        end)
                    else
                        task.spawn(internal, data)
                    end
                end
                if npc_mgr.checks.IsFinal(team) == true then
                    tools.StopTask(sort)
                end
            end
        end
        npc_mgr.SortNPC = function(npc)
            if npc.Name == 'Helo' or npc.Name == 'Turret' then
                return
            end

            local sort = coroutine.create(function(npc, sort)
                local data = {
                    team = nil,
                    humanoid = nil,
                    hrp = nil,
                    align_o = nil,
                    align_p = nil,
                    anti_fall = nil,
                    character = nil,
                    interact = nil,
                    name = nil,
                    beam = nil,
                    active = nil,
                }
                local character = tools.WaitWithCancel(npc, 'Character', 3, sort)
                local humanoid = tools.WaitWithCancel(character, 'Humanoid', 3, sort)
                local hrp = tools.WaitWithCancel(character, 'HumanoidRootPart', 3, sort)
                local attachment = tools.WaitWithCancel(hrp, 'RootRigAttachment', 3, sort)

                for _, body_part in ipairs({
                    'LowerTorso',
                    'UpperTorso',
                })do
                    tools.AsyncWait(character, body_part, 3, function()
                        table.insert(npc_mgr.cache.torsos, character[body_part])
                    end)
                end

                npc_mgr.ListenForDeath(npc, character, humanoid)

                data.character = character
                data.humanoid = humanoid
                data.anti_fall = humanoid.FallingDown:Connect(function()
                    humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                end)
                data.hrp = hrp
                data.align_p = tools.AddAlignP(attachment, hrp)
                data.align_o = tools.AddAlignO(attachment, hrp)
                data.beam = tools.AddBeam(hrp, attachment)

                if PlayerAttachment ~= nil then
                    data.beam.Attachment1 = PlayerAttachment
                end

                local interact = tools.WaitWithCancel(character, 'Interact', 3, sort)

                data.interact = interact

                local active = tools.WaitWithCancel(interact, 'Active', 3, sort)

                data.active = active

                if cache.flags.snaketouch == true then
                    data.active.Value = true
                end

                local object_name = tools.WaitWithCancel(interact, 'ObjectName', 3, sort)

                data.name = object_name.Value

                local Status = tools.WaitWithCancel(npc, 'Status', 5, sort)

                data.status = Status

                local Primary = tools.WaitWithCancel(Status, 'Primary', 3, sort)

                data.weapon = Primary

                if (object_name.Value == 'SWAT' or object_name.Value == 'TRU') and (game.PlaceId == 5862433299 or (SnipersSpots ~= nil and npc_mgr.npcs_data.snipers.count < SniperSpotsCount)) then
                    while Primary.Value == nil do
                        task.wait()
                    end

                    local Weapon = Primary.Value.Name

                    if Weapon == 'SwatSniper' then
                        npc_mgr.PostProcess(npc, 'snipers', data, sort)
                    end
                end

                local team = npc_mgr.checks.ObjectName(object_name)

                npc_mgr.PostProcess(npc, team, data, sort)

                if not cache.flags.killaura then
                    tools.AsyncWait(character, 'Inventory', 3, function()
                        local inventory = character.Inventory
                        local team = npc_mgr.checks.InventoryItem(inventory)

                        npc_mgr.PostProcess(npc, team, data, sort)
                        inventory.ChildAdded:Connect(function(item)
                            local team = npc_mgr.checks.InventoryItem(item)

                            npc_mgr.PostProcess(npc, team, data, sort)
                        end)
                    end)
                    tools.AsyncWait(interact, 'Intel', 3, function()
                        local intel = interact.Intel
                        local team = npc_mgr.checks.IntelHolder(intel)

                        npc_mgr.PostProcess(npc, team, data, sort)
                        intel.ChildAdded:Connect(function(certain_intel)
                            local team = npc_mgr.checks.Intel(intel)

                            npc_mgr.PostProcess(npc, team, data, sort)
                        end)
                    end)
                end
            end)

            coroutine.resume(sort, npc, sort)
        end

        task.spawn(function()
            local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local HRP = Character:WaitForChild('HumanoidRootPart', math.huge)

            PlayerAttachment = Instance.new('Attachment', HRP)

            for _, data in pairs(npc_mgr.npcs_data.all.npcs)do
                if data.team == 'snipers' then
                    continue
                end

                data.beam.Attachment1 = PlayerAttachment
            end
        end)

        return npc_mgr
    end
    function __DARKLUA_BUNDLE_MODULES.l()
        local Players = game:GetService('Players')
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer.PlayerGui
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local ms_data = __DARKLUA_BUNDLE_MODULES.load('i')
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local music = {}

        music.window = nil
        music.stealth = {
            dropdowns = {},
            pending = nil,
            conn = nil,
        }
        music.loud = {
            dropdowns = {},
            pending = nil,
            conn = nil,
        }
        music.always_loud = {
            pending = nil,
            conn = nil,
        }
        music.soundtracks = {
            ['Stealth Soundtracks'] = {
                ['The Setup - Solitary Quest (a)'] = 'rbxassetid://1841579249',
                ['The Lockup - Tension Mounts'] = 'rbxassetid://1838628050',
                ['The Blacksite - Breathless Suspense (b)'] = 'rbxassetid://1841578568',
                ['The Financier - Lock & Load'] = 'rbxassetid://1843470912',
                ['The Auction - Metro Pulse (a)'] = 'rbxassetid://1841578846',
                ['The Gala - Bass Motion'] = 'rbxassetid://1836764457',
                ['The Deposit - The Final Thrust (b)'] = 'rbxassetid://1841579381',
                ['The Withdrawal - Aftermath'] = 'rbxassetid://1843471196',
                ['The Lakehouse - Under Surveillance - Underscore'] = 'rbxassetid://1838617097',
                ['The Cache - Hard As Iron'] = 'rbxassetid://1841579363',
                ['The Scientist - Looking For A Clue - Underscore'] = 'rbxassetid://1838642607',
                ['The SCRS - Unusual Suspect'] = 'rbxassetid://1838641186',
                ['Black Dusk - Restless Tension (a)'] = 'rbxassetid://1841164575',
                ['The Killhouse - Covert Ops (a)'] = 'rbxassetid://1841694216',
                ['Concept - The Final Thrust (a)'] = 'rbxassetid://1841579325',
            },
            ['Loud Soundtracks'] = {
                ['The Lockup - Here It Comes'] = 'rbxassetid://1837807597',
                ['The Score - Pound For Pound - Underscore'] = 'rbxassetid://1842802303',
                ['The Score - Pound For Pound'] = 'rbxassetid://1842802203',
                ['The Blacksite - Snapped'] = 'rbxassetid://1842940253',
                ['The Financier - See You In Hell'] = 'rbxassetid://1837853076',
                ['The Deposit - High Velocity'] = 'rbxassetid://1839898469',
                ['The Withdrawal - Assault Complex'] = 'rbxassetid://1842940193',
                ['The Lakehouse - Complete The Mission'] = 'rbxassetid://1838627720',
                ['The Scientist - Lethal Conflict'] = 'rbxassetid://1842934882',
                ['The Scientist - Lethal Conflict - Underscore'] = 'rbxassetid://1842801894',
                ['The SCRS - Hijacked'] = 'rbxassetid://1842559618',
                ['Black Dusk - Full Force'] = 'rbxassetid://1842801942',
                ['The Killhouse - The Vault (a)'] = 'rbxassetid://1840083133',
                ['The Killhouse - No More Time (a)'] = 'rbxassetid://1847027481',
            },
            ['Alternate Soundtracks'] = {
                ['The Lockup - Pushing Me Closer'] = 'rbxassetid://1836789312',
                ['The Score - Best Laid Plans - Alternative'] = 'rbxassetid://1836808611',
                ['The Score - Best Laid Plans'] = 'rbxassetid://1837025066',
                ['The Blacksite - Suicide Mission'] = 'rbxassetid://1837844069',
                ['The Financier - There Will Be Blood'] = 'rbxassetid://1843513001',
                ['The Deposit - Terminal Velocity'] = 'rbxassetid://1842802436',
                ['The Withdrawal - Pushing The Limits'] = 'rbxassetid://1838627011',
                ['The Lakehouse - Fight Or Flight'] = 'rbxassetid://1842940300',
                ['The Scientist - Phoenix Rising'] = 'rbxassetid://1837798316',
                ['The Scientist - Phoenix Rising - Drums And Bass'] = 'rbxassetid://1837798598',
                ['The SCRS - We Go Hard'] = 'rbxassetid://1842940420',
                ['Black Dusk - Victory Is Ours'] = 'rbxassetid://1842802498',
            },
            ['Removed Soundtracks'] = {
                ['The Killhouse - Chaos'] = 'rbxassetid://1843497734',
                ['The Financier - Mindwinder (b)'] = 'rbxassetid://1838075732',
                ['The Scientist - Riding High'] = 'rbxassetid://1837807484',
                ['The Scientist - Riding High - Drums And Bass'] = 'rbxassetid://1837807505',
                ['Halloween Hitlist 2020 - Ambience'] = 'rbxassetid://3097850155',
                ['Halloween Hitlist 2020 - Burning Action'] = 'rbxassetid://1838626744',
            },
        }
        music.Render = function()
            music.window = gui_util.CreateWindow('root@kali: /terminal/music')
            music.window.Position = UDim2.fromScale(0.067, 0.101)

            gui_util.MakeWindowDraggable(music.window)

            local content_holder = gui_util.AddContentHolder(music.window)

            gui_util.SetContentEnv(content_holder)
            gui_util.AddSection('General')
            gui_util.CreateToggle('Loud music is always alternative', function(
                is_enabled
            )
                if is_enabled == true then
                    local alt_music = ms_data.current.alt_music

                    if alt_music == nil then
                        return
                    end

                    tools.ClearTableConn(music.loud, 'conn')
                    tools.ClearTableTask(music.loud, 'pending')

                    music.always_loud.pending = tools.CreatePendingTask(function(
                    )
                        local loud = PlayerGui:WaitForChild('SpectateGui', math.huge):WaitForChild('Music', math.huge):WaitForChild('Loud', math.huge)

                        loud.SoundId = alt_music
                        music.always_loud.conn = loud:GetPropertyChangedSignal('SoundId'):Connect(function(
                        )
                            loud.SoundId = alt_music
                        end)
                    end)
                else
                    tools.ClearTableConn(music.always_loud, 'conn')
                    tools.ClearTableTask(music.always_loud, 'pending')
                end
            end)

            for i = 1, 2, 1 do
                local section = i == 1 and 'Change Stealth Music To:' or 'Change Loud Music To:'
                local music_type = i == 1 and 'stealth' or 'loud'
                local sound_instance = i == 1 and 'Stealth' or 'Loud'

                gui_util.AddSection(section)

                for dropdown_name, dropdown_data in pairs(music.soundtracks)do
                    local dropdown = gui_util.CreateDropdown(dropdown_name)

                    table.insert(music[music_type].dropdowns, dropdown)

                    for music_name, music_id in pairs(dropdown_data)do
                        gui_util.AddDropdownOption(dropdown, music_name, function(
                        )
                            for _, dropdown_data in ipairs(music[music_type].dropdowns)do
                                if dropdown_data ~= dropdown then
                                    dropdown_data:ClearChoice()
                                end
                            end

                            tools.ClearTableConn(music[music_type], 'conn')
                            tools.ClearTableTask(music[music_type], 'pending')

                            if music_type == 'loud' then
                                tools.ClearTableConn(music.always_loud, 'conn')
                                tools.ClearTableTask(music.always_loud, 'pending')
                            end

                            music[music_type].pending = tools.CreatePendingTask(function(
                            )
                                local sound = PlayerGui:WaitForChild('SpectateGui', math.huge):WaitForChild('Music', math.huge):WaitForChild(sound_instance, math.huge)

                                sound.SoundId = music_id
                                music[music_type].conn = sound:GetPropertyChangedSignal('SoundId'):Connect(function(
                                )
                                    sound.SoundId = music_id
                                end)
                            end)
                        end)
                    end

                    dropdown.ApplyVerticalFlex()
                end

                gui_util.CreateInput('Custom Music ID', 'ID', function(ID)
                    for _, dropdown_data in ipairs(music[music_type].dropdowns)do
                        dropdown_data:ClearChoice()
                    end

                    tools.ClearTableConn(music[music_type], 'conn')
                    tools.ClearTableTask(music[music_type], 'pending')

                    music[music_type].pending = tools.CreatePendingTask(function(
                    )
                        local sound = PlayerGui:WaitForChild('SpectateGui', math.huge):WaitForChild('Music', math.huge):WaitForChild(sound_instance, math.huge)

                        sound.SoundId = 'rbxassetid://' .. ID
                        music[music_type].conn = sound:GetPropertyChangedSignal('SoundId'):Connect(function(
                        )
                            sound.SoundId = 'rbxassetid://' .. ID
                        end)
                    end)
                end)
            end
        end

        return music
    end
    function __DARKLUA_BUNDLE_MODULES.m()
        local Players = game:GetService('Players')
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer.PlayerGui
        local PlayerData = LocalPlayer:WaitForChild('PlayerData', math.huge)
        local CharactersData = PlayerData:WaitForChild('Character', math.huge)
        local CharacterData = CharactersData:WaitForChild('Char' .. tostring(CharactersData.Value))
        local LobbyBase = PlayerGui:WaitForChild('LobbyGui', math.huge):WaitForChild('LobbyBase', math.huge)
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local rmts_mgr = __DARKLUA_BUNDLE_MODULES.load('h')
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local GetRemote = rmts_mgr.GetRemote
        local lobby = {}

        lobby.canJoinGame = nil
        lobby.mission_names = {
            {
                ['The Blacksite'] = '_Blacksite',
            },
            {
                ['The Financier'] = '_Financier',
            },
            {
                ['The Deposit'] = '_Deposit',
            },
            {
                ['The Lakehouse'] = '_Lakehouse',
            },
            {
                ['The Withdrawal'] = '_Withdrawal',
            },
            {
                ['The Scientist'] = '_Scientist',
            },
            {
                ['The SCRS'] = '_SCRS',
            },
            {
                ['Black Dusk'] = '_BlackDusk',
            },
            {
                ['The Killhouse'] = '_Killhouse',
            },
            {
                ['Concept'] = '_Concept',
            },
            {
                ['The Auction'] = '_Auction',
            },
            {
                ['The Gala'] = '_Gala',
            },
            {
                ['The Cache'] = '_Cache',
            },
            {
                ['The Setup'] = '_Setup',
            },
            {
                ['The Lockup'] = '_Lockup',
            },
            {
                ['The Score'] = '_Tuscon',
            },
            {
                ['"Mission"'] = '_Mission',
            },
            {
                ['Ironman Mode'] = '_Ironman',
            },
        }
        lobby.current_lobby_data = nil
        lobby.lobby_settings = {
            CharacterData,
            '_Deposit',
            1,
            false,
            1,
            1,
            4,
            false,
            1,
            false,
        }
        lobby.Render = function()
            lobby.window = gui_util.CreateWindow('root@kali: /terminal/music')
            lobby.window.Position = UDim2.fromScale(0.26, 0.509)

            gui_util.MakeWindowDraggable(lobby.window)

            local content_holder = gui_util.AddContentHolder(lobby.window)

            gui_util.SetContentEnv(content_holder)
            gui_util.AddSection('General')

            local toggle

            toggle = gui_util.CreateToggle('Show All Lobbies', function(
                is_enabled
            )
                if getsenv == nil or clonefunction == nil then
                    if is_enabled == true then
                        gui_util.SendNotification('Lobby', "Your executor doesn't supports this action.", 3)
                        toggle.Call()
                    end
                else
                    local env = getsenv(LobbyBase)

                    if lobby.canJoinGame == nil then
                        lobby.canJoinGame = clonefunction(env.canJoinGame)
                    end
                    if is_enabled == true then
                        env.canJoinGame = function(data)
                            data:WaitForChild('PlayerMax', math.huge)

                            return true
                        end
                    else
                        env.canJoinGame = lobby.canJoinGame
                    end

                    env.resetLobbyListCursor()
                end
            end)

            gui_util.AddSection('Lobby Settings')
            gui_util.CreateInput('Character', '1 - 12', function(character_num)
                local character_data = CharactersData:WaitForChild('Char' .. character_num, 0.5)

                if not character_data then
                    gui_util.SendNotification('Lobby', 'Make sure you specified a right character.', 3)

                    return
                end

                lobby.lobby_settings[1] = character_data
            end)

            local dropdown = gui_util.CreateDropdown('Mission Name')

            for _, mission_names in ipairs(lobby.mission_names)do
                for visual_name, real_name in pairs(mission_names)do
                    gui_util.AddDropdownOption(dropdown, visual_name, function()
                        lobby.lobby_settings[2] = real_name
                    end)
                end
            end

            dropdown.ApplyVerticalFlex()
            gui_util.CreateInput('Level Cap', 'number', function(level_cap)
                level_cap = tonumber(level_cap)

                if not level_cap or level_cap < 0 then
                    gui_util.SendNotification('Lobby', 'Level cap must be a positive integer.', 3)

                    return
                end

                lobby.lobby_settings[3] = level_cap
            end)
            gui_util.CreateToggle('Friends Only', function(is_enabled)
                lobby.lobby_settings[4] = is_enabled
            end)
            gui_util.CreateInput('Difficulty', '0 - 5', function(difficulty)
                difficulty = tonumber(difficulty)

                if not difficulty or (difficulty < 0 or difficulty > 5) then
                    gui_util.SendNotification('Lobby', 'Difficulty must be an integer in the range from 0 to 5.', 3)

                    return
                end

                lobby.lobby_settings[5] = difficulty
            end)
            gui_util.CreateInput('Lobby Type Image', '0 - 3', function(
                lobby_type_image
            )
                lobby_type_image = tonumber(lobby_type_image)

                if not lobby_type_image or (lobby_type_image < 0 or lobby_type_image > 3) then
                    gui_util.SendNotification('Lobby', 
[[Lobby type image must be an integer in the range from 0 to 3.]], 3)

                    return
                end

                lobby.lobby_settings[6] = lobby_type_image
            end)
            gui_util.CreateInput('Lobby Size', 'number', function(lobby_size)
                lobby_size = tonumber(lobby_size)

                if not lobby_size or lobby_size <= 0 then
                    gui_util.SendNotification('Lobby', 'Lobby size must be the positive integer more than 0.', 3)

                    return
                end

                lobby.lobby_settings[7] = lobby_size
            end)
            gui_util.CreateToggle('Speedrun Mode', function(is_enabled)
                lobby.lobby_settings[8] = is_enabled
            end)
            gui_util.CreateInput('Speedrun Seed', 'number', function(
                speedrun_seed
            )
                speedrun_seed = tonumber(speedrun_seed)

                if not speedrun_seed or speedrun_seed < 0 then
                    gui_util.SendNotification('Lobby', 'Speedrun seed must be a positive integer.', 3)

                    return
                end

                lobby.lobby_settings[9] = speedrun_seed
            end)
            gui_util.CreateToggle('Daily Challenge', function(is_enabled)
                lobby.lobby_settings[10] = is_enabled
            end)
            gui_util.AddSection('Manage Lobby')
            gui_util.CreateButton('Create The Lobby', '+ Add New', function()
                lobby.current_lobby_data = GetRemote('CreateLobby'):InvokeServer(unpack(lobby.lobby_settings))
            end)
            gui_util.CreateButton('Open Lobby Gui', 'Open', function()
                if lobby.current_lobby_data == nil then
                    return
                end
                if getsenv == nil then
                    gui_util.SendNotification('Lobby', "Your executor doesn't supports this action.", 3)
                else
                    local env = getsenv(LobbyBase)

                    env.optionsToLobby(true)
                    env.killGamepadLevelCapControls()
                    env.enterLobby(lobby.current_lobby_data)
                    env.putCharacterOnLobbyGui(PlayerGui:WaitForChild('LobbyGui', math.huge):WaitForChild('LobbyPlayers', math.huge):WaitForChild('MainPlayer', math.huge), lobby.lobby_settings[1])
                    env.getCodename(lobby.lobby_settings[1])
                    env.listToLobby()
                end
            end)
            gui_util.CreateButton('Start The Game', 'Start', function()
                GetRemote('StartGame'):FireServer()
            end)
            gui_util.CreateButton('Leave The Lobby', 'Leave', function()
                GetRemote('LeaveLobby'):FireServer()
            end)

            local plr_dropdown = gui_util.CreateDropdown('Kick Player')
            local lobby_players = {
                Crew1 = nil,
                Crew2 = nil,
                Crew3 = nil,
            }
            local internal = function(lobby_data)
                for _, teammate_spot in ipairs(tools.WaitForChildren(lobby_data, 'Crew1', 'Crew2', 'Crew3'))do
                    teammate_spot:GetPropertyChangedSignal('Value'):Connect(function(
                    )
                        if teammate_spot.Value ~= nil then
                            local label = teammate_spot.Value.Parent.Parent.Parent.Name .. ' [level: '
                            local char_data = tools.unjsonify(teammate_spot.Value.Value)
                            local exp = char_data.EXP
                            local level = tostring(math.floor(math.sqrt(tonumber(exp) / 320)))

                            if level == '0' then
                                level = '1'
                            end

                            label = label .. level .. ', classes: '

                            local classes = ' '

                            for _, perk in ipairs(char_data.PRK)do
                                if string.find(perk, 'Base') then
                                    perk = string.gsub(string.lower(perk), 'base', '')
                                    classes = classes.perk .. ', '
                                end
                            end

                            classes = string.sub(classes, 0, -3)
                            label = label .. classes .. ']'
                            lobby_players[teammate_spot.Name] = gui_util.AddDropdownOption(plr_dropdown, label, function(
                            )
                                GetRemote('KickPlayer'):FireServer(teammate_spot.Value)
                            end)
                        else
                            lobby_players[teammate_spot.Name]:Destroy()
                        end
                    end)
                    teammate_spot:GetPropertyChangedSignal('Parent'):Connect(function(
                    )
                        if teammate_spot.Parent == nil then
                            for spot, option in pairs(lobby_players)do
                                option:Destroy()

                                lobby_players[teammate_spot.Name] = nil
                            end

                            dropdown:ClearChoice()

                            lobby_players = {
                                Crew1 = nil,
                                Crew2 = nil,
                                Crew3 = nil,
                            }
                        end
                    end)
                end
            end
            local LobbyList = ReplicatedStorage:WaitForChild('Lobby', math.huge):WaitForChild('List', math.huge)
            local CurrentLobby = LobbyList:FindFirstChild(LocalPlayer.Name)

            if CurrentLobby then
                internal(CurrentLobby)
            end

            LobbyList.ChildAdded:Connect(function(NewLobby)
                if NewLobby.Name == LocalPlayer.Name then
                    internal(NewLobby)
                end
            end)
        end

        return lobby
    end
    function __DARKLUA_BUNDLE_MODULES.n()
        local TeleportService = game:GetService('TeleportService')
        local Players = game:GetService('Players')
        local LocalPlayer = Players.LocalPlayer
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local teleport = {}

        teleport.difficulty = 1
        teleport.window = nil
        teleport.places = {
            ['Story Missions'] = {
                ['The Blacksite'] = 3200010305,
                ['The Financier'] = 2797881676,
                ['The Deposit'] = 2625195454,
                ['The Lakehouse'] = 3590667014,
                ['The Withdrawal'] = 2951213182,
                ['The Scientist'] = 4518266946,
                ['The SCRS'] = 4661507759,
                ['The Black Dusk'] = 4768829954,
            },
            ['Expansion Missions'] = {
                ['The Auction'] = 4134003540,
                ['The Gala'] = 3925577908,
                ['The Cache'] = 4388762338,
                ['The Setup'] = 5071816792,
                ['The Lockup'] = 5188855685,
                ['The Score'] = 5862433299,
            },
            ['Extras'] = {
                ['The Killhouse'] = 2215221144,
                ['The Concept'] = 7799530284,
            },
            ['Story Cutscenes'] = {
                ['Black Dawn'] = 740584350,
                ['Halcyon'] = 1789049984,
                ['Rose'] = 2677301983,
                ['Ashes'] = 4980299165,
                ['Critical'] = 3217976952,
                ['Dedication'] = 3637958652,
                ['Retribution'] = 4582472402,
                ['Payoff'] = 2957989822,
                ['Jackdaw'] = 4980319824,
                ['Epilogue'] = 4980337923,
                ['Sunset'] = 4988643789,
            },
            ['Expansion Cutscenes'] = {
                ['Prelude'] = 5564290777,
                ['Take'] = 6214650900,
                ['Departure'] = 6214651226,
            },
            ['Miscellaneous'] = {
                ['Character Creation'] = 1169749759,
                ['Shadow War'] = 2981901025,
                ['PVP Elmination'] = 1169750464,
                ['PVP Deathmatch'] = 2048182775,
                ['PVE Arena'] = 2139531728,
                ['Halcyon Range'] = 2652896498,
                ['Ironman Final'] = 2500111229,
            },
        }
        teleport.Render = function()
            teleport.window = gui_util.CreateWindow('root@kali: /terminal/teleport')
            teleport.window.Position = UDim2.fromScale(0.067, 0.509)

            gui_util.MakeWindowDraggable(teleport.window)

            local content_holder = gui_util.AddContentHolder(teleport.window)

            gui_util.SetContentEnv(content_holder)
            gui_util.AddSection('Teleport To The Place')

            local Frame = gui_util.AddElementFrame()

            gui_util.AddElementLabel(Frame, 'Mission Difficulty (0 - 5)')
            gui_util.AddElementInput(Frame, '0 - 5', function(difficulty)
                teleport.difficulty = tonumber(difficulty)
            end)

            for dropdown_name, dropdown_data in pairs(teleport.places)do
                local dropdown = gui_util.CreateDropdown(dropdown_name)

                for place_name, place_id in pairs(dropdown_data)do
                    gui_util.AddDropdownOption(dropdown, place_name, function()
                        TeleportService:Teleport(place_id, LocalPlayer, {
                            Difficulty = teleport.difficulty,
                        })
                    end)
                end

                dropdown.ApplyVerticalFlex()
            end
        end

        return teleport
    end
    function __DARKLUA_BUNDLE_MODULES.o()
        local Players = game:GetService('Players')
        local Level = game.Workspace:WaitForChild('Level', math.huge)
        local Geometry = Level:WaitForChild('Geometry', math.huge)
        local Doors = Geometry:WaitForChild('Doors', math.huge)
        local GroundBags = Level:WaitForChild('GroundBags', math.huge)
        local GroundItems = Level:WaitForChild('GroundItems', math.huge)
        local GroundWeps = Level:WaitForChild('GroundWeps', math.huge)
        local Triggers = Level:WaitForChild('Triggers', math.huge)
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local esp_mgr = __DARKLUA_BUNDLE_MODULES.load('g')
        local obj_mgr = {}

        obj_mgr.bags = {}
        obj_mgr.items = {}
        obj_mgr.weapons = {}
        obj_mgr.lock_dirs = {}
        obj_mgr.players = {}
        obj_mgr.engineers = {}
        obj_mgr.stashers = {}
        obj_mgr.loud_triggers = {
            'DrillPosExpert',
            'DrillPosRookie',
            'Drill',
        }
        cache.players_data = obj_mgr.players
        obj_mgr.ProcessObject = function(obj, data)
            local base = obj:WaitForChild('Base', 3)

            if not base then
                return
            end

            local Attachment = Instance.new('Attachment')

            Attachment.Parent = base

            local obj_data = {
                align_o = tools.AddAlignO(Attachment, base),
                align_p = tools.AddAlignP(Attachment, base),
                base = base,
            }

            if data[3] == 'items' or data[3] == 'weapons' then
                obj_data.esp = esp_mgr.AddItemAdornment(base, data[3])
            end

            obj_data.align_o.Enabled = cache.flags[data[2] ]
            obj_data.align_p.Enabled = cache.flags[data[2] ]
            data[1][obj] = obj_data
        end
        obj_mgr.NoclipOBJ = function(obj, can_collide)
            for _, child in ipairs(obj:GetChildren())do
                if child:IsA('BasePart') == false then
                    continue
                end

                child.CanCollide = can_collide
            end
        end
        obj_mgr.ProcessDoor = function(door)
            local Interact = door:WaitForChild('Interact', 3)

            if not Interact then
                return
            end

            local LockDir = Interact:WaitForChild('LockDir', 3)

            if not LockDir or LockDir.Value == 0 then
                return
            end

            obj_mgr.lock_dirs[LockDir] = LockDir.Value

            if cache.flags.gclearance == true then
                task.spawn(function()
                    local chip_reader = door:WaitForChild('ChipReader', 1)

                    if chip_reader then
                        local interact = door.ChipReader:WaitForChild('Interact', math.huge)
                        local DisguiseNeeded = interact:WaitForChild('DisguiseNeeded', 1)

                        if DisguiseNeeded then
                            DisguiseNeeded:Destroy()
                        end
                    end
                end)
            end

            task.spawn(function()
                local sensors = door:WaitForChild('Sensors', 1)

                if sensors == nil then
                    return
                end

                local req_engineer = sensors:WaitForChild('Interact', math.huge):WaitForChild('ReqEngineer', math.huge)

                table.insert(obj_mgr.engineers, req_engineer)

                if cache.flags.unlockengi == true then
                    req_engineer.Name = 'ReqEngineer '
                end
            end)

            if cache.flags.opendoors == true then
                LockDir.Value = 0
            end
        end
        obj_mgr.ProcessPlayer = function(player)
            local data = {}

            data.character = player.Character or player.CharacterAdded:Wait()
            data.humanoid = data.character:WaitForChild('Humanoid', math.huge)
            data.head_collision = data.character:WaitForChild('HeadCollision', math.huge)

            if cache.weaponkey_cmds.teamheal == true then
                local cooldown = false
                local internal = function()
                    if cooldown == true then
                        return
                    end

                    local damage = tools.CalculateHealDamage(data)

                    cooldown = true

                    tools.SimulateKnifeHit(data.humanoid, data.head_collision, damage)
                    task.wait(0.15)

                    cooldown = false
                end

                internal()

                local listener = data.humanoid:GetPropertyChangedSignal('Health'):Connect(internal)

                table.insert(cache.conns.teamheal, listener)
            end

            data.armor = {
                AC = nil,
                AR = nil,
                ABH = nil,
                ABL = nil,
            }

            task.spawn(function()
                local armor = tools.WaitForChildren(data.humanoid, 'ArmorCap', 'ArmorBlockHigh', 'ArmorBlockLow', 'ArmorRating')

                data.AC = armor[1]
                data.ABH = armor[2]
                data.ABL = armor[3]
                data.AR = armor[4]
            end)

            data.tools = player:WaitForChild('Status', math.huge):WaitForChild('Tools', math.huge)
            data.weapons = player:WaitForChild('Status', math.huge):WaitForChild('Weapons', math.huge)
            obj_mgr.players[player] = data
        end

        for parent, data in pairs({
            [GroundBags] = {
                obj_mgr.bags,
                'loopbag',
                'bags',
            },
            [GroundItems] = {
                obj_mgr.items,
                'loopitem',
                'items',
            },
            [GroundWeps] = {
                obj_mgr.weapons,
                'loopwep',
                'weapons',
            },
        })do
            for _, obj in ipairs(parent:GetChildren())do
                task.spawn(obj_mgr.ProcessObject, obj, data)
            end

            parent.ChildAdded:Connect(function(obj)
                obj_mgr.NoclipOBJ(obj, not cache.flags[data[2] ])
                task.spawn(function()
                    local listener

                    listener = obj.ChildAdded:Connect(function(child)
                        if child:IsA('BasePart') == false then
                            return
                        end

                        child.CanCollide = not cache.flags[data[2] ]
                    end)

                    task.wait(1)
                    listener:Disconnect()
                end)

                local listener

                listener = obj:GetPropertyChangedSignal('Parent'):Connect(function(
                )
                    if obj.Parent == parent then
                        return
                    end

                    data[obj] = nil

                    listener:Disconnect()
                end)

                obj_mgr.ProcessObject(obj, data)
            end)
        end
        for _, door in ipairs(Doors:GetChildren())do
            task.spawn(obj_mgr.ProcessDoor, door)
        end

        Doors.ChildAdded:Connect(obj_mgr.ProcessDoor)

        for _, player in ipairs(Players:GetPlayers())do
            task.spawn(obj_mgr.ProcessPlayer, player)
        end

        Players.PlayerAdded:Connect(obj_mgr.ProcessPlayer)

        local DoorTamper = function(trigger)
            if trigger.Name ~= 'DoorTamper' then
                return
            end

            local interact = trigger:WaitForChild('Interact', 1)

            if not interact then
                return
            end

            local req_engineer = interact:WaitForChild('ReqEngineer', 1)

            if req_engineer ~= nil then
                table.insert(obj_mgr.engineers, req_engineer)

                if cache.flags.unlockengi == true then
                    req_engineer.Name = 'ReqEngineer '
                end
            end
        end

        for _, trigger in ipairs(Triggers:GetChildren())do
            task.spawn(DoorTamper, trigger)
        end

        Triggers.ChildAdded:Connect(DoorTamper)

        for _, obj in ipairs(Geometry:GetDescendants())do
            if obj.Name == 'BodyStash' then
                table.insert(obj_mgr.stashers, obj)
            end
        end

        Geometry.DescendantAdded:Connect(function(obj)
            if obj.Name == 'BodyStash' then
                table.insert(obj_mgr.stashers, obj)
            end
        end)

        return obj_mgr
    end
    function __DARKLUA_BUNDLE_MODULES.p()
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local npcs_mgr = __DARKLUA_BUNDLE_MODULES.load('k')
        local rmts_mgr = __DARKLUA_BUNDLE_MODULES.load('h')
        local Level = workspace:WaitForChild('Level', math.huge)
        local Geometry = Level:WaitForChild('Geometry', math.huge)
        local Triggers = Level:WaitForChild('Triggers', math.huge)
        local GroundItems = Level:WaitForChild('GroundItems', math.huge)
        local Doors = Geometry:WaitForChild('Doors', math.huge)
        local GameState = ReplicatedStorage:WaitForChild('GameState', math.huge)
        local Difficulty = GameState:WaitForChild('Difficulty', math.huge).Value
        local objassist_mgr = {}

        objassist_mgr[3200010305] = function()
            local cells_data = {
                ['A'] = {
                    drill = nil,
                    blowtorch = nil,
                    panel = nil,
                    triggers_area = Vector3.new(-60.943, 8.716, 67.282),
                    checked = false,
                },
                ['B'] = {
                    drill = nil,
                    blowtorch = nil,
                    panel = nil,
                    triggers_area = Vector3.new(-35.982, 18.717, 24.057),
                    checked = false,
                },
                ['C'] = {
                    drill = nil,
                    blowtorch = nil,
                    panel = nil,
                    triggers_area = Vector3.new(14.018, 8.715, 24.056),
                    checked = false,
                },
                ['D'] = {
                    drill = nil,
                    blowtorch = nil,
                    panel = nil,
                    triggers_area = Vector3.new(28.944, 8.715, 49.017),
                    checked = false,
                },
            }

            tools.ChildCounter(4, Geometry, function(obj)
                if obj.Name ~= 'CellScreen' then
                    return false
                end

                local ObjectName = obj:WaitForChild('Interact', math.huge):WaitForChild('ObjectName', math.huge).Value
                local PanelLetter = string.sub(ObjectName, 6, 6)

                cells_data[PanelLetter].panel = obj

                return true
            end)

            local windows_count = 4
            local panel_teleported = false

            tools.ChildCounter(8, Triggers, function(trigger)
                if not table.find({
                    'Drill',
                    'Blowtorch',
                }, trigger.Name) then
                    return false
                end

                local HalfTrigger = trigger:WaitForChild('HalfTrigger', 2)

                if not HalfTrigger then
                    return false
                end

                for letter, data in pairs(cells_data)do
                    if tools.ComparePositions(data.triggers_area, HalfTrigger.Position, 2) == true then
                        local name = trigger.Name == 'Drill' and 'drill' or 'blowtorch'

                        if name == 'drill' then
                            trigger:GetPropertyChangedSignal('Parent'):Once(function(
                            )
                                windows_count = windows_count - 1
                                data.checked = true

                                if windows_count == 1 and Geometry:WaitForChild('RoseCellModel', 1) == nil then
                                    panel_teleported = true

                                    for _, data in pairs(cells_data)do
                                        if data.checked == true then
                                            continue
                                        end

                                        data.panel.PrimaryPart = data.panel.Screen

                                        data.panel:SetPrimaryPartCFrame(CFrame.new(Vector3.new(
-9.792, 8.367, 66.436)) * CFrame.Angles(0, 0, math.rad(-90)))
                                    end
                                end
                            end)
                        end

                        data[name] = trigger

                        return true
                    end
                end

                return false
            end)

            local drill_start = CFrame.new(Vector3.new(-9.943, 8.333, 68.902))
            local blowtorch_start = CFrame.new(Vector3.new(-9.943, 7.167, 68.902))
            local trigger_offset = 0

            for _, letter in ipairs({
                'A',
                'B',
                'C',
                'D',
            })do
                for _, trigger in ipairs({
                    cells_data[letter].drill,
                    cells_data[letter].blowtorch,
                })do
                    trigger.PrimaryPart = trigger.HalfTrigger

                    local start_pos = trigger.Name == 'Drill' and drill_start or blowtorch_start

                    trigger:SetPrimaryPartCFrame((start_pos - Vector3.new(0, 0, trigger_offset)) * CFrame.Angles(0, math.rad(
-90), 0))
                end

                trigger_offset = trigger_offset + 1
            end

            local CutsceneTrigger = Geometry:WaitForChild('RoseCellModel', math.huge):WaitForChild('CutsceneTrigger', math.huge)

            if panel_teleported == false then
                for _, data in pairs(cells_data)do
                    if tools.ComparePositions(data.triggers_area, CutsceneTrigger.Position, 5) == true then
                        data.panel.PrimaryPart = data.panel.Screen

                        data.panel:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-9.792, 8.367, 66.436)) * CFrame.Angles(0, 0, math.rad(
-90)))

                        break
                    end
                end
            end

            local listener

            listener = rmts_mgr.GetRemote('ChangeStageTarget').OnClientEvent:Connect(function(
                _,
                stage_num,
                _,
                _
            )
                if stage_num ~= 3 then
                    return
                end

                listener:Disconnect()
                tools.FireTouchTrigger(CutsceneTrigger)
            end)

            tools.FireTouchTrigger(Triggers:WaitForChild('FindTrigger', math.huge))

            while npcs_mgr.npcs_data.allies.count == 0 do
                task.wait()
            end

            for npc, _ in pairs(npcs_mgr.npcs_data.allies.npcs)do
                npcs_mgr.MoveNPC(npc, Vector3.new(-10.703288078308105, 16.325841903686523, 55.9881591796875))
                npcs_mgr.WaitForExactNpcPos(npc, Vector3.new(-10.703288078308105, 16.325841903686523, 55.9881591796875), 0.075)

                local ExitDoor = Geometry:WaitForChild('ExitDoor', math.huge)
                local Hinge = ExitDoor:WaitForChild('Hinge', math.huge)

                while Hinge.Rotation.Y < 23 do
                    task.wait()
                end

                npcs_mgr.MoveNPC(npc, Vector3.new(-111.1818618774414, 28.858070373535156, 
-44.721500396728516))
            end
            for _, obj in ipairs(Geometry:GetChildren())do
                if not string.find(obj.Name, 'Room') or not obj:FindFirstChild('Computer') then
                    continue
                end

                local Computer = obj.Computer
                local Screen = Computer:WaitForChild('Screen', math.huge)

                for _, door in ipairs(Geometry.Doors:GetChildren())do
                    if not door:FindFirstChild('Center') or not tools.ExactPosBetweenVectors(Screen.Position, door.Center.Position, 23.4, 1) then
                        continue
                    end

                    door.PrimaryPart = door.Center

                    door:SetPrimaryPartCFrame(CFrame.new(-114.722, 29.898, 49.447) * CFrame.Angles(0, 0, 0))

                    break
                end

                Computer.PrimaryPart = Screen

                Computer:SetPrimaryPartCFrame(CFrame.new(-110.772, 29.123, 49.448) * CFrame.Angles(0, math.rad(0), 0))

                break
            end
        end
        objassist_mgr[2797881676] = function()
            local z_offset = 0
            local required_count = 0

            if Difficulty >= 4 then
                required_count = 3
            elseif Difficulty >= 2 and Difficulty <= 3 then
                required_count = 2
            else
                required_count = 1
            end

            tools.ChildCounter(required_count, Geometry, function(obj)
                if obj.Name ~= 'PowerBox' then
                    return false
                end

                local case = obj:WaitForChild('Case', math.huge)

                case:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 5
                obj.PrimaryPart = case:WaitForChild('BasePart', math.huge)

                obj:SetPrimaryPartCFrame(CFrame.new(-3.205, 5.9, -30.888 + z_offset) * CFrame.Angles(0, math.rad(90), 0))

                z_offset = z_offset + 2

                return true
            end)

            local HardDrive = GroundItems:WaitForChild('HardDrive', math.huge)
            local Data = HardDrive:WaitForChild('Data', math.huge)

            while HardDrive ~= nil do
                rmts_mgr.GetRemote('TryPickup'):Invoke(Data)
                task.wait(0.25)
            end
        end
        objassist_mgr[2625195454] = function()
            local ManagerComputer = Geometry:WaitForChild('ManagerComputer', math.huge)

            ManagerComputer.PrimaryPart = ManagerComputer:WaitForChild('Screen', math.huge)

            ManagerComputer:SetPrimaryPartCFrame(CFrame.new(209.09, 190.65, 115.679) * CFrame.Angles(0, math.rad(90), 0))

            ManagerComputer:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 2.5

            local AccComputers = Geometry:WaitForChild('AccComputers', math.huge)

            tools.WaitForChildWithIndex(AccComputers, 4)

            for _, computer in ipairs(AccComputers:GetChildren())do
                task.spawn(function()
                    if computer:WaitForChild('Interact', 3) ~= nil then
                        computer.PrimaryPart = computer:WaitForChild('Screen', math.huge)

                        computer:SetPrimaryPartCFrame(CFrame.new(206.19, 190.65, 115.679) * CFrame.Angles(0, math.rad(90), 0))
                    end
                end)
            end

            local SafeDoor = Geometry:WaitForChild('Safe', math.huge):WaitForChild('SafeDoor', math.huge)
            local Base = SafeDoor:WaitForChild('Base', math.huge)
            local safe_triggers = {}

            tools.ChildCounter(3, Triggers, function(trigger)
                if not table.find({
                    'Drill',
                    'Blowtorch',
                    'Safecrack',
                }, trigger.Name) then
                    return false
                end

                local HalfTrigger = trigger:WaitForChild('HalfTrigger', 2)

                if not HalfTrigger then
                    return false
                end
                if tools.ComparePositions(Base.Position, HalfTrigger.Position, 3) == true then
                    table.insert(safe_triggers, trigger)

                    return true
                end

                return false
            end)

            SafeDoor.PrimaryPart = Base

            SafeDoor:SetPrimaryPartCFrame(CFrame.new(203.454, 190.344, 115.579) * CFrame.Angles(0, math.rad(180), 0))

            for _, trigger in ipairs(safe_triggers)do
                trigger.PrimaryPart = trigger.HalfTrigger

                local cframe = nil

                if trigger.Name == 'Drill' then
                    cframe = CFrame.new(Vector3.new(202.623, 191.167, 115.298))
                elseif trigger.Name == 'Blowtorch' then
                    cframe = CFrame.new(Vector3.new(202.623, 190.487, 115.298))
                elseif trigger.Name == 'Safecrack' then
                    cframe = CFrame.new(Vector3.new(203.303, 191.167, 115.298))
                end

                cframe = cframe * CFrame.Angles(0, 0, 0)

                trigger:SetPrimaryPartCFrame(cframe)
            end

            task.spawn(function()
                local KeycardRed = GroundItems:WaitForChild('KeycardRed', math.huge)
                local Data = KeycardRed:WaitForChild('Data', math.huge)

                while KeycardRed.Parent ~= nil do
                    rmts_mgr.GetRemote('TryPickup'):Invoke(Data)
                    task.wait(0.25)
                end
            end)

            local VaultKeypad = Geometry:WaitForChild('VaultKeypad', math.huge)

            VaultKeypad:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 2
            VaultKeypad.PrimaryPart = VaultKeypad:WaitForChild('Union', math.huge)

            VaultKeypad:SetPrimaryPartCFrame(CFrame.new(209.94, 188.44, 115.559) * CFrame.Angles(0, 0, 0))

            local BoxLoc = nil
            local listener = rmts_mgr.GetRemote('ChangeStageTarget').OnClientEvent:Connect(function(
                _,
                stage_num,
                _,
                obj
            )
                if stage_num ~= 4 then
                    return
                end

                BoxLoc = obj
            end)
            local listener2 = rmts_mgr.GetRemote('AddStage').OnClientEvent:Connect(function(
                _,
                stage_num,
                _,
                obj
            )
                if stage_num ~= 4 then
                    return
                end

                BoxLoc = obj
            end)

            while BoxLoc == nil do
                task.wait()
            end

            listener:Disconnect()
            listener2:Disconnect()

            local BoxTriggers = {}

            tools.ChildCounter(2, Triggers, function(trigger)
                if not table.find({
                    'Drill',
                    'Lockpick',
                }, trigger.Name) then
                    return false
                end

                local HalfTrigger = trigger:WaitForChild('HalfTrigger', 2)

                if not HalfTrigger then
                    return false
                end
                if tools.ComparePositions(BoxLoc.Position, HalfTrigger.Position, 1.2) == true then
                    table.insert(BoxTriggers, trigger)

                    return true
                end

                return false
            end)

            for _, trigger in ipairs(BoxTriggers)do
                trigger.PrimaryPart = trigger.HalfTrigger

                local cframe = nil

                if trigger.Name == 'Drill' then
                    cframe = CFrame.new(Vector3.new(207.296, 188.5, 115.659))
                elseif trigger.Name == 'Lockpick' then
                    cframe = CFrame.new(Vector3.new(208.373, 188.5, 115.659))
                end

                cframe = cframe * CFrame.Angles(0, 0, 0)

                trigger:SetPrimaryPartCFrame(cframe)
            end

            local PhoenixStash = GroundItems:WaitForChild('PhoenixStash', math.huge)
            local Data = PhoenixStash:WaitForChild('Data', math.huge)

            while PhoenixStash ~= nil do
                rmts_mgr.GetRemote('TryPickup'):Invoke(Data)
                task.wait(0.25)
            end
        end
        objassist_mgr[2951213182] = function()
            for npc, _ in pairs(npcs_mgr.npcs_data.specials.npcs)do
                npcs_mgr.MoveNPC(npc, Vector3.new(40.61, 3.3, 42.009))
            end

            local ServerRoom = Geometry:WaitForChild('ServerRoom', math.huge)

            tools.FireTouchTrigger(ServerRoom:FindFirstChild('FindTrigger'))

            local Door = tools.WaitForChildWithIndex(Doors, 18)

            Door.PrimaryPart = Door:WaitForChild('Center', math.huge)

            Door:SetPrimaryPartCFrame(CFrame.new(28.69, 4.4, 98.687) * CFrame.Angles(0, math.rad(
-90), 0))

            Door:WaitForChild('Interact', math.huge):WaitForChild('LockDir', math.huge).Value = 0

            Door.Interact:GetPropertyChangedSignal('Value'):Connect(function()
                local Computer = ServerRoom:WaitForChild('Computer', math.huge)

                Computer.PrimaryPart = Computer:WaitForChild('Center', math.huge)

                Computer:SetPrimaryPartCFrame(CFrame.new(28.794, 5.047, 97.739) * CFrame.Angles(0, math.rad(90), 0))

                Computer:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 9
            end)

            local PowerBox = tools.WaitForChildWithIndex(Geometry, 1229)

            PowerBox:WaitForChild('InteractArea', math.huge).Name = 'InteractArea '
            PowerBox.PrimaryPart = PowerBox:WaitForChild('Case', math.huge):WaitForChild('BasePart', math.huge)

            PowerBox:SetPrimaryPartCFrame(CFrame.new(29.149, 4.897, 100.267) * CFrame.Angles(0, math.rad(90), 0))

            PowerBox:WaitForChild('InteractArea', math.huge):WaitForChild('Part', math.huge).CFrame = PowerBox.PrimaryPart.CFrame - Vector3.new(0.2, 0, 0)

            local Interact = PowerBox.InteractArea:WaitForChild('Interact', math.huge)
            local ObjectTip = Interact:WaitForChild('ObjectTip', math.huge)

            Interact:WaitForChild('Time', math.huge).Value = ObjectTip.Value == 'Hold [F] to inspect' and 4 or 8

            ObjectTip:GetPropertyChangedSignal('Value'):Once(function()
                Interact.Time.Value = Interact.ObjectTip.Value == 'Hold [F] to inspect' and 4 or 8
            end)
        end

        return objassist_mgr
    end
    function __DARKLUA_BUNDLE_MODULES.q()
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local npc_mgr = __DARKLUA_BUNDLE_MODULES.load('k')
        local rmts_mgr = __DARKLUA_BUNDLE_MODULES.load('h')
        local config = __DARKLUA_BUNDLE_MODULES.load('e').config.scr_settings

        __DARKLUA_BUNDLE_MODULES.load('c')

        local VirtualInputManager = game:GetService('VirtualInputManager')
        local RunService = game:GetService('RunService')
        local Players = game:GetService('Players')
        local UserInputService = game:GetService('UserInputService')
        local GuiService = game:GetService('GuiService')

        game:GetService('CoreGui')

        local TweenService = game:GetService('TweenService')
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local LocalPlayer = Players.LocalPlayer
        local PlayerGui = LocalPlayer.PlayerGui
        local Level = workspace:WaitForChild('Level', math.huge)
        local GroundItems = Level:WaitForChild('GroundItems', math.huge)
        local GroundBags = Level:WaitForChild('GroundBags', math.huge)
        local Geometry = Level:WaitForChild('Geometry', math.huge)

        Level:WaitForChild('Glass', math.huge)

        local Triggers = Level:WaitForChild('Triggers', math.huge)
        local EmulateInput

        EmulateInput = {
            StartHold = function(Key)
                VirtualInputManager:SendKeyEvent(true, Key, false, game.Workspace)

                EmulateInput.CurrentKeyHolding = Key
            end,
            StopHold = function(Key)
                VirtualInputManager:SendKeyEvent(false, Key, false, game.Workspace)

                EmulateInput.CurrentKeyHolding = nil
            end,
            Hold = function(Key, HoldTime)
                EmulateInput.CurrentKeyHolding = Key

                VirtualInputManager:SendKeyEvent(true, Key, false, game.Workspace)
                task.wait(HoldTime)
                VirtualInputManager:SendKeyEvent(false, Key, false, game.Workspace)

                EmulateInput.CurrentKeyHolding = nil
            end,
            Press = function(Key)
                EmulateInput.CurrentKeyHolding = Key

                VirtualInputManager:SendKeyEvent(true, Key, false, game.Workspace)
                task.wait(0.1)
                VirtualInputManager:SendKeyEvent(false, Key, false, game.Workspace)

                EmulateInput.CurrentKeyHolding = nil
            end,
            Kill = function()
                if EmulateInput.CurrentKeyHolding ~= nil then
                    EmulateInput.StopHold(EmulateInput.CurrentKeyHolding)

                    EmulateInput.CurrentKeyHolding = nil
                end
            end,
            CurrentKeyHolding = nil,
        }

        local af_util

        af_util = {}
        af_util.initted = false
        af_util.last_interaction_time = 0
        af_util.stick_connection = nil
        af_util.stick_npc_connection = nil
        af_util.textbox_focused = false
        af_util.scenario_thread = nil
        af_util.interaction_updated = true
        af_util.last_interact_state = false
        af_util.interacting = false
        af_util.action_completed = false
        af_util.bound = nil
        af_util.current_bound = 1

        local Camera = nil
        local Interact = nil
        local ObjectName = nil
        local ObjectTip1 = nil
        local ObjectTip2 = nil
        local CanMove = nil

        af_util.checks = {
            ArmorCheck = function()
                local Armor = af_util.Loadout:WaitForChild(tostring(af_util.Loadout.Value)):WaitForChild('Armor', math.huge)

                while Armor.Value == nil do
                    task.wait()
                end

                if Armor.Value ~= '' then
                    return false, 
[[ConditionError: please remove armor from loadout to autofarm this mission.]]
                end

                return true, nil
            end,
            ItemCheck = function(...)
                local required_items = {...}
                local items = {}
                local Gear = af_util.Loadout:WaitForChild(tostring(af_util.Loadout.Value)):WaitForChild('Gear', math.huge)

                for _, item in ipairs(Gear:GetChildren())do
                    table.insert(items, item.Name)
                end
                for _, item in ipairs(required_items)do
                    if not table.find(items, item) then
                        return false, 'ConditionError: ' .. item .. ' required to autofarm this mission.'
                    end
                end

                return true, nil
            end,
            WeaponCheck = function()
                local visible_weps = {
                    '480 MCS',
                    'CBR-C',
                    'CH-A',
                    'F57',
                    'MM20',
                    'S97',
                    'Sawblade',
                    'Thumper',
                }
                local CurrentLoadout = af_util.Loadout:WaitForChild(tostring(af_util.Loadout.Value))
                local found_suppressed = false

                for _, wep_pos in ipairs({
                    'Primary',
                    'Secondary',
                })do
                    local wep = CurrentLoadout:WaitForChild(wep_pos)

                    while wep.Value == nil do
                        task.wait()
                    end

                    if wep.Value == 0 then
                        continue
                    elseif wep.Value == -1 then
                        found_suppressed = true

                        continue
                    end

                    wep = af_util.Armory:WaitForChild('Slot' .. tostring(wep.Value))

                    if table.find(visible_weps, wep.Value) then
                        return false, 'ConditionError: only pistols are allowed in autofarm.'
                    end

                    local mods = wep:WaitForChild('Mods', math.huge)

                    while mods.Value == nil do
                        task.wait()
                    end

                    if string.find(mods.Value, 'Barrel_Suppressor') then
                        found_suppressed = true
                    end
                end

                if found_suppressed == false then
                    return false, 
[[ConditionError: please suppress at least one of weapons in your current loadout.]]
                end

                return true, nil
            end,
            ClassCheck = function(required_classes)
                local character_data = tools.unjsonify(af_util.character.Value)
                local needed_amt = #required_classes

                for _, perk in ipairs(character_data.PRK)do
                    if string.find(perk, 'Base') then
                        for _, class in ipairs(required_classes)do
                            if string.find(perk:lower(), class:lower()) then
                                needed_amt = needed_amt - 1

                                if needed_amt == 0 then
                                    return true, nil
                                end

                                continue
                            end
                        end
                    end
                end

                local c_error = 'ConditionError: '

                if needed_amt > 0 then
                    for _, class in ipairs(required_classes)do
                        c_error = c_error .. class .. ', '
                    end
                end

                c_error = string.gsub(c_error, ', $', '') .. ' class(es) required to autofarm this mission.'

                return false, c_error
            end,
        }
        af_util.Init = function(cmds, ValidateCommand)
            local PlayerData = LocalPlayer:WaitForChild('PlayerData', math.huge)

            af_util.Loadout = PlayerData:WaitForChild('Loadout', math.huge)

            while af_util.Loadout.Value == nil do
                task.wait()
            end

            af_util.Armory = PlayerData:WaitForChild('Armory', math.huge)

            local character = PlayerData:WaitForChild('Character', math.huge)

            while character.Value == nil do
                task.wait()
            end

            af_util.character = character:WaitForChild('Char' .. tostring(character.Value))

            while af_util.character == nil do
                task.wait()
            end

            for check, args in pairs(af_util.conditions[game.PlaceId])do
                local success, response = check(unpack(args))

                if success == false then
                    return response
                end
            end

            af_util.PressReadyButton()

            Camera = workspace.CurrentCamera
            Interact = PlayerGui:WaitForChild('Weapons', math.huge):WaitForChild('WeaponGui', math.huge):WaitForChild('Interact', math.huge)
            ObjectName = Interact:WaitForChild('ObjectName', math.huge)
            ObjectTip1 = Interact:WaitForChild('ObjectTip', math.huge)
            ObjectTip2 = Interact:WaitForChild('ObjectTip2', math.huge)
            CanMove = LocalPlayer:WaitForChild('Status', math.huge):WaitForChild('Inputs', math.huge):WaitForChild('CanMove', math.huge)
            af_util.cmds = cmds
            af_util.ValidateCommand = ValidateCommand
            af_util.mouse = LocalPlayer:GetMouse()
            af_util.character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            af_util.hrp = af_util.character:WaitForChild('HumanoidRootPart', math.huge)
            af_util.humanoid = af_util.character:WaitForChild('Humanoid', math.huge)
            af_util.spots = af_util.spots[game.PlaceId]
            af_util.platform = af_util.GetPlatform()
            af_util.interact_ignore_list = {
                af_util.character,
                Camera,
                Triggers:WaitForChild('VisionFiltered', math.huge),
            }

            local LoudStage = ReplicatedStorage:WaitForChild('GameState', math.huge):WaitForChild('Stage', math.huge)

            af_util.loud_listener = LoudStage:GetPropertyChangedSignal('Value'):Once(function(
            )
                if config.af_loud_behaviour == 'reset' then
                    af_util.health_listener:Disconnect()

                    af_util.humanoid.Health = -1

                    af_util.PressReplayButton()
                else
                    af_util.ValidateCommand('autofarm', 'autofarm')
                end
            end)
            af_util.health_listener = af_util.humanoid:GetPropertyChangedSignal('Health'):Connect(function(
            )
                if af_util.humanoid.Health <= 0 then
                    if af_util.loud_listener ~= nil and af_util.loud_listener.Connected == true then
                        af_util.loud_listener:Disconnect()
                    end

                    af_util.health_listener:Disconnect()
                    af_util.PressReplayButton()
                end
            end)
            af_util.target = PlayerGui:WaitForChild('Weapons', math.huge):WaitForChild('WeaponScript', math.huge):WaitForChild('InteractionTarget', math.huge)

            return nil
        end
        af_util.StickObjectToCamera = function(
            object,
            rotation,
            custom_x,
            custom_y,
            custom_z
        )
            if rotation == nil then
                rotation = CFrame.Angles(0, 0, 0)
            end

            af_util.UnstickObjectFromCamera()

            object.CanCollide = false
            af_util.obj_init_pos = object.CFrame
            af_util.sticked_obj = object

            local test = object.Size.Z / 2
            local offset = CFrame.new(custom_x or 0, object.Size.Y / 2 - 0.1 + (custom_y or 0), custom_z or (
-test - 0.5))

            af_util.stick_connection = RunService.PreRender:Connect(function()
                object.CFrame = Camera.CFrame * rotation * offset
            end)
        end
        af_util.UnstickObjectFromCamera = function()
            if af_util.stick_connection ~= nil and af_util.stick_connection.Connected == true then
                af_util.stick_connection:Disconnect()
            end

            af_util.stick_connection = nil

            if af_util.sticked_obj ~= nil then
                af_util.sticked_obj.CFrame = af_util.obj_init_pos
                af_util.sticked_obj = nil
                af_util.obj_init_pos = nil
            end
        end
        af_util.GetInteractableObject = function()
            local HitPart, HitPosition = workspace:FindPartOnRayWithIgnoreList(Ray.new(Camera.CFrame.Position, Camera.CFrame.LookVector * 7.5), af_util.interact_ignore_list)

            if HitPart and HitPart.Parent and (HitPosition - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < 8 then
                if (HitPart.Parent:FindFirstChild('Interact') and HitPart.Parent.Interact.Value) or HitPart.Parent:FindFirstChild('Data') then
                    return HitPart.Parent
                else
                    return nil
                end
            end

            return nil
        end
        af_util.CompareInteractableObjs = function(object)
            local current = af_util.GetInteractableObject()

            if object == nil or current == nil or object:IsDescendantOf(current) == false then
                return false
            else
                return true
            end
        end
        af_util.NpcInteract = function(args)
            local object_tip = (args.tip_type == nil or args.tip_type == 1) and ObjectTip1 or ObjectTip2

            af_util.StickNpcToCamera(args.npc)

            while tick() - af_util.last_interaction_time <= 0.25 do
                task.wait()
            end
            while ObjectName.Text ~= args.npc_name do
                task.wait()
            end

            local action, key = nil, nil

            while action == nil or key == nil do
                action, key = string.match(object_tip.Text, '^(%a+).*%[(%u)')

                RunService.RenderStepped:Wait()
            end

            key = Enum.KeyCode[key]

            af_util.WaitForNoFocusedTextboxes()

            if action == 'Hit' then
                while Interact:FindFirstChild('RingO') == nil do
                    EmulateInput.Press(key)
                end

                Interact.RingO:Destroy()
            elseif action == 'Hold' then
                while CanMove.Value == true and not Interact:FindFirstChild('RingO') do
                    EmulateInput.StartHold(key)
                    task.wait(0.5)

                    if CanMove.Value == false then
                        break
                    else
                        EmulateInput.StopHold(key)
                    end
                end

                Interact:WaitForChild('RingO', math.huge):Destroy()
                EmulateInput.StopHold(key)
            end

            af_util.UnstickNpcFromCamera()
        end
        af_util.NpcInteractt = function(args)
            local object_tip = (args.tip_type == nil or args.tip_type == 1) and ObjectTip1 or ObjectTip2

            af_util.StickNpcToCamera(args.npc)

            while tick() - af_util.last_interaction_time <= 0.25 do
                task.wait()
            end
            while ObjectName.Text ~= args.npc_name do
                task.wait()
            end

            local action, key = nil, nil

            while action == nil or key == nil do
                action, key = string.match(object_tip.Text, '^(%a+).*%[(%u)')

                RunService.RenderStepped:Wait()
            end

            key = Enum.KeyCode[key]

            af_util.WaitForNoFocusedTextboxes()

            local data = npc_mgr.npcs_data.all.npcs[args.npc]
            local interaction_loop, hooks = nil, nil
            local stop_loop = function()
                af_util.UnstickNpcFromCamera()

                for _, hook in ipairs(hooks)do
                    if hook.Connected == true then
                        hook:Disconnect()
                    end
                end

                pcall(function()
                    tools.StopTask(interaction_loop)
                end)
                EmulateInput.Kill()
            end

            hooks = {
                data.interact:GetPropertyChangedSignal('Value'):Connect(function(
                )
                    if data.interact.Value == false then
                        stop_loop()
                    end
                end),
            }
            interaction_loop = tools.CreatePendingTask(function()
                while true do
                    if action == 'Hit' then
                        while Interact:FindFirstChild('RingO') == nil do
                            EmulateInput.Press(key)
                        end

                        Interact.RingO:Destroy()
                    elseif action == 'Hold' then
                        while CanMove.Value == true and not Interact:FindFirstChild('RingO') do
                            EmulateInput.StartHold(key)
                            task.wait(0.5)

                            if CanMove.Value == false then
                                break
                            else
                                EmulateInput.StopHold(key)
                            end
                        end

                        Interact:WaitForChild('RingO', math.huge):Destroy()
                        EmulateInput.StopHold(key)
                    end
                    if args.no_interact_validation == true then
                        stop_loop()
                    end
                end
            end)

            while coroutine.status(interaction_loop) ~= 'dead' do
                task.wait()
            end

            af_util.UnstickNpcFromCamera()
        end
        af_util.ObjectInteract = function(args)
            local object_tip = (args.tip_type == nil or args.tip_type == 1) and ObjectTip1 or ObjectTip2
            local initial_trans = args.object.Transparency

            args.object.Transparency = 1

            local parent = args.object.Parent
            local _ = parent.Parent
            local interact = parent:WaitForChild('Interact', math.huge)
            local interact2 = parent:FindFirstChild('Interact2')

            while tick() - af_util.last_interaction_time <= 0.25 do
                task.wait()
            end

            local interaction_loop, hooks = nil, nil
            local stop_loop = function()
                af_util.UnstickObjectFromCamera()

                for _, hook in ipairs(hooks)do
                    if hook.Connected == true then
                        hook:Disconnect()
                    end
                end

                tools.StopTask(interaction_loop)
                EmulateInput.Kill()
            end

            hooks = {
                interact:GetPropertyChangedSignal('Value'):Connect(function()
                    if interact.Value == false then
                        stop_loop()
                    end
                end),
                (interact2 ~= nil and interact2:GetPropertyChangedSignal('Value'):Connect(function(
                )
                    if interact2.Value == false then
                        stop_loop()
                    end
                end) or nil),
                parent:GetPropertyChangedSignal('Parent'):Connect(function()
                    stop_loop()
                end),
                args.object:GetPropertyChangedSignal('Parent'):Connect(function()
                    stop_loop()
                end),
            }
            interaction_loop = tools.CreatePendingTask(function()
                while true do
                    af_util.StickObjectToCamera(args.object, args.object_rotation, args.rot_x, args.rot_y, args.rot_z)

                    while ObjectName.Text ~= args.object_name do
                        task.wait()
                    end

                    if args.object_tip ~= nil then
                        while object_tip.Text ~= args.object_tip do
                            task.wait()
                        end
                    end

                    local action, key = nil, nil

                    while action == nil or key == nil do
                        action, key = string.match(object_tip.Text, '^(%a+).*%[(%u)')

                        RunService.RenderStepped:Wait()
                    end

                    key = Enum.KeyCode[key]

                    while tick() - af_util.last_interaction_time <= 0.25 do
                        task.wait()
                    end

                    af_util.WaitForNoFocusedTextboxes()

                    if action == 'Hit' then
                        while Interact:FindFirstChild('RingO') == nil do
                            EmulateInput.Press(key)
                        end

                        af_util.UnstickObjectFromCamera()
                        Interact.RingO:Destroy()
                    elseif action == 'Hold' then
                        while CanMove.Value == true and not Interact:FindFirstChild('RingO') do
                            EmulateInput.StartHold(key)
                            task.wait(0.5)

                            if CanMove.Value == false then
                                break
                            else
                                EmulateInput.StopHold(key)
                            end
                        end

                        Interact:WaitForChild('RingO', math.huge):Destroy()
                        af_util.UnstickObjectFromCamera()
                        EmulateInput.StopHold(key)
                    end
                    if args.no_interact_validation == true then
                        stop_loop()
                    end
                end
            end)

            while coroutine.status(interaction_loop) ~= 'dead' do
                task.wait()
            end

            af_util.UnstickObjectFromCamera()

            args.object.Transparency = initial_trans
        end
        af_util.ObjectasfgInteract = function(args)
            local object_tip = (args.tip_type == nil or args.tip_type == 1) and ObjectTip1 or ObjectTip2
            local interact = args.object.Parent.Interact

            while tick() - af_util.last_interaction_time <= 0.25 do
                task.wait()
            end

            af_util.StickObjectToCamera(args.object, args.object_rotation, args.rot_x, args.rot_z)

            local completed = false

            while completed == false and args.object ~= nil and interact.Value == true do
                local interact_attempt

                interact_attempt = tools.CreatePendingTask(function()
                    while af_util.CompareInteractableObjs(args.object) == false and args.object ~= nil and interact.Value == true do
                        task.wait()
                    end

                    local conn

                    conn = RunService.RenderStepped:Connect(function()
                        if af_util.CompareInteractableObjs(args.object) == false then
                            conn:Disconnect()
                            af_util.UnstickObjectFromCamera()
                            EmulateInput.Kill()
                            tools.StopTask(interact_attempt)
                        end
                    end)

                    while af_util.target.Value == false do
                        task.wait()
                    end
                    while ObjectName.Text ~= args.object_name do
                        task.wait()
                    end

                    local action, key = nil, nil

                    while action == nil or key == nil do
                        action, key = string.match(object_tip.Text, '^(%a+).*%[(%u)')

                        RunService.RenderStepped:Wait()
                    end

                    key = Enum.KeyCode[key]

                    af_util.WaitForNoFocusedTextboxes()

                    if action == 'Hit' then
                        while Interact:FindFirstChild('RingO') == nil do
                            EmulateInput.Press(key)
                        end

                        if conn.Connected == true then
                            conn:Disconnect()
                        end

                        Interact.RingO:Destroy()
                    elseif action == 'Hold' then
                        while CanMove.Value == true and not Interact:FindFirstChild('RingO') do
                            EmulateInput.StartHold(key)
                            task.wait(0.5)

                            if CanMove.Value == false then
                                break
                            else
                                EmulateInput.StopHold(key)
                            end
                        end

                        Interact:WaitForChild('RingO', math.huge):Destroy()

                        if conn.Connected == true then
                            conn:Disconnect()
                        end

                        EmulateInput.StopHold(key)
                    end

                    af_util.UnstickObjectFromCamera()

                    while af_util.CompareInteractableObjs(args.object) == true do
                        task.wait()
                    end

                    completed = true
                    af_util.last_interaction_time = tick()
                end)

                while coroutine.status(interact_attempt) ~= 'dead' and args.object ~= nil and interact.Value == true do
                    task.wait()
                end

                task.wait()
            end
        end
        af_util.ObjectttInteract = function(args)
            local object_tip = (args.tip_type == nil or args.tip_type == 1) and ObjectTip1 or ObjectTip2

            while tick() - af_util.last_interaction_time <= 0.25 do
                task.wait()
            end

            af_util.StickObjectToCamera(args.object, args.object_rotation, args.rot_x, args.rot_z)

            local completed = false

            while completed == false do
                local interact_attempt

                interact_attempt = tools.CreatePendingTask(function()
                    local hooks

                    hooks = {
                        af_util.target:GetPropertyChangedSignal('Value'):Connect(function(
                        )
                            if af_util.target.Value == false then
                                EmulateInput.Kill()

                                for _, hook in ipairs(hooks)do
                                    if hook.Connected == true then
                                        hook:Disconnect()
                                    end
                                end

                                tools.StopTask(interact_attempt)
                            end
                        end),
                        ObjectName:GetPropertyChangedSignal('Text'):Connect(function(
                        )
                            if ObjectName.Text ~= args.object_name then
                                EmulateInput.Kill()

                                for _, hook in ipairs(hooks)do
                                    if hook.Connected == true then
                                        hook:Disconnect()
                                    end
                                end

                                tools.StopTask(interact_attempt)
                            end
                        end),
                        object_tip:GetPropertyChangedSignal('Text'):Connect(function(
                        )
                            local action, key = string.match(object_tip.Text, '^(%a+).*%[(%u)')

                            if (action == nil or key == nil) and not string.find(object_tip.Text, '...') then
                                EmulateInput.Kill()

                                for _, hook in ipairs(hooks)do
                                    if hook.Connected == true then
                                        hook:Disconnect()
                                    end
                                end

                                tools.StopTask(interact_attempt)
                            end
                        end),
                        UserInputService.TextBoxFocused:Connect(function()
                            EmulateInput.Kill()

                            for _, hook in ipairs(hooks)do
                                if hook.Connected == true then
                                    hook:Disconnect()
                                end
                            end

                            tools.StopTask(interact_attempt)
                        end),
                    }

                    while af_util.target.Value == false do
                        task.wait()
                    end
                    while ObjectName.Text ~= args.object_name do
                        task.wait()
                    end

                    local action, key = nil, nil

                    while action == nil or key == nil do
                        action, key = string.match(object_tip.Text, '^(%a+).*%[(%u)')

                        RunService.RenderStepped:Wait()
                    end

                    key = Enum.KeyCode[key]

                    af_util.WaitForNoFocusedTextboxes()

                    if action == 'Hit' then
                        while Interact:FindFirstChild('RingO') == nil do
                            EmulateInput.Press(key)
                        end

                        Interact.RingO:Destroy()
                    elseif action == 'Hold' then
                        while CanMove.Value == true and not Interact:FindFirstChild('RingO') do
                            EmulateInput.StartHold(key)
                            task.wait(0.5)

                            if CanMove.Value == false then
                                break
                            else
                                EmulateInput.StopHold(key)
                            end
                        end

                        Interact:WaitForChild('RingO', math.huge):Destroy()
                        EmulateInput.StopHold(key)
                    end

                    for _, hook in ipairs(hooks)do
                        if hook.Connected == true then
                            hook:Disconnect()
                        end
                    end

                    af_util.UnstickObjectFromCamera()

                    while af_util.target.Value == true do
                        task.wait()
                    end

                    completed = true
                    af_util.last_interaction_time = tick()
                end)

                while coroutine.status(interact_attempt) ~= 'dead' do
                    task.wait()
                end

                task.wait()
            end
        end
        af_util.ObjecttInteract = function(name, tip_type, wait_for_hide)
            if tip_type == nil then
                tip_type = 1
            end

            local tip = tip_type == 1 and ObjectTip1 or ObjectTip2

            while tick() - af_util.last_interaction_time <= 0.25 do
                task.wait()
            end
            while af_util.target.Value == false do
                while ObjectName.Text ~= name or string.find(tip.Text, '%[') == nil do
                    task.wait()
                end

                task.wait()
            end

            local action, key = nil, nil

            while action == nil or key == nil do
                action, key = string.match(tip.Text, '^(%a+).*%[(%u)')

                RunService.RenderStepped:Wait()
            end

            key = Enum.KeyCode[key]

            af_util.WaitForNoFocusedTextboxes()

            if action == 'Hit' then
                while Interact:FindFirstChild('RingO') == nil do
                    EmulateInput.Press(key)
                end

                Interact:WaitForChild('RingO', math.huge):Destroy()
                RunService.RenderStepped:Wait()
            elseif action == 'Hold' then
                while CanMove.Value == true and not Interact:FindFirstChild('RingO') do
                    if CanMove.Value == true then
                        EmulateInput.StartHold(key)
                    end

                    task.wait(0.5)

                    if CanMove.Value == false then
                    end

                    EmulateInput.StopHold(key)
                end

                Interact:WaitForChild('RingO', math.huge):Destroy()
                RunService.RenderStepped:Wait()
                EmulateInput.StopHold(key)
                task.wait()
            end
            if wait_for_hide == nil or wait_for_hide == true then
                while af_util.target.Value == true and ObjectName.Text == name do
                    task.wait()
                end
            end

            af_util.last_interaction_time = tick()
        end
        af_util.StickNpcToCamera = function(npc)
            af_util.stick_npc_connection = RunService.RenderStepped:Connect(function(
            )
                npc_mgr.MoveNPC(npc, (af_util.hrp.CFrame * CFrame.new(0, 1, -2)).Position)
            end)
        end
        af_util.UnstickNpcFromCamera = function()
            af_util.stick_npc_connection:Disconnect()
            RunService.RenderStepped:Wait()
        end
        af_util.SwitchCameraSubject = function(object, camera_cframe)
            Camera.CameraSubject = object
            Camera.CFrame = camera_cframe
        end
        af_util.ResetCameraSubject = function()
            Camera.CameraSubject = af_util.humanoid
        end
        af_util.RotateCamera = function(rotation)
            Camera.CFrame = rotation
        end
        af_util.WaitForNoFocusedTextboxes = function()
            while UserInputService:GetFocusedTextBox() ~= nil do
                task.wait()
            end
        end
        af_util.PressGuiButton = function(button)
            af_util.WaitForNoFocusedTextboxes()

            GuiService.SelectedObject = button

            task.wait(0.25)
            EmulateInput.Press(Enum.KeyCode.Return)
            task.wait(0.25)

            GuiService.SelectedObject = nil
        end
        af_util.PressReadyButton = function()
            if game.PlaceId == 4768829954 then
                while not PlayerGui:FindFirstChild('ReadyGui') do
                    rmts_mgr.GetRemote('MethodVote'):FireServer(1)
                    task.wait(1)
                end
            end

            local ReadyGui = PlayerGui:WaitForChild('ReadyGui', math.huge)
            local Loadout = ReadyGui:WaitForChild('Loadout', math.huge)

            while Loadout.Position.Y.Scale < 0.49 do
                task.wait()
            end

            local FailureAuthentication = ReadyGui:WaitForChild('FailureAuthentication', math.huge)
            local FA_Ready = FailureAuthentication:WaitForChild('Ready', math.huge)
            local Player1 = Loadout:WaitForChild('Player1', math.huge)
            local ReadyButton = Loadout:WaitForChild('Ready', math.huge)

            while Player1.BackgroundColor3 ~= Color3.new(0, 0.5, 0) do
                af_util.PressGuiButton(ReadyButton)
                task.wait(1)

                if FailureAuthentication.Position.Y.Scale < 1.25 then
                    while Player1.BackgroundColor3 ~= Color3.new(0, 0.5, 0) do
                        af_util.PressGuiButton(FA_Ready)
                    end
                end
            end
        end
        af_util.PressReplayButton = function()
            local CloseScreen = PlayerGui:WaitForChild('SpectateGui', math.huge):WaitForChild('CloseScreen', math.huge)
            local ReplayButton = CloseScreen:WaitForChild('VoteReplay', math.huge)

            while CloseScreen.Position.X.Scale < 0.49 do
                task.wait()
            end
            while ReplayButton.BackgroundColor3 ~= Color3.new(0.5, 0.5, 0.5) do
                af_util.PressGuiButton(ReplayButton)
            end

            ReplayButton:GetPropertyChangedSignal('BackgroundColor3'):Connect(function(
            )
                task.wait(1)

                while ReplayButton.BackgroundColor3 ~= Color3.new(0.5, 0.5, 0.5) do
                    af_util.PressGuiButton(ReplayButton)
                end
            end)
        end
        af_util.TweenObject = function(object, pos, required_time)
            local info = TweenInfo.new(required_time, Enum.EasingStyle.Linear)
            local goals = {
                CFrame = CFrame.new(pos),
            }
            local tween = TweenService:Create(object, info, goals)

            tween:Play()
            tween.Completed:Wait()
        end
        af_util.GetPlatform = function()
            local platform = workspace:FindFirstChild('Platform')

            if not platform then
                platform = Instance.new('Part')
                platform.Size = Vector3.new(4, 0.5, 4)
                platform.Anchored = true
                platform.Transparency = 1
                platform.Parent = workspace
            end

            return platform
        end
        af_util.MovePlayerByRoute = function(start, stop)
            local direction = (start - stop) < 0 and 'in' or 'back'
            local step = direction == 'in' and 1 or -1

            while af_util.spots == nil do
                task.wait()
            end

            for i = start, stop, step do
                if i == stop then
                    break
                end

                while af_util.spots[i] == nil or af_util.spots[i + step] == nil do
                    task.wait()
                end

                local current_spot = af_util.spots[i]
                local next_spot = af_util.spots[i + step]
                local ping = tools.GetPing() / 2
                local required_time = (current_spot.pos - next_spot.pos).Magnitude / (35 * (direction == 'in' and current_spot.mul or next_spot.mul))

                if ping > required_time then
                    required_time = ping
                end

                af_util.hrp.Anchored = false

                task.spawn(function()
                    af_util.TweenObject(af_util.hrp, next_spot.pos, required_time)
                end)
                af_util.TweenObject(af_util.platform, next_spot.pos - Vector3.new(0, 2.25, 0), required_time)
            end
        end
        af_util.SkipRoutePart = function(from, to, mul)
            from = af_util.spots[from]
            to = af_util.spots[to]

            local ping = tools.GetPing() / 2
            local required_time = (from.pos - to.pos).Magnitude / (35 * mul)

            if ping > required_time then
                required_time = ping
            end

            task.spawn(function()
                af_util.TweenObject(af_util.hrp, to.pos, required_time)
            end)
            af_util.TweenObject(af_util.platform, to.pos - Vector3.new(0, 2.5, 0), required_time)
        end
        af_util.ThrowBag = function()
            af_util.WaitForNoFocusedTextboxes()

            local Tools = LocalPlayer:WaitForChild('Status', math.huge):WaitForChild('Tools', math.huge)

            while Tools:FindFirstChild('Bag') do
                EmulateInput.Press(Enum.KeyCode.G)
            end
        end
        af_util.OpenDoor = function(door)
            if door:FindFirstChild('OpenDoor') then
            end

            while door:FindFirstChild('OpenDoor') == nil do
                af_util.ObjectInteract({
                    object_name = 'Door',
                    object = door.Center,
                })
            end
        end
        af_util.PullGunOut = function()
            local GunOut = PlayerGui:WaitForChild('Weapons', math.huge):WaitForChild('WeaponScript', math.huge):WaitForChild('GunOut', math.huge)

            while GunOut.Value == false do
                EmulateInput.Press(Enum.KeyCode.One)
                task.wait(1.5)
            end
        end
        af_util.HideGun = function()
            local GunOut = PlayerGui:WaitForChild('Weapons', math.huge):WaitForChild('WeaponScript', math.huge):WaitForChild('GunOut', math.huge)

            if GunOut.Value == true then
                EmulateInput.Press(Enum.KeyCode.One)
            end
        end
        af_util.Aim = function()
            rmts_mgr.GetRemote('SetAnim'):Fire('AimPosition', 1, 1, 0)
        end
        af_util.InterrogateNpc = function(npc)
            af_util.PullGunOut()
            af_util.Aim()

            local data = npc_mgr.npcs_data.all.npcs[npc]

            af_util.StickNpcToCamera(npc)
            af_util.ObjectInteract(data.interact:WaitForChild('ObjectName', math.huge).Value, 2)
            af_util.UnstickNpcFromCamera()
            af_util.HideGun()
        end
        af_util.TpToEscapeZone = function(escape_zone_pos)
            while true do
                af_util.hrp.CFrame = CFrame.new(escape_zone_pos)

                task.wait(0.05)

                af_util.hrp.Anchored = true

                task.wait(0.05)

                af_util.hrp.Anchored = false

                task.wait(0.05)
            end
        end
        af_util.FireTrigger = function(trigger)
            local saved_position = trigger.Position

            while trigger.Parent ~= nil do
                trigger.Position = af_util.hrp.Position

                task.wait(0.005)

                trigger.Position = saved_position
            end
        end
        af_util.HasScenario = function()
            return af_util.scenarios[game.PlaceId] ~= nil
        end
        af_util.PlayScenario = function()
            af_util.scenario_thread = tools.CreatePendingTask(af_util.scenarios[game.PlaceId])

            return af_util.scenario_thread
        end
        af_util.StopScenario = function()
            tools.ClearTableConn(af_util, 'loud_listener')
            tools.ClearTableConn(af_util, 'health_listener')
            tools.ClearTableTask(af_util, 'scenario_thread')
        end
        af_util.scenarios = {
            [3200010305] = function()
                af_util.ValidateCommand('void all, opendoors', 'autofarm')

                local Doors = Geometry:WaitForChild('Doors', math.huge):GetChildren()
                local AllTriggers = Triggers:GetChildren()

                af_util.MovePlayerByRoute(1, 10)
                af_util.ValidateCommand('void all', 'autofarm')

                local scrambler = AllTriggers[40]:WaitForChild('HalfTrigger', math.huge)

                af_util.ObjectInteract({
                    object = scrambler,
                    object_name = 'Door',
                })
                af_util.ValidateCommand('void all', 'autofarm')
                af_util.OpenDoor(Doors[1])
                af_util.MovePlayerByRoute(10, 13)
                af_util.OpenDoor(Doors[21])
                af_util.MovePlayerByRoute(13, 26)
                af_util.OpenDoor(Doors[4])
                af_util.MovePlayerByRoute(26, 29)
                af_util.MovePlayerByRoute(29, 32)
                af_util.OpenDoor(Doors[22])

                local killed_guards = false

                rmts_mgr.GetRemote('ClearStage').OnClientEvent:Once(function()
                    killed_guards = true
                end)
                af_util.ValidateCommand('void all, getitem drill', 'autofarm')

                while killed_guards == false do
                    task.wait()
                end

                af_util.MovePlayerByRoute(32, 37)

                local cells_data = {
                    ['A'] = {
                        drill = nil,
                        panel = nil,
                        triggers_area = Vector3.new(-60.943, 8.716, 67.282),
                        checked = false,
                    },
                    ['B'] = {
                        drill = nil,
                        panel = nil,
                        triggers_area = Vector3.new(-35.982, 18.717, 24.057),
                        checked = false,
                    },
                    ['C'] = {
                        drill = nil,
                        panel = nil,
                        triggers_area = Vector3.new(14.018, 8.715, 24.056),
                        checked = false,
                    },
                    ['D'] = {
                        drill = nil,
                        panel = nil,
                        triggers_area = Vector3.new(28.944, 8.715, 49.017),
                        checked = false,
                    },
                }

                tools.ChildCounter(4, Geometry, function(obj)
                    if obj.Name ~= 'CellScreen' then
                        return false
                    end

                    local ObjectName = obj:WaitForChild('Interact', math.huge):WaitForChild('ObjectName', math.huge).Value
                    local PanelLetter = string.sub(ObjectName, 6, 6)

                    cells_data[PanelLetter].panel = obj.Screen

                    return true
                end)
                tools.ChildCounter(4, Triggers, function(trigger)
                    if trigger.Name ~= 'Drill' then
                        return false
                    end

                    local HalfTrigger = trigger:WaitForChild('HalfTrigger', 2)

                    if not HalfTrigger then
                        return false
                    end

                    for letter, data in pairs(cells_data)do
                        if tools.ComparePositions(data.triggers_area, HalfTrigger.Position, 2) == true then
                            data.drill = HalfTrigger

                            return true
                        end
                    end

                    return false
                end)

                local cell_letter = nil
                local windows_left = 4
                local finished = false
                local rose_search, conn = nil, nil

                rose_search = tools.CreatePendingTask(function()
                    for letter, data in pairs(cells_data)do
                        data.checked = true

                        af_util.ObjectInteract({
                            object = data.drill,
                            object_name = 'Window',
                        })

                        windows_left = windows_left - 1

                        if windows_left == 1 then
                            finished = true

                            if conn.Connected == true then
                                conn:Disconnect()
                            end

                            break
                        end
                    end
                end)
                conn = Geometry.ChildAdded:Connect(function(child)
                    if child.Name == 'RoseCellModel' then
                        tools.StopTask(rose_search)
                        EmulateInput.Kill()
                        conn:Disconnect()

                        finished = true
                    end
                end)

                while finished == false do
                    task.wait()
                end

                local daisy_cell_model = Geometry:FindFirstChild('RoseCellModel')
                local cutscene_trigger = nil

                if daisy_cell_model ~= nil then
                    cutscene_trigger = daisy_cell_model:WaitForChild('CutsceneTrigger', math.huge)

                    for _, obj in ipairs(Geometry:GetChildren())do
                        if obj.Name ~= 'Part' or not obj:FindFirstChild('SurfaceGui') or tools.ComparePositions(cutscene_trigger.Position, obj.Position, 5) == false then
                            continue
                        end

                        cell_letter = obj.SurfaceGui.TextLabel.Text

                        break
                    end
                else
                    for letter, data in pairs(cells_data)do
                        if data.checked == true then
                            continue
                        end

                        cell_letter = letter

                        break
                    end
                end

                af_util.ObjectInteract({
                    object = cells_data[cell_letter].panel,
                    object_name = 'Cell ' .. cell_letter .. ' Control',
                    object_rotation = CFrame.Angles(math.rad(90), 0, math.rad(180)),
                    rot_x = 0,
                    rot_y = 2,
                    rot_z = 0,
                })
                af_util.MovePlayerByRoute(37, 34)
                af_util.SkipRoutePart(34, 38, 1)

                local cutscene_trigger = Geometry:WaitForChild('RoseCellModel', math.huge):WaitForChild('CutsceneTrigger', math.huge)

                af_util.FireTrigger(cutscene_trigger)

                while npc_mgr.npcs_data.allies.count < 1 do
                    task.wait()
                end

                local daisy = npc_mgr.GetNpcsFromTeamByAmt('a', 1)

                npc_mgr.MoveNPC(daisy, Vector3.new(-10.699, 16.325, 56.001))

                for _, obj in ipairs(Geometry:GetChildren())do
                    if obj.Name ~= 'ExitDoor' or tools.ComparePositions(obj.Base.Position, Vector3.new(
-1.8, 7.503, 29.899), 7) == false then
                        continue
                    end

                    while obj.Base.Rotation.Y < -20 do
                        task.wait()
                    end

                    break
                end

                af_util.MovePlayerByRoute(38, 41)
                af_util.OpenDoor(Doors[7])
                af_util.MovePlayerByRoute(41, 53)
                af_util.OpenDoor(Doors[8])
                af_util.MovePlayerByRoute(53, 57)
                task.spawn(function()
                    local find_trigger = Triggers:WaitForChild('FindTrigger', math.huge)

                    af_util.FireTrigger(find_trigger)
                end)

                local panel = Geometry.BlastDoorPanel.Screen

                af_util.ObjectInteract({
                    object = panel,
                    object_name = 'Blast Door',
                    object_rotation = CFrame.Angles(math.rad(90), 0, 0),
                    rot_x = 0,
                    rot_y = -1,
                    rot_z = 0,
                })

                while npc_mgr.npcs_data.specials.count < 1 do
                    task.wait()
                end

                local ryan_rossling = npc_mgr.GetNpcsFromTeamByAmt('s', 1)

                af_util.PullGunOut()
                af_util.Aim()
                af_util.NpcInteract({
                    npc = ryan_rossling,
                    npc_name = 'SC Commander',
                    tip_type = 2,
                    no_interact_validation = true,
                })
                af_util.ValidateCommand('kill s, void g', 'autofarm')

                for _, obj in ipairs(Geometry:GetChildren())do
                    if obj.ClassName ~= 'Model' or not string.find(obj.Name, 'Room') or not obj:FindFirstChild('Computer') then
                        continue
                    end

                    local computer = obj.Computer.Screen

                    for _, door in ipairs(Doors)do
                        if not door:FindFirstChild('Center') then
                            continue
                        end

                        local distance = (door.Center.Position - computer.Position).Magnitude

                        if distance > 23 and distance < 24 then
                            af_util.OpenDoor(door)

                            break
                        end
                    end

                    af_util.ObjectInteract({
                        object = computer,
                        object_name = 'Computer',
                    })

                    break
                end

                npc_mgr.MoveNPC(daisy, Vector3.new(-111.077, 28.722, -44.797))
                task.spawn(function()
                    af_util.TpToEscapeZone(Vector3.new(-93.21, 30.356, -126.656))
                end)
                af_util.PressReplayButton()
            end,
            [2625195454] = function()
                af_util.ValidateCommand('void all', 'autofarm')

                local plr_count = #Players:GetPlayers()

                if plr_count > 1 then
                    task.spawn(function()
                        af_util.MovePlayerByRoute(1, 2)
                        af_util.MovePlayerByRoute(2, 1)
                    end)
                end

                local manager_pc = Geometry:WaitForChild('ManagerComputer', math.huge):WaitForChild('Screen', math.huge)

                manager_pc.Parent:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 2.5

                local acc_pc = nil

                af_util.ObjectInteract({
                    object = manager_pc,
                    object_name = 'Computer',
                })

                for _, computer in ipairs(Geometry:WaitForChild('AccComputers', math.huge):GetChildren())do
                    if computer:FindFirstChild('Interact') == nil then
                        continue
                    end

                    acc_pc = computer.Screen

                    af_util.ObjectInteract({
                        object = acc_pc,
                        object_name = 'Computer',
                    })
                end

                local safe_door = Geometry:WaitForChild('Safe', math.huge):WaitForChild('SafeDoor', math.huge):WaitForChild('Base', math.huge)

                for _, trigger in ipairs(Triggers:GetChildren())do
                    if trigger.Name == 'Safecrack' and trigger:FindFirstChild('HalfTrigger') and tools.ComparePositions(safe_door.Position, trigger.HalfTrigger.Position, 3) == true then
                        af_util.ObjectInteract({
                            object = trigger.HalfTrigger,
                            object_name = 'Safe',
                        })

                        break
                    end
                end

                GroundItems:WaitForChild('KeycardRed', math.huge):WaitForChild('Data', math.huge)

                while GroundItems:FindFirstChild('KeycardRed') and task.wait(0.1) do
                    af_util.ValidateCommand('getitem keycardred', 'autofarm')
                end

                af_util.ObjectInteract({
                    object = manager_pc,
                    object_name = 'Computer',
                })

                local vault_keypad = Geometry:WaitForChild('VaultKeypad', math.huge):WaitForChild('Union', math.huge)

                vault_keypad.Parent:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 2

                af_util.ObjectInteract({
                    object = vault_keypad,
                    object_name = 'Keypad',
                })

                local BoxLoc = nil
                local listener = rmts_mgr.GetRemote('ChangeStageTarget').OnClientEvent:Connect(function(
                    _,
                    stage_num,
                    _,
                    obj
                )
                    if stage_num ~= 4 then
                        return
                    end

                    BoxLoc = obj
                end)
                local listener2 = rmts_mgr.GetRemote('AddStage').OnClientEvent:Connect(function(
                    _,
                    stage_num,
                    _,
                    obj
                )
                    if stage_num ~= 4 then
                        return
                    end

                    BoxLoc = obj
                end)

                af_util.ObjectInteract({
                    object = acc_pc,
                    object_name = 'Computer',
                })

                while BoxLoc == nil do
                    task.wait()
                end

                listener:Disconnect()
                listener2:Disconnect()

                local drill = tools.ChildCounter(1, Level.Triggers, function(
                    trigger
                )
                    if trigger.Name ~= 'Drill' then
                        return false
                    end

                    local HalfTrigger = trigger:FindFirstChild('HalfTrigger')

                    if not HalfTrigger then
                        return false
                    end
                    if tools.ComparePositions(BoxLoc.Position, HalfTrigger.Position, 1.2) == true then
                        return true
                    end

                    return false
                end)[1].HalfTrigger

                task.spawn(function()
                    af_util.ObjectInteract({
                        object = drill,
                        object_name = 'Deposit Box',
                    })
                end)
                af_util.MovePlayerByRoute(1, 2)
                GroundItems:WaitForChild('PhoenixStash', math.huge):WaitForChild('Data', math.huge)

                while GroundItems:FindFirstChild('PhoenixStash') and task.wait(0.1) do
                    af_util.ValidateCommand('getitem phoenixstash', 'autofarm')
                end

                af_util.PressReplayButton()
            end,
            [2797881676] = function()
                af_util.ValidateCommand('hide g', 'autofarm')

                local ryan_rossling = npc_mgr.GetNpcsFromTeamByAmt('s', 1)

                npc_mgr.MoveNPC(ryan_rossling, Vector3.new(-39.9, 6, 39.2))
                task.spawn(function()
                    af_util.MovePlayerByRoute(1, 7)
                end)

                local cases = {
                    [1] = {
                        pos = Vector3.new(-39.9, 6, 39.2),
                        func_in = function()
                            af_util.SkipRoutePart(6, 10, 1)
                        end,
                        func_out = function()
                            af_util.SkipRoutePart(10, 6, 1)
                            af_util.MovePlayerByRoute(6, 1)
                        end,
                    },
                    [2] = {
                        pos = Vector3.new(-41.6, 5.8, -9.5),
                        func_in = function()
                            af_util.SkipRoutePart(6, 11, 1)
                            af_util.MovePlayerByRoute(11, 12)
                            af_util.SkipRoutePart(12, 15, 1)
                            af_util.MovePlayerByRoute(15, 17)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(17, 15)
                            af_util.SkipRoutePart(15, 12, 1)
                            af_util.MovePlayerByRoute(12, 11, 1)
                            af_util.SkipRoutePart(11, 6, 1)
                            af_util.MovePlayerByRoute(6, 1)
                        end,
                    },
                    [3] = {
                        pos = Vector3.new(-73.1, 6, 39.8),
                        func_in = function()
                            af_util.SkipRoutePart(6, 11, 1)
                            af_util.MovePlayerByRoute(11, 14)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(14, 11)
                            af_util.SkipRoutePart(11, 6, 1)
                            af_util.MovePlayerByRoute(6, 1)
                        end,
                    },
                    [4] = {
                        pos = Vector3.new(-76.4, 6, 9.5),
                        func_in = function()
                            af_util.SkipRoutePart(6, 11, 1)
                            af_util.MovePlayerByRoute(11, 13)
                            af_util.SkipRoutePart(13, 18, 1)
                            af_util.MovePlayerByRoute(18, 19)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(19, 18)
                            af_util.SkipRoutePart(18, 13, 1)
                            af_util.MovePlayerByRoute(13, 11)
                            af_util.SkipRoutePart(11, 6, 1)
                            af_util.MovePlayerByRoute(6, 1)
                        end,
                    },
                    [5] = {
                        pos = Vector3.new(-22.6, 6, 20.5),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 5)
                            af_util.SkipRoutePart(5, 8, 1)
                            af_util.MovePlayerByRoute(8, 9)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(9, 8)
                            af_util.SkipRoutePart(8, 5, 1)
                            af_util.MovePlayerByRoute(5, 1)
                        end,
                    },
                    [6] = {
                        pos = Vector3.new(-38.7, 6, -21.2),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 3)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(3, 1)
                        end,
                    },
                    [7] = {
                        pos = Vector3.new(-40.5, 5.6, -40.2),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 2)
                            af_util.SkipRoutePart(2, 20, 1)
                            af_util.MovePlayerByRoute(20, 21)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(21, 20)
                            af_util.SkipRoutePart(20, 2, 1)
                            af_util.MovePlayerByRoute(2, 1)
                        end,
                    },
                    [8] = {
                        pos = Vector3.new(-43.3, 6, -21.8),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 2)
                            af_util.SkipRoutePart(2, 22, 1)
                            af_util.MovePlayerByRoute(22, 23)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(23, 22)
                            af_util.SkipRoutePart(22, 2, 1)
                            af_util.MovePlayerByRoute(2, 1)
                        end,
                    },
                    [9] = {
                        pos = Vector3.new(-22.9, 16, -39.4),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 4)
                            af_util.SkipRoutePart(4, 25, 1)
                            af_util.MovePlayerByRoute(25, 29)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(29, 25)
                            af_util.SkipRoutePart(25, 4, 1)
                            af_util.MovePlayerByRoute(4, 1)
                        end,
                    },
                    [10] = {
                        pos = Vector3.new(-42.7, 16, -40.4),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 4)
                            af_util.SkipRoutePart(4, 25, 1)
                            af_util.MovePlayerByRoute(25, 27)
                            af_util.SkipRoutePart(27, 30, 1)
                            af_util.MovePlayerByRoute(30, 32)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(32, 30)
                            af_util.SkipRoutePart(30, 27, 1)
                            af_util.MovePlayerByRoute(27, 25)
                            af_util.SkipRoutePart(25, 4, 1)
                            af_util.MovePlayerByRoute(4, 1)
                        end,
                    },
                    [11] = {
                        pos = Vector3.new(-23.7, 16, -47.2),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 4)
                            af_util.SkipRoutePart(4, 25, 1)
                            af_util.MovePlayerByRoute(25, 27)
                            af_util.SkipRoutePart(27, 30, 1)
                            af_util.MovePlayerByRoute(30, 31)
                            af_util.SkipRoutePart(31, 33, 1)
                            af_util.MovePlayerByRoute(33, 35)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(35, 33)
                            af_util.SkipRoutePart(33, 31, 1)
                            af_util.MovePlayerByRoute(31, 30)
                            af_util.SkipRoutePart(30, 27, 1)
                            af_util.MovePlayerByRoute(27, 25)
                            af_util.SkipRoutePart(25, 4, 1)
                            af_util.MovePlayerByRoute(4, 1)
                        end,
                    },
                    [12] = {
                        pos = Vector3.new(-60.3, 16.4, 1.2),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 4)
                            af_util.SkipRoutePart(4, 25, 1)
                            af_util.MovePlayerByRoute(25, 27)
                            af_util.SkipRoutePart(27, 36, 1)
                            af_util.MovePlayerByRoute(36, 39)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(39, 36)
                            af_util.SkipRoutePart(36, 27, 1)
                            af_util.MovePlayerByRoute(27, 25)
                            af_util.SkipRoutePart(25, 4, 1)
                            af_util.MovePlayerByRoute(4, 1)
                        end,
                    },
                    [13] = {
                        pos = Vector3.new(-55.5, 18.755, 24.2),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 4)
                            af_util.SkipRoutePart(4, 25, 1)
                            af_util.MovePlayerByRoute(25, 27)
                            af_util.SkipRoutePart(27, 36, 1)
                            af_util.MovePlayerByRoute(36, 37)
                            af_util.SkipRoutePart(37, 40, 1.5)
                            af_util.MovePlayerByRoute(40, 44)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(44, 40)
                            af_util.SkipRoutePart(40, 37, 1.5)
                            af_util.MovePlayerByRoute(37, 36)
                            af_util.SkipRoutePart(36, 27, 1)
                            af_util.MovePlayerByRoute(27, 25)
                            af_util.SkipRoutePart(25, 4, 1)
                            af_util.MovePlayerByRoute(4, 1)
                        end,
                    },
                    [14] = {
                        pos = Vector3.new(-55.5, 18.755, 35.8),
                        func_in = function()
                            af_util.MovePlayerByRoute(6, 4)
                            af_util.SkipRoutePart(4, 25, 1)
                            af_util.MovePlayerByRoute(25, 27)
                            af_util.SkipRoutePart(27, 36, 1)
                            af_util.MovePlayerByRoute(36, 37)
                            af_util.SkipRoutePart(37, 40, 1.5)
                            af_util.MovePlayerByRoute(40, 45)
                        end,
                        func_out = function()
                            af_util.MovePlayerByRoute(45, 40)
                            af_util.SkipRoutePart(40, 37, 1.5)
                            af_util.MovePlayerByRoute(37, 36)
                            af_util.SkipRoutePart(36, 27, 1)
                            af_util.MovePlayerByRoute(27, 25)
                            af_util.SkipRoutePart(25, 4, 1)
                            af_util.MovePlayerByRoute(4, 1)
                        end,
                    },
                }

                rmts_mgr.GetRemote('ChangeStageTarget').OnClientEvent:Connect(function(
                    ...
                )
                    local args = {...}

                    if not args[4] or args[4].Name ~= 'Part' then
                        return
                    end

                    local safe_pos = args[4].Position

                    for _, case in ipairs(cases)do
                        if tools.ComparePositions(case.pos, safe_pos, 3) == true then
                            EmulateInput.Press(Enum.KeyCode.LeftControl)
                            case.func_in()

                            for _, trigger in ipairs(Triggers:GetChildren())do
                                if trigger.Name ~= 'Photo' or tools.ComparePositions(trigger.Base.Position, safe_pos, 1) == false then
                                    continue
                                end

                                af_util.ObjectInteract({
                                    object = trigger.Base,
                                    object_name = 'Photograph',
                                    object_rotation = CFrame.Angles(math.rad(180), 0, 0),
                                    rot_x = 0,
                                    rot_z = 2,
                                })

                                break
                            end

                            local safecrack = Triggers:WaitForChild('Safecrack', math.huge)

                            task.spawn(function()
                                af_util.ObjectInteract({
                                    object = safecrack.HalfTrigger,
                                    object_name = 'Safe',
                                })
                                GroundItems:WaitForChild('HardDrive', math.huge):WaitForChild('Data', math.huge)

                                while GroundItems:FindFirstChild('HardDrive') and task.wait(0.1) do
                                    af_util.ValidateCommand('getitem harddrive', 'autofarm')
                                end
                            end)
                            case.func_out()

                            af_util.hrp.Anchored = false

                            af_util.PressReplayButton()

                            break
                        end
                    end
                end)
                af_util.PullGunOut()

                for _, obj in ipairs(Level.Actors.ESP.cams:GetChildren())do
                    if obj.Name ~= 'ExteriorCam' or tools.ComparePositions(obj.Body.Position, Vector3.new(
-33.102, 21.76, 15.603), 10) == false then
                        continue
                    end

                    tools.SimulateShoot(obj.Body, 100)
                end

                af_util.Aim()
                af_util.NpcInteract({
                    npc = ryan_rossling,
                    npc_name = 'Ryan',
                    tip_type = 2,
                    no_interact_validation = true,
                })
                af_util.ValidateCommand('kill s', 'autofarm')
                af_util.MovePlayerByRoute(7, 6)
            end,
            [3590667014] = function()
                local part = Instance.new('Part')

                part.Anchored = true
                part.Size = Vector3.new(8, 20, 8)
                part.Transparency = 1
                part.Position = Vector3.new(51.06, -40.5, -212.99)
                part.Parent = workspace

                af_util.ValidateCommand('void w, hide g s, opendoors', 'autofarm')
                af_util.ValidateCommand('instagrab', 'autofarm')

                local Doors = Geometry.Doors:GetChildren()
                local Objects = Geometry:GetChildren()
                local pc = nil
                local server = nil

                rmts_mgr.GetRemote('AddStage').OnClientEvent:Connect(function(
                    ...
                )
                    local args = {...}

                    if args[3] == 'Access the computer' then
                        pc = args[4]
                    elseif args[3] == 'Take the server and evac' then
                        server = args[4]
                    end
                end)
                af_util.MovePlayerByRoute(1, 2)
                af_util.OpenDoor(Doors[17])
                af_util.MovePlayerByRoute(2, 5)
                af_util.OpenDoor(Doors[10])
                af_util.MovePlayerByRoute(5, 7)
                af_util.RotateCamera(CFrame.Angles(0, 0, 0))

                local door_cases = {
                    {
                        pos = Vector3.new(13.610014915466309, 20.100048065185547, 
-60.53999710083008),
                        func_in = function(door_interact)
                            af_util.SkipRoutePart(7, 9, 1)
                            af_util.MovePlayerByRoute(9, 11)
                            af_util.ObjectInteract({
                                object = door_interact,
                                object_name = 'Heavy Security Door',
                                object_rotation = CFrame.Angles(0, math.rad(90), 0),
                                rot_x = 2,
                                rot_z = 0,
                            })
                            af_util.MovePlayerByRoute(11, 16)
                            af_util.SkipRoutePart(16, 26, 1)
                        end,
                    },
                    {
                        pos = Vector3.new(60.5100212097168, 20.500080108642578, 
-36.640071868896484),
                        func_in = function(door_interact)
                            af_util.MovePlayerByRoute(7, 8)
                            af_util.ObjectInteract({
                                object = door_interact,
                                object_name = 'Heavy Security Door',
                                object_rotation = CFrame.Angles(0, math.rad(90), 0),
                                rot_x = 2,
                                rot_z = 0,
                            })
                            af_util.SkipRoutePart(8, 17, 0.5)
                            af_util.MovePlayerByRoute(17, 26, 1)
                        end,
                    },
                }

                for _, obj in ipairs(Objects)do
                    if not obj:FindFirstChild('Escape') then
                        continue
                    end

                    for _, case in ipairs(door_cases)do
                        if tools.ComparePositions(case.pos, obj.C4Dmg.Position, 3) == true then
                            case.func_in(obj.Escape.Base)
                        end
                    end
                end

                local pc_cases = {
                    {
                        pos = Vector3.new(68.694, 6.105, -20.432),
                        pc_spot = 30,
                        room_center_spot = 29,
                        func_in = function()
                            af_util.MovePlayerByRoute(26, 30)
                        end,
                    },
                    {
                        pos = Vector3.new(11.968, 6.105, -81.274),
                        pc_spot = 33,
                        room_center_spot = 32,
                        func_in = function()
                            af_util.SkipRoutePart(26, 31, 1)
                            af_util.MovePlayerByRoute(31, 33)
                        end,
                    },
                    {
                        pos = Vector3.new(3.026, 4.105, 14.552),
                        pc_spot = 37,
                        room_center_spot = 36,
                        func_in = function()
                            af_util.SkipRoutePart(26, 34, 1)
                            af_util.MovePlayerByRoute(34, 37)
                        end,
                    },
                }

                while pc == nil do
                    task.wait()
                end

                for _, case in ipairs(pc_cases)do
                    if tools.ComparePositions(case.pos, pc.Position, 3) == true then
                        task.spawn(case.func_in)
                        af_util.ObjectInteract({
                            object = pc,
                            object_name = 'Computer',
                            object_rotation = CFrame.Angles(0, math.rad(90), 0),
                            rot_x = 1,
                            rot_z = 0,
                        })
                        af_util.MovePlayerByRoute(case.pc_spot, case.room_center_spot)
                        af_util.ThrowBag()

                        while server == nil do
                            task.wait()
                        end

                        server = server.Parent.Parent

                        local server_base = server.Base
                        local server_pickup = server.ServerPickup.Base
                        local pos = server_base.Position + (server_base.CFrame.LookVector * Vector3.new(0, 0, 4)) + Vector3.new(0, 3, 0)

                        af_util.TweenObject(af_util.hrp, pos, 0.25)
                        af_util.ObjectInteract({
                            object = server_pickup,
                            object_name = 'Server',
                        })
                    end
                end

                task.spawn(function()
                    af_util.TpToEscapeZone(Vector3.new(51.06, -5.3, -212.99))
                end)
                af_util.PressReplayButton()
            end,
            [2951213182] = function()
                af_util.ValidateCommand('void g w c, hide s, metdetect', 'autofarm')
                af_util.ValidateCommand('opendoors', 'autofarm')
                af_util.ValidateCommand('instagrab', 'autofarm')

                local Window = Geometry:WaitForChild('OpenableWindow', math.huge):WaitForChild('Trig', math.huge):WaitForChild('Trig', math.huge)

                af_util.ObjectInteract({
                    object = Window,
                    object_name = 'Window',
                })

                local Doors = Geometry.Doors:GetChildren()
                local ServerRoom = Geometry:WaitForChild('ServerRoom', math.huge)
                local Computer = ServerRoom:WaitForChild('Computer', math.huge)

                Computer:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 9
                Computer = Computer:WaitForChild('Center', math.huge)

                local ServerRoomDoor = nil

                for _, door in ipairs(Doors)do
                    local distance = (door.Center.Position - Computer.Position).Magnitude

                    if distance > 20 and distance < 21 then
                        ServerRoomDoor = door

                        break
                    end
                end

                local FindTrigger = ServerRoom:WaitForChild('FindTrigger', math.huge)

                af_util.FireTrigger(FindTrigger)
                af_util.OpenDoor(ServerRoomDoor)
                af_util.OpenDoor(Doors[21])
                af_util.MovePlayerByRoute(1, 5)
                af_util.OpenDoor(Doors[13])
                af_util.MovePlayerByRoute(5, 9)
                af_util.PullGunOut()
                af_util.Aim()

                local manager = npc_mgr.GetNpcsFromTeamByAmt('s', 1)

                af_util.StickNpcToCamera(manager)
                task.spawn(function()
                    af_util.ObjectInteract({
                        object = Computer,
                        object_name = 'Computer',
                    })
                end)
                af_util.MovePlayerByRoute(9, 17)
                af_util.UnstickNpcFromCamera()

                local seats_pos = {
                    Vector3.new(-30.024, 14.501, 101.836),
                    Vector3.new(-43.197, 14.501, 100.975),
                    Vector3.new(-5.364, 2.501, 109.087),
                    Vector3.new(-21.604, 2.501, 122.407),
                    Vector3.new(-30.696, 2.501, 115.854),
                    Vector3.new(-33.267, 2.501, 123.188),
                    Vector3.new(-43.233, 2.501, 116.711),
                    Vector3.new(-16.386, 2.501, 102.584),
                    Vector3.new(-32.326, 2.501, 102.674),
                }

                task.spawn(function()
                    local workers = npc_mgr.GetNpcsFromTeamByAmt('w', 9)

                    for _, worker in ipairs(workers)do
                        local data = npc_mgr.npcs_data.all.npcs[worker]

                        for _, pos in ipairs(seats_pos)do
                            if data and data.hrp and tools.ComparePositions(data.hrp.Position, pos, 3) == true then
                                npc_mgr.MoveNPC(manager, pos)

                                while data.humanoid and data.humanoid.Health > 0 do
                                    task.wait()
                                end

                                break
                            end
                        end
                    end

                    npc_mgr.MoveNPC(manager, Vector3.new(12.31, 3.224, 89.559))
                end)
                af_util.MovePlayerByRoute(17, 20)
                rmts_mgr.GetRemote('ClearStage').OnClientEvent:Wait()

                while af_util.stick_connection ~= nil do
                    task.wait()
                end

                af_util.OpenDoor(Doors[10])
                af_util.MovePlayerByRoute(20, 23)
                af_util.OpenDoor(Doors[9])
                af_util.MovePlayerByRoute(23, 25)
                af_util.SkipRoutePart(25, 41, 1)

                while af_util.stick_connection ~= nil do
                    task.wait()
                end

                local power_box = tools.WaitForChildWithIndex(Geometry, 1229)
                local door = power_box:WaitForChild('PowerDoor', math.huge):WaitForChild('Union', math.huge)

                af_util.ObjectInteract({
                    object = door,
                    object_name = 'Power Box',
                })

                local interact_area = power_box:WaitForChild('InteractArea', math.huge):WaitForChild('Part', math.huge)

                interact_area.Name = 'InteractArea '
                interact_area.Parent:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 4

                af_util.ObjectInteract({
                    object = interact_area,
                    object_name = 'Power Box',
                })
                task.spawn(function()
                    af_util.SkipRoutePart(41, 25, 1)
                    af_util.MovePlayerByRoute(25, 28)
                end)

                interact_area = power_box:WaitForChild('InteractArea', math.huge):WaitForChild('Part', math.huge)
                interact_area.Parent:WaitForChild('Interact', math.huge):WaitForChild('Time', math.huge).Value = 8

                af_util.ObjectInteract({
                    object = interact_area,
                    object_name = 'Power Box',
                })
                af_util.NpcInteractt({
                    npc = manager,
                    npc_name = 'Manager',
                })
                af_util.ThrowBag()
                af_util.MovePlayerByRoute(28, 29)

                local vault_door = Geometry.VaultDoor2:GetChildren()[11]

                while vault_door.Rotation.Y < -50 do
                    task.wait()
                end

                af_util.MovePlayerByRoute(29, 31)
                af_util.OpenDoor(Doors[15])
                af_util.MovePlayerByRoute(31, 32)
                af_util.ValidateCommand('kill s', 'autofarm')

                local Tools = LocalPlayer:WaitForChild('Status', math.huge):WaitForChild('Tools', math.huge)

                for i = 1, 2, 1 do
                    if i == 2 then
                        af_util.SkipRoutePart(32, 33, 1)
                        af_util.OpenDoor(Doors[16])
                        af_util.MovePlayerByRoute(33, 34, 1)
                    end

                    for _, bag in ipairs(GroundBags:GetChildren())do
                        if bag.Name ~= 'Cash' or tools.ComparePositions(bag.Base.Position, af_util.hrp.Position, 10) == false then
                            continue
                        end

                        af_util.RotateCamera(CFrame.Angles(0, math.rad(-90), 0))

                        while true do
                            af_util.ObjectInteract({
                                object = bag.Base,
                                object_name = 'Cash',
                            })

                            if Tools:WaitForChild('Bag', 3) ~= nil then
                                break
                            end
                        end

                        af_util.RotateCamera(CFrame.Angles(0, math.rad(90), 0))
                        af_util.ThrowBag()
                    end
                end

                af_util.ValidateCommand('loopbag', 'autofarm')
                af_util.MovePlayerByRoute(34, 33)
                af_util.SkipRoutePart(33, 30, 1)
                af_util.MovePlayerByRoute(30, 29)
                af_util.SkipRoutePart(29, 27, 1)
                af_util.SkipRoutePart(27, 35, 1)
                af_util.MovePlayerByRoute(35, 36)

                for _, obj in ipairs(Geometry:GetChildren())do
                    if obj.Name ~= 'FireDoor' or not obj:FindFirstChild('AccessDoorScript') then
                        continue
                    end

                    af_util.ObjectInteract({
                        object = obj.OpenTrig.Part,
                        object_name = 'Access Door',
                    })

                    break
                end

                af_util.MovePlayerByRoute(36, 38)
                af_util.RotateCamera(CFrame.Angles(0, 0, 0))
                af_util.ValidateCommand('loopbag', 'autofarm')

                Camera.CFrame = CFrame.Angles(math.rad(-30), 0, 0)

                for _, bag in ipairs(GroundBags:GetChildren())do
                    if bag.Name ~= 'Bag' or not bag:FindFirstChild('SealedBag') then
                        continue
                    end

                    af_util.ObjectInteract({
                        object = bag.Base,
                        object_name = 'Cash',
                    })
                    af_util.ThrowBag()
                end

                af_util.MovePlayerByRoute(38, 40)
                af_util.PressReplayButton()
            end,
            [4518266946] = function()
                local Doors = workspace.Level.Geometry.Doors:GetChildren()

                task.spawn(function()
                    while npc_mgr.GetNpcsFromTeamByAmt('w', 1) == nil do
                        task.wait()
                    end

                    local keycard_holder = npc_mgr.GetNpcsFromTeamByAmt('w', 1)

                    npc_mgr.MoveNPC(keycard_holder, Vector3.new(-30.687, -6.576, 4.363))
                    npc_mgr.WaitForExactNpcPos(keycard_holder, Vector3.new(-30.687, 
-6.576, 4.363), 0.005)
                    npc_mgr.WaitForRadioCallEnd(keycard_holder)
                    af_util.ValidateCommand('kill w', 'autofarm')
                end)
                af_util.ValidateCommand('hide g s, opendoors, esp', 'autofarm')

                if #Players:GetPlayers() > 1 then
                    af_util.MovePlayerByRoute(1, 4)
                    af_util.MovePlayerByRoute(4, 3)
                    af_util.SkipRoutePart(3, 5, 1.5)
                else
                    af_util.MovePlayerByRoute(1, 2)
                    af_util.SkipRoutePart(2, 5, 1.5)
                end

                af_util.MovePlayerByRoute(5, 8)
                af_util.OpenDoor(Doors[12])
                af_util.MovePlayerByRoute(8, 13)
                GroundItems:WaitForChild('KeycardHS', math.huge):WaitForChild('Data', math.huge)

                while GroundItems:FindFirstChild('KeycardHS') and task.wait(0.1) do
                    af_util.ValidateCommand('getitem keycardhs', 'autofarm')
                end

                local keypad = Geometry.HighSecurityKeypad

                af_util.ObjectInteract({
                    object_name = 'Keycard Reader',
                    object = keypad.Base,
                })
                af_util.OpenDoor(Doors[19])
                af_util.OpenDoor(Doors[18])

                local guards = npc_mgr.GetNpcsFromTeamByAmt('g', 10)

                for _, guard in pairs(guards)do
                    if tools.ComparePositions(npc_mgr.aliases.g[guard].hrp.Position, Vector3.new(
-28.200138092041016, -6.556028366088867, 26.499916076660156), 5) == true then
                        npc_mgr.KillNPC(guard)

                        break
                    end
                end

                af_util.MovePlayerByRoute(13, 8)
                af_util.SkipRoutePart(8, 14, 1.5)
                af_util.MovePlayerByRoute(14, 15)
                rmts_mgr.GetRemote('AddStage').OnClientEvent:Connect(function(
                    ...
                )
                    local args = {...}

                    if args[3] == 'Breach and clear the control room' then
                        local falcon = npc_mgr.GetNpcsFromTeamByAmt('s', 1)

                        table.insert(guards, falcon)

                        for _, guard in ipairs(guards)do
                            npc_mgr.WaitForRadioCallEnd(guard)
                        end

                        af_util.ValidateCommand('void g s', 'autofarm')
                    elseif args[3] == 'Escape' then
                        af_util.MovePlayerByRoute(15, 17)

                        af_util.hrp.Anchored = false

                        af_util.PressReplayButton()
                    end
                end)
            end,
            [4661507759] = function()
                af_util.ValidateCommand('hide g w, metdetect, opendoors', 'autofarm')

                local agents = npc_mgr.GetNpcsFromTeamByAmt('s', 2)

                for _, agent in ipairs(agents)do
                    npc_mgr.MoveNPC(agent, Vector3.new(60.4, 4.599, 160.5))
                end

                local plr_count = #Players:GetPlayers()

                if plr_count > 1 then
                    af_util.MovePlayerByRoute(1, 4)
                else
                    af_util.SkipRoutePart(1, 4, 1)
                    rmts_mgr.GetRemote('NewObjective').OnClientEvent:Wait()
                end

                af_util.ValidateCommand('void g, kill s', 'autofarm')

                if plr_count > 1 then
                    af_util.MovePlayerByRoute(4, 11)
                else
                    af_util.MovePlayerByRoute(4, 6)
                    af_util.SkipRoutePart(6, 8, 1)
                    af_util.MovePlayerByRoute(8, 11)
                end

                af_util.ValidateCommand('void w', 'autofarm')
                task.spawn(function()
                    GroundItems:WaitForChild('USB', math.huge):WaitForChild('Data', math.huge)

                    while GroundItems:FindFirstChild('USB') and task.wait(0.1) do
                        af_util.ValidateCommand('getitem usb', 'autofarm')
                    end
                end)

                local Doors = Geometry.Doors:GetChildren()

                af_util.OpenDoor(Doors[2])
                af_util.MovePlayerByRoute(11, 13)
                af_util.OpenDoor(Doors[8])
                af_util.MovePlayerByRoute(13, 15)
                af_util.OpenDoor(Doors[16])
                af_util.MovePlayerByRoute(15, 17)
                af_util.OpenDoor(Doors[39])
                af_util.MovePlayerByRoute(17, 19)
                af_util.OpenDoor(Doors[34])
                af_util.MovePlayerByRoute(19, 20)
                af_util.SkipRoutePart(20, 47, 0.5)

                local objects = Geometry:GetChildren()
                local first_pc = objects[1680].Computer.Screen
                local second_pc = objects[1684].Computer.Screen
                local third_pc = objects[1682].Computer.Screen

                af_util.ObjectInteract({
                    object = first_pc,
                    object_name = 'Computer',
                })
                af_util.SkipRoutePart(47, 20, 0.5)
                af_util.MovePlayerByRoute(20, 16)
                af_util.SkipRoutePart(16, 21, 1)
                rmts_mgr.GetRemote('SetStageName').OnClientEvent:Wait()

                local analyst_pc = nil
                local listener

                listener = Geometry.DescendantAdded:Connect(function(obj)
                    if obj.Name ~= 'ObjectTip' then
                        return
                    end

                    while obj.Value == nil or obj.Value == '' do
                        task.wait()
                    end

                    if obj.Value ~= 'Hold [F] to authorize' then
                        return
                    end

                    analyst_pc = obj.Parent.Parent.Base

                    listener:Disconnect()
                end)

                while analyst_pc == nil do
                    task.wait()
                end

                local pc_table_pos = analyst_pc.Parent.Parent.WorldPivot.Position
                local cases = {
                    {
                        pos = Vector3.new(92.028, 3.55, 210.901),
                        func_in = function()
                            af_util.MovePlayerByRoute(21, 22)
                        end,
                        func_off = function()
                            af_util.MovePlayerByRoute(22, 21)
                        end,
                    },
                    {
                        pos = Vector3.new(92.027, 3.55, 226.701),
                        func_in = function()
                            af_util.SkipRoutePart(21, 23, 1)
                        end,
                        func_off = function()
                            af_util.SkipRoutePart(23, 21, 1)
                        end,
                    },
                    {
                        pos = Vector3.new(91.988, 3.55, 243.616),
                        func_in = function()
                            af_util.SkipRoutePart(21, 24, 1)
                        end,
                        func_off = function()
                            af_util.SkipRoutePart(24, 21, 1)
                        end,
                    },
                    {
                        pos = Vector3.new(73.027, 3.55, 226.9),
                        func_in = function()
                            af_util.SkipRoutePart(21, 25, 1)
                        end,
                        func_off = function()
                            af_util.SkipRoutePart(25, 21, 1)
                        end,
                    },
                    {
                        pos = Vector3.new(118.195, 3.55, 261.477),
                        func_in = function()
                            af_util.SkipRoutePart(21, 24, 1)
                            af_util.SkipRoutePart(24, 26, 1)
                        end,
                        func_off = function()
                            af_util.SkipRoutePart(26, 24, 1)
                            af_util.SkipRoutePart(24, 21, 1)
                        end,
                    },
                    {
                        pos = Vector3.new(134.815, 3.55, 278.091),
                        func_in = function()
                            af_util.SkipRoutePart(21, 24, 1)
                            af_util.SkipRoutePart(24, 26, 1)
                            af_util.MovePlayerByRoute(26, 27)
                        end,
                        func_off = function()
                            af_util.MovePlayerByRoute(27, 26)
                            af_util.SkipRoutePart(26, 24, 1)
                            af_util.SkipRoutePart(24, 21, 1)
                        end,
                    },
                    {
                        pos = Vector3.new(92.027, 3.55, 286.101),
                        func_in = function()
                            af_util.SkipRoutePart(21, 24, 1)
                            af_util.SkipRoutePart(24, 26, 1)
                            af_util.SkipRoutePart(26, 28, 1)
                            af_util.MovePlayerByRoute(28, 29)
                        end,
                        func_off = function()
                            af_util.MovePlayerByRoute(29, 28)
                            af_util.SkipRoutePart(28, 26, 1)
                            af_util.SkipRoutePart(26, 24, 1)
                            af_util.SkipRoutePart(24, 21, 1)
                        end,
                    },
                    {
                        pos = Vector3.new(-46.973, 1.55, 219.7),
                        func_in = function()
                            af_util.SkipRoutePart(21, 25, 1)
                            af_util.SkipRoutePart(25, 30, 1)
                            EmulateInput.Press(Enum.KeyCode.LeftControl)
                            af_util.OpenDoor(Doors[11])
                            af_util.MovePlayerByRoute(30, 34)
                        end,
                        func_off = function()
                            af_util.MovePlayerByRoute(34, 31)
                        end,
                    },
                    {
                        pos = Vector3.new(-60.363, 1.55, 219.688),
                        func_in = function()
                            af_util.SkipRoutePart(21, 25, 1)
                            af_util.SkipRoutePart(25, 30, 1)
                            EmulateInput.Press(Enum.KeyCode.LeftControl)
                            af_util.OpenDoor(Doors[11])
                            af_util.MovePlayerByRoute(30, 33)
                            af_util.SkipRoutePart(33, 35, 1)
                        end,
                        func_off = function()
                            af_util.SkipRoutePart(35, 33, 1)
                            af_util.MovePlayerByRoute(33, 31)
                        end,
                    },
                }

                EmulateInput.Press(Enum.KeyCode.LeftControl)

                local matched_index = nil

                for index, case in ipairs(cases)do
                    if tools.ComparePositions(pc_table_pos, case.pos, 5) == false then
                        continue
                    end

                    matched_index = index

                    case.func_in()
                    af_util.ObjectInteract({
                        object = analyst_pc,
                        object_name = 'Computer',
                    })
                    case.func_off()

                    break
                end

                if matched_index ~= 8 and matched_index ~= 9 then
                    af_util.SkipRoutePart(21, 25, 1)
                    EmulateInput.Press(Enum.KeyCode.LeftControl)
                    af_util.SkipRoutePart(25, 30, 1)
                    af_util.OpenDoor(Doors[11])

                    af_util.hrp.Anchored = false

                    af_util.MovePlayerByRoute(30, 31)
                end

                af_util.SkipRoutePart(31, 36, 1)
                af_util.MovePlayerByRoute(36, 37)
                af_util.OpenDoor(Doors[37])
                af_util.MovePlayerByRoute(37, 39)
                af_util.ObjectInteract({
                    object = second_pc,
                    object_name = 'Computer',
                })
                af_util.MovePlayerByRoute(39, 36)
                af_util.SkipRoutePart(36, 31, 1)
                af_util.SkipRoutePart(31, 40, 1)
                af_util.OpenDoor(Doors[30])
                af_util.MovePlayerByRoute(40, 44)
                af_util.OpenDoor(Doors[32])
                af_util.MovePlayerByRoute(44, 46)
                af_util.ObjectInteract({
                    object = third_pc,
                    object_name = 'Computer',
                })

                local interact = third_pc.parent:WaitForChild('Interact', math.huge)

                interact:GetPropertyChangedSignal('Parent'):Wait()
                af_util.ObjectInteract({
                    object = third_pc,
                    object_name = 'Computer',
                })
                af_util.MovePlayerByRoute(46, 40)
                af_util.SkipRoutePart(40, 31, 1)
                af_util.SkipRoutePart(31, 36, 1)
                af_util.SkipRoutePart(36, 48, 1)
                af_util.MovePlayerByRoute(48, 49)

                Camera.CFrame = CFrame.Angles(math.rad(-30), 0, 0)

                af_util.OpenDoor(Doors[14])
                af_util.MovePlayerByRoute(49, 52)
                af_util.OpenDoor(Doors[45])
                af_util.MovePlayerByRoute(52, 54)
                af_util.OpenDoor(Doors[1])
                af_util.MovePlayerByRoute(54, 55)
                af_util.SkipRoutePart(55, 6, 1.5)
                af_util.MovePlayerByRoute(6, 5)
                af_util.SkipRoutePart(5, 56, 1)
                af_util.PressReplayButton()
            end,
            [4768829954] = function()
                af_util.ValidateCommand('void all, opendoors', 'autofarm')
                af_util.ValidateCommand('getitem thermitecan', 'autofarm')
                task.spawn(function()
                    local thermite = Triggers:WaitForChild('ThermiteCan', math.huge):WaitForChild('Effects', math.huge)

                    af_util.ObjectInteract({
                        object = thermite,
                        object_name = 'Thermite Target',
                    })
                end)
                af_util.MovePlayerByRoute(1, 4)

                while Geometry.EntranceDoor.Base.Position.Y < 39.2 do
                    task.wait()
                end

                af_util.MovePlayerByRoute(4, 11)

                local Doors = Geometry.Doors:GetChildren()

                af_util.OpenDoor(Doors[11])
                af_util.MovePlayerByRoute(11, 15)
                af_util.OpenDoor(Doors[6])
                af_util.MovePlayerByRoute(15, 17)
                af_util.OpenDoor(Doors[5])
                af_util.MovePlayerByRoute(17, 19)

                local box = Geometry.BombBox.Lid.Base

                af_util.ObjectInteract({
                    object = box,
                    object_name = 'Bomb Crate',
                    object_rotation = CFrame.Angles(math.rad(90), 0, 0),
                    rot_x = 0,
                    rot_y = -1,
                    rot_z = 0,
                })
                tools.ChildCounter(8, GroundItems, function(obj)
                    return obj.Name == 'BlackDuskBomb'
                end)
                af_util.ValidateCommand('getitem blackduskbomb 2', 'autofarm')

                local bomb_spots = tools.ChildCounter(6, Geometry, function(
                    obj
                )
                    return obj.Name == 'BlackDuskBomb'
                end)
                local PlantBomb = function()
                    for _, bomb in ipairs(bomb_spots)do
                        local base = bomb:FindFirstChild('Base')

                        if base == nil then
                        elseif tools.ComparePositions(base.Position, af_util.hrp.Position, 10) == false then
                        end
                        if base == nil or tools.ComparePositions(base.Position, af_util.hrp.Position, 10) == false then
                            continue
                        end

                        af_util.ObjectInteract({
                            object = base,
                            object_name = 'Bomb',
                        })

                        break
                    end
                end

                af_util.MovePlayerByRoute(19, 17)
                af_util.SkipRoutePart(17, 20, 1)
                af_util.MovePlayerByRoute(20, 21)

                local panel, panel_door, panel_text = nil, nil, nil

                for _, obj in ipairs(Geometry:GetChildren())do
                    if obj.Name == 'PanelDoor' and tools.ComparePositions(obj.SlideDoor.Base.Position, Vector3.new(
-9.502, 42.503, 126.499), 3) == true then
                        panel_door = obj.SlideDoor.Base
                    elseif obj.Name == 'Model' and obj:FindFirstChild('Screen') and tools.ComparePositions(obj.Screen.Position, Vector3.new(
-10.025, 42.701, 130.24), 3) == true and obj.Screen.Interface.BG.TextLabel.Text == 'Open' then
                        panel = obj.Screen
                        panel_text = obj.Screen.Interface.BG.TextLabel
                    end
                end

                if panel ~= nil then
                    af_util.RotateCamera(CFrame.Angles(0, math.rad(90), 0))
                    task.spawn(function()
                        af_util.ObjectInteract({
                            object = panel,
                            object_name = 'Door',
                            object_rotation = CFrame.Angles(math.rad(90), 0, 0),
                            rot_x = 0,
                            rot_y = -1,
                            rot_z = 0,
                        })
                    end)

                    while panel_door.Position.Y < 47.7 and panel_text.Text == 'Open' and RunService.RenderStepped:Wait() do
                        af_util.hrp.CFrame = CFrame.new(-16.262, 41.326, 126.594)
                    end
                end

                af_util.MovePlayerByRoute(20, 26)
                af_util.OpenDoor(Doors[32])
                af_util.MovePlayerByRoute(26, 28)
                PlantBomb()
                af_util.MovePlayerByRoute(28, 31)
                PlantBomb()
                task.spawn(function()
                    af_util.ValidateCommand('getitem blackduskbomb 2', 'autofarm')
                end)
                af_util.MovePlayerByRoute(31, 26)
                af_util.SkipRoutePart(26, 32, 1)
                af_util.MovePlayerByRoute(32, 36)
                af_util.OpenDoor(Doors[15])
                af_util.MovePlayerByRoute(36, 37)
                af_util.OpenDoor(Doors[14])
                af_util.MovePlayerByRoute(37, 41)
                af_util.OpenDoor(Doors[2])
                af_util.MovePlayerByRoute(41, 44)
                PlantBomb()
                af_util.MovePlayerByRoute(44, 46)
                PlantBomb()
                task.spawn(function()
                    af_util.ValidateCommand('getitem blackduskbomb 2', 'autofarm')
                end)
                af_util.MovePlayerByRoute(46, 36)
                af_util.SkipRoutePart(36, 7, 1)
                af_util.MovePlayerByRoute(7, 10)
                af_util.SkipRoutePart(10, 47, 1)
                af_util.MovePlayerByRoute(47, 48)

                while Geometry.VaultDoor.Center.Rotation.Y < -45 do
                    task.wait()
                end

                af_util.MovePlayerByRoute(48, 50)
                PlantBomb()
                af_util.MovePlayerByRoute(50, 51)
                PlantBomb()
                task.spawn(function()
                    af_util.ValidateCommand('getitem blackduskbomb 2', 'autofarm')

                    bomb_spots = tools.ChildCounter(8, Geometry, function(obj)
                        return obj.Name == 'BlackDuskBomb'
                    end)
                end)
                af_util.MovePlayerByRoute(51, 47)
                af_util.SkipRoutePart(47, 10, 1)
                af_util.MovePlayerByRoute(10, 9)
                af_util.SkipRoutePart(9, 52, 1)
                af_util.MovePlayerByRoute(52, 56)
                af_util.OpenDoor(Doors[29])
                af_util.MovePlayerByRoute(56, 58)
                af_util.OpenDoor(Doors[30])
                af_util.MovePlayerByRoute(58, 61)
                PlantBomb()
                af_util.MovePlayerByRoute(61, 64)
                PlantBomb()
                task.spawn(function()
                    af_util.TpToEscapeZone(Vector3.new(8.862, 31.325, -19.537))
                end)
                af_util.PressReplayButton()
            end,
        }
        af_util.spots = {
            [3200010305] = {
                [1] = {
                    pos = Vector3.new(100.27120208740234, 7.1239800453186035, -1.0548720359802246),
                    mul = 1,
                },
                [2] = {
                    pos = Vector3.new(104.56007385253906, 7.023995876312256, 5.229642868041992),
                    mul = 0.5,
                },
                [3] = {
                    pos = Vector3.new(104.56007385253906, 7.023995876312256, -7.670356750488281),
                    mul = 0.25,
                },
                [4] = {
                    pos = Vector3.new(100.36007690429688, 7.023995876312256, -6.870350360870361),
                    mul = 1,
                },
                [5] = {
                    pos = Vector3.new(100.36007690429688, 26.823997497558594, -6.870350360870361),
                    mul = 1,
                },
                [6] = {
                    pos = Vector3.new(95.3599624633789, 24.324024200439453, 7.629767894744873),
                    mul = 1,
                },
                [7] = {
                    pos = Vector3.new(95.3599624633789, 24.324024200439453, 31.329769134521484),
                    mul = 1,
                },
                [8] = {
                    pos = Vector3.new(95.3599624633789, 24.324024200439453, 43.929771423339844),
                    mul = 1,
                },
                [9] = {
                    pos = Vector3.new(95.52032470703125, 19.923952102661133, 57.30582046508789),
                    mul = 1,
                },
                [10] = {
                    pos = Vector3.new(136.39999389648438, 19.923952102661133, 65.49972534179688),
                    mul = 1,
                },
                [11] = {
                    pos = Vector3.new(136.39999389648438, 19.923952102661133, 74.19972229003906),
                    mul = 1,
                },
                [12] = {
                    pos = Vector3.new(159.89956665039063, 19.923206329345703, 83.00039672851563),
                    mul = 1,
                },
                [13] = {
                    pos = Vector3.new(159.89956665039063, 19.923206329345703, 94.20039367675781),
                    mul = 1,
                },
                [14] = {
                    pos = Vector3.new(159.89956665039063, 19.923206329345703, 99.70039367675781),
                    mul = 1,
                },
                [15] = {
                    pos = Vector3.new(174.9989013671875, 19.922157287597656, 108.50076293945313),
                    mul = 1,
                },
                [16] = {
                    pos = Vector3.new(174.9989013671875, 19.922157287597656, 158.30076599121094),
                    mul = 1,
                },
                [17] = {
                    pos = Vector3.new(97.4989013671875, 19.922157287597656, 158.30076599121094),
                    mul = 1,
                },
                [18] = {
                    pos = Vector3.new(97.4989013671875, 19.922157287597656, 138.60076904296875),
                    mul = 1,
                },
                [19] = {
                    pos = Vector3.new(92.79890441894531, 23.022157669067383, 138.60076904296875),
                    mul = 1,
                },
                [20] = {
                    pos = Vector3.new(86.79890441894531, 23.022157669067383, 138.60076904296875),
                    mul = 1,
                },
                [21] = {
                    pos = Vector3.new(86.79890441894531, 38.82215881347656, 138.60076904296875),
                    mul = 1,
                },
                [22] = {
                    pos = Vector3.new(90.7872085571289, 37.72395706176758, 137.96646118164063),
                    mul = 1,
                },
                [23] = {
                    pos = Vector3.new(103.0991439819336, 35.12327575683594, 120.49982452392578),
                    mul = 1,
                },
                [24] = {
                    pos = Vector3.new(115.8991470336914, 35.12327575683594, 120.49982452392578),
                    mul = 1,
                },
                [25] = {
                    pos = Vector3.new(125.99911499023438, 35.12327575683594, 135.99984741210938),
                    mul = 1,
                },
                [26] = {
                    pos = Vector3.new(132.49856567382813, 35.121917724609375, 127.30058288574219),
                    mul = 1,
                },
                [27] = {
                    pos = Vector3.new(132.49856567382813, 35.121917724609375, 112.50057983398438),
                    mul = 1,
                },
                [28] = {
                    pos = Vector3.new(132.49856567382813, 20.02191734313965, 112.50057983398438),
                    mul = 1,
                },
                [29] = {
                    pos = Vector3.new(132.49856567382813, 21.921916961669922, 99.20057678222656),
                    mul = 1,
                },
                [30] = {
                    pos = Vector3.new(37.498565673828125, 21.921916961669922, 99.20057678222656),
                    mul = 1,
                },
                [31] = {
                    pos = Vector3.new(37.498565673828125, 6.421916961669922, 101.50057983398438),
                    mul = 1,
                },
                [32] = {
                    pos = Vector3.new(37.498565673828125, 6.421916961669922, 86.10057830810547),
                    mul = 1,
                },
                [33] = {
                    pos = Vector3.new(37.498565673828125, 6.421916961669922, 77.30057525634766),
                    mul = 1,
                },
                [34] = {
                    pos = Vector3.new(18.700159072875977, 6.324803352355957, 69.79914093017578),
                    mul = 1,
                },
                [35] = {
                    pos = Vector3.new(0.01956939697265625, 18.450918197631836, 67.76422119140625),
                    mul = 1,
                },
                [36] = {
                    pos = Vector3.new(-4.380430698394775, 18.450918197631836, 67.76422119140625),
                    mul = 1,
                },
                [37] = {
                    pos = Vector3.new(-11.08043098449707, 19.65091896057129, 67.76422119140625),
                    mul = 1,
                },
                [38] = {
                    pos = Vector3.new(-0.19896507263183594, 6.325926780700684, 28.598907470703125),
                    mul = 1,
                },
                [39] = {
                    pos = Vector3.new(-10.898964881896973, 6.325926780700684, 28.598907470703125),
                    mul = 1,
                },
                [40] = {
                    pos = Vector3.new(-16.198965072631836, 6.325926780700684, -10.901092529296875),
                    mul = 1,
                },
                [41] = {
                    pos = Vector3.new(-18.498964309692383, 6.325926780700684, -10.901092529296875),
                    mul = 1,
                },
                [42] = {
                    pos = Vector3.new(-25.898963928222656, 6.325926780700684, -10.901092529296875),
                    mul = 1,
                },
                [43] = {
                    pos = Vector3.new(-30.68463706970215, 7.727260112762451, -16.935766220092773),
                    mul = 1,
                },
                [44] = {
                    pos = Vector3.new(-42.60002136230469, 15.722034454345703, -17.299205780029297),
                    mul = 1,
                },
                [45] = {
                    pos = Vector3.new(-47.80002212524414, 15.722034454345703, -17.299205780029297),
                    mul = 1,
                },
                [46] = {
                    pos = Vector3.new(-47.80002212524414, 15.722034454345703, -6.09920597076416),
                    mul = 1,
                },
                [47] = {
                    pos = Vector3.new(-44.000022888183594, 15.722034454345703, -6.09920597076416),
                    mul = 1,
                },
                [48] = {
                    pos = Vector3.new(-33.79994583129883, 23.223936080932617, -5.698215007781982),
                    mul = 1,
                },
                [49] = {
                    pos = Vector3.new(-26.1999454498291, 23.223936080932617, -5.698215007781982),
                    mul = 1,
                },
                [50] = {
                    pos = Vector3.new(-26.1999454498291, 23.223936080932617, -16.89821434020996),
                    mul = 1,
                },
                [51] = {
                    pos = Vector3.new(-31.799945831298828, 23.223936080932617, -16.89821434020996),
                    mul = 1,
                },
                [52] = {
                    pos = Vector3.new(-42.79994583129883, 31.323936462402344, -16.89821434020996),
                    mul = 1,
                },
                [53] = {
                    pos = Vector3.new(-53.0999870300293, 29.123981475830078, -16.200279235839844),
                    mul = 1,
                },
                [54] = {
                    pos = Vector3.new(-74.59998321533203, 29.123981475830078, -16.200279235839844),
                    mul = 1,
                },
                [55] = {
                    pos = Vector3.new(-82.74490356445313, 36.52397155761719, -3.3553991317749023),
                    mul = 1,
                },
                [56] = {
                    pos = Vector3.new(-105.61097717285156, 32.5240364074707, 39.11674499511719),
                    mul = 1,
                },
                [57] = {
                    pos = Vector3.new(-111.29741668701172, 28.722042083740234, 48.697139739990234),
                    mul = 1,
                },
            },
            [2625195454] = {
                [1] = {
                    pos = Vector3.new(201.8429412841797, 188.32394409179688, 109.56322479248047),
                    mul = 2,
                },
                [2] = {
                    pos = Vector3.new(182.30999755859375, 188.44398498535156, 63.570228576660156),
                    mul = 1,
                },
            },
            [2797881676] = {
                [1] = {
                    pos = Vector3.new(-8.287199020385742, 4.323972225189209, -29.836877822875977),
                    mul = 1,
                },
                [2] = {
                    pos = Vector3.new(-33.51278305053711, 4.323999881744385, -30.499374389648438),
                    mul = 0.5,
                },
                [3] = {
                    pos = Vector3.new(-33.62016677856445, 4.323971748352051, -21.149919509887695),
                    mul = 1,
                },
                [4] = {
                    pos = Vector3.new(-31.99999237060547, 4.323999881744385, -7.800000190734863),
                    mul = 1,
                },
                [5] = {
                    pos = Vector3.new(-32.18719482421875, 4.323972225189209, 14.163124084472656),
                    mul = 1,
                },
                [6] = {
                    pos = Vector3.new(-32.18719482421875, 4.323972225189209, 33.86312484741211),
                    mul = 1,
                },
                [7] = {
                    pos = Vector3.new(-32.18719482421875, 4.323972225189209, 39.96312713623047),
                    mul = 1,
                },
                [8] = {
                    pos = Vector3.new(-22.78720474243164, 4.323972225189209, 13.363125801086426),
                    mul = 0.5,
                },
                [9] = {
                    pos = Vector3.new(-22.887208938598633, 4.323971748352051, 17.563125610351563),
                    mul = 1,
                },
                [10] = {
                    pos = Vector3.new(-36.20086669921875, 4.323972225189209, 39.163124084472656),
                    mul = 1,
                },
                [11] = {
                    pos = Vector3.new(-39.01280212402344, 7.350924491882324, 24.763126373291016),
                    mul = 1,
                },
                [12] = {
                    pos = Vector3.new(-43.71280288696289, 7.350924491882324, 24.763126373291016),
                    mul = 1,
                },
                [13] = {
                    pos = Vector3.new(-68.91280364990234, 7.350924491882324, 24.763126373291016),
                    mul = 1,
                },
                [14] = {
                    pos = Vector3.new(-70.16341400146484, 4.323971748352051, 40.80072784423828),
                    mul = 1,
                },
                [15] = {
                    pos = Vector3.new(-43.08719253540039, 5.423971176147461, 7.746218681335449),
                    mul = 1,
                },
                [16] = {
                    pos = Vector3.new(-47.68719482421875, 4.323971271514893, -0.33687496185302734),
                    mul = 1,
                },
                [17] = {
                    pos = Vector3.new(-41.712799072265625, 4.323972225189209, -6.536874294281006),
                    mul = 1,
                },
                [18] = {
                    pos = Vector3.new(-64.9871826171875, 2.999264717102051, 3.5462164878845215),
                    mul = 1,
                },
                [19] = {
                    pos = Vector3.new(-76.4585952758789, 2.9993627071380615, 6.5634026527404785),
                    mul = 1,
                },
                [20] = {
                    pos = Vector3.new(-28.69997787475586, 4.723962306976318, -40.4002685546875),
                    mul = 0.5,
                },
                [21] = {
                    pos = Vector3.new(-37.11280059814453, 4.323971748352051, -40.153785705566406),
                    mul = 1,
                },
                [22] = {
                    pos = Vector3.new(-38.5, 4.323972225189209, -30.400270462036133),
                    mul = 1,
                },
                [23] = {
                    pos = Vector3.new(-41.98719024658203, 4.323972225189209, -28.636873245239258),
                    mul = 1,
                },
                [24] = {
                    pos = Vector3.new(-48.4202995300293, 4.323971748352051, -24.894174575805664),
                    mul = 1,
                },
                [25] = {
                    pos = Vector3.new(-25.900001525878906, 3.623972177505493, -9.50027084350586),
                    mul = 0.5,
                },
                [26] = {
                    pos = Vector3.new(-26.079824447631836, 16.223968505859375, -25.24994468688965),
                    mul = 1,
                },
                [27] = {
                    pos = Vector3.new(-29.599998474121094, 14.723970413208008, -30.00029182434082),
                    mul = 1,
                },
                [28] = {
                    pos = Vector3.new(-15.499999046325684, 14.723970413208008, -32.50028991699219),
                    mul = 1,
                },
                [29] = {
                    pos = Vector3.new(-19.19999885559082, 14.723970413208008, -39.300270080566406),
                    mul = 1,
                },
                [30] = {
                    pos = Vector3.new(-35.900054931640625, 14.723970413208008, -32.800270080566406),
                    mul = 1,
                },
                [31] = {
                    pos = Vector3.new(-35.80005645751953, 14.723970413208008, -41.00027084350586),
                    mul = 1,
                },
                [32] = {
                    pos = Vector3.new(-38.78725814819336, 14.723970413208008, -40.23687744140625),
                    mul = 1,
                },
                [33] = {
                    pos = Vector3.new(-32.297950744628906, 14.723974227905273, -54.405521392822266),
                    mul = 1,
                },
                [34] = {
                    pos = Vector3.new(-21.89794921875, 14.723974227905273, -54.405521392822266),
                    mul = 0.75,
                },
                [35] = {
                    pos = Vector3.new(-23.79996681213379, 14.723974227905273, -50.400272369384766),
                    mul = 1,
                },
                [36] = {
                    pos = Vector3.new(-39.299190521240234, 13.399361610412598, -25.59900665283203),
                    mul = 1,
                },
                [37] = {
                    pos = Vector3.new(-39.49921798706055, 13.399360656738281, -8.400278091430664),
                    mul = 1,
                },
                [38] = {
                    pos = Vector3.new(-52.600006103515625, 13.399361610412598, -3.0002779960632324),
                    mul = 0.75,
                },
                [39] = {
                    pos = Vector3.new(-57.20000457763672, 13.399166107177734, 1.5997238159179688),
                    mul = 1,
                },
                [40] = {
                    pos = Vector3.new(-39.99557113647461, 13.69998550415039, 16.298934936523438),
                    mul = 0.5,
                },
                [41] = {
                    pos = Vector3.new(-40.09998321533203, 15.950002670288086, 17.800004959106445),
                    mul = 1,
                },
                [42] = {
                    pos = Vector3.new(-49.79999542236328, 15.954999923706055, 17.599998474121094),
                    mul = 1,
                },
                [43] = {
                    pos = Vector3.new(-59.779823303222656, 15.954363822937012, 17.599292755126953),
                    mul = 0.8,
                },
                [44] = {
                    pos = Vector3.new(-59.79999923706055, 19.57897186279297, 22.299724578857422),
                    mul = 1,
                },
                [45] = {
                    pos = Vector3.new(-59.28429412841797, 19.523988723754883, 36.69968032836914),
                    mul = 1,
                },
            },
            [2951213182] = {
                [1] = {
                    pos = Vector3.new(-20.376602172851563, 2.8240902423858643, 8.322555541992188),
                    mul = 1,
                },
                [2] = {
                    pos = Vector3.new(-25.58940315246582, 16.8240909576416, 22.159160614013672),
                    mul = 1,
                },
                [3] = {
                    pos = Vector3.new(-5.889402389526367, 18.224090576171875, 22.159160614013672),
                    mul = 0.75,
                },
                [4] = {
                    pos = Vector3.new(-5.889402389526367, 18.224090576171875, 28.359159469604492),
                    mul = 1,
                },
                [5] = {
                    pos = Vector3.new(-5.902793884277344, 15.624086380004883, 35.005706787109375),
                    mul = 1,
                },
                [6] = {
                    pos = Vector3.new(-5.989996910095215, 15.624088287353516, 40.75921630859375),
                    mul = 0.5,
                },
                [7] = {
                    pos = Vector3.new(3.410003662109375, 15.624088287353516, 40.75921630859375),
                    mul = 1,
                },
                [8] = {
                    pos = Vector3.new(3.410003662109375, 15.624088287353516, 31.359216690063477),
                    mul = 1,
                },
                [9] = {
                    pos = Vector3.new(16.910003662109375, 15.624088287353516, 33.75921630859375),
                    mul = 1,
                },
                [10] = {
                    pos = Vector3.new(12.610004425048828, 19.02408790588379, 42.55921936035156),
                    mul = 1,
                },
                [11] = {
                    pos = Vector3.new(12.110004425048828, 19.02408790588379, 46.05921936035156),
                    mul = 1,
                },
                [12] = {
                    pos = Vector3.new(12.110004425048828, 19.52408790588379, 50.55921936035156),
                    mul = 1,
                },
                [13] = {
                    pos = Vector3.new(15.110004425048828, 19.52408790588379, 57.55921936035156),
                    mul = 1,
                },
                [14] = {
                    pos = Vector3.new(15.110004425048828, 19.52408790588379, 55.85921859741211),
                    mul = 1,
                },
                [15] = {
                    pos = Vector3.new(28.610004425048828, 19.52408790588379, 55.85921859741211),
                    mul = 1,
                },
                [16] = {
                    pos = Vector3.new(33.61000442504883, 19.52408790588379, 66.95922088623047),
                    mul = 1,
                },
                [17] = {
                    pos = Vector3.new(2.610053539276123, 15.224071502685547, 64.65916442871094),
                    mul = 1,
                },
                [18] = {
                    pos = Vector3.new(4.510053634643555, 15.224071502685547, 95.95916748046875),
                    mul = 1,
                },
                [19] = {
                    pos = Vector3.new(27.009967803955078, 13.900097846984863, 97.65949249267578),
                    mul = 1,
                },
                [20] = {
                    pos = Vector3.new(15.010010719299316, 14.300114631652832, 90.30952453613281),
                    mul = 1,
                },
                [21] = {
                    pos = Vector3.new(15.022769927978516, 15.224071502685547, 84.2225570678711),
                    mul = 1,
                },
                [22] = {
                    pos = Vector3.new(26.92276954650879, 17.324071884155273, 84.2225570678711),
                    mul = 1,
                },
                [23] = {
                    pos = Vector3.new(26.92276954650879, 3.224071502685547, 82.92255401611328),
                    mul = 1,
                },
                [24] = {
                    pos = Vector3.new(26.92276954650879, 3.224071502685547, 95.7225570678711),
                    mul = 1,
                },
                [25] = {
                    pos = Vector3.new(14.422769546508789, 3.224071502685547, 99.32255554199219),
                    mul = 1,
                },
                [26] = {
                    pos = Vector3.new(14.422769546508789, 3.224071502685547, 82.62255859375),
                    mul = 1,
                },
                [27] = {
                    pos = Vector3.new(14.422769546508789, 3.224071502685547, 52.62255859375),
                    mul = 1,
                },
                [28] = {
                    pos = Vector3.new(42.510009765625, 3.424130439758301, 42.45921325683594),
                    mul = 1,
                },
                [29] = {
                    pos = Vector3.new(50.622772216796875, 3.2239999771118164, 52.62255859375),
                    mul = 1,
                },
                [30] = {
                    pos = Vector3.new(65.62277221679688, 3.224071502685547, 52.62255859375),
                    mul = 1,
                },
                [31] = {
                    pos = Vector3.new(75.8227767944336, 3.224071502685547, 44.12255859375),
                    mul = 1,
                },
                [32] = {
                    pos = Vector3.new(75.11015319824219, 3.2240805625915527, 36.55918884277344),
                    mul = 1,
                },
                [33] = {
                    pos = Vector3.new(76.01010131835938, 3.824079990386963, 61.65922927856445),
                    mul = 1,
                },
                [34] = {
                    pos = Vector3.new(76.01010131835938, 3.824079990386963, 67.5592269897461),
                    mul = 1,
                },
                [35] = {
                    pos = Vector3.new(14.610137939453125, 3.224104881286621, 28.459197998046875),
                    mul = 1,
                },
                [36] = {
                    pos = Vector3.new(-12.48968505859375, 3.424070358276367, 27.359214782714844),
                    mul = 1,
                },
                [37] = {
                    pos = Vector3.new(-36.78968811035156, 3.424070358276367, 27.359214782714844),
                    mul = 1,
                },
                [38] = {
                    pos = Vector3.new(-33.24726486206055, 2.9540624618530273, 18.207504272460938),
                    mul = 1,
                },
                [39] = {
                    pos = Vector3.new(-25.42828941345215, 2.9539999961853027, 19.722532272338867),
                    mul = 1,
                },
                [40] = {
                    pos = Vector3.new(-26.594999313354492, 2.9539999961853027, 9.664999961853027),
                    mul = 1,
                },
                [41] = {
                    pos = Vector3.new(-14.689868927001953, 3.224031448364258, 96.05950927734375),
                    mul = 1,
                },
            },
            [3590667014] = {
                [1] = {
                    pos = Vector3.new(183.24636840820313, 20.02405548095703, 32.411048889160156),
                    mul = 1,
                },
                [2] = {
                    pos = Vector3.new(112.33644104003906, 17.92400550842285, 13.36788558959961),
                    mul = 1,
                },
                [3] = {
                    pos = Vector3.new(104.03643798828125, 17.92400550842285, 13.36788558959961),
                    mul = 1,
                },
                [4] = {
                    pos = Vector3.new(94.84717559814453, 19.824005126953125, -24.993865966796875),
                    mul = 1,
                },
                [5] = {
                    pos = Vector3.new(73.26007080078125, 19.324045181274414, -24.1402530670166),
                    mul = 1,
                },
                [6] = {
                    pos = Vector3.new(62.860069274902344, 19.324045181274414, -24.1402530670166),
                    mul = 0.75,
                },
                [7] = {
                    pos = Vector3.new(55.260013580322266, 19.324010848999023, -34.54026794433594),
                    mul = 1,
                },
                [8] = {
                    pos = Vector3.new(58.76006317138672, 19.324010848999023, -36.140262603759766),
                    mul = 0.75,
                },
                [9] = {
                    pos = Vector3.new(35.96007537841797, 18.92400360107422, -47.14023208618164),
                    mul = 1,
                },
                [10] = {
                    pos = Vector3.new(26.104358673095703, 23.89590835571289, -53.136043548583984),
                    mul = 1,
                },
                [11] = {
                    pos = Vector3.new(14.939842224121094, 18.92400360107422, -60.48987579345703),
                    mul = 0.75,
                },
                [12] = {
                    pos = Vector3.new(7.439842224121094, 18.92400360107422, -60.48987579345703),
                    mul = 1,
                },
                [13] = {
                    pos = Vector3.new(7.439842224121094, 20.42400360107422, -52.68987274169922),
                    mul = 0.5,
                },
                [14] = {
                    pos = Vector3.new(7.48015022277832, 6.624006271362305, -37.18989944458008),
                    mul = 0.5,
                },
                [15] = {
                    pos = Vector3.new(7.759973526000977, 5.324004173278809, -30.74024772644043),
                    mul = 1,
                },
                [16] = {
                    pos = Vector3.new(32.45997619628906, 5.324004173278809, -30.74024772644043),
                    mul = 1,
                },
                [17] = {
                    pos = Vector3.new(66.46000671386719, 19.324005126953125, -36.44024658203125),
                    mul = 1,
                },
                [18] = {
                    pos = Vector3.new(66.46000671386719, 20.324005126953125, -43.2402458190918),
                    mul = 0.5,
                },
                [19] = {
                    pos = Vector3.new(66.04721069335938, 14.024006843566895, -50.776859283447266),
                    mul = 1,
                },
                [20] = {
                    pos = Vector3.new(66.04721069335938, 14.024006843566895, -56.67686080932617),
                    mul = 1,
                },
                [21] = {
                    pos = Vector3.new(58.547210693359375, 14.024006843566895, -56.67686080932617),
                    mul = 1,
                },
                [22] = {
                    pos = Vector3.new(58.547210693359375, 14.024006843566895, -47.97686004638672),
                    mul = 0.5,
                },
                [23] = {
                    pos = Vector3.new(57.7801628112793, 7.323978900909424, -39.28989791870117),
                    mul = 0.5,
                },
                [24] = {
                    pos = Vector3.new(57.7801628112793, 5.7239789962768555, -35.08989715576172),
                    mul = 1,
                },
                [25] = {
                    pos = Vector3.new(39.6801643371582, 5.7239789962768555, -35.08989715576172),
                    mul = 1,
                },
                [26] = {
                    pos = Vector3.new(36.160011291503906, 5.324006080627441, -32.940242767333984),
                    mul = 1,
                },
                [27] = {
                    pos = Vector3.new(47.760009765625, 9.324006080627441, -32.940242767333984),
                    mul = 1,
                },
                [28] = {
                    pos = Vector3.new(47.760009765625, 5.324006080627441, -13.940242767333984),
                    mul = 1,
                },
                [29] = {
                    pos = Vector3.new(64.86000061035156, 5.323999881744385, -5.940000057220459),
                    mul = 1,
                },
                [30] = {
                    pos = Vector3.new(68.86001586914063, 5.323975563049316, -17.640270233154297),
                    mul = 1,
                },
                [31] = {
                    pos = Vector3.new(31.047210693359375, 5.32400369644165, -56.69375228881836),
                    mul = 1,
                },
                [32] = {
                    pos = Vector3.new(26.459999084472656, 5.323999881744385, -77.44000244140625),
                    mul = 1,
                },
                [33] = {
                    pos = Vector3.new(15.260000228881836, 5.323999881744385, -81.63999938964844),
                    mul = 1,
                },
                [34] = {
                    pos = Vector3.new(35.46000671386719, 6.924003601074219, -24.040267944335938),
                    mul = 1,
                },
                [35] = {
                    pos = Vector3.new(33.060001373291016, 3.3239998817443848, -10.24027156829834),
                    mul = 1,
                },
                [36] = {
                    pos = Vector3.new(6.860000133514404, 3.3239998817443848, 0.05999999865889549),
                    mul = 1,
                },
                [37] = {
                    pos = Vector3.new(2.359999895095825, 3.3239998817443848, 11.760000228881836),
                    mul = 1,
                },
            },
            [4518266946] = {
                [1] = {
                    pos = Vector3.new(-76.73486328125, 9.63321590423584, 130.3460235595703),
                    mul = 2,
                },
                [2] = {
                    pos = Vector3.new(-94.63982391357422, 19.170907974243164, 121.25968170166016),
                    mul = 2,
                },
                [3] = {
                    pos = Vector3.new(-77.20426177978516, 8.757187843322754, 102.62760162353516),
                    mul = 0.75,
                },
                [4] = {
                    pos = Vector3.new(-64.28557586669922, 8.757189750671387, 108.20255279541016),
                    mul = 0.75,
                },
                [5] = {
                    pos = Vector3.new(-35.784244537353516, 11.33156967163086, 63.37843322753906),
                    mul = 0.8,
                },
                [6] = {
                    pos = Vector3.new(-16.241209030151367, 3.549454689025879, 36.78435516357422),
                    mul = 0.75,
                },
                [7] = {
                    pos = Vector3.new(-10.363006591796875, 3.5494532585144043, 29.34404182434082),
                    mul = 1,
                },
                [8] = {
                    pos = Vector3.new(-9.025506973266602, 3.5494532585144043, 25.887413024902344),
                    mul = 0.5,
                },
                [9] = {
                    pos = Vector3.new(-3.2393150329589844, 3.5494532585144043, 25.887413024902344),
                    mul = 0.5,
                },
                [10] = {
                    pos = Vector3.new(-3.2393155097961426, 3.5494532585144043, 19.540287017822266),
                    mul = 0.25,
                },
                [11] = {
                    pos = Vector3.new(-3.23931622505188, -5.793325901031494, 8.457051277160645),
                    mul = 0.8,
                },
                [12] = {
                    pos = Vector3.new(-12.221589088439941, -6.350544452667236, 5.795297622680664),
                    mul = 1,
                },
                [13] = {
                    pos = Vector3.new(-14.009870529174805, -6.350544452667236, 13.908618927001953),
                    mul = 1,
                },
                [14] = {
                    pos = Vector3.new(-12.471277236938477, 3.5494532585144043, 1.3570528030395508),
                    mul = 1,
                },
                [15] = {
                    pos = Vector3.new(-24.00069236755371, 3.3239731788635254, -17.400672912597656),
                    mul = 1,
                },
                [16] = {
                    pos = Vector3.new(-8.799992561340332, 3.40397310256958, -8.300275802612305),
                    mul = 1,
                },
                [17] = {
                    pos = Vector3.new(-8.799992561340332, 3.40397310256958, -61.000274658203125),
                    mul = 1,
                },
            },
            [4661507759] = {
                [1] = {
                    pos = Vector3.new(-8.665180206298828E-2, 3.4179999828338623, 59.51341247558594),
                    mul = 0.1,
                },
                [2] = {
                    pos = Vector3.new(3.1011276245117188, 3.4179999828338623, 64.85079956054688),
                    mul = 0.05,
                },
                [3] = {
                    pos = Vector3.new(-7.998997211456299, 3.4179999828338623, 64.75076293945313),
                    mul = 1,
                },
                [4] = {
                    pos = Vector3.new(-5.198997497558594, 3.4179999828338623, 59.650753021240234),
                    mul = 0.75,
                },
                [5] = {
                    pos = Vector3.new(-13.886655807495117, 3.4179999828338623, 59.41339874267578),
                    mul = 1,
                },
                [6] = {
                    pos = Vector3.new(-13.986652374267578, 3.4176435470581055, 96.21340942382813),
                    mul = 1,
                },
                [7] = {
                    pos = Vector3.new(15.015506744384766, 3.4171371459960938, 90.04719543457031),
                    mul = 1,
                },
                [8] = {
                    pos = Vector3.new(8.713348388671875, 7.6176438331604, 97.51341247558594),
                    mul = 1,
                },
                [9] = {
                    pos = Vector3.new(27.40035057067871, 6.513165473937988, 115.50180053710938),
                    mul = 1,
                },
                [10] = {
                    pos = Vector3.new(28.401498794555664, 3.4202451705932617, 141.00003051757813),
                    mul = 1,
                },
                [11] = {
                    pos = Vector3.new(32.80149841308594, 3.4202451705932617, 140.50003051757813),
                    mul = 1,
                },
                [12] = {
                    pos = Vector3.new(71.60182189941406, 3.4213924407958984, 146.20095825195313),
                    mul = 1,
                },
                [13] = {
                    pos = Vector3.new(70.78154754638672, 3.4213924407958984, 158.20706176757813),
                    mul = 1,
                },
                [14] = {
                    pos = Vector3.new(69.50186157226563, 3.4213919639587402, 182.30096435546875),
                    mul = 1,
                },
                [15] = {
                    pos = Vector3.new(66.08905029296875, 3.4213919639587402, 198.7643585205078),
                    mul = 1,
                },
                [16] = {
                    pos = Vector3.new(66.08905029296875, 3.4213919639587402, 206.96437072753906),
                    mul = 1,
                },
                [17] = {
                    pos = Vector3.new(83.019775390625, 3.421963691711426, 205.64663696289063),
                    mul = 0.5,
                },
                [18] = {
                    pos = Vector3.new(83.019775390625, 3.421963691711426, 197.046630859375),
                    mul = 1,
                },
                [19] = {
                    pos = Vector3.new(104.69931030273438, 3.421097755432129, 196.59677124023438),
                    mul = 1,
                },
                [20] = {
                    pos = Vector3.new(114.29931640625, 3.421097755432129, 196.29676818847656),
                    mul = 0.5,
                },
                [21] = {
                    pos = Vector3.new(73.85930633544922, 8.32669448852539, 210.13768005371094),
                    mul = 1,
                },
                [22] = {
                    pos = Vector3.new(91.6292495727539, 8.326876640319824, 211.17166137695313),
                    mul = 1,
                },
                [23] = {
                    pos = Vector3.new(91.94760131835938, 8.121856689453125, 227.0793914794922),
                    mul = 1,
                },
                [24] = {
                    pos = Vector3.new(92.0675277709961, 8.121856689453125, 243.83746337890625),
                    mul = 1,
                },
                [25] = {
                    pos = Vector3.new(72.94763946533203, 8.326889038085938, 226.84840393066406),
                    mul = 0.5,
                },
                [26] = {
                    pos = Vector3.new(118.06645202636719, 8.121856689453125, 261.1764831542969),
                    mul = 1,
                },
                [27] = {
                    pos = Vector3.new(134.82803344726563, 8.121857643127441, 278.32525634765625),
                    mul = 1,
                },
                [28] = {
                    pos = Vector3.new(100.44023895263672, 8.121856689453125, 286.6924743652344),
                    mul = 1,
                },
                [29] = {
                    pos = Vector3.new(92.04023742675781, 8.121856689453125, 286.6924743652344),
                    mul = 1,
                },
                [30] = {
                    pos = Vector3.new(35.98731994628906, 3.4221549034118652, 233.16355895996094),
                    mul = 1,
                },
                [31] = {
                    pos = Vector3.new(-24.79959487915039, 3.4235422611236572, 233.4996795654297),
                    mul = 1,
                },
                [32] = {
                    pos = Vector3.new(-32.79958724975586, 3.4235422611236572, 234.09971618652344),
                    mul = 1,
                },
                [33] = {
                    pos = Vector3.new(-47.10136413574219, 6.421858787536621, 228.60009765625),
                    mul = 1,
                },
                [34] = {
                    pos = Vector3.new(-46.7885627746582, 6.121858596801758, 219.8634796142578),
                    mul = 1,
                },
                [35] = {
                    pos = Vector3.new(-60.16203689575195, 6.1218581199646, 219.98919677734375),
                    mul = 1,
                },
                [36] = {
                    pos = Vector3.new(-24.79959487915039, 3.423578977584839, 203.4996795654297),
                    mul = 1,
                },
                [37] = {
                    pos = Vector3.new(-12.999592781066895, 3.4235410690307617, 203.3997039794922),
                    mul = 1,
                },
                [38] = {
                    pos = Vector3.new(1.500406265258789, 3.4235799312591553, 203.0996856689453),
                    mul = 0.5,
                },
                [39] = {
                    pos = Vector3.new(1.500406265258789, 3.4235613346099854, 218.19969177246094),
                    mul = 1,
                },
                [40] = {
                    pos = Vector3.new(-25.419763565063477, 3.42354154586792, 240.15008544921875),
                    mul = 1,
                },
                [41] = {
                    pos = Vector3.new(-25.419763565063477, 3.42354154586792, 245.05007934570313),
                    mul = 1.5,
                },
                [42] = {
                    pos = Vector3.new(-3.5867271423339844, 9.175957679748535, 278.7655029296875),
                    mul = 1.5,
                },
                [43] = {
                    pos = Vector3.new(37.920658111572266, 3.424191474914551, 326.2522277832031),
                    mul = 1.5,
                },
                [44] = {
                    pos = Vector3.new(72.5016860961914, 3.424191474914551, 327.8966369628906),
                    mul = 1,
                },
                [45] = {
                    pos = Vector3.new(82.1016845703125, 3.42419171333313, 327.8966369628906),
                    mul = 0.5,
                },
                [46] = {
                    pos = Vector3.new(82.1016845703125, 3.4242093563079834, 313.0966491699219),
                    mul = 1,
                },
                [47] = {
                    pos = Vector3.new(114.20018005371094, 3.4262051582336426, 180.69705200195313),
                    mul = 1,
                },
                [48] = {
                    pos = Vector3.new(-24.58679962158203, 3.42354154586792, 178.54617309570313),
                    mul = 1,
                },
                [49] = {
                    pos = Vector3.new(-32.89958190917969, 3.42354154586792, 178.4997100830078),
                    mul = 1,
                },
                [50] = {
                    pos = Vector3.new(-40.4996223449707, 3.423995018005371, 178.19940185546875),
                    mul = 1,
                },
                [51] = {
                    pos = Vector3.new(-48.799625396728516, 3.423995018005371, 162.59939575195313),
                    mul = 1,
                },
                [52] = {
                    pos = Vector3.new(-52.49962615966797, 3.423995018005371, 162.59939575195313),
                    mul = 0.75,
                },
                [53] = {
                    pos = Vector3.new(-66.19962310791016, 3.423995018005371, 162.59939575195313),
                    mul = 1,
                },
                [54] = {
                    pos = Vector3.new(-66.19962310791016, 3.423995018005371, 155.7993927001953),
                    mul = 1.5,
                },
                [55] = {
                    pos = Vector3.new(-66.19962310791016, 3.423995018005371, 91.5993881225586),
                    mul = 1.5,
                },
                [56] = {
                    pos = Vector3.new(-21.19700050354004, 3.4179999828338623, 56.83100128173828),
                    mul = 1,
                },
            },
            [4768829954] = {
                [1] = {
                    pos = Vector3.new(8.862091064453125, 31.32532501220703, -19.537464141845703),
                    mul = 1,
                },
                [2] = {
                    pos = Vector3.new(23.872684478759766, 35.4140739440918, -12.599403381347656),
                    mul = 0.75,
                },
                [3] = {
                    pos = Vector3.new(-1.8278121948242188, 35.60242462158203, -12.59943962097168),
                    mul = 1,
                },
                [4] = {
                    pos = Vector3.new(11.289063453674316, 31.32532501220703, -12.906108856201172),
                    mul = 1,
                },
                [5] = {
                    pos = Vector3.new(12.113168716430664, 31.82419204711914, 8.762553215026855),
                    mul = 1,
                },
                [6] = {
                    pos = Vector3.new(18.38567352294922, 29.324810028076172, 60.06352615356445),
                    mul = 1,
                },
                [7] = {
                    pos = Vector3.new(38.38567352294922, 29.324810028076172, 63.263526916503906),
                    mul = 1,
                },
                [8] = {
                    pos = Vector3.new(24.797271728515625, 29.325000762939453, 114.3995361328125),
                    mul = 1,
                },
                [9] = {
                    pos = Vector3.new(30.684471130371094, 29.322532653808594, 134.26266479492188),
                    mul = 1,
                },
                [10] = {
                    pos = Vector3.new(52.896827697753906, 29.32316780090332, 136.70028686523438),
                    mul = 1,
                },
                [11] = {
                    pos = Vector3.new(55.79678726196289, 29.323169708251953, 127.60029602050781),
                    mul = 1,
                },
                [12] = {
                    pos = Vector3.new(55.79678726196289, 29.323169708251953, 124.30029296875),
                    mul = 1,
                },
                [13] = {
                    pos = Vector3.new(69.197509765625, 30.324899673461914, 112.6011962890625),
                    mul = 1,
                },
                [14] = {
                    pos = Vector3.new(69.19720458984375, 42.92485809326172, 95.7009506225586),
                    mul = 1,
                },
                [15] = {
                    pos = Vector3.new(48.897464752197266, 41.3237190246582, 117.90019226074219),
                    mul = 1,
                },
                [16] = {
                    pos = Vector3.new(41.397464752197266, 41.3237190246582, 117.90019226074219),
                    mul = 1,
                },
                [17] = {
                    pos = Vector3.new(35.597023010253906, 41.32489776611328, 132.6994171142578),
                    mul = 1,
                },
                [18] = {
                    pos = Vector3.new(35.58388900756836, 41.32529067993164, 140.84620666503906),
                    mul = 1,
                },
                [19] = {
                    pos = Vector3.new(38.40949249267578, 41.32529067993164, 158.26312255859375),
                    mul = 1,
                },
                [20] = {
                    pos = Vector3.new(31.38421630859375, 41.32489776611328, 129.5628204345703),
                    mul = 1,
                },
                [21] = {
                    pos = Vector3.new(-7.515785217285156, 41.32489776611328, 126.46282196044922),
                    mul = 1,
                },
                [22] = {
                    pos = Vector3.new(-27.91578483581543, 42.22489929199219, 126.46282196044922),
                    mul = 1,
                },
                [23] = {
                    pos = Vector3.new(-43.58904266357422, 31.126079559326172, 127.16256713867188),
                    mul = 1,
                },
                [24] = {
                    pos = Vector3.new(-67.50209045410156, 34.92390823364258, 125.40982818603516),
                    mul = 1,
                },
                [25] = {
                    pos = Vector3.new(-100.41846466064453, 31.227235794067383, 108.30266571044922),
                    mul = 1,
                },
                [26] = {
                    pos = Vector3.new(-104.51847076416016, 29.32723617553711, 106.60266876220703),
                    mul = 1,
                },
                [27] = {
                    pos = Vector3.new(-119.61846923828125, 29.32723617553711, 106.60266876220703),
                    mul = 1,
                },
                [28] = {
                    pos = Vector3.new(-119.61846923828125, 29.32723617553711, 95.30266571044922),
                    mul = 1,
                },
                [29] = {
                    pos = Vector3.new(-119.61846923828125, 29.32723617553711, 87.20266723632813),
                    mul = 1,
                },
                [30] = {
                    pos = Vector3.new(-97.71503448486328, 17.328388214111328, 90.54534912109375),
                    mul = 1,
                },
                [31] = {
                    pos = Vector3.new(-91.21503448486328, 17.328388214111328, 90.54534912109375),
                    mul = 1,
                },
                [32] = {
                    pos = Vector3.new(-80.0875015258789, 29.327239990234375, 97.36045837402344),
                    mul = 1,
                },
                [33] = {
                    pos = Vector3.new(-17.102447509765625, 29.32192039489746, 87.39837646484375),
                    mul = 1,
                },
                [34] = {
                    pos = Vector3.new(-17.102447509765625, 29.32192039489746, 61.59837341308594),
                    mul = 1,
                },
                [35] = {
                    pos = Vector3.new(30.897552490234375, 29.32192039489746, 61.59837341308594),
                    mul = 1,
                },
                [36] = {
                    pos = Vector3.new(108.50064086914063, 29.326398849487305, 74.29632568359375),
                    mul = 1,
                },
                [37] = {
                    pos = Vector3.new(143.31143188476563, 29.326568603515625, 74.16506958007813),
                    mul = 1,
                },
                [38] = {
                    pos = Vector3.new(152.11143493652344, 29.326568603515625, 74.16506958007813),
                    mul = 1,
                },
                [39] = {
                    pos = Vector3.new(152.11143493652344, 29.326568603515625, 84.26506805419922),
                    mul = 1,
                },
                [40] = {
                    pos = Vector3.new(171.41143798828125, 29.326568603515625, 84.26506805419922),
                    mul = 1,
                },
                [41] = {
                    pos = Vector3.new(171.41143798828125, 29.326568603515625, 80.56507110595703),
                    mul = 1,
                },
                [42] = {
                    pos = Vector3.new(171.41143798828125, 29.326568603515625, 74.46507263183594),
                    mul = 1,
                },
                [43] = {
                    pos = Vector3.new(179.63385009765625, 29.328054428100586, 69.3034896850586),
                    mul = 1,
                },
                [44] = {
                    pos = Vector3.new(177.7988739013672, 29.328052520751953, 63.00281524658203),
                    mul = 1,
                },
                [45] = {
                    pos = Vector3.new(177.7988739013672, 29.328052520751953, 46.70281219482422),
                    mul = 1,
                },
                [46] = {
                    pos = Vector3.new(164.1988525390625, 29.328052520751953, 44.40281677246094),
                    mul = 1,
                },
                [47] = {
                    pos = Vector3.new(50.59536361694336, 31.51506805419922, 204.40025329589844),
                    mul = 1,
                },
                [48] = {
                    pos = Vector3.new(53.51300811767578, 17.31850814819336, 240.75027465820313),
                    mul = 1,
                },
                [49] = {
                    pos = Vector3.new(48.7928352355957, 17.318504333496094, 247.29995727539063),
                    mul = 1,
                },
                [50] = {
                    pos = Vector3.new(56.89283752441406, 17.318504333496094, 273.89996337890625),
                    mul = 1,
                },
                [51] = {
                    pos = Vector3.new(41.99283981323242, 17.318504333496094, 273.89996337890625),
                    mul = 1,
                },
                [52] = {
                    pos = Vector3.new(14.297271728515625, 29.32253646850586, 121.39926147460938),
                    mul = 1,
                },
                [53] = {
                    pos = Vector3.new(-1.6027288436889648, 29.32253646850586, 121.39926147460938),
                    mul = 1,
                },
                [54] = {
                    pos = Vector3.new(-9.602697372436523, 29.322534561157227, 114.99925994873047),
                    mul = 1,
                },
                [55] = {
                    pos = Vector3.new(-17.002696990966797, 29.322534561157227, 114.99925994873047),
                    mul = 1,
                },
                [56] = {
                    pos = Vector3.new(-17.802696228027344, 29.322534561157227, 55.99925994873047),
                    mul = 1,
                },
                [57] = {
                    pos = Vector3.new(-38.09202194213867, 32.40471649169922, 36.55138397216797),
                    mul = 1,
                },
                [58] = {
                    pos = Vector3.new(-38.613094329833984, 31.32659339904785, 10.944046020507813),
                    mul = 1,
                },
                [59] = {
                    pos = Vector3.new(-38.613094329833984, 31.32659339904785, -3.0559539794921875),
                    mul = 1,
                },
                [60] = {
                    pos = Vector3.new(-37.899925231933594, 44.42582321166992, 1.9007432460784912),
                    mul = 1,
                },
                [61] = {
                    pos = Vector3.new(-35.78945541381836, 41.32499694824219, 27.404634475708008),
                    mul = 1,
                },
                [62] = {
                    pos = Vector3.new(-7.451181411743164, 41.424991607666016, 56.890472412109375),
                    mul = 1,
                },
                [63] = {
                    pos = Vector3.new(27.19883155822754, 41.32737350463867, 64.9992446899414),
                    mul = 1,
                },
                [64] = {
                    pos = Vector3.new(51.399654388427734, 41.32699966430664, 37.00054168701172),
                    mul = 1,
                },
            },
        }
        af_util.conditions = {
            [3200010305] = {
                [af_util.checks.ItemCheck] = {
                    'KeycardScrambler',
                },
                [af_util.checks.ClassCheck] = {
                    {
                        'hacker',
                    },
                },
            },
            [2625195454] = {
                [af_util.checks.ItemCheck] = {
                    'Drill',
                },
                [af_util.checks.ClassCheck] = {
                    {
                        'thief',
                        'hacker',
                    },
                },
            },
            [2797881676] = {
                [af_util.checks.ArmorCheck] = {},
                [af_util.checks.WeaponCheck] = {},
            },
            [2951213182] = {
                [af_util.checks.ArmorCheck] = {},
                [af_util.checks.WeaponCheck] = {},
            },
            [3590667014] = {},
            [4518266946] = {
                [af_util.checks.ArmorCheck] = {},
                [af_util.checks.WeaponCheck] = {},
            },
            [4661507759] = {},
            [4768829954] = {},
        }
        af_util.bounds = {
            [2625195454] = {
                [1] = {
                    spots = {
                        Vector3.new(211.03, 186.5, 115),
                        Vector3.new(210.03, 186.5, 56),
                        Vector3.new(167.03, 186.5, 56),
                        Vector3.new(167.03, 186.5, 94),
                    },
                    region = {
                        position = CFrame.new(189.53, 191.8, 85),
                        size = Vector3.new(45, 11.6, 62),
                    },
                },
            },
        }

        return af_util
    end
    function __DARKLUA_BUNDLE_MODULES.r()
        local Players = game:GetService('Players')
        local UserInputService = game:GetService('UserInputService')
        local RunService = game:GetService('RunService')
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local Lighting = game:GetService('Lighting')
        local NetworkSettings = settings():GetService('NetworkSettings')
        local TeleportService = game:GetService('TeleportService')
        local FogEnd = nil
        local GameState = nil
        local start_time = nil
        local Difficulty = nil
        local Loadout = ReplicatedStorage:WaitForChild('Loadout', math.huge)
        local Shop = Loadout:WaitForChild('Shop', math.huge)
        local LocalPlayer = Players.LocalPlayer
        local PlayerData = LocalPlayer:WaitForChild('PlayerData', math.huge)
        local Armory = PlayerData:WaitForChild('Armory', math.huge)
        local PlayerGui = LocalPlayer.PlayerGui
        local Camera = workspace.CurrentCamera
        local Mouse = LocalPlayer:GetMouse()
        local Status = LocalPlayer:WaitForChild('Status', math.huge)
        local Ammo = Status:WaitForChild('Ammo', math.huge)
        local Tools = Status:WaitForChild('Tools')
        local Level = nil
        local Glass = nil
        local Geometry = nil
        local Triggers = nil
        local Doors = nil
        local GroundItems = nil
        local GroundWeps = nil
        local Flags = nil
        local Armed = nil
        local places = __DARKLUA_BUNDLE_MODULES.load('b')
        local tools = __DARKLUA_BUNDLE_MODULES.load('d')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local teleport = __DARKLUA_BUNDLE_MODULES.load('n')
        local scr_settings = __DARKLUA_BUNDLE_MODULES.load('f')
        local esp_mgr = nil
        local npc_mgr = nil
        local obj_mgr = nil
        local ms_data = nil
        local music = nil
        local rmts_mgr = nil
        local objassist_mgr = nil
        local lobby = nil
        local GetRemote = nil

        if places.place_group == 'mission' then
            FogEnd = Lighting.FogEnd

            local events = ReplicatedStorage:WaitForChild('Events', math.huge)
            local debug_mode = events:WaitForChild('DebugMode', math.huge)

            while debug_mode == nil or debug_mode.Parent == nil do
                task.wait()
            end

            debug_mode:Destroy()

            GameState = ReplicatedStorage:WaitForChild('GameState', math.huge)
            start_time = GameState:WaitForChild('Start', math.huge)
            Difficulty = GameState:WaitForChild('Difficulty', math.huge).Value
            Level = workspace:WaitForChild('Level', math.huge)
            Glass = Level:WaitForChild('Glass', math.huge)
            Geometry = Level:WaitForChild('Geometry', math.huge)
            Triggers = Level:WaitForChild('Triggers', math.huge)
            Doors = Geometry:WaitForChild('Doors', math.huge)
            GroundItems = Level:WaitForChild('GroundItems', math.huge)
            GroundWeps = Level:WaitForChild('GroundWeps', math.huge)
            Flags = Level:WaitForChild('Flags', math.huge):WaitForChild(LocalPlayer.Name)
            Armed = Flags:WaitForChild('Armed', math.huge)
            npc_mgr = __DARKLUA_BUNDLE_MODULES.load('k')
            obj_mgr = __DARKLUA_BUNDLE_MODULES.load('o')
            ms_data = __DARKLUA_BUNDLE_MODULES.load('i')
            music = __DARKLUA_BUNDLE_MODULES.load('l')
            rmts_mgr = __DARKLUA_BUNDLE_MODULES.load('h')
            objassist_mgr = __DARKLUA_BUNDLE_MODULES.load('p')
            esp_mgr = __DARKLUA_BUNDLE_MODULES.load('g')
            GetRemote = rmts_mgr.GetRemote
        end
        if places.place_group == 'lobby' then
            lobby = __DARKLUA_BUNDLE_MODULES.load('m')
        end

        local cmds_mgr = {}

        cmds_mgr.flags = {
            esp = false,
            noclip = false,
            killaura = false,
            rmshields = false,
            loud = false,
            instagrab = false,
            nofog = false,
            gesp = false,
            spkill = false,
            loopws = false,
            loopjp = false,
            infjump = false,
            infammo = false,
            loopitem = false,
            loopwep = false,
            loopbag = false,
            noflash = false,
            opendoors = false,
            ctrlcheck = false,
            lag = false,
            telekinesis = false,
            snaketouch = false,
            unlockengi = false,
            strweps = false,
            gmweps = false,
            gclearance = false,
            teamheal = false,
            tower = false,
            orbit = false,
            killboss = false,
            disarm = false,
            autofarm = false,
            unlockstash = false,
        }
        cmds_mgr.conns = {
            loopws = nil,
            loopjp = nil,
            infjump = {},
            infammo = {},
            loopbag = nil,
            loopwep = nil,
            loopitem = nil,
            noflash = {},
            opendoors = {},
            telekinesis = nil,
            ctrlcheck = nil,
            teamheal = {},
        }

        local flags = cmds_mgr.flags
        local conns = cmds_mgr.conns

        cache.flags = flags
        cache.conns = conns
        cmds_mgr.IsCommandExists = function(cmd)
            for _, data in ipairs(cmds_mgr.cmds)do
                if data.name == cmd then
                    return true
                end
            end

            return false
        end
        cmds_mgr.GetMatchedCommands = function(cmd_part)
            local matches = {}
            local exact_match = false

            for _, data in ipairs(cmds_mgr.cmds)do
                if data.name == cmd_part then
                    exact_match = true

                    continue
                end
                if string.find(data.name, '^' .. cmd_part) then
                    table.insert(matches, data.name)
                end
            end

            return matches, exact_match
        end
        cmds_mgr.GetCmdData = function(cmd)
            for _, data in ipairs(cmds_mgr.cmds)do
                if data.name == cmd then
                    return data
                end
            end

            return nil
        end
        cmds_mgr.GetCmdFlag = function(cmd)
            for command, flag in pairs(cmds_mgr.flags)do
                if cmd == command then
                    return flag
                end
            end

            return nil
        end

        Players.PlayerDisconnecting:Connect(function(player)
            if player.Name ~= LocalPlayer.Name then
                return
            end

            NetworkSettings.IncomingReplicationLag = 0
        end)

        cmds_mgr.cmds = {
            {
                name = 'esp',
                mode = 'mission',
                desc = 
[[esp

call: esp
command type: switch, invisible, reversible

description: allows you to see npcs, items, weapons and some mission objects through the walls.]],
                usage_example = 'esp',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    for _, esp in ipairs(esp_mgr.data.esps)do
                        esp[esp.ClassName == 'Highlight' and 'Enabled' or 'Visible'] = is_enabled
                    end
                end,
            },
            {
                name = 'noclip',
                mode = 'mission',
                desc = 
[[noclip

call: noclip
command type: switch, visible, reversible

description: makes your character invisible for physical objects, what allows you to walk through them.]],
                usage_example = 'noclip',
                required_parts = {
                    'Head',
                    'UpperTorso',
                    'LowerTorso',
                    'HumanoidRootPart',
                    'HeadM',
                    'Hat',
                    'HeadCollision',
                    'HeadCollision',
                },
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled, ...)
                    is_enabled = not is_enabled

                    for _, body_part in ipairs({...})do
                        body_part.CanCollide = is_enabled
                    end
                end,
            },
            {
                name = 'loopws',
                mode = 'mission',
                desc = 
[[loopws

call: loopws <walkspeed: number>
command type: switch, visible, reversible

description: changes your character's walk speed to the one you specified in the <walkspeed> argument. Reuse returns the default speed (16).]],
                usage_example = 'loopws 50\n\nloopws',
                required_parts = {
                    'Humanoid',
                },
                checks = {
                    args = {
                        [1] = {
                            name = 'walkspeed',
                            required = true,
                            type = 'number',
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled, humanoid, walkspeed)
                    if is_enabled then
                        humanoid.WalkSpeed = tonumber(walkspeed)
                        conns.loopws = humanoid:GetPropertyChangedSignal('WalkSpeed'):Connect(function(
                        )
                            humanoid.WalkSpeed = walkspeed
                        end)
                    else
                        humanoid.WalkSpeed = 16
                    end
                end,
            },
            {
                name = 'loopjp',
                mode = 'mission',
                desc = 
[[loopjp

call: loopjp <jumppower: number>
command type: switch, visible, reversible

description: changes your character's jump power to the one you specified in the <jumppower> argument. Reuse returns the default jump power (50).]],
                usage_example = 'loopjp 100\nloopjp',
                required_parts = {
                    'Humanoid',
                },
                checks = {
                    args = {
                        [1] = {
                            name = 'jumppower',
                            required = true,
                            type = 'number',
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled, humanoid, jumppower)
                    if is_enabled == true then
                        conns.loopjp = humanoid:GetPropertyChangedSignal('JumpPower'):Connect(function(
                        )
                            humanoid.JumpPower = jumppower
                        end)
                    end
                end,
            },
            {
                name = 'infjump',
                mode = 'mission',
                desc = 
[[infjump

call: infjump
command type: switch, visible, reversible

description: this command allows you to jump by pushing off the air, you can hold down space to fly this way. Reuse disables this feature.]],
                usage_example = 'infjump',
                required_parts = {
                    'Humanoid',
                },
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled, humanoid)
                    if is_enabled == true then
                        local holding_space = false

                        conns.infjump[1] = UserInputService.InputBegan:Connect(function(
                            input
                        )
                            if input.KeyCode == Enum.KeyCode.Space and UserInputService:GetFocusedTextBox() == nil then
                                holding_space = true

                                while holding_space == true and RunService.RenderStepped:Wait() do
                                    humanoid:ChangeState('Jumping')
                                end
                            end
                        end)
                        conns.infjump[2] = UserInputService.InputEnded:Connect(function(
                            input
                        )
                            if input.KeyCode == Enum.KeyCode.Space and UserInputService:GetFocusedTextBox() == nil then
                                holding_space = false
                            end
                        end)
                    end
                end,
            },
            {
                name = 'infammo',
                mode = 'mission',
                desc = 
[[infammo

call: infammo
command type: switch, visible, irreversible

description: gives you 1000000000000000000 ammo for all ammo types except 40mm Grenade (Thumper) and disables ammo spending. Reuse turns on ammo spending, but doesn't returns ammo to default values.]],
                usage_example = 'infammo',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    if is_enabled == true then
                        for _, ammo_type in ipairs(Ammo:GetChildren())do
                            if ammo_type.Name == '40mm Grenade' then
                                continue
                            end

                            ammo_type.Value = 1000000000000000000

                            local listener = ammo_type:GetPropertyChangedSignal('Value'):Connect(function(
                            )
                                ammo_type.Value = 1000000000000000000
                            end)

                            table.insert(conns.infammo, listener)
                        end
                    end
                end,
            },
            {
                name = 'killaura',
                mode = 'mission',
                desc = 
[[killaura

call: killaura
command type: switch, visible, irreversible, network ownership dependent

description: kills every npc in the mission, automatically kills all spawning npcs. Reuse disables this feature.]],
                usage_example = 'killaura',
                checks = {
                    args = {
                        [1] = {
                            name = 'mode',
                            required = false,
                            type = 'number',
                            tip_gen = function(_)
                                return {
                                    '1',
                                    '2',
                                }
                            end,
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled, mode)
                    if is_enabled == true then
                        mode = tonumber(mode)

                        for npc, data in pairs(npc_mgr.npcs_data.all.npcs)do
                            if mode == 2 then
                                cache.killaura_mode = 2

                                if data.team == 'enemies' then
                                    while data and data.humanoid and data.humanoid.Health > 0 do
                                        tools.SimulateKnifeHit(data.humanoid, data.hrp, 1000)
                                    end
                                else
                                    tools.SimulateKnifeHit(data.humanoid, data.hrp, 1000)
                                end
                            else
                                cache.killaura_mode = 1

                                if data.team == 'snipers' then
                                    continue
                                end

                                npc_mgr.KillNPC(npc)
                            end
                        end
                    else
                        if mode == 2 and Armed.Value == false and tools.ClearWeaponKey ~= nil then
                            tools.ClearWeaponKey()
                        end
                    end
                end,
            },
            {
                name = 'kill',
                mode = 'mission',
                desc = 
[[kill

call: kill <npc_group: text>+
command type: one time, visible, irreversible, network ownership dependent

description: kills every npc of selected group(s).]],
                usage_example = 'kill w g s c\nkill a\nkill all',
                checks = {
                    args = {
                        [1] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                }
                            end,
                        },
                    },
                    sp_allowed = false,
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(...)
                    local count = 0

                    for _, group in ipairs({...})do
                        if group == 'sp' then
                            continue
                        end

                        local group_npcs = npc_mgr.aliases[group]

                        if group_npcs == nil then
                            continue
                        end

                        for npc, _ in pairs(group_npcs)do
                            npc_mgr.KillNPC(npc)

                            count = count + 1
                        end
                    end

                    return 'kill: successfully killed ' .. tostring(count) .. ' npcs.'
                end,
            },
            {
                name = 'bring',
                mode = 'mission',
                desc = 
[[bring

call: bring <npc_group: text>+
command type: one time, visible, reversible, network ownership dependent

description: brings every npc of selected group(s) to the position of your character.]],
                usage_example = 'bring w g s c\nbring a\nbring all',
                required_parts = {
                    'HumanoidRootPart',
                },
                checks = {
                    args = {
                        [1] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                }
                            end,
                        },
                    },
                    sp_allowed = false,
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(hrp, ...)
                    local count = 0

                    for _, group in ipairs({...})do
                        if group == 'sp' then
                            continue
                        end

                        local group_npcs = npc_mgr.aliases[group]

                        if group_npcs == nil then
                            continue
                        end

                        for npc, _ in pairs(group_npcs)do
                            npc_mgr.MoveNPC(npc, hrp.Position)

                            count = count + 1
                        end
                    end

                    return 'bring: successfully brought ' .. tostring(count) .. ' npcs.'
                end,
            },
            {
                name = 'hide',
                mode = 'mission',
                desc = 
[[hide

call: hide <npc_group: text>+
command type: one time, visible, reversible, network ownership dependent

description: hides every npc of selected group(s) to the place they can't get out. The place depends on the mission in which you are executing this command.]],
                usage_example = 'hide w g s c\nhide a\nhide all',
                checks = {
                    args = {
                        [1] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                }
                            end,
                        },
                    },
                    sp_allowed = false,
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(...)
                    local count = 0

                    for _, group in ipairs({...})do
                        if group == 'sp' then
                            continue
                        end

                        local group_npcs = npc_mgr.aliases[group]

                        if group_npcs == nil then
                            continue
                        end

                        for npc, _ in pairs(group_npcs)do
                            npc_mgr.HideNPC(npc)

                            count = count + 1
                        end
                    end

                    return 'hide: successfully hid ' .. tostring(count) .. ' npcs.'
                end,
            },
            {
                name = 'void',
                mode = 'mission',
                desc = 
[[void

call: void <npc_group: text>+
command type: one time, visible, irreversible, network ownership dependent

description: throws every npc of selected group(s) to the void. This command can be used to kill npcs without losing the "no kills" bonus.]],
                usage_example = 'hide w g s c\nhide a\nhide all',
                checks = {
                    args = {
                        [1] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                }
                            end,
                        },
                    },
                    sp_allowed = false,
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(...)
                    local count = 0

                    for _, group in ipairs({...})do
                        if group == 'sp' then
                            continue
                        end

                        local group_npcs = npc_mgr.aliases[group]

                        if group_npcs == nil then
                            continue
                        end

                        for npc, data in pairs(group_npcs)do
                            npc_mgr.MoveNPC(npc, Vector3.new(data.hrp.Position.X, 
-25E5, data.hrp.Position.Z))

                            count = count + 1
                        end
                    end

                    return 'void: successfully threw to the void ' .. tostring(count) .. ' npcs.'
                end,
            },
            {
                name = 'raykill',
                mode = 'mission',
                desc = 
[[raykill

call: raykill
command type: one time, visible, irreversible, network ownership dependent

description: kills the npc that the center of your screen is pointing at.]],
                usage_example = 'raykill',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function()
                    local npc = npc_mgr.GetNPCOnRay()

                    if not npc then
                        return
                    end

                    local data = npc_mgr.npcs_data.all.npcs[npc]

                    if data.team == 'snipers' then
                        return
                    end

                    npc_mgr.KillNPC(npc)
                end,
            },
            {
                name = 'raybring',
                mode = 'mission',
                desc = 
[[raybring

call: raybring
command type: one time, visible, reversible, network ownership dependent

description: brings the npc that the center of your screen is pointing at to the position of your character.]],
                usage_example = 'raybring',
                required_parts = {
                    'HumanoidRootPart',
                },
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(hrp)
                    local npc = npc_mgr.GetNPCOnRay()

                    if not npc then
                        return
                    end

                    local data = npc_mgr.npcs_data.all.npcs[npc]

                    if data.team == 'snipers' then
                        return
                    end

                    npc_mgr.MoveNPC(npc, hrp.Position)
                end,
            },
            {
                name = 'rayhide',
                mode = 'mission',
                desc = 
[[rayhide

call: rayhide
command type: one time, visible, reversible, network ownership dependent

description: hides the npc that the center of your screen is pointing at to the place it can't get out. The place depends on the mission in which you are executing this command.]],
                usage_example = 'rayhide',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function()
                    local npc = npc_mgr.GetNPCOnRay()

                    if not npc then
                        return
                    end

                    local data = npc_mgr.npcs_data.all.npcs[npc]

                    if data.team == 'snipers' then
                        return
                    end

                    npc_mgr.HideNPC(npc)
                end,
            },
            {
                name = 'rayvoid',
                mode = 'mission',
                desc = 
[[rayvoid

call: rayvoid
command type: one time, visible, irreversible, network ownership dependent

description: throws to the void the npc that the center of your screen is pointing at.]],
                usage_example = 'rayvoid',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function()
                    local npc = npc_mgr.GetNPCOnRay()

                    if not npc then
                        return
                    end

                    local data = npc_mgr.npcs_data.all.npcs[npc]

                    if data.team == 'snipers' then
                        return
                    end

                    npc_mgr.MoveNPC(npc, Vector3.new(data.hrp.Position.X, -25E5, data.hrp.Position.Z))
                end,
            },
            {
                name = 'loopitem',
                mode = 'mission',
                desc = 
[[loopitem

call: loopitem
command type: switch, visible, reversible, network ownership dependent

description: sticks all not frozen item to your character. Reuse disables this feature.]],
                usage_example = 'loopitem',
                required_parts = {
                    'HumanoidRootPart',
                },
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled, hrp)
                    if is_enabled == true then
                        conns.loopitem = RunService.RenderStepped:Connect(function(
                        )
                            for _, data in pairs(obj_mgr.items)do
                                data.align_p.Position = hrp.Position
                            end
                        end)
                    end

                    for obj, data in pairs(obj_mgr.items)do
                        if data.base.Anchored == true then
                            continue
                        end

                        obj_mgr.NoclipOBJ(obj, not is_enabled)

                        data.align_o.Enabled = is_enabled
                        data.align_p.Enabled = is_enabled
                    end
                end,
            },
            {
                name = 'loopwep',
                mode = 'mission',
                desc = 
[[loopwep

call: loopwep
command type: switch, visible, reversible, network ownership dependent

description: sticks all not frozen weapons to your character. Reuse disables this feature.]],
                usage_example = 'loopwep',
                required_parts = {
                    'HumanoidRootPart',
                },
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled, hrp)
                    if is_enabled == true then
                        conns.loopwep = RunService.RenderStepped:Connect(function(
                        )
                            for _, data in pairs(obj_mgr.weapons)do
                                data.align_p.Position = hrp.Position
                            end
                        end)
                    end

                    for obj, data in pairs(obj_mgr.weapons)do
                        if data.base.Anchored == true then
                            continue
                        end

                        obj_mgr.NoclipOBJ(obj, not is_enabled)

                        data.align_o.Enabled = is_enabled
                        data.align_p.Enabled = is_enabled
                    end
                end,
            },
            {
                name = 'loopbag',
                mode = 'mission',
                desc = 
[[loopbag

call: loopbag
command type: switch, visible, reversible, network ownership dependent

description: sticks all not frozen bags to your character. Reuse disables this feature.]],
                usage_example = 'loopbag',
                required_parts = {
                    'HumanoidRootPart',
                },
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled, hrp)
                    if is_enabled == true then
                        conns.loopbag = RunService.RenderStepped:Connect(function(
                        )
                            for _, data in pairs(obj_mgr.bags)do
                                data.align_p.Position = hrp.Position
                            end
                        end)
                    end

                    for obj, data in pairs(obj_mgr.bags)do
                        if data.base.Anchored == true then
                            continue
                        end

                        obj_mgr.NoclipOBJ(obj, not is_enabled)

                        data.align_o.Enabled = is_enabled
                        data.align_p.Enabled = is_enabled
                    end
                end,
            },
            {
                name = 'rmshields',
                mode = 'mission',
                desc = 
[[rmshields

call: rmshields
command type: switch, invisible, reversible

description: removes the shields of enemies and all spawning enemies. Reuse doesn't returns back the shields of spawned enemies, but stops removing shileds of spawning enemies.]],
                usage_example = 'rmshields',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    if is_enabled then
                        for npc, _ in pairs(npc_mgr.npcs_data.enemies.npcs)do
                            task.spawn(function()
                                local shield = npc:WaitForChild('S97Shield', 3)

                                if shield == nil then
                                    return
                                end

                                shield:Destroy()
                            end)
                        end
                    end
                end,
            },
            {
                name = 'noflash',
                mode = 'mission',
                desc = 
[[noflash

call: noflash
command type: switch, invisible, reversible

description: removes the temporary blindness effect of exploding flashbangs. Reuse disables this feature.]],
                usage_example = 'noflash',
                required_parts = {
                    'Humanoid',
                },
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled, humanoid)
                    local flashbang = PlayerGui:WaitForChild('Weapons', math.huge):WaitForChild('WeaponGui', math.huge):WaitForChild('Flashbang', math.huge)

                    tools.WaitForChildWithIndex(Camera, 4)

                    if is_enabled == true then
                        flashbang.Visible = false
                        Camera = workspace.CurrentCamera

                        tools.ChildCounter(4, Camera, function(effect)
                            if not table.find({
                                'Blur',
                                'ColorCorrection',
                            }, effect.Name) then
                                return false
                            end

                            effect.Enabled = false

                            local listener = effect:GetPropertyChangedSignal('Enabled'):Connect(function(
                            )
                                effect.Enabled = false
                            end)

                            table.insert(conns.noflash, listener)

                            return true
                        end)

                        local death_listener = humanoid.HealthChanged:Connect(function(
                            health
                        )
                            if tostring(health) == 'nan' then
                                return
                            end
                            if health <= 0 then
                                flashbang.Visible = true

                                tools.ChildCounter(4, Camera, function(effect)
                                    if not table.find({
                                        'Blur',
                                        'ColorCorrection',
                                    }, effect.Name) then
                                        return false
                                    end

                                    effect.Enabled = true

                                    return true
                                end)
                            end
                        end)

                        table.insert(conns.noflash, death_listener)
                    else
                        flashbang.Visible = true

                        tools.ChildCounter(4, Camera, function(effect)
                            if not table.find({
                                'Blur',
                                'ColorCorrection',
                            }, effect.Name) then
                                return false
                            end

                            effect.Enabled = true

                            return true
                        end)
                    end
                end,
            },
            {
                name = 'killboss',
                mode = 'mission',
                desc = 
[[killboss

call: killboss
command type: one time, visible, irreversible

description: deals a huge damage to the boss (SWAT vans, helicopters, Onyx Unit) as soon as it spawns. ]],
                usage_example = 'killboss',
                checks = {
                    boss_required = true,
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    if is_enabled == true then
                        cache.complex_cmds.killboss = tools.CreatePendingTask(ms_data.current.kill_boss)
                    else
                        tools.ClearTableTask(cache.complex_cmds, 'killboss')
                    end
                end,
            },
            {
                name = 'godmode',
                mode = 'mission',
                desc = 
[[godmode

call: godmode <teammate_name: text>?+
command type: one time, visible, reversible

description: gives the full immunity to any type and strength of damage to teammate(s). To remove godmode from their character, they must use medkit. They must also use the medkit before completing the mission, otherwise the game will count this as their death.]],
                usage_example = 'godmode averydumbcheese\ngodmode',
                requires_char = true,
                checks = {
                    args = {
                        [1] = {
                            name = 'teammate_name',
                            required = false,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                local names = {}

                                for _, player in ipairs(Players:GetChildren())do
                                    if player.Name == LocalPlayer.Name then
                                        continue
                                    end

                                    table.insert(names, player.Name)
                                end

                                return names
                            end,
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(_, ...)
                    if not ReplicatedStorage:FindFirstChild('FriendlyFire') then
                        return 'godmode works only in Elite+ missions.'
                    end

                    local teammate_names = {...}

                    if #teammate_names ~= 0 then
                        for index, name in ipairs(teammate_names)do
                            teammate_names[index] = tools.PlayerDataByName(name)
                        end
                    else
                        teammate_names = obj_mgr.players
                    end

                    for player, data in pairs(teammate_names)do
                        if player == LocalPlayer or data.head_collision == nil then
                            continue
                        end

                        while cache.shoot_cooldown == true do
                            task.wait()
                        end

                        cache.shoot_cooldown = true

                        if getsenv ~= nil and clonefunction ~= nil then
                            tools.SimulateKnifeHit(data.humanoid, data.head_collision, 0 / 0)
                        else
                            tools.SimulateShoot(data.head_collision, 0 / 0)
                        end

                        cache.shoot_cooldown = false
                    end
                end,
            },
            {
                name = 'teamkill',
                mode = 'mission',
                desc = 
[[teamkill

call: teamkill <teammate_name: text>?+
command type: one time, visible, irreversible

description: instantly kills your teammate(s).]],
                usage_example = 'teamkill averydumbcheese\nteamkill',
                requires_char = true,
                checks = {
                    args = {
                        [1] = {
                            name = 'teammate_name',
                            required = false,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                local names = {}

                                for _, player in ipairs(Players:GetChildren())do
                                    if player.Name == LocalPlayer.Name then
                                        continue
                                    end

                                    table.insert(names, player.Name)
                                end

                                return names
                            end,
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(_, ...)
                    if not ReplicatedStorage:FindFirstChild('FriendlyFire') then
                        return 'teamkill works only on Elite+ missions.'
                    end

                    local teammate_names = {...}

                    if #teammate_names ~= 0 then
                        for index, name in ipairs(teammate_names)do
                            teammate_names[index] = tools.PlayerDataByName(name)
                        end
                    else
                        teammate_names = obj_mgr.players
                    end

                    for player, data in pairs(teammate_names)do
                        if player == LocalPlayer or data.head_collision == nil then
                            continue
                        end

                        while cache.shoot_cooldown == true do
                            task.wait()
                        end

                        cache.shoot_cooldown = true

                        while data.humanoid.Health > 0 and task.wait() do
                            if getsenv ~= nil and clonefunction ~= nil then
                                tools.SimulateKnifeHit(data.humanoid, data.head_collision, 1000)
                                task.wait(0.05)
                            else
                                tools.SimulateShoot(data.head_collision, 1000)
                            end
                        end

                        cache.shoot_cooldown = false
                    end
                end,
            },
            {
                name = 'teamheal',
                mode = 'mission',
                desc = 
[[teamheal

call: teamheal <teammate_name: text>?+
command type: switch, visible, reversible

description: constantly fully heals your teammate(s). Reuse disables this feature.]],
                usage_example = 'teamheal averydumbcheese\nteamheal',
                requires_char = true,
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    cache.weaponkey_cmds.teamheal = is_enabled

                    if is_enabled == true then
                        local teammate_names = obj_mgr.players

                        while is_enabled == true and RunService.RenderStepped:Wait() do
                            for player, data in pairs(teammate_names)do
                                if data.humanoid == nil or data.head_collision == nil then
                                    continue
                                end

                                local damage = tools.CalculateDamage(data, player)

                                damage = -damage

                                if damage > -0.1 then
                                    continue
                                end
                                if getsenv ~= nil and clonefunction ~= nil then
                                    tools.SimulateKnifeHit(data.humanoid, data.head_collision, damage)
                                else
                                    tools.SimulateShoot(data.head_collision, damage)
                                end
                            end

                            task.wait(tools.GetPing() + 0.15)
                        end
                    end
                end,
            },
            {
                name = 'opendoors',
                mode = 'mission',
                desc = 
[[opendoors

call: opendoors
command type: switch, visible, reversible

description: unlocks all doors, allowing you to open them without using any tools. This command also unlocks basement door in Lakehouse and fire door at spawn in Withdrawal. Reuse locks all unlocked doors.]],
                usage_example = 'opendoors',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled)
                    if ms_data.current.get_door_unlocker then
                        local unlocker = ms_data.current.get_door_unlocker()

                        unlocker.Value = is_enabled
                    end
                    if is_enabled == true then
                        for LockDir, _ in pairs(obj_mgr.lock_dirs)do
                            LockDir.Value = 0

                            local listener

                            listener = LockDir:GetPropertyChangedSignal('Value'):Connect(function(
                            )
                                LockDir.Value = 0
                            end)

                            table.insert(conns.opendoors, listener)
                        end
                    else
                        for LockDir, OrigValue in pairs(obj_mgr.lock_dirs)do
                            LockDir.Value = OrigValue
                        end
                    end
                end,
            },
            {
                name = 'loud',
                mode = 'mission',
                desc = 
[[loud

call: loud
command type: switch, visible, reversible

description: throws all enemies and all spawning enemies to the space, what means the next wave won't start for a very long time. Reuse disables this feature, but doesn't returns enemies from the space if there's any.]],
                usage_example = 'loud',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    if is_enabled == true then
                        for npc, _ in pairs(npc_mgr.npcs_data.enemies.npcs)do
                            npc_mgr.MoveNPC(npc, Vector3.new(1e12, 1e12, 1e12))
                        end
                    end
                end,
            },
            {
                name = 'metdetect',
                mode = 'mission',
                desc = 
[[metdetect

call: metdetect
command type: one time, visible, irreversible

description: allows you to pass through metal detectors with weapons.]],
                usage_example = 'metdetect',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function()
                    for _, obj in ipairs(Glass:GetChildren())do
                        if table.find({
                            'MetalDetectorPart1',
                            'MetalDetectorPart2',
                            'MetalDetectorPart3',
                        }, obj.Name) then
                            obj:Destroy()
                        end
                    end
                    for _, trigger in ipairs(Triggers:GetChildren())do
                        if trigger.Name == 'Detector' then
                            trigger:Destroy()
                        end
                    end

                    return 'metdetect: removed metal detectors triggers.'
                end,
            },
            {
                name = 'objassist',
                mode = 'mission',
                desc = 
[[objassist

call: objassist
command type: one time, invisible, irreversible, can be executed only before mission start

description: changes the position and properties of objects in such a way as to speed up and facilitate the passage of the mission.]],
                usage_example = 'objassist',
                requires_char = true,
                checks = {
                    before_mission_start = true,
                    objassist_required = true,
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function()
                    if objassist_mgr[game.PlaceId] then
                        task.spawn(objassist_mgr[game.PlaceId])

                        return 'objassist: initializing objective assistance...'
                    end
                end,
            },
            {
                name = 'telekinesis',
                mode = 'mission',
                desc = "telekinesis\n\ncall: telekinesis\ncommand type: switch, visible, reversible\n\ndescription: allows you to carry and throw npcs.\nControls:\n\tRight mouse button hold: starts holding the npc that the center of your screen is pointing at\n\tF key: throw npc that you're holding\n\tT key: change the collision of npc you're holding. Reuse disables this feature.",
                usage_example = 'telekinesis',
                required_parts = {
                    'HumanoidRootPart',
                },
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled, hrp)
                    if is_enabled == true then
                        local holding = false

                        conns.telekinesis = Mouse.Button2Down:Connect(function()
                            local npc = npc_mgr.GetNPCOnRay()

                            if not npc then
                                return
                            end

                            local data = npc_mgr.npcs_data.all.npcs[npc]

                            if data.team == 'snipers' then
                                return
                            end

                            local distance = (data.hrp.Position - hrp.Position).Magnitude
                            local thrown = false
                            local can_collide = true
                            local wheel_forward = Mouse.WheelForward:Connect(function(
                            )
                                distance = distance + 2
                            end)
                            local wheel_backward = Mouse.WheelBackward:Connect(function(
                            )
                                distance = distance < 2 and 0 or distance - 2
                            end)
                            local input_began = UserInputService.InputBegan:Connect(function(
                                input
                            )
                                if UserInputService:GetFocusedTextBox() == nil then
                                    if input.KeyCode == Enum.KeyCode.F then
                                        thrown = true
                                    elseif input.KeyCode == Enum.KeyCode.T then
                                        can_collide = not can_collide

                                        npc_mgr.NoclipNPC(data, can_collide)
                                    end
                                end
                            end)
                            local input_ended = Mouse.Button2Up:Connect(function(
                            )
                                holding = false
                            end)

                            data.align_p.Enabled = true
                            data.align_o.Enabled = false

                            while data.anti_fall == nil do
                                task.wait()
                            end

                            data.anti_fall:Disconnect()

                            data.anti_fall = nil
                            holding = true

                            while holding == true and thrown == false and RunService.RenderStepped:Wait() do
                                data.align_p.Position = Mouse.Origin.Position + (Camera.CFrame.LookVector * distance)
                            end

                            wheel_backward:Disconnect()
                            wheel_forward:Disconnect()
                            input_began:Disconnect()
                            input_ended:Disconnect()

                            data.align_p.Enabled = false
                            data.align_o.Enabled = false

                            npc_mgr.NoclipNPC(data, true)

                            if thrown == true then
                                data.hrp:ApplyImpulse(Mouse.Hit.LookVector * 7500)

                                while data.humanoid:GetState() ~= Enum.HumanoidStateType.FallingDown do
                                    data.humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
                                    task.wait(0.1)
                                end

                                local got_up = false
                                local listener = data.humanoid.GettingUp:Connect(function(
                                )
                                    got_up = true
                                end)

                                while got_up == false and holding == false do
                                    task.wait()
                                end

                                listener:Disconnect()
                            end

                            data.anti_fall = data.humanoid.FallingDown:Connect(function(
                            )
                                data.humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                            end)
                        end)
                    end
                end,
            },
            {
                name = 'getitem',
                mode = 'mission',
                desc = 
[[getitem

call: getitem <item_name: text> <quantity: number>?
command type: one time, visible, reversible

description: pickups the selected item at any distance from it. If <quantity> wasn't specified, pickups 1 item by default.]],
                usage_example = 'getitem usb\ngetitem thermitecan 2',
                requires_char = true,
                checks = {
                    args = {
                        [1] = {
                            name = 'item_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                local items = {}

                                for _, item in ipairs(GroundItems:GetChildren())do
                                    table.insert(items, string.lower(item.Name))
                                end

                                return items
                            end,
                        },
                        [2] = {
                            name = 'quantity',
                            required = false,
                            type = 'number',
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(_, item_name, quantity)
                    local count = 0

                    item_name = string.lower(item_name)
                    quantity = quantity == nil and 1 or tonumber(quantity)

                    for item, _ in pairs(obj_mgr.items)do
                        if string.lower(item.Name) ~= item_name then
                            continue
                        end

                        local data = item:FindFirstChild('Data')

                        if data == nil then
                            continue
                        end

                        GetRemote('TryPickup'):Invoke(data)

                        quantity = quantity - 1
                        count = count + 1

                        if quantity == 0 then
                            return
                        end
                    end

                    return 'getitem: successfully got ' .. tostring(count) .. item_name .. '(s)'
                end,
            },
            {
                name = 'instagrab',
                mode = 'mission',
                desc = 
[[instagrab

call: instagrab
command type: one time, visible, reversible

description: changes the time of picking up some objects like cash, gold or servers to 0. Reuse returns these values to their default ones.]],
                usage_example = 'instagrab',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled)
                    if ms_data.current.instagrab then
                        ms_data.current.instagrab(is_enabled)
                    end
                end,
            },
            {
                name = 'breakback',
                mode = 'mission',
                desc = 
[[breakback

call: breakback <force: number>
command type: one time, visible, reversible

description: breaks your back with the specified force.]],
                usage_example = 'breakback 20',
                requires_char = true,
                checks = {
                    args = {
                        [1] = {
                            name = 'force',
                            required = true,
                            type = 'number',
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(_, force)
                    GetRemote('SetLean'):Fire(tonumber(force))
                end,
            },
            {
                name = 'breakshoulders',
                mode = 'mission',
                desc = 
[[breakshoulders

call: breakshoulders <force: number>
command type: one time, visible, reversible

description: breaks your shoulders with the specified force.]],
                usage_example = 'breakshoulders 20',
                requires_char = true,
                checks = {
                    args = {
                        [1] = {
                            name = 'force',
                            required = true,
                            type = 'number',
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(_, force)
                    GetRemote('SetShoulders'):Fire(tonumber(force), 0.17)
                end,
            },
            {
                name = 'breakarms',
                mode = 'mission',
                desc = 
[[breakarms

call: breakarms <mode: number (1 or 2)> <force: number>
command type: one time, visible, reversible

description: breaks your arms with the specified mode and force.]],
                usage_example = 'breakarms 1 20\nbreakarms 2 20',
                requires_char = true,
                checks = {
                    args = {
                        [1] = {
                            name = 'mode',
                            required = true,
                            type = 'number',
                            tip_gen = function(_)
                                return {
                                    '1',
                                    '2',
                                }
                            end,
                        },
                        [2] = {
                            name = 'power',
                            required = true,
                            type = 'number',
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(_, mode, force)
                    mode = tonumber(mode)

                    if mode == 1 then
                        GetRemote('SetAnim'):Fire('HipPosition', 1, tonumber(force), 0.15)
                    elseif mode == 2 then
                        GetRemote('SetWeight'):Fire(tonumber(force), 0.15)
                    end
                end,
            },
            {
                name = 'nofog',
                mode = 'mission',
                desc = 
[[nofog

call: nofog
command type: one time, invisible, reversible

description: removes fog. Reuse returns back the fog.]],
                usage_example = 'nofog',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    Lighting.FogEnd = is_enabled == true and 1e5 or FogEnd
                end,
            },
            {
                name = 'facecam',
                mode = 'mission',
                desc = 
[[facecam

call: facecam
command type: one time, visible, reversible

description: places the microcam to the position and rotation of your head, if you have one in your inventory.]],
                usage_example = 'facecam',
                required_parts = {
                    'HeadM',
                },
                checks = {
                    required_funcs = {getsenv},
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(head_m)
                    local microcam = Tools:FindFirstChild('Microcam', true)

                    if not microcam then
                        return 
[[facecam: you need a microcam in your inventory for this command to work.]]
                    end

                    local pos = Camera.CFrame.Position + Camera.CFrame.LookVector * 1.5

                    GetRemote('PlaceExplosive'):InvokeServer('Microcam', CFrame.new(pos, pos + Camera.CFrame.LookVector) * CFrame.Angles(math.rad(
-90), 0, 0), head_m, microcam)
                end,
            },
            {
                name = 'free',
                mode = 'mission',
                desc = 
[[free

call: free
command type: one time, visible, reversible

description: stops all physic operations performed on npcs, items, bags and weapons.]],
                usage_example = 'free',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function()
                    local count = 0

                    for _, group in ipairs({
                        npc_mgr.npcs_data.all.npcs,
                        obj_mgr.bags,
                        obj_mgr.items,
                        obj_mgr.weapons,
                    })do
                        for _, data in pairs(group)do
                            data.align_p.Enabled = false
                            data.align_o.Enabled = false
                            count = count + 1
                        end
                    end
                    for _, cmd in ipairs({
                        'loopwep',
                        'loopbag',
                        'loopitem',
                    })do
                        if conns[cmd] ~= nil then
                            cache.ValidateCommand(cmd, 'terminal')
                        end
                    end

                    return 
[[free: stopped physical operations performed on weapons, bags, items and ]] .. tostring(count) .. ' npcs.'
                end,
            },
            {
                name = 'hiddenui',
                mode = 'mission',
                desc = 
[[hiddenui

call: hiddenui
command type: one time, invisible, irreversible

description: cancels all changes that occur due to the "hidden ui" challenge.]],
                usage_example = 'hiddenui',
                requires_char = true,
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function()
                    return 'not implemented'
                end,
            },
            {
                name = 'gesp',
                mode = 'mission',
                desc = 
[[gesp

call: gesp <npc_group: text>+
command type: switch, visible, reversible

description: pings all npcs of selected npc group(s). Reuse disables this feature.]],
                usage_example = 'gesp all\ngesp g s',
                checks = {
                    required_funcs = {getsenv},
                    args = {
                        [1] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                    'sp',
                                }
                            end,
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled, ...)
                    while flags.gesp == true do
                        for _, group in ipairs({...})do
                            local group_npcs = npc_mgr.aliases[group]

                            if group_npcs == nil then
                                continue
                            end

                            for npc, _ in pairs(group_npcs)do
                                GetRemote('SpotEnemy'):FireServer(npc)
                            end
                        end

                        task.wait(0.5)
                    end
                end,
            },
            {
                name = 'ctrlcheck',
                mode = 'mission',
                desc = 
[[ctrlcheck

call: ctrlcheck
command type: switch, invisible, reversible

description: releases red rays to the npcs you can't control at the moment. Reuse disables this feature.]],
                usage_example = 'ctrlcheck',
                required_parts = {
                    'HumanoidRootPart',
                },
                checks = {
                    required_funcs = {isnetworkowner},
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled, hrp)
                    if is_enabled == true then
                        hrp:WaitForChild('Attachment', math.huge)

                        conns.ctrlcheck = RunService.RenderStepped:Connect(function(
                        )
                            for _, data in pairs(npc_mgr.npcs_data.all.npcs)do
                                if data.team == 'snipers' then
                                    continue
                                end

                                data.beam.Enabled = not isnetworkowner(data.hrp)
                            end
                        end)
                    else
                        for _, data in pairs(npc_mgr.npcs_data.all.npcs)do
                            if data.team == 'snipers' then
                                continue
                            end

                            data.beam.Enabled = false
                        end
                    end
                end,
            },
            {
                name = 'buyweapon',
                mode = 'mission',
                desc = 
[[buyweapon

call: buyweapon <weapon_name: text>
command type: one time, visible, irreversible

description: buys the selected weapon. You can't buy MM20 using this command.]],
                usage_example = 'buyweapon raven\nbuyweapon Thumper',
                checks = {
                    args = {
                        [1] = {
                            name = 'weapon_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                return {
                                    '480_MCS',
                                    'CBR-C',
                                    'CH-A',
                                    'F57',
                                    'K45',
                                    'MM20',
                                    'Raven',
                                    'S97',
                                    'Sawblade',
                                    'Thumper',
                                    'UP9',
                                }
                            end,
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(weapon_name)
                    weapon_name = string.lower(weapon_name)
                    weapon_name = string.gsub(weapon_name, '_', ' ')

                    for _, weapon in ipairs(Shop:GetChildren())do
                        if string.lower(weapon.Name) == weapon_name then
                            GetRemote('BuyWeapon'):InvokeServer(weapon)

                            break
                        end
                    end
                end,
            },
            {
                name = 'buyattachment',
                mode = 'mission',
                desc = 
[[buyattachment

call: buyattachment <weapon_slot: number> <att_group: text> <att_name: text>
command type: one time, visible, irreversible

description: buys and sets the attachment of the specified attachment name in the attachment group to the specified weapon from the "Manage Weapons" panel. You can also buy attachments that cannot be placed on specific weapons like suppressor for Thumper or Sawblade. ]],
                usage_example = 
[[buyattachment 2 Tactical Canted Sights
buyattachment 5 Barrel Suppressor]],
                checks = {
                    args = {
                        [1] = {
                            name = 'weapon_pos',
                            required = true,
                            type = 'number',
                            tip_gen = function(_)
                                if not LocalPlayer:FindFirstChild('PlayerData') or not LocalPlayer.PlayerData:FindFirstChild('Armory') then
                                    return nil
                                end

                                local weapons = {}

                                for _, weapon in ipairs(LocalPlayer.PlayerData.Armory:GetChildren())do
                                    if weapon:FindFirstChild('Mods') == nil then
                                        continue
                                    end

                                    table.insert(weapons, string.match(weapon.Name, '%d+') .. ' (' .. weapon.Value .. ')')
                                end

                                return weapons
                            end,
                        },
                        [2] = {
                            name = 'att_group',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                return {
                                    'Sight',
                                    'Barrel',
                                    'Tactical',
                                    'Grip',
                                    'Magazine',
                                    'Stock',
                                    'Frame',
                                }
                            end,
                        },
                        [3] = {
                            name = 'att_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(args)
                                local group = args[2]
                                local attachments = {
                                    ['Sight'] = {
                                        'Iron_Sights',
                                        'Mini_Sight',
                                        'Delta_Sight',
                                        'Glow_Sight',
                                        'Ring_Sight',
                                        'Red_Dot',
                                        'TG3X',
                                        'T4XS',
                                        'LS6X',
                                    },
                                    ['Barrel'] = {
                                        'Suppressor',
                                        'Flash Hider',
                                        'Muzzle Brake',
                                        'Duckbill',
                                        'Choke',
                                    },
                                    ['Tactical'] = {
                                        'Flashlight',
                                        'Laser',
                                        'Canted_Sights',
                                    },
                                    ['Grip'] = {
                                        'Folding_Grip',
                                        'Ergo_Grip',
                                        'Angled_Grip',
                                        'Stubby_Grip',
                                    },
                                    ['Magazine'] = {
                                        'Normal Magazine',
                                        'Short Magazine',
                                    },
                                    ['Stock'] = {
                                        'Normal_Stock',
                                        'Short_Grip',
                                        'No_Stock',
                                        'Full_Stock',
                                        'Stock',
                                    },
                                    ['Frame'] = {
                                        'Chrome',
                                        'Matte',
                                        'Steel',
                                        'Gold',
                                        'Split_Gold',
                                    },
                                }

                                return attachments[group]
                            end,
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(weapon_slot, att_group, att_name)
                    att_name = string.gsub(att_name, '_', ' ')

                    local slot = Armory:WaitForChild('Slot' .. weapon_slot, 5)

                    if not slot then
                    end

                    local internal_str = att_group .. '_' .. att_name .. '|'

                    GetRemote('BuyAttachment'):InvokeServer(slot, internal_str)
                end,
            },
            {
                name = 'setattachment',
                mode = 'mission',
                desc = 
[[setattachment

call: setattachment <weapon_slot: number> <att_group: text> <att_name: text>
command type: one time, visible, irreversible

description: sets the attachment of the specified attachment name in the attachment group to the specified weapon from the "Manage Weapons" panel.]],
                usage_example = 
[[setattachment 2 Tactical Canted Sights
setattachment 5 Barrel Suppressor]],
                checks = {
                    args = {
                        [1] = {
                            name = 'weapon_pos',
                            required = true,
                            type = 'number',
                            tip_gen = function(_)
                                if not LocalPlayer:FindFirstChild('PlayerData') or not LocalPlayer.PlayerData:FindFirstChild('Armory') then
                                    return nil
                                end

                                local weapons = {}

                                for _, weapon in ipairs(LocalPlayer.PlayerData.Armory:GetChildren())do
                                    if weapon:FindFirstChild('Mods') == nil then
                                        continue
                                    end

                                    table.insert(weapons, string.match(weapon.Name, '%d+') .. ' (' .. weapon.Value .. ')')
                                end

                                return weapons
                            end,
                        },
                        [2] = {
                            name = 'att_group',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                return {
                                    'Sight',
                                    'Barrel',
                                    'Tactical',
                                    'Grip',
                                    'Magazine',
                                    'Stock',
                                    'Frame',
                                }
                            end,
                        },
                        [3] = {
                            name = 'att_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(args)
                                local group = args[2]
                                local attachments = {
                                    ['Sight'] = {
                                        'Iron_Sights',
                                        'Mini_Sight',
                                        'Delta_Sight',
                                        'Glow_Sight',
                                        'Ring_Sight',
                                        'Red_Dot',
                                        'TG3X',
                                        'T4XS',
                                        'LS6X',
                                    },
                                    ['Barrel'] = {
                                        'Suppressor',
                                        'Flash Hider',
                                        'Muzzle Brake',
                                        'Duckbill',
                                        'Choke',
                                    },
                                    ['Tactical'] = {
                                        'Flashlight',
                                        'Laser',
                                        'Canted_Sights',
                                    },
                                    ['Grip'] = {
                                        'Folding_Grip',
                                        'Ergo_Grip',
                                        'Angled_Grip',
                                        'Stubby_Grip',
                                    },
                                    ['Magazine'] = {
                                        'Normal Magazine',
                                        'Short Magazine',
                                    },
                                    ['Stock'] = {
                                        'Normal_Stock',
                                        'Short_Grip',
                                        'No_Stock',
                                        'Full_Stock',
                                        'Stock',
                                    },
                                    ['Frame'] = {
                                        'Chrome',
                                        'Matte',
                                        'Steel',
                                        'Gold',
                                        'Split_Gold',
                                    },
                                }

                                return attachments[group]
                            end,
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(weapon_slot, att_group, att_name)
                    att_name = string.gsub(att_name, '_', ' ')

                    local slot = Armory:WaitForChild('Slot' .. weapon_slot, 5)

                    if not slot then
                    end

                    local internal_str = att_group .. '_' .. att_name .. '|'

                    GetRemote('SetAttachment'):InvokeServer(slot, internal_str)
                end,
            },
            {
                name = 'tower',
                required_parts = {
                    'HumanoidRootPart',
                },
                desc = 
[[tower

call: tower <npc_group: text>+
command type: switch, visible, reversible, network ownership dependent

description: builds a tower made of npcs of the specified group(s) on your head. Works only with npcs who aren't sitting at the moment. Reuse disables this feature.]],
                usage_example = 'tower g s c\ntower',
                checks = {
                    args = {
                        [1] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                }
                            end,
                        },
                    },
                    sp_allowed = false,
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled, hrp, ...)
                    if is_enabled == true then
                        if flags.orbit == true then
                            cache.ValidateCommand('orbit', 'terminal')
                        end

                        local height = 8

                        for _, group in ipairs({...})do
                            local group_npcs = npc_mgr.aliases[group]

                            if group_npcs == nil then
                                continue
                            end

                            for npc, data in pairs(group_npcs)do
                                if data.humanoid.Sit == true then
                                    continue
                                end

                                npc_mgr.NoclipNPC(data, false)

                                data.align_p.Enabled = true
                                data.align_o.Enabled = true
                                cache.npcs_in_tower[npc] = height
                                height = height + 4
                            end
                        end

                        while flags.tower == true and RunService.RenderStepped:Wait() do
                            for npc, curr_height in pairs(cache.npcs_in_tower)do
                                local data = npc_mgr.npcs_data.all.npcs[npc]

                                if not data or not data.align_p then
                                    continue
                                end

                                data.align_p.Position = hrp.Position + Vector3.new(0, curr_height, 0)
                            end
                        end
                    else
                        for npc, _ in pairs(cache.npcs_in_tower)do
                            local data = npc_mgr.npcs_data.all.npcs[npc]

                            if not data or not data.align_p or not data.align_o then
                                continue
                            end

                            npc_mgr.NoclipNPC(data, true)

                            data.align_p.Enabled = false
                            data.align_o.Enabled = false
                            cache.npcs_in_tower = {}
                        end
                    end
                end,
            },
            {
                name = 'orbit',
                required_parts = {
                    'HumanoidRootPart',
                },
                desc = 
[[orbit

call: orbit <npc_group: text>+
command type: switch, visible, reversible, network ownership dependent

description: creates an orbit made of npcs of the specified group(s) with a specified rotation speed and radius (distance) around your character. Works only with npcs who aren't sitting at the moment. Reuse disables this feature.]],
                usage_example = 'orbit 20 10 a e w\norbit 0 20 e',
                checks = {
                    sp_allowed = false,
                    args = {
                        [1] = {
                            name = 'speed',
                            required = true,
                            type = 'number',
                        },
                        [2] = {
                            name = 'distance',
                            required = true,
                            type = 'number',
                        },
                        [3] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                }
                            end,
                        },
                    },
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled, hrp, speed, distance, ...)
                    if is_enabled == true then
                        if flags.tower == true then
                            cache.ValidateCommand('tower', 'terminal')
                        end

                        local rotation = 0

                        speed = tonumber(speed)
                        distance = tonumber(distance)

                        for _, group in ipairs({...})do
                            local group_npcs = npc_mgr.aliases[group]

                            if group_npcs == nil then
                                continue
                            end

                            for npc, data in pairs(group_npcs)do
                                if data.humanoid.Sit == true then
                                    continue
                                end

                                npc_mgr.NoclipNPC(data, false)

                                data.align_p.Enabled = true
                                data.align_o.Enabled = true
                                cache.npcs_in_orbit[npc] = 0
                            end
                        end

                        local count = tools.GetDictLen(cache.npcs_in_orbit)
                        local delta = 360 / count

                        for npc, _ in pairs(cache.npcs_in_orbit)do
                            do
                                local __DARKLUA_VAR = cache.npcs_in_orbit

                                __DARKLUA_VAR[npc] = __DARKLUA_VAR[npc] + rotation
                            end

                            rotation = rotation + delta
                        end

                        while flags.orbit == true and RunService.RenderStepped:Wait() do
                            for npc, curr_rotation in pairs(cache.npcs_in_orbit)do
                                local data = npc_mgr.npcs_data.all.npcs[npc]

                                if not data or not data.align_p or not data.align_o then
                                    continue
                                end

                                data.align_p.Position = CFrame.new(hrp.Position) * CFrame.Angles(0, math.rad(curr_rotation), 0) * CFrame.new(distance, 0, 0).Position
                                data.align_o.CFrame = CFrame.new(hrp.Position, data.hrp.Position)

                                do
                                    local __DARKLUA_VAR = cache.npcs_in_orbit

                                    __DARKLUA_VAR[npc] = __DARKLUA_VAR[npc] + speed
                                end
                            end
                        end
                    else
                        for npc, _ in pairs(cache.npcs_in_orbit)do
                            local data = npc_mgr.npcs_data.all.npcs[npc]

                            if not data or not data.align_p or not data.align_o then
                                continue
                            end

                            npc_mgr.NoclipNPC(data, true)

                            data.align_p.Enabled = false
                            data.align_o.Enabled = false
                            cache.npcs_in_orbit = {}
                        end
                    end
                end,
            },
            {
                name = 'snake',
                mode = 'mission',
                desc = 
[[snake

call: snake <npc_group: text>+
command type: one time, visible, irreversible

description: puts npcs of the specified group(s) on the ground. They still will be able to move around in this position. This command may take some time to turn all specified npcs to snakes]],
                usage_example = 'snake w g s c\nsnake all\nsnake',
                checks = {
                    required_funcs = {getsenv},
                    sp_allowed = true,
                    req_place_type = 'mission',
                    args = {
                        [1] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                    'sp',
                                }
                            end,
                        },
                    },
                    af_compatible = false,
                },
                func = function(...)
                    for _, group in ipairs({...})do
                        local group_npcs = npc_mgr.aliases[group]

                        if group_npcs == nil then
                            continue
                        end

                        for npc, data in pairs(group_npcs)do
                            if data.snaked == true then
                                continue
                            end

                            for count = 1, 2, 1 do
                                if npc and data.character and data.interact then
                                    GetRemote('StartInteraction'):FireServer(npc.Character.Interact, npc.Character)
                                    GetRemote('TriggerInteraction'):InvokeServer(npc.Character.Interact)
                                    task.wait(0.2)
                                end
                            end

                            data.snaked = true
                        end
                    end
                end,
            },
            {
                name = 'lockinteract',
                mode = 'mission',
                desc = 
[[lockinteract

call: lockinteract
command type: one time, visible, reversible

description: locks any interactions with any objects for your teammates. This command may take some time to lock interaction with all objects.]],
                usage_example = 'lockinteract',
                checks = {
                    required_funcs = {getsenv},
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function()
                    if cache.complex_cmds.unlockinteract ~= nil then
                        tools.ClearTableTask(cache.complex_cmds, 'unlockinteract')
                    end
                    if cache.complex_cmds.lockinteract ~= nil then
                        cache.complex_cmds.lockinteract = tools.CreatePendingTask(function(
                        )
                            for _, obj in ipairs(Level:GetDescendants())do
                                if obj.Name == 'Interact' then
                                    GetRemote('StartInteraction'):FireServer(obj.Parent, obj)
                                    GetRemote('ReserveUse'):InvokeServer(obj)
                                    table.insert(cache.locked_interacts, obj)
                                    task.wait(0.05)
                                end
                            end
                        end)
                    end
                end,
            },
            {
                name = 'unlockinteract',
                mode = 'mission',
                desc = 
[[unlockinteract

call: unlockinteract
command type: one time, visible, reversible

description: unlocks interactions with objects for your teammates which has been locked by lockinteract command. This command may take some time to unlock interaction for all objects with locked interaction]],
                usage_example = 'unlockinteract',
                checks = {
                    required_funcs = {getsenv},
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function()
                    if cache.complex_cmds.lockinteract ~= nil then
                        tools.ClearTableTask(cache.complex_cmds, 'lockinteract')
                    end
                    if cache.complex_cmds.unlockinteract == nil then
                        cache.complex_cmds.unlockinteract = tools.CreatePendingTask(function(
                        )
                            for _, interact in ipairs(cache.locked_interacts:GetChildren())do
                                GetRemote('ReleaseUse'):InvokeServer(interact)
                                task.wait(0.05)
                            end
                        end)
                    end
                end,
            },
            {
                name = 'spkill',
                mode = 'mission',
                desc = 
[[spkill

call: spkill
command type: switch, visible, reversible

description: automatically kills all snipers and all spawning snipers. Reuse disables this feature.]],
                usage_example = 'spkill',
                checks = {
                    required_funcs = {getsenv},
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    cache.weaponkey_cmds.spkill = is_enabled

                    if is_enabled == true then
                        for _, data in pairs(npc_mgr.npcs_data.snipers.npcs)do
                            task.spawn(function()
                                while data and data.humanoid and data.humanoid.Health > 0 do
                                    tools.SimulateKnifeHit(data.humanoid, data.hrp, 1000)
                                    task.wait(0.1)
                                end
                            end)
                        end
                    else
                        if Armed.Value == false and tools.ClearWeaponKey ~= nil then
                            tools.ClearWeaponKey()
                        end
                    end
                end,
            },
            {
                name = 'gclearance',
                mode = 'mission',
                desc = 
[[gclearance

call: gclearance
command type: switch, visible, reversible

description: allows you to unlock any chip doors without the disguise needed for them. Reuse disables this feature.]],
                usage_example = 'gclearance',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    for _, door in ipairs(Doors:GetChildren())do
                        if door:FindFirstChild('ChipReader') then
                            local interact = door.ChipReader.Interact

                            if interact:FindFirstChild('DisguiseNeeded') then
                                interact.DisguiseNeeded:Destroy()
                            end
                        end
                    end
                end,
            },
            {
                name = 'music',
                desc = 
[[music

call: music
command type: switch, invisible, reversible

description: opens a gui which allows you to change mission soundtracks.]],
                usage_example = 'music',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function()
                    music.window.Visible = not music.window.Visible
                end,
            },
            {
                name = 'lobby',
                desc = 
[[lobby

call: lobby
command type: switch, invisible, reversible

description: opens a gui which allows you to create impossible lobbies.]],
                usage_example = 'lobby',
                checks = {
                    req_place_type = 'lobby',
                    af_compatible = true,
                },
                func = function()
                    lobby.window.Visible = not lobby.window.Visible
                end,
            },
            {
                name = 'help',
                desc = 
[[help

call: help
command type: switch, invisible, reversible

description: opens a gui which shows you descriptions and usage examples for all existing commands in the script.]],
                usage_example = 'help',
                checks = {
                    req_place_type = 'any',
                    af_compatible = true,
                },
                func = function()
                    local window = cache.help_window

                    window.Visible = not window.Visible
                end,
            },
            {
                name = 'keybinds',
                desc = 
[[keybinds

call: keybinds
command type: switch, invisible, reversible

description: opens a gui which allows you to assign commands to be executed when certain keys are pressed.]],
                usage_example = 'keybinds',
                checks = {
                    req_place_type = 'any',
                    af_compatible = true,
                },
                func = function()
                    local window = cache.keybinds_window

                    window.Visible = not window.Visible
                end,
            },
            {
                name = 'teleport',
                desc = 
[[teleport

call: teleport
command type: switch, invisible, reversible

description: opens a gui which allows you to teleport to different places.]],
                usage_example = 'teleport',
                checks = {
                    req_place_type = 'any',
                    af_compatible = true,
                },
                func = function()
                    teleport.window.Visible = not teleport.window.Visible
                end,
            },
            {
                name = 'settings',
                desc = 
[[settings

call: settings
command type: switch, invisible, reversible

description: opens a gui which allows you to change script behaviour.]],
                usage_example = 'settings',
                checks = {
                    req_place_type = 'any',
                    af_compatible = false,
                },
                func = function()
                    scr_settings.window.Visible = not scr_settings.window.Visible
                end,
            },
            {
                name = 'startup',
                desc = 
[[startup

call: startup
command type: switch, invisible, reversible

description: opens a gui which allows you to assign commands to be executed as soon as the script is executed.]],
                usage_example = 'startup',
                checks = {
                    req_place_type = 'any',
                    af_compatible = true,
                },
                func = function()
                    local window = cache.startup_window

                    window.Visible = not window.Visible
                end,
            },
            {
                name = 'snaketouch',
                desc = 
[[snaketouch

call: snaketouch
command type: switch, visible, reversible

description: allows you to put npcs on the ground that you interact with pressing the [F] key. To put npc on the ground, interact with it, then wait ~1 second and interact with it again. Reuse disables this feature, but doesn't return npcs that are lying on the ground to their normal state.]],
                usage_example = 'snaketouch',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled)
                    if is_enabled == true then
                        for _, data in pairs(npc_mgr.npcs_data.all.npcs)do
                            data.active.Value = true
                        end
                    end
                end,
            },
            {
                name = 'unlockengi',
                desc = 
[[unlockengi

call: unlockengi
command type: switch, visible, reversible

description: allows you to bypass chip reader and door sensors without having the Engineer class. Reuse disables this feature.]],
                usage_example = 'unlockengi',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    local name = is_enabled == true and 'ReqEngineer ' or 'ReqEngineer'

                    for _, req_engineer in ipairs(obj_mgr.engineers)do
                        req_engineer.Name = name
                    end
                end,
            },
            {
                name = 'strweps',
                desc = 
[[strweps

call: strweps
command type: switch, visible, reversible

description: significantly increases the bullet damage from your weapons. Reuse disables this feature.]],
                usage_example = 'strweps',
                checks = {
                    required_funcs = {hookmetamethod, getnamecallmethod, checkcaller},
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled)
                    if is_enabled == true then
                        if cmds_mgr.flags.gmweps == true then
                            cache.ValidateCommand('gmweps', 'terminal')
                        end

                        rmts_mgr.FireBulletDmg = 250
                    else
                        rmts_mgr.FireBulletDmg = nil
                    end
                end,
            },
            {
                name = 'gmweps',
                desc = 
[[gmweps

call: gmweps
command type: switch, visible, irreversible

description: the bullets from your weapons will give godmode to anyone they hit. Reuse disables this feature.]],
                usage_example = 'gmweps',
                checks = {
                    required_funcs = {hookmetamethod, getnamecallmethod, checkcaller},
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function(is_enabled)
                    if is_enabled == true then
                        if cmds_mgr.flags.strweps == true then
                            cache.ValidateCommand('strweps', 'terminal')
                        end

                        rmts_mgr.FireBulletDmg = tonumber('nan')
                    else
                        rmts_mgr.FireBulletDmg = nil
                    end
                end,
            },
            {
                name = 'stealitem',
                desc = 
[[stealitem

call: stealitem <player_name: text> <item_name: text> <quantity: number?>
command type: one time, visible, reversible

description: transfers the specified items in the specified amount to your inventory from the victim's inventory. Items that don't fit into your inventory will be thrown to the ground. If <item_name> = "all", then all items will be stolen from victim's inventory.]],
                usage_example = 
[[stealitem averydumbcheese microcam 6
stealitem averydumbcheese all]],
                checks = {
                    required_funcs = {
                        debug,
                        debug.getupvalue,
                        getsenv,
                    },
                    req_place_type = 'mission',
                    args = {
                        [1] = {
                            name = 'player_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                local players = {}

                                for _, player in ipairs(Players:GetPlayers())do
                                    if player.Name ~= LocalPlayer.Name then
                                        table.insert(players, player.Name == player.DisplayName and player.Name or player.Name .. ' (' .. player.DisplayName .. ')')
                                    end
                                end

                                return players
                            end,
                        },
                        [2] = {
                            name = 'item_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(args)
                                local items = {}
                                local player_data = tools.PlayerDataByName(args[1])

                                if player_data == nil then
                                    return nil
                                end

                                table.insert(items, 'all')

                                for _, tool in ipairs(player_data.tools:GetDescendants())do
                                    if tool:FindFirstChild('ExpectedLoc') ~= nil then
                                        table.insert(items, tool.Name)
                                    end
                                end

                                return items
                            end,
                        },
                        [3] = {
                            name = 'quantity',
                            required = false,
                            type = 'number',
                        },
                    },
                },
                requires_char = true,
                af_compatible = false,
                func = function(_, player_name, item_name, quantity)
                    item_name = string.lower(item_name)

                    if item_name == 'all' or quantity == 'all' then
                        quantity = 666
                    end

                    quantity = tonumber(quantity) or 1

                    local data = tools.PlayerDataByName(player_name)

                    if not data then
                        return
                    end

                    for _, obj in ipairs(data.tools:GetDescendants())do
                        if (item_name ~= 'all' and obj.Name:lower() ~= item_name) or obj:FindFirstChild('Location') == nil then
                            continue
                        end

                        GetRemote('AuthItemMove'):InvokeServer(obj, obj.Parent, GroundItems, 0)

                        while obj.Parent.ClassName ~= 'Model' do
                            task.wait()
                        end

                        GetRemote('TryPickup'):Invoke(obj)

                        quantity = quantity - 1

                        if quantity == 0 then
                            break
                        end
                    end
                end,
            },
            {
                name = 'dropitem',
                desc = 
[[dropitem

call: dropitem <player_name: text> <item_name: text> <quantity: number?>
command type: one time, visible, reversible

description: throws to the ground the specified items in the specified amount from the victim's inventory. If <item_name> = "all", then all items will be thrown out from victim's inventory.]],
                usage_example = 
[[dropitem averydumbcheese microcam 6
dropitem averydumbcheese all]],
                checks = {
                    required_funcs = {
                        debug,
                        debug.getupvalue,
                        getsenv,
                    },
                    req_place_type = 'mission',
                    args = {
                        [1] = {
                            name = 'player_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                local players = {}

                                for _, player in ipairs(Players:GetPlayers())do
                                    if player.Name ~= LocalPlayer.Name then
                                        table.insert(players, player.Name == player.DisplayName and player.Name or player.Name .. ' (' .. player.DisplayName .. ')')
                                    end
                                end

                                return players
                            end,
                        },
                        [2] = {
                            name = 'item_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(args)
                                local items = {}
                                local player_data = tools.PlayerDataByName(args[1])

                                if player_data == nil then
                                    return nil
                                end

                                table.insert(items, 'all')

                                for _, tool in ipairs(player_data.tools:GetDescendants())do
                                    if tool:FindFirstChild('ExpectedLoc') ~= nil then
                                        table.insert(items, tool.Name)
                                    end
                                end

                                return items
                            end,
                        },
                        [3] = {
                            name = 'quantity',
                            required = false,
                            type = 'number',
                        },
                    },
                },
                requires_char = true,
                af_compatible = true,
                func = function(_, player_name, item_name, quantity)
                    quantity = tonumber(quantity) or 1
                    item_name = string.lower(item_name)

                    if item_name == 'all' then
                        quantity = 666
                    end

                    local data = tools.PlayerDataByName(player_name)

                    if not data then
                        return 
[[dropitem: make sure that you have entered the player's name correctly.]]
                    end

                    for _, obj in ipairs(data.tools:GetDescendants())do
                        if obj:FindFirstChild('Location') == nil or (item_name ~= 'all' and obj.Name:lower() ~= item_name) then
                            continue
                        end

                        GetRemote('AuthItemMove'):InvokeServer(obj, obj.Parent, GroundItems, 0)

                        quantity = quantity - 1

                        if quantity == 0 then
                            break
                        end
                    end
                end,
            },
            {
                name = 'stealwep',
                desc = 
[[stealwep

call: stealwep <player_name: text> <item_name: text> <quantity: number?>
command type: one time, visible, reversible

description: throws to the ground the specified weapons in the specified amount from the victim's inventory. If <wep_name> = "all", then all weapons will be thrown out from victim's inventory.]],
                usage_example = 
[[stealwep averydumbcheese raven
stealwep averydumbcheese up9 2]],
                checks = {
                    args = {
                        [1] = {
                            name = 'player_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                local players = {}

                                for _, player in ipairs(Players:GetPlayers())do
                                    if player.Name ~= LocalPlayer.Name then
                                        table.insert(players, player.Name == player.DisplayName and player.Name or player.Name .. ' (' .. player.DisplayName .. ')')
                                    end
                                end

                                return players
                            end,
                        },
                        [2] = {
                            name = 'wep_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(args)
                                local items = {}

                                table.insert(items, 'all')

                                local player_data = tools.PlayerDataByName(args[1])

                                if player_data == nil then
                                    return nil
                                end

                                for _, tool in ipairs(player_data.weapons:GetDescendants())do
                                    if tool:FindFirstChild('AmmoLoaded') ~= nil then
                                        table.insert(items, tool.Name)
                                    end
                                end

                                return items
                            end,
                        },
                        [3] = {
                            name = 'quantity',
                            required = false,
                            type = 'number',
                        },
                    },
                    required_funcs = {
                        debug,
                        debug.getupvalue,
                        getsenv,
                    },
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                requires_char = true,
                func = function(_, player_name, wep_name, quantity)
                    quantity = tonumber(quantity) or 1
                    wep_name = string.lower(wep_name)

                    if wep_name == 'all' then
                        quantity = 666
                    end

                    local data = tools.PlayerDataByName(player_name)

                    if not data then
                        return 
[[stealwep: make sure that you have entered the player's name correctly.]]
                    end

                    local internal = function(obj)
                        if obj:FindFirstChild('AmmoLoaded') == nil or (wep_name ~= 'all' and obj.Name:lower() ~= wep_name) then
                            return false
                        end

                        GetRemote('AuthItemMove'):InvokeServer(obj, obj.Parent, GroundWeps)

                        quantity = quantity - 1

                        if quantity == 0 then
                            return true
                        end

                        return false
                    end

                    for _, obj in ipairs(data.weapons:GetChildren())do
                        if internal(obj) == true then
                            return
                        end
                    end

                    if data.tools:FindFirstChild('Bag') then
                        for _, obj in ipairs(data.tools.Bag:GetChildren())do
                            if internal(obj) == true then
                                return
                            end
                        end
                    end
                end,
            },
            {
                name = 'disarm',
                desc = 
[[disarm

call: stealwep <npc_group: text>+
command type: switch, visible, irreversible

description: removes weapons from npcs of specified group(s) who aren't holding weapons at the moment. Reuse disables this feature, but doesn't return weapons to those npcs from whom they were removed.]],
                usage_example = 'disarm g e\ndisarm all',
                checks = {
                    required_funcs = {
                        debug,
                        debug.getupvalue,
                        getsenv,
                    },
                    req_place_type = 'mission',
                    sp_allowed = true,
                    args = {
                        [1] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'g',
                                    's',
                                    'all',
                                    'e',
                                    'a',
                                }
                            end,
                        },
                    },
                    af_compatible = true,
                },
                requires_char = true,
                func = function(is_enabled, _, ...)
                    if is_enabled == true then
                        local internal = function(data)
                            while data.weapon.Value ~= nil and data.weapon.Value.Parent ~= nil do
                                GetRemote('AuthItemMove'):InvokeServer(data.weapon.Value, data.weapon.Value.Parent, nil)
                                task.wait(0.05)
                            end
                        end

                        for _, group in ipairs({...})do
                            if group == 'c' then
                                continue
                            end

                            local group_npcs = npc_mgr.aliases[group]

                            if group_npcs == nil then
                                continue
                            end

                            table.insert(cache.disarm, group_npcs)

                            for _, data in pairs(group_npcs)do
                                if data.weapon.Value == nil then
                                    data.weapon:GetPropertyChangedSignal('Value'):Connect(function(
                                    )
                                        if data.weapon.Value ~= nil then
                                            task.spawn(internal, data)
                                        end
                                    end)
                                else
                                    task.spawn(internal, data)
                                end
                            end
                        end
                    else
                        cache.disarm = {}
                    end
                end,
            },
            {
                name = 'invtrap',
                desc = 
[[invtrap

call: invtrap <player_name: text> <item_name: text>?
command type: one time, visible, irreversible

description: breaks the victim's inventory in such a way that when it opens it, it won't be able to close it and, accordingly, won't be able to move. This command requires an item. First, it searches for items in the victim's inventory, and if none are found, it takes an item with the name specified in <item_name> from your character's inventory.]],
                usage_example = 
[[invtrap averydumbcheese microcam
invtrap averydumbcheese thermitecan
invtrap averydumbcheese]],
                checks = {
                    required_funcs = {
                        debug,
                        debug.getupvalue,
                        getsenv,
                    },
                    req_place_type = 'mission',
                    args = {
                        [1] = {
                            name = 'player_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                local players = {}

                                for _, player in ipairs(Players:GetPlayers())do
                                    if player.Name ~= LocalPlayer.Name then
                                        table.insert(players, player.Name == player.DisplayName and player.Name or player.Name .. ' (' .. player.DisplayName .. ')')
                                    end
                                end

                                return players
                            end,
                        },
                        [2] = {
                            name = 'item_name',
                            required = false,
                            type = 'text',
                            tip_gen = function(args)
                                local items = {}
                                local player_data = tools.PlayerDataByName(args[1])

                                if player_data == nil then
                                    return nil
                                end

                                for _, tool in ipairs(player_data.tools:GetDescendants())do
                                    if tool:FindFirstChild('ExpectedLoc') ~= nil then
                                        table.insert(items, tool.Name)
                                    end
                                end

                                return items
                            end,
                        },
                    },
                },
                requires_char = true,
                af_compatible = true,
                func = function(_, player_name, item_name)
                    local data = tools.PlayerDataByName(player_name)

                    if not data then
                        return 
[[invtrap: make sure that you have entered the player's name correctly.]]
                    end

                    item_name = string.lower(item_name)

                    local local_data = tools.PlayerDataByName(LocalPlayer.Name)

                    for _, item in ipairs(data.tools.Held:GetChildren())do
                        GetRemote('AuthItemMove'):InvokeServer(item, data.tools.Held, data.tools.Held, tonumber('nan'))

                        return
                    end

                    if data.tools:FindFirstChild('Bag') then
                        for _, item in ipairs(data.tools.Bag:GetChildren())do
                            GetRemote('AuthItemMove'):InvokeServer(item, data.tools.Bag, data.tools.Bag, tonumber('nan'))

                            return
                        end
                    end

                    for _, obj in ipairs(local_data:GetDescendants())do
                        if obj.Name == 'ExpectedLoc' then
                            GetRemote('AuthItemMove'):InvokeServer(obj.Parent, obj.Parent.Parent, data.tools.Held, tonumber('nan'))

                            return
                        end
                    end
                end,
            },
            {
                name = 'stealnpcwep',
                desc = 
[[stealnpcwep

call: stealnpcwep <wep_name: text> <amount: number>
command type: one time, visible, irreversible

description: steals the weapons in the specified amount from npcs of the specified group(s). Names of weapons that can be stolen: 870 MCS, CZ75, F57, MP7, RFB-C, Raven, S97Shield, Sawblade, SwatSniper, UP9Shield.]],
                usage_example = 'stealnpcwep SwatSniper 25 all\nstealnpcwep CZ75 50 g w s',
                checks = {
                    required_funcs = {
                        debug,
                        debug.getupvalue,
                        getsenv,
                    },
                    req_place_type = 'mission',
                    sp_allowed = true,
                    args = {
                        [1] = {
                            name = 'wep_name',
                            required = true,
                            type = 'text',
                            tip_gen = function(_)
                                return {
                                    'all',
                                    '870_MCS',
                                    'CZ75',
                                    'F57',
                                    'MP7',
                                    'RFB-C',
                                    'Raven',
                                    'S97Shield',
                                    'Sawblade',
                                    'SwatSniper',
                                    'UP9Shield',
                                }
                            end,
                        },
                        [2] = {
                            name = 'amount',
                            required = true,
                            type = 'number',
                        },
                        [3] = {
                            name = 'npc_group',
                            required = true,
                            type = 'text',
                            multiple = true,
                            tip_gen = function(_)
                                return {
                                    'w',
                                    'g',
                                    's',
                                    'c',
                                    'all',
                                    'e',
                                    'a',
                                }
                            end,
                        },
                    },
                },
                requires_char = true,
                af_compatible = false,
                func = function(_, wep_name, amount, ...)
                    amount = tonumber(amount) or 1
                    wep_name = string.lower(wep_name)
                    wep_name = string.gsub(wep_name, '_', ' ')

                    for _, group in ipairs({...})do
                        local group_npcs = npc_mgr.aliases[group]

                        if group_npcs == nil then
                            continue
                        end

                        for _, data in pairs(group_npcs)do
                            if data.status == nil or data.status:FindFirstChild('Weapons') == nil then
                                continue
                            end
                            if wep_name == 'all' then
                                for _, weapon in ipairs(data.status.Weapons:GetChildren())do
                                    GetRemote('AuthItemMove'):InvokeServer(weapon, weapon.Parent, GroundWeps, 0)

                                    amount = amount - 1

                                    if amount == 0 then
                                        return
                                    end
                                end
                            else
                                for _, weapon in ipairs(data.status.Weapons:GetChildren())do
                                    if weapon.Name:lower() ~= wep_name then
                                        continue
                                    end

                                    GetRemote('AuthItemMove'):InvokeServer(weapon, weapon.Parent, GroundWeps, 0)

                                    amount = amount - 1

                                    if amount == 0 then
                                        return
                                    end
                                end
                            end
                        end
                    end
                end,
            },
            {
                name = 'setdiff',
                desc = 
[[setdiff

call: setdiff <difficulty: number>
command type: one time, visible, irreversible

description: if you got to the mission using the teleport model with difficulty 0 or created a lobby using the lobby module with difficulty 0, the game won't know which difficulty to use, and this command sets the desired difficulty.]],
                usage_example = 'setdiff 1\nsetdiff 5',
                checks = {
                    req_place_type = 'mission',
                    args = {
                        [1] = {
                            name = 'difficulty',
                            required = true,
                            type = 'number',
                            tip_gen = function(_)
                                return {
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                }
                            end,
                        },
                    },
                    af_compatible = false,
                },
                func = function(difficulty)
                    difficulty = tonumber(difficulty)

                    if difficulty == nil or (difficulty < 1 or difficulty > 5) then
                        return 
[[difficulty must be an integer in the range from 1 to 5 inclusive.]]
                    end

                    GetRemote('SetGameDifficulty'):InvokeServer(difficulty)
                end,
            },
            {
                name = 'reset',
                desc = 
[[reset

call: reset
command type: one time, visible, irreversible

description: resets your character.]],
                usage_example = 'reset',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                required_parts = {
                    'Humanoid',
                },
                func = function(humanoid)
                    humanoid.Health = -1
                end,
            },
            {
                name = 'rejoin',
                desc = 
[[rejoin

call: rejoin
command type: one time, visible, irreversible

description: rejoins the current mission and sets the specified difficulty after teleporting.]],
                usage_example = 'rejoin 1\nrejoin 5',
                checks = {
                    req_place_type = 'mission',
                    args = {
                        [1] = {
                            name = 'difficulty',
                            required = true,
                            type = 'number',
                            tip_gen = function(_)
                                return {
                                    '1',
                                    '2',
                                    '3',
                                    '4',
                                    '5',
                                }
                            end,
                        },
                    },
                    af_compatible = true,
                },
                func = function(difficulty)
                    difficulty = tonumber(difficulty)

                    if difficulty == nil or (difficulty < 1 or difficulty > 5) then
                        return 
[[difficulty must be an integer in the range from 1 to 5 inclusive.]]
                    end

                    TeleportService:Teleport(game.PlaceId, LocalPlayer, {Difficulty = difficulty})
                end,
            },
            {
                name = 'clear',
                desc = 
[[clear

call: clear
command type: one time, invisible, irreversible

description: clears the terminal command output.]],
                usage_example = 'clear',
                checks = {
                    req_place_type = 'any',
                    af_compatible = true,
                },
                func = function()
                    for _, obj in ipairs(cache.commands_holder:GetChildren())do
                        if obj.Name == 'welcome_message' or (obj.ClassName ~= 'Frame' and obj.ClassName ~= 'TextLabel') then
                            continue
                        end

                        obj:Destroy()
                    end
                end,
            },
            {
                name = 'version',
                desc = 
[[version

call: version
command type: one time, invisible, irreversible

description: prints the script version.]],
                usage_example = 'version',
                checks = {
                    req_place_type = 'any',
                    af_compatible = true,
                },
                func = function()
                    return 'Deimos v2.0.2'
                end,
            },
            {
                name = 'autofarm',
                desc = 
[[autofarm

call: autofarm
command type: one time, visible, irreversible, can be executed only before mission start

description: autofarms the mission you're in now. Works only with story missions.]],
                usage_example = 'autofarm',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    local af_util = __DARKLUA_BUNDLE_MODULES.load('q')

                    if is_enabled == true then
                        if af_util.HasScenario() == true then
                            local response = af_util.Init(cmds_mgr.cmds, cache.ValidateCommand)

                            if response ~= nil then
                                cache.ValidateCommand('autofarm', 'terminal')

                                return response
                            end

                            af_util.PlayScenario()
                        else
                            return "autofarm scenario doesn't exists for this mission."
                        end
                    else
                        af_util.StopScenario()
                    end
                end,
            },
            {
                name = 'bdtploop',
                desc = 
[[bdtploop

call: bdtploop
command type: one time, visible, irreversible

description: on Blacksite, activates the teleport trigger of the camera operator room. This command must be executed before any of the players enter the prison room to work properly.]],
                usage_example = 'bdtploop',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = false,
                },
                func = function()
                    if game.PlaceId == 3200010305 then
                        local trigger = Triggers:FindFirstChild('CatchupTrigger')

                        if trigger == nil then
                            return 
[[this command can be executed only before someone entered the prison room.]]
                        end

                        tools.FireTouchTrigger(trigger)
                    else
                        return 'this command works only in Blacksite mission.'
                    end
                end,
            },
            {
                name = 'unlockstash',
                desc = 
[[unlockstash

call: unlockstash
command type: switch, invisible, reversible

description: allows you to stash any bags into dumpsters, chests, cabinets and closets. Reuse disables this feature.]],
                usage_example = 'unlockstash',
                checks = {
                    req_place_type = 'mission',
                    af_compatible = true,
                },
                func = function(is_enabled)
                    for _, stasher in ipairs(obj_mgr.stashers)do
                        stasher.Name = is_enabled and 'BodyStash ' or 'BodyStash'
                    end
                end,
            },
        }

        setmetatable(cmds_mgr.cmds, {
            __call = function(t, name, source, ...)
                local input_args = {...}

                for _, cmd_data in ipairs(cmds_mgr.cmds)do
                    if cmd_data.name ~= name then
                        continue
                    end
                    if cmd_data.pending ~= nil and coroutine.status(cmd_data.pending) ~= 'dead' then
                        tools.ClearTableTask(cmd_data, 'pending')

                        cmd_data.pending = nil
                    end

                    local args = {}
                    local flags = cmds_mgr.flags
                    local conns = cmds_mgr.conns
                    local flag = flags[cmd_data.name]

                    if flag ~= nil then
                        if flag == true then
                            local conn = conns[cmd_data.name]

                            if conn ~= nil then
                                if typeof(conn) == 'table' then
                                    for _, v in ipairs(conn)do
                                        v:Disconnect()

                                        conns[cmd_data.name] = {}
                                    end
                                else
                                    conns[cmd_data.name]:Disconnect()

                                    conns[cmd_data.name] = nil
                                end
                            end
                        end

                        flags[cmd_data.name] = not flags[cmd_data.name]
                        flag = flags[cmd_data.name]

                        table.insert(args, flag)
                    end

                    local ended = false

                    if flag ~= nil and source == 'terminal' then
                        cache.SendResponse({
                            response_text = name .. ': ' .. (flag == true and 'on' or 'off'),
                            timestamp = false,
                        })
                    end

                    local wait_task = coroutine.create(function()
                        if cmd_data.requires_char == true then
                            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

                            table.insert(args, character)
                        elseif cmd_data.required_parts ~= nil then
                            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
                            local required_parts = tools.WaitForChildren(character, table.unpack(table.clone(cmd_data.required_parts)))

                            for _, part in ipairs(required_parts)do
                                table.insert(args, part)
                            end
                        end

                        ended = true
                    end)

                    cmd_data.pending = wait_task

                    coroutine.resume(wait_task)

                    while cmd_data.pending ~= nil and ended == false do
                        task.wait()
                    end

                    if cmd_data.pending ~= nil then
                        for _, arg in ipairs(input_args)do
                            table.insert(args, arg)
                        end

                        local response = cmd_data.func(unpack(args))

                        return response
                    end
                end

                return nil
            end,
        })

        return cmds_mgr
    end
    function __DARKLUA_BUNDLE_MODULES.s()
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local cmds_mgr = __DARKLUA_BUNDLE_MODULES.load('r')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local config = __DARKLUA_BUNDLE_MODULES.load('e')
        local places = __DARKLUA_BUNDLE_MODULES.load('b')
        local ms_data, objassist_mgr, npc_mgr = nil, nil, nil

        if places.place_group == 'mission' then
            ms_data = __DARKLUA_BUNDLE_MODULES.load('i')
            objassist_mgr = __DARKLUA_BUNDLE_MODULES.load('p')
            npc_mgr = __DARKLUA_BUNDLE_MODULES.load('k')
        end

        local gui_size = gui_util.gui_holder.AbsoluteSize
        local UserInputService = game:GetService('UserInputService')
        local Players = game:GetService('Players')
        local MarketplaceService = game:GetService('MarketplaceService')
        local RunService = game:GetService('RunService')
        local ReplicatedStorage = game:GetService('ReplicatedStorage')
        local LocalPlayer = Players.LocalPlayer

        if places.place_group == 'mission' then
            GameState = ReplicatedStorage:WaitForChild('GameState', math.huge)
            start_time = GameState:WaitForChild('Start', math.huge)
        end

        local terminal = {}

        terminal.cmds_default_args = {
            'kill',
            'bring',
            'hide',
            'void',
        }
        terminal.commands_holder = nil
        terminal.cmds_text_size = (gui_size.X + gui_size.Y) / 220.54
        terminal.last_cmd_input = nil
        terminal.last_cmd_tip = nil
        terminal.terminal_label = nil
        terminal.terminal_background = nil
        terminal.tips_container = nil
        terminal.tip_base = nil
        terminal.on_input_end = nil
        terminal.matched_word = nil
        terminal.generated_tips = {}
        terminal.selected_tip = 1
        terminal.Render = function()
            local terminal_label = Instance.new('CanvasGroup')

            terminal_label.ZIndex = 11
            terminal_label.BorderSizePixel = 0
            terminal_label.BackgroundColor3 = Color3.fromRGB(21, 22, 26)
            terminal_label.Size = UDim2.fromScale(0.20855, 0.02160000056028366)
            terminal_label.Position = UDim2.fromScale(0.7586, 0.31019)
            terminal_label.Name = 'terminal_label'
            terminal_label.Visible = false
            terminal_label.Parent = gui_util.gui_holder
            terminal.terminal_label = terminal_label

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.24, 0)
            UICorner.Parent = terminal_label

            local dragon_image = Instance.new('ImageLabel')

            dragon_image.ZIndex = 12
            dragon_image.BorderSizePixel = 0
            dragon_image.SliceScale = 0
            dragon_image.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            dragon_image.ImageColor3 = Color3.fromRGB(10, 11, 15)
            dragon_image.Image = 'http://www.roblox.com/asset/?id=18444439483'
            dragon_image.Size = UDim2.fromScale(0.6, 7.64)
            dragon_image.BackgroundTransparency = 1
            dragon_image.Name = 'dragon_image'
            dragon_image.Position = UDim2.fromScale(-8.497E-2, -2.69136)
            dragon_image.Parent = terminal_label

            local terminal_directory = Instance.new('TextLabel')

            terminal_directory.TextWrapped = true
            terminal_directory.ZIndex = 12
            terminal_directory.TextScaled = true
            terminal_directory.BackgroundTransparency = 1
            terminal_directory.Size = UDim2.fromScale(1, 1)
            terminal_directory.Text = 'root@kali: ~/roblox/entrypoint'
            terminal_directory.Name = 'terminal_directory'
            terminal_directory.TextColor3 = Color3.fromRGB(255, 255, 255)
            terminal_directory.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            terminal_directory.Parent = terminal_label

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingTop = UDim.new(0.28026, 0)
            UIPadding.PaddingBottom = UDim.new(0.28026, 0)
            UIPadding.Parent = terminal_directory

            local left_corner = Instance.new('Frame')

            left_corner.ZIndex = 12
            left_corner.BorderSizePixel = 0
            left_corner.BackgroundColor3 = Color3.fromRGB(21, 22, 26)
            left_corner.Size = UDim2.fromScale(0.025, 0.4)
            left_corner.Position = UDim2.fromScale(0, 0.6)
            left_corner.Name = 'left_corner'
            left_corner.Parent = terminal_label

            local right_corner = left_corner:Clone()

            right_corner.Position = UDim2.fromScale(0.975, 0.6)
            right_corner.Name = 'right_corner'
            right_corner.Parent = terminal_label

            local AddLabelWindowButton = function(image_color, image, pos)
                local window_button = Instance.new('ImageLabel')

                window_button.BorderSizePixel = 0
                window_button.ZIndex = 12
                window_button.BackgroundTransparency = 1
                window_button.Image = image
                window_button.ImageColor3 = image_color
                window_button.Size = UDim2.fromScale(0.02249, 0.36033)
                window_button.Position = pos
                window_button.Parent = terminal_label
            end

            AddLabelWindowButton(Color3.fromRGB(255, 255, 255), 'http://www.roblox.com/asset/?id=18469798055', UDim2.fromScale(0.96, 0.34015))
            AddLabelWindowButton(Color3.fromRGB(255, 255, 255), 'http://www.roblox.com/asset/?id=18469928258', UDim2.fromScale(0.93, 0.34))
            AddLabelWindowButton(Color3.fromRGB(201, 201, 201), 'http://www.roblox.com/asset/?id=18469803005', UDim2.fromScale(0.9, 0.42))

            local terminal_icon = Instance.new('ImageLabel')

            terminal_icon.ZIndex = 12
            terminal_icon.BorderSizePixel = 0
            terminal_icon.BackgroundTransparency = 1
            terminal_icon.ImageColor3 = Color3.fromRGB(176, 176, 176)
            terminal_icon.Image = 'http://www.roblox.com/asset/?id=18453717387'
            terminal_icon.Size = UDim2.fromScale(0.04248, 0.68063)
            terminal_icon.Name = 'terminal_icon'
            terminal_icon.Position = UDim2.fromScale(0.015, 0.16015)
            terminal_icon.Parent = terminal_label

            local settings_button = Instance.new('Frame')

            settings_button.ZIndex = 12
            settings_button.BorderSizePixel = 0
            settings_button.BackgroundColor3 = Color3.fromRGB(40, 43, 53)
            settings_button.Size = UDim2.fromScale(0.03998, 0.64059)
            settings_button.Position = UDim2.fromScale(0.82207, 0.20019)
            settings_button.Name = 'settings'
            settings_button.Parent = terminal_label

            local UIStroke = Instance.new('UIStroke')

            UIStroke.Thickness = 0.75
            UIStroke.Parent = settings_button

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.2, 0)
            UICorner.Parent = settings_button

            local settings_button_image = Instance.new('ImageLabel')

            settings_button_image.ZIndex = 13
            settings_button_image.BackgroundTransparency = 1
            settings_button_image.BorderSizePixel = 0
            settings_button_image.Image = 'http://www.roblox.com/asset/?id=18457358643'
            settings_button_image.Size = UDim2.fromScale(0.75, 0.75)
            settings_button.Rotation = 90
            settings_button_image.Position = UDim2.fromScale(0.125, 0.125)
            settings_button_image.Parent = settings_button

            local search_button = settings_button:Clone()

            search_button.Position = UDim2.fromScale(0.77, 0.20019)
            search_button.ImageLabel.Image = 'http://www.roblox.com/asset/?id=18457354288'
            search_button.ImageLabel.Rotation = 0
            search_button.ImageLabel.Position = UDim2.fromScale(0.125, 0.125)
            search_button.Parent = terminal_label

            local terminal_background = Instance.new('Frame')

            terminal_background.BorderSizePixel = 0
            terminal_background.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
            terminal_background.Size = UDim2.fromScale(0.20879, 0.3959999978542328)
            terminal_background.Position = UDim2.fromScale(0.75836, 0.31019)
            terminal_background.Name = 'terminal_background'
            terminal_background.BackgroundTransparency = 0.05
            terminal_background.ZIndex = 10
            terminal_background.Visible = false
            terminal_background.Parent = gui_util.gui_holder
            terminal.terminal_background = terminal_background

            local container_holder = Instance.new('Frame')

            container_holder.Size = UDim2.fromScale(0.104, 0.087)
            container_holder.BackgroundColor3 = Color3.fromRGB(29, 29, 34)
            container_holder.ZIndex = 14
            container_holder.BorderSizePixel = 1
            container_holder.BorderColor3 = Color3.fromRGB(106, 106, 106)
            container_holder.Visible = false
            container_holder.AnchorPoint = Vector2.new(0, 0.4)
            container_holder.Parent = gui_util.gui_holder

            local tips_container = Instance.new('ScrollingFrame')

            tips_container.BackgroundTransparency = 1
            tips_container.Size = UDim2.fromScale(1, 1)
            tips_container.AutomaticCanvasSize = Enum.AutomaticSize.Y
            tips_container.BottomImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
            tips_container.TopImage = 'rbxasset://textures/ui/Scroll/scroll-middle.png'
            tips_container.ScrollBarThickness = 2
            tips_container.ScrollingDirection = Enum.ScrollingDirection.Y
            tips_container.VerticalScrollBarInset = Enum.ScrollBarInset.Always
            tips_container.ZIndex = 15
            tips_container.BorderSizePixel = 0
            tips_container.CanvasSize = UDim2.fromScale(0, 1)
            tips_container.Parent = container_holder
            terminal.tips_container = tips_container

            local tip_base = Instance.new('Frame')

            tip_base.Size = UDim2.fromScale(1, 0.2)
            tip_base.BackgroundColor3 = Color3.fromRGB(29, 29, 34)
            tip_base.ZIndex = 16
            tip_base.Visible = false
            tip_base.BorderSizePixel = 0
            tip_base.Parent = terminal_background
            terminal.tip_base = tip_base

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.2, 0)
            UIPadding.PaddingLeft = UDim.new(0.025, 0)
            UIPadding.PaddingTop = UDim.new(0.2, 0)
            UIPadding.Parent = tip_base

            local TextLabel = gui_util.GetUbuntuText('')

            TextLabel.Size = UDim2.fromScale(0.975, 1)
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel.ZIndex = 17
            TextLabel.Parent = tip_base

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.Parent = tips_container

            local UICorner = Instance.new('UICorner')

            UICorner.CornerRadius = UDim.new(0.0133)
            UICorner.Parent = terminal_background

            local commands_holder = Instance.new('ScrollingFrame')

            commands_holder.BorderSizePixel = 0
            commands_holder.Active = true
            commands_holder.ScrollingDirection = Enum.ScrollingDirection.Y
            commands_holder.BackgroundTransparency = 1
            commands_holder.CanvasSize = UDim2.fromScale(0, 1)
            commands_holder.Name = 'commands_holder'
            commands_holder.AutomaticCanvasSize = Enum.AutomaticSize.Y
            commands_holder.Size = UDim2.fromScale(0.9609, 0.89884)
            commands_holder.Position = UDim2.fromScale(0.02496, 0.07546)
            commands_holder.ScrollBarThickness = 2
            commands_holder.ZIndex = 11
            commands_holder.Parent = terminal_background

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingRight = UDim.new(0.03, 0)
            UIPadding.Parent = commands_holder
            terminal.commands_holder = commands_holder

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.Padding = UDim.new(0.015, 0)
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = commands_holder
        end
        terminal.checks = {
            PlaceCheck = function(name, flags)
                if flags.req_place_type ~= nil then
                    local current = places.place_group
                    local required = flags.req_place_type

                    if required == 'any' then
                        return true, nil
                    end
                    if current ~= required then
                        return false, 'ConditionError: command "' .. name .. '" can be executed only in the ' .. required .. '.'
                    end
                end

                return true, nil
            end,
            UNCCompatibilityCheck = function(name, flags)
                if flags.required_funcs ~= nil then
                    for _, func in ipairs(flags.required_funcs)do
                        if func ~= nil then
                            continue
                        end

                        return false, 'IntegrityError: ' .. (getexecutorname and getexecutorname() or 'your executor') .. ' can\'t execute command "' .. name .. '".'
                    end
                end

                return true, nil
            end,
            MissingArgsCheck = function(args, flags)
                local req_args = flags.args

                if req_args == nil then
                    return true, nil
                end

                local missing = 'MissingArgsError: make sure you entered value(s) for '
                local found_missing = false

                for index, arg_flags in ipairs(req_args)do
                    if req_args[index].name ~= 'npc_group' and args[index] == nil then
                        if arg_flags.required ~= true then
                            continue
                        end

                        missing = missing .. arg_flags.name .. ', '
                        found_missing = true
                    end
                end

                if found_missing == true then
                    missing = string.sub(missing, 0, -3) .. ' arg(s).'

                    return false, missing
                else
                    return true, nil
                end
            end,
            TypesMismatchCheck = function(args, flags)
                local req_args = flags.args

                if req_args == nil then
                    return true, nil
                end

                local types = 'TypeMismatchError: '
                local found_types = false

                for index, arg_flags in ipairs(req_args)do
                    if req_args[index].name == 'npc_group' or (req_args[index].required == false and args[index] == nil) then
                        continue
                    end
                    if arg_flags.type == 'number' and tonumber(args[index]) == nil then
                        found_types = true
                        types = types .. arg_flags.name .. ' should be a number, '
                    elseif arg_flags.type == 'text' and tonumber(args[index]) ~= nil then
                        found_types = true
                        types = types .. arg_flags.name .. ' should be a text, '
                    end
                end

                if found_types == true then
                    types = string.sub(types, 0, -3) .. '.'

                    return false, types
                else
                    return true, nil
                end
            end,
            BossCheck = function(name, flags)
                if ms_data ~= nil and table.find({
                    'killboss',
                }, name) and flags.boss_required == true and ms_data.current.kill_boss == nil then
                    return false, 'ConditionError: command "' .. name .. 
[[" works only in missions with bosses (gunships, SWAT vans, Onyx Unit).]]
                end

                return true, nil
            end,
            ObjassistCheck = function(flags)
                if objassist_mgr ~= nil and flags.objassist_required == true and objassist_mgr[game.PlaceId] == nil then
                    return false, 
[[LookupError: objective assistance for this mission doesn't exists.]]
                end

                return true, nil
            end,
            MissionStartedCheck = function(name, flags)
                if flags.before_mission_start == true and start_time.Value ~= 0 then
                    return false, 'ConditionError: command "' .. name .. '" can be executed only before the mission start.'
                end

                return true, nil
            end,
            TeamsExistenceCheck = function(args, flags)
                if npc_mgr == nil then
                    return true, nil
                end

                local req_args = flags.args

                if req_args == nil then
                    return true, nil
                end

                local last_index = #req_args

                if req_args[last_index].name == 'npc_group' then
                    if args[last_index] == nil then
                        return false, 
[[MissingArgsError: you need to enter one or more npc groups for this command.]]
                    end

                    local found_team = false
                    local wrong_team = 'WrongTeamWarning: team(s) '

                    for index = last_index, #args, 1 do
                        local team_aliase = args[index]

                        if team_aliase == 'sp' and flags.sp_allowed == false then
                            terminal.SendResponse({
                                response_text = "ConditionWarning: this command doesn't works with snipers.",
                                timestamp = true,
                            })
                        end
                        if npc_mgr.aliases[team_aliase] == nil then
                            found_team = true
                            wrong_team = wrong_team .. team_aliase .. ', '
                        end
                    end

                    if found_team == true then
                        wrong_team = string.sub(wrong_team, 0, -3) .. " doesn't exists."

                        terminal.SendResponse({
                            response_text = wrong_team,
                            timestamp = true,
                        })
                    end
                end

                return true, nil
            end,
        }
        terminal.GroupSameWords = function(words_table)
            local same = {}

            for _, word in ipairs(words_table)do
                if not same[word] then
                    same[word] = 1
                else
                    same[word] = same[word] + 1
                end
            end

            local finished = {}

            for word, amount in pairs(same)do
                table.insert(finished, amount > 1 and word .. ' (' .. tostring(amount) .. 'x)' or word)
            end

            return finished
        end
        terminal.GetLastInputCmdArgs = function(str)
            return string.match(str, ', *(%a[^,]*)$') or string.match(str, '^[^,]+$')
        end
        terminal.GetArgs = function(last_input_cmd_args)
            local copy = table.clone(last_input_cmd_args)

            table.remove(copy, 1)

            return copy
        end
        terminal.ParseCmdArgs = function(str)
            local splitted = string.split(str, ' ')

            for index, value in ipairs(splitted)do
                if value == '' then
                    table.remove(splitted, index)
                end
            end

            return splitted
        end
        terminal.GenerateTipButton = function(text)
            local tip = terminal.tip_base:Clone()

            tip.TextLabel.Text = text
            tip.Visible = true

            return tip
        end
        terminal.ShowTipList = function()
            terminal.tips_container.Parent.Visible = true
        end
        terminal.HideTipList = function()
            terminal.tips_container.Parent.Visible = false
        end
        terminal.ClearTipList = function()
            for _, obj in ipairs(terminal.tips_container:GetChildren())do
                if obj.ClassName == 'UIListLayout' then
                    continue
                end

                obj:Destroy()
            end

            terminal.generated_tips = {}
            terminal.selected_tip = 1
        end
        terminal.BuildTipList = function(tips)
            terminal.ClearTipList()

            for _, tip_text in ipairs(tips)do
                local tip = terminal.GenerateTipButton(tip_text)

                table.insert(terminal.generated_tips, tip)

                tip.Parent = terminal.tips_container
            end

            RunService.RenderStepped:Wait()
        end
        terminal.UpdateTipListPos = function()
            local x_pos = terminal.last_cmd_input.AbsolutePosition.X + terminal.last_cmd_input.TextBounds.X + 5
            local y_pos = terminal.last_cmd_input.AbsolutePosition.Y - 5

            terminal.tips_container.Parent.Position = UDim2.fromOffset(x_pos, y_pos)
        end
        terminal.SelectTip = function(direction)
            if #terminal.generated_tips == 0 then
                return
            end

            local tip_y_size = terminal.generated_tips[1].AbsoluteSize.Y

            terminal.generated_tips[terminal.selected_tip].BackgroundColor3 = Color3.fromRGB(29, 29, 34)

            if direction == 'down' and terminal.selected_tip < #terminal.generated_tips then
                terminal.selected_tip = terminal.selected_tip + 1
            elseif direction == 'up' and terminal.selected_tip > 1 then
                terminal.selected_tip = terminal.selected_tip - 1
            end

            terminal.tips_container.CanvasPosition = Vector2.new(0, (terminal.selected_tip <= 5 and 0 or (terminal.selected_tip - 5) * tip_y_size))
            terminal.generated_tips[terminal.selected_tip].BackgroundColor3 = Color3.fromRGB(45, 58, 95)
        end
        terminal.GenerateArgTip = function(arg_data)
            return arg_data.name .. ': ' .. (arg_data.type == 'number' and 'num' or 'text') .. (arg_data.required == true and '' or '?') .. (arg_data.multiple == true and '+' or '')
        end
        terminal.SendResponse = function(args)
            local MessageHolder = Instance.new('Frame')

            MessageHolder.Size = UDim2.fromScale(1, args.custom_y or 0.035)
            MessageHolder.ZIndex = 12
            MessageHolder.BackgroundTransparency = 1
            MessageHolder.Name = 'response_holder'
            MessageHolder.AutomaticSize = Enum.AutomaticSize.Y
            MessageHolder.Parent = terminal.commands_holder

            local UISizeConstraint = Instance.new('UISizeConstraint')

            UISizeConstraint.MaxSize = Vector2.new(tonumber('inf'), 240)
            UISizeConstraint.Parent = MessageHolder

            local ResponseMessage = Instance.new('TextLabel')

            ResponseMessage.TextScaled = true
            ResponseMessage.LineHeight = 1.2
            ResponseMessage.ZIndex = 2
            ResponseMessage.BorderSizePixel = 0
            ResponseMessage.TextXAlignment = Enum.TextXAlignment.Left
            ResponseMessage.TextYAlignment = Enum.TextYAlignment.Top
            ResponseMessage.TextSize = terminal.cmds_text_size
            ResponseMessage.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            ResponseMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
            ResponseMessage.BackgroundTransparency = 1
            ResponseMessage.RichText = true
            ResponseMessage.Size = UDim2.fromScale(1, 1)
            ResponseMessage.BorderColor3 = Color3.fromRGB(0, 0, 0)
            ResponseMessage.Text = (args.timestamp == true and os.date('%X') .. ' - ' or '') .. args.response_text
            ResponseMessage.AutomaticSize = Enum.AutomaticSize.Y
            ResponseMessage.Name = 'response'
            ResponseMessage.ZIndex = 12
            ResponseMessage.Parent = MessageHolder

            local UITextSizeConstraint = Instance.new('UITextSizeConstraint')

            UITextSizeConstraint.MaxTextSize = 13
            UITextSizeConstraint.Parent = ResponseMessage

            return ResponseMessage
        end
        terminal.CreateCmdInput = function()
            local InputHolder = Instance.new('Frame')

            InputHolder.BorderSizePixel = 0
            InputHolder.Size = UDim2.fromScale(1, 0.035)
            InputHolder.Position = UDim2.fromScale(0.60678, 0)
            InputHolder.BackgroundTransparency = 1
            InputHolder.ZIndex = 12
            InputHolder.LayoutOrder = 1
            InputHolder.Name = 'input_holder'
            InputHolder.Parent = terminal.commands_holder

            local Username = Instance.new('TextLabel')

            Username.ZIndex = 2
            Username.BorderSizePixel = 0
            Username.TextXAlignment = Enum.TextXAlignment.Left
            Username.TextYAlignment = Enum.TextYAlignment.Top
            Username.TextScaled = true
            Username.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            Username.TextColor3 = Color3.fromRGB(255, 255, 255)
            Username.BackgroundTransparency = 1
            Username.RichText = true
            Username.Size = UDim2.fromScale(0.16, 1)
            Username.BorderColor3 = Color3.fromRGB(0, 0, 0)
            Username.Text = '<font color="rgb(115, 178, 255)">root@kali</font>:'
            Username.ZIndex = 13
            Username.Name = 'username'
            Username.Parent = InputHolder

            local CommandInput = Instance.new('TextBox', InputHolder)

            CommandInput.TextColor3 = Color3.fromRGB(255, 255, 255)
            CommandInput.BorderSizePixel = 0
            CommandInput.TextXAlignment = Enum.TextXAlignment.Left
            CommandInput.TextYAlignment = Enum.TextYAlignment.Top
            CommandInput.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            CommandInput.RichText = true
            CommandInput.ClearTextOnFocus = false
            CommandInput.ClipsDescendants = false
            CommandInput.TextScaled = true
            CommandInput.Size = UDim2.fromScale(0.83393, 1)
            CommandInput.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CommandInput.BackgroundTransparency = 1
            CommandInput.Text = ''
            CommandInput.Name = 'command_input'
            CommandInput.LayoutOrder = 1
            CommandInput.ZIndex = 13

            local UITextSizeConstraint = Instance.new('UITextSizeConstraint')

            UITextSizeConstraint.MinTextSize = 13
            UITextSizeConstraint.Parent = CommandInput

            local CommandTip = Instance.new('TextLabel', CommandInput)

            CommandTip.TextColor3 = Color3.fromRGB(100, 100, 100)
            CommandTip.BorderSizePixel = 0
            CommandTip.TextXAlignment = Enum.TextXAlignment.Left
            CommandTip.TextSize = terminal.cmds_text_size
            CommandTip.TextYAlignment = Enum.TextYAlignment.Top
            CommandTip.FontFace = Font.new('rbxasset://fonts/families/Ubuntu.json', Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            CommandTip.RichText = true
            CommandTip.ClipsDescendants = true
            CommandTip.Size = UDim2.fromScale(1, 1)
            CommandTip.BorderColor3 = Color3.fromRGB(0, 0, 0)
            CommandTip.BackgroundTransparency = 1
            CommandTip.Text = ''
            CommandTip.ZIndex = 12

            local UIListLayout = Instance.new('UIListLayout')

            UIListLayout.FillDirection = Enum.FillDirection.Horizontal
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout.Parent = InputHolder
            terminal.last_cmd_input = CommandInput
            terminal.last_cmd_tip = CommandTip

            return CommandInput, CommandTip
        end
        terminal.ValidateCommand = function(input, source)
            for _, cmd_with_args in ipairs(string.split(input, ','))do
                local parsed = terminal.ParseCmdArgs(cmd_with_args)
                local args = terminal.GetArgs(parsed)
                local cmd = parsed[1]
                local cmd_data = cmds_mgr.GetCmdData(cmd)

                if cmd_data == nil then
                    terminal.SendResponse({
                        response_text = 'LookupError: command "' .. cmd .. '" doesn\'t exists.',
                        timestamp = true,
                    })

                    return
                end

                local cmd_flag = cmds_mgr.GetCmdFlag(cmd)

                if source == 'autofarm' and cmd_flag == true then
                    return
                end
                if source ~= 'autofarm' and (cmd_flag == nil or cmd_flag == false) then
                    if cmds_mgr.GetCmdFlag('autofarm') == true and cmd_data.checks.af_compatible ~= true then
                        terminal.SendResponse({
                            response_text = 'ConditionError: command "' .. cmd .. '" can\'t be executed during autofarm.',
                            timestamp = true,
                        })

                        return
                    end

                    cmd_data = cmd_data.checks

                    local checks = terminal.checks

                    for _, check in ipairs({
                        'PlaceCheck',
                        'UNCCompatibilityCheck',
                        'BossCheck',
                        'MissionStartedCheck',
                    })do
                        local success, response = checks[check](cmd, cmd_data)

                        if response ~= nil and (source ~= 'startup' or (source == 'startup' and config.config.scr_settings.startup_response == true)) then
                            terminal.SendResponse({
                                response_text = response,
                                timestamp = true,
                            })
                        end
                        if success == false then
                            return
                        end
                    end
                    for _, check in ipairs({
                        'MissingArgsCheck',
                        'TypesMismatchCheck',
                    })do
                        local success, response = checks[check](args, cmd_data)

                        if response ~= nil and (source ~= 'startup' or (source == 'startup' and config.config.scr_settings.startup_response == true)) then
                            terminal.SendResponse({
                                response_text = response,
                                timestamp = true,
                            })
                        end
                        if success == false then
                            return
                        end
                    end

                    local success, response = checks.ObjassistCheck(cmd_data)

                    if response ~= nil and (source ~= 'startup' or (source == 'startup' and config.config.scr_settings.startup_response == true)) then
                        terminal.SendResponse({
                            response_text = response,
                            timestamp = true,
                        })
                    end
                    if success == false then
                        return
                    end

                    local success, response = checks.TeamsExistenceCheck(args, cmd_data)

                    if response ~= nil and (source ~= 'startup' or (source == 'startup' and config.config.scr_settings.startup_response == true)) then
                        terminal.SendResponse({
                            response_text = response,
                            timestamp = true,
                        })
                    end
                    if success == false then
                        return
                    end
                end

                local command_response = cmds_mgr.cmds(cmd, source, unpack(args))

                if command_response ~= nil then
                    if source ~= 'autofarm' and source ~= 'startup' then
                        terminal.SendResponse({
                            response_text = command_response,
                            timestamp = false,
                        })
                    end
                end
            end
        end
        terminal.ScrollOnContentSizeChange = function()
            local cmds_holder = terminal.commands_holder

            cmds_holder.UIListLayout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function(
            )
                if cmds_holder.UIListLayout.AbsoluteContentSize.Y > cmds_holder.AbsoluteSize.Y then
                    cmds_holder.CanvasPosition = Vector2.new(0, 1000000)
                    cmds_holder.UIListLayout.VerticalFlex = Enum.UIFlexAlignment.SpaceBetween
                else
                    cmds_holder.CanvasPosition = Vector2.new(0, 0)
                end
            end)
        end
        terminal.SetCmdsHolderPos = function()
            local cmds_holder = terminal.commands_holder

            if cmds_holder.UIListLayout.AbsoluteContentSize.Y > cmds_holder.AbsoluteSize.Y then
                cmds_holder.CanvasPosition = Vector2.new(0, 1000000)
                cmds_holder.UIListLayout.VerticalFlex = Enum.UIFlexAlignment.SpaceBetween
            else
                cmds_holder.CanvasPosition = Vector2.new(0, 0)
            end
        end
        terminal.LastInputIsWriteable = function()
            return terminal.last_cmd_input and terminal.last_cmd_input.Text == ''
        end
        terminal.FocusLastInput = function()
            terminal.last_cmd_input:CaptureFocus()
        end
        terminal.Show = function()
            terminal.terminal_label.Visible = true
            terminal.terminal_background.Visible = true
        end
        terminal.Hide = function()
            terminal.terminal_label.Visible = false
            terminal.terminal_background.Visible = false
        end
        terminal.ListenForInputEnd = function()
            local last_cmd_input = terminal.last_cmd_input
            local conn

            conn = last_cmd_input.FocusLost:Connect(function()
                terminal.HideTipList()
                terminal.Hide()

                if last_cmd_input.Text ~= '' then
                    conn:Disconnect()

                    last_cmd_input.TextEditable = false
                    last_cmd_input.Parent.LayoutOrder = 0

                    terminal.ValidateCommand(last_cmd_input.Text, 'terminal')
                end

                terminal.last_cmd_tip.Text = ''
            end)
        end
        terminal.RemoveSemicolon = function()
            if string.find(terminal.last_cmd_input.Text, ';') then
                terminal.last_cmd_input.Text = string.gsub(terminal.last_cmd_input.Text, ';', '')
            end
        end
        terminal.Open = function()
            terminal.Show()

            if terminal.LastInputIsWriteable() == true then
                terminal.FocusLastInput()
            else
                terminal.CreateCmdInput()
                terminal.FocusLastInput()
                terminal.ListenForInputEnd()
            end

            terminal.SetCmdsHolderPos()
            terminal.last_cmd_input:GetPropertyChangedSignal('Text'):Connect(function(
            )
                terminal.RemoveSemicolon()

                local cmd_tip = terminal.last_cmd_tip
                local cmd_input = terminal.last_cmd_input

                if cmd_input.Text == '' then
                    cmd_tip.Text = ''

                    terminal.HideTipList()

                    return
                end

                local cmd_with_args = terminal.GetLastInputCmdArgs(cmd_input.Text)

                if cmd_with_args == nil then
                    terminal.HideTipList()

                    cmd_tip.Text = ''

                    return
                end

                local parsed = terminal.ParseCmdArgs(cmd_with_args)

                if parsed then
                    local cmd_name_matches, exact_match = cmds_mgr.GetMatchedCommands(parsed[1])

                    if #parsed == 1 then
                        cmd_tip.Text = ''

                        if #cmd_name_matches == 0 then
                            terminal.HideTipList()
                        elseif string.match(cmd_input.Text, ' $') == nil then
                            terminal.BuildTipList(cmd_name_matches)
                            terminal.SelectTip('up')
                            terminal.UpdateTipListPos()
                            terminal.ShowTipList()
                        end
                    end
                    if exact_match == true and string.match(cmd_input.Text, ' $') ~= nil then
                        local cmd_data = cmds_mgr.GetCmdData(parsed[1])

                        if cmd_data == nil or cmd_data.checks == nil or cmd_data.checks.args == nil then
                            terminal.HideTipList()

                            cmd_tip.Text = ''

                            return
                        end

                        cmd_tip.Text = ''

                        for _, word in ipairs(parsed)do
                            cmd_tip.Text = cmd_tip.Text .. word .. ' '
                        end

                        local cmd_data_args = cmd_data.checks.args
                        local expected_arg = cmd_data_args[#parsed] or (cmd_data_args[#cmd_data_args].multiple == true and cmd_data_args[#cmd_data_args] or nil)

                        if expected_arg ~= nil then
                            cmd_tip.Text = cmd_tip.Text .. terminal.GenerateArgTip(expected_arg) .. ' '
                        end
                        if expected_arg == nil or expected_arg.tip_gen == nil then
                            terminal.HideTipList()

                            return
                        end

                        local args = terminal.GetArgs(parsed)
                        local tips = expected_arg.tip_gen(args)

                        if tips == nil or #tips == 0 then
                            terminal.HideTipList()

                            return
                        end

                        tips = terminal.GroupSameWords(tips)

                        terminal.BuildTipList(tips)
                        terminal.SelectTip('up')
                        terminal.UpdateTipListPos()
                        terminal.ShowTipList()
                    end
                else
                    cmd_tip.Text = ''

                    terminal.HideTipList()

                    return
                end
            end)
        end
        terminal.IsInputEndsWithSpace = function()
            return string.match(terminal.last_cmd_input.Text, ' $') ~= nil
        end
        terminal.ApplyAutocomplete = function()
            local cmd_input = terminal.last_cmd_input
            local last_word = string.match(cmd_input.Text, '^%l+$') or string.match(cmd_input.Text, ', ?(%l+)$')

            if last_word == nil then
                return
            end

            cmd_input.Text = string.gsub(cmd_input.Text, '%l+$', '') .. terminal.matched_word
            cmd_input.CursorPosition = 10000
        end
        terminal.ApplySelectedTip = function()
            local selected_tip = terminal.generated_tips[terminal.selected_tip].TextLabel.Text

            selected_tip = string.match(selected_tip, '[%a%-%d_]+')

            terminal.ClearTipList()

            if terminal.IsInputEndsWithSpace() == true then
                do
                    local __DARKLUA_VAR = terminal.last_cmd_input

                    __DARKLUA_VAR.Text = __DARKLUA_VAR.Text .. selected_tip .. ' '
                end
            else
                terminal.last_cmd_input.Text = string.gsub(terminal.last_cmd_input.Text, '%a+$', selected_tip .. ' ')
            end

            terminal.last_cmd_input.CursorPosition = 10000
        end
        terminal.Init = function()
            terminal.Render()
            UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.Semicolon and UserInputService:GetFocusedTextBox() == nil and (terminal.last_cmd_input == nil or terminal.last_cmd_input:IsFocused() == false) then
                    terminal.Open()
                elseif terminal.last_cmd_input ~= nil and terminal.last_cmd_input:IsFocused() and #terminal.generated_tips > 0 then
                    if input.KeyCode == Enum.KeyCode.Up then
                        while UserInputService:IsKeyDown(Enum.KeyCode.Up) == true do
                            terminal.SelectTip('up')
                            task.wait(0.125)
                        end
                    elseif input.KeyCode == Enum.KeyCode.Down then
                        while UserInputService:IsKeyDown(Enum.KeyCode.Down) == true do
                            terminal.SelectTip('down')
                            task.wait(0.125)
                        end
                    elseif input.KeyCode == Enum.KeyCode.Right or input.KeyCode == Enum.KeyCode.LeftAlt then
                        terminal.ApplySelectedTip()
                    end
                end
            end)
            terminal.ScrollOnContentSizeChange()

            cache.SendResponse = terminal.SendResponse
            cache.ValidateCommand = terminal.ValidateCommand
            cache.commands_holder = terminal.commands_holder

            local welcome_message = nil

            if config.config.first_time == true then
                welcome_message = '<b>INFO</b>: Welcome <i>' .. LocalPlayer.Name .. 
[[</i> ! Thanks for buying the the key and supporting this script! Type <i>help</i> for a list of commands, <i>keybinds</i> to bind a commands to the keys. If you will have any problems, contact rawparmesan in Discord.]]
                config.config.first_time = false

                config.Save()
            else
                welcome_message = '<b>INFO</b>: Welcome back, <i>' .. LocalPlayer.Name .. 
[[</i> ! Type <i>help</i> for a list of commands, <i>keybinds</i> to bind a commands to the keys.]]
            end

            welcome_message = welcome_message .. '<br /><br /><b>SERVER INFO</b>:<br />Server ID: ' .. game.JobId .. '<br />Place ID: ' .. game.PlaceId .. '<br />Place Version: ' .. game.PlaceVersion .. '<br />Place Name: N/A'

            if #config.config.startup_cmds > 0 then
                welcome_message = welcome_message .. '<br/><br/>' .. os.date('%X') .. 
[[ - startup module sent a request to the core to execute the following command(s): ]]

                for _, cmd in ipairs(config.config.startup_cmds)do
                    welcome_message = welcome_message .. cmd .. ', '
                end

                welcome_message = string.sub(welcome_message, 1, -3)
                welcome_message = welcome_message .. '.'
            end

            local response_text = terminal.SendResponse({
                response_text = welcome_message,
                timestamp = false,
            })

            response_text.Parent.LayoutOrder = -1
            response_text.Name = 'welcome_message'

            task.spawn(function()
                response_text.Text = string.gsub(response_text.Text, 'N/A', MarketplaceService:GetProductInfo(game.PlaceId).Name)
            end)
        end

        return terminal
    end
    function __DARKLUA_BUNDLE_MODULES.t()
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local cmds_mgr = __DARKLUA_BUNDLE_MODULES.load('r')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local help = {}

        help.desc = nil
        help.usage_example = nil
        help.Render = function()
            help.window = gui_util.CreateWindow('root@kali: /terminal/help')
            help.window.Position = UDim2.fromScale(0.453, 0.101)
            cache.help_window = help.window

            gui_util.MakeWindowDraggable(help.window)

            local content_holder = gui_util.AddContentHolder(help.window)

            gui_util.SetContentEnv(content_holder)
            gui_util.AddHelpSection('Arguments Explanation')
            gui_util.AddTextBlock('What is an argument? The argument is the value(s) that you type after the command. They determine how the command will act. For example, when you type loopws 50, "50" is the argument of command loopws, and when you execute this command, it will set the walk speed of your character to 50.\nIn the command description, you can see the "call" line, which shows which values with which data types the arguments of a particular command should be.\nSome arguments in commands description has symbols "?" and "+", that\'s what they mean:\n\t? - this command argument is optional, and if it is not specified, this argument will be replaced with the default value in the command. If this character isn\'t present, then this command argument is required.\n\t+ - this command argument can be entered several times in a row with different values. For example: kill <npc_group: text>+ - kill w g s c.', 0.8)
            gui_util.AddHelpSection('Commands Types Explanation')
            gui_util.AddTextBlock('The types of commands are divided according to how they are execute and behave.\n\u{2022} switch - the first command call makes the changes, and the second command call reverts these changes.\n\u{2022} one time - every command call does some changes.\n\u{2022} visible - the changes caused by this command may be directly or indirectly visible to your teammates.\n\u{2022} invisible - the changes caused by this command may be visible only for you.\n\u{2022} reversible - the consequences caused by this command are reversible.\n\u{2022} irreversible - the consequences caused by this command are irreversible.\n\u{2022} network ownership dependent - in Roblox, "network ownership" is a technology in which physical computations are distributed between the server (game) and all connected clients (players). To control an object, for example npc or bag, you must be the closest player to it.\n\u{2022} can be executed only before the mission start - in order for this command to work correctly and stably, it must be executed before the mission starts.', 0.85)
            gui_util.AddHelpSection('NPCs Groups Legend')
            gui_util.AddTextBlock(
[[a - allies (Rose, Rivera, Jade)
w - workers (employee, staff, tech, etc.)
g - guards (guards, base security, security, etc.)
s - specials (manager, falcon, ryan, etc.)
e - enemies (SWAT, aegis unit, SC shredder, etc.)
c - civilians
sp - snipers (doesn't works with most commands)
all - all npcs (excluding snipers)

item - ground items (thermite, lockpick, etc.)
bag - ground bags (equipment bag, cash, gold, etc.)]], 0.45)

            local cmds_section = gui_util.AddHelpSection('Avalable Commands')
            local count = 0

            for _, data in ipairs(cmds_mgr.cmds)do
                count = count + 1

                gui_util.AddHelpButton(data.name, function()
                    help.desc.Text = data.desc or 'no command description.'
                    help.usage_example.Text = data.usage_example or 'no usage example.'
                end)
            end

            cmds_section.Text = 'Avalable Commands [' .. tonumber(count) .. ']'

            local cmd_desc = gui_util.CreateWindow('Command Description')

            cmd_desc.Size = UDim2.fromScale(1, 1)
            cmd_desc.Position = UDim2.fromScale(1.02, 0)
            cmd_desc.Visible = true

            cmd_desc:WaitForChild('app_name_holder', math.huge):WaitForChild('app_name', math.huge):WaitForChild('close_button', math.huge):Destroy()

            cmd_desc.Parent = help.window

            gui_util.SetContentEnv(cmd_desc)

            local gh_size = gui_util.gui_holder.AbsoluteSize
            local section1 = gui_util.AddHelpSection('Command Description')

            section1.Size = UDim2.fromScale(0.931, 0.052)
            section1.Position = UDim2.fromScale(0.034, 0.086)

            local desc = gui_util.GetUbuntuText('')

            desc.BackgroundTransparency = 0
            desc.TextScaled = false
            desc.TextWrapped = true
            desc.BackgroundColor3 = Color3.fromRGB(25, 26, 31)
            desc.Size = UDim2.fromScale(0.929, 0.517)
            desc.Position = UDim2.fromScale(0.034, 0.16)
            desc.TextSize = (gh_size.X + gh_size.Y) / 250
            desc.TextXAlignment = Enum.TextXAlignment.Left
            desc.TextYAlignment = Enum.TextYAlignment.Top
            desc.LineHeight = 1.3
            desc.BorderSizePixel = 0
            desc.Parent = cmd_desc
            help.desc = desc

            local section2 = gui_util.AddHelpSection('Usage Example')

            section2.Size = UDim2.fromScale(0.931, 0.052)
            section2.Position = UDim2.fromScale(0.034, 0.702)

            local usage_example = desc:Clone()

            usage_example.Size = UDim2.fromScale(0.929, 0.188)
            usage_example.Position = UDim2.fromScale(0.034, 0.783)
            usage_example.TextSize = (gh_size.X + gh_size.Y) / 250
            usage_example.Parent = cmd_desc
            help.usage_example = usage_example

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingBottom = UDim.new(0.025, 0)
            UIPadding.PaddingLeft = UDim.new(0.025, 0)
            UIPadding.PaddingRight = UDim.new(0.025, 0)
            UIPadding.PaddingTop = UDim.new(0.025, 0)
            UIPadding.Parent = desc

            local UIPadding = Instance.new('UIPadding')

            UIPadding.PaddingTop = UDim.new(0.075, 0)
            UIPadding.PaddingLeft = UDim.new(0.025, 0)
            UIPadding.PaddingRight = UDim.new(0.025, 0)
            UIPadding.Parent = usage_example

            gui_util.gui_holder:GetPropertyChangedSignal('AbsoluteSize'):Connect(function(
            )
                desc.TextSize = (gh_size.X + gh_size.Y) / 250
                usage_example.TextSize = (gh_size.X + gh_size.Y) / 250
            end)
        end

        return help
    end
    function __DARKLUA_BUNDLE_MODULES.u()
        local config = __DARKLUA_BUNDLE_MODULES.load('e')
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local terminal = __DARKLUA_BUNDLE_MODULES.load('s')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local UserInputService = game:GetService('UserInputService')
        local keybinds_config = config.config.keybinds
        local keybinds = {}

        keybinds.keys = {
            'O',
            'P',
            'K',
            'L',
            'M',
            'Y',
            'N',
            ',',
            '[',
            ']',
            "'",
            '.',
        }
        keybinds.Render = function()
            local window = gui_util.CreateWindow('root@kali: /terminal/keybinds')

            window.Position = UDim2.fromScale(0.26, 0.101)
            cache.keybinds_window = window

            gui_util.MakeWindowDraggable(window)

            local content_holder = gui_util.AddContentHolder(window)

            gui_util.SetContentEnv(content_holder)
            gui_util.AddSection('Set Keybinds')

            for _, key in ipairs(keybinds.keys)do
                local input = gui_util.CreateHotkeyInput(key, function(text)
                    keybinds_config[key] = text

                    config.Save()
                end)

                if keybinds_config[key] ~= nil and keybinds_config[key] ~= '' then
                    input:ChangeText(keybinds_config[key])
                end
            end

            UserInputService.InputBegan:Connect(function(input)
                if input.KeyCode.Value > 255 or UserInputService:GetFocusedTextBox() ~= nil then
                    return
                end

                local character = string.char(input.KeyCode.Value):upper()

                if keybinds_config[character] == nil or keybinds_config[character] == '' then
                    return
                end

                terminal.ValidateCommand(keybinds_config[character], 'terminal')
            end)
        end

        return keybinds
    end
    function __DARKLUA_BUNDLE_MODULES.v()
        local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
        local cache = __DARKLUA_BUNDLE_MODULES.load('c')
        local config = __DARKLUA_BUNDLE_MODULES.load('e')
        local terminal = __DARKLUA_BUNDLE_MODULES.load('s')

        game:GetService('UserInputService')

        local startup_config = config.config.startup_cmds
        local startup = {}

        startup.InitCommandInput = function(cmd)
            local cmd_index = nil

            if cmd ~= nil then
                cmd_index = table.find(startup_config, cmd)

                if cmd_index == 0 then
                    cmd_index = -1
                end
            else
                cmd_index = -1
            end

            local input

            input = gui_util.CreateClickableInput('Command', 'command', function(
                command
            )
                if cmd_index == -1 then
                    table.insert(startup_config, command)

                    cmd_index = table.find(startup_config, command)
                else
                    startup_config[cmd_index] = command
                end

                config.Save()
            end, function()
                if cmd_index ~= -1 then
                    table.remove(startup_config, cmd_index)
                end

                input.holder:Destroy()
                config.Save()
            end)

            if cmd ~= nil then
                input:ChangeText(cmd)
            end
        end
        startup.Render = function()
            local window = gui_util.CreateWindow('root@kali: /terminal/startup')

            window.Position = UDim2.fromScale(0.453, 0.509)
            cache.startup_window = window

            gui_util.MakeWindowDraggable(window)

            local content_holder = gui_util.AddContentHolder(window)

            gui_util.SetContentEnv(content_holder)
            gui_util.AddSection('Set Startup Commands')
            gui_util.CreateButton('Add New Command', '+ Add New', startup.InitCommandInput)

            for _, cmd in ipairs(startup_config)do
                startup.InitCommandInput(cmd)
                task.spawn(terminal.ValidateCommand, cmd, 'startup')
            end
        end

        return startup
    end
end

if game.GameId ~= 324740177 then
    error('Deimos is a script for Entry Point only!')
end

local genv = getgenv()
local is_running = genv.deimos

if is_running == nil or is_running == false then
    genv.deimos = true
else
    error('Deimos is already running!')
end

local start_time = tick()
local gui_util = __DARKLUA_BUNDLE_MODULES.load('a')
local places = __DARKLUA_BUNDLE_MODULES.load('b')
local tools = __DARKLUA_BUNDLE_MODULES.load('d')

__DARKLUA_BUNDLE_MODULES.load('e')

local scr_settings = __DARKLUA_BUNDLE_MODULES.load('f')

scr_settings.Render()

if places.place_group == 'mission' then
    task.spawn(function()
        local esp_mgr = __DARKLUA_BUNDLE_MODULES.load('g')

        esp_mgr.AddNPCsESP()
        esp_mgr.AddCamsESP()
        esp_mgr.AddPlayersESP()
    end)

    local Level = game.Workspace:WaitForChild('Level')
    local Actors = Level:WaitForChild('Actors')
    local ms_data = __DARKLUA_BUNDLE_MODULES.load('i')

    if ms_data.current.objects_esp then
        task.spawn(ms_data.current.objects_esp)
    end

    local info_panel = __DARKLUA_BUNDLE_MODULES.load('j')

    info_panel.Render()

    local npc_mgr = __DARKLUA_BUNDLE_MODULES.load('k')

    for _, npc in ipairs(Actors:GetChildren())do
        task.spawn(npc_mgr.SortNPC, npc)
    end

    Actors.ChildAdded:Connect(npc_mgr.SortNPC)
    npc_mgr.TorsosNoclipLoop()
    tools.IncreaseSimulationRadius()

    local music = __DARKLUA_BUNDLE_MODULES.load('l')

    task.spawn(music.Render)
end
if places.place_group == 'lobby' then
    local lobby = __DARKLUA_BUNDLE_MODULES.load('m')

    task.spawn(lobby.Render)
end

local teleport = __DARKLUA_BUNDLE_MODULES.load('n')

task.spawn(teleport.Render)

local terminal = __DARKLUA_BUNDLE_MODULES.load('s')

task.spawn(terminal.Init)

local help = __DARKLUA_BUNDLE_MODULES.load('t')

task.spawn(help.Render)

local keybinds = __DARKLUA_BUNDLE_MODULES.load('u')

task.spawn(keybinds.Render)

local startup = __DARKLUA_BUNDLE_MODULES.load('v')

task.spawn(startup.Render)
gui_util.ScaleElements()
gui_util.gui_holder:GetPropertyChangedSignal('AbsoluteSize'):Connect(gui_util.ScaleElements)
queueonteleport(
[[loadstring(game:HttpGet("https://raw.githubusercontent.com/deimos-ep/deimos/refs/heads/main/compiled.luau"))()]])

local end_time = tools.RoundNumber(tick() - start_time, 4)

print('Deimos v2.0.0 successfully loaded in ~' .. tostring(end_time) .. 's (' .. tostring(tools.RoundNumber(end_time * 1000)) .. 'ms)')
