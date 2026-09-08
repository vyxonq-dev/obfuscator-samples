local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

getgenv().SecureMode = true

-- RAYFIELD LOADER
local Rayfield
local urls = {
    "https://sirius.menu/rayfield",
    "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source",
    "https://raw.githubusercontent.com/UI-Interface/CustomField/main/RayField.lua"
}
for _, url in ipairs(urls) do
    local success, result = pcall(function() return game:HttpGet(url, true) end)
    if success and result and #result > 5000 then 
        Rayfield = loadstring(result)() 
        break 
    end
    task.wait(0.3)
end
if not Rayfield then return end

-- LANGUES
local Lang = {
    ["Français"] = {
        win="Sword Reach", 
        tab_main="Principal", 
        tab_vict="Choisir un joueur", 
        tab_bb="Build and battle",
        tab_lang="Langue (beta)", 
        tab_other="Autre", 
        tab_cmds="Commandes",
        ignore="Ignorer Amis", 
        range="Portée", 
        activate="Activer Reach",
        sphere="Sphère (Sword uniquement)", 
        destroy="Détruire l'interface graphique",
        leavegame="Quitter la partie",
        protect_name="Nom du joueur", 
        protect_btn="Protéger", 
        unprotect_btn="Déprotéger",
        fly="Voler", 
        unfly="Ne pas voler", 
        flyspeed="Vitesse Voler", 
        noclip="Sans clip", 
        clip="Clip", 
        spin="Tourner", 
        unspin="Détourner", 
        speed="Vitesse", 
        unspeed="Vitesse normale (16)",
        goto="Aller au joueur", 
        goto_name="Nom du joueur",
        glitchsword="GlitchSword",
        glitchsword_desc="Ceci est OP mais avec le Reach activé c'est encore plus OP !",
        autoglitch="Auto Glitch",
        autoglitch_desc="Équipe et glitch automatiquement !",
        autokill_radius="Rayon Auto Kill",
        autokill="Auto Kill",
        autokill_desc="Marche, glitch et tue automatiquement ! (Shift pour toggle rapide)"
    },
    ["English"] = {
        win="Sword Reach", 
        tab_main="Main", 
        tab_vict="Choose Player", 
        tab_bb="Build and battle",
        tab_lang="Language (beta)", 
        tab_other="Other", 
        tab_cmds="Commands",
        ignore="Ignore Friends", 
        range="Range", 
        activate="Activate Reach",
        sphere="Sphere (Sword only)", 
        destroy="Destroy GUI",
        leavegame="Leave Game",
        protect_name="Player Name", 
        protect_btn="Protect", 
        unprotect_btn="Unprotect",
        fly="Fly", 
        unfly="Unfly", 
        flyspeed="Fly Speed", 
        noclip="Noclip", 
        clip="Clip", 
        spin="Spin", 
        unspin="Unspin", 
        speed="Speed", 
        unspeed="Normal Speed (16)",
        goto="Goto Player", 
        goto_name="Player Name",
        glitchsword="GlitchSword",
        glitchsword_desc="This is OP but with Reach enabled it's even more OP!",
        autoglitch="Auto Glitch",
        autoglitch_desc="Auto equip and glitch!",
        autokill_radius="Auto Kill Radius",
        autokill="Auto Kill",
        autokill_desc="Walk, glitch and kill automatically! (Shift to quick toggle)"
    },
    ["Español"] = {
        win="Sword Reach", 
        tab_main="Principal", 
        tab_vict="Elegir Jugador", 
        tab_bb="Build and battle",
        tab_lang="Idioma (beta)", 
        tab_other="Otro", 
        tab_cmds="Comandos",
        ignore="Ignorar Amigos", 
        range="Alcance", 
        activate="Activar",
        sphere="Esfera (solo Sword)", 
        destroy="Destruir",
        leavegame="Salir del juego",
        protect_name="Nombre del jugador", 
        protect_btn="Proteger", 
        unprotect_btn="Desproteger",
        fly="Volar", 
        unfly="No volar", 
        flyspeed="Velocidad Vuelo", 
        noclip="Noclip", 
        clip="Clip", 
        spin="Girar", 
        unspin="No girar", 
        speed="Velocidad", 
        unspeed="Velocidad normal (16)",
        goto="Ir al jugador", 
        goto_name="Nombre del jugador",
        glitchsword="GlitchSword",
        glitchsword_desc="¡Esto es OP pero con Reach activado es aún más OP!",
        autoglitch="Auto Glitch",
        autoglitch_desc="¡Equipar y glitch automático!",
        autokill_radius="Radio Auto Kill",
        autokill="Auto Kill",
        autokill_desc="¡Camina, glitch y mata automáticamente! (Shift para toggle rápido)"
    }
}

local currentLang = "Français"
if isfile and readfile and isfile("SwordReach_Lang.txt") then
    local saved = readfile("SwordReach_Lang.txt")
    if Lang[saved] then currentLang = saved end
end
local function saveLang() if writefile then writefile("SwordReach_Lang.txt", currentLang) end end
local function L(key) return Lang[currentLang][key] or key end

-- VARIABLES
local reachEnabled = false
local reachRange = 18
local showSphere = false
local spherePart = nil
local ignoreFriends = false
local friendUserIds = {}
local targetedPlayer = nil
local playerButtons = {}

local safeList = {
    ["Mayan_legameur12"] = true,
    ["Mayan_legameur14"] = true,
    ["Mayan_legameur11"] = true
}

local autoGlitchEnabled = false
local autoGlitchConnection = nil

local autoKillEnabled = false
local autoKillRadius = 50
local previousReachEnabled = false
local previousReachRange = 18
local previousTargetedPlayer = nil

local flying = false
local noclipEnabled = false
local spinEnabled = false
local spinSpeed = 0

-- Fonctions utilitaires
local function equipSword()
    local char = LocalPlayer.Character
    if not char then return false end
    local backpack = LocalPlayer:FindFirstChild("Backpack")
    if backpack then
        for _, tool in pairs(backpack:GetChildren()) do
            if tool:IsA("Tool") and string.find(tool.Name:lower(), "sword") then
                char.Humanoid:EquipTool(tool)
                return true
            end
        end
    end
    for _, tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") and string.find(tool.Name:lower(), "sword") then return true end
    end
    return false
end

local function executeGlitch()
    pcall(function()
        local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
        if tool and tool:FindFirstChild("GripEvent") then
            local args = { [1] = "Out" }
            tool.GripEvent:FireServer(unpack(args))
        end
    end)
end

local function createSphere()
    if spherePart then spherePart:Destroy() end
    spherePart = Instance.new("Part")
    spherePart.Name = "SwordReachSphere"
    spherePart.Shape = Enum.PartType.Ball
    spherePart.Material = Enum.Material.ForceField
    spherePart.Size = Vector3.new(reachRange*2, reachRange*2, reachRange*2)
    spherePart.Color = Color3.fromRGB(0, 255, 0)
    spherePart.Transparency = 0.65
    spherePart.Anchored = true
    spherePart.CanCollide = false
    spherePart.Parent = Workspace
end

local function updateSphereVisibility()
    if not showSphere then 
        if spherePart then spherePart:Destroy() spherePart = nil end 
        return 
    end
    local char = LocalPlayer.Character
    if not char then return end
    local tool = char:FindFirstChildOfClass("Tool")
    if tool and tool:FindFirstChild("Handle") and string.find(tool.Name:lower(), "sword") then
        if not spherePart then createSphere() end
        spherePart.CFrame = tool.Handle.CFrame
        spherePart.Size = Vector3.new(reachRange*2, reachRange*2, reachRange*2)
    else
        if spherePart then spherePart:Destroy() spherePart = nil end
    end
end
RunService.RenderStepped:Connect(updateSphereVisibility)

-- Reach System
local reachConnection
local function startReach()
    if reachConnection then return end
    reachConnection = RunService.Heartbeat:Connect(function()
        if not reachEnabled then return end
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then return end
        local tool = char:FindFirstChildOfClass("Tool")
        if not tool or not tool:FindFirstChild("Handle") then return end

        for _, p in Players:GetPlayers() do
            if p == LocalPlayer or not p.Character or not p.Character:FindFirstChild("HumanoidRootPart") then continue end
            if safeList[p.Name] then continue end
            if targetedPlayer and p ~= targetedPlayer then continue end
            if ignoreFriends and friendUserIds[p.UserId] then continue end

            local dist = (char.HumanoidRootPart.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if dist <= reachRange then
                tool:Activate()
                for _, part in p.Character:GetDescendants() do
                    if part:IsA("BasePart") then
                        firetouchinterest(tool.Handle, part, 0)
                        firetouchinterest(tool.Handle, part, 1)
                    end
                end
            end
        end
    end)
end

local function stopReach()
    if reachConnection then reachConnection:Disconnect() reachConnection = nil end
end

-- Auto Glitch (se désactive vraiment)
local function startAutoGlitch()
    if autoGlitchConnection then return end
    autoGlitchConnection = RunService.Heartbeat:Connect(function()
        if not autoGlitchEnabled then return end
        if equipSword() then executeGlitch() end
    end)
end

local function stopAutoGlitch()
    if autoGlitchConnection then
        autoGlitchConnection:Disconnect()
        autoGlitchConnection = nil
    end
end

-- Auto Kill
local function findNearestEnemy()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    local myPos = char.HumanoidRootPart.Position
    local nearest, minDist = nil, autoKillRadius

    for _, plr in Players:GetPlayers() do
        if plr == LocalPlayer or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then continue end
        if safeList[plr.Name] or (ignoreFriends and friendUserIds[plr.UserId]) then continue end
        local dist = (plr.Character.HumanoidRootPart.Position - myPos).Magnitude
        if dist < minDist then
            minDist = dist
            nearest = plr
        end
    end
    return nearest
end

local autoKillConnection
local function toggleAutoKill()
    autoKillEnabled = not autoKillEnabled
    if autoKillEnabled then
        previousReachEnabled = reachEnabled
        previousReachRange = reachRange
        previousTargetedPlayer = targetedPlayer

        reachRange = 10
        reachEnabled = true
        targetedPlayer = nil
        startReach()

        autoKillConnection = RunService.Heartbeat:Connect(function()
            if not autoKillEnabled then return end
            if equipSword() then executeGlitch() end

            local target = findNearestEnemy()
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum.WalkSpeed = 17
                    hum:MoveTo(target.Character.HumanoidRootPart.Position)
                end
            end
        end)
        print("✅ Auto Kill ACTIVÉ (Shift pour désactiver)")
    else
        if autoKillConnection then autoKillConnection:Disconnect() autoKillConnection = nil end
        reachEnabled = previousReachEnabled
        reachRange = previousReachRange
        targetedPlayer = previousTargetedPlayer
        if not previousReachEnabled then stopReach() end
        print("❌ Auto Kill DÉSACTIVÉ")
    end
end

-- GUI
local Window = Rayfield:CreateWindow({
    Name = L("win"),
    LoadingTitle = "Sword Reach",
    LoadingSubtitle = "par Mayan_legameur14",
    ConfigurationSaving = {Enabled = true, FolderName = "SwordReach2025"},
    KeySystem = false
})

local TabMain = Window:CreateTab(L("tab_main"))
local TabPlayer = Window:CreateTab(L("tab_vict"))
local TabBuildBattle = Window:CreateTab(L("tab_bb"))
local TabCmds = Window:CreateTab(L("tab_cmds"))
local TabLang = Window:CreateTab(L("tab_lang"))
local TabOther = Window:CreateTab(L("tab_other"))

-- Tab Principal
TabMain:CreateToggle({Name = L("ignore"), CurrentValue = false, Callback = function(v) ignoreFriends = v end})
TabMain:CreateSlider({Name = L("range"), Range = {5,100}, Increment = 1, CurrentValue = 18, Callback = function(v) reachRange = v end})
TabMain:CreateToggle({Name = L("activate"), CurrentValue = false, Callback = function(v) reachEnabled = v if v then startReach() else stopReach() end end})
TabMain:CreateToggle({Name = L("sphere"), CurrentValue = false, Callback = function(v) showSphere = v end})

local protectInput = TabMain:CreateInput({Name = L("protect_name"), PlaceholderText = "Username...", Callback = function() end})
TabMain:CreateButton({Name = L("protect_btn"), Callback = function()
    local name = protectInput.CurrentValue
    if name and name ~= "" then safeList[name] = true end
end})
TabMain:CreateButton({Name = L("unprotect_btn"), Callback = function()
    local name = protectInput.CurrentValue
    if name and name ~= "" then safeList[name] = nil end
end})

-- Tab Choisir un joueur
local function createPlayerButton(plr)
    if playerButtons[plr.UserId] or plr == LocalPlayer then return end
    local btn = TabPlayer:CreateButton({
        Name = plr.DisplayName .. " (@" .. plr.Name .. ")",
        Callback = function() targetedPlayer = (targetedPlayer == plr) and nil or plr end
    })
    playerButtons[plr.UserId] = btn
end
for _, plr in Players:GetPlayers() do createPlayerButton(plr) end
Players.PlayerAdded:Connect(function(plr) task.wait(1) createPlayerButton(plr) end)
Players.PlayerRemoving:Connect(function(plr)
    if targetedPlayer == plr then targetedPlayer = nil end
    playerButtons[plr.UserId] = nil
end)

-- Tab Build and Battle
TabBuildBattle:CreateButton({
    Name = L("glitchsword"),
    Callback = function()
        equipSword()
        task.wait(0.15)
        executeGlitch()
    end
})
TabBuildBattle:CreateLabel(L("glitchsword_desc"))

TabBuildBattle:CreateToggle({
    Name = L("autoglitch"),
    CurrentValue = false,
    Callback = function(v)
        autoGlitchEnabled = v
        if v then
            startAutoGlitch()
            print("✅ Auto Glitch ACTIVÉ")
        else
            stopAutoGlitch()
            print("❌ Auto Glitch DÉSACTIVÉ")
        end
    end
})
TabBuildBattle:CreateLabel(L("autoglitch_desc"))

TabBuildBattle:CreateSlider({Name = L("autokill_radius"), Range = {10,200}, Increment = 5, CurrentValue = 50, Callback = function(v) autoKillRadius = v end})

TabBuildBattle:CreateToggle({
    Name = L("autokill"),
    CurrentValue = false,
    Callback = function(v)
        if v then toggleAutoKill() elseif autoKillEnabled then toggleAutoKill() end
    end
})
TabBuildBattle:CreateLabel(L("autokill_desc"))

-- Tab Commandes
TabCmds:CreateButton({Name = L("fly"), Callback = function() flying = not flying; pcall(function() LocalPlayer.Character.Humanoid.PlatformStand = flying end) end})
TabCmds:CreateButton({Name = L("unfly"), Callback = function() flying = false; pcall(function() LocalPlayer.Character.Humanoid.PlatformStand = false end) end})

TabCmds:CreateButton({Name = L("noclip"), Callback = function() noclipEnabled = true end})
TabCmds:CreateButton({Name = L("clip"), Callback = function() noclipEnabled = false end})

TabCmds:CreateInput({Name = L("speed"), PlaceholderText = "100", Callback = function(text)
    local num = tonumber(text)
    if num then pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = num end) end
end})

TabCmds:CreateButton({Name = L("unspeed"), Callback = function() pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = 16 end) end})

TabCmds:CreateInput({Name = L("spin"), PlaceholderText = "1-100000", Callback = function(text)
    local num = tonumber(text)
    if num then spinEnabled = true spinSpeed = num end
end})
TabCmds:CreateButton({Name = L("unspin"), Callback = function() spinEnabled = false spinSpeed = 0 end})

local gotoInput = TabCmds:CreateInput({Name = L("goto_name"), PlaceholderText = "Username...", Callback = function() end})
TabCmds:CreateButton({Name = L("goto"), Callback = function()
    local name = gotoInput.CurrentValue
    if not name or name == "" then return end
    for _, plr in Players:GetPlayers() do
        if plr.Name:lower() == name:lower() or plr.DisplayName:lower() == name:lower() then
            pcall(function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            end)
            return
        end
    end
end})

-- Tab Langue
local languages = {"Français","English","Español"}
for _, lang in ipairs(languages) do
    TabLang:CreateButton({
        Name = lang .. (lang == currentLang and " (actuel)" or ""),
        Callback = function()
            currentLang = lang
            saveLang()
            Rayfield:Destroy()
            task.wait(0.6)
            loadstring(game:HttpGet("https://pastebin.com/raw/mGsAZ9eA"))()
        end
    })
end

-- Tab Autre
TabOther:CreateButton({
    Name = L("leavegame"), 
    Callback = function()
        print("Tu as appuyé ici pour quitter la partie en urgence")
        game:Shutdown()
    end
})

TabOther:CreateButton({
    Name = L("destroy"), 
    Callback = function()
        stopReach()
        stopAutoGlitch()
        if spherePart then spherePart:Destroy() end
        Rayfield:Destroy()
    end
})

-- Loops
RunService.Heartbeat:Connect(function()
    if noclipEnabled then
        pcall(function()
            for _, part in LocalPlayer.Character:GetDescendants() do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        end)
    end

    if spinEnabled and spinSpeed > 0 then
        pcall(function()
            LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, math.rad(spinSpeed), 0)
        end)
    end
end)

-- Raccourci Shift pour Auto Kill
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.LeftShift or input.KeyCode == Enum.KeyCode.RightShift then
        toggleAutoKill()
    end
end)

-- Chat Commands
LocalPlayer.Chatted:Connect(function(msg)
    local args = string.split(msg:lower(), " ")
    local cmd = args[1]
    if cmd == ":fly" then flying = true; pcall(function() LocalPlayer.Character.Humanoid.PlatformStand = true end)
    elseif cmd == ":unfly" then flying = false; pcall(function() LocalPlayer.Character.Humanoid.PlatformStand = false end)
    elseif cmd == ":noclip" then noclipEnabled = true
    elseif cmd == ":clip" then noclipEnabled = false
    elseif cmd == ":reach" then reachEnabled = true startReach()
    elseif cmd == ":unreach" then reachEnabled = false stopReach()
    elseif cmd == ":speed" and args[2] then pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(args[2]) end)
    elseif cmd == ":unspeed" then pcall(function() LocalPlayer.Character.Humanoid.WalkSpeed = 16 end)
    elseif cmd == ":spin" and args[2] then spinEnabled = true spinSpeed = tonumber(args[2])
    elseif cmd == ":unspin" then spinEnabled = false spinSpeed = 0
    end
end)

print("✅ Script complet chargé avec succès !")
print("   → Leave Game ajouté")