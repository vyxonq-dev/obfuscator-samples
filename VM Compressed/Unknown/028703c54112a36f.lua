--[[
    sh1tty script - IMPACT FLING (V247)
    Library: Fluent
    New Features: Click-to-Target Tool, Absolute Anti-Fling
--]]

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "sh1tty_fling_v247",
    SubTitle = "Click Target & Anti-Fling",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 520),
    Acrylic = true,
    Theme = "Dark"
})

local cfg = {
    fling_enabled = false,
    target_name = "",
    power = 50000,
    auto_return = true,
    old_pos = nil,
    spectate = false,
    anti_fling = false,
    click_to_target = false
}

-- --- 1. THE ENGINE ---

local function GetTarget(name)
    if name == "" then return nil end
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.Name:lower():sub(1, #name) == name:lower() or p.DisplayName:lower():sub(1, #name) == name:lower() then
            return p
        end
    end
    return nil
end

-- ANTI-FLING & FLING LOOP
task.spawn(function()
    while task.wait() do
        local lp = game.Players.LocalPlayer
        if not lp.Character then continue end
        local lRoot = lp.Character:FindFirstChild("HumanoidRootPart")
        if not lRoot then continue end

        -- 1. Anti-Fling Logic (Velocity Anchor)
        if cfg.anti_fling and not cfg.fling_enabled then
            if lRoot.Velocity.Magnitude > 50 or lRoot.RotVelocity.Magnitude > 50 then
                lRoot.Velocity = Vector3.new(0, 0, 0)
                lRoot.RotVelocity = Vector3.new(0, 0, 0)
            end
        end

        -- 2. Impact Fling Logic
        if cfg.fling_enabled then
            local target = GetTarget(cfg.target_name)
            if target and target.Character then
                local tRoot = target.Character:FindFirstChild("HumanoidRootPart")
                if tRoot then
                    if not cfg.old_pos then cfg.old_pos = lRoot.CFrame end
                    lRoot.Velocity = Vector3.new(cfg.power, cfg.power, cfg.power)
                    lRoot.RotVelocity = Vector3.new(cfg.power, cfg.power, cfg.power)
                    lRoot.CFrame = tRoot.CFrame * CFrame.new(math.random(-1,1)/10, 0, math.random(-1,1)/10)
                end
            end
        elseif cfg.auto_return and cfg.old_pos then
            lRoot.CFrame = cfg.old_pos
            lRoot.Velocity = Vector3.zero
            lRoot.RotVelocity = Vector3.zero
            cfg.old_pos = nil
        end
    end
end)

-- CLICK TO TARGET LOGIC
local Mouse = game.Players.LocalPlayer:GetMouse()
Mouse.Button1Down:Connect(function()
    if cfg.click_to_target then
        local target = Mouse.Target
        if target and target.Parent then
            local char = target.Parent:IsA("Model") and target.Parent or target.Parent.Parent
            local plr = game.Players:GetPlayerFromCharacter(char)
            if plr then
                cfg.target_name = plr.Name
                Fluent:Notify({
                    Title = "Target Locked",
                    Content = "New Target: " .. plr.DisplayName,
                    Duration = 2
                })
            end
        end
    end
end)

-- --- 2. UI TABS ---

local Tabs = {
    Main = Window:AddTab({ Title = "Combat", Icon = "swords" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- CLICK TARGET TOGGLE
local ClickToggle = Tabs.Main:AddToggle("ClickTarget", {Title = "Click Player to Target", Default = false})
ClickToggle:OnChanged(function()
    cfg.click_to_target = ClickToggle.Value
end)

Tabs.Main:AddInput("Input", {
    Title = "Manual Target Name",
    Default = "",
    Placeholder = "Or type name here...",
    Callback = function(Value) cfg.target_name = Value end
})

local FlingToggle = Tabs.Main:AddToggle("FlingToggle", {Title = "Enable Impact Fling", Default = false})
FlingToggle:OnChanged(function()
    cfg.fling_enabled = FlingToggle.Value
end)

local AntiFlingToggle = Tabs.Main:AddToggle("AntiFling", {Title = "Enable Anti-Fling", Default = false})
AntiFlingToggle:OnChanged(function()
    cfg.anti_fling = AntiFlingToggle.Value
end)

local SpecToggle = Tabs.Main:AddToggle("SpecToggle", {Title = "Spectate Target", Default = false})
SpecToggle:OnChanged(function()
    cfg.spectate = SpecToggle.Value
end)

Tabs.Settings:AddSlider("Power", {
    Title = "Impact Power",
    Default = 50000,
    Min = 10000,
    Max = 200000,
    Rounding = 0,
    Callback = function(Value) cfg.power = Value end
})

Window:SelectTab(1)