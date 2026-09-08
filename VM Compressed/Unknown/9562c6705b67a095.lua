-- --- Terminal V5.1 Bootloader ---

-- 1. Securely fetch the API key from local workspace
local function getLocalKey()
    local fileName = "api_key"
    if isfile(fileName) then
        local success, keyFunc = pcall(loadstring(readfile(fileName)))
        if success and typeof(keyFunc) == "string" then
            return keyFunc
        end
    end
    warn("[TERMINAL ERROR]: API Key file not found in workspace!")
    return nil
end

_G.TERMINAL_KEY = getLocalKey()

-- 2. Load the main script from GitHub
if _G.TERMINAL_KEY then
    print("[SYSTEM]: Key validated. Loading Terminal V5.1 UI...")
else
    warn("[SYSTEM]: Boot aborted due to missing API Key.")
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- --- UI SETUP ---
local mainGui = Instance.new("ScreenGui", playerGui)
mainGui.Name = "TerminalV5"
mainGui.ResetOnSpawn = false

local main = Instance.new("Frame", mainGui)
main.Size = UDim2.new(0, 450, 0, 300)
main.Position = UDim2.new(0.5, -225, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.Active = true
main.Draggable = true
Instance.new("UICorner", main)

-- --- ANIMATED NEON LED EDGES (DARK PINK & DARK BLUE BY DEFAULT) ---
local ledStroke = Instance.new("UIStroke", main)
ledStroke.Thickness = 2.5
ledStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
ledStroke.Color = Color3.fromRGB(255, 255, 255) -- Base white to allow multiplier

local ledGradient = Instance.new("UIGradient", ledStroke)
ledGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(230, 0, 115)),  -- Vivid Neon Dark Pink
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(0, 35, 160)),   -- Vivid Neon Dark Blue
    ColorSequenceKeypoint.new(0.50, Color3.fromRGB(230, 0, 115)),  -- Vivid Neon Dark Pink
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(0, 35, 160)),   -- Vivid Neon Dark Blue
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(230, 0, 115))   -- Vivid Neon Dark Pink
})

-- --- NEW DRAGGABLE CIRCLE TOGGLE BUTTON ---
local toggleCircle = Instance.new("Frame", mainGui)
toggleCircle.Name = "ToggleCircle"
toggleCircle.Size = UDim2.new(0, 45, 0, 45)
toggleCircle.Position = UDim2.new(0.1, 0, 0.1, 0) -- Default spawn position
toggleCircle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
toggleCircle.Active = true
Instance.new("UICorner", toggleCircle).CornerRadius = UDim.new(1, 0) -- Perfect Circle

local toggleStroke = Instance.new("UIStroke", toggleCircle)
toggleStroke.Thickness = 2
toggleStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
toggleStroke.Color = Color3.fromRGB(255, 255, 255)

local toggleGradient = Instance.new("UIGradient", toggleStroke)
toggleGradient.Color = ledGradient.Color

local toggleLabel = Instance.new("TextLabel", toggleCircle)
toggleLabel.Size = UDim2.new(1, 0, 1, 0)
toggleLabel.BackgroundTransparency = 1
toggleLabel.Text = "T"
toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleLabel.TextSize = 22
toggleLabel.FontFace = Font.fromId(12187374765)

-- Dynamic RGB LED Flow Animation Loop (Synchronized)
task.spawn(function()
    local rotSpeed = 110 -- Speed of rotation/flow
    while mainGui and mainGui.Parent do
        local dt = RunService.RenderStepped:Wait()
        local nextRotation = (ledGradient.Rotation + (rotSpeed * dt)) % 360
        ledGradient.Rotation = nextRotation
        toggleGradient.Rotation = nextRotation
    end
end)

-- Custom Mobile-Optimized Drag & Click Handler for Circle Toggle
local dragging = false
local dragInput
local dragStart
local startPos
local moved = false

toggleCircle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        moved = false
        dragStart = input.Position
        startPos = toggleCircle.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if not moved then
                    -- Triggered click/tap because no significant motion delta was recorded
                    main.Visible = not main.Visible
                end
            end
        end)
    end
end)

toggleCircle.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        if delta.Magnitude > 5 then
            moved = true
        end
        toggleCircle.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 30)
header.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Instance.new("UICorner", header)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.Text = "-TERMINAL V5.0-"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 18
title.TextXAlignment = "Left"
title.BackgroundTransparency = 1
title.FontFace = Font.fromId(12187374765)

-- Minimize Button has been fully deleted. Close button is aligned properly.
local closeBtn = Instance.new("TextButton", header)
closeBtn.Size = UDim2.new(0, 30, 1, 0)
closeBtn.Position = UDim2.new(1, -35, 0, 0)
closeBtn.Text = "×"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.BackgroundTransparency = 1
closeBtn.TextSize = 24

-- --- SIDEBAR ---
local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0, 80, 1, -30)
sidebar.Position = UDim2.new(0, 0, 0, 30)
sidebar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
sidebar.BorderSizePixel = 0
Instance.new("UICorner", sidebar)

local sidebarLayout = Instance.new("UIListLayout", sidebar)
sidebarLayout.Padding = UDim.new(0, 5)
sidebarLayout.HorizontalAlignment = "Center"

local function createSidebarBtn(text)
    local btn = Instance.new("TextButton", sidebar)
    btn.Size = UDim2.new(0, 70, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 13
    btn.FontFace = Font.fromId(12187374765)
    Instance.new("UICorner", btn)
    return btn
end

local cmdPanelBtn = createSidebarBtn("CMD")
local terminPanelBtn = createSidebarBtn("Termin")
local bloxPanelBtn = createSidebarBtn("ScriptBlox")

-- --- CMD PANEL ---
local cmdPanel = Instance.new("Frame", main)
cmdPanel.Size = UDim2.new(1, -90, 1, -30)
cmdPanel.Position = UDim2.new(0, 85, 0, 30)
cmdPanel.BackgroundTransparency = 1
cmdPanel.Visible = true

local scroll = Instance.new("ScrollingFrame", cmdPanel)
scroll.Size = UDim2.new(1, -5, 1, -45)
scroll.Position = UDim2.new(0, 0, 0, 5)
scroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
scroll.AutomaticCanvasSize = "Y"
scroll.ScrollBarThickness = 4
Instance.new("UICorner", scroll)

local output = Instance.new("TextLabel", scroll)
output.Size = UDim2.new(1, -10, 0, 0)
output.AutomaticSize = "Y"
output.Position = UDim2.new(0, 5, 0, 5)
output.TextColor3 = Color3.fromRGB(0, 255, 0)
output.TextSize = 16
output.TextXAlignment = "Left"
output.RichText = true
output.BackgroundTransparency = 1
output.FontFace = Font.fromId(12187374765)
output.TextWrapped = true 
output.Text = "Terminal V5.0 Online. System scan complete."

local bar = Instance.new("Frame", cmdPanel)
bar.Size = UDim2.new(1, -5, 0, 30)
bar.Position = UDim2.new(0, 0, 1, -35)
bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", bar)

local prefixLabel = Instance.new("TextLabel", bar)
prefixLabel.Size = UDim2.new(0, 25, 1, 0)
prefixLabel.Text = "$"
prefixLabel.TextColor3 = Color3.new(0, 1, 0)
prefixLabel.TextSize = 18
prefixLabel.BackgroundTransparency = 1

local input = Instance.new("TextBox", bar)
input.Size = UDim2.new(1, -30, 1, 0)
input.Position = UDim2.new(0, 25, 0, 0)
input.Text = ""
input.PlaceholderText = "Enter command..."
input.TextColor3 = Color3.new(1, 1, 1)
input.TextSize = 16
input.TextXAlignment = "Left"
input.BackgroundTransparency = 1
input.FontFace = Font.fromId(12187374765)

-- --- TERMIN PANEL (AI) ---
local terminPanel = Instance.new("Frame", main)
terminPanel.Size = UDim2.new(1, -90, 1, -30)
terminPanel.Position = UDim2.new(0, 85, 0, 30)
terminPanel.BackgroundTransparency = 1
terminPanel.Visible = false

local aiScroll = Instance.new("ScrollingFrame", terminPanel)
aiScroll.Size = UDim2.new(1, -5, 1, -45)
aiScroll.Position = UDim2.new(0, 0, 0, 5)
aiScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
aiScroll.AutomaticCanvasSize = "Y"
aiScroll.ScrollBarThickness = 4
Instance.new("UICorner", aiScroll)

local aiOutput = Instance.new("TextLabel", aiScroll)
aiOutput.Size = UDim2.new(1, -10, 0, 0)
aiOutput.AutomaticSize = Enum.AutomaticSize.Y 
aiOutput.Position = UDim2.new(0, 5, 0, 5)
aiOutput.TextColor3 = Color3.fromRGB(200, 200, 255)
aiOutput.TextSize = 16
aiOutput.TextXAlignment = "Left"
aiOutput.TextYAlignment = "Top"
aiOutput.RichText = true
aiOutput.BackgroundTransparency = 1
aiOutput.FontFace = Font.fromId(12187374765)
aiOutput.TextWrapped = true 
aiOutput.Text = "<b>Termin:</b> Connection established. AI ready."

local aiBar = Instance.new("Frame", terminPanel)
aiBar.Size = UDim2.new(1, -5, 0, 30)
aiBar.Position = UDim2.new(0, 0, 1, -35)
aiBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", aiBar)

local aiInput = Instance.new("TextBox", aiBar)
aiInput.Size = UDim2.new(1, -10, 1, 0)
aiInput.Position = UDim2.new(0, 5, 0, 0)
aiInput.Text = ""
aiInput.PlaceholderText = "Message Termin AI..."
aiInput.TextColor3 = Color3.new(1, 1, 1)
aiInput.TextSize = 16
aiInput.TextXAlignment = "Left"
aiInput.BackgroundTransparency = 1
aiInput.FontFace = Font.fromId(12187374765)

-- --- SCRIPTBLOX PANEL ---
local bloxPanel = Instance.new("Frame", main)
bloxPanel.Size = UDim2.new(1, -90, 1, -30)
bloxPanel.Position = UDim2.new(0, 85, 0, 30)
bloxPanel.BackgroundTransparency = 1
bloxPanel.Visible = false

local bloxHeader = Instance.new("TextLabel", bloxPanel)
bloxHeader.Size = UDim2.new(1, 0, 0, 20)
bloxHeader.Text = "Powered by ScriptBlox.com"
bloxHeader.TextColor3 = Color3.fromRGB(255, 150, 0)
bloxHeader.TextSize = 14
bloxHeader.BackgroundTransparency = 1
bloxHeader.FontFace = Font.fromId(12187374765)

local bloxScroll = Instance.new("ScrollingFrame", bloxPanel)
bloxScroll.Size = UDim2.new(1, -5, 1, -70)
bloxScroll.Position = UDim2.new(0, 0, 0, 25)
bloxScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
bloxScroll.AutomaticCanvasSize = "Y"
bloxScroll.ScrollBarThickness = 4
Instance.new("UICorner", bloxScroll)

local bloxList = Instance.new("UIListLayout", bloxScroll)
bloxList.Padding = UDim.new(0, 5)

local bloxBar = Instance.new("Frame", bloxPanel)
bloxBar.Size = UDim2.new(1, -5, 0, 30)
bloxBar.Position = UDim2.new(0, 0, 1, -35)
bloxBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", bloxBar)

local bloxInput = Instance.new("TextBox", bloxBar)
bloxInput.Size = UDim2.new(1, -10, 1, 0)
bloxInput.Position = UDim2.new(0, 5, 0, 0)
bloxInput.Text = ""
bloxInput.PlaceholderText = "Search scripts on ScriptBlox..."
bloxInput.TextColor3 = Color3.new(1, 1, 1)
bloxInput.TextSize = 16
bloxInput.BackgroundTransparency = 1
bloxInput.FontFace = Font.fromId(12187374765)

-- --- LOAD STATED-LOGIC SYSTEM FROM GITHUB ---
local CoreSystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/H4T0-debug/Terminal_V5/refs/heads/main/CmdProcessor"))()

-- Bind client-side elements directly to core engine (Exposing main and the circle gradients)
local systemAPI = CoreSystem.Init({
    APIKey = _G.TERMINAL_KEY,
    OutputLabel = output,
    AiOutputLabel = aiOutput,
    CmdScroll = scroll,
    AiScroll = aiScroll,
    BloxScroll = bloxScroll,
    LedGradient = ledGradient
})

-- Handle setting custom LED colors dynamically from CmdProcessor references
RunService.Stepped:Connect(function()
    if toggleGradient then
        toggleGradient.Color = ledGradient.Color
    end
end)

-- --- INTERACTION PASS-THROUGHS (SERIALIZED AS JSON DATA) ---
input.FocusLost:Connect(function(enter) 
    if enter and input.Text ~= "" then 
        local dataPacket = HttpService:JSONEncode({
            type = "command",
            data = input.Text
        })
        systemAPI.ReceiveJSON(dataPacket)
        input.Text = "" 
    end 
end)

aiInput.FocusLost:Connect(function(enter)
    if enter and aiInput.Text ~= "" then
        local dataPacket = HttpService:JSONEncode({
            type = "ai",
            data = aiInput.Text
        })
        systemAPI.ReceiveJSON(dataPacket)
        aiInput.Text = ""
    end
end)

bloxInput.FocusLost:Connect(function(enter)
    if enter and bloxInput.Text ~= "" then
        local dataPacket = HttpService:JSONEncode({
            type = "search",
            data = bloxInput.Text
        })
        systemAPI.ReceiveJSON(dataPacket)
    end
end)

-- --- UI VISUAL CONTROLLERS ---
local activePanel = "CMD"
local function setPanel(name)
    activePanel = name
    cmdPanel.Visible = (name == "CMD")
    terminPanel.Visible = (name == "Termin")
    bloxPanel.Visible = (name == "ScriptBlox")
end

cmdPanelBtn.MouseButton1Click:Connect(function() setPanel("CMD") end)
terminPanelBtn.MouseButton1Click:Connect(function() setPanel("Termin") end)
bloxPanelBtn.MouseButton1Click:Connect(function() setPanel("ScriptBlox") end)

closeBtn.MouseButton1Click:Connect(function() mainGui:Destroy() end)
