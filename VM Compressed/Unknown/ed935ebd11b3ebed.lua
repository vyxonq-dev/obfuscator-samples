local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "Ender Mine Hub",
    Icon = "door-open", -- lucide icon
    Author = "by: Akira_yr",
    Folder = "MySuperHub",

    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,

    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]

    -- ↓ Optional. You can remove it.
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },

    --       remove this all, 
    -- !  ↓  if you DON'T need the key system
    KeySystem = { 
        -- ↓ Optional. You can remove it.
        Key = { "ENDER-MINE-FREE-BETA", "Akira" },

        Note = "Use a Key: Akira",

        -- ↓ Optional. You can remove it.
        Thumbnail = {
            Image = "rbxassetid://10149736922",
            Title = "Use A Key",
        },

        -- ↓ Optional. You can remove it.
        URL = "https://pastebin.com/raw/BPUjvg2t",

        -- ↓ Optional. You can remove it.
        SaveKey = true, -- automatically save and load the key.

        -- ↓ Optional. You can remove it.
        -- API = {} ← Services. Read about it below ↓
    },
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "house", -- optional
    Locked = false,
})

local Tab = Window:Tab({
    Title = "Players",
    Icon = "user", -- optional
    Locked = false,
})
local Input = Tab:Input({
    Title = "Speed",
    Desc = "Velocidade (1 a 999)",
    Value = "16",
    InputIcon = "chevrons-right",
    Type = "Input",
    Placeholder = "Ex: 100",
    Callback = function(input)
    local num = tonumber(input) -- Converte o texto para número
    local char = game.Players.LocalPlayer.Character
    local hum = char and char:FindFirstChild("Humanoid")

    if hum and num then
        hum.WalkSpeed = num
    end
        end

})

local JumpInput = Tab:Input({
    Title = "Jump Power",
    Desc = "Digite a força do pulo",
    Value = "50",
    InputIcon = "chevrons-up",
    Type = "Input",
    Placeholder = "Ex: 100",
    Callback = function(input)
        local num = tonumber(input)
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")

        if hum and num then
            hum.UseJumpPower = true
            hum.JumpPower = num
        end
    end
})


local Toggle = Tab:Toggle({
    Title = "Noclip",
    Desc = "Atravessar paredes",
    Icon = "ghost",
    Type = "Checkbox",
    Value = false, -- default value
   Callback = function(state) 
    if state then
    -- Liga o Noclip
    _G.Noclip = true
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Noclip then
            if game.Players.LocalPlayer.Character then
                for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end
    end)
else
    -- Desliga o Noclip
    _G.Noclip = false
            end
            
   end
})

local Button = Tab:Button({
    Title = "Fly Gui",
    Desc = "Melhor gui De Fly Pc/Mobile",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
 })

local Tab = Window:Tab({
    Title = "Tools",
    Icon = "hammer", -- optional
    Locked = false,
})
local Button = Tab:Button({
    Title = "Best Tool",
    Desc = "Apenas algumas Ferramentas",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.app/VYIAk3o1/raw'),true))()
    end
 })

local Tab = Window:Tab({
    Title = "Admin",
    Icon = "crown", -- optional
    Locked = false,
})
local Button = Tab:Button({
    Title = "Liberar HD Admin",
    Desc = "Tenta obter privilégios de Owner",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        
        -- O HD Admin armazena os eventos em locais específicos. 
        -- Tentamos encontrar o evento de Rank para forçar o acesso.
        local hdEvent = game:GetService("ReplicatedStorage"):FindFirstChild("HDAdminClient") 
        
        if hdEvent then
            -- Tentativa de ativar o painel via comando interno
            -- Rank 5 = Owner / Rank 4 = Head Admin
            pcall(function()
                game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(";rank me 5")
            end)
            
            print("Tentativa enviada! Verifique se o ícone do HD apareceu ou digite ;cmds")
        else
            -- Se não encontrar o HD Admin, avisa no console (F9)
            warn("HD Admin não detectado neste jogo.")
        end
    end
})

Tab:Button({
    Title = "Rejoin Server",
    Desc = "Força você a entrar novamente no mesmo servidor",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game.Players.LocalPlayer
        ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
    end
})

Tab:Button({
    Title = "Server Hop",
    Desc = "Procura um servidor diferente para entrar",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for i,v in pairs(Servers.data) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
                break
            end
        end
    end
})

-- Campo para digitar o nome
Tab:Input({
    Title = "Spectate Player",
    Desc = "Digite o nome e dê Enter",
    Type = "Input",
    Placeholder = "Nome do jogador...",
    Callback = function(text)
        if text == "" then return end -- Não faz nada se o campo estiver vazio

        TargetName = text
        local found = false

        for i, v in pairs(game.Players:GetPlayers()) do
            -- Verifica se o nome bate e se o personagem existe
            if string.find(v.Name:lower(), TargetName:lower()) and v.Character and v.Character:FindFirstChild("Humanoid") then
                game.Workspace.CurrentCamera.CameraSubject = v.Character.Humanoid
                found = true
                print("Espectando: " .. v.Name)
                break
            end
        end

        if not found then
            print("Jogador não encontrado.")
            -- Se não achar ninguém, volta a câmera para você para não bugar
            if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
            end
        end
    end
})

-- Botão para parar de assistir
Tab:Button({
    Title = "Stop Spectating",
    Desc = "Volta a câmera para o seu personagem",
    Locked = false,
    Callback = function()
        local lp = game.Players.LocalPlayer
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            game.Workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
            print("Câmera resetada.")
        end
    end
})

Tab:Button({
    Title = "Chat Logs",
    Desc = "Ativa o log de mensagens no console (F9)",
    Callback = function()
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data)
            print("[" .. data.FromSpeaker .. "]: " .. data.Message)
        end)
    end
})

local Tab = Window:Tab({
    Title = "Fe",
    Icon = "wand", -- optional
    Locked = false,
})

Tab:Button({
    Title = "Cinematic Walk",
    Desc = "Andar dramático (Todos veem)",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local animate = char:WaitForChild("Animate")
        
        -- Substitui a ID da animação de caminhada/corrida
        -- Usando a animação da 'OldSchool' ou 'Stylish' que são cinematográficas
        animate.walk.WalkAnim.AnimationId = "rbxassetid://616168039" 
        animate.run.RunAnim.AnimationId = "rbxassetid://616168039"
        
        -- Reseta o Humanoid para aplicar a mudança
        char.Humanoid:ChangeState(Enum.HumanoidStateType.Landing)
        print("Animação Cinematográfica Ativada!")
    end
})

Tab:Button({
    Title = "Sonic Animation + Trail",
    Desc = "Corre como o Sonic com rastro azul",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character
        local hum = char:WaitForChild("Humanoid")
        
        -- 1. Troca a Animação para a de Ninja (Estilo Sonic)
        local animate = char:WaitForChild("Animate")
        animate.run.RunAnim.AnimationId = "rbxassetid://656118852" -- Ninja Run
        animate.walk.WalkAnim.AnimationId = "rbxassetid://656118852"
        
        -- 2. Cria o Rastro Azul (Trail)
        local trail = Instance.new("Trail")
        trail.Color = ColorSequence.new(Color3.fromRGB(0, 170, 255)) -- Azul Sonic
        trail.Transparency = NumberSequence.new(0.5, 1)
        trail.Lifetime = 0.5
        
        -- Cria os anexos para o rastro prender no corpo
        local a0 = Instance.new("Attachment", char.UpperTorso or char:FindFirstChild("Torso"))
        local a1 = Instance.new("Attachment", char.HumanoidRootPart)
        a0.Position = Vector3.new(0, 1, 0)
        a1.Position = Vector3.new(0, -1, 0)
        
        trail.Attachment0 = a0
        trail.Attachment1 = a1
        trail.Parent = char
        
        -- Aumenta a velocidade para combinar
        hum.WalkSpeed = 60
        print("Sonic Mode Ativado!")
    end
})

Tab:Button({
    Title = "Ultra Instinct Mode",
    Desc = "Animação Ninja + Aura Neon",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        -- Troca animação
        local animate = char:WaitForChild("Animate")
        animate.idle.Animation1.AnimationId = "rbxassetid://656117400"
        animate.run.RunAnim.AnimationId = "rbxassetid://656118852"

        -- Cria efeito de Aura
        local p = Instance.new("SelectionBox")
        p.Adornee = char.HumanoidRootPart
        p.Color3 = Color3.fromRGB(255, 255, 255)
        p.LineThickness = 0.05
        p.SurfaceColor3 = Color3.fromRGB(0, 255, 255)
        p.Transparency = 0.5
        p.Parent = char
        
        print("Instinto Superior Ativado!")
    end
})

Tab:Button({
    Title = "Fake Headless (FE)",
    Desc = "Tenta esconder sua cabeça para os outros",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        local head = char:FindFirstChild("Head")
        if head then
            -- Tenta esconder via transparência e remoção de face
            head.Transparency = 1
            if head:FindFirstChild("face") then
                head.face.Transparency = 1
            end
            print("Headless Ativado!")
        end
    end
})

local Button = Tab:Button({
    Title = "Carro e Avião",
    Desc = "Você Vai Virar um Carro e pode Trocar para Avião",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Vehicle-Script-V2-88610"))()
    end
})

local Button = Tab:Button({
    Title = "Fe Admin",
    Desc = "Com Isso vc Vai ter Poderes De Hacker",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://paste.c-net.org/SiliconSister"))()
    end
})

local Button = Tab:Button({
    Title = "Fe Faca",
    Desc = "Utilize Uma faça pra Matar Players",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753"))()
    end
})


local Tab = Window:Tab({
    Title = "Proteção",
    Icon = "shield", -- Ícone da aba principal
    Locked = false,
})

-- Referências de Serviço
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--- 1. ANTI-FLING ---
local AntiFling = Tab:Toggle({
    Title = "Anti-Fling",
    Desc = "Evita ser lançado por outros jogadores",
    Icon = "Wind", -- Ícone de vento/movimento
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        if state then
            print("✔️ [PROTEÇÃO]: Anti-Fling ATIVADO")
            _G.AntiFlingLoop = RunService.Stepped:Connect(function()
                if LocalPlayer.Character then
                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            print("❌ [PROTEÇÃO]: Anti-Fling DESATIVADO")
            if _G.AntiFlingLoop then _G.AntiFlingLoop:Disconnect() end
        end
    end
})

--- 2. ANTI-SIT ---
local AntiSit = Tab:Toggle({
    Title = "Anti-Sit",
    Desc = "Impedir que o personagem se sente",
    Icon = "UserMinus", -- Ícone de usuário removido/independente
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        if state then
            print("✔️ [PROTEÇÃO]: Anti-Sit ATIVADO")
            _G.AntiSitLoop = RunService.RenderStepped:Connect(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid.Sit = false
                end
            end)
        else
            print("❌ [PROTEÇÃO]: Anti-Sit DESATIVADO")
            if _G.AntiSitLoop then _G.AntiSitLoop:Disconnect() end
        end
    end
})

--- 3. ANTI-VOID ---
local AntiVoid = Tab:Toggle({
    Title = "Anti-Void",
    Desc = "Te salva de cair no infinito",
    Icon = "ArrowUpCircle", -- Ícone de seta para cima
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        if state then
            print("✔️ [PROTEÇÃO]: Anti-Void ATIVADO")
            _G.AntiVoidLoop = RunService.Heartbeat:Connect(function()
                local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root and root.Position.Y < -400 then
                    root.CFrame = CFrame.new(root.Position.X, 100, root.Position.Z)
                end
            end)
        else
            print("❌ [PROTEÇÃO]: Anti-Void DESATIVADO")
            if _G.AntiVoidLoop then _G.AntiVoidLoop:Disconnect() end
        end
    end
})

--- 4. ANTI-CONTROL ---
local AntiControl = Tab:Toggle({
    Title = "Anti-Control",
    Desc = "Impede manipulação externa",
    Icon = "Lock", -- Ícone de cadeado
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        if state then
            print("✔️ [PROTEÇÃO]: Anti-Control ATIVADO")
            settings().Physics.AllowSleep = false
        else
            print("❌ [PROTEÇÃO]: Anti-Control DESATIVADO")
            settings().Physics.AllowSleep = true
        end
    end
})

local AntiKill = Tab:Toggle({
    Title = "Anti-Kill",
    Desc = "",
    Value = false,
    Callback = function(state)
        getgenv().prot_kill = state
    end
})

local AntiJail = Tab:Toggle({
    Title = "Anti-Jail",
    Desc = "",
    Value = false,
    Callback = function(state)
        getgenv().prot_jail = state
    end
})

local AntiExplode = Tab:Toggle({
    Title = "Anti-Explode",
    Desc = "",
    Value = false,
    Callback = function(state)
        getgenv().prot_explode = state
    end
})

local AntiFreeze = Tab:Toggle({
    Title = "Anti-Freeze",
    Desc = "",
    Value = false,
    Callback = function(state)
        getgenv().prot_ice = state
    end
})

local AntiTP = Tab:Toggle({
    Title = "Anti-TP",
    Desc = "",
    Value = false,
    Callback = function(state)
        getgenv().prot_tp = state
    end
})

local AntiAll = Tab:Toggle({
    Title = "Anti-All",
    Desc = "",
    Value = false,
    Callback = function(state)
        getgenv().prot_all = state
        AntiKill:Set(state)
        AntiJail:Set(state)
        AntiExplode:Set(state)
        AntiFreeze:Set(state)
        AntiTP:Set(state)
    end
})

local Tab = Window:Tab({
    Title = "Scripts",
    Icon = "code", -- optional
    Locked = false,
})
local Button = Tab:Button({
    Title = "Script Brookhaven",
    Desc = "Melhor Script Brookhaven",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Coquette-Hub-Updated-2025-75310"))()
    end
})

local Button = Tab:Button({
    Title = "Ender Mine|Servidores Privados",
    Desc = "Compartilhando Servidores",
    Locked = false,
    Callback = function()   loadstring(game:HttpGet("https://pastebin.com/raw/jdxV5wqJ"))()
    end
})

local Button = Tab:Button({
    Title = "Carregar Infinite Yield",
    Desc = "Executa o script de comandos admin",
    Locked = false,
    Callback = function()
       loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Infinite-Yield-modded-80479"))()
    end
})

local Button = Tab:Button({
    Title = "Script Aimbot",
    Desc = "Um script pra jogos de tiros",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Aimbot-Mobile-34677"))()
    end
})

local Button = Tab:Button({
    Title = "Roadsize Shawarma",
    Desc = "Executa o script de comandos admin",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xnriu/Roadside-Shawarma/refs/heads/main/Roadside-Shawarma", true))()
    end
})

local Button = Tab:Button({
    Title = "Script Build a Boat for Treasure",
    Desc = "Key 32 horas, auto builde, Auto farm gold, painel Admin, etc.",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Loader.lua'))()
    end
 })

local Button = Tab:Button({
    Title = "Ender Mine|Powers",
    Desc = "Novo Script Versão Beta Ender Mine|Powers",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/sQ4kVEGJ"))()
    end
})

local Button = Tab:Button({
    Title = "Script IA",
    Desc = "Apenas Uma IA pra vc conversar e ela vê tudo até o Player que tá Na sua frente",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ponte-Para-AI-Gemini-No-Chat-Do-Roblox-Versao-Portugues-69113"))()
    end
})


local Button = Tab:Button({
    Title = "Trilha RGB",
    Desc = "Apenas uma Linha colorida Na Suas Costas",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rainbow-Trail-56444"))()
    end
})

local Dialog = Window:Dialog({
    Icon = "ghost",
    Title = "Bem vindo Ao Ender Mine hub Script Universal",
    Content ="Estamos Muito felizes De Você Esta Usando Nosso Script Universal Versão [Beta]",
    Buttons = {
        {
            Title = "Confirm",
            Callback = function()
                print("Confirmed!")
            end,
        },
        {
            Title = "Cancel",
            Callback = function()
                print("Cancelled!")
            end,
        },
    },
})

-- 1. Criação da Aba "Avatar"
local TabAvatar = Window:Tab({
    Title = "Avatar",
    Icon = "rbxassetid://4483345998",
    Locked = false,
})

-- Função para limpar e vestir roupas novas
local function VestirSkin(idCamisa, idCalca)
    local Player = game.Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    
    -- Limpa roupas antigas
    for _, item in pairs(Character:GetChildren()) do
        if item:IsA("Shirt") or item:IsA("Pants") or item:IsA("Accessory") or item:IsA("ShirtGraphic") then
            item:Destroy()
        end
    end

    -- Cria e veste a nova Camisa
    local camisa = Instance.new("Shirt", Character)
    camisa.Name = "NovaCamisa"
    camisa.ShirtTemplate = "rbxassetid://" .. idCamisa

    -- Cria e veste a nova Calça
    local calca = Instance.new("Pants", Character)
    calca.Name = "NovaCalca"
    calca.PantsTemplate = "rbxassetid://" .. idCalca
    
    print("Skin aplicada com sucesso!")
end

-- 2. Botão para Avatar: C00LKIDD
TabAvatar:Button({
    Title = "C00LKIDD",
    Desc = "Transforma no hacker lendário C00LKIDD",
    Callback = function()
        -- IDs de exemplo para o visual C00LKIDD (Vermelho e Preto)
        VestirSkin(129417430, 129417631)
    end
})

-- 3. Botão para Avatar: John Doe
TabAvatar:Button({
    Title = "John Doe",
    Desc = "Visual clássico do John Doe",
    Callback = function()
        -- IDs de exemplo para visual clássico
        VestirSkin(20413127, 20413155)
    end
})

-- 4. Botão para Avatar: Sonic
TabAvatar:Button({
    Title = "Sonic",
    Desc = "Transforma no Sonic (Apenas Roupa)",
    Callback = function()
        VestirSkin(1412702220, 1412701994)
    end
})


-- 1. Criação da Aba de Utilidades
local TabUtils = Window:Tab({
    Title = "Utilidades & Bypass",
    Icon = "rbxassetid://4483345998",
    Locked = false,
})

-- --- FUNÇÕES DE SEGURANÇA E BYPASS ---

-- Função para Limpar o Chat (Localmente)
TabUtils:Button({
    Title = "Limpar Chat",
    Desc = "Remove todas as mensagens visíveis no seu chat",
    Callback = function()
        -- Tenta localizar a interface do chat e limpar os frames de mensagens
        local chatMain = game.Players.LocalPlayer.PlayerGui:FindFirstChild("Chat")
        if chatMain then
            local scroller = chatMain:FindFirstChild("ScrollingLinesVisualizer", true) or chatMain:FindFirstChild("Frame", true)
            if scroller then
                for _, msg in pairs(scroller:GetChildren()) do
                    if msg:IsA("Frame") or msg:IsA("TextLabel") then
                        msg:Destroy()
                    end
                end
            end
        end
        print("Chat limpo com sucesso!")
    end
})

-- Função Anti-Kick Visual (Tirar tela de erro/conexão)
TabUtils:Button({
    Title = "Remover Telas de Erro",
    Desc = "Tira avisos de lag ou de voo rápido da tela",
    Callback = function()
        local gui = game.CoreGui:FindFirstChild("RobloxPromptGui")
        if gui then
            gui.Enabled = false -- Esconde a tela de erro do sistema
        end
        
        -- Remove GUIs de aviso que alguns jogos criam dentro do PlayerGui
        for _, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
            if v.Name:lower():find("kick") or v.Name:lower():find("error") or v.Name:lower():find("teleport") then
                v:Destroy()
            end
        end
        print("Telas de erro ocultadas.")
    end
})


-- Função Detetor de Admins (Para não ser banido)
TabUtils:Button({
    Title = "Scan de Admins",
    Desc = "Verifica se há Staff/Admins no servidor",
    Callback = function()
        local adminEncontrado = false
        for _, player in pairs(game.Players:GetPlayers()) do
            -- Verifica se o jogador está no grupo do dono com cargo alto ou tem o emblema oficial
            if player:GetRankInGroup(game.CreatorId) >= 100 or player:IsFriendsWith(game.CreatorId) then
                warn("⚠️ ADMIN DETETADO: " .. player.Name)
                adminEncontrado = true
            end
        end
        
        if not adminEncontrado then
            print("✅ Servidor Seguro: Nenhum Admin encontrado.")
        end
    end
})

-- Função Criar Servidor Privado (Teleporte)
TabUtils:Button({
    Title = "Criar Server Privado",
    Desc = "Cria um servidor só seu e te teleporta",
    Callback = function()
        local TS = game:GetService("TeleportService")
        local player = game.Players.LocalPlayer
        local code = TS:ReserveServer(game.PlaceId)
        print("Gerando código de servidor privado...")
        TS:TeleportToPrivateServer(game.PlaceId, code, {player})
    end
})


-- 2. Criação da Aba "Tirar Bugs"
local TabBugs = Window:Tab({
    Title = "Tirar Bugs",
    Icon = "rbxassetid://6031068433", -- Ícone de ferramenta/engrenagem
    Locked = false,
})

-- Função para Desbugar Movimento (Pulo e Andar)
TabBugs:Button({
    Title = "Desbugar Movimento",
    Desc = "Restaura o Pulo e a Caminhada se estiverem travados",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid then
            -- Restaura as propriedades básicas
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
            humanoid.PlatformStand = false
            humanoid.Sit = false
            
            -- Reativa os controlos do jogador
            local PlayerModule = require(player.PlayerScripts:WaitForChild("PlayerModule"))
            local controls = PlayerModule:GetControls()
            controls:Enable(true)
            
            print("Movimento restaurado!")
        end
    end
})

-- Função para Limpeza Total de Erros
TabBugs:Button({
    Title = "Limpar Tudo (Anti-Bug)",
    Desc = "Tenta destravar a tela e limpar erros de memória",
    Callback = function()
        -- 1. Destrava a câmera se estiver presa
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        
        -- 2. Tenta forçar o carregamento do personagem
        local player = game.Players.LocalPlayer
        if player.Character == nil then
            player:LoadCharacter()
        end
        
        -- 3. Limpa o Log de erros do cliente (visual apenas)
        game:GetService("LogService"):ClearOutput()
        
        print("Limpeza geral concluída.")
    end
})

-- Função para Reativar Botões da Tela (HUD)
TabBugs:Button({
    Title = "Resetar Botões da Tela",
    Desc = "Faz reaparecer botões do jogo que sumiram",
    Callback = function()
        local starterGui = game:GetService("StarterGui")
        -- Reativa todos os elementos padrão do Roblox
        starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, true)
        print("Interface original reativada.")
    end
})

-- 4. Criação da Aba Free Gamepasses
local TabGP = Window:Tab({
    Title = "Free Gamepasses",
    Icon = "rbxassetid://6031094678", -- Ícone de ticket/cartão
    Locked = false,
})

TabGP:Paragraph({
    Title = "Aviso Importante",
    Content = "Este sistema tenta simular a posse de Gamepasses localmente. Pode não funcionar em itens que são verificados estritamente pelo servidor."
})

-- Função para tentar desbloquear (Método de força bruta em variáveis locais)
TabGP:Button({
    Title = "Forçar Desbloqueio Total (Beta)",
    Desc = "Tenta quebrar as verificações de Gamepass do jogo",
    Callback = function()
        print("Iniciando varredura de permissões...")
        
        -- Método 1: Tenta enganar o MarketplaceService
        local mps = game:GetService("MarketplaceService")
        local oldUserOwnsPass = nil
        
        -- Isso tenta fazer o jogo acreditar que você possui qualquer pass consultada
        oldUserOwnsPass = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            local args = {...}
            if method == "UserOwnsGamePassAsync" then
                return true
            end
            return oldUserOwnsPass(self, unpack(args))
        end)

        -- Método 2: Procura pastas de "VIP" ou "Owned" no Player e ativa
        local p = game.Players.LocalPlayer
        for _, v in pairs(p:GetDescendants()) do
            if v:IsA("BoolValue") and (v.Name:lower():find("vip") or v.Name:lower():find("own")) then
                v.Value = true
            end
        end
        
        print("Tentativa de desbloqueio concluída. Verifica o teu menu de itens.")
    end
})

-- Sistema de Detecção de IDs (Para saberes o que o jogo tem)
TabGP:Button({
    Title = "Scanear IDs de Gamepasses",
    Desc = "Lista no console os IDs encontrados no jogo",
    Callback = function()
        print("--- Lista de Gamepasses Encontradas ---")
        for _, v in pairs(game:GetDescendants()) do
            if v:IsA("ImageButton") or v:IsA("TextButton") then
                if v.Name:lower():find("gamepass") or tostring(v.MouseButton1Click):find("PromptGamePassPurchase") then
                    print("Possível Pass: " .. v.Name .. " (Verificar GUI)")
                end
            end
        end
        print("---------------------------------------")
        print("Vê o console (F9) para a lista.")
    end
})

-- Botão para itens específicos (Exemplo comum)
TabGP:Button({
    Title = "Ativar VIP Local",
    Desc = "Tenta forçar o status VIP no teu personagem",
    Callback = function()
        local player = game.Players.LocalPlayer
        -- Muitos jogos usam uma variável 'IsVIP' no personagem ou no player
        local vip = player:FindFirstChild("IsVIP") or player.Character:FindFirstChild("IsVIP")
        if vip then
            vip.Value = true
            print("VIP Ativado!")
        else
            print("Variável VIP não encontrada neste jogo.")
        end
    end
})


-- 5. Criação da Aba Give Tools
local TabTools = Window:Tab({
    Title = "Pegar Itens",
    Icon = "rbxassetid://4483345998", -- Ícone de ferramentas
    Locked = false,
})

TabTools:Paragraph({
    Title = "Como Funciona",
    Content = "Este sistema procura itens guardados no jogo (Lighting ou ReplicatedStorage) e coloca na tua mochila."
})

-- Função para Pegar Todos os Itens do Jogo
TabTools:Button({
    Title = "Pegar Todas as Ferramentas",
    Desc = "Tenta copiar todas as ferramentas do jogo para a sua mochila",
    Callback = function()
        local backpack = game.Players.LocalPlayer:WaitForChild("Backpack")
        local count = 0
        
        -- Procura em locais comuns onde os jogos escondem as armas/itens
        local locations = {game.ReplicatedStorage, game.Lighting, game.StarterPack}
        
        for _, location in pairs(locations) do
            for _, item in pairs(location:GetDescendants()) do
                if item:IsA("Tool") or item:IsA("HopperBin") then
                    local clone = item:Clone()
                    clone.Parent = backpack
                    count = count + 1
                end
            end
        end
        
        print("Foram adicionados " .. count .. " itens à sua mochila!")
    end
})

-- Função para Pegar itens que estão no chão (Map Drops)
TabTools:Button({
    Title = "Coletar Itens do Chão",
    Desc = "Teleporta todas as ferramentas espalhadas no mapa para você",
    Callback = function()
        local backpack = game.Players.LocalPlayer:WaitForChild("Backpack")
        for _, item in pairs(workspace:GetDescendants()) do
            if item:IsA("Tool") then
                -- No caso do chão, tentamos pegar o item original
                item.Parent = backpack
            end
        end
        print("Itens do mapa coletados.")
    end
})

-- Função para Limpar Mochila (Se encher demais)
TabTools:Button({
    Title = "Limpar Mochila",
    Desc = "Remove todos os itens que você está carregando",
    Callback = function()
        local backpack = game.Players.LocalPlayer:WaitForChild("Backpack")
        for _, item in pairs(backpack:GetChildren()) do
            item:Destroy()
        end
        print("Mochila limpa.")
    end
})

local Tab = Window:Tab({
    Title = "FakePlayer",
    Icon = "user", -- optional
    Locked = false,
})

local fakeName = "" -- Variável para guardar o nome digitado

-- Função que força a aplicação do nome falso sempre que chamada
local function aplicarNomeFalso()
    local player = game.Players.LocalPlayer
    if player and fakeName ~= "" then
        player.DisplayName = fakeName
    end
end

-- Hook para rodar a função a cada frame renderizado (muito rápido)
game:GetService("RunService"):BindToRenderStep("ManterNomeFalso", 1, aplicarNomeFalso)

-- Campo de Input para digitar o novo nome
local NameInput = Tab:Input({
    Title = "Mudar Nome de Exibição",
    Desc = "Define seu nome visível no jogo e o mantém forçado",
    Value = game.Players.LocalPlayer.DisplayName,
    InputIcon = "user",
    Type = "Input",
    Placeholder = "Digite o novo nome...",
    Callback = function(input)
        -- Atualiza a variável global com o novo nome
        fakeName = input 
        -- Aplica o nome imediatamente após digitar
        aplicarNomeFalso()
        print("Nome alterado e forçado para: " .. input)
    end
})

local Button = Tab:Button({
    Title = "Virar Skin Bacon Hair (Força Total)",
    Desc = "Força a mudança de aparência no lado do cliente para R6 Bacon Hair",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        
        -- Garante que o tipo de rig seja R6 para a skin clássica
        if character.Humanoid.RigType ~= Enum.RigType.R6 then
            -- Tentar mudar para R6 localmente é complexo e nem sempre funciona em todos os jogos.
            -- A maioria dos jogos define isso nas configurações do jogo (Server-Side).
            print("❌ O jogo não permite avatares R6. A skin pode não ficar perfeita.")
        end

        -- Cores do Bacon Hair (Branco e cores padrão)
        local whiteColor = Color3.fromRGB(255, 255, 255)
        
        character.Head.Color = whiteColor
        character.Torso.Color = Color3.fromRGB(194, 203, 201) -- Light stone grey
        character["Left Arm"].Color = Color3.fromRGB(194, 203, 201)
        character["Right Arm"].Color = Color3.fromRGB(194, 203, 201)
        character["Left Leg"].Color = Color3.fromRGB(105, 105, 105) -- Dark stone grey
        character["Right Leg"].Color = Color3.fromRGB(105, 105, 105)

        -- Remove acessórios
        for _, obj in pairs(character:GetChildren()) do
            if obj:IsA("Accessory") or obj:IsA("Hat") or obj:IsA("Shirt") or obj:IsA("Pants") then
                obj:Destroy()
            end
        end

        -- Aplica o cabelo e roupas novamente usando Asset IDs (Camisa: 1100570, Calça: 1100586)
        local shirt = Instance.new("Shirt", character)
        shirt.ShirtTemplate = "rbxassetid://1100570"

        local pants = Instance.new("Pants", character)
        pants.PantsTemplate = "rbxassetid://1100586"
        
        -- Adiciona o cabelo (ID 105658602)
        game:GetService("InsertService"):LoadAsset(105658602).FirstChild:Clone().Parent = character

        print("Forçando skin Bacon Hair localmente.")
    end
})


local Tab = Window:Tab({
    Title = "Executor",
    Icon = "hammer", -- optional
    Locked = false,
})

local InputLinkExecutor = Tab:Input({
    Title = "Executar Link Externo",
    Desc = "Cole o link RAW do Pastebin/GitHub e aperte Enter",
    Value = "",
    InputIcon = "link", -- Ícone de link
    Type = "Input",
    Placeholder = "https://pastebin.com...",
    Callback = function(url)
        -- 1. Verifica se o link foi digitado
        if url == "" or url == nil then
            warn("URL inválida fornecida.")
            return
        end

        -- 2. Tenta baixar e executar o conteúdo do link
        local sucesso, resultado = pcall(function()
            local scriptContent = game:HttpGet(url)
            local loadFunction = loadstring(scriptContent)
            
            if loadFunction then
                task.spawn(loadFunction)
                return true
            else
                return false, "Erro de sintaxe no script baixado"
            end
        end)

        -- 3. Feedback visual no console (F9)
        if sucesso and resultado == true then
            print("✅ Script do link executado com sucesso!")
        else
            warn("❌ Falha ao executar o script: " .. tostring(resultado))
        end
    end
})


local CodeExecutorInput = Tab:Input({
    Title = "Executor de Código Lua",
    Desc = "Digite ou cole seu próprio código Lua (linha única) para executar",
    Value = "",
    InputIcon = "code", -- Ícone de código
    Type = "Input",
    Placeholder = "Ex: print('Olá Mundo!')",
    Callback = function(codeString)
        -- 1. Verifica se há código para executar
        if codeString == "" or codeString == nil then
            warn("Nenhum código para executar.")
            return
        end

        -- 2. Tenta carregar e executar o código digitado
        local sucesso, resultado = pcall(function()
            local loadFunction = loadstring(codeString)
            
            if loadFunction then
                task.spawn(loadFunction)
                return true
            else
                return false, "Erro de sintaxe no código digitado"
            end
        end)

        -- 3. Feedback visual no console (F9)
        if sucesso and resultado == true then
            print("✅ Código executado com sucesso!")
        else
            warn("❌ Falha ao executar o código: " .. tostring(resultado))
        end
    end
})


local linkDigitado = "" -- Variável para armazenar temporariamente o link digitado

-- 1. Campo de Input para digitar o link RAW
local InputLinkCreator = Tab:Input({
    Title = "Link do Script (RAW)",
    Desc = "Digite a URL bruta do Pastebin ou GitHub aqui",
    Value = "",
    InputIcon = "link",
    Type = "Input",
    Placeholder = "https://pastebin.com...",
    Callback = function(input) 
        -- Quando o usuário digita/aperta Enter, a variável é atualizada
        linkDigitado = input
    end
})

-- 2. Botão para copiar o comando completo
local Button = Tab:Button({
    Title = "Copiar Comando para Clipboard",
    Desc = "Gera e copia: loadstring(game:HttpGet(...))()",
    Locked = false,
    Callback = function()
        if linkDigitado == "" then
            print("❌ Por favor, digite um link no campo acima primeiro.")
            return
        end

        -- Monta a linha de comando completa no formato exato que você pediu
        local comandoCompleto = string.format('loadstring(game:HttpGet("%s"))()', linkDigitado)
        
        -- Coloca o comando na sua área de transferência (clipboard)
        -- OBS: O nome da função pode variar (setclipboard, writeclipboard) dependendo do seu executor.
        if setclipboard then
            setclipboard(comandoCompleto)
            print("✅ Comando copiado! Agora é só colar onde quiser.")
        else
            -- Caso o executor não tenha a função de clipboard
            warn("Sua UI não suporta copiar para o clipboard. Copie manualmente: " .. comandoCompleto)
        end
    end
})

spawn(function()
    local plr = game.Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local lastSafePos = Vector3.new(0, 100, 0)

    RunService.Heartbeat:Connect(function()
        local char = plr.Character
        if not char then return end

        local hum = char:FindFirstChildWhichIsA("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        if not hum or not root or hum.Health <= 0 then return end

        if getgenv().prot_all or getgenv().prot_kill then
            hum.Health = hum.MaxHealth
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end

        if getgenv().prot_all or getgenv().prot_jail then
            root.Anchored = false
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.Anchored = false end
            end
        end

        if getgenv().prot_all or getgenv().prot_explode then
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("Explosion") then obj:Destroy() end
            end
        end

        if getgenv().prot_all or getgenv().prot_ice then
            hum.WalkSpeed = math.max(hum.WalkSpeed, 16)
            hum.JumpPower = math.max(hum.JumpPower, 50)
            root.Anchored = false
            hum.PlatformStand = false
        end

        if getgenv().prot_all or getgenv().prot_tp then
            local curPos = root.Position
            if (curPos - lastSafePos).Magnitude > 80 or curPos.Y < -150 then
                root.CFrame = CFrame.new(lastSafePos) * CFrame.new(0, 5, 0)
            else
                lastSafePos = curPos
            end
        end
    end)
end)

-- Atualiza posição ao respawn
plr.CharacterAdded:Connect(function(char)
    task.wait(1)
    local root = char:WaitForChild("HumanoidRootPart", 8)
    if root then lastSafePos = root.Position end
end)