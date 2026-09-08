-- =========================================================================
-- 🔥 THEMILERV1 x GLITCHER R6 | THE ULTIMATE 50-SCRIPT GOD SUITE 🔥
-- INDEPENDIENTE - PROGRAMADO UNO POR UNO - CON EFECTOS LOCALES
-- =========================================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "TheMilerV1 Follow me on roblox",
    LoadingTitle = "Inyectando Base de Datos de 50 Scripts...",
    LoadingSubtitle = "by TheMilerV1",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false,
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

local ActiveConnection = nil
local ActiveObjects = {}
local ActiveSounds = {}
local OriginalJoints = {}

-- Guardar articulaciones para el apagado
local function SaveJoints(torso)
    OriginalJoints = {}
    for _, joint in pairs(torso:GetChildren()) do
        if joint:IsA("Motor6D") then OriginalJoints[joint.Name] = joint.C0 end
    end
end

-- APAGAR EFECTOS (KILL SWITCH REAL)
local function StopAll()
    if ActiveConnection then ActiveConnection:Disconnect() ActiveConnection = nil end
    for _, v in pairs(ActiveObjects) do if v then v:Destroy() end end
    for _, v in pairs(ActiveSounds) do if v then v:Stop() v:Destroy() end end
    ActiveObjects = {}
    ActiveSounds = {}
    
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Torso") then
        local torso = char.Torso
        for name, originalC0 in pairs(OriginalJoints) do
            local joint = torso:FindFirstChild(name)
            if joint and joint:IsA("Motor6D") then joint.C0 = originalC0 end
        end
        if char:FindFirstChild("Animate") then char.Animate.Disabled = false end
    end
end

-- Activar efectos de pantalla y sonido de fondo local frito
local function ApplySensoryEffects(torso)
    local cc = Instance.new("ColorCorrectionEffect", Lighting)
    cc.Saturation = 3
    local bl = Instance.new("BlurEffect", Lighting)
    bl.Size = 6
    table.insert(ActiveObjects, cc)
    table.insert(ActiveObjects, bl)
    
    local snd = Instance.new("Sound", torso)
    snd.SoundId = "rbxassetid://9061517094"
    snd.Volume = 2
    snd.Looped = true
    snd:Play()
    table.insert(ActiveSounds, snd)
    
    return cc, bl
end

-- =========================================================================
-- CREACIÓN DE SECCIONES REALES (TABS)
-- =========================================================================
local TabGlitch = Window:CreateTab("🌀 Pure Glitches", nil)
local TabWalks  = Window:CreateTab("🚶 Caminatas Cursed", nil)
local TabDances = Window:CreateTab("💃 Bailes Épicos", nil)
local TabMemes  = Window:CreateTab("😂 Memes & Rig Bugs", nil)
local TabCombat = Window:CreateTab("⚔️ Combate & Extras", nil)

-- =========================================================================
-- PESTAÑA 1: PURE GLITCHES (1 al 10)
-- =========================================================================
TabGlitch:CreateSection("Motores de Destrucción de Rig R6")

TabGlitch:CreateButton({
    Name = "1. Helicóptero 900k RPM (Original)",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        local cc, bl = ApplySensoryEffects(torso)
        
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick()
            cc.TintColor = Color3.fromHSV(math.random(), 1, 1)
            torso.Neck.C0 = CFrame.new(math.sin(t*50)*10, 1.5, 0) * CFrame.Angles(math.rad(t*900000), math.rad(t*900000), 0)
            torso["Right Shoulder"].C0 = CFrame.new(1.2, 0.2, 1.5) * CFrame.Angles(math.rad(t*900000), 0, math.rad(90))
            torso["Left Shoulder"].C0 = CFrame.new(-1.2, 0.2, 1.5) * CFrame.Angles(math.rad(t*900000), 0, math.rad(-90))
            torso["Right Hip"].C0 = CFrame.new(0.6, -1, 0) * CFrame.Angles(math.rad(t*900000), math.rad(90), 0)
            torso["Left Hip"].C0 = CFrame.new(-0.6, -1, 0) * CFrame.Angles(math.rad(t*900000), math.rad(-90), 0)
        end)
    end
})

TabGlitch:CreateButton({
    Name = "2. Araña Desarticulada",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(math.rad(180), 0, math.sin(t*20))
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 1, 0) * CFrame.Angles(0, 0, math.rad(140 + math.sin(t*30)*20))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 1, 0) * CFrame.Angles(0, 0, math.rad(-140 - math.sin(t*30)*20))
            torso["Right Hip"].C0 = CFrame.new(0.5, 0.5, math.sin(t*10)) * CFrame.Angles(math.rad(45), 0, math.rad(45))
            torso["Left Hip"].C0 = CFrame.new(-0.5, 0.5, -math.sin(t*10)) * CFrame.Angles(math.rad(45), 0, math.rad(-45))
        end)
    end
})

TabGlitch:CreateButton({
    Name = "3. Decapitación Órbita de Mapa",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = CFrame.new(math.sin(tick()*25)*20, 1.5, math.cos(tick()*25)*20) * CFrame.Angles(0, tick()*10, 0)
        end)
    end
})

TabGlitch:CreateButton({
    Name = "4. Extremidades Elásticas Desfasadas",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 30
            torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"] * CFrame.new(math.sin(t)*4, 0, 0)
            torso["Left Shoulder"].C0 = OriginalJoints["Left Shoulder"] * CFrame.new(math.cos(t)*4, 0, 0)
        end)
    end
})

TabGlitch:CreateButton({
    Name = "5. Vibración de Red Matrix",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.new(math.random(-2,2), math.random(-1,1), math.random(-2,2))
        end)
    end
})

TabGlitch:CreateButton({
    Name = "6. Inversión de Torso 180°",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.rad(180), 0, 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(math.rad(180), 0, 0)
        end)
    end
})

TabGlitch:CreateButton({
    Name = "7. Cabeza Orbitando Suelo",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = CFrame.new(math.sin(tick()*10)*5, -3, math.cos(tick()*10)*5)
        end)
    end
})

TabGlitch:CreateButton({
    Name = "8. Brazos Hélice Trasera",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(0, 0.5, 1.5) * CFrame.Angles(0, tick()*100, 0)
            torso["Left Shoulder"].C0 = CFrame.new(0, 0.5, 1.5) * CFrame.Angles(0, -tick()*100, 0)
        end)
    end
})

TabGlitch:CreateButton({
    Name = "9. Piernas Rompe-Físicas Nativas",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Hip"].C0 = CFrame.new(0.5, 2, 0) * CFrame.Angles(0, 0, tick()*50)
            torso["Left Hip"].C0 = CFrame.new(-0.5, 2, 0) * CFrame.Angles(0, 0, -tick()*50)
        end)
    end
})

TabGlitch:CreateButton({
    Name = "10. Espasmo de Red Finitas",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local r = math.random(-50, 50)
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(math.rad(r), math.rad(r), math.rad(r))
        end)
    end
})

-- =========================================================================
-- PESTAÑA 2: CAMINATAS CURSED (11 al 20)
-- =========================================================================
TabWalks:CreateSection("Modificaciones de Movimiento de Rig")

TabWalks:CreateButton({
    Name = "11. Sigilo Zombie Acechador",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        if char:FindFirstChild("Animate") then char.Animate.Disabled = true end
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 10
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(math.rad(45), math.sin(t)*0.2, 0)
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, -1) * CFrame.Angles(math.rad(90), 0, 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, -1) * CFrame.Angles(math.rad(90), 0, 0)
            torso["Right Hip"].C0 = CFrame.new(0.5, -1, math.sin(t)*0.5) * CFrame.Angles(math.sin(t), 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -1, -math.sin(t)*0.5) * CFrame.Angles(-math.sin(t), 0, 0)
        end)
    end
})

TabWalks:CreateButton({
    Name = "12. Flotación Espectral Inerte",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, math.sin(tick()*8)*0.06, 0)
            torso["Right Hip"].C0 = OriginalJoints["Right Hip"] * CFrame.Angles(math.rad(-20), 0, math.rad(5))
            torso["Left Hip"].C0 = OriginalJoints["Left Hip"] * CFrame.Angles(math.rad(-20), 0, math.rad(-5))
        end)
    end
})

TabWalks:CreateButton({
    Name = "13. Corredor de Anime Tradicional",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0.5) * CFrame.Angles(math.rad(-45), 0, math.rad(15))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0.5) * CFrame.Angles(math.rad(-45), 0, math.rad(-15))
        end)
    end
})

TabWalks:CreateButton({
    Name = "14. Deslizamiento Lunar Invertido (Moonwalk)",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 12
            torso["Right Hip"].C0 = CFrame.new(0.5, -1, math.sin(t)*0.8) * CFrame.Angles(-math.sin(t), 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -1, -math.sin(t)*0.8) * CFrame.Angles(math.sin(t), 0, 0)
        end)
    end
})

TabWalks:CreateButton({
    Name = "15. Gigante Pesado Tambaleante",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 3
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, 0, math.sin(t)*0.3)
            torso["Right Hip"].C0 = CFrame.new(0.8, -1, 0) * CFrame.Angles(0, 0, math.abs(math.sin(t))*0.4)
            torso["Left Hip"].C0 = CFrame.new(-0.8, -1, 0) * CFrame.Angles(0, 0, -math.abs(math.cos(t))*0.4)
        end)
    end
})

TabWalks:CreateButton({
    Name = "16. Marcha Militar Robótica Glitch",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = math.floor(tick() * 8)
            torso["Right Hip"].C0 = CFrame.new(0.5, -1, (t % 2 == 0 and 0.5 or -0.5)) * CFrame.Angles(t % 2 == 0 and 0.5 or -0.5, 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -1, (t % 2 == 0 and -0.5 or 0.5)) * CFrame.Angles(t % 2 == 0 and -0.5 or 0.5, 0, 0)
        end)
    end
})

TabWalks:CreateButton({
    Name = "17. Borracho Errático Sin Eje",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(math.sin(t*3)*0.5, math.cos(t*2)*0.5, 0)
        end)
    end
})

TabWalks:CreateButton({
    Name = "18. Cangrejo Exótico R6",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Hip"].C0 = CFrame.new(1.5, -0.5, 0) * CFrame.Angles(0, 0, math.rad(90))
            torso["Left Hip"].C0 = CFrame.new(-1.5, -0.5, 0) * CFrame.Angles(0, 0, math.rad(-90))
        end)
    end
})

TabWalks:CreateButton({
    Name = "19. Nadador de Superficie Terrestre",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 15
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(math.sin(t), math.rad(90), 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(-math.sin(t), math.rad(-90), 0)
        end)
    end
})

TabWalks:CreateButton({
    Name = "20. Arrastre Violento de Torso",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Hip"].C0 = CFrame.new(0.5, 0.5, 1) * CFrame.Angles(math.rad(90), 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, 0.5, 1) * CFrame.Angles(math.rad(90), 0, 0)
        end)
    end
})

-- =========================================================================
-- PESTAÑA 3: BAILES ÉPICOS (21 al 30)
-- =========================================================================
TabDances:CreateSection("Bailes de Rig Matemáticos")

TabDances:CreateButton({
    Name = "21. Molino de Viento Hip-Hop",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 15
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5 + math.sin(t)*0.5, 0) * CFrame.Angles(0, 0, math.sin(t))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5 - math.sin(t)*0.5, 0) * CFrame.Angles(0, 0, -math.sin(t))
        end)
    end
})

TabDances:CreateButton({
    Name = "22. Breakdance Invertido Total",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.5, -0.5, 0) * CFrame.Angles(0, tick()*30, 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, -0.5, 0) * CFrame.Angles(0, -tick()*30, 0)
        end)
    end
})

TabDances:CreateButton({
    Name = "23. Ola de Brazos Techno Sincronizada",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 8
            torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"] * CFrame.new(0, math.sin(t)*0.5, 0) * CFrame.Angles(0, 0, math.sin(t))
            torso["Left Shoulder"].C0 = OriginalJoints["Left Shoulder"] * CFrame.new(0, math.cos(t)*0.5, 0) * CFrame.Angles(0, 0, math.cos(t))
        end)
    end
})

TabDances:CreateButton({
    Name = "24. Giro Ruso de Piernas Alternado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 12
            torso["Right Hip"].C0 = CFrame.new(0.5, -0.5, -0.5) * CFrame.Angles(math.rad(90), 0, math.sin(t))
            torso["Left Hip"].C0 = CFrame.new(-0.5, -0.5, -0.5) * CFrame.Angles(math.rad(90), 0, math.cos(t))
        end)
    end
})

TabDances:CreateButton({
    Name = "25. Shuffle Electrónico de Alta Velocidad",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 25
            torso["Right Hip"].C0 = OriginalJoints["Right Hip"] * CFrame.new(0, 0, math.sin(t)*0.4)
            torso["Left Hip"].C0 = OriginalJoints["Left Hip"] * CFrame.new(0, 0, math.cos(t)*0.4)
        end)
    end
})

TabDances:CreateButton({
    Name = "26. Rave Industrial Agresivo",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 20
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, -0.5) * CFrame.Angles(math.rad(90), math.sin(t), 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, -0.5) * CFrame.Angles(math.rad(90), -math.cos(t), 0)
        end)
    end
})

TabDances:CreateButton({
    Name = "27. Disco Fever Deformado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 5
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 1, 0) * CFrame.Angles(0, 0, math.sin(t)*1.5)
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, math.cos(t), 0)
        end)
    end
})

TabDances:CreateButton({
    Name = "28. Vals Distorsionado Asimétrico",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick()
            torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"] * CFrame.Angles(math.sin(t)*0.5, math.cos(t)*0.5, 0)
            torso["Left Shoulder"].C0 = OriginalJoints["Left Shoulder"] * CFrame.Angles(math.cos(t)*0.5, math.sin(t)*0.5, 0)
        end)
    end
})

TabDances:CreateButton({
    Name = "29. K-Pop Sync Glitch",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 15
            torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"] * CFrame.Angles(0, 0, math.sin(t)*0.8)
            torso["Left Shoulder"].C0 = OriginalJoints["Left Shoulder"] * CFrame.Angles(0, 0, -math.sin(t)*0.8)
            torso["Right Hip"].C0 = OriginalJoints["Right Hip"] * CFrame.Angles(math.sin(t)*0.4, 0, 0)
            torso["Left Hip"].C0 = OriginalJoints["Left Hip"] * CFrame.Angles(-math.sin(t)*0.4, 0, 0)
        end)
    end
})

TabDances:CreateButton({
    Name = "30. Twist de Extremidades Cruzadas",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 18
            torso["Right Shoulder"].C0 = CFrame.new(1, 0.5, -0.5) * CFrame.Angles(0, math.sin(t), 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1, 0.5, -0.5) * CFrame.Angles(0, -math.sin(t), 0)
        end)
    end
})

-- =========================================================================
-- PESTAÑA 4: MEMES & RIG BUGS (31 al 40)
-- =========================================================================
TabMemes:CreateSection("Efectos Visuales e Hitos de Memes")

TabMemes:CreateButton({
    Name = "31. El T-Pose Volador Divino",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(90))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-90))
            torso["Right Hip"].C0 = CFrame.new(0.5, -1, 0) * CFrame.Angles(0, 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -1, 0) * CFrame.Angles(0, 0, 0)
        end)
    end
})

TabMemes:CreateButton({
    Name = "32. Distracted Boyfriend (Cuello Roto)",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, math.rad(110), math.rad(30))
        end)
    end
})

TabMemes:CreateButton({
    Name = "33. Gato Car-Dance Extremo",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, 0, math.sin(tick()*20)*0.6)
        end)
    end
})

TabMemes:CreateButton({
    Name = "34. Pollo Errático Desincronizado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 15
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.new(0, 0, math.sin(t)*0.4)
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(0, 0, math.sin(t)*0.5)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(0, 0, -math.sin(t)*0.5)
        end)
    end
})

TabMemes:CreateButton({
    Name = "35. Fila de Conga Forzada",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, -1) * CFrame.Angles(math.rad(90), 0, 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, -1) * CFrame.Angles(math.rad(90), 0, 0)
        end)
    end
})

TabMemes:CreateButton({
    Name = "36. Cabeza Fidget Spinner",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, tick()*80, 0)
        end)
    end
})

TabMemes:CreateButton({
    Name = "37. Helicóptero Humano Invertido",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = CFrame.new(0, -2, 0) * CFrame.Angles(math.rad(180), tick()*50, 0)
        end)
    end
})

TabMemes:CreateButton({
    Name = "38. Pose de Gigachad Estático",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.2, 0.6, -0.2) * CFrame.Angles(math.rad(45), math.rad(-45), 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.2, 0.6, -0.2) * CFrame.Angles(math.rad(45), math.rad(45), 0)
        end)
    end
})

TabMemes:CreateButton({
    Name = "39. Físicas de Muñeco de Trapo Falso",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.5, -0.5, 0) * CFrame.Angles(0, 0, math.rad(15))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, -0.5, 0) * CFrame.Angles(0, 0, math.rad(-15))
        end)
    end
})

TabMemes:CreateButton({
    Name = "40. Screamer Jumpscare Rig Break",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = CFrame.new(0, 1.5, -4) * CFrame.Angles(0, 0, math.sin(tick()*80)*0.5)
        end)
    end
})

-- =========================================================================
-- PESTAÑA 5: COMBATE & EXTRAS (41 al 50)
-- =========================================================================
TabCombat:CreateSection("Emotes Complejos y Utilidades de Pelea")

TabCombat:CreateButton({
    Name = "41. Aplauso Sarcástico Ultra Rápido",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 60
            torso["Right Shoulder"].C0 = CFrame.new(1, 0.5, -0.5) * CFrame.Angles(math.rad(90), 0, math.sin(t))
            torso["Left Shoulder"].C0 = CFrame.new(-1, 0.5, -0.5) * CFrame.Angles(math.rad(90), 0, -math.sin(t))
        end)
    end
})

TabCombat:CreateButton({
    Name = "42. Saludo Militar Inestable",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.2, 0.8, -0.5) * CFrame.Angles(math.rad(120), math.sin(tick()*40)*0.3, math.rad(-45))
        end)
    end
})

TabCombat:CreateButton({
    Name = "43. Llanto en Cascada Desesperado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 20
            torso["Right Shoulder"].C0 = CFrame.new(1, 0.8, -0.5) * CFrame.Angles(math.rad(140), 0, math.sin(t)*0.2)
            torso["Left Shoulder"].C0 = CFrame.new(-1, 0.8, -0.5) * CFrame.Angles(math.rad(140), 0, -math.sin(t)*0.2)
        end)
    end
})

TabCombat:CreateButton({
    Name = "44. Risa Malvada Sacudida",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.new(0, math.sin(tick()*40)*0.2, 0) * CFrame.Angles(math.rad(-20), 0, 0)
        end)
    end
})

TabCombat:CreateButton({
    Name = "45. Guardia de Boxeo Dinámica",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 5
            torso["Right Shoulder"].C0 = CFrame.new(1, 0.5, -0.8) * CFrame.Angles(math.rad(90), 0, math.sin(t)*0.3)
            torso["Left Shoulder"].C0 = CFrame.new(-1, 0.5, -0.8) * CFrame.Angles(math.rad(90), 0, math.cos(t)*0.3)
        end)
    end
})

TabCombat:CreateButton({
    Name = "46. Meditación Zen Levitando",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, math.sin(tick()*4)*0.03, 0)
            torso["Right Hip"].C0 = CFrame.new(0.5, -0.5, -0.5) * CFrame.Angles(math.rad(90), math.rad(45), 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -0.5, -0.5) * CFrame.Angles(math.rad(90), math.rad(-45), 0)
        end)
    end
})

TabCombat:CreateButton({
    Name = "47. Facepalm Infinito Crítico",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1, 0.8, -0.8) * CFrame.Angles(math.rad(140), 0, math.rad(-45))
        end)
    end
})

TabCombat:CreateButton({
    Name = "48. Pose de Victoria Falsa Extravagante",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 1, 0) * CFrame.Angles(0, 0, math.rad(135))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 1, 0) * CFrame.Angles(0, 0, math.rad(-135))
        end)
    end
})

TabCombat:CreateButton({
    Name = "49. Estatua de Piedra Congelada",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = OriginalJoints["Neck"]
            torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"]
            torso["Left Shoulder"].C0 = OriginalJoints["Left Shoulder"]
        end)
    end
})

TabCombat:CreateButton({
    Name = "50. Caos Absoluto Total (Destructor)",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        local cc, bl = ApplySensoryEffects(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local s = 900000
            cc.TintColor = Color3.fromHSV(math.random(), 1, 1)
            torso.Neck.C0 = CFrame.new(math.random(-5,5), math.random(-5,5), math.random(-5,5)) * CFrame.Angles(tick()*s, tick()*s, tick()*s)
            torso["Right Shoulder"].C0 = CFrame.new(math.random(-5,5), math.random(-5,5), math.random(-5,5)) * CFrame.Angles(tick()*s, 0, 0)
            torso["Left Shoulder"].C0 = CFrame.new(math.random(-5,5), math.random(-5,5), math.random(-5,5)) * CFrame.Angles(tick()*s, 0, 0)
        end)
    end
})

-- =========================================================================
-- PANEL DE CONTROL GLOBAL
-- =========================================================================
local ControlTab = Window:CreateTab("🛑 Panel de Cierre", nil)
ControlTab:CreateSection("Desactivador General de Scripts Activos")

ControlTab:CreateButton({
    Name = "APAGAR TODO EL CAOS (KILL SWITCH)",
    Callback = function()
        StopAll()
    end
})
-- =========================================================================
-- 🤪 PESTAÑA EXTRA: TROLLING & CHAOS ADVANCED (41 al 55+)
-- =========================================================================
local TabTroll = Window:CreateTab("🤡 Advanced Trolling", nil)
TabTroll:CreateSection("Animaciones de Confusión Masiva R6")

TabTroll:CreateButton({
    Name = "51. Abrazo Fantasma Glitcheado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 10
            torso["Right Shoulder"].C0 = CFrame.new(1, 0.5, -1) * CFrame.Angles(math.rad(90), math.rad(-30 + math.sin(t)*10), 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1, 0.5, -1) * CFrame.Angles(math.rad(90), math.rad(30 - math.sin(t)*10), 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "52. El 'Bug de Conexión' Humano",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            if math.random(1, 10) > 8 then -- Simula lag de pérdida de paquetes masiva
                torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.new(0, 0, 3)
                torso["Right Shoulder"].C0 = CFrame.new(3, 0.5, 0)
                torso["Left Shoulder"].C0 = CFrame.new(-3, 0.5, 0)
            else
                torso.Neck.C0 = OriginalJoints["Neck"]
                torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"]
                torso["Left Shoulder"].C0 = OriginalJoints["Left Shoulder"]
            end
        end)
    end
})

TabTroll:CreateButton({
    Name = "53. Cabeza en el Pecho (Cursed No-Neck)",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = CFrame.new(0, -1.2, -0.5) * CFrame.Angles(math.rad(20), math.sin(tick()*10)*0.5, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "54. Nadador Olímpico de Espalda",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 20
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(t, 0, math.rad(45))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(-t, 0, math.rad(-45))
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.Angles(math.rad(-60), 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "55. Caminata del 'Paso del Ganso' Roto",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 12
            torso["Right Hip"].C0 = CFrame.new(0.5, -0.5, -0.8) * CFrame.Angles(math.rad(90) + math.sin(t)*0.2, 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -1, 0) * CFrame.Angles(-math.sin(t)*0.5, 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "56. Avión de Papel Inestable",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.Angles(math.rad(90), math.sin(tick()*5)*0.3, 0)
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(90))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-90))
        end)
    end
})

TabTroll:CreateButton({
    Name = "57. Pose de 'Se me cayó una moneda'",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, -1, -1) * CFrame.Angles(math.rad(85), 0, 0)
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(math.rad(-45), 0, 0)
        end)
    end
})
TabTroll:CreateButton({
    Name = "58. El Cangrejo Ruso Invertido",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 15
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(90), 0, 0)
            torso["Right Hip"].C0 = CFrame.new(0.5, -0.5, 0) * CFrame.Angles(0, math.sin(t), math.rad(90))
            torso["Left Hip"].C0 = CFrame.new(-0.5, -0.5, 0) * CFrame.Angles(0, math.cos(t), math.rad(-90))
        end)
    end
})

TabTroll:CreateButton({
    Name = "59. Pájaro Carpintero Humano",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 30
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(math.abs(math.sin(t)) * 1.2, 0, 0)
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, 0, math.sin(t)*0.2)
        end)
    end
})

TabTroll:CreateButton({
    Name = "60. Levitación en Silla Invisible",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 5
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, -1 + math.sin(t)*0.1, -0.5)
            torso["Right Hip"].C0 = CFrame.new(0.5, -0.5, -0.8) * CFrame.Angles(math.rad(90), 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -0.5, -0.8) * CFrame.Angles(math.rad(90), 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "61. Breakdance de Cabeza Estático",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, 2.5, 0) * CFrame.Angles(math.rad(180), tick()*10, 0)
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(45))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(0, 0, math.rad(-45))
        end)
    end
})

TabTroll:CreateButton({
    Name = "62. Espejismo Desfasado Lateral",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local offset = math.sin(tick() * 25) * 3
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.new(offset, 0, 0)
            torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"] * CFrame.new(offset, 0, 0)
            torso["Left Shoulder"].C0 = OriginalJoints["Left Shoulder"] * CFrame.new(offset, 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "63. El Abanico de Brazos Humano",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 40
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(0, 0, math.sin(t))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(0, 0, -math.sin(t))
        end)
    end
})

TabTroll:CreateButton({
    Name = "64. Torcedura Exorcista Completa",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.Angles(0, math.rad(180), 0)
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, math.rad(180), 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "65. Salto de Rana Bugeado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 8
            local jump = math.abs(math.sin(t))
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, jump * 1.5, -jump) * CFrame.Angles(jump * 0.3, 0, 0)
            torso["Right Hip"].C0 = CFrame.new(0.5, -0.5, -0.5) * CFrame.Angles(math.rad(60) * (1-jump), 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -0.5, -0.5) * CFrame.Angles(math.rad(60) * (1-jump), 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "66. Arrastre de Cadera Lateral",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 10
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(math.sin(t)*1.2, -0.5, 0) * CFrame.Angles(0, 0, math.sin(t)*0.2)
        end)
    end
})

TabTroll:CreateButton({
    Name = "67. El Reloj de Péndulo Humano",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 5
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.Angles(0, 0, math.sin(t)*0.6)
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, 0, -math.sin(t)*0.6)
        end)
    end
})

TabTroll:CreateButton({
    Name = "68. Espasmo de Hombros Alternados",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 35
            torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"] * CFrame.new(0, math.sin(t)*0.6, 0)
            torso["Left Shoulder"].C0 = OriginalJoints["Left Shoulder"] * CFrame.new(0, math.cos(t)*0.6, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "69. Caminata de Puntería Rota",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso["Right Shoulder"].C0 = CFrame.new(1, 0.5, -0.8) * CFrame.Angles(math.rad(90), 0, math.rad(-30))
            torso["Left Shoulder"].C0 = CFrame.new(-1, 0.5, -0.8) * CFrame.Angles(math.rad(90), 0, math.rad(30))
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, math.sin(tick()*15)*0.4, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "70. Helicóptero de Cadera Excesivo",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.Angles(0, tick()*45, 0)
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(0, -tick()*45, 0)
        end)
    end
})
TabTroll:CreateButton({
    Name = "71. El Muñeco Inflable de Concesionaria",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 12
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.Angles(math.sin(t)*0.5, 0, math.cos(t*0.5)*0.3)
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5 + math.sin(t)*0.5, 0) * CFrame.Angles(0, 0, math.rad(90) + math.sin(t))
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5 + math.cos(t)*0.5, 0) * CFrame.Angles(0, 0, math.rad(-90) - math.cos(t))
        end)
    end
})

TabTroll:CreateButton({
    Name = "72. Flexiones de Brazos Glitcheadas",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 15
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, -1.2 + math.sin(t)*0.4, 0) * CFrame.Angles(math.rad(80), 0, 0)
            torso["Right Shoulder"].C0 = CFrame.new(1.2, 0.5, -0.5) * CFrame.Angles(math.rad(90), 0, math.rad(-20))
            torso["Left Shoulder"].C0 = CFrame.new(-1.2, 0.5, -0.5) * CFrame.Angles(math.rad(90), 0, math.rad(20))
        end)
    end
})

TabTroll:CreateButton({
    Name = "73. Cabeza Lanzada en Reversa",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.new(0, 0, 1.8) * CFrame.Angles(math.rad(-90), 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "74. El Paso del Robot Descalibrado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = math.floor(tick() * 12)
            if t % 3 == 0 then
                torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.8, -0.5) * CFrame.Angles(math.rad(90), 0, 0)
                torso["Left Hip"].C0 = CFrame.new(-0.5, -0.5, -0.5) * CFrame.Angles(math.rad(45), 0, 0)
            else
                torso["Right Shoulder"].C0 = OriginalJoints["Right Shoulder"]
                torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.8, -0.5) * CFrame.Angles(math.rad(90), 0, 0)
                torso["Left Hip"].C0 = OriginalJoints["Left Hip"]
            end
        end)
    end
})

TabTroll:CreateButton({
    Name = "75. Desprendimiento de Torso Flotante",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 6
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, 3 + math.sin(t)*1, 0)
            torso["Right Hip"].C0 = CFrame.new(0.5, -4 - math.sin(t)*1, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -4 - math.sin(t)*1, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "76. Giro de Extensas en T-Pose",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 20
            torso["Right Shoulder"].C0 = CFrame.new(2 + math.sin(t)*1, 0.5, 0) * CFrame.Angles(0, t, math.rad(90))
            torso["Left Shoulder"].C0 = CFrame.new(-2 - math.sin(t)*1, 0.5, 0) * CFrame.Angles(0, -t, math.rad(-90))
        end)
    end
})

TabTroll:CreateButton({
    Name = "77. Sentadilla Rusa Imposible",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 14
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, -1.5, 0)
            torso["Right Hip"].C0 = CFrame.new(0.5, 0.2, -0.8) * CFrame.Angles(math.rad(90), 0, math.sin(t)*0.5)
            torso["Left Hip"].C0 = CFrame.new(-0.5, 0.2, -0.8) * CFrame.Angles(math.rad(90), 0, math.cos(t)*0.5)
        end)
    end
})

TabTroll:CreateButton({
    Name = "78. El Salto del Delfín Terrestre",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 10
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, math.sin(t)*1, math.cos(t)*1) * CFrame.Angles(t, 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "79. Espasmo de Cuello Sísmico",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.Neck.C0 = OriginalJoints["Neck"] * CFrame.Angles(math.rad(math.random(-45, 45)), math.rad(math.random(-45, 45)), math.rad(math.random(-45, 45)))
        end)
    end
})

TabTroll:CreateButton({
    Name = "80. La Araña Invertida de Techo",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, 2, 0) * CFrame.Angles(math.rad(180), 0, 0)
            torso["Right Shoulder"].C0 = CFrame.new(1.5, -0.5, 0) * CFrame.Angles(math.rad(-45), 0, 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, -0.5, 0) * CFrame.Angles(math.rad(-45), 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "81. Deslizamiento por Gravedad Cero",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 4
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(math.sin(t)*2, 0, math.cos(t)*2)
        end)
    end
})

TabTroll:CreateButton({
    Name = "82. Aplauso de Pies (Cursed Sit)",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 25
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.new(0, -1, 0) * CFrame.Angles(math.rad(30), 0, 0)
            torso["Right Hip"].C0 = CFrame.new(0.5, 0.5, -0.5) * CFrame.Angles(math.rad(90), 0, math.sin(t)*0.6)
            torso["Left Hip"].C0 = CFrame.new(-0.5, 0.5, -0.5) * CFrame.Angles(math.rad(90), 0, -math.sin(t)*0.6)
        end)
    end
})

TabTroll:CreateButton({
    Name = "83. El Péndulo de Cabeza Desencajado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 15
            torso.Neck.C0 = CFrame.new(math.sin(t)*1.5, 1.5 + math.abs(math.cos(t))*0.5, 0) * CFrame.Angles(0, 0, math.sin(t)*0.5)
        end)
    end
})

TabTroll:CreateButton({
    Name = "84. Corredor Sónico Glitcheado",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 40
            torso.RootJoint.C0 = OriginalJoints["RootJoint"] * CFrame.Angles(math.rad(30), 0, 0)
            torso["Right Hip"].C0 = CFrame.new(0.5, -1, math.sin(t)*1) * CFrame.Angles(math.sin(t)*1.5, 0, 0)
            torso["Left Hip"].C0 = CFrame.new(-0.5, -1, -math.sin(t)*1) * CFrame.Angles(-math.sin(t)*1.5, 0, 0)
        end)
    end
})

TabTroll:CreateButton({
    Name = "85. La Hélice Humana R6",
    Callback = function()
        StopAll()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local torso = char:WaitForChild("Torso")
        SaveJoints(torso)
        ActiveConnection = RunService.RenderStepped:Connect(function()
            local t = tick() * 50
            torso["Right Shoulder"].C0 = CFrame.new(1.5, 0.5, 0) * CFrame.Angles(t, 0, 0)
            torso["Left Shoulder"].C0 = CFrame.new(-1.5, 0.5, 0) * CFrame.Angles(-t, 0, 0)
        end)
    end
})
-- Identificador exclusivo para TheMilerV1
if LocalPlayer.Name == "TheMilerV1" then
    local function CreateOwnerTag()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local head = char:FindFirstChild("Head")
        if head then
            local billboard = Instance.new("BillboardGui", head)
            billboard.Name = "OwnerTag"
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true

            local text = Instance.new("TextLabel", billboard)
            text.Size = UDim2.new(1, 0, 1, 0)
            text.Text = "👑 TheMilerV1 - Owner Script 👑"
            text.TextColor3 = Color3.fromRGB(255, 215, 0)
            text.TextStrokeTransparency = 0
            text.BackgroundTransparency = 1
            text.Font = Enum.Font.SourceSansBold
            text.TextSize = 25
        end
    end

    CreateOwnerTag()
    LocalPlayer.CharacterAdded:Connect(CreateOwnerTag)
end
