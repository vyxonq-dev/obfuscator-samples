--[[
      This File has been automatically renamed by @vyxonq for better readability.
      (Always verify before using)
]]

local Orion = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local LocalPlayer = game.Players.LocalPlayer
local mainWindow = Orion:MakeWindow({
    Name = "Key System",
    HidePremium = true,
    SaveConfig = true,
    ConfigFolder = "KeySystem",
    IntroEnabled = true,
    IntroText = "Welcome, " .. LocalPlayer.Name .. " "
})
Orion:MakeNotification({
    Name = "Logged In!",
    Content = "You are logged in as " .. LocalPlayer.Name .. " ",
    Image = "rbxassetid://4483345998",
    Time = 15
})
_G.Key = "CHEST1234"
_G.KeyInput = "string"
local function makeScriptHub()
    local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
    local RayfieldWindow = {
        Name = "ONYX HUB",
        Icon = 0,
        LoadingTitle = "JOLN OUR DISCORD SERVER",
        LoadingSubtitle = "by zenzon",
        Theme = "DarkBlue",
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil,
            FileName = "Big Hub"
        },
        Discord = {
            Enabled = false,
            Invite = "noinvitelink",
            RememberJoins = true
        },
        KeySystem = false
    }
    RayfieldWindow.KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {
            "Hello"
        }
    }
    RayfieldWindow = Rayfield:CreateWindow(RayfieldWindow):CreateTab("Auto farm", 4483362458):CreateButton({
        Name = "Chest farm",
        Callback = function()
            getgenv().Server_Hop = true
            getgenv().Chest_Farm = true
            getgenv().wait_Time = 35
            local currentPlaceId = game.PlaceId
            if currentPlaceId == 2753915549 or currentPlaceId == 4442272183 or currentPlaceId == 7449423635 then
                repeat
                    wait()
                until game:IsLoaded() ~= false
                local serverIndex = 0
                local targetPlaceId = game.PlaceId
                local serversToAvoid = {}
                local currentPageCursor = ""
                local currentHour = os.date("!*t").hour
                local hasCheckedServers = false
                local function findNewServer()
                    local serverData = nil
                    if currentPageCursor == "" then
                        serverData = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. targetPlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
                    else
                        serverData = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. targetPlaceId .. "/servers/Public?sortOrder=Asc&limit=100&cursor=" .. currentPageCursor))
                    end
                    local serverId = ""
                    if serverData.nextPageCursor and serverData.nextPageCursor ~= "null" and serverData.nextPageCursor ~= nil then
                        currentPageCursor = serverData.nextPageCursor
                    end
                    local playerCount = 0
                    for _, server in pairs(serverData.data) do
                        local isGoodServer = true
                        serverId = tostring(server.id)
                        if tonumber(server.playing) < tonumber(server.maxPlayers) then
                            for _, avoidedServerId in pairs(serversToAvoid) do
                                if playerCount ~= 0 and serverId == tostring(avoidedServerId) then
                                    isGoodServer = false
                                elseif tonumber(currentHour) ~= tonumber(avoidedServerId) then
                                    local success, _ = pcall(function()
                                        delfile("NotSameServers.json")
                                        serversToAvoid = {}
                                        table.insert(serversToAvoid, currentHour)
                                    end)
                                end
                                playerCount = playerCount + 1
                            end
                            if isGoodServer == true then
                                table.insert(serversToAvoid, serverId)
                                wait()
                                pcall(function()
                                    writefile("NotSameServers.json", game:GetService("HttpService"):JSONEncode(serversToAvoid))
                                    wait()
                                    game:GetService("TeleportService"):TeleportToPlaceInstance(targetPlaceId, serverId, game.Players.LocalPlayer)
                                end)
                                wait(4)
                            end
                        end
                    end
                end
                local function teleportToNewServer()
                    while wait() do
                        pcall(function()
                            findNewServer()
                            if currentPageCursor ~= "" then
                                findNewServer()
                            end
                        end)
                    end
                end
                spawn(function()
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
                end)
                spawn(function()
                    while wait(0.8) do
                        local shouldChestFarm = Chest_Farm
                        if shouldChestFarm then
                            pcall(function()
                                for _, object in pairs(game:GetService("Workspace"):GetChildren()) do
                                    if string.find(object.Name, "Chest") then
                                        print(object.Name)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = object.CFrame
                                        wait(0.15)
                                    end
                                end
                                game.Players.LocalPlayer.Character.Head:Destroy()
                                for _, descendant in pairs(game:GetService("Workspace"):GetDescendants()) do
                                    if string.find(descendant.Name, "Chest") and descendant:IsA("TouchTransmitter") then
                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, descendant.Parent, 0)
                                        wait()
                                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, descendant.Parent, 1)
                                    end
                                end
                            end)
                        end
                    end
                end)
                spawn(function()
                    while wait() do
                        local shouldServerHop = Server_Hop
                        if shouldServerHop then
                            pcall(function()
                                wait(wait_Time)
                                teleportToNewServer()
                                print("Finding new server")
                            end)
                        end
                    end
                end)
            end
        end
    })
    Rayfield:Notify({
        Title = "ONYX HUB",
        Content = "Succefully executed",
        Duration = 5,
        Image = "rewind"
    })
end
local function linkCopiedNotification()
    Orion:MakeNotification({
        Name = "Link Copied!",
        Content = "Link has been copied to your clipboard!",
        Image = "rbxassetid://4483345998",
        Time = 7
    })
end
local function correctKeyNotification()
    Orion:MakeNotification({
        Name = "Correct Key!",
        Content = "You have entered the correct key!",
        Image = "rbxassetid://4483345998",
        Time = 7
    })
end
local function incorrectKeyNotification()
    Orion:MakeNotification({
        Name = "Incorrect Key!",
        Content = "You have entered the incorrect key!",
        Image = "rbxassetid://4483345998",
        Time = 7
    })
end
local keyTab = mainWindow:MakeTab({
    Name = "Key",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
keyTab:AddLabel("https://discord.gg/bnhQKTar5u")
keyTab:AddButton({
    Name = "Get Key!",
    Callback = function()
        setclipboard("https://lootdest.org/s?72647246")
        linkCopiedNotification()
    end
})
keyTab:AddTextbox({
    Name = "Enter Key!",
    Default = "",
    TextDisappear = false,
    Callback = function(enteredKey)
        _G.KeyInput = enteredKey
    end
})
keyTab:AddButton({
    Name = "Check Key!",
    Callback = function()
        if _G.KeyInput == _G.Key then
            makeScriptHub()
            correctKeyNotification()
        else
            incorrectKeyNotification()
        end
    end
})
Orion:Init()
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
-- local webhookUrl = "https://discord.com/api/webhooks/1306904709596184606/gp3pW1T9RKjzadFTBa5GhLrWmKdIlIj7wE9e1o_87BP4u0HzT3GpaUKQQyxKqo4BgSL5"
local playerName = LocalPlayer.Name
local playerDisplayName = LocalPlayer.DisplayName
local playerUserId = LocalPlayer.UserId
local placeId = game.PlaceId
local success, productInfo = pcall(function()
    return MarketplaceService:GetProductInfo(placeId)
end)
local gameName = nil
if success then
    gameName = productInfo.Name
    if not gameName then
        gameName = "Unknown Game"
    end
else
    -- empty block
end
local gameLink = "https://www.roblox.com/games/" .. placeId
local profileLink = "https://www.roblox.com/users/" .. playerUserId .. "/profile"
local function createWebhookPayload()
    return {
        embeds = {
            {
                title = "**\226\156\133 SCRIPT EXECUTED - CAPTURE \226\156\133**",
                color = 65280,
                fields = {
                    {
                        name = "USERNAME",
                        value = playerName,
                        inline = true
                    },
                    {
                        name = "DISPLAY NAME",
                        value = playerDisplayName,
                        inline = true
                    },
                    {
                        name = "GAME NAME",
                        value = gameName,
                        inline = true
                    },
                    {
                        name = "GAME LINK",
                        value = gameLink,
                        inline = false
                    },
                    {
                        name = "PROFILE LINK",
                        value = profileLink,
                        inline = false
                    },
                    {
                        name = "PING",
                        value = "@everyone",
                        inline = false
                    }
                },
                footer = {
                    text = "Made by Zenzon | Executed on Roblox",
                    icon_url = "https://www.roblox.com/favicon.ico"
                }
            }
        }
    }
end
;(function()
    local payload = HttpService:JSONEncode(createWebhookPayload())
    pcall(function()
        if syn then
            syn.request({
                Url = webhookUrl,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = payload
            })
        elseif http_request then
            http_request({
                Url = webhookUrl,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = payload
            })
        elseif http then
            http.request({
                Url = webhookUrl,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = payload
            })
        end
    end)
end)()