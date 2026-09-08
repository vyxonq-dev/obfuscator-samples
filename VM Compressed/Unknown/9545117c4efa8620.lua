--bypass AntiCheat adonis
local getinfo = getinfo or debug.getinfo
local DEBUG = false
local Hooked = {}

local Detected, Kill

setthreadidentity(2)

for i, v in getgc(true) do
    if typeof(v) == "table" then
        local DetectFunc = rawget(v, "Detected")
        local KillFunc = rawget(v, "Kill")
    
        if typeof(DetectFunc) == "function" and not Detected then
            Detected = DetectFunc
            local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash)
                if Action ~= "_" then
                    if DEBUG then
                        warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)
                    end
                end
                return true
            end)
            table.insert(Hooked, Detected)
        end

        if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then
            Kill = KillFunc
            local Old; Old = hookfunction(Kill, function(Info)
                if DEBUG then
                    warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)
                end
            end)
            table.insert(Hooked, Kill)
        end
    end
end

local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
    local LevelOrFunc, Info = ...
    if Detected and LevelOrFunc == Detected then
        if DEBUG then
            warn(`zins | adonis bypassed`)
        end
        return coroutine.yield(coroutine.running())
    end
    return Old(...)
end))

setthreadidentity(7)

--script
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local mainTab = library:Window("Main")

_G.BlockRemote = true
_G.NoDmg = false
_G.AntiRagdoll = false

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local original
local namecallHook = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if _G.BlockRemote and typeof(self) == "Instance" then
        local success, name = pcall(function() return self.Name end)
        if success then
            if name == "DamagePlayerClient" and (method == "FireServer" or method == "fireServer") then
                args[1] = 0
                args[2] = false
                return original(self, unpack(args))
            elseif name == "Asynchronous" and (method == "FireServer" or method == "fireServer") then
                local action = args[1]
                if _G.NoDmg and (action == "HurtSelf" or action == "CharHit") then
                    return nil
                end
                if _G.AntiRagdoll and action == "UpdateRagdoll" and args[2] == true then
                    args[2] = false
                    return original(self, unpack(args))
                end
            end
        end
    end

    return original(self, ...)
end)

local function enableHook()
    if hookmetamethod then
        original = hookmetamethod(game, "__namecall", namecallHook)
    else
        local gm = getrawmetatable(game)
        original = gm.__namecall
        setreadonly(gm, false)
        gm.__namecall = namecallHook
        setreadonly(gm, true)
    end
end

enableHook()
RunService.Heartbeat:Connect(function() end)

--// Inf Stamina chuẩn
local aux = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Upbolt/Hydroxide/revision/ohaux.lua"))()

-- đúng path mới
local scriptPath = game:GetService("ReplicatedStorage").Resources.Client.MovementHandler.Stamina
local closureName = "stepDrain"
local closureConstants = {
    [1] = "MaxStamina",
    [2] = "CancelExpires",
    [3] = "reachedFull",
    [4] = "Fire",
    [5] = 0,
    [6] = "reachedZero"
}

-- lấy closure ở upvalue 5 và 7 (theo Hydroxide scan)
local closureA = aux.searchClosure(scriptPath, closureName, 5, closureConstants)
local closureB = aux.searchClosure(scriptPath, closureName, 7, closureConstants)

mainTab:Toggle("Inf Stamina", false, function(state)
    if closureA then
        debug.setupvalue(closureA, 5, state and 1e308 or 100)
    end
    if closureB then
        debug.getupvalue(closureB, 7)["MaxStamina"] = state and 1e308 or 100
    end
end)

mainTab:Toggle("No Damage(maybe)", false, function(state)
    _G.NoDmg = state
end)

mainTab:Toggle("Anti Ragdoll", false, function(state)
    _G.AntiRagdoll = state
end)

local emoteTab = library:Window("Free Emote")

local emoteNames = {
    "Birthday",
    "Boppin",
    "ByeByeBye",
    "Caramelldansen",
    "CatBath",
    "ChampionofLight",
    "Chess",
    "ChillSit",
    "ClassC14",
    "Cosmic",
    "CryingDance",
    "DancingDomino",
    "DieLit",
    "Doodle",
    "DoshBag",
    "DoshSpread",
    "FollowMe",
    "Ena",
    "Gacha",
    "GetDown",
    "Getaway",
    "Griddy",
    "HeatAttack",
    "Hug",
    "OneTwoThree",
    "Hyadain",
    "InternetYamero",
    "Jiggy",
    "KarateMan",
    "KillMeBaby",
    "KontonBoogie",
    "Kyoufuu",
    "LaidBackShuffle",
    "LasPlagas",
    "LethalCompany",
    "LiarDancer",
    "Lockstep",
    "LoveHate",
    "March",
    "Melancholy",
    "Mesmerizer",
    "Number",
    "OhNoes",
    "PartyHips",
    "PbjTime",
    "PoPiPo",
    "PointAt",
    "RestockIt",
    "Rin",
    "RollingStar",
    "SaiyanWalk",
    "Scary",
    "SewhStomp",
    "Shika",
    "SkeletonOrchestra",
    "SlenderJump",
    "Slick",
    "Smug",
    "Sneaky",
    "Static",
    "SuperJumpy",
    "Territory",
    "TuringLove",
    "WasntMe",
    "WhamWham",
    "WhatUWant",
    "WildSide",
    "Yoinky",
    "Yorokonde",
    "Logansbirthday"
}

local selectedEmote = emoteNames[1]
local Synchronous = game:GetService("ReplicatedStorage").Communication.EventObjects.Synchronous
local cancelBlocked = false
local hook = false

local function setupCancelHook()
    if hook then return end
    hook = true
    local old; old = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        local args = { ... }
        if cancelBlocked and self == Synchronous and method == "InvokeServer" and args[1] == "CancelEmote" then
            return nil
        end
        return old(self, ...)
    end)
end

emoteTab:Dropdown("Choose Emote", emoteNames, function(option)
    selectedEmote = option
end)

emoteTab:Toggle("Try Emote", false, function(state)
    if state then
        setupCancelHook()
        cancelBlocked = true
        Synchronous:InvokeServer("TryEmote", selectedEmote)
    else
        cancelBlocked = false
    end
end)

local CreditTab = library:Window("Credit")
CreditTab:Label("Credits: Cáo Mod", true)
CreditTab:Label("The script is open source", true)
CreditTab:Label("Pls support me by subscribe Cáo Mod", true)
