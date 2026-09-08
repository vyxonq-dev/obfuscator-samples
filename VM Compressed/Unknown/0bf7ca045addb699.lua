--[[
    VoidHub -- point d'entree unique
    Genere automatiquement par voidhub-bridge, ne pas editer a la main.
    Build: 2026-09-06 21:19:29
]]

local UI_URL  = "https://raw.githubusercontent.com/csgo1compte-cloud/RayVoidUi/refs/heads/main/RayVoid"
local DISCORD = "discord.gg/ddu37DWPJn"

local MAP = {
	["4777817887"] = {{n="Blade-Ball",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Blade-Ball"}},
	["6035872082"] = {{n="RIVALS_skinChanger",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Rivals"},{n="RivalHack",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/RivalHack"}},
	["7488668004"] = {{n="Bake-or-Die",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Bake-or-Die"}},
	["8841437826"] = {{n="Capybaras-VS-Plants",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Capybaras-VS-Plants"}},
	["9330616906"] = {{n="BE-A-FISH-BAIT",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/BE-A-FISH-BAIT"}},
	["9348272796"] = {{n="Survive-Zombie-Arena",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Survive-Zombie-Arena"}},
	["9837325548"] = {{n="Car-Flipper",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Car-Flipper"}},
	["9837612476"] = {{n="Mini-War",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Mini-War"}},
	["9860573128"] = {{n="Break-For-Cars",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Break-For-Cars"}},
	["10039338037"] = {{n="Build-A-Ring-Farm",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Build-A-Ring-Farm"}},
	["10081292501"] = {{n="Bomb-Fishing",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Bomb-Fishing"}},
	["10198343402"] = {{n="Paint-Or-OOF",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/POF"}},
	["10199301628"] = {{n="MEN",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Merge-a-Nuke"}},
	["10209534490"] = {{n="Chicken-Farm",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Chicken-Farm"}},
	["10261267004"] = {{n="Storage-Hunters-Open-World",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Storage-Hunters-Open-World"}},
	["10290463156"] = {{n="[] Blow up Lucky Blocks For Cars",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/77084002576266.lua"}},
	["10336278580"] = {{n="Sell-Ores",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Sell-Ores"}},
	["10338952197"] = {{n="Grow-a-Chicken-Fighter",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Grow-a-Chicken-Fighter"}},
	["10406668651"] = {{n="Mine-a-Planet",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Mine-a-Planet"}},
	["10454554751"] = {{n="Unbox-ASMR",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Unbox-ASMR"}},
	["10504837200"] = {{n="Roll-An-Army",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Roll-An-Army"}},
	["10514280922"] = {{n="Roll-A-Gnome",u="https://raw.githubusercontent.com/femmehomme90-web/RayVoid_Scripts/main/Roll-A-Gnome"}},
}

-- ---------------------------------------------------------------------------

-- On route sur GameId (l'univers), pas sur PlaceId : il est identique dans
-- le lobby et toutes les places d'un meme jeu.
local gameId  = tostring(game.GameId)
local entries = MAP[gameId]

local function copyText(text)
    if setclipboard then
        pcall(setclipboard, text)
    end
end

local function runScript(url)
    local ok, src = pcall(function()
        return game:HttpGet(url)
    end)
    if not ok or type(src) ~= "string" or #src < 16 then
        warn("[VoidHub] download failed: " .. tostring(url))
        return false
    end
    local fn, err = loadstring(src)
    if not fn then
        warn("[VoidHub] compile failed: " .. tostring(err))
        return false
    end
    local ranOk, runErr = pcall(fn)
    if not ranOk then
        warn("[VoidHub] runtime error: " .. tostring(runErr))
        return false
    end
    return true
end

-- Chemin rapide : un seul script pour ce jeu, on charge sans passer par l'UI.
if entries and #entries == 1 then
    runScript(entries[1].u)
    return
end

-- A partir d'ici on a besoin de l'interface (selection ou jeu non supporte).
local okUi, Ui = pcall(function()
    return loadstring(game:HttpGet(UI_URL))()
end)
if not okUi or not Ui then
    warn("[VoidHub] UI failed to load")
    return
end

Ui:SetScriptName("VoidHub")

-- [ Plusieurs scripts pour ce jeu : selection ]
if entries and #entries > 1 then
    Ui:ShowCredit()

    local Window = Ui:CreateWindow({
        Name = "VoidHub",
        LoadingTitle = "VoidHub",
        LoadingSubtitle = "by AKkiwi",
        ConfigurationSaving = { Enabled = true, FolderName = "VoidHub", FileName = "hub" },
    })

    local Tab = Window:CreateTab("Scripts", "gamepad-2")

    Tab:CreateParagraph({
        Title = "Multiple scripts available",
        Content = tostring(#entries) .. " scripts exist for this game. Pick the one you want to load.",
    })

    for i = 1, #entries do
        local entry = entries[i]
        Tab:CreateButton({
            Name = "Load " .. entry.n,
            Callback = function()
                pcall(function() Ui:Destroy() end)
                task.wait(0.25)
                runScript(entry.u)
            end,
        })
    end

    return
end

-- [ Aucun script pour ce jeu : ecran minimal, redirection Discord uniquement ]
local Window = Ui:CreateWindow({
    Name = "VoidHub",
    LoadingTitle = "VoidHub",
    LoadingSubtitle = "by AKkiwi",
    ConfigurationSaving = { Enabled = true, FolderName = "VoidHub", FileName = "hub" },
})

local Info = Window:CreateTab("Not Supported", "bug")

Info:CreateParagraph({
    Title = "This script isn't supported",
    Content = "This game isn't supported. Join the Discord to see every available game.",
})

Info:CreateButton({
    Name = "Copy Discord invite",
    Callback = function()
        copyText(DISCORD)
        Ui:Notify({ Title = "Copied", Content = "Discord invite copied to clipboard.", Duration = 4 })
    end,
})
