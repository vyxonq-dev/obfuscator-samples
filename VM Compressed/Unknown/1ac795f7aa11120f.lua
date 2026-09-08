loadstring(game:HttpGet("https://raw.githubusercontent.com/suka11567-coder/FixzHub/refs/heads/main/welcome"))();
local VirtualUser = game:GetService("VirtualUser")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
-- Anti-AFK
game:GetService("Players").LocalPlayer.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)

-- Anti-Staff System
spawn(function()
    warn("Anti Staff is now running")
    while wait(5) do
        for i, v in pairs(game.Players:GetPlayers()) do
            if v:GetRankInGroup(11987919) > 149 then
                game.Players.LocalPlayer:Kick("Auto Kicked Due to Staff Member " .. v.Name .. " is in your game")
            end
        end
    end
end)

-- Helper Functions
local function findCar()
    for i, v in pairs(workspace.Vehicles:GetChildren()) do
        if v:GetAttribute("owner") == game.Players.LocalPlayer.UserId then
            return v
        end
    end
    return nil
end

local function teleportTo(location)
    pcall(function()
        local chr = game.Players.LocalPlayer.Character
        local hum = chr.Humanoid
        if hum.SeatPart == nil then
            chr:PivotTo(CFrame.new(ReplicatedStorage.Places[location].Position) + Vector3.new(0, 30, 0))
        else
            hum.SeatPart.Parent.Parent:PivotTo(ReplicatedStorage.Places[location].CFrame + Vector3.new(0, 40, 0))
        end
    end)
end

-- Load Fluent UI
print("Loading Fluent UI...")
local success, Fluent = pcall(function()
    return loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
end)

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

print("Creating window...")

-- Create Tabs
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Window = Fluent:CreateWindow({
    Title = "Fixz Hub | Taxi Boss",
    SubTitle = "by suka11567",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Event = Window:AddTab({ Title = "⌚ Event Farm", Icon = "watch" }),
    Resources = Window:AddTab({ Title = "💎 Resources", Icon = "gem" }),
    Money = Window:AddTab({ Title = "💰 Money", Icon = "dollar-sign" }),
    Race = Window:AddTab({ Title = "🏁 Race", Icon = "flag" }),
    Teleports = Window:AddTab({ Title = "📍 Teleports", Icon = "map-pin" }),
    Vehicle = Window:AddTab({ Title = "🚕 Vehicle", Icon = "car" }),
    Misc = Window:AddTab({ Title = "⚙️ Misc", Icon = "wrench" }),
    Settings = Window:AddTab({ Title = "🔧 Settings", Icon = "settings" })
}

Tabs.Event:AddParagraph({
    Title = "Farming Features",
    Content = "Automatically functions (Only on event locations)"
})

local function teleportSnowPiles()

local SpawnedSnowPiles = Workspace:WaitForChild("SpawnedSnowPiles")
    if not LocalPlayer or not LocalPlayer.Character then
        return
    end

    local primaryPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:FindFirstChild("Head")

    if not primaryPart then
        warn("Player character does not have a PrimaryPart! Can't teleport snow piles.")
        return
    end

    for i, snowPile in pairs(SpawnedSnowPiles:GetChildren()) do
        if not snowPile:IsA("BasePart") then
            continue
        end
		snowPile.Transparency = 1
        snowPile.CFrame = CFrame.new(primaryPart.Position)
    end
end


local AutoSnow = Tabs.Event:AddToggle("AutoSnow", {
    Title = "Auto Collect Snow Piles",
    Description = "Collect snow piles for reward",
    Default = false
})

AutoSnow:OnChanged(function(state)
    getfenv().teleportSnow = state
    while getfenv().teleportSnow do
        task.wait()
        pcall(teleportSnowPiles)
    end
end)





local AutoPumpkin = Tabs.Event:AddToggle("AutoPumpkin", {
    Title = "Auto Destroy Pumpkins",
    Description = "Automatically destroy pumpkins for candy",
    Default = false
})

AutoPumpkin:OnChanged(function(state)
    getfenv().candy = state
    while getfenv().candy do
        task.wait()
        pcall(function()
            local car = findCar()
            if car then
                for i, v in pairs(workspace.Pumpkins:GetDescendants()) do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(car.PrimaryPart, v.Parent, 0)
                        firetouchinterest(car.PrimaryPart, v.Parent, 0)
                        task.wait(0.2)
                    end
                end
            end
        end)
    end
end)

Tabs.Resources:AddParagraph({
    Title = "Farming Features",
    Content = "Automatically collect all vehicle part and other items"
})

local AutoParts = Tabs.Resources:AddToggle("AutoParts", {
    Title = "Auto Collect Parts",
    Description = "Automatically teleport and collect vehicle parts",
    Default = false
})

AutoParts:OnChanged(function(state)
    getfenv().partcollector = state
    while getfenv().partcollector do
        task.wait()
        for a, b in pairs(workspace.ItemSpawnLocations:GetChildren()) do
            if getfenv().partcollector then
                local timer = tick()
                repeat
                    task.wait()
                    game.Players.LocalPlayer.Character:PivotTo(b.CFrame + Vector3.new(0, 251, 0))
                until tick() - timer >= 2
                for i, v in pairs(workspace.ItemSpawnLocations:GetDescendants()) do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
                    end
                end
            end
        end
    end
end)



-- MONEY TAB
Tabs.Money:AddParagraph({
    Title = "Money Farming",
    Content = "Automatically complete contracts and earn money"
})

local AutoMoney = Tabs.Money:AddToggle("AutoMoney", {
    Title = "Auto Money",
    Description = "Auto complete material contracts",
    Default = false
})

AutoMoney:OnChanged(function(state)
    getfenv().test2 = state
    pcall(function()
        ReplicatedStorage.Quests.Contracts.CancelContract:InvokeServer(game.Players.LocalPlayer.ActiveQuests:FindFirstChildOfClass("StringValue").Name)
    end)
    while getfenv().test2 do
        wait()
        if not game.Players.LocalPlayer.ActiveQuests:FindFirstChild("contractBuildMaterial") then
            ReplicatedStorage.Quests.Contracts.StartContract:InvokeServer("contractBuildMaterial")
            repeat task.wait() until game.Players.LocalPlayer.ActiveQuests:FindFirstChild("contractBuildMaterial")
        end
        repeat
            task.wait()
            task.spawn(function()
                ReplicatedStorage.Quests.DeliveryComplete:InvokeServer("contractMaterial")
                ReplicatedStorage.Quests.DeliveryComplete:InvokeServer("contractMaterial")
                ReplicatedStorage.Quests.DeliveryComplete:InvokeServer("contractMaterial")
            end)
        until game.Players.LocalPlayer.ActiveQuests.contractBuildMaterial.Value == "!pw5pi3ps2"
        wait()
        ReplicatedStorage.Quests.Contracts.CompleteContract:InvokeServer()
    end
end)

Tabs.Money:AddButton({
    Title = "Auto Money [Auto Rejoin]",
    Description = "Auto farm with rejoin on kick",
    Callback = function()
        writefile("taxibossautomoney.txt", game:HttpGet("https://pastebin.com/raw/HuKppzEV"))
        loadstring(game:HttpGet("https://pastebin.com/raw/HuKppzEV"))()
    end
})

local AutoOffice = Tabs.Money:AddToggle("AutoOffice", {
    Title = "Auto Upgrade Office",
    Description = "Automatically upgrade your office to level 16",
    Default = false
})

AutoOffice:OnChanged(function(state)
    getfenv().ofs = state
    while getfenv().ofs do
        wait()
        if not game.Players.LocalPlayer:FindFirstChild("Office") then
            ReplicatedStorage.Company.StartOffice:InvokeServer()
            wait(0.2)
        end
        if game.Players.LocalPlayer.Office:GetAttribute("level") < 16 then
            ReplicatedStorage.Company.SkipOfficeQuest:InvokeServer()
            ReplicatedStorage.Company.UpgradeOffice:InvokeServer()
        end
    end
end)

-- RACE TAB
Tabs.Race:AddParagraph({
    Title = "Racing Features",
    Content = "Auto complete races and earn trophies/medals"
})

local AutoTrophies = Tabs.Race:AddToggle("AutoTrophies", {
    Title = "Auto Trophies",
    Description = "Automatically complete circuit races",
    Default = false
})

AutoTrophies:OnChanged(function(state)
    getfenv().Trophies = state
    ReplicatedStorage.Race.LeaveRace:InvokeServer()
    
    while getfenv().Trophies do
        task.wait()
        pcall(function()
            if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                if game.Players.LocalPlayer.variables.race.Value == "none" then
                    ReplicatedStorage.Race.TimeTrial:InvokeServer("circuit", 5)
                else
                    for a, b in pairs(Workspace.Vehicles:GetDescendants()) do
                        if b.Name == "Player" and b.Value == game.Players.LocalPlayer then
                            for i, v in pairs(Workspace.Races["circuit"].detects:GetChildren()) do
                                if v.ClassName == "Part" and v:FindFirstChild("TouchInterest") then
                                    v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                    firetouchinterest(b.Parent.Parent.PrimaryPart, v, 0)
                                    firetouchinterest(b.Parent.Parent.PrimaryPart, v, 1)
                                end
                            end
                            Workspace.Races["circuit"].timeTrial:FindFirstChildOfClass("IntValue").finish.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                            firetouchinterest(b.Parent.Parent.PrimaryPart, Workspace.Races["circuit"].timeTrial:FindFirstChildOfClass("IntValue").finish, 0)
                            firetouchinterest(b.Parent.Parent.PrimaryPart, Workspace.Races["circuit"].timeTrial:FindFirstChildOfClass("IntValue").finish, 1)
                        end
                    end
                end
            else
                ReplicatedStorage.Vehicles.GetNearestSpot:InvokeServer(game.Players.LocalPlayer.variables.carId.Value)
                wait(0.5)
                ReplicatedStorage.Vehicles.EnterVehicleEvent:InvokeServer()
            end
        end)
    end
end)

local AutoMedals = Tabs.Race:AddToggle("AutoMedals", {
    Title = "Auto TimeTrial Medals",
    Description = "Complete all time trials for medals",
    Default = false
})

AutoMedals:OnChanged(function(state)
    getfenv().medals = state
    ReplicatedStorage.Race.LeaveRace:InvokeServer()
    
    while getfenv().medals do
        task.wait()
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
            for round = 1, 3 do
                for what, races in pairs(Workspace.Races:GetChildren()) do
                    if races.ClassName == "Folder" and getfenv().medals then
                        ReplicatedStorage.Race.TimeTrial:InvokeServer(races.Name, round)
                        wait()
                        -- Race completion logic continues here
                    end
                end
            end
        else
            ReplicatedStorage.Vehicles.GetNearestSpot:InvokeServer(game.Players.LocalPlayer.variables.carId.Value)
            wait(0.5)
            ReplicatedStorage.Vehicles.EnterVehicleEvent:InvokeServer()
        end
    end
end)

-- TELEPORTS TAB
Tabs.Teleports:AddParagraph({
    Title = "Teleport Locations",
    Content = "Teleport to different locations around the map"
})

local locations1 = {
    "none", "Beechwood", "Beechwood Beach", "Boss Airport", "Bridgeview",
    "Cedar Side", "Central Bank", "Central City", "City Park",
    "Coconut Park", "Country Club", "Da Hills", "Doge Harbor"
}

local TeleportDropdown1 = Tabs.Teleports:AddDropdown("TeleportDropdown1", {
    Title = "Teleports 1",
    Values = locations1,
    Multi = false,
    Default = 1,
})

TeleportDropdown1:OnChanged(function(value)
    teleportTo(value)
    Fluent:Notify({
        Title = "Teleported!",
        Content = "Teleported to " .. value,
        Duration = 3
    })
end)

local locations2 = {
    "none", "Ocean Viewpoint", "Oil Refinery", "Old Town", "Popular Street",
    "Small Town", "St. Noll Viewpoint", "Sunny Elementary", "Sunset Grove",
    "Taxi Central", "high school", "mall", "the beach", "🏆 Race Club"
}

local TeleportDropdown2 = Tabs.Teleports:AddDropdown("TeleportDropdown2", {
    Title = "Teleports 2",
    Values = locations2,
    Multi = false,
    Default = 1,
})

TeleportDropdown2:OnChanged(function(value)
    teleportTo(value)
    Fluent:Notify({
        Title = "Teleported!",
        Content = "Teleported to " .. value,
        Duration = 3
    })
end)
--VEHICLE TAB
local steppedConnection
local velocityMult = 1.025
local velocityEnabledKeyCode = Enum.KeyCode.W
Tabs.Vehicle:AddParagraph({
    Title = "Vehicle Features",
    Content = "Special features for your vehicle"
})

Tabs.Vehicle:AddToggle("InfAcceleration", {
    Title = "Inf Acceleration",
    Description = "Inf acceleration boost",
    Default = false
}):OnChanged(function(state)
    if state then

        steppedConnection = game:GetService("RunService").Stepped:Connect(function()
            if game:GetService("UserInputService"):IsKeyDown(velocityEnabledKeyCode) then
                local Character = game:GetService("Players").LocalPlayer.Character
                if Character and typeof(Character) == "Instance" then
                    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
                    if Humanoid and typeof(Humanoid) == "Instance" then
                        local SeatPart = Humanoid.SeatPart
                        if SeatPart and typeof(SeatPart) == "Instance" and SeatPart:IsA("VehicleSeat") then
                            SeatPart.AssemblyLinearVelocity *= Vector3.new(0 + velocityMult, 1, 0 + velocityMult)
                        end
                    end
                end
            end
        end)
    else

        if steppedConnection then
            steppedConnection:Disconnect()
            steppedConnection = nil
        end
    end
end)

local DonutGod = Tabs.Vehicle:AddToggle("DonutGod", {
    Title = "Donut God",
    Description = "Make your car spin like a donut",
    Default = false
})

DonutGod:OnChanged(function(state)
    getfenv().donut = state
    while getfenv().donut do
        task.wait()
        pcall(function()
            local part = game.Players.LocalPlayer.Character.Humanoid.SeatPart
            part.RotVelocity = Vector3.new(0, part.RotVelocity.Y + 10, 0)
        end)
    end
end)

local VehicleInput = Tabs.Vehicle:AddInput("VehicleInput", {
    Title = "Vehicle Name",
    Description = "Enter vehicle name to purchase",
    Default = "",
    Placeholder = "Type vehicle name...",
    Numeric = false,
    Finished = false,
    Callback = function(value)
        for i, v in pairs(require(ReplicatedStorage.ModuleLists.CarList)) do
            if string.find(string.lower(v.name), string.lower(value)) then
                ReplicatedStorage.DataStore.PurchaseVehicle:InvokeServer(v.id)
                Fluent:Notify({
                    Title = "Vehicle Purchased!",
                    Content = "Purchased: " .. v.name,
                    Duration = 3
                })
                break
            end
        end
    end
})

-- MISC TAB
Tabs.Misc:AddParagraph({
    Title = "Miscellaneous Features",
    Content = "Various utility features and tools"
})


Tabs.Misc:AddButton({
    Title = "Unlock VIP Taxi",
    Description = "Unlock VIP taxi feature",
    Callback = function()
        game.Players.LocalPlayer.variables.vip.Value = true
        Fluent:Notify({
            Title = "Unlocked!",
            Content = "Taxi Radar unlocked",
            Duration = 3
        })
    end
})

Tabs.Misc:AddButton({
    Title = "Show Players Stats",
    Description = "Display all player statistics in console",
    Callback = function()
        VirtualInputManager:SendKeyEvent(true, "F9", false, game)
        print("Players Owned Cars")
        for i, v in pairs(game.Players:GetChildren()) do
            if v.ClassName == "Player" then
                print("------------------" .. v.Name .. " OwnedCars------------------")
                local tables = {}
                for a, b in pairs(v.Data.OwnedCars:GetChildren()) do
                    if b:IsA("BoolValue") and b.Value == true then
                        for c, d in pairs(require(ReplicatedStorage.ModuleLists.CarList)) do
                            if d.id == tonumber(b.Name) then
                                table.insert(tables, d.name .. ",")
                            end
                        end
                    end
                end
                warn(unpack(tables))
            end
        end
    end
})

Tabs.Misc:AddButton({
    Title = "Reset Character",
    Description = "Respawn your character",
    Callback = function()
        game.Players.LocalPlayer.Character:BreakJoints()
    end
})

Tabs.Misc:AddButton({
    Title = "Remove AI Vehicles",
    Description = "Remove all AI traffic vehicles",
    Callback = function()
	while true do
	wait(0.)

		Workspace.AICars:ClearAllChildren()

	end
        Fluent:Notify({
            Title = "Removed!",
            Content = "AI Vehicles removed",
            Duration = 3
        })
    end
})

Tabs.Misc:AddButton({
    Title = "Remove Locked Area Barriers",
    Description = "Remove barriers from locked areas",
    Callback = function()
        Workspace.AreaLocked:Destroy()
        Fluent:Notify({
            Title = "Removed!",
            Content = "Area barriers removed",
            Duration = 3
        })
    end
})


-- SETTINGS TAB
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("KoumalaHub")
SaveManager:SetFolder("KoumalaHub/TaxiBoss")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
