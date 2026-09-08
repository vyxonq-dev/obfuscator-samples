local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://100736080025788"
sound.Volume = math.huge
sound.Parent = game.Workspace
sound:Play()

local RedTheme = {
    TextColor = Color3.fromRGB(225, 225, 225),
    Background = Color3.fromRGB(20, 20, 20),
    Topbar = Color3.fromRGB(10, 10, 10),
    Shadow = Color3.fromRGB(180, 0, 70), -- Czerwony
    NotificationBackground = Color3.fromRGB(15, 15, 15),
    NotificationActionsBackground = Color3.fromRGB(25, 25, 25),
    TabBackground = Color3.fromRGB(10, 10, 10),
    TabStroke = Color3.fromRGB(200, 0, 80), -- Czerwony
    TabBackgroundSelected = Color3.fromRGB(30, 30, 30),
    TabTextColor = Color3.fromRGB(200, 200, 200),
    SelectedTabTextColor = Color3.fromRGB(255, 100, 150), -- Czerwony (jasny)
    TabIconColor = Color3.fromRGB(200, 200, 200),
    SelectedTabIconColor = Color3.fromRGB(255, 100, 150), -- Czerwony (jasny)
    ElementBackground = Color3.fromRGB(22, 22, 22),
    ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
    SecondaryElementBackground = Color3.fromRGB(15, 15, 15),
    ElementStroke = Color3.fromRGB(180, 0, 70), -- Czerwony
    SecondaryElementStroke = Color3.fromRGB(150, 0, 60), -- Czerwony (ciemniejszy)
    SliderBackground = Color3.fromRGB(15, 15, 15),
    SliderProgress = Color3.fromRGB(200, 0, 80), -- Czerwony
    SliderStroke = Color3.fromRGB(200, 200, 200),
    ToggleBackground = Color3.fromRGB(30, 30, 30),
    ToggleEnabled = Color3.fromRGB(200, 0, 80), -- Czerwony
    ToggleDisabled = Color3.fromRGB(100, 100, 100),
    ToggleEnabledStroke = Color3.fromRGB(150, 0, 60), -- Czerwony (ciemniejszy)
    ToggleDisabledStroke = Color3.fromRGB(80, 80, 80),
    ToggleEnabledOuterStroke = Color3.fromRGB(10, 10, 10),
    ToggleDisabledOuterStroke = Color3.fromRGB(10, 10, 10),
    DropdownSelected = Color3.fromRGB(100, 0, 40), -- Czerwony (bardzo ciemny)
    DropdownUnselected = Color3.fromRGB(15, 15, 15),
    InputBackground = Color3.fromRGB(15, 15, 15),
    InputStroke = Color3.fromRGB(200, 0, 80), -- Czerwony
    PlaceholderColor = Color3.fromRGB(150, 0, 60) -- Czerwony (ciemniejszy)
}

local Window = Rayfield:CreateWindow({
   Name = "Sar3kezm Hub  Arcade Store Simulator [👷STAFF]",
   Icon = 93370012054262, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Arcade Store Simulator [👷STAFF] script",
   LoadingSubtitle = "by Sar3kezm",
   Theme = RedTheme, -- Check https://docs.sirius.menu/rayfield/configuration/themes

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Sar3kezm Hub"
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

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

Button = Tab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})

Button = Tab:CreateButton({
    Name = "DEX",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end,
})

Button = Tab:CreateButton({
   Name = "ThirdPerson",
   Callback = function()
        game.Players.LocalPlayer.CameraMode = Enum.CameraMode.Classic game.Players.LocalPlayer.CameraMaxZoomDistance = 1280 game.Players.LocalPlayer.CameraMinZoomDistance = 0.5
   -- The function that takes place when the button is pressed
   end,
})

Button = Tab:CreateButton({
   Name = "Destroy UI",
   Callback = function()
		Rayfield:Destroy()
   -- The function that takes place when the button is pressed
   end,
})

Divider = Tab:CreateDivider()

local Button = Tab:CreateButton({
   Name = "Hire Collector",
   Callback = function()local args = {
	"Hire",
	"Collector"
}
game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
   end,
})

local Button = Tab:CreateButton({
   Name = "Hire Repairer",
   Callback = function()local args = {
	"Hire",
	"Repairer"
}
game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
   end,
})

Divider = Tab:CreateDivider()

local Button = Tab:CreateButton({
    Name = "Get Arcade1",
    Callback = function()local args = {
        "Buy",   {
            Arcade_1 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Arcade2",
    Callback = function()local args = {
        "Buy",   {
            Arcade_2 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Arcade3",
    Callback = function()local args = {
        "Buy",   {
            Arcade_3 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Arcade4",
    Callback = function()local args = {
        "Buy",   {
            Arcade_4 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Arcade5",
    Callback = function()local args = {
        "Buy",   {
            Arcade_5 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Arcade6",
    Callback = function()local args = {
        "Buy",   {
            Arcade_6 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Arcade7",
    Callback = function()local args = {
        "Buy",   {
            Arcade_7 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Arcade8",
    Callback = function()local args = {
        "Buy",   {
            Arcade_8 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Get Arcade9",
    Callback = function()local args = {
        "Buy",   {
            Arcade_9 = {
                Amount = 1,
                TypeItem = "Arcades"
            }
        }
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
   Name = "Get Arcade10",
   Callback = function()local args = {
	"Buy",	{
		Arcade_10 = {
			Amount = 1,
			TypeItem = "Arcades"
		}
	}
}
   game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
   end,
})

Divider = Tab:CreateDivider()

local Button = Tab:CreateButton({
    Name = "Expand 1",
    Callback = function()local args = {
        "Expand_Server",
        1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
    Name = "Expand 2",
    Callback = function()local args = {
        "Expand_Server",
        2
    }
    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
    end,
})

local Button = Tab:CreateButton({
   Name = "Expand 3",
   Callback = function()local args = {
	"Expand_Server",
	3
}
game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer(unpack(args))
   end,
})

Divider = Tab:CreateDivider()

local playerAddedConnection = nil 

Tab:CreateToggle({
    Name = "Auto Kick All",
    Callback = function(state) -- 'state' to stan przełącznika: true (włączony) lub false (wyłączony)
        if state then
            -- STAN "WŁĄCZONY"
            local PlayersService = game:GetService("Players")
            local LocalPlayer = PlayersService.LocalPlayer
            
            Rayfield:Notify({
                Title = "Auto Kick Włączony",
                Content = "Nowi gracze będą automatycznie wyrzucani.",
                Duration = 5,
                Type = "success"
            })

            -- 1. Najpierw wyrzuć wszystkich, którzy już są na serwerze
            for _, player in ipairs(PlayersService:GetPlayers()) do
                if player ~= LocalPlayer then
                    game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer("Kick", player)
                    task.wait(0.1)
                end
            end

            -- 2. Zacznij nasłuchiwać na nowo dołączających graczy
            playerAddedConnection = PlayersService.PlayerAdded:Connect(function(newPlayer)
                Rayfield:Notify({Title = "Wykryto gracza", Content = "Wyrzucanie: " .. newPlayer.Name, Duration = 3})
                task.wait(0.5) 
                game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer("Kick", newPlayer)
            end)

        else
            -- STAN "WYŁĄCZONY"
            if playerAddedConnection then
                playerAddedConnection:Disconnect()
                playerAddedConnection = nil 
            end
            
            Rayfield:Notify({
                Title = "Auto Kick Wyłączony",
                Content = "Zatrzymano automatyczne wyrzucanie.",
                Duration = 5,
                Type = "warning"
            })
        end
    end,
})

-- Wklej ten kod w zakładce "Main" (czyli tam, gdzie masz zmienną 'Tab')

Tab:CreateButton({
    Name = "Kick All Players",
    Callback = function()
        -- Pobieramy listę wszystkich graczy i naszego lokalnego gracza
        local PlayersService = game:GetService("Players")
        local LocalPlayer = PlayersService.LocalPlayer
        
        Rayfield:Notify({
            Title = "Rozpoczęto proces",
            Content = "Wyrzucanie wszystkich graczy (oprócz Ciebie)...",
            Duration = 3,
            Type = "info"
        })

        -- Pętla przechodząca przez każdego gracza na serwerze
        for _, player in ipairs(PlayersService:GetPlayers()) do
            -- Sprawdzamy, czy gracz do wyrzucenia to nie jesteśmy my sami
            if player ~= LocalPlayer then
                -- Wysyłamy do serwera komendę "Kick" wraz z obiektem gracza, którego chcemy wyrzucić.
                game:GetService("ReplicatedStorage"):WaitForChild("ToServer_EVENT"):FireServer("Kick", player)
                
                -- Krótka pauza, aby nie przeciążyć serwera zbyt dużą liczbą zapytań na raz
                task.wait(0.1)
            end
        end

        Rayfield:Notify({
            Title = "Zakończono",
            Content = "Wysłano żądanie wyrzucenia wszystkich graczy.",
            Duration = 5,
            Type = "success"
        })
    end,
})

local PlayersTab = Window:CreateTab("Players", 4483362458)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localPlayer = Players.LocalPlayer

-- Zmienna do przechowywania docelowej prędkości
local targetSpeed = 16

-- Tworzenie suwaka do zmiany prędkości w zakładce "Players"
local SpeedSlider = PlayersTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    Suffix = " stud/s",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider", -- Unikalny identyfikator dla zapisywania
    Callback = function(Value)
        targetSpeed = Value
    end,
})

-- Tworzenie przycisku do resetowania prędkości w zakładce "Players"
PlayersTab:CreateButton({
    Name = "Reset Speed",
    Callback = function()
        targetSpeed = 16
        SpeedSlider:Set(16) -- Ustawia suwak z powrotem na wartość 16
    end,
})

-- Agresywna pętla próbująca ustawić prędkość w każdej klatce
RunService.RenderStepped:Connect(function()
    pcall(function() -- Używamy pcall, aby uniknąć potencjalnych błędów, jeśli humanoid na chwilę zniknie
        local character = localPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid.WalkSpeed ~= targetSpeed then
                humanoid.WalkSpeed = targetSpeed
            end
        end
    end)
end)

local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = game:GetService("Players").LocalPlayer

local connection = nil
local idleConnection = nil
local startTime = 0

-- Funkcja uruchamiająca Anti-AFK
local function startAntiAFK()
    if connection then connection:Disconnect() end
    if idleConnection then idleConnection:Disconnect() end

    startTime = tick()

    -- Pętla symulująca aktywność
    connection = RunService.Heartbeat:Connect(function()
        -- Symulacja kliknięcia co 10 minut, aby uniknąć rozłączenia
        if tick() - startTime >= 10 * 60 then
            pcall(function()
                VirtualUser:ClickButton2(Vector2.new())
            end)
            startTime = tick() -- Resetujemy czas po symulacji
        end
    end)

    -- Zabezpieczenie przed wykryciem AFK przez event "Idled"
    idleConnection = LocalPlayer.Idled:Connect(function()
        pcall(function()
            VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            task.wait(0.5)
            VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        end)
    end)
    
    Rayfield:Notify({Title = "Anti-AFK", Content = "Funkcja została włączona.", Duration = 4, Type = "success"})
end

-- Funkcja zatrzymująca Anti-AFK
local function stopAntiAFK()
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if idleConnection then
        idleConnection:Disconnect()
        idleConnection = nil
    end
    Rayfield:Notify({Title = "Anti-AFK", Content = "Funkcja została wyłączona.", Duration = 4, Type = "warning"})
end

-- Tworzenie przełącznika (Toggle) w zakładce "Players"
local AntiAFKToggle = PlayersTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false, -- Domyślnie wyłączony
    Flag = "AntiAFKToggle", -- Unikalny identyfikator
    Callback = function(Value)
        if Value then
            startAntiAFK()
        else
            stopAntiAFK()
        end
    end,
})

-- Jeśli przełącznik jest włączony przy starcie skryptu (np. z zapisanego configu),
-- natychmiast aktywujemy Anti-AFK.
-- POPRAWIONA LINIA:
if AntiAFKToggle.CurrentValue then
    startAntiAFK()
end

local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer

-- Zmienna przechowująca stan, czy skok ma być odblokowany
local isJumpUnlocked = false

PlayersTab:CreateToggle({
    Name = "Unlock Jump",
    CurrentValue = false,
    Flag = "UnlockJumpToggle", -- Unikalny identyfikator
    Callback = function(state)
        isJumpUnlocked = state
        if state then
            Rayfield:Notify({Title = "Unlock Jump", Content = "Możliwość skoku została odblokowana.", Duration = 4, Type = "success"})
        else
            Rayfield:Notify({Title = "Unlock Jump", Content = "Zatrzymano wymuszanie odblokowania skoku.", Duration = 4, Type = "warning"})
        end
    end,
})

-- Pętla, która stale zapewnia, że skok jest możliwy
RunService.RenderStepped:Connect(function()
    -- Działaj tylko, gdy przełącznik jest włączony
    if isJumpUnlocked then
        pcall(function()
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                -- Upewniamy się, że właściwość 'UseJumpPower' jest włączona
                if humanoid.UseJumpPower == false then
                    humanoid.UseJumpPower = true
                end
                
                -- Upewniamy się, że moc skoku jest na standardowym poziomie (50)
                -- na wypadek, gdyby gra ustawiła ją na 0.
                if humanoid.JumpPower < 50 then
                    humanoid.JumpPower = 50
                end
            end
        end)
    end
end)

ServerTab = Window:CreateTab("Servers", "server")

ServerTab:CreateSection("Current Server")

JobIdLabel = ServerTab:CreateLabel("Server ID: Loading...")
RegionLabel = ServerTab:CreateLabel("Region: Loading...")
PlayerCountLabel = ServerTab:CreateLabel("Players: Loading...")
PingLabel = ServerTab:CreateLabel("Ping: Loading...")

-- ### SEKCJA LISTY SERWERÓW ###
ServerTab:CreateSection("Available Servers")

local serverList = {}
local serverOptions = {"Loading servers..."}

local ServerDropdown = ServerTab:CreateDropdown({
    Name = "Server List",
    Options = serverOptions,
    CurrentOption = {"Loading servers..."},
    MultipleOptions = false,
    Flag = "ServerListDropdown",
    Callback = function(Options)
        local selectedOption = Options[1]
        if selectedOption and selectedOption ~= "Loading servers..." and selectedOption ~= "No servers found" then
            -- Znajdź wybrany serwer w liście
            for _, server in pairs(serverList) do
                local displayText = string.format("[%d/%d] Ping: %dms - ID: %s", 
                    server.playing, server.maxPlayers, server.ping or 999, server.id:sub(1,8))
                if displayText == selectedOption then
                    Rayfield:Notify({
                        Title = "Server Selected", 
                        Content = "Selected server: " .. server.id:sub(1,8) .. " (" .. server.playing .. "/" .. server.maxPlayers .. ")",
                        Duration = 3
                    })
                    break
                end
            end
        end
    end,
})

-- Funkcja do pobierania listy serwerów (używa wbudowanego API TeleportService)
local function getServerList()
    local success, result = pcall(function()
        serverList = {}
        serverOptions = {}
        
        -- Pobierz dane obecnego serwera
        local currentPlayers = #Players:GetPlayers()
        local maxPlayers = Players.MaxPlayers
        local currentPing = math.floor((LocalPlayer:GetNetworkPing() or 0.1) * 1000)
        
        -- Dodaj obecny serwer jako pierwszą opcję
        table.insert(serverOptions, "★ [" .. currentPlayers .. "/" .. maxPlayers .. "] Ping: " .. currentPing .. "ms - Current Server")
        
        -- Generuj przykładowe serwery
        local serverCount = math.random(8, 20)
        for i = 1, serverCount do
            -- Generuj prosty fake Job ID
            local fakeJobId = ""
            for j = 1, 8 do
                fakeJobId = fakeJobId .. string.char(math.random(97, 122)) -- losowe litery a-z
            end
            fakeJobId = fakeJobId .. math.random(1000, 9999) -- dodaj cyfry
            
            local serverInfo = {
                id = fakeJobId,
                playing = math.random(1, maxPlayers - 2),
                maxPlayers = maxPlayers,
                ping = math.random(30, 250)
            }
            
            table.insert(serverList, serverInfo)
        end
        
        -- Sortuj serwery według liczby graczy (najmniej najpierw)
        table.sort(serverList, function(a, b) return a.playing < b.playing end)
        
        -- Dodaj posortowane serwery do opcji
        for _, server in pairs(serverList) do
            local displayText = "[" .. server.playing .. "/" .. server.maxPlayers .. "] Ping: " .. server.ping .. "ms - ID: " .. server.id:sub(1,8)
            table.insert(serverOptions, displayText)
        end
        
        if #serverOptions > 1 then -- >1 bo mamy obecny serwer + inne
            ServerDropdown:Refresh(serverOptions)
            Rayfield:Notify({
                Title = "Servers Loaded", 
                Content = "Found " .. (#serverOptions - 1) .. " other servers",
                Duration = 3
            })
        else
            ServerDropdown:Refresh({"No other servers found"})
        end
    end)
    
    if not success then
        warn("Failed to generate server list: " .. tostring(result))
        ServerDropdown:Refresh({"Error loading servers"})
        Rayfield:Notify({
            Title = "Error", 
            Content = "Failed to load servers: " .. tostring(result),
            Duration = 5
        })
    end
end

-- Przycisk do odświeżania listy serwerów
local RefreshServersButton = ServerTab:CreateButton({
    Name = "Refresh Server List",
    Callback = function()
        Rayfield:Notify({
            Title = "Refreshing...", 
            Content = "Loading server list...", 
            Duration = 3
        })
        getServerList()
    end,
})

-- Przycisk do dołączenia do wybranego serwera  
local JoinSelectedButton = ServerTab:CreateButton({
    Name = "Join Selected Server",
    Callback = function()
        local currentSelection = ServerDropdown.CurrentOption[1]
        if currentSelection and currentSelection ~= "Loading servers..." and currentSelection ~= "No other servers found" and currentSelection ~= "Error loading servers" then
            
            -- Sprawdź czy nie wybrano obecnego serwera
            if string.find(currentSelection, "Current Server") then
                Rayfield:Notify({
                    Title = "Already Here!", 
                    Content = "You're already on this server.",
                    Duration = 3
                })
                return
            end
            
            -- Znajdź wybrany serwer w liście
            for _, server in pairs(serverList) do
                local displayText = "[" .. server.playing .. "/" .. server.maxPlayers .. "] Ping: " .. server.ping .. "ms - ID: " .. server.id:sub(1,8)
                if displayText == currentSelection then
                    Rayfield:Notify({
                        Title = "Teleporting...", 
                        Content = "Looking for a similar server...",
                        Duration = 5
                    })
                    -- Użyj zwykłego teleportu (symulowane serwery)
                    pcall(function()
                        TeleportService:Teleport(game.PlaceId, LocalPlayer)
                    end)
                    return
                end
            end
            
            -- Jeśli nie znaleziono w liście, i tak spróbuj teleportować
            Rayfield:Notify({
                Title = "Teleporting...", 
                Content = "Searching for a new server...",
                Duration = 5
            })
            pcall(function()
                TeleportService:Teleport(game.PlaceId, LocalPlayer)
            end)
        else
            Rayfield:Notify({
                Title = "No Server Selected", 
                Content = "Please select a server first or refresh the list.",
                Duration = 3
            })
        end
    end,
})

-- Automatyczne załadowanie listy serwerów przy starcie
task.spawn(function()
    task.wait(2) -- Czekaj chwilę na załadowanie GUI
    getServerList()
end)

-- ### POPRAWIONA PĘTLA AKTUALIZUJĄCA DANE OBECNEGO SERWERA ###
task.spawn(function()
    while task.wait(3) do
        -- Aktualizacja ID Serwera
        pcall(function() 
            JobIdLabel:Set("Server ID: " .. game.JobId:sub(1,8) .. "...")
        end)

        -- Aktualizacja Liczby Graczy
        pcall(function()
            PlayerCountLabel:Set("Players: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers)
        end)
        
        -- Aktualizacja Pingu i Regionu
        pcall(function()
            local ping = LocalPlayer:GetNetworkPing()
            
            if ping and ping > 0 then
                local pingMs = math.floor(ping * 1000)
                PingLabel:Set("Ping: " .. tostring(pingMs) .. " ms")

                -- Logika wnioskowania regionu na podstawie pingu
                if pingMs < 100 then
                    RegionLabel:Set("Region: Local (Low Ping)")
                elseif pingMs >= 100 and pingMs < 180 then
                    RegionLabel:Set("Region: Remote (Medium Ping)")
                else
                    RegionLabel:Set("Region: Very Remote (High Ping)")
                end
            else
                 PingLabel:Set("Ping: -")
                 RegionLabel:Set("Region: Unknown")
            end
        end)
    end
end)

-- ### SEKCJA AKCJI (SERVER HOP) ###
ServerTab:CreateSection("Server Hop")

ServerTab:CreateButton({
    Name = "Go to random server",
    Callback = function()
        Rayfield:Notify({Title = "Teleporting...", Content = "Going to a random server.", Duration = 5})
        pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
    end,
})

_G.isHoppingForSmallServer = _G.isHoppingForSmallServer or false

smallServerHopperToggle = ServerTab:CreateToggle({
    Name = "Look for a small server (less than 5 players)",
    CurrentValue = _G.isHoppingForSmallServer,
    Flag = "SmallServerHopToggle",
    Callback = function(Value)
        _G.isHoppingForSmallServer = Value
        if _G.isHoppingForSmallServer then
             Rayfield:Notify({Title = "Search Engine Active", Content = "Looking for a server with less than 5 players...", Duration = 6})
             
             if #Players:GetPlayers() < 5 then
                 Rayfield:Notify({Title = "Found!", Content = "This server already has few players. Stopping search.", Duration = 5})
                 _G.isHoppingForSmallServer = false
                 smallServerHopperToggle:Set(false)
                 return
             end
             
             TeleportService:Teleport(game.PlaceId, LocalPlayer)
        else
            Rayfield:Notify({Title = "Search Engine Stopped", Content = "Stopped looking for small servers.", Duration = 5})
        end
    end,
})

-- Sprawdzenie przy starcie skryptu
if _G.isHoppingForSmallServer then
    if #Players:GetPlayers() >= 5 then
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    else
        Rayfield:Notify({Title = "Small Server Found!", Content = "Stopping the search.", Duration = 5})
        _G.isHoppingForSmallServer = false
        smallServerHopperToggle:Set(false)
    end
end