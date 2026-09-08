-- // // // UI Library Loading // // // --
local Valiant = loadstring(game:HttpGet("https://raw.githubusercontent.com/cens6r/robloxscripts/main/scripts/ui-libs/valiant/valiant.lua"))()

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()

local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

Fluent:Notify({
    Title = "Dark Hub",
    Content = "Executado com sucesso.",
    Duration = 5
})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local Plr = Players.LocalPlayer
-- // // // Criar Janela // // // --
local Window = Fluent:CreateWindow({
    Title = "Ninja Legends",
    SubTitle = "by SECPLAY",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Amethyst",
    MinimizeKey = nil
})
-- // // // TABS // // // --
local Tabs = {
    Main = Window:AddTab({ Title = "🏠 Main", Icon = "home" }),
    Buy = Window:AddTab({ Title = "💰 Buy", Icon = "shopping-cart" }),
    Pets = Window:AddTab({ Title = "🐱 Pets", Icon = "paw-print" }),
    Teleport = Window:AddTab({ Title = "🗺️ Teleport", Icon = "map" }),
    Misc = Window:AddTab({ Title = "🎯 Misc", Icon = "user" }),
    Settings = Window:AddTab({ Title = "⚙️ Config", Icon = "settings" })
}
-- ========== MAIN (Autofarm) ==========  
-- // AUTO SWING // --
local AutoSwingToggle = Tabs.Main:AddToggle("AutoSwing", {
    Title = "Auto Click",
    Description = "Equip the sword to work",
    Default = false,
    Callback = function(state)
        getgenv().AutoSwing = state
        if state then
            task.spawn(function()
                while getgenv().AutoSwing do
                    pcall(function()
                        local player = game.Players.LocalPlayer
                        local backpack = player:WaitForChild("Backpack")
                        local char = player.Character or player.CharacterAdded:Wait()
                        -- Equipa automaticamente qualquer espada
                        for _, tool in pairs(backpack:GetChildren()) do
                            if tool:IsA("Tool") and tool.Name:lower():find("katana") then
                                tool.Parent = char
                            end
                        end
                        -- Swing (bater com a espada)
                        local event = player:FindFirstChild("ninjaEvent")
                        if event then
                            event:FireServer("swingKatana")
                        end
                    end)
                    task.wait(0.1) -- ajuste de velocidade
                end
            end)
        end
    end
})
-- Swing Delay slider  
Tabs.Main:AddSlider("SwingDelay", { Title = "Swing Delay (s)", Min = 0.01, Max = 2, Default = 0.5, Rounding = 2 }):OnChanged(function(v)  
    getgenv().SwingDelay = tonumber(v) or 0.5  
end)  
  
-- Auto Sell (move player into sell circle)  
local AutoSellToggle = Tabs.Main:AddToggle("AutoSell", { Title = "Auto Sell (teleport into circle)", Default = false })  
AutoSellToggle:OnChanged(function(state)  
    getgenv().AutoSell = state  
    if state then  
        task.spawn(function()  
            while getgenv().AutoSell do  
                pcall(function()  
                    local sellFolder = Workspace:FindFirstChild("sellAreaCircles")  
                    if sellFolder then  
                        local target = sellFolder:FindFirstChild("sellAreaCircle16") or sellFolder:FindFirstChild("sellAreaCircle") or sellFolder:GetChildren()[1]  
                        if target and target:FindFirstChild("circleInner") and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then  
                            Plr.Character.HumanoidRootPart.CFrame = target.circleInner.CFrame  
                        end  
                    end  
                end)  
                task.wait(0.1)  
            end  
        end)  
    end  
end)  
  
-- Farm Hoops (fixed to respect toggle & use remote when available)  
local FarmHoopsToggle = Tabs.Main:AddToggle("FarmHoops", { Title = "Farm Hoops", Default = false })  
FarmHoopsToggle:OnChanged(function(state)  
    getgenv().FarmHoops = state  
    if state then  
        task.spawn(function()  
            while getgenv().FarmHoops do  
                pcall(function()  
                    local hoops = Workspace:FindFirstChild("Hoops")  
                    if hoops then  
                        for _, hoop in pairs(hoops:GetChildren()) do  
                            if not getgenv().FarmHoops then break end  
                            if ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("hoopEvent") then  
                                ReplicatedStorage.rEvents.hoopEvent:FireServer("useHoop", hoop)  
                            else  
                                -- fallback: move character inside hoop  
                                if Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") and hoop:IsA("BasePart") then  
                                    Plr.Character.HumanoidRootPart.CFrame = hoop.CFrame  
                                end  
                            end  
                            task.wait(getgenv().HoopDelay or 0.5)  
                        end  
                    end  
                end)  
                task.wait(0.2)  
            end  
        end)  
    end  
end)  
  
Tabs.Main:AddSlider("HoopDelay", { Title = "Hoop Delay (s)", Min = 0.01, Max = 2, Default = 0.5, Rounding = 2 }):OnChanged(function(v)  
    getgenv().HoopDelay = tonumber(v) or 0.5  
end)  
  
-- Auto Collect Coins
local AutoCollectCoinsToggle = Tabs.Main:AddToggle("AutoCollectCoins", {
    Title = "Auto Collect Coins",
    Default = false
})
AutoCollectCoinsToggle:OnChanged(function(state)
    getgenv().AutoCollectCoins = state
    if state then
        task.spawn(function()
            while getgenv().AutoCollectCoins do
                pcall(function()
                    local hrp = Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        for _, drop in pairs(Workspace:GetDescendants()) do
                            if not getgenv().AutoCollectCoins then break end -- verifica estado a cada iteração
                            if drop:IsA("BasePart") and drop.Name:match("Coin") then
                                hrp.CFrame = drop.CFrame
                                task.wait(0.05)
                            end
                        end
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)
-- Auto Collect Chi
local AutoCollectChiToggle = Tabs.Main:AddToggle("AutoCollectChi", {
    Title = "Auto Collect Chi",
    Default = false
})
AutoCollectChiToggle:OnChanged(function(state)
    getgenv().AutoCollectChi = state
    if state then
        task.spawn(function()
            while getgenv().AutoCollectChi do
                pcall(function()
                    local hrp = Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        for _, drop in pairs(Workspace:GetDescendants()) do
                            if not getgenv().AutoCollectChi then break end -- verifica estado a cada iteração
                            if drop:IsA("BasePart") and drop.Name:match("Chi") then
                                hrp.CFrame = drop.CFrame
                                task.wait(0.05)
                            end
                        end
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)
-- // ELEMENTOS DENTRO DA ABA MAIN // --
local ReplicatedStorage = game:GetService("ReplicatedStorage")
Tabs.Main:AddSection("Elementos")
local ElementDropdown = Tabs.Main:AddDropdown("SelectElement", {
    Title = "Escolher Elemento",
    Values = {"Lightning", "Inferno", "Frost", "Earth", "Shadow", "Storm", "Thunder", "Eternal"},
    Multi = false,
    Default = "Lightning"
})
ElementDropdown:OnChanged(function(value)
    getgenv().SelectedElement = value
end)
Tabs.Main:AddButton({
    Title = "Pegar Elemento Selecionado",
    Description = "Obtém o elemento escolhido no dropdown acima",
    Callback = function()
        local selected = getgenv().SelectedElement
        local remote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("elementMasteryEvent")
        if remote and selected then
            remote:FireServer(selected)
            Fluent:Notify({
                Title = "Elemento",
                Content = "Tentando pegar o elemento: " .. tostring(selected),
                Duration = 5
            })
        else
            Fluent:Notify({
                Title = "Erro",
                Content = "Não foi possível encontrar o Remote ou nenhum elemento foi selecionado!",
                Duration = 5
            })
        end
    end
})
-- ========== Unlock All Elements Button ========== --
Tabs.Main:AddButton({
    Title = "Unlock All Elements",
    Description = "Tenta desbloquear todos os elementos de uma vez",
    Callback = function()
        local elements = {"Lightning", "Inferno", "Frost", "Earth", "Shadow", "Storm", "Thunder", "Eternal"}
        local remote = ReplicatedStorage:FindFirstChild("rEvents") and ReplicatedStorage.rEvents:FindFirstChild("elementMasteryEvent")
        if remote then
            for _, element in pairs(elements) do
                pcall(function()
                    remote:FireServer(element)
                end)
            end
            Fluent:Notify({
                Title = "Elementos",
                Content = "Tentando desbloquear todos os elementos!",
                Duration = 5
            })
        else
            Fluent:Notify({
                Title = "Erro",
                Content = "Não foi possível encontrar o Remote!",
                Duration = 5
            })
        end
    end
})
-- ========== BUY TAB ==========  
-- Buy All Swords Toggle
Tabs.Buy:AddToggle("BuyAllSwords", { Title = "Buy All Swords", Default = false }):OnChanged(function(state)
    getgenv().BuyAllSwords = state
    if state then
        task.spawn(function()
            while getgenv().BuyAllSwords do
                pcall(function()
                    local Players = game:GetService("Players")
                    local ninjaEvent = Players.LocalPlayer:WaitForChild("ninjaEvent")
                    ninjaEvent:FireServer("buyAllSwords", "Blazing Vortex Island")
                end)
                task.wait(1) -- delay entre cada tentativa
            end
        end)
    end
end)
-- Buy All Belts Toggle
Tabs.Buy:AddToggle("BuyAllBelts", { Title = "Buy All Belts", Default = false }):OnChanged(function(state)
    getgenv().BuyAllBelts = state
    if state then
        task.spawn(function()
            while getgenv().BuyAllBelts do
                pcall(function()
                    local Players = game:GetService("Players")
                    local ninjaEvent = Players.LocalPlayer:WaitForChild("ninjaEvent")
                    ninjaEvent:FireServer("buyAllBelts", "Blazing Vortex Island")
                end)
                task.wait(1)
            end
        end)
    end
end)
-- Buy All Skills Toggle
Tabs.Buy:AddToggle("BuyAllSkills", { Title = "Buy All Skills", Default = false }):OnChanged(function(state)
    getgenv().BuyAllSkills = state
    if state then
        task.spawn(function()
            while getgenv().BuyAllSkills do
                pcall(function()
                    local Players = game:GetService("Players")
                    local ninjaEvent = Players.LocalPlayer:WaitForChild("ninjaEvent")
                    ninjaEvent:FireServer("buyAllSkills", "Blazing Vortex Island")
                end)
                task.wait(1)
            end
        end)
    end
end)
-- ========== PETS TAB ========== --
local PetsTab = Tabs.Pets
-- Seção Crystal
local CrystalSection = PetsTab:AddSection("Crystal")
local CrystalList = {}
for _, v in pairs(game.Workspace.mapCrystalsFolder:GetChildren()) do
    table.insert(CrystalList, v.Name)
end
local CrystalDropdown = CrystalSection:AddDropdown("SelectCrystal", {
    Title = "Select Crystal",
    Values = CrystalList,
    Multi = false,
    Default = CrystalList[1]
})
CrystalDropdown:OnChanged(function(value)
    getgenv().cryEgg = value
end)
local OpenCrystalToggle = CrystalSection:AddToggle("OpenCrystal", {
    Title = "Open Crystal",
    Description = "Auto Open Selected Crystal",
    Default = false
})
OpenCrystalToggle:OnChanged(function(state)
    getgenv().cCry = state
    if getgenv().cCry then
        task.spawn(function()
            while getgenv().cCry do
                task.wait(0.5)
                if getgenv().cryEgg and game:GetService("ReplicatedStorage"):FindFirstChild("rEvents") then
                    pcall(function()
                        game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", getgenv().cryEgg)
                    end)
                end
            end
        end)
    end
end)
-- Seção Pets
local PetsSection = PetsTab:AddSection("Pets")
local AutoEvolveToggle = PetsSection:AddToggle("AutoEvolvePets", { Title = "Auto Evolve Pets", Default = false })
local AutoSellToggle = PetsSection:AddToggle("AutoSellPets", { Title = "Auto Sell Pets", Default = false })
local PetToSellDropdown = PetsSection:AddDropdown("PetToSell", {
    Title = "Pet To Sell",
    Values = {"Basic","Advanced","Rare","Epic","Unique","Omega","Elite","Infinity","Awakened","Master Legend"},
    Multi = false,
    Default = "Basic"
})
-- Inicializa variáveis globais
getgenv().AutoEvolve = false
getgenv().AutoSellPets = false
getgenv().PetToSell = "Basic"
-- Auto Evolve
AutoEvolveToggle:OnChanged(function(state)
    getgenv().AutoEvolve = state
    if state then
        task.spawn(function()
            while getgenv().AutoEvolve do
                task.wait(2)
                pcall(function()
                    local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
                    if rEvents and rEvents:FindFirstChild("autoEvolveRemote") then
                        rEvents.autoEvolveRemote:InvokeServer("autoEvolvePets")
                    end
                end)
            end
        end)
    end
end)
-- Auto Sell
AutoSellToggle:OnChanged(function(state)
    getgenv().AutoSellPets = state
    if state then
        task.spawn(function()
            while getgenv().AutoSellPets do
                task.wait(5)
                pcall(function()
                    if Plr:FindFirstChild("petsFolder") and getgenv().PetToSell then
                        local folder = Plr.petsFolder:FindFirstChild(getgenv().PetToSell)
                        if folder then
                            local rEvents = game:GetService("ReplicatedStorage"):FindFirstChild("rEvents")
                            if rEvents and rEvents:FindFirstChild("sellPetEvent") then
                                for _, pet in pairs(folder:GetChildren()) do
                                    rEvents.sellPetEvent:FireServer("sellPet", pet)
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end
end)
-- Pet To Sell
PetToSellDropdown:OnChanged(function(val)
    getgenv().PetToSell = val
end)
-- ISLAND TELEPORT --
-- Unlock All Islands button  
Tabs.Teleport:AddButton({ Title = "Unlock All Islands", Description = "Desbloqueia todas as ilhas" , Callback = function()  
    local oldCFrame = (Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart")) and Plr.Character.HumanoidRootPart.CFrame or nil  
    local unlockParts = Workspace:FindFirstChild("islandUnlockParts")  
    if unlockParts then  
        for _, v in pairs(unlockParts:GetChildren()) do  
            if Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then  
                Plr.Character.HumanoidRootPart.CFrame = v.CFrame  
            end  
            task.wait(0.2)  
        end  
    end  
    if oldCFrame and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then  
        Plr.Character.HumanoidRootPart.CFrame = oldCFrame  
    end  
end})  
 
Tabs.Teleport:AddDropdown("IslandTeleport", {
    Title = "Island Teleport",
    Values = {  
        "Enchanted island","Astral island","Mystical island","Space island","Tundra island",
        "Eternal island","Sandstorm island","Thunderstorm island","Ancient Inferno island",
        "Midnight Shadow Island","Mythical Souls island","Winter Wonderland island",
        "Golden Master island","Dragon Legend island","Cybernetic Legends island",
        "Skystorm Ultraus island","Chaos Legends island","Soul Fusion island",
        "Dark Elements island","Inner Peace island","Blazing Vorterx island"
    },
    Multi = false,
    Default = ""  -- Nenhuma ilha selecionada ao iniciar
}):OnChanged(function(SelectLocation)
    if SelectLocation == "" then return end -- evita teleporte automático
    local tp = {
        ["Enchanted island"] = CFrame.new(51.242, 849.832, -151.814),
        ["Astral island"] = CFrame.new(216.322, 2095.48, 256.276),
        ["Mystical island"] = CFrame.new(184.796, 4124.18, 45.8521),
        ["Space island"] = CFrame.new(138.522, 5847.19, 123.56),
        ["Tundra island"] = CFrame.new(145.132, 9372.4, 90.3484),
        ["Eternal island"] = CFrame.new(145.132, 13767.3, 90.3484),
        ["Sandstorm island"] = CFrame.new(145.132, 17773.5, 90.3484),
        ["Thunderstorm island"] = CFrame.new(145.132, 24157.2, 90.3484),
        ["Ancient Inferno island"] = CFrame.new(144.021, 28364.7, 88.9619),
        ["Midnight Shadow Island"] = CFrame.new(144.021, 33315.4, 88.9619),
        ["Mythical Souls island"] = CFrame.new(144.021, 39426, 88.9619),
        ["Winter Wonderland island"] = CFrame.new(144.021, 46119, 88.9619),
        ["Golden Master island"] = CFrame.new(144.021, 52716.2, 88.9619),
        ["Dragon Legend island"] = CFrame.new(144.021, 59703.1, 88.9619),
        ["Cybernetic Legends island"] = CFrame.new(144.021, 66777.6, 88.9619),
        ["Skystorm Ultraus island"] = CFrame.new(144.021, 70379.6, 88.9619),
        ["Chaos Legends island"] = CFrame.new(144.021, 74551.3, 88.9619),
        ["Soul Fusion island"] = CFrame.new(144.021, 79855.4, 88.9619),
        ["Dark Elements island"] = CFrame.new(144.021, 83307.4, 88.9619),
        ["Inner Peace island"] = CFrame.new(144.021, 87159.5, 88.9619),
        ["Blazing Vorterx island"] = CFrame.new(144.021, 91354.5, 88.9619)
    }
    if tp[SelectLocation] and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") then
        Plr.Character.HumanoidRootPart.CFrame = tp[SelectLocation]
    end
end)
-- Bad Karma
Tabs.Teleport:AddDropdown("BadKarma", {
    Title = "Bad karma training",
    Values = {"Tornado","Lava pit","Swords Of Ancients","Fallen Infinity Blade"},
    Multi = false,
    Default = "" -- Nenhuma opção ao iniciar
}):OnChanged(function(choice)
    if choice == "" then return end
    if not (Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart")) then return end
    if choice == "Tornado" then
        Plr.Character.HumanoidRootPart.CFrame = CFrame.new(330.128, 16921.8, -16.1308)
    elseif choice == "Lava pit" then
        Plr.Character.HumanoidRootPart.CFrame = CFrame.new(-119.522, 13002.3, 274.569)
    elseif choice == "Swords Of Ancients" then
        Plr.Character.HumanoidRootPart.CFrame = CFrame.new(627.359, 82.2062, 2429.49)
    elseif choice == "Fallen Infinity Blade" then
        Plr.Character.HumanoidRootPart.CFrame = CFrame.new(1875.97, 82.2062, -6806.41)
    end
end)
  
-- ================== MISC TAB ================== --
local MiscSection = Tabs.Misc:AddSection("Misc Settings")
-- WalkSpeed Slider
local WalkSpeedSlider = MiscSection:AddSlider("WalkSpeed", {
    Title = "Walk Speed",
    Description = "Ajuste sua velocidade de movimento",
    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        if Plr.Character and Plr.Character:FindFirstChildOfClass("Humanoid") then
            Plr.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = value
        end
    end
})
-- JumpPower Slider
local JumpPowerSlider = MiscSection:AddSlider("JumpPower", {
    Title = "Jump Power",
    Description = "Ajuste a altura do seu pulo",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 1,
    Callback = function(value)
        if Plr.Character and Plr.Character:FindFirstChildOfClass("Humanoid") then
            Plr.Character:FindFirstChildOfClass("Humanoid").JumpPower = value
        end
    end
})
-- Infinite Jump Toggle
getgenv().InfiniteJumpEnabled = false
MiscSection:AddToggle("InfiniteJump", {
    Title = "Infinite Jump",
    Description = "Permite pular infinitamente",
    Default = false,
    Callback = function(state)
        getgenv().InfiniteJumpEnabled = state
    end
})
UserInputService.JumpRequest:Connect(function()
    if getgenv().InfiniteJumpEnabled and Plr.Character and Plr.Character:FindFirstChildOfClass("Humanoid") then
        Plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
-- Reset humanoid values on respawn
Plr.CharacterAdded:Connect(function(char)
    task.wait(0.5)
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = WalkSpeedSlider.Value
        hum.JumpPower = JumpPowerSlider.Value
    end
end)
-- Noclip Toggle
local Clip = true
local NoclipConnection = nil
MiscSection:AddToggle("Noclip", {
    Title = "Noclip",
    Description = "Ativa/desativa colisão",
    Default = false,
    Callback = function(state)
        if state then
            Clip = false
            NoclipConnection = game:GetService("RunService").Stepped:Connect(function()
                if not Clip and Plr.Character then
                    for _, v in pairs(Plr.Character:GetDescendants()) do
                        if v:IsA("BasePart") and v.CanCollide then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        else
            Clip = true
            if NoclipConnection then
                NoclipConnection:Disconnect()
                NoclipConnection = nil
            end
        end
    end
})
-- Anti AFK
local VirtualUser = game:GetService("VirtualUser")
Plr.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
-- ========== SETTINGS (save manager) ==========  
SaveManager:SetLibrary(Fluent)  
InterfaceManager:SetLibrary(Fluent)  
SaveManager:IgnoreThemeSettings()  
SaveManager:SetIgnoreIndexes({})  
InterfaceManager:SetFolder("DarkHub-Fluent")  
SaveManager:SetFolder("DarkHub-Fluent/NinjaLegends")  
InterfaceManager:BuildInterfaceSection(Tabs.Settings)  
SaveManager:BuildConfigSection(Tabs.Settings)  
Window:SelectTab(1)  
Fluent:Notify({ Title = "Ninja Legends", Content = "O script foi carregado com sucesso!", Duration = 8 })  
SaveManager:LoadAutoloadConfig()  
  
-- Floating button (keeps your style)  
local floatingName = "DarkHubFloatingButton"  
local WindowHidden = false  
local function createFloatingButton()  
    local playerGui = Plr:FindFirstChild("PlayerGui") or Plr:WaitForChild("PlayerGui")  
    local existing = playerGui:FindFirstChild(floatingName)  
    if existing then existing:Destroy() end  
  
    local screenGui = Instance.new("ScreenGui")  
    screenGui.Name = floatingName  
    screenGui.ResetOnSpawn = false  
    screenGui.Parent = playerGui  
  
    local imageButton = Instance.new("ImageButton")  
    imageButton.Name = "FloatingButton"  
    imageButton.Size = UDim2.new(0, 50, 0, 50)  
    imageButton.Position = UDim2.new(1, -110, 0, 10)  
    imageButton.BackgroundTransparency = 1  
    imageButton.Image = "rbxassetid://127146707195866"  
    imageButton.Parent = screenGui  
  
    local uiStroke = Instance.new("UIStroke")  
    uiStroke.Parent = imageButton  
    uiStroke.Thickness = 4  
    uiStroke.Color = Color3.fromRGB(0, 90, 255)  
  
    local corner = Instance.new("UICorner")  
    corner.Parent = imageButton  
  
    imageButton.MouseButton1Click:Connect(function()  
        if WindowHidden then  
            Window:Minimize()  
            WindowHidden = false  
        else  
            Window:Minimize()  
            WindowHidden = true  
        end  
    end)  
  
    })
    
    
    -- drag  
    local dragging, startPos, startImagePos = false, nil, nil  
    imageButton.InputBegan:Connect(function(input)  
        if input.UserInputType == Enum.UserInputType.MouseButton1 then  
            dragging = true  
            startPos = input.Position  
            startImagePos = imageButton.Position  
            input.Changed:Connect(function()  
                if input.UserInputState == Enum.UserInputState.End then dragging = false end  
            end)  
        end  
    end)  
    imageButton.InputChanged:Connect(function(input)  
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then  
            local delta = input.Position - startPos  
            imageButton.Position = UDim2.new(startImagePos.X.Scale, startImagePos.X.Offset + delta.X, startImagePos.Y.Scale, startImagePos.Y.Offset + delta.Y)  
        end  
    end)  
end  
  
createFloatingButton()  
Plr.CharacterAdded:Connect(function()  
    task.wait(0.5)  
    createFloatingButton()
end)