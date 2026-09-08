-- start
local UIS = game:GetService("UserInputService")
local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")

-- interface
local Gui = Instance.new("ScreenGui")
Gui.Name = "ghost_bible_ultimate"
Gui.Parent = CoreGui
Gui.IgnoreGuiInset = true

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(2, 2, 2)
MainFrame.BackgroundTransparency = 0.05
MainFrame.Parent = Gui

-- kill
local ExitBtn = Instance.new("TextButton")
ExitBtn.Size = UDim2.new(0.05, 0, 0.05, 0)
ExitBtn.Position = UDim2.new(0.93, 0, 0.02, 0)
ExitBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ExitBtn.Text = "x"
ExitBtn.TextColor3 = Color3.new(1, 1, 1)
ExitBtn.Font = Enum.Font.Code
ExitBtn.TextScaled = true
ExitBtn.Parent = MainFrame
ExitBtn.MouseButton1Click:Connect(function() Gui:Destroy() end)

-- output
local ContentLabel = Instance.new("TextLabel")
ContentLabel.Size = UDim2.new(0.85, 0, 0.8, 0)
ContentLabel.Position = UDim2.new(0.075, 0, 0.1, 0)
ContentLabel.BackgroundTransparency = 1
ContentLabel.Font = Enum.Font.Code
ContentLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
ContentLabel.TextScaled = true
ContentLabel.TextXAlignment = Enum.TextXAlignment.Left
ContentLabel.TextYAlignment = Enum.TextYAlignment.Top
ContentLabel.Visible = false
ContentLabel.Parent = MainFrame

-- database
local DB = {
    ["Português"] = {
        "1. FERRAMENTAS: Um scripter mestre usa Dex para ver a estrutura, SimpleSpy para interceptar mensagens e Hydroxide para ler a RAM.",
        "2. IDENTIDADE DELTA: O Delta usa níveis de privilégio. Com setthreadidentity(8), você engana o jogo para pensar que é um script oficial.",
        "3. SEGREDO DO GETGUI: Use gethui() para colocar seus menus em uma pasta protegida. Isso evita que o anti-cheat tire print da sua UI.",
        "4. CHECKCALLER: Sempre use checkcaller() em seus hooks. Serve para saber se quem chama a função é o jogo ou seu próprio exploit.",
        "5. ENGENHARIA REVERSA: Não apenas copie scripts. Use getgc() para buscar na memória tabelas com dados privados dos jogadores.",
        "6. METAMÉTODOS: O coração do hack. Use hookmetamethod em __index para mudar stats e __namecall para Silent Aim.",
        "7. DEBUG LIBRARY: Use debug.getupvalues(func) para ver as variáveis 'secretas' dentro de uma função local e alterá-las.",
        "8. BYPASS DE VELOCIDADE: Não mude WalkSpeed direto. Use hook em __index para retornar 16 ao jogo enquanto você corre a 500.",
        "9. CARGA NA NUVEM: Use loadstring(game:HttpGet('URL'))(). Mantenha seu código no GitHub para atualizar sem o usuário baixar nada novo.",
        "10. DRAWING API: Para um ESP profissional, use a Drawing Library. Ela renderiza fora do jogo, sendo invisível para gravadores.",
        "11. GETCONNECTIONS: Esta função permite achar eventos como 'Touched' e dar :Disable(). Assim você atravessa paredes sem morrer.",
        "12. MANIPULAÇÃO DE BITS: Use a biblioteca bit32 para descriptografar argumentos de remotos que os devs tentam esconder.",
        "13. ASSET BYPASS: Intercepte o carregamento de animações e mude o ID em tempo real. Use qualquer emote da loja de graça.",
        "14. REPLICATEDSTORAGE: É onde os devs guardam os Remotos. Procure por nomes como 'Damage', 'AddGold' ou 'Events'.",
        "15. FIRESERVER: Ao achar um remoto, use SimpleSpy para ver os dados. Tente enviar valores modificados para quebrar a lógica.",
        "16. SCRIPTBLOX: É o padrão ouro. Se seu script for bom, suba lá. Use setclipboard() para divulgar seu Discord facilmente.",
        "17. PROTEÇÃO DE SCRIPTS: Use ofuscadores para ninguém roubar sua lógica, mas lembre que um scripter nível deus sempre pode ler.",
        "18. ANTI-KICK: Faça hook na função 'Kick' do seu player para que, quando o jogo tentar te expulsar, a função não faça nada.",
        "19. MEMÓRIA LOCAL: Dados locais somem ao fechar. Use writefile() e readfile() para salvar configs na pasta do Delta.",
        "20. FIM DA JORNADA: Conhecimento é poder. Você tem a bíblia completa agora. Não seja um 'skid', entenda o código. Boa sorte."
    },
    ["Español"] = {
        "1. LA CAJA DE HERRAMIENTAS: Dex para ver la estructura, SimpleSpy para interceptar mensajes y Hydroxide para leer la RAM.",
        "2. IDENTIDAD DE DELTA: Con setthreadidentity(8) engañas al juego para que crea que eres un script del sistema oficial.",
        "3. EL SECRETO DE GETGUI: Usa gethui() para ocultar tus menús. Esto evita que los anti-cheats detecten tu UI en capturas.",
        "4. CHECKCALLER: Siempre usa checkcaller() en tus hooks para saber si la llamada viene del juego o de tu exploit.",
        "5. INGENIERÍA INVERSA: Usa getgc() para buscar en el basurero de la memoria tablas con datos privados ocultos.",
        "6. METAMÉTODOS: Hookea __index para cambiar propiedades (velocidad) y __namecall para desviar disparos (Silent Aim).",
        "7. DEBUG LIBRARY: Usa debug.getupvalues(func) para ver y modificar las variables locales dentro de funciones del juego.",
        "8. BYPASS DE VELOCIDAD: Hookea __index para que el juego crea que vas a 16 aunque vayas volando por el mapa.",
        "9. CARGA DESDE LA NUBE: Usa loadstring con GitHub para actualizar tu script instantáneamente para todos tus usuarios.",
        "10. DRAWING API: Usa la Drawing Library para ESP. Renderiza fuera del juego y es invisible para el grabador de Roblox.",
        "11. GETCONNECTIONS: Busca eventos como 'Touched' y usa :Disable(). Es la mejor forma de pasar por zonas de muerte.",
        "12. MANIPULACIÓN DE BITS: Usa bit32 para desencriptar remotos que los desarrolladores intentan ocultar con claves.",
        "13. ASSET BYPASS: Cambia el ID de las animaciones en tiempo real para usar cualquier emote de la tienda gratis.",
        "14. REPLICATEDSTORAGE: Revisa esta carpeta siempre; es donde los devs olvidan los remotos de daño y dinero.",
        "15. FIRESERVER: Experimenta enviando valores extremos a los remotos que encuentres con SimpleSpy para romper el juego.",
        "16. SCRIPTBLOX: Publica tus mejores obras aquí. Usa setclipboard() para ganar seguidores en tu comunidad de Discord.",
        "17. PROTECCIÓN: Ofusca tu código para evitar robos, pero recuerda que nada es 100% imposible de crackear.",
        "18. ANTI-KICK: Hookea la función Kick de tu jugador para que el servidor no pueda expulsarte automáticamente.",
        "19. ARCHIVOS LOCALES: Usa writefile() para guardar configuraciones de tus scripts directamente en la carpeta de Delta.",
        "20. EL FIN: Ya tienes la biblia completa. El conocimiento es poder, no lo malgastes siendo un simple copy-paster."
    },
    ["English"] = {
        "1. THE TOOLBOX: Use Dex to see the structure, SimpleSpy for remotes, and Hydroxide for scanning the game's RAM.",
        "2. DELTA IDENTITY: Use setthreadidentity(8) to trick the engine into thinking you are a core system script.",
        "3. GETHUI SECRET: Parent your GUIs to gethui() to keep them invisible from screenshot-based anti-cheats.",
        "4. CHECKCALLER: Always use checkcaller() in your hooks to identify if the caller is the game or your exploit.",
        "5. REVERSE ENGINEERING: Scan the garbage collector with getgc() to find hidden tables with private player data.",
        "6. METAMETHODS: Hook __index to spoof stats (Speed) and __namecall to redirect remote data for Silent Aim.",
        "7. DEBUG LIBRARY: Use debug.getupvalues(func) to access and change local variables inside closed game functions.",
        "8. SPEED BYPASS: Hook __index to return 16 to the game's checks while you are actually moving at high speeds.",
        "9. CLOUD LOADING: Use loadstring(game:HttpGet()) with GitHub to push updates to your users without re-pasting.",
        "10. DRAWING API: Use the Drawing Library for ESP. It renders outside the workspace and invisible to recorders.",
        "11. GETCONNECTIONS: Find 'Touched' events and call :Disable() to walk through kill-bricks effortlessly.",
        "12. BIT MANIPULATION: Use the bit32 library to decrypt remote arguments that devs try to obfuscate.",
        "13. ASSET BYPASS: Swap Animation IDs in real-time to execute any shop emote for free without owning it.",
        "14. REPLICATEDSTORAGE: This is the primary target for finding Remotes related to damage, gold, and events.",
        "15. FIRESERVER: Use SimpleSpy to see remote traffic, then fire them with modified values to exploit logic gaps.",
        "16. SCRIPTBLOX: The best place to share scripts. Use setclipboard() to link your Discord and grow your base.",
        "17. PROTECTION: Obfuscate your code to protect your hard work, but stay humble; everything can be read.",
        "18. ANTI-KICK: Hook the player's Kick function to prevent the game from successfully removing you from the server.",
        "19. FILE SYSTEM: Save your script's settings to the Delta folder using writefile() and readfile() functions.",
        "20. THE END: You hold the ultimate bible now. Knowledge is power. Be a real scripter, not just a user."
    }
}

-- brain
local cur = 1
local typing = false
local skip = false
local selected = {}

local function write(text)
    typing = true
    skip = false
    ContentLabel.Text = ""
    for i = 1, #text do
        if skip then ContentLabel.Text = text break end
        ContentLabel.Text = string.sub(text, 1, i)
        task.wait(0.01)
    end
    typing = false
end

-- menu
local LangFrame = Instance.new("Frame")
LangFrame.Size = UDim2.new(0.4, 0, 0.4, 0)
LangFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
LangFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LangFrame.BorderSizePixel = 2
LangFrame.BorderColor3 = Color3.fromRGB(0, 255, 150)
LangFrame.Parent = MainFrame

local function mk(n, p)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.8, 0, 0.25, 0)
    b.Position = p
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.Code
    b.TextScaled = true
    b.Parent = LangFrame
    b.MouseButton1Click:Connect(function()
        selected = DB[n]
        LangFrame:Destroy()
        ContentLabel.Visible = true
        write(selected[cur])
    end)
end

mk("Español", UDim2.new(0.1, 0, 0.05, 0))
mk("English", UDim2.new(0.1, 0, 0.37, 0))
mk("Português", UDim2.new(0.1, 0, 0.7, 0))

-- flow
MainFrame.InputBegan:Connect(function(io)
    if io.UserInputType == Enum.UserInputType.MouseButton1 or io.UserInputType == Enum.UserInputType.Touch then
        if not ContentLabel.Visible then return end
        if typing then
            skip = true
        else
            cur = cur + 1
            if selected[cur] then
                write(selected[cur])
            else
                ContentLabel.Text = "FIN / END / FIM."
                task.wait(1.5)
                Gui:Destroy()
            end
        end
    end
end)
