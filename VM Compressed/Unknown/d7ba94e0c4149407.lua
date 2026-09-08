getgenv().Init = getgenv().Init or {}
local Init = getgenv().Init

local Repo = "https://raw.githubusercontent.com/JustSomeGuest/Scripts/main/"

local function GetScript(URL)
    return loadstring(game:HttpGet(URL))()
end

pcall(function()
    GetScript(Repo .. "Universal/PlayerController.lua")
end)

--// Universal
function Init.PolariaRM()
    GetScript(Repo .. "Universal/PolariaRM/Init.lua")
end

function Init.Shiftlock()
    GetScript(Repo .. "Universal/Shiftlock/Init.lua")
end

function Init.WallyWest()
    GetScript(Repo .. "Universal/WallyWest/Init.lua")
end

function Init.DeltaKD()
    GetScript(Repo .. "Universal/DeltaKD.lua")
end

function Init.SoundDock()
    GetScript(Repo .. "Universal/SoundDock.lua")
end

--// Game-specific
function Init.CombatGUI()
    GetScript(Repo .. "Game-specific/CombatGUI/Init.lua")
end

function Init.NebulaHub()
    GetScript(Repo .. "Game-specific/NebulaHub/Init.lua")
end

return Init
