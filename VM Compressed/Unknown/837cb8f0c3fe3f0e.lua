-- FIXZ HUB | DRAW PERFECT CIRCLE 📍
-- Using Fluent UI Library

print("📍 Loading Fixz Hub for Draw Perfect Circle...")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local plr = Players.LocalPlayer
local practiceScore = ReplicatedStorage:WaitForChild("practiceScore")

-- Anti-AFK
plr.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- Load Fluent UI
print("Loading Fluent UI...")
local success, Fluent = pcall(function()
    return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

if not success then
    warn("Failed to load Fluent UI, trying alternate link...")
    Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Fluent.lua"))()
end

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

print("Creating window...")

-- Variables
getgenv().autoScore = false
getgenv().frequency = 10
getgenv().scoreAmount = 100
getgenv().callsSent = 0
getgenv().sendMode = true

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "📍 Fixz Hub | Draw Perfect Circle",
    SubTitle = "Auto Score Sender",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

-- Create Tabs
local Tabs = {
    Main = Window:AddTab({ Title = "🏠 Main", Icon = "home" }),
    Score = Window:AddTab({ Title = "📍 Score Sender", Icon = "circle" }),
    Settings = Window:AddTab({ Title = "⚙️ Settings", Icon = "settings" })
}

-- MAIN TAB
Tabs.Main:AddParagraph({
    Title = "📍 Welcome to Fixz Hub!",
    Content = "Draw Perfect Circle - Auto score sender with adjustable frequency!"
})

local StatsLabel = Tabs.Main:AddParagraph({
    Title = "📊 Statistics",
    Content = "Calls Sent: 0 | Frequency: 10/s | Mode: Send"
})

task.spawn(function()
    while task.wait(0.5) do
        local mode = getgenv().sendMode and "Send" or "Simulate"
        StatsLabel:SetDesc(string.format(
            "Calls Sent: %d | Frequency: %d/s | Mode: %s",
            getgenv().callsSent,
            getgenv().frequency,
            mode
        ))
    end
end)

Tabs.Main:AddButton({
    Title = "🎮 Join Discord",
    Description = "Get support and updates",
    Callback = function()
        setclipboard("https://discord.gg/CDyrbSY8Gx")
        Fluent:Notify({
            Title = "Discord Copied!",
            Content = "Discord invite copied to clipboard!",
            Duration = 3
        })
    end
})

-- SCORE TAB
Tabs.Score:AddParagraph({
    Title = "📍 Auto Score Sender",
    Content = "Automatically send practice scores with custom frequency and amount"
})

local AutoScoreToggle = Tabs.Score:AddToggle("AutoScore", {
    Title = "📍 Auto Send Score",
    Description = "Automatically send practice scores",
    Default = false
})

AutoScoreToggle:OnChanged(function(state)
    getgenv().autoScore = state
    
    if state then
        Fluent:Notify({
            Title = "Auto Score Started!",
            Content = string.format("Sending %d points at %d/s", getgenv().scoreAmount, getgenv().frequency),
            Duration = 3
        })
        
        task.spawn(function()
            while getgenv().autoScore do
                local waitTime = 1 / math.max(1, getgenv().frequency)
                
                if getgenv().sendMode then
                    local amount = math.clamp(getgenv().scoreAmount, 0, 10000)
                    pcall(function()
                        practiceScore:FireServer(amount)
                    end)
                end
                
                getgenv().callsSent = getgenv().callsSent + 1
                task.wait(waitTime)
            end
        end)
    else
        Fluent:Notify({
            Title = "Auto Score Stopped",
            Content = string.format("Total calls sent: %d", getgenv().callsSent),
            Duration = 3
        })
    end
end)

local FrequencySlider = Tabs.Score:AddSlider("Frequency", {
    Title = "⚡ Frequency (per second)",
    Description = "How many times per second to send score",
    Default = getgenv().frequency,
    Min = 1,
    Max = 40,
    Rounding = 1,
    Callback = function(value)
        getgenv().frequency = value
    end
})

local ScoreInput = Tabs.Score:AddInput("ScoreAmount", {
    Title = "📍 Score Amount",
    Description = "Amount of score to send (0-10000)",
    Default = tostring(getgenv().scoreAmount),
    Placeholder = "e.g., 100",
    Numeric = true,
    Finished = false,
    Callback = function(value)
        local amount = tonumber(value)
        if amount then
            getgenv().scoreAmount = math.clamp(amount, 0, 10000)
        end
    end
})

local SendModeToggle = Tabs.Score:AddToggle("SendMode", {
    Title = "🔄 Send Mode",
    Description = "ON = Actually send | OFF = Simulate only",
    Default = getgenv().sendMode
})

SendModeToggle:OnChanged(function(state)
    getgenv().sendMode = state
    local mode = state and "Send" or "Simulate"
    Fluent:Notify({
        Title = "Mode Changed!",
        Content = "Mode: " .. mode,
        Duration = 2
    })
end)

Tabs.Score:AddButton({
    Title = "📍 Send Score Once",
    Description = "Send the score amount one time",
    Callback = function()
        local amount = math.clamp(getgenv().scoreAmount, 0, 10000)
        pcall(function()
            practiceScore:FireServer(amount)
            getgenv().callsSent = getgenv().callsSent + 1
            Fluent:Notify({
                Title = "Score Sent!",
                Content = string.format("Sent %d points", amount),
                Duration = 2
            })
        end)
    end
})

Tabs.Score:AddButton({
    Title = "💯 Send Max Score (10000)",
    Description = "Send maximum score once",
    Callback = function()
        pcall(function()
            practiceScore:FireServer(10000)
            getgenv().callsSent = getgenv().callsSent + 1
            Fluent:Notify({
                Title = "Max Score Sent!",
                Content = "Sent 10000 points",
                Duration = 2
            })
        end)
    end
})

Tabs.Score:AddButton({
    Title = "🔄 Reset Call Counter",
    Description = "Reset the calls sent counter to 0",
    Callback = function()
        getgenv().callsSent = 0
        Fluent:Notify({
            Title = "Reset!",
            Content = "Call counter has been reset",
            Duration = 2
        })
    end
})

Tabs.Score:AddSection("Quick Presets")

Tabs.Score:AddButton({
    Title = "⚡ Fast Mode (30/s, 100 points)",
    Description = "Set to fast preset",
    Callback = function()
        getgenv().frequency = 30
        getgenv().scoreAmount = 100
        FrequencySlider:SetValue(30)
        ScoreInput:SetValue("100")
        Fluent:Notify({
            Title = "Preset Applied!",
            Content = "Fast mode: 30/s, 100 points",
            Duration = 2
        })
    end
})

Tabs.Score:AddButton({
    Title = "🐌 Safe Mode (10/s, 50 points)",
    Description = "Set to safe preset",
    Callback = function()
        getgenv().frequency = 10
        getgenv().scoreAmount = 50
        FrequencySlider:SetValue(10)
        ScoreInput:SetValue("50")
        Fluent:Notify({
            Title = "Preset Applied!",
            Content = "Safe mode: 10/s, 50 points",
            Duration = 2
        })
    end
})

Tabs.Score:AddButton({
    Title = "🚀 Extreme Mode (40/s, 1000 points)",
    Description = "Set to extreme preset (may lag)",
    Callback = function()
        getgenv().frequency = 40
        getgenv().scoreAmount = 1000
        FrequencySlider:SetValue(40)
        ScoreInput:SetValue("1000")
        Fluent:Notify({
            Title = "Preset Applied!",
            Content = "Extreme mode: 40/s, 1000 points",
            Duration = 2
        })
    end
})

-- SETTINGS TAB
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FixzHub")
SaveManager:SetFolder("FixzHub/DrawPerfectCircle")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "📍 Fixz Hub Loaded!",
    Content = "Draw Perfect Circle ready - Auto score sender enabled!",
    Duration = 5
})

SaveManager:LoadAutoloadConfig()

print("✅ Fixz Hub fully loaded!")
print("📍 Use the Score Sender tab to configure and start!")