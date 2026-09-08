--== Carregar Fluent ==--
local Library = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

--== Criar Janela ==--
local Window = Library:CreateWindow({
    Title = "Legend Hub Auto Clicker",
    SubTitle = "By DarkHub",
    TabWidth = 120,
    Size = UDim2.fromOffset(300, 260),
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Main = Window:AddTab({ Title = "Main", Icon = "mouse-pointer-click" })

---------------------------------------------------------------------
-- Variáveis
---------------------------------------------------------------------
local autoClick = false
local interval = 0.05
local vim = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")
local camera = workspace.CurrentCamera

---------------------------------------------------------------------
-- Auto Clicker
---------------------------------------------------------------------
local function centerClicker()
    while autoClick do
        task.wait(interval)
        
        local x = camera.ViewportSize.X / 2
        local y = camera.ViewportSize.Y / 2

        vim:SendMouseButtonEvent(x, y, 0, true, game, 1)
        vim:SendMouseButtonEvent(x, y, 0, false, game, 1)
    end
end

Main:AddToggle("AutoClicker", {
    Title = "Auto Clicker",
    Default = false,
    Callback = function(state)
        autoClick = state
        if state then task.spawn(centerClicker) end
    end
})

---------------------------------------------------------------------
-- WalkSpeed
---------------------------------------------------------------------

local player = game.Players.LocalPlayer
local humanoid = nil

local function updateHumanoid()
    if player.Character then
        humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    end
end

player.CharacterAdded:Connect(function()
    task.wait(1)
    updateHumanoid()
end)

updateHumanoid()

Main:AddSlider("WalkSpeedSlider", {
    Title = "WalkSpeed",
    Description = "Velocidade do jogador",
    Default = 16,
    Min = 16,
    Max = 200,
    Rounding = 0,
    Callback = function(value)
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
})

---------------------------------------------------------------------
-- Infinite Jump
---------------------------------------------------------------------

local infiniteJump = false

Main:AddToggle("InfiniteJump", {
    Title = "Infinite Jump",
    Default = false,
    Callback = function(state)
        infiniteJump = state
    end
})

UIS.JumpRequest:Connect(function()
    if infiniteJump and humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

---------------------------------------------------------------------
--==================== BOTÃO FLUTUANTE ====================--
---------------------------------------------------------------------

local UserInputService = game:GetService("UserInputService")

local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = game:GetService("CoreGui")

local tb = Instance.new("ImageButton")
tb.Size = UDim2.new(0, 50, 0, 50)
tb.Position = UDim2.new(0, 20, 0.5, -25)
tb.BackgroundColor3 = Color3.fromRGB(20,20,20)
tb.BorderSizePixel = 0
tb.Image = "rbxassetid://111987118624767"
tb.Parent = sg

local co = Instance.new("UICorner")
co.CornerRadius = UDim.new(1,0)
co.Parent = tb

local st = Instance.new("UIStroke")
st.Color = Color3.fromRGB(255,0,0)
st.Thickness = 2
st.Parent = tb

-- Abrir / Fechar UI
local uiVisible = true
tb.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    Window:Minimize(not uiVisible)
end)

-- Drag manual
do
    local dragging=false
    local dragInput=nil
    local dragStart=nil
    local startPos=nil

    tb.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            dragging=true
            dragStart=input.Position
            startPos=tb.Position
            input.Changed:Connect(function()
                if input.UserInputState==Enum.UserInputState.End then
                    dragging=false
                end
            end)
        end
    end)

    tb.InputChanged:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch then
            dragInput=input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input==dragInput and dragging and dragStart and startPos then
            local delta=input.Position-dragStart
            local newX=startPos.X.Offset+delta.X
            local newY=startPos.Y.Offset+delta.Y

            local screenX=math.clamp(newX,0,workspace.CurrentCamera.ViewportSize.X-tb.AbsoluteSize.X)
            local screenY=math.clamp(newY,0,workspace.CurrentCamera.ViewportSize.Y-tb.AbsoluteSize.Y)

            tb.Position=UDim2.new(0,screenX,0,screenY)
        end
    end)
end