game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "TCO ULTIMATE UI 2025�9�7�9�4";
	Text = "This script is maded by Igot_KJ8";
	Icon = "rbxthumb://type=Asset&id=id here&w=150&h=150"})
Duration = 1









local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ZeianRussell/Kavo-UI-Library/main/Movable.source.lua"))()
local Window = Library.CreateLib("TCO ULTIMATE UI TUG v3.5 - maded by igot_KJ8", "Ocean")






task.wait(1) -- Espera para que cargue bien la UI

local screenGui = game.CoreGui:FindFirstChild("KavoUI") or game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("KavoUI")
if screenGui then
    for _, v in pairs(screenGui:GetDescendants()) do
        if v:IsA("Frame") and v:FindFirstChild("TopFrame") then
            v.Draggable = true
            v.Active = true
            v.Selectable = true
        end
    end
end









--sections/tabs

local Tab = Window:NewTab("simple functions")
local Section = Tab:NewSection("simple functions")

Section:NewButton("reset", "reset", function()
-- Reset character
local Players = game:GetService("Players")
local player = Players.LocalPlayer

if player and player.Character then
    player.Character:BreakJoints()
end
end)






Section:NewButton("Crash Server[Enlighten Needed]", "ButtonInfo", function()
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local messages = {";r6 o", ";reset o"}
local delayTime = 0.1

_G.SpamEnabled = true

local function sendMessages()
    while _G.SpamEnabled do
        for _, msg in ipairs(messages) do
            if not _G.SpamEnabled then return end
            TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
            task.wait(delayTime)
        end
    end
end

task.spawn(sendMessages)
end)








Section:NewButton("Stop Crashing", "ButtonInfo", function()
_G.SpamEnabled = false
end)



Section:NewButton("Crash Sv v2", "ButtonInfo", function()
local TextChatService = game:GetService("TextChatService")

_G.SpamEnabled = true

local function spamFast()
    while _G.SpamEnabled do
        TextChatService.TextChannels.RBXGeneral:SendAsync(";r6 o")
        task.wait(0.01)
    end
end

task.spawn(spamFast)
end)




Section:NewButton("Stop Crash Sv v2", "ButtonInfo", function()
_G.SpamEnabled = false
end)











Section:NewButton("Auto Bkit Stealer", "ButtonInfo", function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")

-- Prioridad de herramientas
local priorityOrder = { "Build", "Delete", "Paint" }
local toolNames = {
	Build = true,
	Delete = true,
	Paint = true,
	Sign = true,
	Shape = true,
	Shovel = true
}

local collectedTools = {} -- [tool] = originalOwner
local maxTools = 6

-- Recoger herramientas según prioridad
local function collectTools()
	local toolsToGet = {}
	local count = 0

	local function tryAddTool(tool, owner)
		if not collectedTools[tool] and count then
			table.insert(toolsToGet, { tool = tool, owner = owner })
			count += 1
		end
	end

	local function scanForTools()
		-- Primero las prioritarias
		for _, name in ipairs(priorityOrder) do
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr ~= player then
					for _, item in ipairs(plr:GetDescendants()) do
						if item:IsA("Tool") and item.Name == name then
							tryAddTool(item, plr)
						end
					end
				end
			end
			for _, item in ipairs(workspace:GetDescendants()) do
				if item:IsA("Tool") and item.Name == name then
					local model = item:FindFirstAncestorWhichIsA("Model")
					local owner = Players:GetPlayerFromCharacter(model) or "Workspace"
					tryAddTool(item, owner)
				end
			end
		end

		-- Luego las demás
		for _, plr in ipairs(Players:GetPlayers()) do
			if plr ~= player then
				for _, item in ipairs(plr:GetDescendants()) do
					if item:IsA("Tool") and toolNames[item.Name] and not table.find(priorityOrder, item.Name) then
						tryAddTool(item, plr)
					end
				end
			end
		end
		for _, item in ipairs(workspace:GetDescendants()) do
			if item:IsA("Tool") and toolNames[item.Name] and not table.find(priorityOrder, item.Name) then
				local model = item:FindFirstAncestorWhichIsA("Model")
				local owner = Players:GetPlayerFromCharacter(model) or "Workspace"
				tryAddTool(item, owner)
			end
		end
	end

	scanForTools()
	for _, entry in ipairs(toolsToGet) do
		entry.tool.Parent = backpack
		collectedTools[entry.tool] = entry.owner
	end
end

-- Devolver herramientas al morir
local function returnTools()
	for tool, owner in pairs(collectedTools) do
		if tool and tool.Parent and (tool.Parent == backpack or tool.Parent == player.Character or tool.Parent == workspace) then
			local target = (typeof(owner) == "Instance" and owner:FindFirstChild("Backpack")) or workspace
			tool.Parent = target
		end
	end
	collectedTools = {}
end

-- Conectar eventos
local function onCharacterAdded(char)
	char:WaitForChild("Humanoid").Died:Connect(function()
		returnTools()
	end)

	-- Esperar unos segundos para que reaparezca completamente y entonces recoger herramientas
	task.delay(1, function()
		collectTools()
	end)
end

-- Inicio
if player.Character then
	onCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(onCharacterAdded)

-- Primer recojo al iniciar
collectTools()
end)






Section:NewButton("Esp Admin", "ButtonInfo", function()
-- ESP para el equipo "Chosen"
local teamName = "Chosen"
local espColor = Color3.fromRGB(255, 255, 0) -- Amarillo

function createESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local box = Instance.new("BoxHandleAdornment")
        box.Name = "ESPBox"
        box.Size = Vector3.new(4, 6, 2)
        box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
        box.AlwaysOnTop = true
        box.ZIndex = 10
        box.Transparency = 0.5
        box.Color3 = espColor
        box.Parent = player.Character
    end
end

function removeESP(player)
    if player.Character then
        for _, v in pairs(player.Character:GetChildren()) do
            if v:IsA("BoxHandleAdornment") and v.Name == "ESPBox" then
                v:Destroy()
            end
        end
    end
end

function checkPlayer(player)
    if player.Team and player.Team.Name == teamName then
        player.CharacterAdded:Connect(function(char)
            repeat wait() until char:FindFirstChild("HumanoidRootPart")
            createESP(player)
        end)
        if player.Character then
            createESP(player)
        end
    end
end

for _, player in pairs(game.Players:GetPlayers()) do
    if player ~= game.Players.LocalPlayer then
        checkPlayer(player)
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player:GetPropertyChangedSignal("Team"):Connect(function()
        if player.Team and player.Team.Name == teamName then
            checkPlayer(player)
        else
            removeESP(player)
        end
    end)
    checkPlayer(player)
end)
end)








Section:NewButton("ANTI-VAMPIRE SWORD", "ButtonInfo", function()
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local function fixCameraAndInventory()
    repeat task.wait() until LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    Camera.CameraType = Enum.CameraType.Custom
    Camera.CameraSubject = LocalPlayer.Character:FindFirstChild("Humanoid")
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, true)
end

LocalPlayer.CharacterAdded:Connect(function()
    fixCameraAndInventory()
end)

fixCameraAndInventory()
end)



Section:NewButton("SpamCar", "ButtonInfo", function()
-- KRNL Script con toque en media altura y esquina izquierda de la pantalla

local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer

_G.running = true

-- Esperar al canal del nuevo sistema de chat
repeat task.wait() until TextChatService:FindFirstChild("TextChannels")
local channel = TextChatService.TextChannels.RBXGeneral

-- Loop controlado
while _G.running do
    -- Enviar primer mensaje ;car me
    channel:SendAsync(";car me")
    task.wait(0.5)

    -- Simular toque virtual en el borde izquierdo y altura media
    local x = 0
    local y = workspace.CurrentCamera.ViewportSize.Y / 2
    VirtualInputManager:SendMouseButtonEvent(x, y, 0, true, game, 0)
    task.wait(0.5)
    VirtualInputManager:SendMouseButtonEvent(x, y, 0, false, game, 0)

    -- Esperar antes del siguiente mensaje
    task.wait(0.5)

    -- Enviar segundo mensaje ;clearinv me
    channel:SendAsync(";clearinv me")
    
    -- Esperar antes de repetir
    task.wait(0.5)
end
end)





Section:NewButton("stop spam car", "ButtonInfo", function()
-- Script para detener el loop
_G.running = false
print("Loop detenido.")
end)




Section:NewButton("Auto Bkit All", "ButtonInfo", function()
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local function sendMessage()
    TextChatService.TextChannels.RBXGeneral:SendAsync(";bkit all")
end

Players.PlayerAdded:Connect(function(player)
    sendMessage()
end)

for _, player in ipairs(Players:GetPlayers()) do
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            sendMessage()
        end)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            sendMessage()
        end)
    end)
end)
end)







Section:NewButton("Stop Bkit All", "ButtonInfo", function()
local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local enableMessage = true

local function sendMessage()
    if enableMessage then
        TextChatService.TextChannels.RBXGeneral:SendAsync(";bkit all")
    end
end

Players.PlayerAdded:Connect(function(player)
    sendMessage()
end)

for _, player in ipairs(Players:GetPlayers()) do
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            sendMessage()
        end)
    end)
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.Died:Connect(function()
            sendMessage()
        end)
    end)
end)

local function disableScript()
    enableMessage = false
end
end)









Section:NewButton("Spam Text", "Spam Text", function()
local TextChatService = game:GetService("TextChatService")
local ChatInputBarConfiguration = TextChatService:FindFirstChild("ChatInputBarConfiguration")

while true do
    if ChatInputBarConfiguration then
        ChatInputBarConfiguration.TargetTextChannel:SendAsync("EZZ SPAM GG EZZZ XDDDDDDDDDD SPAMMMMM")
    end
    wait(1)
end
end)




Section:NewButton("Spam Reset [ CAN'T STOP] ", "spam reset", function()
local TextChatService = game:GetService("TextChatService")
local ChatInputBarConfiguration = TextChatService:FindFirstChild("ChatInputBarConfiguration")

while true do
    if ChatInputBarConfiguration then
        ChatInputBarConfiguration.TargetTextChannel:SendAsync(";reset all")
    end
    wait(0.5)
end
end)



Section:NewButton("Abuser Gui(maded by me)", "ButtonInfo", function()
-- GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local AbuseButton = Instance.new("TextButton")
local StopButton = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0, 100, 0, 100)
Frame.Size = UDim2.new(0, 160, 0, 80)
Frame.Active = true
Frame.Draggable = true

AbuseButton.Parent = Frame
AbuseButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
AbuseButton.Position = UDim2.new(0, 10, 0, 10)
AbuseButton.Size = UDim2.new(0, 140, 0, 25)
AbuseButton.Font = Enum.Font.SourceSansBold
AbuseButton.Text = "abuse"
AbuseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AbuseButton.TextSize = 18

StopButton.Parent = Frame
StopButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
StopButton.Position = UDim2.new(0, 10, 0, 45)
StopButton.Size = UDim2.new(0, 140, 0, 25)
StopButton.Font = Enum.Font.SourceSansBold
StopButton.Text = "stop abusing"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.TextSize = 16

-- Funciones de los botones

local running = false  -- Controla si el script está en ejecución o no

-- Función para el botón "AbuseButton"
AbuseButton.MouseButton1Click:Connect(function()
    if not running then  -- Verifica si ya no está corriendo
        running = true
        local TextChatService = game:GetService("TextChatService")
        local ChatInputBarConfiguration = TextChatService:FindFirstChild("ChatInputBarConfiguration")

        -- configuración del chat y etc
        while running do
            if ChatInputBarConfiguration then
                -- Enviar comandos de abuso
                ChatInputBarConfiguration.TargetTextChannel:SendAsync(";freeze all")
                wait(0.3)
                ChatInputBarConfiguration.TargetTextChannel:SendAsync(";mute all")
                wait(0.3)
                ChatInputBarConfiguration.TargetTextChannel:SendAsync(";blind all")
                wait(0.3)
            else
                -- Si no se encuentra la configuración de chat, espera y sigue verificando
                wait(0.5)
            end
        end
    end
end)

--  stop button functions
StopButton.MouseButton1Click:Connect(function()
    running = false  -- Detiene el ciclo en caso de que el usuario quiera parar el abuso
    print("El abuso ha sido detenido.")
end)
end)











--sections/tabs

local Tab = Window:NewTab("Hubs")
local Section = Tab:NewSection("Hubs")

Section:NewButton("ZTE hub[OP]", "ZTE hub[OP]", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/khanh-lol/Ztehub/refs/heads/main/ztebeta"))()
end)




Section:NewButton("unanchored abuse parts", "unanchored abuse parts", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Unanchored-Part-Abuse-WIP-23861"))()
end)





Section:NewButton("Hyperion 1.1", "Hyperion 1.1", function()
-- https://scriptblox.com/script/The-Chosen-One-HYPERION-35114

if not (game.PlaceId == 11137575513 or game.PlaceId == 12943247001 or game.PlaceId == 12943245078) then
   -- game:GetService("Players").LocalPlayer:Kick("Invalid game")
end
local rf = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local chat = game:GetService("TextChatService").TextChannels.RBXSystem
local cmdsOnce = {";delcubes a", ";fog nan", ";delclones a", ";maptide 0", ";mapsize 0", ";seatide nan", ";seasize nan", ";colorless", ";myopic o"}
local cmds1 = {";reset me", ";clearinv o", ";reset me", ";freeze o", ";reset me", ";mute o", ";reset me", ";fat o", ";reset me", ";clone o", ";reset me"}
local cmds2 = {";reset me", ";clearinv o", ";reset me", ";freeze o", ";reset me", ";blind o", ";reset me", ";mute o", ";reset me", ";jail o", ";reset me", ";explode o inf", ";reset me"}
local cs = {}
local whitelisted = {}
local isWhitelist = false
local ver = "1.1"
local ison = false
local del = 1
local ls = false
local time = 0.05
local rc = false
local heart = false
local bomb = false
local enli = false
local spam = false
local subp = false
local mines = false
local rdm1 = {
    "f<〪xลq", "p<บvŗ", "x<ɱqf", "g<ỵp〄1�7", "ค1�7<f〪gค1�7", "ทf<ⴭบ", "q<gxค1�7", "p<vxf", "ค1�7<gf<ɱ", "gx<f〪p",
    "p<xv〄1�7", "hx<fg", "v<ลb〪q", "f<qค1�7<x", "b<f〪p<q"
}

local rdm2 = {
    "x<gpv", "ค1�7<f〪pq", "f<qgx", "pv<fg", "g<xb〪p", "v<pg<x", "x<pv〄1�7", "p<ลg<x", "qf<ⴭร", "f<gv<q",
    "gx<vf", "vf<xค1�7", "รx<pg", "g<ลf<q", "xb〄1�7<fp"
}
local words = {" ŗ<ค1�7<ἄ1�7<ɗ<e<ɗ b<〪ỵ h<Ễ1�7<p<e<ŗ<ἄ1�7<о<ค1�7", " g<et〄1�7 h<Ễ1�7<p<e<ŗ<ἄ1�7<о<ค1�7 ค1�7<t〄1�7 ค1�7<с〄1�7<ŗ<ἄ1�7<p<t<〪b<〪ӄ1�7<о<x", " #ј<о<ἄ1�7<ค1�7 h<Ễ1�7<p<e<ŗ<ἄ1�7<о<ค1�7"}
local win = rf:CreateWindow({
   Name = "hyperion",
   Icon = 0,
   LoadingTitle = "version " .. ver,
   LoadingSubtitle = "100% skidded",
   Theme = "Default"
})
local tab1 = win:CreateTab("abuse", 4483362458)
local tab2 = win:CreateTab("protect", 4483362458)
local tab3 = win:CreateTab("spammer", 4483362458)
local tab4 = win:CreateTab("other scripts", 4483362458)
local function noti(a, b, c)
    rf:Notify({
        Title = a,
        Content = b,
        Duration = c
    })
end
noti("WARN⚠️", "Enlighten is needed for most stuff!", 5)
noti("warning!", "im a skid", 1)
-- tab 4
tab4:CreateButton({
    Name = "ZTE",
    Callback = function()
        setclipboard('loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-Zte-hub-20603"))()')
    end,
})

tab4:CreateButton({
    Name = "lazy",
    Callback = function()
      setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/FlavorYT/The-lazy-ONE/main/Made%20by%20leakz%20and%20EvilAlienWare"))()')
   end,
})
-- tab 3

tab3:CreateSlider({
   Name = "Delay",
   Range = {0.01, 20},
   Increment = 0.001,
   CurrentValue = 0.1,
   Callback = function(val)
            time = val
      end,
})

tab3:CreateToggle({
    Name = "spam",
    CurrentValue = false,
    Callback = function(s)
        spam = s
        if s then
           noti("spammer", "script is on!", 2)
            task.spawn(function()
                while spam do
                    for i = 1, #cs do
                        if not spam then break end
                        task.wait(time)
                        chat:SendAsync(cs[i])
                    end
                end
            end)
        else
            noti("spammer", "script is off!", 2)
        end
    end,
})

-- spams

tab3:CreateInput({
    Name = "spammer 1",
    PlaceholderText = "spam cmd",
    RemoveTextAfterFocusLost = true,
    Callback = function(msg)
        cs[1] = msg
       noti("WARNING", "add ; on the first text or youll get banned!", 2)
    end,
})
tab3:CreateInput({
    Name = "spammer 2",
    PlaceholderText = "spam cmd",
    RemoveTextAfterFocusLost = true,
    Callback = function(msg)
        cs[2] = msg
       noti("WARNING", "add ; on the first text or youll get banned!", 2)
    end,
})
tab3:CreateInput({
    Name = "spammer 3",
    PlaceholderText = "spam cmd",
    RemoveTextAfterFocusLost = true,
    Callback = function(msg)
        cs[3] = msg
       noti("WARNING", "add ; on the first text or youll get banned!", 2)
    end,
})
tab3:CreateInput({
    Name = "spammer 4",
    PlaceholderText = "spam cmd",
    RemoveTextAfterFocusLost = true,
    Callback = function(msg)
        cs[4] = msg
       noti("WARNING", "add ; on the first text or youll get banned!", 2)
    end,
})
tab3:CreateInput({
    Name = "spammer 5",
    PlaceholderText = "spam cmd",
    RemoveTextAfterFocusLost = true,
    Callback = function(msg)
        cs[5] = msg
       noti("WARNING", "add ; on the first text or youll get banned!", 2)
    end,
})
tab3:CreateInput({
    Name = "spammer 6",
    PlaceholderText = "spam cmd",
    RemoveTextAfterFocusLost = true,
    Callback = function(msg)
        cs[6] = msg
       noti("WARNING", "add ; on the first text or youll get banned!", 2)
    end,
})

-- tab 1

tab1:CreateToggle({
    Name = "toggle abuse",
    CurrentValue = false,
    Callback = function(s)
       ison = s
        noti("toggled abuse", "toggled to " .. tostring(s), 1.5)

        if ison then
            for i = 1, #cmdsOnce do
                task.wait(0.05)
                chat:SendAsync(cmdsOnce[i])
            end

            abuse = coroutine.create(function()
                while ison do
                    local cmds = ls and cmds1 or cmds2
                    for i = 1, #cmds do
                        if not ison then break end
                        task.wait(del)
                        chat:SendAsync(cmds[i])
                    end
                end
            end)
            coroutine.resume(abuse)
        end
    end,
})

tab1:CreateToggle({
    Name = "lag server (clones and fat)",
    CurrentValue = false,
    Callback = function(a)
       
      ls = a
        if ls then
            local cf = game:GetService("Workspace").Clones
            for _, clone in pairs(cf:GetChildren()) do
                if clone:IsA("Model") then
                    clone:Destroy()
                end
            end
        end
    end
})

tab1:CreateSlider({
   Name = "Delay",
   Range = {0.05, 4},
   Increment = 0.01,
   CurrentValue = 0.2,
   Flag = "Slider1",
   Callback = function(val)
        del = val
        noti("Delay set", "Current delay: " .. tostring(val), 1)
   end,
})
tab1:CreateButton({
    Name = "advertise hyperion",
    Callback = function()
       for i = 1, #words do
           task.wait(0.3 + math.random(0.1, 0.5))
           game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(" ; [[" .. rdm1[math.random(#rdm1)] .. rdm2[math.random(#rdm2)] .. "]] " .. words[i])
          end
       end
})
-- tab

tab2:CreateButton({
    Name = "Show Enlightened",
    Callback = function()
        for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
            if plr:GetAttribute("Arken") then
                noti("Enlightened", plr.Name .. " is enlightened", 3)
            end
        end
    end
})
tab2:CreateButton({
    Name = "Show whitelisted",
    Callback = function()
        for i = 1, #whitelisted do
           noti("whitelisted", whitelisted[i] .. " index: " .. i, 3)
        end
    end
})

tab2:CreateInput({
    Name = "Whitelist",
    PlaceholderText = "{username}",
    RemoveTextAfterFocusLost = true,
    Callback = function(v)
            for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
                if plr.Name:lower():find(v:lower()) then
                    table.insert(whitelisted, plr.Name)
                    noti("Whitelisted", plr.Name .. " added to whitelist", 3)
                end
            end
        end
})

tab2:CreateInput({
    Name = "Unwhitelist",
    PlaceholderText = "username",
    RemoveTextAfterFocusLost = true,
    Callback = function(v)
            for i = #whitelisted, 1, -1 do
                if whitelisted[i]:lower():find(v:lower()) then
                    noti("Unwhitelisted", whitelisted[i] .. " removed", 3)
                    table.remove(whitelisted, i)
                end
        end
    end
})

for _, player in pairs(game:GetService("Players"):GetPlayers()) do
    if player:GetAttribute("Arken") or (player:FindFirstChild("Backpack") and player.Backpack:FindFirstChild("The Arkenstone")) then
        table.insert(whitelisted, player.Name)
       print(player.Name)
    end
end

whitelistQ = coroutine.create(function()
    while isWhitelist do
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
    if plr.Backpack and plr.Backpack:FindFirstChild("The Arkenstone") or (workspace:FindFirstChild(plr.Name) and workspace[plr.Name]:FindFirstChild("The Arkenstone")) then
        local name = plr.Name:split("_")[1]
        local isWhitelisted = false
        for _, n in pairs(whitelisted) do
            if name:lower():find(n:lower()) then
                isWhitelisted = true
                break
            end
        end
        if not isWhitelisted then
            for i = 1, 5 do
                chat:SendAsync(";clearinv " .. name)
            end
            noti("Auto clear", "cleared enlighten! " .. name, 2)
        end
    end
end
        task.wait(0.02)
    end
end)


tab2:CreateToggle({
    Name = "whitelist",
    CurrentValue = false,
    Callback = function(v)
        isWhitelist = v
       coroutine.resume(whitelistQ)
       if coroutine.status(whitelistQ) == "suspended" then
       coroutine.resume(whitelistQ)
      end
    end
})

IsReset = false
tab2:CreateToggle({
    Name = "Auto reset",
    CurrentValue = false,
    Callback = function(v)
       IsReset = v
       
        if IsReset then
         autoReset = coroutine.create(function()
         while IsReset do
         if workspace:FindFirstChild(game.Players.LocalPlayer.Name) and workspace[game.Players.LocalPlayer.Name]:FindFirstChild("The Arkenstone") then
            chat:SendAsync(";reset me")
         end
         if not IsReset then
            break
         end
    task.wait(0.02)
  end
end)
           coroutine.resume(autoReset)
        end
    end
}) 
AutoDebug = coroutine.create(function()
    while task.wait(0.05) do
        if bomb and workspace:FindFirstChild("FuseBomb") then
        chat:SendAsync(";debug")
        noti("Auto Debug", "debuged, FuseBomb", 1)
        end
        if heart and workspace:FindFirstChild("Effect") then
        chat:SendAsync(";debug")
        noti("Auto Debug", "debuged, HeartAttack/Effect", 1)
        end
        if rc and workspace:FindFirstChild("Tank") then
        chat:SendAsync(";debug")
        noti("Auto Debug", "debuged, RcTank", 1)
        end
        if enli and game:GetService("Workspace"):FindFirstChild("The Arkenstone") and game:GetService("Workspace")["The Arkenstone"]:FindFirstChild("Handle") then
        chat:SendAsync(";debug")
        noti("Auto Debug", "debuged, The Arkenstone", 1)
        end
        if subp and workspace:FindFirstChild("SubspaceTripmine") then
        chat:SendAsync(";debug")
        noti("Auto Debug", "debuged, Subspace", 1)
        end
        if mines and workspace:FindFirstChild("Mine") then
        chat:SendAsync(";debug")
        noti("Auto Debug", "debuged, Mines", 1)
        end
    end
end)
coroutine.resume(AutoDebug)
tab2:CreateToggle({
    Name = "anti drop enli",
    CurrentValue = false,
    Callback = function(v)
        enli = v
    end,
})
tab2:CreateToggle({
    Name = "anti rctank",
    CurrentValue = false,
    Callback = function(v)
        rc = v
    end,
})
tab2:CreateToggle({
    Name = "anti Heart Attack",
    CurrentValue = false,
    Callback = function(v)
        heart = v
       noti("WARNING", "heart attck is named effect, other gears may trigger this.", 3)
    end,
})
tab2:CreateToggle({
    Name = "anti FuseBomb",
    CurrentValue = false,
    Callback = function(v)
        bomb = v
    end,
})
tab2:CreateToggle({
    Name = "anti subspace",
    CurrentValue = false,
    Callback = function(v)
        subp = v
    end,
})
tab2:CreateToggle({
    Name = "anti mines",
    CurrentValue = false,
    Callback = function(v)
        mines = v
    end,
})

end)




Section:NewButton("Lazy Hub[OUTDATED]", "Lazy Hub[OUTDATED]", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FlavorYT/The-lazy-ONE/main/Made%20by%20leakz%20and%20EvilAlienWare"))()
end)





Section:NewButton("Extra Stuff", "Extra Stuff", function()
loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-Extra-Stuff-18127"))()
end)




Section:NewButton("MEGA OP TCO", "MEGA OP TCO", function()
-- https://scriptblox.com/script/The-Chosen-One-Script-Pack-18213

-- tco script pack!

pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-OP-SCRIPT-18120"))() end)
pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-Extra-Stuff-18127"))() end)
pcall(function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Server-Hopper-21123"))() end)
end)









Section:NewButton("Abuser Gui", "AbuserGui", function()
-- https://scriptblox.com/script/The-Chosen-One-Server-abuser-skidded-34082


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local chat = game:GetService("TextChatService").TextChannels.RBXSystem

cmdsOnce = {";delcubes a", ";fog nan", ";delclones a", ";maptide nan", ";mapsize nan", ";seatide nan", ";seasize nan", ";colorless", ";myopic o"}
cmds1 = {";reset me", ";clearinv o", ";freeze o", ";blind o", ";reset me", ";mute o", ";fat o", ";clone o", ";reset me"}
cmds2 = {";reset me", ";clearinv o", ";freeze o", ";blind o", ";reset me", ";mute o", ";jail o", ";explode o inf", ";reset me"}

local ver = "1.3"
local ison = false
local del = 1
local ls = false
local al = nil
local hyp = getgenv().hyperion
local Window = Rayfield:CreateWindow({
   Name = "Server Abuser",
   Icon = 0,
   LoadingTitle = "version " .. ver,
   LoadingSubtitle = "skidded scripts",
   Theme = "Default",
   ConfigurationSaving = {
      Enabled = true,
      FileName = "ServerAbuserConfig"
   }
})

local function noti(a, b, c)
    Rayfield:Notify({
        Title = a,
        Content = b,
        Duration = c
    })
end

noti("WARN⚠️", "Enlighten is needed!", 5)

local Tab = Window:CreateTab("abuse", 4483362458)
Tab:CreateToggle({
    Name = "abuse",
    CurrentValue = false,
    Callback = function(s)
        ison = s
        noti("toggled abuse", "toggled to " .. tostring(ison), 1.5)
        
        if ison then
            for i = 1, #cmdsOnce do
                task.wait(0.15)
                chat:SendAsync(cmdsOnce[i])
            end

            al = coroutine.create(function()
                while ison do
                    local cmds = ls and cmds1 or cmds2
                    for i = 1, #cmds do
                        if not ison then break end
                        task.wait(del)
                        chat:SendAsync(cmds[i])
                    end
                end
            end)
            coroutine.resume(al)
        end
    end
})

Tab:CreateToggle({
    Name = "lag server (clone and fat)",
    CurrentValue = false,
    Callback = function(a)
        ls = a
        noti("Lag Server", "Toggled to " .. tostring(ls), 2)
        if ls then
            local cf = game:GetService("Workspace").Clones
            for _, clone in pairs(cf:GetChildren()) do
                if clone:IsA("Model") then
                    clone:Destroy()
                end
            end
        end
    end
})

Tab:CreateSlider({
   Name = "Delay",
   Range = {0.01, 1},
   Increment = 0.01,
   CurrentValue = 0.2,
   Callback = function(val)
        del = val
        noti("Delay set", "Current delay: " .. tostring(val), 1)
   end,
})

if not hyp or hyp == nil then
  noti("this script will no longer be updated, use Hyperion. (by user_ in scriptblox.com)")
elseif hyp then
  noti("use hyperion, closing script...")
  task.wait(3)
  Rayfield:Destroy()
end
end)








--sections/tabs

local Tab = Window:NewTab("Scripts")
local Section = Tab:NewSection("Scripts")






Section:NewButton("Infinite Yield", "Infinite Yield", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)










Section:NewButton("Nameless Admin", "Nameless Admin", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FD2Team/Nameless-Admin-No-Byfron-Kick/main/Source",true))()
end)









--sections/tabs

local Tab = Window:NewTab("Music section for copy paste ")
local Section = Tab:NewSection("Music section for copy paste ")












Section:NewButton("Relaxed Scene", "Relaxed Scene", function()
-- Copy And Paste Maded By Igot_KJ8
setclipboard("1848354536")
end)






Section:NewButton("No more", "No more", function()
setclipboard("1846458016")
end)












Section:NewButton("Lazy Sunday", "Lazy Sunday", function()
setclipboard("1842241530")
end)





Section:NewButton("Lava Chicken Steves Song", "Lava Chicken Steves Song", function()
setclipboard("94446515790251")
end)




Section:NewButton("gods only knows", "Gods Only Knows", function()
setclipboard("123743377480053")
end)







--sections/tabs

local Tab = Window:NewTab("Gears")
local Section = Tab:NewSection("ePiK gEaRs!1!1")
Section:NewButton("Get All Perianstrons", "epic", function()
local TextChatService = game:GetService("TextChatService")

local ids = {
    69499437,
    73829193,
    80661504,
    93136802,
    99119240,
    108158379,
    120307951,
    139577901,
    159229806,
    233520257,
    2544549379
}

TextChatService.TextChannels.RBXGeneral:SendAsync(";mute me")
task.wait(0.3)

for _, id in ipairs(ids) do
    TextChatService.TextChannels.RBXGeneral:SendAsync(";gear me " .. id)
    task.wait(0.8)
end

TextChatService.TextChannels.RBXGeneral:SendAsync(";unmute me")
end)






local Tab = Window:NewTab("Fun")
local Section = Tab:NewSection("Funny[soon..]")








local Tab = Window:NewTab("Credits")
local Section = Tab:NewSection("epic credits")





Section:NewButton("Credits", "KredIts FuN ePik1!1!1", function()
game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "this script was maded by Igot_KJ";
	Text = "scripts Anchor abuse, extra stuff, etc maded by Areyoumental110, lazy hub by FlavorYT, hyperion by the hyperion Devs";
	Icon = "rbxthumb://type=Asset&id=id here&w=150&h=150"})
Duration = 1
end)