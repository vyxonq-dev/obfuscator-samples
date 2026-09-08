-- Baselined
--[[
    A comprehensive, Material Design 3 inspired UI library for Roblox with theming, animations, and an extensive component system.
    by Bases (@fyandevelopers on Roblox)

    Version 2.9
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fiangg20/nox/refs/heads/main/baselined-assets/comp/source.luau"))()
]]

local BaselinedLibrary = {}
local tw = game:GetService("TweenService")
local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local plrs = game:GetService("Players")
local cg = game:GetService("CoreGui")
local http = game:GetService("HttpService")

local folderName = "BaselinedAssets"
local jsonName = "basefont.json"
local ttfName = "basefont.ttf"
local fontUrl = "https://github.com/fiangg20/nox/raw/refs/heads/main/baselined-assets/fonts/font.ttf"

local function getDefaultAvatar()
    local success, player = pcall(function()
        return plrs.LocalPlayer
    end)

    if success and player and typeof(player.UserId) == "number" then
        return "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=48&h=48"
    end

    return ""
end

if not isfolder(folderName) then makefolder(folderName) end

if not isfile(folderName .. "/" .. ttfName) then
    writefile(folderName .. "/" .. ttfName, game:HttpGet(fontUrl))
end
local assetURL = getcustomasset(folderName .. "/" .. ttfName)
local fontJsonData = {
    name = "CustomFamily_Basefont",
    faces = {{ name = "Regular", weight = 400, style = "normal", assetId = assetURL }}
}
local pathJSON = folderName .. "/" .. jsonName
writefile(pathJSON, http:JSONEncode(fontJsonData))
local m3Font = Font.new(getcustomasset(pathJSON))

local iconTtfName = "MaterialIconsNew.ttf"
local iconJsonName = "materialiconsnew.json"
local iconFontUrl = "https://github.com/google/material-design-icons/raw/refs/heads/master/font/MaterialIcons-Regular.ttf" 

if not isfile(folderName .. "/" .. iconTtfName) then
    writefile(folderName .. "/" .. iconTtfName, game:HttpGet(iconFontUrl))
end
local iconAssetURL = getcustomasset(folderName .. "/" .. iconTtfName)
local iconFontJsonData = { name = "MaterialIcons", faces = {{ name = "Regular", weight = 400, style = "normal", assetId = iconAssetURL }} }
local iconPathJSON = folderName .. "/" .. iconJsonName
writefile(iconPathJSON, http:JSONEncode(iconFontJsonData))

local iconFontFilled = Font.new(getcustomasset(iconPathJSON))

local iconOutOtfName = "MaterialIconsOutlinedNew.otf"
local iconOutJsonName = "materialiconsoutlinednew.json"
local iconOutFontUrl = "https://github.com/google/material-design-icons/raw/refs/heads/master/font/MaterialIconsOutlined-Regular.otf" 

if not isfile(folderName .. "/" .. iconOutOtfName) then
    writefile(folderName .. "/" .. iconOutOtfName, game:HttpGet(iconOutFontUrl))
end
local iconOutAssetURL = getcustomasset(folderName .. "/" .. iconOutOtfName)
local iconOutJsonData = { name = "MaterialIconsOutlined", faces = {{ name = "Regular", weight = 400, style = "normal", assetId = iconOutAssetURL }} }
local iconOutPathJSON = folderName .. "/" .. iconOutJsonName
writefile(iconOutPathJSON, http:JSONEncode(iconOutJsonData))

local iconFontOutlined = Font.new(getcustomasset(iconOutPathJSON))

local internalIconMap = {
    ["x"] = "close",
    ["minimize"] = "remove",
    ["maximize"] = "crop_square",
    ["search"] = "search",
    ["chevron-down"] = "arrow_drop_down",
    ["circle-x"] = "cancel"
}

local function parseIcon(iconStr)
    if not iconStr or iconStr == "" then return nil end
    if string.find(iconStr, "rbxassetid://") or string.find(iconStr, "rbxasset://") then
        return {type = "image", val = iconStr}
    end
    
    local finalStr = internalIconMap[iconStr] or iconStr
    return {type = "font", val = finalStr}
end

local function createIconObj(parent, iconStr, size, pos, anchor, isBtn)
    local parsed = parseIcon(iconStr)
    if not parsed then return nil end

    local obj
    if isBtn then
        obj = Instance.new(parsed.type == "image" and "ImageButton" or "TextButton", parent)
        if parsed.type == "image" then 
            obj.Image = parsed.val 
        else 
            obj.Text = parsed.val 
            obj.FontFace = iconFontFilled
            obj.TextScaled = true 
        end
    else
        obj = Instance.new(parsed.type == "image" and "ImageLabel" or "TextLabel", parent)
        if parsed.type == "image" then 
            obj.Image = parsed.val 
        else 
            obj.Text = parsed.val 
            obj.FontFace = iconFontFilled
            obj.TextScaled = true 
        end
    end

    obj.BackgroundTransparency = 1
    if size then obj.Size = size end
    if pos then obj.Position = pos end
    if anchor then obj.AnchorPoint = anchor end

    return obj, parsed.type
end

local function setIconColor(obj, color, duration)
    if not obj then return end
    local prop = (obj:IsA("ImageLabel") or obj:IsA("ImageButton")) and "ImageColor3" or "TextColor3"
    if duration then t(obj, prop, color, duration) else obj[prop] = color end
end

local function setIconPosition(obj, pos, duration)
    if not obj then return end
    local prop = (obj:IsA("ImageLabel") or obj:IsA("ImageButton")) and "Position" or "Position"
    if duration then t(obj, prop, pos, duration) else obj[prop] = pos end
end

local function setIconTrans(obj, trans, duration)
    if not obj then return end
    local prop = (obj:IsA("ImageLabel") or obj:IsA("ImageButton")) and "ImageTransparency" or "TextTransparency"
    if duration then t(obj, prop, trans, duration) else obj[prop] = trans end
end


local cp = {
    ["DefaultDark"] = {bg=Color3.fromRGB(0,0,0), fg=Color3.fromRGB(230,225,229), pri=Color3.fromRGB(208,188,255), onpri=Color3.fromRGB(56,30,114), inact=Color3.fromRGB(28,28,30), out=Color3.fromRGB(147,143,153)},
    ["DefaultLight"] = {bg=Color3.fromRGB(255,255,255), fg=Color3.fromRGB(28,27,31), pri=Color3.fromRGB(103,80,164), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(244,239,244), out=Color3.fromRGB(121,116,126)},
    
    ["MonochromeDark"] = {bg=Color3.fromRGB(14,14,14), fg=Color3.fromRGB(227,227,227), pri=Color3.fromRGB(200,200,200), onpri=Color3.fromRGB(24,24,24), inact=Color3.fromRGB(32,32,32), out=Color3.fromRGB(130,130,130)},
    ["MonochromeLight"] = {bg=Color3.fromRGB(255,255,255), fg=Color3.fromRGB(24,24,24), pri=Color3.fromRGB(90,90,90), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(235,235,235), out=Color3.fromRGB(115,115,115)},

    ["PurpleDark"] = {bg=Color3.fromRGB(28,27,31), fg=Color3.fromRGB(230,225,229), pri=Color3.fromRGB(208,188,255), onpri=Color3.fromRGB(56,30,114), inact=Color3.fromRGB(43,41,48), out=Color3.fromRGB(147,143,153)},
    ["PurpleLight"] = {bg=Color3.fromRGB(255,251,254), fg=Color3.fromRGB(28,27,31), pri=Color3.fromRGB(103,80,164), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(231,224,236), out=Color3.fromRGB(121,116,126)},

    ["BlueDark"] = {bg=Color3.fromRGB(26,28,30), fg=Color3.fromRGB(226,226,230), pri=Color3.fromRGB(162,201,255), onpri=Color3.fromRGB(0,50,90), inact=Color3.fromRGB(40,42,46), out=Color3.fromRGB(141,145,153)},
    ["BlueLight"] = {bg=Color3.fromRGB(253,252,255), fg=Color3.fromRGB(26,28,30), pri=Color3.fromRGB(0,98,162), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(223,226,235), out=Color3.fromRGB(115,119,127)},

    ["RedDark"] = {bg=Color3.fromRGB(32,26,25), fg=Color3.fromRGB(237,224,222), pri=Color3.fromRGB(255,180,168), onpri=Color3.fromRGB(105,0,5), inact=Color3.fromRGB(50,40,38), out=Color3.fromRGB(160,140,137)},
    ["RedLight"] = {bg=Color3.fromRGB(255,251,255), fg=Color3.fromRGB(32,26,25), pri=Color3.fromRGB(192,1,21), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(244,221,218), out=Color3.fromRGB(133,115,112)},

    ["GreenDark"] = {bg=Color3.fromRGB(26,28,25), fg=Color3.fromRGB(225,227,223), pri=Color3.fromRGB(143,215,135), onpri=Color3.fromRGB(0,57,10), inact=Color3.fromRGB(40,43,40), out=Color3.fromRGB(142,145,143)},
    ["GreenLight"] = {bg=Color3.fromRGB(252,253,246), fg=Color3.fromRGB(26,28,25), pri=Color3.fromRGB(42,106,37), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(222,229,216), out=Color3.fromRGB(114,121,113)},

    ["OrangeDark"] = {bg=Color3.fromRGB(32,27,24), fg=Color3.fromRGB(236,224,219), pri=Color3.fromRGB(255,183,123), onpri=Color3.fromRGB(76,38,0), inact=Color3.fromRGB(50,42,38), out=Color3.fromRGB(159,141,132)},
    ["OrangeLight"] = {bg=Color3.fromRGB(255,251,248), fg=Color3.fromRGB(32,27,24), pri=Color3.fromRGB(138,81,0), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(245,224,211), out=Color3.fromRGB(133,116,107)},

    ["PinkDark"] = {bg=Color3.fromRGB(31,26,29), fg=Color3.fromRGB(234,224,228), pri=Color3.fromRGB(255,176,201), onpri=Color3.fromRGB(94,17,51), inact=Color3.fromRGB(49,40,45), out=Color3.fromRGB(149,141,144)},
    ["PinkLight"] = {bg=Color3.fromRGB(255,251,253), fg=Color3.fromRGB(31,26,29), pri=Color3.fromRGB(143,74,103), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(244,221,228), out=Color3.fromRGB(133,114,119)},

    ["CyanDark"] = {bg=Color3.fromRGB(25,28,29), fg=Color3.fromRGB(225,227,227), pri=Color3.fromRGB(94,212,224), onpri=Color3.fromRGB(0,54,59), inact=Color3.fromRGB(38,42,43), out=Color3.fromRGB(137,147,148)},
    ["CyanLight"] = {bg=Color3.fromRGB(250,253,253), fg=Color3.fromRGB(25,28,29), pri=Color3.fromRGB(0,104,116), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(218,228,229), out=Color3.fromRGB(111,121,122)},

    ["YellowDark"] = {bg=Color3.fromRGB(29,27,22), fg=Color3.fromRGB(234,226,217), pri=Color3.fromRGB(232,196,104), onpri=Color3.fromRGB(65,45,0), inact=Color3.fromRGB(44,40,33), out=Color3.fromRGB(144,138,129)},
    ["YellowLight"] = {bg=Color3.fromRGB(255,251,243), fg=Color3.fromRGB(29,27,22), pri=Color3.fromRGB(122,89,0), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(239,228,211), out=Color3.fromRGB(126,118,105)},

    ["TealDark"] = {bg=Color3.fromRGB(25,28,28), fg=Color3.fromRGB(224,227,227), pri=Color3.fromRGB(83,219,211), onpri=Color3.fromRGB(0,55,52), inact=Color3.fromRGB(35,42,42), out=Color3.fromRGB(137,147,146)},
    ["TealLight"] = {bg=Color3.fromRGB(244,251,250), fg=Color3.fromRGB(25,28,28), pri=Color3.fromRGB(0,106,100), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(218,229,228), out=Color3.fromRGB(111,121,121)},

    ["IndigoDark"] = {bg=Color3.fromRGB(27,27,31), fg=Color3.fromRGB(228,226,230), pri=Color3.fromRGB(186,195,255), onpri=Color3.fromRGB(20,41,118), inact=Color3.fromRGB(41,42,48), out=Color3.fromRGB(142,144,153)},
    ["IndigoLight"] = {bg=Color3.fromRGB(253,252,255), fg=Color3.fromRGB(27,27,31), pri=Color3.fromRGB(67,89,169), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(223,225,235), out=Color3.fromRGB(117,119,128)},

    ["BrownDark"] = {bg=Color3.fromRGB(31,26,24), fg=Color3.fromRGB(235,224,221), pri=Color3.fromRGB(255,181,154), onpri=Color3.fromRGB(92,27,3), inact=Color3.fromRGB(48,40,37), out=Color3.fromRGB(156,140,136)},
    ["BrownLight"] = {bg=Color3.fromRGB(255,251,249), fg=Color3.fromRGB(31,26,24), pri=Color3.fromRGB(156,66,33), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(245,222,216), out=Color3.fromRGB(133,115,110)},

    ["LimeDark"] = {bg=Color3.fromRGB(27,28,24), fg=Color3.fromRGB(227,227,221), pri=Color3.fromRGB(186,204,112), onpri=Color3.fromRGB(41,53,0), inact=Color3.fromRGB(42,43,38), out=Color3.fromRGB(143,146,137)},
    ["LimeLight"] = {bg=Color3.fromRGB(252,253,243), fg=Color3.fromRGB(27,28,24), pri=Color3.fromRGB(86,101,23), onpri=Color3.fromRGB(255,255,255), inact=Color3.fromRGB(225,228,213), out=Color3.fromRGB(117,121,109)}
}
--fun fact: im indonesian btw :)

local objs = {bg={}, fg={}, pri={}, onpri={}, inact={}, out={}, s_trk={}, s_thm={}, tab_btn={}, tbox={}, icon={}, dlg_bg={}, dlg_fg={}, sl_val={}, radio={}, checkbox={}, chip={}, dropdown={}, dlg_btn={}, slider={}}
local curTheme = cp["Default"]
local activeTweens = {}

function t(o, p, v, d)
    if not activeTweens[o] then activeTweens[o] = {} end
    if activeTweens[o][p] then
        activeTweens[o][p]:Cancel()
    end
    local tween = tw:Create(o, TweenInfo.new(d or 0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {[p] = v})
    activeTweens[o][p] = tween
    tween:Play()
end

local function RippleEffect(btn, input, color)
    if input.UserInputType.Name ~= "MouseButton1" and input.UserInputType.Name ~= "Touch" then return end
        
    local targetParent = btn:FindFirstChild("RippleContainer") or btn
        
    local mask = Instance.new("CanvasGroup", targetParent)
    mask.Name = "RippleMask"
    mask.Size = UDim2.new(1, 0, 1, 0)
    mask.BackgroundTransparency = 1
    mask.BorderSizePixel = 0
    mask.ZIndex = 50

    local corner = btn:FindFirstChildOfClass("UICorner") or targetParent:FindFirstChildOfClass("UICorner")
    if corner then
        local c = corner:Clone()
        c.Parent = mask
    end
        
    local ripple = Instance.new("Frame", mask)
    ripple.BackgroundColor3 = color or curTheme.fg
    ripple.BackgroundTransparency = 0.85 
    ripple.AnchorPoint = Vector2.new(0.5, 0.5)
    ripple.BorderSizePixel = 0
    Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0) 
        
    local x = input.Position.X - targetParent.AbsolutePosition.X
    local y = input.Position.Y - targetParent.AbsolutePosition.Y
    ripple.Position = UDim2.new(0, x, 0, y)
    ripple.Size = UDim2.new(0, 0, 0, 0)
        
    local maxSize = math.max(targetParent.AbsoluteSize.X, targetParent.AbsoluteSize.Y) * 1.5
        
    tw:Create(ripple, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, maxSize, 0, maxSize),
        BackgroundTransparency = 1
    }):Play()
        
    task.delay(0.4, function() mask:Destroy() end)
end

local function CreateBaselined(data)
    data = data or {}
    local titleText = data.Title or "Baselined"
    local titleIconStr = data.Icon
    local finalSizeX = data.SizeX or 380
    local finalSizeY = data.SizeY or 520
    local toggleKey = data.ToggleKey or Enum.KeyCode.K
    local initTheme = data.Theme or "Default"
    local useSettings = data.UseIntegratedSettings or false
    local enableSearch = data.Search or false
    local searchPlaceholder = data.SearchPlaceholder or "Search..."
    local unlockMouse = data.UnlockMouse
    if unlockMouse == nil then unlockMouse = true end
    local configData = data.ConfigurationSaving or {}
    local configEnabled = configData.Enabled or false
    local configFolder = configData.FolderName or "BaselinedConfigs"
    local configDefaultFile = configData.FileName or "BaselinedConfig"
    local configExt = ".ultrs"
    local searchCb = data.OnSearch
    local searchAvatar = data.SearchAvatar or getDefaultAvatar()
    local closeCb = data.OnClose

    if not string.match(initTheme, "Dark$") and not string.match(initTheme, "Light$") then
        local randomSuffix = (math.random() > 0.5) and "Dark" or "Light"
        initTheme = initTheme .. randomSuffix
    end

    if cp[initTheme] then
        curTheme = cp[initTheme]
    else
        warn("[Baselined] Invalid theme '" .. tostring(initTheme) .. "'.")
        curTheme = cp["DefaultDark"]
    end

    local lib = {}
    local resizeHandle
    local dragPill

    lib.Flags = {}
    lib.Setters = {}

    if configEnabled then
        if not isfolder(configFolder) then makefolder(configFolder) end
    end

    local old = cg:FindFirstChild(titleText or "Baselined")
    if old then old:Destroy() end

    local gui = Instance.new("ScreenGui")
    gui.Name = titleText or "Baselined"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.DisplayOrder = 2147483646
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = cg

    local modalHandler = Instance.new("TextButton", gui)
    modalHandler.Name = "BaselinedModalHandler"
    modalHandler.Size = UDim2.new(0, 0, 0, 0)
    modalHandler.BackgroundTransparency = 1
    modalHandler.Text = ""
    modalHandler.Modal = false

    local notifCont = Instance.new("Frame", gui)
    notifCont.Name = "NotifyContainer"
    notifCont.Size = UDim2.new(1, 0, 1, 0)
    notifCont.BackgroundTransparency = 1
    notifCont.ZIndex = 1000
    notifCont.AnchorPoint = Vector2.new(0.5, 1)
    notifCont.Position = UDim2.new(0.5, 0, 1, 0)

    local notifPad = Instance.new("UIPadding", notifCont)
    notifPad.PaddingBottom = UDim.new(0, 32)
    
    local notifScale = Instance.new("UIScale", notifCont)
    notifScale.Scale = 1.0

    local notifLayout = Instance.new("UIListLayout", notifCont)
    notifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    notifLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    notifLayout.SortOrder = Enum.SortOrder.LayoutOrder
    notifLayout.Padding = UDim.new(0, 8)
    
    local win = Instance.new("Frame", gui)
    win.Size = UDim2.new(0, finalSizeX, 0, 0) 
    win.Position = UDim2.new(0.5, -finalSizeX/2, 0.5, -finalSizeY/2)
    win.BackgroundColor3 = curTheme.bg
    win.BorderSizePixel = 0
    win.ClipsDescendants = true
    win.Active = true
    win.Transparency = 1
    table.insert(objs.bg, win)
    Instance.new("UICorner", win).CornerRadius = UDim.new(0, 16)
    
    local winScale = Instance.new("UIScale", win)
    winScale.Scale = 1.0

    winScale:GetPropertyChangedSignal("Scale"):Connect(function()
        notifScale.Scale = winScale.Scale
    end)

    local topIconObj = nil
    local titleXOffset = 24

    if titleIconStr and titleIconStr ~= "" then
        topIconObj = createIconObj(win, titleIconStr, UDim2.new(0, 24, 0, 24), UDim2.new(0, 24, 0, 20), Vector2.new(0, 0), false)
        if topIconObj then
            titleXOffset = 56
        end
        setIconColor(topIconObj, curTheme.fg)
        table.insert(objs.icon, topIconObj)
    end

    local top = Instance.new("TextLabel", win)
    top.Size = UDim2.new(1, -(100 + titleXOffset), 0, 45)
    top.Position = UDim2.new(0, titleXOffset, 0, 10)
    top.BackgroundTransparency = 1
    top.RichText = true
    top.Text = titleText or "Baselined"
    top.TextColor3 = curTheme.fg
    top.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    top.TextSize = 22
    top.TextXAlignment = Enum.TextXAlignment.Left
    top.TextTruncate = Enum.TextTruncate.AtEnd
    table.insert(objs.fg, top)

    local ctrlCont = Instance.new("Frame", win)
    ctrlCont.Size = UDim2.new(0, 100, 0, 32)
    ctrlCont.AnchorPoint = Vector2.new(1, 0)
    ctrlCont.Position = UDim2.new(1, -12, 0, 16) 
    ctrlCont.BackgroundTransparency = 1

    local ctrlLayout = Instance.new("UIListLayout", ctrlCont)
    ctrlLayout.FillDirection = Enum.FillDirection.Horizontal
    ctrlLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    ctrlLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ctrlLayout.Padding = UDim.new(0, 8)

    local function createCtrlBtn(name, iconStr)
        local btn = Instance.new("TextButton", ctrlCont)
        btn.Name = name
        btn.Size = UDim2.new(0, 32, 0, 32)
        btn.BackgroundTransparency = 1
        btn.Text = ""
        Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
        
        local icn = createIconObj(btn, iconStr, UDim2.new(0, 18, 0, 18), UDim2.new(0.5, 0, 0.5, 0), Vector2.new(0.5, 0.5), false)
        setIconColor(icn, curTheme.out)
        table.insert(objs.icon, icn)

        btn.MouseEnter:Connect(function() 
            t(btn, "BackgroundTransparency", 0.9, 0.2)
            t(btn, "BackgroundColor3", curTheme.out, 0.2)
        end)
        btn.MouseLeave:Connect(function() 
            t(btn, "BackgroundTransparency", 1, 0.2) 
        end)
        btn.InputBegan:Connect(function(input)
            RippleEffect(btn, input, curTheme.out)
        end)
        
        return btn, icn
    end

    local parsedMin = parseIcon("minimize")
    local parsedMax = parseIcon("maximize")
    local btnMinMax, icnMinMax = createCtrlBtn("Minimize and Maximize", "minimize")
    local btnClose, icnClose = createCtrlBtn("Close", "x")

    local isMin = false
    local isMax = false
    local preSize = UDim2.new(0, finalSizeX, 0, finalSizeY) 
    local prePos = win.Position

    local savedMouseBehavior = nil
    local savedIconOverride = nil
    
    local localPlayer = plrs.LocalPlayer
    local playerMouse = localPlayer and localPlayer:GetMouse() or nil
    local savedIcon = nil

    local isToggling = false
    local function toggleWindow()
        if isToggling then return end
        isToggling = true
        task.delay(0.4, function() isToggling = false end)
        
        if isMin then
            isMin = false
            if icnMinMax:IsA("ImageLabel") then icnMinMax.Image = parsedMin.val else icnMinMax.Text = parsedMin.val end
            t(win, "Size", preSize, 0.4)
            if resizeHandle then resizeHandle.Visible = true end
            dragPill.Visible = true

            if unlockMouse and uis.MouseEnabled then
                modalHandler.Modal = true
                
                savedMouseBehavior = uis.MouseBehavior
                uis.MouseBehavior = Enum.MouseBehavior.Default
                
                savedIconOverride = uis.OverrideMouseIconBehavior
                uis.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
                
                if playerMouse and uis.KeyboardEnabled then
                    savedIcon = playerMouse.Icon
                    playerMouse.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png" 
                end
            end
        else
            if not isMax then preSize = win.Size end
            isMin = true
            isMax = false
            if icnMinMax:IsA("ImageLabel") then icnMinMax.Image = parsedMax.val else icnMinMax.Text = parsedMax.val end
            t(win, "Size", UDim2.new(0, win.Size.X.Offset, 0, 64), 0.4)
            if resizeHandle then resizeHandle.Visible = false end
            dragPill.Visible = false
            if unlockMouse and uis.MouseEnabled then
                modalHandler.Modal = false
                
                if savedMouseBehavior then uis.MouseBehavior = savedMouseBehavior end
                if savedIconOverride then uis.OverrideMouseIconBehavior = savedIconOverride end
                
                if playerMouse and savedIcon ~= nil and uis.KeyboardEnabled then
                    playerMouse.Icon = savedIcon
                end
    
                if toggleKey and uis.KeyboardEnabled then
                    lib:Notify({
                        Text = "Press <b>" .. toggleKey.Name .. "</b> to maximize " .. titleText .. ".",
                        Duration = 10
                    })
                end
            end
        end
    end

    btnMinMax.MouseButton1Click:Connect(toggleWindow)

    if toggleKey then
        uis.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode == toggleKey then
                toggleWindow()
            end
        end)
    end

    local searchOffset = 0
    local searchBar
    local searchBox
    local avatarImg
    if enableSearch then
        searchOffset = 78

        searchBar = Instance.new("Frame", win)
        searchBar.Size = UDim2.new(1, -48, 0, 56) 
        searchBar.Position = UDim2.new(0.5, 0, 0, 65)
        searchBar.BackgroundColor3 = curTheme.inact:Lerp(curTheme.bg, 0.6)
        searchBar.BorderSizePixel = 0
        searchBar.AnchorPoint = Vector2.new(0.5, 0)
        searchBar.ZIndex = 60
        table.insert(objs.inact, searchBar)

        Instance.new("UICorner", searchBar).CornerRadius = UDim.new(1, 0)

        local searchIcn = createIconObj(searchBar, "search", UDim2.new(0, 24, 0, 24), UDim2.new(0, 16, 0.5, 0), Vector2.new(0, 0.5), false)
        searchIcn.ZIndex = 61
        setIconColor(searchIcn, curTheme.out)
        table.insert(objs.icon, searchIcn)

        local rightMargin = -16 

        if searchAvatar and searchAvatar ~= "" then
            avatarImg = Instance.new("ImageLabel", searchBar)
            avatarImg.Size = UDim2.new(0, 30, 0, 30) 
            avatarImg.AnchorPoint = Vector2.new(1, 0.5)
            avatarImg.Position = UDim2.new(1, -16, 0.5, 0)
            avatarImg.BackgroundColor3 = curTheme.bg
            avatarImg.Image = searchAvatar
            avatarImg.ClipsDescendants = true
            avatarImg.ZIndex = 61
            Instance.new("UICorner", avatarImg).CornerRadius = UDim.new(1, 0)
            rightMargin = -56 
        end

        searchBox = Instance.new("TextBox", searchBar)
        searchBox.Size = UDim2.new(1, rightMargin - 48, 1, 0)
        searchBox.Position = UDim2.new(0, 48, 0, 0)
        searchBox.BackgroundTransparency = 1
        searchBox.Text = ""
        searchBox.PlaceholderText = searchPlaceholder
        searchBox.PlaceholderColor3 = curTheme.out
        searchBox.TextColor3 = curTheme.fg
        searchBox.FontFace = m3Font
        searchBox.TextSize = 15
        searchBox.TextTruncate = Enum.TextTruncate.AtEnd
        searchBox.TextXAlignment = Enum.TextXAlignment.Left
        searchBox.ZIndex = 61

        local clearBtn = createIconObj(searchBar, "x", UDim2.new(0, 20, 0, 20), UDim2.new(1, -16, 0.5, 0), Vector2.new(1, 0.5), true)
        setIconTrans(clearBtn, 1)
        setIconColor(clearBtn, curTheme.out)
        clearBtn.Active = false
        clearBtn.ZIndex = 61
        table.insert(objs.icon, clearBtn)

        local dockedBg = Instance.new("Frame", win)
        dockedBg.Size = UDim2.new(1, -36, 0, 0)
        dockedBg.Position = UDim2.new(0, 18, 0, 125)
        dockedBg.BackgroundColor3 = curTheme.inact:Lerp(curTheme.bg, 0.4)
        dockedBg.BorderSizePixel = 0
        dockedBg.ZIndex = 50
        dockedBg.Visible = false
        dockedBg.ClipsDescendants = true
        table.insert(objs.inact, dockedBg)

        local dockedCorner = Instance.new("UICorner", dockedBg)
        dockedCorner.CornerRadius = UDim.new(0, 16)

        local dockedScroll = Instance.new("ScrollingFrame", dockedBg)
        dockedScroll.Size = UDim2.new(1, 0, 1, 0)
        dockedScroll.BackgroundTransparency = 1
        dockedScroll.ScrollBarThickness = 2
        dockedScroll.ZIndex = 51
        dockedScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
        dockedScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        
        local dockedLayout = Instance.new("UIListLayout", dockedScroll)
        dockedLayout.SortOrder = Enum.SortOrder.LayoutOrder

        searchBox:GetPropertyChangedSignal("Text"):Connect(function()
            local query = string.lower(searchBox.Text)
            local hasText = #query > 0

            clearBtn.Active = hasText
            setIconTrans(clearBtn, hasText and 0 or 1, 0.2)

            if avatarImg then
                t(avatarImg, "ImageTransparency", hasText and 1 or 0, 0.2)
                t(avatarImg, "BackgroundTransparency", hasText and 1 or 0, 0.2)
            end

            for _, child in ipairs(dockedScroll:GetChildren()) do
                if child:IsA("TextButton") or child:IsA("TextLabel") then child:Destroy() end
            end

            if hasText then
                dockedBg.Visible = true
                local resultsCount = 0

                for _, item in ipairs(lib.SearchRegistry) do
                    if item.type == "item" and item.isSearchable and string.find(item.text, query) then
                        resultsCount += 1
                        
                        local resBtn = Instance.new("TextButton", dockedScroll)
                        resBtn.Size = UDim2.new(1, 0, 0, 48)
                        resBtn.BackgroundColor3 = curTheme.fg
                        resBtn.BackgroundTransparency = 1
                        resBtn.Text = item.rawText
                        resBtn.TextColor3 = curTheme.fg
                        resBtn.FontFace = m3Font
                        resBtn.TextSize = 14
                        resBtn.TextXAlignment = Enum.TextXAlignment.Left
                        resBtn.ZIndex = 52
                        resBtn.LayoutOrder = resultsCount
                        table.insert(objs.fg, resBtn)
                        
                        local resPad = Instance.new("UIPadding", resBtn)
                        resPad.PaddingLeft = UDim.new(0, 16)
                        resPad.PaddingRight = UDim.new(0, 16)

                        resBtn.MouseEnter:Connect(function() t(resBtn, "BackgroundTransparency", 0.9, 0.2) end)
                        resBtn.MouseLeave:Connect(function() t(resBtn, "BackgroundTransparency", 1, 0.2) end)

                        resBtn.MouseButton1Click:Connect(function()
                            searchBox.Text = "" 
                            searchBox:ReleaseFocus()
                            dockedBg.Visible = false
                            
                            if item.parentTab then
                                lib:SelectTab(item.parentTab.Text)
                            end
                            
                            task.spawn(function()
                                game:GetService("RunService").RenderStepped:Wait() 
                                game:GetService("RunService").RenderStepped:Wait() 
                                
                                local container = item.parentTab and lib.TabContainers[lib.ActiveTabIndex] or defaultCont
                                local targetEl = item.obj
                                
                                if container and targetEl then
                                    local targetY = targetEl.AbsolutePosition.Y - container.AbsolutePosition.Y + container.CanvasPosition.Y
                                    local centeredY = targetY - (container.AbsoluteSize.Y / 2) + (targetEl.AbsoluteSize.Y / 2)
                                    
                                    local maxScroll = math.max(0, container.AbsoluteCanvasSize.Y - container.AbsoluteSize.Y)
                                    centeredY = math.clamp(centeredY, 0, maxScroll)
                                    
                                    tw:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                                        CanvasPosition = Vector2.new(0, centeredY)
                                    }):Play()
                                end
                            end)
                        end)
                    end
                end

                if resultsCount == 0 then
                    local emptyLbl = Instance.new("TextLabel", dockedScroll)
                    emptyLbl.Size = UDim2.new(1, 0, 0, 48)
                    emptyLbl.BackgroundTransparency = 1
                    emptyLbl.Text = "No results found for '"..searchBox.Text.."'"
                    emptyLbl.TextColor3 = curTheme.out
                    emptyLbl.FontFace = m3Font
                    emptyLbl.TextSize = 14
                end

                local finalHeight = math.clamp(math.max(1, resultsCount) * 48, 48, 200)
                tw:Create(dockedBg, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Size = UDim2.new(1, -36, 0, finalHeight)
                }):Play()
            else
                tw:Create(dockedBg, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Size = UDim2.new(1, -36, 0, 0)
                }):Play()
                task.delay(0.2, function()
                    if #searchBox.Text == 0 then dockedBg.Visible = false end
                end)
            end

            if searchCb then searchCb(searchBox.Text) end
        end)

        clearBtn.MouseButton1Click:Connect(function()
            searchBox.Text = ""
            searchBox:CaptureFocus()
        end)
        
        searchBox.Focused:Connect(function()
            t(searchBar, "BackgroundColor3", curTheme.inact, 0.2)
            t(searchBar, "Size", UDim2.new(1, -36, 0, 56), 0.5)
            setIconColor(searchIcn, curTheme.pri, 0.2)
        end)

        searchBox.FocusLost:Connect(function()
            t(searchBar, "BackgroundColor3", curTheme.inact:Lerp(curTheme.bg, 0.6), 0.2)
            t(searchBar, "Size", UDim2.new(1, -48, 0, 56), 0.5)
            setIconColor(searchIcn, curTheme.out, 0.2)
            
            task.delay(0.1, function()
                if not searchBox:IsFocused() then
                    tw:Create(dockedBg, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, -48, 0, 0)
                    }):Play()
                    task.delay(0.2, function() dockedBg.Visible = false end)
                end
            end)
        end)
    end

    btnClose.MouseButton1Click:Connect(function()
        lib:AddDialog({
            Title = "Close " .. (titleText or "Baselined") .. "?",
            Description = "Are you sure you want to close " .. (titleText or "Baselined") .. "? Any unsaved changes will be lost.",
            Buttons = {
                {Text = "Cancel", Type = "text", Callback = nil},
                {Text = "Close", Type = "text", Callback = function()
                    local tInfo = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    
                    tw:Create(win, tInfo, {
                        Size = UDim2.new(0, win.Size.X.Offset, 0, 64),
                        Transparency = 1
                    }):Play()
                    
                    tw:Create(top, tInfo, {TextTransparency = 1}):Play()
                    tw:Create(top, tInfo, {TextTransparency = 1}):Play()
                    if topIconObj then setIconTrans(topIconObj, 1, 0.4) end
                    
                    if enableSearch and searchBar then
                        tw:Create(searchBar, tInfo, {BackgroundTransparency = 1}):Play()
                        tw:Create(avatarImg, tInfo, {BackgroundTransparency = 1}):Play()
                        tw:Create(avatarImg, tInfo, {ImageTransparency = 1}):Play()
                    end
                    
                    tw:Create(btnMinMax, tInfo, {BackgroundTransparency = 1}):Play()
                    tw:Create(btnClose, tInfo, {BackgroundTransparency = 1}):Play()
                    if dragPill then
                        tw:Create(dragPill, tInfo, {BackgroundTransparency = 1}):Play()
                    end
                    
                    setIconTrans(icnMinMax, 1, 0.4)
                    setIconTrans(icnClose, 1, 0.4)
                    
                    task.wait(0.4)
                    if lib.Flags["AutoSaveOnExit"] then
                        lib:SaveConfig("AutoSave")
                    end
                    if closeCb then closeCb() end
                    gui:Destroy()
                end}
            },
        })
    end)

    local tabArea = Instance.new("Frame", win)
    tabArea.Size = UDim2.new(1, 0, 0, 40) 
    tabArea.Position = UDim2.new(0, 0, 0, 55 + searchOffset) 
    tabArea.BackgroundTransparency = 1
    tabArea.ClipsDescendants = true
    tabArea.Visible = false

    local sep = Instance.new("Frame", tabArea)
    sep.Size = UDim2.new(1, 0, 0, 1)
    sep.AnchorPoint = Vector2.new(0, 1)
    sep.Position = UDim2.new(0, 0, 1, 0)
    sep.BackgroundColor3 = curTheme.inact
    sep.BorderSizePixel = 0
    table.insert(objs.inact, sep)

    local tabListCont = Instance.new("ScrollingFrame", tabArea)
    tabListCont.Size = UDim2.new(1, 0, 1, 0)
    tabListCont.BackgroundTransparency = 1
    tabListCont.ScrollBarThickness = 0
    tabListCont.CanvasSize = UDim2.new(0, 0, 0, 0)
    tabListCont.AutomaticCanvasSize = Enum.AutomaticSize.X

    local dragTab = false
    local isDraggingTabAction = false
    local dragTabStartX = 0
    local dragTabStartCanvasX = 0

    local function startTabDrag(input)
        if input.UserInputType.Name:find("MouseButton1") or input.UserInputType.Name:find("Touch") then
            dragTab = true
            isDraggingTabAction = false
            dragTabStartX = input.Position.X
            dragTabStartCanvasX = tabListCont.CanvasPosition.X
        end
    end

    tabListCont.InputBegan:Connect(startTabDrag)

    uis.InputChanged:Connect(function(input)
        if dragTab and (input.UserInputType.Name:find("MouseMovement") or input.UserInputType.Name:find("Touch")) then
            local delta = dragTabStartX - input.Position.X
            if math.abs(delta) > 5 then
                isDraggingTabAction = true
                tabListCont.CanvasPosition = Vector2.new(dragTabStartCanvasX + delta, 0)
            end
        end
    end)

    uis.InputEnded:Connect(function(input)
        if input.UserInputType.Name:find("MouseButton1") or input.UserInputType.Name:find("Touch") then
            dragTab = false
        end
    end)

    local tabListInner = Instance.new("Frame", tabListCont)
    tabListInner.Size = UDim2.new(1, 0, 1, 0)
    tabListInner.BackgroundTransparency = 1
    tabListInner.AutomaticSize = Enum.AutomaticSize.X

    local tPad = Instance.new("UIPadding", tabListInner)
    tPad.PaddingLeft = UDim.new(0, 24)
    tPad.PaddingRight = UDim.new(0, 24)

    local tabList = Instance.new("UIListLayout", tabListInner)
    tabList.FillDirection = Enum.FillDirection.Horizontal
    tabList.SortOrder = Enum.SortOrder.LayoutOrder
    tabList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    indicator = Instance.new("Frame", tabListCont)
    indicator.Size = UDim2.new(0, 0, 0, 3)
    indicator.AnchorPoint = Vector2.new(0.5, 1)
    indicator.Position = UDim2.new(0, 0, 1, 0)
    indicator.BackgroundColor3 = curTheme.pri
    Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)
    table.insert(objs.pri, indicator)

    defaultCont = Instance.new("ScrollingFrame", win)
    defaultCont.Size = UDim2.new(1, 0, 1, -(70 + searchOffset))
    defaultCont.Position = UDim2.new(0, 0, 0, 60 + searchOffset)
    defaultCont.BackgroundTransparency = 1
    defaultCont.ScrollBarThickness = 0
    defaultCont.CanvasSize = UDim2.new(0, 0, 0, 0)
    defaultCont.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    local dPad = Instance.new("UIPadding", defaultCont)
    dPad.PaddingLeft = UDim.new(0, 24)
    dPad.PaddingRight = UDim.new(0, 24)
    dPad.PaddingBottom = UDim.new(0, 20)
    dPad.PaddingTop = UDim.new(0, 20)

    local defLayout = Instance.new("UIListLayout", defaultCont)
    defLayout.SortOrder = Enum.SortOrder.LayoutOrder
    defLayout.Padding = UDim.new(0, 18)

    local contClip = Instance.new("Frame", win)
    if enableSearch then
        contClip.Size = UDim2.new(1, 0, 1, -173)
        contClip.Position = UDim2.new(0, 0, 0, 173)
    else
        contClip.Size = UDim2.new(1, 0, 1, -95)
        contClip.Position = UDim2.new(0, 0, 0, 95)
    end
    contClip.BackgroundTransparency = 1
    contClip.ClipsDescendants = true
    contClip.Visible = false

    lib.Tabs = {}
    lib.TabContainers = {}
    lib.ActiveTabIndex = 0
    lib.CurrentBuildContainer = defaultCont
    lib.UseTabs = false
    lib.ElementCounter = 0
    lib.SearchRegistry = {}
    lib.CurrentSearchTab = nil
    lib.CurrentSearchSection = nil

    function lib:RegisterElement(uiElement, searchText, elementType)
        table.insert(lib.SearchRegistry, {
            obj = uiElement,
            type = elementType or "item",
            rawText = searchText or "",
            text = searchText and string.lower(searchText) or "",
            isSearchable = (searchText ~= nil and searchText ~= ""),
            parentSection = lib.CurrentSearchSection,
            parentTab = lib.CurrentSearchTab
        })
    end

    function lib:ChangeTheme(name)
        if cp[name] then
            if not string.match(name, "Dark$") and not string.match(name, "Light$") then
                local randomSuffix = (math.random() > 0.5) and "Dark" or "Light"
                name = name .. randomSuffix
            end
        else
            warn("[Baselined] Invalid theme '" .. tostring(name) .. "'.")
        end

        curTheme = cp[name]
        
        local d = 0.8
        for _,v in pairs(objs.bg) do t(v, "BackgroundColor3", curTheme.bg, d) end
        for _,v in pairs(objs.fg) do             
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                t(v, "ImageColor3", curTheme.fg, d)
            elseif v == dragPill then
                t(v, "BackgroundColor3", curTheme.fg, d)
            else
                t(v, "TextColor3", curTheme.fg, d) 
            end 
        end
        if searchBox then
            t(searchBox, "TextColor3", curTheme.fg, d)
            t(searchBox, "PlaceholderColor3", curTheme.out, d)
        end
        for _,v in pairs(objs.pri) do 
            local obj = (type(v) == "table" and v.obj) or v
            if obj and obj:IsA("TextLabel") then
                t(obj, "TextColor3", curTheme.pri, d)
            elseif obj and obj:IsA("TextButton") and obj.Text ~= "" then
                t(obj, "TextColor3", curTheme.pri, d)
            elseif obj then
                t(obj, "BackgroundColor3", curTheme.pri, d)
            end
        end

        if objs.tonal_bg then
            for _,v in pairs(objs.tonal_bg) do
                t(v, "BackgroundColor3", curTheme.inact:Lerp(curTheme.pri, 0.15), d)
            end
        end

        for _,v in pairs(objs.onpri) do 
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                t(v, "ImageColor3", curTheme.onpri, d)
            else
                t(v, "TextColor3", curTheme.onpri, d) 
            end
        end
        
        for _,v in pairs(objs.inact) do t(v, "BackgroundColor3", curTheme.inact, d) end
        for _,x in pairs(objs.s_trk) do t(x.obj, "BackgroundColor3", x.state and curTheme.pri or curTheme.inact, d) end
        for _,x in pairs(objs.s_thm) do 
            if type(x) == "table" and x.obj then
                if x.obj:IsA("UIStroke") then
                    t(x.obj, "Color", x.state and curTheme.onpri or curTheme.out, d)
                elseif x.obj:IsA("TextLabel") then
                     t(x.obj, "TextColor3", x.state and curTheme.onpri or curTheme.out, d)
                else
                    t(x.obj, "BackgroundColor3", x.state and curTheme.onpri or curTheme.out, d) 
                end
            end
        end
        for _,x in pairs(objs.tab_btn) do 
            t(x.lbl, "TextColor3", x.active and curTheme.pri or curTheme.out, d)
            if x.icon then setIconColor(x.icon, x.active and curTheme.pri or curTheme.out, d) end
        end
        for _, icn in pairs(objs.icon) do 
            if icn:IsA("UIStroke") then
                t(icn, "Color", curTheme.out, d)
            elseif icn:IsA("ImageLabel") or icn:IsA("ImageButton") then
                t(icn, "ImageColor3", curTheme.out, d)
            elseif icn:IsA("TextLabel") or icn:IsA("TextButton") then
                t(icn, "TextColor3", curTheme.out, d)
            end
        end
        for _, v in pairs(objs.sl_val) do t(v, "TextColor3", curTheme.out, d) end

        for _,v in pairs(objs.dlg_bg) do t(v, "BackgroundColor3", curTheme.bg:Lerp(curTheme.pri, 0.11), d) end
        for _,v in pairs(objs.dlg_fg) do t(v, "TextColor3", curTheme.fg, d) end
        
        for _, tb in pairs(objs.tbox) do
            t(tb.lbl, "TextColor3", tb.focused and curTheme.pri or curTheme.out, d)
            t(tb.box, "TextColor3", curTheme.fg, d)
            t(tb.line, "BackgroundColor3", tb.focused and curTheme.pri or curTheme.out, d)
            t(tb.bg, "BackgroundColor3", curTheme.inact, d)
        end
        for _, v in pairs (objs.out) do
            if v:IsA("UIStroke") then
                t(v, "Color", curTheme.out, d)
            else
                t(v, "BorderColor3", curTheme.fg, d)
                t(v, "TextColor3", curTheme.fg, d)
            end
        end
        for _,x in pairs(objs.radio) do 
            t(x.stroke, "Color", x.selected and curTheme.pri or curTheme.out, d)
            t(x.dot, "BackgroundColor3", curTheme.pri, d)
        end
        for _,x in pairs(objs.checkbox) do
            t(x.box, "BackgroundColor3", x.state and curTheme.pri or curTheme.bg, d)
            t(x.stroke, "Color", x.state and curTheme.pri or curTheme.out, d)
            t(x.icon, "TextColor3", curTheme.onpri, d)
        end
        for _, c in pairs(objs.chip) do
            if c.type == "filled" then
                t(c.bg, "BackgroundColor3", c.selected and curTheme.pri or (curTheme.inact:Lerp(curTheme.fg, 0.08)), d)
                t(c.lbl, "TextColor3", c.selected and curTheme.onpri or curTheme.fg, d)
                if c.icon then setIconColor(c.icon, c.selected and curTheme.onpri or curTheme.fg, d) end
            else
                t(c.bg, "BackgroundColor3", c.selected and curTheme.inact:Lerp(curTheme.pri, 0.15) or curTheme.bg, d)
                t(c.bg, "BackgroundTransparency", c.selected and 0 or 1, d)
                t(c.stroke, "Color", c.selected and curTheme.pri or curTheme.out, d)
                t(c.lbl, "TextColor3", curTheme.fg, d)
                if c.icon then setIconColor(c.icon, curTheme.fg, d) end
            end
        end
        for _, dd in pairs(objs.dropdown) do
            local open = dd.getState()
            t(dd.lbl, "TextColor3", open and curTheme.pri or curTheme.out, d)
            t(dd.line, "BackgroundColor3", open and curTheme.pri or curTheme.out, d)
        end

        for _, bData in pairs(objs.dlg_btn) do
            if bData.isFilled then
                t(bData.btn, "BackgroundColor3", curTheme.pri, d)
                t(bData.btn, "TextColor3", curTheme.onpri, d)
            else
                t(bData.btn, "BackgroundColor3", curTheme.bg, d)
                t(bData.btn, "TextColor3", curTheme.pri, d)
            end
        end

        for _, updateSlider in pairs(objs.slider) do
            updateSlider(d)
        end
    end

    function lib:AddTheme(themeName, themeData)
        local def = cp["Default"]
        cp[themeName] = {
            bg = themeData.Background or themeData.bg or def.bg,
            fg = themeData.Text or themeData.TextColor or themeData.fg or def.fg,
            pri = themeData.Primary or themeData.PrimaryColor or themeData.pri or def.pri,
            onpri = themeData.TextOnPrimary or themeData.onpri or def.onpri,
            inact = themeData.Surface or themeData.Inactive or themeData.inact or def.inact,
            out = themeData.Outline or themeData.Border or themeData.out or def.out
        }
    end

    function lib:SelectTab(txt)
        local targetIdx = 1
        for i, tData in ipairs(lib.Tabs) do
            if tData.btn.Text == txt then targetIdx = i break end
        end
        
        if targetIdx == lib.ActiveTabIndex then return end
        local isFirstLoad = (lib.ActiveTabIndex == 0)

        local dir = (targetIdx > lib.ActiveTabIndex) and 1 or -1
        if lib.ActiveTabIndex == 0 then dir = 0 end 
        
        local oldCont = (lib.ActiveTabIndex > 0) and lib.TabContainers[lib.ActiveTabIndex] or defaultCont
        local newCont = lib.TabContainers[targetIdx]

        for i, tData in ipairs(lib.Tabs) do
            local btn = tData.btn
            if i == targetIdx then
                tData.data.active = true
                t(tData.data.lbl, "TextColor3", curTheme.pri, 0.3)
                
                if tData.data.icon then 
                    setIconColor(tData.data.icon, curTheme.pri, 0.3)
                    
                    if tData.data.iconType == "font" then
                        tData.data.icon.FontFace = iconFontFilled
                    end
                end

                task.spawn(function()
                    rs.RenderStepped:Wait() 
                    rs.RenderStepped:Wait()
                    local scale = winScale.Scale
                    local btnCenterX = ((btn.AbsolutePosition.X - tabListCont.AbsolutePosition.X) / scale) + tabListCont.CanvasPosition.X + ((btn.AbsoluteSize.X / scale) / 2)
                    local contentWidth = tData.data.lbl.TextBounds.X
                   
                    if isFirstLoad then
                        tw:Create(indicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, contentWidth, 0, 3)
                        }):Play()
                        indicator.Position = UDim2.new(0, btnCenterX, 1, 0)
                    else
                        tw:Create(indicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                             Size = UDim2.new(0, contentWidth, 0, 3),
                             Position = UDim2.new(0, btnCenterX, 1, 0)
                        }):Play()
                    end
                end)
            else
                tData.data.active = false
                t(tData.data.lbl, "TextColor3", curTheme.out, 0.3)
                
                if tData.data.icon then 
                    setIconColor(tData.data.icon, curTheme.out, 0.3)
                    
                    if tData.data.iconType == "font" then
                        tData.data.icon.FontFace = iconFontOutlined
                    end
                end
            end
        end

        if oldCont and dir ~= 0 and oldCont ~= defaultCont then
            newCont.Position = UDim2.new(dir, dir * 50, 0, 0)
            newCont.Visible = true
            t(oldCont, "Position", UDim2.new(-dir, -dir * 50, 0, 0), 0.4)
            t(newCont, "Position", UDim2.new(0, 0, 0, 0), 0.4)
            local savedOld = oldCont
            task.delay(0.4, function() 
                if lib.TabContainers[lib.ActiveTabIndex] ~= savedOld then savedOld.Visible = false end 
            end)
        else
            newCont.Position = UDim2.new(0, 0, 0, 0)
            newCont.Visible = true
            if oldCont and oldCont ~= defaultCont then oldCont.Visible = false end
        end
        
        lib.ActiveTabIndex = targetIdx
    end

    function lib:AddTab(data)
        local txt = data.Title or "Tab"
        local iconStr = data.Icon
        local isListMode = data.ListMode or false

        if not lib.UseTabs then
            lib.UseTabs = true
            tabArea.Visible = true
            contClip.Visible = true
            defaultCont.Visible = false
        end

        local btn = Instance.new("TextButton", tabListInner)
        btn.BackgroundTransparency = 1
        btn.FontFace = m3Font
        btn.Text = txt
        btn.TextSize = 14
        btn.RichText = true
        btn.TextTransparency = 1
        btn.TextColor3 = curTheme.out
        btn.Size = UDim2.new(0, 20, 1, 0) 
        btn.AutomaticSize = Enum.AutomaticSize.X 

        lib.CurrentSearchTab = btn 
        lib.CurrentSearchSection = nil

        local uip = Instance.new("UIPadding", btn)
        uip.PaddingLeft = UDim.new(0, 16)
        uip.PaddingRight = UDim.new(0, 16)

        local contentContainer = Instance.new("Frame", btn)
        contentContainer.Size = UDim2.new(1, 0, 1, 0)
        contentContainer.BackgroundTransparency = 1
        contentContainer.ZIndex = 2

        local contentLayout = Instance.new("UIListLayout", contentContainer)
        contentLayout.FillDirection = Enum.FillDirection.Horizontal
        contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 8)

        local iconImg = nil
        local iconType = nil

        if iconStr and iconStr ~= "" then
            iconImg, iconType = createIconObj(contentContainer, iconStr, UDim2.new(0, 18, 0, 18), nil, nil, false)
            if iconImg then
                setIconColor(iconImg, curTheme.out)
                
                if iconType == "font" then
                    iconImg.FontFace = iconFontOutlined
                end
                
                iconImg.LayoutOrder = 1
                iconImg.ZIndex = 2
            end
        end
        
        local txtLbl = Instance.new("TextLabel", contentContainer)
        txtLbl.BackgroundTransparency = 1
        txtLbl.Text = txt
        txtLbl.FontFace = m3Font
        txtLbl.TextSize = 14
        txtLbl.RichText = true
        txtLbl.TextColor3 = curTheme.out
        txtLbl.AutomaticSize = Enum.AutomaticSize.XY
        txtLbl.LayoutOrder = 2
        txtLbl.ZIndex = 2
                
        local tData = {obj = btn, active = false, icon = iconImg, iconType = iconType, lbl = txtLbl}
        table.insert(objs.tab_btn, tData)
        
        local c = Instance.new("ScrollingFrame", contClip)
        c.Size = UDim2.new(1, 0, 1, 0)
        c.BackgroundTransparency = 1
        c.ScrollBarThickness = 0
        c.CanvasSize = UDim2.new(0, 0, 0, 0)
        c.AutomaticCanvasSize = Enum.AutomaticSize.Y
        c.Visible = false
        
        local cPad = Instance.new("UIPadding", c)
        cPad.PaddingLeft = UDim.new(0, isListMode and 0 or 24)
        cPad.PaddingRight = UDim.new(0, isListMode and 0 or 24)
        cPad.PaddingBottom = UDim.new(0, 20)
        cPad.PaddingTop = UDim.new(0, 20)

        local cLayout = Instance.new("UIListLayout", c)
        cLayout.SortOrder = Enum.SortOrder.LayoutOrder
        cLayout.Padding = UDim.new(0, isListMode and 0 or 18)

        table.insert(lib.Tabs, {btn = btn, data = tData})
        table.insert(lib.TabContainers, c)
        
        lib.CurrentBuildContainer = c 

        btn.MouseButton1Click:Connect(function() 
            if not isDraggingTabAction then lib:SelectTab(txt) end
        end)

        if #lib.Tabs == 1 then lib:SelectTab(txt) end

        local tabObj = {
            SetText = function(self, newTxt)
                btn.Text = newTxt
                txtLbl.Text = newTxt
                if lib.ActiveTabIndex > 0 and lib.Tabs[lib.ActiveTabIndex].btn == btn then
                    lib:SelectTab(newTxt)
                end
            end,
            SetIcon = function(self, newIconStr)
                if iconImg then iconImg:Destroy() iconImg = nil end
                
                if newIconStr and newIconStr ~= "" then
                    iconImg, iconType = createIconObj(contentContainer, newIconStr, UDim2.new(0, 18, 0, 18), nil, nil, false)
                    if iconImg then
                        iconImg.LayoutOrder = 1
                        iconImg.ZIndex = 2

                        local clr = tData.active and curTheme.pri or curTheme.out
                        setIconColor(iconImg, clr)
                        
                        if iconType == "font" then
                            iconImg.FontFace = tData.active and iconFontFilled or iconFontOutlined
                        end
                    end
                end

                tData.icon = iconImg
                tData.iconType = iconType
            end
        }

        setmetatable(tabObj, {
            __index = function(_, key)
                if type(lib[key]) == "function" and string.sub(key, 1, 3) == "Add" then
                    return function(_, ...)
                        if isListMode and key ~= "AddList" then
                            return setmetatable({}, {
                                __index = function() return function() end end
                            })
                        end
                        local prevContainer = lib.CurrentBuildContainer
                        lib.CurrentBuildContainer = c
                        local result = lib[key](lib, ...)
                        lib.CurrentBuildContainer = prevContainer
                        return result
                    end
                end
                return lib[key]
            end
        })

        return tabObj
    end

    function lib:Notify(data)
        local msg = data.Text or "Notification"
        local actions = data.Actions or {}
        local dur = data.Duration or 4
        
        local snk = Instance.new("Frame")
        snk.BackgroundColor3 = curTheme.bg:Lerp(Color3.new(1, 1, 1), 0.15)
        snk.Size = UDim2.new(0, 0, 0, 48)
        snk.AutomaticSize = Enum.AutomaticSize.X
        snk.BackgroundTransparency = 1 
        snk.AnchorPoint = Vector2.new(0.5, 0.5) 
        Instance.new("UICorner", snk).CornerRadius = UDim.new(0, 4)
        
        local uiScale = Instance.new("UIScale", snk)
        uiScale.Scale = 0

        local layout = Instance.new("UIListLayout", snk)
        layout.FillDirection = Enum.FillDirection.Horizontal
        layout.VerticalAlignment = Enum.VerticalAlignment.Center
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        
        local pad = Instance.new("UIPadding", snk)
        pad.PaddingLeft = UDim.new(0, 16)
        pad.PaddingRight = UDim.new(0, 12) 
        
        local msgLbl = Instance.new("TextLabel", snk)
        msgLbl.BackgroundTransparency = 1
        msgLbl.Text = msg
        msgLbl.TextColor3 = curTheme.fg
        msgLbl.FontFace = m3Font
        msgLbl.RichText = true
        msgLbl.TextSize = 14
        msgLbl.AutomaticSize = Enum.AutomaticSize.X
        msgLbl.Size = UDim2.new(0, 0, 1, 0)
        msgLbl.LayoutOrder = 1
        
        local spacer = Instance.new("Frame", snk)
        spacer.BackgroundTransparency = 1
        spacer.Size = UDim2.new(0, 24, 1, 0)
        spacer.LayoutOrder = 2
        
        if #actions > 0 then
            for i = 1, math.min(#actions, 2) do 
                local actData = actions[i]
                local actBtn = Instance.new("TextButton", snk)
                actBtn.BackgroundTransparency = 1
                actBtn.Text = actData.Text or "Action"
                actBtn.RichText = true
                actBtn.TextColor3 = curTheme.pri
                actBtn.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
                actBtn.TextSize = 14
                actBtn.AutomaticSize = Enum.AutomaticSize.X
                actBtn.Size = UDim2.new(0, 0, 1, 0)
                actBtn.LayoutOrder = 2 + i
                
                local actPad = Instance.new("UIPadding", actBtn)
                actPad.PaddingRight = UDim.new(0, 12) 
                
                actBtn.MouseButton1Click:Connect(function()
                    if actData.Callback then actData.Callback() end
                    
                    tw:Create(snk, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, 20)
                    }):Play()
                    
                    tw:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                        Scale = 0
                    }):Play()
                    
                    for _, v in pairs(snk:GetDescendants()) do
                        if v:IsA("TextLabel") or v:IsA("TextButton") then tw:Create(v, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                        elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then tw:Create(v, TweenInfo.new(0.3), {ImageTransparency = 1}):Play() end
                    end
                    task.wait(0.3)
                    snk:Destroy()
                end)
            end
        else
            spacer.Size = UDim2.new(0, 12, 1, 0)
        end
        
        local closeBtn = createIconObj(snk, "x", UDim2.new(0, 24, 0, 24), nil, nil, true)
        closeBtn.LayoutOrder = 4
        setIconColor(closeBtn, curTheme.out)
        
        closeBtn.MouseButton1Click:Connect(function()
            tw:Create(snk, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, 20)
            }):Play()
            
            tw:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                Scale = 0
            }):Play()
            
            for _, v in pairs(snk:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then tw:Create(v, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then tw:Create(v, TweenInfo.new(0.3), {ImageTransparency = 1}):Play() end
            end
            
            task.wait(0.3)
            snk:Destroy()
        end)
        
        snk.Parent = notifCont
        snk.Position = UDim2.new(0, 0, 0, 20)
        
        tw:Create(snk, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            BackgroundTransparency = 0, Position = UDim2.new(0, 0, 0, 0)
        }):Play()
        
        tw:Create(uiScale, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Scale = 1
        }):Play()
        
        for _, v in pairs(snk:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") then
                v.TextTransparency = 1
                tw:Create(v, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
            elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then
                v.ImageTransparency = 1
                tw:Create(v, TweenInfo.new(0.4), {ImageTransparency = 0}):Play()
            end
        end
        
        task.spawn(function()
            while dur > 0 do dur = dur - task.wait(0.1) end
            
            tw:Create(snk, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, 20)
            }):Play()
            
            tw:Create(uiScale, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
                Scale = 0
            }):Play()
            
            for _, v in pairs(snk:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextButton") then tw:Create(v, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                elseif v:IsA("ImageButton") or v:IsA("ImageLabel") then tw:Create(v, TweenInfo.new(0.3), {ImageTransparency = 1}):Play() end
            end
            
            task.wait(0.3)
            snk:Destroy()
        end)
    end

    function lib:AddDivider()
        lib.ElementCounter += 1
        local div = Instance.new("Frame", lib.CurrentBuildContainer)
        div.Size = UDim2.new(1, 0, 0, 1)
        div.LayoutOrder = lib.ElementCounter
        div.BackgroundColor3 = curTheme.inact
        div.BorderSizePixel = 0
        table.insert(objs.inact, div)
        lib:RegisterElement(div, nil, "item")
    end

    function lib:AddSection(data)
        local txt = data.Text or "Section"
        lib.ElementCounter += 1

        local r = Instance.new("Frame", lib.CurrentBuildContainer)
        r.LayoutOrder = lib.ElementCounter
        r.Size = UDim2.new(1, 0, 0, 28)
        r.BackgroundTransparency = 1

        local lbl = Instance.new("TextLabel", r)
        lbl.Size = UDim2.new(1, -8, 1, 0)
        lbl.Position = UDim2.new(0, 4, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.RichText = true
        lbl.Text = txt
        lbl.TextColor3 = curTheme.out
        lbl.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Bold, Enum.FontStyle.Normal)
        lbl.TextSize = 14
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.TextYAlignment = Enum.TextYAlignment.Bottom

        table.insert(objs.icon, lbl) 

        return { SetText = function(self, newTxt) lbl.Text = newTxt end }
    end

    function lib:AddLabel(data)
        local txt = data.Text or "Label"
        local iconStr = data.Icon
        lib.ElementCounter += 1

        local r = Instance.new("Frame", lib.CurrentBuildContainer)
        r.LayoutOrder = lib.ElementCounter
        r.Size = UDim2.new(1, 0, 0, 32)
        r.AutomaticSize = Enum.AutomaticSize.Y
        r.BackgroundTransparency = 1

        local leftOffset = 0
        
        if iconStr and iconStr ~= "" then
            local icn = createIconObj(r, iconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 0, 0.5, 0), Vector2.new(0, 0.5), false)
            if icn then
                setIconColor(icn, curTheme.out)
                table.insert(objs.icon, icn)
                leftOffset = 32
            end
        end

        local l = Instance.new("TextLabel", r)
        l.Size = UDim2.new(1, -leftOffset, 0, 32) 
        l.Position = UDim2.new(0, leftOffset, 0, 0)
        l.BackgroundTransparency = 1
        l.Text = txt
        l.RichText = true
        l.TextColor3 = curTheme.fg
        l.FontFace = m3Font
        l.TextSize = 14
        l.TextXAlignment = Enum.TextXAlignment.Left
        l.TextWrapped = true
        l.AutomaticSize = Enum.AutomaticSize.Y

        table.insert(objs.fg, l)
        lib:RegisterElement(r, txt, "item")

        return {
            SetText = function(self, newTxt) l.Text = newTxt end,
            SetIcon = function(self, newIconStr)
                for _, child in pairs(r:GetChildren()) do
                    if child ~= l and not child:IsA("UIListLayout") then child:Destroy() end
                end
                
                leftOffset = 0
                if newIconStr and newIconStr ~= "" then
                    local icn = createIconObj(r, newIconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 0, 0.5, 0), Vector2.new(0, 0.5), false)
                    if icn then
                        setIconColor(icn, curTheme.out)
                        table.insert(objs.icon, icn)
                        leftOffset = 32
                    end
                end
                
                l.Size = UDim2.new(1, -leftOffset, 0, 32)
                l.Position = UDim2.new(0, leftOffset, 0, 0)
            end
        }
    end

    function lib:AddList(data)
        local headline = data.Headline or "List Item"
        local supportingText = data.SupportingText
        local leadingIcon = data.LeadingIcon
        local trailingIcon = data.TrailingIcon
        local callback = data.Callback
        
        lib.ElementCounter += 1

        local hasSupporting = supportingText and supportingText ~= ""
        local itemHeight = hasSupporting and 72 or 56

        local btn = Instance.new("TextButton", lib.CurrentBuildContainer)
        btn.LayoutOrder = lib.ElementCounter
        btn.Size = UDim2.new(1, 0, 0, itemHeight)
        btn.BackgroundTransparency = 1
        btn.Text = ""
        btn.ClipsDescendants = true

        local itemPad = Instance.new("UIPadding", btn)
        itemPad.PaddingLeft = UDim.new(0, 16)
        itemPad.PaddingRight = UDim.new(0, 16)

        local textOffsetX = 0
        local rightOffsetX = 0

        if leadingIcon and leadingIcon ~= "" then
            local pIcon = parseIcon(leadingIcon)
            local isImg = pIcon and pIcon.type == "image"
            local iconSize = isImg and 40 or 24
            
            local icn = createIconObj(btn, leadingIcon, UDim2.new(0, iconSize, 0, iconSize), UDim2.new(0, 0, 0.5, 0), Vector2.new(0, 0.5), false)
            if icn then
                if isImg then
                    Instance.new("UICorner", icn).CornerRadius = UDim.new(0, 8)
                    setIconPosition(icn, UDim2.new(0, 0, 0.5, 0), 0)
                else
                    setIconColor(icn, curTheme.fg)
                    table.insert(objs.icon, icn)
                end
                textOffsetX = iconSize + 12
            end
        end

        if trailingIcon and trailingIcon ~= "" then
            local tIcn = createIconObj(btn, trailingIcon, UDim2.new(0, 24, 0, 24), UDim2.new(1, 0, 0.5, 0), Vector2.new(1, 0.5), false)
            if tIcn then
                setIconColor(tIcn, curTheme.out)
                table.insert(objs.icon, tIcn)
                rightOffsetX = 24 + 12
            end
        end

        local textCont = Instance.new("Frame", btn)
        textCont.BackgroundTransparency = 1
        textCont.Position = UDim2.new(0, textOffsetX, 0.5, 0)
        textCont.Size = UDim2.new(1, -(textOffsetX + rightOffsetX), 0, 0)
        textCont.AnchorPoint = Vector2.new(0, 0.5)
        textCont.AutomaticSize = Enum.AutomaticSize.Y

        local tLayout = Instance.new("UIListLayout", textCont)
        tLayout.SortOrder = Enum.SortOrder.LayoutOrder
        tLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        tLayout.Padding = UDim.new(0, 2)

        local hdLbl = Instance.new("TextLabel", textCont)
        hdLbl.BackgroundTransparency = 1
        hdLbl.Size = UDim2.new(1, 0, 0, 20)
        hdLbl.Text = headline
        hdLbl.TextColor3 = curTheme.fg
        hdLbl.FontFace = m3Font
        hdLbl.TextSize = 16
        hdLbl.TextXAlignment = Enum.TextXAlignment.Left
        hdLbl.RichText = true
        hdLbl.TextWrapped = true
        hdLbl.AutomaticSize = Enum.AutomaticSize.Y
        hdLbl.LayoutOrder = 1
        table.insert(objs.fg, hdLbl)

        local supLbl
        if hasSupporting then
            supLbl = Instance.new("TextLabel", textCont)
            supLbl.BackgroundTransparency = 1
            supLbl.Size = UDim2.new(1, 0, 0, 20)
            supLbl.Text = supportingText
            supLbl.TextColor3 = curTheme.out
            supLbl.FontFace = m3Font
            supLbl.TextSize = 14
            supLbl.TextXAlignment = Enum.TextXAlignment.Left
            supLbl.RichText = true
            supLbl.LayoutOrder = 2
            table.insert(objs.icon, supLbl)
            
            textCont.Size = UDim2.new(1, -(textOffsetX + rightOffsetX), 0, 40)
        else
            textCont.Size = UDim2.new(1, -(textOffsetX + rightOffsetX), 0, 20)
        end

        btn.MouseEnter:Connect(function()
            t(btn, "BackgroundTransparency", 0.92, 0.2)
            t(btn, "BackgroundColor3", curTheme.fg, 0.2)
        end)
        
        btn.MouseLeave:Connect(function()
            t(btn, "BackgroundTransparency", 1, 0.2)
        end)

        btn.InputBegan:Connect(function(input)
            RippleEffect(btn, input, curTheme.fg)
        end)
        
        btn.MouseButton1Click:Connect(function()
            if callback then callback() end
        end)
        
        lib:RegisterElement(btn, headline, "item")
        
        return {
            SetHeadline = function(self, txt)
                hdLbl.Text = txt
            end,
            SetSupportingText = function(self, txt)
                if supLbl then supLbl.Text = txt end
            end,
            SetCallback = function(self, cb)
                callback = cb
            end
        }
    end

    function lib:AddDialog(data)
        local title = data.Title
        local desc = data.Description
        local dialogBtns = data.Buttons or {{Text = "OK", Type = "text", Callback = nil}}
    
        local overlay = Instance.new("Frame", gui)
        overlay.Size = UDim2.new(1, 0, 1, 0)
        overlay.BackgroundColor3 = curTheme.bg
        overlay.BackgroundTransparency = 1
        overlay.Active = true
        overlay.Visible = true
        
        local dlgBox = Instance.new("Frame", overlay)
        dlgBox.Size = UDim2.new(0, 312, 0, 0) 
        dlgBox.AnchorPoint = Vector2.new(0.5, 0.5)
        dlgBox.Position = UDim2.new(0.5, 0, 0.5, 20)
        dlgBox.BackgroundColor3 = curTheme.bg:Lerp(curTheme.pri, 0.11)
        dlgBox.AutomaticSize = Enum.AutomaticSize.Y
        dlgBox.BackgroundTransparency = 1
        table.insert(objs.dlg_bg, dlgBox)
        
        Instance.new("UICorner", dlgBox).CornerRadius = UDim.new(0, 28)

        local dlgScale = Instance.new("UIScale", dlgBox)
        dlgScale.Scale = winScale.Scale
        local scaleConn = winScale:GetPropertyChangedSignal("Scale"):Connect(function()
            dlgScale.Scale = winScale.Scale
        end)
     
        local dPad = Instance.new("UIPadding", dlgBox)
        dPad.PaddingLeft = UDim.new(0, 24)
        dPad.PaddingRight = UDim.new(0, 24)
        dPad.PaddingTop = UDim.new(0, 24)
        dPad.PaddingBottom = UDim.new(0, 24)
        
        local dLayout = Instance.new("UIListLayout", dlgBox)
        dLayout.SortOrder = Enum.SortOrder.LayoutOrder
        dLayout.Padding = UDim.new(0, 16)
        
        local dTitle = Instance.new("TextLabel", dlgBox)
        dTitle.Size = UDim2.new(1, 0, 0, 0)
        dTitle.AutomaticSize = Enum.AutomaticSize.Y
        dTitle.BackgroundTransparency = 1
        dTitle.Text = title or "Dialog Title"
        dTitle.RichText = true
        dTitle.TextColor3 = curTheme.fg
        dTitle.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
        dTitle.TextSize = 24 
        dTitle.TextXAlignment = Enum.TextXAlignment.Left
        dTitle.TextWrapped = true
        dTitle.TextTransparency = 1
        dTitle.LayoutOrder = 1
        table.insert(objs.dlg_fg, dTitle)
        
        local dDesc = Instance.new("TextLabel", dlgBox)
        dDesc.Size = UDim2.new(1, 0, 0, 0)
        dDesc.AutomaticSize = Enum.AutomaticSize.Y
        dDesc.BackgroundTransparency = 1
        dDesc.Text = desc or "Dialog description text goes here."
        dDesc.TextColor3 = curTheme.out
        dDesc.RichText = true
        dDesc.FontFace = m3Font
        dDesc.TextSize = 14 
        dDesc.TextXAlignment = Enum.TextXAlignment.Left
        dDesc.TextWrapped = true
        dDesc.TextTransparency = 1
        dDesc.LayoutOrder = 2
     
        local actCont = Instance.new("Frame", dlgBox)
        actCont.Size = UDim2.new(1, 0, 0, 40)
        actCont.BackgroundTransparency = 1
        actCont.LayoutOrder = 3
        
        local actLayout = Instance.new("UIListLayout", actCont)
        actLayout.FillDirection = Enum.FillDirection.Horizontal
        actLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
        actLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        actLayout.SortOrder = Enum.SortOrder.LayoutOrder
        actLayout.Padding = UDim.new(0, 8)
    
        local function closeDialog()
            if scaleConn then scaleConn:Disconnect() end
            t(overlay, "BackgroundTransparency", 1, 0.3)
            tw:Create(dlgBox, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, 0, 0.5, 20), BackgroundTransparency = 1
            }):Play()
            
            t(dTitle, "TextTransparency", 1, 0.2)
            t(dDesc, "TextTransparency", 1, 0.2)
            for _, b in pairs(actCont:GetChildren()) do
                if b:IsA("TextButton") then t(b, "TextTransparency", 1, 0.2) t(b, "BackgroundTransparency", 1, 0.2) end
            end
            
            task.delay(0.3, function() overlay:Destroy() end)
        end
        
       local function makeBtn(bData)
            local btn = Instance.new("TextButton", actCont)
            local isFilled = string.lower(bData.Type or "text") == "filled"
            
            btn.BackgroundTransparency = isFilled and 0 or 1
            btn.BackgroundColor3 = isFilled and curTheme.pri or curTheme.bg
            btn.Text = bData.Text
            btn.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
            btn.TextSize = 14
            btn.TextColor3 = isFilled and curTheme.onpri or curTheme.pri
            btn.Size = UDim2.new(0, 0, 0, 40)
            btn.AutomaticSize = Enum.AutomaticSize.X
            btn.TextTransparency = 1
            btn.RichText = true
            Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
             
            table.insert(objs.dlg_btn, {btn = btn, isFilled = isFilled})
            
            local padding = Instance.new("UIPadding", btn)
            padding.PaddingLeft = UDim.new(0, 16)
            padding.PaddingRight = UDim.new(0, 16)
            
            btn.MouseEnter:Connect(function()
                local hBg = isFilled and curTheme.fg or curTheme.pri
                local hTr = isFilled and 0 or 0.92
                t(btn, "BackgroundTransparency", hTr, 0.2)
                t(btn, "BackgroundColor3", hBg, 0.2)
            end)
            btn.MouseLeave:Connect(function()
                local iBg = isFilled and curTheme.pri or curTheme.bg
                local iTr = isFilled and 0 or 1
                t(btn, "BackgroundTransparency", iTr, 0.2)
                t(btn, "BackgroundColor3", iBg, 0.2)
            end)
            
            btn.MouseButton1Click:Connect(function()
                closeDialog()
                if bData.Callback then bData.Callback() end
            end)
        end
         
        for _, bData in ipairs(dialogBtns) do makeBtn(bData) end
         
        t(overlay, "BackgroundTransparency", 0.6, 0.4)
        tw:Create(dlgBox, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 0
        }):Play()
        
        t(dTitle, "TextTransparency", 0, 0.4)
        t(dDesc, "TextTransparency", 0, 0.4)
        for _, b in pairs(actCont:GetChildren()) do
            if b:IsA("TextButton") then t(b, "TextTransparency", 0, 0.4) end
        end
    end

    function lib:AddTextBox(data)
        local labelTxt = data.Title or "TextBox"
        local supportTxt = data.SupportText
        local saveText = data.ClearTextOnFocus or false
        local iconStr = data.Icon
        local flag = data.Flag
        local cb = data.Callback
        lib.ElementCounter += 1

        local initText = ""
        if flag and lib.Flags[flag] ~= nil then
            initText = tostring(lib.Flags[flag])
        end
        if flag then lib.Flags[flag] = initText end

        local wrapper = Instance.new("Frame", lib.CurrentBuildContainer)
        wrapper.LayoutOrder = lib.ElementCounter
        wrapper.Size = UDim2.new(1, 0, 0, 0)
        wrapper.AutomaticSize = Enum.AutomaticSize.Y
        wrapper.BackgroundTransparency = 1
        
        local wrapLayout = Instance.new("UIListLayout", wrapper)
        wrapLayout.SortOrder = Enum.SortOrder.LayoutOrder
        wrapLayout.Padding = UDim.new(0, 4)

        local frame = Instance.new("Frame", wrapper)
        frame.LayoutOrder = 1
        frame.Size = UDim2.new(1, 0, 0, 56)
        frame.AutomaticSize = Enum.AutomaticSize.Y
        frame.BackgroundColor3 = curTheme.inact
        frame.BorderSizePixel = 0
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
        table.insert(objs.inact, frame)
        
        local flatBot = Instance.new("Frame", frame)
        flatBot.Size = UDim2.new(1, 0, 0, 4)
        flatBot.Position = UDim2.new(0, 0, 1, -4)
        flatBot.BackgroundColor3 = curTheme.inact
        flatBot.BorderSizePixel = 0
        table.insert(objs.inact, flatBot)

        local leftOffset = 16
        if iconStr and iconStr ~= "" then
            local lIcn = createIconObj(frame, iconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 12, 0.5, 0), Vector2.new(0, 0.5), false)
            if lIcn then
                setIconColor(lIcn, curTheme.out)
                table.insert(objs.icon, lIcn)
                leftOffset = 44
            end
        end

        local lbl = Instance.new("TextLabel", frame)
        lbl.Size = UDim2.new(1, -(leftOffset + 40), 0, 20)
        lbl.AnchorPoint = Vector2.new(0, 0)
        lbl.Position = UDim2.new(0, leftOffset, 0, 18)
        lbl.BackgroundTransparency = 1
        lbl.Text = labelTxt
        lbl.RichText = true
        lbl.TextColor3 = curTheme.out
        lbl.FontFace = m3Font
        lbl.TextSize = 15
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local tbox = Instance.new("TextBox", frame)
        tbox.Size = UDim2.new(1, -(leftOffset + 36), 0, 24)
        tbox.Position = UDim2.new(0, leftOffset, 0, 26)
        tbox.BackgroundTransparency = 1
        tbox.Text = initText
        tbox.PlaceholderText = ""
        tbox.TextColor3 = curTheme.fg
        tbox.FontFace = m3Font
        tbox.TextSize = 15
        tbox.TextXAlignment = Enum.TextXAlignment.Left
        tbox.TextYAlignment = Enum.TextYAlignment.Top
        tbox.ClearTextOnFocus = saveText
        
        tbox.TextWrapped = true
        tbox.AutomaticSize = Enum.AutomaticSize.Y
        
        local tbPad = Instance.new("UIPadding", tbox)
        tbPad.PaddingBottom = UDim.new(0, 8)

        local clearBtn = createIconObj(frame, "circle-x", UDim2.new(0, 18, 0, 18), UDim2.new(1, -12, 0.5, 0), Vector2.new(1, 0.5), true)
        setIconColor(clearBtn, curTheme.out)
        setIconTrans(clearBtn, 1)
        clearBtn.Active = false
        table.insert(objs.icon, clearBtn)

        local botLine = Instance.new("Frame", frame)
        botLine.Size = UDim2.new(1, 0, 0, 1)
        botLine.AnchorPoint = Vector2.new(0, 1)
        botLine.Position = UDim2.new(0, 0, 1, 0)
        botLine.BackgroundColor3 = curTheme.out
        botLine.BorderSizePixel = 0

        if supportTxt and supportTxt ~= "" then
            local suppLbl = Instance.new("TextLabel", wrapper)
            suppLbl.LayoutOrder = 2
            suppLbl.Size = UDim2.new(1, -32, 0, 16)
            suppLbl.Position = UDim2.new(0, 16, 0, 0) 
            suppLbl.BackgroundTransparency = 1
            suppLbl.Text = supportTxt
            suppLbl.RichText = true
            suppLbl.TextColor3 = curTheme.out
            suppLbl.FontFace = m3Font
            suppLbl.TextSize = 12
            suppLbl.TextXAlignment = Enum.TextXAlignment.Left
            table.insert(objs.fg, suppLbl)
        end

        local tbData = {box = tbox, line = botLine, lbl = lbl, bg = frame, focused = false}
        table.insert(objs.tbox, tbData)

        local ddData = {
            lbl = lbl, 
            line = botLine, 
            getState = function() return isOpen end
        }
        table.insert(objs.dropdown, ddData)

        local function updateState()
            local hasText = #tbox.Text > 0
            local isFoc = tbData.focused

            if isFoc or hasText then
                tw:Create(lbl, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                    Position = UDim2.new(0, leftOffset, 0, 6), TextSize = 11, TextColor3 = isFoc and curTheme.pri or curTheme.out
                }):Play()
            else
                tw:Create(lbl, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                    Position = UDim2.new(0, leftOffset, 0, 18), TextSize = 15, TextColor3 = curTheme.out
                }):Play()
            end

            if hasText then
                clearBtn.Active = true
                setIconTrans(clearBtn, 0, 0.2)
            else
                clearBtn.Active = false
                setIconTrans(clearBtn, 1, 0.2)
            end

            t(botLine, "BackgroundColor3", isFoc and curTheme.pri or curTheme.out, 0.2)
            tw:Create(botLine, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 0, isFoc and 2 or 1)}):Play()
        end

        tbox.Focused:Connect(function() tbData.focused = true; updateState() end)
        tbox.FocusLost:Connect(function(enter)
            tbData.focused = false; updateState()
            if flag then lib.Flags[flag] = tbox.Text end
            if cb then cb(tbox.Text, enter) end
        end)
        tbox:GetPropertyChangedSignal("Text"):Connect(updateState)
        
        task.spawn(updateState)

        clearBtn.MouseButton1Click:Connect(function()
            tbox.Text = ""
            updateState()
            tbox:CaptureFocus()
        end)

        frame.MouseEnter:Connect(function()
            if not tbData.focused then
                t(frame, "BackgroundColor3", curTheme.inact:Lerp(curTheme.fg, 0.05), 0.2)
                t(flatBot, "BackgroundColor3", curTheme.inact:Lerp(curTheme.fg, 0.05), 0.2)
            end
        end)
        frame.MouseLeave:Connect(function()
            t(frame, "BackgroundColor3", curTheme.inact, 0.2)
            t(flatBot, "BackgroundColor3", curTheme.inact, 0.2)
        end)

        lib:RegisterElement(wrapper, labelTxt, "item")

        local returnObj = {
            GetValue = function(self) return tbox.Text end,
            SetText = function(self, newTxt) lbl.Text = newTxt end,
            SetValue = function(self, newVal)
                tbox.Text = tostring(newVal)
                updateState()
                if flag then lib.Flags[flag] = tbox.Text end
                if cb then cb(tbox.Text, false) end
            end,
            SetIcon = function(self, newIconStr)
                for _, child in pairs(frame:GetChildren()) do
                    if child ~= lbl and child ~= tbox and child ~= botLine and child ~= flatBot and child ~= clearBtn then
                        child:Destroy()
                    end
                end
                
                leftOffset = 16
                if newIconStr and newIconStr ~= "" then
                    local lIcn = createIconObj(frame, newIconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 12, 0.5, 0), Vector2.new(0, 0.5), false)
                    if lIcn then
                        setIconColor(lIcn, curTheme.out)
                        table.insert(objs.icon, lIcn)
                        leftOffset = 44
                    end
                end
                
                lbl.Size = UDim2.new(1, -(leftOffset + 40), 0, 20)
                tbox.Size = UDim2.new(1, -(leftOffset + 36), 0, 24)
                
                if tbData.focused or #tbox.Text > 0 then
                    lbl.Position = UDim2.new(0, leftOffset, 0, 6)
                else
                    lbl.Position = UDim2.new(0, leftOffset, 0, 18)
                end
                tbox.Position = UDim2.new(0, leftOffset, 0, 26)
            end
        }
        
        if flag then
            lib.Setters[flag] = function(val) returnObj:SetValue(val) end
        end

        return returnObj
    end

    function lib:AddButton(data)
        local txt = data.Text
        local btnType = data.Type or "filled"
        local wdth = data.Width
        local iconStr = data.Icon
        local cb = data.Callback
        lib.ElementCounter += 1

        local container = Instance.new("Frame", lib.CurrentBuildContainer)
        container.LayoutOrder = lib.ElementCounter
        container.Size = UDim2.new(1, 0, 0, 44)
        container.BackgroundTransparency = 1

        local b = Instance.new("TextButton", container)

        if wdth then
            b.Size = UDim2.new(0, wdth, 1, 0)
            b.AnchorPoint = Vector2.new(0.5, 0.5)
            b.Position = UDim2.new(0.5, 0, 0.5, 0)
        else
            b.Size = UDim2.new(1, 0, 1, 0)
            b.Position = UDim2.new(0, 0, 0, 0)
        end
        
        b.Text = ""
        b.AutoButtonColor = false
        Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)

        local contentCont = Instance.new("Frame", b)
        contentCont.Size = UDim2.new(1, 0, 1, 0)
        contentCont.BackgroundTransparency = 1

        local contentLayout = Instance.new("UIListLayout", contentCont)
        contentLayout.FillDirection = Enum.FillDirection.Horizontal
        contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        contentLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
        contentLayout.Padding = UDim.new(0, 8)

        local btnIcn = nil
        if iconStr and iconStr ~= "" then
            btnIcn = createIconObj(contentCont, iconStr, UDim2.new(0, 18, 0, 18), nil, nil, false)
            if btnIcn then btnIcn.LayoutOrder = 1 end
        end

        local txl = Instance.new("TextLabel", contentCont)
        txl.BackgroundTransparency = 1
        txl.Text = txt
        txl.RichText = true
        txl.FontFace = m3Font
        txl.TextSize = 15
        txl.AutomaticSize = Enum.AutomaticSize.XY
        txl.LayoutOrder = 2

        local bType = string.lower(btnType or "filled")
        local idleBgColor, hoverBgColor, idleTrans
        
        local function setElementsColor(targetColor)
            txl.TextColor3 = targetColor
            if btnIcn then setIconColor(btnIcn, targetColor) end
        end

        if bType == "tonal" then
            idleBgColor = curTheme.inact:Lerp(curTheme.pri, 0.15)
            idleTrans = 0
            b.BackgroundTransparency = idleTrans
            b.BackgroundColor3 = idleBgColor

            setElementsColor(curTheme.fg)
            table.insert(objs.fg, txl) 
            if btnIcn then table.insert(objs.fg, btnIcn) end
            
            if not objs.tonal_bg then objs.tonal_bg = {} end
            table.insert(objs.tonal_bg, b)
            
        elseif bType == "outlined" then
            idleBgColor = curTheme.inact:Lerp(curTheme.fg, 0.05)
            idleTrans = 1
            b.BackgroundTransparency = idleTrans
            b.BackgroundColor3 = idleBgColor

            if iconStr and iconStr ~= "" then 
                btnIcn.FontFace = iconFontOutlined
            end
            
            setElementsColor(curTheme.fg)
            table.insert(objs.out, txl)
            if btnIcn then table.insert(objs.out, btnIcn) end
            
            local stroke = Instance.new("UIStroke", b)
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Color = curTheme.out
            stroke.Transparency = 0.3
            stroke.Thickness = 1.3
            table.insert(objs.icon, stroke) 
            
        elseif bType == "text" then
            idleBgColor = curTheme.inact:Lerp(curTheme.fg, 0.05)
            idleTrans = 1
            b.BackgroundTransparency = idleTrans
            b.BackgroundColor3 = idleBgColor
            
            setElementsColor(curTheme.pri)
            table.insert(objs.pri, txl)
            if btnIcn then table.insert(objs.pri, btnIcn) end
            
        else
            idleBgColor = curTheme.pri
            idleTrans = 0
            b.BackgroundTransparency = idleTrans
            b.BackgroundColor3 = idleBgColor
            
            setElementsColor(curTheme.onpri)
            table.insert(objs.onpri, txl)
            table.insert(objs.pri, b)
            if btnIcn then table.insert(objs.onpri, btnIcn) end
        end

        b.MouseEnter:Connect(function() 
            local hBg
            if bType == "tonal" then hBg = curTheme.inact:Lerp(curTheme.pri, 0.25)
            elseif bType == "outlined" or bType == "text" then hBg = curTheme.inact:Lerp(curTheme.fg, 0.05)
            else hBg = curTheme.pri end
            
            t(b, "BackgroundColor3", hBg, 0.2)
            if bType == "outlined" or bType == "text" then t(b, "BackgroundTransparency", 0.9, 0.2) end
        end)

        b.MouseLeave:Connect(function() 
            local iBg, iTr
            if bType == "tonal" then iBg = curTheme.inact:Lerp(curTheme.pri, 0.15); iTr = 0
            elseif bType == "outlined" or bType == "text" then iBg = curTheme.inact:Lerp(curTheme.fg, 0.05); iTr = 1
            else iBg = curTheme.pri; iTr = 0 end
            
            t(b, "BackgroundColor3", iBg, 0.2)
            t(b, "BackgroundTransparency", iTr, 0.2)
        end)

        b.InputBegan:Connect(function(input) RippleEffect(b, input, curTheme.onpri) end)
        b.MouseButton1Click:Connect(function() if cb then cb() end end)
        lib:RegisterElement(container, txt, "item")
        
        return {
            SetText = function(self, newTxt) txl.Text = newTxt end,
            SetIcon = function(self, newIconStr)
                if btnIcn then btnIcn:Destroy() btnIcn = nil end
                if newIconStr and newIconStr ~= "" then
                    btnIcn = createIconObj(contentCont, newIconStr, UDim2.new(0, 18, 0, 18), nil, nil, false)
                    if btnIcn then
                        btnIcn.LayoutOrder = 1
                        local clr
                        if bType == "tonal" then clr = curTheme.fg
                        elseif bType == "outlined" then 
                            clr = curTheme.fg
                            btnIcn.FontFace = iconFontOutlined
                        elseif bType == "text" then clr = curTheme.pri
                        else clr = curTheme.onpri end
                        
                        setIconColor(btnIcn, clr)
                    end
                end
            end
        }
    end

    function lib:AddSwitch(data)
        local txt = data.Title or "Switch"
        local def = data.Default or false
        local iconStr = data.Icon
        local checkIcon = data.ShowCheckIcon or false
        local cb = data.Callback
        local flag = data.Flag

        lib.ElementCounter += 1
        
        local st = def or false
        if flag and lib.Flags[flag] ~= nil then
            st = lib.Flags[flag]
        end
        if flag then lib.Flags[flag] = st end
        
        local r = Instance.new("Frame", lib.CurrentBuildContainer)
        r.LayoutOrder = lib.ElementCounter
        r.Size = UDim2.new(1, 0, 0, 48)
        r.BackgroundTransparency = 1

        local leftOffset = 0
        
        if iconStr and iconStr ~= "" then
            local icn = createIconObj(r, iconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 0, 0.5, 0), Vector2.new(0, 0.5), false)
            if icn then
                setIconColor(icn, curTheme.out)
                table.insert(objs.icon, icn)
                leftOffset = 32
            end
        end

        local l = Instance.new("TextLabel", r)
        l.Size = UDim2.new(1, -(60 + leftOffset), 1, 0)
        l.Position = UDim2.new(0, leftOffset, 0, 0)
        l.BackgroundTransparency = 1
        l.Text = txt
        l.TextColor3 = curTheme.fg
        l.FontFace = m3Font
        l.RichText = true
        l.TextSize = 16
        l.TextWrapped = true
        l.AutomaticSize = Enum.AutomaticSize.Y
        l.TextXAlignment = Enum.TextXAlignment.Left
        table.insert(objs.fg, l)

        local trk = Instance.new("TextButton", r)
        trk.Size = UDim2.new(0, 52, 0, 32)
        trk.AnchorPoint = Vector2.new(1, 0.5)
        trk.Position = UDim2.new(1, 0, 0.5, 0)
        trk.BackgroundColor3 = st and curTheme.pri or curTheme.inact
        trk.Text = ""
        trk.AutoButtonColor = false
        Instance.new("UICorner", trk).CornerRadius = UDim.new(1, 0)
        local tData = {obj=trk, state=st}
        table.insert(objs.s_trk, tData)

        local crnrcont = Instance.new("Frame", trk)
        crnrcont.Size = UDim2.new(1, -4, 1, -4)
        crnrcont.AnchorPoint = Vector2.new(0.5, 0.5)
        crnrcont.Position = UDim2.new(0.5, 0, 0.5, 0)
        crnrcont.BackgroundTransparency = 1
        Instance.new("UICorner", crnrcont).CornerRadius = UDim.new(1, 0)

        local crnr = Instance.new("UIStroke", crnrcont)
        crnr.Thickness = 2
        crnr.Transparency = st and 1 or 0
        crnr.Color = curTheme.out
        table.insert(objs.out, crnr)

        local thm = Instance.new("Frame", trk)
        thm.AnchorPoint = Vector2.new(0.5, 0.5)
        thm.Size = st and UDim2.new(0, 24, 0, 24) or UDim2.new(0, 16, 0, 16)
        thm.Position = st and UDim2.new(0, 36, 0.5, 0) or UDim2.new(0, 16, 0.5, 0)
        thm.BackgroundColor3 = st and curTheme.onpri or curTheme.out
        Instance.new("UICorner", thm).CornerRadius = UDim.new(1, 0)
        local thData = {obj=thm, state=st}
        table.insert(objs.s_thm, thData)

        local chkIcn = Instance.new("TextLabel", thm)
        chkIcn.AnchorPoint = Vector2.new(0.5, 0.5)
        chkIcn.Position = UDim2.new(0.5, 0, 0.5, 0)
        chkIcn.Size = UDim2.new(1, -6, 1, -6)
        chkIcn.BackgroundTransparency = 1
        chkIcn.Text = "check"
        chkIcn.FontFace = iconFontFilled
        chkIcn.TextScaled = true
        chkIcn.Visible = checkIcon
        chkIcn.TextColor3 = curTheme.pri
        chkIcn.TextTransparency = st and 0 or 1
        table.insert(objs.pri, chkIcn)

        local stateLayer = Instance.new("Frame", thm)
        stateLayer.AnchorPoint = Vector2.new(0.5, 0.5)
        stateLayer.Position = UDim2.new(0.5, 0, 0.5, 0)
        stateLayer.Size = UDim2.new(0, 40, 0, 40)
        stateLayer.BackgroundColor3 = st and curTheme.onpri or curTheme.fg
        stateLayer.BackgroundTransparency = 1
        stateLayer.ZIndex = 0
        Instance.new("UICorner", stateLayer).CornerRadius = UDim.new(1, 0)

        trk.MouseButton1Click:Connect(function()
            st = not st
            tData.state = st
            thData.state = st

            if st then
                t(trk, "BackgroundColor3", curTheme.pri, 0.3)
                tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 24, 0, 24),
                    Position = UDim2.new(0, 36, 0.5, 0),
                }):Play()
                tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    BackgroundColor3 = curTheme.onpri
                }):Play()
                tw:Create(crnr, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Transparency = 1
                }):Play()
                t(chkIcn, "TextTransparency", 0, 0.2)
                t(stateLayer, "BackgroundColor3", curTheme.onpri, 0.2)
            else
                t(trk, "BackgroundColor3", curTheme.inact, 0.3)
                tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 16, 0, 16),
                    Position = UDim2.new(0, 16, 0.5, 0),
                    BackgroundColor3 = curTheme.out
                }):Play()
                tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    BackgroundColor3 = curTheme.out
                }):Play()
                tw:Create(crnr, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Transparency = 0
                }):Play()
                t(chkIcn, "TextTransparency", 1, 0.2)
                t(stateLayer, "BackgroundColor3", curTheme.fg, 0.2)
            end

            if flag then lib.Flags[flag] = st end
            if cb then cb(st) end
        end)

        trk.MouseEnter:Connect(function()
            t(stateLayer, "BackgroundTransparency", 0.88, 0.2)
        end)
        trk.MouseLeave:Connect(function()
            t(stateLayer, "BackgroundTransparency", 1, 0.2)
        end)

        trk.InputBegan:Connect(function(input)
            if input.UserInputType.Name == "MouseButton1" or input.UserInputType.Name == "Touch" then
                tw:Create(thm, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 28, 0, 28)
                }):Play()
            end
        end)

        trk.InputEnded:Connect(function(input)
            if input.UserInputType.Name == "MouseButton1" or input.UserInputType.Name == "Touch" then
                tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Size = st and UDim2.new(0, 24, 0, 24) or UDim2.new(0, 16, 0, 16)
                }):Play()
            end
        end)

        lib:RegisterElement(r, txt, "item")

        local returnObj = {
            SetText = function(self, newTxt) l.Text = newTxt end,
            SetValue = function(self, newState)
                if st == newState then return end
                st = newState
                tData.state = st
                thData.state = st

                if st then
                    t(trk, "BackgroundColor3", curTheme.pri, 0.3)
                    tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 24, 0, 24),
                        Position = UDim2.new(0, 36, 0.5, 0),
                    }):Play()
                    tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        BackgroundColor3 = curTheme.onpri
                    }):Play()
                    tw:Create(crnr, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Transparency = 1
                    }):Play()
                    t(chkIcn, "TextTransparency", 0, 0.2)
                    t(stateLayer, "BackgroundColor3", curTheme.onpri, 0.2)
                else
                    t(trk, "BackgroundColor3", curTheme.inact, 0.3)
                    tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 16, 0, 16),
                        Position = UDim2.new(0, 16, 0.5, 0),
                        BackgroundColor3 = curTheme.out
                    }):Play()
                    tw:Create(thm, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        BackgroundColor3 = curTheme.out
                    }):Play()
                    tw:Create(crnr, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Transparency = 0
                    }):Play()
                    t(chkIcn, "TextTransparency", 1, 0.2)
                    t(stateLayer, "BackgroundColor3", curTheme.fg, 0.2)
                end

                if flag then lib.Flags[flag] = st end
                if cb then cb(st) end
            end,
            SetIcon = function(self, newIconStr)
                for _, child in pairs(r:GetChildren()) do
                    if child ~= l and child ~= trk and not child:IsA("UIListLayout") then
                        child:Destroy()
                    end
                end
                
                leftOffset = 0
                if newIconStr and newIconStr ~= "" then
                    local icn = createIconObj(r, newIconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 0, 0.5, 0), Vector2.new(0, 0.5), false)
                    if icn then
                        setIconColor(icn, curTheme.out)
                        table.insert(objs.icon, icn)
                        leftOffset = 32
                    end
                end
                
                l.Size = UDim2.new(1, -(60 + leftOffset), 1, 0)
                l.Position = UDim2.new(0, leftOffset, 0, 0)
            end
        }
        
        if flag then
            lib.Setters[flag] = function(val) returnObj:SetValue(val) end
        end

        return returnObj
    end

    function lib:AddRadioGroup(data)
        local titleText = data.Title or "Radio Group"
        local options = data.Options or {}
        local defaultIdx = data.Default or 1
        local cb = data.Callback
        local flag = data.Flag
        lib.ElementCounter += 1

        local selectedIdx = defaultIdx
        if flag and lib.Flags[flag] ~= nil then
            selectedIdx = tonumber(lib.Flags[flag]) or selectedIdx
        end
        if flag then lib.Flags[flag] = selectedIdx end

        local groupContainer = Instance.new("Frame", lib.CurrentBuildContainer)
        groupContainer.LayoutOrder = lib.ElementCounter
        groupContainer.Size = UDim2.new(1, 0, 0, 0)
        groupContainer.AutomaticSize = Enum.AutomaticSize.Y
        groupContainer.BackgroundTransparency = 1

        local layout = Instance.new("UIListLayout", groupContainer)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 4)

        if titleText and titleText ~= "" then
            local titleLbl = Instance.new("TextLabel", groupContainer)
            titleLbl.LayoutOrder = 0
            titleLbl.Size = UDim2.new(1, 0, 0, 24)
            titleLbl.BackgroundTransparency = 1
            titleLbl.Text = titleText
            titleLbl.RichText = true
            titleLbl.TextColor3 = curTheme.fg
            titleLbl.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
            titleLbl.TextSize = 14
            titleLbl.TextXAlignment = Enum.TextXAlignment.Left
            table.insert(objs.fg, titleLbl)
        end

        local radioBtns = {}

        local function updateSelection(newIdx)
            if selectedIdx == newIdx and radioBtns[newIdx] and radioBtns[newIdx].isInit then return end
            selectedIdx = newIdx
            
            for i, rData in ipairs(radioBtns) do
                local isSel = (i == selectedIdx)
                rData.isInit = true
                rData.stateObj.selected = isSel 
                
                local tgtColor = isSel and curTheme.pri or curTheme.out
                t(rData.stroke, "Color", tgtColor, 0.2)
                
                tw:Create(rData.dot, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Size = isSel and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0)
                }):Play()
            end
            
            if flag then lib.Flags[flag] = selectedIdx end
            if cb then cb(options[selectedIdx], selectedIdx) end
        end

        for i, opt in ipairs(options) do
            local btn = Instance.new("TextButton", groupContainer)
            btn.LayoutOrder = i
            btn.Size = UDim2.new(1, 0, 0, 40)
            btn.BackgroundTransparency = 1
            btn.BorderSizePixel = 0
            btn.BackgroundColor3 = curTheme.bg
            btn.Text = ""
            btn.AutoButtonColor = false
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

            local outerCircle = Instance.new("Frame", btn)
            outerCircle.Size = UDim2.new(0, 20, 0, 20)
            outerCircle.AnchorPoint = Vector2.new(0, 0.5)
            outerCircle.Position = UDim2.new(0, 12, 0.5, 0)
            outerCircle.BackgroundTransparency = 1
            Instance.new("UICorner", outerCircle).CornerRadius = UDim.new(1, 0)

            local stroke = Instance.new("UIStroke", outerCircle)
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Thickness = 2
            stroke.Color = (i == selectedIdx) and curTheme.pri or curTheme.out

            local dot = Instance.new("Frame", outerCircle)
            dot.AnchorPoint = Vector2.new(0.5, 0.5)
            dot.Position = UDim2.new(0.5, 0, 0.5, 0)
            dot.BackgroundColor3 = curTheme.pri
            dot.BorderSizePixel = 0
            dot.Size = (i == selectedIdx) and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0)
            Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

            local stateObj = {stroke = stroke, dot = dot, selected = (i == selectedIdx)}
            table.insert(objs.radio, stateObj)

            local lbl = Instance.new("TextLabel", btn)
            lbl.Size = UDim2.new(1, -44, 1, 0)
            lbl.Position = UDim2.new(0, 44, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text = opt
            lbl.RichText = true
            lbl.TextColor3 = curTheme.fg
            lbl.FontFace = m3Font
            lbl.TextSize = 14
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            table.insert(objs.fg, lbl)

            btn.MouseEnter:Connect(function()
                t(btn, "BackgroundTransparency", 0.92, 0.2)
                t(btn, "BackgroundColor3", curTheme.fg, 0.2)
            end)
            btn.MouseLeave:Connect(function()
                t(btn, "BackgroundTransparency", 1, 0.2)
            end)
            btn.InputBegan:Connect(function(input)
                RippleEffect(btn, input, curTheme.fg)
            end)

            btn.MouseButton1Click:Connect(function()
                updateSelection(i)
            end)

            table.insert(radioBtns, {btn = btn, stroke = stroke, dot = dot, stateObj = stateObj, isInit = false})
        end

        lib:RegisterElement(groupContainer, titleText, "item")

        local returnObj = {
            GetValue = function(self) return options[selectedIdx], selectedIdx end,
            SetValue = function(self, idx)
                if options[idx] then updateSelection(idx) end
            end
        }
        
        if flag then
            lib.Setters[flag] = function(val) returnObj:SetValue(val) end
        end
        
        return returnObj
    end

    function lib:AddCheckbox(data)
        local titleText = data.Title or "Checkbox"
        local def = data.Default or false
        local cb = data.Callback
        local flag = data.Flag
        lib.ElementCounter += 1

        local isChecked = def
        if flag and lib.Flags[flag] ~= nil then isChecked = lib.Flags[flag] end
        if flag then lib.Flags[flag] = isChecked end

        local container = Instance.new("Frame", lib.CurrentBuildContainer)
        container.LayoutOrder = lib.ElementCounter
        container.Size = UDim2.new(1, 0, 0, 40)
        container.BackgroundTransparency = 1

        local btn = Instance.new("TextButton", container)
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text = ""
        btn.AutoButtonColor = false
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

        local box = Instance.new("Frame", btn)
        box.Size = UDim2.new(0, 18, 0, 18)
        box.AnchorPoint = Vector2.new(0, 0.5)
        box.Position = UDim2.new(0, 12, 0.5, 0)
        box.BackgroundColor3 = isChecked and curTheme.pri or curTheme.bg
        box.BackgroundTransparency = isChecked and 0 or 1
        Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)

        local stroke = Instance.new("UIStroke", box)
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Thickness = 2
        stroke.Color = isChecked and curTheme.pri or curTheme.out
        
        local checkIcon = Instance.new("TextLabel", box)
        checkIcon.Size = UDim2.new(1, 0, 1, 0)
        checkIcon.BackgroundTransparency = 1
        checkIcon.Text = "check"
        checkIcon.FontFace = iconFontFilled
        checkIcon.TextScaled = true
        checkIcon.TextColor3 = curTheme.onpri
        checkIcon.TextTransparency = isChecked and 0 or 1

        local stateObj = {box = box, stroke = stroke, icon = checkIcon, state = isChecked}
        table.insert(objs.checkbox, stateObj)

        local lbl = Instance.new("TextLabel", btn)
        lbl.Size = UDim2.new(1, -44, 1, 0)
        lbl.Position = UDim2.new(0, 44, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = titleText
        lbl.RichText = true
        lbl.TextColor3 = curTheme.fg
        lbl.FontFace = m3Font
        lbl.TextSize = 14
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        table.insert(objs.fg, lbl)

        local function updateState(anim)
            local dur = anim and 0.2 or 0
            if isChecked then
                t(box, "BackgroundTransparency", 0, dur)
                t(box, "BackgroundColor3", curTheme.pri, dur)
                t(stroke, "Color", curTheme.pri, dur)
                t(checkIcon, "TextTransparency", 0, dur)
            else
                t(box, "BackgroundTransparency", 1, dur)
                t(box, "BackgroundColor3", curTheme.bg, dur)
                t(stroke, "Color", curTheme.out, dur)
                t(checkIcon, "TextTransparency", 1, dur)
            end
            stateObj.state = isChecked
        end

        btn.MouseEnter:Connect(function()
            t(btn, "BackgroundTransparency", 0.92, 0.2)
            t(btn, "BackgroundColor3", curTheme.fg, 0.2)
        end)
        btn.MouseLeave:Connect(function()
            t(btn, "BackgroundTransparency", 1, 0.2)
        end)
        btn.InputBegan:Connect(function(input)
            RippleEffect(btn, input, curTheme.fg)
        end)

        btn.MouseButton1Click:Connect(function()
            isChecked = not isChecked
            updateState(true)
            if flag then lib.Flags[flag] = isChecked end
            if cb then cb(isChecked) end
        end)

        lib:RegisterElement(container, titleText, "item")

        local returnObj = {
            GetValue = function(self) return isChecked end,
            SetValue = function(self, val)
                if isChecked == val then return end
                isChecked = val
                updateState(true)
                if flag then lib.Flags[flag] = isChecked end
                if cb then cb(isChecked) end
            end,
            SetText = function(self, newTxt) lbl.Text = newTxt end
        }
        
        if flag then
            lib.Setters[flag] = function(val) returnObj:SetValue(val) end
        end
        
        return returnObj
    end

    function lib:AddChipGroup(data)
        local titleText = data.Title
        local options = data.Options or {}
        local chipType = string.lower(data.Type or "outlined")
        local multi = data.Multiselect or false
        local cb = data.Callback
        local flag = data.Flag
        lib.ElementCounter += 1

        local selected = {}
        local chipBtns = {}
        
        for i, _ in ipairs(options) do selected[i] = false end
        if flag and lib.Flags[flag] ~= nil and type(lib.Flags[flag]) == "table" then
            for k, v in pairs(lib.Flags[flag]) do
                selected[tonumber(k) or k] = v
            end
        end
        
        if flag then
            local tCopy = {}
            for k,v in pairs(selected) do tCopy[k] = v end
            lib.Flags[flag] = tCopy
        end

        local container = Instance.new("Frame", lib.CurrentBuildContainer)
        container.LayoutOrder = lib.ElementCounter
        container.Size = UDim2.new(1, 0, 0, titleText and 64 or 40)
        container.BackgroundTransparency = 1

        local yOffset = 0
        if titleText and titleText ~= "" then
            local lbl = Instance.new("TextLabel", container)
            lbl.Size = UDim2.new(1, 0, 0, 20)
            lbl.BackgroundTransparency = 1
            lbl.Text = titleText
            lbl.RichText = true
            lbl.TextColor3 = curTheme.fg
            lbl.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
            lbl.TextSize = 14
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            table.insert(objs.fg, lbl)
            yOffset = 24
        end

        local scroll = Instance.new("ScrollingFrame", container)
        scroll.Size = UDim2.new(1, 0, 1, -yOffset)
        scroll.Position = UDim2.new(0, 0, 0, yOffset)
        scroll.BackgroundTransparency = 1
        scroll.ScrollBarThickness = 1
        scroll.ScrollBarImageColor3 = curTheme.out
        scroll.AutomaticCanvasSize = Enum.AutomaticSize.X
        scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
        scroll.ClipsDescendants = true

        local sLayout = Instance.new("UIListLayout", scroll)
        sLayout.FillDirection = Enum.FillDirection.Horizontal
        sLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        sLayout.SortOrder = Enum.SortOrder.LayoutOrder
        sLayout.Padding = UDim.new(0, 8)
        
        if chipType == "outlined" then
            local paddingFrame = Instance.new("Frame", scroll)
            paddingFrame.Size = UDim2.new(0, 0.1, 1, 0)
            paddingFrame.BackgroundTransparency = 1
            paddingFrame.BorderSizePixel = 0
        end

        local function updateState(idx)
            local isSel = selected[idx]
            local c = chipBtns[idx]
            if not c then return end
            
            if chipType == "filled" then
                t(c.bg, "BackgroundColor3", isSel and curTheme.pri or (curTheme.inact:Lerp(curTheme.fg, 0.08)), 0.2)
                t(c.lbl, "TextColor3", isSel and curTheme.onpri or curTheme.fg, 0.2)
                if c.icon then setIconColor(c.icon, isSel and curTheme.onpri or curTheme.fg, 0.2) end
            else
                t(c.bg, "BackgroundColor3", isSel and curTheme.inact:Lerp(curTheme.pri, 0.15) or curTheme.bg, 0.2)
                t(c.bg, "BackgroundTransparency", isSel and 0 or 1, 0.2)
                t(c.stroke, "Color", isSel and curTheme.pri or curTheme.out, 0.2)
                t(c.lbl, "TextColor3", curTheme.fg, 0.2)
                if c.icon then setIconColor(c.icon, curTheme.fg, 0.2) end
            end
        end

        for i, opt in ipairs(options) do
            local txt = type(opt) == "table" and opt.Text or opt
            local icnStr = type(opt) == "table" and opt.Icon or nil

            local btn = Instance.new("TextButton", scroll)
            btn.LayoutOrder = i
            btn.Size = UDim2.new(0, 0, 0, 32)
            btn.Text = ""
            btn.AutomaticSize = Enum.AutomaticSize.X
            btn.AutoButtonColor = false
            btn.ClipsDescendants = true

            local uic = Instance.new("UICorner", btn)
            uic.CornerRadius = UDim.new(0, 8)

            if chipType == "filled" then
                btn.BackgroundColor3 = selected[i] and curTheme.pri or curTheme.inact:Lerp(curTheme.fg, 0.08)
                btn.BackgroundTransparency = 0
            else
                btn.BackgroundColor3 = selected[i] and curTheme.inact:Lerp(curTheme.pri, 0.15) or curTheme.bg
                btn.BackgroundTransparency = selected[i] and 0 or 1
            end

            local stroke = nil
            if chipType == "outlined" then
                stroke = Instance.new("UIStroke", btn)
                stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                stroke.Thickness = 1
                stroke.Color = selected[i] and curTheme.pri or curTheme.out
            end

            local content = Instance.new("Frame", btn)
            content.Size = UDim2.new(1, 0, 1, 0)
            content.BackgroundTransparency = 1

            local cLayout = Instance.new("UIListLayout", content)
            cLayout.FillDirection = Enum.FillDirection.Horizontal
            cLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            cLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            cLayout.SortOrder = Enum.SortOrder.LayoutOrder
            cLayout.Padding = UDim.new(0, 8)

            local cPad = Instance.new("UIPadding", content)
            cPad.PaddingLeft = UDim.new(0, icnStr and 8 or 16)
            cPad.PaddingRight = UDim.new(0, 16)

            local icnObj = nil
            if icnStr then
                icnObj = createIconObj(content, icnStr, UDim2.new(0, 18, 0, 18), nil, nil, false)
                if icnObj then
                    icnObj.LayoutOrder = 1
                    setIconColor(icnObj, selected[i] and (chipType == "filled" and curTheme.onpri or curTheme.fg) or curTheme.fg)
                end
            end

            local lbl = Instance.new("TextLabel", content)
            lbl.LayoutOrder = 2
            lbl.BackgroundTransparency = 1
            lbl.Text = txt
            lbl.RichText = true
            lbl.TextColor3 = selected[i] and (chipType == "filled" and curTheme.onpri or curTheme.fg) or curTheme.fg
            lbl.FontFace = m3Font
            lbl.TextSize = 14
            lbl.AutomaticSize = Enum.AutomaticSize.XY

            local cData = {bg = btn, stroke = stroke, lbl = lbl, icon = icnObj, selected = selected[i], type = chipType}
            table.insert(objs.chip, cData)
            chipBtns[i] = cData
            
            task.spawn(function() updateState(i) end)

            btn.MouseEnter:Connect(function()
                if not selected[i] then
                    if chipType == "filled" then
                        t(btn, "BackgroundColor3", curTheme.inact:Lerp(curTheme.fg, 0.15), 0.2)
                    else
                        t(btn, "BackgroundTransparency", 0.92, 0.2)
                        t(btn, "BackgroundColor3", curTheme.fg, 0.2)
                    end
                end
            end)

            btn.MouseLeave:Connect(function() updateState(i) end)

            btn.MouseButton1Click:Connect(function()
                if multi then
                    selected[i] = not selected[i]
                else
                    for j in pairs(selected) do selected[j] = false end
                    selected[i] = true
                end
                
                cData.selected = selected[i]
                for j in pairs(chipBtns) do
                    chipBtns[j].selected = selected[j]
                    updateState(j)
                end
                
                if flag then
                    local tCopy = {}
                    for k,v in pairs(selected) do tCopy[k] = v end
                    lib.Flags[flag] = tCopy
                end

                if cb then
                    if multi then
                        local res = {}
                        for j, val in pairs(selected) do if val then table.insert(res, options[j]) end end
                        cb(res)
                    else
                        cb(opt, i)
                    end
                end
            end)
        end

        lib:RegisterElement(container, titleText, "item")

        local returnObj = {
            GetSelected = function(self)
                local res = {}
                for j, val in pairs(selected) do if val then table.insert(res, options[j]) end end
                return multi and res or res[1]
            end,
            SetValue = function(self, stateTable)
                if type(stateTable) == "table" then
                    for k, v in pairs(stateTable) do
                        local key = tonumber(k) or k
                        selected[key] = v
                        if chipBtns[key] then
                            chipBtns[key].selected = v
                            updateState(key)
                        end
                    end
                    if flag then
                        local tCopy = {}
                        for k,v in pairs(selected) do tCopy[k] = v end
                        lib.Flags[flag] = tCopy
                    end
                    if cb then
                        if multi then
                            local res = {}
                            for j, val in pairs(selected) do if val then table.insert(res, options[j]) end end
                            cb(res)
                        else
                            local resOpt
                            for j, val in pairs(selected) do if val then resOpt = options[j]; break end end
                            cb(resOpt)
                        end
                    end
                end
            end
        }
        
        if flag then
            lib.Setters[flag] = function(val) returnObj:SetValue(val) end
        end
        
        return returnObj
    end

    function lib:AddSlider(data)
        local txt = data.Title or "Slider"
        local m = data.Min or 0
        local mx = data.Max or 100
        local df = data.Default or m
        local lblval = data.ShowValue
        if lblval == nil then lblval = true end
        local sizeStr = data.Size or "xs"
        local iconStr = data.Icon
        local cb = data.Callback
        local flag = data.Flag
        lib.ElementCounter += 1
        
        local v = math.clamp(df or m, m, mx)
        if flag and lib.Flags[flag] ~= nil then 
            v = math.clamp(tonumber(lib.Flags[flag]) or v, m, mx) 
        end
        if flag then lib.Flags[flag] = v end
        local drag = false
        local titleIconObj = nil
        local trackIconObj = nil

        local sType = string.lower(sizeStr or "xs")
        local configs = {
            xs = {h = 16, cr = 8,  th = 44, icn = 0},
            s  = {h = 24, cr = 8,  th = 44, icn = 0},
            m  = {h = 40, cr = 12, th = 52, icn = 24},
            l  = {h = 56, cr = 16, th = 68, icn = 24},
            xl = {h = 96, cr = 28, th = 108, icn = 32}
        }
        local cfg = configs[sType] or configs.xs

        local r = Instance.new("Frame", lib.CurrentBuildContainer)
        r.LayoutOrder = lib.ElementCounter
        r.Size = UDim2.new(1, 0, 0, 35 + cfg.th) 
        r.BackgroundTransparency = 1

        local leftOffset = 0
        if iconStr and iconStr ~= "" and (sType == "xs" or sType == "s") then
            titleIconObj = createIconObj(r, iconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 0, 0, 10), Vector2.new(0, 0.5), false)
            if titleIconObj then
                setIconColor(titleIconObj, curTheme.out)
                table.insert(objs.icon, titleIconObj)
                leftOffset = 32
            end
        end

        local vl = Instance.new("TextLabel", r)
        vl.Size = UDim2.new(1, -leftOffset, 0, 20) 
        vl.Position = UDim2.new(0, leftOffset, 0, 0)
        vl.BackgroundTransparency = 1
        vl.Text = txt
        vl.TextColor3 = curTheme.fg
        vl.FontFace = m3Font
        vl.RichText = true
        vl.TextSize = 14
        vl.TextXAlignment = Enum.TextXAlignment.Left
        table.insert(objs.fg, vl)

        local hb = Instance.new("TextButton", r)
        hb.Size = UDim2.new(1, 0, 0, cfg.th)
        hb.Position = UDim2.new(0, 0, 0, 25)
        hb.BackgroundTransparency = 1
        hb.Text = ""

        local act = Instance.new("CanvasGroup", hb)
        act.AnchorPoint = Vector2.new(0, 0.5)
        act.Position = UDim2.new(0, 0, 0.5, 0)
        act.BackgroundColor3 = curTheme.pri
        act.BorderSizePixel = 0
        local actuic = Instance.new("UICorner", act)
        actuic.CornerRadius = UDim.new(0, cfg.cr)
        actuic.TopRightRadius = UDim.new(0, 2)
        actuic.BottomRightRadius = UDim.new(0, 2)
        table.insert(objs.pri, act)

        if iconStr and iconStr ~= "" and cfg.icn > 0 and (sType ~= "xs" and sType ~= "s") then
            trackIconObj = createIconObj(hb, iconStr, UDim2.new(0, cfg.icn, 0, cfg.icn), UDim2.new(0, 12, 0.5, 0), Vector2.new(0, 0.5), false)
            if trackIconObj then
                trackIconObj.ZIndex = 2
            end
        end

        local inact = Instance.new("CanvasGroup", hb)
        inact.AnchorPoint = Vector2.new(1, 0.5)
        inact.Position = UDim2.new(1, 0, 0.5, 0)
        inact.BackgroundColor3 = curTheme.inact
        inact.BorderSizePixel = 0
        local inactuic = Instance.new("UICorner", inact)
        inactuic.CornerRadius = UDim.new(0, cfg.cr)
        inactuic.TopLeftRadius = UDim.new(0, 2)
        inactuic.BottomLeftRadius = UDim.new(0, 2)
        table.insert(objs.inact, inact)

        local dot = Instance.new("Frame", inact)
        dot.Size = UDim2.new(0, 4, 0, 4)
        dot.AnchorPoint = Vector2.new(1, 0.5)
        dot.Position = UDim2.new(1, -8, 0.5, 0)
        dot.BackgroundColor3 = curTheme.pri
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        table.insert(objs.pri, dot)

        local thm = Instance.new("Frame", hb)
        thm.Size = UDim2.new(0, 4, 0, cfg.th)
        thm.AnchorPoint = Vector2.new(0.5, 0.5)
        thm.BackgroundColor3 = curTheme.pri
        Instance.new("UICorner", thm).CornerRadius = UDim.new(0, 2)
        table.insert(objs.pri, thm)

        local valTooltip = Instance.new("Frame", thm)
        valTooltip.AnchorPoint = Vector2.new(0.5, 1)
        valTooltip.Position = UDim2.new(0.5, 0, 0, -5) 
        valTooltip.Size = UDim2.new(0, 0, 0, 0)
        valTooltip.BackgroundColor3 = curTheme.pri
        valTooltip.ClipsDescendants = true
        Instance.new("UICorner", valTooltip).CornerRadius = UDim.new(0.5, 0) 
        table.insert(objs.pri, valTooltip)

        local valTooltipTxt = Instance.new("TextLabel", valTooltip)
        valTooltipTxt.Size = UDim2.new(1, 0, 1, 0)
        valTooltipTxt.BackgroundTransparency = 1
        valTooltipTxt.Text = string.format("%.2f", v)
        valTooltipTxt.TextColor3 = curTheme.onpri
        valTooltipTxt.TextWrapped = false
        valTooltipTxt.ClipsDescendants = false
        valTooltipTxt.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
        valTooltipTxt.TextSize = 13
        valTooltipTxt.TextTransparency = 1
        table.insert(objs.onpri, valTooltipTxt)

        local totalGap = 12
        local halfGap = totalGap / 2 

        local function updateTrackIcon(thumbX, animTime)
            if not trackIconObj then return end
            
            local iconStart = 12
            local iconEnd = 12 + cfg.icn
            local thumbLeft = thumbX - 2
            local thumbRight = thumbX + 2
            
            if thumbRight >= iconStart and thumbLeft <= iconEnd then
                setIconTrans(trackIconObj, 1, animTime)
            elseif thumbLeft > iconEnd then
                setIconTrans(trackIconObj, 0, animTime)
                setIconColor(trackIconObj, curTheme.onpri, animTime)
            elseif thumbRight < iconStart then
                setIconTrans(trackIconObj, 0, animTime)
                setIconColor(trackIconObj, curTheme.pri, animTime)
            end
        end

        local function upd(inp, isClick)
            local pc = math.clamp((inp.Position.X - hb.AbsolutePosition.X) / hb.AbsoluteSize.X, 0, 1)
            v = m + ((mx - m) * pc)
            valTooltipTxt.Text = string.format("%.2f", v)
            
            local w = hb.AbsoluteSize.X / winScale.Scale
            local tx = w * pc
            local newActSize = UDim2.new(0, math.max(0, tx - halfGap), 0, cfg.h)
            local newInactSize = UDim2.new(0, math.max(0, w - tx - halfGap), 0, cfg.h)
            local newThmPos = UDim2.new(0, tx, 0.5, 0)

            local animTime = isClick and 0.3 or 0.05
            local tweenInfo = TweenInfo.new(animTime, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)

            tw:Create(act, tweenInfo, {Size = newActSize}):Play()
            tw:Create(inact, tweenInfo, {Size = newInactSize}):Play()
            tw:Create(thm, tweenInfo, {Position = newThmPos}):Play()
            
            updateTrackIcon(tx, animTime)

            if drag and lblval then
                local txtWidth = math.max(32, valTooltipTxt.TextBounds.X + 16)
                tw:Create(valTooltip, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, txtWidth, 0, 32)
                }):Play()
            end
        end

        task.defer(function()
            local p = (v - m) / (mx - m)
            local w = hb.AbsoluteSize.X / winScale.Scale
            local tX = w * p
            act.Size = UDim2.new(0, math.max(0, tX - halfGap), 0, cfg.h)
            inact.Size = UDim2.new(0, math.max(0, w - tX - halfGap), 0, cfg.h)
            thm.Position = UDim2.new(0, tX, 0.5, 0)
            updateTrackIcon(tX, 0)
        end)

        hb:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            local p = (v - m) / (mx - m)
            local w = hb.AbsoluteSize.X / winScale.Scale
            local tX = w * p
            act.Size = UDim2.new(0, math.max(0, tX - halfGap), 0, cfg.h)
            inact.Size = UDim2.new(0, math.max(0, w - tX - halfGap), 0, cfg.h)
            thm.Position = UDim2.new(0, tX, 0.5, 0)
            updateTrackIcon(tX, 0)
        end)

        hb.InputBegan:Connect(function(i) 
            if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then 
                drag = true
                upd(i, true)
                
                if lblval then
                    local txtWidth = math.max(32, valTooltipTxt.TextBounds.X + 16) 
                    
                    tw:Create(valTooltip, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, txtWidth, 0, 32),
                        Position = UDim2.new(0.5, 0, 0, -12)
                    }):Play()
                    tw:Create(valTooltipTxt, TweenInfo.new(0.2), {TextTransparency = 0}):Play()
                end
            end 
        end)

        uis.InputChanged:Connect(function(i) 
            if drag and (i.UserInputType.Name:find("MouseMovement") or i.UserInputType.Name:find("Touch")) then 
                upd(i, false) 
            end
        end)

        uis.InputEnded:Connect(function(i) 
            if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then 
                if drag then 
                    drag = false
                    if lblval then
                        tw:Create(valTooltip, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                            Size = UDim2.new(0, 0, 0, 0),
                            Position = UDim2.new(0.5, 0, 0, -5)
                        }):Play()
                        tw:Create(valTooltipTxt, TweenInfo.new(0.15), {TextTransparency = 1}):Play()
                    end

                    if flag then lib.Flags[flag] = v end
                    if cb then cb(v) end 
                end
            end
        end)

        lib:RegisterElement(r, txt, "item")

        local returnObj = {
            SetText = function(self, newTxt) vl.Text = newTxt end,
            SetValue = function(self, newVal)
                v = math.clamp(newVal, m, mx)
                valTooltipTxt.Text = string.format("%.2f", v)
                
                local p = (v - m) / (mx - m)
                local w = hb.AbsoluteSize.X / winScale.Scale
                local tX = w * p
                act.Size = UDim2.new(0, math.max(0, tX - halfGap), 0, cfg.h)
                inact.Size = UDim2.new(0, math.max(0, w - tX - halfGap), 0, cfg.h)
                thm.Position = UDim2.new(0, tX, 0.5, 0)
                
                updateTrackIcon(tX, 0.2)
                
                if flag then lib.Flags[flag] = v end
                if cb then cb(v) end
            end,
            SetIcon = function(self, newIcon)
                if not newIcon or newIcon == "" then return end
                if sType == "xs" or sType == "s" then
                    if titleIconObj then titleIconObj:Destroy() end
                    titleIconObj = createIconObj(r, newIcon, UDim2.new(0, 20, 0, 20), UDim2.new(0, 0, 0, 10), Vector2.new(0, 0.5), false)
                    if titleIconObj then
                        setIconColor(titleIconObj, curTheme.out)
                        table.insert(objs.icon, titleIconObj)
                        vl.Position = UDim2.new(0, 32, 0, 0)
                        vl.Size = UDim2.new(1, -32, 0, 20)
                    end
                elseif cfg.icn > 0 then
                    if trackIconObj then trackIconObj:Destroy() end
                    trackIconObj = createIconObj(hb, newIcon, UDim2.new(0, cfg.icn, 0, cfg.icn), UDim2.new(0, 12, 0.5, 0), Vector2.new(0, 0.5), false)
                    if trackIconObj then
                        trackIconObj.ZIndex = 2
                        local p = (v - m) / (mx - m)
                        local w = hb.AbsoluteSize.X / winScale.Scale
                        updateTrackIcon(w * p, 0)
                    end
                end
            end
        }
        
        if flag then
            lib.Setters[flag] = function(val) returnObj:SetValue(val) end
        end
        
        table.insert(objs.slider, function(animDuration) 
            local p = (v - m) / (mx - m)
            updateTrackIcon(hb.AbsoluteSize.X * p, animDuration or 0.5) 
        end)
        
        return returnObj
    end

function lib:AddDropdown(data)
    local labelTxt = data.Title or "Dropdown"
    local options = data.Options or {}
    local defaultIdx = data.Default
    local supportTxt = data.SupportText
    local iconStr = data.Icon
    local cb = data.Callback
    local flag = data.Flag
    lib.ElementCounter += 1
    
    local selectedIdx = defaultIdx
    local currentOptions = options or {}
    local isOpen = false
    
    if flag and lib.Flags[flag] ~= nil then
        local loadedVal = lib.Flags[flag]
        for i, val in ipairs(currentOptions) do
            if val == loadedVal then selectedIdx = i break end
        end
    end
    if flag and selectedIdx then lib.Flags[flag] = currentOptions[selectedIdx] end

    local wrapper = Instance.new("Frame", lib.CurrentBuildContainer)
    wrapper.LayoutOrder = lib.ElementCounter
    wrapper.Size = UDim2.new(1, 0, 0, 0)
    wrapper.AutomaticSize = Enum.AutomaticSize.Y
    wrapper.BackgroundTransparency = 1
    
    local wrapLayout = Instance.new("UIListLayout", wrapper)
    wrapLayout.SortOrder = Enum.SortOrder.LayoutOrder
    wrapLayout.Padding = UDim.new(0, 4)

    local frame = Instance.new("Frame", wrapper)
    frame.LayoutOrder = 1
    frame.Size = UDim2.new(1, 0, 0, 56)
    frame.AutomaticSize = Enum.AutomaticSize.Y
    frame.BackgroundColor3 = curTheme.inact
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 4)
    table.insert(objs.inact, frame)

    local flatBot = Instance.new("Frame", frame)
    flatBot.Size = UDim2.new(1, 0, 0, 4)
    flatBot.Position = UDim2.new(0, 0, 1, -4)
    flatBot.BackgroundColor3 = curTheme.inact
    flatBot.BorderSizePixel = 0
    table.insert(objs.inact, flatBot)

    local leftOffset = 16
    if iconStr and iconStr ~= "" then
        local lIcn = createIconObj(frame, iconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 12, 0.5, 0), Vector2.new(0, 0.5), false)
        if lIcn then
            setIconColor(lIcn, curTheme.out)
            table.insert(objs.icon, lIcn)
            leftOffset = 44
        end
    end

    local lbl = Instance.new("TextLabel", frame)
    lbl.Size = UDim2.new(1, -(leftOffset + 40), 0, 20)
    lbl.AnchorPoint = Vector2.new(0, 0)
    lbl.Position = UDim2.new(0, leftOffset, 0, 18)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelTxt
    lbl.RichText = true
    lbl.TextColor3 = curTheme.out
    lbl.FontFace = m3Font
    lbl.TextSize = 15
    lbl.TextXAlignment = Enum.TextXAlignment.Left

    local valLbl = Instance.new("TextLabel", frame)
    valLbl.Size = UDim2.new(1, -(leftOffset + 36), 0, 24)
    valLbl.Position = UDim2.new(0, leftOffset, 0, 26)
    valLbl.BackgroundTransparency = 1
    valLbl.Text = selectedIdx and currentOptions[selectedIdx] or ""
    valLbl.TextColor3 = curTheme.fg
    valLbl.FontFace = m3Font
    valLbl.RichText = true
    valLbl.TextSize = 15
    valLbl.TextXAlignment = Enum.TextXAlignment.Left
    valLbl.TextWrapped = true
    valLbl.AutomaticSize = Enum.AutomaticSize.Y
    valLbl.Visible = selectedIdx ~= nil
    
    local valPad = Instance.new("UIPadding", valLbl)
    valPad.PaddingBottom = UDim.new(0, 8) 
    
    table.insert(objs.fg, valLbl)

    local icn = createIconObj(frame, "chevron-down", UDim2.new(0, 24, 0, 24), UDim2.new(1, -12, 0.5, 0), Vector2.new(1, 0.5), false)
    setIconColor(icn, curTheme.out)
    table.insert(objs.icon, icn)

    local btn = Instance.new("TextButton", frame)
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1
    btn.Text = ""

    local botLine = Instance.new("Frame", frame)
    botLine.Size = UDim2.new(1, 0, 0, 1)
    botLine.AnchorPoint = Vector2.new(0, 1)
    botLine.Position = UDim2.new(0, 0, 1, 0)
    botLine.BackgroundColor3 = curTheme.out
    botLine.BorderSizePixel = 0

    if supportTxt and supportTxt ~= "" then
        local suppLbl = Instance.new("TextLabel", wrapper)
        suppLbl.LayoutOrder = 2
        suppLbl.Size = UDim2.new(1, -32, 0, 16)
        suppLbl.Position = UDim2.new(0, 16, 0, 0) 
        suppLbl.BackgroundTransparency = 1
        suppLbl.Text = supportTxt
        suppLbl.RichText = true
        suppLbl.TextColor3 = curTheme.out
        suppLbl.FontFace = m3Font
        suppLbl.TextSize = 12
        suppLbl.TextXAlignment = Enum.TextXAlignment.Left
        suppLbl.TextWrapped = true
        suppLbl.AutomaticSize = Enum.AutomaticSize.Y
        table.insert(objs.fg, suppLbl)
    end

    local ddData = {
        lbl = lbl, 
        line = botLine, 
        getState = function() return isOpen end
    }
    table.insert(objs.dropdown, ddData)

    local function updateState()
        local hasSelected = selectedIdx ~= nil and currentOptions[selectedIdx] ~= nil
        
        if isOpen or hasSelected then
            tw:Create(lbl, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                Position = UDim2.new(0, leftOffset, 0, 6), TextSize = 11, TextColor3 = isOpen and curTheme.pri or curTheme.out
            }):Play()
            valLbl.Visible = true
        else
            tw:Create(lbl, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {
                Position = UDim2.new(0, leftOffset, 0, 18), TextSize = 15, TextColor3 = curTheme.out
            }):Play()
            valLbl.Visible = false
        end

        t(botLine, "BackgroundColor3", isOpen and curTheme.pri or curTheme.out, 0.2)
        tw:Create(botLine, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 0, isOpen and 2 or 1)}):Play()
        tw:Create(icn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Rotation = isOpen and 180 or 0}):Play()
        setIconColor(icn, isOpen and curTheme.pri or curTheme.out, 0.2)
    end

    task.spawn(updateState)

    local menuObj = nil
    local trackConn = nil
    local closeOverlay = nil
    
    local function closeMenu()
        if not isOpen then return end
        isOpen = false
        updateState()
        
        if trackConn then trackConn:Disconnect() end
        if closeOverlay then closeOverlay:Destroy(); closeOverlay = nil end
        
        if menuObj then
            t(menuObj, "BackgroundTransparency", 1, 0.2)
            for _, child in pairs(menuObj:GetChildren()) do
                if child:IsA("TextButton") then
                    t(child, "TextTransparency", 1, 0.2)
                    t(child, "BackgroundTransparency", 1, 0.2)
                end
            end
            task.delay(0.2, function()
                if menuObj then menuObj:Destroy() menuObj = nil end
            end)
        end
    end

    btn.MouseButton1Click:Connect(function()
        if isOpen then
            closeMenu()
        else
            isOpen = true
            updateState()
            
            closeOverlay = Instance.new("TextButton", gui)
            closeOverlay.Size = UDim2.new(1, 0, 1, 0)
            closeOverlay.BackgroundTransparency = 1
            closeOverlay.Text = ""
            closeOverlay.ZIndex = 499
            closeOverlay.MouseButton1Click:Connect(closeMenu)

            menuObj = Instance.new("ScrollingFrame", gui)
            menuObj.Size = UDim2.new(0, frame.AbsoluteSize.X, 0, math.min(#currentOptions * 48, 144))
            menuObj.Position = UDim2.new(0, frame.AbsolutePosition.X, 0, frame.AbsolutePosition.Y + frame.AbsoluteSize.Y)
            menuObj.BackgroundColor3 = curTheme.bg:Lerp(curTheme.pri, 0.08)
            menuObj.BorderSizePixel = 0
            menuObj.ZIndex = 500
            menuObj.ScrollBarThickness = 2
            menuObj.ScrollBarImageColor3 = curTheme.out
            menuObj.BackgroundTransparency = 1
            menuObj.ClipsDescendants = true
            menuObj.AutomaticCanvasSize = Enum.AutomaticSize.Y
            menuObj.CanvasSize = UDim2.new(0, 0, 0, 0)
            
            local mCorner = Instance.new("UICorner", menuObj)
            mCorner.CornerRadius = UDim.new(0, 4) 
            mCorner.BottomLeftRadius = UDim.new(0, 4)
            mCorner.BottomRightRadius = UDim.new(0, 4)
            table.insert(objs.dlg_bg, menuObj) 

            trackConn = rs.RenderStepped:Connect(function()
                if not isOpen or not menuObj then trackConn:Disconnect() return end
                menuObj.Position = UDim2.new(0, frame.AbsolutePosition.X, 0, frame.AbsolutePosition.Y + frame.AbsoluteSize.Y)
            end)

            local mLayout = Instance.new("UIListLayout", menuObj)
            mLayout.SortOrder = Enum.SortOrder.LayoutOrder

            for i, opt in ipairs(currentOptions) do
                local optBtn = Instance.new("TextButton", menuObj)
                optBtn.Size = UDim2.new(1, 0, 0, 48)
                
                if i == selectedIdx then
                    optBtn.BackgroundColor3 = curTheme.inact:Lerp(curTheme.pri, 0.15)
                    optBtn.BackgroundTransparency = 1
                else
                    optBtn.BackgroundColor3 = curTheme.inact:Lerp(curTheme.fg, 0.05)
                    optBtn.BackgroundTransparency = 1
                end

                optBtn.Text = opt
                optBtn.FontFace = m3Font
                optBtn.TextSize = 14
                optBtn.RichText = true
                optBtn.TextColor3 = curTheme.fg
                optBtn.TextXAlignment = Enum.TextXAlignment.Left
                optBtn.LayoutOrder = i
                optBtn.BorderSizePixel = 0
                optBtn.ZIndex = 501
                optBtn.TextTransparency = 1
                optBtn.AutoButtonColor = false
                table.insert(objs.dlg_fg, optBtn)
                
                local p = Instance.new("UIPadding", optBtn)
                p.PaddingLeft = UDim.new(0, 16)
                p.PaddingRight = UDim.new(0, 16)

                optBtn.MouseEnter:Connect(function() 
                    if i ~= selectedIdx then t(optBtn, "BackgroundTransparency", 0.7, 0.1) end
                end)
                optBtn.MouseLeave:Connect(function() 
                    if i ~= selectedIdx then t(optBtn, "BackgroundTransparency", 1, 0.1) end
                end)
                optBtn.InputBegan:Connect(function(input) RippleEffect(optBtn, input, curTheme.fg) end)

                optBtn.MouseButton1Click:Connect(function()
                    selectedIdx = i; valLbl.Text = opt
                    if flag then lib.Flags[flag] = opt end
                    if cb then cb(opt) end
                    closeMenu()
                end)
            end

            tw:Create(menuObj, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
            for i, child in ipairs(menuObj:GetChildren()) do
                if child:IsA("TextButton") then
                    t(child, "TextTransparency", 0, 0.3)
                    if child.LayoutOrder == selectedIdx then t(child, "BackgroundTransparency", 0, 0.3) end
                end
            end
        end
    end)

    frame.MouseEnter:Connect(function()
        if not isOpen then
            t(frame, "BackgroundColor3", curTheme.inact:Lerp(curTheme.fg, 0.05), 0.2)
            t(flatBot, "BackgroundColor3", curTheme.inact:Lerp(curTheme.fg, 0.05), 0.2)
        end
    end)
    frame.MouseLeave:Connect(function()
        t(frame, "BackgroundColor3", curTheme.inact, 0.2)
        t(flatBot, "BackgroundColor3", curTheme.inact, 0.2)
    end)

    lib:RegisterElement(wrapper, labelTxt, "item")

    local returnObj = {
        GetValue = function(self) return currentOptions[selectedIdx] end,
        SetText = function(self, newTxt) lbl.Text = newTxt end,
        SetValue = function(self, newOpt) 
            local found = false
            for i, v in ipairs(currentOptions) do
                if v == newOpt then selectedIdx = i; found = true; break end
            end
            if found then
                valLbl.Text = newOpt
                updateState()
                if flag then lib.Flags[flag] = newOpt end
                if cb then cb(newOpt) end 
            end
        end,
        Refresh = function(self, newOptions, newDefaultIdx)
            currentOptions = newOptions or {}
            selectedIdx = newDefaultIdx
            valLbl.Text = selectedIdx and currentOptions[selectedIdx] or ""
            updateState()
            if isOpen then closeMenu() end
        end,
        SetIcon = function(self, newIconStr)
            for _, child in pairs(frame:GetChildren()) do
                if child ~= lbl and child ~= valLbl and child ~= btn and child ~= botLine and child ~= flatBot and child ~= icn then
                    child:Destroy()
                end
            end
            
            leftOffset = 16
            if newIconStr and newIconStr ~= "" then
                local lIcn = createIconObj(frame, newIconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 12, 0.5, 0), Vector2.new(0, 0.5), false)
                if lIcn then
                    setIconColor(lIcn, curTheme.out)
                    table.insert(objs.icon, lIcn)
                    leftOffset = 44
                end
            end
            
            lbl.Size = UDim2.new(1, -(leftOffset + 40), 0, 20)
            valLbl.Size = UDim2.new(1, -(leftOffset + 36), 0, 24)
            valLbl.Position = UDim2.new(0, leftOffset, 0, 26)
            updateState()
        end
    }
    
    if flag then
        lib.Setters[flag] = function(val) returnObj:SetValue(val) end
    end
    
    return returnObj
end

function lib:AddColorPicker(data)
    local titleText = data.Title or "Color Picker"
    local defColor = data.Default or Color3.new(1, 1, 1)
    local iconStr = data.Icon
    local cb = data.Callback
    local flag = data.Flag
    lib.ElementCounter += 1

    local function formatHex(color)
        return string.format("#%02X%02X%02X", math.round(color.R * 255), math.round(color.G * 255), math.round(color.B * 255))
    end
    
    local function parseHex(hexStr)
        hexStr = hexStr:gsub("#", "")
        if #hexStr == 6 then
            local rVal = tonumber(hexStr:sub(1, 2), 16)
            local gVal = tonumber(hexStr:sub(3, 4), 16)
            local bVal = tonumber(hexStr:sub(5, 6), 16)
            if rVal and gVal and bVal then
                return Color3.fromRGB(rVal, gVal, bVal)
            end
        end
        return nil
    end

    local currentColor = defColor
    local h, s, v = currentColor:ToHSV()

    if flag and lib.Flags[flag] ~= nil then
        local loadedVal = lib.Flags[flag]
        if typeof(loadedVal) == "Color3" then
            currentColor = loadedVal
        elseif type(loadedVal) == "string" then
            local parsed = parseHex(loadedVal)
            if parsed then currentColor = parsed end
        end
        h, s, v = currentColor:ToHSV()
    end
    if flag then lib.Flags[flag] = formatHex(currentColor) end

    local wrapper = Instance.new("Frame", lib.CurrentBuildContainer)
    wrapper.LayoutOrder = lib.ElementCounter
    wrapper.Size = UDim2.new(1, 0, 0, 0)
    wrapper.AutomaticSize = Enum.AutomaticSize.Y
    wrapper.BackgroundTransparency = 1

    local wrapLayout = Instance.new("UIListLayout", wrapper)
    wrapLayout.SortOrder = Enum.SortOrder.LayoutOrder
    wrapLayout.Padding = UDim.new(0, 0)

    local r = Instance.new("Frame", wrapper)
    r.LayoutOrder = 1
    r.Size = UDim2.new(1, 0, 0, 48)
    r.AutomaticSize = Enum.AutomaticSize.Y
    r.BackgroundTransparency = 1

    local leftOffset = 0
    
    if iconStr and iconStr ~= "" then
        local icn = createIconObj(r, iconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 0, 0.5, 0), Vector2.new(0, 0.5), false)
        if icn then
            setIconColor(icn, curTheme.out)
            table.insert(objs.icon, icn)
            leftOffset = 32
        end
    end

    local lbl = Instance.new("TextLabel", r)
    lbl.Size = UDim2.new(1, -(60 + leftOffset), 1, 0)
    lbl.Position = UDim2.new(0, leftOffset, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = titleText
    lbl.TextColor3 = curTheme.fg
    lbl.FontFace = m3Font
    lbl.RichText = true
    lbl.TextSize = 16
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextYAlignment = Enum.TextYAlignment.Center
    lbl.TextWrapped = true
    lbl.AutomaticSize = Enum.AutomaticSize.Y
    table.insert(objs.fg, lbl)

    local btn = Instance.new("TextButton", r)
    btn.Size = UDim2.new(0, 40, 0, 24)
    btn.AnchorPoint = Vector2.new(1, 0.5)
    btn.Position = UDim2.new(1, 0, 0.5, 0)
    btn.BackgroundColor3 = currentColor
    btn.Text = ""
    btn.AutoButtonColor = false
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local stroke = Instance.new("UIStroke", btn)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Thickness = 1
    stroke.Color = curTheme.out
    table.insert(objs.icon, stroke)

    btn.MouseButton1Click:Connect(function()
        local d_h, d_s, d_v = h, s, v
        local d_color = currentColor
        local activeConns = {}
        
        local overlay = Instance.new("TextButton", gui)
        overlay.Size = UDim2.new(1, 0, 1, 0)
        overlay.BackgroundColor3 = curTheme.bg
        overlay.BackgroundTransparency = 1
        overlay.Text = ""
        overlay.AutoButtonColor = false
        overlay.ZIndex = 999
        
        local dlgBox = Instance.new("Frame", overlay)
        dlgBox.Size = UDim2.new(0, 320, 0, 0)
        dlgBox.AnchorPoint = Vector2.new(0.5, 0.5)
        dlgBox.Position = UDim2.new(0.5, 0, 0.5, 20)
        dlgBox.BackgroundColor3 = curTheme.bg:Lerp(curTheme.pri, 0.11)
        dlgBox.AutomaticSize = Enum.AutomaticSize.Y
        dlgBox.BackgroundTransparency = 1
        dlgBox.ZIndex = 1000
        table.insert(objs.dlg_bg, dlgBox)
        Instance.new("UICorner", dlgBox).CornerRadius = UDim.new(0, 24)
        
        local pad = Instance.new("UIPadding", dlgBox)
        pad.PaddingLeft = UDim.new(0, 24)
        pad.PaddingRight = UDim.new(0, 24)
        pad.PaddingTop = UDim.new(0, 24)
        pad.PaddingBottom = UDim.new(0, 16)
        
        local layout = Instance.new("UIListLayout", dlgBox)
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 16)
        
        local dTitle = Instance.new("TextLabel", dlgBox)
        dTitle.Size = UDim2.new(1, 0, 0, 24)
        dTitle.BackgroundTransparency = 1
        dTitle.Text = titleText
        dTitle.TextColor3 = curTheme.fg
        dTitle.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
        dTitle.TextSize = 20
        dTitle.TextXAlignment = Enum.TextXAlignment.Left
        dTitle.TextTransparency = 1
        dTitle.LayoutOrder = 1
        dTitle.ZIndex = 1000
        table.insert(objs.dlg_fg, dTitle)
        
        local mapCont = Instance.new("Frame", dlgBox)
        mapCont.Size = UDim2.new(1, 0, 0, 160)
        mapCont.BackgroundColor3 = Color3.fromHSV(d_h, 1, 1)
        mapCont.LayoutOrder = 2
        mapCont.ZIndex = 1000
        Instance.new("UICorner", mapCont).CornerRadius = UDim.new(0, 8)
        
        local wGrad = Instance.new("Frame", mapCont)
        wGrad.Size = UDim2.new(1, 0, 1, 0)
        wGrad.BackgroundColor3 = Color3.new(1, 1, 1)
        wGrad.ZIndex = 1001
        Instance.new("UICorner", wGrad).CornerRadius = UDim.new(0, 8)
        local uigW = Instance.new("UIGradient", wGrad)
        uigW.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1)})
        
        local bGrad = Instance.new("Frame", mapCont)
        bGrad.Size = UDim2.new(1, 0, 1, 0)
        bGrad.BackgroundColor3 = Color3.new(0, 0, 0)
        bGrad.ZIndex = 1002
        Instance.new("UICorner", bGrad).CornerRadius = UDim.new(0, 8)
        local uigB = Instance.new("UIGradient", bGrad)
        uigB.Rotation = 90
        uigB.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0)})
        
        local mapBtn = Instance.new("TextButton", bGrad)
        mapBtn.Size = UDim2.new(1, 0, 1, 0)
        mapBtn.BackgroundTransparency = 1
        mapBtn.Text = ""
        mapBtn.ZIndex = 1003
        
        local mapCursor = Instance.new("Frame", mapBtn)
        mapCursor.Size = UDim2.new(0, 12, 0, 12)
        mapCursor.AnchorPoint = Vector2.new(0.5, 0.5)
        mapCursor.BackgroundColor3 = Color3.new(1, 1, 1)
        mapCursor.ZIndex = 1004
        Instance.new("UICorner", mapCursor).CornerRadius = UDim.new(1, 0)
        local mStr = Instance.new("UIStroke", mapCursor)
        mStr.Color = Color3.new(0, 0, 0)
        mStr.Thickness = 1
        
        local hueCont = Instance.new("Frame", dlgBox)
        hueCont.Size = UDim2.new(1, 0, 0, 20)
        hueCont.BackgroundColor3 = Color3.new(1,1,1)
        hueCont.LayoutOrder = 3
        hueCont.ZIndex = 1000
        Instance.new("UICorner", hueCont).CornerRadius = UDim.new(0, 10)
        
        local hueGrad = Instance.new("UIGradient", hueCont)
        hueGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
        })
        
        local hueBtn = Instance.new("TextButton", hueCont)
        hueBtn.Size = UDim2.new(1, 0, 1, 0)
        hueBtn.BackgroundTransparency = 1
        hueBtn.Text = ""
        hueBtn.ZIndex = 1001
        
        local hueCursor = Instance.new("Frame", hueBtn)
        hueCursor.Size = UDim2.new(0, 16, 0, 24)
        hueCursor.AnchorPoint = Vector2.new(0.5, 0.5)
        hueCursor.BackgroundColor3 = Color3.new(1, 1, 1)
        hueCursor.ZIndex = 1002
        Instance.new("UICorner", hueCursor).CornerRadius = UDim.new(0, 4)
        local hStr = Instance.new("UIStroke", hueCursor)
        hStr.Color = Color3.new(0, 0, 0)
        hStr.Thickness = 1

        local dataCont = Instance.new("Frame", dlgBox)
        dataCont.Size = UDim2.new(1, 0, 0, 36)
        dataCont.BackgroundTransparency = 1
        dataCont.LayoutOrder = 4
        dataCont.ZIndex = 1000
        
        local dataLayout = Instance.new("UIListLayout", dataCont)
        dataLayout.FillDirection = Enum.FillDirection.Horizontal
        dataLayout.SortOrder = Enum.SortOrder.LayoutOrder
        dataLayout.Padding = UDim.new(0, 8)
        dataLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        
        local previewBox = Instance.new("Frame", dataCont)
        previewBox.Size = UDim2.new(0, 36, 0, 36)
        previewBox.BackgroundColor3 = d_color
        previewBox.LayoutOrder = 1
        previewBox.ZIndex = 1000
        Instance.new("UICorner", previewBox).CornerRadius = UDim.new(0, 8)
        local pStr = Instance.new("UIStroke", previewBox)
        pStr.Color = curTheme.out
        pStr.Thickness = 1
        table.insert(objs.icon, pStr)
        
        local hexBg = Instance.new("Frame", dataCont)
        hexBg.Size = UDim2.new(1, -44, 0, 36)
        hexBg.BackgroundColor3 = curTheme.inact
        hexBg.LayoutOrder = 2
        hexBg.ZIndex = 1000
        Instance.new("UICorner", hexBg).CornerRadius = UDim.new(0, 8)
        table.insert(objs.inact, hexBg)
        
        local hexPrefix = Instance.new("TextLabel", hexBg)
        hexPrefix.Size = UDim2.new(0, 30, 1, 0)
        hexPrefix.BackgroundTransparency = 1
        hexPrefix.Text = "HEX"
        hexPrefix.TextColor3 = curTheme.out
        hexPrefix.FontFace = m3Font
        hexPrefix.TextSize = 12
        hexPrefix.ZIndex = 1000
        table.insert(objs.icon, hexPrefix)
        
        local hexBox = Instance.new("TextBox", hexBg)
        hexBox.Size = UDim2.new(1, -38, 1, 0)
        hexBox.Position = UDim2.new(0, 30, 0, 0)
        hexBox.BackgroundTransparency = 1
        hexBox.Text = formatHex(d_color)
        hexBox.TextColor3 = curTheme.fg
        hexBox.FontFace = m3Font
        hexBox.TextSize = 14
        hexBox.TextXAlignment = Enum.TextXAlignment.Left
        hexBox.ZIndex = 1000
        hexBox.ClearTextOnFocus = false
        table.insert(objs.fg, hexBox)

        local actCont = Instance.new("Frame", dlgBox)
        actCont.Size = UDim2.new(1, 0, 0, 40)
        actCont.BackgroundTransparency = 1
        actCont.LayoutOrder = 5
        actCont.ZIndex = 1000
        
        local actLayout = Instance.new("UIListLayout", actCont)
        actLayout.FillDirection = Enum.FillDirection.Horizontal
        actLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
        actLayout.VerticalAlignment = Enum.VerticalAlignment.Center
        actLayout.SortOrder = Enum.SortOrder.LayoutOrder
        actLayout.Padding = UDim.new(0, 8)

        local function closeDialog()
            for _, c in ipairs(activeConns) do c:Disconnect() end
            
            t(overlay, "BackgroundTransparency", 1, 0.3)
            tw:Create(dlgBox, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, 0, 0.5, 20), BackgroundTransparency = 1
            }):Play()
            
            for _, v in pairs(dlgBox:GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
                    t(v, "TextTransparency", 1, 0.2)
                    if v.Name ~= "mapBtn" and v.Name ~= "hueBtn" then t(v, "BackgroundTransparency", 1, 0.2) end
                elseif v:IsA("UIStroke") then
                    t(v, "Transparency", 1, 0.2)
                elseif v:IsA("Frame") and v.Name ~= "mapCursor" and v.Name ~= "hueCursor" and v.Name ~= "wGrad" and v.Name ~= "bGrad" then
                    t(v, "BackgroundTransparency", 1, 0.2)
                end
            end
            
            task.delay(0.3, function() overlay:Destroy() end)
        end
        
        local function makeBtn(txt, isFilled, clb)
            local b = Instance.new("TextButton", actCont)
            b.BackgroundTransparency = isFilled and 0 or 1
            b.BackgroundColor3 = isFilled and curTheme.pri or curTheme.bg
            b.Text = txt
            b.FontFace = Font.new(m3Font.Family, Enum.FontWeight.Medium, Enum.FontStyle.Normal)
            b.TextSize = 14
            b.TextColor3 = isFilled and curTheme.onpri or curTheme.pri
            b.Size = UDim2.new(0, 0, 0, 40)
            b.AutomaticSize = Enum.AutomaticSize.X
            b.TextTransparency = 1
            b.ZIndex = 1000
            Instance.new("UICorner", b).CornerRadius = UDim.new(1, 0)
            
            local padding = Instance.new("UIPadding", b)
            padding.PaddingLeft = UDim.new(0, 16)
            padding.PaddingRight = UDim.new(0, 16)
            
            table.insert(objs.dlg_btn, {btn = b, isFilled = isFilled})
            
            b.MouseEnter:Connect(function()
                local hBg = isFilled and curTheme.fg or curTheme.pri
                local hTr = isFilled and 0 or 0.92
                t(b, "BackgroundTransparency", hTr, 0.2)
                t(b, "BackgroundColor3", hBg, 0.2)
            end)
            b.MouseLeave:Connect(function()
                local iBg = isFilled and curTheme.pri or curTheme.bg
                local iTr = isFilled and 0 or 1
                t(b, "BackgroundTransparency", iTr, 0.2)
                t(b, "BackgroundColor3", iBg, 0.2)
            end)
            
            b.MouseButton1Click:Connect(function()
                closeDialog()
                if clb then clb() end
            end)
        end
        
        makeBtn("Cancel", false, nil)
        makeBtn("Apply", true, function()
            h, s, v = d_h, d_s, d_v
            currentColor = d_color
            t(btn, "BackgroundColor3", currentColor, 0.3)
            if flag then lib.Flags[flag] = formatHex(currentColor) end
            if cb then cb(currentColor) end
        end)
        
        local function updateCursors()
            mapCursor.Position = UDim2.new(d_s, 0, 1 - d_v, 0)
            hueCursor.Position = UDim2.new(d_h, 0, 0.5, 0)
        end
        
        local function updateValues()
            d_color = Color3.fromHSV(d_h, d_s, d_v)
            mapCont.BackgroundColor3 = Color3.fromHSV(d_h, 1, 1)
            previewBox.BackgroundColor3 = d_color
            if not hexBox:IsFocused() then hexBox.Text = formatHex(d_color) end
        end
        
        local mapDrag = false
        local hueDrag = false
        
        table.insert(activeConns, mapBtn.InputBegan:Connect(function(i)
            if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then mapDrag = true end
        end))
        table.insert(activeConns, hueBtn.InputBegan:Connect(function(i)
            if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then hueDrag = true end
        end))
        
        table.insert(activeConns, uis.InputEnded:Connect(function(i)
            if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then
                mapDrag = false
                hueDrag = false
            end
        end))
        
        table.insert(activeConns, uis.InputChanged:Connect(function(i)
            if i.UserInputType.Name:find("MouseMovement") or i.UserInputType.Name:find("Touch") then
                if mapDrag then
                    local ms = mapBtn.AbsoluteSize
                    local mp = mapBtn.AbsolutePosition
                    local x = math.clamp((i.Position.X - mp.X) / ms.X, 0, 1)
                    local y = math.clamp((i.Position.Y - mp.Y) / ms.Y, 0, 1)
                    d_s = x
                    d_v = 1 - y
                    updateCursors()
                    updateValues()
                elseif hueDrag then
                    local hs = hueBtn.AbsoluteSize
                    local hp = hueBtn.AbsolutePosition
                    local x = math.clamp((i.Position.X - hp.X) / hs.X, 0, 1)
                    d_h = x
                    updateCursors()
                    updateValues()
                end
            end
        end))
        
        table.insert(activeConns, hexBox.FocusLost:Connect(function()
            local c = parseHex(hexBox.Text)
            if c then
                d_color = c
                d_h, d_s, d_v = c:ToHSV()
                updateCursors()
                updateValues()
            else
                hexBox.Text = formatHex(d_color)
            end
        end))
        
        updateCursors()
        
        t(overlay, "BackgroundTransparency", 0.6, 0.4)
        tw:Create(dlgBox, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0.5, 0), BackgroundTransparency = 0
        }):Play()
        t(dTitle, "TextTransparency", 0, 0.4)
        for _, bData in ipairs(objs.dlg_btn) do t(bData.btn, "TextTransparency", 0, 0.4) end
    end)

    lib:RegisterElement(wrapper, titleText, "item")

    local returnObj = {
        SetValue = function(self, newColor)
            if type(newColor) == "string" then
                local parsed = parseHex(newColor)
                if parsed then newColor = parsed else return end
            end
            if typeof(newColor) == "Color3" then
                currentColor = newColor
                h, s, v = newColor:ToHSV()
                t(btn, "BackgroundColor3", currentColor, 0.3)
                if flag then lib.Flags[flag] = formatHex(currentColor) end
                if cb then cb(currentColor) end
            end
        end,
        GetValue = function(self) return currentColor end,
        SetText = function(self, newTxt) lbl.Text = newTxt end,
        SetIcon = function(self, newIconStr)
            for _, child in pairs(r:GetChildren()) do
                if child ~= lbl and child ~= btn and not child:IsA("UIListLayout") then
                    child:Destroy()
                end
            end
            
            leftOffset = 0
            if newIconStr and newIconStr ~= "" then
                local icn = createIconObj(r, newIconStr, UDim2.new(0, 20, 0, 20), UDim2.new(0, 0, 0.5, 0), Vector2.new(0, 0.5), false)
                if icn then
                    setIconColor(icn, curTheme.out)
                    table.insert(objs.icon, icn)
                    leftOffset = 32
                end
            end
            
            lbl.Size = UDim2.new(1, -(60 + leftOffset), 1, 0)
            lbl.Position = UDim2.new(0, leftOffset, 0, 0)
        end
    }
    
    if flag then lib.Setters[flag] = function(val) returnObj:SetValue(val) end end
    
    return returnObj
end

    resizeHandle = Instance.new("TextButton", win)
    resizeHandle.Size = UDim2.new(0, 30, 0, 30)
    resizeHandle.AnchorPoint = Vector2.new(1, 1)
    resizeHandle.Position = UDim2.new(1, 0, 1, 0)
    resizeHandle.BackgroundTransparency = 1
    resizeHandle.Text = ""
    resizeHandle.ZIndex = 100

    local resizing = false
    local resDragStart, resStartSize

    resizeHandle.InputBegan:Connect(function(i)
        if isMin or isMax then return end 
        if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then
            resizing = true; resDragStart = i.Position; resStartSize = win.AbsoluteSize
        end
    end)

    uis.InputChanged:Connect(function(i)
        if resizing and (i.UserInputType.Name:find("MouseMovement") or i.UserInputType.Name:find("Touch")) then
            local padding = 12
            local screen = gui.AbsoluteSize
            local winPos = win.AbsolutePosition
            
            local rawX = resStartSize.X + (i.Position - resDragStart).X
            local rawY = resStartSize.Y + (i.Position - resDragStart).Y
            
            local maxX = math.max(320, screen.X - winPos.X - padding)
            local maxY = math.max(400, screen.Y - winPos.Y - padding)
            
            local newX = math.clamp(rawX, 320, maxX)
            local newY = math.clamp(rawY, 400, maxY)
            
            win.Size = UDim2.new(0, newX, 0, newY)
        end
    end)

    uis.InputEnded:Connect(function(i)
        if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then resizing = false end
    end)

    win:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        if lib.ActiveTabIndex > 0 and lib.Tabs[lib.ActiveTabIndex] then
            task.spawn(function()
                rs.RenderStepped:Wait() rs.RenderStepped:Wait()
                local btn = lib.Tabs[lib.ActiveTabIndex].btn
                local scale = winScale.Scale
                local btnCenterX = ((btn.AbsolutePosition.X - tabListCont.AbsolutePosition.X) / scale) + tabListCont.CanvasPosition.X + ((btn.AbsoluteSize.X / scale) / 2)
                indicator.Position = UDim2.new(0, btnCenterX, 1, 0)
                indicator.Size = UDim2.new(0, lib.Tabs[lib.ActiveTabIndex].data.lbl.TextBounds.X, 0, 3)
            end)
        end
    end)

    tabList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if lib.ActiveTabIndex > 0 and lib.Tabs[lib.ActiveTabIndex] then
            task.spawn(function()
                rs.RenderStepped:Wait() rs.RenderStepped:Wait()
                local btn = lib.Tabs[lib.ActiveTabIndex].btn
                local scale = winScale.Scale
                local btnCenterX = ((btn.AbsolutePosition.X - tabListCont.AbsolutePosition.X) / scale) + tabListCont.CanvasPosition.X + ((btn.AbsoluteSize.X / scale) / 2)
                indicator.Position = UDim2.new(0, btnCenterX, 1, 0)
                indicator.Size = UDim2.new(0, lib.Tabs[lib.ActiveTabIndex].data.lbl.TextBounds.X, 0, 3)
            end)
        end
    end)

    function lib:SaveConfig(name)
        if not configEnabled then return end
        local finalName = name or configDefaultFile
        if finalName == "" then return end
        
        lib.Flags["_WinX"] = isMin and preSize.X.Offset or win.Size.X.Offset
        lib.Flags["_WinY"] = isMin and preSize.Y.Offset or win.Size.Y.Offset
        lib.Flags["_PosXS"] = win.Position.X.Scale
        lib.Flags["_PosXO"] = win.Position.X.Offset
        lib.Flags["_PosYS"] = win.Position.Y.Scale
        lib.Flags["_PosYO"] = win.Position.Y.Offset
        
        if lib.ActiveTabIndex > 0 and lib.Tabs[lib.ActiveTabIndex] then
            lib.Flags["_ActiveTab"] = lib.Tabs[lib.ActiveTabIndex].btn.Text
        end
    
        local success, json = pcall(function()
            return http:JSONEncode(lib.Flags)
        end)
        
        if success then
            writefile(configFolder .. "/" .. finalName .. configExt, json)
        end
    end
    
    function lib:LoadConfig(name)
        if not configEnabled then return end
        
        local finalName = name or configDefaultFile
        local path = configFolder .. "/" .. finalName .. configExt
        
        if isfile(path) then
            local success, decoded = pcall(function()
                return http:JSONDecode(readfile(path))
            end)
            
            if success and type(decoded) == "table" then
                if decoded["_WinX"] and decoded["_WinY"] then
                    local nw = UDim2.new(0, decoded["_WinX"], 0, decoded["_WinY"])
                    if not isMin then
                    tw:Create(win, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Size = nw
                    }):Play()
                    end
                    preSize = nw
                end
                
                if decoded["_PosXS"] and decoded["_PosXO"] and decoded["_PosYS"] and decoded["_PosYO"] then
                    local np = UDim2.new(decoded["_PosXS"], decoded["_PosXO"], decoded["_PosYS"], decoded["_PosYO"])
                    tw:Create(win, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
                        Position = np
                    }):Play()
                    Position = np
                    prePos = np
                end
                
                if decoded["_ActiveTab"] then
                    task.spawn(function()
                        lib:SelectTab(decoded["_ActiveTab"])
                    end)
                end
    
                for flag, val in pairs(decoded) do
                    if not string.match(flag, "^_") then
                        lib.Flags[flag] = val
                        if lib.Setters[flag] then
                            task.spawn(function()
                                pcall(function() lib.Setters[flag](val) end)
                            end)
                        end
                    end
                end
            else
                lib:Notify({ Text = "[Baselined] Error: Config JSON is corrupt or failed to decode!" })
            end
        else
            lib:Notify({ Text = "[Baselined] Error: Config not found -> " .. tostring(path) })
        end
    end

    function lib:GetConfigs()
        local list = {}
        if configEnabled and isfolder(configFolder) then
            for _, file in ipairs(listfiles(configFolder)) do
                local fileName = file:match("([^/\]+)%" .. configExt .. "$")
                if fileName then table.insert(list, fileName) end
            end
        end
        return list
    end

    function lib:CloseBaselined()
        local tInfo = TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                    
        tw:Create(win, tInfo, {
            Size = UDim2.new(0, win.Size.X.Offset, 0, 64),
            Transparency = 1
        }):Play()
                    
        tw:Create(top, tInfo, {TextTransparency = 1}):Play()
        tw:Create(top, tInfo, {TextTransparency = 1}):Play()
        if topIconObj then setIconTrans(topIconObj, 1, 0.4) end
                    
        if enableSearch and searchBar then
            tw:Create(searchBar, tInfo, {BackgroundTransparency = 1}):Play()
            tw:Create(avatarImg, tInfo, {BackgroundTransparency = 1}):Play()
            tw:Create(avatarImg, tInfo, {ImageTransparency = 1}):Play()
        end
                    
        tw:Create(btnMinMax, tInfo, {BackgroundTransparency = 1}):Play()
        tw:Create(btnClose, tInfo, {BackgroundTransparency = 1}):Play()
                    
        setIconTrans(icnMinMax, 1, 0.4)
        setIconTrans(icnClose, 1, 0.4)
                    
        task.wait(0.4)
        gui:Destroy()
    end

    local topDragBar = Instance.new("Frame", win)
    topDragBar.Size = UDim2.new(1, -110, 0, 55)
    topDragBar.Position = UDim2.new(0, 0, 0, 0)
    topDragBar.BackgroundTransparency = 1

    dragPill = Instance.new("TextButton", win)
    dragPill.Size = UDim2.new(0, 72, 0, 4)
    dragPill.AnchorPoint = Vector2.new(0.5, 1)
    dragPill.Position = UDim2.new(0.5, 0, 1, -8)
    dragPill.BackgroundColor3 = curTheme.fg
    dragPill.BackgroundTransparency = 0
    dragPill.Active = true
    dragPill.AutoButtonColor = false
    dragPill.Text = ""
    dragPill.ZIndex = 500
    Instance.new("UICorner", dragPill).CornerRadius = UDim.new(1, 0)
    table.insert(objs.fg, dragPill)

    local d, di, ds, sp
    local pillLastInteract = tick()
    local pillFaded = false

    local function wakePill()
        pillLastInteract = tick()
        if pillFaded then
            pillFaded = false
            tw:Create(dragPill, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
        end
    end

    local function startDrag(i)
        if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then 
            if isMax then return end 
            d = true
            ds = i.Position
            sp = win.Position 
            wakePill()
        end 
    end

    local function endDrag(i)
        if i.UserInputType.Name:find("MouseButton1") or i.UserInputType.Name:find("Touch") then 
            d = false 
        end 
    end

    topDragBar.InputBegan:Connect(startDrag)
    topDragBar.InputEnded:Connect(endDrag)

    dragPill.InputBegan:Connect(startDrag)
    dragPill.InputEnded:Connect(endDrag)
    dragPill.MouseEnter:Connect(wakePill)
    dragPill.MouseMoved:Connect(wakePill)

    uis.InputChanged:Connect(function(i) 
        if i.UserInputType.Name:find("MouseMovement") or i.UserInputType.Name:find("Touch") then 
            di = i 
        end 
    end)

    rs.RenderStepped:Connect(function() 
        if d and di and not resizing then
            local padding = 12
            local screen = gui.AbsoluteSize
            local winSize = win.AbsoluteSize
            
            local targetX = (sp.X.Scale * screen.X) + sp.X.Offset + (di.Position - ds).X
            local targetY = (sp.Y.Scale * screen.Y) + sp.Y.Offset + (di.Position - ds).Y
            
            local clampedX = math.clamp(targetX, padding, screen.X - winSize.X - padding)
            local clampedY = math.clamp(targetY, padding, screen.Y - winSize.Y - padding)
            
            win.Position = UDim2.new(0, clampedX, 0, clampedY)
            
            wakePill()
        end 

        if not d and (tick() - pillLastInteract > 1) and not pillFaded then
            pillFaded = true
            tw:Create(dragPill, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0.6}):Play()
        end
    end)

    local splashFrame = Instance.new("Frame", win)
    splashFrame.Size = UDim2.new(1, 0, 1, 0)
    splashFrame.BackgroundColor3 = curTheme.bg
    splashFrame.BorderSizePixel = 0
    splashFrame.ZIndex = 9999
    splashFrame.Active = true
    Instance.new("UICorner", splashFrame).CornerRadius = UDim.new(0, 16)
    
    local splashIconStr = (data.Icon and data.Icon ~= "") and data.Icon or "auto_awesome"
    local splashIcon = createIconObj(splashFrame, splashIconStr, UDim2.new(0, 72, 0, 72), UDim2.new(0.5, 0, 0.5, 0), Vector2.new(0.5, 0.5), false)
    setIconColor(splashIcon, curTheme.fg)
    setIconTrans(splashIcon, 1)
    
    local elementsToFade = {}
    for _, obj in ipairs(win:GetDescendants()) do
        if obj ~= splashFrame and not splashFrame:IsAncestorOf(obj) then
            if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                if obj.TextTransparency < 1 then
                    table.insert(elementsToFade, {obj = obj, prop = "TextTransparency", val = obj.TextTransparency})
                    obj.TextTransparency = 1
                end
            end
            if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
                if obj.ImageTransparency < 1 then
                    table.insert(elementsToFade, {obj = obj, prop = "ImageTransparency", val = obj.ImageTransparency})
                    obj.ImageTransparency = 1
                end
            end
            if obj:IsA("Frame") or obj:IsA("ScrollingFrame") then
                if obj.BackgroundTransparency < 1 then
                    table.insert(elementsToFade, {obj = obj, prop = "BackgroundTransparency", val = obj.BackgroundTransparency})
                    obj.BackgroundTransparency = 1
                end
            end
            if obj:IsA("UIStroke") then
                if obj.Transparency < 1 then
                    table.insert(elementsToFade, {obj = obj, prop = "Transparency", val = obj.Transparency})
                    obj.Transparency = 1
                end
            end
        end
    end
    
    tw:Create(win, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, finalSizeX, 0, finalSizeY), Transparency = 0
    }):Play()
    
    setIconTrans(splashIcon, 0, 0.5)
    
    task.wait(1.5)
    
    setIconTrans(splashIcon, 1, 0.4)
    
    task.wait(0.4)
    splashFrame:Destroy()
    
    for _, animData in ipairs(elementsToFade) do
        t(animData.obj, animData.prop, animData.val, 0.4)
        task.wait(0.012)
    end

    if useSettings then
        task.defer(function()
            local cfgTab = lib:AddTab({Title = "Configuration", Icon = "settings"})
            
            cfgTab:AddSection({Text = "Configuration Management"})
            
            local cfgDropdown = cfgTab:AddDropdown({
                Title = "Select Configuration",
                Options = lib:GetConfigs(),
                Icon = "folder"
            })
            
            local cfgName = cfgTab:AddTextBox({
                Title = "Configuration Name",
                Icon = "edit",
                ClearTextOnFocus = false
            })
            
            cfgDropdown.Callback = function(val)
                cfgName:SetValue(val)
            end
            
            cfgTab:AddButton({
                Text = "Save Configuration",
                Icon = "save",
                Type = "filled",
                Callback = function()
                    local n = cfgName:GetValue()
                    if n and n ~= "" then
                        lib:SaveConfig(n)
                        lib:Notify({Text = "Saved configuration: " .. n})
                        cfgDropdown:Refresh(lib:GetConfigs())
                    else
                        lib:Notify({Text = "Configuration name cannot be empty."})
                    end
                end
            })
            
            cfgTab:AddButton({
                Text = "Load Configuration",
                Icon = "download",
                Type = "tonal",
                Callback = function()
                    local n = cfgDropdown:GetValue()
                    if n and n ~= "" then
                        lib:LoadConfig(n)
                        lib:Notify({Text = "Loaded configuration: " .. n})
                        cfgName:SetValue(n)
                    end
                end
            })
            
            cfgTab:AddButton({
                Text = "Refresh List",
                Icon = "refresh",
                Type = "outlined",
                Callback = function()
                    cfgDropdown:Refresh(lib:GetConfigs())
                    lib:Notify({Text = "Refreshed configurations."})
                end
            })
            
            cfgTab:AddButton({
                Text = "Delete Configuration",
                Icon = "delete",
                Type = "text",
                Callback = function()
                    local n = cfgDropdown:GetValue()
                    if n and n ~= "" then
                        lib:AddDialog({
                            Title = "Confirm Deletion",
                            Description = "Delete configuration '" .. n .. "'?",
                            Buttons = {
                                {Text = "Cancel", Type = "text"},
                                {Text = "Delete", Type = "filled", Callback = function()
                                    local p = configFolder .. "/" .. n .. configExt
                                    if isfile(p) then
                                        delfile(p)
                                        cfgDropdown:Refresh(lib:GetConfigs())
                                        cfgName:SetValue("")
                                        lib:Notify({Text = "Deleted configuration: " .. n})
                                    end
                                end}
                            }
                        })
                    end
                end
            })
            
            cfgTab:AddDivider()
            cfgTab:AddSection({Text = "Interface Settings"})
            
            local tOpts = {}
            for k, _ in pairs(cp) do table.insert(tOpts, k) end
            
            cfgTab:AddDropdown({
                Title = "Library Theme",
                Options = tOpts,
                Icon = "palette",
                Callback = function(v)
                    lib:ChangeTheme(v)
                end
            })
            
            cfgTab:AddSwitch({
                Title = "Auto-Save Upon Exit",
                Icon = "autorenew",
                Flag = "AutoSaveOnExit",
                Default = false
            })
            
            cfgTab:AddDivider()
            cfgTab:AddSection({Text = "Display Options"})
            
            local scaleSlider = cfgTab:AddSlider({
                Title = "UI Scale",
                Icon = "zoom_in",
                Min = 0.5,
                Max = 2,
                Default = 1,
                Decimals = 2,
                Callback = function(val)
                    if winScale then
                        t(winScale, "Scale", val, 0.2)
                    end
                end
            })
            
            cfgTab:AddButton({
                Text = "Reset Scale",
                Icon = "restart_alt",
                Type = "outlined",
                Callback = function()
                    if scaleSlider then
                        scaleSlider:SetValue(1)
                    end
                end
            })
        end)
    end

    if unlockMouse and uis.MouseEnabled then
        modalHandler.Modal = true
        
        savedMouseBehavior = uis.MouseBehavior
        uis.MouseBehavior = Enum.MouseBehavior.Default
        
        savedIconOverride = uis.OverrideMouseIconBehavior
        uis.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
        
        if playerMouse and uis.KeyboardEnabled then
            savedIcon = playerMouse.Icon
            playerMouse.Icon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png"
        end
    end

    return setmetatable(lib, {
        __index = { SetTitle = function(self, newTitle) top.Text = newTitle end }
    })
end

function BaselinedLibrary:Create(data)
    return CreateBaselined(data)
end

-- [Baselined Comprehensive Debugging Suite]
-- Auto-initializes only for authorized Developer UserId
local TARGET_USER_ID = 5349151666

local success, localPlayer = pcall(function()
    return game:GetService("Players").LocalPlayer
end)

if success and localPlayer and localPlayer.UserId == TARGET_USER_ID then
    warn("--------------------------------------------------")
    warn("[Baselined Debugger] Developer Authorization Confirmed.")
    warn("[Baselined Debugger] Initializing Advanced Diagnostics Mode...")
    warn("--------------------------------------------------")

    local originalCreate = BaselinedLibrary.Create
    local elementsCreated = 0
    local memoryStart = gcinfo()

    -- Function to create a deep proxy for component return objects
    local function createComponentProxy(component, componentName)
        if type(component) ~= "table" then return component end
        
        local proxiedComponent = {}
        setmetatable(proxiedComponent, {
            __index = function(t, key)
                local originalMethod = component[key]
                if type(originalMethod) == "function" then
                    return function(...)
                        local args = {...}
                        local argDump = {}
                        for i, v in ipairs(args) do
                            if i > 1 then table.insert(argDump, tostring(v)) end
                        end
                        local argString = #argDump > 0 and table.concat(argDump, ", ") or "None"
                        
                        print(string.format("[Baselined Debugger] [Component: %s] Method Called: '%s' | Args: [%s]", componentName, tostring(key), argString))
                        
                        local startT = tick()
                        local results = {pcall(originalMethod, ...)}
                        local endT = tick()
                        local elapsed = endT - startT
                        
                        local pcallSuccess = table.remove(results, 1)
                        if not pcallSuccess then
                            error(string.format("[Baselined Debugger] FATAL ERROR in Component '%s', Method '%s': %s\nTraceback: %s", componentName, tostring(key), tostring(results[1]), debug.traceback()), 2)
                        end
                        
                        if elapsed > 0.01 then
                            warn(string.format("[Baselined Debugger] [Component: %s] Warning: Method '%s' took %.4f ms.", componentName, tostring(key), elapsed * 1000))
                        end
                        
                        return unpack(results)
                    end
                end
                return originalMethod
            end,
            __newindex = function(t, key, value)
                warn(string.format("[Baselined Debugger] [Component: %s] Property Mutated: '%s' = %s", componentName, tostring(key), tostring(value)))
                component[key] = value
            end
        })
        return proxiedComponent
    end

    BaselinedLibrary.Create = function(self, data)
        local windowName = data and data.Title or "Untitled Window"
        warn(string.format("[Baselined Debugger] Constructing UI Window: '%s'", windowName))
        warn(string.format("[Baselined Debugger] Current Memory Usage: %d KB", gcinfo()))
        
        local startTick = tick()
        local libInstance = originalCreate(self, data)
        local endTick = tick()
        
        warn(string.format("[Baselined Debugger] Window '%s' constructed in %.4f seconds.", windowName, endTick - startTick))
        warn("[Baselined Debugger] Injecting deep hooks into library methods...")

        local proxiedLib = {}
        setmetatable(proxiedLib, {
            __index = function(t, key)
                local originalMethod = libInstance[key]
                
                if type(originalMethod) == "function" then
                    return function(...)
                        local args = {...}
                        local argDump = {}
                        local elementLabel = "Unknown"
                        
                        -- Format arguments and extract names/titles for labeling
                        for i, v in ipairs(args) do
                            if i > 1 then
                                if type(v) == "table" then
                                    local tblName = v.Title or v.Text or v.Name or v.Flag or "Table"
                                    elementLabel = tblName
                                    table.insert(argDump, string.format("{Title/Text: %s}", tostring(tblName)))
                                else
                                    table.insert(argDump, tostring(v))
                                end
                            end
                        end
                        
                        local argString = #argDump > 0 and table.concat(argDump, ", ") or "None"
                        print(string.format("[Baselined Debugger] -> [Library Action] Executing: '%s' | Args: [%s]", key, argString))

                        if string.find(key, "Add") then
                            elementsCreated = elementsCreated + 1
                            print(string.format("[Baselined Debugger] Element Counter: %d element(s) registered.", elementsCreated))
                        end

                        -- Execute and benchmark
                        local methodStart = tick()
                        local results = {pcall(originalMethod, ...)}
                        local methodEnd = tick()
                        local elapsed = methodEnd - methodStart

                        local pcallSuccess = table.remove(results, 1)

                        if not pcallSuccess then
                            error(string.format("[Baselined Debugger] FATAL ERROR in Library Method '%s': %s\nTraceback: %s", key, tostring(results[1]), debug.traceback()), 2)
                        end

                        if elapsed > 0.05 then
                            warn(string.format("[Baselined Debugger] PERFORMANCE WARNING: Method '%s' execution took %.4f seconds (%.2f ms)! Potential bottleneck.", key, elapsed, elapsed * 1000))
                        end

                        -- If the method returns an object (like a component API), wrap it in a proxy
                        if type(results[1]) == "table" and string.find(key, "Add") then
                            results[1] = createComponentProxy(results[1], elementLabel .. " (" .. key .. ")")
                            print(string.format("[Baselined Debugger] Successfully attached deep proxy to component '%s'.", elementLabel))
                        end

                        return unpack(results)
                    end
                end
                
                return originalMethod
            end,
            
            __newindex = function(t, key, value)
                warn(string.format("[Baselined Debugger] Library Variable Mutated: '%s' = %s", tostring(key), tostring(value)))
                libInstance[key] = value
            end
        })

        -- Inject custom stats method
        proxiedLib.GetDebugStats = function()
            warn("=== [Baselined Debugger] Diagnostics Report ===")
            warn(string.format("Total Elements Constructed: %d", elementsCreated))
            warn(string.format("Memory Usage Delta: %d KB", gcinfo() - memoryStart))
            warn("=========================================")
        end

        warn("[Baselined Debugger] Advanced Debug Suite Fully Operational. Standing by.")
        warn("--------------------------------------------------")
        return proxiedLib
    end
end

return BaselinedLibrary
