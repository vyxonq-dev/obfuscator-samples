-- [[ Initialization & Anti-Walkspeed Hook ]] --
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

getgenv().BypassSpeed = false

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if not checkcaller() and method == "FireServer" and tostring(self) == "UpdateWalkspeed" then
        if getgenv().BypassSpeed then
            return nil -- Blocks the remote from setting your speed to 14
        end
    end
    return oldNamecall(self, ...)
end)
setreadonly(mt, true)

-- [[ FPS Counter Setup ]] --
local function createFPSCounter()
    local fpsGui = Instance.new("ScreenGui")
    local fpsText = Instance.new("TextLabel")
    fpsGui.Name = "FPSCounterGUI"
    fpsGui.Parent = CoreGui
    
    fpsText.Parent = fpsGui
    fpsText.BackgroundTransparency = 1
    fpsText.Position = UDim2.new(1, -100, 0, 50)
    fpsText.Size = UDim2.new(0, 80, 0, 30)
    fpsText.Font = Enum.Font.Code
    fpsText.TextSize = 20
    fpsText.TextStrokeTransparency = 0
    fpsText.TextStrokeColor3 = Color3.new(0, 0, 0)
    
    RunService.RenderStepped:Connect(function(step)
        local fps = math.floor(1 / step)
        fpsText.Text = fps .. " FPS"
        
        if fps >= 60 then
            fpsText.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
        elseif fps >= 30 then
            fpsText.TextColor3 = Color3.fromRGB(255, 255, 0) -- Yellow
        else
            fpsText.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
        end
    end)
end
createFPSCounter()

-- [[ Load Rayfield Library ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Flip Rocks for Brainrots! | made by repz lol",
    LoadingTitle = "Loading Flip Rocks...",
    LoadingSubtitle = "by repz",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "RepzScripts",
        FileName = "FlipRocksHub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false
})

-- [[ Variables for Toggles ]] --
getgenv().AutoRebirth = false
getgenv().AutoUpgrade = false
getgenv().AutoCarryUpgrades = false
getgenv().AutoSpin = false
getgenv().BypassSpin = false
getgenv().AutoBuyAll = false
getgenv().AutoBuySpecific = false
getgenv().SpecificRarity = "Normal"
getgenv().AutoFlipAll = false
getgenv().AutoBuyGears = false
getgenv().GearToEquip = "HyperCoil"
getgenv().AutoEquipGear = false

getgenv().InfJump = false
getgenv().WalkSpeedValue = 16
getgenv().JumpPowerValue = 50
getgenv().Noclip = false

-- Combat & Visuals Variables
getgenv().ESPEnabled = false
getgenv().ESPColor = Color3.fromRGB(255, 0, 0)
getgenv().HitboxEnabled = false
getgenv().HitboxSize = 2
getgenv().HitboxColor = Color3.fromRGB(0, 255, 0)
getgenv().AutoClicker = false

-- [[ Tabs ]] --
local HomeTab = Window:CreateTab("Home", "home")
local MainTab = Window:CreateTab("Main", "swords")
local CombatTab = Window:CreateTab("Combat & Visuals", "crosshair")
local GearsTab = Window:CreateTab("Gears", "backpack")
local LocalTab = Window:CreateTab("Local", "user")
local SettingsTab = Window:CreateTab("Settings", "settings")
local OtherTab = Window:CreateTab("Other scripts", "folder")
local AntiLagTab = Window:CreateTab("Anti-lag", "shield")

-- [[ Home Tab ]] --
HomeTab:CreateLabel("Credits:")
HomeTab:CreateLabel("Idea: Cenno")
HomeTab:CreateLabel("Main script: Repz")

local executor = identifyexecutor and identifyexecutor() or "Unknown Executor"
HomeTab:CreateParagraph({Title = "Executor Info", Content = "You are currently using: " .. executor})
HomeTab:CreateParagraph({Title = "Script Network", Content = "Scanning for other players using this script...\n[0] players found in your server."})

-- [[ Main Tab ]] --
MainTab:CreateToggle({
    Name = "Auto-rebirth",
    CurrentValue = false,
    Flag = "TglAutoRebirth",
    Callback = function(Value)
        getgenv().AutoRebirth = Value
        if Value then
            spawn(function()
                while getgenv().AutoRebirth do
                    pcall(function() ReplicatedStorage.Remotes.Rebirth:FireServer() end)
                    task.wait(1)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto-upgrade all brainrots",
    CurrentValue = false,
    Flag = "TglAutoUpgrade",
    Callback = function(Value)
        getgenv().AutoUpgrade = Value
        if Value then
            spawn(function()
                local floors = {"Floor1", "Floor2", "Floor3", "Floor4", "Floor5"}
                local slots = {"Slot1", "Slot2", "Slot3", "Slot4", "Slot5", "Slot6", "Slot7", "Slot8", "Slot9", "Slot10"}
                while getgenv().AutoUpgrade do
                    for _, floor in ipairs(floors) do
                        for _, slot in ipairs(slots) do
                            if not getgenv().AutoUpgrade then break end
                            pcall(function() ReplicatedStorage.Remotes.UpgradeItem:FireServer(floor, slot) end)
                            task.wait(0.05)
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto-purchase carry upgrades",
    CurrentValue = false,
    Flag = "TglAutoCarry",
    Callback = function(Value)
        getgenv().AutoCarryUpgrades = Value
        if Value then
            spawn(function()
                while getgenv().AutoCarryUpgrades do
                    pcall(function() ReplicatedStorage.Remotes.Carry.PurchaseCarryUpgrade:FireServer() end)
                    task.wait(0.1) 
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto-spin",
    CurrentValue = false,
    Flag = "TglAutoSpin",
    Callback = function(Value)
        getgenv().AutoSpin = Value
        if Value then
            spawn(function()
                while getgenv().AutoSpin do
                    pcall(function() ReplicatedStorage.Remotes.SpinWheel.RequestSpin:InvokeServer() end)
                    task.wait(2)
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto-buy all brainrots",
    CurrentValue = false,
    Flag = "TglAutoBuyAll",
    Callback = function(Value)
        getgenv().AutoBuyAll = Value
        if Value then
            spawn(function()
                -- Updated array to include Divine, Gold, Diamond, Galaxy, Secret, Celestial, etc.
                local allRarities = {
                    "Normal", "Uncommon", "Rare", "Epic", "SmallEpic", 
                    "Legendary", "Mythic", "Celestial", "Galaxy", 
                    "Secret", "Golden", "Gold", "Diamond", "Divine"
                }
                while getgenv().AutoBuyAll do
                    for _, rarity in ipairs(allRarities) do
                        pcall(function()
                            local target = workspace.Map.WildBrainrots:FindFirstChild(rarity)
                            if target then ReplicatedStorage.Remotes.BuyBrainrot:FireServer(target) end
                        end)
                    end
                    task.wait() 
                end
            end)
        end
    end
})

MainTab:CreateDropdown({
    Name = "Select Specific Rarity",
    -- Synced options with the new list
    Options = {
        "Normal", "Uncommon", "Rare", "Epic", "SmallEpic", "Legendary", 
        "Mythic", "Celestial", "Galaxy", "Secret", "Golden", "Gold", 
        "Diamond", "Divine"
    },
    CurrentOption = {"Normal"},
    MultipleOptions = false,
    Flag = "DropSpecificRarity",
    Callback = function(Option)
        getgenv().SpecificRarity = Option[1]
    end,
})

MainTab:CreateToggle({
    Name = "Buy specific rarity brainrot",
    CurrentValue = false,
    Flag = "TglSpecificRarity",
    Callback = function(Value)
        getgenv().AutoBuySpecific = Value
        if Value then
            spawn(function()
                while getgenv().AutoBuySpecific do
                    pcall(function()
                        local target = workspace.Map.WildBrainrots:FindFirstChild(getgenv().SpecificRarity)
                        if target then ReplicatedStorage.Remotes.BuyBrainrot:FireServer(target) end
                    end)
                    task.wait()
                end
            end)
        end
    end
})

MainTab:CreateToggle({
    Name = "Auto-flip all rocks",
    CurrentValue = false,
    Flag = "TglAutoFlip",
    Callback = function(Value)
        getgenv().AutoFlipAll = Value
        if Value then
            spawn(function()
                -- Updated array with all requested stones
                local stones = {
                    "NormalStone", "UncommonStone", "RareStone", "EpicStone", "SmallEpicStone", 
                    "LegendaryStone", "MythicStone", "SmallMythicStone", "CelestialStone", 
                    "SmallCelestialStone", "SecretStone", "SmallSecretStone", "GalaxyStone", 
                    "GoldenStone", "DiamondStone", "DivineStone", "SmallDivineStone"
                }
                while getgenv().AutoFlipAll do
                    for _, stone in ipairs(stones) do
                        pcall(function()
                            local target = workspace.Map.StoneSpawnArea:FindFirstChild(stone)
                            if target then ReplicatedStorage.Remotes.Stones.FlipStone:FireServer(target) end
                        end)
                    end
                    task.wait()
                end
            end)
        end
    end
})

MainTab:CreateButton({
    Name = "Claim-group reward",
    Callback = function()
        pcall(function()
            ReplicatedStorage.Remotes.ClaimGroupReward:FireServer()
            Rayfield:Notify({Title = "Success", Content = "Claimed Group Reward!", Duration = 3})
        end)
    end
})

-- [[ Combat & Visuals Tab ]] --
CombatTab:CreateSection("ESP Settings")
CombatTab:CreateToggle({
    Name = "Enable Player ESP",
    CurrentValue = false,
    Flag = "TglESP",
    Callback = function(Value)
        getgenv().ESPEnabled = Value
        if not Value then
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("ESPHighlight") then
                    player.Character.ESPHighlight:Destroy()
                end
            end
        end
    end
})

CombatTab:CreateColorPicker({
    Name = "ESP Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "ColorESP",
    Callback = function(Value)
        getgenv().ESPColor = Value
    end
})

RunService.RenderStepped:Connect(function()
    if getgenv().ESPEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local highlight = player.Character:FindFirstChild("ESPHighlight")
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Name = "ESPHighlight"
                    highlight.Parent = player.Character
                end
                highlight.FillColor = getgenv().ESPColor
                highlight.OutlineColor = Color3.new(1, 1, 1)
                highlight.FillTransparency = 0.5
                highlight.OutlineTransparency = 0
            end
        end
    end
end)

CombatTab:CreateSection("Hitbox Customizer")
CombatTab:CreateToggle({
    Name = "Enable Hitbox Expander",
    CurrentValue = false,
    Flag = "TglHitbox",
    Callback = function(Value)
        getgenv().HitboxEnabled = Value
        if not Value then
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = player.Character.HumanoidRootPart
                    hrp.Size = Vector3.new(2, 2, 1)
                    hrp.Transparency = 1
                    hrp.Material = Enum.Material.Plastic
                end
            end
        end
    end
})

CombatTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {2, 50},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 2,
    Flag = "SldHitboxSize",
    Callback = function(Value)
        getgenv().HitboxSize = Value
    end
})

CombatTab:CreateColorPicker({
    Name = "Hitbox RGB Color",
    Color = Color3.fromRGB(0, 255, 0),
    Flag = "ColorHitbox",
    Callback = function(Value)
        getgenv().HitboxColor = Value
    end
})

RunService.RenderStepped:Connect(function()
    if getgenv().HitboxEnabled then
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character.HumanoidRootPart
                hrp.Size = Vector3.new(getgenv().HitboxSize, getgenv().HitboxSize, getgenv().HitboxSize)
                hrp.Transparency = 0.6
                hrp.Color = getgenv().HitboxColor
                hrp.Material = Enum.Material.Neon
                hrp.CanCollide = false
            end
        end
    end
end)

CombatTab:CreateSection("Auto Actions")
CombatTab:CreateToggle({
    Name = "Auto Clicker (Equipped Tool)",
    CurrentValue = false,
    Flag = "TglAutoClicker",
    Callback = function(Value)
        getgenv().AutoClicker = Value
        if Value then
            spawn(function()
                while getgenv().AutoClicker do
                    pcall(function()
                        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                            LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
                        end
                    end)
                    task.wait(0.01)
                end
            end)
        end
    end
})

-- [[ Gears Tab ]] --
GearsTab:CreateToggle({
    Name = "Buy all gears",
    CurrentValue = false,
    Flag = "TglBuyGears",
    Callback = function(Value)
        getgenv().AutoBuyGears = Value
        if Value then
            spawn(function()
                local allGears = {"SpeedCoil", "SuperCoil", "HyperCoil", "GoldenSlapper", "DiamondSlapper", "GalaxySlapper", "FryingPan"}
                while getgenv().AutoBuyGears do
                    for _, gear in ipairs(allGears) do
                        pcall(function() ReplicatedStorage.Remotes.PurchaseGear:InvokeServer(gear) end)
                    end
                    task.wait(1) 
                end
            end)
        end
    end
})

GearsTab:CreateDropdown({
    Name = "Select Gear to Equip",
    Options = {"SpeedCoil", "SuperCoil", "HyperCoil", "GoldenSlapper", "DiamondSlapper", "GalaxySlapper", "FryingPan"},
    CurrentOption = {"HyperCoil"},
    MultipleOptions = false,
    Flag = "DropSpecificGear",
    Callback = function(Option) getgenv().GearToEquip = Option[1] end,
})

GearsTab:CreateToggle({
    Name = "Equip a specific gear",
    CurrentValue = false,
    Flag = "TglEquipGear",
    Callback = function(Value)
        getgenv().AutoEquipGear = Value
        if Value then
            spawn(function()
                while getgenv().AutoEquipGear do
                    pcall(function() ReplicatedStorage.Remotes.ChangeEquip:FireServer(getgenv().GearToEquip) end)
                    task.wait(0.5)
                end
            end)
        end
    end
})

-- [[ Local Tab ]] --
LocalTab:CreateToggle({
    Name = "Bypass Speed Override",
    CurrentValue = false,
    Flag = "TglBypassSpeed",
    Callback = function(Value) getgenv().BypassSpeed = Value end
})

LocalTab:CreateSlider({
    Name = "Speed", Range = {16, 500}, Increment = 1, Suffix = "WalkSpeed", CurrentValue = 16, Flag = "SldWalkSpeed",
    Callback = function(Value)
        getgenv().WalkSpeedValue = Value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then LocalPlayer.Character.Humanoid.WalkSpeed = Value end
    end
})

LocalTab:CreateSlider({
    Name = "Jumpboost", Range = {50, 500}, Increment = 1, Suffix = "JumpPower", CurrentValue = 50, Flag = "SldJumpPower",
    Callback = function(Value)
        getgenv().JumpPowerValue = Value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.UseJumpPower = true
            LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    end
})

LocalTab:CreateToggle({ Name = "Infinite Jump", CurrentValue = false, Flag = "TglInfJump", Callback = function(Value) getgenv().InfJump = Value end })
game:GetService("UserInputService").JumpRequest:Connect(function()
    if getgenv().InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState("Jumping")
    end
end)

LocalTab:CreateToggle({ Name = "Noclip", CurrentValue = false, Flag = "TglNoclip", Callback = function(Value) getgenv().Noclip = Value end })
RunService.Stepped:Connect(function()
    if getgenv().Noclip and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- [[ Other Scripts Tab ]] --
OtherTab:CreateButton({ Name = "Infinite Yield", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end })
OtherTab:CreateButton({ Name = "Nameless Admin", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))() end })
OtherTab:CreateButton({ Name = "CMD-X", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))() end })

-- [[ Settings Tab ]] --
SettingsTab:CreateButton({
    Name = "Anti-AFK (Prevent Idle Disconnect)",
    Callback = function()
        LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
        Rayfield:Notify({Title = "Anti-AFK", Content = "Anti-AFK is now active. You will not be disconnected for idling.", Duration = 4})
    end
})

SettingsTab:CreateButton({
    Name = "Server hop",
    Callback = function()
        local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        for _, server in pairs(servers.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, LocalPlayer)
                break
            end
        end
    end
})
SettingsTab:CreateButton({ Name = "Rejoin server", Callback = function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end })

local uptimeLabel = SettingsTab:CreateLabel("Server Uptime: Calculating...")
spawn(function()
    while task.wait(1) do
        local seconds = math.floor(workspace.DistributedGameTime)
        local hours = math.floor(seconds / 3600)
        local mins = math.floor((seconds % 3600) / 60)
        local secs = seconds % 60
        uptimeLabel:Set("Server Uptime: " .. string.format("%02d:%02d:%02d", hours, mins, secs))
    end
end)

SettingsTab:CreateButton({
    Name = "Find richest player in the server",
    Callback = function()
        local richestPlayer = nil
        local maxWealth = -1
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                local wealth = 0
                if plr:FindFirstChild("leaderstats") and plr.leaderstats:FindFirstChild("Cash") then wealth = plr.leaderstats.Cash.Value end
                if wealth > maxWealth then
                    maxWealth = wealth
                    richestPlayer = plr
                end
            end
        end
        if richestPlayer then Rayfield:Notify({Title = "Richest Player Found", Content = richestPlayer.Name .. " is the richest!", Duration = 5})
        else Rayfield:Notify({Title = "Error", Content = "Could not determine richest player.", Duration = 3}) end
    end
})

-- [[ Anti-lag Tab ]] --
AntiLagTab:CreateButton({
    Name = "Boost FPS & Reduce Lag",
    Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic; v.CastShadow = false
            elseif v:IsA("Decal") or v:IsA("Texture") then v:Destroy()
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Enabled = false end
        end
        settings().Network.IncomingReplicationLag = 0
        game:GetService("Lighting").GlobalShadows = false
        game:GetService("Lighting").FogEnd = 9e9
        Rayfield:Notify({Title = "Optimization Complete", Content = "Textures removed, shadows disabled, and network optimized.", Duration = 4})
    end
})

Rayfield:LoadConfiguration()
