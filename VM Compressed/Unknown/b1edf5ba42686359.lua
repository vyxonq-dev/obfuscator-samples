-- Vortex Live Control — auto-generated for tenant PYJAH5
local HttpService       = game:GetService("HttpService")
local Players           = game:GetService("Players")
local StarterGui        = game:GetService("StarterGui")
local TeleportService   = game:GetService("TeleportService")
local TextChatService   = game:GetService("TextChatService")
local MarketplaceService = game:GetService("MarketplaceService")

local CommandLib = loadstring(game:HttpGet("https://api.getvortex.vip/scripts/CommandLib"))()
local player = Players.LocalPlayer
local TENANT_ID = "PYJAH5"

CommandLib:RegisterCommand("kick", function(reason)
    player:Kick(tostring(reason ~= "" and reason or "You have been kicked"))
end)

CommandLib:RegisterCommand("notify", function(content)
    StarterGui:SetCore("SendNotification", {
        Title = "Notification",
        Text = tostring(content),
        Duration = 20,
        Icon = "rbxassetid://117794564807512",
    })
end)

CommandLib:RegisterCommand("freeze", function()
    local ok, Controls = pcall(function()
        return require(player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
    end)
    if ok then Controls:Disable() end
end)

CommandLib:RegisterCommand("unfreeze", function()
    local ok, Controls = pcall(function()
        return require(player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
    end)
    if ok then Controls:Enable() end
end)

CommandLib:RegisterCommand("say", function(message)
    for _, channel in ipairs(TextChatService.Channels:GetDescendants()) do
        if channel:IsA("TextChannel") then
            pcall(function() channel:SendAsync(tostring(message)) end)
        end
    end
end)

CommandLib:RegisterCommand("sethealth", function(args)
    local amount = tonumber(args)
    if not amount then return end
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.Health = amount end
end)

CommandLib:RegisterCommand("teleport", function(args)
    pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, tostring(args), player) end)
end)

CommandLib:RegisterCommand("rejoin", function()
    pcall(function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player) end)
end)

CommandLib:RegisterCommand("rejoins", function()
    pcall(function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
        queue_on_teleport('loadstring(game:HttpGet("https://api.getvortex.vip/scripts/VortexMain"))()')
    end)
end)

local WS = WebSocket
local conn, connecting, retries = nil, false, 0
local MAX_RETRIES = 3
local DELAY = 2

local function getGameName()
    local ok, name = pcall(function() return MarketplaceService:GetProductInfo(game.PlaceId).Name end)
    return ok and name or "Unknown"
end

local function connect()
    if connecting or (conn and conn.Connected) then return end
    connecting = true
    local ok, ws = pcall(WS.connect, "wss://api.getvortex.vip/ws/t")
    if not ok or not ws then
        connecting = false
        retries += 1
        if retries <= MAX_RETRIES then task.wait(DELAY); connect() end
        return
    end
    conn, retries, connecting = ws, 0, false
    ws:Send(HttpService:JSONEncode({
        type     = "init",
        tenantId = TENANT_ID,
        username = player.Name,
        userId   = player.UserId,
        jobId    = game.JobId,
        placeId  = game.PlaceId,
        gameName = getGameName(),
    }))
    conn.OnMessage:Connect(function(msg) CommandLib:HandleMessage(msg) end)
    conn.OnClose:Connect(function()
        if not conn then return end
        conn = nil
        retries += 1
        if retries <= MAX_RETRIES then task.wait(DELAY); connect() end
    end)
end

connect()
