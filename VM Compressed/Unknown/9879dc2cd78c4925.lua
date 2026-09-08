--[[
Tween GUI - The Chosen One
Tweens the player's HumanoidRootPart between three specified coordinates.
Uses Rayfield for UI and TweenService for smooth movement.
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Coordinate Tween",
    LoadingTitle = "loading...",
    LoadingSubtitle = "papi",
    ConfigurationSaving = { Enabled = false },
    Discord = { Enabled = false },
    KeySystem = false
})

local Tab = Window:CreateTab("Tween", 4483362458)

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")
local TweenService = game:GetService("TweenService")

-- Target coordinates
local points = {
    Vector3.new(-133, 52, -37),
    Vector3.new(-121, 52, -34),
    Vector3.new(-106, 50, -37)
}

-- Function to tween HRP to a position
local function tweenToPosition(position, duration)
    local tweenInfo = TweenInfo.new(duration or 1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
    local tween = TweenService:Create(hrp, tweenInfo, {CFrame = CFrame.new(position)})
    tween:Play()
    return tween
end

-- Individual buttons
Tab:CreateButton({
    Name = "Tween to Point 1 (-133,52,-37)",
    Callback = function()
        tweenToPosition(points[1], 1)
    end,
})

Tab:CreateButton({
    Name = "Tween to Point 2 (-121,52,-34)",
    Callback = function()
        tweenToPosition(points[2], 1)
    end,
})

Tab:CreateButton({
    Name = "Tween to Point 3 (-106,50,-37)",
    Callback = function()
        tweenToPosition(points[3], 1)
    end,
})

-- Cycle loop toggle
local cycling = false

Tab:CreateToggle({
    Name = "Cycle through points",
    CurrentValue = false,
    Flag = "cycleToggle",
    Callback = function(Value)
        cycling = Value
        if Value then
            spawn(function()
                local index = 1
                while cycling do
                    local tween = tweenToPosition(points[index], 1)
                    tween.Completed:Wait()
                    index = index + 1
                    if index > #points then
                        index = 1
                    end
                    task.wait(0.1) -- small pause between tweens
                end
            end)
        end
    end,
})

-- Optional: stop button
Tab:CreateButton({
    Name = "Stop Cycle",
    Callback = function()
        cycling = false
        -- also cancel any active tweens on hrp
        for _, tween in pairs(TweenService:GetTweens()) do
            if tween.Instance == hrp then
                tween:Cancel()
            end
        end
    end,
})

print("Tween GUI loaded. Buttons ready.")