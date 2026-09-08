local WingsUI = loadstring(game:HttpGet("https://wings.ac/api/uploads/scripts/loader-ui.lua"))()

local skipLoader = false
local ffaPlaceIds = { }

if table.find(ffaPlaceIds, game.PlaceId) then
    skipLoader = true
    warn("[wings]: FFA mode detected - Loader skipped.")
end

local supported = {
    ['Wave'] = true,
    ['Zenith'] = true,
    ['Volcano'] = true,
    ['Hydrogen'] = true,
    ['Macsploit'] = true,
    ['Seliware'] = true,
    ['Potassium'] = true,
    ['Volt'] = true,
    ['ChocoSploit'] = true,
    ['Bunni'] = true,
    ['Delta'] = true,
    ['Velocity'] = true,
}

local ids = {
    {
        display = 'Rivals',
        uuid = '0dcb55226cdc9c555276db48ae35021f', 
        noKeySystem = false,
        find = {
            universe = 6035872082,
        }
    },
    {
        display = 'The Forge',
        uuid = '34c43d39431b1d16b9934f1122fd6f02',
        noKeySystem = false,
        find = {
            place = { 76558904092080, 129009554587176, 131884594917121, 74414241680540 }
        },
    },
    {
        display = 'Fish It!',
        uuid = 'b65dd9431e917a54cc84ed933242a95c',
        noKeySystem = false,
        find = {
            universe = 6701277882
        }
    },
    {
        display = 'Fisch',
        uuid = 'f1e4e99ff97a9037ec469416c3333172',
        noKeySystem = false,
        find = {
            name = 'fisch',
            universe = 5750914919
        }
    },
    {
        display = 'Bladeball',
        uuid = '84e73992ee9941f4b72b86e5dba480b1',
        noKeySystem = false,
        find = {
            universe = 4777817887
        }
    },
    {
        display = '99NightsInTheForest',
        uuid = 'b30874ef2f12c7c6afbf7e13d7df9dfb',
        noKeySystem = false,
        find = {
            universe = 7326934954
        }
    },
    {
        display = 'SoloHunters',
        uuid = '1fe793e95bf15cfe8c7c3bc59a6a11e2',
        noKeySystem = false,
        find = {
            universe = 7394964165
        }
    },
    {
        display = 'Abyss',
        uuid = '2b194e478b4b7eb00dfedd3f9bf7f8eb',
        noKeySystem = false,
        find = {
            universe = 8144728961
        }
    },
    {
        display = 'SailorPiece',
        uuid = 'ea92e4d603f9dd1e4101c992e264ac62',
        noKeySystem = false,
        find = {
            universe = 9186719164
        }
    },
    {
        display = 'BeALuckyBlock',
        uuid = '464edc00f3537f36f21c5096b53a27bb',
        noKeySystem = false,
        find = {
            universe = 9787206684
        }
    },
        {
        display = 'BeABrainrot',
        uuid = 'e4202410f94251f869b3e802eecf5380',
        noKeySystem = false,
        find = {
            universe = 9875383684
        }
    },
        {
        display = 'UltimateGymGame',
        uuid = '29b59594602b2eed288aa706082c5077',
        noKeySystem = false,
        find = {
            universe = 10271723279
        }
    }
}

local name, version = identifyexecutor and identifyexecutor()
name, version = name or '?', version or '?'
local isSupported = not not supported[name]

if not isSupported then
    warn(string.format('⚠ This executor (%s) should be working, but if you experience issues, please contact support for help.', name))
end

local place, universe = game.PlaceId or 0, game.GameId or 0
local service = game:GetService('MarketplaceService')
local isMarket, market = pcall(service.GetProductInfo, service, place)

local parsed, currentScript = { }, nil

local function parse(this)
    if type(this) == 'number' then
        return { this }
    end
    return this
end

for _, scriptData in ids do
    parsed[_] = {
        uuid = scriptData.uuid,
        noKeySystem = scriptData.noKeySystem,
        find = {
            universe = parse(scriptData.find.universe) or { },
            place = parse(scriptData.find.place) or { },
            name = scriptData.find.name,
            fn = scriptData.find.fn
        }
    }
    parsed[_].display = scriptData.display or scriptData.find.name or scriptData.uuid or '?'
end

for _, data in pairs(parsed) do
    if type(data.fn) == 'function' then
        local success, status = pcall(data.fn, data)
        if success and status then
            currentScript = data
            break
        end
    end

    if table.find(data.find.universe, universe) then
        currentScript = data
        break
    end

    if table.find(data.find.place, place) then
        currentScript = data
        break
    end

    if isMarket and market and data.find.name then
        local marketName = market.Name:lower()
        local searchName = data.find.name:lower()
        if marketName:find(searchName) then
            currentScript = data
            break
        end
    end
end

if currentScript and (skipLoader or currentScript.noKeySystem) then
    warn(string.format("[wings]: Loader skipped for %s (FFA mode detected)", currentScript.display))
    local success, err = pcall(function()
        local baseURL = 'https://api.luarmor.net/files/v4/loaders'
        local url = string.format('%s/%s.lua', baseURL, currentScript.uuid)
        loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("[wings]: Failed to load script directly:", err)
    end
else
    if WingsUI and WingsUI.init then
        WingsUI.init(currentScript)
    else
        warn("[wings]: Failed to load UI module.")
    end
end