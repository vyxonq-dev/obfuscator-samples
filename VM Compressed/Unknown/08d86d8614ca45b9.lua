-- Menu Spin Lucy e Exploits, com Noclip, Fly funcional, menu Style e Infinite Awaken/AwakeningBar

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Spin = ReplicatedStorage.Packages.Knit.Services.StyleService.RE.Spin
local SetTargetRollStyle = ReplicatedStorage.Packages.Knit.Services.StyleService.RF.SetTargetRollStyle

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/lates-lib/main/Main.lua"))()
local Window = Library:CreateWindow({
    Title = "Spin Lucy & Exploits",
    Theme = "Dark",
    Size = UDim2.fromOffset(440, 420),
    Transparency = 0.2,
    Blurring = true,
    MinimizeKeybind = Enum.KeyCode.LeftAlt,
})

-- Função para abrir menu de digitar nome do style (local)
local function openStyleMenu()
    -- Evita múltiplos menus
    if game.CoreGui:FindFirstChild("StyleChanger") then
        game.CoreGui.StyleChanger:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "StyleChanger"
    ScreenGui.Parent = game.CoreGui

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 280, 0, 120)
    Frame.Position = UDim2.new(0.5, -140, 0.5, -60)
    Frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Trocar Style (local)"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 18
    Title.TextColor3 = Color3.fromRGB(255,255,255)
    Title.Parent = Frame

    local TextBox = Instance.new("TextBox")
    TextBox.Size = UDim2.new(1, -20, 0, 40)
    TextBox.Position = UDim2.new(0, 10, 0, 40)
    TextBox.Text = ""
    TextBox.PlaceholderText = "Digite o nome do Style"
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 18
    TextBox.TextColor3 = Color3.fromRGB(255,255,255)
    TextBox.BackgroundColor3 = Color3.fromRGB(60,60,60)
    TextBox.BorderSizePixel = 0
    TextBox.Parent = Frame

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0.5, -15, 0, 28)
    Button.Position = UDim2.new(0, 10, 1, -36)
    Button.BackgroundColor3 = Color3.fromRGB(70,130,180)
    Button.Text = "Equipar Style"
    Button.TextColor3 = Color3.fromRGB(255,255,255)
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 16
    Button.BorderSizePixel = 0
    Button.Parent = Frame

    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Size = UDim2.new(0.5, -15, 0, 28)
    CloseBtn.Position = UDim2.new(0.5, 5, 1, -36)
    CloseBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
    CloseBtn.Text = "Fechar"
    CloseBtn.TextColor3 = Color3.fromRGB(255,255,255)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 16
    CloseBtn.BorderSizePixel = 0
    CloseBtn.Parent = Frame

    Button.MouseButton1Click:Connect(function()
        local style = TextBox.Text
        if style ~= "" then
            local stat = nil
            if player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("Style") then
                stat = player.PlayerStats.Style
            elseif player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Style") then
                stat = player.leaderstats.Style
            end
            if stat then
                stat.Value = style
                Button.Text = "Equipado!"
                wait(1)
                Button.Text = "Equipar Style"
            else
                Button.Text = "Falha!"
                wait(1)
                Button.Text = "Equipar Style"
            end
        end
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end

-- Spin Lucy Tab (igual antes)
Window:AddTabSection({ Name = "Spin Lucy", Order = 1 })
local TabSpinLucy = Window:AddTab({
    Title = "Spin Lucy",
    Section = "Spin Lucy",
    Icon = "rbxassetid://11963373994"
})
Window:AddSection({ Name = "Spin Lucy", Tab = TabSpinLucy })

local selecionados = {}

Window:AddDropdown({
    Title = "Parar em qual estilo?",
    Description = "Selecione um ou mais estilos para o auto spin parar quando conseguir.",
    Tab = TabSpinLucy,
    Options = {
        ["Chris Prince"] = "Chris Prince",
        ["Loki"] = "Loki",
        ["Noel Noah"] = "Noel Noah",
        ["Lavinho"] = "Lavinho",
    },
    Multi = true,
    Callback = function(selectedList)
        selecionados = selectedList
        local listaStr = ""
        for _, v in pairs(selecionados) do
            if #listaStr > 0 then
                listaStr = listaStr .. ", "
            end
            listaStr = listaStr .. tostring(v)
        end
        Window:Notify({
            Title = "Lista atualizada",
            Description = "Estilos para parar: " .. (listaStr ~= "" and listaStr or "Nenhum"),
            Duration = 2
        })
    end,
})

local autoSpinAtivo = false
local velocidade = 1

local function TableToArray(tab)
    local arr = {}
    for _, v in pairs(tab) do
        table.insert(arr, v)
    end
    return arr
end

Window:AddButton({
    Title = "Girar Spin Lucy",
    Description = "Clique para girar o Spin Lucy (Lucky Spin) 1 vez",
    Tab = TabSpinLucy,
    Callback = function()
        local args = { [1] = true }
        Spin:FireServer(unpack(args))
        Window:Notify({
            Title = "Spin Lucy",
            Description = "Spin Lucy enviado!",
            Duration = 2
        })
    end,
})

Window:AddToggle({
    Title = "Auto Spin Lucy",
    Description = "Ative para girar o Spin Lucy automaticamente",
    Tab = TabSpinLucy,
    Callback = function(state)
        autoSpinAtivo = state
        if state then
            Window:Notify({
                Title = "Auto Spin Lucy",
                Description = "Auto Spin Lucy ativado!",
                Duration = 2
            })
            spawn(function()
                local ultimoEstilo = nil
                while not (player.leaderstats and player.leaderstats:FindFirstChild("Style")) do
                    wait(0.2)
                end
                pcall(function()
                    ultimoEstilo = player.leaderstats.Style.Value
                end)
                while autoSpinAtivo do
                    local arrEstilos = TableToArray(selecionados)
                    for _, estilo in ipairs(arrEstilos) do
                        pcall(function()
                            SetTargetRollStyle:InvokeServer(estilo)
                        end)
                        wait(0.1)
                    end
                    local args = { [1] = true }
                    Spin:FireServer(unpack(args))
                    local encontrou = false
                    local timeout = 10
                    local tempo = 0
                    repeat
                        wait(0.2)
                        tempo = tempo + 0.2
                        local estiloAtual = nil
                        pcall(function()
                            estiloAtual = player.leaderstats.Style.Value
                        end)
                        if estiloAtual and estiloAtual ~= ultimoEstilo then
                            for _, alvo in ipairs(arrEstilos) do
                                if tostring(estiloAtual) == tostring(alvo) then
                                    Window:Notify({
                                        Title = "Parou!",
                                        Description = "Você pegou: " .. tostring(estiloAtual),
                                        Duration = 5
                                    })
                                    autoSpinAtivo = false
                                    encontrou = true
                                    break
                                end
                            end
                            ultimoEstilo = estiloAtual
                        end
                    until encontrou or not autoSpinAtivo or tempo >= timeout
                    if encontrou then break end
                    wait(velocidade)
                end
            end)
        else
            Window:Notify({
                Title = "Auto Spin Lucy",
                Description = "Auto Spin Lucy desativado!",
                Duration = 2
            })
        end
    end,
})

Window:AddSlider({
    Title = "Velocidade do Auto Spin",
    Description = "Tempo em segundos entre cada giro (mín 0.1s, máx 5s)",
    Tab = TabSpinLucy,
    MinValue = 0.1,
    MaxValue = 5,
    AllowDecimals = true,
    Default = 1,
    Callback = function(value)
        velocidade = value
    end,
})

Window:AddParagraph({
    Title = "Como usar?",
    Description = "• Selecione um ou mais estilos na lista.\n• Ative o Auto Spin para girar automaticamente.\n• O script para sozinho ao ganhar um dos estilos desejados!",
    Tab = TabSpinLucy
})

-- Exploits Tab
Window:AddTabSection({ Name = "Exploits", Order = 2 })
local TabExploits = Window:AddTab({
    Title = "Exploits",
    Section = "Exploits",
    Icon = "rbxassetid://11963373994"
})
Window:AddSection({ Name = "Exploits", Tab = TabExploits })

-- Noclip variables
local NoclipOn = false
local NoclipConn

local function EnableNoclip()
    if NoclipConn then NoclipConn:Disconnect() end
    NoclipConn = game:GetService("RunService").Stepped:Connect(function()
        if NoclipOn and player.Character and player.Character:FindFirstChild("Humanoid") then
            for _,part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide == true and part.Name ~= "HumanoidRootPart" then
                    part.CanCollide = false
                end
            end
        end
    end)
end

local function DisableNoclip()
    if NoclipConn then NoclipConn:Disconnect() NoclipConn = nil end
    if player.Character then
        for _,part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- FLY variables
local FlyOn = false
local FlyConn, FlyGyro, FlyVel, FlyTouchGui, FlyTouchUp, FlyTouchDown, FlyInputConn, FlyInputEndConn

local function EnableFly()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end
    local HRP = player.Character.HumanoidRootPart

    -- Criar BodyGyro e BodyVelocity
    FlyGyro = Instance.new("BodyGyro")
    FlyGyro.P = 9e4
    FlyGyro.Parent = HRP
    FlyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
    FlyGyro.CFrame = HRP.CFrame

    FlyVel = Instance.new("BodyVelocity")
    FlyVel.Velocity = Vector3.new(0,0,0)
    FlyVel.MaxForce = Vector3.new(9e9, 9e9, 9e9)
    FlyVel.Parent = HRP

    -- Controle de direção
    local speed = 55
    local moveForward = false
    local moveBack = false
    local moveLeft = false
    local moveRight = false
    local moveUp = false
    local moveDown = false

    -- Mobile touch buttons
    local function CreateTouchButton(name, pos, txt)
        local btn = Instance.new("TextButton")
        btn.Name = name
        btn.Size = UDim2.new(0, 60, 0, 60)
        btn.Position = pos
        btn.Text = txt
        btn.BackgroundTransparency = 0.3
        btn.BackgroundColor3 = Color3.fromRGB(60,60,60)
        btn.TextColor3 = Color3.new(1,1,1)
        btn.TextScaled = true
        btn.Parent = game:GetService("CoreGui")
        btn.Visible = true
        return btn
    end

    if UserSettings():IsUserFeatureEnabled("UserHasTouchInput") or (game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").KeyboardEnabled) then
        FlyTouchGui = Instance.new("ScreenGui")
        FlyTouchGui.Name = "FlyTouchGui"
        FlyTouchGui.Parent = game:GetService("CoreGui")

        FlyTouchUp = CreateTouchButton("FlyUp", UDim2.new(1, -70, 1, -200), "▲")
        FlyTouchDown = CreateTouchButton("FlyDown", UDim2.new(1, -70, 1, -130), "▼")
        FlyTouchUp.Parent = FlyTouchGui
        FlyTouchDown.Parent = FlyTouchGui

        FlyTouchUp.MouseButton1Down:Connect(function() moveUp = true end)
        FlyTouchUp.MouseButton1Up:Connect(function() moveUp = false end)
        FlyTouchDown.MouseButton1Down:Connect(function() moveDown = true end)
        FlyTouchDown.MouseButton1Up:Connect(function() moveDown = false end)
    end

    FlyConn = game:GetService("RunService").RenderStepped:Connect(function()
        local cam = workspace.CurrentCamera
        local cf = cam.CFrame
        FlyGyro.CFrame = cf
        local vel = Vector3.new()
        if moveForward then vel = vel + (cf.LookVector * speed) end
        if moveBack    then vel = vel - (cf.LookVector * speed) end
        if moveLeft    then vel = vel - (cf.RightVector * speed) end
        if moveRight   then vel = vel + (cf.RightVector * speed) end
        if moveUp      then vel = vel + Vector3.new(0,speed,0) end
        if moveDown    then vel = vel - Vector3.new(0,speed,0) end
        FlyVel.Velocity = vel
    end)

    -- Input para PC
    local UIS = game:GetService("UserInputService")
    FlyInputConn = UIS.InputBegan:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Enum.KeyCode.W then moveForward = true end
        if input.KeyCode == Enum.KeyCode.S then moveBack    = true end
        if input.KeyCode == Enum.KeyCode.A then moveLeft    = true end
        if input.KeyCode == Enum.KeyCode.D then moveRight   = true end
        if input.KeyCode == Enum.KeyCode.E then moveUp      = true end
        if input.KeyCode == Enum.KeyCode.Q then moveDown    = true end
        if input.KeyCode == Enum.KeyCode.Up   then moveForward = true end
        if input.KeyCode == Enum.KeyCode.Down then moveBack    = true end
        if input.KeyCode == Enum.KeyCode.Left then moveLeft    = true end
        if input.KeyCode == Enum.KeyCode.Right then moveRight  = true end
        if input.KeyCode == Enum.KeyCode.Space then moveUp     = true end
        if input.KeyCode == Enum.KeyCode.LeftControl then moveDown = true end
    end)
    FlyInputEndConn = UIS.InputEnded:Connect(function(input, gpe)
        if gpe then return end
        if input.KeyCode == Enum.KeyCode.W then moveForward = false end
        if input.KeyCode == Enum.KeyCode.S then moveBack    = false end
        if input.KeyCode == Enum.KeyCode.A then moveLeft    = false end
        if input.KeyCode == Enum.KeyCode.D then moveRight   = false end
        if input.KeyCode == Enum.KeyCode.E then moveUp      = false end
        if input.KeyCode == Enum.KeyCode.Q then moveDown    = false end
        if input.KeyCode == Enum.KeyCode.Up   then moveForward = false end
        if input.KeyCode == Enum.KeyCode.Down then moveBack    = false end
        if input.KeyCode == Enum.KeyCode.Left then moveLeft    = false end
        if input.KeyCode == Enum.KeyCode.Right then moveRight  = false end
        if input.KeyCode == Enum.KeyCode.Space then moveUp     = false end
        if input.KeyCode == Enum.KeyCode.LeftControl then moveDown = false end
    end)

    Window:Notify({
        Title = "Fly",
        Description = "Fly ativado! Use WASD/E/Q/setas/espaco/ctrl ou toque ▲ ▼ (mobile)",
        Duration = 5
    })
end

local function DisableFly()
    if FlyConn then FlyConn:Disconnect() FlyConn = nil end
    if FlyInputConn then FlyInputConn:Disconnect() FlyInputConn = nil end
    if FlyInputEndConn then FlyInputEndConn:Disconnect() FlyInputEndConn = nil end
    if FlyGyro then FlyGyro:Destroy() FlyGyro = nil end
    if FlyVel then FlyVel:Destroy() FlyVel = nil end
    if FlyTouchGui then FlyTouchGui:Destroy() FlyTouchGui = nil end
    FlyTouchGui, FlyTouchUp, FlyTouchDown = nil, nil, nil
    Window:Notify({ Title = "Fly", Description = "Fly desativado!", Duration = 2 })
end

-- Infinite Awakening
local InfiniteAwakeningOn = false
local InfiniteAwakenThread
local InfiniteAwakeningBarOn = false
local InfiniteAwakenBarThread

local function ToggleInfiniteAwakening()
    InfiniteAwakeningOn = not InfiniteAwakeningOn
    if InfiniteAwakeningOn then
        InfiniteAwakenThread = task.spawn(function()
            while InfiniteAwakeningOn do
                pcall(function()
                    if player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("InAwakening") then
                        player.PlayerStats.InAwakening.Value = true
                    end
                end)
                task.wait(0.1)
            end
        end)
        Window:Notify({Title="Infinite Awakening", Description="InAwakening infinito ativado!", Duration=2})
    else
        Window:Notify({Title="Infinite Awakening", Description="InAwakening infinito desativado!", Duration=2})
    end
end

local function ToggleInfiniteAwakeningBar()
    InfiniteAwakeningBarOn = not InfiniteAwakeningBarOn
    if InfiniteAwakeningBarOn then
        InfiniteAwakenBarThread = task.spawn(function()
            while InfiniteAwakeningBarOn do
                pcall(function()
                    if player:FindFirstChild("PlayerStats") and player.PlayerStats:FindFirstChild("AwakeningBar") then
                        player.PlayerStats.AwakeningBar.Value = 999999
                    end
                end)
                task.wait(0.1)
            end
        end)
        Window:Notify({Title="Infinite AwakeningBar", Description="AwakeningBar infinito ativado!", Duration=2})
    else
        Window:Notify({Title="Infinite AwakeningBar", Description="AwakeningBar infinito desativado!", Duration=2})
    end
end

-- Exploits reais e fake Exploits
Window:AddDropdown({
    Title = "Opções Exploits",
    Description = "Selecione um exploit para executar.",
    Tab = TabExploits,
    Options = {
        ["Auto Farm"] = "Auto Farm",
        ["Fly"] = "Fly",
        ["ESP"] = "ESP",
        ["No Clip"] = "No Clip",
        ["Speed Hack"] = "Speed Hack",
        ["Teleport"] = "Teleport",
        ["Godmode"] = "Godmode",
        ["Kill Aura"] = "Kill Aura",
        ["Infinite Jump"] = "Infinite Jump",
        ["Equipar Style pelo nome"] = "equip_style_by_name",
        ["Infinito Awakening"] = "infinite_awakening",
        ["Infinito AwakeningBar"] = "infinite_awakeningbar",
    },
    Multi = false,
    Callback = function(selectedExploit)
        if selectedExploit == "equip_style_by_name" then
            openStyleMenu()
        elseif selectedExploit == "No Clip" then
            NoclipOn = not NoclipOn
            if NoclipOn then
                EnableNoclip()
                Window:Notify({
                    Title = "NoClip",
                    Description = "NoClip ativado! Para desativar, selecione No Clip de novo.",
                    Duration = 3
                })
            else
                DisableNoclip()
                Window:Notify({
                    Title = "NoClip",
                    Description = "NoClip desativado!",
                    Duration = 2
                })
            end
        elseif selectedExploit == "Fly" then
            FlyOn = not FlyOn
            if FlyOn then
                EnableFly()
            else
                DisableFly()
            end
        elseif selectedExploit == "infinite_awakening" then
            ToggleInfiniteAwakening()
        elseif selectedExploit == "infinite_awakeningbar" then
            ToggleInfiniteAwakeningBar()
        else
            Window:Notify({
                Title = "Exploit",
                Description = "Executando: " .. selectedExploit,
                Duration = 2
            })
        end
    end,
})

Window:AddButton({
    Title = "Exploiting",
    Description = "Clique para digitar o nome do style e equipar instantaneamente.",
    Tab = TabExploits,
    Callback = openStyleMenu
})

Window:AddParagraph({
    Title = "Sobre Exploits",
    Description = "• Use Exploiting para abrir menu e equipar qualquer style local.\n• 'Fly' e 'No Clip' são funcionais (Fly: WASD/E/Q/setas/espaco/ctrl ou ▲▼ mobile).\n• Infinito Awakening mantém modo e barra sempre ativos.",
    Tab = TabExploits
})