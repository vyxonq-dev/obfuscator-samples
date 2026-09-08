local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Legend Hub | [FPS] Passeio",
    LoadingTitle = "Loading Script...",
    LoadingSubtitle = "By DarkHub",
    ConfigurationSaving = {Enabled = false},
    Discord = {Enabled = false},
    KeySystem = false,

    Theme = {
        -- Fundo neon com efeito "profundidade roxa"
        Background = Color3.fromRGB(14, 0, 20),   -- Roxo quase preto
        
        -- Topo com brilho neon roxo
        Topbar = Color3.fromRGB(120, 0, 255),     -- Roxo neon brilhante
        Shadow = Color3.fromRGB(170, 0, 255),     -- Glow neon

        -- Acentos neon vibrantes
        Accent = Color3.fromRGB(200, 0, 255),     -- Roxo neon forte
        AccentLight = Color3.fromRGB(255, 90, 255), -- Neon claro, quase rosa-lilás

        -- Bordas e traços
        Border = Color3.fromRGB(255, 255, 255),   -- Branco puro (contraste)
        UIStroke = Color3.fromRGB(255, 0, 255),   -- Traço neon

        -- Texto neon
        Text = Color3.fromRGB(255, 210, 255),     -- Neon lilás claro
        TextDark = Color3.fromRGB(210, 160, 230)  -- Lilás suave
    }
})

-- === Aimbot Variables ===
getgenv().AimbotOn = false
local FOV = 120

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

-- Only track current (locked) target to not "soltar" ao entrar na FOV
local CurrentTarget = nil

local function GetClosestHeadVisible()
    local closest, shortest = nil, math.huge
    local screenCenter = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    for _,p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") then
            local head = p.Character.Head
            local pos, onScreen = Camera:WorldToViewportPoint(head.Position)
            if onScreen then
                local dist = (Vector2.new(pos.X, pos.Y) - screenCenter).Magnitude
                if dist < shortest and dist <= FOV then
                    -- Wallcheck
                    local origin = Camera.CFrame.Position
                    local direction = (head.Position - origin)
                    local rayParams = RaycastParams.new()
                    rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
                    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
                    rayParams.IgnoreWater = true
                    local result = workspace:Raycast(origin, direction)
                    if result and result.Instance == head then
                        shortest = dist
                        closest = head
                    end
                end
            end
        end
    end
    return closest
end

-- Mantém o alvo atual (lock) até ele morrer, sumir da tela ou ficar atrás da parede
RunService.RenderStepped:Connect(function()
    if getgenv().AimbotOn then
        -- Se não tem alvo lockado, pega um novo
        if not (CurrentTarget and CurrentTarget.Parent and CurrentTarget.Parent:FindFirstChildOfClass("Humanoid") and CurrentTarget.Parent:FindFirstChild("Head")) then
            CurrentTarget = GetClosestHeadVisible()
        end
        -- Se alvo lockado saiu do FOV, morreu, ou sumiu, procurar outro
        if CurrentTarget then
            local pos, onScreen = Camera:WorldToViewportPoint(CurrentTarget.Position)
            local alive = (CurrentTarget.Parent:FindFirstChildOfClass("Humanoid") and CurrentTarget.Parent.Humanoid.Health > 0)
            -- Wallcheck a cada frame
            local origin = Camera.CFrame.Position
            local direction = (CurrentTarget.Position - origin)
            local rayParams = RaycastParams.new()
            rayParams.FilterDescendantsInstances = {LocalPlayer.Character}
            rayParams.FilterType = Enum.RaycastFilterType.Blacklist
            rayParams.IgnoreWater = true
            local result = workspace:Raycast(origin, direction)
            local wallpass = (result and result.Instance == CurrentTarget)
            -- Se morreu, someu, parede, ou saiu do FOV, procura novo alvo
            if not onScreen or not alive or not wallpass then
                CurrentTarget = GetClosestHeadVisible()
                -- Se não encontrou ninguém, simplesmente não faz nada neste frame
            end
            -- Só mira se o alvo atende todos critérios
            if CurrentTarget then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, CurrentTarget.Position)
            end
        end
    else
        -- Se desativar, limpa o lock
        CurrentTarget = nil
    end
end)

-- === GUI Aimbot ===
local TabAimbot = Window:CreateTab("Aimbot")
TabAimbot:CreateSection("Aimbot (Head Lock, WallCheck, Lock Automático)")

TabAimbot:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Callback = function(Value)
        getgenv().AimbotOn = Value
        if not Value then CurrentTarget = nil end
    end,
})
TabAimbot:CreateSlider({
    Name = "FOV",
    Range = {30, 300},
    Increment = 1,
    Suffix = "FOV",
    CurrentValue = FOV,
    Callback = function(Value) FOV = Value end,
})
TabAimbot:CreateSection("Wallcheck sempre ligado (não mira atrás de parede)")

-- === Categoria ESPs ===
local Drawing = Drawing
local TabESP = Window:CreateTab("ESPs")
TabESP:CreateSection("Visuals")

local ESPBoxEnabled, ESPVidaEnabled, ESPLineEnabled = false, false, false
local EspObjects = {}

function ClearESP()
    for plr,objs in pairs(EspObjects) do
        for _,obj in pairs(objs) do
            if obj and obj.Remove then pcall(function() obj:Remove() end) end
        end
    end
    EspObjects = {}
end

function EnableESP()
    RunService:UnbindFromRenderStep("FPSPasseioESP")
    RunService:BindToRenderStep("FPSPasseioESP", 199, function()
        if not (ESPBoxEnabled or ESPLineEnabled or ESPVidaEnabled) then
            ClearESP(); return
        end
        for _,plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") then
                local hrp = plr.Character.HumanoidRootPart
                local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                local head = plr.Character:FindFirstChild("Head")
                if not EspObjects[plr] then
                    EspObjects[plr] = {
                        Box = Drawing.new("Square"),
                        Line = Drawing.new("Line"),
                        LifeBar = Drawing.new("Square"),
                        LifeFill = Drawing.new("Square"),
                    }
                    -- box
                    EspObjects[plr].Box.Thickness = 2
                    EspObjects[plr].Box.Color = Color3.fromRGB(0,255,0)
                    EspObjects[plr].Box.Filled = false
                    EspObjects[plr].Box.Visible = false
                    -- line
                    EspObjects[plr].Line.Color = Color3.fromRGB(0,255,0)
                    EspObjects[plr].Line.Thickness = 2
                    EspObjects[plr].Line.Visible = false
                    -- lifebar
                    EspObjects[plr].LifeBar.Filled = true
                    EspObjects[plr].LifeBar.Color = Color3.fromRGB(0,0,0)
                    EspObjects[plr].LifeBar.Transparency = 0.9
                    EspObjects[plr].LifeBar.Visible = false
                    -- lifefill
                    EspObjects[plr].LifeFill.Filled = true
                    EspObjects[plr].LifeFill.Transparency = 0.7
                    EspObjects[plr].LifeFill.ZIndex = 2
                    EspObjects[plr].LifeFill.Visible = false
                end
                -- BOX bounds
                local size3 = hrp.Size * 1.5
                local min = hrp.Position - Vector3.new(size3.X/2, size3.Y/2, size3.Z/2)
                local max = hrp.Position + Vector3.new(size3.X/2, size3.Y * 1.25, size3.Z/2)
                local scmin, on1 = Camera:WorldToViewportPoint(min)
                local scmax, on2 = Camera:WorldToViewportPoint(max)
                -- ESP Box
                local box = EspObjects[plr].Box
                if ESPBoxEnabled and on1 and on2 then
                    box.Size = Vector2.new(math.abs(scmax.X - scmin.X), math.abs(scmax.Y - scmin.Y))
                    box.Position = Vector2.new(math.min(scmin.X, scmax.X), math.min(scmin.Y, scmax.Y))
                    box.Visible = true
                else
                    box.Visible = false
                end
                -- ESP Heart
                local barravida = EspObjects[plr].LifeBar
                local fillvida = EspObjects[plr].LifeFill
                if ESPVidaEnabled and on1 and on2 then
                    local h = math.abs(scmax.Y - scmin.Y)
                    local vida = hum.Health / hum.MaxHealth
                    -- barra preta
                    barravida.Size = Vector2.new(6, h)
                    barravida.Position = Vector2.new(math.min(scmin.X, scmax.X) - 10, math.min(scmin.Y, scmax.Y))
                    barravida.Visible = true
                    -- barra cheia colorida (preenchimento)
                    local fillh = h * vida
                    fillvida.Size = Vector2.new(6, fillh)
                    fillvida.Position = Vector2.new(math.min(scmin.X, scmax.X) - 10, math.min(scmin.Y, scmax.Y) + (h - fillh))
                    fillvida.Color = Color3.fromRGB(255 - (vida * 255), vida * 255, 0)
                    fillvida.Visible = true
                else
                    barravida.Visible = false
                    fillvida.Visible = false
                end
                -- ESP Line
                local line = EspObjects[plr].Line
                if ESPLineEnabled and head then
                    local headscreen, onhead = Camera:WorldToViewportPoint(head.Position)
                    if onhead then
                        line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
                        line.To = Vector2.new(headscreen.X, headscreen.Y)
                        line.Visible = true
                    else
                        line.Visible = false
                    end
                else
                    line.Visible = false
                end
            elseif EspObjects[plr] then
                EspObjects[plr].Box.Visible = false
                EspObjects[plr].Line.Visible = false
                EspObjects[plr].LifeBar.Visible = false
                EspObjects[plr].LifeFill.Visible = false
            end
        end
    end)
end

function DisableESP()
    RunService:UnbindFromRenderStep("FPSPasseioESP")
    ClearESP()
end

TabESP:CreateToggle({
    Name = "ESP Box",
    CurrentValue = false,
    Callback = function(b)
        ESPBoxEnabled = b
        if b or ESPLineEnabled or ESPVidaEnabled then EnableESP() else DisableESP() end
    end,
})

TabESP:CreateToggle({
    Name = "ESP Heart",
    CurrentValue = false,
    Callback = function(b)
        ESPVidaEnabled = b
        if b or ESPBoxEnabled or ESPLineEnabled then EnableESP() else DisableESP() end
    end,
})

TabESP:CreateToggle({
    Name = "ESP Line",
    CurrentValue = false,
    Callback = function(b)
        ESPLineEnabled = b
        if b or ESPBoxEnabled or ESPVidaEnabled then EnableESP() else DisableESP() end
    end,
})

TabESP:CreateSection("Ligue cada ESP para visualizar.")

print("Legend Hub | [FPS] Passeio - Successful loading")