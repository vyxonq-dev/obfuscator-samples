local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- [[ ПЕРЕМЕННЫЕ ]] --
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Глобальная переменная для управления ESP (из твоего кода)
_G.ESPEnabled = false

-- [[ АНИМАЦИЯ ПОЯВЛЕНИЯ ]] --
local function PlayIntro()
    local ts = game:GetService("TweenService")
    local screenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local text = Instance.new("TextLabel", screenGui)
    
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "LostHub"
    text.TextColor3 = Color3.fromRGB(255, 255, 255)
    text.Font = Enum.Font.GothamBold
    text.TextSize = 1
    text.TextTransparency = 1
    text.ZIndex = 10

    text.TextTransparency = 0
    ts:Create(text, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextSize = 80}):Play()
    task.wait(1.5)
    ts:Create(text, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {TextTransparency = 1, TextSize = 120}):Play()
    task.wait(1)
    screenGui:Destroy()
end

PlayIntro()

-- [[ ОКНО FLUENT ]] --
local Window = Fluent:CreateWindow({
    Title = "LOST",
    SubTitle = "Hub Edition",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Visuals", Icon = "eye" })
}

local Options = Fluent.Options

-- Кнопка ESP
local EspToggle = Tabs.Main:AddToggle("ESPToggle", {Title = "Highlight ESP (Обводка)", Default = false})

EspToggle:OnChanged(function()
    _G.ESPEnabled = Options.ESPToggle.Value
    Fluent:Notify({
        Title = "LostHub",
        Content = _G.ESPEnabled and "ESP Активирован" or "ESP Деактивирован",
        Duration = 2
    })
end)

-- [[ ТВОЯ ЛОГИКА ESP (ИЗ ТВОЕГО КОДА) ]] --
RunService.Heartbeat:Connect(function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            -- Удаление красных кубов и прочего мусора (как в твоем коде)
            for _, obj in pairs(p.Character:GetChildren()) do
                if obj.Name == "Box" or obj.Name == "LOST_ESP" or obj:IsA("BoxHandleAdornment") or obj.Name == "LostHighlight" or obj.Name == "LostCham" then
                    obj:Destroy()
                end
            end
            
            local hl = p.Character:FindFirstChild("LOST_HL")
            if _G.ESPEnabled then
                if not hl then
                    hl = Instance.new("Highlight", p.Character)
                    hl.Name = "LOST_HL"
                    hl.FillColor = Color3.fromRGB(255, 0, 0)
                    hl.OutlineColor = Color3.new(1, 1, 1)
                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
            elseif hl then 
                hl:Destroy() 
            end
        end
    end
end)

-- Футер
local Footer = Instance.new("TextLabel", Window.Root)
Footer.Position = UDim2.new(0, 20, 1, -30)
Footer.Size = UDim2.new(0, 200, 0, 20)
Footer.BackgroundTransparency = 1
Footer.Text = "TG : @LostHubScript"
Footer.TextColor3 = Color3.fromRGB(255, 255, 255)
Footer.TextTransparency = 0.5
Footer.Font = Enum.Font.Gotham
Footer.TextSize = 14

Window:SelectTab(1)
