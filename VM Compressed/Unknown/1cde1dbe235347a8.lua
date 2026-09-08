local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Mec BR - FREEHUB V1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Carregando Menu",
   LoadingSubtitle = "by OfficialPatozoid",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "PEGUE A KEY",
      Subtitle = "Key System",
      Note = "Passe pelo rekonise para pegar a key", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/B9ytkGHC"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local PlayerTab = Window:CreateTab("Player", 4483362458) -- Title, Image

-- LocalScript em StarterPlayerScripts
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local humanoid
local infiniteJumpEnabled = false -- toggle

-- Detecta o humanoid do jogador
local function onCharacterAdded(character)
	humanoid = character:WaitForChild("Humanoid")
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
	onCharacterAdded(player.Character)
end

-- Toggle na UI
local InfiniteJumpToggle = PlayerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJumpToggle",
    Callback = function(Value)
        infiniteJumpEnabled = Value
    end,
})

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
	if infiniteJumpEnabled and humanoid then
		humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)


-- LocalScript em StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local humanoid

-- Detecta o humanoid do jogador
local function onCharacterAdded(character)
	humanoid = character:WaitForChild("Humanoid")
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
	onCharacterAdded(player.Character)
end

-- Supondo que você já tenha seu Tab:CreateSlider
local Slider = PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {0, 150}, -- agora vai de 0 a 150
   Increment = 1,    -- incrementos de 1
   Suffix = "WS",    -- pode mudar para "WalkSpeed" se quiser
   CurrentValue = 16, -- padrão do Roblox
   Flag = "WalkSpeedSlider",
   Callback = function(Value)
       -- Sempre que o slider mudar, altera a WalkSpeed
       if humanoid then
           humanoid.WalkSpeed = Value
       end
   end,
})


local Players = game:GetService("Players")
local player = Players.LocalPlayer
local humanoid

-- Valor atual do JumpPower, inicial 50
local currentJumpPower = 50

-- Função para detectar o humanoid do jogador
local function onCharacterAdded(character)
	humanoid = character:WaitForChild("Humanoid")
	-- Aplica o valor atual do slider assim que o humanoid aparece
	humanoid.JumpPower = currentJumpPower
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
	onCharacterAdded(player.Character)
end

-- Slider de JumpPower usando sua UI Library
local JumpPowerSlider = PlayerTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 250},    -- JumpPower de 0 a 250
   Increment = 1,
   Suffix = "JP",
   CurrentValue = currentJumpPower,
   Flag = "JumpPowerSlider",
   Callback = function(Value)
       -- Salva o valor atual
       currentJumpPower = Value
       -- Aplica no humanoid atual, se existir
       if humanoid then
           humanoid.JumpPower = currentJumpPower
       end
   end,
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local noclipEnabled = false

-- Função para atualizar o personagem
local function updateCharacter(char)
	character = char
end
player.CharacterAdded:Connect(updateCharacter)

-- Toggle na UI
local NoclipToggle = PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(Value)
        noclipEnabled = Value
    end,
})

-- Noclip loop
RunService.Stepped:Connect(function()
    if noclipEnabled and character then
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = false
            end
        end
    elseif character then
        -- quando toggle desligado, restaura CanCollide
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.CanCollide = true
            end
        end
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local flying = false
local flySpeed = 50

-- Atualiza o character após respawn
local function onCharacterAdded(char)
	character = char
	humanoidRootPart = char:WaitForChild("HumanoidRootPart")
end
player.CharacterAdded:Connect(onCharacterAdded)

-- Toggle de Fly
local FlyToggle = PlayerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "FlyToggle",
    Callback = function(Value)
        flying = Value
        if not flying then
            -- Reseta a velocidade para zero quando desligar
            if humanoidRootPart then
                humanoidRootPart.Velocity = Vector3.new(0,0,0)
            end
        end
    end,
})

-- Slider de velocidade do Fly
local FlySpeedSlider = PlayerTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 300},
    Increment = 5,
    Suffix = "Studs/s",
    CurrentValue = flySpeed,
    Flag = "FlySpeedSlider",
    Callback = function(Value)
        flySpeed = Value
    end,
})

-- Controle do voo
local UserInputService = game:GetService("UserInputService")
local keysPressed = {W=false, A=false, S=false, D=false, Space=false, LeftShift=false}

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.W then keysPressed.W = true end
    if input.KeyCode == Enum.KeyCode.A then keysPressed.A = true end
    if input.KeyCode == Enum.KeyCode.S then keysPressed.S = true end
    if input.KeyCode == Enum.KeyCode.D then keysPressed.D = true end
    if input.KeyCode == Enum.KeyCode.Space then keysPressed.Space = true end
    if input.KeyCode == Enum.KeyCode.LeftShift then keysPressed.LeftShift = true end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then keysPressed.W = false end
    if input.KeyCode == Enum.KeyCode.A then keysPressed.A = false end
    if input.KeyCode == Enum.KeyCode.S then keysPressed.S = false end
    if input.KeyCode == Enum.KeyCode.D then keysPressed.D = false end
    if input.KeyCode == Enum.KeyCode.Space then keysPressed.Space = false end
    if input.KeyCode == Enum.KeyCode.LeftShift then keysPressed.LeftShift = false end
end)

-- Loop de voo
RunService.RenderStepped:Connect(function(deltaTime)
    if flying and humanoidRootPart then
        local direction = Vector3.new(0,0,0)
        if keysPressed.W then direction = direction + workspace.CurrentCamera.CFrame.LookVector end
        if keysPressed.S then direction = direction - workspace.CurrentCamera.CFrame.LookVector end
        if keysPressed.A then direction = direction - workspace.CurrentCamera.CFrame.RightVector end
        if keysPressed.D then direction = direction + workspace.CurrentCamera.CFrame.RightVector end
        if keysPressed.Space then direction = direction + Vector3.new(0,1,0) end
        if keysPressed.LeftShift then direction = direction - Vector3.new(0,1,0) end

        if direction.Magnitude > 0 then
            humanoidRootPart.Velocity = direction.Unit * flySpeed
        else
            humanoidRootPart.Velocity = Vector3.new(0,0,0)
        end
    end
end)

local TPTab = Window:CreateTab("🧿Teleports", 4483362458) -- Title, Image

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Button = TPTab:CreateButton({
   Name = "🚗FERRO-VELHO",
   Callback = function()
       local character = player.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           -- Teleporta usando CFrame completo
           character.HumanoidRootPart.CFrame = CFrame.new(
               -3418.64502, 148.252899, -458.328003,
               -1, 8.74227766e-08, 0,
               8.74227766e-08, 1, 8.74227766e-08,
               7.64274186e-15, 8.74227766e-08, -1
           )
       end
   end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Button = TPTab:CreateButton({
   Name = "🚙Concessionaria",
   Callback = function()
       local character = player.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           -- Teleporta usando CFrame completo
           character.HumanoidRootPart.CFrame = CFrame.new(
               -3167.74683, 147.764023, -75.9954834,
               0, 0, -1,
               0, 1, 0,
               1, 0, 0
           )
       end
   end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Button = TPTab:CreateButton({
   Name = "🔩Auto-Peças",
   Callback = function()
       local character = player.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           -- Teleporta usando CFrame completo
           character.HumanoidRootPart.CFrame = CFrame.new(
               -3571.43774, 149.245956, 377.565308,
               -1, 0, 0,
               0, 1, 0,
               0, 0, -1
           )
       end
   end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local Button = TPTab:CreateButton({
   Name = "🚧Garagem",
   Callback = function()
       local character = player.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           -- Teleporta usando CFrame completo
           character.HumanoidRootPart.CFrame = CFrame.new(
               -3556.26294, 148.45932, 907.711731,
               1, 0, 0,
               0, 1, 0,
               0, 0, 1
           )
       end
   end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local selectedTeleport = nil -- inicializa como nil

-- Cria o Dropdown
local Dropdown = TPTab:CreateDropdown({
    Name = "🔧Oficinas Publicas",
    Options = {"🔧Oficina1", "🔧Oficina2"},
    CurrentOption = {},
    MultipleOptions = false,
    Flag = "TeleportDropdown",
    Callback = function(Options)
        -- Options é uma tabela, pegamos a primeira opção selecionada
        selectedTeleport = Options[1]
    end,
})

-- Cria o Button de teleport
local TeleportButton = TPTab:CreateButton({
    Name = "Teleportar",
    Callback = function()
        if not selectedTeleport then return end -- não faz nada se nenhuma opção selecionada
        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            if selectedTeleport == "🔧Oficina1" then
                character.HumanoidRootPart.CFrame = CFrame.new(
                    -2995.61377, 161.869431, 1483.03894,
                    1, 0, 0,
                    0, 1, 0,
                    0, 0, 1
                )
            elseif selectedTeleport == "🔧Oficina2" then
                character.HumanoidRootPart.CFrame = CFrame.new(
                    -4094.27637, 148.055481, 48.6451569,
                    0, 0, -1,
                    0, 1, 0,
                    1, 0, 0
                )
            end
        end
    end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local TeleportButton2 = TPTab:CreateButton({
   Name = "Dinametros",
   Callback = function()
       local character = player.Character
       if character and character:FindFirstChild("HumanoidRootPart") then
           -- Teleporta usando CFrame completo
           character.HumanoidRootPart.CFrame = CFrame.new(
               -4079.77246, 160.567535, 1490.77039,
               1, 0, 0,
               0, 1, 0,
               0, 0, 1
           )
       end
   end,
})

local VeiculoTab = Window:CreateTab("🚗Veiculos", 4483362458) -- Title, Image

-- LocalScript: Notificador de Veículos + Teleporte Automático (cria toggles quando VeiculoTab existir)
-- Cole em StarterPlayer > StarterPlayerScripts (pode ficar no mesmo arquivo da sua UI ou depois dele)

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer
local task = task

-- estado
local notifyEnabled = false
local teleportEnabled = false
local processed = setmetatable({}, { __mode = "k" }) -- weak keys

-- FUNÇÃO: tenta obter VeiculoTab de várias fontes (variável, _G, getgenv)
local function getVeiculoTab()
    -- se existir como variável no ambiente atual
    if type(rawget and rawget(_G, "VeiculoTab") or _G.VeiculoTab) == "table" then
        return _G.VeiculoTab
    end
    -- checar global direto (caso VeiculoTab seja global)
    if type(VeiculoTab) == "table" then
        return VeiculoTab
    end
    -- checar _G
    if type(_G) == "table" and type(_G.VeiculoTab) == "table" then
        return _G.VeiculoTab
    end
    -- checar getgenv (em ambiente de exploits onde existe)
    if type(getgenv) == "function" then
        local ge = getgenv()
        if type(ge) == "table" and type(ge.VeiculoTab) == "table" then
            return ge.VeiculoTab
        end
    end
    return nil
end

-- FUNÇÃO: cria toggles quando possível (retorna true se criou)
local togglesCreated = false
local function tryCreateToggles()
    if togglesCreated then return true end
    local tab = getVeiculoTab()
    if not tab or type(tab.CreateToggle) ~= "function" then
        return false
    end

    -- cria toggles linkando às variáveis locais
    tab:CreateToggle({
        Name = "Notificar Veículos",
        CurrentValue = notifyEnabled,
        Flag = "NotifyCarToggle",
        Callback = function(v) notifyEnabled = v end,
    })

    tab:CreateToggle({
        Name = "Teleporte Automático p/ Veículo",
        CurrentValue = teleportEnabled,
        Flag = "AutoTeleportCarToggle",
        Callback = function(v) teleportEnabled = v end,
    })

    togglesCreated = true
    print("[CarNotifier] Toggles criados em VeiculoTab.")
    return true
end

-- Tenta criar imediatamente; se não der, fica tentando em paralelo
if not tryCreateToggles() then
    task.spawn(function()
        -- tenta repetidamente até criar (ou até parar por ter sucesso)
        for i = 1, 200 do -- ~20s máximo (200 * 0.1)
            if tryCreateToggles() then break end
            task.wait(0.1)
        end
        if not togglesCreated then
            warn("[CarNotifier] Não encontrou VeiculoTab para criar toggles automaticamente.")
        end
    end)
end

-- FUNÇÃO: mostrar notificação (SetCore com fallback)
local function showNotification(title, text, duration)
    duration = duration or 4
    local ok = pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration
        })
    end)
    if ok then return end

    -- fallback: GUI simples
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CarNotifierFallback"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 360, 0, 64)
    frame.Position = UDim2.new(0.5, -180, 0.08, 0)
    frame.BackgroundTransparency = 0.25
    frame.Parent = screenGui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -10, 1, -10)
    label.Position = UDim2.new(0, 5, 0, 5)
    label.BackgroundTransparency = 1
    label.Text = (title and (title .. "\n") or "") .. (text or "")
    label.TextWrapped = true
    label.TextScaled = true
    label.Parent = frame

    task.delay(duration, function()
        if screenGui and screenGui.Parent then screenGui:Destroy() end
    end)
end

-- FUNÇÕES para localizar a pasta purchaseblecars (várias tentativas)
local function findPurchaseFolder()
    -- tentativa direta segura com pcall
    local ok, folder = pcall(function()
        if workspace:FindFirstChild("cidade") and workspace.cidade:FindFirstChild("active_locations") then
            local al = workspace.cidade.active_locations
            if al:FindFirstChild("chatarera") and al.chatarera:FindFirstChild("funcionalidad") then
                return al.chatarera.funcionalidad:FindFirstChild("purchaseblecars")
            end
        end
        return nil
    end)
    if ok and folder then return folder end

    -- tenta algumas variações de nomes
    local tries = {
        {"cidade","active_locations","chatarera","funcionalidad","purchaseblecars"},
        {"cidade","active_locations","chatarrera","funcionalidad","purchaseblecars"},
        {"cidade","active_locations","chatarera","funcionalidad","purchaseablecars"},
    }
    for _, path in ipairs(tries) do
        local cur = workspace
        local okpath = true
        for _, name in ipairs(path) do
            cur = cur:FindFirstChild(name)
            if not cur then okpath = false; break end
        end
        if okpath and cur then return cur end
    end

    -- busca global case-insensitive por pastas com nomes parecidos
    local candidates = {"purchaseblecars","purchasablecars","purchaseablecars","purchasecars"}
    for _, inst in ipairs(workspace:GetDescendants()) do
        if inst:IsA("Folder") or inst:IsA("Model") then
            local lname = string.lower(inst.Name or "")
            for _, cand in ipairs(candidates) do
                if lname == cand then
                    return inst
                end
            end
        end
    end
    return nil
end

-- FUNÇÃO: pega uma basepart representativa do model
local function getRepresentativePart(model)
    if not model then return nil end
    if model.PrimaryPart and model.PrimaryPart:IsA("BasePart") then return model.PrimaryPart end
    for _, v in ipairs(model:GetDescendants()) do
        if v:IsA("BasePart") then return v end
    end
    return nil
end

-- FUNÇÃO: teleporta o jogador 5 studs acima do veículo
local function teleportToModel(model)
    if not model then return end
    local rep = getRepresentativePart(model)
    if not rep then return end
    local char = player.Character or player.CharacterAdded:Wait()
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    pcall(function()
        char.HumanoidRootPart.CFrame = rep.CFrame + Vector3.new(0, 5, 0)
        char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
    end)
end

-- FUNÇÃO: processa um model (sobe até o model raiz dentro da pasta e pega o nome do model raiz)
local purchaseableFolderRef = nil -- preenchido quando folder encontrado
local function processCarModel(model)
    if not model then return end

    -- encontra o model raiz que está diretamente dentro da pasta (se possível)
    local rootModel = model
    -- sobe até o ancestor cujo pai é a pasta alvo (se souber a pasta)
    if purchaseableFolderRef then
        while rootModel.Parent and rootModel.Parent ~= purchaseableFolderRef and rootModel.Parent:IsA("Model") do
            rootModel = rootModel.Parent
        end
    else
        -- sem pasta conhecida, sobe até não haver parent Model
        while rootModel.Parent and rootModel.Parent:IsA("Model") do
            rootModel = rootModel.Parent
        end
    end

    if not rootModel:IsA("Model") then return end
    if processed[rootModel] then return end

    -- esperar por uma parte representativa
    local rep = getRepresentativePart(rootModel)
    local tries = 0
    while not rep and tries < 20 do
        task.wait(0.05)
        rep = getRepresentativePart(rootModel)
        tries = tries + 1
    end
    if not rep then
        processed[rootModel] = true
        return
    end

    processed[rootModel] = true
    local carName = rootModel.Name or "<Veículo sem nome>"

    if notifyEnabled then
        showNotification("🚗 Novo Veículo!", carName .. " spawnou!", 5)
    end
    if teleportEnabled then
        task.delay(0.06, function() teleportToModel(rootModel) end)
    end

    print("[CarNotifier] Detectado:", carName, "Model:", rootModel:GetFullName())
end

-- MONITOR: conecta listeners à pasta (com fallback para buscar periodicamente se pasta não existir)
local function monitorFolder(folder)
    if not folder then
        -- tenta localizar periodicamente até encontrar
        task.spawn(function()
            while not purchaseableFolderRef do
                local f = findPurchaseFolder()
                if f then
                    purchaseableFolderRef = f
                    monitorFolder(f)
                    return
                end
                task.wait(1)
            end
        end)
        return
    end

    purchaseableFolderRef = folder
    print("[CarNotifier] Monitorando pasta:", folder:GetFullName())

    -- processa já existentes
    for _, child in ipairs(folder:GetChildren()) do
        task.delay(0.04, function()
            if child:IsA("Model") then processCarModel(child)
            else
                local ancestor = child:FindFirstAncestorOfClass("Model")
                if ancestor and ancestor.Parent == folder then processCarModel(ancestor) end
            end
        end)
    end

    -- conecta adição direta de filhos
    folder.ChildAdded:Connect(function(child)
        task.delay(0.04, function()
            if child:IsA("Model") then processCarModel(child)
            else
                local ancestor = child:FindFirstAncestorOfClass("Model")
                if ancestor and ancestor.Parent == folder then processCarModel(ancestor) end
            end
        end)
    end)

    -- cobre casos de DescendantAdded (reparent, partes adicionadas primeiro etc)
    folder.DescendantAdded:Connect(function(desc)
        task.delay(0.04, function()
            local ancestor = desc:FindFirstAncestorOfClass("Model")
            if ancestor and ancestor:IsDescendantOf(folder) then processCarModel(ancestor) end
        end)
    end)
end

-- start
local root = findPurchaseFolder()
monitorFolder(root)

-- DEBUG: tenta criar toggles mais uma vez a cada 1s caso ainda não tenham sido criados
task.spawn(function()
    while not togglesCreated do
        tryCreateToggles()
        task.wait(1)
    end
end)

local CreditsTab = Window:CreateTab("Credits", 4483362458) -- Title, Image

local Label = CreditsTab:CreateLabel("HUB BY: OfficialPatozoid", 4483362458, Color3.fromRGB(255, 255, 255),false) -- Title, Icon, Color, IgnoreTheme

local Label = CreditsTab:CreateLabel("Channel On YT:@OfficialPatozoid4", 1275974022, Color3.fromRGB(235, 11, 7), false) -- Title, Icon, Color, IgnoreTheme

local Button = CreditsTab:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        local discordLink = "https://discord.gg/7dkp6uhYNb"
        pcall(function()
            setclipboard(discordLink)
        end)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Discord",
            Text = "Link copiado para a área de transferência!",
            Duration = 3
        })
    end,
})



