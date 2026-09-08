local stored_fonts = {}
gui_config = {
    Color = Color3.fromRGB(255, 255, 255),
    Keybind = Enum.KeyCode.Insert, -- for pc related only enum keys documentation: https://create.roblox.com/docs/reference/engine/enums/KeyCode
    Assets = false, -- set to true if you want custom background asset
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

local config = (getfenv().gui_config) or nil -- custom config or fully ignore this
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/nfpw/XXSCRIPT/refs/heads/main/Library/Module.lua"))()
local window = library:CreateWindow(config, gethui())
local window_name = library:SetWindowName("Ultimate Fighting Simulator | By MjContegazxc") -- title to use for gui


local tabs = {
    -- creates "main" tab
    main = window:CreateTab("Main"),
    game = window:CreateTab("Game"),
    settings = window:CreateTab("Settings")
}


local sections = {
  Main = tabs.main:CreateSection("Main"), 
Gamepass = tabs.main:CreateSection("Gamepases"),
Up = tabs.main:CreateSection("Stats"), 
Player = tabs.main:CreateSection("LocalPlayer"),
 Game = tabs.game:CreateSection("Game"),
Discord = tabs.game:CreateSection("Discord"),
}




local RunService = game:GetService("RunService")
local coinConnection
local gemConnection

sections.Main:CreateToggle("Inf Coin", false, function(state)
    if state then
        if coinConnection then
            coinConnection:Disconnect()
        end
        coinConnection = RunService.Heartbeat:Connect(function()
            local args = {[1] = "Sage"}
            game:GetService("ReplicatedStorage").YenGanho:FireServer(unpack(args))
        end)
        window:Notify("Inf Coin", "Enabled - Farming coins", 3)
    else
        if coinConnection then
            coinConnection:Disconnect()
            coinConnection = nil
        end
        window:Notify("Inf Coin", "Disabled", 3)
    end
end)

sections.Main:CreateToggle("Inf Gem", false, function(state)
    if state then
        local ClassModule = require(game:GetService("ReplicatedStorage").Modules.ClassModule)
        
        ClassModule.Classes.Fighter.YenPerMin = 9000000000
        ClassModule.Classes.Fighter.Damage = 9999
        ClassModule.Classes.Fighter.YenIncrease = 9999
        
        if gemConnection then
            gemConnection:Disconnect()
        end
        gemConnection = RunService.Heartbeat:Connect(function()
            local args = {[1] = "Fighter"}
            game:GetService("ReplicatedStorage").YenGanho:FireServer(unpack(args))
        end)
        window:Notify("Inf Gem", "Enabled - Farming gems", 3)
    else
        if gemConnection then
            gemConnection:Disconnect()
            gemConnection = nil
        end
        window:Notify("Inf Gem", "Disabled", 3)
    end
end)

sections.Main:CreateDivider()

-- Auto Abilities
local abilitiesList = {"Strength", "Durability", "Chakra", "Sword", "Agility", "Speed"}
local selectedAbilities = {"Strength"}
local autoAbilitiesConnection

-- Dropdown for selecting multiple abilities
sections.Main:CreateDropdown(
    "Choose Abilities",
    abilitiesList,
    function(selected)
        selectedAbilities = selected
        window:Notify("Auto Abilities", "Selected: " .. table.concat(selected, ", "), 3)
    end,
    {"Strength"},
    true -- Enable multiple selection
)

-- Toggle for auto abilities
sections.Main:CreateToggle("Infinite power abilities", false, function(state)
    if state then
        if autoAbilitiesConnection then
            autoAbilitiesConnection:Disconnect()
        end
        autoAbilitiesConnection = RunService.Heartbeat:Connect(function()
            for _, ability in pairs(selectedAbilities) do
                local args = {
                    [1] = ability,
                    [2] = 999999999
                }
                game:GetService("ReplicatedStorage").Abilities.EventSkills.Skills:FireServer(unpack(args))
            end
        end)
        window:Notify("Auto Abilities", "Auto using: " .. table.concat(selectedAbilities, ", "), 3)
    else
        if autoAbilitiesConnection then
            autoAbilitiesConnection:Disconnect()
            autoAbilitiesConnection = nil
        end
        window:Notify("Auto Abilities", "Stopped auto abilities", 3)
    end
end)


-- Auto Abilities with custom power amount
local abilitiesList = {"Strength", "Durability", "Chakra", "Sword", "Agility", "Speed"}
local powerAmount = 2147483648
local autoAbilitiesConnection

-- Textbox for power amount
sections.Main:CreateTextBox(
    "Power Amount",
    "Enter power amount...",
    true, -- numbers only
    function(value)
        if value and value ~= "" then
            powerAmount = tonumber(value)
            window:Notify("Power Amount", "Set to: " .. value, 3)
        end
    end
)

-- Toggle for auto all abilities
sections.Main:CreateToggle("Auto All Abilities", false, function(state)
    if state then
        if autoAbilitiesConnection then
            autoAbilitiesConnection:Disconnect()
        end
        autoAbilitiesConnection = RunService.Heartbeat:Connect(function()
            for _, ability in pairs(abilitiesList) do
                local args = {
                    [1] = ability,
                    [2] = powerAmount
                }
                game:GetService("ReplicatedStorage").Abilities.EventSkills.Skills:FireServer(unpack(args))
            end
        end)
        window:Notify("Auto Abilities", "Auto using ALL abilities with power: " .. powerAmount, 3)
    else
        if autoAbilitiesConnection then
            autoAbilitiesConnection:Disconnect()
            autoAbilitiesConnection = nil
        end
        window:Notify("Auto Abilities", "Stopped auto abilities", 3)
    end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local buyGamepassEvent = ReplicatedStorage:WaitForChild("bUYGAMEPAS")

local gamepassMap = {
    ["2xStrenght"] = "StrPass",
    ["2xDurability"] = "DrbPass", 
    ["2xChakra"] = "chkPass",
    ["2xSword"] = "SwrPass",
    ["2xSpeed"] = "SpdPass",
    ["2xAgility"] = "JmpPass",
    ["NoLimit"] = "NoLimPass",
    ["AutoClick"] = "AutC",
    ["Vip"] = "VipPass",
    ["FlightBoost"] = "FlyPass",
    ["HidePower"] = "EsPwPass",
    ["2xChikara"] = "ChikPass",
    ["2xYen"] = "YenPass"
}

sections.Gamepass:CreateToggle("Unlock Gamepasses", false, function(state)
    if state then
        for gamepassName, passId in pairs(gamepassMap) do
            buyGamepassEvent:FireServer(passId, true)
        end
        window:Notify("Gamepasses", "All gamepasses unlocked", 3)
    else
        window:Notify("Gamepasses", "Gamepass unlock toggled off", 3)
    end
end)
sections.Gamepass:CreateLabel("~Unlock Gamepases~\n-Fast Auto Clicker\nAuto Click\nAnd More...", true)

-- Auto Upgrade Stats
local statsList = {"Strength", "Durability", "Chakra", "Sword", "Agility", "Speed"}
local selectedStats = {"Strength"}
local autoUpgradeConnection
local autoUpgradeAllConnection

-- Dropdown for selecting multiple stats
sections.Up:CreateDropdown(
    "Choose Stats",
    statsList,
    function(selected)
        selectedStats = selected
        window:Notify("Auto Upgrade", "Selected: " .. table.concat(selected, ", "), 3)
    end,
    {"Strength"},
    true -- Enable multiple selection
)

-- Toggle for auto upgrading selected stats
sections.Up:CreateToggle("Auto Upgrade Selected", false, function(state)
    if state then
        if autoUpgradeConnection then
            autoUpgradeConnection:Disconnect()
        end
        autoUpgradeConnection = RunService.Heartbeat:Connect(function()
            for _, stat in pairs(selectedStats) do
                local args = {[1] = stat}
                game:GetService("ReplicatedStorage").Events.UpgradeStats:FireServer(unpack(args))
            end
        end)
        window:Notify("Auto Upgrade", "Auto upgrading: " .. table.concat(selectedStats, ", "), 3)
    else
        if autoUpgradeConnection then
            autoUpgradeConnection:Disconnect()
            autoUpgradeConnection = nil
        end
        window:Notify("Auto Upgrade", "Stopped auto upgrade", 3)
    end
end)

-- Toggle for auto upgrading all stats
sections.Up:CreateToggle("Auto Upgrade All Stats", false, function(state)
    if state then
        if autoUpgradeAllConnection then
            autoUpgradeAllConnection:Disconnect()
        end
        autoUpgradeAllConnection = RunService.Heartbeat:Connect(function()
            for _, stat in pairs(statsList) do
                local args = {[1] = stat}
                game:GetService("ReplicatedStorage").Events.UpgradeStats:FireServer(unpack(args))
            end
        end)
        window:Notify("Auto Upgrade", "Auto upgrading ALL stats", 3)
    else
        if autoUpgradeAllConnection then
            autoUpgradeAllConnection:Disconnect()
            autoUpgradeAllConnection = nil
        end
        window:Notify("Auto Upgrade", "Stopped auto upgrade all", 3)
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
    setclipboard("https://discord.gg/YU5crU9zV")
    window:Notify("Discord", "Link copied to clipboard!\nPaste in your browser to join: discord.gg/YU5crU9zV", 7)
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