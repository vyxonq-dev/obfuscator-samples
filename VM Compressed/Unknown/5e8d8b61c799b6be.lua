local json = loadstring(game:HttpGet("https://raw.githubusercontent.com/rxi/json.lua/master/json.lua"))()

local chatStatus, chatEvent, TextChannel
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local chatHistory = {}

if ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents") then
    chatStatus = "old"
    chatEvent = ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest
else 
    chatStatus = "new"
    TextChannel = game:GetService("TextChatService").TextChannels.RBXGeneral
end

if getgenv().ChatForgerRunning then
    warn("Chat Forger is already running. Close the existing instance first.")
    return
end

local endpoint = "https://api.openai.com/v1/chat/completions"
local systemPrompt = "You will be given a Roblox chat message and a task you will perform on the message. You will return the new Roblox chat message ONLY (DO NOT include things like 'MESSAGE: ' at the start). If the user task is N/A, return the original message. Preserve the original tone of the message (e.g. if the original message is lowercase, the new message should be lowercase). You will also be given the chat history for context, but ONLY use the LATEST user task and message."

local model = "gpt-4o-mini"
local apiKey
local guiVisible = true

local function createDraggableFrame(parent, title)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 200)
    frame.Position = UDim2.new(0.5, -175, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    local cornerRadius = Instance.new("UICorner")
    cornerRadius.CornerRadius = UDim.new(0, 12)
    cornerRadius.Parent = frame
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    
    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 40)
    titleBar.Position = UDim2.new(0, 0, 0, 0)
    titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    titleBar.BorderSizePixel = 0
    titleBar.Parent = frame
    
    local titleBarCorner = Instance.new("UICorner")
    titleBarCorner.CornerRadius = UDim.new(0, 12)
    titleBarCorner.Parent = titleBar
    
    local titleBarMask = Instance.new("Frame")
    titleBarMask.Size = UDim2.new(1, 0, 0.5, 0)
    titleBarMask.Position = UDim2.new(0, 0, 0.5, 0)
    titleBarMask.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
    titleBarMask.BorderSizePixel = 0
    titleBarMask.Parent = titleBar
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -100, 1, 0)
    titleLabel.Position = UDim2.new(0, 15, 0, 0)
    titleLabel.Text = title
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(220, 220, 240)
    titleLabel.Font = Enum.Font.GothamSemibold
    titleLabel.TextSize = 18
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar
    
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -40, 0, 5)
    closeButton.Text = "X"
    closeButton.BackgroundTransparency = 1
    closeButton.TextColor3 = Color3.fromRGB(255, 100, 100)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 20
    closeButton.Parent = titleBar
    
    return frame, closeButton
end

local function toggleGuiVisibility(gui)
    guiVisible = not guiVisible
    gui.Enabled = guiVisible
end

local function createGui()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")
    
    for _, v in pairs(playerGui:GetChildren()) do
        if v.Name == "ChatForgerGui" then
            v:Destroy()
        end
    end
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "ChatForgerGui"
    gui.Parent = playerGui
    gui.ResetOnSpawn = false
    
    local frame, closeButton = createDraggableFrame(gui, "Chat Forger")
    
    local taskLabel = Instance.new("TextLabel")
    taskLabel.Size = UDim2.new(1, -20, 0, 30)
    taskLabel.Position = UDim2.new(0, 130, 0, 45)
    taskLabel.Text = "User Task"
    taskLabel.BackgroundTransparency = 1
    taskLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    taskLabel.Font = Enum.Font.GothamMedium
    taskLabel.TextSize = 16
    taskLabel.TextXAlignment = Enum.TextXAlignment.Left
    taskLabel.Parent = frame
    
    local taskTextBox = Instance.new("TextBox")
    taskTextBox.Size = UDim2.new(1, -20, 0, 80)
    taskTextBox.Position = UDim2.new(0, 10, 0, 80)
    taskTextBox.Text = getgenv().userTask
    taskTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
    taskTextBox.TextColor3 = Color3.fromRGB(220, 220, 240)
    taskTextBox.Font = Enum.Font.Gotham
    taskTextBox.TextSize = 14
    taskTextBox.MultiLine = true
    taskTextBox.ClearTextOnFocus = false
    taskTextBox.BorderSizePixel = 0
    taskTextBox.TextWrapped = true
    taskTextBox.Parent = frame
    
    local textBoxCorner = Instance.new("UICorner")
    textBoxCorner.CornerRadius = UDim.new(0, 8)
    textBoxCorner.Parent = taskTextBox

    taskTextBox:GetPropertyChangedSignal("Text"):Connect(function()
        getgenv().userTask = taskTextBox.Text
    end)
    
    closeButton.MouseButton1Click:Connect(function()
        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 350, 0, 0)
        }):Play()
        wait(0.3)
        gui:Destroy()
        getgenv().ChatForgerRunning = false
    end)

    local function handleKeyPress(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.RightShift and input.UserInputState == Enum.UserInputState.Begin and not gameProcessed then
            toggleGuiVisibility(gui)
        end
    end

    local inputConnection = UserInputService.InputBegan:Connect(handleKeyPress)
    
    gui.AncestryChanged:Connect(function(_, parent)
        if parent == nil then
            inputConnection:Disconnect()
        end
    end)
    
    return taskTextBox
end

local function validateApiKey(key)
    local payload = json.encode({
        model = model,
        messages = {{role = "system", content = "Say 'hi'"}},
        temperature = 0
    })

    local headers = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "Bearer " .. key
    }

    local success, result = pcall(function()
        return request({
            Url = endpoint,
            Method = "POST",
            Headers = headers,
            Body = payload
        })
    end)

    if not success then
        return false
    end

    local responseData = json.decode(result.Body)
    return responseData and responseData.choices and responseData.choices[1]
end

local function createApiKeyGui()
    local playerGui = LocalPlayer:WaitForChild("PlayerGui")

    local gui = Instance.new("ScreenGui", playerGui)
    gui.Name = "ApiKeyGui"
    
    local frame, closeButton = createDraggableFrame(gui, "Enter OpenAI API Key")
    frame.Size = UDim2.new(0, 350, 0, 230)
    
    local instructionLabel = Instance.new("TextLabel")
    instructionLabel.Size = UDim2.new(1, -40, 0, 40)
    instructionLabel.Position = UDim2.new(0, 20, 0, 50)
    instructionLabel.Text = "Paste your OpenAI API key below"
    instructionLabel.BackgroundTransparency = 1
    instructionLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    instructionLabel.Font = Enum.Font.GothamMedium
    instructionLabel.TextSize = 16
    instructionLabel.TextWrapped = true
    instructionLabel.Parent = frame
    
    local textBox = Instance.new("TextBox", frame)
    textBox.Size = UDim2.new(1, -40, 0, 50)
    textBox.Position = UDim2.new(0, 20, 0, 100)
    textBox.Text = ""
    textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 65)
    textBox.TextColor3 = Color3.fromRGB(200, 200, 220)
    textBox.Font = Enum.Font.Gotham
    textBox.TextSize = 14
    textBox.ClearTextOnFocus = false
    textBox.TextTruncate = Enum.TextTruncate.AtEnd
    
    local textBoxCorner = Instance.new("UICorner")
    textBoxCorner.CornerRadius = UDim.new(0, 8)
    textBoxCorner.Parent = textBox
    
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(0, 150, 0, 40)
    button.Position = UDim2.new(0.5, -75, 1, -60)
    button.Text = "Validate API Key"
    button.BackgroundColor3 = Color3.fromRGB(40, 120, 255)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 14
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button

    local function handleKeyPress(input)
        if input.KeyCode == Enum.KeyCode.RightShift and input.UserInputState == Enum.UserInputState.Begin then
            toggleGuiVisibility(gui)
        end
    end

    local inputConnection = UserInputService.InputBegan:Connect(handleKeyPress)

    gui.AncestryChanged:Connect(function(_, parent)
        if parent == nil then
            inputConnection:Disconnect()
        end
    end)
    
    local function validateAndSetup()
        button.Text = "Checking..."
        if validateApiKey(textBox.Text) then
            apiKey = textBox.Text
            getgenv().ChatForgerApiKey = apiKey
            if not userTask then 
                getgenv().userTask = "uwuify every message"
            end
            gui:Destroy()
            taskTextBox = createGui()
            getgenv().ChatForgerRunning = true
        else
            button.Text = "Invalid Key"
            wait(2)
            button.Text = "Validate API Key"
        end
    end
    
    button.MouseButton1Click:Connect(validateAndSetup)
    
    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    if getgenv().ChatForgerApiKey then
        textBox.Text = getgenv().ChatForgerApiKey
    end
    
    return textBox
end

local function getMessage(oldMessage)
    if not getgenv().ChatForgerRunning then
        return oldMessage
    end

    local historyStr = ""
    for i, exchange in ipairs(chatHistory) do
        historyStr = historyStr .. "User: " .. exchange.user .. "\nGPT: " .. exchange.gpt .. "\n"
    end

    local userTaskFinal = (userTask ~= "" and userTask) or "N/A"
    local prompt = string.format("Chat History:\n%s\nUSER TASK: %s\nMESSAGE: %s", historyStr, userTaskFinal, oldMessage)

    local messages = {
        { role = "system", content = systemPrompt },
        { role = "user", content = prompt }
    }

    local payload = json.encode({
        model = model,
        messages = messages,
        temperature = 1
    })

    local headers = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "Bearer " .. getgenv().ChatForgerApiKey
    }

    local success, result = pcall(function()
        return request({
            Url = endpoint,
            Method = "POST",
            Headers = headers,
            Body = payload
        })
    end)

    if not success then
        return oldMessage
    end

    local responseData = json.decode(result.Body)
    if not responseData or not responseData.choices or not responseData.choices[1] then
        return oldMessage
    end

    local gptResponse = responseData.choices[1].message.content

    table.insert(chatHistory, { user = oldMessage, gpt = gptResponse })

    return gptResponse
end

local function initializeScript()
    createApiKeyGui()
end

getgenv().ChatForgerRunning = false

initializeScript()

if not getgenv().hooked then
    if chatStatus == "old" then
        if not hookmetamethod then error("Your exploit does not support hookmetamethod") end
        local namecall
        namecall = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if not checkcaller() then
                if method == "FireServer" and self == chatEvent then
                    local args = {...}
                    local success, result = pcall(function()
                        return getMessage(args[1])
                    end)
                    if success then
                        args[1] = result
                        return namecall(self, unpack(args))
                    end
                end
            end
            return namecall(self, ...)
        end)
    else 
        TextChannel.OnIncomingMessage = function(Message)
            if tostring(Message.TextSource) == tostring(LocalPlayer.Name) and Message.Status == Enum.TextChatMessageStatus.Sending then
                Message.Text = getMessage(Message.Text)
            end
        end
    end

    getgenv().hooked = true
end
