-- v1 (Reworked Key system) --
-- ========================================
-- SERVICES & INITIALIZATION
if not game:IsLoaded() then game.Loaded:Wait() end
-- ========================================
local cloneref = cloneref or function(o) return o end

local function safe_service(name)
    return cloneref(game:GetService(name))
end

local CoreGui = safe_service("CoreGui")
local Players = safe_service("Players")
local TweenService = safe_service("TweenService")
local UserInputService = safe_service("UserInputService")
local HttpService = safe_service("HttpService")
local RunService = safe_service("RunService")

local FolderImage = "RebelAssets"
if makefolder and not isfolder(FolderImage) then
    makefolder(FolderImage)
end

local asset_mgr = {
    get = function(x)
        if x == "MmZxyDFgR6" then
            local path = FolderImage .. "/" .. x .. ".jpg"
            local InviteCode = x
            local DiscordAPI = "https://discord.com/api/v10/invites/" .. InviteCode .. "?with_counts=false&with_expiration=false"

            if isfile(path) then return getcustomasset(path) end

            local success, res = pcall(function()
                return request({
                    Url = DiscordAPI,
                    Method = "GET",
                    Headers = { ["User-Agent"] = "RobloxBot/1.0" }
                })
            end)

            if success and res and res.Body then
                local parsed = HttpService:JSONDecode(res.Body)
                if parsed and parsed.guild and parsed.guild.id and parsed.guild.icon then
                    local iconUrl = ("https://cdn.discordapp.com/icons/%s/%s.png?size=256"):format(parsed.guild.id, parsed.guild.icon)
                    local imgRes = request({ Url = iconUrl, Method = "GET" })
                    if imgRes and imgRes.Body then
                        writefile(path, imgRes.Body)
                        return getcustomasset(path)
                    end
                end
            end
        else
            local icon = tostring(x)
            local path = FolderImage .. "/" .. icon .. ".png"
            if not isfile(path) then
                local url = "https://raw.githubusercontent.com/latte-soft/lucide-roblox/master/icons/compiled/256px/" .. icon .. ".png"
                local success, data = pcall(function() return game:HttpGet(url) end)
                if success then writefile(path, data) end
            end
            local Success, Asset = pcall(getcustomasset, path)
            return Success and Asset
        end
    end
}

local gameIdToURL = {
    ['6701277882'] = '5a720805589eee8e9c7641930070282d',
    ['7660436108'] = '4433fd8479ef97bee9bb095ecbc6e95b',
    ['8469926548'] = 'd741c9689fdc4d4224d2891edea47cab',
    ['7487899635'] = 'f3ef0ef582eebd4595480ba7c7fe05f5',
}

local Config = {
    HeaderTitle = "Rebel Hub",
    Subtitle = "Powered by Luarmor.net",
    KeyLink = "https://rebelhub.pro/GetKey/",
    FileName = "RebelKey.txt"
}

local api_success, api = pcall(function()
    return loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
end)

local currentScriptId = gameIdToURL[tostring(game.GameId)]
local isSupported = false

if api_success and api and currentScriptId then
    api.script_id = currentScriptId
    isSupported = true
end

local Colors = {
    Card = Color3.fromRGB(20, 25, 40),
    Accent = Color3.fromRGB(0, 255, 170),
    Text = Color3.fromRGB(255, 255, 255),
    TextDark = Color3.fromRGB(150, 160, 180),
    InputBG = Color3.fromRGB(12, 16, 28),
    NotificationBG = Color3.fromRGB(25, 30, 45),
    NotifySuccess = Color3.fromRGB(0, 255, 170),
    NotifyWarn = Color3.fromRGB(255, 200, 50),
    NotifyError = Color3.fromRGB(255, 70, 70)
}

pcall(function() if LuarmorGot_System then LuarmorGot_System:Destroy() end end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PulsarKeySystem"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

getgenv().LuarmorGot_System = ScreenGui

if gethui then
    ScreenGui.Parent = gethui()
elseif CoreGui:FindFirstChild("RobloxGui") then
    ScreenGui.Parent = CoreGui.RobloxGui
else
    ScreenGui.Parent = CoreGui
end

local NotificationContainer = Instance.new("Frame")
NotificationContainer.Size = UDim2.new(0, 300, 1, 0)
NotificationContainer.Position = UDim2.new(1, -20, 1, -20)
NotificationContainer.AnchorPoint = Vector2.new(1, 1)
NotificationContainer.BackgroundTransparency = 1
NotificationContainer.Parent = ScreenGui

local ActiveNotifications = {}

local function UpdateNotifications()
    for i, note in ipairs(ActiveNotifications) do
        local offset = (#ActiveNotifications - i) * 70
        local targetPos = UDim2.new(0, 0, 1, -offset - 60)
        TweenService:Create(note.Instance, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    end
end

local function Notify(title, message, type, duration)
    if #ActiveNotifications >= 3 then
        local old = table.remove(ActiveNotifications, 1)
        if old and old.Instance then
            old.Instance:Destroy()
        end
    end

    local accentColor = Colors.NotifySuccess
    if type == "Warn" then accentColor = Colors.NotifyWarn
    elseif type == "Error" then accentColor = Colors.NotifyError end

    local Toast = Instance.new("Frame")
    Toast.Size = UDim2.new(1, 0, 0, 60)
    Toast.Position = UDim2.new(0, 320, 1, 0)
    Toast.BackgroundColor3 = Colors.NotificationBG
    Toast.BorderSizePixel = 0
    Toast.Parent = NotificationContainer

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Toast

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = accentColor
    UIStroke.Thickness = 1
    UIStroke.Transparency = 0.5
    UIStroke.Parent = Toast

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, -20, 0, 20)
    TitleLabel.Position = UDim2.new(0, 10, 0, 8)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = accentColor
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Toast

    local MsgLabel = Instance.new("TextLabel")
    MsgLabel.Size = UDim2.new(1, -20, 0, 20)
    MsgLabel.Position = UDim2.new(0, 10, 0, 28)
    MsgLabel.BackgroundTransparency = 1
    MsgLabel.Text = message
    MsgLabel.TextColor3 = Colors.Text
    MsgLabel.Font = Enum.Font.Gotham
    MsgLabel.TextSize = 12
    MsgLabel.TextXAlignment = Enum.TextXAlignment.Left
    MsgLabel.Parent = Toast

    local notiData = {Instance = Toast}
    table.insert(ActiveNotifications, notiData)

    UpdateNotifications()

    task.spawn(function()
        task.wait(duration or 4)
        if Toast and Toast.Parent then
            local found = false
            for i, v in ipairs(ActiveNotifications) do
                if v.Instance == Toast then
                    table.remove(ActiveNotifications, i)
                    found = true
                    break
                end
            end

            if found then
                TweenService:Create(Toast, TweenInfo.new(0.3), {BackgroundTransparency = 1, Position = UDim2.new(0, 50, Toast.Position.Y.Scale, Toast.Position.Y.Offset)}):Play()
                TweenService:Create(UIStroke, TweenInfo.new(0.3), {Transparency = 1}):Play()
                TweenService:Create(TitleLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                TweenService:Create(MsgLabel, TweenInfo.new(0.3), {TextTransparency = 1}):Play()
                task.wait(0.3)
                Toast:Destroy()
                UpdateNotifications()
            end
        end
    end)
end

local MainCard = Instance.new("Frame")
MainCard.Size = UDim2.new(0, 380, 0, 400)
MainCard.Position = UDim2.new(0.5, 0, 0.5, 0)
MainCard.AnchorPoint = Vector2.new(0.5, 0.5)
MainCard.BackgroundColor3 = Colors.Card
MainCard.BorderSizePixel = 0
MainCard.Visible = false
MainCard.Parent = ScreenGui

local CardCorner = Instance.new("UICorner")
CardCorner.CornerRadius = UDim.new(0, 12)
CardCorner.Parent = MainCard

local UIScale = Instance.new("UIScale")
UIScale.Parent = MainCard

local function UpdateScale()
    local viewport = workspace.CurrentCamera.ViewportSize
    local width = viewport.X
    local height = viewport.Y

    if width < 500 then
        UIScale.Scale = math.clamp(width / 400, 0.8, 1)
    elseif height < 500 then
        UIScale.Scale = math.clamp(height / 450, 0.7, 1)
    else
        UIScale.Scale = 1
    end
end

workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateScale)
UpdateScale()

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, -40, 0, 70)
Header.Position = UDim2.new(0, 20, 0, 20)
Header.BackgroundColor3 = Color3.fromRGB(15, 20, 30)
Header.BorderSizePixel = 0
Header.Parent = MainCard

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local ServerIcon = Instance.new("ImageLabel")
ServerIcon.Size = UDim2.new(0, 50, 0, 50)
ServerIcon.Position = UDim2.new(0, 10, 0, 10)
ServerIcon.BackgroundTransparency = 1
ServerIcon.Image = asset_mgr.get("MmZxyDFgR6")
ServerIcon.Parent = Header

local ServerIconCorner = Instance.new("UICorner")
ServerIconCorner.CornerRadius = UDim.new(0, 8)
ServerIconCorner.Parent = ServerIcon

local HeaderTitleText = Instance.new("TextLabel")
HeaderTitleText.Position = UDim2.new(0, 70, 0, 15)
HeaderTitleText.Size = UDim2.new(0, 200, 0, 25)
HeaderTitleText.BackgroundTransparency = 1
HeaderTitleText.Text = Config.HeaderTitle
HeaderTitleText.TextColor3 = Colors.Text
HeaderTitleText.Font = Enum.Font.GothamBlack
HeaderTitleText.TextSize = 20
HeaderTitleText.TextXAlignment = Enum.TextXAlignment.Left
HeaderTitleText.Parent = Header

local SubText = Instance.new("TextLabel")
SubText.Position = UDim2.new(0, 70, 0, 40)
SubText.Size = UDim2.new(0, 200, 0, 15)
SubText.BackgroundTransparency = 1
SubText.Text = Config.Subtitle
SubText.TextColor3 = Colors.Accent
SubText.Font = Enum.Font.Gotham
SubText.TextSize = 12
SubText.TextXAlignment = Enum.TextXAlignment.Left
SubText.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 20)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Colors.TextDark
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.Parent = Header

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local StatusBox = Instance.new("Frame")
StatusBox.Size = UDim2.new(1, -40, 0, 40)
StatusBox.Position = UDim2.new(0, 20, 0, 105)
StatusBox.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
StatusBox.BorderSizePixel = 0
StatusBox.Parent = MainCard

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 8)
StatusCorner.Parent = StatusBox

local StatusStroke = Instance.new("UIStroke")
StatusStroke.Color = Color3.fromRGB(40, 45, 60)
StatusStroke.Thickness = 1
StatusStroke.Parent = StatusBox

local StatusIcon = Instance.new("ImageLabel")
StatusIcon.Size = UDim2.new(0, 20, 0, 20)
StatusIcon.Position = UDim2.new(0, 10, 0, 10)
StatusIcon.BackgroundTransparency = 1
StatusIcon.Image = asset_mgr.get("lock")
StatusIcon.ImageColor3 = Colors.NotifyWarn
StatusIcon.Parent = StatusBox

local StatusText = Instance.new("TextLabel")
StatusText.Size = UDim2.new(1, -40, 1, 0)
StatusText.Position = UDim2.new(0, 40, 0, 0)
StatusText.BackgroundTransparency = 1
StatusText.Text = "CURRENT STATUS: No key detected"
StatusText.TextColor3 = Colors.NotifyWarn
StatusText.Font = Enum.Font.GothamBold
StatusText.TextSize = 12
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusBox

local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(1, -40, 0, 50)
InputFrame.Position = UDim2.new(0, 20, 0, 160)
InputFrame.BackgroundColor3 = Colors.InputBG
InputFrame.BorderSizePixel = 0
InputFrame.Parent = MainCard

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = InputFrame

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(40, 45, 60)
InputStroke.Thickness = 1
InputStroke.Parent = InputFrame

local KeyIcon = Instance.new("ImageLabel")
KeyIcon.Size = UDim2.new(0, 20, 0, 20)
KeyIcon.Position = UDim2.new(0, 15, 0.5, -10)
KeyIcon.BackgroundTransparency = 1
KeyIcon.Image = asset_mgr.get("key")
KeyIcon.ImageColor3 = Colors.TextDark
KeyIcon.Parent = InputFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, -50, 1, 0)
KeyInput.Position = UDim2.new(0, 45, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.Text = ""
KeyInput.PlaceholderText = "Enter your key..."
KeyInput.PlaceholderColor3 = Colors.TextDark
KeyInput.TextColor3 = Colors.Text
KeyInput.Font = Enum.Font.GothamMedium
KeyInput.TextSize = 14
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.Parent = InputFrame

KeyInput:GetPropertyChangedSignal("Text"):Connect(function()
    if #KeyInput.Text > 32 then
        KeyInput.Text = string.sub(KeyInput.Text, 1, 32)
    end
end)

KeyInput.Focused:Connect(function()
    TweenService:Create(InputStroke, TweenInfo.new(0.3), {Color = Colors.Accent}):Play()
end)

KeyInput.FocusLost:Connect(function()
    TweenService:Create(InputStroke, TweenInfo.new(0.3), {Color = Color3.fromRGB(40, 45, 60)}):Play()
end)

local RedeemBtn = Instance.new("TextButton")
RedeemBtn.Size = UDim2.new(1, -40, 0, 50)
RedeemBtn.Position = UDim2.new(0, 20, 0, 230)
RedeemBtn.BackgroundColor3 = Colors.Accent
RedeemBtn.Text = ""
RedeemBtn.AutoButtonColor = false
RedeemBtn.Parent = MainCard

local RedeemCorner = Instance.new("UICorner")
RedeemCorner.CornerRadius = UDim.new(0, 8)
RedeemCorner.Parent = RedeemBtn

local RedeemGradient = Instance.new("UIGradient")
RedeemGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 200, 130)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 170))
}
RedeemGradient.Parent = RedeemBtn

local RedeemText = Instance.new("TextLabel")
RedeemText.Size = UDim2.new(1, 0, 1, 0)
RedeemText.BackgroundTransparency = 1
RedeemText.Text = "Redeem Key"
RedeemText.TextColor3 = Color3.fromRGB(20, 30, 40)
RedeemText.Font = Enum.Font.GothamBold
RedeemText.TextSize = 16
RedeemText.Parent = RedeemBtn

local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, -40, 0, 1)
Line.Position = UDim2.new(0, 20, 0, 300)
Line.BackgroundColor3 = Color3.fromRGB(40, 45, 60)
Line.BorderSizePixel = 0
Line.Parent = MainCard

local HelpText = Instance.new("TextLabel")
HelpText.Size = UDim2.new(1, 0, 0, 20)
HelpText.Position = UDim2.new(0, 0, 0, 310)
HelpText.BackgroundTransparency = 1
HelpText.Text = "Need a key? Click below"
HelpText.TextColor3 = Colors.TextDark
HelpText.Font = Enum.Font.Gotham
HelpText.TextSize = 12
HelpText.Parent = MainCard

local GetKeyContainer = Instance.new("Frame")
GetKeyContainer.Size = UDim2.new(1, -40, 0, 45)
GetKeyContainer.Position = UDim2.new(0, 20, 0, 340)
GetKeyContainer.BackgroundColor3 = Color3.fromRGB(0,0,0)
GetKeyContainer.BackgroundTransparency = 1
GetKeyContainer.Parent = MainCard

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(1, 0, 1, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(25, 35, 50)
GetKeyBtn.Text = ""
GetKeyBtn.AutoButtonColor = false
GetKeyBtn.Parent = GetKeyContainer

local GKCorner = Instance.new("UICorner")
GKCorner.CornerRadius = UDim.new(0, 8)
GKCorner.Parent = GetKeyBtn

local GKStroke = Instance.new("UIStroke")
GKStroke.Color = Color3.fromRGB(50, 60, 80)
GKStroke.Thickness = 1
GKStroke.Parent = GetKeyBtn

local GKText = Instance.new("TextLabel")
GKText.Size = UDim2.new(1, 0, 1, 0)
GKText.BackgroundTransparency = 1
GKText.Text = "Get Key (Link)"
GKText.TextColor3 = Colors.Text
GKText.Font = Enum.Font.GothamBold
GKText.TextSize = 14
GKText.Parent = GetKeyBtn

local LinkIcon = Instance.new("ImageLabel")
LinkIcon.Size = UDim2.new(0, 18, 0, 18)
LinkIcon.Position = UDim2.new(0.3, 0, 0.5, -9)
LinkIcon.BackgroundTransparency = 1
LinkIcon.Image = asset_mgr.get("link")
LinkIcon.ImageColor3 = Colors.Accent
LinkIcon.Parent = GetKeyBtn

local function AddHover(button, stroke, normalColor, hoverColor)
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor}):Play()
        if stroke then TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Colors.Accent}):Play() end
    end)
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor}):Play()
        if stroke then TweenService:Create(stroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(50, 60, 80)}):Play() end
    end)
end

AddHover(RedeemBtn, nil, Colors.Accent, Color3.fromRGB(0, 220, 150))
AddHover(GetKeyBtn, GKStroke, Color3.fromRGB(25, 35, 50), Color3.fromRGB(35, 45, 60))

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(Config.KeyLink)
    Notify("Link Copied", "The key link has been copied to your clipboard.", "Warn", 3)

    GKText.Text = "Copied!"
    GKText.TextColor3 = Colors.Accent
    task.wait(1)
    GKText.Text = "Get Key (Link)"
    GKText.TextColor3 = Colors.Text
end)

local function ResetStatus()
    StatusText.Text = "CURRENT STATUS: No key detected"
    StatusText.TextColor3 = Colors.NotifyWarn
    StatusIcon.ImageColor3 = Colors.NotifyWarn
end

local function ValidateKey(userKey, isAutoCheck)
    if not isSupported then
        Notify("Error", "Game not supported by script", "Error", 4)
        return
    end

    if typeof(userKey) ~= "string" then
        Notify("Error", "Invalid key (not a string)", "Error", 4)
        return
    end

    userKey = userKey:gsub('"', "")

    userKey = userKey:gsub("^%s+", ""):gsub("%s+$", "")

    if not isAutoCheck then
        RedeemText.Text = "Checking..."
    end

    local status = api.check_key(userKey)

    if status.code == "KEY_VALID" then
        Notify("Success", "Key Valid! Loading...", "Success", 5)

        if not isAutoCheck then
            RedeemText.Text = "Success!"
            MainCard.Visible = false
        end

        if writefile then writefile(Config.FileName, userKey) end

        task.spawn(function()
            script_key = userKey
            api.load_script()
        end)

        task.wait(5)
        if ScreenGui then ScreenGui:Destroy() end

    else
        if isAutoCheck then
            MainCard.Visible = true
        else
            RedeemText.Text = "Redeem Key"
            if status.code == "KEY_HWID_LOCKED" then
                Notify("Error", "Key linked to different HWID", "Error", 4)
                StatusText.Text = "HWID Locked"
                StatusText.TextColor3 = Colors.NotifyError
                StatusIcon.ImageColor3 = Colors.NotifyError
            elseif status.code == "KEY_EXPIRED" then
                Notify("Error", "Key has expired", "Error", 4)
                StatusText.Text = "Key Expired"
                StatusText.TextColor3 = Colors.NotifyError
                StatusIcon.ImageColor3 = Colors.NotifyError
            elseif status.code == "KEY_INCORRECT" then
                Notify("Error", "Incorrect Key", "Error", 3)
                StatusText.Text = "Incorrect Key"
                StatusText.TextColor3 = Colors.NotifyError
                StatusIcon.ImageColor3 = Colors.NotifyError
                local originalPos = InputFrame.Position
                for i = 1, 5 do
                    InputFrame.Position = originalPos + UDim2.new(0, math.random(-5, 5), 0, 0)
                    task.wait(0.05)
                end
                InputFrame.Position = originalPos
            else
                Notify("Error", status.message or "Unknown Error", "Error", 4)
                StatusText.Text = "Error"
            end
            task.delay(3, ResetStatus)
        end
    end
end

RedeemBtn.MouseButton1Click:Connect(function()
    local userKey = KeyInput.Text:gsub(" ", "")
    ValidateKey(userKey, false)
end)

task.spawn(function()
    local foundKey = nil
    if script_key and #script_key > 0 then
        foundKey = script_key
    elseif isfile and isfile(Config.FileName) then
        foundKey = readfile(Config.FileName)
    end

    if foundKey and #foundKey > 0 then
        KeyInput.Text = foundKey
        Notify("Key Found", "Auto-validating saved key...", "Success", 2)
        ValidateKey(foundKey, true)
    else
        MainCard.Visible = true
    end
end)