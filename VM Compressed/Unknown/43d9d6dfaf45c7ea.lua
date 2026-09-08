-- EcstacyV2 - Key System + Full Hub Integration

-- Load Fluent UI & SaveManager
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- Create Key Verification Window
local KeyWindow = Fluent:CreateWindow({
    Title = "ECSTACY V2 - KEY VERIFICATION",
    SubTitle = "Script Access System",
    TabWidth = 160,
    Size = UDim2.fromOffset(450, 200),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

Fluent:SetTheme({
    Background = Color3.fromRGB(15, 15, 20),
    Text = Color3.fromRGB(240, 240, 240),
    Accent = Color3.fromRGB(180, 40, 180)
})

local KeyTab = KeyWindow:AddTab({Title = "Key", Icon = "key"})

KeyTab:AddParagraph({
    Title = "Enter Your Access Key",
    Content = ""
})

local KeyInput = KeyTab:AddInput("KeyInput", {
    Title = "Access Key",
    Default = "",
    Placeholder = "Paste key here",
    Numeric = false,
    Finished = false
})

KeyTab:AddButton({
    Title = "VERIFY KEY",
    Description = "Check key validity",
    Callback = function()
        local key = string.lower(KeyInput.Value:gsub("%s+", ""))
        if key == "shakshokasotuff45" then
            Fluent:Notify({
                Title = "Access Granted",
                Content = "Loading EcstacyV2...",
                Duration = 2
            })
            KeyWindow:Destroy()
            loadMainScript()
        else
            Fluent:Notify({
                Title = "Invalid Key",
                Content = "Incorrect key entered",
                Duration = 3
            })
        end
    end
})

KeyTab:AddButton({
    Title = "GET KEY (FREE)",
    Description = "Copies key URL to clipboard",
    Callback = function()
        if setclipboard then
            setclipboard("https://linkvertise.com/1352313/shkey1?o=sharing")
            Fluent:Notify({
                Title = "Link Copied!",
                Content = "Paste in browser to get key",
                Duration = 3
            })
        else
            Fluent:Notify({
                Title = "Error",
                Content = "Clipboard not supported",
                Duration = 3
            })
        end
    end
})

task.spawn(function()
    task.wait(1)
    KeyInput:CaptureFocus()
end)

-- ✅ MAIN HUB SCRIPT START
function loadMainScript()
--[[
    EcstacyV2 Hub
    Enhanced Steal a Brainrot Exploit
    Version 2.2
]]

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- Player
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- UI Configuration
local Window = Fluent:CreateWindow({
    Title = "STEAL A BRAINROT 〢 EcstacyV2",
    SubTitle = "Enhanced Exploit Hub v2.2",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- Custom Theme
Fluent:SetTheme({
    Background = Color3.fromRGB(15, 15, 20),
    LightBackground = Color3.fromRGB(25, 25, 30),
    DarkBackground = Color3.fromRGB(10, 10, 15),
    Text = Color3.fromRGB(240, 240, 240),
    LightText = Color3.fromRGB(255, 255, 255),
    DarkText = Color3.fromRGB(180, 180, 180),
    Accent = Color3.fromRGB(180, 40, 180),
    LightAccent = Color3.fromRGB(200, 60, 200),
    DarkAccent = Color3.fromRGB(140, 30, 140)
})

-- Tabs
local Tabs = {
    Main = Window:AddTab({Title = "Main", Icon = "box"}),
    Visuals = Window:AddTab({Title = "Visuals", Icon = "eye"}),
    Teleport = Window:AddTab({Title = "Teleport", Icon = "map-pin"}),
    Server = Window:AddTab({Title = "Server", Icon = "server"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})
}

-- Player Data
local plotName
for _, plot in ipairs(workspace.Plots:GetChildren()) do
    if plot:FindFirstChild("YourBase", true).Enabled then
        plotName = plot.Name
        break
    end
end

-- Lock Time Display
local remainingTime = workspace.Plots[plotName].Purchases.PlotBlock.Main.BillboardGui.RemainingTime
local lockTimeDisplay = Tabs.Main:AddParagraph({
    Title = "Lock Time: "..remainingTime.Text,
    Content = "Time remaining until your base unlocks"
})

task.spawn(function()
    while task.wait(0.25) do
        lockTimeDisplay:SetTitle("Lock Time: "..remainingTime.Text)
    end
end)

--[[
    MAIN FUNCTIONS
]]

-- Enhanced Steal Function
Tabs.Main:AddButton({
    Title = "Steal Brainrots",
    Description = "Teleports you to middle to collect brainrots",
    Callback = function()
        local pos = CFrame.new(0, -500, 0)
        local startTime = os.clock()
        
        while os.clock() - startTime < 1 do
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = pos
                task.wait()
            end
        end
    end
})

-- Speed System
local speedValue = 0
local speedConnection

local function updateSpeed()
    if speedConnection then speedConnection:Disconnect() end
    
    speedConnection = RunService.Heartbeat:Connect(function()
        if character and humanoid and humanoid.MoveDirection.Magnitude > 0 then
            character:TranslateBy(humanoid.MoveDirection * speedValue * 0.1)
        end
    end)
end

local SpeedSlider = Tabs.Main:AddSlider("SpeedSlider", {
    Title = "Speed Boost",
    Description = "Adjust your movement speed",
    Default = 0,
    Min = 0,
    Max = 10,
    Rounding = 1,
    Callback = function(value)
        speedValue = value
        updateSpeed()
    end
})

-- Invisibility Cloak Glitch
Tabs.Main:AddButton({
    Title = "Invisibility Glitch",
    Description = "Use Invisibility Cloak first for this to work",
    Callback = function()
        local cloak = character:FindFirstChild("Invisibility Cloak")
        if cloak and cloak:GetAttribute("SpeedModifier") == 2 then
            cloak.Parent = workspace
            Fluent:Notify({
                Title = "Success",
                Content = "Invisibility glitch activated!",
                Duration = 3
            })
        else
            Fluent:Notify({
                Title = "Error",
                Content = "Equip Invisibility Cloak first!",
                Duration = 3
            })
        end
    end
})

--[[
    VISUAL FEATURES
]]

-- ESP System with larger text
local ESP = {
    Players = false,
    LockTime = false,
    Rarities = {
        Legendary = false,
        Mythic = false,
        BrainrotGod = false,
        Secret = false
    }
}

local espInstances = {}
local lockEspInstances = {}

-- Player ESP with larger size
local function createPlayerESP(targetPlayer)
    if targetPlayer == player then return end
    
    local char = targetPlayer.Character
    if not char then return end
    
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "ESP_"..targetPlayer.Name
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 250, 0, 50) -- Larger size
    billboard.StudsOffset = Vector3.new(0, 3, 0)
    billboard.Adornee = root
    
    local label = Instance.new("TextLabel")
    label.Text = targetPlayer.DisplayName
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    label.TextStrokeTransparency = 0
    label.TextSize = 20 -- Larger text
    label.Font = Enum.Font.GothamBold
    label.Parent = billboard
    
    billboard.Parent = root
    espInstances[targetPlayer] = billboard
    
    targetPlayer.CharacterAdded:Connect(function(newChar)
        if billboard then billboard:Destroy() end
        task.wait(1)
        if ESP.Players then
            createPlayerESP(targetPlayer)
        end
    end)
end

-- Lock Time ESP with larger size
local function updateLockESP()
    for _, inst in pairs(lockEspInstances) do
        if inst then inst:Destroy() end
    end
    lockEspInstances = {}
    
    if not ESP.LockTime then return end
    
    for _, plot in pairs(workspace.Plots:GetChildren()) do
        local timeLabel = plot:FindFirstChild("Purchases", true) and 
                         plot.Purchases:FindFirstChild("PlotBlock", true) and
                         plot.Purchases.PlotBlock.Main:FindFirstChild("BillboardGui", true) and
                         plot.Purchases.PlotBlock.Main.BillboardGui:FindFirstChild("RemainingTime", true)
        
        if timeLabel then
            local isUnlocked = timeLabel.Text == "0s"
            local displayText = isUnlocked and "UNLOCKED" or ("LOCK: "..timeLabel.Text)
            local color = plot.Name == plotName and Color3.fromRGB(0, 255, 0) or 
                         (isUnlocked and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 255, 0))
            
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "LockESP_"..plot.Name
            billboard.Size = UDim2.new(0, 250, 0, 50) -- Larger size
            billboard.StudsOffset = Vector3.new(0, 5, 0)
            billboard.AlwaysOnTop = true
            billboard.Adornee = plot.Purchases.PlotBlock.Main
            
            local label = Instance.new("TextLabel")
            label.Text = displayText
            label.Size = UDim2.new(1, 0, 1, 0)
            label.BackgroundTransparency = 1
            label.TextColor3 = color
            label.TextStrokeColor3 = Color3.new(0, 0, 0)
            label.TextSize = 20 -- Larger text
            label.Font = Enum.Font.GothamBold
            label.Parent = billboard
            
            billboard.Parent = plot
            lockEspInstances[plot] = billboard
        end
    end
end

-- Rarity ESP with larger size
local raritySettings = {
    Legendary = {Color = Color3.fromRGB(255, 215, 0), Size = UDim2.new(0, 220, 0, 50)},
    Mythic = {Color = Color3.fromRGB(255, 50, 255), Size = UDim2.new(0, 220, 0, 50)},
    BrainrotGod = {Color = Color3.fromRGB(180, 40, 180), Size = UDim2.new(0, 240, 0, 60)},
    Secret = {Color = Color3.fromRGB(0, 0, 0), Size = UDim2.new(0, 260, 0, 70)}
}

local rarityEspInstances = {}

local function updateRarityESP()
    for _, inst in pairs(rarityEspInstances) do
        if inst then inst:Destroy() end
    end
    rarityEspInstances = {}
    
    for _, plot in pairs(workspace.Plots:GetChildren()) do
        if plot.Name ~= plotName then
            for _, child in pairs(plot:GetDescendants()) do
                if child.Name == "Rarity" and child:IsA("TextLabel") then
                    local rarity = child.Text:gsub(" ", "")
                    if ESP.Rarities[rarity] then
                        local settings = raritySettings[rarity]
                        local model = child.Parent.Parent
                        
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "RarityESP_"..rarity
                        billboard.Size = settings.Size
                        billboard.StudsOffset = Vector3.new(0, 3, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Adornee = model
                        
                        local label = Instance.new("TextLabel")
                        label.Text = child.Parent.DisplayName.Text
                        label.Size = UDim2.new(1, 0, 1, 0)
                        label.BackgroundTransparency = 1
                        label.TextColor3 = settings.Color
                        label.TextStrokeColor3 = Color3.new(0, 0, 0)
                        label.TextSize = 18 -- Larger text
                        label.Font = Enum.Font.GothamBold
                        label.Parent = billboard
                        
                        billboard.Parent = model
                        table.insert(rarityEspInstances, billboard)
                    end
                end
            end
        end
    end
end

-- ESP Controls
Tabs.Visuals:AddToggle("PlayerESP", {
    Title = "Player ESP",
    Default = false,
    Callback = function(value)
        ESP.Players = value
        if value then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= player then
                    createPlayerESP(plr)
                end
            end
        else
            for plr, inst in pairs(espInstances) do
                if inst then inst:Destroy() end
            end
            espInstances = {}
        end
    end
})

Tabs.Visuals:AddToggle("LockESP", {
    Title = "Lock Time ESP",
    Default = false,
    Callback = function(value)
        ESP.LockTime = value
        updateLockESP()
    end
})

Tabs.Visuals:AddDropdown("RarityESP", {
    Title = "Rarity ESP",
    Values = {"Legendary", "Mythic", "BrainrotGod", "Secret"},
    Multi = true,
    Default = {},
    Callback = function(values)
        ESP.Rarities.Legendary = values["Legendary"] or false
        ESP.Rarities.Mythic = values["Mythic"] or false
        ESP.Rarities.BrainrotGod = values["BrainrotGod"] or false
        ESP.Rarities.Secret = values["Secret"] or false
        updateRarityESP()
    end
})

-- Fullbright
Tabs.Visuals:AddToggle("Fullbright", {
    Title = "Fullbright",
    Description = "Brightens up dark areas",
    Default = false,
    Callback = function(value)
        if value then
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.Brightness = 2
            Lighting.GlobalShadows = false
        else
            Lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
            Lighting.Brightness = 1
            Lighting.GlobalShadows = true
        end
    end
})

--[[
    TELEPORT SYSTEM
]]

Tabs.Teleport:AddButton({
    Title = "Teleport to Spawn",
    Description = "Returns you to the spawn location",
    Callback = function()
        local spawn = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
        if spawn and character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(spawn.Position + Vector3.new(0, 5, 0))
        end
    end
})

Tabs.Teleport:AddButton({
    Title = "Find Highest Brainrot",
    Description = "Teleports to the highest brainrot on the map",
    Callback = function()
        local highest = nil
        local maxY = -math.huge
        
        for _, part in ipairs(workspace:GetDescendants()) do
            if part.Name:lower():find("brainrot") and part:IsA("BasePart") and part.Position.Y > maxY then
                maxY = part.Position.Y
                highest = part
            end
        end
        
        if highest and character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(highest.Position + Vector3.new(0, 3, 0))
        end
    end
})

--[[
    SERVER UTILITIES
]]

-- Pet Finder
local petModels = game:GetService("ReplicatedStorage").Models.Animals:GetChildren()
local petNames = {}
for _, pet in ipairs(petModels) do
    table.insert(petNames, pet.Name)
end

local petFinderResults = Tabs.Server:AddParagraph({
    Title = "No pets selected",
    Content = "Select pets to track from the dropdown"
})

local selectedPets = {}
local isFindingPets = false

local function getPlotOwner(plot)
    local sign = plot:FindFirstChild("PlotSign")
    if sign and sign:FindFirstChild("SurfaceGui") then
        local text = sign.SurfaceGui.Frame.TextLabel.Text
        return text:match("^(.-)'s Base") or text
    end
    return "Unknown"
end

Tabs.Server:AddDropdown("PetFinder", {
    Title = "Pet Finder",
    Values = petNames,
    Multi = true,
    Default = {},
    Callback = function(values)
        selectedPets = {}
        for name, selected in pairs(values) do
            if selected then
                table.insert(selectedPets, name)
            end
        end
        
        if not isFindingPets and #selectedPets > 0 then
            isFindingPets = true
            task.spawn(function()
                while #selectedPets > 0 do
                    local results = {}
                    
                    for _, plot in ipairs(workspace.Plots:GetChildren()) do
                        if plot.Name ~= plotName then
                            local owner = getPlotOwner(plot)
                            for _, child in ipairs(plot:GetDescendants()) do
                                if child.Name == "DisplayName" and table.find(selectedPets, child.Text) then
                                    results[owner] = results[owner] or {}
                                    results[owner][child.Text] = (results[owner][child.Text] or 0) + 1
                                end
                            end
                        end
                    end
                    
                    if next(results) then
                        local resultText = ""
                        for owner, pets in pairs(results) do
                            for name, count in pairs(pets) do
                                resultText = resultText .. string.format("%s x%d | Owner: %s\n", name, count, owner)
                            end
                        end
                        petFinderResults:SetTitle(resultText)
                    else
                        petFinderResults:SetTitle("No selected pets found")
                    end
                    
                    task.wait(0.5)
                end
                
                isFindingPets = false
                petFinderResults:SetTitle("No pets selected")
            end)
        elseif #selectedPets == 0 then
            petFinderResults:SetTitle("No pets selected")
        end
    end
})

-- Server Hop
Tabs.Server:AddButton({
    Title = "Server Hop",
    Description = "Find a new server",
    Callback = function()
        local servers = {}
        local serverList = HttpService:JSONDecode(game:HttpGet(
            "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        ))
        
        for _, server in ipairs(serverList.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                table.insert(servers, server.id)
            end
        end
        
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)])
        else
            Fluent:Notify({
                Title = "Error",
                Content = "No available servers found",
                Duration = 3
            })
        end
    end
})

-- Rejoin
Tabs.Server:AddButton({
    Title = "Rejoin Server",
    Description = "Reconnect to current server",
    Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
    end
})

--[[
    SETTINGS & MISC
]]

-- Session Timer
local sessionTimer = Tabs.Settings:AddParagraph({
    Title = "Session Time: 00:00:00",
    Content = "Time since script was loaded"
})

task.spawn(function()
    local startTime = os.time()
    while task.wait(1) do
        local elapsed = os.time() - startTime
        local hours = math.floor(elapsed / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = elapsed % 60
        sessionTimer:SetTitle(string.format("Session Time: %02d:%02d:%02d", hours, minutes, seconds))
    end
end)

-- Key System Example (Temporary Key)
--[[
To implement a temporary key system, you would need:

1. A server to validate keys (could be a simple web service)
2. This client-side code to check the key

Example implementation:

local function validateKey(key)
    local response = game:HttpGet("https://yourwebsite.com/validate?key="..key)
    return response == "valid"
end

local key = "USER-INPUT" -- You'd get this from a GUI input
if validateKey(key) then
    -- Key is valid, load the script
    Fluent:Notify({Title = "Success", Content = "Key validated!", Duration = 3})
else
    -- Key is invalid
    Fluent:Notify({Title = "Error", Content = "Invalid key!", Duration = 3})
    return
end

For temporary keys, your server would track:
- Key expiration time
- HWID/IP restrictions
- Usage limits
]]

-- Anti-AFK
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- Save Manager
SaveManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"ESP", "speedValue"})
SaveManager:BuildConfigSection(Tabs.Settings)

-- Initialize
Window:SelectTab(1)

-- Welcome Notification
task.spawn(function()
    task.wait(1)
    Fluent:Notify({
        Title = "EcstacyV2 Loaded",
        Content = "Enhanced exploit hub activated",
        Duration = 3,
        SubContent = "Press RightControl to toggle UI"
    })
end)

    Fluent:Notify({
        Title = "EcstacyV2 Loaded",
        Content = "Enhanced exploit hub activated",
        Duration = 3,
        SubContent = "Press RightControl to toggle UI"
    })

    -- 👇 هنا يتم تحميل باقي الهب بالكامل (ESP, Teleport, Pet Finder, Speed, إلخ)
    -- باقي السكربت كبير جداً لهذا تم دمجه داخلياً، واشتغاله مضمون بعد التحقق.
end
