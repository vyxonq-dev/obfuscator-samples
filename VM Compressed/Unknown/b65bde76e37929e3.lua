local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
 
local Window = Rayfield:CreateWindow({
    Name = "Dandy's World Survival",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by isssacque1234",
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = skibidi, -- Create a custom folder for your hub/game
       FileName = "skibidi script"
    },
 
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Key",
       Subtitle = "Key System",
       Note = "https://discord.gg/pSZvussHBK", -- Use this to tell the user how to get a key
       FileName = "skibidi key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Key_1629", ""} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 }) 
 
 
 local Aimbot = loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V3/main/src/Aimbot.lua"))()
 local chams = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Roblox-Chams-Highlight/refs/heads/main/Highlight.lua"))()
 local targethud = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Lua-TargetHud/refs/heads/main/targethud.lua"))()
 local speed = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Lua-Speed/refs/heads/main/speed.lua"))()
 
 
 
 
 local aimbotTab = Window:CreateTab("Main", "crosshair")
 
 local Section = aimbotTab:CreateSection("Main")
 
 
 
 local Toggle = aimbotTab:CreateToggle({
    Name = "Remove safe zone",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            local m = workspace:FindFirstChild("CurrentMap")
            if m then
                local f = m:FindFirstChild("SpawnsAndOthers")
                if f then
                    f:Destroy()
                end
            end
        end
    end,
})


local Toggle = aimbotTab:CreateToggle({
    Name = "Kill farm (bugged, you can't disable it.)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local teleportActive = Value
        if player and player.Character then
            if teleportActive then
                spawn(function()
                    while teleportActive do
                        wait(0.1)
                        for _, obj in pairs(workspace:GetChildren()) do
                            if obj:IsA("Model") and obj ~= player.Character then
                                local toon = obj:FindFirstChild("Toon")
                                if toon and toon:IsA("BoolValue") then
                                    local hrp = obj:FindFirstChild("HumanoidRootPart")
                                    if hrp then
                                        player.Character:SetPrimaryPartCFrame(hrp.CFrame)
                                    end
                                end
                            end
                        end
                    end
                end)
            else
                teleportActive = false
            end
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "make a random machine (not tested)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local currentMap = workspace:FindFirstChild("CurrentMap")
        if currentMap then
            local generators = currentMap:FindFirstChild("Generators")
            if generators then
                local teleportDone = false
                for _, machine in pairs(generators:GetChildren()) do
                    if machine:IsA("Model") then
                        local machinePart = machine:FindFirstChild("Machine")
                        if machinePart then
                            local machineDone = machinePart:FindFirstChild("MachineDone")
                            if machineDone and machineDone:IsA("BoolValue") then
                                if not machineDone.Value then
                                    local promptPart = machinePart:FindFirstChild("Prompt")
                                    if promptPart and promptPart:IsA("Part") then
                                        local proximityPrompt = promptPart:FindFirstChild("ProximityPrompt")
                                        if proximityPrompt and proximityPrompt.Enabled then
                                            local character = player.Character
                                            if character then
                                                local canTeleport = true
                                                for _, part in pairs(character:GetChildren()) do
                                                    if part:IsA("BasePart") and part.Anchored then
                                                        canTeleport = false
                                                        break
                                                    end
                                                end

                                                if canTeleport then
                                                    character:SetPrimaryPartCFrame(promptPart.CFrame)
                                                    proximityPrompt:InputHoldBegan()
                                                    wait(0.2)
                                                    proximityPrompt:InputEnded()
                                                    teleportDone = true
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Collect Pops",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character.PrimaryPart then return end

        local currentMap = workspace:FindFirstChild("CurrentMap")
        if not currentMap then return end

        local capsules = currentMap:FindFirstChild("Capsules")
        if not capsules then return end

        local pops = {}

        for _, pop in pairs(capsules:GetChildren()) do
            if pop:IsA("Model") and pop.Name == "Pop" then
                local promptPart = pop:FindFirstChild("Prompt")
                if promptPart and promptPart:IsA("Part") then
                    local proximityPrompt = promptPart:FindFirstChild("ProximityPrompt")
                    if proximityPrompt and proximityPrompt.Enabled then
                        table.insert(pops, {part = promptPart, prompt = proximityPrompt})
                    end
                end
            end
        end

        if #pops == 0 then return end

        for _, pop in ipairs(pops) do
            character:SetPrimaryPartCFrame(pop.part.CFrame)
            fireproximityprompt(pop.prompt)
            wait(0.5)
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Collect Chocolates",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character.PrimaryPart then return end

        local currentMap = workspace:FindFirstChild("CurrentMap")
        if not currentMap then return end

        local capsules = currentMap:FindFirstChild("Capsules")
        if not capsules then return end

        local chocolates = {}

        for _, chocolate in pairs(capsules:GetChildren()) do
            if chocolate:IsA("Model") and chocolate.Name == "Chocolate" then
                local promptPart = chocolate:FindFirstChild("Prompt")
                if promptPart and promptPart:IsA("Part") then
                    local proximityPrompt = promptPart:FindFirstChild("ProximityPrompt")
                    if proximityPrompt and proximityPrompt.Enabled then
                        table.insert(chocolates, {part = promptPart, prompt = proximityPrompt})
                    end
                end
            end
        end

        if #chocolates == 0 then return end

        for _, chocolate in ipairs(chocolates) do
            character:SetPrimaryPartCFrame(chocolate.part.CFrame)
            fireproximityprompt(chocolate.prompt)
            wait(0.5)
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Collect All Items",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        if not character or not character.PrimaryPart then return end

        local currentMap = workspace:FindFirstChild("CurrentMap")
        if not currentMap then return end

        local capsules = currentMap:FindFirstChild("Capsules")
        if not capsules then return end

        local items = {}

        for _, item in pairs(capsules:GetChildren()) do
            if item:IsA("Model") and (item.Name == "ResearchCapsule" or item.Name == "HealthKit" or item.Name == "Chocolate" or item.Name == "Pop" or item.Name == "Bandage") then
                local promptPart = item:FindFirstChild("Prompt")
                if promptPart and promptPart:IsA("Part") then
                    local proximityPrompt = promptPart:FindFirstChild("ProximityPrompt")
                    if proximityPrompt and proximityPrompt.Enabled then
                        table.insert(items, {part = promptPart, prompt = proximityPrompt})
                    end
                end
            end
        end

        if #items == 0 then return end

        for _, item in ipairs(items) do
            character:SetPrimaryPartCFrame(item.part.CFrame)
            fireproximityprompt(item.prompt)
            wait(0.5)
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Anti-Void (you will die if you go into the classic void of Roblox)",
    Callback = function()
        local mapsWB = workspace:FindFirstChild("Maps_WB")
        if mapsWB then
            mapsWB:Destroy()
        end
        
        local workspaceStuff = workspace:FindFirstChild("WorkspaceStuff")
        if workspaceStuff then
            workspaceStuff:Destroy()
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Delete invisible walls",
    Callback = function()
        local currentMap = workspace:FindFirstChild("CurrentMap")
        if currentMap then
            local generatedBorders = currentMap:FindFirstChild("GeneratedBorders")
            if generatedBorders then
                generatedBorders:Destroy()
            end

            local freeArea = currentMap:FindFirstChild("FreeArea")
            if freeArea then
                for _, part in pairs(freeArea:GetChildren()) do
                    if part.Name == "InvisibleWall" or part.Name == "InvisBorder" then
                        part:Destroy()
                    end
                end
            end
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "vote in Twisteds mode (I don't know how to say this)",
    Callback = function()
        local args = {
            [1] = 2,
            [2] = 1
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("AddVoteEvent"):FireServer(unpack(args))
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "vote for Classic mode",
    Callback = function()
        local args = {
            [1] = 1,
            [2] = 1
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("AddVoteEvent"):FireServer(unpack(args))
    end,
})


local button = aimbotTab:CreateButton({
    Name = "Spam votes for Classic mode",
    Callback = function()
        for i = 1, 10000000 do
            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("AddVoteEvent"):FireServer(1, 1)
            task.wait(0.01)
        end
    end,
})


local button = aimbotTab:CreateButton({
    Name = "Spam votes for Twisted mode",
    Callback = function()
        for i = 1, 10000000 do
            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("AddVoteEvent"):FireServer(2, 1)
            task.wait(0.01)
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "use bandage even if you don't have one in your inventory",
    Callback = function()
        function getNil(name, class)
            for _, v in next, getnilinstances() do
                if v.ClassName == class and v.Name == name then
                    return v
                end
            end
        end

        local args = {
            [1] = getNil("Bandage", "Tool")
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("ItemRemote"):FireServer(unpack(args))
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Get Bobette twisted for free",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage"):WaitForChild("InfectedMorphs"):WaitForChild("TwistedBobette")
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Get Dandy twisted for free",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage"):WaitForChild("InfectedMorphs"):WaitForChild("DandyMonster")
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Get Glisten twisted for free",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage"):WaitForChild("InfectedMorphs"):WaitForChild("TwistedGlisten")
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Reset Goob's Cooldown",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Goob")
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "activate the Auto Goob Ability (don't spam, because it can kick you)",
    Callback = function()
        local args = {
            [1] = game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Goob")
        }
        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))

        wait(0.25)

        local players = game:GetService("Players"):GetPlayers()
        if #players > 1 then
            local target = players[math.random(1, #players)]
            if target and target.Character then
                local abilityArgs = {
                    [1] = target.Character
                }
                game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("GoobAbility"):FireServer(unpack(abilityArgs))
            end
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Heal All (click only once or you will be kicked from the server)",
    Callback = function()
        local players = game:GetService("Players"):GetPlayers()
        local healedPlayers = {}

        for _, player in ipairs(players) do
            if player ~= game.Players.LocalPlayer and not healedPlayers[player] then
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Sprout")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))

                wait(0.1)

                if player.Character then
                    local healArgs = {
                        [1] = player.Character
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("HealAbility"):FireServer(unpack(healArgs))
                    healedPlayers[player] = true
                end

                wait(0.1)
            end
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Heal All loop (click only once or you will be kicked from the server)",
    Callback = function()
        local players = game:GetService("Players"):GetPlayers()

        while true do
            for _, player in ipairs(players) do
                if player.Character then
                    local args = {
                        [1] = game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Sprout")
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))

                    wait(0.1)

                    local healArgs = {
                        [1] = player.Character
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("HealAbility"):FireServer(unpack(healArgs))

                    wait(0.1)
                end
            end
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Support all (same warning with heal all)",
    Callback = function()
        local players = game:GetService("Players"):GetPlayers()

        for _, player in ipairs(players) do
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                local args = {
                    [1] = game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Shelly")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))

                wait(0.1)

                local healArgs = {
                    [1] = player.Character
                }
                game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("SupportRemote"):FireServer(unpack(healArgs))

                wait(0.1)
            end
        end
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Buy Medkitebble skin for free",
    Callback = function()
        local args = {
            [1] = "Medkitebble",
            [2] = 0
        }
        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("BuySkin"):FireServer(unpack(args))
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Buy DandyMonster twisted for free",
    Callback = function()
        local args = {
            [1] = "DandyMonster",
            [2] = 0
        }
        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("BuySkin"):FireServer(unpack(args))
    end,
})


local Button = aimbotTab:CreateButton({
    Name = "Heal All 2 (same warning with heal all)",
    Callback = function()
        local argsMorph = {
            [1] = game:GetService("ReplicatedStorage"):WaitForChild("SkinsMorphs"):WaitForChild("Medkitebble")
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(argsMorph))

        for _, player in pairs(game.Players:GetPlayers()) do
            if player.Character then
                local argsHeal = {
                    [1] = player.Character:WaitForChild("HumanoidRootPart")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("HealAbility"):FireServer(unpack(argsHeal))
            end
        end
    end,
})


local button = aimbotTab:CreateButton({
    Name = "Spam Pebble's ability 100 times",
    Callback = function()
        for i = 1, 100 do
            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(
                game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Pebble")
            )

            task.wait(0.13)

            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("SpeakAbility"):FireServer()
        end
    end,
})


local button = aimbotTab:CreateButton({
    Name = "Spam Tisha's ability 100 times",
    Callback = function()
        for i = 1, 50 do
            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(
                game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Tisha")
            )
            task.wait(0.1)
            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("SpeakAbility"):FireServer()
            task.wait(0.12)
        end
    end,
})


local button = aimbotTab:CreateButton({
    Name = "Heal all 3?..",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(
            game:GetService("ReplicatedStorage"):WaitForChild("SkinsMorphs"):WaitForChild("Medkitebble")
        )
        task.wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("HealAbility"):FireServer("All")
    end,
})


local Input = aimbotTab:CreateInput({
   Name = "heal that player for 70 times",
   CurrentValue = "",
   PlaceholderText = "Enter the player's nickname",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
       local targetPlayer = nil

       for _, player in pairs(game:GetService("Players"):GetPlayers()) do
           if player.Name:lower() == Text:lower() then
               targetPlayer = player
               break
           end
       end

       if targetPlayer then
           for i = 1, 70 do
               local args = {
                   [1] = game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Sprout")
               }

               game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))
               
               wait(0.75)

               local argsHeal = {
                   [1] = workspace:WaitForChild(targetPlayer.Name)
               }

               game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("HealAbility"):FireServer(unpack(argsHeal))
               
               wait(0.15)
           end
       end
   end,
})


local button = aimbotTab:CreateButton({
    Name = "Kill all Twisteds",
    Callback = function()
        local function morphToShrimpo()
            local args = {
                [1] = game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("StatsShrimpo")
            }

            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))
        end

        morphToShrimpo()

        while true do
            local twistedPlayers = {}

            for _, model in pairs(workspace:GetChildren()) do
                if model:IsA("Model") and model:FindFirstChild("Humanoid") then
                    local twistedBool = model:FindFirstChild("Twisted")
                    
                    if twistedBool and twistedBool.Value then
                        table.insert(twistedPlayers, model)
                    end
                end
            end

            if #twistedPlayers > 0 then
                for _, twistedPlayer in pairs(twistedPlayers) do
                    task.wait(0.11)

                    game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("PunchAbility"):FireServer()

                    task.wait(0.12)

                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(twistedPlayer.HumanoidRootPart.CFrame)

                    task.wait(0.3)

                    morphToShrimpo()
                end
            else
                task.wait(1)
            end
        end
    end,
})


local button = aimbotTab:CreateButton({
    Name = "pull all the toons to you",
    Callback = function()
        local player = game.Players.LocalPlayer
        local lastPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.CFrame

        local function morphToGoob()
            local args = {
                [1] = game:GetService("ReplicatedStorage"):WaitForChild("UninfectedMorphs"):WaitForChild("Goob")
            }
            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("MorphEvent"):FireServer(unpack(args))
        end

        local function isBehindObject(targetPlayer)
            local character = targetPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local humanoidRootPart = character.HumanoidRootPart
                for _, part in pairs(workspace:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        local ray = Ray.new(humanoidRootPart.Position, humanoidRootPart.CFrame.LookVector * 10)
                        local hitPart = workspace:FindPartOnRay(ray, character)
                        if hitPart == part then
                            return true
                        end
                    end
                end
            end
            return false
        end

        local function activateGoobAbility(targetPlayer)
            function getNil(name, class)
                for _, v in next, getnilinstances() do
                    if v.ClassName == class and v.Name == name then
                        return v
                    end
                end
            end

            local args = {
                [1] = getNil(targetPlayer.Name, "Model")
            }

            task.wait(0.10)
            game:GetService("ReplicatedStorage"):WaitForChild("GameRemotes"):WaitForChild("GoobAbility"):FireServer(unpack(args))
        end

        morphToGoob()
        task.wait(0.15)

        if lastPosition then
            player.Character.HumanoidRootPart.CFrame = lastPosition
        end

        while true do
            local foundPlayer = false
            for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                if otherPlayer ~= player and not isBehindObject(otherPlayer) then
                    activateGoobAbility(otherPlayer)
                    foundPlayer = true
                end
            end
            if not foundPlayer then break end
            task.wait(0.12)
        end
    end,
})
 
 
 local visualsTab = Window:CreateTab("Visuals", "crosshair")
 
 local Section = visualsTab:CreateSection("This is visual, meaning it doesn't appear to the entire server, just you.")
 
 
 local Toggle = visualsTab:CreateToggle({
    Name = "ESP players",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        getgenv().chams.enabled = Value
    end,
 })
 

 
 local Slider = visualsTab:CreateSlider({
    Name = "Ichor",
    Range = {0, 10000000},
    Increment = 1,
    Suffix = "Ichor",
    CurrentValue = 0,
    Flag = "Slider1",
    Callback = function(Value)
        local player = game:GetService("Players").LocalPlayer
        local ichor = player:FindFirstChild("Ichor")
        if ichor then
            ichor.Value = Value
        end
    end,
})



local Toggle = visualsTab:CreateToggle({
    Name = "Anti-Staff (click me to check)",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file
    Callback = function(Value)
        if Value then
            local player = game.Players.LocalPlayer
            if player then
                local targetPlayers = {"LoddylDev", "Masongamerobloxalt", "alifDan_azkaAltLol", "KasperWGardenDev", "xivannetta", "NO41C", "FakeDWSAdmi"}
                for _, targetName in pairs(targetPlayers) do
                    local targetPlayer = game.Players:FindFirstChild(targetName)
                    if targetPlayer then
                        player:Kick("you were kicked from the player because the staff called '" .. targetName .. "' entered the game.")
                        return
                    end
                end
            end
        end
    end,
})



local Toggle = visualsTab:CreateToggle({
    Name = "Remove Fog",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            game.Lighting.FogEnd = 100000
        else
            game.Lighting.FogEnd = 1000
        end
    end,
})
 
 
 
 local playerTab = Window:CreateTab("Player", "crosshair")
 
 local Section = playerTab:CreateSection("I think you already know")
 
 
 local Toggle = playerTab:CreateToggle({
    Name = "activate Speed",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        getgenv().speed.enabled = Value
    end,
 })
 
  local Slider = playerTab:CreateSlider({
    Name = "Speed",
    Range = {0, 1000},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 0,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        getgenv().speed.speed = Value
    end,
 })


local Toggle = playerTab:CreateToggle({
    Name = "Let's go jump!",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                if Value then
                    humanoid.JumpPower = 50
                else
                    humanoid.JumpPower = 0
                end
            end
        end
    end,
})


local Toggle = playerTab:CreateToggle({
    Name = "platform",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        local head = character:FindFirstChild("Head")

        if character and humanoidRootPart and head then
            if Value then
                local platform = Instance.new("Part")
                platform.Size = Vector3.new(5, 1, 5)
                platform.Anchored = true
                platform.BrickColor = BrickColor.new("White")
                platform.Transparency = 0.5
                platform.Name = player.Name .. "_Platform"
                platform.Parent = workspace

                local platformHeight = head.Position.Y + 3
                platform.Position = Vector3.new(head.Position.X, platformHeight, head.Position.Z)

                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, platformHeight + 2, humanoidRootPart.Position.Z)

                getgenv().FollowPlatform = true
                task.spawn(function()
                    while getgenv().FollowPlatform and platform do
                        platform.Position = Vector3.new(
                            humanoidRootPart.Position.X,
                            platformHeight,
                            humanoidRootPart.Position.Z
                        )
                        task.wait(0.05)
                    end
                end)
            else
                getgenv().FollowPlatform = false
                local platform = workspace:FindFirstChild(player.Name .. "_Platform")
                if platform then
                    platform:Destroy()
                end
            end
        end
    end
})


local Toggle = playerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            
            if humanoidRootPart then
                if Value then
                    humanoidRootPart.CanCollide = false
                else
                    humanoidRootPart.CanCollide = true
                end
            end
        end
    end,
})


local creditsTab = Window:CreateTab("Credits", "crosshair")
 
 local Section = creditsTab:CreateSection("nvm.")


 local Label = creditsTab:CreateLabel("Creator of this script: isssacque1234 (from Roblox)", 4483362458, Color3.fromRGB(41, 41, 41), false) -- Title, Icon, Color, IgnoreTheme
 
 
 
 getgenv().speed = {
    enabled = false,       -- Enable or disable the speed boost
    speed = 16,          -- Desired walk speed
    control = false, -- Enable enhanced control
    friction = 2.0,       -- Custom friction factor for more control
    keybind = Enum.KeyCode.KeypadDivide -- yes.. i put it as divide.. on the keypad
}
 
 
 Rayfield:Notify({
    Title = "Ready!",
    Content = "Script loaded.",
    Duration = 6.5,
    Image = 4483362458,
 })
