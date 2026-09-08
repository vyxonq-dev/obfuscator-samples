local BRAND_NAME="Cerberus"
local ACCENT=Color3.fromRGB(130,124,255)
local ACCENT_DIM=Color3.fromRGB(82,78,160)
local LOGO_DECAL_ID=136497541793809
local DISCORD_LINK="https://getcerberus.com/discord"
local LINKVERTISE_KEY_LINK="https://ads.luarmor.net/get_key?for=Cerberus_Free-YgsLsSacLsra"
local WORKINK_KEY_LINK="https://ads.luarmor.net/get_key?for=Cerberus_Free-YBfmdEDtlRlw"
local SCRIPT_ID="f717741da51e4b86203f4a8ce5cd881b"
local LOADER_URL="https://api.luarmor.net/files/v3/loaders/f717741da51e4b86203f4a8ce5cd881b.lua"
local SAVE_FILENAME="noxkey.txt"
local _env=getgenv and getgenv() or _G
local setclip=(setclipboard or (clipboard and clipboard.set))
local has_clip=type(setclip)=="function"
local writef=(writefile or (syn and syn.writefile) or (fluxus and fluxus.writefile) or (Krnl and Krnl.WriteFile))
local readf=(readfile or (syn and syn.readfile) or (fluxus and fluxus.readfile) or (Krnl and Krnl.ReadFile))
local isf=(isfile or (syn and syn.isfile) or (fluxus and fluxus.isfile))
local can_persist=(type(writef)=="function" and type(readf)=="function" and type(isf)=="function")
local TweenService=game:GetService("TweenService")
local UIS=game:GetService("UserInputService")
local Players=game:GetService("Players")
local LP=Players.LocalPlayer
local Camera=workspace.CurrentCamera
local function GuiRoot()
    local cg=game:GetService("CoreGui")
    if pcall(function() Instance.new("ScreenGui").Parent=cg end) then return cg end
    return LP:WaitForChild("PlayerGui")
end
local ToastGui=Instance.new("ScreenGui")
ToastGui.Name="Cerberus_Toasts"
ToastGui.ResetOnSpawn=false
ToastGui.IgnoreGuiInset=true
ToastGui.DisplayOrder=999
ToastGui.Parent=GuiRoot()
local toastStack=Instance.new("Frame")
toastStack.Name="ToastStack"
toastStack.Parent=ToastGui
toastStack.BackgroundTransparency=1
toastStack.AnchorPoint=Vector2.new(1,0)
toastStack.Position=UDim2.new(1,-12,0,12)
toastStack.Size=UDim2.new(0,360,0,0)
toastStack.AutomaticSize=Enum.AutomaticSize.Y
local tlist=Instance.new("UIListLayout",toastStack)
tlist.FillDirection=Enum.FillDirection.Vertical
tlist.Padding=UDim.new(0,8)
tlist.HorizontalAlignment=Enum.HorizontalAlignment.Right
tlist.SortOrder=Enum.SortOrder.LayoutOrder
local function Toast(text,ok)
    local card=Instance.new("Frame")
    card.Name="Toast"
    card.Parent=toastStack
    card.BackgroundColor3=ok and Color3.fromRGB(20,44,33) or Color3.fromRGB(48,26,26)
    card.Size=UDim2.new(1,0,0,0)
    card.AutomaticSize=Enum.AutomaticSize.Y
    card.ClipsDescendants=true
    Instance.new("UICorner",card).CornerRadius=UDim.new(0,10)
    local stroke=Instance.new("UIStroke",card)
    stroke.Color=ok and Color3.fromRGB(90,200,120) or Color3.fromRGB(220,120,120)
    stroke.Thickness=1
    local pad=Instance.new("UIPadding",card)
    pad.PaddingTop=UDim.new(0,10)
    pad.PaddingBottom=UDim.new(0,10)
    pad.PaddingLeft=UDim.new(0,12)
    pad.PaddingRight=UDim.new(0,12)
    local row=Instance.new("Frame")
    row.Parent=card
    row.BackgroundTransparency=1
    row.Size=UDim2.new(1,0,0,22)
    row.AutomaticSize=Enum.AutomaticSize.Y
    local hl=Instance.new("UIListLayout",row)
    hl.FillDirection=Enum.FillDirection.Horizontal
    hl.Padding=UDim.new(0,8)
    hl.VerticalAlignment=Enum.VerticalAlignment.Center
    hl.HorizontalAlignment=Enum.HorizontalAlignment.Left
    local icon=Instance.new("TextLabel")
    icon.Parent=row
    icon.Size=UDim2.new(0,22,0,22)
    icon.BackgroundColor3=ok and Color3.fromRGB(34,85,60) or Color3.fromRGB(90,40,40)
    icon.Text=ok and "✓" or "!"
    icon.TextColor3=Color3.fromRGB(245,245,255)
    icon.Font=Enum.Font.GothamBold
    icon.TextSize=16
    icon.TextYAlignment=Enum.TextYAlignment.Center
    icon.TextXAlignment=Enum.TextXAlignment.Center
    Instance.new("UICorner",icon).CornerRadius=UDim.new(1,0)
    local msg=Instance.new("TextLabel")
    msg.Parent=row
    msg.BackgroundTransparency=1
    msg.TextWrapped=true
    msg.TextXAlignment=Enum.TextXAlignment.Left
    msg.Font=Enum.Font.Gotham
    msg.TextSize=14
    msg.TextColor3=Color3.fromRGB(240,244,255)
    msg.AutomaticSize=Enum.AutomaticSize.Y
    msg.Size=UDim2.new(1,-30,0,0)
    msg.Text=tostring(text or "")
    card.AnchorPoint=Vector2.new(1,0)
    card.Position=UDim2.new(1,380,0,0)
    card.Transparency=1
    TweenService:Create(card,TweenInfo.new(0.22,Enum.EasingStyle.Quad),{Position=UDim2.new(1,0,0,0),Transparency=0}):Play()
    task.delay(2.3,function()
        if card.Parent then
            TweenService:Create(card,TweenInfo.new(0.22,Enum.EasingStyle.Quad),{Position=UDim2.new(1,380,0,0),Transparency=0.05}):Play()
            task.wait(0.24)
            card:Destroy()
        end
    end)
end
local function saveKey(key)
    if not can_persist then return false end
    return pcall(function() writef(SAVE_FILENAME,key) end)
end
local function loadSavedKey()
    if not can_persist or not isf(SAVE_FILENAME) then return nil end
    local ok,data=pcall(function() return readf(SAVE_FILENAME) end)
    if ok and type(data)=="string" and #data>0 then
        return (data:gsub("^%s+",""):gsub("%s+$",""))
    end
    return nil
end
local function clearSavedKey()
    if not can_persist then return false end
    return pcall(function() writef(SAVE_FILENAME,"") end)
end
local LRM do
    local ok,lib=pcall(function() return loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))() end)
    if ok and type(lib)=="table" then
        LRM=lib
        LRM.script_id=SCRIPT_ID
    else
        LRM=nil
    end
end
do
    local k=loadSavedKey()
    if k and #k>0 then
        local proceed=false
        if LRM then
            local ok,statusObj=pcall(function() return LRM.check_key(k) end)
            if ok and type(statusObj)=="table" and statusObj.code=="KEY_VALID" then
                _env.script_key=k
                local loadOk,loadErr=pcall(function() LRM.load_script() end)
                if not loadOk then
                    loadOk,loadErr=pcall(function()
                        local src=game:HttpGet(LOADER_URL)
                        loadstring(src)()
                    end)
                end
                if loadOk then
                    Toast("Loaded successfully. Welcome to "..BRAND_NAME.."!",true)
                    return
                else
                    Toast("Load failed: "..tostring(loadErr),false)
                end
            end
        else
            _env.script_key=k
            local okRun=pcall(function()
                local src=game:HttpGet(LOADER_URL);loadstring(src)()
            end)
            if okRun then
                Toast("Loaded successfully. Welcome to "..BRAND_NAME.."!",true)
                return
            end
        end
    end
end
local RootGui=Instance.new("ScreenGui")
RootGui.Name="Cerberus_LoaderGUI"
RootGui.ResetOnSpawn=false
RootGui.IgnoreGuiInset=true
RootGui.DisplayOrder=900
RootGui.Parent=GuiRoot()
local function viewportScale()
    local v=Camera and Camera.ViewportSize or Vector2.new(1280,720)
    return math.clamp(math.min(v.X,v.Y)/900,0.90,1.35)
end
local UIScale=Instance.new("UIScale",RootGui)
UIScale.Scale=viewportScale()
if Camera then
    Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
        UIScale.Scale=viewportScale()
    end)
end
local shadow=Instance.new("ImageLabel")
shadow.Parent=RootGui
shadow.AnchorPoint=Vector2.new(0.5,0.5)
shadow.Position=UDim2.new(0.5,0,0.5,0)
shadow.Size=UDim2.new(0,660,0,380)
shadow.BackgroundTransparency=1
shadow.Image="rbxassetid://5028857084"
shadow.ImageTransparency=0.35
shadow.ScaleType=Enum.ScaleType.Slice
shadow.SliceCenter=Rect.new(24,24,276,276)
local main=Instance.new("Frame")
main.Parent=shadow
main.AnchorPoint=Vector2.new(0.5,0.5)
main.Position=UDim2.new(0.5,0,0.5,0)
main.Size=UDim2.new(1,-24,1,-24)
main.BackgroundColor3=Color3.fromRGB(16,18,32)
main.ClipsDescendants=true
Instance.new("UICorner",main).CornerRadius=UDim.new(0,18)
local mstroke=Instance.new("UIStroke",main)
mstroke.Color=ACCENT_DIM
mstroke.Thickness=1
local pad=Instance.new("UIPadding",main)
pad.PaddingTop=UDim.new(0,12)
pad.PaddingBottom=UDim.new(0,12)
pad.PaddingLeft=UDim.new(0,12)
pad.PaddingRight=UDim.new(0,12)
local shine=Instance.new("UIGradient",main)
shine.Rotation=90
shine.Color=ColorSequence.new{ColorSequenceKeypoint.new(0.00,Color3.fromRGB(24,26,46)),ColorSequenceKeypoint.new(0.60,Color3.fromRGB(18,20,38)),ColorSequenceKeypoint.new(1.00,Color3.fromRGB(14,16,30))}
local header=Instance.new("Frame")
header.Parent=main
header.BackgroundTransparency=1
header.Size=UDim2.new(1,0,0,64)
local left=Instance.new("Frame")
left.Parent=header
left.BackgroundTransparency=1
left.AnchorPoint=Vector2.new(0,0.5)
left.Position=UDim2.new(0,0,0.5,0)
left.Size=UDim2.new(1,-64,1,0)
local hlist=Instance.new("UIListLayout",left)
hlist.FillDirection=Enum.FillDirection.Horizontal
hlist.Padding=UDim.new(0,12)
hlist.VerticalAlignment=Enum.VerticalAlignment.Center
local logo=Instance.new("ImageLabel")
logo.Parent=left
logo.Size=UDim2.new(0,48,0,48)
logo.BackgroundTransparency=1
logo.ScaleType=Enum.ScaleType.Fit
logo.Image=("rbxthumb://type=Asset&id=%d&w=150&h=150"):format(LOGO_DECAL_ID)
Instance.new("UICorner",logo).CornerRadius=UDim.new(1,0)
local title=Instance.new("TextLabel")
title.Parent=left
title.BackgroundTransparency=1
title.TextXAlignment=Enum.TextXAlignment.Left
title.Text=BRAND_NAME.." • Loader"
title.Font=Enum.Font.GothamBold
title.TextSize=24
title.TextColor3=Color3.fromRGB(235,240,255)
title.Size=UDim2.new(1,-110,1,0)
local close=Instance.new("TextButton")
close.Parent=header
close.Text="×"
close.Font=Enum.Font.GothamBold
close.TextSize=28
close.TextColor3=Color3.fromRGB(220,225,240)
close.BackgroundTransparency=1
close.AnchorPoint=Vector2.new(1,0.5)
close.Position=UDim2.new(1,-6,0.5,0)
close.Size=UDim2.new(0,48,0,48)
local divider=Instance.new("Frame")
divider.Parent=main
divider.BackgroundColor3=ACCENT_DIM
divider.BackgroundTransparency=0.45
divider.BorderSizePixel=0
divider.Position=UDim2.new(0,0,0,64)
divider.Size=UDim2.new(1,0,0,1)
local content=Instance.new("Frame")
content.Parent=main
content.BackgroundTransparency=1
content.Position=UDim2.new(0,0,0,72)
content.Size=UDim2.new(1,0,1,-84)
local vstack=Instance.new("UIListLayout",content)
vstack.FillDirection=Enum.FillDirection.Vertical
vstack.Padding=UDim.new(0,12)
vstack.HorizontalAlignment=Enum.HorizontalAlignment.Center
vstack.SortOrder=Enum.SortOrder.LayoutOrder
local function makeButton(text)
    local b=Instance.new("TextButton")
    b.Text=text
    b.Font=Enum.Font.GothamBold
    b.TextSize=18
    b.TextColor3=Color3.fromRGB(240,244,255)
    b.BackgroundColor3=Color3.fromRGB(36,38,70)
    b.AutoButtonColor=false
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,12)
    local s=Instance.new("UIStroke",b) s.Color=Color3.fromRGB(70,80,150) s.Thickness=1
    b.MouseEnter:Connect(function() TweenService:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(46,49,92)}):Play() end)
    b.MouseLeave:Connect(function() TweenService:Create(b,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(36,38,70)}):Play() end)
    b.MouseButton1Down:Connect(function() TweenService:Create(b,TweenInfo.new(0.05),{BackgroundColor3=Color3.fromRGB(58,60,120)}):Play() end)
    b.MouseButton1Up:Connect(function() TweenService:Create(b,TweenInfo.new(0.10),{BackgroundColor3=Color3.fromRGB(46,49,92)}):Play() end)
    return b
end
local function makeChip(text)
    local l=Instance.new("TextLabel")
    l.Text=text
    l.Font=Enum.Font.Gotham
    l.TextSize=15
    l.TextColor3=Color3.fromRGB(200,210,240)
    l.BackgroundTransparency=1
    l.Size=UDim2.new(1,-4,0,20)
    l.TextXAlignment=Enum.TextXAlignment.Left
    return l
end
local keyLabel=makeChip("Enter your license key")
keyLabel.Parent=content
keyLabel.LayoutOrder=1
local keyWrap=Instance.new("Frame")
keyWrap.Parent=content
keyWrap.LayoutOrder=2
keyWrap.Size=UDim2.new(1,-4,0,52)
keyWrap.BackgroundColor3=Color3.fromRGB(22,24,48)
Instance.new("UICorner",keyWrap).CornerRadius=UDim.new(0,12)
local kbStroke=Instance.new("UIStroke",keyWrap) kbStroke.Color=Color3.fromRGB(70,80,140) kbStroke.Thickness=1
local keyPad=Instance.new("UIPadding",keyWrap)
keyPad.PaddingLeft=UDim.new(0,12) keyPad.PaddingRight=UDim.new(0,12) keyPad.PaddingTop=UDim.new(0,6)
local keyBox=Instance.new("TextBox")
keyBox.Parent=keyWrap
keyBox.Size=UDim2.new(1,0,1,-8)
keyBox.BackgroundTransparency=1
keyBox.Text=""
keyBox.PlaceholderText="paste or type your key here"
keyBox.TextXAlignment=Enum.TextXAlignment.Left
keyBox.ClearTextOnFocus=false
keyBox.Font=Enum.Font.Gotham
keyBox.TextSize=20
keyBox.TextColor3=Color3.fromRGB(240,244,255)
keyBox.PlaceholderColor3=Color3.fromRGB(160,170,210)
keyBox.Focused:Connect(function() TweenService:Create(kbStroke,TweenInfo.new(0.12),{Color=ACCENT}):Play() end)
keyBox.FocusLost:Connect(function() TweenService:Create(kbStroke,TweenInfo.new(0.12),{Color=Color3.fromRGB(70,80,140)}):Play() end)
local btnLoad=makeButton("Load Script")
btnLoad.Parent=content
btnLoad.LayoutOrder=3
btnLoad.Size=UDim2.new(1,-4,0,48)
local twoRow=Instance.new("Frame")
twoRow.Parent=content
twoRow.LayoutOrder=4
twoRow.BackgroundTransparency=1
twoRow.Size=UDim2.new(1,-4,0,48)
local grid=Instance.new("UIGridLayout",twoRow)
grid.CellPadding=UDim2.new(0,12,0,0)
grid.HorizontalAlignment=Enum.HorizontalAlignment.Center
local function updateTwo()
    local v=Camera and Camera.ViewportSize or Vector2.new(1280,720)
    local w=v.X
    local cols=3
    if w<900 then cols=1 elseif w<1200 then cols=2 else cols=3 end
    local rows=math.ceil(3/cols)
    grid.CellSize=UDim2.new(1/cols,-(cols>1 and (6*(cols-1)) or 0),1,0)
    twoRow.Size=UDim2.new(1,-4,0,rows*52)
end
local btnDiscord=makeButton("Copy Discord")
btnDiscord.Parent=twoRow
local btnLinkvertise=makeButton("Copy Linkvertise Key")
btnLinkvertise.Parent=twoRow
local btnWorkink=makeButton("Copy Work.ink Key")
btnWorkink.Parent=twoRow
updateTwo()
if Camera then Camera:GetPropertyChangedSignal("ViewportSize"):Connect(updateTwo) end
local status=Instance.new("TextLabel")
status.Parent=content
status.LayoutOrder=5
status.Text="Status: Waiting for key…"
status.Font=Enum.Font.Gotham
status.TextSize=15
status.TextXAlignment=Enum.TextXAlignment.Left
status.TextColor3=Color3.fromRGB(190,200,235)
status.BackgroundTransparency=1
status.Size=UDim2.new(1,-4,0,24)
do
    local dragging,dragStart,startPos
    local function begin(input) dragging=true dragStart=input.Position startPos=shadow.Position end
    local function finish() dragging=false end
    header.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then begin(input) end
    end)
    header.InputEnded:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then finish() end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
            local delta=input.Position-dragStart
            shadow.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
        end
    end)
end
local busy=false
local function setStatus(t,good)
    status.Text="Status: "..t
    status.TextColor3=good and Color3.fromRGB(160,235,190) or Color3.fromRGB(235,190,190)
end
local function preCheckAndLoad(key,isAuto)
    if busy then return end
    busy=true
    btnLoad.Text="Validating key…"
    TweenService:Create(btnLoad,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(58,60,120)}):Play()
    key=(key or ""):gsub("^%s+",""):gsub("%s+$","")
    if key=="" then
        setStatus("Please enter a valid key.",false)
        Toast("Please enter a valid key.",false)
        busy=false
        btnLoad.Text="Load Script"
        TweenService:Create(btnLoad,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(36,38,70)}):Play()
        return
    end
    local code,message,extra
    if LRM then
        local ok,statusObj=pcall(function() return LRM.check_key(key) end)
        if ok and type(statusObj)=="table" then
            code,message,extra=statusObj.code,statusObj.message,statusObj.data
        else
            setStatus("Key check failed (library). Falling back to loader.",false)
            Toast("Key check failed: "..tostring(statusObj),false)
        end
    else
        setStatus("Key-check lib unavailable. Validating in loader…",false)
    end
    if code then
        if code=="KEY_VALID" then
            local ttl=extra and tonumber(extra.auth_expire or 0) or 0
            if ttl==-1 or ttl==0 then
                setStatus("Key valid (lifetime). Loading…",true)
            else
                local remain=math.max(0,ttl-os.time())
                local pretty=(remain>0) and (("%dh %dm %ds"):format(math.floor(remain/3600),math.floor(remain%3600/60),remain%60)) or "expiring soon"
                setStatus(("Key valid • %s left. Loading…"):format(pretty),true)
            end
            saveKey(key)
            _env.script_key=key
            Toast("Loaded successfully. Welcome to "..BRAND_NAME.."!",true)
            if RootGui and RootGui.Parent then
                btnLoad.Text="Loaded"
                task.spawn(function()
                    task.wait(1.2)
                    if RootGui and RootGui.Parent then RootGui:Destroy() end
                end)
            end
            local loadOk,loadErr=pcall(function() return LRM.load_script() end)
            if not loadOk then
                loadOk,loadErr=pcall(function()
                    local src=game:HttpGet(LOADER_URL);loadstring(src)()
                end)
            end
            if not loadOk then
                Toast("Load failed: "..tostring(loadErr),false)
            end
            busy=false
            return
        else
            local friendly=({
                KEY_EXPIRED="Key expired. Please renew.",
                KEY_BANNED="Key is blacklisted.",
                KEY_HWID_LOCKED="Key locked to a different HWID. Use /resethwid in bot.",
                KEY_INCORRECT="Key wrong or deleted.",
                KEY_INVALID="Key format invalid.",
                SCRIPT_ID_INCORRECT="Configured SCRIPT_ID is incorrect / missing on Luarmor.",
                SCRIPT_ID_INVALID="SCRIPT_ID format invalid. Use the exact script id (not project id).",
                INVALID_EXECUTOR="Executor not supported by Luarmor.",
                SECURITY_ERROR="Security error (cloudflare/signature).",
                TIME_ERROR="Client time invalid / request timeout.",
                UNKNOWN_ERROR="Unknown server error."
            })[code] or ("Key rejected: "..tostring(message or code))
            setStatus(friendly,false)
            Toast(friendly,false)
            if isAuto then clearSavedKey() end
            busy=false
            btnLoad.Text="Load Script"
            TweenService:Create(btnLoad,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(36,38,70)}):Play()
            return
        end
    end
    setStatus("Validating in loader…",true)
    _env.script_key=key
    local okRun,errRun=pcall(function()
        local src=game:HttpGet(LOADER_URL);loadstring(src)()
    end)
    if okRun then
        saveKey(key)
        Toast("Loaded successfully. Welcome to "..BRAND_NAME.."!",true)
        btnLoad.Text="Loaded"
        task.spawn(function()
            task.wait(1.2)
            if RootGui and RootGui.Parent then RootGui:Destroy() end
        end)
    else
        setStatus("Load failed: "..tostring(errRun),false)
        Toast("Load failed: "..tostring(errRun),false)
        if isAuto then clearSavedKey() end
        busy=false
        btnLoad.Text="Load Script"
        TweenService:Create(btnLoad,TweenInfo.new(0.1),{BackgroundColor3=Color3.fromRGB(36,38,70)}):Play()
    end
end
close.MouseButton1Click:Connect(function()
    if RootGui and RootGui.Parent then RootGui:Destroy() end
end)
btnDiscord.MouseButton1Click:Connect(function()
    if has_clip then setclip(DISCORD_LINK) Toast("Discord link copied.",true) else Toast("Clipboard unsupported. Printed to console.",false) print("[Cerberus] Discord:",DISCORD_LINK) end
end)
btnLinkvertise.MouseButton1Click:Connect(function()
    if LINKVERTISE_KEY_LINK=="KEY_LINK_PLACEHOLDER" then Toast("Replace LINKVERTISE_KEY_LINK with your real URL.",false) return end
    if has_clip then setclip(LINKVERTISE_KEY_LINK) Toast("Linkvertise key link copied.",true) else Toast("Clipboard unsupported. Printed to console.",false) print("[Cerberus] Linkvertise Key:",LINKVERTISE_KEY_LINK) end
end)
btnWorkink.MouseButton1Click:Connect(function()
    if WORKINK_KEY_LINK=="KEY_LINK_PLACEHOLDER" then Toast("Replace WORKINK_KEY_LINK with your real URL.",false) return end
    if has_clip then setclip(WORKINK_KEY_LINK) Toast("Work.ink key link copied.",true) else Toast("Clipboard unsupported. Printed to console.",false) print("[Cerberus] Work.ink Key:",WORKINK_KEY_LINK) end
end)
btnLoad.MouseButton1Click:Connect(function()
    preCheckAndLoad(keyBox.Text,false)
end)
keyBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then preCheckAndLoad(keyBox.Text,false) end
end)
