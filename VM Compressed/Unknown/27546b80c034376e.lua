-- 🔧 DWS Script Yap (FULL FINAL)
-- Author: Naria-chan (merged & optimized)
-- Notes: Does NOT auto-open DevConsole. Use Settings -> Open Dev Console to show.

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")

-- Safely get Remotes (pcall in case structure differs)
local Remotes
local AbilityUseRemote, MorphEvent
pcall(function()
    Remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if Remotes then
        AbilityUseRemote = Remotes:FindFirstChild("AbilityUse")
        MorphEvent = Remotes:FindFirstChild("MorphEvent")
    end
end)

-- Helper: get current player name list (keeps dropdowns updated)
local function GetPlayerNames()
    local t = {}
    for _, p in ipairs(Players:GetPlayers()) do
        table.insert(t, p.Name)
    end
    return t
end

-- =====================
-- WINDOW
-- =====================
local Window = Rayfield:CreateWindow({
    Name = "DWS Script Yap",
    LoadingTitle = "Loading shit eat it...",
    LoadingSubtitle = "Idk what happens-",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

-- =====================
-- MAIN TAB
-- =====================
local MainTab = Window:CreateTab("Main", nil)
MainTab:CreateSection("Discord / Quick links")
MainTab:CreateButton({
    Name = "Copy Discord server Link (Unfinished)",
    Callback = function()
        pcall(function() setclipboard("https://discord.gg/JKEe2KK6S") end)
        Rayfield:Notify({Title="Copied!", Content="Discord link copied to clipboard", Duration=3})
    end
})
MainTab:CreateButton({
    Name = "Load External Script",
    Callback = function()
        pcall(function() loadstring(game:HttpGet("https://pastebin.com/raw/BnHBM16q"))() end)
    end
})

-- =====================
-- LOCAL PLAYER TAB
-- =====================
local LocalTab = Window:CreateTab("Local Player", nil)
LocalTab:CreateSection("Utilities")
local AntiAdguiToggle = LocalTab:CreateToggle({
    Name = "Anti Pop-up",
    CurrentValue = true,
    Callback = function(value)
        if value then
            task.spawn(function()
                while AntiAdguiToggle.CurrentValue do
                    for _, gui in ipairs(LocalPlayer.PlayerGui:GetChildren()) do
                        if type(gui.Name) == "string" and gui.Name:match("Adgui") then
                            pcall(function() gui:Destroy() end)
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end
})

-- =====================
-- MAP TAB
-- =====================
local MapTab = Window:CreateTab("Map", nil)
MapTab:CreateSection("Map Utilities")
MapTab:CreateButton({
    Name = "Full Bright",
    Callback = function()
        local lighting = game:GetService("Lighting")
        lighting.Brightness = 5
        lighting.Ambient = Color3.fromRGB(255,255,255)
        lighting.OutdoorAmbient = Color3.fromRGB(255,255,255)
        lighting.ClockTime = 12
        lighting.FogEnd = 1e6
        lighting.GlobalShadows = false
        for _, v in ipairs(lighting:GetChildren()) do
            if v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") then
                pcall(function() v.Enabled = false end)
            end
        end
        Rayfield:Notify({Title="Full Bright", Content="Applied full bright settings.", Duration=3})
    end
})
MapTab:CreateButton({
    Name = "Anti Lag",
    Callback = function()
        local count = 0
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
                pcall(function() v.Enabled = false end)
                count = count + 1
            elseif v:IsA("BasePart") then
                pcall(function()
                    v.Material = Enum.Material.SmoothPlastic
                    v.Reflectance = 0
                end)
            elseif v:IsA("Texture") or v:IsA("Decal") then
                pcall(function() v:Destroy() end)
                count = count + 1
            end
        end
        pcall(function() game.Lighting.GlobalShadows = false end)
        pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
        Rayfield:Notify({Title="Anti Lag", Content="Disabled "..count.." visual effects!", Duration=4})
    end
})

-- =====================
-- AUTOMATIC TAB (Auto Ability + Auto Pickup)
-- =====================
local AutoTab = Window:CreateTab("Automatic", nil)
AutoTab:CreateSection("Auto Controls")

-- Auto Ability
local AutoState = {Mode="Self", SelectedPlayer=nil, Running=false, Speed=1}
local AutoPlayerDropdown = AutoTab:CreateDropdown({
    Name = "Select Player",
    Options = GetPlayerNames(),
    CurrentOption = {},
    MultipleOptions = false,
    Callback = function(opt)
        if opt and opt[1] then
            AutoState.SelectedPlayer = Players:FindFirstChild(opt[1])
        else
            AutoState.SelectedPlayer = nil
        end
    end
})
AutoTab:CreateButton({Name="Refresh Player List", Callback=function() AutoPlayerDropdown:Set(GetPlayerNames()) end})
AutoTab:CreateDropdown({
    Name="Mode",
    Options={"Self","All","ExcludeSelf","Selected"},
    CurrentOption={"Self"},
    MultipleOptions=false,
    Callback=function(opt) AutoState.Mode = opt[1] end
})
AutoTab:CreateInput({
    Name="Set Ability Speed (seconds)",
    PlaceholderText="1",
    RemoveTextAfterFocusLost=false,
    Callback=function(val)
        local n = tonumber(val)
        if n and n > 0 then AutoState.Speed = n end
    end
})

-- Auto Pickup
local AutoPickup = {Running=false, Distance=12}
local pickupCount = 0
local debugMode = true

local function debugPrint(...)
    if not debugMode then return end
    local args = {...}
    local s = "[AutoDebug] " .. table.concat(args, " ")
    pcall(function() print(s) end)
end

local function tryActivatePrompt(prompt)
    local ok, res = pcall(function()
        if typeof(fireproximityprompt) == "function" then
            fireproximityprompt(prompt)
            return true
        end
        if prompt.InputHoldBegin then
            prompt:InputHoldBegin()
            task.wait(0.12)
            prompt:InputHoldEnd()
            return true
        end
        if prompt.TriggerServer then
            prompt:TriggerServer()
            return true
        end
    end)
    return ok and res
end

local function tryActivateClick(detector)
    local ok, res = pcall(function()
        if typeof(fireclickdetector) == "function" then
            fireclickdetector(detector)
            return true
        end
        if detector.Parent and detector.Parent:FindFirstChildOfClass("ClickDetector") then
            fireclickdetector(detector.Parent:FindFirstChildOfClass("ClickDetector"))
            return true
        end
    end)
    return ok and res
end

local function findPickupItems()
    local out = {}
    local currentMap = Workspace:FindFirstChild("CurrentMap")
    if currentMap and currentMap:FindFirstChild("Items") then
        for _, v in ipairs(currentMap.Items:GetChildren()) do table.insert(out, v) end
    end
    local bonbons = Workspace:FindFirstChild("BonBons") or Workspace:FindFirstChild("Bonbons")
    if bonbons then for _, v in ipairs(bonbons:GetChildren()) do table.insert(out, v) end end
    return out
end

AutoTab:CreateToggle({
    Name="Auto Ability",
    CurrentValue=false,
    Callback=function(state)
        AutoState.Running = state
        if state then
            task.spawn(function()
                while AutoState.Running do
                    if AbilityUseRemote then
                        if AutoState.Mode=="Self" and LocalPlayer.Character then
                            pcall(function() AbilityUseRemote:FireServer(LocalPlayer.Character) end)
                            debugPrint("Used Ability on Self")
                        elseif AutoState.Mode=="All" then
                            for _,p in ipairs(Players:GetPlayers()) do
                                if p.Character then
                                    pcall(function() AbilityUseRemote:FireServer(p.Character) end)
                                    debugPrint("Used Ability on", p.Name)
                                end
                            end
                        elseif AutoState.Mode=="ExcludeSelf" then
                            for _,p in ipairs(Players:GetPlayers()) do
                                if p~=LocalPlayer and p.Character then
                                    pcall(function() AbilityUseRemote:FireServer(p.Character) end)
                                    debugPrint("Used Ability on", p.Name)
                                end
                            end
                        elseif AutoState.Mode=="Selected" and AutoState.SelectedPlayer and AutoState.SelectedPlayer.Character then
                            pcall(function() AbilityUseRemote:FireServer(AutoState.SelectedPlayer.Character) end)
                            debugPrint("Used Ability on Selected Player", AutoState.SelectedPlayer.Name)
                        end
                    else
                        debugPrint("AbilityUse remote not found.")
                    end
                    task.wait(AutoState.Speed)
                end
            end)
        end
    end
})

AutoTab:CreateToggle({
    Name="Auto Pickup",
    CurrentValue=false,
    Callback=function(state)
        AutoPickup.Running = state
        if state then
            pickupCount = 0
            task.spawn(function()
                while not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) do task.wait(0.2) end
                debugPrint("AutoPickup started")
                while AutoPickup.Running do
                    local hrp = LocalPlayer.Character.HumanoidRootPart.Position
                    for _, item in ipairs(findPickupItems()) do
                        if item and item.Parent then
                            local nameLower = tostring(item.Name):lower()
                            if not (nameLower:match("bot") or nameLower:match("machine")) then
                                for _, desc in ipairs(item:GetDescendants()) do
                                    if desc:IsA("ProximityPrompt") and (hrp - (desc.Parent.Position)).Magnitude <= AutoPickup.Distance then
                                        if tryActivatePrompt(desc) then
                                            pickupCount = pickupCount + 1
                                            debugPrint("Picked up", item.Name)
                                            task.wait(0.12)
                                        end
                                    elseif desc:IsA("ClickDetector") and (hrp - (desc.Parent.Position)).Magnitude <= AutoPickup.Distance then
                                        if tryActivateClick(desc) then
                                            pickupCount = pickupCount + 1
                                            debugPrint("Picked up", item.Name)
                                            task.wait(0.12)
                                        end
                                    end
                                end
                            end
                        end
                    end
                    task.wait(0.15)
                end
                debugPrint("AutoPickup stopped. totalPicked:", pickupCount)
                if debugMode then Rayfield:Notify({Title="AutoPickup", Content="Stopped. Picked: "..pickupCount, Duration=4}) end
            end)
        end
    end
})

AutoTab:CreateSlider({
    Name="Pickup Distance",
    Range={5,30},
    Increment=1,
    CurrentValue=AutoPickup.Distance,
    Callback=function(val) AutoPickup.Distance = val end
})
AutoTab:CreateToggle({
    Name="Debug Mode",
    CurrentValue=debugMode,
    Callback=function(v) debugMode = v end
})

-- =====================
-- TELEPORT TAB
-- =====================
local TeleTab = Window:CreateTab("Teleport", nil)
TeleTab:CreateSection("Teleport Controls")
local TeleportTarget = nil
local TelePlayerDropdown = TeleTab:CreateDropdown({
    Name="Select Player",
    Options=GetPlayerNames(),
    CurrentOption={},
    MultipleOptions=false,
    Callback=function(opt) TeleportTarget = Players:FindFirstChild(opt[1]) end
})
TeleTab:CreateButton({Name="Refresh Players", Callback=function() TelePlayerDropdown:Set(GetPlayerNames()) end})
TeleTab:CreateButton({
    Name="Teleport to Player",
    Callback=function()
        if TeleportTarget and TeleportTarget.Character and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                LocalPlayer.Character.HumanoidRootPart.CFrame = TeleportTarget.Character.HumanoidRootPart.CFrame
            end)
        end
    end
})
TeleTab:CreateButton({
    Name="Teleport Random Player",
    Callback=function()
        local players = Players:GetPlayers()
        if #players > 0 and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local target = players[math.random(1,#players)]
            if target.Character then
                pcall(function()
                    LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
                end)
            end
        end
    end
})

-- =====================
-- SETTINGS TAB (NEW)
-- =====================
local SettingsTab = Window:CreateTab("Settings", nil)
SettingsTab:CreateSection("General Settings")

SettingsTab:CreateButton({
    Name = "Toggle UI (K)",
    Callback = function()
        pcall(function() Rayfield:ToggleUI() end)
    end
})
SettingsTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        pcall(function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)
    end
})
SettingsTab:CreateButton({
    Name = "Server Hop",
    Callback = function()
        task.spawn(function()
            local ok, body = pcall(function()
                return game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100")
            end)
            if not ok or not body then
                Rayfield:Notify({Title="Server Hop", Content="Failed to fetch servers.", Duration=4})
                return
            end
            local data = nil
            pcall(function() data = HttpService:JSONDecode(body) end)
            if not data or not data.data then
                Rayfield:Notify({Title="Server Hop", Content="No server data found.", Duration=4})
                return
            end
            local servers = {}
            for _, v in ipairs(data.data) do
                if v.playing and v.maxPlayers and v.playing < v.maxPlayers and v.id then
                    table.insert(servers, v.id)
                end
            end
            if #servers > 0 then
                local targetId = servers[math.random(1,#servers)]
                pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, targetId, LocalPlayer) end)
            else
                Rayfield:Notify({Title="Server Hop", Content="No available servers found!", Duration=4})
            end
        end)
    end
})
SettingsTab:CreateButton({
    Name = "Destroy Script UI",
    Callback = function()
        pcall(function() Rayfield:Destroy() end)
    end
})
SettingsTab:CreateButton({
    Name = "Open Dev Console",
    Callback = function()
        pcall(function() StarterGui:SetCore("DevConsoleVisible", true) end)
    end
})

-- =====================
-- RANDOM NOTIFICATIONS (KEPT)
-- =====================
task.spawn(function()
    local msgs = {
        "Poppy: Do you know astro hate make u have a nice sleep ",
        "Dandy: ILL GIVE YOU A KICK IT YOU USE ME ....!!",
        "Shelly: Careful Using too many Ability need make you get ban sooooo Careful",
        "Vee: Hey don't use twisted vee ok",
        "Sprout: ... You will make Everybody lag",
        "Boxten: you know my script in Dandy's world"
    }
    while true do
        task.wait(math.random(1,60))
        local msg = msgs[math.random(1,#msgs)]
        if math.random(1,10) == 1 then
            msg = "Astro: Now is "..os.date("%H:%M:%S").." Are you still playing? Uhm"
        end
        pcall(function() Rayfield:Notify({Title="Random Msg", Content=msg, Duration=5}) end)
    end
end)

-- Final notify
Rayfield:Notify({Title="Naria_hiii", Content="Made by Nariaisriel ", Duration=5})