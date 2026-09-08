-- Generated using RoadToGlory's Converter v1.1 (RoadToGlory#9879)

-- Instances:

local Converted = {
	["_AHLoader"] = Instance.new("ScreenGui");
	["_TitleBar"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_Buttons"] = Instance.new("Frame");
	["_UICorner1"] = Instance.new("UICorner");
	["_Title"] = Instance.new("TextLabel");
	["_UICorner2"] = Instance.new("UICorner");
	["_Close"] = Instance.new("TextButton");
	["_UICorner3"] = Instance.new("UICorner");
	["_UIAspectRatioConstraint"] = Instance.new("UIAspectRatioConstraint");
	["_Unload"] = Instance.new("TextButton");
	["_UICorner4"] = Instance.new("UICorner");
	["_Hint"] = Instance.new("TextLabel");
	["_UICorner5"] = Instance.new("UICorner");
	["_Container"] = Instance.new("CanvasGroup");
	["_Background"] = Instance.new("ImageLabel");
	["_UICorner6"] = Instance.new("UICorner");
	["_Custom"] = Instance.new("TextBox");
	["_UICorner7"] = Instance.new("UICorner");
	["_LC"] = Instance.new("TextButton");
	["_UICorner8"] = Instance.new("UICorner");
	["_Main"] = Instance.new("TextButton");
	["_UICorner9"] = Instance.new("UICorner");
	["_PreRelease"] = Instance.new("TextButton");
	["_UICorner10"] = Instance.new("UICorner");
	["_MVersion"] = Instance.new("TextLabel");
	["_UICorner11"] = Instance.new("UICorner");
	["_PRVersion"] = Instance.new("TextLabel");
	["_UICorner12"] = Instance.new("UICorner");
	["_Debug"] = Instance.new("TextButton");
	["_UICorner13"] = Instance.new("UICorner");
	["_Newest"] = Instance.new("Folder");
	["_Main1"] = Instance.new("TextLabel");
	["_UICorner14"] = Instance.new("UICorner");
	["_PreRelease1"] = Instance.new("TextLabel");
	["_UICorner15"] = Instance.new("UICorner");
	["_Legacy"] = Instance.new("TextButton");
	["_UICorner16"] = Instance.new("UICorner");
	["_StartupMessage"] = Instance.new("TextLabel");
	["_UICorner17"] = Instance.new("UICorner");
	["_History"] = Instance.new("CanvasGroup");
	["_Background1"] = Instance.new("ImageLabel");
	["_UICorner18"] = Instance.new("UICorner");
	["_Scroll"] = Instance.new("ScrollingFrame");
	["_UIListLayout"] = Instance.new("UIListLayout");
	["_Template"] = Instance.new("Frame");
	["_Container1"] = Instance.new("Frame");
	["_Version"] = Instance.new("TextButton");
	["_Info"] = Instance.new("TextLabel");
	["_Get"] = Instance.new("StringValue");
	["_Return"] = Instance.new("TextButton");
	["_UICorner19"] = Instance.new("UICorner");
	["_Cover"] = Instance.new("Frame");
	["_Loading"] = Instance.new("TextLabel");
	["_Drag"] = Instance.new("UIDragDetector");
}

-- Properties:

Converted["_AHLoader"].IgnoreGuiInset = true
Converted["_AHLoader"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_AHLoader"].ResetOnSpawn = false
Converted["_AHLoader"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_AHLoader"].Name = "AHLoader"
Converted["_AHLoader"].Parent = nil

Converted["_TitleBar"].Active = true
Converted["_TitleBar"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_TitleBar"].BackgroundColor3 = Color3.fromRGB(30.00000011175871, 31.000000052154064, 34.00000177323818)
Converted["_TitleBar"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_TitleBar"].BorderSizePixel = 0
Converted["_TitleBar"].Position = UDim2.new(0.5, 0, 0.300000012, 0)
Converted["_TitleBar"].Size = UDim2.new(0.5, 0, 0.0500000007, 0)
Converted["_TitleBar"].Name = "TitleBar"
Converted["_TitleBar"].Parent = Converted["_AHLoader"]

Converted["_UICorner"].CornerRadius = UDim.new(0.0149999997, 0)
Converted["_UICorner"].Parent = Converted["_TitleBar"]

Converted["_Buttons"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Buttons"].BackgroundColor3 = Color3.fromRGB(30.00000011175871, 31.000000052154064, 34.00000177323818)
Converted["_Buttons"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Buttons"].BorderSizePixel = 0
Converted["_Buttons"].Position = UDim2.new(0.5, 0, 0.545000017, 0)
Converted["_Buttons"].Size = UDim2.new(1, 0, 1.10000002, 0)
Converted["_Buttons"].ZIndex = 2
Converted["_Buttons"].Name = "Buttons"
Converted["_Buttons"].Parent = Converted["_TitleBar"]

Converted["_UICorner1"].CornerRadius = UDim.new(0.0149999997, 0)
Converted["_UICorner1"].Parent = Converted["_Buttons"]

Converted["_Title"].Font = Enum.Font.Sarpanch
Converted["_Title"].Text = "AntiHub Loader"
Converted["_Title"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Title"].TextScaled = true
Converted["_Title"].TextSize = 14
Converted["_Title"].TextWrapped = true
Converted["_Title"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Title"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Title"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Title"].BorderSizePixel = 0
Converted["_Title"].Position = UDim2.new(0.174999997, 0, 0.5, 0)
Converted["_Title"].Size = UDim2.new(0.300000012, 0, 0.800000012, 0)
Converted["_Title"].Name = "Title"
Converted["_Title"].Parent = Converted["_Buttons"]

Converted["_UICorner2"].CornerRadius = UDim.new(0.125, 0)
Converted["_UICorner2"].Parent = Converted["_Title"]

Converted["_Close"].Font = Enum.Font.Nunito
Converted["_Close"].Text = "X"
Converted["_Close"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Close"].TextScaled = true
Converted["_Close"].TextSize = 14
Converted["_Close"].TextWrapped = true
Converted["_Close"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Close"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Close"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Close"].BorderSizePixel = 0
Converted["_Close"].Position = UDim2.new(0.949999988, 0, 0.5, 0)
Converted["_Close"].Size = UDim2.new(0.0500000007, 0, 0.800000012, 0)
Converted["_Close"].Name = "Close"
Converted["_Close"].Parent = Converted["_Buttons"]

Converted["_UICorner3"].CornerRadius = UDim.new(0.125, 0)
Converted["_UICorner3"].Parent = Converted["_Close"]

Converted["_UIAspectRatioConstraint"].AspectRatio = 0.9862900972366333
Converted["_UIAspectRatioConstraint"].Parent = Converted["_Close"]

Converted["_Unload"].Font = Enum.Font.Nunito
Converted["_Unload"].Text = "Unload"
Converted["_Unload"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Unload"].TextScaled = true
Converted["_Unload"].TextSize = 14
Converted["_Unload"].TextWrapped = true
Converted["_Unload"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Unload"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Unload"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Unload"].BorderSizePixel = 0
Converted["_Unload"].Position = UDim2.new(0.625, 0, 0.75, 0)
Converted["_Unload"].Size = UDim2.new(0.100000001, 0, 0.25, 0)
Converted["_Unload"].Name = "Unload"
Converted["_Unload"].Parent = Converted["_Buttons"]

Converted["_UICorner4"].CornerRadius = UDim.new(0.125, 0)
Converted["_UICorner4"].Parent = Converted["_Unload"]

Converted["_Hint"].Font = Enum.Font.Sarpanch
Converted["_Hint"].Text = "Right Alt/Re-Execute"
Converted["_Hint"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Hint"].TextScaled = true
Converted["_Hint"].TextSize = 14
Converted["_Hint"].TextWrapped = true
Converted["_Hint"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Hint"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Hint"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Hint"].BorderSizePixel = 0
Converted["_Hint"].Position = UDim2.new(0.449999988, 0, 0.75, 0)
Converted["_Hint"].Size = UDim2.new(0.224999994, 0, 0.300000012, 0)
Converted["_Hint"].Name = "Hint"
Converted["_Hint"].Parent = Converted["_Buttons"]

Converted["_UICorner5"].CornerRadius = UDim.new(0.125, 0)
Converted["_UICorner5"].Parent = Converted["_Hint"]

Converted["_Container"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Container"].BackgroundColor3 = Color3.fromRGB(49.00000087916851, 51.00000075995922, 56.000000461936)
Converted["_Container"].BackgroundTransparency = 1
Converted["_Container"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Container"].BorderSizePixel = 0
Converted["_Container"].Position = UDim2.new(0.5, 0, 4.69999981, 0)
Converted["_Container"].Size = UDim2.new(1, 0, 9.39500141, 0)
Converted["_Container"].ZIndex = 0
Converted["_Container"].Name = "Container"
Converted["_Container"].Parent = Converted["_TitleBar"]

Converted["_Background"].ImageTransparency = 0.25
Converted["_Background"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Background"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Background"].BackgroundTransparency = 1
Converted["_Background"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Background"].BorderSizePixel = 0
Converted["_Background"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Background"].Size = UDim2.new(2, 0, 2, 0)
Converted["_Background"].ZIndex = -1
Converted["_Background"].Name = "Background"
Converted["_Background"].Parent = Converted["_Container"]

Converted["_UICorner6"].CornerRadius = UDim.new(0.0199999996, 0)
Converted["_UICorner6"].Parent = Converted["_Container"]

Converted["_Custom"].Font = Enum.Font.Ubuntu
Converted["_Custom"].PlaceholderText = "Custom URL"
Converted["_Custom"].Text = ""
Converted["_Custom"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Custom"].TextScaled = true
Converted["_Custom"].TextSize = 16
Converted["_Custom"].TextWrapped = true
Converted["_Custom"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Custom"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Custom"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Custom"].BackgroundTransparency = 0.5
Converted["_Custom"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Custom"].BorderSizePixel = 0
Converted["_Custom"].Position = UDim2.new(0.5, 0, 0.899999976, 0)
Converted["_Custom"].Size = UDim2.new(0.75, 0, 0.125, 0)
Converted["_Custom"].Name = "Custom"
Converted["_Custom"].Parent = Converted["_Container"]

Converted["_UICorner7"].CornerRadius = UDim.new(0.100000001, 0)
Converted["_UICorner7"].Parent = Converted["_Custom"]

Converted["_LC"].Font = Enum.Font.TitilliumWeb
Converted["_LC"].Text = "Load Custom"
Converted["_LC"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_LC"].TextScaled = true
Converted["_LC"].TextSize = 14
Converted["_LC"].TextWrapped = true
Converted["_LC"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_LC"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_LC"].BackgroundTransparency = 0.5
Converted["_LC"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_LC"].BorderSizePixel = 0
Converted["_LC"].Position = UDim2.new(0.5, 0, 0.774999976, 0)
Converted["_LC"].Size = UDim2.new(0.5, 0, 0.075000003, 0)
Converted["_LC"].Name = "LC"
Converted["_LC"].Parent = Converted["_Container"]

Converted["_UICorner8"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner8"].Parent = Converted["_LC"]

Converted["_Main"].Font = Enum.Font.TitilliumWeb
Converted["_Main"].Text = "Main"
Converted["_Main"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Main"].TextScaled = true
Converted["_Main"].TextSize = 14
Converted["_Main"].TextWrapped = true
Converted["_Main"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Main"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Main"].BackgroundTransparency = 0.5
Converted["_Main"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Main"].BorderSizePixel = 0
Converted["_Main"].Position = UDim2.new(0.25, 0, 0.349999994, 0)
Converted["_Main"].Size = UDim2.new(0.349999994, 0, 0.150000006, 0)
Converted["_Main"].Name = "Main"
Converted["_Main"].Parent = Converted["_Container"]

Converted["_UICorner9"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner9"].Parent = Converted["_Main"]

Converted["_PreRelease"].Font = Enum.Font.TitilliumWeb
Converted["_PreRelease"].Text = "PreRelease"
Converted["_PreRelease"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_PreRelease"].TextScaled = true
Converted["_PreRelease"].TextSize = 14
Converted["_PreRelease"].TextWrapped = true
Converted["_PreRelease"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_PreRelease"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_PreRelease"].BackgroundTransparency = 0.5
Converted["_PreRelease"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_PreRelease"].BorderSizePixel = 0
Converted["_PreRelease"].Position = UDim2.new(0.75, 0, 0.349999994, 0)
Converted["_PreRelease"].Size = UDim2.new(0.349999994, 0, 0.150000006, 0)
Converted["_PreRelease"].Name = "PreRelease"
Converted["_PreRelease"].Parent = Converted["_Container"]

Converted["_UICorner10"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner10"].Parent = Converted["_PreRelease"]

Converted["_MVersion"].Font = Enum.Font.TitilliumWeb
Converted["_MVersion"].Text = "Main Version"
Converted["_MVersion"].TextColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546)
Converted["_MVersion"].TextScaled = true
Converted["_MVersion"].TextSize = 14
Converted["_MVersion"].TextWrapped = true
Converted["_MVersion"].Active = true
Converted["_MVersion"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_MVersion"].BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
Converted["_MVersion"].BackgroundTransparency = 0.5
Converted["_MVersion"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_MVersion"].BorderSizePixel = 0
Converted["_MVersion"].Position = UDim2.new(0.25, 0, 0.5, 0)
Converted["_MVersion"].Selectable = true
Converted["_MVersion"].Size = UDim2.new(0.25, 0, 0.100000001, 0)
Converted["_MVersion"].Name = "MVersion"
Converted["_MVersion"].Parent = Converted["_Container"]

Converted["_UICorner11"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner11"].Parent = Converted["_MVersion"]

Converted["_PRVersion"].Font = Enum.Font.TitilliumWeb
Converted["_PRVersion"].Text = "PreRelease Version"
Converted["_PRVersion"].TextColor3 = Color3.fromRGB(200.00000327825546, 200.00000327825546, 200.00000327825546)
Converted["_PRVersion"].TextScaled = true
Converted["_PRVersion"].TextSize = 14
Converted["_PRVersion"].TextWrapped = true
Converted["_PRVersion"].Active = true
Converted["_PRVersion"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_PRVersion"].BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
Converted["_PRVersion"].BackgroundTransparency = 0.5
Converted["_PRVersion"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_PRVersion"].BorderSizePixel = 0
Converted["_PRVersion"].Position = UDim2.new(0.75, 0, 0.5, 0)
Converted["_PRVersion"].Selectable = true
Converted["_PRVersion"].Size = UDim2.new(0.25, 0, 0.100000001, 0)
Converted["_PRVersion"].Name = "PRVersion"
Converted["_PRVersion"].Parent = Converted["_Container"]

Converted["_UICorner12"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner12"].Parent = Converted["_PRVersion"]

Converted["_Debug"].Font = Enum.Font.TitilliumWeb
Converted["_Debug"].Text = "Debug Disabled"
Converted["_Debug"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Debug"].TextScaled = true
Converted["_Debug"].TextSize = 14
Converted["_Debug"].TextWrapped = true
Converted["_Debug"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Debug"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Debug"].BackgroundTransparency = 0.5
Converted["_Debug"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Debug"].BorderSizePixel = 0
Converted["_Debug"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Debug"].Size = UDim2.new(0.174999997, 0, 0.075000003, 0)
Converted["_Debug"].Name = "Debug"
Converted["_Debug"].Parent = Converted["_Container"]

Converted["_UICorner13"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner13"].Parent = Converted["_Debug"]

Converted["_Newest"].Name = "Newest"
Converted["_Newest"].Parent = Converted["_Container"]

Converted["_Main1"].Font = Enum.Font.TitilliumWeb
Converted["_Main1"].Text = "Newest Version"
Converted["_Main1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Main1"].TextScaled = true
Converted["_Main1"].TextSize = 14
Converted["_Main1"].TextWrapped = true
Converted["_Main1"].Active = true
Converted["_Main1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Main1"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 80.00000283122063, 40.00000141561031)
Converted["_Main1"].BackgroundTransparency = 0.5
Converted["_Main1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Main1"].BorderSizePixel = 0
Converted["_Main1"].Position = UDim2.new(0.25, 0, 0.200000003, 0)
Converted["_Main1"].Selectable = true
Converted["_Main1"].Size = UDim2.new(0.25, 0, 0.075000003, 0)
Converted["_Main1"].Visible = false
Converted["_Main1"].Name = "Main"
Converted["_Main1"].Parent = Converted["_Newest"]

Converted["_UICorner14"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner14"].Parent = Converted["_Main1"]

Converted["_PreRelease1"].Font = Enum.Font.TitilliumWeb
Converted["_PreRelease1"].Text = "Newest Version"
Converted["_PreRelease1"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_PreRelease1"].TextScaled = true
Converted["_PreRelease1"].TextSize = 14
Converted["_PreRelease1"].TextWrapped = true
Converted["_PreRelease1"].Active = true
Converted["_PreRelease1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_PreRelease1"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 80.00000283122063, 40.00000141561031)
Converted["_PreRelease1"].BackgroundTransparency = 0.5
Converted["_PreRelease1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_PreRelease1"].BorderSizePixel = 0
Converted["_PreRelease1"].Position = UDim2.new(0.75, 0, 0.200000003, 0)
Converted["_PreRelease1"].Selectable = true
Converted["_PreRelease1"].Size = UDim2.new(0.25, 0, 0.075000003, 0)
Converted["_PreRelease1"].Visible = false
Converted["_PreRelease1"].Name = "PreRelease"
Converted["_PreRelease1"].Parent = Converted["_Newest"]

Converted["_UICorner15"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner15"].Parent = Converted["_PreRelease1"]

Converted["_Legacy"].Font = Enum.Font.TitilliumWeb
Converted["_Legacy"].Text = "Legacy Versions"
Converted["_Legacy"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Legacy"].TextScaled = true
Converted["_Legacy"].TextSize = 14
Converted["_Legacy"].TextWrapped = true
Converted["_Legacy"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Legacy"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Legacy"].BackgroundTransparency = 0.5
Converted["_Legacy"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Legacy"].BorderSizePixel = 0
Converted["_Legacy"].Position = UDim2.new(0.5, 0, 0.200000003, 0)
Converted["_Legacy"].Size = UDim2.new(0.224999994, 0, 0.075000003, 0)
Converted["_Legacy"].Name = "Legacy"
Converted["_Legacy"].Parent = Converted["_Container"]

Converted["_UICorner16"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner16"].Parent = Converted["_Legacy"]

Converted["_StartupMessage"].Font = Enum.Font.TitilliumWeb
Converted["_StartupMessage"].Text = "nil"
Converted["_StartupMessage"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_StartupMessage"].TextScaled = true
Converted["_StartupMessage"].TextSize = 14
Converted["_StartupMessage"].TextWrapped = true
Converted["_StartupMessage"].Active = true
Converted["_StartupMessage"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_StartupMessage"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_StartupMessage"].BackgroundTransparency = 0.5
Converted["_StartupMessage"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_StartupMessage"].BorderSizePixel = 0
Converted["_StartupMessage"].Position = UDim2.new(0.5, 0, 0.625, 0)
Converted["_StartupMessage"].Selectable = true
Converted["_StartupMessage"].Size = UDim2.new(0.375, 0, 0.125, 0)
Converted["_StartupMessage"].Visible = false
Converted["_StartupMessage"].Name = "StartupMessage"
Converted["_StartupMessage"].Parent = Converted["_Container"]

Converted["_UICorner17"].CornerRadius = UDim.new(0.075000003, 0)
Converted["_UICorner17"].Parent = Converted["_StartupMessage"]

Converted["_History"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_History"].BackgroundColor3 = Color3.fromRGB(49.00000087916851, 51.00000075995922, 56.000000461936)
Converted["_History"].BackgroundTransparency = 1
Converted["_History"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_History"].BorderSizePixel = 0
Converted["_History"].Position = UDim2.new(0.5, 0, 4.69999981, 0)
Converted["_History"].Size = UDim2.new(1, 0, 9.39500141, 0)
Converted["_History"].Visible = false
Converted["_History"].ZIndex = 0
Converted["_History"].Name = "History"
Converted["_History"].Parent = Converted["_TitleBar"]

Converted["_Background1"].ImageTransparency = 0.25
Converted["_Background1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Background1"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Background1"].BackgroundTransparency = 1
Converted["_Background1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Background1"].BorderSizePixel = 0
Converted["_Background1"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Background1"].Size = UDim2.new(2, 0, 2, 0)
Converted["_Background1"].ZIndex = -1
Converted["_Background1"].Name = "Background"
Converted["_Background1"].Parent = Converted["_History"]

Converted["_UICorner18"].CornerRadius = UDim.new(0.0199999996, 0)
Converted["_UICorner18"].Parent = Converted["_History"]

Converted["_Scroll"].AutomaticCanvasSize = Enum.AutomaticSize.X
Converted["_Scroll"].CanvasSize = UDim2.new(1, 0, 0, 0)
Converted["_Scroll"].HorizontalScrollBarInset = Enum.ScrollBarInset.Always
Converted["_Scroll"].ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Scroll"].ScrollBarImageTransparency = 0.5
Converted["_Scroll"].ScrollBarThickness = 6
Converted["_Scroll"].ScrollingDirection = Enum.ScrollingDirection.X
Converted["_Scroll"].Active = true
Converted["_Scroll"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Scroll"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Scroll"].BackgroundTransparency = 0.5
Converted["_Scroll"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Scroll"].BorderSizePixel = 0
Converted["_Scroll"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Scroll"].Size = UDim2.new(0.899999976, 0, 0.725000024, 0)
Converted["_Scroll"].Name = "Scroll"
Converted["_Scroll"].Parent = Converted["_History"]

Converted["_UIListLayout"].FillDirection = Enum.FillDirection.Horizontal
Converted["_UIListLayout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_UIListLayout"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_UIListLayout"].Parent = Converted["_Scroll"]

Converted["_Template"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Template"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Template"].BackgroundTransparency = 1
Converted["_Template"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Template"].BorderSizePixel = 0
Converted["_Template"].Size = UDim2.new(0.375, 0, 1, 0)
Converted["_Template"].Visible = false
Converted["_Template"].Name = "Template"
Converted["_Template"].Parent = Converted["_History"]

Converted["_Container1"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Container1"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Container1"].BackgroundTransparency = 0.5
Converted["_Container1"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Container1"].BorderSizePixel = 0
Converted["_Container1"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Container1"].Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
Converted["_Container1"].Name = "Container"
Converted["_Container1"].Parent = Converted["_Template"]

Converted["_Version"].Font = Enum.Font.TitilliumWeb
Converted["_Version"].Text = "Version"
Converted["_Version"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Version"].TextScaled = true
Converted["_Version"].TextSize = 14
Converted["_Version"].TextWrapped = true
Converted["_Version"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Version"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Version"].BackgroundTransparency = 0.5
Converted["_Version"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Version"].BorderSizePixel = 0
Converted["_Version"].Position = UDim2.new(0.5, 0, 0.875, 0)
Converted["_Version"].Size = UDim2.new(1, 0, 0.25, 0)
Converted["_Version"].Name = "Version"
Converted["_Version"].Parent = Converted["_Container1"]

Converted["_Info"].Font = Enum.Font.TitilliumWeb
Converted["_Info"].Text = "Info"
Converted["_Info"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Info"].TextScaled = true
Converted["_Info"].TextSize = 14
Converted["_Info"].TextWrapped = true
Converted["_Info"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Info"].TextYAlignment = Enum.TextYAlignment.Top
Converted["_Info"].Active = true
Converted["_Info"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Info"].BackgroundColor3 = Color3.fromRGB(60.00000022351742, 60.00000022351742, 60.00000022351742)
Converted["_Info"].BackgroundTransparency = 0.5
Converted["_Info"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Info"].BorderSizePixel = 0
Converted["_Info"].Position = UDim2.new(0.5, 0, 0.375, 0)
Converted["_Info"].Selectable = true
Converted["_Info"].Size = UDim2.new(1, 0, 0.75, 0)
Converted["_Info"].Name = "Info"
Converted["_Info"].Parent = Converted["_Container1"]

Converted["_Get"].Name = "Get"
Converted["_Get"].Parent = Converted["_Template"]

Converted["_Return"].Font = Enum.Font.TitilliumWeb
Converted["_Return"].Text = "Return"
Converted["_Return"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Return"].TextScaled = true
Converted["_Return"].TextSize = 14
Converted["_Return"].TextWrapped = true
Converted["_Return"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Return"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Return"].BackgroundTransparency = 0.5
Converted["_Return"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Return"].BorderSizePixel = 0
Converted["_Return"].Position = UDim2.new(0.5, 0, 0.925000012, 0)
Converted["_Return"].Size = UDim2.new(0.25, 0, 0.075000003, 0)
Converted["_Return"].Name = "Return"
Converted["_Return"].Parent = Converted["_History"]

Converted["_UICorner19"].CornerRadius = UDim.new(0.150000006, 0)
Converted["_UICorner19"].Parent = Converted["_Return"]

Converted["_Cover"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Cover"].BackgroundColor3 = Color3.fromRGB(40.00000141561031, 40.00000141561031, 40.00000141561031)
Converted["_Cover"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Cover"].BorderSizePixel = 0
Converted["_Cover"].Position = UDim2.new(0.5, 0, 5.25, 0)
Converted["_Cover"].Size = UDim2.new(1, 0, 8.30000019, 0)
Converted["_Cover"].Visible = false
Converted["_Cover"].ZIndex = 5
Converted["_Cover"].Name = "Cover"
Converted["_Cover"].Parent = Converted["_TitleBar"]

Converted["_Loading"].Font = Enum.Font.SciFi
Converted["_Loading"].Text = "Loading..."
Converted["_Loading"].TextColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Loading"].TextScaled = true
Converted["_Loading"].TextSize = 14
Converted["_Loading"].TextWrapped = true
Converted["_Loading"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Loading"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Loading"].BackgroundTransparency = 1
Converted["_Loading"].BorderColor3 = Color3.fromRGB(0, 0, 0)
Converted["_Loading"].BorderSizePixel = 0
Converted["_Loading"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Loading"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Loading"].Name = "Loading"
Converted["_Loading"].Parent = Converted["_Cover"]

Converted["_Drag"].Name = "Drag"
Converted["_Drag"].Parent = Converted["_TitleBar"]

local Loader = Converted["_TitleBar"]
if not game:IsLoaded() then
	--repeat task.wait() until game:IsLoaded()
end

local GSPlayers = game:GetService("Players")

task.spawn(function()
	local Suc = pcall(function()
		Loader.Parent.Parent = gethui()
	end)
	if not Suc then
		Suc = pcall(function()
			Loader.Parent.Parent = game:GetService("CoreGui")
		end)
		if not Suc then
			Suc = pcall(function()
				Loader.Parent.Parent = GSPlayers.LocalPlayer.PlayerGui
			end)
		end
	end
end)

local GSTween = game:GetService("TweenService")
local GSUIP = game:GetService("UserInputService")
local GSHTTP = game:GetService("HttpService")
local GSGamepad = game:GetService("GamepadService")
local GSRS = game:GetService("RunService")
local GSGamepad = game:GetService("GamepadService")
local GSStarterGui = game:GetService("StarterGui")

local Mobile = GSUIP.TouchEnabled and not GSUIP.MouseEnabled

if not getgenv then
	if _G.AHGGV == nil then
		_G.AHGGV = {}
	end
	function getgenv()
		return _G.AHGGV
	end
end

if getgenv().AHLoader then
	warn("AntiHub Loader Already Loaded.")
	Loader:Destroy()
	getgenv().AHLUI.Size = UDim2.new(0.5, 0, 0.05, 0)
	getgenv().AHLUI.Position = UDim2.new(0.5, 0, 0.3, 0)
	getgenv().AHLUI.Visible = true
	GSGamepad:EnableGamepadCursor(getgenv().AHLUI)
	return
end

getgenv().AHLUI = Loader
getgenv().AHLoader = true

local RBXConnections = {}

Loader.Cover.Visible = true

local Versions = {["NewestScript"] = "Error", ["ScriptInfo"] = {["Main"] = "Error", ["PreRelease"] = "Error"}}
local function Notify(Text, Duration, Title)
	GSStarterGui:SetCore({["Title"] = Title, ["Text"] = Text, ["Duration"] = Duration})
end
pcall(function()
	Versions = game:HttpGet("https://raw.githubusercontent.com/J0BB0T/TNE/refs/heads/main/Assets/VersionList.json")
	Notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/J0BB0T/TNE/refs/heads/main/RealNotify.lua"))()("rbxassetid://110362083969529")
end)
Versions = GSHTTP:JSONDecode(Versions)
local Newest = Versions.NewestScript
Versions = Versions.ScriptInfo
pcall(function()
	Loader.Container.Background.Image = "rbxassetid://116157108386991"
	Loader.History.Background.Image = "rbxassetid://116157108386991"
end)
local Debug = false
local Open = false
local Waiting = false
Loader.Visible = false
Loader.Size = UDim2.new(0, 0, 0, 0)
Loader.Parent.Enabled = true

Loader.Container.MVersion.Text = Versions.Main
Loader.Container.PRVersion.Text = Versions.PreRelease

local StartupMessage = ""

pcall(function()
	StartupMessage = game:HttpGet("https://raw.githubusercontent.com/J0BB0T/TNE/refs/heads/main/Assets/StartupMessage.json")
	StartupMessage = GSHTTP:JSONDecode(StartupMessage).Loader
	if StartupMessage == "nil" then
		Loader.Container.StartupMessage.Visible = false
	else
		Loader.Container.StartupMessage.Text = StartupMessage
		Loader.Container.StartupMessage.Visible = true
	end
end)

Loader.Buttons.Close.Activated:Connect(function()
	GSGamepad:DisableGamepadCursor()
	GSTween:Create(Loader, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["Size"] = UDim2.new(0.5, 0, 0, 0)}):Play()
	Open = false
	task.wait(0.25)
	Loader.Visible = false
end)
Loader.Buttons.Unload.Activated:Connect(function()
	pcall(function()
		for i, v in RBXConnections do
			pcall(function()
				v:Disconnect()
			end)
		end
	end)
	GSGamepad:DisableGamepadCursor()
	getgenv().AHLUI = nil
	getgenv().AHLoader = false
	Converted["_AHLoader"]:Destroy()
end)

GSUIP.InputBegan:Connect(function(inp, proc)
	if proc then return end
	if inp.KeyCode == Enum.KeyCode.RightAlt or inp.KeyCode == Enum.KeyCode.RightMeta or inp.KeyCode == Enum.KeyCode.RightSuper then
		if Waiting then return end
		Waiting = true
		if Open then
			GSGamepad:DisableGamepadCursor()
			GSTween:Create(Loader, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["Size"] = UDim2.new(0.5, 0, 0, 0)}):Play()
			Open = false
			task.wait(0.25)
			Loader.Visible = false
			Waiting = false
		else
			GSGamepad:EnableGamepadCursor(Loader)
			Loader.Visible = true
			GSTween:Create(Loader, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["Size"] = UDim2.new(0.5, 0, 0.05, 0)}):Play()
			Open = true
			task.wait(0.25)
			Waiting = false
		end
	end
end)

local A = 0
table.insert(RBXConnections, GSRS.RenderStepped:Connect(function(DT)
	A += DT / 25
	Loader.Container.Background.Position = UDim2.new(0.5 + (math.cos(A) / 2), 0, 0.5 + (math.sin(A) / 2), 0)
	Loader.History.Background.Position = Loader.Container.Background.Position
end))

Loader.Container.Visible = true
Loader.History.Visible = false

Loader.Container.Legacy.Activated:Connect(function()
	if Waiting then return end
	Waiting = true
	Loader.Cover.BackgroundTransparency = 1
	Loader.Cover.Visible = true
	GSTween:Create(Loader.Cover, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["BackgroundTransparency"] = 0}):Play()
	task.wait(0.25)
	Loader.History.Visible = true
	Loader.Container.Visible = false
	task.wait(0.125)
	GSTween:Create(Loader.Cover, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["BackgroundTransparency"] = 1}):Play()
	task.wait(0.25)
	Loader.Cover.Visible = false
	Waiting = false
end)
Loader.History.Return.Activated:Connect(function()
	if Waiting then return end
	Waiting = true
	Loader.Cover.BackgroundTransparency = 1
	Loader.Cover.Visible = true
	GSTween:Create(Loader.Cover, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["BackgroundTransparency"] = 0}):Play()
	task.wait(0.25)
	Loader.History.Visible = false
	Loader.Container.Visible = true
	task.wait(0.125)
	GSTween:Create(Loader.Cover, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["BackgroundTransparency"] = 1}):Play()
	task.wait(0.25)
	Loader.Cover.Visible = false
	Waiting = false
end)

Loader.Container.Main.Activated:Connect(function()
	getgenv().AHDebug = Debug
	task.spawn(function()
		GSGamepad:DisableGamepadCursor()
		GSTween:Create(Loader, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["Size"] = UDim2.new(0.5, 0, 0, 0)}):Play()
		Open = false
		task.wait(0.25)
		Loader.Visible = false
	end)
	Notify("Running Main.", 3, "Loading")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/J0BB0T/TNE/refs/heads/main/AntiHub.lua"))()
end)
Loader.Container.PreRelease.Activated:Connect(function()
	getgenv().AHDebug = Debug
	task.spawn(function()
		GSGamepad:DisableGamepadCursor()
		GSTween:Create(Loader, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["Size"] = UDim2.new(0.5, 0, 0, 0)}):Play()
		Open = false
		task.wait(0.25)
		Loader.Visible = false
	end)
	Notify("Running PreRelease.", 3, "Loading")
	loadstring(game:HttpGet("https://raw.githubusercontent.com/J0BB0T/TNE/refs/heads/main/AntiHubPre.lua"))()
end)
Loader.Container.LC.Activated:Connect(function()
	getgenv().AHDebug = Debug
	task.spawn(function()
		GSGamepad:DisableGamepadCursor()
		GSTween:Create(Loader, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["Size"] = UDim2.new(0.5, 0, 0, 0)}):Play()
		Open = false
		task.wait(0.25)
		Loader.Visible = false
	end)
	Notify("Running Custom.", 3, "Loading")
	loadstring(game:HttpGet(Loader.Container.Custom.Text))()
end)
Loader.Container.Debug.Activated:Connect(function()
	Debug = not Debug
	if Debug then
		Loader.Container.Debug.Text = "Debug Enabled"
	else
		Loader.Container.Debug.Text = "Debug Disabled"
	end
end)

pcall(function()
	local History = game:HttpGet("https://raw.githubusercontent.com/J0BB0T/TNE/refs/heads/main/Assets/VersionHistory.json")
	History = GSHTTP:JSONDecode(History)

	for i, v in History do
		pcall(function()
			local Clone = Loader.History.Template:Clone()
			Clone.Visible = true
			Clone.Parent = Loader.History.Scroll
			Clone.Name = tostring(v.Version)
			Clone:WaitForChild("Get").Value = v.URL
			Clone:WaitForChild("Container"):WaitForChild("Info").Text = v.Info
			Clone.Container:WaitForChild("Version").Text = "v".. tostring(v.Version)
			Clone.Container.Version.Activated:Connect(function()
				getgenv().AHDebug = Debug
				task.spawn(function()
					GSGamepad:DisableGamepadCursor()
					GSTween:Create(Loader, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {["Size"] = UDim2.new(0.5, 0, 0, 0)}):Play()
					Open = false
					task.wait(0.25)
					Loader.Visible = false
				end)
				Notify("Running v".. tostring(v.Version).. ".", 3, "Loading")
				loadstring(game:HttpGet(Clone.Get.Value))()
			end)
		end)
	end
end)

pcall(function()
	Loader.Container.Newest[Newest].Visible = true
end)

Loader.Cover.Visible = false
Loader.Cover.Loading:Destroy()

if Mobile then
	Notify("Re-execute To Open If Closed.", 5, "Loaded")
	Loader.Visible = true
	Loader.Size = UDim2.new(0.5, 0, 0.05, 0)
else
	Notify("RightAlt To Open.", 5, "Loaded")
end

Loader.Visible = true
Loader.Size = UDim2.new(0.5, 0, 0.05, 0)

GSGamepad:EnableGamepadCursor(Loader)
