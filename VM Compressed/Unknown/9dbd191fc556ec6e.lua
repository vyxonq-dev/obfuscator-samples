local StarterGui = game:GetService("StarterGui")


local gameScripts = {
    [7498898979]     = "https://raw.githubusercontent.com/Midas93939/Midas-Hub/refs/heads/main/Burgerz.lua", -- Added your new ID
    [9098443082]      = "https://raw.githubusercontent.com/Midas93939/Midas-Hub/refs/heads/main/Dive.lua"
}


local function notify(title, text)
    local success = false
    local retryCount = 0
    
    repeat
        success = pcall(function()
            StarterGui:SetCore("SendNotification", {
                Title = title;
                Text = text;
                Duration = 7;
            })
        end)
        if not success then 
            task.wait(0.5) 
            retryCount = retryCount + 1
        end
    until success or retryCount > 10
end

local currentPlaceId = game.PlaceId
local currentUniverseId = game.GameId

local scriptToLoad = gameScripts[currentPlaceId] or gameScripts[currentUniverseId]

if scriptToLoad then
    notify("System", "Supported Game Detected! Loading...")
    
    local success, result = pcall(function()
        return loadstring(game:HttpGet(scriptToLoad))()
    end)

    if not success then
        
        
    end
else
    
    notify("Not Configured", "Place: " .. tostring(currentPlaceId) .. " | Uni: " .. tostring(currentUniverseId))
end
