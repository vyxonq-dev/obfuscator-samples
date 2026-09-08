if game.PlaceId == 127934563279786 or true then
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
       Name = "Pet Tapping Simulator - v1.0",
       LoadingTitle = "Loading Gui...",
       LoadingSubtitle = "By Khaos",
       ConfigurationSaving = { Enabled = false },
       Discord = {
          Enabled = false,
          Invite = "5mfTQkQXur", 
          RememberJoins = true 
       },
       KeySystem = false
    })

    ---------------------------------------------------------
    -- AUTO FARM TAB
    ---------------------------------------------------------
    local FarmTab = Window:CreateTab("Auto farm", 4483362458) 
    
    local MoneyFarmActive = false 
    FarmTab:CreateToggle({
       Name = "Money Farm",
       CurrentValue = false,
       Flag = "MoneyFarmToggle", 
       Callback = function(Value)
           MoneyFarmActive = Value
           task.spawn(function()
               while MoneyFarmActive do
                   game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Click"):FireServer()
                   task.wait(0.01) 
               end
           end)
       end,
    })

    local SelectedRebirth = 1 
    local AutoRebirthActive = false
    local RebirthTable = {
        ["Rebirth 1"] = 1, ["Rebirth 5"] = 5, ["Rebirth 10"] = 10, 
        ["Rebirth 25"] = 25, ["Rebirth 100"] = 100, ["Rebirth 250"] = 250,
        ["Rebirth 500"] = 500, ["Rebirth 1000"] = 1000, ["Rebirth 2500"] = 2500,
        ["Rebirth 5000"] = 5000, ["Rebirth 10000"] = 10000, ["Rebirth 25000"] = 25000, ["Rebirth 50000"] = 50000, ["Rebirth 100000"] = 100000,
    }

    FarmTab:CreateDropdown({
       Name = "Select Rebirth Amount",
       Options = {"Rebirth 1", "Rebirth 5", "Rebirth 10", "Rebirth 25", "Rebirth 100", "Rebirth 250", "Rebirth 500", "Rebirth 1000", "Rebirth 2500", "Rebirth 5000", "Rebirth 10000", "Rebirth 25000", "Rebirth 50000", "Rebirth 100000"},
       CurrentOption = {"Rebirth 1"},
       MultipleOptions = false,
       Flag = "RebirthDrop", 
       Callback = function(Options)
           SelectedRebirth = RebirthTable[Options[1]]
       end,
    })

    FarmTab:CreateToggle({
       Name = "Auto Rebirth",
       CurrentValue = false,
       Flag = "AutoRebirthToggle",
       Callback = function(Value)
           AutoRebirthActive = Value
           task.spawn(function()
               while AutoRebirthActive do
                   game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer(SelectedRebirth)
                   task.wait(0.5) 
               end
           end)
       end,
    })

    ---------------------------------------------------------
    -- BOOSTS TAB
    ---------------------------------------------------------
    local BoostTab = Window:CreateTab("Boosts", 4483362458)

    -- Warning Label Kept
    BoostTab:CreateLabel("Only Works for Worlds Unlocked", "info")

    local SelectedWorld = "Valentines" 
    local BoostToggleActive = false

    BoostTab:CreateDropdown({
       Name = "Select World",
       Options = {"Valentines", "Dream", "Gummy","Winter", "Jungle", "Spawn"}, 
       CurrentOption = {"Valentines"},
       MultipleOptions = false,
       Flag = "WorldSelect",
       Callback = function(Options)
           SelectedWorld = Options[1]
       end,
    })

    BoostTab:CreateToggle({
       Name = "Multi Boost",
       CurrentValue = false,
       Flag = "MultiBoostToggle",
       Callback = function(Value)
           BoostToggleActive = Value
           task.spawn(function()
               while BoostToggleActive do
                   game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SetWorldBoost"):FireServer(SelectedWorld)
                   task.wait(1) 
               end
           end)
       end,
    })

    ---------------------------------------------------------
    -- NOTIFY
    ---------------------------------------------------------
    Rayfield:Notify({
       Title = "Script Loaded",
       Content = "Farming & World Boosts Ready",
       Duration = 5,
    })

else
    warn("Please join the correct game to use this script.")
end