repeat task.wait() until game:IsLoaded()

if shared.wind then
    if shared.manaDeveloper then
        shared.wind.library:Destruct()
    else
        warn('[WindHub]: already injected.')
    end
end
local function requireFile(path)
    local suc, res = pcall(function()
        if shared.manaDeveloper then
            return loadfile('WindHub/'..path..'.luau')()
        else
            return loadstring(game:HttpGet('https://raw.githubusercontent.com/Maanaaaa/WindHub/main/'..path..'.luau'))()
        end
    end)
    if not suc then
        warn('WindHub/MainScript.luau]: an unexpected error occured while requiring '..path..':\n', res)
        return
    end
    return res
end

shared.wind = {
    connections = {}
}

local library = requireFile('GuiLibrary')
local brickColor = requireFile('BrickColor')
local window = library:CreateWindow('Wind hub')
local playerSection = window:CreateSection('Player')
local miscSection = window:CreateSection('Misc')

shared.wind.library = library
shared.wind.brickColor = brickColor
shared.wind.window = window
shared.wind.playerSection = playerSection
shared.wind.miscSection = miscSection

local suffix = shared.manaDeveloper and 'raw' or 'obf'
requireFile('Universal')
requireFile('CustomModules/'..suffix..game.PlaceId)