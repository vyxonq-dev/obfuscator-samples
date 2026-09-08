local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service    = "n3xt"
Junkie.identifier = "1109067"
Junkie.provider   = "N3xt"

local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Lighting     = game:GetService("Lighting")
local LocalPlayer  = Players.LocalPlayer

local SafeGui
pcall(function() SafeGui = gethui() end)
if not SafeGui then SafeGui = game:GetService("CoreGui") end

local PURPLE  = Color3.fromRGB(123,  95, 240)
local PURPLE2 = Color3.fromRGB(145, 115, 255)
local NAVY    = Color3.fromRGB( 10,  10,  18)
local NAVY2   = Color3.fromRGB( 16,  16,  28)
local NAVY3   = Color3.fromRGB( 22,  22,  38)
local BORDER  = Color3.fromRGB( 35,  35,  60)
local WHITE   = Color3.fromRGB(255, 255, 255)
local MUTED   = Color3.fromRGB( 90,  90, 120)
local RED     = Color3.fromRGB(200,  70,  70)
local GREEN   = Color3.fromRGB( 60, 200, 110)

local KEY_FILE = "verified_key.txt"

local function hasFS()
    return pcall(function() return type(writefile) == "function" end)
       and pcall(function() return type(readfile)  == "function" end)
       and pcall(function() return type(isfile)    == "function" end)
end
local fsOK = hasFS()

local function SaveKey(key)
    if not fsOK then return end
    pcall(writefile, KEY_FILE, key)
end
local function LoadKey()
    if not fsOK then return nil end
    local ok, v = pcall(function()
        if isfile(KEY_FILE) then return readfile(KEY_FILE) end
    end)
    if ok and v and v ~= "" then return v end
    return nil
end
local function ClearKey()
    if not fsOK then return end
    pcall(function() delfile(KEY_FILE) end)
end

local function SetBlur(on)
    local b = Lighting:FindFirstChild("N3XTBlur")
    if on and not b then
        local bl = Instance.new("BlurEffect")
        bl.Size = 18; bl.Name = "N3XTBlur"; bl.Parent = Lighting
    elseif not on and b then
        b:Destroy()
    end
end

local function ShowLoadingScreen(fromSg)
    SetBlur(false)
    if fromSg then
        for _, c in ipairs(fromSg:GetDescendants()) do
            if c:IsA("Frame") or c:IsA("ImageLabel") or c:IsA("TextLabel") or c:IsA("TextButton") or c:IsA("TextBox") then
                pcall(function()
                    TweenService:Create(c, TweenInfo.new(0.25), {BackgroundTransparency = 1}):Play()
                end)
                pcall(function()
                    TweenService:Create(c, TweenInfo.new(0.25), {TextTransparency = 1}):Play()
                end)
                pcall(function()
                    TweenService:Create(c, TweenInfo.new(0.25), {ImageTransparency = 1}):Play()
                end)
            end
        end
        task.wait(0.3); fromSg:Destroy()
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = "N3XT_Loading"; sg.ResetOnSpawn = false
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.IgnoreGuiInset = true; sg.Parent = SafeGui

    local bg = Instance.new("Frame", sg)
    bg.Size = UDim2.new(1,0,1,0); bg.BackgroundColor3 = NAVY
    bg.BackgroundTransparency = 1; bg.BorderSizePixel = 0; bg.ZIndex = 1
    TweenService:Create(bg, TweenInfo.new(0.35), {BackgroundTransparency = 0}):Play()

    local glow = Instance.new("ImageLabel", bg)
    glow.Size = UDim2.new(0,700,0,420); glow.Position = UDim2.new(0.5,-350,0.5,-210)
    glow.BackgroundTransparency = 1; glow.Image = "rbxassetid://7072725274"
    glow.ImageColor3 = Color3.fromRGB(70,40,190); glow.ImageTransparency = 0.80; glow.ZIndex = 1

    local CW, CH = 340, 220
    local card = Instance.new("Frame", sg)
    card.Size = UDim2.new(0,CW,0,CH)
    card.Position = UDim2.new(0.5,-CW/2,0.52,-CH/2)
    card.BackgroundColor3 = NAVY2; card.BorderSizePixel = 0; card.ZIndex = 2
    Instance.new("UICorner", card).CornerRadius = UDim.new(0,16)
    local cs = Instance.new("UIStroke", card)
    cs.Color = BORDER; cs.Thickness = 1; cs.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    TweenService:Create(card, TweenInfo.new(0.4,Enum.EasingStyle.Quint),
        {Position = UDim2.new(0.5,-CW/2,0.5,-CH/2)}):Play()

    local pill = Instance.new("Frame", card)
    pill.Size = UDim2.new(0,158,0,24); pill.Position = UDim2.new(0.5,-79,0,24)
    pill.BackgroundColor3 = Color3.fromRGB(28,20,55); pill.BorderSizePixel = 0; pill.ZIndex = 3
    Instance.new("UICorner", pill).CornerRadius = UDim.new(1,0)
    local ps = Instance.new("UIStroke", pill)
    ps.Color = Color3.fromRGB(75,50,155); ps.Thickness = 1
    local pdot = Instance.new("Frame", pill)
    pdot.Size = UDim2.new(0,6,0,6); pdot.Position = UDim2.new(0,10,0.5,-3)
    pdot.BackgroundColor3 = PURPLE; pdot.BorderSizePixel = 0; pdot.ZIndex = 4
    Instance.new("UICorner", pdot).CornerRadius = UDim.new(1,0)
    local ptxt = Instance.new("TextLabel", pill)
    ptxt.Size = UDim2.new(1,-22,1,0); ptxt.Position = UDim2.new(0,22,0,0)
    ptxt.BackgroundTransparency = 1; ptxt.Text = "◆  N3XT  ·  KEY SYSTEM"
    ptxt.TextColor3 = Color3.fromRGB(155,125,255); ptxt.Font = Enum.Font.GothamBold
    ptxt.TextSize = 10; ptxt.TextXAlignment = Enum.TextXAlignment.Left; ptxt.ZIndex = 4

    local title = Instance.new("TextLabel", card)
    title.Size = UDim2.new(1,-48,0,50); title.Position = UDim2.new(0,24,0,62)
    title.BackgroundTransparency = 1; title.Text = "N3XT"
    title.TextColor3 = WHITE; title.Font = Enum.Font.GothamBlack
    title.TextSize = 38; title.TextXAlignment = Enum.TextXAlignment.Left; title.ZIndex = 3

    local loadTxt = Instance.new("TextLabel", card)
    loadTxt.Size = UDim2.new(1,-48,0,24); loadTxt.Position = UDim2.new(0,24,0,116)
    loadTxt.BackgroundTransparency = 1; loadTxt.Text = "Loading"
    loadTxt.TextColor3 = MUTED; loadTxt.Font = Enum.Font.Gotham
    loadTxt.TextSize = 13; loadTxt.TextXAlignment = Enum.TextXAlignment.Left; loadTxt.ZIndex = 3

    local barBg = Instance.new("Frame", card)
    barBg.Size = UDim2.new(1,-48,0,3); barBg.Position = UDim2.new(0,24,0,158)
    barBg.BackgroundColor3 = NAVY3; barBg.BorderSizePixel = 0; barBg.ZIndex = 3
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1,0)
    local barFill = Instance.new("Frame", barBg)
    barFill.Size = UDim2.new(0,0,1,0); barFill.BackgroundColor3 = PURPLE
    barFill.BorderSizePixel = 0; barFill.ZIndex = 4
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1,0)
    TweenService:Create(barFill, TweenInfo.new(3,Enum.EasingStyle.Quint),
        {Size = UDim2.new(1,0,1,0)}):Play()

    task.spawn(function()
        local f = {"Loading","Loading.","Loading..","Loading..."}
        local i = 1
        while loadTxt.Parent do
            loadTxt.Text = f[i]; i = (i%#f)+1; task.wait(0.4)
        end
    end)

    task.spawn(function()
        local t = 0
        while t < 3 do task.wait(0.1); t += 0.1; if _G.N3XTLoaded then break end end
        TweenService:Create(bg,   TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
        TweenService:Create(card, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
        task.wait(0.5); sg:Destroy()
    end)
end

local function BuildKeyUI()
    for _, c in ipairs(SafeGui:GetChildren()) do
        if c.Name == "N3XT_KeySystem" then c:Destroy() end
    end
    SetBlur(true)

    local sg = Instance.new("ScreenGui")
    sg.Name = "N3XT_KeySystem"; sg.ResetOnSpawn = false
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.IgnoreGuiInset = true; sg.Parent = SafeGui
    sg.AncestryChanged:Connect(function(_,p) if not p then SetBlur(false) end end)

    local bg = Instance.new("Frame", sg)
    bg.Size = UDim2.new(1,0,1,0); bg.BackgroundColor3 = NAVY
    bg.BackgroundTransparency = 1; bg.BorderSizePixel = 0; bg.ZIndex = 1
    TweenService:Create(bg, TweenInfo.new(0.3), {BackgroundTransparency = 0}):Play()

    local glow = Instance.new("ImageLabel", bg)
    glow.Size = UDim2.new(0,700,0,420); glow.Position = UDim2.new(0.5,-350,0.5,-210)
    glow.BackgroundTransparency = 1; glow.Image = "rbxassetid://7072725274"
    glow.ImageColor3 = Color3.fromRGB(70,40,190); glow.ImageTransparency = 0.80; glow.ZIndex = 1

    local CW, CH = 420, 340
    local card = Instance.new("Frame", sg)
    card.Size = UDim2.new(0,CW,0,CH)
    card.Position = UDim2.new(0.5,-CW/2,0.52,-CH/2)
    card.BackgroundColor3 = NAVY2; card.BorderSizePixel = 0; card.ZIndex = 2
    Instance.new("UICorner", card).CornerRadius = UDim.new(0,16)
    local cstroke = Instance.new("UIStroke", card)
    cstroke.Color = BORDER; cstroke.Thickness = 1; cstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    TweenService:Create(card, TweenInfo.new(0.4,Enum.EasingStyle.Quint),
        {Position = UDim2.new(0.5,-CW/2,0.5,-CH/2)}):Play()

    local pill = Instance.new("Frame", card)
    pill.Size = UDim2.new(0,158,0,24); pill.Position = UDim2.new(0.5,-79,0,28)
    pill.BackgroundColor3 = Color3.fromRGB(28,20,55); pill.BorderSizePixel = 0; pill.ZIndex = 3
    Instance.new("UICorner", pill).CornerRadius = UDim.new(1,0)
    local ps2 = Instance.new("UIStroke", pill)
    ps2.Color = Color3.fromRGB(75,50,155); ps2.Thickness = 1
    local pdot2 = Instance.new("Frame", pill)
    pdot2.Size = UDim2.new(0,6,0,6); pdot2.Position = UDim2.new(0,10,0.5,-3)
    pdot2.BackgroundColor3 = PURPLE; pdot2.BorderSizePixel = 0; pdot2.ZIndex = 4
    Instance.new("UICorner", pdot2).CornerRadius = UDim.new(1,0)
    local ptxt2 = Instance.new("TextLabel", pill)
    ptxt2.Size = UDim2.new(1,-22,1,0); ptxt2.Position = UDim2.new(0,22,0,0)
    ptxt2.BackgroundTransparency = 1; ptxt2.Text = "◆  N3XT  ·  KEY SYSTEM"
    ptxt2.TextColor3 = Color3.fromRGB(155,125,255); ptxt2.Font = Enum.Font.GothamBold
    ptxt2.TextSize = 10; ptxt2.TextXAlignment = Enum.TextXAlignment.Left; ptxt2.ZIndex = 4

    local h1 = Instance.new("TextLabel", card)
    h1.Size = UDim2.new(1,-48,0,38); h1.Position = UDim2.new(0,24,0,68)
    h1.BackgroundTransparency = 1; h1.Text = "Access N3XT."
    h1.TextColor3 = PURPLE; h1.Font = Enum.Font.GothamBlack
    h1.TextSize = 28; h1.TextXAlignment = Enum.TextXAlignment.Left; h1.ZIndex = 3

    local h2 = Instance.new("TextLabel", card)
    h2.Size = UDim2.new(1,-48,0,38); h2.Position = UDim2.new(0,24,0,103)
    h2.BackgroundTransparency = 1; h2.Text = "Enter your key."
    h2.TextColor3 = WHITE; h2.Font = Enum.Font.GothamBlack
    h2.TextSize = 28; h2.TextXAlignment = Enum.TextXAlignment.Left; h2.ZIndex = 3

    local iWrap = Instance.new("Frame", card)
    iWrap.Size = UDim2.new(1,-48,0,40); iWrap.Position = UDim2.new(0,24,0,174)
    iWrap.BackgroundColor3 = NAVY3; iWrap.BorderSizePixel = 0; iWrap.ZIndex = 3
    Instance.new("UICorner", iWrap).CornerRadius = UDim.new(0,8)
    local iStroke = Instance.new("UIStroke", iWrap)
    iStroke.Color = BORDER; iStroke.Thickness = 1

    local inputBox = Instance.new("TextBox", iWrap)
    inputBox.Size = UDim2.new(1,-20,1,0); inputBox.Position = UDim2.new(0,10,0,0)
    inputBox.BackgroundTransparency = 1; inputBox.PlaceholderText = "Paste key here..."
    inputBox.PlaceholderColor3 = Color3.fromRGB(55,55,85); inputBox.Text = ""
    inputBox.TextColor3 = Color3.fromRGB(215,210,255); inputBox.Font = Enum.Font.Gotham
    inputBox.TextSize = 13; inputBox.ClearTextOnFocus = false; inputBox.ZIndex = 4
    inputBox.Focused:Connect(function()
        TweenService:Create(iStroke, TweenInfo.new(0.2), {Color = PURPLE}):Play()
    end)
    inputBox.FocusLost:Connect(function()
        TweenService:Create(iStroke, TweenInfo.new(0.2), {Color = BORDER}):Play()
    end)

    local statusLbl = Instance.new("TextLabel", card)
    statusLbl.Size = UDim2.new(1,-48,0,18); statusLbl.Position = UDim2.new(0,24,0,222)
    statusLbl.BackgroundTransparency = 1; statusLbl.Text = ""
    statusLbl.TextColor3 = RED; statusLbl.Font = Enum.Font.Gotham
    statusLbl.TextSize = 11; statusLbl.TextXAlignment = Enum.TextXAlignment.Left; statusLbl.ZIndex = 3

    local btn = Instance.new("TextButton", card)
    btn.Size = UDim2.new(1,-48,0,40); btn.Position = UDim2.new(0,24,0,248)
    btn.BackgroundColor3 = PURPLE; btn.Text = "Get started  →"
    btn.TextColor3 = WHITE; btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14; btn.BorderSizePixel = 0; btn.AutoButtonColor = false; btn.ZIndex = 3
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = PURPLE2}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = PURPLE}):Play()
    end)

    local linkBtn = Instance.new("TextButton", card)
    linkBtn.Size = UDim2.new(1,-48,0,24); linkBtn.Position = UDim2.new(0,24,0,302)
    linkBtn.BackgroundTransparency = 1; linkBtn.Text = "Don't have a key?  Get one here  →"
    linkBtn.TextColor3 = Color3.fromRGB(100,80,180); linkBtn.Font = Enum.Font.Gotham
    linkBtn.TextSize = 11; linkBtn.BorderSizePixel = 0; linkBtn.ZIndex = 3
    linkBtn.MouseEnter:Connect(function()
        TweenService:Create(linkBtn, TweenInfo.new(0.12), {TextColor3 = PURPLE}):Play()
    end)
    linkBtn.MouseLeave:Connect(function()
        TweenService:Create(linkBtn, TweenInfo.new(0.12),
            {TextColor3 = Color3.fromRGB(100,80,180)}):Play()
    end)

    return sg, inputBox, btn, linkBtn, statusLbl
end

local validated = false
local MAX_ATTEMPTS = 5
local attempts = 0

local function FriendlyError(msg)
    if msg == "KEY_EXPIRED"       then return "✗  Key expired — get a new one" end
    if msg == "HWID_BANNED"       then return "✗  Hardware banned" end
    if msg == "SERVICE_MISMATCH"  then return "✗  Key is for a different service" end
    if msg == "HWID_MISMATCH"     then return "✗  HWID limit reached" end
    return "✗  Invalid key"
end

local savedKey = LoadKey()
if savedKey then
    local result = Junkie.check_key(savedKey)
    if result and result.valid then
        getgenv().SCRIPT_KEY = savedKey
        validated = true
        ShowLoadingScreen(nil)
    else
        ClearKey()
        savedKey = nil
    end
end

if not validated then
    local sg, inputBox, btn, linkBtn, statusLbl = BuildKeyUI()
    local busy = false

    if savedKey then
        inputBox.Text  = savedKey
        statusLbl.Text = "Saved key is invalid or expired."
    end

    local function TryVerify()
        if busy then return end
        if attempts >= MAX_ATTEMPTS then
            statusLbl.Text = "✗  Too many failed attempts!"
            statusLbl.TextColor3 = RED
            return
        end

        busy = true
        btn.Text             = "Checking..."
        btn.BackgroundColor3 = Color3.fromRGB(80,60,160)
        statusLbl.Text       = ""

        local key = inputBox.Text:gsub("%s+","")
        if key == "" then
            statusLbl.Text      = "✗  Please enter a key"
            statusLbl.TextColor3 = RED
            btn.Text            = "Get started  →"
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = PURPLE}):Play()
            busy = false; return
        end

        attempts += 1
        local validation = Junkie.check_key(key)

        if validation and validation.valid then

            if validation.message == "HWID_BANNED" then
                LocalPlayer:Kick("Hardware banned")
                return
            end
            SaveKey(key)
            getgenv().SCRIPT_KEY = key
            validated = true
            ShowLoadingScreen(sg)
        else
            local errMsg = FriendlyError(validation and validation.message or "")
            statusLbl.Text       = errMsg
            statusLbl.TextColor3 = RED
            btn.Text             = "Get started  →"
            TweenService:Create(btn, TweenInfo.new(0.1),
                {BackgroundColor3 = Color3.fromRGB(140,40,40)}):Play()
            task.wait(0.15)
            TweenService:Create(btn, TweenInfo.new(0.2),
                {BackgroundColor3 = PURPLE}):Play()

            if attempts >= MAX_ATTEMPTS then
                statusLbl.Text = "✗  Too many failed attempts!"
            end
        end
        busy = false
    end

    btn.MouseButton1Click:Connect(TryVerify)
    inputBox.FocusLost:Connect(function(enter) if enter then TryVerify() end end)

    linkBtn.MouseButton1Click:Connect(function()
        local link = "https://n3xt-project.xyz/key-create"
        if setclipboard then
            setclipboard(link)
            linkBtn.Text = "Link copied to clipboard!"
        else
            linkBtn.Text = link
        end
        task.delay(3, function()
            linkBtn.Text = "Don't have a key?  Get one here  →"
        end)
    end)

    while not validated do task.wait(0.05) end
end

task.wait(3)

local ok, err = pcall(function()
    loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/c3a5e462342ea16d91f0972f2183fc00711d68a753c6609ca451284a9bb5d9bf/download"))()
end)
if not ok then warn("[N3XT] Load error: " .. tostring(err)) end

_G.N3XTLoaded = true
