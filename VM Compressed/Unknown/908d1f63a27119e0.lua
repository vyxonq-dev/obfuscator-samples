local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()



-- Элементы для анимации (LostHub Intro)

local function PlayIntro()

    local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))

    local text = Instance.new("TextLabel", screenGui)

    text.Size = UDim2.new(1, 0, 1, 0)

    text.BackgroundTransparency = 1

    text.Text = "LostHub"

    text.TextColor3 = Color3.fromRGB(255, 255, 255)

    text.Font = Enum.Font.Unknown -- Используем современный шрифт

    text.TextSize = 1

    text.TextTransparency = 1



    -- Анимация появления

    local ts = game:GetService("TweenService")

    text.TextTransparency = 0

    ts:Create(text, TweenInfo.new(1.5, Enum.EasingStyle.Quint), {TextSize = 80}):Play()

    wait(1.5)

    ts:Create(text, TweenInfo.new(1, Enum.EasingStyle.Quint), {TextTransparency = 1, TextSize = 120}):Play()

    wait(1)

    screenGui:Destroy()

end



-- Запуск интро

PlayIntro()



-- Создание окна

local Window = Fluent:CreateWindow({

    Title = "LOST",

    SubTitle = "Hub Edition",

    TabWidth = 160,

    Size = UDim2.fromOffset(580, 460),

    Acrylic = true,

    Theme = "Dark",

    MinimizeKey = Enum.KeyCode.LeftControl

})



-- Добавляем текст TG в самый низ (Footer)

local Footer = Instance.new("TextLabel")

Footer.Parent = Window.Root -- Привязываем к корню окна

Footer.Position = UDim2.new(0, 20, 1, -30)

Footer.Size = UDim2.new(0, 200, 0, 20)

Footer.BackgroundTransparency = 1

Footer.Text = "TG : @LostHubScript"

Footer.TextColor3 = Color3.fromRGB(150, 150, 150)

Footer.TextXAlignment = Enum.TextXAlignment.Left

Footer.Font = Enum.Font.SourceSansItalic

Footer.TextSize = 14



local Tabs = {

    Main = Window:AddTab({ Title = "Movement", Icon = "run" })

}



local Options = Fluent.Options

local lp = game:GetService("Players").LocalPlayer

local runService = game:GetService("RunService")

local userInputService = game:GetService("UserInputService")



local flying = false

local flySpeed = 50

local bv, bg



-- Логика движения WASD

local function getDirection()

    local direction = Vector3.new(0, 0, 0)

    if userInputService:IsKeyDown(Enum.KeyCode.W) then

        direction = direction + workspace.CurrentCamera.CFrame.LookVector

    end

    if userInputService:IsKeyDown(Enum.KeyCode.S) then

        direction = direction - workspace.CurrentCamera.CFrame.LookVector

    end

    if userInputService:IsKeyDown(Enum.KeyCode.A) then

        direction = direction - workspace.CurrentCamera.CFrame.RightVector

    end

    if userInputService:IsKeyDown(Enum.KeyCode.D) then

        direction = direction + workspace.CurrentCamera.CFrame.RightVector

    end

    return direction

end



runService.RenderStepped:Connect(function()

    if flying and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then

        local root = lp.Character.HumanoidRootPart

        local hum = lp.Character:FindFirstChildOfClass("Humanoid")

        

        if not bv then

            bv = Instance.new("BodyVelocity", root)

            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

            bg = Instance.new("BodyGyro", root)

            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

            bg.P = 10000

        end

        

        hum.PlatformStand = true

        bg.CFrame = workspace.CurrentCamera.CFrame

        

        local dir = getDirection()

        if dir.Magnitude > 0 then

            bv.Velocity = dir.Unit * flySpeed

        else

            bv.Velocity = Vector3.new(0, 0.1, 0)

        end

    else

        if bv then bv:Destroy() bv = nil end

        if bg then bg:Destroy() bg = nil end

        if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then

            lp.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false

        end

    end

end)



Tabs.Main:AddToggle("FlyToggle", {Title = "Активировать LOST Fly", Default = false})

Tabs.Main:AddSlider("FlySpeed", {

    Title = "Скорость",

    Default = 50,

    Min = 10,

    Max = 500,

    Rounding = 1,

    Callback = function(Value)

        flySpeed = Value

    end

})



Options.FlyToggle:OnChanged(function()

    flying = Options.FlyToggle.Value

    Fluent:Notify({

        Title = "LostHub System",

        Content = flying and "Полет активирован" or "Полет деактивирован",

        Duration = 3

    })

end)



Window:SelectTab(1)
