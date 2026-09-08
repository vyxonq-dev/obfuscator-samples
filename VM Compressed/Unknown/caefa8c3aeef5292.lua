local text = "https://discord.gg/kHfhzFftBk"
getgenv().autotap = false
getgenv().autorebirth = false
getgenv().buyEgg = false
getgenv().DamageCrystal = false
getgenv().teleport = false
getgenv().buyEgg = false

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Clicker Heroes", "Ocean")
local Autofarm = Window:NewTab("Autofarm")
local Section = Autofarm:NewSection("Autofarm")
local Rebirth = Window:NewTab("Rebirths")
local Rebirths = Rebirth:NewSection("Rebirths")
local Eggs = Window:NewTab("Eggs")
local EggOp = Eggs:NewSection("Eggs")
local Teleport = Window:NewTab("Teleport")
local Teleports = Teleport:NewSection("World Teleports (FIX SOON)")
local Misc = Window:NewTab("Misc")
local Miscel = Misc:NewSection("Misc")
local Credit = Window:NewTab("Credits")
local Credits = Credit:NewSection("This Script was made by Akame#1531")
local Crystals = Autofarm:NewSection("Crystal Autofarm")


Credits:NewButton("Click To copy discord link", "Copys Discord link", function()
    setclipboard(text)
end)

local AcWorld
Section:NewDropdown("Select where to Autoclick (Need to unlock first)", "DropdownInf", {"Home", "Winter", "Toy", "Atlantis", "Magma", "Space", "Tech", "Ninja", "Desert"}, function(value)
    AcWorld = value
end)


Section:NewToggle("Fast Autoclicker", "Automaticly clicks for you (Trash ngl)", function(bool)
    getgenv().autotap = bool
    if bool then
        FastAutoclick(AcWorld)
    end
end)

Section:NewToggle("Slow Autoclicker", "Automaticly clicks for you (Trash ngl)", function(bool)
    getgenv().autotap = bool
    if bool then
        Autoclick(AcWorld)
    end
end)

local selectedWorld
Crystals:NewDropdown("Select World for Auto damage Crystals", "DropdownInf", {"Home", "Winter", "Toy", "Atlantis", "Magma", "Space", "Tech", "Ninja", "Desert"}, function(value)
    selectedWorld = value
end)
local selectedCrystal
Crystals:NewDropdown("Select which Crystal to Damage (Needed)", "DropdownInf", {"1", "2", "3", "4"}, function(value)
    selectedCrystal = value
end)

Crystals:NewToggle("Auto damage Crystals", "Gives you Gems automaticly", function(bool)
    getgenv().DamageCrystal = bool
    if bool then
        DamageCrystals(selectedWorld, selectedCrystal)
    end
end)

local selectedEgg
EggOp:NewDropdown("Select Egg", "DropdownInf", {"Starter", "Iceberg", "Snow", "Toy", "Brick", "Atlantis", "Trident", "Eruption", "Obsidian", "Asteroid", "Galaxy", "Cyborg", "Tech"}, function(value)
    selectedEgg = value
end)
EggOp:NewToggle("Open selected Egg", "Opens the Egg you selected", function(bool)
    getgenv().buyEgg = bool
    if bool then
        StarterEgg(selectedEgg)
    end
end)


local SelectedRebirth
Rebirths:NewDropdown("Rebirth Amount", "DropdownInf", {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29"}, function(value)
    SelectedRebirth = value
end)

Rebirths:NewToggle("Autorebirth", "Automaticly rebirths for you (Trash ngl)", function(bool)
    getgenv().autorebirth = bool
    if bool then
        Autorebirth(SelectedRebirth)
    end
end)

Rebirths:NewLabel("Rebirths are in this Order: ")
Rebirths:NewLabel("1, 5, 10, 25, 50, 100, 1k, 5k, 10k, 25k, 50k, 100k, 500k")
Rebirths:NewLabel("1M, 5M, 25M, 100M, 500M, 2,5B, 10B, 25B, 50B, 125B")
Rebirths:NewLabel("250B, 500M, 1T, 2,5T, 5T, 10T and 25T ")

Teleports:NewButton("Teleport to Starter World", "Self explaining", function()
    teleportStart()
end)

Teleports:NewButton("Teleport to Winter World", "Self explaining", function()
    teleportWinter()
end)

Teleports:NewButton("Teleport to Toy World", "Self explaining", function()
    teleportToy()
end)

Teleports:NewButton("Teleport to Atlantis", "Self explaining", function()
    teleportAtlantis()
end)

Teleports:NewButton("Teleport to Magma World", "Self explaining", function()
    teleportMagma()
end)

Teleports:NewButton("Teleport to Space World", "Self explaining", function()
    teleportSpace()
end)

Miscel:NewSlider("Walkspeed", "Changes your Walkspeed", 100, 16, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)


function StarterEgg(EggType)
    spawn(function()
        while wait() do
            if not getgenv().buyEgg then break end
            local args = {
                [1] = "PurchaseEgg",
                [2] = EggType
            }
            game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdatePets:FireServer(unpack(args))
            wait(3)
        end
    end)
end


function Autoclick(AtWorld)
    spawn(function()
        while getgenv().autotap == true do
            local args = {
                [1] = "Tap Capacity",
                [2] = "HandleTapActivation",
                [3] = AtWorld
            }
            game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateGemUpgrades:FireServer(unpack(args))
            wait(0.5)
        end
    end)
end

function FastAutoclick(AtWorld)
    spawn(function()
        while getgenv().autotap == true do
            local args = {
            [1] = "Tap Capacity",
            [2] = "HandleTapActivation",
            [3] = AtWorld
            }
            game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateGemUpgrades:FireServer(unpack(args))
            wait()
        end
    end)
end

function Autorebirth(RebirthAmount)
    spawn(function()
        while getgenv().autorebirth == true do
            local args = {
            [1] = "BuyRebirths",
            [2] = RebirthAmount
            }
            game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateRebirths:FireServer(unpack(args))
            wait(1)
        end
    end)
end
    

function DamageCrystals(World, Crystal)
    spawn(function()
        while getgenv().DamageCrystal == true do
            local args = {
                [1] = "Tap Capacity",
                [2] = "DamageCrystal",
                [3] = World,
                [4] = Crystal
                }
                game:GetService("ReplicatedStorage").Shared.Modules.Utilities.NetworkUtility.Events.UpdateGemUpgrades:FireServer(unpack(args))
            wait()
        end
    end)
end

function teleportStart()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1899.2998046875, 235.52249145507812, 51.70984649658203)
    end)
end

function teleportWinter()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-4330.4541015625, 235.52249145507812, -17.38547134399414)
    end)
end

function teleportToy()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6866.30224609375, 235.52249145507812, -15.26925277709961)
    end)
end

function teleportAtlantis()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9296.0859375, 235.52249145507812, -16.538484573364258)
    end)
end

function teleportMagma()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9296.0859375, 235.52249145507812, -16.538484573364258)
    end)
end   

function teleportSpace()
    spawn(function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-9296.0859375, 235.52249145507812, -16.538484573364258)
    end)
end
