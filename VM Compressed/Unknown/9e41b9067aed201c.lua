local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
local Debris = game:GetService("Debris")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

LocalPlayer.CharacterAdded:Connect(function(char)
    Humanoid = char:WaitForChild("Humanoid")
end)

local vignetteImage = nil 

local function CreatePermanentVignette()
    for _, g in pairs(PlayerGui:GetChildren()) do
        if g.Name == "HollowVignettePermanent" then g:Destroy() end
    end

    local gui = Instance.new("ScreenGui")
    gui.Name = "HollowVignettePermanent"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = PlayerGui
    
    local img = Instance.new("ImageLabel")
    img.Size = UDim2.new(1, 0, 1, 0)
    img.BackgroundTransparency = 1
    img.Image = "rbxassetid://4576475446"
    img.ImageTransparency = 0.5 
    img.ZIndex = 0
    img.Parent = gui
    
    vignetteImage = img
end

CreatePermanentVignette()

local function SetupSprintSystem()
    local RUN_SPEED = 20
    local WALK_SPEED = 14
    local MAX_STAMINA = 100
    local STAMINA_DRAIN = 35 
    local STAMINA_REGEN = 15
    local EXHAUST_TIME = 3

    local currentStamina = MAX_STAMINA
    local isSprintActive = false
    local isExhausted = false

    local sprintGui = Instance.new("ScreenGui")
    sprintGui.Name = "SprintSystem"
    sprintGui.ResetOnSpawn = false
    sprintGui.Parent = PlayerGui

    local barBg = Instance.new("Frame", sprintGui)
    barBg.Name = "StaminaBackground"
    barBg.Size = UDim2.new(0, 200, 0, 10)
    barBg.Position = UDim2.new(0.5, -100, 0.92, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    barBg.BorderSizePixel = 0
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

    local barFill = Instance.new("Frame", barBg)
    barFill.Name = "StaminaFill"
    barFill.Size = UDim2.new(1, 0, 1, 0)
    barFill.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    barFill.BorderSizePixel = 0
    Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)

    local mobileBtn = Instance.new("ImageButton", sprintGui)
    mobileBtn.Name = "SprintButton"
    mobileBtn.Size = UDim2.new(0, 60, 0, 60)
    mobileBtn.Position = UDim2.new(0.85, 0, 0.5, -30) 
    mobileBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mobileBtn.AutoButtonColor = true
    Instance.new("UICorner", mobileBtn).CornerRadius = UDim.new(1, 0)

    local btnIcon = Instance.new("ImageLabel", mobileBtn)
    btnIcon.Size = UDim2.new(0.6, 0, 0.6, 0)
    btnIcon.Position = UDim2.new(0.2, 0, 0.1, 0)
    btnIcon.BackgroundTransparency = 1
    btnIcon.Image = "rbxassetid://131388741773955"
    btnIcon.ImageColor3 = Color3.new(1,1,1)
    
    local shiftText = Instance.new("TextLabel", mobileBtn)
    shiftText.Size = UDim2.new(1, 0, 0.3, 0)
    shiftText.Position = UDim2.new(0, 0, 0.65, 0)
    shiftText.BackgroundTransparency = 1
    shiftText.Text = "Shift"
    shiftText.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    shiftText.TextSize = 10
    shiftText.Font = Enum.Font.GothamBold

    local function UpdateBar()
        local percent = math.clamp(currentStamina / MAX_STAMINA, 0, 1)
        TweenService:Create(barFill, TweenInfo.new(0.1), {Size = UDim2.new(percent, 0, 1, 0)}):Play()
        
        if isExhausted then
            barFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
        elseif isSprintActive then
            barFill.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        else
            barFill.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        end
        
        if isSprintActive then
            mobileBtn.ImageTransparency = 0
            mobileBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        else
            mobileBtn.ImageTransparency = 0.2
            mobileBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
    end

    local function UpdateVignette()
        if vignetteImage then
            local alpha = currentStamina / MAX_STAMINA
            local targetTransparency = math.clamp(alpha * 0.6, 0.0, 0.6)
            TweenService:Create(vignetteImage, TweenInfo.new(0.1), {ImageTransparency = targetTransparency}):Play()
        end
    end

    local function ToggleSprint()
        if isExhausted then return end 
        isSprintActive = not isSprintActive
    end

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == Enum.KeyCode.LeftShift then
            ToggleSprint()
        end
    end)

    mobileBtn.MouseButton1Click:Connect(ToggleSprint)

    RunService.RenderStepped:Connect(function(dt)
        if not Humanoid then return end
        
        local isMoving = Humanoid.MoveDirection.Magnitude > 0
        
        if isSprintActive and isMoving and not isExhausted then
            currentStamina = currentStamina - (STAMINA_DRAIN * dt)
            Humanoid.WalkSpeed = RUN_SPEED
            
            if currentStamina <= 0 then
                currentStamina = 0
                isSprintActive = false
                isExhausted = true
                Humanoid.WalkSpeed = WALK_SPEED
                task.delay(EXHAUST_TIME, function() isExhausted = false end)
            end
        else
            Humanoid.WalkSpeed = WALK_SPEED
            if currentStamina < MAX_STAMINA then
                currentStamina = currentStamina + (STAMINA_REGEN * dt)
                if currentStamina > MAX_STAMINA then currentStamina = MAX_STAMINA end
            end
        end
        UpdateBar()
        UpdateVignette()
    end)

    if Humanoid then
        Humanoid.Died:Connect(function()
            local info = TweenInfo.new(1)
            TweenService:Create(barBg, info, {BackgroundTransparency = 1}):Play()
            TweenService:Create(barFill, info, {BackgroundTransparency = 1}):Play()
            TweenService:Create(mobileBtn, info, {BackgroundTransparency = 1, ImageTransparency = 1}):Play()
            TweenService:Create(btnIcon, info, {ImageTransparency = 1}):Play()
            TweenService:Create(shiftText, info, {TextTransparency = 1}):Play()
            task.delay(1, function() sprintGui:Destroy() end)
        end)
    end
end

SetupSprintSystem()

local currentAtmosphere = nil

local function SetAtmosphere(color, saturation)
    if currentAtmosphere then currentAtmosphere:Destroy() end
    currentAtmosphere = Instance.new("ColorCorrectionEffect")
    currentAtmosphere.Name = "HollowAtmosphere"
    currentAtmosphere.TintColor = color
    currentAtmosphere.Saturation = saturation or 0.5
    currentAtmosphere.Contrast = 0.3
    currentAtmosphere.Parent = Lighting
end

local function ClearAtmosphere()
    if currentAtmosphere then
        TweenService:Create(currentAtmosphere, TweenInfo.new(1), {TintColor = Color3.new(1,1,1), Saturation = 0, Contrast = 0}):Play()
        task.wait(1)
        if currentAtmosphere then currentAtmosphere:Destroy() end
        currentAtmosphere = nil
    end
end

local function SpawnDepth()
    local entity = spawner.Create({
        Entity = {
            Name = "Depth",
            Asset = "https://github.com/RegularVynixu/Utilities/raw/main/Doors/Entity%20Spawner/Assets/Entities/Rush.rbxm",
            HeightOffset = 0
        },
        Lights = { Flicker = { Enabled = true, Duration = 3 }, Shatter = true, Repair = false },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 100, Values = {20, 20, 0.1, 1} },
        Movement = { Speed = 300, Delay = 2, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 4, Max = 4, Delay = 1.0 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Guiding",
            Hints = {
                "You died to Depth.",
                "If the room turns blue, hide in a closet.",
                "It rebounds, use a strategy like for Ambush."
            }, 
            Cause = "Depth"
        }
    })

    entity:SetCallback("OnSpawned", function()
        SetAtmosphere(Color3.fromRGB(100, 150, 255), 0.5)
        local model = game.Workspace:FindFirstChild("Depth")
        if model then
            for _, v in pairs(model:GetDescendants()) do
                if v:IsA("Sound") then
                    v.SoundId = "rbxassetid://111930358743197"; v.Volume = 2; v.PlaybackSpeed = 1
                elseif v:IsA("BasePart") then
                    v.Color = Color3.fromRGB(0, 0, 80); v.Material = Enum.Material.Neon
                    local light = Instance.new("PointLight", v); light.Color = Color3.fromRGB(0, 255, 255); light.Range = 60; light.Brightness = 6; light.Shadows = true
                elseif v:IsA("Decal") then
                    v.Texture = "rbxassetid://11118765532"
                end
            end
        end
    end)
    entity:SetCallback("OnDespawned", ClearAtmosphere)
    entity:Run()
end

local function SpawnRipperPrime()
    SetAtmosphere(Color3.fromRGB(255, 50, 50), 0.5)
    local warnSound = Instance.new("Sound")
    warnSound.SoundId = "rbxassetid://101665501585468"; warnSound.Volume = 2; warnSound.Parent = workspace; warnSound:Play()
    Debris:AddItem(warnSound, 10)
    task.wait(5) 

    local entity = spawner.Create({
        Entity = {
            Name = "Ripper Prime",
            Asset = "https://github.com/RegularVynixu/Utilities/raw/main/Doors/Entity%20Spawner/Assets/Entities/Rush.rbxm",
            HeightOffset = 0
        },
        Lights = { Flicker = { Enabled = false, Duration = 1 }, Shatter = true, Repair = false },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 150, Values = {30, 30, 0.1, 1} },
        Movement = { Speed = 300, Delay = 0.1, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 5, Max = 6, Delay = 0.5 },
        Damage = { Enabled = true, Range = 50, Amount = 1000 },
        Crucifixion = { Enabled = true, Range = 50, Resist = true, Break = true },
        Death = {
            Type = "Guiding",
            Hints = {
                "You died to Ripper Prime.",
                "It is like Ambush but OVER FAST.",
                "It rebounds more than 5 times.",
                "Act as if Ambush spawned."
            }, 
            Cause = "Ripper Prime"
        }
    })

    entity:SetCallback("OnSpawned", function()
        local model = game.Workspace:FindFirstChild("Ripper Prime")
        if model then
            for _, v in pairs(model:GetDescendants()) do
                if v:IsA("Sound") then
                    v.SoundId = "rbxassetid://4860560167"; v.Volume = 1.2; v.PlaybackSpeed = 1.2
                elseif v:IsA("BasePart") then
                    v.Color = Color3.fromRGB(139, 0, 0); v.Material = Enum.Material.Neon
                    local light = Instance.new("PointLight", v); light.Color = Color3.fromRGB(255, 0, 0); light.Range = 80; light.Brightness = 8; light.Shadows = true
                elseif v:IsA("Decal") then
                    v.Texture = "rbxassetid://12737595583"
                end
            end
        end
    end)
    entity:SetCallback("OnDespawned", ClearAtmosphere)
    entity:Run()
end

local function SpawnRusher()
    local entity = spawner.Create({
        Entity = {
            Name = "Rusher",
            Asset = "https://github.com/RegularVynixu/Utilities/raw/main/Doors/Entity%20Spawner/Assets/Entities/Rush.rbxm",
            HeightOffset = 0
        },
        Lights = { Flicker = { Enabled = true, Duration = 2 }, Shatter = true, Repair = false },
        Earthquake = { Enabled = true },
        CameraShake = { Enabled = true, Range = 100, Values = {5, 10, 0.1, 1} },
        Movement = { Speed = 150, Delay = 2, Reversed = false },
        Rebounding = { Enabled = true, Type = "Ambush", Min = 1, Max = 1, Delay = 1.5 },
        Damage = { Enabled = true, Range = 40, Amount = 125 },
        Crucifixion = { Enabled = true, Range = 40, Resist = false, Break = true },
        Death = {
            Type = "Guiding",
            Hints = {
                "You died to Rusher.",
                "It is like Rush, but it rebounds 1 time."
            },
            Cause = "Rusher"
        }
    })

    entity:SetCallback("OnSpawned", function()
        local model = game.Workspace:FindFirstChild("Rusher")
        if model then
            for _, v in pairs(model:GetDescendants()) do
                if v:IsA("Sound") then
                    v.SoundId = "rbxassetid://18695345785"; v.Volume = 2; v.PlaybackSpeed = 0.6
                elseif v:IsA("Decal") then
                    v.Texture = "rbxassetid://12576439358"
                end
            end
        end
    end)
    entity:Run()
end

StarterGui:SetCore("SendNotification", {
    Title = "Hollow Mode Activated";
    Text = "Good luck.";
    Duration = 5;
})

task.delay(1, function()
    StarterGui:SetCore("SendNotification", {
        Title = "Credits";
        Text = "Thanks to Custom Entity Spawner V2 For Entities AI";
        Duration = 6;
    })
end)

task.spawn(function()
    while true do
        local waitTime = math.random(20, 45)
        task.wait(waitTime)
        
        local chance = math.random(1, 3)
        if chance == 1 then SpawnDepth()
        elseif chance == 2 then SpawnRipperPrime()
        elseif chance == 3 then SpawnRusher()
        end
        task.wait(10)
    end
end)
