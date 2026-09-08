--[[
  _                        __                                             _       _       
 | |                      / /                                            (_)     | |      
 | |_   _ __ ___   ___   / /_ _ _ __ ___ ___ _   _ _____  _____  ___ _ __ _ _ __ | |_ ___ 
 | __| | '_ ` _ \ / _ \ / / _` | '__/ __/ _ \ | | / __\ \/ / __|/ __| '__| | '_ \| __/ __|
 | |_ _| | | | | |  __// / (_| | | | (_|  __/ |_| \__ \>  <\__ \ (__| |  | | |_) | |_\__ \
  \__(_)_| |_| |_|\___/_/ \__,_|_|  \___\___|\__,_|___/_/\_\___/\___|_|  |_| .__/ \__|___/
                                                                           | |            
                                                                           |_|            
]]
if game.GameId == 4019583467 then
    local Library =
        loadstring(
        game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau")
    )()
    local SaveManager =
        loadstring(
        game:HttpGetAsync(
            "https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"
        )
    )()
    local InterfaceManager =
        loadstring(
        game:HttpGetAsync(
            "https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"
        )
    )()
    local Window =
        Library:CreateWindow {
        Title = "Be NPC or Die",
        SubTitle = "by Bac0nH1ckOff | t.me/arceusxscripts",
        TabWidth = 160,
        Size = UDim2.fromOffset(830, 525),
        Resize = true,
        MinSize = Vector2.new(470, 380),
        Acrylic = true,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.LeftControl
    }

    local players = game:GetService("Players")
    local plr = players.LocalPlayer

    local function getCharacter()
        local char = plr.Character or plr.CharacterAdded:Wait()
        local humPart = char:WaitForChild("HumanoidRootPart", 5)
        return char, humPart
    end

    local char, humPart = getCharacter()

    plr.CharacterAdded:Connect(
        function()
            char, humPart = getCharacter()
            char:WaitForChild("Humanoid").UseJumpPower = true
        end
    )

    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")
    local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
    local Lighting = game:GetService("Lighting")

    if queueteleport then
        local TeleportCheck = false
        plr.OnTeleport:Connect(function(State)
            if queueteleport and (not TeleportCheck) then
                TeleportCheck = true
                queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/BeNpcOrDie'))()")
            end
        end)
    end

    if game.PlaceId == 11276071411 then
        local Tabs = {
            Main = Window:CreateTab {
                Title = "Main",
                Icon = "house"
            },
            Farm = Window:CreateTab {
                Title = "Farm",
                Icon = "circle-dollar-sign"
            },
            Player = Window:CreateTab {
                Title = "Player",
                Icon = "person-standing"
            },
            Stats = Window:CreateTab {
                Title = "Players Stats",
                Icon = "chart-no-axes-column"
            },
            Settings = Window:CreateTab {
                Title = "Settings",
                Icon = "settings"
            }
        }
        local Options = Library.Options

        local collect = workspace:FindFirstChild("CollectableItems")

        local function serverHop()
            local servers = {}
            local req = request({
                Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true",
                Method = "GET"
            })
        
            if req.StatusCode == 200 then
                local body = HttpService:JSONDecode(req.Body)
                if body and body.data then
                    for _, server in ipairs(body.data) do
                        if server.playing < server.maxPlayers and server.id ~= game.JobId then
                            table.insert(servers, server.id)
                        end
                    end
                end
            else
                warn("Failed to fetch server list: " .. req.StatusMessage)
            end
        
            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], plr)
            else
                warn("No suitable servers found")
            end
        end

        local farmToggle = Tabs.Farm:CreateToggle("farmToggle", {Title = "Cash Farm", Default = false})

        farmToggle:OnChanged(function ()
            while Options.farmToggle.Value do
                pcall(function ()
                    for _, p in ipairs(collect:GetChildren()) do
                        if not Options.farmToggle.Value then break end
                        if not p:GetAttribute("CannotSee") then
                            humPart.CFrame = p.CFrame
                            wait(.5)
                            local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                            if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
                        end
                        wait(1)
                    end
                end)
                wait(.5)
            end
        end)

        local resetParagraph = Tabs.Farm:CreateParagraph("Reset", {
            Title = "Auto Reset:",
            Content = ""
        })
        
        local full = Tabs.Farm:CreateToggle("full", { Title = "Reset if the Bag is Full", Default = false })
        local sheriff  = Tabs.Farm:CreateToggle("sheriff", { Title = "Reset if You are a Sheriff", Default = false })
        
        full:OnChanged(function ()
            local bag = plr.PlayerGui:WaitForChild("Timer"):WaitForChild("Frame"):WaitForChild("Bags"):WaitForChild("CashBag"):WaitForChild("Bag"):WaitForChild("AmountCollected")
            while Options.full.Value do
                if bag and Options.farmToggle.Value then
                    if bag.Text == "FULL!" and plr.Team and plr.Team.Name == "Criminals" then
                        local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                        if humanoid then humanoid.Health = 0 end
                    end
                end
                wait(1)
            end
        end)

        sheriff:OnChanged(function ()
            while Options.sheriff.Value do
                if plr.Team and plr.Team.Name == "Sheriffs" and Options.farmToggle.Value then
                    local humanoid = char:FindFirstChildWhichIsA("Humanoid")
                    if humanoid then humanoid.Health = 0 end
                end
                wait(1)
            end
        end)

        local resetParagraph = Tabs.Farm:CreateParagraph("Reset", {
            Title = "Server Hop:",
            Content = ""
        })

        Tabs.Farm:CreateButton{
            Title = "Server Hop",
            Description = "",
            Callback = function()
                Window:Dialog{
                    Title = "Server Hop",
                    Content = "Do you want to server hop?",
                    Buttons = {
                        {
                            Title = "Confirm",
                            Callback = function()
                                serverHop()
                            end
                        },
                        {
                            Title = "Cancel",
                            Callback = function() end
                        }
                    }
                }
            end
        }

        local serverHopToggle = Tabs.Farm:CreateToggle("serverHopToggle", {Title = "Auto Server Hop", Default = false})

        serverHopToggle:OnChanged(function ()
            while Options.serverHopToggle.Value do
                if #players:GetPlayers() <= 3 then
                    serverHop()
                end
                wait(1)
            end
        end)
        local hopParagraph = Tabs.Farm:CreateParagraph("AutoHop", {
            Title = "^ If there are less than 3 players on the server",
            Content = ""
        })

        local bb = game:GetService("VirtualUser")
        plr.Idled:connect(function()
            bb:CaptureController()
            bb:ClickButton2(Vector2.new())
        end)

        local function instask()
            for _, v in pairs(workspace:GetDescendants()) do
                if v.ClassName == "ProximityPrompt" and v.HoldDuration ~= 0 then
                    v.HoldDuration = 0
                end
            end
        end

        local taskName = nil

        local ToggleESP = Tabs.Main:CreateToggle("ToggleESP", {Title = "ESP", Default = false})
        local AutoObby = Tabs.Main:CreateToggle("AutoObby", {Title = "Auto Complete Obby", Default = false})
        local AutoTask2 = Tabs.Main:CreateToggle("AutoTask2", {Title = "Auto Task", Default = false})
        local AutoTask = Tabs.Main:CreateToggle("AutoTask", {Title = "Auto Nearest Task", Default = false})

        AutoTask2:OnChanged(
            function()
                while Options.AutoTask2.Value do
                    pcall(
                        function()
                            taskName = char:GetAttribute("TaskName")
                            if taskName and taskName ~= "" then
                                local yourTask
                                local parentTask
                                for _, task in pairs(workspace:GetDescendants()) do
                                    if task:IsA("ProximityPrompt") and task.Parent and task.Parent.Name == taskName then
                                        yourTask = task
                                        parentTask = task.Parent
                                        break
                                    end
                                end

                                if yourTask then
                                    yourTask.Parent = char
                                    yourTask.HoldDuration = 0

                                    while Options.AutoTask2.Value and char:GetAttribute("TaskName") == taskName do
                                        yourTask:InputHoldBegin()
                                        yourTask:InputHoldEnd()
                                        wait(0.1)
                                    end

                                    if yourTask.Parent == char then
                                        yourTask.Parent = parentTask
                                    end
                                end
                            end
                        end
                    )

                    wait(1)
                end
            end
        )

        Tabs.Main:CreateButton {
            Title = "Kill Nearest NPCs",
            Description = "",
            Callback = function ()
                for i, v in ipairs(players:GetPlayers()) do
                    if v == plr then
                        Instance.new("Folder", v.Character).Name = "testt"
                    end
                end
                task.wait(.5)
                for i, v in ipairs(workspace:GetChildren()) do
                    if v:FindFirstChild("testt") == nil and v:FindFirstChild("Died") == nil and v:FindFirstChild("Humanoid") then
                        Magnitude =
                            (plr.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                        if Magnitude <= 50 then
                            v.Humanoid.RigType = "R6"
                            v.Humanoid.Health = 0
                            Instance.new("Folder", v).Name = "Died"
                        end
                    end
                end
            end
        }

        Tabs.Main:CreateButton {
            Title = "Instance Tasks",
            Description = "",
            Callback = function()
                instask()
            end
        }
        local InstanceTask = Tabs.Main:CreateToggle("InstanceTask", {Title = "Auto Instance Task", Default = false})
        InstanceTask:OnChanged(
            function()
                while Options.InstanceTask.Value do
                    instask()
                    wait(1)
                end
            end
        )

        AutoTask:OnChanged(
            function()
                while Options.AutoTask.Value do
                    local taskName = char:GetAttribute("TaskName")
                    for _, task in pairs(game:GetService("Workspace"):GetDescendants()) do
                        if task:IsA("Model") and task.Name == taskName and task.Parent.Name == "Tasks" then
                            local hitbox = task:WaitForChild("Hitbox")
                            local distance = (humPart.Position - hitbox.Position).Magnitude
                            if distance <= task.ProximityPrompt.MaxActivationDistance then
                                local prompt = task.ProximityPrompt
                                prompt.HoldDuration = 0
                                prompt:InputHoldBegin()
                                wait(prompt.HoldDuration)
                                prompt:InputHoldEnd()
                            end
                        end
                    end
                    wait(.3)
                end
            end
        )

        AutoObby:OnChanged(
            function()
                while Options.ToggleESP.Value do
                    pcall(
                        function()
                            if plr and plr.Team and plr.Team.Name == "Lobby" then
                                firetouchinterest(
                                    plr.Character.HumanoidRootPart,
                                    workspace:FindFirstChild("Lobby"):FindFirstChild("Obby"):FindFirstChild("ObbyEndPart"),
                                    0
                                )
                                firetouchinterest(
                                    plr.Character.HumanoidRootPart,
                                    workspace:FindFirstChild("Lobby"):FindFirstChild("Obby"):FindFirstChild("ObbyEndPart"),
                                    1
                                )
                            end
                        end
                    )
                    wait(1)
                end
            end
        )

        ToggleESP:OnChanged(
            function()
                if Options.ToggleESP.Value then
                    while Options.ToggleESP.Value do
                        for _, player in pairs(workspace:GetDescendants()) do
                            if player:IsA("Model") and player:FindFirstChild("HumanoidRootPart") then
                                if player:FindFirstChild("HumanoidRootPart").CollisionGroup == "Player" and player ~= char then
                                    local playerObject = players:GetPlayerFromCharacter(player)

                                    if playerObject and playerObject.Team and playerObject.Team.Name == "Sheriffs" then
                                        if player:FindFirstChild("ESP") then
                                            player:FindFirstChild("ESP").Color3 = Color3.new(0, 0, 1)
                                        else
                                            local box = Instance.new("BoxHandleAdornment", player)
                                            box.Name = "ESP"
                                            box.Adornee = player
                                            box.AlwaysOnTop = true
                                            box.Size = Vector3.new(4, 5, 1)
                                            box.ZIndex = 0
                                            box.Transparency = 0.3
                                            box.Color3 = Color3.new(0, 0, 1)
                                        end
                                    else
                                        if not player:FindFirstChild("ESP") then
                                            local box = Instance.new("BoxHandleAdornment", player)
                                            box.Name = "ESP"
                                            box.Adornee = player
                                            box.AlwaysOnTop = true
                                            box.Size = Vector3.new(4, 5, 1)
                                            box.ZIndex = 0
                                            box.Transparency = 0.3
                                            box.Color3 = Color3.new(0, 1, 0)
                                        end
                                    end
                                end
                            end
                        end
                        task.wait(1)
                    end
                else
                    for _, e in pairs(workspace:GetDescendants()) do
                        if e.Name == "ESP" then
                            e:Destroy()
                        end
                    end
                end
            end
        )

        local InfStamina = Tabs.Player:CreateToggle("InfStamina", {Title = "Inf Stamina", Default = false})

        InfStamina:OnChanged(
            function()
                if Options.InfStamina.Value then
                    while Options.InfStamina.Value do
                        pcall(
                            function()
                                if
                                    plr:WaitForChild("PlayerGui"):FindFirstChild("Modules"):FindFirstChild("Gameplay"):WaitForChild(
                                        "Sprint"
                                    )
                                then
                                    plr:WaitForChild("PlayerGui"):FindFirstChild("Modules"):FindFirstChild("Gameplay"):WaitForChild(
                                            "Sprint"
                                        ):FindFirstChild("Stamina").Value = 9e9
                                end
                            end
                        )
                        wait(.6)
                    end
                else
                    if plr:WaitForChild("PlayerGui"):FindFirstChild("Modules"):FindFirstChild("Gameplay"):WaitForChild("Sprint") then
                        plr:WaitForChild("PlayerGui"):FindFirstChild("Modules"):FindFirstChild("Gameplay"):WaitForChild(
                                "Sprint"
                            ):FindFirstChild("Stamina").Value = 6
                    end
                end
            end
        )

        local ToggleSpeed = Tabs.Player:CreateToggle("ToggleSpeed", {Title = "Toggle Speed", Default = false})
        local speedValue = 0
        local jumpValue = 0
        ToggleSpeed:OnChanged(
            function()
                if Options.ToggleSpeed.Value then
                    if tonumber(speedValue) ~= 0 and tonumber(speedValue) > 0 then
                        while Options.ToggleSpeed.Value do
                            char:WaitForChild("Humanoid").WalkSpeed = tonumber(speedValue)
                            wait()
                        end
                    end
                else
                    if plr.Team and plr.Team.Name == "Lobby" then
                        char:WaitForChild("Humanoid").WalkSpeed = 22
                    elseif plr.Team and plr.Team.Name == "Sheriffs" then
                        char:WaitForChild("Humanoid").WalkSpeed = 10
                    elseif plr.Team and plr.Team.Name == "Criminals" then
                        char:WaitForChild("Humanoid").WalkSpeed = 6.5
                    end
                end
            end
        )
        local speed =
            Tabs.Player:CreateInput(
            "Speed",
            {
                Title = "Speed Value",
                Default = "22",
                Placeholder = "Value",
                Numeric = true,
                Finished = false,
                Callback = function(Value)
                    speedValue = Value
                end
            }
        )
        local ToggleJump = Tabs.Player:CreateToggle("ToggleJump", {Title = "Toggle JumpPower", Default = false})
        char:WaitForChild("Humanoid").UseJumpPower = true
        ToggleJump:OnChanged(function ()
            char:WaitForChild("Humanoid").UseJumpPower = true
            if Options.ToggleJump.Value then
                if tonumber(jumpValue) ~= 0 and tonumber(jumpValue) > 0 then
                    char:WaitForChild("Humanoid").JumpPower = jumpValue
                    wait()
                end
            else
                char:WaitForChild("Humanoid").JumpPower = 50
            end
        end)
        local jump =
            Tabs.Player:CreateInput(
            "Jump",
            {
                Title = "JumpPower Value",
                Default = char:WaitForChild("Humanoid").JumpPower,
                Placeholder = "Value",
                Numeric = true,
                Finished = false,
                Callback = function(Value)
                    jumpValue = Value
                end
            }
        )
        local Noclip = Tabs.Player:CreateToggle("Noclip", {Title = "Noclip", Default = false})
        getgenv().Noclipping = nil
        Noclip:OnChanged(
            function()
                if Options.Noclip.Value then
                    local function NoclipLoop()
                        for _, child in pairs(char:GetDescendants()) do
                            if child:IsA("BasePart") and child.CanCollide == true then
                                child.CanCollide = false
                            end
                        end
                    end
                    getgenv().Noclipping = game:GetService("RunService").Stepped:Connect(NoclipLoop)
                else
                    if getgenv().Noclipping then
                        getgenv().Noclipping:Disconnect()
                        getgenv().Noclipping = nil
                    end
                end
            end
        )

        Tabs.Player:CreateButton{
            Title = "FullBright",
            Description = "",
            Callback = function ()
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end
        }

        local function updatePlayerList()
            local player_list = {}
            for _, p in pairs(game:GetService("Players"):GetPlayers()) do
                table.insert(player_list, p.Name)
            end
            return player_list
        end

        local PlayersDropdown =
            Tabs.Stats:CreateDropdown(
            "Players",
            {
                Title = "Choose Player",
                Values = updatePlayerList(),
                Multi = false,
                Default = 1
            }
        )
        local DisplayName =
            Tabs.Stats:CreateParagraph(
            "DisplayName",
            {
                Title = "Display Name:",
                Content = ""
            }
        )
        local CashStat =
            Tabs.Stats:CreateParagraph(
            "CashStat",
            {
                Title = "Player Cash:",
                Content = "0 Cash"
            }
        )
        local RubiesStat =
            Tabs.Stats:CreateParagraph(
            "RubiesStat",
            {
                Title = "Player Rubies:",
                Content = "0 Rubies"
            }
        )
        local LevelStat =
            Tabs.Stats:CreateParagraph(
            "LevelStat",
            {
                Title = "Player Level:",
                Content = "0"
            }
        )
        local XPStat =
            Tabs.Stats:CreateParagraph(
            "XPStat",
            {
                Title = "Player XP:",
                Content = "0"
            }
        )
        local EquippedWeapon =
            Tabs.Stats:CreateParagraph(
            "EquippedWeapon",
            {
                Title = "Player Equipped Weapon:",
                Content = ""
            }
        )
        local EquippedSheriff =
            Tabs.Stats:CreateParagraph(
            "EquippedSheriff",
            {
                Title = "Player Equipped Sheriff:",
                Content = ""
            }
        )
        local EquippedHouse =
            Tabs.Stats:CreateParagraph(
            "EquippedHouse",
            {
                Title = "Player Equipped House:",
                Content = ""
            }
        )
        local StatisticsLabel =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "-- Statistics: --",
                Content = ""
            }
        )
        local GamesPlayed =
            Tabs.Stats:CreateParagraph(
            "GamesPlayed",
            {
                Title = "Games Played:",
                Content = "0"
            }
        )
        local HidersCaught =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "Hiders Caught:",
                Content = "0"
            }
        )
        local NPCsShot =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "NPCs Shot:",
                Content = "0"
            }
        )
        local TasksCompleted =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "Tasks Completed: ",
                Content = "0"
            }
        )
        local WinsAsHider =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "Wins As Hider:",
                Content = "0"
            }
        )
        local WinsAsSeeker =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "Wins As Seeker:",
                Content = "0"
            }
        )
        local InventoryLabel =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "-- Inventory: --",
                Content = ""
            }
        )
        local HousesHouse =
            Tabs.Stats:CreateParagraph(
            "HousesHouse",
            {
                Title = "Player Houses:",
                Content = ""
            }
        )
        local SheriffsHouse =
            Tabs.Stats:CreateParagraph(
            "SheriffsHouse",
            {
                Title = "Player Sheriffs:",
                Content = ""
            }
        )
        local WeaponsHouse =
            Tabs.Stats:CreateParagraph(
            "WeaponsHouse",
            {
                Title = "Player Weapons:",
                Content = ""
            }
        )

        local level
        local houses_list = {}
        local sheriffs_list = {}
        local weapons_list = {}
        local currentPlayer = nil

        PlayersDropdown:OnChanged(
            function(Value)
                pcall(
                    function()
                        local function splitCamelCase(str)
                            return str:gsub("(%l)(%u)", "%1 %2")
                        end

                        -- Level
                        for _, p in pairs(game.Players[Value].leaderstats:GetChildren()) do
                            if string.find(p.Name, "Level") then
                                level = p
                                break
                            end
                        end

                        -- Houses
                        houses_list = {}
                        for _, p in pairs(game.Players[Value].Data.Inventory.Houses:GetChildren()) do
                            table.insert(houses_list, splitCamelCase(p.Name) .. ": " .. p.Value)
                        end

                        -- Sheriffs
                        sheriffs_list = {}
                        for _, p in pairs(game.Players[Value].Data.Inventory.Sheriffs:GetChildren()) do
                            table.insert(sheriffs_list, splitCamelCase(p.Name) .. ": " .. p.Value)
                        end

                        -- Weapons
                        weapons_list = {}
                        for _, p in pairs(game.Players[Value].Data.Inventory.Weapons:GetChildren()) do
                            table.insert(weapons_list, splitCamelCase(p.Name) .. ": " .. p.Value)
                        end

                        local selectedPlayer = game.Players[Value]

                        if not selectedPlayer or not selectedPlayer.Data then
                            return
                        end

                        currentPlayer = selectedPlayer

                        local function updateStats()
                            if currentPlayer == selectedPlayer and selectedPlayer.Data then
                                HousesHouse:SetValue(table.concat(houses_list, "\n"))
                                SheriffsHouse:SetValue(table.concat(sheriffs_list, "\n"))
                                WeaponsHouse:SetValue(table.concat(weapons_list, "\n"))
                                DisplayName:SetValue(selectedPlayer.DisplayName)
                                if selectedPlayer.Data.Statistics.GamesPlayed then
                                    GamesPlayed:SetValue(selectedPlayer.Data.Statistics.GamesPlayed.Value)
                                end
                                if selectedPlayer.Data.Statistics.HidersCaught then
                                    HidersCaught:SetValue(selectedPlayer.Data.Statistics.HidersCaught.Value)
                                end
                                if selectedPlayer.Data.Statistics.NPCsShot then
                                    NPCsShot:SetValue(selectedPlayer.Data.Statistics.NPCsShot.Value)
                                end
                                if selectedPlayer.Data.Statistics.TasksCompleted then
                                    TasksCompleted:SetValue(selectedPlayer.Data.Statistics.TasksCompleted.Value)
                                end
                                if selectedPlayer.Data.Statistics.WinsAsHider then
                                    WinsAsHider:SetValue(selectedPlayer.Data.Statistics.WinsAsHider.Value)
                                end
                                if selectedPlayer.Data.Statistics.WinsAsSeeker then
                                    WinsAsSeeker:SetValue(selectedPlayer.Data.Statistics.WinsAsSeeker.Value)
                                end
                                if selectedPlayer.Data.Cash then
                                    CashStat:SetValue(selectedPlayer.Data.Cash.Value .. " Cash")
                                end
                                if selectedPlayer.Data.Rubies then
                                    RubiesStat:SetValue(selectedPlayer.Data.Rubies.Value .. " Rubies")
                                end
                                if level then
                                    LevelStat:SetValue(level.Value .. " Level")
                                end
                                if selectedPlayer.Data.XP then
                                    XPStat:SetValue(selectedPlayer.Data.XP.Value .. " XP")
                                end
                                if selectedPlayer.Data.EquippedWeapon then
                                    EquippedWeapon:SetValue(splitCamelCase(selectedPlayer.Data.EquippedWeapon.Value))
                                end
                                if selectedPlayer.Data.EquippedSheriff then
                                    EquippedSheriff:SetValue(splitCamelCase(selectedPlayer.Data.EquippedSheriff.Value))
                                end
                                if selectedPlayer.Data.EquippedHouse then
                                    EquippedHouse:SetValue(splitCamelCase(selectedPlayer.Data.EquippedHouse.Value))
                                end
                            end
                        end

                        if selectedPlayer and selectedPlayer.Data then
                            if selectedPlayer.Data.Statistics.GamesPlayed then
                                selectedPlayer.Data.Statistics.GamesPlayed.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.HidersCaught then
                                selectedPlayer.Data.Statistics.HidersCaught.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.NPCsShot then
                                selectedPlayer.Data.Statistics.NPCsShot.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.TasksCompleted then
                                selectedPlayer.Data.Statistics.TasksCompleted.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.WinsAsHider then
                                selectedPlayer.Data.Statistics.WinsAsHider.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.WinsAsSeeker then
                                selectedPlayer.Data.Statistics.WinsAsSeeker.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Cash then
                                selectedPlayer.Data.Cash.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Rubies then
                                selectedPlayer.Data.Rubies.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.XP then
                                selectedPlayer.Data.XP.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.EquippedWeapon then
                                selectedPlayer.Data.EquippedWeapon.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.EquippedSheriff then
                                selectedPlayer.Data.EquippedSheriff.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.EquippedHouse then
                                selectedPlayer.Data.EquippedHouse.Changed:Connect(updateStats)
                            end
                            if level then
                                level.Changed:Connect(updateStats)
                            end
                        end

                        updateStats()
                    end
                )
            end
        )

        local function refreshDropdown()
            PlayersDropdown:SetValues(updatePlayerList())
        end

        game:GetService("Players").PlayerAdded:Connect(
            function()
                refreshDropdown()
            end
        )

        game:GetService("Players").PlayerRemoving:Connect(
            function()
                refreshDropdown()
            end
        )

        Window:SelectTab(1)

        SaveManager:SetLibrary(Library)
        InterfaceManager:SetLibrary(Library)
        SaveManager:IgnoreThemeSettings()
        InterfaceManager:SetFolder("BeNPCorDie")
        InterfaceManager:BuildInterfaceSection(Tabs.Settings)
        SaveManager:BuildConfigSection(Tabs.Settings)

        SaveManager:LoadAutoloadConfig()
    elseif game.PlaceId == 96523225033576 then
        local Tabs = {
            Player = Window:CreateTab {
                Title = "Player",
                Icon = "person-standing"
            },
            Stats = Window:CreateTab {
                Title = "Players Stats",
                Icon = "chart-no-axes-column"
            },
            Settings = Window:CreateTab {
                Title = "Settings",
                Icon = "settings"
            }
        }
        local Options = Library.Options
        
        local players = game:GetService("Players")
        local plr = players.LocalPlayer
        
        local function getCharacter()
            local char = plr.Character or plr.CharacterAdded:Wait()
            local humPart = char:WaitForChild("HumanoidRootPart", 5)
            return char, humPart
        end
        
        local char, humPart = getCharacter()
        
        plr.CharacterAdded:Connect(
            function()
                char, humPart = getCharacter()
                char:WaitForChild("Humanoid").UseJumpPower = true
            end
        )

        Tabs.Player:CreateButton {
            Title = "Anti AFK",
            Description = "",
            Callback = function()
                local bb = game:GetService("VirtualUser")
                plr.Idled:connect(function()
                    bb:CaptureController()
                    bb:ClickButton2(Vector2.new())
                end)
            end
        }
        
        local speed =
            Tabs.Player:CreateInput(
            "Speed",
            {
                Title = "Speed Value",
                Default = char:WaitForChild("Humanoid").WalkSpeed,
                Placeholder = "Value",
                Numeric = true,
                Finished = false,
                Callback = function(Value)
                    char:WaitForChild("Humanoid").WalkSpeed = Value
                end
            }
        )
        char:WaitForChild("Humanoid").UseJumpPower = true
        local jump =
            Tabs.Player:CreateInput(
            "Jump",
            {
                Title = "Speed Value",
                Default = char:WaitForChild("Humanoid").JumpPower,
                Placeholder = "Value",
                Numeric = true,
                Finished = false,
                Callback = function(Value)
                    char:WaitForChild("Humanoid").JumpPower = Value
                end
            }
        )
        local Noclip = Tabs.Player:CreateToggle("Noclip", {Title = "Noclip", Default = false})
        getgenv().Noclipping = nil
        Noclip:OnChanged(
            function()
                if Options.Noclip.Value then
                    local function NoclipLoop()
                        for _, child in pairs(char:GetDescendants()) do
                            if child:IsA("BasePart") and child.CanCollide == true then
                                child.CanCollide = false
                            end
                        end
                    end
                    getgenv().Noclipping = game:GetService("RunService").Stepped:Connect(NoclipLoop)
                else
                    if getgenv().Noclipping then
                        getgenv().Noclipping:Disconnect()
                        getgenv().Noclipping = nil
                    end
                end
            end
        )
        
        local function updatePlayerList()
            local player_list = {}
            for _, p in pairs(game:GetService("Players"):GetPlayers()) do
                table.insert(player_list, p.Name)
            end
            return player_list
        end
        
        local PlayersDropdown =
            Tabs.Stats:CreateDropdown(
            "Players",
            {
                Title = "Choose Player",
                Values = updatePlayerList(),
                Multi = false,
                Default = 1
            }
        )
        local DisplayName =
            Tabs.Stats:CreateParagraph(
            "DisplayName",
            {
                Title = "Display Name:",
                Content = ""
            }
        )
        local CashStat =
            Tabs.Stats:CreateParagraph(
            "CashStat",
            {
                Title = "Player Cash:",
                Content = "0 Cash"
            }
        )
        local RubiesStat =
            Tabs.Stats:CreateParagraph(
            "RubiesStat",
            {
                Title = "Player Rubies:",
                Content = "0 Rubies"
            }
        )
        local LevelStat =
            Tabs.Stats:CreateParagraph(
            "LevelStat",
            {
                Title = "Player Level:",
                Content = "0"
            }
        )
        local XPStat =
            Tabs.Stats:CreateParagraph(
            "XPStat",
            {
                Title = "Player XP:",
                Content = "0"
            }
        )
        local EquippedWeapon =
            Tabs.Stats:CreateParagraph(
            "EquippedWeapon",
            {
                Title = "Player Equipped Weapon:",
                Content = ""
            }
        )
        local EquippedSheriff =
            Tabs.Stats:CreateParagraph(
            "EquippedSheriff",
            {
                Title = "Player Equipped Sheriff:",
                Content = ""
            }
        )
        local EquippedHouse =
            Tabs.Stats:CreateParagraph(
            "EquippedHouse",
            {
                Title = "Player Equipped House:",
                Content = ""
            }
        )
        local StatisticsLabel =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "-- Statistics: --",
                Content = ""
            }
        )
        local GamesPlayed =
            Tabs.Stats:CreateParagraph(
            "GamesPlayed",
            {
                Title = "Games Played:",
                Content = "0"
            }
        )
        local HidersCaught =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "Hiders Caught:",
                Content = "0"
            }
        )
        local NPCsShot =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "NPCs Shot:",
                Content = "0"
            }
        )
        local TasksCompleted =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "Tasks Completed: ",
                Content = "0"
            }
        )
        local WinsAsHider =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "Wins As Hider:",
                Content = "0"
            }
        )
        local WinsAsSeeker =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "Wins As Seeker:",
                Content = "0"
            }
        )
        local InventoryLabel =
            Tabs.Stats:CreateParagraph(
            "InventoryLabel",
            {
                Title = "-- Inventory: --",
                Content = ""
            }
        )
        local HousesHouse =
            Tabs.Stats:CreateParagraph(
            "HousesHouse",
            {
                Title = "Player Houses:",
                Content = ""
            }
        )
        local SheriffsHouse =
            Tabs.Stats:CreateParagraph(
            "SheriffsHouse",
            {
                Title = "Player Sheriffs:",
                Content = ""
            }
        )
        local WeaponsHouse =
            Tabs.Stats:CreateParagraph(
            "WeaponsHouse",
            {
                Title = "Player Weapons:",
                Content = ""
            }
        )
        
        local level
        local houses_list = {}
        local sheriffs_list = {}
        local weapons_list = {}
        local currentPlayer = nil
        
        PlayersDropdown:OnChanged(
            function(Value)
                pcall(
                    function()
                        local function splitCamelCase(str)
                            return str:gsub("(%l)(%u)", "%1 %2")
                        end
        
                        -- Level
                        for _, p in pairs(game.Players[Value].leaderstats:GetChildren()) do
                            if string.find(p.Name, "Level") then
                                level = p
                                break
                            end
                        end
        
                        -- Houses
                        houses_list = {}
                        for _, p in pairs(game.Players[Value].Data.Inventory.Houses:GetChildren()) do
                            table.insert(houses_list, splitCamelCase(p.Name) .. ": " .. p.Value)
                        end
        
                        -- Sheriffs
                        sheriffs_list = {}
                        for _, p in pairs(game.Players[Value].Data.Inventory.Sheriffs:GetChildren()) do
                            table.insert(sheriffs_list, splitCamelCase(p.Name) .. ": " .. p.Value)
                        end
        
                        -- Weapons
                        weapons_list = {}
                        for _, p in pairs(game.Players[Value].Data.Inventory.Weapons:GetChildren()) do
                            table.insert(weapons_list, splitCamelCase(p.Name) .. ": " .. p.Value)
                        end
        
                        local selectedPlayer = game.Players[Value]
        
                        if not selectedPlayer or not selectedPlayer.Data then
                            return
                        end
        
                        currentPlayer = selectedPlayer
        
                        local function updateStats()
                            if currentPlayer == selectedPlayer and selectedPlayer.Data then
                                HousesHouse:SetValue(table.concat(houses_list, "\n"))
                                SheriffsHouse:SetValue(table.concat(sheriffs_list, "\n"))
                                WeaponsHouse:SetValue(table.concat(weapons_list, "\n"))
                                DisplayName:SetValue(selectedPlayer.DisplayName)
                                if selectedPlayer.Data.Statistics.GamesPlayed then
                                    GamesPlayed:SetValue(selectedPlayer.Data.Statistics.GamesPlayed.Value)
                                end
                                if selectedPlayer.Data.Statistics.HidersCaught then
                                    HidersCaught:SetValue(selectedPlayer.Data.Statistics.HidersCaught.Value)
                                end
                                if selectedPlayer.Data.Statistics.NPCsShot then
                                    NPCsShot:SetValue(selectedPlayer.Data.Statistics.NPCsShot.Value)
                                end
                                if selectedPlayer.Data.Statistics.TasksCompleted then
                                    TasksCompleted:SetValue(selectedPlayer.Data.Statistics.TasksCompleted.Value)
                                end
                                if selectedPlayer.Data.Statistics.WinsAsHider then
                                    WinsAsHider:SetValue(selectedPlayer.Data.Statistics.WinsAsHider.Value)
                                end
                                if selectedPlayer.Data.Statistics.WinsAsSeeker then
                                    WinsAsSeeker:SetValue(selectedPlayer.Data.Statistics.WinsAsSeeker.Value)
                                end
                                if selectedPlayer.Data.Cash then
                                    CashStat:SetValue(selectedPlayer.Data.Cash.Value .. " Cash")
                                end
                                if selectedPlayer.Data.Rubies then
                                    RubiesStat:SetValue(selectedPlayer.Data.Rubies.Value .. " Rubies")
                                end
                                if level then
                                    LevelStat:SetValue(level.Value .. " Level")
                                end
                                if selectedPlayer.Data.XP then
                                    XPStat:SetValue(selectedPlayer.Data.XP.Value .. " XP")
                                end
                                if selectedPlayer.Data.EquippedWeapon then
                                    EquippedWeapon:SetValue(splitCamelCase(selectedPlayer.Data.EquippedWeapon.Value))
                                end
                                if selectedPlayer.Data.EquippedSheriff then
                                    EquippedSheriff:SetValue(splitCamelCase(selectedPlayer.Data.EquippedSheriff.Value))
                                end
                                if selectedPlayer.Data.EquippedHouse then
                                    EquippedHouse:SetValue(splitCamelCase(selectedPlayer.Data.EquippedHouse.Value))
                                end
                            end
                        end
        
                        if selectedPlayer and selectedPlayer.Data then
                            if selectedPlayer.Data.Statistics.GamesPlayed then
                                selectedPlayer.Data.Statistics.GamesPlayed.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.HidersCaught then
                                selectedPlayer.Data.Statistics.HidersCaught.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.NPCsShot then
                                selectedPlayer.Data.Statistics.NPCsShot.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.TasksCompleted then
                                selectedPlayer.Data.Statistics.TasksCompleted.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.WinsAsHider then
                                selectedPlayer.Data.Statistics.WinsAsHider.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Statistics.WinsAsSeeker then
                                selectedPlayer.Data.Statistics.WinsAsSeeker.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Cash then
                                selectedPlayer.Data.Cash.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.Rubies then
                                selectedPlayer.Data.Rubies.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.XP then
                                selectedPlayer.Data.XP.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.EquippedWeapon then
                                selectedPlayer.Data.EquippedWeapon.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.EquippedSheriff then
                                selectedPlayer.Data.EquippedSheriff.Changed:Connect(updateStats)
                            end
                            if selectedPlayer.Data.EquippedHouse then
                                selectedPlayer.Data.EquippedHouse.Changed:Connect(updateStats)
                            end
                            if level then
                                level.Changed:Connect(updateStats)
                            end
                        end
        
                        updateStats()
                    end
                )
            end
        )
        
        local function refreshDropdown()
            PlayersDropdown:SetValues(updatePlayerList())
        end
        
        game:GetService("Players").PlayerAdded:Connect(
            function()
                refreshDropdown()
            end
        )
        
        game:GetService("Players").PlayerRemoving:Connect(
            function()
                refreshDropdown()
            end
        )

        Window:SelectTab(1)

        SaveManager:SetLibrary(Library)
        InterfaceManager:SetLibrary(Library)
        SaveManager:IgnoreThemeSettings()
        InterfaceManager:SetFolder("BeNPCorDie")
        InterfaceManager:BuildInterfaceSection(Tabs.Settings)
        SaveManager:BuildConfigSection(Tabs.Settings)
    end
end
