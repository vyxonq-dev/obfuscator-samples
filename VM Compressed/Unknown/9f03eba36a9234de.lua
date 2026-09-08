local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

-- ========================================================================
-- MODERN PREMIUM LOADER UI (I'mBack !)
-- ========================================================================
if player.PlayerGui:FindFirstChild("ImBack_Loader") then 
    player.PlayerGui.ImBack_Loader:Destroy() 
end

local sg = Instance.new("ScreenGui", player.PlayerGui)
sg.Name = "ImBack_Loader"
sg.ResetOnSpawn = false

-- Fenêtre Principale (Style Glassmorphism moderne)
local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 340, 0, 150)
main.Position = UDim2.new(0.5, -170, 0.5, -75)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
main.BackgroundTransparency = 1 -- Pour l'animation d'intro
main.BorderSizePixel = 0
main.ClipsDescendants = true

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 16)

-- Bordure fine et élégante
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(130, 50, 200) -- Teinte Améthyste / Cyan
stroke.Thickness = 1.2
stroke.Transparency = 1

-- Titre Principal : I'mBack !
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0, 45)
title.Position = UDim2.new(0, 0, 0, 15)
title.Text = "I'mBack !"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 26
title.BackgroundTransparency = 1
title.TextTransparency = 1

-- Sous-titre de statut dynamique
local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1, 0, 0, 20)
status.Position = UDim2.new(0, 0, 0, 60)
status.Text = "Initializing framework..."
status.TextColor3 = Color3.fromRGB(160, 165, 180)
status.Font = Enum.Font.Code
status.TextSize = 11
status.BackgroundTransparency = 1
status.TextTransparency = 1

-- Conteneur de la barre de progression (Arrière-plan sombre englobant)
local barBg = Instance.new("Frame", main)
barBg.Size = UDim2.new(0, 260, 0, 4)
barBg.Position = UDim2.new(0.5, -130, 0.5, 25)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
barBg.BorderSizePixel = 0
barBg.BackgroundTransparency = 1
Instance.new("UICorner", barBg)

-- Remplissage de la barre (Cyan Électrique / Dégradé visuel)
local barFill = Instance.new("Frame", barBg)
barFill.Size = UDim2.new(0, 0, 1, 0)
barFill.BackgroundColor3 = Color3.fromRGB(0, 220, 255)
barFill.BorderSizePixel = 0
Instance.new("UICorner", barFill)

-- Préparation de l'animation d'entrée (Commence petit pour l'effet de pop)
main.Size = UDim2.new(0, 200, 0, 90)
main.Position = UDim2.new(0.5, -100, 0.5, -45)

-- Déclenchement de l'animation d'apparition fluide (Pop Elastic + Fade-in)
TweenService:Create(main, TweenInfo.new(0.6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, 340, 0, 150),
    Position = UDim2.new(0.5, -170, 0.5, -75)
}):Play()

task.spawn(function()
    for i = 1, 0.15, -0.05 do
        main.BackgroundTransparency = i
        stroke.Transparency = i
        title.TextTransparency = i
        status.TextTransparency = i
        barBg.BackgroundTransparency = i
        task.wait(0.01)
    end
    main.BackgroundTransparency = 0.15 -- Effet de transparence sombre
    stroke.Transparency = 0
    title.TextTransparency = 0
    status.TextTransparency = 0
    barBg.BackgroundTransparency = 0
end)

-- Animation de pulsation douce sur le texte du titre (Effet de lueur textuelle)
task.spawn(function()
    while sg.Parent do
        TweenService:Create(title, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(0, 220, 255)}):Play()
        task.wait(0.8)
        TweenService:Create(title, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        task.wait(0.8)
    end
end)

-- Séquence d'étapes de chargement détaillées
task.spawn(function()
    task.wait(0.5) -- Laisse l'intro s'exécuter
    
    local steps = {
        {0.25, "🔒 Verifying client security..."},
        {0.55, "🔄 Fetching latest repository..."},
        {0.80, "⚡ Injecting bytecode bypasses..."},
        {1.00, "🎉 Ready! Welcome back, " .. player.Name}
    }
    
    for _, step in ipairs(steps) do
        status.Text = step[2]
        -- Transition très smooth sur la barre avec Quint
        TweenService:Create(barFill, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.new(step[1], 0, 1, 0)
        }):Play()
        task.wait(0.7)
    end
    
    task.wait(0.4)
    
    -- Animation de sortie (Disparition en fondu accéléré vers le haut)
    TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Position = UDim2.new(0.5, -170, 0.45, -75),
        Size = UDim2.new(0, 300, 0, 130)
    }):Play()
    
    for i = 0.15, 1, 0.1 do
        main.BackgroundTransparency = i
        stroke.Transparency = i
        title.TextTransparency = i
        status.TextTransparency = i
        barBg.BackgroundTransparency = i
        barFill.BackgroundTransparency = i
        task.wait(0.02)
    end
    
    sg:Destroy()
    
    -- Lancement automatique de ton script hébergé en ligne
    loadstring(game:HttpGet("TU_METTRAS_TON_LIEN_RAW_GITHUB_ICI"))()
end)
