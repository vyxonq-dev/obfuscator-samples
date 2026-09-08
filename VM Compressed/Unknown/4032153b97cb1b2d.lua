local games={
    [6490954291]="ghoulre",
    [2880808628]="fireforce",
    [6424173306]="Wagarashi",
    [7314989375]="Hunters",
    [6931042565]="VolleyballLegends",
    [6331902150]="Forsaken",
    [994732206]="BloxFruits",
    [6504986360]="BubbleGumSimulator",
    [7436755782]="GrowaGarden",
    [7513130835]="UntitledDrillGame",
    [7095682825]="Beaks",
    [1202096104]="DrivingEmpire",
    [7018190066]="DeadRails",
    [113491250]="PhantomForces",
    [4777817887]="BladeBall",
    [7074860883]="AriseCrossover",
    [5750914919]="Fisch",
    [5569032992]="DandysWorld",
    [1390601379]="CombatWarriors",
    [1268927906]="MuscleLegends",
    [1119466531]="SpeedLegends",
    [3808223175]="JujustuInfinite",
    [7474367816]="ClimbandJumpTower",
}
local func
if games[game.GameId] then
    func=loadstring(game:HttpGet("https://you.whimper.xyz/sources/nox/"..games[game.GameId]..".lua"))
else
    return game:GetService("Players").LocalPlayer:Kick("This game is not supported.")
end


local type
    = type

local tablefind=table.find
local gethooked
function gethooked(real,hooks)
    local indexhook = hooks.__index
    local includes=hooks.includes
    local excludes=hooks.excludes
    local new = setmetatable({}, {
        __index = function(_, key)
            if indexhook and type(indexhook) == "function" then
                local result = indexhook(real, key)
                if result ~= nil then
                    return result
                end
            elseif indexhook then
                if indexhook[key] ~= nil then
                    return indexhook[key]
                end
            end
            local index=real[key]
            if type(index)=="function" then
                return function(_,...)
                    return index(real,...)
                end
            end
            if includes then
                if not tablefind(includes,key) then
                    return index
                end
            end
            if excludes then
                if tablefind(excludes,key) then
                    return index
                end
            end
            return tablefind({"userdata"},type(index)) and gethooked(index,hooks) or index
        end,
        __newindex = function(_, k, v)
            return error()
        end,
        __type=type(real),
        __mul=function()return error() end,
        __pow=function()return error() end,
        __iter=function()return end,
        __call=function()return error() end,
        __mod=function()return error() end,
        __unm=function()return error() end,
        __tostring=function()return tostring(real) end,
        __namecall=function() end,
        __add=function()return error() end,
        __div=function()return error() end,
        __le=function()return error() end,
        __sub=function()return error() end,
        __metatable = "The metatable is locked"
    })
    return new
end

local _game=game

local strfind=string.find
local hooktbl
hooktbl={
    __index = {
        HttpGet=function(_,Url,nocache)
            if strfind(Url,"NoxHubUI") then
                Url="https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"
            end
            return _game:HttpGet(Url,nocache)
        end
    },
    includes={
        
    },
    excludes=false
}
local fakegame=gethooked(game,hooktbl)
local env=getfenv(func)

env._G={}
env.game=fakegame
local _call3 = game:GetService("HttpService")
local _25msKey="25msWasHere :3"
env._G.__userKey =_25msKey
env.__userKey =_25msKey
makefolder("NoxHub")
writefile("NoxHub/key.txt", _25msKey)
local _call7 = _call3:GenerateGUID(false)
local time=os.time()
env._G._secondaryData = {
    userKey = _25msKey,
    timestamp = time,
    signature = _call3:UrlEncode(_call7 .. ":" .. time .. ":" .. _25msKey .. "YourSecretSecondaryToken"),
    nonce = _call7,
}
env._secondaryData=env._G._secondaryData
func()