local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Every Second +1 KI", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local PlayerTab = Window:MakeTab({
    Name = "Auto",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local PetsTab = Window:MakeTab({
    Name = "Pets",
    Icon = "rbxassetid://4483345998", -- Every Second +1 KI
    PremiumOnly = false
})

local AutoRebirthSection = PlayerTab:AddSection({
    Name = "Auto Rebirth"
})

local WorldSection = PlayerTab:AddSection({
    Name = "World"
})

local PetsSection = PetsTab:AddSection({
    Name = "Pets"
})

local OPStuffTab = Window:MakeTab({
    Name = "OP Stuff",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local OPEggSection = PetsTab:AddSection({
    Name = "OP Egg (Triple Hatch) -SPAM IT-"
})

local isScriptEnabled = false
local isPetEnabled = false
local isAutoRebirthEnabled = false
local isUnlockSkillsEnabled = false
local isUnlockCostumesEnabled = false
local isTripleHatchEnabled = false

local function toggleScript(value)
    isScriptEnabled = value
    if isScriptEnabled then
        print("Auto Win activated")
    else
        print("Auto Win deactivated")
    end
end

local worldsSlider = WorldSection:AddSlider({
    Name = "WORLDS",
    Min = 1,
    Max = 10,
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "World",
    Callback = function(value)
        print(value)
    end
})

local activateToggle = WorldSection:AddToggle({
    Name = "Activate Auto Win",
    Default = false,
    Callback = function(value)
        toggleScript(value)
    end
})

local petToggle = PetsSection:AddToggle({
    Name = "Auto Equip Best Pet",
    Default = false,
    Callback = function(value)
        isPetEnabled = value
        if isPetEnabled then
            print("Pet enabled")
        else
            print("Pet disabled")
        end
    end
})

local autoRebirthToggle = AutoRebirthSection:AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(value)
        isAutoRebirthEnabled = value
        if isAutoRebirthEnabled then
            print("Auto Rebirth enabled")
        else
            print("Auto Rebirth disabled")
        end
    end
})

-- OP Stuff Section
local OPStuffSection = OPStuffTab:AddSection({
    Name = "OP Features"
})

local unlockSkillsButton = OPStuffSection:AddButton({
    Name = "Unlock All Skills",
    Callback = function()
        if not isUnlockSkillsEnabled then
            isUnlockSkillsEnabled = true
            print("Unlock All Skills enabled")
            
            -- Perform the unlock all skills action here
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill001")
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill002")
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill003")
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill004")
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill005")
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill006")
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill007")
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill008")
            game:GetService("ReplicatedStorage").Events.Player.BuyProp:FireServer("skill009")
        end
    end
})

local unlockCostumesButton = OPStuffSection:AddButton({
    Name = "Unlock All Costumes",
    Callback = function()
        if not isUnlockCostumesEnabled then
            isUnlockCostumesEnabled = true
            print("Unlock All Costumes enabled")
            
            -- Perform the unlock all costumes action here
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin001")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin002")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin003")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin004")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin005")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin006")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin007")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin008")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin009")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin010")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin011")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin012")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin013")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin014")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin015")
            game:GetService("ReplicatedStorage").Events.Player.BuySkin:FireServer("skin016")
        end
    end
})

local tripleHatchToggle = OPEggSection:AddToggle({
    Name = "Triple Hatch",
    Default = false,
    Callback = function(value)
        isTripleHatchEnabled = value
        if isTripleHatchEnabled then
            print("Triple Hatch enabled")
            game:GetService("ReplicatedStorage").Events.Player.Draw.DrawRequest:FireServer("draw016", 3)
        else
            print("Triple Hatch disabled")
        end
    end
})

while true do
    if isScriptEnabled then
        local ohInstance1 = workspace:WaitForChild("World"):WaitForChild(tostring(worldsSlider.Value)):WaitForChild("Part")
        local ohBoolean2 = true
        local ohCFrame3 = CFrame.new(-268.74823, 195.323837, 245.797623, 0.139654845, -1.42521249e-13, 0.990200222, -1.13686838e-13, 1, -1.27897692e-13, -0.990200341, 9.47112126e-14, 0.13965483)
        
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Player"):WaitForChild("DmgHandle"):FireServer(ohInstance1, ohBoolean2, ohCFrame3)
    end
    
    if isPetEnabled then
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Pet"):WaitForChild("EquipBest"):FireServer()
    end
    
    if isAutoRebirthEnabled then
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Player"):WaitForChild("RebirthEvent"):FireServer()
    end
    
    wait(0.01)
end
