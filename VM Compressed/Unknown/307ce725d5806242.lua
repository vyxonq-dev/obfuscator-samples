--// BIBLIOTECAS
local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local ZixyESP = loadstring(game:HttpGet('https://raw.githubusercontent.com/zixypy/zixyx/refs/heads/main/zixyesp.txt'))()
local esp = ZixyESP.new()

--// AMBIENTE DO AIMBOT
getgenv().Aimbot = {}
local Environment = getgenv().Aimbot
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local RequiredDistance, Typing, Running, ServiceConnections = 2000, false, false, {}

Environment.Settings = {
    Enabled = true,
    TeamCheck = false,
    AliveCheck = true,
    WallCheck = false,
    Sensitivity = 0,
    TriggerKey = "Q", 
    Toggle = false,
    LockPart = "Head",
    AutoShoot = false,
    IgnoredPlayers = {} -- Tabela de jogadores ignorados (Whitelist)
}

Environment.FOVSettings = {
    Enabled = true,
    Visible = true,
    Amount = 90,
    Color = Color3.fromRGB(255, 255, 255),
    LockedColor = Color3.fromRGB(255, 70, 70),
    Transparency = 0.5,
    Sides = 60,
    Thickness = 1,
    Filled = false
}

Environment.FOVCircle = Drawing.new("Circle")

--// FUNÇÃO PARA PEGAR NOMES DOS JOGADORES (PARA A UI)
local function GetPlayerNames()
    local names = {}
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then
            table.insert(names, v.Name)
        end
    end
    table.sort(names)
    return names
end

--// DETECÇÃO DE DIGITAÇÃO
UserInputService.TextBoxFocused:Connect(function() Typing = true end)
UserInputService.TextBoxFocusReleased:Connect(function() Typing = false end)

--// FUNÇÕES CORE
local function CancelLock()
    Environment.Locked = nil
    Environment.FOVCircle.Color = Environment.FOVSettings.Color
end

local function GetClosestPlayer()
    if not Environment.Locked then
        RequiredDistance = (Environment.FOVSettings.Enabled and Environment.FOVSettings.Amount or 2000)
        local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

        for _, v in next, Players:GetPlayers() do
            if v ~= LocalPlayer then
                -- CHECK: Ignorar se estiver na Whitelist
                if Environment.Settings.IgnoredPlayers[v.Name] then continue end
                
                if v.Character and v.Character:FindFirstChild(Environment.Settings.LockPart) then
                    if Environment.Settings.TeamCheck and v.Team == LocalPlayer.Team then continue end
                    if Environment.Settings.AliveCheck and v.Character:FindFirstChildOfClass("Humanoid").Health <= 0 then continue end
                    if Environment.Settings.WallCheck and #(Camera:GetPartsObscuringTarget({v.Character[Environment.Settings.LockPart].Position}, v.Character:GetDescendants())) > 0 then continue end

                    local Vector, OnScreen = Camera:WorldToViewportPoint(v.Character[Environment.Settings.LockPart].Position)
                    local Distance = (Center - Vector2.new(Vector.X, Vector.Y)).Magnitude

                    if Distance < RequiredDistance and OnScreen then
                        RequiredDistance = Distance
                        Environment.Locked = v
                    end
                end
            end
        end
    end
end

--// AUTO SHOOT LOGIC
local function AutoShoot()
    if Environment.Settings.AutoShoot and Environment.Locked and not Typing then
        local targetPos = Environment.Locked.Character[Environment.Settings.LockPart].Position
        local parts = Camera:GetPartsObscuringTarget({targetPos}, Environment.Locked.Character:GetDescendants())
        
        if #parts == 0 then
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
            task.wait(0.01)
            game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
        end
    end
end

--// REFRESH CHAMS
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        if esp.State.ChamsEnabled then
            task.wait(1)
            esp:InitiateChams(esp.Config.ChamsColor)
        end
    end)
end)

--// MAIN LOOP
local function LoadAimbot()
    ServiceConnections.RenderSteppedConnection = RunService.RenderStepped:Connect(function()
        local Center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

        if Environment.FOVSettings.Enabled and Environment.Settings.Enabled then
            Environment.FOVCircle.Radius = Environment.FOVSettings.Amount
            Environment.FOVCircle.Position = Center
            Environment.FOVCircle.Visible = Environment.FOVSettings.Visible
            Environment.FOVCircle.Color = Environment.FOVSettings.Color
        else
            Environment.FOVCircle.Visible = false
        end

        if Running and Environment.Settings.Enabled and not Typing then
            GetClosestPlayer()
            if Environment.Locked then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Environment.Locked.Character[Environment.Settings.LockPart].Position)
                Environment.FOVCircle.Color = Environment.FOVSettings.LockedColor
                AutoShoot()
            end
        end
    end)

    ServiceConnections.InputBegan = UserInputService.InputBegan:Connect(function(Input)
        if not Typing and Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
            if Environment.Settings.Toggle then Running = not Running else Running = true end
            if not Running then CancelLock() end
        end
    end)

    ServiceConnections.InputEnded = UserInputService.InputEnded:Connect(function(Input)
        if not Typing and not Environment.Settings.Toggle and Input.KeyCode == Enum.KeyCode[Environment.Settings.TriggerKey] then
            Running = false; CancelLock()
        end
    end)
end

LoadAimbot()

--// JANELA UI (PORSCHE HUB)
local Window = Library:CreateWindow({
    Title = 'Porsche Hub',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2,
})

local Tabs = {
    Visuals = Window:AddTab('Visuals'),
    Aimbot = Window:AddTab('Aimbot'),
    Settings = Window:AddTab('Settings'),
}

--// ESP CONTROLS
local VisualsGroup = Tabs.Visuals:AddLeftGroupbox('ESP Controls')
VisualsGroup:AddToggle('BoxESPToggle', { Text = 'Box ESP', Default = false, Callback = function(V) if V then esp:InitiateBox(Color3.new(0.4, 0.35, 0.7)) else esp.State.BoxEnabled = false end end })
VisualsGroup:AddLabel('Box Color'):AddColorPicker('BoxColorPicker', { Default = Color3.new(0.4, 0.35, 0.7), Callback = function(V) esp.Config.BoxColor = V end })
VisualsGroup:AddToggle('NameESPToggle', { Text = 'Name ESP', Default = false, Callback = function(V) esp:InitiateName(V) end })
VisualsGroup:AddToggle('DistanceESPToggle', { Text = 'Distance ESP', Default = false, Callback = function(V) esp:InitiateDistance(V) end })
VisualsGroup:AddToggle('SkeletonESPToggle', { Text = 'Skeleton ESP', Default = false, Callback = function(V) if V then esp:InitiateSkeleton(Color3.new(0.4, 0.35, 0.7)) else esp.State.SkeletonEnabled = false end end })
VisualsGroup:AddToggle('HealthTextESPToggle', { Text = 'Health Text ESP', Default = false, Callback = function(V) esp:InitiateHealthText(V) end })
VisualsGroup:AddToggle('HealthBarESPToggle', { Text = 'Health Bar ESP', Default = false, Callback = function(V) esp:InitiateHealthBar(V) end })
VisualsGroup:AddToggle('TracerESPToggle', { Text = 'Tracer ESP', Default = false, Callback = function(V) if V then esp:InitiateTracer(Color3.new(0.4, 0.35, 0.7), esp.Config.TracerOrigin) else esp.State.TracerEnabled = false end end })
VisualsGroup:AddDropdown('TracerOriginDropdown', { Text = 'Tracer Origin', Default = 'Bottom Screen', Values = {'Bottom Screen', 'Cursor', 'Top Screen'}, Callback = function(V) esp.Config.TracerOrigin = V end })
VisualsGroup:AddToggle('ChamsToggle', { Text = 'Chams', Default = false, Callback = function(V) if V then esp:InitiateChams(Color3.new(1, 0, 0)) else esp.State.ChamsEnabled = false end end })
VisualsGroup:AddToggle('TeamCheckToggle', { Text = 'Team Check', Default = true, Callback = function(V) esp:TeamCheck(V) end })
VisualsGroup:AddSlider('ESPDistanceSlider', { Text = 'ESP Distance', Default = 325, Min = 100, Max = 1000, Rounding = 0, Suffix = ' studs', Callback = function(V) esp:SetDistance(V) end })

--// AIMBOT CONTROLS
local AimbotGroup = Tabs.Aimbot:AddLeftGroupbox('Aimbot Controls')
AimbotGroup:AddToggle('AimbotToggle', { Text = 'Enable Aimbot', Default = true, Callback = function(V) Environment.Settings.Enabled = V end })
AimbotGroup:AddToggle('AutoShootToggle', { Text = 'Auto shoot', Default = false, Callback = function(V) Environment.Settings.AutoShoot = V end })
AimbotGroup:AddToggle('AimbotTeamCheck', { Text = 'Team Check', Default = false, Callback = function(V) Environment.Settings.TeamCheck = V end })
AimbotGroup:AddToggle('AimbotAliveCheck', { Text = 'Alive Check', Default = true, Callback = function(V) Environment.Settings.AliveCheck = V end })
AimbotGroup:AddToggle('AimbotWallCheck', { Text = 'Wall Check', Default = false, Callback = function(V) Environment.Settings.WallCheck = V end })
AimbotGroup:AddToggle('AimbotToggleMode', { Text = 'Toggle Mode', Default = false, Callback = function(V) Environment.Settings.Toggle = V end })
AimbotGroup:AddDropdown('AimbotLockPart', { Text = 'Lock Part', Default = 'Head', Values = {'Head', 'HumanoidRootPart', 'Torso'}, Callback = function(V) Environment.Settings.LockPart = V end })
AimbotGroup:AddDropdown('AimbotTriggerKey', { Text = 'Trigger Key', Default = 'Q', Values = {'Q', 'E', 'R', 'F', 'C', 'V', 'Z', 'LeftAlt'}, Callback = function(V) Environment.Settings.TriggerKey = V end })

--// NOVO: WHITELIST (QUEM NÃO ATIRAR)
local WhitelistGroup = Tabs.Aimbot:AddRightGroupbox('Aimbot Whitelist')

WhitelistGroup:AddDropdown('WhitelistPlayers', {
    Text = 'Selecionar quem não atirar',
    Default = '',
    Multi = true, -- Permite selecionar vários
    Values = GetPlayerNames(),
    Callback = function(Values)
        Environment.Settings.IgnoredPlayers = Values
    end
})

WhitelistGroup:AddButton({
    Text = 'Atualizar Lista de Jogadores',
    Func = function()
        Options.WhitelistPlayers:SetValues(GetPlayerNames())
    end,
    DoubleClick = false,
    Tooltip = 'Clique para atualizar os nomes dos jogadores na lista'
})

-- FOV GROUP
local FOVGroup = Tabs.Aimbot:AddRightGroupbox('FOV Settings')
FOVGroup:AddToggle('FOVVisible', { Text = 'Show FOV', Default = true, Callback = function(V) Environment.FOVSettings.Visible = V end })
FOVGroup:AddSlider('FOVAmount', { Text = 'FOV Amount', Default = 90, Min = 10, Max = 500, Rounding = 0, Callback = function(V) Environment.FOVSettings.Amount = V end })

--// MENU CONFIG
local SettingsGroup = Tabs.Settings:AddLeftGroupbox('Menu Config')
SettingsGroup:AddButton({
    Text = 'X - DESTROY SCRIPT',
    Func = function()
        for _, v in next, ServiceConnections do v:Disconnect() end
        if Environment.FOVCircle then Environment.FOVCircle:Remove() end
        esp:Destroy()
        Library:Unload()
    end,
})

SettingsGroup:AddLabel('Minimizar Bind'):AddKeyPicker('MenuKeybind', {
    Text = 'Menu keybind:',
    Default = 'LeftControl',
    NoUI = true,
})

-- INICIALIZAÇÃO
esp:Initialize()
Library.ToggleKeybind = Options.MenuKeybind
Library:SetWatermarkVisibility(false)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

Library:Notify('Porsche Hub Ativado - Use LeftControl para Minimizar', 5)
