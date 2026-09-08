repeat task.wait() until game:IsLoaded()

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

-- Load UI Library
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- =======================
-- UI / CANVAS SETUP
-- =======================

-- Confirm Popup
local Confirmed = false
WindUI:Popup({
    Title = "Xtreme Loaded! - Build A Plane",
    Icon = "star",
    IconThemed = true,
    Content = "XTREME TEAM - Join us at https://discord.gg/U36afWhKQ4",
    Buttons = {
        { Title = "Cancel", Variant = "Secondary", Callback = function() end },
        { Title = "Continue", Icon = "arrow-right", Callback = function() Confirmed = true end, Variant = "Primary" }
    }
})
repeat task.wait() until Confirmed

-- Main Window
local Window = WindUI:CreateWindow({
    Title = "Xtreme - Build A Plane",
    IconThemed = true,
    Icon = "star",
    Author = "Xtreme (https://discord.gg/U36afWhKQ4)",
    Size = UDim2.fromOffset(720, 500),
    Transparent = true,
    Theme = "Dark",
})

-- Open Button for Window
Window:EditOpenButton({
    Title = "Xtreme - Open",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(255, 255, 255)),
    Draggable = true,
})

-- Tabs
local MainTab = Window:Tab({ Title = "Main", Icon = "rocket" })
local ShopTab = Window:Tab({ Title = "Shop", Icon = "shopping-cart" })
local PlayerTab = Window:Tab({ Title = "Plane", Icon = "plane" })
local MiscTab = Window:Tab({ Title = "Misc", Icon = "file-cog" })

-- =======================
-- VARIABLES
-- =======================
local baseSpeed = 50

local boostedSeats = {}
local boostLoopActive = false

local autoStartRunning = false
local autoFarmRunning = false    -- 100k
local autoFarmRunning2 = false   -- infinite money
local autoFarmRunning3 = false   -- 10M

-- Xtreme Variables
local autoFlyRunning = false
local godModeRunning = false

local farmPositions = {
    ["100k"] = CFrame.new(90000, 100, 90000),
    ["infinite"] = CFrame.new(100000, 100, 100000),
    ["10m"] = CFrame.new(700000, 100, 700000),
}

local initialCFrame = nil

-- =======================
-- Xtreme FUNCTIONS
-- =======================

-- Get player's plot
local function getplot()
    local plots = workspace.Islands
    for i, plot in plots:GetChildren() do
        if plot.Important.OwnerID.Value == game.Players.LocalPlayer.UserId then
            return plot
        end
    end
end

-- Check if player is alive
local function alive()
    if game.Players.LocalPlayer.Character then
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                return true
            end
        end 
    end
    return false
end

-- Get character root part
local function char()
    if game.Players.LocalPlayer.Character then
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                return game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
        end 
    end
    return nil
end

-- Check if plane exists and is functional
local function plane()
    local plot = getplot()
    if not plot then return false end
    
    local x = (plot.PlacedBlocks:FindFirstChild("driver_seat_1") or plot.PlacedBlocks:FindFirstChild("driver_seat_2") or plot.PlacedBlocks:FindFirstChild("driver_seat_3") or plot.PlacedBlocks:FindFirstChild("driver_seat_4")) or nil
    if x == nil then 
        return false
    elseif x:FindFirstChild("Hitbox") and x:FindFirstChildOfClass("VehicleSeat") then
        if x:FindFirstChildOfClass("VehicleSeat"):FindFirstChild("BodyGyro") then
            return true
        end
    end
    return false
end

-- =======================
-- ORIGINAL FUNCTIONS
-- =======================

-- Rainbow Color for UI text effect
local function getRainbowColor(t)
    local f = 2
    local r = math.floor(math.sin(f * t + 0) * 127 + 128)
    local g = math.floor(math.sin(f * t + 2) * 127 + 128)
    local b = math.floor(math.sin(f * t + 4) * 127 + 128)
    return Color3.fromRGB(r, g, b)
end

-- Smooth teleport function to move character smoothly
local function smoothTeleport(hrp, targetCFrame, duration)
    if not hrp then return end
    duration = duration or 3
    local startPos = hrp.Position
    local endPos = targetCFrame.Position
    local startTime = os.clock()
    local endTime = startTime + duration

    while os.clock() < endTime do
        local now = os.clock()
        local alpha = math.clamp((now - startTime) / duration, 0, 1)
        local newPos = startPos:Lerp(endPos, alpha)
        hrp.CFrame = CFrame.new(newPos)
        task.wait()
    end
    hrp.CFrame = targetCFrame
end

-- Save initial position of the player for teleport back
local function storeInitialCFrame()
    if initialCFrame then return end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        initialCFrame = hrp.CFrame
        print("[Xtreme] Initial position saved.")
    else
        warn("[Xtreme] Cannot save initial position: HumanoidRootPart not found.")
    end
end

-- Teleport player back to initial saved position
local function teleportBack()
    if not initialCFrame then return end
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.CFrame = initialCFrame
    end
end

-- Utility function to create a farm GUI overlay with rainbow title
local function createFarmGui(name, titleText)
    local gui = Instance.new("ScreenGui", game.CoreGui)
    gui.Name = name
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true

    local black = Instance.new("Frame", gui)
    black.Size = UDim2.new(1, 0, 1, 0)
    black.BackgroundColor3 = Color3.new(0, 0, 0)
    black.BackgroundTransparency = 0.4

    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Name = "mainFrame"
    mainFrame.Size = UDim2.new(0.4, 0, 0.2, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundTransparency = 1

    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(0.8, 0, 0.3, 0)
    title.Position = UDim2.new(0.5, 0, 0.1, 0)
    title.AnchorPoint = Vector2.new(0.5, 0)
    title.BackgroundTransparency = 1
    title.Text = titleText
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextScaled = true
    title.Font = Enum.Font.SourceSansBold

    RunService.RenderStepped:Connect(function()
        title.TextColor3 = getRainbowColor(tick())
    end)

    local bondCount = Instance.new("TextLabel", mainFrame)
    bondCount.Name = name .. "Count"
    bondCount.Size = UDim2.new(0.6, 0, 0.2, 0)
    bondCount.Position = UDim2.new(0.5, 0, 0.6, 0)
    bondCount.AnchorPoint = Vector2.new(0.5, 0)
    bondCount.BackgroundTransparency = 1
    bondCount.Text = "Distance: 0"
    bondCount.TextColor3 = Color3.new(1, 1, 1)
    bondCount.TextScaled = true
    bondCount.Font = Enum.Font.SourceSans

    Instance.new("BlurEffect", game:GetService("Lighting")).Size = 12

    return gui
end

-- =======================
-- PLAYER TAB
-- =======================
PlayerTab:Input({
    Title = "Set Base Speed Boost",
    Placeholder = "Enter base speed (0-2000)",
    Icon = "sliders",
    Callback = function(text)
        local number = tonumber(text)
        if number and number > 0 and number <= 2000 then
            baseSpeed = number
            print("[Xtreme] Base speed set to", baseSpeed)
        else
            warn("[Xtreme] Invalid base speed value. Please enter 1-2000.")
        end
    end
})

PlayerTab:Toggle({
    Title = "Boost Speed",
    Icon = "wind",
    Default = false,
    Callback = function(state)
        boostLoopActive = state
        if state then
            task.spawn(function()
                while boostLoopActive do
                    local char = LocalPlayer.Character
                    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.SeatPart and humanoid.SeatPart:IsA("VehicleSeat") then
                        local seat = humanoid.SeatPart
                        if not boostedSeats[seat] then
                            boostedSeats[seat] = seat.MaxSpeed or baseSpeed
                            seat.MaxSpeed = baseSpeed
                        end
                    end
                    task.wait(5)
                end
            end)
        else
            for seat, speed in pairs(boostedSeats) do
                if seat and seat:IsA("VehicleSeat") then
                    seat.MaxSpeed = speed
                end
            end
            boostedSeats = {}
        end
    end
})

-- =======================
-- MAIN TAB (WITH Xtreme INTEGRATION)
-- =======================

MainTab:Toggle({
    Title = "Auto Start (Just Start)",
    Icon = "badge-dollar-sign",
    Default = false,
    Callback = function(state)
        autoStartRunning = state
        if state then
            task.spawn(function()
                while autoStartRunning do
                    local launch = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Launch")
                    launch:FireServer()
                    task.wait(3)
                end
            end)
        else
            print("[Xtreme] Auto Start stopped.")
        end
    end
})

-- Xtreme Auto Fly Integration
MainTab:Toggle({
    Title = "Auto Fly (Xtreme Default Map)",
    Icon = "plane",
    Default = false,
    Callback = function(state)
        autoFlyRunning = state
        if state then
            task.spawn(function()
                while autoFlyRunning and task.wait(0.1) do
                    local plot = getplot()
                    if not plot then 
                        warn("[Xtreme] Plot not found")
                        continue 
                    end
                    
                    local aplane = plot.PlacedBlocks
                    local driver = (aplane:FindFirstChild("driver_seat_1") or aplane:FindFirstChild("driver_seat_2") or aplane:FindFirstChild("driver_seat_3"))
                    local launched = plot.Important.Launched
                    local spawnpart = plot:FindFirstChild("SpawnPart")
                    
                    if not spawnpart then continue end
                    local spawnpartpos = spawnpart.Position
                    local x, z = spawnpartpos.X, spawnpartpos.Z

                    if not alive() then
                        repeat task.wait(0.1) until alive()
                    end

                    if driver == nil then
                        repeat
                            task.wait(1) 
                        until (aplane:FindFirstChild("driver_seat_1") or aplane:FindFirstChild("driver_seat_2") or aplane:FindFirstChild("driver_seat_3")) ~= nil or not autoFlyRunning
                        driver = (aplane:FindFirstChild("driver_seat_1") or aplane:FindFirstChild("driver_seat_2") or aplane:FindFirstChild("driver_seat_3"))
                    end

                    if not driver:FindFirstChild("Hitbox") then
                        repeat 
                            task.wait(0.05) 
                        until driver:FindFirstChild("Hitbox") or not autoFlyRunning
                    end
                    
                    repeat 
                        if not launched.Value and alive() then
                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Launch"):FireServer()
                        end 
                        task.wait(1)
                    until launched.Value or not autoFlyRunning
                    task.wait(0.35)
                    
                    local abc = true
                    while launched.Value and autoFlyRunning and (plane() and alive()) and abc do
                        if plane() and alive() then
                            local target = driver:FindFirstChild("Hitbox") or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                            target.CFrame = CFrame.new(
                                Vector3.new(
                                    target.Position.X + (17000 / 100), -- Default speedup from Xtreme
                                    160, -- Default Y from Xtreme
                                    z
                                ),
                                Vector3.new(
                                    target.Position.X + ((17000 + 10) / 100),
                                    160,
                                    z
                                )
                            )

                            if (target.Position.X >= 100000) then -- Default end position from CandyHub
                                abc = false
                            end
                        end
                        task.wait(0.001)
                    end
                    
                    task.wait(1)
                    repeat 
                        task.wait(0.1) 
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Return"):FireServer() 
                    until not alive() or not launched.Value
                    task.wait(0.01)
                end
            end)
        else
            print("[Xtreme] Auto Fly (Xtreme) stopped.")
        end
    end
})

-- Xtreme GodMode Integration (Original Code)
MainTab:Toggle({
    Title = "GodMode",
    Icon = "shield",
    Default = false,
    Callback = function(state)
        task.spawn(function()
            godModeRunning = state
            
            while godModeRunning and task.wait(.4) do
                for i, item in getplot():FindFirstChild("PlacedBlocks"):GetDescendants() do
                    if item.ClassName == "Part" or item.ClassName == "MeshPart" and (item.Parent.Name ~= "driver_seat_1" and item.Name ~= "Part") then
                        if item.CanTouch then
                            item.CanTouch = false
                        end
                    end
                end
            end
            for i, item in getplot():FindFirstChild("PlacedBlocks"):GetDescendants() do
                if item.ClassName == "Part" or item.ClassName == "MeshPart" and (item.Parent.Name ~= "driver_seat_1" and item.Name ~= "Part") then
                    item.CanTouch = true
                end
            end
        end)
    end
})

-- Helper function to run auto farm cycles
local function runAutoFarmLoop(autoFlag, farmKey, guiName, guiTitle, teleportDuration)
    task.spawn(function()
        local LaunchRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Launch")
        local ReturnRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("LaunchEvents"):WaitForChild("Return")
        local player = Players.LocalPlayer

        while _G[autoFlag] do
            local character = player.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local hrp = character and character:FindFirstChild("HumanoidRootPart")

            while _G[autoFlag] and (not character or not humanoid or humanoid.Health <= 0 or not hrp) do
                task.wait(0.5)
                character = player.Character
                humanoid = character and character:FindFirstChildOfClass("Humanoid")
                hrp = character and character:FindFirstChild("HumanoidRootPart")
            end

            if not _G[autoFlag] then break end

            LaunchRemote:FireServer()
            task.wait(1.5)

            if hrp then
                smoothTeleport(hrp, farmPositions[farmKey], teleportDuration)
            end

            local farmGui = createFarmGui(guiName, guiTitle)

            task.wait(teleportDuration * 100) -- Adjust timing based on duration

            teleportBack()
            task.wait(2)

            ReturnRemote:FireServer()
            farmGui:Destroy()

            task.wait(4)
        end
    end)
end

MainTab:Toggle({
    Title = "Auto Farm (AFK - Slow)",
    Icon = "badge-dollar-sign",
    Default = false,
    Callback = function(state)
        autoFarmRunning = state
        if state then
            storeInitialCFrame()
            print("[Xtreme] Auto Farm Slow started.")
            runAutoFarmLoop("autoFarmRunning", "100k", "SlowFarm", "Auto-Farm Slow | Xtreme", 10)
        else
            print("[Xtreme] Auto Farm Slow stopped.")
        end
    end
})

MainTab:Toggle({
    Title = "Auto Farm (AFK - Faster)",
    Icon = "badge-dollar-sign",
    Default = false,
    Callback = function(state)
        autoFarmRunning3 = state
        if state then
            storeInitialCFrame()
            print("[Xtreme] Auto Farm Faster started.")
            runAutoFarmLoop("autoFarmRunning3", "10m", "fastFarm", "Auto-Farm Faster | Xtreme", 15)
        else
            print("[Xtreme] Auto Farm Faster stopped.")
        end
    end
})

MainTab:Toggle({
    Title = "Infinite Money (AFK)",
    Icon = "badge-dollar-sign",
    Default = false,
    Callback = function(state)
        autoFarmRunning2 = state
        if state then
            storeInitialCFrame()
            print("[Xtreme] Auto Farm Infinite started.")
            runAutoFarmLoop("autoFarmRunning2", "infinite", "infFarm", "Auto-Farm Infinite | Xtreme", 20)
        else
            print("[Xtreme-Hub] Auto Farm Infinite stopped.")
        end
    end
})

-- =======================
-- SHOP TAB
-- =======================
local ShopList = {
    "All",
    "block_1",
    "seat_1",
    "fuel_1",
    "fuel_2",
    "fuel_3",
    "wing_1",
    "wing_2",
    "propeller_1",
    "propeller_2",
    "missile_1",
    "shield",
    "boost_1",
    "balloon"
}

local selectedShops = {}

ShopTab:Dropdown({
    Title = "Select Shop",
    Multi = true,
    Values = ShopList,
    Callback = function(value)
        selectedShops = value or {}
        print("[DYHUB] Selected Shop:", table.concat(selectedShops, ", "))
    end,
})

ShopTab:Toggle({
    Title = "Buy (Select)",
    Icon = "badge-dollar-sign",
    Callback = function(state)
        local shopRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("ShopEvents"):WaitForChild("BuyBlock")
        if state then
            print("[DYHUB] Buying selected shop items started.")
            task.spawn(function()
                while state do
                    local itemsToBuy = {}

                    if selectedShops and table.find(selectedShops, "All") then
                        for i = 2, #ShopList do
                            table.insert(itemsToBuy, ShopList[i])
                        end
                    else
                        itemsToBuy = selectedShops
                    end

                    for _, itemName in ipairs(itemsToBuy) do
                        if itemName and itemName ~= "All" then
                            shopRemote:FireServer(itemName)
                            task.wait(0.1)
                        end
                    end

                    task.wait(0.5)
                end
            end)
        else
            print("[DYHUB] Buy (Select) toggle disabled.")
        end
    end
})

-- =======================
-- MISC TAB
-- =======================

MiscTab:Toggle({
    Title = "Auto Respawn",
    Icon = "repeat",
    Default = false,
    Callback = function(state)
        if state then
            task.spawn(function()
                while state do
                    local char = LocalPlayer.Character
                    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.Health <= 0 then
                        task.wait(2)
                        LocalPlayer:LoadCharacter()
                    end
                    task.wait(1)
                end
            end)
        else
            print("[Xtreme-Hub] Auto Respawn disabled.")
        end
    end
})

MiscTab:Toggle({
    Title = "Anti-AFK",
    Icon = "activity",
    Default = true,
    Callback = function(state)
        if state then
            task.spawn(function()
                while state do
                    if not LocalPlayer then return end
                    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                    task.wait(60)
                end
            end)
        else
            print("[Xtreme-Hub] Anti-AFK disabled.")
        end
    end
})

MiscTab:Toggle({
    Title = "FPS Boost",
    Icon = "cpu",
    Default = false,
    Callback = function(state)
        if state then
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                elseif v:IsA("Decal") then
                    v.Transparency = 1
                end
            end
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        else
            print("[Xtreme-Hub] FPS Boost disabled.")
        end
    end
})

-- =======================
-- END OF SCRIPT
-- =======================

print("[Xtreme-Hub] Script loaded successfully with Xtreme-Hub integration!")
