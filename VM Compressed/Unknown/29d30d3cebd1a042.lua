local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local screenGui = Instance.new("ScreenGui", CoreGui)
screenGui.Name = "legitui"
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

CollectionService:AddTag(screenGui, "main")

local title = Instance.new("TextLabel", screenGui)
title.BorderSizePixel = 0
title.TextSize = 18
title.TextXAlignment = Enum.TextXAlignment.Left
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.FontFace = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Size = UDim2.new(0.27903, 0, 0.08488, 0)
title.BorderColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "    THE HEAVENLY LEGIT UI"
title.Name = "title"
title.Position = UDim2.new(0.37123, 0, 0.12449, 0)

local titleTextStroke = Instance.new("UIStroke", title)
titleTextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
titleTextStroke.Color = Color3.fromRGB(0, 0, 0)
titleTextStroke.Thickness = 2

local titleStroke = Instance.new("UIStroke", title)
titleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
titleStroke.Color = Color3.fromRGB(255, 255, 0)
titleStroke.Thickness = 2

local toggleButton = Instance.new("TextButton", title)
toggleButton.BorderSizePixel = 0
toggleButton.TextSize = 18
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Size = UDim2.new(0.12174, 0, 1, 0)
toggleButton.Text = "-"
toggleButton.Position = UDim2.new(0.87826, 0, 0, 0)

local toggleTextStroke = Instance.new("UIStroke", toggleButton)
toggleTextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
toggleTextStroke.Color = Color3.fromRGB(0, 0, 0)
toggleTextStroke.Thickness = 2

local toggleStroke = Instance.new("UIStroke", toggleButton)
toggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
toggleStroke.Color = Color3.fromRGB(255, 255, 0)
toggleStroke.Thickness = 2

local frame = Instance.new("Frame", title)
frame.BorderSizePixel = 0
frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
frame.Size = UDim2.new(1, 0, 8, 0)
frame.Position = UDim2.new(0, 0, 1, 0)

local frameStroke = Instance.new("UIStroke", frame)
frameStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
frameStroke.Color = Color3.fromRGB(255, 255, 0)
frameStroke.Thickness = 2

local vibrantColorsButton = Instance.new("TextButton", frame)
vibrantColorsButton.BorderSizePixel = 0
vibrantColorsButton.TextSize = 36
vibrantColorsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
vibrantColorsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
vibrantColorsButton.FontFace = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
vibrantColorsButton.Size = UDim2.new(0.8087, 0, 0.16667, 0)
vibrantColorsButton.Text = "Vibrant Colors"
vibrantColorsButton.Position = UDim2.new(0.09565, 0, 0.05, 0)

local vibrantTextStroke = Instance.new("UIStroke", vibrantColorsButton)
vibrantTextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
vibrantTextStroke.Color = Color3.fromRGB(0, 0, 0)
vibrantTextStroke.Thickness = 2

local vibrantStroke = Instance.new("UIStroke", vibrantColorsButton)
vibrantStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
vibrantStroke.Color = Color3.fromRGB(255, 255, 0)
vibrantStroke.Thickness = 2

local stretchedResButton = Instance.new("TextButton", frame)
stretchedResButton.BorderSizePixel = 0
stretchedResButton.TextSize = 36
stretchedResButton.TextColor3 = Color3.fromRGB(255, 255, 255)
stretchedResButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
stretchedResButton.FontFace = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
stretchedResButton.Size = UDim2.new(0.8087, 0, 0.16667, 0)
stretchedResButton.Text = "Stretched Res"
stretchedResButton.Position = UDim2.new(0.09565, 0, 0.275, 0)

local stretchedTextStroke = Instance.new("UIStroke", stretchedResButton)
stretchedTextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
stretchedTextStroke.Color = Color3.fromRGB(0, 0, 0)
stretchedTextStroke.Thickness = 2

local stretchedStroke = Instance.new("UIStroke", stretchedResButton)
stretchedStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stretchedStroke.Color = Color3.fromRGB(255, 255, 0)
stretchedStroke.Thickness = 2

local uncapFpsButton = Instance.new("TextButton", frame)
uncapFpsButton.BorderSizePixel = 0
uncapFpsButton.TextSize = 36
uncapFpsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
uncapFpsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
uncapFpsButton.FontFace = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
uncapFpsButton.Size = UDim2.new(0.8087, 0, 0.16667, 0)
uncapFpsButton.Text = "Uncap FPS"
uncapFpsButton.Position = UDim2.new(0.09565, 0, 0.5, 0)

local uncapTextStroke = Instance.new("UIStroke", uncapFpsButton)
uncapTextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
uncapTextStroke.Color = Color3.fromRGB(0, 0, 0)
uncapTextStroke.Thickness = 2

local uncapStroke = Instance.new("UIStroke", uncapFpsButton)
uncapStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
uncapStroke.Color = Color3.fromRGB(255, 255, 0)
uncapStroke.Thickness = 2

local removeTexturesButton = Instance.new("TextButton", frame)
removeTexturesButton.BorderSizePixel = 0
removeTexturesButton.TextSize = 36
removeTexturesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
removeTexturesButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
removeTexturesButton.FontFace = Font.new("rbxasset://fonts/families/PatrickHand.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
removeTexturesButton.Size = UDim2.new(0.8087, 0, 0.16667, 0)
removeTexturesButton.Text = "Remove Textures"
removeTexturesButton.Position = UDim2.new(0.09565, 0, 0.73333, 0)

local removeTexturesTextStroke = Instance.new("UIStroke", removeTexturesButton)
removeTexturesTextStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
removeTexturesTextStroke.Color = Color3.fromRGB(0, 0, 0)
removeTexturesTextStroke.Thickness = 2

local removeTexturesStroke = Instance.new("UIStroke", removeTexturesButton)
removeTexturesStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
removeTexturesStroke.Color = Color3.fromRGB(255, 255, 0)
removeTexturesStroke.Thickness = 2

local isVisible = true
local dragging = false
local dragStart = nil
local startPos = nil

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = title.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        title.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        title.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

toggleButton.MouseButton1Click:Connect(function()
    isVisible = not isVisible
    frame.Visible = isVisible
    toggleButton.Text = isVisible and "-" or "+"
end)

vibrantColorsButton.MouseButton1Click:Connect(function()
    local l = game:GetService("Lighting")
    local rs = game:GetService("RunService")

    local function enhance()
        l.Brightness = 1.1
        l.ColorShift_Bottom = Color3.fromRGB(160,90,160)
        l.ColorShift_Top = Color3.fromRGB(160,160,90)
        l.OutdoorAmbient = Color3.fromRGB(120,120,160)
        l.Ambient = Color3.fromRGB(160,120,120)
        l.FogColor = Color3.fromRGB(160,110,160)
        l.ShadowColor = Color3.fromRGB(70,160,70)
        
        if l:FindFirstChild("Atmosphere") then
            local a = l.Atmosphere
            a.Density = 0.1
            a.Offset = 0.1
            a.Color = Color3.fromRGB(160,120,160)
            a.Decay = Color3.fromRGB(160,160,90)
            a.Glare = 0.2
            a.Haze = 0.4
        end
        
        if l:FindFirstChild("ColorCorrection") then
            local cc = l.ColorCorrection
            cc.Brightness = 0.1
            cc.Contrast = 0.25
            cc.Saturation = 1.2
            cc.TintColor = Color3.fromRGB(215,210,215)
        else
            local cc = Instance.new("ColorCorrectionEffect")
            cc.Parent = l
            cc.Brightness = 0.1
            cc.Contrast = 0.25
            cc.Saturation = 1.2
            cc.TintColor = Color3.fromRGB(215,210,215)
        end
    end

    enhance()

    local conn = rs.Heartbeat:Connect(function()
        if l.Brightness ~= 1.1 then
            enhance()
        end
        
        local cc = l:FindFirstChild("ColorCorrection")
        if not cc then
            enhance()
        end
    end)
end)

stretchedResButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Stretched-Resolution-Higher-FOV-48170"))()
end)

uncapFpsButton.MouseButton1Click:Connect(function()
    setfpscap(99999)
    spawn(function()
        while true do
            setfpscap(99999)
            wait(1)
        end
    end)
end)

removeTexturesButton.MouseButton1Click:Connect(function()
    local function rmvtex(obj)
        for _, v in pairs(obj:GetDescendants()) do
            if v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            elseif v:IsA("BasePart") then
                if v.Material ~= Enum.Material.Neon then
                    v.Material = Enum.Material.SmoothPlastic
                end
                v.TopSurface = Enum.SurfaceType.Smooth
                v.BottomSurface = Enum.SurfaceType.Smooth
            elseif v:IsA("MeshPart") then
                v.Material = Enum.Material.SmoothPlastic
            end
        end
    end
    
    rmvtex(workspace)
    
    workspace.ChildAdded:Connect(rmvtex)
    workspace.DescendantAdded:Connect(function(obj)
        if obj:IsA("Decal") or obj:IsA("Texture") then
            obj:Destroy()
        elseif obj:IsA("BasePart") then
            if obj.Material ~= Enum.Material.Neon then
                obj.Material = Enum.Material.SmoothPlastic
            end
            obj.TopSurface = Enum.SurfaceType.Smooth
            obj.BottomSurface = Enum.SurfaceType.Smooth
        elseif obj:IsA("MeshPart") then
            obj.Material = Enum.Material.SmoothPlastic
        end
    end)
    
    local terrain = workspace:FindFirstChild("Terrain")
    if terrain then
        terrain.WaterReflectance = 0
        terrain.WaterTransparency = 0
        terrain.WaterWaveSize = 0
        terrain.WaterWaveSpeed = 0
    end
end)
