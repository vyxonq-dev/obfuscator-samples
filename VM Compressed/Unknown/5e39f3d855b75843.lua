--[[
Credits not needed u can remove :)
Made by ownersalt2_theman
]]

local cloneref = cloneref or function(o) return o end
COREGUI = cloneref(game:GetService("CoreGui"))

if not game:IsLoaded() then
    local notLoaded = Instance.new("Message")
    notLoaded.Parent = COREGUI
    notLoaded.Text = "Orangutag | Fun Ruiner is waiting for the game to load"
    game.Loaded:Wait()
    notLoaded:Destroy()
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local plr = game.Players.LocalPlayer
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local Window = OrionLib:MakeWindow({Name = "Orangutag | Fun Ruiner", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local defaultSettings = {
    KeepOrangutag = true
}

local function loadSettings()
    local settingsFile = "OrangutagSettings.json"
    local success, data = pcall(function()
        return readfile(settingsFile)
    end)
    
    if success and data then
        local loadedSettings = HttpService:JSONDecode(data)
        return setmetatable(loadedSettings, {__index = defaultSettings})
    else
        return defaultSettings
    end
end

local function saveSettings(settings)
    local settingsFile = "OrangutagSettings.json"
    local success, err = pcall(function()
        writefile(settingsFile, HttpService:JSONEncode(settings))
    end)
    
    if not success then
        warn("Error saving settings:", err)
    end
end

local settings = loadSettings()

local function cf(cframe)
    if plr.Character and plr.Character.PrimaryPart then
        plr.Character:SetPrimaryPartCFrame(cframe)
    end
end


local Tab = Window:MakeTab({
    Name = "Auto",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local goConnections = {}
local sphereConnections = {}

Tab:AddToggle({
    Name = "Auto Tag",
    Default = false,
    Callback = function(Value)
        print("Toggle Value:", Value)

        if Value then
            OrionLib:MakeNotification({
                Name = "Auto Tag",
                Content = "Turned On.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })

            local function go()
                if not Value then return end
                if httprequest and #game.Players:GetPlayers() <= 5 then
                    local servers = {}
                    local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)})
                    local body = HttpService:JSONDecode(req.Body)

                    if body and body.data then
                        for i, v in next, body.data do
                            if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                                table.insert(servers, 1, v.id)
                            end
                        end
                    end

                    if #servers > 0 then
                        TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
                    else
                        return OrionLib:MakeNotification({
                            Name = "Server Hop [AUTO]",
                            Content = "Couldn't find a server.",
                            Image = "rbxassetid://4483345998",
                            Time = 2
                        })
                    end
                else
                    OrionLib:MakeNotification({
                        Name = "Server Hop [AUTO]",
                        Content = "Waiting to get 5 players left to server hop.",
                        Image = "rbxassetid://4483345998",
                        Time = 2
                    })
                end

                local pos = plr.Character.PrimaryPart.CFrame

                for i, v in pairs(game.Players:GetPlayers()) do
                    if v ~= plr then
                        if v.Character and v.Character.PrimaryPart then
                            cf(v.Character.PrimaryPart.CFrame)
                        end
                        task.wait()
                    end
                end
                
                if plr.Character and plr.Character.PrimaryPart then
                    plr.Character:SetPrimaryPartCFrame(pos)
                end
            end

            local playerAddedConnection = game.Players.PlayerAdded:Connect(function(plr)
                plr:GetPropertyChangedSignal("Team"):Connect(function()
                    go()
                end)
            end)

            table.insert(goConnections, playerAddedConnection)

            for i, v in pairs(game.Players:GetPlayers()) do
                local playerTeamChangeConnection = v:GetPropertyChangedSignal("Team"):Connect(function()
                    go()
                end)
                table.insert(goConnections, playerTeamChangeConnection)
            end

            go()

        else
            OrionLib:MakeNotification({
                Name = "Auto Tag",
                Content = "Turned Off.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })

            for _, connection in pairs(goConnections) do
                connection:Disconnect()
            end
            goConnections = {}
        end
    end
})

Tab:AddToggle({
    Name = "Keep Orangutag",
    Default = settings.KeepOrangutag,
    Callback = function(Value)
        settings.KeepOrangutag = Value
        saveSettings(settings)

        print("Keep Orangutag is now set to:", Value)

        if Value then
            OrionLib:MakeNotification({
                Name = "Keep Orangutag",
                Content = "Turned On.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        else
            OrionLib:MakeNotification({
                Name = "Keep Orangutag",
                Content = "Turned Off.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

Tab:AddToggle({
    Name = "Stay Safe [WIP]",
    Default = false,
    Callback = function(Value)
        getgenv().StaySafe = Value
        
        if not Value then
            for _, connection in pairs(sphereConnections) do
                if connection and typeof(connection) == "RBXScriptConnection" then
                    connection:Disconnect()
                end
            end
            sphereConnections = {}
            
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character then
                    local sphere = player.Character:FindFirstChild("Safe")
                    if sphere then
                        sphere:Destroy()
                    end
                end
            end
        end
    end
})

Tab:AddSlider({
    Name = "Safe Distance",
    Min = 0,
    Max = 30,
    Default = 15,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Studs",
    Callback = function(Value)
        if getgenv().StaySafe then
            for _, connection in pairs(sphereConnections) do
                if connection and typeof(connection) == "RBXScriptConnection" then
                    connection:Disconnect()
                end
            end
            sphereConnections = {}
            
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character then
                    local sphere = player.Character:FindFirstChild("Safe")
                    if sphere then
                        sphere:Destroy()
                    end
                end
            end
            
            local function makeSafeSphere(player)
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player ~= plr then
                    local existingSphere = player.Character:FindFirstChild("Safe")
                    if existingSphere then
                        existingSphere:Destroy()
                    end
                    
                    local sphere = Instance.new("Part")
                    sphere.Name = "Safe"
                    sphere.Size = Vector3.new(Value, Value, Value)
                    sphere.Shape = Enum.PartType.Ball
                    sphere.Color = player.TeamColor.Color
                    sphere.Transparency = 0.7
                    sphere.Anchored = false
                    sphere.CanCollide = true
                    sphere.Massless = true
                    sphere.Parent = player.Character
                    sphere.Position = player.Character.HumanoidRootPart.Position
                    
                    local weld = Instance.new("WeldConstraint")
                    weld.Name = "SafeWeld"
                    weld.Part0 = sphere
                    weld.Part1 = player.Character.HumanoidRootPart
                    weld.Parent = sphere
                    
                    local characterRemovedConnection = player.CharacterRemoving:Connect(function()
                        if sphere and sphere.Parent then
                            sphere:Destroy()
                        end
                    end)
                    
                    table.insert(sphereConnections, characterRemovedConnection)
                end
            end

            for _, player in pairs(game.Players:GetPlayers()) do
                makeSafeSphere(player)
            end

            local playerAddedConnection = game.Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function()
                    if getgenv().StaySafe then
                        makeSafeSphere(player)
                    end
                end)
            end)
            table.insert(sphereConnections, playerAddedConnection)

            local playerRemovingConnection = game.Players.PlayerRemoving:Connect(function(player)
                local sphere = player.Character and player.Character:FindFirstChild("Safe")
                if sphere then
                    sphere:Destroy()
                end
            end)
            table.insert(sphereConnections, playerRemovingConnection)
            
            for _, player in pairs(game.Players:GetPlayers()) do
                local characterAddedConnection = player.CharacterAdded:Connect(function()
                    if getgenv().StaySafe then
                        makeSafeSphere(player)
                    end
                end)
                table.insert(sphereConnections, characterAddedConnection)
            end
        end
    end
})

local Tab2 = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxasset://textures/AudioDiscovery/done.png",
    PremiumOnly = false
})

Tab2:AddParagraph("Scripter", "ownersalt2_theman [i didnt make OrionLib btw]")

local TeleportCheck = false
plr.OnTeleport:Connect(function(state)
    if queueteleport and (not TeleportCheck) and settings.KeepOrangutag then
        TeleportCheck = true
        queueteleport([[
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ownersalt2themandev/Scripts/refs/heads/main/Orangutag"))()
        ]])
    end
end)
