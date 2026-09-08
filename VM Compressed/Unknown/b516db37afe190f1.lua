getgenv().TomatoAutoFarm = false
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/vericodified/AutofarmX/refs/heads/main/autofarm.lua"))()
end)

-----

----

-- ===== Services =====
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

-- ===== Godmode Toggle =====
local GodmodeEnabled = false
local GodmodeConn

local function setupGodmode(character)
    local humanoid = character:WaitForChild("Humanoid")
    if GodmodeConn then
        GodmodeConn:Disconnect()
        GodmodeConn = nil
    end
    if GodmodeEnabled then
        GodmodeConn = humanoid.Changed:Connect(function(prop)
            if prop == "Health" then
                humanoid.Health = 9e9
            end
        end)
    end
end

setupGodmode(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
LocalPlayer.CharacterAdded:Connect(setupGodmode)

-- ===== GUI =====
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GodmodeGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local frame = Instance.new("Frame", ScreenGui)
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0.5, -100, 0.5, -40)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Godmode Toggle"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255,255,255)

-- Toggle button
local toggleBtn = Instance.new("TextButton", frame)
toggleBtn.Size = UDim2.new(0.6, 0, 0, 40)
toggleBtn.Position = UDim2.new(0.2, 0, 0.5, -20)
toggleBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
toggleBtn.Text = "OFF"
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.TextSize = 18
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0,10)

-- ===== Minimize Button =====
local minimizeBtn = Instance.new("TextButton", frame)
minimizeBtn.Size = UDim2.new(0,30,0,30)
minimizeBtn.Position = UDim2.new(1,-35,0,5)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
minimizeBtn.Text = "–"
minimizeBtn.TextColor3 = Color3.fromRGB(255,255,255)
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0,6)

-- ===== GT Label for Minimized Form =====
local gtLabel = Instance.new("TextLabel", frame)
gtLabel.Size = UDim2.new(1,0,1,0)
gtLabel.Position = UDim2.new(0,0,0,0)
gtLabel.BackgroundTransparency = 1
gtLabel.Text = "GT"
gtLabel.Font = Enum.Font.GothamBold
gtLabel.TextSize = 18
gtLabel.TextColor3 = Color3.fromRGB(255,255,255)
gtLabel.TextScaled = true
gtLabel.Visible = false -- only show when minimized
gtLabel.ZIndex = minimizeBtn.ZIndex + 1 -- make sure it's on top of button

-- ===== Variables =====
local minimized = false
local originalSize = frame.Size
local miniSize = UDim2.new(0,50,0,50)
local children = {title, toggleBtn} -- hide only these when minimized, NOT the minimize button!

-- ===== Toggle Logic =====
toggleBtn.MouseButton1Click:Connect(function()
    GodmodeEnabled = not GodmodeEnabled
    setupGodmode(LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait())
    if GodmodeEnabled then
        toggleBtn.Text = "ON"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0,170,0)
    else
        toggleBtn.Text = "OFF"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
    end
end)

-- ===== Minimize Logic =====
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        -- shrink frame
        TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = miniSize}):Play()
        -- hide other children
        for _, c in ipairs(children) do c.Visible = false end
        -- show GT label on top
        gtLabel.Visible = true
    else
        -- restore frame
        TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = originalSize}):Play()
        -- show children
        for _, c in ipairs(children) do c.Visible = true end
        -- hide GT label
        gtLabel.Visible = false
    end
end)

--

local notifs = loadstring(game:HttpGet('https://raw.githubusercontent.com/vericodified/FE2-STYLED-Notifications./refs/heads/main/script.lua'))()
notifs.alert("AutofarmX by Verified",nil,nil,'rainbow')
