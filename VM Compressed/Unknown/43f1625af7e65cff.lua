-- Docs 
-- https://github.com/sarahsophiesee-bot/SakuraUI/blob/main/README.md

local Sakura = loadstring(game:HttpGet("https://cdn.jnkie.com/SakuraUI.lua"))()

Sakura.Appearance = {
    Title = "Sakura",
    Subtitle = "Enter your key to bloom",
    Tagline = "where petals fall, magic follows",
    Icon = "rbxassetid://116255434488074",
    IconSize = UDim2.fromOffset(30, 30),
}

Sakura.Links.Discord = "discord.gg/jnkie"
Sakura.Storage.FileName = "Jnkie_key"
-- Sakura.Options.KeylessUi = "true"

Sakura.Shop = {
    Enabled = true,
    Icon = "",
    Title = "Get Premium",
    Subtitle = "Instant delivery • 24/7 support",
    ButtonText = "Buy",
    Link = "jnkie.com"
}


-- Check Key Verification status
local keyStatus = Sakura:LaunchJunkie({
    Service = "linkvert",
    Identifier = "1154930",
    Provider = "linkvertise"
})

-- Supervisor Logic: If Key is Valid, check Game ID and load script
if keyStatus == true then
    if game.PlaceId == 78515283254292 then
        loadstring(game:HttpGet("https://www.getcerberus.com/free-loader.lua"))()
    elseif game.PlaceId == 128784467030899 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/infinixhot10snfc24-ctrl/Noname/refs/heads/main/Merge%20a%20Nuke!(os).lua"))()
    elseif game.PlaceId == 116223724643557 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/najzgaming/Magic-Evo-nan/refs/heads/main/IME.lua"))()
    elseif game.PlaceId == 84575720768520 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joustingmatch/OuroborosLoader/refs/heads/main/Loader"))()
    elseif game.PlaceId == 99702578544768 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/BEAFISHBAIT"))()
    elseif game.PlaceId == 140302982046391 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joustingmatch/Ouroboros/main/loader.lua"))()
    elseif game.PlaceId == 115681808123944 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/refs/heads/main/ThrowaCoin"))()
    elseif game.PlaceId == 16472538603 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/NightToDark/Another-one/refs/heads/main/gta3"))()
    elseif game.PlaceId == 137233438285284 then
        loadstring(game:HttpGet("https://raw.soteria.rip/4b48534945715241"))()
    elseif game.PlaceId == 134381727982611 then
        loadstring(game:HttpGet("https://raw.soteria.rip/754662524f6b736b"))()
    elseif game.PlaceId == 96988868492490 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexFayr/Grow-Anything/refs/heads/main/ObpGrowScript.lua"))()
    elseif game.PlaceId == 83645629621104 then
        loadstring(game:HttpGet("https://naikoexploit.vercel.app/ForsakenPlus"))()
    elseif game.PlaceId == 6918802270 then
        loadstring(game:HttpGet("https://gist.githubusercontent.com/angeryy-tvy/c748ffb9f7810d3f4eff9a0d0b0bcdb4/raw/HazeSeas-Vxeze-Main"))()
    elseif game.PlaceId == 84515722934860 then
        getgenv().Intro = true -- UI Intro
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/22610179dddca088d4b716baa0f413a1.lua"))()
    elseif game.PlaceId == 128736949265057 then
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/030c18901831a9df3ddf3b8bce0bf9cb.lua"))()
    elseif game.PlaceId == 88921463361464 or game.PlaceId == 120697797916670 or game.PlaceId == 93044798454681 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IndraT99/RobloxScript/refs/heads/main/deadly.lua"))()
    elseif game.PlaceId == 121864768012064 or game.PlaceId == 97598239454123 then
        -- Grow a Garden 2
        if isfile and isfile("d:/RobloxScript/active/gag2indra.lua") then
            loadstring(readfile("d:/RobloxScript/active/gag2indra.lua"))()
        else
            warn("IndraHub: Grow a Garden 2 script not found!")
        end
    elseif game.PlaceId == 79546208627805 then
        loadstring(game:HttpGet("https://nexus-script.vercel.app/99-Nights-in-the-Forest.lua"))()
    elseif game.PlaceId == 9872472334 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IndraT99/RobloxScript/refs/heads/main/evadenew.lua"))()
    elseif game.PlaceId == 3351674303 then
        loadstring(game:HttpGet("https://aaroncheats.com/loader"))()
    elseif game.PlaceId == 286090429 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EndOverdosing/Soluna-API/refs/heads/main/arsenal.lua",true))()
    elseif game.PlaceId == 74193805629461 then
        loadstring(game:HttpGet("https://pastefy.app/yxi5etOh/raw"))()
    elseif game.PlaceId == 125927821145949 then
        loadstring(game:HttpGet("https://pastebin.com/raw/z8KgbT9H"))()
    elseif game.PlaceId == 6516141723 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/Doors/refs/heads/main/wwsp.lua"))()
    elseif game.PlaceId == 107095834793267 then
        loadstring(game:HttpGet("https://pastefy.app/TFtvDfLE/raw"))()
    elseif game.PlaceId == 115822424270425 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/forkT3/SCX-Hub/main/SCX-hub-Loader.lua"))()
    elseif game.PlaceId == 138381251771774 then
        loadstring(game:HttpGet("https://api.getlunarisx.win/loader.lua"))()
    elseif game.PlaceId == 103854444055060 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/n0namevnnek-web/Silent-Assassin/refs/heads/main/Key.lua"))()
    elseif game.PlaceId == 132016691802922 then
        loadstring(game:HttpGet("https://pastefy.app/zqkIDEKT/raw"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Fluxyyy333/HoshiOnTop/main/loader.lua"))()
    end
else
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Invalid Key 🛡️\n\nPlease use the official Key System.")
    end
end

-- Obfuscation in progress...