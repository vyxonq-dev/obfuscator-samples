local stored_fonts = {}
local gui_config = {
    Color = Color3.fromRGB(255, 255, 255),
    Keybind = Enum.KeyCode.Insert,
    Assets = false,
    MinHeight = 100,
    MaxHeight = 600,
    InitialHeight = 400,
    MinWidth = 300,
    MaxWidth = 800,
    InitialWidth = 500
}

for _, v in Enum.Font:GetEnumItems() do
    table.insert(stored_fonts, v.Name)
end

local config = gui_config or nil
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow(config, gethui())
local window_name = library:SetWindowName("Eliminition | By MjContegazxc")

local tabs = {
    main = window:CreateTab("Main"),
    game = window:CreateTab("Game"),
    settings = window:CreateTab("Settings")
}

local sections = {
    Info = tabs.main:CreateSection("Stats"),
Gun = tabs.main:CreateSection("Auto Equip Gun"),
Chair = tabs.main:CreateSection("Chairs"),
Effect = tabs.main:CreateSection("Auto Effects"),
    Main = tabs.main:CreateSection("Main"),
    Player = tabs.main:CreateSection("LocalPlayer"),
    Game = tabs.game:CreateSection("Game"),
    Discord = tabs.game:CreateSection("Discord"),
}

local time_label = sections.Info:CreateLabel("Time: "..os.date("%H:%M:%S"))

spawn(function()
    while true do
        time_label:UpdateText("Time: "..os.date("%H:%M:%S"))
        wait(1)
    end
end)

local coins_label = sections.Info:CreateLabel("Coins: 0")

spawn(function()
    while true do
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Stats") and player.Stats:FindFirstChild("Coins") then
            coins_label:UpdateText("Coins: "..tostring(player.Stats.Coins.Value))
        end
        wait(1)
    end
end)

local kills_label = sections.Info:CreateLabel("Kills: 0")

spawn(function()
    while true do
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Stats") and player.Stats:FindFirstChild("Kills") then
            kills_label:UpdateText("Kills: "..tostring(player.Stats.Kills.Value))
        end
        wait(1)
    end
end)

local wins_label = sections.Info:CreateLabel("Wins: 0")

spawn(function()
    while true do
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Stats") and player.Stats:FindFirstChild("Wins") then
            wins_label:UpdateText("Wins: "..tostring(player.Stats.Wins.Value))
        end
        wait(1)
    end
end)

local lastjoin_label = sections.Info:CreateLabel("Last Join: 0")

spawn(function()
    while true do
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Stats") and player.Stats:FindFirstChild("LastJoin") then
            lastjoin_label:UpdateText("Last Join: "..tostring(player.Stats.LastJoin.Value))
        end
        wait(1)
    end
end)

local dailyreward_label = sections.Info:CreateLabel("Daily Reward: 0")

spawn(function()
    while true do
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Stats") and player.Stats:FindFirstChild("DailyRewardTime") then
            dailyreward_label:UpdateText("Daily Reward: "..tostring(player.Stats.DailyRewardTime.Value))
        end
        wait(1)
    end
end)

local firstjoin_label = sections.Info:CreateLabel("First Join: 0")

spawn(function()
    while true do
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Stats") and player.Stats:FindFirstChild("FirstJoin") then
            firstjoin_label:UpdateText("First Join: "..tostring(player.Stats.FirstJoin.Value))
        end
        wait(1)
    end
end)

local robux_label = sections.Info:CreateLabel("Robux: 0")

spawn(function()
    while true do
        local player = game.Players.LocalPlayer
        if player and player:FindFirstChild("Stats") and player.Stats:FindFirstChild("Robux") then
            robux_label:UpdateText("Robux: "..tostring(player.Stats.Robux.Value))
        end
        wait(1)
    end
end)

local skipLoadingEnabled = false

sections.Info:CreateToggle("Skip Loading", false, function(state)
    skipLoadingEnabled = state
    if state then
        local Player = game.Players.LocalPlayer
        Player:SetAttribute("FirstJoin", false)
        if Player.PlayerGui:FindFirstChild("Loading") then
            Player.PlayerGui.Loading:Destroy()
        end
        game:GetService("ReplicatedStorage").Events.Game.GameStart:FireServer()
        window:Notify("Skip Loading", "Skip Loading Enabled", 1)
    else
        window:Notify("Skip Loading", "Skip Loading Disabled", 1)
    end
end)

local autoClaimEnabled = false
local autoClaimConnection

sections.Info:CreateToggle("Auto Claim Reward", false, function(state)
    autoClaimEnabled = state
    if autoClaimConnection then
        autoClaimConnection:Disconnect()
        autoClaimConnection = nil
    end
    
    if state then
        autoClaimConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local Player = game.Players.LocalPlayer
            Player:SetAttribute("JoinTime", 0)
            Player:SetAttribute("Sub", 1800)
        end)
        window:Notify("Auto Claim Reward", "Auto Claim Reward Enabled", 1)
    else
        window:Notify("Auto Claim Reward", "Auto Claim Reward Disabled", 1)
    end
end)

local autoClickEnabled = false
local autoClickConnection

sections.Info:CreateToggle("Auto Click", false, function(state)
    autoClickEnabled = state
    if autoClickConnection then
        autoClickConnection:Disconnect()
        autoClickConnection = nil
    end
    
    if state then
        autoClickConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local InfoClient = game:GetService("Players").LocalPlayer.PlayerGui.Loading.Info.Client
            local clicker = InfoClient.Clicker
            clicker.MouseButton1Click:Fire()
        end)
        window:Notify("Auto Click", "Auto Click Enabled", 1)
    else
        window:Notify("Auto Click", "Auto Click Disabled", 1)
    end
end)


local pythonEnabled = false

sections.Gun:CreateToggle("Python", false, function(state)
    pythonEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Python,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Python", "Python Enabled", 1)
    else
        window:Notify("Python", "Python Disabled", 1)
    end
end)

local revolverEnabled = false

sections.Gun:CreateToggle("Revolver", false, function(state)
    revolverEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Revolver,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Revolver", "Revolver Enabled", 1)
    else
        window:Notify("Revolver", "Revolver Disabled", 1)
    end
end)

local rustyEnabled = false

sections.Gun:CreateToggle("Rusty", false, function(state)
    rustyEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Rusty,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Rusty", "Rusty Enabled", 1)
    else
        window:Notify("Rusty", "Rusty Disabled", 1)
    end
end)

local toyEnabled = false

sections.Gun:CreateToggle("Toy", false, function(state)
    toyEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Toy,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Toy", "Toy Enabled", 1)
    else
        window:Notify("Toy", "Toy Disabled", 1)
    end
end)

local woodenEnabled = false

sections.Gun:CreateToggle("Wooden", false, function(state)
    woodenEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Wooden,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Wooden", "Wooden Enabled", 1)
    else
        window:Notify("Wooden", "Wooden Disabled", 1)
    end
end)

local cardboardEnabled = false

sections.Gun:CreateToggle("Cardboard", false, function(state)
    cardboardEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Cardboard,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Cardboard", "Cardboard Enabled", 1)
    else
        window:Notify("Cardboard", "Cardboard Disabled", 1)
    end
end)

local glassEnabled = false

sections.Gun:CreateToggle("Glass", false, function(state)
    glassEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Glass,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Glass", "Glass Enabled", 1)
    else
        window:Notify("Glass", "Glass Disabled", 1)
    end
end)

local cobaltEnabled = false

sections.Gun:CreateToggle("Cobalt", false, function(state)
    cobaltEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Cobalt,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Cobalt", "Cobalt Enabled", 1)
    else
        window:Notify("Cobalt", "Cobalt Disabled", 1)
    end
end)

local amethystEnabled = false

sections.Gun:CreateToggle("Amethyst", false, function(state)
    amethystEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Amethyst,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Amethyst", "Amethyst Enabled", 1)
    else
        window:Notify("Amethyst", "Amethyst Disabled", 1)
    end
end)

local aquaEnabled = false

sections.Gun:CreateToggle("Aqua", false, function(state)
    aquaEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Aqua,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Aqua", "Aqua Enabled", 1)
    else
        window:Notify("Aqua", "Aqua Disabled", 1)
    end
end)

local viridianEnabled = false

sections.Gun:CreateToggle("Viridian", false, function(state)
    viridianEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Viridian,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Viridian", "Viridian Enabled", 1)
    else
        window:Notify("Viridian", "Viridian Disabled", 1)
    end
end)

local crimsonEnabled = false

sections.Gun:CreateToggle("Crimson", false, function(state)
    crimsonEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Crimson,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Crimson", "Crimson Enabled", 1)
    else
        window:Notify("Crimson", "Crimson Disabled", 1)
    end
end)

local korbloxEnabled = false

sections.Gun:CreateToggle("Korblox", false, function(state)
    korbloxEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Korblox,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Korblox", "Korblox Enabled", 1)
    else
        window:Notify("Korblox", "Korblox Disabled", 1)
    end
end)

local emberEnabled = false

sections.Gun:CreateToggle("Ember", false, function(state)
    emberEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Ember,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Ember", "Ember Enabled", 1)
    else
        window:Notify("Ember", "Ember Disabled", 1)
    end
end)

local goldenEnabled = false

sections.Gun:CreateToggle("Golden", false, function(state)
    goldenEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Golden,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Golden", "Golden Enabled", 1)
    else
        window:Notify("Golden", "Golden Disabled", 1)
    end
end)

local stormEnabled = false

sections.Gun:CreateToggle("Storm", false, function(state)
    stormEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Storm,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Storm", "Storm Enabled", 1)
    else
        window:Notify("Storm", "Storm Disabled", 1)
    end
end)

local overseerEnabled = false

sections.Gun:CreateToggle("Overseer", false, function(state)
    overseerEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Overseer,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Overseer", "Overseer Enabled", 1)
    else
        window:Notify("Overseer", "Overseer Disabled", 1)
    end
end)

local frostbiteEnabled = false

sections.Gun:CreateToggle("Frostbite", false, function(state)
    frostbiteEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Frostbite,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Frostbite", "Frostbite Enabled", 1)
    else
        window:Notify("Frostbite", "Frostbite Disabled", 1)
    end
end)

local deagleEnabled = false

sections.Gun:CreateToggle("Deagle", false, function(state)
    deagleEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Deagle,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Deagle", "Deagle Enabled", 1)
    else
        window:Notify("Deagle", "Deagle Disabled", 1)
    end
end)

local awmEnabled = false

sections.Gun:CreateToggle("AWM", false, function(state)
    awmEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.AWM,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("AWM", "AWM Enabled", 1)
    else
        window:Notify("AWM", "AWM Disabled", 1)
    end
end)

local launcherEnabled = false

sections.Gun:CreateToggle("Launcher", false, function(state)
    launcherEnabled = state
    if state then
        local args = {
            [1] = game:GetService("ReplicatedStorage").Storage.Revolvers.Launcher,
            [2] = "Coins",
            [3] = "Revolvers"
        }
        game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
        window:Notify("Launcher", "Launcher Enabled", 1)
    else
        window:Notify("Launcher", "Launcher Disabled", 1)
    end
end)


local autoChairsEnabled = false
local chairsConnection
local selectedChairs = {}

sections.Chair:CreateDropdown(
    "Select Chairs",
    {"Wooden", "Rusty", "Metallic", "Rocky", "Glass", "Brick", "Cubes", "Golden", "Magma", "Throne", "Swing", "Jail"},
    function(selected)
        selectedChairs[selected] = true
    end,
    "Wooden",
    true
)

sections.Chair:CreateToggle("Auto Chairs", false, function(state)
    autoChairsEnabled = state
    if chairsConnection then
        chairsConnection:Disconnect()
        chairsConnection = nil
    end
    
    if state then
        chairsConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for chair, _ in pairs(selectedChairs) do
                local args = {
                    [1] = game:GetService("ReplicatedStorage").Storage.Chairs[chair],
                    [2] = "Coins",
                    [3] = "Chairs"
                }
                game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
            end
        end)
        window:Notify("Auto Chairs", "Auto Chairs Enabled", 1)
    else
        window:Notify("Auto Chairs", "Auto Chairs Disabled", 1)
    end
end)

local autoEffectsEnabled = false
local effectsConnection
local selectedEffects = {}

sections.Effect:CreateDropdown(
    "Select Effects",
    {"Shrink", "Ragdoll", "Launch", "Vanish", "Error", "Gold", "Ghost", "Puppet", "Airhead", "Shock", "Impostor", "Frozen", "Bones", "JUDGEMENT"},
    function(selected)
        selectedEffects[selected] = true
    end,
    "Shrink",
    true
)

sections.Effect:CreateToggle("Auto Effects", false, function(state)
    autoEffectsEnabled = state
    if effectsConnection then
        effectsConnection:Disconnect()
        effectsConnection = nil
    end
    
    if state then
        effectsConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for effect, _ in pairs(selectedEffects) do
                local args = {
                    [1] = game:GetService("ReplicatedStorage").Storage.Effects[effect],
                    [2] = "Coins",
                    [3] = "Effects"
                }
                game:GetService("ReplicatedStorage").Remotes.Shop:FireServer(unpack(args))
            end
        end)
        window:Notify("Auto Effects", "Auto Effects Enabled", 1)
    else
        window:Notify("Auto Effects", "Auto Effects Disabled", 1)
    end
end)

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- Auto Join Group
local autoJoinGroupEnabled = false
local joinGroupConnection

sections.Main:CreateToggle("Auto Join Group", false, function(state)
    autoJoinGroupEnabled = state
    if joinGroupConnection then
        joinGroupConnection:Disconnect()
        joinGroupConnection = nil
    end
    
    if state then
        joinGroupConnection = RunService.Heartbeat:Connect(function()
            if not autoJoinGroupEnabled then return end
            
            local stats = LocalPlayer:FindFirstChild("Stats")
            if stats and stats:FindFirstChild("JoinedGroup") and stats.JoinedGroup.Value == 0 then
                if ReplicatedStorage:FindFirstChild("Game") and ReplicatedStorage.Game:FindFirstChild("Lobby") and ReplicatedStorage.Game.Lobby.Value and not LocalPlayer:GetAttribute("TalkedToKevin") then
                    local talkToKevinEvent = ReplicatedStorage:FindFirstChild("TalkToKevin")
                    if talkToKevinEvent then
                        talkToKevinEvent:FireServer()
                        stats.JoinedGroup.Value = 1
                    end
                end
            end
        end)
        window:Notify("Auto Join Group", "Auto Join Group Enabled", 1)
    else
        window:Notify("Auto Join Group", "Auto Join Group Disabled", 1)
    end
end)


local autoShootEnabled = false
local shootConnection
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

sections.Main:CreateToggle("Auto Shoot", false, function(state)
    autoShootEnabled = state
    if shootConnection then
        shootConnection:Disconnect()
        shootConnection = nil
    end
    
    if state then
        shootConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChildWhichIsA("Tool") then
                local mouse = LocalPlayer:GetMouse()
                local target = mouse.Target
                
                if target and (target.Parent:IsA("Model") or target.Name == "SelfHit") then
                    local targetModel = target.Name == "SelfHit" and character or target.Parent
                    local humanoid = targetModel:FindFirstChild("Humanoid")
                    
                    if humanoid and humanoid.Health > 0 then
                        local chance = tonumber(ReplicatedStorage.Game.Chance.Value) or 0
                        if chance >= 100 then
                            ReplicatedStorage.Remotes.Shoot:FireServer(targetModel)
                        end
                    end
                end
            end
        end)
    end
end)

local instantShootEnabled = false
local shootTimerConnection

sections.Main:CreateToggle("Instant Shoot Timer", false, function(state)
    instantShootEnabled = state
    if shootTimerConnection then
        shootTimerConnection:Disconnect()
        shootTimerConnection = nil
    end
    
    if state then
        shootTimerConnection = game:GetService("RunService").Heartbeat:Connect(function()
            -- Reset shoot timer to enable instant shooting
            game.ReplicatedStorage.Game.ShootTime.Value = tick() - 100
        end)
    end
end)

local autoShootEnabled = false
local shootConnection
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

sections.Main:CreateToggle("Auto Shoot(V1)", false, function(state)
    autoShootEnabled = state
    if shootConnection then
        shootConnection:Disconnect()
        shootConnection = nil
    end
    
    if state then
        shootConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local character = LocalPlayer.Character
            if character and character:FindFirstChildWhichIsA("Tool") then
                local mouse = LocalPlayer:GetMouse()
                local target = mouse.Target
                
                if target and (target.Parent:IsA("Model") or target.Name == "SelfHit") then
                    local targetModel = target.Name == "SelfHit" and character or target.Parent
                    local humanoid = targetModel:FindFirstChild("Humanoid")
                    
                    if humanoid and humanoid.Health > 0 then
                        -- Check if kill chance is high enough (90% or higher)
                        local chance = tonumber(ReplicatedStorage.Game.Chance.Value) or 0
                        if chance >= 90 then
                            -- Fire the shoot remote with the target character
                            ReplicatedStorage.Remotes.Shoot:FireServer(targetModel)
                        end
                    end
                end
            end
        end)
    end
end)

local autoShootEnabled = false
local shootConnection

sections.Main:CreateToggle("Auto Shoots(Random)", false, function(state)
    autoShootEnabled = state
    if shootConnection then
        shootConnection:Disconnect()
        shootConnection = nil
    end
    
    if state then
        shootConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    local args = {
                        [1] = player.Character
                    }
                    game:GetService("ReplicatedStorage").Remotes.Shoot:FireServer(unpack(args))
                end
            end
        end)
        window:Notify("Auto Shoot", "Auto Shoot Enabled", 1)
    else
        window:Notify("Auto Shoot", "Auto Shoot Disabled", 1)
    end
end)

local autoShootEnabled = false
local autoShootConnection
local currentTarget = nil

sections.Main:CreateToggle("Auto Shoot with Target Lock", false, function(state)
    autoShootEnabled = state
    if autoShootConnection then
        autoShootConnection:Disconnect()
        autoShootConnection = nil
    end
    
    if state then
        autoShootConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local character = game.Players.LocalPlayer.Character
            if not character or not character:FindFirstChildWhichIsA("Tool") then
                return
            end
            
            local mouse = game.Players.LocalPlayer:GetMouse()
            local target = mouse.Target
            
            if target and (target.Parent:IsA("Model") or target.Name == "SelfHit") then
                local targetModel = target.Name == "SelfHit" and character or target.Parent
                local humanoid = targetModel:FindFirstChild("Humanoid")
                
                if humanoid and humanoid.Health > 0 then
                    currentTarget = targetModel
                    
                    -- Ensure 100% kill chance
                    game.ReplicatedStorage.Game.Chance.Value = 100
                    
                    -- Reset shoot timer
                    game.ReplicatedStorage.Game.ShootTime.Value = tick() - 100
                    
                    -- Shoot at target
                    game.ReplicatedStorage.Remotes.Shoot:FireServer(targetModel)
                end
            end
        end)
    end
end)

-- Auto Shoot
local autoShootEnabled = false
local shootConnection

sections.Main:CreateToggle("Auto Shoot", false, function(state)
    autoShootEnabled = state
    if shootConnection then
        shootConnection:Disconnect()
        shootConnection = nil
    end
    
    if state then
        shootConnection = RunService.RenderStepped:Connect(function()
            if not autoShootEnabled then return end
            
            local character = LocalPlayer.Character
            if character and character:FindFirstChildWhichIsA("Tool") then
                local mouse = LocalPlayer:GetMouse()
                local target = mouse.Target
                
                if target and (target.Parent:IsA("Model") or target.Name == "SelfHit") then
                    local targetModel = target.Name == "SelfHit" and character or target.Parent
                    local humanoid = targetModel:FindFirstChild("Humanoid")
                    
                    if humanoid and humanoid.Health > 0 then
                        local chance = ReplicatedStorage:FindFirstChild("Game") and ReplicatedStorage.Game:FindFirstChild("Chance") and tonumber(ReplicatedStorage.Game.Chance.Value) or 0
                        if chance >= 80 then
                            ReplicatedStorage.Remotes.Shoot:FireServer(targetModel)
                        end
                    end
                end
            end
        end)
    end
end)

-- Double Cash
local doubleCashEnabled = false

sections.Main:CreateToggle("Double Cash", false, function(state)
    doubleCashEnabled = state
    if state then
        LocalPlayer:SetAttribute("DoubleCash", true)
    else
        LocalPlayer:SetAttribute("DoubleCash", false)
    end
end)

-- ESP
local espEnabled = false
local espConnection
local highlights = {}

sections.Main:CreateToggle("ESP", false, function(state)
    espEnabled = state
    if espConnection then
        espConnection:Disconnect()
        espConnection = nil
    end
    
    -- Clean up existing highlights
    for _, highlight in pairs(highlights) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    highlights = {}
    
    if not state then return end
    
    espConnection = RunService.RenderStepped:Connect(function()
        if not espEnabled then 
            espConnection:Disconnect()
            return 
        end
        
        -- Clean up dead players
        for player, highlight in pairs(highlights) do
            if not player or not player.Parent or not player:FindFirstChild("Humanoid") or player.Humanoid.Health <= 0 then
                if highlight and highlight.Parent then
                    highlight:Destroy()
                end
                highlights[player] = nil
            end
        end
        
        -- Add highlights for alive players
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local character = player.Character
                if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
                    if not highlights[character] then
                        local highlight = Instance.new("Highlight")
                        highlight.Adornee = character
                        highlight.FillTransparency = 0.5
                        highlight.OutlineTransparency = 0
                        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        
                        if player:GetAttribute("Bot") then
                            highlight.FillColor = Color3.fromRGB(144, 203, 255)
                            highlight.OutlineColor = Color3.fromRGB(144, 203, 255)
                        else
                            highlight.FillColor = Color3.fromRGB(255, 0, 0)
                            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)
                        end
                        
                        highlight.Parent = character
                        highlights[character] = highlight
                    end
                end
            end
        end
    end)
end)


local modifierExploitEnabled = false
local modifierConnection

sections.Main:CreateToggle("Fast Quick Draw", false, function(state)
    modifierExploitEnabled = state
    if modifierConnection then
        modifierConnection:Disconnect()
        modifierConnection = nil
    end
    
    if state then
        modifierConnection = game:GetService("RunService").Heartbeat:Connect(function()
            -- Set modifier to Quickdraw for faster shooting
            game.ReplicatedStorage.Game.Modifier.Value = "Quickdraw"
        end)
    end
end)

local cashManipulatorEnabled = false
local cashConnection

sections.Main:CreateToggle("Cash Boost(visual)", false, function(state)
    cashManipulatorEnabled = state
    if cashConnection then
        cashConnection:Disconnect()
        cashConnection = nil
    end
    
    if state then
        local player = game.Players.LocalPlayer
        local stats = player:WaitForChild("Stats")
        local coins = stats:WaitForChild("Coins")
        
        cashConnection = game:GetService("RunService").Heartbeat:Connect(function()
            -- Double the current coins value
            local currentValue = coins.Value
            if currentValue > 0 then
                coins.Value = currentValue * 2
            end
        end)
    end
end)

local godModeEnabled = false
local godModeConnections = {}
local originalShootEvent

sections.Main:CreateToggle("Anti Drop", false, function(state)
    godModeEnabled = state
    local player = game.Players.LocalPlayer
    
    -- Clean up existing connections
    for _, connection in pairs(godModeConnections) do
        if connection then
            connection:Disconnect()
        end
    end
    godModeConnections = {}
    
    if state then
        -- Wait for character to load
        local character = player.Character
        if not character then
            player.CharacterAdded:Wait()
            character = player.Character
            wait(1) -- Wait for character to fully load
        end
        
        local humanoid = character:WaitForChild("Humanoid")
        
        -- Method 1: Health Lock - Prevents health from decreasing
        godModeConnections.health = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
            if humanoid.Health < humanoid.MaxHealth then
                humanoid.Health = humanoid.MaxHealth
            end
        end)
        
        -- Method 2: Create Decoy Part - Absorbs hits meant for player
        local selfHit = workspace:FindFirstChild("SelfHit")
        if not selfHit then
            selfHit = Instance.new("Part")
            selfHit.Name = "SelfHit"
            selfHit.Size = Vector3.new(0.1, 0.1, 0.1)
            selfHit.Transparency = 1
            selfHit.Anchored = true
            selfHit.CanCollide = false
            selfHit.Parent = workspace
        end
        selfHit.CFrame = CFrame.new(9999, 9999, 9999) -- Move far away
        
        -- Method 3: Set Invincibility Attribute
        player:SetAttribute("Invincible", true)
        
        -- Method 4: Hook into Shoot Remote (Server-side protection)
        if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Shoot") then
            originalShootEvent = ReplicatedStorage.Remotes.Shoot.OnServerEvent
            
            ReplicatedStorage.Remotes.Shoot.OnServerEvent = function(shooter, target)
                -- Check if the target is our character
                if target and target:IsDescendantOf(character) then
                    return nil -- Block the hit
                end
                -- Process normally for other targets
                return originalShootEvent(shooter, target)
            end
        end
        
        -- Method 5: Character Protection Loop
        godModeConnections.protection = game:GetService("RunService").Heartbeat:Connect(function()
            if not godModeEnabled then return end
            
            -- Ensure health stays at max
            if humanoid.Health < humanoid.MaxHealth then
                humanoid.Health = humanoid.MaxHealth
            end
            
            -- Make character parts non-collidable and semi-transparent
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                    if part.Transparency < 0.5 then
                        part.Transparency = 0.5
                    end
                end
            end
        end)
        
        -- Method 6: Anti-Death Protection
        godModeConnections.death = humanoid.Died:Connect(function()
            if godModeEnabled then
                -- Respawn immediately if character dies
                local respawnRemote = ReplicatedStorage:FindFirstChild("Respawn") or ReplicatedStorage.Remotes:FindFirstChild("Respawn")
                if respawnRemote then
                    respawnRemote:FireServer()
                end
            end
        end)
        
        window:Notify("God Mode", "God Mode Enabled - You are now invincible!", 3)
        print("God Mode Enabled")
        
    else
        -- Disable God Mode - Restore everything
        
        -- Restore Shoot Remote
        if originalShootEvent and ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Shoot") then
            ReplicatedStorage.Remotes.Shoot.OnServerEvent = originalShootEvent
        end
        
        -- Remove Invincibility Attribute
        player:SetAttribute("Invincible", false)
        
        -- Remove SelfHit part
        local selfHit = workspace:FindFirstChild("SelfHit")
        if selfHit then
            selfHit:Destroy()
        end
        
        -- Restore character properties
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                -- Allow health to change normally
            end
            
            -- Restore character visibility and collision
            for _, part in pairs(character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                    if part.Name ~= "HumanoidRootPart" then
                        part.Transparency = 0
                    end
                end
            end
        end
        
        window:Notify("God Mode", "God Mode Disabled - You can now take damage", 3)
        print("God Mode Disabled")
    end
end)

local selfHitExploitEnabled = false
local selfHitConnection
local lastCFrame = nil

sections.Main:CreateToggle("SelfHit Exploit", false, function(state)
    selfHitExploitEnabled = state

    -- Disconnect any existing loop
    if selfHitConnection then
        selfHitConnection:Disconnect()
        selfHitConnection = nil
    end

    if state then
        selfHitConnection = game:GetService("RunService").Heartbeat:Connect(function()
            for _, part in pairs(workspace:GetChildren()) do
                if part.Name == "SelfHit" and part:IsA("BasePart") then
                    -- Save original CFrame once
                    if not lastCFrame then
                        lastCFrame = part.CFrame
                    end
                    -- Safely move it
                    pcall(function()
                        part.CFrame = CFrame.new(9999, 9999, 9999)
                    end)
                end
            end
        end)
    else
        -- Restore if possible
        local part = workspace:FindFirstChild("SelfHit")
        if part and lastCFrame then
            pcall(function()
                part.CFrame = lastCFrame
            end)
        end
        lastCFrame = nil
    end
end)

-- High Kill Chance
local killChanceEnabled = false
local chanceConnection

sections.Main:CreateToggle("Auto High Kill Chance", false, function(state)
    killChanceEnabled = state
    if chanceConnection then
        chanceConnection:Disconnect()
        chanceConnection = nil
    end
    
    if state then
        chanceConnection = RunService.Heartbeat:Connect(function()
            if not killChanceEnabled then 
                chanceConnection:Disconnect()
                return 
            end
            
            if ReplicatedStorage:FindFirstChild("Game") and ReplicatedStorage.Game:FindFirstChild("Chance") then
                ReplicatedStorage.Game.Chance.Value = 100
            end
        end)
    else
        if ReplicatedStorage:FindFirstChild("Game") and ReplicatedStorage.Game:FindFirstChild("Chance") then
            ReplicatedStorage.Game.Chance.Value = 50
        end
    end
end)

-- Notification Logger
local notificationLoggerEnabled = false
local loggedNotifications = {}
local originalNotificationEvent

sections.Main:CreateToggle("Notification Logger", false, function(state)
    notificationLoggerEnabled = state
    
    if state then
        -- Store original if not already stored
        if not originalNotificationEvent then
            originalNotificationEvent = ReplicatedStorage.Remotes.Notification.OnClientEvent
        end
        
        -- Hook into notification remote
        ReplicatedStorage.Remotes.Notification.OnClientEvent = function(self, type, player, extra)
            if notificationLoggerEnabled then
                local logEntry = {
                    type = type,
                    player = player,
                    extra = extra,
                    time = tick()
                }
                table.insert(loggedNotifications, logEntry)
                print("Notification logged:", type, player, extra)
            end
            return originalNotificationEvent(self, type, player, extra)
        end
    else
        -- Restore original
        if originalNotificationEvent then
            ReplicatedStorage.Remotes.Notification.OnClientEvent = originalNotificationEvent
        end
    end
end)

-- Auto Bounty
local autoBountyEnabled = false
local bountyConnection
local targetPlayer = nil

sections.Main:CreateToggle("Auto Bounty", false, function(state)
    autoBountyEnabled = state
    if bountyConnection then
        bountyConnection:Disconnect()
        bountyConnection = nil
    end
    
    if state then
        bountyConnection = RunService.Heartbeat:Connect(function()
            if not autoBountyEnabled then 
                bountyConnection:Disconnect()
                return 
            end
            
            if not targetPlayer or targetPlayer:GetAttribute("Dead") then
                -- Find a new target
                if Workspace:FindFirstChild("Characters") then
                    for _, player in pairs(Workspace.Characters:GetChildren()) do
                        if player.PrimaryPart and not player:GetAttribute("Dead") and not player:GetAttribute("Bountied") then
                            targetPlayer = player
                            break
                        end
                    end
                end
            end
            
            if targetPlayer then
                local spectateGui = LocalPlayer.PlayerGui:FindFirstChild("Spectate")
                if spectateGui and spectateGui:FindFirstChild("Bounty") then
                    local bountyBox = spectateGui.Bounty
                    bountyBox.Text = "1000"
                    bountyBox:ReleaseFocus()
                    
                    if ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Shop") then
                        game.ReplicatedStorage.Remotes.Shop:FireServer("BOUNTY", 1000, targetPlayer)
                    end
                end
            end
        end)
    end
end)

local spinbotEnabled = false
local spinbotConnection

sections.Main:CreateToggle("Spinbot", false, function(state)
    spinbotEnabled = state
    if spinbotConnection then
        spinbotConnection:Disconnect()
        spinbotConnection = nil
    end
    
    if state then
        spinbotConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character then
                local root = character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = root.CFrame * CFrame.Angles(0, math.rad(10), 0)
                end
            end
        end)
        window:Notify("Spinbot", "Spinbot Enabled", 1)
    else
        window:Notify("Spinbot", "Spinbot Disabled", 1)
    end
end)

sections.Player:CreateToggle("Anti AFK", true, function(state)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local vu = game:GetService("VirtualUser")

    if state and not _G.AntiAfkConnection then
        _G.AntiAfkConnection = LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        _G.AntiAfkHeartbeat = task.spawn(function()
            while _G.AntiAfkConnection do
                vu:CaptureController()
                vu:ClickButton2(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(60)
            end
        end)
    elseif not state and _G.AntiAfkConnection then
        _G.AntiAfkConnection:Disconnect()
        _G.AntiAfkConnection = nil
        if _G.AntiAfkHeartbeat then
            task.cancel(_G.AntiAfkHeartbeat)
            _G.AntiAfkHeartbeat = nil
        end
    end
end)

sections.Player:CreateToggle("Auto Walk", false, function(state)
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local AutoWalkEnabled = state
    local WalkSpeed = 20

    local function startAutoWalk()
        task.spawn(function()
            while AutoWalkEnabled do
                local character = LocalPlayer.Character
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if humanoid and hrp then
                        humanoid.WalkSpeed = WalkSpeed
                        local forwardVector = hrp.CFrame.LookVector
                        hrp.CFrame = hrp.CFrame + forwardVector * 2
                    end
                end
                task.wait(0.1)
            end
        end)
    end

    if state then
        startAutoWalk()
    else
        local character = LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = 16
            end
        end
    end
end)

sections.Player:CreateToggle("Anti Idle", true, function(state)
    local VirtualUser = game:GetService("VirtualUser")
    local AntiIdleEnabled = state

    local function startAntiIdle()
        task.spawn(function()
            while AntiIdleEnabled do
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
                task.wait(30)
            end
        end)
    end

    if state then
        startAntiIdle()
    end
end)

sections.Player:CreateToggle("Infinite Jump", true, function(state)
    if state and not _G.JumpConnection then
        _G.JumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            local lp = game:GetService("Players").LocalPlayer
            if lp.Character then
                local hum = lp.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    hum:ChangeState("Jumping")
                end
            end
        end)
    elseif not state and _G.JumpConnection then
        _G.JumpConnection:Disconnect()
        _G.JumpConnection = nil
    end
end)

sections.Player:CreateToggle("Noclip", true, function(state)
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local lp = Players.LocalPlayer

    if state and not _G.NoclipConnection then
        _G.NoclipConnection = RunService.Stepped:Connect(function()
            if lp.Character then
                for _, part in pairs(lp.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    elseif not state and _G.NoclipConnection then
        _G.NoclipConnection:Disconnect()
        _G.NoclipConnection = nil
    end
end)

sections.Player:CreateSlider(
    "Walk Speed",
    16,
    200,
    16,
    true,
    function(value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character then
            local hum = lp.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = value end
        end
    end
)

sections.Player:CreateSlider(
    "Gravity Delay",
    1,
    5,
    1,
    true,
    function(value)
        workspace.Gravity = 196.2 * value
    end
)

sections.Player:CreateSlider(
    "Jump Power",
    50,
    200,
    50,
    true,
    function(value)
        local lp = game:GetService("Players").LocalPlayer
        if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
            lp.Character.Humanoid.JumpPower = value
        end
    end
)

sections.Player:CreateSlider(
    "Field of View",
    70,
    120,
    70,
    true,
    function(value)
        workspace.CurrentCamera.FieldOfView = value
    end
)


local savedPosition = nil

-- Save Position Button
sections.Player:CreateButton("Save Position", function()
    local char = game.Players.LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root then
        savedPosition = root.CFrame
        window:Notify("Save Position", "Position Saved", 3)
    end
end)

-- Load Position Button
sections.Player:CreateButton("Load Position", function()
    if savedPosition then
        local char = game.Players.LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = savedPosition
            window:Notify("Load Position", "Position Loaded", 3)
        end
    else
        window:Notify("Load Position", "No Position Saved", 3)
    end
end)


sections.Player:CreateLabel("This script modifies your local player's properties and functions.\nIt only affects YOUR character and doesn't impact other players.\n\nWhat LocalPlayer controls:\n• Your character's movement speed and jumping\n• Your camera field of view\n• Your anti-afk status\n• Your noclip collision\n• Your gravity settings\n\nAll changes are client-side only and temporary.")


sections.Game:CreateButton("Rejoin Game", function()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    TeleportService:Teleport(game.PlaceId, player)
end)

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ServerID = ""

sections.Game:CreateTextBox("Server ID", "Enter server ID here", true, function(text)
    ServerID = text
end)

sections.Game:CreateToggle("Auto Join Server", false, function(state)
    if state then
        window:Notify("Auto Join", "Enabled - Joining server ID: "..ServerID, 4)
        if ServerID ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, ServerID, LocalPlayer)
        else
            window:Notify("Auto Join", "No Server ID entered!", 4)
        end
    else
        window:Notify("Auto Join", "Disabled", 4)
    end
end)


sections.Discord:CreateButton("Join Discord", function()
    setclipboard("https://discord.gg/6vrw6tzex")
    window:Notify("Discord", "Link copied to clipboard!\nPaste in your browser to join: discord.gg/6vrw6tzex", 7)
end)


sections.Discord:CreateLabel("💬 Join our Discord community!\nGet script updates, new features, and support directly from the devs.")


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local watermark = library:Hud()

local lastUpdate = 0
local fps = 0

RunService.RenderStepped:Connect(function(dt)
    lastUpdate += 1
    if lastUpdate >= 10 then
        fps = math.floor(1 / dt)
        lastUpdate = 0
    end

    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    local time = os.date("%Y-%m-%d %H:%M:%S", os.time())

    watermark:SetText(
        string.format("%s | FPS: %d | Ping: %dms | %s", LocalPlayer.Name, fps, ping, time)
    )
end)


local config_manager = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/ConfigManager.lua"))()
config_manager:SetLibrary(library)
config_manager:SetWindow(window)
config_manager:SetFolder("Examnple Name") -- name for folder where configs will be stored
config_manager:BuildConfigSection(tabs.settings)
config_manager:LoadAutoloadConfig()
window:SetBackground("114178849342027") -- if you turned on assets set the background id here
window:SetTileOffset(100)
window:SetTileScale(0.5) -- on how large background asset should be
window:SetBackgroundColor(Color3.fromRGB(40, 40, 40))
window:SetBackgroundTransparency(0.5) -- on how transparent background should be for asset