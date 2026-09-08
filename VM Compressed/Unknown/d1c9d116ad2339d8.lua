-- Atualmente Open-Source!
-- Permitido: Adotar algumas funções em seu script , verificar se é seguro
-- Não permitido: Copiar o script totalmente , Recriar com KeySystem
-- Aproveite :)

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XScommunity/XXMZ/refs/heads/main/tinc"))()
WindUI:Popup({
    Title = "XXMZ HUB v2.0",
    Content = "Hub convertido para WindUI. Caso encontre erros, entre em nosso discord e avise.",
    Buttons = {
        {
            Title = "Discord",
            Callback = function()
                setclipboard("https://discord.gg/YXJ2xaEwP2")
                WindUI:Notify({
                    Title = "Convite copiado",
                    Content = "O convite foi copiado para sua área de transferência!",
                    Duration = 3,
                    Icon = "message-circle",
                })
            end
        },
        {
            Title = "Fechar",
            Callback = function()
                print("Popup fechado")
            end
        }
    }
})

local Window = WindUI:CreateWindow({
    Title = "☑️ XXMZ HUB | Forsaken",
    Icon = "door-open", -- lucide icon
    Author = "discord.gg/YXJ2xaEwP2",
    Folder = "XXMZHUBFORSAKEN",
    
    Size = UDim2.fromOffset(600, 480),
    MinSize = Vector2.new(580, 370),
    MaxSize = Vector2.new(900, 600),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = false,
    ScrollBarEnabled = true,
    Background = "rbxassetid://106924593304955",

        -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://106924593304955':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    
    
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
        end,
    },

    KeySystem = { 
        Key = { "xxmz25" },
        Note = "Resgate a key em nosso discord .gg/YXJ2xaEwP2",
        Thumbnail = {
            Image = "rbxassetid://89646996763231",
            Title = "XXMZ Hub",
        },
        URL = "https://discord.gg/YXJ2xaEwP2",
        SaveKey = true,
    },
})

-- =============================
-- MAIN TAB
-- =============================
local MainTab = Window:Tab({
    Title = "Principal",
    Icon = "house",
    Locked = false,
})

local autoFarmEnabled = false
local autoFarmConnection = nil

local function autoFarmLoop()
    while autoFarmEnabled do
        wait(0.1)
        
        local currencyLocation = workspace.Map.Ingame:FindFirstChild("CurrencyLocations")
        if not currencyLocation then continue end
        
        local allModels = {}
        for _, v in pairs(currencyLocation:GetChildren()) do
            if v:IsA("Model") and v.PrimaryPart then
                table.insert(allModels, v)
            end
        end
        
        print("Modelos encontrados: " .. #allModels) -- Debug
        
        for i = 1, #allModels do
            if not autoFarmEnabled then break end
            
            local model = allModels[i]
            if model and model.Parent and model.PrimaryPart then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character and character:FindFirstChild("HumanoidRootPart") then
                    print("Teleportando para modelo " .. i) -- Debug
                    character.HumanoidRootPart.CFrame = model.PrimaryPart.CFrame
                    wait(2.5)
                end
            end
        end
    end
end

local AutoFarmToggle = MainTab:Toggle({
    Title = "AutoFarm Sugar",
    Desc = "Teleporta automaticamente para coletar moedas",
    Icon = "coins",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        autoFarmEnabled = state
        
        if autoFarmEnabled then
            spawn(autoFarmLoop)
        else
            currentTarget = nil
        end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local killAllToggle = false
local killAllConnection = nil

local function getRandomSurvivor()
    local survivorsFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
    if not survivorsFolder then
        return nil
    end
    local survivors = survivorsFolder:GetChildren()
    if #survivors == 0 then
        return nil
    end
    return survivors[math.random(1, #survivors)]
end

local function startKillAll()
    local RunService = game:GetService("RunService")
    local currentSurvivor = getRandomSurvivor()
    
    killAllConnection = RunService.Heartbeat:Connect(function()
        if not killAllToggle then return end
        
        -- Verifica se o Survivor atual é válido
        if not currentSurvivor or not currentSurvivor.Parent or not currentSurvivor:FindFirstChild("HumanoidRootPart") then
            currentSurvivor = getRandomSurvivor()
            if not currentSurvivor then
                WindUI:Notify({
                    Title = "Kill All (Killer)",
                    Content = "Nenhum Survivor encontrado!",
                    Duration = 3,
                    Icon = "alert-triangle",
                })
                return
            end
        end
        
        -- Teleporta atrás do Survivor
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local survivorHRP = currentSurvivor:FindFirstChild("HumanoidRootPart")
            if survivorHRP then
                local offset = CFrame.new(-3, 0, 0) -- 3 studs atrás
                character.HumanoidRootPart.CFrame = survivorHRP.CFrame * offset
            end
        end
        
        -- Spamma o RemoteEvent
        local success, remoteEvent = pcall(function()
            return ReplicatedStorage:WaitForChild("Modules", 5):WaitForChild("Network", 5):WaitForChild("RemoteEvent", 5)
        end)
        if success and remoteEvent then
            local args = {
                "UseActorAbility",
                {
                    "Slash"
                }
            }
            remoteEvent:FireServer(unpack(args))
        end
    end)
end

local function stopKillAll()
    if killAllConnection then
        killAllConnection:Disconnect()
        killAllConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Kill All (Killer)",
    Desc = "Teleporta atrás de Survivors e spamma ataque",
    Icon = "skull",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        killAllToggle = state
        if state then
            local survivorsFolder = Workspace:FindFirstChild("Players") and Workspace.Players:FindFirstChild("Survivors")
            if not survivorsFolder or #survivorsFolder:GetChildren() == 0 then
                WindUI:Notify({
                    Title = "Kill All (Killer)",
                    Content = "Nenhum Survivor encontrado!",
                    Duration = 3,
                    Icon = "alert-triangle",
                })
                killAllToggle = false
                return
            end
            startKillAll()
            WindUI:Notify({
                Title = "Kill All (Killer)",
                Content = "Kill All ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopKillAll()
            WindUI:Notify({
                Title = "Kill All (Killer)",
                Content = "Kill All desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Função pra coletar emotes de Purchased.Emotes
local function getEmoteList()
    local playerData = LocalPlayer:WaitForChild("PlayerData")
    local purchasedEmotes = playerData:WaitForChild("Purchased"):WaitForChild("Emotes")
    local emoteList = {}
    
    for _, emote in pairs(purchasedEmotes:GetChildren()) do
        table.insert(emoteList, emote.Name)
    end
    
    return emoteList
end

-- Dropdown pra selecionar um único emote
local Dropdown = MainTab:Dropdown({
    Title = "Emote as Killer",
    Values = getEmoteList(),
    Value = nil, -- Começa sem seleção
    Multi = false, -- Permite apenas um emote
    AllowNone = true,
    Callback = function(option)
        print("Emote selecionado: " .. (option or "Nenhum"))
    end
})

-- Botão pra começar a dança
local DanceButton = MainTab:Button({
    Title = "Dançar Emote",
    Desc = "Toca o emote selecionado",
    Locked = false,
    Callback = function()
        local selectedEmote = Dropdown.Value -- Pega o emote selecionado
        if selectedEmote then
            local args = {
                "PlayEmote",
                {
                    buffer.fromstring("\"Animations\""),
                    buffer.fromstring("\"" .. selectedEmote .. "\"")
                }
            }
            local remoteEvent = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent")
            remoteEvent:FireServer(unpack(args))
            print("Tocando emote: " .. selectedEmote)
        else
            warn("Nenhum emote selecionado!")
        end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Button = MainTab:Button({
    Title = "Todos emotes equipados",
    Desc = "Quebra o limite de minimo de emotes equipados",
    Locked = false,
    Callback = function()
        local playerData = LocalPlayer:WaitForChild("PlayerData")
        local purchasedEmotes = playerData:WaitForChild("Purchased"):WaitForChild("Emotes")
        local equippedEmotes = playerData:WaitForChild("Equipped"):WaitForChild("Emotes")
        
        -- Junta todos os nomes dos emotes em uma string com "|"
        local emoteList = {}
        for _, emote in pairs(purchasedEmotes:GetChildren()) do
            table.insert(emoteList, emote.Name)
        end
        local emoteString = table.concat(emoteList, "|")
        
        -- Modifica o StringValue "Emotes" em Equipped.Emotes
        local emoteValue = equippedEmotes
        if emoteValue and emoteValue:IsA("StringValue") and emoteValue.Name == "Emotes" then
            emoteValue.Value = emoteString
        else
            warn("StringValue 'Emotes' não encontrado ou não é um StringValue em Equipped.Emotes!")
        end
    end
})

-- Show Chat Toggle
local Toggle = MainTab:Toggle({
    Title = "Show Chat",
    Desc = "Mantém o chat sempre visível",
    Icon = "message-circle",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        _G.showChat = value
        if value then
            task.spawn(function()
                while _G.showChat and task.wait() do
                    pcall(function()
                        local textChatService = game:GetService("TextChatService")
                        local chatConfig = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
                        if chatConfig then
                            chatConfig.Enabled = true
                        end
                    end)
                end
            end)
            WindUI:Notify({
                Title = "Show Chat",
                Content = "Chat sempre visível ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            _G.showChat = false
            pcall(function()
                local localPlayer = game.Players.LocalPlayer
                if workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Spectating") then
                    if not workspace.Players.Spectating:FindFirstChild(localPlayer.Name) then
                        local textChatService = game:GetService("TextChatService")
                        local chatConfig = textChatService:FindFirstChildOfClass("ChatWindowConfiguration")
                        if chatConfig then
                            chatConfig.Enabled = false
                        end
                    end
                end
            end)
            WindUI:Notify({
                Title = "Show Chat",
                Content = "Show Chat desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

-- Bring Items Toggle
local bringItemsToggle = false
local bringItemsConnection = nil

local function startBringItems()
    local RunService = game:GetService("RunService")
    bringItemsConnection = RunService.Heartbeat:Connect(function()
        if bringItemsToggle then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3549, 18, 254))
            end
            wait(0.05)
        end
    end)
end

local function stopBringItems()
    if bringItemsConnection then
        bringItemsConnection:Disconnect()
        bringItemsConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Bring Items",
    Desc = "Teleporte contínuo para pegar itens",
    Icon = "package",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        bringItemsToggle = value
        if value then
            startBringItems()
            WindUI:Notify({
                Title = "Bring Items",
                Content = "Teleporte contínuo ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopBringItems()
            WindUI:Notify({
                Title = "Bring Items",
                Content = "Teleporte contínuo desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

-- Kill Carl Toggle
local killCarlToggle = false
local killCarlConnection = nil

local function startKillCarl()
    local RunService = game:GetService("RunService")
    killCarlConnection = RunService.Heartbeat:Connect(function()
        if killCarlToggle then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3610, 12, 255))
            end
            wait(0.05)
        end
    end)
end

local function stopKillCarl()
    if killCarlConnection then
        killCarlConnection:Disconnect()
        killCarlConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Kill Carl",
    Desc = "Teleporte contínuo para matar Carl",
    Icon = "skull",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        killCarlToggle = value
        if value then
            startKillCarl()
            WindUI:Notify({
                Title = "Kill Carl",
                Content = "Teleporte para Carl ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopKillCarl()
            WindUI:Notify({
                Title = "Kill Carl",
                Content = "Kill Carl desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

local killCarlToggle = false
local killCarlConnection = nil

local function startKillCarl()
    local RunService = game:GetService("RunService")
    killCarlConnection = RunService.Heartbeat:Connect(function()
        if killCarlToggle then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3527, 12, 278))
            end
            wait(0.05)
        end
    end)
end

local function stopKillCarl()
    if killCarlConnection then
        killCarlConnection:Disconnect()
        killCarlConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Kill Roland",
    Desc = "Teleporte contínuo para matar Roland",
    Icon = "skull",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        killCarlToggle = value
        if value then
            startKillCarl()
            WindUI:Notify({
                Title = "Kill Carl",
                Content = "Teleporte para Carl ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopKillCarl()
            WindUI:Notify({
                Title = "Kill Carl",
                Content = "Kill Carl desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

local killCarlToggle = false
local killCarlConnection = nil

local function startKillCarl()
    local RunService = game:GetService("RunService")
    killCarlConnection = RunService.Heartbeat:Connect(function()
        if killCarlToggle then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3549, 12, 217))
            end
            wait(0.05)
        end
    end)
end

local function stopKillCarl()
    if killCarlConnection then
        killCarlConnection:Disconnect()
        killCarlConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Kill Brandon",
    Desc = "Teleporte contínuo para matar Brandon",
    Icon = "skull",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        killCarlToggle = value
        if value then
            startKillCarl()
            WindUI:Notify({
                Title = "Kill Brandon",
                Content = "Teleporte para Brandon ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopKillCarl()
            WindUI:Notify({
                Title = "Kill Carl",
                Content = "Kill Carl desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

local killCarlToggle = false
local killCarlConnection = nil

local function startKillCarl()
    local RunService = game:GetService("RunService")
    killCarlConnection = RunService.Heartbeat:Connect(function()
        if killCarlToggle then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3613, 32, 229))
            end
            wait(0.05)
        end
    end)
end

local function stopKillCarl()
    if killCarlConnection then
        killCarlConnection:Disconnect()
        killCarlConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Kill TV GUY",
    Desc = "Teleporte contínuo para matar Brandon",
    Icon = "skull",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        killCarlToggle = value
        if value then
            startKillCarl()
            WindUI:Notify({
                Title = "Kill TV GUY",
                Content = "Teleporte para TV GUY ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopKillCarl()
            WindUI:Notify({
                Title = "Kill TV GUY",
                Content = "Kill TV GUY desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

local killCarlToggle = false
local killCarlConnection = nil

local function startKillCarl()
    local RunService = game:GetService("RunService")
    killCarlConnection = RunService.Heartbeat:Connect(function()
        if killCarlToggle then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3650, 15, 219))
            end
            wait(0.05)
        end
    end)
end

local function stopKillCarl()
    if killCarlConnection then
        killCarlConnection:Disconnect()
        killCarlConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Kill TV GUY 2",
    Desc = "Teleporte contínuo para matar Brandon",
    Icon = "skull",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        killCarlToggle = value
        if value then
            startKillCarl()
            WindUI:Notify({
                Title = "Kill TV GUY",
                Content = "Teleporte para TV GUY ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopKillCarl()
            WindUI:Notify({
                Title = "Kill TV GUY 2",
                Content = "Kill TV GUY 2 desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

local killCarlToggle = false
local killCarlConnection = nil

local function startKillCarl()
    local RunService = game:GetService("RunService")
    killCarlConnection = RunService.Heartbeat:Connect(function()
        if killCarlToggle then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3574, 13, 270))
            end
            wait(0.05)
        end
    end)
end

local function stopKillCarl()
    if killCarlConnection then
        killCarlConnection:Disconnect()
        killCarlConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Kill TV MAN",
    Desc = "Teleporte contínuo para matar TV MAN",
    Icon = "skull",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        killCarlToggle = value
        if value then
            startKillCarl()
            WindUI:Notify({
                Title = "Kill TV MAN",
                Content = "Teleporte para TV GUY ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopKillCarl()
            WindUI:Notify({
                Title = "Kill TV MAN",
                Content = "Kill TV MAN desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

-- Kill Rager Toggle
local killRagerToggle = false
local killRagerConnection = nil

local function startKillRager()
    local RunService = game:GetService("RunService")
    killRagerConnection = RunService.Heartbeat:Connect(function()
        if killRagerToggle then
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(Vector3.new(-3646, 12, 255))
            end
            wait(0.05)
        end
    end)
end

local function stopKillRager()
    if killRagerConnection then
        killRagerConnection:Disconnect()
        killRagerConnection = nil
    end
end

local Toggle = MainTab:Toggle({
    Title = "Kill Rager",
    Desc = "Teleporte contínuo para matar Rager",
    Icon = "zap",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        killRagerToggle = value
        if value then
            startKillRager()
            WindUI:Notify({
                Title = "Kill Rager",
                Content = "Teleporte para Rager ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            stopKillRager()
            WindUI:Notify({
                Title = "Kill Rager",
                Content = "Kill Rager desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

-- Auto Complete Generator
local Toggle = MainTab:Toggle({
    Title = "Auto Complete Generator",
    Desc = "Completa geradores automaticamente",
    Icon = "zap",
    Type = "Checkbox",
    Default = false,
    Callback = function(bool)
        _G.instantGenerator = bool
        if bool then
            task.spawn(function()
                while _G.instantGenerator do
                    local map = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("Ingame") and workspace.Map.Ingame:FindFirstChild("Map")
                    if map then
                        for _, gen in pairs(map:GetChildren()) do
                            if gen:IsA("Model") and gen.Name == "Generator" then
                                local re = gen:FindFirstChild("Remotes") and gen.Remotes:FindFirstChild("RE")
                                if re then
                                    re:FireServer()
                                end
                            end
                        end
                    end
                    task.wait(2.5)
                end
            end)
        end
    end
})

-- Reach Expander
local function getHitboxesFromPlayer()
    local hitboxes = workspace:FindFirstChild("Hitboxes")
    if hitboxes then
        for _, v in pairs(hitboxes:GetChildren()) do
            if string.find(v.Name, game.Players.LocalPlayer.Name) then
                return true
            end
        end
    end
    return false
end

local Toggle = MainTab:Toggle({
    Title = "Reach Expander",
    Desc = "Aumenta seu alcance",
    Icon = "maximize",
    Type = "Checkbox",
    Default = false,
    Callback = function(bool)
        _G.hitboxExpander = bool
        if bool then
            WindUI:Notify({
                Title = "Reach Expander",
                Content = "Reach Expander ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            WindUI:Notify({
                Title = "Reach Expander",
                Content = "Reach Expander desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

-- Sistema do Reach Expander executando em loop separado
task.spawn(function()
    while true do
        if _G.hitboxExpander and getHitboxesFromPlayer() then
            local localPlayer = game.Players.LocalPlayer
            local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local currentVelocity = hrp.Velocity
                hrp.AssemblyLinearVelocity = hrp.CFrame.LookVector * 250
                game:GetService("RunService").RenderStepped:Wait()
                hrp.Velocity = currentVelocity 
            end
        end
        task.wait()
    end
end)

local Toggle = MainTab:Toggle({
    Title = "Anti Death",
    Desc = "Te teleporta quando killers estão próximos",
    Icon = "shield",
    Type = "Checkbox",
    Default = false,
    Callback = function(val)
        _G.antiDeath = val
        if val then
            task.spawn(function()
                while _G.antiDeath and task.wait(0.1) do
                    local player = game.Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoid = character:FindFirstChild("Humanoid")
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    
                    if hrp and humanoid and humanoid.Health > 0 then
                        -- CORRIGIDO: Caminho correto pros killers
                        local playersFolder = workspace:FindFirstChild("Players")
                        local killersFolder = playersFolder and playersFolder:FindFirstChild("Killers")
                        
                        if killersFolder then
                            for _, killer in pairs(killersFolder:GetChildren()) do
                                if killer and killer:FindFirstChild("HumanoidRootPart") then
                                    local distance = (killer.HumanoidRootPart.Position - hrp.Position).Magnitude
                                    
                                    if distance <= 18 then
                                        -- Teleporta para posição segura
                                        hrp.CFrame = CFrame.new(-3560, 12, 255)
                                        print("[Anti Death] Teleportado! Killer detectado a " .. math.floor(distance) .. " studs")
                                        
                                        WindUI:Notify({
                                            Title = "Anti Death",
                                            Content = "Killer detectado! Teleportado para segurança.",
                                            Duration = 2,
                                            Icon = "shield",
                                        })
                                        
                                        task.wait(2) -- Cooldown após teleporte
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            
            WindUI:Notify({
                Title = "Anti Death",
                Content = "Anti Death ativado!",
                Duration = 3,
                Icon = "check",
            })
        else
            WindUI:Notify({
                Title = "Anti Death",
                Content = "Anti Death desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

-- Allow Jump
local Toggle = MainTab:Toggle({
    Title = "Allow Jump",
    Desc = "Permite pular quando bloqueado",
    Icon = "arrow-up",
    Type = "Checkbox",
    Default = false,
    Callback = function(val)
        _G.allowJump = val
        if val then
            task.spawn(function()
                while _G.allowJump do
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    if character and character:FindFirstChild("Humanoid") then
                        if character.Humanoid.JumpPower == 0 then
                            character.Humanoid.JumpPower = 50
                        end
                    end
                    task.wait(3)
                end
            end)
        end
    end
})

-- Infinite Stamina
local infiniteStaminaToggle = false
local oldStamina = nil

local Toggle = MainTab:Toggle({
    Title = "Infinite Stamina",
    Desc = "Stamina infinita",
    Icon = "battery",
    Type = "Checkbox",
    Default = false,
    Callback = function(Value)
        infiniteStaminaToggle = Value
        local success, sprintModule = pcall(function()
            return require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
        end)

        if success and sprintModule then
            if Value then
                oldStamina = sprintModule.Stamina
                task.spawn(function()
                    while infiniteStaminaToggle do
                        sprintModule.Stamina = sprintModule.MaxStamina
                        if sprintModule.__staminaChangedEvent then
                            sprintModule.__staminaChangedEvent:Fire()
                        end
                        task.wait()
                    end
                end)
                WindUI:Notify({
                    Title = "Infinite Stamina",
                    Content = "Stamina infinita ativada!",
                    Duration = 3,
                    Icon = "check",
                })
            else
                if oldStamina then
                    sprintModule.Stamina = oldStamina
                    if sprintModule.__staminaChangedEvent then
                        sprintModule.__staminaChangedEvent:Fire()
                    end
                end
                WindUI:Notify({
                    Title = "Infinite Stamina",
                    Content = "Stamina infinita desativada!",
                    Duration = 2,
                    Icon = "x",
                })
            end
        else
            WindUI:Notify({
                Title = "Erro",
                Content = "Não foi possível acessar o módulo de Sprint.",
                Duration = 3,
                Icon = "alert-triangle",
            })
        end
    end
})

-- Invisibility
local loopRunning, loopThread, currentAnim, lastAnim
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://75804462760596"

local function enableNoclip()
    local localPlayer = game.Players.LocalPlayer
    if localPlayer.Character then
        for _, v in pairs(localPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end

local Toggle = MainTab:Toggle({
    Title = "Invisible",
    Desc = "Torna você invisível (só funciona no Forsaken real)",
    Icon = "eye-off",
    Type = "Checkbox",
    Default = false,
    Callback = function(Value)
        local localPlayer = game.Players.LocalPlayer
        
        if game.PlaceId ~= 18687417158 then
            if Value then
                WindUI:Notify({
                    Title = "Aviso",
                    Content = "Use apenas no Forsaken real! Não funciona em outros jogos.",
                    Duration = 8,
                    Icon = "alert-triangle",
                })
                return
            end
        end
        
        if Value then
            WindUI:Notify({
                Title = "Aviso",
                Content = "Você ainda pode ser visto com certas habilidades!",
                Duration = 6,
                Icon = "info",
            })
            loopRunning = true

            loopThread = task.spawn(function()
                while loopRunning do
                    local hum = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") and localPlayer.Character:FindFirstChild("Humanoid")
                    if hum then
                        enableNoclip()
                    end

                    if hum then
                        local loadedAnim = hum:LoadAnimation(anim)
                        currentAnim = loadedAnim
                        loadedAnim.Looped = false
                        loadedAnim:Play()
                        loadedAnim:AdjustSpeed(0)
                        task.wait(0.1)
                        if lastAnim then
                            lastAnim:Stop()
                            lastAnim:Destroy()
                        end
                        lastAnim = currentAnim
                    else
                        currentAnim = nil
                    end
                    task.wait()
                end
            end)
        else
            loopRunning = false

            if loopThread then
                loopRunning = false
                task.cancel(loopThread)
            end

            if currentAnim then
                currentAnim:Stop()
                currentAnim = nil
            end

            local Humanoid = localPlayer.Character and (localPlayer.Character:FindFirstChildOfClass("Humanoid") or localPlayer.Character:FindFirstChildOfClass("AnimationController"))
            if Humanoid then
                for _, v in pairs(Humanoid:GetPlayingAnimationTracks()) do
                    v:AdjustSpeed(100000)
                end
                for _, v in pairs(localPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end

            local animateScript = localPlayer.Character and localPlayer.Character:FindFirstChild("Animate")
            if animateScript then
                animateScript.Disabled = true
                animateScript.Disabled = false
            end
            
            WindUI:Notify({
                Title = "Invisible",
                Content = "Invisibilidade desativada!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

-- =============================
-- ANIMATIONS TAB
-- =============================
local AnimationTab = Window:Tab({
    Title = "Animações",
    Icon = "play",
    Locked = false,
})

local Button = AnimationTab:Button({
    Title = "Hakari Dance",
    Desc = "\"For 4 minutes and 11 seconds, Hakari is effectively immortal!\"",
    Locked = false,
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        
        -- Espera o personagem carregar se necessário
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local rootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Animação em loop
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if not animator then
            animator = Instance.new("Animator")
            animator.Parent = humanoid
        end
        
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://138019937280193"
        local animTrack = animator:LoadAnimation(anim)
        animTrack.Looped = true
        animTrack:Play()
        
        -- SFX em loop
        local sound = Instance.new("Sound")
        sound.Name = "HakariDanceSound"
        sound.SoundId = "rbxassetid://109474987384441"
        sound.Looped = true
        sound.Volume = 0.5
        sound.Parent = rootPart
        sound:Play()
        
        -- VFX (Efeito Visual)
        local vfx = nil
        pcall(function()
            local RS = game:GetService("ReplicatedStorage")
            local path = RS:FindFirstChild("Assets")
            if path then
                path = path:FindFirstChild("Emotes")
                if path then
                    path = path:FindFirstChild("HakariDance")
                    if path then
                        local vfxTemplate = path:FindFirstChild("HakariBeamEffect")
                        if vfxTemplate then
                            vfx = vfxTemplate:Clone()
                            vfx.Name = "PlayerEmoteVFX"
                            vfx.CFrame = rootPart.CFrame * CFrame.new(0, -1, -0.3)
                            
                            -- Solda o VFX ao personagem
                            if vfx:FindFirstChild("WeldConstraint") then
                                vfx.WeldConstraint.Part0 = rootPart
                                vfx.WeldConstraint.Part1 = vfx
                            else
                                local weld = Instance.new("WeldConstraint")
                                weld.Part0 = rootPart
                                weld.Part1 = vfx
                                weld.Parent = vfx
                            end
                            
                            vfx.Parent = character
                        end
                    end
                end
            end
        end)
        
        -- Salva tudo globalmente
        _G.HakariDanceActive = {
            animTrack = animTrack,
            sound = sound,
            vfx = vfx,
            character = character
        }
        
        WindUI:Notify({
            Title = "Hakari Dance Ativado",
            Content = "Animação, música e VFX ativados! (Efeitos são apenas visuais)",
            Duration = 4,
            Icon = "shield",
        })
    end
})

-- Botão para parar tudo
local StopButton = AnimationTab:Button({
    Title = "Stop Animation",
    Desc = "Para a animação, música e efeitos visuais",
    Locked = false,
    Callback = function()
        local stopped = false
        
        -- Para a Hakari Dance
        if _G.HakariDanceActive then
            -- Para a animação
            if _G.HakariDanceActive.animTrack then
                pcall(function()
                    _G.HakariDanceActive.animTrack:Stop()
                    _G.HakariDanceActive.animTrack:Destroy()
                end)
                stopped = true
            end
            
            -- Para e remove o som
            if _G.HakariDanceActive.sound then
                pcall(function()
                    _G.HakariDanceActive.sound:Stop()
                    _G.HakariDanceActive.sound:Destroy()
                end)
                stopped = true
            end
            
            -- Remove o VFX
            if _G.HakariDanceActive.vfx then
                pcall(function()
                    _G.HakariDanceActive.vfx:Destroy()
                end)
                stopped = true
            end
            
            _G.HakariDanceActive = nil
        end
        
        -- Limpeza adicional no personagem
        pcall(function()
            local player = game:GetService("Players").LocalPlayer
            local character = player.Character
            
            if character then
                -- Remove sons restantes
                for _, obj in pairs(character:GetDescendants()) do
                    if obj:IsA("Sound") and obj.Name == "HakariDanceSound" then
                        obj:Stop()
                        obj:Destroy()
                        stopped = true
                    end
                end
                
                -- Remove VFX restantes
                local vfxObj = character:FindFirstChild("PlayerEmoteVFX")
                if vfxObj then
                    vfxObj:Destroy()
                    stopped = true
                end
                
                -- Para todas as animações
                local humanoid = character:FindFirstChild("Humanoid")
                if humanoid then
                    local animator = humanoid:FindFirstChildOfClass("Animator")
                    if animator then
                        for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                            if track.Animation and track.Animation.AnimationId == "rbxassetid://138019937280193" then
                                track:Stop()
                                stopped = true
                            end
                        end
                    end
                end
            end
        end)
        
        if stopped then
            WindUI:Notify({
                Title = "Stop Animation",
                Content = "Todas as animações e efeitos foram parados!",
                Duration = 3,
                Icon = "square",
            })
        else
            WindUI:Notify({
                Title = "Stop Animation",
                Content = "Nenhuma animação ativa encontrada.",
                Duration = 3,
                Icon = "info",
            })
        end
    end
})

local Button = AnimationTab:Button({
    Title = "Fake Stun (Shedletsky)",
    Desc = "Simula animacao",
    Locked = false,
    Callback = function()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://116618003477002"
            
            local animTrack = humanoid:LoadAnimation(anim)
            animTrack.Looped = false
            animTrack:Play()
            
            WindUI:Notify({
                Title = "Fake Sword",
                Content = "Animacao de espada shed ativada!",
                Duration = 3,
                Icon = "shield",
            })
            
            _G.specialAnimTrack = animTrack
        else
            WindUI:Notify({
                Title = "Erro",
                Content = "Personagem nao encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
        end
    end
})

local Button = AnimationTab:Button({
    Title = "Fake Block",
    Desc = "Simula animacao de bloqueio",
    Locked = false,
    Callback = function()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://72722244508749"
            
            local animTrack = humanoid:LoadAnimation(anim)
            animTrack.Looped = false
            animTrack:Play()
            
            WindUI:Notify({
                Title = "Fake Block",
                Content = "Animacao de bloqueio ativada!",
                Duration = 3,
                Icon = "shield",
            })
            
            _G.specialAnimTrack = animTrack
        else
            WindUI:Notify({
                Title = "Erro",
                Content = "Personagem nao encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
        end
    end
})

-- Guest 666 Animation
local Button = AnimationTab:Button({
    Title = "Guest 666 Animation",
    Desc = "Executa animação do Guest 666",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XScommunity/XXMZ/refs/heads/main/anim"))()
        WindUI:Notify({
            Title = "Animação",
            Content = "Guest 666 Animation executada!",
            Duration = 3,
            Icon = "play",
        })
    end
})

-- Mafious Dance
local Button = AnimationTab:Button({
    Title = "Mafious Dance",
    Desc = "Inicia dança Mafious",
    Locked = false,
    Callback = function()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            
            -- Para animações anteriores
            for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                track:Stop()
            end
            
            -- Cria e carrega a animação
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://132946177664650"
            
            local animTrack = humanoid:LoadAnimation(anim)
            animTrack.Looped = true
            animTrack:Play()
            
            WindUI:Notify({
                Title = "Mafious Dance",
                Content = "Dança iniciada! Use 'Stop All' para parar.",
                Duration = 3,
                Icon = "play",
            })
            
            -- Guarda a referência da animação para poder parar depois
            _G.mafiousDanceTrack = animTrack
        else
            WindUI:Notify({
                Title = "Erro",
                Content = "Personagem não encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
        end
    end
})

-- Noli Animation
local Button = AnimationTab:Button({
    Title = "Noli Animation",
    Desc = "Executa animação Noli",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XScommunity/MAXZZ/refs/heads/main/noli"))()
        WindUI:Notify({
            Title = "Animação",
            Content = "Noli Animation executada!",
            Duration = 3,
            Icon = "play",
        })
    end
})

-- Stop All Animations
local Button = AnimationTab:Button({
    Title = "Stop All Animations",
    Desc = "Para todas as animações",
    Locked = false,
    Callback = function()
        local localPlayer = game.Players.LocalPlayer
        local character = localPlayer.Character
        
        if character and character:FindFirstChild("Humanoid") then
            local humanoid = character.Humanoid
            
            -- Para todas as animações
            for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
                track:Stop()
            end
            
            -- Limpa referências globais
            _G.mafiousDanceTrack = nil
            
            -- Restaura animações padrão se estavam substituídas
            if _G.noliAnimationEnabled then
                _G.noliAnimationEnabled = false
            end
            
            WindUI:Notify({
                Title = "Stop Animations",
                Content = "Todas as animações foram paradas!",
                Duration = 2,
                Icon = "square",
            })
        else
            WindUI:Notify({
                Title = "Erro",
                Content = "Personagem não encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
        end
    end
})

local ESPTab = Window:Tab({
    Title = "ESP",
    Icon = "eye",
    Locked = false,
})

local espEnabled = false
local espConnections = {}
local espHighlights = {}

local function createESP(model)
    if not model:IsA("Model") or espHighlights[model] then return end
    
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(138, 43, 226) -- Roxo
    highlight.OutlineColor = Color3.fromRGB(75, 0, 130) -- Roxo escuro
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
    highlight.Parent = model
    
    espHighlights[model] = highlight
    
    model.AncestryChanged:Connect(function()
        if not model:IsDescendantOf(workspace) then
            if espHighlights[model] then
                espHighlights[model]:Destroy()
                espHighlights[model] = nil
            end
        end
    end)
end

local function removeESP(model)
    if espHighlights[model] then
        espHighlights[model]:Destroy()
        espHighlights[model] = nil
    end
end

local function updateESP()
    local currencyLocation = workspace.Map.Ingame:FindFirstChild("CurrencyLocations")
    
    if currencyLocation then
        for _, model in pairs(currencyLocation:GetChildren()) do
            if model:IsA("Model") then
                createESP(model)
            end
        end
    end
end

local function clearAllESP()
    for model, highlight in pairs(espHighlights) do
        highlight:Destroy()
    end
    espHighlights = {}
end

local ESPToggle = ESPTab:Toggle({
    Title = "ESP Sugar",
    Desc = "Mostra ESP roxo nos itens de moeda",
    Icon = "eye",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        espEnabled = state
        
        if espEnabled then
            -- Atualizar ESP continuamente
            espConnections.updateLoop = game:GetService("RunService").Heartbeat:Connect(function()
                updateESP()
            end)
            
            -- Detectar quando CurrencyLocations é adicionado
            espConnections.childAdded = workspace.Map.Ingame.ChildAdded:Connect(function(child)
                if child.Name == "CurrencyLocations" then
                    wait(0.1)
                    updateESP()
                end
            end)
            
            updateESP()
        else
            -- Limpar tudo
            for _, conn in pairs(espConnections) do
                conn:Disconnect()
            end
            espConnections = {}
            clearAllESP()
        end
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Função para criar/remover ESP em uma pasta
local function manageESP(folder, state, highlightColor)
    local highlights = {} -- Tabela pra armazenar Highlights

    -- Função para adicionar ESP a um objeto
    local function addESP(object)
        if object:IsA("Model") or object:IsA("BasePart") then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = highlightColor
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.Adornee = object
            highlight.Parent = object
            highlights[object] = highlight
        end
    end

    -- Função para remover ESP de um objeto
    local function removeESP(object)
        local highlight = highlights[object]
        if highlight then
            highlight:Destroy()
            highlights[object] = nil
        end
    end

    -- Limpa todos os Highlights se o estado for false
    if not state then
        for object, highlight in pairs(highlights) do
            if highlight then
                highlight:Destroy()
            end
        end
        table.clear(highlights)
        return
    end

    -- Adiciona ESP a todos os objetos atuais na pasta
    for _, object in pairs(folder:GetChildren()) do
        addESP(object)
    end

    -- Monitora novos objetos adicionados
    folder.ChildAdded:Connect(function(object)
        if state then
            addESP(object)
        end
    end)

    -- Monitora objetos removidos
    folder.ChildRemoved:Connect(function(object)
        removeESP(object)
    end)
end

-- Toggle para ESP Killer
local KillerToggle = ESPTab:Toggle({
    Title = "ESP Killer",
    Desc = "",
    Icon = "eye",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        local killersFolder = Workspace:WaitForChild("Players"):WaitForChild("Killers")
        manageESP(killersFolder, state, Color3.fromRGB(255, 0, 0)) -- Vermelho pra Killers
    end
})

-- Toggle para ESP Survivor
local SurvivorToggle = ESPTab:Toggle({
    Title = "ESP Survivor",
    Desc = "",
    Icon = "eye",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        local survivorsFolder = Workspace:WaitForChild("Players"):WaitForChild("Survivors")
        manageESP(survivorsFolder, state, Color3.fromRGB(0, 255, 0)) -- Verde pra Survivors
    end
})

local Toggle = ESPTab:Toggle({
    Title = "Generators ESP",
    Desc = "Destaca os geradores no mapa",
    Icon = "eye",
    Type = "Checkbox",
    Default = false,
    Callback = function(bool)
        _G.generators = bool
        task.spawn(function()
            while task.wait() do
                if _G.generators then
                    pcall(function()
                        if workspace:FindFirstChild("Map") then
                            local gameMap = workspace.Map
                            if gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                                for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                    if v.Name == "Generator" and not v:FindFirstChild("gen_esp") then
                                        local hl = Instance.new("Highlight", v)
                                        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                        hl.Name = "gen_esp"
                                        hl.FillColor = Color3.fromRGB(255, 255, 51)
                                        hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                        hl.FillTransparency = 0.5
                                        hl.OutlineTransparency = 0
                                    elseif v:FindFirstChild("gen_esp") and v.Name == "Generator" then
                                        if v:FindFirstChild("Progress") then
                                            if v.Progress.Value >= 100 then
                                                v.gen_esp.FillColor = Color3.fromRGB(0, 255, 0)
                                            else
                                                v.gen_esp.FillColor = Color3.fromRGB(255, 255, 51)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindFirstChild("Map") then
                            local gameMap = workspace.Map
                            if gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                                for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                    if v.Name == "Generator" and v:FindFirstChild("gen_esp") then
                                        v.gen_esp:Destroy()
                                    end
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
})

-- Generators Nametags
local Toggle = ESPTab:Toggle({
    Title = "Generators Nametags",
    Desc = "Mostra o progresso dos geradores",
    Icon = "tag",
    Type = "Checkbox",
    Default = false,
    Callback = function(bool)
        _G.generatorstag = bool
        task.spawn(function()
            while task.wait() do
                if _G.generatorstag then
                    pcall(function()
                        if workspace:FindFirstChild("Map") then
                            local gameMap = workspace.Map
                            if gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                                for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                    if v.Name == "Generator" and not v:FindFirstChild("nametag") then
                                        local bb = Instance.new("BillboardGui", v)
                                        bb.Size = UDim2.new(4, 0, 1, 0)
                                        bb.AlwaysOnTop = true
                                        bb.Name = "nametag"

                                        local text = Instance.new("TextLabel", bb)
                                        text.TextStrokeTransparency = 0
                                        text.Text = "Generator (" .. (v:FindFirstChild("Progress") and v.Progress.Value or 0) .. "%)"
                                        text.TextSize = 15
                                        text.BackgroundTransparency = 1
                                        text.Size = UDim2.new(1, 0, 1, 0)
                                        text.TextColor3 = Color3.fromRGB(255, 255, 255)
                                    elseif v:FindFirstChild("nametag") and v.Name == "Generator" then
                                        if v:FindFirstChild("Progress") then
                                            v.nametag.TextLabel.Text = "Generator (" .. v.Progress.Value .. "%)"
                                        end
                                    end
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        if workspace:FindFirstChild("Map") then
                            local gameMap = workspace.Map
                            if gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                                for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                    if v.Name == "Generator" and v:FindFirstChild("nametag") then
                                        v.nametag:Destroy()
                                    end
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
})

local Toggle = ESPTab:Toggle({
    Title = "Items ESP",
    Desc = "Destaca itens no mapa",
    Icon = "package",
    Type = "Checkbox",
    Default = false,
    Callback = function(bool)
        _G.items = bool
        task.spawn(function()
            while task.wait() do
                if _G.items == true then
                    pcall(function()
                        local gameMap = workspace:FindFirstChild("Map")
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(gameMap.Ingame:GetChildren()) do
                                if v:IsA("Tool") and not v:FindFirstChild("tool_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "tool_esp"
                                    hl.FillColor = Color3.fromRGB(0, 255, 255)
                                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    hl.FillTransparency = 0.3
                                    hl.OutlineTransparency = 0
                                elseif v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp.FillColor = Color3.fromRGB(0, 255, 255)
                                    v.tool_esp.OutlineTransparency = 0
                                    v.tool_esp.FillTransparency = 0.3
                                    v.tool_esp.OutlineColor = Color3.fromRGB(255, 255, 255)
                                end
                            end
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") and not v:FindFirstChild("tool_esp") then
                                    local hl = Instance.new("Highlight", v)
                                    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    hl.Name = "tool_esp"
                                    hl.FillColor = Color3.fromRGB(0, 255, 255)
                                    hl.OutlineColor = Color3.fromRGB(255, 255, 255)
                                    hl.FillTransparency = 0.3
                                    hl.OutlineTransparency = 0
                                elseif v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp.FillColor = Color3.fromRGB(0, 255, 255)
                                    v.tool_esp.OutlineTransparency = 0
                                    v.tool_esp.FillTransparency = 0.3
                                    v.tool_esp.OutlineColor = Color3.fromRGB(255, 255, 255)
                                end
                            end
                        end
                    end)
                else
                    pcall(function()
                        local gameMap = workspace:FindFirstChild("Map")
                        if workspace:FindFirstChild("Map") and gameMap:FindFirstChild("Ingame") and gameMap.Ingame:FindFirstChild("Map") then
                            for _, v in pairs(gameMap.Ingame:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp:Destroy()
                                end
                            end
                            for _, v in pairs(gameMap.Ingame.Map:GetChildren()) do
                                if v:IsA("Tool") and v:FindFirstChild("tool_esp") then
                                    v.tool_esp:Destroy()
                                end
                            end
                        end
                    end)
                    break
                end
            end
        end)
    end
})

local Workspace = game:GetService("Workspace")

-- Função para gerenciar ESP na pasta 1x1x1Zombie
local function manageZombieESP(state)
    local highlights = {}
    local connectionAdded, connectionRemoved
    
    local function addESP(object)
        if object:IsA("Model") then
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Verde
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlight.Adornee = object
            highlight.Parent = object
            highlights[object] = highlight
        end
    end
    
    local function removeESP(object)
        local highlight = highlights[object]
        if highlight then
            highlight:Destroy()
            highlights[object] = nil
        end
    end
    
    local success, zombieFolder = pcall(function()
        return Workspace:WaitForChild("Map", 5):WaitForChild("Ingame", 5):WaitForChild("1x1x1Zombie", 5)
    end)
    
    if not success or not zombieFolder then
        warn("Pasta 1x1x1Zombie não encontrada!")
        WindUI:Notify({
            Title = "Esp 1x1 Zombies",
            Content = "Pasta 1x1x1Zombie não encontrada!",
            Duration = 3,
            Icon = "alert-triangle",
        })
        return
    end
    
    if not state then
        for object, highlight in pairs(highlights) do
            if highlight then
                highlight:Destroy()
            end
        end
        table.clear(highlights)
        if connectionAdded then connectionAdded:Disconnect() end
        if connectionRemoved then connectionRemoved:Disconnect() end
        return
    end
    
    for _, object in pairs(zombieFolder:GetChildren()) do
        addESP(object)
    end
    
    connectionAdded = zombieFolder.ChildAdded:Connect(function(object)
        if state then
            addESP(object)
        end
    end)
    
    connectionRemoved = zombieFolder.ChildRemoved:Connect(function(object)
        removeESP(object)
    end)
end

-- Toggle para ESP 1x1 Zombies
local ZombieToggle = ESPTab:Toggle({
    Title = "Esp 1x1 Zombies",
    Desc = "Destaca zombies em Workspace.Map.Ingame.1x1x1Zombie",
    Icon = "eye",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        manageZombieESP(state)
        WindUI:Notify({
            Title = "Esp 1x1 Zombies",
            Content = state and "ESP para zombies ativado!" or "ESP para zombies desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

local StatsTab = Window:Tab({
    Title = "Info",
    Icon = "user",
    Locked = false,
})

local paragraphs = {
    timePlayed = nil,
    killerHeader = nil,
    killerStats = {},
    survivorHeader = nil,
    survivorStats = {},
    emotesHeader = nil,
    emotes = nil,
    killerEquipHeader = nil,
    killerEquip = {},
    survivorEquipHeader = nil,
    survivorEquip = {}
}

local connections = {}

local function disconnectAll()
    for _, conn in pairs(connections) do
        conn:Disconnect()
    end
    connections = {}
end

-- Função para converter segundos em formato legível
local function formatTime(seconds)
    local days = math.floor(seconds / 86400)
    local hours = math.floor((seconds % 86400) / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = math.floor(seconds % 60)
    
    local parts = {}
    if days > 0 then
        table.insert(parts, days .. " Dia" .. (days > 1 and "s" or ""))
    end
    if hours > 0 then
        table.insert(parts, hours .. " Hora" .. (hours > 1 and "s" or ""))
    end
    if minutes > 0 then
        table.insert(parts, minutes .. " Minuto" .. (minutes > 1 and "s" or ""))
    end
    if secs > 0 or #parts == 0 then
        table.insert(parts, secs .. " Segundo" .. (secs > 1 and "s" or ""))
    end
    
    return table.concat(parts, ", ")
end

local PlayerNameInput = StatsTab:Input({
    Title = "Nome do Jogador",
    Desc = "Digite o nome do jogador para ver os status",
    Placeholder = "Nome do jogador",
    Locked = false,
    Callback = function(name)
        disconnectAll() -- Desconecta todas as conexões antigas

        local player = Players:FindFirstChild(name)
        if not player then
            WindUI:Notify({
                Title = "Erro",
                Content = "Jogador não encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
            return
        end

        local playerData = player:FindFirstChild("PlayerData")
        if not playerData then
            WindUI:Notify({
                Title = "Erro",
                Content = "PlayerData não encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
            return
        end

        local stats = playerData:FindFirstChild("Stats")
        if not stats then
            WindUI:Notify({
                Title = "Erro",
                Content = "Stats não encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
            return
        end

        -- Tempo Jogado
        local general = stats:FindFirstChild("General")
        if general then
            local timePlayed = general:FindFirstChild("TimePlayed")
            if timePlayed and (timePlayed:IsA("NumberValue") or timePlayed:IsA("IntValue")) then
                if not paragraphs.timePlayed then
                    paragraphs.timePlayed = StatsTab:Paragraph({
                        Title = "⏱️ Tempo Jogado",
                        Desc = formatTime(timePlayed.Value),
                        Color = "Blue",
                        Locked = false,
                    })
                else
                    paragraphs.timePlayed:SetTitle("⏱️ Tempo Jogado")
                    paragraphs.timePlayed:SetDesc(formatTime(timePlayed.Value))
                end
                
                local conn = timePlayed.Changed:Connect(function(newValue)
                    paragraphs.timePlayed:SetDesc(formatTime(newValue))
                end)
                table.insert(connections, conn)
            end
        end

        local killerStats = stats:FindFirstChild("KillerStats")
        local survivorStats = stats:FindFirstChild("SurvivorStats")
        if not killerStats or not survivorStats then
            WindUI:Notify({
                Title = "Erro",
                Content = "KillerStats ou SurvivorStats não encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
            return
        end

        -- Killer Stats Header
        if not paragraphs.killerHeader then
            paragraphs.killerHeader = StatsTab:Paragraph({
                Title = "Killer Stats de " .. name,
                Desc = "Status do jogador como Killer",
                Color = "Green",
                Locked = false,
            })
        else
            paragraphs.killerHeader:SetTitle("Killer Stats de " .. name)
            paragraphs.killerHeader:SetDesc("Status do jogador como Killer")
        end

        -- Killer Stats
        local killerIndex = 1
        for _, stat in ipairs(killerStats:GetChildren()) do
            if stat:IsA("NumberValue") or stat:IsA("IntValue") or stat:IsA("StringValue") then
                if not paragraphs.killerStats[killerIndex] then
                    paragraphs.killerStats[killerIndex] = StatsTab:Paragraph({
                        Title = stat.Name .. ": " .. tostring(stat.Value),
                        Desc = "",
                        Color = "Green",
                        Locked = false,
                    })
                else
                    paragraphs.killerStats[killerIndex]:SetTitle(stat.Name .. ": " .. tostring(stat.Value))
                    paragraphs.killerStats[killerIndex]:SetDesc("")
                end
                
                local conn = stat.Changed:Connect(function(newValue)
                    paragraphs.killerStats[killerIndex]:SetTitle(stat.Name .. ": " .. tostring(newValue))
                end)
                table.insert(connections, conn)
                killerIndex = killerIndex + 1
            end
        end

        -- Survivor Stats Header
        if not paragraphs.survivorHeader then
            paragraphs.survivorHeader = StatsTab:Paragraph({
                Title = "Survivor Stats de " .. name,
                Desc = "Status do jogador como Survivor",
                Color = "Green",
                Locked = false,
            })
        else
            paragraphs.survivorHeader:SetTitle("Survivor Stats de " .. name)
            paragraphs.survivorHeader:SetDesc("Status do jogador como Survivor")
        end

        -- Survivor Stats
        local survivorIndex = 1
        for _, stat in ipairs(survivorStats:GetChildren()) do
            if stat:IsA("NumberValue") or stat:IsA("IntValue") or stat:IsA("StringValue") then
                if not paragraphs.survivorStats[survivorIndex] then
                    paragraphs.survivorStats[survivorIndex] = StatsTab:Paragraph({
                        Title = stat.Name .. ": " .. tostring(stat.Value),
                        Desc = "",
                        Color = "Green",
                        Locked = false,
                    })
                else
                    paragraphs.survivorStats[survivorIndex]:SetTitle(stat.Name .. ": " .. tostring(stat.Value))
                    paragraphs.survivorStats[survivorIndex]:SetDesc("")
                end
                
                local conn = stat.Changed:Connect(function(newValue)
                    paragraphs.survivorStats[survivorIndex]:SetTitle(stat.Name .. ": " .. tostring(newValue))
                end)
                table.insert(connections, conn)
                survivorIndex = survivorIndex + 1
            end
        end

        local equipped = playerData:FindFirstChild("Equipped")
        if not equipped then
            WindUI:Notify({
                Title = "Erro",
                Content = "Equipped não encontrado!",
                Duration = 3,
                Icon = "alert-triangle",
            })
            return
        end

        local equippedEmotes = equipped:FindFirstChild("Emotes")
        local equippedKiller = equipped:FindFirstChild("Killer")
        local equippedSurvivor = equipped:FindFirstChild("Survivor")
        if not equippedEmotes or not equippedKiller or not equippedSurvivor then
            WindUI:Notify({
                Title = "Erro",
                Content = "Emotes, Killer ou Survivor não encontrado em Equipped!",
                Duration = 3,
                Icon = "alert-triangle",
            })
            return
        end

        -- Emotes Header
        if not paragraphs.emotesHeader then
            paragraphs.emotesHeader = StatsTab:Paragraph({
                Title = "Equipped Emotes de " .. name,
                Desc = "Emotes equipados do jogador",
                Color = "Green",
                Locked = false,
            })
        else
            paragraphs.emotesHeader:SetTitle("Equipped Emotes de " .. name)
            paragraphs.emotesHeader:SetDesc("Emotes equipados do jogador")
        end

        -- Emotes
        if equippedEmotes:IsA("StringValue") then
            local emotes = {}
            for emote in string.gmatch(equippedEmotes.Value, "[^|]+") do
                if emote ~= "nil" then
                    table.insert(emotes, emote)
                end
            end
            local emotesStr = table.concat(emotes, ", ")
            
            if not paragraphs.emotes then
                paragraphs.emotes = StatsTab:Paragraph({
                    Title = "Emotes: " .. (emotesStr ~= "" and emotesStr or "Nenhum emote equipado"),
                    Desc = "",
                    Color = "Green",
                    Locked = false,
                })
            else
                paragraphs.emotes:SetTitle("Emotes: " .. (emotesStr ~= "" and emotesStr or "Nenhum emote equipado"))
                paragraphs.emotes:SetDesc("")
            end
            
            local conn = equippedEmotes.Changed:Connect(function(newValue)
                local updatedEmotes = {}
                for emote in string.gmatch(newValue, "[^|]+") do
                    if emote ~= "nil" then
                        table.insert(updatedEmotes, emote)
                    end
                end
                local updatedStr = table.concat(updatedEmotes, ", ")
                paragraphs.emotes:SetTitle("Emotes: " .. (updatedStr ~= "" and updatedStr or "Nenhum emote equipado"))
            end)
            table.insert(connections, conn)
        end

        -- Killer Equip Header
        if not paragraphs.killerEquipHeader then
            paragraphs.killerEquipHeader = StatsTab:Paragraph({
                Title = "Equipped Killer de " .. name,
                Desc = "Killer equipado do jogador",
                Color = "Green",
                Locked = false,
            })
        else
            paragraphs.killerEquipHeader:SetTitle("Equipped Killer de " .. name)
            paragraphs.killerEquipHeader:SetDesc("Killer equipado do jogador")
        end

        -- Killer Equip
        local killerEquipIndex = 1
        for _, item in ipairs(equippedKiller:GetChildren()) do
            if item:IsA("NumberValue") or item:IsA("IntValue") or item:IsA("StringValue") then
                if not paragraphs.killerEquip[killerEquipIndex] then
                    paragraphs.killerEquip[killerEquipIndex] = StatsTab:Paragraph({
                        Title = item.Name .. ": " .. tostring(item.Value),
                        Desc = "",
                        Color = "Green",
                        Locked = false,
                    })
                else
                    paragraphs.killerEquip[killerEquipIndex]:SetTitle(item.Name .. ": " .. tostring(item.Value))
                    paragraphs.killerEquip[killerEquipIndex]:SetDesc("")
                end
                
                local conn = item.Changed:Connect(function(newValue)
                    paragraphs.killerEquip[killerEquipIndex]:SetTitle(item.Name .. ": " .. tostring(newValue))
                end)
                table.insert(connections, conn)
                killerEquipIndex = killerEquipIndex + 1
            end
        end

        -- Survivor Equip Header
        if not paragraphs.survivorEquipHeader then
            paragraphs.survivorEquipHeader = StatsTab:Paragraph({
                Title = "Equipped Survivor de " .. name,
                Desc = "Survivor equipado do jogador",
                Color = "Green",
                Locked = false,
            })
        else
            paragraphs.survivorEquipHeader:SetTitle("Equipped Survivor de " .. name)
            paragraphs.survivorEquipHeader:SetDesc("Survivor equipado do jogador")
        end

        -- Survivor Equip
        local survivorEquipIndex = 1
        for _, item in ipairs(equippedSurvivor:GetChildren()) do
            if item:IsA("NumberValue") or item:IsA("IntValue") or item:IsA("StringValue") then
                if not paragraphs.survivorEquip[survivorEquipIndex] then
                    paragraphs.survivorEquip[survivorEquipIndex] = StatsTab:Paragraph({
                        Title = item.Name .. ": " .. tostring(item.Value),
                        Desc = "",
                        Color = "Green",
                        Locked = false,
                    })
                else
                    paragraphs.survivorEquip[survivorEquipIndex]:SetTitle(item.Name .. ": " .. tostring(item.Value))
                    paragraphs.survivorEquip[survivorEquipIndex]:SetDesc("")
                end
                
                local conn = item.Changed:Connect(function(newValue)
                    paragraphs.survivorEquip[survivorEquipIndex]:SetTitle(item.Name .. ": " .. tostring(newValue))
                end)
                table.insert(connections, conn)
                survivorEquipIndex = survivorEquipIndex + 1
            end
        end

        WindUI:Notify({
            Title = "Status Carregados",
            Content = "Status do jogador " .. name .. " carregados com sucesso!",
            Duration = 3,
            Icon = "check",
        })
    end
})

local FakeReportTab = Window:Tab({
    Title = "Fake Report",
    Icon = "flag",
    Locked = false,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Salva os valores originais IMEDIATAMENTE quando a aba carrega
local originalHealthText
local originalUsernameName = "Username"
local originalUsernameText
local originalActorText

task.spawn(function()
    local success, err = pcall(function()
        local PlayerGui = LocalPlayer.PlayerGui
        local spectateUI = PlayerGui:WaitForChild("MainUI"):WaitForChild("Spectate")
        local healthLabel = spectateUI:WaitForChild("Health")
        local actorLabel = spectateUI:WaitForChild("ActorName")
        
        -- Procura o Label Username ou qualquer label que nao seja Health/ActorName
        local usernameLabel = spectateUI:FindFirstChild("Username")
        if not usernameLabel then
            for _, child in pairs(spectateUI:GetChildren()) do
                if child:IsA("TextLabel") and child.Name ~= "Health" and child.Name ~= "ActorName" then
                    usernameLabel = child
                    break
                end
            end
        end
        
        if usernameLabel then
            -- Restaura automaticamente o nome para "Username"
            usernameLabel.Name = "Username"
            
            -- Salva os valores originais
            originalHealthText = healthLabel.Text
            originalUsernameText = usernameLabel.Text
            originalActorText = actorLabel.Text
        end
    end)
end)

local InputUsername = FakeReportTab:Input({
    Title = "Nome do Jogador (Username)",
    Desc = "Digite o nome do jogador",
    Value = "",
    InputIcon = "user",
    Type = "Input",
    Placeholder = "Digite o username...",
    Callback = function(input) 
        local PlayerGui = LocalPlayer.PlayerGui
        local spectateUI = PlayerGui.MainUI.Spectate
        local usernameLabel = spectateUI.Username
        
        if not originalUsernameName then
            originalUsernameName = usernameLabel.Name
            originalUsernameText = usernameLabel.Text
        end
        
        usernameLabel.Name = input
        task.wait(0.1)
        usernameLabel.Text = input
    end
})

local InputActor = FakeReportTab:Input({
    Title = "Nome do Personagem (ActorName)",
    Desc = "Digite o nome do personagem",
    Value = "",
    InputIcon = "users",
    Type = "Input",
    Placeholder = "Digite o personagem...",
    Callback = function(input) 
        local PlayerGui = LocalPlayer.PlayerGui
        local spectateUI = PlayerGui.MainUI.Spectate
        local actorLabel = spectateUI.ActorName
        
        if not originalActorText then
            originalActorText = actorLabel.Text
        end
        
        actorLabel.Text = input
    end
})

local InputHealth = FakeReportTab:Input({
    Title = "Vida (Health)",
    Desc = "Digite a vida do jogador",
    Value = "",
    InputIcon = "heart",
    Type = "Input",
    Placeholder = "Ex: 100/100",
    Callback = function(input) 
        local PlayerGui = LocalPlayer.PlayerGui
        local spectateUI = PlayerGui.MainUI.Spectate
        local healthLabel = spectateUI.Health
        
        if not originalHealthText then
            originalHealthText = healthLabel.Text
        end
        
        healthLabel.Text = input
    end
})

local Button = FakeReportTab:Button({
    Title = "Fix Spectate",
    Desc = "Restaura apenas o nome do Label para Username",
    Locked = false,
    Callback = function()
        local PlayerGui = LocalPlayer.PlayerGui
        local spectateUI = PlayerGui.MainUI.Spectate
        
        -- Procura o label que teve o nome mudado e restaura APENAS o nome para "Username"
        for _, child in pairs(spectateUI:GetChildren()) do
            if child:IsA("TextLabel") or child:IsA("TextButton") then
                if child.Name ~= "Username" and child.Name ~= "Health" and child.Name ~= "ActorName" then
                    child.Name = "Username"
                end
            end
        end
        
        WindUI:Notify({
            Title = "Fix Spectate",
            Content = "Nome do Label restaurado!",
            Duration = 2,
            Icon = "check",
        })
    end
})

-- =============================
-- ANTI'S TAB
-- =============================
local AntiTab = Window:Tab({
    Title = "Anti's",
    Icon = "shield",
    Locked = false,
})

local statusEffectsBackup = {}

-- Função para deletar/restaurar módulos com proteção total
local function toggleStatusEffect(effectName, state, displayName)
    pcall(function()
        local RS = game:GetService("ReplicatedStorage")
        local statusEffects = RS:FindFirstChild("Modules")
        if not statusEffects then return end
        
        statusEffects = statusEffects:FindFirstChild("StatusEffects")
        if not statusEffects then return end
        
        local effect = statusEffects:FindFirstChild(effectName)
        
        if state then
            -- Ativar: Deletar efeito
            if effect then
                if not statusEffectsBackup[effectName] then
                    statusEffectsBackup[effectName] = {
                        parent = statusEffects,
                        module = effect:Clone()
                    }
                end
                effect:Destroy()
            end
        else
            -- Desativar: Restaurar efeito
            if statusEffectsBackup[effectName] then
                local backup = statusEffectsBackup[effectName]
                if backup.parent and backup.module then
                    local restored = backup.module:Clone()
                    restored.Parent = backup.parent
                end
                statusEffectsBackup[effectName] = nil
            end
        end
    end)
end

-- Anti Killer Special Stuns
AntiTab:Toggle({
    Title = "Anti Killer Special Stuns",
    Desc = "Remove efeitos especiais de stun do Killer",
    Icon = "shield",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("KillerExclusive", state, "Killer Stuns")
        WindUI:Notify({
            Title = "Anti Killer Stuns",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Survivor Special Stuns
AntiTab:Toggle({
    Title = "Anti Survivor Special Stuns",
    Desc = "Remove efeitos especiais de stun do Survivor",
    Icon = "shield",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("SurvivorExclusive", state, "Survivor Stuns")
        WindUI:Notify({
            Title = "Anti Survivor Stuns",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Bleeding
AntiTab:Toggle({
    Title = "Anti Bleeding",
    Desc = "Remove efeito de sangramento",
    Icon = "droplet",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Bleeding", state, "Bleeding")
        WindUI:Notify({
            Title = "Anti Bleeding",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Blindness
AntiTab:Toggle({
    Title = "Anti Blindness",
    Desc = "Remove efeito de cegueira",
    Icon = "eye-off",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Blindness", state, "Blindness")
        WindUI:Notify({
            Title = "Anti Blindness",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Burning
AntiTab:Toggle({
    Title = "Anti Burning",
    Desc = "Remove efeito de queimadura",
    Icon = "flame",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Burning", state, "Burning")
        WindUI:Notify({
            Title = "Anti Burning",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Helpless
AntiTab:Toggle({
    Title = "Anti Helpless",
    Desc = "Remove efeito de desamparo",
    Icon = "user-x",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Helpless", state, "Helpless")
        WindUI:Notify({
            Title = "Anti Helpless",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Hemmorhage
AntiTab:Toggle({
    Title = "Anti Hemmorhage",
    Desc = "Remove efeito de hemorragia",
    Icon = "activity",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Hemmorhage", state, "Hemmorhage")
        WindUI:Notify({
            Title = "Anti Hemmorhage",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Nausea
AntiTab:Toggle({
    Title = "Anti Nausea",
    Desc = "Remove efeito de náusea",
    Icon = "wind",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Nausea", state, "Nausea")
        WindUI:Notify({
            Title = "Anti Nausea",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Oblivious
AntiTab:Toggle({
    Title = "Anti Oblivious",
    Desc = "Remove efeito de esquecimento",
    Icon = "cloud-off",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Oblivious", state, "Oblivious")
        WindUI:Notify({
            Title = "Anti Oblivious",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Poisoned
AntiTab:Toggle({
    Title = "Anti Poisoned",
    Desc = "Remove efeito de envenenamento",
    Icon = "skull",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Poisoned", state, "Poisoned")
        WindUI:Notify({
            Title = "Anti Poisoned",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Slowness
AntiTab:Toggle({
    Title = "Anti Slowness",
    Desc = "Remove efeito de lentidão",
    Icon = "gauge",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Slowness", state, "Slowness")
        WindUI:Notify({
            Title = "Anti Slowness",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Stunned
AntiTab:Toggle({
    Title = "Anti Stunned",
    Desc = "Remove efeito de atordoamento",
    Icon = "zap-off",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Stunned", state, "Stunned")
        WindUI:Notify({
            Title = "Anti Stunned",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Weakness
AntiTab:Toggle({
    Title = "Anti Weakness",
    Desc = "Remove efeito de fraqueza",
    Icon = "trending-down",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        toggleStatusEffect("Weakness", state, "Weakness")
        WindUI:Notify({
            Title = "Anti Weakness",
            Content = state and "Ativado!" or "Desativado!",
            Duration = 2,
            Icon = state and "check" or "x",
        })
    end
})

-- Anti Slow (modifica velocidade)
local antiSlowToggle = false
local antiSlowConnection = nil

AntiTab:Toggle({
    Title = "Anti Slow",
    Desc = "Mantém velocidade normal mesmo com efeitos de lentidão",
    Icon = "zap",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        antiSlowToggle = state
        
        if state then
            local RunService = game:GetService("RunService")
            antiSlowConnection = RunService.Heartbeat:Connect(function()
                if antiSlowToggle then
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local character = player.Character
                        if character and character:FindFirstChild("Humanoid") then
                            local humanoid = character.Humanoid
                            if humanoid.WalkSpeed < 16 then
                                humanoid.WalkSpeed = 16
                            end
                        end
                    end)
                end
            end)
            
            WindUI:Notify({
                Title = "Anti Slow",
                Content = "Ativado!",
                Duration = 2,
                Icon = "check",
            })
        else
            if antiSlowConnection then
                antiSlowConnection:Disconnect()
                antiSlowConnection = nil
            end
            
            WindUI:Notify({
                Title = "Anti Slow",
                Content = "Desativado!",
                Duration = 2,
                Icon = "x",
            })
        end
    end
})

-- =============================
-- CONFIGURAÇÕES TAB
-- =============================
local ConfigTab = Window:Tab({
    Title = "Configurações",
    Icon = "settings",
    Locked = false,
})


local Keybind = ConfigTab:Keybind({
    Title = "Keybind",
    Desc = "Keybind para abrir/fechar a UI",
    Value = "K",
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
        WindUI:Notify({
            Title = "Keybind",
            Content = "Keybind alterada para: " .. v,
            Duration = 2,
            Icon = "keyboard",
        })
    end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- Toggle para deletar ragdolls
local RagdollToggle = ConfigTab:Toggle({
    Title = "FPS Boost - Ragdolls",
    Desc = "Deleta todos os ragdolls",
    Icon = "zap",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        local ragdollFolder = Workspace:WaitForChild("Ragdolls")
        
        if state then
            -- Deleta todos os ragdolls
            for _, ragdoll in pairs(ragdollFolder:GetChildren()) do
                ragdoll:Destroy()
            end
            -- Monitora novos ragdolls pra deletar enquanto ativado
            local connection
            connection = ragdollFolder.ChildAdded:Connect(function(ragdoll)
                if state then
                    ragdoll:Destroy()
                else
                    connection:Disconnect()
                end
            end)
        end
    end
})

-- Toggle para desativar efeitos visuais
local EffectsToggle = ConfigTab:Toggle({
    Title = "FPS Boost - Efeitos Visuais",
    Desc = "Desativa efeitos",
    Icon = "zap",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        local function toggleEffects(object)
            if object:IsA("ParticleEmitter") or object:IsA("Smoke") or object:IsA("Fire") or object:IsA("Sparkles") then
                object.Enabled = not state
            end
        end
        
        -- Percorre todos os objetos no workspace
        for _, obj in pairs(Workspace:GetDescendants()) do
            toggleEffects(obj)
        end
        
        -- Monitora novos objetos adicionados
        local connection
        connection = Workspace.DescendantAdded:Connect(function(obj)
            if state then
                toggleEffects(obj)
            end
        end)
        
        -- Desconecta monitoramento quando desativado
        if not state then
            connection:Disconnect()
        end
    end
})
