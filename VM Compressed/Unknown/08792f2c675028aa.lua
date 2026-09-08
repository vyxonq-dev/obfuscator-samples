local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local CoreGui          = game:GetService("CoreGui")
local Players          = game:GetService("Players")

local Library = {}

-- ==========================================
-- SAVE / LOAD SETTINGS (writefile / readfile)
-- ==========================================
local SAVE_PATH = "WackShop_settings.json"

local function SaveSettings(data)
    pcall(function()
        local encoded = game:GetService("HttpService"):JSONEncode(data)
        writefile(SAVE_PATH, encoded)
    end)
end

local function LoadSettings()
    local ok, result = pcall(function()
        if isfile(SAVE_PATH) then
            return game:GetService("HttpService"):JSONDecode(readfile(SAVE_PATH))
        end
    end)
    return (ok and type(result)=="table") and result or {}
end

local _savedSettings = LoadSettings()


-- ==========================================
-- UTILITIES
-- ==========================================

-- [FIX 1] cancel tween เก่าก่อน play ใหม่ ป้องกันกระตุก
local _tweens = {}
local function Tween(obj, props, t)
    if _tweens[obj] then pcall(function() _tweens[obj]:Cancel() end) end
    local tw = TweenService:Create(obj, TweenInfo.new(t or 0.18, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), props)
    _tweens[obj] = tw
    tw:Play()
end

local function Corner(p, r)  local c = Instance.new("UICorner",p); c.CornerRadius = UDim.new(0,r or 8); return c end
local function Stroke(p,col,th) local s = Instance.new("UIStroke",p); s.Color=col; s.Thickness=th or 1; return s end
local function Padding(p,t,b,l,r) local x=Instance.new("UIPadding",p); x.PaddingTop=UDim.new(0,t or 0); x.PaddingBottom=UDim.new(0,b or 0); x.PaddingLeft=UDim.new(0,l or 0); x.PaddingRight=UDim.new(0,r or 0) end
local function ListLayout(p, pad, axis) local l=Instance.new("UIListLayout",p); l.Padding=UDim.new(0,pad or 6); l.SortOrder=Enum.SortOrder.LayoutOrder; if axis then l.FillDirection=axis end; return l end

-- [FIX 2] MakeDraggable — ใช้ UserInputService.InputEnded แทน i.Changed
-- ป้องกัน connection leak ที่สะสมทุกครั้งที่กดเมาส์
local function MakeDraggable(frame, handle)
    local dragging, dragStart, startPos = false, nil, nil
    handle.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = i.Position; startPos = frame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local d = i.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset+d.X, startPos.Y.Scale, startPos.Y.Offset+d.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

-- HSV → RGB
local function HSVtoRGB(h,s,v)
    local r,g,b
    local i=math.floor(h*6); local f=h*6-i; local p=v*(1-s); local q=v*(1-f*s); local t2=v*(1-(1-f)*s)
    i=i%6
    if i==0 then r,g,b=v,t2,p elseif i==1 then r,g,b=q,v,p elseif i==2 then r,g,b=p,v,t2
    elseif i==3 then r,g,b=p,q,v elseif i==4 then r,g,b=t2,p,v elseif i==5 then r,g,b=v,p,q end
    return Color3.new(r,g,b)
end

-- ==========================================
-- THEME (mutable)
-- ==========================================

local Theme = {
    BG       = Color3.fromRGB(12,12,18),
    Surface  = Color3.fromRGB(20,20,30),
    Surface2 = Color3.fromRGB(28,28,42),
    Accent   = Color3.fromRGB(0,195,255),
    Text     = Color3.fromRGB(235,235,245),
    TextDim  = Color3.fromRGB(120,120,145),
    Border   = Color3.fromRGB(45,45,68),
}

-- ==========================================
-- LIBRARY: NewWindow
-- ==========================================

function Library:NewWindow(config)
    config = config or {}
    local title    = config.Title    or "WackShop"
    local subtitle = config.Subtitle or "Premium"
    local cam = workspace.CurrentCamera
    if not cam then cam = workspace:WaitForChild("Camera", 10) end
    local VP = cam.ViewportSize
    local waited = 0
    while VP.X == 0 and waited < 5 do
        task.wait(0.1); waited += 0.1
        VP = workspace.CurrentCamera.ViewportSize
    end

    local W     = config.Width  or math.clamp(math.floor(VP.X * 0.88), 280, 650)
    local H     = config.Height or math.clamp(math.floor(VP.Y * 0.68), 260, 480)
    local SideW = 140

    local SG = Instance.new("ScreenGui")
    SG.Name = "WackShopUI"
    SG.ResetOnSpawn = false
    SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SG.IgnoreGuiInset = false
    pcall(function() SG.Parent = game:GetService("CoreGui") end)
    if not SG.Parent or SG.Parent == nil then
        SG.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end

    -- Shadow
    local Shadow = Instance.new("Frame", SG)
    Shadow.Name = "Shadow"
    Shadow.Size = UDim2.new(0, W+14, 0, H+14)
    Shadow.Position = UDim2.new(0.5, -(W/2)-7, 0.5, -(H/2)-7)
    Shadow.BackgroundColor3 = Color3.new(0,0,0)
    Shadow.BackgroundTransparency = 0.6
    Shadow.BorderSizePixel = 0
    Shadow.ZIndex = 0
    Corner(Shadow, 16)

    -- Main
    local FBtnStroke
    local Main = Instance.new("Frame", SG)
    Main.Name = "Main"
    Main.Size = UDim2.new(0, W, 0, H)
    Main.Position = UDim2.new(0.5, -W/2, 0.5, -H/2)
    Main.BackgroundColor3 = Theme.BG
    Main.BorderSizePixel = 0
    Main.ClipsDescendants = true
    Main.ZIndex = 1
    Corner(Main, 14)
    Stroke(Main, Theme.Border, 1)

    -- TITLE BAR
    local TBar = Instance.new("Frame",Main)
    TBar.Size=UDim2.new(1,0,0,46); TBar.BackgroundColor3=Theme.Surface; TBar.BorderSizePixel=0; TBar.ZIndex=2
    Corner(TBar,14)

    local ALine = Instance.new("Frame",TBar)
    ALine.Size=UDim2.new(1,0,0,2); ALine.Position=UDim2.new(0,0,1,-2); ALine.BackgroundColor3=Theme.Accent; ALine.BorderSizePixel=0; ALine.ZIndex=3
    local ALG=Instance.new("UIGradient",ALine)
    ALG.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,195,255)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(130,80,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(0,195,255))})

    local Dot=Instance.new("Frame",TBar); Dot.Size=UDim2.new(0,8,0,8); Dot.Position=UDim2.new(0,14,0.5,-4); Dot.BackgroundColor3=Theme.Accent; Dot.BorderSizePixel=0; Dot.ZIndex=3; Corner(Dot,4)

    local TitleLbl=Instance.new("TextLabel",TBar)
    TitleLbl.Size=UDim2.new(0,220,0,22); TitleLbl.Position=UDim2.new(0,28,0,8)
    TitleLbl.BackgroundTransparency=1; TitleLbl.Text=title; TitleLbl.TextColor3=Theme.Text
    TitleLbl.Font=Enum.Font.GothamBold; TitleLbl.TextSize=15; TitleLbl.TextXAlignment=Enum.TextXAlignment.Left; TitleLbl.ZIndex=3

    local SubLbl=Instance.new("TextLabel",TBar)
    SubLbl.Size=UDim2.new(0,220,0,14); SubLbl.Position=UDim2.new(0,28,0,28)
    SubLbl.BackgroundTransparency=1; SubLbl.Text=subtitle; SubLbl.TextColor3=Theme.TextDim
    SubLbl.Font=Enum.Font.Gotham; SubLbl.TextSize=11; SubLbl.TextXAlignment=Enum.TextXAlignment.Left; SubLbl.ZIndex=3

    local VPLbl=Instance.new("TextLabel",TBar)
    VPLbl.Size=UDim2.new(0,180,1,0); VPLbl.Position=UDim2.new(0.5,-90,0,0)
    VPLbl.BackgroundTransparency=1
    VPLbl.Text=string.format("🖥  %d × %d", VP.X, VP.Y)
    VPLbl.TextColor3=Theme.TextDim; VPLbl.Font=Enum.Font.GothamSemibold; VPLbl.TextSize=11; VPLbl.ZIndex=3

    -- ปุ่มปิด: วงกลมแดง + กากบาทขาว 2 เส้น Frame ไม่มี TextButton เลย
    local CloseBg = Instance.new("Frame", TBar)
    CloseBg.Size = UDim2.new(0,28,0,28)
    CloseBg.Position = UDim2.new(1,-38,0.5,-14)
    CloseBg.BackgroundColor3 = Color3.fromRGB(255,50,50)
    CloseBg.BorderSizePixel = 0
    CloseBg.ZIndex = 4
    Corner(CloseBg, 14)

    local L1 = Instance.new("Frame", CloseBg)
    L1.AnchorPoint = Vector2.new(0.5,0.5)
    L1.Size = UDim2.new(0,16,0,3)
    L1.Position = UDim2.new(0.5,0,0.5,0)
    L1.BackgroundColor3 = Color3.new(1,1,1)
    L1.BorderSizePixel = 0
    L1.Rotation = 45
    L1.ZIndex = 5
    Corner(L1,2)

    local L2 = Instance.new("Frame", CloseBg)
    L2.AnchorPoint = Vector2.new(0.5,0.5)
    L2.Size = UDim2.new(0,16,0,3)
    L2.Position = UDim2.new(0.5,0,0.5,0)
    L2.BackgroundColor3 = Color3.new(1,1,1)
    L2.BorderSizePixel = 0
    L2.Rotation = -45
    L2.ZIndex = 5
    Corner(L2,2)

    local CloseBtn = Instance.new("ImageButton", CloseBg)
    CloseBtn.Size = UDim2.new(1,0,1,0)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Image = ""
    CloseBtn.ZIndex = 6
    CloseBtn.AutoButtonColor = false
    CloseBtn.Selectable = false

    CloseBg.MouseEnter:Connect(function()
        Tween(CloseBg,{BackgroundColor3=Color3.fromRGB(255,80,80)},0.1)
    end)
    CloseBg.MouseLeave:Connect(function()
        Tween(CloseBg,{BackgroundColor3=Color3.fromRGB(255,50,50)},0.1)
    end)

    -- BODY
    local Body=Instance.new("Frame",Main)
    Body.Size=UDim2.new(1,0,1,-36); Body.Position=UDim2.new(0,0,0,36)
    Body.BackgroundTransparency=1; Body.ZIndex=1

    local Sidebar=Instance.new("Frame",Body)
    Sidebar.Size=UDim2.new(0,SideW,1,0)
    Sidebar.BackgroundColor3=Color3.fromRGB(14,14,22)
    Sidebar.BorderSizePixel=0; Sidebar.ZIndex=2
    local SideGrad=Instance.new("UIGradient",Sidebar)
    SideGrad.Rotation=0
    SideGrad.Color=ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(18,18,30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(12,12,18)),
    })

    local SB=Instance.new("Frame",Sidebar)
    SB.Size=UDim2.new(0,1,1,0); SB.Position=UDim2.new(1,-1,0,0)
    SB.BackgroundColor3=Theme.Accent; SB.BorderSizePixel=0; SB.ZIndex=3
    SB.BackgroundTransparency=0.7
    local SBG=Instance.new("UIGradient",SB)
    SBG.Rotation=90
    SBG.Transparency=NumberSequence.new({
        NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.3,0.5),
        NumberSequenceKeypoint.new(0.7,0.5),NumberSequenceKeypoint.new(1,1),
    })

    local Brand=Instance.new("Frame",Sidebar)
    Brand.Size=UDim2.new(1,0,0,48); Brand.BackgroundTransparency=1; Brand.ZIndex=3

    local BrandIcon=Instance.new("TextLabel",Brand)
    BrandIcon.Size=UDim2.new(1,0,0,26); BrandIcon.Position=UDim2.new(0,0,0,8)
    BrandIcon.BackgroundTransparency=1; BrandIcon.Text="⚡"; BrandIcon.ZIndex=4
    BrandIcon.Font=Enum.Font.GothamBold; BrandIcon.TextSize=20
    BrandIcon.TextColor3=Theme.Accent

    local BrandLine=Instance.new("Frame",Sidebar)
    BrandLine.Size=UDim2.new(0.7,0,0,1); BrandLine.Position=UDim2.new(0.15,0,0,48)
    BrandLine.BackgroundColor3=Theme.Accent; BrandLine.BorderSizePixel=0; BrandLine.ZIndex=3
    BrandLine.BackgroundTransparency=0.6
    local BLG=Instance.new("UIGradient",BrandLine)
    BLG.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(0.5,0),NumberSequenceKeypoint.new(1,1)})

    local SideList=Instance.new("Frame",Sidebar)
    SideList.Size=UDim2.new(1,0,1,-56); SideList.Position=UDim2.new(0,0,0,56)
    SideList.BackgroundTransparency=1; SideList.ZIndex=2
    ListLayout(SideList,3)
    Padding(SideList,6,6,6,6)

    local ContentArea=Instance.new("Frame",Body)
    ContentArea.Size=UDim2.new(1,-(SideW+1),1,0); ContentArea.Position=UDim2.new(0,SideW+1,0,0)
    ContentArea.BackgroundTransparency=1; ContentArea.ZIndex=2

    -- FLOATING TOGGLE
    local FBtn=Instance.new("TextButton",SG)
    FBtn.Size=UDim2.new(0,48,0,48)
    FBtn.Position=UDim2.new(0,12,0,72)  -- [FIX] เลื่อนลงนิดให้พ้น TopBar ของ Roblox
    FBtn.BackgroundColor3=Theme.Surface; FBtn.Text="W"; FBtn.TextColor3=Theme.Accent
    FBtn.Font=Enum.Font.GothamBold; FBtn.TextSize=20; FBtn.ZIndex=10
    FBtn.AutoButtonColor=false  -- ป้องกัน Roblox เปลี่ยนสีอัตโนมัติ
    FBtn.Selectable=false       -- [FIX] ลบกรอบ focus สีเหลืองออก
    Corner(FBtn,24); FBtnStroke=Stroke(FBtn,Theme.Accent,1.5)

    -- [FIX 3] SetVisible — ไม่ใช้ task.wait() ใน callback (deadlock)
    -- ใช้ task.delay แทน + guard flag กัน double-click
    local visible = true
    local animBusy = false
    local function SetVisible(v)
        if animBusy then return end
        animBusy = true
        visible = v
        if v then
            Main.Visible = true; Shadow.Visible = true
            Main.Size = UDim2.new(0,W,0,0)
            Tween(Main, {Size=UDim2.new(0,W,0,H)}, 0.22)
            task.delay(0.23, function() animBusy = false end)
        else
            Tween(Main, {Size=UDim2.new(0,W,0,0)}, 0.18)
            task.delay(0.2, function()
                Main.Visible = false; Shadow.Visible = false
                animBusy = false
            end)
        end
    end
    FBtn.MouseButton1Click:Connect(function() SetVisible(not visible) end)
    CloseBtn.MouseButton1Click:Connect(function() SG:Destroy() end)

    MakeDraggable(Main,TBar); MakeDraggable(Shadow,TBar); MakeDraggable(FBtn,FBtn)

    -- [FIX 4] SyncShadow — throttle ด้วย dirty flag + RenderStepped
    -- แทนการ fire ทุก property change (ชน tween animation)
    local shadowDirty = true
    Main:GetPropertyChangedSignal("Position"):Connect(function() shadowDirty = true end)
    Main:GetPropertyChangedSignal("Size"):Connect(function() shadowDirty = true end)
    RunService.RenderStepped:Connect(function()
        if not shadowDirty then return end
        shadowDirty = false
        local p = Main.Position; local s = Main.AbsoluteSize
        Shadow.Position = UDim2.new(p.X.Scale, p.X.Offset-9, p.Y.Scale, p.Y.Offset-9)
        Shadow.Size = UDim2.new(0, s.X+18, 0, s.Y+18)
    end)

    -- TAB SYSTEM
    local Tabs = {}
    local WindowAPI = {}

    local function DeactivateAll()
        for _,t in pairs(Tabs) do
            Tween(t.Btn,{BackgroundTransparency=1},0.18)
            Tween(t.NameLbl,{TextColor3=Theme.TextDim},0.18)
            Tween(t.IconLbl,{TextColor3=Theme.TextDim},0.18)
            t.Bar.Visible=false; t.Content.Visible=false
            if t.Glow then t.Glow.Visible=false end
            if t.Dot2 then Tween(t.Dot2,{BackgroundTransparency=1},0.18) end
        end
    end

    function WindowAPI:NewTab(name, icon)
        icon = icon or "📄"

        local TabBtn=Instance.new("TextButton",SideList)
        TabBtn.Size=UDim2.new(1,0,0,38)
        TabBtn.BackgroundColor3=Color3.fromRGB(0,80,120)
        TabBtn.BackgroundTransparency=1; TabBtn.Text=""
        TabBtn.AutoButtonColor=false; TabBtn.Selectable=false; TabBtn.ZIndex=3
        Corner(TabBtn,10)

        local GlowBG=Instance.new("Frame",TabBtn)
        GlowBG.Size=UDim2.new(1,0,1,0)
        GlowBG.BackgroundColor3=Theme.Accent
        GlowBG.BackgroundTransparency=0.88
        GlowBG.BorderSizePixel=0; GlowBG.ZIndex=3; GlowBG.Visible=false
        Corner(GlowBG,10)

        local Bar=Instance.new("Frame",TabBtn)
        Bar.Size=UDim2.new(0,3,0.6,0); Bar.Position=UDim2.new(0,0,0.2,0)
        Bar.BackgroundColor3=Theme.Accent; Bar.BorderSizePixel=0; Bar.Visible=false; Bar.ZIndex=5
        Corner(Bar,2)
        local BarG=Instance.new("UIGradient",Bar); BarG.Rotation=90
        BarG.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,195,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(130,80,255))})

        local IconL=Instance.new("TextLabel",TabBtn)
        IconL.Size=UDim2.new(0,26,1,0); IconL.Position=UDim2.new(0,10,0,0)
        IconL.BackgroundTransparency=1; IconL.Text=icon; IconL.TextColor3=Theme.TextDim
        IconL.Font=Enum.Font.Gotham; IconL.TextSize=15; IconL.ZIndex=5

        local NameL=Instance.new("TextLabel",TabBtn)
        NameL.Size=UDim2.new(1,-44,1,0); NameL.Position=UDim2.new(0,38,0,0)
        NameL.BackgroundTransparency=1; NameL.Text=name; NameL.TextColor3=Theme.TextDim
        NameL.Font=Enum.Font.GothamSemibold; NameL.TextSize=12
        NameL.TextXAlignment=Enum.TextXAlignment.Left; NameL.ZIndex=5

        local Dot2=Instance.new("Frame",TabBtn)
        Dot2.Size=UDim2.new(0,5,0,5); Dot2.Position=UDim2.new(1,-11,0.5,-2.5)
        Dot2.BackgroundColor3=Theme.Accent; Dot2.BorderSizePixel=0
        Dot2.BackgroundTransparency=1; Dot2.ZIndex=5; Corner(Dot2,3)

        local Content=Instance.new("ScrollingFrame",ContentArea)
        Content.Size=UDim2.new(1,0,1,0); Content.BackgroundTransparency=1
        Content.Visible=false; Content.ScrollBarThickness=3
        Content.ScrollBarImageColor3=Theme.Accent
        Content.CanvasSize=UDim2.new(0,0,0,0); Content.AutomaticCanvasSize=Enum.AutomaticSize.Y; Content.ZIndex=2
        ListLayout(Content,5); Padding(Content,6,6,4,6)

        TabBtn.MouseEnter:Connect(function()
            if not Content.Visible then
                Tween(TabBtn,{BackgroundTransparency=0.85},0.12)
                Tween(IconL,{TextColor3=Color3.fromRGB(180,180,220)},0.12)
            end
        end)
        TabBtn.MouseLeave:Connect(function()
            if not Content.Visible then
                Tween(TabBtn,{BackgroundTransparency=1},0.12)
                Tween(IconL,{TextColor3=Theme.TextDim},0.12)
            end
        end)

        local function Activate()
            DeactivateAll()
            Tween(TabBtn,{BackgroundTransparency=0.78},0.18)
            Tween(NameL,{TextColor3=Theme.Accent},0.18)
            Tween(IconL,{TextColor3=Theme.Accent},0.18)
            Tween(Dot2,{BackgroundTransparency=0},0.18)
            Bar.Visible=true; GlowBG.Visible=true; Content.Visible=true
        end
        -- [FIX] ไม่ใช้ task.wait() ใน callback — ใช้ task.delay แทน
        TabBtn.MouseButton1Click:Connect(function()
            Tween(TabBtn,{BackgroundColor3=Color3.fromRGB(0,50,80)},0.07)
            task.delay(0.07, Activate)
        end)

        local entry={Btn=TabBtn,Content=Content,Bar=Bar,NameLbl=NameL,IconLbl=IconL,Glow=GlowBG,Dot2=Dot2}
        table.insert(Tabs,entry)
        if #Tabs==1 then task.spawn(Activate) end

        -- TAB API
        local TabAPI={}

        function TabAPI:NewSection(text)
            local SF=Instance.new("Frame",Content)
            SF.Size=UDim2.new(1,-4,0,26); SF.BackgroundTransparency=1; SF.ZIndex=3
            local SL=Instance.new("TextLabel",SF)
            SL.Size=UDim2.new(1,0,1,0); SL.BackgroundTransparency=1
            SL.Text=("── %s ──"):format(text:upper())
            SL.TextColor3=Theme.TextDim
            SL.Font=Enum.Font.GothamBold; SL.TextSize=10
            SL.TextXAlignment=Enum.TextXAlignment.Left; SL.ZIndex=4
        end

        function TabAPI:NewButton(text, desc, callback)
            if type(desc)=="function" then callback=desc; desc=nil end
            callback=callback or function() end
            local h = desc and 48 or 36

            local BF=Instance.new("Frame",Content)
            BF.Size=UDim2.new(1,-4,0,h); BF.BackgroundColor3=Theme.Surface2; BF.BorderSizePixel=0; BF.ZIndex=3
            Corner(BF,8); Stroke(BF,Theme.Border,1)

            local BB=Instance.new("TextButton",BF)
            BB.Size=UDim2.new(1,0,1,0); BB.BackgroundTransparency=1; BB.Text=""; BB.ZIndex=4; BB.AutoButtonColor=false; BB.Selectable=false

            local IL=Instance.new("TextLabel",BF)
            IL.Size=UDim2.new(0,20,0,20); IL.Position=UDim2.new(0,10,0.5,-10)
            IL.BackgroundTransparency=1; IL.Text="▶"; IL.TextColor3=Theme.Accent
            IL.Font=Enum.Font.GothamBold; IL.TextSize=9; IL.ZIndex=4

            local TL=Instance.new("TextLabel",BF)
            TL.Size=UDim2.new(1,-50,0,18); TL.Position=UDim2.new(0,34,0,desc and 5 or 9)
            TL.BackgroundTransparency=1; TL.Text=text; TL.TextColor3=Theme.Text
            TL.Font=Enum.Font.GothamSemibold; TL.TextSize=13; TL.TextXAlignment=Enum.TextXAlignment.Left; TL.ZIndex=4

            if desc then
                local DL=Instance.new("TextLabel",BF)
                DL.Size=UDim2.new(1,-50,0,13); DL.Position=UDim2.new(0,34,0,24)
                DL.BackgroundTransparency=1; DL.Text=desc; DL.TextColor3=Theme.TextDim
                DL.Font=Enum.Font.Gotham; DL.TextSize=11; DL.TextXAlignment=Enum.TextXAlignment.Left; DL.ZIndex=4
            end

            local AR=Instance.new("TextLabel",BF)
            AR.Size=UDim2.new(0,18,1,0); AR.Position=UDim2.new(1,-22,0,0)
            AR.BackgroundTransparency=1; AR.Text="›"; AR.TextColor3=Theme.TextDim
            AR.Font=Enum.Font.GothamBold; AR.TextSize=18; AR.ZIndex=4

            BB.MouseEnter:Connect(function() Tween(BF,{BackgroundColor3=Color3.fromRGB(35,35,55)},0.12); Tween(AR,{TextColor3=Theme.Accent},0.12) end)
            BB.MouseLeave:Connect(function() Tween(BF,{BackgroundColor3=Theme.Surface2},0.12); Tween(AR,{TextColor3=Theme.TextDim},0.12) end)
            BB.MouseButton1Down:Connect(function() Tween(BF,{BackgroundColor3=Color3.fromRGB(0,70,110)},0.08) end)
            BB.MouseButton1Up:Connect(function() Tween(BF,{BackgroundColor3=Color3.fromRGB(35,35,55)},0.08) end)
            BB.MouseButton1Click:Connect(function() pcall(callback) end)
        end

        function TabAPI:NewToggle(text, default, callback)
            callback=callback or function() end
            local state=default or false

            local TF=Instance.new("Frame",Content)
            TF.Size=UDim2.new(1,-4,0,36); TF.BackgroundColor3=Theme.Surface2; TF.BorderSizePixel=0; TF.ZIndex=3
            Corner(TF,8); Stroke(TF,Theme.Border,1)

            local TL2=Instance.new("TextLabel",TF)
            TL2.Size=UDim2.new(1,-60,1,0); TL2.Position=UDim2.new(0,12,0,0)
            TL2.BackgroundTransparency=1; TL2.Text=text; TL2.TextColor3=Theme.Text
            TL2.Font=Enum.Font.GothamSemibold; TL2.TextSize=13; TL2.TextXAlignment=Enum.TextXAlignment.Left; TL2.ZIndex=4

            local Track=Instance.new("Frame",TF)
            Track.Size=UDim2.new(0,38,0,20); Track.Position=UDim2.new(1,-50,0.5,-10)
            Track.BackgroundColor3=state and Theme.Accent or Theme.Border; Track.BorderSizePixel=0; Track.ZIndex=4
            Corner(Track,10)

            local Knob=Instance.new("Frame",Track)
            Knob.Size=UDim2.new(0,14,0,14); Knob.Position=UDim2.new(0,state and 21 or 3,0.5,-7)
            Knob.BackgroundColor3=Color3.new(1,1,1); Knob.BorderSizePixel=0; Knob.ZIndex=5
            Corner(Knob,7)

            local TB2=Instance.new("TextButton",TF)
            TB2.Size=UDim2.new(1,0,1,0); TB2.BackgroundTransparency=1; TB2.Text=""; TB2.ZIndex=6; TB2.AutoButtonColor=false; TB2.Selectable=false

            local function Upd()
                if state then
                    Tween(Track,{BackgroundColor3=Theme.Accent},0.15)
                    Tween(Knob,{Position=UDim2.new(0,21,0.5,-7)},0.15)
                else
                    Tween(Track,{BackgroundColor3=Theme.Border},0.15)
                    Tween(Knob,{Position=UDim2.new(0,3,0.5,-7)},0.15)
                end
            end
            TB2.MouseButton1Click:Connect(function() state=not state; Upd(); pcall(callback,state) end)
            return { Set=function(_,v) state=v; Upd() end, Get=function() return state end }
        end

        function TabAPI:NewLabel(text)
            local L=Instance.new("TextLabel",Content)
            L.Size=UDim2.new(1,-4,0,24); L.BackgroundTransparency=1
            L.Text=text; L.TextColor3=Theme.TextDim; L.Font=Enum.Font.Gotham; L.TextSize=12
            L.TextXAlignment=Enum.TextXAlignment.Left; L.ZIndex=3
            Padding(L,0,0,8,0)
            return L
        end

        return TabAPI
    end

    -- SETTINGS TAB
    function WindowAPI:AddSettingsTab()
        local TabBtn=Instance.new("TextButton",SideList)
        TabBtn.Size=UDim2.new(1,0,0,38)
        TabBtn.BackgroundColor3=Color3.fromRGB(0,80,120)
        TabBtn.BackgroundTransparency=1; TabBtn.Text=""
        TabBtn.AutoButtonColor=false; TabBtn.Selectable=false; TabBtn.ZIndex=3
        Corner(TabBtn,10)

        local GlowBG=Instance.new("Frame",TabBtn)
        GlowBG.Size=UDim2.new(1,0,1,0); GlowBG.BackgroundColor3=Theme.Accent
        GlowBG.BackgroundTransparency=0.88; GlowBG.BorderSizePixel=0; GlowBG.ZIndex=3; GlowBG.Visible=false
        Corner(GlowBG,10)

        local Bar=Instance.new("Frame",TabBtn)
        Bar.Size=UDim2.new(0,3,0.6,0); Bar.Position=UDim2.new(0,0,0.2,0)
        Bar.BackgroundColor3=Theme.Accent; Bar.BorderSizePixel=0; Bar.Visible=false; Bar.ZIndex=5; Corner(Bar,2)
        local BarG=Instance.new("UIGradient",Bar); BarG.Rotation=90
        BarG.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(0,195,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(130,80,255))})

        local IconL=Instance.new("TextLabel",TabBtn)
        IconL.Size=UDim2.new(0,26,1,0); IconL.Position=UDim2.new(0,10,0,0)
        IconL.BackgroundTransparency=1; IconL.Text="⚙️"; IconL.TextColor3=Theme.TextDim
        IconL.Font=Enum.Font.Gotham; IconL.TextSize=15; IconL.ZIndex=5

        local NameL=Instance.new("TextLabel",TabBtn)
        NameL.Size=UDim2.new(1,-44,1,0); NameL.Position=UDim2.new(0,38,0,0)
        NameL.BackgroundTransparency=1; NameL.Text="ตั้งค่า UI"; NameL.TextColor3=Theme.TextDim
        NameL.Font=Enum.Font.GothamSemibold; NameL.TextSize=12; NameL.TextXAlignment=Enum.TextXAlignment.Left; NameL.ZIndex=5

        local Dot2=Instance.new("Frame",TabBtn)
        Dot2.Size=UDim2.new(0,5,0,5); Dot2.Position=UDim2.new(1,-11,0.5,-2.5)
        Dot2.BackgroundColor3=Theme.Accent; Dot2.BorderSizePixel=0; Dot2.BackgroundTransparency=1; Dot2.ZIndex=5; Corner(Dot2,3)

        local Content=Instance.new("ScrollingFrame",ContentArea)
        Content.Size=UDim2.new(1,0,1,0); Content.BackgroundTransparency=1
        Content.Visible=false; Content.ScrollBarThickness=3; Content.ScrollBarImageColor3=Theme.Accent
        Content.CanvasSize=UDim2.new(0,0,0,0); Content.AutomaticCanvasSize=Enum.AutomaticSize.Y; Content.ZIndex=2
        ListLayout(Content,8); Padding(Content,8,8,6,8)

        local entry={Btn=TabBtn,Content=Content,Bar=Bar,NameLbl=NameL,IconLbl=IconL,Glow=GlowBG,Dot2=Dot2}
        table.insert(Tabs,entry)

        TabBtn.MouseEnter:Connect(function() if not Content.Visible then Tween(TabBtn,{BackgroundTransparency=0.85},0.12); Tween(IconL,{TextColor3=Color3.fromRGB(180,180,220)},0.12) end end)
        TabBtn.MouseLeave:Connect(function() if not Content.Visible then Tween(TabBtn,{BackgroundTransparency=1},0.12); Tween(IconL,{TextColor3=Theme.TextDim},0.12) end end)
        TabBtn.MouseButton1Click:Connect(function()
            DeactivateAll()
            Tween(TabBtn,{BackgroundTransparency=0.78},0.18); Tween(NameL,{TextColor3=Theme.Accent},0.18); Tween(IconL,{TextColor3=Theme.Accent},0.18)
            Tween(Dot2,{BackgroundTransparency=0},0.18)
            Bar.Visible=true; GlowBG.Visible=true; Content.Visible=true
        end)

        local function SecHdr(txt)
            local f=Instance.new("Frame",Content); f.Size=UDim2.new(1,0,0,22); f.BackgroundTransparency=1; f.ZIndex=3
            local l=Instance.new("TextLabel",f); l.Size=UDim2.new(1,0,1,0); l.BackgroundTransparency=1
            l.Text=("── %s"):format(txt:upper()); l.TextColor3=Theme.TextDim; l.Font=Enum.Font.GothamBold; l.TextSize=10; l.TextXAlignment=Enum.TextXAlignment.Left; l.ZIndex=4
        end

        local function Card(h)
            local c=Instance.new("Frame",Content); c.Size=UDim2.new(1,0,0,h or 44); c.BackgroundColor3=Theme.Surface2; c.BorderSizePixel=0; c.ZIndex=3
            Corner(c,8); Stroke(c,Theme.Border,1); return c
        end

        SecHdr("ขนาด UI")

        local function SliderRow(label, minV, maxV, initV, fmt, onChange)
            local row=Card(56)
            local lbl=Instance.new("TextLabel",row); lbl.Size=UDim2.new(1,-80,0,18); lbl.Position=UDim2.new(0,10,0,6)
            lbl.BackgroundTransparency=1; lbl.Text=label; lbl.TextColor3=Theme.Text; lbl.Font=Enum.Font.GothamSemibold; lbl.TextSize=12; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.ZIndex=4

            local valLbl=Instance.new("TextLabel",row); valLbl.Size=UDim2.new(0,70,0,18); valLbl.Position=UDim2.new(1,-78,0,6)
            valLbl.BackgroundTransparency=1; valLbl.TextColor3=Theme.Accent; valLbl.Font=Enum.Font.GothamBold; valLbl.TextSize=12; valLbl.TextXAlignment=Enum.TextXAlignment.Right; valLbl.ZIndex=4

            local track=Instance.new("Frame",row); track.Size=UDim2.new(1,-20,0,6); track.Position=UDim2.new(0,10,0,36)
            track.BackgroundColor3=Theme.Border; track.BorderSizePixel=0; track.ZIndex=4; Corner(track,3)

            local fill=Instance.new("Frame",track); fill.Size=UDim2.new((initV-minV)/(maxV-minV),0,1,0)
            fill.BackgroundColor3=Theme.Accent; fill.BorderSizePixel=0; fill.ZIndex=5; Corner(fill,3)

            local knob=Instance.new("Frame",track); knob.Size=UDim2.new(0,14,0,14); knob.Position=UDim2.new((initV-minV)/(maxV-minV),-7,0.5,-7)
            knob.BackgroundColor3=Color3.new(1,1,1); knob.BorderSizePixel=0; knob.ZIndex=6; Corner(knob,7)
            Stroke(knob,Theme.Accent,1.5)

            local cur=initV
            valLbl.Text=fmt:format(cur)

            local dragging2=false
            local function SetVal(abs_x)
                local relX=math.clamp((abs_x-track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
                cur=math.floor(minV+(maxV-minV)*relX)
                fill.Size=UDim2.new(relX,0,1,0); knob.Position=UDim2.new(relX,-7,0.5,-7)
                valLbl.Text=fmt:format(cur)
                pcall(onChange,cur)
            end

            local ClickZone=Instance.new("TextButton",row); ClickZone.Size=UDim2.new(1,0,0,24); ClickZone.Position=UDim2.new(0,0,0,29)
            ClickZone.BackgroundTransparency=1; ClickZone.Text=""; ClickZone.ZIndex=7; ClickZone.AutoButtonColor=false; ClickZone.Selectable=false
            ClickZone.MouseButton1Down:Connect(function(x) dragging2=true; SetVal(x) end)
            ClickZone.MouseButton1Up:Connect(function() dragging2=false end)
            ClickZone.MouseMoved:Connect(function(x) if dragging2 then SetVal(x) end end)
            UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging2=false end end)

            return row, function() return cur end
        end

        SliderRow("ความกว้าง UI", 400, 800, W, "%d px", function(v)
            W=v; Tween(Main,{Size=UDim2.new(0,W,0,H)},0.1)
            Main.Position=UDim2.new(0.5,-W/2,Main.Position.Y.Scale,Main.Position.Y.Offset)
        end)
        SliderRow("ความสูง UI", 280, 600, H, "%d px", function(v)
            H=v; Tween(Main,{Size=UDim2.new(0,W,0,H)},0.1)
            Main.Position=UDim2.new(Main.Position.X.Scale,Main.Position.X.Offset,0.5,-H/2)
        end)

        SecHdr("ข้อมูลหน้าจอ")
        local infoCard=Card(80)
        local function InfoRow(label, val2, yOff)
            local lbl=Instance.new("TextLabel",infoCard); lbl.Size=UDim2.new(0.5,0,0,18); lbl.Position=UDim2.new(0,12,0,yOff)
            lbl.BackgroundTransparency=1; lbl.Text=label; lbl.TextColor3=Theme.TextDim; lbl.Font=Enum.Font.Gotham; lbl.TextSize=11; lbl.TextXAlignment=Enum.TextXAlignment.Left; lbl.ZIndex=4
            local vl=Instance.new("TextLabel",infoCard); vl.Size=UDim2.new(0.5,-12,0,18); vl.Position=UDim2.new(0.5,0,0,yOff)
            vl.BackgroundTransparency=1; vl.Text=val2; vl.TextColor3=Theme.Accent; vl.Font=Enum.Font.GothamBold; vl.TextSize=11; vl.TextXAlignment=Enum.TextXAlignment.Right; vl.ZIndex=4
            return vl
        end
        local VP2=workspace.CurrentCamera.ViewportSize
        InfoRow("ความละเอียดจอ", ("%d × %d"):format(VP2.X,VP2.Y), 8)
        InfoRow("อัตราส่วน", ("%.2f : 1"):format(VP2.X/math.max(VP2.Y,1)), 30)
        InfoRow("GUI ขณะนี้", ("%d × %d"):format(W,H), 52)

        SecHdr("สี Accent")

        local presets2 = {
            {name="Cyan",  col=Color3.fromRGB(0,195,255)},
            {name="Purple",col=Color3.fromRGB(150,80,255)},
            {name="Green", col=Color3.fromRGB(60,220,120)},
            {name="Pink",  col=Color3.fromRGB(255,80,180)},
            {name="Orange",col=Color3.fromRGB(255,150,30)},
            {name="Red",   col=Color3.fromRGB(255,70,70)},
        }
        local presetCard=Card(44)
        local presetRow=Instance.new("Frame",presetCard); presetRow.Size=UDim2.new(1,-20,0,28); presetRow.Position=UDim2.new(0,10,0.5,-14); presetRow.BackgroundTransparency=1; presetRow.ZIndex=4
        ListLayout(presetRow,6,Enum.FillDirection.Horizontal)

        -- ApplyAccent เต็ม — ใช้ตอนกด preset / ปิด rainbow
        local function ApplyAccent(col)
            Theme.Accent = col
            ALine.BackgroundColor3=col; Dot.BackgroundColor3=col; FBtn.TextColor3=col; FBtnStroke.Color=col
            SB.BackgroundColor3=col; BrandLine.BackgroundColor3=col; BrandIcon.TextColor3=col
            for _,t in pairs(Tabs) do
                t.Bar.BackgroundColor3=col
                if t.Glow then t.Glow.BackgroundColor3=col end
                if t.Dot2 then t.Dot2.BackgroundColor3=col end
            end
            ALG.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,col),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(130,80,255)),ColorSequenceKeypoint.new(1,col)})
            -- auto-save accent
            _savedSettings.accentR = col.R
            _savedSettings.accentG = col.G
            _savedSettings.accentB = col.B
            _savedSettings.rainbow = false
            SaveSettings(_savedSettings)
        end

        -- ApplyAccentFast — เบาสำหรับ Rainbow Heartbeat (ไม่แตะ ColorSequence)
        local function ApplyAccentFast(col)
            Theme.Accent = col
            ALine.BackgroundColor3=col; Dot.BackgroundColor3=col; FBtn.TextColor3=col; FBtnStroke.Color=col
            SB.BackgroundColor3=col; BrandLine.BackgroundColor3=col; BrandIcon.TextColor3=col
            for _,t in pairs(Tabs) do
                t.Bar.BackgroundColor3=col
                if t.Dot2 then t.Dot2.BackgroundColor3=col end
            end
        end

        for _,p in ipairs(presets2) do
            local pb=Instance.new("TextButton",presetRow); pb.Size=UDim2.new(0,28,0,28); pb.BackgroundColor3=p.col; pb.Text=""; pb.ZIndex=5; pb.BorderSizePixel=0
            Corner(pb,14)
            pb.MouseButton1Click:Connect(function() ApplyAccent(p.col) end)
            pb.MouseEnter:Connect(function() Tween(pb,{Size=UDim2.new(0,32,0,32)},0.1) end)
            pb.MouseLeave:Connect(function() Tween(pb,{Size=UDim2.new(0,28,0,28)},0.1) end)
        end


        SecHdr("ไฟรุ้ง Rainbow")
        local rainbowCard = Card(52)

        local rbIcon = Instance.new("TextLabel", rainbowCard)
        rbIcon.Size = UDim2.new(0,28,0,28); rbIcon.Position = UDim2.new(0,10,0.5,-14)
        rbIcon.BackgroundTransparency=1; rbIcon.Text="🌈"; rbIcon.TextSize=20; rbIcon.ZIndex=4
        rbIcon.Font=Enum.Font.Gotham

        local rbTitle = Instance.new("TextLabel", rainbowCard)
        rbTitle.Size=UDim2.new(1,-110,0,18); rbTitle.Position=UDim2.new(0,42,0,8)
        rbTitle.BackgroundTransparency=1; rbTitle.Text="Rainbow Mode"
        rbTitle.TextColor3=Theme.Text; rbTitle.Font=Enum.Font.GothamSemibold
        rbTitle.TextSize=13; rbTitle.TextXAlignment=Enum.TextXAlignment.Left; rbTitle.ZIndex=4

        local rbSub = Instance.new("TextLabel", rainbowCard)
        rbSub.Size=UDim2.new(1,-110,0,13); rbSub.Position=UDim2.new(0,42,0,27)
        rbSub.BackgroundTransparency=1; rbSub.Text="สี Accent ไหลไปตาม spectrum"
        rbSub.TextColor3=Theme.TextDim; rbSub.Font=Enum.Font.Gotham
        rbSub.TextSize=10; rbSub.TextXAlignment=Enum.TextXAlignment.Left; rbSub.ZIndex=4

        local rbTrack = Instance.new("Frame", rainbowCard)
        rbTrack.Size=UDim2.new(0,38,0,20); rbTrack.Position=UDim2.new(1,-50,0.5,-10)
        rbTrack.BackgroundColor3=Theme.Border; rbTrack.BorderSizePixel=0; rbTrack.ZIndex=4
        Corner(rbTrack,10)
        local rbKnob = Instance.new("Frame", rbTrack)
        rbKnob.Size=UDim2.new(0,14,0,14); rbKnob.Position=UDim2.new(0,3,0.5,-7)
        rbKnob.BackgroundColor3=Color3.new(1,1,1); rbKnob.BorderSizePixel=0; rbKnob.ZIndex=5
        Corner(rbKnob,7)

        local rbBtn = Instance.new("TextButton", rainbowCard)
        rbBtn.Size=UDim2.new(1,0,1,0); rbBtn.BackgroundTransparency=1; rbBtn.Text=""; rbBtn.ZIndex=6; rbBtn.AutoButtonColor=false; rbBtn.Selectable=false

        local rainbowOn  = false
        local rainbowCon = nil
        local rbHue      = 0

        local function StopRainbow()
            if rainbowCon then rainbowCon:Disconnect(); rainbowCon=nil end
        end

        local function StartRainbow()
            StopRainbow()
            rainbowCon = RunService.Heartbeat:Connect(function(dt)
                rbHue = (rbHue + dt * 0.18) % 1
                ApplyAccentFast(Color3.fromHSV(rbHue, 1, 1))
            end)
        end

        rbBtn.MouseButton1Click:Connect(function()
            rainbowOn = not rainbowOn
            if rainbowOn then
                Tween(rbTrack,{BackgroundColor3=Color3.fromRGB(180,80,255)},0.15)
                Tween(rbKnob,{Position=UDim2.new(0,21,0.5,-7)},0.15)
                StartRainbow()
                _savedSettings.rainbow = true; SaveSettings(_savedSettings)
            else
                Tween(rbTrack,{BackgroundColor3=Theme.Border},0.15)
                Tween(rbKnob,{Position=UDim2.new(0,3,0.5,-7)},0.15)
                StopRainbow()
                _savedSettings.rainbow = false; SaveSettings(_savedSettings)
            end
        end)

        for _,pb in ipairs(presetRow:GetChildren()) do
            if pb:IsA("TextButton") then
                pb.MouseButton1Click:Connect(function()
                    if rainbowOn then
                        rainbowOn=false; StopRainbow()
                        Tween(rbTrack,{BackgroundColor3=Theme.Border},0.15)
                        Tween(rbKnob,{Position=UDim2.new(0,3,0.5,-7)},0.15)
                    end
                end)
            end
        end

        -- expose restore functions ให้ script ภายนอก call ได้
        WindowAPI.RestoreAccent = function(col)
            ApplyAccent(col)
        end
        WindowAPI.RestoreRainbow = function()
            rainbowOn = true
            Tween(rbTrack,{BackgroundColor3=Color3.fromRGB(180,80,255)},0.15)
            Tween(rbKnob,{Position=UDim2.new(0,21,0.5,-7)},0.15)
            StartRainbow()
        end

    end

    -- Notification
    function WindowAPI:Notify(title2, text2, duration)
        duration=duration or 4
        local NF=Instance.new("Frame",SG)
        NF.Size=UDim2.new(0,260,0,58); NF.Position=UDim2.new(1,-270,1,-68)
        NF.BackgroundColor3=Theme.Surface2; NF.BorderSizePixel=0; NF.ZIndex=20
        Corner(NF,10); Stroke(NF,Theme.Accent,1)

        local NT=Instance.new("TextLabel",NF); NT.Size=UDim2.new(1,-12,0,20); NT.Position=UDim2.new(0,12,0,8)
        NT.BackgroundTransparency=1; NT.Text=title2; NT.TextColor3=Theme.Accent; NT.Font=Enum.Font.GothamBold; NT.TextSize=13; NT.TextXAlignment=Enum.TextXAlignment.Left; NT.ZIndex=21

        local NX=Instance.new("TextLabel",NF); NX.Size=UDim2.new(1,-12,0,16); NX.Position=UDim2.new(0,12,0,30)
        NX.BackgroundTransparency=1; NX.Text=text2; NX.TextColor3=Theme.TextDim; NX.Font=Enum.Font.Gotham; NX.TextSize=11; NX.TextXAlignment=Enum.TextXAlignment.Left; NX.ZIndex=21

        local PB=Instance.new("Frame",NF); PB.Size=UDim2.new(1,0,0,2); PB.Position=UDim2.new(0,0,1,-2)
        PB.BackgroundColor3=Theme.Accent; PB.BorderSizePixel=0; PB.ZIndex=22; Corner(PB,1)
        Tween(PB,{Size=UDim2.new(0,0,0,2)},duration)
        -- [FIX] ไม่ใช้ task.wait() ใน Notify — ใช้ task.delay แทน
        task.delay(duration, function()
            Tween(NF,{Position=UDim2.new(1,10,1,-68)},0.3)
            task.delay(0.35, function() if NF and NF.Parent then NF:Destroy() end end)
        end)
    end

    return WindowAPI
end

-- ==========================================
-- USAGE
-- ==========================================

local Window = Library:NewWindow({
    Title    = "⚡ WackShop",
    Subtitle = "Premium Edition",
    Width    = 600,
    Height   = 400,
})

local Tab1 = Window:NewTab("หลัก",       "🏠")
local Tab2 = Window:NewTab("สคริปทางบ้าน",        "🏡")
local Tab3 = Window:NewTab("ของOP(รอปรับปรุง)",      "💀")
local Tab4 = Window:NewTab("เครื่องมือ", "🔧")
local Tab5 = Window:NewTab("แกล้ง",      "🤡")
local Tab6 = Window:NewTab("ดวงตาเทพ",  "👁️")
Window:AddSettingsTab()

-- หน้าหลัก
Tab1:NewSection("การเคลื่อนที่")
Tab1:NewButton("🔴 บิน", "เปิดใช้งานการบิน", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/FLY/refs/heads/main/FLY.lua"))() end)
Tab1:NewButton("🔴 กระโดดไม่จำกัด", "ปลดล็อคความสูงการกระโดด", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/jump/refs/heads/main/Jump"))() end)
Tab1:NewButton("🔴 วิ่งเร็ว", "เพิ่มความเร็วในการวิ่ง", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/speed/refs/heads/main/speed"))() end)
Tab1:NewButton("🔴 วาป", "เทเลพอร์ตไปตำแหน่งที่ต้องการ", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/Teleport/refs/heads/main/Teleport"))() end)
Tab1:NewSection("อื่นๆ")
Tab1:NewButton("🔴 ทะลุกำแพง", "เดินผ่านสิ่งกีดขวางได้", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/Through-the-map/refs/heads/main/Through%20the%20map"))() end)
Tab1:NewButton("🔴 หายตัว", "ซ่อนตัวจากผู้เล่นอื่น", function() loadstring(game:HttpGet("https://pastebin.com/raw/3Rnd9rHf"))() end)
Tab1:NewButton("🔴 อมตะ", "ไม่สามารถโดนดาเมจได้", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/GOD/refs/heads/main/GOD.lua"))() end)
Tab1:NewButton("🔴 เทเลพอร์ต", "เทเลพอร์ตไปหาผู้เล่นได้", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/TP/refs/heads/main/TP.lua"))() end)

-- สคริปทางบ้าน
Tab2:NewSection("สคริปทางบ้าน")
Tab2:NewButton("🏡 บินขณะนั่งรถ", "บินได้แม้ขณะนั่งรถ by Tono", function() loadstring(game:HttpGet("https://pastebin.com/raw/56AzZitA"))() end)

-- โจมตี
Tab3:NewSection("ของOP(รอปรับปรุง)")
Tab3:NewButton("🟠 ล็อคหัวผู้เล่น", "ออโต้เอมผู้เล่นอื่น", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/Aimlock/refs/heads/main/%E0%B8%A5%E0%B9%87%E0%B8%AD%E0%B8%84%E0%B9%80%E0%B8%9B%E0%B9%89%E0%B8%B2.lua"))() end)
Tab3:NewButton("🟠 ฆ่าบอทออร่า", "ดาเมจบอทในรัศมีรอบตัว", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/wackshopr-tech/script-roblox-all/refs/heads/main/SCRIPT-ALL-BY-WACK-SHOP/kill-all-bot/killall-npc..lua"))() end)
Tab3:NewButton("🟠 Hitbox", "ขยายฮิตบ็อกซ์ผู้เล่น", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/Hitbox/refs/heads/main/Hitbox"))() end)
Tab3:NewButton("🟠 SPY", "แอบส่องผู้เล่นจากระยะไกล", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/FOV/refs/heads/main/SpyPro-3.lua.txt"))() end)

-- เครื่องมือ
Tab4:NewSection("เครื่องมือ")
Tab4:NewButton("🟡 เพิ่มความลื่น", "บูสต์ FPS และความลื่น", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/FPS-BOOST/refs/heads/main/FPS_BOOST.lua"))() end)
Tab4:NewButton("🟡 แมพสว่าง", "เพิ่มแสงสว่างในแมพ", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/Bright-map/refs/heads/main/%E0%B8%9B%E0%B8%A3%E0%B8%B1%E0%B8%9A%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%AA%E0%B8%A7%E0%B9%88%E0%B8%B2%E0%B8%87"))() end)
Tab4:NewButton("🟡 เสกของ", "สร้างไอเทมในเกม", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/Earth-profile-/refs/heads/main/%E0%B9%80%E0%B8%AA%E0%B8%81%E0%B8%82%E0%B8%AD%E0%B8%87"))() end)
Tab4:NewButton("🟡 แป้นพิมพ์", "คีย์บอร์ดเสริม", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))() end)
Tab4:NewButton("🟡 ปรับความเร็วรถ", "เพิ่มความเร็วยานพาหนะ", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/speed-car/refs/heads/main/car%20speed"))() end)
Tab4:NewButton("🟡 Infinite Yield", "เครื่องมือ Admin", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)
Tab4:NewButton("🟡 Quirky CMD", "คอมมานด์ไลน์ใน Roblox", function() loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))() end)

-- แกล้ง
Tab5:NewSection("แกล้ง")
Tab5:NewButton("🟢 หลุมดำ", "ดูดผู้เล่นอื่น", function() loadstring(game:HttpGet("https://pastebin.com/raw/pkZnU5P5"))() end)
Tab5:NewButton("🟢 ชนกระเด็น", "กระเด็นผู้เล่นออกไป", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/wackshopr-tech/script-roblox-all/refs/heads/main/SCRIPT-ALL-BY-WACK-SHOP/FLINGCORE/FLINGCORE.lua"))() end)
Tab5:NewButton("🟢 ดึงคน", "ดึงผู้เล่นเข้าหาตัวเอง", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/wackshopr-tech/script-roblox-all/refs/heads/main/SCRIPT-ALL-BY-WACK-SHOP/pull%20false%20people/pull-false-people.lua"))() end)
Tab5:NewButton("🟢 จับน้องชาย", "สคริปแกล้ง", function() loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))() end)
Tab5:NewButton("🟢 F3X", "เครื่องมือสร้างและแก้ไขชิ้นส่วน", function() loadstring(game:HttpGet("https://pastebin.com/raw/FZmTykdY"))() end)

-- ดวงตาเทพ
Tab6:NewSection("ESP")
Tab6:NewButton("🟣 ESP Players", "แสดงผู้เล่นผ่านกำแพง", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/ESP/refs/heads/main/ESP.lua"))() end)
Tab6:NewButton("🟣 ESP NPC", "แสดงบอทและ NPC", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/redfabza/ESP-BOT/refs/heads/main/ESP%20BOT.lua"))() end)

-- ==========================================
-- โหลด SETTINGS อัตโนมัติ
-- ==========================================
task.defer(function()
    local s = _savedSettings
    if s.rainbow then
        -- คลิก rbBtn เพื่อ trigger rainbow (rbBtn อยู่ใน AddSettingsTab closure)
        -- ใช้ FireButton ไม่ได้ข้าม scope — ใช้ flag แทน
        -- rainbow จะ restore ผ่าน Window.RestoreRainbow ที่ AddSettingsTab expose ไว้
        if Window.RestoreRainbow then Window.RestoreRainbow() end
    elseif s.accentR then
        if Window.RestoreAccent then
            Window.RestoreAccent(Color3.new(s.accentR, s.accentG, s.accentB))
        end
    end
end)

Window:Notify("WackShop โหลดสำเร็จ ✅", "ยินดีต้อนรับสู่ WackShop Premium!", 5)
