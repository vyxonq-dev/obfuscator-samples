local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MenuGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Função para criar borda animada (loop roxo <-> preto)
local function createAnimatedBorder(frame)
    local border = Instance.new("UIStroke")
    border.Thickness = 3
    border.Color = Color3.fromRGB(128, 0, 128) -- roxo
    border.Parent = frame

    spawn(function()
        while frame.Parent do
            local tween1 = TweenService:Create(border, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.new(0,0,0)})
            local tween2 = TweenService:Create(border, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(128, 0, 128)})

            tween1:Play()
            tween1.Completed:Wait()
            tween2:Play()
            tween2.Completed:Wait()
        end
    end)
end

-- Container das mensagens no canto inferior esquerdo
local messagesFrame = Instance.new("Frame")
messagesFrame.Name = "MessagesFrame"
messagesFrame.Size = UDim2.new(0, 250, 0, 150)
messagesFrame.Position = UDim2.new(0, 10, 1, -160)
messagesFrame.BackgroundTransparency = 1
messagesFrame.Parent = screenGui

-- Função para criar mensagem animada
local activeMessages = {}

local function showMessage(text)
    -- Criar frame da mensagem
    local msgFrame = Instance.new("Frame")
    msgFrame.Size = UDim2.new(1, 0, 0, 40)
    msgFrame.BackgroundColor3 = Color3.new(0,0,0)
    msgFrame.AnchorPoint = Vector2.new(0,1)
    msgFrame.Position = UDim2.new(-1, 0, 1, 0) -- fora da tela à esquerda
    msgFrame.Parent = messagesFrame

    createAnimatedBorder(msgFrame)

    -- Texto
    local label = Instance.new("TextLabel")
    label.Text = text
    label.Size = UDim2.new(1, -10, 1, 0)
    label.Position = UDim2.new(0, 5, 0, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(128, 0, 128)
    label.TextScaled = true
    label.Font = Enum.Font.Code
    label.Parent = msgFrame

    -- Animar entrada
    local tweenIn = TweenService:Create(msgFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 1, 0)
    })
    tweenIn:Play()

    -- Quando nova mensagem chega, sobe as antigas
    for i, oldMsg in ipairs(activeMessages) do
        local newY = -40 * (i+1)
        local tweenUp = TweenService:Create(oldMsg, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 1, newY)
        })
        tweenUp:Play()
    end

    table.insert(activeMessages, 1, msgFrame)

    local function removeMessage()
        local tweenOut = TweenService:Create(msgFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(-1, 0, 1, 0)
        })
        tweenOut:Play()
        tweenOut.Completed:Wait()

        msgFrame:Destroy()

        for i, v in ipairs(activeMessages) do
            if v == msgFrame then
                table.remove(activeMessages, i)
                break
            end
        end

        for i, oldMsg in ipairs(activeMessages) do
            local newY = -40 * i
            local tweenDown = TweenService:Create(oldMsg, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 0, 1, newY)
            })
            tweenDown:Play()
        end
    end

    return removeMessage
end

-- Botão Menu
local menuButton = Instance.new("TextButton")
menuButton.Name = "MenuButton"
menuButton.Text = "Menu"
menuButton.Size = UDim2.new(0, 80, 0, 40)
menuButton.Position = UDim2.new(1, -90, 0, 10)
menuButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
menuButton.TextColor3 = Color3.new(1,1,1)
menuButton.Font = Enum.Font.Code
menuButton.Parent = screenGui

local function animateBorderLoop(frame)
    local border = Instance.new("UIStroke")
    border.Thickness = 3
    border.Color = Color3.fromRGB(128, 0, 128)
    border.Parent = frame
    spawn(function()
        while frame.Parent do
            local tween1 = TweenService:Create(border, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.new(0,0,0)})
            local tween2 = TweenService:Create(border, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Color = Color3.fromRGB(128, 0, 128)})

            tween1:Play()
            tween1.Completed:Wait()
            tween2:Play()
            tween2.Completed:Wait()
        end
    end)
end

animateBorderLoop(menuButton)

-- Menu Frame
local menuFrame = Instance.new("Frame")
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0, 150, 0, 180)
menuFrame.Position = UDim2.new(1, -160, 0, 10)
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menuFrame.Visible = false
menuFrame.Parent = screenGui

animateBorderLoop(menuFrame)

local function createPurpleButton(text, posY)
    local btn = Instance.new("TextButton")
    btn.Name = text:gsub("%s","").."Button"
    btn.Text = text
    btn.Size = UDim2.new(1, -20, 0, 50)
    btn.Position = UDim2.new(0, 10, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.Code
    btn.Parent = menuFrame
    btn.Rotation = 0
    animateBorderLoop(btn)
    return btn
end

local allToolsButton = createPurpleButton("All Tools", 10)
local coinsButton = createPurpleButton("8k Coins", 70)
local freeAdminButton = createPurpleButton("Free Admin", 130)

local locations = {
    Vector3.new(-15.3779774, -284.625336, -65.9607849),
    Vector3.new(-243.060944, -287.223389, -21.6377792),
    Vector3.new(-43.3777199, -302.235504, 112.213585),
    Vector3.new(22.8102894, -185.855896, 181.659714),
    Vector3.new(253.086304, -75.7818375, -2.42079425),
    Vector3.new(-10.9490137, 97.5533142, 75.8645554),
}

local coinsPosition = Vector3.new(-30.3333302, 99.4570694, 70.2108)

local function animateButton(button)
    local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local tween1 = TweenService:Create(button, tweenInfo, {Rotation = 15})
    local tween2 = TweenService:Create(button, tweenInfo, {Rotation = 0})

    tween1:Play()
    tween1.Completed:Wait()
    tween2:Play()
end

for _, btn in ipairs({allToolsButton, coinsButton, freeAdminButton}) do
    btn.MouseEnter:Connect(function()
        animateButton(btn)
    end)
end

-- Label embaixo da tela
local label = Instance.new("TextLabel")
label.Text = "View Hub Gear Troll Tower 💥"
label.Size = UDim2.new(1, 0, 0, 30)
label.Position = UDim2.new(0, 0, 1, -35)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(128, 0, 128)
label.TextStrokeColor3 = Color3.new(0,0,0)
label.TextStrokeTransparency = 0.7
label.TextScaled = true
label.Font = Enum.Font.Code
label.Parent = screenGui

-- Toggle menu com animação descendo
menuButton.MouseButton1Click:Connect(function()
    if menuFrame.Visible then
        local tweenUp = TweenService:Create(menuFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Position = UDim2.new(1, -160, 0, 10)})
        tweenUp:Play()
        tweenUp.Completed:Wait()
        menuFrame.Visible = false
    else
        menuFrame.Position = UDim2.new(1, -160, 0, 10)
        menuFrame.Visible = true
        local tweenDown = TweenService:Create(menuFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1, -160, 0, 60)})
        tweenDown:Play()
    end
end)

local removeToolsLoadingMsg

allToolsButton.MouseButton1Click:Connect(function()
    if removeToolsLoadingMsg then
        removeToolsLoadingMsg()
        removeToolsLoadingMsg = nil
    end

    removeToolsLoadingMsg = showMessage("Tools Loading...")

    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        if removeToolsLoadingMsg then removeToolsLoadingMsg() end
        return
    end

    for _, pos in ipairs(locations) do
        character.HumanoidRootPart.CFrame = CFrame.new(pos)
        wait(3)
    end

    if removeToolsLoadingMsg then
        removeToolsLoadingMsg()
        removeToolsLoadingMsg = nil
    end
end)

coinsButton.MouseButton1Click:Connect(function()
    local rem = showMessage("Success!")

    local character = player.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        rem()
        return
    end

    character.HumanoidRootPart.CFrame = CFrame.new(coinsPosition)

    delay(3, rem)
end)

freeAdminButton.MouseButton1Click:Connect(function()
    local rem = showMessage("This free admin version is bugged, and may have errors.")

    delay(5, rem)

    loadstring(game:HttpGet("https://rawscripts.net/raw/Gear-Troll-Tower-FREE-ADMIN-KEYLESS-45424"))()
end)