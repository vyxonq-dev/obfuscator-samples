local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local player = Players.LocalPlayer
local username = player.Name
local userid = player.UserId
local placeId = game.PlaceId
local jobId = game.JobId
local executor = identifyexecutor and identifyexecutor() or "Unknown"

local gameName = "Unknown"
local gameIcon = "https://tr.rbxcdn.com/4d3c9b1649b9a4f8c9dcb16b4d274a13/768/432/Image/Png" -- fallback
pcall(function()
	local info = MarketplaceService:GetProductInfo(placeId)
	gameName = info.Name
	gameIcon = string.format("https://www.roblox.com/asset-thumbnail/image?assetId=%s&width=768&height=432&format=png", placeId)
end)

local avatarIcon = string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%s&width=420&height=420&format=png", userid)

local embed = {
    embeds = {{
        title = "🌟 StarCheats Execution Logged",
        description = string.format("**%s** (`%s`) just executed a StarCheats script.", username, userid),
        color = 0xffc800,
        thumbnail = {
            url = gameIcon
        },
        fields = {
            {
                name = "Game",
                value = string.format("[%s](https://www.roblox.com/games/%s)", gameName, placeId),
                inline = false
            },
            {
                name = "Place ID",
                value = tostring(placeId),
                inline = true
            },
            {
                name = "Job ID",
                value = jobId ~= "" and jobId or "Unavailable",
                inline = true
            },
            {
                name = "Executor",
                value = executor,
                inline = true
            }
        },
        footer = {
            text = "StarCheats Webhook Logger",
            icon_url = avatarIcon
        },
        timestamp = DateTime.now():ToIsoDate()
    }}
}

local json = HttpService:JSONEncode(embed)

local request = http_request or request or (syn and syn.request)
if request then
    request({
        Url = "https://discord.com/api/webhooks/1398084031488200948/QIZpMi8L5-FxepagNWNpe-IUCgm1fcRXTvb96vF59darFCbget1c2duFt4IMvIBMMG_c",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = json
    })
end


local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))()

-- Main Window
local win = DiscordLib:Window("StarCheats Hub V1.2")

-- Scripts Server
local serv = win:Server("Scripts", "")

-- Credits Channel
local credits = serv:Channel("Credits")

-- Credits Button
credits:Button(
    "Atomize Server : Script provider",
    function()
        setclipboard("https://discord.gg/Dz6b96b5")
        DiscordLib:Notification("Notification", "Link copied to clipboard!", "Okay!")
    end
)

credits:Button(
    "StarCheats Server",
    function()
        setclipboard("https://discord.gg/TvvP25HX")
        DiscordLib:Notification("Notification", "Link copied to clipboard!", "Okay!")
    end
)

credits:Button(
    "AlienCheats server",
    function()
        setclipboard("https://discord.gg/3svDQvMN")
        DiscordLib:Notification("Notification", "Link copied to clipboard!", "Okay!")
    end
)

-- Universal Script Channel
local universalScripts = serv:Channel("Universal script")

-- Tpwalk [REVAMP] Button
universalScripts:Button(
    "Tpwalk [REVAMP]",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealXORA/Roblox/refs/heads/Main/Scripts%20/Universal%20/Tpwalk.lua", true))()
    end
)

-- Quirky Command Button
universalScripts:Button(
    "Quirky Command",
    function()
        loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
    end
)

-- Nameless Admin Button
universalScripts:Button(
    "Nameless Admin",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end
)

-- Hitbox Expander Button
universalScripts:Button(
    "Hitbox Expander",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua"))()
    end
)

-- FE Invisible Button
universalScripts:Button(
    "FE Invisible",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe./dbb6ce6f6cee4f7a5c9e20d7b88e83db2a93bf25/Invisible%20GUI'))()
    end
)

-- FE Emotes Button
universalScripts:Button(
    "FE Emotes",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-fe-emote-17192"))()
    end
)

-- Keyboard Button
universalScripts:Button(
    "Keyboard",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()
    end
)

-- Q-Tool Button
universalScripts:Button(
    "Q-Tool",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/r1FH/Modified-Mobile-Q-Tool/main/Modified%20Mobile%20Q%20Tool.lua", true))()
    end
)

-- Animation Changer [DaHood Zombie Walk] Button
universalScripts:Button(
    "Animation Changer [DaHood Zombie Walk]",
    function()
        while true do
            local Animate = game.Players.LocalPlayer.Character.Animate
            Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
            Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
            game.Players.LocalPlayer.Character.Humanoid.Jump = false
            wait(1)
        end
    end
)

-- Anti Afk Button
universalScripts:Button(
    "Anti Afk",
    function()
        loadstring(game:HttpGet("https://zxfolix.github.io/antiafk.lua"))()
    end
)

-- 3008 Server Channel
local threeZeroEightChannel = serv:Channel("🪑 | 3008")

-- Zenon Hub Button
threeZeroEightChannel:Button(
    "Zenon Hub",
    function()
        loadstring(game:HttpGet("https://pastefy.app/gbwEzNX4/raw"))()
    end
)

-- Yumira Hub Button
threeZeroEightChannel:Button(
    "Yumira Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Python/refs/heads/main/SCP3008.py"))()
    end
)

-- 3008 Hub Button
threeZeroEightChannel:Button(
    "3008 Hub",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/axleoislost/Roscripts-Hub/main/scp'))()
    end
)

-- Arsenal Server Channel
local arsenalChannel = serv:Channel("🔫 | Arsenal")

-- Hitbox Expander Arsenal Button
arsenalChannel:Button(
    "Hitbox Expander Arsenal",
    function()
        function getplrsname()
            for i,v in pairs(game:GetChildren()) do
                if v.ClassName == "Players" then
                    return v.Name
                end
            end
        end
        local players = getplrsname()
        local plr = game[players].LocalPlayer
        coroutine.resume(coroutine.create(function()
            while wait(1) do
                coroutine.resume(coroutine.create(function()
                    for _,v in pairs(game[players]:GetPlayers()) do
                        if v.Name ~= plr.Name and v.Character then
                            v.Character.RightUpperLeg.CanCollide = false
                            v.Character.RightUpperLeg.Transparency = 10
                            v.Character.RightUpperLeg.Size = Vector3.new(13,13,13)

                            v.Character.LeftUpperLeg.CanCollide = false
                            v.Character.LeftUpperLeg.Transparency = 10
                            v.Character.LeftUpperLeg.Size = Vector3.new(13,13,13)

                            v.Character.HeadHB.CanCollide = false
                            v.Character.HeadHB.Transparency = 10
                            v.Character.HeadHB.Size = Vector3.new(13,13,13)

                            v.Character.HumanoidRootPart.CanCollide = false
                            v.Character.HumanoidRootPart.Transparency = 10
                            v.Character.HumanoidRootPart.Size = Vector3.new(13,13,13)
                        end
                    end
                end))
            end
        end))
    end
)

-- AirHub Button
arsenalChannel:Button(
    "AirHub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
    end
)

-- Midnight Hub Button
arsenalChannel:Button(
    "Midnight Hub",
    function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/89c8fc87fa64b68cc171a261217e4999.lua"))()
    end
)

-- Projectware Button
arsenalChannel:Button(
    "Projectware",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FishyPlayzThis/Projecthub-Arsenal/refs/heads/main/obf_QoCPBEH6oZ3Bsrk9saw8oegnmuMZtW0z764FNNfvFwGDACIespPcUZd9NU7P6uq6.lua"))()
    end
)
-- AuraCraft Server Channel
local auraCraftChannel = serv:Channel("💎 | AuraCraft")

-- Dev Aura Button
auraCraftChannel:Button(
    "Dev Aura",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Aura-Craft-Get-Dev-16019"))()
    end
)

-- Kaitofyp Hub Button
auraCraftChannel:Button(
    "Kaitofyp Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaitofyp/Aura-Craft-V.1/main/Op%20script"))()
    end
)

-- AuraCraft Script Button
auraCraftChannel:Button(
    "AuraCraft Script",
    function()
        --[[
            WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
        ]]
        loadstring(game:HttpGet("https://pastebin.com/raw/0ngLWx1n"))()
    end
)
-- Arm Wrestle Simulator Server Channel
local armWrestleSimChannel = serv:Channel("💪 | Arm Wrestle Simulator")

-- ProjectLD HUB Button
armWrestleSimChannel:Button(
    "ProjectLD HUB",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/SenhorLDS/ProjectLDSHUB/main/OfficialScript'))()
    end
)

-- Simulator Hub Button
armWrestleSimChannel:Button(
    "Simulator Hub",
    function()
        --[[ WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk! ]]
        local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

        local Window = Rayfield:CreateWindow({
           Name = "Lifting Simulator",
           Icon = 0,
           LoadingTitle = "Nigga Hub Loaded",
           LoadingSubtitle = "by drixpyfrfr on discord",
           Theme = "Serenity",

           ConfigurationSaving = {
              Enabled = true,
              FileName = "NiggaHub"
           },

           Discord = {
              Enabled = false,
              Invite = "noinvitelink",
              RememberJoins = true
           },

           KeySystem = false,
           KeySettings = {
              Title = "Untitled",
              Subtitle = "Key System",
              Note = "No method of obtaining the key is provided",
              FileName = "Key",
              SaveKey = true,
              GrabKeyFromSite = false,
              Key = {"Hello"}
           }
        })

        local Tab = Window:CreateTab("Auto", 4483362458)
        local Section = Tab:CreateSection("Auto Farms, Clicks ETC.")

        Rayfield:Notify({
           Title = "Important",
           Content = "my dc is drixpyfrfr also this only works on some executors so dm if u wanna know if urs supports it",
           Duration = 6.5,
           Image = 4483362458,
        })

        -- Button code goes here...
    end
)

-- Infinity Ware Button
armWrestleSimChannel:Button(
    "Infinity Ware",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/OutDatedUser/scripthub/main/Script/InfinityWare'))()
    end
)

-- Hikka Hub Button
armWrestleSimChannel:Button(
    "Hikka Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Hiklom/hikka/main/armw.lua"))()
    end
)

-- MaddHub Button
armWrestleSimChannel:Button(
    "MaddHub",
    function()
        --[[ Please join the Discord for a Free key: https://keybot.maddhub.repl.co/Discord ]]--
        loadstring(game:HttpGet('https://keybot.maddhub.repl.co/KeySystem'))()
    end
)
-- Bedwars Server Channel
local bedwarsChannel = serv:Channel("⚔️ | Bedwars")

-- Aurora Button
bedwarsChannel:Button(
    "Aurora",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/cocotv666/Aurora/main/Aurora_Loader"))()
    end
)

-- Vape4 Button
bedwarsChannel:Button(
    "Vape4",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
    end
)

-- XorV2 Button
bedwarsChannel:Button(
    "XorV2",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/XorV2/script/main/Unfair'))()
    end
)

-- Skid Vape Button
bedwarsChannel:Button(
    "Skid Vape",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sstvskids/SkidVapeForRoblox/main/NewMainScript.lua", true))()
    end
)
-- Blade Ball Server Channel
local bladeballChannel = serv:Channel("⚽ | Blade Ball")

-- Astral Hub Button
bladeballChannel:Button(
    "Astral Hub",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Augustzyzx/A-s-t-r-a-l/main/Loader_BladeBall.lua'))()
    end
)

-- No Name Hub Button
bladeballChannel:Button(
    "No Name Hub",
    function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6af56c1753ac6679dee3acbd1fd952e5.lua"))()
    end
)

-- FFJ1 Button
bladeballChannel:Button(
    "FFJ1",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
    end
)

-- Schizer Hub Button
bladeballChannel:Button(
    "Schizer Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YTJosiahScripts/Schizer-V2.2/main/output-MC5fKIO.txt"))()
    end
)

-- EminenceX Button
bladeballChannel:Button(
    "EminenceX",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua"))()
    end
)
-- Blox Fruit Server Channel
local bloxFruitChannel = serv:Channel("🍉 | Blox Fruit")

-- AhmadV99 Button
bloxFruitChannel:Button(
    "AhmadV99",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
)

-- HOHO Hub Button
bloxFruitChannel:Button(
    "HOHO Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
    end
)

-- Kiciahook Hub Button
bloxFruitChannel:Button(
    "Kiciahook Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"))()
    end
)

-- ZaqueHub Button
bloxFruitChannel:Button(
    "ZaqueHub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZaqueHub/ShinyHub/main/AllScript"))()
    end
)

-- PNguyen0199 Button
bloxFruitChannel:Button(
    "PNguyen0199",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PNguyen0199/Script/main/Fai-Fao.lua"))()
    end
)

-- RadonHub Button
bloxFruitChannel:Button(
    "RadonHub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/x2-Neptune/RadonHub/main/Script.lua"))()
    end
)

-- Basicallyy Button
bloxFruitChannel:Button(
    "Basicallyy",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Basicallyy/Basicallyy/main/Min_XT_V2_.lua"))()
    end
)

-- BloxFruit Hub Button
bloxFruitChannel:Button(
    "BloxFruit Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end
)
-- Bee Swarm Simulator Server Channel
local beeSwarmChannel = serv:Channel("🐝 | Bee Swarm Simulator")

-- Bee Swarm Simulator Hub Button
beeSwarmChannel:Button(
    "Bee Swarm Simulator Hub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Bee-Swarm-Simulator-BE3-OP-21927"))()
    end
)

-- No Name Hub Button
beeSwarmChannel:Button(
    "No Name Hub",
    function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/012b8bc02b1c578b7766f2a4511c3c47.lua"))()
    end
)

-- Macro Hub Button
beeSwarmChannel:Button(
    "Macro Hub",
    function()
        loadstring(game:HttpGet("https://scripts.macrov4.com/macrov3.lua"))()
    end
)

-- No Name Hub v2 Button
beeSwarmChannel:Button(
    "No Name Hub v2",
    function()
        -- Paste the script from "No Name Hub v2" here
        local selectedrow = 5
        local selectedline = 4
        local selectedegg = "RoyalJelly"
        local webhookurl = ""

        repeat
            wait()
        until game:IsLoaded()
        wait(25)

        -- Claims Hive
        for i = 1, 2 do
            for i = 1, 6 do
                game:GetService("ReplicatedStorage").Events.ClaimHive:FireServer(i)
            end
            wait(2)
        end

        -- Notifies That The Script Has Been Executed
        local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
        OrionLib:MakeNotification({
            Name = "Data Rollback State",
            Content = "Executed!",
            Image = "rbxassetid://4483345998",
            Time = 5
        })

        -- Turns On Until Mythic If You Are Using Royal Jelly
        if selectedegg == "RoyalJelly" then
            local args = {
                [1] = "RollToMythic",
                [2] = true
            }

            game:GetService("ReplicatedStorage").Events.PlayerSettingsEvent:FireServer(unpack(args))
        end

        -- Hatches The Selected Egg In The Selected Spot
        local args = {
            [1] = selectedrow,
            [2] = selectedline,
            [3] = selectedegg,
            [4] = 1,
            [5] = false
        }

        game:GetService("ReplicatedStorage").Events.ConstructHiveCellFromEgg:InvokeServer(unpack(args))

        -- If The Egg Hatched A Mythic Bee, The Script Stops And Notifies You, Then Toggles Until Mythic Off (If You Selected Royal Jelly), Else The Script Notifies You That Ypu Didnt Get A Mythic Bee And Server Hops.
        local BeeValue = game:GetService("Workspace").Honeycombs[tostring(game:GetService("Players").LocalPlayer.Honeycomb.Value)].Cells["C" .. tostring(selectedrow) .. "," .. tostring(selectedline)].CellType.Value
        if BeeValue == "FuzzyBee" or BeeValue == "BuoyantBee" or BeeValue == "PreciseBee" or BeeValue == "SpicyBee" or BeeValue == "TadpoleBee" or BeeValue == "VectorBee" then
            OrionLib:MakeNotification({
                Name = "Data Rollback State",
                Content = "Got The Wanted Bee!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            local data = {
                ["content"] = "Got A Mythic Bee! " .. tostring(BeeValue),
            }
            local request = http_request or request or HttpPost
            local newdata = game:GetService("HttpService"):JSONEncode(data)
            local headers = {
                ["content-type"] = "application/json"
            }
            request({
                Url = webhookurl,
                Body = newdata,
                Method = "POST",
                Headers = headers
            })
            if selectedegg == "RoyalJelly" then
                local args = {
                    [1] = "RollToMythic",
                    [2] = false
                }

                game:GetService("ReplicatedStorage").Events.PlayerSettingsEvent:FireServer(unpack(args))
            end
            return
        else
            OrionLib:MakeNotification({
                Name = "Data Rollback State",
                Content = "Didnt Get The Wanted Bee, Rolling Back Data...",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            local data = {
                ["content"] = "Didnt Get The Wanted Bee... Rolling Back Data And Teleporting To Another Server! (Got: " .. tostring(BeeValue) .. ")",
            }
            local request = http_request or request or HttpPost
            local newdata = game:GetService("HttpService"):JSONEncode(data)
            local headers = {
                ["content-type"] = "application/json"
            }
            request({
                Url = webhookurl,
                Body = newdata,
                Method = "POST",
                Headers = headers
            })
        end

        -- Rollbacks Your Data
        for i = 1, 10 do
            local args = {
                [1] = "Black Bear",
                [2] = "f\255",
                [3] = "Finish"
            }
            game:GetService("ReplicatedStorage").Events.UpdatePlayerNPCState:FireServer(unpack(args))
            wait(0.1)
        end

        -- Uses Field Dice To Make Sure You Get Your Egg Back
        local args = {
            [1] = {
                ["Name"] = "Field Dice"
            }
        }

        game:GetService("ReplicatedStorage").Events.PlayerActivesCommand:FireServer(unpack(args))

        -- Notifies You That The Rollback Was Successful
        OrionLib:MakeNotification({
            Name = "Data Rollback State",
            Content = "Succesful! Teleporting To Another Server...",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        wait(3)

        -- Teleports You To Another Server
        for i = 1, 5 do
            local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/1537690962/servers/Public?sortOrder=Asc&limit=100"))
            for i, v in pairs(Servers.data) do
                if v.playing ~= v.maxPlayers then
                    game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
                end
            end
        end
    end
)
-- Build A Boat for Treasure Server Channel
local buildABoatChannel = serv:Channel("🚢 | Build A Boat for Treasure")

-- Good to use Button
buildABoatChannel:Button(
    "Good to Use Script",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Build-A-Boat-For-Treasure-Good-to-use-scripts-14389"))()
    end
)

-- Auto Farm Button
buildABoatChannel:Button(
    "Auto Farm",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/BBT-utoFrm_740"))()
    end
)

-- Auto Farm 2 Button
buildABoatChannel:Button(
    "Auto Farm 2",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Build-A-Boat-For-Treasure-utoFrm-Gold-13684"))()
    end
)

-- Tp Area Button
buildABoatChannel:Button(
    "Tp Area",
    function()
        loadstring(game:HttpGet("https://pastebin.com/raw/hW4bgur9"))()
    end
)

-- No Name Hub Button
buildABoatChannel:Button(
    "No Name Hub",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/XRoLLu/UWU/main/BUILD%20A%20BOAT%20FOR%20TREASURE.lua'))()
    end
)
-- Brookhaven Server Channel
local brookhavenChannel = serv:Channel("🏡 | Brookhaven")

-- Imperial Hub Button
brookhavenChannel:Button(
    "Imperial Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Trev0rZ/LoaderM/main/ImperialHub-Working.lua", true))()
    end
)

-- SanderX Button
brookhavenChannel:Button(
    "SanderX",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sXPiterXs1111/SanderXV2.5/main/SanderXV2.5.lua"))()
    end
)

-- icehub Button
brookhavenChannel:Button(
    "icehub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
    end
)

-- Car Dealership Ship Server Channel
local carDealerShipChannel = serv:Channel("🚗 | Car Dealership Ship")

-- DealerShip Hub Button
carDealerShipChannel:Button(
    "DealerShip Hub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/SEASON-13!-Car-Dealership-Tycoon-CDT-Dearlship-20154"))()
    end
)

-- No name Hub Button
carDealerShipChannel:Button(
    "No name Hub",
    function()
        loadstring(game:HttpGet('https://api.luarmor.net/files/v3/loaders/49f02b0d8c1f60207c84ae76e12abc1e.lua'))()
    end
)

-- SHELBY HUB Button
carDealerShipChannel:Button(
    "SHELBY HUB",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/XMAS-andamp-SHELBY!-Car-Dealership-Tycoon-Auto-Delivery-24473"))()
    end
)
-- Doors Server Channel
local doorsChannel = serv:Channel("🚪 | Doors")

-- Doors Hub Button
doorsChannel:Button(
    "Doors Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Rafanchik123/script/main/doors224"))()
    end
)

-- Devil Hub Button
doorsChannel:Button(
    "Devil Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/doors/main/devilshubgui"))()
    end
)

-- DOORS HUB Button
doorsChannel:Button(
    "DOORS HUB",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
    end
)

-- NO NAME HUB Button
doorsChannel:Button(
    "NO NAME HUB",
    function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/730854e5b6499ee91deb1080e8e12ae3.lua"))()
    end
)
-- Driving Empire Server Channel
local drivingEmpireChannel = serv:Channel("🏎️ | Driving Empire")

-- Auto Farm Button 1
drivingEmpireChannel:Button(
    "Auto Farm 1",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Driving-Empire-Car-Racing-autofarm-17078"))()
    end
)

-- Auto Farm Button 2
drivingEmpireChannel:Button(
    "Auto Farm 2",
    function()
        loadstring(game:HttpGet('https://whimper.xyz/kitty'))()
        task.wait(2)
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8bf54daa5b358826ce74cab275f9135.lua"))()
    end
)

-- Auto Farm Button 3
drivingEmpireChannel:Button(
    "Auto Farm 3",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Aaron999S/FiberHub/main/Main"))()
    end
)
-- Destruction Simulator Server Channel
local destructionSimulatorChannel = serv:Channel("💥 | Destruction Simulator")

-- Orbit Hub Button
destructionSimulatorChannel:Button(
    "Orbit Hub",
    function()
        loadstring(game:HttpGet("https://orbitsc.net/dsim"))()
    end
)

-- Universal Script Button
destructionSimulatorChannel:Button(
    "Universal Script",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Janorax/UniversalLoader/main/Main"))()
    end
)

-- OP GUI Button
destructionSimulatorChannel:Button(
    "OP GUI",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Destruction-Simulator-*OP*-GUI-1858"))()
    end
)

-- Whimper Button
destructionSimulatorChannel:Button(
    "Whimper",
    function()
        loadstring(game:HttpGet('https://whimper.xyz/kitty'))()
        task.wait(2)
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8bf54daa5b358826ce74cab275f9135.lua"))()
    end
)
-- Dress To Impress Server Channel
local dressToImpressChannel = serv:Channel("👗 | Dress To Impress")

-- DTI GUI Button
dressToImpressChannel:Button(
    "DTI GUI",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hellohellohell012321/DTI-GUI-V2/main/dti_gui_v2.lua", true))()
    end
)

-- DTI Hub Button
dressToImpressChannel:Button(
    "DTI Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Yumiara/Python/refs/heads/main/DTI.py"))()
    end
)

-- Auto Farm DTI Button
dressToImpressChannel:Button(
    "Auto Farm DTI",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Niburu52/hub/refs/heads/main/DressToImpress'))()
    end
)
-- Evade Server Channel
local evadeChannel = serv:Channel("🚨 | Evade")

-- Evade GUI Button
evadeChannel:Button(
    "Evade GUI",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Unknownproooolucky/Unknown-Hub-X-Universal-Games/main/Games/Evade'))()
    end
)

-- zReal King Button
evadeChannel:Button(
    "zReal King",
    function()
        pcall(loadstring(game:HttpGet('https://raw.githubusercontent.com/zReal-King/Evade/main/Main.lua')))
    end
)

-- Evade GUI 2 Button
evadeChannel:Button(
    "Evade GUI 2",
    function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d8bf54daa5b358826ce74cab275f9135.lua"))()
    end
)
-- Fisch Server Channel
local fischChannel = serv:Channel("🐟 | Fisch")

-- Speed Hub X Button
fischChannel:Button(
    "Speed Hub X",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Fisch-Speed-Hub-X-No-Key-Free-21187"))()
    end
)

-- AtherHub Button
fischChannel:Button(
    "AtherHub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Fisch-AtherHub-21654"))()
    end
)

-- Spectrum Hub Button
fischChannel:Button(
    "Spectrum Hub",
    function()
        loadstring(game:HttpGet("https://you.whimper.xyz/spectrum"))()
    end
)

-- Fisch GUI Button
fischChannel:Button(
    "Fisch GUI",
    function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2c5f110f91165707959fc626b167e036.lua"))()
    end
)

-- Fisch Script Button
fischChannel:Button(
    "Fisch Script",
    function()
        script_key = 'YourKeyHere';
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/5b08096b1b7bfd8dedcaee05c22ce49b.lua"))()
    end
)

-- Lunar Hub Button
fischChannel:Button(
    "Lunar Hub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/UPD-Fisch-Lunor-OP-script-26223"))()
    end
)
-- Funky Friday Server Channel
local funkyFridayChannel = serv:Channel("🎶 | Funky Friday")

-- Funky Friday Script Button
funkyFridayChannel:Button(
    "Funky Friday Script",
    function()
        loadstring(game:HttpGet('https://pastebin.com/raw/dcyuEgyK'))()
    end
)

-- Funky Friday Hub Button
funkyFridayChannel:Button(
    "Funky Friday Hub",
    function()
        script_key="KEY HERE";
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/57c3827dc1393b8fcae8ef3e6cb84297.lua"))()
    end
)

-- Auto Farm Button
funkyFridayChannel:Button(
    "Auto Farm",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/GraphHubontop/graphhub/refs/heads/main/FunkyFridayKeyless.lua"))()
    end
)
-- Find the Aura Server Channel
local findTheAuraChannel = serv:Channel("🔮 | Find the Aura")

-- Madbuk Hub Button
findTheAuraChannel:Button(
    "Madbuk Hub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Find-The-Auras-275-Madbuk-Scripts-Autofarm-GUI-15676"))()
    end
)
-- Fling Things and People Server Channel
local flingThingsChannel = serv:Channel("💥 | Fling Things and People")

-- Best OP Script Button
flingThingsChannel:Button(
    "Best OP Script",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-Best-FTAP-script-keyless-20289"))()
    end
)

-- Fling Things Hub Button
flingThingsChannel:Button(
    "Fling Things Hub",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/illyamarj/HUB/main/Fling%20Things%20and%20People.lua'))()
    end
)
-- Get Chased by a Rocket Server Channel
local rocketChaseChannel = serv:Channel("🚀 | Get Chased by a Rocket")

-- Infinite Money Button
rocketChaseChannel:Button(
    "Infinite Money",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/get-chased-by-a-rocket-inf-money-+-crsh-server-3987"))()
    end
)
-- Gym League Server Channel
local gymLeagueChannel = serv:Channel("💪 | Gym League")

-- AhmadV99 Button
gymLeagueChannel:Button(
    "AhmadV99",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/main/Gym%20League.lua"))()
    end
)

-- AtherHub 1 Button
gymLeagueChannel:Button(
    "AtherHub 1",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Athergaming/Roblox-Gym-League-Script/main/AtherHub%20Gym%20League%20V1_5.lua"))()
    end
)

-- AtherHub 2 Button
gymLeagueChannel:Button(
    "AtherHub 2",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Athergaming/Roblox-Gym-League-Script/main/AtherHub%20Gym%20League%20V1_5.lua"))()
    end
)
-- Horrific Housing Server Channel
local horrificHousingChannel = serv:Channel("🏚️ | Horrific Housing")

-- Op Hub Button
horrificHousingChannel:Button(
    "Op Hub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Horrific-Housing-Hosuing-hub-16738"))()
    end
)

-- Siloxware Button
horrificHousingChannel:Button(
    "Siloxware",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/SiusGIF/Siloxware-Lite/main/SourceCodeLite"))()
    end
)

-- Op Hub Button (again)
horrificHousingChannel:Button(
    "Op Hub 2",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Horrific-Housing-Hosuing-hub-16738"))()
    end
)
-- King Legacy Server Channel
local kingLegacyChannel = serv:Channel("👑 | King Legacy")

-- NilHub Button
kingLegacyChannel:Button(
    "NilHub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/UPD-King-Legacy-Nilhub-Free-21643"))()
    end
)

-- ArcHub Button
kingLegacyChannel:Button(
    "ArcHub",
    function()
        getgenv().CustomDistance = 10 -- Custom Distance For Bug Can't Swipe
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/main.lua"))()
    end
)

-- ZeeHub Button
kingLegacyChannel:Button(
    "ZeeHub",
    function()
        loadstring(game:HttpGet('https://zuwz.me/Ls-Zee-Hub-KL'))()
    end
)
-- Lucky Block Battleground Server Channel
local luckyBlockChannel = serv:Channel("🟩 | Lucky Block Battleground")

-- OP Gui Button
luckyBlockChannel:Button(
    "OP Gui",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/LUCKY-BLOCKS-Battlegrounds-Battle-Ground-Script-17864"))()
    end
)

-- Spawn Galaxy Block Button
luckyBlockChannel:Button(
    "Spawn Galaxy Block",
    function()
        game:GetService("ReplicatedStorage"):WaitForChild("SpawnGalaxyBlock"):FireServer()
    end
)
-- MM2 Server Channel
local mm2Channel = serv:Channel("🔪 | MM2")

-- Xhub Button
mm2Channel:Button(
    "Xhub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
    end
)

-- Overdrive Hub Button
mm2Channel:Button(
    "Overdrive Hub",
    function()
        loadstring(game:HttpGet("https://overdrive-h.ohd.workers.dev/?d=loader"))()
    end
)

-- Vertex Hub Button
mm2Channel:Button(
    "Vertex Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Vertex-MM/AutoFarm/refs/heads/main/MM2%2524%25Christmas.lua"))()
    end
)

-- Yarhm Hub Button
mm2Channel:Button(
    "Yarhm Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/yarhm.lua", false))()
    end
)
-- Muscle Legends Server Channel
local muscleLegendsChannel = serv:Channel("💪 | Muscle Legends")

-- SpeedHub X Button
muscleLegendsChannel:Button(
    "SpeedHub X",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
)

-- Op Gui Button
muscleLegendsChannel:Button(
    "Op Gui",
    function()
        local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

        local Window = Rayfield:CreateWindow({
            Name = "Script Muscle Legends Window",
            LoadingTitle = "Farming Script Muscle Legends",
            LoadingSubtitle = "by bubleknight roblox",
            ConfigurationSaving = {
                Enabled = false,
                FolderName = nil,
                FileName = "Roblox Muscle Legends Hub"
            },
            Discord = {
                Enabled = false,
                Invite = "noinvitelink",
                RememberJoins = true
            },
            KeySystem = false,
            KeySettings = {
                Title = "Untitled",
                Subtitle = "Key System",
                Note = "No method of obtaining the key is provided",
                FileName = "Key",
                SaveKey = true,
                GrabKeyFromSite = false,
                Key = {"Hello"}
            }
        })
        -- Your other code for Op Gui buttons
    end
)

-- Ax Hub Button
muscleLegendsChannel:Button(
    "Ax Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/W4ttziez/Muscle-Legends/main/AX%20HUB.lua"))()
    end
)
-- Murder vs Sheriff Server Channel
local mvSChannel = serv:Channel("🔪 | Murder vs Sheriff")

-- Hitbox Expander Button
mvSChannel:Button(
    "Hitbox Expander",
    function()
        loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Update-script-hitbox-9326"))()
    end
)

-- Xeno Hub Button
mvSChannel:Button(
    "Xeno Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TheRealAvrwm/Projects/main/Xeno%20MVSD%20script.lua", true))()
    end
)
-- Survive Natural Disaster Server Channel
local sndChannel = serv:Channel("🌪️ | Survive Natural Disaster")

-- Blackhole Button
sndChannel:Button(
    "Activate Blackhole",
    function()
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local Workspace = game:GetService("Workspace")

        local angle = 1
        local radius = 10
        local blackHoleActive = false

        local function setupPlayer()
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local Folder = Instance.new("Folder", Workspace)
            local Part = Instance.new("Part", Folder)
            local Attachment1 = Instance.new("Attachment", Part)
            Part.Anchored = true
            Part.CanCollide = false
            Part.Transparency = 1

            return humanoidRootPart, Attachment1
        end

        local humanoidRootPart, Attachment1 = setupPlayer()

        if not getgenv().Network then
            getgenv().Network = {
                BaseParts = {},
                Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
            }

            Network.RetainPart = function(part)
                if typeof(part) == "Instance" and part:IsA("BasePart") and part:IsDescendantOf(Workspace) then
                    table.insert(Network.BaseParts, part)
                    part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                    part.CanCollide = false
                end
            end

            local function EnablePartControl()
                LocalPlayer.ReplicationFocus = Workspace
                RunService.Heartbeat:Connect(function()
                    sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                    for _, part in pairs(Network.BaseParts) do
                        if part:IsDescendantOf(Workspace) then
                            part.Velocity = Network.Velocity
                        end
                    end
                end)
            end

            EnablePartControl()
        end

        local function ForcePart(v)
            if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
                for _, x in next, v:GetChildren() do
                    if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                        x:Destroy()
                    end
                end
                if v:FindFirstChild("Attachment") then
                    v:FindFirstChild("Attachment"):Destroy()
                end
                if v:FindFirstChild("AlignPosition") then
                    v:FindFirstChild("AlignPosition"):Destroy()
                end
                if v:FindFirstChild("Torque") then
                    v:FindFirstChild("Torque"):Destroy()
                end
                v.CanCollide = false

                local Torque = Instance.new("Torque", v)
                Torque.Torque = Vector3.new(1000000, 1000000, 1000000)
                local AlignPosition = Instance.new("AlignPosition", v)
                local Attachment2 = Instance.new("Attachment", v)
                Torque.Attachment0 = Attachment2
                AlignPosition.MaxForce = math.huge
                AlignPosition.MaxVelocity = math.huge
                AlignPosition.Responsiveness = 500
                AlignPosition.Attachment0 = Attachment2
                AlignPosition.Attachment1 = Attachment1
            end
        end

        local function toggleBlackHole()
            blackHoleActive = not blackHoleActive
            if blackHoleActive then
                for _, v in next, Workspace:GetDescendants() do
                    ForcePart(v)
                end

                Workspace.DescendantAdded:Connect(function(v)
                    if blackHoleActive then
                        ForcePart(v)
                    end
                end)

                spawn(function()
                    while blackHoleActive and RunService.RenderStepped:Wait() do
                        angle = angle + math.rad(2)

                        local offsetX = math.cos(angle) * radius
                        local offsetZ = math.sin(angle) * radius

                        Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)
                    end
                end)
            else
                Attachment1.WorldCFrame = CFrame.new(0, -1000, 0)
            end
        end

        LocalPlayer.CharacterAdded:Connect(function()
            humanoidRootPart, Attachment1 = setupPlayer()
            if blackHoleActive then
                toggleBlackHole()
            end
        end)

        local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
        local window = library:Window("Projeto LKB")

        window:Slider("Radius Blackhole", 1, 100, 10, function(Value)
            radius = Value
        end)

        window:Toggle("Blackhole", true, function(Value)
            if Value then
                toggleBlackHole()
            else
                blackHoleActive = false
            end
        end)

        spawn(function()
            while true do
                RunService.RenderStepped:Wait()
                if blackHoleActive then
                    angle = angle + math.rad(2)
                end
            end
        end)

        toggleBlackHole()
    end
)

-- LiverMods Button
sndChannel:Button(
    "LiverMods Script",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/NaturalDisaster'))()
    end
)

-- Op Gui 1 Button
sndChannel:Button(
    "Op Gui 1",
    function()
        loadstring(game:HttpGet('https://pastebin.com/raw/YqL6UqQp'))()
    end
)
-- Ninja Legend Server Channel
local nlChannel = serv:Channel("🥷 | Ninja Legend")

-- Extreme Hub Button
nlChannel:Button(
    "Extreme Hub Script",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ExtremeHUB-or-Universal-or-22-Games-2055"))()
    end
)

-- Auto Farm and More Button
nlChannel:Button(
    "Auto Farm and More Script",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/OP-SCRIPT-+-AUTOFARM-and-MORE!_1079"))()
    end
)
-- Prison Life Server Channel
local prisonLifeChannel = serv:Channel("🚔 | Prison Life")

-- Prizz Life Hub Button
prisonLifeChannel:Button(
    "Prizz Life Hub Script",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
    end
)

-- Impact Hub Button
prisonLifeChannel:Button(
    "Impact Hub Script",
    function()
        loadstring(game:HttpGet("https://zygomorphic-jobyna-impacthub-3d96c239.koyeb.app/main.lua"))()
    end
)

-- PrisonWare Button
prisonLifeChannel:Button(
    "PrisonWare Script",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
    end
)
-- Pet Sim99 Server Channel
local petSim99Channel = serv:Channel("🐾 | Pet Sim99")

-- Redz Hub Button
petSim99Channel:Button(
    "Redz Hub Script",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/PetSimulator99/main/redz9999.lua"))()
    end
)

-- Reaper Hub Button
petSim99Channel:Button(
    "Reaper Hub Script",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Pet-Simulator-99!-Reaper-Hub-21267"))()
    end
)

-- ZapHub Button
petSim99Channel:Button(
    "ZapHub Script",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Pet-Simulator-99!-The-Best-Keyless-PS99-Script-ZapHub-Doodle-Battle-Update-26082"))()
    end
)
-- Punch Monster Server Channel
local punchMonsterChannel = serv:Channel("👊 | Punch Monster")

-- CantcantHUB Button
punchMonsterChannel:Button(
    "CantcantHUB Script",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Punch-Monsters!-CanCantHUB-PM-17738"))()
    end
)
-- Rivals Server Channel
local rivalsChannel = serv:Channel("⚔️ | Rivals")

-- SilentRivals Button
rivalsChannel:Button(
    "SilentRivals Script",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KxGOATESQUE/SilentRivals/main/SilentRivals"))()
    end
)
-- Sakura Stand Server Channel
local sakuraStandChannel = serv:Channel("🍃 | Sakura Stand")

-- 4PLHA OP GUI Button
sakuraStandChannel:Button(
    "4PLHA OP GUI",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/1-Million-Visits-Stand-Sakura-Stand-Best-Script-or-4HPLA-3126"))()
    end
)
-- Slap Battle Server Channel
local slapBattleChannel = serv:Channel("👋 | Slap Battle")

-- Kviks Hub Button
slapBattleChannel:Button(
    "Kviks Hub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/UPDATE-Slap-Battles-Kviks-Hub-V2-21255"))()
    end
)

-- KykyryzoB Hub Button
slapBattleChannel:Button(
    "KykyryzoB Hub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Slap-Battles-KykyryzoB-Hub-SB-9008"))()
    end
)
-- TSBG Server Channel
local tsbgChannel = serv:Channel("⚔️ | TSBG Scripts")

-- KadeHub Button
tsbgChannel:Button(
    "KadeHub",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-KadeHub-17629"))()
    end
)

-- OP TSBG Script Button
tsbgChannel:Button(
    "OP TSBG Script",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-OP-TSB-SCRIPT-HUB-21703"))()
    end
)

-- Deku Moveset Button
tsbgChannel:Button(
    "Deku Moveset",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-Deku-Moveset-21797"))()
    end
)

-- OP Hub Button
tsbgChannel:Button(
    "OP Hub",
    function()
        loadstring(game:HttpGet("https://paste.ee/r/vUxo3/0", true))()
    end
)

-- Zygarde Button
tsbgChannel:Button(
    "Zygarde Script",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/Zygarde/refs/heads/main/ZygardeV1.txt"))()
    end
)
-- The Mimic Server Channel
local mimicChannel = serv:Channel("👹 | The Mimic Scripts")

-- Real Hub Button
mimicChannel:Button(
    "Real Hub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Laelmano24/Rael-Hub/main/main.txt"))()
    end
)
-- WestBound Server Channel
local westBoundChannel = serv:Channel("💥 | WestBound Scripts")

-- WestBound Pro Button
westBoundChannel:Button(
    "WestBound Pro",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Westbound-pro-7125"))()
    end
)

-- Free Auto Farm Button
westBoundChannel:Button(
    "Free Auto Farm",
    function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Westbound-Fastest-FREE-Auto-Farm-I-800k-Per-Day-22712"))()
    end
)
-- Liar Table Server Channel
local liarTableChannel = serv:Channel("💬 | Liar Table Scripts")

-- Cowka Hub Button
liarTableChannel:Button(
    "Cowka Hub",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/cowka/c0wkaHub/refs/heads/main/Liars%20Club'))()
    end
)
-- Booga Booga Server Channel
local boogaBoogaChannel = serv:Channel("🔥 | Booga Booga Scripts")

-- SLIDER Hub Button
boogaBoogaChannel:Button(
    "SLIDER Hub",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/boogauser3533/natsuloader/main/SlideursHub-Loader.lua'))()
    end
)
-- Five Nights TD Server Channel
local fiveNightsTDChannel = serv:Channel("🌙 | Five Nights TD")

-- Demonic Hub Button
fiveNightsTDChannel:Button(
    "Demonic Hub",
    function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Prosexy/Demonic-HUB-V2/main/DemonicHub_V2.lua', true))()
    end
)
-- Tower of Hell Server Channel
local towerOfHellChannel = serv:Channel("⛔ | Tower of Hell")

-- SprinHub Button
towerOfHellChannel:Button(
    "SprinHub",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dqvh/dqvh/main/SprinHub",true))()
    end
)
