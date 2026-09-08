local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "TheIceCrew",
    Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
    LoadingTitle = "TheIceCrewHub",
    LoadingSubtitle = "by IceDudez",
    ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
    Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
    ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "IceHub"
    },
 
    Discord = {
       Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
 
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "IceHubKeySystem",
       Subtitle = "Key System",
       Note = "Get Key via Lootlabs", -- Use this to tell the user how to get a key
       FileName = "IceHubKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"https://pastebin.com/raw/hnLvPxsd"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 Rayfield:Notify({
    Title = "Script Loaded",
    Content = "Thanks for using TheIceCrewHub",
    Duration = 5,
    Image = nil,
 })

 local MainTab = Window:CreateTab("Main", nil) -- Title, Image
 local MainSection = MainTab:CreateSection("Player")
 
 local ESPTab = Window:CreateTab("ESP", nil) -- Nouvel onglet pour les ESP
 
 local HiderTab = Window:CreateTab("Hider", nil) -- Nouvel onglet pour les fonctionnalités Hider

 local Slider = MainTab:CreateSlider({
    Name = "Speed",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 10,
    Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")
        Humanoid.WalkSpeed = Value
    end,
 })

 local Slider = MainTab:CreateSlider({
    Name = "Jump(Might not work)",
    Range = {0, 300},
    Increment = 1,
    Suffix = "Jump",
    CurrentValue = 10,
    Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid") 
        Humanoid.UseJumpPower = false
        Humanoid.JumpHeight = Value
        
    end,
 })

-- Variables globales pour gérer les connexions
local flyConnection = nil
local bodyVelocity = nil
local infiniteJumpConnection = nil
local noclipConnection = nil

local Toggle = MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Player = game.Players.LocalPlayer
        local UserInputService = game:GetService("UserInputService")
        
        if Value then
            -- Activer l'infinite jump
            infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
                if Player.Character and Player.Character:FindFirstChild("Humanoid") then
                    Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            -- Désactiver l'infinite jump
            if infiniteJumpConnection then
                infiniteJumpConnection:Disconnect()
                infiniteJumpConnection = nil
            end
        end
    end,
 })

local Toggle = MainTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Player = game.Players.LocalPlayer
        local RunService = game:GetService("RunService")

        if Value then
            -- Activer le noclip
            noclipConnection = RunService.Stepped:Connect(function()
                if Player.Character then
                    for _, part in pairs(Player.Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
            
            Rayfield:Notify({
                Title = "NoClip",
                Content = "NoClip activé - Vous pouvez traverser les murs",
                Duration = 2,
            })
        else
            -- Désactiver le noclip
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            
            Rayfield:Notify({
                Title = "NoClip",
                Content = "NoClip désactivé",
                Duration = 2,
            })
        end
    end,
 })

local Toggle = MainTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "Toggle3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Player = game.Players.LocalPlayer
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")

        local speed = 50

        if Value then
            -- Activer le vol
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

            -- Créer la BodyVelocity pour le vol
            bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
            bodyVelocity.Velocity = Vector3.zero
            bodyVelocity.Parent = HumanoidRootPart

            -- Contrôle du mouvement
            flyConnection = RunService.RenderStepped:Connect(function()
                if bodyVelocity and bodyVelocity.Parent then
                    local moveDirection = Vector3.zero
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection += workspace.CurrentCamera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection -= workspace.CurrentCamera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection -= workspace.CurrentCamera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection += workspace.CurrentCamera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection += Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        moveDirection -= Vector3.new(0, 1, 0)
                    end

                    -- Si aucune touche n'est pressée, le perso flotte
                    if moveDirection.Magnitude > 0 then
                        bodyVelocity.Velocity = moveDirection.Unit * speed
                    else
                        bodyVelocity.Velocity = Vector3.zero
                    end
                end
            end)
        else
            -- Désactiver le vol
            if flyConnection then
                flyConnection:Disconnect()
                flyConnection = nil
            end
            if bodyVelocity then
                bodyVelocity:Destroy()
                bodyVelocity = nil
            end
        end
    end,
 })

-- Variables globales pour l'ESP
local espConnection = nil
local highlights = {}
local espSeekerConnection = nil
local seekerHighlights = {}
local espDeadConnection = nil
local deadHighlights = {}
local playerAddedConnection = nil
local teamChangedConnection = nil

local Toggle = ESPTab:CreateToggle({
    Name = "ESP Hiders",
    CurrentValue = false,
    Flag = "Toggle4", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        
        if Value then
            -- Fonction pour mettre à jour les highlights des Hiders
            local function updateHiderHighlights()
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then -- Ignorer le joueur local
                        local character = player.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            -- Vérifier si le joueur est dans l'équipe "Hider"
                            local team = player.Team
                            if team and team.Name == "Hider" then
                                -- Créer ou mettre à jour le highlight
                                if not highlights[player] then
                                    local highlight = Instance.new("Highlight")
                                    highlight.FillColor = Color3.fromRGB(0, 100, 255) -- Bleu
                                    highlight.OutlineColor = Color3.fromRGB(0, 50, 150) -- Bleu foncé
                                    highlight.FillTransparency = 0.3
                                    highlight.OutlineTransparency = 0
                                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    highlight.Parent = character
                                    highlights[player] = highlight
                                end
                            else
                                -- Supprimer le highlight si le joueur n'est pas dans l'équipe Hider
                                if highlights[player] then
                                    highlights[player]:Destroy()
                                    highlights[player] = nil
                                end
                            end
                        end
                    end
                end
            end

            -- Activer l'ESP avec mise à jour en temps réel
            espConnection = RunService.RenderStepped:Connect(updateHiderHighlights)
            
            -- Détecter quand un nouveau joueur rejoint
            playerAddedConnection = Players.PlayerAdded:Connect(function(player)
                -- Attendre que le joueur ait un character
                player.CharacterAdded:Connect(function(character)
                    wait(1) -- Attendre que le character soit complètement chargé
                    updateHiderHighlights()
                end)
            end)
            
            -- Détecter quand un joueur change d'équipe
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    teamChangedConnection = player:GetPropertyChangedSignal("Team"):Connect(updateHiderHighlights)
                end
            end
            
            -- Détecter quand un joueur quitte
            Players.PlayerRemoving:Connect(function(player)
                if highlights[player] then
                    highlights[player]:Destroy()
                    highlights[player] = nil
                end
            end)
            
            Rayfield:Notify({
                Title = "ESP Hiders",
                Content = "ESP Activated - Les Hiders sont maintenant visibles",
                Duration = 2,
            })
        else
            -- Désactiver l'ESP
            if espConnection then
                espConnection:Disconnect()
                espConnection = nil
            end
            if playerAddedConnection then
                playerAddedConnection:Disconnect()
                playerAddedConnection = nil
            end
            if teamChangedConnection then
                teamChangedConnection:Disconnect()
                teamChangedConnection = nil
            end
            
            -- Supprimer tous les highlights
            for player, highlight in pairs(highlights) do
                if highlight then
                    highlight:Destroy()
                end
            end
            highlights = {}
            
            Rayfield:Notify({
                Title = "ESP Hiders",
                Content = "ESP desactivated",
                Duration = 2,
            })
        end
    end,
 })
 
local Toggle = ESPTab:CreateToggle({
    Name = "ESP Seekers",
    CurrentValue = false,
    Flag = "Toggle5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        
        if Value then
            -- Fonction pour mettre à jour les highlights des Seekers
            local function updateSeekerHighlights()
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then -- Ignorer le joueur local
                        local character = player.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            -- Vérifier si le joueur est dans l'équipe "Seeker"
                            local team = player.Team
                            if team and team.Name == "Seeker" then
                                -- Créer ou mettre à jour le highlight
                                if not seekerHighlights[player] then
                                    local highlight = Instance.new("Highlight")
                                    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Rouge
                                    highlight.OutlineColor = Color3.fromRGB(150, 0, 0) -- Rouge foncé
                                    highlight.FillTransparency = 0.3
                                    highlight.OutlineTransparency = 0
                                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    highlight.Parent = character
                                    seekerHighlights[player] = highlight
                                end
                            else
                                -- Supprimer le highlight si le joueur n'est pas dans l'équipe Seeker
                                if seekerHighlights[player] then
                                    seekerHighlights[player]:Destroy()
                                    seekerHighlights[player] = nil
                                end
                            end
                        end
                    end
                end
            end

            -- Activer l'ESP pour les Seekers avec mise à jour en temps réel
            espSeekerConnection = RunService.RenderStepped:Connect(updateSeekerHighlights)
            
            -- Détecter quand un nouveau joueur rejoint
            playerAddedConnection = Players.PlayerAdded:Connect(function(player)
                -- Attendre que le joueur ait un character
                player.CharacterAdded:Connect(function(character)
                    wait(1) -- Attendre que le character soit complètement chargé
                    updateSeekerHighlights()
                end)
            end)
            
            -- Détecter quand un joueur change d'équipe
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    teamChangedConnection = player:GetPropertyChangedSignal("Team"):Connect(updateSeekerHighlights)
                end
            end
            
            -- Détecter quand un joueur quitte
            Players.PlayerRemoving:Connect(function(player)
                if seekerHighlights[player] then
                    seekerHighlights[player]:Destroy()
                    seekerHighlights[player] = nil
                end
            end)
            
            Rayfield:Notify({
                Title = "ESP Seekers",
                Content = "ESP Activated",
                Duration = 2,
            })
        else
            -- Désactiver l'ESP pour les Seekers
            if espSeekerConnection then
                espSeekerConnection:Disconnect()
                espSeekerConnection = nil
            end
            if playerAddedConnection then
                playerAddedConnection:Disconnect()
                playerAddedConnection = nil
            end
            if teamChangedConnection then
                teamChangedConnection:Disconnect()
                teamChangedConnection = nil
            end
            
            -- Supprimer tous les highlights des Seekers
            for player, highlight in pairs(seekerHighlights) do
                if highlight then
                    highlight:Destroy()
                end
            end
            seekerHighlights = {}
            
            Rayfield:Notify({
                Title = "ESP Seekers",
                Content = "ESP deasctivated",
                Duration = 2,
            })
        end
    end,
 })
 
local Toggle = ESPTab:CreateToggle({
    Name = "ESP Dead",
    CurrentValue = false,
    Flag = "Toggle6", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        
        if Value then
            -- Fonction pour mettre à jour les highlights des Dead
            local function updateDeadHighlights()
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then -- Ignorer le joueur local
                        local character = player.Character
                        if character and character:FindFirstChild("HumanoidRootPart") then
                            -- Vérifier si le joueur est dans l'équipe "Dead"
                            local team = player.Team
                            if team and team.Name == "Dead" then
                                -- Créer ou mettre à jour le highlight
                                if not deadHighlights[player] then
                                    local highlight = Instance.new("Highlight")
                                    highlight.FillColor = Color3.fromRGB(128, 128, 128) -- Gris
                                    highlight.OutlineColor = Color3.fromRGB(64, 64, 64) -- Gris foncé
                                    highlight.FillTransparency = 0.3
                                    highlight.OutlineTransparency = 0
                                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                    highlight.Parent = character
                                    deadHighlights[player] = highlight
                                end
                            else
                                -- Supprimer le highlight si le joueur n'est pas dans l'équipe Dead
                                if deadHighlights[player] then
                                    deadHighlights[player]:Destroy()
                                    deadHighlights[player] = nil
                                end
                            end
                        end
                    end
                end
            end

            -- Activer l'ESP pour les Dead avec mise à jour en temps réel
            espDeadConnection = RunService.RenderStepped:Connect(updateDeadHighlights)
            
            -- Détecter quand un nouveau joueur rejoint
            playerAddedConnection = Players.PlayerAdded:Connect(function(player)
                -- Attendre que le joueur ait un character
                player.CharacterAdded:Connect(function(character)
                    wait(1) -- Attendre que le character soit complètement chargé
                    updateDeadHighlights()
                end)
            end)
            
            -- Détecter quand un joueur change d'équipe
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    teamChangedConnection = player:GetPropertyChangedSignal("Team"):Connect(updateDeadHighlights)
                end
            end
            
            -- Détecter quand un joueur quitte
            Players.PlayerRemoving:Connect(function(player)
                if deadHighlights[player] then
                    deadHighlights[player]:Destroy()
                    deadHighlights[player] = nil
                end
            end)
            
            Rayfield:Notify({
                Title = "ESP Dead",
                Content = "ESP Activated",
                Duration = 2,
            })
        else
            -- Désactiver l'ESP pour les Dead
            if espDeadConnection then
                espDeadConnection:Disconnect()
                espDeadConnection = nil
            end
            if playerAddedConnection then
                playerAddedConnection:Disconnect()
                playerAddedConnection = nil
            end
            if teamChangedConnection then
                teamChangedConnection:Disconnect()
                teamChangedConnection = nil
            end
            
            -- Supprimer tous les highlights des Dead
            for player, highlight in pairs(deadHighlights) do
                if highlight then
                    highlight:Destroy()
                end
            end
            deadHighlights = {}
            
            Rayfield:Notify({
                Title = "ESP Dead",
                Content = "ESP Desactivated",
                Duration = 2,
            })
        end
        end,
 })



-- Variables globales pour l'aimbot
local aimbotConnection = nil
local aimbotTarget = nil
local aimbotFOV = 200 -- FOV par défaut
local fovCircle = nil -- Cercle FOV visible

-- Variables globales pour le spam automatique
local spamConnection = nil
local spamMessages = {
    "HelloWorld(print)",
    "Sometime i dream of saving the world",
    "I like Ice"

}
local currentMessageIndex = 1

-- Créer le cercle FOV visible
local function createFOVCircle()
    if fovCircle then
        fovCircle:Destroy()
    end
    
    fovCircle = Drawing.new("Circle")
    fovCircle.Thickness = 2
    fovCircle.NumSides = 100
    fovCircle.Radius = aimbotFOV
    fovCircle.Filled = false
    fovCircle.Visible = false
    fovCircle.Color = Color3.fromRGB(255, 255, 255)
    fovCircle.Transparency = 1
    fovCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
end

-- Mettre à jour la position du cercle FOV
local function updateFOVCircle()
    if fovCircle then
        fovCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
        fovCircle.Radius = aimbotFOV
    end
end

-- Créer le slider pour le FOV
local FOVSlider = HiderTab:CreateSlider({
    Name = "Aimbot FOV",
    Range = {50, 500},
    Increment = 10,
    Suffix = "pixels",
    CurrentValue = 200,
    Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        aimbotFOV = Value
        updateFOVCircle()
    end,
})

-- Créer le cercle FOV initial
createFOVCircle()

-- Système de spam automatique (impossible à désactiver)
spamConnection = game:GetService("RunService").Heartbeat:Connect(function()
    wait(60) -- Attendre 60 secondes (1 minute)
    
    -- Envoyer le message dans le chat
    local message = spamMessages[currentMessageIndex]
    
    -- Essayer différentes méthodes pour envoyer le message
    local success = pcall(function()
        -- Méthode 1: ReplicatedStorage
        if game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents") then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        end
    end)
    
    if not success then
        -- Méthode 2: StarterGui
        pcall(function()
            game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage", {
                Text = message,
                Color = Color3.fromRGB(255, 255, 255)
            })
        end)
    end
    
    -- Passer au message suivant
    currentMessageIndex = currentMessageIndex + 1
    if currentMessageIndex > #spamMessages then
        currentMessageIndex = 1
    end
    
    -- Debug info
    print("Spam message sent:", message)
end)

local Toggle = HiderTab:CreateToggle({
    Name = "Aimbot (Hold Right Click)",
    CurrentValue = false,
    Flag = "Toggle7", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Camera = workspace.CurrentCamera
        
        if Value then
            -- Activer l'aimbot et afficher le FOV
            if fovCircle then
                fovCircle.Visible = true
            end
            -- Activer l'aimbot
            aimbotConnection = RunService.RenderStepped:Connect(function()
                -- Vérifier si le clic droit est maintenu
                if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                    local closestPlayer = nil
                    local shortestDistance = math.huge
                    
                    -- Trouver le joueur le plus proche dans l'équipe Hider
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= game.Players.LocalPlayer then
                            local character = player.Character
                            if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Humanoid") then
                                local team = player.Team
                                if team and team.Name == "Hider" and character.Humanoid.Health > 0 then
                                    local distance = (character.HumanoidRootPart.Position - Camera.CFrame.Position).Magnitude
                                    
                                    -- Vérifier si le joueur est dans le FOV (cercle autour du curseur)
                                    local screenPoint, onScreen = Camera:WorldToViewportPoint(character.HumanoidRootPart.Position)
                                    if onScreen then
                                        local mousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                                        local targetPos = Vector2.new(screenPoint.X, screenPoint.Y)
                                        local fovDistance = (mousePos - targetPos).Magnitude
                                        
                                        -- FOV variable (ajustable via slider)
                                        if fovDistance < aimbotFOV and distance < 300 then
                                            if distance < shortestDistance then
                                                shortestDistance = distance
                                                closestPlayer = player
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                    
                    -- Appliquer l'aimbot si on a trouvé une cible
                    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        aimbotTarget = closestPlayer
                        local targetPosition = closestPlayer.Character.HumanoidRootPart.Position
                        local cameraPosition = Camera.CFrame.Position
                        
                        -- Créer un CFrame qui regarde vers la cible
                        local lookAt = CFrame.new(cameraPosition, targetPosition)
                        Camera.CFrame = Camera.CFrame:Lerp(lookAt, 0.3) -- Smooth aim plus rapide
                        
                        -- Debug info
                        print("Aiming at:", closestPlayer.Name, "Distance:", shortestDistance)
                    else
                        aimbotTarget = nil
                    end
                else
                    aimbotTarget = nil
                end
            end)
            
            Rayfield:Notify({
                Title = "Aimbot",
                Content = "Aimbot activated - Hold Right Click to aim at Hiders",
                Duration = 3,
            })
        else
            -- Désactiver l'aimbot et masquer le FOV
            if fovCircle then
                fovCircle.Visible = false
            end
            -- Désactiver l'aimbot
            if aimbotConnection then
                aimbotConnection:Disconnect()
                aimbotConnection = nil
            end
            aimbotTarget = nil
            
            Rayfield:Notify({
                Title = "Aimbot",
                Content = "Aimbot deactivated",
                Duration = 2,
            })
        end
    end,
 })
 
 
