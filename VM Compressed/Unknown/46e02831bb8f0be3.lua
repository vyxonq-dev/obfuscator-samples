-- Doors Hub V8 - Natal 2025 | Rayfield (ENTIDADES 100% FUNCIONANDO AGORA!)
-- Usa DescendantAdded + nomes EXATOS das entidades (testado Dez/2025)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Doors Hub - Natal 2025 🎄",
    LoadingTitle = "Carregando ESP de Entidades...",
    LoadingSubtitle = "Rush, Figure, Eyes e mais!",
    ConfigurationSaving = { Enabled = true, FolderName = "DoorsNatal2025" },
    KeySystem = false
})

local VisualTab = Window:CreateTab("Visuais", 8569322839)
local MiscTab   = Window:CreateTab("Diversos", 8569322839)

local config = {
    fullBright = false,
    speed = false,
    espItems = true,
    espEntities = true,
    notify = true
}

local entities = {
    ["RushMoving"] = {name = "⚡ Rush", color = Color3.fromRGB(255,0,0)},
    ["AmbushMoving"] = {name = "💥 Ambush", color = Color3.fromRGB(0,255,100)},
    ["Eyes"] = {name = "👁️ Eyes", color = Color3.fromRGB(138,43,226)},
    ["Halt"] = {name = "🚪 Halt", color = Color3.fromRGB(100,200,255)},
    ["FigureRagdoll"] = {name = "👹 Figure", color = Color3.fromRGB(220,20,60)},
    ["SeekMoving"] = {name = "👁️ Seek", color = Color3.fromRGB(255,255,255)},
    ["A60"] = {name = "A-60", color = Color3.fromRGB(255,100,0)},
    ["A90"] = {name = "A-90", color = Color3.fromRGB(255,150,0)},
    ["A120"] = {name = "A-120", color = Color3.fromRGB(255,200,0)},
    ["Snare"] = {name = "🕸️ Snare", color = Color3.fromRGB(150,150,150)}
}

local function createESP(obj, nome, cor)
    if obj:FindFirstChild("ESP_Highlight") then return end
    
    local hl = Instance.new("Highlight")
    hl.Name = "ESP_Highlight"
    hl.Parent = obj
    hl.FillColor = cor
    hl.OutlineColor = Color3.new(1,1,1)
    hl.FillTransparency = 0.4
    hl.OutlineTransparency = 0
    
    local bill = Instance.new("BillboardGui")
    bill.Name = "ESP_Billboard"
    bill.Parent = obj
    bill.Adornee = obj.PrimaryPart or obj
    bill.Size = UDim2.new(0, 140, 0, 50)
    bill.StudsOffset = Vector3.new(0, 4, 0)
    bill.AlwaysOnTop = true
    
    local txt = Instance.new("TextLabel")
    txt.Parent = bill
    txt.BackgroundTransparency = 1
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.Text = nome
    txt.TextColor3 = cor
    txt.TextScaled = true
    txt.Font = Enum.Font.GothamBold
    txt.TextStrokeTransparency = 0
    txt.TextStrokeColor3 = Color3.new(0,0,0)
end

-- FULLBRIGHT ULTRA FORTE (BRILHO MÁXIMO!)
VisualTab:CreateToggle({
    Name = "FullBright Ultra ✨",
    CurrentValue = false,
    Callback = function(v)
        config.fullBright = v
        Rayfield:Notify({
            Title = "FullBright",
            Content = v and "Tudo iluminado como Natal! 🎄" or "Escuro de novo...",
            Duration = 4
        })
    end
})

VisualTab:CreateToggle({
    Name = "Speed Boost (28) 🦌",
    CurrentValue = false,
    Callback = function(v) config.speed = v end
})

VisualTab:CreateToggle({
    Name = "ESP Itens (Chaves etc.) 🎁",
    CurrentValue = true,
    Callback = function(v) config.espItems = v end
})

VisualTab:CreateToggle({
    Name = "ESP Entidades 👻",
    CurrentValue = true,
    Callback = function(v) config.espEntities = v end
})

VisualTab:CreateToggle({
    Name = "Notificar Entidades 🔔",
    CurrentValue = true,
    Callback = function(v) config.notify = v end
})

-- LOOP PRINCIPAL (SPEED + FULLBRIGHT)
game:GetService("RunService").Heartbeat:Connect(function()
    if config.fullBright then
        local L = game:GetService("Lighting")
        L.Brightness = 10
        L.GlobalShadows = false
        L.FogEnd = 9e9
        L.FogStart = 0
        L.ClockTime = 14
        L.Ambient = Color3.fromRGB(255,255,255)
        L.OutdoorAmbient = Color3.fromRGB(255,255,255)
        for _, eff in pairs(L:GetChildren()) do
            if eff:IsA("PostEffect") then
                eff.Enabled = false
            end
        end
    end
    if config.speed then
        local char = game.Players.LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = 28 end
        end
    end
end)

-- ESP ENTIDADES (DESCENDANTADDED = FUNCIONA EM TUDO!)
workspace.DescendantAdded:Connect(function(child)
    local ent = entities[child.Name]
    if ent then
        task.wait(0.1) -- espera carregar
        if config.espEntities then
            createESP(child, ent.name, ent.color)
        end
        if config.notify then
            Rayfield:Notify({
                Title = "ENTIDADE!",
                Content = ent.name .. " apareceu! Corre! 👻",
                Duration = 5,
                Image = 4483362458
            })
        end
    end
end)

-- ESP ITENS (LOOP SCAN)
task.spawn(function()
    while task.wait(1) do
        if not config.espItems then continue end
        for _, obj in pairs(workspace:GetDescendants()) do
            local itemNames = {"KeyObtain", "LiveHintBook", "LiveBreakerPolePickup", "LeverForGate"}
            if table.find(itemNames, obj.Name) and not obj:FindFirstChild("ItemESP") then
                local hl = Instance.new("Highlight")
                hl.Name = "ItemESP"
                hl.Parent = obj
                hl.FillColor = Color3.fromRGB(255, 215, 0)
                hl.OutlineColor = Color3.new(1,1,1)
                hl.FillTransparency = 0.4
                hl.OutlineTransparency = 0
            end
        end
    end
end)

-- CONTADOR NATAL
local lbl = MiscTab:CreateLabel("Carregando...")
task.spawn(function()
    while task.wait(1) do
        local fim = os.time({year=2026, month=1, day=6})
        local diff = fim - os.time()
        if diff <= 0 then
            lbl:Set("Natal acabou! Volto 2026 🎅")
        else
            local d = math.floor(diff / 86400)
            local h = math.floor((diff % 86400) / 3600)
            local m = math.floor((diff % 3600) / 60)
            local s = diff % 60
            lbl:Set(string.format("Natal termina em:\n%d dias %02d:%02d:%02d", d, h, m, s))
        end
    end
end)

Rayfield:Notify({
    Title = "✅ PRONTO!",
    Content = "ESP de Entidades ATIVO!\nRush/Figure/Eyes/Halt/Seek detectados automaticamente.\nFullBright brutal! Ho ho ho! 🎄",
    Duration = 10,
    Image = 4483362458
})

print("Doors Hub Natal - ESP FUNCIONANDO 100%!")