-- 🎃 Koumala Hub - Halloween 2.0 (Orion UI Version)
-- 👻 Full version with ESP, Tracers, WalkSpeed/JumpPower buttons, fun effects, and spooky polish
-- 💜 Made by devfixz

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/DozeIsOkLol/UILibarySource/refs/heads/main/Orion"))()

-- Startup
OrionLib:MakeNotification({
    Name = "🎃 Koumala Hub",
    Content = "Spooky season is here!",
    Image = "rbxassetid://99793125653153",
    Time = 5
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

-- Helper
local function getChar() return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() end
local function getHum() return getChar() and getChar():FindFirstChildOfClass("Humanoid") end
local function getHRP() return getChar() and getChar():FindFirstChild("HumanoidRootPart") end

-- Window
local Window = OrionLib:MakeWindow({
    Name = "🎃 Koumala Hub",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "KoumalaHubHalloween"
})

------------------------------------------------------------
-- MAIN TAB
------------------------------------------------------------
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://99793125653153",
    PremiumOnly = false
})

MainTab:AddParagraph("🎃 Welcome", "Koumala Hub: Halloween Edition\nStay spooky and have fun!")

-- ESP + TRACERS
local espEnabled = false
local tracersEnabled = false
local highlights = {}
local tracers = {}

local function addHighlight(player)
    if player == LocalPlayer then return end
    if not player.Character or highlights[player] then return end
    local h = Instance.new("Highlight")
    h.FillColor = Color3.fromRGB(140, 80, 255)
    h.OutlineColor = Color3.fromRGB(255, 255, 255)
    h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    h.Parent = player.Character
    highlights[player] = h
end

local function clearESP()
    for _, h in pairs(highlights) do
        pcall(function() h:Destroy() end)
    end
    highlights = {}
end

local function setESP(state)
    espEnabled = state
    if state then
        for _, p in ipairs(Players:GetPlayers()) do
            addHighlight(p)
        end
    else
        clearESP()
    end
end

MainTab:AddButton({
    Name = "🧿 Toggle ESP",
    Callback = function() setESP(not espEnabled) end
})

-- Tracers
local function createTracer(player)
    if tracers[player] then return end
    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Size = Vector3.new(0.05, 0.05, 1)
    part.Material = Enum.Material.Neon
    part.Color = Color3.fromRGB(40, 150, 255)
    part.Transparency = 0.4
    part.Parent = workspace
    tracers[player] = part
end

local function removeTracers()
    for _, part in pairs(tracers) do
        pcall(function() part:Destroy() end)
    end
    tracers = {}
end

local function setTracers(state)
    tracersEnabled = state
    if state then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer then createTracer(p) end
        end
    else
        removeTracers()
    end
end

RunService.Heartbeat:Connect(function()
    if tracersEnabled then
        local root = getHRP()
        if root then
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    local t = p.Character.HumanoidRootPart
                    local diff = t.Position - root.Position
                    local mid = (t.Position + root.Position) / 2
                    local part = tracers[p]
                    if not part then createTracer(p); part = tracers[p] end
                    if part then
                        part.Size = Vector3.new(0.05, 0.05, diff.Magnitude)
                        part.CFrame = CFrame.new(mid, t.Position) * CFrame.new(0, 0, -diff.Magnitude / 2)
                    end
                end
            end
        end
    end
end)

MainTab:AddButton({
    Name = "📏 Toggle Tracers",
    Callback = function() setTracers(not tracersEnabled) end
})

------------------------------------------------------------
-- UTILITY TAB
------------------------------------------------------------
local UtilityTab = Window:MakeTab({
    Name = "Utility",
    Icon = "rbxassetid://99793125653153"
})

local function applyWalk(v)
    local hum = getHum()
    if hum then hum.WalkSpeed = v end
end

local function applyJump(v)
    local hum = getHum()
    if hum then hum.JumpPower = v end
end

UtilityTab:AddButton({
    Name = "🏃 WalkSpeed +4",
    Callback = function()
        local hum = getHum()
        if hum then
            hum.WalkSpeed = (hum.WalkSpeed or 16) + 4
        end
    end
})

UtilityTab:AddButton({
    Name = "🦘 JumpPower +4",
    Callback = function()
        local hum = getHum()
        if hum then
            hum.JumpPower = (hum.JumpPower or 50) + 4
        end
    end
})

UtilityTab:AddButton({
    Name = "🔁 Reset Walk/Jump",
    Callback = function()
        applyWalk(16)
        applyJump(50)
    end
})

------------------------------------------------------------
-- FUN TAB 🎉
------------------------------------------------------------
local FunTab = Window:MakeTab({
    Name = "Fun",
    Icon = "rbxassetid://99793125653153"
})

FunTab:AddButton({
    Name = "🌈 Color Pulse (5s)",
    Callback = function()
        local ch = getChar()
        if not ch then return end
        spawn(function()
            local timer = 0
            while timer < 5 do
                local hue = (tick() % 6) / 6
                local col = Color3.fromHSV(hue, 0.9, 1)
                for _, part in pairs(ch:GetChildren()) do
                    if part:IsA("BasePart") then
                        pcall(function() part.Color = col end)
                    end
                end
                timer += 0.15
                task.wait(0.15)
            end
        end)
    end
})

FunTab:AddButton({
    Name = "🌀 Spin Player",
    Callback = function()
        local root = getHRP()
        if not root then return end
        spawn(function()
            local t = 0
            while t < 3 do
                root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(20), 0)
                task.wait(0.05)
                t += 0.05
            end
        end)
    end
})

FunTab:AddButton({
    Name = "🌫️ Fog Mode",
    Callback = function()
        Lighting.FogEnd = 50
        Lighting.FogColor = Color3.fromRGB(80, 0, 100)
    end
})

FunTab:AddButton({
    Name = "🔦 Toggle Night Vision",
    Callback = function()
        Lighting.Ambient = Lighting.Ambient == Color3.fromRGB(255, 255, 255)
            and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    end
})

------------------------------------------------------------
-- SETTINGS TAB ⚙️
------------------------------------------------------------
local SettingsTab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://99793125653153"
})

SettingsTab:AddParagraph("👻 Koumala Hub", "Made by devfixz | Halloween Edition")
SettingsTab:AddButton({
    Name = "🧹 Destroy UI",
    Callback = function()
        OrionLib:Destroy()
    end
})

OrionLib:Init()