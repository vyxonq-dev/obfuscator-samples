-- Jeff Hub Script (Open Source)
-- Sorry cause is portuguese but you can translate
-- You can Edit Something :D
-- check if is In correct game
local allowedPlaceIds = {
    [96342491571673] = true, -- New Players Server
    [109983668079237] = true -- Normal
}

if not allowedPlaceIds[game.PlaceId] then
    game:GetService("Players").LocalPlayer:Kick("Unsupported Game Join Correct.")
    return
end

print("Correct Game.")
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "Jeff hub",
    Icon = "door-open",
    Author = "By Jeff",
    Folder = "CloudHub",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    Background = "",
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },
})

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "house",
    Locked = false,
})


-- Godmode Toggle
local GodmodeConnection

local GodmodeToggle = MainTab:Toggle({
    Title = "Godmode",
    Desc = "Makes you not die",
    Icon = "shield",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        local Player = game:GetService("Players").LocalPlayer

        if state then
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")

            if Humanoid then
                local Clone = Humanoid:Clone()
                Clone.Parent = Character
                Humanoid:Destroy()
                Clone.Name = "Humanoid"
                workspace.CurrentCamera.CameraSubject = Clone
            end
        else
            warn("Desativar godmode requer reset manual do personagem.")
        end
    end
})

-- Rejoin Button
local RejoinButton = MainTab:Button({
    Title = "Rejoin",
    Desc = "If you use godmode use this (no auto execute)",
    Icon = "globe",
    Locked = false,
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer

        local placeId = game.PlaceId
        local jobId = game.JobId

        local success, err = pcall(function()
            TeleportService:TeleportToPlaceInstance(placeId, jobId, Player)
        end)

        if not success then
            warn("Falhou ao tentar reentrar no mesmo servidor:", err)
            TeleportService:Teleport(placeId, Player)
        end
    end
})


local StealTab = Window:Tab({
    Title = "Steal",
    Icon = "diamond",
    Locked = false,
})

local Button = StealTab:Button({
    Title = "Steal Gui",
    Desc = "Can go to up and down in sky",
    Locked = false,
    Callback = function()
            -- Criar a GUI
            local ScreenGui = Instance.new("ScreenGui")
            ScreenGui.Name = "StealGUI"
            ScreenGui.ResetOnSpawn = false
            ScreenGui.Parent = game.CoreGui

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 200, 0, 50)
            ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
            ToggleButton.Text = "Teleport UP: OFF"
            ToggleButton.TextColor3 = Color3.new(1, 1, 1)
            ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Font = Enum.Font.GothamBold
            ToggleButton.TextSize = 14
            ToggleButton.Active = true
            ToggleButton.Draggable = true
            ToggleButton.Parent = ScreenGui  -- corrigido aqui!

            local UICornerBtn = Instance.new("UICorner", ToggleButton)

            -- Variáveis de controle
            local toggled = false
            local originalPosition = nil

            -- Função do toggle
            ToggleButton.MouseButton1Click:Connect(function()
                local player = game:GetService("Players").LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()
                local hrp = char:WaitForChild("HumanoidRootPart")

                if not toggled then
                    originalPosition = hrp.Position
                    hrp.CFrame = hrp.CFrame + Vector3.new(0, 200, 0)
                    ToggleButton.Text = "Teleport UP: ON"
                    toggled = true
                else
                    if originalPosition then
                        hrp.CFrame = CFrame.new(originalPosition)
                    else
                        hrp.CFrame = hrp.CFrame - Vector3.new(0, 200, 0)
                    end
                    ToggleButton.Text = "Teleport UP: OFF"
                    toggled = false
                end
            end)
    end
})


local Button = StealTab:Button({
    Title = "Speed boost",
    Desc = "Boosts your speed for best steal",
    Locked = false,
    Callback = function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 94
    end
})

local Button = StealTab:Button({
    Title = "Float Gui",
    Desc = "Floats you for better steal",
    Locked = false,
    Callback = function()
            --// Float GUI Suave estilo Steal a Brainrot (com ON/OFF)
            --// Criado por JeffScripts

            local player = game.Players.LocalPlayer
            local floatAtivo = false
            local floatConnection = nil

            -- GUI Setup
            local gui = Instance.new("ScreenGui")
            gui.Name = "FloatGui"
            gui.ResetOnSpawn = false
            gui.Parent = game.CoreGui

            local main = Instance.new("Frame")
            main.Name = "Main"
            main.Size = UDim2.new(0, 200, 0, 100)
            main.Position = UDim2.new(0.5, -100, 0.5, -50)
            main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            main.BorderSizePixel = 0
            main.Active = true
            main.Draggable = true
            main.Parent = gui

            local title = Instance.new("TextLabel")
            title.Name = "Title"
            title.Size = UDim2.new(1, 0, 0, 30)
            title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            title.Text = "Float Steal Mode"
            title.TextColor3 = Color3.fromRGB(255, 255, 255)
            title.Font = Enum.Font.SourceSansBold
            title.TextSize = 16
            title.Parent = main

            local button = Instance.new("TextButton")
            button.Name = "FloatButton"
            button.Size = UDim2.new(0.8, 0, 0, 30)
            button.Position = UDim2.new(0.1, 0, 0.5, -15)
            button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
            button.Text = "Active Float"
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 14
            button.Parent = main

            -- Função para aplicar float
            local function applyFloat(character)
                local hrp = character:WaitForChild("HumanoidRootPart")

                -- Remover anterior
                if hrp:FindFirstChild("FloatPosition") then
                    hrp:FindFirstChild("FloatPosition"):Destroy()
                end

                local bp = Instance.new("BodyPosition")
                bp.Name = "FloatPosition"
                bp.MaxForce = Vector3.new(0, 100000, 0)
                bp.Position = hrp.Position + Vector3.new(0, 0.65, 0)
                bp.D = 1000
                bp.P = 3000
                bp.Parent = hrp

                -- Atualiza a posição sempre
                floatConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if character and hrp and bp and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
                        bp.Position = hrp.Position + Vector3.new(0, 0.65, 0)
                    else
                        if floatConnection then
                            floatConnection:Disconnect()
                            floatConnection = nil
                        end
                    end
                end)
            end

            -- Função para remover float
            local function removeFloat(character)
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if hrp and hrp:FindFirstChild("FloatPosition") then
                    hrp.FloatPosition:Destroy()
                end
                if floatConnection then
                    floatConnection:Disconnect()
                    floatConnection = nil
                end
            end

            -- Botão ON/OFF
            button.MouseButton1Click:Connect(function()
                floatAtivo = not floatAtivo

                if floatAtivo then
                    button.Text = "Put OFF"
                    button.BackgroundColor3 = Color3.fromRGB(255, 80, 80)

                    if player.Character then
                        applyFloat(player.Character)
                    end
                else
                    button.Text = "Active Float"
                    button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)

                    if player.Character then
                        removeFloat(player.Character)
                    end
                end
            end)

            -- Float automático no respawn (se ativo)
            player.CharacterAdded:Connect(function(char)
                wait(1)
                if floatAtivo then
                    applyFloat(char)
                end
            end)
    end
})


local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

local DoubleJumpActive = false
local DoubleJumpConnection = nil
local StateConnection = nil

local function enableDoubleJump()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local canDoubleJump = true

    -- Reativa o double jump ao cair no chão
    StateConnection = humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Landed then
            canDoubleJump = true
        end
    end)

    -- Ação do pulo duplo
    DoubleJumpConnection = UserInputService.JumpRequest:Connect(function()
        if humanoid.FloorMaterial ~= Enum.Material.Air then
            canDoubleJump = true
        elseif canDoubleJump then
            canDoubleJump = false
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

local function disableDoubleJump()
    if DoubleJumpConnection then
        DoubleJumpConnection:Disconnect()
        DoubleJumpConnection = nil
    end
    if StateConnection then
        StateConnection:Disconnect()
        StateConnection = nil
    end
end

-- Seu Toggle UI
local Toggle = StealTab:Toggle({
    Title = "Double Jump",
    Desc = "Double Jumps you",
    Icon = "bird",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        print("Toggle Activated: " .. tostring(state))
        DoubleJumpActive = state

        if state then
            enableDoubleJump()
        else
            disableDoubleJump()
        end
    end
})

-- Auto reativar após respawn (se toggle estiver ON)
player.CharacterAdded:Connect(function()
    wait(1)
    if DoubleJumpActive then
        enableDoubleJump()
    end
end)

-- Instant steal
local Button = StealTab:Button({
    Title = "Instant steal",
    Desc = "i cant make use script for this (OP)",
    Locked = false,
    Callback = function() loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/b33997ee8b14d4d847e841a7b578f962.lua"))()
    end
})


local VirualTab = Window:Tab({
    Title = "Virual",
    Icon = "eye",
    Locked = false,
})


local Toggle = VirualTab:Toggle({
    Title = "Esp Players",
    Desc = "Esp Players",
    Icon = "eye",
    Type = "Checkbox",
    Default = false,
    Callback = function(state) 
        local espEnabled = state
        local Players = game:GetService("Players")

        local function createESP(player)
            if player == Players.LocalPlayer then return end

            local character = player.Character or player.CharacterAdded:Wait()
            if not character then return end

            local head = character:WaitForChild("Head")
            if not head then return end

            local box = Instance.new("BillboardGui")
            box.Name = "ESPBox"
            box.Adornee = head
            box.Size = UDim2.new(0, 50, 0, 50)
            box.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
            box.AlwaysOnTop = true
            box.Parent = head

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 0.8
            frame.BackgroundColor3 = Color3.new(0, 1, 0)
            frame.Parent = box

            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
            nameLabel.Position = UDim2.new(0, 0, -0.5, 0)
            nameLabel.Text = player.Name
            nameLabel.TextColor3 = Color3.new(1, 1, 1)
            nameLabel.BackgroundTransparency = 1
            nameLabel.TextStrokeColor3 = Color3.new(0,0,0)
            nameLabel.TextStrokeTransparency = 0
            nameLabel.Font = Enum.Font.SourceSansBold
            nameLabel.TextSize = 14
            nameLabel.Parent = frame
        end

        local function removeESP(player)
            if player and player.Character then
                local character = player.Character
                if character:FindFirstChild("Head") then
                    local head = character:FindFirstChild("Head")
                         if head:FindFirstChild("ESPBox") then
                              head.ESPBox:Destroy()
                         end
                end
            end
        end

        if espEnabled then
            for _, player in ipairs(Players:GetPlayers()) do
                createESP(player)
            end
        else
            for _, player in ipairs(Players:GetPlayers()) do
                removeESP(player)
            end
        end

        Players.PlayerAdded:Connect(function(player)
            if espEnabled then
                wait(1)
                createESP(player)
            end
        end)

        Players.PlayerRemoving:Connect(function(player)
            removeESP(player)
        end)
    end
})


local Button = VirualTab:Button({
    Title = "Show Player Count",
    Desc = "Shows How Much Player",
    Locked = false,
    Callback = function()
            local Players = game:GetService("Players")
            local StarterGui = game:GetService("StarterGui")

            -- Conta quantos jogadores estão no jogo agora
            local playerCount = #Players:GetPlayers()

            -- Mostra uma notificação com esse número
            StarterGui:SetCore("SendNotification", {
                Title = "👥 Player Count",
                Text = "There are " .. playerCount .. " players in the game.",
                Duration = 5
            })
    end
})


local Button = VirualTab:Button({
    Title = "Anti Lag",
    Desc = "For Low pc and mobile",
    Locked = false,
    Callback = function()
            -- Low Quality AntiLag by JeffScripts
            local ws = game:GetService("Workspace")
            local lighting = game:GetService("Lighting")

            -- Removes Effects
            for _, v in pairs(ws:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                    v.CastShadow = false
                end
                if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                    v:Destroy()
                end
                if v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("SpotLight") then
                    v.Enabled = false
                end
            end

            
            lighting.GlobalShadows = false
            lighting.FogEnd = 1e10
            lighting.Brightness = 0
            lighting.ClockTime = 14 -- makes Map Clear
            lighting.EnvironmentDiffuseScale = 0
            lighting.EnvironmentSpecularScale = 0

            -- Removes water Effects
            ws.Terrain.WaterWaveSize = 0
            ws.Terrain.WaterWaveSpeed = 0
            ws.Terrain.WaterReflectance = 0
            ws.Terrain.WaterTransparency = 1
    end
})


local FinderTab = Window:Tab({
    Title = "Finder",
    Icon = "radar",
    Locked = false,
})


local Button = FinderTab:Button({
    Title = "Server hop",
    Desc = "Server hops you to new server",
    Locked = false,
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        TeleportService:Teleport(PlaceId, game.Players.LocalPlayer)
    end
})

local Button = FinderTab:Button({
    Title = "Try find a target in server hop",
    Desc = "This is a just a warning",
    Locked = false,
    Callback = function()
        print("Warning")
    end
})


local Button = FinderTab:Button({
    Title = "Join Small Server",
    Desc = "Joins a Server with low players",
    Locked = false,
    Callback = function()
            -- Steal a Brainrot Server Hop Script
            -- Por: @JeffScripts

            local HttpService = game:GetService("HttpService")
            local TeleportService = game:GetService("TeleportService")
            local Players = game:GetService("Players")

            local function GetLowPlayerServer()
                local jobIdAtual = game.JobId
                local PlaceId = game.PlaceId
                local Cursor = nil
                local ListaFinal = {}

                for i = 1, 10 do -- tenta até 10 páginas de servidores
                    local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
                    if Cursor then
                        url = url .. "&cursor=" .. Cursor
                    end

                    local success, result = pcall(function()
                        return HttpService:JSONDecode(game:HttpGet(url))
                    end)

                    if success and result and result.data then
                        for _, server in pairs(result.data) do
                            if server.playing < server.maxPlayers and server.id ~= jobIdAtual then
                                table.insert(ListaFinal, server)
                            end
                        end

                        Cursor = result.nextPageCursor
                        if not Cursor then
                            break
                        end
                    else
                        warn("Erro ao buscar servidores.")
                        break
                    end
                end

                -- Escolhe aleatoriamente um servidor com poucos jogadores
                if #ListaFinal > 0 then
                    local servidorEscolhido = ListaFinal[math.random(1, #ListaFinal)]
                    return servidorEscolhido.id
                else
                    return nil
                end
            end

            local servidorAlvo = GetLowPlayerServer()

            if servidorAlvo then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, servidorAlvo, Players.LocalPlayer)
                print("Teleporting to low players server...")
            else
                warn("Low players server Not found.")
            end
    end
})


local Button = Tab:Button({
    Title = "Warning:",
    Desc = "Try find best low server",
    Locked = false,
    Callback = function()
        print("Low Server")
    end
})

