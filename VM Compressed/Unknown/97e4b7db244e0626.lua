local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- SETTINGS
local PREFIX = "Badshah-"
local LOOTLABS_LINK = "https://lootdest.org/s?fcmmeJZf"
local LINKVERTISE_LINK = "https://link-center.net/6147628/ua2rfLp2u1ep"

-- NUMBER CONVERSION
local convert = {
    ["0"] = "X",
    ["1"] = "Z",
    ["2"] = "A",
    ["3"] = "G",
    ["4"] = "W",
    ["5"] = "Q",
    ["6"] = "M",
    ["7"] = "B",
    ["8"] = "O",
    ["9"] = "V"
}

-- GENERATE TODAY KEY
local function generateKey()
    local date = os.date("%d%m%Y")
    local result = ""

    for i = 1, #date do
        local char = date:sub(i, i)
        result = result .. (convert[char] or char)
    end

    return PREFIX .. result
end

local TODAY_KEY = generateKey()

-- NOTIFICATION HELPER
local function notify(text)
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Key System",
            Text = text,
            Duration = 3
        })
    end)
end

-- DISCORD ICON DECODER & FALLBACK
local discordIconAsset = "rbxassetid://15058474299"
pcall(function()
    if writefile and getcustomasset then
        local base64Data = "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"
        local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        local function base64decode(data)
            data = string.gsub(data, '[^'..b..'=]', '')
            return (string.gsub(data, '.', function(x)
                if (x == '=') then return '' end
                local r,f='',(b:find(x)-1)
                for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
                return r;
            end):gsub('%d%d%d%d%d%d%d%d', function(x)
                local r=0
                for i=1,8 do r=r+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
                return string.char(r)
            end))
        end
        writefile("discord_icon.png", base64decode(base64Data))
        discordIconAsset = getcustomasset("discord_icon.png")
    end
end)

-- GUI SETUP
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = player.PlayerGui

-- MAIN CONTAINER FRAME (Matches the design & shape of the layout screenshot)
local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Parent = ScreenGui
Main.Size = UDim2.new(0, 320, 0, 270)
Main.Position = UDim2.new(0.5, -160, 0.5, -135)
Main.BackgroundColor3 = Color3.fromRGB(24, 24, 24) -- Sleek dark charcoal background
Main.BorderSizePixel = 0
Main.ClipsDescendants = true -- Masks sliding provider selection panel

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14) -- Smooth corners matching screenshot
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Thickness = 1.5
MainStroke.Color = Color3.fromRGB(45, 45, 45) -- Elegant border outline
MainStroke.Parent = Main

-- DRAGGING FUNCTIONALITY
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- TITLE (Centered at the top, "Need Key")
local Title = Instance.new("TextLabel")
Title.Name = "TitleLabel"
Title.Parent = Main
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Position = UDim2.new(0, 0, 0, 18)
Title.Text = "Need Key"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Center

-- CLOSE BUTTON
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = Main
CloseButton.BackgroundTransparency = 1
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -28, 0, 12)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 13
CloseButton.TextColor3 = Color3.fromRGB(150, 150, 150)

CloseButton.MouseEnter:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(255, 75, 75)}):Play()
end)
CloseButton.MouseLeave:Connect(function()
    TweenService:Create(CloseButton, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
end)
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- DISCORD BUTTON (Positioned next to the Close button, styled with hover effects)
local DiscordBtn = Instance.new("ImageButton")
DiscordBtn.Name = "DiscordButton"
DiscordBtn.Parent = Main
DiscordBtn.BackgroundTransparency = 1
DiscordBtn.Size = UDim2.new(0, 16, 0, 16)
DiscordBtn.Position = UDim2.new(1, -50, 0, 14)
DiscordBtn.Image = discordIconAsset
DiscordBtn.ImageColor3 = Color3.fromRGB(150, 150, 150)

DiscordBtn.MouseEnter:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(88, 101, 242)}):Play()
end)
DiscordBtn.MouseLeave:Connect(function()
    TweenService:Create(DiscordBtn, TweenInfo.new(0.2), {ImageColor3 = Color3.fromRGB(150, 150, 150)}):Play()
end)
DiscordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/aeMymxbST")
    notify("Discord link copied successfully!")
end)

-- ==========================================
--             MAIN CONTROLS PANEL
-- ==========================================
local MainPanel = Instance.new("Frame")
MainPanel.Name = "MainPanel"
MainPanel.Parent = Main
MainPanel.BackgroundTransparency = 1
MainPanel.Size = UDim2.new(1, 0, 1, 0)
MainPanel.Position = UDim2.new(0, 0, 0, 0)

-- TEXT BOX (Key Entry)
local KeyBox = Instance.new("TextBox")
KeyBox.Name = "KeyBox"
KeyBox.Parent = MainPanel
KeyBox.Size = UDim2.new(0, 276, 0, 48)
KeyBox.Position = UDim2.new(0.5, -138, 0, 58)
KeyBox.PlaceholderText = "TextBox"
KeyBox.Text = ""
KeyBox.Font = Enum.Font.GothamMedium
KeyBox.TextSize = 14
KeyBox.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
KeyBox.ClearTextOnFocus = false
KeyBox.BorderSizePixel = 0

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyBox

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Thickness = 1
KeyStroke.Color = Color3.fromRGB(50, 50, 50)
KeyStroke.Parent = KeyBox

KeyBox.Focused:Connect(function()
    TweenService:Create(KeyStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(80, 80, 80)}):Play()
end)
KeyBox.FocusLost:Connect(function()
    TweenService:Create(KeyStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(50, 50, 50)}):Play()
end)

-- VERIFY BUTTON (Green button from layout screenshot)
local Verify = Instance.new("TextButton")
Verify.Name = "VerifyButton"
Verify.Parent = MainPanel
Verify.Size = UDim2.new(0, 276, 0, 48)
Verify.Position = UDim2.new(0.5, -138, 0, 118)
Verify.Text = "Verify"
Verify.Font = Enum.Font.GothamBold
Verify.TextSize = 15
Verify.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
Verify.TextColor3 = Color3.fromRGB(255, 255, 255)
Verify.BorderSizePixel = 0

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 10)
VerifyCorner.Parent = Verify

Verify.MouseEnter:Connect(function()
    TweenService:Create(Verify, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(54, 215, 126)}):Play()
end)
Verify.MouseLeave:Connect(function()
    TweenService:Create(Verify, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(46, 204, 113)}):Play()
end)

-- GET KEY LINK BUTTON (Blue button from layout screenshot)
local GetKeyLink = Instance.new("TextButton")
GetKeyLink.Name = "GetKeyLinkButton"
GetKeyLink.Parent = MainPanel
GetKeyLink.Size = UDim2.new(0, 276, 0, 48)
GetKeyLink.Position = UDim2.new(0.5, -138, 0, 178)
GetKeyLink.Text = "Get Key Link"
GetKeyLink.Font = Enum.Font.GothamBold
GetKeyLink.TextSize = 15
GetKeyLink.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
GetKeyLink.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyLink.BorderSizePixel = 0

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 10)
GetKeyCorner.Parent = GetKeyLink

GetKeyLink.MouseEnter:Connect(function()
    TweenService:Create(GetKeyLink, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(74, 170, 235)}):Play()
end)
GetKeyLink.MouseLeave:Connect(function()
    TweenService:Create(GetKeyLink, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(52, 152, 219)}):Play()
end)

-- ==========================================
--            PROVIDER SELECTION PANEL
-- ==========================================
local ProviderPanel = Instance.new("Frame")
ProviderPanel.Name = "ProviderPanel"
ProviderPanel.Parent = Main
ProviderPanel.BackgroundTransparency = 1
ProviderPanel.Size = UDim2.new(1, 0, 1, 0)
ProviderPanel.Position = UDim2.new(1, 0, 0, 0) -- Starts offset to the right

-- LOOTLABS PROVIDER
local LootLabs = Instance.new("TextButton")
LootLabs.Name = "LootLabsButton"
LootLabs.Parent = ProviderPanel
LootLabs.Size = UDim2.new(0, 276, 0, 48)
LootLabs.Position = UDim2.new(0.5, -138, 0, 58)
LootLabs.Text = "LootLabs"
LootLabs.Font = Enum.Font.GothamBold
LootLabs.TextSize = 15
LootLabs.BackgroundColor3 = Color3.fromRGB(120, 40, 200)
LootLabs.TextColor3 = Color3.fromRGB(255, 255, 255)
LootLabs.BorderSizePixel = 0

local LootCorner = Instance.new("UICorner")
LootCorner.CornerRadius = UDim.new(0, 10)
LootCorner.Parent = LootLabs

LootLabs.MouseEnter:Connect(function()
    TweenService:Create(LootLabs, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(140, 60, 220)}):Play()
end)
LootLabs.MouseLeave:Connect(function()
    TweenService:Create(LootLabs, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(120, 40, 200)}):Play()
end)

-- LINKVERTISE PROVIDER
local Linkvertise = Instance.new("TextButton")
Linkvertise.Name = "LinkvertiseButton"
Linkvertise.Parent = ProviderPanel
Linkvertise.Size = UDim2.new(0, 276, 0, 48)
Linkvertise.Position = UDim2.new(0.5, -138, 0, 118)
Linkvertise.Text = "Linkvertise"
Linkvertise.Font = Enum.Font.GothamBold
Linkvertise.TextSize = 15
Linkvertise.BackgroundColor3 = Color3.fromRGB(230, 95, 30)
Linkvertise.TextColor3 = Color3.fromRGB(255, 255, 255)
Linkvertise.BorderSizePixel = 0

local LinkCorner = Instance.new("UICorner")
LinkCorner.CornerRadius = UDim.new(0, 10)
LinkCorner.Parent = Linkvertise

Linkvertise.MouseEnter:Connect(function()
    TweenService:Create(Linkvertise, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(250, 115, 50)}):Play()
end)
Linkvertise.MouseLeave:Connect(function()
    TweenService:Create(Linkvertise, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(230, 95, 30)}):Play()
end)

-- GO BACK BUTTON
local Back = Instance.new("TextButton")
Back.Name = "BackButton"
Back.Parent = ProviderPanel
Back.Size = UDim2.new(0, 276, 0, 48)
Back.Position = UDim2.new(0.5, -138, 0, 178)
Back.Text = "Go Back"
Back.Font = Enum.Font.GothamBold
Back.TextSize = 15
Back.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Back.TextColor3 = Color3.fromRGB(200, 200, 200)
Back.BorderSizePixel = 0

local BackCorner = Instance.new("UICorner")
BackCorner.CornerRadius = UDim.new(0, 10)
BackCorner.Parent = Back

Back.MouseEnter:Connect(function()
    TweenService:Create(Back, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(70, 70, 70), TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
end)
Back.MouseLeave:Connect(function()
    TweenService:Create(Back, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50), TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
end)

-- ==========================================
--             PANEL NAVIGATION
-- ==========================================
GetKeyLink.MouseButton1Click:Connect(function()
    Title.Text = "Select Key Provider"
    TweenService:Create(MainPanel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(-1, 0, 0, 0)}):Play()
    TweenService:Create(ProviderPanel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
end)

local function goBack()
    Title.Text = "Need Key"
    TweenService:Create(MainPanel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)}):Play()
    TweenService:Create(ProviderPanel, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, 0, 0, 0)}):Play()
end

Back.MouseButton1Click:Connect(goBack)

-- ==========================================
--                  ACTIONS
-- ==========================================

-- COPY LOOTLABS LINK
LootLabs.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(LOOTLABS_LINK)
        notify("LootLabs link copied to clipboard")
    else
        notify("Clipboard not supported. Link: " .. LOOTLABS_LINK)
    end
    goBack()
end)

-- COPY LINKVERTISE LINK
Linkvertise.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(LINKVERTISE_LINK)
        notify("Linkvertise link copied to clipboard")
    else
        notify("Clipboard not supported. Link: " .. LINKVERTISE_LINK)
    end
    goBack()
end)

-- SUBMIT KEY verification
Verify.MouseButton1Click:Connect(function()
    if KeyBox.Text == TODAY_KEY then
        notify("Key Verified Successfully")
        task.wait(1)
        ScreenGui:Destroy()
        -- Load target script
        loadstring(game:HttpGet("https://gist.githubusercontent.com/SomeWeirdoDain/c3019e3d126273208e2c2ebbd97d4cf1/raw/0691e5233618a9f43c30c9336cd47769ac0602a6/gistfile1.txt"))()
    else
        notify("Invalid Key")
        KeyBox.Text = ""
    end
end)

-- NOTIFICATION ON RUN (Join Discord notification)
notify("Join our Discord for more Roblox scripts")
