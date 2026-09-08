-- Steal a Brainrot Hub - Full Working Script

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local player = Players.LocalPlayer
local correctKey = "Steal" -- Key to unlock the hub

-- ===== FANCY KEY GUI =====
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "FancyKeyGUI"
keyGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5,0.5)
frame.Parent = keyGui
frame.BackgroundTransparency = 0.1
frame.ClipsDescendants = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0,20)
UICorner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,50)
title.Position = UDim2.new(0,0,0,0)
title.BackgroundTransparency = 1
title.Text = "Enter Key to Access Hub"
title.TextScaled = true
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Font = Enum.Font.GothamBold
title.Parent = frame

local textbox = Instance.new("TextBox")
textbox.Size = UDim2.new(0.8,0,0,50)
textbox.Position = UDim2.new(0.1,0,0.4,0)
textbox.PlaceholderText = "Enter Key..."
textbox.TextScaled = true
textbox.TextColor3 = Color3.fromRGB(0,0,0)
textbox.BackgroundColor3 = Color3.fromRGB(255,255,255)
textbox.ClearTextOnFocus = true
textbox.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.5,0,0,40)
button.Position = UDim2.new(0.25,0,0.8,0)
button.Text = "Submit"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(44,120,224)
button.TextColor3 = Color3.fromRGB(255,255,255)
button.Font = Enum.Font.GothamBold
button.Parent = frame

local feedback = Instance.new("TextLabel")
feedback.Size = UDim2.new(1,0,0,30)
feedback.Position = UDim2.new(0,0,0.7,0)
feedback.BackgroundTransparency = 1
feedback.TextColor3 = Color3.fromRGB(255,50,50)
feedback.TextScaled = true
feedback.Text = ""
feedback.Font = Enum.Font.GothamBold
feedback.Parent = frame

-- ===== GET KEY BUTTON =====
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.5,0,0,30)
getKeyButton.Position = UDim2.new(0.25,0,0.6,0)
getKeyButton.Text = "Get Key"
getKeyButton.TextScaled = true
getKeyButton.BackgroundColor3 = Color3.fromRGB(0,200,100)
getKeyButton.TextColor3 = Color3.fromRGB(255,255,255)
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.Parent = frame

getKeyButton.MouseButton1Click:Connect(function()
    setclipboard(correctKey) -- copies "Steal" to clipboard
    feedback.Text = "Key copied to clipboard!"
    task.delay(2, function()
        feedback.Text = ""
    end)
end)

-- ===== HUB LOADER FUNCTION =====
local function loadHub()
    keyGui:Destroy()

    -- Load DrRay UI
    local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
    local window = DrRayLibrary:Load("Steal a Brainrot Hub", "Default")

    -- Tabs
    local mainTab = DrRayLibrary.newTab("Main", "rbxassetid://0")
    local espTab = DrRayLibrary.newTab("ESP", "rbxassetid://0")

    -- ===== AUTOMATIC ESP USING SAB-BEST LINK =====
    local success, esp = pcall(function()
        return loadstring(game:HttpGet("https://cdn.exploitingis.fun/SAB-Best"))()
    end)
    if success and esp then
        esp:Start() -- starts automatic scanning
    else
        warn("Failed to load SAB-Best ESP")
    end

    -- ===== FLOAT WITH LOW GRAVITY & FAST TRAIL =====
    local floatEnabled = false
    local floatConnection

    mainTab.newButton("Toggle Float (Bypass Gravity)", "Bypass high jump teleport", function()
        floatEnabled = not floatEnabled
        local char = player.Character
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")
        if floatEnabled and humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = 70
            floatConnection = RunService.Heartbeat:Connect(function()
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local root = char.HumanoidRootPart
                    local sq = Instance.new("Part")
                    sq.Size = Vector3.new(4,0.2,4)
                    sq.Anchored = true
                    sq.Color = Color3.fromRGB(0,100,255)
                    sq.Material = Enum.Material.Neon
                    sq.CFrame = root.CFrame - Vector3.new(0,3,0)
                    sq.Parent = workspace
                    Debris:AddItem(sq, 0.05)
                end
            end)
        elseif not floatEnabled and humanoid and floatConnection then
            humanoid.JumpPower = 50
            floatConnection:Disconnect()
            floatConnection = nil
        end
    end)

    -- ===== TWEEN NOCLIP =====
    local noclip = false
    local noclipConnection
    mainTab.newButton("Toggle Bypassed Noclip", "Move through walls smoothly", function()
        noclip = not noclip
        if noclip and not noclipConnection then
            noclipConnection = RunService.Stepped:Connect(function()
                local char = player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local root = char.HumanoidRootPart
                    local ray = Ray.new(root.Position, root.CFrame.LookVector * 3)
                    local part = workspace:FindPartOnRay(ray, char)
                    if part and part.CanCollide then
                        local goal = {CFrame = root.CFrame + root.CFrame.LookVector * 5}
                        local tween = TweenService:Create(root, TweenInfo.new(0.5, Enum.EasingStyle.Sine), goal)
                        tween:Play()
                    end
                end
            end)
        elseif not noclip and noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
    end)
end

-- ===== BUTTON CLICK =====
button.MouseButton1Click:Connect(function()
    if textbox.Text == correctKey then
        loadHub()
    else
        feedback.Text = "Wrong Key! Try again..."
        textbox.Text = ""
    end
end)