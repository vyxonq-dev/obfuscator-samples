-- CodeHub Full GUI Script - Version: 1.0.3
-- Created by GrayScripts

-- Services
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local RunService = game:GetService("RunService")

-- Player Info
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local placeId = game.PlaceId
local gameName = MarketplaceService:GetProductInfo(placeId).Name
local displayName = LocalPlayer.DisplayName
local accountAge = LocalPlayer.AccountAge
local userId = LocalPlayer.UserId

-- Blacklist
local blacklistedIds = {
    [8205470158] = true
}
local isBlacklisted = blacklistedIds[userId] or false

-- Supported Games
local supportedGames = {
    [18687417158] = "saryn",
    [17590362521] = "preppy",
    [95508886069297] = "trolling",
    [4924922222] = "sander",
    [126884695634066] = "nathub",
    [537413528] = "babft",
    [116495829188952] = "native",
    [11137575513] = "vpli",
    [155615604] = "prizzlife",
    [189707] = "superring",
    [91692552632068] = "preppy",
    [17707569217] = "preppy",
    [83091000527113] = "preppy",
    [70876832253163] = "native",
    [14044547200] = "menu",
    [6516141723] = "lolhax",
    [6839171747] = "lolhax",
    [79546208627805] = "xvc",
    [126509999114328] = "xvc"
}

-- UI
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "CodeHubGUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.new(0.5, -300, 0.5, -200)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 16)

-- Header
local codeIcon = Instance.new("TextLabel", frame)
codeIcon.Text = ">_"
codeIcon.Font = Enum.Font.ArialBold
codeIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
codeIcon.BackgroundTransparency = 1
codeIcon.TextSize = 40
codeIcon.Position = UDim2.new(0, 15, 0, 10)
codeIcon.Size = UDim2.new(0, 50, 0, 50)

local title = Instance.new("TextLabel", frame)
title.Text = "CODE HUB"
title.Font = Enum.Font.ArialBold
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.BackgroundTransparency = 1
title.TextSize = 40
title.Position = UDim2.new(0, 20, 0, 10)
title.Size = UDim2.new(0, 300, 0, 50)

local versionText = Instance.new("TextLabel", frame)
versionText.Text = "Version: 1.0.3"
versionText.Font = Enum.Font.ArialBold
versionText.TextColor3 = Color3.fromRGB(0, 255, 0)
versionText.BackgroundTransparency = 1
versionText.TextSize = 20
versionText.Position = UDim2.new(0, 320, 0, 10)
versionText.Size = UDim2.new(0, 200, 0, 50)

local close = Instance.new("TextButton", frame)
close.Text = "X"
close.Font = Enum.Font.ArialBold
close.TextColor3 = Color3.fromRGB(0, 255, 0)
close.BackgroundTransparency = 1
close.TextSize = 40
close.Position = UDim2.new(1, -50, 0, 10)
close.Size = UDim2.new(0, 40, 0, 50)
close.MouseButton1Click:Connect(function() gui:Destroy() end)

local minimize = Instance.new("TextButton", frame)
minimize.Text = "-"
minimize.Font = Enum.Font.ArialBold
minimize.TextColor3 = Color3.fromRGB(0, 255, 0)
minimize.BackgroundTransparency = 1
minimize.TextSize = 40
minimize.Position = UDim2.new(1, -90, 0, 10)
minimize.Size = UDim2.new(0, 40, 0, 50)

local miniIcon = Instance.new("TextButton", gui)
miniIcon.Text = ">_"
miniIcon.Font = Enum.Font.ArialBold
miniIcon.TextColor3 = Color3.fromRGB(0, 255, 0)
miniIcon.TextSize = 26
miniIcon.Size = UDim2.new(0, 50, 0, 50)
miniIcon.Position = UDim2.new(0, 20, 0, 100)
miniIcon.BackgroundColor3 = Color3.new(0, 0, 0)
miniIcon.Visible = false
miniIcon.Draggable = true
miniIcon.Active = true
Instance.new("UICorner", miniIcon).CornerRadius = UDim.new(1, 0)

minimize.MouseButton1Click:Connect(function()
    frame.Visible = false
    miniIcon.Visible = true
end)

miniIcon.MouseButton1Click:Connect(function()
    frame.Visible = true
    miniIcon.Visible = false
end)

-- Bottom Text
local gameLabel = Instance.new("TextLabel", frame)
gameLabel.Text = "Game: " .. gameName .. (supportedGames[placeId] and " (Supported!)" or " (Unsupported!)")
gameLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
gameLabel.Font = Enum.Font.ArialBold
gameLabel.BackgroundTransparency = 1
gameLabel.TextSize = 20
gameLabel.Position = UDim2.new(0, -30, 1, -30)
gameLabel.Size = UDim2.new(0, 400, 0, 30)

local fpsLabel = Instance.new("TextLabel", frame)
fpsLabel.Text = "FPS: ..."
fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
fpsLabel.Font = Enum.Font.ArialBold
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextSize = 20
fpsLabel.Position = UDim2.new(1, -110, 1, -30)
fpsLabel.Size = UDim2.new(0, 110, 0, 30)

task.spawn(function()
    local last = tick()
    local frames = 0
    while true do
        frames += 1
        if tick() - last >= 0.1 then
            fpsLabel.Text = "FPS: " .. math.floor(frames / (tick() - last))
            last = tick()
            frames = 0
        end
        RunService.RenderStepped:Wait()
    end
end)

-- Profile Section
local function showProfile()
    local pfp = Instance.new("ImageLabel", frame)
    pfp.Image = Players:GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
    pfp.Size = UDim2.new(0, 100, 0, 100)
    pfp.Position = UDim2.new(0, 30, 0, 80)
    pfp.BackgroundTransparency = 1

    local welcome = Instance.new("TextLabel", frame)
    welcome.Text = "Welcome, " .. displayName
    welcome.Position = UDim2.new(0, 45, 0, 80)
    welcome.TextSize = 26
    welcome.TextColor3 = Color3.fromRGB(0, 255, 0)
    welcome.BackgroundTransparency = 1
    welcome.Font = Enum.Font.ArialBold
    welcome.Size = UDim2.new(0, 400, 0, 30)

    local age = Instance.new("TextLabel", frame)
    age.Text = "Account Age: " .. accountAge .. " days"
    age.Position = UDim2.new(0, 45, 0, 120)
    age.TextSize = 22
    age.TextColor3 = Color3.fromRGB(0, 255, 0)
    age.BackgroundTransparency = 1
    age.Font = Enum.Font.ArialBold
    age.Size = UDim2.new(0, 400, 0, 30)

    local status = Instance.new("TextLabel", frame)
    status.Text = "Status: " .. (isBlacklisted and "blacklisted" or "whitelisted")
    status.Position = UDim2.new(0, 40, 0, 155)
    status.TextSize = 22
    status.TextColor3 = Color3.fromRGB(0, 255, 0)
    status.BackgroundTransparency = 1
    status.Font = Enum.Font.ArialBold
    status.Size = UDim2.new(0, 400, 0, 30)

    local note = Instance.new("TextLabel", frame)
    note.Text = isBlacklisted and "Note: you have been blacklisted by our moderators. This cannot be appealed!" or "Note: stealing this script will result in you blacklisted."
    note.Position = UDim2.new(0, -30, 0, 200)
    note.TextSize = 20
    note.TextColor3 = Color3.fromRGB(0, 255, 0)
    note.BackgroundTransparency = 1
    note.Font = Enum.Font.ArialBold
    note.Size = UDim2.new(0, 550, 0, 60)
    note.TextWrapped = true
end

-- Script Buttons
local function createButton(text, y, func)
    local b = Instance.new("TextButton", frame)
    b.Text = text
    b.Position = UDim2.new(0.5, -150, 0, y)
    b.Size = UDim2.new(0, 300, 0, 50)
    b.Font = Enum.Font.ArialBold
    b.TextColor3 = Color3.fromRGB(0, 255, 0)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.TextSize = 28
    Instance.new("UICorner", b)
    local stroke = Instance.new("UIStroke", b)
    stroke.Color = Color3.fromRGB(0, 255, 0)
    stroke.Thickness = 2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    b.MouseButton1Click:Connect(func)
end

if isBlacklisted or not supportedGames[placeId] then
    showProfile()
else
    local g = supportedGames[placeId]
    if g == "saryn" then
        createButton("Saryn Hub", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Saiky988/Saryn-Hub/refs/heads/main/Saryn%25Hub%25Beta.lua"))()
        end)
        createButton("Moondiety Forsaken", 150, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/Forsaken/refs/heads/main/Forsaken.lua"))()
        end)
    elseif g == "preppy" then
        createButton("Preppy Hub", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/PreppyHub/PreppyHub/refs/heads/main/PreppyHub"))()
        end)
    elseif g == "trolling" then
        createButton("Trolling GUI", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Rawbr10/Roblox-Scripts/refs/heads/main/Slap-Tower-Script"))()
        end)
    elseif g == "sander" then
        createButton("Sander XY", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()
        end)
    elseif g == "nathub" then
        createButton("Nathub", 80, function()
            loadstring(game:HttpGet("https://get.nathub.xyz/loader"))()
        end)
        createButton("Idiot Hub", 150, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/IdiotHub/Scripts/main/Loader"))()
        end)
    elseif g == "babft" then
        createButton("Ultimate BABFT Script", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Loader.lua"))()
        end)
    elseif g == "native" then
        createButton("Native Hub", 80, function()
            loadstring(game:HttpGet("https://getnative.cc/script/loader"))()
        end)
    elseif g == "vpli" then
        createButton("VPLI HUB V2", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Adam3mka/The-chosen-one-lukaku/refs/heads/main/Protected_6361979247750901.txt"))()
        end)
    elseif g == "prizzlife" then
        createButton("Prizz Life", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/devguy100/PrizzLife/main/pladmin.lua"))()
        end)
    elseif g == "superring" then
        createButton("Super ring parts v5", 80, function()
            loadstring(game:HttpGet("https://pastebin.com/raw/DN0upqNm"))()
        end)
    elseif g == "menu" then
        createButton("Menu mod op", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/nAlwspa/Into/refs/heads/main/Loader"))()
        end)
    elseif g == "lolhax" then
        createButton("LOLHAX", 80, function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Robloxexploiterz/Release-Lolhax/refs/heads/main/LX%20Doors%20v3.lua"))()
        end)
    elseif g == "xvc" then
        createButton("XVC Hub", 80, function()
            game:GetService("CoreGui").RobloxGui["CoreScripts/NetworkPause"]:Destroy()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XVCHub/Games/main/99NightsintheForest"))()
        end)
    end
end

-- Send Notification when loaded
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "Code Hub",
        Text = "Made by aRussian, v1.0.3",
        Icon = "rbxthumb://type=Asset&id=111840904617337&w=150&h=150",
        Duration = 5
    })
end)