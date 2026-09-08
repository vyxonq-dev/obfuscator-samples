local getgenv = getgenv
local game = cloneref(game)

if not game:IsLoaded() then
    game.Loaded:Wait()
end

if not getgenv().Config then
    getgenv().Config = {
        ["Enabled"] = true
    }
end

local GameIDS = {
    [74866348003583] = "Steal_a_Pet",
    [126195208568849] = "Super_League_Soccer",
    [12177325772] = "Super_League_Soccer",
    [101914543102200] = "Tap_Infinity"
}

local get_service = function(service_name)
    getgenv().Services = getgenv().Services or {}
    if not getgenv().Services[service_name] then
        getgenv().Services[service_name] = cloneref(game:GetService(service_name))
    end
    return getgenv().Services[service_name]
end

local gameName = GameIDS[game.PlaceId]

if gameName and getgenv().Config.Enabled then
    local url = "https://raw.githubusercontent.com/Sub2BK/Stratum/refs/heads/Scripts/" .. gameName .. ".lua"

    local success, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)

    if not success then
        warn("Loader failed for " .. gameName .. ". Reason: " .. tostring(err))
    end
else
    print("Loader: Game not supported or script is disabled.")
end
