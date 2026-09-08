local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer then return end

local DISCORD_INVITE = "https://discord.gg/7QrCxJxh68"
local KEY_URL = "https://pastebin.com/raw/Xhq8f74R"

local function notify(title, text, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration or 5
        })
    end)
end

local function tween(obj, props, time)
    local t = TweenService:Create(obj, TweenInfo.new(time or 0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props)
    t:Play()
    return t
end

local targetParent = (gethui and gethui()) 
    or (pcall(function() return CoreGui.Name end) and CoreGui) 
    or LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KyoKeySystem"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = targetParent

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 420, 0, 190)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(11, 12, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 220, 255)
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.4
MainStroke.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.5, 0, 0, 30)
Title.Position = UDim2.new(0.05, 0, 0.08, 0)
Title.BackgroundTransparency = 1
Title.Text = "KYO HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0.4, 0, 0, 30)
StatusLabel.Position = UDim2.new(0.55, 0, 0.08, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "NEED KEY"
StatusLabel.TextColor3 = Color3.fromRGB(120, 125, 135)
StatusLabel.TextSize = 11
StatusLabel.TextXAlignment = Enum.TextXAlignment.Right
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.Parent = MainFrame

local Input = Instance.new("TextBox")
Input.Size = UDim2.new(0.9, 0, 0, 42)
Input.Position = UDim2.new(0.05, 0, 0.32, 0)
Input.PlaceholderText = "Enter key here..."
Input.PlaceholderColor3 = Color3.fromRGB(70, 75, 85)
Input.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
Input.TextColor3 = Color3.fromRGB(0, 220, 255)
Input.TextSize = 13
Input.TextXAlignment = Enum.TextXAlignment.Left
Input.Font = Enum.Font.GothamSemibold
Input.Parent = MainFrame

local InputPadding = Instance.new("UIPadding")
InputPadding.PaddingLeft = UDim.new(0, 12)
InputPadding.Parent = Input

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = Input

local InputStroke = Instance.new("UIStroke")
InputStroke.Color = Color3.fromRGB(35, 38, 47)
InputStroke.Thickness = 1
InputStroke.Parent = Input

local Submit = Instance.new("TextButton")
Submit.Size = UDim2.new(0.44, 0, 0, 40)
Submit.Position = UDim2.new(0.05, 0, 0.65, 0)
Submit.BackgroundColor3 = Color3.fromRGB(0, 180, 210)
Submit.Text = "Check Key"
Submit.TextColor3 = Color3.fromRGB(11, 12, 15)
Submit.TextSize = 13
Submit.AutoButtonColor = false
Submit.Font = Enum.Font.GothamBold
Submit.Parent = MainFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = Submit

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.44, 0, 0, 40)
GetKeyBtn.Position = UDim2.new(0.51, 0, 0.65, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(20, 22, 27)
GetKeyBtn.Text = "Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 205, 215)
GetKeyBtn.TextSize = 13
GetKeyBtn.AutoButtonColor = false
GetKeyBtn.Font = Enum.Font.GothamMedium
GetKeyBtn.Parent = MainFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 8)
GetKeyCorner.Parent = GetKeyBtn

local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Color = Color3.fromRGB(35, 38, 47)
GetKeyStroke.Thickness = 1
GetKeyStroke.Parent = GetKeyBtn

Submit.MouseEnter:Connect(function()
    tween(Submit, {BackgroundColor3 = Color3.fromRGB(0, 220, 255)}, 0.2)
end)
Submit.MouseLeave:Connect(function()
    tween(Submit, {BackgroundColor3 = Color3.fromRGB(0, 180, 210)}, 0.2)
end)

GetKeyBtn.MouseEnter:Connect(function()
    tween(GetKeyBtn, {BackgroundColor3 = Color3.fromRGB(28, 30, 38)}, 0.2)
    tween(GetKeyStroke, {Color = Color3.fromRGB(50, 55, 68)}, 0.2)
end)
GetKeyBtn.MouseLeave:Connect(function()
    tween(GetKeyBtn, {BackgroundColor3 = Color3.fromRGB(20, 22, 27)}, 0.2)
    tween(GetKeyStroke, {Color = Color3.fromRGB(35, 38, 47)}, 0.2)
end)

local nights99Id = 79546208627805
local gag2PlaceId = 77085202503540
local gag2GameId = 10200395747
local keyboardId = 95082159892680
local SellId = 79268393072444
local nightsinId = 126509999114328
local Mm2Id = 142823291

Submit.MouseButton1Click:Connect(function()
    local typedKey = Input.Text:lower():gsub("%s+", "")
    StatusLabel.Text = "CHECKING..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

    local success, onlineKey = pcall(function()
        return game:HttpGet(KEY_URL)
    end)

    if success and onlineKey then
        onlineKey = onlineKey:lower():gsub("%s+", "")

        if typedKey == onlineKey then
            StatusLabel.Text = "CORRECT"
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
            notify("Success", "Key verified!", 3)

            tween(MainFrame, {Position = UDim2.new(0.5, 0, 0.6, 0), BackgroundTransparency = 1}, 0.4)
            tween(MainStroke, {Transparency = 1}, 0.4)
            task.wait(0.4)
            ScreenGui:Destroy()

            notify("Loading", "Loading script...", 3)

            if game.PlaceId == nights99Id or game.GameId == nights99Id then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kyruxv1/KYO-SCRIPTS-FULL/refs/heads/main/99NightsInTheForest.txt"))()

            elseif game.PlaceId == gag2PlaceId or game.GameId == gag2GameId then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kyruxv1/KYO-SCRIPTS-FULL/refs/heads/main/Growagarden2.txt"))()

          elseif game.PlaceId == keyboardId or game.GameId == keyboardId then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kyruxv1/KYO-SCRIPTS-FULL/refs/heads/main/%2B1%20speed%20keyboard%20escape.txt"))()

            elseif game.PlaceId == SellId or game.GameId == SellId then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kyruxv1/kyo-scripts/refs/heads/main/Sell-lemons.txt"))()

            elseif game.PlaceId == Mm2Id or game.GameId == Mm2Id then

loadstring(game:HttpGet("https://raw.githubusercontent.com/kyruxv1/kyo-scripts/refs/heads/main/Murder-mystery-2.txt"))()

            elseif game.PlaceId == nightsinId or game.GameId == nightsinId then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kyruxv1/KYO-SCRIPTS-FULL/refs/heads/main/99NightsInTheForest.txt"))()

            else
                game.Players.LocalPlayer:Kick("Kyo Hub | game not supported. Your Place ID is: " .. game.PlaceId .. " and Game ID is: " .. game.GameId)
            end

        else
            StatusLabel.Text = "WRONG KEY"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
            Input.Text = ""
            tween(InputStroke, {Color = Color3.fromRGB(255, 70, 70)}, 0.2)
            task.wait(1)
            tween(InputStroke, {Color = Color3.fromRGB(35, 38, 47)}, 0.4)
            StatusLabel.Text = "NEED KEY"
            StatusLabel.TextColor3 = Color3.fromRGB(120, 125, 135)
        end
    else
        StatusLabel.Text = "ERROR FETCHING"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
        notify("Network Error", "Could not query key verification servers.", 4)
    end
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DISCORD_INVITE)
        StatusLabel.Text = "COPIED"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 220, 255)
        notify("Copied", "Link copied to clipboard!", 4)

        task.delay(2, function()
            if StatusLabel.Text == "COPIED" then
                StatusLabel.Text = "NEED KEY"
                StatusLabel.TextColor3 = Color3.fromRGB(120, 125, 135)
            end
        end)
    else
        notify("Error", "Your environment cannot copy to clipboard.", 5)
    end
end)
