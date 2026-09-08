if (not game:IsLoaded()) then game.Loaded:Wait() end

local gameid = game.PlaceId
local HttpService = game:GetService("HttpService")
local PlacesData = game:HttpGet("https://raw.githubusercontent.com/Bovanlaarhoven/Primordial/main/src/places.json")
local Places = HttpService:JSONDecode(PlacesData)
local getconnections = debug.getconnections
local DisableConnection = {ScriptContext, LogService}

for _, v in pairs(DisableConnection) do
    for _, v in pairs(getconnections(v.Error)) do
        v:Disable()
    end
    for _, v in pairs(getconnections(v.MessageOut)) do
        v:Disable()
    end
end

local supported = false

for placeName, placeIds in pairs(Places) do
    print("Checking place:", placeName)
    for _, id in ipairs(placeIds) do
        print("Comparing IDs: ", id, gameid)
        if tonumber(id) == gameid then
            print("Match found!")
            supported = true
            break
        end
    end
    if supported then
        break
    end
end

if not isfolder("Primordial") then
    makefolder("Primordial")
end

if supported then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bovanlaarhoven/Primordial/main/src/main.lua"))()
else
    game:GetService("Players").LocalPlayer:Kick(gameid .. " is not supported by Primordial.")
end
