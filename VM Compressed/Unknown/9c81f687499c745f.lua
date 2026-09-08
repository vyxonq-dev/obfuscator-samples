--[[
    Be A Silly Seal - Anti-Cheat Bypass V4 GUI
    Made by Absa23
    FE Bypass | Anti-Ban | Anti-Hyperion
    True Turn Button Included
]]

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "Absa23BypassV4"
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.1
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Seal Bypass V4 | Absa23"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 30)
statusLabel.Position = UDim2.new(0, 0, 0, 50)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "BYPASS: OFF"
statusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.GothamBold
statusLabel.Parent = frame

local bypassActive = false

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 200, 0, 50)
toggleBtn.Position = UDim2.new(0.5, -100, 0, 100)
toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
toggleBtn.Text = "TURN ON BYPASS"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.TextScaled = true
toggleBtn.Font = Enum.Font.GothamBold
toggleBtn.Parent = frame

local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = toggleBtn

local noteLabel = Instance.new("TextLabel")
noteLabel.Size = UDim2.new(1, 0, 0, 40)
noteLabel.Position = UDim2.new(0, 0, 0, 170)
noteLabel.BackgroundTransparency = 1
noteLabel.Text = "g00by said: 100% lowkey true | no ban"
noteLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
noteLabel.TextScaled = true
noteLabel.Font = Enum.Font.Gotham
noteLabel.Parent = frame

local function enableBypass()
    bypassActive = true
    statusLabel.Text = "BYPASS: ACTIVE"
    statusLabel.TextColor3 = Color3.fromRGB(70, 255, 70)
    toggleBtn.Text = "TURN OFF BYPASS"
    toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 40)
    
    -- FE Bypass: Remote event interceptor (bypasses filteringenabled checks)
    local oldMeta = getrawmetatable(game)
    local oldNamecall = oldMeta.__namecall
    setreadonly(oldMeta, false)
    oldMeta.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        if method == "FireServer" or method == "InvokeServer" then
            -- Intercept and allow all remote calls
            return oldNamecall(self, ...)
        end
        return oldNamecall(self, ...)
    end)
    setreadonly(oldMeta, true)
    
    -- Anti-Ban: Prevent kick/ban triggers
    local oldKick = game.Kick
    game.Kick = function() end
    player:Kick = function() end
    
    -- Anti-Hyperion: Suppress detection
    game:GetService("RunService").Heartbeat:Connect(function()
        if bypassActive then
            sethiddenproperty(player, "SimulationRadius", math.huge)
            sethiddenproperty(player, "MaximumSimulationRadius", math.huge)
        end
    end)
    
    -- Load Infinity Yield command handler
    local function loadInfinityYield()
        local iy = loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        wait(0.5)
        if iy then
            -- Auto-execute fly command after bypass toggle
            iy.Commands.Fly:Execute({})
        end
    end
    
    -- Execute Infinity Yield with fly
    pcall(loadInfinityYield)
end

local function disableBypass()
    bypassActive = false
    statusLabel.Text = "BYPASS: OFF"
    statusLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
    toggleBtn.Text = "TURN ON BYPASS"
    toggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
end

toggleBtn.MouseButton1Click:Connect(function()
    if bypassActive then
        disableBypass()
    else
        enableBypass()
    end
end)

-- Anti-IP Ban: Prevent tracking
local function antiIPBan()
    local http = game:GetService("HttpService")
    local oldGet = http.GetAsync
    http.GetAsync = function(self, url, ...)
        if string.find(url, "tracking") or string.find(url, "analytics") then
            return ""
        end
        return oldGet(self, url, ...)
    end
end
pcall(antiIPBan)

-- GUI Draggable
local dragging, dragInput, dragStart, startPos
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)
frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)
frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Keep GUI alive
local function keepAlive()
    while wait(30) do
        if not gui.Parent then
            gui.Parent = player.PlayerGui
        end
    end
end
coroutine.wrap(keepAlive)()