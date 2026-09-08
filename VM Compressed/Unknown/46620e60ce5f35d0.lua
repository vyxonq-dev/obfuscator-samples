--[[
__   __ _____  _______   _ 
\ \ / // __  \|___  / | | |
 \ V / `' / /'   / /| | | |
 /   \   / /    / / | | | |
/ /^\ \./ /___./ /__| |_| |
\/   \/\_____/\_____/\___/
]]

repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character
if not game:IsLoaded() then
    game.Loaded:Wait()
end
print("Supported game!")
local creatorId = game.CreatorId
local communityCreators = {
    [35102746] = 'https://api.luarmor.net/files/v3/loaders/91c92d3c217d524123cd466ca83c4f16.lua', -- Fish It
    [7381705] = 'https://api.luarmor.net/files/v3/loaders/6bc668603e3c93919387e564af72fd88.lua', -- Fisch
    [6042520] = 'https://api.luarmor.net/files/v3/loaders/57d0844789542ad8f7cae069edaf352e.lua', -- 99 Nights
    [34869880] = 'https://api.luarmor.net/files/v3/loaders/a6271160c4b4adca2aa3744e705e07ee.lua', -- Plants vs Brainrot
    [8818124] = 'https://api.luarmor.net/files/v3/loaders/49a49c2667090f88ed7589c2c00c9d31.lua', -- Violance District
    [35489258] = 'https://api.luarmor.net/files/v3/loaders/15bb11b765765655a7bdfc10bbbe5d13.lua', -- The Forge
}

if communityCreators[creatorId] then 
    print("game supported! Loading script...")
    loadstring(game:HttpGet(communityCreators[creatorId]))()
else
    warn("Unsupported game.")
end






