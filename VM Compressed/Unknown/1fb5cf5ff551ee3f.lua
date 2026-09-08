--[[
    sh1tty script - CHEESE ESCAPE (V251)
    Library: Rayfield
    Features: Fixed ESP, Key TPs, Rat Immunity, Auto-Cheese
--]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "sh1tty_cheese_v251",
   LoadingTitle = "CHEESE ESCAPE",
   LoadingSubtitle = "The Rayfield Edition",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local cfg = {
    walkspeed = 16,
    jumppower = 50,
    rat_esp = false,
    cheese_esp = false,
    float_pad = false,
    auto_cheese = false
}

-- --- 1. CORE ENGINE ---

local floatPart = Instance.new("Part")
floatPart.Size = Vector3.new(10, 0.5, 10)
floatPart.Transparency = 1
floatPart.Anchored = true
floatPart.Parent = workspace

task.spawn(function()
    while task.wait() do
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = cfg.walkspeed
            char.Humanoid.JumpPower = cfg.jumppower
            
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if cfg.float_pad and hrp then
                floatPart.CanCollide = true
                floatPart.CFrame = hrp.CFrame * CFrame.new(0, -3.6, 0)
            else
                floatPart.CanCollide = false
                floatPart.CFrame = CFrame.new(0, -1000, 0)
            end
        end
    end
end)

-- AUTO-SCANNER (ESP & AUTO-COLLECT)
task.spawn(function()
    while task.wait(1) do
        for _, v in pairs(workspace:GetDescendants()) do
            -- CHEESE DETECTION
            if v.Name:lower():find("cheese") and (v:IsA("Model") or v:IsA("BasePart")) then
                if cfg.cheese_esp and not v:FindFirstChild("sh1tty_esp") then
                    local h = Instance.new("Highlight", v)
                    h.Name = "sh1tty_esp"
                    h.FillColor = Color3.fromRGB(255, 220, 0)
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
                if cfg.auto_cheese then
                    local touch = v:FindFirstChildWhichIsA("TouchTransmitter", true)
                    if touch and game.Players.LocalPlayer.Character then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, touch.Parent, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, touch.Parent, 1)
                    end
                end
            end
            -- RAT DETECTION
            if (v.Name == "Rat" or v.Name:lower():find("ratnpc") or v.Name:lower():find("ratbot")) and v:IsA("Model") then
                if cfg.rat_esp and not v:FindFirstChild("sh1tty_rat") then
                    local h = Instance.new("Highlight", v)
                    h.Name = "sh1tty_rat"
                    h.FillColor = Color3.fromRGB(255, 0, 0)
                    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                end
            end
        end
    end
end)

-- --- 2. UI TABS ---
local MainTab = Window:CreateTab("Character", 4483362458)
local WorldTab = Window:CreateTab("Visuals/Auto", 4483362458)
local TPTab = Window:CreateTab("Teleports", 4483362458)

-- Character Section
MainTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) cfg.walkspeed = Value end,
})

MainTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 400},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value) cfg.jumppower = Value end,
})

MainTab:CreateToggle({
   Name = "Float Pad (Rat Immunity)",
   CurrentValue = false,
   Callback = function(Value) cfg.float_pad = Value end,
})

-- Visuals/Auto Section
WorldTab:CreateToggle({
   Name = "Cheese ESP",
   CurrentValue = false,
   Callback = function(Value) cfg.cheese_esp = Value end,
})

WorldTab:CreateToggle({
   Name = "Rat ESP",
   CurrentValue = false,
   Callback = function(Value) cfg.rat_esp = Value end,
})

WorldTab:CreateToggle({
   Name = "Instant Collect Cheese",
   CurrentValue = false,
   Callback = function(Value) cfg.auto_cheese = Value end,
})

-- Teleports Section
TPTab:CreateButton({
   Name = "Teleport to ALL Cheese",
   Callback = function()
       local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("cheese") and (v:IsA("Model") or v:IsA("BasePart")) then
               hrp.CFrame = (v:IsA("Model") and v:GetModelCFrame() or v.CFrame)
               task.wait(0.4) -- Delay for collection server-side
           end
       end
   end,
})

TPTab:CreateButton({
   Name = "Find & TP to Next Key",
   Callback = function()
       local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
       local keys = {"GreenKey", "RedKey", "BlueKey", "WhiteKey", "YellowKey", "GreyKey", "PurpleKey"}
       for _, kName in pairs(keys) do
           local key = workspace:FindFirstChild(kName, true)
           if key then
               hrp.CFrame = key.CFrame * CFrame.new(0, 2, 0)
               Rayfield:Notify({Title = "Key Found", Content = "Teleported to " .. kName, Duration = 3})
               return
           end
       end
       Rayfield:Notify({Title = "Error", Content = "No keys found in this chapter.", Duration = 3})
   end,
})

TPTab:CreateButton({
   Name = "TP to Escape Door",
   Callback = function() 
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-380, 5, 250) 
   end,
})