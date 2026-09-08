--[[ 
    Cut Trees Script
    UI + Splash by GZSSF
]]

-- ================================
-- SOLO FUNCIONA EN CUT TREES
-- ================================
if game.PlaceId ~= 135880624242201 then
    warn("This script only works on Cut Trees")
    return
end

-- ================================
-- SERVICES
-- ================================
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserGameSettings = UserSettings():GetService("UserGameSettings")

local LocalPlayer = Players.LocalPlayer

-- ======================================================
-- SPLASH SCREEN (GZSSF) | Loading + Skip
-- ======================================================
pcall(function()
    CoreGui:FindFirstChild("GZSSF_SPLASH"):Destroy()
end)

local splashGui = Instance.new("ScreenGui")
splashGui.Name = "GZSSF_SPLASH"
splashGui.IgnoreGuiInset = true
splashGui.ResetOnSpawn = false
splashGui.Parent = CoreGui

local bg = Instance.new("Frame", splashGui)
bg.Size = UDim2.new(1,0,1,0)
bg.BackgroundColor3 = Color3.new(0,0,0)

local title = Instance.new("TextLabel", bg)
title.Size = UDim2.new(0,400,0,70)
title.Position = UDim2.new(0.5,-200,0.45,-40)
title.BackgroundTransparency = 1
title.Text = "GZSSF"
title.Font = Enum.Font.GothamBlack
title.TextSize = 50
title.TextColor3 = Color3.fromRGB(180,180,180)

local sub = Instance.new("TextLabel", bg)
sub.Size = UDim2.new(0,400,0,30)
sub.Position = UDim2.new(0.5,-200,0.45,30)
sub.BackgroundTransparency = 1
sub.Text = "scripts"
sub.Font = Enum.Font.Gotham
sub.TextSize = 18
sub.TextColor3 = Color3.fromRGB(140,140,140)

local loading = Instance.new("TextLabel", bg)
loading.Size = UDim2.new(0,250,0,25)
loading.Position = UDim2.new(0,10,1,-35)
loading.BackgroundTransparency = 1
loading.Text = "Loading script..."
loading.Font = Enum.Font.Gotham
loading.TextSize = 14
loading.TextXAlignment = Enum.TextXAlignment.Left
loading.TextColor3 = Color3.fromRGB(120,120,120)

local skip = Instance.new("TextButton", bg)
skip.Size = UDim2.new(0,80,0,30)
skip.Position = UDim2.new(1,-90,1,-40)
skip.Text = "SKIP"
skip.Font = Enum.Font.GothamBold
skip.TextSize = 14
skip.TextColor3 = Color3.new(1,1,1)
skip.BackgroundColor3 = Color3.fromRGB(60,60,60)
skip.BorderSizePixel = 0
Instance.new("UICorner", skip)

local splashClosed = false
local function closeSplash()
    if splashClosed then return end
    splashClosed = true
    splashGui:Destroy()
end

skip.MouseButton1Click:Connect(closeSplash)

task.wait(3)

if not splashClosed then
    local info = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

    TweenService:Create(bg, info, {BackgroundTransparency = 1}):Play()
    TweenService:Create(title, info, {TextTransparency = 1}):Play()
    TweenService:Create(sub, info, {TextTransparency = 1}):Play()
    TweenService:Create(loading, info, {TextTransparency = 1}):Play()
    TweenService:Create(skip, info, {
        TextTransparency = 1,
        BackgroundTransparency = 1
    }):Play()

    task.wait(1.6)
    closeSplash()
end

-- ======================================================
-- UI LIB
-- ======================================================
local library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"
))()

local window = library:Window("🌲 Cut Trees | GZSSF")
window:Label("Dark UI • Tree Mods • NoLag", Color3.fromRGB(160,160,160))

-- ======================================================
-- TREES
-- ======================================================
local model = workspace:WaitForChild("TreesFolder")
local invisibleLoop = false
local visibleLoop = false

local function applyInvisible(inst)
    for _,v in ipairs(inst:GetChildren()) do
        if v:IsA("BasePart") then
            v.Transparency = 1
            v.CanCollide = false
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
            v.Enabled = false
        end
        applyInvisible(v)
    end
end

local function applyVisible(inst)
    for _,v in ipairs(inst:GetChildren()) do
        if v:IsA("BasePart") then
            if v.Name == "Hitpart" then
                v.Transparency = 1
                v.CanCollide = false
            else
                v.Transparency = 0
                v.CanCollide = true
            end
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 0
        elseif v:IsA("BillboardGui") or v:IsA("SurfaceGui") then
            v.Enabled = true
        end
        applyVisible(v)
    end
end

window:Button("🌑 Trees Invisible", function()
    invisibleLoop = not invisibleLoop
    visibleLoop = false
    task.spawn(function()
        while invisibleLoop do
            applyInvisible(model)
            task.wait(2)
        end
    end)
end)

window:Button("🌕 Trees Visible", function()
    visibleLoop = not visibleLoop
    invisibleLoop = false
    task.spawn(function()
        while visibleLoop do
            applyVisible(model)
            task.wait(2)
        end
    end)
end)

-- ======================================================
-- PLAYER
-- ======================================================
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

window:Button("🪓 MASSIVE Tool", function()
    local tool = char:FindFirstChildWhichIsA("Tool")
    if not tool then return end
    local handle = tool:FindFirstChild("Handle")
    if handle then
        handle.Size = Vector3.new(1000,1000,1000)
    end
end)

window:Button("⚡ Speed +75", function()
    if char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 75
    end
end)

-- ======================================================
-- NO LAG / FPS BOOST
-- ======================================================
local noLag = false
local saved = {}

local function setNoLag(state)
    if state then
        saved.GlobalShadows = Lighting.GlobalShadows
        saved.Quality = UserGameSettings.SavedQualityLevel

        Lighting.GlobalShadows = false
        UserGameSettings.SavedQualityLevel = Enum.SavedQualitySetting.QualityLevel1

        for _,v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CastShadow = false
            elseif v:IsA("ParticleEmitter")
            or v:IsA("Trail")
            or v:IsA("Fire")
            or v:IsA("Smoke") then
                v.Enabled = false
            elseif v:IsA("PointLight")
            or v:IsA("SpotLight")
            or v:IsA("SurfaceLight") then
                v.Enabled = false
            end
        end
    else
        Lighting.GlobalShadows = saved.GlobalShadows or true
        UserGameSettings.SavedQualityLevel =
            saved.Quality or Enum.SavedQualitySetting.Automatic
    end
end

window:Button("⚙️ NoLag (FPS Boost)", function()
    noLag = not noLag
    setNoLag(noLag)
end)

window:Button("❌ Close", function()
    window:Destroy()
end)
