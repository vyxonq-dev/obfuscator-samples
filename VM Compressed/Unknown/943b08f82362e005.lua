local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, -20)
title.Text = "Key System - EH"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Parent = frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragInput = nil
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local KeySystem = Instance.new("TextBox")
KeySystem.Size = UDim2.new(1, 0, 0.5, 0)
KeySystem.Position = UDim2.new(0, 0, 0, 0)
KeySystem.Text = "Enter the Key"
KeySystem.TextColor3 = Color3.new(0, 0, 0)
KeySystem.BackgroundTransparency = 0.5
KeySystem.BackgroundColor3 = Color3.new(1, 1, 1)
KeySystem.TextWrapped = true
KeySystem.Parent = frame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.5, 0, 0.5, 0)
SubmitButton.Position = UDim2.new(0, 0, 0.5, 0)
SubmitButton.Text = "Submit"
SubmitButton.Parent = frame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.Parent = frame

CloseButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Size = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Position = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Text = "Get Key"
GetKeyButton.Parent = frame
--------------------------------------------------------------------------
SubmitButton.MouseButton1Click:Connect(function()
    local KeySystem = KeySystem.Text
    if KeySystem == "iblameaabis" then   
screenGui:Destroy()

-- CARGA DE LIBRERÃA
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/rafael25ic-blip/phoenix-cracked/refs/heads/main/Pheonix%20Private%20Librerya"))()

-- OBTENER NOMBRE DEL JUGADOR
local player = game.Players.LocalPlayer
local displayName = player.DisplayName or player.Name

-- VENTANA PRINCIPAL
local window = library:AddWindow("Toxic Free Version | Skidded Script | Bienvenido " .. displayName, {
    main_color = Color3.fromRGB(34, 56, 34),
    min_size = Vector2.new(550, 820),
    can_resize = false,
})

local AutoFarm = window:AddTab("Farm OP")
AutoFarm:Show()


-- 1ï¸âƒ£ Switch: Fuerza OP
AutoFarm:AddSwitch("Fuerza OP", function(state)
    getgenv()._AutoRepFarmEnabled = state
    warn("[Auto Rep Farm] Estado cambiado a:", state and "ON" or "OFF")
end)

-- âœ… ConfiguraciÃ³n optimizada
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

local PET_NAME = "Swift Samurai"
local ROCK_NAME = "Rock5M"
local PROTEIN_EGG_NAME = "ProteinEgg"
local PROTEIN_EGG_INTERVAL = 30 * 60 -- 30 min
local REPS_PER_CYCLE = 50
local REP_DELAY = 0.01
local ROCK_INTERVAL = 1
local MAX_PING = 500

local HumanoidRootPart
local lastProteinEggTime = 0
local lastRockTime = 0
local RockRef = workspace:FindFirstChild(ROCK_NAME)

local function getPing()
    local success, ping = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    return success and ping or 999
end

local function updateCharacterRefs()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    HumanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
end

local function equipPet()
    local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if petsFolder and petsFolder:FindFirstChild("Unique") then
        for _, pet in pairs(petsFolder.Unique:GetChildren()) do
            if pet.Name == PET_NAME then
                ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
                break
            end
        end
    end
end

local function eatProteinEgg()
    if LocalPlayer:FindFirstChild("Backpack") then
        for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
            if item.Name == PROTEIN_EGG_NAME then
                ReplicatedStorage.rEvents.eatEvent:FireServer("eat", item)
                break
            end
        end
    end
end

local function hitRock()
    if not RockRef or not RockRef.Parent then
        RockRef = workspace:FindFirstChild(ROCK_NAME)
    end
    if RockRef and HumanoidRootPart then
        HumanoidRootPart.CFrame = RockRef.CFrame * CFrame.new(0, 0, -5)
        ReplicatedStorage.rEvents.hitEvent:FireServer("hit", RockRef)
    end
end

-- âœ… Loop principal
if not getgenv()._AutoRepFarmLoop then
    getgenv()._AutoRepFarmLoop = true

    task.spawn(function()
        updateCharacterRefs()
        equipPet()
        lastProteinEggTime = tick()
        lastRockTime = tick()

        while true do
            if getgenv()._AutoRepFarmEnabled then
                local ping = getPing()
                if ping > MAX_PING then
                    warn("[Auto Rep Farm] Ping alto ("..math.floor(ping).."ms), pausando 5s...")
                    task.wait(5)
                else
                    if LocalPlayer:FindFirstChild("muscleEvent") then
                        for i = 1, REPS_PER_CYCLE do
                            LocalPlayer.muscleEvent:FireServer("rep")
                        end
                    end

                    if tick() - lastProteinEggTime >= PROTEIN_EGG_INTERVAL then
                        eatProteinEgg()
                        lastProteinEggTime = tick()
                    end

                    if tick() - lastRockTime >= ROCK_INTERVAL then
                        hitRock()
                        lastRockTime = tick()
                    end

                    task.wait(REP_DELAY)
                end
            else
                task.wait(1)
            end
        end
    end)
end



-- 2ï¸âƒ£ Switch: Eat Egg (30 Min)
local autoEatEnabled = false
local function eatProteinEggNew()
    local player = game.Players.LocalPlayer
    local backpack = player:WaitForChild("Backpack")
    local character = player.Character or player.CharacterAdded:Wait()

    local egg = backpack:FindFirstChild("Protein Egg")
    if egg then
        egg.Parent = character
        pcall(function()
            egg:Activate()
        end)
        print("[AutoEgg] Protein Egg consumido.")
    else
        warn("[AutoEgg] No se encontrÃ³ Protein Egg en Backpack.")
    end
end

task.spawn(function()
    while true do
        if autoEatEnabled then
            eatProteinEggNew()
            task.wait(1800)
        else
            task.wait(1)
        end
    end
end)

AutoFarm:AddSwitch("Eat Egg (30 Min)", function(state)
    autoEatEnabled = state
    print(state and "[AutoEgg] Activado." or "[AutoEgg] Desactivado.")
end)


-- 4ï¸âƒ£ Switch: Anti Lag
AutoFarm:AddSwitch("Anti Lag", function(State)
    local lighting = game:GetService("Lighting")
    if State then
        for _, gui in pairs(LocalPlayer.PlayerGui:GetChildren()) do
            if gui:IsA("ScreenGui") then gui:Destroy() end
        end
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") or obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                obj:Destroy()
            end
        end
        for _, v in pairs(lighting:GetChildren()) do
            if v:IsA("Sky") then v:Destroy() end
        end
        local darkSky = Instance.new("Sky")
        darkSky.Name = "DarkSky"
        darkSky.SkyboxBk = "rbxassetid://0"
        darkSky.SkyboxDn = "rbxassetid://0"
        darkSky.SkyboxFt = "rbxassetid://0"
        darkSky.SkyboxLf = "rbxassetid://0"
        darkSky.SkyboxRt = "rbxassetid://0"
        darkSky.SkyboxUp = "rbxassetid://0"
        darkSky.Parent = lighting
        lighting.Brightness = 0
        lighting.ClockTime = 0
        lighting.TimeOfDay = "00:00:00"
        lighting.OutdoorAmbient = Color3.new(0,0,0)
        lighting.Ambient = Color3.new(0,0,0)
        lighting.FogColor = Color3.new(0,0,0)
        lighting.FogEnd = 100
        task.spawn(function()
            while State do
                task.wait(5)
                if not lighting:FindFirstChild("DarkSky") then
                    darkSky:Clone().Parent = lighting
                end
            end
        end)
    end
end)


-- ðŸ”¹ SWITCH PARA ACTIVAR/DESACTIVAR EL ANTI AFK
AutoFarm:AddSwitch("Anti AFK", function(state)
    if state then
        -- âœ… ACTIVAR ANTI AFK
        if getgenv().AntiAfkExecuted and thisoneissocoldww then 
            getgenv().AntiAfkExecuted = false
            getgenv().zamanbaslaticisi = false
            game.CoreGui.thisoneissocoldww:Destroy()
        end
        getgenv().AntiAfkExecuted = true

        local thisoneissocoldww = Instance.new("ScreenGui")
        local madebybloodofbatus = Instance.new("Frame")
        local UICornerw = Instance.new("UICorner")
        local DestroyButton = Instance.new("TextButton")
        local uselesslabelone = Instance.new("TextLabel")
        local timerlabel = Instance.new("TextLabel")
        local uselesslabeltwo = Instance.new("TextLabel")
        local fpslabel = Instance.new("TextLabel")
        local uselesslabelthree = Instance.new("TextLabel")
        local pinglabel = Instance.new("TextLabel")
        local uselessframeone = Instance.new("Frame")
        local UICornerww = Instance.new("UICorner")
        local uselesslabelfour = Instance.new("TextLabel")

        thisoneissocoldww.Name = "thisoneissocoldww"
        thisoneissocoldww.Parent = game.CoreGui
        thisoneissocoldww.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        madebybloodofbatus.Name = "madebybloodofbatus"
        madebybloodofbatus.Parent = thisoneissocoldww
        madebybloodofbatus.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        madebybloodofbatus.Position = UDim2.new(0.085,0,0.13,0)
        madebybloodofbatus.Size = UDim2.new(0,225,0,96)
        UICornerw.Parent = madebybloodofbatus

        DestroyButton.Name = "DestroyButton"
        DestroyButton.Parent = madebybloodofbatus
        DestroyButton.BackgroundTransparency = 1
        DestroyButton.Position = UDim2.new(0.87,0,0.02,0)
        DestroyButton.Size = UDim2.new(0,27,0,15)
        DestroyButton.Font = Enum.Font.SourceSans
        DestroyButton.Text = "X"
        DestroyButton.TextColor3 = Color3.fromRGB(255,255,255)
        DestroyButton.TextSize = 14
        DestroyButton.MouseButton1Click:Connect(function()
            getgenv().AntiAfkExecuted = false
            wait(0.1)
            thisoneissocoldww:Destroy()
        end)

        uselesslabelone.Parent = madebybloodofbatus
        uselesslabelone.BackgroundTransparency = 1
        uselesslabelone.Position = UDim2.new(0.3,0,0,0)
        uselesslabelone.Size = UDim2.new(0,95,0,24)
        uselesslabelone.Font = Enum.Font.SourceSans
        uselesslabelone.Text = "Anti Afk V2 BY MVX_DeathKillerX"
        uselesslabelone.TextColor3 = Color3.fromRGB(255,255,255)
        uselesslabelone.TextSize = 14

        timerlabel.Parent = madebybloodofbatus
        timerlabel.BackgroundTransparency = 1
        timerlabel.Position = UDim2.new(0.65,0,0.68,0)
        timerlabel.Size = UDim2.new(0,60,0,24)
        timerlabel.Font = Enum.Font.SourceSans
        timerlabel.Text = "0:0:0"
        timerlabel.TextColor3 = Color3.fromRGB(255,255,255)
        timerlabel.TextSize = 14

        uselesslabeltwo.Parent = madebybloodofbatus
        uselesslabeltwo.BackgroundTransparency = 1
        uselesslabeltwo.Position = UDim2.new(0.03,0,0.37,0)
        uselesslabeltwo.Size = UDim2.new(0,29,0,24)
        uselesslabeltwo.Font = Enum.Font.SourceSans
        uselesslabeltwo.Text = "Ping: "
        uselesslabeltwo.TextColor3 = Color3.fromRGB(255,255,255)
        uselesslabeltwo.TextSize = 14

        fpslabel.Parent = madebybloodofbatus
        fpslabel.BackgroundTransparency = 1
        fpslabel.Position = UDim2.new(0.72,0,0.35,0)
        fpslabel.Size = UDim2.new(0,55,0,24)
        fpslabel.Font = Enum.Font.SourceSans
        fpslabel.Text = "0"
        fpslabel.TextColor3 = Color3.fromRGB(255,255,255)
        fpslabel.TextSize = 14

        uselesslabelthree.Parent = madebybloodofbatus
        uselesslabelthree.BackgroundTransparency = 1
        uselesslabelthree.Position = UDim2.new(0.5,0,0.35,0)
        uselesslabelthree.Size = UDim2.new(0,26,0,24)
        uselesslabelthree.Font = Enum.Font.SourceSans
        uselesslabelthree.Text = "Fps: "
        uselesslabelthree.TextColor3 = Color3.fromRGB(255,255,255)
        uselesslabelthree.TextSize = 14

        pinglabel.Parent = madebybloodofbatus
        pinglabel.BackgroundTransparency = 1
        pinglabel.Position = UDim2.new(0.2,0,0.37,0)
        pinglabel.Size = UDim2.new(0,55,0,24)
        pinglabel.Font = Enum.Font.SourceSans
        pinglabel.Text = "0"
        pinglabel.TextColor3 = Color3.fromRGB(255,255,255)
        pinglabel.TextSize = 14
        pinglabel.TextWrapped = true

        uselessframeone.Parent = madebybloodofbatus
        uselessframeone.BackgroundColor3 = Color3.fromRGB(255,255,255)
        uselessframeone.Position = UDim2.new(0.004,0,0.24,0)
        uselessframeone.Size = UDim2.new(0,224,0,5)
        UICornerww.CornerRadius = UDim.new(0,50)
        UICornerww.Parent = uselessframeone

        uselesslabelfour.Parent = madebybloodofbatus
        uselesslabelfour.BackgroundTransparency = 1
        uselesslabelfour.Position = UDim2.new(0.05,0,0.81,0)
        uselesslabelfour.Size = UDim2.new(0,95,0,12)
        uselesslabelfour.Font = Enum.Font.SourceSans
        uselesslabelfour.Text = "Anti-Afk Auto Enabled"
        uselesslabelfour.TextColor3 = Color3.fromRGB(255,255,255)
        uselesslabelfour.TextSize = 14

        -- ðŸ§² Draggable UI
        local Drag = madebybloodofbatus
        local gsTween = game:GetService("TweenService")
        local UserInputService = game:GetService("UserInputService")
        local dragging, dragInput, dragStart, startPos
        local function update(input)
            local delta = input.Position - dragStart
            local dragTime = 0.04
            local SmoothDrag = {}
            SmoothDrag.Position = UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
            gsTween:Create(Drag,TweenInfo.new(dragTime,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),SmoothDrag):Play()
        end
        Drag.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = Drag.Position
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then dragging = false end
                end)
            end
        end)
        Drag.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then update(input) end
        end)

        -- ðŸ’¤ Anti-AFK Core
        local vu = game:GetService('VirtualUser')
        game.Players.LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)

        -- âš¡ FPS & Ping
        local RunService = game:GetService("RunService")
        local sec = tick()
        local FPS = {}
        RunService.RenderStepped:Connect(function()
            local fr = tick()
            for i=#FPS,1,-1 do FPS[i+1] = (FPS[i]>=fr-1) and FPS[i] or nil end
            FPS[1] = fr
            local fps = math.floor((tick()-sec>=1 and #FPS) or (#FPS/(tick()-sec)))
            fpslabel.Text = fps
        end)

        spawn(function()
            while getgenv().AntiAfkExecuted do
                wait(1)
                local ping = math.floor(tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue()))
                pinglabel.Text = ping
            end
        end)

        -- â±ï¸ Timer
        local saniye, dakika, saat = 0,0,0
        getgenv().zamanbaslaticisi = true
        spawn(function()
            while getgenv().zamanbaslaticisi do
                saniye = saniye + 1
                wait(1)
                if saniye>=60 then saniye=0;dakika=dakika+1 end
                if dakika>=60 then dakika=0;saat=saat+1 end
                timerlabel.Text = saat..":"..dakika..":"..saniye
            end
        end)
    else
        -- âŒ DESACTIVAR ANTI AFK
        getgenv().AntiAfkExecuted = false
        getgenv().zamanbaslaticisi = false
        if game.CoreGui:FindFirstChild("thisoneissocoldww") then
            game.CoreGui.thisoneissocoldww:Destroy()
        end
    end
end)


-- ðŸŽ° BotÃ³n: Girar Ruleta
AutoFarm:AddButton("Auto Ruleta", function(state)
    _G.AutoSpinWheel = state
    
    if state then
        spawn(function()
            while _G.AutoSpinWheel and task.wait(0.1) do
                game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer(
                    "openFortuneWheel",
                    game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"]
                )
            end
        end)
    end
end)

-- ðŸ“Œ FOLDER REBIRTH (Ordenado con Anti AFK antes de Anti Lag)
local RebirthFolder = AutoFarm:AddFolder("Rebirth")

-- ðŸ” Fast Rebirths
RebirthFolder:AddSwitch("Fast Rebirths", function(state)
    getgenv().AutoFarming = state
    if state then
        task.spawn(function()
            local a = ReplicatedStorage
            local c = LocalPlayer
            local function equipPetByName(name)
                local folderPets = c:FindFirstChild("petsFolder")
                if not folderPets then return end
                for _, folder in pairs(folderPets:GetChildren()) do
                    if folder:IsA("Folder") then
                        for _, pet in pairs(folder:GetChildren()) do
                            if pet.Name == name then
                                a.rEvents.equipPetEvent:FireServer("equipPet", pet)
                            end
                        end
                    end
                end
            end
            local function unequipAllPets()
                local f = c:FindFirstChild("petsFolder")
                if not f then return end
                for _, folder in pairs(f:GetChildren()) do
                    if folder:IsA("Folder") then
                        for _, pet in pairs(folder:GetChildren()) do
                            a.rEvents.equipPetEvent:FireServer("unequipPet", pet)
                        end
                    end
                end
                task.wait(0.1)
            end
            local function getGoldenRebirthCount()
                local g = c:FindFirstChild("ultimatesFolder")
                if g and g:FindFirstChild("Golden Rebirth") then
                    return g["Golden Rebirth"].Value
                end
                return 0
            end
            local function getStrengthRequiredForRebirth()
                local rebirths = c.leaderstats.Rebirths.Value
                local baseStrength = 10000 + (5000 * rebirths)
                local golden = getGoldenRebirthCount()
                if golden >= 1 and golden <= 5 then
                    baseStrength = baseStrength * (1 - golden * 0.1)
                end
                return math.floor(baseStrength)
            end
            while getgenv().AutoFarming do
                local requiredStrength = getStrengthRequiredForRebirth()
                unequipAllPets()
                equipPetByName("Swift Samurai")
                while c.leaderstats.Strength.Value < requiredStrength and getgenv().AutoFarming do
                    for _ = 1, 10 do
                        c.muscleEvent:FireServer("rep")
                    end
                    task.wait()
                end
                if getgenv().AutoFarming then
                    unequipAllPets()
                    equipPetByName("Tribal Overlord")
                    local oldRebirths = c.leaderstats.Rebirths.Value
                    repeat
                        a.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
                        task.wait(0.1)
                    until c.leaderstats.Rebirths.Value > oldRebirths or not getgenv().AutoFarming
                end
                task.wait()
            end
        end)
    end
end)

-- ðŸ”’ Lock Position
RebirthFolder:AddSwitch("Lock Position", function(Value)
    if Value then
        local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
            end
        end)
    else
        if getgenv().posLock then
            getgenv().posLock:Disconnect()
            getgenv().posLock = nil
        end
    end
end)

-- ðŸ–¼ï¸ Hide All Frames
RebirthFolder:AddSwitch("Hide All Frames", function(bool)
    local rSto = game:GetService("ReplicatedStorage")
    for _, obj in pairs(rSto:GetChildren()) do
        if obj.Name:match("Frame$") then
            obj.Visible = not bool
        end
    end
end)

-- ðŸš€ Anti Lag
RebirthFolder:AddButton("Anti Lag", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
            v.Enabled = false
        end
    end

    local lighting = game:GetService("Lighting")
    lighting.GlobalShadows = false
    lighting.FogEnd = 9e9
    lighting.Brightness = 0

    settings().Rendering.QualityLevel = 1

    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            if v.Parent and (v.Parent:FindFirstChild("Humanoid") or v.Parent.Parent:FindFirstChild("Humanoid")) then
            else
                v.Reflectance = 0
            end
        end
    end

    for _, v in pairs(lighting:GetChildren()) do
        if v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BloomEffect") or v:IsA("DepthOfFieldEffect") then
            v.Enabled = false
        end
    end

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Anti Lag Activado",
        Text = "Full optimization applied!",
        Duration = 5
    })
end)

-- ðŸŽ° Auto Ruleta
RebirthFolder:AddButton("Auto Ruleta", function(state)
    _G.AutoSpinWheel = state
    
    if state then
        spawn(function()
            while _G.AutoSpinWheel and task.wait(0.1) do
                game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer(
                    "openFortuneWheel",
                    game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"]
                )
            end
        end)
    end
end)


-- ðŸŸ¢ Jungle Lift (Nuevo)
RebirthFolder:AddButton("Jungle Lift", function()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    hrp.CFrame = CFrame.new(-8652.8672, 29.2667, 2089.2617)
    task.wait(0.2)

    local VirtualInputManager = game:GetService("VirtualInputManager")
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)

    print("[Jungle Lift] Teletransport ejecutado correctamente.")
end)

AutoFarm:AddLabel("Farm Sin Packs")

local autoEquipToolsFolder = AutoFarm:AddFolder("Auto Tools")


autoEquipToolsFolder:AddSwitch("Fuerza OP", function(state)
    getgenv()._AutoRepFarmEnabled = state
    warn("[Auto Rep Farm] Estado cambiado a:", state and "ON" or "OFF")
end)

-- âœ… ConfiguraciÃ³n optimizada
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer

local PET_NAME = "Swift Samurai"
local ROCK_NAME = "Rock5M"
local PROTEIN_EGG_NAME = "ProteinEgg"
local PROTEIN_EGG_INTERVAL = 30 * 60 -- 30 min
local REPS_PER_CYCLE = 60
local REP_DELAY = 0.01
local ROCK_INTERVAL = 3
local MAX_PING = 500

local HumanoidRootPart
local lastProteinEggTime = 0
local lastRockTime = 0
local RockRef = workspace:FindFirstChild(ROCK_NAME)

local function getPing()
    local success, ping = pcall(function()
        return Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    return success and ping or 999
end

local function updateCharacterRefs()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    HumanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
end

local function equipPet()
    local petsFolder = LocalPlayer:FindFirstChild("petsFolder")
    if petsFolder and petsFolder:FindFirstChild("Unique") then
        for _, pet in pairs(petsFolder.Unique:GetChildren()) do
            if pet.Name == PET_NAME then
                ReplicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
                break
            end
        end
    end
end

local function eatProteinEgg()
    if LocalPlayer:FindFirstChild("Backpack") then
        for _, item in pairs(LocalPlayer.Backpack:GetChildren()) do
            if item.Name == PROTEIN_EGG_NAME then
                ReplicatedStorage.rEvents.eatEvent:FireServer("eat", item)
                break
            end
        end
    end
end

local function hitRock()
    if not RockRef or not RockRef.Parent then
        RockRef = workspace:FindFirstChild(ROCK_NAME)
    end
    if RockRef and HumanoidRootPart then
        HumanoidRootPart.CFrame = RockRef.CFrame * CFrame.new(0, 0, -5)
        ReplicatedStorage.rEvents.hitEvent:FireServer("hit", RockRef)
    end
end

-- âœ… Loop principal
if not getgenv()._AutoRepFarmLoop then
    getgenv()._AutoRepFarmLoop = true

    task.spawn(function()
        updateCharacterRefs()
        equipPet()
        lastProteinEggTime = tick()
        lastRockTime = tick()

        while true do
            if getgenv()._AutoRepFarmEnabled then
                local ping = getPing()
                if ping > MAX_PING then
                    warn("[Auto Rep Farm] Ping alto ("..math.floor(ping).."ms), pausando 5s...")
                    task.wait(5)
                else
                    if LocalPlayer:FindFirstChild("muscleEvent") then
                        for i = 1, REPS_PER_CYCLE do
                            LocalPlayer.muscleEvent:FireServer("rep")
                        end
                    end

                    if tick() - lastProteinEggTime >= PROTEIN_EGG_INTERVAL then
                        eatProteinEgg()
                        lastProteinEggTime = tick()
                    end

                    if tick() - lastRockTime >= ROCK_INTERVAL then
                        hitRock()
                        lastRockTime = tick()
                    end

                    task.wait(REP_DELAY)
                end
            else
                task.wait(1)
            end
        end
    end)
end


-- BotÃ³n para desbloquear el Gamepass AutoLift
autoEquipToolsFolder:AddButton("Gamepass AutoLift", function()
    local gamepassFolder = game:GetService("ReplicatedStorage").gamepassIds
    local player = game:GetService("Players").LocalPlayer
    for _, gamepass in pairs(gamepassFolder:GetChildren()) do
        local value = Instance.new("IntValue")
        value.Name = gamepass.Name
        value.Value = gamepass.Value
        value.Parent = player.ownedGamepasses
    end
end)

-- FunciÃ³n para crear switches de auto-equip
local function createAutoToolSwitch(toolName, globalVar)
    autoEquipToolsFolder:AddSwitch("Auto " .. toolName, function(Value)
        _G[globalVar] = Value
        
        if Value then
            local tool = LocalPlayer.Backpack:FindFirstChild(toolName)
            if tool then
                LocalPlayer.Character.Humanoid:EquipTool(tool)
            end
        else
            local character = LocalPlayer.Character
            local equipped = character:FindFirstChild(toolName)
            if equipped then
                equipped.Parent = LocalPlayer.Backpack
            end
        end
        
        task.spawn(function()
            while _G[globalVar] do
                if not _G[globalVar] then break end
                LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0.1)
            end
        end)
    end)
end

createAutoToolSwitch("Weight", "AutoWeight")
createAutoToolSwitch("Pushups", "AutoPushups")
createAutoToolSwitch("Handstands", "AutoHandstands")
createAutoToolSwitch("Situps", "AutoSitups")


autoEquipToolsFolder:AddSwitch("Auto Punch", function(Value)
    _G.fastHitActive = Value
    
    if Value then
        task.spawn(function()
            while _G.fastHitActive do
                if not _G.fastHitActive then break end
                
                local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
                if punch then
                    punch.Parent = LocalPlayer.Character
                    if punch:FindFirstChild("attackTime") then
                        punch.attackTime.Value = 0
                    end
                end
                task.wait(0.1)
            end
        end)
        
        task.spawn(function()
            while _G.fastHitActive do
                if not _G.fastHitActive then break end
                
                LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
                LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
                
                local character = LocalPlayer.Character
                if character then
                    local punchTool = character:FindFirstChild("Punch")
                    if punchTool then
                        punchTool:Activate()
                    end
                end
                task.wait()
            end
        end)
    else
        local character = LocalPlayer.Character
        local equipped = character:FindFirstChild("Punch")
        if equipped then
            equipped.Parent = LocalPlayer.Backpack
        end
    end
end)

autoEquipToolsFolder:AddSwitch("Fast Tools", function(Value)
    _G.FastTools = Value
    
    local toolSettings = {
        {"Punch", "attackTime", Value and 0 or 0.35},
        {"Ground Slam", "attackTime", Value and 0 or 6},
        {"Stomp", "attackTime", Value and 0 or 7},
        {"Handstands", "repTime", Value and 0 or 1},
        {"Pushups", "repTime", Value and 0 or 1},
        {"Weight", "repTime", Value and 0 or 1},
        {"Situps", "repTime", Value and 0 or 1}
    }
    
    local backpack = LocalPlayer:WaitForChild("Backpack")
    
    for _, toolInfo in ipairs(toolSettings) do
        local tool = backpack:FindFirstChild(toolInfo[1])
        if tool and tool:FindFirstChild(toolInfo[2]) then
            tool[toolInfo[2]].Value = toolInfo[3]
        end
        
        local equippedTool = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild(toolInfo[1])
        if equippedTool and equippedTool:FindFirstChild(toolInfo[2]) then
            equippedTool[toolInfo[2]].Value = toolInfo[3]
        end
    end
end)


-- ðŸ“Œ NUEVO FOLDER ROCKS

local folder = AutoFarm:AddFolder("Rock Farming")
 
local function gettool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
 
local tinyIslandRockSwitch = folder:AddSwitch("Farm Tiny Island Rock", function(bool)
    selectrock = "Tiny Island Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 0 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 0 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local starterIslandRockSwitch = folder:AddSwitch("Farm Starter Island Rock", function(bool)
    selectrock = "Starter Island Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 100 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 100 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local legendBeachRockSwitch = folder:AddSwitch("Farm Legend Beach Rock", function(bool)
    selectrock = "Legend Beach Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 5000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 5000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local frostGymRockSwitch = folder:AddSwitch("Farm Frost Gym Rock", function(bool)
    selectrock = "Frost Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 150000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 150000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local mythicalGymRockSwitch = folder:AddSwitch("Farm Mythical Gym Rock", function(bool)
    selectrock = "Mythical Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 400000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 400000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local eternalGymRockSwitch = folder:AddSwitch("Farm Eternal Gym Rock", function(bool)
    selectrock = "Eternal Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 750000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 750000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local legendGymRockSwitch = folder:AddSwitch("Farm Legend Gym Rock", function(bool)
    selectrock = "Legend Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 1000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local muscleKingGymRockSwitch = folder:AddSwitch("Farm Muscle King Gym Rock", function(bool)
    selectrock = "Muscle King Gym Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 5000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
local ancientJungleRockSwitch = folder:AddSwitch("Farm Ancient Jungle Rock", function(bool)
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = bool
 
    if bool then
        spawn(function()
            while getgenv().autoFarm do
                task.wait()
                if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
                    for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                        if v.Name == "neededDurability" and v.Value == 10000000 and 
                           game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and 
                           game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
 
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                            firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                            gettool()
                        end
                    end
                end
            end
        end)
    end
end)
 
 
getgenv().StarterIslandBenchPress = false
getgenv().StarterIslandSquat = false
getgenv().StarterIslandDeadlift = false
getgenv().StarterIslandPullUp = false
getgenv().StarterIslandBoulder = false
 
getgenv().LegendBeachBenchPress = false
getgenv().LegendBeachSquat = false
getgenv().LegendBeachDeadlift = false
getgenv().LegendBeachPullUp = false
getgenv().LegendBeachBoulder = false
 
getgenv().FrostGymBenchPress = false
getgenv().FrostGymSquat = false
getgenv().FrostGymDeadlift = false
getgenv().FrostGymPullUp = false
getgenv().FrostGymBoulder = false
 
getgenv().MythicalGymBenchPress = false
getgenv().MythicalGymSquat = false
getgenv().MythicalGymDeadlift = false
getgenv().MythicalGymPullUp = false
getgenv().MythicalGymBoulder = false
 
getgenv().EternalGymBenchPress = false
getgenv().EternalGymSquat = false
getgenv().EternalGymDeadlift = false
getgenv().EternalGymPullUp = false
getgenv().EternalGymBoulder = false
 
getgenv().LegendGymBenchPress = false
getgenv().LegendGymSquat = false
getgenv().LegendGymDeadlift = false
getgenv().LegendGymPullUp = false
getgenv().LegendGymBoulder = false
 
getgenv().MuscleKingGymBenchPress = false
getgenv().MuscleKingGymSquat = false
getgenv().MuscleKingGymDeadlift = false
getgenv().MuscleKingGymPullUp = false
getgenv().MuscleKingGymBoulder = false
 
getgenv().JungleGymBenchPress = false
getgenv().JungleGymSquat = false
getgenv().JungleGymDeadlift = false
getgenv().JungleGymPullUp = false
getgenv().JungleGymBoulder = false
 
local positions = {
    StarterIsland = {
        BenchPress = CFrame.new(-17.0609932, 3.31417918, -2.48164988),
        Squat = CFrame.new(-48.8711243, 3.31417918, -11.8831778),
        Deadlift = CFrame.new(-48.8711243, 3.31417918, -11.8831778),
        PullUp = CFrame.new(-33.3047485, 3.31417918, -11.8831778),
        Boulder = CFrame.new(-33.3047485, 3.31417918, -11.8831778)
    },
    LegendBeach = {
        BenchPress = CFrame.new(470.334656, 3.31417966, -321.053925),
        Squat = CFrame.new(470.334656, 3.31417966, -321.053925),
        Deadlift = CFrame.new(470.334656, 3.31417966, -321.053925),
        PullUp = CFrame.new(470.334656, 3.31417966, -321.053925),
        Boulder = CFrame.new(470.334656, 3.31417966, -321.053925)
    },
    FrostGym = {
        BenchPress = CFrame.new(-3013.24194, 39.2158546, -335.036926),
        Squat = CFrame.new(-2933.47998, 29.6399612, -579.946045),
        Deadlift = CFrame.new(-2933.47998, 29.6399612, -579.946045),
        PullUp = CFrame.new(-2933.47998, 29.6399612, -579.946045),
        Boulder = CFrame.new(-2933.47998, 29.6399612, -579.946045)
    },
    MythicalGym = {
        BenchPress = CFrame.new(2371.7356, 39.2158546, 1246.31555),
        Squat = CFrame.new(2489.21484, 3.67686629, 849.051025),
        Deadlift = CFrame.new(2489.21484, 3.67686629, 849.051025),
        PullUp = CFrame.new(2489.21484, 3.67686629, 849.051025),
        Boulder = CFrame.new(2489.21484, 3.67686629, 849.051025)
    },
    EternalGym = {
        BenchPress = CFrame.new(-7176.19141, 45.394104, -1106.31421),
        Squat = CFrame.new(-7176.19141, 45.394104, -1106.31421),
        Deadlift = CFrame.new(-7176.19141, 45.394104, -1106.31421),
        PullUp = CFrame.new(-7176.19141, 45.394104, -1106.31421),
        Boulder = CFrame.new(-7176.19141, 45.394104, -1106.31421)
    },
    LegendGym = {
        BenchPress = CFrame.new(4111.91748, 1020.46674, -3799.97217),
        Squat = CFrame.new(4304.99023, 987.829956, -4124.2334),
        Deadlift = CFrame.new(4304.99023, 987.829956, -4124.2334),
        PullUp = CFrame.new(4304.99023, 987.829956, -4124.2334),
        Boulder = CFrame.new(4304.99023, 987.829956, -4124.2334)
    },
    MuscleKingGym = {
        BenchPress = CFrame.new(-8590.06152, 46.0167427, -6043.34717),
        Squat = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
        Deadlift = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
        PullUp = CFrame.new(-8940.12402, 13.1642084, -5699.13477),
        Boulder = CFrame.new(-8940.12402, 13.1642084, -5699.13477)
    },
    JungleGym = {
        BenchPress = CFrame.new(-8173, 64, 1898),
        Squat = CFrame.new(-8352, 34, 2878),
        Deadlift = CFrame.new(-8352, 34, 2878),
        PullUp = CFrame.new(-8666, 34, 2070),
        Boulder = CFrame.new(-8621, 34, 2684)
    }
}
 
function teleportLoop(key)
    task.spawn(function()
        while getgenv()[key] do
            local parts = {}
            for loc, workouts in pairs(positions) do
                for workout, cf in pairs(workouts) do
                    if key == loc .. workout then
                        table.insert(parts, cf)
                    end
                end
            end
            if #parts > 0 and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = parts[1]
            end
            task.wait(0.1)
        end
    end)
end


local rebirthsFolder = AutoFarm:AddFolder("Rebirths")

-- Target rebirth input - direct text input
rebirthsFolder:AddTextBox("Rebirth Target", function(text)
    local newValue = tonumber(text)
    if newValue and newValue > 0 then
        targetRebirthValue = newValue
        updateStats() -- Call the stats update function
        
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Objetivo Actualizado",
            Text = "Nuevo objetivo: " .. tostring(targetRebirthValue) .. " renacimientos",
            Duration = 0
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Entrada InvÃƒÂ¡lida",
            Text = "Por favor ingresa un nÃƒÂºmero vÃƒÂ¡lido mayor que 0",
            Duration = 0
        })
    end
end)

-- Create toggle switches
local infiniteSwitch -- Forward declaration

local targetSwitch = rebirthsFolder:AddSwitch("Auto Rebirth Target", function(bool)
    _G.targetRebirthActive = bool
    
    if bool then
        -- Turn off infinite rebirth if it's on
        if _G.infiniteRebirthActive and infiniteSwitch then
            infiniteSwitch:Set(false)
            _G.infiniteRebirthActive = false
        end
        
        -- Start target rebirth loop
        spawn(function()
            while _G.targetRebirthActive and wait(0.1) do
                local currentRebirths = game.Players.LocalPlayer.leaderstats.Rebirths.Value
                
                if currentRebirths >= targetRebirthValue then
                    targetSwitch:Set(false)
                    _G.targetRebirthActive = false
                    
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "Ã‚Â¡Objetivo Alcanzado!",
                        Text = "Has alcanzado " .. tostring(targetRebirthValue) .. " renacimientos",
                        Duration = 5
                    })
                    
                    break
                end
                
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            end
        end)
    end
end, "Renacimiento automÃƒÂ¡tico hasta alcanzar el objetivo")

infiniteSwitch = rebirthsFolder:AddSwitch("Auto Rebirth (Infinite)", function(bool)
    _G.infiniteRebirthActive = bool
    
    if bool then
        -- Turn off target rebirth if it's on
        if _G.targetRebirthActive and targetSwitch then
            targetSwitch:Set(false)
            _G.targetRebirthActive = false
        end
        
        -- Start infinite rebirth loop
        spawn(function()
            while _G.infiniteRebirthActive and wait(0.1) do
                game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            end
        end)
    end
end, "Renacimiento continuo sin parar")

local sizeSwitch = rebirthsFolder:AddSwitch("Auto Size 1", function(bool)
    _G.autoSizeActive = bool
    
    if bool then
        spawn(function()
            while _G.autoSizeActive and wait() do
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 1)
            end
        end)
    end
end, "Establece el tamaÃƒÂ±o del personaje a 1 continuamente")

local teleportSwitch = rebirthsFolder:AddSwitch("Auto Teleport to Muscle King", function(bool)
    _G.teleportActive = bool
    
    if bool then
        spawn(function()
            while _G.teleportActive and wait() do
                if game.Players.LocalPlayer.Character then
                    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-8646, 17, -5738))
                end
            end
        end)
    end
end, "Teletransporte continuo al Rey MÃƒÂºsculo")


local Calculadora = window:AddTab("Calculator", Color3.fromRGB(200, 100, 100))

local baseStrength = 0
local resultadoLabelsDamage = {}

local FolderDamage = Calculadora:AddFolder("Pack Damage Calculator")

FolderDamage:AddTextBox("Base Strongth (ej: 1.27Qa, T, B)", function(text)
    local unidades = { ["T"] = 1e12, ["Q"] = 1e15, ["B"] = 1e9 }
    text = text:upper()
    for u, m in pairs(unidades) do
        if text:find(u) then
            local num = tonumber(text:match("(%d+%.?%d*)"))
            if num then
                baseStrength = num * m
                return
            end
        end
    end
    baseStrength = tonumber(text:match("(%d+%.?%d*)")) or 0
end)

local mensajeLabelDamage = FolderDamage:AddLabel("")

for i = 1, 8 do
    resultadoLabelsDamage[i] = FolderDamage:AddLabel(string.format("%d pack(s): -", i))
end

FolderDamage:AddButton("Calculate Damage", function()
    if baseStrength <= 0 then
        mensajeLabelDamage.Text = "Enter a valid value."
        for i = 1, 8 do
            resultadoLabelsDamage[i].Text = string.format("%d pack(s): -", i)
        end
        return
    end

    mensajeLabelDamage.Text = ""

    local danoAjustado = baseStrength * 0.10
    local incremento = 0.335

    for pack = 1, 8 do
        local mult = 1 + (pack * incremento)
        local valor = danoAjustado * mult

        local disp
        if valor >= 1e15 then
            disp = string.format("%.3f Qa", valor / 1e15)
        elseif valor >= 1e12 then
            disp = string.format("%.2f T", valor / 1e12)
        elseif valor >= 1e9 then
            disp = string.format("%.2f B", valor / 1e9)
        else
            disp = tostring(math.floor(valor))
        end

        resultadoLabelsDamage[pack].Text = string.format("%d pack(s): %s", pack, disp)
    end
end)

local baseDurabilidad = 0
local resultadoLabelsDurabilidad = {}

local FolderDurabilidad = Calculadora:AddFolder("Pack Durability Calculator")

FolderDurabilidad:AddTextBox("Base durability (ej: 1.27Qa, T, B)", function(text)
    local unidades = { ["T"] = 1e12, ["Q"] = 1e15, ["B"] = 1e9 }
    text = text:upper()
    for u, m in pairs(unidades) do
        if text:find(u) then
            local num = tonumber(text:match("(%d+%.?%d*)"))
            if num then
                baseDurabilidad = num * m
                return
            end
        end
    end
    baseDurabilidad = tonumber(text:match("(%d+%.?%d*)")) or 0
end)

local mensajeLabelDurabilidad = FolderDurabilidad:AddLabel("")

for i = 1, 8 do
    resultadoLabelsDurabilidad[i] = FolderDurabilidad:AddLabel(string.format("%d pack(s): -", i))
end

FolderDurabilidad:AddButton("Calculate Durability", function()
    if baseDurabilidad <= 0 then
        mensajeLabelDurabilidad.Text = "Enter a valid value."
        for i = 1, 8 do
            resultadoLabelsDurabilidad[i].Text = string.format("%d pack(s): -", i)
        end
        return
    end

    mensajeLabelDurabilidad.Text = ""

    local incremento = 0.335
    local adicional = 1.5

    for pack = 1, 8 do
        local mult = 1 + (pack * incremento)
        local valor = baseDurabilidad * mult * adicional

        local disp
        if valor >= 1e15 then
            disp = string.format("%.3f Qa", valor / 1e15)
        elseif valor >= 1e12 then
            disp = string.format("%.2f T", valor / 1e12)
        elseif valor >= 1e9 then
            disp = string.format("%.2f B", valor / 1e9)
        else
            disp = tostring(math.floor(valor))
        end

        resultadoLabelsDurabilidad[pack].Text = string.format("%d pack(s): %s", pack, disp)
    end
end)

local Killer = window:AddTab("Kills")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local playerWhitelist = {}
local targetPlayerNames = {}
local autoGoodKarma = false
local autoBadKarma = false
local autoKill = false
local killTarget = false
local spying = false
local autoEquipPunch = false
local autoPunchNoAnim = false
local targetDropdownItems = {}
local availableTargets = {}

local titleLabel = Killer:AddLabel("Equipar pet de dura o daÃ±o")
titleLabel.TextSize = 14
titleLabel.Font = Enum.Font.Merriweather 
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

local dropdown = Killer:AddDropdown("Select Pet", function(text)
    local petsFolder = game.Players.LocalPlayer.petsFolder
    for _, folder in pairs(petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end
    task.wait(0.2)

    local petName = text
    local petsToEquip = {}

    for _, pet in pairs(game.Players.LocalPlayer.petsFolder.Unique:GetChildren()) do
        if pet.Name == petName then
            table.insert(petsToEquip, pet)
        end
    end

    local maxPets = 8
    local equippedCount = math.min(#petsToEquip, maxPets)

    for i = 1, equippedCount do
        game:GetService("ReplicatedStorage").rEvents.equipPetEvent:FireServer("equipPet", petsToEquip[i])
        task.wait(0.1)
    end
end)

local Wild_Wizard = dropdown:Add("Wild Wizard")
local Powerful_Monster = dropdown:Add("Mighty Monster")


Killer:AddSwitch("Auto Good Karma", function(bool)
    autoGoodKarma = bool
    task.spawn(function()
        while autoGoodKarma do
            local playerChar = LocalPlayer.Character
            local rightHand = playerChar and playerChar:FindFirstChild("RightHand")
            local leftHand = playerChar and playerChar:FindFirstChild("LeftHand")
            if playerChar and rightHand and leftHand then
                for _, target in ipairs(Players:GetPlayers()) do
                    if target ~= LocalPlayer then
                        local evilKarma = target:FindFirstChild("evilKarma")
                        local goodKarma = target:FindFirstChild("goodKarma")
                        if evilKarma and goodKarma and evilKarma:IsA("IntValue") and goodKarma:IsA("IntValue") and evilKarma.Value > goodKarma.Value then
                            local rootPart = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                            if rootPart then
                                firetouchinterest(rightHand, rootPart, 1)
                                firetouchinterest(leftHand, rootPart, 1)
                                firetouchinterest(rightHand, rootPart, 0)
                                firetouchinterest(leftHand, rootPart, 0)
                            end
                        end
                    end
                end
            end
            task.wait(0.01)
        end
    end)
end)

Killer:AddSwitch("Auto Bad Karma", function(bool)
    autoBadKarma = bool
    task.spawn(function()
        while autoBadKarma do
            local playerChar = LocalPlayer.Character
            local rightHand = playerChar and playerChar:FindFirstChild("RightHand")
            local leftHand = playerChar and playerChar:FindFirstChild("LeftHand")
            if playerChar and rightHand and leftHand then
                for _, target in ipairs(Players:GetPlayers()) do
                    if target ~= LocalPlayer then
                        local evilKarma = target:FindFirstChild("evilKarma")
                        local goodKarma = target:FindFirstChild("goodKarma")
                        if evilKarma and goodKarma and evilKarma:IsA("IntValue") and goodKarma:IsA("IntValue") and goodKarma.Value > evilKarma.Value then
                            local rootPart = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                            if rootPart then
                                firetouchinterest(rightHand, rootPart, 1)
                                firetouchinterest(leftHand, rootPart, 1)
                                firetouchinterest(rightHand, rootPart, 0)
                                firetouchinterest(leftHand, rootPart, 0)
                            end
                        end
                    end
                end
            end
            task.wait(0.01)
        end
    end)
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local friendWhitelistActive = false

Killer:AddSwitch("Auto Whitelist Friends", function(state)
    friendWhitelistActive = state

    if state then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and LocalPlayer:IsFriendsWith(player.UserId) then
                playerWhitelist[player.Name] = true
            end
        end

        Players.PlayerAdded:Connect(function(player)
            if friendWhitelistActive and player ~= LocalPlayer and LocalPlayer:IsFriendsWith(player.UserId) then
                playerWhitelist[player.Name] = true
            end
        end)
    else
        for name in pairs(playerWhitelist) do
            local friend = Players:FindFirstChild(name)
            if friend and LocalPlayer:IsFriendsWith(friend.UserId) then
                playerWhitelist[name] = nil
            end
        end
    end
end)

Killer:AddTextBox("Whitelist", function(text)
    local target = Players:FindFirstChild(text)
    if target then
        playerWhitelist[target.Name] = true
    end
end)

Killer:AddTextBox("UnWhitelist", function(text)
    local target = Players:FindFirstChild(text)
    if target then
        playerWhitelist[target.Name] = nil
    end
end)

Killer:AddSwitch("Auto Kill", function(bool)
    autoKill = bool

    task.spawn(function()
        while autoKill do
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local rightHand = character:FindFirstChild("RightHand")
            local leftHand = character:FindFirstChild("LeftHand")

            local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
            if punch and not character:FindFirstChild("Punch") then
                punch.Parent = character
            end

            if rightHand and leftHand then
                for _, target in ipairs(Players:GetPlayers()) do
                    if target ~= LocalPlayer and not playerWhitelist[target.Name] then
                        local targetChar = target.Character
                        local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            pcall(function()
                                firetouchinterest(rightHand, rootPart, 1)
                                firetouchinterest(leftHand, rootPart, 1)
                                firetouchinterest(rightHand, rootPart, 0)
                                firetouchinterest(leftHand, rootPart, 0)
                            end)
                        end
                    end
                end
            end

            task.wait(0.05)
        end
    end)
end)

local targetDropdown = Killer:AddDropdown("Select Target", function(name)
    if name and not table.find(targetPlayerNames, name) then
        table.insert(targetPlayerNames, name)
    end
end)

Killer:AddTextBox("Remove Target", function(name)
    for i, v in ipairs(targetPlayerNames) do
        if v == name then
            table.remove(targetPlayerNames, i)
            break
        end
    end
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        targetDropdown:Add(player.Name)
        targetDropdownItems[player.Name] = true
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        targetDropdown:Add(player.Name)
        targetDropdownItems[player.Name] = true
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if targetDropdownItems[player.Name] then
        targetDropdownItems[player.Name] = nil
        targetDropdown:Clear()
        for name in pairs(targetDropdownItems) do
            targetDropdown:Add(name)
        end
    end

    for i = #targetPlayerNames, 1, -1 do
        if targetPlayerNames[i] == player.Name then
            table.remove(targetPlayerNames, i)
        end
    end
end)

Killer:AddSwitch("Start Kill Target", function(state)
    killTarget = state

    task.spawn(function()
        while killTarget do
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

            local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
            if punch and not character:FindFirstChild("Punch") then
                punch.Parent = character
            end

            local rightHand = character:WaitForChild("RightHand", 5)
            local leftHand = character:WaitForChild("LeftHand", 5)

            if rightHand and leftHand then
                for _, name in ipairs(targetPlayerNames) do
                    local target = Players:FindFirstChild(name)
                    if target and target ~= LocalPlayer then
                        local rootPart = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                        if rootPart then
                            pcall(function()
                                firetouchinterest(rightHand, rootPart, 1)
                                firetouchinterest(leftHand, rootPart, 1)
                                firetouchinterest(rightHand, rootPart, 0)
                                firetouchinterest(leftHand, rootPart, 0)
                            end)
                        end
                    end
                end
            end

            task.wait(0.05)
        end
    end)
end)

local spyTargetDropdown = Killer:AddDropdown("Select View Target", function(name)
    targetPlayerName = name
end)

for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        spyTargetDropdown:Add(player.Name)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        spyTargetDropdown:Add(player.Name)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if player ~= LocalPlayer then
        spyTargetDropdown:Clear()
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                spyTargetDropdown:Add(plr.Name)
            end
        end
    end
end)

Killer:AddSwitch("View Player", function(bool)
    spying = bool
    if not spying then
        local cam = workspace.CurrentCamera
        cam.CameraSubject = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer
        return
    end
    task.spawn(function()
        while spying do
            local target = Players:FindFirstChild(targetPlayerName)
            if target and target ~= LocalPlayer then
                local humanoid = target.Character and target.Character:FindFirstChild("Humanoid")
                if humanoid then
                    workspace.CurrentCamera.CameraSubject = humanoid
                end
            end
            task.wait(0.1)
        end
    end)
end)

local button = Killer:AddButton("Remove Punch Anim", function()
    local blockedAnimations = {
        ["rbxassetid://3638729053"] = true,
        ["rbxassetid://3638767427"] = true,
    }

    local function setupAnimationBlocking()
        local char = game.Players.LocalPlayer.Character
        if not char or not char:FindFirstChild("Humanoid") then return end

        local humanoid = char:FindFirstChild("Humanoid")

        for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
            if track.Animation then
                local animId = track.Animation.AnimationId
                local animName = track.Name:lower()

                if blockedAnimations[animId] or
                    animName:match("punch") or
                    animName:match("attack") or
                    animName:match("right") then
                    track:Stop()
                end
            end
        end

        if not _G.AnimBlockConnection then
            local connection = humanoid.AnimationPlayed:Connect(function(track)
                if track.Animation then
                    local animId = track.Animation.AnimationId
                    local animName = track.Name:lower()

                    if blockedAnimations[animId] or
                        animName:match("punch") or
                        animName:match("attack") or
                        animName:match("right") then
                        track:Stop()
                    end
                end
            end)

            _G.AnimBlockConnection = connection
        end
    end

    setupAnimationBlocking()

    local function overrideToolActivation()
        local function processTool(tool)
            if tool and (tool.Name == "Punch" or tool.Name:match("Attack") or tool.Name:match("Right")) then
                if not tool:GetAttribute("ActivatedOverride") then
                    tool:SetAttribute("ActivatedOverride", true)

                    local connection = tool.Activated:Connect(function()
                        task.wait(0.05)

                        local char = game.Players.LocalPlayer.Character
                        if char and char:FindFirstChild("Humanoid") then
                            for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
                                if track.Animation then
                                    local animId = track.Animation.AnimationId
                                    local animName = track.Name:lower()

                                    if blockedAnimations[animId] or
                                        animName:match("punch") or
                                        animName:match("attack") or
                                        animName:match("right") then
                                        track:Stop()
                                    end
                                end
                            end
                        end
                    end)

                    if not _G.ToolConnections then
                        _G.ToolConnections = {}
                    end
                    _G.ToolConnections[tool] = connection
                end
            end
        end

        for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            processTool(tool)
        end

        local char = game.Players.LocalPlayer.Character
        if char then
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") then
                    processTool(tool)
                end
            end
        end

        if not _G.BackpackAddedConnection then
            _G.BackpackAddedConnection = game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.wait(0.1)
                    processTool(child)
                end
            end)
        end

        if not _G.CharacterToolAddedConnection and char then
            _G.CharacterToolAddedConnection = char.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.wait(0.1)
                    processTool(child)
                end
            end)
        end
    end

    overrideToolActivation()

    if not _G.AnimMonitorConnection then
        _G.AnimMonitorConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if tick() % 0.5 < 0.01 then
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    for _, track in pairs(char.Humanoid:GetPlayingAnimationTracks()) do
                        if track.Animation then
                            local animId = track.Animation.AnimationId
                            local animName = track.Name:lower()

                            if blockedAnimations[animId] or
                                animName:match("punch") or
                                animName:match("attack") or
                                animName:match("right") then
                                track:Stop()
                            end
                        end
                    end
                end
            end
        end)
    end

    if not _G.CharacterAddedConnection then
        _G.CharacterAddedConnection = game.Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
            task.wait(1)
            setupAnimationBlocking()
            overrideToolActivation()

            if _G.CharacterToolAddedConnection then
                _G.CharacterToolAddedConnection:Disconnect()
            end

            _G.CharacterToolAddedConnection = newChar.ChildAdded:Connect(function(child)
                if child:IsA("Tool") then
                    task.wait(0.1)
                    processTool(child)
                end
            end)
        end)
    end
end)

function RecoveryPunch()
    if _G.AnimBlockConnection then
        _G.AnimBlockConnection:Disconnect()
        _G.AnimBlockConnection = nil
    end
    if _G.AnimMonitorConnection then
        _G.AnimMonitorConnection:Disconnect()
        _G.AnimMonitorConnection = nil
    end
    if _G.ToolConnections then
        for _, conn in pairs(_G.ToolConnections) do
            if conn then conn:Disconnect() end
        end
        _G.ToolConnections = nil
    end
    if _G.BackpackAddedConnection then
        _G.BackpackAddedConnection:Disconnect()
        _G.BackpackAddedConnection = nil
    end
    if _G.CharacterToolAddedConnection then
        _G.CharacterToolAddedConnection:Disconnect()
        _G.CharacterToolAddedConnection = nil
    end
    if _G.CharacterAddedConnection then
        _G.CharacterAddedConnection:Disconnect()
        _G.CharacterAddedConnection = nil
    end
end

Killer:AddButton("Recover Punch Anim", function()
    RecoveryPunch()
end)

Killer:AddSwitch("Auto Equip Punch", function(state)
	autoEquipPunch = state
	task.spawn(function()
		while autoEquipPunch do
			local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
			if punch then
				punch.Parent = LocalPlayer.Character
			end
			task.wait(0.1)
		end
	end)
end)

Killer:AddSwitch("Auto golpear [sin animaciÃ³n]", function(state)
	autoPunchNoAnim = state
	task.spawn(function()
		while autoPunchNoAnim do
			local punch = LocalPlayer.Backpack:FindFirstChild("Punch") or LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Punch")
			if punch then
				if punch.Parent ~= LocalPlayer.Character then
					punch.Parent = LocalPlayer.Character
				end
				LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
				LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
			else
				autoPunchNoAnim = false
			end
			task.wait(0.01)
		end
	end)
end)

Killer:AddSwitch("Auto Punch", function(state)
	_G.fastHitActive = state
	if state then
		task.spawn(function()
			while _G.fastHitActive do
				local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
				if punch then
					punch.Parent = LocalPlayer.Character
					if punch:FindFirstChild("attackTime") then
						punch.attackTime.Value = 0
					end
				end
				task.wait(0.1)
			end
		end)
		task.spawn(function()
			while _G.fastHitActive do
				local punch = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Punch")
				if punch then
					punch:Activate()
				end
				task.wait(0.1)
			end
		end)
	else
		local punch = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Punch")
		if punch then
			punch.Parent = LocalPlayer.Backpack
		end
	end
end)

Killer:AddSwitch("golpe rÃ¡pido", function(state)
	_G.autoPunchActive = state
	if state then
		task.spawn(function()
			while _G.autoPunchActive do
				local punch = LocalPlayer.Backpack:FindFirstChild("Punch")
				if punch then
					punch.Parent = LocalPlayer.Character
					if punch:FindFirstChild("attackTime") then
						punch.attackTime.Value = 0
					end
				end
				task.wait()
			end
		end)
		task.spawn(function()
			while _G.autoPunchActive do
				local punch = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Punch")
				if punch then
					punch:Activate()
				end
				task.wait()
			end
		end)
	else
		local punch = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Punch")
		if punch then
			punch.Parent = LocalPlayer.Backpack
		end
	end
end)



local godModeToggle = false
Killer:AddSwitch("modo dios (esperar peleas)", function(State)
    godModeToggle = State
    if State then
        task.spawn(function()
            while godModeToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait()
            end
        end)
    end
end)
-- ðŸ“Œ Teleport / Follow System (versiÃ³n auto-follow desde Dropdown)

-- ðŸ“Œ Auto Follow (TP detrÃ¡s del jugador en vez de caminar)
local following = false
local followTarget = nil

-- FunciÃ³n auxiliar: TP detrÃ¡s del jugador
function followPlayer(targetPlayer)
    local myChar = LocalPlayer.Character
    local targetChar = targetPlayer.Character

    if not (myChar and targetChar) then return end
    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")

    if myHRP and targetHRP then
        -- ðŸ“Œ Calcular posiciÃ³n detrÃ¡s del jugador (3 studs atrÃ¡s)
        local followPos = targetHRP.Position - (targetHRP.CFrame.LookVector * 3)
        -- ðŸ“Œ Teletransportar siempre recto
        myHRP.CFrame = CFrame.new(followPos, targetHRP.Position)
    end
end

-- Dropdown dinÃ¡mico de jugadores
local followDropdown = Killer:AddDropdown("Seguir Jugador (TP)", function(selected)
    if selected and selected ~= "" then
        local target = Players:FindFirstChild(selected)
        if target then
            followTarget = target.Name
            following = true
            print("Started following:", target.Name)

            -- TP inmediato al seleccionarlo
            followPlayer(target)
        end
    end
end)

-- Inicializar lista de jugadores
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        followDropdown:Add(player.Name)
    end
end

-- Mantener lista actualizada
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        followDropdown:Add(player.Name)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    followDropdown:Clear()
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            followDropdown:Add(plr.Name)
        end
    end
    if followTarget == player.Name then
        followTarget = nil
        following = false
    end
end)

-- BotÃ³n para dejar de seguir
Killer:AddButton("Dejar de Seguir", function()
    following = false
    followTarget = nil
    print("Stopped following")
end)

-- Loop de seguimiento automÃ¡tico
task.spawn(function()
    while true do
        task.wait(0.2) -- cada 0.2s para actualizar TP
        if following and followTarget then
            local target = Players:FindFirstChild(followTarget)
            if target then
                followPlayer(target)
            else
                following = false
                followTarget = nil
            end
        end
    end
end)

local godDamageActive = false

Killer:AddSwitch("DaÃ±o con Godmode", function(state)
    godDamageActive = state
    if state then
        task.spawn(function()
            while godDamageActive do
                local player = game.Players.LocalPlayer
                local groundSlam = player.Backpack:FindFirstChild("Ground Slam") or (player.Character and player.Character:FindFirstChild("Ground Slam"))

                if groundSlam then
                    -- Equipar
                    if groundSlam.Parent == player.Backpack then
                        groundSlam.Parent = player.Character
                    end

                    -- Quitar delay
                    if groundSlam:FindFirstChild("attackTime") then
                        groundSlam.attackTime.Value = 0
                    end

                    -- Lanzar evento
                    player.muscleEvent:FireServer("slam")

                    -- Activar herramienta
                    groundSlam:Activate()
                end

                task.wait(0.1) -- delay pequeÃ±o
            end
        end)
    end
end)



local button = Killer:AddButton("congelar el agua", function()
   
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(11, -9, 78)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,1999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-1999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,2999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-3999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,4999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-5999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-6999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-7999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-8999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-9999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-10999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-11999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-12999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-13999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-14999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-15999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-16999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-17999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-18999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-19999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-20999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-21999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-22999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-23999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-8922.482421875, -9.848660469055176, -6233.65380859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1107.2977294921875, - 9.7848615646362305, -4127.03369140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2054.99365234375, -9.43027928471565247, -5135.06201171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3072.01806640625, -9.645418643951416, -6136.02392578125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4088.711181640625, -9.43027925491333, -5125.28076171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5100.0576171875, -9.215141296386719, -5128.03369140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6103.42626953125, -9.000000953674316, -5590.5859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-7096.3935546875, -9.784859657287598, -6403.66015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-9882.7021484375, -9.633520126342773, -5228.537109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-8889.23046875, -9.418381690979004, -4767.06689453125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-7888.4443359375, -9.203240394592285, -4648.048828125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6868.951171875, -9.988101005554199, -4124.4384765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5883.841796875, -9.7729620933532715, -4073.54736328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-9873.0966796875, -9.26787185668945, -6775.55859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-8453.767578125, -9.26786804199219, -7212.89013671875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-7482.234375, -9.84866714477539, -8082.72021484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6483.5791015625, -9.26786422729492, -9055.9033203125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6561.2578125, -9.84867858886719, -10038.5146484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1009.69091796875, -9.11653518676758, 1046.963134765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2178.023681640625, -9.09156036376953, 287.1599426269531)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1023.4569091796875, -9.784860134124756, -478.5546569824219)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1416.96533203125, -9.901395559310913, 2066.506591796875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1514.3587646484375, -9.686256408691406, 3077.935791015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1624.8602294921875, -9.47111701965332, 4074.02587890625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1687.230712890625, -9.255976676940918, 5069.81640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1655.4146728515625, -9.040838241577148, 6056.37451171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(650.4426879882812, -9.8256990909576416, 6532.1982421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-347.35028076171875, -9.61055850982666, 6912.1591796875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(218.79769897460938, -9.395420074462891, 7934.68017578125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(251.1740264892578, -9.1802825927734375, 8951.5595703125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(360.1578369140625, -9.9651424884796143, 9967.0107421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(488.1932067871094, -9.750001907348633, 10972.189453125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(569.8875732421875, -9.5348615646362305, 11982.7353515625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(629.5374755859375, -9.319723129272461, 12985.849609375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1664.9771728515625, -9.610558986663818, 7491.61181640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1945.2432861328125, -9.395420551300049, 8507.6533203125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(904.4902954101562, -9.7848610877990723, -2151.783447265625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1890.2633056640625, -9.569720268249512, -2413.07421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2895.560302734375, -9.354581356048584, -2546.12109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3881.858642578125, -9.1394429206848145, -2962.385986328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4874.54833984375, -9.9243016242980957, -3218.8798828125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5892.513671875, -9.709161758422852, -3338.171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(6886.39990234375, -9.505979061126709, -3488.1533203125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(7863.33056640625, -9.290840148925781, -3597.61279296875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(8840.2548828125, -9.075700759887695, -3711.208740234375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(9838.98046875, -9.8605616092681885, -3811.1064453125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(10812.9287109375, -9.645423412322998, -3987.937744140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(11798.421875, -9.4302849769592285, -4059.906494140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(12794.8408203125, -9.215145587921143, -4103.353515625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(13782.353515625, -9.000005722045898, -4253.642578125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(14800.7666015625, -9.7848663330078125, -4368.7177734375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(15813.6171875, -9.569726467132568, -4453.31591796875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(16818.390625, -9.354587078094482, -4569.81396484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(17821.248046875, -9.139448642730713, -4737.97509765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(18001.896484375, -9.9243087768554688, -3764.74609375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(17008.357421875, -9.709170341491699, -2794.70751953125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(16014.57421875, -9.49403190612793, -2500.1083984375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(18766.751953125, -9.709169387817383, -2759.8818359375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(19039.708984375, -9.494030475616455, -3743.810546875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(18948.62890625, -9.494030475616455, -1756.02783203125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(17940.4921875, -9.2788920402526855, -755.4782104492188)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(18944.34375, -9.063753604888916, -543.2788696289062)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(16963.00390625, -9.063752174377441, -293.4074401855469)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(15998.7353515625, -9.8486130237579346, -1311.015869140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(15591.837890625, -9.633473873138428, -296.08660888671875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(14579.58203125, -9.4183349609375, -991.3533935546875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(14294.275390625, -9.203196048736572, -221.879150390625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(13372.7236328125, -9.9880566596984863, 73.62410736083984)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(12783.056640625, -9.093517303466797, -952.5441284179688)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2003.5675048828125, -9.569721221923828, -1103.451416015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2978.824951171875, -9.354583263397217, -1012.9195556640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3944.885986328125, -9.139444351196289, -958.9783935546875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4917.93212890625, -9.9243054389953613, -1106.58837890625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5321.544921875, -9.709166526794434, -1851.941162109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2894.729736328125, -9.9243032932281494, -3897.88720703125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1880.724609375, -9.709164142608643, -4258.2509765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1643.215576171875, -9.569722652435303, -3132.36572265625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1772.5018310546875, -9.354584217071533, -2139.459716796875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1665.8314208984375, -9.139444828033447, -1128.0208740234375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1673.664794921875, -9.9243054389953613, -176.67430114746094)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1895.2357177734375, -9.709166526794434, 789.939697265625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1991.6993408203125, -9.494027614593506, 1789.4617919921875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2148.386962890625, -9.278889179229736, 2777.50146484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2334.718505859375, -9.06374979019165, 3752.33056640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2430.8857421875, -9.8486104011535645, 4750.89208984375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2477.38427734375, -9.633471488952637, 5754.65625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1474.8240966796875, -9.418332576751709, 4993.744140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1239.12744140625, -9.203193664550781, 4206.31005859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1682.2164306640625, -9.418331623077393, 6633.03125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1427.5582275390625, -9.203193187713623, 7548.80224609375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3823.29248046875, -9.063750267028809, 1757.0218505859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4112.26171875, -9.848611354827881, 2757.71484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4299.38330078125, -9.633472919464111, 3713.58056640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4433.6865234375, -9.4183349609375, 4715.2236328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4646.71728515625, -9.203195571899414, 5683.84765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3911.37353515625, -9.988056182861328, 6502.482421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3161.617431640625, -9.772918224334717, 6943.85986328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2052.14599609375, -9.9880542755126953, 8546.2861328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1400.4658203125, -9.772915363311768, 9297.806640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1190.1282958984375, -9.4422254264354706, 10259.5078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2187.53564453125, -9.180280685424805, 9414.32421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2896.7841796875, -9.180281639099121, 7566.1171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3187.329345703125, -9.9651424884796143, 6555.640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3379.880615234375, -9.750005722045898, 5558.48876953125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3961.218017578125, -9.754025459289551, 6907.60400390625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3976.142822265625, -9.538886547088623, 7871.6318359375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3126.83544921875, -9.84867262840271, 802.1668090820312)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3662.20703125, -9.633533477783203, -80.66658020019531)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3609.484130859375, -9.418395519256592, -1017.3029174804688)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3753.300537109375, -9.2032551765441895, -1995.7613525390625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4743.466796875, -9.9881160259246826, -2393.3125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5736.89892578125, -9.772977828979492, -2010.5301513671875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4006.782958984375, -9.772977352142334, -3332.644287109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3065.00146484375, -9.557837963104248, -3415.263916015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4635.92431640625, -9.418395519256592, -103.13423919677734)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5439.66796875, -9.203256607055664, 866.9227294921875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5770.49462890625, -9.9881179332733154, 1845.7347412109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5798.58203125, -9.772978782653809, 2813.786376953125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6413.759765625, -9.9881181716918945, 45.978721618652344)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-7281.08837890625, -9.342700004577637, -2053.28173828125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5939.85009765625, -9.557838439941406, -2980.478515625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3151.140380859375, -9.8764214515686035, 645.57568359375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4175.984375, -9.661282062530518, 688.4006958007812)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3677.688232421875, -9.44614315032959, 1697.672607421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2702.431640625, -9.231003761291504, 2118.501953125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3402.743896484375, -9.015864849090576, 3122.62060546875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3311.645263671875, -9.800727367401123, 4067.2041015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4368.765625, -9.800727128982544, 3317.60009765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4876.06005859375, -9.585587978363037, 4320.9013671875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5258.15771484375, -9.370449542999268, 5299.39990234375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5620.71923828125, -9.155311584472656, 6254.36181640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5176.56591796875, -9.585587978363037, 2400.698486328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(6081.796875, -9.370450019836426, 3295.412109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5741.1318359375, -9.370449066162109, 1432.1351318359375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5813.77685546875, -9.155310153961182, 415.4798889160156)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(6412.279296875, -9.9401707649230957, -563.8019409179688)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(6898.72900390625, -9.725030422210693, -1527.509765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
end)

Killer:AddButton("TamaÃ±o NaN", function()
    local args = {"changeSize", 0/0}
    game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("changeSpeedSizeRemote"):InvokeServer(unpack(args))
end)
-- ðŸ“œ Lista de RAWs a ejecutar
local urls = {
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack2",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack3",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack4",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack5",
    "https://raw.githubusercontent.com/SadOz8/Stuffs/refs/heads/main/Crack6"
}

-- âš¡ BotÃ³n que ejecuta todos los scripts remotos
Killer:AddButton("Pegar Muerto", function()
    for _, url in ipairs(urls) do
        spawn(function()
            local success, response = pcall(function()
                return game:HttpGet(url)
            end)
            if success and response then
                local loadSuccess, err = pcall(function()
                    loadstring(response)()
                end)
                if not loadSuccess then
                    warn("[Pegar Muerto] Error ejecutando raw:", url, err)
                end
            else
                warn("[Pegar Muerto] No se pudo cargar:", url)
            end
        end)
    end
end)



local Lighting = game:GetService("Lighting")

-- Tabla para registrar los tiempos disponibles
local timeOptions = {
    "MaÃ±ana",
    "MediodÃ­a",
    "Tarde",
    "Atardecer",
    "Noche",
    "Medianoche",
    "Amanecer",
    "Madrugada"
}

-- Dropdown
local timeDropdown = Killer:AddDropdown("Cambiar Tiempo", function(selection)
    -- Reset antes de aplicar
    Lighting.Brightness = 2
    Lighting.FogEnd = 100000
    Lighting.Ambient = Color3.fromRGB(127,127,127)

    if selection == "MaÃ±ana" then
        Lighting.ClockTime = 6
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.fromRGB(200, 200, 255)
    elseif selection == "MediodÃ­a" then
        Lighting.ClockTime = 12
        Lighting.Brightness = 3
        Lighting.Ambient = Color3.fromRGB(255, 255, 255)
    elseif selection == "Tarde" then
        Lighting.ClockTime = 16
        Lighting.Brightness = 2.5
        Lighting.Ambient = Color3.fromRGB(255, 220, 180)
    elseif selection == "Atardecer" then
        Lighting.ClockTime = 18
        Lighting.Brightness = 2
        Lighting.Ambient = Color3.fromRGB(255, 150, 100)
        Lighting.FogEnd = 500
    elseif selection == "Noche" then
        Lighting.ClockTime = 20
        Lighting.Brightness = 1.5
        Lighting.Ambient = Color3.fromRGB(100, 100, 150)
        Lighting.FogEnd = 800
    elseif selection == "Medianoche" then
        Lighting.ClockTime = 0
        Lighting.Brightness = 1
        Lighting.Ambient = Color3.fromRGB(50, 50, 100)
        Lighting.FogEnd = 400
    elseif selection == "Amanecer" then
        Lighting.ClockTime = 4
        Lighting.Brightness = 1.8
        Lighting.Ambient = Color3.fromRGB(180, 180, 220)
    elseif selection == "Madrugada" then
        Lighting.ClockTime = 2
        Lighting.Brightness = 1.2
        Lighting.Ambient = Color3.fromRGB(100, 120, 180)
    end
end)

-- Agregar opciones al dropdown dinÃ¡micamente
for _, option in ipairs(timeOptions) do
    timeDropdown:Add(option)
end

local estadisticas = window:AddTab("Stats Jugadores")

local SelectPlayerName = ""

local PlayerDrop = estadisticas:AddDropdown("Select Player", function(Value)
    SelectPlayerName = Value:match("| (.+)")
    previousValues = {}
end)

local Playerslist = {}
for _, Plr in pairs(game:GetService("Players"):GetPlayers()) do
    local displayName = Plr.DisplayName .. " | " .. Plr.Name
    table.insert(Playerslist, displayName)
end
for _, AddPlr in ipairs(Playerslist) do
    PlayerDrop:Add(AddPlr)
end

local function FormatNumberWithCommas(number)
    local formatted = tostring(number):reverse():gsub("(%d%d%d)", "%1,"):reverse()
    return formatted:gsub("^,", "")
end

local function FormatAbbreviated(number)
    local abbreviations = {"", "K", "M", "B", "T", "Qa", "Qi"}
    local abbreviationIndex = 1
    while number >= 1000 do
        number = number / 1000
        abbreviationIndex = abbreviationIndex + 1
    end
    return string.format("%.2f", number) .. abbreviations[abbreviationIndex]
end

local function FormatDisplay(value)
    local normal = FormatNumberWithCommas(value)
    local abbreviated = FormatAbbreviated(value)
    return "[ " .. normal .. " | " .. abbreviated .. " ]"
end

local previousValues = {}

local Update = estadisticas:AddLabel("")
local Update1 = estadisticas:AddLabel("")
local Update2 = estadisticas:AddLabel("")
local Update3 = estadisticas:AddLabel("")
local Update4 = estadisticas:AddLabel("")
local Update5 = estadisticas:AddLabel("")
local Update6 = estadisticas:AddLabel("")
local Update9 = estadisticas:AddLabel("")
local Update10 = estadisticas:AddLabel("")
local Update11 = estadisticas:AddLabel("")
local Update12 = estadisticas:AddLabel("")
local Update13 = estadisticas:AddLabel("")

task.spawn(function()
    while task.wait(0) do
        if SelectPlayerName ~= "" then
            local player = game.Players:FindFirstChild(SelectPlayerName)
            if player then
                if player:FindFirstChild("Gems") then
                    Update1.Text = "Gems: " .. FormatDisplay(player.Gems.Value)
                end
                if player:FindFirstChild("Agility") then
                    Update3.Text = "Agility: " .. FormatDisplay(player.Agility.Value)
                end
                if player:FindFirstChild("Durability") then
                    Update4.Text = "Durability: " .. FormatDisplay(player.Durability.Value)
                end
                if player:FindFirstChild("muscleKingTime") then
                    Update6.Text = "Muscle King Time: " .. FormatDisplay(player.muscleKingTime.Value)
                end
                if player:FindFirstChild("customSize") then
                    Update10.Text = "Custom Size: " .. FormatDisplay(player.customSize.Value)
                end
                if player:FindFirstChild("customSpeed") then
                    Update11.Text = "Custom Speed: " .. FormatDisplay(player.customSpeed.Value)
                end
                if player:FindFirstChild("evilKarma") then
                    Update12.Text = "Evil Karma: " .. FormatDisplay(player.evilKarma.Value)
                end
                if player:FindFirstChild("goodKarma") then
                    Update13.Text = "Good Karma: " .. FormatDisplay(player.goodKarma.Value)
                end

                local leaderstats = player:FindFirstChild("leaderstats")
                if leaderstats then
                    if leaderstats:FindFirstChild("Strength") then
                        Update.Text = "Strength: " .. FormatDisplay(leaderstats.Strength.Value)
                    end
                    if leaderstats:FindFirstChild("Rebirths") then
                        Update2.Text = "Rebirth: " .. FormatDisplay(leaderstats.Rebirths.Value)
                    end
                    if leaderstats:FindFirstChild("Kills") then
                        Update5.Text = "Kills: " .. FormatDisplay(leaderstats.Kills.Value)
                    end
                end

                if player:FindFirstChild("currentMap") then
                    Update9.Text = "Current Map: " .. tostring(player.currentMap.Value)
                else
                    Update9.Text = "Current Map: Aucune donnÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â©e"
                end
            end
        end
    end
end)

local teleport = window:AddTab("Teleport")

teleport:AddButton("Spawn", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(2, 8, 115)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Spawn",
        Duration = 0
    })
end)

teleport:AddButton("Secret Area", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(1947, 2, 6191)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Secret Area",
        Duration = 0
    })
end)

teleport:AddButton("Tiny Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-34, 7, 1903)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Tiny Island",
        Duration = 0
    })
end)

teleport:AddButton("Frozen Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(- 2600.00244, 3.67686558, - 403.884369, 0.0873617008, 1.0482899e-09, 0.99617666, 3.07204253e-08, 1, - 3.7464023e-09, - 0.99617666, 3.09302628e-08, 0.0873617008)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Frozen Island",
        Duration = 0
    })
end)

teleport:AddButton("Mythical Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(2255, 7, 1071)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Mythical Island",
        Duration = 0
    })
end)

teleport:AddButton("Hell Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-6768, 7, -1287)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Hell Island",
        Duration = 0
    })
end)

teleport:AddButton("Legend Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(4604, 991, -3887)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Legend Island",
        Duration = 0
    })
end)

teleport:AddButton("Muscle King Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-8646, 17, -5738)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Muscle King",
        Duration = 0
    })
end)

teleport:AddButton("Jungle Island", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-8659, 6, 2384)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Jungle Island",
        Duration = 0
    })
end)

teleport:AddButton("Brawl Lava", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(4471, 119, -8836)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Brawl Lava",
        Duration = 0
    })
end)

teleport:AddButton("Brawl Desert", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(960, 17, -7398)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Brawl Desert",
        Duration = 0
    })
end)

teleport:AddButton("Brawl Regular", function()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    humanoidRootPart.CFrame = CFrame.new(-1849, 20, -6335)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Teletransporte",
        Text = "Teleported to Brawl Regular",
        Duration = 0
    })
end)


local pets = window:AddTab(       "Crystals")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Crystal data structure with exact names from your original code
local crystalData = {
    ["Blue Crystal"] = {
        {name = "Blue Birdie", rarity = "Basic"},
        {name = "Orange Hedgehog", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Red Kitty", rarity = "Basic"},
        {name = "Dark Vampy", rarity = "Advanced"},
        {name = "Blue Bunny", rarity = "Basic"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Green Aura", rarity = "Basic"},
        {name = "Purple Aura", rarity = "Basic"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Yellow Aura", rarity = "Basic"}
    },
    ["Green Crystal"] = {
        {name = "Silver Dog", rarity = "Basic"},
        {name = "Green Aura", rarity = "Advanced"},
        {name = "Dark Golem", rarity = "Advanced"},
        {name = "Green Butterfly", rarity = "Advanced"},
        {name = "Crimson Falcon", rarity = "Rare"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Blue Aura", rarity = "Basic"},
        {name = "Green Aura", rarity = "Basic"},
        {name = "Purple Aura", rarity = "Basic"},
        {name = "Red Aura", rarity = "Basic"},
        {name = "Yellow Aura", rarity = "Basic"}
    },
    ["Frost Crystal"] = {
        {name = "Yellow Butterfly", rarity = "Advanced"},
        {name = "Purple Dragon", rarity = "Rare"},
        {name = "Blue Pheonix", rarity = "Epic"},
        {name = "Orange Pegasus", rarity = "Rare"},
        {name = "Lightning", rarity = "Rare"},
        {name = "Electro", rarity = "Advanced"}
    },
    ["Mythical Crystal"] = {
        {name = "Purple Falcon", rarity = "Rare"},
        {name = "Red Dragon", rarity = "Rare"},
        {name = "Blue Firecaster", rarity = "Epic"},
        {name = "Golden Pheonix", rarity = "Epic"},
        {name = "Power Lightning", rarity = "Rare"},
        {name = "Dark Lightning", rarity = "Epic"}
    },
    ["Inferno Crystal"] = {
        {name = "Red Firecaster", rarity = "Epic"},
        {name = "Infernal Dragon", rarity = "Unique"},
        {name = "White Pegasus", rarity = "Rare"},
        {name = "Golden Pheonix", rarity = "Epic"},
        {name = "Inferno", rarity = "Epic"},
        {name = "Dark Storm", rarity = "Unique"}
    },
    ["Legends Crystal"] = {
        {name = "Ultra Birdie", rarity = "Unique"},
        {name = "Magic Butterfly", rarity = "Unique"},
        {name = "Green Firecaster", rarity = "Epic"},
        {name = "White Pheonix", rarity = "Epic"},
        {name = "Supernova", rarity = "Epic"},
        {name = "Purple Nova", rarity = "Unique"}
    },
    ["Muscle Elite Crystal"] = {
        {name = "Frostwave Legends Penguin", rarity = "Rare"},
        {name = "Phantom Genesis Dragon", rarity = "Rare"},
        {name = "Dark Legends Manticore", rarity = "Epic"},
        {name = "Ultimate Supernova Pegasus", rarity = "Epic"},
        {name = "Aether Spirit Bunny", rarity = "Unique"},
        {name = "Cybernetic Showdown Dragon", rarity = "Unique"}
    },
    ["Galaxy Oracle Crystal"] = {
        {name = "Eternal Strike Leviathan", rarity = "Rare"},
        {name = "Lightning Strike Phantom", rarity = "Epic"},
        {name = "Darkstar Hunter", rarity = "Unique"},
        {name = "Muscle King", rarity = "Unique"},
        {name = "Azure Tundra", rarity = "Epic"},
        {name = "Ultra Inferno", rarity = "Rare"}
    },
    ["Jungle Crystal"] = {
        {name = "Entropic Blast", rarity = "Unique"},
        {name = "Muscle Sensei", rarity = "Unique"},
        {name = "Grand Supernova", rarity = "Epic"},
        {name = "Neon Guardian", rarity = "Unique"},
        {name = "Eternal Megastrike", rarity = "Unique"},
        {name = "Golden Viking", rarity = "Epic"},
        {name = "Astral Electro", rarity = "Epic"},
        {name = "Dark Electro", rarity = "Epic"},
        {name = "Enchanted Mirage", rarity = "Epic"},
        {name = "Ultra Mirage", rarity = "Unique"},
        {name = "Unstable Mirage", rarity = "Unique"}
    }
}

-- Function to collect all unique pets and auras
local function getAllPetsAndAuras()
    local allPets = {}
    local allAuras = {}
    
    for crystalName, pets in pairs(crystalData) do
        for _, pet in ipairs(pets) do
            if string.find(pet.name, "Aura") then
                if not allAuras[pet.name] then
                    allAuras[pet.name] = {name = pet.name, rarity = pet.rarity, crystal = crystalName}
                end
            else
                if not allPets[pet.name] then
                    allPets[pet.name] = {name = pet.name, rarity = pet.rarity, crystal = crystalName}
                end
            end
        end
    end
    
    return allPets, allAuras
end

-- Function to find which crystal contains a specific pet/aura
local function findCrystalForItem(itemName)
    for crystalName, pets in pairs(crystalData) do
        for _, pet in ipairs(pets) do
            if pet.name == itemName then
                return crystalName
            end
        end
    end
    return nil
end

-- Variables to track current selections
local selectedPet = ""
local selectedAura = ""

-- Get all pets and auras
local allPets, allAuras = getAllPetsAndAuras()

pets:AddLabel("=== Buy pets and auras ===")

-- Pet dropdown
local petDropdown = pets:AddDropdown("Select pet", function(text)
    selectedPet = text
    local crystal = findCrystalForItem(text)
    print("Pet selected: " .. text .. " (Found in: " .. (crystal or "Unknown") .. ")")
end)

-- Add all pets manually (sorted by rarity)
-- Basic Pets
petDropdown:Add("Blue Birdie (Basic)")
petDropdown:Add("Orange Hedgehog (Basic)")
petDropdown:Add("Red Kitty (Basic)")
petDropdown:Add("Blue Bunny (Basic)")
petDropdown:Add("Silver Dog (Basic)")

-- Advanced Pets
petDropdown:Add("Dark Vampy (Advanced)")
petDropdown:Add("Dark Golem (Advanced)")
petDropdown:Add("Green Butterfly (Advanced)")
petDropdown:Add("Yellow Butterfly (Advanced)")

-- Rare Pets
petDropdown:Add("Crimson Falcon (Rare)")
petDropdown:Add("Purple Dragon (Rare)")
petDropdown:Add("Orange Pegasus (Rare)")
petDropdown:Add("Purple Falcon (Rare)")
petDropdown:Add("Red Dragon (Rare)")
petDropdown:Add("White Pegasus (Rare)")
petDropdown:Add("Frostwave Legends Penguin (Rare)")
petDropdown:Add("Phantom Genesis Dragon (Rare)")
petDropdown:Add("Eternal Strike Leviathan (Rare)")

-- Epic Pets
petDropdown:Add("Blue Pheonix (Epic)")
petDropdown:Add("Blue Firecaster (Epic)")
petDropdown:Add("Golden Pheonix (Epic)")
petDropdown:Add("Red Firecaster (Epic)")
petDropdown:Add("Green Firecaster (Epic)")
petDropdown:Add("White Pheonix (Epic)")
petDropdown:Add("Dark Legends Manticore (Epic)")
petDropdown:Add("Ultimate Supernova Pegasus (Epic)")
petDropdown:Add("Lightning Strike Phantom (Epic)")
petDropdown:Add("Golden Viking (Epic)")

-- Unique Pets
petDropdown:Add("Infernal Dragon (Unique)")
petDropdown:Add("Ultra Birdie (Unique)")
petDropdown:Add("Magic Butterfly (Unique)")
petDropdown:Add("Aether Spirit Bunny (Unique)")
petDropdown:Add("Cybernetic Showdown Dragon (Unique)")
petDropdown:Add("Darkstar Hunter (Unique)")
petDropdown:Add("Muscle Sensei (Unique)")
petDropdown:Add("Neon Guardian (Unique)")

-- Aura dropdown
local auraDropdown = pets:AddDropdown("Select Aura", function(text)
    selectedAura = text
    local crystal = findCrystalForItem(text)
    print("Aura selected: " .. text .. " (Found in: " .. (crystal or "Unknown") .. ")")
end)

-- Add all auras manually (sorted by rarity)
-- Basic Auras
auraDropdown:Add("Blue Aura (Basic)")
auraDropdown:Add("Green Aura (Basic)")
auraDropdown:Add("Purple Aura (Basic)")
auraDropdown:Add("Red Aura (Basic)")
auraDropdown:Add("Yellow Aura (Basic)")
auraDropdown:Add("Ultra Inferno  (Rare)")
auraDropdown:Add("Azure Tundra (Epic)")
auraDropdown:Add("Grand Supernova (Epic)")
auraDropdown:Add("Muscle King (Unique)")
auraDropdown:Add("Entropic Blast (Unique)")
auraDropdown:Add("Eternal Megastrike (Unique)")

pets:AddLabel("=== System to buys===")

-- Auto buy pet toggle
pets:AddSwitch("Auto Buy Pet", function(bool)
    _G.AutoBuyPet = bool
    
    if bool then
        if selectedPet == "" then
            print("Please select a pet first!")
            return
        end
        
        -- Extract pet name from dropdown selection (remove rarity part)
        local petName = selectedPet:match("^(.-)%s*%(")
        if not petName then
            petName = selectedPet
        end
        
        local crystal = findCrystalForItem(petName)
        if not crystal then
            print("Could not find crystal for pet: " .. petName)
            return
        end
        
        print("Auto buy pet started for: " .. petName .. " from " .. crystal)
        spawn(function()
            while _G.AutoBuyPet and selectedPet ~= "" do
                local petToBuy = ReplicatedStorage.cPetShopFolder:FindFirstChild(petName)
                if petToBuy then
                    ReplicatedStorage.cPetShopRemote:InvokeServer(petToBuy)
                    print("Bought pet: " .. petName)
                else
                    print("Pet not found: " .. petName)
                end
                task.wait(0.1)
            end
        end)
    else
        print("Auto buy pet stopped")
    end
end)

-- Auto buy aura toggle
pets:AddSwitch("Auto buy Aura", function(bool)
    _G.AutoBuyAura = bool
    
    if bool then
        if selectedAura == "" then
            print("Please select an aura first!")
            return
        end
        
        -- Extract aura name from dropdown selection (remove rarity part)
        local auraName = selectedAura:match("^(.-)%s*%(")
        if not auraName then
            auraName = selectedAura
        end
        
        local crystal = findCrystalForItem(auraName)
        if not crystal then
            print("Could not find crystal for aura: " .. auraName)
            return
        end
        
        print("Auto buy aura started for: " .. auraName .. " from " .. crystal)
        spawn(function()
            while _G.AutoBuyAura and selectedAura ~= "" do
                local auraToBuy = ReplicatedStorage.cPetShopFolder:FindFirstChild(auraName)
                if auraToBuy then
                    ReplicatedStorage.cPetShopRemote:InvokeServer(auraToBuy)
                    print("Bought aura: " .. auraName)
                else
                    print("Aura not found: " .. auraName)
                end
                task.wait(0.1)
            end
        end)
    else
        print("Auto buy aura stopped")
    end
end)



local Gift = window:AddTab("Gift")
Gift:AddLabel("Gifting Protein egg:").TextSize = 22

local proteinEggLabel = Gift:AddLabel("Protein Eggs: 0")
proteinEggLabel.TextSize = 20

local selectedEggPlayer = nil
local eggCount = 0

local eggDropdown = Gift:AddDropdown("Player to Gift Eggs", function(selectedDisplayName)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.DisplayName == selectedDisplayName then
            selectedEggPlayer = plr
            break
        end
    end
end)

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= Players.LocalPlayer then
        eggDropdown:Add(plr.DisplayName)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= Players.LocalPlayer then
        eggDropdown:Add(plr.DisplayName)
    end
end)

Gift:AddTextBox("Amount of Eggs", function(text)
    eggCount = tonumber(text) or 0
end)

Gift:AddButton("Gift Eggs", function()
    if selectedEggPlayer and eggCount > 0 then
        for i = 1, eggCount do
            local egg = Players.LocalPlayer.consumablesFolder:FindFirstChild("Protein Egg")
            if egg then
                ReplicatedStorage.rEvents.giftRemote:InvokeServer("giftRequest", selectedEggPlayer, egg)
                task.wait(0.1)
            end
        end
    end
end)

Gift:AddLabel("Gifting Tropical Shakes:").TextSize = 22

local tropicalShakeLabel = Gift:AddLabel("Tropical Shakes: 0")
tropicalShakeLabel.TextSize = 18

local selectedShakePlayer = nil
local shakeCount = 0

local shakeDropdown = Gift:AddDropdown("Player to Gift Tropical Shakes", function(selectedDisplayName)
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr.DisplayName == selectedDisplayName then
            selectedShakePlayer = plr
            break
        end
    end
end)

for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= Players.LocalPlayer then
        shakeDropdown:Add(plr.DisplayName)
    end
end

Players.PlayerAdded:Connect(function(plr)
    if plr ~= Players.LocalPlayer then
        shakeDropdown:Add(plr.DisplayName)
    end
end)

Gift:AddTextBox("Tropical Shakes gift", function(text)
    shakeCount = tonumber(text) or 0
end)

Gift:AddButton("Gift Tropical Shakes", function()
    if selectedShakePlayer and shakeCount > 0 then
        for i = 1, shakeCount do
            local shake = Players.LocalPlayer.consumablesFolder:FindFirstChild("Tropical Shake")
            if shake then
                ReplicatedStorage.rEvents.giftRemote:InvokeServer("giftRequest", selectedShakePlayer, shake)
                task.wait(0.1)
            end
        end
    end
end)

local function updateItemCount()
    local proteinEggCount = 0
    local tropicalShakeCount = 0

    local backpack = Players.LocalPlayer:WaitForChild("Backpack")
    if backpack then
        for _, item in ipairs(backpack:GetChildren()) do
            if item.Name == "Protein Egg" then
                proteinEggCount = proteinEggCount + 1
            elseif item.Name == "Tropical Shake" or item.Name == "PiÃ±as" then
                tropicalShakeCount = tropicalShakeCount + 1
            end
        end
    end

    proteinEggLabel.Text = "Protein Eggs: " .. proteinEggCount
    tropicalShakeLabel.Text = "Tropical Shakes: " .. tropicalShakeCount
end

task.spawn(function()
    while true do
        updateItemCount()
        task.wait(0.25)
    end
end)


local itemList = {
    "Tropical Shake",
    "Energy Shake",
    "Protein Bar",
    "TOUGH Bar",
    "Protein Shake",
    "ULTRA Shake",
    "Energy Bar"
}

local function formatEventName(itemName)
    local parts = {}
    for word in itemName:gmatch("%S+") do
        table.insert(parts, word:lower())
    end
    for i = 2, #parts do
        parts[i] = parts[i]:sub(1, 1):upper() .. parts[i]:sub(2)
    end
    return table.concat(parts)
end

local function activateRandomItems(count)
    local shuffledItems = {}
    for _, item in ipairs(itemList) do
        table.insert(shuffledItems, item)
    end
    for i = #shuffledItems, 2, -1 do
        local j = math.random(i)
        shuffledItems[i], shuffledItems[j] = shuffledItems[j], shuffledItems[i]
    end
    for i = 1, math.min(count, #shuffledItems) do
        local tool =
            player.Character:FindFirstChild(shuffledItems[i]) or player.Backpack:FindFirstChild(shuffledItems[i])
        if tool then
            local eventName = formatEventName(shuffledItems[i])
            player.muscleEvent:FireServer(eventName, tool)
        end
    end
end

local eatingRunning = false
task.spawn(
    function()
        while true do
            if eatingRunning then
                activateRandomItems(4)
                task.wait(0.5)
            else
                task.wait(0.5)
            end
        end
    end
)

Gift:AddButton(
    "Limpiar Inventario",
    function(state)
        eatingRunning = state
        if state then
            activateRandomItems(4)
        end
    end
)


local Credits = window:AddTab("Credits")

Credits:AddLabel("Toxic Free Version")
Credits:AddLabel("Script Hecho por: Rafael AKA skidder ai user")
Credits:AddLabel("Tiktok:DeathAiUser")
Credits:AddLabel("MVX ON BOTTOM")
Credits:AddButton("Servidor De Discord", function()
    setclipboard("https://discord.gg/gayfuckers123")
end)

  end
end)
GetKeyButton.MouseButton1Click:Connect(function()
 setclipboard("https://rekonise.com/get-key-of-enchanted-hub-3p3up") 
end)
