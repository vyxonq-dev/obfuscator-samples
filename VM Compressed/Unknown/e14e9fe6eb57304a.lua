function ConvertDropdownValue(tbl)
    if type(tbl) == "table" then
    for _,element in ipairs(tbl) do
    return tostring(element)
    end
    else
    return tostring(tbl)
    end
    end
    
    local GetRequestMethod = function()
    local iqnd = request or http_request or HttpPost or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (game and game.HttpPost) or (KRNL and KRNL.request) or (Xeno and Xeno.request)
    if iqnd then
    return iqnd
    else
    return nil
    end
    end
    function CopyLink(link)
    local url = tostring(link)
    setclipboard(url)
    Notify("Success!", "Copied Link!", 4, true)
    end
    function OpenLink(link)
    local url = tostring(link)
    if WebHandler then
    local suc, err = pcall(function() WebHandler:OpenRBX(url) end) if not suc then CopyLink(url) end
    else
    CopyLink(url)
    end
    end
    
    local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
    local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
    local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()
    
    local Options = Library.Options
    local Toggles = Library.Toggles
    
    function Notify(title, content, time, mode)
    time = time or 4
    mode = mode or false
    Library:Notify({
        Title = title,
        Content = content,
        Duration = time,
    })
    end
    
    function DestroyUI()
    task.spawn(function()
    pcall(function()
    Window:Destroy()
    end)
    pcall(function()
    Library:Unload()
    end)
    end)
    end
    
    local Window = Library:CreateWindow({
       Title = "Nyxus Hub",
       Footer = "by nyxus",
       Icon = 77543656006255,
       NotifySide = "Right",
       ShowCustomCursor = true,
    })
    
    
    local Homepage = Window:AddTab("Home", "info")
    local HomeGroup = Homepage:AddLeftGroupbox("Player Stats", "home")
    
    local function getPlayerStats()
        local stats = {}
        local success, err = pcall(function()
            local player = game.Players.LocalPlayer
            local statsFolder = player:FindFirstChild("Stats")
            
            if statsFolder then
                local cash = statsFolder:FindFirstChild("Cash")
                stats.Cash = cash and cash.Value or 0
                
                local equippedKiller = statsFolder:FindFirstChild("EquippedKiller")
                stats.EquippedKiller = equippedKiller and equippedKiller.Value or "None"
                
                local killerWins = statsFolder:FindFirstChild("KillerWins")
                local survivorWins = statsFolder:FindFirstChild("SurvivorWins")
                stats.KillerWins = killerWins and killerWins.Value or 0
                stats.SurvivorWins = survivorWins and survivorWins.Value or 0
                
                local timePlayed = statsFolder:FindFirstChild("TimePlayed")
                if timePlayed then
                    local totalSeconds = timePlayed.Value
                    local days = math.floor(totalSeconds / 86400)
                    local hours = math.floor((totalSeconds % 86400) / 3600)
                    local minutes = math.floor((totalSeconds % 3600) / 60)
                    stats.TimePlayed = string.format("%dd %dh %dm", days, hours, minutes)
                else
                    stats.TimePlayed = "0d 0h 0m"
                end
                
                local masteriesFolder = statsFolder:FindFirstChild("Masteries")
                local masteries = {}
                if masteriesFolder then
                    local masteryKillers = {
                        "Artful", "Badware", "Harken", "Killdroid", "Pursuer"
                    }
                    for _, killerName in pairs(masteryKillers) do
                        local mastery = masteriesFolder:FindFirstChild(killerName)
                        if mastery and mastery:IsA("IntValue") and mastery.Value > 0 then
                            table.insert(masteries, killerName .. " (" .. mastery.Value .. ")")
                        end
                    end
                end
                stats.Masteries = #masteries > 0 and table.concat(masteries, ", ") or "None"
                
                local killersFolder = statsFolder:FindFirstChild("Killers")
                local killerStats = {}
                if killersFolder then
                    local killerNames = {"Artful", "Badware", "Harken", "Killdroid", "Pursuer"}
                    
                    for _, killerName in pairs(killerNames) do
                        local killer = killersFolder:FindFirstChild(killerName)
                        if killer and killer:IsA("StringValue") then
                            local equippedSkin = killer:GetAttribute("EquippedSkin") or "Default"
                            local kills = killer:GetAttribute("Kills") or 0
                            killerStats[killerName] = {
                                EquippedSkin = equippedSkin,
                                Kills = kills
                            }
                        else
                            killerStats[killerName] = {
                                EquippedSkin = "Not Owned",
                                Kills = 0
                            }
                        end
                    end
                else
                    local killerNames = {"Artful", "Badware", "Harken", "Killdroid", "Pursuer"}
                    for _, killerName in pairs(killerNames) do
                        killerStats[killerName] = {
                            EquippedSkin = "Not Owned",
                            Kills = 0
                        }
                    end
                end
                stats.KillerStats = killerStats
            else
                stats.Cash = 0
                stats.EquippedKiller = "None"
                stats.KillerWins = 0
                stats.SurvivorWins = 0
                stats.TimePlayed = "0d 0h 0m"
                stats.Masteries = "None"
                local killerNames = {"Artful", "Badware", "Harken", "Killdroid", "Pursuer"}
                stats.KillerStats = {}
                for _, killerName in pairs(killerNames) do
                    stats.KillerStats[killerName] = {
                        EquippedSkin = "Not Owned",
                        Kills = 0
                    }
                end
            end
        end)
        
        if not success then
            stats.Cash = 0
            stats.EquippedKiller = "None"
            stats.KillerWins = 0
            stats.SurvivorWins = 0
            stats.TimePlayed = "0d 0h 0m"
            stats.Masteries = "None"
            local killerNames = {"Artful", "Badware", "Harken", "Killdroid", "Pursuer"}
            stats.KillerStats = {}
            for _, killerName in pairs(killerNames) do
                stats.KillerStats[killerName] = {
                    EquippedSkin = "Not Owned",
                    Kills = 0
                }
            end
        end
        
        return stats
    end
    
    local playerStats = getPlayerStats()
    
    HomeGroup:AddLabel("Cash: " .. tostring(playerStats.Cash), true)
    HomeGroup:AddLabel("Equipped Killer: " .. playerStats.EquippedKiller, true)
    
    local equippedSkin = "None"
    if playerStats.EquippedKiller ~= "None" and playerStats.KillerStats[playerStats.EquippedKiller] then
        equippedSkin = playerStats.KillerStats[playerStats.EquippedKiller].EquippedSkin
    end
    HomeGroup:AddLabel("Equipped Skin: " .. equippedSkin, true)
    
    HomeGroup:AddLabel("Time Played: " .. playerStats.TimePlayed, true)
    HomeGroup:AddLabel("Killer Wins: " .. tostring(playerStats.KillerWins), true)
    HomeGroup:AddLabel("Survivor Wins: " .. tostring(playerStats.SurvivorWins), true)
    HomeGroup:AddLabel("Masteries: " .. playerStats.Masteries, true)
    
    HomeGroup:AddDivider()
    HomeGroup:AddLabel("Killer Stats:", true)
    HomeGroup:AddLabel("Artful: " .. playerStats.KillerStats.Artful.EquippedSkin .. " (" .. playerStats.KillerStats.Artful.Kills .. " kills)", true)
    HomeGroup:AddLabel("Badware: " .. playerStats.KillerStats.Badware.EquippedSkin .. " (" .. playerStats.KillerStats.Badware.Kills .. " kills)", true)
    HomeGroup:AddLabel("Harken: " .. playerStats.KillerStats.Harken.EquippedSkin .. " (" .. playerStats.KillerStats.Harken.Kills .. " kills)", true)
    HomeGroup:AddLabel("Killdroid: " .. playerStats.KillerStats.Killdroid.EquippedSkin .. " (" .. playerStats.KillerStats.Killdroid.Kills .. " kills)", true)
    HomeGroup:AddLabel("Pursuer: " .. playerStats.KillerStats.Pursuer.EquippedSkin .. " (" .. playerStats.KillerStats.Pursuer.Kills .. " kills)", true)
    
    local LocalPlayer, LP = game.Players.LocalPlayer, game.Players.LocalPlayer
    local Character, Char
    local HumanoidRootPart, HRP
    local Humanoid, Hum
    pcall(function()
    Character, Char = LocalPlayer.Character, LocalPlayer.Character
    end)
    pcall(function()
    HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
    end)
    pcall(function()
    Humanoid, Hum = Character.Humanoid, Character.Humanoid
    end)
    
    LocalPlayer.CharacterAdded:Connect(function()
    pcall(function()
    Character, Char = nil, nil
    HumanoidRootPart, HRP = nil, nil
    Humanoid, Hum = nil, nil
    task.wait()
    repeat task.wait() until LocalPlayer.Character
    Character, Char = LocalPlayer.Character, LocalPlayer.Character
    task.wait()
    repeat task.wait() until Character:FindFirstChild("HumanoidRootPart")
    HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
    task.wait()
    repeat task.wait() until Character:FindFirstChild("Humanoid")
    Humanoid, Hum = Character.Humanoid, Character.Humanoid
    end)
    end)
    
    pcall(function()
    StaminaModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Movement"))
    end)
    
    function SetStaminaProperty(property, value)
    if property == "MaxStamina" then
    Char:SetAttribute("MaxStamina", value)
    elseif property == "Stamina" then
    if StaminaModule then
    StaminaModule["Stamina"] = value
    end
    elseif property == "Fatigue" then
    Char:SetAttribute("Fatigue", value)
    elseif property == "WalkSpeed" then
    Hum.WalkSpeed = value
    elseif property == "SprintSpeed" then
    Char:SetAttribute("SprintSpeed", value)
    elseif property == "WalkSpeed" then
    Char:SetAttribute("WalkSpeed", value)
    elseif property == "CanJump" then
    if value == true then Hum.JumpPower = 50 else Hum.JumpPower = 0 end
    end
    end
    
    local AimbotEnabled = false
    local AimbotSmoothing = 5
    local AimbotConnection = nil
    local CurrentTarget = nil
    local TargetTransitionSpeed = 0.1
    local LostTargetTime = 0
    local MaxLostTargetTime = 2
    local IsTargetHidden = false
    
    function GetPlayerRole()
        local player = game.Players.LocalPlayer
        if not player.Character then return nil end
        
        local survivorTeam = workspace:FindFirstChild("GameAssets")
        if survivorTeam then
            survivorTeam = survivorTeam:FindFirstChild("Teams")
            if survivorTeam then
                local survivorFolder = survivorTeam:FindFirstChild("Survivor")
                if survivorFolder and survivorFolder:FindFirstChild(player.Name) then
                    return "Survivor"
                end
                
                local killerFolder = survivorTeam:FindFirstChild("Killer")
                if killerFolder and killerFolder:FindFirstChild(player.Name) then
                    return "Killer"
                end
            end
        end
        
        return nil
    end
    
    function CanSeePlayer(targetPlayer)
        if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return false
        end
        
        local localPlayer = game.Players.LocalPlayer
        if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return false
        end
        
        local localPosition = localPlayer.Character.HumanoidRootPart.Position
        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        raycastParams.FilterDescendantsInstances = {localPlayer.Character, targetPlayer.Character}
        
        local raycastResult = workspace:Raycast(localPosition, (targetPosition - localPosition), raycastParams)
        
        if raycastResult then
            return false
        end
        
        return true
    end
    
    function GetClosestPlayer(role)
        local closestPlayer = nil
        local closestDistance = math.huge
        local localPlayer = game.Players.LocalPlayer
        
        if not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            return nil
        end
        
        local localPosition = localPlayer.Character.HumanoidRootPart.Position
        
        local teamFolder = nil
        if role == "Survivor" then
            local gameAssets = workspace:FindFirstChild("GameAssets")
            if gameAssets then
                local teams = gameAssets:FindFirstChild("Teams")
                if teams then
                    teamFolder = teams:FindFirstChild("Survivor")
                end
            end
        elseif role == "Killer" then
            local gameAssets = workspace:FindFirstChild("GameAssets")
            if gameAssets then
                local teams = gameAssets:FindFirstChild("Teams")
                if teams then
                    teamFolder = teams:FindFirstChild("Killer")
                end
            end
        end
        
        if not teamFolder then return nil end
        
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if teamFolder:FindFirstChild(player.Name) then
                    if CanSeePlayer(player) then
                        local distance = (player.Character.HumanoidRootPart.Position - localPosition).Magnitude
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
        end
        
        return closestPlayer
    end
    
    function AimbotLoop()
        if AimbotConnection then
            AimbotConnection:Disconnect()
            AimbotConnection = nil
        end
        
        if not AimbotEnabled then return end
        
        AimbotConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not AimbotEnabled or not Character or not HumanoidRootPart then return end
            
            local playerRole = GetPlayerRole()
            if not playerRole then return end
            
            local targetRole = playerRole == "Killer" and "Survivor" or "Killer"
            local targetPlayer = GetClosestPlayer(targetRole)
            
            if CurrentTarget then
                if not CanSeePlayer(CurrentTarget) then
                    if not IsTargetHidden then
                        IsTargetHidden = true
                        LostTargetTime = 0
                    else
                        LostTargetTime = LostTargetTime + (1/60)
                    end
                    
                    if LostTargetTime >= MaxLostTargetTime then
                        CurrentTarget = nil
                        IsTargetHidden = false
                        LostTargetTime = 0
                    end
                else
                    IsTargetHidden = false
                    LostTargetTime = 0
                end
            end
            
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if CurrentTarget ~= targetPlayer then
                    CurrentTarget = targetPlayer
                    IsTargetHidden = false
                    LostTargetTime = 0
                    TargetTransitionSpeed = 0.1
                end
                
                local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
                local localPosition = HumanoidRootPart.Position
                local direction = (targetPosition - localPosition).Unit
                
                local lookDirection = Vector3.new(direction.X, 0, direction.Z)
                
                local currentCFrame = HumanoidRootPart.CFrame
                local targetCFrame = CFrame.lookAt(localPosition, localPosition + lookDirection)
                
                local baseSmoothing = 1 / AimbotSmoothing
                local smoothingFactor
                
                if IsTargetHidden then
                    smoothingFactor = baseSmoothing * 0.1
                elseif CurrentTarget == targetPlayer then
                    smoothingFactor = baseSmoothing
                else
                    smoothingFactor = TargetTransitionSpeed
                end
                
                local smoothedCFrame = currentCFrame:Lerp(targetCFrame, smoothingFactor)
                
                if TargetTransitionSpeed < baseSmoothing then
                    TargetTransitionSpeed = math.min(TargetTransitionSpeed + 0.01, baseSmoothing)
                end
                
                HumanoidRootPart.CFrame = CFrame.new(smoothedCFrame.Position, smoothedCFrame.Position + lookDirection)
            else
                CurrentTarget = nil
                IsTargetHidden = false
                LostTargetTime = 0
            end
        end)
    end
    
    pcall(function()
    local Announcements = Window:AddTab("Announce", "megaphone")
    local AnnounceGroup = Announcements:AddLeftGroupbox("Announcements", "megaphone")
    AnnounceGroup:AddLabel("Script Version: 1.0", true)
    AnnounceGroup:AddDivider()
    AnnounceGroup:AddLabel("fuck nexer, this is its own script now. nyxus 4ever", true)
    AnnounceGroup:AddDivider()
    AnnounceGroup:AddLabel("Also join our discord server for early updates, free premium access when freemium is gone and many other things...", true)
    AnnounceGroup:AddButton({
        Text = "Copy Discord Server Link",
        Func = function()
            setclipboard(tostring("https://discord.gg/GwwKGXvaF8"))
            Notify("Success!", "Copied Link!", 3, true)
        end,
    })
    end)
    
    local Tab_1 = Window:AddTab("Stamina", "zap")
    local StaminaLeftGroup = Tab_1:AddLeftGroupbox("Fast Functions", "zap")
    
    StaminaLeftGroup:AddLabel("You can change your stamina properties here.", true)
    StaminaLeftGroup:AddDivider()
    
    StaminaLeftGroup:AddButton({
        Text = "Infinite Stamina",
        Func = function()
            SetStaminaProperty("MaxStamina", (1/0))
            SetStaminaProperty("Stamina", (1/0))
        end,
    })
    
    StaminaLeftGroup:AddButton({
        Text = "Become Fast",
        Func = function()
            Humanoid.WalkSpeed = 50
            SetStaminaProperty("SprintSpeed", 70)
        end,
    })
    
    StaminaLeftGroup:AddButton({
        Text = "Enable/Disable Jump",
        Func = function()
            if Hum.JumpPower == 0 then
                SetStaminaProperty("CanJump", true)
            else
                SetStaminaProperty("CanJump", false)
            end
        end,
    })
    
    StaminaLeftGroup:AddToggle("NoStaminaLoss", {
        Text = "No Stamina Loss",
        Default = false,
    })
    
    Toggles.NoStaminaLoss:OnChanged(function()
        NoStaminaLoss = Toggles.NoStaminaLoss.Value
        if NoStaminaLoss == true then
            repeat task.wait(0.003)
                if Character and Character:GetAttribute("MaxStamina") then
                    SetStaminaProperty("Stamina", Character:GetAttribute("MaxStamina"))
                end
            until NoStaminaLoss == false
        end
    end)
    
    StaminaLeftGroup:AddToggle("NoFatigue", {
        Text = "No Fatigue",
        Default = false,
    })
    
    Toggles.NoFatigue:OnChanged(function()
        NoFatigue = Toggles.NoFatigue.Value
        if NoFatigue == true then
            repeat task.wait(0.003)
                if Character and Character:GetAttribute("Fatigue") and Character:GetAttribute("Fatigue") == true then
                    SetStaminaProperty("Fatigue", false)
                end
            until NoFatigue == false
        end
    end)
    
    local StaminaRightGroup = Tab_1:AddRightGroupbox("Advanced", "settings")
    
    StaminaRightGroup:AddInput("MaxStaminaInput", {
        Default = "",
        Numeric = true,
        Finished = true,
        Text = "Max Stamina",
        Placeholder = "Type Here!",
        Callback = function(Value)
            SetStaminaProperty("MaxStamina", tonumber(Value))
        end,
    })
    
    StaminaRightGroup:AddInput("StaminaInput", {
        Default = "",
        Numeric = true,
        Finished = true,
        Text = "Stamina",
        Placeholder = "Type Here!",
        Callback = function(Value)
            SetStaminaProperty("Stamina", tonumber(Value))
        end,
    })
    
    StaminaRightGroup:AddInput("WalkSpeedInput", {
        Default = "",
        Numeric = true,
        Finished = true,
        Text = "Walk Speed",
        Placeholder = "Type Here!",
        Callback = function(Value)
            SetStaminaProperty("WalkSpeed", tonumber(Value))
        end,
    })
    
    StaminaRightGroup:AddInput("SprintSpeedInput", {
        Default = "",
        Numeric = true,
        Finished = true,
        Text = "Sprint Speed",
        Placeholder = "Type Here!",
        Callback = function(Value)
            SetStaminaProperty("SprintSpeed", tonumber(Value))
        end,
    })
    
    local StaminaAutoInject = Tab_1:AddRightGroupbox("Auto Injection", "clock")
    local AI_MaxStamina, AI_WalkSpeed, AI_SprintSpeed, AutoInjectStamina
    
    StaminaAutoInject:AddLabel("Stamina settings will automatically be applied to your character 21.5 seconds after the round starts.", true)
    
    StaminaAutoInject:AddToggle("AutoInjectStamina", {
        Text = "Auto Inject",
        Default = false,
    })
    
    Toggles.AutoInjectStamina:OnChanged(function()
        AutoInjectStamina = Toggles.AutoInjectStamina.Value
    end)
    
    StaminaAutoInject:AddInput("AI_MaxStamina", {
        Default = "",
        Numeric = true,
        Finished = true,
        Text = "Max Stamina",
        Placeholder = "Type Here!",
        Callback = function(Value)
            AI_MaxStamina = Value
        end,
    })
    
    StaminaAutoInject:AddInput("AI_WalkSpeed", {
        Default = "",
        Numeric = true,
        Finished = true,
        Text = "Walk Speed",
        Placeholder = "Type Here!",
        Callback = function(Value)
            AI_WalkSpeed = Value
        end,
    })
    
    StaminaAutoInject:AddInput("AI_SprintSpeed", {
        Default = "",
        Numeric = true,
        Finished = true,
        Text = "Sprint Speed",
        Placeholder = "Type Here!",
        Callback = function(Value)
            AI_SprintSpeed = Value
        end,
    })
    
    game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(descendant)
    task.wait()
    if descendant.Name == ""..LP.Name.."" and not descendant.Parent.Name == "Ghost" and AutoInjectStamina == true then
    task.wait(21.5)
    pcall(function()
    SetStaminaProperty("MaxStamina", AI_MaxStamina)
    end)
    pcall(function()
    SetStaminaProperty("Stamina", AI_MaxStamina)
    end)
    pcall(function()
    SetStaminaProperty("WalkSpeed", AI_WalkSpeed)
    end)
    pcall(function()
    SetStaminaProperty("SprintSpeed", AI_SprintSpeed)
    end)
    end
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    local Tab_2 = Window:AddTab("Emotes", "smile")
    local EmotesGroup = Tab_2:AddLeftGroupbox("ITZZZZ PARTY TIME!!!!", "smile")
    
    EmotesGroup:AddLabel("Functions that are related to emotes.", true)
    EmotesGroup:AddDivider()
    
    EmotesGroup:AddButton({
        Text = "Open Emote Selection",
        Func = function()
            LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Visible = true
            LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Active = true
        end,
    })
    
    EmotesGroup:AddButton({
        Text = "Use Dance",
        Func = function()
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Dance")
        end,
    })
    
    EmotesGroup:AddButton({
        Text = "Use Squingle",
        Func = function()
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Squingle")
        end,
    })
    
    EmotesGroup:AddButton({
        Text = "Use Gangnam Style",
        Func = function()
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Gangnam Style")
        end,
    })
    
    EmotesGroup:AddButton({
        Text = "Use PBJ",
        Func = function()
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("PBJ")
        end,
    })
    
    EmotesGroup:AddButton({
        Text = "Use Tornado",
        Func = function()
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Tornado")
        end,
    })
    
    EmotesGroup:AddButton({
        Text = "Use Rainbow Waves ( NO VFX / SFX )",
        Func = function()
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://75513960644342"
            local planim = Humanoid:LoadAnimation(anim)
            planim:Play()
            local song = Instance.new("Sound")
            song.Volume = 1.5
            song.Looped = true
            song.SoundId = "rbxassetid://137048834753046"
            song.Parent = HumanoidRootPart
            song:Play()
            local TooLate = false
            LocalPlayer.CharacterAdded:Once(function()
                if TooLate then return end
                TooLate = true
                song:Destroy()
                planim:Stop()
                anim:Destroy()
            end)
            Humanoid.Running:Once(function()
                if TooLate then return end
                TooLate = true
                song:Destroy()
                planim:Stop()
                anim:Destroy()
            end)
        end,
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
    local AbilityNames = {"Cloak","Punch","Taunt","BonusPad","Block","Caretaker","Dash","Hotdog","Revolver","Adrenaline","Banana"}
    
    local AbilityDatas = {
        ["Adrenaline"] = {Name = "Adrenaline",InputShown = "",Tip = "Get a temporary speed boost for 6 seconds, highlighting you to your teamates and slowing you down after it\'s over.",Cooldown = 35,Icon = "rbxassetid://116399911657417",DisplayName = "Adrenaline"};
        ["Punch"] = {Name = "Punch",InputShown = "",Tip = "Swing foward stunning any killers hit for 3 seconds, if missed you\'ll get severe endlag.",Cooldown = 40,Icon = "rbxassetid://97428323453639",DisplayName = "Punch"};
        ["Caretaker"] = {Name = "Caretaker",InputShown = "",Tip = "Splash a potion infront of you, any survivors hit will heal 20 HP in total. Having this ability makes you lose 75 max health though!",Cooldown = 30,Icon = "rbxassetid://90712805517714",DisplayName = "Caretaker"};
        ["Cloak"] = {Name = "Cloak",InputShown = "",Tip = "Becoming heavily slowed but invisible for a short amount of time, Killers can still hit you though!",Cooldown = 50,Icon = "rbxassetid://90476367580326",DisplayName = "Cloak"};
        ["Block"] = {Name = "Block",InputShown = "",Tip = "Try blocking any form of damage, if successful heal 10 HP, get a speed boost and negate all the damage.",Cooldown = 40,Icon = "rbxassetid://120929805037270",DisplayName = "Block"};
        ["Dash"] = {Name = "Dash",InputShown = "",Tip = "Dash foward, after you will get fatigue for 2 seconds which slows stamina regeneration and makes it drain faster.",Cooldown = 20,Icon = "rbxassetid://73777691791017",DisplayName = "Dash"};
        ["BonusPad"] = {Name = "BonusPad",InputShown = "",Tip = "Build a temporary speed pad that speeds up any survivor who steps on it. Having this ability makes you lose 10 max health though!",Cooldown = 70,Icon = "rbxassetid://86775625332300",DisplayName = "BonusPad"};
        ["Hotdog"] = {Name = "Hotdog",InputShown = "",Tip = "Eat a hotdog, healing 15 HP at the cost of 10 stamina.",Cooldown = 15,Icon = "rbxassetid://134322360499381",DisplayName = "Hotdog"};
        ["Revolver"] = {Name = "Revolver",InputShown = "",Tip = "Shoot with your revolver stunning any killers hit for 2 seconds, you\'ll have to reload after. Having this ability makes you lose 20 max stamina though!",Cooldown = 15,Icon = "rbxassetid://107624957891469",DisplayName = "Revolver"};
        ["Taunt"] = {Name = "Taunt",InputShown = "",Tip = "Taunt the killer gaining a forcefield, highlighting the killer, and slowing them down for 5 seconds or until you\'re hit for the duration of the effect (1.25x damage).",Cooldown = 25,Icon = "rbxassetid://85436299122876",DisplayName = "Taunt"};
        ["Banana"] = {Name = "Banana",InputShown = "",Tip = "Toss a banana onto the floor, if the killer or the civilian who made it touch the banana, they will slip and be briefly stunned, the banana will naturally decay over time.",Cooldown = 20,Icon = "rbxassetid://96202444819611",DisplayName = "Banana Peel"};
    }
    
    pcall(function()
    AbilityModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Ability"))
    end)
    pcall(function()
    UIModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"))
    end)
    
    local Tab_3 = Window:AddTab("Abilities", "zap")
    local AbilitiesLeftGroup = Tab_3:AddLeftGroupbox("Get Ability", "zap")
    
    AbilitiesLeftGroup:AddLabel("You can give yourself abilities or cards with abilities.", true)
    AbilitiesLeftGroup:AddDivider()
    
    local ChoosenAbility = "Block"
    AbilitiesLeftGroup:AddDropdown("ChooseAbility", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "Choose Ability",
        Callback = function(Value)
            ChoosenAbility = Value
        end,
    })
    
    AbilitiesLeftGroup:AddButton({
        Text = "Get Choosen Ability",
        Func = function()
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(ChoosenAbility)
            AbilityModule.CreateAbility(AbilityDatas[ChoosenAbility])
        end,
    })
    
    AbilitiesLeftGroup:AddButton({
        Text = "Get All Abilities",
        Func = function()
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(AbilityNames[math.random(1, 11)]);tostring(AbilityNames[math.random(1, 11)]);}}))
            for _,ability in pairs(AbilityNames) do
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(ability);}}))
                AbilityModule.CreateAbility(AbilityDatas[tostring(ability)])
            end
        end,
    })
    
    local AbilitiesRightGroup = Tab_3:AddRightGroupbox("Get Cards", "credit-card")
    
    local CardSettings = {
        [1] = {[1]="Revolver",[2]="Caretaker"},
        [2] = {[1]="BonusPad",[2]="Caretaker"},
        [3] = {[1]="Revolver",[2]="Punch"}
    }
    
    AbilitiesRightGroup:AddLabel("First Card Settings")
    AbilitiesRightGroup:AddDropdown("Card1Ability1", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "First Ability",
        Callback = function(Value)
            CardSettings[1][1] = Value
        end,
    })
    AbilitiesRightGroup:AddDropdown("Card1Ability2", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "Second Ability",
        Callback = function(Value)
            CardSettings[1][2] = Value
        end,
    })
    
    AbilitiesRightGroup:AddDivider()
    AbilitiesRightGroup:AddLabel("Second Card Settings")
    AbilitiesRightGroup:AddDropdown("Card2Ability1", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "First Ability",
        Callback = function(Value)
            CardSettings[2][1] = Value
        end,
    })
    AbilitiesRightGroup:AddDropdown("Card2Ability2", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "Second Ability",
        Callback = function(Value)
            CardSettings[2][2] = Value
        end,
    })
    
    AbilitiesRightGroup:AddDivider()
    AbilitiesRightGroup:AddLabel("Third Card Settings")
    AbilitiesRightGroup:AddDropdown("Card3Ability1", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "First Ability",
        Callback = function(Value)
            CardSettings[3][1] = Value
        end,
    })
    AbilitiesRightGroup:AddDropdown("Card3Ability2", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "Second Ability",
        Callback = function(Value)
            CardSettings[3][2] = Value
        end,
    })
    
    AbilitiesRightGroup:AddButton({
        Text = "Summon Chosen Cards",
        Func = function()
            UIModule.AbilitySelection(unpack(CardSettings))
        end,
    })
    
    local AbilitiesSpamGroup = Tab_3:AddLeftGroupbox("Spam Ability", "repeat")
    
    local SpamAbility = "Hotdog"
    AbilitiesSpamGroup:AddDropdown("SpamAbilityDropdown", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "Ability to Spam",
        Callback = function(Value)
            SpamAbility = Value
        end,
    })
    
    AbilitiesSpamGroup:AddToggle("SpamAbilityToggle", {
        Text = "Spam Ability",
        Default = false,
    })
    
    Toggles.SpamAbilityToggle:OnChanged(function()
        AutoSpamAbility = Toggles.SpamAbilityToggle.Value
        if AutoSpamAbility == true then
            repeat task.wait(0.15)
                pcall(function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(SpamAbility)}}))
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack({tostring(SpamAbility)}))
                end)
            until AutoSpamAbility == false
        end
    end)
    
    local AbilitiesAutoInject = Tab_3:AddRightGroupbox("Auto Ability Injection", "clock")
    local AI_Ability_1, AI_Ability_2, AutoInjectAbility
    
    AbilitiesAutoInject:AddLabel("Ability will automatically get equipped ( along side with their accessories ) 5 seconds after the round starts.", true)
    
    AbilitiesAutoInject:AddToggle("AutoInjectAbility", {
        Text = "Auto Inject",
        Default = false,
    })
    
    Toggles.AutoInjectAbility:OnChanged(function()
        AutoInjectAbility = Toggles.AutoInjectAbility.Value
    end)
    
    AbilitiesAutoInject:AddDropdown("AI_Ability1", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "First Ability",
        Callback = function(Value)
            AI_Ability_1 = Value
        end,
    })
    
    AbilitiesAutoInject:AddDropdown("AI_Ability2", {
        Values = AbilityNames,
        Default = 1,
        Multi = false,
        Text = "Second Ability",
        Callback = function(Value)
            AI_Ability_2 = Value
        end,
    })
    
    game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(descendant)
    task.wait()
    if descendant.Name == ""..LP.Name.."" and not descendant.Parent.Name == "Ghost" and AutoInjectAbility == true then
    task.wait(5)
    pcall(function()
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(AI_Ability_1);tostring(AI_Ability_2);}}))
    end)
    end
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    if not game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER") then
    Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
    end
    
    _G.ESPenabledHandler = false
    _G.ESPtransHandler = 0.3
    _G.ESPshowusers = true
    _G.ESPshowhealth = true
    
    function CreateHighlight(plr)
    task.spawn(function()
    for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetChildren()) do
    if v and v.Name == ("sillyfolder_"..plr.Name) then
    v:Destroy()
    end
    end
    repeat task.wait() until game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) == nil
    local esp_folder = Instance.new("Folder")
    esp_folder.Name = "sillyfolder_"..plr.Name
    esp_folder.Parent = game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER")
          
    repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
    local plr_char = plr.Character or plr.CharacterAdded:Wait()
    for i,v in pairs(plr_char:GetChildren()) do
    if v and v:IsA("BasePart") and (v.Name == "Left Leg" or v.Name == "Left Arm" or v.Name == "Right Leg" or v.Name == "Right Arm" or v.Name == "Torso" or v.Name == "Head") then
    local esp = Instance.new("BoxHandleAdornment")
    esp.Name = "sillygirl_"..plr.Name
    esp.Adornee = v
    esp.AlwaysOnTop = true
    esp.ZIndex = 10 or 1
    esp.Size = v.Size
    esp.Transparency = (plr_char.Parent.Name == "Workspace" and 1) or tonumber(_G.ESPtransHandler)
    esp.Color = (plr_char.Parent.Name == "Killer" and BrickColor.new("Bright red")) or (plr_char.Parent.Name == "Ghost" and BrickColor.new("White")) or BrickColor.new("Bright green")
    esp.Parent = game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name)
    if v.Name == "Head" then
    local esp_stat = Instance.new("BillboardGui")
    local stat_text = Instance.new("TextLabel")
    esp_stat.Adornee = v
    esp_stat.AlwaysOnTop = true
    esp_stat.Parent = esp
    esp_stat.Size = UDim2.new(0, 80, 0, 50)
    esp_stat.StudsOffset = Vector3.new(0, .2, 0)
    stat_text.ZIndex = 10
    stat_text.BackgroundTransparency = 1
    stat_text.Position = UDim2.new(0, 0, 0, -50)
    stat_text.Size = UDim2.new(0, 80, 0, 80)
    stat_text.Font = Enum.Font.SourceSansSemibold
    stat_text.TextSize = 15
    stat_text.TextColor3 = Color3.new(1, 1, 1)
    stat_text.TextStrokeTransparency = 0
    stat_text.TextYAlignment = Enum.TextYAlignment.Bottom
    stat_text.Parent = esp_stat
    task.spawn(function()
    pcall(function()
    while task.wait(.05) do
    stat_text.Text = ((_G.ESPshowusers == true and "Name: "..plr.Name.."") or "")..""..((_G.ESPshowusers == true and _G.ESPshowhealth == true and "\n") or "")..""..((_G.ESPshowhealth == true and "Health: "..plr_char.Humanoid.Health.."") or "")
    end
    end)
    end)
    end
    
    end
    end
          
    local char_connection, team_connection, dstr_connection
    char_connection = plr.CharacterAdded:Connect(function()
    if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
    game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
    end
    dstr_connection:Disconnect()
    team_connection:Disconnect()
    repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
    CreateHighlight(plr)
    char_connection:Disconnect()
    end)
    
    team_connection = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
    if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
    game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
    end
    dstr_connection:Disconnect()
    char_connection:Disconnect()
    repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
    CreateHighlight(plr)
    team_connection:Disconnect()
    end)
    
    dstr_connection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
    if child.Name == "DOD_ESP_HANDLER" then
    Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
    team_connection:Disconnect()
    char_connection:Disconnect()
    dstr_connection:Disconnect()
    end      
    end)
    
    end)
    end
    
    function ChangeTransparency(trans)
    for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetDescendants()) do
    if v and v:IsA("BoxHandleAdornment") then
    v.Transparency = trans
    end
    end
    end
    
    local Tab_4 = Window:AddTab("Visual", "eye")
    local VisualESPGroup = Tab_4:AddLeftGroupbox("ESP", "eye")
    
    VisualESPGroup:AddLabel("You can change some of the visual parts of the game here.", true)
    VisualESPGroup:AddDivider()
    
    VisualESPGroup:AddSlider("ESPTransparency", {
        Text = "ESP Transparency (in %)",
        Default = 30,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Suffix = "%",
        Callback = function(Value)
            _G.ESPtransHandler = (tonumber(Value) / 100)
            ChangeTransparency(tonumber(_G.ESPtransHandler))
        end,
    })

    VisualESPGroup:AddToggle("ESPShowUsername", {
        Text = "Show Username",
        Default = true,
    })
    Toggles.ESPShowUsername:OnChanged(function()
        _G.ESPshowusers = Toggles.ESPShowUsername.Value
    end)

    VisualESPGroup:AddToggle("ESPShowHealth", {
        Text = "Show Health",
        Default = true,
    })
    Toggles.ESPShowHealth:OnChanged(function()
        _G.ESPshowhealth = Toggles.ESPShowHealth.Value
    end)
    
    plradded_esp = nil
    plrremoved_esp = nil
    VisualESPGroup:AddToggle("ESPToggle", {
        Text = "Turn On/Off ESP",
        Default = false,
    })
    
    Toggles.ESPToggle:OnChanged(function()
        _G.ESPenabledHandler = Toggles.ESPToggle.Value
        if _G.ESPenabledHandler == true then
            for i,v in pairs(game:GetService("Players"):GetPlayers()) do
                if v and v ~= game:GetService("Players").LocalPlayer then
                    CreateHighlight(v)
                end
            end
            plradded_esp = game:GetService("Players").PlayerAdded:Connect(function(plr)
                CreateHighlight(plr)
            end)
            plrremoved_esp = game:GetService("Players").PlayerRemoving:Connect(function(plr)
                if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
                    game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
                end
            end)
        elseif _G.ESPenabledHandler == false then
            game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):Destroy()
            if plradded_esp ~= nil then
                plradded_esp:Disconnect()
                plradded_esp = nil
            end
            if plrremoved_esp ~= nil then
                plrremoved_esp:Disconnect()
                plrremoved_esp = nil
            end
        end
    end)
    
    local VisualGuiGroup = Tab_4:AddLeftGroupbox("Gui Management ε=( o｀ω′)ノ", "layout-dashboard")
    
    VisualGuiGroup:AddButton({
        Text = "Open Shop",
        Func = function()
            UIModule.OpenShop()
        end,
    })
    
    VisualGuiGroup:AddToggle("TeammateDeathEffect", {
        Text = "Teammate Death Effect Enabled",
        Default = true,
    })
    
    Toggles.TeammateDeathEffect:OnChanged(function()
        if TestRequire() ~= true then
            ErrorRequire()
            return nil
        end
        DeathEffectEnabled = Toggles.TeammateDeathEffect.Value
        if DeathEffectEnabled == true then
            UIModule["TeamateDeathEffect"] = function()
                game:GetService("Lighting").TeamateDeathEffect.Enabled = true
                game:GetService("Lighting").TeamateDeathEffect.Contrast = 0
                game:GetService("Lighting").TeamateDeathEffect.TintColor = Color3.fromRGB(255, 255, 255)
                game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
                    ["Contrast"] = 1
                }):Play()
                game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
                    ["TintColor"] = Color3.fromRGB(255, 52, 52)
                }):Play()
                task.wait(0.5)
                game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
                    ["Contrast"] = 0
                }):Play()
                game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
                    ["TintColor"] = Color3.fromRGB(255, 255, 255)
                }):Play()
            end
            Notify("Success!", "Enabled!", 3, true)
        elseif DeathEffectEnabled == false then
            UIModule["TeamateDeathEffect"] = function() return nil end
            Notify("Success!", "Disabled!", 3, true)
        end
    end)
    
    function AwardPoints(points, reason)
        local Template = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"):WaitForChild("PlayerPoints"):Clone()
        Template.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui").PlayerPoints
        Template.Frame.Title.Text = "<font color=\'rgb(255, 64, 67)\'>"..tostring(points).." Points</font> Awarded "..tostring(reason)
        Template.Frame.Title.TextTransparency = 1
        Template.Frame.Title.UIStroke.Transparency = 1
        Template.Frame.Cash.ImageTransparency = 1
        game:GetService("Debris"):AddItem(Template, 10)
        game:GetService("TweenService"):Create(Template.Frame.Cash, TweenInfo.new(10, Enum.EasingStyle.Linear), {
            ["Rotation"] = 360
        }):Play()
        pcall(function()
            for _ = 0,5 do
                task.wait(0.2)
                local Title = Template.Frame.Title
                Title.TextTransparency = Title.TextTransparency - 0.2
                local Stroke = Template.Frame.Title.UIStroke
                Stroke.Transparency = Stroke.Transparency - 0.2
                local Cash = Template.Frame.Cash
                Cash.ImageTransparency = Cash.ImageTransparency - 0.2
            end
            task.wait(6)
            for _ = 0,5 do
                task.wait(0.5)
                local Title = Template.Frame.Title
                Title.TextTransparency = Title.TextTransparency + 0.2
                local Stroke = Template.Frame.Title.UIStroke
                Stroke.Transparency = Stroke.Transparency + 0.2
                local Cash = Template.Frame.Cash
                Cash.ImageTransparency = Cash.ImageTransparency + 0.2
            end
        end)
    end
    MoneyToGet = 10
    ReasonForMoney = "for surviving for atleast 60 seconds."
    
    local VisualMoneyGroup = Tab_4:AddRightGroupbox("Money Giver ( Visual )", "dollar-sign")
    
    VisualMoneyGroup:AddInput("MoneyAmount", {
        Default = "10",
        Numeric = true,
        Finished = true,
        Text = "Money amount",
        Placeholder = "10",
        Callback = function(Value)
            MoneyToGet = tonumber(Value)
        end,
    })
    
    VisualMoneyGroup:AddInput("MoneyReason", {
        Default = "for surviving for atleast 60 seconds.",
        Numeric = false,
        Finished = true,
        Text = "Reason for getting money",
        Placeholder = "for surviving for atleast 60 seconds.",
        Callback = function(Value)
            ReasonForMoney = tostring(Value)
        end,
    })
    
    VisualMoneyGroup:AddButton({
        Text = "Give money",
        Func = function()
            AwardPoints(MoneyToGet, ReasonForMoney)
        end,
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    local Tab_5 = Window:AddTab("Anti / Immunities", "shield")
    local AntiServerGroup = Tab_5:AddLeftGroupbox("Server", "server")
    
    AntiServerGroup:AddLabel("You can get immunities to multiple things yeah.", true)
    AntiServerGroup:AddDivider()
    
    local AntiWalls
    AntiWalls = false
    AntiServerGroup:AddToggle("AntiArtfulWalls", {
        Text = "Anti-Artful Walls",
        Default = false,
    })
    
    Toggles.AntiArtfulWalls:OnChanged(function()
        AntiWalls = Toggles.AntiArtfulWalls.Value
        if AntiWalls == true then
            for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other"):GetDescendants()) do
                if v and v.Name == "HumanoidRootPart" and v.Anchored == true then
                    v.CanCollide = false
                    v.CanTouch = false
                    v.Transparency = 0.5
                end
            end
        end
    end)
    game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other").DescendantAdded:Connect(function(descendant)
    if descendant and descendant.Name == "HumanoidRootPart" and descendant.Anchored == true and AntiWalls == true then
    descendant.CanCollide = false
    descendant.CanTouch = false
    descendant.Transparency = 0.5
    end
    end)
    
    local AntiComputer
    AntiComputer = false
    AntiServerGroup:AddToggle("AntiComputerCooldown", {
        Text = "Anti Cooldown in Badware Computer Prompts",
        Default = false,
    })
    
    Toggles.AntiComputerCooldown:OnChanged(function()
        AntiComputer = Toggles.AntiComputerCooldown.Value
        if AntiComputer == true then
            for _,descendant in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):GetDescendants()) do
                if descendant and descendant:IsA("ProximityPrompt") and AntiComputer == true then
                    pcall(function()
                        descendant.HoldDuration = 0
                        descendant.RequiresLineOfSight = false
                        descendant.Enabled = true
                    end)
                end
            end
        end
    end)
    game:GetService("Workspace"):WaitForChild("GameAssets").DescendantAdded:Connect(function(descendant)
    if descendant and descendant:IsA("ProximityPrompt") and AntiComputer == true then
    pcall(function()
    descendant.HoldDuration = 0
    descendant.RequiresLineOfSight = false
    descendant.Enabled = true
    end)
    end
    end)
    
    local AntiEvilScary
    AntiEvilScary = false
    AntiServerGroup:AddToggle("AntiEvilScary", {
        Text = "Anti Evil Scary",
        Default = false,
    })
    
    Toggles.AntiEvilScary:OnChanged(function()
        AntiEvilScary = Toggles.AntiEvilScary.Value
        if AntiEvilScary == true then
            for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):GetChildren()) do
                if v and v.Name == "EvilScary" then
                    for _,trans in pairs(v:GetChildren()) do
                        if trans and trans:IsA("TouchTransmitter") then
                            trans:Destroy()
                        end
                    end
                    for _,part in pairs(v:GetChildren()) do
                        if part and part:IsA("BasePart") then
                            part.CanCollide = false
                            part.CanTouch = false
                            pcall(function()
                                part.CanQuery = false
                            end)
                            part:Destroy()
                        end
                    end
                    v.CanCollide = false
                    v.CanTouch = false
                    pcall(function()
                        v.CanQuery = false
                    end)
                    v:Destroy()
                end
            end
        end
    end)
    game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable").ChildAdded:Connect(function(child)
    if child and child.Name == "EvilScary" and AntiEvilScary == true then
    for _,trans in pairs(child:GetChildren()) do
    if trans and trans:IsA("TouchTransmitter") then
    trans:Destroy()
    end
    end
    for _,part in pairs(child:GetChildren()) do
    if part and part:IsA("BasePart") then
    part.CanCollide = false
    part.CanTouch = false
    pcall(function()
    part.CanQuery = false
    end)
    part:Destroy()
    end
    end
    child.CanCollide = false
    child.CanTouch = false
    pcall(function()
    child.CanQuery = false
    end)
    child:Destroy()
    end
    end)
    
    AntiServerGroup:AddToggle("AntiTaunt", {
        Text = "Anti Taunt",
        Default = false,
    })
    
    Toggles.AntiTaunt:OnChanged(function()
        pcall(function()
            if Toggles.AntiTaunt.Value == true then
                game:GetService("ReplicatedStorage").Events.RemoteEvents.TauntEffect.Parent = game.LogService
            else
                game.LogService.TauntEffect.Parent = game:GetService("ReplicatedStorage").Events.RemoteEvents
            end
        end)
    end)
    
    local AutoRemoveBarriers = false
    AntiServerGroup:AddToggle("AntiBarriers", {
        Text = "Anti Barriers",
        Default = false,
    })
    
    Toggles.AntiBarriers:OnChanged(function()
        AutoRemoveBarriers = Toggles.AntiBarriers.Value
        pcall(function()
            if Toggles.AntiBarriers.Value == true then
                workspace.GameAssets.Map.Config.Barriers:Destroy()
            end
        end)
    end)
    
    game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(d)
    task.wait()
    if d.Name == LocalPlayer.Name then
    task.wait(1)
    pcall(function()
    if AutoRemoveBarriers == true then
    workspace.GameAssets.Map.Config.Barriers:Destroy()
    end
    end)

    local AntiFallDamage = false
    AntiServerGroup:AddToggle("AntiFallDamage", {
        Text = "Anti Fall Damage",
        Default = false,
    })
    Toggles.AntiFallDamage:OnChanged(function()
        AntiFallDamage = Toggles.AntiFallDamage.Value
        for i,v in next, workspace.GameAssets:GetDescendants() do
            if v and v.Name == "FallDamage" and v:IsA("BasePart") and AntiFallDamage == true then
                v:Destroy()
            end
        end
    end)
    workspace.GameAssets.DescendantAdded:Connect(function(child)
        if child and child.Name == "FallDamage" and child:IsA("BasePart") and AntiFallDamage == true then
            child:Destroy()
        end
    end)
    end
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    local function ReturnAnimFolder()
    if Character:FindFirstChild("Animations") then
    return Character:WaitForChild("Animations")
    end
    return nil
    end
    
    local Tab_6 = Window:AddTab("Animations", "play")
    local AnimationsGroup = Tab_6:AddLeftGroupbox("Animations", "play")
    
    AnimationsGroup:AddLabel("You can change your anims here.", true)
    AnimationsGroup:AddDivider()
    
    
    function SetRunAnim(run)
    pcall(function()
    local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
    for i,v in next, stopper:GetPlayingAnimationTracks() do
    v:Stop()
    end
    end)
    local AnimationFolder = ReturnAnimFolder()
    pcall(function()
    if AnimationFolder:FindFirstChild("HurtSprint") then
    AnimationFolder:FindFirstChild("HurtSprint").AnimationId = run
    end
    end)
    pcall(function()
    if AnimationFolder:FindFirstChild("NormalSprint") then
    AnimationFolder:FindFirstChild("NormalSprint").AnimationId = run
    end
    end)
    pcall(function()
    if AnimationFolder:FindFirstChild("OldSprint") then
    AnimationFolder:FindFirstChild("OldSprint").AnimationId = run
    end
    end)
    pcall(function()
    if AnimationFolder:FindFirstChild("Sprint") then
    AnimationFolder:FindFirstChild("Sprint").AnimationId = run
    end
    end)
    end
    
    function SetWalkAnim(walk)
    pcall(function()
    local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
    for i,v in next, stopper:GetPlayingAnimationTracks() do
    v:Stop()
    end
    end)
    local AnimationFolder = ReturnAnimFolder()
    pcall(function()
    if AnimationFolder:FindFirstChild("Walk") then
    AnimationFolder:FindFirstChild("Walk").AnimationId = walk
    end
    end)
    pcall(function()
    if AnimationFolder:FindFirstChild("OldWalk") then
    AnimationFolder:FindFirstChild("OldWalk").AnimationId = walk
    end
    end)
    end
    
    function SetIdleAnim(idle)
    pcall(function()
    local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
    for i,v in next, stopper:GetPlayingAnimationTracks() do
    v:Stop()
    end
    end)
    local AnimationFolder = ReturnAnimFolder()
    pcall(function()
    if AnimationFolder:FindFirstChild("Idle") then
    AnimationFolder:FindFirstChild("Idle").AnimationId = idle
    end
    end)
    pcall(function()
    if AnimationFolder:FindFirstChild("OldIdle") then
    AnimationFolder:FindFirstChild("OldIdle").AnimationId = idle
    end
    end)
    end
    
    function ApplyNewAnimations()
    pcall(function()
    Character.Animate.Disabled = true
    task.wait()
    Character.Animate.Disabled = false
    end)
    task.wait()
    pcall(function()
    LocalPlayer.PlayerScripts.ClientAnimations.Disabled = true
    task.wait()
    LocalPlayer.PlayerScripts.ClientAnimations.Disabled = false
    end)
    end
    
    AnimationsGroup:AddDivider()
    AnimationsGroup:AddLabel("Civilian animations")
    
    AnimationsGroup:AddButton({Text = "Apply New Civilian Animations"; Func = function()
    local RunAnim = "rbxassetid://137375023685630"
    local WalkAnim = "rbxassetid://84388941697203"
    local IdleAnim = "rbxassetid://100930402371608"
    task.spawn(function()
    SetRunAnim(RunAnim)
    SetWalkAnim(WalkAnim)
    SetIdleAnim(IdleAnim)
    task.wait()
    ApplyNewAnimations()
    end)
    Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
    end; })

    local AnimationsAdvGroup = Tab_6:AddRightGroupbox("Advanced")
    AnimationsAdvGroup:AddLabel("Ability Changer")
    local AbilityAnimData = {
        ["Block"] = "rbxassetid://120929805037270",
        ["Dash"] = "rbxassetid://73777691791017",
        ["Adrenaline"] = "rbxassetid://116399911657417",
        ["Revolver"] = "rbxassetid://107624957891469",
        ["Caretaker"] = "rbxassetid://90712805517714",
        ["Cloak"] = "rbxassetid://90476367580326",
        ["Punch"] = "rbxassetid://97428323453639",
        ["BonusPad"] = "rbxassetid://86775625332300",
        ["Hotdog"] = "rbxassetid://134322360499381",
        ["Taunt"] = "rbxassetid://85436299122876",
        ["Banana"] = "rbxassetid://96202444819611",
    }
    local ReplaceWhatAbil, ReplaceWithWhatAbil = "Block", "Dash"
    AnimationsAdvGroup:AddDropdown("ReplaceAbilityFrom", {Text = "Replace Ability"; Values = AbilityNames; Default = 1; Multi = false; Callback = function(Value)
        ReplaceWhatAbil = tostring(ConvertDropdownValue(Value))
    end; })
    AnimationsAdvGroup:AddDropdown("ReplaceAbilityTo", {Text = "With"; Values = AbilityNames; Default = 1; Multi = false; Callback = function(Value)
        ReplaceWithWhatAbil = tostring(ConvertDropdownValue(Value))
    end; })
    AnimationsAdvGroup:AddButton({Text = "Apply Ability Animation Swap"; Func = function()
        pcall(function()
            if Character and Character:FindFirstChild("Animations") and Character.Animations:FindFirstChild("Abilities") then
                Character.Animations.Abilities[ReplaceWhatAbil].AnimationId = tostring(AbilityAnimData[ReplaceWithWhatAbil])
                task.wait()
                ApplyNewAnimations()
                Notify("Success!", "Applied ability animation swap.", 3, true)
            end
        end)
    end; })

    AnimationsAdvGroup:AddDivider()
    AnimationsAdvGroup:AddButton({Text = "No animations [Apply any animation to revert]"; Func = function()
        pcall(function()
            LocalPlayer.PlayerScripts.ClientAnimations.Disabled = true
        end)
    end; })
    AnimationsAdvGroup:AddButton({Text = "Fast animations [Irreversible]"; Func = function()
        pcall(function()
            task.spawn(function()
                while task.wait() do
                    if not LocalPlayer or not LocalPlayer.Character then break end
                    local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
                    for _,track in next, stopper:GetPlayingAnimationTracks() do
                        track:AdjustSpeed(5.5)
                    end
                end
            end)
        end)
    end; })
    
    AnimationsGroup:AddButton({Text = "Apply Old Civilian animations"; Func = function()
    local RunAnim = "rbxassetid://79488319304371"
    local WalkAnim = "rbxassetid://138161225743614"
    local IdleAnim = "rbxassetid://74309548749074"
    task.spawn(function()
    SetRunAnim(RunAnim)
    SetWalkAnim(WalkAnim)
    SetIdleAnim(IdleAnim)
    task.wait()
    ApplyNewAnimations()
    end)
    Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
    end; })
    
    AnimationsGroup:AddDivider()
    AnimationsGroup:AddLabel("Ghost Animations")
    
    AnimationsGroup:AddButton({Text = "Apply Ghost animations"; Func = function()
    local RunAnim = "rbxassetid://124260679864309"
    local WalkAnim = "rbxassetid://124260679864309"
    local IdleAnim = "rbxassetid://110395159339100"
    task.spawn(function()
    SetRunAnim(RunAnim)
    SetWalkAnim(WalkAnim)
    SetIdleAnim(IdleAnim)
    task.wait()
    ApplyNewAnimations()
    end)
    Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
    end; })
    
    pcall(function()
    for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
    AnimationsGroup:AddDivider()
    AnimationsGroup:AddLabel(v.Name.." Animations")
    local temp_table = {}
    for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
    table.insert(temp_table, e.Name)
    end; end
    AnimationsGroup:AddDropdown("Apply"..v.Name.."Anims", {Text = "Apply "..v.Name.." animations"; Values = temp_table; Default = 1; Multi = false; Callback = function(Value)
    local Hi = v:WaitForChild(ConvertDropdownValue(Value))
    local RunAnim = Hi:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
    local WalkAnim = Hi:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
    local IdleAnim = Hi:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
    task.spawn(function()
    SetRunAnim(RunAnim)
    SetWalkAnim(WalkAnim)
    SetIdleAnim(IdleAnim)
    task.wait()
    ApplyNewAnimations()
    end)
    Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
    end; })
    end; end
    end)
    
    local AnimationsAdvGroup = Tab_6:AddRightGroupbox("Advanced")
    
    
    function GetAllRunAnims()
    local temp_table = {}
    temp_table["Civilian Run"] = "rbxassetid://137375023685630"
    temp_table["Old Civilian Run"] = "rbxassetid://79488319304371"
    temp_table["Ghost Run"] = "rbxassetid://124260679864309"
    for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
    for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
    local RunAnim = e:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
    local AnimName = ""..e.Name.." "..v.Name.." Run"
    temp_table[AnimName] = RunAnim
    end; end
    end; end
    return temp_table
    end
    
    function GetAllWalkAnims()
    local temp_table = {}
    temp_table["Civilian Walk"] = "rbxassetid://84388941697203"
    temp_table["Old Civilian Walk"] = "rbxassetid://138161225743614"
    temp_table["Ghost Walk"] = "rbxassetid://124260679864309"
    for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
    for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
    local WalkAnim = e:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
    local AnimName = ""..e.Name.." "..v.Name.." Walk"
    temp_table[AnimName] = WalkAnim
    end; end
    end; end
    return temp_table
    end
    
    function GetAllIdleAnims()
    local temp_table = {}
    temp_table["Civilian Idle"] = "rbxassetid://100930402371608"
    temp_table["Old Civilian Idle"] = "rbxassetid://74309548749074"
    temp_table["Ghost Idle"] = "rbxassetid://110395159339100"
    for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
    for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
    local IdleAnim = e:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
    local AnimName = ""..e.Name.." "..v.Name.." Idle"
    temp_table[AnimName] = IdleAnim
    end; end
    end; end
    return temp_table
    end
    
    function GetAllRunNames()
    local temp_table = {}
    table.insert(temp_table, "Civilian Run")
    table.insert(temp_table, "Old Civilian Run")
    table.insert(temp_table, "Ghost Run")
    for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
    for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
    local AnimName = ""..e.Name.." "..v.Name.." Run"
    table.insert(temp_table, AnimName)
    end; end
    end; end
    return temp_table
    end
    
    function GetAllWalkNames()
    local temp_table = {}
    table.insert(temp_table, "Civilian Walk")
    table.insert(temp_table, "Old Civilian Walk")
    table.insert(temp_table, "Ghost Walk")
    for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
    for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
    local AnimName = ""..e.Name.." "..v.Name.." Walk"
    table.insert(temp_table, AnimName)
    end; end
    end; end
    return temp_table
    end
    
    function GetAllIdleNames()
    local temp_table = {}
    table.insert(temp_table, "Civilian Idle")
    table.insert(temp_table, "Old Civilian Idle")
    table.insert(temp_table, "Ghost Idle")
    for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
    for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
    local AnimName = ""..e.Name.." "..v.Name.." Idle"
    table.insert(temp_table, AnimName)
    end; end
    end; end
    return temp_table
    end
    
    local ChoosenRunAnim = "Civilian Run"
    AnimationsAdvGroup:AddDropdown("RunAnimation", {Text = "Run Animation"; Values = GetAllRunNames(); Default = "Civilian Run"; Multi = false; Callback = function(Value)
    ChoosenRunAnim = tostring(ConvertDropdownValue(Value))
    end; })
    
    local ChoosenWalkAnim = "Civilian Walk"
    AnimationsAdvGroup:AddDropdown("WalkAnimation", {Text = "Walk Animation"; Values = GetAllWalkNames(); Default = "Civilian Walk"; Multi = false; Callback = function(Value)
    ChoosenWalkAnim = tostring(ConvertDropdownValue(Value))
    end; })
    
    local ChoosenIdleAnim = "Civilian Idle"
    AnimationsAdvGroup:AddDropdown("IdleAnimation", {Text = "Idle Animation"; Values = GetAllIdleNames(); Default = "Civilian Idle"; Multi = false; Callback = function(Value)
    ChoosenIdleAnim = tostring(ConvertDropdownValue(Value))
    end; })
    
    AnimationsAdvGroup:AddButton({Text = "Apply Animations"; Func = function()
    task.spawn(function()
    SetRunAnim(GetAllRunAnims()[ChoosenRunAnim])
    SetWalkAnim(GetAllWalkAnims()[ChoosenWalkAnim])
    SetIdleAnim(GetAllIdleAnims()[ChoosenIdleAnim])
    task.wait()
    ApplyNewAnimations()
    end)
    Notify("Success!", "Applying animations, it may take up to 10 seconds.", 3, true)
    end; })
    
    
    
    
    
    
    
    
    function GetAssetPrice(assetid)
    pcall(function()
    local Id = tonumber(assetid)
    local MarketplaceService = game:GetService("MarketplaceService")
    return (MarketplaceService:GetProductInfo(Id,Enum.InfoType.Asset).PriceInRobux)
    end)
    end
    local PremiumPrice = GetAssetPrice(1264479709) or 39
    local HavePremium = false
    local PremiumKey = "nyxusisok"
    
    local Tab_7 = Window:AddTab("Premium", "crown")
    local PremiumLeftGroup = Tab_7:AddLeftGroupbox("Premium")
    
    PremiumLeftGroup:AddLabel("Premium content here! Very exploitable features.", true)
    PremiumLeftGroup:AddDivider()
    
    PremiumLeftGroup:AddLabel("Enter your premium key to unlock features:")
    PremiumLeftGroup:AddInput("PremiumKeyInput", {
        Text = "Premium Key";
        Placeholder = "Enter your premium key here";
        Numeric = false;
        Finished = true;
        Callback = function(Value)
            if Value == PremiumKey then
                HavePremium = true
                Notify("Success!", "Premium key accepted! All features unlocked!", 3, true)
            else
                HavePremium = false
                Notify("Error!", "Invalid premium key! Please check your key and try again.", 4, false)
            end
        end
    })
    
    PremiumLeftGroup:AddButton({Text = "Validate Key"; Func = function()
        local key = Options.PremiumKeyInput.Value
        if key == PremiumKey then
            HavePremium = true
            Notify("Success!", "Premium key accepted! All features unlocked!", 3, true)
        else
            HavePremium = false
            Notify("Error!", "Invalid premium key! Please check your key and try again.", 4, false)
        end
    end})
    
    PremiumLeftGroup:AddDivider()
    PremiumLeftGroup:AddLabel("Premium features require a valid key to use.")
    
    PremiumLeftGroup:AddDivider()
    PremiumLeftGroup:AddLabel("Advanced Anti / Immunities")
    
    PremiumLeftGroup:AddToggle("AntiStun", {Text = "Anti-Stun"; Default = false; Callback = function(Value)
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    AntiStun = Value
    if AntiStun == true then
    Notify("Success!", "Anti-Stun is now enabled!", 2, true)
    repeat task.wait(.003)
    Char:SetAttribute("WalkSpeedModifier", 0)
    Char:SetAttribute("StaminaModifier", 0)
    until AntiStun == false
    end
    end; })

    local InfinityCloak = false
    PremiumLeftGroup:AddToggle("InfinityCloak", {Text = "Infinity Cloak"; Default = false; Callback = function(Value)
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    InfinityCloak = Value
    if InfinityCloak == true then
    task.spawn(function()
        while InfinityCloak do
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer("Cloak")
            end)
            task.wait(4.5)
        end
    end)
    end
    end; })
    
    local PremiumRightGroup = Tab_7:AddRightGroupbox("Invisibility")
    noclip_connection = nil
    camera_connection = nil
    PremiumRightGroup:AddToggle("Invisibility", {Text = "Turn On/Off Invisibility"; Default = false; Callback = function(Value)
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    if Value == false then
    task.spawn(function()
    for i,v in next, Humanoid:GetPlayingAnimationTracks() do
    v.Priority = Enum.AnimationPriority.Core
    v:AdjustSpeed(tonumber(0))
    v:Stop(tonumber(0))
    end
    end)
    if noclip_connection then
    noclip_connection:Disconnect()
    noclip_connection = nil
    end
    if camera_connection then
    camera_connection:Disconnect()
    camera_connection = nil
    pcall(function()
    workspace.CurrentCamera.CameraSubject = Humanoid
    end)
    end
    Notify("Success!", "Disabled invisibility!", 2, true)
    elseif Value == true then
    local function nocollision()
    for i,v in pairs(LP.Character:GetDescendants()) do
    if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
    v.CanCollide = false
    end
    end
    if LP.Character:FindFirstChild("HumanoidRootPart") then
    LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
    end
    end
    noclip_connection = game:GetService("RunService").Stepped:Connect(nocollision)
    workspace.CurrentCamera.CameraSubject = HumanoidRootPart
    camera_connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
    workspace.CurrentCamera.CameraSubject = HumanoidRootPart
    end)
    local Anim = Instance.new("Animation")
    Anim.AnimationId = "rbxassetid://90444351114401"
    local loadedanim = LP.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
    loadedanim.Priority = Enum.AnimationPriority.Action4
    repeat task.wait() until loadedanim.Length > 0	
    loadedanim:Play()
    repeat task.wait() until loadedanim.IsPlaying
    loadedanim:AdjustSpeed(tonumber(0))
    loadedanim.TimePosition = 2.2
    Notify("Success!", "Applied invisibility!", 2, true)
    end
    end; })
    
    
    function StudsIntoPower(studs)
    return (studs * 6)
    end
    PremiumLeftGroup:AddDivider()
    PremiumLeftGroup:AddLabel("Aimbot")
    
    PremiumLeftGroup:AddToggle("Aimbot", {Text = "Enable Aimbot"; Default = false; Callback = function(Value)
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    AimbotEnabled = Value
    if AimbotEnabled == true then
    Notify("Success!", "Aimbot enabled!", 2, true)
    CurrentTarget = nil
    IsTargetHidden = false
    LostTargetTime = 0
    AimbotLoop()
    else
    Notify("Info", "Aimbot disabled!", 2, true)
    CurrentTarget = nil -- Reset target when disabling
    IsTargetHidden = false
    LostTargetTime = 0
    if AimbotConnection then
    AimbotConnection:Disconnect()
    AimbotConnection = nil
    end
    end
    end; })
    
    PremiumLeftGroup:AddSlider("AimbotSmoothing", {
        Text = "Aimbot Smoothing",
        Default = 5,
        Min = 1,
        Max = 20,
        Rounding = 1,
        Suffix = "x",
        Callback = function(Value)
            AimbotSmoothing = Value
            if AimbotEnabled then
                AimbotLoop()
            end
        end,
    })
    
    PremiumLeftGroup:AddDivider()
    PremiumLeftGroup:AddLabel("Hitbox Extender")
    
    PremiumLeftGroup:AddToggle("ExtendHitbox", {Text = "Extend Hitbox"; Default = false; Callback = function(Value)
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    ExtendHitbox = Value
    if ExtendHitbox == true then
    local distance = 9
    repeat game:GetService("RunService").Heartbeat:Wait()
    local vel, movel = nil, 0.1
    while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
    game:GetService("RunService").Heartbeat:Wait()
    end
    vel = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel * distance + (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * distance)
    game:GetService("RunService").RenderStepped:Wait()
    if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end
    until ExtendHitbox == false
    end
    end; })
    
    function MorphIntoGhost()
        local a = game:GetService("ReplicatedStorage").Characters.Other.Ghost:Clone()
        a.Name = LocalPlayer.Name
        a.Parent = game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")
        pcall(function()
        a:WaitForChild("Humanoid").DisplayDistanceType = "None"
        end)
        a:WaitForChild("HumanoidRootPart").CFrame = (game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model") and game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model"):WaitForChild("HumanoidRootPart").CFrame) or CFrame.new(0,0,0)
        pcall(function()
        for i,v in pairs(a:GetDescendants()) do
        if (v:IsA("BasePart") or v:IsA("Decal")) and (v.Name ~= "HumanoidRootPart" and (not v:FindFirstChild("Face") and v.Name ~= "Hurtbox")) then
        v.Transparency = 0.5
        end
        end
        end)
        LocalPlayer.Character = a
        task.wait(.5)
        LocalPlayer.CharacterAdded:Once(function()
        a:Destroy()
        end)
    end
    
    PremiumRightGroup:AddDivider()
    PremiumRightGroup:AddLabel("FE Hitbox Breaker")
    
    PremiumRightGroup:AddLabel("I recommend using hitbox breaker during double trouble / one bounce / die nation for more fun!")
    PremiumRightGroup:AddLabel("WARNING! You need to equip killdroid.")
    PremiumRightGroup:AddButton({Text = "FE Break Game Hitboxes"; Func = function()
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChild(LocalPlayer.Name) then Notify("Error!", "You must be killer!", 4, false) return end
    Notify("Breaking hitboxes...", "Please wait!", 7, true)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/Modules/refs/heads/main/obf-handler.rbx"))().load("\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49")
    Notify("Broke hitboxes!", "Everyone's hitboxes are now must be broken.", 3, true)
    end; })
    
    
    PremiumRightGroup:AddDivider()
    PremiumRightGroup:AddLabel("FE Server Glitcher / Softlock Utility")
    
    PremiumRightGroup:AddLabel("Only Harken, Badware and Killdroid can be softlocked. Harken will softlock if she uses Immolate or Tangle. Badware will softlock if he uses Rift. All Killdroid Deploys will get softlocked.")
    PremiumRightGroup:AddLabel("WARNING! You will play as ghost after activating this feature.")
    PremiumRightGroup:AddButton({Text = "FE Softlock Killers"; Func = function()
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildWhichIsA("Model") then Notify("Error!", "No killer players found in the game. Make sure there are active killers before using this feature.", 3, false) return end
    Notify("Enabling Auto-Softlock...", "Please wait!", 7, true)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/Modules/refs/heads/main/obf-handler.rbx"))().load("\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49")
    MorphIntoGhost()
    Notify("Auto-Softlock Enabled!", "Check the label above to see when will specific killers get softlocked.", 5, true)
    end; })
    
    function IsFacingTowards(part)
    local unit = ((HumanoidRootPart.Position - part.Position) * Vector3.new(1,0,1)).Unit
    local lookvector = part.CFrame.LookVector * Vector3.new(1,0,1)
    return (lookvector:Dot(unit) > 0.85)
    end
    function GetMagnitudeDifference(part)
    return (part.Position - HumanoidRootPart.Position).Magnitude
    end
    local attacks = {"Swing","Cleave","Bolt","Shoot"}
    
    
    local PremiumAutoBlockGroup = Tab_7:AddLeftGroupbox("Auto Block")
    PremiumAutoBlockGroup:AddLabel("{ VERY W.I.P. !!!! } Uses block ability when the killer is attacking you. Your ping must be less than 60 for it to work.")
    local CheckIfHaveBlock = true
    PremiumAutoBlockGroup:AddToggle("UseBlockNoAbility", {Text = "Use Block ability even if you don't have it"; Default = true; Callback = function(Value)
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    CheckIfHaveBlock = Value
    end; })
    local AutoBlockRange = 13
    PremiumAutoBlockGroup:AddInput("AutoBlockRange", {Text = "Auto Block detection range ( Magnitude )"; Placeholder = "13"; Numeric = true; Finished = true; Callback = function(Value)
    AutoBlockRange = tonumber(Value)
    end; })
    local AutoBlock = false
    PremiumAutoBlockGroup:AddToggle("AutoBlock", {Text = "Auto Block"; Default = false; Callback = function(Value)
    if not HavePremium then Notify("Error!", "You need premium to unlock this feature!", 4, false) setclipboard(tostring("https://discord.gg/GwwKGXvaF8")) return end
    AutoBlock = Value
    end; })
    
    workspace.GameAssets.Teams.Killer.ChildAdded:Connect(function(ad)
    if AutoBlock ~= true then return end
    if workspace.GameAssets.Teams.Killer:FindFirstChild(LocalPlayer.Name) then return end
    if CheckIfHaveBlock == true then
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring("Block")}}))
    end
    task.wait()
    if ad.Name == tostring(LocalPlayer.Name) then return end
    local AutoBlock_con_1, AutoBlock_con_2
    if not game.Players:GetPlayerFromCharacter(ad) then return end
    repeat task.wait() until ad:FindFirstChild("Humanoid")
    AutoBlock_con_1 = ad:FindFirstChild("Humanoid"):FindFirstChildOfClass("Animator").AnimationPlayed:Connect(function(track)
    if not track.Animation then return end
    local function IsAttacking()
    local y = false
    local attacks = {"rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://90169934219103","rbxassetid://78618685223511","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://99333140295180","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://71896478910022","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://84565422738230","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://100896558622404","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106"}
    if table.find(attacks, track.Animation.AnimationId) then
    y = true
    end
    return y
    end
    if IsAttacking() and IsFacingTowards(ad:FindFirstChild("HumanoidRootPart")) and GetMagnitudeDifference(ad:FindFirstChild("HumanoidRootPart")) < AutoBlockRange then
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer("Block")
    end
    end)
    AutoBlock_con_2 = workspace.GameAssets.Teams.Killer.ChildRemoved:Connect(function(dd)
    if ad == dd then
    AutoBlock_con_1:Disconnect()
    AutoBlock_con_2:Disconnect()
    end
    end)
    end)
    
    local ff_connection = nil
    local ff_enabled = false
    local ff_cd = false
    
    function Flip()
        if ff_cd then
            return
        end
        ff_cd = true
        local character = Character
        local hrp = HumanoidRootPart
        local animator = Humanoid:FindFirstChildOfClass("Animator")
        if not hrp or not Humanoid then
            ff_cd = false
            return
        end
        local savedTracks = {}
        if animator then
            for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
                track:Stop(0)
            end
        end
        Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
        local duration = 0.45
        local steps = 120
        local startCFrame = hrp.CFrame
        local forwardVector = startCFrame.LookVector
        local upVector = Vector3.new(0, 1, 0)
        task.spawn(function()
            local startTime = tick()
            for i = 1, steps do
                local t = i / steps
                local height = 4 * (t - t ^ 2) * 10
                local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height	
                local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)
    
                hrp.CFrame = CFrame.new(nextPos) * rotation
                local elapsedTime = tick() - startTime
                local expectedTime = (duration / steps) * i
                local waitTime = expectedTime - elapsedTime
                if waitTime > 0 then
                    task.wait(waitTime)
                end
            end
    
            hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
            Humanoid:ChangeState(Enum.HumanoidStateType.Running)
    
            if animator then
                for _, data in ipairs(savedTracks) do
                    local track = data.track
                    track:Play()
                    track.TimePosition = data.time
                end
            end
            task.wait(0.25)
            ff_cd = false
        end)
    end
    
    local sausageHolder = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
    local originalSize = sausageHolder.Size.X.Offset
    local ff_button = nil
    function SetFrontFlip(bool)
    ff_enabled = bool
    if ff_enabled == true then
    sausageHolder = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
    originalSize = sausageHolder.Size.X.Offset
    ff_button = Instance.new("Frame", sausageHolder)
            ff_button.Size = UDim2.new(0, 48, 0, 44)
            ff_button.BackgroundTransparency = 1
            ff_button.BorderSizePixel = 0
            ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
    local imageButton = Instance.new("ImageButton", ff_button)
            imageButton.BackgroundTransparency = 1
            imageButton.BorderSizePixel = 0
            imageButton.Size = UDim2.new(0, 36, 0, 36)
            imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
            imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
            imageButton.Image = "rbxthumb://type=Asset&id=2714338264&w=150&h=150"
    ff_connection = imageButton.Activated:Connect(Flip)
    sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
    task.wait()
    ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
    task.spawn(function()
    pcall(function()
    repeat
    sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
    task.wait()
    ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
    until ff_enabled == false
    end)
    end)
    elseif ff_enabled == false then
    if ff_connection then
    ff_connection:Disconnect()
    ff_connection = nil
    end
    if ff_button then
    ff_button:Destroy()
    ff_button = nil
    end
    sausageHolder.Size = UDim2.new(0, originalSize, 0, sausageHolder.Size.Y.Offset)
    end
    end
    
    local Tab_8 = Window:AddTab("Fun", "smile")
    local FunGroup = Tab_8:AddLeftGroupbox("Fun")
    
    FunGroup:AddLabel("Funny things will be here here soon muehehehe", true)
    FunGroup:AddDivider()
    FunGroup:AddLabel("Movement")
    
    FunGroup:AddToggle("Frontflip", {Text = "Frontflip"; Default = true; Callback = function(Value)
    SetFrontFlip(Value)
    end; })
    SetFrontFlip(true)

local function Fun_Stalk()
    local old_ws = Char and Char:GetAttribute("WalkSpeed") or 0
    local old_ss = Char and Char:GetAttribute("SprintSpeed") or 0
    pcall(function()
        for _, d in ipairs(Character:GetDescendants()) do
            if d:IsA("BasePart") and d.Name ~= "HumanoidRootPart" then
                d.LocalTransparencyModifier = 0.8
            end
        end
        if Char then
            Char:SetAttribute("WalkSpeed", (old_ws or Hum.WalkSpeed) + 6)
            Char:SetAttribute("SprintSpeed", (old_ss or 24) + 8)
        end
    end)
    task.wait(6)
    pcall(function()
        for _, d in ipairs(Character:GetDescendants()) do
            if d:IsA("BasePart") and d.Name ~= "HumanoidRootPart" then
                d.LocalTransparencyModifier = 0
            end
        end
        if Char then
            Char:SetAttribute("WalkSpeed", old_ws)
            Char:SetAttribute("SprintSpeed", old_ss)
            Char:SetAttribute("Fatigue", true)
        end
    end)
end
FunGroup:AddButton({Text = "Add Stalk ability"; Func = function()
    if not AbilityModule then return end
    AbilityModule.CreateAbility({Name = "Stalk_NH",InputShown = "",Tip = "Turn invisible and gain speed for 6s. Long endlag.",Cooldown = 15, Icon = "rbxassetid://92577246919936", DisplayName = "Stalk"})
    task.spawn(function()
        repeat task.wait() until LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui:FindFirstChild("MainGui") and LocalPlayer.PlayerGui.MainGui:FindFirstChild("Abilities") and LocalPlayer.PlayerGui.MainGui.Abilities:FindFirstChild("Folder") and LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Stalk_NH")
        LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Stalk_NH").MouseButton1Down:Connect(function()
            Fun_Stalk()
            pcall(function() AbilityModule.PutOnCooldown("Stalk_NH",15) end)
        end)
    end)
    Notify("Success!", "Stalk ability added.", 3, true)
end; })

local function Fun_Dash()
    if not HumanoidRootPart then return end
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e5,1e5,1e5)
    bv.Velocity = HumanoidRootPart.CFrame.LookVector * 65
    bv.Parent = HumanoidRootPart
    game:GetService("Debris"):AddItem(bv, .25)
end
FunGroup:AddButton({Text = "Add Dash without cooldown"; Func = function()
    if not AbilityModule then return end
    AbilityModule.CreateAbility({Name = "Dash_NH",InputShown = "",Tip = "Dash forward with tiny cooldown.",Cooldown = .2, Icon = "rbxassetid://73777691791017",DisplayName = "Dash (No CD)"})
    task.spawn(function()
        repeat task.wait() until LocalPlayer:FindFirstChild("PlayerGui") and LocalPlayer.PlayerGui.MainGui and LocalPlayer.PlayerGui.MainGui.Abilities and LocalPlayer.PlayerGui.MainGui.Abilities:FindFirstChild("Folder") and LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Dash_NH")
        LocalPlayer.PlayerGui.MainGui.Abilities.Folder:FindFirstChild("Dash_NH").MouseButton1Down:Connect(function()
            Fun_Dash()
        end)
    end)
    Notify("Success!", "Dash (No CD) added.", 3, true)
end; })

local AppGroup = Tab_8:AddRightGroupbox("Appearance")
AppGroup:AddLabel("Morph into NPCs (Other)")
local OtherModels = {}
pcall(function()
    for _, m in ipairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Other"):GetChildren()) do
        table.insert(OtherModels, m.Name)
    end
end)
local SelectedMorph = OtherModels[1]
AppGroup:AddDropdown("MorphChoice", {Text = "Choose Model"; Values = (#OtherModels>0 and OtherModels or {"Ghost"}); Default = (#OtherModels>0 and OtherModels[1] or "Ghost"); Multi = false; Callback = function(Value)
    SelectedMorph = tostring(ConvertDropdownValue(Value))
end; })
AppGroup:AddButton({Text = "Morph"; Func = function()
    pcall(function()
        local src = game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Other"):FindFirstChild(SelectedMorph)
        if not src then return end
        local a = src:Clone()
        a.Name = LocalPlayer.Name
        a.Parent = workspace:WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")
        pcall(function()
            a:WaitForChild("Humanoid").DisplayDistanceType = "None"
        end)
        if a:FindFirstChild("HumanoidRootPart") then
            a.HumanoidRootPart.CFrame = (HumanoidRootPart and HumanoidRootPart.CFrame) or CFrame.new(0,5,0)
        end
        for _,v in pairs(a:GetDescendants()) do
            if (v:IsA("BasePart") or v:IsA("Decal")) and (v.Name ~= "HumanoidRootPart" and (not v:FindFirstChild("Face") and v.Name ~= "Hurtbox")) then
                v.Transparency = 0.3
            end
        end
        LocalPlayer.Character = a
        task.wait(.5)
        LocalPlayer.CharacterAdded:Once(function()
            a:Destroy()
        end)
    end)
end; })

local SpawnGroup = Tab_8:AddLeftGroupbox("Fake Spawners")
local function spawnBillboard(label, lifetime)
    local p = Instance.new("Part")
    p.Anchored = true
    p.CanCollide = false
    p.Size = Vector3.new(1,1,1)
    p.Transparency = 1
    p.CFrame = (HumanoidRootPart and (HumanoidRootPart.CFrame + Vector3.new(0,0,-6))) or CFrame.new(0,5,0)
    p.Parent = workspace
    local bb = Instance.new("BillboardGui", p)
    bb.AlwaysOnTop = true
    bb.Size = UDim2.new(0, 200, 0, 50)
    local tl = Instance.new("TextLabel", bb)
    tl.Size = UDim2.new(1,0,1,0)
    tl.BackgroundTransparency = 1
    tl.TextScaled = true
    tl.TextColor3 = Color3.new(1,1,1)
    tl.TextStrokeTransparency = 0
    tl.Text = label
    game:GetService("Debris"):AddItem(p, lifetime or 30)
end

local FakeKillerAppearance = "Devesto"
SpawnGroup:AddInput("FakeKillerApp", {Text = "Fake Killer Appearance"; Placeholder = "Devesto"; Numeric = false; Finished = true; Callback = function(Value)
    FakeKillerAppearance = ConvertDropdownValue(Value)
end; })
SpawnGroup:AddButton({Text = "Spawn Fake Killer"; Func = function()
    spawnBillboard("Fake Killer ("..tostring(FakeKillerAppearance)..")", 60)
end; })
SpawnGroup:AddButton({Text = "Spawn Fake Survivor"; Func = function()
    spawnBillboard("Fake Survivor", 45)
end; })
SpawnGroup:AddButton({Text = "Spawn Fake Timer"; Func = function()
    spawnBillboard("Fake Timer: "..os.date("%M:%S"), 30)
end; })
SpawnGroup:AddButton({Text = "Spawn Fake Evil Scary"; Func = function()
    pcall(function()
        local cleanable = workspace:WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable")
        local part = Instance.new("Part")
        part.Name = "EvilScary"
        part.Size = Vector3.new(3,3,3)
        part.Anchored = true
        part.CanTouch = true
        part.CanCollide = false
        part.CFrame = (HumanoidRootPart and (HumanoidRootPart.CFrame + Vector3.new(0,0,-8))) or CFrame.new(0,5,0)
        part.Parent = cleanable
        game:GetService("Debris"):AddItem(part, 60)
    end)
end; })

    local Tab_TP = Window:AddTab("Teleport", "map-pin")
    local TPGroup = Tab_TP:AddLeftGroupbox("Teleport")

    local function tpToModel(model)
        if not model or not model:FindFirstChild("HumanoidRootPart") or not HumanoidRootPart then return end
        HumanoidRootPart.CFrame = model.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
    end

    TPGroup:AddButton({
        Text = "Teleport to any Killer",
        Func = function()
            local killerFolder = workspace:FindFirstChild("GameAssets") and workspace.GameAssets:FindFirstChild("Teams") and workspace.GameAssets.Teams:FindFirstChild("Killer")
            if killerFolder then
                local target = killerFolder:FindFirstChildWhichIsA("Model")
                tpToModel(target)
            end
        end,
    })
    TPGroup:AddButton({
        Text = "Teleport to any Survivor",
        Func = function()
            local survFolder = workspace:FindFirstChild("GameAssets") and workspace.GameAssets:FindFirstChild("Teams") and workspace.GameAssets.Teams:FindFirstChild("Survivor")
            if survFolder then
                local target = survFolder:FindFirstChildWhichIsA("Model")
                tpToModel(target)
            end
        end,
    })
    TPGroup:AddButton({
        Text = "Teleport to any Ghost",
        Func = function()
            local ghostFolder = workspace:FindFirstChild("GameAssets") and workspace.GameAssets:FindFirstChild("Teams") and workspace.GameAssets.Teams:FindFirstChild("Ghost")
            if ghostFolder then
                local target = ghostFolder:FindFirstChildWhichIsA("Model")
                tpToModel(target)
            end
        end,
    })

    local TPGroup2 = Tab_TP:AddRightGroupbox("Smart Teleports")
    TPGroup2:AddButton({
        Text = "Teleport to caretaker",
        Func = function()
            local survFolder = workspace:FindFirstChild("GameAssets") and workspace.GameAssets:FindFirstChild("Teams") and workspace.GameAssets.Teams:FindFirstChild("Survivor")
            if not survFolder then return end
            for _, m in ipairs(survFolder:GetChildren()) do
                if m:IsA("Model") and m:FindFirstChild("Animations") and m.Animations:FindFirstChild("Abilities") then
                    local abil = m.Animations.Abilities:FindFirstChild("Caretaker")
                    if abil then tpToModel(m) break end
                end
            end
        end,
    })
    TPGroup2:AddButton({
        Text = "Teleport to injured survivor",
        Func = function()
            local survFolder = workspace:FindFirstChild("GameAssets") and workspace.GameAssets:FindFirstChild("Teams") and workspace.GameAssets.Teams:FindFirstChild("Survivor")
            if not survFolder then return end
            for _, m in ipairs(survFolder:GetChildren()) do
                local hum = m:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health < hum.MaxHealth then tpToModel(m) break end
            end
        end,
    })
    TPGroup2:AddButton({
        Text = "Teleport to bonuspad",
        Func = function()
            local found = nil
            for _, d in ipairs(workspace:FindFirstChild("GameAssets") and workspace.GameAssets:GetDescendants() or {}) do
                if d:IsA("BasePart") and d.Name:lower():find("bonus") then found = d break end
            end
            if found and HumanoidRootPart then HumanoidRootPart.CFrame = found.CFrame + Vector3.new(0, 3, 0) end
        end,
    })

    local HeadSitEnabled = false
    local headSitConnection = nil

    local function getAnyKillerModel()
        local killerFolder = workspace:FindFirstChild("GameAssets")
            and workspace.GameAssets:FindFirstChild("Teams")
            and workspace.GameAssets.Teams:FindFirstChild("Killer")
        if not killerFolder then return nil end
        for _, m in ipairs(killerFolder:GetChildren()) do
            if m:IsA("Model") and m:FindFirstChild("HumanoidRootPart") then
                if m.Name ~= (LocalPlayer and LocalPlayer.Name or "") then
                    return m
                end
            end
        end
        return killerFolder:FindFirstChildWhichIsA("Model")
    end

    local function stopHeadSit()
        HeadSitEnabled = false
        if headSitConnection then
            headSitConnection:Disconnect()
            headSitConnection = nil
        end
        pcall(function()
            if Humanoid then Humanoid.Sit = false end
        end)
        Notify("Info", "Stopped headsit.", 2, true)
    end

    local function startHeadSit()
        if HeadSitEnabled then return end
        HeadSitEnabled = true
        pcall(function()
            if Humanoid then Humanoid.Sit = true end
        end)
        if headSitConnection then
            headSitConnection:Disconnect()
            headSitConnection = nil
        end
        headSitConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if not HeadSitEnabled then return end
            local killer = getAnyKillerModel()
            if killer and killer:FindFirstChild("HumanoidRootPart") and Character and HumanoidRootPart and Humanoid and Humanoid.Sit == true then
                local targetCF = killer.HumanoidRootPart.CFrame * CFrame.Angles(0, 0, 0) * CFrame.new(0, 1.6, 0.4)
                HumanoidRootPart.CFrame = targetCF
            else
                stopHeadSit()
            end
        end)
        Notify("Success!", "Headsit enabled. Toggling again will stop.", 3, true)
    end

    TPGroup2:AddToggle("HeadSitToggle", {
        Text = "Toggle HeadSit on Killer",
        Default = false,
    })
    Toggles.HeadSitToggle:OnChanged(function()
        local want = Toggles.HeadSitToggle.Value
        if want then
            startHeadSit()
        else
            stopHeadSit()
        end
    end)

    local StrengthenDash = false
    FunGroup:AddToggle("StrengthenDash", {Text = "Strengthen Dash"; Default = false; Callback = function(Value)
        StrengthenDash = Value
        if StrengthenDash == true then
            task.spawn(function()
                while StrengthenDash do
                    pcall(function()
                        if Char then
                            Char:SetAttribute("Fatigue", false)
                            local current = Char:GetAttribute("SprintSpeed") or 24
                            Char:SetAttribute("SprintSpeed", math.clamp(current + 4, 24, current + 4))
                        end
                    end)
                    task.wait(1.5)
                end
            end)
        end
    end; })
    
    
    local Tab_9 = Window:AddTab("Music", "music")
    local MusicLeftGroup = Tab_9:AddLeftGroupbox("Music")
    
    MusicLeftGroup:AddLabel("Manage custom ambience tracks n shi", true)
    MusicLeftGroup:AddDivider()
    
    local DownloadedAmbienceTracks = {}
    local MusicDownloadFolder = "NH_R_Music"
    local OriginalAmbienceSounds = {}
    local OriginalLobbySounds = {}
    local OriginalShopSounds = {}
    local OriginalLMSSounds = {}
    local CurrentTrackDropdown = nil
    
    local function supportsCustomAssets()
        local func = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
        return typeof(func) == "function"
    end
    
    local function ensureMusicFolder()
        if not (isfolder and makefolder) then
            return false
        end
        if not isfolder(MusicDownloadFolder) then
            pcall(function()
                makefolder(MusicDownloadFolder)
            end)
        end
        return isfolder(MusicDownloadFolder)
    end
    
    local function refreshDownloadedTracks()
        table.clear(DownloadedAmbienceTracks)
        if not (isfolder and listfiles) then
            return
        end
        if not isfolder(MusicDownloadFolder) then
            return
        end
        local files = listfiles(MusicDownloadFolder)
        for _, filePath in ipairs(files) do
            local lowerPath = filePath:lower()
            if lowerPath:find("%.mp3") or lowerPath:find("%.ogg") or lowerPath:find("%.wav") or lowerPath:find("%.flac") or lowerPath:find("%.m4a") then
                local fileName = filePath:match("[^\\/]+$")
                DownloadedAmbienceTracks[#DownloadedAmbienceTracks + 1] = { Name = fileName, Path = filePath }
            end
        end
    end
    
    local SelectedAmbienceTrack = nil
    local PendingDownloadFileName = nil
    
    MusicLeftGroup:AddDivider()
    MusicLeftGroup:AddLabel("Downloader")
    
    MusicLeftGroup:AddInput("MusicFileName", {Text = "File Name (Required)"; Placeholder = "Enter a name for your music"; Numeric = false; Finished = false; Callback = function(name)
        PendingDownloadFileName = name and name ~= "" and tostring(name) or nil
    end; })
    
    MusicLeftGroup:AddInput("MusicAudioLink", {Text = "Audio Link"; Placeholder = "Paste direct audio URL"; Numeric = false; Finished = true; Callback = function(url)
        url = tostring(url)
        if url == "" then
            Notify("Error!", "Please provide a direct audio link.", 4, false)
            return
        end

        if not (writefile and game and game.HttpGet) then
            Notify("Error!", "Your executor does not support downloading files.", 4, false)
            return
        end

        if not ensureMusicFolder() then
            Notify("Error!", "Unable to create music folder. Check if your executor supports file operations.", 4, false)
            return
        end

        if not PendingDownloadFileName or PendingDownloadFileName == "" then
            Notify("Error!", "You must provide a name for your music before downloading.", 4, false)
            return
        end

        local fileName
        if PendingDownloadFileName and PendingDownloadFileName ~= "" then
            fileName = PendingDownloadFileName
            if not fileName:find("%.") then
                fileName = fileName..".mp3"
            end
            PendingDownloadFileName = nil
        else
            fileName = url:match("[^/]+$") or ("Track_"..tostring(#DownloadedAmbienceTracks + 1))
            if not fileName:find("%.") then
                fileName = fileName..".mp3"
            end
        end
    
        local targetPath = MusicDownloadFolder.."/"..fileName
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)
    
        if not success or not response or response == "" then
            Notify("Error!", "Failed to download audio from the provided URL. Please verify the link is valid and accessible.", 4, false)
            return
        end
    
        local saveSuccess, saveErr = pcall(function()
            writefile(targetPath, response)
        end)
    
        if not saveSuccess then
            Notify("Error!", "Failed to save audio file to disk. Error details: "..tostring(saveErr), 4, false)
            return
        end
    
        Notify("Success!", "Audio downloaded as "..fileName.."!", 4, true)
        refreshDownloadedTracks()
    
        for _, track in ipairs(DownloadedAmbienceTracks) do
            if track.Name == fileName then
                SelectedAmbienceTrack = track
                break
            end
        end
        
        if CurrentTrackDropdown then
            CurrentTrackDropdown:Refresh(getTrackNames(), false)
        end
    end; })
    
    refreshDownloadedTracks()
    
    local MusicRightGroup = Tab_9:AddRightGroupbox("Map Ambience")
    local function getTrackNames()
        local names = {}
        for _, track in ipairs(DownloadedAmbienceTracks) do
            names[#names + 1] = track.Name
        end
        if #names == 0 then
            names[1] = "No tracks found"
        end
        return names
    end
    
    local function findTrackByName(name)
        for _, track in ipairs(DownloadedAmbienceTracks) do
            if track.Name == name then
                return track
            end
        end
        return nil
    end
    
    CurrentTrackDropdown = MusicRightGroup:AddDropdown("AvailableTracks", {Text = "Available Tracks"; Values = getTrackNames(); Default = getTrackNames()[1] or ""; Multi = false; Callback = function(Value)
        local chosen = tostring(ConvertDropdownValue(Value))
        local track = findTrackByName(chosen)
        if track then
            SelectedAmbienceTrack = track
            Notify("Success!", "Selected "..track.Name, 3, true)
        else
            SelectedAmbienceTrack = nil
            Notify("Error!", "Selected track not found in downloaded tracks. Please refresh the track list and try again.", 4, false)
        end
    end; })
    
    MusicRightGroup:AddButton({Text = "Refresh Track List"; Func = function()
        refreshDownloadedTracks()
        if CurrentTrackDropdown then
            CurrentTrackDropdown:SetValues(getTrackNames())
        end
        Notify("Success!", "Track list refreshed!", 3, true)
    end; })
    
    local function storeOriginalAmbience()
        if #OriginalAmbienceSounds == 0 then
            local soundsFolder = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("Songs"):WaitForChild("MapAmbience")
            for _, sound in ipairs(soundsFolder:GetChildren()) do
                if sound:IsA("Sound") then
                    table.insert(OriginalAmbienceSounds, {
                        Sound = sound,
                        OriginalId = sound.SoundId
                    })
                end
            end
        end
    end
    
    local function replaceMapAmbienceWithSound(soundId)
        storeOriginalAmbience()
        local soundsFolder = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("Songs"):WaitForChild("MapAmbience")
        for _, sound in ipairs(soundsFolder:GetChildren()) do
            if sound:IsA("Sound") then
                sound.SoundId = soundId
            end
        end
    end
    
    local function restoreOriginalAmbience()
        if #OriginalAmbienceSounds == 0 then
            Notify("Info", "No original audio to restore.", 3, false)
            return false
        end
        
        for _, data in ipairs(OriginalAmbienceSounds) do
            if data.Sound and data.Sound:IsA("Sound") then
                data.Sound.SoundId = data.OriginalId
            end
        end
        return true
    end
    
    MusicRightGroup:AddButton({Text = "Apply As Ambience"; Func = function()
        if not SelectedAmbienceTrack then
            Notify("Error!", "Select a downloaded track first.", 4, false)
            return
        end
    
        local trackPath = SelectedAmbienceTrack.Path
        if not isfile(trackPath) then
            Notify("Error!", "Track file is missing from disk. The file may have been deleted or moved. Please refresh the track list.", 4, false)
            return
        end
    
        local success, content = pcall(function()
            return readfile(trackPath)
        end)
    
        if not success or not content or content == "" then
            Notify("Error!", "Failed to read track file from disk. The file may be corrupted or inaccessible.", 4, false)
            return
        end
    
        if not supportsCustomAssets() then
            Notify("Error!", "Your executor does not support custom assets.", 4, false)
            return
        end
    
        if not (readfile and writefile) then
            Notify("Error!", "Your executor lacks file system APIs.", 4, false)
            return
        end
    
        local tempSoundName = "TempAmbienceTrack_"..os.time()..".dat"
        local tempSoundPath = MusicDownloadFolder.."/"..tempSoundName
        local writeSuccess = pcall(function()
            writefile(tempSoundPath, content)
        end)
    
        if not writeSuccess then
            Notify("Error!", "Failed to create temp sound file.", 4, false)
            return
        end
    
        local assetFunc = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
        local assetSuccess, assetResult = pcall(function()
            return assetFunc(tempSoundPath)
        end)
    
        if not assetSuccess or not assetResult then
            Notify("Error!", "Failed to register custom asset.", 4, false)
            return
        end
    
        replaceMapAmbienceWithSound(assetResult)
        Notify("Success!", "Map ambience updated!", 4, true)
    end; })
    
    MusicRightGroup:AddButton({Text = "Restore Original Audio"; Func = function()
        if restoreOriginalAmbience() then
            Notify("Success!", "Original audio restored!", 4, true)
        end
    end; })
    
    MusicRightGroup:AddDivider()
    MusicRightGroup:AddLabel("Lobby Music")
    
    local function storeOriginalLobby()
        if #OriginalLobbySounds == 0 then
            local soundsFolder = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("Songs")
            
            local lobbySound = soundsFolder:FindFirstChild("Lobby")
            if lobbySound and lobbySound:IsA("Sound") then
                table.insert(OriginalLobbySounds, {
                    Sound = lobbySound,
                    OriginalId = lobbySound.SoundId
                })
            end
            
            local lobbyVarSound = soundsFolder:FindFirstChild("LobbyVariation")
            if lobbyVarSound and lobbyVarSound:IsA("Sound") then
                table.insert(OriginalLobbySounds, {
                    Sound = lobbyVarSound,
                    OriginalId = lobbyVarSound.SoundId
                })
            end
        end
    end
    
    local function replaceLobbyMusic(soundId)
        storeOriginalLobby()
        local soundsFolder = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("Songs")
        
        local lobbySound = soundsFolder:FindFirstChild("Lobby")
        if lobbySound and lobbySound:IsA("Sound") then
            lobbySound.SoundId = soundId
        end
        
        local lobbyVarSound = soundsFolder:FindFirstChild("LobbyVariation")
        if lobbyVarSound and lobbyVarSound:IsA("Sound") then
            lobbyVarSound.SoundId = soundId
        end
    end
    
    local function restoreOriginalLobby()
        if #OriginalLobbySounds == 0 then
            Notify("Info", "No original lobby music to restore.", 3, false)
            return false
        end
        
        for _, data in ipairs(OriginalLobbySounds) do
            if data.Sound and data.Sound:IsA("Sound") then
                data.Sound.SoundId = data.OriginalId
            end
        end
        return true
    end
    
    MusicRightGroup:AddButton({Text = "Apply As Lobby Music"; Func = function()
        if not SelectedAmbienceTrack then
            Notify("Error!", "Select a downloaded track first.", 4, false)
            return
        end
    
        local trackPath = SelectedAmbienceTrack.Path
        if not isfile(trackPath) then
            Notify("Error!", "Track file missing. Try refreshing.", 4, false)
            return
        end
    
        local success, content = pcall(function()
            return readfile(trackPath)
        end)
    
        if not success or not content or content == "" then
            Notify("Error!", "Failed to read track file from disk. The file may be corrupted or inaccessible.", 4, false)
            return
        end
    
        if not supportsCustomAssets() then
            Notify("Error!", "Your executor does not support custom assets.", 4, false)
            return
        end
    
        if not (readfile and writefile) then
            Notify("Error!", "Your executor lacks file system APIs.", 4, false)
            return
        end
    
        local tempSoundName = "TempLobbyTrack_"..os.time()..".dat"
        local tempSoundPath = MusicDownloadFolder.."/"..tempSoundName
        local writeSuccess = pcall(function()
            writefile(tempSoundPath, content)
        end)
    
        if not writeSuccess then
            Notify("Error!", "Failed to create temp sound file.", 4, false)
            return
        end
    
        local assetFunc = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
        local assetSuccess, assetResult = pcall(function()
            return assetFunc(tempSoundPath)
        end)
    
        if not assetSuccess or not assetResult then
            Notify("Error!", "Failed to register custom asset.", 4, false)
            return
        end
    
        replaceLobbyMusic(assetResult)
        Notify("Success!", "Lobby music updated!", 4, true)
    end; })
    
    MusicRightGroup:AddButton({Text = "Restore Original Lobby Music"; Func = function()
        if restoreOriginalLobby() then
            Notify("Success!", "Original lobby music restored!", 4, true)
        end
    end; })
    
    MusicRightGroup:AddDivider()
    MusicRightGroup:AddLabel("Shop Music")
    
    local function storeOriginalShop()
        if #OriginalShopSounds == 0 then
            local soundsFolder = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("Songs")
            
            local shopSound = soundsFolder:FindFirstChild("ShopTheme")
            if shopSound and shopSound:IsA("Sound") then
                table.insert(OriginalShopSounds, {
                    Sound = shopSound,
                    OriginalId = shopSound.SoundId
                })
            end
        end
    end
    
    local function replaceShopMusic(soundId)
        storeOriginalShop()
        local soundsFolder = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("Songs")
        
        local shopSound = soundsFolder:FindFirstChild("ShopTheme")
        if shopSound and shopSound:IsA("Sound") then
            shopSound.SoundId = soundId
        end
    end
    
    local function restoreOriginalShop()
        if #OriginalShopSounds == 0 then
            Notify("Info", "No original shop music to restore.", 3, false)
            return false
        end
        
        for _, data in ipairs(OriginalShopSounds) do
            if data.Sound and data.Sound:IsA("Sound") then
                data.Sound.SoundId = data.OriginalId
            end
        end
        return true
    end
    
    MusicRightGroup:AddButton({Text = "Apply As Shop Music"; Func = function()
        if not SelectedAmbienceTrack then
            Notify("Error!", "Select a downloaded track first.", 4, false)
            return
        end
    
        local trackPath = SelectedAmbienceTrack.Path
        if not isfile(trackPath) then
            Notify("Error!", "Track file missing. Try refreshing.", 4, false)
            return
        end
    
        local success, content = pcall(function()
            return readfile(trackPath)
        end)
    
        if not success or not content or content == "" then
            Notify("Error!", "Failed to read track file from disk. The file may be corrupted or inaccessible.", 4, false)
            return
        end
    
        if not supportsCustomAssets() then
            Notify("Error!", "Your executor does not support custom assets.", 4, false)
            return
        end
    
        if not (readfile and writefile) then
            Notify("Error!", "Your executor lacks file system APIs.", 4, false)
            return
        end
    
        local tempSoundName = "TempShopTrack_"..os.time()..".dat"
        local tempSoundPath = MusicDownloadFolder.."/"..tempSoundName
        local writeSuccess = pcall(function()
            writefile(tempSoundPath, content)
        end)
    
        if not writeSuccess then
            Notify("Error!", "Failed to create temp sound file.", 4, false)
            return
        end
    
        local assetFunc = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
        local assetSuccess, assetResult = pcall(function()
            return assetFunc(tempSoundPath)
        end)
    
        if not assetSuccess or not assetResult then
            Notify("Error!", "Failed to register custom asset.", 4, false)
            return
        end
    
        replaceShopMusic(assetResult)
        Notify("Success!", "Shop music updated!", 4, true)
    end; })
    
    MusicRightGroup:AddButton({Text = "Restore Original Shop Music"; Func = function()
        if restoreOriginalShop() then
            Notify("Success!", "Original shop music restored!", 4, true)
        end
    end; })
    
    MusicRightGroup:AddDivider()
    MusicRightGroup:AddLabel("LMS Music")
    
    local function storeOriginalLMS()
        if #OriginalLMSSounds == 0 then
            local lmsFolder = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("Songs"):WaitForChild("LMSSongs")
            
            for _, sound in ipairs(lmsFolder:GetChildren()) do
                if sound:IsA("Sound") then
                    table.insert(OriginalLMSSounds, {
                        Sound = sound,
                        OriginalId = sound.SoundId,
                        Name = sound.Name
                    })
                end
            end
        end
    end
    
    local function replaceLMSMusic(soundId, mode)
        storeOriginalLMS()
        local lmsFolder = game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):WaitForChild("Songs"):WaitForChild("LMSSongs")
        
        if mode == "all" then
            for _, sound in ipairs(lmsFolder:GetChildren()) do
                if sound:IsA("Sound") then
                    sound.SoundId = soundId
                end
            end
        elseif mode == "exclude_special" then
            local songsToReplace = {"Eternity", "Double Trouble", "Omegaware", "One Bounce", "Teapot Paradise"}
            for _, songName in ipairs(songsToReplace) do
                local sound = lmsFolder:FindFirstChild(songName)
                if sound and sound:IsA("Sound") then
                    sound.SoundId = soundId
                end
            end
        elseif mode == "exclude_cool" then
            local songsToReplace = {"Eternity", "Double Trouble", "One Bounce"}
            for _, songName in ipairs(songsToReplace) do
                local sound = lmsFolder:FindFirstChild(songName)
                if sound and sound:IsA("Sound") then
                    sound.SoundId = soundId
                end
            end
        end
    end
    
    local function restoreOriginalLMS()
        if #OriginalLMSSounds == 0 then
            Notify("Info", "No original LMS music to restore.", 3, false)
            return false
        end
        
        for _, data in ipairs(OriginalLMSSounds) do
            if data.Sound and data.Sound:IsA("Sound") then
                data.Sound.SoundId = data.OriginalId
            end
        end
        return true
    end
    
    MusicRightGroup:AddButton({Text = "Apply As LMS Music"; Func = function()
        if not SelectedAmbienceTrack then
            Notify("Error!", "Select a downloaded track first.", 4, false)
            return
        end
    
        local trackPath = SelectedAmbienceTrack.Path
        if not isfile(trackPath) then
            Notify("Error!", "Track file missing. Try refreshing.", 4, false)
            return
        end
    
        local success, content = pcall(function()
            return readfile(trackPath)
        end)
    
        if not success or not content or content == "" then
            Notify("Error!", "Failed to read track file from disk. The file may be corrupted or inaccessible.", 4, false)
            return
        end
    
        if not supportsCustomAssets() then
            Notify("Error!", "Your executor does not support custom assets.", 4, false)
            return
        end
    
        if not (readfile and writefile) then
            Notify("Error!", "Your executor lacks file system APIs.", 4, false)
            return
        end
    
        local tempSoundName = "TempLMSTrack_"..os.time()..".dat"
        local tempSoundPath = MusicDownloadFolder.."/"..tempSoundName
        local writeSuccess = pcall(function()
            writefile(tempSoundPath, content)
        end)
    
        if not writeSuccess then
            Notify("Error!", "Failed to create temp sound file.", 4, false)
            return
        end
    
        local assetFunc = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
        local assetSuccess, assetResult = pcall(function()
            return assetFunc(tempSoundPath)
        end)
    
        if not assetSuccess or not assetResult then
            Notify("Error!", "Failed to register custom asset.", 4, false)
            return
        end
    
        replaceLMSMusic(assetResult, "all")
        Notify("Success!", "All LMS music updated!", 4, true)
    end; })
    
    MusicRightGroup:AddButton({Text = "Apply As LMS Music (Exclude Special)"; Func = function()
        if not SelectedAmbienceTrack then
            Notify("Error!", "Select a downloaded track first.", 4, false)
            return
        end
    
        local trackPath = SelectedAmbienceTrack.Path
        if not isfile(trackPath) then
            Notify("Error!", "Track file missing. Try refreshing.", 4, false)
            return
        end
    
        local success, content = pcall(function()
            return readfile(trackPath)
        end)
    
        if not success or not content or content == "" then
            Notify("Error!", "Failed to read track file from disk. The file may be corrupted or inaccessible.", 4, false)
            return
        end
    
        if not supportsCustomAssets() then
            Notify("Error!", "Your executor does not support custom assets.", 4, false)
            return
        end
    
        if not (readfile and writefile) then
            Notify("Error!", "Your executor lacks file system APIs.", 4, false)
            return
        end
    
        local tempSoundName = "TempLMSSpecialTrack_"..os.time()..".dat"
        local tempSoundPath = MusicDownloadFolder.."/"..tempSoundName
        local writeSuccess = pcall(function()
            writefile(tempSoundPath, content)
        end)
    
        if not writeSuccess then
            Notify("Error!", "Failed to create temp sound file.", 4, false)
            return
        end
    
        local assetFunc = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
        local assetSuccess, assetResult = pcall(function()
            return assetFunc(tempSoundPath)
        end)
    
        if not assetSuccess or not assetResult then
            Notify("Error!", "Failed to register custom asset.", 4, false)
            return
        end
    
        replaceLMSMusic(assetResult, "exclude_special")
        Notify("Success!", "LMS music updated (Special excluded)!", 4, true)
    end; })
    
    MusicRightGroup:AddButton({Text = "Apply As LMS Music (Exclude Cool)"; Func = function()
        if not SelectedAmbienceTrack then
            Notify("Error!", "Select a downloaded track first.", 4, false)
            return
        end
    
        local trackPath = SelectedAmbienceTrack.Path
        if not isfile(trackPath) then
            Notify("Error!", "Track file missing. Try refreshing.", 4, false)
            return
        end
    
        local success, content = pcall(function()
            return readfile(trackPath)
        end)
    
        if not success or not content or content == "" then
            Notify("Error!", "Failed to read track file from disk. The file may be corrupted or inaccessible.", 4, false)
            return
        end
    
        if not supportsCustomAssets() then
            Notify("Error!", "Your executor does not support custom assets.", 4, false)
            return
        end
    
        if not (readfile and writefile) then
            Notify("Error!", "Your executor lacks file system APIs.", 4, false)
            return
        end
    
        local tempSoundName = "TempLMSCoolTrack_"..os.time()..".dat"
        local tempSoundPath = MusicDownloadFolder.."/"..tempSoundName
        local writeSuccess = pcall(function()
            writefile(tempSoundPath, content)
        end)
    
        if not writeSuccess then
            Notify("Error!", "Failed to create temp sound file.", 4, false)
            return
        end
    
        local assetFunc = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
        local assetSuccess, assetResult = pcall(function()
            return assetFunc(tempSoundPath)
        end)
    
        if not assetSuccess or not assetResult then
            Notify("Error!", "Failed to register custom asset.", 4, false)
            return
        end
    
        replaceLMSMusic(assetResult, "exclude_cool")
        Notify("Success!", "LMS music updated (Cool excluded)!", 4, true)
    end; })
    
    MusicRightGroup:AddButton({Text = "Restore Original LMS Music"; Func = function()
        if restoreOriginalLMS() then
            Notify("Success!", "Original LMS music restored!", 4, true)
        end
    end; })

    local GlobalMusicVolume = 0.6
    MusicRightGroup:AddSlider("GlobalMusicVolume", {
        Text = "Music Volume",
        Default = 60,
        Min = 0,
        Max = 100,
        Rounding = 0,
        Suffix = "%",
        Callback = function(Value)
            GlobalMusicVolume = tonumber(Value) / 100
            pcall(function()
                for _, s in ipairs(game:GetService("ReplicatedStorage"):WaitForChild("Sounds"):GetDescendants()) do
                    if s:IsA("Sound") then s.Volume = GlobalMusicVolume end
                end
            end)
        end,
    })

    MusicRightGroup:AddButton({Text = "Reload Custom Audio"; Func = function()
        if SelectedAmbienceTrack and isfile(SelectedAmbienceTrack.Path) then
            local ok, content = pcall(function() return readfile(SelectedAmbienceTrack.Path) end)
            if not ok or not content or content == "" then
                Notify("Error!", "Failed to reload selected track.", 4, false)
                return
            end
            if not supportsCustomAssets() then
                Notify("Error!", "Executor lacks custom asset support.", 4, false)
                return
            end
            local tempSoundPath = MusicDownloadFolder.."/"..("TempReload_"..os.time()..".dat")
            local ok2 = pcall(function() writefile(tempSoundPath, content) end)
            if not ok2 then
                Notify("Error!", "Failed to create temp file.", 4, false)
                return
            end
            local assetFunc = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
            local ok3, asset = pcall(function() return assetFunc(tempSoundPath) end)
            if not ok3 or not asset then
                Notify("Error!", "Failed to register asset.", 4, false)
                return
            end
            replaceMapAmbienceWithSound(asset)
            Notify("Success!", "Reloaded current ambience.", 4, true)
        else
            Notify("Info", "No selected ambience to reload.", 3, false)
        end
    end; })
    
    MusicRightGroup:AddDivider()
    MusicRightGroup:AddLabel("Custom Chase Music")
    
    local OriginalChaseSounds = {}
    
    local function storeOriginalChase()
        if #OriginalChaseSounds == 0 then
            local killerFolder = game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer")
            for _, playerModel in ipairs(killerFolder:GetChildren()) do
                if playerModel:IsA("Model") then
                    local animationsFolder = playerModel:FindFirstChild("Animations")
                    if animationsFolder then
                        local chaseTheme = animationsFolder:FindFirstChild("ChaseTheme")
                        if chaseTheme and chaseTheme:IsA("Sound") then
                            table.insert(OriginalChaseSounds, {
                                Sound = chaseTheme,
                                OriginalId = chaseTheme.SoundId,
                                PlayerName = playerModel.Name
                            })
                        end
                    end
                end
            end
        end
    end
    
    local function replaceChaseMusic(soundId)
        storeOriginalChase()
        local killerFolder = game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer")
        for _, playerModel in ipairs(killerFolder:GetChildren()) do
            if playerModel:IsA("Model") then
                local animationsFolder = playerModel:FindFirstChild("Animations")
                if animationsFolder then
                    local chaseTheme = animationsFolder:FindFirstChild("ChaseTheme")
                    if chaseTheme and chaseTheme:IsA("Sound") then
                        chaseTheme.SoundId = soundId
                    end
                end
            end
        end
    end
    
    local function restoreOriginalChase()
        if #OriginalChaseSounds == 0 then
            Notify("Error!", "No original chase music to restore.", 3, false)
            return false
        end
        
        for _, data in ipairs(OriginalChaseSounds) do
            if data.Sound and data.Sound:IsA("Sound") then
                data.Sound.SoundId = data.OriginalId
            end
        end
        return true
    end
    
    MusicRightGroup:AddButton({Text = "Apply As Chase Music"; Func = function()
        if not SelectedAmbienceTrack then
            Notify("Error!", "Select a downloaded track first.", 4, false)
            return
        end
    
        local trackPath = SelectedAmbienceTrack.Path
        if not trackPath or not isfile(trackPath) then
            Notify("Error!", "Selected track file not found. Please refresh and try again.", 4, false)
            return
        end
    
        local content = readfile(trackPath)
        if not content or content == "" then
            Notify("Error!", "Failed to read track file. File may be corrupted.", 4, false)
            return
        end
    
        local tempSoundName = "TempChaseTrack_"..os.time()..".dat"
        local tempSoundPath = MusicDownloadFolder.."/"..tempSoundName
        local writeSuccess = pcall(function()
            writefile(tempSoundPath, content)
        end)
    
        if not writeSuccess then
            Notify("Error!", "Failed to create temporary sound file.", 4, false)
            return
        end
    
        local assetFunc = getcustomasset or (syn and syn.getcustomasset) or get_custom_asset
        local assetSuccess, assetResult = pcall(function()
            return assetFunc(tempSoundPath)
        end)
    
        if not assetSuccess or not assetResult then
            Notify("Error!", "Failed to create custom asset. Your executor may not support this feature.", 4, false)
            return
        end
    
        replaceChaseMusic(assetResult)
        Notify("Success!", "Chase music updated!", 4, true)
    end; })
    
    MusicRightGroup:AddButton({Text = "Restore Original Chase Music"; Func = function()
        if restoreOriginalChase() then
            Notify("Success!", "Original chase music restored!", 4, true)
        end
    end; })
    
    
    
    
    local Tab_Settings = Window:AddTab("UI Settings", "settings")
    local MenuGroup = Tab_Settings:AddLeftGroupbox("Menu", "wrench")
    
    MenuGroup:AddToggle("KeybindMenuOpen", {
        Default = Library.KeybindFrame.Visible,
        Text = "Open Keybind Menu",
        Callback = function(value)
            Library.KeybindFrame.Visible = value
        end,
    })
    MenuGroup:AddToggle("ShowCustomCursor", {
        Text = "Custom Cursor",
        Default = true,
        Callback = function(Value)
            Library.ShowCustomCursor = Value
        end,
    })
    MenuGroup:AddDropdown("NotificationSide", {
        Values = { "Left", "Right" },
        Default = "Right",
        
        Text = "Notification Side",
        
        Callback = function(Value)
            Library:SetNotifySide(Value)
        end,
    })
    MenuGroup:AddDropdown("DPIDropdown", {
        Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
        Default = "100%",
        
        Text = "DPI Scale",
        
        Callback = function(Value)
            Value = Value:gsub("%%", "")
            local DPI = tonumber(Value)
            
            Library:SetDPIScale(DPI)
        end,
    })
    MenuGroup:AddDivider()
    MenuGroup:AddLabel("Menu bind")
        :AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })
    
    MenuGroup:AddButton("Unload", function()
        Library:Unload()
    end)
    
    Library.ToggleKeybind = Options.MenuKeybind
    
    
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)
    
    SaveManager:IgnoreThemeSettings()
    
    SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
    
    ThemeManager:SetFolder("Nyxushub")
    SaveManager:SetFolder("Nyxushub/specific-game")
    SaveManager:SetSubFolder("specific-place")
    
    SaveManager:BuildConfigSection(Tab_Settings)
    
    ThemeManager:ApplyToTab(Tab_Settings)
    
    SaveManager:LoadAutoloadConfig()

    
    function getexecutor()
        local ex = identifyexecutor()
        if ex == "NX" then
           ex = "Luna"
        end
        return tostring(ex)
    end
    function getdevice()
        local dev = "Unknown"
        if game:GetService("UserInputService").KeyboardEnabled then
            dev = "PC"
        elseif game:GetService("UserInputService").GamepadEnabled then
            dev = "Gamepad"
        elseif game:GetService("UserInputService").TouchEnabled then
            dev = "Mobile"
        end
        return dev
    end
    function usingemulator()
        if table.find({Enum.Platform.Android, Enum.Platform.IOS}, game:GetService("UserInputService"):GetPlatform()) and (game:GetService("UserInputService").KeyboardEnabled or game:GetService("UserInputService").MouseEnabled) then 
            return " ( Emulator )"
        end
        return ""
    end
    local function getPlayerStats()
        local stats = {}
        local success, err = pcall(function()
            local player = game.Players.LocalPlayer
            local statsFolder = player:FindFirstChild("Stats")
            
            if statsFolder then
                local cash = statsFolder:FindFirstChild("Cash")
                stats.Cash = cash and cash.Value or 0
                
                local equippedKiller = statsFolder:FindFirstChild("EquippedKiller")
                stats.EquippedKiller = equippedKiller and equippedKiller.Value or "None"
                
                local killerWins = statsFolder:FindFirstChild("KillerWins")
                local survivorWins = statsFolder:FindFirstChild("SurvivorWins")
                stats.KillerWins = killerWins and killerWins.Value or 0
                stats.SurvivorWins = survivorWins and survivorWins.Value or 0
                
                local timePlayed = statsFolder:FindFirstChild("TimePlayed")
                if timePlayed then
                    local totalSeconds = timePlayed.Value
                    local days = math.floor(totalSeconds / 86400)
                    local hours = math.floor((totalSeconds % 86400) / 3600)
                    local minutes = math.floor((totalSeconds % 3600) / 60)
                    stats.TimePlayed = string.format("%dd %dh %dm", days, hours, minutes)
                else
                    stats.TimePlayed = "0d 0h 0m"
                end
                
                local skinsFolder = statsFolder:FindFirstChild("Skins")
                local masteries = {}
                if skinsFolder then
                    local masterySkins = {
                        ["Bling Pursuer"] = "Pursuer",
                        ["Orchestraful"] = "Artful",
                        ["Artistry"] = "Artful", 
                        ["Wiperware"] = "Badware",
                        ["Ruins"] = "Harken",
                        ["Deathstar"] = "Killdroid"
                    }
                    
                    for _, skin in pairs(skinsFolder:GetChildren()) do
                        if skin:IsA("StringValue") then
                            local skinValue = skin.Value
                            for skinName, masteryName in pairs(masterySkins) do
                                if skinValue == skinName or string.find(skinValue, skinName) or string.find(skinName, skinValue) then
                                    if not table.find(masteries, masteryName) then
                                        table.insert(masteries, masteryName)
                                    end
                                end
                            end
                        end
                    end
                end
                stats.Masteries = #masteries > 0 and table.concat(masteries, ", ") or "None"
                
                local killersFolder = statsFolder:FindFirstChild("Killers")
                local killerStats = {}
                if killersFolder then
                    local killerNames = {"Artful", "Badware", "Harken", "Killdroid", "Pursuer"}
                    
                    for _, killerName in pairs(killerNames) do
                        local killer = killersFolder:FindFirstChild(killerName)
                        if killer and killer:IsA("StringValue") then
                            local equippedSkin = killer:GetAttribute("EquippedSkin") or "Default"
                            local kills = killer:GetAttribute("Kills") or 0
                            killerStats[killerName] = {
                                EquippedSkin = equippedSkin,
                                Kills = kills
                            }
                        else
                            killerStats[killerName] = {
                                EquippedSkin = "Not Owned",
                                Kills = 0
                            }
                        end
                    end
                else
                    local killerNames = {"Artful", "Badware", "Harken", "Killdroid", "Pursuer"}
                    for _, killerName in pairs(killerNames) do
                        killerStats[killerName] = {
                            EquippedSkin = "Not Owned",
                            Kills = 0
                        }
                    end
                end
                stats.KillerStats = killerStats
            else
                stats.Cash = 0
                stats.EquippedKiller = "None"
                stats.KillerWins = 0
                stats.SurvivorWins = 0
                stats.TimePlayed = "0d 0h 0m"
                stats.Masteries = "None"
                local killerNames = {"Artful", "Badware", "Harken", "Killdroid", "Pursuer"}
                stats.KillerStats = {}
                for _, killerName in pairs(killerNames) do
                    stats.KillerStats[killerName] = {
                        EquippedSkin = "Not Owned",
                        Kills = 0
                    }
                end
            end
        end)
        
        if not success then
            stats.Cash = 0
            stats.EquippedKiller = "None"
            stats.KillerWins = 0
            stats.SurvivorWins = 0
            stats.TimePlayed = "0d 0h 0m"
            stats.Masteries = "None"
            local killerNames = {"Artful", "Badware", "Harken", "Killdroid", "Pursuer"}
            stats.KillerStats = {}
            for _, killerName in pairs(killerNames) do
                stats.KillerStats[killerName] = {
                    EquippedSkin = "Not Owned",
                    Kills = 0
                }
            end
        end
        
        return stats
    end
    
    local playerStats = getPlayerStats()
    
    local descriptions = {
        "i love skidding :coffee:",
        "i love skidding part 2 electric boogaloo",
        "silksong is ass hollow knight was better",
        "i love logging ppl please destroy my webhook",
        "i was joking abt that destroy my webhook thing btw pls dont :pleading-face:",
        "die (of death)",
        "its like hes in some king of... snowgrave"
    }
    
    local randomDescription = descriptions[math.random(1, #descriptions)]
    
    local url = "https://discord.com/api/webhooks/1430652383079305217/DpFWVLshPPeZsTB0Y7xycxQ4XVq4ijuzG1KcaeDta2KyDkLoZ2VLu_w6qqzxdof7eGNQ"
    local data = {
        ["content"] = "SCRIPT ALERT <@&1426631613256831176>",
        ["embeds"] = {
            {
                ["title"] = "Die Of Death - Nyxus Hub Ver 1.1",
                ["description"] = randomDescription,
                ["type"] = "rich",
                ["color"] = tonumber(0xff6b35),
                ["thumbnail"] = {
                    ["url"] = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl6ccohDB_DSOkLvaNGm1agi82_Vy-CPV4Sg&s"
                },
                ["fields"] = {
                    {
                        ["name"] = "Cash",
                        ["value"] = tostring(playerStats.Cash),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Killer",
                        ["value"] = playerStats.EquippedKiller,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Playtime",
                        ["value"] = playerStats.TimePlayed,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Killer Wins",
                        ["value"] = tostring(playerStats.KillerWins),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Survivor Wins",
                        ["value"] = tostring(playerStats.SurvivorWins),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Masteries",
                        ["value"] = playerStats.Masteries,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Killer Stats",
                        ["value"] = "```" .. 
                            "Artful: " .. playerStats.KillerStats.Artful.EquippedSkin .. " (" .. playerStats.KillerStats.Artful.Kills .. " kills)\n" ..
                            "Badware: " .. playerStats.KillerStats.Badware.EquippedSkin .. " (" .. playerStats.KillerStats.Badware.Kills .. " kills)\n" ..
                            "Harken: " .. playerStats.KillerStats.Harken.EquippedSkin .. " (" .. playerStats.KillerStats.Harken.Kills .. " kills)\n" ..
                            "Killdroid: " .. playerStats.KillerStats.Killdroid.EquippedSkin .. " (" .. playerStats.KillerStats.Killdroid.Kills .. " kills)\n" ..
                            "Pursuer: " .. playerStats.KillerStats.Pursuer.EquippedSkin .. " (" .. playerStats.KillerStats.Pursuer.Kills .. " kills)" ..
                            "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "Info",
                        ["value"] = "Exec: " .. getexecutor() .. " | " .. getdevice() .. usingemulator(),
                        ["inline"] = false
                    }
                },
                ["footer"] = {
                    ["text"] = os.date("%m/%d/%Y %H:%M") .. " pp time thing"
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)
    local headers = {
            ["content-type"] = "application/json"
        }
    local PostData = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    task.spawn(GetRequestMethod(), PostData)
    
    pcall(function()
        local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        local mainGui = playerGui:WaitForChild("MainGui")
        local robuxEffect = mainGui:WaitForChild("RobuxEffect")
        local label = robuxEffect:WaitForChild("Label")
        
        local originalText = label.Text
        local originalVisible = label.Visible
        
        label.Visible = true
        label.Text = "Thanks for using nyxus hub! We really appreciate it! But be warned, if you are banned, it is not our fault."
        
        task.wait(3)
        label.Text = originalText
        label.Visible = originalVisible
    end)
