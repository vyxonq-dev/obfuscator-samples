-- Load Rayfield using the official method
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Get the player who executed the script
local localPlayer = game.Players.LocalPlayer

-- Create the main window
local Window = Rayfield:CreateWindow({
    Name = "Jujutsu Culling",
    Icon = 0,
    LoadingTitle = "Jujutsu",
    LoadingSubtitle = "by Kun",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "JujutsuConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Hello"}
    }
})

-- Function to give a technique to yourself
local function giveTechnique(techniqueName)
    local targetPlayer = localPlayer
    
    if targetPlayer then
        local data = targetPlayer:FindFirstChild("Data")
        if data then
            local techniqueInventory = data:FindFirstChild("TechniqueInventory")
            if techniqueInventory then
                techniqueInventory:SetAttribute(techniqueName, true)
                
                Rayfield:Notify({
                    Title = "Technique Added",
                    Content = techniqueName .. " given to " .. targetPlayer.Name .. "!",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                techniqueInventory = Instance.new("Folder")
                techniqueInventory.Name = "TechniqueInventory"
                techniqueInventory.Parent = data
                techniqueInventory:SetAttribute(techniqueName, true)
                
                Rayfield:Notify({
                    Title = "Technique Added",
                    Content = techniqueName .. " given to " .. targetPlayer.Name .. "!",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        else
            data = Instance.new("Folder")
            data.Name = "Data"
            data.Parent = targetPlayer
            
            local techniqueInventory = Instance.new("Folder")
            techniqueInventory.Name = "TechniqueInventory"
            techniqueInventory.Parent = data
            techniqueInventory:SetAttribute(techniqueName, true)
            
            Rayfield:Notify({
                Title = "Technique Added",
                Content = techniqueName .. " given to " .. targetPlayer.Name .. "!",
                Duration = 3,
                Image = 4483362458
            })
        end
    else
        Rayfield:Notify({
            Title = "Error",
            Content = "Could not find local player!",
            Duration = 3,
            Image = 4483362458
        })
    end
end

-- Function to give a fighting style to yourself
local function giveFightingStyle(styleName)
    local targetPlayer = localPlayer
    
    if targetPlayer then
        local data = targetPlayer:FindFirstChild("Data")
        if data then
            local combatInventory = data:FindFirstChild("CombatInventory")
            if combatInventory then
                combatInventory:SetAttribute(styleName, true)
                
                Rayfield:Notify({
                    Title = "Fighting Style Added",
                    Content = styleName .. " given to " .. targetPlayer.Name .. "!",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                combatInventory = Instance.new("Folder")
                combatInventory.Name = "CombatInventory"
                combatInventory.Parent = data
                combatInventory:SetAttribute(styleName, true)
                
                Rayfield:Notify({
                    Title = "Fighting Style Added",
                    Content = styleName .. " given to " .. targetPlayer.Name .. "!",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        else
            data = Instance.new("Folder")
            data.Name = "Data"
            data.Parent = targetPlayer
            
            local combatInventory = Instance.new("Folder")
            combatInventory.Name = "CombatInventory"
            combatInventory.Parent = data
            combatInventory:SetAttribute(styleName, true)
            
            Rayfield:Notify({
                Title = "Fighting Style Added",
                Content = styleName .. " given to " .. targetPlayer.Name .. "!",
                Duration = 3,
                Image = 4483362458
            })
        end
    else
        Rayfield:Notify({
            Title = "Error",
            Content = "Could not find local player!",
            Duration = 3,
            Image = 4483362458
        })
    end
end

-- Function to give a CE color to yourself
local function giveCEColor(colorName)
    local targetPlayer = localPlayer
    
    if targetPlayer then
        local data = targetPlayer:FindFirstChild("Data")
        if data then
            local ceColorInventory = data:FindFirstChild("CEColorInventory")
            if ceColorInventory then
                ceColorInventory:SetAttribute(colorName, true)
                
                Rayfield:Notify({
                    Title = "CE Color Added",
                    Content = colorName .. " given to " .. targetPlayer.Name .. "!",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                ceColorInventory = Instance.new("Folder")
                ceColorInventory.Name = "CEColorInventory"
                ceColorInventory.Parent = data
                ceColorInventory:SetAttribute(colorName, true)
                
                Rayfield:Notify({
                    Title = "CE Color Added",
                    Content = colorName .. " given to " .. targetPlayer.Name .. "!",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        else
            data = Instance.new("Folder")
            data.Name = "Data"
            data.Parent = targetPlayer
            
            local ceColorInventory = Instance.new("Folder")
            ceColorInventory.Name = "CEColorInventory"
            ceColorInventory.Parent = data
            ceColorInventory:SetAttribute(colorName, true)
            
            Rayfield:Notify({
                Title = "CE Color Added",
                Content = colorName .. " given to " .. targetPlayer.Name .. "!",
                Duration = 3,
                Image = 4483362458
            })
        end
    else
        Rayfield:Notify({
            Title = "Error",
            Content = "Could not find local player!",
            Duration = 3,
            Image = 4483362458
        })
    end
end

-- Function to give a domain to yourself
local function giveDomain(domainName)
    local targetPlayer = localPlayer
    
    if targetPlayer then
        local data = targetPlayer:FindFirstChild("Data")
        if data then
            local domainInventory = data:FindFirstChild("DomainInventory")
            if domainInventory then
                domainInventory:SetAttribute(domainName, true)
                
                Rayfield:Notify({
                    Title = "Domain Added",
                    Content = domainName .. " given to " .. targetPlayer.Name .. "!",
                    Duration = 3,
                    Image = 4483362458
                })
            else
                domainInventory = Instance.new("Folder")
                domainInventory.Name = "DomainInventory"
                domainInventory.Parent = data
                domainInventory:SetAttribute(domainName, true)
                
                Rayfield:Notify({
                    Title = "Domain Added",
                    Content = domainName .. " given to " .. targetPlayer.Name .. "!",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        else
            data = Instance.new("Folder")
            data.Name = "Data"
            data.Parent = targetPlayer
            
            local domainInventory = Instance.new("Folder")
            domainInventory.Name = "DomainInventory"
            domainInventory.Parent = data
            domainInventory:SetAttribute(domainName, true)
            
            Rayfield:Notify({
                Title = "Domain Added",
                Content = domainName .. " given to " .. targetPlayer.Name .. "!",
                Duration = 3,
                Image = 4483362458
            })
        end
    else
        Rayfield:Notify({
            Title = "Error",
            Content = "Could not find local player!",
            Duration = 3,
            Image = 4483362458
        })
    end
end

-- Technique Tab
local TechniqueTab = Window:CreateTab("Technique", 4483362458)
local TechniqueSection = TechniqueTab:CreateSection("Technique Inventory")

-- Give Boogie Woogie Button
TechniqueTab:CreateButton({
    Name = "Give Boogie Woogie",
    Callback = function()
        giveTechnique("BoogieWoogie")
    end
})

-- Give Cursed Energy Overload Button
TechniqueTab:CreateButton({
    Name = "Give Cursed Energy Overload",
    Callback = function()
        giveTechnique("CursedEnergyOverload")
    end
})

-- Give Propeller Manifestation Button
TechniqueTab:CreateButton({
    Name = "Give Propeller Manifestation",
    Callback = function()
        giveTechnique("PropellerManifestation")
    end
})

-- Give Copy Button
TechniqueTab:CreateButton({
    Name = "Give Copy",
    Callback = function()
        giveTechnique("Copy")
    end
})

-- Give Limitless Button
TechniqueTab:CreateButton({
    Name = "Give Limitless",
    Callback = function()
        giveTechnique("Limitless")
    end
})

-- Give All Techniques Button
TechniqueTab:CreateButton({
    Name = "Give All Techniques",
    Callback = function()
        giveTechnique("BoogieWoogie")
        giveTechnique("CursedEnergyOverload")
        giveTechnique("PropellerManifestation")
        giveTechnique("Copy")
        giveTechnique("Limitless")
        
        Rayfield:Notify({
            Title = "All Techniques Added",
            Content = "All 5 techniques given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Fighting Style Tab
local FightingStyleTab = Window:CreateTab("Fighting Style", 4483362458)
local FightingStyleSection = FightingStyleTab:CreateSection("Combat Inventory")

-- Give Karate Button
FightingStyleTab:CreateButton({
    Name = "Give Karate",
    Callback = function()
        giveFightingStyle("Karate")
    end
})

-- Give Katana Button
FightingStyleTab:CreateButton({
    Name = "Give Katana",
    Callback = function()
        giveFightingStyle("Katana")
    end
})

-- Give Six Eyes Button
FightingStyleTab:CreateButton({
    Name = "Give Six Eyes",
    Callback = function()
        giveFightingStyle("SixEyes")
    end
})

-- Give All Fighting Styles Button
FightingStyleTab:CreateButton({
    Name = "Give All Fighting Styles",
    Callback = function()
        giveFightingStyle("Karate")
        giveFightingStyle("Katana")
        giveFightingStyle("SixEyes")
        
        Rayfield:Notify({
            Title = "All Fighting Styles Added",
            Content = "Karate, Katana, and SixEyes given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- CE Color Tab
local CEColorTab = Window:CreateTab("CE Color", 4483362458)

-- Grade 4 Colors Section
local Grade4Section = CEColorTab:CreateSection("Grade 4 Cursed Energy Color")

-- Grade 4 Colors
CEColorTab:CreateButton({
    Name = "Blue",
    Callback = function()
        giveCEColor("Blue")
    end
})

CEColorTab:CreateButton({
    Name = "Yellow",
    Callback = function()
        giveCEColor("Yellow")
    end
})

CEColorTab:CreateButton({
    Name = "Dark Blue",
    Callback = function()
        giveCEColor("DarkBlue")
    end
})

CEColorTab:CreateButton({
    Name = "Orange",
    Callback = function()
        giveCEColor("Orange")
    end
})

CEColorTab:CreateButton({
    Name = "Mid Blue",
    Callback = function()
        giveCEColor("MidBlue")
    end
})

CEColorTab:CreateButton({
    Name = "Purple",
    Callback = function()
        giveCEColor("Purple")
    end
})

CEColorTab:CreateButton({
    Name = "White",
    Callback = function()
        giveCEColor("White")
    end
})

CEColorTab:CreateButton({
    Name = "Green",
    Callback = function()
        giveCEColor("Green")
    end
})

CEColorTab:CreateButton({
    Name = "Pink",
    Callback = function()
        giveCEColor("Pink")
    end
})

CEColorTab:CreateButton({
    Name = "Red",
    Callback = function()
        giveCEColor("Red")
    end
})

-- Give All Grade 4 Colors Button
CEColorTab:CreateButton({
    Name = "Give All Grade 4 Colors",
    Callback = function()
        giveCEColor("Blue")
        giveCEColor("Yellow")
        giveCEColor("DarkBlue")
        giveCEColor("Orange")
        giveCEColor("MidBlue")
        giveCEColor("Purple")
        giveCEColor("White")
        giveCEColor("Green")
        giveCEColor("Pink")
        giveCEColor("Red")
        
        Rayfield:Notify({
            Title = "Grade 4 Colors Added",
            Content = "All 10 Grade 4 CE colors given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Grade 2 Colors Section
local Grade2Section = CEColorTab:CreateSection("Grade 2 Cursed Energy Color")

-- Grade 2 Colors
CEColorTab:CreateButton({
    Name = "Hollow",
    Callback = function()
        giveCEColor("Hollow")
    end
})

CEColorTab:CreateButton({
    Name = "Butterfly",
    Callback = function()
        giveCEColor("Butterfly")
    end
})

CEColorTab:CreateButton({
    Name = "Crimson",
    Callback = function()
        giveCEColor("Crimson")
    end
})

CEColorTab:CreateButton({
    Name = "Electric",
    Callback = function()
        giveCEColor("Electric")
    end
})

CEColorTab:CreateButton({
    Name = "Fire",
    Callback = function()
        giveCEColor("Fire")
    end
})

CEColorTab:CreateButton({
    Name = "Love",
    Callback = function()
        giveCEColor("Love")
    end
})

CEColorTab:CreateButton({
    Name = "Old TV",
    Callback = function()
        giveCEColor("OldTV")
    end
})

CEColorTab:CreateButton({
    Name = "Radioactive",
    Callback = function()
        giveCEColor("Radioactive")
    end
})

CEColorTab:CreateButton({
    Name = "Reversal",
    Callback = function()
        giveCEColor("Reversal")
    end
})

-- Give All Grade 2 Colors Button
CEColorTab:CreateButton({
    Name = "Give All Grade 2 Colors",
    Callback = function()
        giveCEColor("Hollow")
        giveCEColor("Butterfly")
        giveCEColor("Crimson")
        giveCEColor("Electric")
        giveCEColor("Fire")
        giveCEColor("Love")
        giveCEColor("OldTV")
        giveCEColor("Radioactive")
        giveCEColor("Reversal")
        
        Rayfield:Notify({
            Title = "Grade 2 Colors Added",
            Content = "All 9 Grade 2 CE colors given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Grade 1 Colors Section
local Grade1Section = CEColorTab:CreateSection("Grade 1 Cursed Energy Color")

-- Grade 1 Colors
CEColorTab:CreateButton({
    Name = "Molten",
    Callback = function()
        giveCEColor("Molten")
    end
})

CEColorTab:CreateButton({
    Name = "Rainbow",
    Callback = function()
        giveCEColor("Rainbow")
    end
})

-- Give All Grade 1 Colors Button
CEColorTab:CreateButton({
    Name = "Give All Grade 1 Colors",
    Callback = function()
        giveCEColor("Molten")
        giveCEColor("Rainbow")
        
        Rayfield:Notify({
            Title = "Grade 1 Colors Added",
            Content = "All 2 Grade 1 CE colors given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Special Grade Colors Section
local SpecialGradeSection = CEColorTab:CreateSection("Special Grade Cursed Energy Color")

-- Special Grade Colors
CEColorTab:CreateButton({
    Name = "Sparks of Black",
    Callback = function()
        giveCEColor("SparksOfBlack")
    end
})

CEColorTab:CreateButton({
    Name = "Jackpot",
    Callback = function()
        giveCEColor("Jackpot")
    end
})

-- Give All Special Grade Colors Button
CEColorTab:CreateButton({
    Name = "Give All Special Grade Colors",
    Callback = function()
        giveCEColor("SparksOfBlack")
        giveCEColor("Jackpot")
        
        Rayfield:Notify({
            Title = "Special Grade Colors Added",
            Content = "All 2 Special Grade CE colors given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Give All CE Colors Button
CEColorTab:CreateButton({
    Name = "Give ALL CE Colors",
    Callback = function()
        -- Grade 4
        giveCEColor("Blue")
        giveCEColor("Yellow")
        giveCEColor("DarkBlue")
        giveCEColor("Orange")
        giveCEColor("MidBlue")
        giveCEColor("Purple")
        giveCEColor("White")
        giveCEColor("Green")
        giveCEColor("Pink")
        giveCEColor("Red")
        -- Grade 2
        giveCEColor("Hollow")
        giveCEColor("Butterfly")
        giveCEColor("Crimson")
        giveCEColor("Electric")
        giveCEColor("Fire")
        giveCEColor("Love")
        giveCEColor("OldTV")
        giveCEColor("Radioactive")
        giveCEColor("Reversal")
        -- Grade 1
        giveCEColor("Molten")
        giveCEColor("Rainbow")
        -- Special Grade
        giveCEColor("SparksOfBlack")
        giveCEColor("Jackpot")
        
        Rayfield:Notify({
            Title = "ALL CE Colors Added",
            Content = "All 23 CE colors given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Domain Tab
local DomainTab = Window:CreateTab("Domain", 4483362458)

-- Grade 2 Domain Section
local Grade2DomainSection = DomainTab:CreateSection("Grade 2 Domain Expansion")

-- Grade 2 Domains
DomainTab:CreateButton({
    Name = "Smallpox Graveyard",
    Callback = function()
        giveDomain("SmallpoxGraveyard")
    end
})

-- Grade 1 Domain Section
local Grade1DomainSection = DomainTab:CreateSection("Grade 1 Domain Expansion")

-- Grade 1 Domains
DomainTab:CreateButton({
    Name = "Authentic Mutual Love",
    Callback = function()
        giveDomain("AuthenticMutualLove")
    end
})

DomainTab:CreateButton({
    Name = "Coffin of the Iron Mountain",
    Callback = function()
        giveDomain("CoffinOfTheIronMountain")
    end
})

-- Give All Grade 1 Domains Button
DomainTab:CreateButton({
    Name = "Give All Grade 1 Domains",
    Callback = function()
        giveDomain("AuthenticMutualLove")
        giveDomain("CoffinOfTheIronMountain")
        
        Rayfield:Notify({
            Title = "Grade 1 Domains Added",
            Content = "Both Grade 1 domains given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Special Grade Domain Section
local SpecialGradeDomainSection = DomainTab:CreateSection("Special Grade Domain Expansion")

-- Special Grade Domains
DomainTab:CreateButton({
    Name = "Infinite Void",
    Callback = function()
        giveDomain("InfiniteVoid")
    end
})

-- Give All Domains Button
DomainTab:CreateButton({
    Name = "Give ALL Domains",
    Callback = function()
        giveDomain("SmallpoxGraveyard")
        giveDomain("AuthenticMutualLove")
        giveDomain("CoffinOfTheIronMountain")
        giveDomain("InfiniteVoid")
        
        Rayfield:Notify({
            Title = "ALL Domains Added",
            Content = "All 4 domains given to " .. localPlayer.Name .. "!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- Debug Toggle to check all inventories
TechniqueTab:CreateToggle({
    Name = "Check All Inventories",
    Default = false,
    Callback = function(Value)
        if Value then
            local targetPlayer = localPlayer
            
            if targetPlayer then
                local data = targetPlayer:FindFirstChild("Data")
                
                if data then
                    -- Check TechniqueInventory
                    local techniqueInventory = data:FindFirstChild("TechniqueInventory")
                    if techniqueInventory then
                        local techAttrs = techniqueInventory:GetAttributes()
                        local techList = {}
                        for name, value in pairs(techAttrs) do
                            table.insert(techList, name)
                        end
                        
                        Rayfield:Notify({
                            Title = "Technique Inventory",
                            Content = "Techniques: " .. table.concat(techList, ", "),
                            Duration = 5,
                            Image = 4483362458
                        })
                    end
                    
                    -- Check CombatInventory
                    local combatInventory = data:FindFirstChild("CombatInventory")
                    if combatInventory then
                        local combatAttrs = combatInventory:GetAttributes()
                        local combatList = {}
                        for name, value in pairs(combatAttrs) do
                            table.insert(combatList, name)
                        end
                        
                        Rayfield:Notify({
                            Title = "Combat Inventory",
                            Content = "Styles: " .. table.concat(combatList, ", "),
                            Duration = 5,
                            Image = 4483362458
                        })
                    end
                    
                    -- Check CEColorInventory
                    local ceColorInventory = data:FindFirstChild("CEColorInventory")
                    if ceColorInventory then
                        local ceAttrs = ceColorInventory:GetAttributes()
                        local ceList = {}
                        for name, value in pairs(ceAttrs) do
                            table.insert(ceList, name)
                        end
                        
                        Rayfield:Notify({
                            Title = "CE Color Inventory",
                            Content = "Colors: " .. table.concat(ceList, ", "),
                            Duration = 5,
                            Image = 4483362458
                        })
                    end
                    
                    -- Check DomainInventory
                    local domainInventory = data:FindFirstChild("DomainInventory")
                    if domainInventory then
                        local domainAttrs = domainInventory:GetAttributes()
                        local domainList = {}
                        for name, value in pairs(domainAttrs) do
                            table.insert(domainList, name)
                        end
                        
                        Rayfield:Notify({
                            Title = "Domain Inventory",
                            Content = "Domains: " .. table.concat(domainList, ", "),
                            Duration = 5,
                            Image = 4483362458
                        })
                    end
                else
                    Rayfield:Notify({
                        Title = "No Data",
                        Content = "Data folder doesn't exist",
                        Duration = 3,
                        Image = 4483362458
                    })
                end
            else
                Rayfield:Notify({
                    Title = "Player Not Found",
                    Content = "Could not find local player!",
                    Duration = 3,
                    Image = 4483362458
                })
            end
        end
    end
}) 
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local AccessoryTab = Window:CreateTab("Accessory", 4483362458)

local function giveAccessories()
    local data = LocalPlayer:FindFirstChild("Data")
    if not data then
        data = Instance.new("Folder")
        data.Name = "Data"
        data.Parent = LocalPlayer
    end

    local inventory = data:FindFirstChild("Inventory")
    if not inventory then
        inventory = Instance.new("Folder")
        inventory.Name = "Inventory"
        inventory.Parent = data
    end

    -- Number Attributes (Amount = 1)
    inventory:SetAttribute("HandWraps", 1)
    inventory:SetAttribute("SorcererJacket", 1)
    inventory:SetAttribute("TintedGlasses", 1)
    inventory:SetAttribute("DarkCloak", 1)
    inventory:SetAttribute("TodoJacket", 1)
    inventory:SetAttribute("YujiVest", 1)
    inventory:SetAttribute("YutaJacket", 1)
    inventory:SetAttribute("JogoCoat", 1)
	inventory:SetAttribute("SupremeClothing", 1)
    Rayfield:Notify({
        Title = "Accessories Added",
        Content = "All accessories have been added!",
        Duration = 3,
        Image = 4483362458
    })
end

AccessoryTab:CreateButton({
    Name = "Give All Accessories",
    Callback = function()
        giveAccessories()
    end
}) 
local CraftingTab = Window:CreateTab("Crafting Fighting Style", 4483362458)

local function giveAxe()
    local data = LocalPlayer:FindFirstChild("Data")
    if not data then
        data = Instance.new("Folder")
        data.Name = "Data"
        data.Parent = LocalPlayer
    end

    local inventory = data:FindFirstChild("Inventory")
    if not inventory then
        inventory = Instance.new("Folder")
        inventory.Name = "Inventory"
        inventory.Parent = data
    end

    -- Creates a Number Attribute named "Axe" with a value of 1
    inventory:SetAttribute("Axe", 1)

    Rayfield:Notify({
        Title = "Crafting Item Added",
        Content = "Axe has been added!",
        Duration = 3,
        Image = 4483362458
    })
end

CraftingTab:CreateButton({
    Name = "Give Axe",
    Callback = function()
        giveAxe()
    end
}) 
local function giveCraftingItems()
    local data = LocalPlayer:FindFirstChild("Data")
    if not data then
        data = Instance.new("Folder")
        data.Name = "Data"
        data.Parent = LocalPlayer
    end

    local inventory = data:FindFirstChild("Inventory")
    if not inventory then
        inventory = Instance.new("Folder")
        inventory.Name = "Inventory"
        inventory.Parent = data
    end

    -- Number Attributes (Amount = 1)
    inventory:SetAttribute("Axe", 1)
    inventory:SetAttribute("PlayfulCloud", 1)

    Rayfield:Notify({
        Title = "Crafting Items Added",
        Content = "Axe and PlayfulCloud have been added!",
        Duration = 3,
        Image = 4483362458
    })
end

CraftingTab:CreateButton({
    Name = "Give Axe & Playful Cloud",
    Callback = function()
        giveCraftingItems()
    end
}) 
-- Unreleased Tab
local UnreleasedTab = Window:CreateTab("Unreleased", 4483362458)

--// Techniques
UnreleasedTab:CreateSection("Technique")

UnreleasedTab:CreateButton({
    Name = "Give Ten Shadows",
    Callback = function()
        giveTechnique("TenShadows")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give Shrine",
    Callback = function()
        giveTechnique("Shrine")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give Deadly Sentencing",
    Callback = function()
        giveTechnique("DeadlySentencing")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give Disaster Flames",
    Callback = function()
        giveTechnique("DisasterFlames")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give Homelander",
    Callback = function()
        giveTechnique("Homelander")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give All Unreleased Techniques",
    Callback = function()
        giveTechnique("TenShadows")
        giveTechnique("Shrine")
        giveTechnique("DeadlySentencing")
        giveTechnique("DisasterFlames")
        giveTechnique("Homelander")

        Rayfield:Notify({
            Title = "Techniques Added",
            Content = "All unreleased techniques added!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

--// Fighting Styles
UnreleasedTab:CreateSection("Fighting Style")

UnreleasedTab:CreateButton({
    Name = "Give Basic",
    Callback = function()
        giveFightingStyle("Basic")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give Gavel",
    Callback = function()
        giveFightingStyle("Gavel")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give Naginata",
    Callback = function()
        giveFightingStyle("Naginata")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give Revolver",
    Callback = function()
        giveFightingStyle("Revolver")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give All Unreleased Fighting Styles",
    Callback = function()
        giveFightingStyle("Basic")
        giveFightingStyle("Gavel")
        giveFightingStyle("Naginata")
        giveFightingStyle("Revolver")

        Rayfield:Notify({
            Title = "Fighting Styles Added",
            Content = "All unreleased fighting styles added!",
            Duration = 3,
            Image = 4483362458
        })
    end
})

--// Domains
UnreleasedTab:CreateSection("Domain")

UnreleasedTab:CreateButton({
    Name = "Give Malevolent Shrine",
    Callback = function()
        giveDomain("MalevolentShrine")
    end
})

UnreleasedTab:CreateButton({
    Name = "Give All Unreleased Domains",
    Callback = function()
        giveDomain("MalevolentShrine")

        Rayfield:Notify({
            Title = "Domain Added",
            Content = "Malevolent Shrine added!",
            Duration = 3,
            Image = 4483362458
        })
    end
})
