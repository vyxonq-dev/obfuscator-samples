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
    if game.PlaceId == 78515283254292 or game.PlaceId == 4111023553 then
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
        loadstring(game:HttpGet("https://pastefy.app/oy5fvq6F/raw"))()
    elseif game.PlaceId == 134381727982611 then
        loadstring(game:HttpGet("https://raw.soteria.rip/754662524f6b736b"))()
    elseif game.PlaceId == 96988868492490 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexFayr/Grow-Anything/refs/heads/main/ObpGrowScript.lua"))()
    elseif game.PlaceId == 83645629621104 then
        loadstring(game:HttpGet("https://ultcloudprotectsyourcode.netlify.app/s/4uSGlWEJ"))()
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
    elseif game.PlaceId == 72039880963188 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LunarielHub/Script-Lists/refs/heads/main/DrawSpace"))()
    elseif game.PlaceId == 16817315243 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SteamyHub/loader/refs/heads/main/steamy.lua"))()
    elseif game.PlaceId == 0000000000 then -- GANTI DENGAN GAME ID MMV
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VertexScript/MMV/refs/heads/main/Vertex.lua"))()
    elseif game.PlaceId == 112731528776884 then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/imshrak/knifeduels/refs/heads/main/menu'))()
    elseif game.PlaceId == 97463774278378 then
        loadstring(game:HttpGet("https://pastebin.com/raw/hrKhAj86"))()
    elseif game.PlaceId == 107653945083776 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joustingmatch/Ouroboros/main/loader.lua"))()
    elseif game.PlaceId == 99702578544768 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IndraT99/RobloxScript/refs/heads/main/beafish.lua"))()
    elseif game.PlaceId == 99108783264633 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IndraT99/RobloxScript/refs/heads/main/buildabase.lua"))()
    elseif game.PlaceId == 120766736586332 then
        loadstring(game:HttpGet("https://raw.soteria.rip/68476d4d65735574"))()
    elseif game.PlaceId == 92416421522960 then
        loadstring(game:HttpGet("https://pastefy.app/wCZx9TNX/raw"))()
    elseif game.PlaceId == 121474715335865 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Izonyaa/SoccerIzonya/refs/heads/main/izonyaa.lua"))()
    elseif game.PlaceId == 105241313130846 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/wowlolxd1/oneshot/refs/heads/main/OneShot.lua"))()
    elseif game.PlaceId == 118614517739521 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/slaman26/rsscripts/refs/heads/main/blindshot.lua"))()
    elseif game.PlaceId == 90148635862803 then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/nlzzpro/rscripts/refs/heads/main/SurviveTheApocalypse'))()
    elseif game.PlaceId == 98695134949589 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xuqor/follow/refs/heads/main/thx"))()
    elseif game.PlaceId == 119031147890918 or game.PlaceId == 75568173037446 or game.PlaceId == 83622406313819 or game.PlaceId == 80701570784699 game.PlaceId == 99108783264633 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/joustingmatch/Ouroboros/main/loader.lua"))()
    elseif game.PlaceId == 90568084448279 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/binx-ux/Match-ware/refs/heads/main/ONETAP"))()
    elseif game.PlaceId == 5991163185 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LunarielHub/Script-Lists/refs/heads/main/SprayPaint"))()
    elseif game.PlaceId == 82554996468034 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/6wp546y5jb-png/lol/refs/heads/main/Src"))()
    elseif game.PlaceId == 129279692364812 then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/anonymousmuship/WhyLookSkid/refs/heads/main/null_fixed.lua.txt"))()
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