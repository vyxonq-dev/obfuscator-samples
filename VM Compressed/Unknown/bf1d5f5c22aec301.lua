-- [[ R7 HUB | SUPREME V7 - VERSÃO COMPLETA ]]
local LinkDoPastebin = "https://pastebin.com/raw/1A9icKkZ" 
local StartTime = os.time()
local DiscordLink = "https://discord.gg/kzfaMjnNQ"
local RunService = game:GetService("RunService")

-- Sincronização de Chave
local ChaveAtiva = "6314" 
pcall(function()
    local res = game:HttpGet(LinkDoPastebin)
    if res then 
        ChaveAtiva = res:gsub("%s+", "") 
    end
end)

-- [ SISTEMA DE IDENTIFICAÇÃO DE USUÁRIO (ESP AUTOMÁTICO) ]
local LogService = game:GetService("LogService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScriptTag = "RN7_USER_ACTIVE"
local function SetUserTag()
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local tag = Instance.new("StringValue")
    tag.Name = ScriptTag
    tag.Parent = char
end
LocalPlayer.CharacterAdded:Connect(SetUserTag)
SetUserTag()

local function ApplyUserESP(player)
    player.CharacterAdded:Connect(function(char)
        task.wait(1)
        if char:FindFirstChild(ScriptTag) or char:WaitForChild(ScriptTag, 5) then
            local head = char:WaitForChild("Head")
            local billboard = Instance.new("BillboardGui", head)
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.Adornee = head
            billboard.AlwaysOnTop = true
            billboard.ExtentsOffset = Vector3.new(0, 3, 0)
            
            local label = Instance.new("TextLabel", billboard)
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.Text = "USUÁRIO"
            label.TextColor3 = Color3.fromRGB(0, 255, 255)
            label.TextStrokeTransparency = 0
            label.Font = Enum.Font.SourceSansBold
            label.TextSize = 20
        end
    end)
end

for _, p in pairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then ApplyUserESP(p) end
end
Players.PlayerAdded:Connect(ApplyUserESP)

-- [ FUNÇÃO DO SPECTADOR (CÓDIGO NATIVO) ]
local function ExecutarSpectador()
    local SpectateGui = Instance.new("ScreenGui")
    local Button = Instance.new("ImageButton")
    local Bar = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local Next = Instance.new("TextButton")
    local UIGradient = Instance.new("UIGradient")
    local Previous = Instance.new("TextButton")
    local UIGradient_2 = Instance.new("UIGradient")
    local UIGradient_3 = Instance.new("UIGradient")

    SpectateGui.Name = "SpectateGui"
    SpectateGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Button.Name = "Button"
    Button.Parent = SpectateGui
    Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Button.BackgroundTransparency = 0.300
    Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Button.BorderSizePixel = 5
    Button.Position = UDim2.new(0, 0, 0.5, -25)
    Button.Size = UDim2.new(0, 50, 0, 50)
    Button.Image = "http://www.roblox.com/asset/?id=176106970"

    Bar.Name = "Bar"
    Bar.Parent = SpectateGui
    Bar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Bar.BackgroundTransparency = 0.200
    Bar.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Bar.BorderSizePixel = 5
    Bar.Position = UDim2.new(-1, -100, 0.879999995, -50)
    Bar.Size = UDim2.new(0, 200, 0, 50)
    Bar.Visible = true

    Title.Name = "Title"
    Title.Parent = Bar
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Title.Position = UDim2.new(0.275000006, 0, 0, 0)
    Title.Size = UDim2.new(0.449999988, 0, 1, 0)
    Title.Font = Enum.Font.SourceSans
    Title.Text = ""
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextScaled = true
    Title.TextSize = 14.000
    Title.TextWrapped = true

    Next.Name = "Next"
    Next.Parent = Bar
    Next.BackgroundColor3 = Color3.fromRGB(134, 134, 134)
    Next.BorderColor3 = Color3.fromRGB(130, 203, 255)
    Next.BorderSizePixel = 0
    Next.Position = UDim2.new(1, 0, 0, 0)
    Next.Size = UDim2.new(-0.25, 0, 1, 0)
    Next.Font = Enum.Font.SourceSans
    Next.Text = ">"
    Next.TextColor3 = Color3.fromRGB(255, 255, 255)
    Next.TextSize = 48.000

    UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0, Color3.fromRGB(191, 191, 191)), ColorSequenceKeypoint.new(0, Color3.fromRGB(182, 182, 182)), ColorSequenceKeypoint.new(0, Color3.fromRGB(194, 194, 194)), ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)), ColorSequenceKeypoint.new(0, Color3.fromRGB(216, 216, 216)), ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
    UIGradient.Offset = Vector2.new(0, -1.39999998)
    UIGradient.Rotation = 30
    UIGradient.Parent = Next

    Previous.Name = "Previous"
    Previous.Parent = Bar
    Previous.BackgroundColor3 = Color3.fromRGB(134, 134, 134)
    Previous.BorderColor3 = Color3.fromRGB(130, 203, 255)
    Previous.BorderSizePixel = 0
    Previous.Size = UDim2.new(0.25, 0, 1, 0)
    Previous.Font = Enum.Font.SourceSans
    Previous.Text = "<"
    Previous.TextColor3 = Color3.fromRGB(255, 255, 255)
    Previous.TextSize = 48.000

    UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0, Color3.fromRGB(191, 191, 191)), ColorSequenceKeypoint.new(0, Color3.fromRGB(182, 182, 182)), ColorSequenceKeypoint.new(0, Color3.fromRGB(194, 194, 194)), ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)), ColorSequenceKeypoint.new(0, Color3.fromRGB(216, 216, 216)), ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
    UIGradient_2.Offset = Vector2.new(0, -1.39999998)
    UIGradient_2.Rotation = 30
    UIGradient_2.Parent = Previous

    UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(0, Color3.fromRGB(191, 191, 191)), ColorSequenceKeypoint.new(0, Color3.fromRGB(182, 182, 182)), ColorSequenceKeypoint.new(0, Color3.fromRGB(194, 194, 194)), ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)), ColorSequenceKeypoint.new(0, Color3.fromRGB(216, 216, 216)), ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))}
    UIGradient_3.Offset = Vector2.new(0, -1.39999998)
    UIGradient_3.Rotation = 30
    UIGradient_3.Parent = Bar

    local function SJGQKFB_fake_script()
        local script = Instance.new('LocalScript', SpectateGui)
        local cam = game.Workspace.CurrentCamera
        local bar = SpectateGui.Bar
        local title = bar.Title
        local prev = bar.Previous
        local nex = bar.Next
        local button = SpectateGui.Button
        
        local function get()
            for _,v in pairs(game.Players:GetPlayers()) do
                if v.Name == title.Text then return(_) end
            end
        end
        
        local debounce = false
        button.MouseButton1Click:Connect(function()
            if debounce == false then 
                debounce = true
                bar:TweenPosition(UDim2.new(.5,-100,0.88,-50),"In","Linear",1,true)
                pcall(function()
                    title.Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name
                end)
            elseif debounce == true then 
                debounce = false
                pcall(function() cam.CameraSubject = game.Players.LocalPlayer.Character.Humanoid end)
                bar:TweenPosition(UDim2.new(-1,-100,0.88,-50),"In","Linear",1,true)
            end
        end)
        
        prev.MouseButton1Click:Connect(function()
            task.wait(.1)
            local players = game.Players:GetPlayers()
            local num = get()
            if not pcall(function() 
                cam.CameraSubject = players[num-1].Character.Humanoid
            end) then
                cam.CameraSubject = players[#players].Character.Humanoid
            end
            pcall(function()
                title.Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name
            end)
        end)
        
        nex.MouseButton1Click:Connect(function()
            task.wait(.1)
            local players = game.Players:GetPlayers()
            local num = get()
            if not pcall(function() 
                cam.CameraSubject = players[num+1].Character.Humanoid
            end) then
                cam.CameraSubject = players[1].Character.Humanoid
            end
            pcall(function()
                title.Text = game.Players:GetPlayerFromCharacter(cam.CameraSubject.Parent).Name
            end)
        end)
    end
    coroutine.wrap(SJGQKFB_fake_script)()
end

-- [ ANTI-AFK INTERNO ]
task.spawn(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- [ COMANDO GERAL ]
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "R7 HUB",
   LoadingTitle = "Carregando tudo...",
   LoadingSubtitle = "Delta Executor - Controle Ativo",
   ConfigurationSaving = {Enabled = false},
   KeySystem = true,
   KeySettings = {
      Title = "R7 HUB | Segurança",
      Subtitle = "Insira a senha do seu Pastebin",
      Note = "Dono: rn7 | " .. DiscordLink,
      FileName = "osh999_key_v7_update", 
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {ChaveAtiva} 
   }
})

-- [ VARIÁVEIS ]
local Noclip = false
local InfiniteJump = false
local AutoJump = false 
local WalkSpeedValue = 16
local JumpPowerValue = 50
local HitboxEnabled = false
local HitboxSize = 2
local HitboxTeam = false
local ESP_Team = false
local ESP_Config = { Enabled = false, Lines = false, Boxes = false, Distance = false, Weapon = false, Health = false, RGB = false }
local CurrentColor = Color3.fromRGB(138, 43, 226)
local DangerAlert = false
local DangerDistance = 30
local ItemEspEnabled = false

-- NOVAS VARIÁVEIS (NPC & GLITCH)
local NpcHitboxEnabled = false
local NpcHitboxSize = 2
local NpcEspEnabled = false
local SpeedGlitchEnabled = false
local SpeedGlitchValue = 1

-- [ LÓGICA ESP ITENS ]
local function ToggleItemESP(state)
    ItemEspEnabled = state
    task.spawn(function()
        while ItemEspEnabled do
            for _, v in pairs(workspace:GetDescendants()) do
                if (v:IsA("TouchTransmitter") or v:IsA("ClickDetector")) and v.Parent:IsA("BasePart") then
                    local target = v.Parent
                    if not target:FindFirstChild("ItemHighlight") then
                        local hl = Instance.new("Highlight", target)
                        hl.Name = "ItemHighlight"
                        hl.FillColor = Color3.fromRGB(0, 255, 0)
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end
                end
            end
            task.wait(2)
        end
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "ItemHighlight" then v:Destroy() end
        end
    end)
end

-- [ ABA INICIAL ]
local HomeTab = Window:CreateTab("🏠 Início", 4483362458)
local SessionLabel = HomeTab:CreateLabel("Tempo de Sessão: 00:00:00")
local PingLabel = HomeTab:CreateLabel("Ping: Calculando...")
local MapLabel = HomeTab:CreateLabel("Mapa: Carregando...")
local FpsLabel = HomeTab:CreateLabel("FPS: Calculando...")

HomeTab:CreateSection("Informações do Dono")
HomeTab:CreateLabel("Dono: rn7")
HomeTab:CreateButton({
    Name = "Copiar Link do Discord",
    Callback = function()
        setclipboard(DiscordLink)
        Rayfield:Notify({Title = "Sucesso", Content = "Link do Discord copiado!", Duration = 3})
    end
})

HomeTab:CreateSection("Informações do Dispositivo")
HomeTab:CreateLabel("Modelo: " .. game:GetService("UserInputService"):GetPlatform().Name)
HomeTab:CreateLabel("ID do Job: " .. game.JobId)

task.spawn(function()
    pcall(function()
        local mapInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
        MapLabel:Set("Mapa: " .. mapInfo.Name)
    end)

    local frames = 0
    RunService.RenderStepped:Connect(function()
        frames = frames + 1
    end)

    while task.wait(1) do
        local seconds = os.difftime(os.time(), StartTime)
        local h = math.floor(seconds / 3600)
        local m = math.floor((seconds % 3600) / 60)
        local s = seconds % 60
        SessionLabel:Set(string.format("Tempo de Sessão: %02d:%02d:%02d", h, m, s))
        
        local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+"))
        PingLabel:Set("Ping: " .. math.floor(ping) .. " ms")
        
        FpsLabel:Set("FPS: " .. frames)
        frames = 0
    end
end)

-- [ SISTEMAS BASE ]

-- Lógica Noclip
RunService.Stepped:Connect(function()
    if Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
end)

-- LÓGICA DE SPEED E JUMP CORRIGIDA (AGORA APLICA NO JOGADOR)
RunService.Heartbeat:Connect(function()
    if LocalPlayer.Character then
        local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.WalkSpeed = WalkSpeedValue
            if not hum.UseJumpPower then
                hum.UseJumpPower = true
            end
            hum.JumpPower = JumpPowerValue
        end
    end
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJump and game.Players.LocalPlayer.Character then
        local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState("Jumping") end
    end
end)

task.spawn(function()
    while task.wait() do
        if AutoJump and game.Players.LocalPlayer.Character then
            local hum = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum and hum.FloorMaterial ~= Enum.Material.Air and hum.MoveDirection.Magnitude > 0 then
                hum:ChangeState("Jumping")
            end
        end
    end
end)

task.spawn(function()
    local counter = 0
    while task.wait() do
        if ESP_Config.RGB then
            counter = counter + 0.01
            CurrentColor = Color3.fromHSV(counter % 1, 1, 1)
        else
            CurrentColor = Color3.fromRGB(138, 43, 226)
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
                local head = p.Character.Head
                local isTeammate = (p.Team == game.Players.LocalPlayer.Team)
                if HitboxEnabled and (not isTeammate or HitboxTeam) then
                    head.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
                    head.Transparency, head.CanCollide, head.Massless = 0.7, false, true
                else
                    head.Size = Vector3.new(1.2, 1.2, 1.2)
                    head.Transparency, head.CanCollide, head.Massless = 0, true, false
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(1) do
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and not game.Players:GetPlayerFromCharacter(v) then
                local head = v:FindFirstChild("Head")
                if head then
                    if NpcHitboxEnabled then
                        head.Size = Vector3.new(NpcHitboxSize, NpcHitboxSize, NpcHitboxSize)
                        head.Transparency, head.CanCollide, head.Massless = 0.7, false, true
                    else
                        head.Size = Vector3.new(1.2, 1.2, 1.2)
                        head.Transparency, head.CanCollide, head.Massless = 0, true, false
                    end
                    local hl = v:FindFirstChild("NpcHighlight")
                    if NpcEspEnabled then
                        if not hl then
                            hl = Instance.new("Highlight", v)
                            hl.Name = "NpcHighlight"
                        end
                        hl.FillColor = Color3.fromRGB(255, 255, 0)
                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                        hl.FillTransparency = 0.5
                    else
                        if hl then hl:Destroy() end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if SpeedGlitchEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = LocalPlayer.Character.HumanoidRootPart
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.MoveDirection.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (hum.MoveDirection * (SpeedGlitchValue / 10))
            end
        end
    end
end)

-- [ AUTO CLICKER FUNCIONAL V2 ]
local function CriarAutoClicker()
    if game.CoreGui:FindFirstChild("RN7_AutoClicker") then return end
    local Screen = Instance.new("ScreenGui")
    Screen.Name = "RN7_AutoClicker"
    Screen.Parent = game.CoreGui
    
    local Botao = Instance.new("TextButton")
    Botao.Name = "ClickerBtn"
    Botao.Parent = Screen
    Botao.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Botao.Position = UDim2.new(0.8, 0, 0.5, 0)
    Botao.Size = UDim2.new(0, 60, 0, 60)
    Botao.Text = "AC"
    Botao.TextColor3 = Color3.new(1,1,1)
    Botao.TextScaled = true
    Botao.Draggable = true 
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(1, 0)
    Corner.Parent = Botao
    
    local Ativado = false
    Botao.MouseButton1Click:Connect(function()
        Ativado = not Ativado
        if Ativado then
            Botao.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            Botao.Text = "ON"
            task.spawn(function()
                while Ativado do
                    pcall(function()
                        local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                        if tool then
                            tool:Activate()
                        else
                            local vu = game:GetService("VirtualUser")
                            vu:CaptureController()
                            vu:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                            task.wait(0.01)
                            vu:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        else
            Botao.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Botao.Text = "AC"
        end
    end)
end

-- [ MOTOR ESP AVANÇADO ]
local Camera = workspace.CurrentCamera
local function CreateESP(Player)
    local Box = Drawing.new("Square"); Box.Visible = false; Box.Thickness = 1.5; Box.Color = CurrentColor; Box.Filled = false
    local Line = Drawing.new("Line"); Line.Visible = false; Line.Thickness = 1.5; Line.Color = CurrentColor
    local Name = Drawing.new("Text"); Name.Visible = false; Name.Color = Color3.new(1,1,1); Name.Size = 16; Name.Center = true; Name.Outline = true
    local Distance = Drawing.new("Text"); Distance.Visible = false; Distance.Color = Color3.new(1,1,1); Distance.Size = 14; Distance.Center = true; Distance.Outline = true
    local HealthBar = Drawing.new("Square"); HealthBar.Visible = false; HealthBar.Thickness = 1; HealthBar.Filled = true
    local Weapon = Drawing.new("Text"); Weapon.Visible = false; Weapon.Color = Color3.new(1,1,1); Weapon.Size = 14; Weapon.Center = true; Weapon.Outline = true

    local function Updater()
        local Connection
        Connection = RunService.RenderStepped:Connect(function()
            if ESP_Config.Enabled and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Humanoid") and Player ~= LocalPlayer then
                local HRP = Player.Character.HumanoidRootPart
                local Hum = Player.Character.Humanoid
                local Pos, OnScreen = Camera:WorldToViewportPoint(HRP.Position)
                local Dist = (LocalPlayer.Character.HumanoidRootPart.Position - HRP.Position).Magnitude
                
                local TeamCheck = true
                if not ESP_Team and Player.Team == LocalPlayer.Team then TeamCheck = false end

                if OnScreen and TeamCheck then
                    local Size = (Camera:WorldToViewportPoint(HRP.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(HRP.Position + Vector3.new(0, 2.6, 0)).Y)
                    local BoxSize = Vector2.new(Size / 1.5, Size)
                    local BoxPos = Vector2.new(Pos.X - BoxSize.X / 2, Pos.Y - BoxSize.Y / 2)

                    Box.Visible = ESP_Config.Boxes; Box.Size = BoxSize; Box.Position = BoxPos; Box.Color = CurrentColor
                    Line.Visible = ESP_Config.Lines; Line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y); Line.To = Vector2.new(Pos.X, Pos.Y + (BoxSize.Y / 2)); Line.Color = CurrentColor
                    Name.Visible = true; Name.Text = Player.Name; Name.Position = Vector2.new(Pos.X, BoxPos.Y - 20)
                    Distance.Visible = ESP_Config.Distance; Distance.Text = "[ "..math.floor(Dist).."m ]"; Distance.Position = Vector2.new(Pos.X, BoxPos.Y + BoxSize.Y + 5)
                    
                    if ESP_Config.Weapon then
                        local Tool = Player.Character:FindFirstChildOfClass("Tool")
                        Weapon.Visible = true; Weapon.Text = Tool and Tool.Name or "Mãos"; Weapon.Position = Vector2.new(Pos.X, BoxPos.Y + BoxSize.Y + 20)
                    else Weapon.Visible = false end

                    if ESP_Config.Health then
                        HealthBar.Visible = true; HealthBar.Size = Vector2.new(2, (Hum.Health / Hum.MaxHealth) * BoxSize.Y); HealthBar.Position = Vector2.new(BoxPos.X - 5, BoxPos.Y + (BoxSize.Y - HealthBar.Size.Y)); HealthBar.Color = Color3.fromRGB(255 - (255 * (Hum.Health / Hum.MaxHealth)), 255 * (Hum.Health / Hum.MaxHealth), 0)
                    else HealthBar.Visible = false end
                    
                    if DangerAlert and Dist <= DangerDistance then
                        Rayfield:Notify({Title = "⚠️ PERIGO", Content = Player.Name .. " está perto!", Duration = 1})
                    end
                else
                    Box.Visible = false; Line.Visible = false; Name.Visible = false; Distance.Visible = false; HealthBar.Visible = false; Weapon.Visible = false
                end
            else
                Box.Visible = false; Line.Visible = false; Name.Visible = false; Distance.Visible = false; HealthBar.Visible = false; Weapon.Visible = false
                if not Player.Parent then Connection:Disconnect() end
            end
        end)
    end
    coroutine.wrap(Updater)()
end

for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
Players.PlayerAdded:Connect(CreateESP)

-- [[ ABAS ]]

local AimTab = Window:CreateTab("🎯 Aimbot", 4483362458)
AimTab:CreateButton({Name = "Aimbot Principal (DanielHub)", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/DanielHubll/DanielHubll/refs/heads/main/Aimbot%20Mobile"))() end})
AimTab:CreateButton({Name = "Aimbot 1", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/9fkZQbAC"))() end})
AimTab:CreateButton({Name = "Aimbot 2", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/51NxD2za"))() end})
AimTab:CreateButton({Name = "Silent Aim", Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/AqD3B96i"))() end})

local EspTab = Window:CreateTab("👁️ ESP & Visual", 4483362458)
EspTab:CreateSection("Notificações Avançadas")
EspTab:CreateToggle({Name = "⚠️ Alerta de Inimigo Perto", CurrentValue = false, Callback = function(v) DangerAlert = v end})
EspTab:CreateSlider({Name = "Distância do Alerta", Range = {10, 500}, Increment = 5, CurrentValue = 30, Callback = function(v) DangerDistance = v end})

EspTab:CreateSection("Novos Visuais")
EspTab:CreateToggle({Name = "💎 ESP Itens", CurrentValue = false, Callback = function(v) ToggleItemESP(v) end})
EspTab:CreateButton({Name = "👁️ FOV 190", Callback = function() game.Workspace.CurrentCamera.FieldOfView = 190 end})
EspTab:CreateButton({Name = "🖥️ Tela Esticada", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-OP-STRETCHED-RESOLUTION-14202"))() end})

EspTab:CreateSection("ESP Config")
EspTab:CreateToggle({Name = "Ativar ESP Geral", CurrentValue = false, Callback = function(v) ESP_Config.Enabled = v end})
EspTab:CreateToggle({Name = "✨ RGB", CurrentValue = false, Callback = function(v) ESP_Config.RGB = v end})
EspTab:CreateToggle({Name = "ESP Vida", CurrentValue = false, Callback = function(v) ESP_Config.Health = v end})
EspTab:CreateToggle({Name = "Linhas", CurrentValue = false, Callback = function(v) ESP_Config.Lines = v end})
EspTab:CreateToggle({Name = "Caixas", CurrentValue = false, Callback = function(v) ESP_Config.Boxes = v end})
EspTab:CreateToggle({Name = "Ver Time", CurrentValue = false, Callback = function(v) ESP_Team = v end})
EspTab:CreateToggle({Name = "Distância", CurrentValue = false, Callback = function(v) ESP_Config.Distance = v end})
EspTab:CreateToggle({Name = "Mostrar Arma", CurrentValue = false, Callback = function(v) ESP_Config.Weapon = v end})

local PlayerTab = Window:CreateTab("⚙️ Personagem", 4483362458)
PlayerTab:CreateSection("Movimentação")
PlayerTab:CreateToggle({Name = "🐇 Auto-Jump", CurrentValue = false, Callback = function(v) AutoJump = v end})
PlayerTab:CreateToggle({Name = "Pulo Infinito", CurrentValue = false, Callback = function(v) InfiniteJump = v end})
PlayerTab:CreateSlider({Name = "Velocidade", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(v) WalkSpeedValue = v end})
PlayerTab:CreateSlider({Name = "Pulo", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(v) JumpPowerValue = v end})
PlayerTab:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = function(v) Noclip = v end})
PlayerTab:CreateSection("Scripts Externos")
PlayerTab:CreateButton({Name = "🧗 WallHop V4", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))() end})
PlayerTab:CreateButton({Name = "👻 Invisível", Callback = function() loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))() end})
PlayerTab:CreateButton({Name = "🚀 Ativar Fly (V3)", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))() end})
PlayerTab:CreateButton({Name = "🔄 Shift Look Mobile", Callback = function() loadstring(game:HttpGet('https://pastebin.com/raw/CjNsnSDy'))() end})
PlayerTab:CreateSection("Hitbox")
PlayerTab:CreateToggle({Name = "Hitbox Cabeça", CurrentValue = false, Callback = function(v) HitboxEnabled = v end})
PlayerTab:CreateSlider({Name = "Tamanho", Range = {2, 25}, Increment = 1, CurrentValue = 2, Callback = function(v) HitboxSize = v end})
PlayerTab:CreateToggle({Name = "Afetar Time", CurrentValue = false, Callback = function(v) HitboxTeam = v end})

local NpcTab = Window:CreateTab("🤖 NPCs & Glitches", 4483362458)
NpcTab:CreateSection("Hitbox NPC")
NpcTab:CreateToggle({Name = "Ativar Hitbox NPC", CurrentValue = false, Callback = function(v) NpcHitboxEnabled = v end})
NpcTab:CreateSlider({Name = "Tamanho Hitbox NPC", Range = {2, 50}, Increment = 1, CurrentValue = 2, Callback = function(v) NpcHitboxSize = v end})
NpcTab:CreateSection("ESP NPC")
NpcTab:CreateToggle({Name = "Ativar ESP NPC (Highlight)", CurrentValue = false, Callback = function(v) NpcEspEnabled = v end})
NpcTab:CreateSection("Speed Glitch")
NpcTab:CreateToggle({Name = "Ativar Speed Glitch", CurrentValue = false, Callback = function(v) SpeedGlitchEnabled = v end})
NpcTab:CreateSlider({Name = "Força do Glitch", Range = {1, 100}, Increment = 1, CurrentValue = 1, Callback = function(v) SpeedGlitchValue = v end})

local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
ScriptTab:CreateSection("Opções Adicionais")
ScriptTab:CreateButton({Name = "Music", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YouTube-Music-Player-72222"))() end})
local AntiAfkActive = false
ScriptTab:CreateToggle({Name = "Antiaafk", CurrentValue = false, Callback = function(v) AntiAfkActive = v if AntiAfkActive then loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))() end end})
local AuraActive = false
ScriptTab:CreateToggle({Name = "Farmando Aura", CurrentValue = false, Callback = function(v) AuraActive = v if AuraActive then loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Fe%20Better%3F%20Movement"))() end end})

ScriptTab:CreateSection("Destaques")
ScriptTab:CreateButton({Name = "👁️ Abrir Spectador", Callback = function() ExecutarSpectador() end})
ScriptTab:CreateButton({Name = "Executar: Blox Fruits", Callback = function() getgenv().Version = "V4" getgenv().Team = "pirates" loadstring(game:HttpGet("https://raw.githubusercontent.com/TlDinhKhoi/Xeter/refs/heads/main/Main.lua"))() end})

ScriptTab:CreateButton({Name = "Executar: Fuja da instalação", Callback = function()
    local src = ""
    local CoreGui = game:GetService("StarterGui")
    pcall(function() 
        src = game:HttpGet("https://yarhm.mhi.im/scr", false)
    end)
    if src == "" then
        CoreGui:SetCore("SendNotification", {
            Title = "YARHM Outage";
            Text = "YARHM Online is currently unavailable! Sorry for the inconvenience. Using YARHM Offline.";
            Duration = 5;
        })
        src = game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.20/yarhm.lua", false)
    end
    if src ~= "" then loadstring(src)() end
end})

ScriptTab:CreateSection("Lista de Jogos")
local sList = {
    {"MM2 (SnapSanix)", "https://raw.githubusercontent.com/Roman34296589/SnapSanixHUB/refs/heads/main/SnapSanixHUB.lua"},
    {"Roube um Brainrot", "https://rawscripts.net/raw/SOON-Steal-a-Brainrot-Chili-Hub-keyless-57764"},
    {"Brookhaven", "https://raw.githubusercontent.com/Daivd977/Coquettekk/refs/heads/main/README.md"},
    {"FORSAKEN", "https://raw.githubusercontent.com/Daivd977/Coquettekk/refs/heads/main/forsaken"},
    {"Dandy World", "https://raw.githubusercontent.com/Boxten-Keyes/box-01/refs/heads/main/box%23%5Bboxten%20sex%20gui%5D/box%23%5Bmain%5D.lua"},
    {"Fish", "https://pastebin.com/raw/zpcAiB5c"},
    {"Natural Disaster Survival", "https://raw.githubusercontent.com/zeroidxx/axe-hub/refs/heads/main/axehub%20nds.txt"},
    {"Tower of Hell", "https://coolxplo.github.io/DP-HUB-coolxplo/Tower%20Of%20Hell.lua"},
    {"99 Noites na Floresta", "https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua"},
    {"Fuja do Tsunami", "https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/EscapeTsunamiForBrainrots"},
    {"Doors", "https://pastebin.com/raw/8cKJvTwg"},
    {"Construa um Barco", "https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Loader.lua"},
    {"Teleport GUI", "https://raw.githubusercontent.com/GhostPlayer352/Test4/refs/heads/main/Teleport%20Gui"},
    {"Blade ball", "https://raw.githubusercontent.com/AgentX771/ArgonHubX/main/Loader.lua"},
    {"Os campos de batalha", "https://gist.githubusercontent.com/ngm2807-sudo/b30689b1cf65651cd287213f40fa0f50/raw/TSBbyBaeMinh.lua"},
    {"Emotes", "https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"},
    {"Levantar blocos", "https://raw.githubusercontent.com/vitorbing34-cpu/Flutuar-parts-desancoradas/main/script.lua"},
    {"Blue Lock Rivals", "https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/refs/heads/main/Blue%20Lock%20Rivals%20GUI"},
    {"A Forja", "https://raw.githubusercontent.com/nurvian/Catraz-HUB/refs/heads/main/Catraz/main.lua"},
    {"Vida na Prisão", "https://raw.githubusercontent.com/zenss555a/script/refs/heads/main/Prison-Life.lua"},
    {"Bola da Morte", "https://raw.githubusercontent.com/sirapobsriumang/Hehehaha/refs/heads/main/Dadball"}
}

for _, s in pairs(sList) do 
    ScriptTab:CreateButton({Name = "Executar: "..s[1], Callback = function() 
        loadstring(game:HttpGet(s[2]))() 
    end}) 
end

local SysTab = Window:CreateTab("🛠️ Sistema", 4483362458)
SysTab:CreateSection("Configurações Extras")
SysTab:CreateButton({Name = "Ativar Antiaafk Externo", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))() end})
SysTab:CreateSection("Utilidades")
SysTab:CreateButton({Name = "🧹 Limpeza Max", Callback = function() loadstring(game:HttpGet("https://gist.githubusercontent.com/soxcy-script/d71b1a3947568c9f97920fa8e746ca15/raw"))() end})
SysTab:CreateButton({Name = "Full Bright", Callback = function() game:GetService("Lighting").Brightness = 2 end})
SysTab:CreateButton({Name = "FPS Booster", Callback = function() for _, v in pairs(game:GetDescendants()) do if v:IsA("BasePart") then v.Material = Enum.Material.Plastic end end end})
SysTab:CreateButton({Name = "🔴 Criar Botão Auto-Click", Callback = function() CriarAutoClicker() end})
SysTab:CreateButton({Name = "Rejoin", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})

-- ========================================================
-- [ NOVA ABA: DICAS & EXTRAS ]
-- ========================================================
local DicasTab = Window:CreateTab("💡 Dicas", 4483362458)

DicasTab:CreateSection("⚠️ Avisos de Segurança")
DicasTab:CreateLabel("RISCO DE BAN: O uso excessivo pode resultar em ban.")
DicasTab:CreateLabel("Auto-Login: Já está integrado! O script salva sua senha.")
DicasTab:CreateLabel("Sempre jogue com moderação.")

Rayfield:LoadConfiguration()