local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local CollectionService = game:GetService("CollectionService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- 1. Loading Screen Implementation
local function showLoadingScreen()
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    local loadingGui = Instance.new("ScreenGui", playerGui)
    loadingGui.Name = "SlapHubLoading"
    loadingGui.DisplayOrder = 999
    
    local bg = Instance.new("Frame", loadingGui)
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    
    local status = Instance.new("TextLabel", bg)
    status.Size = UDim2.new(0.4, 0, 0.1, 0)
    status.Position = UDim2.new(0.3, 0, 0.45, 0)
    status.BackgroundTransparency = 1
    status.TextColor3 = Color3.fromRGB(255, 255, 255)
    status.Font = Enum.Font.GothamBold
    status.TextSize = 24
    status.Text = "Loading SlapHub..."
    
    local barBg = Instance.new("Frame", bg)
    barBg.Size = UDim2.new(0.3, 0, 0.02, 0)
    barBg.Position = UDim2.new(0.35, 0, 0.55, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Instance.new("UICorner", barBg)
    
    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    Instance.new("UICorner", bar)
    
    TweenService:Create(bar, TweenInfo.new(1.5), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(1.6)
    loadingGui:Destroy()
end

-- Game Check & Teleport Logic
if not ReplicatedStorage:FindFirstChild("01_server") then 
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    
    local screen = Instance.new("ScreenGui", playerGui)
    screen.IgnoreGuiInset = true
    screen.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
    
    local frame = Instance.new("Frame", screen)
    frame.BorderSizePixel = 0
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Size = UDim2.new(0.35, 0, 0.3, 0)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0.1, 0)
    Instance.new("UIStroke", frame).Color = Color3.fromRGB(255, 255, 255)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.9, 0, 0.4, 0)
    label.Position = UDim2.new(0.05, 0, 0.1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = "Wrong Game! Redirecting to SlapHub Base..."

    local box = Instance.new("TextBox", frame)
    box.Size = UDim2.new(0.9, 0, 0.3, 0)
    box.Position = UDim2.new(0.05, 0, 0.6, 0)
    box.Text = "https://www.roblox.com/games/123974602339071/"
    box.TextScaled = true
    box.ClearTextOnFocus = false
    Instance.new("UICorner", box)

    TeleportService:Teleport(123974602339071, player)
    return
end

showLoadingScreen()

-- Main SlapHub UI
local G2L = {}
local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

G2L["Main"] = Instance.new("ScreenGui", PG)
G2L["Main"].Name = "SlapHub"
G2L["Main"].ResetOnSpawn = false
G2L["Main"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- 2. Toggle Button (Screen Button to show/hide)
G2L["OpenBtn"] = Instance.new("TextButton", G2L["Main"])
G2L["OpenBtn"].Name = "ToggleButton"
G2L["OpenBtn"].Size = UDim2.new(0, 100, 0, 40)
G2L["OpenBtn"].Position = UDim2.new(0, 10, 0.5, -20)
G2L["OpenBtn"].BackgroundColor3 = Color3.fromRGB(35, 35, 35)
G2L["OpenBtn"].TextColor3 = Color3.fromRGB(255, 255, 255)
G2L["OpenBtn"].Text = "Show/Hide"
G2L["OpenBtn"].Font = Enum.Font.GothamBold
G2L["OpenBtn"].Visible = true
Instance.new("UICorner", G2L["OpenBtn"])
Instance.new("UIStroke", G2L["OpenBtn"]).Color = Color3.fromRGB(60, 60, 60)

-- Main Frame
G2L["Frame"] = Instance.new("Frame", G2L["Main"])
G2L["Frame"].Name = "MainFrame"
G2L["Frame"].BackgroundColor3 = Color3.fromRGB(25, 25, 25)
G2L["Frame"].BorderSizePixel = 0
G2L["Frame"].Position = UDim2.new(0.5, -200, 0.5, -150)
G2L["Frame"].Size = UDim2.new(0, 400, 0, 300)
G2L["Frame"].Visible = true

local mainCorner = Instance.new("UICorner", G2L["Frame"])
mainCorner.CornerRadius = UDim.new(0, 8)

local mainStroke = Instance.new("UIStroke", G2L["Frame"])
mainStroke.Color = Color3.fromRGB(60, 60, 60)
mainStroke.Thickness = 2

-- Top Bar
G2L["Bar"] = Instance.new("Frame", G2L["Frame"])
G2L["Bar"].Name = "TopBar"
G2L["Bar"].BackgroundColor3 = Color3.fromRGB(35, 35, 35)
G2L["Bar"].Size = UDim2.new(1, 0, 0, 40)
Instance.new("UICorner", G2L["Bar"]).CornerRadius = UDim.new(0, 8)

G2L["Title"] = Instance.new("TextLabel", G2L["Bar"])
G2L["Title"].Text = "SlapHub" -- 3. Removed "jab"
G2L["Title"].Size = UDim2.new(1, -80, 1, 0)
G2L["Title"].Position = UDim2.new(0, 15, 0, 0)
G2L["Title"].BackgroundTransparency = 1
G2L["Title"].TextColor3 = Color3.fromRGB(255, 255, 255)
G2L["Title"].TextXAlignment = Enum.TextXAlignment.Left
G2L["Title"].Font = Enum.Font.GothamBold
G2L["Title"].TextSize = 18

-- Close Button
G2L["Close"] = Instance.new("TextButton", G2L["Bar"])
G2L["Close"].Text = "×"
G2L["Close"].Size = UDim2.new(0, 40, 0, 40)
G2L["Close"].Position = UDim2.new(1, -40, 0, 0)
G2L["Close"].BackgroundTransparency = 1
G2L["Close"].TextColor3 = Color3.fromRGB(255, 80, 80)
G2L["Close"].TextSize = 30
G2L["Close"].Font = Enum.Font.Gotham

-- Content Area
G2L["Scroll"] = Instance.new("ScrollingFrame", G2L["Frame"])
G2L["Scroll"].Position = UDim2.new(0, 10, 0, 50)
G2L["Scroll"].Size = UDim2.new(1, -20, 1, -60)
G2L["Scroll"].BackgroundTransparency = 1
G2L["Scroll"].ScrollBarThickness = 4
G2L["Scroll"].CanvasSize = UDim2.new(0, 0, 0, 0)
G2L["Scroll"].AutomaticCanvasSize = Enum.AutomaticSize.Y

local layout = Instance.new("UIListLayout", G2L["Scroll"])
layout.Padding = UDim.new(0, 8)
layout.SortOrder = Enum.SortOrder.LayoutOrder

-- Script Button (Modern)
local function createButton(name, callback)
    local btn = Instance.new("TextButton", G2L["Scroll"])
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamSemibold
    btn.Text = name
    btn.AutoButtonColor = true
    
    Instance.new("UICorner", btn)
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(70, 70, 70)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    btn.MouseButton1Click:Connect(function()
        local success, err = pcall(callback)
        if not success then warn("SlapHub Error: " .. err) end
    end)
end

-- Dragging Logic
local dragging, dragInput, dragStart, startPos
G2L["Bar"].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = G2L["Frame"].Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        G2L["Frame"].Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- 4. Toggle UI Visibility (Button & Key)
local function toggleUI()
    G2L["Frame"].Visible = not G2L["Frame"].Visible
end

G2L["OpenBtn"].MouseButton1Click:Connect(toggleUI)

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.Insert then
        toggleUI()
    end
end)

G2L["Close"].MouseButton1Click:Connect(function()
    G2L["Main"]:Destroy()
end)

-- 5. UNC Compatibility Check
local function checkUNC()
    local unc_functions = {
        "loadstring", "game:HttpGet", "getgenv", "identifyexecutor"
    }
    print("--- UNC Compatibility Check ---")
    for _, func in pairs(unc_functions) do
        print(func .. ": " .. (tostring(loadstring("return " .. func) ~= nil) or "Supported"))
    end
end
checkUNC()

-- Add Features (Auto-Farm Removed)
createButton("FE Server Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ONEReverseCard/My-Scripts/main/Netless%20Server%20Admin.md"))()
end)

createButton("FE Chill", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Just-a-baseplate.-Fe-Chill-14103"))()
end)

createButton("FE Nameless Animation V4", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/d3uB90XA"))()
end)

createButton("FE Cop", function()
    local chat = game:GetService("TextChatService")
    if chat.TextChannels:FindFirstChild("RBXGeneral") then
        chat.TextChannels.RBXGeneral:SendAsync("-gh 48474313, 6594369919, 62724852")
        task.wait(2.1)
        task.delay(5.5, function()
            chat.TextChannels.RBXGeneral:SendAsync("-net")
        end)
    end
    loadstring(game:HttpGet('https://pastebin.com/raw/c1dmfBGL'))()
end)

createButton("FE Creepy Crawler", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/a-literal-baseplate.-FE-Creepy-Crwler-10249"))()
end)

createButton("FE Da Feet", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/1BlueCat/7291747e9f093555573e027621f08d6e/raw/23b48f2463942befe19d81aa8a06e3222996242c/FE%2520Da%2520Feets"))()
end)

return G2L["Main"]