loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmidd409/Troll-XHub/refs/heads/main/trollx"))()

local developerUsernames = {
    ["ahmidd409"] = true,
    ["SecondDev"] = true
}

local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local debris = game:GetService("Debris")

local function realisticShake(duration, intensity)
    local cam = workspace.CurrentCamera
    local start = tick()
    local conn
    conn = RunService.RenderStepped:Connect(function()
        local elapsed = tick() - start
        if elapsed > duration then
            conn:Disconnect()
            return
        end
        local x = math.sin(tick() * 50) * intensity
        local y = math.random(-1,1) * intensity
        local shakeOffset = Vector3.new(x, y, 0)
        cam.CFrame = cam.CFrame * CFrame.new(shakeOffset)
    end)
end

local function spawnExplosions(player)
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    for i = 1, 5 do
        local offset = Vector3.new(math.random(-10,10), 0, math.random(5,15))
        local pos = root.Position + offset
        local exp = Instance.new("Explosion")
        exp.Position = pos
        exp.BlastPressure = 0
        exp.BlastRadius = 5
        exp.Parent = workspace
        local part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.Size = Vector3.new(4,4,4)
        part.Position = pos + Vector3.new(0,2,0)
        part.Transparency = 1
        part.Parent = workspace
        local fire = Instance.new("Fire", part)
        fire.Size = 10
        fire.Heat = 25
        local smoke = Instance.new("Smoke", part)
        smoke.Size = 10
        smoke.Opacity = 0.4
        local boom = Instance.new("Sound", part)
        boom.SoundId = "rbxassetid://138186576"
        boom.Volume = 1
        boom:Play()
        debris:AddItem(part, 10)
    end
end

local function triggerScene(devName)
    local player = Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local originalSettings = {
        Brightness = Lighting.Brightness,
        ShadowSoftness = Lighting.ShadowSoftness,
        Ambient = Lighting.Ambient,
        TimeOfDay = Lighting.TimeOfDay
    }

    local bw = Instance.new("ColorCorrectionEffect")
    bw.Name = "DevBW"
    bw.Saturation = -1
    bw.Contrast = 1.3
    bw.Brightness = -0.2
    bw.Parent = Lighting

    local blur = Instance.new("BlurEffect")
    blur.Name = "DevBlur"
    blur.Size = 30
    blur.Parent = Lighting

    local gui = Instance.new("ScreenGui", playerGui)
    gui.Name = "DevJoinGui"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false

    local flash = Instance.new("Frame", gui)
    flash.BackgroundColor3 = Color3.new(1, 1, 1)
    flash.Size = UDim2.new(1, 0, 1, 0)
    flash.BackgroundTransparency = 1

    local background = Instance.new("Frame", gui)
    background.BackgroundColor3 = Color3.new(0, 0, 0)
    background.BackgroundTransparency = 0.3
    background.Size = UDim2.new(1, 0, 1, 0)

    local text = Instance.new("TextLabel", gui)
    text.Size = UDim2.new(0.1, 0, 0.03, 0)
    text.Position = UDim2.new(0.25, 0, 0.43, 0)
    text.BackgroundTransparency = 1
    text.Text = "المطور [" .. devName .. "] دخل السيرفر!!"
    text.TextColor3 = Color3.new(1, 0, 0)
    text.TextStrokeTransparency = 0.5
    text.TextScaled = true
    text.Font = Enum.Font.Arcade
    text.ZIndex = 5

    local glitch = Instance.new("ImageLabel", gui)
    glitch.Size = UDim2.new(1, 0, 1, 0)
    glitch.BackgroundTransparency = 1
    glitch.Image = "rbxassetid://10974496034"
    glitch.ImageTransparency = 1
    glitch.ZIndex = 4

    local sound = Instance.new("Sound", gui)
    sound.SoundId = "rbxassetid://9120580936"
    sound.Volume = 1
    sound:Play()

    flash.BackgroundTransparency = 0
    TweenService:Create(flash, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play()
    TweenService:Create(text, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
        Size = UDim2.new(0.5, 0, 0.12, 0)
    }):Play()

    spawn(function()
        local colors = {
            Color3.new(1, 0, 0),
            Color3.new(1, 1, 0),
            Color3.new(0, 1, 0),
            Color3.new(0, 1, 1),
            Color3.new(1, 0, 1),
        }
        for i = 1, 100 do
            text.TextColor3 = colors[math.random(1, #colors)]
            wait(0.05)
        end
    end)

    spawn(function()
        for i = 1, 15 do
            glitch.ImageTransparency = 0
            wait(0.04)
            glitch.ImageTransparency = 1
            wait(0.04)
        end
    end)

    realisticShake(3.5, 0.6)
    spawnExplosions(player)

    delay(10, function()
        if gui then gui:Destroy() end
    end)

    delay(10, function()
        local rain = Instance.new("ParticleEmitter")
        rain.Texture = "rbxassetid://135962566"
        rain.Size = NumberSequence.new(3, 5)
        rain.Rate = 1000
        rain.Lifetime = NumberRange.new(0.05, 0.3)
        rain.Velocity = NumberRange.new(0, 100)
        rain.Parent = workspace.Terrain

        local thunder = Instance.new("Sound", workspace)
        thunder.SoundId = "rbxassetid://170148297"
        thunder.Volume = 1
        thunder:Play()

        local lightning = Instance.new("PointLight")
        lightning.Name = "TempLightning"
        lightning.Brightness = 50
        lightning.Range = 30
        lightning.Color = Color3.fromRGB(255, 255, 255)
        lightning.Parent = workspace

        Lighting.Brightness = 5
        Lighting.ShadowSoftness = 0.05
        Lighting.Ambient = Color3.fromRGB(25, 25, 25)
        wait(0.1)
        Lighting.Brightness = 4
        Lighting.Ambient = Color3.fromRGB(10, 10, 10)
        Lighting.TimeOfDay = "14:00:00"
    end)

    delay(10, function()
        for _, part in pairs(workspace:GetChildren()) do
            if part:IsA("Part") and part.Name ~= "Baseplate" then
                local destroyEffect = Instance.new("Explosion")
                destroyEffect.Position = part.Position
                destroyEffect.BlastRadius = 100
                destroyEffect.BlastPressure = 50000
                destroyEffect.Parent = workspace
            end
        end
    end)

    delay(10, function()
        for _, part in pairs(workspace:GetChildren()) do
            if part:IsA("Part") and part.Name ~= "Baseplate" then
                part:Destroy()
            end
        end
    end)

    delay(20, function()
        local soundPsychotic = Instance.new("Sound", workspace)
        soundPsychotic.SoundId = "rbxassetid://112601724310554"
        soundPsychotic.Volume = 1.5
        soundPsychotic:Play()

        realisticShake(5, 15)

        for _, part in pairs(workspace:GetChildren()) do
            if part:IsA("Part") and part.Name ~= "Baseplate" then
                part:Destroy()
            end
        end

        for i = 1, 20 do
            Lighting.Ambient = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
            wait(0.1)
        end
    end)

    delay(20, function()
        local char = player.Character
        if char then
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                root.CFrame = root.CFrame + Vector3.new(0, -50, 0)
                wait(0.5)
                root.CFrame = CFrame.new(root.Position)
            end
        end
    end)

    delay(25, function()
        local screenEffect = Instance.new("ScreenGui", playerGui)
        screenEffect.Name = "ScreenEffect"
        screenEffect.IgnoreGuiInset = true
        local colorFlash = Instance.new("Frame", screenEffect)
        colorFlash.Size = UDim2.new(1, 0, 1, 0)
        colorFlash.BackgroundTransparency = 0
        colorFlash.BackgroundColor3 = Color3.new(1, 1, 1)
        local colors = {Color3.new(1, 0, 0), Color3.new(0, 0, 1), Color3.new(0, 1, 0), Color3.new(1, 1, 0)}
        spawn(function()
            for i = 1, 100 do
                colorFlash.BackgroundColor3 = colors[math.random(1, #colors)]
                wait(0.05)
            end
        end)
        local cuttingSound = Instance.new("Sound", screenEffect)
        cuttingSound.SoundId = "rbxassetid://5387431237"
        cuttingSound.Volume = 1.5
        cuttingSound:Play()
        wait(5)
        screenEffect:Destroy()
    end)

    delay(30, function()
        Lighting.Brightness = originalSettings.Brightness
        Lighting.ShadowSoftness = originalSettings.ShadowSoftness
        Lighting.Ambient = originalSettings.Ambient
        Lighting.TimeOfDay = originalSettings.TimeOfDay
        if Lighting:FindFirstChild("DevBW") then Lighting.DevBW:Destroy() end
        if Lighting:FindFirstChild("DevBlur") then Lighting.DevBlur:Destroy() end
        for _, obj in pairs(workspace:GetChildren()) do
            if obj:IsA("PointLight") and obj.Name == "TempLightning" then
                obj:Destroy()
            end
        end
    end)
end

local function onPlayerAdded(player)
    if developerUsernames[player.Name] then
        triggerScene(player.Name)
    end
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in pairs(Players:GetPlayers()) do
    if developerUsernames[player.Name] then
        triggerScene(player.Name)
    end
end
