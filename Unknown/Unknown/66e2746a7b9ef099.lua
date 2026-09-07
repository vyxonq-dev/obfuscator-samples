-- Samurai Executor v3.0 (Xeno-Style UI)
-- Put inside StarterGui → LocalScript

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "SamuraiExecutorUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Services
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- Handle character reset
player.CharacterAdded:Connect(function()
    wait(1)
    print("Samurai Executor: Character reset detected, script still active!")
end)

-- User rank system
local developers = {
    [1756714873420] = true,
    [8221246311] = true,
}

local function getUserRank()
    if developers[player.UserId] then
        return "Developer"
    else
        return "Member"
    end
end

-- Enhanced executor detection
local detectedExecutor = nil

local function detectExecutor()
    if detectedExecutor then
        return detectedExecutor
    end
    
    if KRNL_LOADED then
        detectedExecutor = "KRNL"
    elseif syn then
        detectedExecutor = "Synapse X"
    elseif getgenv then
        local success, result
        
        success, result = pcall(function() return getgenv().solara or getgenv().Solara end)
        if success and result then
            detectedExecutor = "Solara"
        else
            success, result = pcall(function() return getgenv().delta or getgenv().Delta end)
            if success and result then
                detectedExecutor = "Delta"
            else
                success, result = pcall(function() return getgenv().wave or getgenv().Wave end)
                if success and result then
                    detectedExecutor = "Wave"
                else
                    success, result = pcall(function() return getgenv().fluxus or getgenv().Fluxus end)
                    if success and result then
                        detectedExecutor = "Fluxus"
                    else
                        success, result = pcall(function() return getgenv().arceus or getgenv().ArceusX end)
                        if success and result then
                            detectedExecutor = "Arceus X"
                        else
                            success, result = pcall(function() return getgenv().xeno or getgenv().Xeno end)
                            if success and result then
                                detectedExecutor = "Xeno"
                            else
                                detectedExecutor = "Generic"
                            end
                        end
                    end
                end
            end
        end
    else
        detectedExecutor = "Unknown"
    end
    
    return detectedExecutor
end

-- AI Script Generator
local function generateAIScript(command)
    local scriptTemplates = {
        ["float"] = "-- AI Generated Float Script\nlocal player = game.Players.LocalPlayer\nlocal char = player.Character\nlocal rootPart = char:FindFirstChild('HumanoidRootPart')\n\nif rootPart then\n    local bodyPosition = Instance.new('BodyPosition')\n    bodyPosition.MaxForce = Vector3.new(4000, 4000, 4000)\n    bodyPosition.Position = rootPart.Position + Vector3.new(0, 5, 0)\n    bodyPosition.Parent = rootPart\n    print('Float enabled!')\nend",
        
        ["fly"] = "-- AI Generated Fly Script\nlocal player = game.Players.LocalPlayer\nlocal char = player.Character\nlocal humanoid = char:FindFirstChild('Humanoid')\nlocal rootPart = char:FindFirstChild('HumanoidRootPart')\n\nif humanoid and rootPart then\n    local bodyVelocity = Instance.new('BodyVelocity')\n    bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)\n    bodyVelocity.Velocity = Vector3.new(0, 0, 0)\n    bodyVelocity.Parent = rootPart\n    \n    local function fly()\n        local speed = 16\n        bodyVelocity.Velocity = Vector3.new(0, 0, 0)\n        \n        if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.W) then\n            bodyVelocity.Velocity = bodyVelocity.Velocity + (workspace.CurrentCamera.CFrame.LookVector * speed)\n        end\n        if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.S) then\n            bodyVelocity.Velocity = bodyVelocity.Velocity - (workspace.CurrentCamera.CFrame.LookVector * speed)\n        end\n        if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.A) then\n            bodyVelocity.Velocity = bodyVelocity.Velocity - (workspace.CurrentCamera.CFrame.RightVector * speed)\n        end\n        if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.D) then\n            bodyVelocity.Velocity = bodyVelocity.Velocity + (workspace.CurrentCamera.CFrame.RightVector * speed)\n        end\n        if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.Space) then\n            bodyVelocity.Velocity = bodyVelocity.Velocity + Vector3.new(0, speed, 0)\n        end\n        if game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.LeftShift) then\n            bodyVelocity.Velocity = bodyVelocity.Velocity - Vector3.new(0, speed, 0)\n        end\n    end\n    \n    game:GetService('RunService').Heartbeat:Connect(fly)\n    print('Fly enabled! Use WASD, Space, and Shift to fly.')\nend",
        
        ["speed"] = "-- AI Generated Speed Script\nlocal player = game.Players.LocalPlayer\nlocal char = player.Character\nif char and char:FindFirstChild('Humanoid') then\n    char.Humanoid.WalkSpeed = 50\n    print('Speed boosted to 50!')\nend",
        
        ["esp"] = "-- AI Generated ESP Script\nlocal Players = game:GetService('Players')\nlocal RunService = game:GetService('RunService')\nlocal player = Players.LocalPlayer\n\nlocal function createESP(targetPlayer)\n    if targetPlayer == player then return end\n    \n    local function addESP(character)\n        if not character or not character:FindFirstChild('HumanoidRootPart') then return end\n        \n        local billboard = Instance.new('BillboardGui')\n        billboard.Parent = character.HumanoidRootPart\n        billboard.Size = UDim2.new(0, 100, 0, 50)\n        billboard.StudsOffset = Vector3.new(0, 3, 0)\n        billboard.AlwaysOnTop = true\n        \n        local nameLabel = Instance.new('TextLabel')\n        nameLabel.Parent = billboard\n        nameLabel.Size = UDim2.new(1, 0, 1, 0)\n        nameLabel.BackgroundTransparency = 1\n        nameLabel.Text = targetPlayer.Name\n        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)\n        nameLabel.TextStrokeTransparency = 0\n        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)\n        nameLabel.Font = Enum.Font.GothamBold\n        nameLabel.TextSize = 14\n        \n        local highlight = Instance.new('Highlight')\n        highlight.Parent = character\n        highlight.FillColor = Color3.fromRGB(255, 0, 0)\n        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)\n        highlight.FillTransparency = 0.5\n        highlight.OutlineTransparency = 0\n    end\n    \n    if targetPlayer.Character then\n        addESP(targetPlayer.Character)\n    end\n    \n    targetPlayer.CharacterAdded:Connect(addESP)\nend\n\nfor _, otherPlayer in pairs(Players:GetPlayers()) do\n    createESP(otherPlayer)\nend\n\nPlayers.PlayerAdded:Connect(createESP)\n\nprint('ESP enabled for all players!')"
    }
    
    return scriptTemplates[command] or "-- AI Command not found\nprint('Available AI commands: float, fly, speed, esp')\n-- Type /ai followed by a command name"
end

-- AI Chat System
local function generateAIResponse(message)
    local responses = {
        ["hello"] = "Hello! I'm the Samurai AI assistant. How can I help you with scripts today?",
        ["hey"] = "Hey there! Ready to generate some awesome scripts?",
        ["hi"] = "Hi! I'm here to help with your scripting needs. What would you like to create?",
        ["help"] = "I can help you generate scripts! Try commands like:\n• /ai float - Generate float script\n• /ai fly - Generate fly script\n• /ai speed - Generate speed boost\n• /ai esp - Generate ESP script",
        ["what can you do"] = "I can generate various scripts for you! I specialize in movement scripts (fly, float, speed) and utility scripts (ESP). Just ask me to create something!",
        ["thanks"] = "You're welcome! Happy to help with your scripting adventures!",
        ["thank you"] = "No problem! Let me know if you need any other scripts generated.",
        ["good"] = "Glad I could help! Feel free to ask for more script assistance anytime.",
        ["nice"] = "Thanks! I'm here whenever you need script generation help.",
        ["cool"] = "I'm glad you think so! What script should we work on next?",
        ["awesome"] = "Thank you! Ready to create more awesome scripts together?",
        ["who are you"] = "I'm the Samurai AI, your personal script generation assistant!",
        ["what is your name"] = "I'm Samurai AI, built into this executor to help you with script generation!"
    }
    
    local lowerMessage = message:lower()
    
    for trigger, response in pairs(responses) do
        if lowerMessage == trigger or lowerMessage:find(trigger) then
            return response
        end
    end
    
    local defaultResponses = {
        "I'm still learning! Try asking me to generate a script or use commands like /ai float, /ai fly, /ai speed, or /ai esp.",
        "That's interesting! I'm specialized in script generation. What kind of script would you like me to create?",
        "I understand you want to chat! I'm here to help with scripting. Try /ai [command] to generate scripts.",
        "I'm the Samurai AI assistant! I can help generate scripts for you. What would you like to create?",
        "Nice! I'm ready to help with script generation. Use /ai commands to get started!"
    }
    
    return defaultResponses[math.random(1, #defaultResponses)]
end

-- Settings
local settings = {
    theme = "Xeno",
    backgroundId = ""
}

-- Storage keys
local STORAGE_KEY = "SamuraiExecutor_Scripts_" .. player.UserId
local SETTINGS_KEY = "SamuraiExecutor_Settings_" .. player.UserId

-- Built-in Scripts Storage
local builtinScripts = {
    {
        name = "rezexis 99NITF",
        code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Rezexis/Main-Lua/refs/heads/main/Loader.lua"))()',
        author = "Rezexis,Faust,Ark"
    },
    {
        name = "ringta-INK",
        code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/inkgames.github.io/refs/heads/main/ringta.lua"))()',
        author = "Ringta"
    },
    {
        name = "Ringta-SAB",
        code = 'loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/4dfd8f97b48ec9c81706cb36a3f382d8.lua"))()',
        author = "Ringta"
    }
}

-- Xeno-style themes
local themes = {
    Xeno = {
        main = Color3.fromRGB(17, 17, 17),
        secondary = Color3.fromRGB(25, 25, 25),
        button = Color3.fromRGB(35, 35, 35),
        accent = Color3.fromRGB(0, 162, 255),
        text = Color3.fromRGB(255, 255, 255),
        green = Color3.fromRGB(46, 204, 113),
        sidebar = Color3.fromRGB(22, 22, 22)
    },
    Gray = {
        main = Color3.fromRGB(20, 20, 20),
        secondary = Color3.fromRGB(15, 15, 15),
        button = Color3.fromRGB(40, 40, 40),
        accent = Color3.fromRGB(60, 60, 60),
        text = Color3.fromRGB(255, 255, 255),
        green = Color3.fromRGB(0, 255, 0),
        sidebar = Color3.fromRGB(25, 25, 25)
    },
    Red = {
        main = Color3.fromRGB(30, 10, 10),
        secondary = Color3.fromRGB(40, 15, 15),
        button = Color3.fromRGB(60, 20, 20),
        accent = Color3.fromRGB(80, 25, 25),
        text = Color3.fromRGB(255, 255, 255),
        green = Color3.fromRGB(255, 100, 100),
        sidebar = Color3.fromRGB(35, 12, 12)
    },
    Blue = {
        main = Color3.fromRGB(10, 20, 30),
        secondary = Color3.fromRGB(15, 25, 40),
        button = Color3.fromRGB(20, 30, 60),
        accent = Color3.fromRGB(25, 35, 80),
        text = Color3.fromRGB(255, 255, 255),
        green = Color3.fromRGB(100, 255, 255),
        sidebar = Color3.fromRGB(12, 22, 35)
    }
}

-- Activation Button
local activateBtn = Instance.new("ImageButton")
activateBtn.Size = UDim2.new(0, 60, 0, 60)
activateBtn.Position = UDim2.new(0, 5, 0, 5)
activateBtn.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
activateBtn.Image = "rbxassetid://99224451763710"
activateBtn.BorderSizePixel = 0
activateBtn.Active = true
activateBtn.Draggable = true
activateBtn.Parent = gui

local corner1 = Instance.new("UICorner")
corner1.CornerRadius = UDim.new(0.5, 0)
corner1.Parent = activateBtn

local activateStroke = Instance.new("UIStroke")
activateStroke.Color = Color3.fromRGB(0, 162, 255)
activateStroke.Thickness = 2
activateStroke.Parent = activateBtn

-- Main Frame (Xeno style)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 550, 0, 300)
frame.Position = UDim2.new(0.5, -275, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
frame.BorderSizePixel = 0
frame.Visible = false
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 15)
frameCorner.Parent = frame

-- Xeno-style border effect
local frameBorder = Instance.new("UIStroke")
frameBorder.Color = Color3.fromRGB(0, 162, 255)
frameBorder.Thickness = 1
frameBorder.Transparency = 0.2
frameBorder.Parent = frame

-- Blue blur background effect
local backgroundBlur = Instance.new("Frame")
backgroundBlur.Size = UDim2.new(1, 4, 1, 4)
backgroundBlur.Position = UDim2.new(0, -2, 0, -2)
backgroundBlur.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
backgroundBlur.BackgroundTransparency = 0.95
backgroundBlur.BorderSizePixel = 0
backgroundBlur.ZIndex = -1
backgroundBlur.Parent = frame

local blurCorner = Instance.new("UICorner")
blurCorner.CornerRadius = UDim.new(0, 17)
blurCorner.Parent = backgroundBlur

-- Custom background image (more visible)
local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Size = UDim2.new(1, 0, 1, 0)
backgroundImage.Position = UDim2.new(0, 0, 0, 0)
backgroundImage.BackgroundTransparency = 1
backgroundImage.ImageTransparency = 0.3
backgroundImage.ScaleType = Enum.ScaleType.Crop
backgroundImage.Image = ""
backgroundImage.Parent = frame

local backgroundCorner = Instance.new("UICorner")
backgroundCorner.CornerRadius = UDim.new(0, 15)
backgroundCorner.Parent = backgroundImage

-- Sidebar (Xeno style)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 80, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
sidebar.BorderSizePixel = 0
sidebar.Parent = frame

local sidebarCorner = Instance.new("UICorner")
sidebarCorner.CornerRadius = UDim.new(0, 15)
sidebarCorner.Parent = sidebar

local sidebarFix = Instance.new("Frame")
sidebarFix.Size = UDim2.new(0, 15, 1, 0)
sidebarFix.Position = UDim2.new(1, -15, 0, 0)
sidebarFix.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
sidebarFix.BorderSizePixel = 0
sidebarFix.Parent = sidebar

-- Main content area
local contentArea = Instance.new("Frame")
contentArea.Size = UDim2.new(1, -80, 1, 0)
contentArea.Position = UDim2.new(0, 80, 0, 0)
contentArea.BackgroundTransparency = 1
contentArea.Parent = frame

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleBar.BorderSizePixel = 0
titleBar.Parent = contentArea

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 15)
titleCorner.Parent = titleBar

local titleFix = Instance.new("Frame")
titleFix.Size = UDim2.new(1, 0, 0, 15)
titleFix.Position = UDim2.new(0, 0, 1, -15)
titleFix.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleFix.BorderSizePixel = 0
titleFix.Parent = titleBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Samurai Executor"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextSize = 16
title.Parent = titleBar

-- Status indicator (Xeno style)
local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 200, 0, 20)
statusLabel.Position = UDim2.new(1, -270, 0, 10)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Interface opened | " .. detectExecutor() .. " | " .. getUserRank()
statusLabel.TextColor3 = Color3.fromRGB(46, 204, 113)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 10
statusLabel.TextXAlignment = Enum.TextXAlignment.Right
statusLabel.Parent = titleBar

local function updateStatus(message)
    local executor = detectExecutor()
    local rank = getUserRank()
    statusLabel.Text = message .. " | " .. executor .. " | " .. rank
end

-- Settings and Close buttons
local settingsBtn = Instance.new("TextButton")
settingsBtn.Size = UDim2.new(0, 30, 0, 25)
settingsBtn.Position = UDim2.new(1, -70, 0, 8)
settingsBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
settingsBtn.Text = "⚙"
settingsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsBtn.Font = Enum.Font.GothamBold
settingsBtn.TextSize = 14
settingsBtn.Parent = titleBar

local settingsBtnCorner = Instance.new("UICorner")
settingsBtnCorner.CornerRadius = UDim.new(0, 5)
settingsBtnCorner.Parent = settingsBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 25)
closeBtn.Position = UDim2.new(1, -35, 0, 8)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 71, 87)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.Parent = titleBar

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 5)
closeBtnCorner.Parent = closeBtn

-- Main script editor area
local scriptFrame = Instance.new("ScrollingFrame")
scriptFrame.Size = UDim2.new(1, -20, 1, -90)
scriptFrame.Position = UDim2.new(0, 10, 0, 50)
scriptFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
scriptFrame.BorderSizePixel = 0
scriptFrame.ScrollBarThickness = 6
scriptFrame.Parent = contentArea

local scriptFrameCorner = Instance.new("UICorner")
scriptFrameCorner.CornerRadius = UDim.new(0, 8)
scriptFrameCorner.Parent = scriptFrame

local scriptBox = Instance.new("TextBox")
scriptBox.Size = UDim2.new(1, -15, 1, 0)
scriptBox.Position = UDim2.new(0, 10, 0, 0)
scriptBox.BackgroundTransparency = 1
scriptBox.TextColor3 = Color3.fromRGB(46, 204, 113)
scriptBox.Font = Enum.Font.Code
scriptBox.TextSize = 14
scriptBox.MultiLine = true
scriptBox.Text = "-- Samurai Executor Mobile!\nprint(\"Hello World!\")"
scriptBox.ClearTextOnFocus = false
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.TextYAlignment = Enum.TextYAlignment.Top
scriptBox.Parent = scriptFrame

-- Bottom tab (Xeno style)
local bottomTab = Instance.new("Frame")
bottomTab.Size = UDim2.new(1, -20, 0, 30)
bottomTab.Position = UDim2.new(0, 10, 1, -40)
bottomTab.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
bottomTab.BorderSizePixel = 0
bottomTab.Parent = contentArea

local bottomTabCorner = Instance.new("UICorner")
bottomTabCorner.CornerRadius = UDim.new(0, 8)
bottomTabCorner.Parent = bottomTab

-- Bottom tab buttons
local runBtn = Instance.new("TextButton")
runBtn.Size = UDim2.new(0.5, -5, 1, -4)
runBtn.Position = UDim2.new(0, 2, 0, 2)
runBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
runBtn.Text = "▶ Run"
runBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
runBtn.Font = Enum.Font.GothamBold
runBtn.TextSize = 12
runBtn.Parent = bottomTab

local runBtnCorner = Instance.new("UICorner")
runBtnCorner.CornerRadius = UDim.new(0, 6)
runBtnCorner.Parent = runBtn

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0.5, -5, 1, -4)
clearBtn.Position = UDim2.new(0.5, 3, 0, 2)
clearBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
clearBtn.Text = "🗑 Clear"
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.Font = Enum.Font.GothamBold
clearBtn.TextSize = 12
clearBtn.Parent = bottomTab

local clearBtnCorner = Instance.new("UICorner")
clearBtnCorner.CornerRadius = UDim.new(0, 6)
clearBtnCorner.Parent = clearBtn

-- Sidebar buttons (Xeno style)
local function createSidebarButton(text, icon, yPos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.Position = UDim2.new(0, 5, 0, yPos)
    btn.BackgroundColor3 = color or Color3.fromRGB(35, 35, 35)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 10
    btn.Parent = sidebar
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = btn
    
    return btn
end

local scriptsBtn = createSidebarButton("Scripts", "📜", 10)
local saveBtn = createSidebarButton("Save", "💾", 50)
local builtinBtn = createSidebarButton("Built-in", "⭐", 90, Color3.fromRGB(255, 193, 7))
local aiBtn = createSidebarButton("AI Chat", "🤖", 130, Color3.fromRGB(88, 101, 242))
local discordBtn = createSidebarButton("Discord", "💬", 170, Color3.fromRGB(88, 101, 242))
local creditsBtn = createSidebarButton("Credits", "👑", 210, Color3.fromRGB(255, 193, 7))

-- AI Chat Window (ChatGPT style)
local aiChatFrame = Instance.new("Frame")
aiChatFrame.Size = UDim2.new(0, 400, 0, 350)
aiChatFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
aiChatFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
aiChatFrame.BorderSizePixel = 0
aiChatFrame.Visible = false
aiChatFrame.Active = true
aiChatFrame.Draggable = true
aiChatFrame.Parent = gui

local aiChatFrameCorner = Instance.new("UICorner")
aiChatFrameCorner.CornerRadius = UDim.new(0, 15)
aiChatFrameCorner.Parent = aiChatFrame

local aiChatFrameStroke = Instance.new("UIStroke")
aiChatFrameStroke.Color = Color3.fromRGB(88, 101, 242)
aiChatFrameStroke.Thickness = 1
aiChatFrameStroke.Transparency = 0.2
aiChatFrameStroke.Parent = aiChatFrame

local aiChatTitleBar = Instance.new("Frame")
aiChatTitleBar.Size = UDim2.new(1, 0, 0, 40)
aiChatTitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
aiChatTitleBar.BorderSizePixel = 0
aiChatTitleBar.Parent = aiChatFrame

local aiChatTitleCorner = Instance.new("UICorner")
aiChatTitleCorner.CornerRadius = UDim.new(0, 15)
aiChatTitleCorner.Parent = aiChatTitleBar

local aiChatTitle = Instance.new("TextLabel")
aiChatTitle.Size = UDim2.new(1, -40, 1, 0)
aiChatTitle.Position = UDim2.new(0, 15, 0, 0)
aiChatTitle.BackgroundTransparency = 1
aiChatTitle.Text = "🤖 Samurai AI Chat"
aiChatTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
aiChatTitle.Font = Enum.Font.GothamBold
aiChatTitle.TextSize = 16
aiChatTitle.TextXAlignment = Enum.TextXAlignment.Left
aiChatTitle.Parent = aiChatTitleBar

local aiChatCloseBtn = Instance.new("TextButton")
aiChatCloseBtn.Size = UDim2.new(0, 30, 0, 25)
aiChatCloseBtn.Position = UDim2.new(1, -35, 0, 8)
aiChatCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 71, 87)
aiChatCloseBtn.Text = "×"
aiChatCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aiChatCloseBtn.Font = Enum.Font.GothamBold
aiChatCloseBtn.TextSize = 14
aiChatCloseBtn.Parent = aiChatTitleBar

local aiChatCloseBtnCorner = Instance.new("UICorner")
aiChatCloseBtnCorner.CornerRadius = UDim.new(0, 5)
aiChatCloseBtnCorner.Parent = aiChatCloseBtn

local aiChatScrollFrame = Instance.new("ScrollingFrame")
aiChatScrollFrame.Size = UDim2.new(1, -20, 1, -100)
aiChatScrollFrame.Position = UDim2.new(0, 10, 0, 50)
aiChatScrollFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
aiChatScrollFrame.BorderSizePixel = 0
aiChatScrollFrame.ScrollBarThickness = 4
aiChatScrollFrame.Parent = aiChatFrame

local aiChatScrollCorner = Instance.new("UICorner")
aiChatScrollCorner.CornerRadius = UDim.new(0, 8)
aiChatScrollCorner.Parent = aiChatScrollFrame

local aiChatList = Instance.new("UIListLayout")
aiChatList.FillDirection = Enum.FillDirection.Vertical
aiChatList.HorizontalAlignment = Enum.HorizontalAlignment.Left
aiChatList.VerticalAlignment = Enum.VerticalAlignment.Top
aiChatList.SortOrder = Enum.SortOrder.LayoutOrder
aiChatList.Padding = UDim.new(0, 8)
aiChatList.Parent = aiChatScrollFrame

local aiChatInput = Instance.new("TextBox")
aiChatInput.Size = UDim2.new(1, -80, 0, 35)
aiChatInput.Position = UDim2.new(0, 10, 1, -45)
aiChatInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
aiChatInput.Text = ""
aiChatInput.PlaceholderText = "Type /ai [message] or just chat..."
aiChatInput.TextColor3 = Color3.fromRGB(255, 255, 255)
aiChatInput.Font = Enum.Font.Gotham
aiChatInput.TextSize = 12
aiChatInput.TextXAlignment = Enum.TextXAlignment.Left
aiChatInput.Parent = aiChatFrame

local aiChatInputCorner = Instance.new("UICorner")
aiChatInputCorner.CornerRadius = UDim.new(0, 8)
aiChatInputCorner.Parent = aiChatInput

local aiChatSendBtn = Instance.new("TextButton")
aiChatSendBtn.Size = UDim2.new(0, 60, 0, 35)
aiChatSendBtn.Position = UDim2.new(1, -70, 1, -45)
aiChatSendBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
aiChatSendBtn.Text = "Send"
aiChatSendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
aiChatSendBtn.Font = Enum.Font.GothamBold
aiChatSendBtn.TextSize = 12
aiChatSendBtn.Parent = aiChatFrame

local aiChatSendCorner = Instance.new("UICorner")
aiChatSendCorner.CornerRadius = UDim.new(0, 8)
aiChatSendCorner.Parent = aiChatSendBtn

-- Function to add message to chat
local function addChatMessage(sender, message, isAI)
    local messageFrame = Instance.new("Frame")
    messageFrame.Size = UDim2.new(1, -10, 0, 0)
    messageFrame.BackgroundTransparency = 1
    messageFrame.Parent = aiChatScrollFrame
    
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -10, 1, 0)
    messageLabel.Position = UDim2.new(0, 5, 0, 0)
    messageLabel.BackgroundColor3 = isAI and Color3.fromRGB(88, 101, 242) or Color3.fromRGB(35, 35, 35)
    messageLabel.Text = (isAI and "🤖 " or "👤 ") .. sender .. ": " .. message
    messageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextSize = 11
    messageLabel.TextWrapped = true
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.Parent = messageFrame
    
    local messageLabelCorner = Instance.new("UICorner")
    messageLabelCorner.CornerRadius = UDim.new(0, 8)
    messageLabelCorner.Parent = messageLabel
    
    messageLabel.Size = UDim2.new(1, -10, 0, messageLabel.TextBounds.Y + 10)
    messageFrame.Size = UDim2.new(1, -10, 0, messageLabel.TextBounds.Y + 15)
    
    aiChatScrollFrame.CanvasSize = UDim2.new(0, 0, 0, aiChatList.AbsoluteContentSize.Y + 10)
    aiChatScrollFrame.CanvasPosition = Vector2.new(0, aiChatScrollFrame.CanvasSize.Y.Offset)
end

-- Function to handle AI chat
local function handleAIChat(message)
    addChatMessage(player.Name, message, false)
    
    local cleanMessage = message:lower()
    if cleanMessage:match("^/ai%s+(.+)") then
        local command = cleanMessage:match("^/ai%s+(.+)")
        
        if command == "float" or command == "fly" or command == "speed" or command == "esp" then
            local script = generateAIScript(command)
            scriptBox.Text = script
            addChatMessage("Samurai AI", "I've generated a " .. command .. " script for you! Check the main executor window.", true)
            return
        end
        
        local response = generateAIResponse(command)
        addChatMessage("Samurai AI", response, true)
    else
        local response = generateAIResponse(message)
        addChatMessage("Samurai AI", response, true)
    end
end

-- Built-in Scripts Window
local builtinFrame = Instance.new("Frame")
builtinFrame.Size = UDim2.new(0, 350, 0, 300)
builtinFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
builtinFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
builtinFrame.BorderSizePixel = 0
builtinFrame.Visible = false
builtinFrame.Active = true
builtinFrame.Draggable = true
builtinFrame.Parent = gui

local builtinFrameCorner = Instance.new("UICorner")
builtinFrameCorner.CornerRadius = UDim.new(0, 15)
builtinFrameCorner.Parent = builtinFrame

local builtinFrameStroke = Instance.new("UIStroke")
builtinFrameStroke.Color = Color3.fromRGB(0, 162, 255)
builtinFrameStroke.Thickness = 1
builtinFrameStroke.Transparency = 0.2
builtinFrameStroke.Parent = builtinFrame

local builtinTitle = Instance.new("TextLabel")
builtinTitle.Size = UDim2.new(1, 0, 0, 40)
builtinTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
builtinTitle.BorderSizePixel = 0
builtinTitle.Text = "⭐ Built-in Scripts"
builtinTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
builtinTitle.Font = Enum.Font.GothamBold
builtinTitle.TextSize = 16
builtinTitle.Parent = builtinFrame

local builtinTitleCorner = Instance.new("UICorner")
builtinTitleCorner.CornerRadius = UDim.new(0, 15)
builtinTitleCorner.Parent = builtinTitle

local builtinCloseBtn = Instance.new("TextButton")
builtinCloseBtn.Size = UDim2.new(0, 30, 0, 25)
builtinCloseBtn.Position = UDim2.new(1, -35, 0, 8)
builtinCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 71, 87)
builtinCloseBtn.Text = "×"
builtinCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
builtinCloseBtn.Font = Enum.Font.GothamBold
builtinCloseBtn.TextSize = 14
builtinCloseBtn.Parent = builtinTitle

local builtinCloseBtnCorner = Instance.new("UICorner")
builtinCloseBtnCorner.CornerRadius = UDim.new(0, 5)
builtinCloseBtnCorner.Parent = builtinCloseBtn

-- Search bar in built-in scripts
local searchFrame = Instance.new("Frame")
searchFrame.Size = UDim2.new(1, -20, 0, 35)
searchFrame.Position = UDim2.new(0, 10, 0, 50)
searchFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
searchFrame.BorderSizePixel = 0
searchFrame.Parent = builtinFrame

local searchFrameCorner = Instance.new("UICorner")
searchFrameCorner.CornerRadius = UDim.new(0, 8)
searchFrameCorner.Parent = searchFrame

local searchBox = Instance.new("TextBox")
searchBox.Size = UDim2.new(1, -15, 1, 0)
searchBox.Position = UDim2.new(0, 10, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.Text = ""
searchBox.PlaceholderText = "🔍 Search scripts..."
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 12
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.Parent = searchFrame

local builtinList = Instance.new("ScrollingFrame")
builtinList.Size = UDim2.new(1, -20, 1, -100)
builtinList.Position = UDim2.new(0, 10, 0, 90)
builtinList.BackgroundTransparency = 1
builtinList.ScrollBarThickness = 4
builtinList.Parent = builtinFrame

-- Function to populate built-in scripts with search
local function populateBuiltinScripts(searchTerm)
    searchTerm = searchTerm or ""
    searchTerm = searchTerm:lower()
    
    for _, child in pairs(builtinList:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    
    local yPos = 0
    for i, script in pairs(builtinScripts) do
        if searchTerm == "" or script.name:lower():find(searchTerm) or script.author:lower():find(searchTerm) then
            local scriptFrame = Instance.new("Frame")
            scriptFrame.Size = UDim2.new(1, -10, 0, 60)
            scriptFrame.Position = UDim2.new(0, 5, 0, yPos)
            scriptFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            scriptFrame.BorderSizePixel = 0
            scriptFrame.Parent = builtinList
            
            local scriptFrameCorner = Instance.new("UICorner")
            scriptFrameCorner.CornerRadius = UDim.new(0, 8)
            scriptFrameCorner.Parent = scriptFrame
            
            local scriptFrameStroke = Instance.new("UIStroke")
            scriptFrameStroke.Color = Color3.fromRGB(0, 162, 255)
            scriptFrameStroke.Thickness = 1
            scriptFrameStroke.Transparency = 0.6
            scriptFrameStroke.Parent = scriptFrame
            
            local scriptName = Instance.new("TextLabel")
            scriptName.Size = UDim2.new(1, -80, 0, 25)
            scriptName.Position = UDim2.new(0, 10, 0, 5)
            scriptName.BackgroundTransparency = 1
            scriptName.Text = script.name
            scriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
            scriptName.Font = Enum.Font.GothamBold
            scriptName.TextSize = 12
            scriptName.TextXAlignment = Enum.TextXAlignment.Left
            scriptName.Parent = scriptFrame
            
            local scriptAuthor = Instance.new("TextLabel")
            scriptAuthor.Size = UDim2.new(1, -80, 0, 20)
            scriptAuthor.Position = UDim2.new(0, 10, 0, 30)
            scriptAuthor.BackgroundTransparency = 1
            scriptAuthor.Text = "By: " .. script.author
            scriptAuthor.TextColor3 = Color3.fromRGB(150, 150, 150)
            scriptAuthor.Font = Enum.Font.Gotham
            scriptAuthor.TextSize = 10
            scriptAuthor.TextXAlignment = Enum.TextXAlignment.Left
            scriptAuthor.Parent = scriptFrame
            
            local loadBtn = Instance.new("TextButton")
            loadBtn.Size = UDim2.new(0, 60, 0, 50)
            loadBtn.Position = UDim2.new(1, -70, 0, 5)
            loadBtn.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
            loadBtn.Text = "Load"
            loadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            loadBtn.Font = Enum.Font.GothamBold
            loadBtn.TextSize = 11
            loadBtn.Parent = scriptFrame
            
            local loadBtnCorner = Instance.new("UICorner")
            loadBtnCorner.CornerRadius = UDim.new(0, 8)
            loadBtnCorner.Parent = loadBtn
            
            loadBtn.MouseButton1Click:Connect(function()
                scriptBox.Text = script.code
                builtinFrame.Visible = false
                updateStatus("Loaded: " .. script.name)
            end)
            
            yPos = yPos + 70
        end
    end
    
    builtinList.CanvasSize = UDim2.new(0, 0, 0, yPos)
end

-- Search functionality
searchBox.Changed:Connect(function()
    populateBuiltinScripts(searchBox.Text)
end)

-- Settings Window
local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(0, 300, 0, 250)
settingsFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
settingsFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
settingsFrame.BorderSizePixel = 0
settingsFrame.Visible = false
settingsFrame.Active = true
settingsFrame.Draggable = true
settingsFrame.Parent = gui

local settingsFrameCorner = Instance.new("UICorner")
settingsFrameCorner.CornerRadius = UDim.new(0, 15)
settingsFrameCorner.Parent = settingsFrame

local settingsFrameStroke = Instance.new("UIStroke")
settingsFrameStroke.Color = Color3.fromRGB(0, 162, 255)
settingsFrameStroke.Thickness = 1
settingsFrameStroke.Transparency = 0.2
settingsFrameStroke.Parent = settingsFrame

local settingsTitle = Instance.new("TextLabel")
settingsTitle.Size = UDim2.new(1, 0, 0, 40)
settingsTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
settingsTitle.BorderSizePixel = 0
settingsTitle.Text = "⚙ Settings"
settingsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsTitle.Font = Enum.Font.GothamBold
settingsTitle.TextSize = 16
settingsTitle.Parent = settingsFrame

local settingsTitleCorner = Instance.new("UICorner")
settingsTitleCorner.CornerRadius = UDim.new(0, 15)
settingsTitleCorner.Parent = settingsTitle

local settingsCloseBtn = Instance.new("TextButton")
settingsCloseBtn.Size = UDim2.new(0, 30, 0, 25)
settingsCloseBtn.Position = UDim2.new(1, -35, 0, 8)
settingsCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 71, 87)
settingsCloseBtn.Text = "×"
settingsCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsCloseBtn.Font = Enum.Font.GothamBold
settingsCloseBtn.TextSize = 14
settingsCloseBtn.Parent = settingsTitle

local settingsCloseBtnCorner = Instance.new("UICorner")
settingsCloseBtnCorner.CornerRadius = UDim.new(0, 5)
settingsCloseBtnCorner.Parent = settingsCloseBtn

-- Theme selection
local themeLabel = Instance.new("TextLabel")
themeLabel.Size = UDim2.new(1, -20, 0, 25)
themeLabel.Position = UDim2.new(0, 10, 0, 60)
themeLabel.BackgroundTransparency = 1
themeLabel.Text = "Theme:"
themeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
themeLabel.Font = Enum.Font.GothamBold
themeLabel.TextSize = 12
themeLabel.TextXAlignment = Enum.TextXAlignment.Left
themeLabel.Parent = settingsFrame

local function createThemeButton(themeName, xPos)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 70, 0, 30)
    btn.Position = UDim2.new(0, xPos, 0, 90)
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.Text = themeName
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 11
    btn.Parent = settingsFrame
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 162, 255)
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.Parent = btn
    
    return btn
end

local xenoBtn = createThemeButton("Xeno", 20)
local grayBtn = createThemeButton("Gray", 100)
local redBtn = createThemeButton("Red", 180)

-- Background settings
local backgroundLabel = Instance.new("TextLabel")
backgroundLabel.Size = UDim2.new(1, -20, 0, 25)
backgroundLabel.Position = UDim2.new(0, 10, 0, 140)
backgroundLabel.BackgroundTransparency = 1
backgroundLabel.Text = "Background ID:"
backgroundLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
backgroundLabel.Font = Enum.Font.GothamBold
backgroundLabel.TextSize = 12
backgroundLabel.TextXAlignment = Enum.TextXAlignment.Left
backgroundLabel.Parent = settingsFrame

local backgroundBox = Instance.new("TextBox")
backgroundBox.Size = UDim2.new(1, -100, 0, 30)
backgroundBox.Position = UDim2.new(0, 10, 0, 170)
backgroundBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
backgroundBox.Text = settings.backgroundId
backgroundBox.TextColor3 = Color3.fromRGB(255, 255, 255)
backgroundBox.Font = Enum.Font.Gotham
backgroundBox.TextSize = 11
backgroundBox.PlaceholderText = "Asset ID..."
backgroundBox.Parent = settingsFrame

local backgroundBoxCorner = Instance.new("UICorner")
backgroundBoxCorner.CornerRadius = UDim.new(0, 8)
backgroundBoxCorner.Parent = backgroundBox

local applyBgBtn = Instance.new("TextButton")
applyBgBtn.Size = UDim2.new(0, 80, 0, 30)
applyBgBtn.Position = UDim2.new(1, -90, 0, 170)
applyBgBtn.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
applyBgBtn.Text = "Apply"
applyBgBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
applyBgBtn.Font = Enum.Font.GothamBold
applyBgBtn.TextSize = 11
applyBgBtn.Parent = settingsFrame

local applyBgBtnCorner = Instance.new("UICorner")
applyBgBtnCorner.CornerRadius = UDim.new(0, 8)
applyBgBtnCorner.Parent = applyBgBtn

-- Scripts Window
local scriptsFrame = Instance.new("Frame")
scriptsFrame.Size = UDim2.new(0, 350, 0, 300)
scriptsFrame.Position = UDim2.new(0.5, -175, 0.5, -150)
scriptsFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
scriptsFrame.BorderSizePixel = 0
scriptsFrame.Visible = false
scriptsFrame.Active = true
scriptsFrame.Draggable = true
scriptsFrame.Parent = gui

local scriptsFrameCorner = Instance.new("UICorner")
scriptsFrameCorner.CornerRadius = UDim.new(0, 15)
scriptsFrameCorner.Parent = scriptsFrame

local scriptsFrameStroke = Instance.new("UIStroke")
scriptsFrameStroke.Color = Color3.fromRGB(0, 162, 255)
scriptsFrameStroke.Thickness = 1
scriptsFrameStroke.Transparency = 0.2
scriptsFrameStroke.Parent = scriptsFrame

local scriptsTitle = Instance.new("TextLabel")
scriptsTitle.Size = UDim2.new(1, 0, 0, 40)
scriptsTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
scriptsTitle.BorderSizePixel = 0
scriptsTitle.Text = "📜 Saved Scripts"
scriptsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptsTitle.Font = Enum.Font.GothamBold
scriptsTitle.TextSize = 16
scriptsTitle.Parent = scriptsFrame

local scriptsTitleCorner = Instance.new("UICorner")
scriptsTitleCorner.CornerRadius = UDim.new(0, 15)
scriptsTitleCorner.Parent = scriptsTitle

local scriptsCloseBtn = Instance.new("TextButton")
scriptsCloseBtn.Size = UDim2.new(0, 30, 0, 25)
scriptsCloseBtn.Position = UDim2.new(1, -35, 0, 8)
scriptsCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 71, 87)
scriptsCloseBtn.Text = "×"
scriptsCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptsCloseBtn.Font = Enum.Font.GothamBold
scriptsCloseBtn.TextSize = 14
scriptsCloseBtn.Parent = scriptsTitle

local scriptsCloseBtnCorner = Instance.new("UICorner")
scriptsCloseBtnCorner.CornerRadius = UDim.new(0, 5)
scriptsCloseBtnCorner.Parent = scriptsCloseBtn

local savedList = Instance.new("ScrollingFrame")
savedList.Size = UDim2.new(1, -20, 1, -55)
savedList.Position = UDim2.new(0, 10, 0, 45)
savedList.BackgroundTransparency = 1
savedList.ScrollBarThickness = 4
savedList.Parent = scriptsFrame

-- Credits Window
local creditsFrame = Instance.new("Frame")
creditsFrame.Size = UDim2.new(0, 300, 0, 200)
creditsFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
creditsFrame.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
creditsFrame.BorderSizePixel = 0
creditsFrame.Visible = false
creditsFrame.Active = true
creditsFrame.Draggable = true
creditsFrame.Parent = gui

local creditsFrameCorner = Instance.new("UICorner")
creditsFrameCorner.CornerRadius = UDim.new(0, 15)
creditsFrameCorner.Parent = creditsFrame

local creditsFrameStroke = Instance.new("UIStroke")
creditsFrameStroke.Color = Color3.fromRGB(255, 193, 7)
creditsFrameStroke.Thickness = 1
creditsFrameStroke.Transparency = 0.2
creditsFrameStroke.Parent = creditsFrame

local creditsTitle = Instance.new("TextLabel")
creditsTitle.Size = UDim2.new(1, 0, 0, 40)
creditsTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
creditsTitle.BorderSizePixel = 0
creditsTitle.Text = "👑 Credits"
creditsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsTitle.Font = Enum.Font.GothamBold
creditsTitle.TextSize = 16
creditsTitle.Parent = creditsFrame

local creditsTitleCorner = Instance.new("UICorner")
creditsTitleCorner.CornerRadius = UDim.new(0, 15)
creditsTitleCorner.Parent = creditsTitle

local creditsCloseBtn = Instance.new("TextButton")
creditsCloseBtn.Size = UDim2.new(0, 30, 0, 25)
creditsCloseBtn.Position = UDim2.new(1, -35, 0, 8)
creditsCloseBtn.BackgroundColor3 = Color3.fromRGB(255, 71, 87)
creditsCloseBtn.Text = "×"
creditsCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsCloseBtn.Font = Enum.Font.GothamBold
creditsCloseBtn.TextSize = 14
creditsCloseBtn.Parent = creditsTitle

local creditsCloseBtnCorner = Instance.new("UICorner")
creditsCloseBtnCorner.CornerRadius = UDim.new(0, 5)
creditsCloseBtnCorner.Parent = creditsCloseBtn

local creditsContent = Instance.new("TextLabel")
creditsContent.Size = UDim2.new(1, -20, 1, -55)
creditsContent.Position = UDim2.new(0, 10, 0, 45)
creditsContent.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
creditsContent.Text = "🚀 Samurai Executor v3.0\n\n👑 Owner: revborn\n🛠 Developer: Samurai Team\n🎨 UI Design: Xeno-Style\n🤖 AI Integration: Advanced\n\n⭐ Features:\n• Xeno-Style Interface\n• AI Script Generation\n• Built-in Scripts Library\n• Search Functionality\n• Theme Customization\n\n💬 Discord: discord.gg/samurai"
creditsContent.TextColor3 = Color3.fromRGB(255, 255, 255)
creditsContent.Font = Enum.Font.Gotham
creditsContent.TextSize = 11
creditsContent.TextWrapped = true
creditsContent.TextYAlignment = Enum.TextYAlignment.Top
creditsContent.Parent = creditsFrame

local creditsContentCorner = Instance.new("UICorner")
creditsContentCorner.CornerRadius = UDim.new(0, 8)
creditsContentCorner.Parent = creditsContent

-- Save Dialog
local saveDialog = Instance.new("Frame")
saveDialog.Size = UDim2.new(0, 300, 0, 150)
saveDialog.Position = UDim2.new(0.5, -150, 0.5, -75)
saveDialog.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
saveDialog.BorderSizePixel = 0
saveDialog.Visible = false
saveDialog.Active = true
saveDialog.Draggable = true
saveDialog.Parent = gui

local saveDialogCorner = Instance.new("UICorner")
saveDialogCorner.CornerRadius = UDim.new(0, 15)
saveDialogCorner.Parent = saveDialog

local saveDialogStroke = Instance.new("UIStroke")
saveDialogStroke.Color = Color3.fromRGB(0, 162, 255)
saveDialogStroke.Thickness = 1
saveDialogStroke.Transparency = 0.2
saveDialogStroke.Parent = saveDialog

local saveDialogTitle = Instance.new("TextLabel")
saveDialogTitle.Size = UDim2.new(1, 0, 0, 40)
saveDialogTitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
saveDialogTitle.Text = "💾 Save Script"
saveDialogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
saveDialogTitle.Font = Enum.Font.GothamBold
saveDialogTitle.TextSize = 16
saveDialogTitle.Parent = saveDialog

local saveDialogTitleCorner = Instance.new("UICorner")
saveDialogTitleCorner.CornerRadius = UDim.new(0, 15)
saveDialogTitleCorner.Parent = saveDialogTitle

local nameInput = Instance.new("TextBox")
nameInput.Size = UDim2.new(1, -40, 0, 30)
nameInput.Position = UDim2.new(0, 20, 0, 60)
nameInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
nameInput.Text = ""
nameInput.PlaceholderText = "Script Name"
nameInput.TextColor3 = Color3.fromRGB(255, 255, 255)
nameInput.Font = Enum.Font.Gotham
nameInput.TextSize = 12
nameInput.Parent = saveDialog

local nameInputCorner = Instance.new("UICorner")
nameInputCorner.CornerRadius = UDim.new(0, 8)
nameInputCorner.Parent = nameInput

local saveConfirmBtn = Instance.new("TextButton")
saveConfirmBtn.Size = UDim2.new(0, 100, 0, 30)
saveConfirmBtn.Position = UDim2.new(0, 20, 0, 105)
saveConfirmBtn.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
saveConfirmBtn.Text = "Save"
saveConfirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
saveConfirmBtn.Font = Enum.Font.GothamBold
saveConfirmBtn.TextSize = 12
saveConfirmBtn.Parent = saveDialog

local saveConfirmBtnCorner = Instance.new("UICorner")
saveConfirmBtnCorner.CornerRadius = UDim.new(0, 8)
saveConfirmBtnCorner.Parent = saveConfirmBtn

local saveCancelBtn = Instance.new("TextButton")
saveCancelBtn.Size = UDim2.new(0, 100, 0, 30)
saveCancelBtn.Position = UDim2.new(1, -120, 0, 105)
saveCancelBtn.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
saveCancelBtn.Text = "Cancel"
saveCancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
saveCancelBtn.Font = Enum.Font.GothamBold
saveCancelBtn.TextSize = 12
saveCancelBtn.Parent = saveDialog

local saveCancelBtnCorner = Instance.new("UICorner")
saveCancelBtnCorner.CornerRadius = UDim.new(0, 8)
saveCancelBtnCorner.Parent = saveCancelBtn

-- Storage functions
local savedScripts = {}

local function saveScriptsPermanently()
    pcall(function()
        if writefile then
            local scriptsData = HttpService:JSONEncode(savedScripts)
            writefile(STORAGE_KEY .. ".json", scriptsData)
        end
    end)
end

local function loadSavedScripts()
    pcall(function()
        if isfile and readfile and isfile(STORAGE_KEY .. ".json") then
            local scriptsData = readfile(STORAGE_KEY .. ".json")
            savedScripts = HttpService:JSONDecode(scriptsData)
        end
    end)
end

local function saveSettings()
    pcall(function()
        if writefile then
            local settingsData = HttpService:JSONEncode(settings)
            writefile(SETTINGS_KEY .. ".json", settingsData)
        end
    end)
end

local function loadSettings()
    pcall(function()
        if isfile and readfile and isfile(SETTINGS_KEY .. ".json") then
            local settingsData = readfile(SETTINGS_KEY .. ".json")
            settings = HttpService:JSONDecode(settingsData)
        end
    end)
end

-- Function to execute script
local function executeScript(code)
    updateStatus("Running...")
    
    spawn(function()
        local success, result = pcall(function()
            local func, err = loadstring(code)
            if func then
                return func()
            else
                error("Syntax Error: " .. tostring(err))
            end
        end)
        
        if success then
            updateStatus("Success!")
            print("Samurai Executor: Script executed successfully!")
        else
            updateStatus("Error!")
            warn("Samurai Executor Error:", result)
        end
        
        wait(3)
        updateStatus("Ready")
    end)
end

-- Function to apply theme
local function applyTheme(newTheme)
    settings.theme = newTheme
    local theme = themes[newTheme]
    
    frame.BackgroundColor3 = theme.main
    sidebar.BackgroundColor3 = theme.sidebar
    sidebarFix.BackgroundColor3 = theme.sidebar
    titleBar.BackgroundColor3 = theme.secondary
    titleFix.BackgroundColor3 = theme.secondary
    settingsBtn.BackgroundColor3 = theme.button
    bottomTab.BackgroundColor3 = theme.secondary
    
    frameBorder.Color = theme.accent
    activateStroke.Color = theme.accent
    statusLabel.TextColor3 = theme.green
    scriptBox.TextColor3 = theme.green
    
    saveSettings()
end

-- Function to apply background
local function applyBackground()
    if settings.backgroundId and settings.backgroundId ~= "" then
        backgroundImage.Image = "rbxassetid://" .. settings.backgroundId
        backgroundImage.ImageTransparency = 0.3
    else
        backgroundImage.Image = ""
    end
end

-- AI Command Processing
scriptBox.Changed:Connect(function()
    scriptBox.Size = UDim2.new(1, -15, 0, math.max(scriptBox.TextBounds.Y + 20, scriptFrame.AbsoluteSize.Y))
    scriptFrame.CanvasSize = UDim2.new(0, 0, 0, scriptBox.TextBounds.Y + 40)
    
    local text = scriptBox.Text:lower()
    
    if text:find("^/ai") then
        if text:find("/ai float") then
            scriptBox.Text = generateAIScript("float")
            updateStatus("AI Float script generated")
        elseif text:find("/ai fly") then
            scriptBox.Text = generateAIScript("fly")
            updateStatus("AI Fly script generated")
        elseif text:find("/ai speed") then
            scriptBox.Text = generateAIScript("speed")
            updateStatus("AI Speed script generated")
        elseif text:find("/ai esp") then
            scriptBox.Text = generateAIScript("esp")
            updateStatus("AI ESP script generated")
        end
    end
end)

-- Event Connections
activateBtn.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    if frame.Visible then
        updateStatus("Interface opened")
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
end)

settingsBtn.MouseButton1Click:Connect(function()
    settingsFrame.Visible = true
end)

runBtn.MouseButton1Click:Connect(function()
    executeScript(scriptBox.Text)
end)

clearBtn.MouseButton1Click:Connect(function()
    scriptBox.Text = "-- Samurai Executor Mobile!\nprint(\"Hello World!\")"
    updateStatus("Script cleared")
end)

scriptsBtn.MouseButton1Click:Connect(function()
    scriptsFrame.Visible = true
end)

saveBtn.MouseButton1Click:Connect(function()
    if scriptBox.Text:gsub("%s", "") == "" or scriptBox.Text == "-- Samurai Executor Mobile!\nprint(\"Hello World!\")" then
        updateStatus("Nothing to save")
        return
    end
    saveDialog.Visible = true
    nameInput.Text = ""
end)

builtinBtn.MouseButton1Click:Connect(function()
    builtinFrame.Visible = true
    populateBuiltinScripts()
end)

aiBtn.MouseButton1Click:Connect(function()
    aiChatFrame.Visible = not aiChatFrame.Visible
end)

discordBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://discord.gg/BEvGWKK4")
        updateStatus("Discord link copied!")
    else
        updateStatus("Discord: discord.gg/BEvGWKK4")
    end
end)

creditsBtn.MouseButton1Click:Connect(function()
    creditsFrame.Visible = true
end)

-- AI Chat connections
aiChatCloseBtn.MouseButton1Click:Connect(function()
    aiChatFrame.Visible = false
end)

aiChatSendBtn.MouseButton1Click:Connect(function()
    local message = aiChatInput.Text
    if message:gsub("%s", "") ~= "" then
        handleAIChat(message)
        aiChatInput.Text = ""
    end
end)

aiChatInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local message = aiChatInput.Text
        if message:gsub("%s", "") ~= "" then
            handleAIChat(message)
            aiChatInput.Text = ""
        end
    end
end)

-- Settings connections
settingsCloseBtn.MouseButton1Click:Connect(function()
    settingsFrame.Visible = false
end)

scriptsCloseBtn.MouseButton1Click:Connect(function()
    scriptsFrame.Visible = false
end)

builtinCloseBtn.MouseButton1Click:Connect(function()
    builtinFrame.Visible = false
end)

creditsCloseBtn.MouseButton1Click:Connect(function()
    creditsFrame.Visible = false
end)

xenoBtn.MouseButton1Click:Connect(function()
    applyTheme("Xeno")
    updateStatus("Xeno theme applied")
end)

grayBtn.MouseButton1Click:Connect(function()
    applyTheme("Gray")
    updateStatus("Gray theme applied")
end)

redBtn.MouseButton1Click:Connect(function()
    applyTheme("Red")
    updateStatus("Red theme applied")
end)

applyBgBtn.MouseButton1Click:Connect(function()
    settings.backgroundId = backgroundBox.Text
    saveSettings()
    applyBackground()
    updateStatus("Background applied")
end)

saveConfirmBtn.MouseButton1Click:Connect(function()
    if nameInput.Text:gsub("%s", "") == "" then
        return
    end
    
    local newScript = {
        name = nameInput.Text,
        code = scriptBox.Text,
        author = player.Name
    }
    
    table.insert(savedScripts, newScript)
    saveScriptsPermanently()
    saveDialog.Visible = false
    updateStatus("Script saved")
end)

saveCancelBtn.MouseButton1Click:Connect(function()
    saveDialog.Visible = false
end)

-- Keyboard shortcuts
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.F9 then
        frame.Visible = not frame.Visible
    elseif input.KeyCode == Enum.KeyCode.F10 and frame.Visible then
        executeScript(scriptBox.Text)
    elseif input.KeyCode == Enum.KeyCode.F11 and frame.Visible then
        scriptBox.Text = "-- Samurai Executor Mobile!\nprint(\"Hello World!\")"
        updateStatus("Script cleared")
    end
end)

-- Initialize
loadSettings()
loadSavedScripts()
applyTheme(settings.theme)
applyBackground()
updateStatus("Samurai Executor v3.0 Ready")

-- Add welcome message to AI chat
spawn(function()
    wait(1)
    addChatMessage("Samurai AI", "Hello! I'm your AI assistant. Type /ai followed by your message or just chat with me normally!", true)
end)

print("🚀 Samurai Executor v3.0 Loaded Successfully!")
print("📱 Press F9 to toggle interface")
print("⚡ Press F10 to execute script")
print("🗑 Press F11 to clear script")
print("🤖 AI Chat available in sidebar")
print("👤 Your rank: " .. getUserRank())
print("🔧 Detected executor: " .. detectExecutor())
print("💎 Xeno-style UI activated!")
