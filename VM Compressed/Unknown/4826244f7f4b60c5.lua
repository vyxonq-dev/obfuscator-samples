-- Load Rayfield

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({

    Name = "Spin Mythic Hub",

    LoadingTitle = "Loading Spin Hub...",

    LoadingSubtitle = "by eyrydyeyeegee",

    ConfigurationSaving = {Enabled = false}

})

-- ========== TAB RACE SPIN ==========

local MainTab = Window:CreateTab("Spin", 4483362458)

local function isMythic()

    local raceVal = game.Players.LocalPlayer:FindFirstChild("Data") and game.Players.LocalPlayer.Data:FindFirstChild("Race")

    return raceVal and raceVal.Value == "Mythic"

end

getgenv().AutoSpin = false

local autoSpinThread

MainTab:CreateToggle({

    Name = "Auto Spin until Mythic",

    CurrentValue = false,

    Callback = function(state)

        getgenv().AutoSpin = state

        if state then

            autoSpinThread = task.spawn(function()

                while getgenv().AutoSpin do

                    if isMythic() then

                        Rayfield:Notify({Title="Spin",Content="Stopped: Mythic race obtained!",Duration=3})

                        getgenv().AutoSpin = false

                        break

                    end

                    game:GetService("ReplicatedStorage"):WaitForChild("RaceSpin"):FireServer()

                    Rayfield:Notify({Title="Spin",Content="Spin performed!",Duration=1})

                    task.wait(0.2)

                end

            end)

        else

            Rayfield:Notify({Title="Auto Spin",Content="Auto Spin disabled.",Duration=2})

        end

    end

})

MainTab:CreateButton({

    Name = "Spin Once",

    Callback = function()

        game:GetService("ReplicatedStorage"):WaitForChild("RaceSpin"):FireServer()

        Rayfield:Notify({Title="Spin",Content="Spin performed!",Duration=2})

    end

})

MainTab:CreateParagraph({

    Title = "About",

    Content = "Auto Spin for Race, automatically stops when Mythic is obtained."

})

-- ========== TAB SPIN PERK ==========

local PerkTab = Window:CreateTab("Spin Perk", 4483362460)

PerkTab:CreateButton({

    Name = "Spin Perk Once",

    Callback = function()

        game:GetService("ReplicatedStorage"):WaitForChild("PerkSpin"):FireServer()

        Rayfield:Notify({Title="Perk Spin",Content="Perk Spin performed!",Duration=2})

    end

})

getgenv().AutoPerkSpin = false

local autoPerkSpinThread

PerkTab:CreateToggle({

    Name = "Auto Spin Perk",

    CurrentValue = false,

    Callback = function(state)

        getgenv().AutoPerkSpin = state

        if state then

            autoPerkSpinThread = task.spawn(function()

                while getgenv().AutoPerkSpin do

                    game:GetService("ReplicatedStorage"):WaitForChild("PerkSpin"):FireServer()

                    Rayfield:Notify({Title="Perk Spin",Content="Perk Spin performed!",Duration=1})

                    task.wait(0.2)

                end

            end)

        else

            Rayfield:Notify({Title="Auto Perk Spin",Content="Auto Perk Spin disabled.",Duration=2})

        end

    end

})

PerkTab:CreateParagraph({

    Title = "About Perk",

    Content = "Functions to spin Perk manually or automatically."

})

-- ========== TAB BUY SPINS ==========

local BuyTab = Window:CreateTab("Buy Spins", 4483362461)

BuyTab:CreateButton({

    Name = "Buy 1 Race Spin (with Gems)",

    Callback = function()

        local args = {

            [1] = "BuySpinsForGems",

            [2] = "Race"

        }

        game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

        Rayfield:Notify({Title="Buy Spin",Content="1 Race Spin bought with Gems!",Duration=2})

    end

})

getgenv().AutoBuyRaceSpin = false

local autoBuyRaceSpinThread

BuyTab:CreateToggle({

    Name = "Auto Buy Race Spins",

    CurrentValue = false,

    Callback = function(state)

        getgenv().AutoBuyRaceSpin = state

        if state then

            autoBuyRaceSpinThread = task.spawn(function()

                while getgenv().AutoBuyRaceSpin do

                    local args = {

                        [1] = "BuySpinsForGems",

                        [2] = "Race"

                    }

                    game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

                    Rayfield:Notify({Title="Buy Spin",Content="Race Spin bought!",Duration=1})

                    task.wait(0.5)

                end

            end)

        else

            Rayfield:Notify({Title="Auto Buy",Content="Auto buy disabled.",Duration=2})

        end

    end

})

BuyTab:CreateButton({

    Name = "Buy 1 Race Spin (Bypass Cooldown)",

    Callback = function()

        local args = {

            [1] = "BuySpinsForGems",

            [2] = "Race"

        }

        game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

        Rayfield:Notify({Title="Bypass Spin",Content="Race Spin bought (Bypass Cooldown)!",Duration=1.5})

    end

})

getgenv().BypassAutoBuyRaceSpin = false

local bypassAutoBuyRaceSpinThread

BuyTab:CreateToggle({

    Name = "Auto Buy Race Spin (Bypass Cooldown)",

    CurrentValue = false,

    Callback = function(state)

        getgenv().BypassAutoBuyRaceSpin = state

        if state then

            bypassAutoBuyRaceSpinThread = task.spawn(function()

                while getgenv().BypassAutoBuyRaceSpin do

                    local args = {

                        [1] = "BuySpinsForGems",

                        [2] = "Race"

                    }

                    game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

                    Rayfield:Notify({Title="Bypass Spin",Content="Race Spin bought (Bypass Cooldown)!",Duration=0.8})

                    task.wait(0.1)

                end

            end)

        else

            Rayfield:Notify({Title="Bypass Auto Buy",Content="Bypass auto buy disabled.",Duration=2})

        end

    end

})

BuyTab:CreateButton({

    Name = "Buy 1 Perk Spin (with Gems)",

    Callback = function()

        local args = {

            [1] = "BuySpinsForGems",

            [2] = "Perk"

        }

        game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

        Rayfield:Notify({Title="Buy Perk Spin",Content="1 Perk Spin bought with Gems!",Duration=2})

    end

})

getgenv().AutoBuyPerkSpin = false

local autoBuyPerkSpinThread

BuyTab:CreateToggle({

    Name = "Auto Buy Perk Spins",

    CurrentValue = false,

    Callback = function(state)

        getgenv().AutoBuyPerkSpin = state

        if state then

            autoBuyPerkSpinThread = task.spawn(function()

                while getgenv().AutoBuyPerkSpin do

                    local args = {

                        [1] = "BuySpinsForGems",

                        [2] = "Perk"

                    }

                    game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

                    Rayfield:Notify({Title="Buy Perk Spin",Content="Perk Spin bought!",Duration=1})

                    task.wait(0.5)

                end

            end)

        else

            Rayfield:Notify({Title="Auto Buy Perk",Content="Auto buy Perk disabled.",Duration=2})

        end

    end

})

BuyTab:CreateButton({

    Name = "Buy 1 Perk Spin (Bypass Cooldown)",

    Callback = function()

        local args = {

            [1] = "BuySpinsForGems",

            [2] = "Perk"

        }

        game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

        Rayfield:Notify({Title="Bypass Perk Spin",Content="Perk Spin bought (Bypass Cooldown)!",Duration=1.5})

    end

})

getgenv().BypassAutoBuyPerkSpin = false

local bypassAutoBuyPerkSpinThread

BuyTab:CreateToggle({

    Name = "Auto Buy Perk Spin (Bypass Cooldown)",

    CurrentValue = false,

    Callback = function(state)

        getgenv().BypassAutoBuyPerkSpin = state

        if state then

            bypassAutoBuyPerkSpinThread = task.spawn(function()

                while getgenv().BypassAutoBuyPerkSpin do

                    local args = {

                        [1] = "BuySpinsForGems",

                        [2] = "Perk"

                    }

                    game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

                    Rayfield:Notify({Title="Bypass Perk Spin",Content="Perk Spin bought (Bypass Cooldown)!",Duration=0.8})

                    task.wait(0.1)

                end

            end)

        else

            Rayfield:Notify({Title="Bypass Auto Buy Perk",Content="Bypass auto buy Perk disabled.",Duration=2})

        end

    end

})

BuyTab:CreateParagraph({

    Title = "About Buying",

    Content = "Buy race or perk spins with gems, manually, auto or bypassing cooldown!"

})

-- ========== TAB SOULS DEALER ==========

local SoulsTab = Window:CreateTab("Souls Dealer", 4483362470)

SoulsTab:CreateButton({

    Name = "Roll 1x (G$25k 1 Soul)",

    Callback = function()

        local args = {

            [1] = "SoulsDealer",

            [2] = "G$25k 1 Soul"

        }

        game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

        Rayfield:Notify({Title="SoulsDealer",Content="Rolled 1x in SoulsDealer (G$25k 1 Soul)",Duration=2})

    end

})

SoulsTab:CreateButton({

    Name = "Roll 5x (G$125k 5 Souls)",

    Callback = function()

        local args = {

            [1] = "SoulsDealer",

            [2] = "G$125k 5 Souls"

        }

        game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

        Rayfield:Notify({Title="SoulsDealer",Content="Rolled 5x in SoulsDealer (G$125k 5 Souls)",Duration=2})

    end

})

getgenv().AutoSoulsDealer1 = false

local autoSoulsDealer1Thread

SoulsTab:CreateToggle({

    Name = "Auto SoulsDealer 1x (no cooldown)",

    CurrentValue = false,

    Callback = function(state)

        getgenv().AutoSoulsDealer1 = state

        if state then

            autoSoulsDealer1Thread = task.spawn(function()

                while getgenv().AutoSoulsDealer1 do

                    local args = {

                        [1] = "SoulsDealer",

                        [2] = "G$25k 1 Soul"

                    }

                    game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

                    Rayfield:Notify({Title="SoulsDealer",Content="Rolled 1x in SoulsDealer!",Duration=0.8})

                    task.wait(0.1)

                end

            end)

        else

            Rayfield:Notify({Title="Auto SoulsDealer 1x",Content="Auto SoulsDealer 1x disabled.",Duration=2})

        end

    end

})

getgenv().AutoSoulsDealer5 = false

local autoSoulsDealer5Thread

SoulsTab:CreateToggle({

    Name = "Auto SoulsDealer 5x (no cooldown)",

    CurrentValue = false,

    Callback = function(state)

        getgenv().AutoSoulsDealer5 = state

        if state then

            autoSoulsDealer5Thread = task.spawn(function()

                while getgenv().AutoSoulsDealer5 do

                    local args = {

                        [1] = "SoulsDealer",

                        [2] = "G$125k 5 Souls"

                    }

                    game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

                    Rayfield:Notify({Title="SoulsDealer",Content="Rolled 5x in SoulsDealer!",Duration=0.8})

                    task.wait(0.1)

                end

            end)

        else

            Rayfield:Notify({Title="Auto SoulsDealer 5x",Content="Auto SoulsDealer 5x disabled.",Duration=2})

        end

    end

})

SoulsTab:CreateParagraph({

    Title = "About SoulsDealer",

    Content = "Roll in SoulsDealer with G$25k per Soul or G$125k per 5 Souls. Use manual or auto (no cooldown)."

})

-- ========== TAB CONFIGURATION & GOD MODE ==========

local ConfigTab = Window:CreateTab("Configuration", 4483362471)

ConfigTab:CreateButton({

    Name = "Reset Stats",

    Callback = function()

        local args = {

            [1] = "ResetStats"

        }

        game:GetService("ReplicatedStorage").Game.Remotes.ServerHandler:FireServer(unpack(args))

        Rayfield:Notify({Title="Configuration",Content="Stats reset successfully!",Duration=2})

    end

})

-- Advanced God Mode

getgenv().GodMode = false

local godModeConnections = {}

local function enableGodMode()

    local player = game.Players.LocalPlayer

    local function applyGod(char)

        local hum = char:FindFirstChildOfClass("Humanoid")

        local root = char:FindFirstChild("HumanoidRootPart")

        if hum then

            -- Always max health

            godModeConnections["Health"] = hum.HealthChanged:Connect(function()

                if getgenv().GodMode and hum.Health < hum.MaxHealth then

                    hum.Health = hum.MaxHealth

                end

            end)

            -- Remove death states

            for _, state in ipairs({"Dead", "FallingDown", "Ragdoll", "GettingUp", "Seated", "PlatformStanding"}) do

                if hum:GetStateEnabled(Enum.HumanoidStateType[state]) then

                    hum:SetStateEnabled(Enum.HumanoidStateType[state], false)

                end

            end

            -- Prevent Died event

            godModeConnections["Died"] = hum.Died:Connect(function()

                if getgenv().GodMode then

                    hum.Health = hum.MaxHealth

                end

            end)

        end

        -- Protect RootPart

        if root then

            godModeConnections["Root"] = root:GetPropertyChangedSignal("Anchored"):Connect(function()

                if getgenv().GodMode then

                    root.Anchored = false

                end

            end)

            root.Anchored = false

        end

    end

    if player.Character then

        applyGod(player.Character)

    end

    godModeConnections["CharAdded"] = player.CharacterAdded:Connect(function(char)

        wait(0.5)

        applyGod(char)

    end)

end

local function disableGodMode()

    for _, con in pairs(godModeConnections) do

        if typeof(con) == "RBXScriptConnection" then

            con:Disconnect()

        end

    end

    table.clear(godModeConnections)

end

ConfigTab:CreateToggle({

    Name = "God Mode (Advanced)",

    CurrentValue = false,

    Callback = function(state)

        getgenv().GodMode = state

        if state then

            Rayfield:Notify({Title="God Mode",Content="God Mode enabled!",Duration=2})

            enableGodMode()

        else

            Rayfield:Notify({Title="God Mode",Content="God Mode disabled!",Duration=2})

            disableGodMode()

        end

    end

})

ConfigTab:CreateParagraph({

    Title = "Attention",

    Content = "Click 'Reset Stats' to instantly reset your stats. Use God Mode for immortality (instant heal on damage using multiple methods)."

})