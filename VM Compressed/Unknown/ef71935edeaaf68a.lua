-- Stop Skidding nothing to skid These File are Protected by MoonSecV3 So GetOut Nigga!
repeat task.wait() until game:IsLoaded()

local notif
local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/notiflib/main/main"))()
end)

if success then
    notif = result
else
    notif = {
        Notification = function(title, text, icon, style, duration)
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = title,
                Text = text,
                Duration = duration or 5
            })
        end
    }
end

local SUPPORTED_GAMES = {
    [137925884276740] = "Build a plane",
    [103754275310547] = "Hunty Zombie",
    [86076978383613] = "Hunty Zombie",
    [79546208627805] = "99 Nights",
    [126509999114328] = "99 Nights"
}

local function detectGame()
    local currentGameId = game.PlaceId
    local gameName = SUPPORTED_GAMES[currentGameId]
    
    if gameName then
        notif:Notification("AXS","Game is Supported\nLoading Script","Code","Cartoon",3)
        print("Supported Game Detected: " .. gameName .. " (ID: " .. currentGameId .. ")")
        return true, gameName
    else
        notif:Notification("AXS","Game is Not\nSupported!","Code","Cartoon",3)
        warn("Unsupported Game Detected (ID: " .. currentGameId .. ")")
        
        pcall(function()
            local marketplaceService = game:GetService("MarketplaceService")
            local gameInfo = marketplaceService:GetProductInfo(currentGameId)
        end)
        
        task.wait(0.5)
        game.Players.LocalPlayer:Kick("Game Not Supported")
        
        return false, nil
    end
end

local isGameSupported, supportedGameName = detectGame()

if not isGameSupported then
    return
end

if supportedGameName == "Build a plane" then
    notif:Notification("AXS","Script loading Game:\nBuild a plane.","Code","Cartoon",3)
    
    local scriptSuccess, scriptError = pcall(function()
        loadstring(game:HttpGet("https://pastefy.app/15Oy22u6/raw"))()
    end)
    
    if not scriptSuccess then
        notif:Notification("AXS","Failed to load\nscript!","Code","Cartoon",3)
    end

elseif supportedGameName == "Hunty Zombie" then
    notif:Notification("AXS","Script Loading Game:\nHunty Zombie.\nPlease be patient","Code","Cartoon",5)
    
    local scriptSuccess, scriptError = pcall(function()
        loadstring(game:HttpGet("https://pastefy.app/0B65q8Ob/raw"))()
    end)
    
    if not scriptSuccess then
        notif:Notification("AXS","Failed to load\ngame script!","Code","Cartoon",3)
    end
elseif supportedGameName == "99 Nights" then
    notif:Notification("AXS","Script Loading Game:\n99 Nights\nin the forest.\nPlease be patient","Code","Cartoon",5)
    
    local scriptSuccess, scriptError = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AXS-Main/AXS-Script/refs/heads/main/AXS-HUB/99/Nights/in/the/Forest/Loader3"))()
    end)
    
    if not scriptSuccess then
        notif:Notification("AXS","Failed to load\ngame script!","Code","Cartoon",3)
    end
end
