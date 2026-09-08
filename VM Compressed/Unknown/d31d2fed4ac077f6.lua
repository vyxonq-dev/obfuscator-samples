local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local function notify(msg, type)
    StarterGui:SetCore("SendNotification", {
        Title = "Lz Hub",
        Text = msg,
        Duration = 5,
    })
end
local GameMap = {
    -- 99 Nights
    [79546208627805]  = "99 Nights Lobby",
    [126509999114328] = "99 Nights",
    
    -- Hunting Season
    [108808025081246] = "Hunting Season",
    [120073741652089] = "Hunting Season",
    
    -- Fisch
    [131716211654599] = "Fisch",
    [16732694052]     = "Fisch",
    
    -- Forge
    [129009554587176] = "Forge",
    [76558904092080]  = "Forge",
    [131884594917121] = "Forge",
}

local detectedGame = GameMap[game.PlaceId]
local baseUrl = "https://raw.githubusercontent.com/YallSumLs/LzHubScript/refs/heads/main/"

if detectedGame == "99 Nights Lobby" then
    notify("⚠️ You are in the Lobby! Please join the main game.")
    return
elseif detectedGame == "99 Nights" then
    notify("✅ Loading 99 Nights Script...")
    loadstring(game:HttpGet(baseUrl .. "99Nights.luau"))()

elseif detectedGame == "Hunting Season" then
    notify("✅ Loading Hunting Season Script...")
    loadstring(game:HttpGet(baseUrl .. "HuntingSeason.luau"))()

elseif detectedGame == "Fisch" then
    notify("✅ Loading Fisch Script...")
    loadstring(game:HttpGet(baseUrl .. "Fisch.luau"))()

elseif detectedGame == "Forge" then
    notify("✅ Loading Forge Script...")
    loadstring(game:HttpGet(baseUrl .. "Forge.luau"))()

else
    notify("ℹ️ Game not supported. Loading Universal.")
    loadstring(game:HttpGet(baseUrl .. "Universal.Luau"))()
end
