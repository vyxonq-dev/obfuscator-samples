if game.PlaceId == 6403373529 then 

    local safeport = Instance.new("Part", Workspace)
    safeport.Name = "SafePort15"
    safeport.Size = Vector3.new(200, 10, 200) 
    safeport.Transparency = 0.5 
    safeport.CanCollide = true
    safeport.Anchored = true
    safeport.CFrame = CFrame.new(2457.6001, 229.365677, -4558.22363, -0.999834299, 0.000101457415, 0.0182033889, 3.8126462e-08, 0.999984503, -0.00557136489, -0.018203672, -0.00557044102, -0.999818802)
    local decal = Instance.new("Decal", safeport)
    decal.Face = "Top"
    decal.Texture = "rbxassetid://17047840821"
        
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local bypass;
        bypass = hookmetamethod(game, "__namecall", function(method, ...) 
            if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
                return
            end
            return bypass(method, ...)
        end)
     
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd hub", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "If You Have Bug Or Ideas DM Me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay",Icon = "rbxassetid://7733955511",Duration = 5})
    end)
    
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://www.youtube.com/@b00jkidd/featured')
    end)

    local Section = Tab:NewSection("Script Hub (Copies script to clipboard)")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard(' loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()')
    end)
    local Section = Tab:NewSection("Bigger hitboxes (reach) script (copies to clipboard)")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('loadstring(game:HttpGet(("https://gist.githubusercontent.com/stellar-4242/430ef3087d8d87eb306ca03e728ffbb8/raw/798429dd908b1f4471a1fa569ff62c5e5a93ec61/SLAP.LUA")))()')
    end)
    
    local Tab = Window:NewTab("Combat")
    
    local Section = Tab:NewSection("Slap Aura")
    
    Section:NewToggle("Slap Aura", "All Glove", function(state)
    getgenv().slapaura = state
    while getgenv().slapaura do
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
            if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false then
                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil or game.Players.LocalPlayer.leaderstats.Glove.Value == "Error" then
                    Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if 25 >= Magnitude then
                        shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Character:WaitForChild("HumanoidRootPart"),true)
                    end
                end
            end
        end
    end
    task.wait(0.2)
    end
    end)
    
    local Section = Tab:NewSection("Remove CD")
    
    Section:NewButton("Remove CD", "Doesn't work on all gloves", function()
        local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
    while character.Humanoid.Health ~= 0 do
    local localscript = tool:FindFirstChildOfClass("LocalScript")
    local localscriptclone = localscript:Clone()
    localscriptclone = localscript:Clone()
    localscriptclone:Clone()
    localscript:Destroy()
    localscriptclone.Parent = tool
    wait(0.1)
    end
    end)

    local Section = Tab:NewSection("Spam Retro Ability")

    Section:NewDropdown("Choose Ability", "All Glove", {"Ban Hammer", "Bomb", "Rocket Launcher"}, function(currentOption)
        spamretroab = currentOption
    end)

    Section:NewToggle("Spam Retro", "All Glove", function(state)
        getgenv().spamretro = state
        while getgenv().spamretro do
            if spamretroab == "Ban Hammer" then
                local args = {
                    [1] = "Ban Hammer"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("RetroAbility"):FireServer(unpack(args))
            elseif spamretroab == "Bomb" then
                local args = {
                    [1] = "Bomb"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("RetroAbility"):FireServer(unpack(args))
            elseif spamretroab == "Rocket Launcher" then
                local args = {
                    [1] = "Rocket Launcher"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("RetroAbility"):FireServer(unpack(args))
            end
        task.wait(0.2)
        end
    end)

    local Section = Tab:NewSection("Spam Admin Ability")

    Section:NewDropdown("Choose Ability", "All Glove", {"Anvil", "Fling", "Invisibility"}, function(currentOption)
        spamadminab = currentOption
    end)

    Section:NewToggle("Spam Admin", "All Glove", function(state)
        getgenv().spamadmin = state
        while getgenv().spamadmin do
            if spamadminab == "Anvil" then
                local args = {
                    [1] = "Anvil"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("AdminAbility"):FireServer(unpack(args))
            elseif spamadminab == "Fling" then
                local args = {
                    [1] = "Fling"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("AdminAbility"):FireServer(unpack(args))
            elseif spamadminab == "Invisibility" then
                local args = {
                    [1] = "Invisiblity"
                }

                game:GetService("ReplicatedStorage"):WaitForChild("AdminAbility"):FireServer(unpack(args))
            end
        task.wait(0.2)
        end
    end)
    
    local Section = Tab:NewSection("Spam Null")
    
    Section:NewToggle("Spam Null", "All Glove", function(state)
            getgenv().nullspam = state
    
        while getgenv().nullspam do
            game:GetService("ReplicatedStorage"):WaitForChild("NullAbility"):FireServer()
        task.wait(0.5)
        end
    end)
    
    local Section = Tab:NewSection("Spam Rhythm Explosion")
    
    Section:NewToggle("Spam Rhythm Explosion", "All Glove", function(state)
        getgenv().spamrhytm = state
        while getgenv().spamrhytm do
            local args = {
        [1] = "AoeExplosion",
        [2] = 42
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rhythmevent"):FireServer(unpack(args))
    task.wait(0.001)
    end
    end)

    local Section = Tab:NewSection("Spam Rojo")

    Section:NewToggle("Spam Rojo", "All Glove", function(state)
        getgenv().spamrojosb = state
        while getgenv().spamrojosb do
            game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
        task.wait()
        end
    end)

    Section:NewTextBox("Spam Rojo Person", "All Glove", function(txt)
        if txt == "Me" or txt == "me" or txt == "Username" or txt == "" then
            Person = game.Players.LocalPlayer.Name
        else
            Person = txt
        end
    end)

    Person = game.Players.LocalPlayer.Name

    local Section = Tab:NewSection("Spam Ping Pong To Players")

    Section:NewToggle("Spam Ping Pong", "Need Ping Pong", function(state)
        getgenv().sppingsb = state
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Ping Pong" then
            while getgenv().sppingsb do
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
                local players = game.Players:GetChildren()
                local RandomPlayer = players[math.random(1, #players)]
                repeat RandomPlayer = players[math.random(1, #players)] until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character:FindFirstChild("entered")
                if RandomPlayer ~= game.Players.LocalPlayer.Name and RandomPlayer.Character then
                    for i,v in pairs(game.Workspace:GetChildren()) do
                        if v:IsA("Part") and v.Name == game.Players.LocalPlayer.Name.."_PingPongBall" then
                            v.CFrame = RandomPlayer.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            task.wait(0.01)
            end
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Ping Pong Glove.",Icon = "rbxassetid://125872930372680",Duration = 5})
        end
    end)
    
    local Section = Tab:NewSection("Spam Shukuchi")
    
    Section:NewToggle("Spam Shukuchi", "Need Shukuchi", function(state)
        getgenv().spamshuk = state
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Shukuchi" then
            while getgenv().spamshuk do
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v ~= game.Players.LocalPlayer and v.Character then
                        if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false and v.Character.Head:FindFirstChild("RedEye") == nil then
                            if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                                    game:GetService("ReplicatedStorage"):WaitForChild("SM"):FireServer(v)
                            end
                        end
                    end
                end
            task.wait()
            end
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Shukuchi Glove.",Icon = "rbxassetid://125872930372680",Duration = 5})
        end
    end)
    
    local Section = Tab:NewSection("Spam Jester Cards")
    
    Section:NewToggle("Spam Jester Cards", "Need Jester", function(state)
        getgenv().jestcardspam = state
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Jester" then
            while getgenv().jestcardspam do
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    local closestPlayer = nil
    local closestDistance = math.huge
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local distance = (player.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if distance < closestDistance then
                closestPlayer = player
                closestDistance = distance
            end
        end
    end
    
    if closestPlayer then
        local args = {
            [1] = "Ability3",
            [2] = closestPlayer
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
    end
    task.wait()
    end
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Jester Glove.",Icon = "rbxassetid://125872930372680",Duration = 10})
        end
    end)
    
    local Tab = Window:NewTab("Misc")
    
    local Section = Tab:NewSection("Esp")
    
    Section:NewToggle("Esp", "Esp Player And Glove", function(state)
        getgenv().epssb = state
        if getgenv().epssb == false then
            for i, v in ipairs(game.Players:GetChildren()) do
                if v.Character and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("Gesp") then
                    v.Character.Head.Gesp:Destroy()
                end
            end
            wait(0.1)
            local objects = game:GetService("Workspace"):GetDescendants()
            for _, object in ipairs(objects) do
                if object.Name == "esp" then
                    object:Destroy()
                end
            end
        end
        while getgenv().epssb do
    for i, v in ipairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("entered") and v.Character.IsInDefaultArena.Value == false and v.Character.Head:FindFirstChild("Gesp") == nil then
            Gesp = Instance.new("BillboardGui", v.Character.Head)
            Gesp.Adornee = v.Character.Head
            Gesp.Name = "Gesp"
            Gesp.Size = UDim2.new(0, 100, 0, 150)
            Gesp.StudsOffset = Vector3.new(0, 1, 0)
            Gesp.AlwaysOnTop = true
            Gesp.StudsOffset = Vector3.new(0, 3, 0)
            Gesp.StudsOffset = Vector3.new(0, 3, 0)
            GespText = Instance.new("TextLabel", Gesp)
            GespText.BackgroundTransparency = 1
            GespText.Size = UDim2.new(0, 100, 0, 100)
            GespText.TextSize = 17
            GespText.Font = Enum.Font.SourceSansSemibold
            GespText.TextColor3 = Color3.fromRGB(0,0,0)
            GespText.TextStrokeTransparency = 0
            GespText.Text = v.leaderstats.Glove.Value
        end
    end
        for i, v in ipairs(game.Players:GetChildren()) do
            if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Torso") and v.Character:FindFirstChild("entered") and v.Character.IsInDefaultArena.Value == false and v.Character.Torso:FindFirstChild("esp") == nil then
                esp = Instance.new("BoxHandleAdornment", v.Character.Torso)
                esp.Adornee = v.Character.Torso
                esp.ZIndex = 0
                esp.Size = Vector3.new(4, 5, 1)
                esp.Transparency = 0.65
                esp.Color3 = Color3.fromRGB(0,0,0)
                esp.AlwaysOnTop = true
                esp.Name = "esp"
            end
        end
        task.wait(0.2)
    end
    end)
    
    local Section = Tab:NewSection("Teleport")
    
    Section:NewDropdown("All Teleports", "Teleport", {"SafePort", "Slapple Island", "Moai Island", "Plate", "Battle Arena", "Cannon Island", "Bounti Hunter(Hitman) Room", "Default Arena", "Normal Arena", "Spawn"}, function(abc)
        if abc == "SafePort" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2461.50464, 243.291565, -4546.78467, 0.966821849, -0.00649187574, 0.255369186, -1.00234743e-09, 0.999677002, 0.0254133251, -0.255451679, -0.0245701578, 0.966509581)
      elseif abc == "Slapples Isl" then
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.island5.Union.CFrame
     elseif abc == "Moai Isl" then
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.island4["Big Tree"].Bark.CFrame * CFrame.new(3. -4, 0)
    elseif abc == "Plate" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame
    elseif abc == "Battle Arena" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
    elseif abc == "Default Arena" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,364,-3)
    elseif abc == "Normal Arena" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-15.3642788, -3.69053721, -7.41954088, 0.405183077, -0.00669269683, -0.914211094, -1.2553046e-05, 0.999973178, -0.00732610561, 0.914235532, 0.00297989813, 0.40517211)
    elseif abc == "Spawn" then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-798.47345, 329.357147, 0.84058404, -0.791819096, -2.52048302e-08, -0.610755682, -2.72838037e-08, 1, -5.89596372e-09, 0.610755682, 1.19952013e-08, -0.791819096)
    elseif abc == "Cannon Island" then 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(257.620972, 35.9974861, 198.8535, 0.788386106, 0.045268368, -0.613512933, -8.81827944e-09, 0.997288942, 0.0735854656, 0.615180731, -0.0580137558, 0.786248744)
    elseif abc == "Bounti Hunter(Hitman) Room" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17894.6855, -130.158478, -3539.8374, -0.993310213, -4.15437862e-09, 0.11547628, -4.47561899e-09, 1, -2.52259036e-09, -0.11547628, -3.02254266e-09, -0.993310213)
end
    end)

    local Section = Tab:NewSection("Slapple Farm")

    Section:NewToggle("Slapple Farm", "Only In Arena", function(state)
        getgenv().slapfarmspissb = state
        while getgenv().slapfarmspissb do
            for i,v in pairs(game.Workspace.Arena.island5.Slapples:GetDescendants()) do
                if v.Name == "Glove" and v:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
        task.wait()
        end
    end)

    local Section = Tab:NewSection("Remove Name Tag")
    
    Section:NewToggle("Remove NameTag", "Good For Video", function(state)
        getgenv().removenametag = state
        if getgenv().removenametag == false then
            game.Players.LocalPlayer.Character.Head.Nametag.Enabled = true
        end
        while getgenv().removenametag do
            game.Players.LocalPlayer.Character.Head.Nametag.Enabled = false
        task.wait(0.3)
        end
    end)

    local Section = Tab:NewSection("Glove Equip")

    Section:NewTextBox("Glove Equip", "All Glove", function(txt)
        fireclickdetector(game.Workspace.Lobby[txt].ClickDetector)
    end)
    
    local Section = Tab:NewSection("Get Infinite Ingredients")
    
    Section:NewButton("Get Infinite Ingredients", "Need Alchemist", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
            for i = 1,200 do
                local args = {
        [1] = "AddItem",
        [2] = "Blood Rose"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    ------------------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Jade Stone"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    ----------------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Plane Flower"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    ----------------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Lamp Grass"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    -----------------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Winter Rose"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    ----------------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Autumn Sprout"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    ----------------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Dire Flower"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    ----------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Dark Root"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    --------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Fire Flower"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    ---------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Mushroom"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    --------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Hazel Lily"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    --------------------------------------------------------------------------------------------
    local args = {
        [1] = "AddItem",
        [2] = "Cake Mix"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    local args = {
        [1] = "AddItem",
        [2] = "Wild Vine"
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("AlchemistEvent"):FireServer(unpack(args))
    end
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Alchemist Glove.",Icon = "rbxassetid://125872930372680",Duration = 10})
    end
    end)
    
    local Section = Tab:NewSection("Get Full Kinetic")
    
    Section:NewButton("Full Kinetic", "Good For Berserk", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Kinetic" then
        OGL = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        for i = 1,100 do
            game.ReplicatedStorage.SelfKnockback:FireServer({["Force"] = 0,["Direction"] = Vector3.new(0,0.01,0)})
        wait(0.05)
        end
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Kinetic Glove.",Icon = "rbxassetid://125872930372680",Duration = 10})
        end
    end)
    
    local Tab = Window:NewTab("Badge")

    local Section = Tab:NewSection("Get The Schlob Glove")

    Section:NewButton("Get The Schlob Glove", "Need Cloud", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Cloud" and not game.Players.LocalPlayer.Character:FindFirstChild("entered") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-120.539459, 133.998047, -444.654419)
            wait(0.1)
            game:GetService("ReplicatedStorage").CloudAbility:FireServer()
            fireclickdetector(game.workspace.Lobby.fish.ClickDetector)
            repeat task.wait() firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 0) firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1.TouchInterest.Parent, 1)
            until game.Players.LocalPlayer.Character:FindFirstChild("entered")
            if game.Players.LocalPlayer.Character.Humanoid.Sit == false then
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == game.Players.LocalPlayer.Name.."_Cloud" and v:FindFirstChild("VehicleSeat") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.VehicleSeat.CFrame
                        wait(0.3)
                        game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
                        wait(0.3)
                        repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.Plate.CFrame
                        until game.Players.LocalPlayer.Character.Ragdolled.Value == false
                    end
                end
            else
                wait(0.3)
                game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
                wait(0.3)
                repeat task.wait() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.Plate.CFrame
                until game.Players.LocalPlayer.Character.Ragdolled.Value == false
            end
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Cloud Glove And Located in the Lobby",Icon = "rbxassetid://125872930372680",Duration = 10})
        end
    end)

    local Section = Tab:NewSection("Get Bomb Glove")
    
    Section:NewButton("Get Bomb Glove", "Need Warp and located in arena", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Warp" and game.Players.LocalPlayer.Character:FindFirstChild("entered") then
            local players = game.Players:GetChildren()
            local RandomPlayer = players[math.random(1, #players)]
            repeat RandomPlayer = players[math.random(1, #players)] until RandomPlayer ~= game.Players.LocalPlayer and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = RandomPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
            wait(0.3)
            game.ReplicatedStorage.WarpHt:FireServer(RandomPlayer.Character:WaitForChild("HumanoidRootPart"))
            wait(0.3)
            game:GetService("ReplicatedStorage").WLOC:FireServer()
            wait(0.2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.DEATHBARRIER.CFrame
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Warp Glove And Located in the Arena",Icon = "rbxassetid://125872930372680",Duration = 10})
        end
    end)

    local Section = Tab:NewSection("Get Plank Glove")

    Section:NewButton("Get Plank Glove", "Need Fort", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Fort" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8, 97, 4)
            wait(0.2)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
            wait(0.3)
            game:GetService("ReplicatedStorage").Fortlol:FireServer()
            wait(3.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
            wait(0.1)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(8, 106, -6)
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Fort Glove.",Icon = "rbxassetid://125872930372680",Duration = 10})
        end
    end)

    local Section = Tab:NewSection("Get Psycho Glove")

    Section:NewButton("Get Psycho Glove", "In Limbo", function()
        if game.Workspace then
            workspace.RepressedMemoriesMap.Psychokinesis.Triggers.StartPsychoEvent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(2.5)
            workspace.RepressedMemoriesMap.Psychokinesis.Triggers.StartPsychoEvent.CFrame = CFrame.new(17879.957, 2977.60913, -242.609451, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            wait(2.5)
            workspace.RepressedMemoriesMap.Psychokinesis.Triggers.StopPsychoEvent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(2.5)
            workspace.RepressedMemoriesMap.Psychokinesis.Triggers.StopPsychoEvent.CFrame = CFrame.new(17347.5801, 2977.60913, 103.471375, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            wait(2.5)
            fireclickdetector(workspace.RepressedMemoriesMap.Psychokinesis.Triggers.Psycho.ClickDetector)
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You have not entered Limbo.",Icon = "rbxassetid://125872930372680",Duration = 10})
        end
    end)

    local Section = Tab:NewSection("Get FrostBite Glove")
    
    Section:NewButton("Get FrostBite Glove", "Badge", function()
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-554, 177, 56)
wait(0.7)
for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                v.HoldDuration = 0
            end
        end
       wait(0.5)
       for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
        ]])
    end
    game:GetService("TeleportService"):Teleport(17290438723)
    end)

    local Section = Tab:NewSection("Get Admin Glove")
    
    Section:NewButton("Get Admin Glove", "Badge", function()
        if game:GetService("ReplicatedStorage").Assets.Retro.Map then
    game.ReplicatedStorage.Assets.Retro.Map.Parent = workspace
    wait(0.4)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16971.7168, 797.600342, 4905.17334, 0.230043754, -4.14069206e-08, 0.973180294, -1.62095546e-08, 1, 4.63797178e-08, -0.973180294, -2.64441837e-08, 0.230043754)
    wait(0.4)
    fireclickdetector(workspace.Map.RetroObbyMap:GetChildren()[5].StaffApp.Button.ClickDetector)
    else
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-16971.7168, 797.600342, 4905.17334, 0.230043754, -4.14069206e-08, 0.973180294, -1.62095546e-08, 1, 4.63797178e-08, -0.973180294, -2.64441837e-08, 0.230043754)
    wait(0.4)
    fireclickdetector(workspace.Map.RetroObbyMap:GetChildren()[5].StaffApp.Button.ClickDetector)
    end
    end)
    
    local Section = Tab:NewSection("Get Lamp Glove")
    
    Section:NewButton("Get Lamp Glove", "Need ZZZZZZZ Glove", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "ZZZZZZZ" then
            for i = 1,5 do
                game:GetService("ReplicatedStorage").nightmare:FireServer("LightBroken")
            end
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need ZZZZZZZ Glove.",Icon = "rbxassetid://125872930372680",Duration = 10})
        end
    end)
    
    local Section = Tab:NewSection("Get Ice Skate Glove")
    
    Section:NewButton("Get Ice Skate Glove", "Badge", function()
        local args = {
        [1] = "Freeze"
    }
    
    game:GetService("ReplicatedStorage").IceSkate:FireServer(unpack(args))
    end)
    
    local Section = Tab:NewSection("Elude & Counter Badge")

    Section:NewDropdown("Maze Badge", "Badge", {"Counter", "Elude"}, function(y)
        if y == "Counter" then
            local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-61.4113426, 4.67113781, -45.0443306, -0.0143145993, 0.00252397754, -0.999894321, -7.96703534e-06, 0.999996841, 0.00252435054, 0.99989748, 4.41164557e-05, -0.014314536)
    wait(0.3)
    fireclickdetector(game.Workspace.CounterLever.ClickDetector)
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(15.2456455, 4.49108553, -233.529053, -0.631848156, -0.00334048411, 0.775085032, -1.25992265e-05, 0.999990761, 0.00429952005, -0.775092185, 0.00270687975, -0.631842375)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 minutes and 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 minutes to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 59 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 58 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 57 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 56 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 55 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 54 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 53 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 52 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 51 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 50 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 49 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 48 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 47 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 46 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 45 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 44 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 43 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 42 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 41 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 40 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 39 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 38 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 37 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 36 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 35 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 34 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 33 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 32 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 31 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 30 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 29 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 28 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 27 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 26 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 25 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 24 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 23 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 22 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 21 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 20 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 19 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 18 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 17 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 16 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 15 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 14 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 13 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 12 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 11 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 10 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 9 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 8 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 7 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 6 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 5 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 4 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 3 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 2 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 59 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 58 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 57 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 56 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 55 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 54 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 53 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 52 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 51 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 50 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 49 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 48 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 47 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 46 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 45 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 44 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 43 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 42 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 41 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 40 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 39 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 38 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 37 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 36 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 35 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 34 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 33 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 32 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 31 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 30 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 29 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 28 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 27 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 26 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 25 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 24 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 23 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 22 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 21 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 20 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 19 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 18 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 17 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 16 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 15 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 14 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 13 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 12 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 11 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 10 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 9 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 8 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 7 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 6 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 5 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 4 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 3 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    for i,v in pairs(workspace.Maze:GetDescendants()) do
    if v:IsA("ClickDetector") then
    fireclickdetector(v)
    end
    end
        ]])
    end
    game:GetService("TeleportService"):Teleport(11828384869)
elseif y == "Elude" then
    local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-193.290787, 7.39999914, -130.307114, 0.454088956, 1.82432505e-08, 0.890956342, -2.14201332e-08, 1, -9.55894652e-09, -0.890956342, -1.4743792e-08, 0.454088956)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.8454437, 7.39999914, -201.827698, 0.694604456, -5.9176017e-08, 0.719391882, 4.9516661e-08, 1, 3.44478792e-08, -0.719391882, 1.16942349e-08, 0.694604456)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(218.528198, 7.39999914, 83.4171371, 0.655885577, 5.49275381e-09, 0.754860282, -1.8204565e-08, 1, 8.54112692e-09, -0.754860282, -1.9343906e-08, 0.655885577)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(104.568184, 10.5492659, 194.721115, 0.990249932, -0.136891961, 0.0258003082, -0.0024311184, 0.168200076, 0.9857499, -0.139280856, -0.976201475, 0.166227311)
        wait(2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-502.335632, 14.2279472, -179.596512, 1, 0, 0, 0, -0.965929747, 0.258804798, 0, -0.258804798, -0.965929747)
        ]])
    end
    game:GetService("TeleportService"):Teleport(11828384869)
end
end)

local Section = Tab:NewSection("Get Chain Glove")

Section:NewButton("Get Chain Glove", "Need 1k And More Slap", function()
    if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 1000 then
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
        if teleportFunc then
            teleportFunc([[
                if not game:IsLoaded() then
                    game.Loaded:Wait()
                end
                repeat wait() until game.Players.LocalPlayer
         repeat wait() until game.Workspace:FindFirstChild("Map"):FindFirstChild("CodeBrick")
        if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then
        game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "1st"
        game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "2nd"
        game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "3rd"
        game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "4th"
        end
        for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                            if v.Name == "1st" then
                                if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                            first = "4"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                            first = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                            first = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                            first = "9"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                            first = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                            first = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                            first = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                            first = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                            first = "7"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                            first = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                            first = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                            first = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                            first = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                            first = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                            first = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                            first = "2"
                        end
                            end
                        end
        for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                            if v.Name == "2nd" then
                                if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                            second = "4"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                            second = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                            second = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                            second = "9"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                            second = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                            second = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                            second = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                            second = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                            second = "7"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                            second = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                            second = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                            second = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                            second = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                            second = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                            second = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                            second = "2"
                        end
                            end
                        end
        for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                            if v.Name == "3rd" then
                                if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                            third = "4"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                            third = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                            third = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                            third = "9"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                            third = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                            third = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                            third = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                            third = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                            third = "7"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                            third = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                            third = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                            third = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                            third = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                            third = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                            third = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                            third = "2"
                        end
                            end
                        end
        for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                            if v.Name == "4th" then
                                if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                            fourth = "4"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                            fourth = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                            fourth = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                            fourth = "9"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                            fourth = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                            fourth = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                            fourth = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                            fourth = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                            fourth = "7"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                            fourth = "8"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                            fourth = "2"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                            fourth = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                            fourth = "3"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                            fourth = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                            fourth = "6"
                        elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                            fourth = "2"
                        end
                            end
                        end
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[first].ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[second].ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[third].ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[fourth].ClickDetector)
        task.wait(1)
        fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Enter.ClickDetector)
        task.wait(0.5)
        game:GetService("TeleportService"):Teleport(6403373529)
            ]])
        end
        game:GetService("TeleportService"):Teleport(9431156611)
    else
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need 1000 And More Slap.",Icon = "rbxassetid://125872930372680",Duration = 10})
    end
end)

    local Section = Tab:NewSection("Get Redacted Glove")
    
    Section:NewButton("Get Redacted Glove", "Need 5k And More Slap", function()
        if game.Players.LocalPlayer.leaderstats.Slaps.Value >= 5000 then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["1"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["10"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["2"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["3"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["4"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["5"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["6"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["7"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["8"].CFrame
    wait(3.75)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.PocketDimension.Doors["9"].CFrame
    else 
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need 5000 And More Slap.",Icon = "rbxassetid://125872930372680",Duration = 10})
    end
    end)
    
    local Section = Tab:NewSection("Get Retro Glove")
    
    Section:NewButton("Get Retro Glove", "Badge", function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Recall" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.FinishDoor_Retro.Part.CFrame
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Need Recall Glove.",Icon = "rbxassetid://125872930372680",Duration = 10})
        end
    end)
    
    local Section = Tab:NewSection("Brazil Badge")
    
    Section:NewButton("TP to Brazil", "You Got Kicked", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Lobby.brazil.portal.CFrame
    end)
    
    local Section = Tab:NewSection("Get Duck, The Lone Orange, Court Evidence Badge")
    
    Section:NewButton("Get Badge", "Badge", function()
        fireclickdetector(workspace.Arena["default island"]["Rubber Ducky"].ClickDetector)
        fireclickdetector(workspace.Lobby.Scene.knofe.ClickDetector)
        fireclickdetector(workspace.Arena.island5.Orange.ClickDetector)
    end)
    
    local Tab = Window:NewTab("Antis")
    
    local Section = Tab:NewSection("Antis")
    
    Section:NewToggle("Anti Void", "Working on Map, Battle Arena, psycho obby, retro obby", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "AntiVoid"
    block.Size = Vector3.new(265, 1, 1000) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(0, -9, 0)
    block.Parent = game.Workspace
    ---------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidPsycho"
    block.Size = Vector3.new(2000, 1, 1000) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(17800.9082, 2947, -226.017517, -0.248515129, 0.00487846136, -0.968615651, 0.966844261, -0.0594091415, -0.248359889, -0.0587562323, -0.998221755, 0.0100474358)
    block.Parent = game.Workspace
    ----------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoid2"
    block.Size = Vector3.new(500, 10, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true
    block.Anchored = true 
    block.Position = Vector3.new(200, -24, 0)
    block.Parent = game.Workspace
    ----------------------------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoid3"
    block.Size = Vector3.new(1000, 1, 48) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(150, -24, 0) 
    block.Parent = game.Workspace
    ----------------------------------------------------------------------------------------------------------------------------
    local block = workspace:FindFirstChild("AntiVoid3")
    if block then
        local rotationAngle = 90
        local rotationCFrame = CFrame.Angles(0, math.rad(rotationAngle), 0)
        block.CFrame = block.CFrame * rotationCFrame
    end
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro6"
    block.Size = Vector3.new(460, 3, 150) 
    block.Transparency = 0.5
    block.CanCollide = true
    block.Anchored = true 
    block.Position = Vector3.new(-27815.248, 162.506134, 4834.07471, -1.3038516e-07, -8.49145394e-08, 1, 2.64238391e-08, 1, 8.49145394e-08, -1, 2.64238498e-08, -1.3038516e-07)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro5"
    block.Size = Vector3.new(500, 3, 150) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-27965.0977, 35.1371307, 4834.51074, 1, 0, 0, 0, 1, 0, 0, 0, 1) 
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro4"
    block.Size = Vector3.new(1000, 5, 500) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true
    block.Position = Vector3.new(-28030.8477, -93.4633942, 4950.85986, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro3"
    block.Size = Vector3.new(100, 5, 1000) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true
    block.Position = Vector3.new(-28030.6484, -219.863602, 4836.85986, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro2"
    block.Size = Vector3.new(1000, 2, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-16906.6445, 770.000549, 4719.68848, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro"
    block.Size = Vector3.new(1000, 2, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-16874.8262, -7.55000019, 4799.2666)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = workspace:FindFirstChild("AntiVoid3")
    if block then
        local rotationAngle = 45
        local rotationCFrame = CFrame.Angles(math.rad(rotationAngle), 0, 0)
        block.CFrame = block.CFrame * rotationCFrame
    end
    --------------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoid4"
    block.Size = Vector3.new(265, 1, 1000) 
    block.Transparency = 0.5
    block.CanCollide = true 
    block.Anchored = true
    block.Position = Vector3.new(-135, -9, 0)
    block.Parent = game.Workspace
    -----------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidBA"
    block.Size = Vector3.new(2000, 10, 2000)
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true
    block.Position = Vector3.new(3500, 74.5, 0)
    block.Parent = game.Workspace
    -----------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoid5"
    block.Size = Vector3.new(300, 1, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true
    block.Anchored = true 
    block.Position = Vector3.new(-400, -30, 0)
    block.Parent = game.Workspace
    ----
    local block = Instance.new("Part")
    block.Name = "AntiVoid6"
    block.Size = Vector3.new(36, 1, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true
    block.Anchored = true 
    block.CFrame = CFrame.new(-251.591003, -26.5025349, -35.90802, -4.37113883e-08, -1, 0, 1, -4.37113883e-08, 0, 0, 0, 1)
    block.Parent = game.Workspace
        else
    local block = game.Workspace:FindFirstChild("AntiVoid")
    if block then
        block:Destroy()
    end
    ----------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoid2")
    if block then
        block:Destroy()
    end
    -----------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoid3")
    if block then
        block:Destroy()
    end
    --------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoid4")
    if block then
        block:Destroy()
    end
    --------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidBA")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro6")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro5")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro4")
    if block then
        block:Destroy()
    end
    -------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro3")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidPsycho")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro2")
    if block then
        block:Destroy() 
    end
    -------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro")
    if block then
        block:Destroy()
    end
    --------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoid5")
    if block then
        block:Destroy()
    end
    ---
    local block = game.Workspace:FindFirstChild("AntiVoid6")
    if block then
        block:Destroy()
    end
        end
    end)

    Section:NewToggle("Anti Void 2.0", "You Bob?", function(state)
        if state then
            local workspace = game:GetService("Workspace")
local antivoidKYK = Instance.new("Part", workspace)
antivoidKYK.CanCollide = true
antivoidKYK.Anchored = true
antivoidKYK.CFrame = CFrame.new(23.2798462, -19.8447475, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
antivoidKYK.Name = "antivoidKYK"
antivoidKYK.Transparency = 0.5
local antivoidKYK2 = Instance.new("Part", workspace)
antivoidKYK2.CanCollide = true
antivoidKYK2.Anchored = true
antivoidKYK2.CFrame = CFrame.new(-458.458344, -9.25, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK2.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
antivoidKYK2.Name = "antivoidKYK2"
antivoidKYK2.Transparency = 0.5
local antivoidKYK3 = Instance.new("Part", workspace)
antivoidKYK3.CanCollide = true
antivoidKYK3.Anchored = true
antivoidKYK3.CFrame = CFrame.new(-690.65979, 47.25, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK3.Size = Vector3.new(674.8563232421875, 0.6048492789268494, 2048)
antivoidKYK3.Name = "antivoidKYK3"
antivoidKYK3.Transparency = 0.5
local antivoidKYK4 = Instance.new("Part", workspace)
antivoidKYK4.CanCollide = true
antivoidKYK4.Anchored = true
antivoidKYK4.CFrame = CFrame.new(402.964996, 29.25, 222.310089, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK4.Size = Vector3.new(379.88922119140625, 1.5, 160.8837127685547)
antivoidKYK4.Name = "antivoidKYK4"
antivoidKYK4.Transparency = 0.5
local antivoidKYK6 = Instance.new("Part", workspace)
antivoidKYK6.CanCollide = true
antivoidKYK6.Anchored = true
antivoidKYK6.CFrame = CFrame.new(178.719162, -18.9417267, 1.83554196, -0.989596844, -0.143868446, 0, 0.143868446, -0.989596844, 0, 0, 0, 1)
antivoidKYK6.Size = Vector3.new(143.94830322265625, 1.5, 2048)
antivoidKYK6.Name = "antivoidKYK6"
antivoidKYK6.Transparency= 0.5
local antivoidKYK7 = Instance.new("Part", workspace)
antivoidKYK7.CanCollide = true
antivoidKYK7.Anchored = true
antivoidKYK7.CFrame = CFrame.new(-309.152832, 15.4761791, 1.83554196, -0.816968799, -0.576681912, 0, 0.576681912, -0.816968799, 0, 0, 0, 1)
antivoidKYK7.Size = Vector3.new(110.13511657714844, 2.740000009536743, 2048)
antivoidKYK7.Name = "antivoidKYK7"
antivoidKYK7.Transparency = 0.5
local antivoidKYK8 = Instance.new("Part", workspace)
antivoidKYK8.CanCollide = true
antivoidKYK8.Anchored = true
antivoidKYK8.CFrame = CFrame.new(174.971924, 5.34897423, 222.310089, -0.838688731, 0.544611216, 0, -0.544611216, -0.838688731, 0, 0, 0, 1)
antivoidKYK8.Size = Vector3.new(89.76103210449219, 1.5, 160.8837127685547)
antivoidKYK8.Name = "antivoidKYK8"
antivoidKYK8.Transparency = 0.5
local antivoidKYK9 = Instance.new("Part", workspace)
antivoidKYK9.CanCollide = true
antivoidKYK9.Anchored = true
antivoidKYK9.CFrame = CFrame.new(402.965027, 5.49165154, 74.8157959, 2.98023224e-05, -1.14142895e-05, -1, -0.668144584, -0.744031429, -1.14142895e-05, -0.744031489, 0.668144584, -2.98023224e-05)
antivoidKYK9.Size = Vector3.new(74.23055267333984, 1, 379.88922119140625)
antivoidKYK9.Name = "antivoidKYK9"
antivoidKYK9.Transparency = 0.5
local antivoidKYK10 = Instance.new("Part", workspace)
antivoidKYK10.CanCollide = true
antivoidKYK10.Anchored = true
antivoidKYK10.CFrame = CFrame.new(402.964996, 29.9136467, 121.981705, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK10.Size = Vector3.new(379.88922119140625, 1.5, 39.77305603027344)
antivoidKYK10.Name = "antivoidKYK10"
antivoidKYK10.Transparency = 0.5
local antivoidKYK11 = Instance.new("WedgePart", workspace)
antivoidKYK11.CanCollide = true
antivoidKYK11.Anchored = true
antivoidKYK11.CFrame = CFrame.new(134.084229, -17.8583984, 94.3953705, 0.541196942, -0.354067981, 0.762719929, -0.840263784, -0.192543149, 0.506837189, -0.0325982571, -0.915184677, -0.401714325)
antivoidKYK11.Size = Vector3.new(1, 88.66793823242188, 34.42972946166992)
antivoidKYK11.Name = "antivoidKYK11"
antivoidKYK11.Transparency = 0.5
local antivoidKYK12 = Instance.new("WedgePart", workspace)
antivoidKYK12.CanCollide = true
antivoidKYK12.Anchored = true
antivoidKYK12.CFrame = CFrame.new(168.441879, 2.46393585, 125.815231, -0.350553155, -0.534268022, 0.769201458, -0.198098332, 0.845035911, 0.496660322, -0.915352523, 0.0217281878, -0.402067661)
antivoidKYK12.Size = Vector3.new(1, 0.9999924302101135, 82.1865463256836)
antivoidKYK12.Name = "antivoidKYK12"
antivoidKYK12.Transparency = 0.5
local antivoidKYK13 = Instance.new("WedgePart", workspace)
antivoidKYK13.CanCollide = true
antivoidKYK13.Anchored = true
antivoidKYK13.CFrame = CFrame.new(206.315063, 26.9295502, 105.471031, 0.534210563, -0.415855825, -0.73599112, -0.845072925, -0.285055399, -0.452321947, -0.021697551, 0.863601387, -0.503708005)
antivoidKYK13.Size = Vector3.new(1, 13.53612232208252, 9.847718238830566)
antivoidKYK13.Name = "antivoidKYK13"
antivoidKYK13.Transparency = 0.5
local antivoidKYK14 = Instance.new("WedgePart", workspace)
antivoidKYK14.CanCollide = true
antivoidKYK14.Anchored = true
antivoidKYK14.CFrame = CFrame.new(165.965088, 2.12955856, 77.8575592, -0.53421092, -0.415855944, 0.735991359, 0.845073164, -0.285055757, 0.452322066, 0.0216975808, 0.863601625, 0.503708005)
antivoidKYK14.Size = Vector3.new(1, 13.53612232208252, 99.8001480102539)
antivoidKYK14.Name = "antivoidKYK14"
antivoidKYK14.Transparency = 0.5
local antivoidKYK15 = Instance.new("WedgePart", workspace)
antivoidKYK15.CanCollide = true
antivoidKYK15.Anchored = true
antivoidKYK15.CFrame = CFrame.new(172.67041, 5.49164963, 74.8157959, -4.58955765e-05, 2.05039978e-05, 1, 0.743987858, 0.668193102, 2.05039978e-05, -0.668193102, 0.743987858, -4.58955765e-05)
antivoidKYK15.Size = Vector3.new(1, 74.23055267333984, 80.699951171875)
antivoidKYK15.Name = "antivoidKYK15"
antivoidKYK15.Transparency = 0.5
local antivoidKYK16 = Instance.new("WedgePart", workspace)
antivoidKYK16.CanCollide = true
antivoidKYK16.Anchored = true
antivoidKYK16.CFrame = CFrame.new(212.753906, 30.0632439, 121.981705, -0.283976078, -0.95883137, 0, 0.95883137, -0.283976078, 0, 0, 0, 1)
antivoidKYK16.Size = Vector3.new(1, 0.8520558476448059, 39.773048400878906)
antivoidKYK16.Name = "antivoidKYK16"
antivoidKYK16.Transparency = 0.5
local antivoidKYK17 = Instance.new("WedgePart", workspace)
antivoidKYK17.CanCollide = true
antivoidKYK17.Anchored = true
antivoidKYK17.CFrame = CFrame.new(212.884216, 30.1233234, 121.984734, 0.544644356, 0.33412537, -0.769235253, -0.838644743, 0.223680317, -0.496630788, 0.00612583756, 0.915602207, 0.402038693)
antivoidKYK17.Size = Vector3.new(1, 36.08900451660156, 16.739320755004883)
antivoidKYK17.Name = "antivoidKYK17"
antivoidKYK17.Transparency = 0.5
local antivoidKYK18 = Instance.new("WedgePart", workspace)
antivoidKYK18.CanCollide = true
antivoidKYK18.Anchored = true
antivoidKYK18.CFrame = CFrame.new(174.83577, 5.55865097, 141.871262, -0.544644356, 0.33412537, 0.769235253, 0.838644743, 0.223680317, 0.496630788, -0.00612583756, 0.915602207, -0.402038693)
antivoidKYK18.Size = Vector3.new(1, 36.08900451660156, 82.1865463256836)
antivoidKYK18.Name = "antivoidKYK18"
antivoidKYK18.Transparency = 0.5
local antivoidKYK19 = Instance.new("WedgePart", workspace)
antivoidKYK19.CanCollide = true
antivoidKYK19.Anchored = true
antivoidKYK19.CFrame = CFrame.new(165.427338, 2.97219658, 77.884697, -0.541196942, -0.354067981, -0.762719929, 0.840263784, -0.192543149, -0.506837189, 0.0325982571, -0.915184677, 0.401714325)
antivoidKYK19.Size = Vector3.new(1, 88.66793823242188, 47.76289749145508)
antivoidKYK19.Name = "antivoidKYK19"
antivoidKYK19.Transparency = 0.5
local block = Instance.new("Part")
block.Name = "AntiVoidRetro6KYK"
block.Size = Vector3.new(460, 3, 150) 
block.Transparency = 0.5
block.CanCollide = true
block.Anchored = true 
block.Position = Vector3.new(-27815.248, 162.506134, 4834.07471, -1.3038516e-07, -8.49145394e-08, 1, 2.64238391e-08, 1, 8.49145394e-08, -1, 2.64238498e-08, -1.3038516e-07)
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetro5KYK"
block.Size = Vector3.new(500, 3, 150) 
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true 
block.Position = Vector3.new(-27965.0977, 35.1371307, 4834.51074, 1, 0, 0, 0, 1, 0, 0, 0, 1) 
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetro4KYK"
block.Size = Vector3.new(1000, 5, 500) 
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true
block.Position = Vector3.new(-28030.8477, -93.4633942, 4950.85986, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetro3KYK"
block.Size = Vector3.new(100, 5, 1000) 
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true
block.Position = Vector3.new(-28030.6484, -219.863602, 4836.85986, 0, 0, 1, 0, 1, -0, -1, 0, 0)
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetro2KYK"
block.Size = Vector3.new(1000, 2, 1000)
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true 
block.Position = Vector3.new(-16906.6445, 770.000549, 4719.68848, 1, 0, 0, 0, 1, 0, 0, 0, 1)
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetroKYK"
block.Size = Vector3.new(1000, 2, 1000)
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true 
block.Position = Vector3.new(-16874.8262, -7.55000019, 4799.2666)
block.Parent = game.Workspace
local block = Instance.new("Part")
block.Name = "AntiVoidPsychoKYK"
block.Size = Vector3.new(2000, 1, 1000) 
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true 
block.Position = Vector3.new(17800.9082, 2947, -226.017517, -0.248515129, 0.00487846136, -0.968615651, 0.966844261, -0.0594091415, -0.248359889, -0.0587562323, -0.998221755, 0.0100474358)
block.Parent = game.Workspace
local block = Instance.new("Part")
block.Name = "AntiVoidBAKYK"
block.Size = Vector3.new(2000, 10, 2000)
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true
block.Position = Vector3.new(3500, 74.5, 0)
block.Parent = game.Workspace
        else
            local antivoidList = {
                "antivoidKYK",
                "AntiVoidPsychoKYK",
                "AntiVoidRetro2KYK",
                "AntiVoidRetro3KYK",
                "AntiVoidRetro4KYK",
                "AntiVoidRetro5KYK",
                "AntiVoidRetro6KYK",
                "AntiVoidBAKYK",
                "AntiVoidRetroKYK",
                "antivoidKYK2",
                "antivoidKYK3",
                "antivoidKYK4",
                "antivoidKYK6",
                "antivoidKYK7",
                "antivoidKYK8",
                "antivoidKYK9",
                "antivoidKYK10",
                "antivoidKYK11",
                "antivoidKYK12",
                "antivoidKYK13",
                "antivoidKYK14",
                "antivoidKYK15",
                "antivoidKYK16",
                "antivoidKYK17",
                "antivoidKYK18",
                "antivoidKYK19"
            }
            
            for _, antivoidName in ipairs(antivoidList) do
                local block = game.Workspace:FindFirstChild(antivoidName)
                if block then
                    block:Destroy()
                end
            end
        end
    end)

    
    Section:NewToggle("No Knockback", "Character Reset", function(state)
        getgenv().antiragdolsb = state
            if getgenv().antiragdolsb then
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                game.Players.LocalPlayer.CharacterAdded:Connect(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
                        if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and getgenv().antiragdolsb then
                            repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
                            until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                            game.Players.LocalPlayer.Character.Torso.Anchored = false
                        end
                    end)
                end)
            end
    end)
    
    Section:NewToggle("Anti Megarock/CUSTOM", "Antis", function(state)
        getgenv().antimegarocksb = state
        while getgenv().antimegarocksb do
            for _,v in pairs(game.Players:GetChildren()) do
                if v.Character:FindFirstChild("rock") then
                    v.Character:FindFirstChild("rock").CanTouch = false
                    v.Character:FindFirstChild("rock").CanQuery = false
                end
            end
        task.wait()
        end
    end)
    
    Section:NewToggle("Anti Knockoff", "Antis", function(state)
        getgenv().Antiknokoffsb = state
    while getgenv().Antiknokoffsb do
    if game.Workspace.CurrentCamera and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Workspace.CurrentCamera.CameraSubject ~= game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Workspace.CurrentCamera.CameraSubject == game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s_falsehead") then
    game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
    task.wait()
    end
    end)
    
    Section:NewToggle("Anti TimeStop", "Antis", function(state)
        getgenv().antitssb = state
        while getgenv().antitssb do
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.ClassName == "Part" then
                    v.Anchored = false
                end
            end
        task.wait()
        end
    end)
    
    Section:NewToggle("Anti Cube Of Death", "Antis", function(state)
        if state then
            workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
        else
            workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
        end
    end)

    Section:NewToggle("Anti Ice", "Antis", function(state)
        getgenv().antiicesb = state
        while getgenv().antiicesb do
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Icecube" then
                    v:Destroy()
                    game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
                end
            end
        task.wait()
        end
    end)
    
    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Slaps Stat")
    
    Section:NewTextBox("Enter Slaps Here", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.leaderstats.Slaps.Value = txt
    end)
    
    Section:NewSlider("Slaps", "SliderInfo", 100000, 0, function(s)
        game.Players.LocalPlayer.leaderstats.Slaps.Value = s * 1
    end)

    local Section = Tab:NewSection("WalkSpeed")
    
    Section:NewTextBox("Enter WalkSpeed Here", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Walkspeed", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("JumpPower")
    
    Section:NewTextBox("Enter JumpPower Here", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("JumpPower", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Player Gravity")
    
    Section:NewTextBox("Enter Desired Gravity Here.", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 9431156611 then
    
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd. Inspired by Ky Hub.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local bypass;
        bypass = hookmetamethod(game, "__namecall", function(method, ...) 
            if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Events.Ban then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Events.AdminGUI then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Events.WS then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Events.WS2 then
                return
            end
            return bypass(method, ...)
        end)
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd hub Hub | Slap Royale", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('b00jkidd')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)
    
    local Tab = Window:NewTab("Combat")
    
    local Section = Tab:NewSection("Auto Win")
    
    Section:NewButton("Auto Win", "On Slap Aura and remove Acid,Lava", function()
        if game.Players.LocalPlayer.Character:WaitForChild("inMatch").Value == true then
            local TweenService = game:GetService("TweenService")
            local Players = game:GetService("Players")
    
    local function tweenToPlayer(target)
        local tweenInfo = TweenInfo.new(2.75, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
        local tween = TweenService:Create(
            Players.LocalPlayer.Character.HumanoidRootPart,
            tweenInfo,
            {CFrame = target.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)}
        )
        tween:Play()
        
        while tween.PlaybackState == Enum.PlaybackState.Playing do
            wait(0.1)
            if target.Parent == nil or target.Ragdolled.Value or target.Humanoid.Health <= 1 then
                tween:Cancel()
                break 
            end
        end
    end
    
    while true do
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
                tweenToPlayer(player.Character)
            end
        end
        wait(0.1) 
    end
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Wait For Match Started.",Icon = "rbxassetid://125872930372680",Duration = 3})
        end
    end)
    
    local Section = Tab:NewSection("Slap Aura")
    
    Section:NewToggle("Slap Aura", "All Glove", function(state)
        getgenv().slapaurasr = state
            if game.Players.LocalPlayer.Character.inMatch.Value == true then
                while getgenv().slapaurasr do
                    for i,v in pairs(game.Players:GetChildren()) do
                        if v ~= game.Players.LocalPlayer and v.Character then
                            if v.Character:FindFirstChild("Dead") == nil and v.Character:FindFirstChild("HumanoidRootPart") then
                                Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                                if 25 >= Magnitude then
                                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Slap"):FireServer(v.Character:WaitForChild("HumanoidRootPart"))
                                end
                            end
                        end
                    end
                task.wait()
                end
            else
                game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Wait For Match Started.",Icon = "rbxassetid://125872930372680",Duration = 5})
            end
    end)
    
    local Tab = Window:NewTab("Misc")
    
    local Section = Tab:NewSection("Items")
    
    Section:NewButton("Get All Items | WORKING", "Misc", function()
        if game.Players.LocalPlayer.Character.inMatch.Value == true then
            for i, v in ipairs(game.Workspace.Items:GetChildren()) do
                if v.ClassName == "Tool" and v:FindFirstChild("Handle") then
                    v.Handle.Anchored = false
                    v.Handle.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame
                    game:GetService("Players").LocalPlayer.Character.Humanoid:EquipTool(v)
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
            end
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
        else
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "Wait For Match Started.",Icon = "rbxassetid://125872930372680",Duration = 5})
        end
    end)
    
    Section:NewToggle("Auto Use Items", "if off you can get kicked", function(state)
        getgenv().autoitemssr = state
        while getgenv().autoitemssr do
            for i, v in ipairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v.ClassName == "Tool" and not (v.Name == "Witch" or v.Name == "Void" or v.Name == "Vigorous" or v.Name == "Vampire" or v.Name == "Thundercaller" or v.Name == "Tank" or v.Name == "Revenge" or v.Name == "Pow" or v.Name == "Pack-A-Punch" or v.Name == "Missile-Launcher" or v.Name == "KABOOM" or v.Name == "Juggernaut" or v.Name == "Glacier" or v.Name == "Faculty" or v.Name == "Cannoneer" or v.Name == "Aquarius" or v.Name == "Aerialist") then
                    v:Activate()
                end
            end
        task.wait()
        end
    end)
    
    Section:NewButton("Use Items", "Misc", function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Bull's essence" or v.Name == "Potion of Strength" or v.Name == "Boba" or v.Name == "Speed Potion" or v.Name == "Frog Potion" or v.Name == "Strength Brew" or v.Name == "Frog Brew" or v.Name == "Speed Brew" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                v:Activate()
            end
        end
    end)
    
    Section:NewButton("Get 250 Power", "Misc", function()
        for i = 1, 2 do
    game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["True Power"])
    game.Players.LocalPlayer.Character["True Power"]:Activate()
    end
    end)
    
    Section:NewButton("Bomb Bus", "Bomb Bus", function()
        for i, v in ipairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Bomb" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                v:Activate()
            end
        end
    end)
    
    local Section = Tab:NewSection("Esp")
    
    Section:NewToggle("Items Esp", "Misc", function(state)
        getgenv().istemespsra = state
        if getgenv().istemespsra == false then
            for i,v in ipairs(game.Workspace.Items:GetChildren()) do
                if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChild("espitemsr") then
                    v.espitemsr:Destroy()
                end
            end
        end
        while getgenv().istemespsra do
            for i,v in ipairs(game.Workspace.Items:GetChildren()) do
                if v.ClassName == "Tool" and v:FindFirstChild("Handle") and v:FindFirstChild("espitemsr") == nil then
                    local espitemsr = Instance.new("BillboardGui", v)
                    espitemsr.Adornee = v
                    espitemsr.Name = "espitemsr"
                    espitemsr.Size = UDim2.new(0, 100, 0, 150)
                    espitemsr.StudsOffset = Vector3.new(0, 1, 0)
                    espitemsr.AlwaysOnTop = true
                    espitemsr.StudsOffset = Vector3.new(0, 3, 0)
                    local textitemsr = Instance.new("TextLabel", espitemsr)
                    textitemsr.BackgroundTransparency = 1
                    textitemsr.Size = UDim2.new(0, 100, 0, 100)
                    textitemsr.TextSize = 15
                    textitemsr.Font = Enum.Font.SourceSansSemibold
                    textitemsr.TextColor3 = Color3.fromRGB(0,0,255)
                    textitemsr.TextStrokeTransparency = 0
                    textitemsr.Text = v.Name
                end
            end
        task.wait(0.3)
        end
    end)
    
    Section:NewToggle("Players Esp", "Misc", function(state)
        getgenv().espsr = state
        if getgenv().espsr == false then
            for i,v in ipairs(game.Players:GetChildren()) do
                if v.Character and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("GloEsp") then
                    v.Character.Head.GloEsp:Destroy()
                end
            end
            for i,v in ipairs(game.Players:GetChildren()) do
                if v.Character and v.Character:FindFirstChild("Torso") and v.Character.Torso:FindFirstChild("plresp") then
                    v.Character.Torso.plresp:Destroy()
                end
            end
        end
        while getgenv().espsr do
            for i, v in ipairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character.inMatch.Value == true and v.Character.Head:FindFirstChild("GloEsp") == nil then
                    GloEsp = Instance.new("BillboardGui", v.Character.Head)
                    GloEsp.Adornee = v.Character.Head
                    GloEsp.Name = "GloEsp"
                    GloEsp.Size = UDim2.new(0, 100, 0, 150)
                    GloEsp.StudsOffset = Vector3.new(0, 1, 0)
                    GloEsp.AlwaysOnTop = true
                    GloEsp.StudsOffset = Vector3.new(0, 3, 0)
                    GloExt = Instance.new("TextLabel", GloEsp)
                    GloExt.BackgroundTransparency = 1
                    GloExt.Size = UDim2.new(0, 100, 0, 100)
                    GloExt.TextSize = 17
                    GloExt.Font = Enum.Font.SourceSansSemibold
                    GloExt.TextColor3 = Color3.fromRGB(165,42,42)
                    GloExt.TextStrokeTransparency = 0
                    GloExt.Text = v.Glove.Value
                end
                if v ~= game.Players.Loaded and v.Character and v.Character:FindFirstChild("LeftLeg") and v.Character.inMatch.Value == true and v.Character.LeftLeg:FindFirstChild("Nametag1") == nil then
                    Nametag1 = Instance.new("BillboardGui", v.Character.LeftLeg)
                    Nametag1.Name = "Nametag1"
                    Nametag1.Size = UDim2.new(0, 100, 0, 100)
                    Nametag1.StudsOffset= Vector3.new(0, -1, -1)
                    Nametag1.AlwaysOnTop = true
                    GloEx1 = Instance.new("TextLabel", Nametag1)
                    GloEx1.BackgroundTransparency = 1
                    GloEx1.Size = UDim2.new(0, 100, 0, 100)
                    GloEx1.TextSize = 17
                    GloEx1.Font = Enum.Font.SourceSansSemibold
                    GloEx1.TextColor3 = Color3.fromRGB(238,201,0)
                    GloEx1.TextStrokeTransparency = 0
                    GloEx1.Text = v.Name
                end
            end
            for i, v in ipairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Torso") and v.Character.inMatch.Value == true and v.Character.Torso:FindFirstChild("plresp") == nil then
                    plresp = Instance.new("BoxHandleAdornment", v.Character.Torso)
                    plresp.Adornee = v.Character.Torso
                    plresp.ZIndex = 0
                    plresp.Size = Vector3.new(4, 5, 1)
                    plresp.Transparency = 0.65
                    plresp.Color3 = Color3.fromRGB(165,42,42)
                    plresp.AlwaysOnTop = true
                    plresp.Name = "plresp"
                end
            end
        task.wait(0.3)
        end
    end)
    
    local Section = Tab:NewSection("Teleport")
    
    Section:NewDropdown("Teleport", "Can Kicked", {"Farm", "Lighthouse", "Mountain", "River", "Market"}, function(waw)
        if waw == "Farm" then
        local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)
    local targetCFrame = CFrame.new(430.46283, 92.7780762, 316.353607)
    local tween = tweenService:Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = targetCFrame}
    )
    tween:Play()
    elseif waw == "Lighthouse" then
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)
    local targetCFrame = CFrame.new(303.358215, 149.871368, -578.09436, -0.0048140781, 0.00255327276, -0.999985158, -3.60583931e-06, 0.999996722, 0.00255331979, 0.999988437, 1.58763287e-05, -0.00481405389)
    local tween = tweenService:Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = targetCFrame}
    )
    tween:Play()
    elseif waw == "Mountain" then
    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)
    local targetCFrame = CFrame.new(-493.653381, 187.25943, 312.961243, -0.62376368, -0.00541838398, -0.781594157, -1.12927028e-05, 0.999975979, -0.00692330906, 0.781613052, -0.00430969195, -0.623748779)
    local tween = tweenService:Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        tweenInfo,
        {CFrame = targetCFrame}
    )
    tween:Play()
    elseif waw == "Market" then
    local targetCFrame = CFrame.new(-602.453308, 18.2658653, -466.985443, -0.347513348, 0.00378503045, 0.937667429, 4.47700927e-07, 0.999991834, -0.00403644657, -0.937675059, -0.00140229985, -0.347510517)
    local tween = game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(2, Enum.EasingStyle.Linear),
        {CFrame = targetCFrame}
    )
    tween:Play()
    elseif waw == "River" then
    local targetCFrame = CFrame.new(-92.1229095, 19.935112, -228.392212, 0.401422083, 1.88215288e-09, 0.915893197, -1.69204739e-08, 1, 5.36099565e-09, -0.915893197, -1.76493682e-08, 0.401422083)
    local tween = game:GetService("TweenService"):Create(
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(2, Enum.EasingStyle.Linear),
        {CFrame = targetCFrame}
    )
    tween:Play()
    end
    end)

    local Section = Tab:NewSection("Vote Kick Random Player")

    Section:NewButton("Vote Kick", "In Match", function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local otherPlayers = Players:GetPlayers()
        table.remove(otherPlayers, table.find(otherPlayers, LocalPlayer))
        if #otherPlayers > 0 then
          local randomPlayer = otherPlayers[math.random(1, #otherPlayers)]
          local randomPlayerName = randomPlayer.Name
          
          local args = {
            [1] = randomPlayerName,
            [2] = false,
            [3] = 2
          }
        
          game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Votekick"):FireServer(unpack(args))
        end
    end)


    local Section = Tab:NewSection("Unlock Lab")
    
    Section:NewButton("Unlock Lab And Get Chain Glove", "Misc", function()
        if game.Workspace.Map.CodeBrick.SurfaceGui:FindFirstChild("IMGTemplate") then
            fireclickdetector(workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
    game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "1st"
    game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "2nd"
    game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "3rd"
    game.Workspace.Map.CodeBrick.SurfaceGui.IMGTemplate.Name = "4th"
    end
    for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                        if v.Name == "1st" then
                            if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        first = "4"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        first = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        first = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        first = "9"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        first = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        first = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        first = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        first = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        first = "7"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        first = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        first = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        first = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        first = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        first = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        first = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        first = "2"
                    end
                        end
                    end
    for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                        if v.Name == "2nd" then
                            if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        second = "4"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        second = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        second = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        second = "9"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        second = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        second = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        second = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        second = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        second = "7"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        second = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        second = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        second = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        second = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        second = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        second = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        second = "2"
                    end
                        end
                    end
    for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                        if v.Name == "3rd" then
                            if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        third = "4"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        third = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        third = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        third = "9"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        third = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        third = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        third = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        third = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        third = "7"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        third = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        third = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        third = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        third = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        third = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        third = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        third = "2"
                    end
                        end
                    end
    for i,v in pairs(game.Workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
                        if v.Name == "4th" then
                            if v.Image == "http://www.roblox.com/asset/?id=9648769161" then
                        fourth = "4"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648765536" then
                        fourth = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648762863" then
                        fourth = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648759883" then
                        fourth = "9"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648755440" then
                        fourth = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648752438" then
                        fourth = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648749145" then
                        fourth = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648745618" then
                        fourth = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648742013" then
                        fourth = "7"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648738553" then
                        fourth = "8"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648734698" then
                        fourth = "2"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648730082" then
                        fourth = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648723237" then
                        fourth = "3"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648718450" then
                        fourth = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648715920" then
                        fourth = "6"
                    elseif v.Image == "http://www.roblox.com/asset/?id=9648712563" then
                        fourth = "2"
                    end
                        end
                    end
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Reset.ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[first].ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[second].ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[third].ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons[fourth].ClickDetector)
    wait(0.25)
    fireclickdetector(game.Workspace.Map.OriginOffice.Door.Keypad.Buttons.Enter.ClickDetector)
    end)
    
    local Section = Tab:NewSection("Leave Bus")
    
    Section:NewButton("Leave Bus", "Misc", function()
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BusJumping"):FireServer()
    end)
    
    local Tab = Window:NewTab("Antis")
    
    local Section = Tab:NewSection("No Knockback")
    
    Section:NewToggle("No Knockback", "No Knockback", function(state)
        getgenv().antiragdolsr = state
        if getgenv().antiragdolsr == false then
            game.Players.LocalPlayer.Character.Torso.Anchored = false
        end
        while getgenv().antiragdolsr do
            if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
                until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                game.Players.LocalPlayer.Character.Torso.Anchored = false
            end
        task.wait()
        end
    end)

    local Section =  Tab:NewSection("Anti Ice")

    Section:NewToggle("Anti Cube Of Ice, Glacier", "Anti", function(state)
        getgenv().antiicesr = state
        while getgenv().antiicesr do
            for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "Icecube" then
                        v:Destroy()
                        game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
                    end
               end
        task.wait()
        end
    end)
    
    local Section = Tab:NewSection("Anti Locked Lab")
    
    Section:NewToggle("Anti Locked Lab", "You can't get kicked", function(state)
        if state then
            workspace.Map.OriginOffice:WaitForChild("Antiaccess").CanTouch = false
        else
            workspace.Map.OriginOffice:WaitForChild("Antiaccess").CanTouch = true
        end
    end)
    
    local Section = Tab:NewSection("Anti Lava")
    
    Section:NewToggle("Anti Lava", "Antis", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "AntiLavaKYK"
    block.Size = Vector3.new(100, 1, 110) 
    block.Transparency = 0.5
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-240.93428, -29.1903477, 401.880219, 0.349086821, -0.0864096507, 0.933097899, 1.95710618e-06, 0.995739639, 0.0922098681, -0.937090397, -0.0321874209, 0.347599745) 
    block.Parent = game.Workspace
        else
    local block = game.Workspace:FindFirstChild("AntiLavaKYK")
    if block then
        block:Destroy()
    end
        end
    end)
    
    Section:NewToggle("Anti Lava 2.0", "Can Swim", function(state)
        if state then
            workspace.Map.DragonDepths.Lava.CanTouch = false
        else
            workspace.Map.DragonDepths.Lava.CanTouch = true
        end
    end)
    
    local Section = Tab:NewSection("Anti Acid")
    
    Section:NewToggle("Anti Acid", "Antis", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "AntiAcidKYK"
    block.Size = Vector3.new(200, 1, 200) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-64.6827164, 0.228857517, -711.446655, -0.91774404, -0.0017926431, 0.397168338, -6.40035691e-10, 0.999989808, 0.00451351237, -0.397172391, 0.004142249, -0.917734683)
    block.Parent = game.Workspace
        else
    local block = game.Workspace:FindFirstChild("AntiAcidKYK")
    if block then
        block:Destroy()
    end
        end
    end)
    
    Section:NewToggle("Anti Acid 2.0", "Can Swim", function(state)
        if state then
            workspace.Map.AcidAbnormality:GetChildren()[26].CanTouch = false
        else
            workspace.Map.AcidAbnormality:GetChildren()[26].CanTouch = true
        end
    end)
    
    local Section = Tab:NewSection("Remove Zone Blur")
    
    Section:NewButton("Remove Zone Blur", "Antis", function()
    local objects = game:GetService("ReplicatedStorage"):GetDescendants()
    local objects = game:GetService("ReplicatedStorage"):GetDescendants()
    for _, object in ipairs(objects) do
        if object.Name == "ZoneEffects" then
            object:Destroy()
        end
    end
    end)
    
    local Section = Tab:NewSection("Anti Void")
    
    Section:NewToggle("Anti Void", "You can't fall below water", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "AntiVoidSR"
    block.Size = Vector3.new(100000, 10, 100000) 
    block.Transparency = 0.5 
    block.CanCollide = true
    block.Anchored = true
    block.Position = Vector3.new(482.1156005859375, -159.50196838378906, -147.98330688476562)
    block.Parent = game.Workspace
    -----------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidSR2"
    block.Size = Vector3.new(100000, 10, 100000) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-674.9874267578125, -159.50196838378906, -263.7173156738281)
    block.Parent = game.Workspace
        else 
    local block = game.Workspace:FindFirstChild("AntiVoidSR")
    if block then
        block:Destroy()
    end
    -------
    local block = game.Workspace:FindFirstChild("AntiVoidSR2")
    if block then
        block:Destroy()
    end
        end
    end)
    
    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Speed Hack")
    
    Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("Jump Hack")
    
    Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Gravity Hack")
    
    Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 9020359053 then
    
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b0jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | SB Test Server", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)
    
    local Tab = Window:NewTab("Home")
    
    local Section = Tab:NewSection("Inf Yiedl")
    
    Section:NewButton("Inf Yield", "Home", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    
    local Section = Tab:NewSection("FreeCam :credit guy that exsitis")
    
    Section:NewButton("FreeCam", "Home", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/SB%20Freecam"))()
    end)
    
    local Section = Tab:NewSection("FreeCam(Mobile)")
    
    Section:NewButton("FreeCam(Mobile)", "Home", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Freecam", true))()
    end)
    
    local Section = Tab:NewSection("Dark Dex")
    
    Section:NewButton("Dark Dex", "Home", function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end)
    
    local Section = Tab:NewSection("ReJoin")
    
    Section:NewButton("ReJoin", "Home", function()
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
            game:GetService("RunService").RenderStepped:Connect(function()
                game:GetService("GuiService"):ClearError()
            end)
    game.CoreGui.RobloxLoadingGUI:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KykyryzoB/KykyryzoB-Hub-SB/main/KykryzoB.lua"))()
        ]])
    end
    game:GetService("TeleportService"):Teleport(9020359053)
    end)
    
    local Section = Tab:NewSection("Back To SB")
    
    Section:NewButton("Back To SB", "Home", function()
        game:GetService("TeleportService"):Teleport(6403373529)
    end)
    
    local Section = Tab:NewSection("SR Test Server")
    
    Section:NewButton("SR Test Server", "Home", function()
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
            game:GetService("RunService").RenderStepped:Connect(function()
                game:GetService("GuiService"):ClearError()
            end)
    game.CoreGui.RobloxLoadingGUI:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KykyryzoB/KykyryzoB-Hub-SB/main/KykryzoB.lua"))()
    spawn(function()
        while true do
            game:GetService("GuiService"):ClearError()
            game.CoreGui.RobloxLoadingGUI:Destroy()
            wait(1)
        end
    end)
        ]])
    end
    game:GetService("TeleportService"):Teleport(9412268818)
    end)
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 9412268818 then
        
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | SR Test Server", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)
    
    local Tab = Window:NewTab("Home")
    
    local Section = Tab:NewSection("Inf Yiedl")
    
    Section:NewButton("Inf Yield", "Home", function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)
    
    local Section = Tab:NewSection("FreeCam :credit guy that exsitis")
    
    Section:NewButton("FreeCam", "Home", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/SB%20Freecam"))()
    end)
    
    local Section = Tab:NewSection("FreeCam(Mobile)")
    
    Section:NewButton("FreeCam(Mobile)", "Home", function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/Freecam", true))()
    end)
    
    local Section = Tab:NewSection("Dark Dex")
    
    Section:NewButton("Dark Dex", "Home", function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()
    end)
    
    local Section = Tab:NewSection("ReJoin")
    
    Section:NewButton("ReJoin", "Home", function()
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
            game:GetService("RunService").RenderStepped:Connect(function()
                game:GetService("GuiService"):ClearError()
            end)
    game.CoreGui.RobloxLoadingGUI:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KykyryzoB/KykyryzoB-Hub-SB/main/KykryzoB.lua"))()
    spawn(function()
        while true do
            game:GetService("GuiService"):ClearError()
            game.CoreGui.RobloxLoadingGUI:Destroy()
            wait(1)
        end
    end)
        ]])
    end
    game:GetService("TeleportService"):Teleport(9412268818)
    end)
    
    local Section = Tab:NewSection("Back To SB")
    
    Section:NewButton("Back To SB", "Home", function()
        game:GetService("TeleportService"):Teleport(6403373529)
    end)
    
    local Section = Tab:NewSection("SB Test Server")
    
    Section:NewButton("SB Test Server", "Home", function()
        local teleportFunc = queueonteleport or queue_on_teleport or syn and syn.queue_on_teleport
    if teleportFunc then
        teleportFunc([[
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end
            repeat wait() until game.Players.LocalPlayer
            game:GetService("RunService").RenderStepped:Connect(function()
                game:GetService("GuiService"):ClearError()
            end)
    game.CoreGui.RobloxLoadingGUI:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KykyryzoB/KykyryzoB-Hub-SB/main/KykryzoB.lua"))()
        ]])
    end
    game:GetService("TeleportService"):Teleport(9020359053)
    end)
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 13833961666 then
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()

    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Window = Library.CreateLib("b00jkidd Hub | The Dark Realms", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)

    local Tab = Window:NewTab("Combat")

    local Section = Tab:NewSection("Auto Slap Bob")
    
    Section:NewToggle("Auto Slap Bob", "Antis", function(state)
        getgenv().autoslapboba = state
        while getgenv().autoslapboba do
            workspace:WaitForChild("bobBoss"):WaitForChild("DamageEvent"):FireServer()
        task.wait(0.1)
        end
    end)
    
    local Section = Tab:NewSection("Slap Aura")
    
    Section:NewToggle("Slap Aura", "ALL GLOVE | Mini bob, players", function(state)
        getgenv().slapminiboba = state
        while getgenv().slapminiboba do
                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Reaper" then
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "BobClone" then
                            game:GetService("ReplicatedStorage").ReaperHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Killstreak" then
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "BobClone" then
                            game:GetService("ReplicatedStorage").KSHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "God's Hand" then
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "BobClone" then
                            game:GetService("ReplicatedStorage").Godshand:FireServer(v:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Tycoon" then
                    for _, v in ipairs(workspace:GetDescendants()) do
                        if v.Name == "BobClone" then
                            game:GetService("ReplicatedStorage").GeneralHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
                        end
                    end
                elseif game.Players.LocalPlayer.leaderstats.Glove.Value == "Default" then
                    for _, v in ipairs(game.Players:GetPlayers()) do
                        if v ~= game.Players.LocalPlayer and v.Character then
                            if v.Character:FindFirstChild("Ragdolled").Value == false then
                                game.GetService("ReplicatedStorage").b:FireServer(v.Character:FindFirstChild("HumanoidRootPart"))
                            end
                        end
                    end
                end
        task.wait(0.25)
        end
    end)
    
    local Tab = Window:NewTab("Misc")
    
    local Section = Tab:NewSection("Auto Tycoon")
    
    Section:NewToggle("Auto Tycoon", "Antis", function(state)
        getgenv().autotyconbobboossing = state
        while getgenv().autotyconbobboossing do
                for i,v in pairs(workspace:GetDescendants()) do
                    if v.Name == "Click" and v:FindFirstChild("ClickDetector") then
                        fireclickdetector(v.ClickDetector)
                    end
                end
        task.wait(0.2)
        end
    end)
    
    local Tab = Window:NewTab("Anits")
    
    local Section = Tab:NewSection("Anti void")
    
    Section:NewToggle("Anti Void", "Antis", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "Anti Void Bob"
    block.Size = Vector3.new(2500, 16, 1140) 
    block.Transparency = 0.4
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(0, -8, -43, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    block.Parent = game.Workspace
        else
    local block = game.Workspace:FindFirstChild("Anti Void Bob")
    if block then
        block:Destroy()
    end
       end
    end)
    
    local Section = Tab:NewSection("Anti Ring")
    
    Section:NewToggle("Anti Ring", "Antis", function(state)
        getgenv().antiringsbob = state
        while getgenv().antiringsbob do
                local ring = game.Workspace:FindFirstChild("Ring")
                if ring then
                    ring:Destroy()
                end
        task.wait(0.2)
        end    
    end)

    local Section = Tab:NewSection("No Knockback")
    
    Section:NewToggle("No Knockback", "No Knockback", function(state)
        getgenv().antiragdoldr = state
        if getgenv().antiragdoldr == false then
            game.Players.LocalPlayer.Character.Torso.Anchored = false
        end
        while getgenv().antiragdoldr do
            if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
                repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
                until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                game.Players.LocalPlayer.Character.Torso.Anchored = false
            end
        task.wait()
        end
    end)
    
    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Speed Hack")
    
    Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("Jump Hack")
    
    Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Gravity Hack")
    
    Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 11828384869 then
        
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | Elude Maze", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)
    
    local Tab = Window:NewTab("Badge")
    
    local Section = Tab:NewSection("Get Counter")
    
    Section:NewButton("Get Counter", "Home", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-61.4113426, 4.67113781, -45.0443306, -0.0143145993, 0.00252397754, -0.999894321, -7.96703534e-06, 0.999996841, 0.00252435054, 0.99989748, 4.41164557e-05, -0.014314536)
    wait(0.3)
    fireclickdetector(game.Workspace.CounterLever.ClickDetector)
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(15.2456455, 4.49108553, -233.529053, -0.631848156, -0.00334048411, 0.775085032, -1.25992265e-05, 0.999990761, 0.00429952005, -0.775092185, 0.00270687975, -0.631842375)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 minutes and 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 minutes to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 59 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 58 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 57 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 56 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 55 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 54 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 53 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 52 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 51 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 50 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 49 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 48 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 47 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 46 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 45 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 44 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 43 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 42 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 41 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 40 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 39 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 38 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 37 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 36 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 35 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 34 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 33 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 32 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 31 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 30 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 29 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 28 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 27 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 26 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 25 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 24 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 23 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 22 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 21 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 20 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 19 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 18 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 17 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 16 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 15 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 14 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 13 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 12 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 11 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 10 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 9 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 8 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 7 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 6 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 5 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 4 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 3 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 2 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes and 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 minutes to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 59 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 58 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 57 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 56 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 55 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 54 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 53 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 52 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 51 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 50 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 49 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 48 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 47 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 46 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 45 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 44 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 43 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 42 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 41 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 40 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 39 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 38 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 37 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 36 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 35 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 34 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 33 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 32 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 31 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 30 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 29 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 28 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 27 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 26 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 25 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 24 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 23 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 22 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 21 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 20 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 19 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 18 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 17 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 16 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 15 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 14 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 13 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 12 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 11 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 10 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 9 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 8 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 7 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 6 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 5 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 4 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 3 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 2 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "You wait 1 second to receive.",Icon = "rbxassetid://7733656100",Duration = 0.1})
    wait(1)
    for i,v in pairs(workspace.Maze:GetDescendants()) do
    if v:IsA("ClickDetector") then
    fireclickdetector(v)
    end
    end
    end)
    
    local Section = Tab:NewSection("Get Elude")
    
    Section:NewButton("Get Elude", "Home", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-193.290787, 7.39999914, -130.307114, 0.454088956, 1.82432505e-08, 0.890956342, -2.14201332e-08, 1, -9.55894652e-09, -0.890956342, -1.4743792e-08, 0.454088956)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(84.8454437, 7.39999914, -201.827698, 0.694604456, -5.9176017e-08, 0.719391882, 4.9516661e-08, 1, 3.44478792e-08, -0.719391882, 1.16942349e-08, 0.694604456)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(218.528198, 7.39999914, 83.4171371, 0.655885577, 5.49275381e-09, 0.754860282, -1.8204565e-08, 1, 8.54112692e-09, -0.754860282, -1.9343906e-08, 0.655885577)
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(104.568184, 10.5492659, 194.721115, 0.990249932, -0.136891961, 0.0258003082, -0.0024311184, 0.168200076, 0.9857499, -0.139280856, -0.976201475, 0.166227311)
        wait(2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-502.335632, 14.2279472, -179.596512, 1, 0, 0, 0, -0.965929747, 0.258804798, 0, -0.258804798, -0.965929747)
    end)
    
    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Speed Hack")
    
    Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("Jump Hack")
    
    Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Gravity Hack")
    
    Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 14422118326 then
    
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | The Null Zone", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)
    
    local Tab = Window:NewTab("Badge")
    
    local Section = Tab:NewSection("Get Null")
    
    Section:NewButton("Get Null", "INFO", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.43311, 0.498345017, -584.62207, -0.999999344, 1.9935203e-07, -0.001146656, -2.33472383e-06, 0.999997556, 0.00221002498, 0.00114665367, 0.00221002637, -0.999996901)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.00195, -22.5011158, -531.456604, -0.97890377, -0.00139220862, -0.204317153, -1.07610222e-05, 0.999977112, -0.00676224614, 0.204321906, -0.00661738915, -0.978881419)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.84912, -137.501831, -208.114243, -0.999794722, -4.84930388e-05, 0.0202591848, -2.56677185e-06, 0.999997437, 0.00226720236, -0.0202592425, 0.00226668525, -0.999792159)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5459.13623, -137.534866, -16.2512455, -0.999803603, -7.01446479e-05, -0.0198170673, 1.12833516e-06, 0.999993503, -0.00359622552, 0.0198171902, -0.00359554123, -0.999797106)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5461.78418, -137.500931, 320.790985, -0.999628186, 2.68719824e-09, -0.027268026, -7.00493672e-14, 1, 9.855016e-08, 0.027268026, 9.85135173e-08, -0.999628186)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5457.24365, -138.53334, 552.417908, -0.992027462, 0.000627390749, 0.126020297, -1.96974838e-06, 0.999987543, -0.00499393977, -0.126021847, -0.00495437346, -0.992015123)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5465.92773, -137.50119, 775.386047, -0.999999702, -1.35602259e-11, 0.000742317818, 2.81569925e-16, 1, 1.82677908e-08, -0.000742317818, 1.82677873e-08, -0.999999702)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5446.07959, -187.535141, 1403.45264, -0.998518229, -0.000200719005, -0.0544176437, 9.64447963e-07, 0.999993145, -0.00370615674, 0.0544180125, -0.00370071735, -0.998511374)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5459.13184, -187.502777, 1839.21008, -0.982225895, -0.000504596625, 0.187701747, -3.92595393e-06, 0.999996483, 0.00266763126, -0.187702417, 0.00261947582, -0.982222438)
    wait(0.1)
    fireclickdetector(workspace.Model.Handle.ClickDetector)
    end)
    
    local Section = Tab:NewSection("Get Tinkerer")
    
    Section:NewButton("Get Tinkerer", "INFO", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.43311, 0.498345017, -584.62207, -0.999999344, 1.9935203e-07, -0.001146656, -2.33472383e-06, 0.999997556, 0.00221002498, 0.00114665367, 0.00221002637, -0.999996901)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.00195, -22.5011158, -531.456604, -0.97890377, -0.00139220862, -0.204317153, -1.07610222e-05, 0.999977112, -0.00676224614, 0.204321906, -0.00661738915, -0.978881419)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.84912, -137.501831, -208.114243, -0.999794722, -4.84930388e-05, 0.0202591848, -2.56677185e-06, 0.999997437, 0.00226720236, -0.0202592425, 0.00226668525, -0.999792159)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5459.13623, -137.534866, -16.2512455, -0.999803603, -7.01446479e-05, -0.0198170673, 1.12833516e-06, 0.999993503, -0.00359622552, 0.0198171902, -0.00359554123, -0.999797106)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5461.78418, -137.500931, 320.790985, -0.999628186, 2.68719824e-09, -0.027268026, -7.00493672e-14, 1, 9.855016e-08, 0.027268026, 9.85135173e-08, -0.999628186)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5457.24365, -138.53334, 552.417908, -0.992027462, 0.000627390749, 0.126020297, -1.96974838e-06, 0.999987543, -0.00499393977, -0.126021847, -0.00495437346, -0.992015123)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5465.92773, -137.50119, 775.386047, -0.999999702, -1.35602259e-11, 0.000742317818, 2.81569925e-16, 1, 1.82677908e-08, -0.000742317818, 1.82677873e-08, -0.999999702)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4922.79004, -212.500443, 801.610962, -0.997125506, -5.95130807e-08, -0.0757674426, -6.29570351e-08, 1, 4.30657821e-08, 0.0757674426, 4.77120814e-08, -0.997125506)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4839.9873, -212.534714, 801.233582, -0.174594268, 0.00196698541, 0.984638512, 1.7593112e-06, 0.999997973, -0.0019973577, -0.984640479, -0.000347001653, -0.174593911)
    wait(0.1)
    fireclickdetector(workspace:GetChildren()[13].Handle.ClickDetector)
    end)
    
    local Section = Tab:NewSection("Get Rob Plushe Artifact")
    
    Section:NewButton("Get Rob Plushe Artifact", "Artifact", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.43311, 0.498345017, -584.62207, -0.999999344, 1.9935203e-07, -0.001146656, -2.33472383e-06, 0.999997556, 0.00221002498, 0.00114665367, 0.00221002637, -0.999996901)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.00195, -22.5011158, -531.456604, -0.97890377, -0.00139220862, -0.204317153, -1.07610222e-05, 0.999977112, -0.00676224614, 0.204321906, -0.00661738915, -0.978881419)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5462.84912, -137.501831, -208.114243, -0.999794722, -4.84930388e-05, 0.0202591848, -2.56677185e-06, 0.999997437, 0.00226720236, -0.0202592425, 0.00226668525, -0.999792159)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5459.13623, -137.534866, -16.2512455, -0.999803603, -7.01446479e-05, -0.0198170673, 1.12833516e-06, 0.999993503, -0.00359622552, 0.0198171902, -0.00359554123, -0.999797106)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5461.78418, -137.500931, 320.790985, -0.999628186, 2.68719824e-09, -0.027268026, -7.00493672e-14, 1, 9.855016e-08, 0.027268026, 9.85135173e-08, -0.999628186)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5457.24365, -138.53334, 552.417908, -0.992027462, 0.000627390749, 0.126020297, -1.96974838e-06, 0.999987543, -0.00499393977, -0.126021847, -0.00495437346, -0.992015123)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5465.92773, -137.50119, 775.386047, -0.999999702, -1.35602259e-11, 0.000742317818, 2.81569925e-16, 1, 1.82677908e-08, -0.000742317818, 1.82677873e-08, -0.999999702)
    wait(0.1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5258.60449, -142.00119, 852.389954, -0.945539773, -7.77257494e-11, 0.325506628, -5.1091098e-10, 1, -1.24532296e-09, -0.325506628, -1.34380729e-09, -0.945539773)
    wait(0.1)
    fireclickdetector(workspace._ugcQuestObjectBobPlushie.ClickDetector)
    end)
    
    local Tab = Window:NewTab("Combat")
    
    local Section = Tab:NewSection("Remove CD")
    
    Section:NewButton("Remove CD", "Remove CD", function()
        local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
    while character.Humanoid.Health ~= 0 do
    local localscript = tool:FindFirstChildOfClass("LocalScript")
    local localscriptclone = localscript:Clone()
    localscriptclone = localscript:Clone()
    localscriptclone:Clone()
    localscript:Destroy()
    localscriptclone.Parent = tool
    wait(0.1)
    end
    end)
    
    local Section = Tab:NewSection("Anti Null")
    
    Section:NewToggle("Anti Null", "Anti NUll", function(state)
        getgenv().antinullnull = state
        while getgenv().antinullnull do
            for i,v in pairs(game.Workspace.Mobs:GetChildren()) do
                if v.Name == "Imp" and v:FindFirstChild("Body") then
                    game:GetService("ReplicatedStorage").b:FireServer(v.Body)
                end
            end
        task.wait()
        end
    end)
    
    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Speed Hack")
    
    Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("Jump Hack")
    
    Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Gravity Hack")
    
    Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 15507333474 then

    local bypass;
        bypass = hookmetamethod(game, "__namecall", function(method, ...) 
            if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
                return
            elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
                return
            end
            return bypass(method, ...)
        end)
    
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | CHRISTMAST EVENT", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)
    
    local Tab = Window:NewTab("Combat")
    
    local Section = Tab:NewSection("Slap Aura")
    
    Section:NewToggle("Slap Aura", "ToggleInfo", function(state)
        getgenv().slpaaurachrev = state
    
        while getgenv().slpaaurachrev do
            local asadas = game.Players.LocalPlayer.Character.Highlight.OutlineColor
            for i,v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and v.Character then
                    if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Ragdolled").Value == false and asadas ~= v.Character.Highlight.OutlineColor then
                        Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        if 25 >= Magnitude then
                            game:GetService("ReplicatedStorage"):WaitForChild("GeneralHit"):FireServer(v.Character:WaitForChild("HumanoidRootPart"))
                        end
                    end
                end
            end
        task.wait()
        end
    end)

    local Section = Tab:NewSection("Spam Snow Ball Players")

    Section:NewToggle("Spam Snow Ball", "Spam", function(state)
        getgenv().spamsnowball = state
        while true do
            for i, v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and v.Character then
                    local args = {
                        [1] = 250,
                        [2] = Vector3.new(151.39553833007812, 185.8904266357422, -108.95265197753906),
                        [3] = game.Players.baconsGood2138.Character.HumanoidRootPart.CFrame
                    }
                    
                    game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
                end
            end
        task.wait()
        end
    end)                    
    
    local Tab = Window:NewTab("Misc")
    
    local Section = Tab:NewSection("Farm Wins")
    
    Section:NewToggle("Farm Wins", ".", function(state)
        getgenv().autowinchev = state
        if getgenv.autowinchev == false then
            game.Players.LocalPlayer.Character.Torso.Anchored = false
        end
        while getgenv().autowinchev do
            game.Players.LocalPlayer.Character.Torso.Anchored = true
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(156.959579, 178.328217, -112.697945, 0.992797017, 0.112782016, -0.0404260047, 7.24666416e-09, 0.337422162, 0.94135344, 0.119808368, -0.934572875, 0.334991723)
        end
    end)
    
    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Speed Hack")
    
    Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("Jump Hack")
    
    Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Gravity Hack")
    
    Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })
    
    elseif game.PlaceId == 16034567693 then
            
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | The Staff Application", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)
    
    local Tab = Window:NewTab("Badge")
    
    local Section = Tab:NewSection("Get Admin Glove")
    
    Section:NewButton("Get Admin Glove", "Badge", function()
        for i,v in pairs(workspace.Bookshelf1:GetDescendants()) do
        if v.Name == "ClickDetector" and v.Parent.Name == "Part" then
            fireclickdetector(v)
        end
    end
    wait(0.5)
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "ClickDetector" and v.Parent.Name == "Handle" then
            fireclickdetector(v)
        end
    end
    wait(2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(31.3500423, 2.49999928, 12.7288008, -0.0847758502, 0, -0.996400058, 0, 1, 0, 0.996400058, 0, -0.0847758502)
    fireclickdetector(workspace["Vent Door"].Door.MainDoor.ClickDetector)
    wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(30.140276, 2.49999928, 34.3014908, -0.397125036, 4.0440078e-08, -0.917764544, -8.50526671e-09, 1, 4.77439812e-08, 0.917764544, 2.67661608e-08, -0.397125036)
    fireclickdetector(workspace.RouterButton.ClickDetector)
    wait(0.2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.198608756, 2.49999928, 29.279356, -0.999204934, 3.24340377e-08, -0.0398683101, 3.05463779e-08, 1, 4.79565223e-08, 0.0398683101, 4.67005599e-08, -0.999204934)
    fireclickdetector(workspace.Desk.TV.Model.LIGHT.ClickDetector)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Click",Text = "Click On Screen.",Icon = "rbxassetid://7734010488",Duration = 0.1})
    repeat
        task.wait(1)
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Click",
            Text = "Click On Screen.",
            Icon = "rbxassetid://7734010488",
            Duration = 0.1
        })
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.198608756, 2.49999928, 29.279356, -0.999204934, 3.24340377e-08, -0.0398683101, 3.05463779e-08, 1, 4.79565223e-08, 0.0398683101, 4.67005599e-08, -0.999204934)
    until not workspace.Cam:FindFirstChild("Red Light")
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(41.6063766, 4.26671219, 10.7726526, -0.0292965733, -2.90019653e-09, 0.999570787, -4.24763513e-09, 1, 2.77694734e-09, -0.999570787, -4.16445678e-09, -0.0292965733)
                    wait(0.3)
                    fireclickdetector(workspace["Vent Door"].Door.MainDoor.ClickDetector)
                    wait(0.3)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(123.199455, 4.58357811, 2.41061211, -0.0119421575, 4.16799786e-08, -0.999928713, 2.82191017e-08, 1, 4.13459276e-08, 0.999928713, -2.77233312e-08, -0.0119421575)
                    wait(0.3)
                    local tweenService = game:GetService("TweenService")
                    local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear)
                    local targetCFrame = CFrame.new(499.860291, 80.7709198, 61.2315979, 1, 0, 0, 0, 1, 0, 0, 0, 1)
                    local tween = tweenService:Create(
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
                        tweenInfo,
                        {CFrame = targetCFrame}
                    )
                    tween:Play()
                            wait(6)
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "Wait 1 Hours To Get.",Icon = "rbxassetid://7733656100",Duration = 10})
            wait(2800)
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "Wait 30 Minutes To Get.",Icon = "rbxassetid://7733656100",Duration = 10})
            wait(1500)
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Wait",Text = "Wait 5 Minutes To Get.",Icon = "rbxassetid://7733656100",Duration = 10})
    end)
    
    Section:NewButton("Get Admin Glove 2.0", "Get Admin 2.0", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(499.860291, 77.2709045, 60.5982056, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    end)
    
    local Tab = Window:NewTab("Misc")
    
    local Section = Tab:NewSection("Anti Afk")
    
    Section:NewButton("Anti Afk", "Misc", function()
            for i,v in next, getconnections(game.Players.LocalPlayer.Idled) do
    v:Disable() 
    end
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Good!",Text = "Anti AFK On.",Icon = "rbxassetid://125872930372680",Duration = 10})
    end)
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })

elseif game.PlaceId == 11520107397 then

    local bypass;
    bypass = hookmetamethod(game, "__namecall", function(method, ...) 
        if getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.Ban then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.AdminGUI then
            return
        elseif getnamecallmethod() == "FireServer" and method == game.ReplicatedStorage.WalkSpeedChanged then
            return
        end
        return bypass(method, ...)
    end)

    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | Slap-Battles KILLSTREAK-ONLY", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)

    local Tab = Window:NewTab("Combat")

    local Section = Tab:NewSection("Slap Aura")

    Section:NewToggle("Slap Aura", "Slap Aura", function(state)
        getgenv().slapauraksonly = state
        while getgenv().slapauraksonly do
            for i,v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
                    if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character.Ragdolled.Value == false then
                        if v.Character.Head:FindFirstChild("UnoReverseCard") == nil or game.Players.LocalPlayer.leaderstats.Glove.Value == "Error" then
                            Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                            if 25 >= Magnitude then
                                game:GetService("ReplicatedStorage"):WaitForChild("KSHit"):FireServer(v.Character:WaitForChild("HumanoidRootPart"),true)
                            end
                        end
                    end
                end
            end
        task.wait(0.2)
        end
    end)

    local Section = Tab:NewSection("Spam KS")

    Section:NewToggle("Spam Orb", "Need 75+ Kills", function(state)
        getgenv().spamorbks = state
        while getgenv().spamorbks do
            game:GetService("ReplicatedStorage").KSABILI:FireServer()
        wait(6.1)
        end
    end)

    Section:NewToggle("Spam The Force", "Need 250+ Kills", function(state)
        getgenv().spamtheforceks = state
            while getgenv().spamtheforceks do
                game:GetService("ReplicatedStorage"):WaitForChild("TheForce"):FireServer()
            task.wait()
            end
    end)

    local Section = Tab:NewSection("Spam Null")
    
    Section:NewToggle("Spam Null", "All Glove", function(state)
            getgenv().nullspamks = state
    
        while getgenv().nullspamks do
            game:GetService("ReplicatedStorage"):WaitForChild("NullAbility"):FireServer()
        task.wait(0.5)
        end
    end)
    
    local Section = Tab:NewSection("Spam Rhythm Explotion")
    
    Section:NewToggle("Spam Rhythm Explotion", "All Glove", function(state)
        getgenv().spamrhytmks = state
        while getgenv().spamrhytmks do
            local args = {
        [1] = "AoeExplosion",
        [2] = 42
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("rhythmevent"):FireServer(unpack(args))
    task.wait(0.1)
    end
    end)

    local Section = Tab:NewSection("Spam Rojo")

    Section:NewToggle("Spam Rojo", "All Glove", function(state)
        getgenv().spamrojosb = state
        while getgenv().spamrojosb do
            game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
        task.wait()
        end
    end)

    Section:NewTextBox("Spam Rojo Person", "All Glove", function(txt)
        if txt == "Me" or txt == "me" or txt == "Username" or txt == "" then
            Person = game.Players.LocalPlayer.Name
        else
            Person = txt
        end
    end)

    Person = game.Players.LocalPlayer.Name

    local Tab = Window:NewTab("Misc")

    local Section = Tab:NewSection("Remove Name Tag")
    
    Section:NewToggle("Remove NameTag", "Good For Video", function(state)
        getgenv().removenametag = state
        if getgenv().removenametag == false then
            game.Players.LocalPlayer.Character.Head.Nametag.Enabled = true
        end
        while getgenv().removenametag do
            game.Players.LocalPlayer.Character.Head.Nametag.Enabled = false
        task.wait(0.3)
        end
    end)

    local Tab = Window:NewTab("Antis")

    local Section = Tab:NewSection("Antis")
    
    Section:NewToggle("Anti Void", "Working on Map", function(state)
        if state then
    local block = Instance.new("Part")
    block.Name = "AntiVoid"
    block.Size = Vector3.new(265, 1, 1000) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(0, -9, 0)
    block.Parent = game.Workspace
    ---------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidPsycho"
    block.Size = Vector3.new(2000, 1, 1000) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(17800.9082, 2947, -226.017517, -0.248515129, 0.00487846136, -0.968615651, 0.966844261, -0.0594091415, -0.248359889, -0.0587562323, -0.998221755, 0.0100474358)
    block.Parent = game.Workspace
    ----------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoid2"
    block.Size = Vector3.new(500, 10, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true
    block.Anchored = true 
    block.Position = Vector3.new(200, -24, 0)
    block.Parent = game.Workspace
    ----------------------------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoid3"
    block.Size = Vector3.new(1000, 1, 48) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(150, -24, 0) 
    block.Parent = game.Workspace
    ----------------------------------------------------------------------------------------------------------------------------
    local block = workspace:FindFirstChild("AntiVoid3")
    if block then
        local rotationAngle = 90
        local rotationCFrame = CFrame.Angles(0, math.rad(rotationAngle), 0)
        block.CFrame = block.CFrame * rotationCFrame
    end
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro6"
    block.Size = Vector3.new(460, 3, 150) 
    block.Transparency = 0.5
    block.CanCollide = true
    block.Anchored = true 
    block.Position = Vector3.new(-27815.248, 162.506134, 4834.07471, -1.3038516e-07, -8.49145394e-08, 1, 2.64238391e-08, 1, 8.49145394e-08, -1, 2.64238498e-08, -1.3038516e-07)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro5"
    block.Size = Vector3.new(500, 3, 150) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-27965.0977, 35.1371307, 4834.51074, 1, 0, 0, 0, 1, 0, 0, 0, 1) 
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro4"
    block.Size = Vector3.new(1000, 5, 500) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true
    block.Position = Vector3.new(-28030.8477, -93.4633942, 4950.85986, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro3"
    block.Size = Vector3.new(100, 5, 1000) 
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true
    block.Position = Vector3.new(-28030.6484, -219.863602, 4836.85986, 0, 0, 1, 0, 1, -0, -1, 0, 0)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro2"
    block.Size = Vector3.new(1000, 2, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-16906.6445, 770.000549, 4719.68848, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidRetro"
    block.Size = Vector3.new(1000, 2, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true 
    block.Position = Vector3.new(-16874.8262, -7.55000019, 4799.2666)
    block.Parent = game.Workspace
    -------------------------------------------------------------------------------------------------
    local block = workspace:FindFirstChild("AntiVoid3")
    if block then
        local rotationAngle = 45
        local rotationCFrame = CFrame.Angles(math.rad(rotationAngle), 0, 0)
        block.CFrame = block.CFrame * rotationCFrame
    end
    --------------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoid4"
    block.Size = Vector3.new(265, 1, 1000) 
    block.Transparency = 0.5
    block.CanCollide = true 
    block.Anchored = true
    block.Position = Vector3.new(-135, -9, 0)
    block.Parent = game.Workspace
    -----------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoidBA"
    block.Size = Vector3.new(2000, 10, 2000)
    block.Transparency = 0.5 
    block.CanCollide = true 
    block.Anchored = true
    block.Position = Vector3.new(3500, 74.5, 0)
    block.Parent = game.Workspace
    -----------------------------------------------------------------------------------------------------
    local block = Instance.new("Part")
    block.Name = "AntiVoid5"
    block.Size = Vector3.new(300, 1, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true
    block.Anchored = true 
    block.Position = Vector3.new(-400, -30, 0)
    block.Parent = game.Workspace
    ----
    local block = Instance.new("Part")
    block.Name = "AntiVoid6"
    block.Size = Vector3.new(36, 1, 1000)
    block.Transparency = 0.5 
    block.CanCollide = true
    block.Anchored = true 
    block.CFrame = CFrame.new(-251.591003, -26.5025349, -35.90802, -4.37113883e-08, -1, 0, 1, -4.37113883e-08, 0, 0, 0, 1)
    block.Parent = game.Workspace
        else
    local block = game.Workspace:FindFirstChild("AntiVoid")
    if block then
        block:Destroy()
    end
    ----------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoid2")
    if block then
        block:Destroy()
    end
    -----------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoid3")
    if block then
        block:Destroy()
    end
    --------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoid4")
    if block then
        block:Destroy()
    end
    --------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidBA")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro6")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro5")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro4")
    if block then
        block:Destroy()
    end
    -------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro3")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidPsycho")
    if block then
        block:Destroy()
    end
    ------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro2")
    if block then
        block:Destroy() 
    end
    -------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoidRetro")
    if block then
        block:Destroy()
    end
    --------------------------------------------------------------------------------------------
    local block = game.Workspace:FindFirstChild("AntiVoid5")
    if block then
        block:Destroy()
    end
    ---
    local block = game.Workspace:FindFirstChild("AntiVoid6")
    if block then
        block:Destroy()
    end
        end
    end)

    Section:NewToggle("Anti Void 2.0", "You Bob?", function(state)
        if state then
            local workspace = game:GetService("Workspace")
local antivoidKYK = Instance.new("Part", workspace)
antivoidKYK.CanCollide = true
antivoidKYK.Anchored = true
antivoidKYK.CFrame = CFrame.new(23.2798462, -19.8447475, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
antivoidKYK.Name = "antivoidKYK"
antivoidKYK.Transparency = 0.5
local antivoidKYK2 = Instance.new("Part", workspace)
antivoidKYK2.CanCollide = true
antivoidKYK2.Anchored = true
antivoidKYK2.CFrame = CFrame.new(-458.458344, -9.25, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK2.Size = Vector3.new(1139.2593994140625, 1.5, 2048)
antivoidKYK2.Name = "antivoidKYK2"
antivoidKYK2.Transparency = 0.5
local antivoidKYK3 = Instance.new("Part", workspace)
antivoidKYK3.CanCollide = true
antivoidKYK3.Anchored = true
antivoidKYK3.CFrame = CFrame.new(-690.65979, 47.25, 1.83554196, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK3.Size = Vector3.new(674.8563232421875, 0.6048492789268494, 2048)
antivoidKYK3.Name = "antivoidKYK3"
antivoidKYK3.Transparency = 0.5
local antivoidKYK4 = Instance.new("Part", workspace)
antivoidKYK4.CanCollide = true
antivoidKYK4.Anchored = true
antivoidKYK4.CFrame = CFrame.new(402.964996, 29.25, 222.310089, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK4.Size = Vector3.new(379.88922119140625, 1.5, 160.8837127685547)
antivoidKYK4.Name = "antivoidKYK4"
antivoidKYK4.Transparency = 0.5
local antivoidKYK6 = Instance.new("Part", workspace)
antivoidKYK6.CanCollide = true
antivoidKYK6.Anchored = true
antivoidKYK6.CFrame = CFrame.new(178.719162, -18.9417267, 1.83554196, -0.989596844, -0.143868446, 0, 0.143868446, -0.989596844, 0, 0, 0, 1)
antivoidKYK6.Size = Vector3.new(143.94830322265625, 1.5, 2048)
antivoidKYK6.Name = "antivoidKYK6"
antivoidKYK6.Transparency= 0.5
local antivoidKYK7 = Instance.new("Part", workspace)
antivoidKYK7.CanCollide = true
antivoidKYK7.Anchored = true
antivoidKYK7.CFrame = CFrame.new(-309.152832, 15.4761791, 1.83554196, -0.816968799, -0.576681912, 0, 0.576681912, -0.816968799, 0, 0, 0, 1)
antivoidKYK7.Size = Vector3.new(110.13511657714844, 2.740000009536743, 2048)
antivoidKYK7.Name = "antivoidKYK7"
antivoidKYK7.Transparency = 0.5
local antivoidKYK8 = Instance.new("Part", workspace)
antivoidKYK8.CanCollide = true
antivoidKYK8.Anchored = true
antivoidKYK8.CFrame = CFrame.new(174.971924, 5.34897423, 222.310089, -0.838688731, 0.544611216, 0, -0.544611216, -0.838688731, 0, 0, 0, 1)
antivoidKYK8.Size = Vector3.new(89.76103210449219, 1.5, 160.8837127685547)
antivoidKYK8.Name = "antivoidKYK8"
antivoidKYK8.Transparency = 0.5
local antivoidKYK9 = Instance.new("Part", workspace)
antivoidKYK9.CanCollide = true
antivoidKYK9.Anchored = true
antivoidKYK9.CFrame = CFrame.new(402.965027, 5.49165154, 74.8157959, 2.98023224e-05, -1.14142895e-05, -1, -0.668144584, -0.744031429, -1.14142895e-05, -0.744031489, 0.668144584, -2.98023224e-05)
antivoidKYK9.Size = Vector3.new(74.23055267333984, 1, 379.88922119140625)
antivoidKYK9.Name = "antivoidKYK9"
antivoidKYK9.Transparency = 0.5
local antivoidKYK10 = Instance.new("Part", workspace)
antivoidKYK10.CanCollide = true
antivoidKYK10.Anchored = true
antivoidKYK10.CFrame = CFrame.new(402.964996, 29.9136467, 121.981705, -1, 0, 0, 0, -1, 0, 0, 0, 1)
antivoidKYK10.Size = Vector3.new(379.88922119140625, 1.5, 39.77305603027344)
antivoidKYK10.Name = "antivoidKYK10"
antivoidKYK10.Transparency = 0.5
local antivoidKYK11 = Instance.new("WedgePart", workspace)
antivoidKYK11.CanCollide = true
antivoidKYK11.Anchored = true
antivoidKYK11.CFrame = CFrame.new(134.084229, -17.8583984, 94.3953705, 0.541196942, -0.354067981, 0.762719929, -0.840263784, -0.192543149, 0.506837189, -0.0325982571, -0.915184677, -0.401714325)
antivoidKYK11.Size = Vector3.new(1, 88.66793823242188, 34.42972946166992)
antivoidKYK11.Name = "antivoidKYK11"
antivoidKYK11.Transparency = 0.5
local antivoidKYK12 = Instance.new("WedgePart", workspace)
antivoidKYK12.CanCollide = true
antivoidKYK12.Anchored = true
antivoidKYK12.CFrame = CFrame.new(168.441879, 2.46393585, 125.815231, -0.350553155, -0.534268022, 0.769201458, -0.198098332, 0.845035911, 0.496660322, -0.915352523, 0.0217281878, -0.402067661)
antivoidKYK12.Size = Vector3.new(1, 0.9999924302101135, 82.1865463256836)
antivoidKYK12.Name = "antivoidKYK12"
antivoidKYK12.Transparency = 0.5
local antivoidKYK13 = Instance.new("WedgePart", workspace)
antivoidKYK13.CanCollide = true
antivoidKYK13.Anchored = true
antivoidKYK13.CFrame = CFrame.new(206.315063, 26.9295502, 105.471031, 0.534210563, -0.415855825, -0.73599112, -0.845072925, -0.285055399, -0.452321947, -0.021697551, 0.863601387, -0.503708005)
antivoidKYK13.Size = Vector3.new(1, 13.53612232208252, 9.847718238830566)
antivoidKYK13.Name = "antivoidKYK13"
antivoidKYK13.Transparency = 0.5
local antivoidKYK14 = Instance.new("WedgePart", workspace)
antivoidKYK14.CanCollide = true
antivoidKYK14.Anchored = true
antivoidKYK14.CFrame = CFrame.new(165.965088, 2.12955856, 77.8575592, -0.53421092, -0.415855944, 0.735991359, 0.845073164, -0.285055757, 0.452322066, 0.0216975808, 0.863601625, 0.503708005)
antivoidKYK14.Size = Vector3.new(1, 13.53612232208252, 99.8001480102539)
antivoidKYK14.Name = "antivoidKYK14"
antivoidKYK14.Transparency = 0.5
local antivoidKYK15 = Instance.new("WedgePart", workspace)
antivoidKYK15.CanCollide = true
antivoidKYK15.Anchored = true
antivoidKYK15.CFrame = CFrame.new(172.67041, 5.49164963, 74.8157959, -4.58955765e-05, 2.05039978e-05, 1, 0.743987858, 0.668193102, 2.05039978e-05, -0.668193102, 0.743987858, -4.58955765e-05)
antivoidKYK15.Size = Vector3.new(1, 74.23055267333984, 80.699951171875)
antivoidKYK15.Name = "antivoidKYK15"
antivoidKYK15.Transparency = 0.5
local antivoidKYK16 = Instance.new("WedgePart", workspace)
antivoidKYK16.CanCollide = true
antivoidKYK16.Anchored = true
antivoidKYK16.CFrame = CFrame.new(212.753906, 30.0632439, 121.981705, -0.283976078, -0.95883137, 0, 0.95883137, -0.283976078, 0, 0, 0, 1)
antivoidKYK16.Size = Vector3.new(1, 0.8520558476448059, 39.773048400878906)
antivoidKYK16.Name = "antivoidKYK16"
antivoidKYK16.Transparency = 0.5
local antivoidKYK17 = Instance.new("WedgePart", workspace)
antivoidKYK17.CanCollide = true
antivoidKYK17.Anchored = true
antivoidKYK17.CFrame = CFrame.new(212.884216, 30.1233234, 121.984734, 0.544644356, 0.33412537, -0.769235253, -0.838644743, 0.223680317, -0.496630788, 0.00612583756, 0.915602207, 0.402038693)
antivoidKYK17.Size = Vector3.new(1, 36.08900451660156, 16.739320755004883)
antivoidKYK17.Name = "antivoidKYK17"
antivoidKYK17.Transparency = 0.5
local antivoidKYK18 = Instance.new("WedgePart", workspace)
antivoidKYK18.CanCollide = true
antivoidKYK18.Anchored = true
antivoidKYK18.CFrame = CFrame.new(174.83577, 5.55865097, 141.871262, -0.544644356, 0.33412537, 0.769235253, 0.838644743, 0.223680317, 0.496630788, -0.00612583756, 0.915602207, -0.402038693)
antivoidKYK18.Size = Vector3.new(1, 36.08900451660156, 82.1865463256836)
antivoidKYK18.Name = "antivoidKYK18"
antivoidKYK18.Transparency = 0.5
local antivoidKYK19 = Instance.new("WedgePart", workspace)
antivoidKYK19.CanCollide = true
antivoidKYK19.Anchored = true
antivoidKYK19.CFrame = CFrame.new(165.427338, 2.97219658, 77.884697, -0.541196942, -0.354067981, -0.762719929, 0.840263784, -0.192543149, -0.506837189, 0.0325982571, -0.915184677, 0.401714325)
antivoidKYK19.Size = Vector3.new(1, 88.66793823242188, 47.76289749145508)
antivoidKYK19.Name = "antivoidKYK19"
antivoidKYK19.Transparency = 0.5
local block = Instance.new("Part")
block.Name = "AntiVoidRetro6KYK"
block.Size = Vector3.new(460, 3, 150) 
block.Transparency = 0.5
block.CanCollide = true
block.Anchored = true 
block.Position = Vector3.new(-27815.248, 162.506134, 4834.07471, -1.3038516e-07, -8.49145394e-08, 1, 2.64238391e-08, 1, 8.49145394e-08, -1, 2.64238498e-08, -1.3038516e-07)
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetro5KYK"
block.Size = Vector3.new(500, 3, 150) 
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true 
block.Position = Vector3.new(-27965.0977, 35.1371307, 4834.51074, 1, 0, 0, 0, 1, 0, 0, 0, 1) 
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetro4KYK"
block.Size = Vector3.new(1000, 5, 500) 
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true
block.Position = Vector3.new(-28030.8477, -93.4633942, 4950.85986, -1.1920929e-07, 0, -1.00000012, 0, 1, 0, 1.00000012, 0, -1.1920929e-07)
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetro3KYK"
block.Size = Vector3.new(100, 5, 1000) 
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true
block.Position = Vector3.new(-28030.6484, -219.863602, 4836.85986, 0, 0, 1, 0, 1, -0, -1, 0, 0)
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetro2KYK"
block.Size = Vector3.new(1000, 2, 1000)
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true 
block.Position = Vector3.new(-16906.6445, 770.000549, 4719.68848, 1, 0, 0, 0, 1, 0, 0, 0, 1)
block.Parent = game.Workspace
-------------------------------------------------------------------------------------------------
local block = Instance.new("Part")
block.Name = "AntiVoidRetroKYK"
block.Size = Vector3.new(1000, 2, 1000)
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true 
block.Position = Vector3.new(-16874.8262, -7.55000019, 4799.2666)
block.Parent = game.Workspace
local block = Instance.new("Part")
block.Name = "AntiVoidPsychoKYK"
block.Size = Vector3.new(2000, 1, 1000) 
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true 
block.Position = Vector3.new(17800.9082, 2947, -226.017517, -0.248515129, 0.00487846136, -0.968615651, 0.966844261, -0.0594091415, -0.248359889, -0.0587562323, -0.998221755, 0.0100474358)
block.Parent = game.Workspace
local block = Instance.new("Part")
block.Name = "AntiVoidBAKYK"
block.Size = Vector3.new(2000, 10, 2000)
block.Transparency = 0.5 
block.CanCollide = true 
block.Anchored = true
block.Position = Vector3.new(3500, 74.5, 0)
block.Parent = game.Workspace
        else
            local antivoidList = {
                "antivoidKYK",
                "AntiVoidPsychoKYK",
                "AntiVoidRetro2KYK",
                "AntiVoidRetro3KYK",
                "AntiVoidRetro4KYK",
                "AntiVoidRetro5KYK",
                "AntiVoidRetro6KYK",
                "AntiVoidBAKYK",
                "AntiVoidRetroKYK",
                "antivoidKYK2",
                "antivoidKYK3",
                "antivoidKYK4",
                "antivoidKYK6",
                "antivoidKYK7",
                "antivoidKYK8",
                "antivoidKYK9",
                "antivoidKYK10",
                "antivoidKYK11",
                "antivoidKYK12",
                "antivoidKYK13",
                "antivoidKYK14",
                "antivoidKYK15",
                "antivoidKYK16",
                "antivoidKYK17",
                "antivoidKYK18",
                "antivoidKYK19"
            }
            
            for _, antivoidName in ipairs(antivoidList) do
                local block = game.Workspace:FindFirstChild(antivoidName)
                if block then
                    block:Destroy()
                end
            end
        end
    end)
    
    Section:NewToggle("No Knockback", "Character Reset", function(state)
        getgenv().antiragdolsb = state
            if getgenv().antiragdolsb then
                game.Players.LocalPlayer.Character.Humanoid.Health = 0
                game.Players.LocalPlayer.CharacterAdded:Connect(function()
                    game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
                        if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and getgenv().antiragdolsb then
                            repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
                            until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
                            game.Players.LocalPlayer.Character.Torso.Anchored = false
                        end
                    end)
                end)
            end
    end)

    Section:NewToggle("Anti Cube Of Death", "Antis", function(state)
        if state then
            workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
        else
            workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
        end
    end)

    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Speed Hack")
    
    Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("Jump Hack")
    
    Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Gravity Hack")
    
    Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })

elseif game.PlaceId == 17290438723 then

    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | Ice Trails", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)

    local Tab = Window:NewTab("Badge")

    local Section = Tab:NewSection("Get FrostBite Glove")

    Section:NewButton("Get FrostBite Glove", "Badge", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-554, 177, 56)
wait(0.7)
for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                v.HoldDuration = 0
            end
        end
       wait(0.5)
       for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v.ClassName == "ProximityPrompt" then
                fireproximityprompt(v)
            end
        end
    end)

    Library:ToggleUIGui({
        Icons = "rbxassetid://16393121436",
        Rainbow = true
    })

    elseif game.PlaceId == 18550498098 then

        local safeport = Instance.new("Part", Workspace)
        safeport.Name = "SafePort15"
        safeport.Size = Vector3.new(2000, 10, 2000) 
        safeport.Transparency = 0.5 
        safeport.CanCollide = true
        safeport.Anchored = true
        safeport.CFrame = CFrame.new(595, 120, -330)

    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | The Guide Boss Fight", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)

    local Tab = Window:NewTab("Combat")

    local Section = Tab:NewSection("Auto Slap")

    Section:NewToggle("Auto Slap Golem", ".", function(state)
        getgenv().autoslapgolem = state
        while getgenv().autoslapgolem do
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then 
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Lantern) 
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then 
                ----
            end
            for i,v in pairs(game.workspace:GetChildren()) do
                if v.Name == "golem" and v:FindFirstChild("Hitbox") then
                    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
                    local args = {
                        [1] = "Hit",
                        [2] = v.Hitbox
                    }
            
                    game.Players.LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
                end
            end
        task.wait()
        end
    end)

    Section:NewToggle("Auto Slap Track", ".", function(state)
        getgenv().autoslaptrack = state
        while getgenv().autoslaptrack do
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then 
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Lantern) 
            end
            if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then 
                ----
            end
            for i,v in pairs(game.workspace:GetChildren()) do
                if v.Name == "TrackGloveMissile" then
                    game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
                    local args = {
                        [1] = "Hit",
                        [2] = v
                    }
            
                    game.Players.LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
                end
            end
        task.wait()
        end
    end)

    Section:NewToggle("Auto Slap Replica NPC", "/", function(state)
        getgenv().autoslapreplicanpc = state
        while getgenv().autoslapreplicanpc do
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then 
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Lantern) 
        end
        if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then 
            ----
        end
        for i,v in pairs(game.workspace:GetChildren()) do
            if v.Name == "ReplicaNPC" and v:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
                local args = {
                    [1] = "Hit",
                    [2] = v.HumanoidRootPart
                }
        
                game.Players.LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
            end
        end
        task.wait()
    end
end)

Section:NewToggle("Auto Slap Guide", "/", function(state)
    getgenv().autoslapguide = state
    while getgenv().autoslapguide do
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern") then 
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Lantern) 
        end
        if game.Players.LocalPlayer.Character:FindFirstChild("Lantern") then 
            ----
        end
        for i,v in pairs(game.workspace:GetChildren()) do
            if v.Name == "GuideNPC" and v:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate()
                local args = {
                    [1] = "Hit",
                    [2] = v.HumanoidRootPart
                }
        
                game.Players.LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
            end
        end
    task.wait()
    end
end)

local Tab = Window:NewTab("Misc")

local Section = Tab:NewSection("Teloport")

Section:NewButton("Get 4 HP", "/", function()
    ogl = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3271.42334, -218.088181, 822.746155, -0.994649589, 0.00018143536, 0.103305899, -8.53231885e-09, 0.99999845, -0.00175637181, -0.103306055, -0.00174697535, -0.994648099)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ogl
end)

Section:NewButton("Get Regeneration", "/", function()
    ogl = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3286.16675, -67.2077789, 823.898865, -0.98922509, -0.00276089297, 0.146376535, 9.32137123e-09, 0.99982214, 0.0188582912, -0.146402568, 0.0186550952, -0.989049196)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ogl
end)

Section:NewButton("TP to lever", "/", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3267.97485, -72.9661789, 823.711304, -0.00727955392, 0.085996896, -0.996268809, 8.27937185e-09, 0.996295214, 0.0859991759, 0.999973476, 0.000626027409, -0.00725258561)
end)

Section:NewButton("Tp to SafePort", ".", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(595, 122, -330)
end)

local Tab = Window:NewTab("Player")
    
local Section = Tab:NewSection("Speed Hack")

Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
end)

Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

local Section = Tab:NewSection("Jump Hack")

Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
end)

Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

local Section = Tab:NewSection("Gravity Hack")

Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
    workspace.Gravity = txt
end)

Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
    workspace.Gravity = s
end)

Library:ToggleUIGui({
      Icons = "rbxassetid://16393121436",
      Rainbow = true
})

elseif game.PlaceId == 18698003301 then

    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Welcome!",Text = "Welcome to Hub b00jkidd.",Icon = "rbxassetid://7733960981",Duration = 10})
    
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Kavo.lua"))()
    
    local Window = Library.CreateLib("b00jkidd Hub | Slap League", "LightTheme")
    
    local Tab = Window:NewTab("INFO")
    
    local Section = Tab:NewSection("Creator")
    
    Section:NewButton("Click to copy", "if you have bug and ideas dm me", function()
        setclipboard('overseerplayscaptainreal')
    end)
    
    local Section = Tab:NewSection("Creator UI and Helper with function")
    
    Section:NewButton("Giangplay", "INFO", function()
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Creator UI",Text = "Giangplay.",Icon = "rbxassetid://7733955511",Duration = 10})
    end)
    
    local Section = Tab:NewSection("Discord Server")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard('https://discord.gg/TjSpKFNnN3')
    end)
    
    local Section = Tab:NewSection("Telegram")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://t.me/Kykyryz0B")
    end)
    
    local Section = Tab:NewSection("Youtube")
    
    Section:NewButton("Click to copy", "INFO", function()
        setclipboard("https://www.youtube.com/channel/UCgqxZ4MrGPp13dlZyotp_fQ")
    end)

    local Tab = Window:NewTab("Combat")

    local Section = Tab:NewSection("Auto Slap")

    Section:NewToggle("Auto Slap Players", ".", function(state)
        getgenv().autoslapplayers = state
        while getgenv().autoslapplayers do
            for i, v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and v.Character then
                    local args = {
                        [1] = v.Character:FindFirstChild("Right Arm"),
                        [2] = Vector3.new(0.5891937017440796, 0.6427874565124512, -0.4895661175251007)
                    }
                    
                    game:GetService("ReplicatedStorage").remotes.Slap:FireServer(unpack(args))
                end
            end
        task.wait()
        end
    end)  
    
    local Tab = Window:NewTab("Antis")

    local Section = Tab:NewSection("Antis")
    
    Section:NewToggle("Anti Void", "Working on Map", function(state)
        if state then
            local void = Instance.new("Part", workspace)
            void.Name = "bruhhhh"
            void.Size = Vector3.new(2000, 1, 2000)
            void.Transparency = 0.5 
            void.CanCollide = true 
            void.Anchored = true
            void.CFrame = CFrame.new(-119, -1.249996185, 62.75, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            void.Parent = game.Workspace

        else
            if workspace:FindFirstChild("bruhhhh") then
                workspace.bruhhhh:Destroy()
            end
        end
    end)

    local Tab = Window:NewTab("Player")
    
    local Section = Tab:NewSection("Speed Hack")
    
    Section:NewTextBox("Speed Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = txt
    end)
    
    Section:NewSlider("Speed Hack", "SliderInfo", 500, 20, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)
    
    local Section = Tab:NewSection("Jump Hack")
    
    Section:NewTextBox("Jump Hack", "TextboxInfo", function(txt)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = txt
    end)
    
    Section:NewSlider("Jump Hack", "SliderInfo", 500, 50, function(s)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)
    
    local Section = Tab:NewSection("Gravity Hack")
    
    Section:NewTextBox("Gravity Hack", "TextboxInfo", function(txt)
        workspace.Gravity = txt
    end)
    
    Section:NewSlider("Gravity Hack", "SliderInfo", 500, 0, function(s)
        workspace.Gravity = s
    end)
    
    Library:ToggleUIGui({
          Icons = "rbxassetid://16393121436",
          Rainbow = true
    })

    else
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error",Text = "You're in the wrong game. The right game is called Slap Battles..",Icon = "rbxassetid://125872930372680",Duration = 10})
    end

 loadstring(game:HttpGet("https://raw.githubusercontent.com/KykyryzoB/Others-Script/main/SB%20Other.lua"))()