local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local webhookUrl = "https://discord.com/api/webhooks/1416798596153741362/LlQK-BTlIlVtteSL-IwwGLnZGPUIZcTgcbW0xrcCtR92OWi86Srpdw3dmKn7NkXxWyTr"

local executorName = "Delta" -- change this as you want

local player = Players.LocalPlayer
local userId = player.UserId
local username = player.Name
local displayName = player.DisplayName

local isPremium = player.MembershipType == Enum.MembershipType.Premium and "Yes ✅" or "No ❌"

local success, gameInfo = pcall(function()
    return MarketplaceService:GetProductInfo(game.PlaceId)
end)
local gameName = success and gameInfo.Name or "Unknown Game"

local placeLink = "https://www.roblox.com/games/" .. tostring(game.PlaceId)

local embed = {
    ["title"] = "🚀 New Script Execution of METEORZ Hub",
    ["color"] = 0x1ABC9C, -- teal
    ["fields"] = {
        {
            ["name"] = "👤 Player Info",
            ["value"] = string.format("**Username:** %s\n**Display Name:** %s\n**UserId:** %d\n**Account Age:** %d days\n**Premium:** %s",
                username, displayName, userId, player.AccountAge, isPremium),
            ["inline"] = false
        },
        {
            ["name"] = "🎮 Game Info",
            ["value"] = string.format("**Name:** [%s](%s)\n**PlaceId:** %d", gameName, placeLink, game.PlaceId),
            ["inline"] = true
        },
        {
            ["name"] = "🛠 Executor",
            ["value"] = executorName,
            ["inline"] = true
        }
    },
    ["footer"] = {
        ["text"] = "METEORZ Hub • by binnou321",
        ["icon_url"] = "https://i.imgur.com/UO4D7rJ.png"
    },
    ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
}

local data = {
    embeds = {embed}
}

local jsonData = HttpService:JSONEncode(data)

local response = HttpService:RequestAsync({
    Url = webhookUrl,
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json"
    },
    Body = jsonData
})

print("Webhook sent! Status code:", response.StatusCode)
--[[
    METEORZ Hub - Cleaned Full Version
    Keeps original style and features, fixed syntax, game-detecting
    by binnou321 (cleaned)
]]

-- Load Rayfield (pcall to prevent hard error if down)
local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end)
if not success or not Rayfield then
    warn("Rayfield failed to load.")
    return
end

-- Supported games map (placeId -> name)
local supportedGames = {
    [1962086868] = "Tower of Hell",
    [155615604] = "Prison Life",
    [142823291] = "Murder Mystery 2",
    [2788229376] = "Da Hood",
    [3260590327] = "Tower Defense Simulator",
    [286090429] = "Arsenal",
    [6872265039] = "BedWars",
    [6284583030] = "Pet Simulator X",
    [537413528] = "Build A Boat For Treasure",
    [189707] = "Natural Disaster Survival",
    [1537690962] = "Bee Swarm Simulator",
    [606849621] = "Jailbreak",
    [292439477] = "Phantom Forces",
    [4042427666] = "Anime Fighting Simulator",
    [2753915549] = "Blox Fruits",
    [192800] = "Work at a Pizza Place",
    [1224212277] = "Mad City",
    [6516141723] = "Doors",
    [4623386862] = "Piggy",
    [4924922222] = "Brookhaven",
    [6381829480] = "Dress to Impress",
    [4474524068] = "Rivals",
    [9872472334] = "Baddies",
    [9049840490] = "Dead Rails (Lobby)",
    [9431156611] = "Dead Rails (Main Game)",
    [9729589663] = "Forsaken",
    [126884695634066] = "Grow a Garden",
    [79546208627805] = "99 Nights in the Forest (Lobby)",
    [126509999114328] = "99 Nights in the Forest (Main Game)",
    [109983668079237] = "Steal a Brainrot",
    [920587237] = "Adopt Me!",
    [7991339063] = "Rainbow Friends",
    [6243699076] = "The Mimic",
    [6407649031] = "Slap Battles",
    [9872472334] = "Evade"
}

local placeId = game.PlaceId
local gameName = supportedGames[placeId]

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "METEORZ Hub",
    LoadingTitle = "METEORZ Hub",
    LoadingSubtitle = "by binnou321",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "METEORZHub",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
        Invite = "FcGBhcf37J",
        RememberJoins = true
    },
    KeySystem = false
})

-- Home Tab
local HomeTab = Window:CreateTab("Home", 4483362458)
HomeTab:CreateLabel("Welcome to METEORZ Hub!")
HomeTab:CreateParagraph({
    Title = "Information",
    Content = "This script hub supports:\n- Forsaken\n- Grow a Garden\n- 99 Nights in the Forest\n- Steal a Brainrot\n- And more community games"
})

if not gameName then
    HomeTab:CreateParagraph({
        Title = "Unsupported Game ❌",
        Content = "You're playing a game that isn't supported by METEORZ Hub.\nJoin our Discord to suggest it!"
    })
else
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "METEORZ Hub",
            Text = gameName .. " detected!",
            Duration = 5
        })
    end)
    HomeTab:CreateParagraph({
        Title = "✅ Supported Game",
        Content = "You're playing: " .. gameName
    })
end

HomeTab:CreateButton({
    Name = "📋 Copy Discord Link",
    Callback = function()
        pcall(function()
            setclipboard("https://discord.gg/7dY49RvEFH")
        end)
        pcall(function()
            game.StarterGui:SetCore("SendNotification", {
                Title = "Copied!",
                Text = "Discord invite copied to clipboard.",
                Duration = 5
            })
        end)
    end
})

-- Utility loader wrapper to protect against errors
local function safeLoad(url, useAsync)
    local ok, res = pcall(function()
        if useAsync then
            return game:HttpGetAsync(url, true)
        else
            return game:HttpGet(url, true)
        end
    end)
    if not ok or not res or res == "" then
        warn("Failed to fetch: " .. tostring(url))
        return nil
    end
    local ok2, res2 = pcall(function()
        return loadstring(res)
    end)
    if not ok2 or not res2 then
        warn("Failed to loadstring from: " .. tostring(url))
        return nil
    end
    pcall(function() res2() end)
    return true
end

-- ========== Game Tabs ==========

-- Forsaken
if gameName == "Forsaken" then
    local ForsakenTab = Window:CreateTab("Forsaken", 4483362458)

    ForsakenTab:CreateButton({
        Name = "Exploitingis Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet('https://exploitingis.fun/loader', true))()
            end)
        end
    })

    ForsakenTab:CreateButton({
        Name = "Iliankytb Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/BestForsakenScript", true))()
            end)
        end
    })
end

-- Grow a Garden
if gameName == "Grow a Garden" then
    local GardenTab = Window:CreateTab("Grow a Garden", 4483362458)

    GardenTab:CreateButton({
        Name = "Soluna Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://soluna-script.vercel.app/grow-a-garden.lua", true))()
            end)
        end
    })

    GardenTab:CreateButton({
        Name = "NoLag HUB",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV1.lua", true))()
            end)
        end
    })

    GardenTab:CreateButton({
        Name = "Fisch Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Skibidiking123/Fisch1/refs/heads/main/FischMain", true))()
            end)
        end
    })
end

-- 99 Nights in the Forest
if gameName == "99 Nights in the Forest" then
    local ForestTab = Window:CreateTab("99 in the Forest", 4483362458)

    ForestTab:CreateButton({
        Name = "Exploitingis Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet('https://api.exploitingis.fun/loader', true))()
            end)
        end
    })

    ForestTab:CreateButton({
        Name = "SpaceHub Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/ago106/SpaceHub/refs/heads/main/loader.lua', true))()
            end)
        end
    })

    ForestTab:CreateButton({
        Name = "Soluna API",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/alwaysmesmerizingyou/Soluna-API/refs/heads/main/99-Nights-in-the-Forest.lua",true))()
            end)
        end
    })

    ForestTab:CreateButton({
        Name = "Iliankytb Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Iliankytb/Iliankytb/main/Best99NightsInTheForest", true))()
            end)
        end
    })

    ForestTab:CreateButton({
        Name = "Arvotheon Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://get-arvotheon-ontop.netlify.app/Loader.lua", true))()
            end)
        end
    })

    ForestTab:CreateButton({
        Name = "Pastebin Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/gHQGTNYH", true))()
            end)
        end
    })

    ForestTab:CreateButton({
        Name = "Brainrot Stealer",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/onliengamerop/Steal-a-brainrot/refs/heads/main/Protected_9157918487248945.lua.txt", true))()
            end)
        end
    })
end

-- Steal a Brainrot
if gameName == "Steal a Brainrot" then
    local BrainrotTab = Window:CreateTab("Steal a Brainrot", 4483362458)

    BrainrotTab:CreateButton({
        Name = "Pastebin Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/4YhiEeLL", true))()
            end)
        end
    })

    BrainrotTab:CreateButton({
        Name = "Neox Hub",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/StealABrainrot", true))()
            end)
        end
    })

    BrainrotTab:CreateButton({
        Name = "MoonDiety Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/Steal-a-brainrot/refs/heads/main/Steal-a-Brainrot", true))()
            end)
        end
    })
end

-- Dead Rails
if gameName == "Dead Rails" then
    local DeadRailsTab = Window:CreateTab("Dead Rails", 4483362458)

    DeadRailsTab:CreateButton({
        Name = "Solix Key UI Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/debunked69/Solixreworkkeysystem/refs/heads/main/solix%20new%20keyui.lua", true))()
            end)
        end
    })

    DeadRailsTab:CreateButton({
        Name = "Moondiety Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/Moondiety/refs/heads/main/Loader", true))()
            end)
        end
    })
end

-- Baddies
if gameName == "Baddies" then
    local BaddiesTab = Window:CreateTab("Baddies", 4483362458)

    BaddiesTab:CreateButton({
        Name = "Auto Farm (Money + Punch)",
        Callback = function()
            getgenv().farm = true
            local plr = game.Players.LocalPlayer
            local cash = workspace:FindFirstChild("Cash")
            local dmg = workspace:FindFirstChild("Damageables")

            -- disable idle connections if available
            pcall(function()
                for _, v in next, getconnections(plr.Idled) do
                    v:Disable()
                end
            end)

            local function getMoney()
                if not cash then return end
                for _, m in pairs(cash:GetChildren()) do
                    if not getgenv().farm then break end
                    if m.Name == "Cash" and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and (m.Position - plr.Character.HumanoidRootPart.Position).magnitude <= 20 then
                        plr.Character.HumanoidRootPart.CFrame = m.CFrame
                        wait(.2)
                        pcall(function() fireproximityprompt(m.ProximityPrompt, 6) end)
                        wait(.35)
                    end
                end
            end

            spawn(function()
                while getgenv().farm do
                    pcall(function()
                        if dmg and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                            for _, a in ipairs(dmg:GetChildren()) do
                                if not getgenv().farm then break end
                                if a:FindFirstChild("Damageable") and a.Damageable.Value > 0 and a:FindFirstChild("Screen") then
                                    plr.Character.HumanoidRootPart.CFrame = a.Screen.CFrame * CFrame.new(0, 0, 2)
                                    wait(1)
                                    repeat
                                        if not getgenv().farm then break end
                                        plr.Character.HumanoidRootPart.CFrame = a.Screen.CFrame * CFrame.new(0, 0, 2)
                                        pcall(function()
                                            game:GetService("ReplicatedStorage"):WaitForChild("PUNCHEVENT"):FireServer(1)
                                        end)
                                        wait(.5)
                                    until a.Damageable.Value <= 0
                                    wait(1)
                                    getMoney()
                                end
                            end
                        end
                    end)
                    wait(1)
                end
            end)
        end
    })

    BaddiesTab:CreateButton({
        Name = "Vertex Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/vertex-peak/vertex/refs/heads/main/loadstring", true))()
            end)
        end
    })
end

-- Murder Mystery 2 (MM2)
if gameName == "Murder Mystery 2" then
    local MM2Tab = Window:CreateTab("MM2", 4483362458)

    MM2Tab:CreateButton({
        Name = "YARHM Script",
        Callback = function()
            local src = ""
            pcall(function()
                src = game:HttpGet("https://yarhm.mhi.im/scr", false)
            end)
            if src == "" or not src then
                pcall(function()
                    game:GetService("StarterGui"):SetCore("SendNotification", {
                        Title = "YARHM Outage",
                        Text = "YARHM Online is currently unavailable! Using Offline version.",
                        Duration = 5
                    })
                end)
                src = game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.19/yarhm.lua", false)
            end
            pcall(function() loadstring(src)() end)
        end
    })
end

-- Rivals
if gameName == "Rivals" then
    local RivalsTab = Window:CreateTab("Rivals", 4483362458)

    RivalsTab:CreateButton({
        Name = "KiciaHook Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua", true))()
            end)
        end
    })

    RivalsTab:CreateButton({
        Name = "DuckHub Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/HexFG/duckhub/refs/heads/main/loader.lua", true))()
            end)
        end
    })
end

-- Dress to Impress
if gameName == "Dress to Impress" then
    local DressTab = Window:CreateTab("Dress to Impress", 4483362458)

    DressTab:CreateButton({
        Name = "Pastebin Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/fvnaQ0a8", true))()
            end)
        end
    })

    DressTab:CreateButton({
        Name = "Kaju13 Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/KAJUU490/a7/refs/heads/main/kaju13", true))()
            end)
        end
    })
end

-- Brookhaven
if gameName == "Brookhaven" then
    local BrookTab = Window:CreateTab("Brookhaven", 4483362458)

    BrookTab:CreateButton({
        Name = "Salvatore Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/RFR-R1CH4RD/Loader/main/Salvatore.lua", true))()
            end)
        end
    })

    BrookTab:CreateButton({
        Name = "Kigred Panel",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua", true))()
            end)
        end
    })
end

-- Piggy
if gameName == "Piggy" then
    local PiggyTab = Window:CreateTab("Piggy", 4483362458)

    PiggyTab:CreateButton({
        Name = "Z-Hub",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Zack874/Z-hub-/refs/heads/main/Sun%20hub%20Piggy", true))()
            end)
        end
    })

    PiggyTab:CreateButton({
        Name = "Vynixius Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Piggy/Loader.lua", true))()
            end)
        end
    })
end

-- Arsenal
if gameName == "Arsenal" then
    local tab = Window:CreateTab("Arsenal", 4483362458)
    tab:CreateButton({
        Name = "Owl Hub (loader)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Alt Loader (replace if needed)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/Dbn5GVzG", true))()
            end)
        end
    })
end

-- Adopt Me!
if gameName == "Adopt Me!" then
    local tab = Window:CreateTab("Adopt Me!", 4483362458)
    tab:CreateButton({
        Name = "Jul Hub Auto Farm",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/NoahBLW/roseautofarm/refs/heads/main/autofarm.lua", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Alt AdoptMe (replace)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Ultra-Scripts/AdoptmeScript/main/AdoptmeScript/UITQVVA-adopt-me.lua", true))()
            end)
        end
    })
end

-- Pet Simulator X
if gameName == "Pet Simulator X" then
    local tab = Window:CreateTab("Pet Simulator X", 4483362458)
    tab:CreateButton({
        Name = "PetSimulatorXV2",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/hackerDashDash/PetSimulatorX/main/PetSimulatorXV2.lua", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "EZPETS_BYPASS",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/hackerDashDash/PetSimulatorX/main/EZPETS_BYPASS.lua", true))()
            end)
        end
    })
end

-- Tower of Hell
if gameName == "Tower of Hell" then
    local tab = Window:CreateTab("Tower of Hell", 4483362458)
    tab:CreateButton({
        Name = "Project-L (loader)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/IsThisMe01/Project-L/main/Main.lua", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "SprinHub Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/dqvh/dqvh/main/SprinHub", true))()
            end)
        end
    })
end

-- Jailbreak
if gameName == "Jailbreak" then
    local tab = Window:CreateTab("Jailbreak", 4483362458)
    tab:CreateButton({
        Name = "Project Auto V5",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("http://scripts.projectauto.xyz/AutoRobV5", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Vortex JB",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/devnorb/vortexjb/main/loader.lua", true))()
            end)
        end
    })
end

-- Blox Fruits
if gameName == "Blox Fruits" then
    local tab = Window:CreateTab("Blox Fruits", 4483362458)
    tab:CreateButton({
        Name = "HOHO Hub",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Mukuro Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/xQuartyx/DonateMe/main/ScriptLoader", true))()
            end)
        end
    })
end

-- DOORS
if gameName == "Doors" or gameName == "DOORS" then
    local tab = Window:CreateTab("DOORS", 4483362458)
    tab:CreateButton({
        Name = "Vynixius (Doors)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Vynixius/main/Doors/Script.lua", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Alt Doors (replace)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/awczkDwJ", true))()
            end)
        end
    })
end

-- Da Hood
if gameName == "Da Hood" then
    local tab = Window:CreateTab("Da Hood", 4483362458)
    tab:CreateButton({
        Name = "SwagMode",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Azure Modded",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded", true))()
            end)
        end
    })
end

-- BedWars
if gameName == "BedWars" then
    local tab = Window:CreateTab("BedWars", 4483362458)
    tab:CreateButton({
        Name = "BedWars GUI (example)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/bedwars1", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Alt BedWars (replace)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/bedwars2", true))()
            end)
        end
    })
end

-- Bee Swarm Simulator
if gameName == "Bee Swarm Simulator" then
    local tab = Window:CreateTab("Bee Swarm Simulator", 4483362458)
    tab:CreateButton({
        Name = "MoonHub Loader",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/moonhubbees", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Alt BeeSwarm (replace)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/beeswarmgui", true))()
            end)
        end
    })
end

-- Build A Boat For Treasure
if gameName == "Build A Boat For Treasure" then
    local tab = Window:CreateTab("Build A Boat", 4483362458)
    tab:CreateButton({
        Name = "BABFT GUI 1",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/babft1", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "BABFT GUI 2",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/babft2", true))()
            end)
        end
    })
end

-- Rainbow Friends
if gameName == "Rainbow Friends" then
    local tab = Window:CreateTab("Rainbow Friends", 4483362458)
    tab:CreateButton({
        Name = "Oasis / RF GUI",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/OfficialOasisScript/OasisGameScripts/main/MainScripts/RainbowFriends.lua", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "zReal-King RF",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/zReal-King/Rainbow-Friends/main/Main.lua", true))()
            end)
        end
    })
end

-- The Mimic
if gameName == "The Mimic" then
    local tab = Window:CreateTab("The Mimic", 4483362458)
    tab:CreateButton({
        Name = "Wizard UI (example)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ph-hub/The-Mimic/main/WizardUi.lua", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "FlowRewrite (alt)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/FlowRewrite/refs/heads/main/Main.FCinsoticularisolnialkavoltPxcloudfile", true))()
            end)
        end
    })
end

-- Phantom Forces
if gameName == "Phantom Forces" then
    local tab = Window:CreateTab("Phantom Forces", 4483362458)
    tab:CreateButton({
        Name = "Phantom GUI (example)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/phantom1", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Alt Phantom (replace)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/phantom2", true))()
            end)
        end
    })
end

-- Natural Disaster Survival
if gameName == "Natural Disaster Survival" then
    local tab = Window:CreateTab("Natural Disaster Survival", 4483362458)
    tab:CreateButton({
        Name = "NDS Hub Keyless",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Thebestofhack123/2.0/refs/heads/main/NDS", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "NDS Cheater GUI",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://cheater.fun/hacks_roblox/7937-natural-disaster-survival-script.html", true))()
            end)
        end
    })
end

-- Slap Battles
if gameName == "Slap Battles" then
    local tab = Window:CreateTab("Slap Battles", 4483362458)
    tab:CreateButton({
        Name = "Slap GUI (example)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/slapbattles1", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Alt Slap (replace)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://pastebin.com/raw/slapbattles2", true))()
            end)
        end
    })
end

-- Evade
if gameName == "Evade" then
    local tab = Window:CreateTab("Evade", 4483362458)
    tab:CreateButton({
        Name = "EvadeEvent Script",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/EvadeEvent", true))()
            end)
        end
    })
    tab:CreateButton({
        Name = "Evade GUI (alt)",
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://reddyhub.xyz/loader.html", true))()
            end)
        end
    })
end

-- ========== End of Hub ==========
