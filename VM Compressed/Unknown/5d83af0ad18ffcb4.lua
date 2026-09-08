--[[
    sh1tty script - SCARY SHAWARMA KIOSK (V240)
    Library: Rayfield
    Updates: 1-Second ESP Refresh, Fixed Anomaly Logic
--]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "sh1tty_shawarma_v240",
   LoadingTitle = "SCARY SHAWARMA KIOSK",
   LoadingSubtitle = "1s Refresh + Fixed Detection",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local cfg = {
    anomaly_esp = false,
    inst_interact = false,
    inf_stamina = false,
    speed_boost = 16
}

-- --- 1. TABS ---
local MainTab = Window:CreateTab("Detection", 4483362458)
local UtilTab = Window:CreateTab("Utilities", 4483362458)

-- --- 2. THE ENGINE ---

-- STAMINA & SPEED LOOP (Fast Refresh)
task.spawn(function()
    while task.wait(0.1) do
        local char = game.Players.LocalPlayer.Character
        if char then
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum.WalkSpeed = cfg.speed_boost
                if cfg.inf_stamina then
                    local s = char:FindFirstChild("Stamina") or (char:FindFirstChild("Variables") and char.Variables:FindFirstChild("Stamina"))
                    if s and s:IsA("NumberValue") then s.Value = 100 end
                end
            end
        end
    end
end)

-- FIXED ANOMALY SCANNER (1-Second Refresh)
task.spawn(function()
    while true do
        task.wait(1) -- THE 1-SECOND UPDATE
        if cfg.anomaly_esp then
            for _, obj in pairs(workspace:GetDescendants()) do
                -- Targeting NPC Models
                if obj:IsA("Model") and obj:FindFirstChild("Humanoid") and not game.Players:GetPlayerFromCharacter(obj) then
                    
                    -- DEEP DETECTION: Checks for Anomaly tags or "Fake" identity folders
                    local isMonster = obj:FindFirstChild("Anomaly") or 
                                      obj:FindFirstChild("Monster") or 
                                      obj:FindFirstChild("Fake") or 
                                      (obj:FindFirstChild("Variables") and obj.Variables:FindFirstChild("IsAnomaly"))

                    -- Clean up old ESP to prevent stacking
                    if obj:FindFirstChild("ShawarmaHigh") then obj.ShawarmaHigh:Destroy() end
                    if obj:FindFirstChild("StatusTag") then obj.StatusTag:Destroy() end

                    -- Apply New ESP
                    local h = Instance.new("Highlight", obj)
                    h.Name = "ShawarmaHigh"
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    h.FillColor = isMonster and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(0, 255, 100)
                    h.FillTransparency = 0.4
                    
                    local bb = Instance.new("BillboardGui", obj)
                    bb.Name = "StatusTag"
                    bb.Size = UDim2.new(0, 100, 0, 40)
                    bb.AlwaysOnTop = true
                    bb.ExtentsOffset = Vector3.new(0, 3, 0)
                    local t = Instance.new("TextLabel", bb)
                    t.Size = UDim2.new(1, 0, 1, 0)
                    t.BackgroundTransparency = 1
                    t.Text = isMonster and "ANOMALY!" or "HUMAN"
                    t.TextColor3 = h.FillColor
                    t.Font = Enum.Font.Code
                    t.TextStrokeTransparency = 0
                end
            end
        else
            -- Global ESP Cleanup when toggled off
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name == "ShawarmaHigh" or v.Name == "StatusTag" then v:Destroy() end
            end
        end
    end
end)

-- Instant Interaction (Press E)
game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Enum.KeyCode.E and cfg.inst_interact then
        for _, p in pairs(workspace:GetDescendants()) do
            if p:IsA("ProximityPrompt") then
                fireproximityprompt(p)
            end
        end
    end
end)

-- --- 3. UI BUTTONS ---

MainTab:CreateToggle({
   Name = "Anomaly ESP (1s Refresh)",
   CurrentValue = false,
   Callback = function(Value)
      cfg.anomaly_esp = Value
   end,
})

UtilTab:CreateToggle({
   Name = "Infinite Stamina",
   CurrentValue = false,
   Callback = function(Value)
      cfg.inf_stamina = Value
   end,
})

UtilTab:CreateSlider({
   Name = "Speed Boost",
   Range = {16, 100},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Callback = function(Value)
      cfg.speed_boost = Value
   end,
})

UtilTab:CreateToggle({
   Name = "Instant 'E' Interact",
   CurrentValue = false,
   Callback = function(Value)
      cfg.inst_interact = Value
   end,
})

UtilTab:CreateButton({
   Name = "Panic: Close Windows",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("shutter") or v.Name:lower():find("window") then
               local p = v:FindFirstChildWhichIsA("ProximityPrompt", true)
               if p then fireproximityprompt(p) end
           end
       end
   end,
})