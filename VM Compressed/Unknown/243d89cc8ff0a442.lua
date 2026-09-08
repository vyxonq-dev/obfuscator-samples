local placeId = game.PlaceId

if placeId == 16542835017 then
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local RunService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")

getgenv().AutoSpin = false
getgenv().AutoLuck = false

local tpPosition = Vector3.new(-119, 98, -192)

local codes = {
    "6MILLION",
    "200KYES",
    "92KLIKES",
    "93KLIKES",
    "94KLIKES",
    "95KLIKES",
    "96KLIKES",
    "97KLIKES",
    "98KLIKES",
    "99KLIKES"
}

local function teleportToPosition()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(tpPosition)
    end
end

local function AutoSpin()
    while getgenv().AutoSpin do
        local args = { [1] = {} }
        ReplicatedStorage.Remotes.UGC.UseSpin:FireServer(unpack(args))
        wait(3)
    end
end

local function AutoLuck()
    while getgenv().AutoLuck do
        teleportToPosition()
        wait(2)
    end
end

local function RedeemCodes()
    for _, code in pairs(codes) do
        local args = { [1] = code }
        ReplicatedStorage.Remotes.UI.RedeemCode:InvokeServer(unpack(args))
        wait(1)
    end
end

local Window = Fluent:CreateWindow({
    Title = "Testing Files",
    SubTitle = " 📂 Test files",
    TabWidth = 150,
    Size = UDim2.fromOffset(420, 420),
    Acrylic = false,
    Theme = "Light",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "wrench" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "file-cog" })
}

local Options = Fluent.Options

Fluent:Notify({
    Title = "⚠ WARNING",
    Content = "This game has low player count, meaning you may encounter A moderator",
    Duration = 9
})

Tabs.Main:AddButton({
    Title = "Teleport to End of Obby",
    Description = "Teleport to the end of the obby",
    Callback = teleportToPosition,
    Icon = "map-pin"
})

Tabs.Main:AddButton({
    Title = "Redeem Codes",
    Description = "Redeem all codes",
    Callback = RedeemCodes,
    Icon = "gift"
})

Tabs.Main:AddToggle("AutoSpin", { Title = "Auto Spin", Default = false, Icon = "repeat" }):OnChanged(function(state)
    getgenv().AutoSpin = state
    if getgenv().AutoSpin then
        task.spawn(AutoSpin)
    end
end)

Tabs.Main:AddToggle("AutoLuck", { Title = "Auto Luck", Default = false, Icon = "gift" }):OnChanged(function(state)
    getgenv().AutoLuck = state
    if getgenv().AutoLuck then
        task.spawn(AutoLuck)
    end
end)

local buttonFrame = Instance.new("ScreenGui", playerGui)
local hideButton = Instance.new("TextButton", buttonFrame)
hideButton.Size = UDim2.new(0, 200, 0, 50)
hideButton.Position = UDim2.new(0.5, -100, 0, 50)
hideButton.Text = "Toggle UI"
hideButton.TextScaled = true
hideButton.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
hideButton.Draggable = true

local UICorner = Instance.new("UICorner", hideButton)
UICorner.CornerRadius = UDim.new(0.15, 0)

local UIStroke = Instance.new("UIStroke", hideButton)
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 0, 0)

local function ButtonTweenEffect(button)
    local originalSize = button.Size
    local tween = tweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = originalSize * 1.1 })
    local reverseTween = tweenService:Create(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Size = originalSize })
    
    tween:Play()
    tween.Completed:Wait()
    reverseTween:Play()
end

local uiVisible = true
hideButton.MouseButton1Click:Connect(function()
    uiVisible = not uiVisible
    local screenGui = game.CoreGui:FindFirstChild("ScreenGui")
    if screenGui then
        for _, child in ipairs(screenGui:GetChildren()) do
            child.Visible = uiVisible
        end
    end
    ButtonTweenEffect(hideButton)
end)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("TestingFiles")
SaveManager:SetFolder("TestingFiles/UGC")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

SaveManager:LoadAutoloadConfig()
else
    game.Players.LocalPlayer:Kick("Wrong Game")
end
