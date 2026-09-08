-- Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Auto Answer Bot",
   LoadingTitle = "Auto Typing",
   LoadingSubtitle = "by Rayfield",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Main", 4483362458)
local Section = Tab:CreateSection("Settings")

-- Global variables
getgenv().AutoAnswerEnabled = false
getgenv().LastSecondMode = false
getgenv().LastSecondTrigger = 3
getgenv().TypingSpeed = 0.1
getgenv().ErrorSpeed = 0.15
getgenv().MaxGuessNumber = 200 -- maximum number of guesses

-- Normal toggle
Tab:CreateToggle({
   Name = "Enable Auto-Answer",
   CurrentValue = false,
   Callback = function(Value) getgenv().AutoAnswerEnabled = Value end,
})

-- "Last Second" mode toggle
Tab:CreateToggle({
   Name = "Enable Answer Only at the End",
   CurrentValue = false,
   Callback = function(Value) getgenv().LastSecondMode = Value end,
})

-- Slider for seconds remaining
Tab:CreateSlider({
   Name = "Answer When Remaining (s)",
   Range = {1, 10},
   Increment = 1,
   CurrentValue = 3,
   Callback = function(Value) getgenv().LastSecondTrigger = Value end,
})

-- Typing speed slider
Tab:CreateSlider({
   Name = "Typing Speed (s/char)",
   Range = {0.03, 0.3},
   Increment = 0.01,
   CurrentValue = 0.1,
   Callback = function(Value) getgenv().TypingSpeed = Value end,
})

-- Error speed slider
Tab:CreateSlider({
   Name = "Error Speed (s)",
   Range = {0.05, 0.5},
   Increment = 0.01,
   CurrentValue = 0.15,
   Callback = function(Value) getgenv().ErrorSpeed = Value end,
})

-- Maximum guesses slider
Tab:CreateSlider({
   Name = "Max Errors",
   Range = {50, 1000},
   Increment = 10,
   CurrentValue = 200,
   Callback = function(Value) getgenv().MaxGuessNumber = Value end,
})

----------------------------------------------------
-- Functions
----------------------------------------------------
local Screen = workspace.Map.Functional.Screen
local QuestionText = Screen.SurfaceGui.MainFrame.MainGameContainer.MainTxtContainer.QuestionText
local TypingText = Screen.SurfaceGui.MainFrame.MainGameContainer.MainTxtContainer.TypingText
local Fill = Screen.SurfaceGui.MainFrame.MainGameContainer.TimerbarContainer.Fill

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local CurrentSpeller = ReplicatedStorage.GameValues.CurrentSpeller
local ClickSound = ReplicatedStorage.Assets.SFX.Click
local GameEvent = ReplicatedStorage.Events.GameEvent
local Player = Players.LocalPlayer

local function SetTyping(text)
    ClickSound:Play()
    TypingText.Text = text
    GameEvent:FireServer("updateAnswer", text)
end

-- Human-like typing simulation
local function HumanType(result)
    while TypingText.Text ~= result do
        -- chance of big wrong guess
        if math.random(1, 3) == 1 then
            local wrongGuess = tostring(math.random(1, getgenv().MaxGuessNumber))
            SetTyping(wrongGuess)
            task.wait(getgenv().ErrorSpeed * math.random(1, 2))

            -- partially erase
            local cut = math.random(0, #wrongGuess)
            SetTyping(string.sub(wrongGuess, 1, cut))
            task.wait(getgenv().ErrorSpeed)
        end

        -- continue typing correctly
        local nextLen = #TypingText.Text + 1
        SetTyping(string.sub(result, 1, nextLen))
        task.wait(getgenv().TypingSpeed)

        -- human pauses
        if math.random(1, 5) == 5 then
            task.wait(getgenv().TypingSpeed * 2)
        end
    end
end

-- Disconnect old connections
if script_connections then
    for _, c in ipairs(script_connections) do
        c:Disconnect()
    end
    table.clear(script_connections)
end

local Connections = {}
getgenv().script_connections = Connections

table.insert(Connections, QuestionText:GetPropertyChangedSignal("Text"):Connect(function()
    if not getgenv().AutoAnswerEnabled and not getgenv().LastSecondMode then return end

    local question = string.split(QuestionText.Text, "=")[1]
    local result = tostring(loadstring("return " .. string.gsub(question, "x", "*"))())
    Fill:SetAttribute("Answer", result)

    if CurrentSpeller.Value ~= Player then return end

    if getgenv().AutoAnswerEnabled then
        task.wait(math.random(1, 3) / 10)
        HumanType(result)
        GameEvent:FireServer("submitAnswer", result)
    end

    if getgenv().LastSecondMode then
        while Fill.Size.X.Scale > (getgenv().LastSecondTrigger / 10) and getgenv().LastSecondMode do
            local wrongGuess = tostring(math.random(1, getgenv().MaxGuessNumber))
            SetTyping(wrongGuess)
            task.wait(getgenv().ErrorSpeed)
            SetTyping("")
            task.wait(getgenv().ErrorSpeed)
        end

        HumanType(result)
        GameEvent:FireServer("submitAnswer", result)
    end
end))