-- Eternal Night ESP - GOLD 2026 Compact
-- Atualizado: 28/01/2026
-- Compatível: Delta, Fluxus, KRNL Mobile

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

getgenv().ESP_PLAYERS = false
getgenv().ESP_ANIMS   = false
getgenv().ESP_ITEMS   = false
getgenv().ESP_COINS   = false
getgenv().SPEED       = 16
getgenv().COLOR       = Color3.fromRGB(255, 215, 0)  -- Dourado

-- ESP simples
local function addESP(target, color)
    if target and not target:FindFirstChildOfClass("Highlight") then
        local h = Instance.new("Highlight", target)
        h.FillColor = color or getgenv().COLOR
        h.OutlineColor = Color3.fromRGB(255, 215, 0)
        h.FillTransparency = 0.55
        h.OutlineTransparency = 0
        h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end

local function updateESP()
    for _, v in ipairs(Workspace:GetDescendants()) do
        local h = v:FindFirstChildOfClass("Highlight")
        if h then h:Destroy() end
    end

    if getgenv().ESP_PLAYERS then
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character then
                addESP(plr.Character, Color3.fromRGB(0, 170, 255))
            end
        end
    end

    if getgenv().ESP_ANIMS or getgenv().ESP_ITEMS or getgenv().ESP_COINS then
        for _, obj in ipairs(Workspace:GetDescendants()) do
            local name = obj.Name:lower()
            if getgenv().ESP_ANIMS   and (name:find("animatronic") or name:find("bonnie") or name:find("freddy") or name:find("chica") or name:find("foxy")) then
                addESP(obj, Color3.fromRGB(255, 60, 60))
            elseif getgenv().ESP_ITEMS  and (name:find("item") or name:find("gift") or name:find("present") or name:find("tool")) then
                addESP(obj, Color3.fromRGB(100, 255, 100))
            elseif getgenv().ESP_COINS  and (name:find("coin") or name:find("money") or name:find("cash")) then
                addESP(obj, Color3.fromRGB(255, 215, 0))
            end
        end
    end
end

task.spawn(function()
    while true do
        if getgenv().ESP_PLAYERS or getgenv().ESP_ANIMS or getgenv().ESP_ITEMS or getgenv().ESP_COINS then
            updateESP()
        end
        task.wait(0.8)
    end
end)

-- Menu
local Window = Rayfield:CreateWindow({
    Name = "ESP GOLD 2026",
    LoadingTitle = "Carregando...",
    LoadingSubtitle = "28/01/2026",
    ConfigurationSaving = {Enabled = false},
    KeySystem = false
})

local Tab = Window:CreateTab("Principal")

Tab:CreateToggle({Name = "Jogadores", CurrentValue = false, Callback = function(v) getgenv().ESP_PLAYERS = v end})
Tab:CreateToggle({Name = "Animatrônicos", CurrentValue = false, Callback = function(v) getgenv().ESP_ANIMS = v end})
Tab:CreateToggle({Name = "Itens", CurrentValue = false, Callback = function(v) getgenv().ESP_ITEMS = v end})
Tab:CreateToggle({Name = "Moedas", CurrentValue = false, Callback = function(v) getgenv().ESP_COINS = v end})

Tab:CreateButton({Name = "Limpar ESP", Callback = function()
    for _, v in ipairs(Workspace:GetDescendants()) do
        local h = v:FindFirstChildOfClass("Highlight")
        if h then h:Destroy() end
    end
end})

Tab:CreateSlider({Name = "Velocidade", Range = {16, 50}, Increment = 1, CurrentValue = 16, Callback = function(v)
    getgenv().SPEED = v
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
end})

Tab:CreateColorPicker({Name = "Cor Principal", Color = Color3.fromRGB(255, 215, 0), Callback = function(c)
    getgenv().COLOR = c
    Rayfield:SetTheme({Accent = c})
end})

-- Novo botão solicitado (só isso foi adicionado)
Tab:CreateButton({
    Name = "Aumentar Brilho do Jogo",
    Callback = function()
        Lighting.Brightness = Lighting.Brightness + 1
        -- Pode apertar várias vezes pra ir aumentando mais
    end
})

Rayfield:Notify({
    Title = "ESP GOLD 2026",
    Content = "Carregado • 28/01/2026",
    Duration = 4
})