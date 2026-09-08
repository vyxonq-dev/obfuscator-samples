local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()


local Window = WindUI:CreateWindow({
    Title = "SynergyHub - Break In 2",
    Author = "Vampy",
    Folder = "BreakIn2",
    Icon = "blocks",
    Size = UDim2.fromOffset(600, 500),  -- Tamaño reducido para que quepa mejor en pantallas móviles
    Theme = "Dark",
    MobileFriendly = true  -- Fuerza el modo táctil completo de WindUI (mejor scrolling, botones más grandes, etc.)
})


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Espera segura a Events
local Events
repeat task.wait(0.1) Events = ReplicatedStorage:FindFirstChild("Events") until Events

-- Variables del personaje
local Character = nil
local Humanoid = nil
local RootPart = nil

local Damange = 5
local ModifiedWalkspeed = 50
local ModifiedJumpPower = 100
local OriginalWalkspeed = 16
local OriginalJumpPower = 50


getgenv().RemoveSlipping = false
getgenv().SemiGodmode = false
getgenv().NoWind = false
getgenv().NoWindSS = false
getgenv().HealLoop = false
getgenv().HealAllLoop = false
getgenv().KillAllLoop = false
getgenv().BreakAllLoop = false
getgenv().BringAllLoop = false
getgenv().CollectAllCash = false
getgenv().AutoPete = false
getgenv().WalkspeedEnabled = false

local function updateCharacter()
    Character = LocalPlayer.Character
    if Character then
        Humanoid = Character:FindFirstChild("Humanoid")
        RootPart = Character:FindFirstChild("HumanoidRootPart")
        if Humanoid then
            OriginalWalkspeed = Humanoid.WalkSpeed or 16
            OriginalJumpPower = Humanoid.JumpPower or 50
        end
    end
end

if LocalPlayer.Character then updateCharacter() end
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(5) -- Aumentado de 3 a 5 segundos para dar más tiempo
    updateCharacter()
end)


local hasHook = pcall(function() hookmetamethod(game, "__namecall", function() end) end)
if hasHook then
    local old_namecall
    old_namecall = hookmetamethod(game, "__namecall", function(self, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
        local method = getnamecallmethod()
        if method == "FireServer" then
            if self.Name == "IceSlip" and getgenv().RemoveSlipping then
                return task.wait(9e9)
            end
            if self.Name == "Energy" and getgenv().SemiGodmode then
                if typeof(a1) == "number" and a1 < 0 then
                    return old_namecall(self, 0, a2, a3, a4, a5, a6, a7, a8, a9, a10)
                end
            end
        end
        return old_namecall(self, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10)
    end)
end


local function safeFire(name, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
    pcall(function()
        local event = Events:FindFirstChild(name)
        if event then
            event:FireServer(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
        end
    end)
end


local function Delete(Instance)
    if Instance then safeFire("OnDoorHit", Instance) end
end


local function GiveItem(item)
    if not item then return end
    if item == "Armor" then
        safeFire("Vending", 3, "Armor2", "Armor", LocalPlayer.Name, 1)
    elseif string.find(item, "Crowbar") or item == "Bat" or item == "Pitchfork" or item == "Hammer" or item == "Wrench" or item == "Broom" then
        safeFire("Vending", 3, item:gsub(" ", ""), "Weapons", LocalPlayer.Name, 1)
    else
        safeFire("GiveTool", item:gsub(" ", ""))
    end
end


local function Train(ability)
    safeFire("RainbowWhatStat", ability)
end

local function HealYourself()
    GiveItem("Pizza")
    task.wait(0.2)
    safeFire("Energy", 25, "Pizza")
end


local function HealAllPlayers()
    safeFire("HealTheNoobs")
end


local function TakeDamange(amount)
    safeFire("Energy", -amount, false, false)
end


local function TeleportTo(cf)
    if RootPart then RootPart.CFrame = cf end
end


local function KillEnemies()
    pcall(function()
        for _, folder in {Workspace.BadGuys, Workspace.BadGuysBoss, Workspace.BadGuysFront} do
            for _, v in pairs(folder:GetChildren()) do
                safeFire("HitBadguy", v, 64.8, 4)
            end
        end
    end)
end


local function BreakEnemies()
    pcall(function()
        for _, folder in {Workspace.BadGuys, Workspace.BadGuysBoss, Workspace.BadGuysFront} do
            for _, v in pairs(folder:GetChildren()) do
                if v:FindFirstChildOfClass("Humanoid") then v:FindFirstChildOfClass("Humanoid").Health = 0 end
            end
        end
    end)
end


local function BringAllEnemies()
    pcall(function()
        for _, folder in {Workspace.BadGuys, Workspace.BadGuysBoss, Workspace.BadGuysFront} do
            for _, v in pairs(folder:GetChildren()) do
                if v:FindFirstChild("HumanoidRootPart") then
                    v.HumanoidRootPart.Anchored = true
                    v.HumanoidRootPart.CFrame = RootPart.CFrame * CFrame.new(0, 0, -4)
                end
            end
        end
    end)
end


local function CollectCash()
    if RootPart then
        for _, v in pairs(Workspace:GetChildren()) do
            if v.Name == "Part" and v:FindFirstChild("TouchInterest") and v.Transparency == 1 then
                firetouchinterest(v, RootPart, 0)
                task.wait()
                firetouchinterest(v, RootPart, 1)
            end
        end
    end
end


local function GetSecretEnding()
    for _, v in {"HatCollected", "MaskCollected", "CrowbarCollected"} do
        safeFire("LarryEndingEvent", v, true)
    end
end


local function GetGAppleBadge()
    if Workspace:FindFirstChild("FallenTrees") then
        for _, v in pairs(Workspace.FallenTrees:GetChildren()) do
            for i = 1, 20 do
                if v:FindFirstChild("TreeHitPart") then
                    safeFire("RoadMissionEvent", 1, v.TreeHitPart, 5)
                end
            end
        end
        task.wait(1)
        TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165))
        task.wait(0.5)
        if Workspace:FindFirstChild("GoldenApple") and Workspace.GoldenApple:FindFirstChild("ClickDetector") then
            fireclickdetector(Workspace.GoldenApple.ClickDetector)
        end
    end
end



game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.K then
        Window:Toggle()
    end
end)

-- ========================
-- TAB PLAYER
-- ========================
local PlayerTab = Window:Tab({ Title = "Player", Icon = "user" })

PlayerTab:Section({ Title = "Movement" })

PlayerTab:Slider({
    Title = "WalkSpeed",
    Value = { Min = 16, Max = 500, Default = 50, Step = 1 },
    Callback = function(v) ModifiedWalkspeed = v end
})

PlayerTab:Toggle({
    Title = "Enable WalkSpeed",
    Value = false,
    Callback = function(enabled)
        getgenv().WalkspeedEnabled = enabled
        if Humanoid then
            if enabled then
                Humanoid.WalkSpeed = ModifiedWalkspeed
            else
                Humanoid.WalkSpeed = OriginalWalkspeed
            end
        end
    end
})

PlayerTab:Slider({
    Title = "JumpPower",
    Value = { Min = 50, Max = 500, Default = 100, Step = 1 },
    Callback = function(v) ModifiedJumpPower = v end
})

PlayerTab:Toggle({
    Title = "Enable JumpPower",
    Value = false,
    Callback = function(v)
        if Humanoid then 
            Humanoid.JumpPower = v and ModifiedJumpPower or OriginalJumpPower 
        end
    end
})


task.spawn(function()
    while task.wait(0.1) do
        if getgenv().WalkspeedEnabled and Humanoid then
            if Humanoid.WalkSpeed ~= ModifiedWalkspeed then
                Humanoid.WalkSpeed = ModifiedWalkspeed
            end
        end
    end
end)


local ItemsTab = Window:Tab({ Title = "Items", Icon = "pointer" })

ItemsTab:Section({ Title = "Weapons" })
ItemsTab:Button({ Title = "Crowbar 1", Callback = function() GiveItem("Crowbar 1") end })
ItemsTab:Button({ Title = "Crowbar 2", Callback = function() GiveItem("Crowbar 2") end })
ItemsTab:Button({ Title = "Bat", Callback = function() GiveItem("Bat") end })
ItemsTab:Button({ Title = "Pitchfork", Callback = function() GiveItem("Pitchfork") end })
ItemsTab:Button({ Title = "Hammer", Callback = function() GiveItem("Hammer") end })
ItemsTab:Button({ Title = "Wrench", Callback = function() GiveItem("Wrench") end })
ItemsTab:Button({ Title = "Broom", Callback = function() GiveItem("Broom") end })
ItemsTab:Button({ Title = "Armor", Callback = function() GiveItem("Armor") end })

ItemsTab:Section({ Title = "Tools & Keys" })
ItemsTab:Button({ Title = "Med Kit", Callback = function() GiveItem("Med Kit") end })
ItemsTab:Button({ Title = "Key", Callback = function() GiveItem("Key") end })
ItemsTab:Button({ Title = "Gold Key", Callback = function() GiveItem("Gold Key") end })
ItemsTab:Button({ Title = "Louise", Callback = function() GiveItem("Louise") end })
ItemsTab:Button({ Title = "Lollipop", Callback = function() GiveItem("Lollipop") end })
ItemsTab:Button({ Title = "Ladder", Callback = function() GiveItem("Ladder") end })
ItemsTab:Button({ Title = "Battery", Callback = function() GiveItem("Battery") end })

ItemsTab:Section({ Title = "Food & Drinks" })
ItemsTab:Button({ Title = "Chips", Callback = function() GiveItem("Chips") end })
ItemsTab:Button({ Title = "Pizza", Callback = function() GiveItem("Pizza") end })
ItemsTab:Button({ Title = "Gold Pizza", Callback = function() GiveItem("Gold Pizza") end })
ItemsTab:Button({ Title = "Rainbow Pizza", Callback = function() GiveItem("Rainbow Pizza") end })
ItemsTab:Button({ Title = "Rainbow Pizza Box", Callback = function() GiveItem("Rainbow Pizza Box") end })
ItemsTab:Button({ Title = "Cookie", Callback = function() GiveItem("Cookie") end })
ItemsTab:Button({ Title = "Apple", Callback = function() GiveItem("Apple") end })
ItemsTab:Button({ Title = "Golden Apple", Callback = function() GiveItem("Golden Apple") end })
ItemsTab:Button({ Title = "Bloxy Cola", Callback = function() GiveItem("Bloxy Cola") end })
ItemsTab:Button({ Title = "Expired Bloxy Cola", Callback = function() GiveItem("Expired Bloxy Cola") end })
ItemsTab:Button({ Title = "Bottle", Callback = function() GiveItem("Bottle") end })

ItemsTab:Section({ Title = "Misc Items" })
ItemsTab:Button({ Title = "Book", Callback = function() GiveItem("Book") end })
ItemsTab:Button({ Title = "Phone", Callback = function() GiveItem("Phone") end })


local OverpoweredTab = Window:Tab({ Title = "Powerful", Icon = "biceps-flexed" })

OverpoweredTab:Section({ Title = "Training" })
OverpoweredTab:Button({ Title = "Train Strength", Callback = function() for i=1,5 do Train("Strength") end end })
OverpoweredTab:Button({ Title = "Train Speed", Callback = function() for i=1,5 do Train("Speed") end end })

OverpoweredTab:Section({ Title = "Healing" })
OverpoweredTab:Button({ Title = "Heal Yourself", Callback = function() for i=1,10 do HealYourself() end end })
OverpoweredTab:Toggle({ 
    Title = "Loop Heal Yourself", 
    Value = false, 
    Callback = function(v) 
        getgenv().HealLoop = v 
        task.spawn(function() 
            while getgenv().HealLoop do 
                HealYourself() 
                task.wait(0.1) 
            end 
        end) 
    end 
})

OverpoweredTab:Button({ Title = "Heal All", Callback = HealAllPlayers })
OverpoweredTab:Toggle({ 
    Title = "Loop Heal All", 
    Value = false, 
    Callback = function(v) 
        getgenv().HealAllLoop = v 
        task.spawn(function() 
            while getgenv().HealAllLoop do 
                HealAllPlayers() 
                task.wait(3) 
            end 
        end) 
    end 
})

OverpoweredTab:Section({ Title = "Protections" })
OverpoweredTab:Toggle({ Title = "Semi-Godmode", Value = false, Callback = function(v) getgenv().SemiGodmode = v end })
OverpoweredTab:Toggle({ Title = "Remove Slipping", Value = false, Callback = function(v) getgenv().RemoveSlipping = v end })

OverpoweredTab:Section({ Title = "Damage" })
OverpoweredTab:Slider({ 
    Title = "Damage Amount", 
    Value = { Min = 0, Max = 200, Default = 5, Step = 1 }, 
    Callback = function(v) Damange = v end 
})
OverpoweredTab:Button({ Title = "Damage Yourself", Callback = function() TakeDamange(Damange) end })

OverpoweredTab:Section({ Title = "Money" })
OverpoweredTab:Button({ Title = "Collect Cash", Callback = CollectCash })
OverpoweredTab:Toggle({ 
    Title = "Auto Collect Cash", 
    Value = false, 
    Callback = function(v) 
        getgenv().CollectAllCash = v 
        task.spawn(function() 
            while getgenv().CollectAllCash do 
                CollectCash() 
                task.wait(1) 
            end 
        end) 
    end 
})

OverpoweredTab:Section({ Title = "Equipment" })
OverpoweredTab:Button({ Title = "Get All Equipment", Callback = function()
    GiveItem("Armor")
    for i=1,5 do 
        Train("Speed") 
        Train("Strength") 
    end
    for i=1,15 do 
        GiveItem("Gold Pizza") 
        task.wait(0.05) 
    end
end })


local TeleportsTab = Window:Tab({ Title = "Teleports", Icon = "map-pin" })

TeleportsTab:Section({ Title = "Locations" })
TeleportsTab:Button({ Title = "Boss Fight", Callback = function() TeleportTo(CFrame.new(-1565.78772, -368.711945, -1040.66626)) end })
TeleportsTab:Button({ Title = "Shop", Callback = function() TeleportTo(CFrame.new(-246.653229, 30.4500484, -847.319275)) end })
TeleportsTab:Button({ Title = "Kitchen", Callback = function() TeleportTo(CFrame.new(-249.753555, 30.4500484, -732.703125)) end })
TeleportsTab:Button({ Title = "Fighting Arena", Callback = function() TeleportTo(CFrame.new(-255.521988, 62.7139359, -723.436035)) end })
TeleportsTab:Button({ Title = "The Gym", Callback = function() TeleportTo(CFrame.new(-256.477448, 63.4500465, -840.825562)) end })
TeleportsTab:Button({ Title = "Golden Apple", Callback = function() TeleportTo(CFrame.new(61.8781624, 29.4499969, -534.381165)) end })
TeleportsTab:Button({ Title = "Uncle Pete", Callback = function() TeleportTo(CFrame.new(-294.208923, 63.4182587, -737.712036)) end })


local CombatTab = Window:Tab({ Title = "Combat", Icon = "crosshair" })

CombatTab:Section({ Title = "Enemies" })
CombatTab:Button({ Title = "Kill All Enemies", Callback = function() for i=1,10 do KillEnemies() end end })
CombatTab:Toggle({ 
    Title = "Loop Kill All", 
    Value = false, 
    Callback = function(v) 
        getgenv().KillAllLoop = v 
        task.spawn(function() 
            while getgenv().KillAllLoop do 
                KillEnemies() 
                task.wait(0.1) 
            end 
        end) 
    end 
})

CombatTab:Button({ Title = "Break All Enemies", Callback = BreakEnemies })
CombatTab:Toggle({ 
    Title = "Loop Break All", 
    Value = false, 
    Callback = function(v) 
        getgenv().BreakAllLoop = v 
        task.spawn(function() 
            while getgenv().BreakAllLoop do 
                BreakEnemies() 
                task.wait(1) 
            end 
        end) 
    end 
})

CombatTab:Button({ Title = "Bring All Enemies", Callback = BringAllEnemies })
CombatTab:Toggle({ 
    Title = "Loop Bring All", 
    Value = false, 
    Callback = function(v) 
        getgenv().BringAllLoop = v 
        task.spawn(function() 
            while getgenv().BringAllLoop do 
                BringAllEnemies() 
                task.wait(0.1) 
            end 
        end) 
    end 
})


local BadgesTab = Window:Tab({ Title = "Badges", Icon = "award" })

BadgesTab:Section({ Title = "Badge Collection" })
BadgesTab:Button({ Title = "Dream Team", Callback = function() 
    GiveItem("Cookie")
    task.wait(1)
    TeleportTo(CFrame.new(-257.56839, 29.4499969, -910.452637))
    task.wait(1)
    safeFire("CatFed", "Cookie")
    
    task.wait(3)
    GiveItem("Louise")
    task.wait(0.5)
    if LocalPlayer.Backpack:FindFirstChild("Louise") then
        LocalPlayer.Backpack.Louise.Parent = Character
    end
    safeFire("LouiseGive", 2)
    
    task.wait(3)
    GiveItem("Key")
    task.wait(0.5)
    if LocalPlayer.Backpack:FindFirstChild("Key") then
        LocalPlayer.Backpack.Key.Parent = Character
    end
    task.wait(0.5)
    safeFire("KeyEvent")
end })

BadgesTab:Button({ Title = "The Golden Apple", Callback = GetGAppleBadge })
BadgesTab:Button({ Title = "Reformed", Callback = GetSecretEnding })

local ServerTab = Window:Tab({ Title = "Server", Icon = "send" })

ServerTab:Button({
    Title = "Discord",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/MUJ8SrZPBe")
            WindUI:Notify({
                Title = "Synergy Hub",
                Content = "Server copied",
                Duration = 4,
                Icon = "check-circle"
            })
        else
            WindUI:Notify({
                Title = "Error",
                Content = "Your executor does not support",
                Duration = 5,
                Icon = "alert-circle"
            })
        end
    end
})


WindUI:Notify({
    Title = "Synergy Hub - Break In 2",
    Content = "GUI EXECUTED!",
    Duration = 6,
    Icon = "check-circle"
})