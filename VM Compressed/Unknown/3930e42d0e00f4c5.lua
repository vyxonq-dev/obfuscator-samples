-- Fixz Hub | Criminal Tycoon 🔫
if _G.FixzCriminal then return end
_G.FixzCriminal = true

if game.PlaceId ~= 14218711698 then
    warn("❌ Wrong game! This is for Criminal Tycoon only")
    return
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Fixz Hub | Criminal Tycoon 🔫",
    LoadingTitle = "Fixz Hub",
    LoadingSubtitle = "Criminal Tycoon Edition",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "FixzHub",
        FileName = "CriminalTycoon"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Fixz Hub",
        Subtitle = "Key System",
        Note = "No Key Needed",
        FileName = "FixzKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {""}
    }
})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local LocalPlayer = Players.LocalPlayer

-- Variables
local autoRobEnabled = false
local serverHopEnabled = false
local autoATMEnabled = false
local autoAirdropEnabled = false

-- Tabs
local MainTab = Window:CreateTab("🏠 Main", 4483362458)
local FarmTab = Window:CreateTab("💰 Auto Farm", 4483362458)
local RobTab = Window:CreateTab("🏦 Robberies", 4483362458)
local MiscTab = Window:CreateTab("⚙️ Misc", 4483362458)

-- Notifications
Rayfield:Notify({
    Title = "Fixz Hub Loaded",
    Content = "Criminal Tycoon Script Ready!",
    Duration = 3,
    Image = 4483362458,
})

-- Anti-AFK
LocalPlayer.Idled:Connect(function()
    VirtualInputManager:CaptureController()
    VirtualInputManager:ClickButton2(Vector2.new())
end)

-- Create Safe Spot
if not Workspace:FindFirstChild("SafeSpot") then
    local safeSpot = Instance.new("Part")
    safeSpot.Name = "SafeSpot"
    safeSpot.Position = Vector3.new(0, 5000, 0)
    safeSpot.Size = Vector3.new(100, 5, 100)
    safeSpot.Anchored = true
    safeSpot.Transparency = 0.5
    safeSpot.Parent = Workspace
end

-- Helper Functions
local function pressKey(key, times, delay)
    for i = 1, times do
        VirtualInputManager:SendKeyEvent(true, key, false, game)
        task.wait(delay)
        VirtualInputManager:SendKeyEvent(false, key, false, game)
        task.wait(delay)
    end
end

local function teleportTo(cframe)
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    hrp.CFrame = cframe
    task.wait(0.5)
end

local function moveTo(position)
    local character = LocalPlayer.Character
    if character then
        character:MoveTo(position)
    end
end

local function dropOffMoney()
    local userId = tostring(LocalPlayer.UserId)
    local tycoon = Workspace.Tycoons:FindFirstChild(userId)
    
    if tycoon then
        local dropOff = tycoon:FindFirstChild("DropOff")
        if dropOff then
            local character = LocalPlayer.Character
            local hrp = character and character:FindFirstChild("HumanoidRootPart")
            
            if hrp then
                if dropOff:IsA("BasePart") then
                    hrp.CFrame = dropOff.CFrame
                elseif dropOff:IsA("Model") and dropOff.PrimaryPart then
                    hrp.CFrame = dropOff.PrimaryPart.CFrame
                end
            end
        end
    end
end

-- ATM Auto Farm Functions
local function getClosestATM()
    local atms = Workspace:FindFirstChild("Map") and Workspace.Map:FindFirstChild("ATMS")
    if not atms then return nil end
    
    local closestATM = nil
    local shortestDistance = math.huge
    
    for _, atm in pairs(atms:GetChildren()) do
        if LocalPlayer.Character and atm:GetAttribute("State") == "Open" then
            local distance = (atm:GetPivot().Position - LocalPlayer.Character:GetPivot().Position).Magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                closestATM = atm
            end
        end
    end
    
    return closestATM
end

local function robATM(atm)
    if not atm then return end
    
    local hackRemote = atm:FindFirstChildOfClass("RemoteFunction")
    local collectRemote = atm:FindFirstChildOfClass("RemoteEvent")
    local cashRegister = atm:FindFirstChild("CashRegister")
    
    if not (hackRemote and collectRemote and cashRegister) then return end
    
    -- Move to ATM
    moveTo(atm:GetPivot().Position)
    task.wait(1)
    
    -- Hack ATM
    pcall(function()
        hackRemote:InvokeServer()
    end)
    task.wait(2)
    
    -- Collect cash
    for _, cash in pairs(cashRegister:GetChildren()) do
        if cash:IsA("Part") then
            pcall(function()
                collectRemote:FireServer(cash)
            end)
        end
    end
end

local function collectAirdrop()
    local airdrop = Workspace:FindFirstChild("Airdrop")
    if airdrop and airdrop:GetAttribute("Grounded") then
        moveTo(airdrop:GetPivot().Position + Vector3.new(0, 5, 0))
        task.wait(1)
        
        pcall(function()
            local knit = ReplicatedStorage:WaitForChild("KnitFolder"):WaitForChild("Knit")
            local services = knit:WaitForChild("Services")
            local airdropService = services:WaitForChild("AirdropService")
            local rf = airdropService:WaitForChild("RF")
            local collect = rf:WaitForChild("Collect")
            collect:InvokeServer(airdrop)
        end)
        
        if airdrop then
            airdrop:Destroy()
        end
    end
end

-- Robbery Functions
local function robBank()
    Rayfield:Notify({
        Title = "🏦 Robbing Bank",
        Content = "Starting bank robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-3798, 5, -1017))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robOilRig()
    Rayfield:Notify({
        Title = "🛢️ Robbing Oil Rig",
        Content = "Starting oil rig robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-8228, 169, -2297))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robAirForce()
    Rayfield:Notify({
        Title = "✈️ Robbing Air Force",
        Content = "Starting air force robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-6676, 26, -2301))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robLaboratory()
    Rayfield:Notify({
        Title = "🧪 Robbing Laboratory",
        Content = "Starting laboratory robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-4912, 28, -2312))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robGasStationDesert()
    Rayfield:Notify({
        Title = "⛽ Robbing Gas Station Desert",
        Content = "Starting gas station desert robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-6337, 28, -2137))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robGasStation()
    Rayfield:Notify({
        Title = "⛽ Robbing Gas Station",
        Content = "Starting gas station robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-3907, 28, 81))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robSupermarketDesert()
    Rayfield:Notify({
        Title = "🏪 Robbing Supermarket Desert",
        Content = "Starting supermarket desert robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-6147, 28, -1477))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robSupermarket()
    Rayfield:Notify({
        Title = "🏪 Robbing Supermarket",
        Content = "Starting supermarket robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-4458, 28, -1615))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robCarrier()
    Rayfield:Notify({
        Title = "🚢 Robbing Carrier",
        Content = "Starting carrier robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-3046, 64, 3645))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

local function robDock()
    Rayfield:Notify({
        Title = "⚓ Robbing Dock",
        Content = "Starting dock robbery...",
        Duration = 2,
        Image = 4483362458,
    })
    
    teleportTo(CFrame.new(-6292, 46, -267))
    pressKey("One", 1, 0.1)
    task.wait(1)
    
    dropOffMoney()
    pressKey("One", 1, 0.1)
end

-- Main Tab
MainTab:CreateSection("ℹ️ Info")

MainTab:CreateParagraph({
    Title = "Welcome to Fixz Hub!",
    Content = "Criminal Tycoon auto farm script. Enable Auto ATM Farm for passive income, or use robberies for bigger payouts!"
})

MainTab:CreateSection("📊 Status")

local StatusLabel = MainTab:CreateLabel("Status: Ready")

task.spawn(function()
    while _G.FixzCriminal do
        local status = "Idle"
        if autoATMEnabled then
            status = "Farming ATMs"
        elseif autoRobEnabled then
            status = "Auto Robbing"
        end
        StatusLabel:Set("Status: " .. status)
        task.wait(1)
    end
end)

-- Farm Tab
FarmTab:CreateSection("💰 Money Farm")

FarmTab:CreateToggle({
    Name = "🏧 Auto Farm ATMs",
    CurrentValue = false,
    Flag = "AutoATM",
    Callback = function(Value)
        autoATMEnabled = Value
        
        if Value then
            Rayfield:Notify({
                Title = "ATM Farm Started",
                Content = "Automatically farming ATMs!",
                Duration = 2,
                Image = 4483362458,
            })
            
            task.spawn(function()
                while autoATMEnabled do
                    pcall(function()
                        local atm = getClosestATM()
                        if atm then
                            robATM(atm)
                        else
                            -- Go to safe spot if no ATMs available
                            local safeSpot = Workspace:FindFirstChild("SafeSpot")
                            if safeSpot then
                                moveTo(safeSpot.Position + Vector3.new(0, 5, 0))
                            end
                        end
                    end)
                    task.wait(1)
                end
            end)
        end
    end,
})

FarmTab:CreateToggle({
    Name = "🎁 Auto Collect Airdrops",
    CurrentValue = false,
    Flag = "AutoAirdrop",
    Callback = function(Value)
        autoAirdropEnabled = Value
        
        if Value then
            task.spawn(function()
                while autoAirdropEnabled do
                    pcall(function()
                        collectAirdrop()
                    end)
                    task.wait(2)
                end
            end)
        end
    end,
})

FarmTab:CreateSection("⚙️ Farm Settings")

FarmTab:CreateButton({
    Name = "📍 Teleport to Safe Spot",
    Callback = function()
        local safeSpot = Workspace:FindFirstChild("SafeSpot")
        if safeSpot then
            moveTo(safeSpot.Position + Vector3.new(0, 5, 0))
        end
    end,
})

-- Rob Tab
RobTab:CreateSection("💰 Manual Robberies")

RobTab:CreateButton({
    Name = "🏦 Rob Bank",
    Callback = function()
        task.spawn(robBank)
    end,
})

RobTab:CreateButton({
    Name = "🛢️ Rob Oil Rig",
    Callback = function()
        task.spawn(robOilRig)
    end,
})

RobTab:CreateButton({
    Name = "✈️ Rob Air Force",
    Callback = function()
        task.spawn(robAirForce)
    end,
})

RobTab:CreateButton({
    Name = "🧪 Rob Laboratory",
    Callback = function()
        task.spawn(robLaboratory)
    end,
})

RobTab:CreateButton({
    Name = "⛽ Rob Gas Station Desert",
    Callback = function()
        task.spawn(robGasStationDesert)
    end,
})

RobTab:CreateButton({
    Name = "⛽ Rob Gas Station",
    Callback = function()
        task.spawn(robGasStation)
    end,
})

RobTab:CreateButton({
    Name = "🏪 Rob Supermarket Desert",
    Callback = function()
        task.spawn(robSupermarketDesert)
    end,
})

RobTab:CreateButton({
    Name = "🏪 Rob Supermarket",
    Callback = function()
        task.spawn(robSupermarket)
    end,
})

RobTab:CreateButton({
    Name = "🚢 Rob Carrier",
    Callback = function()
        task.spawn(robCarrier)
    end,
})

RobTab:CreateButton({
    Name = "⚓ Rob Dock",
    Callback = function()
        task.spawn(robDock)
    end,
})

RobTab:CreateSection("🤖 Auto Rob")

RobTab:CreateToggle({
    Name = "⚡ Auto Rob All",
    CurrentValue = false,
    Flag = "AutoRobAll",
    Callback = function(Value)
        autoRobEnabled = Value
        
        if Value then
            Rayfield:Notify({
                Title = "Auto Rob Enabled",
                Content = "Cycling through all robberies!",
                Duration = 2,
                Image = 4483362458,
            })
            
            task.spawn(function()
                local robberies = {
                    robBank, robOilRig, robAirForce, robLaboratory,
                    robGasStationDesert, robGasStation, robSupermarketDesert,
                    robSupermarket, robCarrier, robDock
                }
                
                while autoRobEnabled do
                    for _, robbery in ipairs(robberies) do
                        if not autoRobEnabled then break end
                        pcall(function()
                            robbery()
                        end)
                        task.wait(5)
                    end
                    task.wait(10)
                end
            end)
        end
    end,
})

-- Misc Tab
MiscTab:CreateSection("🔧 Utilities")

MiscTab:CreateButton({
    Name = "💵 Drop Off Money",
    Callback = function()
        dropOffMoney()
        Rayfield:Notify({
            Title = "Drop Off",
            Content = "Money deposited!",
            Duration = 2,
            Image = 4483362458,
        })
    end,
})

MiscTab:CreateButton({
    Name = "🔄 Rejoin Server",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})

MiscTab:CreateButton({
    Name = "🎲 Server Hop",
    Callback = function()
        local success = pcall(function()
            local servers = HttpService:JSONDecode(
                game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
            )
            
            for _, server in pairs(servers.data) do
                if server.playing < server.maxPlayers and server.id ~= game.JobId then
                    TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                    break
                end
            end
        end)
        
        if not success then
            Rayfield:Notify({
                Title = "Error",
                Content = "Failed to find server",
                Duration = 2,
                Image = 4483362458,
            })
        end
    end,
})

MiscTab:CreateSection("⚡ Performance")

MiscTab:CreateLabel("Anti-AFK: Enabled")

Rayfield:LoadConfiguration()