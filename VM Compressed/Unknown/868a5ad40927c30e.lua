print("Rayfield: Iniciando...")

-- ================= CARREGAR RAYFIELD =================
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
end)

if not success or not Rayfield then
    warn("Não foi possível carregar a Rayfield.")
    return
end

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

repeat task.wait() until LocalPlayer and LocalPlayer.Character
local Character = LocalPlayer.Character
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
local States = LocalPlayer:WaitForChild("States")
local Stats = LocalPlayer:WaitForChild("Stats")
local BagAmount = States:WaitForChild("Bag")
local BagLevel = Stats:WaitForChild("BagSizeLevel"):WaitForChild("CurrentAmount")
local RobRemote = ReplicatedStorage:WaitForChild("GeneralEvents"):WaitForChild("Rob")
local Camp = CFrame.new(1636.62537, 104.349976, -1736.184)
local AutoFarmActive = false

-- ================= HUD HORÁRIO =================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HorarioHUD"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local TimeLabel = Instance.new("TextLabel")
TimeLabel.Name = "TimeLabel"
TimeLabel.Size = UDim2.new(0, 150, 0, 20)
TimeLabel.Position = UDim2.new(0.5, -75, 0, 10)
TimeLabel.BackgroundTransparency = 0.5
TimeLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TimeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TimeLabel.Font = Enum.Font.SourceSansBold
TimeLabel.TextScaled = true
TimeLabel.Text = "Calculando..."
TimeLabel.Parent = ScreenGui

RunService.RenderStepped:Connect(function()
    local time = Lighting.ClockTime
    local hour = math.floor(time)
    local minute = math.floor((time - hour) * 60)
    local periodo = (time >= 6 and time < 18) and "🌞 Dia" or "🌙 Noite"
    TimeLabel.Text = string.format("🕒 %02d:%02d - %s", hour, minute, periodo)
end)

-- ================= FUNÇÕES DE FARM =================
local function TeleportToCamp()
    HumanoidRootPart.CFrame = Camp
end

local function CashRegisterFarm()
    for _, Item in ipairs(Workspace:GetChildren()) do
        if BagAmount.Value >= BagLevel.Value then
            TeleportToCamp()
            break
        elseif Item:IsA("Model") and Item.Name == "CashRegister" then
            local OpenPart = Item:FindFirstChild("Open")
            if OpenPart then
                HumanoidRootPart.CFrame = OpenPart.CFrame
                RobRemote:FireServer("Register", {
                    ["Part"] = Item:FindFirstChild("Union"),
                    ["OpenPart"] = OpenPart,
                    ["ActiveValue"] = Item:FindFirstChild("Active"),
                    ["Active"] = true
                })
            end
        end
    end
end

local function BankFarm()
    for _, Item in ipairs(Workspace:GetChildren()) do
        if BagAmount.Value >= BagLevel.Value then
            TeleportToCamp()
            break
        elseif Item:IsA("Model") and Item.Name == "Safe" and Item:FindFirstChild("Amount").Value > 0 then
            local SafePart = Item:FindFirstChild("Safe")
            if SafePart then
                HumanoidRootPart.CFrame = SafePart.CFrame
                if Item:FindFirstChild("Open").Value then
                    RobRemote:FireServer("Safe", Item)
                else
                    Item:FindFirstChild("OpenSafe"):FireServer("Completed")
                    RobRemote:FireServer("Safe", Item)
                end
            end
        end
    end
end

-- ================= GUI =================
local Window = Rayfield:CreateWindow({
    Name = "HOP DO AMASSO☠️",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "GUI DO AMASSO☠️",
    ConfigurationSaving = {Enabled = true, FolderName = nil, FileName = "HOP_DO_AMASSO_Config"},
    Discord = {Enabled = false},
    KeySystem = false
})

-- ================= HOP TAB =================
local HopTab = Window:CreateTab("🕒 HOP DO AMASSO☠️")

HopTab:CreateButton({
    Name = "Server Hop 🚀",
    Callback = function()
        spawn(function()
            local success, data = pcall(function()
                return TeleportService:GetPlayerPlaceInstancesAsync(game.PlaceId)
            end)
            if success and data and #data.Instances > 0 then
                for _, server in ipairs(data.Instances) do
                    if server.Players < server.MaxPlayers then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, server.Id, LocalPlayer)
                        return
                    end
                end
            end
        end)
    end
})

HopTab:CreateButton({
    Name = "Menor Servidor 📉",
    Callback = function()
        spawn(function()
            local HttpService = game:GetService("HttpService")
            local servers = {}
            local cursor = nil
            repeat
                local success, response = pcall(function()
                    local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
                    if cursor then url = url.."&cursor="..cursor end
                    return HttpService:JSONDecode(game:HttpGet(url))
                end)
                if success and response then
                    for _, s in ipairs(response.data or {}) do
                        if s.playing < s.maxPlayers then
                            table.insert(servers,s)
                        end
                    end
                    cursor = response.nextPageCursor
                else
                    cursor = nil
                end
            until not cursor

            if #servers>0 then
                table.sort(servers,function(a,b) return a.playing < b.playing end)
                pcall(function()
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[1].id, LocalPlayer)
                end)
            end
        end)
    end
})

-- ================= COMBATE TAB =================
local CombateTab = Window:CreateTab("⚔️ COMBATE")

CombateTab:CreateButton({
    Name = "Hitbox + ESP ⚔️👀",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Westbound-OP-28050"))()
        end)
    end
})

local killAllAtivo = false
local distance = 500
CombateTab:CreateToggle({
    Name = "Kill Aura ⚔️",
    CurrentValue = false,
    Flag = "KillAuraToggle",
    Callback = function(value)
        killAllAtivo = value
    end
})

spawn(function()
    RunService.RenderStepped:Connect(function()
        if killAllAtivo and LocalPlayer.Character then
            local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local tool = LocalPlayer.Character:FindFirstChildOfClass("Tool")
            if rootPart and tool then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = (player.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                        if dist <= distance then
                            local head = player.Character:FindFirstChild("Head")
                            local humanoid = player.Character:FindFirstChild("Humanoid")
                            if head and humanoid and ReplicatedStorage:FindFirstChild("GunScripts") then
                                local HitRemote = ReplicatedStorage.GunScripts:WaitForChild("Events"):WaitForChild("Hit")
                                local args = {{
                                    HitPart = head,
                                    HitCallback = "Bullet",
                                    BulletOwner = LocalPlayer,
                                    Lifetime = 1,
                                    Speed = 80,
                                    Material = Enum.Material.SmoothPlastic,
                                    Tool = tool,
                                    Normal = Vector3.new(0,1,0),
                                    AmmoType = "PistolAmmo",
                                    cframe = rootPart.CFrame,
                                    PlayerRootPos = rootPart.Position,
                                    ToolName = tool.Name,
                                    StartTime = tick(),
                                    MaxDistance = 1000,
                                    Shot = nil,
                                    GunType = "Pistol",
                                    HitPosition = head.Position,
                                    HitHum = humanoid,
                                    Delay = 0.1,
                                    RootPosition = head.Position
                                }}
                                pcall(function() HitRemote:FireServer(unpack(args)) end)
                            end
                        end
                    end
                end
            end
        end
    end)
end)

-- ================= AUTO FARM TAB =================
local AutoFarmTab = Window:CreateTab("🛠️ AUTO FARM")

AutoFarmTab:CreateButton({
    Name = "Iniciar Auto Farm 🛠️",
    Callback = function()
        if not AutoFarmActive then
            AutoFarmActive = true

            -- Notificação
            game.StarterGui:SetCore("SendNotification", {
                Title = "Auto Farm",
                Text = "Auto Farm iniciado!",
                Duration = 5
            })

            -- Clonar Humanoid e bugar a tela
            local Human = Character:FindFirstChildWhichIsA("Humanoid")
            if Human then
                local nHuman = Human:Clone()
                nHuman.Parent = Character
                LocalPlayer.Character = nil

                nHuman:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                nHuman:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                nHuman:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

                Human:Destroy()
                LocalPlayer.Character = Character
                game.Workspace.CurrentCamera.CameraSubject = nHuman
                nHuman.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None

                local AnimateScript = Character:FindFirstChild("Animate")
                if AnimateScript then
                    AnimateScript.Disabled = true
                    task.wait()
                    AnimateScript.Disabled = false
                end

                nHuman.Health = nHuman.MaxHealth
            end

            -- AutoFarm loop
            spawn(function()
                while AutoFarmActive do
                    CashRegisterFarm()
                    BankFarm()
                    task.wait(0.05)
                end
            end)
        end
    end
})

print("Rayfield carregada ✅ | AutoFarm pronto para ativar pelo botão | HUD horário menor ✔")