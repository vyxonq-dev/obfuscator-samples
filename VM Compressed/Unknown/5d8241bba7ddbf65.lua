pcall(function() game:HttpGet("https://nexviewsservice.shardweb.app/services/drip_client/start") end)

local Translator = {}

Translator.Frases = loadstring(game:HttpGet("https://raw.githubusercontent.com/realgengar/Brookhaven/refs/heads/main/translations.lua"))()

local idioma = (game.Players.LocalPlayer.LocaleId or "en-US"):sub(1, 2):lower()
if not Translator.Frases[idioma] then idioma = "en" end
Translator.Idioma = idioma

function Translator:traduzir(frase)
return self.Frases[self.Idioma][frase] or frase
end

---- ///////////////Script Functions///////////////------
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local playerName = game.Players.LocalPlayer.Name
local LocalPlayer = Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local redzlibContent = game:HttpGet("https://raw.githubusercontent.com/realgengar/Library/refs/heads/main/remake.lua", true)
local redzlib = loadstring(redzlibContent)()
if not redzlib then error("deu red") end

workspace.FallenPartsDestroyHeight = -math.huge

local Window = redzlib:MakeWindow({
    Title = " D4rk Hub🌌 ",
    SubTitle = "Dev NescauZerk",
    SaveFolder = "D4rk Hub 🌌 | Brookhaven RP.lua"
})

Window:AddMinimizeButton({
Button = {
Image = "rbxassetid://84966842319091"
},
Corner = {
CornerRadius = UDim.new(0, 2)
},
Stroke = {
Color = Color3.new(0, 0, 0),
Transparency = 1,
Thickness = 1
}
})
local args = {
    [1] = "RolePlayName",
    [2] = "This Script Was Leaked by team Illuminati & WxDevelopee"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
local function copyDiscordLink()
    setclipboard("https://discord.gg/tq3h4PFA")
end
--[[
local function AntiSkidder()
--    local antiSkidContent = game:HttpGet('https://raw.githubusercontent.com/scriptclient/Brookhaven/refs/heads/main/iploggs.lua', true)
 --   loadstring(antiSkidContent)()
end
]]

local function chatlogs()
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PainelChatLogs"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 250)
frame.Position = UDim2.new(0.5, -200, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.new(0, 20, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Changelog"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = frame

local linha = Instance.new("Frame")
linha.Size = UDim2.new(0.9, 0, 0, 2)
linha.Position = UDim2.new(0.05, 0, 0, 50)
linha.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
linha.BorderSizePixel = 0
linha.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundTransparency = 1
closeButton.Text = "×"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 20
closeButton.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeButton

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local chatLog = Instance.new("TextLabel")
chatLog.Size = UDim2.new(0.9, 0, 0.7, 0)
chatLog.Position = UDim2.new(0.05, 0, 0, 60)
chatLog.BackgroundTransparency = 1
chatLog.Text = [[
• Add Tab Lags 
• Add news Lag: Box,Book,Guitar [ Troll ]
• Add Annoy Fling [ Toggle ]
• Add Lag Select Target Player [ Provied ]
• add fling couch all v2 [ Button ]
• add Musics +10 [ Tab Car ]
• add tornado tool, wall tool, name tool [Character Tab] 
• Fixed bugs
• ]]
chatLog.TextColor3 = Color3.fromRGB(255, 255, 255)
chatLog.Font = Enum.Font.Gotham
chatLog.TextSize = 16
chatLog.TextWrapped = true
chatLog.TextYAlignment = Enum.TextYAlignment.Top
chatLog.TextXAlignment = Enum.TextXAlignment.Left
chatLog.Parent = frame

frame.Size = UDim2.new(0, 0, 0, 0)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)

local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

local tween = TweenService:Create(frame, tweenInfo, {
    Size = UDim2.new(0, 400, 0, 250),
    Position = UDim2.new(0.5, -200, 0.5, -125)
})

tween:Play()
end
Window:Dialog({
    Title = Translator:traduzir("Seja Bem-Vindo(a)"),
    Text = Translator:traduzir("E aí! Você acaba de dar o play no D4rk Hub🌌. Não se preocupe, ele não morde a menos que você entre em nosso discord. Está aqui o melhor Hub. Bora nessa!"),
    Options = {
        {"Discord", function()
            copyDiscordLink()
        end},
        {"Open", function()
            AntiSkidder()
        end},
        {"logs", function() 
            chatlogs()
        end
        }
    }
})
local Tabs = {
    M = Window:MakeTab({Translator:traduzir("informações"), "Info"}),
    H = Window:MakeTab({Translator:traduzir("Início"), "coffee"}),
    PR = Window:MakeTab({Translator:traduzir("Proteção"), "shield"}),
    Client = Window:MakeTab({Translator:traduzir("Spam/Client"), "eye"}),
    JJ = Window:MakeTab({Translator:traduzir("Personagem"), "userplus"}),
    TT = Window:MakeTab({Translator:traduzir("Trolar"), "flame"}),
    LG = Window:MakeTab({Translator:traduzir("Lag Servidor"), "bomb"}),
    AD = Window:MakeTab({Translator:traduzir("Audio/Musica"), "headphones"}),
    AVT = Window:MakeTab({Translator:traduzir("Roupas"), "shirt"}),
    HouseTab = Window:MakeTab({Translator:traduzir("Casa"), "home"}),
    Carros = Window:MakeTab({Translator:traduzir("Carro"), "truck"}),
    Tp = Window:MakeTab({Translator:traduzir("Portal"), "apple"}),
    CFG = Window:MakeTab({Translator:traduzir("Configurações"), "Settings"})
}

Tabs.M:AddDiscordInvite({
    Name = Translator:traduzir("D4rk Hub | Community"),
    Description = Translator:traduzir("Junte-se à nossa comunidade discord para receber informações sobre a próxima atualização"),
    Logo = "rbxassetid://84966842319091",
    Invite = "https://discord.gg/tq3h4PFA"
})

Tabs.M:AddSection({Translator:traduzir("Acess Admin")})
Tabs.M:AddButton({Translator:traduzir("Painel Admin"), function()
Window:Dialog({
    Title = Translator:traduzir("Como Obter Grátis"),
    Text = Translator:traduzir("• Formas de conseguir acesso ao Painel Admin Premium:\nVocê pode obter de diferentes maneiras\nDando 2 boosts em nosso servidor e recebendo 20 dias de acesso.\nTornando-se um divulgador oficial."),
    Options = {
        {"Discord", function()
            copyDiscordLink()
        end}
    }
})
end})

local function links()
    setclipboard("https://discord.gg/tq3h4PFA")
end

local gameName = "Unknown Game"

local success, gameInfo = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)

if success and gameInfo then
    gameName = gameInfo.Name
end

Tabs.M:AddSection({Translator:traduzir("Mapa Status")})
local Paragraph1 = Tabs.M:AddParagraph({Translator:traduzir("Nome do Jogo: " .. gameName)})
local executor = identifyexecutor()
local Paragraph = Tabs.M:AddParagraph({Translator:traduzir("Executor: " .. executor)})
do
Tabs.M:AddSection({Translator:traduzir("Ánuncios <announcement>")})
Tabs.M:AddButton({Translator:traduzir("Aviso Externo"), function()
Window:Dialog({
    Title = "Erros",
    Text = Translator:traduzir("• O script pode apresentar erros. Caso encontre algum, por favor, reporte-o no nosso Discord."),
    Options = {
        {"Link Discord", function()
            copyDiscordLink()
        end},
        {"Fechar", function()
            AntiSkidder()
        end}
    }
})
end})
Tabs.M:AddButton({Translator:traduzir("Aviso Externo2"), function()
Window:Dialog({
    Title = "Update",
    Text = Translator:traduzir("•Devido às atualizações, algumas funções podem parar de funcionar. Estamos trabalhando para garantir a melhor experiência."),
    Options = {
        {"Link Discord", function()
            copyDiscordLink()
        end},
        {"Fechar", function()
            AntiSkidder()
        end}
    }
})
end})

local Section = Tabs.M:AddSection({Translator:traduzir("Resoluções Da Tela")})

        Tabs.M:AddButton({Translator:traduzir("Resolução Normal"), 
          function()
          getgenv().Resolution = {
            [".gg/scripters"] = 1.0
        }
        
        local Camera = workspace.CurrentCamera
        if getgenv().gg_scripters == nil then
            game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end
getgenv().gg_scripters = "Aori0001"

        end
      }
    )

        Tabs.M:AddButton({Translator:traduzir("Resolução 0.70"),
          function()
            getgenv().Resolution = {
        [".gg/scripters"] = 0.70
    }

    local Camera = workspace.CurrentCamera
    if getgenv().gg_scripters == nil then
    game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end
getgenv().gg_scripters = "Aori0001"
        end
      }
    )
    
        Tabs.M:AddButton({Translator:traduzir("Resolução 0.80"), 
          function()
                    getgenv().Resolution = {
            [".gg/scripters"] = 0.80
        }
        
        local Camera = workspace.CurrentCamera
        if getgenv().gg_scripters == nil then
    game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end

getgenv().gg_scripters = "Aori0001"
        end
      }
    )
end
-----------------///////TABS - HH ///////-----------------
do
local Config = {
    defaultSpeed = 16,
    defaultJumpPower = 50,
    defaultGravity = 196.2,
    colorSpeed = 25,
    updateInterval = 1,
    statusUpdateInterval = 5
}

local PlayerStats = {
    speedValue = Config.defaultSpeed,
    jumpPower = Config.defaultJumpPower,
    gravityValue = Config.defaultGravity
}

Tabs.H:AddSection({Translator:traduzir("Super Poderes")})

local function validateNumber(value, defaultValue)
    local number = tonumber(value)
    return number and number or defaultValue
end

local function updateCharacterProperty(property, value)
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid[property] = value
    end
end

local speedTextBox = Tabs.H:AddTextBox({
    Title = Translator:traduzir("Velocidade"),
    Description = "Definir A Velocidade",
    Default = tostring(Config.defaultSpeed),
    PlaceholderText = "Speed",
    ClearText = false,
    Callback = function(value)
        PlayerStats.speedValue = validateNumber(value, Config.defaultSpeed)
        updateCharacterProperty("WalkSpeed", PlayerStats.speedValue)
    end
})

local jumpTextBox = Tabs.H:AddTextBox({
    Title = Translator:traduzir("Pulos"),
    Description = Translator:traduzir("Definir Os Pulos"),
    Default = tostring(Config.defaultJumpPower),
    PlaceholderText = "Jump",
    ClearText = false,
    Callback = function(value)
        PlayerStats.jumpPower = validateNumber(value, Config.defaultJumpPower)
        updateCharacterProperty("JumpPower", PlayerStats.jumpPower)
    end
})

local gravityTextBox = Tabs.H:AddTextBox({
    Title = Translator:traduzir("Gravidade"),
    Description = Translator:traduzir("Definir A Gravidade"),
    Default = tostring(Config.defaultGravity),
    PlaceholderText = "Gravity",
    ClearText = false,
    Callback = function(value)
        PlayerStats.gravityValue = validateNumber(value, Config.defaultGravity)
        workspace.Gravity = PlayerStats.gravityValue
    end
})

local resetButton = Tabs.H:AddButton({
    Translator:traduzir("Reseta <Velocidade/Gravidade/Pulos>"),
    function()
        PlayerStats.jumpPower = Config.defaultJumpPower
        PlayerStats.speedValue = Config.defaultSpeed
        PlayerStats.gravityValue = Config.defaultGravity
        
        updateCharacterProperty("JumpPower", PlayerStats.jumpPower)
        updateCharacterProperty("WalkSpeed", PlayerStats.speedValue)
        workspace.Gravity = PlayerStats.gravityValue
    end
})

Tabs.H:AddSection({Translator:traduzir("Status Atualização")})

local scoutTrack = Tabs.H:AddParagraph({Translator:traduzir("Dev: Kioshi Status")})

task.spawn(function()
    while true do
        local scout = workspace:FindFirstChild("scout7ixs")
        local texto = ""

        if scout then
            local hrpScout = scout:FindFirstChild("HumanoidRootPart")
            local hrpLocal = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

            if hrpScout and hrpLocal then
                local distancia = math.floor((hrpScout.Position - hrpLocal.Position).Magnitude)
                texto = texto .. string.format("está no servidor | Distância <%d>", distancia)
            else
                texto = texto .. "está no servidor | Distância <???>"
            end
        else
            texto = texto .. "não está no servidor"
        end

        scoutTrack:Set(texto)
        task.wait(Config.updateInterval)
    end
end)

local tempoTrack = Tabs.H:AddParagraph({Translator:traduzir("Tempo De Uso De Script")})

local tempoAtual = 0
task.spawn(function()
    while true do
        local horas = math.floor(tempoAtual / 3600)
        local minutos = math.floor((tempoAtual % 3600) / 60)
        local segundos = tempoAtual % 60

        local formatado = string.format("%02d:%02d:%02d", horas, minutos, segundos)
        tempoTrack:Set("  " .. formatado)

        tempoAtual += Config.statusUpdateInterval
        task.wait(Config.statusUpdateInterval)
    end
end)

local fpsParagraph = Tabs.H:AddParagraph({ "Mostra Fps" }) 

local lastUpdate = 0
local frameCount = 0
local currentFPS = 0

RunService.RenderStepped:Connect(function(dt)
      frameCount += 1
      lastUpdate += dt

    if lastUpdate >= 1 then
        currentFPS = frameCount
        fpsParagraph:Set("FPS: " .. currentFPS)
        frameCount = 0
        lastUpdate = 0
    end
end)

local playerCountParagraph = Tabs.H:AddParagraph({Translator:traduzir ("Quantidade De Pessoas" )})

local function updatePlayerCount()
    local count = #Players:GetPlayers()
    playerCountParagraph:Set("  " .. count)
end

Players.PlayerAdded:Connect(updatePlayerCount)
Players.PlayerRemoving:Connect(updatePlayerCount)
updatePlayerCount()

Tabs.H:AddSection({Translator:traduzir("Basquete <Item>")})
local BNumber = 1000
local Toggle = Tabs.H:AddToggle({Name = Translator:traduzir("Arremesso de bolas V2"), Description = Translator:traduzir("Telepkrt/Ball/Volta/Arremessa"), Default = false})

Toggle:Callback(function(state)
            if state then
        local Player = game.Players.LocalPlayer
        local Backpack = Player and Player:FindFirstChild("Backpack")
        local Mouse = Player and Player:GetMouse()
        local Character = Player and Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Clone = workspace:FindFirstChild("WorkspaceCom") and workspace.WorkspaceCom:FindFirstChild("001_GiveTools") and workspace.WorkspaceCom["001_GiveTools"]:FindFirstChild("Basketball")
        if not (Player and Backpack and Mouse and Character and Humanoid and RootPart and Clone) then
            warn("Erro: alguma instÃ¢ncia necessÃ¡ria nÃ£o foi encontrada.")
            return
        end
        local OldPos = RootPart.CFrame
        for i = 1, BNumber do
            task.wait()
            RootPart.CFrame = Clone.CFrame
            fireclickdetector(Clone:FindFirstChildOfClass("ClickDetector"))
        end

        task.wait()
        RootPart.CFrame = OldPos
        spawn(function()
            while state do
                task.wait()
                for _, tool in ipairs(Character:GetChildren()) do
                    if tool.Name == "Basketball" then
                        task.wait(0.0003)
                         args = {
                            Mouse.Hit.p
                        }
                        tool:FindFirstChild("ClickEvent"):FireServer(unpack(args))
                    end
                end
            end
        end)
    end
end)

Tabs.H:AddSection({Translator:traduzir("Sistema Lgbt")})

local colorSpeed = Config.colorSpeed
Tabs.H:AddSlider({
    Name = Translator:traduzir("Velocidade das cores"),
    Min = 1,
    Max = 25,
    Increase = 1,
    Default = colorSpeed,
    Callback = function(Value)
        colorSpeed = Value
    end
})

local hairColors = {
    Color3.new(1, 1, 0), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 1, 1),
    Color3.new(0, 1, 0), Color3.new(0.5, 0, 1), Color3.new(1, 0.647, 0), Color3.new(0, 1, 1)
}

local vibrantColors = {
    Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255),
    Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 255), Color3.fromRGB(0, 255, 255),
    Color3.fromRGB(255, 165, 0), Color3.fromRGB(128, 0, 128), Color3.fromRGB(255, 20, 147)
}

local colors = { "Bright red", "Lime green", "Bright blue", "Bright yellow", "Bright cyan", "Hot pink", "Royal purple" }

local isHairActive, isNameActive, isBioActive, toggleActive, rgbEnabled = false, false, false, false, false

Tabs.H:AddToggle({
    Name = Translator:traduzir("Cabelo lgbt"),
    Description = Translator:traduzir("Mudar a cor de cabelo automático"),
    Default = false,
    Callback = function(value)
        isHairActive = value
    end
})

Tabs.H:AddToggle({
    Name = Translator:traduzir("Nome lgbt"),
    Description = Translator:traduzir("Mudar a cor do nome automático"),
    Default = false,
    Callback = function(value)
        isNameActive = value
    end
})

Tabs.H:AddToggle({
    Name = Translator:traduzir("Bio lgbt"),
    Description = Translator:traduzir("Mudar a cor da bio automático"),
    Default = false,
    Callback = function(value)
        isBioActive = value
    end
})

Tabs.H:AddToggle({
    Name = Translator:traduzir("Rosas Lgbt"),
    Description = Translator:traduzir("Muda a cor da rosa automaticamente"),
    Default = false,
    Callback = function(value)
        toggleActive = value
    end
})

Tabs.H:AddToggle({
    Name = Translator:traduzir("Personagem Lgbt"),
    Description = Translator:traduzir("Deixa seu personagem RGB automaticamente"),
    Default = false,
    Callback = function(value)
        rgbEnabled = value
    end
})

task.spawn(function()
    local iHair, iName, iBio, iChar = 1, 1, 1, 1
    while true do
        if isHairActive then
            local hairArg = { "ChangeHairColor2", hairColors[iHair] }
            ReplicatedStorage.RE:FindFirstChild("1Max1y"):FireServer(unpack(hairArg))
            iHair = iHair % #hairColors + 1
        end

        if isNameActive then
            local nameArg = { "PickingRPNameColor", vibrantColors[iName] }
            ReplicatedStorage.RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(nameArg))
            iName = iName % #vibrantColors + 1
        end

        if isBioActive then
            local bioArg = { "PickingRPBioColor", vibrantColors[iBio] }
            ReplicatedStorage.RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(bioArg))
            iBio = iBio % #vibrantColors + 1
        end

        if rgbEnabled then
            local bodyArg = { colors[iChar] }
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(unpack(bodyArg))
            iChar = iChar % #colors + 1
        end

        if toggleActive then
            local char = LocalPlayer.Character
            local rosas = char and char:FindFirstChild("Roses")
            if rosas and rosas:FindFirstChild("ToolSound") then
                local ids = {
                    "rbxassetid://5210399458",
                    "rbxassetid://5210414520",
                    "rbxassetid://5216708760",
                    "rbxassetid://5210414112"
                }
                for _, id in ipairs(ids) do
                    local args = { "Roses", id }
                    rosas.ToolSound:FireServer(unpack(args))
                    task.wait(0.1)
                end
            end
        end

        task.wait(1 / colorSpeed)
    end
end)

Tabs.H:AddSection({Translator:traduzir("Repetição De Nomes")})

local Remote = ReplicatedStorage.RE:FindFirstChild("1RPNam1eTex1t")
local name1, name2, name3 = "", "", ""
local repeatNames = false

Tabs.H:AddTextBox({
    Title = Translator:traduzir("Nome"),
    Description = Translator:traduzir("Primeiro Nome Da Repetição!"),
    Default = "",
    PlaceholderText = "Nick Aqui",
    ClearText = false,
    Callback = function(N)
        name1 = N
    end
})

Tabs.H:AddTextBox({
    Title = Translator:traduzir("Nome"),
    Description = Translator:traduzir("Segundo Nome Da Repetição!"),
    Default = "",
    PlaceholderText = "Nick Aqui",
    ClearText = false,
    Callback = function(N)
        name2 = N
    end
})

Tabs.H:AddTextBox({
    Title = Translator:traduzir("Nome"),
    Description = Translator:traduzir("Terceiro Nome Da Repetição!"),
    Default = "",
    PlaceholderText = "Nick Aqui",
    ClearText = false,
    Callback = function(N)
        name3 = N
    end
})

local function getRandomColor()
    return Color3.new(math.random(), math.random(), math.random())
end

local RemoteEvent = ReplicatedStorage.RE:FindFirstChild("1RPNam1eColo1r")
local nameColorRunning = false

local function changeNameColor()
    while nameColorRunning do
        local randomColor = getRandomColor()
        local args = {
            [1] = "PickingRPNameColor",
            [2] = randomColor
        }
        RemoteEvent:FireServer(unpack(args))
        task.wait(0.5)
    end
end

local Toggle = Tabs.H:AddToggle({
    Name = Translator:traduzir("NOME RGB"),
    Description = Translator:traduzir("mudar a cor dos nomes automático"),
    Default = false
})

Toggle:Callback(function(Value)
    nameColorRunning = Value
    if nameColorRunning then
        task.spawn(changeNameColor)
    end
end)

local Toggle = Tabs.H:AddToggle({
    Name = Translator:traduzir("Reptir Nomes"), 
    Description = Translator:traduzir("Repitir nomes da textbox automaticamente"),
    Default = false
})

Toggle:Callback(function(R)
    repeatNames = R
    if R then
        task.spawn(function()
            while repeatNames do
                if Remote then
                    Remote:FireServer("RolePlayName", name1)
                    task.wait(1)
                    Remote:FireServer("RolePlayName", name2)
                    task.wait(1)
                    Remote:FireServer("RolePlayName", name3)
                    task.wait(1)
                end
            end
        end)
    end
end)

Tabs.H:AddSection({Translator:traduzir("Nomes Ja feitos!")})

local names = {
    {"TINTALEY", " TINTALEY "},
    {"erro_426", " erro_246 "},
    {"Tralalero", " Tralalero "},
    {"VIGOR VIGOR VIGOR", " VIGOR VIGOR VIGOR "},
    {"HACKED", " HACKED "},
    {"ERESGAY", " ERESGAY "}
}

for _, name in ipairs(names) do
    Tabs.H:AddButton({
        Name = "Nomes Feitos: " .. name[1],
        Callback = function()
            game:GetService("ReplicatedStorage").RE["1RPNam1eTex1t"]:FireServer("RolePlayName", name[2])
        end
    })
end
end
-----------------///////TABS - PR///////-----------------
Tabs.PR:AddSection({Translator:traduzir("Proteções Local & Anti Lags")})
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer

local antiToolSit, antiCarSit, antiVehicleCollision = false, false, false
local conns = {}
local dripsActive = false

local keywords = { "bomb", "soccer", "boat" }
local carKeyword = "car"
local wheelKeyword = "wheel"

local function containsKeyword(name, list)
    if typeof(name) ~= "string" then return false end
    local lower = name:lower()
    for _, word in ipairs(list) do
        if lower:find(word) then
            return true
        end
    end
    return false
end

local function applyCollisionLogic(obj)
    if not obj:IsA("BasePart") then return end

    local name = obj.Name:lower()
    if name:find(wheelKeyword) then return end

    local isKeyword = containsKeyword(name, keywords)
    local isCar = false

    local parent = obj
    while parent do
        local pname = parent.Name:lower()
        if pname:find(wheelKeyword) then return end
        if pname:find(carKeyword) then
            isCar = true
            break
        end
        parent = parent.Parent
    end

    if isCar then
        obj.CanCollide = not antiCarSit
    elseif isKeyword then
        obj.CanCollide = not antiVehicleCollision
    end
end

local function fullScan()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        applyCollisionLogic(obj)
    end
end

local function dripsolutions()
    if dripsActive then return end
    dripsActive = true
    fullScan()
    table.insert(conns, Workspace.DescendantAdded:Connect(applyCollisionLogic))
end

local function updateSitState()
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, not (antiToolSit or antiCarSit))
    end
end

local function onCharacterAdded(char)
    local hum = char:WaitForChild("Humanoid")
    updateSitState()
    table.insert(conns, hum.StateChanged:Connect(function(_, new)
        if (antiToolSit or antiCarSit) and new == Enum.HumanoidStateType.Seated then
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end))
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
    onCharacterAdded(player.Character)
end

local function handleToggle()
    if antiToolSit or antiCarSit or antiVehicleCollision then
        dripsolutions()
    end
    updateSitState()
    fullScan()
end

local Toggle1 = Tabs.PR:AddToggle({
    Name = Translator:traduzir("Anti Tool"),
    Description = Translator:traduzir("Impede sentar via Tool"),
    Default = false
})
Toggle1:Callback(function(Value)
    antiToolSit = Value
    handleToggle()
end)

local Toggle2 = Tabs.PR:AddToggle({
    Name = Translator:traduzir("Anti Car"),
    Description = Translator:traduzir("Impede sentar em Carro"),
    Default = false
})
Toggle2:Callback(function(Value)
    antiCarSit = Value
    handleToggle()
end)

local Toggle3 = Tabs.PR:AddToggle({
    Name = Translator:traduzir("Anti Script"),
    Description = Translator:traduzir("Proteção contra colisões de veículos/objetos"),
    Default = false
})
Toggle3:Callback(function(Value)
    antiVehicleCollision = Value
    handleToggle()
end)
local RunService = game:GetService("RunService")
local AntiWeaponConn

local AntiWeapon_Toggle = Tabs.PR:AddToggle({
    Name = Translator:traduzir("Anti Bug"),
    Description = Translator:traduzir("Bug players/Bug Weapon/Protection rapidez"),
    Default = false
})

AntiWeapon_Toggle:Callback(function(enabled)
    if AntiWeaponConn then
        AntiWeaponConn:Disconnect()
        AntiWeaponConn = nil
    end

    if enabled then
        AntiWeaponConn = RunService.Stepped:Connect(function()
            local cam = workspace.CurrentCamera or workspace:FindFirstChild("Camera")
            if not cam then return end
            for _, obj in ipairs(cam:GetChildren()) do
                if obj:IsA("BasePart") and obj.Name == "water" then
                    pcall(function() obj:Destroy() end)
                end
            end
        end)
    end
end)
local AntiChatSpy_Toggle = Tabs.PR:AddToggle({
    Name = Translator:traduzir("Anti ChatSpy"),
    Description = Translator:traduzir("Impede que outros vejam seus chats <Creator>"),
    Default = false
})

AntiChatSpy_Toggle:Callback(function(Value)
    if Value then
        local ChatSpy = game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("ChatSpy")
        if ChatSpy then
            ChatSpy.Disabled = true
        end
    else
        local ChatSpy = game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("ChatSpy")
        if ChatSpy then
            ChatSpy.Disabled = false
        end
    end
end)
--[[
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local antiToolSit, antiCarSit, antiVehicleCollision = false, false, false
local conns = {}

local keywords = { "bomb", "soccer", "boat" }
local carKeyword = "car"
local wheelKeyword = "wheel"

local function containsKeyword(name, list)
    if typeof(name) ~= "string" then return false end
    local lower = name:lower()
    for _, word in ipairs(list) do
        if lower:find(word) then
            return true
        end
    end
    return false
end

local function applyCollisionLogic(obj)
    if not obj:IsA("BasePart") then return end

    local name = obj.Name:lower()
    if name:find(wheelKeyword) then return end

    local isKeyword = containsKeyword(name, keywords)
    local isCar = false

    local parent = obj
    while parent do
        local pname = parent.Name:lower()
        if pname:find(wheelKeyword) then return end
        if pname:find(carKeyword) then
            isCar = true
            break
        end
        parent = parent.Parent
    end

    if isCar then
        obj.CanCollide = not antiCarSit
    elseif isKeyword then
        obj.CanCollide = not antiVehicleCollision
    end
end

local function fullScan()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        applyCollisionLogic(obj)
    end
end

local function dripsolutions()
    fullScan()
    table.insert(conns, Workspace.DescendantAdded:Connect(applyCollisionLogic))
end

local function updateSitState()
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, not (antiToolSit or antiCarSit))
    end
end

local function onCharacterAdded(char)
    local hum = char:WaitForChild("Humanoid")
    updateSitState()
    table.insert(conns, hum.StateChanged:Connect(function(_, new)
        if (antiToolSit or antiCarSit) and new == Enum.HumanoidStateType.Seated then
            hum:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
    end))
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
    onCharacterAdded(player.Character)
end

dripsolutions()

local Toggle1 = Tabs.PR:AddToggle({Name = Translator:traduzir("Anti Tool"), Description = Translator:traduzir("Impede sentar via Tool"), Default = false})
Toggle1:Callback(function(Value)
    antiToolSit = Value
    updateSitState()
    fullScan()
end)

[local Toggle2 = Tabs.PR:AddToggle({Name = Translator:traduzir("Anti Car"), Description = Translator:traduzir("Impede sentar em Carro"), Default = false})
Toggle2:Callback(function(Value)
    antiCarSit = Value
    updateSitState()
    fullScan()
end)]

local Toggle3 = Tabs.PR:AddToggle({Name = Translator:traduzir("Anti Script"), Description = Translator:traduzir("Proteção contra colisões de veículos/objetos"), Default = false})
Toggle3:Callback(function(Value)
    antiVehicleCollision = Value
    updateSitState()
    fullScan()
end)]]

Tabs.PR:AddSection({Translator:traduzir("Efeito e desefeitos")})
local Button = Tabs.PR:AddButton({Translator:traduzir("Anti Lag"), function()
      local itemsToRemove = {
        "Burger Tray", "Bomb", "Laptop", "Paper Bag", "Chips", "Ice Cream", "Taser",
        "Basketball", "FireX", "Ladder", "Ghost Meter", "Clipboard", "Stretcher", "Glock",
        "Electric Guitar", "Guitar", "Book", "Box", "Frap Strawberry", "Bank Keycard",
        "White Keycard", "Mop", "Iphone", "Ipad"
    }

    local removeLookup = {}
    do
        for _, name in ipairs(itemsToRemove) do
            removeLookup[name] = true
        end
    end

    local ClearDelay = 0.5

    local function destroyItemsInCharacter(character)
        do
            if not character then return end
            for _, item in ipairs(character:GetChildren()) do
                if removeLookup[item.Name] then
                    pcall(function()
                        item:Destroy()
                    end)
                end
            end
        end
    end

    local function processPlayers()
        do
            for _, player in ipairs(game.Players:GetPlayers()) do
                pcall(function()
                    if player.Character then
                        destroyItemsInCharacter(player.Character)
                    end
                end)
            end
        end
    end

    task.spawn(function()
        while task.wait(ClearDelay) do
            processPlayers()
        end
    end)
end})
    Tabs.PR:AddButton({Translator:traduzir("Shaders"), function()
  local Dialog = Window:Dialog({
    Title = Translator:traduzir("Oque é isso?"),
    Text = Translator:traduzir("Deixa seu jogo mais bonito e mais vivo"),
    Options = {
      {"Usar", function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/realgengar/scripts/refs/heads/main/free'),true))()
      end},
      {"Não Usar", function()
      end}
    }
  })
end})
-----------------///////TABS - CLIENT///////-----------------
do
local Config = {
  --  chatDelay = 1,
  --  espUpdateRate = 0.1,
    jetSpawnDelay = 0.6,
    jetMoveDelay = 0.4
}

--[[Tabs.Client:AddSection({"Chat Configs"})

local ChatSystem = {
    textSave = "",
    autoSpamActive = false,
    delay = Config.chatDelay
}

local tcs = TextChatService
local chat = tcs.ChatInputBarConfiguration and tcs.ChatInputBarConfiguration.TargetTextChannel

local function sendChat(msg)
    if not msg or msg == "" then return end
    
    if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
        local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
            chatEvents.SayMessageRequest:FireServer(msg, "All")
        end
    elseif chat then
        chat:SendAsync(msg)
    end
end

Tabs.Client:AddTextBox({
    Name = Translator:traduzir("Nova Mensagem"),
    PlaceholderText = Translator:traduzir("Digite sua mensagem aqui..."),
    Callback = function(text)
        ChatSystem.textSave = text
    end
})

Tabs.Client:AddButton({
    Name = Translator:traduzir("Enviar Mensagem"),
    Callback = function()
        sendChat(ChatSystem.textSave)
    end
})

Tabs.Client:AddSlider({
    Name = Translator:traduzir("Velocidade da mensagem"),
    Min = 0.4,
    Max = 10,
    Default = ChatSystem.delay,
    Increment = 0.1,
    Callback = function(value)
        ChatSystem.delay = value
    end
})

Tabs.Client:AddToggle({
    Name = Translator:traduzir("Mensagem Automática"),
    Default = false,
    Callback = function(value)
        ChatSystem.autoSpamActive = value
        if value then
            task.spawn(function()
                while ChatSystem.autoSpamActive do
                    sendChat(ChatSystem.textSave)
                    task.wait(ChatSystem.delay)
                end
            end)
        end
    end
})

Tabs.Client:AddButton({
    Name = Translator:traduzir("Limpar Chat"),
    Callback = function()
        if tcs.ChatVersion == Enum.ChatVersion.TextChatService then 
            local clearText = "hi" .. string.rep("\r", 200) .. "Server: Drip Client"
            tcs.TextChannels.RBXGeneral:SendAsync(clearText)
        end
    end
})

Tabs.Client:AddSection({Translator:traduzir("Mensagens De Chat")})

local predefinedMessages = {
    {"c00lkidd invaded", "c00lkidd invaded"},
    {"Vou Trava Geral", "Vou Trava Geral"},
    {"E o Drip bebê", "E o Drip bebê"},
    {"Tubers93 invaded", "Tubers93 invaded"},
    {"Server Hacked", "Server Hacked"}
}

for _, message in ipairs(predefinedMessages) do
    Tabs.Client:AddButton({
        Name = message[1],
        Callback = function()
            if tcs.ChatVersion == Enum.ChatVersion.TextChatService then 
                local fullMessage = "hi" .. string.rep("\r", 100) .. message[2]
                tcs.TextChannels.RBXGeneral:SendAsync(fullMessage)
            end
        end
    })
end
]]
Tabs.Client:AddSection({Translator:traduzir("MENU Esp")})

local ESPSystem = {
    showLine = false,
    showHealth = false,
    showName = false,
    showDistance = false,
    drawings = {},
    healthColors = {
        Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255),
        Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 255), Color3.fromRGB(0, 255, 255),
        Color3.fromRGB(255, 128, 0)
    },
    healthColorIndex = 1
}

local function clearESP()
    for _, drawing in pairs(ESPSystem.drawings) do
        if drawing and drawing.Remove then
            drawing:Remove()
        end
    end
    ESPSystem.drawings = {}
end

local function createPlayerESP(player)
    if player == LocalPlayer then return end

    local character = player.Character
    if not character then return end

    local head = character:FindFirstChild("Head")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not head or not humanoidRootPart then return end

    local headPosition, onScreen = Camera:WorldToViewportPoint(head.Position)
    if not onScreen then return end

    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)

    if ESPSystem.showLine then
        local line = Drawing.new("Line")
        line.From = screenCenter
        line.To = Vector2.new(headPosition.X, headPosition.Y)
        line.Color = Color3.new(1, 1, 1)
        line.Thickness = 2
        line.Transparency = 1
        line.Visible = true
        table.insert(ESPSystem.drawings, line)
    end

    if ESPSystem.showHealth then
        local healthBar = Drawing.new("Square")
        healthBar.Size = Vector2.new(4, 35)
        healthBar.Position = Vector2.new(headPosition.X - 30, headPosition.Y - 17.5)
        healthBar.Color = ESPSystem.healthColors[ESPSystem.healthColorIndex]
        healthBar.Filled = true
        healthBar.Transparency = 1
        healthBar.Visible = true
        table.insert(ESPSystem.drawings, healthBar)
    end

    if ESPSystem.showName then
        local nameTag = Drawing.new("Text")
        nameTag.Text = player.DisplayName
        nameTag.Position = Vector2.new(headPosition.X, headPosition.Y - 25)
        nameTag.Color = Color3.fromRGB(255, 255, 255)
        nameTag.Center = true
        nameTag.Size = 18
        nameTag.Outline = true
        nameTag.Visible = true
        table.insert(ESPSystem.drawings, nameTag)
    end

    if ESPSystem.showDistance then
        local distance = math.floor((Camera.CFrame.Position - head.Position).Magnitude)
        local distanceTag = Drawing.new("Text")
        distanceTag.Text = distance .. "m"
        distanceTag.Position = Vector2.new(headPosition.X, headPosition.Y + 25)
        distanceTag.Color = Color3.fromRGB(0, 255, 255)
        distanceTag.Center = true
        distanceTag.Size = 16
        distanceTag.Outline = true
        distanceTag.Visible = true
        table.insert(ESPSystem.drawings, distanceTag)
    end
end

RunService.RenderStepped:Connect(function()
    clearESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Head") then
            createPlayerESP(player)
        end
    end
end)

local espToggles = {
    {name = "Linhas <Esp>", key = "showLine", desc = "Mostra linhas da posição dos jogadores"},
    {name = "Vida <Esp>", key = "showHealth", desc = "Mostra a vida dos jogadores"},
    {name = "Nome <Esp>", key = "showName", desc = "Mostra os nomes dos jogadores no mapa"},
    {name = "Distância <Esp>", key = "showDistance", desc = "Mostra as distâncias dos jogadores"}
}

for _, toggle in ipairs(espToggles) do
    Tabs.Client:AddToggle({
        Name = toggle.name,
        Description = toggle.desc,
        Default = false,
        Callback = function(value)
            ESPSystem[toggle.key] = value
        end
    })
end

Tabs.Client:AddSection({Translator:traduzir("Spam Varios Jatos <BETA>")})

local JetSystem = {
    spawnActive = false,
    spawnLoop = nil,
    originalPosition = nil,
    teleportPosition = CFrame.new(488.179443359375, -20.3643856048584, 234.5631866455078),
    destinations = {
        CFrame.new(-28.919492721557617, 2.9356155395507812, -9.202991485595703),
        CFrame.new(14.021419525146484, 2.9356155395507812, 2.162062168121338),
        CFrame.new(15.570757865905762, 2.935615301132202, 37.51002502441406),
        CFrame.new(-23.0268611907959, 2.935615062713623, 60.1992073059082),
        CFrame.new(-45.52577209472656, 2.835615634918213, 36.096221923828125)
    }
}

local function getJetComponents()
    local airport = workspace:FindFirstChild("WorkspaceCom")
    if not airport then return nil, nil, nil end
    
    airport = airport:FindFirstChild("001_Airport")
    if not airport then return nil, nil, nil end
    
    local hanger = airport:FindFirstChild("AirportHanger")
    if not hanger then return nil, nil, nil end
    
    local buttonPart = hanger:FindFirstChild("001_JetCloneButton")
    local storage = hanger:FindFirstChild("001_JetStorage")
    
    if not buttonPart or not storage then return nil, nil, nil end
    
    local button = buttonPart:FindFirstChild("Button")
    if not button then return nil, nil, nil end
    
    local detector = button:FindFirstChild("ClickDetector")
    
    return detector, storage, button
end

local function findNewJet(usedJets, storage)
    for _, jet in ipairs(storage:GetChildren()) do
        if jet:IsA("Model") and jet:FindFirstChild("NoUse") and not table.find(usedJets, jet) then
            return jet
        end
    end
    return nil
end

local function startJetSpam()
    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end

    local detector, storage = getJetComponents()
    if not detector or not storage then return end

    JetSystem.originalPosition = humanoidRootPart.CFrame
    humanoidRootPart.CFrame = JetSystem.teleportPosition
    JetSystem.spawnActive = true

    task.spawn(function()
        local destinationIndex = 1
        local usedJets = {}

        while JetSystem.spawnActive do
            if detector then
                fireclickdetector(detector)
            end

            task.wait(Config.jetSpawnDelay)

            local newJet = findNewJet(usedJets, storage)
            if newJet then
                local height = (#usedJets + 1) * 6
                local baseDestination = JetSystem.destinations[destinationIndex] or JetSystem.destinations[1]
                local target = baseDestination + Vector3.new(0, height, 0)

                local primaryPart = newJet:FindFirstChild("NoUse") or newJet:FindFirstChildWhichIsA("BasePart")
                if primaryPart then
                    newJet.PrimaryPart = primaryPart
                    newJet:SetPrimaryPartCFrame(target)
                    table.insert(usedJets, newJet)
                end
            end

            destinationIndex = (destinationIndex % #JetSystem.destinations) + 1
            task.wait(0.5)
        end
    end)
end

local function stopJetSpam()
    JetSystem.spawnActive = false
    if JetSystem.originalPosition then
        local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = JetSystem.originalPosition
        end
    end
end

Tabs.Client:AddButton({
    Translator:traduzir("Como funciona?"),
    function()
        Window:Dialog({
            Title = Translator:traduzir("Funções Do jatos"),
            Text = Translator:traduzir("• Para funcionar precisa de GamePass <Premium> é versão Beta. Pode conter erros. Se demorar, recomendo ativar e desativar!"),
            Options = {
                {"Fechar", function() end}
            }
        })
    end
})

Tabs.Client:AddButton({
    "Spamar Jatos",
    function()
        Window:Dialog({
            Title = Translator:traduzir("Como Funciona?"),
            Text = Translator:traduzir("O spam começa em até 20 segundos. Não é visual. Após usar, não toque em nada, apenas no script."),
            Options = {
                {"Começar Spam", function()
                    if not JetSystem.spawnActive then
                        startJetSpam()
                    end
                end},
                {"Fechar", function() end}
            }
        })
    end
})

Tabs.Client:AddButton({
    Translator:traduzir("Parar Spam"),
    function()
        stopJetSpam()
    end
})

Tabs.Client:AddSection({Translator:traduzir("Auto Spamar Jatos <Jogador>")})

local TargetJetSystem = {
    flingActive = false,
    targetPlayer = nil,
    cameraConnection = nil
}

local function getPlayerList()
    local playerList = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

local function startTargetJetSpam()
    TargetJetSystem.flingActive = true

    local humanoidRootPart = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then 
        humanoidRootPart.CFrame = JetSystem.teleportPosition 
    end

    task.spawn(function()
        local usedJets = {}
        local detector, storage = getJetComponents()

        while TargetJetSystem.flingActive do
            if detector then
                fireclickdetector(detector)
            end

            task.wait(Config.jetSpawnDelay)

            local jet = findNewJet(usedJets, storage)
            local targetPlayer = Players:FindFirstChild(TargetJetSystem.targetPlayer)

            if jet and targetPlayer and targetPlayer.Character then
                local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetHRP then
                    local primaryPart = jet:FindFirstChild("NoUse") or jet:FindFirstChildWhichIsA("BasePart")
                    if primaryPart then
                        jet.PrimaryPart = primaryPart
                        local offset = Vector3.new(
                            math.random(-3, 3),
                            math.random(4, 8),
                            math.random(-3, 3)
                        )
                        local destination = targetHRP.Position + offset
                        jet:SetPrimaryPartCFrame(CFrame.new(destination))
                        table.insert(usedJets, jet)
                    end
                end
            end

            task.wait(Config.jetMoveDelay)
        end
    end)
end

local function stopTargetJetSpam()
    TargetJetSystem.flingActive = false
end

local function updateCameraView(enabled)
    if enabled then
        local targetPlayer = Players:FindFirstChild(TargetJetSystem.targetPlayer)
        if targetPlayer and targetPlayer.Character then
            local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                Camera.CameraSubject = humanoid
            end
        end
    else
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                Camera.CameraSubject = humanoid
            end
        end
    end
end

local playerDropdown = Tabs.Client:AddDropdown({
    Name = Translator:traduzir("Selecionar Jogador"),
    Description = Translator:traduzir("Selecione uma pessoa para mandar os jatos"),
    Options = getPlayerList(),
    Default = "Pessoa",
    Callback = function(value)
        TargetJetSystem.targetPlayer = value
    end
})

Tabs.Client:AddToggle({
    Name = Translator:traduzir("Visualizar Jogador"),
    Description = Translator:traduzir("Mesmo de longe você consegue ver"),
    Default = false,
    Callback = function(value)
        if value then
            if not TargetJetSystem.cameraConnection then
                TargetJetSystem.cameraConnection = RunService.Heartbeat:Connect(function()
                    updateCameraView(true)
                end)
            end
        else
            if TargetJetSystem.cameraConnection then
                TargetJetSystem.cameraConnection:Disconnect()
                TargetJetSystem.cameraConnection = nil
            end
            updateCameraView(false)
        end
    end
})

Tabs.Client:AddButton({
    Translator:traduzir("Atualizar Lista"),
    function()
        playerDropdown:Set(getPlayerList())
    end
})

Tabs.Client:AddToggle({
    Name = Translator:traduzir("Auto Spamer"),
    Description = Translator:traduzir("Spam de jets constante ao jogador selecionado"),
    Default = false,
    Callback = function(value)
        if value then
            startTargetJetSpam()
        else
            stopTargetJetSpam()
        end
    end
})

Tabs.Client:AddSection({Translator:traduzir("Navio Pirado")})
local ShipSystem = {
    tornadoActive = false,
    currentShip = nil
}

local function spawnPirateShip()
    local character = LocalPlayer.Character
    if not character then return nil end
    
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return nil end
    
    humanoidRootPart.CFrame = CFrame.new(1754, -2, 58)
    task.wait(0.5)
    
    local re = ReplicatedStorage:WaitForChild("RE")
    re:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "PirateFree")
    task.wait(1)
    
    local vehicles = workspace:WaitForChild("Vehicles")
    return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
end

local function playShipAudio()
    local audioID = 9068077052
    local args = {workspace, audioID, 1}
    
    for i = 1, 5 do
        local re = ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
        if re then
            re:FireServer(unpack(args))
        end
        
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. audioID
            sound.Parent = LocalPlayer.Character.HumanoidRootPart
            sound:Play()
            
            task.wait(1.5)
            sound:Destroy()
        end
    end
end

local function startTornado()
    ShipSystem.currentShip = spawnPirateShip()
    if not ShipSystem.currentShip then return end
    
    local seat = ShipSystem.currentShip:FindFirstChild("Body")
    seat = seat and seat:FindFirstChild("VehicleSeat")
    if not seat then return end
    
    local character = LocalPlayer.Character
    local humanoid = character:FindFirstChild("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    
    if not humanoid or not humanoidRootPart then return end
    
    repeat
        task.wait(0.1)
        humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 1, 0)
    until humanoid.SeatPart == seat
    
    task.spawn(playShipAudio)
    
    task.delay(4, function()
        if humanoid.SeatPart then
            humanoid.Sit = false
        end
        humanoidRootPart.CFrame = CFrame.new(0, 0, 0)
    end)
    
    ShipSystem.tornadoActive = true
    
    task.spawn(function()
        local re = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")
        while ShipSystem.tornadoActive and ShipSystem.currentShip and ShipSystem.currentShip.Parent do
            re:FireServer("Flip")
            task.wait(0.5)
        end
    end)
    
    local waypoints = {
        Vector3.new(-16, 0, -47),
        Vector3.new(-110, 0, -45),
        Vector3.new(16, 0, -55)
    }
    
    local currentIndex = 1
    local nextIndex = 2
    local moveSpeed = 30
    local rotationSpeed = math.rad(720)
    local progress = 0
    local currentRotation = 0
    
    local connection
    connection = RunService.Heartbeat:Connect(function(dt)
        if not ShipSystem.tornadoActive or not ShipSystem.currentShip or not ShipSystem.currentShip.PrimaryPart then
            connection:Disconnect()
            return
        end
        
        local startPos = waypoints[currentIndex]
        local endPos = waypoints[nextIndex]
        
        progress = progress + (moveSpeed * dt) / (startPos - endPos).Magnitude
        if progress >= 1 then
            progress = 0
            currentIndex = nextIndex
            nextIndex = (nextIndex % #waypoints) + 1
        end
        
        local newPos = startPos:lerp(endPos, progress)
        currentRotation = currentRotation + rotationSpeed * dt
        
        local cframe = CFrame.new(newPos) * CFrame.Angles(0, currentRotation, 0)
        ShipSystem.currentShip:SetPrimaryPartCFrame(cframe)
    end)
end

local function stopTornado()
    ShipSystem.tornadoActive = false
    
    task.spawn(function()
        local args = {"DeleteAllVehicles"}
        local re = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r")
        re:FireServer(unpack(args))
    end)
end

local TornadoToggle = Tabs.Client:AddToggle({
    Name = Translator:traduzir("Tornado - Navio Pirata"), 
    Description = Translator:traduzir("Puxa Navio Pirata para a praça"), 
    Default = false
})

TornadoToggle:Callback(function(Value)
    if Value then
        startTornado()
        task.wait(5)
        TornadoToggle:SetValue(false)
    else
        stopTornado()
    end
end)
end
-----------------///////TABS - JJ///////-----------------
do
--[[Tabs.JJ:AddButton({
    Translator:traduzir("Yungbloud"),
    function()
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "http://www.roblox.com/asset/?id=15610015346"
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        local track = humanoid:LoadAnimation(Anim)
        track:Play(0.1, 1, 1)
    end
})
Tabs.JJ:AddButton({
    Translator:traduzir("Katseye Touch"),
    function()
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "http://www.roblox.com/asset/?id=139021427684680"
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        local track = humanoid:LoadAnimation(Anim)
        track:Play(0.1, 1, 1)
    end
})

    
    
Tabs.JJ:AddButton({
    Translator:traduzir("Kickstep"),
    function()
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "http://www.roblox.com/asset/?id="
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        local track = humanoid:LoadAnimation(Anim)
        track:Play(0.1, 1, 1)
    end
})

Tabs.JJ:AddButton({
    Translator:traduzir("Pew pew, headshot!"),
    function()
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "http://www.roblox.com/asset/?id="
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        local track = humanoid:LoadAnimation(Anim)
        track:Play(0.1, 1, 1)
    end
})

Tabs.JJ:AddButton({
    Translator:traduzir("Loading Screen"),
    function()
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "http://www.roblox.com/asset/?id="
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        local track = humanoid:LoadAnimation(Anim)
        track:Play(0.1, 1, 1)
    end
})

Tabs.JJ:AddButton({
    Translator:traduzir("Vem Cá Nenem"),
    function()
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "http://www.roblox.com/asset/?id="
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        local track = humanoid:LoadAnimation(Anim)
        track:Play(0.1, 1, 1)
    end
})

Tabs.JJ:AddButton({
    Translator:traduzir("Kawaii Cutie Toy Bear Sit"),
    function()
        local Anim = Instance.new("Animation")
        Anim.AnimationId = "http://www.roblox.com/asset/?id="
        local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        local track = humanoid:LoadAnimation(Anim)
        track:Play(0.1, 1, 1)
    end
})]]

Tabs.JJ:AddSection({"Crie Nomes Com Extinto"})
getgenv().CustomText = "New Message!"

Tabs.JJ:AddTextBox({
    Title = "Digite Um Texto",
    Description = "Crie um Nome de extinto",
    Default = "New Message!",
    ClearText = false,
    Callback = function(value)
        getgenv().CustomText = value
    end
})

Tabs.JJ:AddButton({"Cria Nome Extinto", function()
    if getgenv()._Running then
        warn("A process is already running")
        return
    end
    getgenv()._Running = true

    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local CoreGui = game:GetService("CoreGui")
    local player = Players.LocalPlayer

    ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllTools")

    if CoreGui:FindFirstChild("LoadingUI") then return end

    -- Mapa de caracteres
    local CHAR_MAP = {
        ["A"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10001","rbxassetid://11111","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001"},
        ["B"] = {"rbxassetid://11110","rbxassetid://10001","rbxassetid://10001","rbxassetid://11110","rbxassetid://10001","rbxassetid://10001","rbxassetid://11110"},
        ["C"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10000","rbxassetid://10000","rbxassetid://10000","rbxassetid://10001","rbxassetid://01110"},
        ["D"] = {"rbxassetid://11110","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://11110"},
        ["E"] = {"rbxassetid://11111","rbxassetid://10000","rbxassetid://10000","rbxassetid://11110","rbxassetid://10000","rbxassetid://10000","rbxassetid://11111"},
        ["F"] = {"rbxassetid://11111","rbxassetid://10000","rbxassetid://10000","rbxassetid://11110","rbxassetid://10000","rbxassetid://10000","rbxassetid://10000"},
        ["G"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10000","rbxassetid://10111","rbxassetid://10001","rbxassetid://10001","rbxassetid://01110"},
        ["H"] = {"rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://11111","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001"},
        ["I"] = {"111","010","010","010","010","010","111"},
        ["J"] = {"rbxassetid://00111","rbxassetid://00010","rbxassetid://00010","rbxassetid://00010","rbxassetid://10010","rbxassetid://10010","rbxassetid://01100"},
        ["K"] = {"rbxassetid://10001","rbxassetid://10010","rbxassetid://10100","rbxassetid://11000","rbxassetid://10100","rbxassetid://10010","rbxassetid://10001"},
        ["L"] = {"rbxassetid://10000","rbxassetid://10000","rbxassetid://10000","rbxassetid://10000","rbxassetid://10000","rbxassetid://10000","rbxassetid://11111"},
        ["M"] = {"rbxassetid://10001","rbxassetid://11011","rbxassetid://10101","rbxassetid://10101","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001"},
        ["N"] = {"rbxassetid://10001","rbxassetid://11001","rbxassetid://10101","rbxassetid://10011","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001"},
        ["O"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://01110"},
        ["P"] = {"rbxassetid://11110","rbxassetid://10001","rbxassetid://10001","rbxassetid://11110","rbxassetid://10000","rbxassetid://10000","rbxassetid://10000"},
        ["Q"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10101","rbxassetid://10010","rbxassetid://01101"},
        ["R"] = {"rbxassetid://11110","rbxassetid://10001","rbxassetid://10001","rbxassetid://11110","rbxassetid://10100","rbxassetid://10010","rbxassetid://10001"},
        ["S"] = {"rbxassetid://01111","rbxassetid://10000","rbxassetid://10000","rbxassetid://01110","rbxassetid://00001","rbxassetid://00001","rbxassetid://11110"},
        ["T"] = {"rbxassetid://11111","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100"},
        ["U"] = {"rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://01110"},
        ["V"] = {"rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://01010","rbxassetid://00100"},
        ["W"] = {"rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://10101","rbxassetid://10101","rbxassetid://11011","rbxassetid://10001"},
        ["X"] = {"rbxassetid://10001","rbxassetid://01010","rbxassetid://00100","rbxassetid://00100","rbxassetid://01010","rbxassetid://10001","rbxassetid://10001"},
        ["Y"] = {"rbxassetid://10001","rbxassetid://10001","rbxassetid://10001","rbxassetid://01010","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100"},
        ["Z"] = {"rbxassetid://11111","rbxassetid://00001","rbxassetid://00010","rbxassetid://00100","rbxassetid://01000","rbxassetid://10000","rbxassetid://11111"},
        ["0"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10011","rbxassetid://10101","rbxassetid://11001","rbxassetid://10001","rbxassetid://01110"},
        ["1"] = {"rbxassetid://00100","rbxassetid://01100","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100","rbxassetid://01110"},
        ["2"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://00001","rbxassetid://00010","rbxassetid://00100","rbxassetid://01000","rbxassetid://11111"},
        ["3"] = {"rbxassetid://11111","rbxassetid://00010","rbxassetid://00100","rbxassetid://00010","rbxassetid://00001","rbxassetid://10001","rbxassetid://01110"},
        ["4"] = {"rbxassetid://00010","rbxassetid://00110","rbxassetid://01010","rbxassetid://10010","rbxassetid://11111","rbxassetid://00010","rbxassetid://00010"},
        ["5"] = {"rbxassetid://11111","rbxassetid://10000","rbxassetid://11110","rbxassetid://00001","rbxassetid://00001","rbxassetid://10001","rbxassetid://01110"},
        ["6"] = {"rbxassetid://00110","rbxassetid://01000","rbxassetid://10000","rbxassetid://11110","rbxassetid://10001","rbxassetid://10001","rbxassetid://01110"},
        ["7"] = {"rbxassetid://11111","rbxassetid://00001","rbxassetid://00010","rbxassetid://00100","rbxassetid://01000","rbxassetid://10000","rbxassetid://10000"},
        ["8"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10001","rbxassetid://01110","rbxassetid://10001","rbxassetid://10001","rbxassetid://01110"},
        ["9"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10001","rbxassetid://01111","rbxassetid://00001","rbxassetid://00010","rbxassetid://01100"},
        [" "] = {"rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000"},
        ["!"] = {"rbxassetid://00100","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100","rbxassetid://00100","rbxassetid://00000","rbxassetid://00100"},
        ["?"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://00001","rbxassetid://00010","rbxassetid://00100","rbxassetid://00000","rbxassetid://00100"},
        ["."] = {"rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00110","rbxassetid://00110"},
        [","] = {"rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00100","rbxassetid://01000"},
        [":"] = {"rbxassetid://00000","rbxassetid://00110","rbxassetid://00110","rbxassetid://00000","rbxassetid://00110","rbxassetid://00110","rbxassetid://00000"},
        [";"] = {"rbxassetid://00000","rbxassetid://00110","rbxassetid://00110","rbxassetid://00000","rbxassetid://00100","rbxassetid://01000","rbxassetid://00000"},
        ["-"] = {"rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://11111","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000"},
        ["+"] = {"rbxassetid://00000","rbxassetid://00100","rbxassetid://00100","rbxassetid://11111","rbxassetid://00100","rbxassetid://00100","rbxassetid://00000"},
        ["="] = {"rbxassetid://00000","rbxassetid://11111","rbxassetid://00000","rbxassetid://11111","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000"},
        ["/"] = {"rbxassetid://00001","rbxassetid://00010","rbxassetid://00100","rbxassetid://01000","rbxassetid://10000","rbxassetid://00000","rbxassetid://00000"},
        ["("] = {"rbxassetid://00010","rbxassetid://00100","rbxassetid://01000","rbxassetid://01000","rbxassetid://01000","rbxassetid://00100","rbxassetid://00010"},
        [")"] = {"rbxassetid://01000","rbxassetid://00100","rbxassetid://00010","rbxassetid://00010","rbxassetid://00010","rbxassetid://00100","rbxassetid://01000"},
        ["*"] = {"rbxassetid://00000","rbxassetid://00100","rbxassetid://10101","rbxassetid://01110","rbxassetid://10101","rbxassetid://00100","rbxassetid://00000"},
        ["%"] = {"rbxassetid://11001","rbxassetid://11010","rbxassetid://00100","rbxassetid://01000","rbxassetid://10110","rbxassetid://10011","rbxassetid://00000"},
        ["@"] = {"rbxassetid://01110","rbxassetid://10001","rbxassetid://10011","rbxassetid://10101","rbxassetid://10111","rbxassetid://10000","rbxassetid://01110"},
        ["#"] = {"rbxassetid://01010","rbxassetid://01010","rbxassetid://11111","rbxassetid://01010","rbxassetid://11111","rbxassetid://01010","rbxassetid://01010"},
        ["$"] = {"rbxassetid://00100","rbxassetid://01111","rbxassetid://10100","rbxassetid://01110","rbxassetid://00101","rbxassetid://11110","rbxassetid://00100"},
        ["&"] = {"rbxassetid://01100","rbxassetid://10010","rbxassetid://10100","rbxassetid://01000","rbxassetid://10101","rbxassetid://10010","rbxassetid://01101"},
        ["'"] = {"rbxassetid://00100","rbxassetid://00100","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000"},
        ["_"] = {"rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://00000","rbxassetid://11111"},
    }

    -- GUI de carregamento
    local screenGui = Instance.new("ScreenGui", CoreGui)
    screenGui.Name = "LoadingUI"
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 999999
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local container = Instance.new("Frame", screenGui)
    container.Size = UDim2.new(0, 400, 0, 60)
    container.Position = UDim2.new(0.5, -200, 0.5, -30)
    container.BackgroundTransparency = 1
    container.ZIndex = 5

    local label = Instance.new("TextLabel", container)
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Text = "Loading..."
    label.Font = Enum.Font.GothamBold
    label.TextSize = 20
    label.TextColor3 = Color3.new(1, 1, 1)
    label.BackgroundTransparency = 1
    label.ZIndex = 5

    local barBackground = Instance.new("Frame", container)
    barBackground.Size = UDim2.new(1, 0, 0, 20)
    barBackground.Position = UDim2.new(0, 0, 1, -20)
    barBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    barBackground.BorderSizePixel = 0
    barBackground.ClipsDescendants = true
    barBackground.ZIndex = 5
    Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 10)

    local progress = Instance.new("Frame", barBackground)
    progress.Size = UDim2.new(0, 0, 1, 0)
    progress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    progress.BorderSizePixel = 0
    progress.ZIndex = 5
    Instance.new("UICorner", progress).CornerRadius = UDim.new(0, 10)

    local gradient = Instance.new("UIGradient", progress)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(139, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 60, 60))
    }

    local toolsCountLabel = Instance.new("TextLabel", container)
    toolsCountLabel.Size = UDim2.new(1, 0, 0, 20)
    toolsCountLabel.Position = UDim2.new(0, 0, 1, 5)
    toolsCountLabel.BackgroundTransparency = 1
    toolsCountLabel.Font = Enum.Font.GothamBold
    toolsCountLabel.TextSize = 16
    toolsCountLabel.TextColor3 = Color3.new(1, 1, 1)
    toolsCountLabel.Text = "Tools: 0"
    toolsCountLabel.ZIndex = 5

    local function countTools()
        local total = 0
        for _, c in ipairs({player.Backpack, player.Character}) do
            for _, tool in ipairs(c:GetChildren()) do
                if tool:IsA("Tool") then total += 1 end
            end
        end
        return total
    end

    local function countRequiredTools(text)
        local total = 0
        for c in text:upper():gmatch(".") do
            local rows = CHAR_MAP[c]
            if rows then
                for _, row in ipairs(rows) do
                    total += row:gsub("0", ""):len()
                end
            else
                warn("Invalid character:", c)
            end
        end
        return total
    end

    local text = getgenv().CustomText or "New Message!"
    local maxTools = countRequiredTools(text)

    local function animateBar(callback)
        for i = 1, 100 do
            progress.Size = UDim2.new(i / 100, 0, 1, 0)
            local currentTools = countTools()
            toolsCountLabel.Text = "Tools: " .. currentTools .. "/" .. maxTools
            task.wait(0.03)
        end
        callback()
    end

    animateBar(function()
        local character = player.Character or player.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        local originalPosition = hrp.Position

        local function teleportTo(pos)
            hrp.CFrame = CFrame.new(pos)
        end

        teleportTo(Vector3.new(430, -108, 100))
        task.wait(0.5)

        local clickDetector = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_DayCare").Tools:WaitForChild("FireX"):WaitForChild("ClickDetector")

        repeat
            fireclickdetector(clickDetector)
            toolsCountLabel.Text = "Tools: " .. (countTools() + 1) .. "/" .. maxTools
            task.wait()
        until countTools() >= maxTools

        task.wait(1)

        local tools = {}
        for _, c in ipairs({player.Backpack, player.Character}) do
            for _, tool in ipairs(c:GetChildren()) do
                if tool:IsA("Tool") then table.insert(tools, tool) end
            end
        end

        if #tools < maxTools then
            warn("Not enough tools, required: " .. maxTools .. ", Found: " .. #tools)
            getgenv()._Running = false
            return
        end

        for _, tool in ipairs(player.Character:GetChildren()) do
            if tool:IsA("Tool") then tool.Parent = player.Backpack end
        end

        task.wait(0.2)

        local gripMap = {}
        local startPos = Vector3.new(0, -5, 0)
        local pixelSize = Vector3.new(1.2, 1.2, 0)
        local toolIndex = 1
        local offsetX = 0

        for i = 1, #text do
            local char = text:sub(i, i):upper()
            local map = CHAR_MAP[char]
            if map then
                for y = 1, #map do
                    for x = 1, #map[y] do
                        if map[y]:sub(x, x) == "1" then
                            local tool = tools[toolIndex]
                            if tool then
                                gripMap[tool] = CFrame.new(
                                    startPos.X + (offsetX + x - 1) * pixelSize.X,
                                    startPos.Y + (y - 1) * pixelSize.Y,
                                    startPos.Z
                                )
                                toolIndex += 1
                            end
                        end
                    end
                end
                offsetX += #map[1] + 1
            end
        end

        teleportTo(originalPosition)
        task.wait(3)

        for tool, grip in pairs(gripMap) do
            tool.Grip = grip
        end

        task.wait(3)

        for i = 1, maxTools do
            if tools[i] then
                tools[i].Parent = player.Character
            end
        end

        screenGui:Destroy()
        getgenv()._Running = false
    end)
end})
Tabs.JJ:AddSection({Translator:traduzir("Crie um Muro de tools")})
local selectedSize = 100 -- valor padrão

local Dropdown = Tabs.JJ:AddDropdown({
    Name = "Tamanho Do Muro",
    Description = "Escolha a quantidade de tools para formar o muro",
    Options = {"100", "200", "300", "400"}, 
    Default = "Size",
    Flag = "WallSize",
    Callback = function(value)
        selectedSize = tonumber(value)
    end
})

Tabs.JJ:AddButton({
    Name = "Criar Muro",
    Callback = function()
        if getgenv()._Running then
            warn("A process is already running")
            return
        end
        getgenv()._Running = true

        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CoreGui = game:GetService("CoreGui")
        local player = Players.LocalPlayer

        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllTools")

        if CoreGui:FindFirstChild("LoadingUI") then return end

        local screenGui = Instance.new("ScreenGui", CoreGui)
        screenGui.Name = "LoadingUI"
        screenGui.IgnoreGuiInset = true
        screenGui.DisplayOrder = 999999
        screenGui.ResetOnSpawn = false
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        local topLeftContainer = Instance.new("Frame")
        topLeftContainer.Size = UDim2.new(0, 200, 0, 40)
        topLeftContainer.Position = UDim2.new(0, 10, 0, 10)
        topLeftContainer.BackgroundTransparency = 1
        topLeftContainer.ZIndex = 5
        topLeftContainer.Parent = screenGui
        
        local icon = Instance.new("ImageLabel")
        icon.Size = UDim2.new(0, 30, 0, 30)
        icon.Position = UDim2.new(0, 0, 0.5, -15)
        icon.BackgroundTransparency = 1
        icon.Image = "rbxassetid://72495850369898"
        icon.ZIndex = 5
        icon.Parent = topLeftContainer
        
        local hubText = Instance.new("TextLabel")
        hubText.Size = UDim2.new(1, -35, 1, 0)
        hubText.Position = UDim2.new(0, 35, 0, 0)
        hubText.BackgroundTransparency = 1
        hubText.Text = "drip formts"
        hubText.Font = Enum.Font.GothamBold
        hubText.TextSize = 20
        hubText.TextColor3 = Color3.new(1, 1, 1)
        hubText.TextXAlignment = Enum.TextXAlignment.Left
        hubText.ZIndex = 5
        hubText.Parent = topLeftContainer
        
        local imageBackground = Instance.new("ImageLabel", screenGui)
        imageBackground.Size = UDim2.new(1, 0, 1, 0)
        imageBackground.Position = UDim2.new(0, 0, 0, 0)
        imageBackground.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        imageBackground.BorderSizePixel = 0
        imageBackground.Image = "rbxassetid://79888503709168"
        imageBackground.ImageTransparency = 0
        imageBackground.ScaleType = Enum.ScaleType.Stretch
        imageBackground.ZIndex = 0
        
        local blocker = Instance.new("TextButton", screenGui)
        blocker.Size = UDim2.new(1, 0, 1, 0)
        blocker.Position = UDim2.new(0, 0, 0, 0)
        blocker.BackgroundTransparency = 1
        blocker.BorderSizePixel = 0
        blocker.Text = ""
        blocker.Modal = true
        blocker.AutoButtonColor = false
        blocker.ZIndex = 1
        
        local container = Instance.new("Frame", screenGui)
        container.Size = UDim2.new(0, 400, 0, 60)
        container.Position = UDim2.new(0.5, -200, 0.5, -30)
        container.BackgroundTransparency = 1
        container.ZIndex = 5
        
        local label = Instance.new("TextLabel", container)
        label.Size = UDim2.new(1, 0, 0, 30)
        label.Position = UDim2.new(0, 0, 0, 0)
        label.Text = "Loading..."
        label.Font = Enum.Font.GothamBold
        label.TextSize = 20
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundTransparency = 1
        label.ZIndex = 5
        
        local barBackground = Instance.new("Frame", container)
        barBackground.Size = UDim2.new(1, 0, 0, 20)
        barBackground.Position = UDim2.new(0, 0, 1, -20)
        barBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        barBackground.BorderSizePixel = 0
        barBackground.ClipsDescendants = true
        barBackground.ZIndex = 5
        Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 10)
        
        local progress = Instance.new("Frame", barBackground)
        progress.Size = UDim2.new(0, 0, 1, 0)
        progress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        progress.BorderSizePixel = 0
        progress.ZIndex = 5
        Instance.new("UICorner", progress).CornerRadius = UDim.new(0, 10)
        
        local gradient = Instance.new("UIGradient", progress)
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(198, 200, 197)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
        }
        
        local toolsCountLabel = Instance.new("TextLabel", container)
        toolsCountLabel.Size = UDim2.new(1, 0, 0, 20)
        toolsCountLabel.Position = UDim2.new(0, 0, 1, 5)
        toolsCountLabel.BackgroundTransparency = 1
        toolsCountLabel.Font = Enum.Font.GothamBold
        toolsCountLabel.TextSize = 16
        toolsCountLabel.TextColor3 = Color3.new(1, 1, 1)
        toolsCountLabel.Text = "Tools: 0"
        toolsCountLabel.ZIndex = 5
        
        local function countTools()
            local total = 0
            for _, c in ipairs({player.Backpack, player.Character}) do
                for _, tool in ipairs(c:GetChildren()) do
                    if tool:IsA("Tool") then total += 1 end
                end
            end
            return total
        end

        local maxTools = selectedSize 
        
        local function countTools()
            local total = 0
            for _, c in ipairs({player.Backpack, player.Character}) do
                for _, tool in ipairs(c:GetChildren()) do
                    if tool:IsA("Tool") then total += 1 end
                end
            end
            return total
        end

        local function animateBar(callback)
            for i = 1, 100 do
                progress.Size = UDim2.new(i / 100, 0, 1, 0)
                local currentTools = countTools()
                toolsCountLabel.Text = "Tools: " .. currentTools .. "/" .. maxTools
                task.wait(0.03)
            end
            callback()
        end

        animateBar(function()
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            local originalPosition = hrp.Position

            local function teleportTo(pos)
                hrp.CFrame = CFrame.new(pos)
            end

            player.Character:FindFirstChildOfClass("Humanoid").Sit = false
            teleportTo(Vector3.new(430, -108, 100))
            task.wait(0.5)

            local clickDetector = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_DayCare").Tools:WaitForChild("FireX"):WaitForChild("ClickDetector")

            repeat
                fireclickdetector(clickDetector)
                toolsCountLabel.Text = "Tools: " .. (countTools() + 1) .. "/" .. maxTools
                task.wait()
            until countTools() >= maxTools

            task.wait(1)

            local tools = {}
            for _, c in ipairs({player.Backpack, player.Character}) do
                for _, tool in ipairs(c:GetChildren()) do
                    if tool:IsA("Tool") then table.insert(tools, tool) end
                end
            end

            if #tools < maxTools then
                warn("Not enough tools, required: " .. maxTools .. ", Found: " .. #tools)
                getgenv()._Running = false
                return
            end

            for _, tool in ipairs(player.Character:GetChildren()) do
                if tool:IsA("Tool") then tool.Parent = player.Backpack end
            end

            task.wait(0.2)

            local gripMap = {}
            local startPos = Vector3.new(0, -10, 0)
            local pixelSize = Vector3.new(1.5, 1.5, 0)

            local width = math.floor(math.sqrt(maxTools))
            local height = math.ceil(maxTools / width)

            local toolIndex = 1
            for y = 1, height do
                for x = 1, width do
                    local tool = tools[toolIndex]
                    if tool then
                        gripMap[tool] = CFrame.new(
                            startPos.X + (x - 1) * pixelSize.X,
                            startPos.Y + (y - 1) * pixelSize.Y,
                            startPos.Z
                        )
                        toolIndex += 1
                    end
                end
            end

            player.Character:FindFirstChildOfClass("Humanoid").Sit = false
            teleportTo(originalPosition)
            task.wait(3)

            for tool, grip in pairs(gripMap) do
                tool.Grip = grip
            end

            task.wait(3)

            for i = 1, maxTools do
                if tools[i] then
                    tools[i].Parent = player.Character
                end
            end

            screenGui:Destroy()
            getgenv()._Running = false
        end)
    end
})
Tabs.JJ:AddSection({Translator:traduzir("Crie Um Tornado de tools")})
local selectedSize = 50

local Dropdown = Tabs.JJ:AddDropdown({
    Name = "Tamanho do Tornado",
    Description = "Escolha quantas ferramentas formarão o tornado",
    Options = {"25", "50", "75", "100", "150", "200"},
    Default = "Value",
    Flag = "TornadoSize",
    Callback = function(value)
        selectedSize = tonumber(value)
    end
})

Tabs.JJ:AddButton({
    Name = "Criar Tornado",
    Callback = function()
        if getgenv()._Running then
            warn("A process is already running")
            return
        end
        getgenv()._Running = true

        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CoreGui = game:GetService("CoreGui")
        local RunService = game:GetService("RunService")
        local player = Players.LocalPlayer

        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer("ClearAllTools")

        if CoreGui:FindFirstChild("LoadingUI") then return end

        local screenGui = Instance.new("ScreenGui", CoreGui)
        screenGui.Name = "LoadingUI"
        screenGui.IgnoreGuiInset = true
        screenGui.DisplayOrder = 999999
        screenGui.ResetOnSpawn = false
        screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        
        local topLeftContainer = Instance.new("Frame")
        topLeftContainer.Size = UDim2.new(0, 200, 0, 40)
        topLeftContainer.Position = UDim2.new(0, 10, 0, 10)
        topLeftContainer.BackgroundTransparency = 1
        topLeftContainer.ZIndex = 5
        topLeftContainer.Parent = screenGui
        
        local icon = Instance.new("ImageLabel")
        icon.Size = UDim2.new(0, 30, 0, 30)
        icon.Position = UDim2.new(0, 0, 0.5, -15)
        icon.BackgroundTransparency = 1
        icon.Image = "rbxassetid://72495850369898"
        icon.ZIndex = 5
        icon.Parent = topLeftContainer
        
        local hubText = Instance.new("TextLabel")
        hubText.Size = UDim2.new(1, -35, 1, 0)
        hubText.Position = UDim2.new(0, 35, 0, 0)
        hubText.BackgroundTransparency = 1
        hubText.Text = "drip Tornads"
        hubText.Font = Enum.Font.GothamBold
        hubText.TextSize = 20
        hubText.TextColor3 = Color3.new(1, 1, 1)
        hubText.TextXAlignment = Enum.TextXAlignment.Left
        hubText.ZIndex = 5
        hubText.Parent = topLeftContainer
        
        local imageBackground = Instance.new("ImageLabel", screenGui)
        imageBackground.Size = UDim2.new(1, 0, 1, 0)
        imageBackground.Position = UDim2.new(0, 0, 0, 0)
        imageBackground.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        imageBackground.BorderSizePixel = 0
        imageBackground.Image = "rbxassetid://79888503709168"
        imageBackground.ImageTransparency = 0
        imageBackground.ScaleType = Enum.ScaleType.Stretch
        imageBackground.ZIndex = 0
        
        local blocker = Instance.new("TextButton", screenGui)
        blocker.Size = UDim2.new(1, 0, 1, 0)
        blocker.Position = UDim2.new(0, 0, 0, 0)
        blocker.BackgroundTransparency = 1
        blocker.BorderSizePixel = 0
        blocker.Text = ""
        blocker.Modal = true
        blocker.AutoButtonColor = false
        blocker.ZIndex = 1
        
        local container = Instance.new("Frame", screenGui)
        container.Size = UDim2.new(0, 400, 0, 60)
        container.Position = UDim2.new(0.5, -200, 0.5, -30)
        container.BackgroundTransparency = 1
        container.ZIndex = 5
        
        local label = Instance.new("TextLabel", container)
        label.Size = UDim2.new(1, 0, 0, 30)
        label.Position = UDim2.new(0, 0, 0, 0)
        label.Text = "Loading..."
        label.Font = Enum.Font.GothamBold
        label.TextSize = 20
        label.TextColor3 = Color3.new(1, 1, 1)
        label.BackgroundTransparency = 1
        label.ZIndex = 5
        
        local barBackground = Instance.new("Frame", container)
        barBackground.Size = UDim2.new(1, 0, 0, 20)
        barBackground.Position = UDim2.new(0, 0, 1, -20)
        barBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        barBackground.BorderSizePixel = 0
        barBackground.ClipsDescendants = true
        barBackground.ZIndex = 5
        Instance.new("UICorner", barBackground).CornerRadius = UDim.new(0, 10)
        
        local progress = Instance.new("Frame", barBackground)
        progress.Size = UDim2.new(0, 0, 1, 0)
        progress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        progress.BorderSizePixel = 0
        progress.ZIndex = 5
        Instance.new("UICorner", progress).CornerRadius = UDim.new(0, 10)
        
        local gradient = Instance.new("UIGradient", progress)
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(198, 200, 197)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
        }
        
        local toolsCountLabel = Instance.new("TextLabel", container)
        toolsCountLabel.Size = UDim2.new(1, 0, 0, 20)
        toolsCountLabel.Position = UDim2.new(0, 0, 1, 5)
        toolsCountLabel.BackgroundTransparency = 1
        toolsCountLabel.Font = Enum.Font.GothamBold
        toolsCountLabel.TextSize = 16
        toolsCountLabel.TextColor3 = Color3.new(1, 1, 1)
        toolsCountLabel.Text = "Tools: 0"
        toolsCountLabel.ZIndex = 5
        
        local function countTools()
            local total = 0
            for _, c in ipairs({player.Backpack, player.Character}) do
                for _, tool in ipairs(c:GetChildren()) do
                    if tool:IsA("Tool") then total += 1 end
                end
            end
            return total
        end

        local maxTools = selectedSize

        local function countTools()
            local total = 0
            for _, c in ipairs({player.Backpack, player.Character}) do
                for _, tool in ipairs(c:GetChildren()) do
                    if tool:IsA("Tool") then total += 1 end
                end
            end
            return total
        end

        local function animateBar(callback)
            for i = 1, 100 do
                progress.Size = UDim2.new(i / 100, 0, 1, 0)
                local currentTools = countTools()
                toolsCountLabel.Text = "Tools: " .. currentTools .. "/" .. maxTools
                task.wait(0.03)
            end
            callback()
        end

        animateBar(function()
            local character = player.Character or player.CharacterAdded:Wait()
            local hrp = character:WaitForChild("HumanoidRootPart")
            local originalPosition = hrp.Position

            local function teleportTo(pos)
                hrp.CFrame = CFrame.new(pos)
            end

            player.Character:FindFirstChildOfClass("Humanoid").Sit = false
            teleportTo(Vector3.new(430, -108, 100))
            task.wait(0.5)

            local clickDetector = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_DayCare").Tools:WaitForChild("FireX"):WaitForChild("ClickDetector")

            repeat
                fireclickdetector(clickDetector)
                toolsCountLabel.Text = "Tools: " .. (countTools() + 1) .. "/" .. maxTools
                task.wait()
            until countTools() >= maxTools

            task.wait(1)

            local tools = {}
            for _, c in ipairs({player.Backpack, player.Character}) do
                for _, tool in ipairs(c:GetChildren()) do
                    if tool:IsA("Tool") then table.insert(tools, tool) end
                end
            end

            if #tools < maxTools then
                warn("Not enough tools, required: " .. maxTools .. ", Found: " .. #tools)
                getgenv()._Running = false
                return
            end

            for _, tool in ipairs(player.Character:GetChildren()) do
                if tool:IsA("Tool") then tool.Parent = player.Backpack end
            end

            task.wait(0.2)

            local radius = 8
            local centerPos = Vector3.new(0, -5, 0)
            local angleStep = (2 * math.pi) / maxTools

            local gripMap = {}
            for i, tool in ipairs(tools) do
                if i <= maxTools then
                    local angle = (i - 1) * angleStep
                    local x = centerPos.X + radius * math.cos(angle)
                    local z = centerPos.Z + radius * math.sin(angle)

                    gripMap[tool] = CFrame.new(x, centerPos.Y, z) * CFrame.Angles(0, angle + math.pi/2, 0)
                end
            end

            player.Character:FindFirstChildOfClass("Humanoid").Sit = false
            teleportTo(originalPosition)
            task.wait(3)

            for tool, grip in pairs(gripMap) do
                tool.Grip = grip
            end

            task.wait(3)

            for i = 1, maxTools do
                if tools[i] then
                    tools[i].Parent = player.Character
                end
            end

            screenGui:Destroy()

            local rotationAngle = 0
            local spinSpeed = 20
            local characterSpinSpeed = 40

            local rotationConnection
            local characterRotation = 0

            rotationConnection = RunService.Heartbeat:Connect(function(deltaTime)
                rotationAngle = rotationAngle + (spinSpeed * deltaTime)
                characterRotation = characterRotation + (characterSpinSpeed * deltaTime)

                if hrp.Parent then
                    hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(characterSpinSpeed * deltaTime), 0)
                end

                for i, tool in ipairs(tools) do
                    if i <= maxTools and tool.Parent == player.Character then
                        local baseAngle = (i - 1) * angleStep
                        local currentAngle = baseAngle + rotationAngle

                        local x = centerPos.X + radius * math.cos(currentAngle)
                        local z = centerPos.Z + radius * math.sin(currentAngle)

                        tool.Grip = CFrame.new(x, centerPos.Y, z) * CFrame.Angles(0, currentAngle + math.pi/2, 0)
                    end
                end
            end)

            local fireRemoteConnection
            fireRemoteConnection = RunService.Heartbeat:Connect(function()
                if player.Character and player.Character:FindFirstChild("FireX") then
                    local args = {
                        "FireX",
                        "On"
                    }
                    player.Character:WaitForChild("FireX"):WaitForChild("ToolSound"):FireServer(unpack(args))
                end
            end)

            player.CharacterRemoving:Connect(function()
                if rotationConnection then
                    rotationConnection:Disconnect()
                end
                if fireRemoteConnection then
                    fireRemoteConnection:Disconnect()
                end
            end)

            getgenv()._Running = false
            getgenv()._CircleRotation = rotationConnection
            getgenv()._FireRemote = fireRemoteConnection
        end)
    end
})
Tabs.JJ:AddButton({
    Name = "Stop Function",
    Callback = function()
        if getgenv()._CircleRotation then
            getgenv()._CircleRotation:Disconnect()
            getgenv()._CircleRotation = nil
        end

        if getgenv()._FireRemote then
            getgenv()._FireRemote:Disconnect()
            getgenv()._FireRemote = nil
        end

        getgenv()._Running = false
        warn("Tornado interrompido com sucesso.")
    end
})
Tabs.JJ:AddSection({Translator:traduzir("Notificações Mapa")})
local NotificationSystem = {
    joinLeaveEnabled = false,
    deathEnabled = false
}

local function showNotification(title, message, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = message,
        Duration = duration or 5
    })
end

local function monitorPlayerDeath(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid", 5)
        if humanoid then
            humanoid.Died:Connect(function()
                if NotificationSystem.deathEnabled then
                    showNotification("Jogador Morreu", player.Name .. " morreu", 3)
                end
            end)
        end
    end)
    
    if player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.Died:Connect(function()
                if NotificationSystem.deathEnabled then
                    showNotification("Jogador Morreu", player.Name .. " morreu", 3)
                end
            end)
        end
    end
end

Tabs.JJ:AddToggle({
    Name = Translator:traduzir("Notificação: Entrada/Saída"),
    Description = Translator:traduzir("Notifica quando jogadores entram ou saem"),
    Default = false,
    Callback = function(value)
        NotificationSystem.joinLeaveEnabled = value
    end
})

Tabs.JJ:AddToggle({
    Name = Translator:traduzir("Notificação De Morte"),
    Description = Translator:traduzir("Mostra quando um jogador morre"),
    Default = false,
    Callback = function(value)
        NotificationSystem.deathEnabled = value
    end
})

Players.PlayerAdded:Connect(function(player)
    if NotificationSystem.joinLeaveEnabled then
        showNotification("Jogador Entrou", player.Name .. " entrou no jogo", 5)
    end
    monitorPlayerDeath(player)
end)

Players.PlayerRemoving:Connect(function(player)
    if NotificationSystem.joinLeaveEnabled then
        showNotification("Jogador Saiu", player.Name .. " saiu do jogo", 5)
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    monitorPlayerDeath(player)
end

local workspacePlayers = workspace:FindFirstChild("Players")
if workspacePlayers then
    workspacePlayers.ChildAdded:Connect(function(child)
        if NotificationSystem.joinLeaveEnabled then
            showNotification("Entrou na Workspace", child.Name .. " entrou na Workspace.Players", 5)
        end
    end)

    workspacePlayers.ChildRemoved:Connect(function(child)
        if NotificationSystem.joinLeaveEnabled then
            showNotification("Saiu da Workspace", child.Name .. " saiu da Workspace.Players", 5)
        end
    end)
end

Tabs.JJ:AddSection({Translator:traduzir("Jogador Euzinho")})

local PlayerAbilities = {
    noClip = false,
    infiniteJump = false,
    invisible = false
}

local function updateNoClip()
    if PlayerAbilities.noClip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end

local function onJumpRequest()
    if PlayerAbilities.infiniteJump and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState("Jumping")
        end
    end
end

Tabs.JJ:AddToggle({
    Name = Translator:traduzir("Atravessar Paredes"),
    Description = Translator:traduzir("Permite atravessar paredes e objetos"),
    Default = false,
    Callback = function(value)
        PlayerAbilities.noClip = value
    end
})

Tabs.JJ:AddToggle({
    Name = Translator:traduzir("Pulos Infinitos"),
    Description = Translator:traduzir("Permite pular infinitamente no ar"),
    Default = false,
    Callback = function(value)
        PlayerAbilities.infiniteJump = value
    end
})

Tabs.JJ:AddToggle({
    Name = Translator:traduzir("Invisibilidade"),
    Description = Translator:traduzir("Torna o personagem invisível não volta ao normal"),
    Default = false,
    Callback = function(value)
        if value then
            local args = {
                [1] = {
                    [1] = 102344834840946,
                    [2] = 70400527171038,
                    [3] = 0, [4] = 0, [5] = 0, [6] = 0
                }
            }

            local remotes = ReplicatedStorage:WaitForChild("Remotes")
            remotes:WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
            remotes:WaitForChild("Wear"):InvokeServer(111858803548721)

            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                local description = LocalPlayer.Character.Humanoid.HumanoidDescription
                local accessories = {}

                for _, assetString in ipairs({
                    description.BackAccessory, description.FaceAccessory,
                    description.FrontAccessory, description.NeckAccessory,
                    description.HatAccessory, description.HairAccessory,
                    description.ShouldersAccessory, description.WaistAccessory,
                    description.GraphicTShirt
                }) do
                    for assetId in string.gmatch(assetString, "%d+") do
                        table.insert(accessories, tonumber(assetId))
                    end
                end

                for _, accessoryId in ipairs(accessories) do
                    task.spawn(function()
                        remotes:WaitForChild("Wear"):InvokeServer(accessoryId)
                    end)
                end
            end
        end
    end
})

Tabs.JJ:AddSection({Translator:traduzir("Voo & Equipe All")})
Tabs.JJ:AddButton({
    Translator:traduzir("Fly Drip Chip"),
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realgengar/scripts/refs/heads/main/Fly.Lua", true))()
    end
})
local Button = Tabs.JJ:AddButton({Translator:traduzir("Equipa Todos Items"), function()
    local player = game.Players.LocalPlayer
    local backpack = player:WaitForChild("Backpack")
    for _, item in ipairs(backpack:GetChildren()) do
        item.Parent = player.Character
    end
end})

RunService.Stepped:Connect(updateNoClip)
UserInputService.JumpRequest:Connect(onJumpRequest)
-- ================== SEÇÃO: SISTEMA DE TELEPORTE ==================
Tabs.JJ:AddSection({Translator:traduzir("Teleporte")})

local TeleportSystem = {
    selectedPlayer = nil,
    teleportEnabled = false,
    cameraConnection = nil
}

local function getPlayersList()
    local playerList = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

local function teleportToPlayer()
    if TeleportSystem.selectedPlayer and TeleportSystem.teleportEnabled then
        local targetPlayer = Players:FindFirstChild(TeleportSystem.selectedPlayer)
        if targetPlayer and targetPlayer.Character and LocalPlayer.Character then
            local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            local localHRP = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetHRP and localHRP then
                localHRP.CFrame = targetHRP.CFrame
            end
        end
    end
end

local function teleportCarToPlayer()
    if not TeleportSystem.selectedPlayer then return end
    
    local targetPlayer = Players:FindFirstChild(TeleportSystem.selectedPlayer)
    if not targetPlayer or not targetPlayer.Character then return end
    
    local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end
    
    local vehicles = workspace:FindFirstChild("Vehicles")
    if vehicles then
        for _, vehicle in ipairs(vehicles:GetChildren()) do
            local owner = vehicle:FindFirstChild("Owner")
            if owner and owner.Value == LocalPlayer.Name then
                vehicle:SetPrimaryPartCFrame(targetHRP.CFrame)
                break
            end
        end
    end
end

local function updateCameraView(enabled)
    if enabled and TeleportSystem.selectedPlayer then
        local targetPlayer = Players:FindFirstChild(TeleportSystem.selectedPlayer)
        if targetPlayer and targetPlayer.Character then
            local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                workspace.CurrentCamera.CameraSubject = humanoid
            end
        end
    else
        if LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                workspace.CurrentCamera.CameraSubject = humanoid
            end
        end
    end
end

local playerDropdown = Tabs.JJ:AddDropdown({
    Name = Translator:traduzir("Escolher Um Jogador"),
    Description = Translator:traduzir("Selecione um jogador para usar as funções"),
    Options = getPlayersList(),
    Default = "Players",
    Callback = function(value)
        TeleportSystem.selectedPlayer = value
        if TeleportSystem.teleportEnabled then
            teleportToPlayer()
        end
    end
})

Tabs.JJ:AddButton({
    Translator:traduzir("Atualizar Lista"),
    function()
        playerDropdown:Set(getPlayersList())
    end
})

Tabs.JJ:AddButton({
    Translator:traduzir("Teleportar Com Carro"),
    function()
        teleportCarToPlayer()
    end
})

Tabs.JJ:AddToggle({
    Name = Translator:traduzir("Teleporte Automático"),
    Description = Translator:traduzir("Teleporta instantaneamente para o jogador"),
    Default = false,
    Callback = function(value)
        TeleportSystem.teleportEnabled = value
        if value then
            teleportToPlayer()
        end
    end
})

Tabs.JJ:AddToggle({
    Name = Translator:traduzir("Visualizar Jogador"),
    Description = Translator:traduzir("Acompanha o jogador com a câmera"),
    Default = false,
    Callback = function(value)
        if value then
            if not TeleportSystem.cameraConnection then
                TeleportSystem.cameraConnection = RunService.Heartbeat:Connect(function()
                    updateCameraView(true)
                end)
            end
        else
            if TeleportSystem.cameraConnection then
                TeleportSystem.cameraConnection:Disconnect()
                TeleportSystem.cameraConnection = nil
            end
            updateCameraView(false)
        end
    end
})
end
-----------------///////TABS - TT///////-----------------
do
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- Criar o BlackHole
local BlackHole = Instance.new("Part")
BlackHole.Size = Vector3.new(100000, 100000, 100000)
BlackHole.Transparency = 1
BlackHole.Anchored = true
BlackHole.CanCollide = false
BlackHole.Name = "BlackHoleTarget"
BlackHole.Parent = Workspace

local baseAttachment = Instance.new("Attachment")
baseAttachment.Name = "BlackRole_BlackHoleAttachment"
baseAttachment.Parent = BlackHole

RunService.Heartbeat:Connect(function()
  BlackHole.CFrame = HRP.CFrame
end)

-- Setup das portas
local ControlledDoors = {}

local function SetupPart(part)
  if not part:IsA("BasePart") or part.Anchored or not string.find(part.Name:lower(), "door") then return end
  if part:FindFirstChild("BlackRole_Attached") then return end

  part.CanCollide = false
  part.Transparency = 1

  for _, obj in ipairs(part:GetChildren()) do
    if obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then
      obj:Destroy()
    end
  end

  local marker = Instance.new("BoolValue")
  marker.Name = "BlackRole_Attached"
  marker.Parent = part

  local attachment = Instance.new("Attachment")
  attachment.Parent = part

  local align = Instance.new("AlignPosition")
  align.Parent = part
  align.Attachment0 = attachment
  align.Attachment1 = baseAttachment
  align.MaxForce = math.huge
  align.MaxVelocity = math.huge
  align.Responsiveness = 200

  local torque = Instance.new("Torque")
  torque.Parent = part
  torque.Attachment0 = attachment
  torque.RelativeTo = Enum.ActuatorRelativeTo.World
  torque.Torque = Vector3.new(
    math.random(-1000000, 1000000),
    math.random(-1000000, 1000000),
    math.random(-1000000, 1000000)
  )

  table.insert(ControlledDoors, {Part = part, Align = align, Attachment = attachment})
end

for _, obj in ipairs(Workspace:GetDescendants()) do
  if obj:IsA("BasePart") and string.find(obj.Name:lower(), "door") then
    SetupPart(obj)
  end
end

Workspace.DescendantAdded:Connect(function(obj)
  if obj:IsA("BasePart") and string.find(obj.Name:lower(), "door") then
    task.wait(0.1)
    SetupPart(obj)
  end
end)

local function FlingPlayer(player)
  local char = player.Character
  if not char then return end
  local targetHRP = char:FindFirstChild("HumanoidRootPart")
  if not targetHRP then return end

  local targetAttachment = targetHRP:FindFirstChild("SHNMAX_TargetAttachment")
  if not targetAttachment then
    targetAttachment = Instance.new("Attachment", targetHRP)
    targetAttachment.Name = "SHNMAX_TargetAttachment"
  end

  for _, data in ipairs(ControlledDoors) do
    if data.Align then
      data.Align.Attachment1 = targetAttachment
    end
  end

  local start = tick()
  while tick() - start < 5 do
    if targetHRP.Velocity.Magnitude >= 20 then
      break
    end
    RunService.Heartbeat:Wait()
  end

  for _, data in ipairs(ControlledDoors) do
    if data.Align then
      data.Align.Attachment1 = baseAttachment
    end
  end
end

local selectedPlayer = nil
local flingEnabled = false

local Annoy = Tabs.TT:AddDropdown({
  Name = Translator:traduzir("Selecionar Jogador"),
  Description = Translator:traduzir("Escolha um jogador para aplicar o efeito"),
  Options = novaTabela,
  Default = "Players",
  Flag = "PlayerDropdown",
  Callback = function(value)
    selectedPlayer = Players:FindFirstChild(value)
    if selectedPlayer and flingEnabled then
      FlingPlayer(selectedPlayer)
    end
  end
})

Tabs.TT:AddToggle({
    Name = Translator:traduzir("Visualizar Jogador"),
    Description = Translator:traduzir("Acompanha o jogador com a câmera"),
    Default = false,
    Callback = function(value)
                local function UpdateCamera()
            local targetPlayer = value and Players:FindFirstChild(selectedPlayer)
            local subject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            
            if targetPlayer and targetPlayer.Character then
                subject = targetPlayer.Character:FindFirstChild("Humanoid")
            end
            
            if subject then Camera.CameraSubject = subject end
        end

        if value then
            if not getgenv().CameraConnection then
                getgenv().CameraConnection = RunService.Heartbeat:Connect(UpdateCamera)
            end
        else
            if getgenv().CameraConnection then
                getgenv().CameraConnection:Disconnect()
                getgenv().CameraConnection = nil
            end
            UpdateCamera()
        end
    end
})

Tabs.TT:AddButton({
    Name = Translator:traduzir("Atualizar Lista"),
    Callback = function()
        local lista = {}
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= LocalPlayer then
                table.insert(lista, v.Name)
            end
        end
        Annoy:Set(lista)
    end
})

local Toggle = Tabs.TT:AddToggle({
  Name = "Annoy",
  Description = Translator:traduzir("fling jogador em 5 segundos"),
  Default = false
})

local function ResetDoors()
  for _, data in ipairs(ControlledDoors) do
    if data.Align then
      data.Align.Attachment1 = baseAttachment
    end
  end
end

Toggle:Callback(function(Value)
  flingEnabled = Value
  if selectedPlayer and flingEnabled then
    FlingPlayer(selectedPlayer)
  elseif not flingEnabled then
    ResetDoors()
  end
end)
    
local selectedPlayerName = nil
local chasingplayer = nil
local parteSelecionada = "HumanoidRootPart"
local fireLoopActive = false
local fireLoopActiveServer = false
local ignoreTarget = nil
local methodKill = nil

getgenv().Target = nil
getgenv().CameraConnection = nil
getgenv().RunService = nil
getgenv().flingloop = false

local nomesRP = {
    "oi kkkk", "Sou Seu filho", "Armaria", "Tenho Dono: Lucas", "Estoy loco", 
    "XALALALAL", "ANALFABETO", "Criança", "Web namoro", "Veia", "DRIP CLIENT", 
    "KITA!!!!", "MÃEEEE", "PAIII", "BANCOPAN", "Calada", "Tenho Dona: Lolyta", "Uso Hack"
}

local parteMapeada = {
    [Translator:traduzir("Cabeça")] = "Head",
    [Translator:traduzir("Peito Superior")] = "UpperTorso",
    [Translator:traduzir("Barriga Inferior")] = "LowerTorso",
    [Translator:traduzir("Frente do Corpo")] = "HumanoidRootPart",
    [Translator:traduzir("Frente")] = "HumanoidRootPart",
    [Translator:traduzir("Traseiro")] = "HumanoidRootPart"
}


Tabs.TT:AddSection({Name = Translator:traduzir("Pirralhos Trolagem <filho>")})

local playerDropdown = Tabs.TT:AddDropdown({
    Name = Translator:traduzir("Escolher Jogador"),
    Description = Translator:traduzir("Selecione quem o pirralho irá seguir"),
    Options = {},
    Default = "Boneco",
    Callback = function(selected)
        chasingplayer = game.Players:FindFirstChild(selected) and selected or nil
    end
})

Tabs.TT:AddDropdown({
    Name = Translator:traduzir("Selecionar Nome RP"),
    Description = Translator:traduzir("Escolha Uma Tag para o pirralho"),
    Options = nomesRP,
    Default = "Nome",
    Callback = function(nomeEscolhido)
        local evento = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1RPNam1eTex1t")
        if evento then 
            evento:FireServer("RolePlayFollow", nomeEscolhido) 
        end
    end
})

Tabs.TT:AddDropdown({
    Name = Translator:traduzir("Parte do Corpo"),
    Description = "Onde o pirralho ficará preso no corpo",
    Options = {Translator:traduzir("Cabeça"), Translator:traduzir("Peito Superior"), Translator:traduzir("Barriga Inferior"), Translator:traduzir("Frente do Corpo"), Translator:traduzir("Frente"), Translator:traduzir("Traseiro")},
    Default = Translator:traduzir("Partes"),
    Callback = function(opcao)
        parteSelecionada = parteMapeada[opcao] or "HumanoidRootPart"
    end
})

Tabs.TT:AddToggle({
    Name = Translator:traduzir("Visualizar Jogador"),
    Default = false,
    Callback = function(value)
        local function UpdateCamera()
            local targetPlayer = value and Players:FindFirstChild(chasingplayer)
            local subject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            
            if targetPlayer and targetPlayer.Character then
                subject = targetPlayer.Character:FindFirstChild("Humanoid")
            end
            
            if subject then Camera.CameraSubject = subject end
        end

        if value then
            if not getgenv().CameraConnection then
                getgenv().CameraConnection = RunService.Heartbeat:Connect(UpdateCamera)
            end
        else
            if getgenv().CameraConnection then
                getgenv().CameraConnection:Disconnect()
                getgenv().CameraConnection = nil
            end
            UpdateCamera()
        end
    end
})

Tabs.TT:AddButton({
    Name = Translator:traduzir("Atualizar Jogadores"),
    Callback = function()
        local lista = {}
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= LocalPlayer then
                table.insert(lista, v.Name)
            end
        end
        playerDropdown:Set(lista)
    end
})

Tabs.TT:AddButton({
    Name = Translator:traduzir("Enviar Pirralho"),
    Callback = function()
        if not chasingplayer then 
            warn("Nenhum jogador selecionado!") 
            return 
        end
        
        local targetChar = workspace:FindFirstChild(chasingplayer)
        if not targetChar then 
            warn("Jogador alvo não encontrado no workspace.") 
            return 
        end

        local pl = LocalPlayer
        if not workspace:FindFirstChild(pl.Name) or not workspace[pl.Name]:FindFirstChild("FollowCharacter") then
            ReplicatedStorage.RE:FindFirstChild("1Bab1yFollo1w"):FireServer("CharacterFollowSpawnPlayer", "BabyBoy")
            task.wait(0.3)
        end

        local pirralho = workspace[pl.Name] and workspace[pl.Name]:FindFirstChild("FollowCharacter")
        local parteAlvo = targetChar:FindFirstChild(parteSelecionada)

        if pirralho and parteAlvo then
            pirralho.Parent = targetChar
            if getgenv().RunService then getgenv().RunService:Disconnect() end

            getgenv().RunService = RunService.Heartbeat:Connect(function()
                if pirralho and pirralho:FindFirstChild("Torso") then
                    pirralho.Torso.BodyPosition.Position = parteAlvo.Position
                    pirralho.Torso.BodyGyro.CFrame = parteAlvo.CFrame
                end
            end)
        else
            warn("A parte '" .. parteSelecionada .. "' não existe no jogador alvo.")
        end
    end
})
Tabs.TT:AddSection({Translator:traduzir("Criar Estruturas")})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local estruturaSelecionada = "Factory"

local function teleportarEConstruir()
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        warn("work nn.")
        player.CharacterAdded:Wait()
    end
    
    local character = player.Character
    local root = character:WaitForChild("HumanoidRootPart")
    local targetPosition = Vector3.new(-37, 19, -145)
    root.CFrame = CFrame.new(targetPosition)
    wait(0.5)
    local success1 = pcall(function()
        local args1 = {6}
        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Lot:Claim"):InvokeServer(unpack(args1))
    end)
    
    if success1 then
        wait(0.3) 
        
        local success2 = pcall(function()
            local args2 = {6, "001_Landmark"}
            ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):FireServer(unpack(args2))
        end)
        
        if success2 then
            print("geracion")
        else
            warn("sem prope")
        end
    else
        warn("erro lote")
    end
end

local Button = Tabs.TT:AddButton({
    Name = Translator:traduzir("Teleportar e Criar Factory"),
    Description = Translator:traduzir("Crie a usina Nuclear na praça"),
    Callback = function()
        teleportarEConstruir()
    end
})
end
do
Tabs.TT:AddSection({Name = Translator:traduzir("Bug Players - Com Efeitos")})
if not fireLoopActiveServer then
    fireLoopActiveServer = false
end

if not ignoreTarget then
    ignoreTarget = nil
end

if not createBugArgs then
    warn("usada")
    function createBugArgs(character)
        return {}
    end
end

function executarSequenciaCombate()
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        warn("achado nn")
        return
    end
    
    local humanoidRootPart = character.HumanoidRootPart
    local posicaoOriginal = humanoidRootPart.Position

    fireLoopActiveServer = true

    task.spawn(function()
        local toolArgs = { [1] = "PickingTools", [2] = "Assault" }
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(toolArgs))

        task.spawn(function()
            repeat task.wait(0.1) until
                LocalPlayer.Backpack:FindFirstChild("Assault")
                and LocalPlayer.Backpack.Assault:FindFirstChild("GunScript_Local")
                and LocalPlayer.Backpack.Assault.GunScript_Local:FindFirstChild("MuzzleEffect")
                and LocalPlayer.Backpack.Assault.GunScript_Local:FindFirstChild("HitEffect")

            local gunScript = LocalPlayer.Backpack.Assault.GunScript_Local
            local muzzle = gunScript.MuzzleEffect
            local hit = gunScript.HitEffect

            while fireLoopActiveServer do
                for _, alvo in ipairs(Players:GetPlayers()) do
                    if alvo ~= LocalPlayer and alvo ~= ignoreTarget and alvo.Character and alvo.Character:FindFirstChild("HumanoidRootPart") then
                        local hrp = alvo.Character.HumanoidRootPart

                        local args = {
                            [1] = hrp,
                            [2] = hrp,
                            [3] = Vector3.new(100000000376832, 100000000376832, 100000000376832),
                            [4] = hrp.Position,
                            [5] = muzzle,
                            [6] = hit,
                            [7] = 0,
                            [8] = 0,
                            [9] = { [1] = false },
                            [10] = {
                                [1] = 25,
                                [2] = Vector3.new(100, 100, 100),
                                [3] = BrickColor.new(29),
                                [4] = 0.25,
                                [5] = Enum.Material.SmoothPlastic,
                                [6] = 0.25
                            },
                            [11] = true,
                            [12] = false
                        }

                        ReplicatedStorage.RE:FindFirstChild("1Gu1n"):FireServer(unpack(args))
                        task.wait(0.001)
                    end
                end
            end
        end)
    end)
    
    local bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
    bodyVelocity.Velocity = Vector3.new(0, 50, 0)
    bodyVelocity.Parent = humanoidRootPart
    
    task.spawn(function()
        local alturaInicial = posicaoOriginal.Y
        local alturaDesejada = alturaInicial + 8
        
        repeat 
            task.wait(0.1) 
        until humanoidRootPart.Position.Y >= alturaDesejada
        
        bodyVelocity:Destroy()
        
        local bodyPosition = Instance.new("BodyPosition")
        bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bodyPosition.Position = Vector3.new(humanoidRootPart.Position.X, alturaDesejada, humanoidRootPart.Position.Z)
        bodyPosition.D = 5000
        bodyPosition.P = 10000
        bodyPosition.Parent = humanoidRootPart
        
        task.wait(0.5)
        
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
            local success, err = pcall(function()
                TextChatService.TextChannels.RBXGeneral:SendAsync(
"hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rShinra Tensei!"
                )
            end)
            if not success then
                warn("erro chat:", err)
            end
        else 
            print("nn usados")
        end
        
        local selectedAudioID = 127171723747143
        local args = {
            [1] = workspace,
            [2] = selectedAudioID,
            [3] = 1,
        }
        
        ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(selectedAudioID)
        sound.Parent = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if sound.Parent then
            sound:Play()
        else
            warn("HumanoidRootPart não encontrado")
        end
        
        task.wait(2)
        
        bodyPosition:Destroy()
        
        local bodyVelocityDown = Instance.new("BodyVelocity")
        bodyVelocityDown.MaxForce = Vector3.new(0, math.huge, 0)
        bodyVelocityDown.Velocity = Vector3.new(0, -20, 0)
        bodyVelocityDown.Parent = humanoidRootPart
        
        repeat 
            task.wait(0.1) 
        until humanoidRootPart.Position.Y <= posicaoOriginal.Y + 1
        
        bodyVelocityDown:Destroy()
        
        local success, errorMessage = pcall(function()
            local TweenService = game:GetService("TweenService")
            local currentCharacter = LocalPlayer.Character
            if not currentCharacter or not currentCharacter:FindFirstChild("HumanoidRootPart") then
                warn("Personagem não encontrado durante a explosão!")
                return
            end
            
            local currentHRP = currentCharacter.HumanoidRootPart
            
            local esfera = Instance.new("Part")
            esfera.Shape = Enum.PartType.Ball
            esfera.Anchored = true
            esfera.CanCollide = false
            esfera.Material = Enum.Material.Neon
            esfera.Color = Color3.fromRGB(255, 255, 255)
            esfera.Size = Vector3.new(1,1,1)
            esfera.Position = currentHRP.Position
            esfera.Parent = workspace
            
            local tweenExplosao = TweenService:Create(esfera, TweenInfo.new(1.2, Enum.EasingStyle.Exponential), {
                Size = Vector3.new(500, 500, 500),
                Transparency = 0.5
            })
            tweenExplosao:Play()
            
            local particulas = Instance.new("ParticleEmitter")
            particulas.Texture = "rbxassetid://243098098"
            particulas.Rate = 250
            particulas.Lifetime = NumberRange.new(2)
            particulas.Speed = NumberRange.new(40)
            particulas.Size = NumberSequence.new({ 
                NumberSequenceKeypoint.new(0, 4), 
                NumberSequenceKeypoint.new(1, 0.4) 
            })
            particulas.Parent = esfera
            
            local explosionCenter = currentHRP.Position
            local maxDistance = 200
            local pushForce = 250
            
            task.spawn(function()
                local descendants = workspace:GetDescendants()
                for i = 1, #descendants do
                    local parte = descendants[i]
                    
                    if parte and parte.Parent and parte:IsA("BasePart") and not parte.Anchored then
                        local success2, err2 = pcall(function()
                            local distance = (parte.Position - explosionCenter).Magnitude
                            if distance < maxDistance and distance > 0 then
                                local empurro = Instance.new("BodyVelocity")
                                empurro.Velocity = (parte.Position - explosionCenter).Unit * pushForce
                                empurro.MaxForce = Vector3.new(500000, 500000, 500000)
                                empurro.Parent = parte
                                
                                game:GetService("Debris"):AddItem(empurro, 0.5)
                            end
                        end)
                        
                        if not success2 then
                            warn("part errou:", err2)
                        end
                    end
                    
                    if i % 50 == 0 then
                        task.wait()
                    end
                end
            end)
            
            task.spawn(function()
                task.wait(3)
                if esfera and esfera.Parent then
                    if particulas and particulas.Parent then
                        particulas.Enabled = false
                    end
                    
                    local fadeOut = TweenService:Create(esfera, TweenInfo.new(0.5), {
                        Transparency = 1
                    })
                    fadeOut:Play()
                    
                    fadeOut.Completed:Connect(function()
                        if esfera then
                            esfera:Destroy()
                        end
                    end)
                end
            end)
        end)
        
        if not success then
            warn("erro:", errorMessage)
        end
        
        task.spawn(function()
            task.wait(10)
            if sound then
                sound:Destroy()
            end
        end)
    end)
end

local ButtonStart = Tabs.TT:AddButton({Translator:traduzir("Shinra Tensei"), function()
    executarSequenciaCombate()
end})

local expansionActive = false
local expansionModel = nil
local expansionSound = nil
local originalSky = nil
local cancelExpansion = false
local fireLoop = nil
local soundLoop = nil

local TextChatService = game:GetService("TextChatService")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

Tabs.TT:AddButton({
    Name = "Expansão de Domínio",
    Callback = function()
        if expansionActive then
            warn("Expansão já está ativa!")
            return
        end
        
        expansionActive = true
        cancelExpansion = false
        
        local activationSound = Instance.new("Sound")
        activationSound.SoundId = "rbxassetid://95428790677335"
        activationSound.Volume = 0.8
        activationSound.Parent = workspace
        activationSound:Play()
        
        task.wait(0.5)
        
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then 
            TextChatService.TextChannels.RBXGeneral:SendAsync(
                "hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rExpansão de Domínio"
            )
        end
        
        activationSound.Ended:Connect(function()
            activationSound:Destroy()
        end)
        
        task.spawn(function()
            local args = {
                [1] = workspace,
                [2] = 95428790677335,
                [3] = 1,
            }
            local soundRemote = ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
            if soundRemote then
                soundRemote:FireServer(unpack(args))
            end
        end)

        local function ativarDominio()
            local char = Player.Character or Player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            originalSky = Lighting:FindFirstChildOfClass("Sky")
            if originalSky then
                originalSky.Parent = nil
            end

            expansionModel = Instance.new("Model", workspace)
            expansionModel.Name = "InfiniteVoid"

            local esfera = Instance.new("Part")
            esfera.Name = "DomainSphere"
            esfera.Shape = Enum.PartType.Ball
            esfera.Size = Vector3.new(300, 300, 300)
            esfera.Position = hrp.Position
            esfera.Anchored = true
            esfera.CanCollide = false
            esfera.Material = Enum.Material.ForceField
            esfera.Transparency = 0.3
            esfera.Color = Color3.fromRGB(0, 0, 0)
            esfera.Parent = expansionModel

            local luz = Instance.new("PointLight", esfera)
            luz.Color = Color3.fromRGB(0, 153, 255)
            luz.Brightness = 10
            luz.Range = 300

            local ps = Instance.new("ParticleEmitter", esfera)
            ps.Texture = "rbxassetid://243660364"
            ps.Color = ColorSequence.new(Color3.fromRGB(0, 153, 255))
            ps.LightEmission = 1
            ps.Size = NumberSequence.new(3)
            ps.Transparency = NumberSequence.new(0.2)
            ps.Rate = 1000
            ps.Lifetime = NumberRange.new(2)
            ps.Speed = NumberRange.new(0)
            ps.VelocitySpread = 180

            expansionSound = Instance.new("Sound", esfera)
            expansionSound.SoundId = "rbxassetid://1843527678"
            expansionSound.Volume = 1.5
            expansionSound.Looped = true
            expansionSound:Play()

            local newSky = Instance.new("Sky", Lighting)
            newSky.Name = "DomainSky"
            newSky.SkyboxBk = "rbxassetid://159454299"
            newSky.SkyboxDn = "rbxassetid://159454296"
            newSky.SkyboxFt = "rbxassetid://159454293"
            newSky.SkyboxLf = "rbxassetid://159454286"
            newSky.SkyboxRt = "rbxassetid://159454300"
            newSky.SkyboxUp = "rbxassetid://159454288"
        end

        ativarDominio()

        soundLoop = task.spawn(function()
            local selectedAudioID = 140031333626044
            
            while expansionActive and not cancelExpansion do
                local remote = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
                if remote then
                    pcall(function()
                        remote:FireServer(workspace, selectedAudioID, 1)
                    end)
                end

                local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    local sound = Instance.new("Sound")
                    sound.SoundId = "rbxassetid://" .. selectedAudioID
                    sound.Volume = 0.7
                    sound.Looped = false
                    sound.Parent = root
                    sound:Play()
                    
                    sound.Ended:Connect(function() 
                        if sound then sound:Destroy() end
                    end)
                    
                    local timeLength = sound.TimeLength > 0 and sound.TimeLength or 5
                    task.wait(timeLength + 0.1)
                else
                    warn("HumanoidRootPart não encontrado")
                    break
                end
            end
        end)

        local RE = ReplicatedStorage:WaitForChild("RE")
        local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
        local ToolEvent = RE:FindFirstChild("1Too1l")
        local FireEvent = RE:FindFirstChild("1Gu1n")

        local function clearAllTools()
            if ClearEvent then
                pcall(function()
                    ClearEvent:FireServer("ClearAllTools")
                end)
            end
        end

        local function getAssault()
            if ToolEvent then
                pcall(function()
                    ToolEvent:InvokeServer("PickingTools", "Assault")
                end)
            end
        end

        local function hasAssault()
            return Player.Backpack:FindFirstChild("Assault") ~= nil
        end

        local function fireAtPart(targetPart)
            local gunScript = Player.Backpack:FindFirstChild("Assault")
                and Player.Backpack.Assault:FindFirstChild("GunScript_Local")

            if not gunScript or not targetPart then return end

            local args = {
                targetPart,
                targetPart,
                Vector3.new(1e14, 1e14, 1e14),
                targetPart.Position,
                gunScript:FindFirstChild("MuzzleEffect"),
                gunScript:FindFirstChild("HitEffect"),
                0,
                0,
                { false },
                {
                    25,
                    Vector3.new(100, 100, 100),
                    BrickColor.new(29),
                    0.25,
                    Enum.Material.SmoothPlastic,
                    0.25
                },
                true,
                false
            }

            pcall(function()
                FireEvent:FireServer(unpack(args))
            end)
        end

        local function fireAtAllPlayers(times)
            for i = 1, times do
                if not expansionActive or cancelExpansion then break end
                
                for _, player in ipairs(Players:GetPlayers()) do
                    if not expansionActive or cancelExpansion then break end
                    
                    if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        fireAtPart(player.Character.HumanoidRootPart)
                        task.wait(0.1)
                    end
                end
            end
        end

        fireLoop = task.spawn(function()
            while expansionActive and not cancelExpansion do
                clearAllTools()
                getAssault()

                local attempts = 0
                repeat
                    task.wait(0.2)
                    attempts = attempts + 1
                until hasAssault() or attempts > 25 or not expansionActive or cancelExpansion

                if expansionActive and not cancelExpansion and hasAssault() then
                    fireAtAllPlayers(3)
                end
                
                task.wait(1)
            end
        end)
    end
})

_G.HakiAtived = false
_G.StopHaki = false

local HakiSound
local StopModel
local soundLoop
local fireLoop
local originalSky

local Players          = game:GetService("Players")
local ReplicatedStorage= game:GetService("ReplicatedStorage")
local TextChatService  = game:GetService("TextChatService")
local TweenService     = game:GetService("TweenService")
local Debris           = game:GetService("Debris")
local Lighting         = game:GetService("Lighting")

local Player = Players.LocalPlayer

Tabs.TT:AddButton({
    Name = "Haki Do Rei",
    Callback = function()
        _G.HakiAtived = true
        _G.StopHaki = false

        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Root = Character:WaitForChild("HumanoidRootPart")

        local activationSound = Instance.new("Sound")
        activationSound.SoundId = "rbxassetid://17887086888"
        activationSound.Volume = 0.8
        activationSound.Parent = workspace
        activationSound:Play()
        HakiSound = activationSound

        activationSound.Ended:Connect(function()
            activationSound:Destroy()
        end)

        local hakiBubble = Instance.new("Part")
        hakiBubble.Shape = Enum.PartType.Ball
        hakiBubble.Anchored = true
        hakiBubble.CanCollide = false
        hakiBubble.Material = Enum.Material.ForceField
        hakiBubble.Color = Color3.fromRGB(85, 0, 255)
        hakiBubble.Transparency = 0.5
        hakiBubble.Size = Vector3.new(1, 1, 1)
        hakiBubble.CFrame = Root.CFrame
        hakiBubble.Parent = workspace
        StopModel = hakiBubble

        local particles = Instance.new("ParticleEmitter")
        particles.Texture     = "rbxassetid://243098098"
        particles.Rate        = 200
        particles.Lifetime    = NumberRange.new(1)
        particles.Speed       = NumberRange.new(0)
        particles.Size        = NumberSequence.new{
            NumberSequenceKeypoint.new(0,  3),
            NumberSequenceKeypoint.new(1,  0)
        }
        particles.Color       = ColorSequence.new(
            Color3.fromRGB(255, 0,   0),
            Color3.fromRGB(  0, 0,   0)
        )
        particles.Parent      = hakiBubble

        local expandTween = TweenService:Create(hakiBubble,
            TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            { Size = Vector3.new(80,80,80), Transparency = 1 }
        )
        expandTween:Play()
        Debris:AddItem(hakiBubble, 4)

        local function aplicarHakiCorpo(part)
            local emitter = Instance.new("ParticleEmitter")
            emitter.Texture       = "rbxassetid://243098098"
            emitter.Rate          = 50
            emitter.Lifetime      = NumberRange.new(0.5)
            emitter.Speed         = NumberRange.new(0)
            emitter.Size          = NumberSequence.new{
                NumberSequenceKeypoint.new(0,1),
                NumberSequenceKeypoint.new(1,0)
            }
            emitter.Color         = ColorSequence.new(
                Color3.fromRGB(255, 0,   0),
                Color3.fromRGB(  0, 0,   0)
            )
            emitter.LightEmission = 0.8
            emitter.LockedToPart  = true
            emitter.Parent        = part
        end

        for _, part in ipairs(Character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                aplicarHakiCorpo(part)
            end
        end

        soundLoop = task.spawn(function()
            while _G.HakiAtived and not _G.StopHaki do
                local remote = ReplicatedStorage:FindFirstChild("RE")
                              and ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s")
                if remote then
                    pcall(function()
                        remote:FireServer(workspace, 17887086888, 1)
                    end)
                end

                if Root then
                    local s = Instance.new("Sound")
                    s.SoundId = "rbxassetid://17887086888"
                    s.Volume  = 0.7
                    s.Parent  = Root
                    s:Play()

                    s.Ended:Connect(function() s:Destroy() end)
                    local len = s.TimeLength > 0 and s.TimeLength or 5
                    task.wait(len + 0.1)
                else
                    break
                end
            end
        end)

        fireLoop = task.spawn(function()
            local RE         = ReplicatedStorage:WaitForChild("RE")
            local ClearEvent = RE:FindFirstChild("1Clea1rTool1s")
            local ToolEvent  = RE:FindFirstChild("1Too1l")
            local FireEvent  = RE:FindFirstChild("1Gu1n")

            local function clearAllTools()
                if ClearEvent then
                    pcall(function() ClearEvent:FireServer("ClearAllTools") end)
                end
            end

            local function getAssault()
                if ToolEvent then
                    pcall(function() ToolEvent:InvokeServer("PickingTools", "Assault") end)
                end
            end

            local function hasAssault()
                return Player.Backpack:FindFirstChild("Assault") ~= nil
            end

            local function fireAtPart(target)
                local gunScript = Player.Backpack:FindFirstChild("Assault")
                                  and Player.Backpack.Assault:FindFirstChild("GunScript_Local")
                if not gunScript or not target then return end

                local args = {
                    target, target,
                    Vector3.new(1e14,1e14,1e14),
                    target.Position,
                    gunScript.MuzzleEffect,
                    gunScript.HitEffect,
                    0, 0,
                    { false },
                    { 25, Vector3.new(100,100,100), BrickColor.new(29), 0.25, Enum.Material.SmoothPlastic, 0.25 },
                    true, false
                }
                pcall(function() FireEvent:FireServer(unpack(args)) end)
            end

            while _G.HakiAtived and not _G.StopHaki do
                clearAllTools()
                getAssault()

                local tries = 0
                repeat
                    task.wait(0.2)
                    tries += 1
                until hasAssault() or tries > 25 or not _G.HakiAtived

                if _G.HakiAtived and hasAssault() then
                    for i = 1, 3 do
                        if not _G.HakiAtived then break end
                        for _, pl in ipairs(Players:GetPlayers()) do
                            if pl ~= Player and pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
                                fireAtPart(pl.Character.HumanoidRootPart)
                                task.wait(0.1)
                            end
                        end
                    end
                end

                task.wait(1)
            end
        end)

        originalSky = Lighting:FindFirstChildOfClass("Sky")
    end
})
Tabs.TT:AddButton({"Mangekyou Sharigam", function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Remote = ReplicatedStorage:WaitForChild("RE"):FindFirstChild("1Gu1n")
local index = 1

local activationSound = Instance.new("Sound")
activationSound.SoundId = "rbxassetid://1592708450"
activationSound.Volume = 0.8
activationSound.Parent = workspace
activationSound:Play()
activationSound.Ended:Connect(function()
    activationSound:Destroy()
end)

local function fireEyes()
    for _, eyeName in {"LeftEye", "RightEye"} do
        local eye = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(eyeName)
        if eye then
            local fire = Instance.new("Fire")
            fire.Size = 3
            fire.Heat = 10
            fire.Color = Color3.fromRGB(255, 0, 0)
            fire.SecondaryColor = Color3.fromRGB(0, 0, 0)
            fire.Parent = eye
        end
    end
end

local function shakeCamera()
    local cam = workspace.CurrentCamera
    local shake = Instance.new("NumberValue")
    shake.Name = "CameraShake"
    shake.Value = 5
    shake.Parent = cam

    RunService.RenderStepped:Connect(function()
        if shake.Value > 0 then
            cam.CFrame = cam.CFrame * CFrame.new(
                math.random(-shake.Value, shake.Value) * 0.1,
                math.random(-shake.Value, shake.Value) * 0.1,
                math.random(-shake.Value, shake.Value) * 0.1
            )
        end
    end)

    task.delay(2, function() shake.Value = 0 end)
end

local function blackFlames()
    for _, target in pairs(Players:GetPlayers()) do
        if target ~= LocalPlayer and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local emitter = Instance.new("ParticleEmitter")
            emitter.Texture = "rbxassetid://243098098"
            emitter.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0))
            emitter.LightEmission = 0.5
            emitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 2), NumberSequenceKeypoint.new(1, 0)})
            emitter.Lifetime = NumberRange.new(1)
            emitter.Rate = 50
            emitter.Speed = NumberRange.new(0.5, 1)
            emitter.Rotation = NumberRange.new(0, 360)
            emitter.RotSpeed = NumberRange.new(-90, 90)
            emitter.Parent = target.Character.HumanoidRootPart
        end
    end
end

local function rolar()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "RotatingImageGui"
    screenGui.Parent = LocalPlayer.PlayerGui
    screenGui.ResetOnSpawn = false

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "IdiotImage"
    imageLabel.Size = UDim2.new(0, 200, 0, 200)
    imageLabel.Position = UDim2.new(0.5, -100, 0.5, -100)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = "rbxassetid://114416257899946"
    imageLabel.Parent = screenGui

    local rotationSpeed = 360
    RunService.RenderStepped:Connect(function(deltaTime)
        imageLabel.Rotation = (imageLabel.Rotation + rotationSpeed * deltaTime) % 360
    end)
end

local function colorRed()
    if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.CharacterAdded:Wait()
    end
    local pointLight = Instance.new("PointLight")
    pointLight.Name = "StrongRedLight"
    pointLight.Color = Color3.fromRGB(255, 0, 0)
    pointLight.Brightness = 3
    pointLight.Range = 200
    pointLight.Shadows = true
    pointLight.Parent = LocalPlayer.Character.HumanoidRootPart
end

local function fun()
    RunService.Stepped:Connect(function()
        local allPlayers = Players:GetPlayers()
        if #allPlayers < 2 then return end

        index += 1
        if index > #allPlayers then index = 1 end

        local target = allPlayers[index]
        if target == LocalPlayer then
            index += 1
            if index > #allPlayers then index = 1 end
            target = allPlayers[index]
        end

        if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local crazyVector = Vector3.new(
                math.random(1e14, 1e15),
                math.random(1e14, 1e15),
                math.random(1e14, 1e15)
            )

            local args = {
                [1] = target.Character.HumanoidRootPart,
                [2] = target.Character.HumanoidRootPart,
                [3] = crazyVector,
                [4] = target.Character.HumanoidRootPart.Position,
                [5] = LocalPlayer.Backpack:FindFirstChild("Assault") and LocalPlayer.Backpack.Assault.GunScript_Local:FindFirstChild("MuzzleEffect"),
                [6] = LocalPlayer.Backpack:FindFirstChild("Assault") and LocalPlayer.Backpack.Assault.GunScript_Local:FindFirstChild("HitEffect"),
                [7] = 0,
                [8] = 0,
                [9] = { [1] = false },
                [10] = {
                    [1] = 25,
                    [2] = Vector3.new(100, 100, 100),
                    [3] = BrickColor.new(29),
                    [4] = 0.25,
                    [5] = Enum.Material.SmoothPlastic,
                    [6] = 0.25
                },
                [11] = true,
                [12] = false
            }

            Remote:FireServer(unpack(args))
        end
    end)
end

task.delay(0.5, function()
    fireEyes()
    shakeCamera()
    blackFlames()
    rolar()
    colorRed()
    fun()
end)
end})

Tabs.TT:AddButton({
    Name = Translator:traduzir("Stop All"),
    Description = Translator:traduzir("Stop/Shinra Tensei/Haki do Rei/Expansão/Mangekyou"),
    Callback = function()
        ----------------------------
        -- Shinra Tensei
        ----------------------------
        fireLoopActiveServer = false
        ignoreTarget = nil
        -- remove explosões/esferas criadas
        for _, v in ipairs(workspace:GetChildren()) do
            if v:IsA("Part") and (v.Name == "ShinraSphere" or v.Name == "Explosao" or v.Name == "Part") and v.Material == Enum.Material.Neon then
                v:Destroy()
            end
        end

        ----------------------------
        -- Expansão de Domínio
        ----------------------------
        expansionActive = false
        cancelExpansion = true
        if expansionModel then
            expansionModel:Destroy()
            expansionModel = nil
        end
        if expansionSound then
            expansionSound:Stop()
            expansionSound:Destroy()
            expansionSound = nil
        end
        if Lighting:FindFirstChild("DomainSky") then
            Lighting.DomainSky:Destroy()
        end
        if originalSky and not Lighting:FindFirstChildOfClass("Sky") then
            originalSky.Parent = Lighting
        end

        ----------------------------
        -- Haki do Rei
        ----------------------------
        _G.HakiAtived = false
        _G.StopHaki = true
        if HakiSound then
            HakiSound:Stop()
            HakiSound:Destroy()
            HakiSound = nil
        end
        if StopModel then
            StopModel:Destroy()
            StopModel = nil
        end
        -- remove partículas aplicadas no corpo
        for _, part in ipairs(Player.Character:GetDescendants()) do
            if part:IsA("ParticleEmitter") and part.Texture == "rbxassetid://243098098" then
                part:Destroy()
            end
        end

        ----------------------------
        -- Mangekyou Sharingan
        ----------------------------
        local cam = workspace.CurrentCamera
        if cam:FindFirstChild("CameraShake") then
            cam.CameraShake:Destroy()
        end
        if Player.PlayerGui:FindFirstChild("RotatingImageGui") then
            Player.PlayerGui.RotatingImageGui:Destroy()
        end
        -- remove partículas (chamas pretas) dos players
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr.Character then
                for _, obj in ipairs(plr.Character:GetDescendants()) do
                    if obj:IsA("ParticleEmitter") and obj.Texture == "rbxassetid://243098098" then
                        obj:Destroy()
                    end
                    if obj:IsA("PointLight") and obj.Name == "StrongRedLight" then
                        obj:Destroy()
                    end
                end
            end
        end

        ----------------------------
        -- Sons gerais
        ----------------------------
        for _, s in ipairs(workspace:GetDescendants()) do
            if s:IsA("Sound") and (s.IsPlaying or s.Looped) then
                s:Stop()
                s:Destroy()
            end
        end

        warn("✅ Todas as habilidades e efeitos foram parados e removidos!")
    end
})

end
do
Tabs.TT:AddSection({Translator:traduzir("Bring Partes Update  [Beta]")})
local Players,RS,RunService,TweenService,Lighting,Workspace,TCS,UserInputService =
    game:GetService("Players"),
    game:GetService("ReplicatedStorage"),
    game:GetService("RunService"),
    game:GetService("TweenService"),
    game:GetService("Lighting"),
    game:GetService("Workspace"),
    game:GetService("TextChatService"),
    game:GetService("UserInputService")

local Player = Players.LocalPlayer
local Character,Humanoid,RootPart

local function updateCharacter()
    Character = Player.Character or Player.CharacterAdded:Wait()
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
end

updateCharacter()
Player.CharacterAdded:Connect(updateCharacter)

local blackHoleActive = false
local blackHoleModel = nil

local function toggleBlackHole(v)
    blackHoleActive = v
    if blackHoleActive then
        local sky = Instance.new("Sky")
        sky.SkyboxBk="rbxassetid://8139676647"
        sky.SkyboxDn="rbxassetid://8139676988"
        sky.SkyboxFt="rbxassetid://8139677111"
        sky.SkyboxLf="rbxassetid://8139677359"
        sky.SkyboxRt="rbxassetid://8139677253"
        sky.SkyboxUp="rbxassetid://8139676647"
        sky.Parent = Lighting

        blackHoleModel = Instance.new("Model", Workspace)
        blackHoleModel.Name = "GargantuaBlackHole"

        local singularity = Instance.new("Part", blackHoleModel)
        singularity.Shape = Enum.PartType.Ball
        singularity.Size = Vector3.new(80,80,80)
        singularity.Anchored = true
        singularity.CanCollide = false
        singularity.Material = Enum.Material.Neon
        singularity.Color = Color3.new(0,0,0)
        singularity.Transparency = 0.05

        local diskLayers = {}
        for i=1,7 do
            local disk = Instance.new("Part", blackHoleModel)
            disk.Shape = Enum.PartType.Cylinder
            disk.Size = Vector3.new(8,200+(i*50),200+(i*50))
            disk.Anchored = true
            disk.CanCollide = false
            disk.Material = Enum.Material.Neon
            disk.Color = Color3.fromHSV((i*30)%360/360*0.15,1,1)
            disk.Transparency = 0.3+(i*0.08)
            table.insert(diskLayers,disk)
            local light = Instance.new("PointLight",disk)
            light.Color = disk.Color
            light.Brightness = 8-i
            light.Range = 300+(i*50)
        end

        local centralLight = Instance.new("PointLight", singularity)
        centralLight.Color = Color3.fromRGB(255,100,0)
        centralLight.Brightness = 15
        centralLight.Range = 800

        local attachment = Instance.new("Attachment", singularity)

        local function applyForce(v)
            if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and v.Parent ~= blackHoleModel then
                for _,force in pairs(v:GetChildren()) do
                    if force:IsA("BodyAngularVelocity") or force:IsA("BodyForce") or force:IsA("BodyVelocity") or force:IsA("AlignPosition") or force:IsA("Torque") then
                        force:Destroy()
                    end
                end
                v.CanCollide = false
                local torque = Instance.new("Torque", v)
                local align = Instance.new("AlignPosition", v)
                local att2 = Instance.new("Attachment", v)
                torque.Torque = Vector3.new(15000000,15000000,15000000)
                torque.Attachment0 = att2
                align.MaxForce = math.huge
                align.MaxVelocity = math.huge
                align.Responsiveness = 400
                align.Attachment0 = att2
                align.Attachment1 = attachment

                task.spawn(function()
                    local startTime = tick()
                    local orbitRadius = math.random(40,120)
                    local orbitSpeed = math.sqrt(1000000/orbitRadius)
                    while align.Parent and blackHoleActive and blackHoleModel.Parent do
                        local elapsed = tick()-startTime
                        local angle = elapsed*orbitSpeed
                        local heightOsc = math.sin(elapsed)*orbitRadius*0.3
                        orbitRadius = math.max(30,orbitRadius-0.02)
                        local targetPos = singularity.Position+Vector3.new(math.cos(angle)*orbitRadius,heightOsc,math.sin(angle)*orbitRadius)
                        attachment.WorldCFrame = CFrame.new(targetPos)
                        RunService.RenderStepped:Wait()
                    end
                end)
            end
        end

        task.spawn(function()
            for i,v in pairs(Workspace:GetDescendants()) do
                applyForce(v)
                if i%15==0 then task.wait() end
            end
        end)

        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                task.wait(0.1)
                applyForce(v)
            end
        end)

        task.spawn(function()
            while blackHoleActive and blackHoleModel.Parent and Player.Character do
                local char = Player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    local targetPos = char.HumanoidRootPart.Position+Vector3.new(0,50,30)
                    singularity.Position = singularity.Position:lerp(targetPos,0.05)
                    for _,disk in pairs(diskLayers) do
                        disk.Position = singularity.Position
                    end
                end
                RunService.Heartbeat:Wait()
            end
        end)

        task.spawn(function()
            local rotationSpeed, pulseTime = 0,0
            while blackHoleActive and blackHoleModel.Parent do
                rotationSpeed += math.rad(1.5)
                pulseTime += 0.02
                for i,disk in pairs(diskLayers) do
                    if disk and disk.Parent then
                        local diskSpeed = rotationSpeed*(1+i*0.2)
                        disk.CFrame = CFrame.new(singularity.Position)*CFrame.Angles(0,0,diskSpeed)
                    end
                end
                if centralLight then
                    local lightPulse = math.sin(pulseTime*4)*0.3+1
                    centralLight.Brightness = 15*lightPulse
                end
                RunService.RenderStepped:Wait()
            end
        end)
    else
        if blackHoleModel then
            blackHoleModel:Destroy()
            blackHoleModel = nil
        end
    end
end

--[[local tornadoActive=false
local tornadoBoat=nil

local function toggleTornado(v)
    tornadoActive=v
    if tornadoActive then
        RootPart.CFrame=CFrame.new(1754,-2,58)
        task.wait(0.5)
        RS:WaitForChild("RE"):FindFirstChild("1Ca1r"):FireServer("PickingBoat","PirateFree")
        task.wait(1)

        tornadoBoat=Workspace.Vehicles:FindFirstChild(Player.Name.."Car")
        if tornadoBoat then
            local seat=tornadoBoat.Body.VehicleSeat
            repeat
                RootPart.CFrame=seat.CFrame*CFrame.new(0,2,0)
                task.wait()
            until Humanoid.Sit

            local flipRemote=RS.RE["1Player1sCa1r"]
            task.spawn(function()
                while tornadoActive and tornadoBoat.Parent do
                    if Humanoid.Sit then
                        flipRemote:FireServer("Flip")
                    end
                    task.wait(0.2)
                end
            end)

            local currentPos=Vector3.new(0,10,0)
            local speed=30
            local model=Instance.new("Model",Workspace)
            model.Name="InfiniteTornado"
            local layers={}

            for i=1,8 do
                local layer=Instance.new("Part",model)
                layer.Shape=Enum.PartType.Cylinder
                layer.Size=Vector3.new(60+(i*12),20+(i*8),20+(i*8))
                layer.Position=currentPos+Vector3.new(0,i*15,0)
                layer.Anchored=true
                layer.CanCollide=false
                layer.Material=Enum.Material.ForceField
                layer.Color=Color3.fromRGB(200-(i*20),200-(i*20),255)
                layer.Transparency=0.2+(i*0.08)
                table.insert(layers,layer)
            end

            local keys={W=false,A=false,S=false,D=false,LeftShift=false}

            UserInputService.InputBegan:Connect(function(input,processed)
                if not processed and tornadoActive then
                    if input.KeyCode==Enum.KeyCode.W then keys.W=true end
                    if input.KeyCode==Enum.KeyCode.A then keys.A=true end
                    if input.KeyCode==Enum.KeyCode.S then keys.S=true end
                    if input.KeyCode==Enum.KeyCode.D then keys.D=true end
                    if input.KeyCode==Enum.KeyCode.LeftShift then keys.LeftShift=true end
                end
            end)

            UserInputService.InputEnded:Connect(function(input,processed)
                if not processed and tornadoActive then
                    if input.KeyCode==Enum.KeyCode.W then keys.W=false end
                    if input.KeyCode==Enum.KeyCode.A then keys.A=false end
                    if input.KeyCode==Enum.KeyCode.S then keys.S=false end
                    if input.KeyCode==Enum.KeyCode.D then keys.D=false end
                    if input.KeyCode==Enum.KeyCode.LeftShift then keys.LeftShift=false end
                end
            end)

            task.spawn(function()
                local rotSpeed=0
                while tornadoActive do
                    if not Humanoid.Sit or not tornadoBoat or not tornadoBoat.Parent then
                        break
                    end

                    local camera=Workspace.CurrentCamera
                    local moveVector=Vector3.new(0,0,0)

                    if keys.W then moveVector=moveVector+camera.CFrame.LookVector end
                    if keys.S then moveVector=moveVector-camera.CFrame.LookVector end
                    if keys.A then moveVector=moveVector-camera.CFrame.RightVector end
                    if keys.D then moveVector=moveVector+camera.CFrame.RightVector end

                    local currentSpeed=keys.LeftShift and speed*2.5 or speed

                    if moveVector.Magnitude>0 then
                        currentPos=currentPos+(moveVector.Unit*currentSpeed*0.6)
                    end

                    currentPos=Vector3.new(math.clamp(currentPos.X,-2000,2000),math.clamp(currentPos.Y,10,200),math.clamp(currentPos.Z,-2000,2000))

                    if tornadoBoat and tornadoBoat.PrimaryPart then
                        tornadoBoat:SetPrimaryPartCFrame(CFrame.new(currentPos))
                    end

                    rotSpeed=rotSpeed+math.rad(1080*(keys.LeftShift and 2 or 1))*0.016

                    for i,layer in pairs(layers)do
                        if layer and layer.Parent then
                            local layerPos=currentPos+Vector3.new(math.sin(rotSpeed+i*0.5)*(i*2),i*15,math.cos(rotSpeed+i*0.5)*(i*2))
                            layer.CFrame=CFrame.new(layerPos)*CFrame.Angles(0,rotSpeed*(i*0.4),0)
                        end
                    end
                    RunService.Heartbeat:Wait()
                end

                if model then
                    model:Destroy()
                end
            end)
        end
    else
        if tornadoBoat then
            tornadoBoat=nil
        end
    end
end]]

local ToggleBlackHole = Tabs.TT:AddToggle({
    Name = "Gargantua Black Hole",
    Description = "Núcleo blackHole Hacking!!!",
    Default = false
})
ToggleBlackHole:Callback(function(Value)
    toggleBlackHole(Value)
end)

--[[local ToggleTornado = Tabs.TT:AddToggle({
    Name = "Infinite Tornado",
    Description = "Ativar/Desativar Tornado",
    Default = false
})
ToggleTornado:Callback(function(Value)
    toggleTornado(Value)
end)]]

local Button = Tabs.TT:AddButton({Translator:traduzir("Puxa Partes Gui"), function()
  local Gui = Instance.new("ScreenGui") 
local Main = Instance.new("Frame") 
local MainCorner = Instance.new("UICorner")
local MainStroke = Instance.new("UIStroke")
local Dropdown = Instance.new("TextButton") 
local DropdownCorner = Instance.new("UICorner")
local DropdownStroke = Instance.new("UIStroke")
local DropdownIcon = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint") 
local DropdownFrame = Instance.new("ScrollingFrame")
local DropdownFrameCorner = Instance.new("UICorner")
local DropdownFrameStroke = Instance.new("UIStroke")
local DropdownList = Instance.new("UIListLayout")
local Label = Instance.new("TextLabel") 
local LabelCorner = Instance.new("UICorner")
local LabelStroke = Instance.new("UIStroke")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint") 
local Button = Instance.new("TextButton") 
local ButtonCorner = Instance.new("UICorner")
local ButtonStroke = Instance.new("UIStroke")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint") 
 
Gui.Name = "Gui" 
Gui.Parent = gethui() 
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
 
Main.Name = "Main" 
Main.Parent = Gui 
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 55) 
Main.BorderSizePixel = 0 
Main.Position = UDim2.new(0.335954279, 0, 0.542361975, 0) 
Main.Size = UDim2.new(0.240350261, 0, 0.200000000, 0) 
Main.Active = true 
Main.Draggable = true 

MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

MainStroke.Color = Color3.fromRGB(85, 170, 255)
MainStroke.Thickness = 2
MainStroke.Parent = Main
 
Dropdown.Name = "Dropdown" 
Dropdown.Parent = Main 
Dropdown.BackgroundColor3 = Color3.fromRGB(65, 65, 75) 
Dropdown.BorderSizePixel = 0 
Dropdown.Position = UDim2.new(0.08, 0, 0.25, 0) 
Dropdown.Size = UDim2.new(0.84, 0, 0.25, 0) 
Dropdown.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal) 
Dropdown.Text = "Selecionar Jogador" 
Dropdown.TextColor3 = Color3.fromRGB(220, 220, 220) 
Dropdown.TextScaled = true 
Dropdown.TextSize = 18
Dropdown.TextWrapped = true
Dropdown.TextXAlignment = Enum.TextXAlignment.Left

DropdownCorner.CornerRadius = UDim.new(0, 8)
DropdownCorner.Parent = Dropdown

DropdownStroke.Color = Color3.fromRGB(100, 100, 120)
DropdownStroke.Thickness = 1
DropdownStroke.Parent = Dropdown

DropdownIcon.Name = "DropdownIcon"
DropdownIcon.Parent = Dropdown
DropdownIcon.BackgroundTransparency = 1
DropdownIcon.Position = UDim2.new(0.85, 0, 0, 0)
DropdownIcon.Size = UDim2.new(0.15, 0, 1, 0)
DropdownIcon.Font = Enum.Font.Nunito
DropdownIcon.Text = "▼"
DropdownIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
DropdownIcon.TextScaled = true
DropdownIcon.TextSize = 14

local DropdownPadding = Instance.new("UIPadding")
DropdownPadding.PaddingLeft = UDim.new(0, 10)
DropdownPadding.Parent = Dropdown
 
UITextSizeConstraint.Parent = Dropdown 
UITextSizeConstraint.MaxTextSize = 18

DropdownFrame.Name = "DropdownFrame"
DropdownFrame.Parent = Main
DropdownFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
DropdownFrame.BorderSizePixel = 0
DropdownFrame.Position = UDim2.new(0.08, 0, 0.51, 0)
DropdownFrame.Size = UDim2.new(0.84, 0, 0, 0)
DropdownFrame.Visible = false
DropdownFrame.ScrollBarThickness = 6
DropdownFrame.ScrollBarImageColor3 = Color3.fromRGB(85, 170, 255)

DropdownFrameCorner.CornerRadius = UDim.new(0, 8)
DropdownFrameCorner.Parent = DropdownFrame

DropdownFrameStroke.Color = Color3.fromRGB(100, 100, 120)
DropdownFrameStroke.Thickness = 1
DropdownFrameStroke.Parent = DropdownFrame

DropdownList.Parent = DropdownFrame
DropdownList.SortOrder = Enum.SortOrder.LayoutOrder
DropdownList.Padding = UDim.new(0, 2)
 
Label.Name = "Label" 
Label.Parent = Main 
Label.BackgroundColor3 = Color3.fromRGB(85, 170, 255) 
Label.BorderSizePixel = 0 
Label.Size = UDim2.new(1, 0, 0.18, 0) 
Label.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal) 
Label.Text = "Bring Parts" 
Label.TextColor3 = Color3.fromRGB(255, 255, 255) 
Label.TextScaled = true 
Label.TextSize = 16
Label.TextWrapped = true 

LabelCorner.CornerRadius = UDim.new(0, 12)
LabelCorner.Parent = Label

LabelStroke.Color = Color3.fromRGB(65, 140, 215)
LabelStroke.Thickness = 1
LabelStroke.Parent = Label
 
UITextSizeConstraint_2.Parent = Label 
UITextSizeConstraint_2.MaxTextSize = 16
 
Button.Name = "Button" 
Button.Parent = Main 
Button.BackgroundColor3 = Color3.fromRGB(65, 65, 75) 
Button.BorderSizePixel = 0 
Button.Position = UDim2.new(0.15, 0, 0.72, 0) 
Button.Size = UDim2.new(0.7, 0, 0.22, 0) 
Button.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal) 
Button.Text = "Bring | Off" 
Button.TextColor3 = Color3.fromRGB(220, 220, 220) 
Button.TextScaled = true 
Button.TextSize = 20
Button.TextWrapped = true 

ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = Button

ButtonStroke.Color = Color3.fromRGB(100, 100, 120)
ButtonStroke.Thickness = 1
ButtonStroke.Parent = Button
 
UITextSizeConstraint_3.Parent = Button 
UITextSizeConstraint_3.MaxTextSize = 20
 
 
local Players = game:GetService("Players") 
local RunService = game:GetService("RunService") 
local LocalPlayer = Players.LocalPlayer 
local UserInputService = game:GetService("UserInputService") 
local Workspace = game:GetService("Workspace") 
local TweenService = game:GetService("TweenService")
 
local character 
local humanoidRootPart 
local selectedPlayer = nil
local dropdownOpen = false
local playerButtons = {}

local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local function createPlayerButton(player)
    local playerButton = Instance.new("TextButton")
    local playerButtonCorner = Instance.new("UICorner")
    local playerButtonPadding = Instance.new("UIPadding")
    
    playerButton.Name = player.Name
    playerButton.Parent = DropdownFrame
    playerButton.BackgroundColor3 = Color3.fromRGB(65, 65, 75)
    playerButton.BorderSizePixel = 0
    playerButton.Size = UDim2.new(1, -10, 0, 35)
    playerButton.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal)
    playerButton.Text = player.DisplayName .. " (@" .. player.Name .. ")"
    playerButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    playerButton.TextSize = 14
    playerButton.TextXAlignment = Enum.TextXAlignment.Left
    
    playerButtonCorner.CornerRadius = UDim.new(0, 6)
    playerButtonCorner.Parent = playerButton
    
    playerButtonPadding.PaddingLeft = UDim.new(0, 10)
    playerButtonPadding.Parent = playerButton
    playerButton.MouseEnter:Connect(function()
        local hoverTween = TweenService:Create(playerButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(85, 170, 255)})
        hoverTween:Play()
    end)
    
    playerButton.MouseLeave:Connect(function()
        local leaveTween = TweenService:Create(playerButton, tweenInfo, {BackgroundColor3 = Color3.fromRGB(65, 65, 75)})
        leaveTween:Play()
    end)
    
    playerButton.MouseButton1Click:Connect(function()
        selectedPlayer = player
        Dropdown.Text = player.DisplayName .. " (@" .. player.Name .. ")"
        
        dropdownOpen = false
        DropdownIcon.Text = "▼"
        local closeTween = TweenService:Create(DropdownFrame, tweenInfo, {Size = UDim2.new(0.84, 0, 0, 0)})
        closeTween:Play()
        closeTween.Completed:Wait()
        DropdownFrame.Visible = false
    end)
    
    return playerButton
end

local function updatePlayerList()
    for _, button in pairs(playerButtons) do
        button:Destroy()
    end
    playerButtons = {}
    local players = Players:GetPlayers()
    for _, player in pairs(players) do
        if player ~= LocalPlayer then
            local button = createPlayerButton(player)
            table.insert(playerButtons, button)
        end
    end
    local totalHeight = math.min(#playerButtons * 37 + 10, 200)
    DropdownFrame.CanvasSize = UDim2.new(0, 0, 0, #playerButtons * 37 + 10)
end

Players.PlayerAdded:Connect(updatePlayerList)
Players.PlayerRemoving:Connect(updatePlayerList)

updatePlayerList()
Dropdown.MouseButton1Click:Connect(function()
    dropdownOpen = not dropdownOpen
    
    if dropdownOpen then
        updatePlayerList()
        DropdownFrame.Visible = true
        DropdownIcon.Text = "▲"
        local openTween = TweenService:Create(DropdownFrame, tweenInfo, {Size = UDim2.new(0.84, 0, 0, math.min(#playerButtons * 37 + 10, 200))})
        openTween:Play()
    else
        DropdownIcon.Text = "▼"
        local closeTween = TweenService:Create(DropdownFrame, tweenInfo, {Size = UDim2.new(0.84, 0, 0, 0)})
        closeTween:Play()
        closeTween.Completed:Wait()
        DropdownFrame.Visible = false
    end
end)

mainStatus = true 
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent) 
    if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessedEvent then 
        mainStatus = not mainStatus 
        if mainStatus then
            Main.Visible = true
            local showTween = TweenService:Create(Main, tweenInfo, {BackgroundTransparency = 0})
            showTween:Play()
        else
            local hideTween = TweenService:Create(Main, tweenInfo, {BackgroundTransparency = 1})
            hideTween:Play()
            hideTween.Completed:Wait()
            Main.Visible = false
        end
    end 
end) 
 
local Folder = Instance.new("Folder", Workspace) 
local Part = Instance.new("Part", Folder) 
local Attachment1 = Instance.new("Attachment", Part) 
Part.Anchored = true 
Part.CanCollide = false 
Part.Transparency = 1 
 
if not getgenv().Network then 
    getgenv().Network = { 
        BaseParts = {}, 
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424) 
    } 
 
    Network.RetainPart = function(Part) 
        if Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then 
            table.insert(Network.BaseParts, Part) 
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0) 
            Part.CanCollide = false 
        end 
    end 
 
    local function EnablePartControl() 
        LocalPlayer.ReplicationFocus = Workspace 
        RunService.Heartbeat:Connect(function() 
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge) 
            for _, Part in pairs(Network.BaseParts) do 
                if Part:IsDescendantOf(Workspace) then 
                    Part.Velocity = Network.Velocity 
                end 
            end 
        end) 
    end 
 
    EnablePartControl() 
end 
 
local function ForcePart(v) 
    if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then 
        for _, x in ipairs(v:GetChildren()) do 
            if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then 
                x:Destroy() 
            end 
        end 
        if v:FindFirstChild("Attachment") then 
            v:FindFirstChild("Attachment"):Destroy() 
        end 
        if v:FindFirstChild("AlignPosition") then 
            v:FindFirstChild("AlignPosition"):Destroy() 
        end 
        if v:FindFirstChild("Torque") then 
            v:FindFirstChild("Torque"):Destroy() 
        end 
        v.CanCollide = false 
        local Torque = Instance.new("Torque", v) 
        Torque.Torque = Vector3.new(100000, 100000, 100000) 
        local AlignPosition = Instance.new("AlignPosition", v) 
        local Attachment2 = Instance.new("Attachment", v) 
        Torque.Attachment0 = Attachment2 
        AlignPosition.MaxForce = math.huge 
        AlignPosition.MaxVelocity = math.huge 
        AlignPosition.Responsiveness = 200 
        AlignPosition.Attachment0 = Attachment2 
        AlignPosition.Attachment1 = Attachment1 
    end 
end 
 
local blackHoleActive = false 
local DescendantAddedConnection 
 
local function toggleBlackHole() 
    blackHoleActive = not blackHoleActive 
    if blackHoleActive then 
        Button.Text = "Bring Parts | On"
        Button.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
        ButtonStroke.Color = Color3.fromRGB(65, 140, 215)
        
        for _, v in ipairs(Workspace:GetDescendants()) do 
            ForcePart(v) 
        end 
 
        DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v) 
            if blackHoleActive then 
                ForcePart(v) 
            end 
        end) 
 
        spawn(function() 
            while blackHoleActive and RunService.RenderStepped:Wait() do 
                Attachment1.WorldCFrame = humanoidRootPart.CFrame 
            end 
        end) 
    else 
        Button.Text = "Bring Parts | Off"
        Button.BackgroundColor3 = Color3.fromRGB(65, 65, 75)
        ButtonStroke.Color = Color3.fromRGB(100, 100, 120)
        
        if DescendantAddedConnection then 
            DescendantAddedConnection:Disconnect() 
        end 
    end 
end 

Button.MouseButton1Click:Connect(function() 
    if selectedPlayer then 
        character = selectedPlayer.Character or selectedPlayer.CharacterAdded:Wait() 
        humanoidRootPart = character:WaitForChild("HumanoidRootPart") 
        toggleBlackHole() 
    else 
        local errorTween = TweenService:Create(Dropdown, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(255, 80, 80)})
        errorTween:Play()
        errorTween.Completed:Wait()
        local resetTween = TweenService:Create(Dropdown, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundColor3 = Color3.fromRGB(65, 65, 75)})
        resetTween:Play()
    end 
end)

Button.MouseEnter:Connect(function()
    if not blackHoleActive then
        local hoverTween = TweenService:Create(Button, tweenInfo, {BackgroundColor3 = Color3.fromRGB(75, 75, 85)})
        hoverTween:Play()
    end
end)

Button.MouseLeave:Connect(function()
    if not blackHoleActive then
        local leaveTween = TweenService:Create(Button, tweenInfo, {BackgroundColor3 = Color3.fromRGB(65, 65, 75)})
        leaveTween:Play()
    end
end)

Dropdown.MouseEnter:Connect(function()
    local hoverTween = TweenService:Create(Dropdown, tweenInfo, {BackgroundColor3 = Color3.fromRGB(75, 75, 85)})
    hoverTween:Play()
end)

Dropdown.MouseLeave:Connect(function()
    local leaveTween = TweenService:Create(Dropdown, tweenInfo, {BackgroundColor3 = Color3.fromRGB(65, 65, 75)})
    leaveTween:Play()
end)
end})
end


do
local selectedPlayerName = nil
local methodKill = nil
getgenv().Target = nil
local Character = LocalPlayer.Character
local Humanoid = Character and Character:WaitForChild("Humanoid")
local RootPart = Character and Character:WaitForChild("HumanoidRootPart")

local function cleanupCouch()
    local char = LocalPlayer.Character
    if char then
        local couch = char:FindFirstChild("Drip.Couch") or LocalPlayer.Backpack:FindFirstChild("Drip.Couch")
        if couch then
            couch:Destroy()
        end
    end
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
end

LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = newCharacter:WaitForChild("Humanoid")
    RootPart = newCharacter:WaitForChild("HumanoidRootPart")
    cleanupCouch()
    
    Humanoid.Died:Connect(function()
        cleanupCouch()
    end)
end)

if Humanoid then
    Humanoid.Died:Connect(function()
        cleanupCouch()
    end)
end

local function KillPlayerCouch()
    if not selectedPlayerName then
        return
    end
    local target = Players:FindFirstChild(selectedPlayerName)
    if not target or not target.Character then
        return
    end

    local char = LocalPlayer.Character
    if not char then
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root or not tRoot then
        return
    end

    local originalPos = root.Position 
    local sitPos = Vector3.new(145.51, -350.09, 21.58)

    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)

    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
    if tool then tool.Parent = char end
    task.wait(0.1)

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)

    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    hum.PlatformStand = false
    local cam = workspace.CurrentCamera
    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

    local align = Instance.new("BodyPosition")
    align.Name = "BringPosition"
    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    align.D = 10
    align.P = 30000
    align.Position = root.Position
    align.Parent = tRoot

    task.spawn(function()
        local angle = 0
        local startTime = tick()
        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            if not tHum or tHum.Sit then break end

            local hrp = target.Character.HumanoidRootPart
            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)

            angle += 50
            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
            align.Position = root.Position + Vector3.new(2, 0, 0)

            task.wait()
        end

        align:Destroy()
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        hum.PlatformStand = false
        cam.CameraSubject = hum

        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.Velocity = Vector3.zero
                p.RotVelocity = Vector3.zero
            end
        end

        task.wait(0.1)
        root.CFrame = CFrame.new(sitPos)
        task.wait(0.3)

        local tool = char:FindFirstChild("Couch")
        if tool then tool.Parent = LocalPlayer.Backpack end

        task.wait(0.01)
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.2)
        root.CFrame = CFrame.new(originalPos)
    end)
end

local function BringPlayerLLL()
    if not selectedPlayerName then
        return
    end
    local target = Players:FindFirstChild(selectedPlayerName)
    if not target or not target.Character then
        return
    end

    local char = LocalPlayer.Character
    if not char then
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root or not tRoot then
        return
    end

    local originalPos = root.Position 
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)

    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
    if tool then
        tool.Parent = char
    end
    task.wait(0.1)

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)

    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    hum.PlatformStand = false
    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

    local align = Instance.new("BodyPosition")
    align.Name = "BringPosition"
    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    align.D = 10
    align.P = 30000
    align.Position = root.Position
    align.Parent = tRoot

    task.spawn(function()
        local angle = 0
        local startTime = tick()
        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            if not tHum or tHum.Sit then break end

            local hrp = target.Character.HumanoidRootPart
            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)

            angle += 50
            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
            align.Position = root.Position + Vector3.new(2, 0, 0)

            task.wait()
        end

        align:Destroy()
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        hum.PlatformStand = false
        cam.CameraSubject = hum

        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.Velocity = Vector3.zero
                p.RotVelocity = Vector3.zero
            end
        end

        task.wait(0.1)
        root.Anchored = true
        root.CFrame = CFrame.new(originalPos)
        task.wait(0.001)
        root.Anchored = false

        task.wait(0.7)
        local tool = char:FindFirstChild("Couch")
        if tool then
            tool.Parent = LocalPlayer.Backpack
        end

        task.wait(0.001)
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    end)
end

local function BringWithCouch()
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer then
        return
    end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local args = { [1] = "ClearAllTools" }
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
    local args = { [1] = "PickingTools", [2] = "Couch" }
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
    if not couch then
        warn("Erro: Sofá não encontrado no Backpack")
        return
    end

    couch.Name = "Drip.Couch"
    local seat1 = couch:FindFirstChild("Seat1")
    local seat2 = couch:FindFirstChild("Seat2")
    local handle = couch:FindFirstChild("Handle")
    if seat1 and seat2 and handle then
        seat1.Disabled = true
        seat2.Disabled = true
        handle.Name = "Handle "
    else
        return
    end
    couch.Parent = LocalPlayer.Character

    local tet = Instance.new("BodyVelocity", seat1)
    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tet.P = 1250
    tet.Velocity = Vector3.new(0, 0, 0)
    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

    repeat
        for m = 1, 35 do
            local pos = { x = 0, y = 0, z = 0 }
            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
            if not tRoot then break end
            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)
            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)
            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)
            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)
            task.wait()
        end
        tet:Destroy()
        couch.Parent = LocalPlayer.Backpack
        task.wait()
        couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        task.wait()
        couch.Parent = LocalPlayer.Backpack
        couch.Handle.Name = "Handle "
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        tet = Instance.new("BodyVelocity", seat1)
        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        tet.P = 1250
        tet.Velocity = Vector3.new(0, 0, 0)
        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true
    task.wait()
    tet:Destroy()
    couch.Parent = LocalPlayer.Backpack
    task.wait()
    couch:FindFirstChild("Handle ").Name = "Handle"
    task.wait(0.3)
    couch.Parent = LocalPlayer.Character
    task.wait(0.3)
    couch.Grip = CFrame.new(Vector3.new(0, 0, 0))
    task.wait(0.3)
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
end

local function KillWithCouch()
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer then
        warn("Erro: Nenhum jogador alvo selecionado")
        return
    end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        warn("Erro: Jogador alvo sem personagem ou HumanoidRootPart")
        return
    end

    local args = { [1] = "ClearAllTools" }
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
    local args = { [1] = "PickingTools", [2] = "Couch" }
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
    if not couch then
        warn("Erro: Sofá não encontrado no Backpack")
        return
    end

    couch.Name = "Drip.Couch"
    local seat1 = couch:FindFirstChild("Seat1")
    local seat2 = couch:FindFirstChild("Seat2")
    local handle = couch:FindFirstChild("Handle")
    if seat1 and seat2 and handle then
        seat1.Disabled = true
        seat2.Disabled = true
        handle.Name = "Handle "
    else
        warn("Erro: Componentes do sofá não encontrados")
        return
    end
    couch.Parent = LocalPlayer.Character

    local tet = Instance.new("BodyVelocity", seat1)
    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tet.P = 1250
    tet.Velocity = Vector3.new(0, 0, 0)
    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

    repeat
        for m = 1, 35 do
            local pos = { x = 0, y = 0, z = 0 }
            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
            if not tRoot then break end
            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)
            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)
            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)
            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)
            task.wait()
        end
        tet:Destroy()
        couch.Parent = LocalPlayer.Backpack
        task.wait()
        couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        task.wait()
        couch.Parent = LocalPlayer.Backpack
        couch.Handle.Name = "Handle "
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        tet = Instance.new("BodyVelocity", seat1)
        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        tet.P = 1250
        tet.Velocity = Vector3.new(0, 0, 0)
        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true
    task.wait()
    couch.Parent = LocalPlayer.Backpack
    seat1.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
    seat2.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
    couch.Parent = LocalPlayer.Character
    task.wait(0.1)
    couch.Parent = LocalPlayer.Backpack
    task.wait(2)
    local bv = seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")
    if bv then bv:Destroy() end
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
end
local function playerCorrupt()
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer then
        warn("erro")
        return
    end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        warn("Erro")
        return
    end

    local args = { [1] = "ClearAllTools" }
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
    local args = { [1] = "PickingTools", [2] = "Couch" }
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
    if not couch then
        warn("Erro: Sofá não encontrado no Backpack")
        return
    end

    couch.Name = "Drip.Couch"
    local seat1 = couch:FindFirstChild("Seat1")
    local seat2 = couch:FindFirstChild("Seat2")
    local handle = couch:FindFirstChild("Handle")
    if seat1 and seat2 and handle then
        seat1.Disabled = true
        seat2.Disabled = true
        handle.Name = "Handle "
    else
        warn("Erro: Componentes do sofá não encontrados")
        return
    end
    couch.Parent = LocalPlayer.Character

    local tet = Instance.new("BodyVelocity", seat1)
    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tet.P = 1250
    tet.Velocity = Vector3.new(0, 0, 0)
    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

    repeat
        for m = 1, 35 do
            local pos = { x = 0, y = 0, z = 0 }
            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
            if not tRoot then break end
            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)
            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)
            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)
            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)
            task.wait()
        end
        tet:Destroy()
        couch.Parent = LocalPlayer.Backpack
        task.wait()
        couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        task.wait()
        couch.Parent = LocalPlayer.Backpack
        couch.Handle.Name = "Handle "
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        tet = Instance.new("BodyVelocity", seat1)
        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        tet.P = 1250
        tet.Velocity = Vector3.new(0, 0, 0)
        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true
    task.wait()
    couch.Parent = LocalPlayer.Backpack
    seat1.CFrame = CFrame.new(Vector3.new(0/0, 0/0, 0/0))
    seat2.CFrame.new(Vector3.new(0/0, 0/0, 0/0))
    couch.Parent = LocalPlayer.Character
    task.wait(0.1)
    couch.Parent = LocalPlayer.Backpack
    task.wait(2)
    local bv = seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")
    if bv then bv:Destroy() end
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
end


local function jailcouch()
    if not selectedPlayerName then
        return
    end
    local target = Players:FindFirstChild(selectedPlayerName)
    if not target or not target.Character then
        return
    end

    local char = LocalPlayer.Character
    if not char then
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root or not tRoot then
        return
    end

    local originalPos = root.Position 
    local sitPos = Vector3.new(666.609130859375, 8.813562393188477, 477.7061462402344)

    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)

    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
    if tool then tool.Parent = char end
    task.wait(0.1)

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)

    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    hum.PlatformStand = false
    local cam = workspace.CurrentCamera
    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

    local align = Instance.new("BodyPosition")
    align.Name = "BringPosition"
    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    align.D = 10
    align.P = 30000
    align.Position = root.Position
    align.Parent = tRoot

    task.spawn(function()
        local angle = 0
        local startTime = tick()
        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            if not tHum or tHum.Sit then break end

            local hrp = target.Character.HumanoidRootPart
            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)

            angle += 50
            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
            align.Position = root.Position + Vector3.new(2, 0, 0)

            task.wait()
        end

        align:Destroy()
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        hum.PlatformStand = false
        cam.CameraSubject = hum

        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.Velocity = Vector3.zero
                p.RotVelocity = Vector3.zero
            end
        end

        task.wait(0.1)
        root.CFrame = CFrame.new(sitPos)
        task.wait(0.3)

        local tool = char:FindFirstChild("Couch")
        if tool then tool.Parent = LocalPlayer.Backpack end

        task.wait(0.01)
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.2)
        root.CFrame = CFrame.new(originalPos)
    end)
end


    local PlayerSection = Tabs.TT:AddSection({ Name = "Trolar Jogadores <News Functions>" })

    local killDropdown = Tabs.TT:AddDropdown({
        Name = Translator:traduzir("Selecione um jogador"),
        Options = novaTabela,
        Default = "Players",
        Callback = function(value)
            selectedPlayerName = value
            getgenv().Target = value
        end
    })
    Tabs.TT:AddDropdown({
        Name = Translator:traduzir("Escolhar um Método <KILL>"),
        Options = {"Bus", "Couch", "Couch de longe", "jail"},
        Default = "Formas",
        Callback = function(value)
            methodKill = value
        end
    })
Tabs.TT:AddToggle({
        Name = Translator:traduzir("Visualizar Jogador"),
        Default = false,
        Callback = function(value)
            local Camera = workspace.CurrentCamera

            local function UpdateCamera()
                if value then
                    local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                    if targetPlayer and targetPlayer.Character then
                        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            Camera.CameraSubject = humanoid
                        end
                    end
                else
                    if LocalPlayer.Character then
                        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            Camera.CameraSubject = humanoid
                        end
                    end
                end
            end

            if value then
                if not getgenv().CameraConnection then
                    getgenv().CameraConnection = RunService.Heartbeat:Connect(UpdateCamera)
                end
            else
                if getgenv().CameraConnection then
                    getgenv().CameraConnection:Disconnect()
                    getgenv().CameraConnection = nil
                end
                UpdateCamera()
            end
        end
    })

    Tabs.TT:AddButton({
        Name = Translator:traduzir("Atualizar lista"),
        Callback = function()
            local lista = {}
for _, v in pairs(Players:GetPlayers()) do
if v ~= LocalPlayer then
table.insert(lista, v.Name)
end
end
killDropdown:Set(lista)
        end
    })

local MethodSection = Tabs.TT:AddSection({Name = Translator:traduzir("Formas De matar <Variados>")})

Tabs.TT:AddSlider({
    Name = Translator:traduzir("Estabilizador de Tp"),
    Min = 5,
    Max = 175,
    Increase = 1,
    Default = 160,
    Callback = function()
        print([[Metodos work]])
    end
})

Tabs.TT:AddButton({
        Name = Translator:traduzir("Desligar Jogador <Selecionado>"),
        Callback = function()
         playerCorrupt()
   end
})
    Tabs.TT:AddButton({
        Name = Translator:traduzir("Puxar Player <Selecionado>"),
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                return
            end
            if methodKill == "Couch" then
                BringPlayerLLL()
            elseif methodKill == "Couch de longe" then
                BringWithCouch()
            else
                
                local character = LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    warn("Erro: HumanoidRootPart do jogador local não encontrado")
                    return
                end

                local originalPosition = humanoidRootPart.CFrame

                local function GetBus()
                    local vehicles = game.Workspace:FindFirstChild("Vehicles")
                    if vehicles then
                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                    end
                    return nil
                end

                local bus = GetBus()

                if not bus then
                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                    end
                    task.wait(1)
                    bus = GetBus()
                end

                if bus then
                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                        repeat
                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                            task.wait()
                        until character.Humanoid.Sit or not bus.Parent
                    end
                end

                local function TrackPlayer()
                    while true do
                        if selectedPlayerName then
                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                                if targetHumanoid and targetHumanoid.Sit then
                                    if character.Humanoid then
                                        bus:SetPrimaryPartCFrame(originalPosition)
                                        task.wait(0.7)
                                        local args = { [1] = "DeleteAllVehicles" }
                                        ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
                                    end
                                    break
                                else
                                    local targetRoot = targetPlayer.Character.HumanoidRootPart
                                    local time = tick() * 35
                                    local lateralOffset = math.sin(time) * 4
                                    local frontBackOffset = math.cos(time) * 20
                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))
                                end
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end

                spawn(TrackPlayer)
            end
        end
    })

    Tabs.TT:AddButton({
        Name = Translator:traduzir("Matar Player <Selecionado>"),
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                return
            end
            if methodKill == "Couch" then
                KillPlayerCouch()
            elseif methodKill == "Couch Sem ir até o alvo [BETA]" then
                KillWithCouch()
            else
                
                local character = LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    warn("Erro: HumanoidRootPart do jogador local não encontrado")
                    return
                end

                local originalPosition = humanoidRootPart.CFrame

                local function GetBus()
                    local vehicles = game.Workspace:FindFirstChild("Vehicles")
                    if vehicles then
                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                    end
                    return nil
                end

                local bus = GetBus()

                if not bus then
                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                    end
                    task.wait(1)
                    bus = GetBus()
                end

                if bus then
                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                        repeat
                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                            task.wait()
                        until character.Humanoid.Sit or not bus.Parent
                        if character.Humanoid.Sit or not bus.Parent then
                            for k, v in pairs(bus.Body:GetChildren()) do
                                if v:IsA("Seat") then
                                    v.CanTouch = false
                                end
                            end
                        end
                    end
                end

                local function TrackPlayer()
                    while true do
                        if selectedPlayerName then
                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                                if targetHumanoid and targetHumanoid.Sit then
                                    if character.Humanoid then
                                        bus:SetPrimaryPartCFrame(CFrame.new(Vector3.new(9999, -450, 9999)))
                                        print("Jogador sentou, levando ônibus para o void!")
                                        task.wait(0.2)

                                        local function simulateJump()
                                            local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
                                            if humanoid then
                                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                            end
                                        end

                                        simulateJump()
                                        print("Simulando pulo!")
                                        task.wait(0.5)
                                        humanoidRootPart.CFrame = originalPosition
                                        print("Player voltou para a posição inicial.")
                                    end
                                    break
                                else
                                    local targetRoot = targetPlayer.Character.HumanoidRootPart
                                    local time = tick() * 35
                                    local lateralOffset = math.sin(time) * 4
                                    local frontBackOffset = math.cos(time) * 20
                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))
                                end
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end

                spawn(TrackPlayer)
            end
        end
    })

Tabs.TT:AddButton({
    Name = Translator:traduzir("Barco Matar no <Fling>"),
    Callback = function()
        if not selectedPlayerName or not game.Players:FindFirstChild(selectedPlayerName) then
            warn("Nenhum jogador selecionado ou não existe")
            return
        end

        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")

        if not Humanoid or not RootPart then
            warn("Humanoid ou RootPart inválido")
            return
        end

        local function spawnBoat()
            RootPart.CFrame = CFrame.new(1754, -2, 58)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            task.wait(1)
            return Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local PCar = Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
        if not PCar then
            warn("Falha ao spawnar o barco")
            return
        end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat then
            warn("Assento não encontrado")
            return
        end
        repeat 
            task.wait(0.1)
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
        until Humanoid.SeatPart == Seat
        local TargetPlayer = game.Players:FindFirstChild(selectedPlayerName)
        if not TargetPlayer or not TargetPlayer.Character then
            warn("Jogador não encontrado")
            return
        end

        local TargetC = TargetPlayer.Character
        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")

        if not TargetRP or not TargetH then
            warn("Humanoid ou RootPart do alvo não encontrado")
            return
        end
        local Spin = Instance.new("BodyAngularVelocity")
        Spin.Name = "Spinning"
        Spin.Parent = PCar.PrimaryPart
        Spin.MaxTorque = Vector3.new(0, math.huge, 0)
        Spin.AngularVelocity = Vector3.new(0, 369, 0) 
        local function moveCar(TargetRP, offset)
            if PCar and PCar.PrimaryPart then
                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + offset))
            end
        end

        task.spawn(function()
            while PCar and PCar.Parent and TargetRP and TargetRP.Parent do
                task.wait(0.01) 
                
                moveCar(TargetRP, Vector3.new(0, 1, 0))  
                moveCar(TargetRP, Vector3.new(0, -2.25, 5))  
                moveCar(TargetRP, Vector3.new(0, 2.25, 0.25))  
                moveCar(TargetRP, Vector3.new(-2.25, -1.5, 2.25))  
                moveCar(TargetRP, Vector3.new(0, 1.5, 0))  
                moveCar(TargetRP, Vector3.new(0, -1.5, 0))  
                if PCar and PCar.PrimaryPart then
                    local Rotation = CFrame.Angles(
                        math.rad(math.random(-369, 369)),  
                        math.rad(math.random(-369, 369)), 
                        math.rad(math.random(-369, 369))
                    )
                    PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + Vector3.new(0, 1.5, 0)) * Rotation)
                end
            end
            if Spin and Spin.Parent then
                Spin:Destroy()
            end
        end)
    end
})
local function FlingBall(target)
    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")
    local backpack = player:WaitForChild("Backpack")
    local ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

    local function GetBall()
        if not backpack:FindFirstChild("SoccerBall") then
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
        end
        repeat task.wait() until backpack:FindFirstChild("SoccerBall")
        backpack.SoccerBall.Parent = character
        repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)
        character.SoccerBall.Parent = backpack
        return ServerBalls:FindFirstChild("Soccer" .. player.Name)
    end

    local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
    Ball.CanCollide = false
    Ball.Massless = true
    Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

    if target ~= player then
        local tchar = target.Character
        if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then
            local troot = tchar.HumanoidRootPart
            local thum = tchar.Humanoid

            if Ball:FindFirstChildWhichIsA("BodyVelocity") then
                Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
            end

            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlingPower"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.P = 9e900
            bv.Parent = Ball

            workspace.CurrentCamera.CameraSubject = thum
            local StartTime = os.time()
            repeat
                if troot.Velocity.Magnitude > 0 then

                local pos_x = troot.Position.X + (troot.Velocity.X / 1.5)
                local pos_y = troot.Position.Y + (troot.Velocity.Y / 1.5)
                local pos_z = troot.Position.Z + (troot.Velocity.Z / 1.5)

                local position = Vector3.new(pos_x, pos_y, pos_z)
                Ball.CFrame = CFrame.new(position)
                Ball.Orientation += Vector3.new(45, 60, 30)
                else
                for i, v in pairs(tchar:GetChildren()) do
                if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
                Ball.CFrame = v.CFrame
                task.wait(1/6000)
                end
            end
                end
                task.wait(1/6000)
            until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(workspace) or target.Parent ~= players
            workspace.CurrentCamera.CameraSubject = humanoid
        end
    end
end

Tabs.TT:AddButton({
    Name = "Fling Ball",
    Callback = function()
        FlingBall(game:GetService("Players")[selectedPlayerName])
    end
})

local Players = game:GetService('Players')
local lplayer = Players.LocalPlayer

local function isItemInInventory(itemName)
    for _, item in pairs(lplayer.Backpack:GetChildren()) do
        if item.Name == itemName then
            return true
        end
    end
    return false
end

local function equipItem(itemName)
    local item = lplayer.Backpack:FindFirstChild(itemName)
    if item then
        lplayer.Character.Humanoid:EquipTool(item)
    end
end

local function unequipItem(itemName)
    local item = lplayer.Character:FindFirstChild(itemName)
    if item then
        item.Parent = lplayer.Backpack
    end
end

local function ActiveAutoFling(targetPlayer)
    if not isItemInInventory("Couch") then
        local args = { [1] = "PickingTools", [2] = "Couch" }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    end

    equipItem("Couch")
    getgenv().flingloop = true

    while getgenv().flingloop do
        local function flingloopfix()
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local AllBool = false

            local SkidFling = function(TargetPlayer)
                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Humanoid.RootPart
                local TCharacter = TargetPlayer.Character
                local THumanoid, TRootPart, THead, Accessory, Handle

                if TCharacter:FindFirstChildOfClass("Humanoid") then
                    THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
                end
                if THumanoid and THumanoid.RootPart then
                    TRootPart = THumanoid.RootPart
                end
                if TCharacter:FindFirstChild("Head") then
                    THead = TCharacter.Head
                end
                if TCharacter:FindFirstChildOfClass("Accessory") then
                    Accessory = TCharacter:FindFirstChildOfClass("Accessory")
                end
                if Accessory and Accessory:FindFirstChild("Handle") then
                    Handle = Accessory.Handle
                end

                if Character and Humanoid and RootPart then
                    if RootPart.Velocity.Magnitude < 50 then
                        getgenv().OldPos = RootPart.CFrame
                    end
                    if THumanoid and THumanoid.Sit and not AllBool then
                        unequipItem("Couch")
                        getgenv().flingloop = false
                        return
                    end
                    if THead then
                        workspace.CurrentCamera.CameraSubject = THead
                    elseif not THead and Handle then
                        workspace.CurrentCamera.CameraSubject = Handle
                    elseif THumanoid and TRootPart then
                        workspace.CurrentCamera.CameraSubject = THumanoid
                    end

                    if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                        return
                    end

                    local FPos = function(BasePart, Pos, Ang)
                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local SFBasePart = function(BasePart)
                        local TimeToWait = 2
                        local Time = tick()
                        local Angle = 0
                        repeat
                            if RootPart and THumanoid then
                                if BasePart.Velocity.Magnitude < 50 then
                                    Angle = Angle + 100
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                else
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                end
                            else
                                break
                            end
                        until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait or getgenv().flingloop == false
                    end

                    workspace.FallenPartsDestroyHeight = 0/0
                    local BV = Instance.new("BodyVelocity")
                    BV.Name = "SpeedDoPai"
                    BV.Parent = RootPart
                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if TRootPart and THead then
                        if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                            SFBasePart(THead)
                        else
                            SFBasePart(TRootPart)
                        end
                    elseif TRootPart and not THead then
                        SFBasePart(TRootPart)
                    elseif not TRootPart and THead then
                        SFBasePart(THead)
                    elseif not TRootPart and not THead and Accessory and Handle then
                        SFBasePart(Handle)
                    end
                    BV:Destroy()
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    workspace.CurrentCamera.CameraSubject = Humanoid

                    repeat
                        RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                        Humanoid:ChangeState("GettingUp")
                        table.foreach(Character:GetChildren(), function(_, x)
                            if x:IsA("BasePart") then
                                x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                            end
                        end)
                        task.wait()
                    until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25

                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                end
            end

            if AllBool then
                for _, x in next, Players:GetPlayers() do
                    SkidFling(x)
                end
            end

            if targetPlayer then
                SkidFling(targetPlayer)
            end

            task.wait()
        end

        wait()
        pcall(flingloopfix)
    end
end

    Tabs.TT:AddButton({
        Name = Translator:traduzir("Jail Player <Selecionado>"),
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                return
            end
            if methodKill == "jail" then
                jailcouch()
            elseif methodKill == "Couch Sem ir até o alvo [BETA]" then
                KillWithCouch()
            else
                
                local character = LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    warn("Erro: HumanoidRootPart do jogador local não encontrado")
                    return
                end

                local originalPosition = humanoidRootPart.CFrame

                local function GetBus()
                    local vehicles = game.Workspace:FindFirstChild("Vehicles")
                    if vehicles then
                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                    end
                    return nil
                end

                local bus = GetBus()

                if not bus then
                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                    end
                    task.wait(1)
                    bus = GetBus()
                end

                if bus then
                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                        repeat
                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                            task.wait()
                        until character.Humanoid.Sit or not bus.Parent
                        if character.Humanoid.Sit or not bus.Parent then
                            for k, v in pairs(bus.Body:GetChildren()) do
                                if v:IsA("Seat") then
                                    v.CanTouch = false
                                end
                            end
                        end
                    end
                end

                local function TrackPlayer()
                    while true do
                        if selectedPlayerName then
                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                                if targetHumanoid and targetHumanoid.Sit then
                                    if character.Humanoid then
                                        bus:SetPrimaryPartCFrame(CFrame.new(Vector3.new(673.678162, 18.1641273, 478.667908, 0, 0, -1, 0, 1, 0, 1, 0, 0)))
                                        print("Jogador sentou, levando ônibus para o void!")
                                        task.wait(0.2)

                                        local function simulateJump()
                                            local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
                                            if humanoid then
                                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                            end
                                        end

                                        simulateJump()
                                        print("Simulando pulo!")
                                        task.wait(0.5)
                                        humanoidRootPart.CFrame = originalPosition
                                        print("Player voltou para a posição inicial.")
                                    end
                                    break
                                else
                                    local targetRoot = targetPlayer.Character.HumanoidRootPart
                                    local time = tick() * 35
                                    local lateralOffset = math.sin(time) * 4
                                    local frontBackOffset = math.cos(time) * 20
                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))
                                end
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end

                spawn(TrackPlayer)
            end
        end
    })
--[[Tabs.TT:AddButton({
    Name = Translator:traduzir("Jail fe <Selecionado>"),
    Callback = function()
        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            warn("inv")
            return
        end

        local character = LocalPlayer.Character
        local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then
            warn("nn found")
            return
        end

        local originalPosition = humanoidRootPart.CFrame

        local function GetBus()
            local vehicles = game.Workspace:FindFirstChild("Vehicles")
            if vehicles then
                return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
            end
            return nil
        end

        local bus = GetBus()

        if not bus then
            humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
            task.wait(0.5)
            local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
            if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
            end
            task.wait(1)
            bus = GetBus()
        end

        if bus then
            local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
            if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                repeat
                    humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                    task.wait()
                until character.Humanoid.Sit or not bus.Parent
                if character.Humanoid.Sit or not bus.Parent then
                    for _, v in pairs(bus.Body:GetChildren()) do
                        if v:IsA("Seat") then
                            v.CanTouch = false
                        end
                    end
                end
            end
        end

        local function TrackAndExecute()
            while true do
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if targetHumanoid and targetHumanoid.Sit then
                        if character.Humanoid then
                            bus:SetPrimaryPartCFrame(CFrame.new(673.678162, 18.1641273, 478.667908, 0, 0, -1, 0, 1, 0, 1, 0, 0))
                            task.wait(0.2)
                        local args = {"DeleteAllVehicles"} game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))

                            character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                            task.wait(0.5)
                            humanoidRootPart.CFrame = originalPosition
                        end
                        break
                    else
                        local targetRoot = targetPlayer.Character.HumanoidRootPart
                        local time = tick() * 35
                        local lateralOffset = math.sin(time) * 4
                        local frontBackOffset = math.cos(time) * 20
                        bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))
                    end
                end
                RunService.RenderStepped:Wait()
            end
        end

        spawn(TrackAndExecute)
    end
})]]
end
do
Tabs.TT:AddSection({Translator:traduzir("Funções Mata <Todos>")})
Tabs.TT:AddButton({
    Name = Translator:traduzir("Mata Geral De Ônibus"),
    Callback = function()
        local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local destination = Vector3.new(145.51, -374.09, 21.58) 
local originalPosition = nil  

local function GetBus()  
    local vehicles = Workspace:FindFirstChild("Vehicles")  
    if vehicles then  
        return vehicles:FindFirstChild(Players.LocalPlayer.Name.."Car")  
    end  
    return nil  
end  

local function TrackPlayer(selectedPlayerName, callback)
    while true do  
        if selectedPlayerName then  
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)  
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then  
                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")  
                if targetHumanoid and targetHumanoid.Sit then  
                    local bus = GetBus()
                    if bus then
                        bus:SetPrimaryPartCFrame(CFrame.new(destination))

                        task.wait(0.2)  

                        local function simulateJump()  
                            local humanoid = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")  
                            if humanoid then  
                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)  
                            end  
                        end  

                        simulateJump()  

                        task.wait(0.4)  
                        simulateJump()

                        task.wait(0.5)
                        if originalPosition then
                            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalPosition  

                            task.wait(0.1)
                            local args = {
                                [1] = "DeleteAllVehicles"
                            }
                            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
                        end
                    end
                    break  
                else  
                    local targetRoot = targetPlayer.Character.HumanoidRootPart  
                    local time = tick() * 35
               
                    local lateralOffset = math.sin(time) * 10
                    local frontBackOffset = math.cos(time) * 20
                      
                    local bus = GetBus()
                    if bus then
                        bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(0, 0, frontBackOffset))  
                    end
                end  
            end  
        end  
        RunService.RenderStepped:Wait()  
    end
    
    if callback then
        callback()
    end
end  

local function StartKillBusao(playerName, callback)
    local selectedPlayerName = playerName

    local player = Players.LocalPlayer  
    local character = player.Character or player.CharacterAdded:Wait()  
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")  

    originalPosition = humanoidRootPart.CFrame  

    local bus = GetBus()  

    if not bus then  
        humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)  
        task.wait(0.5)  
        local remoteEvent = ReplicatedStorage:FindFirstChild("RE")  
        if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then  
            remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")  
        end  
        task.wait(1)  
        bus = GetBus()  
    end  

    if bus then  
        local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")  
        if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then  
            repeat  
                humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)  
                task.wait()  
            until character.Humanoid.Sit or not bus.Parent  
        end  
    end  

    spawn(function()
        TrackPlayer(selectedPlayerName, callback)
    end)
end

local function PerformActionForAllPlayers(players)
    if #players == 0 then
        return
    end

    local player = table.remove(players, 1)
    StartKillBusao(player.Name, function()
        task.wait(0.5)
        PerformActionForAllPlayers(players)
    end)
end

PerformActionForAllPlayers(Players:GetPlayers())
    end
})

Tabs.TT:AddButton({
    Name = Translator:traduzir("Matar Geral de Barco "),
    Callback = function()
        local Player = game.Players.LocalPlayer
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = game.Workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart.CFrame
    local Angles = 0
    local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
    
            if not PCar then  
                if RootPart then  
                    RootPart.CFrame = CFrame.new(1754, -2, 58)  
                    task.wait(0.5)  
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")  
                    task.wait(0.5)  
                    PCar = Vehicles:FindFirstChild(Player.Name.."Car")  
                    task.wait(0.5)  
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  
                    if Seat then  
                        repeat  
                            task.wait()  
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  
                        until Humanoid.Sit  
                    end  
                end  
            end  
      
            task.wait(0.5)  
            PCar = Vehicles:FindFirstChild(Player.Name.."Car") 
            if PCar then  
                if not Humanoid.Sit then  
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  
                    if Seat then  
                        repeat  
                            task.wait()  
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  
                        until Humanoid.Sit  
                    end  
                end  
            end  
      
            local SpinGyro = Instance.new("BodyGyro")  
            SpinGyro.Parent = PCar.PrimaryPart  
            SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)  
            SpinGyro.P = 1e7  
            SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)  
      
            local function flingPlayer(TargetC, TargetRP, TargetH)
    Angles = 0  
                local endTime = tick() + 1 
                while tick() < endTime do  
                    Angles = Angles + 100  
                    task.wait()  
                    local kill = function(alvo, pos, angulo)  
                        PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)  
                    end  
      

                    kill(TargetRP, CFrame.new(0, 3, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(0, -1.5, 2), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(2, 1.5, 2.25), CFrame.Angles(math.rad(50), 0, 0))  
                    kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25), CFrame.Angles(math.rad(30), 0, 0))  
                    kill(TargetRP, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                end  
            end  
      
            for _, Target in pairs(game.Players:GetPlayers()) do  
                if Target ~= Player then  
                    local TargetC = Target.Character  
                    local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")  
                    local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")  
      
                    if TargetC and TargetH and TargetRP then  
                        flingPlayer(TargetC, TargetRP, TargetH)
                    end  
                end  
            end  
            task.wait(0.5)  
            PCar:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))  
            task.wait(0.5)  
            Humanoid.Sit = false  
            task.wait(0.5)  
            RootPart.CFrame = OldPos  
            SpinGyro:Destroy()  
    end
})
local Button = Tabs.TT:AddButton({Translator:traduzir("Joga bola <Todos>"), function()
      local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local StarterGui = game:GetService("StarterGui")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local localPlayer = Players.LocalPlayer
    local BALL_PATH = "WorkspaceCom/001_SoccerBalls/Soccer" .. localPlayer.Name

    getgenv().Target = nil
    local ball, connection
    local isFlinging = false

--[[    local function getThumbnail(player)
        do
            local id = player.UserId
            local thumb, _ = Players:GetUserThumbnailAsync(id, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            return thumb
        end
    end

    local function notify(player, text)
        do
            local icon = getThumbnail(player)
            StarterGui:SetCore("SendNotification", {
                Title = "Fling Ball All",
                Text = text,
                Duration = 2,
                Icon = icon
            })
        end
    end
]]
    local function getSoccerBall()
        do
            local argsClear = { "PlayerWantsToDeleteTool", "SoccerBall" }
            local argsTool = { "PickingTools", "SoccerBall" }

            ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(argsClear))
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(argsTool))

            repeat task.wait() until localPlayer.Backpack:FindFirstChild("SoccerBall")

            local tool = localPlayer.Backpack:FindFirstChild("SoccerBall")
            if not tool then return warn("Bola nÃ£o encontrada.") end

            tool.Parent = localPlayer.Character
            task.wait(0.25)
        end
    end

    local function clearForces(targetBall)
        do
            for _, obj in ipairs(targetBall:GetChildren()) do
                if obj:IsA("BodyForce") or obj:IsA("BodyVelocity") or obj:IsA("BodyAngularVelocity") then
                    obj:Destroy()
                end
            end
        end
    end

    local function ignorePlayerCollision(targetBall, targetCharacter)
        do
            for _, part in ipairs(targetCharacter:GetDescendants()) do
                if part:IsA("BasePart") then
                    local constraint = Instance.new("NoCollisionConstraint")
                    constraint.Part0 = targetBall
                    constraint.Part1 = part
                    constraint.Parent = targetBall
                end
            end
        end
    end

    local function applyFlingForces(targetBall)
        do
            clearForces(targetBall)

            local bodyForce = Instance.new("BodyForce")
            bodyForce.Force = Vector3.new(9e8, 9e8, 9e8)
            bodyForce.Parent = targetBall

            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVelocity.P = 1e7
            bodyVelocity.Parent = targetBall
        end
    end

    local function setupBall(targetPlayer)
        do
            local character = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
            local torso = character:FindFirstChild("HumanoidRootPart")
            if not torso then return end

            local success, foundBall = pcall(function()
                local obj = workspace
                for _, part in ipairs(BALL_PATH:split("/")) do
                    obj = obj:WaitForChild(part, 5)
                end
                return obj
            end)

            if not success or not foundBall then return end

            ball = foundBall
            ball.Anchored = false
            ball.CanCollide = true
            ball.Massless = false

            clearForces(ball)
            ignorePlayerCollision(ball, character)
            applyFlingForces(ball)

            if connection then connection:Disconnect() end

            local lastPos = torso.Position
            local toggleY = true

            connection = RunService.Heartbeat:Connect(function()
                if not ball or not torso then
                    connection:Disconnect()
                    return
                end

                local currentPos = torso.Position
                local velocity = (currentPos - lastPos).Magnitude
                lastPos = currentPos

                local basePos = torso.Position + Vector3.new(0, -0.5, 0)

                if velocity > 1 then
                    local forward = torso.CFrame.LookVector
                    ball.CFrame = CFrame.new(basePos + forward * 10)
                else
                    local yOffset = toggleY and 3 or -3
                    ball.CFrame = CFrame.new(basePos + Vector3.new(0, yOffset, 0))
                    toggleY = not toggleY
                end
            end)
        end
    end

    local function wasFlinged(targetPlayer)
        do
            local hrp = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            return hrp and math.abs(hrp.Velocity.Y) > 200
        end
    end

    local function startFlingBallAll()
        do
            isFlinging = true
            getSoccerBall()

            local allPlayers = Players:GetPlayers()
            local flingCount = 0
            local totalPlayers = #allPlayers - 1

            for _, player in ipairs(allPlayers) do
                if player ~= localPlayer then
                    getgenv().Target = player.Name
                    setupBall(player)

                    local t = 0
                    while t < 3 and player.Character and player.Character:FindFirstChild("Humanoid") do
                        if wasFlinged(player) then break end
                        task.wait(0.2)
                        t += 0.2
                    end

                    if wasFlinged(player) then
                        flingCount += 1
                    end
                end
            end

            isFlinging = false
            if connection then connection:Disconnect() end
        end
    end

    if not isFlinging then
        startFlingBallAll()
    end
end})

Tabs.TT:AddButton({Translator:traduzir("Matar Geral v2 <Couch>"), function()
local soundIds = {
    "rbxassetid://128703509251740",
    "rbxassetid://132885275273014", 
    "rbxassetid://7772283448",
    "rbxassetid://17517505567"
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local playersOnCouch = {}

local function playRandomSound()
    local randomSoundId = soundIds[math.random(1, #soundIds)]
    
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. randomSoundId
    sound.Volume = 0.5
    sound.Parent = game.Workspace
    
    sound:Play()
    
    
    game:GetService("Debris"):AddItem(sound, 10)
end

local function isCouch(part)
    if not part then return false end
    local name = part.Name:lower()
    return name:find("couch") or name:find("sofa") or name:find("chair") or name:find("seat")
end

local function monitorCouchSitting()
    RunService.Heartbeat:Connect(function()
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                
                if humanoid and humanoid.Sit then
                    local seatPart = humanoid.SeatPart
                    
                    if seatPart and isCouch(seatPart) then
                        if not playersOnCouch[player.UserId] then
                            playersOnCouch[player.UserId] = true
                            playRandomSound()
                        end
                    else
                        playersOnCouch[player.UserId] = nil
                    end
                else
                    playersOnCouch[player.UserId] = nil
                end
            end
        end
    end)
end


monitorCouchSitting()


Players.PlayerRemoving:Connect(function(player)
    playersOnCouch[player.UserId] = nil
end)

local function HandleToolV3()
    local args = {
        [1] = "PlayerWantsToDeleteTool",
        [2] = "Couch"
    }
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
    task.wait(0.5)
    local args = {
        [1] = "PickingTools",
        [2] = "Couch"
    }
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Couch") then
        game.Players.LocalPlayer.Backpack.Couch.Grip = CFrame.new(0, 2, -2.5)
    end
    
    local function equiptool()
        for i, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name == "Couch" then
                v.Parent = game.Players.LocalPlayer.Character
            end
        end
    end
    
    equiptool()
end

if getgenv()._FlingAllRunning then
    return
end
getgenv()._FlingAllRunning = true
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local Targets = {"all"}

local AllBool = false

local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,player) then table.remove(GetPlayers,table.find(GetPlayers,player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local Message = function(_Title, _Text, Time)
    print(_Title)
    print(_Text)
    print(Time)
end

local SkidFling = function(TargetPlayer)
    if not TargetPlayer or not TargetPlayer.Character then
        return
    end
    
    HandleToolV3()
    task.wait(0.5)
    
    local Character = player.Character
    if not Character then return end
    
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart
    
    if not Humanoid or not RootPart then
        return
    end
    
    local TCharacter = TargetPlayer.Character
    if not TCharacter then return end
    
    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")
    
    if not THumanoid or not TRootPart then
        return
    end
    
    if RootPart.Velocity.Magnitude < 50 then
        getgenv().OldPos = RootPart.CFrame
    end
    
    if THead then
        workspace.CurrentCamera.CameraSubject = THead
    elseif not THead and Handle then
        workspace.CurrentCamera.CameraSubject = Handle
    elseif THumanoid then
        workspace.CurrentCamera.CameraSubject = THumanoid
    end
    
    if not TCharacter:FindFirstChildWhichIsA("BasePart") then
        return
    end
    
    local FPos = function(BasePart, Pos, Ang)
        if not BasePart or not BasePart.Parent then return end
        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
    end
    
    local SFBasePart = function(BasePart)
        if not BasePart or not BasePart.Parent then return end
        local TimeToWait = 10
        local Time = tick()
        local Angle = 0

        repeat
            if RootPart and THumanoid and BasePart and BasePart.Parent then
                if BasePart.Velocity.Magnitude < 50 then
                    Angle = Angle + 100

                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                    task.wait()
                else
                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()
                    
                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                    task.wait()

                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                    task.wait()
                end
            else
                break
            end
        until (not BasePart or not BasePart.Parent or not TargetPlayer or not TargetPlayer.Parent or not TargetPlayer.Character or TargetPlayer.Character ~= TCharacter or not THumanoid or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait) or BasePart.Velocity.Magnitude > 500
    end
    
    workspace.FallenPartsDestroyHeight = 0/0
    
    local BV = Instance.new("BodyVelocity")
    BV.Name = "EpixVel"
    BV.Parent = RootPart
    BV.Velocity = Vector3.new(1e9, 1e9, 1e9)
    BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
    
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    
    if TRootPart and THead then
        if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
            SFBasePart(THead)
        else
            SFBasePart(TRootPart)
        end
    elseif TRootPart and not THead then
        SFBasePart(TRootPart)
    elseif not TRootPart and THead then
        SFBasePart(THead)
    elseif not TRootPart and not THead and Accessory and Handle then
        SFBasePart(Handle)
    end
    
    if BV then BV:Destroy() end
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
    workspace.CurrentCamera.CameraSubject = Humanoid
    
    if getgenv().OldPos then
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
    end
end

getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        if x ~= player then
            SkidFling(x)
        end
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= player then
        if GetPlayer(x).UserId ~= 0/0 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        end
    end
end
getgenv()._FlingAllRunning = false
workspace.FallenPartsDestroyHeight = -500
end})
end
do
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local CONFIG = {
    FLING_VELOCITY = Vector3.new(9e8, 9e8, 9e8),
    MAX_FORCE = Vector3.new(math.huge, math.huge, math.huge),
    POWER = 9e900,
    MIN_FLING_SPEED = 1000,
    TIMEOUT_SECONDS = 5,
    BALL_PHYSICS = PhysicalProperties.new(0.0001, 0, 0),
    ROTATION_SPEED = Vector3.new(45, 60, 30)
}

local GameState = {
    adminToolEquipped = false,
    controlledDoors = {},
    blackHole = nil,
    baseAttachment = nil
}

local Utils = {}

function Utils.safeWait(condition, timeout)
    local startTime = tick()
    timeout = timeout or 5
    
    repeat
        task.wait()
    until condition() or (tick() - startTime) > timeout
    
    return condition()
end

function Utils.getPlayerCharacter(player)
    return player and player.Character
end

function Utils.validateCharacter(character)
    if not character then return false end
    return character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid")
end

function Utils.createBodyVelocity(parent)
    local oldBV = parent:FindFirstChildWhichIsA("BodyVelocity")
    if oldBV then oldBV:Destroy() end
    
    local bv = Instance.new("BodyVelocity")
    bv.Name = "FlingPower"
    bv.Velocity = CONFIG.FLING_VELOCITY
    bv.MaxForce = CONFIG.MAX_FORCE
    bv.P = CONFIG.POWER
    bv.Parent = parent
    
    return bv
end

function Utils.raycastFromScreen(position)
    local ray = Camera:ScreenPointToRay(position.X, position.Y)
    return Workspace:Raycast(ray.Origin, ray.Direction * 1000)
end

function Utils.getPlayerFromHit(hit)
    if not hit or not hit.Instance then return nil end
    local model = hit.Instance:FindFirstAncestorOfClass("Model")
    return Players:GetPlayerFromCharacter(model)
end

local BallSystem = {}

function BallSystem.getSoccerBall(player)
    local character = Utils.getPlayerCharacter(player)
    local backpack = player:WaitForChild("Backpack")
    local serverBalls = Workspace:WaitForChild("WorkspaceCom"):FindFirstChild("001_SoccerBalls")
    
    if not character or not serverBalls then return nil end
    
    local existingBall = serverBalls:FindFirstChild("Soccer" .. player.Name)
    if existingBall then return existingBall end
    
    if not backpack:FindFirstChild("SoccerBall") and not character:FindFirstChild("SoccerBall") then
        local success, error = pcall(function()
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
        end)
        if not success then
            warn("Erro ao pegar bola: " .. tostring(error))
            return nil
        end
    end
    
    if not Utils.safeWait(function() 
        return backpack:FindFirstChild("SoccerBall") or character:FindFirstChild("SoccerBall") 
    end) then
        return nil
    end
    
    local ballTool = backpack:FindFirstChild("SoccerBall")
    if ballTool then ballTool.Parent = character end
    
    if not Utils.safeWait(function() 
        return serverBalls:FindFirstChild("Soccer" .. player.Name) 
    end) then
        return nil
    end
    
    return serverBalls:FindFirstChild("Soccer" .. player.Name)
end

function BallSystem.prepareBall(ball, invisible)
    if not ball then return false end
    
    ball.CanCollide = false
    ball.Massless = true
    ball.CustomPhysicalProperties = CONFIG.BALL_PHYSICS
    
    if invisible then
        ball.Transparency = 1
    end
    
    return true
end

function BallSystem.flingWithBall(target, invisible, oscillate)
    if target == LocalPlayer then return false end
    
    local targetChar = Utils.getPlayerCharacter(target)
    if not Utils.validateCharacter(targetChar) then return false end
    
    local ball = BallSystem.getSoccerBall(LocalPlayer)
    if not ball or not BallSystem.prepareBall(ball, invisible) then return false end
    
    local targetHRP = targetChar.HumanoidRootPart
    local targetHum = targetChar.Humanoid
    local localHum = LocalPlayer.Character.Humanoid
    
    Utils.createBodyVelocity(ball)
    
    Camera.CameraSubject = targetHum
    
    local startTime = tick()
    local success = false
    
    repeat
        if targetHRP.Velocity.Magnitude > 0 then
            local pos = targetHRP.Position + (targetHRP.Velocity / 1.5)
            
            if oscillate then
                local altura = math.sin(tick() * 8) * 3
                ball.CFrame = CFrame.new(pos.X, pos.Y + altura, pos.Z)
            else
                ball.CFrame = CFrame.new(pos)
            end
        else
            for _, part in pairs(targetChar:GetChildren()) do
                if part:IsA("BasePart") and part.CanCollide and not part.Anchored then
                    ball.CFrame = part.CFrame
                    break
                end
            end
        end
        
        ball.Orientation = ball.Orientation + CONFIG.ROTATION_SPEED
        
        if targetHRP.Velocity.Magnitude > CONFIG.MIN_FLING_SPEED then
            success = true
            break
        end
        
        task.wait(1/6000)
    until targetHum.Health <= 0 or 
          not targetChar:IsDescendantOf(Workspace) or 
          target.Parent ~= Players or 
          (tick() - startTime) > CONFIG.TIMEOUT_SECONDS
    
    Camera.CameraSubject = localHum
    
    return success
end

local DoorSystem = {}

function DoorSystem.initialize()
    GameState.blackHole = Instance.new("Part")
    GameState.blackHole.Size = Vector3.new(100000, 100000, 100000)
    GameState.blackHole.Transparency = 1
    GameState.blackHole.Anchored = true
    GameState.blackHole.CanCollide = false
    GameState.blackHole.Name = "BlackHoleTarget"
    GameState.blackHole.Parent = Workspace
    
    GameState.baseAttachment = Instance.new("Attachment")
    GameState.baseAttachment.Name = "BlackHoleAttachment"
    GameState.baseAttachment.Parent = GameState.blackHole
    
    RunService.Heartbeat:Connect(function()
        local character = Utils.getPlayerCharacter(LocalPlayer)
        if character and character:FindFirstChild("HumanoidRootPart") then
            GameState.blackHole.CFrame = character.HumanoidRootPart.CFrame
        end
    end)
    
    for _, obj in ipairs(Workspace:GetDescendants()) do
        DoorSystem.setupDoor(obj)
    end
    
    Workspace.DescendantAdded:Connect(DoorSystem.setupDoor)
end

function DoorSystem.setupDoor(part)
    if not part:IsA("BasePart") or 
       part.Anchored or 
       not string.find(part.Name, "Door") or 
       part:FindFirstChild("DoorAttached") then 
        return 
    end
    
    part.CanCollide = false
    
    for _, obj in ipairs(part:GetChildren()) do
        if obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then
            obj:Destroy()
        end
    end
    
    local marker = Instance.new("BoolValue", part)
    marker.Name = "DoorAttached"
    
    local attachment = Instance.new("Attachment", part)
    
    local align = Instance.new("AlignPosition", part)
    align.Attachment0 = attachment
    align.Attachment1 = GameState.baseAttachment
    align.MaxForce = 1e20
    align.MaxVelocity = math.huge
    align.Responsiveness = 99999
    
    local torque = Instance.new("Torque", part)
    torque.Attachment0 = attachment
    torque.RelativeTo = Enum.ActuatorRelativeTo.World
    torque.Torque = Vector3.new(
        math.random(-10e5, 10e5) * 10000,
        math.random(-10e5, 10e5) * 10000,
        math.random(-10e5, 10e5) * 10000
    )
    
    table.insert(GameState.controlledDoors, {Part = part, Align = align})
end

function DoorSystem.flingWithDoors(target)
    if target == LocalPlayer then return false end
    
    local targetChar = Utils.getPlayerCharacter(target)
    if not Utils.validateCharacter(targetChar) then return false end
    
    local targetHRP = targetChar.HumanoidRootPart
    
    local targetAttachment = targetHRP:FindFirstChild("TargetAttachment")
    if not targetAttachment then
        targetAttachment = Instance.new("Attachment", targetHRP)
        targetAttachment.Name = "TargetAttachment"
    end
    
    for _, data in ipairs(GameState.controlledDoors) do
        if data.Align and data.Align.Parent then
            data.Align.Attachment1 = targetAttachment
        end
    end
    
    local startTime = tick()
    local success = false
    
    while tick() - startTime < CONFIG.TIMEOUT_SECONDS do
        if targetHRP.Velocity.Magnitude >= 20 then
            success = true
            break
        end
        RunService.Heartbeat:Wait()
    end
    
    for _, data in ipairs(GameState.controlledDoors) do
        if data.Align and data.Align.Parent then
            data.Align.Attachment1 = GameState.baseAttachment
        end
    end
    
    return success
end

local ToolSystem = {}

function ToolSystem.createTool(name, iconId, onEquipped, onUnequipped)
    local backpack = LocalPlayer:WaitForChild("Backpack")
    
    local existingTool = backpack:FindFirstChild(name)
    if existingTool then existingTool:Destroy() end
    
    local tool = Instance.new("Tool")
    tool.Name = name
    tool.RequiresHandle = iconId ~= nil
    tool.CanBeDropped = false
    
    if iconId then
        local handle = Instance.new("Part")
        handle.Name = "Handle"
        handle.Size = Vector3.new(1, 1, 1)
        handle.Transparency = 1
        handle.Parent = tool
        
        local decal = Instance.new("Decal")
        decal.Texture = "rbxassetid://" .. iconId
        decal.Face = Enum.NormalId.Front
        decal.Parent = handle
    end
    
    tool.Equipped:Connect(onEquipped or function() end)
    tool.Unequipped:Connect(onUnequipped or function() end)
    
    tool.Parent = backpack
    return tool
end

local InputHandler = {}

function InputHandler.handleTouch(touches, processed, callback)
    if processed then return end
    
    local hit = Utils.raycastFromScreen(touches[1])
    local player = Utils.getPlayerFromHit(hit)
    
    if player and player ~= LocalPlayer then
        callback(player)
    end
end

    Tabs.TT:AddSection({Translator:traduzir("Matar Jogadores Com Clique")})
    
    Tabs.TT:AddButton({
        Name = Translator:traduzir("Clique Admin <Fling>"),
        Callback = function()
            Window:Dialog({
                Title = Translator:traduzir("Admin Fling"),
                Text = Translator:traduzir("Equipe a bola e use o clique para arremessar jogadores. Ferramenta com câmera automática."),
                Options = {
                    {"Link Discord", function()
                        copyDiscordLink()
                    end},
                    {"Ativar", function()
                        ToolSystem.createTool(
                            "Admin Fling",
                            "rbxassetid://775552544",
                            function() GameState.adminToolEquipped = true end,
                            function() GameState.adminToolEquipped = false end
                        )
                    end}
                }
            })
        end
    })
    
    Tabs.TT:AddButton({
        Name = Translator:traduzir("Clique Portas <Fling>"),
        Callback = function()
            DoorSystem.initialize()
        end
    })
    

UserInputService.TouchTap:Connect(function(touches, processed)
    if processed then return end
    
    if GameState.adminToolEquipped then
        InputHandler.handleTouch(touches, processed, function(player)
            spawn(function()
                BallSystem.flingWithBall(player, true, false)
            end)
        end)
    end
    

    if GameState.blackHole then
        InputHandler.handleTouch(touches, processed, function(player)
            spawn(function()
                DoorSystem.flingWithDoors(player)
            end)
        end)
    end
end)
    local jogadores = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local mundo = game:GetService("Workspace")
local entrada = game:GetService("UserInputService")
local cam = mundo.CurrentCamera
local eu = jogadores.LocalPlayer

local toggleFlingBallActive = false

Tabs.TT:AddToggle({
Name = Translator:traduzir("Clique Bola <Fling>"),
Description = Translator:traduzir("trolar jogadores usando isso apenas damdo clique"),
Default = false,
Callback = function(valor)
toggleFlingBallActive = valor
end
})

local function FlingBall(target)
local player = eu
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local hrp = character:WaitForChild("HumanoidRootPart")
local backpack = player:WaitForChild("Backpack")
local ServerBalls = mundo.WorkspaceCom:FindFirstChild("001_SoccerBalls")
if not ServerBalls then return end

local function GetBall()
if not backpack:FindFirstChild("SoccerBall") and not character:FindFirstChild("SoccerBall") then
rep.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
end

repeat task.wait() until backpack:FindFirstChild("SoccerBall") or character:FindFirstChild("SoccerBall")

local ballTool = backpack:FindFirstChild("SoccerBall")
if ballTool then ballTool.Parent = character end

repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)
return ServerBalls:FindFirstChild("Soccer" .. player.Name)
end

local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
if not Ball then return end

Ball.CanCollide = false
Ball.Massless = true
Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

if target ~= player then
local tchar = target.Character
if not tchar then return end

local troot = tchar:FindFirstChild("HumanoidRootPart")
local thum = tchar:FindFirstChild("Humanoid")
if not troot or not thum then return end

local bvAntigo = Ball:FindFirstChildWhichIsA("BodyVelocity")
if bvAntigo then bvAntigo:Destroy() end

local bv = Instance.new("BodyVelocity")
bv.Name = "FlingPower"
bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bv.P = 9e900
bv.Parent = Ball

repeat
local pos = troot.Position + (troot.Velocity / 1.5)
local tempo = tick()


local altura = math.sin(tempo * 7) * 2
Ball.CFrame = CFrame.new(pos.X, pos.Y + altura, pos.Z)
Ball.Orientation += Vector3.new(45, 60, 30)

task.wait(1 / 5000)
until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(mundo) or target.Parent ~= jogadores
end
end

entrada.TouchTap:Connect(function(toques, processado)
if not toggleFlingBallActive or processado then return end
local pos = toques[1]
local raio = cam:ScreenPointToRay(pos.X, pos.Y)
local hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)
if hit and hit.Instance then
local modelo = hit.Instance:FindFirstAncestorOfClass("Model")
local jogador = jogadores:GetPlayerFromCharacter(modelo)
if jogador and jogador ~= eu then
FlingBall(jogador)
end
end
end)

end
Tabs.TT:AddSection({Translator:traduzir("Items Tool")})
local Button = Tabs.TT:AddButton({Translator:traduzir("Telecinese"), function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/SAZXHUB/Control-update/main/README.md', true))()
end})
Tabs.TT:AddButton({
    Name = Translator:traduzir("ShiftLock"),
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/N2tiHgyv"))()
    end
})
Tabs.TT:AddButton({
    Translator:traduzir("Guitarra elétrica + Violão - Acustic"),
    function()
        local plr = game.Players.LocalPlayer
        local hrp = plr.Character.HumanoidRootPart

        hrp.CFrame = CFrame.new(-384.5757, 18.5075, 212.3876)
        wait(0.1)

        local function pickTool(toolName)
            local args = { [1] = "PickingTools", [2] = toolName }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
            wait(0.1)
        end

        pickTool("Guitar")
        pickTool("ElectricGuitar")

        local function duplicateItem(itemName)
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
            local itemToDuplicate = backpack:FindFirstChild(itemName)
            if itemToDuplicate then
                local clonedItem = itemToDuplicate:Clone()
                clonedItem.Parent = backpack
            end
        end

        duplicateItem("Guitar")
        duplicateItem("ElectricGuitar")

        local function equiparItem(itemName)
            local player = game.Players.LocalPlayer
            local backpack = player:FindFirstChild("Backpack")
            if backpack then
                local item = backpack:FindFirstChild(itemName)
                if item then
                    item.Parent = player.Character
                end
            end
        end

        equiparItem("Guitar")
        equiparItem("ElectricGuitar")

        hrp.CFrame = CFrame.new(0, 50, 0)
        wait(0.1)

        local function equipAllItems()
            local player = game.Players.LocalPlayer
            local backpack = player:WaitForChild("Backpack")
            for _, item in ipairs(backpack:GetChildren()) do
                item.Parent = player.Character
            end
        end

        equipAllItems()

        local ContextActionService = game:GetService("ContextActionService")
        ContextActionService:BindAction("EquipAll", function(_, inputState)
            if inputState == Enum.UserInputState.Begin then
                equipAllItems()
            end
        end, false, Enum.KeyCode.E)
    end
})
local Button = Tabs.TT:AddButton({Translator:traduzir("Pega Sofá"), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/realgengar/scripts/refs/heads/main/Brancos.lua", true))()
end})

local Button = Tabs.TT:AddButton({Translator:traduzir("Pegar Teleport tool"), function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "teleport"
    tool.Activated:connect(function()
        local pos = mouse.Hit+Vector3.new(0,2.5,0)
        pos = CFrame.new(pos.X,pos.Y,pos.Z)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end)
    tool.Parent = game.Players.LocalPlayer.Backpack
end})

do
Tabs.TT:AddSection({Translator:traduzir("Orbitar")})
local orbit = nil
local orbiting = false
local tweenSpeed = 20

local playerDropdown = Tabs.TT:AddDropdown({
Name = Translator:traduzir("Selecione Um Jogador"),
Description = Translator:traduzir("Selecione um jogador para orbitar"),
Options = {},
Default = "Players",
Callback = function(value)
orbit = Players:FindFirstChild(value)
end
})
Tabs.TT:AddSlider({
Name = Translator:traduzir("Velocidade <Tween>"),
Min = 1,
Max = 9999,
Increase = 1,
Default = 20,
Callback = function(Value)
tweenSpeed = Value
end
})
Tabs.TT:AddButton({
Name = Translator:traduzir("Atualizar Lista"),
Callback = function()
local lista = {}
for _, v in pairs(Players:GetPlayers()) do
if v ~= LocalPlayer then
table.insert(lista, v.Name)
end
end
playerDropdown:Set(lista)
end
})

Tabs.TT:AddToggle({
Name = Translator:traduzir("Orbita Jogador"),
Description = Translator:traduzir("Vire um planeta e orbite o jogador"),
Default = false,
Callback = function(value)
orbiting = value
if orbiting and orbit and orbit.Character and orbit.Character:FindFirstChild("HumanoidRootPart") then
local localChar = LocalPlayer.Character
local localHRP = localChar and localChar:FindFirstChild("HumanoidRootPart")
if not localHRP then return end

while orbiting and orbit and orbit.Character and orbit.Character:FindFirstChild("HumanoidRootPart") do
local targetHRP = orbit.Character.HumanoidRootPart
local angle = tick() * tweenSpeed
local radius = 5
local offset = Vector3.new(math.cos(angle) * radius, 0, math.sin(angle) * radius)
local orbitPos = targetHRP.Position + offset

local tweenInfo = TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local tween = TweenService:Create(localHRP, tweenInfo, {CFrame = CFrame.new(orbitPos)})
tween:Play()
tween.Completed:Wait()
end
end
end
})

Tabs.TT:AddSection({Translator:traduzir("Zaralha boneco headsit")})
local selectedHeadSit = nil
local headSitConnection = nil

local headSitDropdown = Tabs.TT:AddDropdown({
    Name = Translator:traduzir("Selecionar jogador"),
    Default = "Players",
    Options = {},
    Callback = function(Value)
        selectedHeadSit = Value
    end
})

Tabs.TT:AddButton({
    Name = Translator:traduzir("Atualizar tabela"),
    Callback = function()
        local novaTabela = {}
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= Players.LocalPlayer then
                table.insert(novaTabela, v.Name)
            end
        end
        headSitDropdown:Set(novaTabela)
    end
})

Tabs.TT:AddToggle({
    Name = Translator:traduzir("Voar Sobre a cabeça"),
    Default = false,
    Callback = function(bool)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local humanoid = character:WaitForChild("Humanoid")

        if not selectedHeadSit or selectedHeadSit == "" then return end

        local selectedPlayer = game.Players:FindFirstChild(selectedHeadSit)

        if bool then
            if selectedPlayer and selectedPlayer.Character then
                humanoid.Sit = true

                if headSitConnection then
                    headSitConnection:Disconnect()
                end

                headSitConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("Head") and humanoid.Sit then
                        local targetHead = selectedPlayer.Character.Head
                        humanoidRootPart.CFrame = targetHead.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 1.6, 0.4)
                    else
                        if headSitConnection then
                            headSitConnection:Disconnect()
                            headSitConnection = nil
                            humanoid.Sit = false
                        end
                    end
                end)
            end
        else
            if headSitConnection then
                headSitConnection:Disconnect()
                headSitConnection = nil
            end
            humanoid.Sit = false
        end
    end
})
end
-----------------///////TABS - LG///////-----------------
do
Tabs.LG:AddSection({"Lag Server Controle"})
local CurrentLagType = "Phone"
local LagActive = false
local LagThread = nil
local LastCFrame = nil
local player = game.Players.LocalPlayer

local StretcherLagActive = false
local StretcherLagThread = nil

local FireXLagActive = false
local FireXLagThread = nil

local BombLagServerActive = false

local PhoneLagServer = false
local PhoneLagThread = nil

function StartPhoneLagServer()
    if not shouldPlayerBeLagged() then return end
    
    PhoneLagServer = true
    PhoneLagThread = task.spawn(function()
        while PhoneLagServer do
            fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools.Iphone.ClickDetector)
            task.wait()
        end
    end)
end

function StopPhoneLagServer()
    PhoneLagServer = false
    if PhoneLagThread then
        task.cancel(PhoneLagThread)
        PhoneLagThread = nil
    end
end

local LaptopLagServer = false
local LaptopLagThread = nil

function StartLaptopLagServer()
    if not shouldPlayerBeLagged() then return end
    
    LaptopLagServer = true
    LaptopLagThread = task.spawn(function()
        while LaptopLagServer do
            fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools.Laptop.ClickDetector)
            task.wait()
        end
    end)
end

function StopLaptopLagServer()
    LaptopLagServer = false
    if LaptopLagThread then
        task.cancel(LaptopLagThread)
        LaptopLagThread = nil
    end
end

local PhoneLaptopLagServer = false
local PhoneLaptopLagThread = nil

function StartPhoneLaptopLagServer()
    if not shouldPlayerBeLagged() then return end
    
    PhoneLaptopLagServer = true
    PhoneLaptopLagThread = task.spawn(function()
        while PhoneLaptopLagServer do
            fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools:GetChildren()[3].ClickDetector)
            task.wait(0.1)
            fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools.Laptop.ClickDetector)
            task.wait(0.01)
        end
    end)
end

function StopPhoneLaptopLagServer()
    PhoneLaptopLagServer = false
    if PhoneLaptopLagThread then
        task.cancel(PhoneLaptopLagThread)
        PhoneLaptopLagThread = nil
    end
end

local BasketballLagServer = false
local BasketballLagThread = nil

function StartBasketballLagServer()
    if not shouldPlayerBeLagged() then return end
    
    BasketballLagServer = true
    BasketballLagThread = task.spawn(function()
        while BasketballLagServer do
            fireclickdetector(workspace.WorkspaceCom["001_GiveTools"].Basketball.ClickDetector)
            local args = {
                Vector3.new(-154.34115600585938, 4.365168571472168, 97.59996795654297)
            }
            for _, tool in ipairs(player.Character:GetChildren()) do
                if tool:IsA("Tool") and tool:FindFirstChild("ClickEvent") then
                    tool.ClickEvent:FireServer(unpack(args))
                end
            end
            task.wait()
        end
    end)
end

function StopBasketballLagServer()
    BasketballLagServer = false
    if BasketballLagThread then
        task.cancel(BasketballLagThread)
        BasketballLagThread = nil
    end
end

local GhostHunterLagServer = false
local GhostHunterLagThread = nil

function StartGhostHunterLagServer()
    if not shouldPlayerBeLagged() then return end
    
    GhostHunterLagServer = true
    GhostHunterLagThread = task.spawn(function()
        while GhostHunterLagServer do
            fireclickdetector(workspace.WorkspaceCom["001_GiveTools"].GhostMeter.ClickDetector)
            task.wait(0.01)
        end
    end)
end

function StopGhostHunterLagServer()
    GhostHunterLagServer = false
    if GhostHunterLagThread then
        task.cancel(GhostHunterLagThread)
        GhostHunterLagThread = nil
    end
end

local BookLagServer = false
local BookLagThread = nil

local function clickNormally(object)
    local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
    if clickDetector then
        fireclickdetector(clickDetector)
    end
end

function StartBookLagServer()
    if not shouldPlayerBeLagged() then return end
    
    BookLagServer = true
    BookLagThread = task.spawn(function()
        while BookLagServer do
            local bookPath = workspace.WorkspaceCom["001_GiveTools"]:FindFirstChild("Book")
            if bookPath then
                player.Character.HumanoidRootPart.CFrame = bookPath.CFrame
                clickNormally(bookPath)
            end
            task.wait(0.01)
        end
    end)
end

function StopBookLagServer()
    BookLagServer = false
    if BookLagThread then
        task.cancel(BookLagThread)
        BookLagThread = nil
    end
end

function StartStretcherLagServer()
    if not shouldPlayerBeLagged() then return end
    
    StretcherLagActive = true
    StretcherLagThread = task.spawn(function()
        while StretcherLagActive do
            duplicarStretcher()
            task.wait(0.001)
        end
    end)
end

function StopStretcherLagServer()
    StretcherLagActive = false
    if StretcherLagThread then
        task.cancel(StretcherLagThread)
        StretcherLagThread = nil
    end
end

function StartFireXLagServer()
    if not shouldPlayerBeLagged() then return end
    
    FireXLagActive = true
    FireXLagThread = task.spawn(function()
        while FireXLagActive do
            duplicarFireX()
            task.wait(0.001)
        end
    end)
end

function StopFireXLagServer()
    FireXLagActive = false
    if FireXLagThread then
        task.cancel(FireXLagThread)
        FireXLagThread = nil
    end
end

function StartLag()
    if LagActive then return end
    if not shouldPlayerBeLagged() then return end
    
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    
    LastCFrame = player.Character.HumanoidRootPart.CFrame
    
    if CurrentLagType == "Phone" then
        if getgenv()._PhoneLagServerRunning then return end
        getgenv()._PhoneLagServerRunning = true
        
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-117, 20, 255)
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        task.wait(1)
        if not getgenv()._PhoneLagServerRunning then return end
        fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialPlot1Buttons.Commercial1Store1.ClickDetector)
        task.wait(1)
        if not getgenv()._PhoneLagServerRunning then return end
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-117, 20, 255)
        StartPhoneLagServer()
        
    elseif CurrentLagType == "Laptop" then
        if getgenv()._LaptopLagServerRunning then return end
        getgenv()._LaptopLagServerRunning = true
        
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-117, 20, 255)
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        task.wait(1)
        if not getgenv()._LaptopLagServerRunning then return end
        fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialPlot1Buttons.Commercial1Store1.ClickDetector)
        task.wait(1)
        if not getgenv()._LaptopLagServerRunning then return end
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-117, 20, 255)
        StartLaptopLagServer()
        
    elseif CurrentLagType == "Phone and Laptop" then
        if getgenv()._PhoneLaptopLagServerRunning then return end
        getgenv()._PhoneLaptopLagServerRunning = true
        
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-123.742, 20.074, 251.402)
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        task.wait(1)
        if not getgenv()._PhoneLaptopLagServerRunning then return end
        fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialPlot1Buttons.Commercial1Store1.ClickDetector)
        task.wait(1)
        if not getgenv()._PhoneLaptopLagServerRunning then return end
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-123.742, 20.074, 251.402)
        StartPhoneLaptopLagServer()
        
    elseif CurrentLagType == "Basketball" then
        if getgenv()._BasketballLagServerRunning then return end
        getgenv()._BasketballLagServerRunning = true
        
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-135, 3, 85)
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        workspace.Gravity = 5
        StartBasketballLagServer()
        
    elseif CurrentLagType == "Ghost Hunter" then
        if getgenv()._GhostHunterLagServerRunning then return end
        getgenv()._GhostHunterLagServerRunning = true
        
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-320.216, 7.4, -112.32)
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        StartGhostHunterLagServer()
        
    elseif CurrentLagType == "Book" then
        if getgenv()._BookLagServerRunning then return end
        getgenv()._BookLagServerRunning = true
        
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        StartBookLagServer()
        
    elseif CurrentLagType == "Stretcher" then
        if getgenv()._StretcherLagServerRunning then return end
        getgenv()._StretcherLagServerRunning = true
        
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        StartStretcherLagServer()
        
    elseif CurrentLagType == "FireX" then
        if getgenv()._FireXLagServerRunning then return end
        getgenv()._FireXLagServerRunning = true
        
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        StartFireXLagServer()
        
    elseif CurrentLagType == "Bomb" then
        if getgenv()._BombLagServerRunning then return end
        getgenv()._BombLagServerRunning = true
        
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        BombLag(true)
    end
    
    LagActive = true
end

function StopLag()
    if not LagActive then return end
    
    if CurrentLagType == "Phone" then
        StopPhoneLagServer()
        getgenv()._PhoneLagServerRunning = false
        
    elseif CurrentLagType == "Laptop" then
        StopLaptopLagServer()
        getgenv()._LaptopLagServerRunning = false
        
    elseif CurrentLagType == "Phone and Laptop" then
        StopPhoneLaptopLagServer()
        getgenv()._PhoneLaptopLagServerRunning = false
        
    elseif CurrentLagType == "Basketball" then
        StopBasketballLagServer()
        workspace.Gravity = 196.2
        getgenv()._BasketballLagServerRunning = false
        
    elseif CurrentLagType == "Ghost Hunter" then
        StopGhostHunterLagServer()
        getgenv()._GhostHunterLagServerRunning = false
        
    elseif CurrentLagType == "Book" then
        StopBookLagServer()
        getgenv()._BookLagServerRunning = false
        
    elseif CurrentLagType == "Stretcher" then
        StopStretcherLagServer()
        getgenv()._StretcherLagServerRunning = false
        
    elseif CurrentLagType == "FireX" then
        StopFireXLagServer()
        getgenv()._FireXLagServerRunning = false
        
    elseif CurrentLagType == "Bomb" then
        BombLag(false)
        getgenv()._BombLagServerRunning = false
    end
    
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 16
        player.Character.Humanoid.JumpPower = 50
    end
    
    if LastCFrame and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = LastCFrame
    end
    
    LagActive = false
end

player.CharacterAdded:Connect(function()
    LagActive = false
    LastCFrame = nil
    getgenv()._PhoneLagServerRunning = false
    getgenv()._LaptopLagServerRunning = false
    getgenv()._PhoneLaptopLagServerRunning = false
    getgenv()._BasketballLagServerRunning = false
    getgenv()._GhostHunterLagServerRunning = false
    getgenv()._BookLagServerRunning = false
    getgenv()._StretcherLagServerRunning = false
    getgenv()._FireXLagServerRunning = false
    getgenv()._BombLagServerRunning = false
end)


Tabs.LG:AddDropdown({
    Title = "Selecione Tipo de lag",
    Description = "Selecionar o tipo de lag",
    Options = {"Phone", "Laptop", "Phone and Laptop", "Basketball", "Ghost Hunter", "Book", "Stretcher", "FireX", "Bomb"},
    Multi = false,
    Default = 1,
    Callback = function(Value)
        if LagActive then
            StopLag()
        end
        CurrentLagType = Value
    end
})

Tabs.LG:AddToggle({
    Title = "ATIVA",
    Description = "",
    Default = false,
    Callback = function(Value)
        if Value then
            StartLag()
        else
            StopLag()
        end
    end
})

Tabs.LG:AddSection({"Alvos Do Lags v1"})

local TargetPlayerName = ""
local TargetLagMethod = "Phone"
local TargetLagActive = false
local TargetLagThread = nil
local PlayerList = {}

local function UpdatePlayerList()
    PlayerList = {}
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            table.insert(PlayerList, player.Name)
        end
    end
    return PlayerList
end

local function StartTargetLag()
    if TargetLagActive or TargetPlayerName == "" then return end
    
    local targetPlayer = game.Players:FindFirstChild(TargetPlayerName)
    if not targetPlayer then return end
    
    TargetLagActive = true
    
    if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
        TargetLagActive = false
        return
    end
    
    LastCFrame = player.Character.HumanoidRootPart.CFrame
    
    if TargetLagMethod == "Phone" or TargetLagMethod == "Laptop" or TargetLagMethod == "Phone and Laptop" then
        if TargetLagMethod == "Phone and Laptop" then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-123.742, 20.074, 251.402)
        else
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-117, 20, 255)
        end
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        task.wait(1)
        if not TargetLagActive then return end
        fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialPlot1Buttons.Commercial1Store1.ClickDetector)
        task.wait(1)
        if not TargetLagActive then return end
        if TargetLagMethod == "Phone and Laptop" then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-123.742, 20.074, 251.402)
        else
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-117, 20, 255)
        end
    elseif TargetLagMethod == "Basketball" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-135, 3, 85)
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
        workspace.Gravity = 5
    elseif TargetLagMethod == "Ghost Hunter" then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-320.216, 7.4, -112.32)
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
    elseif TargetLagMethod == "Book" then
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
    elseif TargetLagMethod == "Stretcher" or TargetLagMethod == "FireX" then
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
    elseif TargetLagMethod == "Bomb" then
        player.Character.Humanoid.WalkSpeed = 0
        player.Character.Humanoid.JumpPower = 0
    end
    
    TargetLagThread = task.spawn(function()
        while TargetLagActive do
            local currentTarget = game.Players:FindFirstChild(TargetPlayerName)
            if not currentTarget then
                break
            end
            
            if TargetLagMethod == "Phone" then
                fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools.Iphone.ClickDetector)
            elseif TargetLagMethod == "Laptop" then
                fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools.Laptop.ClickDetector)
            elseif TargetLagMethod == "Phone and Laptop" then
                fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools:GetChildren()[3].ClickDetector)
                task.wait(0.1)
                fireclickdetector(workspace.WorkspaceCom["001_CommercialStores"].CommercialStorage1.Store.Tools.Laptop.ClickDetector)
            elseif TargetLagMethod == "Basketball" then
                fireclickdetector(workspace.WorkspaceCom["001_GiveTools"].Basketball.ClickDetector)
                task.wait(0.1)
                local args = {
                    Vector3.new(-154.34115600585938, 4.365168571472168, 97.59996795654297)
                }
                if player.Character then
                    for _, tool in ipairs(player.Character:GetChildren()) do
                        if tool:IsA("Tool") and tool:FindFirstChild("ClickEvent") then
                            tool.ClickEvent:FireServer(unpack(args))
                        end
                    end
                end
            elseif TargetLagMethod == "Ghost Hunter" then
                fireclickdetector(workspace.WorkspaceCom["001_GiveTools"].GhostMeter.ClickDetector)
            elseif TargetLagMethod == "Book" then
                local bookPath = workspace.WorkspaceCom["001_GiveTools"]:FindFirstChild("Book")
                if bookPath then
                    player.Character.HumanoidRootPart.CFrame = bookPath.CFrame
                    clickNormally(bookPath)
                end
            elseif TargetLagMethod == "Stretcher" then
                duplicarStretcher()
            elseif TargetLagMethod == "FireX" then
                duplicarFireX()
            elseif TargetLagMethod == "Bomb" then
                local Bomb = workspace:WaitForChild("WorkspaceCom"):WaitForChild("001_CriminalWeapons"):WaitForChild("GiveTools"):WaitForChild("Bomb")
                if Bomb and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character.HumanoidRootPart.CFrame = Bomb.CFrame
                    fireclickdetector(Bomb.ClickDetector)
                end
            end
            
            task.wait(0.01)
        end
    end)
end

local function StopTargetLag()
    TargetLagActive = false
    if TargetLagThread then
        task.cancel(TargetLagThread)
        TargetLagThread = nil
    end
    
    if TargetLagMethod == "Basketball" then
        workspace.Gravity = 196.2
    end
    
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = 16
        player.Character.Humanoid.JumpPower = 50
    end
    
    if LastCFrame and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = LastCFrame
    end
end

UpdatePlayerList()

local lagsv = Tabs.LG:AddDropdown({
    Title = Translator:traduzir("Selecione Jogador"),
    Description = Translator:traduzir("Escolha qual jogador ficará para trás"),
    Options = PlayerList,
    Default = "Players",
    Callback = function(Value)
        if TargetLagActive then
            StopTargetLag()
        end
        TargetPlayerName = Value
    end
})

local dropdon = Tabs.LG:AddDropdown({
    Title = "Selecionar um método",
    Description = Translator:traduzir("Selecione um método para Laga a pessoa"),
    Options = {"Phone", "Laptop", "Phone and Laptop", "Basketball", "Ghost Hunter", "Book", "Stretcher", "FireX", "Bomb"},
    Default = "Method",
    Callback = function(Value)
        if TargetLagActive then
            StopTargetLag()
        end
        TargetLagMethod = Value
    end
})

Tabs.LG:AddToggle({
    Name = Translator:traduzir("Visualizar Jogador"),
    Description = Translator:traduzir("Acompanha o jogador com a câmera"),
    Default = false,
    Callback = function(value)
                local function UpdateCamera()
            local targetPlayer = value and Players:FindFirstChild(TargetLagActive)
            local subject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
            
            if targetPlayer and targetPlayer.Character then
                subject = targetPlayer.Character:FindFirstChild("Humanoid")
            end
            
            if subject then Camera.CameraSubject = subject end
        end

        if value then
            if not getgenv().CameraConnection then
                getgenv().CameraConnection = RunService.Heartbeat:Connect(UpdateCamera)
            end
        else
            if getgenv().CameraConnection then
                getgenv().CameraConnection:Disconnect()
                getgenv().CameraConnection = nil
            end
            UpdateCamera()
        end
    end
})

Tabs.LG:AddButton({
    Name = Translator:traduzir("Atualizar Jogadores"),
    Callback = function()
        local lista = {}
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= LocalPlayer then
                table.insert(lista, v.Name)
            end
        end
        lagsv:Set(lista)
    end
})

Tabs.LG:AddToggle({
    Title = "Lag Player",
    Description = Translator:traduzir("Apos seleciona use essa função"),
    Default = false,
    Callback = function(Value)
        if Value then
            if TargetPlayerName ~= "" then
                StartTargetLag()
            end
        else
            StopTargetLag()
        end
    end
})

Tabs.LG:AddSection({Translator:traduzir("Lag Geral e uma pessoa")})

local selectedTarget = nil
local shootingLog = {}

local DripBug = Tabs.LG:AddDropdown({
    Name = Translator:traduzir("Selecione Uma Pessoa"),
    Description = Translator:traduzir("Selecionar uma pessoa primeiro"),
    Options = {},
    Default = "Players",
    Callback = function(name)
        selectedTarget = Players:FindFirstChild(name)
    end
})

local IgnoreDropdown = Tabs.LG:AddDropdown({
    Name = Translator:traduzir("Quem não será bugado?"),
    Description = Translator:traduzir("Escolhar um jogador pra não toma bugue server"),
    Options = {},
    Default = "Players",
    Callback = function(nome)
        ignoreTarget = Players:FindFirstChild(nome)
    end
})

Tabs.LG:AddButton({
    Name = Translator:traduzir("Atualizar lista"),
    Callback = function()
        local lista = {}
        for _, v in ipairs(Players:GetPlayers()) do
            if v ~= LocalPlayer then
                table.insert(lista, v.Name)
            end
        end
        DripBug:Set(lista)
        IgnoreDropdown:Set(lista)
    end
})

local function createBugArgs(target)
    local gunScript = LocalPlayer.Backpack.Assault.GunScript_Local
    return {
        target.HumanoidRootPart,
        target.HumanoidRootPart,
        Vector3.new(100000000376832, 100000000376832, 100000000376832),
        target.HumanoidRootPart.Position,
        gunScript.MuzzleEffect,
        gunScript.HitEffect,
        0, 0,
        {false},
        {25, Vector3.new(100, 100, 100), BrickColor.new(29), 0.25, Enum.Material.SmoothPlastic, 0.25},
        true,
        false
    }
end

Tabs.LG:AddToggle({
    Name = Translator:traduzir("Bugar Jogador <Selecionado>"),
    Description = Translator:traduzir("Ativa o bug e pega Assault automaticamente"),
    Default = false,
    Callback = function(value)
        fireLoopActive = value

        if fireLoopActive then
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Assault")
            
            task.spawn(function()
                repeat task.wait(0.1) until
                    LocalPlayer.Backpack:FindFirstChild("Assault") and
                    LocalPlayer.Backpack.Assault:FindFirstChild("GunScript_Local") and
                    LocalPlayer.Backpack.Assault.GunScript_Local:FindFirstChild("MuzzleEffect") and
                    LocalPlayer.Backpack.Assault.GunScript_Local:FindFirstChild("HitEffect")

                while fireLoopActive and selectedTarget and selectedTarget.Character and 
                      selectedTarget.Character:FindFirstChild("HumanoidRootPart") do
                    
                    local args = createBugArgs(selectedTarget.Character)
                    table.insert(shootingLog, {
                        time = os.time(),
                        target = selectedTarget.Name,
                        position = tostring(selectedTarget.Character.HumanoidRootPart.Position)
                    })
                    ReplicatedStorage.RE:FindFirstChild("1Gu1n"):FireServer(unpack(args))
                    task.wait(0.02)
                end
            end)
            else
            local args = { [1] = "ClearAllTools" }
            ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
        end
    end
})
Tabs.LG:AddToggle({
    Name = Translator:traduzir("Bugar Servidor <Players>"),
    Description = Translator:traduzir("Buga geral menos você, é só assistir"),
    Default = false,
    Callback = function(ativado)
        fireLoopActiveServer = ativado

        if fireLoopActiveServer then
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Assault")

            task.spawn(function()
                repeat task.wait(0.1) until
                    LocalPlayer.Backpack:FindFirstChild("Assault") and
                    LocalPlayer.Backpack.Assault:FindFirstChild("GunScript_Local") and
                    LocalPlayer.Backpack.Assault.GunScript_Local:FindFirstChild("MuzzleEffect") and
                    LocalPlayer.Backpack.Assault.GunScript_Local:FindFirstChild("HitEffect")

                while fireLoopActiveServer do
                    for _, alvo in ipairs(Players:GetPlayers()) do
                        if alvo ~= LocalPlayer and alvo ~= ignoreTarget and 
                           alvo.Character and alvo.Character:FindFirstChild("HumanoidRootPart") then
                            
                            local args = createBugArgs(alvo.Character)
                            ReplicatedStorage.RE:FindFirstChild("1Gu1n"):FireServer(unpack(args))
                            task.wait(0.001)
                        end
                    end
                end
            end)
        else
            local args = { [1] = "ClearAllTools" }
            ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
        end
    end
})
end
do
    
Tabs.LG:AddSection({Translator:traduzir("Painel De Lags V3")})
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local heartbeatConnection = nil
local selectedName = "Common"

local lagTargets = {
    ["Common"] = true,
    ["Burger Tray"] = "WorkspaceCom.001_GiveTools.BurgerTray",
    ["Bomb"] = "WorkspaceCom.001_CriminalWeapons.GiveTools.Bomb",
    ["Laptop"] = "WorkspaceCom.001_GiveTools.Laptop",
    ["Paper Bag"] = "WorkspaceCom.001_GiveTools.Paperbag",
   -- ["Chips"] = "WorkspaceCom.001_GiveTools.Chips",
  --  ["Ice Cream"] = "WorkspaceCom.001_GiveTools.Icecream",
  --  ["Taser"] = "WorkspaceCom.001_GiveTools.Taser",
    ["Basketball"] = "WorkspaceCom.001_GiveTools.Basketball",
    ["FireX"] = "WorkspaceCom.001_GiveTools.FireX",
    ["Ladder"] = "WorkspaceCom.001_GiveTools.Ladder",
    ["Ghost Meter"] = "WorkspaceCom.001_GiveTools.GhostMeter",
    ["Clipboard"] = "WorkspaceCom.001_GiveTools.ClipBoard",
    ["Stretcher"] = "WorkspaceCom.001_GiveTools.Stretcher",
    ["Glock"] = "WorkspaceCom.001_CriminalWeapons.GiveTools.Glock",
    ["Electric Guitar"] = "WorkspaceCom.001_GiveTools.ElectricGuitar",
    ["Guitar"] = "WorkspaceCom.001_GiveTools.Guitar", 
    ["Book"] = "WorkspaceCom.001_GiveTools.Book", 
    ["Box"] = "WorkspaceCom.001_GiveTools.Box",
--   ["Frap Strawberry"] = "WorkspaceCom.001_GiveTools.FrapStrawberry",
--    ["Bank Keycard"] = "WorkspaceCom.001_GiveTools.BankKeyCard",
--    ["White Keycard"] = "WorkspaceCom.001_GiveTools.KeyCardWhite",
--    ["Mop"] = "WorkspaceCom.001_GiveTools.Mop",
    ["Iphone"] = "WorkspaceCom.001_GiveTools.Iphone",
    ["Ipad"] = "WorkspaceCom.001_GiveTools.Ipad"
}

local function getTargetFromString(pathStr)
    local ok, result = pcall(function()
        local current = Workspace
        for _, part in ipairs(string.split(pathStr, ".")) do
            current = current:FindFirstChild(part)
            if not current then return nil end
        end
        return current
    end)
    return ok and result or nil
end

local function spamClickFast(obj)
    if not obj or not obj:IsA("BasePart") then return end
    local detector = obj:FindFirstChildWhichIsA("ClickDetector")
    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

    if detector and hrp then
        hrp.CFrame = obj.CFrame + Vector3.new(0, 1.5, 0)
        for _ = 1, 105 do
            task.spawn(function()
                pcall(fireclickdetector, detector)
            end)
        end
    end

    if obj.Name == "Basketball" then
        local tool = LocalPlayer.Character:FindFirstChild("Basketball")
        local remote = tool and tool:FindFirstChild("ClickEvent")
        if remote then
            remote:FireServer(Vector3.new(-148.004, 0.4, 79.921))
        end
    end
end

local options = {}
for name in pairs(lagTargets) do
    table.insert(options, name)
end
table.sort(options, function(a, b) return a == "Common" or (a < b and b ~= "Common") end)

local Dropdown = Tabs.LG:AddDropdown({
    Name = Translator:traduzir("Selecione Método de lags"),
    Description = Translator:traduzir("Novos métodos de lags dripsolutions"),
    Options = options,
    Default = "Common",
    Flag = "LagTargetDropdown",
    Callback = function(selected)
        selectedName = selected
    end
})

local Toggle = Tabs.LG:AddToggle({
    Name = Translator:traduzir("Começa Lags"), 
    Description = "Ativa Onlag apos seleciona um metodo",
    Default = false
})

Toggle:Callback(function(state)
    if heartbeatConnection then
        heartbeatConnection:Disconnect()
        heartbeatConnection = nil
    end

    if not state then return end

    if selectedName == "Common" then
        local list = {}
        for _, path in pairs(lagTargets) do
            if path ~= true then
                table.insert(list, path)
            end
        end
        local i = 1
        local currentObj = getTargetFromString(list[i])
        local lastSwitch = tick()

        heartbeatConnection = RunService.Heartbeat:Connect(function()
            if tick() - lastSwitch >= 0.5 then
                i = (i % #list) + 1
                currentObj = getTargetFromString(list[i])
                lastSwitch = tick()
            end
            if currentObj then spamClickFast(currentObj) end
        end)

    else
        local obj = getTargetFromString(lagTargets[selectedName])
        heartbeatConnection = RunService.Heartbeat:Connect(function()
            if obj then spamClickFast(obj) end
        end)
    end
end)




end
-----------------///////TABS - AD///////-----------------
do
local AudioManager = {}
local TROLL_AUDIOS = {
    {name = "Get Out", id = 18900008907},
    {name = "Gato Sorrindo", id = 8449305114},
    {name = "Windows Error", id = 2661731024},
    {name = "Among Us din", id = 6651571134},
    {name = "Nojo", id = 103440368630269},
    {name = "Vai Lava Prato", id = 101232400175829},
    {name = "Vai Toma Jack", id = 132603645477541},
    {name = "Pede Ifood", id = 133843750864059},
    {name = "I Ghost The Down", id = 84663543883498},
    {name = "ShoopeCheck", id = 8747441609},
    {name = "Kudasai Ain", id = 108494476595033},
    {name = "Ave Maria", id = 128669424001766},
    {name = "Carro do Danone", id = 110493863773948},
    {name = "Sonic do mal", id = 2496367477},
    {name = "Risada Da Bruxa", id = 116214940486087},
    {name = "Wiaaanrrr", id = 88332347208779},
    {name = "Chegaaaaa", id = 77405864184828},
    {name = "Aí Meu Cuzinhorrr", id = 130714479795369},
    {name = "Zé da Mangá", id = 106624090319571},
    {name = "Aiii Alexandre M.", id = 107261471941570},
    {name = "Sorrir Auto", id = 76067381821846},
    {name = "GOGOGGOGO", id = 103262503950995},
    {name = "Toma Jack no Sol", id = 97476487963273},
    {name = "Tá Querendo Ram", id = 94395705857835},
    {name = "Hoje Vou Ser Tua Mulher", id = 90844637105538},
    {name = "Vc Tá Fudido", id = 120214772725166},
    {name = "Rojão Chiiiin", id = 6549021381},
    {name = "Posso Te Ligar Agora", id = 103211341252816},
    {name = "Cadê o Zé Gotinha?", id = 86012585992725},
    {name = "A Pia Cheia de Louça", id = 98076927129047},
    {name = "Olha Mensagemmmmm", id = 121668429878811},
    {name = "Olha um Pé de Siriguela", id = 112804043442210},
    {name = "Vai Corinthians", id = 127012936767471},
    {name = "Manda o Papo", id = 134699681156023},
    {name = "Direitos Autorais", id = 93414656438796},
    {name = "Vai Perdeu Tira Calcinha!", id = 102788826091273},
    {name = "Primo Eduardo", id = 107112539171307},
    {name = "Manda a Fotinha", id = 90992376085736},
    {name = "O Dinheiro Seu Corno", id = 101481458650889},
    {name = "Toma Toma", id = 131646665531667},
    {name = "Cachorro Bravo", id = 17732575062},
    {name = "E o Pix", id = 113831443375212},
    {name = "Um Cavo de 3 Pernas", id = 8164241439},
    {name = "Off the King", id = 71153532555470},
    {name = "Plankton AAAAAAAAN", id = 95982351322190},
    {name = "Oh My God", id = 73349649774476},
    {name = "Todo Mundo Ser FD", id = 136804576009416},
    {name = "Nobru Apelão", id = 77627828376120},
    {name = "Muito Afiado", id = 130905328878700},
    {name = "Bosta!!!", id = 8430024127},
    {name = "Vai Lava Prato", id = 101232400175829},
    {name = "I Ghost The Down", id = 84663543883498},
    {name = "Seloko Num Compensa", id = 78442476709262}
}

local LOUD_AUDIOS = {
    {name = "Scream", id = 9073793467},
    {name = "Kid Scream", id = 17446497097},
    {name = "Fall Angel Scream", id = 142539051},
    {name = "Death Scream", id = 106702821521306},    
    {name = "Og Scream", id = 80156405968805}, 
    {name = "Sonic.exe Scream New", id = 930613220},
    {name = "Indra Laugh", id = 178038408},    
    {name = "Audio Glitcher Sound Old", id = 7236490488},    
    {name = "Oof Sound", id = 6598984092},    
    {name = "Buuuh Sound", id = 83788010495185},    
    {name = "Laugh Sound", id = 123106903091799},    
    {name = "Jason..", id = 96381698372079},    
    {name = "Quero CafÃ©..", id = 113702985238621},    
    {name = "Jumpscare sfx", id = 85271883712040},
    {name = "Fnaf 1 Jumpscare", id = 6982454389},
    {name = "Granny Jumpscare", id = 1592934514},
    {name = "Loud Jumpscare", id = 8819324666},
    {name = "Anônimo", id = 5710016194},
    {name = "Troll Laugh", id = 73753120048787},  
    {name = "Skull's Laugh", id = 78836790233075},    
    {name = "Laugh Noli", id = 126967668249129},    
    {name = "C00lkid No Fear!", id = 126083075694948},    
    {name = "C00lkid Hahaha", id = 102348131944238},    
    {name = "SirenHead", id = 5681392074},    
    {name = "Tubers93", id = 103215672097028},    
    {name = "Alt Horroroso", id = 85435253347146},
    {name = "Mega Áudio", id = 6855150757},
    {name = "Ruim", id = 120034877160791},
    {name = "Care2", id = 110637995610528},
    {name = "Ahahahaha", id = 7772283448},
    {name = "Maikw", id = 18786647417},
    {name = "Hit", id = 7129073354},
    {name = "Nuclear", id = 675587093},
    {name = "Potência", id = 7520729342},
    {name = "Cinema", id = 91412024101709},
    {name = "Estora Tímpano", id = 268116333},
    {name = "AIIIIM", id = 106835463235574},
    {name = "The Boiled One", id = 137177653817621},
    {name = "OLK Detected", id = 9068077052},
    {name = "TNT", id = 80156405968805},
    {name = "Ououou", id = 9084006093},
    {name = "Amgs", id = 6651571134},
    {name = "Ahm", id = 6701126635},
    {name = "SuperGrito", id = 5853668794},
    {name = "UHHHHH", id = 7056720271},
    {name = "Hihihi Suss", id = 7153419575},
    {name = "Sonic do Mal", id = 2496367477},
    {name = "Tubers93 1", id = 270145703},
    {name = "Tubers93 2", id = 18131809532},
    {name = "John's Laugh", id = 130759239},
    {name = "GritoSS", id = 80156405968805},
    {name = "Sus Audio", id = 7705506391}
}

function AudioManager.new()
    local self = {}
    self.selectedTrollAudio = nil
    self.selectedLoudAudio = nil
    self.trollLoop = false
    self.loudLoop = false
    self.fastLoop = false
    self.DEFAULT_VOLUME = 1
    self.LOOP_WAIT_TIME = 1
    self.FAST_LOOP_WAIT_TIME = 0.03
    self.DEFAULT_LOUD_AUDIO = 6314880174
    
    local function createSound(audioId, parent, volume)
        volume = volume or self.DEFAULT_VOLUME
        parent = parent or LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        
        if not parent then
            warn("nn achado")
            return nil
        end
        
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. tostring(audioId)
        sound.Volume = volume
        sound.Parent = parent
        
        return sound
    end
    
    local function fireServerAudio(audioId)
        local soundEvent = ReplicatedStorage:FindFirstChild("RE")
        if soundEvent then
            local gunSoundEvent = soundEvent:FindFirstChild("1Gu1nSound1s")
            if gunSoundEvent then
                local success, err = pcall(function()
                    gunSoundEvent:FireServer(Workspace, audioId, self.DEFAULT_VOLUME)
                end)
                
                if not success then
                    warn("Erro ao reproduzir áudio no servidor: " .. tostring(err))
                end
            else
                warn("Evento de som não encontrado")
            end
        else
            warn("ReplicatedStorage.RE não encontrado")
        end
    end
    
    function self:playAudio(audioId, playOnServer)
        if not audioId then
            warn("ID de áudio não especificado")
            return
        end
        
        if playOnServer then
            fireServerAudio(audioId)
        end
        
        local sound = createSound(audioId)
        if sound then
            sound:Play()

            sound.Ended:Connect(function()
                sound:Destroy()
            end)
        end
    end
    
    function self:playClientSideAudio(audioId)
        local audioFolder = Workspace:FindFirstChild("Audio all client")
        if not audioFolder then
            audioFolder = Instance.new("Folder")
            audioFolder.Name = "Audio all client"
            audioFolder.Parent = Workspace
        end
        
        local sound = createSound(audioId, audioFolder)
        if sound then
            sound.Looped = false
            sound:Play()
            
            task.spawn(function()
                task.wait(1)
                if sound and sound.Parent then
                    sound:Destroy()
                end
            end)
        end
    end
    
    function self:startTrollLoop()
        if not self.selectedTrollAudio then
            warn("Nenhum áudio de troll selecionado")
            return
        end
        
        self.trollLoop = true
        task.spawn(function()
            while self.trollLoop do
                self:playAudio(self.selectedTrollAudio, true)
                task.wait(self.LOOP_WAIT_TIME)
            end
        end)
    end
    
    function self:stopTrollLoop()
        self.trollLoop = false
    end
    
    function self:startLoudLoop()
        if not self.selectedLoudAudio then
            warn("Nenhum áudio estourado selecionado")
            return
        end
        
        self.loudLoop = true
        task.spawn(function()
            while self.loudLoop do
                self:playAudio(self.selectedLoudAudio, true)
                task.wait(self.LOOP_WAIT_TIME)
            end
        end)
    end
    
    function self:stopLoudLoop()
        self.loudLoop = false
    end
    
    function self:startFastLoop()
        self.fastLoop = true
        task.spawn(function()
            while self.fastLoop do
                fireServerAudio(self.DEFAULT_LOUD_AUDIO)
                task.spawn(function()
                    self:playClientSideAudio(self.DEFAULT_LOUD_AUDIO)
                end)
                task.wait(self.FAST_LOOP_WAIT_TIME)
            end
        end)
    end
    
    function self:stopFastLoop()
        self.fastLoop = false
    end
    
    function self:setSelectedTrollAudio(audioId)
        self.selectedTrollAudio = audioId
    end
    
    function self:setSelectedLoudAudio(audioId)
        self.selectedLoudAudio = audioId
    end
    
    return self
end

local function extractAudioNames(audioList)
    local names = {}
    for _, audio in ipairs(audioList) do
        table.insert(names, audio.name)
    end
    return names
end

local function findAudioById(audioList, name)
    for _, audio in ipairs(audioList) do
        if audio.name == name then
            return audio.id
        end
    end
    return nil
end

local audioManager = AudioManager.new()

local trollAudioNames = extractAudioNames(TROLL_AUDIOS)
local loudAudioNames = extractAudioNames(LOUD_AUDIOS)

Tabs.AD:AddSection({Translator:traduzir("Áudios de Trollagem")})
Tabs.AD:AddDropdown({
    Name = Translator:traduzir("Escolher Áudio de Troll"),
    Description = Translator:traduzir("Selecione um áudio para trollar"),
    Options = trollAudioNames,
    Default = "Selecione um áudio",
    Callback = function(value)
        local audioId = findAudioById(TROLL_AUDIOS, value)
        if audioId then
            audioManager:setSelectedTrollAudio(audioId)
        end
    end
})
local audioId
Tabs.AD:AddTextBox({
    Name = Translator:traduzir("Insira o ID do Áudio ou Musica"),
    Description = Translator:traduzir("Digite o ID do áudio"),
    PlaceholderText = "Números",
    Callback = function(value)
        audioId = tonumber(value)
    end
})

Tabs.AD:AddButton({
    Name = Translator:traduzir("Reproduzir Troll"),
    Description = Translator:traduzir("Reproduzir o áudio selecionado uma vez"),
    Callback = function()
        if audioManager.selectedTrollAudio then
            audioManager:playAudio(audioManager.selectedTrollAudio, true)
        else
            warn("Selecione um áudio primeiro!")
        end
    end
})

Tabs.AD:AddToggle({
    Name = Translator:traduzir("Loop de Troll"),
    Description = Translator:traduzir("Repetir continuamente o áudio selecionado"),
    Default = false,
    Callback = function(value)
        if value then
            audioManager:startTrollLoop()
        else
            audioManager:stopTrollLoop()
        end
    end
})

Tabs.AD:AddSection({Translator:traduzir("Áudios Estourados")})

Tabs.AD:AddDropdown({
    Name = Translator:traduzir("Escolher Áudio Estourado"),
    Description = Translator:traduzir("Selecione um áudio estourado"),
    Options = loudAudioNames,
    Default = Translator:traduzir("Selecione um áudio"),
    Callback = function(value)
        local audioId = findAudioById(LOUD_AUDIOS, value)
        if audioId then
            audioManager:setSelectedLoudAudio(audioId)
        end
    end
})

Tabs.AD:AddButton({
    Name = Translator:traduzir("Reproduzir Estourado"),
    Description = Translator:traduzir("Reproduzir o áudio estourado uma vez"),
    Callback = function()
        if audioManager.selectedLoudAudio then
            audioManager:playAudio(audioManager.selectedLoudAudio, true)
        else
            warn("Selecione um áudio primeiro!")
        end
    end
})

Tabs.AD:AddToggle({
    Name = Translator:traduzir("Loop Estourado"),
    Description = Translator:traduzir("Repetir continuamente o áudio estourado"),
    Default = false,
    Callback = function(value)
        if value then
            audioManager:startLoudLoop()
        else
            audioManager:stopLoudLoop()
        end
    end
})

Tabs.AD:AddSection({Translator:traduzir("Configurações Especiais")})

Tabs.AD:AddToggle({
    Name = Translator:traduzir("Áudio Estourado Rápido"),
    Description = Translator:traduzir("Loop ultra rápido do áudio padrão (cuidado!)"),
    Default = false,
    Callback = function(value)
        getgenv().Audio_All_loop_fast = value
        
        if value then
            audioManager:startFastLoop()
        else
            audioManager:stopFastLoop()
        end
    end
})
local antiAudioEnabled = false
local connections = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local blockedAudioIDs = {
    6314880174, 110493863773948, 128137573022197, 88332347208779, 77405864184828,
    130714479795369, 106624090319571, 107261471941570, 76067381821846, 103262503950995,
    97476487963273, 94395705857835, 90844637105538, 120214772725166, 6549021381,
    103211341252816, 86012585992725, 98076927129047, 121668429878811, 112804043442210,
    127012936767471, 134699681156023, 93414656438796, 102788826091273, 107112539171307,
    90992376085736, 101481458650889, 131646665531667, 17732575062, 113831443375212,
    8164241439, 71153532555470, 95982351322190, 73349649774476, 136804576009416,
    77627828376120, 130905328878700, 8430024127, 101232400175829, 84663543883498,
    78442476709262, 5710016194, 85435253347146, 6855150757, 120034877160791,
    110637995610528, 7772283448, 18786647417, 7129073354, 675587093, 7520729342,
    91412024101709, 268116333, 106835463235574, 132603645477541, 133843750864059,
    8747441609, 137177653817621, 128669424001766, 9068077052, 80156405968805,
    9084006093, 6651571134, 6701126635, 5853668794, 7056720271, 7153419575,
    108494476595033, 2496367477, 270145703, 18131809532, 130759239, 7705506391,
    103440368630269
}

local blockedIDsLookup = {}
for _, id in ipairs(blockedAudioIDs) do
    blockedIDsLookup[tostring(id)] = true
    blockedIDsLookup[id] = true
end

local function handleSound(sound)
    if not sound or not sound:IsA("Sound") then return end
    
    local soundId = sound.SoundId
    if soundId then
        local id = soundId:match("(%d+)")
        if id and blockedIDsLookup[id] then
            sound.Volume = 0
            sound:Stop()
            task.wait(0.1)
            pcall(function() sound:Destroy() end)
            return true
        end
    end
    
    return false
end

local function interceptAudioRemote()
    task.spawn(function()
        local gunSoundEvent
        local attempts = 0
        
        repeat
            local RE = ReplicatedStorage:FindFirstChild("RE")
            if RE then
                gunSoundEvent = RE:FindFirstChild("1Gu1nSound1s")
            end
            attempts = attempts + 1
            task.wait(0.5)
        until gunSoundEvent or attempts > 20
        
        if gunSoundEvent and gunSoundEvent:IsA("RemoteEvent") then
            local originalFireServer = gunSoundEvent.FireServer
            gunSoundEvent.FireServer = function(self, ...)
                if antiAudioEnabled then
                    local args = {...}
                    if args[2] and blockedIDsLookup[args[2]] then
                        print("blqueadooo: " .. args[2])
                        return 
                    end
                end
                return originalFireServer(self, ...)
            end
            print(" RemoteEvent achadouuu!")
        end
    end)
end

local function setupLightMonitoring()
    connections.workspaceMonitor = workspace.DescendantAdded:Connect(function(obj)
        if antiAudioEnabled and obj:IsA("Sound") then
            task.wait(0.1)
            handleSound(obj)
        end
    end)
    
    connections.folderMonitor = workspace.ChildAdded:Connect(function(child)
        if antiAudioEnabled and child:IsA("Folder") and child.Name == "Audio all client" then
            child:Destroy()
            print("️ser fude audio")
        end
    end)
end

local function startPeriodicCleanup()
    connections.periodicCleanup = task.spawn(function()
        while antiAudioEnabled do
            task.wait(2)
            if antiAudioEnabled then
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("Sound") then
                        handleSound(obj)
                    end
                end
                
                local audioFolder = workspace:FindFirstChild("Audio all client")
                if audioFolder then
                    audioFolder:Destroy()
                end
            end
        end
    end)
end

local function toggleAntiAudio(enabled)
    antiAudioEnabled = enabled
    
    if enabled then
        interceptAudioRemote()
        setupLightMonitoring()
        startPeriodicCleanup()
        task.spawn(function()
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Sound") then
                    handleSound(obj)
                end
            end
        end)
        
    else
        for _, connection in pairs(connections) do
            if connection then
                if typeof(connection) == "RBXScriptConnection" then
                    connection:Disconnect()
                else
                    task.cancel(connection)
                end
            end
        end
        connections = {}
    end
end

local Toggle = Tabs.AD:AddToggle({
    Name = "Anti - Audios <betaTeste>",
    Description = "Bloqueia apenas áudios trolls específicos", 
    Default = false
})

Toggle:Callback(function(Value)
    toggleAntiAudio(Value)
end)

Tabs.AD:AddSection({Translator:traduzir("Música no Rádio <Game Pass>")})
local selectedMusicDrip = ""

local MusicsListDrip = {
{ Name = "confession", Id = 92992163303925 },
    { Name = "Pac Man Phonk", Id = 120889371113999 },
{ Name = "Trying To finde", Id = 132643763204246 },
{ Name = "Batalla de bombas", Id = 71995582569283 },
{ Name = "Another hiit", Id = 99731755429975 },
{ Name = "Mtg uh uh ha ha", Id = 122697381252723 },
{ Name = "fa3 renitch", Id = 128934903242385 },
{ Name = "Kawaii", Id = 13067828528278 },
{ Name = "Feeling", Id = 120764084521465 },
{ Name = "Aura + Egp", Id = 97841988407875 },
{ Name = "Mtg Balada", Id = 83797836818857 },
{ Name = "tomagi mo tão", Id = 111668097052966 },
{ Name = "mtg terra bela funk", Id = 134770548505933 },
{ Name = "Hard tuff fye", Id = 92979002969874 },
{ Name = "The Twelve", Id = 126153082683694 },
------

{ Name = "beats", Id = 16190782181 },
{ Name = "Samba", Id = 1836175030 },
{ Name = "Samba2", Id = 1838888602 },
{ Name = "Carro de Ovos", Id = 3148329638 },
{ Name = "Banka", Id = 16190784229 },
{ Name = "Essa é Antiga", Id = 90999978343771 },
{ Name = "Essa Aqui é Braba", Id = 120833520065453 },
{ Name = "Help Me Phonk", Id = 72458292563094 },
{ Name = "Envolve A Tropa", Id = 88094479399489 },
{ Name = "No Pick Mulher", Id = 92893359226454 },
{ Name = "Mídia", Id = 105832154444494 },
{ Name = "Phonk Version", Id = 103409297553965 },
{ Name = "Phonk louco", Id = 73140398421340 },
{ Name = "Slowed Vapo No Vapo", Id = 106317184644394 },
{ Name = "Phonk Brasil", Id = 111281710445018 },
{ Name = "No Solinho", Id = 72440232513341 },
{ Name = "Phonk Inglês", Id = 14145624031 },
{ Name = "Ultra Slowed", Id = 84733736048142 },
{ Name = "Ritmada", Id = 104541292443133 },
    { Name = "Hoje Vou Ser Tua Mulher", Id = 90844637105538},
{ Name = "Ritmada Novinha", Id = 94718473830640 },
{ Name = "So de te olha", Id = 74187181906707 },
{ Name = "Não Estou louco", Id = 74366765967475 },
{ Name = "Manda Meu Passinho", Id = 77741294709660 },
{ Name = "Cenário Selvagem", Id = 117562011395992 },
{ Name = "Want To Love", Id = 104846670980072 },
{ Name = "Melodia Virtual", Id = 139147474886402 },
{ Name = "Signora Funk", Id = 123394392737234 },
{ Name = "Blassed Mane", Id = 16831108393 },
{ Name = "Onichan", Id = 17422156627 },
{ Name = "hoodtrap", Id = 73685038553576 },
{ Name = "I love you so", Id = 98364034458260 },
{ Name = "Poze Cv", Id = 124244582950595 },
{ Name = "Trap", Id = 131582258401093 },
{ Name = "Oruan - Sou Teu fã", Id = 85342086082111 },
{ Name = "Soldado Guerreiro", Id = 71590664026646 },
{ Name = "Fuga Na Viatura", Id = 131891110268352 },
{ Name = "forró ja cansou", Id = 74812784884330},
{ Name = "gol contra", Id =  122114766584918},
{ Name = "Anxiety", Id = 101483901475189 },
{ Name = "Grelo So fé", Id = 72200166265935 },
{ Name = "Phonk sexoagressivo", Id = 111995323199676 },
{ Name = "forró da resenha", Id = 120973520531216 },
{ Name = "escolha certa", Id = 107088620814881 },
{ Name = "lembro ate hoje", Id = 71531533552899 },
{ Name = "chinese phonk", Id = 134713831368801 },
{ Name = "Nooo", Id = 73685038553576 },
{ Name = "tuber 93", Id = 1839246711 }
}

local DripRadio = {}
local MusicIds = {}

for _, music in ipairs(MusicsListDrip) do
table.insert(DripRadio, music.Name)
if music.Id then
MusicIds[music.Name] = music.Id
end
end

local Dropdown = Tabs.AD:AddDropdown({
Name = Translator:traduzir("Selecionar Música"),
Description = Translator:traduzir("Toca no rádio via ToolMusicText"),
Options = DripRadio,
Default = "Escolha uma música",
Callback = function(Value)
selectedMusicDrip = Value
end
})

Tabs.AD:AddButton({Translator:traduzir("Tocar Música no Rádio <FM>"), function()
local musicId = MusicIds[selectedMusicDrip]
if musicId then
local args = {
[1] = "ToolMusicText",
[2] = tostring(musicId)
}
game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("PlayerToolEvent", 9e9):FireServer(unpack(args))
end
end })

Tabs.AD:AddButton({Translator:traduzir("Pegar Rádio <FM>"), function()
local args = {
    [1] = "PickingTools";
    [2] = "Boombox";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Too1l", 9e9):InvokeServer(unpack(args))
end })

Tabs.AD:AddButton({Translator:traduzir("Parar Música do Rádio <FM>"), function()
local args = {
[1] = "ToolMusicStop",
[2] = "" 
}
game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("PlayerToolEvent", 9e9):FireServer(unpack(args))
end })
end
-----------------///////TABS - AVT///////-----------------
do
Tabs.AVT:AddSection({Translator:traduzir("Animação & Reset")})
Tabs.AVT:AddButton({Translator:traduzir("Reseta Avatar"), function()
game:GetService("ReplicatedStorage").Remotes.ResetCharacterAppearance:FireServer()
end})
Tabs.AVT:AddButton({Translator:traduzir("Animação home ou muie"), function()
    local args = {
    [1] = 4418326547
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

end})

Tabs.AVT:AddSection({Translator:traduzir("Melhores Partes")})
Tabs.AVT:AddButton({Translator:traduzir("Cabeça Invisível"), function()
    local args = {
    [1] = 134082579
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
end})
Tabs.AVT:AddButton({Translator:traduzir("Machado Escuro"), function()
    local args = {
    [1] = 3240543366
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
end})

Tabs.AVT:AddSection({Translator:traduzir("Sistema de Avatares")})
local Target = nil
local Playestt = Tabs.AVT:AddDropdown({
    Name = Translator:traduzir("Selecionar Jogador"),
    Description = " ",
    Options = {},
    Default = Target,
    Callback = function(Value)
        Target = Value
    end
})

Tabs.AVT:AddSlider({
    Name = Translator:traduzir("Verificação De Parts <Update>"),
    Min = 5,
    Max = 15,
    Increase = 1,
    Default = 25,
    Callback = function(Value)
        print([[funcionndo oooooo]])
    end
})

Tabs.AVT:AddButton({
    Name = Translator:traduzir("Atualizar lista"),
    Callback = function()
        local novaTabela = {}
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= Players.LocalPlayer then
                table.insert(novaTabela, v.Name)
            end
        end
        Playestt:Set(novaTabela)
    end
})  

Tabs.AVT:AddButton({
    Name = Translator:traduzir("Copiar Avatar"),
    Callback = function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

redzlib:Notify({
Title = "Copy Avatar...",
Description = "copying avatar please wait",
Type = "Success",
Duration = 4
})

if not Remotes then
    warn("Pasta Remotes não encontrada.")
    return
end

local function wearItem(id, remotes)
    if not tonumber(id) then return end
    for _, nome in ipairs(remotes) do
        local remote = Remotes:FindFirstChild(nome)
        if remote then
            remote:InvokeServer(tonumber(id))
            task.wait(0.2)
            return true
        end
    end
end

local function safeFire(nome, ...)
    local remote = Remotes:FindFirstChild(nome)
    if remote then
        remote:FireServer(...)
        task.wait(0.2)
    end
end

if not Target then return end

local LP = Players.LocalPlayer
local LChar = LP.Character
local TPlayer = Players:FindFirstChild(Target)

if TPlayer and TPlayer.Character then
    local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
    local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

    if LHumanoid and THumanoid then
        local LDesc = LHumanoid:GetAppliedDescription()

        for _, acc in ipairs(LDesc:GetAccessories(true)) do
            wearItem(acc.AssetId, {"WearAccessory", "Wear"})
        end

        wearItem(LDesc.Shirt, {"WearShirt", "WearOutfit", "Wear"})
        wearItem(LDesc.Pants, {"WearPants", "WearOutfit", "Wear"})
        wearItem(LDesc.Face, {"WearFace", "Wear"})

        local PDesc = THumanoid:GetAppliedDescription()
        local argsBody = {
            [1] = {
                PDesc.Torso or 0,
                PDesc.RightArm or 0,
                PDesc.LeftArm or 0,
                PDesc.RightLeg or 0,
                PDesc.LeftLeg or 0,
                PDesc.Head or 0
            }
        }

        local remoteBody = Remotes:FindFirstChild("ChangeCharacterBody")
        if remoteBody then
            remoteBody:InvokeServer(unpack(argsBody))
            task.wait(0.3)
        else
            warn("RemoteFunction 'ChangeCharacterBody' não encontrado.")
        end

        wearItem(PDesc.Shirt, {"WearShirt", "WearOutfit", "Wear"})
        wearItem(PDesc.Pants, {"WearPants", "WearOutfit", "Wear"})
        wearItem(PDesc.Face, {"WearFace", "Wear"})

        for _, acc in ipairs(PDesc:GetAccessories(true)) do
            wearItem(acc.AssetId, {"WearAccessory", "Wear"})
        end

        wearItem(PDesc.IdleAnimation, {"WearAnimation", "Wear"})

        local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
        if SkinColor then
            safeFire("ChangeBodyColor", tostring(SkinColor.HeadColor))
        end

        local Bag = TPlayer:FindFirstChild("PlayersBag")
        if Bag then
            local function sendText(childName, remoteKey)
                local c = Bag:FindFirstChild(childName)
                if c and c.Value ~= "" then
                    safeFire("RPNameText", remoteKey, c.Value)
                end
            end

            sendText("RPName", "RolePlayName")
            sendText("RPBio", "RolePlayBio")

            if Bag:FindFirstChild("RPNameColor") then
                safeFire("RPNameColor", "PickingRPNameColor", Bag.RPNameColor.Value)
            end
            if Bag:FindFirstChild("RPBioColor") then
                safeFire("RPNameColor", "PickingRPBioColor", Bag.RPBioColor.Value)
            end
        end
    end
end

redzlib:Notify({
Title = "Notification",
Description = "Avatar Successfuly Copied",
Type = "Success",
Duration = 4
})

    end
})

Tabs.AVT:AddSection({Translator:traduzir("Super Heróis <Packs>")})

local roupasCompletas = {
    ["Homen Aranha"] = {14908247332, 16845737664, 17582186503,4211409027, 14840793625, 11774975425, 18507527463, 3346307465},
}

for nome, ids in pairs(roupasCompletas) do
    Tabs.AVT:AddButton({nome, function()
        for _, id in ipairs(ids) do
            local args = { [1] = id }
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
            task.wait(0.5)
        end
    end})
end

local roupasCompletas2 = {
    ["Batma"] = {3049284724, 3049285265, 10647971081, 11977276041},
}

for nome, ids in pairs(roupasCompletas2) do
    Tabs.AVT:AddButton({nome, function()
        for _, id in ipairs(ids) do
            local args = { [1] = id }
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
            task.wait(0.5)
        end
    end})
end

local roupasCompletas = {
    ["ADM <Magnus>"] = {77933716022362,73722333789629,91122615317042},
}

for nome, ids in pairs(roupasCompletas) do
    Tabs.AVT:AddButton({nome, function()
        for _, id in ipairs(ids) do
            local args = { [1] = id }
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
            task.wait(0.5)
        end
    end})
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local function aplicarPackCompleto(idsDeRoupas, corpoParts, corHex)
    for _, id in ipairs(idsDeRoupas) do
        local args = { [1] = id }
        Remotes.Wear:InvokeServer(unpack(args))
        task.wait(0.4)
    end

    if corpoParts then
        local args = {
            [1] = {
                corpoParts[1] or 0,
                corpoParts[2] or 0,
                corpoParts[3] or 0,
                corpoParts[4] or 0,
                corpoParts[5] or 0,
                corpoParts[6] or 0
            }
        }
        Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
        task.wait(0.3)
    end
    if corHex then
        local args = { [1] = corHex }
        Remotes.ChangeBodyColor:FireServer(unpack(args))
    end
end

Tabs.AVT:AddSection({Translator:traduzir("Mulher Bonita <Packs>")})

Tabs.AVT:AddButton({Translator:traduzir("Diva"), function()
    aplicarPackCompleto(
        {11360863184, 17656515587, 18927622972 ,89283403956872, 16040053134, 16899958482, 7074764, 398633812,10767462626},
        {86499666, 86499698, 86499716, 4637243648, 4637242166, 86498113},
        "Pastel brown"
    )
end})

Tabs.AVT:AddButton({Translator:traduzir("Estilosa"), function()
    aplicarPackCompleto(
        {12938939719, 1018553897, 80421353242027, 124139520692742, 16746345026, 107641508206263, 109333206714180, 17577949104, 90353843350916, 16177197399, 144075659},
        {86499666, 86499698, 86499716, 86500078, 86500064, 746767604},
        "Pastel brown"
    )
end})

Tabs.AVT:AddButton({Translator:traduzir("Elegância Rosa-Pastel"), function()
    aplicarPackCompleto(
        {607785314, 144076760, 126583402548463, 13979330180, 17336525832, 88103003332276, 16687323428, 18517084101, 125783616515731, 18105274965, 12548809610, 14708696366, 10907197686, 16945491141, 109260326125093, 17286711891, 619511648, 77427504538679, 8923596632, 619512450, 5319900634, 619512767},
        {86499666, 86499698, 86499716, 86500078, 86500064, 746767604},
        "Cocoa"
    )
end})

Tabs.AVT:AddButton({Translator:traduzir("Hello Kitty"), function()
    aplicarPackCompleto(
        {13173625676, 4899180116,3810243219, 93871285817506,12350578988,16725686557,137102739371519,18197906770, 121124788407780,7343929525,
  12064732367,16860622017,6808475694,150381051,10557360323,4300266038,6055891536,7331163641,607785314,144076760,79519657364119,},
        {86499666,86499698,86499716,4637243648,4637242166,86498113},
        "Black"
    )
end})
Tabs.AVT:AddButton({Translator:traduzir("Girl Y2k"), function()
    aplicarPackCompleto(
        {117962544014646,79090236788624,126490351689789,87525012171586,117202070642397,95833326294342,18257712999,15678185297,17006900288},
        {86499666,86499698,86499716,4637243648,4637242166,86498113},
        "Light orange"
    )
end})
Tabs.AVT:AddButton({Translator:traduzir("Girl v2"), function()
    aplicarPackCompleto(
        {96165808437053,16266670139,138071050651366,14439161358,78467861086741,17331454126,115581513157249,114153430587737,125828421311007,81108098355950,108041588020934,17529187838,130737457414077,12922239190,13481364215,12070660079,16290585600,6962749149,10482501471},
        {86499666,86499698,86499716,4637243648,4637242166,86498113},
        "Light orange"
    )
end})

Tabs.AVT:AddButton({Translator:traduzir("Informações De Uso"), function()
Window:Dialog({
    Title = "Fun",
    Text = Translator:traduzir("•As funções acima já aplicam as roupas completas, portanto, basta apenas modificar o corpo ou a cor."),
    Options = {
        {"Fechar", function()
            
        end}
    }
})
end})
----‐-----////////////up

Tabs.AVT:AddSection({Translator:traduzir("Packs <Masculinos")})
Tabs.AVT:AddButton({Translator:traduzir("E os D <Masculino>"), function()
    aplicarPackCompleto(
        {619544080, 4545294588, 5727822995, 3131092953, 14394019402, 14908247332, 6105519422, 100214234209945, 12655501529, 5315424251, 4378579302, 10569953351, 4078052877, 4508445398, 6070755733, 10159610478, 14159848208, 162068415, 6093227893,},
        {376532000, 376531012, 376530220, 37754710, 139572789, 0},
        "Sun Tan"
    )
end})
Tabs.AVT:AddButton({Translator:traduzir("Clonado de <Masculino>"), function()
    aplicarPackCompleto(
        {619544080, 4545294588, 5727822995, 3131092953, 14394019402, 14908247332, 6105519422, 100214234209945, 12655501529, 5315424251, 4378579302, 10569953351, 4078052877, 4508445398,6070755733, 10159610478, 14159848208, 162068415,6093227893,}, 
        {376532000, 376531012, 376530220, 37754710, 139572789, 0},
        "Pale brown"
    )
end})
Tabs.AVT:AddButton({Translator:traduzir("LOUD <Masculino>"), function()
    aplicarPackCompleto(
        {12300914679, 14711386122, 12134711097, 14250194694, 11093823714, 13620518518, 14610802451, 71760767936397,  3343204006,  10798519329, 109333206714180, 124139520692742, 12930533426, 80039258998314,  855783877, 855776103, 18615036770, 15036817621, 6093229495, 18220511033, 90934633702402}, 
        {376532000, 376531012, 376530220, 37754710, 139572789, 0},
        "Dark nougat"
    )
end})
Tabs.AVT:AddButton({Translator:traduzir("Fino <Masculino>"), function()
    aplicarPackCompleto(
        {80615317017048, 78515624557784, 83728028938556, 15920848733, 117962544014646, 123033387074147,118006629713408, 12887129839,7189083561, 12142438478},
        {376532000, 376531012, 376530220, 37754710, 139572789, 0},
        "Dark nougat"
    )
end})
Tabs.AVT:AddButton({Translator:traduzir("Trajado <Masculino>"), function()
    aplicarPackCompleto(
        {15703568073,18236504983,13479814649,18179500302,18199811960,18863739797,11093817656,12432342407,75844104186976,17162919797,17513707733,82973533809363,75623454441613,12357069856,18538149046,95312255683838,109333206714180,15100020498,18507389298,124139520692742},
        {},
        "Dark nougat"
    )
end})

Tabs.AVT:AddButton({Translator:traduzir("Sem dona <Masculino>"), function()
    aplicarPackCompleto(
        {14762120248,14159814207,18264063859,15153876013,5727822995,15483154656,8966711821,102338622582054,10553396797,4508445398,13620518518,6093226569,12719043468,88040909583438},
        {},
        "Dark nougat"
    )
end})
Tabs.AVT:AddSection({Translator:traduzir("Packs Variados <Conjuntos>")})
Tabs.AVT:AddButton({Translator:traduzir(" Paty Urbana"), function()
    aplicarPackCompleto(
        {11356850323, 11437083587, 11352777399},
        {15539008532, 15539008875, 15539008680, 15539008795, 15539011945, 1},
        "Pastel brown"
    )
end})
Tabs.AVT:AddButton({Translator:traduzir(" Freak Show"), function()
    aplicarPackCompleto(
        {113688815143735, 226948064, 17475516808},
        {0, 0, 0, 0, 0, 0},
        "Ivory"
    )
end})
Tabs.AVT:AddSection({Translator:traduzir("Roupas 3D <Conjuntos>")})
local skinIDs = {
["Mostro do S.A"] = 123609977175226,
["Impostor"] = 18234669337,
["Gato Up"] = 18994959003,
["Gato"] = 77506186615650,
["Galinha"] = 71251793812515,
["Coelho"] = 71797333686800,
["Bosta"] = 77013984520332,
["Cachorro"] = 18656467256,
["Pinguim"] = 94944293759578,
["Shrek do mal"] = 120960401202173,
["Pepa Pig"] = 92979204778377,
["Pato"] = 135132836238349,
["MotoMoto"] = 73215892129281,
["Mosquito"] = 108052868536435
}

local skinNames = {}
for name, _ in pairs(skinIDs) do
table.insert(skinNames, name)
end

local selectedSkinName = nil

Tabs.AVT:AddDropdown({
Name = Translator:traduzir("Skins 3D"),
Description = Translator:traduzir("Roupas 3D Varias opções Tops!"),
Options = skinNames,
Default = "Roupas",
Callback = function(Value)
selectedSkinName = Value
end
})

Tabs.AVT:AddButton({Translator:traduzir("Vestir"), function()
if selectedSkinName and skinIDs[selectedSkinName] then
local args = { skinIDs[selectedSkinName] }
game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
end
end})
end
do
Tabs.AVT:AddSection({Translator:traduzir("Especiais Efeitos <Acessórios>")})

local acessoriosEspeciais = {
    ["Fada do Outono"] = 128217885,
    ["Fada da Primavera"] = 150381051,
    ["Fada do Dia de São Petersburgo"] = 226189871,
    ["Fada do Inverno"] = 141742418,
    ["Risada de Bruxa"] = 305888394,
    ["Chifres Bsp"] = 233705355,
    ["Ghosdeeri"] = 132809431,
    ["Anjo Brilhante Winas"] = 192557913
}

local nomeSelecionado = nil

local nomes = {}
for nome in pairs(acessoriosEspeciais) do
    table.insert(nomes, nome)
end

Tabs.AVT:AddDropdown({
    Name = Translator:traduzir("Escolha o Efeito"),
    Description = Translator:traduzir("Selecione um acessório para ativar"),
    Options = nomes,
    Default = "Efeitos",
    Callback = function(selecionado)
        nomeSelecionado = selecionado
    end
})

Tabs.AVT:AddButton({
    Translator:traduzir("Vestir Acessório"),
    function()
        if nomeSelecionado then
            local id = acessoriosEspeciais[nomeSelecionado]
            if id then
                local args = { [1] = id }
                game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
            end
        end
    end
})
end
-----------------///////TABS - HouseTab///////-----------------
do
Tabs.HouseTab:AddSection({Translator:traduzir("Música na Casa (Game Pass)")})
local selectedMusic = ""
local MusicsList = {
{ Name = "Leaked by WxDeveloper", Id =  10561310081763},
{ Name = "Leaked by WxDeveloper", Id =  112651304685397},
{ Name = "Leaked by WxDeveloper", Id =  16190782181},
{ Name = "Leaked by WxDeveloper", Id =  1843497734},
}

local Musics = {}
local MusicIds = {}

for _, music in ipairs(MusicsList) do
table.insert(Musics, music.Name)
if music.Id then
MusicIds[music.Name] = music.Id
end
end

local Dropdown = Tabs.HouseTab:AddDropdown({
Name = Translator:traduzir("Selecionar Música"),
Description = Translator:traduzir("Funciona apenas com Game Pass"),
Options = Musics,
Default = "Músicas",
Callback = function(Value)
selectedMusic = Value
end
})

Tabs.HouseTab:AddTextBox({
Name = Translator:traduzir("Insira o ID da Música"),
Description = Translator:traduzir("Você pode colar o ID direto aqui"),
PlaceholderText = "Ex: 74366765967475",
Callback = function(value)
local parsed = tonumber(value)
if parsed then
selectedMusic = parsed
end
end
})

Tabs.HouseTab:AddButton({Translator:traduzir("Tocar Música"), function()
local musicId = tonumber(selectedMusic) or MusicIds[selectedMusic]
if musicId then
local args = {
[1] = "PickHouseMusicText",
[2] = tostring(musicId)
}
local remote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")
if remote then
remote:FireServer(unpack(args))
end
end
end})

Tabs.HouseTab:AddButton({Translator:traduzir("Parar Música"), function()
local args = {
[1] = "PickingHouseMusicStop",
[2] = ""
}
local remote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sHous1e")
if remote then
remote:FireServer(unpack(args))
end
end})
end

do
local function updateHouseList()
    local novaTabela = {}
    for _, v in pairs(workspace["001_Lots"]:GetChildren()) do
        table.insert(novaTabela, v.Name)
    end
    return novaTabela
end

local selectedHouseNumber = nil

Tabs.HouseTab:AddSection({Translator:traduzir("Funções Avançadas <Casas>")})
local CasasOpem = Tabs.HouseTab:AddDropdown({
    Name = Translator:traduzir("Selecionar Uma Casa"),
    Description = "Select the <font color='rgb(88, 101, 242)'>House</font>",
    Options = updateHouseList(),
    Default = "Casas",
    Callback = function(Value)
        selectedHouseNumber = Value
    end
})

Tabs.HouseTab:AddButton({
    Translator:traduzir("Atualizar Lista"),
    function()
        CasasOpem:Set(updateHouseList())
    end
})

local Button = Tabs.HouseTab:AddButton({Translator:traduzir("Teleporta Para <Casa>"), function()
  local House = workspace["001_Lots"]:FindFirstChild(tostring(selectedHouseNumber))
            if House and game.Players.LocalPlayer.Character then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(House.WorldPivot.Position)
            end
end})
Tabs.HouseTab:AddButton({
    Translator:traduzir("Teleporta Para O Cofre"),
    function()
        if selectedHouseNumber then
            local house = workspace["001_Lots"]:FindFirstChild(selectedHouseNumber)
            if house and house:FindFirstChild("HousePickedByPlayer") then
                local safeDoor = house.HousePickedByPlayer.HouseModel:FindFirstChild("001_Safe"):FindFirstChild("SafeDoor")
                if safeDoor then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = safeDoor.CFrame
                end
            end
        end
    end
})

local autoClickEnabled = false

local function autoClickDoorBell()
    while autoClickEnabled do
        if selectedHouseNumber then
            local house = workspace["001_Lots"]:FindFirstChild(selectedHouseNumber)
            if house and house:FindFirstChild("HousePickedByPlayer") then
                local doorBell = house.HousePickedByPlayer.HouseModel:FindFirstChild("001_DoorBell")
                if doorBell then
                    local clickDetector = doorBell.TouchBell:FindFirstChild("ClickDetector")
                    if clickDetector then
                        fireclickdetector(clickDetector)
                    end
                end
            end
        end
        task.wait(0.2)
    end
end

Tabs.HouseTab:AddToggle({
    Name = Translator:traduzir("Auto Clique <Campainha>"),
    Description = Translator:traduzir("Clica Na Campainha da casa"),
    Default = false,
    Callback = function(Value)
        autoClickEnabled = Value
        if autoClickEnabled then
            spawn(autoClickDoorBell)
        end
    end
})

local autoKnockEnabled = false

local function autoKnockDoor()
    while autoKnockEnabled do
        if selectedHouseNumber then
            local house = workspace["001_Lots"]:FindFirstChild(selectedHouseNumber)
            if house and house:FindFirstChild("HousePickedByPlayer") then
                local frontDoor = house.HousePickedByPlayer.HouseModel:FindFirstChild("001_HouseDoors"):FindFirstChild("HouseDoorFront")
                if frontDoor then
                    local clickDetector = frontDoor.Knock.TouchBell:FindFirstChild("ClickDetector")
                    if clickDetector then
                        fireclickdetector(clickDetector)
                    end
                end
            end
        end
        task.wait(0.2)
    end
end

Tabs.HouseTab:AddToggle({
    Name = Translator:traduzir("Auto Bate <Portas>"),
    Description = "Auto Bate Nas Portas Constantemente",
    Default = false,
    Callback = function(Value)
        autoKnockEnabled = Value
        if autoKnockEnabled then
            spawn(autoKnockDoor)
        end
    end
})

local Toggle = Tabs.HouseTab:AddToggle({Name = Translator:traduzir("Atravessar Porta <Casa>"), Description = Translator:traduzir("Auto Atravessar a porta da casa entre sem perm"), Default = false})

Toggle:Callback(function(Value)
        local House = workspace["001_Lots"]:FindFirstChild(tostring(selectedHouseNumber))
                if House and House:FindFirstChild("HousePickedByPlayer") then
                    local housepickedbyplayer = House.HousePickedByPlayer
                    local doors = housepickedbyplayer.HouseModel:FindFirstChild("001_HouseDoors")
                    if doors and doors:FindFirstChild("HouseDoorFront") then
                        for _, Base in ipairs(doors.HouseDoorFront:GetChildren()) do
                            if Base:IsA("BasePart") then
                                Base.CanCollide = not Value
                            end
                        end
                    end
                end
end)
Tabs.HouseTab:AddSection({Translator:traduzir("Casa Assombrada")})
local RemoteEvent = ReplicatedStorage.RE:FindFirstChild("1Player1sHous1e")

local toggles = {
    houseColor = false,
    curtains = false,
    garageDoor = false,
    permissions = false,
    blacklist = false
}

local function getRandomColor()
    return Color3.new(math.random(), math.random(), math.random())
end

local function toggleColorChange(state)
    toggles.houseColor = state
    while toggles.houseColor do
        local randomColor = getRandomColor()
        RemoteEvent:FireServer("ColorPickHouse", randomColor)
        wait(2)
    end
end

local function toggleCurtainChange(state)
    toggles.curtains = state
    while toggles.curtains do
        RemoteEvent:FireServer("Curtains")
        wait(1.5)
    end
end

local function toggleGarageDoorChange(state)
    toggles.garageDoor = state
    while toggles.garageDoor do
        RemoteEvent:FireServer("GarageDoor")
        wait(5)
    end
end

Tabs.HouseTab:AddToggle({
    Name = Translator:traduzir("Roleta Cor Da Casa"),
    Default = false,
    Callback = toggleColorChange
})

Tabs.HouseTab:AddToggle({
    Name = Translator:traduzir("Roleta Cortinas"),
    Default = false,
    Callback = toggleCurtainChange
})

Tabs.HouseTab:AddToggle({
    Name = Translator:traduzir("Roleta Porta da Garagem"),
    Default = false,
    Callback = toggleGarageDoorChange
})
end
do
local selectedPlayer = nil
local blacklistActive = false

Tabs.HouseTab:AddSection({Translator:traduzir("Banir Jogadores")})

local Players11 = Tabs.HouseTab:AddDropdown({
    Name = Translator:traduzir("Jogadores"),
    Options = {},
    Default = "Players",
    Callback = function(playerName)
        selectedPlayer = Players:FindFirstChild(playerName)
    end
})

Tabs.HouseTab:AddButton({
    Name = Translator:traduzir("Atualizar Lista"),
    Callback = function()
        local novaTabela = {}
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= Players.LocalPlayer then
                table.insert(novaTabela, v.Name)
            end
        end
        Players11:Set(novaTabela)
    end
})

Tabs.HouseTab:AddToggle({
    Name = Translator:traduzir("Auto Banimento"),
    Description = Translator:traduzir("Banir automaticamente o jogador de todas as casas"),
    Default = false,
    Callback = function(state)
        blacklistActive = state

        spawn(function()
            while blacklistActive and selectedPlayer do
                local lots = workspace:FindFirstChild("001_Lots")
                if lots then
                    for _, casa in pairs(lots:GetChildren()) do
                        local permissao = casa:FindFirstChild("HousePickedByPlayer")
                            and casa.HousePickedByPlayer:FindFirstChild("HouseModel")
                            and casa.HousePickedByPlayer.HouseModel:FindFirstChild("Permissions:Disallow")

                        if permissao then
                            local args = { [1] = selectedPlayer }
                            permissao:FireServer(unpack(args))
                        end
                    end
                end

                task.wait(1)
            end
        end)
    end
})

local colors = {
    Color3.new(1, 0, 0), 
    Color3.new(0, 1, 0),       
    Color3.new(0, 0, 1),       
    Color3.new(1, 1, 0),       
    Color3.new(0, 1, 1),       
    Color3.new(1, 0, 1)       
}

local isHouseRGBActive = false

local function changeColor()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local remoteEvent = replicatedStorage:FindFirstChild("RE") and replicatedStorage.RE:FindFirstChild("1Player1sHous1e")
    if not remoteEvent then
        warn("RemoteEvent '1Player1sHous1e' não encontrado.")
        return
    end
    while isHouseRGBActive do
        for _, color in ipairs(colors) do
            if not isHouseRGBActive then return end
            local args = {
                [1] = "ColorPickHouse",
                [2] = color
            }
            pcall(function()
                remoteEvent:FireServer(unpack(args))
            end)
            task.wait(0.8)
        end
    end
end
local function toggleHouseRGB(drip)
    isHouseRGBActive = drip
    if isHouseRGBActive then
        spawn(changeColor)
    end
end
local RemoteCasa = ReplicatedStorage.RE:FindFirstChild("1RPHous1eEven1t")
local House1, House2, House3 = "", "", ""

local repeatNames = false

Tabs.HouseTab:AddSection({Translator:traduzir("Funções Avançada Da Casa")})

Tabs.HouseTab:AddTextBox({
Title = Translator:traduzir("Definir O Nome"),
Description = Translator:traduzir("Primeiro Nome Da Repetição!"),
Default = "",
PlaceholderText = "Nick Casa",
ClearText = false,
Callback = function(N)
House1 = N
end
})
Tabs.HouseTab:AddTextBox({
Title = Translator:traduzir("Definir O Nome"),
Description = Translator:traduzir("Segundo Nome Da Repetição!"),
Default = "",
PlaceholderText = "Nick Casa",
ClearText = false,
Callback = function(N)
House2 = N
end
})
Tabs.HouseTab:AddTextBox({
Title = Translator:traduzir("Definir O Nome"),
Description = Translator:traduzir("Terceiro Nome Da Repetição!"),
Default = "",
PlaceholderText = "Nick Casa",
ClearText = false,
Callback = function(N)
House3 = N
end
})
Tabs.HouseTab:AddToggle({
        Name = Translator:traduzir("Casa Lgbt"),
        Default = false,
        Callback = function(drip)
            toggleHouseRGB(drip)
        end
    })
Tabs.HouseTab:AddToggle({
Name = Translator:traduzir("Repetir Nome da Casa"),
Description = Translator:traduzir("Repete os nomes automaticamente na casa"),
Default = false,
Callback = function(R)
repeatNames = R
if R then
task.spawn(function()
while repeatNames do
if RemoteCasa then
RemoteCasa:FireServer("BusinessName", House1)
task.wait(1)
RemoteCasa:FireServer("BusinessName", House2)
task.wait(1)
RemoteCasa:FireServer("BusinessName", House3)
task.wait(1)
end
end
end)
end
end
})
end
-----------------///////TABS - Carros///////-----------------
do
Tabs.Carros:AddSection({Translator:traduzir("Velocidade Do Carro Sem <GamePass>")})
local carSpeed = 25
local turboValue = "25"

Tabs.Carros:AddTextBox({
Title = Translator:traduzir("Definir Velocidade"),
Description = Translator:traduzir("Velocidade do carro preencher o espaço"),
Default = tostring(carSpeed),
PlaceholderText = Translator:traduzir("Velocidade"),
ClearText = false,
Callback = function(Value)
carSpeed = tonumber(Value) or carSpeed
end
})

Tabs.Carros:AddTextBox({
Title = Translator:traduzir("Definir Turbo"),
Description = Translator:traduzir("Valor turbo (Velocidade add)"),
Default = turboValue,
PlaceholderText = "Turbo",
ClearText = false,
Callback = function(Value)
turboValue = tostring(Value)
end
})

Tabs.Carros:AddButton({
Name = Translator:traduzir("Mudar Velocidade e Turbo"),
Callback = function()
local vehicles = workspace:FindFirstChild("Vehicles")
local car = vehicles and vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
local seatsFolder = car and car:FindFirstChild("Seats")
local seatInSeats = seatsFolder and seatsFolder:FindFirstChild("VehicleSeat")
if seatInSeats then
local maxSpeed = seatInSeats:FindFirstChild("MaxSpeed")
if maxSpeed and maxSpeed:IsA("NumberValue") then
maxSpeed.Value = carSpeed
end

local turbo = seatInSeats:FindFirstChild("Turbo")
if turbo and turbo:IsA("StringValue") then
turbo.Value = turboValue
end
end

local bodyFolder = car and car:FindFirstChild("Body")
local seatInBody = bodyFolder and bodyFolder:FindFirstChild("VehicleSeat")
if seatInBody then
local topSpeed = seatInBody:FindFirstChild("TopSpeed")
if topSpeed and topSpeed:IsA("NumberValue") then
topSpeed.Value = carSpeed
end

local turbo = seatInBody:FindFirstChild("Turbo")
if turbo and turbo:IsA("StringValue") then
turbo.Value = turboValue
end
end
        
        redzlib:Notify({
        Title = Translator:traduzir("Velocidade Aplicada"),
        Description = Translator:traduzir("Velocidade: " .. carSpeed .. " | Turbo: " .. turboValue),
        Type = "Success",
        Duration = 4
        })
end
})
end
do
Tabs.Carros:AddSection({Translator:traduzir("Musica No Carro (Game Pass)")})
local selectedMusic = ""

local MusicsList = {
{ Name = "confession", Id = 92992163303925 },
    { Name = "Pac Man Phonk", Id = 120889371113999 },
{ Name = "Trying To finde", Id = 132643763204246 },
{ Name = "Batalla de bombas", Id = 71995582569283 },
{ Name = "Another hiit", Id = 99731755429975 },
{ Name = "Mtg uh uh ha ha", Id = 122697381252723 },
{ Name = "fa3 renitch", Id = 128934903242385 },
{ Name = "Kawaii", Id = 13067828528278 },
{ Name = "Feeling", Id = 120764084521465 },
{ Name = "Aura + Egp", Id = 97841988407875 },
{ Name = "Mtg Balada", Id = 83797836818857 },
{ Name = "tomagi mo tão", Id = 111668097052966 },
{ Name = "mtg terra bela funk", Id = 134770548505933 },
{ Name = "Hard tuff fye", Id = 92979002969874 },
{ Name = "The Twelve", Id = 126153082683694 },

    { Name = "PASSO BEM SOLTO", Id = 119936139925486 },
    { Name = "phonkV2", Id = 97279560249940 },
    { Name = "phonkV3", Id = 74697049223758 },
    { Name = "phonkV4", Id = 95248559316142 },
    { Name = "Notaker - The Storm", Id = 5410084538 },
    { Name = "Vintage - Love Is", Id = 7029092469 },
    { Name = "Stephen Walking - JC-08", Id = 7028970358 },
    { Name = "Grant - Color", Id = 7023828725 },
    { Name = "Snavs - Us", Id = 5410082468 },
    { Name = "Eskai - Mimi", Id = 7023749823 },
    { Name = "PIXL - Galactic Voyage", Id = 5410081112 },
    { Name = "Tony Romera - Heat Wave", Id = 5410083226 },
    { Name = "Conro - All I Want", Id = 7023680426 },
    { Name = "Pixel Terror", Id = 5410086149 },
    { Name = "DESERT STAR - Empty Sky", Id = 5410084938 },
    { Name = "Grant - Are We Still Young", Id = 5410086445 },
    { Name = "Stonebank - Fire", Id = 7028985831 },
    { Name = "Jay Cosmic - Ocean Eyes", Id = 5410085296 },
    { Name = "Rootkit - Taking Me Higher", Id = 5410081542 },
    { Name = "Duumu - Forward", Id = 5410081471 },
    { Name = "Tony Romera & SQWAD - St Tropez", Id = 5410084006 },
    { Name = "Tony Romera - I Can't", Id = 5410082805 },
    { Name = "Koven - Gold", Id = 5410083299 },
    { Name = "soupandreas - Sprite", Id = 5410083814 },
    { Name = "Hoaprox & Rogue - New World", Id = 5410082346 },
    { Name = "Protostar - Feel Your Heart", Id = 5410082171 },
    { Name = "Feint feat - Drifters", Id = 5410084426 },
    { Name = "Bensley - All Night", Id = 5410082273 },
    { Name = "Em dezembro de 81", Id = 92492039534399 },
    { Name = "favela venceu", Id = 97097857368633 },
    { Name = "Backrooms", Id = 120817494107898 },
    { Name = "Músicas de Piano acústico", Id = 1838457617 },
    { Name = "Sushi Don't lie", Id = 134713831368801 },
    { Name = "Kerosene Cyristal Castels", Id = 17647322226 },
    { Name = "song6", Id = 11295853276 },
    { Name = "song7", Id = 11394802913 },
    { Name = "song8", Id = 1333498630722271 },
    { Name = "song9", Id = 100725558369704 },
    { Name = "montagem sombra girl", Id = 11164818809 },

    --Ins
{ Name = "Não Estou louco", Id = 74366765967475 },
{ Name = "Manda Meu Passinho", Id = 77741294709660 },
{ Name = "Cenário Selvagem", Id = 117562011395992 },
{ Name = "Want To Love", Id = 104846670980072 },
{ Name = "Melodia Virtual", Id = 139147474886402 },
{ Name = "Signora Funk", Id = 123394392737234 },
{ Name = "Blassed Mane", Id = 16831108393 },
{ Name = "Doors", Id = 13530436461 },
{ Name = "Onichan?", Id = 17422156627 },
{ Name = "hoodtrap", Id = 73685038553576 },
{ Name = "I love you so", Id = 98364034458260 },
{ Name = "Passei de glock", Id = 187643630 },
{ Name = "Poze Cv", Id = 124244582950595 },
{ Name = "Trap", Id = 131582258401093 },
{ Name = "Oruan - Sou Teu fã", Id = 85342086082111 },
{ Name = "Soldado Guerreiro", Id = 71590664026646 },
{ Name = "Fuga Na Viatura", Id = 131891110268352 },
{ Name = "forró ja cansou", Id = 74812784884330},
{ Name = "gol contra", Id =  122114766584918},
{ Name = "Eligebete", Id = 129370559491985 },
{ Name = "Forsaken", Id = 136274352281439 },
{ Name = "Anxiety", Id = 101483901475189 },
{ Name = "Grelo So fé", Id = 72200166265935 },
{ Name = "Phonk sexoagressivo", Id = 111995323199676 },
{ Name = "forró da resenha", Id = 120973520531216 },
{ Name = "escolha certa", Id = 107088620814881 },
{ Name = "lembro ate hoje", Id = 71531533552899 },
{ Name = "oruam", Id = 85342086082111 },
{ Name = "chinese phonk", Id = 134713831368801 },
{ Name = "Nooo", Id = 73685038553576 },
{ Name = "tuber 93", Id = 1839246711 },
{ Name = "idk", Id = 93218265275853 },
{ Name = "Pizza Place", Id = 1601659619 },
{ Name = "beats", Id = 16190782181 },
{ Name = "Samba", Id = 1836175030 },
{ Name = "Samba2", Id = 1838888602 },
{ Name = "Rock Roll", Id = 8654835474 },
{ Name = "Phonk", Id = 18841894272 },
{ Name = "Flamengo funk", Id = 8080255618 },
{ Name = "Carro de Ovos", Id = 3148329638 },
{ Name = "Banka", Id = 16190784229 },
{ Name = "Essa é Antiga", Id = 90999978343771 },
{ Name = "Essa Aqui é Braba", Id = 120833520065453 },
{ Name = "Help Me Phonk", Id = 72458292563094 },
{ Name = "Envolve A Tropa", Id = 88094479399489 },
{ Name = "No Pick Mulher", Id = 92893359226454 },
{ Name = "Mídia", Id = 105832154444494 },
{ Name = "Phonk Version", Id = 103409297553965 },
{ Name = "Phonk louco", Id = 73140398421340 },
{ Name = "Slowed Vapo No Vapo", Id = 106317184644394 },
{ Name = "Phonk Brasil", Id = 111281710445018 },
{ Name = "No Solinho", Id = 72440232513341 },
{ Name = "Phonk Inglês", Id = 14145624031 },
{ Name = "Ultra Slowed", Id = 84733736048142 },
{ Name = "Ritmada", Id = 104541292443133 },
{ Name = "Ritmada Novinha", Id = 94718473830640 },
{ Name = "So de te olha", Id = 74187181906707 }
}

local Musics = {}
local MusicIds = {}
for _, music in ipairs(MusicsList) do
table.insert(Musics, music.Name)
if music.Id then
MusicIds[music.Name] = music.Id
end
end

local Dropdown = Tabs.Carros:AddDropdown({
Name = Translator:traduzir("Selecionar Música"),
Description = Translator:traduzir("funciona apenas com game pass"),
Options = Musics,
Default = "Musica",
Callback = function(Value)
selectedMusic = Value
end
})

Tabs.Carros:AddButton({Translator:traduzir("Tocar Música"), function()
local musicId = MusicIds[selectedMusic]
if musicId then
local eventos = {
"PickingVehicleMusicText",
"PickingCarMusicText",
"PickingScooterMusicText",
"PickHouseMusicText",
"ToolMusicText"
}
for _, evento in ipairs(eventos) do
local remote = game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r")
if remote then
remote:FireServer(evento, musicId)
end
end
end
end})

Tabs.Carros:AddButton({Translator:traduzir("Para Música"), function()
local args = {
[1] = "StopMusic",
[2] = 73423225643184
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
end})

local isColorChanging = false
local colorChangeCoroutine = nil

local function changeCarColor()
    while isColorChanging do
        for _, vehicle in ipairs(workspace.Vehicles:GetChildren()) do
            if vehicle:FindFirstChild("Owner") and vehicle.Owner.Value == game.Players.LocalPlayer.Name then
                local randomColor = Color3.new(math.random(), math.random(), math.random())
                for _, part in ipairs(vehicle:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.Color = randomColor
                    end
                end
            end
        end
        wait(0.5)
    end
end

Tabs.Carros:AddToggle({
    Name = Translator:traduzir("Carro Colorido <GamePass>"),
    Default = false,
    Callback = function(state)
        isColorChanging = state
        if isColorChanging then
            colorChangeCoroutine = coroutine.create(changeCarColor)
            coroutine.resume(colorChangeCoroutine)
        end
    end
})
end
do
local function updateVehicleList()
    local novaTabela = {}
    for _, v in pairs(game.Workspace.Vehicles:GetChildren()) do
        table.insert(novaTabela, v.Name)
    end
    return novaTabela
end

local selectedVehicle = nil

Tabs.Carros:AddSection({Translator:traduzir("Carro Funções")})
local CarrosTT = Tabs.Carros:AddDropdown({
    Name = Translator:traduzir("Selecione um carro"),
    Description = Translator:traduzir("Selecionar Um Carro para as funções"),
    Options = updateVehicleList(),
    Default = Translator:traduzir("Carros"),
    Callback = function(Value)
        selectedVehicle = Value
    end
})

Tabs.Carros:AddSlider({
    Name = Translator:traduzir("Verificação de Carros"),
    Min = 1,
    Max = 25,
    Increase = 1,
    Default = 25,
    Callback = function(Value) end
})

Tabs.Carros:AddButton({
    Translator:traduzir("Atualizar lista"),
    function()
        CarrosTT:Set(updateVehicleList())
    end
})

Tabs.Carros:AddButton({
    Name = Translator:traduzir("Teleporta ao Assento"),
    Callback = function()
        local pl = game.Players.LocalPlayer
        local character = pl.Character or pl.CharacterAdded:Wait()
        local root = character:WaitForChild("HumanoidRootPart")

        if selectedVehicle then
            local vehicle = workspace.Vehicles:FindFirstChild(selectedVehicle)
            if vehicle and vehicle:FindFirstChild("Body") then
                local body = vehicle.Body
                local destino = nil
                if body:FindFirstChild("VehicleSeat") then
                    destino = body.VehicleSeat
                elseif body:FindFirstChild("CarSeatPosition") then
                    destino = body.CarSeatPosition
                elseif body:FindFirstChild("Passenger") then
                    destino = body.Passenger
                end
                if destino and destino:IsA("BasePart") then
                    root.CFrame = destino.CFrame + Vector3.new(0, 3, 0)
                end
            end
        end
    end
})
Tabs.Carros:AddToggle({
Name = Translator:traduzir("Puxa o Carro"),
Description = Translator:traduzir("Teleporta temporariamente o carro até você"),
Default = false,
Callback = function(Value)
if not Value then return end

local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:FindFirstChild("HumanoidRootPart")
if not hrp then return end

if selectedVehicle then
local vehicle = workspace.Vehicles:FindFirstChild(selectedVehicle)
if vehicle and vehicle:FindFirstChild("Body") then
local body = vehicle.Body
local seat = body:FindFirstChild("CarSeatPosition") or body:FindFirstChild("VehicleSeat") or body:FindFirstChild("Passenger")

if seat and seat:IsA("BasePart") then
local originalPosition = hrp.CFrame
hrp.CFrame = seat.CFrame
wait(0.8)

if vehicle.PrimaryPart then
vehicle:SetPrimaryPartCFrame(originalPosition)
elseif seat then
vehicle:MoveTo(originalPosition.Position)
end

hrp.CFrame = originalPosition
end
end
end
end
})
end
do
Tabs.Carros:AddSection({Translator:traduzir("Extreme Carros <Super>")})
Tabs.Carros:AddButton({
    Name = Translator:traduzir("Fly Carro Free"),
    Callback = function()
loadstring(game:HttpGet(('https://raw.githubusercontent.com/realgengar/scripts/refs/heads/main/FlyCar.lua'),true))()
    end
})
local function teleportAllCars()
    for _, vehicle in ipairs(game.Workspace.Vehicles:GetChildren()) do
        for _, part in ipairs(vehicle:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.Massless = true
            end
        end
    end
    
    wait(0.3)

    for _, vehicle in ipairs(game.Workspace.Vehicles:GetChildren()) do
        local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        vehicle:SetPrimaryPartCFrame(playerPosition)
        for _, part in ipairs(vehicle:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
                part.Massless = false
            end
        end
    end
end

local ButtonTeleportCars = Tabs.Carros:AddButton({Translator:traduzir("Puxa Carros"), function()
    teleportAllCars()
end})

Tabs.Carros:AddButton({
    Name = Translator:traduzir("Remover os carros <Todos>"),
    Callback = function()   
        local ofnawufn = false

if ofnawufn == true then
    return
end
ofnawufn = true

local cawwfer = "MilitaryBoatFree" 
local oldcfffff = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58) 
wait(0.3)

local args = {
    [1] = "PickingBoat",
    [2] = cawwfer
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(1)

local wrinfjn
for _, errb in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if errb:IsA("VehicleSeat") then
        wrinfjn = errb
    end
end

repeat
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then return end
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        if not game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,1,0)
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,-1,0)
    task.wait()
until game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn

for _, wifn in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if wifn.Name == "PhysicalWheel" then
        wifn:Destroy()
    end
end

local FLINGED = Instance.new("BodyThrust", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass) 
FLINGED.Force = Vector3.new(50000, 0, 50000) 
FLINGED.Name = "SUNTERIUM HUB FLING"
FLINGED.Location = game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.Position

for _, wvwvwasc in pairs(game.workspace.Vehicles:GetChildren()) do
    for _, ascegr in pairs(wvwvwasc:GetDescendants()) do
        if ascegr.Name == "VehicleSeat" then
            local targetcar = ascegr
            local tet = Instance.new("BodyVelocity", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass)
            tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            tet.P = 1250
            tet.Velocity = Vector3.new(0,0,0)
            tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
            for m=1,25 do
                local pos = {x=0, y=0, z=0}
                pos.x = targetcar.Position.X
                pos.y = targetcar.Position.Y
                pos.z = targetcar.Position.Z
                pos.x = pos.x + targetcar.Velocity.X / 2
                pos.y = pos.y + targetcar.Velocity.Y / 2
                pos.z = pos.z + targetcar.Velocity.Z / 2
                if pos.y <= -200 then
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(0,1000,0)
                else
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z))
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) + Vector3.new(0,-2,0)
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(0,0,2)
                    task.wait()
                    game.workspace.Vehicles[
game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(2,0,0)
                    task.wait()
                end
                task.wait()
            end
        end
    end
end

task.wait()
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
game.Players.LocalPlayer.Character.Humanoid.Sit = false
wait()
local tet = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
tet.P = 1250
tet.Velocity = Vector3.new(0,0,0)
tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
wait(0.1)
for m=1,2 do 
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
end
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"):Destroy()
wait(0.2)
ofnawufn = false
    end
})

local ESPEnabled = false
local espConnections = {}

local function createESP(vehicle)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP"
    billboard.Adornee = vehicle
    billboard.Size = UDim2.new(0, 150, 0, 30)
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.new(0, 1, 0)
    textLabel.TextScaled = true
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.Parent = billboard

    billboard.Parent = vehicle
    return textLabel
end

local function toggleESP(state)
    ESPEnabled = state
    if ESPEnabled then
        for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
            if not vehicle:FindFirstChild("ESP") and vehicle:IsA("Model") and vehicle.PrimaryPart then
                local textLabel = createESP(vehicle)
                local connection = game:GetService("RunService").RenderStepped:Connect(function()
                    if ESPEnabled and vehicle and vehicle.PrimaryPart then
                        local player = game.Players.LocalPlayer
                        local distance = (player.Character.PrimaryPart.Position - vehicle.PrimaryPart.Position).Magnitude
                        textLabel.Text = vehicle.Name .. " | Distância: " .. math.floor(distance) .. " studs"
                    end
                end)
                table.insert(espConnections, connection)
            end
        end
    else
        for _, connection in pairs(espConnections) do
            connection:Disconnect()
        end
        espConnections = {}
        for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
            if vehicle:FindFirstChild("ESP") then
                vehicle.ESP:Destroy()
            end
        end
    end
end

Tabs.Carros:AddSection({Translator:traduzir("Drip Avançado")})
local Toggle = Tabs.Carros:AddToggle({Name = Translator:traduzir("Esp Carros"), Description = Translator:traduzir("Mostra Carros no mapa"), Default = false})

Toggle:Callback(function(value)
    toggleESP(value)
end)

local carList = {
    "SchoolBus", "SmartCar", "FarmTruck", "Cadillac", "Excavator",
    "Jeep", "NascarTruck", "TowTruck", "Snowplow", "MilitaryTruck",
    "Tank", "Limo", "FireTruck"
}

local spamCarsActive = false

local function spawnCar(carName)
    local args = {
        [1] = "PickingCar",
        [2] = carName
    }
    game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
end

Tabs.Carros:AddToggle({
    Name = Translator:traduzir("Codigo Varios Carros"),
    Default = false,
    Callback = function(value)
        spamCarsActive = value
        if spamCarsActive then
            task.spawn(function()
                while spamCarsActive do
                    for _, carName in ipairs(carList) do
                        if not spamCarsActive then break end
                        spawnCar(carName)
                        wait(0.4)
                    end
                end
            end)
        end
    end
})

Tabs.Carros:AddSection({Translator:traduzir("Seção Kill Car")})
local selectedPlayer = nil
local flingLoop = false
local viewLoop = false

local function FlingPlayer()
    while flingLoop and selectedPlayer do
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")
        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")

        if not PCar then
            if RootPart then
                RootPart.CFrame = CFrame.new(0, 100, 0)
                task.wait(0.5)
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
                task.wait(0.5)
                PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
            end
        end

        if PCar and selectedPlayer then
            local targetCharacter = selectedPlayer.Character
            local targetRoot = targetCharacter and targetCharacter:FindFirstChild("HumanoidRootPart")

            if targetRoot then
                PCar:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(0, 0, -5))
                local BodyVelocity = Instance.new("BodyVelocity")
                BodyVelocity.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                BodyVelocity.Velocity = Vector3.new(500, 200, 500)
                BodyVelocity.Parent = PCar.PrimaryPart

                local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
                BodyAngularVelocity.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
                BodyAngularVelocity.AngularVelocity = Vector3.new(0, 200, 0) 
                BodyAngularVelocity.Parent = PCar.PrimaryPart

                task.wait(0.3)
                BodyVelocity:Destroy()
                BodyAngularVelocity:Destroy()
            end
        end
        task.wait(0.05) 
    end
end

local function ViewPlayer()
    local Player = game.Players.LocalPlayer
    local Camera = workspace.CurrentCamera

    while viewLoop and selectedPlayer do
        local targetCharacter = selectedPlayer.Character
        if targetCharacter then
            local targetRoot = targetCharacter:FindFirstChild("HumanoidRootPart")
            if targetRoot then
                Camera.CameraSubject = targetRoot
            end
        end
        task.wait(0.1)
    end

    if Player.Character then
        Camera.CameraSubject = Player.Character:FindFirstChild("Humanoid")
    end
end

local Players5 = Tabs.Carros:AddDropdown({
    Name = Translator:traduzir("Escolha um jogador"),
    Description = Translator:traduzir("Selecionar um jogador pra funcionar as funções"),
    Options = {},
    Default = "Players",
    Callback = function(value)
        selectedPlayer = game.Players:FindFirstChild(value)
    end
})

local Button = Tabs.Carros:AddButton({Translator:traduzir("Atualizar"), function()
    local novaTabela = {}
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            table.insert(novaTabela, v.Name)
        end
    end
    Players5:Set(novaTabela)
end})

local Button = Tabs.Carros:AddButton({Translator:traduzir("Parar Fling"), function()
    flingLoop = false
end})

local Toggle = Tabs.Carros:AddToggle({Name = Translator:traduzir("Visualizar Jogador"),Description = Translator:traduzir("Olha jogador de longe qualquer lugar"),Default = false})

Toggle:Callback(function(value)
    viewLoop = value
    ViewPlayer()
end)

local Button = Tabs.Carros:AddButton({Translator:traduzir("Inícia Fling"), function()
    if selectedPlayer then
        flingLoop = true
        FlingPlayer()
    end
end})
end

--[[Tabs.PR:AddSection({"Mudanças de Tempos"})

local Night_Toggle = Tabs.PR:AddToggle({
    Name = "Noite",
    Description = "Muda Tempo pra noite",
    Default = false
})

Night_Toggle:Callback(function(Value)
    if Value then
        game:GetService("Lighting").ClockTime = 0
    else
        game:GetService("Lighting").ClockTime = 14
    end
end)
local Day_Toggle = Tabs.PR:AddToggle({
    Name = "Dia",
    Description = "Muda Tempo pra dia",
    Default = false
})

Day_Toggle:Callback(function(Value)
    if Value then
        game:GetService("Lighting").ClockTime = 14
    else
        game:GetService("Lighting").ClockTime = 0
    end
end)]]
-----------------///////TABS - Tp///////-----------------
do
local teleportButtons = {
    {Nome = "Agência", Ponto = CFrame.new(179, 4, -464)},
    {Nome = "Oficina Oculta", Ponto = CFrame.new(0, 4, -495)},
    {Nome = "Bastidores", Ponto = CFrame.new(192, 4, 272)},
    {Nome = "Centro Urbano", Ponto = CFrame.new(136, 4, 117)},
    {Nome = "Área do Crime", Ponto = CFrame.new(-119, -28, 235)},
    {Nome = "Casa Deserta", Ponto = CFrame.new(986, 4, 63)},
    {Nome = "Arco", Ponto = CFrame.new(-589, 141, -59)},
    {Nome = "Hospital", Ponto = CFrame.new(-309, 4, 71)},
    {Nome = "Sala Secreta", Ponto = CFrame.new(-343, 4, -613)},
    {Nome = "Ilha Isolada", Ponto = CFrame.new(-1925, 23, 127)},
    {Nome = "Hotéis", Ponto = CFrame.new(182, 4, 150)},
    {Nome = "Montanha", Ponto = CFrame.new(-670, 251, 765)},
    {Nome = "Portal da Agência", Ponto = CFrame.new(672, 4, -296)},
    {Nome = "Esconderijo", Ponto = CFrame.new(505, -75, 143)},
    {Nome = "Escola", Ponto = CFrame.new(-312, 4, 211)},
    {Nome = "Café", Ponto = CFrame.new(161, 8, 52)},
    {Nome = "Cafeteria", Ponto = CFrame.new(-97.12, 4.65, 254.99)},
    {Nome = "Início", Ponto = CFrame.new(-26, 4, -23)},
    {Nome = "Banco", Ponto = CFrame.new(2.28, 4.65, 254.58)},
    {Nome = "Roupas", Ponto = CFrame.new(-46.15, 4.65, 253.20)},
    {Nome = "Refúgio", Ponto = CFrame.new(-88.48, 22.05, 262.34)},
    {Nome = "Clínica Dentária", Ponto = CFrame.new(-53.58, 22.15, 265.61)},
}

local selectedTeleport = nil

local opcoesTeleporte = {}
for _, entry in ipairs(teleportButtons) do
    table.insert(opcoesTeleporte, entry.Nome)
end

local Dropdown = Tabs.Tp:AddDropdown({
    Name = Translator:traduzir("Local de Teleporte"),
    Description = Translator:traduzir("Escolha um destino para teleportar"),
    Options = opcoesTeleporte,
    Default = "Local",
    Callback = function(nomeSelecionado)
        for _, entry in ipairs(teleportButtons) do
            if entry.Nome == nomeSelecionado then
                selectedTeleport = entry
                break
            end
        end
    end
})

Tabs.Tp:AddButton({
    Name = Translator:traduzir("Teleportar"),
    Description = Translator:traduzir("Teleporta para o local selecionado"),
    Callback = function()
        local plr = game.Players.LocalPlayer
        if not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
            warn("Personagem não encontrado!")
            return
        end

        if not selectedTeleport then
            warn("Nenhum local selecionado!")
            return
        end

        plr.Character.HumanoidRootPart.CFrame = selectedTeleport.Ponto
        print("Teleportado para: " .. selectedTeleport.Nome)
    end
})

-- Seleciona o primeiro local por padrão
if #opcoesTeleporte > 0 then
    for _, entry in ipairs(teleportButtons) do
        if entry.Nome == opcoesTeleporte[1] then
            selectedTeleport = entry
            break
        end
    end
end

Tabs.Tp:AddSection({Translator:traduzir("Teleportes Variados")})
local Button = Tabs.Tp:AddButton({Translator:traduzir("Servidor Com Pouca Pessoas"), function()
  Hop()
end})
function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                -- delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait(.1)
                    pcall(function()
                        -- writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(.1)
                end
            end
        end
    end
    function Teleport() 
        while wait(.1) do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end

local Button = Tabs.Tp:AddButton({Translator:traduzir("Servidor inferior"), function()
  local maxplayers, gamelink, goodserver, data_table = math.huge, "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    if not _G.FailedServerID then _G.FailedServerID = {} end

    local function serversearch()
        data_table = game:GetService"HttpService":JSONDecode(game:HttpGetAsync(gamelink))
        for _, v in pairs(data_table.data) do
            pcall(function()
                if type(v) == "table" and v.id and v.playing and tonumber(maxplayers) > tonumber(v.playing) and not table.find(_G.FailedServerID, v.id) then
                    maxplayers = v.playing
                    goodserver = v.id
                end
            end)
        end
    end

    function getservers()
        pcall(serversearch)
        for i, v in pairs(data_table) do
            if i == "nextPageCursor" then
                if gamelink:find"&cursor=" then
                    local a = gamelink:find"&cursor="
                    local b = gamelink:sub(a)
                    gamelink = gamelink:gsub(b, "")
                end
                gamelink = gamelink .. "&cursor=" .. v
                pcall(getservers)
            end
        end
    end

    pcall(getservers)
    wait(.1)
    if goodserver == game.JobId or maxplayers == #game:GetService"Players":GetChildren() - 1 then
    end
    table.insert(_G.FailedServerID, goodserver)
    game:GetService"TeleportService":TeleportToPlaceInstance(game.PlaceId, goodserver)

    while wait(.1) do
        pcall(function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            game.CoreGui.RobloxPromptGui.promptOverlay.DescendantAdded:Connect(function()
                local GUI = game.CoreGui.RobloxPromptGui.promptOverlay:FindFirstChild("ErrorPrompt")
                if GUI then
                    if GUI.TitleFrame.ErrorTitle.Text == "Disconnected" then
                        if #game.Players:GetPlayers() <= 1 then
                            game.Players.LocalPlayer:Kick("\nRejoining...")
                            wait(.1)
                            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
                        else
                            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                        end
                    end
                end
            end)
        end)
    end
end})
local Button = Tabs.Tp:AddButton({Translator:traduzir("Reentra No Servidor"), function()
  game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end})
end
-----------------///////TABS - CFG///////----------------
Tabs.CFG:AddSection({Translator:traduzir("Sistema De Variações")})
local antiSitConnections = {}
local isAntiSitActive = false

Tabs.CFG:AddToggle({
    Name = Translator:traduzir("Anti Sit"),
    Description = Translator:traduzir("Não Sentar"),
    Default = false,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local runService = game:GetService("RunService")

        local function resetSitting()
            for _, connection in ipairs(antiSitConnections) do
                if connection and connection.Connected then
                    connection:Disconnect()
                end
            end
            antiSitConnections = {}

            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            end
            isAntiSitActive = false
        end

        if Value then
            resetSitting()
            isAntiSitActive = true

            local function preventSitting(humanoid)
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    local sitConnection = humanoid.StateChanged:Connect(function(_, newState)
                        if newState == Enum.HumanoidStateType.Seated then
                            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                        end
                    end)
                    table.insert(antiSitConnections, sitConnection)
                end
            end

            local function onCharacterAdded(character)
                local humanoid = character:WaitForChild("Humanoid")
                preventSitting(humanoid)
            end

            local characterAddedConnection = player.CharacterAdded:Connect(onCharacterAdded)
            table.insert(antiSitConnections, characterAddedConnection)

            if player.Character then
                onCharacterAdded(player.Character)
            end

            local heartbeatConnection = runService.Heartbeat:Connect(function()
                if isAntiSitActive then
                    local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    end
                end
            end)
            table.insert(antiSitConnections, heartbeatConnection)
        else
            resetSitting()
        end
    end
})

Tabs.CFG:AddToggle({Name = Translator:traduzir("Clube Brooks"), Description = Translator:traduzir("Sistema de webhook do clube!"), Default = true})
Tabs.CFG:AddToggle({Name = Translator:traduzir("Anti Skidder"), Description = Translator:traduzir("Anti Skid > Open Source [ Discord ]"), Default = true})

   Tabs.CFG:AddSection({Translator:traduzir("Desenvolvedores")})
local function createBillboard(playerName, displayText, guiName)
    local target = workspace:FindFirstChild(playerName)
    if not target then return end

    local head = target:FindFirstChild("Head")
    if not head or head:FindFirstChild(guiName) then return end

    local billboard = Instance.new("BillboardGui")
    billboard.Name = guiName
    billboard.Adornee = head
    billboard.Size = UDim2.new(0, 100, 0, 60)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 80
    billboard.Parent = head

    local textBackground = Instance.new("Frame", billboard)
    textBackground.Name = "TextBG"
    textBackground.Size = UDim2.new(1, 0, 0.5, 0)
    textBackground.Position = UDim2.new(0, 0, 0.5, 0)
    textBackground.BackgroundColor3 = Color3.fromRGB(128, 0, 255)
    textBackground.BackgroundTransparency = 0.3
    textBackground.BorderSizePixel = 2
    textBackground.BorderColor3 = Color3.new(0, 0, 0)

    local corner = Instance.new("UICorner", textBackground)
    corner.CornerRadius = UDim.new(0, 10)

    local label = Instance.new("TextLabel", textBackground)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = displayText
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold

    local image = Instance.new("ImageLabel", billboard)
    image.Size = UDim2.new(0, 40, 0, 40)
    image.Position = UDim2.new(0.5, -20, 0, 0)
    image.BackgroundTransparency = 1
    image.Image = "rbxassetid://72495850369898"
end

local runningLoops = {}

local function startGuiWatcher(playerName, displayText, guiName)
    if runningLoops[guiName] then return end
    runningLoops[guiName] = true

    task.spawn(function()
        while runningLoops[guiName] do
            createBillboard(playerName, displayText, guiName)
            task.wait(1)
        end
    end)
end

local function stopGuiWatcher(guiName)
    runningLoops[guiName] = nil
    local target = workspace:FindFirstChild(guiName == "ModGuiMod" and "scout7ixs" or "magnusfxp")
    if target and target:FindFirstChild("Head") then
        local gui = target.Head:FindFirstChild(guiName)
        if gui then gui:Destroy() end
    end
end

local function startMultipleGuiWatchers(playerNames, displayText, guiBaseName)
    for i, playerName in ipairs(playerNames) do
        local uniqueGuiName = guiBaseName .. "_" .. playerName
        startGuiWatcher(playerName, displayText, uniqueGuiName)
    end
end

local function stopMultipleGuiWatchers(playerNames, guiBaseName)
    for i, playerName in ipairs(playerNames) do
        local uniqueGuiName = guiBaseName .. "_" .. playerName
        runningLoops[uniqueGuiName] = nil
        
        local target = workspace:FindFirstChild(playerName)
        if target and target:FindFirstChild("Head") then
            local gui = target.Head:FindFirstChild(uniqueGuiName)
            if gui then gui:Destroy() end
        end
    end
end

Tabs.CFG:AddToggle({
    Name = Translator:traduzir("Dev Script"),
    Description = Translator:traduzir("Mostra o Moderador do script no servidor"),
    Default = true,
    Callback = function(Value)
        if Value then
            startGuiWatcher("scout7ixs", "Developer", "ModGuiMod")
        else
            stopGuiWatcher("ModGuiMod")
        end
    end
})

Tabs.CFG:AddToggle({
    Name = Translator:traduzir("Owner Script"),
    Description = Translator:traduzir("Mostra o Dono do script no servidor"),
    Default = true,
    Callback = function(Value)
        if Value then
            startGuiWatcher("magnusfxp", "Owner", "ModGuiOwner")
        else
            stopGuiWatcher("ModGuiOwner")
        end
    end
})

local staffMembers = {
    "MiguelReiDelas018",
    "Roblox_Anthex",
    "RUANRODRIGO121121",
    "gbugado20",
}

Tabs.CFG:AddToggle({
    Name = Translator:traduzir("Modder Script"),
    Description = Translator:traduzir("Mostra os Staffs do servidor"),
    Default = true,
    Callback = function(Value)
        if Value then
        startMultipleGuiWatchers(staffMembers, "Moderador", "ModGuiStaff")
        else
            stopMultipleGuiWatchers(staffMembers, "ModGuiStaff")
        end
    end
})
print([[
=====================================================
|                  Drip client                      |
=====================================================
| API Status:              Online                   |
| Script Name:            Drip Client               |
| API Drip:                Online                   |
| Version:                 4.0.2                    |
=====================================================
]])
-----------------///////TABS - Admin///////----------------
wait(0.1)
do
--[[local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local RunService = game:GetService("RunService")]]

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

getgenv().ScriptID = "DRIPCLIENTADM"

local HttpService = game:GetService("HttpService")

local permissionURL = "https://raw.githubusercontent.com/dripsolutions/applications/refs/heads/main/Solutions.lua"

local success, result = pcall(function()
    return loadstring(game:HttpGet(permissionURL))()
end)

if not success or type(result) ~= "table" then
    warn("droga")
    return
end

allowedUsers = result

local player = Players.LocalPlayer
local isAuthorized = allowedUsers[player.Name] ~= nil

redzlib:Notify({
Title = "loading",
Description = "drip client",
Type = "Success",
Duration = 4
})

local selectedPlayer = nil
local Jajail = {}
local MagGelion = {}
local ObEsp = {}

local function sendChatCommand(command)
    if not command then return end
    task.wait(0.1)
    local success = false
    if TextChatService and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService:FindFirstChild("TextChannels")
        if channel then
            local generalChannel = channel:FindFirstChild("RBXGeneral")
            if generalChannel then
                local ok = pcall(function()
                    generalChannel:SendAsync(command)
                end)
                if ok then
                    success = true
                end
            end
        end
    end
    if not success then
        local defaultChatSystemChatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
        if defaultChatSystemChatEvents then
            local sayMessageRequest = defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
            if sayMessageRequest then
                pcall(function()
                    sayMessageRequest:FireServer(command, "All")
                    success = true
                end)
            end
        end
    end
    
    if not success and game:GetService("Chat") then
        pcall(function()
            game:GetService("Chat"):Chat(LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head"), command)
            success = true
        end)
    end
    
    if success then
        redzlib:Notify({
Title = "Tentando",
Description = "Working",
Type = "Success",
Duration = 4
})
        --[[game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Comando Enviado",
            Text = command,
            Duration = 2
        })]]
    else
        redzlib:Notify({
Title = "erro loaded",
Description = "falha ao enviar: " .. command,
Type = "erro",
Duration = 4
})
        --[[game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Erro",
            Text = "Falha ao enviar: " .. command,
            Duration = 3
        })]]
    end
end

local function createInterface()
    if not isAuthorized then return end
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AdminPanel"
    screenGui.Parent = PlayerGui
    screenGui.ResetOnSpawn = false
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, 520, 0, 420)
    mainFrame.Position = UDim2.new(0.5, -260, 0.5, -210)
    mainFrame.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
    mainFrame.BackgroundTransparency = 0.2
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = screenGui
    mainFrame.ClipsDescendants = true
    
    local mainCorner = Instance.new("UICorner")
    mainCorner.CornerRadius = UDim.new(0, 12)
    mainCorner.Parent = mainFrame
    
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = Color3.fromRGB(0, 0, 0)
    mainStroke.Thickness = 2
    mainStroke.Parent = mainFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, 0, 0, 45)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(55, 25, 110)
    titleLabel.BorderSizePixel = 0
    titleLabel.Text = "Drip Solutions Admin"
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextSize = 16
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = mainFrame
    
    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 12)
    titleCorner.Parent = titleLabel

    local titleStroke = Instance.new("UIStroke")
    titleStroke.Color = Color3.fromRGB(0, 0, 0)
    titleStroke.Thickness = 1
    titleStroke.Parent = titleLabel
    
    local contentFrame = Instance.new("Frame")
    contentFrame.Name = "ContentFrame"
    contentFrame.Size = UDim2.new(1, -20, 1, -75)
    contentFrame.Position = UDim2.new(0, 10, 0, 65)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = mainFrame
    contentFrame.ClipsDescendants = true
    
    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Name = "ScrollFrame"
    scrollFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollFrame.Position = UDim2.new(0, 0, 0, 0)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 4
    scrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
    scrollFrame.Parent = contentFrame
    
    local layout = Instance.new("UIListLayout")
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Padding = UDim.new(0, 6)
    layout.Parent = scrollFrame
    
    return screenGui, mainFrame, scrollFrame, layout
end

local function createButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Name = text:gsub(" ", "")
    button.Size = UDim2.new(1, 0, 0, 32)
    button.BackgroundColor3 = Color3.fromRGB(90, 45, 180)
    button.BackgroundTransparency = 0.2
    button.BorderSizePixel = 0
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 15
    button.Font = Enum.Font.FredokaOne
    button.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button
    
    local buttonStroke = Instance.new("UIStroke")
    buttonStroke.Color = Color3.fromRGB(0, 0, 0)
    buttonStroke.Thickness = 1
    buttonStroke.Parent = button
    
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.05
        }):Play()
    end)
    
    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {
            BackgroundTransparency = 0.2
        }):Play()
    end)
    
    button.MouseButton1Click:Connect(function()
        button.Active = false
        callback()
        task.wait(0.5)
        button.Active = true
    end)
    
    return button
end

local function createDropdown(parent, text, options, callback)
    local frame = Instance.new("Frame")
    frame.Name = text:gsub(" ", ""):gsub("[^%w]", "")
    frame.Size = UDim2.new(1, 0, 0, 32)
    frame.BackgroundColor3 = Color3.fromRGB(70, 35, 140)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = parent
    frame.ZIndex = 10
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local frameStroke = Instance.new("UIStroke")
    frameStroke.Color = Color3.fromRGB(0, 0, 0)
    frameStroke.Thickness = 1
    frameStroke.Parent = frame
    
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.Parent = frame
    button.ZIndex = 11
    
    local dropdown = Instance.new("Frame")
    dropdown.Name = "Dropdown"
    dropdown.Size = UDim2.new(1, 0, 0, 0)
    dropdown.Position = UDim2.new(0, 0, 1, 2)
    dropdown.BackgroundColor3 = Color3.fromRGB(50, 25, 100)
    dropdown.BorderSizePixel = 0
    dropdown.Visible = false
    dropdown.Parent = frame
    dropdown.ZIndex = 15
    
    local dropCorner = Instance.new("UICorner")
    dropCorner.CornerRadius = UDim.new(0, 6)
    dropCorner.Parent = dropdown
    
    local dropStroke = Instance.new("UIStroke")
    dropStroke.Color = Color3.fromRGB(0, 0, 0)
    dropStroke.Thickness = 1
    dropStroke.Parent = dropdown
    
    local dropScroll = Instance.new("ScrollingFrame")
    dropScroll.Size = UDim2.new(1, 0, 1, 0)
    dropScroll.BackgroundTransparency = 1
    dropScroll.BorderSizePixel = 0
    dropScroll.ScrollBarThickness = 3
    dropScroll.ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150)
    dropScroll.Parent = dropdown
    dropScroll.ZIndex = 16
    
    local dropLayout = Instance.new("UIListLayout")
    dropLayout.SortOrder = Enum.SortOrder.LayoutOrder
    dropLayout.Parent = dropScroll
    
    local function updateOptions(newOptions)
        if not newOptions or #newOptions == 0 then
            dropdown.Size = UDim2.new(1, 0, 0, 0)
            return
        end
        
        for _, child in ipairs(dropScroll:GetChildren()) do
            if child ~= dropLayout then
                child:Destroy()
            end
        end

        local optionNames = {}
        if type(newOptions[1]) == "table" then
            for _, option in ipairs(newOptions) do
                table.insert(optionNames, option.Name)
            end
        else
            optionNames = newOptions
        end
        
        for i, optionName in ipairs(optionNames) do
            if optionName and type(optionName) == "string" then
                local optionButton = Instance.new("TextButton")
                optionButton.Size = UDim2.new(1, 0, 0, 28)
                optionButton.BackgroundTransparency = 1
                optionButton.Text = optionName
                optionButton.TextColor3 = Color3.new(1, 1, 1)
                optionButton.TextSize = 13
                optionButton.Font = Enum.Font.Gotham
                optionButton.Parent = dropScroll
                optionButton.ZIndex = 17
                
                optionButton.MouseEnter:Connect(function()
                    optionButton.BackgroundTransparency = 0.7
                    optionButton.BackgroundColor3 = Color3.fromRGB(80, 40, 160)
                end)
                
                optionButton.MouseLeave:Connect(function()
                    optionButton.BackgroundTransparency = 1
                end)
                
                optionButton.MouseButton1Click:Connect(function()
                    button.Text = optionName
                    dropdown.Visible = false
                    if type(newOptions[1]) == "table" then
                        callback(newOptions[i])
                    else
                        callback(optionName)
                    end
                end)
            end
        end
        
        local contentSize = math.min(#optionNames * 28, 140)
        dropdown.Size = UDim2.new(1, 0, 0, contentSize)
        dropScroll.CanvasSize = UDim2.new(0, 0, 0, #optionNames * 28)
    end
    
    local dropdownObject = {
        Frame = frame,
        Button = button,
        UpdateOptions = updateOptions
    }
    
    pcall(function()
        updateOptions(options)
    end)
    
    button.MouseButton1Click:Connect(function()
        for _, child in ipairs(parent:GetChildren()) do
            if child:FindFirstChild("Dropdown") and child ~= frame then
                child.Dropdown.Visible = false
            end
        end
        dropdown.Visible = not dropdown.Visible
    end)
    
    return dropdownObject
end

local function createPlayerDropdown(parent, text, callback)
    local dropdown = createDropdown(parent, text, {}, callback)

    local function refreshPlayers()
        local playerList = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= Players.LocalPlayer then
                table.insert(playerList, plr.Name)
            end
        end
        dropdown.UpdateOptions(playerList)
    end

    Players.PlayerAdded:Connect(refreshPlayers)
    Players.PlayerRemoving:Connect(refreshPlayers)

    refreshPlayers()

    return dropdown
end

local function createToggle(parent, text, callback)
    local frame = Instance.new("Frame")
    frame.Name = text:gsub(" ", "")
    frame.Size = UDim2.new(1, 0, 0, 32)
    frame.BackgroundColor3 = Color3.fromRGB(70, 35, 140)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = parent
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = frame
    
    local frameStroke = Instance.new("UIStroke")
    frameStroke.Color = Color3.fromRGB(0, 0, 0)
    frameStroke.Thickness = 1
    frameStroke.Parent = frame
    
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0.65, 0, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextSize = 14
    label.Font = Enum.Font.Gotham
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = frame
    
    local toggleTrack = Instance.new("Frame")
    toggleTrack.Size = UDim2.new(0, 50, 0, 22)
    toggleTrack.Position = UDim2.new(1, -55, 0.5, -11)
    toggleTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggleTrack.BorderSizePixel = 0
    toggleTrack.Parent = frame
    
    local trackCorner = Instance.new("UICorner")
    trackCorner.CornerRadius = UDim.new(0, 11)
    trackCorner.Parent = toggleTrack
    
    local trackStroke = Instance.new("UIStroke")
    trackStroke.Color = Color3.fromRGB(139, 69, 19)
    trackStroke.Thickness = 1
    trackStroke.Parent = toggleTrack
    
    local toggleBall = Instance.new("Frame")
    toggleBall.Size = UDim2.new(0, 18, 0, 18)
    toggleBall.Position = UDim2.new(0, 2, 0.5, -9)
    toggleBall.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    toggleBall.BorderSizePixel = 0
    toggleBall.Parent = toggleTrack
    
    local ballCorner = Instance.new("UICorner")
    ballCorner.CornerRadius = UDim.new(0, 9)
    ballCorner.Parent = toggleBall
    
    local ballStroke = Instance.new("UIStroke")
    ballStroke.Color = Color3.fromRGB(139, 69, 19)
    ballStroke.Thickness = 1
    ballStroke.Parent = toggleBall
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(1, 0, 1, 0)
    toggleButton.BackgroundTransparency = 1
    toggleButton.Text = ""
    toggleButton.Parent = toggleTrack
    
    local isOn = false
    
    local function updateToggle()
        local targetPosition = isOn and UDim2.new(0, 30, 0.5, -9) or UDim2.new(0, 2, 0.5, -9)
        local targetColor = isOn and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(60, 60, 60)
        
        TweenService:Create(toggleBall, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Position = targetPosition
        }):Play()
        
        TweenService:Create(toggleTrack, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = targetColor
        }):Play()
    end
    
    toggleButton.MouseButton1Click:Connect(function()
        isOn = not isOn
        updateToggle()
        callback(isOn)
    end)
    
    return frame, toggleButton
end

local function createSection(parent, text)
    local section = Instance.new("TextLabel")
    section.Name = text:gsub(" ", "")
    section.Size = UDim2.new(1, 0, 0, 20)
    section.BackgroundColor3 = Color3.fromRGB(45, 22, 90)
    section.BackgroundTransparency = 0.3
    section.BorderSizePixel = 0
    section.Text = " " .. text
    section.TextColor3 = Color3.fromRGB(220, 220, 220)
    section.TextSize = 15
    section.Font = Enum.Font.SourceSansBold
    section.TextXAlignment = Enum.TextXAlignment.Left
    section.Parent = parent
    
    local padding = Instance.new("UIPadding")
    padding.PaddingLeft = UDim.new(0, 8)
    padding.Parent = section
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 4)
    corner.Parent = section
    
    return section
end

function CreateJail(player)
    if Jajail[player] then return end
    
    local character = player.Character
    local myChar = LocalPlayer.Character -- seu personagem
    
    if character and character:FindFirstChild("HumanoidRootPart") then
        local HRP = character.HumanoidRootPart
        local cageSize = Vector3.new(10, 10, 10)
        local wallThickness = 0.5
        local transparency = 0.3
        local cageColor = Color3.fromRGB(75, 0, 130)

        -- função interna que monta a jaula em volta de um HRP
        local function buildCage(targetHRP, suffix)
            local cageModel = Instance.new("Model")
            cageModel.Name = "JaulaDeAdmin_" .. player.Name .. suffix
            cageModel.Parent = workspace

            local function createWall(size, positionOffset)
                local wall = Instance.new("Part")
                wall.Size = size
                wall.Anchored = true
                wall.CanCollide = true
                wall.Transparency = transparency
                wall.Color = cageColor
                wall.Material = Enum.Material.ForceField
                wall.CFrame = targetHRP.CFrame * positionOffset
                wall.Parent = cageModel

                local stroke = Instance.new("SelectionBox")
                stroke.Color3 = Color3.fromRGB(147, 112, 219)
                stroke.LineThickness = 0.2
                stroke.Transparency = 0.5
                stroke.Adornee = wall
                stroke.Parent = wall

                local light = Instance.new("PointLight")
                light.Color = Color3.fromRGB(147, 112, 219)
                light.Brightness = 0.5
                light.Range = 15
                light.Parent = wall
            end

            -- cria paredes
            createWall(Vector3.new(cageSize.X, wallThickness, cageSize.Z), CFrame.new(0, -cageSize.Y/2, 0))
            createWall(Vector3.new(cageSize.X, wallThickness, cageSize.Z), CFrame.new(0, cageSize.Y/2, 0))
            createWall(Vector3.new(cageSize.X, cageSize.Y, wallThickness), CFrame.new(0, 0, -cageSize.Z/2))
            createWall(Vector3.new(cageSize.X, cageSize.Y, wallThickness), CFrame.new(0, 0, cageSize.Z/2))
            createWall(Vector3.new(wallThickness, cageSize.Y, cageSize.Z), CFrame.new(cageSize.X/2, 0, 0))
            createWall(Vector3.new(wallThickness, cageSize.Y, cageSize.Z), CFrame.new(-cageSize.X/2, 0, 0))

            return cageModel
        end

        -- jaula real no preso
        local jailModel = buildCage(HRP, "_Preso")
        Jajail[player] = jailModel

        -- cópia só pra você visualizar no seu humanoid
        if myChar and myChar:FindFirstChild("HumanoidRootPart") then
            buildCage(myChar.HumanoidRootPart, "_Visual")
        end

        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Foi preso",
            Text = player.Name .. " foi preso na jaula",
            Duration = 4
        })
    end
end
function RemoveJail(player)
    if Jajail[player] then
        Jajail[player]:Destroy()
        Jajail[player] = nil
    end
end

function FreezePlayer(player)
    if MagGelion[player] then return end
    
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 0
            humanoid.JumpPower = 0
            humanoid.JumpHeight = 0
        end

        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Anchored = true
            end
        end
        
        local HRP = character:FindFirstChild("HumanoidRootPart")
        if HRP then
            HRP.Anchored = true
        end
        
        MagGelion[player] = {
            originalWalkSpeed = humanoid and humanoid.WalkSpeed or 16,
            originalJumpPower = humanoid and humanoid.JumpPower or 50,
            originalJumpHeight = humanoid and humanoid.JumpHeight or 7.2,
            humanoid = humanoid,
            hrp = HRP,
            character = character
        }
    end
end

function UnfreezePlayer(player)
    if MagGelion[player] then
        local data = MagGelion[player]
        
        if data.humanoid and data.humanoid.Parent then
            data.humanoid.WalkSpeed = data.originalWalkSpeed or 16
            data.humanoid.JumpPower = data.originalJumpPower or 50
            data.humanoid.JumpHeight = data.originalJumpHeight or 7.2
        end
        
        if data.character and data.character.Parent then
            for _, part in pairs(data.character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.Anchored = false
                end
            end
        end
        
        MagGelion[player] = nil
    end
end

function Explode(targetPlayer)
    local function explodePlayer()
        local character = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
        local hrp = character:WaitForChild("HumanoidRootPart")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        
        if not humanoid then return end

        local explosion = Instance.new("Explosion")
        explosion.Position = hrp.Position
        explosion.BlastRadius = 0
        explosion.BlastPressure = 0
        explosion.ExplosionType = Enum.ExplosionType.NoCraters
        explosion.Parent = workspace

        local particle = Instance.new("ParticleEmitter")
        particle.Texture = "rbxassetid://243660364"
        particle.Lifetime = NumberRange.new(1)
        particle.Rate = 100
        particle.Speed = NumberRange.new(20, 40)
        particle.Size = NumberSequence.new(3)
        particle.Rotation = NumberRange.new(0, 360)
        particle.RotSpeed = NumberRange.new(180)
        particle.Parent = hrp

        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Velocity = Vector3.new(
                    math.random(-200, 200),
                    math.random(100, 150),
                    math.random(-20, 40)
                )
            end
        end

        humanoid.Health = 0

        task.delay(1.5, function()
            particle.Enabled = false
            particle:Destroy()
        end)
    end

    explodePlayer()
end

function CoolkidAvatar(targetPlayer)
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local WearRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear")
    
    -- Use targetPlayer instead of LocalPlayer
    local Character = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not Humanoid then return end

    local Desc = Humanoid:GetAppliedDescription()

    -- Remove current accessories
    for _, accessory in ipairs(Desc:GetAccessories(true)) do
        if accessory.AssetId then
            local args = {
                [1] = tonumber(accessory.AssetId)
            }
            WearRemote:InvokeServer(unpack(args))
        end
    end
    
    task.wait()
    
    -- Change body proportions
    local args = {
        {
            0,
            0,
            0,
            0,
            0,
            0
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))
    
    -- Add accessories
    local args = {
        18554114295
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
    
    local args = {
        3164473649
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
    
    -- Change body color
    local args = {
        "Really red"
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(unpack(args))
    
    -- Add final accessory
    local args = {
        6093233760
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(unpack(args))
end

local function getPlayerList()
    local list = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(list, player.Name)
        end
    end
    return list
end

function Coolkid(targetPlayer)
    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://100048062301288"
    sky.SkyboxDn = "rbxassetid://100048062301288"
    sky.SkyboxFt = "rbxassetid://100048062301288"
    sky.SkyboxLf = "rbxassetid://100048062301288"
    sky.SkyboxRt = "rbxassetid://100048062301288"
    sky.SkyboxUp = "rbxassetid://100048062301288"
    sky.Parent = game.Lighting

    local decalId = "rbxassetid://100048062301288"

    local function applyDecals(part)
        if part:IsA("BasePart") then
            for _, face in pairs(Enum.NormalId:GetEnumItems()) do
                local decal = Instance.new("Decal")
                decal.Face = face
                decal.Texture = decalId
                decal.Parent = part
            end
        end
    end

    for _, part in pairs(workspace:GetDescendants()) do
        applyDecals(part)
    end

    workspace.DescendantAdded:Connect(function(descendant)
        applyDecals(descendant)
    end)

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")

    local imageId = "rbxassetid://100048062301288"

    local function criarParticula(parte)
        local particle = Instance.new("ParticleEmitter")
        particle.Texture = imageId
        particle.Rate = 10
        particle.Lifetime = NumberRange.new(1)
        particle.Speed = NumberRange.new(2, 5)
        particle.Size = NumberSequence.new(1)
        particle.Rotation = NumberRange.new(0, 360)
        particle.RotSpeed = NumberRange.new(10)
        particle.SpreadAngle = Vector2.new(360, 360)
        particle.Parent = parte
    end

    local function aplicarParticulas(character)
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and not part:FindFirstChildOfClass("ParticleEmitter") then
                criarParticula(part)
            end
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character then
            aplicarParticulas(player.Character)
        end
        player.CharacterAdded:Connect(aplicarParticulas)
    end

    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(aplicarParticulas)
    end)

    local player = game.Players.LocalPlayer
    local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    gui.Name = "c00lkidTopBar"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true

    local topBar = Instance.new("Frame", gui)
    topBar.BackgroundColor3 = Color3.new(0, 0, 0)
    topBar.Size = UDim2.new(1, 100, 0, 25)
    topBar.Position = UDim2.new(0, -50, 0, 0)
    topBar.BorderSizePixel = 0
    topBar.ZIndex = 2

    local title = Instance.new("TextLabel", topBar)
    title.Size = UDim2.new(1, 0, 1, 0)
    title.Position = UDim2.new(0, 0, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "Game Hacked"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSans
    title.TextSize = 20
    title.TextStrokeTransparency = 0.5
    title.TextStrokeColor3 = Color3.new(0, 0, 0)
    title.ZIndex = 3

    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://99986264226275"
    Sound.Looped = false
    Sound.Parent = workspace

    local function playSoundWithRandomSettings()
        Sound.Volume = math.random(1, 3)
        Sound.PlaybackSpeed = math.random(20, 30) / 100
        Sound:Play()
    end

    playSoundWithRandomSettings()

    Sound.Ended:Connect(playSoundWithRandomSettings)
    
    -- Notification for execution
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Coolkid Mode",
        Text = "Environment completely modified!",
        Duration = 4
    })
end

function MessiJumpscare(targetPlayer)
    local Players = game:GetService("Players")
    local SoundService = game:GetService("SoundService")
    local CoreGui = game:GetService("CoreGui")
    local RunService = game:GetService("RunService")

    local jumpscareGui = Instance.new("ScreenGui")
    jumpscareGui.Name = "FullJumpscare"
    jumpscareGui.IgnoreGuiInset = true
    jumpscareGui.ResetOnSpawn = false
    jumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    jumpscareGui.DisplayOrder = 999999
    jumpscareGui.Parent = CoreGui

    local image = Instance.new("ImageLabel")
    image.Size = UDim2.new(1.2, 0, 1.2, 0)
    image.Position = UDim2.new(-0.1, 0, -0.1, 0)
    image.BackgroundTransparency = 1
    image.Image = "rbxassetid://90576086504588"
    image.ZIndex = 999999
    image.Parent = jumpscareGui

    local jumpscareSound = Instance.new("Sound")
    jumpscareSound.SoundId = "rbxassetid://88347533205938"
    jumpscareSound.Volume = 10
    jumpscareSound.Parent = SoundService

    local followupSound = Instance.new("Sound")
    followupSound.SoundId = "rbxassetid://113413619114733"
    followupSound.Volume = 10
    followupSound.Parent = SoundService

    local function startMessiJumpscare()
        image.Visible = true
        jumpscareSound:Play()

        task.delay(2, function()
            followupSound:Play()

            followupSound.Ended:Connect(function()
                jumpscareGui:Destroy()
            end)
        end)
    end

    startMessiJumpscare()
    
    -- Notification
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Jumpscare",
        Text = "Messi jumpscare activated!",
        Duration = 3
    })
end

function Jumpscare(targetPlayer)
    local Players = game:GetService("Players")
    local SoundService = game:GetService("SoundService")
    local CoreGui = game:GetService("CoreGui")
    local RunService = game:GetService("RunService")

    local jumpscareGui = Instance.new("ScreenGui")
    jumpscareGui.Name = "FullJumpscare"
    jumpscareGui.IgnoreGuiInset = true
    jumpscareGui.ResetOnSpawn = false
    jumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    jumpscareGui.DisplayOrder = 999999
    jumpscareGui.Parent = CoreGui

    local image = Instance.new("ImageLabel")
    image.Size = UDim2.new(1.2, 0, 1.2, 0)
    image.Position = UDim2.new(-0.1, 0, -0.1, 0)
    image.BackgroundTransparency = 1
    image.Image = "rbxassetid://108753859505348"
    image.ZIndex = 999999
    image.Parent = jumpscareGui

    local jumpscareSound = Instance.new("Sound")
    jumpscareSound.SoundId = "rbxassetid://18967004856"
    jumpscareSound.Volume = 10
    jumpscareSound.Parent = SoundService

    local followupSound = Instance.new("Sound")
    followupSound.SoundId = "rbxassetid://103396125105301"
    followupSound.Volume = 10
    followupSound.Parent = SoundService

    local shaking = true
    task.spawn(function()
        while shaking do
            local offsetX = math.random(-10, 10)
            local offsetY = math.random(-10, 10)
            image.Position = UDim2.new(-0.1, offsetX, -0.1, offsetY)
            task.wait(0.02)
        end
    end)

    local function startJumpscare()
        image.Visible = true
        jumpscareSound:Play()

        task.delay(2, function()
            followupSound:Play()

            followupSound.Ended:Connect(function()
                shaking = false
                jumpscareGui:Destroy()
            end)
        end)
    end

    startJumpscare()
    
    -- Notification
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Jumpscare",
        Text = "Classic jumpscare activated!",
        Duration = 3
    })
end

function Backrooms(targetPlayer)
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    
    -- Use targetPlayer instead of LocalPlayer for teleportation
    local player = targetPlayer or Players.LocalPlayer
    
    -- Create screen effect only for LocalPlayer (the admin using the command)
    local LocalPlayer = Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false

    local blackFrame = Instance.new("Frame", screenGui)
    blackFrame.Size = UDim2.new(1, 0, 1, 0)
    blackFrame.Position = UDim2.new(0, 0, 0, 0)
    blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    blackFrame.BackgroundTransparency = 1

    TweenService:Create(blackFrame, TweenInfo.new(1), {BackgroundTransparency = 0}):Play()
    task.wait(1.2)

    -- Load the Backrooms model
    local success, ModelObject = pcall(function()
        return game:GetObjects("rbxassetid://10581711055")[1]
    end)
    
    if not success then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Error",
            Text = "Failed to load Backrooms model",
            Duration = 3
        })
        screenGui:Destroy()
        return
    end
    
    ModelObject.Parent = workspace

    -- Position the model in a remote location
    for _, part in pairs(ModelObject:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Position = part.Position + Vector3.new(99999, 99999, 99999)
        end
    end

    -- Teleport the target player to the Backrooms
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(100127, 100003, 100192)
    end

    task.wait(0.5)

    -- Fade out the black screen
    TweenService:Create(blackFrame, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    task.wait(1.2)
    
    -- Clean up the screen GUI
    screenGui:Destroy()
    
    -- Notification
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Backrooms",
        Text = player.Name .. " has been sent to the Backrooms!",
        Duration = 4
    })
end

local function bringTo(playerName)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local target = Players:FindFirstChild(playerName)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
        end
    end
end

local screenGui, mainFrame, scrollFrame, layout
if isAuthorized then
    screenGui, mainFrame, scrollFrame, layout = createInterface()
end

local function clearContent()
    if not isAuthorized then return end
    for _, child in ipairs(scrollFrame:GetChildren()) do
        if child ~= layout then
            child:Destroy()
        end
    end
end


                    -----/// Script | ///------
local function showAdminTab()
    if not isAuthorized then return end
    clearContent()
    
    createSection(scrollFrame, "Seleção de Jogador")
    
    local playerDropdown = createDropdown(scrollFrame, "Selecione um jogador", getPlayerList(), function(value)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name == value and player ~= LocalPlayer then
                selectedPlayer = player
                break
            end
        end
    end)
    
    playerDropdownRef = playerDropdown
    
    createButton(scrollFrame, "Atualizar Lista", function()
        pcall(function()
            if playerDropdown and playerDropdown.UpdateOptions then
                playerDropdown.UpdateOptions(getPlayerList())
            end
        end)
    end)
    
    createSection(scrollFrame, "Comandos Básicos")
    
    createButton(scrollFrame, "Bring Player", function()
        if selectedPlayer then
            sendChatCommand("/bring " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Kill Player", function()
        if selectedPlayer then
            sendChatCommand("/kill " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Kick Player", function()
        if selectedPlayer then
            sendChatCommand("/kick " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)

--[[    createButton(scrollFrame, "Aplicar Skin", function()
        if selectedPlayer and LocalPlayer.Character and selectedPlayer.Character then
            local localHumanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            local targetHumanoid = selectedPlayer.Character:FindFirstChildOfClass("Humanoid")

            if localHumanoid and targetHumanoid then
                local desc = localHumanoid:GetAppliedDescription()
                targetHumanoid:ApplyDescription(desc)

                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Skin Aplicada",
                    Text = "Sua skin foi aplicada em " .. selectedPlayer.Name,
                    Duration = 4
                })
            end
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    ]]
    createSection(scrollFrame, "Comandos de Controle")
    
    createButton(scrollFrame, "Jail Player", function()
        if selectedPlayer then
            sendChatCommand("/jail " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Unjail Player", function()
        if selectedPlayer then
            sendChatCommand("/unjail " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Freeze Player", function()
        if selectedPlayer then
            sendChatCommand("/freeze " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Unfreeze", function()
        if selectedPlayer then
            sendChatCommand("/unfreeze " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createSection(scrollFrame, "Comandos Views")
    
    createButton(scrollFrame, "Explodir Jogador", function()
        if selectedPlayer then
            sendChatCommand("/explod " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Imagens Coolkid", function()
        if selectedPlayer then
            sendChatCommand("/coolkidavatar " .. selectedPlayer.Name) 
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Hakinggame", function()
        if selectedPlayer then
            sendChatCommand("/c00lkid " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Jumpscare", function()
        if selectedPlayer then
            sendChatCommand("/jumpscare " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Messis", function()
        if selectedPlayer then
            sendChatCommand("/messijumpscare " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Backrooms", function()
        if selectedPlayer then
            sendChatCommand("/backrooms " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
    
    createButton(scrollFrame, "Fogo Inimigo", function()
        if selectedPlayer then
            sendChatCommand("/fires " .. selectedPlayer.Name)
        else
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Erro",
                Text = "Selecione um jogador primeiro",
                Duration = 3
            })
        end
    end)
        createSection(scrollFrame, "Verificação")
        
        createButton(scrollFrame, "Verificar", function()
            sendChatCommand("verificar_drip_client")
            redzlib:Notify({
                Title = "Verificação",
                Description = "Verificando usuários...",
                Type = "Success",
                Duration = 4
                })
            --[[game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Verificação",
                Text = "Verificando usuários...",
                Duration = 3
            })]]
        
        local responses = {}
        
        local responseConnection
        if TextChatService and TextChatService.TextChannels and TextChatService.TextChannels.RBXGeneral then
            responseConnection = TextChatService.TextChannels.RBXGeneral.MessageReceived:Connect(function(msg)
                pcall(function()
                    if msg.Text == "Drip_Client_Active" then
                        local responder = msg.TextSource and Players:GetPlayerByUserId(msg.TextSource.UserId)
                        if responder and responder ~= LocalPlayer then
                            responses[responder.Name] = true
                        end
                    end
                end)
            end)
            
            task.spawn(function()
                task.wait(5)
                if responseConnection then
                    responseConnection:Disconnect()
                end
                
                local count = 0
                local names = {}
                for name, _ in pairs(responses) do
                    count = count + 1
                    table.insert(names, name)
                end
                
                if count > 0 then
                    local nameList = table.concat(names, ", ")
                    redzlib:Notify({
                Title = "Verificação Completa",
                Description = count .. " usuário(s) encontrado(s): " .. nameList,
                Type = "Success",
                Duration = 7
                })
                    --[[game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Verificação Completa",
                        Text = count .. " usuário(s) encontrado(s): " .. nameList,
                        Duration = 8
                    })]]
                else
                    redzlib:Notify({
                    Title = "Verificação Completa",
                    Description = "Nenhum outro usuário encontrado",
                    Type = "Success",
                    Duration = 4
                    })
                    --[[game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Verificação Completa",
                        Text = "Nenhum outro usuário encontrado",
                        Duration = 5
                    })]]
                end
            end)
        end
    end)
    
    task.wait()
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 15)
end

if isAuthorized then
    showAdminTab()
    local minimizeButton = Instance.new("TextButton")
    minimizeButton.Name = "MinimizeButton"
    minimizeButton.Size = UDim2.new(0, 28, 0, 28)
    minimizeButton.Position = UDim2.new(1, -35, 0, 8)
    minimizeButton.BackgroundTransparency = 1
    minimizeButton.BorderSizePixel = 0
    minimizeButton.Text = "−"
    minimizeButton.TextColor3 = Color3.new(1, 1, 1)
    minimizeButton.TextSize = 18
    minimizeButton.Font = Enum.Font.GothamBold
    minimizeButton.Parent = mainFrame

    local isMinimized = false
    local originalSize = mainFrame.Size

    minimizeButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            mainFrame.Size = UDim2.new(0, 520, 0, 45)
            scrollFrame.Parent.Visible = false
            minimizeButton.Text = "+"
        else
            mainFrame.Size = originalSize
            scrollFrame.Parent.Visible = true
            minimizeButton.Text = "−"
        end
    end)
end

if TextChatService then
local function setupChatListener()
    local success, connection = pcall(function()
        return TextChatService.TextChannels.RBXGeneral.MessageReceived:Connect(function(message)
            local text = message.Text:lower()
            local origText = message.Text or ""
            local sender = message.TextSource and Players:GetPlayerByUserId(message.TextSource.UserId)
            
            if text == "verificar_drip_client" and sender and allowedUsers[sender.Name] and sender ~= LocalPlayer then
                task.wait(math.random(0.5, 2))
                sendChatCommand("Drip_Client_Active")
                return
            end
            
            if not sender or not allowedUsers[sender.Name] or sender == LocalPlayer then return end

            local function findTarget(name)
                for _, player in ipairs(Players:GetPlayers()) do
                    if player.Name:lower():sub(1, #name) == name then
                        return player
                    end
                end
            end

            local args = {}
            for word in text:gmatch("%S+") do
                table.insert(args, word)
            end

            local cmd = args[1]
            local targetName = args[2]
            local target = targetName and findTarget(targetName)
            
            -- Comandos básicos
            if cmd == "/kill" and target == LocalPlayer then
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                if hum then hum.Health = 0 end
            elseif cmd == "/kick" and target == LocalPlayer then
                LocalPlayer:Kick("Você foi expulso pelo painel de admin.")
            elseif cmd == "/bring" and target == LocalPlayer then
                local targetRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local senderRoot = sender.Character and sender.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot and senderRoot then
                    targetRoot.CFrame = senderRoot.CFrame + Vector3.new(2, 0, 0)
                end
            elseif cmd == "/jail" and target == LocalPlayer then
                CreateJail(LocalPlayer)
            elseif cmd == "/unjail" and target == LocalPlayer then
                RemoveJail(LocalPlayer)
            elseif cmd == "/freeze" and target == LocalPlayer then
                FreezePlayer(LocalPlayer)
            elseif cmd == "/unfreeze" and target == LocalPlayer then
                UnfreezePlayer(LocalPlayer)
            elseif cmd == ";ch" and target == LocalPlayer then
                local rest = origText:match("^%S+%s+%S+%s+(.+)")
                if rest then
                    sendChatCommand(rest)
                end
            -- Comandos de Views - CORRIGIDOS
            elseif cmd == "/explod" and target == LocalPlayer then
                Explode(LocalPlayer)
            elseif cmd == "/coolkidavatar" and target == LocalPlayer then
                CoolkidAvatar(LocalPlayer)
            elseif cmd == "/c00lkid" and target == LocalPlayer then
                Coolkid(LocalPlayer)
            elseif cmd == "/jumpscare" and target == LocalPlayer then
                Jumpscare(LocalPlayer)
            elseif cmd == "/messijumpscare" and target == LocalPlayer then
                MessiJumpscare(LocalPlayer)
            elseif cmd == "/backrooms" and target == LocalPlayer then
                Backrooms(LocalPlayer)
            --[[elseif cmd == ";skin" and target == LocalPlayer then
                local function applyAppearanceFrom(sourcePlayer)
                    if not sourcePlayer or not sourcePlayer.Character then return end
                    local sourceHumanoid = sourcePlayer.Character:FindFirstChildOfClass("Humanoid")
                    local myHumanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if sourceHumanoid and myHumanoid then
                        local ok, desc = pcall(function() return sourceHumanoid:GetAppliedDescription() end)
                        if ok and desc then
                            pcall(function() myHumanoid:ApplyDescription(desc) end)
                        end
                    end
                end

                applyAppearanceFrom(sender)

                LocalPlayer.CharacterAdded:Connect(function()
                    task.wait(1)
                    applyAppearanceFrom(sender)
                end)]]
            end
        end)
    end)
    
    if not success then
        warn("erro:", connection)
    end

    end
    
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local attempts = 0
        local maxAttempts = 5
        
        local function trySetupListener()
            attempts = attempts + 1
            local success = pcall(setupChatListener)
            
            if not success and attempts < maxAttempts then
                task.wait(2)
                trySetupListener()
            elseif success then
                print("set")
            else
                warn("erros drip", maxAttempts, "tentativas")
            end
        end
        
        trySetupListener()
    end
end

if isAuthorized then
    UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            for _, child in ipairs(scrollFrame:GetChildren()) do
                if child:FindFirstChild("Dropdown") then
                    child.Dropdown.Visible = false
                end
            end
        end
    end)
end

Players.PlayerRemoving:Connect(function(player)
    if Jajail[player] then
        Jajail[player]:Destroy()
        Jajail[player] = nil
    end
    
    if MagGelion[player] then
        MagGelion   [player] = nil
    end
    
    if ObEsp[player] then
        for _, obj in pairs(ObEsp[player]) do
            if obj and obj.Parent then
                obj:Destroy()
            end
        end
        ObEsp[player] = nil
    end
end)

local playerDropdownRef = nil
if isAuthorized then
    task.spawn(function()
        while task.wait(5) do
            pcall(function()
                if playerDropdownRef and playerDropdownRef.UpdateOptions then
                    playerDropdownRef.UpdateOptions(getPlayerList())
                end
            end)
        end
    end)
end

if isAuthorized then
    redzlib:Notify({
Title = "Script loaded",
Description = "Working",
Type = "Success",
Duration = 4
})
    --[[game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Sistema Carregado",
        Text = "Funções Funcionado",
        Duration = 3
    })]]
else
    redzlib:Notify({
Title = "Conectado!",
Description = "Bem-Vindo(a)!",
Type = "Success",
Duration = 4
})
    --[[game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Sistema Carregado",
        Text = "Bem-vindo! function Load",
        Duration = 3
    })]]
end
end
-----------------///////TABS - WebHook///////----------------

-----------------///////TABS - SKIDDEE///////----------------
do
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RE = ReplicatedStorage:WaitForChild("RE")

local remote1 = RE:WaitForChild("1Ke1yFa1b")
local remote2 = RE:WaitForChild("1Avata1rOrigina1l") 
local remote3 = RE:WaitForChild("1Flyin1g")

local messages1 = {
    "Leaked by WxDeveloper",
    "Leaked",
    "L",
    "leaked",
    "faz o Leaked by WxDeveloper"
}

local messages2 = {"Skidder"}

local messages3 = {
    "lol",
    "skidder",
    "Go Learn to Program Skid",
    "Remote? hahahah"
}

local function executeRequests()
    while true do
        pcall(function()
            remote1:InvokeServer(unpack(messages1))
        end)
        pcall(function()
            remote2:FireServer(unpack(messages2))
        end)
        pcall(function()
            remote1:InvokeServer(unpack(messages1))
        end)
        pcall(function()
            remote3:FireServer(unpack(messages2))
        end)
        pcall(function()
            remote2:FireServer(unpack(messages3))
        end)
        wait(0.1)
    end
end
executeRequests()
end

--673.678162, 18.1641273, 478.667908, 0, 0, -1, 0, 1, 0, 1, 0, 0
--669.947021484375, 15.864216804504395, 477.9688720703125
--673.551513671875, 17.842744827270508, 477.9267883300781
--666.609130859375, 8.813562393188477, 477.7061462402344
--[[redzlib:Notify({
Title = "Notification",
Description = "Avatar Successfuly Copied",
Type = "Success",
Duration = 4
})]]