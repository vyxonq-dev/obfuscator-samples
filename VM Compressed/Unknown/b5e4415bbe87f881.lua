-- [[ KG API v12.0 - OMEGA / ARCEUS NEO ]] --
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local CG = game:GetService("CoreGui")

-- 1. SISTEMA DE SEGURIDAD (Limpieza de hilos colgados)
local function SafetyClean()
    pcall(function()
        for _, v in pairs(CG:GetChildren()) do if v.Name == "KGApiOmega" then v:Destroy() end end
        for _, v in pairs(LP.PlayerGui:GetChildren()) do if v.Name == "KGApiOmega" then v:Destroy() end end
    end)
end
SafetyClean()

-- 2. ESPERA ESTRATÃGICA (Evita el bloqueo de ejecuciÃ³n de Arceus)
if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(0.5)

-- 3. INTERFAZ PREMIUM (EstÃ©tica v3.0 Mejorada)
local SG = Instance.new("ScreenGui")
SG.Name = "KGApiOmega"
SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function() SG.Parent = CG end)
if not SG.Parent then SG.Parent = LP.PlayerGui end

local Main = Instance.new("Frame", SG)
Main.Size = UDim2.new(0, 260, 0, 400)
Main.Position = UDim2.new(0.5, -130, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true -- Nativo estable
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 15)

-- Glow de Borde (Solo visual, no pesado)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Color3.fromRGB(60, 0, 120)
Stroke.Thickness = 2

-- TopBar Premium
local Top = Instance.new("Frame", Main)
Top.Size = UDim2.new(1, 0, 0, 45)
Top.BackgroundColor3 = Color3.fromRGB(35, 0, 70)
Instance.new("UICorner", Top)

local Title = Instance.new("TextLabel", Top)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Text = "RARE KG API â¢ OMEGA"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.BackgroundTransparency = 1

-- Contenedor Scroll
local S = Instance.new("ScrollingFrame", Main)
S.Size = UDim2.new(1, -15, 1, -60)
S.Position = UDim2.new(0, 7, 0, 50)
S.BackgroundTransparency = 1
S.CanvasSize = UDim2.new(0, 0, 6, 0)
S.ScrollBarThickness = 0
local Layout = Instance.new("UIListLayout", S)
Layout.Padding = UDim.new(0, 10)

-- --- [ GENERADOR DE FUNCIONES PREMIUM ] --- --
local function AddAction(name, color, func)
    local b = Instance.new("TextButton", S)
    b.Size = UDim2.new(1, 0, 0, 48)
    b.BackgroundColor3 = color
    b.Text = name
    b.Font = Enum.Font.GothamBold
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 12
    b.AutoButtonColor = false
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        -- AnimaciÃ³n de Click Premium
        local s = Instance.new("Sound", game.Workspace)
        s.SoundId = "rbxassetid://6895079853"
        s:Play() game.Debris:AddItem(s, 1)
        
        TS:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.new(1, 1, 1), TextColor3 = Color3.new(0,0,0)}):Play()
        task.wait(0.2)
        TS:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = color, TextColor3 = Color3.new(1,1,1)}):Play()
        
        local success, err = pcall(func)
        if not success then warn("Error en funciÃ³n: "..tostring(err)) end
    end)
end

-- --- [ SECCIÃN 1: SKIN & OWNER (POWER) ] --- --

local Box = Instance.new("TextBox", S)
Box.Size = UDim2.new(1, 0, 0, 38)
Box.PlaceholderText = "USUARIO A CLONAR..."
Box.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Box.TextColor3 = Color3.new(1, 1, 1)
Box.Font = Enum.Font.Gotham
Instance.new("UICorner", Box)

AddAction("EXECUTE MORPH SKIN (FE)", Color3.fromRGB(0, 100, 200), function()
    local target = Players:FindFirstChild(Box.Text)
    if target then
        LP.CharacterAppearanceId = target.UserId
        if LP.Character then LP.Character:BreakJoints() end
    end
end)

AddAction("FORCE OWNER BYPASS", Color3.fromRGB(160, 0, 0), function()
    -- InyecciÃ³n profunda en el entorno de Arceus
    _G.Admin = true
    _G.Owner = true
    pcall(function()
        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__index
        mt.__index = newcclosure(function(t, k)
            if k == "CreatorId" then return LP.UserId end
            return old(t, k)
        end)
    end)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = "[KG API]: OWNER STATUS GRANTED", Color = Color3.new(1,0,0)})
end)

-- --- [ SECCIÃN 2: HUBS EXTERNOS (NUEVOS) ] --- --

AddAction("LOAD EMOTES HUB", Color3.fromRGB(100, 0, 200), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
end)

AddAction("LOAD LOW HUB", Color3.fromRGB(0, 150, 80), function()
    loadstring(game:HttpGet("http://lowhub.online/script"))()
end)

AddAction("LOAD NAMELESS ADMIN", Color3.fromRGB(255, 80, 0), function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'))()
end)

-- --- [ SECCIÃN 3: UTILS MEJORADOS ] --- --

AddAction("KG DATA BREACH (GET TOOLS)", Color3.fromRGB(60, 60, 70), function()
    for _, v in pairs(game:GetDescendants()) do 
        if v:IsA("Tool") or v:IsA("HopperBin") then v:Clone().Parent = LP.Backpack end 
    end
end)

AddAction("SERVER HOP (EMPTY)", Color3.fromRGB(40, 40, 40), function()
    local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
    local s = game:GetService("HttpService"):JSONDecode(game:HttpGet(url))
    for _, v in pairs(s.data) do if v.playing <= 1 then game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id) end end
end)

AddAction("REJOIN SERVER", Color3.fromRGB(30, 30, 30), function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game.JobId)
end)

-- --- [ BOTÃN MINIMIZAR / CERRAR ] --- --
local Mini = Instance.new("TextButton", Top)
Mini.Size = UDim2.new(0, 30, 0, 30)
Mini.Position = UDim2.new(1, -38, 0, 7)
Mini.Text = "X"
Mini.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Mini.TextColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", Mini)

local isOpen = true
Mini.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    TS:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Size = isOpen and UDim2.new(0, 260, 0, 400) or UDim2.new(0, 260, 0, 45)
    }):Play()
end)
