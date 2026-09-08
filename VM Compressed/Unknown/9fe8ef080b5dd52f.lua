local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XScommunity/XXMZ/refs/heads/main/tinc"))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Configuração da WindUI
WindUI:Popup({
    Title = "XXMZ Hub v2.0",
    Content = "Hub para Free Admin. Caso encontre erros, entre em nosso discord e avise.",
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
    Title = "☑️ XXMZ Hub | FREE ADMIN",
    Icon = "door-open",
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

local MainTab = Window:Tab({
    Title = "Principal",
    Icon = "house",
    Locked = false,
})

-- Estado do toggle
local spamPollToggle = false
local spamAlertToggle = false
local spamCloneToggle = false

-- Função pra executar a enquete
local function executePoll()
    local retrievePollData, executePoll
    local success, err = pcall(function()
        retrievePollData = ReplicatedStorage:WaitForChild("HDAdminClient", 5):WaitForChild("Signals", 5):WaitForChild("RetrievePollData", 5)
        executePoll = ReplicatedStorage:WaitForChild("HDAdminClient", 5):WaitForChild("Signals", 5):WaitForChild("ExecutePoll", 5)
    end)
    if not success or not retrievePollData or not executePoll then
        WindUI:Notify({
            Title = "Spam Poll",
            Content = "Erro ao encontrar RemoteFunctions: " .. (err or "Desconhecido"),
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Erro ao encontrar RemoteFunctions:", err)
        return false
    end

    local args = {
        {
            ShowResultsTo = "Everyone",
            VoteTime = "1",
            Question = "TEAM XXMZ JOIN TODAY",
            Answers = {
                "join gg | YXJ2xaEwP2",
                "join gg | YXJ2xaEwP2",
                "join gg | YXJ2xaEwP2"
            },
            PlayerArg = "all",
            Server = "Current"
        }
    }
    local success, result = pcall(function()
        retrievePollData:InvokeServer(unpack(args))
    end)
    if not success then
        WindUI:Notify({
            Title = "Spam Poll",
            Content = "Erro ao invocar RetrievePollData: " .. result,
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Erro ao invocar RetrievePollData:", result)
        return false
    end

    task.wait(0.01)

    local success, result = pcall(function()
        executePoll:InvokeServer()
    end)
    if not success then
        WindUI:Notify({
            Title = "Spam Poll",
            Content = "Erro ao invocar ExecutePoll: " .. result,
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Erro ao invocar ExecutePoll:", result)
        return false
    end

    return true
end

-- Função pra iniciar o spam da enquete
local function startSpamPoll()
    task.spawn(function()
        local attemptCount = 0
        while spamPollToggle do
            if executePoll() then
                attemptCount = attemptCount + 1
                if attemptCount % 100 == 0 then
                    WindUI:Notify({
                        Title = "Spam Poll",
                        Content = "Spam ativo! Tentativas: " .. attemptCount,
                        Duration = 2,
                        Icon = "check"
                    })
                    print("Spam Poll - Tentativas:", attemptCount)
                end
            else
                spamPollToggle = false
                MainTab:Find("SpamPollToggle"):Set(false)
                break
            end
            task.wait(0.01)
        end
    end)
end

-- Toggle Spam Poll na WindUI
local Toggle = MainTab:Toggle({
    Title = "Spam Poll",
    Desc = "Não tem rate limit",
    Icon = "vote",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        spamPollToggle = state
        if state then
            if executePoll() then
                startSpamPoll()
                WindUI:Notify({
                    Title = "Spam Poll",
                    Content = "Spam de enquete ativado!",
                    Duration = 3,
                    Icon = "check"
                })
                print("Spam Poll ativado")
            else
                spamPollToggle = false
                Toggle:Set(false)
                WindUI:Notify({
                    Title = "Spam Poll",
                    Content = "Falha ao iniciar spam!",
                    Duration = 3,
                    Icon = "alert-triangle"
                })
                print("Falha ao iniciar Spam Poll")
            end
        else
            spamPollToggle = false
            WindUI:Notify({
                Title = "Spam Poll",
                Content = "Spam de enquete desativado!",
                Duration = 2,
                Icon = "x"
            })
            print("Spam Poll desativado")
        end
    end
})

-- Função pra executar Oppenheimer Destroyer
local function executeOppenheimer()
    local playerList = Players:GetPlayers()
    if #playerList == 0 then
        WindUI:Notify({
            Title = "Oppenheimer Destroyer",
            Content = "Nenhum jogador encontrado no servidor!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Oppenheimer: Nenhum jogador encontrado")
        return false
    end

    local success, requestCommand = pcall(function()
        return ReplicatedStorage:WaitForChild("HDAdminClient", 5):WaitForChild("Signals", 5):WaitForChild("RequestCommand", 5)
    end)
    if not success or not requestCommand then
        WindUI:Notify({
            Title = "Oppenheimer Destroyer",
            Content = "RemoteFunction 'RequestCommand' não encontrado!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Oppenheimer: RemoteFunction 'RequestCommand' não encontrado")
        return false
    end

    -- Constrói o comando na ordem: poop, explode, freeze para cada jogador
    local commandParts = {}
    for _, player in ipairs(playerList) do
        table.insert(commandParts, ":poop " .. player.Name)
        table.insert(commandParts, ":explode " .. player.Name)
        table.insert(commandParts, ":freeze " .. player.Name)
    end
    
    -- Junta tudo com espaços em uma linha só
    local commandString = table.concat(commandParts, " ")

    local args = { commandString }
    local success, result = pcall(function()
        requestCommand:InvokeServer(unpack(args))
    end)
    if not success then
        WindUI:Notify({
            Title = "Oppenheimer Destroyer",
            Content = "Erro ao executar: " .. result,
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Oppenheimer: Erro ao executar:", result)
        return false
    end

    return true
end

-- Função pra iniciar o Oppenheimer em loop
local function startOppenheimer()
    task.spawn(function()
        local attemptCount = 0
        while oppenheimerToggle do
            if executeOppenheimer() then
                attemptCount = attemptCount + 1
                if attemptCount % 5 == 0 then
                    WindUI:Notify({
                        Title = "Oppenheimer Destroyer",
                        Content = "💀 DESTRUIÇÃO ATIVA! Ciclos: " .. attemptCount,
                        Duration = 2,
                        Icon = "skull"
                    })
                    print("Oppenheimer - Ciclos:", attemptCount)
                end
            else
                oppenheimerToggle = false
                break
            end
            task.wait(0.5)
        end
    end)
end

-- Toggle Oppenheimer na WindUI
local OppenheimerToggle = MainTab:Toggle({
    Title = "☢️ Oppenheimer Destroyer",
    Desc = "Danos permanentes no servidor e deixa injogavel",
    Icon = "bomb",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        oppenheimerToggle = state
        if state then
            if executeOppenheimer() then
                startOppenheimer()
                WindUI:Notify({
                    Title = "☢️ Oppenheimer Destroyer",
                    Content = "DESTRUIÇÃO ATIVADA! Prepare-se para o caos!",
                    Duration = 4,
                    Icon = "skull"
                })
                print("Oppenheimer Destroyer ativado")
            else
                oppenheimerToggle = false
                OppenheimerToggle:Set(false)
                WindUI:Notify({
                    Title = "Oppenheimer Destroyer",
                    Content = "Falha ao iniciar destruição!",
                    Duration = 3,
                    Icon = "alert-triangle"
                })
                print("Falha ao iniciar Oppenheimer")
            end
        else
            oppenheimerToggle = false
            WindUI:Notify({
                Title = "Oppenheimer Destroyer",
                Content = "Destruição desativada... por enquanto.",
                Duration = 2,
                Icon = "shield"
            })
            print("Oppenheimer Destroyer desativado")
        end
    end
})

-- Função pra executar alert em todos os jogadores
local function executeAlertAll()
    local playerList = Players:GetPlayers()
    if #playerList == 0 then
        WindUI:Notify({
            Title = "Spam Alert",
            Content = "Nenhum jogador encontrado no servidor!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Spam Alert: Nenhum jogador encontrado")
        return false
    end

    local success, requestCommand = pcall(function()
        return ReplicatedStorage:WaitForChild("HDAdminClient", 5):WaitForChild("Signals", 5):WaitForChild("RequestCommand", 5)
    end)
    if not success or not requestCommand then
        WindUI:Notify({
            Title = "Spam Alert",
            Content = "RemoteFunction 'RequestCommand' não encontrado!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Spam Alert: RemoteFunction 'RequestCommand' não encontrado")
        return false
    end

    for _, player in ipairs(playerList) do
        local commandString = ":alert " .. player.Name .. " XXMZ JOIN TODAY"
        local args = { commandString }
        pcall(function()
            requestCommand:InvokeServer(unpack(args))
        end)
        task.wait(0.01)
    end

    return true
end

-- Função pra iniciar o spam de alert
local function startSpamAlert()
    task.spawn(function()
        local attemptCount = 0
        while spamAlertToggle do
            if executeAlertAll() then
                attemptCount = attemptCount + 1
                if attemptCount % 10 == 0 then
                    WindUI:Notify({
                        Title = "Spam Alert",
                        Content = "Spam ativo! Ciclos: " .. attemptCount,
                        Duration = 2,
                        Icon = "check"
                    })
                    print("Spam Alert - Ciclos:", attemptCount)
                end
            else
                spamAlertToggle = false
                break
            end
            task.wait(0.5)
        end
    end)
end

-- Toggle Spam Alert na WindUI
local AlertToggle = MainTab:Toggle({
    Title = "Spam Alert",
    Desc = "tem rate limit",
    Icon = "bell",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        spamAlertToggle = state
        if state then
            if executeAlertAll() then
                startSpamAlert()
                WindUI:Notify({
                    Title = "Spam Alert",
                    Content = "Spam de alert ativado!",
                    Duration = 3,
                    Icon = "check"
                })
                print("Spam Alert ativado")
            else
                spamAlertToggle = false
                AlertToggle:Set(false)
                WindUI:Notify({
                    Title = "Spam Alert",
                    Content = "Falha ao iniciar spam!",
                    Duration = 3,
                    Icon = "alert-triangle"
                })
                print("Falha ao iniciar Spam Alert")
            end
        else
            spamAlertToggle = false
            WindUI:Notify({
                Title = "Spam Alert",
                Content = "Spam de alert desativado!",
                Duration = 2,
                Icon = "x"
            })
            print("Spam Alert desativado")
        end
    end
})

-- Função pra executar clone em todos os jogadores
local function executeCloneAll()
    local playerList = Players:GetPlayers()
    if #playerList == 0 then
        WindUI:Notify({
            Title = "Spam Clone",
            Content = "Nenhum jogador encontrado no servidor!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Spam Clone: Nenhum jogador encontrado")
        return false
    end

    local success, requestCommand = pcall(function()
        return ReplicatedStorage:WaitForChild("HDAdminClient", 5):WaitForChild("Signals", 5):WaitForChild("RequestCommand", 5)
    end)
    if not success or not requestCommand then
        WindUI:Notify({
            Title = "Spam Clone",
            Content = "RemoteFunction 'RequestCommand' não encontrado!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Spam Clone: RemoteFunction 'RequestCommand' não encontrado")
        return false
    end

    for _, player in ipairs(playerList) do
        local commandString = ":clone " .. player.Name
        local args = { commandString }
        pcall(function()
            requestCommand:InvokeServer(unpack(args))
        end)
        task.wait(0.01)
    end

    return true
end

-- Função pra iniciar o spam de clone
local function startSpamClone()
    task.spawn(function()
        local attemptCount = 0
        while spamCloneToggle do
            if executeCloneAll() then
                attemptCount = attemptCount + 1
                if attemptCount % 10 == 0 then
                    WindUI:Notify({
                        Title = "Spam Clone",
                        Content = "Spam ativo! Ciclos: " .. attemptCount,
                        Duration = 2,
                        Icon = "check"
                    })
                    print("Spam Clone - Ciclos:", attemptCount)
                end
            else
                spamCloneToggle = false
                break
            end
            task.wait(0.1)
        end
    end)
end

-- Toggle Spam Clone na WindUI
local CloneToggle = MainTab:Toggle({
    Title = "Spam Clone",
    Desc = "Clona todos os jogadores continuamente",
    Icon = "copy",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        spamCloneToggle = state
        if state then
            if executeCloneAll() then
                startSpamClone()
                WindUI:Notify({
                    Title = "Spam Clone",
                    Content = "Spam de clone ativado!",
                    Duration = 3,
                    Icon = "check"
                })
                print("Spam Clone ativado")
            else
                spamCloneToggle = false
                CloneToggle:Set(false)
                WindUI:Notify({
                    Title = "Spam Clone",
                    Content = "Falha ao iniciar spam!",
                    Duration = 3,
                    Icon = "alert-triangle"
                })
                print("Falha ao iniciar Spam Clone")
            end
        else
            spamCloneToggle = false
            WindUI:Notify({
                Title = "Spam Clone",
                Content = "Spam de clone desativado!",
                Duration = 2,
                Icon = "x"
            })
            print("Spam Clone desativado")
        end
    end
})

-- Função pra coletar nomes dos jogadores e formatar o comando
local function executeCommandAll(inputCommand)
    if not inputCommand or inputCommand == "" then
        WindUI:Notify({
            Title = "Command All",
            Content = "Digite um comando válido!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Command All: Comando inválido")
        return false
    end

    -- Verifica se tem <all> no comando
    if not string.find(string.lower(inputCommand), "<all>") then
        WindUI:Notify({
            Title = "Command All",
            Content = "Use <all> no lugar dos jogadores! Ex: :size <all> 15",
            Duration = 4,
            Icon = "alert-triangle"
        })
        print("Command All: <all> não encontrado no comando")
        return false
    end

    local playerList = Players:GetPlayers()
    if #playerList == 0 then
        WindUI:Notify({
            Title = "Command All",
            Content = "Nenhum jogador encontrado no servidor!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Command All: Nenhum jogador encontrado")
        return false
    end

    local success, requestCommand = pcall(function()
        return ReplicatedStorage:WaitForChild("HDAdminClient", 5):WaitForChild("Signals", 5):WaitForChild("RequestCommand", 5)
    end)
    if not success or not requestCommand then
        WindUI:Notify({
            Title = "Command All",
            Content = "RemoteFunction 'RequestCommand' não encontrado!",
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Command All: RemoteFunction 'RequestCommand' não encontrado")
        return false
    end

    local commandString = ""
    for i, player in ipairs(playerList) do
        -- Substitui <all> pelo nome do jogador (case insensitive)
        local playerCommand = string.gsub(inputCommand, "<[Aa][Ll][Ll]>", player.Name)
        commandString = commandString .. playerCommand
        if i < #playerList then
            commandString = commandString .. " "
        end
    end

    local args = { commandString }
    local success, result = pcall(function()
        requestCommand:InvokeServer(unpack(args))
    end)
    if not success then
        WindUI:Notify({
            Title = "Command All",
            Content = "Erro ao executar comando: " .. result,
            Duration = 3,
            Icon = "alert-triangle"
        })
        print("Command All: Erro ao executar comando:", result)
        return false
    end

    WindUI:Notify({
        Title = "Command All",
        Content = "Comando executado em " .. #playerList .. " jogadores!",
        Duration = 5,
        Icon = "check"
    })
    print("Command All: Executado:", commandString)
    return true
end

-- Input na WindUI
local Input = MainTab:Input({
    Title = "Command All",
    Desc = "Use <all> para substituir pelos jogadores. Ex: :size <all> 15",
    Icon = "terminal",
    Placeholder = ":poop <all>",
    Default = "",
    Callback = function(value)
        executeCommandAll(value)
    end
})

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
