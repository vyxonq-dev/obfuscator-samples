-- Sailor Piece | Key System
-- Key: PaqoUsiaMicapqoXzz
-- Link: https://link-target.net/4473711/f4OEivW5Fy9i

local Players      = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui   = game:GetService("StarterGui")
local Lighting     = game:GetService("Lighting")
local LP           = Players.LocalPlayer

local REAL_KEY  = "PaqoUsiaMicapqoXzz"
local KEY_LINK  = "https://link-target.net/4473711/f4OEivW5Fy9i"
local SAVE_FILE = "SPKey2.txt"

local function notify(t, b, d)
    pcall(function()
        StarterGui:SetCore("SendNotification", {Title=t, Text=b, Duration=d or 4})
    end)
end

local function saveKey(k) pcall(function() writefile(SAVE_FILE, k) end) end
local function loadKey()
    local ok, v = pcall(function() return readfile(SAVE_FILE) end)
    if ok and v and v ~= "" then return v:gsub("%s+","") end
    return nil
end

local function loadMainScript()
    notify("✅ Loading...", "Starting Sailor Piece!", 3)
    task.wait(0.3)
    loadstring(game:HttpGet("https://rawscripts.net/raw/Moon-Update-Sailor-Piece-Keyless-40-features-op-193477"))()
end

-- Clean old
local old = LP.PlayerGui:FindFirstChild("SPKeyGui2")
if old then old:Destroy() end

-- Check saved key first
if loadKey() == REAL_KEY then
    print("[SP] Saved key valid!")
    loadMainScript()
    return
end

-- Build GUI
local sg = Instance.new("ScreenGui")
sg.Name = "SPKeyGui2"; sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true; sg.DisplayOrder = 9999
sg.Parent = LP.PlayerGui

local blur = Instance.new("BlurEffect")
blur.Size = 18; blur.Parent = Lighting

local bd = Instance.new("Frame", sg)
bd.Size = UDim2.new(1,0,1,0)
bd.BackgroundColor3 = Color3.fromRGB(0,0,0)
bd.BackgroundTransparency = 0.5
bd.BorderSizePixel = 0

local frame = Instance.new("Frame", sg)
frame.Size = UDim2.new(0, 440, 0, 310)
frame.Position = UDim2.new(0.5, -220, -0.6, 0)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
local ms = Instance.new("UIStroke", frame)
ms.Color = Color3.fromRGB(30, 160, 255); ms.Thickness = 1.8

-- Title bar
local tbar = Instance.new("Frame", frame)
tbar.Size = UDim2.new(1,0,0,52)
tbar.BackgroundColor3 = Color3.fromRGB(18,18,28)
tbar.BorderSizePixel = 0
Instance.new("UICorner", tbar).CornerRadius = UDim.new(0,14)
local tfix = Instance.new("Frame", tbar)
tfix.Size = UDim2.new(1,0,0,14); tfix.Position = UDim2.new(0,0,1,-14)
tfix.BackgroundColor3 = Color3.fromRGB(18,18,28); tfix.BorderSizePixel = 0
local titleLbl = Instance.new("TextLabel", tbar)
titleLbl.Size = UDim2.new(1,0,1,0); titleLbl.BackgroundTransparency = 1
titleLbl.Text = "⚓  Sailor Piece  —  Key System"
titleLbl.TextColor3 = Color3.fromRGB(255,255,255)
titleLbl.Font = Enum.Font.GothamBold; titleLbl.TextSize = 16

-- Subtitle
local sub = Instance.new("TextLabel", frame)
sub.Size = UDim2.new(1,-40,0,20); sub.Position = UDim2.new(0,20,0,60)
sub.BackgroundTransparency = 1
sub.Text = "Enter your key to access the script."
sub.TextColor3 = Color3.fromRGB(140,140,170)
sub.Font = Enum.Font.Gotham; sub.TextSize = 13
sub.TextXAlignment = Enum.TextXAlignment.Left

-- Note
local noteLbl = Instance.new("TextLabel", frame)
noteLbl.Size = UDim2.new(1,-40,0,18); noteLbl.Position = UDim2.new(0,20,0,82)
noteLbl.BackgroundTransparency = 1
noteLbl.Text = "⚠️  Lifetime key — once you get it keep it safe!"
noteLbl.TextColor3 = Color3.fromRGB(255,200,50)
noteLbl.Font = Enum.Font.GothamBold; noteLbl.TextSize = 12
noteLbl.TextXAlignment = Enum.TextXAlignment.Left

-- Divider
local div = Instance.new("Frame", frame)
div.Size = UDim2.new(1,-40,0,1); div.Position = UDim2.new(0,20,0,108)
div.BackgroundColor3 = Color3.fromRGB(40,40,58); div.BorderSizePixel = 0

-- Textbox
local boxBg = Instance.new("Frame", frame)
boxBg.Size = UDim2.new(1,-40,0,44); boxBg.Position = UDim2.new(0,20,0,118)
boxBg.BackgroundColor3 = Color3.fromRGB(18,18,28); boxBg.BorderSizePixel = 0
Instance.new("UICorner", boxBg).CornerRadius = UDim.new(0,8)
local boxStroke = Instance.new("UIStroke", boxBg)
boxStroke.Color = Color3.fromRGB(55,55,80); boxStroke.Thickness = 1

local tb = Instance.new("TextBox", boxBg)
tb.Size = UDim2.new(1,-16,1,0); tb.Position = UDim2.new(0,8,0,0)
tb.BackgroundTransparency = 1
tb.PlaceholderText = "Paste your key here..."
tb.PlaceholderColor3 = Color3.fromRGB(80,80,105)
tb.Text = ""; tb.TextColor3 = Color3.fromRGB(255,255,255)
tb.Font = Enum.Font.GothamBold; tb.TextSize = 14
tb.ClearTextOnFocus = false
tb.TextXAlignment = Enum.TextXAlignment.Left

-- Status
local statusLbl = Instance.new("TextLabel", frame)
statusLbl.Size = UDim2.new(1,-40,0,20); statusLbl.Position = UDim2.new(0,20,0,170)
statusLbl.BackgroundTransparency = 1; statusLbl.Text = ""
statusLbl.TextColor3 = Color3.fromRGB(255,60,60)
statusLbl.Font = Enum.Font.GothamBold; statusLbl.TextSize = 13
statusLbl.TextXAlignment = Enum.TextXAlignment.Left

-- GET KEY button
local getBtn = Instance.new("TextButton", frame)
getBtn.Size = UDim2.new(0,185,0,46); getBtn.Position = UDim2.new(0,20,0,200)
getBtn.BackgroundColor3 = Color3.fromRGB(20,20,35)
getBtn.Text = "🔗   Get Key"; getBtn.TextColor3 = Color3.fromRGB(255,255,255)
getBtn.Font = Enum.Font.GothamBold; getBtn.TextSize = 14
getBtn.BorderSizePixel = 0
Instance.new("UICorner", getBtn).CornerRadius = UDim.new(0,8)
local gkS = Instance.new("UIStroke", getBtn)
gkS.Color = Color3.fromRGB(30,160,255); gkS.Thickness = 1.2

-- SUBMIT button
local subBtn = Instance.new("TextButton", frame)
subBtn.Size = UDim2.new(0,185,0,46); subBtn.Position = UDim2.new(0,235,0,200)
subBtn.BackgroundColor3 = Color3.fromRGB(20,80,200)
subBtn.Text = "✅   Submit Key"; subBtn.TextColor3 = Color3.fromRGB(255,255,255)
subBtn.Font = Enum.Font.GothamBold; subBtn.TextSize = 14
subBtn.BorderSizePixel = 0
Instance.new("UICorner", subBtn).CornerRadius = UDim.new(0,8)

-- Footer
local footer = Instance.new("TextLabel", frame)
footer.Size = UDim2.new(1,-40,0,18); footer.Position = UDim2.new(0,20,0,262)
footer.BackgroundTransparency = 1
footer.Text = "Sailor Piece  •  Key saved after first entry"
footer.TextColor3 = Color3.fromRGB(45,45,65)
footer.Font = Enum.Font.Gotham; footer.TextSize = 11
footer.TextXAlignment = Enum.TextXAlignment.Center

-- Hover effects
getBtn.MouseEnter:Connect(function()
    TweenService:Create(getBtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(30,30,50)}):Play()
end)
getBtn.MouseLeave:Connect(function()
    TweenService:Create(getBtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(20,20,35)}):Play()
end)
subBtn.MouseEnter:Connect(function()
    TweenService:Create(subBtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(30,100,230)}):Play()
end)
subBtn.MouseLeave:Connect(function()
    TweenService:Create(subBtn,TweenInfo.new(0.12),{BackgroundColor3=Color3.fromRGB(20,80,200)}):Play()
end)

-- GET KEY click — copy link + show countdown note
getBtn.MouseButton1Click:Connect(function()
    setclipboard(KEY_LINK)
    statusLbl.TextColor3 = Color3.fromRGB(255,200,50)
    statusLbl.Text = "✅ Link copied! Complete it (5-10s) then come back."
    TweenService:Create(getBtn,TweenInfo.new(0.08),{BackgroundColor3=Color3.fromRGB(50,45,15)}):Play()
    task.wait(0.12)
    TweenService:Create(getBtn,TweenInfo.new(0.15),{BackgroundColor3=Color3.fromRGB(20,20,35)}):Play()
end)

-- SUBMIT click
subBtn.MouseButton1Click:Connect(function()
    local entered = tb.Text:gsub("%s+","")

    if entered == REAL_KEY then
        -- Correct key
        statusLbl.TextColor3 = Color3.fromRGB(50,230,100)
        statusLbl.Text = "✅ Key accepted! Loading Sailor Piece..."
        subBtn.Text = "Loading..."
        TweenService:Create(subBtn,TweenInfo.new(0.2),{BackgroundColor3=Color3.fromRGB(20,140,55)}):Play()
        ms.Color = Color3.fromRGB(50,230,100)
        saveKey(entered)
        TweenService:Create(frame,TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.In),
            {Position=UDim2.new(0.5,-220,1.6,0)}):Play()
        task.wait(0.45)
        blur:Destroy()
        sg:Destroy()
        task.wait(0.1)
        loadMainScript()
    else
        -- Wrong key
        statusLbl.TextColor3 = Color3.fromRGB(255,60,60)
        statusLbl.Text = "❌ Invalid key! Get the correct key from the link."
        local offsets = {-10,10,-8,8,-5,5,0}
        for _, ox in ipairs(offsets) do
            TweenService:Create(frame,TweenInfo.new(0.04),
                {Position=UDim2.new(0.5,-220+ox,0.5,-155)}):Play()
            task.wait(0.045)
        end
        TweenService:Create(boxStroke,TweenInfo.new(0.1),{Color=Color3.fromRGB(255,60,60)}):Play()
        task.wait(0.6)
        TweenService:Create(boxStroke,TweenInfo.new(0.3),{Color=Color3.fromRGB(55,55,80)}):Play()
    end
end)

-- Slide in animation
TweenService:Create(frame,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
    {Position=UDim2.new(0.5,-220,0.5,-155)}):Play()

task.wait(0.5)
notify("⚓ Sailor Piece Key System", "Get Key → Complete (5-10s) → Submit!", 5)
print("[SP] Key GUI ready.")
